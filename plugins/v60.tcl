#### V60 brew calulator - DSx2 plugin, borrowed heavily from Damian's pizza dough calculator ####
set ::v60_brew_calulator_author bsnelson
set ::v60_brew_calulator_version 2.1

### favourites
proc v60_reset {} {
    set ::skin(water_weight) 240.0
    set ::skin(water_ratio) 16.0
    set ::skin(flavor_setting) "Standard"
    set ::skin(strength_setting) "Standard"
    set ::skin(water_weight_fav_1) 470.0
    set ::skin(water_ratio_fav_1) 16.0
    set ::skin(flavor_setting_fav_1) "Sweet"
    set ::skin(strength_setting_fav_1) "Higher"
    set ::skin(water_weight_fav_2) 240.0
    set ::skin(water_ratio_fav_2) 16.0
    set ::skin(flavor_setting_fav_2) "Sweet"
    set ::skin(strength_setting_fav_2) "Higher"
    set ::skin(v60_fav_1_name) "One Cup"
    set ::skin(v60_fav_2_name) "Two Cups"
}

if {![info exists ::skin(water_weight)] } {
    v60_reset
}

proc v60_save_fav_1 {} {
    set ::skin(flavor_setting_fav_1) $::skin(flavor_setting)
    set ::skin(strength_setting_fav_1) $::skin(strength_setting)
    set ::skin(water_weight_fav_1) $::skin(water_weight)
    set ::skin(water_ratio_fav_1) $::skin(water_ratio)
    v60_text_colour
    skin_save skin
}

proc v60_save_fav_2 {} {
    set ::skin(flavor_setting_fav_2) $::skin(flavor_setting)
    set ::skin(strength_setting_fav_2) $::skin(strength_setting)
    set ::skin(water_weight_fav_2) $::skin(water_weight)
    set ::skin(water_ratio_fav_2) $::skin(water_ratio)
    v60_text_colour
    skin_save skin
}

proc v60_fav_1 {} {
    set ::skin(flavor_setting) $::skin(flavor_setting_fav_1)
    set ::skin(strength_setting) $::skin(strength_setting_fav_1)
    set ::skin(water_weight) $::skin(water_weight_fav_1)
    set ::skin(water_ratio) $::skin(water_ratio_fav_1)
}
proc v60_fav_2 {} {
    set ::skin(flavor_setting) $::skin(flavor_setting_fav_2)
    set ::skin(strength_setting) $::skin(strength_setting_fav_2)
    set ::skin(water_weight) $::skin(water_weight_fav_2)
    set ::skin(water_ratio) $::skin(water_ratio_fav_2)
}

proc v60_text_colour {} {
    if {$::skin(flavor_setting) == $::skin(flavor_setting_fav_1) && $::skin(water_weight) == $::skin(water_weight_fav_1) && $::skin(water_ratio) == $::skin(water_ratio_fav_1) && $::skin(strength_setting) == $::skin(strength_setting_fav_1)} {
        .can itemconfigure $::v60_text_one_cup -fill $::skin_selected_colour
    } else {
        .can itemconfigure $::v60_text_one_cup -fill $::skin_button_label_colour
    }
    if {$::skin(flavor_setting) == $::skin(flavor_setting_fav_2) && $::skin(water_weight) == $::skin(water_weight_fav_2) && $::skin(water_ratio) == $::skin(water_ratio_fav_2) && $::skin(strength_setting) == $::skin(strength_setting_fav_2)} {
        .can itemconfigure $::v60_text_two_cups -fill $::skin_selected_colour
    } else {
        .can itemconfigure $::v60_text_two_cups -fill $::skin_button_label_colour
    }
}


