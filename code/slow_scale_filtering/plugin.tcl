set plugin_name "slow_scale_filtering"

namespace eval ::plugins::${plugin_name} {

	# These are shown in the plugin selection page
	variable author "Jeff Kletsky"
	variable contact "git-commits@allycomm.com"
	variable version 0.9
	variable description "Provides slow filtering display for many skins"
	variable name "Slow Scale Filtering"

	# Always on entry point
	proc preload {} {
		# don't do anything until main is called
	}


	# This file will be sourced to display meta-data. Dont put any code into the
	# general scope as there are no guarantees about when it will be run.
	# For security reasons it is highly unlikely you will find the plugin in the
	# official distribution if you are not beeing run from your main
	# REQUIRED

	proc main {} {

    if {[ package vsatisfies [package version de1app] 1.0-1.34.25 ] == 1} {
        return
    }
		# Things to do to accomplish this
		#
		#   * Ensure the internal sample buffer is long enough
		#   * Create procs to estimate the flow and flow delay
		#   * Use the new procs for `flow_filtered` and `flow_filtered_time`

		# 40 samples is about 4 seconds, for about 2 seconds of delay
		# This is similar to the 20-sample tau of the old estimator

		variable flow_samples_slow 40

		variable _new_samples [expr { max([::device::scale::history::samples_for_shift_register], \
							  $flow_samples_slow) }]

		# Extend the internal shift registers, if needed

		rename ::device::scale::history::samples_for_shift_register \
			::device::scale::history::samples_for_shift_register_orig_slow_scale_filtering
		msg -NOTICE "rename  ::device::scale::history::samples_for_shift_register" \
			"::device::scale::history::samples_for_shift_register_orig_slow_scale_filtering"

		proc ::device::scale::history::samples_for_shift_register {} {

			expr { $::plugins::slow_scale_filtering::_new_samples }
		}

		# New estimators are being added, so no need to rename and log

		proc ::device::scale::history::flow_fd_slow {} {

			variable _scale_raw_weight

			if {[llength $_scale_raw_weight] \
				    < $::plugins::slow_scale_filtering::flow_samples_slow} {return 0}

				set intervals [ expr { $::plugins::slow_scale_filtering::flow_samples_slow - 1 }]
				expr { ( [lindex $_scale_raw_weight end] - [lindex $_scale_raw_weight end-$intervals] ) \
					       / ( [::device::scale::period::estimate] * $intervals ) }
		}


		proc ::device::scale::history::flow_time_fd_slow {} {

			# Center of window

			variable _scale_raw_arrival

			if {[llength $_scale_raw_arrival] \
				    < $::plugins::slow_scale_filtering::flow_samples_slow} {return 0}

			set intervals [ expr { $::plugins::slow_scale_filtering::flow_samples_slow - 1 }]
			expr { ( [lindex $_scale_raw_arrival end] + [lindex $_scale_raw_arrival end-$intervals] ) / 2.0 }
		}

		# The estimators are set up when the scale connects
		# While it is probably safe to hope that another callback on_connect
		# executes after the "core" one, always better not to assume things


		proc install_slow_estimators {event_dict} {

			proc ::device::scale::history::flow_filtered {} {
				::device::scale::history::flow_fd_slow
			}

			proc ::device::scale::history::flow_Filtered_time {} {
				::device::scale::history::flow_time_fd_slow
			}
		}

		rename ::device::scale::callbacks::on_connect \
			::device::scale::callbacks::on_connect_orig_slow_scale_filtering
		msg -NOTICE "rename  ::device::scale::callbacks::on_connect" \
			"::device::scale::callbacks::on_connect_orig_slow_scale_filtering"

		proc ::device::scale::callbacks::on_connect {event_dict} {

			::device::scale::callbacks::on_connect_orig_slow_scale_filtering $event_dict
			::plugins::slow_scale_filtering::install_slow_estimators $event_dict
		}


	} ;# main
}
