set ::skin_version 0.36
set ::skin_heading DSx2

#### header
#dui add shape rect $::skin_home_pages 0 0 2560 46 -width 0 -fill $::skin_forground_colour
dui add shape rect $::skin_home_pages 0 0 2560 46 -width 0 -fill $::skin_forground_colour -tags {headerar_bg0 headerbar}
if {$::settings(screen_size_width) == 1340} {
    dui add canvas_item arc $::skin_home_pages 1580 -80 1870 103 -start 270  -outline $::skin_forground_colour -fill $::skin_forground_colour -tags {headerbar_bg1 headerbar headerbar_heading}
} else {
    dui add canvas_item arc $::skin_home_pages 1580 -80 1870 99 -start 270  -outline $::skin_forground_colour -fill $::skin_forground_colour -tags {headerbar_bg1 headerbar headerbar_heading}
}
dui add shape round_outline $::skin_home_pages 0 0 1760 100 -width 0 -fill $::skin_forground_colour -tags {headerbar_bg2 headerbar headerbar_heading}
dui add canvas_item arc $::skin_home_pages -110 -120 210 170 -start 270 -outline $::skin_forground_colour -fill $::skin_forground_colour -tags {headerbar_bg3 headerbar}
dui add canvas_item rect $::skin_home_pages 0 0 50 170 -outline $::skin_forground_colour -fill $::skin_forground_colour -tags {headerbar_bg4 headerbar}
dui add variable $::skin_home_pages 1020 0 -font [skin_font font [fixed_size 40]] -fill $::skin_button_label_colour -anchor n -tags {heading headerbar} -textvariable {$::skin_heading}

dui add variable $::skin_home_pages 2540 4 -font [skin_font font [fixed_size 15]] -fill $::skin_button_label_colour -anchor ne -tags {headerbar_clock headerbar} -textvariable {[skin_clock]}
dui add variable $::skin_home_pages 2100 6 -font [skin_font awesome [fixed_size 14]] -fill $::skin_button_label_colour -anchor ne -tags {wifi_icon headerbar} -textvariable {\uf1eb [wifi_status]}
dui add variable $::skin_home_pages 2190 4 -font [skin_font awesome_light [fixed_size 18]] -fill $::skin_button_label_colour -anchor ne -tags {battery_icon headerbar} -textvariable {[skin_battery_status]}

add_clear_button heading off 0 10 2560 100 {} {header_settings}
add_clear_button close_heading_settings off 0 10 2560 100 {} {hide_header_settings; skin_save skin}; set_button close_heading_settings state hidden

## settings
add_colour_button edit_heading_button off 100 620 340 100 {[translate "toggle heading"]} {toggle_heading}; set_button edit_heading_button state hidden

add_de1_widget "off" entry 450 -1001 {
	set ::globals(edit_heading_button) $widget
	bind $widget <Return> {set ::skin(heading) $::skin_heading; hide_android_keyboard}
	bind $widget <Leave>  {set ::skin(heading) $::skin_heading; hide_android_keyboard}
    } -width 32 -font [skin_font font [fixed_size 16]] -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags heading_entry -textvariable ::skin_heading

add_colour_button edit_colour_theme_button off 100 750 340 100 {[translate "colour theme"]\r$::skin(colour_theme)} {skin_colour_theme_selection}; set_button edit_heading_button state hidden
add_colour_button edit_icon_size_button off 100 880 340 100 {$::icon_size_state [translate "icon"]\r[translate "calibration"]} {toggle_icon_size_settings}; set_button edit_icon_size_button state hidden

add_colour_button exit_heading_settings off 100 1200 260 100 {[translate "close"]} {hide_header_settings; skin_save skin}; set_button exit_heading_settings state hidden


dui add dtext off 800 780 -tags {heading_icon_size icon_size_set} -text [translate "Adjust so the star tips touch the square"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center -justify center -initial_state hidden
add_colour_button icon_size_minus off 640 840 100 100 {\Uf106} {adjust icon_size 1}; set_button icon_size_minus font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_minus state hidden
add_colour_button icon_size_plus off 640 1040 100 100 {\Uf107} {adjust icon_size -1}; set_button icon_size_plus font [skin_font awesome_light [fixed_size 34]]; set_button icon_size_plus state hidden
dui add variable off 690 990 -fill $::skin_text_colour -font [skin_font font_bold 24] -tags {icon_size_value icon_size_set} -anchor center -initial_state hidden -textvariable {$::skin(icon_size)}

dui add shape rect off 850 940 950 1040 -width 2 -outline $::skin_text_colour -fill $::skin_background_colour -tags {icon_size_shape icon_size_set} -initial_state hidden
dui add variable off 900 990 -font [skin_font awesome_light [fixed_size 50]] -fill $::skin_text_colour -anchor center -initial_state hidden -tags {skin_icon_size_test icon_size_set} -textvariable {$::skin(icon_fav)}


#####################
### fav
####
add_icon_label_button fav1 $::skin_home_pages $::skin(button_x_fav) $::start_button_y 360 100 $::skin(icon_fav) {$::fav_label_fav1} {skin_load fav1}; set_button fav1 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav2 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 120] 360 100 $::skin(icon_fav) {$::fav_label_fav2} {skin_load fav2}; set_button fav2 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav3 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 240] 360 100 $::skin(icon_fav) {$::fav_label_fav3} {skin_load fav3}; set_button fav3 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav4 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 360] 360 100 $::skin(icon_fav) {$::fav_label_fav4} {skin_load fav4}; set_button fav4 icon_font [skin_font awesome_light [fixed_size 28]]
add_icon_label_button fav5 $::skin_home_pages $::skin(button_x_fav) [expr $::start_button_y + 480] 360 100 $::skin(icon_fav) {$::fav_label_fav5} {skin_load fav5}; set_button fav5 icon_font [skin_font awesome_light [fixed_size 28]]

