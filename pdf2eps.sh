#!/bin/bash

#$1: 対象としたいpdfファイル名(拡張子無し)
#$2: $1内のページ番号
#$3: 出力したいファイル名
set -e

pdf_file=$1
output_file=$3

pdftk "${pdf_file}.pdf" cat $2 output tmp.pdf

pdfcrop "tmp.pdf"

pdftops -eps "tmp-crop.pdf"

mv "tmp-crop.eps" "${output_file}.eps"

rm -i "tmp-crop.pdf"
rm -i "tmp.pdf"
echo "done"
