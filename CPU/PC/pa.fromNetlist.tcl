
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name PC -dir "G:/cpu/pipeline-cpu/CPU/PC/planAhead_run_1" -part xc3s1200efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/cpu/pipeline-cpu/CPU/PC/CPU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/cpu/pipeline-cpu/CPU/PC} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "CPU.ucf" [current_fileset -constrset]
add_files [list {CPU.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
