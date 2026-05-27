proc fav_settings_vars {} {
    return {
        profile
        profile_title
        profile_filename
        grinder_dose_weight
        grinder_setting
        steam_disabled
        steam_flow
        steam_temperature
        steam_timeout
        flush_seconds
        hotwater_flow
        water_temperature
        water_volume
    }
}

proc fav_skin_vars {} {
    return {
        workflow jug_size jug_auto wf_grind_show
    }
}

proc wait_dye_to_load_then_update_next {} {
    if {[info exists ::plugins::DYE::shots::src_shot]} {
        ::plugins::DYE::shots::define_next_desc
    } else {
       after 100 wait_dye_to_load_then_update_next
    }
}

proc skin_save {key} {
    if {$key == "" || $key == "all"} {
        save_settings
        skin_save skin
        de1_send_steam_hotwater_settings
    }
    if {$key == "settings"} {
        save_settings
    }
    if {$key == "flush"} {
        save_settings
        de1_send_steam_hotwater_settings
    }
    if {$key == "steam"} {

         if {$::settings(steam_timeout) <= 0} {
            set ::settings(steam_timeout) 1
            set ::settings(steam_disabled) 1
         }
         if {$::settings(steam_timeout) > 255} {
            set ::settings(steam_timeout) 255
         }
         if {$::settings(steam_disabled) == 1} {

         } else {

         }
         save_settings
         delay_screen_saver
         de1_send_steam_hotwater_settings
    }
    if {$key == "water"} {
        save_settings
        skin_save skin
        de1_send_steam_hotwater_settings
    }
    if {$key == "skin"} {
        upvar ::skin item
        set data {}
        foreach k [lsort -dictionary [array names item]] {
            set v $item($k)
            append data [subst {[list $k] [list $v]\n}]
        }
        write_file [skin_directory]/settings/${key}_settings.txt $data
    }
    if {$key == "skin_graphs"} {
        upvar ::skin_graphs item
        set data {}
        foreach k [lsort -dictionary [array names item]] {
            set v $item($k)
            append data [subst {[list $k] [list $v]\n}]
        }
        write_file [skin_directory]/settings/$key.txt $data
    }
    if {$key == "jug_s" || $key == "jug_m" || $key == "jug_l"} {
        set ::skin($key) [round_to_one_digits $::de1(scale_sensor_weight)]
        skin_save skin
        hide_jug $key
    }

    if {[string range $key 0 2] == "fav"} {

        if {$::skin(theme) == "cafe"} {
            if {$::settings(beverage_type) == "cleaning"} {
                set ::skin(workflow) none
            }
        }
        clear_fav_colour
        set ::skin(auto_load_fav) $::auto_load_fav
        if {$::skin(theme) == "Damian"} {set ::skin(auto_load_fav_Damian) $::auto_load_fav}
        if {$::skin(theme) == "cafe"} {set ::skin(auto_load_fav_cafe) $::auto_load_fav}

        set ::skin(fav_key) $key

        set label [format_fav_entry $key]
        set skin_setting [format_skin_fav_label_setting $key]
        set $skin_setting [set $label]

        set data {}
        append data "app {\n"
        set vars [fav_settings_vars]
        foreach k $vars {
            if {[info exists ::settings($k)] == 1} {
                set v $::settings($k)
                append data [subst {[list $k] [list $v]\n}]
            }
        }
        append data "}\n"
        append data "skin {\n"
        set skin_vars [fav_skin_vars]
        foreach k $skin_vars {
            if {[info exists ::skin($k)] == 1} {
                set v $::skin($k)
                append data [subst {[list $k] [list $v]\n}]
            }
        }
        append data "}\n"

        write_file [skin_directory]/settings/$key.txt $data
        update_de1_explanation_chart
        if {$::skin(theme) == "Damian"} {
            check_wf_steam_jug_auto_weight
            rest_fav_buttons
            show_graph
        }
        skin_save skin
        restore_graphs
    }
}

