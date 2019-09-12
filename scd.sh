#!/bin/bash
# Make a utility to navigate to directories on name alone, called SuperCD (scd)
# Have you ever needed to cd to a directory, but you can't remember the exact location?
# Sure, you could go to the gui and find it, or use find or locate, but now you don't have to!
# SuperCD (scd) allows you to cd to any directory, from any directory, just by name.
# If more than one directory exists with such name, you can just select which one you had in mind.

#USAGE
# You can use scd from this script, but I find it much better to save it in your .bashrc as a function.
# Just copy and paste the function scd() into your .bashrc or .bash_profile

# Example 1: scd  Documents    <- searches files for all dirs named Documents
# Example 2: scd ..           <- goes back to the last directory you used scd in
# Example 3: scd back [number]               <- goes back [number] directories

scd () 
( 
    input=$1;
    array=();

# Used for the 'back' command
	function back() {
		dirs=$1
		while [ "$dirs" -gt "0" ]
	       	do
			cd ..
			dirs=$(($dirs - 1))
	      	done
	}

    if [[ $input == ".." ]]; then
        cd "${lastDir}";
        exec bash;
    elif [[ $input == "back" ]]; then
	export lastDir=$(pwd)
	back $2
	exec bash	
    else
        if [ $# -eq 0 ] || [ $input == "help" ]; then
            echo "Usage: scd [folder name], scd .., scd back [number]";
            echo "Example 1: scd davisk2 searches for all directories with davisk2 in dirname";
            echo "Example 2: scd .. goes back to the last directory";
	    echo "Example 3: scd back 2 goes back 2 directories from where function was called";
        else
            readarray -t array < <(locate -r "/$input$" 2>/dev/null);
            if (( ${#array[@]} > 1 )); then
                for i in "${!array[@]}";
                do
                    printf "%s\t%s\n" "$i" "${array[$i]}";
                done;
                echo "Enter the number that corresponds with the desired directory: ";
                read index;
                export lastDir=$(pwd);
                cd "${array[$index]}";
                exec bash;
            else
                cd "${array[0]}";
                export lastDir=$(pwd);
                exec bash;
            fi;
        fi;
    fi

)



scd "$@"
