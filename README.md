# Linux kernel

There are several guides for kernel developers and users. These guides can
be rendered in a number of formats, like HTML and PDF. Please read
Documentation/admin-guide/README.rst first.

In order to build the documentation, use ``make htmldocs`` or
``make pdfdocs``.  The formatted documentation can also be read online at:

    https://www.kernel.org/doc/html/latest/

There are various text files in the Documentation/ subdirectory,
several of them using the Restructured Text markup notation.

Please read the Documentation/process/changes.rst file, as it contains the
requirements for building and running the kernel, and information about
the problems which may result by upgrading your kernel.


# CMPE283 - Assignment 1 

- Step1: Identify the tables for the remaining 4 VMX configuration MSR's
- Step2: Create a struct for each MSR with the correct array siz and values
- Step3: Read each MSR and call the report_capability function for each with the corresponding parameters.

* The report_capability function is a generic function which takes the struct, length of the struct, lo and hi
as its parameter. It will print each capability of the given struct.

* The script/module required for this assignment is placed at https://github.com/akshay-sjsu-173/linux/blob/master/scripts/cmpe283-1.c
-  In order to execute this, perform the following steps:
    - Step1: Clone github repo or download the module.
    - Step2: Run the command "make"
    - Step 3: Run "sudo insmod cmpe283-1.ko". This will install the module.
    - Step 4: Run "dmesg" to check the output.

* Sample Output can be found at https://github.com/akshay-sjsu-173/linux/blob/master/typesOfControls.txt

# CMPE283 - Assignment 2

- PROCESS AND PROBLEMS FACED:
- Step1: Identify the functions which are responsible for handling VM Exits. I identified "vm_handle_exit" from vmx.c and "kvm_emulate_cpuid" as the two target functions.
  - vmx.c holds a map of all possible exits along with their corresponding exit handling function. Every time a VM exit occurs, the "vm_handle_exit" function is executed. This     function is responsible for delegating the handling of the exit to one of the handler functions as listed in the map.
  - The function that we are interested in for this assignment is the "kvm_emulate_cpuid" which is located in cpuid.c. We need to add a special handling of the leaf function       "0x4FFFFFFF".
- Step2: Setting up the inner VM caused me a lot of issues. I had the Ubuntu host setup correctly for assignment1. From my understanding, I thought I had to deploy a VM in the     host in order to test the VM exits. I installed VirtualBox for assignment1 itself. I started writing code to test functionality by adding some print statements but was unable   to get any results.
- Step3: The root cause was identified after considerable discussion with classmates closer to the assignment deadline. I found out that we needed to run a VM using qemu instead   of virtualbox. I still did not figure out why virtualbox did not work.
- Step4: Another error that I ran into for a long time was because I tried to build the "cpuid" module instead of rebuilding the "kvm" module.

- STEPS TO EMULATE ASSIGNMENT FUNCTIONALITY:
  - Clone the github repository.
  - Execute "cd linux"
  - Run the following commands to load the modules:
    1. rmmod kvm-intel;
    2. rmmod kvm;
    3. make M=arch/x86/kvm modules;
    4. insmod arch/x86/kvm/kvm.ko;
    5. insmod arch/x86/kvm/kvm-intel.ko;
  - Once the modules are loaded, start the inner VM using qemu. Run the following command:
    qemu-system-x86_64 -m 2048 -drive file=ubuntu.qcow,format=qcow2 -enable-kvm -smp 2,sockets=1,cores=1,threads=2 -d cpu_reset -no-fd=bootchk
  - The above command assumes that you have already created a disk with ubuntu installed before booting the machine.
  - Once the inner VM starts, you can either run your own custom program or simply execute the instruction "cpuid -l 0x4FFFFFFF". This command will invoke the particular leaf function.
  - Following scripts have been modified with correct comments in the code to successfully emulate the assignment functionality:
    - https://github.com/akshay-sjsu-173/linux/blob/master/arch/x86/kvm/vmx/vmx.c
    - https://github.com/akshay-sjsu-173/linux/blob/master/arch/x86/kvm/cpuid.c

- COMMENTS ON EXITS:
  - I encountered an arbitrary number of exits based on the time after VM boot that I execute the cpuid instruction in the inner VM.
  - These exits seem stable on executing cpuid multiple times. Number of exits as well as processing time increases linearly on repeated execution of the same exit instruction.
  - Approximately 10698556 exits are observed on a full VM boot with a processing time of 10407133753.
  
# CMPE283 - Assignment 3
- PROCESS AND PROBLEMS FACED:
  - The aim of this assignment was to create a new leaf function in "CPUID Emulation" code which takes exit number as input in ecx register.
  - The program must return the number of exits for the exit number which was passed as input.
  - The main task was to identify the number of exits listed in the Intel SDM and the exits supported by KVM.
  - SDM lists a total of 65 exit types. The exit numbers range from 0 to 68. Exits which are not listed in intel SDM are numbers 35,38,42 and 65.
  - Created a leaf function "0x4FFFFFFE" to handle the problem at hand.
  - Created a list of invalid exits and added the above-mentioned exits to this list. Another list of length 69 i.e. index ranging from 0 to 68 was created to maintain a count of all exits.
  - On execution of the leaf function, a check was run whether it is one of the exits not listed in SDM or is it an exit with number greater than 68. In case the number if greater than 68, it could be an exit supported by KVM but not listed in SDM.
  - In order to execute the leaf function, run teh following command: "cpuid -l 0x4FFFFFFE -s exitNumber"
  
- STEPS TO EMULATE THE ASSIGNMENT FUNCTIONALITY:
  - Follow the same steps as mentioned in Assignment 2.
  
- COMMENTS ON EXITS:
  - I encountered an arbitrary number of exits based on the time after VM boot that I execute the cpuid instruction in the inner VM.
  - These exits seem stable on executing cpuid multiple times. Number of exits as well as processing time increases linearly on repeated execution of the same exit instruction.
  - Approximately 10698556 exits are observed on a full VM boot with a processing time of 10407133753.
  - I observed that exit number 28 was the most frequent exit closely followed by exit number 30.
  - There were a lot of exits with a count of zero i.e. those exits had not occurred during the VM Boot.
  - Top exit counts:
    - Exit 28: 1071770
    - Exit 30: 958254
    - Exit 10: 541792
  - More details of all exits can be found at https://github.com/akshay-sjsu-173/linux/blob/master/withEPT.txt
  - Following scripts have been modified with correct comments in the code to successfully emulate the assignment functionality:
    - https://github.com/akshay-sjsu-173/linux/blob/master/arch/x86/kvm/vmx/vmx.c
    - https://github.com/akshay-sjsu-173/linux/blob/master/arch/x86/kvm/cpuid.c
    
# CMPE283 - Assignment 4

- There was no code change for this assignment but it included reloading the kvm_intel module with ept=0 i.e. by disabling ept and hence switching to shadow paging mode.
- The number of exits were expected to increase on the switch to shadow paging. This is because a switch to shadow paging will enable page fault exiting and will also cause more exits on CR3 faults and TLB flushes.
- This was observed in the output as the number of exits for most exit types increased exponentially.
- I have run a test code to check the number of exits for exit number 0 to 100.
- The expectation is that all exits after exit number 68 should be ignored along with a few exits which are not listed in SDM.
- The logs of these exits can be found in the following files.
  - Logs with EPT: https://github.com/akshay-sjsu-173/linux/blob/master/withEPT.txt
  - Logs without EPT: https://github.com/akshay-sjsu-173/linux/blob/master/withoutEPT.txt
