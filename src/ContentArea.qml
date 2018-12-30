import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import "../Framework"

Item{
    id: root
    width: parent.width
    height: parent.height - 50
    property string selectedUser: ""
    property int selectedUserIndex: 0
    property bool sortUser : false
    property bool sortGroup : false
    property bool addNewUser : false
    property bool addNewGroup : false
    property string searchstring: ""
    property string groupSelected: ""
    property alias selectedGroupIndex: navigation.groupIndex
    property alias uistate: splitZone2.state

    onSelectedUserChanged: {
        uistate = "showstudentdetails"
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        handleDelegate: Rectangle{opacity: 0}
        Item {
            id: splitZone1
            anchors.left: parent.left
            anchors.top: parent.top
            Layout.minimumWidth: FWTheme.navigationArea.minimumWidth
            height: parent.height - 50

            Navigation {
                id: navigation
                anchors.fill: parent
            }
        }

        Item {
            id: splitZone2
            anchors.left: splitZone1.right
            anchors.top: parent.top
            Layout.minimumWidth: 760

            SearchBar {
                id: searchArea
                anchors.left: parent.left
                anchors.top: parent.top
                width: parent.width
                height: 51

            }

            StudentArea {
                id: userArea
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 52
                width: parent.width - (details.width + 140)
                height: parent.height - (searchArea.height)
            }

            Loader {
                id: details
                width: 340
                height: parent.height - (119 + searchArea.height)
                anchors.left: userArea.right
                anchors.leftMargin: splitZone2.state === "addClass" ? 0 : 60
                anchors.top: parent.top
                anchors.topMargin: 102
                source: "Metrics.qml"
            }

            states: [
                State {
                    name: "addClass"
                    PropertyChanges { target: userArea; opacity: 0; }
                    PropertyChanges { target: details; source: "AddStudent.qml"; }
                    AnchorChanges { target: details; anchors.left: userArea.left ; }
                },
                State {
                    name: "showstudentdetails"
                    PropertyChanges { target: userArea; opacity: 1; }
                    PropertyChanges { target: details; source: "StudentDetails.qml"; }
                    AnchorChanges { target: details; anchors.left: userArea.right ; }
                },
                State {
                    name: "metrics"
                    PropertyChanges { target: userArea; opacity: 1; }
                    PropertyChanges { target: details; source: "Metrics.qml"; }
                    AnchorChanges { target: details; anchors.left: userArea.right ; }
                }
            ]
            transitions: Transition {
                    ParallelAnimation {
                        NumberAnimation { properties: "opacity"; duration: 250 }
                        AnchorAnimation { duration: 250 }
                    }

            }
        }
    }
}
