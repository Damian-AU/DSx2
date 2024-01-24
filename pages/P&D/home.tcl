
if {$::skin(colour_theme) == "default"} {
    set ::skin_blue #1867D6
    set ::skin_background_colour #000
    set ::skin_forground_colour #131313
    set ::skin_outline_colour #2d2d2d
    set ::skin_outline_colour_2 #2d2d2d
    set ::skin_button_label_colour #E8E8E8
    set ::skin_text_colour #E8E8E8
    set ::skin_x_axis_colour #2d2d2d
    set ::skin_y_axis_colour #2d2d2d
    set ::skin_grid_colour #2d2d2d
    set ::skin_selected_colour $::skin_blue
    set ::skin_disabled_colour #2d2d2d
} else {
    set ::skin_disabled_colour $::skin_button_label_colour
    set ::skin_outline_colour $::skin_background_colour
    set ::skin_outline_colour_2 $::skin_forground_colour
    set ::skin_x_axis_colour $::skin_outline_colour
    set ::skin_y_axis_colour $::skin_outline_colour
}


### sleep power page

dui add variable "skin_power" 1280 840 -font [skin_font font_bold 24] -fill $::skin_text_colour -anchor center -justify center -width 880 -textvariable {[translate "Going to sleep in"]... [skin_power_off_timer]}
add_clear_button power_cancel skin_power 0 0 2560 1600 {} {set_next_page off off; start_idle}
add_icon_label_button power_sleep skin_power 950 600 260 100 {$::skin(icon_sleep)} {sleep} {skin_sleep}; set_button power_sleep icon_font [skin_font awesome_light [fixed_size 26]]
add_icon_label_button power_exit skin_power 1370 600 260 100 {$::skin(icon_x)} {exit} {skin_exit}; set_button power_exit icon_font [skin_font awesome_light [fixed_size 26]]

### screen saver page
dui add dbutton saver 0 0 \
    -bwidth 2560 -bheight 1600 \
    -command {set_next_page off off; start_idle}




proc PD_profile_title {} {
    set a ""
    if {$::settings(profile_has_changed) == 1} {
        set a "*"
        dui item config $::skin_home_pages skin_profile_title -fill $::skin_red
    }
    return $::settings(profile_title)$a
}


dui add dbutton $::skin_home_pages 40 40 \
    -bwidth 1010 -bheight 1520 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add canvas_item line $::skin_home_pages 100 172 970 172 -fill $::skin_outline_colour -width 2
dui add canvas_item line $::skin_home_pages 100 1116 970 1116 -fill $::skin_outline_colour -width 2

