import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "../Framework"

Rectangle {
    id: footer
    color: "#EFF3F4"

    Rectangle {
        width: parent.width
        height: FWTheme.footer.border
        color: FWTheme.footer.borderColor
    }

    FWButton {
        id: cancelBtn
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Close")
        img: "qrc:/Images/ico-cancel.png"
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Application closed by calling Qt.quit")
            Qt.quit()
        }
    }
    FWButton {
        id: payBtn
        anchors.left : parent.left
        anchors.leftMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        color: FWTheme.button.borderColorFocused
        text: qsTr("PayFee")
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Pay Button is Clicked")
        }
    }
    FWButton{
        id:allClass
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Add Class")
        color: FWTheme.button.borderColorFocused
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Add Class clicked")
        }
    }
    FWButton{
        id:allStudents
        anchors.left: parent.left
        anchors.leftMargin: 280
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Add Students")
        color: FWTheme.button.borderColorFocused
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Add Students clicked")
        }
    }

}