### The calulations ###
proc v60_calculate {} {
    msg -WARN cqueso
    set weight [expr {$::skin(water_weight) / $::skin(water_ratio)}]
    set pour_perc(1) 20
    set pour_perc(2) 20
    if {$::skin(flavor_setting) == "Sweet"} {
        set pour_perc(1) 16
        set pour_perc(2) 24
    } elseif {$::skin(flavor_setting) == "Standard"} {
        set pour_perc(1) 20
        set pour_perc(2) 20
    } elseif {$::skin(flavor_setting) == "Acidic"} {
        set pour_perc(1) 24
        set pour_perc(2) 16
    }
    set pour_remainder_perc 20
    if {$::skin(strength_setting) == "Lower"} {
        set pour_remainder_perc 30
        set pour_remainder_pours 2
    } elseif {$::skin(strength_setting) == "Standard"} {
        set pour_remainder_perc 20
        set pour_remainder_pours 3
    } elseif {$::skin(strength_setting) == "Higher"} {
        set pour_remainder_perc 15
        set pour_remainder_pours 4
    }

    set ::skin(pour_remainder_pours) $pour_remainder_pours
    set ::coffee_weight $weight
    set ::pour_weight(1) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_perc(1) / 100.0)}]]
    set ::pour_weight(2) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_perc(2) / 100.0)}]]
    set ::pour_weight(3) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_remainder_perc / 100.0)}]]
    set ::pour_weight(4) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_remainder_perc / 100.0)}]]
    if {[expr $::skin(pour_remainder_pours) < 3]} {
        set ::pour_weight(5) "n/a"
    } else {
        set ::pour_weight(5) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_remainder_perc / 100.0)}]]
    }    
    if {[expr $::skin(pour_remainder_pours) < 4]} {
        set ::pour_weight(6) "n/a"
    } else {
        set ::pour_weight(6) [round_to_one_digits [expr {$::skin(water_weight) * ($pour_remainder_perc / 100.0)}]]
    }
    v60_text_colour
}

proc time_incr { time_in incr_in } {
    set time_parts [split $time_in ":"]
    set seconds [expr [lindex $time_parts 0] * 60 + [lindex $time_parts 1]]
    set seconds [expr $seconds + $incr_in]
    set minutes [expr $seconds / 60]
    set seconds [expr $seconds - $minutes * 60]
    return [format "%02d:%02d" $minutes $seconds]
}

proc get_pour { ndx } {
    msg -WARN [namespace current] "gqueso $ndx"
    if { [expr $ndx > [expr $::skin(pour_remainder_pours) + 2]] } {
        return "n/a"
    }
    set accum 0.0
    for { set i 1 } { $i <= $ndx } { incr i } {
        set accum [round_to_one_digits [expr {$accum + $::pour_weight($i)}]]
    }
    return $accum
}

proc set_strength { direction } {
    if { $direction > 0 } {
        if { $::skin(strength_setting) == "Lower" } {
            set ::skin(strength_setting) "Standard"
        } elseif { $::skin(strength_setting) == "Standard" } {
            set ::skin(strength_setting) "Higher"
        }
    } elseif { $direction < 0 } {
        if { $::skin(strength_setting) == "Higher" } {
            set ::skin(strength_setting) "Standard"
        } elseif { $::skin(strength_setting) == "Standard" } {
            set ::skin(strength_setting) "Lower"
        }
    }
    return $::skin(strength_setting)
}

proc set_flavor { direction } {
    if { $direction > 0 } {
        if { $::skin(flavor_setting) == "Sweet" } {
            set ::skin(flavor_setting) "Standard"
        } elseif { $::skin(flavor_setting) == "Standard" } {
            set ::skin(flavor_setting) "Acidic"
        }
    } elseif { $direction < 0 } {
        if { $::skin(flavor_setting) == "Acidic" } {
            set ::skin(flavor_setting) "Standard"
        } elseif { $::skin(flavor_setting) == "Standard" } {
            set ::skin(flavor_setting) "Sweet"
        }
    }
    return $::skin(flavor_setting)
}

### UI ###
### page show button ###
dui add dbutton saver 0 0 -tags v60_saver_button -shape round \
            -bwidth 140 -bheight 140 -tags v60_saver_button \
            -radius 30 -fill #333 -symbol [dui symbol get v] -symbol_pos {0.52 0.4} \
            -symbol_anchor center -symbol_justify center -symbol_fill #666 -symbol_font_size 32 \
            -label "V60" -label_pos {0.50 0.8} -label_anchor center -label_justify center \
            -label_fill #666 -label_font_size 14 -command {scale_enable_lcd; page_show v60_brew;}
add_screen_saver_button v60_saver_button

### Page heading ###
add_de1_variable "v60_brew" 1280 80 -justify center -font [skin_font font 30] -fill $::skin_text_colour -textvariable {V60 Calculator - Tetsu Kasuya 4:6 Method}

### backgrounds
dui add dbutton v60_brew 40 190 \
    -bwidth 1010 -bheight 1370 \
    -shape round -radius 30 -fill $::skin_background_colour

dui add dbutton v60_brew 1090 190 \
    -bwidth 1420 -bheight 860 \
    -shape round -radius 30 -fill $::skin_background_colour

