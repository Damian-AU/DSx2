set ::user(background_colour) #e4e4e4
set ::user(forground_colour) #2b6084
set ::user(button_label_colour) #fff
set ::user(text_colour) #2b6084
set ::user(selected_colour) #fe7e00
set ::user(machine_not_ready) #DA515E
set ::user(machine_ready) #0CA581
set ::user(green) #0CA581
set ::user(blue) #49a2e8
set ::user(red) #DA515E
set ::user(brown) #A1663A
set ::user(grey) #7C7C7C
set ::user(yellow) #eae83d
set ::user(x_axis) #2b6084
set ::user(y_axis) #2b6084

if {[file exists "[skin_directory]/settings/custom_colours.txt"] == 1} {
    array set ::user [encoding convertfrom utf-8 [read_binary_file "[skin_directory]/settings/custom_colours.txt"]]
}

set ::skin_background_colour $::user(background_colour)
set ::skin_forground_colour $::user(forground_colour)
set ::skin_button_label_colour $::user(button_label_colour)
set ::skin_text_colour $::user(text_colour)
set ::skin_selected_colour $::user(selected_colour)
set ::skin_machine_not_ready $::user(machine_not_ready)
set ::skin_machine_ready $::user(machine_ready)
set ::skin_green $::user(green)
set ::skin_blue $::user(blue)
set ::skin_red $::user(red)
set ::skin_brown $::user(brown)
set ::skin_grey $::user(grey)
set ::skin_yellow $::user(yellow)
set ::skin(help_colour) #fc2ff5
set ::skin_x_axis_colour $::user(x_axis)
set ::skin_y_axis_colour $::user(y_axis)
set ::skin_y2_axis_colour $::skin_red
set ::skin_grid_colour $::skin_forground_colour
set ::skin_home_pages "off espresso steam water flush"
set ::skin_action_pages "espresso steam water flush"
set ::skin_blink2 1
set ::start_button_x 180
set ::start_button_y 100
set ::skin(button_x_espresso) [expr $::start_button_x + 110]
set ::skin(button_y_espresso) $::start_button_y
set ::skin(button_x_steam) [expr $::start_button_x + 470]
set ::skin(button_y_steam) $::start_button_y
set ::skin(button_x_water) [expr $::start_button_x + 830]
set ::skin(button_y_water) $::start_button_y
set ::skin(button_x_flush) [expr $::start_button_x + 1190]
set ::skin(button_y_flush) $::start_button_y
set ::skin(button_y_stop_espresso) $::start_button_y
set ::skin(button_y_stop_steam) $::start_button_y
set ::skin(button_y_stop_flush) $::start_button_y
set ::skin(button_y_stop_water) $::start_button_y
set ::skin(button_x_stop_espresso) $::skin(button_x_espresso)
set ::skin(button_x_stop_steam) $::skin(button_x_espresso)
set ::skin(button_x_stop_flush) $::skin(button_x_espresso)
set ::skin(button_x_stop_water) $::skin(button_x_espresso)
set ::skin(graph_key_x) 120
set ::skin(graph_key_y) 470
set ::skin(button_x_fav) 2080
set ::skin(button_y_fav) 1100
set ::skin(button_x_power) 28
set ::skin(button_y_power) 22
set ::skin(button_x_machine) 2060
set ::skin(button_y_machine) 1270
set ::skin(button_x_scale) 2060
set ::skin(button_y_scale) 860
set ::beverage_type_x 1600
set ::skin(steam_calc) 1
set ::skin(pre_tare) 0
set ::skin(tare_if_negative_scale_reading) 1
set ::fav_label_fav1 $::skin(fav_label_fav1)
set ::fav_label_fav2 $::skin(fav_label_fav2)
set ::fav_label_fav3 $::skin(fav_label_fav3)
set ::fav_label_fav4 $::skin(fav_label_fav4)
set ::fav_label_fav5 $::skin(fav_label_fav5)

proc skin_load_font {name fn pcsize {androidsize {}} } {
    if {$::android == 1} {
        set f 2
    } else {
        set f 2
    }
    if {($::android == 1 || $::undroid == 1) && $androidsize != ""} {
        set pcsize $androidsize
    }
    set platform_font_size [expr {int(1.0 * $::fontm * $pcsize * $f * 0.4)}]
    if {[info exists ::loaded_fonts] != 1} {
        set ::loaded_fonts list
    }
    set fontindex [lsearch $::loaded_fonts $fn]
    if {$fontindex != -1} {
        set familyname [lindex $::loaded_fonts [expr $fontindex + 1]]
    } elseif {($::android == 1 || $::undroid == 1) && $fn != ""} {
        catch {
            set familyname [lindex [sdltk addfont $fn] 0]
        }
        lappend ::loaded_fonts $fn $familyname
    }
    if {[info exists familyname] != 1 || $familyname == ""} {
        msg "Font familyname not available; using name '$name'."
        set familyname $name
    }
    catch {
        font create $name -family $familyname -size $platform_font_size
    }
    msg "added font name: \"$name\" family: \"$familyname\" size: $platform_font_size filename: \"$fn\""
}

proc skin_font {font_name size} {
    if {$font_name == "font"} {
        set font_name $::skin(font_name)
    }
    if {$font_name == "font_bold"} {
        set font_name $::skin(font_name_bold)
    }
    if {$font_name == "awesome"} {
        set font_name $::skin(font_awesome)
    }
    if {$font_name == "awesome_light"} {
        set font_name $::skin(font_awesome_light)
    }
    if {$font_name == "icons"} {
        set font_name $::skin(icons)
    }

    if {[info exists ::skin_fonts] != 1} {
        set ::skin_fonts list
    }
    set font_key "$font_name $size skin"
    set font_index [lsearch $::skin_fonts $font_key]
    if {$font_index == -1} {
        # support for both OTF and TTF files
        if {[file exists "[skin_directory]/fonts/$font_name.otf"] == 1} {
            skin_load_font $font_key "[skin_directory]/fonts/$font_name.otf" $size
            lappend ::skin_fonts $font_key
        } elseif {[file exists "[skin_directory]/Fonts/$font_name.ttf"] == 1} {
            skin_load_font $font_key "[skin_directory]/fonts/$font_name.ttf" $size
            lappend ::skin_fonts $font_key
        } else {
            msg "Unable to load font '$font_key'"
        }
    }
    return $font_key
}


proc skin_low_water {} {
    if {[expr $::de1(water_level) < {$::settings(water_refill_point) + 3}]} {
        if {$::skin_blink2 == 1} {
                after 400 {set ::skinx_blink2 0}
                return ""
            } else {
                set ::skin_blink2 1
                return "[water_tank_level_to_milliliters $::de1(water_level)] [translate mL]"
            }
	    }
	return "[water_tank_level_to_milliliters $::de1(water_level)][translate mL] "
}

proc skin_steamtemp_text {} {
	return [return_steam_temperature_measurement [steam_heater_temperature]]
}

proc skin_group_head_heater_temperature_text {} {
	return [return_steam_temperature_measurement [group_head_heater_temperature]]
}

proc skin_dose {} {
    return [round_to_one_digits $::settings(grinder_dose_weight)]g
}
proc skin_saw {} {
    if {$::settings(settings_profile_type) == "settings_2c"} {
        return $::settings(final_desired_shot_weight_advanced)
    } else {
        return $::settings(final_desired_shot_weight)
    }
}

proc skin_extraction_ratio {} {
    if {$::settings(settings_profile_type) == "settings_2c"} {
        set y [round_to_one_digits [expr $::settings(final_desired_shot_weight_advanced) / $::settings(grinder_dose_weight)]]
    } else {
        set y [round_to_one_digits [expr $::settings(final_desired_shot_weight) / $::settings(grinder_dose_weight)]]
    }
    set d "1:"
    return $d$y
}

proc goto_profile_wizard {} {
    set title_test [string range [ifexists ::settings(profile_title)] 0 7]
    if {$title_test == "D-Flow /" } {
        ::plugins::D_Flow_Espresso_Profile::prep
        ::plugins::D_Flow_Espresso_Profile::demo_graph
        dui page load Dflowset
        } else {
        after 500 update_de1_explanation_chart
        set_next_page off $::settings(settings_profile_type)
        page_show off
        set ::settings(active_settings_tab) $::settings(settings_profile_type)
        fill_advanced_profile_steps_listbox
        set_advsteps_scrollbar_dimensions
    }
}

