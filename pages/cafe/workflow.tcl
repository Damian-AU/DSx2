if {![info exist ::skin(wf_grind_show)]} {
    set ::skin(wf_grind_show) 0
}
proc config_workflow_grinder {} {
    if {$::skin(wf_grind_show) == 0} {
        dui item config workflow_settings grind_info -fill $::skin_disabled_colour
        dui item config workflow_settings grind_buttons -initial_state hidden -state hidden
    } else {
        dui item config workflow_settings grind_info -fill $::skin_text_colour
        dui item config workflow_settings grind_buttons -initial_state normal -state normal
    }
}

dui add shape rect workflow_settings 0 150 2560 152 -width 0 -fill $::skin_foreground_colour
dui add shape rect workflow_settings 0 1400 2560 1402 -width 0 -fill $::skin_foreground_colour
dui add shape rect workflow_settings 620 150 622 1400 -width 0 -fill $::skin_foreground_colour
dui add shape rect workflow_settings 1280 150 1282 1400 -width 0 -fill $::skin_foreground_colour
dui add shape rect workflow_settings 1920 150 1922 1400 -width 0 -fill $::skin_foreground_colour

dui add dtext workflow_settings 1280 40 -text [translate "workflow setup"] -font [skin_font font_bold 22] -fill $::skin_text_colour -anchor center
dui add dtext workflow_settings 320 120 -text [translate "coffee"] -font [skin_font font 22] -fill $::skin_text_colour -anchor center
dui add dtext workflow_settings 960 120 -text [translate "flush"] -font [skin_font font 22] -fill $::skin_text_colour -anchor center
dui add dtext workflow_settings 1600 120 -text [translate "steam"] -font [skin_font font 22] -fill $::skin_text_colour -anchor center
dui add dtext workflow_settings 2240 120 -text [translate "water"] -font [skin_font font 22] -fill $::skin_text_colour -anchor center


dui add dbutton "workflow_settings" 1180 1440 \
    -bwidth 200 -bheight 100 -tags skin_wfs_exit_button -initial_state normal \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {EXIT} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {page_show off}

dui add dtext workflow_settings 60 200 -text [translate "Profile"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 260 150 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::settings(profile_title)} -label_width 420 -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {goto_profile_list} -longpress_cmd {goto_profile_wizard}

dui add dtext workflow_settings 60 300 -text [translate "Type"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 260 250 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::settings(beverage_type)} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {c_goto_profile_type}


dui add dtext workflow_settings 60 400 -text [translate "Beans"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 430 400 -fill $::skin_text_colour  -font [skin_font font 18] -anchor center -textvariable {[round_to_one_digits $::settings(grinder_dose_weight)]g}

dui add dbutton workflow_settings 260 350 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust dose -0.1} -longpress_cmd {adjust dose -1}
dui add dbutton workflow_settings 500 350 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust dose 0.1} -longpress_cmd {adjust dose 1}


dui add dtext workflow_settings 60 500 -text {SAW} -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 430 482 -fill $::skin_text_colour  -font [skin_font font 18] -anchor center -textvariable {[skin_saw]g}
dui add variable workflow_settings 430 522 -fill $::skin_text_colour  -font [skin_font font 16] -anchor center -textvariable {[skin_extraction_ratio]}


add_icon_button wf_save_saw_x_button workflow_settings 660 450 100 100 $::skin(icon_x) {wf_cancel_profile_saw}
set_button wf_save_saw_x_button label_fill $::skin_red
set_button wf_save_saw_x_button state hidden

add_icon_button wf_save_saw_tick_button workflow_settings 780 450 100 100 $::skin(icon_tick) {wf_update_profile_saw}
set_button wf_save_saw_tick_button label_fill $::skin_green
set_button wf_save_saw_tick_button state hidden

dui add dtext workflow_settings 60 600 -text [translate "Grinder"] -font [skin_font font_bold 18] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -tags {grinder_heading grind_info}
dui add variable workflow_settings 430 600 -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -font [skin_font font 18] -tags {grinder_value grind_info} -anchor center -textvariable {[round_to_one_digits $::settings(grinder_setting)]}
dui add dbutton workflow_settings 260 550 \
    -bwidth 100 -bheight 100 -tags {grind_minus grind_buttons}\
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust grind -0.1} -longpress_cmd {adjust grind -1}
dui add dbutton workflow_settings 500 550 \
    -bwidth 100 -bheight 100 -tags {grind_plus grind_buttons} \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust grind 0.1} -longpress_cmd {adjust grind 1}
dui add dbutton workflow_settings 0 550 \
    -bwidth 260 -bheight 100 \
    -command {set ::skin(wf_grind_show) [expr !{$::skin(wf_grind_show)}]; config_workflow_grinder; skin_save skin}

