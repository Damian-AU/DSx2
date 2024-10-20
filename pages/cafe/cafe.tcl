#### header
dui add shape rect $::skin_home_pages 0 0 2560 46 -width 0 -fill $::skin_foreground_colour -tags {headerbar_bg0 headerbar}
skin_add_cafe_header_shape $::skin_home_pages 580 -10 680 100 1880 100 1980 -10 $::skin_foreground_colour {headerbar_bg1 headerbar headerbar_heading}
dui add variable $::skin_home_pages 1280 0 -font [skin_font font [fixed_size 38]] -fill $::skin_button_label_colour -anchor n -tags {heading headerbar} -textvariable {$::skin_heading}
dui add dtext $::skin_home_pages 1280 90 -font [skin_font awesome_light 26] -fill $::skin_button_label_colour -anchor center -text \uf141 -tags {heading_dots headerbar}
dui add variable $::skin_home_pages 2540 4 -font [skin_font font [fixed_size 15]] -fill $::skin_button_label_colour -anchor ne -tags {headerbar_clock headerbar} -textvariable {[skin_clock]}
dui add variable $::skin_home_pages 2100 6 -font [skin_font awesome [fixed_size 14]] -fill $::skin_button_label_colour -anchor ne -tags {wifi_icon headerbar} -textvariable {\uf1eb [wifi_status]}
dui add variable $::skin_home_pages 2190 4 -font [skin_font awesome_light [fixed_size 18]] -fill $::skin_button_label_colour -anchor ne -tags {battery_icon headerbar} -textvariable {[skin_battery_status]}
add_clear_button heading_button off 0 10 2560 100 {} {skin_lock header_settings} headerbar
add_clear_button close_heading_settings off 0 10 2560 100 {} {hide_header_settings; show_graph; skin_save skin}; set_button close_heading_settings state hidden

## settings
add_colour_button edit_heading_button off 100 620 340 100 {[translate "toggle heading"]} {toggle_c_heading}; set_button edit_heading_button state hidden
add_de1_widget "off" entry 450 -1001 {
	set ::globals(edit_heading_button) $widget
	bind $widget <Return> {set ::skin(heading) $::skin_heading; hide_android_keyboard}
	bind $widget <Leave>  {set ::skin(heading) $::skin_heading; hide_android_keyboard}
    } -width 32 -font [skin_font font [fixed_size 16]] -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -tags heading_entry -textvariable ::skin_heading

add_colour_button edit_colour_theme_button off 100 750 340 100 {[translate "colour theme"]\r$::skin(colour_theme)} {skin_colour_theme_selection}; set_button edit_colour_theme_button state hidden
add_colour_button edit_icon_size_button off 100 880 340 100 {$::icon_size_state [translate "icon"]\r[translate "calibration"]} {toggle_icon_size_settings}; set_button edit_icon_size_button state hidden
set ::skin_flow_cal_ui_added 0
add_colour_button edit_flow_rate_cal_button off 100 1010 340 100 {[translate "flow rate"]\r[translate "calibrator"]} {page_show GFC}; set_button edit_flow_rate_cal_button state hidden
add_colour_button edit_theme_button off 100 1140 340 100 {[translate "switch to"]\r[translate "Original theme"]} {set ::skin(theme) "Damian"; skin_save skin; page_show restart_message}; set_button edit_theme_button state hidden
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
dui add dtext off 540 756 -tags {toggle_history_text settings_history_button_option settings_toggles} -text [translate "show history button"] -width 400 -font [skin_font font_bold 18] -fill $::skin_text_colour -disabledfill $::skin_disabled_colour -anchor nw -initial_state hidden
dui add dtoggle off 920 750 -anchor nw -tags {toggle_history_button settings_history_button_option settings_toggles} \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -initial_state hidden \
    -variable ::skin(show_history_button) \
    -command {do_nothing}

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

