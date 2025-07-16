onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/apb_if/pclk
add wave -noupdate /testbench/apb_if/preset_n
add wave -noupdate /testbench/apb_if/paddr
add wave -noupdate /testbench/apb_if/pwrite
add wave -noupdate /testbench/apb_if/psel
add wave -noupdate /testbench/apb_if/penable
add wave -noupdate /testbench/apb_if/pwdata
add wave -noupdate /testbench/apb_if/pready
add wave -noupdate /testbench/apb_if/prdata
add wave -noupdate /testbench/apb_if/pslverr
add wave -noupdate /testbench/apb_if/has_checks
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {15786750 ps}
