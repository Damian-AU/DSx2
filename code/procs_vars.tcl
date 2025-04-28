set ::skin_version 3.20

set ::user(background_colour) #e4e4e4
set ::user(foreground_colour) #2b6084
set ::user(button_label_colour) #fff
set ::user(text_colour) #2b6084
set ::user(selected_colour) #fe7e00
set ::user(machine_not_ready) #DA515E
set ::user(machine_ready) #0CA581
set ::user(green) #0CA581
set ::user(blue) #49a2e8
set ::user(red) #DA515E
set ::user(brown) #A1663A
set ::user(grey) #c1c1c1
set ::user(yellow) #eae83d
set ::user(orange) #fe7e00
set ::user(x_axis) #2b6084
set ::user(y_axis) #2b6084
set ::user(y2_axis) #2b6084
set ::user(graph_grid_colour) $::user(foreground_colour)
set ::user(mini_graph_grid_colour) #bbb
set ::user(disabled_colour) #c1c1c1
set ::user(background_2_colour) #e4e4e4
set ::user(foreground_2_colour) #2b6084
set ::user(button_label_2_colour) #fff
set ::user(button_label_disabled_colour) $::user(disabled_colour)
set ::user(button_label_highlight_colour) #fe7e00
set ::user(text_2_colour) #2b6084
set ::user(text_3_colour) #2b6084
set ::user(text_disabled_colour) $::user(disabled_colour)
set ::user(text_highlight_colour) #fe7e00
set ::user(button_press_colour) #eae83d

set ::user(button_radius) 30
set ::settings(scale_stop_at_half_shot) 0

if {[file exists [skin_directory]/pages/cafe/graphs.tcl]} {
    file delete -force [skin_directory]/pages/cafe/graphs.tcl
}
if {$::skin(colour_theme_folder) == "default"} {
    set basedir [skin_directory]/colour_themes/default.txt
    set ::skin(colour_theme_folder) [file dirname $basedir]
}
if {[file exists "${::skin(colour_theme_folder)}/${::skin(colour_theme)}.txt"] == 1} {
    array set ::user [encoding convertfrom utf-8 [read_binary_file "${::skin(colour_theme_folder)}/${::skin(colour_theme)}.txt"]]
}

set ::skin_button_radius $::user(button_radius)
if {$::android != 1} {
    set ::skin_button_radius [round_to_integer [expr $::user(button_radius) * 0.66]]
}

set ::skin_background_2_colour $::user(background_2_colour)
set ::skin_foreground_2_colour $::user(foreground_2_colour)
set ::skin_button_label_2_colour $::user(button_label_2_colour)
set ::skin_button_label_disabled_colour $::user(button_label_disabled_colour)
set ::skin_button_label_highlight_colour $::user(button_label_highlight_colour)
set ::skin_text_2_colour $::user(text_2_colour)
set ::skin_text_3_colour $::user(text_3_colour)
set ::skin_text_disabled_colour $::user(text_disabled_colour)
set ::skin_text_highlight_colour $::user(text_highlight_colour)
set ::skin_button_press_colour $::user(button_press_colour)

if {[info exists ::user(forground_colour)] == 1} {
    set ::user(foreground_colour) $::user(forground_colour)
}
set ::skin_foreground_colour $::user(foreground_colour)
set ::skin_forground_colour $::user(foreground_colour)

set ::skin_background_colour $::user(background_colour)
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
set ::skin_orange $::user(orange)
set ::skin(help_colour) #fc2ff5
set ::skin_x_axis_colour $::user(x_axis)
set ::skin_y_axis_colour $::user(y_axis)
set ::skin_y2_axis_colour $::user(y2_axis)
set ::skin_grid_colour $::user(graph_grid_colour)
set ::skin_mini_grid_colour $::user(mini_graph_grid_colour)
set ::skin_disabled_colour $::user(disabled_colour)
set ::skin_home_pages "off espresso steam water flush"
set ::skin_action_pages "espresso steam water flush"
set ::skin_blink2 1
set ::start_button_x 180
set ::start_button_y 100
set ::skin(button_x_espresso) [expr $::start_button_x + 10]
set ::skin(button_y_espresso) $::start_button_y
set ::skin(button_x_steam) [expr $::start_button_x + 370]
set ::skin(button_y_steam) $::start_button_y
set ::skin(button_x_water) [expr $::start_button_x + 730]
set ::skin(button_y_water) $::start_button_y
set ::skin(button_x_flush) [expr $::start_button_x + 1090]
set ::skin(button_y_flush) $::start_button_y
set ::skin(button_x_dye) [expr $::start_button_x + 1450]
set ::skin(button_y_dye) $::start_button_y
set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1450 + 250]
set ::skin(button_x_history) [expr $::start_button_x + 1450 + 250]
set ::skin(button_y_skin_history_button) $::start_button_y
set ::skin(button_y_history) $::start_button_y
set ::skin(button_y_stop_espresso) $::start_button_y
set ::skin(button_y_stop_steam) $::start_button_y
set ::skin(button_y_stop_flush) $::start_button_y
set ::skin(button_y_stop_water) $::start_button_y
set ::skin(button_x_stop_espresso) $::skin(button_x_espresso)
set ::skin(button_x_stop_steam) $::skin(button_x_espresso)
set ::skin(button_x_stop_flush) $::skin(button_x_espresso)
set ::skin(button_x_stop_water) $::skin(button_x_espresso)
set ::skin(graph_key_x) 80
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
set ::wf_dose_x 160
set ::skin(graph_update_delay) 10

set ::graph_cache(graph_a_profile) ""
set ::graph_cache(graph_a_time) ""
set ::graph_cache(graph_b_profile) ""
set ::graph_cache(graph_b_time) ""
set ::graph_cache(graph_c_profile) ""
set ::graph_cache(graph_c_time) ""
set ::graph_cache(graph_d_profile) ""
set ::graph_cache(graph_d_time) ""

if {$::skin_button_radius > 50} {
    set ::skin_button_radius 50
}

if {$::skin_button_radius < 0} {
    set ::skin_button_radius 0
}

if {![info exist ::skin(auto_tare_negative_reading)]} {
    set ::skin(auto_tare_negative_reading) 0
}

if {![info exist ::skin(jug_auto)]} {
    set ::skin(jug_auto) 0
}

if {![info exist ::skin(single_drink_milk_volume)]} {
    set ::skin(single_drink_milk_volume) 160
}

if {![info exist ::skin(jug_single)]} {
    set ::skin(jug_single) "jug_m"
}

if {![info exist ::skin(y_res)]} {
    set ::skin(y_res) 0
}

if {![info exist ::skin(show_y2_axis)]} {
    set ::skin(show_y2_axis) 0
}

if {![info exist ::skin(show_cache_y2_axis)]} {
    set ::skin(show_cache_y2_axis) $::skin(show_y2_axis)
}

if {![info exist ::skin(show_history_button)]} {
    set ::skin(show_history_button) 1
}

if {![info exist ::skin(show_data_card_button)]} {
    set ::skin(show_data_card_button) 0
}

if {![info exist ::skin(auto_load_fav_Damian)]} {
    set ::skin(auto_load_fav_Damian) none
}

if {![info exist ::skin(auto_load_fav_cafe)]} {
    set ::skin(auto_load_fav_cafe) none
}

if {![info exist ::skin(fav_key)]} {
    set ::skin(fav_key) fav1
}

if {![info exist ::skin(HDS_timer))]} {
    set ::skin(HDS_timer) 0
}
if {![info exist ::skin(HDS_brightness))]} {
    set ::skin(HDS_brightness) 1
}

if {$::skin(theme) == "Damian"} {
    set ::skin(auto_load_fav) $::skin(auto_load_fav_Damian)
}
if {$::skin(theme) == "cafe"} {
    set ::skin(auto_load_fav) $::skin(auto_load_fav_cafe)
}

proc skin_history {} {
    history_viewer open
}

proc skin_history_2 {} {
    history_viewer open
}

proc create_settings_dir {} {
    if {[file exists [skin_directory]/settings] != 1} {
        set path [skin_directory]/settings
        file mkdir $path
        file attributes $path
    }
}
create_settings_dir

proc skin_load_font {name fn pcsize {androidsize {}} } {
    if {$::android == 1} {
        #set f 2
        set f 2.19
    } else {
        set f 2
    }
    if {($::android == 1 || $::undroid == 1) && $androidsize != ""} {
        set pcsize $androidsize
    }

    # multiple by 0.4 to scale font to Pulak's style sheet sizes
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
        if {[language] == "en"} {
            set font_name $::skin(font_name)
        } else {
            set font_name notosansuiregular
        }
        if {[language] == "th"} {
            set font_name sarabun
        }
        if {[language] == "ar" || [language] == "arb"} {
            set font_name Dubai-Regular
        }
        if {[language] == "he" || [language] == "heb"} {
            set font_name hebrew-regular
        }
        if {[language] == "zh-hant" || [language] == "zh-hans" || [language] == "kr"} {
            set font_name NotoSansCJKjp-Regular
        }
    }
    if {$font_name == "font_bold"} {
        if {[language] == "en"} {
            set font_name $::skin(font_name_bold)
        } else {
            set font_name notosansuibold
        }
        if {[language] == "th"} {
            set font_name sarabunbold
        }
        if {[language] == "ar" || [language] == "arb"} {
            set font_name Dubai-Bold
        }
        if {[language] == "he" || [language] == "heb"} {
            set font_name hebrew-bold
        }
        if {[language] == "zh-hant" || [language] == "zh-hans" || [language] == "kr"} {
            set font_name NotoSansCJKjp-Bold
        }
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
    set font_key "$font_name $size"
    set font_index [lsearch $::skin_fonts $font_key]
    if {$font_index == -1} {
        # support for both OTF and TTF files
        if {[file exists "[skin_directory]/fonts/$font_name.otf"] == 1} {
            skin_load_font $font_key "[skin_directory]/fonts/$font_name.otf" $size
            lappend ::skin_fonts $font_key
        } elseif {[file exists "[skin_directory]/fonts/$font_name.ttf"] == 1} {
            skin_load_font $font_key "[skin_directory]/fonts/$font_name.ttf" $size
            lappend ::skin_fonts $font_key
        } elseif {[file exists "[homedir]/fonts/$font_name.otf"] == 1} {
            skin_load_font $font_key "[homedir]/fonts/$font_name.otf" $size
            lappend ::skin_fonts $font_key
        } elseif {[file exists "[homedir]/fonts/$font_name.ttf"] == 1} {
            skin_load_font $font_key "[homedir]/fonts/$font_name.ttf" $size
            lappend ::skin_fonts $font_key
        } else {
            msg "Unable to load font '$font_key'"
        }
    }
    return $font_key
}

proc initial_icon_cal_check {} {
    if {$::skin(icon_cal_check) == 0} {
        set ::skin_initial_setup [translate "Please check your icon calibration"]
        hide_skin_set
        set_button edit_heading_button state normal
        set_button edit_colour_theme_button state normal
        set_button edit_icon_size_button state normal
        set_button edit_flow_rate_cal_button state normal
        set_button edit_theme_button state normal
        hide_graph
        set_button close_heading_settings state normal
        set_button exit_heading_settings state normal
        if {$::skin(show_heading) == 1} {
            dui item moveto off heading_entry 450 640
        }
        dui item config off fav_edit_buttons -initial_state hidden -state hidden
        dui item config off settings_toggles -initial_state hidden -state hidden
        set ::icon_size_state "hide"
        dui item config off icon_size_set -initial_state normal -state normal
        set_button icon_size_minus state normal
        set_button icon_size_plus state normal
        set_button icon_size_minus_x10 state normal
        set_button icon_size_plus_x10 state normal
    }
}

if {![info exist ::skin(icon_cal_check)]} {
    set ::skin(icon_cal_check) 0
}

set ::skin_initial_setup ""

if {[info exist ::skin(icon_size)]} {
    if {$::skin(icon_size) == 1} {
        set ::skin(icon_factor) 0.8
    }
    if {$::skin(icon_size) == 1.5} {
        set ::skin(icon_factor) 0.88
    }
    if {$::skin(icon_size) == 2} {
        set ::skin(icon_factor) 0.95
    }
    if {$::skin(icon_size) == 3} {
        set ::skin(icon_factor) 1
    }
    if {$::skin(icon_size) == 4} {
        set ::skin(icon_factor) 1.12
    }
    if {$::skin(icon_size) == 5} {
        set ::skin(icon_factor) 1.24
    }
    set ::skin(icon_cal_check) 0
    unset -nocomplain ::skin(icon_size)
}

if {[info exists ::skin(icon_factor)] != 1} {
    set ::skin(icon_factor) 1
    if {$::settings(screen_size_width) == 2800} {
        set ::skin(icon_factor) 1.24
    }
    if {$::settings(screen_size_width) == 1340} {
        set ::skin(icon_factor) 0.8
    }
    set ::skin(icon_cal_check) 0
}


set ::next_saver_spot_y 1
set ::next_saver_spots_per_column 8
proc next_saver_spot_x {} {
    set x 40
    if {$::next_saver_spot_y > $::next_saver_spots_per_column} {
        set x [expr 40 + (1 * 180)]
    }
    if {$::next_saver_spot_y > [expr 2 * $::next_saver_spots_per_column]} {
        set x [expr 40 + (2 * 180)]
    }
    if {$::next_saver_spot_y > [expr 3 * $::next_saver_spots_per_column]} {
        set x [expr 40 + (3 * 180)]
    }
    if {$::next_saver_spot_y > [expr 4 * $::next_saver_spots_per_column]} {
        set x [expr 40 + (4 * 180)]
    }
    return $x
}

proc next_saver_spot_y {} {
    if {$::next_saver_spot_y == 1} {
        set y 40
    } else {
        set y [expr 40 + (($::next_saver_spot_y - 1) * 180)]
    }
    if {$::next_saver_spot_y > $::next_saver_spots_per_column} {
        set y [expr 40 + (($::next_saver_spot_y - $::next_saver_spots_per_column - 1) * 180)]
    }
    if {$::next_saver_spot_y > [expr 2 * $::next_saver_spots_per_column]} {
        set y [expr 40 + (($::next_saver_spot_y - (2 * $::next_saver_spots_per_column) - 1) * 180)]
    }
    if {$::next_saver_spot_y > [expr 3 * $::next_saver_spots_per_column]} {
        set y [expr 40 + (($::next_saver_spot_y - (3 * $::next_saver_spots_per_column) - 1) * 180)]
    }
    if {$::next_saver_spot_y > [expr 4 * $::next_saver_spots_per_column]} {
        set y [expr 40 + (($::next_saver_spot_y - (4 * $::next_saver_spots_per_column) - 1) * 180)]
    }
    incr ::next_saver_spot_y
    return $y
}

proc fixed_size { size } {
    set ::skin_icon_size $::skin(icon_factor)
    if {$::android != 1} {
        set sys_size [expr $size * $::skin_icon_size]
    } else {
        set sys_size [expr {(($size * 0.6 / $::settings(default_font_calibration)) * 2 / 2.19) * $::skin_icon_size}]
    }
    return $sys_size
}

