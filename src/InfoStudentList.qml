import QtQuick 2.0
import "../Framework"

Item {
    anchors.fill: parent
    Text {
        id: label
        width: parent.width - 40
        height: 14
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 28
        text: qsTr("ADD USER")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.inputText.labelFontSize
        color: FWTheme.inputText.fontColorNormal
        elide: Text.ElideRight
    }

    UserFilter {
        id: filter
        width: parent.width - 30
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: label.bottom
        anchors.topMargin: 22
        lineOpacity: 0
    }

    UserList {
        id: userList
        width: parent.width - 30
        anchors.left: filter.left
        anchors.top: filter.bottom
        anchors.bottom: saveBtn.top
        anchors.bottomMargin: 23
    }

    FWButton {
        id: saveBtn
        anchors.left: label.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        text: qsTr("Accept")
        img: "qrc:/Images/ico-confirm.png"
    }

    FWButton {
        id: abortbtn
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: saveBtn.bottom
        text: qsTr("Abort")
        img: "qrc:/Images/ico-cancel.png"
        onButtonClicked: showUserInsertOverlay = false
    }
}