dui add dtext $::skin_home_pages 104 110 -text [translate "PROFILE"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w -justify left
dui add variable $::skin_home_pages 970 110 -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor e -justify right -tags skin_profile_title -width 650 -textvariable {[PD_profile_title]}

dui add dbutton $::skin_home_pages 40 40 \
    -bwidth 1010 -bheight 140 \
    -command {goto_profile_list}



proc workflow {option} {
    return
}

proc show_skin_set {option} {
    return
}

proc hide_skin_set {} {
    return
}

proc set_button {button_name property value} {
    set ::auto_load_fav $::skin(auto_load_fav)
    return
}


proc show_graph {} {
    return
}
proc hide_graph {} {
    return
}


proc setup_steam_switch_state {} {
    if {$::settings(steam_disabled) == 0} {
        dui item config $::skin_home_pages PD_steam_label -fill $::skin_button_label_colour
        dui item config $::skin_home_pages PD_steam_value -fill $::skin_button_label_colour
        dui item config $::skin_home_pages PD_steam_minusminus-lbl -fill $::skin_button_label_colour
        dui item config $::skin_home_pages PD_steam_minus-lbl -fill $::skin_button_label_colour
        dui item config $::skin_home_pages PD_steam_plus-lbl -fill $::skin_button_label_colour
        dui item config $::skin_home_pages PD_steam_plusplus-lbl -fill $::skin_button_label_colour
    } else {
        dui item config $::skin_home_pages PD_steam_label -fill $::skin_disabled_colour
        dui item config $::skin_home_pages PD_steam_value -fill $::skin_disabled_colour
        dui item config $::skin_home_pages PD_steam_minusminus-lbl -fill $::skin_disabled_colour
        dui item config $::skin_home_pages PD_steam_minus-lbl -fill $::skin_disabled_colour
        dui item config $::skin_home_pages PD_steam_plus-lbl -fill $::skin_disabled_colour
        dui item config $::skin_home_pages PD_steam_plusplus-lbl -fill $::skin_disabled_colour
    }
}

proc set_fav_colour {fav} {
    clear_fav_colour
    dui item config $::skin_home_pages PD_${fav}_button_on* -initial_state normal -state normal
    dui item config $::skin_home_pages PD_${fav}_label -fill $::skin_selected_colour
    dui item config $::skin_home_pages skin_profile_title -fill $::skin_selected_colour
}

proc clear_fav_colour {} {
    foreach fav {fav1 fav2 fav3 fav4 fav5 fav6} {
        dui item config $::skin_home_pages PD_${fav}_button_on* -initial_state hidden -state hidden
        dui item config $::skin_home_pages PD_${fav}_label -fill $::skin_button_label_colour
    }
    dui item config $::skin_home_pages skin_profile_title -fill $::skin_button_label_colour
}

proc P&D_fav_setup_cancel {} {
    set ::fav_label_${::PD_fave_key} $::PD_label_backup
    set ::skin(auto_load_fav) $::PD_auto_load_backup
    hide_P&D_fav_setup
    update_auto_save
}

proc P&D_fav_setup_save {} {
    skin_save $::PD_fave_key
    hide_P&D_fav_setup
    skin_load $::PD_fave_key
}

proc P&D_fav_setup {fav} {
    hide_P&D_fav_setup
    P&D_hide_graph
    set ::PD_fave_key $fav
    set ::PD_label_backup $::skin(fav_label_${fav})
    set ::PD_auto_load_backup $::skin(auto_load_fav)
    dui item config $::skin_home_pages fav_settings_bg* -state normal
    dui item config $::skin_home_pages fav_setup_heading -state normal
    dui item config $::skin_home_pages fav_button_label_heading -state normal
    dui item config $::skin_home_pages fav_button_auto_heading -state normal
    dui item config $::skin_home_pages current_auto_load -state normal
    dui item config $::skin_home_pages current_auto_load_heading -state normal
    dui item config $::skin_home_pages skin_${fav}_toggle* -state normal
    dui item moveto off ${fav}_entry 1180 640
    dui item config $::skin_home_pages PD_${fav}_button_auto* -state normal
    dui item config $::skin_home_pages PD_fav_button_save* -state normal
    dui item config $::skin_home_pages PD_fav_button_cancel* -state normal
}

proc hide_P&D_fav_setup {} {
    P&D_show_graph
    dui item config $::skin_home_pages fav_settings_bg* -state hidden
    dui item config $::skin_home_pages fav_setup_heading -state hidden
    dui item config $::skin_home_pages fav_button_label_heading -state hidden
    dui item config $::skin_home_pages fav_button_auto_heading -state hidden
    dui item config $::skin_home_pages current_auto_load -state hidden
    dui item config $::skin_home_pages current_auto_load_heading -state hidden
    foreach k {fav1 fav2 fav3 fav4 fav5 fav6} {
        dui item moveto off ${k}_entry 1180 -1001
        dui item config $::skin_home_pages PD_${k}_button_auto* -state hidden
        dui item config $::skin_home_pages skin_${k}_toggle* -state hidden
    }
    dui item config $::skin_home_pages PD_fav_button_save* -state hidden
    dui item config $::skin_home_pages PD_fav_button_cancel* -state hidden

}
proc P&D_hide_graph {} {
    #set ::graph_hidden 1
    .can itemconfigure main_graph -state hidden
    dui item config off main_graph -initial_state hidden
    dui item config $::skin_home_pages PD_rhs_bg_cover -state normal
}
proc P&D_show_graph {} {
    #set ::graph_hidden 1
    .can itemconfigure main_graph -state normal
    dui item config off main_graph -initial_state normal
    dui item config $::skin_home_pages PD_rhs_bg_cover -state hidden
}

proc update_auto_save {} {
    foreach k {fav1 fav2 fav3 fav4 fav5 fav6} {
        set ::skin_${k}_auto 0
    }
    set s $::skin(auto_load_fav)
    set ::skin_${s}_auto 1
}
update_auto_save

proc fav_auto_toggle {} {
    if {$::PD_fave_key != $::skin(auto_load_fav)} {
        set ::skin(auto_load_fav) $::PD_fave_key
        set ::auto_load_fav $::PD_fave_key
        update_auto_save
    } else {
        set ::skin(auto_load_fav) none
        set ::auto_load_fav none
        update_auto_save
    }

}

proc current_auto_load_name {} {
    if {$::skin(auto_load_fav) == "none"} {
        return [translate "none"]
    } else {
        return $::skin(fav_label_${::skin(auto_load_fav)})
    }
}

proc PD_settings {} {
    set_next_page off PD_settings;
    page_show PD_settings;
}





backup_settings




set ::pulak_icon_mm \Ue906
set ::pulak_icon_m \Ue907
set ::pulak_icon_p \Ue908
set ::pulak_icon_pp \Ue905

dui add dbutton $::skin_home_pages 47 220 \
    -bwidth 280 -bheight 96 \
    -labelvariable {[translate "Beans in"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.2 0.5} -label_anchor w \
    -command { }
dui add dbutton $::skin_home_pages 348 220 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust dose -1}
dui add dbutton $::skin_home_pages 466 220 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust dose -0.1}
dui add variable $::skin_home_pages 660 270 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {[round_to_one_digits $::settings(grinder_dose_weight)]g}
dui add dbutton $::skin_home_pages 760 220 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust dose 0.1}
dui add dbutton $::skin_home_pages 876 220 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust dose 1}

