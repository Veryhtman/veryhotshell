pragma ComponentBehavior: Bound

import qs.components
import qs.services
import qs.config
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    readonly property list<string> timeComponents: Time.format(Config.services.useTwelveHourClock ? "hh:mm:A" : "hh:mm").split(":")

    anchors.top: parent.top
    anchors.bottom: parent.bottom
    implicitWidth: Config.dashboard.sizes.dateTimeWidth

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        StyledText {
            Layout.bottomMargin: -(font.pointSize * 0.4)
            Layout.alignment: Qt.AlignHCenter
            text: root.timeComponents[0]
            color: Config.style.datetime.dash_hourTextColor
            font.pointSize: Config.style.datetime.dash_hourTextSize
            font.family: Config.style.datetime.dash_hourTextFont
            font.weight: 600
        }

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            text: "•••"
            color: Config.style.datetime.dash_separatorTextColor
            font.pointSize: Config.style.datetime.dash_separatorTextSize * 0.9
            font.family: Config.style.datetime.dash_separatorTextFont
        }

        StyledText {
            Layout.topMargin: -(font.pointSize * 0.4)
            Layout.alignment: Qt.AlignHCenter
            text: root.timeComponents[1]
            color: Config.style.datetime.dash_minuteTextColor
            font.pointSize: Config.style.datetime.dash_minuteTextSize
            font.family: Config.style.datetime.dash_minuteTextFont
            font.weight: 600
        }

        Loader {
            Layout.alignment: Qt.AlignHCenter

            asynchronous: true
            active: Config.services.useTwelveHourClock
            visible: active

            sourceComponent: StyledText {
                text: root.timeComponents[2] ?? ""
                color: Config.style.datetime.dash_twelveHourTextColor
                font.pointSize: Config.style.datetime.dash_twelveHourTextSize
                font.family: Config.style.datetime.dash_twelveHourTextFont
                font.weight: 600
            }
        }
    }
}
