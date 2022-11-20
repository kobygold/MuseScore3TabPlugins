# MuseScore Tabular Plugins
Plugins for MuseScore3 that can add note annotations for selected instruments, such as Harmonica holes to draw/blow.

## How to install
Requirements: MuseScore 3.x
1. Copy the .qml file to your MuseScore3 plugins folder. On Windows this is: "C:\Program Files\MuseScore 3\plugins\"
2. Install the provided font "KobyMusic.ttf" on your system. On Windows: [WIN]+R, type: "fonts", then copy-and-paste the font here.
3. Run MuseScore3
4. Go to Plugins menu > Plugin Manager > Check "Diatonic-Harmonica-C" to add it to the menu.
5. Press OK

## How to use
NOTE: The plugin works only on the first staff, so use a one staff score or put the staff that you want to annotate at the top.
1. Open your notes sheet in MuseScore 3
2. Go to Plugins menu > Diatonic-Harmonica-C
3. Choose font size (from 5 to 30). Default value is 10. And press OK.
4. To remove annotations right after adding them fo to Edit menu > Undo (CTRL+Z)
5. Notes that are not playable on the Diatonic Harmonica will not be given annotations. If you have such notes you may try to shift all your notes scale up or down so they will fit the Harmonica range, undo the anotations, and run the plugin again.

## About
This plugin is based on the Recorder-Tablature plugin by Fenjuh:
https://github.com/Fenjuh/Recorder-Tablature
which was a variation of Werner Schweer very famous recorder_fingering plugin.
I've changed Fenjuh's code to support Diatonic Harmonica in the key of C, and write the hole numbers and arrows on a consistent line height.
I created the font annotations myself, and added them to the open source font "Secular One":
https://fontmeme.com/fonts/secular-one-font/

## Screenshots
Installation:

![Tux, install](/screenshots/screenshot-install.png)

Run:

![Tux, the GUI](/screenshots/screenshot-run.png)

Output - Diatonic Harmonica C:

![Tux, the GUI](/screenshots/screenshot-diatonic-harmonica-c.png)
