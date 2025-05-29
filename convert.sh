#!/bin/sh

show_help() {
    echo "Usage: $0 <input_folder>"
    echo
    echo "This script converts all MP3 files in the specified input folder"
    echo "to the audio format compatible with the Joyeuse conteuse:"
    echo "- Mono"
    echo "- 16 kHz sample rate"
    echo "- 96 kbps bitrate"
    echo
    echo "Converted files are saved in the ./converted/<input_folder>/ directory."
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    show_help
    exit 0
fi

if [ -z "$1" ]; then
    echo "Error: No input folder provided."
    show_help
    exit 1
fi

input_folder="$1"
output_folder="converted/$input_folder"

if [ ! -d "$input_folder" ]; then
    echo "Error: Input folder '$input_folder' does not exist."
    exit 1
fi

echo "Converting files in folder '$input_folder'..."

mkdir -p "$output_folder"

for filename in "$input_folder"/*.mp3; do
    [ -e "$filename" ] || continue
    base_name=$(basename "$filename")
    echo "Converting $filename..."
    ffmpeg -y -i "$filename" -vn -ar 16000 -ac 1 -b:a 96k "$output_folder/$base_name"
    echo "Done"
done

echo "All files converted successfully in '$output_folder'."