add_icon_button fav1_edit $::skin_home_pages 1990 $::start_button_y 100 100 {$::skin(icon_edit)} {edit fav1}
add_icon_button fav2_edit $::skin_home_pages 1990 [expr $::start_button_y + 120] 100 100 {$::skin(icon_edit)} {edit fav2}
add_icon_button fav3_edit $::skin_home_pages 1990 [expr $::start_button_y + 240] 100 100 {$::skin(icon_edit)} {edit fav3}
add_icon_button fav4_edit $::skin_home_pages 1990 [expr $::start_button_y + 360] 100 100 {$::skin(icon_edit)} {edit fav4}
add_icon_button fav5_edit $::skin_home_pages 1990 [expr $::start_button_y + 480] 100 100 {$::skin(icon_edit)} {edit fav5}
set_button fav1_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav2_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav3_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav4_edit font [skin_font awesome_light [fixed_size 28]]
set_button fav5_edit font [skin_font awesome_light [fixed_size 28]]

set_favs_showing


### machine
dui add variable $::skin_home_pages 2410 [expr $::skin(button_y_machine) + 92] -font [skin_font D-font [fixed_size 264]] -fill $::skin_forground_colour -tags decent_icon -anchor e -textvariable {D}
dui add variable $::skin_home_pages 2330 [expr $::skin(button_y_machine) - 36] -font [skin_font font 15] -fill $::skin_button_label_colour  -anchor w -textvariable {[skin_group_head_heater_temperature_text]}
dui add variable $::skin_home_pages 2426 [expr $::skin(button_y_machine) + 60] -font [skin_font font 15] -fill $::skin_text_colour  -anchor w -textvariable {[skin_steamtemp_text]}
dui add variable $::skin_home_pages 2090 [expr $::skin(button_y_machine) + 186] -font [skin_font font 15] -fill $::skin_button_label_colour  -anchor w -textvariable {[skin_low_water]}

dui add variable espresso 2358 [expr $::skin(button_y_machine) + 28] -font [skin_font D-font [fixed_size 52]] -fill $::skin_brown -anchor n -tags espresso_pour -textvariable {e}
dui add variable "espresso water" 2366 [expr $::skin(button_y_machine) + 60] -font [skin_font D-font [fixed_size 52]] -fill $::skin_blue -anchor n -tags ewc -textvariable {c}
dui add variable flush 2358 [expr $::skin(button_y_machine) + 10] -font [skin_font D-font [fixed_size 52]] -fill $::skin_blue -anchor n -tags flush_motion -textvariable {[flush_motion]}
dui add variable steam 2420 [expr $::skin(button_y_machine) + 64] -font [skin_font D-font [fixed_size 40]] -fill $::skin_blue -anchor n -tags steam_motion -textvariable {[steam_motion]}
dui add variable water 2330 [expr $::skin(button_y_machine) - 20] -font [skin_font D-font [fixed_size 60]] -fill $::skin_blue -anchor n -tags water_motion -textvariable {w}

dui add variable $::skin_home_pages 2070 [expr $::skin(button_y_machine) - 36] -font [skin_font D-font [fixed_size 19]] -fill $::skin_button_label_colour -tags de1_btl_icon -anchor w -textvariable {$::skin(icon_bluetooth)}
dui add variable $::skin_home_pages 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font_bold 18] -fill $::skin_selected_colour -tags machine_state_text -width 220 -anchor center -justify center -textvariable {[string range $::skin_machine_state 0 18]}
dui add variable $::skin_home_pages 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font awesome_light [fixed_size 60]] -fill $::skin_red -tags machine_state -anchor center -textvariable {[skin_machine_state]}
dui add variable "steam" 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font 40] -fill $::skin_button_label_colour -anchor center -textvariable {[skin_steam_timer]}
dui add variable "flush" 2184 [expr $::skin(button_y_machine) + 40] -font [skin_font font 40] -fill $::skin_button_label_colour -anchor center -textvariable {[skin_flush_timer]}

add_clear_button settings_button off 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {set ::settings(active_settings_tab) settings_3; show_settings}
add_clear_button settings_button $::skin_action_pages 2060 [expr $::skin(button_y_machine) - 40] 350 300 {} {skin_start idle}

# extend timers
add_colour_button flush_extend flush [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {flush_extend}
add_colour_button steam_extend steam [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {steam_extend}


### scale

dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 120] -font [skin_font font 14] -fill $::skin_text_colour -anchor center -textvariable {[skin_scale_disconnected]}

add_colour_button scale_bg_shape $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 380 110 {} {do_nothing}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 108] [expr $::skin(button_y_scale) + 26] -font [skin_font D-font [fixed_size 19]] -fill $::skin_button_label_colour -tags scale_btl_icon -anchor w -textvariable {$::skin(icon_bluetooth)}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 112] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -textvariable {[skin_bean_weight]}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 270] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor e -textvariable {[skin_milk_weight]}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 64] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}

add_clear_button scale $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) 180 110 {} {scale_tare; catch {ble_connect_to_scale}}; set_button scale font [skin_font font_bold 18]; set_button scale label_fill $::skin_button_label_colour
add_clear_button bw $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 100 110 {$::skin(icon_bean)} {set_scale_weight_to_dose}; set_button bw font [skin_font D-font [fixed_size 42]]; set_button bw label_fill $::skin_button_label_colour
add_clear_button mw $::skin_home_pages [expr $::skin(button_x_scale) + 280] $::skin(button_y_scale) 100 110 {$::skin(icon_steam_timer)} {skin_steam_time_calc}; set_button mw font [skin_font D-font [fixed_size 42]]; set_button mw label_fill $::skin_button_label_colour

dui add canvas_item rect $::skin_home_pages [expr $::skin(button_x_scale) + 30] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 350] [expr $::skin(button_y_scale) - 8] -width 0 -fill $::skin_forground_colour -tags scale_line_1
dui add canvas_item rect $::skin_home_pages [expr $::skin(button_x_scale) + 130] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 250] [expr $::skin(button_y_scale) - 0] -width 0 -fill $::skin_forground_colour -tags scale_line_2
dui add canvas_item rect $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 104] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_3
dui add canvas_item rect $::skin_home_pages [expr $::skin(button_x_scale) + 276] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 280] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_4

