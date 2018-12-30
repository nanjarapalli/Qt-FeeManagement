import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import "../Framework"
Item {
    id: userList
    property string filterString: searchstring
    property bool sortUsers: sortUser
    property bool sortGroups: sortGroup
    property int shiftHold: -1

    onFilterStringChanged: sortFilterProxyModel_Codes.setFilterFixedString(filterString)

    onSortUsersChanged: {
        sortFilterProxyModel_Codes.sortRoleName = "name"
        sortFilterProxyModel_Codes.sort(sortUsers)
    }

    onSortGroupsChanged: {
        sortFilterProxyModel_Codes.sortRoleName = "icon"
        sortFilterProxyModel_Codes.sort(sortGroups)
    }


    Component {

        id: userListHighLight
        Rectangle {
            id: userListHighLightRect
            width: usersListView.width
            height: 40
            color: "#23A0E9"
            opacity: 0.5
        }
    }

    Component {
        id: userDelegate
        Student {
            id: user
            width: parent.width
            height: 40
            borderBottom: index === (usersListView.count - 1) ? false : true
            userName: name//"Tom Schuhmacher"
            groupImg: "qrc:/Images/ico-user.png"
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if ((mouse.button === Qt.LeftButton) && (mouse.modifiers & Qt.ShiftModifier )){
                        if(shiftHold == -1){
                            shiftHold = index
                            user.DelegateModel.inSelected = !user.DelegateModel.inSelected
                        }
                        console.log("pressed: ", shiftHold)
                    }
                }

                onClicked: {
                    if ((mouse.button === Qt.LeftButton) && (mouse.modifiers & Qt.ControlModifier )){
                        user.DelegateModel.inSelected = !user.DelegateModel.inSelected
                    }
                    else if ((mouse.button === Qt.LeftButton) && (mouse.modifiers & Qt.ShiftModifier )){

                        if(shiftHold != -1)
                        {
                            var start
                            if(shiftHold < index)
                            {
                                start = shiftHold
                                shiftHold = index
                            }
                            else{
                                start = index
                            }
//                            console.log("clicked: ", start, shiftHold)
                            for(var i = start; i < shiftHold; i++)
                            {
                                visualModel.items.get(visualModel.items.get(i).itemsIndex).inSelected = true
                            }
                            user.DelegateModel.inSelected = !user.DelegateModel.inSelected
                            shiftHold = -1
                        }

                        if(shiftHold == -1){
                            shiftHold = index
                            user.DelegateModel.inSelected = !user.DelegateModel.inSelected
                            //                            console.log("pressed: ", shiftHold)
                        }

                    }
                    else{
                        console.log(visualModel.items.get(index).itemsIndex, visualModel.count)
                        for(var j = 0; j < visualModel.count; j++)
                        {
                            if((visualModel.items.get(j).itemsIndex !== index) && (visualModel.items.get(visualModel.items.get(j).itemsIndex).inSelected))
                                visualModel.items.get(visualModel.items.get(j).itemsIndex).inSelected = false
                            //                            console.log(visualModel.items.get(visualModel.items.get(j).itemsIndex).inSelected)
                        }
                        shiftHold = -1
                        user.DelegateModel.inSelected = !user.DelegateModel.inSelected
                        selectedUser = name
                        selectedUserIndex = index
                        //                        console.log("usersListView.currentIndex", usersListView.currentIndex)
                    }

                }
            }

            Rectangle {
                id: userListHighLightRect
                anchors.fill: parent
                color: "#23A0E9"
                opacity: 0.5
                visible: user.DelegateModel.inSelected
            }
        }

    }

    ListView {
        id: usersListView
        width: usersListScrollBar.visible ? parent.width - usersListScrollBar.width - 5 : parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        model: visualModel
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
        currentIndex: selectedUserIndex
    }

    FWScrollBar {
        id:usersListScrollBar
        style: FWTheme
        flickable: usersListView
        anchors.left: usersListView.right
        anchors.leftMargin: 5
    }

    DelegateModel {
        id: visualModel
        groups: [
            DelegateModelGroup { name: "selected" }
        ]
        model: studentModel
        delegate: userDelegate
    }
}
