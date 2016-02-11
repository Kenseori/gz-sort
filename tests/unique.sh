#!/bin/sh

tput bold; echo "$0"; tput sgr0
true_md5="$(zcat tests/sorted_words.gz | uniq | md5sum)"

./gz-sort -u tests/random_words.gz tests/result.gz
test_md5="$(zcat tests/result.gz | md5sum)"
if [ "$true_md5" != "$test_md5" ]; then
    tput setaf 1; tput rev; echo "ERROR - $0"; tput sgr0
    exit 1
fi
