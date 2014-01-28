#!/bin/bash

# Cinerellify converts $1 to an x264 video named $2

cinerellify () {
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo "Usage: cinerellify <in> <out>.mov"
		return
	fi

	echo "In : \"$1\""
	echo "Out: \"$2\""

	# From http://www.g-raffa.eu/Cinelerra/HOWTO/get_media_ready.html
	# Also see http://www.itbroadcastanddigitalcinema.com/ffmpeg_howto.html#Encoding_VC-3
	# 1080p. Note that DNxHD doesn't support 4:3 at all. Add '-flags +ilme+ildct' for interlaced video
	# ffmpeg -i "$1" -b:v 185M -b:a 185M -s 1920x1080 -vcodec dnxhd -acodec pcm_s16le "$2"

	# QT (Mpeg4 video, AAC audio) - .mov
	#ffmpeg -i "$1" -vcodec mjpeg -q:v 1 -q:a 1 -acodec pcm_s16le "$2"
	ffmpeg -i "$1" -strict -2 -acodec aac -vcodec libx264 -preset ultrafast -crf 0.01 -f psp "$2"
}