dui add dbutton $::skin_home_pages 47 364 \
    -bwidth 280 -bheight 96 \
    -labelvariable {[translate "Beverage out"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.2 0.5} -label_anchor w \
    -command { }
dui add dbutton $::skin_home_pages 348 364 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust saw -10}
dui add dbutton $::skin_home_pages 466 364 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust saw -1}
dui add variable $::skin_home_pages 660 414 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {[skin_saw]g}
dui add dbutton $::skin_home_pages 760 364 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust saw 1}
dui add dbutton $::skin_home_pages 876 364 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust saw 10}

dui add dbutton $::skin_home_pages 47 510 \
    -bwidth 280 -bheight 96 \
    -labelvariable {[translate "Ratio"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.2 0.5} -label_anchor w \
    -command { }
dui add dbutton $::skin_home_pages 348 510 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust er -1}
dui add dbutton $::skin_home_pages 466 510 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust er -0.1}
dui add variable $::skin_home_pages 660 560 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {[skin_extraction_ratio]}
dui add dbutton $::skin_home_pages 760 510 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust er  0.1}
dui add dbutton $::skin_home_pages 876 510 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command { adjust er 1}






dui add dbutton $::skin_home_pages 47 656 \
    -bwidth 280 -bheight 96 \
    -labelvariable {[translate "Flush"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.2 0.5} -label_anchor w \
    -command {}
dui add dbutton $::skin_home_pages 348 656 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust flush -10}
dui add dbutton $::skin_home_pages 466 656 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust flush -1}
dui add variable $::skin_home_pages 660 706 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {[round_to_integer $::settings(flush_seconds)] sec}
dui add dbutton $::skin_home_pages 760 656 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust flush 1}
dui add dbutton $::skin_home_pages 876 656 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust flush 10}




proc PD_jug_toggle {} {
    if {$::settings(steam_disabled) != 1} {
        if {$::skin(jug_size) == "s"} {
            if {$::skin(jug_m) > 0} {
                set ::skin(jug_size) m
                set ::skin(jug_g) $::skin(jug_m)
            } elseif {$::skin(jug_l) > 0} {
                set ::skin(jug_size) l
                set ::skin(jug_g) $::skin(jug_l)
            }
        } elseif {$::skin(jug_size) == "m"} {
            if {$::skin(jug_l) > 0} {
                set ::skin(jug_size) l
                set ::skin(jug_g) $::skin(jug_l)
            } elseif {$::skin(jug_s) > 0} {
                set ::skin(jug_size) s
                set ::skin(jug_g) $::skin(jug_s)
            }
        } elseif {$::skin(jug_size) == "l"} {
            if {$::skin(jug_s) > 0} {
                set ::skin(jug_size) s
                set ::skin(jug_g) $::skin(jug_s)
            } elseif {$::skin(jug_m) > 0} {
                set ::skin(jug_size) m
                set ::skin(jug_g) $::skin(jug_m)
            }
        } else {
            page_show PD_steam_setup
        }
    skin_save skin
    }
}

