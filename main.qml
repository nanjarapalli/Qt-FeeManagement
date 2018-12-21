import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Row {
        id:cols
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name
            text: qsTr("Name:")
        }
        Rectangle {
            id:frame
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain
                anchors.fill:parent
                anchors.margins: 4
                focus: true
            }

        }

    }
    Row{
    Text {
    width: 96; height: 20
    x: 45; y: 50
    text: "ClASS:"
    }

    ComboBox {
    x: 45; y: 50
    width: 200
    model: [ "LKG", "UKG", "1","2","3","4","5","6","7","8","9","10" ]
    }
    Text {
    width: 96; height: 20
    x: 45; y: 50
    text: "AGE:"
    }

    ComboBox {
    x: 45; y: 50
    width: 200
    model: [ "Male", "Female" ]
    }
    }
    Row {
        id:cols1
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name1
            x: 95; y: 90
            text: qsTr("FatherName:")
        }
        Rectangle {
            x: 95; y: 90
            id:frame1
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain1
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols2
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name2
            x: 140; y: 140
            text: qsTr("MotherName:")
        }
        Rectangle {
            x: 140; y: 140
            id:frame2
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain2
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols3
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name3
            x: 180; y: 180
            text: qsTr("RollNumber:")
        }
        Rectangle {
            x: 180; y: 180
            id:frame3
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain3
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols4
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name4
            x: 220; y: 210
            text: qsTr("MobileNumber:")
        }
        Rectangle {
            x: 220; y: 210
            id:frame4
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain4
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols5
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name5
            x: 260; y: 250
            text: qsTr("RegularFee:")
        }
        Rectangle {
            x: 250; y: 250
            id:frame5
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain5
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols6
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name6
            x: 290; y: 290
            text: qsTr("Conseesion:")
        }
        Rectangle {
            x: 290; y: 290
            id:frame6
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain6
                anchors.fill:parent
                anchors.margins: 4
            }

        }

    }
    Row {
        id:cols8
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Text {
            id: name8
            x: 320; y: 320
            text: qsTr("FinalFee:")
        }
        Rectangle {
            x: 320; y: 320
            id:frame8
            width: parent.width
            height: 25
            border.color: 'gray'
            border.width: 1
            TextInput{
                id:txtPlain8
                anchors.fill:parent
                anchors.margins: 4
                color: "gray"
            }

        }

    }
    Row {
        id:cols9
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        Button {
             x: 360; y: 360
            text: "Cancel"
            onClicked:print(txtPlain8.text,txtPlain6.text,txtPlain5.text,txtPlain4.text,txtPlain3.text,txtPlain2.text)
        }
        Button {
             x: 360; y: 360
            text: "Save"
            onClicked:print(name8.text)
        }
    }

}
