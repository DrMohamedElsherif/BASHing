#!/bin/bash

# ------------------------------------------------------------------------
# image_processor.sh - First Script- Image Processing Script for Project01
# ------------------------------------------------------------------------

# Setup working or clean directory
setup_directory() {
    target_dir="Bildsammlung"
    [ -d "$target_dir" ] && rm -rf "$target_dir"/*
    mkdir -p "$target_dir"
}

# Get earliest timestamp for image
get_image_timestamp() {
    local img="$1"
    local exif_date
    exif_date=$(exiftool -s3 -d "%Y%m%d_%H%M%S" -DateTimeOriginal "$img")
    local fs_date
    fs_date=$(stat -f "%Sm" -t "%Y%m%d_%H%M%S" "$img")
    echo "${exif_date:-$fs_date}"
}

# Generate unique filename (For Robustness: This avoids overwriting files with same timestamp as a precaution)
generate_unique_filename() {
    local base="$1"
    local ext="$2"
    local name="${base}.${ext}"
    local count=1
    while [ -e "$target_dir/$name" ]; do
        name="${base}_$count.${ext}"
        ((count++))
    done
    echo "$name"
}

# Now Process each image
process_image() {
    local img="$1"

    [ -f "$img" ] || return

    # Detect image format
    local format
    format=$(identify -format "%m" "$img" | tr '[:upper:]' '[:lower:]')
    if [ -z "$format" ]; then
        echo "Skipping unsupported or unreadable file: $(basename "$img")"
        return
    fi

    # Get timestamp and generate unique name
    local timestamp
    timestamp=$(get_image_timestamp "$img")
    local new_name
    new_name=$(generate_unique_filename "$timestamp" "$format")

    # Copy to Bildsammlung
    cp "$img" "$target_dir/$new_name"

    # Remove personal EXIF tags
    exiftool -overwrite_original \
        -Artist= -XPAuthor= -GPSLatitude= -GPSLongitude= -GPSAltitude= -GPSPosition= -Software= \
        "$target_dir/$new_name"

    # Create a JPEG thumbnail
    magick "$target_dir/$new_name" \
        -resize 100x100\> \
        "$target_dir/${new_name%.*}.small.jpg"
}

# Main function for execution
main() {
    setup_directory
    echo "Starting image processing..."

    for img in Rohsammlung/*; do
        echo "Processing: $(basename "$img")"
        process_image "$img"
    done

    echo -e "\nProcessing complete. Results:"
    tree "$target_dir"
}

main

############################## End of Script ##############################
# Elsherif, Mohamed A. (6378374)
# 2025
# =================================