proc skin_load {key} {
    if {$key == "none"} {
        return
    }
    if {[file exists [skin_directory]/settings/$key.txt]} {
        set previous_profile_filename [ifexists ::settings(profile_filename)]
        set previous_workflow [ifexists ::skin(workflow)]
        set previous_beverage_type [ifexists ::settings(beverage_type)]
        clear_fav_colour
        if {![info exists ::skin(fav_key)] || $::skin(fav_key) ne $key} {
            set ::skin(fav_key) $key
        }
        array unset -nocomplain fav_settings
        array set fav_settings [encoding convertfrom utf-8 [read_binary_file "[skin_directory]/settings/$key.txt"]]
        array set settings $fav_settings(app)
        set selected_profile_filename [ifexists settings(profile_filename)]
        set changing_profile [expr {$selected_profile_filename ne "" && $selected_profile_filename ne $previous_profile_filename}]
        set profile_needs_reload [expr {$changing_profile || [ifexists ::settings(profile_has_changed)] == 1 || $previous_beverage_type ne "espresso"}]
        set settings_vars [fav_settings_vars]
        foreach k $settings_vars {
            if {[info exists settings($k)] == 1} {
                if {$changing_profile && $k in {profile profile_title}} {
                    set ::fav_settings_test($k) $settings($k)
                    continue
                }
                if {![info exists ::settings($k)] || $::settings($k) ne $settings($k)} {
                    set ::settings($k) $settings($k)
                }
                set ::fav_settings_test($k) $settings($k)
            }
        }
        if {$profile_needs_reload} {
            set ::skin(select_profile_preserve_workflow) 1
            set select_profile_result [catch {select_profile $::settings(profile_filename)} select_profile_error select_profile_options]
            unset -nocomplain ::skin(select_profile_preserve_workflow)
            if {$select_profile_result != 0} {
                return -options $select_profile_options $select_profile_error
            }
        }
        array set skin $fav_settings(skin)
        set skin_vars [fav_skin_vars]

        foreach k $skin_vars {
            if {[info exists skin($k)] == 1} {
                if {![info exists ::skin($k)] || $::skin($k) ne $skin($k)} {
                    set ::skin($k) $skin($k)
                }
                set ::fav_skin_test($k) $skin($k)
            }
        }
        set ::de1(steam_disable_toggle) [expr {!$::settings(steam_disabled)}]
        if {[info exists ::skin(jug_size)]} {
            set jug_weight_key "jug_$::skin(jug_size)"
            if {[info exists ::skin($jug_weight_key)]} {
                set ::skin(jug_g) $::skin($jug_weight_key)
            }
        }
        if {$::skin(theme) == "Damian"} {
            check_wf_steam_jug_auto_weight
            check_current_jug
            setup_steam_switch_state
        }
        god_shot_clear
        #select_profile $::settings(profile_filename)
        if {$::settings(settings_profile_type) == "settings_2c2" || $::settings(settings_profile_type) == "settings_2c"} {
            array set ::current_adv_step [lindex $::settings(advanced_shot) 0]
        }
        save_settings_to_de1

        save_settings
        set ::settings(profile_has_changed) 0
        profile_has_changed_set_colors
        set_fav_colour $key
        update_de1_explanation_chart_soon
        if {[ifexists ::de1(current_context)] == "settings_1"} {
            fill_profiles_listbox
        }
        if {[ifexists ::skin(workflow)] ne $previous_workflow || [ifexists ::settings(beverage_type)] ne $previous_beverage_type} {
            workflow $::skin(workflow)
        }
        skin_save skin
        restore_graphs
        if {$::skin(theme) == "Damian"} {
            set_button wf_save_saw_x_button state hidden
            set_button wf_save_saw_tick_button state hidden
        }
        if {"DYE" in $::settings(enabled_plugins) == 1 && $::skin(theme) == "cafe"} {
            wait_dye_to_load_then_update_next
        }
    } else {
        popup [translate "Longpress to save settings to this favourite button"]
    }
}
