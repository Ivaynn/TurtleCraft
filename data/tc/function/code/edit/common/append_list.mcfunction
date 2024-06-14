# Appends list_end (list) to Instructions (list). Example:
# [Instructions[0], Instructions[1], Instructions[2], list_end[0], list_end[1]]

# Inputs:
# storage tc:tmp Instructions
# storage tc:tmp list_end
# score $append_count tc.tmp ---> MUST BE THE LENGTH OF "storage tc:tmp list_end"

# Returns:
# storage tc:tmp Instructions


data modify storage tc:tmp Instructions append from storage tc:tmp list_end[0]
data remove storage tc:tmp list_end[0]
scoreboard players remove $append_count tc.tmp 1
execute if score $append_count tc.tmp matches 1.. run function tc:code/edit/common/append_list
