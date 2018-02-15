#!/bin/sh -e

start_time=`date +%s`
echo '# BEGIN ########################################'

if [ "${TARGET-undef}" = "undef" ]; then
  echo "Please enter TARGET filename"
  exit 1
fi

set -x

./vendor/bin/asciidoctor-pdf \
  -r asciidoctor-pdf-cjk-kai_gen_gothic \
  -r asciidoctor-diagram \
  -D ./out \
  -a pdf-stylesdir=./themes \
  -a pdf-style=basic \
  ${TARGET}

find ./src -name "diag-*.png" | xargs -I{} rm -fv {}

set +x

end_time=`date +%s`
time=$((end_time - start_time))

echo '# Processing time:' $time 'sec'
echo '# DONE #########################################'
