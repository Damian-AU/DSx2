proc fav_settings_vars {} {
    return {
        profile
        profile_title
        profile_filename
        grinder_dose_weight
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
        workflow jug_size
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

    if {$key == "fav1" || $key == "fav2" || $key == "fav3" || $key == "fav4" || $key == "fav5" || $key == "fav6"} {
        set ::skin(auto_load_fav) $::auto_load_fav
        set ::skin(fav_key) $key
        if {$key == "fav1"} {
            set ::skin(fav_label_fav1) $::fav_label_fav1
        }
        if {$key == "fav2"} {
            set ::skin(fav_label_fav2) $::fav_label_fav2
        }
        if {$key == "fav3"} {
            set ::skin(fav_label_fav3) $::fav_label_fav3
        }
        if {$key == "fav4"} {
            set ::skin(fav_label_fav4) $::fav_label_fav4
        }
        if {$key == "fav5"} {
            set ::skin(fav_label_fav5) $::fav_label_fav5
        }
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


        skin_save skin
        rest_fav_buttons
        show_graph
        restore_graphs
    }
}

proc skin_load {key} {
    if {$key == "fav1" || $key == "fav2" || $key == "fav3" || $key == "fav4" || $key == "fav5" || $key == "fav6"} {
        if {[file exists [skin_directory]/settings/$key.txt]} {
            set ::skin(fav_key) $key
            array unset -nocomplain fav_settings
            array set fav_settings [encoding convertfrom utf-8 [read_binary_file "[skin_directory]/settings/$key.txt"]]
            array set settings $fav_settings(app)
            set settings_vars [fav_settings_vars]
            foreach k $settings_vars {
                set ::settings($k) $settings($k)
                set ::fav_settings_test($k) $settings($k)
            }
            array set skin $fav_settings(skin)
            set skin_vars [fav_skin_vars]
            foreach k $skin_vars {
                set ::skin($k) $skin($k)
                set ::fav_skin_test($k) $skin($k)
            }
            check_current_jug
            set_fav_colour $key
            workflow $::skin(workflow)
            set ::de1(steam_disable_toggle) [expr {!$::settings(steam_disabled)}]
            setup_steam_switch_state
            god_shot_clear
            select_profile $::settings(profile_filename)
            if {$::settings(settings_profile_type) == "settings_2c2" || $::settings(settings_profile_type) == "settings_2c"} {
                array set ::current_adv_step [lindex $::settings(advanced_shot) 0]
            }
            save_settings_to_de1
            save_settings
            de1_send_steam_hotwater_settings
            set ::settings(profile_has_changed) 0
            profile_has_changed_set_colors
            update_de1_explanation_chart
            fill_profiles_listbox
            skin_save skin
            restore_graphs
            set_button wf_save_saw_x_button state hidden
            set_button wf_save_saw_tick_button state hidden
        } else {
            # show_manual fav_manual
        }
    }
}