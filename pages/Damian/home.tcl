set ::skin_heading DSx2

## settings
add_colour_button edit_heading_button off 100 620 340 100 {[translate "toggle heading"]} {toggle_heading}; set_button edit_heading_button state hidden

add_de1_widget "off" entry 450 -1001 {
	set ::globals(edit_heading_button) $widget
	bind $widget <Return> {set ::skin(heading) $::skin_heading; hide_android_keyboard}
	bind $widget <Leave>  {set ::skin(heading) $::skin_heading; hide_android_keyboard}
    } -width 32 -font [skin_font font [fixed_size 16]] -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags heading_entry -textvariable ::skin_heading

add_colour_button edit_colour_theme_button off 100 750 340 100 {[translate "colour theme"]\r$::skin(colour_theme)} {skin_colour_theme_selection}; set_button edit_colour_theme_button state hidden
add_colour_variable_button edit_icon_size_button off 100 880 340 100 {$::icon_size_state [translate "icon"]\r[translate "calibration"]} {toggle_icon_size_settings}; set_button edit_icon_size_button state hidden
set ::skin_flow_cal_ui_added 0
add_colour_button edit_flow_rate_cal_button off 100 1010 340 100 {[translate "flow rate"]\r[translate "calibrator"]} {page_show GFC}; set_button edit_flow_rate_cal_button state hidden
add_colour_button edit_theme_button off 100 1140 340 100 {[translate "switch to"]\r[translate "cafe theme"]} {set ::skin(theme) "cafe"; skin_save skin; page_show restart_message}; set_button edit_theme_button state hidden
add_colour_button exit_heading_settings off 100 1330 260 100 {[translate "close"]} {hide_header_settings; show_graph; skin_save skin}; set_button exit_heading_settings state hidden
dui add variable off 200 540 -fill $::skin_selected_colour -font [skin_font font_bold 24] -anchor w -textvariable {$::skin_initial_setup}
dui add dbutton off 470 760 -bwidth 660 -bheight 560 -tags {icon_size_outline icon_size_set} -shape outline -width 2 -outline $::skin_selected_colour -initial_state hidden -command {do_nothing}
dui add dtext off 800 880 -tags {heading_icon_size icon_size_set} -text [translate "Adjust so the star tips touch the square"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center -justify center -initial_state hidden
add_colour_button icon_size_minus off 640 940 100 100 {\Uf106} {adjust_icon_size_up}; set_button icon_size_minus font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_minus state hidden
add_colour_button icon_size_plus_x10 off 520 1140 100 100 {\Uf107} {adjust_icon_size_down_x10}; set_button icon_size_plus_x10 font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_plus_x10 state hidden
add_colour_button icon_size_minus_x10 off 520 940 100 100 {\Uf106} {adjust_icon_size_up_x10}; set_button icon_size_minus_x10 font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_minus_x10 state hidden
add_colour_button icon_size_plus off 640 1140 100 100 {\Uf107} {adjust_icon_size_down}; set_button icon_size_plus font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_plus state hidden
dui add variable off 630 1090 -fill $::skin_text_colour -font [skin_font font_bold 22] -tags {icon_size_value icon_size_set} -anchor center -initial_state hidden -textvariable {$::skin(icon_factor)}
dui add shape rect off 794 960 1066 1220 -width 2 -outline $::skin_text_colour -fill $::skin_background_colour -tags {icon_size_shape icon_size_set} -initial_state hidden
dui add variable off 930 1090 -font [skin_font awesome_light [fixed_size 130]] -fill $::skin_text_colour -anchor center -initial_state hidden -tags {skin_icon_size_test icon_size_set} -textvariable {$::skin(icon_fav)}

dui add dtext off 540 756 -tags {toggle_history_text settings_toggles} -text [translate "show history button"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor nw -initial_state hidden
dui add dtoggle off 920 750 -anchor nw -tags {toggle_history_button settings_toggles} \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -initial_state hidden \
    -variable ::skin(show_history_button) \
    -command {if {$::skin(show_history_button) == 0} {
            dui item config off skin_history_button* -initial_state hidden -state hidden
        } else {
            dui item config off skin_history_button* -initial_state normal -state normal
        }
    }

dui add dtext off 540 856 -tags {toggle_weight_text settings_toggles} -text [translate "show weight curves"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor nw -initial_state hidden
dui add dtoggle off 920 850 -anchor nw -tags {toggle_weight_button settings_toggles} \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -initial_state hidden \
    -variable ::skin(show_weight_chartable) \
    -command {if {$::skin(show_weight_chartable) == 0} {
            $::home_espresso_graph element configure home_weight_chartable -hide 1
            $::home_espresso_graph element configure compare_weight_chartable -hide 1
        } else {
            $::home_espresso_graph element configure home_weight_chartable -hide 0
            $::home_espresso_graph element configure compare_weight_chartable -hide 0
        }
    }

dui add dtext off 540 956 -tags {toggle_data_card_text settings_toggles} -text [translate "show espresso data button"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor nw -initial_state hidden
dui add dtoggle off 920 950 -anchor nw -tags {toggle_data_card_button settings_toggles} \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -initial_state hidden \
    -variable ::skin(show_data_card_button) \
    -command {if {$::skin(show_data_card_button) == 0} {
            dui item config off data_card_button* -initial_state hidden -state hidden
        } else {
            dui item config off data_card_button* -initial_state normal -state normal
        }
    }

#####################
### fav
####
add_icon_label_button fav1 $::skin_home_pages $::skin(button_x_fav) $::start_button_y 360 100 $::skin(icon_fav) {$::fav_label_fav1} {skin_load fav1}; set_button fav1 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav2 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 120] 360 100 $::skin(icon_fav) {$::fav_label_fav2} {skin_load fav2}; set_button fav2 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav3 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 240] 360 100 $::skin(icon_fav) {$::fav_label_fav3} {skin_load fav3}; set_button fav3 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav4 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 360] 360 100 $::skin(icon_fav) {$::fav_label_fav4} {skin_load fav4}; set_button fav4 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav5 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 480] 360 100 $::skin(icon_fav) {$::fav_label_fav5} {skin_load fav5}; set_button fav5 icon_font [skin_font awesome_light [fixed_size 28]]

add_icon_button fav1_edit $::skin_home_pages 1990 $::start_button_y 100 100 $::skin(icon_edit) {edit fav1} fav_edit_buttons
add_icon_button fav2_edit $::skin_home_pages 1990 [expr $::start_button_y + 120] 100 100 $::skin(icon_edit) {edit fav2} fav_edit_buttons
add_icon_button fav3_edit $::skin_home_pages 1990 [expr $::start_button_y + 240] 100 100 $::skin(icon_edit) {edit fav3} fav_edit_buttons
add_icon_button fav4_edit $::skin_home_pages 1990 [expr $::start_button_y + 360] 100 100 $::skin(icon_edit) {edit fav4} fav_edit_buttons
add_icon_button fav5_edit $::skin_home_pages 1990 [expr $::start_button_y + 480] 100 100 $::skin(icon_edit) {edit fav5} fav_edit_buttons
set_button fav1_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav2_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav3_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav4_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav5_edit font [skin_font awesome_light [fixed_size 28]]

set_favs_showing

### machine
dui add variable $::skin_home_pages 2410 [expr $::skin(button_y_machine) + 92] -font [skin_font D-font [fixed_size 264]] -fill $::skin_foreground_colour -tags decent_icon -anchor e -textvariable {D}
dui add variable $::skin_home_pages 2330 [expr $::skin(button_y_machine) - 36] -font [skin_font font 15] -fill $::skin_button_label_colour  -anchor w -textvariable {[skin_group_head_heater_temperature_text]}
dui add variable $::skin_home_pages 2426 [expr $::skin(button_y_machine) + 60] -font [skin_font font 15] -fill $::skin_text_colour  -anchor w -textvariable {[skin_steamtemp_text]}
dui add variable $::skin_home_pages 2090 [expr $::skin(button_y_machine) + 188] -font [skin_font font 15] -fill $::skin_button_label_colour  -anchor w -textvariable {[skin_low_water]}

