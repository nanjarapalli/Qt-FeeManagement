import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "../Framework"

Item{
    width: parent.width
    height: parent.height - 50
    property bool showUserInsertOverlay: false
    property string selectedUser: ""
    property int selectedUserIndex: 0
    property bool sortUser : false
    property bool sortGroup : false
    property bool addNewUser : false
    property bool addNewGroup : false
    property string searchstring: ""
    property string groupSelected: ""
    property alias selectedGroupIndex: navigation.groupIndex

    onAddNewGroupChanged: {
        if(addNewGroup){
            splitZone2.state = "addGroup"
        }
        else
        {
            splitZone2.state = "closeGroup"
        }
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

            MouseArea {
                anchors.fill: splitZone1
                visible: (disableOnEditMode || showUserInsertOverlay)
                onPressed: showAlertPopup(2)
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
                opacity: showUserInsertOverlay ? 0.5 : 1
            }

            MouseArea {
                anchors.fill: parent
                visible: disableOnEditMode
                onPressed: showAlertPopup(2)
            }

            Info {
                id: details
                width: 340
                height: parent.height - (119 + searchArea.height)
                anchors.left: userArea.right
                anchors.leftMargin: splitZone2.state === "addGroup" ? 0 : 60
                anchors.top: parent.top
                anchors.topMargin: 102
            }

            MouseArea {
                anchors.fill: parent
                visible: showUserInsertOverlay
                onPressed: showAlertPopup(2)
            }

            StudentInsertOverlay {
                id: userInsertOverlay
                width: parent.width
                height: parent.height - (searchArea.height + 70)
                anchors.top: parent.top
                anchors.topMargin: 102
                visible: showUserInsertOverlay
                onVisibleChanged: {
                    if(visible) {
                        disableOnEditMode = true
                        details.infoOverlayVisible = false
                    }
                    else
                        disableOnEditMode = false
                }
            }

            states: [
                State {
                    name: "addGroup"
                    PropertyChanges { target: userArea; opacity: 0; }
                    AnchorChanges { target: details; anchors.left: userArea.left ; }
                },
                State {
                    name: "closeGroup"
                    PropertyChanges { target: userArea; opacity: 1; }
                    AnchorChanges { target: details; anchors.left: userArea.right ; }
                }
            ]
            transitions: Transition {
                NumberAnimation { properties: "opacity"; duration: 250 }
                AnchorAnimation { duration: 250 }
            }
        }
    }
}