proc skin_steam_temperature {} {
    if {$::settings(steam_disabled) != 1} {
        return_steam_temperature_measurement $::settings(steam_temperature)
    } else {
        return [translate "off"]
    }
}


proc skin_steam_settings_info {} {
    set s {   }
    if {$::settings(steam_disabled) != 1} {
        return [round_to_one_digits [expr $::settings(steam_flow) / 10]][translate "ml/s"]$s[skin_steam_temperature]
    } else {
        return [translate "off"]
    }
}

proc skin_temperature_measurement {in} {
	if {$::settings(enable_fahrenheit) == 1} {
		return [subst {[round_to_integer [celsius_to_fahrenheit $in]]\u00B0F}]
	} else {
		return [subst {[round_to_integer $in]\u00B0C}]
	}
}

proc skin_water_settings_info {} {
    set s {  }
    return [round_to_one_digits $::settings(hotwater_flow)][translate "ml/s"]$s[skin_temperature_measurement $::settings(water_temperature)]$s[skin_water_volume]
}

proc skin_steam_text {time} {
	if {$time == 0 || $::settings(steam_disabled) == 1} {
		return [translate "off"]
	} else {
		set t [round_to_integer $time]
		set u [translate "s"]
		return $t$u
	}
}

proc skin_return_liquid_measurement {in} {
    if {$::de1(language_rtl) == 1} {
		return [subst {[translate "mL"] [round_to_integer $in] }]
    }

	if {$::settings(enable_fluid_ounces) != 1} {
		return [subst {[round_to_integer $in] [translate "mL"]}]
	} else {
		return [subst {[round_to_integer [ml_to_oz $in]] oz}]
	}
}

proc skin_return_weight_measurement {in} {
    if {$::de1(language_rtl) == 1} {
		return [subst {[translate "g"][round_to_one_digits $in]}]
    }

	if {$::settings(enable_fluid_ounces) != 1} {
		return [subst {[round_to_integer $in][translate "g"]}]
	} else {
		return [subst {[round_to_integer [ml_to_oz $in]] oz}]
	}
}

proc skin_water_button_text {} {
    set l [translate "Water"]
    set s " "
    if {$::skin(water_dial) == "volume"} {
        if {$::settings(enable_fahrenheit) == 1} {
            set wt [round_to_integer [celsius_to_fahrenheit $::settings(water_temperature)]]\u00B0F
        } else {
            set wt [round_to_integer $::settings(water_temperature)]\u00B0C
        }
        return $l$s$wt
    } else {
        if {$::settings(scale_bluetooth_address) != ""} {
            set wv [skin_return_weight_measurement $::settings(water_volume)]
        } else {
            set wv [skin_return_liquid_measurement $::settings(water_volume)]
        }
        return $l$s$wv
    }
}

proc skin_water_temperature {} {
    if {$::settings(enable_fahrenheit) == 1} {
        return [round_to_integer [celsius_to_fahrenheit $::settings(water_temperature)]]\u00B0F
    } else {
        return [round_to_integer $::settings(water_temperature)]\u00B0C
    }
}

proc skin_water_volume {} {
    if {$::settings(scale_bluetooth_address) != ""} {
        return [skin_return_weight_measurement $::settings(water_volume)]
    } else {
        return [skin_return_liquid_measurement $::settings(water_volume)]
    }
}

proc set_button {button_name property value} {
    set z ::${button_name}(pages)
    set pages [set $z]
    if {$property == "fill"} {dui item config $pages bb_${button_name}* -fill $value}
    if {$property == "label_fill"} {dui item config $pages l_${button_name} -fill $value}
    if {$property == "font"} {dui item config $pages l_${button_name} -font $value}
    if {$property == "icon_font"} {dui item config $pages li_${button_name} -font $value}
    if {$property == "icon_fill"} {dui item config $pages li_${button_name} -fill $value}
    if {$property == "state"} {
        dui item config $pages s_${button_name} -initial_state $value -state $value
        dui item config $pages bb_${button_name}* -initial_state $value -state $value
        dui item config $pages l_${button_name} -initial_state $value -state $value
        dui item config $pages li_${button_name} -initial_state $value -state $value
        dui item config $pages b_${button_name}* -initial_state $value -state $value
    }
}

