pragma ComponentBehavior: Bound

import qs.components
import qs.components.images
import qs.components.filedialog
import qs.services
import qs.config
import qs.utils
import QtQuick

Item {
    id: root

    property string source: Wallpapers.current
    property Image current: one

    anchors.fill: parent

    onSourceChanged: {
        if (!source)
            current = null;
        else if (current === one)
            two.update();
        else
            one.update();
    }

    Component.onCompleted: {
        if (source)
            Qt.callLater(() => one.update());
    }

    Loader {
        anchors.fill: parent

        active: !root.source
        asynchronous: true

        sourceComponent: StyledRect {
            color: Config.style.wallpaper.containerColor

            Row {
                anchors.centerIn: parent
                spacing: Appearance.spacing.large

                MaterialIcon {
                    text: "sentiment_stressed"
                    color: Config.style.wallpaper.textColor
                    font.pointSize: Config.style.wallpaper.textSize * 5
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: Appearance.spacing.small

                    StyledText {
                        text: qsTr("Wallpaper missing?")
                        color: Config.style.wallpaper.textColor
                        font.pointSize: Config.style.wallpaper.textSize * 2
                        font.bold: Config.style.wallpaper.textBold
                    }

                    StyledRect {
                        implicitWidth: selectWallText.implicitWidth + Appearance.padding.large * 2
                        implicitHeight: selectWallText.implicitHeight + Appearance.padding.small * 2

                        radius: Config.style.wallpaper.selectorContainerRadius
                        color: Config.style.wallpaper.selectorContainerColor

                        FileDialog {
                            id: dialog

                            title: qsTr("Select a wallpaper")
                            filterLabel: qsTr("Image files")
                            filters: Images.validImageExtensions
                            onAccepted: path => Wallpapers.setWallpaper(path)
                        }

                        StateLayer {
                            radius: parent.radius
                            color: Config.style.wallpaper.selectorContainerBackgroundColor

                            function onClicked(): void {
                                dialog.open();
                            }
                        }

                        StyledText {
                            id: selectWallText

                            anchors.centerIn: parent

                            text: qsTr("Set it now!")
                            color: Config.style.wallpaper.selectorContainerTextColor_1
                            font.pointSize: Config.style.wallpaper.selectorContainerTextSize_1
                        }
                    }
                }
            }
        }
    }

    Img {
        id: one
    }

    Img {
        id: two
    }

    component Img: CachingImage {
        id: img

        function update(): void {
            if (path === root.source)
                root.current = this;
            else
                path = root.source;
        }

        anchors.fill: parent

        opacity: 0
        scale: Wallpapers.showPreview ? 1 : 0.8

        onStatusChanged: {
            if (status === Image.Ready)
                root.current = this;
        }

        states: State {
            name: "visible"
            when: root.current === img

            PropertyChanges {
                img.opacity: 1
                img.scale: 1
            }
        }

        transitions: Transition {
            Anim {
                target: img
                properties: "opacity,scale"
            }
        }
    }
}
