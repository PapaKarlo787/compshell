if [[ $1 == "" ]]
then
	echo "usage $0 filename"
	exit 1
fi

xy="84x48"

if [[ $2 != "" ]]
then
	xy="$2"
fi

convert "$1" -resize "$xy!" "$1.bmp"
convert "$1.bmp" -monochrome "$1.bmp"
python3 pics.py <<< "$1.bmp"
