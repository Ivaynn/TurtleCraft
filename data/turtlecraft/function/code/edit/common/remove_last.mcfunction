# Removes the last values of a list, from $index (not removed) to $last_index (length of list)

# Inputs:
# storage turtlecraft:tmp list_start
# score $last_index turtlecraft.tmp
# score $index turtlecraft.tmp

# Returns:
# storage turtlecraft:tmp list_start, with [0, $index]

data remove storage turtlecraft:tmp list_start[-1]
scoreboard players remove $last_index turtlecraft.tmp 1
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last
