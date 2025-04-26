#!/bin/csh

# Get the current PATH environment variable and split it into an array
set path_list = ( `echo $PATH | tr ':' ' '` )

# Create a new array to store the deduplicated paths
set unique_paths = ()

# Iterate over each path in path_list
foreach npath ( $path_list )
    set found = 0
    # Check if the npath already exists in unique_paths
    foreach unique_path ( $unique_paths )
        if ( "$npath" == "$unique_path" ) then
            set found = 1
            break
        endif
    end
    # If it does not exist, add it to unique_paths
    if ( $found == 0 ) then
        set unique_paths = ( $unique_paths $npath )
    endif
end

# Recombine the deduplicated paths into the PATH environment variable
setenv PATH `echo $unique_paths | tr ' ' ':'`

# Output the new PATH environment variable
# echo $PATH
echo "$PATH" | tr ':' '\n'
