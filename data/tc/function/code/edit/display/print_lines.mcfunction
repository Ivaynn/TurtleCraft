# Executed by the player. All turtle components have tag "tc.tmp"


# Get section of selected line
scoreboard players operation $index_start tc.tmp = @s tc.line
scoreboard players operation $index_start tc.tmp /= #10 tc.math
scoreboard players operation $index_start tc.tmp *= #10 tc.math
scoreboard players operation $index_end tc.tmp = $index_start tc.tmp
scoreboard players add $index_end tc.tmp 9


# New list: remove everything after $index_end and before $index_start
# This uses more lines than needed because it's using common functions with specific variable names
scoreboard players operation $last_index tc.tmp = $line_count tc.tmp
scoreboard players operation $index tc.tmp = $index_end tc.tmp
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last

scoreboard players operation $index tc.tmp = $index_start tc.tmp
data modify storage tc:tmp list_end set from storage tc:tmp list_start
scoreboard players remove $index tc.tmp 1
execute if score $index tc.tmp matches 0.. run function tc:code/edit/common/remove_first


# Get selected line in new list
scoreboard players operation $index_selected tc.tmp = @s tc.line
scoreboard players operation $index_selected tc.tmp %= #10 tc.math
scoreboard players operation $page_selected tc.tmp = @s tc.line
scoreboard players operation $page_selected tc.tmp /= #10 tc.math
scoreboard players operation $index_last tc.tmp = $line_count tc.tmp
scoreboard players operation $index_last tc.tmp %= #10 tc.math


# Get displays
scoreboard players set $index tc.tmp 0
data modify storage tc:tmp list_selected set from storage tc:tmp list_end
function tc:code/edit/display/get_display


execute if score $page_selected tc.tmp matches 0 run tellraw @s ""
execute if score $page_selected tc.tmp matches 0 run scoreboard players reset $page_selected tc.tmp


# Display content of new list - Needs one line for every instruction because the /trigger score (301, 302, 303...) can't be iterated, so that whole line has to be repeated
execute if score $page_selected tc.tmp matches 1.. unless score $index_selected tc.tmp matches 0 if data storage tc:tmp list_selected[0] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -300"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"0","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[0].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[0].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[0].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[0].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[0].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[0].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute if score $page_selected tc.tmp matches 1.. unless score $index_selected tc.tmp matches 0 unless data storage tc:tmp list_selected[0] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"0 |","color": "dark_gray"}]
execute if score $page_selected tc.tmp matches 1.. if score $index_selected tc.tmp matches 0 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 1 if data storage tc:tmp list_selected[1] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -301"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"1","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[1].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[1].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[1].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[1].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[1].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[1].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 1 unless data storage tc:tmp list_selected[1] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"1 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 1 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 2 if data storage tc:tmp list_selected[2] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -302"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"2","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[2].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[2].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[2].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[2].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[2].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[2].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 2 unless data storage tc:tmp list_selected[2] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"2 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 2 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 3 if data storage tc:tmp list_selected[3] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -303"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"3","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[3].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[3].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[3].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[3].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[3].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[3].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 3 unless data storage tc:tmp list_selected[3] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"3 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 3 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 4 if data storage tc:tmp list_selected[4] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -304"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"4","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[4].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[4].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[4].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[4].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[4].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[4].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 4 unless data storage tc:tmp list_selected[4] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"4 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 4 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 5 if data storage tc:tmp list_selected[5] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -305"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"5","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[5].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[5].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[5].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[5].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[5].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[5].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 5 unless data storage tc:tmp list_selected[5] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"5 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 5 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 6 if data storage tc:tmp list_selected[6] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -306"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"6","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[6].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[6].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[6].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[6].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[6].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[6].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 6 unless data storage tc:tmp list_selected[6] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"6 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 6 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 7 if data storage tc:tmp list_selected[7] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -307"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"7","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[7].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[7].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[7].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[7].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[7].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[7].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 7 unless data storage tc:tmp list_selected[7] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"7 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 7 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 8 if data storage tc:tmp list_selected[8] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -308"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"8","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[8].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[8].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[8].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[8].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[8].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[8].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 8 unless data storage tc:tmp list_selected[8] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"8 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 8 run function tc:code/edit/display/selected_line/init
execute unless score $index_selected tc.tmp matches 9 if data storage tc:tmp list_selected[9] run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -309"},"hoverEvent":{"action":"show_text","contents":[{"text":"Select line","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "gray"},{"text":"9","color": "gray"},{"text":" | ","color": "dark_gray"}," ",{"nbt":"displays[9].C","storage":"tc:tmp","interpret":true}," ",{"nbt":"displays[9].J1","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[9].J2","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[9].J3","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[9].J4","storage":"tc:tmp","color": "gray","interpret":true}," ",{"nbt":"displays[9].J5","storage":"tc:tmp","color": "gray","interpret":true}]
execute unless score $index_selected tc.tmp matches 9 unless data storage tc:tmp list_selected[9] run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color": "dark_gray"},{"text":"9 |","color": "dark_gray"}]
execute if score $index_selected tc.tmp matches 9 run function tc:code/edit/display/selected_line/init


# Clear tmp
scoreboard players reset $index_start tc.tmp
scoreboard players reset $index_end tc.tmp
scoreboard players reset $index tc.tmp
scoreboard players reset $last_index tc.tmp
scoreboard players reset $index_selected tc.tmp
scoreboard players reset $index_last tc.tmp
scoreboard players reset $page_selected tc.tmp
scoreboard players reset $disp_command tc.tmp
data remove storage tc:tmp list_start
data remove storage tc:tmp list_end
data remove storage tc:tmp list_selected
data remove storage tc:tmp displays
data remove storage tc:tmp new_display
data remove storage tc:tmp selected_display
