import QtQuick 2.0
import "../Framework"

Item {
    StudentDragDrop {
        id: emptyList
        width: parent.width - (infoUserList.width + 140)
        height: parent.height - 50
        anchors.top: parent.top
        anchors.right: infoUserList.left
        anchors.rightMargin: 60

    }

    Item {
        id: infoUserList
        width: 340
        height: parent.height - (69)
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.top: parent.top

        Rectangle {
            anchors.fill: parent
            color: FWTheme.infoOverlay.transparentColor
            opacity: FWTheme.infoOverlay.transparentOpacity
        }

//        Rectangle {
//            width: 340
//            anchors.top: parent.top
//            anchors.topMargin: 56
//            anchors.bottom: parent.bottom
//            color: FWTheme.infoOverlay.backgroundColor
//            radius: 3

//            Image {
//                id: closeImg
//                width: 16
//                height: 16
//                anchors.right: parent.right
//                anchors.rightMargin: 4
//                anchors.top: parent.top
//                anchors.topMargin: 4
//                source: "./Images/ico-close.png"
//                MouseArea {
//                    anchors.fill: parent
//                    hoverEnabled :true
//                    cursorShape: Qt.PointingHandCursor
//                    onClicked: {
//                        showUserInsertOverlay = false
//                    }
//                }
//            }

//            InfoUserList {
//            }
//        }
    }
}

