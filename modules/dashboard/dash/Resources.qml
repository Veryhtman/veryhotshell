import qs.components
import qs.components.misc
import qs.services
import qs.config
import QtQuick

Row {
    id: root

    anchors.top: parent.top
    anchors.bottom: parent.bottom

    padding: Appearance.padding.large
    spacing: Appearance.spacing.normal

    Ref {
        service: SystemUsage
    }

    Resource {
        icon: "memory"
        value: SystemUsage.cpuPerc
        colour: Config.style.ressources.dash_cpuColor
    }

    Resource {
        icon: "memory_alt"
        value: SystemUsage.memPerc
        colour: Config.style.ressources.dash_memoryColor
    }

    Resource {
        icon: "hard_disk"
        value: SystemUsage.storagePerc
        colour: Config.style.ressources.dash_diskColor
    }

    component Resource: Item {
        id: res

        required property string icon
        required property real value
        required property color colour

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: Appearance.padding.large
        implicitWidth: icon.implicitWidth

        StyledRect {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: icon.top
            anchors.bottomMargin: Appearance.spacing.small

            implicitWidth: Config.dashboard.sizes.resourceProgessThickness

            color: Colours.layer(Config.style.ressources.dash_barsColor, 2)
            radius: Config.style.ressources.dash_barsRadius

            StyledRect {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                implicitHeight: res.value * parent.height

                color: res.colour
                radius: Config.style.ressources.dash_barsRadius
            }
        }

        MaterialIcon {
            id: icon

            anchors.bottom: parent.bottom

            text: res.icon
            color: res.colour
        }

        Behavior on value {
            Anim {
                duration: Appearance.anim.durations.large
            }
        }
    }
}