dui add variable espresso 2362 [expr $::skin(button_y_machine) - 30] -font [skin_font D-font [fixed_size 52]] -fill $::skin_brown -anchor n -tags espresso_pour -textvariable {e}
dui add variable "espresso water" 2370 [expr $::skin(button_y_machine) + 8] -font [skin_font D-font [fixed_size 52]] -fill $::skin_blue -anchor n -tags ewc -textvariable {c}
dui add variable flush 2362 [expr $::skin(button_y_machine) - 48] -font [skin_font D-font [fixed_size 52]] -fill $::skin_blue -anchor n -tags flush_motion -textvariable {[flush_motion]}
dui add variable steam 2418 [expr $::skin(button_y_machine) + 16] -font [skin_font D-font [fixed_size 40]] -fill $::skin_blue -anchor n -tags steam_motion -textvariable {[steam_motion]}
dui add variable water 2330 [expr $::skin(button_y_machine) - 78] -font [skin_font D-font [fixed_size 60]] -fill $::skin_blue -anchor n -tags water_motion -textvariable {w}

dui add variable $::skin_home_pages 2070 [expr $::skin(button_y_machine) - 36] -font [skin_font D-font [fixed_size 19]] -fill $::skin_button_label_colour -tags de1_btl_icon -anchor w -textvariable {$::skin(icon_bluetooth)}
dui add variable $::skin_home_pages 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font_bold 18] -fill $::skin_selected_colour -tags machine_state_text -width 220 -anchor center -justify center -textvariable {[string range $::skin_machine_state 0 18]}
dui add variable $::skin_home_pages 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font awesome_light [fixed_size 60]] -fill $::skin_red -tags machine_state -anchor center -textvariable {[skin_machine_state]}
dui add variable "steam" 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font 40] -fill $::skin_button_label_colour -anchor center -textvariable {[skin_steam_timer]}
dui add variable "flush" 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font 40] -fill $::skin_button_label_colour -anchor center -textvariable {[skin_flush_timer]}

add_clear_button settings_button off 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {set ::settings(active_settings_tab) settings_3; show_settings}

# extend timers
add_colour_button flush_extend flush [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {flush_extend}
add_colour_button steam_extend steam [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {steam_extend}


### scale

dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 128] -font [skin_font font 14] -fill $::skin_text_colour -anchor center -textvariable {[skin_scale_disconnected]}

add_colour_button scale_bg_shape $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 380 110 {} {do_nothing}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 108] [expr $::skin(button_y_scale) + 26] -font [skin_font D-font [fixed_size 19]] -fill $::skin_button_label_colour -tags scale_btl_icon -anchor w -textvariable {$::skin(icon_bluetooth)}
dui add variable off [expr $::skin(button_x_scale) + 112] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -textvariable {[skin_bean_weight]}
dui add variable off [expr $::skin(button_x_scale) + 270] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor e -textvariable {[skin_milk_weight]}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 64] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}

add_clear_button scale $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) 180 110 {} {scale_tare; catch {set ::de1(bluetooth_scale_connection_attempts_tried) 0; ble_connect_to_scale}}; set_button scale font [skin_font font_bold 18]; set_button scale label_fill $::skin_button_label_colour
add_clear_button bw $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 100 110 $::skin(icon_bean) {set_scale_weight_to_dose}; set_button bw font [skin_font D-font [fixed_size 42]]; set_button bw label_fill $::skin_button_label_colour
add_clear_button mw $::skin_home_pages [expr $::skin(button_x_scale) + 280] $::skin(button_y_scale) 100 110 $::skin(icon_steam_timer) {skin_steam_time_calc}; set_button mw font [skin_font D-font [fixed_size 42]]; set_button mw label_fill $::skin_button_label_colour

dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 30] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 350] [expr $::skin(button_y_scale) - 8] -width 0 -fill $::skin_foreground_colour -disabledfill $::skin_disabled_colour -tags {scale_line_1 scale_shape}
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 130] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 250] [expr $::skin(button_y_scale) - 0] -width 0 -fill $::skin_foreground_colour -disabledfill $::skin_disabled_colour -tags {scale_line_2 scale_shape}
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 104] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_3
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 276] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 280] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_4

add_colour_button auto_tare off [expr $::skin(button_x_scale) - 160] [expr $::skin(button_y_scale) + 4] 130 100 {[translate "auto tare"]} {toggle_auto_tare; skin_save skin}; set_button auto_tare state hidden
add_colour_button HDS_timer off [expr $::skin(button_x_scale) - 160] [expr $::skin(button_y_scale) + 134] 130 100 {[translate "HDS"]} {page_show hds_set}; set_button HDS_timer state hidden

### ghc buttons ###

add_icon_label_button espresso_start off $::skin(button_x_espresso) $::skin(button_y_espresso) 340 100 $::skin(icon_espresso) {[translate "espresso"]} {skin_start espresso}
dui add variable off [expr $::skin(button_x_espresso) + 170] [expr $::skin(button_y_espresso) + 120] -font [skin_font font_bold 17] -fill $::skin_text_colour  -tags espresso_data_line_1 -anchor n -justify center -width 340 -textvariable {[maxstring $::settings(profile_title) 28]\r[skin_dose] [translate " : "] [skin_saw]g\r[skin_extraction_ratio]}
add_clear_button espresso off $::skin(button_x_espresso) [expr $::skin(button_y_espresso) + 100] 340 180 {} {show_skin_set espresso}

add_icon_label_button steam_start off $::skin(button_x_steam) $::skin(button_y_steam) 340 100 $::skin(icon_steam) {[translate "steam"]} {skin_start steam}
dui add variable off [expr $::skin(button_x_steam) + 170] [expr $::skin(button_y_steam) + 120] -font [skin_font font_bold 17] -fill $::skin_text_colour  -tags steam_data_line_1 -anchor n -justify center -width 340 -textvariable {[skin_steam_settings_info]\r[jug_size_data]\r[skin_steam_text $::settings(steam_timeout)]}
add_clear_button steam off $::skin(button_x_steam) [expr $::skin(button_y_steam) + 100] 340 180 {} {show_skin_set steam}

add_icon_label_button water_start off $::skin(button_x_water) $::skin(button_y_water) 340 100 $::skin(icon_water) {[translate "water"]} {skin_start water}
dui add variable off [expr $::skin(button_x_water) + 170] [expr $::skin(button_y_water) + 120] -font [skin_font font_bold 17] -fill $::skin_text_colour  -tags water_data_line_1 -anchor n -justify center -width 340 -textvariable {[skin_water_settings_info]}
add_clear_button water off $::skin(button_x_water) [expr $::skin(button_y_water) + 100] 340 180 {} {show_skin_set water}

add_icon_label_button flush_start off $::skin(button_x_flush) $::skin(button_y_flush) 340 100 $::skin(icon_flush) {[translate "flush"]} {skin_start flush}
dui add variable off [expr $::skin(button_x_flush) + 170] [expr $::skin(button_y_flush) + 120] -font [skin_font font_bold 17] -fill $::skin_text_colour  -tags flush_data_line_1 -anchor n -justify center -width 340 -textvariable {[round_to_integer $::settings(flush_seconds)]s}
add_clear_button flush off $::skin(button_x_flush) [expr $::skin(button_y_flush) + 100] 340 180 {} {show_skin_set flush}

### stop buttons

add_colour_button stop_espresso_bg espresso $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 620 100 {} {do_nothing}
add_clear_button stop_espresso_icon espresso $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 100 100 $::skin(icon_espresso) {do_nothing}; set_button stop_espresso_icon font [skin_font D-font [fixed_size 40]]; set_button stop_espresso_icon label_fill $::skin_selected_colour
add_clear_button stop_espresso_skip espresso [expr $::skin(button_x_espresso) + 100] [expr 50 + $::skin(button_y_espresso)] 300 100 [translate "next step"] {move_to_the_next_step}; set_button stop_espresso_skip font [skin_font font_bold 18]; set_button stop_espresso_skip label_fill $::skin_button_label_colour
add_clear_button stop_espresso_stop espresso [expr $::skin(button_x_espresso) + 400] [expr 50 + $::skin(button_y_espresso)] 220 100 [translate "stop"] {skin_start idle}; set_button stop_espresso_stop font [skin_font font_bold 18]; set_button stop_espresso_stop label_fill $::skin_button_label_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 400] [expr 50 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 404] [expr $::skin(button_y_espresso) + 150] -tags stop_espresso_stop_s1 -width 0 -fill $::skin_background_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 100] [expr 50 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 104] [expr $::skin(button_y_espresso) + 150] -tags stop_espresso_stop_s2 -width 0 -fill $::skin_background_colour

