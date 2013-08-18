AutoLayoutDance
===============

A pretty quick (<100 lines) tool to debug your AutoLayout ambiguos layout.

1. Add the pod to your podfile <code>pod 'AutoLayoutDance', '~> 0.0.1'</code>
2. Trigger the dance with <code>[[NZAutoLayoutDance sharedInstance] triggerDanceOnAmbiguousLayout];</code>
3. Visually figure out which constraints are missing

In the provided demo, AutoLayoutShakeDemo, the shake gesture is used as a trigger to start the dance!

Have fun!
