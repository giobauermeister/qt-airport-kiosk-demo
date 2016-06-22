import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    width: 1024; height: 600

    Image {
        id: welcome
        source: "images/welcome-screen-toradex.png"
        anchors.fill: parent
        visible: true
    }

    Image {
        id: clouds
        source: "images/clouds-gray.jpg"
        anchors.fill: parent
        visible: false

        Image {
            id: topBar
            source: "images/top-bar.png"
            x: 0; y: 0
            width: clouds.width

            Image {
                id: trdxLogo
                source: "images/toradex-logo-white-small.png"
                anchors.left: topBar.left
                anchors.leftMargin: 10
                anchors.verticalCenter: topBar.verticalCenter
            }
            //close button, goes back to start screen
            Rectangle {
                id: btnClose
                width: btnCloseTxt.width; height: btnCloseTxt.height
                anchors.right: topBar.right
                anchors.rightMargin: 25
                anchors.verticalCenter: topBar.verticalCenter
                color: "transparent"

                Text {
                    id: btnCloseTxt
                    text: qsTr("Close Window")
                    color: "white"
                }

                MouseArea {
                    anchors.fill: btnClose
                    onClicked: {
                        welcome.visible = true
                        btnStart.visible = true
                        clouds.visible = false
                    }
                }
            }

            Image {
                id: whiteBar
                source: "images/white-bar.png"
                x: 0; y: 51
                width: clouds.width

                Text {
                    id: whiteBarText
                    text: qsTr("TORADEX KIOSK CHECK-IN")
                    anchors.top: whiteBar.top
                    anchors.topMargin: 5
                    anchors.horizontalCenter: whiteBar.horizontalCenter
                    color: "#07518E"
                    font.pixelSize: 33
                    font.letterSpacing: 7
                }

                //buttons row
                Item {
                    id: btnRow
                    width: 200; height: 50
                    anchors.bottom: whiteBar.bottom
                    anchors.right: whiteBar.horizontalCenter
                    anchors.rightMargin: 220

                    Row {
                        spacing: 10

                        Rectangle {
                            width: 200; height: 50
                            id: rec1; color: "#C70E17"

                            Text {
                                id: rec1Txt
                                text: qsTr("The Basics")
                                color: "white"
                                font.pixelSize: 20
                                anchors.horizontalCenter: rec1.horizontalCenter
                                anchors.verticalCenter: rec1.verticalCenter
                            }

                            MouseArea {
                                anchors.fill: rec1
                                onPressed: rec1.color = "#C78185"
                                onClicked: {
                                    rec1.color = "#C70E17" //red
                                    rec2.color = "#6F99F2" //blue
                                    rec3.color = "#6F99F2" //blue
                                    rec4.color = "#6F99F2" //blue

                                    btn1Image.visible = true
                                    btn2Image.visible = false
                                    btn3Image.visible = false
                                    btn4Image.visible = false
                                }
                            }
                        }

                        Rectangle {
                            width: 200; height: 50
                            id: rec2; color: "#6F99F2"

                            Text {
                                id: rec2Txt
                                text: qsTr("Change Seats")
                                color: "white"
                                font.pixelSize: 20
                                anchors.horizontalCenter: rec2.horizontalCenter
                                anchors.verticalCenter: rec2.verticalCenter
                            }

                            MouseArea {
                                anchors.fill: rec2
                                onPressed: rec2.color = "#C78185"
                                onClicked: {
                                    rec1.color = "#6F99F2" //blue
                                    rec2.color = "#C70E17" //red
                                    rec3.color = "#6F99F2" //blue
                                    rec4.color = "#6F99F2" //blue

                                    btn1Image.visible = false
                                    btn2Image.visible = true
                                    btn3Image.visible = false
                                    btn4Image.visible = false
                                }
                            }
                        }

                        Rectangle {
                            width: 200; height: 50
                            id: rec3; color: "#6F99F2"

                            Text {
                                id: rec3Txt
                                text: qsTr("Flight Info")
                                color: "white"
                                font.pixelSize: 20
                                anchors.horizontalCenter: rec3.horizontalCenter
                                anchors.verticalCenter: rec3.verticalCenter
                            }

                            MouseArea {
                                anchors.fill: rec3
                                onPressed: rec3.color = "#C78185"
                                onClicked: {
                                    rec1.color = "#6F99F2" //blue
                                    rec2.color = "#6F99F2" //blue
                                    rec3.color = "#C70E17" //red
                                    rec4.color = "#6F99F2" //blue

                                    btn1Image.visible = false
                                    btn2Image.visible = false
                                    btn3Image.visible = true
                                    btn4Image.visible = false
                                }
                            }
                        }

                        Rectangle {
                            width: 200; height: 50
                            id: rec4; color: "#6F99F2"

                            Text {
                                id: rec4Txt
                                text: qsTr("Where are we?")
                                color: "white"
                                font.pixelSize: 20
                                anchors.horizontalCenter: rec4.horizontalCenter
                                anchors.verticalCenter: rec4.verticalCenter
                            }

                            MouseArea {
                                anchors.fill: rec4
                                onPressed: rec4.color = "#C78185"
                                onClicked: {
                                    rec1.color = "#6F99F2" //blue
                                    rec2.color = "#6F99F2" //blue
                                    rec3.color = "#6F99F2" //blue
                                    rec4.color = "#C70E17" //red

                                    btn1Image.visible = false
                                    btn2Image.visible = false
                                    btn3Image.visible = false
                                    btn4Image.visible = true
                                }           
                            }
                        }
                    }
                }
            }
        }

        Image {
            id: btn1Image
            width: 700; height: 350
            source: "images/banner.png"
            anchors.horizontalCenter: clouds.horizontalCenter
            anchors.verticalCenter: clouds.verticalCenter
            anchors.verticalCenterOffset: 60
        }

        Image {
            id: btn2Image
            width: 700; height: 350
            source: "images/seats-plane2.png"
            anchors.horizontalCenter: clouds.horizontalCenter
            anchors.verticalCenter: clouds.verticalCenter
            anchors.verticalCenterOffset: 60
        }

        Image {
            id: btn3Image
            width: 700; height: 350
            source: "images/flight-info-trdx.png"
            anchors.horizontalCenter: clouds.horizontalCenter
            anchors.verticalCenter: clouds.verticalCenter
            anchors.verticalCenterOffset: 60
        }

        Image {
            id: btn4Image
            width: 700; height: 350
            source: "images/banner3.png"
            anchors.horizontalCenter: clouds.horizontalCenter
            anchors.verticalCenter: clouds.verticalCenter
            anchors.verticalCenterOffset: 60
        }

    }

    //start screen button
    Rectangle {
        id: btnStart
        width: 250; height: 70
        anchors.right: clouds.right
        anchors.rightMargin: 90
        anchors.bottom: clouds.bottom
        anchors.bottomMargin: 130
        visible: true

        Image {
            id: btnImage
            source: "images/btn-toradex.png"
            anchors.fill: parent
            visible: true
        }

        MouseArea {
            anchors.fill: btnStart
            onClicked: {
                welcome.visible = false
                btnStart.visible = false
                clouds.visible = true
            }
        }
    }
}