proc skin_low_water {} {
    if {[expr $::de1(water_level) < {$::settings(water_refill_point) + 3}]} {
        if {$::skin_blink2 == 1} {
                after 400 {set ::skin_blink2 0}
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
    if {$::settings(grinder_dose_weight) > 1} {
        if {$::settings(settings_profile_type) == "settings_2c"} {
            if {[info exist ::skin_er_to_one_percent]} {
                set y [round_to_two_digits [expr $::settings(final_desired_shot_weight_advanced) / $::settings(grinder_dose_weight)]]
            } else {
                set y [round_to_one_digits [expr $::settings(final_desired_shot_weight_advanced) / $::settings(grinder_dose_weight)]]
            }
        } else {
            if {[info exist ::skin_er_to_one_percent]} {
                set y [round_to_two_digits [expr $::settings(final_desired_shot_weight) / $::settings(grinder_dose_weight)]]
            } else {
                set y [round_to_one_digits [expr $::settings(final_desired_shot_weight) / $::settings(grinder_dose_weight)]]
            }
        }
        set d "1:"
        return ($d$y)
    } else {
        return ""
    }
}

proc goto_profile_wizard {} {
    set ::settings(active_settings_tab) settings_1
    show_settings
    set title_test [string range [ifexists ::settings(profile_title)] 0 7]
    if {$title_test != "D-Flow /"} {
        after 500 update_de1_explanation_chart
    }
    set_next_page off settings_1
    page_show off
    set ::settings(active_settings_tab) settings_1
    set_profiles_scrollbar_dimensions
    if {$title_test == "D-Flow /" && [file exists "[homedir]/plugins/D_Flow_Espresso_Profile/plugin.tcl"] == 1} {
        ::plugins::D_Flow_Espresso_Profile::prep
        ::plugins::D_Flow_Espresso_Profile::demo_graph
        set_next_page off Dflowset; page_show Dflowset
    } elseif {$title_test == "A-Flow /" && [file exists "[homedir]/plugins/A_Flow/plugin.tcl"] == 1} {
        after 500 update_de1_explanation_chart
        ::plugins::A_Flow::prep
        ::plugins::A_Flow::demo_graph
        dui page load Aflowset
    } else {
        after 500 update_de1_explanation_chart
        set_next_page off $::settings(settings_profile_type)
        page_show off
        set ::settings(active_settings_tab) $::settings(settings_profile_type)
        fill_advanced_profile_steps_listbox
        set_advsteps_scrollbar_dimensions
    }
}

proc goto_profile_list {} {
    set ::settings(active_settings_tab) settings_1
    show_settings
    set title_test [string range [ifexists ::settings(profile_title)] 0 7]
    if {$title_test != "D-Flow /"} {
        after 500 update_de1_explanation_chart
    }
    set_next_page off settings_1
    page_show off
    set ::settings(active_settings_tab) settings_1
    set_profiles_scrollbar_dimensions
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
        return [round_to_one_digits [expr $::settings(steam_flow) * 0.01]][translate "ml/s"]$s[skin_steam_temperature]
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

set ::skin_water_dial "volume"
proc skin_water_dial_text {} {
    if {$::skin_water_dial == "temperature"} {
        if {$::settings(enable_fahrenheit) == 1} {
            set wt [round_to_integer [celsius_to_fahrenheit $::settings(water_temperature)]]\u00B0F
        } else {
            set wt [round_to_integer $::settings(water_temperature)]\u00B0C
        }
        return $wt
    } else {
        if {$::settings(scale_bluetooth_address) != ""} {
            set wv [skin_return_weight_measurement $::settings(water_volume)]
        } else {
            set wv [skin_return_liquid_measurement $::settings(water_volume)]
        }
        return $wv
    }
}

proc water_button_text {} {
    set l [translate "Water"]
    set s " "
    if {$::skin_water_dial == "volume"} {
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

proc adjust_water_toggle {} {
    if {$::skin_water_dial == "volume"} {
        set ::skin_water_dial "temperature"
    } else {
        set ::skin_water_dial "volume"
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
        return [skin_return_weight_measurement [expr $::settings(water_volume) + $::skin(wsaw_offset)]]
    } else {
        return [skin_return_liquid_measurement [expr $::settings(water_volume) + $::skin(wsaw_offset)]]
    }
}

proc skin_water_offset {} {
    if {$::settings(scale_bluetooth_address) != ""} {
        return [skin_return_weight_measurement [expr $::skin(wsaw_offset) * -1]]
    } else {
        return [skin_return_liquid_measurement [expr $::skin(wsaw_offset) * -1]]
    }
}

proc set_button {button_name property value} {
    catch {
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
}

proc add_colour_button {button_name pages x y width height tv command {extra_tags {}} } {
    set ::${button_name}(pages) $pages
    dui add dbutton $pages $x $y -bwidth $width -shape round -radius $::skin_button_radius -bheight $height -fill $::skin_foreground_colour -tags [list bb_${button_name} {*}$extra_tags] -command {do_nothing}
    dui add variable $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags [list l_${button_name} {*}$extra_tags] -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags [list b_${button_name} {*}$extra_tags] -command $command
}

proc add_colour_variable_button {button_name pages x y width height tv command {extra_tags {}} } {
    set ::${button_name}(pages) $pages
    dui add dbutton $pages $x $y -bwidth $width -shape round -radius $::skin_button_radius -bheight $height -fill $::skin_foreground_colour -tags [list bb_${button_name} {*}$extra_tags] -command {do_nothing}
    dui add variable $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags [list l_${button_name} {*}$extra_tags] -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags [list b_${button_name} {*}$extra_tags] -command $command
}

proc add_clear_button {button_name pages x y width height tv command {extra_tags {}} } {
    set ::${button_name}(pages) $pages
    dui add dtext $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 34] -fill $::skin_text_colour -anchor center -justify center -tags [list l_${button_name} {*}$extra_tags] -text $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags [list b_${button_name} {*}$extra_tags] -command $command
}

proc add_icon_button {button_name pages x y width height tv command {extra_tags {}} } {
    set ::${button_name}(pages) $pages
    dui add dtext $pages [expr $x + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font awesome_light [fixed_size 34]] -fill $::skin_text_colour -anchor center -justify center -tags [list l_${button_name} {*}$extra_tags] -text $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags [list b_${button_name} {*}$extra_tags] -command $command
}

proc add_icon_label_button {button_name pages x y width height tvi tv command {extra_tags {}} {long_press {}} } {
    set ::${button_name}(pages) $pages
    dui add dbutton $pages $x $y -bwidth $width -shape round -radius $::skin_button_radius -bheight $height -fill $::skin_foreground_colour -tags [list bb_${button_name} {*}$extra_tags] -command {do_nothing}
    dui add shape rect $pages [expr $x + 100] $y [expr $x + 104] [expr $y + 100] -width 0 -fill $::skin_background_colour -tags [list s_${button_name} {*}$extra_tags]
    dui add dtext $pages [expr $x + 50] [expr $y + $height/2 - 2] -font [skin_font D-font [fixed_size 40]] -fill $::skin_button_label_colour -anchor center -tags [list li_${button_name} {*}$extra_tags] -text $tvi
    dui add variable $pages [expr ($x + 44) + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 110] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags [list l_${button_name} {*}$extra_tags] -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags [list b_${button_name} {*}$extra_tags] -command $command -longpress_cmd $long_press
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

proc check_history_button_position {} {
    if {$::skin(show_history_button) == 1} {
        if {([.can itemcget l_dye_bg -state] eq "hidden" || "DYE" in $::settings(enabled_plugins) == 0) && $::dye_button_normally_hidden == 0} {
            set ::dye_button_normally_hidden 1
            workflow $::skin(workflow)
        }
        if {[.can itemcget l_dye_bg -state] eq "normal" && $::dye_button_normally_hidden == 1} {
            set ::dye_button_normally_hidden 0
            workflow $::skin(workflow)
        }
    }
    after 500 check_history_button_position
}

proc hide_graph_2 {} {
    set ::graph_hidden 1
    .can itemconfigure main_graph -state hidden
    dui item config off main_graph -initial_state hidden
}
proc show_graph_2 {} {
    set ::graph_hidden 0
    .can itemconfigure main_graph -state normal
    dui item config off main_graph -initial_state normal
}

set ::dye_button_normally_hidden 1
set ::graph_hidden 0
proc hide_graph {} {
    hide_graph_2
    hide_zoom_temperature
    exit_highlight_curve
    if {$::main_graph_showing == "espresso"} {
        hide_steam_graph
        set ::main_graph_showing "steam"
    }
    if {$::skin(theme) == "Damian"} {
        set_favs_showing
        set_button favs_number state normal
    }
    dui item moveto off heading_entry 450 -1001

    set ::zoom_temperature 0
    set_button auto_tare state normal
    if {$::settings(scale_type) == "decentscale" || $::android != 1} {
        set_button HDS_timer state normal
    }
    set pages {off espresso hotwaterrinse water}
    foreach key {pressure flow weight temperature resistance steps} {
        dui item config $pages ${key}_icon -initial_state hidden -state hidden
        dui item config $pages ${key}_text -initial_state hidden -state hidden
        dui item config $pages ${key}_data -initial_state hidden -state hidden
        dui item config $pages ${key}_key_button* -initial_state hidden -state hidden
    }
    dui item config off live_graph_data -initial_state hidden -state hidden
    .can itemconfigure graph_a -state hidden
    .can itemconfigure graph_b -state hidden
    .can itemconfigure graph_c -state hidden
    .can itemconfigure graph_d -state hidden
    dui item config off graph_a -initial_state hidden
    dui item config off graph_b -initial_state hidden
    dui item config off graph_c -initial_state hidden
    dui item config off graph_d -initial_state hidden

    dui item config off cga_p -initial_state hidden -state hidden
    dui item config off cgb_p -initial_state hidden -state hidden
    dui item config off cgc_p -initial_state hidden -state hidden
    dui item config off cgd_p -initial_state hidden -state hidden
    dui item config off cga_d -initial_state hidden -state hidden
    dui item config off cgb_d -initial_state hidden -state hidden
    dui item config off cgc_d -initial_state hidden -state hidden
    dui item config off cgd_d -initial_state hidden -state hidden

    dui item config off main_graph_toggle_label -initial_state hidden -state hidden
    dui item config off main_graph_toggle_button* -initial_state hidden -state hidden
    dui item config off main_graph_toggle_view_label -initial_state hidden -state hidden
    dui item config off main_graph_toggle_view_button* -initial_state hidden -state hidden
    dui item config off main_graph_toggle_goal_label -initial_state hidden -state hidden
    dui item config off main_graph_toggle_goal_button* -initial_state hidden -state hidden
    if {$::cache_graph_compare != 0} {
        set ::cache_graph_compare 0
        $::home_espresso_graph element configure compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure
        $::home_espresso_graph element configure compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow
        $::home_espresso_graph element configure compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight
        $::home_espresso_graph element configure compare_weight_chartable -xdata compare_espresso_elapsed -ydata compare_espresso_weight_chartable
        $::home_espresso_graph element configure compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change
        $::home_espresso_graph element configure compare_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket10th
        $::home_espresso_graph element configure compare_zoom_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket
        $::home_espresso_graph element configure compare_resistance -xdata compare_espresso_elapsed -ydata compare_espresso_resistance
    }
    if {$::skin(theme) == "Damian"} {
        if {$::skin(show_history_button) == 1} {
            dui item config off skin_history_button* -initial_state hidden -state hidden
        }
    }
}

proc show_graph {} {
    show_graph_2
    check_graph_axis

    set_button auto_tare state hidden
    set_button HDS_timer state hidden
    if {$::skin(theme) == "Damian"} {
        rest_fav_buttons
        set_button favs_number state hidden
        hide_skin_set
    }
    dui item config off live_graph_data -initial_state normal -state normal
    dui item config off fav_edit_buttons -initial_state hidden -state hidden
    set pages {off espresso hotwaterrinse water}
    foreach key {pressure flow weight temperature resistance steps} {
        dui item config $pages ${key}_icon -initial_state normal -state normal
        dui item config $pages ${key}_text -initial_state normal -state normal
        dui item config $pages ${key}_data -initial_state normal -state normal
        dui item config $pages ${key}_key_button* -initial_state normal -state normal
    }
    if {$::main_graph_height == [rescale_y_skin 840]} {
        dui item config off live_graph_data -initial_state hidden -state hidden
        .can itemconfigure graph_a -state normal
        .can itemconfigure graph_b -state normal
        .can itemconfigure graph_c -state normal
        .can itemconfigure graph_d -state normal
        dui item config off graph_a -initial_state normal
        dui item config off graph_b -initial_state normal
        dui item config off graph_c -initial_state normal
        dui item config off graph_d -initial_state normal

        dui item config off cga_p -initial_state normal -state normal
        dui item config off cgb_p -initial_state normal -state normal
        dui item config off cgc_p -initial_state normal -state normal
        dui item config off cgd_p -initial_state normal -state normal
        dui item config off cga_d -initial_state normal -state normal
        dui item config off cgb_d -initial_state normal -state normal
        dui item config off cgc_d -initial_state normal -state normal
        dui item config off cgd_d -initial_state normal -state normal
    }
    dui item config off main_graph_toggle_label -initial_state normal -state normal
    dui item config off main_graph_toggle_button* -initial_state normal -state normal
    dui item config off main_graph_toggle_view_label -initial_state normal -state normal
    dui item config off main_graph_toggle_view_button* -initial_state normal -state normal
    dui item config off main_graph_toggle_goal_label -initial_state normal -state normal
    dui item config off main_graph_toggle_goal_button* -initial_state normal -state normal
    if {$::skin(theme) == "Damian"} {
        if {$::skin(show_history_button) == 1} {
            dui item config off skin_history_button* -initial_state normal -state normal
        }
        if {$::skin(show_history_button) == 1} {
            if {[.can itemcget l_dye_bg -state] eq "hidden" || "DYE" in $::settings(enabled_plugins) == 0} {
                set ::dye_button_normally_hidden 1
            } else {
                set ::dye_button_normally_hidden 0
            }
            workflow $::skin(workflow)
        }
    }
}


proc hide_steam_graph {} {
    .can itemconfigure main_graph_steam -state hidden
    dui item config off main_graph_steam -initial_state hidden
    foreach key {pressure flow temperature} {
        dui item config off steam_steam_${key}_icon_off -initial_state hidden -state hidden
        dui item config off steam_steam_${key}_text_off -initial_state hidden -state hidden
        dui item config off steam_steam_${key}_button_off* -initial_state hidden -state hidden
    }
}

proc show_steam_graph {} {
    .can itemconfigure main_graph_steam -state normal
    dui item config off fav_edit_buttons -initial_state hidden -state hidden
    dui item config off main_graph_steam -initial_state normal
    foreach key {pressure flow temperature} {
        dui item config off steam_steam_${key}_icon_off -initial_state normal -state normal
        dui item config off steam_steam_${key}_text_off -initial_state normal -state normal
        dui item config off steam_steam_${key}_button_off* -initial_state normal -state normal
    }
    dui item config off main_graph_toggle_label -initial_state normal -state normal
    dui item config off main_graph_toggle_button* -initial_state normal -state normal
    set ::zoom_temperature 0
}

set ::main_graph_showing "steam"

proc toggle_main_graph {} {
    if {$::main_graph_showing == "steam"} {
        hide_graph
        set_button auto_tare state hidden
        show_steam_graph
        set ::main_graph_showing "espresso"
    } else {
        hide_steam_graph
        show_graph
        set ::main_graph_showing "steam"
    }
}


proc do_nothing {} {
    return
}

proc steam_stop_label {} {
    if {$::de1(substate) == 20} {
        return [translate "purge"]
        set_button steam_extend state hidden
    } else {
        return [translate "stop"]
        set_button steam_extend state normal
    }
}

proc toggle_favs_to_show {} {
    set ::skin(favs_to_show) [expr $::skin(favs_to_show) + 1]
    if {$::skin(favs_to_show) == 6} {
        set ::skin(favs_to_show) 2
    }
    rest_fav_buttons
    skin_save skin
}

proc set_favs_showing {} {
    if {[info exists ::plugins::DYE::settings(dsx2_use_dye_favs)]} {
        if {$::plugins::DYE::settings(dsx2_use_dye_favs) == 1} {
            return
        }
    }
    set_button fav3 state normal
    set_button fav4 state normal
    set_button fav5 state normal
    dui item config off fav_edit_buttons -initial_state normal -state normal
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
    if {$::graph_hidden == 0} {
        dui item config off fav_edit_buttons -initial_state hidden -state hidden
    }
}

proc rest_fav_buttons {} {
    if {[info exists ::plugins::DYE::settings(dsx2_use_dye_favs)]} {
        if {$::plugins::DYE::settings(dsx2_use_dye_favs) == 1} {
            return
        }
    }
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
    dui item moveto off ${option}_entry [expr $::beverage_type_x + 0] 350
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
    if {$::skin(theme) == "Damian"} {
        hide_header_settings
        set ::skin(icon_cal_check) 1
        hide_skin_set
        if {$::graph_hidden == 0} {hide_graph}
        dui item config off index_shape -initial_state normal -state normal
        dui item config off ${option}_index -initial_state normal -state normal
        set_button ${option}_index_button state normal
        if {$option == "espresso"} {show_espresso_settings}
        if {$option == "flush"} {show_flush_settings}
        if {$option == "water"} {show_water_settings}
        if {$option == "steam"} {show_steam_settings}
        set_button wf_close state normal
    }
    if {$::skin(theme) == "cafe"} {
        skin_lock page_show workflow_settings
    }
}

proc hide_skin_set {} {
    set ::skin(icon_cal_check) 1
    dui item config off index_shape -initial_state hidden -state hidden
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
    return {wf_info_button wf_bean_cup_button edit_profile select_profile wf_dose_minus wf_dose_plus wf_dose_minus_10 wf_dose_plus_10 wf_espresso_minus wf_espresso_plus wf_espresso_minus_10 wf_espresso_plus_10}
}

proc show_espresso_settings {} {
    set ::wf_espresso_set_showing 1
    foreach s {wf_beans wf_espresso wf_heading_profile wf_heading_profile_type wf_heading_espresso_weight wf_heading_bean_weight wf_heading_bean_cup} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_profile_button_list] {
        set_button ${s} state normal
    }
    if {$::settings(profile_has_changed) == 1} {
        set_button wf_save_saw_tick_button state normal
        set_button wf_save_saw_x_button state normal
    }
}

set ::wf_espresso_set_showing 1
proc hide_espresso_settings {} {
    if {$::wf_espresso_set_showing == 1} {
        set ::wf_espresso_set_showing 0
        foreach s {wf_beans wf_espresso wf_heading_profile wf_heading_profile_type wf_heading_espresso_weight wf_heading_bean_weight wf_heading_bean_cup} {
            dui item config off ${s} -initial_state hidden -state hidden
        }
        foreach s [wf_profile_button_list] {
            set_button ${s} state hidden
        }
        set_button wf_save_saw_tick_button state hidden
        set_button wf_save_saw_x_button state hidden
        hide_wf_espresso_info
    }
}

proc show_wf_espresso_info {} {
    dui item config off wf_espresso_info -initial_state normal -state normal
}

proc hide_wf_espresso_info {} {
    dui item config off wf_espresso_info -initial_state hidden -state hidden
}

proc wf_flush_button_list {} {
    return {wf_flush_flow_minus wf_flush_flow_plus wf_flush_flow_minus_10 wf_flush_flow_plus_10 \
            wf_flush_timer_minus wf_flush_timer_plus wf_flush_timer_minus_10 wf_flush_timer_plus_10}
}

proc show_flush_settings {} {
    set ::wf_flush_set_showing 1
    foreach s {wf_heading_flush_flow wf_flush_flow_setting \
               wf_heading_flush_timer wf_flush_timer_setting} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_flush_button_list] {
        set_button ${s} state normal
    }
}

set ::wf_flush_set_showing 1
proc hide_flush_settings {} {
    if {$::wf_flush_set_showing == 1} {
        set ::wf_flush_set_showing 0
        foreach s {wf_heading_flush_flow wf_flush_flow_setting \
            wf_heading_flush_timer wf_flush_timer_setting} {
            dui item config off ${s} -initial_state hidden -state hidden
        }
        foreach s [wf_flush_button_list] {
            set_button ${s} state hidden
        }
    }
}

proc wf_water_button_list {} {
    return {wf_water_flow_minus wf_water_flow_plus wf_water_flow_minus_10 wf_water_flow_plus_10 \
            wf_water_volume_minus wf_water_volume_plus wf_water_volume_minus_10 wf_water_volume_plus_10 \
            wf_water_temperature_minus wf_water_temperature_plus wf_water_temperature_minus_10 wf_water_temperature_plus_10 \
            wf_water_offset_minus wf_water_offset_plus}
}

proc show_water_settings {} {
    set ::wf_water_set_showing 1
    foreach s {wf_heading_water_flow wf_water_flow_setting \
               wf_heading_water_volume wf_water_volume_setting \
               wf_heading_water_offset wf_water_offset_setting \
               wf_heading_water_temperature wf_water_temperature_setting} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_water_button_list] {
        set_button ${s} state normal
    }
}

set ::wf_water_set_showing 1
proc hide_water_settings {} {
    if {$::wf_water_set_showing == 1} {
        set ::wf_water_set_showing 0
        foreach s {wf_heading_water_flow wf_water_flow_setting \
                   wf_heading_water_volume wf_water_volume_setting \
                   wf_heading_water_offset wf_water_offset_setting \
                   wf_heading_water_temperature wf_water_temperature_setting} {
            dui item config off ${s} -initial_state hidden -state hidden
        }
        foreach s [wf_water_button_list] {
            set_button ${s} state hidden
        }
    }
}

proc wf_steam_button_list {} {
    return {wf_steam_timer_minus wf_steam_timer_plus wf_steam_timer_minus_10 wf_steam_timer_plus_10}
}

proc show_jug {option} {
    foreach size {jug_s jug_m jug_l} {
        set_button ${size}_edit state normal
        set_button ${size}_x_button state hidden
        set_button ${size}_tick_button state hidden
        set_button ${size}_weight state hidden
    }
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
    set ::wf_steam_set_showing 1
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
    foreach s {wf_heading_steam_timer wf_steam_timer_setting wf_last_steam_time} {
        dui item config off ${s} -initial_state normal -state normal
    }
    foreach s [wf_steam_button_list] {
        set_button ${s} state normal
    }
    foreach s [wf_steam_set_list] {
        set_button wf_steam_${s} state normal
        set_button ${s}_edit state normal
    }
    set_button wf_steam_jug_auto state normal
    check_wf_steam_jug_auto_weight
}

proc wf_steam_set_list {} {
    return {jug_s jug_m jug_l}
}
set ::wf_steam_set_showing 1
proc hide_steam_settings {} {
    if {$::wf_steam_set_showing == 1} {
        set ::wf_steam_set_showing 0
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
        foreach s {wf_heading_steam_timer wf_steam_timer_setting wf_last_steam_time} {
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
    set_button wf_steam_jug_auto state hidden
    hide_wf_steam_jug_auto_weight
    }
}


proc set_jug {j} {
    set ::skin(jug_size) $j
    set ::skin(jug_g) $::skin(jug_${j})
    set_button wf_steam_jug_s icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_m icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_l icon_fill $::skin_button_label_colour
    if {$::skin(jug_auto) != 1} {
        set_button wf_steam_jug_${j} icon_fill $::skin_selected_colour
    }
    skin_save skin
}

proc check_current_jug {} {
    set j $::skin(jug_size)
    set ::skin(jug_g) $::skin(jug_${j})
    set_button wf_steam_jug_s icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_m icon_fill $::skin_button_label_colour
    set_button wf_steam_jug_l icon_fill $::skin_button_label_colour
    if {$::skin(jug_auto) != 1} {
        set_button wf_steam_jug_${j} icon_fill $::skin_selected_colour
    }
}

proc jug_size_data {} {
    if {$::skin(jug_auto) == 1 } {
        if {$::skin(jug_size) == "s"} {
            return "[translate "auto jug"] (S)"
        } elseif {$::skin(jug_size) == "m"} {
            return "[translate "auto jug"] (M)"
        } elseif {$::skin(jug_size) == "l"} {
            return "[translate "auto jug"] (L)"
        } else {
            return [translate "no jug set"]
        }
    } else {
        if {$::skin(jug_size) == "s"} {
            return [translate "small jug"]
        } elseif {$::skin(jug_size) == "m"} {
            return [translate "medium jug"]
        } elseif {$::skin(jug_size) == "l"} {
            return [translate "large jug"]
        } else {
            return [translate "no jug set"]
        }
    }
}

proc toggle_jug_auto {} {
    set ::skin(jug_auto) [expr {!$::skin(jug_auto)}]
    check_wf_steam_jug_auto_weight
    check_current_jug
}

proc hide_wf_steam_jug_auto_weight {} {
    dui item config off wf_steam_jug_auto_weight_heading -initial_state hidden -state hidden
    set_button wf_steam_jug_auto_weight state hidden
    set_button wf_steam_jug_auto_weight_plus state hidden
    set_button wf_steam_jug_auto_weight_minus state hidden
    dui item config off jug_numbers -initial_state hidden -state hidden
}

proc show_wf_steam_jug_auto_weight {} {
    dui item config off wf_steam_jug_auto_weight_heading -initial_state normal -state normal
    set_button wf_steam_jug_auto_weight state normal
    set_button wf_steam_jug_auto_weight_plus state normal
    set_button wf_steam_jug_auto_weight_minus state normal
    dui item config off jug_numbers -initial_state normal -state normal
}

proc check_wf_steam_jug_auto_weight {} {
    if {![info exist ::skin(jug_auto)]} {
        return
    }
    if {$::skin(jug_auto) == 1 && $::wf_steam_set_showing == 1} {
        show_wf_steam_jug_auto_weight
        set_button wf_steam_jug_auto icon_fill $::skin_selected_colour
    } else {
        hide_wf_steam_jug_auto_weight
        set_button wf_steam_jug_auto icon_fill $::skin_button_label_colour
    }
    check_jug_number
}

proc toggle_jug_number {} {
    if {$::skin(jug_single) == "jug_s"} {
        set ::skin(jug_single) "jug_m"
    } else {
        set ::skin(jug_single) "jug_s"
    }
    check_jug_number
}
proc check_jug_number {} {
    if {$::skin(jug_single) == "jug_m"} {
        set ::jug_s_number ""
        set ::jug_m_number $::skin(icon_espresso)
        set ::jug_l_number $::skin(icon_espresso)$::skin(icon_espresso)
    } else {
        set ::jug_s_number $::skin(icon_espresso)
        set ::jug_m_number $::skin(icon_espresso)$::skin(icon_espresso)
        set ::jug_l_number ""
    }
}

check_jug_number

proc skin_steam_time_calc {} {
    if {$::skin(jug_auto) == 1} {
        if {$::skin(jug_single) == "jug_s"} {
            set_jug s
            if {$::de1(scale_sensor_weight) > [expr (1.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_s)]} {
                set_jug m
            }
            if {$::de1(scale_sensor_weight) > [expr (2.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_m)]} {
                set_jug l
            }
        } else {
            set_jug s
            if {$::de1(scale_sensor_weight) > [expr (0.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_s)]} {
                set_jug m
            }
            if {$::de1(scale_sensor_weight) > [expr (1.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_m)]} {
                set_jug l
            }
        }
    }
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
                popup [translate "Steam timer set"]
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
            popup [translate "Steam timer set"]
        }
    }
}

proc skin_milk_weight {} {
    if {$::skin(jug_auto) == 1} {
        if {$::skin(jug_single) == "jug_s"} {
            set_jug s
            if {$::de1(scale_sensor_weight) > [expr (1.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_s)]} {
                set_jug m
            }
            if {$::de1(scale_sensor_weight) > [expr (2.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_m)]} {
                set_jug l
            }
        } else {
            set_jug s
            if {$::de1(scale_sensor_weight) > [expr (0.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_s)]} {
                set_jug m
            }
            if {$::de1(scale_sensor_weight) > [expr (1.7 * $::skin(single_drink_milk_volume)) + $::skin(jug_m)]} {
                set_jug l
            }
        }
    }
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

proc skin_bean_weight {} {
    set bean_cup [expr $::de1(scale_sensor_weight) - $::skin(bean_cup_g)]
    if {[expr ($::de1(scale_sensor_weight) > $::skin(bean_cup_g))] && [expr ($::de1(scale_sensor_weight) - $::skin(bean_cup_g)) < 32.1] && $::skin(bean_cup_g) != 0} {
        set g g
        set x 0
        catch {
            set x [expr [round_to_one_digits $bean_cup]]
        }
        return $x$g
    } else {
        return ""
    }
}

proc set_bean_cup_weight {} {
    set ::skin(bean_cup_g) [round_to_one_digits $::de1(scale_sensor_weight)]
    skin_save skin
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
    if {$::settings(profile_has_changed) == 1} { popup [translate "Profile Updated"]; save_profile }
    set_button wf_save_saw_x_button state hidden
    set_button wf_save_saw_tick_button state hidden
}

proc wf_cancel_profile_saw {} {
    if {$::settings(profile_has_changed) == 1} {
        popup [translate "Cancelled"]
        set ::settings(profile_has_changed) 0
        if {$::settings(settings_profile_type) == "settings_2c"} {
            set ::settings(final_desired_shot_weight_advanced) $::saw_backup
        } else {
            set ::settings(final_desired_shot_weight) $::saw_backup
        }
        set_button wf_save_saw_x_button state hidden
        set_button wf_save_saw_tick_button state hidden
    }
}

proc set_fav_colour {fav} {
    if {$::skin(theme) == "Damian"} {
        clear_fav_colour
    }
    set_button $fav icon_fill $::skin_selected_colour
    set_button $fav icon_font [skin_font awesome [fixed_size 28]]
}

proc clear_fav_colour {} {
    if {$::skin(theme) == "Damian"} {
        foreach key {fav1 fav2 fav3 fav4 fav5} {
            set_button $key icon_fill $::skin_button_label_colour
            set_button $key icon_font [skin_font awesome_light [fixed_size 28]]
        }
    } else {
        set_button $::skin(fav_key) icon_fill $::skin_button_label_colour
        set_button $::skin(fav_key) icon_font [skin_font awesome_light [fixed_size 28]]
    }
}

#### cafe
proc format_fav_entry {bn} {
    set a ::fav_label_
    append a $bn
    return $a
}

proc format_skin_fav_label_setting {bn} {
    set a ::skin(fav_label_
    append a $bn
    append a )
    return $a
}

proc format_fav_label {bn} {
    set a ::fav_label_fav
    append a $bn
    return $a
}

#####

proc check_fav_settings_vars {} {
    return {
        profile
        steam_disabled
        steam_flow
        steam_temperature
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
    if {$button_name == "dye"} {
        set width 230
        set height 100
        dui item moveto off bb_${button_name}_bg* $::skin(button_x_dye) [expr $::skin(button_y_dye) + 0]
        dui item moveto off s_${button_name}_bg [expr $::skin(button_x_dye) + 100] $::skin(button_y_dye)
        dui item moveto off li_${button_name}_bg [expr ($::skin(button_x_dye) + 50)] [expr $::skin(button_y_dye) + $height/2 - 2]
        dui item moveto off l_${button_name}_bg [expr ($::skin(button_x_dye) + 44) + $width/2] [expr $::skin(button_y_dye) + $height/2 - 2]
        dui item moveto off b_${button_name}_bg* $::skin(button_x_dye) $::skin(button_y_dye)

        dui item moveto off launch_dye* $::skin(button_x_${button_name}) $::skin(button_y_${button_name})
    } elseif {$button_name == "skin_history_button"} {
        dui item moveto off skin_history_button* $::skin(button_x_skin_history_button) $::skin(button_y_skin_history_button)
    } else {
        set z ::${button_name}(pages)
        set pages [set $z]
        set width 340
        set height 100

        dui item moveto $pages bb_${button_name}_start* $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 0]
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
            dui item moveto off ${button_name}_index [expr $::skin(button_x_${button_name}) + 170] 534
        }
    }
}
proc skin_screen_width_ratio {size} {
    return [expr $size * 2560 / $::settings(screen_size_width)]
}
proc skin_screen_height_ratio {size} {
    return [expr $size * 1600 / $::settings(screen_size_height)]
}

proc move_colour_button {button_name} {
     set z ::${button_name}(pages)
     set pages [set $z]
     set offset 2
     #if {$button_name == "skin_history_button"} {set offset 0}
     lassign [.can coords b_${button_name}] x0 y0 x1 y1
     set width [expr [skin_screen_height_ratio $x1] - [skin_screen_width_ratio $x0]]
     set height [expr [skin_screen_height_ratio $y1] - [skin_screen_height_ratio $y0]]
     dui item moveto $pages bb_${button_name}* $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 0]
     dui item moveto $pages l_${button_name} [expr $::skin(button_x_${button_name}) + $width/2] [expr $::skin(button_y_${button_name}) + $height/2 - $offset]
     dui item config $pages l_${button_name} -anchor center
     dui item moveto $pages b_${button_name}* $::skin(button_x_${button_name}) [expr $::skin(button_y_${button_name}) + 0]
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
    if {([ghc_required] || $::graph_hidden == 1) && $::de1_num_state($::de1(state)) == "Idle"} {
        show_skin_set $option
    } else {
        if {$option == "water"} {
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
                popup [translate "Machine still heating"]
            }
            if {$::settings(steam_timeout) == 0} {
                popup [translate "Steam is turned off"]
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
    if {$::de1(substate) == 1 || $::de1(substate) == 2 || $::de1(substate) == 20} {
        return ""
    }
    if {$t < 0} {
        return ""
    } else {
        return $t$s
    }
}

proc skin_water_timer {} {
    set t [round_to_integer [expr {$::settings(water_timeout) - [water_pour_timer]}]]
    set s s
    if {$::de1(substate) == 1 || $::de1(substate) == 2} {
        return ""
    }
    if {$t < 0} {
        return 0s
    } else {
        return $t$s
    }
}

proc toggle_heading {} {
    set ::skin(show_heading) [expr {$::skin(show_heading) - 1}]
    if {$::skin(show_heading) < 0} {
        set ::skin(show_heading) 3
    }
    check_heading
    if {$::skin(show_heading) == 1} {
        dui item moveto off heading_entry 450 640
    } else {
        dui item moveto off heading_entry 450 -1001
    }
    skin_save skin
}

set ::icon_size_state "show"
proc toggle_icon_size_settings {} {
    if {$::icon_size_state == "hide"} {
        set ::icon_size_state "show"
        dui item config off icon_size_set -initial_state hidden -state hidden
        set_button icon_size_minus state hidden
        set_button icon_size_plus state hidden
        set_button icon_size_minus_x10 state hidden
        set_button icon_size_plus_x10 state hidden
        dui item config off settings_toggles -initial_state normal -state normal
    } else {
        set ::icon_size_state "hide"
        dui item config off icon_size_set -initial_state normal -state normal
        set_button icon_size_minus state normal
        set_button icon_size_plus state normal
        set_button icon_size_minus_x10 state normal
        set_button icon_size_plus_x10 state normal
        dui item config off settings_toggles -initial_state hidden -state hidden
    }
}

proc skin_colour_theme_selection {} {
    set basedir [skin_directory]/colour_themes
    set types {
        {{colour themes}       {.txt}        }
    }
    set filename [tk_getOpenFile -filetypes $types -initialdir $basedir -title [translate "load colour theme"]]

    if {$filename != ""} {
        set tn [file tail $filename]
        set rn [file rootname $tn]
        set fd [file dirname $filename]
        set ::skin(colour_theme_folder) $fd
        set ::skin(colour_theme) $rn
        skin_save skin
        page_show restart_message
    }
}

proc check_heading {} {
    if {$::skin(show_heading) == 1} {
        set ::skin_heading $::skin(heading)
        dui item config off headerbar_heading -initial_state normal -state normal
        set ::start_button_y 150
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_y_dye) $::start_button_y
        set ::skin(button_y_skin_history_button) $::start_button_y
        move_workflow_button espresso
        move_workflow_button flush
        move_workflow_button steam
        move_workflow_button water
        move_workflow_button dye
        dui item moveto off skin_history_button* $::skin(button_x_skin_history_button) $::skin(button_y_skin_history_button)

    } else {
        set ::skin_heading {}
        dui item config off headerbar_heading -initial_state hidden -state hidden
        set ::start_button_y 100
        set ::skin(button_y_espresso) $::start_button_y
        set ::skin(button_y_steam) $::start_button_y
        set ::skin(button_y_flush) $::start_button_y
        set ::skin(button_y_water) $::start_button_y
        set ::skin(button_y_dye) $::start_button_y
        set ::skin(button_y_skin_history_button) $::start_button_y
        move_workflow_button espresso
        move_workflow_button flush
        move_workflow_button steam
        move_workflow_button water
        move_workflow_button dye
        dui item moveto off skin_history_button* $::skin(button_x_skin_history_button) $::skin(button_y_skin_history_button)
    }
    if {$::skin(show_heading) == 2 || $::skin(show_heading) == 3} {
        dui item config $::skin_home_pages headerar_bg0 -fill $::skin_background_colour
        dui item config $::skin_home_pages headerbar_bg1 -outline $::skin_background_colour -fill $::skin_background_colour
        dui item config $::skin_home_pages headerar_bg2 -fill $::skin_background_colour
        dui item config $::skin_home_pages headerbar_bg3 -outline $::skin_background_colour -fill $::skin_background_colour
        dui item config $::skin_home_pages headerbar_bg4 -outline $::skin_background_colour -fill $::skin_background_colour
        dui item config $::skin_home_pages sleep_button -fill $::skin_text_colour
        dui item config $::skin_home_pages headerbar_clock -fill $::skin_text_colour
    } else {
        dui item config $::skin_home_pages headerar_bg0 -fill $::skin_foreground_colour
        dui item config $::skin_home_pages headerbar_bg1 -outline $::skin_foreground_colour -fill $::skin_foreground_colour
        dui item config $::skin_home_pages headerar_bg2 -fill $::skin_foreground_colour
        dui item config $::skin_home_pages headerbar_bg3 -outline $::skin_foreground_colour -fill $::skin_foreground_colour
        dui item config $::skin_home_pages headerbar_bg4 -outline $::skin_foreground_colour -fill $::skin_foreground_colour
        dui item config $::skin_home_pages sleep_button -fill $::skin_button_label_colour
        dui item config $::skin_home_pages headerbar_clock -fill $::skin_button_label_colour
    }
    if {$::skin(show_heading) == 3} {
        dui item config $::skin_home_pages headerbar_clock -initial_state hidden -state hidden
        dui item config $::skin_home_pages wifi_icon  -initial_state hidden -state hidden
        dui item config $::skin_home_pages battery_icon  -initial_state hidden -state hidden
    } else {
        dui item config $::skin_home_pages headerbar_clock -initial_state normal -state normal
        dui item config $::skin_home_pages wifi_icon  -initial_state normal -state normal
        dui item config $::skin_home_pages battery_icon  -initial_state normal -state normal
    }
}

proc header_settings {} {
    if {[dui page current] == "skin_lock"} {
        page_show off
    }
    if {[dui page current] != "off"} {
        return
    }
    if {$::graph_hidden == 0} {
        #hide_skin_set
        set_button edit_heading_button state normal
        set_button edit_colour_theme_button state normal
        set_button edit_icon_size_button state normal
        set_button edit_flow_rate_cal_button state normal
        set_button edit_theme_button state normal
        hide_graph
        set_button close_heading_settings state normal
        set_button exit_heading_settings state normal
        if {$::skin(show_heading) == 1} {
            dui item moveto off heading_entry 450 640
        }
        dui item config off fav_edit_buttons -initial_state hidden -state hidden
        dui item config off settings_toggles -initial_state normal -state normal
        if {$::skin(theme) == "cafe"} {
            dui item config off settings_history_button_option -initial_state disabled -state disabled
        }
        if {$::skin(show_history_button) == 1} {
            dui item config off skin_history_button* -initial_state normal -state normal
        }
    } else {
        hide_header_settings
        show_graph
        skin_save skin
    }
}

proc hide_header_settings {} {
    set ::skin_initial_setup ""
    set_button edit_heading_button state hidden
    set_button edit_colour_theme_button state hidden
    set_button edit_icon_size_button state hidden
    set_button edit_flow_rate_cal_button state hidden
    set_button edit_theme_button state hidden
    set_button close_heading_settings state hidden
    set_button exit_heading_settings state hidden
    dui item moveto off heading_entry 450 -1001
    set ::icon_size_state "show"
    dui item config off icon_size_set -initial_state hidden -state hidden
    set_button icon_size_minus state hidden
    set_button icon_size_plus state hidden
    set_button icon_size_minus_x10 state hidden
    set_button icon_size_plus_x10 state hidden
    dui item config off settings_toggles -initial_state hidden -state hidden
    dui item config off skin_history_button* -initial_state hidden -state hidden
}

proc wifi_status {} {
    if {$::android == 1 && [borg networkinfo] == "wifi"} {
        dui item config $::skin_home_pages wifi_icon -fill $::skin_green
    } else {
        dui item config $::skin_home_pages wifi_icon -fill $::skin_button_label_colour
    }
}

proc skin_battery_status {} {
    set state [battery_state]
    set level [battery_percent]
    if {$state == "charging" || $state == "charged"} {
        dui item config $::skin_home_pages battery_icon -fill $::skin_green
        return \uf376
    } elseif {$level < 20} {
        dui item config $::skin_home_pages battery_icon -fill $::skin_red
        return \uf244
    } elseif {$level < 50} {
        dui item config $::skin_home_pages battery_icon -fill $::skin_red
        return \ue0b1
    } elseif {$level < 70} {
        dui item config $::skin_home_pages battery_icon -fill $::skin_orange
        return \uf242
    } elseif {$level < 80} {
        dui item config $::skin_home_pages battery_icon -fill $::skin_green
        return \uf241
    } else {
    dui item config $::skin_home_pages battery_icon -fill $::skin_green
    return \uf240
    }
}

set ::flush_timer_backup 0
proc flush_extend {} {
    set ::settings(flush_seconds) [expr $::settings(flush_seconds) + 5]
    de1_send_steam_hotwater_settings
}

proc flush_extend1 {} {
    ### working in progress
    set flushtime $::settings(flush_seconds)
    set remaining [expr {$::settings(flush_seconds) - [flush_pour_timer]}]
    set ::settings(flush_seconds) [expr {$remaining + 5}]
    de1_send_steam_hotwater_settings
    set ::settings(flush_seconds) $flushtime
}

set ::steam_timer_backup 0
proc steam_extend {} {
    set ::settings(steam_timeout) [expr $::settings(steam_timeout) + 5]
    de1_send_steam_hotwater_settings
}

proc skin_espresso_elapsed_timer {} {
    set pit [espresso_preinfusion_timer]
    set pt [espresso_pour_timer]
    set tt [espresso_elapsed_timer]
    if {$pit >= 1} {
        return "$pit+$pt = $tt"
    } else {
        return "$tt"
    }
}

proc skin_water_live_data {} {
    set piv [round_to_integer $::de1(preinfusion_volume)]
    set pv [round_to_integer $::de1(pour_volume)]
    set tv [expr {[round_to_integer $::de1(preinfusion_volume)] + [round_to_integer $::de1(pour_volume)]}]

    if {$piv >= 1} {
        return "$piv + $pv = $tv"
    } else {
        return "$tv"
    }
}

proc skin_water_data {} {
    if {$::skin_graphs(live_graph_pi_water) >= 1} {
        return "$::skin_graphs(live_graph_pi_water) + $::skin_graphs(live_graph_pour_water) = $::skin_graphs(live_graph_water)"
    } else {
        return "$::skin_graphs(live_graph_water)"
    }
}

proc skin_graph_info {} {
    set time [cache_date_time_format $::skin_graphs(live_graph_time)]
    set p $::skin_graphs(live_graph_profile)
    set b [round_to_one_digits $::skin_graphs(live_graph_beans)]
    set w [round_to_one_digits $::skin_graphs(live_graph_weight)]
    if {[info exist ::skin_er_to_one_percent]} {
        set er [round_to_two_digits [expr $::skin_graphs(live_graph_weight) / ($::skin_graphs(live_graph_beans) + 0.001)]]
    } else {
        set er [round_to_one_digits [expr $::skin_graphs(live_graph_weight) / ($::skin_graphs(live_graph_beans) + 0.001)]]
    }
    set pi $::skin_graphs(live_graph_pi_time)
    set pt $::skin_graphs(live_graph_pour_time)
    set t $::skin_graphs(live_graph_shot_time)
    set s { }
    set g {     }
    set v [skin_water_data]
    return ${p}${g}${s}${v}ml${g}${s}${pi}s${s}+${s}${pt}s${s}=${s}${t}s${g}${s}${b}g${s}:${s}${w}g${s}(1:${er})${g}${time}
}

proc skin_graph_live_info {} {
    set v [skin_water_live_data]
    set p $::settings(profile_title)
    set b $::settings(grinder_dose_weight)
    set w [round_to_one_digits $::de1(scale_weight)]
    if {[info exist ::skin_er_to_one_percent]} {
        set er [round_to_two_digits [expr $::de1(scale_weight) / ($::settings(grinder_dose_weight) + 0.001)]]
    } else {
         set er [round_to_one_digits [expr $::de1(scale_weight) / ($::settings(grinder_dose_weight) + 0.001)]]
    }
    set pi [espresso_preinfusion_timer]
    set pt [espresso_pour_timer]
    set t [espresso_elapsed_timer]
    set s { }
    set g {     }
    return ${p}${g}${s}${v}ml${g}${s}${pi}s${s}+${s}${pt}s${s}=${s}${t}s${g}${s}${b}g${s}:${s}${w}g${s}(1:${er})
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
    if {$::skin(theme) == "Damian"} {
        if {$option == "latte"} {
            set ::skin(button_x_espresso) [expr $::start_button_x + 110]
            set ::skin(button_y_espresso) $::start_button_y
            set ::skin(button_x_flush) [expr $::start_button_x + 470]
            set ::skin(button_y_flush) $::start_button_y
            set ::skin(button_x_steam) [expr $::start_button_x + 830]
            set ::skin(button_y_steam) $::start_button_y
            set ::skin(button_x_water) [expr $::start_button_x + 3000]
            set ::skin(button_y_water) 0
            set ::skin(button_x_dye) [expr $::start_button_x + 1190]
            set ::skin(button_y_dye) $::start_button_y
            if {$::dye_button_normally_hidden == 1} {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190]
                set ::skin(button_y_skin_history_button) $::start_button_y
            } else {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190 + 250]
                set ::skin(button_y_skin_history_button) $::start_button_y
            }
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
            set ::skin(button_x_dye) [expr $::start_button_x + 1190]
            set ::skin(button_y_dye) $::start_button_y
            if {$::dye_button_normally_hidden == 1} {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190]
                set ::skin(button_y_skin_history_button) $::start_button_y
            } else {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190 + 250]
                set ::skin(button_y_skin_history_button) $::start_button_y
            }
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
            set ::skin(button_x_dye) [expr $::start_button_x + 1190]
            set ::skin(button_y_dye) $::start_button_y
            if {$::dye_button_normally_hidden == 1} {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190]
                set ::skin(button_y_skin_history_button) $::start_button_y
            } else {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1190 + 250]
                set ::skin(button_y_skin_history_button) $::start_button_y
            }
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
            set ::skin(button_x_dye) [expr $::start_button_x + 830]
            set ::skin(button_y_dye) $::start_button_y
            if { $::dye_button_normally_hidden == 1} {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 830]
                set ::skin(button_y_skin_history_button) $::start_button_y
            } else {
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 830 + 250]
                set ::skin(button_y_skin_history_button) $::start_button_y
            }
        }
        if {$option == "none"} {
            if {"DYE" in $::settings(enabled_plugins) == 1} {

                if {$::dye_button_normally_hidden == 1} {
                    set ::skin(button_x_espresso) [expr $::start_button_x + 10]
                    set ::skin(button_y_espresso) $::start_button_y
                    set ::skin(button_x_steam) [expr $::start_button_x + 370]
                    set ::skin(button_y_steam) $::start_button_y
                    set ::skin(button_x_water) [expr $::start_button_x + 730]
                    set ::skin(button_y_water) $::start_button_y
                    set ::skin(button_x_flush) [expr $::start_button_x + 1090]
                    set ::skin(button_y_flush) $::start_button_y
                    set ::skin(button_x_dye) [expr $::start_button_x + 1450]
                    set ::skin(button_y_dye) $::start_button_y
                    set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1450]
                    set ::skin(button_y_skin_history_button) $::start_button_y
                } else {
                    set ::skin(button_x_espresso) [expr $::start_button_x -20]
                    set ::skin(button_y_espresso) $::start_button_y
                    set ::skin(button_x_steam) [expr $::start_button_x + 340]
                    set ::skin(button_y_steam) $::start_button_y
                    set ::skin(button_x_water) [expr $::start_button_x + 700]
                    set ::skin(button_y_water) $::start_button_y
                    set ::skin(button_x_flush) [expr $::start_button_x + 1060]
                    set ::skin(button_y_flush) $::start_button_y
                    set ::skin(button_x_dye) [expr $::start_button_x + 1420]
                    set ::skin(button_y_dye) $::start_button_y
                    set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1420 + 250]
                    set ::skin(button_y_skin_history_button) $::start_button_y
                }
            } else {
                set ::skin(button_x_espresso) [expr $::start_button_x + 110]
                set ::skin(button_y_espresso) $::start_button_y
                set ::skin(button_x_steam) [expr $::start_button_x + 470]
                set ::skin(button_y_steam) $::start_button_y
                set ::skin(button_x_water) [expr $::start_button_x + 830]
                set ::skin(button_y_water) $::start_button_y
                set ::skin(button_x_flush) [expr $::start_button_x + 1190]
                set ::skin(button_y_flush) $::start_button_y
                set ::skin(button_x_dye) [expr $::start_button_x + 1550]
                set ::skin(button_y_dye) $::start_button_y
                set ::skin(button_x_skin_history_button) [expr $::start_button_x + 1550]
                set ::skin(button_y_skin_history_button) $::start_button_y
            }
        }
        set ::settings(DSx2_workflow) $::skin(workflow)
        move_workflow_button espresso
        move_workflow_button flush
        move_workflow_button steam
        move_workflow_button water
        move_workflow_button dye
        dui item moveto off skin_history_button* $::skin(button_x_skin_history_button) $::skin(button_y_skin_history_button)
        set_button wf_latte label_fill $::skin_button_label_colour
        set_button wf_long label_fill $::skin_button_label_colour
        set_button wf_americano label_fill $::skin_button_label_colour
        set_button wf_espresso label_fill $::skin_button_label_colour
        set_button wf_none label_fill $::skin_button_label_colour
        set_button wf_${option} label_fill $::skin_selected_colour
    } else {
        set wfs 70
        if {$::settings(beverage_type) == "cleaning"} {
            dui item moveto off pwr_button_sleep* {} 100
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 100
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 + $wfs - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 + $wfs - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_selected_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_1 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_1 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_0 + $wfs + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            popup [translate "Workflow options not available for cleaning profiles"]
            return
        }
        if {$option == "latte"} {
            dui item moveto off pwr_button_sleep* {} 100
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 100
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 + $wfs - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 + $wfs - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_selected_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_1 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_1 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_2 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_2 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_3 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_3 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_2 + $wfs + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_2 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_3 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
        }
        if {$option == "long"} {
            dui item moveto off pwr_button_sleep* {} 100
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 100
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 + $wfs - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 + $wfs - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_selected_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_2 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_2 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_3 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_3 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_1 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_1 + $wfs + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_2 + $wfs + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_2 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_3 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
        }
        if {$option == "americano"} {
            dui item moveto off pwr_button_sleep* {} 100
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 100
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 + $wfs - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 + $wfs - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_selected_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_1 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_1 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_3 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_3 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_2 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_2 + $wfs + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_2 + $wfs + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_3 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_2 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift]
        }
        if {$option == "espresso"} {
            dui item moveto off pwr_button_sleep* {} 100
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 100
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 + $wfs - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 + $wfs - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_selected_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_1 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_1 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_2 + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_2 + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_h + $wfs + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_h + $wfs + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_1 + $wfs + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_2 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_h + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_h + 50 + $::wf_start_button_shift]
        }
        if {$option == "none"} {
            dui item moveto off pwr_button_sleep* {} 70
            dui item moveto "espresso flush steam water" pwr_button_stop* {} 70
            dui item moveto off workflow_type_bg {} [expr $::start_button_pos_1 - 38 + $::start_button_shift]
            dui item moveto off workflow_type_text {} [expr $::start_button_pos_1 - 30 + $::start_button_shift]
            dui item config off workflow_type_text -fill $::skin_button_label_colour
            dui item moveto off start_buttons_eg1 {} [expr $::start_button_pos_1 + $::start_button_shift]
            dui item moveto off start_buttons_eg2 {} [expr $::start_button_pos_1 + 60 + $::start_button_shift]
            dui item moveto off start_buttons_fg1 {} [expr $::start_button_pos_2 + $::start_button_shift]
            dui item moveto off start_buttons_fg2 {} [expr $::start_button_pos_2 + 60 + $::start_button_shift]
            dui item moveto off start_buttons_sg1 {} [expr $::start_button_pos_3 + $::start_button_shift]
            dui item moveto off start_buttons_sg2 {} [expr $::start_button_pos_3 + 60 + $::start_button_shift]
            dui item moveto off start_buttons_wg1 {} [expr $::start_button_pos_4 + $::start_button_shift]
            dui item moveto off start_buttons_wg2 {} [expr $::start_button_pos_4 + 60 + $::start_button_shift]
            dui item moveto off auto_load_data {} [expr $::auto_load_data_pos_3 + $::start_button_shift]

            dui item moveto workflow_settings start_buttons_eg1 {} [expr $::start_button_pos_1 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_eg2 {} [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg1 {} [expr $::start_button_pos_2 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_fg2 {} [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg1 {} [expr $::start_button_pos_3 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_sg2 {} [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg1 {} [expr $::start_button_pos_4 + $::wf_start_button_shift]
            dui item moveto workflow_settings start_buttons_wg2 {} [expr $::start_button_pos_4 + 50 + $::wf_start_button_shift]
        }

    }
}

proc set_scale_weight_to_dose {} {
    if {[expr $::de1(scale_sensor_weight) - $::skin(bean_cup_g)] < 6} {
        popup [translate "weight too low"]
    } elseif { [expr $::de1(scale_sensor_weight) - $::skin(bean_cup_g)] > 32.1} {
        popup [translate "weight too high"]
    } else {
        set ::settings(grinder_dose_weight) [round_to_one_digits [expr $::de1(scale_sensor_weight) - $::skin(bean_cup_g)]]
        skin_save settings
        popup [translate "Bean weight set"]
    }
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
        if {$::settings(grinder_dose_weight) < 2} {set ::settings(grinder_dose_weight) 2}
        if {$::settings(grinder_dose_weight) > 40} {set ::settings(grinder_dose_weight) 40}
        skin_save settings
    }
    if {$var == "saw"} {

        if {$::settings(settings_profile_type) == "settings_2c"} {
            if {$::settings(profile_has_changed) == 0} {
                set ::saw_backup $::settings(final_desired_shot_weight_advanced)
            }
            set ::settings(final_desired_shot_weight_advanced) [round_to_integer [expr $::settings(final_desired_shot_weight_advanced) + $value]]
            if {$::settings(final_desired_shot_weight_advanced) < 0} {set ::settings(final_desired_shot_weight_advanced) 0}
            if {$::settings(final_desired_shot_weight_advanced) > 2000} {set ::settings(final_desired_shot_weight_advanced) 2000}
            if {$::saw_backup == $::settings(final_desired_shot_weight_advanced)} {
                set ::settings(profile_has_changed) 0
            } else {
                set ::settings(profile_has_changed) 1
            }
        } else {
            if {$::settings(profile_has_changed) == 0} {
                set ::saw_backup $::settings(final_desired_shot_weight)
            }
            set ::settings(final_desired_shot_weight) [round_to_integer [expr $::settings(final_desired_shot_weight) + $value]]
            if {$::settings(final_desired_shot_weight) < 0} {set ::settings(final_desired_shot_weight) 0}
            if {$::settings(final_desired_shot_weight) > 100} {set ::settings(final_desired_shot_weight) 100}
            if {$::saw_backup == $::settings(final_desired_shot_weight_advanced)} {
                set ::settings(profile_has_changed) 0
            } else {
                set ::settings(profile_has_changed) 1
            }
        }
        if {$::settings(profile_has_changed) == 1} {
            set_button wf_save_saw_x_button state normal
            set_button wf_save_saw_tick_button state normal
        } else {
            set_button wf_save_saw_x_button state hidden
            set_button wf_save_saw_tick_button state hidden
        }
        clear_fav_colour
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
    if {$var == "wsaw_offset"} {
        set ::skin(wsaw_offset) [expr $::skin(wsaw_offset) + $value]
        set ::settings(water_volume) [expr $::settings(water_volume) - $value]
        if {$::skin(wsaw_offset) < - 10} {set ::skin(wsaw_offset) -10; set ::settings(water_volume) [expr $::settings(water_volume) + $value]}
        if {$::skin(wsaw_offset) > 10} {set ::skin(wsaw_offset) 10; set ::settings(water_volume) [expr $::settings(water_volume) + $value]}
    }
    if {$var == "unlock_time"} {
        set ::skin(unlock_time) [expr $::skin(unlock_time) + $value]
        if {$::skin(unlock_time) < 5} {set ::skin(unlock_time) 5}
    }
}

proc adjust_icon_size_up {} {
    set ::skin(icon_factor) [round_to_two_digits [expr $::skin(icon_factor) + 0.01]]
    dui item config off skin_icon_size_test -font [skin_font awesome_light [fixed_size 130]]
    resize_fixed_icons
    skin_save skin
}

proc adjust_icon_size_down {} {
    set ::skin(icon_factor) [round_to_two_digits [expr $::skin(icon_factor) - 0.01]]
    dui item config off skin_icon_size_test -font [skin_font awesome_light [fixed_size 130]]
    resize_fixed_icons
    skin_save skin
}
proc adjust_icon_size_up_x10 {} {
    set ::skin(icon_factor) [round_to_two_digits [expr $::skin(icon_factor) + 0.10]]
    dui item config off skin_icon_size_test -font [skin_font awesome_light [fixed_size 130]]
    resize_fixed_icons
    skin_save skin
}

proc adjust_icon_size_down_x10 {} {
    set ::skin(icon_factor) [round_to_two_digits [expr $::skin(icon_factor) - 0.10]]
    dui item config off skin_icon_size_test -font [skin_font awesome_light [fixed_size 130]]
    resize_fixed_icons
    skin_save skin
}

proc resize_fixed_icons {} {
    if {$::skin(theme) == "Damian"} {
        dui item config off heading_entry -font [skin_font font [fixed_size 16]]
        dui item config $::skin_home_pages heading -font [skin_font font [fixed_size 40]]
        dui item config $::skin_home_pages headerbar_clock -font [skin_font font [fixed_size 15]]
        dui item config $::skin_home_pages wifi_icon -font [skin_font awesome [fixed_size 14]]
        dui item config $::skin_home_pages battery_icon -font [skin_font awesome_light [fixed_size 18]]
        dui item config $::skin_home_pages heading_entry -font [skin_font font [fixed_size 16]]
        set_button fav1 icon_font [skin_font awesome_light [fixed_size 28]]
        set_button fav2 icon_font [skin_font awesome_light [fixed_size 28]]
        set_button fav3 icon_font [skin_font awesome_light [fixed_size 28]]
        set_button fav4 icon_font [skin_font awesome_light [fixed_size 28]]
        set_button fav5 icon_font [skin_font awesome_light [fixed_size 28]]
        set_button fav1_edit font [skin_font awesome_light [fixed_size 28]]
        set_button fav2_edit font [skin_font awesome_light [fixed_size 28]]
        set_button fav3_edit font [skin_font awesome_light [fixed_size 28]]
        set_button fav4_edit font [skin_font awesome_light [fixed_size 28]]
        set_button fav5_edit font [skin_font awesome_light [fixed_size 28]]
        dui item config $::skin_home_pages decent_icon -font [skin_font D-font [fixed_size 264]]
        dui item config espresso espresso_pour -font [skin_font D-font [fixed_size 52]]
        dui item config "espresso water" ewc -font [skin_font D-font [fixed_size 52]]
        dui item config flush flush_motion -font [skin_font D-font [fixed_size 52]]
        dui item config steam steam_motion -font [skin_font D-font [fixed_size 40]]
        dui item config water water_motion -font [skin_font D-font [fixed_size 60]]
        dui item config $::skin_home_pages de1_btl_icon -font [skin_font D-font [fixed_size 19]]
        dui item config $::skin_home_pages machine_state -font [skin_font awesome_light [fixed_size 60]]
        dui item config $::skin_home_pages scale_btl_icon -font [skin_font D-font [fixed_size 19]]
        set_button bw font [skin_font D-font [fixed_size 42]]
        set_button mw font [skin_font D-font [fixed_size 42]]
        dui item config $::skin_home_pages sleep_button -font [skin_font D-font [fixed_size 68]]
        set_button stop_espresso_icon font [skin_font D-font [fixed_size 40]]
        set_button power_sleep icon_font [skin_font awesome_light [fixed_size 26]]
        set_button power_exit icon_font [skin_font awesome_light [fixed_size 26]]
        dui item config "off flush water" pressure_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" flow_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" weight_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" temperature_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" resistance_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" steps_text -font [skin_font font $::key_font_size]
        dui item config espresso pressure_data -font [skin_font font $::key_font_size]
        dui item config espresso flow_data -font [skin_font font $::key_font_size]
        dui item config espresso weight_data -font [skin_font font $::key_font_size]
        dui item config espresso temperature_data -font [skin_font font $::key_font_size]
        dui item config espresso resistance_data -font [skin_font font $::key_font_size]
        dui item config espresso steps_data -font [skin_font font $::key_font_size]
        $::home_espresso_graph axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph axis configure y -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph_espresso axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph_espresso axis configure y -tickfont [skin_font font [fixed_size 14]]
        $::home_steam_graph axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_steam_graph axis configure y -tickfont [skin_font font [fixed_size 14]]
        dui item config off fav1_entry -font [skin_font font [fixed_size 20]]
        dui item config off fav2_entry -font [skin_font font [fixed_size 20]]
        dui item config off fav3_entry -font [skin_font font [fixed_size 20]]
        dui item config off fav4_entry -font [skin_font font [fixed_size 20]]
        dui item config off fav5_entry -font [skin_font font [fixed_size 20]]
        dui item config off fav1_auto_load_l1 -font [skin_font font [fixed_size 18]]
        dui item config off fav1_auto_load_l2 -font [skin_font font [fixed_size 18]]
        dui item config off fav1_auto_load_l3 -font [skin_font D-font [fixed_size 60]]
        dui item config off fav2_auto_load_l1 -font [skin_font font [fixed_size 18]]
        dui item config off fav2_auto_load_l2 -font [skin_font font [fixed_size 18]]
        dui item config off fav2_auto_load_l3 -font [skin_font D-font [fixed_size 60]]
        dui item config off fav3_auto_load_l1 -font [skin_font font [fixed_size 18]]
        dui item config off fav3_auto_load_l2 -font [skin_font font [fixed_size 18]]
        dui item config off fav3_auto_load_l3 -font [skin_font D-font [fixed_size 60]]
        dui item config off fav4_auto_load_l1 -font [skin_font font [fixed_size 18]]
        dui item config off fav4_auto_load_l2 -font [skin_font font [fixed_size 18]]
        dui item config off fav4_auto_load_l3 -font [skin_font D-font [fixed_size 60]]
        dui item config off fav5_auto_load_l1 -font [skin_font font [fixed_size 18]]
        dui item config off fav5_auto_load_l2 -font [skin_font font [fixed_size 18]]
        dui item config off fav5_auto_load_l3 -font [skin_font D-font [fixed_size 60]]
        dui item config off espresso_index -font [skin_font D-font [fixed_size 30]]
        dui item config off steam_index -font [skin_font D-font [fixed_size 30]]
        dui item config off flush_index -font [skin_font D-font [fixed_size 30]]
        dui item config off water_index -font [skin_font D-font [fixed_size 30]]
        set_button wf_dose_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_dose_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_dose_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_dose_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_espresso_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_espresso_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_espresso_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_espresso_plus font [skin_font awesome_light [fixed_size 34]]
        set_button jug_s_edit font [skin_font awesome_light [fixed_size 28]]
        set_button jug_m_edit font [skin_font awesome_light [fixed_size 28]]
        set_button jug_l_edit font [skin_font awesome_light [fixed_size 28]]
        set_button wf_steam_timer_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_steam_timer_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_steam_timer_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_steam_timer_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_steam_cal_time_minus font [skin_font D-font [fixed_size 34]]
        set_button wf_steam_jug_time font [skin_font awesome_light [fixed_size 34]]
        set_button wf_steam_cal_time_plus font [skin_font D-font [fixed_size 34]]
        set_button wf_flush_flow_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_flow_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_flow_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_flow_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_timer_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_timer_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_timer_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_flush_timer_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_flow_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_flow_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_flow_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_flow_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_temperature_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_temperature_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_temperature_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_temperature_plus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_volume_minus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_volume_plus_10 font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_volume_minus font [skin_font awesome_light [fixed_size 34]]
        set_button wf_water_volume_plus font [skin_font awesome_light [fixed_size 34]]
        if {"DYE" in $::settings(enabled_plugins) == 1 && $::settings(skin) == "DSx2" && $::skin(theme) == "Damian"} {
            set_button dye_bg icon_font [skin_font awesome_light [fixed_size 26]]
        }
        $::cache_graph_a axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_a axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_b axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_b axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_c axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_c axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_d axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_d axis configure y -tickfont [skin_font font [fixed_size 8]]
        dui item config off cga_p -font [skin_font font [fixed_size 12]]
        dui item config off cga_d -font [skin_font font [fixed_size 12]]
        dui item config off cgb_p -font [skin_font font [fixed_size 12]]
        dui item config off cgb_d -font [skin_font font [fixed_size 12]]
        dui item config off cgc_p -font [skin_font font [fixed_size 12]]
        dui item config off cgc_d -font [skin_font font [fixed_size 12]]
        dui item config off cgd_p -font [skin_font font [fixed_size 12]]
        dui item config off cgd_d -font [skin_font font [fixed_size 12]]
        set_button fav1_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav1_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav2_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav2_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav3_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav3_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav4_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav4_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav5_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button fav5_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button wf_info_button font [skin_font awesome_light [fixed_size 34]]
        set_button wf_save_saw_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button wf_save_saw_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_s_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_s_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_m_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_m_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_l_x_button font [skin_font awesome_light [fixed_size 34]]
        set_button jug_l_tick_button font [skin_font awesome_light [fixed_size 34]]
        set_button espresso_start icon_font [skin_font D-font [fixed_size 40]]
        set_button steam_start icon_font [skin_font D-font [fixed_size 40]]
        set_button flush_start icon_font [skin_font D-font [fixed_size 40]]
        set_button water_start icon_font [skin_font D-font [fixed_size 40]]
        set_button stop_steam icon_font [skin_font D-font [fixed_size 40]]
        set_button stop_flush icon_font [skin_font D-font [fixed_size 40]]
        set_button stop_water icon_font [skin_font D-font [fixed_size 40]]
    } else {
        dui item config off heading_entry -font [skin_font font [fixed_size 16]]
        dui item config $::skin_home_pages heading -font [skin_font font [fixed_size 38]]
        dui item config $::skin_home_pages headerbar_clock -font [skin_font font [fixed_size 15]]
        dui item config $::skin_home_pages wifi_icon -font [skin_font awesome [fixed_size 14]]
        dui item config $::skin_home_pages battery_icon -font [skin_font awesome_light [fixed_size 18]]
        dui item config $::skin_home_pages heading_entry -font [skin_font font [fixed_size 16]]

        dui item config "off flush water" pressure_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" flow_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" weight_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" temperature_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" resistance_text -font [skin_font font $::key_font_size]
        dui item config "off flush water" steps_text -font [skin_font font $::key_font_size]
        dui item config espresso pressure_data -font [skin_font font $::key_font_size]
        dui item config espresso flow_data -font [skin_font font $::key_font_size]
        dui item config espresso weight_data -font [skin_font font $::key_font_size]
        dui item config espresso temperature_data -font [skin_font font $::key_font_size]
        dui item config espresso resistance_data -font [skin_font font $::key_font_size]
        dui item config espresso steps_data -font [skin_font font $::key_font_size]
        $::home_espresso_graph axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph axis configure y -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph_espresso axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_espresso_graph_espresso axis configure y -tickfont [skin_font font [fixed_size 14]]
        $::home_steam_graph axis configure x -tickfont [skin_font font [fixed_size 14]]
        $::home_steam_graph axis configure y -tickfont [skin_font font [fixed_size 14]]
        $::cache_graph_a axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_a axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_b axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_b axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_c axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_c axis configure y -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_d axis configure x -tickfont [skin_font font [fixed_size 8]]
        $::cache_graph_d axis configure y -tickfont [skin_font font [fixed_size 8]]

        dui item config $::skin_home_pages decent_icon -font [skin_font D-font [fixed_size 264]]
        dui item config espresso espresso_pour -font [skin_font D-font [fixed_size 52]]
        dui item config "espresso water" ewc -font [skin_font D-font [fixed_size 52]]
        dui item config flush flush_motion -font [skin_font D-font [fixed_size 52]]
        dui item config steam steam_motion -font [skin_font D-font [fixed_size 40]]
        dui item config water water_motion -font [skin_font D-font [fixed_size 60]]
        dui item config $::skin_home_pages de1_btl_icon -font [skin_font D-font [fixed_size 19]]
        dui item config $::skin_home_pages machine_state -font [skin_font awesome_light [fixed_size 60]]
        dui item config $::skin_home_pages scale_btl_icon -font [skin_font D-font [fixed_size 19]]
        set_button bw font [skin_font D-font [fixed_size 42]]
        set_button mw font [skin_font D-font [fixed_size 42]]
        dui item config $::skin_home_pages sleep_button -font [skin_font D-font [fixed_size 80]]
        set_button stop_espresso_icon font [skin_font D-font [fixed_size 40]]
    }
}


###################################################
### Graphs

proc live_graph_list {} {
	return [list espresso_temperature_basket10th espresso_temperature_goal10th espresso_elapsed espresso_pressure espresso_weight espresso_weight_chartable espresso_flow espresso_flow_weight espresso_flow_weight_raw espresso_water_dispensed espresso_flow_weight_2x espresso_flow_2x espresso_resistance espresso_resistance_weight espresso_pressure_delta espresso_flow_delta espresso_flow_delta_negative espresso_flow_delta_negative_2x espresso_temperature_mix espresso_temperature_basket espresso_state_change espresso_pressure_goal espresso_flow_goal espresso_flow_goal_2x espresso_temperature_goal espresso_de1_explanation_chart_flow espresso_de1_explanation_chart_elapsed_flow espresso_de1_explanation_chart_flow_2x espresso_de1_explanation_chart_flow_1_2x espresso_de1_explanation_chart_flow_2_2x espresso_de1_explanation_chart_flow_3_2x espresso_de1_explanation_chart_pressure espresso_de1_explanation_chart_temperature espresso_de1_explanation_chart_temperature_10 espresso_de1_explanation_chart_pressure_1 espresso_de1_explanation_chart_pressure_2 espresso_de1_explanation_chart_pressure_3 espresso_de1_explanation_chart_elapsed_flow espresso_de1_explanation_chart_elapsed_flow_1 espresso_de1_explanation_chart_elapsed_flow_2 espresso_de1_explanation_chart_elapsed_flow_3 espresso_de1_explanation_chart_elapsed espresso_de1_explanation_chart_elapsed_1 espresso_de1_explanation_chart_elapsed_2 espresso_de1_explanation_chart_elapsed_3]
}

proc backup_live_graph {} {
	foreach lg [live_graph_list] {
	unset -nocomplain ::skin(live_graph_$lg)
		if {[$lg length] > 0} {
			set ::skin_graphs(live_graph_$lg) [$lg range 0 end]
			set ::skin_graphs(live_graph_profile) $::settings(profile_title)
		    set ::skin_graphs(live_graph_time) $::settings(espresso_clock)
		    set ::skin_graphs(live_graph_beans) $::settings(grinder_dose_weight)
		    #set ::skin_graphs(live_graph_weight) $::de1(scale_weight)
		    set ::skin_graphs(live_graph_weight) $::settings(drink_weight)
		    set ::skin_graphs(live_graph_pi_water) [round_to_integer $::de1(preinfusion_volume)]
		    set ::skin_graphs(live_graph_pour_water) [round_to_integer $::de1(pour_volume)]
		    set ::skin_graphs(live_graph_water) [expr {[round_to_integer $::de1(preinfusion_volume)] + [round_to_integer $::de1(pour_volume)]}]
		    set ::skin_graphs(live_graph_pi_time) [espresso_preinfusion_timer]
		    set ::skin_graphs(live_graph_pour_time) [espresso_pour_timer]
		    set ::skin_graphs(live_graph_shot_time) [espresso_elapsed_timer]
		    set ::skin_graphs(live_graph_beverage_type) $::settings(beverage_type)
		} else {
			set ::skin_graphs(live_graph_$lg) {}
		}
	}
}

#::register_state_change_handler Espresso Idle update_live_graph

rename save_this_espresso_to_history save_this_espresso_to_history_orig
proc save_this_espresso_to_history {unused_old_state unused_new_state} {
    save_this_espresso_to_history_orig $unused_old_state $unused_new_state
    update_live_graph
}

proc update_live_graph {args} {
    if {$::de1_num_state($::de1(state)) != "Idle" } {
        return
    }
    if {$::shift_graphs_conditions_met == 1} {
        backup_live_graph
        skin_save skin_graphs
        set ::shift_graphs_conditions_met 0
    } else {
        after 3000 {
            if {$::de1_num_state($::de1(state)) != "Idle" } {
            } else {
                foreach lg [live_graph_list] {
                    $lg length 0
                    if {[info exists ::skin_graphs(live_graph_$lg)] == 1} {
                        $lg append $::skin_graphs(live_graph_$lg)
                    }
                }
            }
        }
    }
}

set ::shift_graphs_conditions_met 0
set ::shift_graphs_timer_count 0
::register_state_change_handler Idle Espresso shift_graphs_timer
proc shift_graphs_timer {args} {
    if {$::de1(state) != 4} {
        set ::shift_graphs_timer_count 0
        return
    }
    if {$::settings(beverage_type) == "cleaning" || $::settings(beverage_type) == "calibrate"} {
        return
    }
    if {$::shift_graphs_timer_count < [expr $::skin(graph_update_delay) - 1]} {
        incr ::shift_graphs_timer_count
        after 1000 shift_graphs_timer
    } else {
        set ::shift_graphs_conditions_met 1
        shift_graphs
        save_graph_cache
        set ::shift_graphs_timer_count 0
    }
}

proc restore_live_graphs_default_vectors {} {
    $::home_espresso_graph element configure home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal
    $::home_espresso_graph element configure home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal
    $::home_espresso_graph element configure home_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal10th
    $::home_espresso_graph element configure home_zoom_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal
    $::home_espresso_graph element configure home_pressure -xdata espresso_elapsed -ydata espresso_pressure
    $::home_espresso_graph element configure home_flow  -xdata espresso_elapsed -ydata espresso_flow
    $::home_espresso_graph element configure home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight
    $::home_espresso_graph element configure home_weight_chartable  -xdata espresso_elapsed -ydata espresso_weight_chartable
    $::home_espresso_graph element configure home_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket10th
    $::home_espresso_graph element configure home_zoom_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket
    $::home_espresso_graph element configure home_resistance  -xdata espresso_elapsed -ydata espresso_resistance
    $::home_espresso_graph element configure home_steps -xdata espresso_elapsed -ydata espresso_state_change
    $::home_espresso_graph element configure home_flow_goal_2x  -xdata espresso_elapsed -ydata espresso_flow_goal_2x
    $::home_espresso_graph element configure home_flow_2x  -xdata espresso_elapsed -ydata espresso_flow_2x
    $::home_espresso_graph element configure home_weight_2x  -xdata espresso_elapsed -ydata espresso_flow_weight_2x
}

proc restore_live_graphs {} {
    if {$::de1_num_state($::de1(state)) != "Idle" } {
        return
    }
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
    if {![info exists ::skin_graphs(live_graph_beverage_type)]} {
        set ::skin_graphs(live_graph_beverage_type) "espresso"
    }
    hide_zoom_temperature
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

##################### patch for older app versions ##############################################

if {[ package vcompare [package version de1app] 1.42.1.128 ] < 0} {
    blt::vector create espresso_temperature_basket10th espresso_temperature_goal10th
    proc clear_temp_data {args} {
        espresso_temperature_basket10th length 0
        espresso_temperature_basket10th append [skin_temperature_units $::settings(espresso_temperature)]
        espresso_temperature_goal10th length 0
        espresso_temperature_goal10th append [skin_temperature_units $::settings(espresso_temperature)]
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
            espresso_temperature_basket10th append \
                [skin_temperature_units $HeadTemp]
            espresso_temperature_goal10th append \
                [skin_temperature_units $SetHeadTemp]
        }
    }
}
##########################################################################################

proc check_graph {} {
    if {$::de1_num_state($::de1(state)) == "Idle" } {
        restore_graphs
    }
}

set ::skin_data_curve_size 10

proc toggle_graph {curve} {
    if {$curve == "steam_pressure" || $curve == "steam_temperature" || $curve == "steam_flow"} {
        if {$::skin($curve) > 0} {
            set ::skin($curve) 0
            $::home_steam_graph element configure home_${curve} -linewidth 0
            dui item config "steam" steam_${curve}_icon -fill $::skin_text_colour -outline $::skin_text_colour
            $::main_graph_steam element configure home_${curve} -linewidth 0
            dui item config "off" steam_${curve}_icon_off -fill $::skin_text_colour -outline $::skin_text_colour
        } else {
            set ::skin($curve) 1
            $::home_steam_graph element configure home_${curve} -linewidth [rescale_x_skin 6]
            $::main_graph_steam element configure home_${curve} -linewidth [rescale_x_skin 6]
            if {$curve == "steam_pressure"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_green -outline $::skin_green
                dui item config "off" steam_${curve}_icon_off -fill $::skin_green -outline $::skin_green
            }
            if {$curve == "steam_temperature"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_red -outline $::skin_red
                dui item config "off" steam_${curve}_icon_off -fill $::skin_red -outline $::skin_red
            }
            if {$curve == "steam_flow"} {
                dui item config "steam" steam_${curve}_icon -fill $::skin_blue -outline $::skin_blue
                dui item config "off" steam_${curve}_icon_off -fill $::skin_blue -outline $::skin_blue
            }

        }
    } else {
        if {$::skin($curve) > 0} {
            set ::skin($curve) 0
            if {$curve == "pressure" || $curve == "temperature" || $curve == "flow"} {
                $::home_espresso_graph element configure home_${curve}_goal -linewidth 0
                $::home_espresso_graph_espresso element configure home_${curve}_goal -linewidth 0

                if {$curve == "flow" && $::skin(show_y2_axis) == 1} {
                    $::home_espresso_graph_espresso element configure home_${curve}_goal_2x -linewidth 0
                    $::home_espresso_graph element configure home_${curve}_goal_2x -linewidth 0
                }
            }
            if {$curve == "pressure" || $curve == "weight" || $curve == "flow" || $curve == "steps" || $curve == "temperature" || $curve == "resistance"} {
                $::home_espresso_graph element configure compare_${curve} -linewidth 0
            }
            $::home_espresso_graph element configure home_${curve} -linewidth 0
            $::home_espresso_graph_espresso element configure home_${curve} -linewidth 0
            dui item config espresso ${curve}_data -fill $::skin_disabled_colour
            dui item config "off flush water" ${curve}_text -fill $::skin_disabled_colour
            dui item config $::skin_home_pages ${curve}_icon -fill $::skin_disabled_colour -outline $::skin_disabled_colour
            if {$curve == "flow" || $curve == "weight" && $::skin(show_y2_axis) == 1} {
                $::home_espresso_graph_espresso element configure home_${curve}_2x -linewidth 0
                $::home_espresso_graph element configure home_${curve}_2x -linewidth 0
            }
            if {$curve == "weight"} {
                $::home_espresso_graph element configure home_weight_chartable -linewidth 0
                $::home_espresso_graph element configure compare_weight_chartable -linewidth 0
            }
        } else {
            set ::skin($curve) 1
            if {$::skin(goal) != 0} {
                if {$curve == "pressure" || $curve == "temperature" || $curve == "flow"} {
                    $::home_espresso_graph element configure home_${curve}_goal -linewidth [rescale_x_skin 4]
                    $::home_espresso_graph_espresso element configure home_${curve}_goal -linewidth [rescale_x_skin 4]
                    if {$curve == "flow" && $::skin(show_y2_axis) == 1} {
                        $::home_espresso_graph_espresso element configure home_${curve}_goal_2x -linewidth [rescale_x_skin 4]
                        $::home_espresso_graph element configure home_${curve}_goal_2x -linewidth [rescale_x_skin 4]
                    }
                }
            }
            if {$curve == "steps"} {
                $::home_espresso_graph element configure home_${curve} -linewidth [rescale_x_skin 2]
                $::home_espresso_graph element configure compare_${curve} -linewidth [rescale_x_skin 2]
                $::home_espresso_graph_espresso element configure home_${curve} -linewidth [rescale_x_skin 2]
            } else {
                $::home_espresso_graph element configure home_${curve} -linewidth [rescale_x_skin $::skin_data_curve_size]
                $::home_espresso_graph_espresso element configure home_${curve} -linewidth [rescale_x_skin $::skin_data_curve_size]
            }
            if {$curve == "pressure" || $curve == "flow" || $curve == "weight" || $curve == "temperature" || $curve == "resistance"} {
                $::home_espresso_graph element configure compare_${curve} -linewidth [rescale_x_skin 4]
            }
            if {$curve == "weight"} {
                $::home_espresso_graph element configure home_weight_chartable -linewidth [rescale_x_skin 4]
                $::home_espresso_graph element configure compare_weight_chartable -linewidth [rescale_x_skin 4]
            }
            dui item config espresso ${curve}_data -fill $::skin_text_colour
            dui item config "off flush water" ${curve}_text -fill $::skin_text_colour
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
            if {$curve == "flow" || $curve == "weight" && $::skin(show_y2_axis) == 1} {
                $::home_espresso_graph_espresso element configure home_${curve}_2x -linewidth 5
                $::home_espresso_graph element configure home_${curve}_2x -linewidth 5
            }
            $::home_espresso_graph axis configure y -max $::skin(zoomed_y_axis_max) -min $::skin(zoomed_y_axis_min)
        }
    }
    skin_save skin
}

set ::cache_graph_compare 0
proc toggle_graph_compare { graph } {
    if {$::cache_graph_compare == $graph} {
        set ::cache_graph_compare 0
        $::home_espresso_graph element configure compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure
        $::home_espresso_graph element configure compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow
        $::home_espresso_graph element configure compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight
        $::home_espresso_graph element configure compare_weight_chartable -xdata compare_espresso_elapsed -ydata compare_espresso_weight_chartable
        $::home_espresso_graph element configure compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change
        $::home_espresso_graph element configure compare_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket10th
        $::home_espresso_graph element configure compare_zoom_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket
        $::home_espresso_graph element configure compare_resistance -xdata compare_espresso_elapsed -ydata compare_espresso_resistance

    } else {
        set ::cache_graph_compare $graph
        $::home_espresso_graph element configure compare_pressure -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_pressure
        $::home_espresso_graph element configure compare_steps -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_state_change
        $::home_espresso_graph element configure compare_temperature -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_temperature_basket10th
        $::home_espresso_graph element configure compare_zoom_temperature -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_temperature_basket
        $::home_espresso_graph element configure compare_resistance -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_resistance
        if {$::skin(show_y2_axis) == 0} {
            $::home_espresso_graph element configure compare_flow -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_flow
            $::home_espresso_graph element configure compare_weight -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_flow_weight
            $::home_espresso_graph element configure compare_weight_chartable -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_weight_chartable
        } else {
            $::home_espresso_graph element configure compare_flow -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_flow_2x
            $::home_espresso_graph element configure compare_weight -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_flow_weight_2x
            $::home_espresso_graph element configure compare_weight_chartable -xdata ${graph}_espresso_elapsed -ydata ${graph}_espresso_weight_chartable
        }
    }
}

proc toggle_cache_graphs {} {
    if {[.can itemcget graph_a -state] eq "hidden"} {
            set ::main_graph_height [rescale_y_skin 840]
            $::home_espresso_graph configure -height [rescale_y_skin 840]
            .can itemconfigure graph_a -state normal
            .can itemconfigure graph_b -state normal
            .can itemconfigure graph_c -state normal
            .can itemconfigure graph_d -state normal
            dui item config off graph_a -initial_state normal
            dui item config off graph_b -initial_state normal
            dui item config off graph_c -initial_state normal
            dui item config off graph_d -initial_state normal
            dui item config off live_graph_data -initial_state hidden -state hidden

            dui item config off cga_p -initial_state normal -state normal
            dui item config off cgb_p -initial_state normal -state normal
            dui item config off cgc_p -initial_state normal -state normal
            dui item config off cgd_p -initial_state normal -state normal
            dui item config off cga_d -initial_state normal -state normal
            dui item config off cgb_d -initial_state normal -state normal
            dui item config off cgc_d -initial_state normal -state normal
            dui item config off cgd_d -initial_state normal -state normal
        } else {
            set ::main_graph_height [rescale_y_skin 1010]
            $::home_espresso_graph configure -height [rescale_y_skin 1010]
            .can itemconfigure graph_a -state hidden
            .can itemconfigure graph_b -state hidden
            .can itemconfigure graph_c -state hidden
            .can itemconfigure graph_d -state hidden
            dui item config off graph_a -initial_state hidden
            dui item config off graph_b -initial_state hidden
            dui item config off graph_c -initial_state hidden
            dui item config off graph_d -initial_state hidden
            dui item config off live_graph_data -initial_state normal -state normal

            dui item config off cga_p -initial_state hidden -state hidden
            dui item config off cgb_p -initial_state hidden -state hidden
            dui item config off cgc_p -initial_state hidden -state hidden
            dui item config off cgd_p -initial_state hidden -state hidden
            dui item config off cga_d -initial_state hidden -state hidden
            dui item config off cgb_d -initial_state hidden -state hidden
            dui item config off cgc_d -initial_state hidden -state hidden
            dui item config off cgd_d -initial_state hidden -state hidden

            set ::cache_graph_compare 0
            $::home_espresso_graph element configure compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure
            $::home_espresso_graph element configure compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow
            $::home_espresso_graph element configure compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight
            $::home_espresso_graph element configure compare_weight_chartable -xdata compare_espresso_elapsed -ydata compare_espresso_weight_chartable
            $::home_espresso_graph element configure compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change
            $::home_espresso_graph element configure compare_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket10th
            $::home_espresso_graph element configure compare_zoom_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket
            $::home_espresso_graph element configure compare_resistance -xdata compare_espresso_elapsed -ydata compare_espresso_resistance
        }
}


proc setup_home_espresso_graph {} {
    foreach curve {pressure temperature flow weight resistance steps} {
        if {$::skin($curve) < 1} {
            set ::skin($curve) 1
            toggle_graph $curve
        }
    }
}

proc check_graph_axis {} {
    hide_zoom_temperature
    if {$::skin(show_y2_axis) == 1} {
        $::home_espresso_graph axis configure y -title "[translate "pressure"]  &  [translate "temperature"]"
        $::home_espresso_graph axis configure y2 -hide 0
        $::home_espresso_graph element configure home_flow_goal -hide 1
        $::home_espresso_graph element configure home_flow -hide 1
        $::home_espresso_graph element configure home_weight -hide 1
        $::home_espresso_graph element configure home_flow_goal_2x -hide 0
        $::home_espresso_graph element configure home_flow_2x -hide 0
        $::home_espresso_graph element configure home_weight_2x -hide 0

        $::home_espresso_graph_espresso axis configure y -title "[translate "pressure"]  &  [translate "temperature"]"
        $::home_espresso_graph_espresso axis configure y2 -hide 0
        $::home_espresso_graph_espresso element configure home_flow_goal -hide 1
        $::home_espresso_graph_espresso element configure home_flow -hide 1
        $::home_espresso_graph_espresso element configure home_weight -hide 1
        $::home_espresso_graph_espresso element configure home_flow_goal_2x -hide 0
        $::home_espresso_graph_espresso element configure home_flow_2x -hide 0
        $::home_espresso_graph_espresso element configure home_weight_2x -hide 0

        $::cache_graph_a element configure cache_a_espresso_flow -hide 1
        $::cache_graph_a element configure cache_a_espresso_flow_weight -hide 1
        $::cache_graph_a element configure cache_a_espresso_flow_2x -hide 0
        $::cache_graph_a element configure cache_a_espresso_flow_weight_2x -hide 0
        $::cache_graph_a axis configure y2 -hide 0
        $::cache_graph_b element configure cache_b_espresso_flow -hide 1
        $::cache_graph_b element configure cache_b_espresso_flow_weight -hide 1
        $::cache_graph_b element configure cache_b_espresso_flow_2x -hide 0
        $::cache_graph_b element configure cache_b_espresso_flow_weight_2x -hide 0
        $::cache_graph_b axis configure y2 -hide 0
        $::cache_graph_c element configure cache_c_espresso_flow -hide 1
        $::cache_graph_c element configure cache_c_espresso_flow_weight -hide 1
        $::cache_graph_c element configure cache_c_espresso_flow_2x -hide 0
        $::cache_graph_c element configure cache_c_espresso_flow_weight_2x -hide 0
        $::cache_graph_c axis configure y2 -hide 0
        $::cache_graph_d element configure cache_d_espresso_flow -hide 1
        $::cache_graph_d element configure cache_d_espresso_flow_weight -hide 1
        $::cache_graph_d element configure cache_d_espresso_flow_2x -hide 0
        $::cache_graph_d element configure cache_d_espresso_flow_weight_2x -hide 0
        $::cache_graph_d axis configure y2 -hide 0
        dui item config "off espresso flush water" main_graph_toggle_view_label -fill $::skin_text_colour
    } else {
        dui item config "off espresso flush water" main_graph_toggle_view_label -fill $::skin_disabled_colour
        $::home_espresso_graph axis configure y -title ""
        $::home_espresso_graph axis configure y2 -hide 1
        $::home_espresso_graph element configure home_flow_goal -hide 0
        $::home_espresso_graph element configure home_flow -hide 0
        $::home_espresso_graph element configure home_weight -hide 0
        $::home_espresso_graph element configure home_flow_goal_2x -hide 1
        $::home_espresso_graph element configure home_flow_2x -hide 1
        $::home_espresso_graph element configure home_weight_2x -hide 1

        $::home_espresso_graph_espresso axis configure y -title ""
        $::home_espresso_graph_espresso axis configure y2 -hide 1
        $::home_espresso_graph_espresso element configure home_flow_goal -hide 0
        $::home_espresso_graph_espresso element configure home_flow -hide 0
        $::home_espresso_graph_espresso element configure home_weight -hide 0
        $::home_espresso_graph_espresso element configure home_flow_goal_2x -hide 1
        $::home_espresso_graph_espresso element configure home_flow_2x -hide 1
        $::home_espresso_graph_espresso element configure home_weight_2x -hide 1


        $::cache_graph_a element configure cache_a_espresso_flow -hide 0
        $::cache_graph_a element configure cache_a_espresso_flow_weight -hide 0
        $::cache_graph_a element configure cache_a_espresso_flow_2x -hide 1
        $::cache_graph_a element configure cache_a_espresso_flow_weight_2x -hide 1
        $::cache_graph_a axis configure y2 -hide 1
        $::cache_graph_b element configure cache_b_espresso_flow -hide 0
        $::cache_graph_b element configure cache_b_espresso_flow_weight -hide 0
        $::cache_graph_b element configure cache_b_espresso_flow_2x -hide 1
        $::cache_graph_b element configure cache_b_espresso_flow_weight_2x -hide 1
        $::cache_graph_b axis configure y2 -hide 1
        $::cache_graph_c element configure cache_c_espresso_flow -hide 0
        $::cache_graph_c element configure cache_c_espresso_flow_weight -hide 0
        $::cache_graph_c element configure cache_c_espresso_flow_2x -hide 1
        $::cache_graph_c element configure cache_c_espresso_flow_weight_2x -hide 1
        $::cache_graph_c axis configure y2 -hide 1
        $::cache_graph_d element configure cache_d_espresso_flow -hide 0
        $::cache_graph_d element configure cache_d_espresso_flow_weight -hide 0
        $::cache_graph_d element configure cache_d_espresso_flow_2x -hide 1
        $::cache_graph_d element configure cache_d_espresso_flow_weight_2x -hide 1
        $::cache_graph_d axis configure y2 -hide 1
    }
    if {$::skin(goal) == 0} {
        $::home_espresso_graph element configure home_pressure_goal -linewidth 0
        $::home_espresso_graph element configure home_temperature_goal -linewidth 0
        $::home_espresso_graph element configure home_flow_goal -linewidth 0
        $::home_espresso_graph element configure home_flow_goal_2x -linewidth 0
        $::home_espresso_graph_espresso element configure home_pressure_goal -linewidth 0
        $::home_espresso_graph_espresso element configure home_temperature_goal -linewidth 0
        $::home_espresso_graph_espresso element configure home_flow_goal -linewidth 0
        $::home_espresso_graph_espresso element configure home_flow_goal_2x -linewidth 0
        dui item config "off espresso flush water" main_graph_toggle_goal_label -fill $::skin_disabled_colour
    } else {
        dui item config "off espresso flush water" main_graph_toggle_goal_label -fill $::skin_text_colour
        if {$::skin(pressure) > 0} {
            $::home_espresso_graph element configure home_pressure_goal -linewidth [rescale_x_skin 4]
            $::home_espresso_graph_espresso element configure home_pressure_goal -linewidth [rescale_x_skin 4]
        }
        if {$::skin(temperature) > 0} {
            $::home_espresso_graph element configure home_temperature_goal -linewidth [rescale_x_skin 4]
            $::home_espresso_graph_espresso element configure home_temperature_goal -linewidth [rescale_x_skin 4]
        }
        if {$::skin(flow) > 0} {
            $::home_espresso_graph element configure home_flow_goal -linewidth [rescale_x_skin 4]
            $::home_espresso_graph element configure home_flow_goal_2x -linewidth [rescale_x_skin 4]
            $::home_espresso_graph_espresso element configure home_flow_goal -linewidth [rescale_x_skin 4]
            $::home_espresso_graph_espresso element configure home_flow_goal_2x -linewidth [rescale_x_skin 4]
        }
    }
    check_cache_y2_axis
    set a $::cache_graph_compare
    set ::cache_graph_compare 0
    toggle_graph_compare $a
}

proc toggle_cache_y2_axis {} {
    incr ::skin(show_cache_y2_axis)
    if {$::skin(show_y2_axis) == 0 && $::skin(show_cache_y2_axis) == 1} {
        set ::skin(show_cache_y2_axis) 2
    }
    if {$::skin(show_cache_y2_axis) == 4} {
        set ::skin(show_cache_y2_axis) 0
    }
    check_cache_y2_axis
}

proc check_cache_y2_axis {} {
    $::cache_graph_a axis configure x -hide 0
    $::cache_graph_b axis configure x -hide 0
    $::cache_graph_c axis configure x -hide 0
    $::cache_graph_d axis configure x -hide 0
    $::cache_graph_a axis configure y -hide 0
    $::cache_graph_b axis configure y -hide 0
    $::cache_graph_c axis configure y -hide 0
    $::cache_graph_d axis configure y -hide 0
    if {$::skin(show_cache_y2_axis) == 1 && $::skin(show_y2_axis) == 1} {
        $::cache_graph_a axis configure y2 -hide 0
        $::cache_graph_b axis configure y2 -hide 0
        $::cache_graph_c axis configure y2 -hide 0
        $::cache_graph_d axis configure y2 -hide 0
    } else {
        $::cache_graph_a axis configure y2 -hide 1
        $::cache_graph_b axis configure y2 -hide 1
        $::cache_graph_c axis configure y2 -hide 1
        $::cache_graph_d axis configure y2 -hide 1
    }
    if {$::skin(show_cache_y2_axis) == 2} {
        $::cache_graph_a axis configure y -hide 1
        $::cache_graph_b axis configure y -hide 1
        $::cache_graph_c axis configure y -hide 1
        $::cache_graph_d axis configure y -hide 1
        $::cache_graph_a axis configure y2 -hide 1
        $::cache_graph_b axis configure y2 -hide 1
        $::cache_graph_c axis configure y2 -hide 1
        $::cache_graph_d axis configure y2 -hide 1
    }
    if {$::skin(show_cache_y2_axis) == 3} {
        $::cache_graph_a axis configure y -hide 1
        $::cache_graph_b axis configure y -hide 1
        $::cache_graph_c axis configure y -hide 1
        $::cache_graph_d axis configure y -hide 1
        $::cache_graph_a axis configure x -hide 1
        $::cache_graph_b axis configure x -hide 1
        $::cache_graph_c axis configure x -hide 1
        $::cache_graph_d axis configure x -hide 1
    }

}

proc toggle_main_graph_view {} {
    set ::skin(show_y2_axis) [expr !{$::skin(show_y2_axis)}]
    check_graph_axis
    skin_save skin
}

proc toggle_main_graph_goal {} {
    set ::skin(goal) [expr !{$::skin(goal)}]
    check_graph_axis
    skin_save skin
}

set ::zoom_temperature 0
proc hide_zoom_temperature {} {
    if {$::zoom_temperature == 0} {
        return
    }
    set ::zoom_temperature 0
    if {$::skin(show_y2_axis) == 1} {
        $::home_espresso_graph axis configure y2 -hide 0
    }
    $::home_espresso_graph axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "[translate "pressure"]  &  [translate "temperature"]" -titlecolor $::skin_y_axis_colour -titlefont [skin_font font [fixed_size 14]]  -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    dui item config off zoom_temperature_state -state normal
    dui item config off zoom_temperature_key_button* -state hidden
    if {$::skin(temperature) == 0} {
        dui item config "off flush water" temperature_text -fill $::skin_disabled_colour
        dui item config $::skin_home_pages temperature_icon -fill $::skin_disabled_colour -outline $::skin_disabled_colour
    }
    check_y_resolution
}

set ::zoom_temperature_key_button 0

proc zoom_temperature {} {
    if {$::skin(temperature) == 0} {
        dui item config "off flush water" temperature_text -fill $::skin_text_colour
        dui item config $::skin_home_pages temperature_icon -fill $::skin_red -outline $::skin_red
    }
    if {$::zoom_temperature == 1} {
        check_graph_axis

    } else {
        set ::zoom_temperature 1
        $::home_espresso_graph axis configure y2 -hide 1
        $::home_espresso_graph axis configure y -color $::skin_red -tickfont [skin_font font [fixed_size 14]] -title "[translate "temperature"] °C" -titlecolor $::skin_red -titlefont [skin_font font [fixed_size 14]]  -min 70 -max 100 -subdivisions 1 -majorticks {70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100} -hide 0;
        if {$::zoom_temperature_key_button == 0} {
            set ::zoom_temperature_key_button 1
            dui add dbutton "off flush water" 0 450 \
                -bwidth 2000 -bheight 1200 -tags zoom_temperature_key_button -initial_state hidden \
                -command {zoom_temperature} -longpress_cmd {zoom_temperature}
        }
        dui item config off zoom_temperature_state -state disabled
        dui item config off zoom_temperature_key_button* -state normal
    }
}

proc toggle_y_resolution {} {
    if {$::skin(y_res) == 0} {
        set ::skin(y_res) 1
    } elseif {$::skin(y_res) == 1} {
        set ::skin(y_res) 2
    } else {
        set ::skin(y_res) 0
    }
    skin_save skin
    check_y_resolution
}

proc check_y_resolution {} {
    if {$::skin(y_res) == 0} {
        $::home_espresso_graph axis configure y -majorticks {0  2  4  6  8  10  12}
        $::home_espresso_graph_espresso axis configure y -majorticks {0  2  4  6  8  10  12}
        $::home_espresso_graph axis configure y2 -majorticks {0 1 2 3 4 5}
        $::home_espresso_graph_espresso axis configure y2 -majorticks {0 1 2 3 4 5}
    }
    if {$::skin(y_res) == 1} {
        $::home_espresso_graph axis configure y -majorticks {0 1 2 3 4 5 6 7 8 9 10}
        $::home_espresso_graph_espresso axis configure y -majorticks {0 1 2 3 4 5 6 7 8 9 10}
        $::home_espresso_graph axis configure y2 -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5}
        $::home_espresso_graph_espresso axis configure y2 -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5}
    }
    if {$::skin(y_res) == 2} {
        $::home_espresso_graph axis configure y -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10}
        $::home_espresso_graph_espresso axis configure y -majorticks {0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10}
        $::home_espresso_graph axis configure y2 -majorticks {0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5}
        $::home_espresso_graph_espresso axis configure y2 -majorticks {0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5}
    }
}

proc main_graph_elements {} {
    return [list \
    compare_pressure \
    compare_flow \
    compare_weight \
    compare_steps \
    compare_flow_2x \
    compare_weight_2x \
    compare_temperature \
    compare_resistance \
    home_zoom_temperature \
    compare_zoom_temperature \
    home_zoom_temperature_goal \
    home_pressure_goal \
    home_flow_goal \
    home_temperature_goal \
    home_pressure \
    home_flow \
    home_weight \
    home_temperature \
    home_resistance \
    home_steps \
    home_flow_goal_2x \
    home_flow_2x \
    home_weight_2x \
    ]
}

set ::highlight_return_button 0

proc highlight_curve { curve } {
    if {$::skin($curve) == 0} {
        return
    }
    hide_zoom_temperature
    foreach e [main_graph_elements] {
        $::home_espresso_graph element configure $e -hide 1
    }
    if {$curve == "pressure" || $curve == "resistance"} {
        $::home_espresso_graph element configure home_${curve} -hide 0
        $::home_espresso_graph element configure compare_${curve} -hide 0
        if {$curve == "pressure"} {
            $::home_espresso_graph element configure home_${curve}_goal -hide 0
        }
    }
    if {$curve == "flow" || $curve == "weight"} {
        if {$::skin(show_y2_axis) == 1} {
            $::home_espresso_graph element configure home_${curve}_2x -hide 0
            $::home_espresso_graph element configure compare_${curve} -hide 0
            if {$curve == "flow"} {
               $::home_espresso_graph element configure home_${curve}_goal_2x -hide 0
            }
        } else {
            $::home_espresso_graph element configure home_${curve} -hide 0
            $::home_espresso_graph element configure compare_${curve} -hide 0
            if {$curve == "flow"} {
               $::home_espresso_graph element configure home_${curve}_goal -hide 0
            }
        }
    }
    if {$::highlight_return_button == 0} {
        set ::highlight_return_button 1
        dui add dbutton "off flush water" 0 450 \
            -bwidth 2000 -bheight 1200 -tags highlight_return_button -initial_state hidden \
            -command {exit_highlight_curve} -longpress_cmd {exit_highlight_curve}
    }
    dui item config off key_buttons -state disabled
    dui item config off ${curve}_icon -state normal
    dui item config off ${curve}_text -state normal
    dui item config off highlight_return_button* -state normal
}

proc exit_highlight_curve {} {
    foreach e [main_graph_elements] {
        $::home_espresso_graph element configure $e -hide 0
    }
    check_graph_axis
    dui item config off key_buttons -state normal
    dui item config off highlight_return_button* -state hidden
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
    if {[info exists ::saw_backup]} {
        set ::skin(saw_backup) $::saw_backup
    }
    set_next_page off power;
    set ::skin_sleep_timer_start [expr [clock seconds] + 5]
    set ::skin_sleep_timer_on 1
    skin_power_off_timer
    page_show skin_power;
    skin_save skin
}

if {[info exists ::skin(saw_backup)]} {
   set ::saw_backup $::skin(saw_backup)
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
    if {[skin_bean_weight] != "" } {
        dui item config $::skin_home_pages scale_btl_icon -state hidden
    }
	if {[ifexists ::settings(scale_bluetooth_address)] == ""} {
		dui item config $::skin_home_pages scale_btl_icon -fill $::skin_button_label_colour
		return ""
	}
	if {$::device::scale::_watchdog_id == ""} {
		dui item config $::skin_home_pages scale_btl_icon -fill $::skin_red
		if {$::connect_blink == 1} {
		    after 300 {set ::connect_blink 0}
		    return [translate "reconnect"]
		} else {
		    dui item config $::skin_home_pages scale_btl_icon -fill $::skin_button_label_colour
		    set ::connect_blink 1
		    return ""
		}
	}
    dui item config $::skin_home_pages scale_btl_icon -fill $::skin_blue

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
    set godshot ""
    if {"D_Flow_Espresso_Profile" in $::settings(enabled_plugins) == 0 } {
        append ::settings(enabled_plugins) { D_Flow_Espresso_Profile}
        save_settings
        set dflow {- We needed to enable "D_Flow_Espresso_Profile" app extension for this skin to work best}
        set show 1
    }
    if {[file exists "[homedir]/plugins/slow_scale_filtering/plugin.tcl"] == 1} {
        if {"slow_scale_filtering" in $::settings(enabled_plugins) == 0 } {
            append ::settings(enabled_plugins) { slow_scale_filtering}
            save_settings
            set scale {- We needed to enable "slow_scale_filtering" app extension for this skin to work best}
            set show 1
        }
    } else {
        if {[file exists "[skin_directory]/code/slow_scale_filtering/plugin.tcl"] == 1} {
            file copy [skin_directory]/code/slow_scale_filtering [homedir]/plugins/slow_scale_filtering
            append ::settings(enabled_plugins) { slow_scale_filtering}
            save_settings
            set scale {- We needed to enable "slow_scale_filtering" app extension for this skin to work best}
            set show 1
        }
    }
    if {"DPx_Screen_Saver" in $::settings(enabled_plugins) == 1 } {
        set idx [lsearch $::settings(enabled_plugins) "DPx_Screen_Saver"]
        set ::settings(enabled_plugins) [lreplace $::settings(enabled_plugins) $idx $idx]
        save_settings
        set saver {- We needed to disable "DPx_Screen_Saver" app extension, this skin already has the MySaver feature}
        set show 1
    }
    if {[info exist ::settings(god_espresso_elapsed)] == 1} {
        if {($::settings(god_espresso_name) != {} && $::settings(god_espresso_name) != "None") || $::settings(god_espresso_elapsed) != {}} {

            set ::settings(god_espresso_name) {}
            set ::settings(god_espresso_elapsed) {}
            set ::settings(god_espresso_pressure) {}
            set ::settings(god_espresso_temperature_basket) {}
            set ::settings(god_espresso_flow) {}
            set ::settings(god_espresso_flow_weight) {}
            set ::settings(god_espresso_weight) {}
            save_settings
            god_shot_reference_reset
            set godshot {- We unselected your Godshot, this skin does not support Godshots}
            set show 1
        }
    }
    set ext {Tap on the screen to exit the app, the changes will be applied when you restart}
    set ::plugin_change_message $saver\r\r$dflow\r\r$scale\r\r$godshot\r\r\r$ext
    if {$show == 1} {
        set ::skin(icon_cal_check) 0
        skin_save skin
    }
    if {$show == 0 && $::skin(icon_cal_check) == 0} {
        initial_icon_cal_check
    }
    if {$show == 1} {after 2000 {page_show plugin_message}}

}

proc skin_negative_scale_tare {} {
    if {$::de1(scale_sensor_weight) < 0 && $::skin(auto_tare_negative_reading) == 1} {
        scale_tare
    }
    after 500 {skin_negative_scale_tare}
}

proc toggle_auto_tare {} {
    if {$::skin(auto_tare_negative_reading) == 1} {
        set ::skin(auto_tare_negative_reading) 0
    } else {
        set ::skin(auto_tare_negative_reading) 1
    }
    skin_save skin
}

proc auto_tare_button_colour {} {
    if {$::skin(auto_tare_negative_reading) == 1} {
        set_button auto_tare label_fill $::skin_selected_colour
    } else {
        set_button auto_tare label_fill $::skin_button_label_colour
    }
}

rename decentscale_timer_start decentscale_timer_start_original
proc decentscale_timer_start {} {
    if {$::skin(HDS_timer) == 1} {
        decentscale_timer_start_original
    }
}

proc skin_hds {key} {
    if {$::settings(scale_type) != "decentscale"} {return}
    switch -exact $key {
        oled_off {set fn [decent_scale_make_command 0A 00 00]}
        oled_on {set fn [decent_scale_make_command 0A 01 00]}
        oled_low {set fn [decent_scale_make_command 0A 03 01]}
        oled_norm {set fn [decent_scale_make_command 0A 03 00]}
    }
	userdata_append "SCALE: decentscale : skin hds" [list ble write $::de1(scale_device_handle) $::de1(suuid_decentscale) $::sinstance($::de1(suuid_decentscale)) $::de1(cuuid_decentscale_write) $::cinstance($::de1(cuuid_decentscale_write)) $fn] 0
}

proc toggle_HDS_timer {} {
    if {$::skin(HDS_timer) == 0} {
        decentscale_timer_reset
    } else {
        decentscale_timer_start
        after 600 decentscale_timer_stop
    }
    skin_save skin
}

proc toggle_HDS_brightness {} {
    if {$::skin(HDS_brightness) == 0} {
        skin_hds oled_low
    } else {
        skin_hds oled_norm
    }
    skin_save skin
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
    if {($::de1(substate) == 4 || $::de1(substate) == 5) && $::de1(state) == 4} {
        set ::skin_machine_state $::settings(current_frame_description)
    }
    if {$::de1(substate) == 20} {
        set ::skin_machine_state "[translate "waiting"]\r[translate "to purge"]"

    }
    if {$::de1(substate) == 216} {
        set ::skin_machine_state "[translate "boot err"]\r[translate "no water"]"
    }

    if {[de1_connected_state] == [translate "Disconnected"]} {
        dui item config $::skin_home_pages de1_btl_icon -fill $::skin_red
    } else {
        dui item config $::skin_home_pages de1_btl_icon -fill $::skin_blue
    }

    if {$::de1(substate) == 1 || $::de1(substate) == 2} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_not_ready
        return [skin_machine_state_heating]
    } elseif {$::de1(substate) == "-" || $::de1(substate) == "" || [de1_connected_state] == [translate "Disconnected"]} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_not_ready
        return $::skin(icon_x)
    } elseif {$::de1(substate) == 0} {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_ready
        return $::skin(icon_tick)
    } else {
        dui item config $::skin_home_pages machine_state -fill $::skin_machine_not_ready
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

#### cache graphs

# programming stuff

blt::vector create graph_a_espresso_elapsed graph_a_espresso_pressure graph_a_espresso_flow graph_a_espresso_flow_weight graph_a_espresso_flow_2x graph_a_espresso_flow_weight_2x graph_a_espresso_state_change graph_a_espresso_temperature_basket graph_a_espresso_temperature_basket10th graph_a_espresso_resistance graph_a_espresso_weight_chartable
blt::vector create graph_b_espresso_elapsed graph_b_espresso_pressure graph_b_espresso_flow graph_b_espresso_flow_weight graph_b_espresso_flow_2x graph_b_espresso_flow_weight_2x graph_b_espresso_state_change graph_b_espresso_temperature_basket graph_b_espresso_temperature_basket10th graph_b_espresso_resistance graph_b_espresso_weight_chartable
blt::vector create graph_c_espresso_elapsed graph_c_espresso_pressure graph_c_espresso_flow graph_c_espresso_flow_weight graph_c_espresso_flow_2x graph_c_espresso_flow_weight_2x graph_c_espresso_state_change graph_c_espresso_temperature_basket graph_c_espresso_temperature_basket10th graph_c_espresso_resistance graph_c_espresso_weight_chartable
blt::vector create graph_d_espresso_elapsed graph_d_espresso_pressure graph_d_espresso_flow graph_d_espresso_flow_weight graph_d_espresso_flow_2x graph_d_espresso_flow_weight_2x graph_d_espresso_state_change graph_d_espresso_temperature_basket graph_d_espresso_temperature_basket10th graph_d_espresso_resistance graph_d_espresso_weight_chartable

proc shift_graph_list {} {
    return [list espresso_elapsed espresso_pressure espresso_flow espresso_flow_weight espresso_weight_chartable espresso_flow_2x espresso_flow_weight_2x espresso_state_change espresso_temperature_basket espresso_temperature_basket10th espresso_resistance profile time beans weight water pi_water pour_water pi_time pour_time shot_time]
}

proc shift_graph_list_vectors {} {
    return [list espresso_elapsed espresso_pressure espresso_flow espresso_flow_weight espresso_weight_chartable espresso_flow_2x espresso_flow_weight_2x espresso_state_change espresso_temperature_basket espresso_temperature_basket10th espresso_resistance]
}

proc shift_graph_list_variables {} {
    return [list profile time beans weight water pi_water pour_water pi_time pour_time shot_time]
}

proc shift_graphs { args } {
    if {![info exists ::skin_graphs(live_graph_beverage_type)]} {
        set ::skin_graphs(live_graph_beverage_type) "espresso"
    }
    foreach lg [shift_graph_list] {
        if {[info exists ::graph_cache(graph_c_$lg)] == 1} {
            set ::graph_cache(graph_d_$lg) $::graph_cache(graph_c_$lg)
        }
    }
    foreach lg [shift_graph_list] {
        if {[info exists ::graph_cache(graph_b_$lg)] == 1} {
            set ::graph_cache(graph_c_$lg) $::graph_cache(graph_b_$lg)
        }
    }
    foreach lg [shift_graph_list] {
        if {[info exists ::graph_cache(graph_a_$lg)] == 1} {
            set ::graph_cache(graph_b_$lg) $::graph_cache(graph_a_$lg)
        }
    }
    foreach lg [shift_graph_list] {
        if {[info exists ::skin_graphs(live_graph_$lg)] == 1} {
            set ::graph_cache(graph_a_$lg) $::skin_graphs(live_graph_$lg)
        }
    }
    restore_cache_graphs
}

proc save_graph_cache { args } {
    set graph_cache_data {}
    foreach k [shift_graph_list] {
        if {[info exists ::graph_cache(graph_a_$k)] == 1} {
            set v $::graph_cache(graph_a_$k)
            append graph_cache_data [subst {[list graph_a_$k] [list $v]\n}]
        }
    }
    foreach k [shift_graph_list] {
        if {[info exists ::graph_cache(graph_b_$k)] == 1} {
            set v $::graph_cache(graph_b_$k)
            append graph_cache_data [subst {[list graph_b_$k] [list $v]\n}]
        }
    }
    foreach k [shift_graph_list] {
        if {[info exists ::graph_cache(graph_c_$k)] == 1} {
            set v $::graph_cache(graph_c_$k)
            append graph_cache_data [subst {[list graph_c_$k] [list $v]\n}]
        }
    }
    foreach k [shift_graph_list] {
        if {[info exists ::graph_cache(graph_d_$k)] == 1} {
            set v $::graph_cache(graph_d_$k)
            append graph_cache_data [subst {[list graph_d_$k] [list $v]\n}]
        }
    }

    write_file "[skin_directory]/settings/graph_cache.tdb" $graph_cache_data
}

proc restore_cache_graphs {} {
	foreach lg [shift_graph_list_vectors] {
		if {[info exists ::graph_cache(graph_a_$lg)] == 1} {
			graph_a_$lg length 0
			graph_a_$lg append $::graph_cache(graph_a_$lg)
		}
		if {[info exists ::graph_cache(graph_b_$lg)] == 1} {
			graph_b_$lg length 0
			graph_b_$lg append $::graph_cache(graph_b_$lg)
		}
		if {[info exists ::graph_cache(graph_c_$lg)] == 1} {
			graph_c_$lg length 0
			graph_c_$lg append $::graph_cache(graph_c_$lg)
		}
		if {[info exists ::graph_cache(graph_d_$lg)] == 1} {
			graph_d_$lg length 0
			graph_d_$lg append $::graph_cache(graph_d_$lg)
		}
	}
}

proc name_length { string length} {
    set string [string range $string 0 [expr $length - 1]]
    return $string
}

proc cache_date_time_format { time } {
    set date [clock format $time -format {%a %d}]
    if {$::settings(enable_ampm) == 0} {
        set a [clock format $time -format {%H}]
        set b [clock format $time -format {:%M}]
        set c $a
    } else {
        set a [clock format $time -format {%I}]
        set b [clock format $time -format {:%M}]
        set c $a
        regsub {^[0]} $c {\1} c
    }
    if {$::settings(enable_ampm) == 1} {
        set pm [clock format $time -format %P]
    } else {
        set pm ""
    }
    return "$date $c$b$pm"
}


proc load_graph_cache {} {
    array set ::graph_cache [encoding convertfrom utf-8 [read_binary_file "[skin_directory]/settings/graph_cache.tdb"]]
}

proc skin_load_fav { args } {
    skin_load $::skin(auto_load_fav)
}

set ::screen_saver_buttons {}

proc remove_screen_saver_button {button} {
    dui item config saver $button* -initial_state hidden -state hidden
    set ::screen_saver_buttons [lsearch -inline -all -not -exact $::screen_saver_buttons ${button}]
    set ::next_saver_spot_y 1
    foreach s $::screen_saver_buttons {
        dui item moveto saver $s* [next_saver_spot_x] [next_saver_spot_y]
    }
}

proc add_screen_saver_button {button} {
    if {[.can itemcget $button -state] == "hidden"} {
        dui item config saver $button* -initial_state normal -state normal
        lappend ::screen_saver_buttons $button
        dui item moveto saver $button* [next_saver_spot_x] [next_saver_spot_y]
    }
}

set ::info_espresso_last_data_showing 0

proc info_espresso_last_data_toggle {} {
    if {$::info_espresso_last_data_showing == 0} {
        dui item config off info_espresso_last_data_card -state normal
        set ::info_espresso_last_data_showing 1
    } else {
        dui item config off info_espresso_last_data_card -state hidden
        set ::info_espresso_last_data_showing 0
    }
}

proc info_espresso_last_date_time_format { time } {
    set date [clock format $time -format {%a %d}]
    if {$::settings(enable_ampm) == 0} {
        set a [clock format $time -format {%H}]
        set b [clock format $time -format {:%M}]
        set c $a
    } else {
        set a [clock format $time -format {%I}]
        set b [clock format $time -format {:%M}]
        set c $a
        regsub {^[0]} $c {\1} c
    }
    if {$::settings(enable_ampm) == 1} {
        set pm [clock format $time -format %P]
    } else {
        set pm ""
    }
    set s {    }
    return "$date$s$c$b$pm"
}

proc info_espresso_last_data {} {
    set time [info_espresso_last_date_time_format $::skin_graphs(live_graph_time)]
    set p [name_length $::skin_graphs(live_graph_profile) 24]
    set b [round_to_one_digits $::skin_graphs(live_graph_beans)]
    set w [round_to_one_digits $::skin_graphs(live_graph_weight)]
    if {[info exist ::skin_er_to_one_percent]} {
        set er [round_to_two_digits [expr $::skin_graphs(live_graph_weight) / ($::skin_graphs(live_graph_beans) + 0.001)]]
    } else {
        set er [round_to_one_digits [expr $::skin_graphs(live_graph_weight) / ($::skin_graphs(live_graph_beans) + 0.001)]]
    }
    set pi $::skin_graphs(live_graph_pi_time)
    set pt $::skin_graphs(live_graph_pour_time)
    set t $::skin_graphs(live_graph_shot_time)
    set s { }
    set v [skin_water_data]
    return ${time}\r${p}\r${v}ml\r${pi}s${s}+${s}${pt}s${s}=${s}${t}s\r${b}g${s}:${s}${w}g${s}${s}${s}${s}(1:${er})
}

proc clear_info_espresso_last_data_compare {} {
    foreach lg [shift_graph_list_variables] {
        set ::graph_cache(graph_a_$lg) 1
        set ::graph_cache(graph_b_$lg) 1
        set ::graph_cache(graph_c_$lg) 1
        set ::graph_cache(graph_d_$lg) 1
    }
}

proc info_espresso_last_data_compare {} {
    if {$::cache_graph_compare == 0} {
        return ""
    }
    if {$::cache_graph_compare == "graph_a"} {
        if {[info exists ::graph_cache(graph_a_shot_time)]} {
            set time [info_espresso_last_date_time_format $::graph_cache(graph_a_time)]
            set p [name_length $::graph_cache(graph_a_profile) 24]
            set b [round_to_one_digits $::graph_cache(graph_a_beans)]
            set w [round_to_one_digits $::graph_cache(graph_a_weight)]
            if {[info exist ::skin_er_to_one_percent]} {
                set er [round_to_two_digits [expr $::graph_cache(graph_a_weight) / ($::graph_cache(graph_a_beans) + 0.001)]]
            } else {
                set er [round_to_one_digits [expr $::graph_cache(graph_a_weight) / ($::graph_cache(graph_a_beans) + 0.001)]]
            }
            set pi $::graph_cache(graph_a_pi_time)
            set pt $::graph_cache(graph_a_pour_time)
            set t $::graph_cache(graph_a_shot_time)
            set s { }
            if {$::graph_cache(graph_a_pi_water) >= 1} {
                set v "$::graph_cache(graph_a_pi_water) + $::graph_cache(graph_a_pour_water) = $::graph_cache(graph_a_water)"
            } else {
                set v "$::graph_cache(graph_a_water)"
            }
            return ${time}\r${p}\r${v}ml\r${pi}s${s}+${s}${pt}s${s}=${s}${t}s\r${b}g${s}:${s}${w}g${s}${s}${s}${s}(1:${er})
        } else {
            return ""
        }
    }
    if {$::cache_graph_compare == "graph_b"} {
        if {[info exists ::graph_cache(graph_b_shot_time)]} {
            set time [info_espresso_last_date_time_format $::graph_cache(graph_b_time)]
            set p [name_length $::graph_cache(graph_b_profile) 24]
            set b [round_to_one_digits $::graph_cache(graph_b_beans)]
            set w [round_to_one_digits $::graph_cache(graph_b_weight)]
            if {[info exist ::skin_er_to_one_percent]} {
                set er [round_to_two_digits [expr $::graph_cache(graph_b_weight) / ($::graph_cache(graph_b_beans) + 0.001)]]
            } else {
                set er [round_to_one_digits [expr $::graph_cache(graph_b_weight) / ($::graph_cache(graph_b_beans) + 0.001)]]
            }
            set pi $::graph_cache(graph_b_pi_time)
            set pt $::graph_cache(graph_b_pour_time)
            set t $::graph_cache(graph_b_shot_time)
            set s { }
            if {$::graph_cache(graph_b_pi_water) >= 1} {
                set v "$::graph_cache(graph_b_pi_water) + $::graph_cache(graph_b_pour_water) = $::graph_cache(graph_b_water)"
            } else {
                set v "$::graph_cache(graph_b_water)"
            }
            return ${time}\r${p}\r${v}ml\r${pi}s${s}+${s}${pt}s${s}=${s}${t}s\r${b}g${s}:${s}${w}g${s}${s}${s}${s}(1:${er})
        } else {
            return ""
        }
    }
    if {$::cache_graph_compare == "graph_c"} {
        if {[info exists ::graph_cache(graph_c_shot_time)]} {
            set time [info_espresso_last_date_time_format $::graph_cache(graph_c_time)]
            set p [name_length $::graph_cache(graph_c_profile) 24]
            set b [round_to_one_digits $::graph_cache(graph_c_beans)]
            set w [round_to_one_digits $::graph_cache(graph_c_weight)]
            if {[info exist ::skin_er_to_one_percent]} {
                set er [round_to_two_digits [expr $::graph_cache(graph_c_weight) / ($::graph_cache(graph_c_beans) + 0.001)]]
            } else {
                set er [round_to_one_digits [expr $::graph_cache(graph_c_weight) / ($::graph_cache(graph_c_beans) + 0.001)]]
            }
            set pi $::graph_cache(graph_c_pi_time)
            set pt $::graph_cache(graph_c_pour_time)
            set t $::graph_cache(graph_c_shot_time)
            set s { }
            if {$::graph_cache(graph_c_pi_water) >= 1} {
                set v "$::graph_cache(graph_c_pi_water) + $::graph_cache(graph_c_pour_water) = $::graph_cache(graph_c_water)"
            } else {
                set v "$::graph_cache(graph_c_water)"
            }
            return ${time}\r${p}\r${v}ml\r${pi}s${s}+${s}${pt}s${s}=${s}${t}s\r${b}g${s}:${s}${w}g${s}${s}${s}${s}(1:${er})
        } else {
            return ""
        }
    }
    if {$::cache_graph_compare == "graph_d"} {
        if {[info exists ::graph_cache(graph_d_shot_time)]} {
            set time [info_espresso_last_date_time_format $::graph_cache(graph_d_time)]
            set p [name_length $::graph_cache(graph_d_profile) 24]
            set b [round_to_one_digits $::graph_cache(graph_d_beans)]
            set w [round_to_one_digits $::graph_cache(graph_d_weight)]
            if {[info exist ::skin_er_to_one_percent]} {
                set er [round_to_two_digits [expr $::graph_cache(graph_d_weight) / ($::graph_cache(graph_d_beans) + 0.001)]]
            } else {
                set er [round_to_one_digits [expr $::graph_cache(graph_d_weight) / ($::graph_cache(graph_d_beans) + 0.001)]]
            }
            set pi $::graph_cache(graph_d_pi_time)
            set pt $::graph_cache(graph_d_pour_time)
            set t $::graph_cache(graph_d_shot_time)
            set s { }
            if {$::graph_cache(graph_d_pi_water) >= 1} {
                set v "$::graph_cache(graph_d_pi_water) + $::graph_cache(graph_d_pour_water) = $::graph_cache(graph_d_water)"
            } else {
                set v "$::graph_cache(graph_d_water)"
            }
            return ${time}\r${p}\r${v}ml\r${pi}s${s}+${s}${pt}s${s}=${s}${t}s\r${b}g${s}:${s}${w}g${s}${s}${s}${s}(1:${er})
        } else {
            return ""
        }
    }
}

### skin_moveby is a copy from a recent dui addition on 11 March 2024, version 1.43.8.16
### The function is very useful but to keep DSx2 backward compatable I have written skin_moveby
### TODO replace all "skin_moveby" with "dui item moveby" once Stable version 1.44 is released, (used in History viewer)

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

rename backup_settings backup_settings_orig
proc backup_settings {} {
    backup_settings_orig
    if {$::settings(settings_profile_type) == "settings_2c"} {
        set ::saw_backup $::settings(final_desired_shot_weight_advanced)
    } else {
        set ::saw_backup $::settings(final_desired_shot_weight)
    }
}

::register_state_change_handler Sleep Idle skin_load_fav

###################################################
proc skin_loop {} {
    auto_tare_button_colour
    restore_live_graphs
    check_fav
}
skin_negative_scale_tare

################### added for cafe theme

if {$::skin(theme) == "cafe"} {
    if {![info exist ::skin(number_of_favs)]} {
        set ::skin(number_of_favs) 1
    }
    if {![info exist ::skin(show_heading_cafe)]} {
        set ::skin(show_heading_cafe) 0
    }

    set ::fav_x 40
    set ::fav_y 180
    set ::skin(button_x_machine) 2060
    set ::skin(button_y_machine) 1110
    set ::skin(button_x_scale) 2060
    set ::skin(button_y_scale) 1400
    set ::start_button_shift 0
    set ::fav_spacing 370
    set ::skin(scroll_position) 0
    set ::auto_load_fav $::skin(auto_load_fav)
    set ::fav_bn 0
    set ::fav_bn_row 0
    set ::c_fav_key none
    set ::skin_heading $::skin(heading)
    set ::wf_start_button_shift 540
    set ::wf_start_button_shift_x 0
    set ::start_button_pos_1 340
    set ::start_button_pos_2 470
    set ::start_button_pos_3 600
    set ::start_button_pos_4 730
    set ::start_button_pos_h 2000
    set ::auto_load_data_pos_0 490
    set ::auto_load_data_pos_1 620
    set ::auto_load_data_pos_2 750
    set ::auto_load_data_pos_3 880

    if {[file exists "[skin_directory]/plugins/steam_elapsed_timer.tcl"] == 1} {
        file rename -force [skin_directory]/plugins/steam_elapsed_timer.tcl [skin_directory]/plugins/steam_elapsed_timer.off
    }

    proc shift_fav_list {direction} {
        set test [expr $::skin(scroll_position) + $direction]
        if {$test < 0} {return}
        if {$test > [expr ($::skin(number_of_favs) - 10) / 5]} {return}
        set ::skin(scroll_position) [expr $::skin(scroll_position) + $direction]
        dui item moveby $::skin_home_pages {cafe_fav_buttons} {} [expr 110 * $direction * -1]
        favs_to_show
        skin_save skin
    }

    proc favs_to_show {} {
        set first_show [expr 1 + ($::skin(scroll_position) * 5)]
        dui item config $::skin_home_pages cafe_fav_buttons -initial_state hidden -state hidden
        set_button fav${first_show} state normal
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
        incr first_show
        if {$first_show <= $::skin(number_of_favs)} {
            set_button fav${first_show} state normal
        }
    }

    proc initialize_fav_list {} {
        check_favs_controls
        if {$::skin(number_of_favs) > 10} {
            favs_to_show
        }
    }

    proc check_favs_controls {} {
        if {$::skin(number_of_favs) < 11} {
            dui item config $::skin_home_pages fav_controls -initial_state hidden -state hidden
        } else {
            dui item config $::skin_home_pages fav_controls -initial_state normal -state normal
        }
    }

    proc create_c_text_entry { key } {
        add_de1_widget "off" entry 1020 760 {
            set ::c_fav_entry $widget
            bind $widget <Return> {hide_android_keyboard}
            bind $widget <Leave>  {hide_android_keyboard}
            } -width 10 -font [skin_font font 20] -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags c_fav_entry -validate all -validatecommand {expr {[string length %P] <= 24}} -textvariable [format_fav_entry $key]
        set ::temp_fave_key $key
    }

    proc c_current_auto_load {} {
        if {$::auto_load_fav == "none"} {
            return "auto load = not set"
        } else {
            return "auto load = [string range $::auto_load_fav 3 end]"
        }
    }

    proc fav_confirm {key} {
        create_c_text_entry $key
        set ::auto_load_fav_backup $::skin(auto_load_fav)
        if {$::skin(auto_load_fav) == $key} {
            set ::auto_load_toggle_switch_state 1
        } else {
            set ::auto_load_toggle_switch_state 0
        }
        set ::c_fav_key $key
        hide_graph_2
        dui item config off c_fav_confirm -initial_state normal -state normal
        .can itemconfigure c_fav_entry -state normal
        dui item config off c_fav_entry -initial_state normal
    }

    proc hide_c_fav_entry {} {
        dui item delete off c_fav_entry
    }

    proc create_fav_buttons {} {
        incr ::fav_bn
        set [format_fav_label ${::fav_bn}] { }
        set ::fav_bn_row [round_to_integer [expr ($::fav_bn - 1) / 5]]
        set ::fav_bn_column [expr ($::fav_bn_row * 5)]
        if {$::skin(number_of_favs) < 2} {
            add_icon_label_button fav${::fav_bn} off [expr $::fav_x - $::fav_spacing + ($::fav_spacing * ($::fav_bn - $::fav_bn_column)) ] [expr $::fav_y + (110 * $::fav_bn_row)] 360 100 $::skin(icon_fav) $[format_fav_label $::fav_bn] "skin_load fav${::fav_bn}" {cafe_fav_buttons} "fav_confirm fav${::fav_bn}"; set_button fav${::fav_bn} icon_font [skin_font awesome_light 26]; set_button fav${::fav_bn} font [skin_font font 18]
        } else {
            add_icon_label_button fav${::fav_bn} off [expr $::fav_x - $::fav_spacing + ($::fav_spacing * ($::fav_bn - $::fav_bn_column)) ] [expr $::fav_y + (110 * $::fav_bn_row)] 360 100 $::fav_bn $[format_fav_label $::fav_bn] "skin_load fav${::fav_bn}" {cafe_fav_buttons} "fav_confirm fav${::fav_bn}"; set_button fav${::fav_bn} icon_font [skin_font font 26]; set_button fav${::fav_bn} font [skin_font font 18]
        }
        if {[info exists [format_skin_fav_label_setting fav${::fav_bn}]]} {
            set [format_fav_label ${::fav_bn}] [set [format_skin_fav_label_setting fav${::fav_bn}]]
        }
        if {$::fav_bn < $::skin(number_of_favs)} {
            create_fav_buttons
        }
        if {[string range $::skin(auto_load_fav) 3 end] > $::skin(number_of_favs)} {
            set ::skin(auto_load_fav) none
            set ::auto_load_fav none
        }
    }

    proc decrease_fav_buttons {} {
        if {$::skin(number_of_favs) <= 1} {
            return
        }
        if {$::skin(number_of_favs) > 14} {
            set_number_fav_buttons [expr $::skin(number_of_favs) - 5]
        } else {
            set_number_fav_buttons [expr $::skin(number_of_favs) - 1]
        }
    }

    proc increase_fav_buttons {} {

        if {$::skin(number_of_favs) > 9} {
            set_number_fav_buttons [expr $::skin(number_of_favs) + 5]
        } else {
            set_number_fav_buttons [expr $::skin(number_of_favs) + 1]
        }
    }

    proc set_number_fav_buttons {num} {
        dui item delete $::skin_home_pages cafe_fav_buttons
        dui item delete $::skin_home_pages fav_button_cover
        set ::skin(scroll_position) 0
        #if {$num < $::skin(number_of_favs)} {shift_fav_list [expr $num - $::skin(number_of_favs)]}
        set ::skin(number_of_favs) $num
        set ::fav_bn 0
        create_fav_buttons
        check_favs_controls
        favs_to_show
        skin_save skin
    }

    proc c_save_fav {} {
        if {$::auto_load_toggle_switch_state == 1} {
            set ::auto_load_fav $::c_fav_key
        } elseif {$::auto_load_fav_backup == $::skin(auto_load_fav)} {
            set ::skin(auto_load_fav) none
            set ::auto_load_fav none
        }
        skin_save $::c_fav_key
        skin_load $::c_fav_key
        hide_c_fav_entry
        show_graph_2
        dui item config off c_fav_confirm -initial_state hidden -state hidden
    }

    proc c_goto_profile_type {} {
        set title_test [string range [ifexists ::settings(profile_title)] 0 7]
        if {$title_test == "D-Flow /"} {
            popup [translate "You not change D-Flow profile type"]
        } else {
            set ::settings(active_settings_tab) settings_1
            show_settings
            set_next_page off settings_1
            set_profiles_scrollbar_dimensions
            after 500 update_de1_explanation_chart
            set_next_page off $::settings(settings_profile_type)
            page_show off
            set ::settings(active_settings_tab) $::settings(settings_profile_type)
            fill_advanced_profile_steps_listbox
            page_to_show_when_off "bev_type"
        }
    }

    proc c_toggle_steam_heater {} {
        set ::settings(steam_disabled) [expr {!$::de1(steam_disable_toggle)}]
        delay_screen_saver
        de1_send_steam_hotwater_settings
        save_settings
    }

    proc c_jug_size_data {} {
        if {$::skin(jug_auto) == 1 } {
            return [translate "auto jug"]
        } else {
            if {$::skin(jug_size) == "s"} {
                return [translate "small"]
            } elseif {$::skin(jug_size) == "m"} {
                return [translate "medium"]
            } elseif {$::skin(jug_size) == "l"} {
                return [translate "large"]
            } else {
                return [translate "not set"]
            }
        }
    }

    proc c_jug_toggle {} {
        if {$::skin(jug_auto) == 1 } {
            return
        } else {
            if {$::skin(jug_size) == "s"} {
                set ::skin(jug_size) m
                set_jug m
            } elseif {$::skin(jug_size) == "m"} {
                set ::skin(jug_size) l
                set_jug l
            } else {
                set ::skin(jug_size) s
                set_jug s
            }
        }
    }

    proc skin_add_cafe_header_shape {pages x1 y1 x2 y2 x3 y3 x4 y4 colour tags} {
        set shape [.can create polygon [rescale_x_skin $x1] [rescale_y_skin $y1] [rescale_x_skin $x2] [rescale_y_skin $y2] [rescale_x_skin [expr $x2 + 10]] [rescale_y_skin [expr $y2 + 6]] [rescale_x_skin [expr $x2 + 18]] [rescale_y_skin [expr $y2 + 8]] [rescale_x_skin [expr $x3 - 18]] [rescale_y_skin [expr $y3 + 8]] [rescale_x_skin [expr $x3 - 10]] [rescale_y_skin [expr $y3 + 6]] [rescale_x_skin $x3] [rescale_y_skin $y3] [rescale_x_skin $x4] [rescale_y_skin $y4] -outline $::skin_background_colour -fill $colour -tags $tags]
        add_visual_item_to_context $pages $shape
    }

    proc check_c_heading {} {
        if {$::skin(show_heading_cafe) == 2} {
            dui item config $::skin_home_pages headerbar_bg1 -initial_state hidden -state hidden
            dui item config $::skin_home_pages headerbar_bg0 -initial_state hidden -state hidden
            dui item config $::skin_home_pages headerbar_clock -fill $::skin_foreground_colour
            dui item config $::skin_home_pages c_skin_history_button_label -fill $::skin_text_colour
            dui item config $::skin_home_pages heading -fill $::skin_text_colour
            dui item config $::skin_home_pages heading_dots -fill $::skin_text_colour
            dui item moveto $::skin_home_pages heading 1280 60
            dui item moveto $::skin_home_pages heading_dots 1280 22
        } elseif {$::skin(show_heading_cafe) == 1} {
            dui item config $::skin_home_pages headerbar_bg1 -initial_state normal -state normal
            dui item config $::skin_home_pages headerbar_bg1 -outline $::skin_foreground_colour
            dui item config $::skin_home_pages headerbar_bg0 -initial_state normal -state normal
            dui item config $::skin_home_pages headerbar_clock -fill $::skin_button_label_colour
            dui item config $::skin_home_pages c_skin_history_button_label -fill $::skin_button_label_colour
            dui item config $::skin_home_pages heading -fill $::skin_button_label_colour
            dui item config $::skin_home_pages heading_dots -fill $::skin_button_label_colour
            dui item moveto $::skin_home_pages heading 1280 0
            dui item moveto $::skin_home_pages heading_dots 1280 90
        } else {
            dui item config $::skin_home_pages headerbar_bg1 -initial_state normal -state normal
            dui item config $::skin_home_pages headerbar_bg1 -outline $::skin_background_colour
            dui item config $::skin_home_pages headerbar_bg0 -initial_state normal -state normal
            dui item config $::skin_home_pages headerbar_clock -fill $::skin_button_label_colour
            dui item config $::skin_home_pages c_skin_history_button_label -fill $::skin_button_label_colour
            dui item config $::skin_home_pages heading -fill $::skin_button_label_colour
            dui item config $::skin_home_pages heading_dots -fill $::skin_button_label_colour
            dui item moveto $::skin_home_pages heading 1280 0
            dui item moveto $::skin_home_pages heading_dots 1280 90
        }
    }

    proc toggle_c_heading {} {
        set ::skin(show_heading_cafe) [expr {$::skin(show_heading_cafe) + 1}]
        if {$::skin(show_heading_cafe) > 2} {
            set ::skin(show_heading_cafe) 0
        }
        check_c_heading
        skin_save skin
    }

    proc toggle_c_workflow_type {} {
        if {$::skin(workflow) == "none"} {
            workflow latte
        } elseif {$::skin(workflow) == "latte"} {
            workflow long
        } elseif {$::skin(workflow) == "long"} {
            workflow americano
        } elseif {$::skin(workflow) == "americano"} {
            workflow espresso
        } else {
            workflow none
        }
    }

    proc workflow_type_text {} {
        if {$::settings(beverage_type) == "cleaning"} {
            return "cleaning"
        }
        if {$::skin(workflow) == "long"} {
            return "long black"
        } else {
            return $::skin(workflow)
        }
    }

    rename select_profile select_profile_c
    proc select_profile {option} {
        set ::skin(workflow) none
        select_profile_c $option
        workflow $::skin(workflow)
    }
}

proc skin_check_proc_exists p {
   return uplevel 1 [expr {[llength [info procs $p]] > 0}]
}

proc skin_lock {args} {
    if {$::skin(pass_code_on) == 1 && $::skin_pass_code != $::skin(pass_code)} {
        set ::skin_pre_lock_page [dui page current]
        skin_delete_handle_keypress
        page_show skin_lock
        set ::skin_temp_args $args
    } else {
        {*}$args
    }
}
proc skin_exit_lock {} {
    if {$::skin_pass_code == $::skin(pass_code)} {
        after 200 {{*}$::skin_temp_args}
        hide_android_keyboard
        skin_reset_handle_keypress
        set ::skin_unlocked_time [clock seconds]
        unlock_time_check
    } else {
        page_show $::skin_pre_lock_page
    }
}

proc skin_delete_handle_keypress {args} {
    if {[skin_check_proc_exists handle_keypress]} {rename handle_keypress ""}
}
proc skin_reset_handle_keypress {} {
    proc handle_keypress {keycode} {
        msg -DEBUG "Keypress detected: $keycode / $::some_droid"

        if {($::some_droid != 1 && $keycode == 101) || ($::some_droid == 1 && $keycode == 8)} {
            # e = espresso (emulate GUI button press)
            start_espresso

        } elseif {($::some_droid != 1 && $keycode == 105) || ($::some_droid != 1 && $keycode == 32) || ($::some_droid == 1 && $keycode == 12) || ($::some_droid == 1 && $keycode == 44)} {
            # i (or space bar) = idle (emulate GUI button press)
            start_idle

        } elseif {($::some_droid != 1 && $keycode == 102) || ($::some_droid == 1 && $keycode == 9)} {
            # f = flush (emulate GUI button press)
            start_flush

        } elseif {($::some_droid != 1 && $keycode == 115) || ($::some_droid == 1 && $keycode == 22)} {
            # s = steam (emulate GUI button press)
            start_steam

        } elseif {($::some_droid != 1 && $keycode == 119) || ($::some_droid == 1 && $keycode == 26)} {
            # w = water (emulate GUI button press)
            start_water

        } elseif {($::some_droid != 1 && $keycode == 112) || ($::some_droid == 1 && $keycode == 19)} {
            # p = sleep (emulate GUI button press)
            start_sleep

        } elseif {($::some_droid != 1 && $keycode == 50) || ($::some_droid == 1 && $keycode == 31)} {
            start_espresso

        } elseif {($::some_droid != 1 && $keycode == 48) || ($::some_droid == 1 && $keycode == 39)} {
            # 0 = idle (emulate GHC button press)
            start_sleep

        } elseif {($::some_droid != 1 && $keycode == 49) || ($::some_droid == 1 && $keycode == 30)} {
            start_flush

        } elseif {($::some_droid != 1 && $keycode == 51) || ($::some_droid == 1 && $keycode	== 32)} {
            # 3 = steam (emulate GHC button press)
            start_steam

        } elseif {($::some_droid != 1 && $keycode == 52) || ($::some_droid == 1 && $keycode == 33)} {
            # 4 = water (emulate GHC button press)
            start_water
        }
    }
}


proc skin_show_settings {} {
    set ::settings(active_settings_tab) settings_3
    show_settings
}

proc unlock_time_check {} {
    if {[clock seconds] > [expr $::skin_unlocked_time + $::skin(unlock_time)]} {
        set ::skin_unlocked_time 0
        set ::skin_pass_code {}
    } else {
        after 1000 unlock_time_check
    }
}
set ::skin_unlocked_time 0
set ::skin_pre_lock_page off
set ::skin_temp_args {}
if {![info exists ::skin(pass_code_on)]} {
    set ::skin(pass_code_on) 0
}
if {![info exists ::skin(unlock_time)]} {
    set ::skin(unlock_time) 5
}

set ::skin_pass_code {}
set ::skin(pass_code) 123
dui add dtext skin_lock 810 550 -text [translate "Pass code"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
add_de1_widget "skin_lock" entry 1020 522 {
	set ::globals(skin_lock) $widget
	bind $widget <Return> {skin_exit_lock}
	bind $widget <Leave>  {skin_exit_lock}
    } -show * -width 32 -font [skin_font font [fixed_size 16]] -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -textvariable ::skin_pass_code

dui add dbutton skin_lock 1180 1440 \
    -bwidth 200 -bheight 100 \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {EXIT} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {page_show off; skin_reset_handle_keypress}
