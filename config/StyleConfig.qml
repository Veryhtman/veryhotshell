import Quickshell.Io
import qs.services
import qs.config

// Fichier de configuration des couleurs personnalisées
// Utilisez Colours.palette.xxx pour référencer les couleurs du thème Material 3
JsonObject {

    //OK
    property Clock clock: Clock {}
    component Clock: JsonObject {
        property string textColor: Colours.palette.m3tertiary
        property string iconColor: Colours.palette.m3tertiary
        property string textFont: Appearance.font.family.mono
        property string textSize: Appearance.font.size.smaller
        property bool textBold: false
    }

    //OK
    property DesktopClock desktopClock: DesktopClock {}
    component DesktopClock: JsonObject {
        property string textSize: Appearance.font.size.extraLarge
        property string textFont: Appearance.font.family.clock
        property bool textBold: true
    }

    property Border border: Border {}
    component Border: JsonObject {
        property string background: Colours.palette.m3surface
        property string foreground: Colours.palette.m3outline
    }

    //OK
    property Topbar topbar: Topbar {}
    component Topbar: JsonObject {
        property string textColor: Colours.palette.m3onSurface
        property string textFont: Colours.palette.m3onSurface
        property string textSize: Appearance.font.size.smaller
    }

    //OK
    property Picker picker: Picker {}
    component Picker: JsonObject {
        property string overlayColor: Colours.palette.m3secondaryContainer
        property real overlayOpacity: 0.3
        property string borderColor: Colours.palette.m3primary
    }

    //OK
    property OsIcon osIcon: OsIcon {}
    component OsIcon: JsonObject {
        property string mainColor: Colours.palette.m3tertiary
        property string size: Appearance.font.size.small
    }

    //OK
    property Power power: Power {}
    component Power: JsonObject {
        property string mainColor: Colours.palette.m3error
        property string size: Appearance.font.size.normal
        property bool bold: true
    }

    //OK
    property StatusIcons statusIcons: StatusIcons {}
    component StatusIcons: JsonObject {
        property string mainColor: Colours.palette.m3secondary
        property string containerColor: Colours.tPalette.m3surfaceContainer
        property string radius: Appearance.rounding.full
        property string batteryError: Colours.palette.m3error
        property string textFont: Appearance.font.family.mono
    }

    //OK
    property Wallpaper wallpaper: Wallpaper {}
    component Wallpaper: JsonObject {
        property string containerColor: Colours.palette.m3surfaceContainer
        property string textColor: Colours.palette.m3onSurfaceVariant
        property string textSize: Appearance.font.size.extraLarge
        property string textFont: Appearance.font.family.mono
        property bool textBold: true
        property string selectorContainerColor: Colours.palette.m3primary
        property string selectorContainerBackgroundColor: Colours.palette.m3onPrimary
        property string selectorContainerRadius: Appearance.rounding.full
        property string selectorContainerTextColor_1: Colours.palette.m3onPrimary
        property string selectorContainerTextSize_1: Appearance.font.size.large
    }

    //OK
    property ControlCenter controlCenter: ControlCenter {}
    component ControlCenter: JsonObject {
        property string containerColor: Colours.tPalette.m3surfaceContainer
    }

    //OK
    property NavRail navRail: NavRail {}
    component NavRail: JsonObject {
        property string containerColor: Colours.palette.m3primaryContainer
        property string containerBackgroundColor: Colours.palette.m3onPrimaryContainer
        property string containerRadius: Appearance.rounding.small
        property string backgroundColor: Colours.palette.m3secondaryContainer
        property string backgroundRadius: Appearance.rounding.full
        property string textColor: Colours.palette.m3onPrimaryContainer
        property string textSize: Appearance.font.size.large
        property string itemActive: Colours.palette.m3onSecondaryContainer
        property string itemInactive: Colours.palette.m3onSurface
        property string itemLabelSize: Appearance.font.size.small
    }

    // PAS OK PAS : panneaux de config non terminé
    property Panes panes: Panes {}
    component Panes: JsonObject {

    }

    //OK
    property WindowFactory windowFactory: WindowFactory {}
    component WindowFactory: JsonObject {
        property string titleString: "Veryhotlinux Settings"
        property string titleFormat: "%1 - %2"  //%1 represents titleString - %2 : Active slice
        property string titleSize: Appearance.font.size.larger
        property string mainColor: Colours.tPalette.m3surface
        property string containerColor: Colours.tPalette.m3surfaceContainer
        property string containerRadius: Appearance.rounding.full
    }

    //OK
    property Calendar calendar: Calendar {}
    component Calendar: JsonObject {
        property string chevronTextColor: Colours.palette.m3tertiary
        property string chevronTextSize: Appearance.font.size.normal
        property string chevronRadius: Appearance.rounding.full
        property string monthYearDisplayTextColor: Colours.palette.m3primary
        property string monthYearDisplayTextSize: Appearance.font.size.normal
        property string monthYearDisplayRadius: Appearance.rounding.full
        property string dayOfWeekendTextColor: Colours.palette.m3secondary
        property string dayOfWeekTextColor: Colours.palette.m3onSurfaceVariant
        property string daysTextSize: Appearance.font.size.normal
        property string todayIndicatorColor: Colours.palette.m3primary
        property string todayIndicatorRadius: Appearance.rounding.full
        property string todayColoriserSource: Colours.palette.m3onSurface
        property string todayColoriserEnd: Colours.palette.m3onPrimary
    }

    //OK
    property Datetime datetime: Datetime {}
    component Datetime: JsonObject {
        property string dash_hourTextColor: Colours.palette.m3secondary
        property string dash_hourTextSize: Appearance.font.size.extraLarge
        property string dash_hourTextFont: Appearance.font.family.clock
        property string dash_separatorTextColor: Colours.palette.m3primary
        property string dash_separatorTextSize: Appearance.font.size.extraLarge
        property string dash_separatorTextFont: Appearance.font.family.clock
        property string dash_minuteTextColor: Colours.palette.m3secondary
        property string dash_minuteTextSize: Appearance.font.size.extraLarge
        property string dash_minuteTextFont: Appearance.font.family.clock
        property string dash_twelveHourTextColor: Colours.palette.m3primary
        property string dash_twelveHourTextSize: Appearance.font.size.large
        property string dash_twelveHourTextFont: Appearance.font.family.clock
    }

    //OK
    property Media media: Media {}
    component Media: JsonObject {
        property string dash_strokeColor: Colours.palette.m3surfaceContainerHigh
        property string dash_strokeHoverColor: Colours.palette.m3primary
        property string dash_artTrackContainerColor: Colours.tPalette.m3surfaceContainerHigh
        property string dash_artTrackTextColor: Colours.palette.m3onSurfaceVariant
        property string dash_titleTextColor: Colours.palette.m3primary
        property string dash_titleTextSize: Appearance.font.size.normal
        property string dash_albumTextColor: Colours.palette.m3outline
        property string dash_albumTextSize: Appearance.font.size.small
        property string dash_artistTextColor: Colours.palette.m3secondary
        property string dash_iconActiveColor: Colours.palette.m3onSurface
        property string dash_iconInactiveColor: Colours.palette.m3outline
        property string dash_iconSize: Appearance.font.size.large
        property string dash_iconRadius: Appearance.rounding.full
    }

    //OK
    property Ressources ressources: Ressources {}
    component Ressources: JsonObject {
        property string dash_cpuColor: Colours.palette.m3primary
        property string dash_memoryColor: Colours.palette.m3secondary
        property string dash_diskColor: Colours.palette.m3tertiary
        property string dash_barsColor: Colours.palette.m3surfaceContainerHigh
        property string dash_barsRadius: Appearance.rounding.full
    }

    //OK
    property Battery battery: Battery {}
    component Battery: JsonObject {
        property string mainColor: Colours.palette.m3error
        property string warningColor: Colours.palette.m3error
        property string errorColor: Colours.palette.m3error
        property string radius: Appearance.rounding.normal
        property string textFont: Appearance.font.family.mono
        property string profileIndicatorColor: Colours.palette.m3primary
        property string profileIndicatorRadius: Appearance.rounding.full
        property string profileContainerColor: Colours.tPalette.m3surfaceContainer
        property string profileContainerColor_2: Colours.palette.m3onPrimary
        property string profileContainerColor_3: Colours.palette.m3onSurface
        property string profileContainerRadius: Appearance.rounding.full
        property string profileFontSize: Appearance.font.size.large
    }

    //OK
    property Network network: Network {}
    component Network: JsonObject {
        property string textColor: Colours.palette.m3onSurfaceVariant
        property string textSize: Appearance.font.size.small
        property string activeColor: Colours.palette.m3primary
        property string inactiveColor: Colours.palette.m3onSurfaceVariant
        property string itemTextSize: Appearance.font.size.small
        property string itemTextColor: Colours.palette.m3onPrimaryContainer
        property string buttonAtiveColor: Colours.palette.m3onPrimary
        property string buttonInactiveColor: Colours.palette.m3onSurface
        property string containerColor: Colours.palette.m3primaryContainer
        property string containerBackground: Colours.palette.m3onPrimaryContainer
        property string containerRadius: Appearance.rounding.full
    }

    //OK
    property Tray tray: Tray {}
    component Tray: JsonObject {
        property string containerColor: Colours.tPalette.m3surfaceContainer
        property string containerColor_A: Colours.tPalette.m3surfaceContainer.a
        property string itemColor: Colours.palette.m3secondary
        property string radius: Appearance.rounding.full
        property string textSize: Appearance.font.size.large
    }

    //OK
    property TrayMenu trayMenu: TrayMenu {}
    component TrayMenu: JsonObject {
        property string containerBackgroundColor: Colours.palette.m3outlineVariant
        property string containerEmptyBackgroundColor: "transparent"
        property string containerRadius: Appearance.rounding.full
        property string textActiveColor: Colours.palette.m3onSurface
        property string textInactiveColor: Colours.palette.m3outline
        property string expandTextActiveColor: Colours.palette.m3onSurface
        property string expandTextInactiveColor: Colours.palette.m3outline
        property string submenuColor: Colours.palette.m3secondaryContainer
        property string submenuBackgroundColor: Colours.palette.m3onSecondaryContainer
        property string submenuRadius: Appearance.rounding.full
        property string submenuTextColor: Colours.palette.m3onSecondaryContainer
    }

    //OK
    property Audio audio: Audio {}
    component Audio: JsonObject {
        property string containerColor: Colours.palette.m3primaryContainer
        property string containerRadius: Appearance.rounding.normal
        property string stateColor: Colours.palette.m3onPrimaryContainer
        property string expandButtonColor: Colours.palette.m3onPrimaryContainer
        property string expandTextColor: Colours.palette.m3onPrimaryContainer
        property string expandTextSize: Appearance.font.size.large
    }

    //OK
    property Workspaces workspaces: Workspaces {}
    component Workspaces: JsonObject {
        property string mainColor: Colours.palette.m3onSurfaceVariant
        property string containerColor: Colours.tPalette.m3surfaceContainer
        property string containerRadius: Appearance.rounding.full
        property string activeColor: Colours.palette.m3primary
        property string activeRadius: Appearance.rounding.full
        property string activeIndicatorOn: Colours.palette.m3onSurface
        property string activeIndicatorOff: Colours.palette.m3outlineVariant
        property string colouriserSourceColor: Colours.palette.m3onSurface
        property string colouriserEndColor:Colours.palette.m3onPrimary
        property string specialColor: Colours.palette.m3onSurfaceVariant
        property string specialRadius: Appearance.rounding.full
        property string specialIndicatorColor: Colours.palette.m3tertiary
        property string specialIndicatorColouriser: Colours.palette.m3onTertiary
        property string specialIndicatorRadius: Appearance.rounding.full
        property string occupiedColor: Colours.palette.m3surfaceContainerHigh
        property string occupiedRadius: Appearance.rounding.full
    }

    property Notifications notifications: Notifications {}
    component Notifications: JsonObject {
        property string background: Colours.palette.m3surfaceContainer
        property string text: Colours.palette.m3onSurface
        property string border: Colours.palette.m3outline
    }

    property Launcher launcher: Launcher {}
    component Launcher: JsonObject {
        property string background: Colours.palette.m3surface
        property string text: Colours.palette.m3onSurface
        property string selected: Colours.palette.m3primary
    }

    property Dashboard dashboard: Dashboard {}
    component Dashboard: JsonObject {
        property string background: Colours.palette.m3surface
        property string text: Colours.palette.m3onSurface
    }

    //OK
    property ActiveWindow activeWindow: ActiveWindow {}
    component ActiveWindow: JsonObject {
        property string activeColor: Colours.palette.m3primary
        property string textColor: Colours.palette.m3onSurfaceVariant
        property string textFont: Appearance.font.family.mono
        property string textSize: Appearance.font.size.smaller
        property string chevronSize: Appearance.font.size.large
        property string detailTextFont: Appearance.font.size.normal
        property string stateRadius: Appearance.rounding.normal
    }

    // ═══════════════════════════════════════════════════════════
    //  EXEMPLES DE COULEURS DISPONIBLES
    // ═══════════════════════════════════════════════════════════
    //
    // Principales :
    //   - Colours.palette.m3primary
    //   - Colours.palette.m3secondary
    //   - Colours.palette.m3tertiary
    //
    // Surfaces :
    //   - Colours.palette.m3surface
    //   - Colours.palette.m3surfaceContainer
    //   - Colours.palette.m3surfaceVariant
    //
    // Texte sur surfaces :
    //   - Colours.palette.m3onSurface
    //   - Colours.palette.m3onSurfaceVariant
    //
    // Bordures :
    //   - Colours.palette.m3outline
    //   - Colours.palette.m3outlineVariant
    //
    // États :
    //   - Colours.palette.m3error
    //   - Colours.palette.m3success
    //
    // Couleurs terminaux (term0 à term15)
    //   - Colours.palette.term0 à term15
    //
    // ═══════════════════════════════════════════════════════════
}
