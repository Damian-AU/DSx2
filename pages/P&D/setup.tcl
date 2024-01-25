
proc hide_jug {option} {
    PD_set_button ${option}_edit state normal
    PD_set_button ${option}_x_button state hidden
    PD_set_button ${option}_tick_button state hidden
    PD_set_button ${option}_weight state hidden
}

proc show_jug {option} {
    foreach size {jug_s jug_m jug_l} {
        PD_set_button ${size}_edit state normal
        PD_set_button ${size}_x_button state hidden
        PD_set_button ${size}_tick_button state hidden
        PD_set_button ${size}_weight state hidden
    }
    PD_set_button ${option}_edit state hidden
    PD_set_button ${option}_x_button state normal
    PD_set_button ${option}_tick_button state normal
    PD_set_button ${option}_weight state normal

}

proc set_jug {j} {
    set ::skin(jug_size) $j
    set ::skin(jug_g) $::skin(jug_${j})
    PD_set_button wf_steam_jug_s icon_fill $::skin_button_label_colour
    PD_set_button wf_steam_jug_m icon_fill $::skin_button_label_colour
    PD_set_button wf_steam_jug_l icon_fill $::skin_button_label_colour
    PD_set_button wf_steam_jug_${j} icon_fill $::skin_selected_colour
    skin_save skin
}

proc PD_add_icon_label_button {button_name pages x y width height tvi tv command } {
    set ::${button_name}(pages) $pages
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour -tags bb_${button_name} -command {do_nothing}
    dui add shape rect $pages [expr $x + 100] $y [expr $x + 104] [expr $y + 100] -width 0 -fill $::skin_outline_colour -tags s_${button_name}
    dui add variable $pages [expr $x + 50] [expr $y + $height/2 - 2] -font [skin_font D-font [fixed_size 40]] -fill $::skin_button_label_colour -anchor center -tags li_${button_name} -textvariable $tvi
    dui add variable $pages [expr ($x + 44) + $width/2] [expr $y + $height/2 - 2] -width [expr $width - 10] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center -justify center -tags l_${button_name} -textvariable $tv
    dui add dbutton $pages $x $y -bwidth $width -bheight $height -tags b_${button_name} -command $command
}

proc PD_show_wf_espresso_info {} {
    dui item config PD_settings wf_espresso_info -initial_state normal -state normal
}

proc PD_hide_wf_espresso_info {} {
    dui item config PD_settings wf_espresso_info -initial_state hidden -state hidden
}

proc PD_auto_tare_button_colour {} {
    if {$::skin(auto_tare_negative_reading) == 1} {
        dui item config PD_settings PD_auto_tare_button_on* -initial_state normal -state normal
        dui item config PD_settings PD_auto_tare_button_off* -initial_state hidden -state hidden
    } else {
        dui item config PD_settings PD_auto_tare_button_on* -initial_state hidden -state hidden
        dui item config PD_settings PD_auto_tare_button_off* -initial_state normal -state normal
    }
}


############## left column

dui add dbutton PD_settings 40 40 \
    -bwidth 1050 -bheight 1100 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add canvas_item line PD_settings 100 172 1010 172 -fill $::skin_outline_colour -width 2

dui add dbutton PD_settings 40 1180 \
    -bwidth 1050 -bheight 380 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add canvas_item line PD_settings 100 1312 1010 1312 -fill $::skin_outline_colour -width 2


