# Setup the UI integration with the DSx2_cafe skin.

set ::DSx2_cafe_settings_next_shot_coords {500 100}
set ::DSx2_cafe_settings_last_shot_coords {2120 100}

proc ::plugins::DYE::setup_ui_DSx {} {
	variable widgets
	variable settings

	### DUI ASPECTS & STYLES ###
	dui theme add DSx
	dui theme set DSx

	# Skin colors
	set background_c $::skin_background_colour
	set foreground_c $::skin_forground_colour
	set text_c $::skin_text_colour
	set button_label_c $::skin_button_label_colour
	set header_button_c $::skin_button_label_colour
	set unselected_c $::skin_background_colour
	set selected_c $::skin_selected_colour
	set error_c $::skin_red
	set fill_and_insert_c $::skin_text_colour
	set button_bg_c $::skin_forground_colour
	set disabled_c $::skin_grey

	# General DSx aspects
	dui font add_dir [skin_directory]/fonts/

	set disabled_colour "#35363d"
	set default_font_size 15
	dui aspect set -theme DSx [subst {
		page.bg_img {}
		page.bg_color $::skin_background_colour

		dialog_page.bg_shape round_outline
		dialog_page.bg_color $::skin_background_colour
		dialog_page.fill $::skin_background_colour
		dialog_page.outline white
		dialog_page.width 1

		font.font_family "$::skin(font_name)"
		font.font_size $default_font_size

		dtext.font_family "$::skin(font_name)"
		dtext.font_size $default_font_size
		dtext.fill $::skin_text_colour
		dtext.disabledfill $disabled_colour
		dtext.anchor nw
		dtext.justify left

		dtext.fill.remark $::skin_orange
		dtext.fill.error $::skin_red
		dtext.font_family.section_title "$::skin(font_name)"

		dtext.font_family.page_title "$::skin(font_name)"
		dtext.font_size.page_title 24
		dtext.fill.page_title $::skin_text_colour
		dtext.anchor.page_title center
		dtext.justify.page_title center

		symbol.font_family "Font Awesome 6 Pro-Regular-400"
		symbol.font_size 55
		symbol.fill $::skin_text_colour
		symbol.disabledfill $disabled_colour
		symbol.anchor nw
		symbol.justify left

		symbol.font_size.small 24
		symbol.font_size.medium 40
		symbol.font_size.big 55

		dbutton.debug_outline yellow
		dbutton.fill {}
		dbutton.disabledfill {}
		dbutton.outline white
		dbutton.disabledoutline $disabled_colour
		dbutton.activeoutline $::skin_orange
		dbutton.width 0

		dbutton_label.pos {0.5 0.5}
		dbutton_label.font_size [expr {$default_font_size+1}]
		dbutton_label.anchor center
		dbutton_label.justify center
		dbutton_label.fill $::skin_text_colour
		dbutton_label.disabledfill $disabled_colour

		dbutton_label1.pos {0.5 0.8}
		dbutton_label1.font_size [expr {$default_font_size-1}]
		dbutton_label1.anchor center
		dbutton_label1.justify center
		dbutton_label1.fill $::skin_text_colour
		dbutton_label1.activefill $::skin_orange
		dbutton_label1.disabledfill $disabled_colour

		dbutton_symbol.pos {0.2 0.5}
		dbutton_symbol.font_size 28
		dbutton_symbol.anchor center
		dbutton_symbol.justify center
		dbutton_symbol.fill $::skin_text_colour
		dbutton_symbol.disabledfill $disabled_colour

		dbutton.shape.insight_ok outline
		dbutton.width.insight_ok 4
		dbutton.arc_offset.insight_ok 20
		dbutton.bwidth.insight_ok 480
		dbutton.bheight.insight_ok 118
		dbutton_label.font_family.insight_ok "$::skin(font_name)"
		dbutton_label.font_size.insight_ok 19

		dclicker.fill {}
		dclicker.disabledfill {}
		dclicker_label.pos {0.5 0.5}
		dclicker_label.font_size 16
		dclicker_label.fill $::skin_text_colour
		dclicker_label.anchor center
		dclicker_label.justify center

		entry.relief sunken
		entry.bg $::skin_background_colour
		entry.disabledbackground $disabled_colour
		entry.width 2
		entry.foreground $::skin_text_colour
		entry.disabledforeground black
		entry.font_size $default_font_size
		entry.insertbackground orange

		multiline_entry.relief sunken
		multiline_entry.foreground $::skin_text_colour
		multiline_entry.bg $::skin_background_colour
		multiline_entry.width 2
		multiline_entry.font_family "$::skin(font_name)"
		multiline_entry.font_size $default_font_size
		multiline_entry.width 15
		multiline_entry.height 5
		multiline_entry.insertbackground orange
		multiline_entry.wrap word

		dcombobox.relief sunken
		dcombobox.bg $::skin_background_colour
		dcombobox.width 2
		dcombobox.font_family "$::skin(font_name)"
		dcombobox.font_size $default_font_size

		dbutton_dda.shape {}
		dbutton_dda.fill {}
		dbutton_dda.bwidth 70
		dbutton_dda.bheight 65
		dbutton_dda.symbol "sort-down"

		dbutton_dda_symbol.pos {0.5 0.2}
		dbutton_dda_symbol.font_size 24
		dbutton_dda_symbol.anchor center
		dbutton_dda_symbol.justify center
		dbutton_dda_symbol.fill $::skin_text_colour
		dbutton_dda_symbol.disabledfill $disabled_colour

		dcheckbox.font_family "Font Awesome 6 Pro"
		dcheckbox.font_size 18
		dcheckbox.fill $::skin_text_colour
		dcheckbox.anchor nw
		dcheckbox.justify left

		dcheckbox_label.pos "e 30 0"
		dcheckbox_label.anchor w
		dcheckbox_label.justify left

		listbox.relief sunken
		listbox.borderwidth 1
		listbox.foreground $::skin_text_colour
		listbox.background $::skin_background_colour
		listbox.selectforeground $::skin_background_colour
		listbox.selectbackground $::skin_text_colour
		listbox.selectborderwidth 1
		listbox.disabledforeground $disabled_colour
		listbox.selectmode browse
		listbox.justify left

		listbox_label.pos "wn -10 0"
		listbox_label.anchor ne
		listbox_label.justify right

		listbox_label.font_family.section_title "$::skin(font_name)"

		scrollbar.orient vertical
		scrollbar.width 120
		scrollbar.length 300
		scrollbar.sliderlength 120
		scrollbar.from 0.0
		scrollbar.to 1.0
		scrollbar.bigincrement 0.2
		scrollbar.borderwidth 1
		scrollbar.showvalue 0
		scrollbar.resolution 0.01
		scrollbar.background $::skin_text_colour
		scrollbar.foreground white
		scrollbar.troughcolor $::skin_background_colour
		scrollbar.relief flat
		scrollbar.borderwidth 0
		scrollbar.highlightthickness 0

		dscale.orient horizontal
		dscale.foreground "#4e85f4"
		dscale.background "#7f879a"
		dscale.sliderlength 75

		scale.orient horizontal
		scale.foreground "#FFFFFF"
		scale.background $::skin_text_colour
		scale.troughcolor $::skin_background_colour
		scale.showvalue 0
		scale.relief flat
		scale.borderwidth 0
		scale.highlightthickness 0
		scale.sliderlength 125
		scale.width 150

		drater.fill $::skin_text_colour
		drater.disabledfill $disabled_colour
		drater.font_size 24

		rect.fill.insight_back_box $::skin_background_colour
		rect.width.insight_back_box 0
		line.fill.insight_back_box_shadow $::skin_background_colour
		line.width.insight_back_box_shadow 2
		rect.fill.insight_front_box $::skin_background_colour
		rect.width.insight_front_box 0

		graph.plotbackground $::skin_background_colour
		graph.borderwidth 1
		graph.background white
		graph.plotrelief raised
		graph.plotpady 0
		graph.plotpadx 10

		text.bg $::skin_background_colour
		text.foreground $::skin_text_colour
		text.font_size $default_font_size
		text.relief flat
		text.highlightthickness 1
		text.insertbackground orange
		text.wrap word

		dselector.radius 40
		dselector.fill $::skin_background_colour
		dselector.selectedfill $::skin_text_colour
		dselector.outline $::skin_text_colour
		dselector.selectedoutline $::skin_text_colour
		dselector.label_fill $::skin_text_colour
		dselector.label_selectedfill $::skin_background_colour

		dtoggle.width 120
		dtoggle.height 68
		dtoggle.outline_width 0
		dtoggle.background $foreground_c
		dtoggle.foreground $button_label_c
		dtoggle.outline $button_label_c
		dtoggle.selectedbackground $foreground_c
		dtoggle.selectedforeground $selected_c
		dtoggle.selectedoutline $selected_c
		dtoggle.disabledbackground $disabled_c
		dtoggle.disabledforeground $button_label_c
		dtoggle.disabledoutline $button_label_c
	}]

	# dui_number_editor page styles
	dui aspect set -theme DSx {
		dbutton.shape.dne_clicker outline
		dbutton.bwidth.dne_clicker 120
		dbutton.bheight.dne_clicker 140
		dbutton.fill.dne_clicker {}
		dbutton.width.dne_clicker 3
		dbutton.anchor.dne_clicker center
		dbutton_symbol.pos.dne_clicker {0.5 0.4}
		dbutton_symbol.anchor.dne_clicker center
		dbutton_symbol.font_size.dne_clicker 20
		dbutton_label.pos.dne_clicker {0.5 0.8}
		dbutton_label.font_size.dne_clicker 10
		dbutton_label.anchor.dne_clicker center

		dbutton.shape.dne_pad_button outline
		dbutton.bwidth.dne_pad_button 280
		dbutton.bheight.dne_pad_button 220
		dbutton.fill.dne_pad_button {}
		dbutton.width.dne_pad_button 3
		dbutton.anchor.dne_pad_button nw
		dbutton_label.pos.dne_pad_button {0.5 0.5}
		dbutton_label.font_family.dne_pad_button notosansuibold
		dbutton_label.font_size.dne_pad_button 24
		dbutton_label.anchor.dne_pad_button center
	}

	# DUI confirm dialog styles
	dui aspect set -theme DSx {
		dbutton.shape.dui_confirm_button outline
		dbutton.bheight.dui_confirm_button 100
		dbutton.width.dui_confirm_button 1
		dbutton.arc_offset.dui_confirm_button 20
	}

	# Menu dialogs
	dui aspect set -theme DSx [subst {
		dtext.font_size.menu_dlg_title +1
		dtext.anchor.menu_dlg_title center
		dtext.justify.menu_dlg_title center

		dbutton.shape.menu_dlg_close rect
		dbutton.fill.menu_dlg_close {}
		dbutton.symbol.menu_dlg_close xmark
		dbutton_symbol.pos.menu_dlg_close {0.5 0.5}
		dbutton_symbol.anchor.menu_dlg_close center
		dbutton_symbol.justify.menu_dlg_close center
		dbutton_symbol.fill.menu_dlg_close white

		dbutton.shape.menu_dlg_btn rect
		dbutton.fill.menu_dlg_btn {}
		dbutton.disabledfill.menu_dlg_btn {}
		dbutton_label.pos.menu_dlg_btn {0.25 0.4}
		dbutton_label.anchor.menu_dlg_btn w
		dbutton_label.fill.menu_dlg_btn $::skin_text_colour
		dbutton_label.disabledfill.menu_dlg_btn $disabled_colour

		dbutton_label1.pos.menu_dlg_btn {0.25 0.78}
		dbutton_label1.anchor.menu_dlg_btn w
		dbutton_label1.fill.menu_dlg_btn #bbb
		dbutton_label1.disabledfill.menu_dlg_btn $disabled_colour
		dbutton_label1.font_size.menu_dlg_btn -3

		dbutton_symbol.pos.menu_dlg_btn {0.15 0.5}
		dbutton_symbol.anchor.menu_dlg_btn center
		dbutton_symbol.fill.menu_dlg_btn white
		dbutton_symbol.disabledfill.menu_dlg_btn $disabled_colour

		line.fill.menu_dlg_sepline #ddd
		line.width.menu_dlg_sepline 1

		dtext.fill.menu_dlg $::skin_text_colour
		dtext.disabledfill.menu_dlg $disabled_colour
		dcheckbox.fill.menu_dlg $::skin_text_colour
		dcheckbox.disabledfill.menu_dlg $disabled_colour
		dcheckbox_label.fill.menu_dlg $::skin_text_colour
		dcheckbox_label.disabledfill.menu_dlg $disabled_colour

		dbutton.shape.menu_dlg outline
		dbutton.arc_offset.menu_dlg 25
		dbutton.width.menu_dlg 3
	}]

#	dui aspect set { dbutton.width 3 }
	# DYE-specific styles
	dui aspect set -style dsx_settings {dbutton.shape outline dbutton.bwidth 384 dbutton.bheight 192 dbutton.width 3
		dbutton_symbol.pos {0.2 0.5} dbutton_symbol.font_size 37
		dbutton_label.pos {0.65 0.5} dbutton_label.font_size 17
		dbutton_label1.pos {0.65 0.8} dbutton_label1.font_size 16}

	dui aspect set -style dsx_midsize {dbutton.shape outline dbutton.bwidth 220 dbutton.bheight 140 dbutton.width 6 dbutton.arc_offset 15
		dbutton_label.pos {0.7 0.5} dbutton_label.font_size 14 dbutton_symbol.font_size 24 dbutton_symbol.pos {0.25 0.5} }

	dui aspect set -style dsx_archive {dbutton.shape outline dbutton.bwidth 180 dbutton.bheight 110 dbutton.width 6
		canvas_anchor nw anchor nw dbutton.arc_offset 12 dbutton_label.pos {0.7 0.5} dbutton_label.font_size 14
		dbutton_symbol.font_size 24 dbutton_symbol.pos {0.3 0.5} }

	set bold_font [dui aspect get dtext font_family -theme default -style bold]
	dui aspect set -style dsx_done [list dbutton.shape outline dbutton.bwidth 220 dbutton.bheight 140 dbutton.width 5 \
		dbutton_label.pos {0.5 0.5} dbutton_label.font_size 20 dbutton_label.font_family $bold_font]

	dui aspect set -style dye_main_nav_button [subst { dbutton.shape {} dbutton.fill {} dbutton.disabledfill {}
		dbutton_symbol.font_size 28 dbutton_symbol.fill $text_c dbutton_symbol.disabledfill $disabled_colour}]

	dui aspect set -type dtext -style section_header [list font_family $bold_font font_size 20]

	dui aspect set -type dclicker -style dye_double [subst {shape {} fill $::skin_background_colour
		disabledfill $::skin_background_colour width 0 orient horizontal use_biginc 1
		symbol chevrons-left symbol1 chevron-left symbol2 chevron-right symbol3 chevrons-right}]
	dui aspect set -type dclicker_symbol -style dye_double [subst {pos {0.075 0.5} font_size 24 anchor center
		fill "#7f879a" disabledfill $disabled_colour}]
	dui aspect set -type dclicker_symbol1 -style dye_double [subst {pos {0.275 0.5} font_size 24 anchor center
		fill "#7f879a" disabledfill $disabled_colour}]
	dui aspect set -type dclicker_symbol2 -style dye_double [subst {pos {0.725 0.5} font_size 24 anchor center
		fill "#7f879a" disabledfill $disabled_colour}]
	dui aspect set -type dclicker_symbol3 -style dye_double [subst {pos {0.925 0.5} font_size 24 anchor center
		fill "#7f879a" disabledfill $disabled_colour}]

	dui aspect set -type dclicker -style dye_single {orient horizontal use_biginc 0 symbol chevron-left symbol1 chevron-right}
	dui aspect set -type dclicker_symbol -style dye_single {pos {0.1 0.5} font_size 24 anchor center fill "#7f879a"}
	dui aspect set -type dclicker_symbol1 -style dye_single {pos {0.9 0.5} font_size 24 anchor center fill "#7f879a"}

	# Profile viewer
	dui aspect set [subst {
		shape.fill.dye_pv_icon_btn CadetBlue4
		dtext.fill.dye_pv_profile_title $::skin_text_colour
		dtext.font_size.dye_pv_profile_title +8
		dtext.font_family.dye_pv_profile_title notosansuibold
		text_tag.spacing1.dye_pv_step [dui::platform::rescale_y 20]
		text_tag.foreground.dye_pv_step "#865a40"
		text_tag.lmargin1.dye_pv_step_line [dui::platform::rescale_x 35]
		text_tag.lmargin2.dye_pv_step_line [dui::platform::rescale_x 55]
		text_tag.foreground.dye_pv_value $::plugins::DYE::default_shot_desc_font_color
	}]

	### DYE V3 STYLES ####
	set bg_color $::skin_background_colour
	#[dui aspect get page bg_color]
	set btn_spacing 100
	set half_button_width [expr {int(($::dui::pages::DYE_v3::page_coords(panel_width)-$btn_spacing)/2)}]

	dui aspect set -theme DSx [subst {
		dbutton.bheight.dyev3_topnav 90
		dbutton.shape.dyev3_topnav rect
		dbutton.fill.dyev3_topnav grey
		dbutton_label.font_size.dyev3_topnav -1
		dbutton_label.pos.dyev3_topnav {0.5 0.5}
		dbutton_label.anchor.dyev3_topnav center
		dbutton_label.justify.dyev3_topnav center

		dbutton.bwidth.dyev3_nav_button 100
		dbutton.bheight.dyev3_nav_button 120
		dbutton.fill.dyev3_nav_button {}
		dbutton.disabledfill.dyev3_nav_button {}
		dbutton_symbol.pos.dyev3_nav_button {0.5 0.5}
		dbutton_symbol.fill.dyev3_nav_button #ccc

		text.font_size.dyev3_top_panel_text -1
		text.yscrollbar.dyev3_top_panel_text no
		text.bg.dyev3_top_panel_text $bg_color
		text.borderwidth.dyev3_top_panel_text 0
		text.highlightthickness.dyev3_top_panel_text 0
		text.relief.dyev3_top_panel_text flat

		text.font_size.dyev3_bottom_panel_text -1

		dtext.font_family.dyev3_right_panel_title "$::skin(font_name)"
		dtext.font_size.dyev3_right_panel_title +2
		dtext.fill.dyev3_right_panel_title $::skin_text_colour
		dtext.anchor.dyev3_right_panel_title center
		dtext.justify.dyev3_right_panel_title center

		graph.background.dyev3_text_graph $bg_color
		graph.plotbackground.dyev3_text_graph $bg_color
		graph.borderwidth.dyev3_text_graph 1
		graph.plotrelief.dyev3_text_graph flat

		dtext.font_size.dyev3_chart_stage_title +2
		dtext.anchor.dyev3_chart_stage_title center
		dtext.justify.dyev3_chart_stage_title center
		dtext.fill.dyev3_chart_stage_title $::skin_text_colour

		dtext.anchor.dyev3_chart_stage_colheader center
		dtext.justify.dyev3_chart_stage_colheader center

		dtext.anchor.dyev3_chart_stage_value center
		dtext.justify.dyev3_chart_stage_value center

		dtext.anchor.dyev3_chart_stage_comp center
		dtext.justify.dyev3_chart_stage_comp center
		dtext.font_size.dyev3_chart_stage_comp -4
		dtext.fill.dyev3_chart_stage_comp grey

		line.fill.dyev3_chart_stage_line_sep grey

		dbutton.shape.dyev3_action_half outline
		dbutton.fill.dyev3_action_half {}
		dbutton.disabledfill.dyev3_action_half {}
		dbutton.width.dyev3_action_half [dui platform rescale_x 7]
		dbutton.outline.dyev3_action_half white
		dbutton.disabledoutline.dyev3_action_half $disabled_colour
		dbutton.bwidth.dyev3_action_half $half_button_width
		dbutton.bheight.dyev3_action_half 125
		dbutton_symbol.pos.dyev3_action_half {0.2 0.5}
		dbutton_label.pos.dyev3_action_half {0.6 0.5}
		dbutton_label.width.dyev3_action_half [expr {$half_button_width-75}]

		#text_tag.foregroud.which_shot black
		text_tag.font.dyev3_which_shot "[dui font get $::skin(font_name) 15]"
		text_tag.justify.dyev3_which_shot center

		text_tag.justify.dyev3_profile_title center

		text_tag.foreground.dyev3_section $::skin_text_colour
		text_tag.font.dyev3_section "[dui font get $::skin(font_name) 17]"
		text_tag.spacing1.dyev3_section [dui platform rescale_y 20]

		text_tag.foreground.dyev3_field $::skin_text_colour
		text_tag.lmargin1.dyev3_field [dui platform rescale_x 35]
		text_tag.lmargin2.dyev3_field [dui platform rescale_x 45]

		text_tag.foreground.dyev3_value #4e85f4

		text_tag.foreground.dyev3_compare grey

		text_tag.font.dyev3_field_highlighted "[dui font get $::skin(font_name) 15]"
		text_tag.background.dyev3_field_highlighted darkgrey
		text_tag.font.dyev3_field_nonhighlighted "[dui font get $::skin(font_name) 15]"
		text_tag.background.dyev3_field_nonhighlighted {}
	}]


	### DSx HOME PAGE ###

	set x [lindex $::DSx2_cafe_settings_next_shot_coords 0]
	set y [lindex $::DSx2_cafe_settings_next_shot_coords 1]
	dui add dbutton off 0 0 1 1 -tags launch_dye_next

	set x [lindex $::DSx2_cafe_settings_last_shot_coords 0]
	set y [lindex $::DSx2_cafe_settings_last_shot_coords 1]
	dui add dbutton off 0 0 1 1 -tags launch_dye_last


	dui add dbutton off 50 1370 -bwidth 850 -bheight 190 -anchor nw \
			-tags launch_dye_last_cafe -labelvariable {$::plugins::DYE::settings(last_shot_desc)} \
			-label_pos {0.0 0.27} -label_anchor nw \
			-label_justify left -label_font_size -3 -label_fill $::skin_text_colour -label_width 850 \
			-label1variable {$::plugins::DYE::settings(last_shot_header)} -label1_font_family notosansuibold \
			-label1_font_size -3 -label1_fill $::skin_text_colour \
			-label1_pos {0.0 0.0} -label1_anchor nw -label1_justify left -label1_width 850 \
			-initial_state normal -tap_pad {20 15 0 50} \
			-command [::list ::plugins::DYE::open -which_shot last] -tap_pad {100 0 0 0} \
			#-longpress_cmd [::list ::dui::page::open_dialog dye_which_shot_dlg -coords \[list [expr {$x-375}] [expr {$y-80}]\] -anchor sw]


	dui add dbutton off 1950 1370 -bwidth 850 -bheight 190 -anchor ne \
			-tags launch_dye_next_cafe -labelvariable {$::plugins::DYE::settings(next_shot_desc)} \
			-label_pos {1.0 0.27} -label_anchor ne \
			-label_justify right -label_font_size -3 -label_fill $::skin_text_colour -label_width 850 \
			-label1variable {$::plugins::DYE::settings(next_shot_header)} -label1_font_family notosansuibold \
			-label1_font_size -3 -label1_fill $::skin_text_colour \
			-label1_pos {1.0 0.0} -label1_anchor ne -label1_justify right -label1_width 850 \
			-initial_state normal -tap_pad {0 15 20 50} \
			-command [::list ::plugins::DYE::open -which_shot next] -tap_pad {100 0 0 0} \
			#-longpress_cmd [::list ::dui::page::open_dialog dye_which_shot_dlg -coords \[list [expr {$x-375}] [expr {$y-80}]\] -anchor sw]


}
::plugins::DYE::setup_ui_DSx

