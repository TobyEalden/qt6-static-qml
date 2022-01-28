import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
  id: appWindow
  title: "minimal"
  visible: true
  width: 800
  height: 600

   Button {
    text: "Push Me"
    anchors.centerIn: parent
    onClicked: {
     text = "hello!"
    }
  }
}