dui add dtext PD_settings 100 101 -text [translate "Calibrate steam timer by weight"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w


dui add dtext PD_settings 100 440 -tags wf_milk_weight_text_line_1 -width 380 -text [translate "1: Place the empty jug on the scale, tap the pencil next to the respective jug button to set the weight"] -font [skin_font font 15] -fill $::skin_button_label_colour -anchor w
dui add dtext PD_settings 100 780 -tags wf_milk_weight_text_line_2 -width 380 -text [translate "2: Place the jug with milk on the scale, tap the milk jug button to set the weight"] -font [skin_font font 15] -fill $::skin_button_label_colour -anchor w
dui add dtext PD_settings 100 1030 -tags wf_milk_weight_text_line_3 -width 380 -text [translate "3: Steam the milk to your prefered temperature, enter the time it took"] -font [skin_font font 15] -fill $::skin_button_label_colour -anchor w






dui add dtext PD_settings 840 220 -text [translate "Jug size"] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center

PD_add_icon_label_button wf_steam_jug_s PD_settings 710 280 280 100 {$::skin(icon_jug)} {small} {set_jug s}
PD_set_button wf_steam_jug_s font [skin_font font [fixed_size 18]]
add_icon_button jug_s_edit PD_settings 610 280 100 100 {$::skin(icon_edit)} {show_jug jug_s}
PD_set_button jug_s_edit font [skin_font awesome_light [fixed_size 26]]
add_colour_button jug_s_weight PD_settings 710 280 280 100 {current $::skin(jug_s)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
PD_set_button jug_s_weight font [skin_font font 16]
PD_set_button jug_s_weight state hidden
add_icon_button jug_s_x_button PD_settings 610 280 100 100 {$::skin(icon_x)} {hide_jug jug_s}
PD_set_button jug_s_x_button label_fill $::skin_red
PD_set_button jug_s_x_button state hidden
add_icon_button jug_s_tick_button PD_settings 510 280 100 100 {$::skin(icon_tick)} {skin_save jug_s}
PD_set_button jug_s_tick_button label_fill $::skin_green
PD_set_button jug_s_tick_button state hidden


PD_add_icon_label_button wf_steam_jug_m PD_settings 710 390 280 100 {$::skin(icon_jug)} {medium} {set_jug m}
PD_set_button wf_steam_jug_m font [skin_font font [fixed_size 18]]
add_icon_button jug_m_edit PD_settings 610 390 100 100 {$::skin(icon_edit)} {show_jug jug_m}
PD_set_button jug_m_edit font [skin_font awesome_light [fixed_size 26]]
add_colour_button jug_m_weight PD_settings 710 390 280 100 {current $::skin(jug_m)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
PD_set_button jug_m_weight font [skin_font font 16]
PD_set_button jug_m_weight state hidden
add_icon_button jug_m_x_button PD_settings 610 390 100 100 {$::skin(icon_x)} {hide_jug jug_m}
PD_set_button jug_m_x_button label_fill $::skin_red
PD_set_button jug_m_x_button state hidden
add_icon_button jug_m_tick_button PD_settings 510 390 100 100 {$::skin(icon_tick)} {skin_save jug_m}
PD_set_button jug_m_tick_button label_fill $::skin_green
PD_set_button jug_m_tick_button state hidden

PD_add_icon_label_button wf_steam_jug_l PD_settings 710 510 280 100 {$::skin(icon_jug)} {large} {set_jug l}
PD_set_button wf_steam_jug_l font [skin_font font [fixed_size 18]]
add_icon_button jug_l_edit PD_settings 610 510 100 100 {$::skin(icon_edit)} {show_jug jug_l}
PD_set_button jug_l_edit font [skin_font awesome_light [fixed_size 26]]
add_colour_button jug_l_weight PD_settings 710 510 280 100 {current $::skin(jug_l)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
PD_set_button jug_l_weight font [skin_font font 16]
PD_set_button jug_l_weight state hidden
add_icon_button jug_l_x_button PD_settings 610 510 100 100 {$::skin(icon_x)} {hide_jug jug_l}
PD_set_button jug_l_x_button label_fill $::skin_red
PD_set_button jug_l_x_button state hidden
add_icon_button jug_l_tick_button PD_settings 510 510 100 100 {$::skin(icon_tick)} {skin_save jug_l}
PD_set_button jug_l_tick_button label_fill $::skin_green
PD_set_button jug_l_tick_button state hidden




dui add dtext PD_settings 840 700 -text [translate "Milk jug"] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center
PD_add_icon_label_button wf_steam_jug_milk PD_settings 710 740 280 100 {$::skin(icon_milk)} {[round_to_integer $::skin(milk_g)]g} {set ::skin(milk_g) [round_to_integer [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]] }



dui add variable PD_settings 840 960 -fill $::skin_text_colour  -font [skin_font font 18] -tags wf_last_steam_time -anchor center -textvariable {[translate "last steam"] [steam_pour_timer]s}

dui add dbutton PD_settings 600 1000 \
    -bwidth 96 -bheight 96 -tags PD_steam_minus \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) - 1]]; if {$::skin(milk_s) < 5} {set ::skin(milk_s) 5}}

PD_add_icon_label_button wf_steam_jug_time PD_settings 700 1000 280 100 {$::skin(icon_timer)} {[round_to_integer $::skin(milk_s)]s} {set ::skin(milk_s) [steam_pour_timer]}; PD_set_button wf_steam_jug_time icon_font [skin_font awesome_light 30]

dui add dbutton PD_settings 975 1000 \
    -bwidth 96 -bheight 96 -tags PD_steam_plus \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) + 1]]; if {$::skin(milk_s) > 120} {set ::skin(milk_s) 120}}




#### Dose cup


dui add shape rect PD_settings 120 560 1680 960 -width 1 -outline $::skin_forground_colour -fill $::skin_background_colour -tags {wf_espresso_info_bg wf_espresso_info} -initial_state hidden
dui add dbutton PD_settings 120 560 \
    -bwidth 1560 -bheight 400 -tags {PD_info_cup_bg wf_espresso_info} -initial_state hidden \
    -shape round_outline -width 2 -arc_offset 20 -outline $::skin_outline_colour -fill $::skin_forground_colour \
    -command {PD_hide_wf_espresso_info}

dui add canvas_item line PD_settings 180 680 1620 680 -fill $::skin_outline_colour -width 2 -tags {wf_espresso_info_line wf_espresso_info} -initial_state hidden

