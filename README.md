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


#Main components

ModernLook-OSX contains several components to let you create exciting applications, however not all the OSX UI covered yet. I plan to add more component to the package, so stay tuned!

##MLMainWindow
This component can be used to create a window for your application.

##MLWindowContent
This component is used for MLMainWindow's contentView. It draws as a colored, rounded rectangle. You can specify it's color by overriding the backgroundColor property.

##MLToolbar
This component can be used for MLMainWindow's toolbar. This component has nothing common with standard NSToolbar, it simple NSView which just draws the window buttons. The content of the toolbar can be designed in IB.

##MLContentView
You must use this component as your window content base class. 

#Window setup
You can design your window in IB and it is up to you how to layout stuffs. Generally you should add a toolbar and content view to the window, specifying the Custom Class property accordingly.
<p align="center">
	<img src="doc/ml-ib.png" alt="Window Setup in IB">
	<p align="center">
		<em>Window Setup in IB</em>
	</p>
</p>

Above you can see, that the toolbar portion of the window is a class of MLToolbar, the content view area is covered by an MLContentView.

You can add any other component to these view
#Additional component

##MLTextField

##MLComboField

##MLOutlineView

##MLTableView

##MLRadioGroupManager

#Sample Application
The provided sample application is an imagined Budget app. It has 4 separate area:

1. Settings panel
2. Accounts panel
3. Budget panel
4. Prediction panel

The application has a toolbar, where the user can switch between the application panels.

 
```objective-c
- (void)drawRect: (NSRect)rect
{
	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	
	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS yRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS];
	[self.backgroundColor set];
	[borderPath fill];
	
	[NSGraphicsContext restoreGraphicsState];
}
```
