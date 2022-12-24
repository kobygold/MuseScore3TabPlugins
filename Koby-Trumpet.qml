//=============================================================================
//  MuseScore3 - Diatonica Harmonica Tablature Plugins
//
//  Copyright (C)2022 Koby Goldberg
//  This plugin is based on the Recorder-Tablature plugin by Fenjuh:
//  https://github.com/Fenjuh/Recorder-Tablature
//  which was a variation of Werner Schweer very famous recorder_fingering plugin.
//  I've changed Fenjuh's code to support Trumpet valves, and write the values that are open/close on a consistent line height.
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
      description: "Place Trumpet valves numbers for open/close under the notes.\n\u2460 = first released\n\u2461 = second released\n\u2462 = third released\n\u2776 = first pressed\n\u2777 = second pressed\n\u2778 = third pressed"
      menuPath: "Plugins.Koby-Trumpet"
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

      //                               F3#                       G3                        G3#                       A3                        A3#                       B3                        C4                        C4#                       D4                        D4#                       E4                        F4                        F4#                       G4                        G4#                       A4                        A4#                       B4                        C5                        C5#                       D5                        D5#                       E5                        F5                        F5#                       G5                        G5#                       A5                        A5#                       B5                        C6                        C6#                       D6                        D6#                       E6                        F6                        F6#                       G6                        
      property variant fingerings : ["\u2778\n\u2777\n\u2776", "\u2778\n\u2461\n\u2776", "\u2778\n\u2777\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2778\n\u2777\n\u2776", "\u2778\n\u2461\n\u2776", "\u2778\n\u2777\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2778\n\u2777\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2778\n\u2777\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2462\n\u2777\n\u2776", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460", "\u2462\n\u2461\n\u2776", "\u2462\n\u2777\n\u2460", "\u2462\n\u2461\n\u2460"]

      function placeTab(size){
            var cursor   = curScore.newCursor();
            cursor.staffIdx = 0; // start on first staff
            cursor.voice = 0; // hope that only one voice in score, for recorder :)
            cursor.rewind(0);  // set cursor to start of score
            while (cursor.segment) { // in end segment is null
                  if (cursor.element._name() == "Chord") {
                        var pitch = cursor.element.notes[0].pitch;
                        var index = pitch - 54;
                        if(index >= 0 && index < fingerings.length){ 
                              var text = newElement(Element.LYRICS);
                              text.fontSize = size;
                              //text.fontFace = "KobyMusic";
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