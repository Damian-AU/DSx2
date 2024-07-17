set ::history_viewer_version 1.3

# set ::block_DSx2_history_viewer ""

proc skin_history {} {
    page_show history
}
if {[info exist ::block_DSx2_history_viewer]} {
    dui add dtext history 1280 450 -font [skin_font font 34] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -text {DSx2 History Viewer was disabled by another plugin}

    dui add dbutton history 1210 600 \
        -shape round -radius $::skin_button_radius -width 2 -fill $::skin_foreground_colour \
        -label [translate "EXIT"] -label_font [skin_font font 18] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
        -bwidth 110 -bheight 80 -initial_state normal \
        -command {if {$::de1_num_state($::de1(state)) == "Sleep"} {page_show saver;} else {set_next_page off off; start_idle; page_show off;}}

    return
}

proc history_graph_list {} {
	return [list \
        espresso_elapsed \
        espresso_temperature_basket \
        espresso_temperature_goal \
        espresso_pressure \
        espresso_pressure_goal \
        espresso_flow \
        espresso_flow_goal \
        espresso_flow_weight \
        espresso_resistance \
        espresso_state_change \
        espresso_weight \
    ]
}

proc history_custom_graph_list {} {
	return [list \
        espresso_elapsed \
        espresso_temperature_basket10th \
        espresso_temperature_goal10th \
        espresso_flow_2x \
        espresso_flow_goal_2x \
        espresso_flow_weight_2x \
        espresso_weight10th \
    ]
}

proc create_history_vectors {graph} {
    foreach l [history_graph_list] {
        return history_${graph}_${l}
    }
}

proc create_custom_history_vectors {graph} {
    foreach l [history_custom_graph_list] {
        return history_${graph}_${l}
    }
}

blt::vector create \
    history_left_espresso_elapsed \
    history_left_espresso_temperature_basket \
    history_left_espresso_temperature_goal \
    history_left_espresso_temperature_basket10th \
    history_left_espresso_weight10th \
    history_left_espresso_temperature_goal10th \
    history_left_espresso_pressure \
    history_left_espresso_pressure_goal \
    history_left_espresso_flow \
    history_left_espresso_flow_goal \
    history_left_espresso_flow_2x \
    history_left_espresso_flow_goal_2x \
    history_left_espresso_flow_weight \
    history_left_espresso_flow_weight_2x \
    history_left_espresso_resistance \
    history_left_espresso_state_change \
    history_left_espresso_weight

blt::vector create \
    history_right_espresso_elapsed \
    history_right_espresso_temperature_basket \
    history_right_espresso_temperature_goal \
    history_right_espresso_temperature_basket10th \
    history_right_espresso_weight10th \
    history_right_espresso_temperature_goal10th \
    history_right_espresso_pressure \
    history_right_espresso_pressure_goal \
    history_right_espresso_flow \
    history_right_espresso_flow_goal \
    history_right_espresso_flow_2x \
    history_right_espresso_flow_goal_2x \
    history_right_espresso_flow_weight \
    history_right_espresso_flow_weight_2x \
    history_right_espresso_resistance \
    history_right_espresso_state_change \
    history_right_espresso_weight

blt::vector create \
    history_1_espresso_elapsed \
    history_1_espresso_temperature_basket \
    history_1_espresso_temperature_goal \
    history_1_espresso_temperature_basket10th \
    history_1_espresso_weight10th \
    history_1_espresso_temperature_goal10th \
    history_1_espresso_pressure \
    history_1_espresso_pressure_goal \
    history_1_espresso_flow \
    history_1_espresso_flow_goal \
    history_1_espresso_flow_2x \
    history_1_espresso_flow_goal_2x \
    history_1_espresso_flow_weight \
    history_1_espresso_flow_weight_2x \
    history_1_espresso_resistance \
    history_1_espresso_state_change \
    history_1_espresso_weight

blt::vector create \
    history_2_espresso_elapsed \
    history_2_espresso_temperature_basket \
    history_2_espresso_temperature_goal \
    history_2_espresso_temperature_basket10th \
    history_2_espresso_weight10th \
    history_2_espresso_temperature_goal10th \
    history_2_espresso_pressure \
    history_2_espresso_pressure_goal \
    history_2_espresso_flow \
    history_2_espresso_flow_goal \
    history_2_espresso_flow_2x \
    history_2_espresso_flow_goal_2x \
    history_2_espresso_flow_weight \
    history_2_espresso_flow_weight_2x \
    history_2_espresso_resistance \
    history_2_espresso_state_change \
    history_2_espresso_weight

blt::vector create \
    history_3_espresso_elapsed \
    history_3_espresso_temperature_basket \
    history_3_espresso_temperature_goal \
    history_3_espresso_temperature_basket10th \
    history_3_espresso_weight10th \
    history_3_espresso_temperature_goal10th \
    history_3_espresso_pressure \
    history_3_espresso_pressure_goal \
    history_3_espresso_flow \
    history_3_espresso_flow_goal \
    history_3_espresso_flow_2x \
    history_3_espresso_flow_goal_2x \
    history_3_espresso_flow_weight \
    history_3_espresso_flow_weight_2x \
    history_3_espresso_resistance \
    history_3_espresso_state_change \
    history_3_espresso_weight

blt::vector create \
    history_4_espresso_elapsed \
    history_4_espresso_temperature_basket \
    history_4_espresso_temperature_goal \
    history_4_espresso_temperature_basket10th \
    history_4_espresso_weight10th \
    history_4_espresso_temperature_goal10th \
    history_4_espresso_pressure \
    history_4_espresso_pressure_goal \
    history_4_espresso_flow \
    history_4_espresso_flow_goal \
    history_4_espresso_flow_2x \
    history_4_espresso_flow_goal_2x \
    history_4_espresso_flow_weight \
    history_4_espresso_flow_weight_2x \
    history_4_espresso_resistance \
    history_4_espresso_state_change \
    history_4_espresso_weight

blt::vector create \
    history_5_espresso_elapsed \
    history_5_espresso_temperature_basket \
    history_5_espresso_temperature_goal \
    history_5_espresso_temperature_basket10th \
    history_5_espresso_weight10th \
    history_5_espresso_temperature_goal10th \
    history_5_espresso_pressure \
    history_5_espresso_pressure_goal \
    history_5_espresso_flow \
    history_5_espresso_flow_goal \
    history_5_espresso_flow_2x \
    history_5_espresso_flow_goal_2x \
    history_5_espresso_flow_weight \
    history_5_espresso_flow_weight_2x \
    history_5_espresso_resistance \
    history_5_espresso_state_change \
    history_5_espresso_weight

blt::vector create \
    history_6_espresso_elapsed \
    history_6_espresso_temperature_basket \
    history_6_espresso_temperature_goal \
    history_6_espresso_temperature_basket10th \
    history_6_espresso_weight10th \
    history_6_espresso_temperature_goal10th \
    history_6_espresso_pressure \
    history_6_espresso_pressure_goal \
    history_6_espresso_flow \
    history_6_espresso_flow_goal \
    history_6_espresso_flow_2x \
    history_6_espresso_flow_goal_2x \
    history_6_espresso_flow_weight \
    history_6_espresso_flow_weight_2x \
    history_6_espresso_resistance \
    history_6_espresso_state_change \
    history_6_espresso_weight

blt::vector create \
    history_7_espresso_elapsed \
    history_7_espresso_temperature_basket \
    history_7_espresso_temperature_goal \
    history_7_espresso_temperature_basket10th \
    history_7_espresso_weight10th \
    history_7_espresso_temperature_goal10th \
    history_7_espresso_pressure \
    history_7_espresso_pressure_goal \
    history_7_espresso_flow \
    history_7_espresso_flow_goal \
    history_7_espresso_flow_2x \
    history_7_espresso_flow_goal_2x \
    history_7_espresso_flow_weight \
    history_7_espresso_flow_weight_2x \
    history_7_espresso_resistance \
    history_7_espresso_state_change \
    history_7_espresso_weight

blt::vector create \
    history_8_espresso_elapsed \
    history_8_espresso_temperature_basket \
    history_8_espresso_temperature_goal \
    history_8_espresso_temperature_basket10th \
    history_8_espresso_weight10th \
    history_8_espresso_temperature_goal10th \
    history_8_espresso_pressure \
    history_8_espresso_pressure_goal \
    history_8_espresso_flow \
    history_8_espresso_flow_goal \
    history_8_espresso_flow_2x \
    history_8_espresso_flow_goal_2x \
    history_8_espresso_flow_weight \
    history_8_espresso_flow_weight_2x \
    history_8_espresso_resistance \
    history_8_espresso_state_change \
    history_8_espresso_weight

blt::vector create \
    history_9_espresso_elapsed \
    history_9_espresso_temperature_basket \
    history_9_espresso_temperature_goal \
    history_9_espresso_temperature_basket10th \
    history_9_espresso_weight10th \
    history_9_espresso_temperature_goal10th \
    history_9_espresso_pressure \
    history_9_espresso_pressure_goal \
    history_9_espresso_flow \
    history_9_espresso_flow_goal \
    history_9_espresso_flow_2x \
    history_9_espresso_flow_goal_2x \
    history_9_espresso_flow_weight \
    history_9_espresso_flow_weight_2x \
    history_9_espresso_resistance \
    history_9_espresso_state_change \
    history_9_espresso_weight

blt::vector create \
    history_10_espresso_elapsed \
    history_10_espresso_temperature_basket \
    history_10_espresso_temperature_goal \
    history_10_espresso_temperature_basket10th \
    history_10_espresso_weight10th \
    history_10_espresso_temperature_goal10th \
    history_10_espresso_pressure \
    history_10_espresso_pressure_goal \
    history_10_espresso_flow \
    history_10_espresso_flow_goal \
    history_10_espresso_flow_2x \
    history_10_espresso_flow_goal_2x \
    history_10_espresso_flow_weight \
    history_10_espresso_flow_weight_2x \
    history_10_espresso_resistance \
    history_10_espresso_state_change \
    history_10_espresso_weight

