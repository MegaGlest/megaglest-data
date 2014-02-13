Glossy Serpent is a free theme for CEGUI, based on the Taharez Look theme.
Glossy Serpent is licensed under the terms of the MIT license.
Please consult the license file distributed with this skin for a full description.

Current version: 1.0
Author: Augustin Preda


File list:
~~~~~~~~~~
(X and Y are considered the major and minor revision numbers)

- GlossySerpent.X.Y.sample.win32.7z
      A binary win32 sample application. Uses OGRE.
- GlossySerpent.X.Y.7z
      The default release of the Glossy Serpent skin. Contains all the files needed to add the skin to your application.
- GlossySerpent.X.Y.ceed.7z
      (DISCONTINUED)
      A customized release of the Glossy Serpent skin. Was used previously to apply minor fixes to the skin in order
      to make it compatible with previous versions of CEED (Crazy Eddie's Editor). Some features that worked in the code
      were not yet supported by CEED. The dedicated version simply alleviated the problems.
      

Note:
~~~~~
Additional files (E.g. GIMP source files) can be found on the project's SVN repository.

TODO List:
~~~~~~~~~~
- New cursors:
    - Edit Text
- Test whether a separate set of cursors (custom colour based cursors) should also be provided.
- Tab control should also allow bottom side tabs.
- FHD cursors required.

Version history
~~~~~~~~~~~~~~~
Version 1.0
~~~~~~~~~~~
  - Bumped version information in all XML definition files to 1.0
  - Corrected batches used in set-up of archive file that gets distributed. The previous version (0.9) accidentally had
    files meant for CEGUI 0.7, but was marketed as a CEGUI 0.8 friendly release.

Version 0.9
~~~~~~~~~~~~
  - Updated skin to CEGUI support 0.8.3
  - CEGUI 0.7.* shall not be officially supported by new releases anymore.
  - IMPORTANT NOTE: Augustin Preda, 2014.01.27. It has been reported and confirmed that the release contained incorrect
    files. Recommended: DO NOT USE. Switch to 1.0 instead. 

Version 0.8.a
~~~~~~~~~~~~~
  - Added widgets (provided by Visse):
    - added Menubar widget
    - added PopupMenu widget
    - added MenuItem widget
  - Added FHD versions for Amber and Jade colour variations

Miscellaneous:
  - Integrated fixes reported by Visse

Version 0.8:
~~~~~~~~~~~~
Removed widgets/windows:
  - Radiobutton: removed from looknfeel file. Still present in the scheme file, where it is mapped to a checkbox.

Miscellaneous:
  - Minor improvements to the used sizes and images for combo-boxes.
  - Added FHD (Full HD) variant of the theme, in which all widget pictures have an increased size, to offer higher details on high resolutions. It's typically recommended to use at least 1920x1080 for these. The FHD variant is called "GlossySerpentFHD" and comes with its own data files. Cursors are not yet brought to the FHD size.
  - Removed un-needed code (minor cleanup of used files: imageset and looknfeel)
  - Added intermediate datafiles that can be used with the CEGUI 1.0 specification. In case you were transforming the skin from CEGUI 0.7 to CEGUI 1.0 specs, you can try this to see if it works better. Currently available only for the base skin.
  
Version 0.7:
~~~~~~~~~~~~
Removed widgets/windows:
  - Checkbox32: no longer needed. Simple checkbox can be used instead.
  
Miscellaneous:
  - Added support for custom colouring of items via code. Many images were redone to be gray-scale and have colorized information applied to them via XML. The default theme look might have a somewhat different feel as a result. 
  - Progressbar: added a leading part and one extra layer. The widget should look much nicer now.
  - Button32, Button32_4C, ProgressBar: added extra layers to reduce cut-out of items when resized under the source image size.
  - RadioButton: now using the checkbox widget entirely.
  - FrameWindow: added glyph support.

Version 0.6:
~~~~~~~~~~~~
Removed widgets/windows:
  - SimpleTransparentPanel: redundant due to new property on SimplePanel widget (TransparencyColour)
    - to get the same effect as before, use the property as <Property Name="BackgroundPictureColour" Value="AFFFFFFFF" />

New widgets/windows:
  - Checkbox32: identical to the old Checkbox (the new checkbox underwent minor changes)
  - Checkbox: modified look and feel so that it can be used with smaller sizes. (The imagery is basically the same, but projects like MMiX.Me which use small widgets will look crisper now).
  - SerpentPanel: similar to SimplePanel, but using a different set of pictures, with some snake figures in the corner. Having widgets such as this one was the goal of the skin from the very beginning. :-)
  