proc ::toggle_cache_graphs_cafe {args} {
    if {[.can itemcget graph_a -state] eq "hidden"} {
        if {$::main_graph_height == [rescale_y_skin 1010]} {
            set ::main_graph_height [rescale_y_skin 840]
            $::home_espresso_graph configure -height [rescale_y_skin 840]
            dui item config off live_graph_data -initial_state hidden -state hidden
            dui item config off launch_dye_last_cafe* -initial_state normal -state normal
            dui item config off launch_dye_next_cafe* -initial_state normal -state normal
        } else {
            dui item config off launch_dye_last_cafe* -initial_state hidden -state hidden
            dui item config off launch_dye_next_cafe* -initial_state hidden -state hidden
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
        }
    } else {
        dui item config off launch_dye_last_cafe* -initial_state hidden -state hidden
        dui item config off launch_dye_next_cafe* -initial_state hidden -state hidden
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
        $::home_espresso_graph element configure compare_weight_chartable -xdata compare_espresso_elapsed -ydata compare_espresso_weight_chartable
        $::home_espresso_graph element configure compare_steps -xdata compare_espresso_elapsed -ydata compare_espresso_state_change
        $::home_espresso_graph element configure compare_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket10th
        $::home_espresso_graph element configure compare_zoom_temperature -xdata compare_espresso_elapsed -ydata compare_espresso_temperature_basket
        $::home_espresso_graph element configure compare_resistance -xdata compare_espresso_elapsed -ydata compare_espresso_resistance
    }
}
set ::DSx2_cafe_dye_state 0
rename hide_graph hide_graph_cafe_dye
proc hide_graph {} {
    hide_graph_cafe_dye
    if {[.can itemcget launch_dye_last_cafe -state] eq "normal"} {
        set ::DSx2_cafe_dye_state 1
        dui item config off launch_dye_last_cafe* -initial_state hidden -state hidden
        dui item config off launch_dye_next_cafe* -initial_state hidden -state hidden
    }
}