proc PD_jug_label {} {
    if {$::skin(jug_size) == "s"} {
        return [translate "small"]
    }
    if {$::skin(jug_size) == "m"} {
        return [translate "medium"]
    }
    if {$::skin(jug_size) == "l"} {
        return [translate "large"]
    }
}
proc PD_jug_letter {} {
    if {$::skin(jug_size) == "s"} {
        return [translate "S"]
    }
    if {$::skin(jug_size) == "m"} {
        return [translate "M"]
    }
    if {$::skin(jug_size) == "l"} {
        return [translate "L"]
    }
}




dui add variable $::skin_home_pages 100 852 -font [skin_font font 16] -fill $::skin_button_label_colour -anchor w -justify center -tags PD_steam_label -textvariable {[translate "Steam"] [PD_jug_label]}
dui add dbutton $::skin_home_pages 47 802 \
    -bwidth 280 -bheight 96 \
    -command {PD_jug_toggle} -longpress_cmd {toggle_steam_heater}



dui add dbutton $::skin_home_pages 348 802 \
    -bwidth 96 -bheight 96 -tags PD_steam_minusminus \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust steam -10}
dui add dbutton $::skin_home_pages 466 802 \
    -bwidth 96 -bheight 96 -tags PD_steam_minus \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust steam -1}
dui add variable $::skin_home_pages 660 852 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center  -tags PD_steam_value -textvariable {[skin_steam_text $::settings(steam_timeout)]}
dui add dbutton $::skin_home_pages 760 802 \
    -bwidth 96 -bheight 96 -tags PD_steam_plus \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust steam +1}
dui add dbutton $::skin_home_pages 876 802 \
    -bwidth 96 -bheight 96 -tags PD_steam_plusplus \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust steam +10}


dui add dbutton $::skin_home_pages 47 948 \
    -bwidth 280 -bheight 96 \
    -labelvariable {[water_button_text]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.2 0.5} -label_anchor w \
    -command {adjust_water_toggle}
dui add dbutton $::skin_home_pages 348 948 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_mm} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust water_${::skin_water_dial} -10}
dui add dbutton $::skin_home_pages 466 948 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust water_${::skin_water_dial} -1}
dui add variable $::skin_home_pages 660 998 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {[skin_water_dial_text]}
dui add dbutton $::skin_home_pages 760 948 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust water_${::skin_water_dial} +1}
dui add dbutton $::skin_home_pages 876 948 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::pulak_icon_pp} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust water_${::skin_water_dial} +10}


set ::skin_fav1_colour $::skin_outline_colour
set ::skin_fav2_colour $::skin_outline_colour
set ::skin_fav3_colour $::skin_outline_colour
set ::skin_fav4_colour $::skin_outline_colour
set ::skin_fav5_colour $::skin_outline_colour
set ::skin_fav6_colour $::skin_outline_colour



###################### FAVS 
#### upper row favourites
dui add variable $::skin_home_pages 240 1250 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav1_label -textvariable {$::fav_label_fav1}
dui add dbutton $::skin_home_pages 104 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav1_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav1;} -longpress_cmd {P&D_fav_setup fav1}
dui add dbutton $::skin_home_pages 104 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav1_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav1} -longpress_cmd {P&D_fav_setup fav1}

dui add variable $::skin_home_pages 540 1250 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav2_label -textvariable {$::fav_label_fav2}
dui add dbutton $::skin_home_pages 404 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav2_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav2} -longpress_cmd {P&D_fav_setup fav2}
dui add dbutton $::skin_home_pages 404 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav2_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav2} -longpress_cmd {P&D_fav_setup fav2}


