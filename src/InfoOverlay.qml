import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import "../Framework"

Item {
    anchors.fill: parent
    signal closeOverlay()
    property alias overlaySource: overlayLoader.source

    Rectangle{
        anchors.fill: parent
        color: FWTheme.infoOverlay.transparentColor
        opacity: FWTheme.infoOverlay.transparentOpacity
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: false
        }
    }

    Rectangle {
        width: 340
        anchors.top: parent.top
        anchors.topMargin: 56
        anchors.bottom: parent.bottom
        color: FWTheme.infoOverlay.backgroundColor
        radius: 3

        Loader {
            id: overlayLoader
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            source: overlaySource
            onSourceChanged: overlayLoader.source == "qrc:/InfoStudentEdit.qml" ? disableOnEditMode = true : disableOnEditMode = false
        }

        Connections {
            target: overlayLoader.item
            ignoreUnknownSignals: true
            onEditClicked: overlayLoader.source = "./InfoStudentEdit.qml"
            onAbortClicked: overlayLoader.source = "./InfoStudentDetail.qml"
            onCancelClicked: overlayLoader.source = ""
            onSaveClicked: {
                addUser(selectedUser)
                overlayLoader.source = "./InfoStudentDetail.qml"
            }
            onDeleteClicked: {
                closeOverlay()
                overlayLoader.source = "./InfoStudentDetail.qml"
            }
        }

    }
}

