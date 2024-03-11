#### Pizza dough calulator - DSx2 pluging by Damian ####
set ::pizza_dough_calulator_version 1.10

### Starting values ###
if {[info exists ::skin(pizza_quantity)] != 1} {
    set ::skin(pizza_quantity) 4.0
}
if {[info exists ::skin(pizza_size)] != 1} {
    set ::skin(pizza_size) 280.0
}  
if {[info exists ::skin(pizza_hydration)] != 1} {
    set ::skin(pizza_hydration) 64.0
}
if {[info exists ::skin(pizza_yeast_factor)] != 1} {
    set ::skin(pizza_yeast_factor) "Normal"
}
if {[info exists ::skin(pizza_waste)] != 1} {
    set ::skin(pizza_waste) 2.0
}

if {[info exists ::skin(pizza_size_fav_1)] != 1} {
    set ::skin(pizza_size_fav_1) 280
}
if {[info exists ::skin(pizza_hydration_fav_1)] != 1} {
    set ::skin(pizza_hydration_fav_1) 64.0
}
if {[info exists ::skin(pizza_yeast_factor_fav_1)] != 1} {
    set ::skin(pizza_yeast_factor_fav_1) "Normal"
}
if {[info exists ::skin(pizza_waste_fav_1)] != 1} {
    set ::skin(pizza_waste_fav_1) 2.0
}

if {[info exists ::skin(pizza_size_fav_2)] != 1} {
    set ::skin(pizza_size_fav_2) 280
}
if {[info exists ::skin(pizza_hydration_fav_2)] != 1} {
    set ::skin(pizza_hydration_fav_2) 65.0
}
if {[info exists ::skin(pizza_yeast_factor_fav_2)] != 1} {
    set ::skin(pizza_yeast_factor_fav_2) "Fluffy"
}
if {[info exists ::skin(pizza_waste_fav_2)] != 1} {
    set ::skin(pizza_waste_fav_2) 2.0
}
if {[info exists ::skin(pizza_fav_1_name)] != 1} {
    set ::skin(pizza_fav_1_name) "Normal"
}
if {[info exists ::skin(pizza_fav_2_name)] != 1} {
    set ::skin(pizza_fav_2_name) "Fluffy"
}


### favourites
proc pizza_reset {} {
    set ::skin(pizza_quantity) 4.0
    set ::skin(pizza_size) 280.0
    set ::skin(pizza_hydration) 64.0
    set ::skin(pizza_yeast_factor) "Normal"
    set ::skin(pizza_waste) 2.0
    set ::skin(pizza_size_fav_1) 280
    set ::skin(pizza_hydration_fav_1) 64.0
    set ::skin(pizza_yeast_factor_fav_1) "Normal"
    set ::skin(pizza_waste_fav_1) 2.0
    set ::skin(pizza_size_fav_2) 280
    set ::skin(pizza_hydration_fav_2) 65.0
    set ::skin(pizza_yeast_factor_fav_2) "Fluffy"
    set ::skin(pizza_waste_fav_2) 2.0
    set ::skin(pizza_fav_1_name) "Normal"
    set ::skin(pizza_fav_2_name) "Fluffy"
}

proc pizza_save_fav_1 {} {
    set ::skin(pizza_yeast_factor_fav_1) $::skin(pizza_yeast_factor)
    set ::skin(pizza_size_fav_1) $::skin(pizza_size)
    set ::skin(pizza_hydration_fav_1) $::skin(pizza_hydration)
    set ::skin(pizza_waste_fav_1) $::skin(pizza_waste)
    pizza_yeast_text_colour
    skin_save skin
}

proc pizza_save_fav_2 {} {
    set ::skin(pizza_yeast_factor_fav_2) $::skin(pizza_yeast_factor)
    set ::skin(pizza_size_fav_2) $::skin(pizza_size)
    set ::skin(pizza_hydration_fav_2) $::skin(pizza_hydration)
    set ::skin(pizza_waste_fav_2) $::skin(pizza_waste)
    pizza_yeast_text_colour
    skin_save skin
}

proc pizza_fav_1 {} {
    set ::skin(pizza_yeast_factor) $::skin(pizza_yeast_factor_fav_1)
    set ::skin(pizza_size) $::skin(pizza_size_fav_1)
    set ::skin(pizza_hydration) $::skin(pizza_hydration_fav_1)
    set ::skin(pizza_waste) $::skin(pizza_waste_fav_1)
}
proc pizza_fav_2 {} {
    set ::skin(pizza_yeast_factor) $::skin(pizza_yeast_factor_fav_2)
    set ::skin(pizza_size) $::skin(pizza_size_fav_2)
    set ::skin(pizza_hydration) $::skin(pizza_hydration_fav_2)
    set ::skin(pizza_waste) $::skin(pizza_waste_fav_2)
}

