
data modify storage tc:tmp line_set_copy set from storage tc:tmp Instructions
data modify storage tc:tmp Instructions set value []
function tc:code/edit/update_line_set/iterate

# Clear tmp
data remove storage tc:tmp line_set_copy
data remove storage tc:tmp line_update
scoreboard players reset $line_type tc.tmp
scoreboard players reset $line_number tc.tmp
scoreboard players reset $line_set_diff tc.tmp