add_colour_button auto_tare off [expr $::skin(button_x_scale) - 160] [expr $::skin(button_y_scale) + 4] 130 100 {[translate "auto tare"]} {toggle_auto_tare; skin_save skin}; set_button auto_tare state hidden

### sleep
#dui add variable $::skin_home_pages [expr $::skin(button_x_power) + 54] [expr $::skin(button_y_power) + 54] -font [skin_font D-font [fixed_size 68]] -fill $::skin_button_label_colour -anchor center -justify center -tags sleep_button -textvariable {p}
dui add variable $::skin_home_pages [expr $::skin(button_x_power) + 54] [expr $::skin(button_y_power) + 54] -font [skin_font D-font [fixed_size 68]] -fill $::skin_button_label_colour -anchor center -justify center -textvariable {p} -tags {sleep_button powerbutton headerbar}
#add_clear_button sleep_power_button off 10 10 220 200 {} {skin_power}
add_clear_button sleep_power_button off 10 10 220 200 {} {skin_power} headerbar
### ghc buttons ###

add_icon_label_button espresso_start off $::skin(button_x_espresso) $::skin(button_y_espresso) 340 100 $::skin(icon_espresso) {[translate "espresso"]} {skin_start espresso}
dui add variable off [expr $::skin(button_x_espresso) + 170] [expr $::skin(button_y_espresso) + 120] -font [skin_font font_bold 17] -fill $::skin_text_colour  -tags espresso_data_line_1 -anchor n -justify center -width 340 -textvariable {$::settings(profile_title)\r[skin_dose] [translate " : "] [skin_saw]g\r[skin_extraction_ratio]}
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
add_clear_button stop_espresso_icon espresso $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 100 100 {$::skin(icon_espresso)} {do_nothing}; set_button stop_espresso_icon font [skin_font D-font [fixed_size 40]]; set_button stop_espresso_icon label_fill $::skin_selected_colour
add_clear_button stop_espresso_skip espresso [expr $::skin(button_x_espresso) + 100] [expr 50 + $::skin(button_y_espresso)] 300 100 {[translate "next step"]} {move_to_the_next_step}; set_button stop_espresso_skip font [skin_font font_bold 18]; set_button stop_espresso_skip label_fill $::skin_button_label_colour
add_clear_button stop_espresso_stop espresso [expr $::skin(button_x_espresso) + 400] [expr 50 + $::skin(button_y_espresso)] 220 100 {[translate "stop"]} {skin_start idle}; set_button stop_espresso_stop font [skin_font font_bold 18]; set_button stop_espresso_stop label_fill $::skin_button_label_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 400] [expr 50 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 404] [expr $::skin(button_y_espresso) + 150] -tags stop_espresso_stop_s1 -width 0 -fill $::skin_background_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 100] [expr 50 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 104] [expr $::skin(button_y_espresso) + 150] -tags stop_espresso_stop_s2 -width 0 -fill $::skin_background_colour

add_icon_label_button stop_steam steam $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 {$::skin(icon_steam)} {[steam_stop_label]} {skin_start idle}; set_button stop_steam icon_fill $::skin_selected_colour

add_icon_label_button stop_flush flush $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 {$::skin(icon_flush)} {[translate "stop"]} {skin_start idle}; set_button stop_flush icon_fill $::skin_selected_colour

add_icon_label_button stop_water water $::skin(button_x_espresso) [expr 50 + $::skin(button_y_espresso)] 340 100 {$::skin(icon_water)} {[translate "stop"]} {skin_start idle}; set_button stop_water icon_fill $::skin_selected_colour

add_clear_button settings_button $::skin_action_pages 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {skin_start idle}

### sleep power page

dui add variable "skin_power" 1280 840 -font [skin_font font_bold 24] -fill $::skin_text_colour -anchor center -justify center -width 880 -textvariable {[translate "Going to sleep in"]... [skin_power_off_timer]}
add_clear_button power_cancel skin_power 0 0 2560 1600 {} {set_next_page off off; start_idle}
add_icon_label_button power_sleep skin_power 950 600 260 100 {$::skin(icon_sleep)} {sleep} {skin_sleep}; set_button power_sleep icon_font [skin_font awesome_light [fixed_size 26]]
add_icon_label_button power_exit skin_power 1370 600 260 100 {$::skin(icon_x)} {exit} {skin_exit}; set_button power_exit icon_font [skin_font awesome_light [fixed_size 26]]

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

blt::vector create skin_espresso_temperature_basket skin_espresso_temperature_mix skin_espresso_temperature_goal
blt::vector create compare_espresso_elapsed compare_espresso_pressure compare_espresso_flow compare_espresso_flow_weight compare_espresso_state_change

set ::key_font_size [fixed_size 14]
#dui add variable "espresso" 1950 [expr $::skin(graph_key_y) + 12] -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor e -textvariable {[skin_espresso_elapsed_timer]s}