rename show_graph show_graph_cafe_dye
proc show_graph {} {
    if {$::DSx2_cafe_dye_state == 1} {
        show_graph_2
        check_graph_axis

        set_button auto_tare state hidden
        set_button HDS_timer state hidden

        dui item config off live_graph_data -initial_state normal -state normal
        dui item config off fav_edit_buttons -initial_state hidden -state hidden
        set pages {off espresso hotwaterrinse water}
        foreach key {pressure flow weight temperature resistance steps} {
            dui item config $pages ${key}_icon -initial_state normal -state normal
            dui item config $pages ${key}_text -initial_state normal -state normal
            dui item config $pages ${key}_data -initial_state normal -state normal
            dui item config $pages ${key}_key_button* -initial_state normal -state normal
        }
        dui item config off live_graph_data -initial_state hidden -state hidden
        dui item config off main_graph_toggle_label -initial_state normal -state normal
        dui item config off main_graph_toggle_button* -initial_state normal -state normal
        dui item config off main_graph_toggle_view_label -initial_state normal -state normal
        dui item config off main_graph_toggle_view_button* -initial_state normal -state normal
        dui item config off main_graph_toggle_goal_label -initial_state normal -state normal
        dui item config off main_graph_toggle_goal_button* -initial_state normal -state normal


        set ::DSx2_cafe_dye_state 0
        dui item config off launch_dye_last_cafe* -initial_state normal -state normal
        dui item config off launch_dye_next_cafe* -initial_state normal -state normal
    } else {
        show_graph_cafe_dye
    }
}

bind $::home_espresso_graph [dui::platform::button_press] {
    set x [translate_coordinates_finger_down_x %x]
    if {$x < [rescale_y_skin 100]} {
        ::toggle_y_resolution
    } else {
        ::toggle_cache_graphs_cafe
    }
}

