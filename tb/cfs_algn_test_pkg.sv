`ifndef CFS_ALGN_TEST_PKG_SV
  `define CFS_ALGN_TEST_PKG_SV

  `include "uvm_macros.svh"
  `include "cfs_algn_pkg.sv"
  `include "uvm_ext_pkg.sv"
  `include "cfs_apb_pkg.sv"
  `include "cfs_md_pkg.sv"
  `include "cfs_algn_reg_pkg.sv"
  
  package cfs_algn_test_pkg;
    import uvm_pkg::*;
    import cfs_algn_pkg::*;
    import uvm_ext_pkg::*;
    import cfs_apb_pkg::*;
    import cfs_md_pkg::*;
    import cfs_algn_reg_pkg::*;


    `include "cfs_algn_test_defines.sv"
    `include "cfs_algn_test_base.sv"
    `include "cfs_algn_test_reg_access.sv"
    `include "cfs_algn_test_random.sv"
    `include "cfs_algn_test_random_rx_err.sv"

  endpackage

`endif