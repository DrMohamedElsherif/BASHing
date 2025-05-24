README.txt
==========

Project Title: Image Processing and HTML Presentation Scripts (Project01)

Author: Mohamed A. Elsherif (6378374)

Year: 2025

Overview
--------
This project consists of two Bash scripts developed for automating the processing and presentation of image files.
Script Descriptions
-------------------

1. image_processor.sh
   -------------------
   This script processes all image files from the `Rohsammlung/` folder by:
   - Creating (or cleaning) a target directory called `Bildsammlung`
   - Extracting the earliest available timestamp from each image
   - Detecting the file format
   - Renaming the files to the format: `YYYYMMDD_HHMMSS.format`
   - Copying the renamed files to `Bildsammlung`
   - Removing personal EXIF metadata
   - Creating JPEG thumbnails (100x100 max, maintaining aspect ratio)

   The final structure is displayed using the `tree` command.

2. html_generator.sh
   -------------------
   This script generates a single-file HTML page (named `index.html`) from the contents of the `Bildsammlung` directory by:
   - Listing all original images (excluding `.small.jpg` thumbnails)
   - Creating a thumbnail-linked table with:
     - Image preview
     - File name
     - File size 
     - Image resolution 
   - Including the script author and creation timestamp
   
   The final structure is displayed using the `tree` command.
   This script MUST be placed in the `Bildsammlung` folder to run, therefore make sure that you are in this directory before running the script.

Dependencies
------------
These scripts rely on the following command-line tools:

- `bash` – For script execution
- `exiftool` – To read and manipulate EXIF metadata (must be installed)
- `magick` (ImageMagick v7) – For image format detection and thumbnail generation

Remarks
-------
- Thumbnails are stored in the same directory as their original images for simplicity.
- The scripts assume all original images are directly inside `Rohsammlung` and not nested in subfolders.

License
-------
This project was developed as part of a university assignment within 'DataBASHing' Course by Professor Dr. Martin Raden, Uni-Tübingen. All code is free to use for educational purposes.


**Disclosure:** The design outline of this Readme txt was inspired with the help of AI for both learning and aesthetic (beauty) purposes. Hope this is still acceptable.