proc add_colour_button {button_name pages x y width height tv command } {
    set ::${button_name}(pages) $pages

    dui add dbutton $pages $x $y -bwidth $width -shape round_outline -bheight $height -fill $::skin_forground_colour -outline $::skin_forground_colour -tags bb_${button_name} -command {do_nothing}
    dui add variable $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc add_clear_button {button_name pages x y width height tv command } {
    set ::${button_name}(pages) $pages
    dui add variable $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 34] -fill $::skin_text_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc add_icon_button {button_name pages x y width height tv command } {
    set ::${button_name}(pages) $pages
    dui add variable $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font awesome_light 34] -fill $::skin_forground_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc add_icon_label_button {button_name pages x y width height tvi tv command } {
    set ::${button_name}(pages) $pages

    dui add dbutton $pages $x $y -bwidth $width -shape round_outline -bheight $height -fill $::skin_forground_colour -outline $::skin_forground_colour -tags bb_${button_name} -command {do_nothing}
    dui add shape rect $pages [expr $x + 100] $y [expr $x + 104] [expr $y + 100] -width 0 -fill $::skin_background_colour -tags s_${button_name}
    dui add variable $pages [expr $x + 50] [expr $y + $height/2 - 2] -font [skin_font D-font 40] -fill $::skin_button_label_colour -anchor center -tags li_${button_name} -textvariable $tvi
    dui add variable $pages [expr ($x + 44) + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc add_round_button {button_name pages x y width height tv command } {
    set ::${button_name}(pages) $pages

    dui add shape oval $pages $x $y [expr $x + $width] [expr $y + $height] -fill $::skin_forground_colour -outline $::skin_button_label_colour -tags s_${button_name}
    dui add variable $pages [expr $x + $width/2 +1] [expr $y + $height/2 - 1] -width [expr $width - 10] -font [skin_font awesome_light 18] -fill $::skin_button_label_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc add_arrow {arrow_name pages x y arrow info} {
    set ::${arrow_name}(pages) $pages
    if {$arrow == "right_up"} {
        set af {$::skin(icon_arrow_right_up)}
        set a n
        dui add variable $pages [expr $x - 300] [expr 120 + $y] -font [skin_font font_bold 20] -fill $::skin(help_colour) -width 600 -anchor $a -tags ${arrow_name}_info -initial_state hidden -textvariable $info
    }
    if {$arrow == "left_up"} {
        set af {$::skin(icon_arrow_left_up)}
        set a n
        dui add variable $pages [expr 300 + $x] [expr 120 + $y] -font [skin_font font_bold 20] -fill $::skin(help_colour) -width 600 -anchor $a -justify center -tags ${arrow_name}_info -initial_state hidden -textvariable $info
    }
    if {$arrow == "up"} {
        set af {$::skin(icon_arrow_up)}
        set a n
        dui add variable $pages $x [expr 120 + $y] -font [skin_font font_bold 20] -fill $::skin(help_colour) -width 600 -anchor $a -justify center -tags ${arrow_name}_info -initial_state hidden -textvariable $info
    }
    if {$arrow == "left"} {
        set af {$::skin(icon_arrow_left)}
        set a center
        dui add variable $pages [expr 400 + $x] $y -font [skin_font font_bold 20] -fill $::skin(help_colour) -width 600 -anchor $a -justify center -tags ${arrow_name}_info -initial_state hidden -textvariable $info
    }
    if {$arrow == "right"} {
        set af {$::skin(icon_arrow_right)}
        set a center
        dui add variable $pages [expr $x - 400] $y -font [skin_font font_bold 20] -fill $::skin(help_colour) -width 600 -anchor $a -justify center -tags ${arrow_name}_info -initial_state hidden -textvariable $info
    }
    dui add variable $pages $x $y -font [skin_font D-font 50] -fill $::skin(help_colour) -anchor $a -justify center -tags $arrow_name -initial_state hidden -textvariable $af

}

proc set_arrow {arrow value} {
    set z ::${arrow}(pages)
    set pages [set $z]
    dui item config $pages ${arrow} -initial_state $value -state $value
    dui item config $pages ${arrow}_info -initial_state $value -state $value
}


proc hide_graph {} {
    dui item moveto off heading_entry 450 -1001
    .can itemconfigure main_graph -state hidden
    dui item config off main_graph -initial_state hidden
    set pages {off espresso hotwaterrinse water}
    foreach key {pressure flow weight temperature resistance steps} {
        dui item config $pages ${key}_icon -initial_state hidden -state hidden
        dui item config $pages ${key}_text -initial_state hidden -state hidden
        dui item config $pages ${key}_data -initial_state hidden -state hidden
        dui item config $pages ${key}_key_button* -initial_state hidden -state hidden
    }
}

proc show_graph {} {
    .can itemconfigure main_graph -state normal
    dui item config off main_graph -initial_state normal
    hide_skin_set
    set pages {off espresso hotwaterrinse water}
    foreach key {pressure flow weight temperature resistance steps} {
        dui item config $pages ${key}_icon -initial_state normal -state normal
        dui item config $pages ${key}_text -initial_state normal -state normal
        dui item config $pages ${key}_data -initial_state normal -state normal
        dui item config $pages ${key}_key_button* -initial_state normal -state normal
    }
}

proc do_nothing {} {
    return
}

proc steam_stop_label {} {
    if {[de1_substate_text] == "puffing"} {
        return [translate "purge"]
    } else {
        return [translate "stop"]

    }
}

proc toggle_favs_to_show {} {
    set ::skin(favs_to_show) [expr $::skin(favs_to_show) + 1]
    if {$::skin(favs_to_show) == 6} {
        set ::skin(favs_to_show) 2
    }
    rest_fav_buttons
}

proc set_favs_showing {} {
    set_button fav3 state normal
    set_button fav3_edit state normal
    set_button fav4 state normal
    set_button fav4_edit state normal
    set_button fav5 state normal
    set_button fav5_edit state normal
    if {$::skin(favs_to_show) == 2} {
        set_button fav3 state hidden
        set_button fav3_edit state hidden
        set_button fav4 state hidden
        set_button fav4_edit state hidden
        set_button fav5 state hidden
        set_button fav5_edit state hidden
    }
    if {$::skin(favs_to_show) == 3} {
        set_button fav4 state hidden
        set_button fav4_edit state hidden
        set_button fav5 state hidden
        set_button fav5_edit state hidden
    }
    if {$::skin(favs_to_show) == 4} {
        set_button fav5 state hidden
        set_button fav5_edit state hidden
    }
}

proc rest_fav_buttons {} {
    foreach k {fav1 fav2 fav3 fav4 fav5} {
        dui item config off ${k}_auto_load_l1 -initial_state hidden -state hidden
        dui item config off ${k}_auto_load_l2 -initial_state hidden -state hidden
        dui item config off ${k}_auto_load_l3 -initial_state hidden -state hidden
        dui item config off ${k}_auto_load_l1 -fill $::skin_text_colour
        dui item config off ${k}_auto_load_l2 -fill $::skin_text_colour
        set_button ${k}_auto_load_button state hidden
        set_button ${k}_edit state normal
        set_button ${k}_x_button state hidden
        set_button ${k}_tick_button state hidden
        dui item moveto off ${k}_entry 2070 -1001
        set_favs_showing
    }
}

proc edit {option} {
    hide_graph
    rest_fav_buttons
    set ::auto_load_fav $::skin(auto_load_fav)
    dui item config off ${option}_auto_load_l1 -initial_state normal -state normal
    dui item config off ${option}_auto_load_l2 -initial_state normal -state normal
    if {$::skin(auto_load_fav) == $option} {
        dui item config off ${option}_auto_load_l1 -fill $::skin_selected_colour
        dui item config off ${option}_auto_load_l2 -fill $::skin_selected_colour
        dui item config off ${option}_auto_load_l3 -initial_state hidden -state hidden
    } else {
        dui item config off ${option}_auto_load_l1 -fill $::skin_text_colour
        dui item config off ${option}_auto_load_l2 -fill $::skin_text_colour
        dui item config off ${option}_auto_load_l3 -initial_state normal -state normal
    }
    set_button ${option}_auto_load_button state normal
    set_button ${option}_edit state hidden
    set_button ${option}_x_button state normal
    set_button ${option}_tick_button state normal
    dui item moveto off ${option}_entry $::beverage_type_x 1250

}

proc cancel {option} {
    set ::fav_label_${option} $::skin(fav_label_${option})
    rest_fav_buttons
    show_graph
}

proc set_auto_load {key} {
    foreach k {fav1 fav2 fav3 fav4 fav5} {
        dui item config off ${k}_auto_load_l1 -fill $::skin_text_colour
        dui item config off ${k}_auto_load_l2 -fill $::skin_text_colour
        #dui item config off ${k}_auto_load_l3 -initial_state normal -state normal
    }

    if {$::auto_load_fav == $key} {
        set ::auto_load_fav none
        dui item config off ${key}_auto_load_l1 -fill $::skin_text_colour
        dui item config off ${key}_auto_load_l2 -fill $::skin_text_colour
        dui item config off ${key}_auto_load_l3 -initial_state normal -state normal
    } else {
        set ::auto_load_fav $key
        dui item config off ${key}_auto_load_l1 -fill $::skin_selected_colour
        dui item config off ${key}_auto_load_l2 -fill $::skin_selected_colour
        dui item config off ${key}_auto_load_l3 -initial_state hidden -state hidden
    }
}

proc show_skin_set {option} {
    hide_header_settings
    #rest_fav_buttons
    hide_skin_set
    hide_graph
    foreach n {1 2 3 4 5} {
        dui item config off index_shape_${n} -initial_state normal -state normal
    }
    dui item config off ${option}_index -initial_state normal -state normal
    set_button ${option}_index_button state normal
    hide_espresso_settings
    hide_flush_settings
    hide_water_settings
    hide_steam_settings
    if {$option == "espresso"} {show_espresso_settings}
    if {$option == "flush"} {show_flush_settings}
    if {$option == "water"} {show_water_settings}
    if {$option == "steam"} {show_steam_settings}
    set_button wf_close state normal
}

proc hide_skin_set {} {
    foreach n {1 2 3 4 5} {
        dui item config off index_shape_${n} -initial_state hidden -state hidden
    }
    hide_espresso_settings
    hide_flush_settings
    hide_water_settings
    hide_steam_settings
    set_button wf_close state hidden
    foreach f {espresso steam flush water} {
        dui item config off ${f}_index -initial_state hidden -state hidden
    }
    foreach f {espresso steam flush water} {
        set_button ${f}_index_button state hidden
    }
}

proc wf_profile_button_list {} {
    return {select_profile wf_save_saw_tick_button wf_save_saw_x_button wf_dose_minus wf_dose_plus wf_dose_minus_10 wf_dose_plus_10 wf_espresso_minus wf_espresso_plus wf_espresso_minus_10 wf_espresso_plus_10}
}

proc show_espresso_settings {} {
    foreach s {wf_beans wf_espresso wf_heading_profile wf_heading_espresso_weight wf_heading_bean_weight} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_profile_button_list] {
        set_button ${s} state normal
    }
}

proc hide_espresso_settings {} {
    foreach s {wf_beans wf_espresso wf_heading_profile wf_heading_espresso_weight wf_heading_bean_weight} {
        dui item config off ${s} -initial_state hidden -state hidden
    }
    foreach s [wf_profile_button_list] {
        set_button ${s} state hidden
    }
}

proc wf_flush_button_list {} {
    return {wf_flush_flow_minus wf_flush_flow_plus wf_flush_flow_minus_10 wf_flush_flow_plus_10 \
            wf_flush_timer_minus wf_flush_timer_plus wf_flush_timer_minus_10 wf_flush_timer_plus_10}
}

proc show_flush_settings {} {
    foreach s {wf_heading_flush_flow wf_flush_flow_setting \
               wf_heading_flush_timer wf_flush_timer_setting} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_flush_button_list] {
        set_button ${s} state normal
    }
}

proc hide_flush_settings {} {
    foreach s {wf_heading_flush_flow wf_flush_flow_setting \
               wf_heading_flush_timer wf_flush_timer_setting} {
        dui item config off ${s} -initial_state hidden -state hidden
    }
    foreach s [wf_flush_button_list] {
        set_button ${s} state hidden
    }
}

proc wf_water_button_list {} {
    return {wf_water_flow_minus wf_water_flow_plus wf_water_flow_minus_10 wf_water_flow_plus_10 \
            wf_water_volume_minus wf_water_volume_plus wf_water_volume_minus_10 wf_water_volume_plus_10 \
            wf_water_temperature_minus wf_water_temperature_plus wf_water_temperature_minus_10 wf_water_temperature_plus_10}
}

proc show_water_settings {} {
    foreach s {wf_heading_water_flow wf_water_flow_setting \
               wf_heading_water_volume wf_water_volume_setting \
               wf_heading_water_temperature wf_water_temperature_setting} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_water_button_list] {
        set_button ${s} state normal
    }
}

proc hide_water_settings {} {
    foreach s {wf_heading_water_flow wf_water_flow_setting \
               wf_heading_water_volume wf_water_volume_setting \
               wf_heading_water_temperature wf_water_temperature_setting} {
        dui item config off ${s} -initial_state hidden -state hidden
    }
    foreach s [wf_water_button_list] {
        set_button ${s} state hidden
    }
}

proc wf_steam_button_list {} {
    return {wf_steam_timer_minus wf_steam_timer_plus wf_steam_timer_minus_10 wf_steam_timer_plus_10}
}

proc show_jug {option} {
    set_button ${option}_edit state hidden
    set_button ${option}_x_button state normal
    set_button ${option}_tick_button state normal
    set_button ${option}_weight state normal

}

proc hide_jug {option} {
    set_button ${option}_edit state normal
    set_button ${option}_x_button state hidden
    set_button ${option}_tick_button state hidden
    set_button ${option}_weight state hidden
}

proc show_steam_settings {} {
    dui item config off wf_heading_steam_heater -initial_state normal -state normal
    dui item config off wf_steam_on_off_bg -initial_state normal -state normal
    dui item config off wf_heading_milk_jug -initial_state normal -state normal
    dui item config off wf_heading_steam_calibrate -initial_state normal -state normal
    dui item config off wf_milk_weight_text_line_1 -initial_state normal -state normal
    dui item config off wf_milk_weight_text_line_2 -initial_state normal -state normal
    dui item config off wf_milk_weight_text_line_3 -initial_state normal -state normal
    set_button wf_steam_on state normal
    set_button wf_steam_off state normal
    set_button wf_steam_off_bg state normal
    set_button wf_steam_cal_time_plus state normal
    set_button wf_steam_jug_time state normal
    set_button wf_steam_cal_time_minus state normal
    set_button wf_steam_jug_milk state normal
    foreach s {wf_heading_steam_timer wf_steam_timer_setting} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_steam_button_list] {
        set_button ${s} state normal
    }
    foreach s [wf_steam_set_list] {
        set_button wf_steam_${s} state normal
        set_button ${s}_edit state normal
    }


}

