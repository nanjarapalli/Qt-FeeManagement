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

        InfoSortTitle {
            id: sortTitle
            width: parent.width
            height: 40
            anchors.top: parent.top
            anchors.left: parent.left
        }
    }
}

