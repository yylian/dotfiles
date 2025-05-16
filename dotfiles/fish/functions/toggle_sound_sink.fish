function toggle_sound_sink
	set SOUND_SINK_NAME_SPEAKER    "alsa_output.pci-0000_03_00.1.hdmi-stereo"
	set SOUND_SINK_NAME_HEADPHONES "alsa_output.usb-Generic_USB_Audio-00.HiFi__Speaker__sink"

	if not set -q YYLIAN_SOUND_SINK_NAME; or test -z "$YYLIAN_SOUND_SINK_ID"
		set -U YYLIAN_SOUND_SINK_NAME $SOUND_SINK_NAME_HEADPHONES
	end

	switch $YYLIAN_SOUND_SINK_NAME
		case $SOUND_SINK_NAME_SPEAKER
			wpctl set-default (_get_sink_id_by_name $SOUND_SINK_NAME_HEADPHONES)
			set YYLIAN_SOUND_SINK_NAME $SOUND_SINK_NAME_HEADPHONES
		case $SOUND_SINK_NAME_HEADPHONES
			wpctl set-default (_get_sink_id_by_name $SOUND_SINK_NAME_SPEAKER)
			set YYLIAN_SOUND_SINK_NAME $SOUND_SINK_NAME_SPEAKER
		case '*'
			echo "Sound Sink $YYLIAN_SOUND_SINK_NAME not recognized"
	end
end

function _get_sink_id_by_name
	set name $argv[1]
	pw-dump | jq --arg name "$name" '.[] | select(.type == "PipeWire:Interface:Node") | select(.info.props."node.name" | test($name)) | .id'
end

