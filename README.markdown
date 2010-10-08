### Flash (AS3) Audio and Video Players

We constantly have a need for more custom audio/video players for client projects, so we've been working to create a modular/customizable version of each that can be used globally. This is the work-in-progress source for these players.

To use, drop in the desired .swf file into your site, and provide 3 flashvars:

1. **xmlPath**: This is the path to the config/styles xml file. This xml file is used to customize the look and feel of the buttons, background etc.
2. **autoPlay**: If you want your audio/video to automatically play (once buffered)
3. **file**: This is the url to the audio/video file to play. Make sure to urlencode them if you have query string params etc.

Check out the examples for more info, or the xml files under /config.

Everything is kind of beta right now, but fully functional. If you decide to use them and run across issues, post an issue on Github. 

Colors support 2 color gradients by using comma separated values. Objects also support strokes by setting a "stroke" value to 1 or higher.

We are also happy to consider any feature requests you may have. Planned updates include:

- Ability to have the players auto-resize themselves based on the stage size
- Allow you to use the players without having to drag/drop controls from the fla if you would like to use controls other than the ones we have defaulted.
- Possibly allow the ability to set x/y values for controls in the xml so you can style the entire player without having to open an fla.