dui add variable $::skin_home_pages 840 1250 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav3_label -textvariable {$::fav_label_fav3}
dui add dbutton $::skin_home_pages 704 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav3_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav3} -longpress_cmd {P&D_fav_setup fav3}
dui add dbutton $::skin_home_pages 704 1180 \
    -bwidth 272 -bheight 140 -tags PD_fav3_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav3} -longpress_cmd {P&D_fav_setup fav3}

#### lower row favourites
dui add variable $::skin_home_pages 240 1440 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav4_label -textvariable {$::fav_label_fav4}
dui add dbutton $::skin_home_pages 104 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav4_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav4} -longpress_cmd {P&D_fav_setup fav4}
dui add dbutton $::skin_home_pages 104 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav4_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav4} -longpress_cmd {P&D_fav_setup fav4}

dui add variable $::skin_home_pages 540 1440 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav5_label -textvariable {$::fav_label_fav5}
dui add dbutton $::skin_home_pages 404 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav5_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav5} -longpress_cmd {P&D_fav_setup fav5}
dui add dbutton $::skin_home_pages 404 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav5_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav5} -longpress_cmd {P&D_fav_setup fav5}

dui add variable $::skin_home_pages 840 1440 -font [skin_font font 16] -fill $::skin_button_label_colour -width 250 -anchor center -justify center -tags PD_fav6_label -textvariable {$::fav_label_fav6}
dui add dbutton $::skin_home_pages 704 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav6_button \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {skin_load fav6} -longpress_cmd {P&D_fav_setup fav6}
dui add dbutton $::skin_home_pages 704 1370 \
    -bwidth 272 -bheight 140 -tags PD_fav6_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -command {skin_load fav6} -longpress_cmd {P&D_fav_setup fav6}



















#add_de1_image "off" 0 0 "[skin_directory]/1.png"

##### Right Side
dui add dbutton $::skin_home_pages 1090 40 \
    -bwidth 1430 -bheight 1076 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add canvas_item line $::skin_home_pages 1150 172 2460 172 -fill $::skin_outline_colour -width 2
dui add canvas_item line $::skin_home_pages 1150 308 2460 308 -fill $::skin_outline_colour -width 2
dui add canvas_item line $::skin_home_pages 1302 40 1302 172 -fill $::skin_outline_colour -width 2
dui add canvas_item line $::skin_home_pages 1524 40 1524 172 -fill $::skin_outline_colour -width 2
dui add canvas_item line $::skin_home_pages 1976 40 1976 172 -fill $::skin_outline_colour -width 2


