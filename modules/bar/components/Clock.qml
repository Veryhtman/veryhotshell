pragma ComponentBehavior: Bound
import qs.components
import qs.services
import qs.config
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    onImplicitWidthChanged: {
        console.log("⏰ Clock implicitWidth changed to:", implicitWidth, "mode:", displayMode);
    }
    onImplicitHeightChanged: {
        console.log("⏰ Clock implicitHeight changed to:", implicitHeight, "mode:", displayMode);
    }

    Component.onCompleted: {
        console.log("⏰ CLOCK COMPONENT CREATED");
        console.log("   displayMode:", displayMode);
        console.log("   Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
        console.log("   Config.bar.clock.showLeft:", Config.bar.clock.showLeft);
        console.log("   Config.bar.clock.showTop:", Config.bar.clock.showTop);
    }

    // Mode d'affichage : "vertical" pour Bar, "horizontal" pour Topbar
    property string displayMode: "vertical"
    //property color colour: Config.colors.clock.text

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    Loader {
        id: layout
        anchors.centerIn: parent
        sourceComponent: root.displayMode === "horizontal" ? horizontalLayout : verticalLayout
    }

    Component {
        id: verticalLayout

        Column {
            spacing: Appearance.spacing.small

            Loader {
                //anchors.horizontalCenter: parent.horizontalCenter
                Layout.alignment: Qt.AlignVCenter
                active: Config.bar.clock.showIcon
                visible: active
                asynchronous: true
                sourceComponent: MaterialIcon {
                    text: "calendar_month"
                    color: Config.style.clock.iconColor
                    Component.onCompleted: {
                        console.log("📅 VERTICAL ICON CREATED - parent Loader active:", parent.parent.active);
                        console.log("Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
                    }
                }
                Component.onCompleted: {
                    console.log("📅 Clock icon (vertical) - active:", active, "Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
                }
            }

            StyledText {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: StyledText.AlignHCenter
                text: Time.format(Config.services.useTwelveHourClock ? "hh\nmm\nA" : "hh\nmm")
                font.pointSize: Config.style.clock.textSize
                font.family: Config.style.clock.textFont
                font.bold: Config.style.clock.textBold
                color: Config.style.clock.textColor
            }
        }
    }

    Component {
        id: horizontalLayout

        RowLayout {
            spacing: Appearance.spacing.small

            Loader {
                active: Config.bar.clock.showIcon
                visible: active
                asynchronous: true
                Layout.alignment: Qt.AlignVCenter
                sourceComponent: MaterialIcon {
                    text: "calendar_month"
                    color: Config.style.clock.iconColor
                    Component.onCompleted: {
                        console.log("📅 HORIZONTAL ICON CREATED - parent Loader active:", parent.parent.active);
                        console.log("Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
                    }
                }

                Component.onCompleted: {
                    console.log("📅 Clock icon (horizontal) - active:", active, "Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
                }
            }

            StyledText {
                text: Time.format(Config.services.useTwelveHourClock ? "hh:mm A" : "HH:mm")
                font.pointSize: Config.style.clock.textSize
                font.family: Config.style.clock.textFont
                font.bold: Config.style.clock.textBold
                color: Config.style.clock.textColor
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
