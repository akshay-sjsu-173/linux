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

* Sample Output is as follows:

<br>[  232.390822] CMPE 283 Assignment 1 Module Start
<br>[  232.390824] Pinbased Controls MSR: 0x7f00000016
<br>[  232.390826]   &nbsp;&nbsp;&nbsp;&nbsp; External Interrupt Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390827]   &nbsp;&nbsp;&nbsp;&nbsp; NMI Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390828]   &nbsp;&nbsp;&nbsp;&nbsp; Virtual NMIs: Can set=Yes, Can clear=Yes
<br>[  232.390830]   &nbsp;&nbsp;&nbsp;&nbsp; Activate VMX Preemption Timer: Can set=Yes, Can clear=Yes
<br>[  232.390831]   &nbsp;&nbsp;&nbsp;&nbsp; Process Posted Interrupts: Can set=No, Can clear=Yes
<br>[  232.390832] Procbased Controls MSR: 0xfff9fffe0401e172
<br>[  232.390834]   &nbsp;&nbsp;&nbsp;&nbsp; Interrupt-window Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390835]   &nbsp;&nbsp;&nbsp;&nbsp; Use TSC offsetting: Can set=Yes, Can clear=Yes
<br>[  232.390837]   &nbsp;&nbsp;&nbsp;&nbsp; HLT exiting: Can set=Yes, Can clear=Yes
<br>[  232.390838]   &nbsp;&nbsp;&nbsp;&nbsp; INVLPG exiting: Can set=Yes, Can clear=Yes
<br>[  232.390839]   &nbsp;&nbsp;&nbsp;&nbsp; MWAIT exiting: Can set=Yes, Can clear=Yes
<br>[  232.390841]   &nbsp;&nbsp;&nbsp;&nbsp; RDPMC exiting: Can set=Yes, Can clear=Yes
<br>[  232.390842]   &nbsp;&nbsp;&nbsp;&nbsp; RDTSC exiting: Can set=Yes, Can clear=Yes
<br>[  232.390844]   &nbsp;&nbsp;&nbsp;&nbsp; CR3-load exiting: Can set=Yes, Can clear=No
<br>[  232.390845]   &nbsp;&nbsp;&nbsp;&nbsp; CR3-store exiting: Can set=Yes, Can clear=No
<br>[  232.390846]   &nbsp;&nbsp;&nbsp;&nbsp; CR8-load exiting: Can set=Yes, Can clear=Yes
<br>[  232.390848]   &nbsp;&nbsp;&nbsp;&nbsp; CR8-store exiting: Can set=Yes, Can clear=Yes
<br>[  232.390849]   &nbsp;&nbsp;&nbsp;&nbsp; Use TPR shadow: Can set=Yes, Can clear=Yes
<br>[  232.390851]   &nbsp;&nbsp;&nbsp;&nbsp; NMI-window Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390852]   &nbsp;&nbsp;&nbsp;&nbsp; MOV-DR exiting: Can set=Yes, Can clear=Yes
<br>[  232.390854]   &nbsp;&nbsp;&nbsp;&nbsp; Unconditional I/O Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390855]   &nbsp;&nbsp;&nbsp;&nbsp; Use I/O bitmaps: Can set=Yes, Can clear=Yes
<br>[  232.390857]   &nbsp;&nbsp;&nbsp;&nbsp; Monitor trap flag: Can set=Yes, Can clear=Yes
<br>[  232.390858]   &nbsp;&nbsp;&nbsp;&nbsp; Use MSR bitmaps: Can set=Yes, Can clear=Yes
<br>[  232.390859]   &nbsp;&nbsp;&nbsp;&nbsp; MONITOR exiting: Can set=Yes, Can clear=Yes
<br>[  232.390861]   &nbsp;&nbsp;&nbsp;&nbsp; PAUSE exiting: Can set=Yes, Can clear=Yes
<br>[  232.390862]   &nbsp;&nbsp;&nbsp;&nbsp; Activate secondary controls: Can set=Yes, Can clear=Yes
<br>[  232.390864] Probased Controls2 MSR: 0x53cff00000000
<br>[  232.390865]   &nbsp;&nbsp;&nbsp;&nbsp; Virtualize APIC Accesses: Can set=Yes, Can clear=Yes
<br>[  232.390867]   &nbsp;&nbsp;&nbsp;&nbsp; Enable EPT: Can set=Yes, Can clear=Yes
<br>[  232.390868]   &nbsp;&nbsp;&nbsp;&nbsp; Descriptor-table Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390869]   &nbsp;&nbsp;&nbsp;&nbsp; Enable RDTSCP: Can set=Yes, Can clear=Yes
<br>[  232.390872]   &nbsp;&nbsp;&nbsp;&nbsp; Virtualize x2APIC mode: Can set=Yes, Can clear=Yes
<br>[  232.390874]   &nbsp;&nbsp;&nbsp;&nbsp; Enable VPID: Can set=Yes, Can clear=Yes
<br>[  232.390875]   &nbsp;&nbsp;&nbsp;&nbsp; WBINVD exiting: Can set=Yes, Can clear=Yes
<br>[  232.390877]   &nbsp;&nbsp;&nbsp;&nbsp; Unrestricted guest: Can set=Yes, Can clear=Yes
<br>[  232.390879]   &nbsp;&nbsp;&nbsp;&nbsp; APIC-register virtualization: Can set=No, Can clear=Yes
<br>[  232.390880]   &nbsp;&nbsp;&nbsp;&nbsp; Virtual-interrupt delivery: Can set=No, Can clear=Yes
<br>[  232.390882]   &nbsp;&nbsp;&nbsp;&nbsp; PAUSE-loop exiting: Can set=Yes, Can clear=Yes
<br>[  232.390883]   &nbsp;&nbsp;&nbsp;&nbsp; RDRAND exiting: Can set=Yes, Can clear=Yes
<br>[  232.390884]   &nbsp;&nbsp;&nbsp;&nbsp; Enable INVPCID: Can set=Yes, Can clear=Yes
<br>[  232.390886]   &nbsp;&nbsp;&nbsp;&nbsp; Enable VM functions: Can set=Yes, Can clear=Yes
<br>[  232.390888]   &nbsp;&nbsp;&nbsp;&nbsp; VMCS shadowing: Can set=No, Can clear=Yes
<br>[  232.390889]   &nbsp;&nbsp;&nbsp;&nbsp; Enable ENCLS Exiting: Can set=No, Can clear=Yes
<br>[  232.390891]   &nbsp;&nbsp;&nbsp;&nbsp; RDSEED exiting: Can set=Yes, Can clear=Yes
<br>[  232.390892]   &nbsp;&nbsp;&nbsp;&nbsp; Enable PML: Can set=No, Can clear=Yes
<br>[  232.390894]   &nbsp;&nbsp;&nbsp;&nbsp; EPT-violation #VE: Can set=Yes, Can clear=Yes
<br>[  232.390895]   &nbsp;&nbsp;&nbsp;&nbsp; Conceal VMX from PT: Can set=No, Can clear=Yes
<br>[  232.390897]   &nbsp;&nbsp;&nbsp;&nbsp; Enable XSAVES/XRSTORS: Can set=No, Can clear=Yes
<br>[  232.390899]   &nbsp;&nbsp;&nbsp;&nbsp; Mode-based execute control for EPT: Can set=No, Can clear=Yes
<br>[  232.390900]   &nbsp;&nbsp;&nbsp;&nbsp; Sub-page write permissions for EPT: Can set=No, Can clear=Yes
<br>[  232.390903]   &nbsp;&nbsp;&nbsp;&nbsp; Intel PT uses guest physical addresses: Can set=No, Can clear=Yes
<br>[  232.390905]   &nbsp;&nbsp;&nbsp;&nbsp; Interrupt-window Exiting: Can set=Yes, Can clear=Yes
<br>[  232.390907]   &nbsp;&nbsp;&nbsp;&nbsp; Use TSC offsetting: Can set=Yes, Can clear=Yes
<br>[  232.390908]   &nbsp;&nbsp;&nbsp;&nbsp; HLT exiting: Can set=Yes, Can clear=Yes
<br>[  232.390910] Entry Controls MSR: 0xffff000011ff
<br>[  232.390913]   &nbsp;&nbsp;&nbsp;&nbsp; Load debug controls: Can set=Yes, Can clear=No
<br>[  232.390914]   &nbsp;&nbsp;&nbsp;&nbsp; IA-32e mode guest: Can set=Yes, Can clear=Yes
<br>[  232.390916]   &nbsp;&nbsp;&nbsp;&nbsp; Entry to SMM: Can set=Yes, Can clear=Yes
<br>[  232.390917]   &nbsp;&nbsp;&nbsp;&nbsp; Deactivate dual-monitor treatment: Can set=Yes, Can clear=Yes
<br>[  232.390918]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_PERF_GLOBAL_CTRL: Can set=Yes, Can clear=Yes
<br>[  232.390920]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_PAT: Can set=Yes, Can clear=Yes
<br>[  232.390921]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_EFER: Can set=Yes, Can clear=Yes
<br>[  232.390922]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_BNDCFGS: Can set=No, Can clear=Yes
<br>[  232.390924]   &nbsp;&nbsp;&nbsp;&nbsp; Conceal VMX from PT: Can set=No, Can clear=Yes
<br>[  232.390925]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_RTIT_CTL: Can set=No, Can clear=Yes
<br>[  232.390926]   &nbsp;&nbsp;&nbsp;&nbsp; Load CET state: Can set=No, Can clear=Yes
<br>[  232.390928]   &nbsp;&nbsp;&nbsp;&nbsp; Load PKRS: Can set=No, Can clear=Yes
<br>[  232.390929] Exit Controls MSR: 0x7fffff00036dff
<br>[  232.390931]   &nbsp;&nbsp;&nbsp;&nbsp; Save debug controls: Can set=Yes, Can clear=No
<br>[  232.390932]   &nbsp;&nbsp;&nbsp;&nbsp; Host address-space size: Can set=Yes, Can clear=Yes
<br>[  232.390934]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_PERF_GLOBAL_CTRL: Can set=Yes, Can clear=Yes
<br>[  232.390935]   &nbsp;&nbsp;&nbsp;&nbsp; Acknowledge interrupt on exit: Can set=Yes, Can clear=Yes
<br>[  232.390937]   &nbsp;&nbsp;&nbsp;&nbsp; Save IA32_PAT: Can set=Yes, Can clear=Yes
<br>[  232.390938]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_PAT: Can set=Yes, Can clear=Yes
<br>[  232.390940]   &nbsp;&nbsp;&nbsp;&nbsp; Save IA32_EFER: Can set=Yes, Can clear=Yes
<br>[  232.390941]   &nbsp;&nbsp;&nbsp;&nbsp; Load IA32_EFER: Can set=Yes, Can clear=Yes
<br>[  232.390942]   &nbsp;&nbsp;&nbsp;&nbsp; Save VMX-preemption timer value: Can set=Yes, Can clear=Yes
<br>[  232.390944]   &nbsp;&nbsp;&nbsp;&nbsp; Clear IA32_BNDCFGS: Can set=No, Can clear=Yes
<br>[  232.390945]   &nbsp;&nbsp;&nbsp;&nbsp; Conceal VMX from PT: Can set=No, Can clear=Yes
<br>[  232.390947]   &nbsp;&nbsp;&nbsp;&nbsp; Clear IA32_RTIT_CTL: Can set=No, Can clear=Yes
<br>[  232.390948]   &nbsp;&nbsp;&nbsp;&nbsp; Load CET state: Can set=No, Can clear=Yes
<br>[  232.390949]   &nbsp;&nbsp;&nbsp;&nbsp; Load PKRS: Can set=No, Can clear=Yes
