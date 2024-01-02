proc acaia_decode_weight {payload_offset} {
	set value 0
	catch {
		# wrap everything in a catch in case bad data is sent by Acaia
		set weight_payload [lrange $::acaia_command_buffer $payload_offset end]
		set value [expr {(([lindex $weight_payload 2] & 0xFF) << 16) + (([lindex $weight_payload 1] & 0xFF) << 8) + ([lindex $weight_payload 0] & 0xFF)}]
		set unit [expr {[lindex $weight_payload 4] & 0xFF}];
		set calculated_weight [expr { $value / pow(10.0, $unit)}]
		set is_negative [expr {[lindex $weight_payload 5] > 1.0}]
		if {$is_negative} {
			set calculated_weight [expr {$calculated_weight * -1.0}]
		}
	#msg -ERROR "WEIGHT $calculated_weight \
		 UNIT $unit IS_NEG $is_negative BUFFER $::acaia_command_buffer VALUE $value"
		if {$calculated_weight > 2000} {
		    set sensorweight 0.01
		} else {
		    set sensorweight $calculated_weight
		    ::device::scale::process_weight_update $sensorweight ;# $event_time
		}
	}
}