dui add dbutton workflow_settings 260 450 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust saw -1} -longpress_cmd {adjust saw -10}
dui add dbutton workflow_settings 500 450 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust saw 1} -longpress_cmd {adjust saw 10}

dui add dtext workflow_settings 60 700 -text [translate "Dose cup"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtext workflow_settings 40 700 -text $::skin(icon_info) -font [skin_font awesome 18] -fill $::skin_orange -anchor e
dui add dbutton workflow_settings 0 650 \
    -bwidth 260 -bheight 100 \
    -command {dui item config workflow_settings c_espresso_info -initial_state normal -state normal}

dui add dbutton workflow_settings 260 650 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::skin(bean_cup_g)g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set_bean_cup_weight}

dui add dbutton workflow_settings 260 650 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::skin(bean_cup_g)g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set_bean_cup_weight}

##### flush

dui add dtext workflow_settings 680 200 -text [translate "Flow rate"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 1070 200 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[round_to_one_digits $::settings(flush_flow)][translate "ml/s"]}

dui add dbutton workflow_settings 920 150 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust flush_flow -0.1} -longpress_cmd {adjust flush_flow -1}
dui add dbutton workflow_settings 1160 150 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust flush_flow 0.1} -longpress_cmd {adjust flush_flow 1}

dui add dtext workflow_settings 680 300 -text [translate "Flush timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 1090 300 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[round_to_integer $::settings(flush_seconds)]s}

dui add dbutton workflow_settings 920 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust flush -1} -longpress_cmd {adjust flush -10}
dui add dbutton workflow_settings 1160 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust flush 1} -longpress_cmd {adjust flush 10}


##### Steam

dui add dtext workflow_settings 1340 200 -text [translate "Steam heater"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtoggle workflow_settings 1750 200 -anchor center \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::de1(steam_disable_toggle) \
    -command {c_toggle_steam_heater}

dui add dtext workflow_settings 1340 300 -text [translate "Steam timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 1750 300 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[round_to_integer $::settings(steam_timeout)]s}

dui add dbutton workflow_settings 1580 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust steam -1} -longpress_cmd {adjust steam -10}
dui add dbutton workflow_settings 1820 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust steam 1} -longpress_cmd {adjust steam 10}

dui add dtext workflow_settings 1340 400 -text [translate "Milk Jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 350 \
    -bwidth 340 -bheight 100 \
    -labelvariable {[c_jug_size_data]} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {c_jug_toggle} -longpress_cmd {}

dui add dtext workflow_settings 1340 670 -text [translate "Milk jugs setup"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w

dui add dtext workflow_settings 1340 770 -text [translate "Small Jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 720 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::skin(jug_s)g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {popup [translate "Longpress to set Small jug weight from the current scale weight"]} -longpress_cmd {set ::skin(jug_s) [round_to_one_digits $::de1(scale_sensor_weight)]; skin_save skin}
#set ::de1(scale_sensor_weight) 360

dui add dtext workflow_settings 1340 870 -text [translate "Medium Jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 820 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::skin(jug_m)g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {popup [translate "Longpress to set Medium jug weight from the current scale weight"]} -longpress_cmd {set ::skin(jug_m) [round_to_one_digits $::de1(scale_sensor_weight)]; skin_save skin}


dui add dtext workflow_settings 1340 970 -text [translate "Large Jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 920 \
    -bwidth 340 -bheight 100 \
    -labelvariable {$::skin(jug_l)g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {popup [translate "Longpress to set Large jug weight from the current scale weight"]} -longpress_cmd {set ::skin(jug_l) [round_to_one_digits $::de1(scale_sensor_weight)]; skin_save skin}

dui add dtext workflow_settings 1340 1140 -text [translate "Steam by weight setup"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtext workflow_settings 1340 1240 -text [translate "Milk weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 1190 \
    -bwidth 340 -bheight 100 \
    -labelvariable {[round_to_integer $::skin(milk_g)]g} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {popup [translate "Longpress to set Milk weight from the current scale milk nett weight"]} -longpress_cmd {set ::skin(milk_g) [round_to_integer [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]]; skin_save skin}

dui add dtext workflow_settings 1340 1340 -text [translate "Steam time"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dbutton workflow_settings 1580 1290 \
    -bwidth 340 -bheight 100 \
    -labelvariable {[round_to_integer $::skin(milk_s)]s} -label_font [skin_font font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {popup [translate "Longpress to set Steam time to the previous steaming time"]} -longpress_cmd {set ::skin(milk_s) [steam_pour_timer]; skin_save skin}

dui add dbutton workflow_settings 1580 1290 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) - 1]]; if {$::skin(milk_s) < 5} {set ::skin(milk_s) 5}; skin_save skin} -longpress_cmd {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) - 10]]; if {$::skin(milk_s) < 5} {set ::skin(milk_s) 5}; skin_save skin}
dui add dbutton workflow_settings 1820 1290 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) + 1]]; if {$::skin(milk_s) > 120} {set ::skin(milk_s) 120}; skin_save skin} -longpress_cmd {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) + 10]]; if {$::skin(milk_s) > 120} {set ::skin(milk_s) 120}; skin_save skin}

