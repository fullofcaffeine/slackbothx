#!/bin/sh

DIRECTORY="./test"

for test_file in $DIRECTORY/**/*Test.hx; do
  echo $test_file
  CLASS_NAME=`sed "s/\.//g; s/\//\./g; s/hx//g; 1s/\.//;t" <<< $test_file`
  TARGET_DIRECTORY=./dest/`sed  "1s/\.//;t" <<< ${test_file%/*}`/
  FILE_NAME=`sed "s/hx/js/g" <<< ${test_file##*/}`
  haxe -cp js-kit -cp src -cp test -cp hxnodejs/src -lib tink_core -lib tink_await -dce full -main $CLASS_NAME -js $TARGET_DIRECTORY/$FILE_NAME
done
