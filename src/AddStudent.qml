import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.LocalStorage 2.0
import "../Framework"
import "Database.js" as JS
Rectangle {
    color: FWTheme.infoArea.backgroundColor
    readonly property string name: _nameInput.text
    readonly property string standardClass: _classComboBox.currentText
    readonly property string rollnumber: _rollnumberTextInput.text
    readonly property string gender: _genderComboBox.currentText
    readonly property string dob: _nameInput.text
    readonly property string fatherName: _fathernameTextInput.text
    readonly property string motherName: _mothernameTextInput.text
    readonly property string mobile: _mobileTextInput.text
    readonly property string regularfee: _regularfeeTextInput.text
    readonly property string concession: _concessionTextInput.text
    readonly property string finalfee: _finalfeeTextInput.text
    ColumnLayout {
        id: root
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        // Name
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Name")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _nameInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: selectedUser
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // border
        Rectangle {
            id: borderUp
            width: parent.width
            height: FWTheme.infoOverlay.border
            color: FWTheme.infoOverlay.borderColor
        }

        //class and gender details
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Class")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }

            ComboBox {
                id: _classComboBox
                model: [ "LKG", "UKG", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X" ]
                onCurrentIndexChanged: console.debug(model[currentIndex])
            }

            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Text {
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Gender")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }

            ComboBox {
                id: _genderComboBox
                Layout.minimumWidth: 100
                model: [ "Male", "Female" ]
                onCurrentIndexChanged: console.debug(model[currentIndex])
            }
        }

        // Date of birth
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Date Of Birth")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 200
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _dobTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "08/12/2018"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }


        // Father Name
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("FatherName")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 200
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _fathernameTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "Ramamoorthy N"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // Modther Name
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("MotherName")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 200
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _mothernameTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "Kalavathi"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // RollNumber
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("RollNumber")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 200
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _rollnumberTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "06G11A0471"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // MobileNumber
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("MobileNumber")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 185
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _mobileTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "9880583033"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // RegularFee
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("RegularFee")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 185
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _regularfeeTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "10000"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // Consession
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Consession")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 185
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _concessionTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "3000"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }


        // FinalFee
        RowLayout {
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10

            Text {
                height: 34
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: qsTr("FinalFee")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoOverlay.fontSize
                font.weight: FWTheme.infoOverlay.labelFontWeight
                color: FWTheme.infoOverlay.fontColor
                elide: Text.ElideRight
            }
            // dummp to manage in ColumnLayout
            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.minimumWidth: 185
                Layout.minimumHeight: 30
                border.width: FWTheme.inputText.borderWidth
                border.color: FWTheme.inputText.borderColorDefault
                radius: FWTheme.inputText.borderRadius
                color: FWTheme.inputText.backgroundColor

                TextInput {
                    id: _finalfeeTextInput
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.centerIn: parent
                    text: "8000"
                    font.weight: Font.Normal
                    font.family: FWTheme.fontFamily
                    font.pixelSize: FWTheme.inputText.fontSize
                    color: FWTheme.inputText.fontColorNormal
                    clip: true
                }
            }
        }

        // dummp to manage in ColumnLayout
        Item {
            Layout.fillHeight: true
        }

        // cancel or save
        RowLayout {
            id: _optionsRow
            width: root.width
            Layout.minimumHeight: 40
            spacing: 10
            FWButton {
                id: cancelBtn
                text: qsTr("Cancel")
                img: "qrc:/Images/ico-cancel.png"
                onButtonClicked: {
                    console.log("XXXX AddStudent.qml -> _optionsRow -> cancelBtn -> cancelBtn -> onButtonClicked")
                    uistate = "metrics";
                }
            }

            FWButton {
                id: saveCloseBtn
                text: qsTr("Save & Close")
                img: "qrc:/Images/ico-confirm.png"
                onButtonClicked: {
                    JS.dbInsert("26/12/2018", name, standardClass, rollnumber, gender, dob, fatherName, motherName, mobile, regularfee, concession, finalfee)
                    uistate = "metrics";
                    console.log("XXXX AddStudent.qml -> _optionsRow -> cancelBtn -> saveCloseBtn -> onButtonClicked")
                }
            }

        }

    }
}

