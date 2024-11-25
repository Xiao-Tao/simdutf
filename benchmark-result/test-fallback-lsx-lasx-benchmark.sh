#!/bin/bash

set -e
set -x

LATIN1_TXT="-F wikipedia_mars/portuguese.latin1.txt
-F wikipedia_mars/french.latin1.txt
-F wikipedia_mars/esperanto.latin1.txt
-F wikipedia_mars/german.latin1.txt"

UTF8_TXT=" -F ./lipsum/Chinese-Lipsum.utf8.txt
-F ./lipsum/Korean-Lipsum.utf8.txt
-F ./lipsum/Emoji-Lipsum.utf8.txt
-F ./lipsum/Latin-Lipsum.utf8.txt
-F ./lipsum/Hebrew-Lipsum.utf8.txt
-F ./lipsum/Japanese-Lipsum.utf8.txt
-F ./lipsum/Russian-Lipsum.utf8.txt
-F ./lipsum/Arabic-Lipsum.utf8.txt
-F ./lipsum/Hindi-Lipsum.utf8.txt
-F ./wikipedia_mars/korean.utf8.txt
-F ./wikipedia_mars/german.utf8.txt
-F ./wikipedia_mars/czech.utf8.txt
-F ./wikipedia_mars/portuguese.utf8.txt
-F ./wikipedia_mars/japanese.utf8.txt
-F ./wikipedia_mars/esperanto.utf8.txt
-F ./wikipedia_mars/russian.utf8.txt
-F ./wikipedia_mars/thai.utf8.txt
-F ./wikipedia_mars/english.utf8.txt
-F ./wikipedia_mars/french.utf8.txt
-F ./wikipedia_mars/vietnamese.utf8.txt
-F ./wikipedia_mars/hindi.utf8.txt
-F ./wikipedia_mars/greek.utf8.txt
-F ./wikipedia_mars/chinese.utf8.txt
-F ./wikipedia_mars/turkish.utf8.txt
-F ./wikipedia_mars/arabic.utf8.txt
-F ./wikipedia_mars/hebrew.utf8.txt
-F ./wikipedia_mars/persan.utf8.txt"

UTF16_TXT=" -F ./lipsum/Hebrew-Lipsum.utf16.txt
-F ./lipsum/Korean-Lipsum.utf16.txt
-F ./lipsum/Arabic-Lipsum.utf16.txt
-F ./lipsum/Hindi-Lipsum.utf16.txt
-F ./lipsum/Japanese-Lipsum.utf16.txt
-F ./lipsum/Emoji-Lipsum.utf16.txt
-F ./lipsum/Latin-Lipsum.utf16.txt
-F ./lipsum/Chinese-Lipsum.utf16.txt
-F ./lipsum/Russian-Lipsum.utf16.txt
-F ./wikipedia_mars/chinese.utf16.txt
-F ./wikipedia_mars/french.utf16.txt
-F ./wikipedia_mars/russian.utf16.txt
-F ./wikipedia_mars/greek.utf16.txt
-F ./wikipedia_mars/hindi.utf16.txt
-F ./wikipedia_mars/czech.utf16.txt
-F ./wikipedia_mars/vietnamese.utf16.txt
-F ./wikipedia_mars/turkish.utf16.txt
-F ./wikipedia_mars/persan.utf16.txt
-F ./wikipedia_mars/hebrew.utf16.txt
-F ./wikipedia_mars/german.utf16.txt
-F ./wikipedia_mars/esperanto.utf16.txt
-F ./wikipedia_mars/thai.utf16.txt
-F ./wikipedia_mars/arabic.utf16.txt
-F ./wikipedia_mars/korean.utf16.txt
-F ./wikipedia_mars/english.utf16.txt
-F ./wikipedia_mars/portuguese.utf16.txt
-F ./wikipedia_mars/japanese.utf16.txt"