dui add canvas_item oval "off espresso flush water" $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 42] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -tags pressure_icon
dui add canvas_item oval "off espresso flush water" [expr $::skin(graph_key_x) + 196 + 40] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 196 + 42 + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -tags flow_icon
dui add canvas_item oval "off espresso flush water" [expr $::skin(graph_key_x) + 446 + 80] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 446 + 42 + 80] [expr $::skin(graph_key_y) + 18] -outline $::skin_brown -fill $::skin_brown -tags weight_icon
dui add canvas_item oval "off espresso flush water" [expr $::skin(graph_key_x) + 724 + 120] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 724 + 42 + 120] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -tags temperature_icon
dui add canvas_item oval "off espresso flush water" [expr $::skin(graph_key_x) + 976 + 160] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 976 + 42 + 160] [expr $::skin(graph_key_y) + 18] -outline $::skin_yellow -fill $::skin_yellow -tags resistance_icon
dui add canvas_item oval "off espresso flush water" [expr $::skin(graph_key_x) + 1196 + 200] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 1196 + 42 + 200] [expr $::skin(graph_key_y) + 18] -outline $::::skin_grey -fill $::::skin_grey -tags steps_icon
dui add variable "off flush water" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags pressure_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Pressure"]}
dui add variable "off flush water" [expr $::skin(graph_key_x) + 216 + 38 + 40] [expr $::skin(graph_key_y) + 12] -tags flow_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Flow rate"] ([translate "in"])}
dui add variable "off flush water" [expr $::skin(graph_key_x) + 466 + 38 + 80] [expr $::skin(graph_key_y) + 12] -tags weight_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Scale rate"] ([translate "out"])}
dui add variable "off flush water" [expr $::skin(graph_key_x) + 744 + 38 + 120] [expr $::skin(graph_key_y) + 12] -tags temperature_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Temperature"]}
dui add variable "off flush water" [expr $::skin(graph_key_x) + 996 + 38 + 160] [expr $::skin(graph_key_y) + 12] -tags resistance_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Resistance"]}
dui add variable "off flush water" [expr $::skin(graph_key_x) + 1216 + 38 + 200] [expr $::skin(graph_key_y) + 12] -tags steps_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Steps"]}
dui add variable "espresso" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags pressure_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(pressure)]]bar}
dui add variable "espresso" [expr $::skin(graph_key_x) + 216 + 38 + 40] [expr $::skin(graph_key_y) + 12] -tags flow_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(flow)]]ml/s}
dui add variable "espresso" [expr $::skin(graph_key_x) + 466 + 38 + 80] [expr $::skin(graph_key_y) + 12] -tags weight_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(scale_weight_rate)]]g/s}
dui add variable "espresso" [expr $::skin(graph_key_x) + 744 + 38 + 120] [expr $::skin(graph_key_y) + 12] -tags temperature_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[group_head_heater_temperature_text]}
dui add variable "espresso" [expr $::skin(graph_key_x) + 996 + 38 + 160] [expr $::skin(graph_key_y) + 12] -tags resistance_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[translate "Resistance"]}
dui add variable "espresso" [expr $::skin(graph_key_x) + 1216 + 38 + 200] [expr $::skin(graph_key_y) + 12] -tags steps_data -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {Steps}
dui add dbutton "off espresso flush water" $::skin(graph_key_x) [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags pressure_key_button \
    -command {toggle_graph pressure}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 226 + 40] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags flow_key_button \
    -command {toggle_graph flow}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 474 + 80] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags weight_key_button \
    -command {toggle_graph weight}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 752 + 120] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags temperature_key_button \
    -command {toggle_graph temperature}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1004 + 160] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags resistance_key_button \
    -command {toggle_graph resistance}
dui add dbutton "off espresso flush water" [expr $::skin(graph_key_x) + 1224 + 200] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -tags steps_key_button \
    -command {toggle_graph steps}

set ::main_graph_height [rescale_y_skin 1010]
add_de1_widget "off flush water" graph 30 520 {
    set ::home_espresso_graph $widget
    bind $widget [platform_button_press] {
        if {$::main_graph_height == [rescale_y_skin 1010]} {
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
            $::home_espresso_graph element configure compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change
        }
    }

    $widget element create compare_pressure -xdata compare_espresso_elapsed -ydata compare_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 4] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_flow -xdata compare_espresso_elapsed -ydata compare_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 4] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_weight -xdata compare_espresso_elapsed -ydata compare_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color #a2a293  -pixels 0;


    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata skin_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata skin_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10  12}  -hide 0;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags main_graph

add_de1_variable "off" 1950 1550 -font [skin_font font 15] -fill $::skin_text_colour -anchor e -tags live_graph_data -textvariable {[skin_graph_info]}

add_de1_widget "espresso" graph 30 520 {
    set ::home_espresso_graph_espresso $widget
    bind $widget [platform_button_press] {
    }
    $widget element create home_pressure_goal -xdata espresso_elapsed -ydata espresso_pressure_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique)  -pixels 0 -dashes {2 2};
    $widget element create home_flow_goal  -xdata espresso_elapsed -ydata espresso_flow_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0  -dashes {2 2};
    $widget element create home_temperature_goal -xdata espresso_elapsed -ydata skin_espresso_temperature_goal -symbol none -label "" -linewidth [rescale_x_skin 5] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -dashes {2 2};
    $widget element create home_pressure -xdata espresso_elapsed -ydata espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_green  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_flow  -xdata espresso_elapsed -ydata espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_weight  -xdata espresso_elapsed -ydata espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 10] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_temperature -xdata espresso_elapsed -ydata skin_espresso_temperature_basket -symbol none -label ""  -linewidth [rescale_x_skin 9] -color $::skin_red -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create home_resistance  -xdata espresso_elapsed -ydata espresso_resistance -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_yellow -smooth $::settings(live_graph_smoothing_technique) -pixels 0
    $widget element create home_steps -xdata espresso_elapsed -ydata espresso_state_change -label "" -linewidth [rescale_x_skin 2] -color $::skin_grey  -pixels 0 ;

    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0;
    $widget axis configure y -color $::skin_y_axis_colour -tickfont [skin_font font [fixed_size 14]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10  12}  -hide 0;
    $widget grid configure -color $::skin_grid_colour -dashes {2 12} -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin 1950] -height [rescale_y_skin 1010] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -initial_state normal -tags main_graph_espresso

add_de1_variable "espresso" 1950 1550 -font [skin_font font 15] -fill $::skin_text_colour -anchor e -textvariable {[skin_graph_live_info]}

setup_home_espresso_graph

