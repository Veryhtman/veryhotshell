pragma ComponentBehavior: Bound

import qs.components
import qs.config
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen
    required property PersistentProperties visibilities

    // Bordure fine en haut - configurable dans TopbarConfig
    readonly property int topBorderThickness: Config.topbar.topBorderThickness ?? Config.border.thickness

    //readonly property int padding: Math.max(Appearance.padding.smaller, Config.border.thickness)
    readonly property int contentHeight: Config.topbar.sizes.height + topBorderThickness
    readonly property int exclusiveZone: Config.topbar.persistent || visibilities.topbar ? contentHeight : topBorderThickness
    readonly property bool shouldBeVisible: Config.topbar.persistent || visibilities.topbar || isHovered
    property bool isHovered

    visible: height > topBorderThickness
    implicitHeight: topBorderThickness
    width: parent ? parent.width : 0

    states: State {
        name: "visible"
        when: root.shouldBeVisible

        PropertyChanges {
            target: root
            implicitHeight: root.contentHeight
        }
    }

    transitions: [
        Transition {
            from: ""
            to: "visible"
            Anim {
                target: root
                property: "implicitHeight"
                duration: Appearance.anim.durations.expressiveDefaultSpatial
                easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
            }
        },
        Transition {
            from: "visible"
            to: ""
            Anim {
                target: root
                property: "implicitHeight"
                easing.bezierCurve: Appearance.anim.curves.emphasized
            }
        }
    ]

    // DEBUG
    Component.onCompleted: {
        console.log("TopbarWrapper created");
        console.log("Config.topbar.enabled:", Config.topbar.enabled);
        console.log("visibilities.topbar:", visibilities.topbar);
        console.log("contentHeight:", contentHeight);
        console.log("shouldBeVisible:", shouldBeVisible);
        console.log("Wrapper : TopbarConfig.persistent:", Config.topbar.persistent);
    }

    onShouldBeVisibleChanged: {
        console.log("TopbarWrapper shouldBeVisible changed to:", shouldBeVisible);
    }
    // END_DEBUG

    Loader {
        id: content
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: root.topBorderThickness
        height: Config.topbar.sizes.height

        active: root.shouldBeVisible || root.visible

        // DEBUG
        Component.onCompleted: {
            console.log("Topbar Loader created");
            console.log("Loader active:", active);
            console.log("Loader status:", status);
        }

        onStatusChanged: {
            console.log("Topbar Loader status changed to:", status);
        }

        onLoaded: {
            console.log("Topbar Loader loaded!");
            console.log("Loader item:", item);
        }
        // END_DEBUG

        sourceComponent: Topbar {
            width: content.width
            height: content.height
            screen: root.screen

            visibilities: root.visibilities

            // DEBUG
            Component.onCompleted: {
                console.log("Topbar component created!");
                console.log("Topbar width:", width);
                console.log("Topbar height:", height);
                console.log("DONE !!!");
            }
            // END_DEBUG
        }
    }
}
