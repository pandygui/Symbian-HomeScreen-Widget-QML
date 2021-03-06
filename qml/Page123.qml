//------------------------------------------------------------------------------
import QtQuick 1.1;
import com.nokia.symbian 1.1;

//------------------------------------------------------------------------------
Page {
  id: page123;
  tools: page123ToolBar;

  Item {
    id: page123Content;
    anchors {
      fill: parent;
      topMargin: mainStatusBar.height;
      bottomMargin: parent.tools.height;
    }

    Grid {
      id: page123Grid;
      spacing: platformStyle.paddingLarge;
      columns: 2;
      rows: 3;
      anchors {
        horizontalCenter: parent.horizontalCenter;
        verticalCenter: parent.verticalCenter;
      }

      Label {
        id: page123LabelBg;
        text: "Run in Background";
        height: page123SwitchBg.height;
        verticalAlignment: Text.AlignVCenter;
        platformInverted: main.platformInverted;
      }

      Switch {
        id: page123SwitchBg;
        platformInverted: main.platformInverted;
        onClicked: qmlView.setRunInBackground(page123SwitchBg.checked);
      }

      Label {
        id: page123LabelSkin;
        text: "Skin";
        height: page123SwitchSkin.height;
        verticalAlignment: Text.AlignVCenter;
        platformInverted: main.platformInverted;
      }

      Switch {
        id: page123SwitchSkin;
        platformInverted: main.platformInverted;
        onClicked: main.platformInverted = !main.platformInverted;
      }

      Label {
        id: page123LabelImage;
        text: "Image";
        height: page123Image.height;
        verticalAlignment: Text.AlignVCenter;
        platformInverted: main.platformInverted;
      }

      Image {
        id: page123Image;
        source: main.platformInverted ? "qrc:/icons/images/icons/toolbar-remove_inverse.png" : "qrc:/icons/images/icons/toolbar-remove.png";
      }
    }
  }

  ToolBar {
    id: page123ToolBar;
    platformInverted: main.platformInverted;
    anchors {
      bottom: parent.bottom;
    }

    tools: ToolBarLayout {
      ToolButton {
        id: page123ToolBarBack;
        iconSource: page123SwitchBg.checked ? "toolbar-back" : privateStyle.imagePath("qtg_graf_toolbutton_normal", main.platformInverted);
        platformInverted: main.platformInverted;
        onClicked: main.pageBack();

        Image {
          id: page123ToolBarBackIcon;
          source: main.platformInverted ? "qrc:/icons/images/icons/toolbar-remove_inverse.png" : "qrc:/icons/images/icons/toolbar-remove.png";
          visible: !page123SwitchBg.checked;
          anchors {
            horizontalCenter: parent.horizontalCenter;
            verticalCenter: parent.verticalCenter;
          }
        }
      }

      ToolButton {
        id: page123ToolBarTools;
        iconSource: "toolbar-menu";
        platformInverted: main.platformInverted;
        onClicked: main.showMainToolBarMenu();
      }
    }
  }

  onStatusChanged: {
    if(status === PageStatus.Activating)
      main.setBackground("qrc:/backgrounds/images/backgrounds/aurora00.jpg", "qrc:/backgrounds/images/backgrounds/aurora00_inverse.jpg", "qrc:/backgrounds/images/backgrounds/aurora00_blur.jpg", "qrc:/backgrounds/images/backgrounds/aurora00_blur_inverse.jpg");
  }
//------------------------------------------------------------------------------
  function onResize()
  {
    //
  }
}
//------------------------------------------------------------------------------
