# Removes the first values of a list, up to $index (also removed)

# Inputs:
# storage tc:tmp list_end
# score $index tc.tmp

# Returns:
# storage tc:tmp list_end, with ]$index, ...[

data remove storage tc:tmp list_end[0]
scoreboard players remove $index tc.tmp 1
execute if score $index tc.tmp matches 0.. run function tc:code/edit/common/remove_first