proc wf_steam_set_list {} {
    return {jug_s jug_m jug_l}
}

proc hide_steam_settings {} {
    dui item config off wf_heading_steam_heater -initial_state hidden -state hidden
    dui item config off wf_steam_on_off_bg -initial_state hidden -state hidden
    dui item config off wf_heading_milk_jug -initial_state hidden -state hidden
    dui item config off wf_heading_steam_calibrate -initial_state hidden -state hidden
    dui item config off wf_milk_weight_text_line_1 -initial_state hidden -state hidden
    dui item config off wf_milk_weight_text_line_2 -initial_state hidden -state hidden
    dui item config off wf_milk_weight_text_line_3 -initial_state hidden -state hidden
    set_button wf_steam_on state hidden
    set_button wf_steam_off state hidden
    set_button wf_steam_off_bg state hidden
    set_button wf_steam_cal_time_plus state hidden
    set_button wf_steam_jug_time state hidden
    set_button wf_steam_cal_time_minus state hidden
    set_button wf_steam_jug_milk state hidden
    foreach s {wf_heading_steam_timer wf_steam_timer_setting} {
        dui item config off ${s} -initial_state hidden -state hidden
    }
    foreach t [wf_steam_button_list] {
        set_button ${t} state hidden
    }
    foreach u [wf_steam_set_list] {
        set_button wf_steam_${u} state hidden
        set_button ${u}_x_button state hidden
        set_button ${u}_tick_button state hidden
        hide_jug $u
        set_button ${u}_edit state hidden
    }

}

proc set_jug {j} {
    set ::skin(jug_size) $j
    set ::skin(jug_g) $::skin(jug_${j})
    set_button wf_steam_jug_s icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_m icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_l icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_${j} icon_fill $::skin_selected_colour
    skin_save skin
}

proc check_current_jug {} {
    set j $::skin(jug_size)
    set_button wf_steam_jug_s icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_m icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_l icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_${j} icon_fill $::skin_selected_colour
}

proc skin_steam_time_calc {} {
    if {$::skin(pre_tare) != 1} {
        if {$::skin(jug_g) == { } || $::skin(jug_g) < 2 || $::skin(milk_g) < 2 || $::skin(milk_g) == { } || $::skin(milk_s) < 2 || $::skin(milk_s) == { }} {
            return
        } else {
            set t [expr {$::skin(milk_s)*1000}]
            set m $::skin(milk_g)
            set j $::skin(jug_g)
            set s $::de1(scale_sensor_weight)
            set a [expr {($t/$m*($s-$j))/1000}]
            set ::skin(steam_calc) [round_to_integer $a]
            if {[expr ($::skin(steam_calc) > 0)]} {
                if {$::settings(steam_disabled) == 1} {
                    set ::settings(steam_disabled) 0
                }
                set ::settings(steam_timeout) $::skin(steam_calc)
                save_settings
                de1_send_steam_hotwater_settings
            }
        }
    } else {
        set t [expr {$::skin(milk_s)*1000}]
        set m $::skin(milk_g)
        set j 0
        set s $::de1(scale_sensor_weight)
        set a [expr {($t/$m*($s-$j))/1000}]
        set ::skin(steam_calc) [round_to_integer $a]
        if {[expr ($::skin(steam_calc) > 0)]} {
            if {$::settings(steam_disabled) == 1} {
                set ::settings(steam_disabled) 0
            }
            set ::settings(steam_timeout) $::skin(steam_calc)
            save_settings
            de1_send_steam_hotwater_settings
        }
    }
}

proc skin_milk_weight {} {
    set milk [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]
    if {[expr ($::de1(scale_sensor_weight) > $::skin(jug_g))] && $::skin(jug_g) > 20 && $::skin(pre_tare) != 1} {
        set g g
        set x 0
        catch {
            set x [expr {round($milk)}]
        }
        return $x$g
    } else {
        return ""
    }
}

proc setup_steam_switch_state {} {
    if {$::settings(steam_disabled) == 0} {
        set_button wf_steam_off label_fill $::skin_button_label_colour
        set_button wf_steam_on label_fill $::skin_selected_colour
    } else {
        set_button wf_steam_off label_fill $::skin_selected_colour
        set_button wf_steam_on label_fill $::skin_button_label_colour
    }
}

set ::de1(steam_disable_toggle) [expr {!$::settings(steam_disabled)}]
proc toggle_steam_heater {} {
    if {$::settings(steam_disabled) == 0} {
        set ::settings(steam_disabled) 1
        set ::de1(steam_disable_toggle) 0
    } else {
        set ::settings(steam_disabled) 0
        set ::de1(steam_disable_toggle) 1
    }
    setup_steam_switch_state
    delay_screen_saver
    de1_send_steam_hotwater_settings
}



