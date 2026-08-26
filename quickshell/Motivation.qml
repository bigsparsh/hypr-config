import Quickshell
import Qt5Compat.GraphicalEffects
import QtQuick.Effects
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts
import "."

ShellRoot {

	readonly property color mycolor: `${Colors.color1}`
	property string hexPart: mycolor.toString().substring(1, 7)
	 property int counter: 0
	PanelWindow {
		WlrLayershell.layer: WlrLayer.Background

		color: "transparent"
		implicitWidth: rect.implicitWidth + 40 // Adding padding
		implicitHeight: rect.implicitHeight + 20

		Rectangle {
			id:rect
			radius: 20
			color: `#aa${hexPart}`

			implicitWidth: layout.implicitWidth + 40 // Adding padding
			implicitHeight: layout.implicitHeight + 20

			ColumnLayout {
				id: layout
				spacing: 10
				anchors.centerIn: parent

				Text {
					id: motivText
					Layout.preferredWidth: 850
					font.family: "SauceCodePro NF"
					color: Colors.color0
					// font.italic: true
					font.weight: 1000
					font.letterSpacing: -4
					padding: 10
					horizontalAlignment: Text.AlignHCenter 
					font.pixelSize: 50
					lineHeight: 0.65
					wrapMode: Text.WordWrap 
					text: "".toUpperCase()
				}

			}


		}
	}

	Process {
		id: motivProc
		command: ["sh", "-c", ` curl -X GET "https://api.api-ninjas.com/v2/randomquotes?categories=success,wisdom" -H "X-Api-Key: depzDVVj5QFLMtY5C2eri7dE0yUCx9Ln3xLvFXGO" | jq .[0].quote`]
		stdout: SplitParser {
			onRead: data => {

				print(hexPart)
				counter += 1
				if (counter > 4) {
					counter = 0
				}

				motivText.text = data.split("\"")[1].toUpperCase()
			}
		}
		Component.onCompleted: running = true
	}

	Timer {
		interval: 60000
		running: true
		repeat: true
		onTriggered: {
			motivProc.running = true
		}
	}

}
