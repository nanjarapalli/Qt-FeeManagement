import QtQuick 2.0
import QtQuick.Controls 1.4
import "../Framework"

Item {
    id: userArea

    Text {
        id: searchResult
        width: parent.width
        height: searchstring === "" ? 0 : 50
        visible: !(searchstring === "")
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        text: qsTr("SEARCH RESULT")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.userArea.fontSize
        color: FWTheme.userArea.fontColor
        elide: Text.ElideRight
    }

    StudentFilter {
        id: filter
        width: userArea.width
        anchors.top: searchResult.bottom
        groupVisible: (selectedGroup === 0)
        lineOpacity: 0.2
    }

    StudentList {
        id: userList
        width: parent.width
        anchors.top: filter.bottom
        anchors.bottom: parent.bottom
    }
}