if {![info exist ::skin(history_pressure)]} {
    set ::skin(history_pressure) 1
}
if {![info exist ::skin(history_flow)]} {
    set ::skin(history_flow) 1
}
if {![info exist ::skin(history_weight)]} {
    set ::skin(history_weight) 1
}
if {![info exist ::skin(history_weight10th)]} {
    set ::skin(history_weight10th) 1
}
if {![info exist ::skin(history_temperature)]} {
    set ::skin(history_temperature) 1
}
if {![info exist ::skin(history_resistance)]} {
    set ::skin(history_resistance) 1
}
if {![info exist ::skin(history_steps)]} {
    set ::skin(history_steps) 1
}
if {![info exist ::skin(history_goal)]} {
    set ::skin(history_goal) 1
}
if {![info exist ::skin(history_show_y2_axis)]} {
    set ::skin(history_show_y2_axis) 0
}
if {![info exist ::skin(history_one_graph)]} {
    set ::skin(history_one_graph) 0
}
if {![info exist ::skin(history_y_res)]} {
    set ::skin(history_y_res) 0
}
if {[info exist ::user(history_left_colour)]} {
    set ::history_left_colour $::user(history_left_colour)
} else {
    set ::history_left_colour $::skin_brown
}
if {[info exist ::user(history_right_colour)]} {
    set ::history_right_colour $::user(history_right_colour)
} else {
    set ::history_right_colour $::skin_red
}
if {![info exist ::skin(history_enable_weight10th)]} {
    set ::skin(history_enable_weight10th) 0
}
if {![info exist ::skin(history_sch_limit)]} {
    set ::skin(history_sch_limit) 100
}

set ::history_count 0

proc history_list {{limit $::skin(history_sch_limit)}} {
    set result {}
    set files [lsort -dictionary -decreasing [glob -nocomplain -tails -directory "[homedir]/history/" *.shot]]
    set ::history_count [llength $files]
    if {$::history_count < $::skin(history_sch_limit)} {
        set ::skin(history_sch_limit) $::history_count
    }
    set count 0
    foreach file $files {
        set tailname [file tail $file]
        if {$count == $limit} {
            break;
        }
        lappend result $tailname
        incr count
    }
    return $result
}

proc scroll_history { steps } {
    borg spinner on
    if {$::history_count < 10} {
        set ::skin(history_position) 1
        get_history_data 1
        return
    }
    set pos [expr $::skin(history_position) + $steps]
    if {$pos < 1} {
        set pos 1
    }
    if {$pos > [expr $::skin(history_sch_limit) - 9]} {
        set pos [expr $::skin(history_sch_limit) - 9]
    }
    get_history_data $pos
    borg spinner off
}

proc history_position { pos } {
    set list [history_list]
    set name [lindex $list [expr $pos - 1] 0]
    return $name
}

if {![info exist ::skin(history_position)]} {
    set ::skin(history_position) 1
}

proc graph_number {} {
    if {$::history_count < 10} {
        set files [lsort -dictionary -decreasing [glob -nocomplain -tails -directory "[homedir]/history/" *.shot]]
        set ::history_count [llength $files]
        return [lrange {1 2 3 4 5 6 7 8 9 10} 0 [expr $::history_count - 1]]
    } else {
        return {1 2 3 4 5 6 7 8 9 10}
    }
}

proc get_history_data {pos} {
    set ::skin(history_position) $pos
    foreach graph [graph_number] {
        clear_history_graphs $graph
        set p [expr $pos + $graph - 1]
        set file_name [history_position $p]
        if {[file exists "[homedir]/history/$file_name"]} {
            array set ::selected_history_data [read_file "[homedir]/history/$file_name"]
        }
        foreach lg [history_graph_list] {
            $lg length 0
            if {[info exists ::selected_history_data($lg)] == 1} {
                history_${graph}_${lg} append $::selected_history_data($lg)
            }
        }
        if {[info exists ::selected_history_data(clock)] == 1} {
            set ::history_${graph}_clock $::selected_history_data(clock)
        }
        if {[info exists ::selected_history_data(settings)] == 1} {
            array set h_settings $::selected_history_data(settings)
        }
        if {[info exists ::selected_history_data(machine)] == 1} {
            array set h_machine $::selected_history_data(machine)
        }
        if {[info exists h_settings(profile_title)] == 1} {
            set ::history_${graph}_profile_title $h_settings(profile_title)
        }
        if {[info exists h_settings(grinder_dose_weight)] == 1} {
            set ::history_${graph}_grinder_dose_weight $h_settings(grinder_dose_weight)
        }
        if {[info exists h_settings(drink_weight)] == 1} {
            set ::history_${graph}_drink_weight $h_settings(drink_weight)
        }
        if {[info exists h_machine(preinfusion_volume)] == 1} {
            set ::history_${graph}_preinfusion_volume $h_machine(preinfusion_volume)
        }
        if {[info exists h_machine(pour_volume)] == 1} {
            set ::history_${graph}_pour_volume $h_machine(pour_volume)
        }

    }
    skin_save skin
    make_custom_curves
}

set ::history_left_graph_clock {}
set ::history_left_graph_profile_title {}
set ::history_left_graph_dose {}
set ::history_left_graph_drink_weight {}
set ::history_left_graph_preinfusion_volume {}
set ::history_left_graph_pour_volume {}

set ::history_right_graph_clock {}
set ::history_right_graph_profile_title {}
set ::history_right_graph_dose {}
set ::history_right_graph_drink_weight {}
set ::history_right_graph_preinfusion_volume {}
set ::history_right_graph_pour_volume {}

proc history_left_graph_info {} {
    set time [cache_date_time_format $::history_left_graph_clock]
    set p $::history_left_graph_profile_title
    set b [round_to_one_digits $::history_left_graph_dose]
    set w [round_to_one_digits $::history_left_graph_drink_weight]
    set er [round_to_one_digits [expr $::history_left_graph_drink_weight / ($::history_left_graph_dose + 0.001)]]
    if {$::history_left_graph_dose < 5 || $::history_left_graph_drink_weight < 5} {
        set er 0
    }
    set v [round_to_integer [expr {$::history_left_graph_preinfusion_volume + $::history_left_graph_pour_volume}]]
    set s { }
    set g {   }
    append st [history_left_espresso_elapsed range end end]
		set t "[round_to_integer [expr ($st+0.5)]]"
    return ${p}${g}${v}ml${g}${t}s${g}${b}g${s}:${s}${w}g${s}(1:${er})${g}${time}
}

proc history_right_graph_info {} {
    set time [cache_date_time_format $::history_right_graph_clock]
    set p [name_length $::history_right_graph_profile_title 26]
    set b [round_to_one_digits $::history_right_graph_dose]
    set w [round_to_one_digits $::history_right_graph_drink_weight]
    set er [round_to_one_digits [expr $::history_left_graph_drink_weight / ($::history_left_graph_dose + 0.001)]]
    if {$::history_right_graph_dose < 5 || $::history_right_graph_drink_weight < 5} {
        set er 0
    }
    set v [round_to_integer [expr {$::history_right_graph_preinfusion_volume + $::history_right_graph_pour_volume}]]
    set s { }
    set g {   }
    append st [history_right_espresso_elapsed range end end]
		set t "[round_to_integer [expr ($st+0.5)]]"
    return ${p}${g}${v}ml${g}${t}s${g}${b}g${s}:${s}${w}g${s}(1:${er})${g}${time}
}

proc make_custom_curves {} {
    foreach graph [graph_number] {
        clear_history_custom_graphs $graph
        foreach t [history_${graph}_espresso_temperature_basket * 0.1] {
            history_${graph}_espresso_temperature_basket10th append $t
        }
        foreach w [history_${graph}_espresso_weight * 0.1] {
            history_${graph}_espresso_weight10th append $w
        }
        foreach tg [history_${graph}_espresso_temperature_goal * 0.1] {
            history_${graph}_espresso_temperature_goal10th append $tg
        }
        foreach f [history_${graph}_espresso_flow * 2] {
            history_${graph}_espresso_flow_2x append $f
        }
        foreach fg [history_${graph}_espresso_flow_goal * 2] {
            history_${graph}_espresso_flow_goal_2x append $fg
        }
        foreach fw [history_${graph}_espresso_flow_weight * 2] {
            history_${graph}_espresso_flow_weight_2x append $fw
        }
    }
}

proc clear_history_graphs { graph } {
    history_${graph}_espresso_elapsed length 0
    history_${graph}_espresso_temperature_basket length 0
    history_${graph}_espresso_temperature_goal length 0
    history_${graph}_espresso_pressure length 0
    history_${graph}_espresso_pressure_goal length 0
    history_${graph}_espresso_flow length 0
    history_${graph}_espresso_flow_goal length 0
    history_${graph}_espresso_flow_weight length 0
    history_${graph}_espresso_resistance length 0
    history_${graph}_espresso_state_change length 0
    set ::history_${graph}_graph_clock {}
    set ::history_${graph}_graph_profile_title {}
    set ::history_${graph}_graph_dose {}
    set ::history_${graph}_graph_drink_weight {}
    set ::history_${graph}_graph_preinfusion_volume {}
    set ::history_${graph}_graph_pour_volume {}
}

proc clear_history_custom_graphs { graph } {
    history_${graph}_espresso_flow_2x length 0
    history_${graph}_espresso_flow_goal_2x length 0
    history_${graph}_espresso_flow_weight_2x length 0
    history_${graph}_espresso_temperature_basket10th length 0
    history_${graph}_espresso_weight10th length 0
    history_${graph}_espresso_temperature_goal10th length 0
}