dui add dtext workflow_settings 1320 1140 -text $::skin(icon_info) -font [skin_font awesome 18] -fill $::skin_orange -anchor e
dui add dbutton workflow_settings 1280 1090 \
    -bwidth 260 -bheight 100 \
    -command {dui item config workflow_settings c_cal_info -initial_state normal -state normal}


##### water

dui add dtext workflow_settings 1960 200 -text [translate "Flow rate"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 2370 200 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[round_to_one_digits $::settings(hotwater_flow)][translate "ml/s"]}

dui add dbutton workflow_settings 2200 150 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_flow -0.1} -longpress_cmd {adjust water_flow -1}
dui add dbutton workflow_settings 2440 150 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_flow 0.1} -longpress_cmd {adjust water_flow 1}

dui add dtext workflow_settings 1960 300 -text [translate "Temperature"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 2370 300 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[skin_temperature_measurement $::settings(water_temperature)]}

dui add dbutton workflow_settings 2200 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_temperature -1} -longpress_cmd {adjust water_temperature -10}
dui add dbutton workflow_settings 2440 250 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_temperature 1} -longpress_cmd {adjust water_temperature 10}

dui add dtext workflow_settings 1960 400 -text [translate "Volume"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 2370 400 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[skin_water_volume]}

dui add dbutton workflow_settings 2200 350 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_volume -1} -longpress_cmd {adjust water_volume -10}
dui add dbutton workflow_settings 2440 350 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust water_volume 1} -longpress_cmd {adjust water_volume 10}

dui add dtext workflow_settings 1960 500 -text [translate "Vol. offset"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable workflow_settings 2370 500 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {[skin_water_offset]}


dui add dbutton "workflow_settings" 2280 1440 \
    -bwidth 200 -bheight 100 \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {scale_tare; catch {ble_connect_to_scale}}

dui add dbutton workflow_settings 2200 450 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust wsaw_offset 1}
dui add dbutton workflow_settings 2440 450 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust wsaw_offset -1}

### message
dui add dbutton workflow_settings 480 350 \
    -bwidth 1600 -bheight 360 -tags {c_espresso_info_bg c_espresso_info c_cal_info c_workflow_info} -initial_state hidden \
    -shape round -width 2 -fill $::skin_foreground_colour \
    -command {do_nothing}