dui add dtext $::skin_home_pages 1150 110 -text [translate "DATA"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w -justify left
dui add variable $::skin_home_pages 1412 94 -font [skin_font font_bold 16] -fill $::skin_blue -anchor center -justify center -width 880 -textvariable {[start_button_ready]}
dui add variable $::skin_home_pages 1412 132 -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {state}

dui add variable $::skin_home_pages 1610 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {[skin_group_head_heater_temperature_text]}
dui add variable $::skin_home_pages 1736 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {[skin_steamtemp_text]}
dui add variable $::skin_home_pages 1880 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {[skin_low_water]}
dui add dtext $::skin_home_pages 1610 132 -text [translate "Group"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center
dui add dtext $::skin_home_pages 1736 132 -text [translate "Steam"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center
dui add dtext $::skin_home_pages 1880 132 -text [translate "Tank"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center

dui add variable $::skin_home_pages 2100 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {$::skin_graphs(live_graph_pi_time)s}
dui add variable $::skin_home_pages 2250 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {$::skin_graphs(live_graph_pour_time)s}
dui add variable $::skin_home_pages 2400 94 -font [skin_font font_bold 16] -fill $::skin_button_label_colour -anchor center -justify center -width 880 -textvariable {$::skin_graphs(live_graph_shot_time)s}
dui add dtext $::skin_home_pages 2100 132 -text [translate "Infusion"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center
dui add dtext $::skin_home_pages 2250 132 -text [translate "Pour"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center
dui add dtext $::skin_home_pages 2400 132 -text [translate "Total time"] -font [skin_font font 13] -fill $::skin_button_label_colour -anchor center -justify center



### Graph
add_de1_variable "off espresso steam" 0 2000 -font [skin_font font 6] -fill #000 -textvariable {
    [pressure_text]
    [waterflow_text]
    [waterweight_text]
    [waterweightflow_text]
    [watervolume_text]
    [watertemp_text]
    [mixtemp_text]
    [steamtemp_text]
    [group_head_heater_temperature_text]
    [espresso_goal_temp_text]
    [pour_volume]
    [preinfusion_volume]
    [profile_type_text]
}

blt::vector create compare_espresso_elapsed compare_espresso_pressure compare_espresso_flow compare_espresso_flow_weight compare_espresso_state_change

set ::key_font_size [fixed_size 14]




dui add canvas_item rect "off espresso flush water" 1150 228 1172 250 -outline $::skin_green -fill $::skin_green -tags pressure_icon
dui add canvas_item rect "off espresso flush water" 1346 228 1368 250 -outline $::skin_blue -fill $::skin_blue -tags flow_icon
dui add canvas_item rect "off espresso flush water" 1592 228 1614 250 -outline $::skin_brown -fill $::skin_brown -tags weight_icon
dui add canvas_item rect "off espresso flush water" 1874 228 1896 250 -outline $::skin_red -fill $::skin_red -tags temperature_icon
dui add canvas_item rect "off espresso flush water" 2116 228 2138 250 -outline $::skin_yellow -fill $::skin_yellow -tags resistance_icon
dui add canvas_item rect "off espresso flush water" 2326 228 2348 250 -outline $::::skin_grey -fill $::::skin_grey -tags steps_icon
dui add variable "off flush water" 1188 240 -tags pressure_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Pressure"]}
dui add variable "off flush water" 1384 240 -tags flow_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Flow rate"] ([translate "in"])}
dui add variable "off flush water" 1630 240 -tags weight_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Scale rate"] ([translate "out"])}
dui add variable "off flush water" 1912 240 -tags temperature_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Temperature"]}
dui add variable "off flush water" 2154 240 -tags resistance_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Resistance"]}
dui add variable "off flush water" 2364 240 -tags steps_text -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Steps"]}
dui add variable "espresso" 1188 240 -tags pressure_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(pressure)]]bar}
dui add variable "espresso" 1384 240 -tags flow_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(flow)]]ml/s}
dui add variable "espresso" 1630 240 -tags weight_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(scale_weight_rate)]]g/s}
dui add variable "espresso" 1912 240 -tags temperature_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[group_head_heater_temperature_text]}
dui add variable "espresso" 2154 240 -tags resistance_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {[translate "Resistance"]}
dui add variable "espresso" 2364 240 -tags steps_data -font [skin_font font $::key_font_size] -fill $::skin_button_label_colour -anchor w -justify center -width 880 -textvariable {Steps}
dui add dbutton "off espresso flush water" 1150 190 \
    -bwidth 190 -bheight 110 -tags pressure_key_button \
    -command {toggle_graph pressure}
dui add dbutton "off espresso flush water" 1376 190 \
    -bwidth 190 -bheight 110 -tags flow_key_button \
    -command {toggle_graph flow}
dui add dbutton "off espresso flush water" 1620 190 \
    -bwidth 190 -bheight 110 -tags weight_key_button \
    -command {toggle_graph weight}
dui add dbutton "off espresso flush water" 1902 190 \
    -bwidth 190 -bheight 110 -tags temperature_key_button \
    -command {toggle_graph temperature}
dui add dbutton "off espresso flush water" 2144 190 \
    -bwidth 190 -bheight 110 -tags resistance_key_button \
    -command {toggle_graph resistance}
dui add dbutton "off espresso flush water" 2354 190 \
    -bwidth 190 -bheight 110 -tags steps_key_button \
    -command {toggle_graph steps}

#set ::main_graph_height [rescale_y_skin 1010]
set ::skin_data_curve_size 6
add_de1_widget "off flush water" graph 1130 350 {
    set ::home_espresso_graph $widget
    bind $widget [platform_button_press] {

    }

    $widget element create compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 4] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 4] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color #a2a293  -pixels 0;


    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 6] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font_bold 16] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font 16] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10  12}  -hide 0;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_forground_colour -width [rescale_x_skin 1350] -height [rescale_y_skin 740] -borderwidth 1 -background $::skin_forground_colour -plotrelief flat -initial_state normal -tags main_graph

