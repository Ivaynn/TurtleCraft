
function tc:code/edit/update_line_set/update

data modify storage tc:tmp Instructions append from storage tc:tmp line_set_copy[0]
data remove storage tc:tmp line_set_copy[0]

execute if data storage tc:tmp line_set_copy[0] run function tc:code/edit/update_line_set/iterate
