import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import "../Framework"

Rectangle {
    id: root
    color: FWTheme.infoArea.backgroundColor
    ColumnLayout {
        id: _columnLayout
        enabled: false
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5
        signal editClicked()
        signal removeClicked()
        signal cancelClicked()

        // Name
        RowLayout {
            width: _columnLayout.width
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
            width: _columnLayout.width
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
                id: classComboBox
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
                Layout.minimumWidth: 100
                model: [ "Male", "Female" ]
                onCurrentIndexChanged: console.debug(model[currentIndex])
            }
        }

        // Date of birth
        RowLayout {
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
            width: _columnLayout.width
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
    }
    // cancel or save
    RowLayout {
        id: _optionsRow
        width: _columnLayout.width
        Layout.minimumHeight: 40
        anchors.bottom: parent.bottom
        spacing: 10
        property bool editMode: false
        FWButton {
            id: cancelBtn
            text: qsTr("Close")
            img: "qrc:/Images/ico-cancel.png"
            onButtonClicked: {
                _optionsRow.editMode = false
                uistate = "metrics";
                console.log("InfoStudentDetail.qml -> cancelBtn -> onButtonClicked")
            }
        }

        FWButton {
            id: saveCloseBtn
            text: _optionsRow.editMode ? qsTr("Save") : qsTr("Edit")
            img: _optionsRow.editMode ? "qrc:/Images/ico-confirm.png" : "qrc:/Images/ico-edit.png"
            onButtonClicked: {
                _optionsRow.editMode = !_optionsRow.editMode
                console.log("InfoStudentDetail.qml -> saveCloseBtn -> onButtonClicked -> editMode" + _optionsRow.editMode)
            }
        }
        // dummp to manage in ColumnLayout
        Item {
            Layout.fillWidth: true
        }
    }
}
