import QtQuick 2.0
import "../Framework"

Rectangle {
    width: 320
    color: "#EFF3F4"
    opacity: 0.9

    Text {
        id: dragAndDropText
        width: parent.width
        anchors.left: parent.left
        anchors.bottom: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Drag & Drop")
        font.family: FWTheme.fontFamily
        font.pixelSize: 36
        color: FWTheme.userArea.fontColor
        clip: true
        elide: Text.ElideRight
    }

    Text {
        id: infoText
        width: parent.width
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        verticalAlignment: Text.AlignTop
        text: qsTr("Drag the desired user in this field !")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.userArea.fontSize
        color: FWTheme.userArea.fontColor
        clip: true
        wrapMode: Text.Wrap
        elide: Text.ElideRight
    }

    BorderImage {
        source: "qrc:/Images/frame-dashed.png"
        width: parent.width
        height: parent.height

        horizontalTileMode: BorderImage.Round
        verticalTileMode: BorderImage.Round

        border{
            left: 8
            right: 8
            top:8
            bottom: 8
        }
    }
}

