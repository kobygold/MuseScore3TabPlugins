//=============================================================================
//  MuseScore3 - Diatonica Harmonica Tablature Plugins
//
//  Copyright (C)2022 Koby Goldberg
//  This plugin is based on the Recorder-Tablature plugin by Fenjuh:
//  https://github.com/Fenjuh/Recorder-Tablature
//  which was a variation of Werner Schweer very famous recorder_fingering plugin.
//  I've changed Fenjuh's code to use my own font symbols and draw the signs on a consistent line height.
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
      description: "Place Baroque Recorder fingers numbers for open/close under the notes.\n\u2460 = open\n\u2776 = closed"
      menuPath: "Plugins.Koby-Recorder"
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

      //                              C5                                                                          C5#                                                                         D5                                                                          D5#                                                                         E5                                                                          F5                                                                          F5#                                                                         G5                                                                          G5#                                                                         A5                                                                          A5#                                                                         B5                                                                          C6                                                                          C6#                                                                         D6                                                                          D6#                                                                         E6                                                                          F6                                                                          F6#                                                                         G6                                                                          G6#                                                                         A6                                                                          A6#                                                                         B6                                                                          C7                                                                          C7#                                                                         D7                                                                          D7#                                                                         
      property variant fingerings : ["\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u045c\n\u045c\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u045c\n\u045a\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u045c\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u045a\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u0459\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0454\n\u0453\n\u045c\n\u045c\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0453\n\u0454\n\u045c\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0457\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0456\n\u0454\n\u0454\n\u045c\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0454\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0453\n\u0457\n\u0454\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0457\n\u0454\n\u0453\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0457\n\u0453\n\u0454\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0456\n\u0454\n\u0454\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0456\n\u0453\n\u0454\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0456\n\u0453\n\u0454\n\u0457\n\u0454\n\u0454\n\u045c\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0457\n\u0454\n\u0454\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0457\n\u0454\n\u0453\n\u045c\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0457\n\u0453\n\u0454\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0457\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0456\n\u0454\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0456\n\u0453\n\u0453\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0456\n\u0454\n\u0454\n\u045c\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0454\n\u0456\n\u0454\n\u0454\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0453\n\u0456\n\u0454\n\u0454\n\u0459\n\u0459\n", "\u045d\n\u0458\n\u0454\n\u0455\n\u0457\n\u0454\n\u0455\n\u045c\n\u045c\n", "\u045d\n\u0458\n\u0454\n\u0453\n\u0457\n\u0454\n\u0453\n\u045c\n\u0459\n", "\u045d\n\u0458\n\u0453\n\u0454\n\u0457\n\u0453\n\u0454\n\u045c\n\u0459\n"]

      function placeTab(size){
            var cursor   = curScore.newCursor();
            cursor.staffIdx = 0; // start on first staff
            cursor.voice = 0; // hope that only one voice in score, for recorder :)
            cursor.rewind(0);  // set cursor to start of score
            while (cursor.segment) { // in end segment is null
                  if (cursor.element._name() == "Chord") {
                        var pitch = cursor.element.notes[0].pitch;
                        var index = pitch - 72;
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