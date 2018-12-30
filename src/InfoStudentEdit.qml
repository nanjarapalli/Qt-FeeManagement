import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import "../Framework"

Item {
    anchors.fill: parent
    signal saveClicked()
    signal abortClicked()
    signal errorMessage()

    Rectangle {
        id: userNameRect
        width: 239
        height: FWTheme.inputText.height
        border.width: FWTheme.inputText.borderWidth
        border.color: isUserExist(userNameText.text) ? FWTheme.inputText.borderColorError : FWTheme.inputText.borderColorDefault
        radius: FWTheme.inputText.borderRadius
        color: FWTheme.inputText.backgroundColor
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 28

        TextInput {
            id: userNameText
            width: userNameRect.width - 24
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            text: selectedUser
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.inputText.fontSize
            color: FWTheme.inputText.fontColorNormal
            clip: true
            selectByMouse: true
        }
    }

    Rectangle {
        id: borderUp
        width: parent.width - 40
        height: FWTheme.infoOverlay.border
        anchors.left: userNameRect.left
        anchors.top: userNameRect.bottom
        anchors.topMargin: 18
        color: FWTheme.infoOverlay.borderColor
    }

    Text {
        id: passowrdTitle
        height: 14
        anchors.left: borderUp.left
        anchors.top: borderUp.bottom
        anchors.topMargin: 18
        verticalAlignment: Text.AlignVCenter
        text: qsTr("PASSWORD")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.inputText.labelFontSize
        color: FWTheme.inputText.labelColor
        elide: Text.ElideRight
    }

    Rectangle {
        id: passwordRect
        width: 239
        height: FWTheme.inputText.height
        border.width: FWTheme.inputText.borderWidth
        border.color: FWTheme.inputText.borderColorDefault
        radius: FWTheme.inputText.borderRadius
        color: FWTheme.inputText.backgroundColor
        anchors.left: passowrdTitle.left
        anchors.top: passowrdTitle.bottom
        anchors.topMargin: 10

        TextInput {
            id: passwordText
            width: passwordRect.width - 24
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.inputText.fontSize
            color: FWTheme.inputText.fontColorNormal
            clip: true
            echoMode: TextInput.Password
        }
    }

    Text {
        id: passowrdConfirm
        height: 14
        anchors.left: borderUp.left
        anchors.top: passwordRect.bottom
        anchors.topMargin: 18
        verticalAlignment: Text.AlignVCenter
        text: qsTr("PASSWORD Confirm")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.inputText.labelFontSize
        color: FWTheme.inputText.labelColor
        elide: Text.ElideRight
    }

    Rectangle {
        id: passwordConfirmRect
        width: 239
        height: FWTheme.inputText.height
        border.width: FWTheme.inputText.borderWidth
        border.color: passwordConfirmText.text != passwordText.text ? FWTheme.inputText.borderColorError : FWTheme.inputText.borderColorDefault
        radius: FWTheme.inputText.borderRadius
        color: FWTheme.inputText.backgroundColor
        anchors.left: passowrdConfirm.left
        anchors.top: passowrdConfirm.bottom
        anchors.topMargin: 10

        TextInput {
            id: passwordConfirmText
            width: passwordConfirmRect.width - 24
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.inputText.fontSize
            color: FWTheme.inputText.fontColorNormal
            clip: true
            echoMode: TextInput.Password
        }
    }

    CheckBox {
        id: checkBx
        width: 16
        height: 16
        anchors.left: passwordConfirmRect.left
        anchors.top: passwordConfirmRect.bottom
        anchors.topMargin: 15
        checked: true
        style: CheckBoxStyle {
            label: Text {
                id: checkboxtext
                width: 239
                height: 16
                verticalAlignment: Text.AlignVCenter
                text: qsTr("PASSWORD andem erlauben")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.checkBoxFontSize
                color: FWTheme.infoOverlay.fontColor
            }
        }
    }

    Rectangle {
        id: borderDown
        width: parent.width - 40
        height: FWTheme.infoOverlay.border
        anchors.left: checkBx.left
        anchors.top: checkBx.bottom
        anchors.topMargin: 15
        color: FWTheme.infoOverlay.borderColor
    }

    GridLayout {
        id: grid
        width: parent.width - 40
        anchors.left: borderDown.left
        anchors.top: borderDown.bottom
        anchors.topMargin: 15
        anchors.bottom: savebtn.top
        anchors.bottomMargin: 23
        columns: 2
        clip: true
        ExclusiveGroup { id: settingGroup }
        Repeater {
            model: 6
            delegate: Item {
                width: 124
                height: 24
                FWRadioButton {
                    id: selectBtn
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    exclusiveGroup: settingGroup
                }

                Text {
                    width: 124
                    height: 24
                    anchors.left: selectBtn.right
                    anchors.leftMargin: 10
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Integrator")
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.infoOverlay.fontSize
                    color: FWTheme.infoOverlay.fontColor
                    clip: true
                    elide: Text.ElideRight
                }
            }

        }

    }

    FWButton {
        id: savebtn
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        text: qsTr("Save")
        img: "qrc:/Images/ico-confirm.png"
        inActive: alertPopupShown
        onButtonClicked: {
            if(passwordConfirmText.text != passwordText.text)
            {
                passwordConfirmRect.border.color = "#FF645E"
                passwordText.cursorVisible = false
                passwordConfirmText.cursorVisible = false
                showAlertPopup(1)
            }
            else if(userNameRect.border.color === FWTheme.inputText.borderColorError)
            {
                showAlertPopup(1)
            }

            else
            {
                passwordConfirmRect.border.color = "#C0C0C0"
                selectedUser = userNameText.text
                updateUserNameOnChange(userNameText.text)
                saveClicked()
            }
        }
    }

    FWButton {
        id: abortbtn
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: savebtn.bottom
        text: qsTr("Abort")
        img: "qrc:/Images/ico-cancel.png"
        inActive: alertPopupShown
        onButtonClicked: abortClicked()
    }

}