UTF32_TXT="-F ./lipsum/Hindi-Lipsum.utf32.txt
-F ./lipsum/Chinese-Lipsum.utf32.txt
-F ./lipsum/Arabic-Lipsum.utf32.txt
-F ./lipsum/Korean-Lipsum.utf32.txt
-F ./lipsum/Hebrew-Lipsum.utf32.txt
-F ./lipsum/Latin-Lipsum.utf32.txt
-F ./lipsum/Japanese-Lipsum.utf32.txt
-F ./lipsum/Russian-Lipsum.utf32.txt
-F ./lipsum/Emoji-Lipsum.utf32.txt
-F ./wikipedia_mars/vietnamese.utf32.txt
-F ./wikipedia_mars/hindi.utf32.txt
-F ./wikipedia_mars/hebrew.utf32.txt
-F ./wikipedia_mars/japanese.utf32.txt
-F ./wikipedia_mars/chinese.utf32.txt
-F ./wikipedia_mars/french.utf32.txt
-F ./wikipedia_mars/czech.utf32.txt
-F ./wikipedia_mars/thai.utf32.txt
-F ./wikipedia_mars/english.utf32.txt
-F ./wikipedia_mars/greek.utf32.txt
-F ./wikipedia_mars/german.utf32.txt
-F ./wikipedia_mars/arabic.utf32.txt
-F ./wikipedia_mars/korean.utf32.txt
-F ./wikipedia_mars/russian.utf32.txt
-F ./wikipedia_mars/esperanto.utf32.txt
-F ./wikipedia_mars/turkish.utf32.txt
-F ./wikipedia_mars/persan.utf32.txt
-F ./wikipedia_mars/portuguese.utf32.txt"

# convert_latin1_to_utf16
# convert_latin1_to_utf32
# convert_latin1_to_utf8

./benchmark  -P convert_latin1_to_utf8+lasx  -P convert_latin1_to_utf8+lsx -P convert_latin1_to_utf8+fallback ${LATIN1_TXT} >> ${OUTPUT_DIR}/convert_latin1_to_utf8_lasx_lsx_fallback.txt
./benchmark -P convert_latin1_to_utf16+fallback -P convert_latin1_to_utf16+lsx -P convert_latin1_to_utf16+lasx ${LATIN1_TXT} >> ${OUTPUT_DIR}/convert_latin1_to_utf16_lasx_lsx_fallback.txt
./benchmark -P convert_latin1_to_utf32+fallback -P convert_latin1_to_utf32+lsx  -P convert_latin1_to_utf32+lasx ${LATIN1_TXT} >> ${OUTPUT_DIR}/convert_latin1_to_utf32_lasx_lsx_fallback.txt

# convert_utf16_to_latin1
# convert_utf16_to_latin1_with_errors
# convert_utf16_to_utf32
# convert_utf16_to_utf32_with_errors
# convert_utf16_to_utf8
# convert_utf16_to_utf8_with_errors
# count_utf16
# convert_valid_utf16_to_latin1
# convert_valid_utf16_to_utf32
# convert_valid_utf16_to_utf8
# validate_utf16
# validate_utf16_with_errors

./benchmark -P convert_utf16_to_latin1+fallback -P convert_utf16_to_latin1+lsx  -P convert_utf16_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf16.txt >> ${OUTPUT_DIR}/convert_utf16_to_latin1_lasx_lsx_fallback.txt
./benchmark -P convert_utf16_to_latin1_with_errors+fallback -P convert_utf16_to_latin1_with_errors+lsx  -P convert_utf16_to_latin1_with_errors+lasx -F ./lipsum/Latin-Lipsum.utf16.txt >> ${OUTPUT_DIR}/convert_utf16_to_latin1_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf16_to_latin1+fallback -P convert_valid_utf16_to_latin1+lsx  -P convert_valid_utf16_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf16.txt >> ${OUTPUT_DIR}/convert_valid_utf16_to_latin1_lasx_lsx_fallback.txt

