import Quickshell
ShellRoot {
	property bool isActive: Hyprland.focusedWorkspace?.id === 9
	property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 9) ?? null) != null

	property int volumeLevel: 0
	property int brightnessLevel: 0
	property var player: Mpris.players.values

	PanelWindow {
		WlrLayershell.layer: WlrLayer.Background

		anchors {
			top: false
			left: false
			bottom: false
			right: false
		}
		color: "red"
}