proc pizza_yeast_text_colour {} {
    if {$::skin(pizza_yeast_factor) == $::skin(pizza_yeast_factor_fav_1) && $::skin(pizza_size) == $::skin(pizza_size_fav_1) && $::skin(pizza_hydration) == $::skin(pizza_hydration_fav_1) && $::skin(pizza_waste) == $::skin(pizza_waste_fav_1)} {
        .can itemconfigure $::pizza_yeast_text_normal -fill $::skin_selected_colour
    } else {
        .can itemconfigure $::pizza_yeast_text_normal -fill $::skin_button_label_colour
    }
    if {$::skin(pizza_yeast_factor) == $::skin(pizza_yeast_factor_fav_2) && $::skin(pizza_size) == $::skin(pizza_size_fav_2) && $::skin(pizza_hydration) == $::skin(pizza_hydration_fav_2) && $::skin(pizza_waste) == $::skin(pizza_waste_fav_2)} {
        .can itemconfigure $::pizza_yeast_text_fluffy -fill $::skin_selected_colour
    } else {
        .can itemconfigure $::pizza_yeast_text_fluffy -fill $::skin_button_label_colour
    }
}


### The calulations ###
proc pizza_calculate {} {
    set fbase [expr {5000000/836}]
    set ff [expr {$fbase * 64 / $::skin(pizza_hydration)}]
    set sf [expr {100000/836}]
    set wbase [expr {3200000/836}]
    set wf [expr {$wbase + $fbase - $ff}]
    if {$::skin(pizza_yeast_factor) == "Fluffy"} {
        set yf [expr {60000/836 * 1.25}]
    } else {
        set yf [expr {60000/836}]
    }

    set weight [expr {$::skin(pizza_quantity) * $::skin(pizza_size) * ((100 + $::skin(pizza_waste))/100)}]
    set flour [expr {($weight*$ff/10000) - ($weight/10000 * ($yf - (60000/836)))}]
    set salt [expr {$weight*$sf/10000}]
    set water [expr {$weight*$wf/10000}]
    set yeast [expr {$weight*$yf/10000}]
    set ::pizza_flour [round_to_integer $flour]g
    set ::pizza_salt [round_to_one_digits $salt]g
    set ::pizza_water [round_to_integer $water]g
    set ::pizza_yeast [round_to_one_digits $yeast]g
    set ::pizza_batch [round_to_integer [expr {$::skin(pizza_quantity) * $::skin(pizza_size)}]]g
    set ::pizza_waste [round_to_integer [expr {($flour + $water + $salt + $yeast) - ($::skin(pizza_quantity) * $::skin(pizza_size))}]]g

    pizza_yeast_text_colour
}


### UI ###
### page show button ###
dui add dbutton saver 0 0 \
    -bwidth 140 -bheight 140 -tags pizza_saver_button \
    -shape round -radius 30 -fill #333 \
    -labelvariable {\UF818} -label_font [skin_font awesome 48] -label_fill #666 -label_pos {0.5 0.5} \
    -command {scale_enable_lcd; page_show pizza_dough;}
add_screen_saver_button pizza_saver_button

### Page heading ###
add_de1_variable "pizza_dough" 1280 80 -justify center -font [skin_font font 30] -fill $::skin_text_colour -textvariable {Pizza Dough Calculator}


### backgrounds
dui add dbutton pizza_dough 40 190 \
    -bwidth 1010 -bheight 1370 \
    -shape round -radius 30 -fill $::skin_background_colour

dui add dbutton pizza_dough 1090 190 \
    -bwidth 1420 -bheight 860 \
    -shape round -radius 30 -fill $::skin_background_colour

dui add dbutton pizza_dough 1590 1140 \
    -bwidth 420 -bheight 150 \
    -shape round -radius 30 -fill $::skin_background_colour \
    -command {scale_tare; catch {ble_connect_to_scale}}
