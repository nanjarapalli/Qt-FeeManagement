import QtQuick 2.0
import "../Framework"

Rectangle {
    id: searchInfo
    color: FWTheme.infoArea.backgroundColor

    Item {
        id: label
        width: parent.width - 40
        height: 16
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20


        Text {
            width: parent.width - 26
            height: 16
            verticalAlignment: Text.AlignVCenter
            text: "Under Development"
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.infoArea.fontSize
            font.weight: FWTheme.infoArea.fontWeightLight
            color: FWTheme.infoArea.fontColorLight
            elide: Text.ElideRight
        }
    }
}

