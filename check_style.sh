#!/bin/bash
function becho { echo -e "\n\e[1;34m $* \e[m"; }

#set -e
echo $1
japanese='亜-熙ぁ-んァ-ヶ'
eng='a-zA-Z'

becho "english word without spaces"
grep -n --color=auto -E "([${japanese}]?)([${eng}]+)[${japanese}]|[${japanese}]([${eng}]+)([${japanese}]?)" $1

becho "double spaces between words"
grep -n --color=auto -E "([${japanese}${eng}]?)([ 　][ 　]+)[${japanese}${eng}]|[${japanese}${eng}]([ 　][ 　]+)([${japanese}${eng}]?)" $1

becho "spaces next to brackets"
grep -n --color=auto -E "([\{\(\[]([ 　]+)[${japanese}${eng}])|([${japanese}${eng}]([ 　]+)[\}\)\]])" $1

becho "spaces next to kutouten"
grep -n --color=auto -E "(([。、]?)([ 　]+)([。、]))|(([。、])([ 　]+)([。、]?))" $1

becho "spaces top of the line"
grep -n --color=auto -E "^[ 　][${japanese}${eng}]+" $1

becho "lack of space outside of ()"
grep -n --color=auto -E "[${japanese}${eng}]\(|\)[${japanese}${eng}]" $1

becho "unnecessary spaces outside of （）"
grep -n --color=auto -E "[ 　]\（|\）[ 　]" $1

#\citeの前後にも半角スペースが入っているか確認する
