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
        text: qsTr("PayFee")
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Pay Button is Clicked")
        }
    }

    FWButton {
        text: "New Student"
        anchors.right: cancelBtn.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        enabled: !disableOnEditMode
        onButtonClicked: {
            mainArea.uistate = "addClass"
        }
    }}