### graph toggle
dui add variable "off" [expr $::skin(graph_key_x) + 1580 + 38 + 200] [expr $::skin(graph_key_y) + 12] -tags main_graph_toggle_label -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor e -justify center -textvariable {$::main_graph_showing}

dui add dbutton off [expr $::skin(graph_key_x) + 1580 + 38] [expr $::skin(graph_key_y) ] \
    -bwidth 200 -bheight 110 -initial_state normal -tags main_graph_toggle_button \
    -command {toggle_main_graph}


dui add canvas_item oval steam $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 42] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -tags steam_steam_pressure_icon
dui add canvas_item oval steam [expr $::skin(graph_key_x) + 196 + 40] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 196 + 42 + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -tags steam_steam_flow_icon
dui add canvas_item oval steam [expr $::skin(graph_key_x) + 446 + 80] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 446 + 42 + 80] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -tags steam_steam_temperature_icon
dui add variable "steam" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags steam_steam_pressure_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(pressure)]]bar}
dui add variable "steam" [expr $::skin(graph_key_x) + 216 + 38 + 40] [expr $::skin(graph_key_y) + 12] -tags steam_steam_flow_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[round_to_one_digits [expr $::de1(flow)]]ml/s}
dui add variable "steam" [expr $::skin(graph_key_x) + 466 + 38 + 80] [expr $::skin(graph_key_y) + 12] -tags steam_steam_temperature_text -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -textvariable {[steamtemp_text]}

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


dui add canvas_item oval off $::skin(graph_key_x) [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 42] [expr $::skin(graph_key_y) + 18] -outline $::skin_green -fill $::skin_green -tags steam_steam_pressure_icon_off -initial_state hidden
dui add canvas_item oval off [expr $::skin(graph_key_x) + 196 + 40] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 196 + 42 + 40] [expr $::skin(graph_key_y) + 18] -outline $::skin_blue -fill $::skin_blue -tags steam_steam_flow_icon_off -initial_state hidden
dui add canvas_item oval off [expr $::skin(graph_key_x) + 446 + 80] [expr $::skin(graph_key_y) + 2] [expr $::skin(graph_key_x) + 446 + 42 + 80] [expr $::skin(graph_key_y) + 18] -outline $::skin_red -fill $::skin_red -tags steam_steam_temperature_icon_off -initial_state hidden
dui add variable "off" [expr $::skin(graph_key_x) + 58] [expr $::skin(graph_key_y) + 12] -tags steam_steam_pressure_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -textvariable {[translate "Pressure"]}
dui add variable "off" [expr $::skin(graph_key_x) + 216 + 38 + 40] [expr $::skin(graph_key_y) + 12] -tags steam_steam_flow_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -textvariable {[translate "Flow rate"]}
dui add variable "off" [expr $::skin(graph_key_x) + 466 + 38 + 80] [expr $::skin(graph_key_y) + 12] -tags steam_steam_temperature_text_off -font [skin_font font $::key_font_size] -fill $::skin_text_colour -anchor w -justify center -width 880 -initial_state hidden -textvariable {[translate "Temperature"]}

dui add dbutton off $::skin(graph_key_x) [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -initial_state hidden -tags steam_steam_pressure_button_off \
    -command {toggle_graph steam_pressure}
dui add dbutton off [expr $::skin(graph_key_x) + 226 + 40] [expr $::skin(graph_key_y) - 50] \
    -bwidth 210 -bheight 110 -initial_state hidden -tags steam_steam_flow_button_off \
    -command {toggle_graph steam_flow}
dui add dbutton off [expr $::skin(graph_key_x) + 474 + 80] [expr $::skin(graph_key_y) - 50] \
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

add_icon_button fav1_x_button off 1970 $::start_button_y 100 100 {$::skin(icon_x)} {cancel fav1}
set_button fav1_x_button label_fill $::skin_red
set_button fav1_x_button state hidden
add_icon_button fav1_tick_button off 1870 $::start_button_y 100 100 {$::skin(icon_tick)} {skin_save fav1}
set_button fav1_tick_button label_fill $::skin_green
set_button fav1_tick_button state hidden
add_icon_button fav2_x_button off 1970 [expr $::start_button_y + 120] 100 100 {$::skin(icon_x)} {cancel fav2}
set_button fav2_x_button label_fill $::skin_red
set_button fav2_x_button state hidden
add_icon_button fav2_tick_button off 1870 [expr $::start_button_y + 120] 100 100 {$::skin(icon_tick)} {skin_save fav2}
set_button fav2_tick_button label_fill $::skin_green
set_button fav2_tick_button state hidden
add_icon_button fav3_x_button off 1970 [expr $::start_button_y + 240] 100 100 {$::skin(icon_x)} {cancel fav3}
set_button fav3_x_button label_fill $::skin_red
set_button fav3_x_button state hidden
add_icon_button fav3_tick_button off 1870 [expr $::start_button_y + 240] 100 100 {$::skin(icon_tick)} {skin_save fav3}
set_button fav3_tick_button label_fill $::skin_green
set_button fav3_tick_button state hidden
add_icon_button fav4_x_button off 1970 [expr $::start_button_y + 360] 100 100 {$::skin(icon_x)} {cancel fav4}
set_button fav4_x_button label_fill $::skin_red
set_button fav4_x_button state hidden
add_icon_button fav4_tick_button off 1870 [expr $::start_button_y + 360] 100 100 {$::skin(icon_tick)} {skin_save fav4}
set_button fav4_tick_button label_fill $::skin_green
set_button fav4_tick_button state hidden
add_icon_button fav5_x_button off 1970 [expr $::start_button_y + 480] 100 100 {$::skin(icon_x)} {cancel fav5}
set_button fav5_x_button label_fill $::skin_red
set_button fav5_x_button state hidden
add_icon_button fav5_tick_button off 1870 [expr $::start_button_y + 480] 100 100 {$::skin(icon_tick)} {skin_save fav5}
set_button fav5_tick_button label_fill $::skin_green
set_button fav5_tick_button state hidden

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav1_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav1_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav1

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav2_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav2_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav2

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav3_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav3_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav3

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav4_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav4_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav4

add_de1_widget "off" entry 1720 -1001 {
	set ::globals(fav5_entry_button) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 10 -font [skin_font font [fixed_size 20]]  -borderwidth 1 -bg $::skin_forground_colour -foreground $::skin_button_label_colour -tags fav5_entry -validate all -validatecommand {expr {[string length %P] <= 12}} -textvariable ::fav_label_fav5

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

add_colour_button favs_number off $::beverage_type_x 1350 260 100 {[translate "show"] $::skin(favs_to_show) favs} {toggle_favs_to_show}; set_button favs_number state hidden

########### Workflow Settings ########

### index
dui add dtext off [expr $::skin(button_x_espresso) + 170] 500 -tags espresso_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_forground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_steam) + 170] 500 -tags steam_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_forground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_flush) + 170] 500 -tags flush_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_forground_colour -anchor s -initial_state hidden
dui add dtext off [expr $::skin(button_x_water) + 170] 500 -tags water_index -text $::skin(icon_index) -font [skin_font D-font [fixed_size 30]] -fill $::skin_forground_colour -anchor s -initial_state hidden

