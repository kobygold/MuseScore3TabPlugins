//=============================================================================
//  MuseScore3 - Diatonica Harmonica Tablature Plugins
//
//  Copyright (C)2022 Koby Goldberg
//  This plugin is based on the Recorder-Tablature plugin by Fenjuh:
//  https://github.com/Fenjuh/Recorder-Tablature
//  which was a variation of Werner Schweer very famous recorder_fingering plugin.
//  I've changed Fenjuh's code to support Diatonic Harmonica in the key of C, and write the hole numbers and arrows on a consistent line height.
//  I created the font annotations myself, and added them to the open source font "Secular One":
//  https://fontmeme.com/fonts/secular-one-font/
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//=============================================================================

import QtQuick 2.1
import QtQuick.Dialogs 1.0
import QtQuick.Controls 1.0
import MuseScore 3.0

MuseScore {
      version: "2.0"
      description: "Place Diatonic-Harmonica in the Key of C hole number and direction arrow under the notes"
      menuPath: "Plugins.Koby-Diatonic-Harmonica-C"
      pluginType: "dialog"
      
      id:window
      width: 200; height: 100;

      Label {
        id: textLabel
        wrapMode: Text.WordWrap
        text: qsTr("Font size:")
        font.pointSize:11
        anchors.left: window.left
        anchors.top: window.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        }

      SpinBox {
        id:fontSize
        anchors.top: window.top
        anchors.left: textLabel.right
        anchors.right: window.right
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        height: 25
        font.pointSize: 11
        minimumValue: 5
        maximumValue: 30
        value: 10
        }

      Button {
        id : buttonOk
        text: qsTr("Ok")
        anchors.bottom: window.bottom
        anchors.left: window.left
        anchors.bottomMargin: 10
        anchors.leftMargin: 50
        isDefault: true
        onClicked: {
            curScore.startCmd();
            placeTab(fontSize.value);
            curScore.endCmd();
            Qt.quit();
            }
        }

      //                              C4           C4#          D4           D4#          E4           F4           F4#          G4           G4#          A4           A4#          B4           C5           C5#          D5           D5#          E5           F5           F5#          G5           G5#          A5           A5#          B5           C6           C6#          D6           D6#          E6           F6           F6#          G6           G6#          A6            A6#           B6            C7            C7#           
      property variant fingerings : ["\u043f\n1", "\u0438\n1", "\u043e\n1", "\u043b\n1", "\u043f\n2", "\u0439\n2", "\u0438\n2", "\u043f\n3", "\u043a\n3", "\u0439\n3", "\u0438\n3", "\u043e\n3", "\u043f\n4", "\u0438\n4", "\u043e\n4", "\u043b\n4", "\u043f\n5", "\u043e\n5", "\u043b\n5", "\u043f\n6", "\u0438\n6", "\u043e\n6", "\u043b\n6", "\u043e\n7", "\u043f\n7", "\u0440\n7", "\u043e\n8", "\u043c\n8", "\u043f\n8", "\u043e\n9", "\u043c\n9", "\u043f\n9", "\u0440\n9", "\u043e\n10", "\u043d\n10", "\u043c\n10", "\u043f\n10", "\u0440\n10"]
      function placeTab(size){
            var cursor   = curScore.newCursor();
            cursor.staffIdx = 0; // start on first staff
            cursor.voice = 0; // hope that only one voice in score, for recorder :)
            cursor.rewind(0);  // set cursor to start of score
            while (cursor.segment) { // in end segment is null
                  if (cursor.element._name() == "Chord") {
                        var pitch = cursor.element.notes[0].pitch;
                        var index = pitch - 60;
                        if(index >= 0 && index < fingerings.length){ 
                              var text = newElement(Element.LYRICS);
                              text.fontSize = size;
                              text.fontFace = "KobyMusic";
                              text.text = fingerings[index];
							  console.log(text.text);
                              //text.offsetY = -10;
                              //text.placement=Placement.BELOW;
                              cursor.add(text);
                        }// end if
                  }// end if
                  cursor.next();
            }// end while
      }
      onRun: {
            console.log("Hello from DiatonicHarmonica Tablature");

            if (typeof curScore === 'undefined')
                  Qt.quit();

      }
}