dui add dtext off 540 956 -text [translate "Fav buttons"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor nw -tags {c_set_fav_text settings_toggles}
dui add variable off 990 956 -fill $::skin_text_colour -font [skin_font font 18] -anchor n -tags {c_set_fav_variable settings_toggles} -textvariable {$::skin(number_of_favs)}

dui add dbutton off 820 926 \
    -bwidth 100 -bheight 100 -tags {c_set_fav_button_minus settings_toggles} \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {decrease_fav_buttons}
dui add dbutton off 1060 926 \
    -bwidth 100 -bheight 100 -tags {c_set_fav_button_plus settings_toggles} \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {increase_fav_buttons}

add_colour_button edit_pass_code_button off 1200 620 340 100 {[translate "pass code"]} {skin_delete_handle_keypress; page_show pass_code_settings} {settings_toggles}; set_button edit_pass_code_button state hidden


### Favs
#set ::skin_button_radius 30
create_fav_buttons

dui add dbutton off 1880 [expr $::fav_y + 0] -bwidth 120 -bheight 100 \
    -shape rect -fill $::skin_background_colour -tags {fav_back_1 fav_controls} \
    -labelvariable \Uf106 -label_font [skin_font awesome 38] -label_fill $::skin_forground_colour -label_pos {0.5 0.5} \
    -command {shift_fav_list -1}
dui add dbutton off 1880 [expr $::fav_y + 110] -bwidth 120 -bheight 100 \
    -shape rect -fill $::skin_background_colour -tags {fav_forward_1 fav_controls} \
    -labelvariable \Uf107 -label_font [skin_font awesome 38] -label_fill $::skin_forground_colour -label_pos {0.5 0.5} \
    -command {shift_fav_list 1}


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
if {$::skin(show_weight_chartable) == 0} {
    $::home_espresso_graph element configure home_weight_chartable -hide 1
    $::home_espresso_graph element configure compare_weight_chartable -hide 1
} else {
    $::home_espresso_graph element configure home_weight_chartable -hide 0
    $::home_espresso_graph element configure compare_weight_chartable -hide 0
}

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
add_clear_button settings_button off 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {skin_lock skin_show_settings} {}

# extend timers
add_colour_button flush_extend flush [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {flush_extend}
add_colour_button steam_extend steam [expr $::skin(button_x_machine) - 20] [expr $::skin(button_y_machine) - 220] 100 100 {+5s} {steam_extend}
################

### scale
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 120] -font [skin_font font 14] -fill $::skin_text_colour -anchor center -textvariable {[skin_scale_disconnected]}
add_colour_button scale_bg_shape $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 380 110 {} {do_nothing}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 108] [expr $::skin(button_y_scale) + 26] -font [skin_font D-font [fixed_size 19]] -fill $::skin_button_label_colour -tags scale_btl_icon -anchor w -textvariable {$::skin(icon_bluetooth)}
dui add variable off [expr $::skin(button_x_scale) + 112] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor w -textvariable {[skin_bean_weight]}
dui add variable off [expr $::skin(button_x_scale) + 270] [expr $::skin(button_y_scale) + 24] -font [skin_font font 14] -fill $::skin_button_label_colour -anchor e -textvariable {[skin_milk_weight]}
dui add variable $::skin_home_pages [expr $::skin(button_x_scale) + 190] [expr $::skin(button_y_scale) + 64] -font [skin_font font_bold 20] -fill $::skin_button_label_colour -anchor center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}
add_clear_button scale $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) 180 110 {} {scale_tare; catch {ble_connect_to_scale}}; set_button scale font [skin_font font_bold 18]; set_button scale label_fill $::skin_button_label_colour
add_clear_button bw $::skin_home_pages $::skin(button_x_scale) $::skin(button_y_scale) 100 110 $::skin(icon_bean) {set_scale_weight_to_dose}; set_button bw font [skin_font D-font [fixed_size 42]]; set_button bw label_fill $::skin_button_label_colour
add_clear_button mw $::skin_home_pages [expr $::skin(button_x_scale) + 280] $::skin(button_y_scale) 100 110 $::skin(icon_steam_timer) {skin_steam_time_calc}; set_button mw font [skin_font D-font [fixed_size 42]]; set_button mw label_fill $::skin_button_label_colour
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 30] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 350] [expr $::skin(button_y_scale) - 8] -width 0 -fill $::skin_foreground_colour -disabledfill $::skin_disabled_colour -tags {scale_line_1 scale_shape}
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 130] [expr $::skin(button_y_scale) - 18] [expr $::skin(button_x_scale) + 250] [expr $::skin(button_y_scale) - 0] -width 0 -fill $::skin_foreground_colour -disabledfill $::skin_disabled_colour -tags {scale_line_2 scale_shape}
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 100] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 104] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_3
dui add shape rect $::skin_home_pages [expr $::skin(button_x_scale) + 276] $::skin(button_y_scale) [expr $::skin(button_x_scale) + 280] [expr $::skin(button_y_scale) + 110] -width 0 -fill $::skin_background_colour -tags scale_line_4
add_colour_button auto_tare off [expr $::skin(button_x_scale) - 160] [expr $::skin(button_y_scale) + 4] 130 100 {[translate "auto tare"]} {toggle_auto_tare; skin_save skin}; set_button auto_tare state hidden
#################

