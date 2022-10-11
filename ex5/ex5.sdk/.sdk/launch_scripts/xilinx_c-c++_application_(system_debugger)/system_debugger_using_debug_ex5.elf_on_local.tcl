connect -url tcp:127.0.0.1:3121
source C:/Users/dehae/SynologyDrive/2223UNI/Embedded/Assignment_2/EmbeddedSystem_labs/ex5/ex5.sdk/system_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279655443A"} -index 0
loadhw -hw C:/Users/dehae/SynologyDrive/2223UNI/Embedded/Assignment_2/EmbeddedSystem_labs/ex5/ex5.sdk/system_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279655443A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279655443A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279655443A"} -index 0
dow C:/Users/dehae/SynologyDrive/2223UNI/Embedded/Assignment_2/EmbeddedSystem_labs/ex5/ex5.sdk/ex5/Debug/ex5.elf
configparams force-mem-access 0
bpadd -addr &main