proc wf_update_profile_saw {} {
    if {$::settings(profile_has_changed) == 1} { borg toast [translate "Profile Updated"]; save_profile }
}

proc wf_cancel_profile_saw {} {
    if {$::settings(profile_has_changed) == 1} { borg toast [translate "Cancelled"]; set ::settings(profile_has_changed) 0; load_fav_profile $::settings(profile)}
}


proc set_fav_colour {fav} {
    clear_fav_colour
    set_button $fav icon_fill $::skin_selected_colour
    set_button $fav icon_font [skin_font awesome 28]
}

proc clear_fav_colour {} {
    foreach key {fav1 fav2 fav3 fav4 fav5} {
        set_button $key icon_fill $::skin_button_label_colour
        set_button $key icon_font [skin_font awesome_light 28]
    }
}

proc check_fav_settings_vars {} {
    return {
        profile
        #profile_title
        #profile_filename
        # grinder_dose_weight
        steam_disabled
        steam_flow
        steam_temperature
        # steam_timeout
        flush_seconds
        hotwater_flow
        water_temperature
        water_volume
    }
}

proc check_fav_skin_vars {} {
    return {
        workflow jug_size
    }
}

proc check_fav {} {
    foreach k [check_fav_settings_vars] {
        if {$::fav_settings_test($k) != $::settings($k)} {
            clear_fav_colour
        }
    }
    foreach k [check_fav_skin_vars] {
        if {$::fav_skin_test($k) != $::skin($k)} {
            clear_fav_colour
        }
    }
}

proc move_workflow_button {button_name} {
    set z ::${button_name}(pages)
    set pages [set $z]
    set width 340
    set height 100

    dui item moveto $pages bb_${button_name}_start* $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 0]
    #dui item moveto $pages s_${button_name}_start $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 0]
    dui item moveto $pages s_${button_name}_start [expr $::skin(button_x_${button_name}) + 100] $::skin(button_y_${button_name})

    dui item moveto $pages li_${button_name}_start [expr ($::skin(button_x_${button_name}) + 50)] [expr $::skin(button_y_${button_name}) + $height/2 - 2]
    dui item moveto $pages l_${button_name}_start [expr ($::skin(button_x_${button_name}) + 44) + $width/2] [expr $::skin(button_y_${button_name}) + $height/2 - 2]
    dui item moveto $pages b_${button_name}_start* $::skin(button_x_${button_name}) $::skin(button_y_${button_name})
    dui item moveto $pages l_${button_name} [expr $::skin(button_x_${button_name}) + $width/2] [expr $::skin(button_y_${button_name}) + $height/2 - 2]
    dui item moveto $pages b_${button_name}* $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 100]
    dui item moveto off l_${button_name}_index_button [expr $::skin(button_x_${button_name}) + $width/2] [expr $::skin(button_y_${button_name}) + $height/2 - 2]
    dui item moveto off b_${button_name}_index_button* $::skin(button_x_${button_name}) $::skin(button_y_${button_name})
    dui item moveto $pages ${button_name}_data_line_1 [expr $::skin(button_x_${button_name}) + 170] [expr $::skin(button_y_${button_name}) + 120]
    foreach f {espresso steam flush water} {
        dui item moveto off ${button_name}_index [expr $::skin(button_x_${button_name}) + 170] 470
    }
}

proc start_button_ready {} {
	set num $::de1(substate)
	set substate_txt $::de1_substate_types($num)
    if {[info exists ::de1(in_eco_steam_mode)] == 1} {
        if {$substate_txt == "ready" && $::de1(in_eco_steam_mode) == 1} {
            return [translate "READY"]
        }
    }
	if {$substate_txt == "ready" && $::de1(device_handle) != 0} {
		if {$::settings(steam_timeout) > 0 && [steamtemp] > [expr {$::settings(steam_temperature) - 14}]} {
		    return [translate "READY"]
		} elseif {$::settings(steam_timeout) == 0} {
		    return [translate "READY"]
		}
	}
	return [translate "WAIT"]
}

proc skin_start {option} {
    if {[ghc_required]} {
        show_skin_set $option
    } else {
        if {$option == "water"} {
            if {[start_button_ready] == [translate "READY"]} {
                if {$::settings(scale_bluetooth_address) != ""} {
                    scale_tare
                    set_next_page water water
                    start_water
                } else {
                    set_next_page water water
                    start_water
                }
                cancel_auto_stop
            }
        }
        if {$option == "flush"} {
            set_next_page flush flush
            start_flush
            page_show flush
            cancel_auto_stop
        }
        if {$option == "espresso"} {
            set ::current_espresso_page off
            set_next_page off off
            start_espresso
            cancel_auto_stop
        }
        if {$option == "steam"} {
            if {[start_button_ready] == [translate "READY"] && $::settings(steam_timeout) > 0} {
                #DSx_reset_graphs
                #hide_graph
                set_next_page steam steam
                start_steam
                cancel_auto_stop
            }
            if {[start_button_ready] == [translate "WAIT"]} {
                borg toast [translate "Machine still heating"]
            }
            if {$::settings(steam_timeout) == 0} {
                borg toast [translate "Steam is turned off"]
            }
        }
    }
    if {$option == "idle"} {
        set_next_page off off
        start_idle
    }
}

proc move_to_the_next_step {} {
    de1_send_state "skip to next" $::de1_state(SkipToNext)
}

proc skin_flush_timer {} {
    set t [round_to_integer [expr {$::settings(flush_seconds) - [flush_pour_timer]}]]
    set s s
    if {$t < 0} {
        return ""
    } else {
        return $t$s
    }
}

proc skin_steam_timer {} {
    set t [round_to_integer [expr {$::settings(steam_timeout) - [steam_pour_timer]}]]
    set s s
    if {$t < 0} {
        return ""
    } else {
        return $t$s
    }
}

proc skin_water_timer {} {
    set t [round_to_integer [expr {$::settings(water_timeout) - [water_pour_timer]}]]
    set s s
    if {$t < 0} {
        return 0s
    } else {
        return $t$s
    }
}

proc toggle_heading {} {
    set ::skin(show_heading) [expr {!$::skin(show_heading)}]
    check_heading
    if {$::skin(show_heading) == 1} {
        dui item moveto off heading_entry 450 640
    } else {
        dui item moveto off heading_entry 450 -1001
    }
    skin_save skin
}

proc check_heading {} {
   if {$::skin(show_heading) == 1} {
        set ::skin_heading $::skin(heading)
        dui item config off headerbar_bg -initial_state normal -state normal
        dui item config off headerbar_bg1 -initial_state normal -state normal
        set ::start_button_y 150
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_y_water) $::start_button_y
        move_workflow_button espresso
        move_workflow_button flush
        move_workflow_button steam
        move_workflow_button water
    } else {
        set ::skin_heading {}
        dui item config off headerbar_bg -initial_state hidden -state hidden
        dui item config off headerbar_bg1 -initial_state hidden -state hidden
        set ::start_button_y 100
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_y_water) $::start_button_y
        move_workflow_button espresso
        move_workflow_button flush
        move_workflow_button steam
        move_workflow_button water
    }
}

proc header_settings {} {
    hide_skin_set
    set_button edit_heading_button state normal
    hide_graph
    set_button close_heading_settings state normal
    set_button exit_heading_settings state normal
    if {$::skin(show_heading) == 1} {
        dui item moveto off heading_entry 450 640
    }
}
proc hide_header_settings {} {
    set_button edit_heading_button state hidden
    show_graph
    set_button close_heading_settings state hidden
    set_button exit_heading_settings state hidden
    dui item moveto off heading_entry 450 -1001
}

proc wifi_status {} {
    if {[borg networkinfo] == "wifi"} {
        dui item config $::skin_home_pages wifi_icon -fill #00dd00
    } else {
        dui item config $::skin_home_pages wifi_icon -fill $::skin_button_label_colour
    }
}