add_icon_label_button stop_steam steam $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 $::skin(icon_steam) {[steam_stop_label]} {skin_start idle}; set_button stop_steam icon_fill $::skin_selected_colour
add_icon_label_button stop_flush flush $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 $::skin(icon_flush) {[translate "stop"]} {skin_start idle}; set_button stop_flush icon_fill $::skin_selected_colour
add_icon_label_button stop_water water $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 $::skin(icon_water) {[translate "stop"]} {skin_start idle}; set_button stop_water icon_fill $::skin_selected_colour
add_clear_button machine_stop_button $::skin_action_pages 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {skin_start idle}


### sleep power page

dui add variable "skin_power" 1280 840 -font [skin_font font_bold 24] -fill $::skin_text_colour -anchor center -justify center -width 880 -textvariable {[translate "Going to sleep in"]... [skin_power_off_timer]}
add_clear_button power_cancel "skin_power sleep" 0 0 2560 1600 {} {set_next_page off off; start_idle}
add_icon_label_button power_sleep skin_power 950 600 260 100 $::skin(icon_sleep) {sleep} {skin_sleep}; set_button power_sleep icon_font [skin_font awesome_light [fixed_size 26]]
add_icon_label_button power_exit skin_power 1370 600 260 100 $::skin(icon_x) {exit} {skin_exit}; set_button power_exit icon_font [skin_font awesome_light [fixed_size 26]]

############################################################################
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

blt::vector create compare_espresso_elapsed compare_espresso_pressure compare_espresso_flow compare_espresso_flow_weight compare_espresso_weight_chartable compare_espresso_flow_2x compare_espresso_flow_weight_2x compare_espresso_state_change compare_espresso_temperature_basket compare_espresso_temperature_basket10th compare_espresso_resistance



set ::key_font_size [fixed_size 14]
dui add shape oval "off espresso flush water" $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {pressure_icon graph_key_shape zoom_temperature_state key_buttons}
dui add shape oval "off espresso flush water" [expr $::skin(graph_key_x) + 250 + 30] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 250 + 40 + 30] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {flow_icon graph_key_shape zoom_temperature_state key_buttons}
dui add shape oval "off espresso flush water" [expr $::skin(graph_key_x) + 500 + 60] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 500 + 40 + 60] [expr $::skin(graph_key_y) + 18] -outline $::skin_brown -fill $::skin_brown -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {weight_icon graph_key_shape zoom_temperature_state key_buttons}
dui add shape oval "off espresso flush water" [expr $::skin(graph_key_x) + 750 + 90] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 750 + 40 + 90] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {temperature_icon graph_key_shape key_buttons}
dui add shape oval "off espresso flush water" [expr $::skin(graph_key_x) + 1000 + 120] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 1000 + 40 + 120] [expr $::skin(graph_key_y) + 18] -outline $::skin_yellow -fill $::skin_yellow -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags {resistance_icon graph_key_shape zoom_temperature_state key_buttons}
dui add dtext "off flush water" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags {pressure_text  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "pressure"]
dui add dtext "off flush water" [expr $::skin(graph_key_x) + 270 + 38 + 30] [expr $::skin(graph_key_y) + 12] -tags {flow_text  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "flow rate"]
dui add dtext "off flush water" [expr $::skin(graph_key_x) + 520 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags {weight_text  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "scale rate"]
dui add dtext "off flush water" [expr $::skin(graph_key_x) + 770 + 38 + 90] [expr $::skin(graph_key_y) + 12] -tags {temperature_text key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "temperature"]
dui add dtext "off flush water" [expr $::skin(graph_key_x) + 1020 + 38 + 120] [expr $::skin(graph_key_y) + 12] -tags {resistance_text  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "resistance"]
dui add variable "espresso" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags pressure_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(pressure)]]bar}
dui add variable "espresso" [expr $::skin(graph_key_x) + 270 + 38 + 30] [expr $::skin(graph_key_y) + 12] -tags flow_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(flow)]]ml/s}
dui add variable "espresso" [expr $::skin(graph_key_x) + 520 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags weight_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(scale_weight_rate)]]g/s}
dui add variable "espresso" [expr $::skin(graph_key_x) + 770 + 38 + 90] [expr $::skin(graph_key_y) + 12] -tags temperature_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -textvariable {[group_head_heater_temperature_text]}
dui add dtext "espresso" [expr $::skin(graph_key_x) + 1020 + 38 + 120] [expr $::skin(graph_key_y) + 12] -tags resistance_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor w -justify center -width 880 -text [translate "Resistance"]
dui add dbutton "off espresso flush water" $::skin(graph_key_x) [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {pressure_key_button  zoom_temperature_state key_buttons} \
    -command {toggle_graph pressure} -longpress_cmd {highlight_curve pressure}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 250 + 30] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {flow_key_button  zoom_temperature_state key_buttons} \
    -command {toggle_graph flow} -longpress_cmd {highlight_curve flow}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 500 + 60] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {weight_key_button  zoom_temperature_state key_buttons} \
    -command {toggle_graph weight} -longpress_cmd {highlight_curve weight}

dui add dbutton "espresso" [expr $::skin(graph_key_x) + 750 + 90] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {temperature_key_button_espresso temperature_key_button} \
    -command {toggle_graph temperature}

dui add dbutton "off flush water" [expr $::skin(graph_key_x) + 750 + 90] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {temperature_key_button_espresso temperature_key_button key_buttons} \
    -command {toggle_graph temperature} -longpress_cmd {zoom_temperature}

dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1000 + 120] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -tags {resistance_key_button  zoom_temperature_state key_buttons} \
    -command {toggle_graph resistance} -longpress_cmd {highlight_curve resistance}

