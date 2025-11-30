pragma ComponentBehavior: Bound

import qs.components
import qs.config
import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property ShellScreen screen
    required property Session session

    implicitWidth: layout.implicitWidth + Appearance.padding.larger * 4
    implicitHeight: layout.implicitHeight + Appearance.padding.large * 2

    ColumnLayout {
        id: layout

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: Appearance.padding.larger * 2
        spacing: Appearance.spacing.normal

        states: State {
            name: "expanded"
            when: root.session.navExpanded

            PropertyChanges {
                layout.spacing: Appearance.spacing.small
                menuIcon.opacity: 0
                menuIconExpanded.opacity: 1
                menuIcon.rotation: 180
                menuIconExpanded.rotation: 0
            }
        }

        transitions: Transition {
            Anim {
                properties: "spacing,opacity,rotation"
            }
        }

        Item {
            id: menuBtn

            Layout.topMargin: Appearance.spacing.large
            implicitWidth: menuIcon.implicitWidth + menuIcon.anchors.leftMargin * 2
            implicitHeight: menuIcon.implicitHeight + Appearance.padding.normal * 2

            StateLayer {
                radius: Config.style.navRail.containerRadius

                function onClicked(): void {
                    root.session.navExpanded = !root.session.navExpanded;
                }
            }

            MaterialIcon {
                id: menuIcon

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: Appearance.padding.large

                text: "menu"
                font.pointSize: Config.style.navRail.textSize
            }

            MaterialIcon {
                id: menuIconExpanded

                anchors.fill: menuIcon
                text: "menu_open"
                font.pointSize: menuIcon.font.pointSize
                opacity: 0
                rotation: -180
            }
        }

        Loader {
            asynchronous: true
            active: !root.session.floating
            visible: active

            sourceComponent: StyledRect {
                readonly property int nonAnimWidth: normalWinIcon.implicitWidth + (root.session.navExpanded ? normalWinLabel.anchors.leftMargin + normalWinLabel.implicitWidth : 0) + normalWinIcon.anchors.leftMargin * 2

                implicitWidth: nonAnimWidth
                implicitHeight: root.session.navExpanded ? normalWinIcon.implicitHeight + Appearance.padding.normal * 2 : nonAnimWidth

                color: Config.style.navRail.containerColor
                radius: Config.style.navRail.containerRadius

                StateLayer {
                    id: normalWinState

                    color: Config.style.navRail.containerBackgroundColor

                    function onClicked(): void {
                        root.session.root.close();
                        WindowFactory.create(null, {
                            screen: root.screen,
                            active: root.session.active,
                            navExpanded: root.session.navExpanded
                        });
                    }
                }

                MaterialIcon {
                    id: normalWinIcon

                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: Appearance.padding.large

                    text: "select_window"
                    color: Config.style.navRail.textColor
                    font.pointSize: Config.style.navRail.textSize
                    fill: 1
                }

                StyledText {
                    id: normalWinLabel

                    anchors.left: normalWinIcon.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: Appearance.spacing.normal

                    text: qsTr("Float window")
                    color: Config.style.navRail.textColor
                    opacity: root.session.navExpanded ? 1 : 0

                    Behavior on opacity {
                        Anim {
                            duration: Appearance.anim.durations.small
                        }
                    }
                }

                Behavior on implicitWidth {
                    Anim {
                        duration: Appearance.anim.durations.expressiveDefaultSpatial
                        easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
                    }
                }

                Behavior on implicitHeight {
                    Anim {
                        duration: Appearance.anim.durations.expressiveDefaultSpatial
                        easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
                    }
                }
            }
        }

        NavItem {
            Layout.topMargin: Appearance.spacing.large * 2
            icon: "network_manage"
            label: "network"
        }

        NavItem {
            icon: "settings_bluetooth"
            label: "bluetooth"
        }

        NavItem {
            icon: "tune"
            label: "audio"
        }
    }

    component NavItem: Item {
        id: item

        required property string icon
        required property string label
        readonly property bool active: root.session.active === label

        implicitWidth: background.implicitWidth
        implicitHeight: background.implicitHeight + smallLabel.implicitHeight + smallLabel.anchors.topMargin

        states: State {
            name: "expanded"
            when: root.session.navExpanded

            PropertyChanges {
                expandedLabel.opacity: 1
                smallLabel.opacity: 0
                background.implicitWidth: icon.implicitWidth + icon.anchors.leftMargin * 2 + expandedLabel.anchors.leftMargin + expandedLabel.implicitWidth
                background.implicitHeight: icon.implicitHeight + Appearance.padding.normal * 2
                item.implicitHeight: background.implicitHeight
            }
        }

        transitions: Transition {
            Anim {
                property: "opacity"
                duration: Appearance.anim.durations.small
            }

            Anim {
                properties: "implicitWidth,implicitHeight"
                duration: Appearance.anim.durations.expressiveDefaultSpatial
                easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
            }
        }

        StyledRect {
            id: background

            radius: Config.style.navRail.backgroundRadius
            color: Qt.alpha(Config.style.navRail.backgroundColor, item.active ? 1 : 0)

            implicitWidth: icon.implicitWidth + icon.anchors.leftMargin * 2
            implicitHeight: icon.implicitHeight + Appearance.padding.small

            StateLayer {
                color: item.active ? Config.style.navRail.itemActive : Config.style.navRail.itemInactive

                function onClicked(): void {
                    root.session.active = item.label;
                }
            }

            MaterialIcon {
                id: icon

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: Appearance.padding.large

                text: item.icon
                color: item.active ? Config.style.navRail.itemActive : Config.style.navRail.itemInactive
                font.pointSize: Config.style.navRail.textSize
                fill: item.active ? 1 : 0

                Behavior on fill {
                    Anim {}
                }
            }

            StyledText {
                id: expandedLabel

                anchors.left: icon.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: Appearance.spacing.normal

                opacity: 0
                text: item.label
                color: item.active ? Config.style.navRail.itemActive : Config.style.navRail.itemInactive
                font.capitalization: Font.Capitalize
            }

            StyledText {
                id: smallLabel

                anchors.horizontalCenter: icon.horizontalCenter
                anchors.top: icon.bottom
                anchors.topMargin: Appearance.spacing.small / 2

                text: item.label
                font.pointSize: Config.style.navRail.itemLabelSize
                font.capitalization: Font.Capitalize
            }
        }
    }
}
