import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../Framework"

Rectangle {
    property bool selected: false
    property alias iconImage: icon.source
    property int notificationvalue: 12
    property alias elementtext: groupName.text
    property alias iconColor: _iconColor.color

    Rectangle {
        id: borderLeft
        width: FWTheme.navigationArea.borderLeftSelectedWidth
        height: parent.height
        anchors.left: parent.left
        color: selected ? FWTheme.navigationArea.borderLeftSelected : FWTheme.navigationArea.borderLeftUnSelected
    }

    Image {
        id: icon
        width: FWTheme.navigationArea.iconSize
        height: FWTheme.navigationArea.iconSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: borderLeft.right
        anchors.leftMargin: 10
        visible: false
    }

    ColorOverlay {
        id: _iconColor
        anchors.fill: icon
        source: icon
    }

    Text {
        id: groupName
        width: parent.width - 98
        anchors.left: icon.right
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.navigationArea.fontSize
        color: selected ? FWTheme.navigationArea.fontColorSelected : FWTheme.navigationArea.fontColorUnselected
        elide: Text.ElideRight
    }

    Rectangle {
        id: notificationSymbol
        width: notificationvalue > 99 ? 32 : 24
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 22
        anchors.verticalCenter: parent.verticalCenter
        radius: FWTheme.navigationArea.notificationRadius
        color: selected ? FWTheme.navigationArea.notificationColorSelected : FWTheme.navigationArea.notificationBackgroundColor

        Text {
            id: notificationText
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: notificationvalue
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.navigationArea.fontSize
            color: FWTheme.navigationArea.notificationValueColor
        }
    }

    Rectangle {
        id: borderUp
        width: parent.width - borderLeft.width
        height: FWTheme.navigationArea.borderUpDownWidth
        anchors.left: borderLeft.right
        anchors.top: parent.top
        color: selected ? FWTheme.navigationArea.borderUpDownSelected : FWTheme.navigationArea.borderUpDownUnselected
    }

    Rectangle {
        id: borderDown
        width: parent.width - borderLeft.width
        height: FWTheme.navigationArea.borderUpDownWidth
        anchors.left: borderLeft.right
        anchors.bottom: parent.bottom
        color: selected ? FWTheme.navigationArea.borderUpDownSelected : FWTheme.navigationArea.borderUpDownUnselected
    }

    Rectangle {
        id: rightBorder
        width: FWTheme.navigationArea.borderUpDownWidth
        height: parent.height
        anchors.right: parent.right
        color: FWTheme.navigationArea.borderRightColor
        visible: selected ? false : true
    }
}

