# Gear-Puzzle
In this there are multiple parts to the challenge. The most notable one that I like was the gear puzzle which was
a recreation of the gear puzzle in this challenge: https://www.youtube.com/watch?v=dK3iYbJPHpc&list=PLP6VONqXPU7SZ_vSc2OYBwmIhDQMbrOCM&index=24 at 5:57

Basic function of each script:
ChestScript.lua - If the character has a key in their inventory, if the lock on the chest is clicked, the position of the chest
roof will be moved

GearPuzzle.lua - All the functions regarding the gearpuzzle. Some of these functions include:
- checking to see if the gear puzzle pieces are in the users inventory before placing
- the ability to place a puzzle piece on any of the hangers (silver cylinders in the demo)
- Checking to see if all of the gear puzzle pieces are in the right place
- Making a gear index for the tools in the users inventory for the order in which pieces are placed
- If all pieces are in the correct place and a lever is clicked, gear puzzle pieces will rotate and an object
(blue immunity flag) will tween vertically

SandMoundAnimation.rbxm - Server side script that takes an animation I created and on event (proximity prompt
of a sandmound is prompted) the animation occurs

Teleport.lua - Takes two objects (a teleporter and a place to be teleported) if the teleporter is touched
then the character will be teleported to the teleported object

TripScript.rbxm - Disables the physics of a player when a block is touched to do a "trip" effect

keytoinventory.lua - on click of the object (key) the object will be placed inside the users inventory

sandmoundscript.lua - Once a sandmound proximity prompt is prompted, the character will be frozen for five seconds,
after five seconds the character will be unfrozen and the sandmound will be destroyed

Demo - https://youtu.be/UIl-ppV3c58
