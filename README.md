# scd
SuperCD (scd) is a tool that builds off of the bash tool, cd. With scd, you can change directories to any directory, from any directory.
Have you ever needed to cd to a directory, but you can't remember the exact location?
Sure, you could go to the gui and find it, or use find or locate, but now you don't have to!
SuperCD (scd) allows you to cd to any directory, from any directory, just by name.
If more than one directory exists with such name, you can just select which one you had in mind.

# USAGE
You can use scd from this script, but I find it much better to save it in your .bashrc as a function.
Just copy and paste the function scd() into your .bashrc or .bash_profile

Example 1: scd  Documents    <- searches files for all dirs named Documents
Example 2: scd ..           <- goes back to the last directory you used scd in
Example 3: scd back [number]               <- goes back [number] directories
