dui add dbutton saver 0 0 \
    -bwidth 140 -bheight 140 -tags saver_history_button \
    -shape round -radius 30 -fill #333 \
    -labelvariable {\uf1da} -label_font [skin_font awesome 48] -label_fill #666 -label_pos {0.5 0.5} \
    -command {skin_history} -longpress_cmd {skin_history_2}

add_screen_saver_button saver_history_button
