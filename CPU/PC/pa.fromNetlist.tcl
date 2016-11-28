
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name PC -dir "E:/pipeline-cpu/CPU/PC/planAhead_run_1" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/pipeline-cpu/CPU/PC/testSRAM.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/pipeline-cpu/CPU/PC} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "testSRAM.ucf" [current_fileset -constrset]
add_files [list {testSRAM.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
