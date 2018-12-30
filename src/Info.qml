import QtQuick 2.0

Item {
    id: infoArea
    property string selectedUserName: selectedUser
    property alias infoOverlayVisible: infoOverlay.visible

    onSelectedUserNameChanged: {
        if(showUserInsertOverlay == false)
        {
            infoOverlay.visible = true
            if(selectedUserName == "createNew")
                infoOverlay.overlaySource = "./InfoStudentEdit.qml"
            else
                infoOverlay.overlaySource = "./InfoStudentDetail.qml"
        }
    }

//    InfoSortDetails {
//        anchors.fill: parent
//    }

    AddStudent {
        anchors.fill: parent
    }

    InfoOverlay {
        id: infoOverlay
        visible: false
        onCloseOverlay: {
            selectedUser = "????"
            visible = false
        }
    }
}