dui add variable "off flush water" [expr $::skin(graph_key_x) + 1350 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags {steps_text  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -width 880 -text [translate "steps"]
dui add dtext "espresso" [expr $::skin(graph_key_x) + 1350 + 38 + 60] [expr $::skin(graph_key_y) + 12] -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor center -justify center -width 880 -text [translate "steps"]

dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1350 + 38] [expr $::skin(graph_key_y) - 40] \
    -bwidth 120 -bheight 110 -tags {steps_key_button  zoom_temperature_state key_buttons} \
    -command {toggle_graph steps}


dui add dtext "off espresso flush water" [expr $::skin(graph_key_x) + 1470 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags {main_graph_toggle_goal_label  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -text [translate "goals"]

dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1470 + 38] [expr $::skin(graph_key_y)  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {main_graph_toggle_goal_button  zoom_temperature_state key_buttons} \
    -command {toggle_main_graph_goal}

dui add dtext "off espresso flush water" [expr $::skin(graph_key_x) + 1590 + 36 + 60] [expr $::skin(graph_key_y) + 12] -tags {main_graph_toggle_view_label  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -text [translate "y2 axis"]

dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1590 + 38] [expr $::skin(graph_key_y)  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {main_graph_toggle_view_button  zoom_temperature_state key_buttons} \
    -command {toggle_main_graph_view}

dui add variable "off" [expr $::skin(graph_key_x) + 1710 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags {main_graph_toggle_label  zoom_temperature_state key_buttons} -font [skin_font font $::key_font_size] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor center -justify center -textvariable {$::main_graph_showing}

dui add dbutton off [expr $::skin(graph_key_x) + 1710 + 38] [expr $::skin(graph_key_y)  - 40] \
    -bwidth 120 -bheight 110 -initial_state normal -tags {main_graph_toggle_button  zoom_temperature_state key_buttons} \
    -command {toggle_main_graph}

set ::main_graph_height [rescale_y_skin 1010]
add_de1_widget "off flush water" graph 30 520 {
    set ::home_espresso_graph $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_y_skin 100]} {
            toggle_y_resolution
        } else {
            toggle_cache_graphs
        }
    }

    $widget element create compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 4] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 4] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color #a2a293  -pixels 0;

    $widget element create compare_flow_2x -xdata compare_espresso_elapsed -ydata compare_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 4] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_weight_2x -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget element create compare_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket10th -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_zoom_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_resistance -xdata compare_espresso_elapsed -ydata compare_espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0;

    $widget element create home_zoom_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_zoom_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};

    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget element create home_flow_goal_2x -xdata espresso_elapsed -ydata espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2} -hide 1;
    $widget element create home_flow_2x -xdata espresso_elapsed -ydata espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 1;
    $widget element create home_weight_2x -xdata espresso_elapsed -ydata espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 1;

    $widget element create home_weight_chartable  -xdata espresso_elapsed -ydata espresso_weight_chartable -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_brown  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create compare_weight_chartable -xdata compare_espresso_elapsed -ydata compare_espresso_weight_chartable -symbol none -label "" -linewidth [rescale_x_skin 4] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "[translate "pressure"]  &  [translate "temperature"]" -titlecolor $::skin_y_axis_colour -titlefont [skin_font font [fixed_size 14]]  -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "[translate "flow rate"]  &  [translate "scale rate"]" -titlecolor $::skin_y2_axis_colour -titlefont [skin_font font [fixed_size 14]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 1;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags main_graph

add_de1_variable "off" 1950 1550 -font [skin_font font 15] -fill $::skin_text_colour -anchor e -tags live_graph_data -textvariable {[skin_graph_info]}

add_de1_widget "espresso" graph 30 520 {
    set ::home_espresso_graph_espresso $widget
    bind $widget [platform_button_press] {
    }
    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata espresso_temperature_goal10th -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata espresso_temperature_basket10th -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget element create home_flow_goal_2x -xdata espresso_elapsed -ydata espresso_flow_goal_2x -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2} -hide 1;
    $widget element create home_flow_2x -xdata espresso_elapsed -ydata espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 1;
    $widget element create home_weight_2x -xdata espresso_elapsed -ydata espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 1;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "[translate "pressure"]  &  [translate "temperature"]" -titlecolor $::skin_y_axis_colour -titlefont [skin_font font [fixed_size 14]]  -min 0.0 -max 10 -subdivisions 1 -majorticks {0  2  4  6  8  10  12} -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 14]] -title "[translate "flow rate"]  &  [translate "scale rate"]" -titlecolor $::skin_y2_axis_colour -titlefont [skin_font font [fixed_size 14]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 1;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags main_graph_espresso

add_de1_variable "espresso" 1950 1550 -font [skin_font font 15] -fill $::skin_text_colour -anchor e -textvariable {[skin_graph_live_info]}




setup_home_espresso_graph


dui add shape oval steam $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_pressure_icon_off
dui add shape oval steam [expr $::skin(graph_key_x) + 250 + 30] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 250 + 40 + 30] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_flow_icon_off
dui add shape oval steam [expr $::skin(graph_key_x) + 500 + 60] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 500 + 40 + 60] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_temperature_icon_off
dui add variable "steam" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags steam_steam_pressure_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(pressure)]]bar}
dui add variable "steam" [expr $::skin(graph_key_x) + 270 + 38 + 30] [expr $::skin(graph_key_y) + 12] -tags steam_steam_flow_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(flow)]]ml/s}
dui add variable "steam" [expr $::skin(graph_key_x) + 520 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags steam_steam_temperature_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[steamtemp_text]}

