# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_ID_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_LITE_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FB_DEFAULT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_ACT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_BP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_FP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_SYNC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_ACT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_BP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_FP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_SYNC" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI_ID_W { PARAM_VALUE.AXI_ID_W } {
	# Procedure called to update AXI_ID_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_W { PARAM_VALUE.AXI_ID_W } {
	# Procedure called to validate AXI_ID_W
	return true
}

proc update_PARAM_VALUE.AXI_LITE_ADDR_W { PARAM_VALUE.AXI_LITE_ADDR_W } {
	# Procedure called to update AXI_LITE_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_LITE_ADDR_W { PARAM_VALUE.AXI_LITE_ADDR_W } {
	# Procedure called to validate AXI_LITE_ADDR_W
	return true
}

proc update_PARAM_VALUE.FB_DEFAULT { PARAM_VALUE.FB_DEFAULT } {
	# Procedure called to update FB_DEFAULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FB_DEFAULT { PARAM_VALUE.FB_DEFAULT } {
	# Procedure called to validate FB_DEFAULT
	return true
}

proc update_PARAM_VALUE.H_ACT { PARAM_VALUE.H_ACT } {
	# Procedure called to update H_ACT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_ACT { PARAM_VALUE.H_ACT } {
	# Procedure called to validate H_ACT
	return true
}

proc update_PARAM_VALUE.H_BP { PARAM_VALUE.H_BP } {
	# Procedure called to update H_BP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_BP { PARAM_VALUE.H_BP } {
	# Procedure called to validate H_BP
	return true
}

proc update_PARAM_VALUE.H_FP { PARAM_VALUE.H_FP } {
	# Procedure called to update H_FP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_FP { PARAM_VALUE.H_FP } {
	# Procedure called to validate H_FP
	return true
}

proc update_PARAM_VALUE.H_SYNC { PARAM_VALUE.H_SYNC } {
	# Procedure called to update H_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_SYNC { PARAM_VALUE.H_SYNC } {
	# Procedure called to validate H_SYNC
	return true
}

proc update_PARAM_VALUE.V_ACT { PARAM_VALUE.V_ACT } {
	# Procedure called to update V_ACT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_ACT { PARAM_VALUE.V_ACT } {
	# Procedure called to validate V_ACT
	return true
}

proc update_PARAM_VALUE.V_BP { PARAM_VALUE.V_BP } {
	# Procedure called to update V_BP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_BP { PARAM_VALUE.V_BP } {
	# Procedure called to validate V_BP
	return true
}

proc update_PARAM_VALUE.V_FP { PARAM_VALUE.V_FP } {
	# Procedure called to update V_FP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_FP { PARAM_VALUE.V_FP } {
	# Procedure called to validate V_FP
	return true
}

proc update_PARAM_VALUE.V_SYNC { PARAM_VALUE.V_SYNC } {
	# Procedure called to update V_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_SYNC { PARAM_VALUE.V_SYNC } {
	# Procedure called to validate V_SYNC
	return true
}


proc update_MODELPARAM_VALUE.AXI_LITE_ADDR_W { MODELPARAM_VALUE.AXI_LITE_ADDR_W PARAM_VALUE.AXI_LITE_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_LITE_ADDR_W}] ${MODELPARAM_VALUE.AXI_LITE_ADDR_W}
}

proc update_MODELPARAM_VALUE.AXI_ID_W { MODELPARAM_VALUE.AXI_ID_W PARAM_VALUE.AXI_ID_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_W}] ${MODELPARAM_VALUE.AXI_ID_W}
}

proc update_MODELPARAM_VALUE.FB_DEFAULT { MODELPARAM_VALUE.FB_DEFAULT PARAM_VALUE.FB_DEFAULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FB_DEFAULT}] ${MODELPARAM_VALUE.FB_DEFAULT}
}

proc update_MODELPARAM_VALUE.H_ACT { MODELPARAM_VALUE.H_ACT PARAM_VALUE.H_ACT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_ACT}] ${MODELPARAM_VALUE.H_ACT}
}

proc update_MODELPARAM_VALUE.H_FP { MODELPARAM_VALUE.H_FP PARAM_VALUE.H_FP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_FP}] ${MODELPARAM_VALUE.H_FP}
}

proc update_MODELPARAM_VALUE.H_SYNC { MODELPARAM_VALUE.H_SYNC PARAM_VALUE.H_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_SYNC}] ${MODELPARAM_VALUE.H_SYNC}
}

proc update_MODELPARAM_VALUE.H_BP { MODELPARAM_VALUE.H_BP PARAM_VALUE.H_BP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_BP}] ${MODELPARAM_VALUE.H_BP}
}

proc update_MODELPARAM_VALUE.V_ACT { MODELPARAM_VALUE.V_ACT PARAM_VALUE.V_ACT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_ACT}] ${MODELPARAM_VALUE.V_ACT}
}

proc update_MODELPARAM_VALUE.V_FP { MODELPARAM_VALUE.V_FP PARAM_VALUE.V_FP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_FP}] ${MODELPARAM_VALUE.V_FP}
}

proc update_MODELPARAM_VALUE.V_SYNC { MODELPARAM_VALUE.V_SYNC PARAM_VALUE.V_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_SYNC}] ${MODELPARAM_VALUE.V_SYNC}
}

proc update_MODELPARAM_VALUE.V_BP { MODELPARAM_VALUE.V_BP PARAM_VALUE.V_BP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_BP}] ${MODELPARAM_VALUE.V_BP}
}

