# Modern Look OSX

This project aims to provide a simple and customizable component set which can be used to create OSX applications with new style look.
<p align="center">
	<img src="doc/modernlook.gif" alt="Sample">
	<p align="center">
		<em>A skeleton app showing ModernLook-OSX in action</em>
	</p>
</p>

**IMPORTANT NOTICE**

ModernLook-OSX requires OSX 10.10 to work properly. I have tested the components on OSX 10.9 with no success: generally the application runs well on 10.9, but some visual effect does not work. Probably some hacking can help, so if you can make it look better on 10.9 please let me know. However I think this new look does not fit well on older OSX UI.

#Description

ModernLook-OSX is the amalgamation of different ideas found all around the net (especially on [stackoverflow.com](http://stackoverflow.com) ) discussing about how to achieve the look of application rewritten by Apple for Yosemite.
 
Most of the components are derived from NS* native components and add special UI code to fit into the general ModernLook. 
For example, there is the MLTextField component which is derived from NSTextField. The new component initializes the NSTextField with hardcoded values (font, colors, etc.) and overrides the original painting code to add a thin line beneath the component.

<img src="doc/mltextfield.png" alt="MLTextField" style="width:189;height:44">


#Usage

##MLMainWindow

ModernLook-OSX contains several components to let you create exciting applications, however not all the OSX UI covered yet. I plan to add more component to the package, so stay tuned!

The implementation of a ModernLook-OSX application begins at MLMainWindow. MLMainWindow is derived from NSWindow and modifies it with the following settings:

- turns off the title bar
- makes the window transparent
- makes the window movable by dragging its content

Why ModernLook-OSX do this? Because of currently no legal way to change the color of the title and toolbar of an application (at least I did not find it). There are some hacks around, but those are based on undocumented API calls, so the application would never be accepted to became App Store compatible by Apple. Yes, of course you can try to play with set the appearance of a window, for example, to NSAppearanceNameVibrantDark, but it is just pain on neck.

So back to the MLMainWindow. With MLMainWindow you have absolutely nothing. There is nothing visible on the screen. And this is great! You can control every piece of the window by yourself. You can make your own title and toolbar, you can create you own content. ModernLook-OSX provides some helper class to make the UI usable.

##MLWindowContent

##MLToolbar

##MLContentView

