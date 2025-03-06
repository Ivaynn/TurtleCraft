# Appends list_end (list) to Instructions (list). Example:
# [Instructions[0], Instructions[1], Instructions[2], list_end[0], list_end[1]]

# Inputs:
# storage turtlecraft:tmp Instructions
# storage turtlecraft:tmp list_end
# score $append_count turtlecraft.tmp ---> MUST BE THE LENGTH OF "storage turtlecraft:tmp list_end"

# Returns:
# storage turtlecraft:tmp Instructions


data modify storage turtlecraft:tmp Instructions append from storage turtlecraft:tmp list_end[0]
data remove storage turtlecraft:tmp list_end[0]
scoreboard players remove $append_count turtlecraft.tmp 1
execute if score $append_count turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/common/append_list
