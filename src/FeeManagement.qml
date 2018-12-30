import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import "../Framework"
import "Database.js" as JS

Item {
    id: root

    property int selectedGroup: 0
    property bool disableOnEditMode: false

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

    ListModel {
        id: studentModel
        property string sortColumnName: ""
        property string order: "desc" //set to either asc or desc
        Component.onCompleted:  {
            var results = JS.dbReadAll();
            for (var i = 0; i < results.rows.length; i++) {
                studentModel.append({
                                     name: results.rows.item(i).name,
                                     date: results.rows.item(i).date,
                                     class: results.rows.item(i).class,
                                     rollnumber: results.rows.item(i).rollnumber,
                                     gender: results.rows.item(i).gender,
                                     dob: results.rows.item(i).dob,
                                     fathername: results.rows.item(i).fathername,
                                     mothername: results.rows.item(i).mothername,
                                     mobile: results.rows.item(i).mobile,
                                     regularfee: results.rows.item(i).regularfee,
                                     concession: results.rows.item(i).concession,
                                     finalfee: results.rows.item(i).finalfee
                                 })
    //            console.log("XXXXXXXXXXXXXXXXXX name: "+results.rows.item(i).name
    //                        +"\n                  checked: "
    //                        +"\n                     date: "+results.rows.item(i).date
    //                        +"\n                trip_desc: "+results.rows.item(i).trip_desc
    //                        +"\n                 distance: "+results.rows.item(i).distance)
            }
        }
    }
}