add_de1_widget "espresso" graph 1130 350 {
    set ::home_espresso_graph_espresso $widget
    bind $widget [platform_button_press] {
    }
    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 6] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font_bold 16] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font 16] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10  12}  -hide 0;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_forground_colour -width [rescale_x_skin 1350] -height [rescale_y_skin 740] -borderwidth 1 -background $::skin_forground_colour -plotrelief flat -initial_state normal -tags main_graph


dui add dbutton $::skin_home_pages 1090 1180 \
    -bwidth 590 -bheight 140 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour_2
dui add canvas_item line $::skin_home_pages 1396 1180 1396 1320 -fill $::skin_outline_colour_2 -width 2
dui add canvas_item line $::skin_home_pages 1544 1180 1544 1320 -fill $::skin_outline_colour_2 -width 2

dui add variable $::skin_home_pages 1140 1230 -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}
dui add variable $::skin_home_pages 1140 1280 -font [skin_font font 13] -fill $::skin_text_colour -anchor w -justify center -textvariable {[skin_scale_disconnected]}


dui add dbutton $::skin_home_pages 1090 1180 \
    -bwidth 300 -bheight 140 \
    -command {scale_tare; catch {ble_connect_to_scale}}

dui add dbutton $::skin_home_pages 1396 1180 \
    -bwidth 140 -bheight 140 \
    -labelvariable {\Ue90a} -label_font [skin_font icomoon 48] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set_scale_weight_to_dose}

dui add dbutton $::skin_home_pages 1544 1180 \
    -bwidth 140 -bheight 140 \
    -labelvariable {\Ue914} -label_font [skin_font icomoon 48] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {skin_steam_time_calc}


dui add dbutton $::skin_home_pages 1724 1180 \
    -bwidth 790 -bheight 140 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour_2
dui add canvas_item line $::skin_home_pages 1926 1180 1926 1320 -fill $::skin_outline_colour_2 -width 2
dui add canvas_item line $::skin_home_pages 2098 1180 2098 1320 -fill $::skin_outline_colour_2 -width 2
dui add canvas_item line $::skin_home_pages 2298 1180 2298 1320 -fill $::skin_outline_colour_2 -width 2