proc cancel_auto_stop {} {
    if {$::android != 1 } {
    after cancel [list update_de1_state "$::de1_state(Idle)\x5"]
    after cancel [list update_de1_state "$::de1_state(Idle)\x5"]
    after cancel [list update_de1_state "$::de1_state(Idle)\x5"]
    after cancel [list update_de1_state "$::de1_state(Idle)\x5"]
    }
}

proc workflow {option} {
    set ::skin(workflow) $option
    if {$option == "latte"} {
        set ::skin(button_x_espresso) [expr $::start_button_x + 110]
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_x_flush) [expr $::start_button_x + 470]
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_x_steam) [expr $::start_button_x + 830]
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_x_water) [expr $::start_button_x + 3000]
        set ::skin(button_y_water) 0
    }
    if {$option == "long"} {
        set ::skin(button_x_water) [expr $::start_button_x + 110]
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_x_espresso) [expr $::start_button_x + 470]
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_x_flush) [expr $::start_button_x + 830]
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_x_steam) [expr $::start_button_x + 3000]
        set ::skin(button_y_steam) $::start_button_y
    }
    if {$option == "americano"} {
        set ::skin(button_x_espresso) [expr $::start_button_x + 110]
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_x_water) [expr $::start_button_x + 470]
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_x_flush) [expr $::start_button_x + 830]
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_x_steam) [expr $::start_button_x + 3000]
        set ::skin(button_y_steam) $::start_button_y
    }
    if {$option == "espresso"} {
        set ::skin(button_x_espresso) [expr $::start_button_x + 110]
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_x_steam) [expr $::start_button_x + 3000]
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_x_water) [expr $::start_button_x + 3000]
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_x_flush) [expr $::start_button_x + 470]
        set ::skin(button_y_flush) $::start_button_y
    }
    if {$option == "none"} {
        set ::skin(button_x_espresso) [expr $::start_button_x + 110]
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_x_steam) [expr $::start_button_x + 470]
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_x_water) [expr $::start_button_x + 830]
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_x_flush) [expr $::start_button_x + 1190]
        set ::skin(button_y_flush) $::start_button_y
    }
    move_workflow_button espresso
    move_workflow_button flush
    move_workflow_button steam
    move_workflow_button water


    set_button wf_latte label_fill $::skin_button_label_colour
    set_button wf_long label_fill $::skin_button_label_colour
    set_button wf_americano label_fill $::skin_button_label_colour
    set_button wf_espresso label_fill $::skin_button_label_colour
    set_button wf_none label_fill $::skin_button_label_colour
    set_button wf_${option} label_fill $::skin_selected_colour
}

proc set_scale_weight_to_dose {} {
    set ::settings(grinder_dose_weight) [round_to_one_digits [expr $::de1(scale_sensor_weight)]]
    skin_save settings
}

proc adjust {var value} {
    if {$var == "flush"} {
        set ::settings(flush_seconds) [round_to_integer [expr $::settings(flush_seconds) + $value]]
        skin_save flush
    }
    if {$var == "flush_flow"} {
        set ::settings(flush_flow) [expr $::settings(flush_flow) + $value]
        if {$::settings(flush_flow) < 1} {set ::settings(flush_flow) 1}
        if {$::settings(flush_flow) > 10} {set ::settings(flush_flow) 10}
        skin_save flush
    }
    if {$var == "steam"} {
        if {$::settings(steam_disabled) == 1} {
            set ::settings(steam_disabled) 0
        }
        set ::settings(steam_timeout) [expr $::settings(steam_timeout) + $value]

        if {$::settings(steam_timeout) < 1} {
            set ::settings(steam_timeout) 1
            #set ::settings(steam_disabled) 0
        }
        skin_save steam
    }
    if {$var == "water_flow"} {
        set ::settings(hotwater_flow) [expr $::settings(hotwater_flow) + $value]
        if {$::settings(hotwater_flow) < 1} {set ::settings(hotwater_flow) 1}
        if {$::settings(hotwater_flow) > 10} {set ::settings(hotwater_flow) 10}
        skin_save water
    }
    if {$var == "water_temperature"} {
        set ::settings(water_temperature) [expr $::settings(water_temperature) + $value]
        if {$::settings(water_temperature) < 20} {set ::settings(water_temperature) 20}
        if {$::settings(water_temperature) > 110} {set ::settings(water_temperature) 110}
        skin_save water
    }
    if {$var == "water_volume"} {
        set ::settings(water_volume) [expr $::settings(water_volume) + $value]
        if {$::settings(water_volume) < 10} {set ::settings(water_volume) 10}
        if {$::settings(water_volume) > 250} {set ::settings(water_volume) 250}
        skin_save water
    }
    if {$var == "dose"} {
        set ::settings(grinder_dose_weight) [round_to_one_digits [expr $::settings(grinder_dose_weight) + $value]]
        if {$::settings(grinder_dose_weight) < 6} {set ::settings(grinder_dose_weight) 6}
        if {$::settings(grinder_dose_weight) > 40} {set ::settings(grinder_dose_weight) 40}
        skin_save settings
    }
    if {$var == "saw"} {
        if {$::settings(settings_profile_type) == "settings_2c"} {
            set ::settings(final_desired_shot_weight_advanced) [round_to_integer [expr $::settings(final_desired_shot_weight_advanced) + $value]]
            if {$::settings(final_desired_shot_weight_advanced) < 0} {set ::settings(final_desired_shot_weight_advanced) 0}
            if {$::settings(final_desired_shot_weight_advanced) > 2000} {set ::settings(final_desired_shot_weight_advanced) 2000}
        } else {
            set ::settings(final_desired_shot_weight) [round_to_integer [expr $::settings(final_desired_shot_weight) + $value]]
            if {$::settings(final_desired_shot_weight) < 0} {set ::settings(final_desired_shot_weight) 0}
            if {$::settings(final_desired_shot_weight) > 100} {set ::settings(final_desired_shot_weight) 100}
        }
        clear_fav_colour
        set ::settings(profile_has_changed) 1
        skin_save settings

    }
    if {$var == "er"} {
        if {$::settings(settings_profile_type) == "settings_2c"} {
            set y [round_to_one_digits [expr $::settings(final_desired_shot_weight_advanced) / $::settings(grinder_dose_weight)]]
            set new_y [expr $y + $value]
            set saw [expr $::settings(grinder_dose_weight) * $new_y]
            set ::settings(final_desired_shot_weight_advanced) [round_to_one_digits $saw]
        } else {
            set y [round_to_one_digits [expr $::settings(final_desired_shot_weight) / $::settings(grinder_dose_weight)]]
            set new_y [expr $y + $value]
            set saw [expr $::settings(grinder_dose_weight) * $new_y]
            set ::settings(final_desired_shot_weight) [round_to_one_digits $saw]
        }
        skin_save settings
    }
}

###################################################
### Graphs

proc live_graph_list {} {
	return [list skin_espresso_temperature_basket skin_espresso_temperature_mix skin_espresso_temperature_goal espresso_elapsed espresso_pressure espresso_weight espresso_weight_chartable espresso_flow espresso_flow_weight espresso_flow_weight_raw espresso_water_dispensed espresso_flow_weight_2x espresso_flow_2x espresso_resistance espresso_resistance_weight espresso_pressure_delta espresso_flow_delta espresso_flow_delta_negative espresso_flow_delta_negative_2x espresso_temperature_mix espresso_temperature_basket espresso_state_change espresso_pressure_goal espresso_flow_goal espresso_flow_goal_2x espresso_temperature_goal espresso_de1_explanation_chart_flow espresso_de1_explanation_chart_elapsed_flow espresso_de1_explanation_chart_flow_2x espresso_de1_explanation_chart_flow_1_2x espresso_de1_explanation_chart_flow_2_2x espresso_de1_explanation_chart_flow_3_2x espresso_de1_explanation_chart_pressure espresso_de1_explanation_chart_temperature espresso_de1_explanation_chart_temperature_10 espresso_de1_explanation_chart_pressure_1 espresso_de1_explanation_chart_pressure_2 espresso_de1_explanation_chart_pressure_3 espresso_de1_explanation_chart_elapsed_flow espresso_de1_explanation_chart_elapsed_flow_1 espresso_de1_explanation_chart_elapsed_flow_2 espresso_de1_explanation_chart_elapsed_flow_3 espresso_de1_explanation_chart_elapsed espresso_de1_explanation_chart_elapsed_1 espresso_de1_explanation_chart_elapsed_2 espresso_de1_explanation_chart_elapsed_3]
}

