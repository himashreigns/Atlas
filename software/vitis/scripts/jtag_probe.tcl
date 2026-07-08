# xsdb script: connect via JTAG, probe what the A9 is doing
connect
puts "--- targets ---"
targets
puts ""
# Pick A9 #0
catch { targets -set -filter {name =~ "ARM*Cortex-A9*#0"} }
puts "--- state ---"
catch { state } st
puts "  state: $st"
puts ""
puts "--- attempt halt ---"
catch { stop } stopres
puts "  stop: $stopres"
puts ""
puts "--- registers (rrd) ---"
catch { rrd } regs
puts $regs
puts ""
puts "--- PC neighbourhood (disassemble around PC) ---"
catch { dis pc 8 } disasm
puts $disasm
puts ""
puts "--- read OCM (FSBL load region 0x00000000..0x0003FFFF) for 'XLNX' magic ---"
catch { mrd 0x00000000 16 } ocm
puts $ocm
puts ""
puts "--- continue (don't leave the CPU halted) ---"
catch { con }
disconnect
