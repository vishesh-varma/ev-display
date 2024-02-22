import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Window {
    id: mainwindow
    width: 800
    height: 480
    visible: true
    //    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint
    color: "#123345"

    Label {
        id: mainlabel
        text: "This is content"
        color: "#FFFFFF"
        anchors.fill: parent
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignHCenter
    }

    Drawer {
        id: sidebar
        width: 0.3 * mainwindow.width
        height: mainwindow.height
        position: 0
        dragMargin: 0.3 * mainwindow.width
        Rectangle
        {
            anchors.fill:parent
        gradient: Gradient {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.33; color: "yellow" }
                GradientStop { position: 1.0; color: "green" }
            }
        }
        ColumnLayout {
            id: accountShow
            width: parent.width
            anchors.horizontalCenter: Layout.horizontalCenter
            spacing: 1
            RowLayout {
                id: profileSidebarView
                Layout.maximumHeight:  0.3 * sidebar.height
//                spacing: 0.1 * sidebar.width
//                Layout.margins: 0.1 * sidebar.width
                Image {
                    id: profile
                    source: "qrc:/images/def_pfp.png"
                    Layout.preferredWidth: 0.3 * sidebar.width
                    Layout.preferredHeight: Layout.preferredWidth
                }
                Label {
                    text: "Joey Tribbiani\nView Profile"
                    Layout.alignment: Qt.AlignCenter
                }
            }
            Rectangle {
//                Layout.maximumHeight: sidebar.height - profileSidebarView
                color: "transparent"

                Layout.preferredWidth: 0.99 * sidebar.width
                Layout.leftMargin: 0
                Layout.preferredHeight: sidebar.height

                ListModel {
                    id: settingListModel
                    ListElement {
                        name: "Setting 1"
                        number: "11 2323"
                    }
                    ListElement {
                        name: "Setting 2"
                        number: "11 2343"
                    }
                    ListElement {
                        name: "Setting 3"
                        number: "11 5453"
                    }
                    ListElement {
                        name: "Setting 4"
                        number: "11 34545"
                    }
                    ListElement {
                        name: "Setting 5"
                        number: "94091 1"
                    }
                }
                Component {
                    id: settingDelegate
                    Text {
                        text: model.name + ": " + model.number

                    }

                }
                ListView {
                    anchors.fill: parent
//                    Layout.leftMargin: 50

                    anchors.topMargin: 20
                    anchors.leftMargin: 10
                    spacing: 10

                    model:settingListModel
                    delegate: settingDelegate
                    clip: true
                }
            }
        }
    }
}
