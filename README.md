AutoLayoutDance
===============

This is a pretty quick (<100 lines) way to debug your AutoLayout ambiguos layout constraints.
Use a trigger to activate the dance of your ambiguous views to visually figure out which constraints are missing.

To use it in your code simply call 
<code>
[[NZAutoLayoutDance sharedInstance] triggerDanceOnAmbiguousLayout];
<code>

You can also log the description of NZAutoLayoutDance instance to effectively see which constraints, on Horizontal and Vertical axes, are affecting your layout.

In the provided demo the actual trigger is the shake gesture, which I think fits good with the dance! 