### ghc buttons ###
dui add shape round off 2060 [expr $::start_button_pos_1 - 38 + $::start_button_shift] -bwidth 460 -bheight 42 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {workflow_type_bg}
dui add variable off 2280 [expr $::start_button_pos_1 - 30 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_text_colour -anchor c -textvariable {[workflow_type_text]} -tags {workflow_type_text}

dui add shape round off 2060 [expr $::start_button_pos_1 + $::start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {espresso_button_bg espresso_start_buttons start_buttons_eg1}
dui add shape round off 2060 [expr $::start_button_pos_2 + $::start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {flush_button_bg flush_start_buttons start_buttons_fg1}
dui add shape round off 2060 [expr $::start_button_pos_3 + $::start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {steam_button_bg steam_start_buttons start_buttons_sg1}
dui add shape round off 2060 [expr $::start_button_pos_4 + $::start_button_shift] -bwidth 460 -bheight 120 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {water_button_bg water_start_buttons start_buttons_wg1}

dui add variable off 2080 [expr $::start_button_pos_1 + 60 + $::start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_espresso)} -tags {espresso_button_icon espresso_start_buttons start_buttons_eg2}
dui add variable off 2080 [expr $::start_button_pos_2 + 60 + $::start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_flush)} -tags {flush_button_icon flush_start_buttons start_buttons_fg2}
dui add variable off 2080 [expr $::start_button_pos_3 + 60 + $::start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_steam)} -tags {steam_button_icon steam_start_buttons start_buttons_sg2}
dui add variable off 2080 [expr $::start_button_pos_4 + 60 + $::start_button_shift] -font [skin_font D-font 42] -fill $::skin_button_label_colour -anchor w -textvariable {$::skin(icon_water)} -tags {water_button_icon water_start_buttons start_buttons_wg2}
proc c_espresso_button_data {} {
    if {$::settings(beverage_type) == "cleaning"} {
        return "[maxstring $::settings(profile_title) 28]"
    } else {
        return "[maxstring $::settings(profile_title) 28]\r[skin_dose] [translate " : "] [skin_saw]g [skin_extraction_ratio]"
    }
}
dui add variable off 2180 [expr $::start_button_pos_1 + 60 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -tags espresso_data_line_1 -anchor w -justify left -tags {espresso_button_variable espresso_start_buttons start_buttons_eg2} -width 340 -textvariable {[c_espresso_button_data]}
dui add variable off 2180 [expr $::start_button_pos_2 + 60 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -tags flush_data_line_1 -anchor w -justify left -tags {flush_button_variable flush_start_buttons start_buttons_fg2} -width 340 -textvariable {[round_to_integer $::settings(flush_seconds)]s}
dui add variable off 2180 [expr $::start_button_pos_3 + 60 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -tags steam_data_line_1 -anchor w -justify left -tags {steam_button_variable steam_start_buttons start_buttons_sg2} -width 340 -textvariable {[skin_steam_settings_info]   $::skin(jug_size)\r[skin_steam_text $::settings(steam_timeout)]}
dui add variable off 2180 [expr $::start_button_pos_4 + 60 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_button_label_colour -tags water_data_line_1 -anchor w -justify left -tags {water_button_variable water_start_buttons start_buttons_wg2} -width 340 -textvariable {[skin_water_settings_info]}

dui add dbutton off 2040 [expr $::start_button_pos_1 + $::start_button_shift] \
    -bwidth 500 -bheight 120 -tags {espresso_button espresso_start_buttons start_buttons_eg1} -initial_state normal \
    -command {skin_start espresso} -longpress_cmd {skin_lock page_show workflow_settings}
dui add dbutton off 2040 [expr $::start_button_pos_2 + $::start_button_shift] \
    -bwidth 500 -bheight 120 -tags {flush_button flush_start_buttons start_buttons_fg1} -initial_state normal \
    -command {skin_start flush} -longpress_cmd {skin_lock page_show workflow_settings}
dui add dbutton off 2040 [expr $::start_button_pos_3 + $::start_button_shift] \
    -bwidth 500 -bheight 120 -tags {steam_button steam_start_buttons start_buttons_sg1} -initial_state normal \
    -command {skin_start steam} -longpress_cmd {skin_lock page_show workflow_settings}
dui add dbutton off 2040 [expr $::start_button_pos_4 + $::start_button_shift] \
    -bwidth 500 -bheight 120 -tags {water_button water_start_buttons start_buttons_wg1} -initial_state normal \
    -command {skin_start water} -longpress_cmd {skin_lock page_show workflow_settings}

dui add shape round off 2060 [expr $::auto_load_data_pos_3 - 20 + $::start_button_shift] -bwidth 460 -bheight 40 -width 0 -radius $::skin_button_radius -fill $::skin_foreground_colour -tags {auto_load_data_home_bg auto_load_data start_buttons}
dui add variable off 2080 [expr $::auto_load_data_pos_3 + $::start_button_shift] -font [skin_font font 16] -fill $::skin_text_colour -tags {auto_load_data_home auto_load_data start_buttons} -anchor w -textvariable {[c_current_auto_load]}

### stop buttons
add_colour_button stop_espresso_bg espresso $::skin(button_x_espresso) [expr 100 + $::skin(button_y_espresso)] 620 100 {} {do_nothing}
add_clear_button stop_espresso_icon espresso $::skin(button_x_espresso) [expr 100 + $::skin(button_y_espresso)] 100 100 $::skin(icon_espresso) {do_nothing}; set_button stop_espresso_icon font [skin_font D-font [fixed_size 40]]; set_button stop_espresso_icon label_fill $::skin_selected_colour
add_clear_button stop_espresso_skip espresso [expr $::skin(button_x_espresso) + 100] [expr 100 + $::skin(button_y_espresso)] 300 100 [translate "next step"] {move_to_the_next_step}; set_button stop_espresso_skip font [skin_font font_bold 18]; set_button stop_espresso_skip label_fill $::skin_button_label_colour
add_clear_button stop_espresso_stop espresso [expr $::skin(button_x_espresso) + 400] [expr 100 + $::skin(button_y_espresso)] 220 100 [translate "stop"] {skin_start idle}; set_button stop_espresso_stop font [skin_font font_bold 18]; set_button stop_espresso_stop label_fill $::skin_button_label_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 400] [expr 100 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 404] [expr $::skin(button_y_espresso) + 200] -tags stop_espresso_stop_s1 -width 0 -fill $::skin_background_colour
dui add canvas_item rect espresso [expr $::skin(button_x_espresso) + 100] [expr 100 + $::skin(button_y_espresso)] [expr $::skin(button_x_espresso) + 104] [expr $::skin(button_y_espresso) + 200] -tags stop_espresso_stop_s2 -width 0 -fill $::skin_background_colour
add_icon_label_button stop_steam steam $::skin(button_x_espresso) [expr 100 + $::skin(button_y_espresso)] 340 100 $::skin(icon_steam) {[steam_stop_label]} {skin_start idle}; set_button stop_steam icon_fill $::skin_selected_colour
add_icon_label_button stop_flush flush $::skin(button_x_espresso) [expr 100 + $::skin(button_y_espresso)] 340 100 $::skin(icon_flush) {[translate "stop"]} {skin_start idle}; set_button stop_flush icon_fill $::skin_selected_colour
add_icon_label_button stop_water water $::skin(button_x_espresso) [expr 100 + $::skin(button_y_espresso)] 340 100 $::skin(icon_water) {[translate "stop"]} {skin_start idle}; set_button stop_water icon_fill $::skin_selected_colour
add_clear_button machine_stop_button $::skin_action_pages 2060 [expr $::skin(button_y_machine) - 90] 400 300 {} {skin_start idle}
#####################

set ::auto_load_toggle_switch_state 0
set ::auto_load_fav_backup none
### fav update message
dui add shape rect off 0 400 2000 1600 -width 0 -fill $::skin_background_colour -tags {c_fav_confirm_bg_cover c_fav_confirm} -initial_state hidden
dui add dbutton off 0 0 -bwidth 2560 -bheight 1600 -initial_state hidden -tags {c_fav_confirm_close_button c_fav_confirm} -command {do_nothing}
dui add variable off 1000 660 -font [skin_font font_bold 22] -fill $::skin_text_colour -anchor c -textvariable {$::c_fav_key button} -tags {c_fav_confirm_auto_fav_number c_fav_confirm} -initial_state hidden
dui add dtext off 710 790 -text [translate "Button label"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w -tags {c_fav_confirm_auto_toggle_label_text c_fav_confirm} -initial_state hidden
dui add dtext off 710 900 -text [translate "Auto Load"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w -tags {c_fav_confirm_auto_toggle_text c_fav_confirm} -initial_state hidden
dui add dtoggle off 1020 900 -anchor w \
    -tags {c_fav_confirm_auto c_fav_confirm} -initial_state hidden \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::auto_load_toggle_switch_state \
    -command {}
dui add dbutton off 690 1200 \
    -bwidth 260 -bheight 100 -tags {c_fav_confirm_cancel c_fav_confirm} -initial_state hidden \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {CANCEL} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {hide_c_fav_entry; show_graph_2; dui item config off c_fav_confirm -initial_state hidden -state hidden}
dui add dbutton off 1050 1200 \
    -bwidth 260 -bheight 100 -tags {c_fav_confirm_save c_fav_confirm} -initial_state hidden \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {SAVE} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {c_save_fav}

### sleep / power button
dui add dbutton off 2200 80 \
    -bwidth 160 -bheight 150 -tags {pwr_button_sleep pwr_button} \
    -labelvariable {p} -label_font [skin_font D-font [fixed_size 80]] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {set_next_page off off; set ::current_espresso_page "off"; start_sleep} -longpress_cmd {skin_exit}

dui add dbutton "espresso flush steam water" 2200 80 \
    -bwidth 160 -bheight 150 -tags {pwr_button_stop pwr_button} \
    -labelvariable {p} -label_font [skin_font D-font [fixed_size 80]] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {skin_start idle}

### pass code page
dui add dtext pass_code_settings 1280 300 -text [translate "Pass code settings"] -font [skin_font font_bold 22] -fill $::skin_text_colour -anchor c

dui add dtext pass_code_settings 810 450 -text [translate "on/off"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add dtoggle pass_code_settings 1020 450 -anchor w \
    -background $::skin_forground_colour -foreground $::skin_button_label_colour -selectedbackground $::skin_forground_colour -disabledbackground $::skin_disabled_colour -selectedforeground  $::skin_selected_colour -disabledforeground $::skin_disabled_colour \
    -variable ::skin(pass_code_on) \
    -command {do_nothing}

dui add dtext pass_code_settings 810 550 -text [translate "Pass code"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
add_de1_widget pass_code_settings entry 1020 522 {
	set ::globals(skin_lock_set_pass) $widget
	bind $widget <Return> {hide_android_keyboard}
	bind $widget <Leave>  {hide_android_keyboard}
    } -width 32 -font [skin_font font [fixed_size 16]] -borderwidth 1 -bg $::skin_foreground_colour -foreground $::skin_button_label_colour -textvariable ::skin(pass_code)

dui add dtext pass_code_settings 810 650 -text [translate "Auto lock"] -font [skin_font font_bold 18] -fill $::skin_text_colour -anchor w
dui add variable pass_code_settings 1190 650 -fill $::skin_text_colour -font [skin_font font 18] -anchor center -textvariable {$::skin(unlock_time)s}

dui add dbutton pass_code_settings 1020 600 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_minus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust unlock_time -5} -longpress_cmd {adjust unlock_time -60}
dui add dbutton pass_code_settings 1260 600 \
    -bwidth 100 -bheight 100 \
    -label $::skin(icon_plus) -label_font [skin_font D-font 18] -label_fill $::skin_text_colour -label_pos {0.5 0.5} \
    -command {adjust unlock_time 5} -longpress_cmd {adjust unlock_time 60}


dui add dbutton pass_code_settings 1180 1440 \
    -bwidth 200 -bheight 100 \
    -shape round -radius $::skin_button_radius -fill $::skin_foreground_colour \
    -labelvariable {EXIT} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -command {page_show off; skin_save skin; skin_reset_handle_keypress}


### screen saver page
dui add dbutton saver 0 0 \
    -bwidth 2560 -bheight 1600 \
    -command {set_next_page off off; start_idle}

### history buttons
dui add dtext $::skin_home_pages 20 4 -font [skin_font font 15] -fill $::skin_button_label_colour -anchor nw -tags {c_skin_history_button_label headerbar} -text [translate "History"]
dui add dbutton off 0 0 \
    -bwidth 180 -bheight 100 -tags {c_skin_history_button_button headerbar} \
    -command {skin_history} -longpress_cmd {skin_history_2}

### message pages
dui add variable "plugin_message" 360 600 -font [skin_font font 20] -fill $::skin_text_colour -anchor w -width 2000 -textvariable {$::plugin_change_message}
add_clear_button plugin_message plugin_message 0 0 2560 1600 {} {app_exit}

dui add dtext "restart_message" 1280 600 -font [skin_font font 28] -fill $::skin_text_colour -anchor center -justify center -text [translate "Restart the app for your changes to take effect"]\r\r\r[translate "Tap anywhere to exit"]
add_clear_button restart_message restart_message 0 0 2560 1600 {} {skin_exit}

#################
if {$::android != 1} {
    start_idle
}
initialize_fav_list
check_c_heading
dui add variable off 0 0 -fill $::skin_text_colour  -font [skin_font font 14] -tags loop -anchor center -textvariable {[skin_loop]}

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
        #show_graph
        set_next_page off off;
        page_show water
    } elseif {$textstate == "HotWaterRinse"} {
        set ::flush_timer_backup $::settings(flush_seconds)
        #show_graph
        set_next_page off off;
        page_show flush
    }
}
dui add variable "off espresso" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {$::settings(skin) v${::skin_version}}

