#!/bin/bash

for f in $(find . -type f -name *.java | grep -v "Test.java"); do
    # echo $i
    # Select all Strings
    # grep "\"[^\"]\+\"" $i
    # Mark constant Strings for translation
    sed -i "s/\(static final String.*\)\(\"[^\"]\+\"\)/\1i18N.marktr(\2)/g" $f
done
