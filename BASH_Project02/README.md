README.txt
==========

Project Title: Immigrant Visa Data Extraction and Evaluation Scripts (Project02)
Author: Mohamed A. Elsherif (6378374)
Year: 2025

Overview
--------
This project consists of two Bash scripts developed for automating the extraction and evaluation of U.S. immigrant visa statistics from PDF reports published by the U.S. Department of State. The scripts process Table III data from fiscal years 2021-2023.

Script Descriptions
-------------------

1. process_single_pdf.sh
   ----------------------
   This script processes a single PDF visa report by:
   - Creating (or cleaning) required directories (output/, temp/)
   - Extracting text from PDF using pdftotext (layout-preserved)
   - Filtering out regions, totals and subregions
   - Parsing visa data per country
   - Converting to valid CSV format with semicolon delimiters
   - Saving output to the output/ directory
   - Auto-cleaning temporary files

2. evaluation_script.sh
   ---------------------
   This script automates the full workflow by:
   - Creating required folder structure (pdfs/, output/, temp/)
   - Downloading PDF reports for 2021-2023 (only if missing)
   - Processing each PDF using process_single_pdf.sh
   - Accepting custom country names as arguments (default: Germany)
   - Supporting multi-word country names (e.g., "Dominican Republic")
   - Generating a country-specific CSV summary sorted by year
   - Saving results to output/{Country}_VisaReport.csv
   - Displaying results in console output

   The script must be placed in the same directory as process_single_pdf.sh to run.

Dependencies
------------
These scripts rely on the following command-line tools:

- bash - For script execution
- wget - For PDF downloading
- pdftotext (poppler-utils) - For text extraction from PDFs
- awk, sed, grep, sort - For text processing

Remarks
-------
- Only missing PDFs are downloaded on subsequent runs
- Handles inconsistent year formats in filenames (FY21 vs FY2023)
- Temporary files are automatically cleaned after processing
- Output is validated as proper CSV format

License
-------
This project was developed as part of a university assignment within 'DataBASHing' Course by Professor Dr. Martin Raden, Uni-Tübingen. All code is free to use for educational purposes.

**Disclosure:** The design outline of this Readme txt was inspired with the help of AI for both learning and aesthetic purposes.