proc check_history_selected_colour {} {
    if {$::history_count < 10} {
        #return
    }
    foreach gd [graph_number] {
        dui item config history history_${gd}_data -fill $::skin_text_colour
    }
    if {$::history_count >= 1} {
        if {$::history_left_graph_clock == $::history_1_clock} {
            dui item config history history_1_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_1_clock} {
            dui item config history history_1_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_1_clock && $::history_right_graph_clock == $::history_1_clock} {
            dui item config history hg1_p -fill $::history_left_colour
            dui item config history hg1_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 2} {
        if {$::history_left_graph_clock == $::history_2_clock} {
            dui item config history history_2_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_2_clock} {
            dui item config history history_2_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_2_clock && $::history_right_graph_clock == $::history_2_clock} {
            dui item config history hg2_p -fill $::history_left_colour
            dui item config history hg2_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 3} {
        if {$::history_left_graph_clock == $::history_3_clock} {
            dui item config history history_3_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_3_clock} {
            dui item config history history_3_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_3_clock && $::history_right_graph_clock == $::history_3_clock} {
            dui item config history hg3_p -fill $::history_left_colour
            dui item config history hg3_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 4} {
        if {$::history_left_graph_clock == $::history_4_clock} {
            dui item config history history_4_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_4_clock} {
            dui item config history history_4_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_4_clock && $::history_right_graph_clock == $::history_4_clock} {
            dui item config history hg4_p -fill $::history_left_colour
            dui item config history hg4_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 5} {
        if {$::history_left_graph_clock == $::history_5_clock} {
            dui item config history history_5_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_5_clock} {
            dui item config history history_5_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_5_clock && $::history_right_graph_clock == $::history_5_clock} {
            dui item config history hg5_p -fill $::history_left_colour
            dui item config history hg5_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 6} {
        if {$::history_left_graph_clock == $::history_6_clock} {
            dui item config history history_6_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_6_clock} {
            dui item config history history_6_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_6_clock && $::history_right_graph_clock == $::history_6_clock} {
            dui item config history hg6_p -fill $::history_left_colour
            dui item config history hg6_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 7} {
        if {$::history_left_graph_clock == $::history_7_clock} {
            dui item config history history_7_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_7_clock} {
            dui item config history history_7_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_7_clock && $::history_right_graph_clock == $::history_7_clock} {
            dui item config history hg7_p -fill $::history_left_colour
            dui item config history hg7_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 8} {
        if {$::history_left_graph_clock == $::history_8_clock} {
            dui item config history history_8_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_8_clock} {
            dui item config history history_8_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_8_clock && $::history_right_graph_clock == $::history_8_clock} {
            dui item config history hg8_p -fill $::history_left_colour
            dui item config history hg8_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 9} {
        if {$::history_left_graph_clock == $::history_9_clock} {
            dui item config history history_9_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_9_clock} {
            dui item config history history_9_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_9_clock && $::history_right_graph_clock == $::history_9_clock} {
            dui item config history hg9_p -fill $::history_left_colour
            dui item config history hg9_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
    if {$::history_count >= 10} {
        if {$::history_left_graph_clock == $::history_10_clock} {
            dui item config history history_10_data -fill $::history_left_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
        }
        if {$::history_right_graph_clock == $::history_10_clock} {
            dui item config history history_10_data -fill $::history_right_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
        if {$::history_left_graph_clock == $::history_10_clock && $::history_right_graph_clock == $::history_10_clock} {
            dui item config history hg10_p -fill $::history_left_colour
            dui item config history hg10_d -fill $::history_right_colour
            dui item config history history_clear_left_label -fill $::history_left_colour
            dui item config history history_clear_right_label -fill $::history_right_colour
        }
    }
}

proc load_to_history { side graph } {
    if {[${graph}_espresso_temperature_goal length] < 1} {
        return
    }
    if {$side == "left"} {
        clear_history_graphs left
        clear_history_custom_graphs left
        history_left_espresso_temperature_goal append ${graph}_espresso_temperature_goal
        history_left_espresso_temperature_goal10th append ${graph}_espresso_temperature_goal10th
        history_left_espresso_pressure_goal append ${graph}_espresso_pressure_goal
        history_left_espresso_flow_goal append ${graph}_espresso_flow_goal
        history_left_espresso_flow_goal_2x append ${graph}_espresso_flow_goal_2x

        history_left_espresso_elapsed append ${graph}_espresso_elapsed
        history_left_espresso_pressure append ${graph}_espresso_pressure
        history_left_espresso_state_change append ${graph}_espresso_state_change
        history_left_espresso_temperature_basket10th append ${graph}_espresso_temperature_basket10th
        history_left_espresso_weight10th append ${graph}_espresso_weight10th
        history_left_espresso_temperature_basket append ${graph}_espresso_temperature_basket
        history_left_espresso_resistance append ${graph}_espresso_resistance
        history_left_espresso_flow append ${graph}_espresso_flow
        history_left_espresso_flow_weight append ${graph}_espresso_flow_weight
        history_left_espresso_flow_2x append ${graph}_espresso_flow_2x
        history_left_espresso_flow_weight_2x append ${graph}_espresso_flow_weight_2x

        if {$graph == "history_1"} {
            set ::history_left_graph_clock $::history_1_clock
            set ::history_left_graph_profile_title $::history_1_profile_title
            set ::history_left_graph_dose $::history_1_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_1_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_1_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_1_pour_volume
        }
        if {$graph == "history_2"} {
            set ::history_left_graph_clock $::history_2_clock
            set ::history_left_graph_profile_title $::history_2_profile_title
            set ::history_left_graph_dose $::history_2_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_2_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_2_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_2_pour_volume
        }
        if {$graph == "history_3"} {
            set ::history_left_graph_clock $::history_3_clock
            set ::history_left_graph_profile_title $::history_3_profile_title
            set ::history_left_graph_dose $::history_3_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_3_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_3_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_3_pour_volume
        }
        if {$graph == "history_4"} {
            set ::history_left_graph_clock $::history_4_clock
            set ::history_left_graph_profile_title $::history_4_profile_title
            set ::history_left_graph_dose $::history_4_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_4_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_4_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_4_pour_volume
        }
        if {$graph == "history_5"} {
            set ::history_left_graph_clock $::history_5_clock
            set ::history_left_graph_profile_title $::history_5_profile_title
            set ::history_left_graph_dose $::history_5_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_5_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_5_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_5_pour_volume
        }
        if {$graph == "history_6"} {
            set ::history_left_graph_clock $::history_6_clock
            set ::history_left_graph_profile_title $::history_6_profile_title
            set ::history_left_graph_dose $::history_6_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_6_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_6_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_6_pour_volume
        }
        if {$graph == "history_7"} {
            set ::history_left_graph_clock $::history_7_clock
            set ::history_left_graph_profile_title $::history_7_profile_title
            set ::history_left_graph_dose $::history_7_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_7_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_7_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_7_pour_volume
        }
        if {$graph == "history_8"} {
            set ::history_left_graph_clock $::history_8_clock
            set ::history_left_graph_profile_title $::history_8_profile_title
            set ::history_left_graph_dose $::history_8_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_8_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_8_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_8_pour_volume
        }
        if {$graph == "history_9"} {
            set ::history_left_graph_clock $::history_9_clock
            set ::history_left_graph_profile_title $::history_9_profile_title
            set ::history_left_graph_dose $::history_9_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_9_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_9_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_9_pour_volume
        }
        if {$graph == "history_10"} {
            set ::history_left_graph_clock $::history_10_clock
            set ::history_left_graph_profile_title $::history_10_profile_title
            set ::history_left_graph_dose $::history_10_grinder_dose_weight
            set ::history_left_graph_drink_weight $::history_10_drink_weight
            set ::history_left_graph_preinfusion_volume $::history_10_preinfusion_volume
            set ::history_left_graph_pour_volume $::history_10_pour_volume
        }
    } else {
        clear_history_graphs right
        clear_history_custom_graphs right
        history_right_espresso_temperature_goal append ${graph}_espresso_temperature_goal
        history_right_espresso_temperature_goal10th append ${graph}_espresso_temperature_goal10th
        history_right_espresso_pressure_goal append ${graph}_espresso_pressure_goal
        history_right_espresso_flow_goal append ${graph}_espresso_flow_goal
        history_right_espresso_flow_goal_2x append ${graph}_espresso_flow_goal_2x

        history_right_espresso_elapsed append ${graph}_espresso_elapsed
        history_right_espresso_pressure append ${graph}_espresso_pressure
        history_right_espresso_state_change append ${graph}_espresso_state_change
        history_right_espresso_temperature_basket10th append ${graph}_espresso_temperature_basket10th
        history_right_espresso_weight10th append ${graph}_espresso_weight10th
        history_right_espresso_temperature_basket append ${graph}_espresso_temperature_basket
        history_right_espresso_resistance append ${graph}_espresso_resistance
        history_right_espresso_flow append ${graph}_espresso_flow
        history_right_espresso_flow_weight append ${graph}_espresso_flow_weight
        history_right_espresso_flow_2x append ${graph}_espresso_flow_2x
        history_right_espresso_flow_weight_2x append ${graph}_espresso_flow_weight_2x

        if {$graph == "history_1"} {
            set ::history_right_graph_clock $::history_1_clock
            set ::history_right_graph_profile_title $::history_1_profile_title
            set ::history_right_graph_dose $::history_1_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_1_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_1_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_1_pour_volume
        }
        if {$graph == "history_2"} {
            set ::history_right_graph_clock $::history_2_clock
            set ::history_right_graph_profile_title $::history_2_profile_title
            set ::history_right_graph_dose $::history_2_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_2_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_2_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_2_pour_volume
        }
        if {$graph == "history_3"} {
            set ::history_right_graph_clock $::history_3_clock
            set ::history_right_graph_profile_title $::history_3_profile_title
            set ::history_right_graph_dose $::history_3_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_3_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_3_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_3_pour_volume
        }
        if {$graph == "history_4"} {
            set ::history_right_graph_clock $::history_4_clock
            set ::history_right_graph_profile_title $::history_4_profile_title
            set ::history_right_graph_dose $::history_4_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_4_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_4_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_4_pour_volume
        }
        if {$graph == "history_5"} {
            set ::history_right_graph_clock $::history_5_clock
            set ::history_right_graph_profile_title $::history_5_profile_title
            set ::history_right_graph_dose $::history_5_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_5_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_5_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_5_pour_volume
        }
        if {$graph == "history_6"} {
            set ::history_right_graph_clock $::history_6_clock
            set ::history_right_graph_profile_title $::history_6_profile_title
            set ::history_right_graph_dose $::history_6_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_6_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_6_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_6_pour_volume
        }
        if {$graph == "history_7"} {
            set ::history_right_graph_clock $::history_7_clock
            set ::history_right_graph_profile_title $::history_7_profile_title
            set ::history_right_graph_dose $::history_7_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_7_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_7_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_7_pour_volume
        }
        if {$graph == "history_8"} {
            set ::history_right_graph_clock $::history_8_clock
            set ::history_right_graph_profile_title $::history_8_profile_title
            set ::history_right_graph_dose $::history_8_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_8_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_8_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_8_pour_volume
        }
        if {$graph == "history_9"} {
            set ::history_right_graph_clock $::history_9_clock
            set ::history_right_graph_profile_title $::history_9_profile_title
            set ::history_right_graph_dose $::history_9_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_9_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_9_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_9_pour_volume
        }
        if {$graph == "history_10"} {
            set ::history_right_graph_clock $::history_10_clock
            set ::history_right_graph_profile_title $::history_10_profile_title
            set ::history_right_graph_dose $::history_10_grinder_dose_weight
            set ::history_right_graph_drink_weight $::history_10_drink_weight
            set ::history_right_graph_preinfusion_volume $::history_10_preinfusion_volume
            set ::history_right_graph_pour_volume $::history_10_pour_volume
        }

    }
    check_one_graph_goals
    check_history_selected_colour
}

proc history_pos_showing {} {
    set to { - }
    return $::skin(history_position)$to[expr $::skin(history_position) + 9]
}

set ::skin_history_graph_key_x 80
set ::skin_history_graph_key_y 386

proc toggle_history_graph {curve} {
    if {$::skin(history_${curve}) > 0} {
        set ::skin(history_${curve}) 0
    } else {
        set ::skin(history_${curve}) 1
    }
    if {$curve == "weight" && $::skin(history_enable_weight10th) == 1} {
        set ::skin(history_weight10th) $::skin(history_weight)
        config_history_graph weight10th
    }
    if {$::skin(history_enable_weight10th) == 0} {
        set ::skin(history_weight10th) 0
        config_history_graph weight10th
    }
    config_history_graph $curve
    skin_save skin
}

proc toggle_history_graph_goals {} {
    if {([expr [history_left_espresso_elapsed length]] > 1 && [expr [history_right_espresso_elapsed length]] > 1) && $::skin(history_one_graph) == 1} {
        return
    }
    set ::skin(history_goal) [expr !{$::skin(history_goal)}]
    config_history_graph goal
    skin_save skin
}

proc toggle_history_graph_y2 {} {
    set ::skin(history_show_y2_axis) [expr !{$::skin(history_show_y2_axis)}]
    config_history_graph y2
    #skin_save skin
}

proc check_one_graph_goals {} {
    if {([expr [history_left_espresso_elapsed length]] > 1 && [expr [history_right_espresso_elapsed length]] > 1) || $::skin(history_goal) == 0} {
        $::history_one_graph element configure one_history_left_pressure_goal -hide 1
        $::history_one_graph element configure one_history_left_flow_goal -hide 1
        $::history_one_graph element configure one_history_left_flow_goal_2x -hide 1
        $::history_one_graph element configure one_history_left_temperature_goal -hide 1
        $::history_one_graph element configure one_history_left_zoom_temperature_goal -hide 1
        $::history_one_graph element configure one_history_right_pressure_goal -hide 1
        $::history_one_graph element configure one_history_right_flow_goal -hide 1
        $::history_one_graph element configure one_history_right_flow_goal_2x -hide 1
        $::history_one_graph element configure one_history_right_temperature_goal -hide 1
        $::history_one_graph element configure one_history_right_zoom_temperature_goal -hide 1
    }
    if {$::skin(history_goal) == 1} {
        if {[expr [history_left_espresso_elapsed length]] > 1 && [expr [history_right_espresso_elapsed length]] < 1} {
            $::history_one_graph element configure one_history_left_pressure_goal -hide 0
            $::history_one_graph element configure one_history_left_flow_goal -hide 0
            $::history_one_graph element configure one_history_left_flow_goal_2x -hide 0
            $::history_one_graph element configure one_history_left_temperature_goal -hide 0
            $::history_one_graph element configure one_history_left_zoom_temperature_goal -hide 0
            $::history_one_graph element configure one_history_right_pressure_goal -hide 1
            $::history_one_graph element configure one_history_right_flow_goal -hide 1
            $::history_one_graph element configure one_history_right_flow_goal_2x -hide 1
            $::history_one_graph element configure one_history_right_temperature_goal -hide 1
            $::history_one_graph element configure one_history_right_zoom_temperature_goal -hide 1
        }
        if {[expr [history_left_espresso_elapsed length]] < 1 && [expr [history_right_espresso_elapsed length]] > 1} {
            $::history_one_graph element configure one_history_left_pressure_goal -hide 1
            $::history_one_graph element configure one_history_left_flow_goal -hide 1
            $::history_one_graph element configure one_history_left_flow_goal_2x -hide 1
            $::history_one_graph element configure one_history_left_temperature_goal -hide 1
            $::history_one_graph element configure one_history_left_zoom_temperature_goal -hide 1
            $::history_one_graph element configure one_history_right_pressure_goal -hide 0
            $::history_one_graph element configure one_history_right_flow_goal -hide 0
            $::history_one_graph element configure one_history_right_flow_goal_2x -hide 0
            $::history_one_graph element configure one_history_right_temperature_goal -hide 0
            $::history_one_graph element configure one_history_right_zoom_temperature_goal -hide 0
        }
    }
    config_goal_label
}

proc config_history_graph {curve} {
    if {$::skin(history_enable_weight10th) == 0} {
        set ::skin(history_weight10th) 0
    }
    if {$curve == "goal"} {
        if {$::skin(history_goal) == 1} {
            $::history_left_graph element configure history_left_pressure_goal -hide 0
            $::history_left_graph element configure history_left_flow_goal -hide 0
            $::history_left_graph element configure history_left_flow_goal_2x -hide 0
            $::history_left_graph element configure history_left_temperature_goal -hide 0
            $::history_left_graph element configure history_left_zoom_temperature_goal -hide 0
            $::history_right_graph element configure history_right_pressure_goal -hide 0
            $::history_right_graph element configure history_right_flow_goal -hide 0
            $::history_right_graph element configure history_right_flow_goal_2x -hide 0
            $::history_right_graph element configure history_right_temperature_goal -hide 0
            $::history_right_graph element configure history_right_zoom_temperature_goal -hide 0
        } else {
            $::history_left_graph element configure history_left_pressure_goal -hide 1
            $::history_left_graph element configure history_left_flow_goal -hide 1
            $::history_left_graph element configure history_left_flow_goal_2x -hide 1
            $::history_left_graph element configure history_left_temperature_goal -hide 1
            $::history_left_graph element configure history_left_zoom_temperature_goal -hide 1
            $::history_right_graph element configure history_right_pressure_goal -hide 1
            $::history_right_graph element configure history_right_flow_goal -hide 1
            $::history_right_graph element configure history_right_flow_goal_2x -hide 1
            $::history_right_graph element configure history_right_temperature_goal -hide 1
            $::history_right_graph element configure history_right_zoom_temperature_goal -hide 1
        }
        check_one_graph_goals
        return
    }
    if {$curve == "y2"} {
        if {$::skin(history_show_y2_axis) == 0} {
            dui item config history history_graph_toggle_y2_label -initial_state disabled -state disabled
            $::history_left_graph element configure history_left_flow_2x -linewidth 0
            $::history_left_graph element configure history_left_flow_goal_2x -linewidth 0
            $::history_left_graph element configure history_left_weight_2x -linewidth 0
            $::history_right_graph element configure history_right_flow_2x -linewidth 0
            $::history_right_graph element configure history_right_flow_goal_2x -linewidth 0
            $::history_right_graph element configure history_right_weight_2x -linewidth 0
            $::history_one_graph element configure one_history_left_flow_2x -linewidth 0
            $::history_one_graph element configure one_history_left_flow_goal_2x -linewidth 0
            $::history_one_graph element configure one_history_left_weight_2x -linewidth 0
            $::history_one_graph element configure one_history_right_flow_2x -linewidth 0
            $::history_one_graph element configure one_history_right_flow_goal_2x -linewidth 0
            $::history_one_graph element configure one_history_right_weight_2x -linewidth 0

            $::history_left_graph element configure history_left_flow -linewidth [rescale_x_skin 9]
            $::history_left_graph element configure history_left_flow_goal -linewidth [rescale_x_skin 5]
            $::history_left_graph element configure history_left_weight -linewidth [rescale_x_skin 9]
            $::history_right_graph element configure history_right_flow -linewidth [rescale_x_skin 9]
            $::history_right_graph element configure history_right_flow_goal -linewidth [rescale_x_skin 5]
            $::history_right_graph element configure history_right_weight -linewidth [rescale_x_skin 9]
            $::history_one_graph element configure one_history_left_flow -linewidth [rescale_x_skin 10]
            $::history_one_graph element configure one_history_left_flow_goal -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_left_weight -linewidth [rescale_x_skin 10]
            $::history_one_graph element configure one_history_right_flow -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_right_flow_goal -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_right_weight -linewidth [rescale_x_skin 5]
            $::history_left_graph axis configure y2 -hide 1
            $::history_right_graph axis configure y2 -hide 1
            $::history_one_graph axis configure y2 -hide 1
            foreach f {espresso_flow espresso_flow_weight} {
                $::history_history_1 element configure history_1_${f} -linewidth [rescale_x_skin 5]
                $::history_history_2 element configure history_2_${f} -linewidth [rescale_x_skin 5]
                $::history_history_3 element configure history_3_${f} -linewidth [rescale_x_skin 5]
                $::history_history_4 element configure history_4_${f} -linewidth [rescale_x_skin 5]
                $::history_history_5 element configure history_5_${f} -linewidth [rescale_x_skin 5]
                $::history_history_6 element configure history_6_${f} -linewidth [rescale_x_skin 5]
                $::history_history_7 element configure history_7_${f} -linewidth [rescale_x_skin 5]
                $::history_history_8 element configure history_8_${f} -linewidth [rescale_x_skin 5]
                $::history_history_9 element configure history_9_${f} -linewidth [rescale_x_skin 5]
                $::history_history_10 element configure history_10_${f} -linewidth [rescale_x_skin 5]
            }
            foreach f {espresso_flow espresso_flow_weight} {
                $::history_history_1 element configure history_1_${f}_2x -linewidth 0
                $::history_history_2 element configure history_2_${f}_2x -linewidth 0
                $::history_history_3 element configure history_3_${f}_2x -linewidth 0
                $::history_history_4 element configure history_4_${f}_2x -linewidth 0
                $::history_history_5 element configure history_5_${f}_2x -linewidth 0
                $::history_history_6 element configure history_6_${f}_2x -linewidth 0
                $::history_history_7 element configure history_7_${f}_2x -linewidth 0
                $::history_history_8 element configure history_8_${f}_2x -linewidth 0
                $::history_history_9 element configure history_9_${f}_2x -linewidth 0
                $::history_history_10 element configure history_10_${f}_2x -linewidth 0
            }
            $::history_history_1 axis configure x -min 0.0
            $::history_history_2 axis configure x -min 0.0
            $::history_history_3 axis configure x -min 0.0
            $::history_history_4 axis configure x -min 0.0
            $::history_history_5 axis configure x -min 0.0
            $::history_history_6 axis configure x -min 0.0
            $::history_history_7 axis configure x -min 0.0
            $::history_history_8 axis configure x -min 0.0
            $::history_history_9 axis configure x -min 0.0
            $::history_history_10 axis configure x -min 0.0
        } else {
            dui item config history history_graph_toggle_y2_label -initial_state normal -state normal
            $::history_left_graph element configure history_left_flow_2x -linewidth [rescale_x_skin 9]
            $::history_left_graph element configure history_left_flow_goal_2x -linewidth [rescale_x_skin 5]
            $::history_left_graph element configure history_left_weight_2x -linewidth [rescale_x_skin 9]
            $::history_right_graph element configure history_right_flow_2x -linewidth [rescale_x_skin 9]
            $::history_right_graph element configure history_right_flow_goal_2x -linewidth [rescale_x_skin 5]
            $::history_right_graph element configure history_right_weight_2x -linewidth [rescale_x_skin 9]
            $::history_one_graph element configure one_history_left_flow_2x -linewidth [rescale_x_skin 10]
            $::history_one_graph element configure one_history_left_flow_goal_2x -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_left_weight_2x -linewidth [rescale_x_skin 10]
            $::history_one_graph element configure one_history_right_flow_2x -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_right_flow_goal_2x -linewidth [rescale_x_skin 5]
            $::history_one_graph element configure one_history_right_weight_2x -linewidth [rescale_x_skin 5]

            $::history_left_graph element configure history_left_flow -linewidth 0
            $::history_left_graph element configure history_left_flow_goal -linewidth 0
            $::history_left_graph element configure history_left_weight -linewidth 0
            $::history_right_graph element configure history_right_flow -linewidth 0
            $::history_right_graph element configure history_right_flow_goal -linewidth 0
            $::history_right_graph element configure history_right_weight -linewidth 0
            $::history_one_graph element configure one_history_left_flow -linewidth 0
            $::history_one_graph element configure one_history_left_flow_goal -linewidth 0
            $::history_one_graph element configure one_history_left_weight -linewidth 0
            $::history_one_graph element configure one_history_right_flow -linewidth 0
            $::history_one_graph element configure one_history_right_flow_goal -linewidth 0
            $::history_one_graph element configure one_history_right_weight -linewidth 0
            $::history_left_graph axis configure y2 -hide 0
            $::history_right_graph axis configure y2 -hide 0
            $::history_one_graph axis configure y2 -hide 0

            foreach f {espresso_flow espresso_flow_weight} {
                $::history_history_1 element configure history_1_${f} -linewidth 0
                $::history_history_2 element configure history_2_${f} -linewidth 0
                $::history_history_3 element configure history_3_${f} -linewidth 0
                $::history_history_4 element configure history_4_${f} -linewidth 0
                $::history_history_5 element configure history_5_${f} -linewidth 0
                $::history_history_6 element configure history_6_${f} -linewidth 0
                $::history_history_7 element configure history_7_${f} -linewidth 0
                $::history_history_8 element configure history_8_${f} -linewidth 0
                $::history_history_9 element configure history_9_${f} -linewidth 0
                $::history_history_10 element configure history_10_${f} -linewidth 0
            }
            foreach f {espresso_flow espresso_flow_weight} {
                $::history_history_1 element configure history_1_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_2 element configure history_2_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_3 element configure history_3_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_4 element configure history_4_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_5 element configure history_5_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_6 element configure history_6_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_7 element configure history_7_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_8 element configure history_8_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_9 element configure history_9_${f}_2x -linewidth [rescale_x_skin 5]
                $::history_history_10 element configure history_10_${f}_2x -linewidth [rescale_x_skin 5]
            }
            $::history_history_1 axis configure x -min 0.0
            $::history_history_2 axis configure x -min 0.0
            $::history_history_3 axis configure x -min 0.0
            $::history_history_4 axis configure x -min 0.0
            $::history_history_5 axis configure x -min 0.0
            $::history_history_6 axis configure x -min 0.0
            $::history_history_7 axis configure x -min 0.0
            $::history_history_8 axis configure x -min 0.0
            $::history_history_9 axis configure x -min 0.0
            $::history_history_10 axis configure x -min 0.0
        }
        return
    }
    if {$::skin(history_${curve}) == 0} {
        dui item config history history_${curve}_key -initial_state disabled -state disabled
        $::history_left_graph element configure history_left_${curve} -hide 1
        $::history_one_graph element configure one_history_left_${curve} -hide 1
        if {$curve == "temperature"} {
            $::history_left_graph element configure history_left_temperature10th -hide 1
            $::history_one_graph element configure one_history_left_temperature10th -hide 1
        }
        $::history_right_graph element configure history_right_${curve} -hide 1
        $::history_one_graph element configure one_history_right_${curve} -hide 1
        if {$curve == "temperature"} {
            $::history_right_graph element configure history_right_temperature10th -hide 1
            $::history_one_graph element configure one_history_right_temperature10th -hide 1
        }
    } else {
        dui item config history history_${curve}_key -initial_state normal -state normal
        $::history_left_graph element configure history_left_${curve} -hide 0
        $::history_one_graph element configure one_history_left_${curve} -hide 0
        if {$curve == "temperature"} {
            $::history_left_graph element configure history_left_temperature10th -hide 0
            $::history_one_graph element configure one_history_left_temperature10th -hide 0
        }
        $::history_right_graph element configure history_right_${curve} -hide 0
        $::history_one_graph element configure one_history_right_${curve} -hide 0
        if {$curve == "temperature"} {
            $::history_right_graph element configure history_right_temperature10th -hide 0
            $::history_one_graph element configure one_history_right_temperature10th -hide 0
        }
    }
}

proc check_history_graph {} {
    if {$::skin(history_enable_weight10th) == 0} {
        set ::skin(history_weight10th) 0
    }
    foreach key {pressure flow weight temperature resistance steps goal y2 weight10th} {
        config_history_graph $key
    }
}

set ::history_zoomed 0

proc history_temperature_zoom {} {
    set ::history_zoomed 1
    $::history_left_graph axis configure y2 -hide 1
    $::history_left_graph axis configure y -color $::skin_red -tickfont [skin_font font [fixed_size 14]] -title "[translate "temperature"] °C" -titlecolor $::skin_red -titlefont [skin_font font [fixed_size 14]]  -min 70 -max 100 -subdivisions 1 -majorticks {70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100} -hide 0;
    $::history_right_graph axis configure y2 -hide 1
    $::history_right_graph axis configure y -color $::skin_red -tickfont [skin_font font [fixed_size 14]] -title "[translate "temperature"] °C" -titlecolor $::skin_red -titlefont [skin_font font [fixed_size 14]]  -min 70 -max 100 -subdivisions 1 -majorticks {70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100} -hide 0;
    $::history_one_graph axis configure y2 -hide 1
    $::history_one_graph axis configure y -color $::skin_red -tickfont [skin_font font [fixed_size 14]] -title "[translate "temperature"] °C" -titlecolor $::skin_red -titlefont [skin_font font [fixed_size 14]]  -min 70 -max 100 -subdivisions 1 -majorticks {70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100} -hide 0;
    dui item config history history_zoom_temperature_state -state disabled
    dui item config history history_temperature_key -state normal
    dui item config history history_zoomed_temperature_key_button* -initial_state normal -state normal
}

proc hide_history_temperature_zoom {} {
    set ::history_zoomed 0
    if {$::skin(show_y2_axis) == 1} {
        $::history_left_graph axis configure y2 -hide 0
        $::history_right_graph axis configure y2 -hide 0
        $::history_one_graph axis configure y2 -hide 0
    }
    $::history_left_graph axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "" -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $::history_right_graph axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "" -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $::history_one_graph axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "" -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    dui item config history history_zoom_temperature_state -state normal
    dui item config history history_zoomed_temperature_key_button* -initial_state hidden -state hidden
    check_history_y_resolution
    check_history_graph
}

proc history_highlight_curve { curve } {
    if {$::skin(history_$curve) == 0} {
        return
    }
    foreach key {pressure flow weight weight10th temperature resistance} {
        set ::history_backup(${key}_curve_state) $::skin(history_${key})
        if {$::skin(history_${key}) > 0 && $curve != $key} {
            set ::skin(history_${key}) 0
            config_history_graph $key
        }
    }
    dui item config history history_highlight_return_button* -state normal

}

proc exit_history_highlight_curve {} {
    foreach key {pressure flow weight weight10th temperature resistance} {

        set ::skin(history_${key}) $::history_backup(${key}_curve_state)
        config_history_graph $key
    }
    dui item config history history_highlight_return_button* -state hidden
}

dui add variable history 1280 160 -font [skin_font font 34] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -textvariable {DSx2 History Viewer}

set ::history_data_y 1100
set ::history_graphs_row1 1128
set ::history_preview_data_y_row1 1346
set ::history_graphs_row2 1362
set ::history_preview_data_y_row2 1578

dui add variable history 680 $::history_data_y -anchor center -font [skin_font font [fixed_size 15]] -fill $::history_left_colour -tags left_graph_data -textvariable {[history_left_graph_info]}
dui add variable history 1930 $::history_data_y -anchor center -font [skin_font font [fixed_size 15]] -fill $::history_right_colour -tags right_graph_data -textvariable {[history_right_graph_info]}

dui add variable history 60 $::history_preview_data_y_row1 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg1_p history_1_data} -textvariable {[name_length $::history_1_profile_title 20]}
dui add variable history 490 $::history_preview_data_y_row1 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg1_d history_1_data} -textvariable {[cache_date_time_format $::history_1_clock]}

dui add variable history 520 $::history_preview_data_y_row1 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg2_p history_2_data} -textvariable {[name_length $::history_2_profile_title 20]}
dui add variable history 950 $::history_preview_data_y_row1 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg2_d history_2_data} -textvariable {[cache_date_time_format $::history_2_clock]}

dui add variable history 980 $::history_preview_data_y_row1 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg3_p history_3_data} -textvariable {[name_length $::history_3_profile_title 20]}
dui add variable history 1410 $::history_preview_data_y_row1 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg3_d history_3_data} -textvariable {[cache_date_time_format $::history_3_clock]}

dui add variable history 1440 $::history_preview_data_y_row1 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg4_p history_4_data} -textvariable {[name_length $::history_4_profile_title 20]}
dui add variable history 1870 $::history_preview_data_y_row1 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg4_d history_4_data} -textvariable {[cache_date_time_format $::history_4_clock]}

dui add variable history 1900 $::history_preview_data_y_row1 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg5_p history_5_data} -textvariable {[name_length $::history_5_profile_title 20]}
dui add variable history 2330 $::history_preview_data_y_row1 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg5_d history_5_data} -textvariable {[cache_date_time_format $::history_5_clock]}

dui add variable history 60 $::history_preview_data_y_row2 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg6_p history_6_data} -textvariable {[name_length $::history_6_profile_title 20]}
dui add variable history 490 $::history_preview_data_y_row2 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg6_d history_6_data} -textvariable {[cache_date_time_format $::history_6_clock]}

