# =============================================================================
# create_app.tcl
#
# Creates the bare-metal application "dnn_yolo_app" on top of dnn_platform,
# pulls in sources from software/vitis/src/, and builds it.
#
# Run after create_platform.tcl:
#     xsct software/vitis/scripts/create_app.tcl
# =============================================================================

set repo_root [file normalize [file dirname [info script]]/../../..]
set ws_dir    [file join $repo_root software vitis workspace]
set src_dir   [file join $repo_root software vitis src]
set plat_name "dnn_platform"
set app_name  "dnn_yolo_app"
set tmpl      "Empty Application(C)"

setws $ws_dir

if {[file isdirectory [file join $ws_dir $app_name]]} {
    puts "INFO: removing prior app [file join $ws_dir $app_name]"
    file delete -force [file join $ws_dir $app_name]
}
if {[file isdirectory [file join $ws_dir ${app_name}_system]]} {
    file delete -force [file join $ws_dir ${app_name}_system]
}

# Create application
app create -name $app_name -platform $plat_name -domain ${plat_name}_domain \
           -template $tmpl -lang C

# Import sources
set src_files [glob -nocomplain [file join $src_dir *.c] [file join $src_dir *.h]]
foreach f $src_files {
    importsources -name $app_name -path $f -target-path src
}

# Compiler flags: enable HW float, optimize, plus our app-level defines
app config -name $app_name build-config release
app config -name $app_name -add compiler-optimization {Optimize size (-Os)}
app config -name $app_name -add compiler-misc        {-ffunction-sections -fdata-sections}
app config -name $app_name -add linker-misc          {-Wl,--gc-sections}
app config -name $app_name -add define-compiler-symbols { -DDNN_YOLO_NANO=1 }

app build -name $app_name

set elf [file join $ws_dir $app_name Release ${app_name}.elf]
if {![file exists $elf]} {
    # Some Vitis versions put it under Debug by default
    set elf [file join $ws_dir $app_name Debug ${app_name}.elf]
}

puts ""
puts "================================================================="
puts "  App built      : $elf"
puts "  Next steps:"
puts "    Program HW   : xsdb scripts/program_and_run.tcl"
puts "    Debug w/ GDB : xsdb scripts/debug.tcl"
puts "================================================================="