dui add variable pizza_dough 1800 1210 -font [skin_font font 38] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_one_digits $::de1(scale_sensor_weight)]g}
dui add variable pizza_dough 1800 1270 -font [skin_font font 13] -fill $::skin_text_colour -anchor center -justify center -textvariable {[skin_scale_disconnected]}
dui add dbutton pizza_dough 1590 1140 \
    -bwidth 420 -bheight 150 \
    -command {scale_tare; catch {ble_connect_to_scale}}


dui add dtext pizza_dough 1460 370 -text [translate "Quantity"] -font [skin_font font 24] -fill $::skin_text_colour -anchor w -justify center

dui add dbutton pizza_dough 1726 320 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_-)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_quantity) [expr $::skin(pizza_quantity) - 1]; if {$::skin(pizza_quantity) < 1} {set ::skin(pizza_quantity) 1}; pizza_calculate}
dui add variable pizza_dough 1920 370 -font [skin_font font 24] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_integer $::skin(pizza_quantity)]}
dui add dbutton pizza_dough 2020 320 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_+)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_quantity) [expr $::skin(pizza_quantity) + 1]; pizza_calculate}

### Recipe ###
dui add dtext pizza_dough 1460 570 -text [translate "pizza flour"] -font [skin_font font 24] -fill $::skin_text_colour -anchor w -justify center
dui add variable pizza_dough 1920 570 -font [skin_font font 24] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::pizza_flour}
dui add dtext pizza_dough 1460 670 -text [translate "ground salt"] -font [skin_font font 24] -fill $::skin_text_colour -anchor w -justify center
dui add variable pizza_dough 1920 670 -font [skin_font font 24] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::pizza_salt}
dui add dtext pizza_dough 1460 770 -text [translate "warm water"] -font [skin_font font 24] -fill $::skin_text_colour -anchor w -justify center
dui add variable pizza_dough 1920 770 -font [skin_font font 24] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::pizza_water}
dui add dtext pizza_dough 1460 870 -text [translate "dry yeast"] -font [skin_font font 24] -fill $::skin_text_colour -anchor w -justify center
dui add variable pizza_dough 1920 870 -font [skin_font font 24] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::pizza_yeast}


dui add dbutton pizza_dough 1460 1400 \
    -bwidth 680 -bheight 96 \
    -labelvariable {[translate "exit"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {scale_disable_lcd; skin_save skin; if {$::de1_num_state($::de1(state)) == "Sleep"} {page_show saver;} else {set_next_page off off; start_idle; page_show off;}}


### Left side
dui add dtext pizza_dough 190 380 -text [translate "Recipe"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center


dui add dtext pizza_dough 190 470 -text [translate "ball weight"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton pizza_dough 486 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_-)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_size) [round_to_integer [expr $::skin(pizza_size) - 10]]; if {$::skin(pizza_size) < 140} {set ::skin(pizza_size) 140}; pizza_calculate}
dui add variable pizza_dough 680 470 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_integer $::skin(pizza_size)]g}
dui add dbutton pizza_dough 780 420 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_+)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_size) [round_to_integer [expr $::skin(pizza_size) + 10]]; pizza_calculate}

dui add dtext pizza_dough 190 620 -text [translate "hydration"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton pizza_dough 486 570 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_-)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_hydration) [round_to_integer [expr $::skin(pizza_hydration) - 1]]; if {$::skin(pizza_hydration) < 50} {set ::skin(pizza_hydration) 50}; pizza_calculate}
dui add variable pizza_dough 680 620 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_integer $::skin(pizza_hydration)]%}
dui add dbutton pizza_dough 780 570 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_+)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_hydration) [round_to_integer [expr $::skin(pizza_hydration) + 1]]; pizza_calculate}

dui add dtext pizza_dough 190 770 -text [translate "yeast"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton pizza_dough 486 720 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_-)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_yeast_factor) "Normal"; pizza_calculate}
dui add variable pizza_dough 680 770 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {$::skin(pizza_yeast_factor)}
dui add dbutton pizza_dough 780 720 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_+)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_yeast_factor) "Fluffy"; pizza_calculate}

dui add dtext pizza_dough 190 920 -text [translate "waste factor"] -font [skin_font font 20] -fill $::skin_text_colour -anchor w -justify center
dui add dbutton pizza_dough 486 870 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_-)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_waste) [round_to_one_digits [expr $::skin(pizza_waste) - 0.2]]; if {$::skin(pizza_waste) < 0} {set ::skin(pizza_waste) 0}; pizza_calculate}
dui add variable pizza_dough 680 920 -font [skin_font font 20] -fill $::skin_text_colour -anchor center -justify center -textvariable {[round_to_one_digits $::skin(pizza_waste)]%}
dui add dbutton pizza_dough 780 870 \
    -bwidth 96 -bheight 96 \
    -labelvariable {$::skin(icon_+)} -label_font [skin_font icons 48] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {set ::skin(pizza_waste) [round_to_one_digits [expr $::skin(pizza_waste) + 0.2]]; pizza_calculate}

