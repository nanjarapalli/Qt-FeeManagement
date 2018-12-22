import QtQuick 2.3
import QtQuick.Window 2.2
//import "Framework"

Item {
    id: root

    property int selectedGroup: 0
    property bool disableOnEditMode: false
    property bool alertPopupShown: alertPopup.state === "show"
    property var debugMessage: function (message) {
        console.debug(message);
    }

    ContentArea {
        id: mainArea
    }

    Footer {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width
        height: 50
    }

    MouseArea {
        anchors.fill: parent
        visible: (alertPopup.state === "show")
        onPressed: {
            if(alertPopup.noButtons)
                showAlertPopup(0)
        }
    }

    Alert {
        id: alertPopup
        anchors.left: parent.left
        width: parent.width
        borderbottom: "#FF645E"//"#E2C64D"
        icon: "qrc:/Images/ico-error.png"
        msg: qsTr("Do you want to move the user into the group 3 setter ?")

    }

    Component.onCompleted: {
        width = minimumWidth
        height = minimumHeight
    }

    function showAlertPopup(type)
    {
        if(type === 1){
            alertPopup.state = "show"
        }

        else if(type === 2){
            alertPopup.borderbottom = "#E2C64D"
            alertPopup.noButtons = true
            alertPopup.msg = qsTr("Please Cancel/Abort edit screen and perform other action")
            alertPopup.state = "show"
        }

        else{
            alertPopup.state = "hide"
            alertPopup.noButtons = false
        }
    }

    function updateUserNameOnChange(name)
    {
        userModel.setProperty(mainArea.selectedUserIndex, "name", name)
    }

    function removeUser()
    {
        userModel.remove(mainArea.selectedUserIndex)
        if((mainArea.selectedUserIndex === 0) && (userModel.count == 0))
        {
            console.log(mainArea.selectedUserIndex)
            mainArea.selectedUserIndex = -1
        }
    }

    function addUser(userName)
    {
        mainArea.selectedUser = userName
        classModel.setProperty(mainArea.selectedUserIndex,"name", userName)
    }

    function removeGroup()
    {
        classModel.remove(mainArea.selectedGroupIndex)
        if((mainArea.selectedGroupIndex === 0) && (classModel.count === 0))
        {
            console.log(mainArea.selectedGroupIndex)
            selectedGroup = 0
            mainArea.selectedGroupIndex = -1
        }
    }

    function addGroup(groupName)
    {
        mainArea.groupSelected = groupName
        classModel.setProperty(mainArea.selectedGroupIndex,"name", groupName)
    }

    function isUserExist(name)
    {
        var count = 0;
        for(var i=0;i < userModel.count; i++)
        {
            if(name === userModel.get(i).name)
                count++
        }
        if(count > 1)
            return true
        else
            return false
    }

    function isGroupExist(name)
    {
        var count = 0;
        for(var i=0;i < classModel.count; i++)
        {
            if(name === classModel.get(i).name)
                count++
        }
        if(count > 1)
            return true
        else
            return false
    }

    ListModel {
        id: userModel
        property string sortColumnName: ""
        property string order: "desc" //set to either asc or desc
        ListElement{name: "Student 1"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 2"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 3"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 4"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 5"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 6"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 7"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 8"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 9"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 10"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 11"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 12"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 13"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 14"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 15"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 16"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 17"; icon: "qrc:/Images/ico-user.png"}
        ListElement{name: "Student 18"; icon: "qrc:/Images/ico-user.png"}
    }

    ListModel {
        id: classModel
        ListElement {name: "LKG"}
        ListElement {name: "UKG"}
        ListElement {name: "Class I"}
        ListElement {name: "Class II"}
        ListElement {name: "Class III"}
        ListElement {name: "Class IV"}
        ListElement {name: "Class V"}
        ListElement {name: "Class VI"}
        ListElement {name: "Class VII"}
        ListElement {name: "Class VIII"}
        ListElement {name: "Class IX"}
        ListElement {name: "Class X"}
    }
}