dui add variable history 520 $::history_preview_data_y_row2 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg7_p history_7_data} -textvariable {[name_length $::history_7_profile_title 20]}
dui add variable history 950 $::history_preview_data_y_row2 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg7_d history_7_data} -textvariable {[cache_date_time_format $::history_7_clock]}

dui add variable history 980 $::history_preview_data_y_row2 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg8_p history_8_data} -textvariable {[name_length $::history_8_profile_title 20]}
dui add variable history 1410 $::history_preview_data_y_row2 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg8_d history_8_data} -textvariable {[cache_date_time_format $::history_8_clock]}

dui add variable history 1440 $::history_preview_data_y_row2 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg9_p history_9_data} -textvariable {[name_length $::history_9_profile_title 20]}
dui add variable history 1870 $::history_preview_data_y_row2 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg9_d history_9_data} -textvariable {[cache_date_time_format $::history_9_clock]}

dui add variable history 1900 $::history_preview_data_y_row2 -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg10_p history_10_data} -textvariable {[name_length $::history_10_profile_title 20]}
dui add variable history 2330 $::history_preview_data_y_row2 -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -tags {hg10_d history_10_data} -textvariable {[cache_date_time_format $::history_10_clock]}

set ::key_font_size [fixed_size 14]
dui add shape oval history $::skin_history_graph_key_x [expr $::skin_history_graph_key_y + 2] [expr $::skin_history_graph_key_x + 40] [expr $::skin_history_graph_key_y + 18] -outline $::skin_green -fill $::skin_green -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {history_pressure_icon history_pressure_key history_zoom_temperature_state history_key_buttons}
dui add shape oval history [expr $::skin_history_graph_key_x + 250 + 30] [expr $::skin_history_graph_key_y + 2] [expr $::skin_history_graph_key_x + 250 + 40 + 30] [expr $::skin_history_graph_key_y + 18] -outline $::skin_blue -fill $::skin_blue -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {history_flow_icon history_flow_key history_zoom_temperature_state history_key_buttons}
dui add shape oval history [expr $::skin_history_graph_key_x + 500 + 60] [expr $::skin_history_graph_key_y + 2] [expr $::skin_history_graph_key_x + 500 + 40 + 60] [expr $::skin_history_graph_key_y + 18] -outline $::skin_brown -fill $::skin_brown -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {history_weight_icon history_weight_key history_zoom_temperature_state history_key_buttons}
dui add shape oval history [expr $::skin_history_graph_key_x + 750 + 90] [expr $::skin_history_graph_key_y + 2] [expr $::skin_history_graph_key_x + 750 + 40 + 90] [expr $::skin_history_graph_key_y + 18] -outline $::skin_red -fill $::skin_red -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {history_temperature_icon history_temperature_key history_key_buttons}
dui add shape oval history [expr $::skin_history_graph_key_x + 1000 + 120] [expr $::skin_history_graph_key_y + 2] [expr $::skin_history_graph_key_x + 1000 + 40 + 120] [expr $::skin_history_graph_key_y + 18] -outline $::skin_yellow -fill $::skin_yellow -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {history_resistance_icon history_resistance_key history_zoom_temperature_state history_key_buttons}
dui add variable history [expr $::skin_history_graph_key_x + 58] [expr $::skin_history_graph_key_y + 12] -tags {history_pressure_text history_pressure_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[translate "pressure"]}
dui add variable history [expr $::skin_history_graph_key_x + 270 + 38 + 30] [expr $::skin_history_graph_key_y + 12] -tags {history_flow_text history_flow_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[translate "flow rate"]}
dui add variable history [expr $::skin_history_graph_key_x + 520 + 38 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_weight_text history_weight_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[translate "scale rate"]}
dui add variable history [expr $::skin_history_graph_key_x + 770 + 38 + 90] [expr $::skin_history_graph_key_y + 12] -tags {history_temperature_text history_temperature_key history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[translate "temperature"]}
dui add variable history [expr $::skin_history_graph_key_x + 1020 + 38 + 120] [expr $::skin_history_graph_key_y + 12] -tags {history_resistance_text history_resistance_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[translate "resistance"]}
dui add dbutton history $::skin_history_graph_key_x [expr $::skin_history_graph_key_y - 40] \
    -bwidth 210 -bheight 110 -tags {history_pressure_key_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph pressure} -longpress_cmd {history_highlight_curve pressure}