dui add dbutton steam $::skin(graph_key_x) [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -initial_state normal -tags steam_steam_pressure_button \
    -command {toggle_graph steam_pressure}
dui add dbutton steam [expr $::skin(graph_key_x) + 226 + 40] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -initial_state normal -tags steam_steam_flow_button \
    -command {toggle_graph steam_flow}
dui add dbutton steam [expr $::skin(graph_key_x) + 474 + 80] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -initial_state normal -tags steam_steam_temperarture_button \
    -command {toggle_graph steam_temperature}


# Steam graph
add_de1_widget "steam" graph 30 520 {
    set ::home_steam_graph $widget
    bind $widget [platform_button_press] {
        #say [translate {zoom}] $::settings(sound_button_in);
        #set_next_page off off_steam_zoomed;
        #set_next_page steam steam_steam_zoomed;
        #page_show $::de1(current_context);
    }
    $widget element create home_steam_pressure -xdata steam_elapsed -ydata steam_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_green -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_steam_flow -xdata steam_elapsed -ydata steam_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_steam_temperature -xdata steam_elapsed -ydata steam_temperature100th -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_red  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -subdivisions 1
    #$widget axis configure y2 -color $::skin_red -tickfont [skin_font font 14] -min 130 -max 180 -majorticks {130 135 140 145 150 155 160 165 170 175 180} -hide 0
    $widget grid configure -color $::skin_grid_colour -dashes {4 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags steam_graph

dui add shape oval off $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_pressure_icon_off -initial_state hidden
dui add shape oval off [expr $::skin(graph_key_x) + 250 + 30] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 250 + 40 + 30] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_flow_icon_off -initial_state hidden
dui add shape oval off [expr $::skin(graph_key_x) + 500 + 60] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 500 + 40 + 60] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -disabledoutline $::skin_disabled_colour -disabledfill $::skin_disabled_colour -tags steam_steam_temperature_icon_off -initial_state hidden
dui add dtext "off" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags steam_steam_pressure_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -text [translate "pressure"]
dui add dtext "off" [expr $::skin(graph_key_x) + 270 + 38 + 30] [expr $::skin(graph_key_y) + 12] -tags steam_steam_flow_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -text [translate "flow rate"]
dui add dtext "off" [expr $::skin(graph_key_x) + 520 + 38 + 60] [expr $::skin(graph_key_y) + 12] -tags steam_steam_temperature_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -text [translate "temperature"]

dui add dbutton off $::skin(graph_key_x) [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -initial_state hidden -tags steam_steam_pressure_button_off \
    -command {toggle_graph steam_pressure}
dui add dbutton off [expr $::skin(graph_key_x) + 250 + 30] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -initial_state hidden -tags steam_steam_flow_button_off \
    -command {toggle_graph steam_flow}
dui add dbutton off [expr $::skin(graph_key_x) + 500 + 60] [expr $::skin(graph_key_y) - 40] \
    -bwidth 210 -bheight 110 -initial_state hidden -tags steam_steam_temperature_button_off \
    -command {toggle_graph steam_temperature}



add_de1_widget "off" graph 30 520 {
    set ::main_graph_steam $widget
    bind $widget [platform_button_press] {
        #say [translate {zoom}] $::settings(sound_button_in);
        #set_next_page off off_steam_zoomed;
        #set_next_page steam steam_steam_zoomed;
        #page_show $::de1(current_context);
    }
    $widget element create home_steam_pressure -xdata steam_elapsed -ydata steam_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_green -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_steam_flow -xdata steam_elapsed -ydata steam_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_steam_temperature -xdata steam_elapsed -ydata steam_temperature100th -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_red  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font 14] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font 14] -min 0.0 -subdivisions 1
    #$widget axis configure y2 -color $::skin_red -tickfont [skin_font font 14] -min 130 -max 180 -majorticks {130 135 140 145 150 155 160 165 170 175 180} -hide 0
    $widget grid configure -color $::skin_grid_colour -dashes {4 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags main_graph_steam
.can itemconfigure main_graph_steam -state hidden
dui item config off main_graph_steam -initial_state hidden
#######################################################

### fav edit pages ###

add_icon_button fav1_x_button off 1970 $::start_button_y 100 100 $::skin(icon_x) {cancel fav1}
set_button fav1_x_button label_fill $::skin_red
set_button fav1_x_button state hidden
add_icon_button fav1_tick_button off 1870 $::start_button_y 100 100 $::skin(icon_tick) {skin_save fav1}
set_button fav1_tick_button label_fill $::skin_green
set_button fav1_tick_button state hidden
add_icon_button fav2_x_button off 1970 [expr $::start_button_y + 120] 100 100 $::skin(icon_x) {cancel fav2}
set_button fav2_x_button label_fill $::skin_red
set_button fav2_x_button state hidden
add_icon_button fav2_tick_button off 1870 [expr $::start_button_y + 120] 100 100 $::skin(icon_tick) {skin_save fav2}
set_button fav2_tick_button label_fill $::skin_green
set_button fav2_tick_button state hidden
add_icon_button fav3_x_button off 1970 [expr $::start_button_y + 240] 100 100 $::skin(icon_x) {cancel fav3}
set_button fav3_x_button label_fill $::skin_red
set_button fav3_x_button state hidden
add_icon_button fav3_tick_button off 1870 [expr $::start_button_y + 240] 100 100 $::skin(icon_tick) {skin_save fav3}
set_button fav3_tick_button label_fill $::skin_green
set_button fav3_tick_button state hidden
add_icon_button fav4_x_button off 1970 [expr $::start_button_y + 360] 100 100 $::skin(icon_x) {cancel fav4}
set_button fav4_x_button label_fill $::skin_red
set_button fav4_x_button state hidden
add_icon_button fav4_tick_button off 1870 [expr $::start_button_y + 360] 100 100 $::skin(icon_tick) {skin_save fav4}
set_button fav4_tick_button label_fill $::skin_green
set_button fav4_tick_button state hidden
add_icon_button fav5_x_button off 1970 [expr $::start_button_y + 480] 100 100 $::skin(icon_x) {cancel fav5}
set_button fav5_x_button label_fill $::skin_red
set_button fav5_x_button state hidden
add_icon_button fav5_tick_button off 1870 [expr $::start_button_y + 480] 100 100 $::skin(icon_tick) {skin_save fav5}
set_button fav5_tick_button label_fill $::skin_green
set_button fav5_tick_button state hidden

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav1_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags fav1_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav1

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav2_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags fav2_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav2

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav3_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags fav3_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav3

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav4_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags fav4_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav4

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav5_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags fav5_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav5

dui add dtext off 2500 [expr $::start_button_y + 30] -tags fav1_auto_load_l1 -text [translate "auto"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 60] -tags fav1_auto_load_l2 -text [translate "load"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 45] -tags fav1_auto_load_l3 -text $::skin(icon_strike) -font [skin_font D-font [fixed_size 60]] -fill $::skin_selected_colour -anchor center
add_clear_button fav1_auto_load_button off 2450 [expr $::start_button_y + 0] 100 100 {} {set_auto_load fav1}


dui add dtext off 2500 [expr $::start_button_y + 150] -tags fav2_auto_load_l1 -text [translate "auto"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 180] -tags fav2_auto_load_l2 -text [translate "load"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 165] -tags fav2_auto_load_l3 -text $::skin(icon_strike) -font [skin_font D-font [fixed_size 60]] -fill $::skin_selected_colour -anchor center
add_clear_button fav2_auto_load_button off 2450 [expr $::start_button_y + 120] 100 100 {} {set_auto_load fav2}


dui add dtext off 2500 [expr $::start_button_y + 270] -tags fav3_auto_load_l1 -text [translate "auto"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 300] -tags fav3_auto_load_l2 -text [translate "load"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 285] -tags fav3_auto_load_l3 -text $::skin(icon_strike) -font [skin_font D-font [fixed_size 60]] -fill $::skin_selected_colour -anchor center
add_clear_button fav3_auto_load_button off 2450 [expr $::start_button_y + 240] 100 100 {} {set_auto_load fav3}

dui add dtext off 2500 [expr $::start_button_y + 390] -tags fav4_auto_load_l1 -text [translate "auto"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 420] -tags fav4_auto_load_l2 -text [translate "load"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 405] -tags fav4_auto_load_l3 -text $::skin(icon_strike) -font [skin_font D-font [fixed_size 60]] -fill $::skin_selected_colour -anchor center
add_clear_button fav4_auto_load_button off 2450 [expr $::start_button_y + 360] 100 100 {} {set_auto_load fav4}

dui add dtext off 2500 [expr $::start_button_y + 510] -tags fav5_auto_load_l1 -text [translate "auto"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 540] -tags fav5_auto_load_l2 -text [translate "load"] -width 100 -font [skin_font font [fixed_size 18]] -fill $::skin_text_colour -anchor center
dui add dtext off 2500 [expr $::start_button_y + 525] -tags fav5_auto_load_l3 -text $::skin(icon_strike) -font [skin_font D-font [fixed_size 60]] -fill $::skin_selected_colour -anchor center
add_clear_button fav5_auto_load_button off 2450 [expr $::start_button_y + 480] 100 100 {} {set_auto_load fav5}

foreach k {fav1 fav2 fav3 fav4 fav5} {
    dui item config off ${k}_auto_load_l1 -initial_state hidden -state hidden
    dui item config off ${k}_auto_load_l2 -initial_state hidden -state hidden
    dui item config off ${k}_auto_load_l3 -initial_state hidden -state hidden
    set_button ${k}_auto_load_button state hidden
}

### Beverage type ###
###############################
dui add dtext off [expr $::beverage_type_x + 120] 580 -text [translate "Workflow"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_latte off $::beverage_type_x 620 240 100 {[translate "latte/cap"]} {workflow latte}
add_colour_button wf_long off $::beverage_type_x 740 240 100 {[translate "long black"]} {workflow long}
add_colour_button wf_americano off $::beverage_type_x 860 240 100 {[translate "americano"]} {workflow americano}
add_colour_button wf_espresso off $::beverage_type_x 980 240 100 {[translate "espresso"]} {workflow espresso}
add_colour_button wf_none off $::beverage_type_x 1100 240 100 {[translate "none"]} {workflow none}
set_button wf_none label_fill $::skin_selected_colour

add_colour_variable_button favs_number off $::beverage_type_x 1350 260 100 {[translate "show"] $::skin(favs_to_show) favs} {toggle_favs_to_show}; set_button favs_number state hidden

########### Workflow Settings ########

### index
dui add dtext off [expr $::skin(button_x_espresso) + 170] 534 -tags espresso_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_foreground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_steam) + 170] 534 -tags steam_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_foreground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_flush) + 170] 534 -tags flush_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_foreground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_water) + 170] 534 -tags water_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_foreground_colour -anchor s -initial_state hidden

dui add canvas_item arc off 120 494 220 542 -start 90 -width [expr {4 * $::settings(screen_size_width) / 1280}] -style {} -style arc -disabledoutline $::skin_disabled_colour -outline $::skin_foreground_colour -tags {index_shape_1 index_shape} -initial_state hidden
dui add canvas_item arc off 1480 494 1580 542 -start 0 -width [expr {4 * $::settings(screen_size_width) / 1280}] -style {} -style arc -disabledoutline $::skin_disabled_colour -outline $::skin_foreground_colour -tags {index_shape_3 index_shape} -initial_state hidden
dui add shape rect off 170 492 1530 496 -width 0 -fill $::skin_foreground_colour -disabledfill $::skin_disabled_colour -tags {index_shape_2 index_shape home_page_shape} -initial_state hidden

add_clear_button espresso_index_button off $::skin(button_x_espresso) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button espresso_index_button state hidden
add_clear_button steam_index_button off $::skin(button_x_steam) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button steam_index_button state hidden
add_clear_button flush_index_button off $::skin(button_x_flush) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button flush_index_button state hidden
add_clear_button water_index_button off $::skin(button_x_water) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button water_index_button state hidden


