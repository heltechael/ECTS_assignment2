#!/bin/bash -f
# Vivado (TM) v2017.2 (64-bit)
#
# Filename    : system.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Thu Sep 29 13:01:19 +0200 2022
# IP Build 1909766 on Thu Jun 15 19:58:00 MDT 2017 
#
# usage: system.sh [-help]
# usage: system.sh [-lib_map_path]
# usage: system.sh [-noclean_files]
# usage: system.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'system.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
# ********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm axi_infrastructure_v1_1_0 xil_common_vip_v1_0_0 smartconnect_v1_0 axi_protocol_checker_v1_1_14 axi_vip_v1_0_2 axi_vip_v1_0_1 axi_lite_ipif_v3_0_4 lib_cdc_v1_0_2 interrupt_control_v3_1_4 axi_gpio_v2_0_15 proc_sys_reset_v5_0_11 generic_baseblocks_v2_1_0 axi_register_slice_v2_1_13 fifo_generator_v13_1_4 axi_data_fifo_v2_1_12 axi_crossbar_v2_1_14 axi_protocol_converter_v2_1_13)

# Simulation root library directory
sim_lib_dir="vcs"

# Script info
echo -e "system.sh - Script generated by export_simulation (Vivado v2017.2 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_common_vip_v1_0_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/sc_util_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_checker_v1_1_14 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/a1b2/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_vip_v1_0_2 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl/axi_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_vip_v1_0_1 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work axi_lite_ipif_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work interrupt_control_v3_1_4 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_gpio_v2_0_15 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/cb07/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/system/ip/system_axi_gpio_0_0/sim/system_axi_gpio_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_11 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/system/ip/system_rst_processing_system7_0_50M_0/sim/system_rst_processing_system7_0_50M_0.vhd" \
    "$ref_dir/../../../bd/system/ip/system_axi_gpio_0_1/sim/system_axi_gpio_0_1.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/55c0/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work fifo_generator_v13_1_4 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_1_4 $vhdlan_opts \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_1_4 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_12 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/95b9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_crossbar_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/f582/hdl/axi_crossbar_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/f0ae/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/7e3a/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/2ad9/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/39ca/hdl/verilog" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/1d61/hdl" +incdir+"$ref_dir/../../../../lab2.srcs/sources_1/bd/system/ipshared/6eb1/hdl" \
    "$ref_dir/../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/system/hdl/system.vhd" \
  2>&1 | tee -a vhdlan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.system xil_defaultlib.glbl -o system_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./system_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./system.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path=""
  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key system_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc system_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./system.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: system.sh [-help]\n\
Usage: system.sh [-lib_map_path]\n\
Usage: system.sh [-reset_run]\n\
Usage: system.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