Miscellaneous:
  - FrameWindow: decreased minimum relative size from 0.1 to 0.01. The reason behind this is that the frame window (being more of a base widget) is used by many for generic purposes, so 0.1 was too large in some cases.
  - Small changes to the (text) selection brushes. They are "smoother" now.
  - Group Box supports an offset for the caption (property: CaptionOffset; default: 10). Thanks to sabby7890 for the suggestion.  
  - SimplePanel has a transparent middle content by default and a non-transparent border.
    - You can set the background to be non-transparent using the property <Property Name="BackgroundPictureColour" Value="FFFFFFFFF" />
  - Transparency of source pictures removed for SimplePanel, FrameWindow. Now transparency is controlled in the code.
  - Minor changes to the inner shadow of SimplePanel and FrameWindow.
  
Version 0.5:
~~~~~~~~~~~~
New widgets/windows:
  - ListboxTransparent

Fixes:
  - tooltip border shape corrected
  - replaced tooltip colors (both font and background) to allow multi-color text.

Miscellaneous:
  - added sample application. Based on the standard CEGUI sample application "Demo8". Uses Lua.

Version 0.4:
~~~~~~~~~~~~
New widgets/windows:
  - MultiLineEditbox

New cursors:
  - Resize
      - N-S
      - E-W
      - NW-SE
      - NE-SW

Fixes:
  - image sizes for buttons and progress bar. The minimum size for a nice look is 27 pixels (previously 30).

Version 0.3:
~~~~~~~~~~~~
New widgets/windows:
  - Radio Buttons
  - Selection group
  - Listbox
  - ItemListbox
  - MultiColumnList

Fixes:
  - glyph allignment in buttons.

Version 0.2a:
~~~~~~~~~~~~~
- progress bar: can now specify the fill colour of the bar.
- added a special version without minimum size option for scrollbar thumbs due to a bug in CEED.
 
Version 0.2:
~~~~~~~~~~~~
- overall: recolored skin: now has lower contrast in the borders, higher luminosity and a bit more vivid colors in general.
- overall: borders are now more crisp (the xml structure now favors the FrameComponent to ImageryComponent)
- added 4 cornered glyph button.
- added new glossy thumb buttons for horizontal and vertical scrollbars.
- added glossy progress bar
- made frame window titlebar glossy (also using simpler code in the background).
- added glyph to previous wide button with 2 embellished corners.
- made tab control buttons more glossy; got rid of unused tab control separator item.

New widgets/windows:
  - Button32_4C: wide button (optimized for (64+)x32 pixels size) with 4 embelished corners. 
                  Doesn't scale well vertically. Also supports a glyph.
  - GlyphButton: a button that supports only a glyph inside it. Used as a child in many other controls, replacing 
                  ImageButton in many instances.


Version 0.1:
~~~~~~~~~~~~
- first public release.
- tested with CEGUI 0.7.6

Supported basic widgets/windows (almost all being started from a near TaharezLook equivalent):
  - Button32: wide button (optimized for (64+)x32 pixels size)
  - Button: (simple)
  - Checkbox
  - Editbox
  - StaticImage
  - SimplePanel (this is basically a framewindow without a title or resize support).
  - SimpleTransparentPanel (same as the previous item, but with a semitransparent interior)
  - StaticText
  - scrollbars (VerticalScrollbar, HorizontalScrollbar) and thumbs (VerticalScrollbarThumb, HorizontalScrollbarThumb)
  - ImageButton
  - Combobox (ComboDropList, ComboEditbox, Combobox)
  - Spinner
  - Tooltip
  - TabControl (with TabButton, TabContentPane, TabButtonPane
  - SystemButton
  - FrameWindow (with Titlebar)
  - ProgressBar