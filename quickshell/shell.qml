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
	property bool isActive: Hyprland.focusedWorkspace?.id === 9
	property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 9) ?? null) != null

	property int volumeLevel: 0
	property var player: Mpris.players.values

	PanelWindow {
		WlrLayershell.layer: WlrLayer.Background

		anchors {
			top: true
			left: bar
			bottom: true
			right: true
		}
		color: "transparent"

		Item {
				id: root
				anchors.fill: parent

				property color maskColor: Colors.color0
				property real margin: 10
				property real radius: 20

				ShaderEffect {
						anchors.fill: parent
						property real w: width
						property real h: height
						property real m: root.margin
						property real r: root.radius
						property color col: root.maskColor
						fragmentShader: "mask.frag.qsb"
				}
		}

	}

	PanelWindow {
		id: bar
		anchors {
			top: true
			left: true
			bottom: true
			right: false
		} // PanelWindow.anchor
		color: Colors.color0

		implicitWidth: 40

		ColumnLayout {
			anchors.fill: parent
			spacing: 10

			Column {
				Layout.alignment: Qt.AlignTop
				Layout.leftMargin: 10
				Layout.topMargin: 10
				spacing: 10


				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 1
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 1) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: hour
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 1")
						}
					}
				} // Text WP 1

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 2
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 2) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: minute
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 2")
						}
					}
				} // Text WP 2

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 3
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 3) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: day
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 3")
						}
					}
				} // Text WP 3

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 4
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 4) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: date
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 4")
						}
					}
				} // Text WP 4

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 5
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 5) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: month
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 5")
						}
					}
				} // Text WP 5

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 6
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 6) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					id: year
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 6")
						}
					}
				} // Text WP 6

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 7
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 7) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					id: volume
					text: volumeLevel == 100 ? "VFL" : "V" + volumeLevel
					MouseArea {
						anchors.fill: parent
						pressAndHoldInterval: 100
						onPressAndHold: () => {
							cmdoer.command = ["pavucontrol", "&"]
							cmdoer.running = true
						}
						onClicked: (mouse) => {
							Hyprland.dispatch("workspace 7")
						}
						onWheel: (wheel) => {
							if (wheel.angleDelta.y > 0) {
								volControlUp.running = true
								volProc.running = true
							} else if (wheel.angleDelta.y < 0) {
								volControlDown.running = true
								volProc.running = true
							}
						}
					}
				} // Text WP 7

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 8
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 8) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					text: Hyprland.focusedWorkspace?.id == 10 ? "C10" : "CW" + Hyprland.focusedWorkspace?.id
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 8")
						}
					}
				} // Text WP 8

				Text {
					id: batStatus
					property bool isActive: Hyprland.focusedWorkspace?.id === 9
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 9) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					text: "009"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 9")
						}
					}
				} // Text WP 9

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 10
					font.weight: isActive ? 1000 : 500
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 10) ?? null) != null
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					text: "010"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							Hyprland.dispatch("workspace 10")
						}
					}
				} // Text WP 10
			} // Column