dui add dbutton history [expr $::skin_history_graph_key_x + 250 + 30] [expr $::skin_history_graph_key_y - 40] \
    -bwidth 210 -bheight 110 -tags {history_flow_key_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph flow} -longpress_cmd {history_highlight_curve flow}
dui add dbutton history [expr $::skin_history_graph_key_x + 500 + 60] [expr $::skin_history_graph_key_y - 40] \
    -bwidth 210 -bheight 110 -tags {history_weight_key_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph weight} -longpress_cmd {history_highlight_curve weight}

dui add dbutton history [expr $::skin_history_graph_key_x + 750 + 90] [expr $::skin_history_graph_key_y - 40] \
    -bwidth 210 -bheight 110 -tags {history_temperature_key_button history_key_buttons} \
    -command {toggle_history_graph temperature} -longpress_cmd {history_temperature_zoom}

dui add dbutton history 0 0 \
    -bwidth 2560 -bheight 600 -tags {history_zoomed_temperature_key_button history_key_buttons} -initial_state hidden \
    -command {hide_history_temperature_zoom} -longpress_cmd {hide_history_temperature_zoom}

dui add dbutton history [expr $::skin_history_graph_key_x + 1000 + 120] [expr $::skin_history_graph_key_y - 40] \
    -bwidth 210 -bheight 110 -tags {history_resistance_key_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph resistance} -longpress_cmd {history_highlight_curve resistance}

