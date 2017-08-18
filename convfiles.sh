#!/bin/bash

find . -name "*.json" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.xml" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.py" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.config" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.aiml" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.csv" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.txt" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.md" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.j3m" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.j3odata" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.jmp" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.lang" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.ini" -type f -exec sed -i $'s/\r//' {} \;
find . -name "*.sh" -type f -exec sed -i $'s/\r//' {} \;

echo "==> disable healthcheck script"
rm ./InMoov/life/HealthCheck.py.old 2>/dev/null
mv ./InMoov/life/HealthCheck.py ./InMoov/life/HealthCheck.py.old 2>/dev/null

echo "==> install french voice"
cp ./voice-upmc-pierre-hsmm-5.1.jar ./libraries/jar 2>/dev/null
cp ./voice-upmc-pierre-hsmm-5.1.jar ./repo/marytts/marytts/jars 2>/dev/null

echo "==> update files with my arguments"
sed -i -e 's/patienter 10 secondes/patienter quelques secondes/g' ./InMoov/system/languagePack/fr/general.lang 2>/dev/null
sed -i -e 's/wait 10 seconds/wait few seconds/g' ./InMoov/system/languagePack/en/general.lang 2>/dev/null

exit 0