proc backup_live_graph {} {
	foreach lg [live_graph_list] {
	unset -nocomplain ::skin(live_graph_$lg)
		if {[$lg length] > 0} {
			set ::skin_graphs(live_graph_$lg) [$lg range 0 end]
			set ::skin_graphs(live_graph_profile) $::settings(profile_title)
		    set ::skin_graphs(live_graph_time) $::settings(espresso_clock)
		    set ::skin_graphs(live_graph_beans) $::settings(grinder_dose_weight)
		    set ::skin_graphs(live_graph_weight) $::settings(drink_weight)
		    set ::skin_graphs(live_graph_pi_water) [round_to_integer $::de1(preinfusion_volume)]
		    set ::skin_graphs(live_graph_pour_water) [round_to_integer $::de1(pour_volume)]
		    set ::skin_graphs(live_graph_water) [expr {[round_to_integer $::de1(preinfusion_volume)] + [round_to_integer $::de1(pour_volume)]}]
		    set ::skin_graphs(live_graph_pi_time) [espresso_preinfusion_timer]
		    set ::skin_graphs(live_graph_pour_time) [espresso_pour_timer]
		    set ::skin_graphs(live_graph_shot_time) [espresso_elapsed_timer]
		} else {
			set ::skin_graphs(live_graph_$lg) {}
		}
	}

	#skin_save skin_graphs
}

::de1::event::listener::after_flow_complete_add [lambda {event_dict} {
    if { [dict get $event_dict previous_state] == "Espresso" } {
        backup_live_graph
        skin_save skin_graphs
    }
}]


proc restore_live_graphs {} {
	set last_elapsed_time_index [expr {[espresso_elapsed length] - 1}]
	if {$last_elapsed_time_index > 1} {
	    return
	}
	foreach lg [live_graph_list] {
		$lg length 0
		if {[info exists ::skin_graphs(live_graph_$lg)] == 1} {
			$lg append $::skin_graphs(live_graph_$lg)
		}
	}
}

proc restore_graphs {} {
    after 1 {
        restore_live_graphs
        # restore_steam_graph
    }
}

proc skin_temperature_units {in} {
	if {$::settings(enable_fahrenheit) == 1} {
		return [round_to_two_digits [expr {[celsius_to_fahrenheit $in] * 0.05}]]
	} else {
		return [round_to_two_digits [expr {$in * 0.1}]]
	}
}

proc clear_temp_data {args} {
	skin_espresso_temperature_basket length 0
    skin_espresso_temperature_basket append [skin_temperature_units $::settings(espresso_temperature)]
    skin_espresso_temperature_mix length 0
    skin_espresso_temperature_mix append [skin_temperature_units $::settings(espresso_temperature)]
    skin_espresso_temperature_goal length 0
    skin_espresso_temperature_goal append [skin_temperature_units $::settings(espresso_temperature)]
}

rename ::clear_espresso_chart ::skin::clear_espresso_chart_orig
proc ::clear_espresso_chart {args} {
	clear_temp_data
	::skin::clear_espresso_chart_orig {*}$args
}

rename ::gui::update::append_live_data_to_espresso_chart \
    ::skin::append_live_data_to_espresso_chart_orig

proc ::gui::update::append_live_data_to_espresso_chart {event_dict args} {
    if { ! [::de1::state::is_flow_state \
            [dict get $event_dict this_state] \
            [dict get $event_dict this_substate]] } { return }
    ::skin::append_live_data_to_espresso_chart_orig $event_dict {*}$args
    dict with event_dict {
        # resistance
        set ::espresso_resistance(end) \
            [round_to_two_digits \
                 [expr { $GroupFlow > 0 &&  $GroupPressure > 0 ? \
                         (1/$GroupFlow)*($GroupPressure) : 0 }]]
        skin_espresso_temperature_basket append \
            [skin_temperature_units $HeadTemp]

        skin_espresso_temperature_goal append \
            [skin_temperature_units $SetHeadTemp]

        skin_espresso_temperature_mix append \
            [skin_temperature_units $MixTemp]
    }
}

proc check_graph {} {
    if {$::de1_num_state($::de1(state)) == "Idle" } {
        restore_graphs
    }
}

proc toggle_graph {curve} {
    if {$curve == "steam_pressure" || $curve == "steam_temperature" || $curve == "steam_flow"} {
        if {$::skin($curve) > 0} {
            set ::skin($curve) 0
            $::home_steam_graph element configure home_${curve} -linewidth 0
            dui item config "steam" steam_${curve}_icon -fill $::skin_text_colour -outline $::skin_text_colour
        } else {
            set ::skin($curve) 1
            $::home_steam_graph element configure home_${curve} -linewidth [rescale_x_skin 6]
            if {$curve == "steam_pressure"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_green -outline $::skin_green
            }
            if {$curve == "steam_temperature"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_red -outline $::skin_red
            }
            if {$curve == "steam_flow"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_blue -outline $::skin_blue
            }

        }
    } else {
        if {$::skin($curve) > 0} {
            set ::skin($curve) 0
            if {$curve == "pressure" || $curve == "temperature" || $curve == "flow"} {
                $::home_espresso_graph element configure home_${curve}_goal -linewidth 0
                #$::espresso_zoomed_graph element configure home_${curve}_goal -linewidth 0
            }
            $::home_espresso_graph element configure home_${curve} -linewidth 0
            dui item config espresso ${curve}_data -fill $::skin_text_colour
            dui item config $::skin_home_pages ${curve}_icon -fill $::skin_text_colour -outline $::skin_text_colour
        } else {
            set ::skin($curve) 1
            if {$curve == "pressure" || $curve == "temperature" || $curve == "flow"} {
                $::home_espresso_graph element configure home_${curve}_goal -linewidth [rescale_x_skin 5]
                #$::espresso_zoomed_graph element configure home_${curve}_goal -linewidth [rescale_x_skin 5]
            }
            if {$curve == "steps"} {
                $::home_espresso_graph element configure home_${curve} -linewidth [rescale_x_skin 2]
                #$::espresso_zoomed_graph element configure home_${curve} -linewidth [rescale_x_skin 2]
            } else {
                $::home_espresso_graph element configure home_${curve} -linewidth [rescale_x_skin 10]
                #$::espresso_zoomed_graph element configure home_${curve} -linewidth [rescale_x_skin 10]
            }
            dui item config espresso ${curve}_data -fill $::skin_text_colour
            if {$curve == "pressure"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_green -outline $::skin_green
            }
            if {$curve == "temperature"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_red -outline $::skin_red
            }
            if {$curve == "flow"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_blue -outline $::skin_blue
            }
            if {$curve == "weight"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_brown -outline $::skin_brown
            }
            if {$curve == "resistance"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_yellow -outline $::skin_yellow
            }
            if {$curve == "steps"} {
                dui item config $::skin_home_pages ${curve}_icon -fill $::skin_grey -outline $::skin_grey
            }
            $::home_espresso_graph axis configure y -max $::skin(zoomed_y_axis_max) -min $::skin(zoomed_y_axis_min)
        }
    }
    skin_save skin_settings
}




proc setup_home_espresso_graph {} {
    foreach curve {pressure temperature flow weight resistance steps} {
        if {$::skin($curve) < 1} {
            set ::skin($curve) 1
            toggle_graph $curve
        }
    }
}

proc skin_clock {} {
    set date [clock format [clock seconds] -format " %a %e %b"]
    #set date [clock format [clock seconds] -format "%a  "]
    if {$::settings(enable_ampm) == 0} {
        set a [clock format [clock seconds] -format "%H"]
        set b [clock format [clock seconds] -format ":%M"]
        set s [clock format [clock seconds] -format ":%S"]
        set c $a
        } else {
        set a [clock format [clock seconds] -format "%I"]
        set b [clock format [clock seconds] -format ":%M %P"]
        set s [clock format [clock seconds] -format ":%S"]
        set c $a
        regsub {^[0]} $c {\1} c
    }
    return $c$b$date
}

