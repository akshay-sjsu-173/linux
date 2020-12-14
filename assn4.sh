echo "Remove kvm_intel.";
rmmod arch/x86/kvm/kvm-intel.ko;
echo "Remove kvm.";
rmmod arch/x86/kvm/kvm.ko;
echo "Build new kvm modules.";
make -j4 M=arch/x86/kvm modules
echo "Install kvm.";
insmod arch/x86/kvm/kvm.ko 
echo "Install kvm_intel";
insmod arch/x86/kvm/kvm-intel.ko ept=0
#echo "Starting VM";
#qemu-system-x86_64 -m 2048 -drive file=ubuntu.qcow,format=qcow2 -enable-kvm -smp 2,sockets=1,cores=1,threads=2 -d cpu_reset -no-fd-bootchk

