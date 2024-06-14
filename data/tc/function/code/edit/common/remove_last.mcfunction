# Removes the last values of a list, from $index (not removed) to $last_index (length of list)

# Inputs:
# storage tc:tmp list_start
# score $last_index tc.tmp
# score $index tc.tmp

# Returns:
# storage tc:tmp list_start, with [0, $index]

data remove storage tc:tmp list_start[-1]
scoreboard players remove $last_index tc.tmp 1
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last