./benchmark -P convert_utf16_to_utf32+fallback -P convert_utf16_to_utf32+lsx  -P convert_utf16_to_utf32+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_utf16_to_utf32_lasx_lsx_fallback.txt
./benchmark -P convert_utf16_to_utf32_with_errors+fallback -P convert_utf16_to_utf32_with_errors+lsx  -P convert_utf16_to_utf32_with_errors+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_utf16_to_utf32_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_utf16_to_utf8+fallback -P convert_utf16_to_utf8+lsx  -P convert_utf16_to_utf8+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_utf16_to_utf8_lasx_lsx_fallback.txt
./benchmark -P convert_utf16_to_utf8_with_errors+fallback -P convert_utf16_to_utf8_with_errors+lsx  -P convert_utf16_to_utf8_with_errors+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_utf16_to_utf8_with_errors_lasx_lsx_fallback.txt
./benchmark -P count_utf16+fallback -P count_utf16+lsx  -P count_utf16+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/count_utf16_lasx_lsx_fallback.txt

./benchmark -P convert_valid_utf16_to_utf32+fallback -P convert_valid_utf16_to_utf32+lsx  -P convert_valid_utf16_to_utf32+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_valid_utf16_to_utf32_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf16_to_utf8+fallback -P convert_valid_utf16_to_utf8+lsx  -P convert_valid_utf16_to_utf8+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/convert_valid_utf16_to_utf8_lasx_lsx_fallback.txt
./benchmark -P validate_utf16+fallback -P validate_utf16+lsx  -P validate_utf16+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/validate_utf16_lasx_lsx_fallback.txt
./benchmark -P validate_utf16_with_errors+fallback -P validate_utf16_with_errors+lsx  -P validate_utf16_with_errors+lasx ${UTF16_TXT} >> ${OUTPUT_DIR}/validate_utf16_with_errors_lasx_lsx_fallback.txt

# convert_utf32_to_latin1
# convert_utf32_to_latin1_with_errors
# convert_utf32_to_utf16
# convert_utf32_to_utf16_with_errors
# convert_utf32_to_utf8
# convert_utf32_to_utf8_with_errors
# convert_valid_utf32_to_latin1
# convert_valid_utf32_to_utf16
# convert_valid_utf32_to_utf8
# validate_utf32
# validate_utf32_with_errors

./benchmark -P convert_utf32_to_latin1+fallback -P convert_utf32_to_latin1+lsx  -P convert_utf32_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf32.txt >> ${OUTPUT_DIR}/convert_utf32_to_latin1_lasx_lsx_fallback.txt
./benchmark -P convert_utf32_to_latin1_with_errors+fallback -P convert_utf32_to_latin1_with_errors+lsx  -P convert_utf32_to_latin1_with_errors+lasx -F ./lipsum/Latin-Lipsum.utf32.txt >> ${OUTPUT_DIR}/convert_utf32_to_latin1_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf32_to_latin1+fallback -P convert_valid_utf32_to_latin1+lsx  -P convert_valid_utf32_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf32.txt >> ${OUTPUT_DIR}/convert_valid_utf32_to_latin1_lasx_lsx_fallback.txt

./benchmark -P convert_utf32_to_utf16+fallback -P convert_utf32_to_utf16+lsx  -P convert_utf32_to_utf16+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_utf32_to_utf16_lasx_lsx_fallback.txt
./benchmark -P convert_utf32_to_utf16_with_errors+fallback -P convert_utf32_to_utf16_with_errors+lsx  -P convert_utf32_to_utf16_with_errors+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_utf32_to_utf16_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_utf32_to_utf8+fallback -P convert_utf32_to_utf8+lsx  -P convert_utf32_to_utf8+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_utf32_to_utf8_lasx_lsx_fallback.txt
./benchmark -P convert_utf32_to_utf8_with_errors+fallback -P convert_utf32_to_utf8_with_errors+lsx  -P convert_utf32_to_utf8_with_errors+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_utf32_to_utf8_with_errors_lasx_lsx_fallback.txt

./benchmark -P convert_valid_utf32_to_utf16+fallback -P convert_valid_utf32_to_utf16+lsx  -P convert_valid_utf32_to_utf16+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_valid_utf32_to_utf16_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf32_to_utf8+fallback -P convert_valid_utf32_to_utf8+lsx  -P convert_valid_utf32_to_utf8+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/convert_valid_utf32_to_utf8_lasx_lsx_fallback.txt
./benchmark -P validate_utf32+fallback -P validate_utf32+lsx  -P validate_utf32+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/validate_utf32_lasx_lsx_fallback.txt
./benchmark -P validate_utf32_with_errors+fallback -P validate_utf32_with_errors+lsx  -P validate_utf32_with_errors+lasx ${UTF32_TXT} >> ${OUTPUT_DIR}/validate_utf32_with_errors_lasx_lsx_fallback.txt