ListView {
    id: verticalPlayerView
    anchors.centerIn: parent

    property int delegateHeight: 180 
    width: 100 
    height: delegateHeight 
    
    visible: count > 0 
    clip: true 
    model:  Mpris.players.values
    .filter(function(player) {
			return player.trackTitle !== ""
    })
   
    orientation: ListView.Horizontal
    snapMode: ListView.SnapOneItem
    highlightRangeMode: ListView.StrictlyEnforceRange
    
    // preferredHighlightBegin: 0
    // preferredHighlightEnd: delegateHeight
    
    highlightMoveDuration: 300
    maximumFlickVelocity: 1000

		// currentIndex: Mpris.players.values.length - 1

			MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        
        onWheel: function(wheel) {
            if (wheel.angleDelta.y > 0) {
                verticalPlayerView.decrementCurrentIndex()
            } else if (wheel.angleDelta.y < 0) {
                verticalPlayerView.incrementCurrentIndex()
            }
            wheel.accepted = true
        }
        
        onPressed: function(mouse) {
            mouse.accepted = false 
        }
    }
    

    delegate: Item {
        id: delegateRoot
        width: verticalPlayerView.width
        height: verticalPlayerView.delegateHeight
        
        Rectangle {
            anchors.fill: parent
            anchors.margins: 5
            color: "transparent" 

            Column {
                anchors.centerIn: parent
                spacing: 30 

                Item {
                    width: trackText.height
                    height: 100 
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: trackText
                        text: (modelData.trackTitle || "").toUpperCase()
                        
                        color: Colors.color7
                        font.pixelSize: 18
                        font.family: 'SauceCodePro NF'
                        
                        width: 150 
                        horizontalAlignment: Text.AlignHCenter
                        elide: Text.ElideRight
                        
                        rotation: -90
                        transformOrigin: Item.Center
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: imgContainer
                    width: 32.5
                    height: 32.5
                    radius: width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    clip: true

										Rectangle {
											anchors.fill: parent
											color: Colors.color550
											radius: img.width / 2
											z: 10
										}
                    
                    Image {
                        id: img
                        anchors.fill: parent
                        source: modelData.trackArtUrl || ""
                        fillMode: Image.PreserveAspectCrop

                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Rectangle {
                                width: img.width
                                height: img.height
                                radius: img.width / 2
                            }
                        }

                        RotationAnimation on rotation {
                            from: 0; to: 360
                            duration: 10000
                            loops: Animation.Infinite
                            running: modelData.playbackState === MprisPlaybackState.Playing
                        }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: modelData.togglePlaying()
        }
    }

}


			Column {
				Layout.alignment: Qt.AlignBottom
				Layout.leftMargin: 10
				Layout.bottomMargin: 10
				spacing: 10

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 10
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 10) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
						}
					}
				} // Text WLP

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 9
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 9) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
						}
					}
				} // Text WLP

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 8
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 8) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
						}
					}
				} // Text WLP

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 7
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 7) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
						}
					}
				} // Text WLP

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 6
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 6) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
						}
					}
				} // Text WLP

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 5
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 5) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "-"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							cmdoer.command = ["exec", "/home/big/scripts/random-wall.sh"]
							cmdoer.running = true
						}
					}
				} // Text WLP

				Text {

					property bool isActive: Hyprland.focusedWorkspace?.id === 4
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 4) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.family: "SauceCodePro NF"
					font.pixelSize: 15
					text: "BTH"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							cmdoer.command = ["blueman-manager"]
							cmdoer.running = true
						}
					}
				} // Text BTH

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 3
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 3) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "NET"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							cmdoer.command = ["ghostty", "-e", "nmtui"]
							cmdoer.running = true
						}
					}
				} // Text NET

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 2
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 2) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "QBT"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							cmdoer.command = ["qbittorrent"]
							cmdoer.running = true
						}
					}
				} // Text QBT

				Text {
					property bool isActive: Hyprland.focusedWorkspace?.id === 1
					property var hasWorkspace: (Hyprland.workspaces.values.find(ws => ws.id === 1) ?? null) != null
					font.weight: isActive ? 1000 : 500
					color: hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8
					anchors.right: parent.right
					font.pixelSize: 15
					font.family: "SauceCodePro NF"
					text: "WLP"
					MouseArea {
						anchors.fill: parent
						onClicked: {
							cmdoer.command = ["exec", "/home/big/scripts/random-wall.sh"]
							cmdoer.running = true
						}
					}
				} // Text WLP

			}

			Process {
				id: volControlUp
				command: ["wpctl",  "set-volume",  "-l",  "1" ,"@DEFAULT_AUDIO_SINK@", "5%+"]
				running: false
			} // Process

			Process {
				id: volControlDown
				command: ["wpctl",  "set-volume",  "-l",  "1" ,"@DEFAULT_AUDIO_SINK@", "5%-"]
				running: false
			} // Process

			Process {
				id: volProc
				command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
				stdout: SplitParser {
					onRead: data => {
						if (!data) return
						var match = data.match(/Volume:\s*([\d.]+)/)
						if (match) {
							volumeLevel = Math.round(parseFloat(match[1]) * 100)
						}
					}
				}
				Component.onCompleted: running = true
			} // Process

			Process {
				id: cmdoer
				command: []
				running: false
			} // Process

			Process {
				id: dateProc
				command: ["date", "+%^a %^b %e %H:%M:%S %Z %y"]
				running: true
				stdout: StdioCollector {
					onStreamFinished: {
						hour.text = "H" + this.text.split(" ")[3].split(":")[0]
						day.text = this.text.split(" ")[0]
						date.text = "D" + this.text.split(" ")[2]
						minute.text = "M" + this.text.split(" ")[3].split(":")[1]
						month.text = this.text.split(" ")[1]
						year.text = "Y" + this.text.split(" ")[5]
						// clock.text = this.text
					}
				}
			} // Process

			Process {
				id: batStatusProc
				command: ["cat", "/sys/class/power_supply/BAT1/status", "&&", "cat", "/sys/class/power_supply/BAT1/capacity"]
				running: true
				stdout: StdioCollector {
					onStreamFinished: {

						batStatus.text = this.text.split("\n")[0] == "Discharging" ? "D" + ( parseInt(this.text.split("\n")[1], 10) == 100 ? "FL" : parseInt(this.text.split("\n")[1], 10) ) : this.text.split("\n")[0] == "Full" ? "BFL" : "C" + ( parseInt(this.text.split("\n")[1], 10) == 100 ? "FL" : parseInt(this.text.split("\n")[1], 10) )

						batStatus.color= (this.text.split("\n")[0] == "Discharging" && parseInt(this.text.split("\n")[1]) < 10) ? "red" : (hasWorkspace ? (isActive ? Colors.color5 : Colors.color7) : Colors.color8)
					}
				}
			} // Process

			Timer {
				interval: 1000
				running: true
				repeat: true
				onTriggered: {
					dateProc.running = true
					batStatusProc.running = true
				}
			} // Timer

		} // Column
	}

} // ShellRoot
