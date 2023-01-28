# MuseScore Tabular Plugins
Plugins for MuseScore3 that can add note annotations for selected instruments, such as Harmonica holes to draw/blow.

## How to install
Requirements: MuseScore 3.x
1. Copy the .qml file to your MuseScore3 plugins folder. On Windows this is: "C:\Program Files\MuseScore 3\plugins\"
2. Install the provided font "KobyMusic.ttf" on your system. On Windows: [WIN]+R, type: "fonts", then copy-and-paste the font file here.
3. Run MuseScore3
4. Go to Plugins menu > Plugin Manager > Check the plugins you want to add to the menu:
    - "Koby-Diatonic-Harmonica-C"
    - "Koby-Chromatic-Harmonica-Text-10"  (Text format, i.e. without arrows)
    - "Koby-Chromatic-Harmonica-Text-12"  (Text format, i.e. without arrows)
    - "Koby-Chromatic-Harmonica-Text-16"  (Text format, i.e. without arrows)
    - "Koby-Recorder"
    - "Koby-Trumpet"
    - "Koby-Euphonium(Baritone)"
    - "Koby-Tuba"
    - "Koby-Hebrew-Names-Above"
    - "Koby-Hebrew-Names-Below"
![Tux, install](/screenshots/screenshot-install.png)

5. Press OK

## How to use
NOTE: The plugin works only on the first staff, so use a one staff score or put the staff that you want to annotate at the top.
1. Open your notes sheet in MuseScore 3
2. Go to Plugins menu > Diatonic-Harmonica-C (or any other plugin)
![Tux, the GUI](/screenshots/screenshot-run.png)
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
Output - Diatonic Harmonica C:

![Tux, the GUI](/screenshots/screenshot-diatonic-harmonica-c.png)

Output - Chromatic Harmonica 10 Holes (Text Only format):

![Tux, the GUI](/screenshots/screenshot-chromatic-10.png)

Output - Chromatic Harmonica 12 Holes (Text Only format):

![Tux, the GUI](/screenshots/screenshot-chromatic-12.png)

Output - Chromatic Harmonica 16 Holes (Text Only format):

![Tux, the GUI](/screenshots/screenshot-chromatic-16.png)

Output - Trumpet:

**Note:** For correct fingerings the instrument should be Bb Trumpet with 2 semitones offset (i.e. with "2-Major Second" transposition on the "Staff/Part Properties" page

![Tux, the GUI](/screenshots/screenshot-trumpet.png)

Output - Euphonium (Baritone):

![Tux, the GUI](/screenshots/screenshot-baritone.png)

Output - Tuba:

![Tux, the GUI](/screenshots/screenshot-tuba.png)

Output - Baroque Recorder:

![Tux, the GUI](/screenshots/screenshot-recorder.png)

