#!/bin/bash

cd "$(dirname "$0")"

echo "------------------------------------------------------"
echo "                   INMOOV LAUNCHER                    "
echo "------------------------------------------------------"

if [[ $# -gt 0 ]]; then
	case $1 in
                -i|--install)
                cp ./myrobotlab-$2.jar ./myrobotlab.jar
		rm -r .mrluptodate 2>/dev/null
                ;;
		-u|--update)
		rm -r .mrluptodate 2>/dev/null
		;;
		-h|--help)
		echo "inmoov.sh <option>"
		echo "          where option is:"
		echo "                -i or --install <mrl_version>"
		echo "                -u or --update"
		echo "                -h or --help"
		exit 1
		;;
	esac
else
	if [[ -e ./mrlNeedReinstall ]]; then
		echo "Update requested. Do you wish to update this program now?"
		select opt in "Yes" "No" "Cancel"; do
			case $opt in
				Yes) rm -r .mrluptodate 2>/dev/null; break;;
				No) break;;
				Cancel) exit 1;;
			esac
		done
	fi
fi

echo "------------------------------------------------------"
echo "LOG CLEAN UP - Free space disk and send clean noworky "
echo "------------------------------------------------------"
echo "==> purge old logs..."; rm myrobotlab.log.1 2>/dev/null
echo "==> save last log..."; mv myrobotlab.log myrobotlab.log.1 2>/dev/null

if [[ ! -e ./.mrluptodate ]]; then
        echo "------------------------------------------------------"
        echo "INSTALL / UPDATE MRL - This may take a few minutes    "
        echo "------------------------------------------------------"
        echo "==> remove directories and files..."
        #rm -r .myrobotlab 2>/dev/null
        rm -r haarcascades 2>/dev/null
        rm -r hogcascades 2>/dev/null
        rm -r lbpcascades 2>/dev/null
        rm -r libraries 2>/dev/null
        rm -r pythonModules 2>/dev/null
        rm -r resource 2>/dev/null
        rm -r tessdata 2>/dev/null
        rm ivychain.xml 2>/dev/null
        rm myrobotlab.log 2>/dev/null
        rm repo.json 2>/dev/null
	rm mrlNeedReinstall 2>/dev/null
        rm .myrobotlab/serviceData.json 2>/dev/null
        echo "==> start installation / update ..."; java -jar myrobotlab.jar -install
        touch .mrluptodate 2>/dev/null
        echo "==> installation done."
        echo "==> convert files..."
	./convfiles.sh 2>/dev/null
        echo "==> done. Install / update finished."
        sleep 5
fi

clear
echo "------------------------------------------------------"
echo "START MRL & INMOOV"
echo "------------------------------------------------------"
java -jar myrobotlab.jar -service python Python -invoke python execFile ./InMoov/InMoov.py

exit 0
