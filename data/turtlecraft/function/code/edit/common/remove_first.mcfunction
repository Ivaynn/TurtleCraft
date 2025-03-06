# Removes the first values of a list, up to $index (also removed)

# Inputs:
# storage turtlecraft:tmp list_end
# score $index turtlecraft.tmp

# Returns:
# storage turtlecraft:tmp list_end, with ]$index, ...[

data remove storage turtlecraft:tmp list_end[0]
scoreboard players remove $index turtlecraft.tmp 1
execute if score $index turtlecraft.tmp matches 0.. run function turtlecraft:code/edit/common/remove_first