# convert_utf8_to_latin1
# convert_utf8_to_latin1_with_errors
# convert_utf8_to_utf16
# convert_utf8_to_utf16_with_errors
# convert_utf8_to_utf32
# convert_utf8_to_utf32_with_errors
# count_utf8
# utf8_length_from_latin1
# validate_utf8
# validate_utf8_with_errors
# convert_valid_utf8_to_latin1
# convert_valid_utf8_to_utf16
# convert_valid_utf8_to_utf32

./benchmark -P convert_utf8_to_latin1+fallback -P convert_utf8_to_latin1+lsx  -P convert_utf8_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf8.txt >> ${OUTPUT_DIR}/convert_utf8_to_latin1_lasx_lsx_fallback.txt
./benchmark -P convert_utf8_to_latin1_with_errors+fallback -P convert_utf8_to_latin1_with_errors+lsx  -P convert_utf8_to_latin1_with_errors+lasx -F ./lipsum/Latin-Lipsum.utf8.txt >> ${OUTPUT_DIR}/convert_utf8_to_latin1_with_errors_lasx_lsx_fallback.txt
./benchmark -P utf8_length_from_latin1+fallback -P utf8_length_from_latin1+lsx  -P utf8_length_from_latin1+lasx -F ./lipsum/Latin-Lipsum.utf8.txt >> ${OUTPUT_DIR}/utf8_length_from_latin1_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf8_to_latin1+fallback -P convert_valid_utf8_to_latin1+lsx  -P convert_valid_utf8_to_latin1+lasx -F ./lipsum/Latin-Lipsum.utf8.txt >> ${OUTPUT_DIR}/convert_valid_utf8_to_latin1_lasx_lsx_fallback.txt

./benchmark -P convert_utf8_to_utf16+fallback -P convert_utf8_to_utf16+lsx  -P convert_utf8_to_utf16+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_utf8_to_utf16_lasx_lsx_fallback.txt
./benchmark -P convert_utf8_to_utf16_with_errors+fallback -P convert_utf8_to_utf16_with_errors+lsx  -P convert_utf8_to_utf16_with_errors+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_utf8_to_utf16_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_utf8_to_utf32+fallback -P convert_utf8_to_utf32+lsx  -P convert_utf8_to_utf32+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_utf8_to_utf32_lasx_lsx_fallback.txt
./benchmark -P convert_utf8_to_utf32_with_errors+fallback -P convert_utf8_to_utf32_with_errors+lsx  -P convert_utf8_to_utf32_with_errors+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_utf8_to_utf32_with_errors_lasx_lsx_fallback.txt
./benchmark -P count_utf8+fallback -P count_utf8+lsx  -P count_utf8+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/count_utf8_lasx_lsx_fallback.txt
./benchmark -P validate_utf8+fallback -P validate_utf8+lsx  -P validate_utf8+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/validate_utf8_lasx_lsx_fallback.txt
./benchmark -P validate_utf8_with_errors+fallback -P validate_utf8_with_errors+lsx  -P validate_utf8_with_errors+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/validate_utf8_with_errors_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf8_to_utf16+fallback -P convert_valid_utf8_to_utf16+lsx  -P convert_valid_utf8_to_utf16+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_valid_utf8_to_utf16_lasx_lsx_fallback.txt
./benchmark -P convert_valid_utf8_to_utf32+fallback -P convert_valid_utf8_to_utf32+lsx  -P convert_valid_utf8_to_utf32+lasx ${UTF8_TXT} >> ${OUTPUT_DIR}/convert_valid_utf8_to_utf32_lasx_lsx_fallback.txt



# -P detect_encodings+fallback
# -P detect_encodings+lsx

