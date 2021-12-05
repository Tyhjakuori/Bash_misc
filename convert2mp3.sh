#!/usr/bin/bash

for filename in $(find .)
do
	ext=${filename##*\.}
	case "$ext" in
	flac)
		parallel ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: ./*.flac
		sleep 5
		break
		;;
	ogg)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.ogg
		sleep 5
		break
		;;
	wav)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.wav
		sleep 5
		break
		;;
	acc)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.acc
		sleep 5
		break
		;;
	ape)
		parallel ffmpeg -i "{}" "{.}.mp3" ::: ./*.ape
		sleep 5
		break
		;;
esac
done

if [ -d 'mp3' ]; then
	:
else
	mkdir 'mp3'
fi

mv ./*.mp3 mp3/