dui add canvas_item arc off 120 494 220 542 -start 90 -width [expr {4 * $::settings(screen_size_width) / 1280}] -style {} -style arc -outline $::skin_forground_colour -tags {index_shape_1 index_shape} -initial_state hidden
dui add canvas_item arc off 1480 494 1580 542 -start 0 -width [expr {4 * $::settings(screen_size_width) / 1280}] -style {} -style arc -outline $::skin_forground_colour -tags {index_shape_3 index_shape} -initial_state hidden
dui add canvas_item rect off 170 490 1530 498 -width 0 -fill $::skin_forground_colour -tags {index_shape_2 index_shape} -initial_state hidden

add_clear_button espresso_index_button off $::skin(button_x_espresso) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button espresso_index_button state hidden
add_clear_button steam_index_button off $::skin(button_x_steam) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button steam_index_button state hidden
add_clear_button flush_index_button off $::skin(button_x_flush) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button flush_index_button state hidden
add_clear_button water_index_button off $::skin(button_x_water) $::skin(button_y_steam) 340 380  {} {show_graph}; set_button water_index_button state hidden


### close button
add_clear_button wf_close off 150 450 1490 130 {[translate "tap here to close"]} {show_graph}; set_button wf_close state hidden; set_button wf_close font [skin_font font 16]
#########################################################
### espresso
dui add dtext off 310 580 -tags wf_heading_profile -text [translate "Profile"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button select_profile off 200 620 220 100 {[translate "select"]} {goto_profile_list}
add_colour_button edit_profile off 200 820 220 100 {[translate "edit"]} {goto_profile_wizard}

# Dose
set ::wf_dose_x 160
dui add dtext off [expr 840 + $::wf_dose_x] 580 -tags wf_heading_bean_weight -text [translate "Bean weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_dose_minus off [expr 730 + $::wf_dose_x] 620 100 100 {\Uf106} {adjust dose 1}; set_button wf_dose_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_plus off [expr 730 + $::wf_dose_x] 820 100 100 {\Uf107} {adjust dose -1}; set_button wf_dose_plus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_minus_10 off [expr 850 + $::wf_dose_x] 620 100 100 {\Uf106} {adjust dose 0.1}; set_button wf_dose_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_dose_plus_10 off [expr 850 + $::wf_dose_x] 820 100 100 {\Uf107} {adjust dose -0.1}; set_button wf_dose_plus_10 font [skin_font awesome_light [fixed_size 34]]
dui add variable off [expr 840 + $::wf_dose_x] 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_beans -anchor center -textvariable {[round_to_one_digits $::settings(grinder_dose_weight)]g}

dui add dtext off [expr 840 - $::wf_dose_x] 580 -tags wf_heading_bean_cup -text [translate "Dose cup"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_bean_cup_button off [expr 730 - $::wf_dose_x] 620 220 100 {$::skin(bean_cup_g)g} {set_bean_cup_weight}
add_icon_button wf_info_button off [expr 630 - $::wf_dose_x] 620 100 100 {$::skin(icon_info)} {show_wf_espresso_info}



# Espresso SAW
dui add dtext off 1340 580 -tags wf_heading_espresso_weight -text [translate "Espresso weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_espresso_minus_10 off 1230 620 100 100 {\Uf106} {adjust saw 10}; set_button wf_espresso_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_plus_10 off 1230 820 100 100 {\Uf107} {adjust saw -10}; set_button wf_espresso_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_minus off 1350 620 100 100 {\Uf106} {adjust saw 1}; set_button wf_espresso_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_espresso_plus off 1350 820 100 100 {\Uf107} {adjust saw -1}; set_button wf_espresso_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_espresso -anchor center -textvariable {[skin_saw]g}

add_icon_button wf_save_saw_x_button off 1230 960 100 100 {$::skin(icon_x)} {wf_cancel_profile_saw}
set_button wf_save_saw_x_button label_fill $::skin_red
set_button wf_save_saw_x_button state hidden
add_icon_button wf_save_saw_tick_button off 1350 960 100 100 {$::skin(icon_tick)} {wf_update_profile_saw}
set_button wf_save_saw_tick_button label_fill $::skin_green
set_button wf_save_saw_tick_button state hidden

dui add shape rect off 100 560 1700 900 -width 1 -outline $::skin_forground_colour -fill $::skin_background_colour -tags {wf_espresso_info_bg wf_espresso_info} -initial_state hidden
dui add dtext off 180 680 -tags {wf_dose_cup_text_line_1 wf_espresso_info} -width 1400 -text [translate "If you prefer to tare without the dose cup, set a dose cup weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 180 740 -tags {wf_dose_cup_text_line_2 wf_espresso_info} -text [translate "If you prefer to tare with the dose cup, set the dose cup weight to 0.0"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 180 800 -tags {wf_dose_cup_text_line_3 wf_espresso_info} -text [translate "Tap the dose cup button to set it to the current scale weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w -initial_state hidden
dui add dtext off 900 580 -tags {wf_dose_cup_text_line_4 wf_espresso_info} -width 1400 -text [translate "tap to close"] -font [skin_font font 18] -fill $::skin_text_colour -anchor center -initial_state hidden
add_clear_button {wf_espresso_info_close_button wf_espresso_info} off 100 560 1600 340 {} {hide_wf_espresso_info}; set_button {wf_espresso_info_close_button wf_espresso_info} state hidden

### profile notes
#dui add dtext off 230 1050 -tags wf_heading_profile_notes -text [translate "Profile Notes"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor nw
#dui add variable off 230 1110 -fill $::skin_text_colour  -font [skin_font font 18] -tags wf_profile_notes -anchor nw -justify left -width 1230 -textvariable {$::settings(profile_notes)}


hide_espresso_settings
###########################################################


### steam
dui add dtext off 340 580 -tags wf_heading_steam_heater -text [translate "Steam heater"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_steam_off_bg off 230 620 220 100 {} {}
add_clear_button wf_steam_off off 230 620 110 100 {[translate "off"]} {toggle_steam_heater}; set_button wf_steam_off font [skin_font font_bold 18]
add_clear_button wf_steam_on off 340 620 110 100 {[translate "on"]} {toggle_steam_heater}; set_button wf_steam_on font [skin_font font_bold 18]
dui add dtext off 840 580 -tags wf_heading_milk_jug -text [translate "Milk jug"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center -initial_state hidden

add_icon_label_button wf_steam_jug_s off 710 620 280 100 {$::skin(icon_jug)} {small} {set_jug s}
add_icon_button jug_s_edit off 610 620 100 100 {$::skin(icon_edit)} {show_jug jug_s}
set_button jug_s_edit font [skin_font awesome_light [fixed_size 28]]
set_button jug_s_edit state hidden
add_colour_button jug_s_weight off 710 620 280 100 {current $::skin(jug_s)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_s_weight font [skin_font font 16]
add_icon_button jug_s_x_button off 610 620 100 100 {$::skin(icon_x)} {hide_jug jug_s}
set_button jug_s_x_button label_fill $::skin_red
add_icon_button jug_s_tick_button off 510 620 100 100 {$::skin(icon_tick)} {skin_save jug_s}
set_button jug_s_tick_button label_fill $::skin_green

add_icon_label_button wf_steam_jug_m off 710 740 280 100 {$::skin(icon_jug)} {medium} {set_jug m}
add_icon_button jug_m_edit off 610 740 100 100 {$::skin(icon_edit)} {show_jug jug_m}
set_button jug_m_edit font [skin_font awesome_light [fixed_size 28]]
add_colour_button jug_m_weight off 710 740 280 100 {current $::skin(jug_m)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_m_weight font [skin_font font 16]
add_icon_button jug_m_x_button off 610 740 100 100 {$::skin(icon_x)} {hide_jug jug_m}
set_button jug_m_x_button label_fill $::skin_red
add_icon_button jug_m_tick_button off 510 740 100 100 {$::skin(icon_tick)} {skin_save jug_m}
set_button jug_m_tick_button label_fill $::skin_green

add_icon_label_button wf_steam_jug_l off 710 860 280 100 {$::skin(icon_jug)} {large} {set_jug l}
add_icon_button jug_l_edit off 610 860 100 100 {$::skin(icon_edit)} {show_jug jug_l}
set_button jug_l_edit font [skin_font awesome_light [fixed_size 28]]
add_colour_button jug_l_weight off 710 860 280 100 {current $::skin(jug_l)g\r new [round_to_one_digits $::de1(scale_sensor_weight)]g} {}
set_button jug_l_weight font [skin_font font 16]
add_icon_button jug_l_x_button off 610 860 100 100 {$::skin(icon_x)} {hide_jug jug_l}
set_button jug_l_x_button label_fill $::skin_red
add_icon_button jug_l_tick_button off 510 860 100 100 {$::skin(icon_tick)} {skin_save jug_l}
set_button jug_l_tick_button label_fill $::skin_green


dui add dtext off 1340 580 -tags wf_heading_steam_timer -text [translate "Steam timer"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_steam_timer_minus_10 off 1230 620 100 100 {\Uf106} {adjust steam 10}; set_button wf_steam_timer_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_plus_10 off 1230 820 100 100 {\Uf107} {adjust steam -10}; set_button wf_steam_timer_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_minus off 1350 620 100 100 {\Uf106} {adjust steam 1}; set_button wf_steam_timer_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_steam_timer_plus off 1350 820 100 100 {\Uf107} {adjust steam -1}; set_button wf_steam_timer_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_steam_timer_setting -anchor center -textvariable {[round_to_integer $::settings(steam_timeout)]s}

dui add dtext off 180 1160 -tags wf_heading_steam_calibrate -text [translate "Calibrate steam timer by weight"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1400 -tags wf_milk_weight_text_line_1 -width 1400 -text [translate "1: Place the empty jug on the scale, tap the pencil next to the respective jug button to set the weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1470 -tags wf_milk_weight_text_line_2 -text [translate "2: Place the jug with milk on the scale, tap the milk jug button to set the weight"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w
dui add dtext off 180 1520 -tags wf_milk_weight_text_line_3 -text [translate "3: Steam the milk to your prefered temperature, enter the time it took"] -font [skin_font font 18] -fill $::skin_text_colour -anchor w

add_icon_label_button wf_steam_jug_milk off 180 1230 280 100 {$::skin(icon_milk)} {[round_to_integer $::skin(milk_g)]g} {set ::skin(milk_g) [round_to_integer [expr $::de1(scale_sensor_weight) - $::skin(jug_g)]] }
add_icon_button wf_steam_cal_time_minus off 600 1230 100 100 {$::skin(icon_minus)} {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) - 1]]; if {$::skin(milk_s) < 5} {set ::skin(milk_s) 5}}; set_button wf_steam_cal_time_minus font [skin_font D-font [fixed_size 34]]
add_icon_label_button wf_steam_jug_time off 700 1230 280 100 {$::skin(icon_timer)} {[round_to_integer $::skin(milk_s)]s} {set ::skin(milk_s) [steam_pour_timer]}; set_button wf_steam_jug_time icon_font [skin_font awesome_light [fixed_size 34]]
add_icon_button wf_steam_cal_time_plus off 975 1230 100 100 {$::skin(icon_plus)} {set ::skin(milk_s) [round_to_integer [expr $::skin(milk_s) + 1]]; if {$::skin(milk_s) > 120} {set ::skin(milk_s) 120}}; set_button wf_steam_cal_time_plus font [skin_font D-font [fixed_size 34]]

dui add variable off 840 1210 -fill $::skin_text_colour  -font [skin_font font 16] -tags wf_last_steam_time -anchor center -textvariable {[translate "last steam"] [steam_pour_timer]s}


hide_steam_settings

### flush
dui add dtext off 340 580 -tags wf_heading_flush_flow -text [translate "Flow rate"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_flush_flow_minus_10 off 230 620 100 100 {\Uf106} {adjust flush_flow 1}; set_button wf_flush_flow_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_plus_10 off 230 820 100 100 {\Uf107} {adjust flush_flow -1}; set_button wf_flush_flow_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_minus off 350 620 100 100 {\Uf106} {adjust flush_flow 0.1}; set_button wf_flush_flow_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_flush_flow_plus off 350 820 100 100 {\Uf107} {adjust flush_flow -0.1}; set_button wf_flush_flow_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_flush_flow_setting -anchor center -textvariable {[round_to_one_digits $::settings(flush_flow)][translate "ml/s"]}

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

dui add dtext off 840 580 -tags wf_heading_water_temperature -text [translate "Temperature"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_temperature_minus_10 off 730 620 100 100 {\Uf106} {adjust water_temperature 10}; set_button wf_water_temperature_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_plus_10 off 730 820 100 100 {\Uf107} {adjust water_temperature -10}; set_button wf_water_temperature_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_minus off 850 620 100 100 {\Uf106} {adjust water_temperature 1}; set_button wf_water_temperature_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_temperature_plus off 850 820 100 100 {\Uf107} {adjust water_temperature -1}; set_button wf_water_temperature_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 840 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_temperature_setting -anchor center -textvariable {[skin_temperature_measurement $::settings(water_temperature)]}

dui add dtext off 1340 580 -tags wf_heading_water_volume -text [translate "Volume"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor center
add_colour_button wf_water_volume_minus_10 off 1230 620 100 100 {\Uf106} {adjust water_volume 10}; set_button wf_water_volume_minus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_plus_10 off 1230 820 100 100 {\Uf107} {adjust water_volume -10}; set_button wf_water_volume_plus_10 font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_minus off 1350 620 100 100 {\Uf106} {adjust water_volume 1}; set_button wf_water_volume_minus font [skin_font awesome_light [fixed_size 34]]
add_colour_button wf_water_volume_plus off 1350 820 100 100 {\Uf107} {adjust water_volume -1}; set_button wf_water_volume_plus font [skin_font awesome_light [fixed_size 34]]
dui add variable off 1340 770 -fill $::skin_text_colour  -font [skin_font font_bold 24] -tags wf_water_volume_setting -anchor center -textvariable {[skin_water_volume]}

hide_water_settings

### message pages
dui add variable "plugin_message" 360 600 -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -width 2000 -textvariable {$::plugin_change_message}
add_clear_button plugin_message plugin_message 0 0 2560 1600 {} {app_exit}

dui add variable "restart_message" 1280 600 -font [skin_font font_bold 28] -fill $::skin_text_colour -anchor center -justify center -textvariable {[translate "Restart the app for your changes to take effect"]\r\r\r[translate "Tap anywhere to exit"]}
add_clear_button restart_message restart_message 0 0 2560 1600 {} {skin_exit}

### screen saver page
dui add dbutton saver 0 0 \
    -bwidth 2560 -bheight 1600 \
    -command {set_next_page off off; start_idle}

### DYE
proc skin_dye_button {} {
	if {"DYE" in $::settings(enabled_plugins) == 1 && $::settings(skin) == "DSx2" && $::skin(theme) == "Damian"} {
	    add_icon_label_button dye_bg off $::skin(button_x_dye) $::skin(button_y_dye) 230 100 $::skin(icon_edit) {dye} {}; set_button dye_bg icon_font [skin_font awesome_light [fixed_size 26]]
	    variable widgets
		variable settings
   		set widgets(launch_dye) [dui add dbutton off \
		$::skin(button_x_dye) $::skin(button_y_dye) \
		-bwidth 230 -bheight 100 -tags launch_dye \
		-command [list ::plugins::DYE::open -which_shot default -coords {2400 1030} -anchor e] \
		-longpress_cmd [::list ::plugins::DYE::open -which_shot dialog -coords \{2400 1050\} -anchor e] \
		-tap_pad {4 4 40 4} -page_title [translate {Select a shot to describe}]]
	}
}
skin_dye_button

### manual
#################

check_heading
skin_load $::skin(auto_load_fav)
setup_steam_switch_state
check_current_jug
check_app_extensions
workflow $::skin(workflow)
dui add variable off 0 0 -fill $::skin_text_colour  -font [skin_font font 14] -tags loop -anchor center -textvariable {[skin_loop]}

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
#add_de1_variable "off" 2540 1580 -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {$::settings(skin) v${::skin_version}}
add_de1_variable "off" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {$::settings(skin) v${::skin_version}}