dui add variable history [expr $::skin_history_graph_key_x + 1350 + 38 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_steps_text history_steps_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -width 880 -textvariable {[translate "steps"]}

dui add dbutton history [expr $::skin_history_graph_key_x + 1350 + 38] [expr $::skin_history_graph_key_y - 40] \
    -bwidth 120 -bheight 110 -tags {history_steps_key_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph steps}


dui add variable history [expr $::skin_history_graph_key_x + 1470 + 48 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_graph_toggle_goal_label history_goal_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -textvariable {[translate "goals"]}

dui add dbutton history [expr $::skin_history_graph_key_x + 1470 + 48] [expr $::skin_history_graph_key_y  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {history_graph_toggle_goal_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph_goals}

dui add variable history [expr $::skin_history_graph_key_x + 1590 + 66 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_graph_toggle_y2_label history_y2_key history_zoom_temperature_state history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -textvariable {[translate "y2 axis"]}

dui add dbutton history [expr $::skin_history_graph_key_x + 1590 + 68] [expr $::skin_history_graph_key_y  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {history_graph_toggle_y2_button  history_zoom_temperature_state history_key_buttons} \
    -command {toggle_history_graph_y2}

dui add dbutton history 0 0 \
    -bwidth 2560 -bheight 600 -tags history_highlight_return_button -initial_state hidden \
    -command {exit_history_highlight_curve} -longpress_cmd {exit_history_highlight_curve}

dui add variable history [expr $::skin_history_graph_key_x + 1890 + 0 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_clear_left_label history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_disabled_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -textvariable {[translate "clear left"]}

dui add dbutton history [expr $::skin_history_graph_key_x + 1890 + 0] [expr $::skin_history_graph_key_y  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {history_clear_left_button history_key_buttons}\
    -command {clear_history_graphs left; check_one_graph_goals; check_history_selected_colour; dui item config history history_clear_left_label -fill $::skin_disabled_colour}

dui add variable history [expr $::skin_history_graph_key_x + 2090 + 0 + 60] [expr $::skin_history_graph_key_y + 12] -tags {history_clear_right_label history_key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_disabled_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -textvariable {[translate "clear right"]}

dui add dbutton history [expr $::skin_history_graph_key_x + 2090 + 0] [expr $::skin_history_graph_key_y  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {history_clear_right_button history_key_buttons}\
    -command {clear_history_graphs right; check_one_graph_goals; check_history_selected_colour; dui item config history history_clear_right_label -fill $::skin_disabled_colour}


dui add dbutton history [expr $::skin_history_graph_key_x + 2290 + 26] [expr $::skin_history_graph_key_y  - 30] \
    -shape round -radius $::skin_button_radius -width 2 -fill $::skin_foreground_colour \
    -label [translate "EXIT"] -label_font [skin_font font 18] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -bwidth 110 -bheight 80 -initial_state normal -tags {history_exit_button history_zoom_temperature_state history_key_buttons}\
    -command {if {$::de1_num_state($::de1(state)) == "Sleep"} {page_show saver;} else {set_next_page off off; start_idle; page_show off;}}

proc config_goal_label {} {
    if {$::skin(history_one_graph) == 1 && ([expr [history_left_espresso_elapsed length]] > 1 && [expr [history_right_espresso_elapsed length]] > 1)} {
        dui item config history history_graph_toggle_goal_label -initial_state disabled -state disabled
    }
    if {$::skin(history_one_graph) == 1 && $::skin(history_goal) == 1 && ([expr [history_left_espresso_elapsed length]] < 1 || [expr [history_right_espresso_elapsed length]] < 1)} {
        dui item config history history_graph_toggle_goal_label -initial_state normal -state normal
    }
    if {$::skin(history_one_graph) == 0 && $::skin(history_goal) == 1} {
        dui item config history history_graph_toggle_goal_label -initial_state normal -state normal
    }
    if {$::skin(history_goal) == 0} {
        dui item config history history_graph_toggle_goal_label -initial_state disabled -state disabled
    }

}

if {[expr $::skin_version < 1.29]} {
    proc skin_moveby { page_or_id_or_widget tags {x_change {}} {y_change {}} } {
        set can [dui canvas]
        set items [dui item get $page_or_id_or_widget $tags]
        if { $tags eq {} } {
            set page [lindex [pages [lindex $items 0]] 0]
        } else {
            set page [lindex $page_or_id_or_widget 0]
        }
        if { $x_change ne {} } {
            set x_change [dui::page::calc_x $page $x_change]
        }
        if { $y_change ne {} } {
            set y_change [dui::page::calc_y $page $y_change]
        }
        foreach id $items {
            lassign [$can coords $id] x0 y0 x1 y1
            if { $x_change eq {} } {
                set nx0 $x0
                set nx1 $x1
            } else {
                set nx0 [expr {$x0+$x_change}]
                if { $x1 ne {} } {
                    set nx1 [expr {$x1+$x_change}]
                }
            }
            if { $y_change eq {} } {
                set ny0 $y0
                set ny1 $y1
            } else {
                set ny0 [expr {$y0+$y_change}]
                if { $y1 ne {} } {
                    set ny1 [expr {$y1+$y_change}]
                }
            }
            if { $x1 eq {} || $y1 eq {} } {
                $can coords $id $nx0 $ny0
            } else {
                $can coords $id $nx0 $ny0 $nx1 $ny1
            }
        }
    }
}

proc toggle_history_graphs {} {
    if {$::skin(history_one_graph) == 0} {
        set ::skin(history_one_graph) 1
        skin_moveby history {history_key_buttons} {} -340
    } else {
        set ::skin(history_one_graph) 0
        skin_moveby history {history_key_buttons} {} 340
    }
    show_history_graph
    skin_save skin
}

proc show_history_graph {} {
    if {$::skin(history_one_graph) == 0} {
        .can itemconfigure $::history_one_graph -state hidden
        dui item config history history_one_graph -initial_state hidden
        .can itemconfigure $::history_left_graph -state normal
        dui item config history history_left_graph -initial_state normal
        .can itemconfigure $::history_right_graph -state normal
        dui item config history history_right_graph -initial_state normal
    } else {
        .can itemconfigure $::history_one_graph -state normal
        dui item config history history_one_graph -initial_state normal
        .can itemconfigure $::history_left_graph -state hidden
        dui item config history history_left_graph -initial_state hidden
        .can itemconfigure $::history_right_graph -state hidden
        dui item config history history_right_graph -initial_state hidden
    }
    config_goal_label
}

proc toggle_history_y_resolution {} {
    if {$::skin(history_y_res) == 0} {
        set ::skin(history_y_res) 1
    } elseif {$::skin(history_y_res) == 1} {
        set ::skin(history_y_res) 2
    } else {
        set ::skin(history_y_res) 0
    }
    skin_save skin
    check_history_y_resolution
}

proc check_history_y_resolution {} {
    if {$::skin(history_y_res) == 0} {
        $::history_left_graph axis configure y -majorticks {0  2  4  6  8  10  12}
        $::history_right_graph axis configure y -majorticks {0  2  4  6  8  10  12}
        $::history_one_graph axis configure y -majorticks {0  2  4  6  8  10  12}
        $::history_left_graph axis configure y2 -majorticks {0 1 2 3 4 5}
        $::history_right_graph axis configure y2 -majorticks {0 1 2 3 4 5}
        $::history_one_graph axis configure y2 -majorticks {0 1 2 3 4 5}
    }
    if {$::skin(history_y_res) == 1} {
        $::history_left_graph axis configure y -majorticks {0 1 2 3 4 5 6 7 8 9 10}
        $::history_right_graph axis configure y -majorticks {0 1 2 3 4 5 6 7 8 9 10}
        $::history_one_graph axis configure y -majorticks {0 1 2 3 4 5 6 7 8 9 10}
        $::history_left_graph axis configure y2 -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5}
        $::history_right_graph axis configure y2 -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5}
        $::history_one_graph axis configure y2 -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5}
    }
    if {$::skin(history_y_res) == 2} {
        $::history_left_graph axis configure y -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10}
        $::history_right_graph axis configure y -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10}
        $::history_one_graph axis configure y -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10}
        $::history_left_graph axis configure y2 -majorticks {0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5}
        $::history_right_graph axis configure y2 -majorticks {0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5}
        $::history_one_graph axis configure y2 -majorticks {0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5}
    }
}

add_de1_widget "history" graph 30 100 {
    set ::history_one_graph $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_x_skin 100] && $::history_zoomed == 0} {
            toggle_history_y_resolution
        } else {
            toggle_history_graphs
        }
    }
    $widget element create one_history_left_zoom_temperature -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 10] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_zoom_temperature_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_left_pressure_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create one_history_left_flow_goal  -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create one_history_left_temperature_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_left_pressure -xdata history_left_espresso_elapsed -ydata history_left_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_flow -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_weight -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_temperature -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 10] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_temperature10th -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 10] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_weight10th -xdata history_left_espresso_elapsed -ydata history_left_espresso_weight10th -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_left_resistance -xdata history_left_espresso_elapsed -ydata history_left_espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create one_history_left_steps -xdata history_left_espresso_elapsed -ydata history_left_espresso_state_change -label "" -linewidth [rescale_x_skin 8] -color $::skin_grey  -pixels 0 ;
    $widget element create one_history_left_flow_goal_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_left_flow_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_left_weight_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget element create one_history_right_zoom_temperature -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_zoom_temperature_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 3] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_pressure_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_flow_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_temperature_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_pressure -xdata history_right_espresso_elapsed -ydata history_right_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_flow -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_weight -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_temperature -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_temperature10th -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_weight10th -xdata history_right_espresso_elapsed -ydata history_right_espresso_weight10th -symbol none -label ""  -linewidth [rescale_x_skin 3] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_resistance -xdata history_right_espresso_elapsed -ydata history_right_espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create one_history_right_steps -xdata history_right_espresso_elapsed -ydata history_right_espresso_state_change -label "" -linewidth [rescale_x_skin 4] -color $::skin_grey  -pixels 0 ;
    $widget element create one_history_right_flow_goal_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create one_history_right_flow_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create one_history_right_weight_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 1;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 2500] -height [rescale_y_skin 990] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags history_one_graph


