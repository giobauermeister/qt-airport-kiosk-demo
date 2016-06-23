# Qt5 Airport Check-in Kiosk Demo 2.0
##Qt5 demo application simulating a Check-In Kiosk at an airport
This is version 2 of the [original Airport Kiosk demo](https://github.com/giobauermeister/qt-checkin-kiosk-demo), it is all written in QML, and has a few other improvements.

<a href="https://drive.google.com/uc?export=view&id=0B7uO0jJfbFQIZzNmZ1VQOFJQOGc"><img src="https://drive.google.com/uc?export=view&id=0B7uO0jJfbFQIZzNmZ1VQOFJQOGc" height="450" width="600"/></a>

## Overview

Qt5 introduced a new environment variable which can be set to display multiple Qt applications in different screens (framebuffers). That feature is very useful in various types of dual display applications. With this project we are showing an example of a check-in kiosk in an ariport. The Check-In Kiosk Demo is intended to work together with the [Qt5 Airport Flight Timetable Demo 2.0](https://github.com/giobauermeister/qt-airport-timetable-demo). The demo should work without any issues using Toradex BSP V2.6.

## Steps to run the demo

An image with included demos can be built using the recipes found in [meta-projects](https://github.com/giobauermeister/meta-projects/tree/toradexImageV2.6) layer,
or the applications can be cross-compiled using Qt Creator and the source codes available.

This repository also includes a systemd UNIT file for starting the launching script at startup as well as the launching script itself. 

To launch the applications manually, set the enviroment variable with the desired framebuffer(eg. /dev/fb0):

    export QT_QPA_EGLFS_FB=/dev/fb0
    
and launch the application with the desired plugin(eg. EGLFS):

    airportKiosk -platform eglfs

## Steps to build the image
For building an image which includes this demo, first configure a build environment as seen in [Toradex Developer Website](http://developer.toradex.com) in the article [OpenEmbedded (core)](http://developer.toradex.com/knowledge-base/board-support-package/openembedded-(core)). Please follow the article carefully.

Inside stuff folder, clone the layer `meta-projects` from branch toradexImageV2.6

    cd ~/oe-core/stuff/
    git clone https://github.com/giobauermeister/meta-projects.git -b toradexImageV2.6
  
Add the layer in bblayers.conf

    ${TOPDIR}/../stuff/meta-projects \
  
In `local.conf` file, choose the MACHINE 

    MACHINE ?= "colibri-imx6"
    MACHINE ?= "apalis-ima6"
  
and add the following content:

    IMAGE_INSTALL_append = " \
        qtbase \
		qtbase-fonts \
		qtbase-plugins \
		qtquick1 \
		qtquick1-qmlplugins \
		qtquick1-plugins \                         
		packagegroup-qt5 \
		packagegroup-qt5-apps \
		qt-airport-kiosk-demo \
		qt-airport-timetable-demo \
		"               
     DISTRO_FEATURES_remove = "x11 wayland"

Finally bitbake `console-trdx-image`

Bellow is a video demonstrating the application

<a href="https://youtu.be/fto66r1GLrA"><img src="https://drive.google.com/uc?export=view&id=0B7uO0jJfbFQIZjdoM0d5M1ZtSXc"/></a>