dui add dtext workflow_settings 560 480 -tags {c_dose_cup_text_line_1 c_espresso_info} -width 1400 -text [translate "If you prefer to tare without the dose cup, set a dose cup weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 540 -tags {c_dose_cup_text_line_2 c_espresso_info} -text [translate "If you prefer to tare with the dose cup, set the dose cup weight to 0.0"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 600 -tags {c_dose_cup_text_line_3 c_espresso_info} -text [translate "Tap the dose cup weight to set it to the current scale weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 1280 380 -tags {c_dose_cup_text_line_4 c_espresso_info} -width 1400 -text [translate "tap window to close"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor center -initial_state hidden
dui add dbutton workflow_settings 0 0 -bwidth 2560 -bheight 1600 -initial_state hidden -tags {hide_c_espresso_info c_espresso_info} -command {dui item config workflow_settings c_espresso_info -initial_state hidden -state hidden}

dui add dtext workflow_settings 560 480 -tags {c_milk_weight_text_line_1 c_cal_info} -width 1400 -text [translate "1: Place the empty jug on the scale, tap the pencil next to the respective jug button to set the weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 540 -tags {c_milk_weight_text_line_2 c_cal_info} -text [translate "2: Place the jug with milk on the scale, tap the milk jug button to set the weight"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 600 -tags {c_milk_weight_text_line_3 c_cal_info} -text [translate "3: Steam the milk to your prefered temperature, enter the time it took"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 1280 380 -tags {c_milk_weight_text_line_4 c_cal_info} -width 1400 -text [translate "tap window to close"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor center -initial_state hidden
dui add dbutton workflow_settings 0 0 -bwidth 2560 -bheight 1600 -initial_state hidden -tags {hide_c_milk_weight_info c_cal_info} -command {dui item config workflow_settings c_cal_info -initial_state hidden -state hidden}

dui add dtext workflow_settings 560 480 -tags {c_workflow_text_line_1 c_workflow_info} -width 1400 -text [translate "Tap the machine function data below to toggle through the diffent layouts"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 540 -tags {c_workflow_text_line_2 c_workflow_info} -text [translate ""] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 560 600 -tags {c_workflow_text_line_3 c_workflow_info} -text [translate ""] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor w -initial_state hidden
dui add dtext workflow_settings 1280 380 -tags {c_workflow_text_line_4 c_workflow_info} -width 1400 -text [translate "tap window to close"] -font [skin_font font 18] -fill $::skin_button_label_colour -anchor center -initial_state hidden
dui add dbutton workflow_settings 0 0 -bwidth 2560 -bheight 1600 -initial_state hidden -tags {hide_c_workflow_info c_workflow_info} -command {dui item config workflow_settings c_workflow_info -initial_state hidden -state hidden}

####### workflow button order
dui add dtext workflow_settings [expr 40 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 - 100 + $::wf_start_button_shift] -text $::skin(icon_info) -font [skin_font awesome 18] -fill $::skin_orange -anchor e
dui add dbutton workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 - 150 + $::wf_start_button_shift] \
    -bwidth 260 -bheight 100 \
    -command {dui item config workflow_settings c_workflow_info -initial_state normal -state normal}

dui add dtext workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 - 100 + $::wf_start_button_shift] -text [translate "workflow type"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w

dui add shape round workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 - 60 + $::wf_start_button_shift] -bwidth 460 -bheight 40 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour
dui add variable workflow_settings [expr 290 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 - 40 + $::wf_start_button_shift] -font [skin_font font 16] -fill $::skin_text_colour -anchor c -textvariable {[workflow_type_text]}

dui add shape round workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 + $::wf_start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {wf_espresso_button_bg espresso_start_buttons start_buttons_eg1}
dui add shape round workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_2 + $::wf_start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {wf_flush_button_bg flush_start_buttons start_buttons_fg1}
dui add shape round workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_3 + $::wf_start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {wf_steam_button_bg team_start_buttons start_buttons_sg1}
dui add shape round workflow_settings [expr 60 + $::wf_start_button_shift_x] [expr $::start_button_pos_4 + $::wf_start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {wf_water_button_bg water_start_buttons start_buttons_wg1}

dui add variable workflow_settings [expr 80 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_espresso)} -tags {wf_espresso_button_icon espresso_start_buttons start_buttons_eg2}
dui add variable workflow_settings [expr 80 + $::wf_start_button_shift_x] [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_flush)} -tags {wf_flush_button_icon flush_start_buttons start_buttons_fg2}
dui add variable workflow_settings [expr 80 + $::wf_start_button_shift_x] [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_steam)} -tags {wf_steam_button_icon steam_start_buttons start_buttons_sg2}
dui add variable workflow_settings [expr 80 + $::wf_start_button_shift_x] [expr $::start_button_pos_4 + 50 + $::wf_start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_water)} -tags {wf_water_button_icon water_start_buttons start_buttons_wg2}

dui add variable workflow_settings [expr 180 + $::wf_start_button_shift_x] [expr $::start_button_pos_1 + 50 + $::wf_start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -anchor w -justify left -tags {wf_espresso_button_variable espresso_start_buttons start_buttons_eg2} -width 340 -textvariable {[maxstring $::settings(profile_title) 28]\r[skin_dose] [translate " : "] [skin_saw]g [skin_extraction_ratio]}
dui add variable workflow_settings [expr 180 + $::wf_start_button_shift_x] [expr $::start_button_pos_2 + 50 + $::wf_start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -anchor w -justify left -tags {wf_flush_button_variable flush_start_buttons start_buttons_fg2} -width 340 -textvariable {[round_to_integer $::settings(flush_seconds)]s}
dui add variable workflow_settings [expr 180 + $::wf_start_button_shift_x] [expr $::start_button_pos_3 + 50 + $::wf_start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -anchor w -justify left -tags {wf_steam_button_variable steam_start_buttons start_buttons_sg2} -width 340 -textvariable {[skin_steam_settings_info]   $::skin(jug_size)\r[skin_steam_text $::settings(steam_timeout)]}
dui add variable workflow_settings [expr 180 + $::wf_start_button_shift_x] [expr $::start_button_pos_4 + 50 + $::wf_start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -anchor w -justify left -tags {wf_water_button_variable water_start_buttons start_buttons_wg2} -width 340 -textvariable {[skin_water_settings_info]}

dui add dbutton workflow_settings [expr 40 + $::wf_start_button_shift_x] [expr 280 + $::wf_start_button_shift] \
    -bwidth 500 -bheight 530 -tags {wf_espresso_button start_buttons} -initial_state normal \
    -command {toggle_c_workflow_type}




###########################################################
skin_load $::skin(auto_load_fav)
workflow $::skin(workflow)

# ::register_state_change_handler Sleep Idle skin_load_fav
#after 3000 dui item config steam bb_steam_extend* -initial_state hidden -state hidden