add_de1_widget "history" graph 30 440 {
    set ::history_left_graph $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_x_skin 100] && $::history_zoomed == 0} {
            toggle_history_y_resolution
        } else {
            toggle_history_graphs
        }
    }
    $widget element create history_left_zoom_temperature -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_zoom_temperature_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_left_pressure_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create history_left_flow_goal  -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create history_left_temperature_goal -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_left_pressure -xdata history_left_espresso_elapsed -ydata history_left_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_flow -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_weight -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_temperature -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_temperature10th -xdata history_left_espresso_elapsed -ydata history_left_espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_weight10th -xdata history_left_espresso_elapsed -ydata history_left_espresso_weight10th -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_left_resistance -xdata history_left_espresso_elapsed -ydata history_left_espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create history_left_steps -xdata history_left_espresso_elapsed -ydata history_left_espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;
    $widget element create history_left_flow_goal_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_left_flow_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_left_weight_2x -xdata history_left_espresso_elapsed -ydata history_left_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 1;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1250] -height [rescale_y_skin 650] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags history_left_graph


add_de1_widget "history" graph 1280 440 {
    set ::history_right_graph $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_x_skin 100] && $::history_zoomed == 0} {
            toggle_history_y_resolution
        } else {
            toggle_history_graphs
        }
    }
    $widget element create history_right_zoom_temperature -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_zoom_temperature_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_right_pressure_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create history_right_flow_goal  -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create history_right_temperature_goal -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_right_pressure -xdata history_right_espresso_elapsed -ydata history_right_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_flow  -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_weight  -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_temperature -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_temperature10th -xdata history_right_espresso_elapsed -ydata history_right_espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_weight10th -xdata history_right_espresso_elapsed -ydata history_right_espresso_weight10th -symbol none -label ""  -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_right_resistance  -xdata history_right_espresso_elapsed -ydata history_right_espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create history_right_steps -xdata history_right_espresso_elapsed -ydata history_right_espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;
    $widget element create history_right_flow_goal_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create history_right_flow_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_right_weight_2x -xdata history_right_espresso_elapsed -ydata history_right_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 9] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 1;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1250] -height [rescale_y_skin 650] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags history_right_graph


#dui add variable history 180 100 -font [skin_font font 34] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -textvariable {$::xxx}



proc skin_graph_tap { a } {
    return [expr $a * 1280 / $::settings(screen_size_width)]
}



add_de1_widget history graph 40 $::history_graphs_row1 {
    set ::history_history_1 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 380} {
                load_to_history left history_1
            } else {
                load_to_history right history_1
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_1
            } else {
                load_to_history right history_1
            }
        }
    }
    $widget element create history_1_espresso_pressure -xdata history_1_espresso_elapsed -ydata history_1_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_1_espresso_flow -xdata history_1_espresso_elapsed -ydata history_1_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_1_espresso_flow_weight -xdata history_1_espresso_elapsed -ydata history_1_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_1_espresso_state_change -xdata history_1_espresso_elapsed -ydata history_1_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10} -hide 0;

    $widget element create history_1_espresso_flow_2x -xdata history_1_espresso_elapsed -ydata history_1_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_1_espresso_flow_weight_2x -xdata history_1_espresso_elapsed -ydata history_1_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_1

add_de1_widget history graph 500 $::history_graphs_row1 {
    set ::history_history_2 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 380} {
                load_to_history left history_2
            } else {
                load_to_history right history_2
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_2
            } else {
                load_to_history right history_2
            }
        }
    }
    $widget element create history_2_espresso_pressure -xdata history_2_espresso_elapsed -ydata history_2_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_2_espresso_flow -xdata history_2_espresso_elapsed -ydata history_2_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_2_espresso_flow_weight -xdata history_2_espresso_elapsed -ydata history_2_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_2_espresso_state_change -xdata history_2_espresso_elapsed -ydata history_2_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_2_espresso_flow_2x -xdata history_2_espresso_elapsed -ydata history_2_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_2_espresso_flow_weight_2x -xdata history_2_espresso_elapsed -ydata history_2_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_2