dui add dbutton v60_brew 1590 1140 \
    -bwidth 420 -bheight 150 \
    -shape round -radius 30 -fill $::skin_background_colour \
    -command {scale_tare; catch {ble_connect_to_scale}}
dui add variable v60_brew 1800 1210 -font [skin_font font 38] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}
dui add variable v60_brew 1800 1270 -font [skin_font font 13] -fill $::skin_text_colour -anchor center -justify center -textvariable {[skin_scale_disconnected]}
dui add dbutton v60_brew 1590 1140 \
    -bwidth 420 -bheight 150 \
    -command {scale_tare; catch {ble_connect_to_scale}}

### Recipe ###
set text_x_offset 1160
set grounds_x_offset 1740
set cumu_x_offset 1520
set pour_x_offset 1750
set time_x_offset 1950
set base_y_offset 370
set base_y_incr 100
set table_font 28

dui add dtext v60_brew $text_x_offset $base_y_offset -text [translate "coffee weight"] -font [skin_font font [expr $table_font + 4]] -fill $::skin_text_colour -anchor w -justify center
dui add variable v60_brew $grounds_x_offset $base_y_offset -font [skin_font font 30] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_one_digits $::coffee_weight]g}

### Pour values ###
set pour_time "00:00"
for { set pour_index 1} { $pour_index <= 6} { incr pour_index } {
    set this_poured {($::pour_weight(}; append this_poured $pour_index; append this_poured {))}
    set cumu_poured {[get_pour }; append cumu_poured $pour_index; append cumu_poured {]}
    dui add dtext v60_brew $text_x_offset [expr $base_y_offset + $base_y_incr * $pour_index] -text [translate "pour $pour_index"] -font [skin_font font $table_font] -fill $::skin_text_colour -anchor w -justify center
    dui add variable v60_brew $cumu_x_offset [expr $base_y_offset + $base_y_incr * $pour_index] -font [skin_font font $table_font] -fill $::skin_text_colour -anchor center -justify center -textvariable $cumu_poured
    dui add variable v60_brew $pour_x_offset [expr $base_y_offset + $base_y_incr * $pour_index] -font [skin_font font $table_font] -fill $::skin_text_colour -anchor center -justify center -textvariable $this_poured
    dui add dtext v60_brew $time_x_offset [expr $base_y_offset + $base_y_incr * $pour_index] -text [translate $pour_time] -font [skin_font font $table_font] -fill $::skin_text_colour -anchor w -justify center
    set pour_time [time_incr $pour_time 45]
}

dui add dbutton v60_brew 1460 1400 \
    -bwidth 680 -bheight 96 \
    -labelvariable {[translate "exit"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {scale_disable_lcd; skin_save skin; if {$::de1_num_state($::de1(state)) == "Sleep"} {page_show saver;} else {set_next_page off off; start_idle; page_show off;}}

### Left side
dui add dtext v60_brew 190 380 -text [translate "Recipe"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center

dui add dtext v60_brew 190 470 -text [translate "water"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton v60_brew 361 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF100} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_weight) [round_to_integer [expr $::skin(water_weight) - 10]]; if {$::skin(water_weight) < 140} {set ::skin(water_weight) 140}; v60_calculate}
dui add dbutton v60_brew 486 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF104} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_weight) [round_to_integer [expr $::skin(water_weight) - 1]]; if {$::skin(water_weight) < 140} {set ::skin(water_weight) 140}; v60_calculate}
dui add variable v60_brew 680 470 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_integer $::skin(water_weight)]g}
dui add dbutton v60_brew 780 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF105} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_weight) [round_to_integer [expr $::skin(water_weight) + 1]]; if {$::skin(water_weight) > 500} {set ::skin(water_weight) 500}; v60_calculate}
dui add dbutton v60_brew 910 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF101} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_weight) [round_to_integer [expr $::skin(water_weight) + 10]]; if {$::skin(water_weight) > 500} {set ::skin(water_weight) 500}; v60_calculate}

dui add dtext v60_brew 190 620 -text [translate "ratio"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton v60_brew 486 570 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF104} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_ratio) [round_to_one_digits [expr $::skin(water_ratio) - 0.5]]; if {$::skin(water_ratio) < 10} {set ::skin(water_ratio) 10}; v60_calculate}
dui add variable v60_brew 680 620 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {1:[round_to_one_digits $::skin(water_ratio)]}
dui add dbutton v60_brew 780 570 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF105} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(water_ratio) [round_to_one_digits [expr $::skin(water_ratio) + 0.5]]; if {$::skin(water_ratio) > 25} {set ::skin(water_ratio) 25};v60_calculate}