dui add dtext PD_settings 180 620 -tags {wf_dose_cup_text_line_4 wf_espresso_info} -width 1400 -text [translate "Dose cup info"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext PD_settings 1640 620 -tags {wf_dose_cup_info_x wf_espresso_info} -width 1400 -text $::skin(icon_x) -font [skin_font awesome_light 30] -fill $::skin_button_label_colour -anchor e -initial_state hidden


dui add dtext PD_settings 180 750 -tags {wf_dose_cup_text_line_1 wf_espresso_info} -width 1400 -text [translate "If you prefer to tare without the dose cup, set a dose cup weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext PD_settings 180 810 -tags {wf_dose_cup_text_line_2 wf_espresso_info} -text [translate "If you prefer to tare with the dose cup, set the dose cup weight to 0.0"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext PD_settings 180 870 -tags {wf_dose_cup_text_line_3 wf_espresso_info} -text [translate "Tap the dose cup button to set it to the current scale weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden


dui add dbutton PD_settings 120 560 \
    -bwidth 1560 -bheight 400 -tags {PD_info_close_button wf_espresso_info} -initial_state hidden \
    -command {PD_hide_wf_espresso_info}


dui add dtext PD_settings 100 1244 -text [translate "Set dose cup weight"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w

dui add dtext PD_settings 100 1470 -text [translate "Tap here for more info"] -font [skin_font font 15] -fill $::skin_button_label_colour -anchor w

add_icon_button wf_info_button PD_settings 600 1420 100 100 {} {}
PD_set_button wf_info_button font [skin_font awesome_light 28]
dui add dtext PD_settings 840 1380 -tags wf_heading_bean_cup -text [translate "Dose cup"] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center

dui add dbutton PD_settings 100 1370 \
    -bwidth 420 -bheight 200 \
    -labelvariable {$::skin(icon_info)} -label_font [skin_font awesome_light 26] -label_fill $::skin_button_label_colour -label_pos {0.9 0.5} \
    -command {PD_show_wf_espresso_info}


dui add dbutton PD_settings 710 1420 \
    -bwidth 280 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {$::skin(bean_cup_g)g} -label_font [skin_font font 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set_bean_cup_weight}

################## middle culumn

dui add dbutton PD_settings 1130 40 \
    -bwidth 460 -bheight 1160 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add dtext PD_settings 1190 101 -text [translate "Settings"] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor w
dui add canvas_item line PD_settings 1190 172 1530 172 -fill $::skin_outline_colour -width 2

dui add dtext PD_settings 1360 220 -text [translate "Colour theme"] -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center
dui add dbutton PD_settings 1190 280 \
    -bwidth 340 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {$::skin(colour_theme)} -label_font [skin_font font_bold 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {skin_colour_theme_selection}


dui add canvas_item line PD_settings 1190 432 1530 432 -fill $::skin_outline_colour -width 2
dui add dtext PD_settings 1360 480 -text "[translate "Auto tare"]   -0.0g" -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center

dui add dbutton PD_settings 1190 540 \
    -bwidth 340 -bheight 100 -tags PD_auto_tare_button_off \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "off"]} -label_font [skin_font font_bold 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {toggle_auto_tare; PD_auto_tare_button_colour}

dui add dbutton PD_settings 1190 540 \
    -bwidth 340 -bheight 100 -tags PD_auto_tare_button_on -initial_state hidden \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_selected_colour \
    -labelvariable {[translate "on"]} -label_font [skin_font font_bold 16] -label_fill $::skin_selected_colour -label_pos {0.5 0.5} \
    -command {toggle_auto_tare; PD_auto_tare_button_colour}

PD_auto_tare_button_colour

dui add canvas_item line PD_settings 1190 692 1530 692 -fill $::skin_outline_colour -width 2
dui add dtext PD_settings 1360 740 -text "[translate "Water offset"]" -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center


dui add variable PD_settings 1360 850 -fill $::skin_text_colour  -font [skin_font font 18] -tags skin_button_label_colour -anchor center -textvariable {[skin_water_offset]}

dui add dbutton PD_settings 1190 800 \
    -bwidth 100 -bheight 100 \
    -labelvariable {$::pulak_icon_m} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust wsaw_offset -1}
dui add dbutton PD_settings 1430 800 \
    -bwidth 100 -bheight 100 \
    -labelvariable {$::pulak_icon_p} -label_font [skin_font icomoon 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -command {adjust wsaw_offset 1}

dui add canvas_item line PD_settings 1190 952 1530 952 -fill $::skin_outline_colour -width 2
dui add dtext PD_settings 1360 1000 -text "[translate "Skin style"]" -font [skin_font font_bold 18] -fill $::skin_button_label_colour -anchor center


dui add dbutton PD_settings 1190 1060 \
    -bwidth 340 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour \
    -labelvariable {[translate "Original DSx2"]} -label_font [skin_font font_bold 16] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {set ::skin(theme) "Damian"; skin_save skin; after 500 skin_exit}



dui add dbutton PD_settings 2200 1420 \
    -bwidth 260 -bheight 100 \
    -shape outline -width 2 -arc_offset 20 -outline $::skin_outline_colour_2 \
    -labelvariable {[translate "exit"]} -label_font [skin_font font 16] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set_next_page off off; page_show off}

