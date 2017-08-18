#!/bin/bash

cd "$(dirname "$0")"

echo "------------------------------------------------------"
echo "                   INMOOV LAUNCHER                    "
echo "------------------------------------------------------"
echo "START MRL & OPENCV"
echo "------------------------------------------------------"
java -Xmx2048m -jar myrobotlab.jar -invoke python -service GUIService GUIService SwingGui SwingGui python Python opencv OpenCV

exit 0