dui add dtext v60_brew 190 770 -text [translate "flavor"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton v60_brew 486 720 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF104} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(flavor_setting) [set_flavor -1]; v60_calculate}
dui add variable v60_brew 680 770 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::skin(flavor_setting)}
dui add dbutton v60_brew 780 720 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF105} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(flavor_setting) [set_flavor 1]; v60_calculate}

dui add dtext v60_brew 190 920 -text [translate "strength"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton v60_brew 486 870 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF104} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(strength_setting) [set_strength -1]; v60_calculate}
dui add variable v60_brew 680 920 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::skin(strength_setting)}
dui add dbutton v60_brew 780 870 \
    -bwidth 96 -bheight 96 \
    -labelvariable {\UF105} -label_font [skin_font icons 36] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(strength_setting) [set_strength 1]; v60_calculate}

dui add dtext v60_brew 190 1160 -text [translate "Presets"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center

dui add dbutton v60_brew 190 1200 \
    -bwidth 320 -bheight 96 \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {v60_fav_1; v60_calculate; v60_text_colour;}
set ::v60_text_one_cup [add_de1_variable "v60_brew" 350 1250 -justify center -anchor center -font [skin_font font 20] -fill $::skin_button_label_colour -textvariable {$::skin(v60_fav_1_name)}]
dui add dbutton v60_brew 190 1200 \
    -bwidth 320 -bheight 96 \
    -command {v60_fav_1; v60_calculate; v60_text_colour;}

dui add dbutton v60_brew 560 1200 \
    -bwidth 320 -bheight 96 \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {v60_fav_2; v60_calculate; v60_text_colour;}
set ::v60_text_two_cups [add_de1_variable "v60_brew" 720 1250 -justify center -anchor center -font [skin_font font 20] -fill $::skin_button_label_colour -textvariable {$::skin(v60_fav_2_name)}]
dui add dbutton v60_brew 560 1200 \
    -bwidth 320 -bheight 96 \
    -command {v60_fav_2; v60_calculate; v60_text_colour;}

dui add dbutton v60_brew 190 1400 \
    -bwidth 680 -bheight 96 \
    -labelvariable {[translate "save current recipe to a preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {page_show v60_fav_setup;}

dui add dbutton v60_fav_setup 600 370 \
    -bwidth 1600 -bheight 300 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add dbutton v60_fav_setup 600 750 \
    -bwidth 1600 -bheight 300 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add dtext v60_fav_setup 700 440 -text [translate "Preset button labels"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center
dui add dtext v60_fav_setup 700 824 -text [translate "Save recipe"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center
dui add dtext v60_fav_setup 700 584 -text [translate "left button"] -font [skin_font font 14] -fill $::skin_text_colour -anchor w -justify center
dui add dtext v60_fav_setup 1200 580 -text [translate "right button"] -font [skin_font font 14] -fill $::skin_text_colour -anchor w -justify center

dui add entry v60_fav_setup 700 500 -textvariable ::skin(v60_fav_1_name) -bg $::skin_button_label_colour -width 12 -font_size 15
dui add entry v60_fav_setup 1200 500 -textvariable ::skin(v60_fav_2_name) -bg $::skin_button_label_colour -width 12 -font_size 15

dui add dbutton v60_fav_setup 700 880 \
    -bwidth 440 -bheight 96 \
    -labelvariable {[translate "save to LEFT preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {v60_save_fav_1; page_show v60_brew;}

dui add dbutton v60_fav_setup 1200 880 \
    -bwidth 440 -bheight 96 \
    -labelvariable {[translate "save to RIGHT preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {v60_save_fav_2; page_show v60_brew;}

dui add dbutton v60_fav_setup 1700 880 \
    -bwidth 400 -bheight 96 \
    -labelvariable {[translate "Cancel"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {page_show v60_brew;}

dui add dbutton v60_fav_setup 80 1400 \
    -bwidth 400 -bheight 96 \
    -labelvariable {[translate "factory reset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {v60_reset; skin_save skin; v60_calculate; page_show v60_brew;}

v60_calculate
dui add variable "v60_brew v60_fav_setup" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {version ${::v60_brew_calulator_version} - By $::v60_brew_calulator_author}