### close button Damian
add_clear_button wf_close off 150 450 1490 130 [translate "tap here to close"] {show_graph}; set_button wf_close state hidden; set_button wf_close font [skin_font font 16]
#########################################################
### espresso
dui add dtext off 310 580 -tags wf_heading_profile -text [translate "Profile"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
dui add variable "off" 310 770 -tags wf_heading_profile_type -font [skin_font font_bold 16] -fill $::skin_text_colour -anchor center -textvariable {$::settings(beverage_type)}
add_colour_button select_profile off 200 620 220 100 {[translate "select"]} {goto_profile_list}
add_colour_button edit_profile off 200 820 220 100 {[translate "edit"]} {show_profile_editor {}}

# Dose
dui add dtext off [expr 840 + $::wf_dose_x] 580 -tags wf_heading_bean_weight -text [translate "Bean weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_dose_minus off [expr 730 + $::wf_dose_x] 620 100 100 {\Uf106} {adjust dose 1}; set_button wf_dose_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_plus off [expr 730 + $::wf_dose_x] 820 100 100 {\Uf107} {adjust dose -1}; set_button wf_dose_plus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_minus_10 off [expr 850 + $::wf_dose_x] 620 100 100 {\Uf106} {adjust dose 0.1}; set_button wf_dose_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_plus_10 off [expr 850 + $::wf_dose_x] 820 100 100 {\Uf107} {adjust dose -0.1}; set_button wf_dose_plus_10 font [skin_font awesome_light [fixed_size 34]]
dui add variable off [expr 840 + $::wf_dose_x] 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_beans -anchor center -textvariable {[round_to_one_digits $::settings(grinder_dose_weight)]g}

dui add dtext off [expr 840 - $::wf_dose_x] 580 -tags wf_heading_bean_cup -text [translate "Dose cup"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_bean_cup_button off [expr 730 - $::wf_dose_x] 620 220 100 {$::skin(bean_cup_g)g} {set_bean_cup_weight}
add_icon_button wf_info_button off [expr 630 - $::wf_dose_x] 620 100 100 $::skin(icon_info) {show_wf_espresso_info}



# Espresso SAW
dui add dtext off 1340 580 -tags wf_heading_espresso_weight -text [translate "Espresso weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_espresso_minus_10 off 1230 620 100 100 {\Uf106} {adjust saw 10}; set_button wf_espresso_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_plus_10 off 1230 820 100 100 {\Uf107} {adjust saw -10}; set_button wf_espresso_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_minus off 1350 620 100 100 {\Uf106} {adjust saw 1}; set_button wf_espresso_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_plus off 1350 820 100 100 {\Uf107} {adjust saw -1}; set_button wf_espresso_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1340 770 -fill $::skin_text_colour -font [skin_font font_bold 24] -tags wf_espresso -anchor center -textvariable {[skin_saw]g}

add_icon_button wf_save_saw_x_button off 1230 960 100 100 $::skin(icon_x) {wf_cancel_profile_saw}
set_button wf_save_saw_x_button label_fill $::skin_red
set_button wf_save_saw_x_button state hidden
add_icon_button wf_save_saw_tick_button off 1350 960 100 100 $::skin(icon_tick) {wf_update_profile_saw}
set_button wf_save_saw_tick_button label_fill $::skin_green
set_button wf_save_saw_tick_button state hidden

dui add shape rect off 100 560 1700 900 -width 1 -outline $::skin_foreground_colour -fill $::skin_background_colour -tags {wf_espresso_info_bg wf_espresso_info} -initial_state hidden
dui add dtext off 180 680 -tags {wf_dose_cup_text_line_1 wf_espresso_info} -width 1400 -text [translate "If you prefer to tare without the dose cup, set a dose cup weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 180 740 -tags {wf_dose_cup_text_line_2 wf_espresso_info} -text [translate "If you prefer to tare with the dose cup, set the dose cup weight to 0.0"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 180 800 -tags {wf_dose_cup_text_line_3 wf_espresso_info} -text [translate "Tap the dose cup button to set it to the current scale weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 900 580 -tags {wf_dose_cup_text_line_4 wf_espresso_info} -width 1400 -text [translate "tap to close"] -font [skin_font font 18] -fill $::skin_text_colour -anchor center -initial_state hidden
dui add dbutton off 100 560 -bwidth 1600 -bheight 340 -initial_state hidden -tags {hide_wf_espresso_info wf_espresso_info} -command {hide_wf_espresso_info}

hide_espresso_settings
###########################################################

### steam
dui add dtext off 340 580 -tags wf_heading_steam_heater -text [translate "Steam heater"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_steam_off_bg off 230 620 220 100 {} {}
add_clear_button wf_steam_off off 230 620 110 100 [translate "off"] {toggle_steam_heater}; set_button wf_steam_off font [skin_font font_bold 18]
add_clear_button wf_steam_on off 340 620 110 100 [translate "on"] {toggle_steam_heater}; set_button wf_steam_on font [skin_font font_bold 18]
dui add dtext off 840 580 -tags wf_heading_milk_jug -text [translate "Milk jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center -initial_state hidden

add_icon_label_button wf_steam_jug_s off 710 620 280 100 $::skin(icon_jug) {small} {set_jug s}
add_icon_button jug_s_edit off 610 620 100 100 $::skin(icon_edit) {show_jug jug_s}
set_button jug_s_edit font [skin_font awesome_light [fixed_size 28]]
set_button jug_s_edit state hidden
add_colour_variable_button jug_s_weight off 710 620 280 100 {current $::skin(jug_s)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_s_weight font [skin_font font 16]
add_icon_button jug_s_x_button off 610 620 100 100 $::skin(icon_x) {hide_jug jug_s}
set_button jug_s_x_button label_fill $::skin_red
add_icon_button jug_s_tick_button off 510 620 100 100 $::skin(icon_tick) {skin_save jug_s}
set_button jug_s_tick_button label_fill $::skin_green

add_icon_label_button wf_steam_jug_m off 710 740 280 100 $::skin(icon_jug) {medium} {set_jug m}
add_icon_button jug_m_edit off 610 740 100 100 $::skin(icon_edit) {show_jug jug_m}

set_button jug_m_edit font [skin_font awesome_light [fixed_size 28]]

add_colour_variable_button jug_m_weight off 710 740 280 100 {current $::skin(jug_m)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_m_weight font [skin_font font 16]
add_icon_button jug_m_x_button off 610 740 100 100 $::skin(icon_x) {hide_jug jug_m}
set_button jug_m_x_button label_fill $::skin_red
add_icon_button jug_m_tick_button off 510 740 100 100 $::skin(icon_tick) {skin_save jug_m}
set_button jug_m_tick_button label_fill $::skin_green

add_icon_label_button wf_steam_jug_l off 710 860 280 100 $::skin(icon_jug) {large} {set_jug l}
add_icon_button jug_l_edit off 610 860 100 100 $::skin(icon_edit) {show_jug jug_l}
set_button jug_l_edit font [skin_font awesome_light [fixed_size 28]]

add_colour_variable_button jug_l_weight off 710 860 280 100 {current $::skin(jug_l)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_l_weight font [skin_font font 16]
add_icon_button jug_l_x_button off 610 860 100 100 $::skin(icon_x) {hide_jug jug_l}
set_button jug_l_x_button label_fill $::skin_red
add_icon_button jug_l_tick_button off 510 860 100 100 $::skin(icon_tick) {skin_save jug_l}
set_button jug_l_tick_button label_fill $::skin_green

dui add variable off 1010 670 -tags {jug_s_number jug_numbers} -anchor w -fill $::skin_text_colour -font [skin_font D-font [fixed_size 24]] -textvariable {$::jug_s_number}
dui add variable off 1010 790 -tags {jug_m_number jug_numbers} -anchor w -fill $::skin_text_colour -font [skin_font D-font [fixed_size 24]] -textvariable {$::jug_m_number}
dui add variable off 1010 910 -tags {jug_l_number jug_numbers} -anchor w -fill $::skin_text_colour -font [skin_font D-font [fixed_size 24]] -textvariable {$::jug_l_number}
dui add dbutton off 1000 610 \
    -tags {jug_number_button jug_numbers} \
    -bwidth 120 -bheight 380 \
    -command {toggle_jug_number}
dui item config off jug_numbers -initial_state hidden -state hidden

dui add dtext off 1340 580 -tags wf_heading_steam_timer -text [translate "Steam timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_steam_timer_minus_10 off 1230 620 100 100 {\Uf106} {adjust steam 10}; set_button wf_steam_timer_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_plus_10 off 1230 820 100 100 {\Uf107} {adjust steam -10}; set_button wf_steam_timer_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_minus off 1350 620 100 100 {\Uf106} {adjust steam 1}; set_button wf_steam_timer_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_plus off 1350 820 100 100 {\Uf107} {adjust steam -1}; set_button wf_steam_timer_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_steam_timer_setting -anchor center -textvariable {[round_to_integer $::settings(steam_timeout)]s}

dui add dtext off 180 1200 -tags wf_heading_steam_calibrate -text [translate "Calibrate steam timer by weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1430 -tags wf_milk_weight_text_line_1 -width 1400 -text [translate "1: Place the empty jug on the scale, tap the pencil next to the respective jug button to set the weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1500 -tags wf_milk_weight_text_line_2 -text [translate "2: Place the jug with milk on the scale, tap the milk jug button to set the weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1550 -tags wf_milk_weight_text_line_3 -text [translate "3: Steam the milk to your prefered temperature, enter the time it took"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w

add_icon_label_button wf_steam_jug_milk off 180 1260 280 100 $::skin(icon_milk) {[round_to_integer $::skin(milk_g)]g} {set ::skin(milk_g) [round_to_integer [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]] }
add_icon_button wf_steam_cal_time_minus off 600 1260 100 100 $::skin(icon_minus) {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) - 1]]; if {$::skin(milk_s) < 5} {set ::skin(milk_s) 5}}; set_button wf_steam_cal_time_minus font [skin_font D-font [fixed_size 34]]
add_icon_label_button wf_steam_jug_time off 700 1260 280 100 $::skin(icon_timer) {[round_to_integer $::skin(milk_s)]s} {set ::skin(milk_s) [steam_pour_timer]}; set_button wf_steam_jug_time icon_font [skin_font awesome_light [fixed_size 34]]
add_icon_button wf_steam_cal_time_plus off 975 1260 100 100 $::skin(icon_plus) {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) + 1]]; if {$::skin(milk_s) > 120} {set ::skin(milk_s) 120}}; set_button wf_steam_cal_time_plus font [skin_font D-font [fixed_size 34]]

dui add variable off 840 1240 -fill $::skin_text_colour  -font [skin_font font 16] -tags wf_last_steam_time -anchor center -textvariable {[translate "last steam"] [steam_pour_timer]s}

add_icon_label_button wf_steam_jug_auto off 710 1030 280 100 $::skin(icon_jug) {Auto} {toggle_jug_auto}
dui add dtext off 1340 1240 -tags wf_steam_jug_auto_weight_heading -text [translate "milk per drink"] -font [skin_font font 16] -fill $::skin_text_colour -anchor center
add_colour_button wf_steam_jug_auto_weight off 1250 1270 180 100 {[round_to_integer $::skin(single_drink_milk_volume)]g} {set ::skin(single_drink_milk_volume) [round_to_integer [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]] }
add_icon_button wf_steam_jug_auto_weight_minus off 1150 1260 100 100 $::skin(icon_minus) {set ::skin(single_drink_milk_volume) [round_to_integer [expr $::skin(single_drink_milk_volume) - 10]]; if {$::skin(single_drink_milk_volume) < 50} {set ::skin(single_drink_milk_volume) 50}}; set_button wf_steam_jug_auto_weight_minus font [skin_font D-font [fixed_size 34]]
add_icon_button wf_steam_jug_auto_weight_plus off 1425 1260 100 100 $::skin(icon_plus) {set ::skin(single_drink_milk_volume) [round_to_integer [expr $::skin(single_drink_milk_volume) + 10]]; if {$::skin(single_drink_milk_volume) > 300} {set ::skin(single_drink_milk_volume) 300}}; set_button wf_steam_jug_auto_weight_plus font [skin_font D-font [fixed_size 34]]

hide_steam_settings

### flush
dui add dtext off 340 580 -tags wf_heading_flush_flow -text [translate "Flow rate"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_flush_flow_minus_10 off 230 620 100 100 {\Uf106} {adjust flush_flow 1}; set_button wf_flush_flow_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_plus_10 off 230 820 100 100 {\Uf107} {adjust flush_flow -1}; set_button wf_flush_flow_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_minus off 350 620 100 100 {\Uf106} {adjust flush_flow 0.1}; set_button wf_flush_flow_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_plus off 350 820 100 100 {\Uf107} {adjust flush_flow -0.1}; set_button wf_flush_flow_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 340 770 -fill $::skin_text_colour -font [skin_font font_bold 24] -tags wf_flush_flow_setting -anchor center -textvariable {[round_to_one_digits $::settings(flush_flow)][translate "ml/s"]}

dui add dtext off 840 580 -tags wf_heading_flush_timer -text [translate "Flush timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_flush_timer_minus_10 off 730 620 100 100 {\Uf106} {adjust flush 10}; set_button wf_flush_timer_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_timer_plus_10 off 730 820 100 100 {\Uf107} {adjust flush -10}; set_button wf_flush_timer_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_timer_minus off 850 620 100 100 {\Uf106} {adjust flush 1}; set_button wf_flush_timer_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_timer_plus off 850 820 100 100 {\Uf107} {adjust flush -1}; set_button wf_flush_timer_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 840 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_flush_timer_setting -anchor center -textvariable {[round_to_integer $::settings(flush_seconds)]s}

hide_flush_settings

### water
dui add dtext off 340 580 -tags wf_heading_water_flow -text [translate "Flow rate"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_flow_minus_10 off 230 620 100 100 {\Uf106} {adjust water_flow 1}; set_button wf_water_flow_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_flow_plus_10 off 230 820 100 100 {\Uf107} {adjust water_flow -1}; set_button wf_water_flow_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_flow_minus off 350 620 100 100 {\Uf106} {adjust water_flow 0.1}; set_button wf_water_flow_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_flow_plus off 350 820 100 100 {\Uf107} {adjust water_flow -0.1}; set_button wf_water_flow_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_flow_setting -anchor center -textvariable {[round_to_one_digits $::settings(hotwater_flow)][translate "ml/s"]}

dui add dtext off 750 580 -tags wf_heading_water_temperature -text [translate "Temperature"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_temperature_minus_10 off 640 620 100 100 {\Uf106} {adjust water_temperature 10}; set_button wf_water_temperature_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_plus_10 off 640 820 100 100 {\Uf107} {adjust water_temperature -10}; set_button wf_water_temperature_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_minus off 760 620 100 100 {\Uf106} {adjust water_temperature 1}; set_button wf_water_temperature_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_plus off 760 820 100 100 {\Uf107} {adjust water_temperature -1}; set_button wf_water_temperature_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 750 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_temperature_setting -anchor center -textvariable {[skin_temperature_measurement $::settings(water_temperature)]}

dui add dtext off 1180 580 -tags wf_heading_water_volume -text [translate "Volume"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_volume_minus_10 off 1070 620 100 100 {\Uf106} {adjust water_volume 10}; set_button wf_water_volume_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_plus_10 off 1070 820 100 100 {\Uf107} {adjust water_volume -10}; set_button wf_water_volume_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_minus off 1190 620 100 100 {\Uf106} {adjust water_volume 1}; set_button wf_water_volume_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_plus off 1190 820 100 100 {\Uf107} {adjust water_volume -1}; set_button wf_water_volume_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1180 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_volume_setting -anchor center -textvariable {[skin_water_volume]}

dui add dtext off 1390 580 -tags wf_heading_water_offset -text [translate "Offset"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_offset_minus off 1340 620 100 100 {\Uf106} {adjust wsaw_offset -1}; set_button wf_water_offset_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_offset_plus off 1340 820 100 100 {\Uf107} {adjust wsaw_offset 1}; set_button wf_water_offset_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1390 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_offset_setting -anchor center -textvariable {[skin_water_offset]}

hide_water_settings

### message pages
dui add variable "plugin_message" 360 600 -font [skin_font font 20] -fill $::skin_text_colour -anchor w -width 2000 -textvariable {$::plugin_change_message}
add_clear_button plugin_message plugin_message 0 0 2560 1600 {} {app_exit}

dui add dtext "restart_message" 1280 600 -font [skin_font font 28] -fill $::skin_text_colour -anchor center -justify center -text [translate "Restart the app for your changes to take effect"]\r\r\r[translate "Tap anywhere to exit"]
add_clear_button restart_message restart_message 0 0 2560 1600 {} {skin_exit}

### screen saver page
dui add dbutton saver 0 0 \
    -bwidth 2560 -bheight 1600 \
    -command {set_next_page off off; start_idle}

### DYE
proc skin_dye_button {} {
	if {[plugins enabled DYE] && $::settings(skin) == "DSx2" && $::skin(theme) == "Damian"} {
		add_icon_label_button dye_bg off $::skin(button_x_dye) $::skin(button_y_dye) 230 100 $::skin(icon_edit) {dye} {}
		set_button dye_bg icon_font [skin_font awesome_light [fixed_size 26]]
		dui add dbutton $::skin_home_pages $::skin(button_x_dye) $::skin(button_y_dye) \
			-bwidth 230 -bheight 100 -tags launch_dye \
			-command [list ::plugins::DYE::open -which_shot default] \
			-longpress_cmd [::list ::plugins::DYE::open -which_shot dialog \
			-coords \{[expr \$::skin(button_x_dye)+230] \
			[expr \$::skin(button_y_dye)+140]\} -anchor ne] \
			-tap_pad {4 4 40 4} -page_title [translate {Select a shot to describe}]
	}

}

skin_dye_button

### history buttons
dui add dbutton off [expr $::skin(button_x_history) + 230] $::skin(button_y_history) \
    -bwidth 100 -bheight 100 -tags skin_history_button -initial_state normal \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {\uf1da} -label_font [skin_font awesome_light [fixed_size 28]] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {skin_history} -longpress_cmd {skin_history_2}

if {$::skin(show_history_button) == 0} {
    dui item config off skin_history_button* -initial_state hidden -state hidden
}

### espresso data card
set ::data_card_y_espresso 150
dui add dbutton off 30 250 \
    -bwidth 100 -bheight 100 -tags data_card_button \
    -labelvariable $::skin(icon_info) -label_font [skin_font awesome_light 30] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {info_espresso_last_data_toggle}

dui add dbutton off [expr $::skin(button_x_espresso) - 50] [expr $::data_card_y_espresso - 50] \
    -bwidth 1820 -bheight 360 -tags {info_espresso_last_data_card_bg1 info_espresso_last_data_card} \
    -shape round -radius 30 -fill $::skin_background_colour -initial_state hidden \
    -command {do_nothing}

dui add dbutton off [expr $::skin(button_x_espresso) + 20] [expr $::data_card_y_espresso + 20] \
    -bwidth 1300 -bheight 260 -tags {info_espresso_last_data_card_bg2 info_espresso_last_data_card} \
    -shape round -radius 30 -fill $::skin_foreground_colour -initial_state hidden \
    -command {do_nothing}

dui add variable off [expr $::skin(button_x_espresso) + 100] [expr $::data_card_y_espresso + 150] -font [skin_font font_bold 18] -initial_state hidden -fill $::skin_button_label_colour -anchor w -tags {info_espresso_last_data_card_data_titles info_espresso_last_data_card} -textvariable {Date\rProfile\rVolume\rTime\rWeight}
dui add variable off [expr $::skin(button_x_espresso) + 300] [expr $::data_card_y_espresso + 150] -font [skin_font font 18] -fill -initial_state hidden $::skin_button_label_colour -anchor w -tags {info_espresso_last_data_card_data info_espresso_last_data_card} -textvariable {[info_espresso_last_data]}
dui add variable off [expr $::skin(button_x_espresso) + 800] [expr $::data_card_y_espresso + 150] -font [skin_font font 18] -fill -initial_state hidden $::skin_button_label_colour -anchor w -tags {info_espresso_last_data_card_data_compare info_espresso_last_data_card} -textvariable {[info_espresso_last_data_compare]}

dui add dbutton off [expr $::skin(button_x_espresso) - 30] [expr $::data_card_y_espresso - 30] \
    -bwidth 700 -bheight 260 -initial_state hidden -tags {info_espresso_last_data_card_button info_espresso_last_data_card} \
    -command {info_espresso_last_data_toggle}

#### header
dui add shape rect $::skin_home_pages 0 0 2560 46 -width 0 -fill $::skin_foreground_colour -tags {headerar_bg0 headerbar}
dui add canvas_item arc $::skin_home_pages 1580 -80 1870 99 -start 270 -outline $::skin_foreground_colour -fill $::skin_foreground_colour -tags {headerbar_bg1 headerbar headerbar_heading}
dui add shape round_outline $::skin_home_pages 0 0 1760 100 -width 0 -fill $::skin_foreground_colour -tags {headerbar_bg2 headerbar headerbar_heading}
dui add canvas_item arc $::skin_home_pages -110 -120 210 170 -start 270 -outline $::skin_foreground_colour -fill $::skin_foreground_colour -tags {headerbar_bg3 headerbar}
dui add canvas_item rect $::skin_home_pages 0 0 50 170 -outline $::skin_foreground_colour -fill $::skin_foreground_colour -tags {headerbar_bg4 headerbar}
dui add variable $::skin_home_pages 1020 0 -font [skin_font font [fixed_size 40]] -fill $::skin_button_label_colour -anchor n -tags {heading headerbar} -textvariable {$::skin_heading}

dui add variable $::skin_home_pages 2540 4 -font [skin_font font [fixed_size 15]] -fill $::skin_button_label_colour -anchor ne -tags {headerbar_clock headerbar} -textvariable {[skin_clock]}
dui add variable $::skin_home_pages 2100 6 -font [skin_font awesome [fixed_size 14]] -fill $::skin_button_label_colour -anchor ne -tags {wifi_icon headerbar} -textvariable {\uf1eb [wifi_status]}
dui add variable $::skin_home_pages 2190 4 -font [skin_font awesome_light [fixed_size 18]] -fill $::skin_button_label_colour -anchor ne -tags {battery_icon headerbar} -textvariable {[skin_battery_status]}

add_clear_button heading off 0 10 2560 100 {} header_settings headerbar

add_clear_button close_heading_settings off 0 10 2560 100 {} {hide_header_settings; show_graph; skin_save skin}; set_button close_heading_settings state hidden

### sleep
dui add variable $::skin_home_pages [expr $::skin(button_x_power) + 54] [expr $::skin(button_y_power) + 40] -font [skin_font D-font [fixed_size 68]] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {p} -tags {sleep_button powerbutton headerbar}
add_clear_button sleep_power_button off 10 10 220 200 {} {skin_power} headerbar

### HDS settings page
dui add dtext hds_set 1280 300 -text [translate "Half Decent Scale"] -font [skin_font font_bold 22] -fill $::skin_text_colour -anchor c

dui add dtext hds_set 1010 500 -text [translate "OLED brightness"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtoggle hds_set 1420 500 -anchor w \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::skin(HDS_brightness) \
    -command {toggle_HDS_brightness}

dui add dtext hds_set 1010 620 -text [translate "Show timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtoggle hds_set 1420 620 -anchor w \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::skin(HDS_timer) \
    -command {toggle_HDS_timer}

dui add dtext hds_set 1010 762 -text [translate "Show battery level"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtext hds_set 1010 798 -text [translate "on DSx2"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtoggle hds_set 1420 780 -anchor w \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::skin(HDS_show_battery_level) \
    -command {toggle_HDS_show_battery_level}

dui add dbutton hds_set 1180 1440 \
    -bwidth 200 -bheight 100 \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {EXIT} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {page_show off}
###

if {$::android != 1} {
    start_idle
}

if {$::skin(show_weight_chartable) == 0} {
    $::home_espresso_graph element configure home_weight_chartable -hide 1
    $::home_espresso_graph element configure compare_weight_chartable -hide 1
} else {
    $::home_espresso_graph element configure home_weight_chartable -hide 0
    $::home_espresso_graph element configure compare_weight_chartable -hide 0
}

if {$::skin(show_data_card_button) == 0} {
    dui item config off data_card_button* -initial_state hidden -state hidden
} else {
    dui item config off data_card_button* -initial_state normal -state normal
}


### manual
#################

check_heading
skin_load $::skin(auto_load_fav)
setup_steam_switch_state
check_current_jug
check_app_extensions
workflow $::skin(workflow)
dui add variable off 0 0 -fill $::skin_text_colour  -font [skin_font font 14] -tags loop -anchor center -textvariable {[skin_loop]}
check_graph_axis
check_y_resolution
check_history_button_position

# optional keyboard bindings
focus .can
bind Canvas <KeyPress> {handle_keypress %k}

profile_has_changed_set_colors

proc skins_page_change_due_to_de1_state_change { textstate } {
	page_change_due_to_de1_state_change $textstate
	if {$textstate == "Idle"} {
        check_graph_axis
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
dui add variable "off espresso" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {$::settings(skin) v${::skin_version}}
