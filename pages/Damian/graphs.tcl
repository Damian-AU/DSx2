set ::skin_graph_multiplier .8

add_de1_widget off graph 40 1350 {
    set ::cache_graph_a $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_y_skin 100]} {
            toggle_cache_y2_axis
        } else {
            toggle_graph_compare graph_a
        }
    }
    $widget element create cache_a_espresso_pressure -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_a_espresso_flow -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_a_espresso_flow_weight -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_a_espresso_state_change -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create cache_a_espresso_flow_2x -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create cache_a_espresso_flow_weight_2x -xdata graph_a_espresso_elapsed -ydata graph_a_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin [skin_graph_size 620]] -height [rescale_y_skin [skin_graph_size 260]] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags graph_a

add_de1_widget off graph 520 1350 {
    set ::cache_graph_b $widget
    bind $widget [platform_button_press] {
set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_y_skin 100]} {
            toggle_cache_y2_axis
        } else {
            toggle_graph_compare graph_b
        }
    }
    $widget element create cache_b_espresso_pressure -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_b_espresso_flow -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_b_espresso_flow_weight -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_b_espresso_state_change -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create cache_b_espresso_flow_2x -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create cache_b_espresso_flow_weight_2x -xdata graph_b_espresso_elapsed -ydata graph_b_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

    $widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin [skin_graph_size 620]] -height [rescale_y_skin [skin_graph_size 260]] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags graph_b

add_de1_widget off graph 1000 1350 {
    set ::cache_graph_c $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_y_skin 100]} {
            toggle_cache_y2_axis
        } else {
            toggle_graph_compare graph_c
        }
    }
    $widget element create cache_c_espresso_pressure -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_c_espresso_flow -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_c_espresso_flow_weight -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_c_espresso_state_change -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create cache_c_espresso_flow_2x -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create cache_c_espresso_flow_weight_2x -xdata graph_c_espresso_elapsed -ydata graph_c_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

$widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin [skin_graph_size 620]] -height [rescale_y_skin [skin_graph_size 260]] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags graph_c

add_de1_widget off graph 1480 1350 {
    set ::cache_graph_d $widget
    bind $widget [platform_button_press] {
        set x [translate_coordinates_finger_down_x %x]
        if {$x < [rescale_y_skin 100]} {
            toggle_cache_y2_axis
        } else {
            toggle_graph_compare graph_d
        }
    }
    $widget element create cache_d_espresso_pressure -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_pressure -symbol none -label "" -linewidth [rescale_x_skin 6] -color #18c37e  -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_d_espresso_flow -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_flow -symbol none -label "" -linewidth [rescale_x_skin 6] -color #4e85f4 -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_d_espresso_flow_weight -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_flow_weight -symbol none -label "" -linewidth [rescale_x_skin 4] -color #a2693d -smooth $::settings(live_graph_smoothing_technique) -pixels 0;
    $widget element create cache_d_espresso_state_change -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_state_change -label "" -linewidth [rescale_x_skin 3] -color #AAAAAA  -pixels 0 ;
    $widget axis configure x -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0;
    $widget axis configure y -color $::skin_x_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 10 -subdivisions 5 -majorticks {0  2  4  6  8  10}  -hide 0;

    $widget element create cache_d_espresso_flow_2x -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_flow_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_blue -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget element create cache_d_espresso_flow_weight_2x -xdata graph_d_espresso_elapsed -ydata graph_d_espresso_flow_weight_2x -symbol none -label "" -linewidth [rescale_x_skin 6] -color $::skin_brown -smooth $::settings(live_graph_smoothing_technique) -pixels 0 -hide 0;
    $widget axis configure y2 -color $::skin_y2_axis_colour -tickfont [skin_font font [fixed_size 8]] -min 0.0 -max 5 -subdivisions 1 -majorticks {0  1  2  3  4  5  6} -hide 0;

$widget grid configure -color $::skin_mini_grid_colour -linewidth 1
} -plotbackground $::skin_background_colour -width [rescale_x_skin [skin_graph_size 620]] -height [rescale_y_skin [skin_graph_size 260]] -borderwidth 1 -background $::skin_background_colour -plotrelief flat -tags graph_d

.can itemconfigure graph_a -state hidden
.can itemconfigure graph_b -state hidden
.can itemconfigure graph_c -state hidden
.can itemconfigure graph_d -state hidden
dui item config off graph_a -initial_state hidden
dui item config off graph_b -initial_state hidden
dui item config off graph_c -initial_state hidden
dui item config off graph_d -initial_state hidden


load_graph_cache
restore_cache_graphs
set ::cache_lable_height 1572
dui add variable off 60 $::cache_lable_height -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cga_p -textvariable {[name_length $::graph_cache(graph_a_profile) 21]}
dui add variable off 510 $::cache_lable_height -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cga_d -textvariable {[cache_date_time_format $::graph_cache(graph_a_time)]}

dui add variable off 540 $::cache_lable_height -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgb_p -textvariable {[name_length $::graph_cache(graph_b_profile) 21]}
dui add variable off 990 $::cache_lable_height -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgb_d -textvariable {[cache_date_time_format $::graph_cache(graph_b_time)]}

dui add variable off 1020 $::cache_lable_height -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgc_p -textvariable {[name_length $::graph_cache(graph_c_profile) 21]}
dui add variable off 1470 $::cache_lable_height -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgc_d -textvariable {[cache_date_time_format $::graph_cache(graph_c_time)]}

dui add variable off 1500 $::cache_lable_height -anchor "w" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgd_p -textvariable {[name_length $::graph_cache(graph_d_profile) 21]}
dui add variable off 1950 $::cache_lable_height -anchor "e" -font [skin_font font [fixed_size 12]] -fill $::skin_text_colour -initial_state hidden -tags cgd_d -textvariable {[cache_date_time_format $::graph_cache(graph_d_time)]}