set ::skin_sleep_timer_start 0
set ::skin_sleep_countdown 0
set ::skin_sleep_timer_on 0

proc skin_power {} {
    set_next_page off power;
    set ::skin_sleep_timer_start [expr [clock seconds] + 5]
    set ::skin_sleep_timer_on 1
    skin_power_off_timer
    page_show skin_power;
}

proc skin_power_off_timer {} {
    set ::skin_sleep_countdown [expr $::skin_sleep_timer_start - [clock seconds]]
    if {$::skin_sleep_countdown < 0} {
        set ::skin_sleep_countdown 0
    }
    if {$::skin_sleep_timer_on == 1} {
        if {$::skin_sleep_countdown == 0} {
            set ::skin_sleep_timer_on 0
            set_next_page off off
            set ::current_espresso_page "off"
            start_sleep
        }
    }

    return $::skin_sleep_countdown
}
proc skin_exit {} {
    app_exit
}
proc skin_sleep {} {
    set ::skin_sleep_timer_start 0
}

###### connection status

set ::connect_blink 1
proc skin_scale_disconnected {} {
	if {$::android == 1 && [ifexists ::settings(scale_bluetooth_address)] == ""} {
		dui item config $::skin_home_pages scale_btl_icon -fill $::skin_button_label_colour
	}
	if {$::de1(scale_device_handle) == "0" && $::android == 1} {
		dui item config $::skin_home_pages scale_btl_icon -fill $::skin_red
		if {$::connect_blink == 1} {
		    after 300 {set ::connect_blink 0}
		    return [translate "reconnect"]
		} else {
		    set ::connect_blink 1
		    return ""
		}
	}
    dui item config $::skin_home_pages scale_btl_icon -fill $::skin_blue
    #return [translate "Scale Connected"]
}

set ::flush_blink 1
proc flush_motion {} {
	if {$::flush_blink == 1} {
        after 100 {set ::flush_blink 0}
        return g
    } else {
        set ::flush_blink 1
        return f
    }
}
set ::steam_blink 1
proc steam_motion {} {
	if {$::steam_blink == 1} {
        after 100 {set ::steam_blink 0}
        return t
    } else {
        set ::steam_blink 1
        return s
    }
}

proc check_app_extensions {} {
    set show 0
    set dflow ""
    set scale ""
    set saver ""
    if {"D_Flow_Espresso_Profile" in $::settings(enabled_plugins) == 0 } {
        append ::settings(enabled_plugins) { D_Flow_Espresso_Profile}
        save_settings
        set dflow {- We needed to enable "D_Flow_Espresso_Profile" app extension for this skin to work best}
        set show 1
    }
    if {"slow_scale_filtering" in $::settings(enabled_plugins) == 0 } {
        append ::settings(enabled_plugins) { slow_scale_filtering}
        save_settings
        set scale {- We needed to enable "slow_scale_filtering" app extension for this skin to work best}
        set show 1
    }
    if {"DPx_Screen_Saver" in $::settings(enabled_plugins) == 1 } {
        set idx [lsearch $::settings(enabled_plugins) "DPx_Screen_Saver"]
        set ::settings(enabled_plugins) [lreplace $::settings(enabled_plugins) $idx $idx]
        save_settings
        set saver {- We needed to disable "DPx_Screen_Saver" app extension, this skin already has the MySaver feature}
        set show 1
    }
    set ext {Tap on the screen to exit the app, the changes will be applied when you restart}
    set ::plugin_change_message $saver\r\r$dflow\r\r$scale\r\r\r\r$ext
    if {$show == 1} {after 1000 {page_show plugin_message}}
}

dui add variable "plugin_message" 360 600 -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -width 2000 -textvariable {$::plugin_change_message}
add_clear_button plugin_message plugin_message 0 0 2560 1600 {} {app_exit}

proc skin_negative_scale_tare {} {
    if {$::de1(scale_sensor_weight) < 0} {
        scale_tare
    }
}

set ::skin_heating_hold 0
proc skin_machine_state_heating {} {
    if {$::skin_heating_hold != 1} {
        set ::skin_his [clock milliseconds]
        set ::skin_heating_hold 1
    }
    set a \uf2cb
    if {$::skin_his < [expr {[clock milliseconds] - 500}] } {
        set a \uf2ca
    }
    if {$::skin_his < [expr {[clock milliseconds] - 1000}] } {
        set a \uf2c9
    }
    if {$::skin_his < [expr {[clock milliseconds] - 1500}] } {
        set a \uf2c8
    }
    if {$::skin_his < [expr {[clock milliseconds] - 2000}] } {
        set a \uf2c7
    }
    if {$::skin_his < [expr {[clock milliseconds] - 2500}]} {
        set ::skin_heating_hold 0
    }
    return $a
}

proc skin_heating_percentage {} {
    if {$::skin_heating_flag != 0} {
        set a "Heating          [round_to_one_digits [expr ((1000 / $::settings(steam_temperature) * [steamtemp]) * 0.1)]]%"
        return $a
    }
}

set ::skin_machine_state {}
proc skin_machine_state {} {
    set ::skin_machine_state {}
    if {([de1_substate_text] == "preinfusion" || [de1_substate_text] == "pouring") && $::de1_num_state($::de1(state)) == "Espresso"} {
        set ::skin_machine_state $::settings(current_frame_description)
    }
    if {[de1_substate_text] == "puffing"} {
        set ::skin_machine_state "[translate "waiting"]\r[translate "to purge"]"

    }
    if {[de1_substate_text] == "Error_BootFill"} {
        set ::skin_machine_state "[translate "boot err"]\r[translate "no water"]"
    }

    if {[de1_connected_state] == [translate "Disconnected"]} {
        dui item config $::skin_home_pages de1_btl_icon -fill $::skin_red
    } else {
        dui item config $::skin_home_pages de1_btl_icon -fill $::skin_blue
    }

    if {[de1_substate_text] == "heating" || [de1_substate_text] == "final heating"} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_not_ready
        return [skin_machine_state_heating]
    } elseif {[de1_substate_text] == "ready"} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_ready
        return $::skin(icon_tick)
    } elseif {[de1_substate_text] == "starting" || [de1_connected_state] == [translate "Disconnected"]} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_not_ready
        return $::skin(icon_x)
    } else {
        return ""
    }
}

set {} {
        array set ::de1_substate_types {
            -   "starting"
            0	"ready"
            1	"heating"
            2	"final heating"
            3	"stabilising"
            4	"preinfusion"
            5	"pouring"
            6	"ending"
            7	"Steaming"
            8	"DescaleInit"
            9	"DescaleFillGroup"
            10	"DescaleReturn"
            11	"DescaleGroup"
            12	"DescaleSteam"
            13	"CleanInit"
            14	"CleanFillGroup"
            15	"CleanSoak"
            16	"CleanGroup"
            17  "refill"
            18	"PausedSteam"
            19	"UserNotPresent"
            20	"puffing"
            200 "Error_NaN"
            201 "Error_Inf"
            202 "Error_Generic"
            203 "Error_ACC"
            204 "Error_TSensor"
            205 "Error_PSensor"
            206 "Error_WLevel"
            207 "Error_DIP"
            208 "Error_Assertion"
            209 "Error_Unsafe"
            210 "Error_InvalidParm"
            211 "Error_Flash"
            212 "Error_OOM"
            213 "Error_Deadline"
            214 "Error_HiCurrent"
            215 "Error_LoCurrent"
            216 "Error_BootFill"
        }
}

###################################################
proc skin_loop {} {
    #PD_backup_live_graph
    skin_negative_scale_tare
    restore_live_graphs
    check_fav
    if {$::settings(profile_has_changed) == 1} {
        set_button wf_save_saw_x_button label_fill $::skin_red
        set_button wf_save_saw_tick_button label_fill $::skin_green
    } else {
        set_button wf_save_saw_x_button label_fill $::skin_background_colour
        set_button wf_save_saw_tick_button label_fill $::skin_background_colour
    }
}