add_de1_widget history graph 960 $::history_graphs_row1 {
    set ::history_history_3 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 620} {
                load_to_history left history_3
            } else {
                load_to_history right history_3
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_3
            } else {
                load_to_history right history_3
            }
        }
    }
    $widget element create history_3_espresso_pressure -xdata history_3_espresso_elapsed -ydata history_3_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_3_espresso_flow -xdata history_3_espresso_elapsed -ydata history_3_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_3_espresso_flow_weight -xdata history_3_espresso_elapsed -ydata history_3_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_3_espresso_state_change -xdata history_3_espresso_elapsed -ydata history_3_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_3_espresso_flow_2x -xdata history_3_espresso_elapsed -ydata history_3_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_3_espresso_flow_weight_2x -xdata history_3_espresso_elapsed -ydata history_3_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

$widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_3

add_de1_widget history graph 1420 $::history_graphs_row1 {
    set ::history_history_4 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 840} {
                load_to_history left history_4
            } else {
                load_to_history right history_4
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_4
            } else {
                load_to_history right history_4
            }
        }
    }
    $widget element create history_4_espresso_pressure -xdata history_4_espresso_elapsed -ydata history_4_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_4_espresso_flow -xdata history_4_espresso_elapsed -ydata history_4_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_4_espresso_flow_weight -xdata history_4_espresso_elapsed -ydata history_4_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_4_espresso_state_change -xdata history_4_espresso_elapsed -ydata history_4_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_4_espresso_flow_2x -xdata history_4_espresso_elapsed -ydata history_4_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_4_espresso_flow_weight_2x -xdata history_4_espresso_elapsed -ydata history_4_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

$widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_4

add_de1_widget history graph 1880 $::history_graphs_row1 {
    set ::history_history_5 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 1070} {
                load_to_history left history_5
            } else {
                load_to_history right history_5
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_5
            } else {
                load_to_history right history_5
            }
        }
    }
    $widget element create history_5_espresso_pressure -xdata history_5_espresso_elapsed -ydata history_5_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_5_espresso_flow -xdata history_5_espresso_elapsed -ydata history_5_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_5_espresso_flow_weight -xdata history_5_espresso_elapsed -ydata history_5_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_5_espresso_state_change -xdata history_5_espresso_elapsed -ydata history_5_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_5_espresso_flow_2x -xdata history_5_espresso_elapsed -ydata history_5_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_5_espresso_flow_weight_2x -xdata history_5_espresso_elapsed -ydata history_5_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

$widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_5

add_de1_widget history graph 40 $::history_graphs_row2 {
    set ::history_history_6 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 380} {
                load_to_history left history_6
            } else {
                load_to_history right history_6
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_6
            } else {
                load_to_history right history_6
            }
        }
    }
    $widget element create history_6_espresso_pressure -xdata history_6_espresso_elapsed -ydata history_6_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_6_espresso_flow -xdata history_6_espresso_elapsed -ydata history_6_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_6_espresso_flow_weight -xdata history_6_espresso_elapsed -ydata history_6_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_6_espresso_state_change -xdata history_6_espresso_elapsed -ydata history_6_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_6_espresso_flow_2x -xdata history_6_espresso_elapsed -ydata history_6_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_6_espresso_flow_weight_2x -xdata history_6_espresso_elapsed -ydata history_6_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_6

add_de1_widget history graph 500 $::history_graphs_row2 {
    set ::history_history_7 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 380} {
                load_to_history left history_7
            } else {
                load_to_history right history_7
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_7
            } else {
                load_to_history right history_7
            }
        }
    }
    $widget element create history_7_espresso_pressure -xdata history_7_espresso_elapsed -ydata history_7_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_7_espresso_flow -xdata history_7_espresso_elapsed -ydata history_7_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_7_espresso_flow_weight -xdata history_7_espresso_elapsed -ydata history_7_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_7_espresso_state_change -xdata history_7_espresso_elapsed -ydata history_7_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_7_espresso_flow_2x -xdata history_7_espresso_elapsed -ydata history_7_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_7_espresso_flow_weight_2x -xdata history_7_espresso_elapsed -ydata history_7_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y7_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_7

add_de1_widget history graph 960 $::history_graphs_row2 {
    set ::history_history_8 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 620} {
                load_to_history left history_8
            } else {
                load_to_history right history_8
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_8
            } else {
                load_to_history right history_8
            }
        }
    }
    $widget element create history_8_espresso_pressure -xdata history_8_espresso_elapsed -ydata history_8_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_8_espresso_flow -xdata history_8_espresso_elapsed -ydata history_8_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_8_espresso_flow_weight -xdata history_8_espresso_elapsed -ydata history_8_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_8_espresso_state_change -xdata history_8_espresso_elapsed -ydata history_8_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_8_espresso_flow_2x -xdata history_8_espresso_elapsed -ydata history_8_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_8_espresso_flow_weight_2x -xdata history_8_espresso_elapsed -ydata history_8_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_8

add_de1_widget history graph 1420 $::history_graphs_row2 {
    set ::history_history_9 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 840} {
                load_to_history left history_9
            } else {
                load_to_history right history_9
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_9
            } else {
                load_to_history right history_9
            }
        }
    }
    $widget element create history_9_espresso_pressure -xdata history_9_espresso_elapsed -ydata history_9_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_9_espresso_flow -xdata history_9_espresso_elapsed -ydata history_9_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_9_espresso_flow_weight -xdata history_9_espresso_elapsed -ydata history_9_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_9_espresso_state_change -xdata history_9_espresso_elapsed -ydata history_9_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_9_espresso_flow_2x -xdata history_9_espresso_elapsed -ydata history_9_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_9_espresso_flow_weight_2x -xdata history_9_espresso_elapsed -ydata history_9_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_9

add_de1_widget history graph 1880 $::history_graphs_row2 {
    set ::history_history_10 $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        set ::xxx [skin_graph_tap $x]
        if {$::xxx > 260} {
            if {$::xxx < 1070} {
                load_to_history left history_10
            } else {
                load_to_history right history_10
            }
        } else {
            if {$x < [rescale_x_skin 260]} {
                load_to_history left history_10
            } else {
                load_to_history right history_10
            }
        }
    }
    $widget element create history_10_espresso_pressure -xdata history_10_espresso_elapsed -ydata history_10_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 5] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_10_espresso_flow -xdata history_10_espresso_elapsed -ydata history_10_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 5] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_10_espresso_flow_weight -xdata history_10_espresso_elapsed -ydata history_10_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create history_10_espresso_state_change -xdata history_10_espresso_elapsed -ydata history_10_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create history_10_espresso_flow_2x -xdata history_10_espresso_elapsed -ydata history_10_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create history_10_espresso_flow_weight_2x -xdata history_10_espresso_elapsed -ydata history_10_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    #$widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 480] -height [rescale_y_skin 210] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags history_history_10

dui add dtext history 2450 1310 -text [translate "showing"] -font [skin_font font 12] -fill $::skin_text_colour -anchor center
dui add variable history 2450 1348 -fill $::skin_text_colour -font [skin_font font 14] -anchor center -textvariable {[history_pos_showing]}
add_colour_button history_scroll_up history 2400 1180 100 100 \Uf106 {scroll_history -5; check_history_selected_colour}; set_button  history_scroll_up font [skin_font awesome_light [fixed_size 34]]
add_colour_button history_scroll_down history 2400 1380 100 100 \Uf107 {scroll_history 5; check_history_selected_colour}; set_button  history_scroll_down font [skin_font awesome_light [fixed_size 34]]


get_history_data $::skin(history_position)
if {$::skin(history_one_graph) == 1} {
    skin_moveby history {history_key_buttons} {} -340
}
check_history_graph
show_history_graph

dui add variable history 2540 1580 -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {v$::history_viewer_version}



### settings
proc toggle_enable_weight10th {} {
    if {$::skin(history_enable_weight10th) == 0} {
        set ::skin(history_weight10th) 0
    } else {
        set ::skin(history_weight10th) $::skin(history_weight)
    }
    config_history_graph weight10th
    skin_save skin
}

proc set_history_sch { value } {
    set ::skin(history_sch_limit) [expr $::skin(history_sch_limit) + $value]
    if {$::skin(history_sch_limit) < 50} {
        set ::skin(history_sch_limit) 50
    }
    if {$::skin(history_sch_limit) > 500} {
        set ::skin(history_sch_limit) 500
    }
    if {$::history_count < $::skin(history_sch_limit)} {
        set ::skin(history_sch_limit) $::history_count
    }
}

dui add variable skin_hv_settings 1280 160 -font [skin_font font 34] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -textvariable {DSx2 History Viewer Settings}

dui add dbutton history [expr $::skin_history_graph_key_x + 2290 + 26] 150 \
    -shape round -radius $::skin_button_radius -width 2 -fill $::skin_foreground_colour \
    -label $::skin(icon_edit) -label_font [skin_font awesome_light [fixed_size 20]] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -bwidth 110 -bheight 80 -initial_state normal -tags {history_settings_button history_zoom_temperature_state history_key_buttons}\
    -command {page_show skin_hv_settings}

dui add dbutton skin_hv_settings [expr $::skin_history_graph_key_x + 2290 + 26] 150 \
    -shape round -radius $::skin_button_radius -width 2 -fill $::skin_foreground_colour \
    -label [translate "EXIT"] -label_font [skin_font awesome_light [fixed_size 20]] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -bwidth 110 -bheight 80 -initial_state normal -tags {history_settings_button history_zoom_temperature_state history_key_buttons}\
    -command {page_show history}

dui add dtext skin_hv_settings 1180 630 -font [skin_font font 18] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor e -text [translate "show weight curves"]

dui add dtoggle skin_hv_settings 1220 600 -anchor nw \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::skin(history_enable_weight10th) \
    -command {toggle_enable_weight10th}

dui add dtext skin_hv_settings 1180 860 -font [skin_font font 18] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor e -text [translate "search limit"]

dui add variable skin_hv_settings 1280 860 -fill $::skin_text_colour -font [skin_font font 20] -anchor center -textvariable {$::skin(history_sch_limit)}
add_colour_button history_sch_up skin_hv_settings 1230 720 100 100 \Uf106 {set_history_sch -50 }; set_button  history_sch_up font [skin_font awesome_light [fixed_size 34]]
add_colour_button history_sch_down skin_hv_settings 1230 900 100 100 \Uf107 {set_history_sch 50 }; set_button  history_sch_down font [skin_font awesome_light [fixed_size 34]]
