import QtQuick 2.0
import "../Framework"

Item {
    id: user
    width: parent.width
    height: 40
    property alias borderBottom: bootomBorder.visible
    property alias userName: userName.text
    property alias groupImg: groupImg.source

    Text {
        id: userName
        height: 49
        anchors.top: parent.top
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: groupImg.left
        anchors.rightMargin: 60
        text: username
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.userArea.fontSize
        color: FWTheme.userArea.fontColor
        elide: Text.ElideRight
    }

    Image {
        id: groupImg
        width: FWTheme.userArea.itemIconSize
        height: FWTheme.userArea.itemIconSize
        anchors.top: parent.top
        anchors.topMargin: 7
        anchors.right: parent.right
        anchors.rightMargin: 10
        source: groupimg
    }

    Rectangle {
        id: bootomBorder
        width: parent.width
        height: FWTheme.userArea.border
        color: FWTheme.userArea.itembordercolor
        anchors.bottom: parent.bottom
        visible: borderbottom
    }
}