dui add dtext $::skin_home_pages 1764 1230 -text [translate "Skin"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 1764 1270 -text [translate "Settings"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 1962 1230 -text [translate "Profile"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 1962 1270 -text [translate "Editor"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 2132 1230 -text [translate "Machine"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 2132 1270 -text [translate "Settings"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 2334 1230 -text [translate "App"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center
dui add dtext $::skin_home_pages 2334 1270 -text [translate "Settings"] -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor w -justify center




dui add dbutton $::skin_home_pages 1724 1180 \
    -bwidth 140 -bheight 140 \
    -command {PD_settings}

dui add dbutton $::skin_home_pages 1926 1180 \
    -bwidth 300 -bheight 140 \
    -command {goto_profile_wizard}

dui add dbutton $::skin_home_pages 2098 1180 \
    -bwidth 300 -bheight 140 \
    -command {set ::settings(active_settings_tab) settings_3; show_settings}

dui add dbutton $::skin_home_pages 2298 1180 \
    -bwidth 300 -bheight 140 \
    -command {set ::settings(active_settings_tab) settings_4; show_settings}



dui add dbutton $::skin_home_pages 2310 1400 \
    -bwidth 200 -bheight 140 \
    -labelvariable {\Ue909} -label_font [skin_font icomoon 52] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {skin_power}



dui add dbutton $::skin_home_pages 1090 1370 \
    -bwidth 1168 -bheight 190 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour_2
dui add canvas_item line $::skin_home_pages 2110 1370 2110 1560 -fill $::skin_outline_colour_2 -width 2

dui add dbutton $::skin_home_pages 2110 1370 \
    -bwidth 150 -bheight 190 \
    -labelvariable {\Ue913} -label_font [skin_font icomoon 52] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {skin_power}



################# settings
set ::PD_message ""
dui add canvas_item rect $::skin_home_pages 1060 0 2560 1600 -outline $::skin_background_colour -fill $::skin_background_colour -tags PD_rhs_bg_cover -initial_state hidden

dui add dbutton $::skin_home_pages 1120 420 \
    -bwidth 1400 -bheight 540 -initial_state hidden -tags fav_settings_bg \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add canvas_item line $::skin_home_pages 1180 550 2460 550 -fill $::skin_outline_colour -width 2

dui add dtext $::skin_home_pages 1180 490 -text [translate "Favourite button setup"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w -tags fav_setup_heading -initial_state hidden

dui add dtext $::skin_home_pages 1180 610 -text [translate "button label"] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -tags fav_button_label_heading -initial_state hidden

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav1_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav1_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav1

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav2_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav2_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav2

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav3_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav3_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav3

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav4_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav4_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav4

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav5_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav5_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav5

add_de1_widget "off" entry 1180 -1001 {
	set ::globals(fav6_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]] -borderwidth 0 -highlightcolor $::skin_button_label_colour -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav6_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav6



dui add dtext $::skin_home_pages 1700 610 -text [translate "auto load"] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -tags fav_button_auto_heading -initial_state hidden

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav1_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav1_auto -command {fav_auto_toggle}

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav2_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav2_auto -command {fav_auto_toggle}

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav3_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav3_auto -command {fav_auto_toggle}

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav4_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav4_auto -command {fav_auto_toggle}

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav5_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav5_auto -command {fav_auto_toggle}

dui add dtoggle $::skin_home_pages 1700 640 -width 120 -height 68  -anchor nw -tags skin_fav6_toggle -initial_state hidden \
    -outline_width 0 -background $::skin_outline_colour \
    -selectedbackground $::skin_outline_colour -selectedforeground $::skin_selected_colour -selectedoutline $::skin_selected_colour \
    -disabledbackground $::skin_outline_colour -disabledforeground $::skin_outline_colour -disabledoutline $::skin_outline_colour \
    -variable ::skin_fav6_auto -command {fav_auto_toggle}

dui add dtext $::skin_home_pages 2050 610 -text [translate "current auto load"] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -tags current_auto_load_heading -initial_state hidden
dui add variable $::skin_home_pages 2050 670 -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -justify center -tags current_auto_load -initial_state hidden -textvariable {[current_auto_load_name]}



dui add dbutton $::skin_home_pages 1910 820 \
    -bwidth 260 -bheight 100 -tags PD_fav_button_cancel -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "cancel"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {P&D_fav_setup_cancel}

dui add dbutton $::skin_home_pages 2200 820 \
    -bwidth 260 -bheight 100 -tags PD_fav_button_save -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "save"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {P&D_fav_setup_save}




dui add dbutton PD_settings 1910 820 \
    -bwidth 260 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "cancel"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set_next_page off off; page_show off}

dui add dbutton PD_settings 2200 820 \
    -bwidth 260 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "save"]} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set_next_page off off; page_show off}




setup_home_espresso_graph
skin_load $::skin(auto_load_fav)
#setup_steam_switch_state
check_app_extensions
dui add variable off 0 0 -fill $::skin_button_label_colour  -font [skin_font font 14] -tags loop -anchor center -textvariable {[skin_loop]}
initial_icon_cal_check




# optional keyboard bindings
focus .can
bind Canvas <KeyPress> {handle_keypress %k}

profile_has_changed_set_colors

proc skins_page_change_due_to_de1_state_change { textstate } {
	page_change_due_to_de1_state_change $textstate
	if {$textstate == "Idle"} {
        if {$::flush_timer_backup > 0} {
            set ::settings(flush_seconds) $::flush_timer_backup
            set ::flush_timer_backup 0
        }
        if {$::steam_timer_backup > 0} {
            set ::settings(steam_timeout) $::steam_timer_backup
            set ::steam_timer_backup 0
        }
        set_next_page off off;
    } elseif {$textstate == "Steam"} {
        set ::steam_timer_backup $::settings(steam_timeout)
        set_next_page off off;
        page_show steam
    } elseif {$textstate == "Espresso"} {
        set_next_page off off;
        page_show espresso
    } elseif {$textstate == "HotWater"} {
        show_graph
        set_next_page off off;
        page_show water
    } elseif {$textstate == "HotWaterRinse"} {
        set ::flush_timer_backup $::settings(flush_seconds)
        show_graph
        set_next_page off off;
        page_show flush
    }
}
add_de1_variable "off" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {P&D / $::settings(skin) v${::skin_version}}