dui add dtext pizza_dough 190 1160 -text [translate "Presets"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center

dui add dbutton pizza_dough 190 1200 \
    -bwidth 320 -bheight 96 \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {pizza_fav_1; pizza_calculate; pizza_yeast_text_colour;}
set ::pizza_yeast_text_normal [add_de1_variable "pizza_dough" 350 1250 -justify center -anchor center -font [skin_font font 20] -fill $::skin_button_label_colour -textvariable {$::skin(pizza_fav_1_name)}]
dui add dbutton pizza_dough 190 1200 \
    -bwidth 320 -bheight 96 \
    -command {pizza_fav_1; pizza_calculate; pizza_yeast_text_colour;}

dui add dbutton pizza_dough 560 1200 \
    -bwidth 320 -bheight 96 \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {pizza_fav_2; pizza_calculate; pizza_yeast_text_colour;}
set ::pizza_yeast_text_fluffy [add_de1_variable "pizza_dough" 720 1250 -justify center -anchor center -font [skin_font font 20] -fill $::skin_button_label_colour -textvariable {$::skin(pizza_fav_2_name)}]
dui add dbutton pizza_dough 560 1200 \
    -bwidth 320 -bheight 96 \
    -command {pizza_fav_2; pizza_calculate; pizza_yeast_text_colour;}


dui add dbutton pizza_dough 190 1400 \
    -bwidth 680 -bheight 96 \
    -labelvariable {[translate "save current recipe to a preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {page_show pizza_fav_setup;}



dui add dbutton pizza_fav_setup 600 370 \
    -bwidth 1600 -bheight 300 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add dbutton pizza_fav_setup 600 750 \
    -bwidth 1600 -bheight 300 \
    -shape round -radius 30 -fill $::skin_forground_colour

dui add dtext pizza_fav_setup 700 440 -text [translate "Preset button labels"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center
dui add dtext pizza_fav_setup 700 824 -text [translate "Save recipe"] -font [skin_font font_bold 20] -fill $::skin_text_colour -anchor w -justify center
dui add dtext pizza_fav_setup 700 584 -text [translate "left button"] -font [skin_font font 14] -fill $::skin_text_colour -anchor w -justify center
dui add dtext pizza_fav_setup 1200 580 -text [translate "right button"] -font [skin_font font 14] -fill $::skin_text_colour -anchor w -justify center

dui add entry pizza_fav_setup 700 500 -textvariable ::skin(pizza_fav_1_name) -bg $::skin_button_label_colour -width 12 -font_size 15
dui add entry pizza_fav_setup 1200 500 -textvariable ::skin(pizza_fav_2_name) -bg $::skin_button_label_colour -width 12 -font_size 15

dui add dbutton pizza_fav_setup 700 880 \
    -bwidth 440 -bheight 96 \
    -labelvariable {[translate "save to LEFT preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {pizza_save_fav_1; page_show pizza_dough;}

dui add dbutton pizza_fav_setup 1200 880 \
    -bwidth 440 -bheight 96 \
    -labelvariable {[translate "save to RIGHT preset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {pizza_save_fav_2; page_show pizza_dough;}

dui add dbutton pizza_fav_setup 1700 880 \
    -bwidth 400 -bheight 96 \
    -labelvariable {[translate "Cancel"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {page_show pizza_dough;}

dui add dbutton pizza_fav_setup 80 1400 \
    -bwidth 400 -bheight 96 \
    -labelvariable {[translate "factory reset"]} -label_font [skin_font font 20] -label_fill $::skin_button_label_colour -label_pos {0.5 0.5} \
    -shape round_outline -width 2 -arc_offset 20 -fill $::skin_forground_colour -outline $::skin_forground_colour \
    -command {pizza_reset; skin_save skin; pizza_calculate; page_show pizza_dough;}

pizza_calculate
dui add variable "pizza_dough pizza_fav_setup" 2540 1580 -tags skin_version -font [skin_font font 13] -fill $::skin_text_colour -anchor e -textvariable {version ${::pizza_dough_calulator_version}}
