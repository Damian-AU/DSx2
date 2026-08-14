package require de1plus 1.0
package require lambda

source "[homedir]/skins/default/standard_includes.tcl"

if {[file exists "[skin_directory]/Damian.start"]} {
    source  [file join "[skin_directory]/" Damian.start]
}
proc check_MySaver_exists {} {
    set dir "[data_directory]/MySaver"
    set file_list [glob -nocomplain "$dir/*"]
    if {[llength $file_list] != 0} {
        set_de1_screen_saver_directory "[data_directory]/MySaver"
    }
}
check_MySaver_exists

# DSx2 keeps its mutable settings in the writable per-skin data dir (so they
# persist even when the skin ships in a read-only package), seeded once from the
# skin's shipped settings/. Defined here, before the first settings read below.
proc dsx2_settings_dir {} {
    set d [skin_settings_directory DSx2]
    if {![file exists "$d/.seeded"]} {
        catch {
            foreach f [glob -nocomplain "[skin_directory]/settings/*"] {
                set dst "$d/[file tail $f]"
                if {![file exists $dst]} { catch { file copy -- $f $dst } }
            }
            catch { close [open "$d/.seeded" w] }
        }
    }
    return $d
}

array set ::skin [encoding convertfrom utf-8 [read_binary_file "[skin_directory]/code/default_settings.txt"]]
if {[file exists "[dsx2_settings_dir]/skin_settings.txt"] == 1} {
    array set ::skin [encoding convertfrom utf-8 [read_binary_file "[dsx2_settings_dir]/skin_settings.txt"]]
}
if {[file exists "[dsx2_settings_dir]/skin_graphs.txt"] == 1} {
    array set ::skin_graphs [encoding convertfrom utf-8 [read_binary_file "[dsx2_settings_dir]/skin_graphs.txt"]]
}

proc D_join_files_in_dir {dir} {
    set file_name [lsort -dictionary [glob -nocomplain -tails -directory "[skin_directory]/$dir/" *.tcl]]
    foreach fn $file_name {
        set fn [file rootname $fn]
        source  [file join "[skin_directory]/$dir/" $fn.tcl]
    }
    set file_name [lsort -dictionary [glob -nocomplain -tails -directory "[skin_directory]/$dir/" *.mnl]]
    foreach fn $file_name {
        set fn [file rootname $fn]
        source  [file join "[skin_directory]/$dir/" $fn.mnl]
    }
}
D_join_files_in_dir code
D_join_files_in_dir pages/$::skin(theme)
D_join_files_in_dir plugins
D_join_files_in_dir manuals

if {[file exists "[dsx2_settings_dir]/D_graphs.tdb"]} {
    array set ::D_graphs [encoding convertfrom utf-8 [read_binary_file "[dsx2_settings_dir]/D_graphs.tdb"]]
}
.can configure -bg $::skin_background_colour

set ::settings(export_history_automatically_to_csv) 0
set ::settings(disable_long_press) 0

if {[file exists "[skin_directory]/Damian.end"]} {
    source  [file join "[skin_directory]/" Damian.end]
}

# Force a page bounce so the home page fully renders on first draw. DSx2 normally
# finalizes the home page via skin_load_fav (fired on the DE1 Sleep->Idle state
# change), but that is a no-op when no favorite is active -- e.g. a fresh data
# dir -- which left the cafe page half-drawn (empty graphs, missing legend/icons)
# until a manual page change. Bouncing through settings_1 forces the transition
# that finalizes the draw. Mirrors DSx's DSx_final_prep fix.
page_show settings_1
after 50 { catch { page_show off } }
