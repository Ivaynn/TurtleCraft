# Executed by the player. All turtle components have tag "tc.tmp"

# Get command ID
execute store result score $command tc.tmp run data get storage tc:tmp selected_display.CID


# Line number json
execute unless data storage tc:tmp selected_display.bp run data modify storage tc:tmp number_json set value '[{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -487"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle breakpoint","color":"gray"}]}},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -487"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle breakpoint","color":"gray"}]}}," "]'
execute if data storage tc:tmp selected_display.bp run data modify storage tc:tmp number_json set value '[{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -487"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle breakpoint","color":"gray"}]}},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -487"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle breakpoint","color":"gray"}]}}," "]'


# Move <direction>
execute if score $command tc.tmp matches 1 run function tc:code/edit/display/selected_line/move

# Turn <direction>
execute if score $command tc.tmp matches 2 run function tc:code/edit/display/selected_line/turn

# Mine/attack/harvest <direction>
execute if score $command tc.tmp matches 3..4 run function tc:code/edit/display/selected_line/lime_group
execute if score $command tc.tmp matches 10 run function tc:code/edit/display/selected_line/lime_group

# Use/insert/take <item> <direction>
execute if score $command tc.tmp matches 5..7 run function tc:code/edit/display/selected_line/yellow_group

# Grab/drop <item>
execute if score $command tc.tmp matches 8..9 run tellraw @s ["",{"nbt":"number_json","storage":"tc:tmp","interpret":true},{"text":"| ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true},"  ",{"nbt":"selected_display.J1","storage":"tc:tmp","interpret":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -401"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to insert your selected item","color":"gray"}]}}]

# Empty/comment line
execute if score $command tc.tmp matches 90 run tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -401"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to insert a comment. You\nmust be holding a Book and Quill\nwith the comment text","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"green"},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"green"},{"text":" | ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true},"  ",{"nbt":"selected_display.J1","storage":"tc:tmp","interpret":true,"color":"aqua"}]

# Counter <name> <operation> value/counter/pos <value>
execute if score $command tc.tmp matches 91 run function tc:code/edit/display/selected_line/counter

# If/unless item/block/counter ..
execute if score $command tc.tmp matches 92..93 run function tc:code/edit/display/selected_line/if

# Fuel <item> <count>
execute if score $command tc.tmp matches 94 run function tc:code/edit/display/selected_line/fuel

# Line <operation> value/counter <value>
execute if score $command tc.tmp matches 95 run function tc:code/edit/display/selected_line/line

# wait, pause, stop, remove
execute if score $command tc.tmp matches 96..99 run tellraw @s ["",{"nbt":"number_json","storage":"tc:tmp","interpret":true},{"text":"| ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true}]

# Clear tmp
scoreboard players reset $command tc.tmp
