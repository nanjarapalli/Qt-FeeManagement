import QtQuick 2.0
import "../Framework"

Item {
    id: filterItem
    height: 50
    property alias groupVisible: groupImg.visible
    property alias lineOpacity: topBorder.opacity

    Rectangle {
        id: topBorder
        width: parent.width
        height: FWTheme.userArea.border
        color: FWTheme.userArea.borderColor
        anchors.top: parent.top
        anchors.topMargin: 49
    }

    Text {
        id: nameText
        height: 49
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        text: qsTr("Student")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.userArea.fontSize
        color: FWTheme.userArea.fontColor
    }

    Image {
        id: nameImg
        width: FWTheme.userArea.filterIconSize
        height: FWTheme.userArea.filterIconSize
        anchors.top: nameText.top
        anchors.left: nameText.right
        anchors.leftMargin: 10
        source: "qrc:/Images/ico-sort-asc.png"
        MouseArea {
            anchors.fill: parent
            hoverEnabled :true
            cursorShape: Qt.PointingHandCursor
            onClicked: sortUser = !sortUser
        }
    }

    Image {
        id: groupImg
        width: FWTheme.userArea.filterIconSize
        height: FWTheme.userArea.filterIconSize
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 10
        source: "qrc:/Images/ico-sort.png"
        MouseArea {
            anchors.fill: parent
            hoverEnabled :true
            cursorShape: Qt.PointingHandCursor
            onClicked: sortGroup = !sortGroup
        }
    }

    Text {
        id: groupText
        height: 49
        anchors.right: groupImg.left
        anchors.rightMargin: 10
        anchors.top: groupImg.top
        horizontalAlignment: Text.AlignRight
        text: qsTr("Class")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.userArea.fontSize
        visible: groupVisible
        color: FWTheme.userArea.fontColor
    }


}

