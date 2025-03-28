# Executed by the player. All turtle components have tag "turtlecraft.tmp"

# Get command ID
execute store result score $command turtlecraft.tmp run data get storage turtlecraft:tmp selected_display.CID


# Line number json
execute unless data storage turtlecraft:tmp selected_display.bp run data modify storage turtlecraft:tmp number_json set value [{"score":{"name":"$page_selected","objective":"turtlecraft.tmp"},"color":"green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -487"},"hover_event":{action:"show_text",value:[{"text":"Toggle breakpoint","color":"gray"}]}},{"score":{"name":"$index_selected","objective":"turtlecraft.tmp"},"color":"green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -487"},"hover_event":{action:"show_text",value:[{"text":"Toggle breakpoint","color":"gray"}]}}," "]
execute if data storage turtlecraft:tmp selected_display.bp run data modify storage turtlecraft:tmp number_json set value [{"score":{"name":"$page_selected","objective":"turtlecraft.tmp"},"color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -487"},"hover_event":{action:"show_text",value:[{"text":"Toggle breakpoint","color":"gray"}]}},{"score":{"name":"$index_selected","objective":"turtlecraft.tmp"},"color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -487"},"hover_event":{action:"show_text",value:[{"text":"Toggle breakpoint","color":"gray"}]}}," "]


# Move <direction>
execute if score $command turtlecraft.tmp matches 1 run function turtlecraft:code/edit/display/selected_line/move

# Turn <direction>
execute if score $command turtlecraft.tmp matches 2 run function turtlecraft:code/edit/display/selected_line/turn

# Mine/attack/harvest <direction>
execute if score $command turtlecraft.tmp matches 3..4 run function turtlecraft:code/edit/display/selected_line/lime_group
execute if score $command turtlecraft.tmp matches 10 run function turtlecraft:code/edit/display/selected_line/lime_group

# Use/insert/take <item> <direction>
execute if score $command turtlecraft.tmp matches 5..7 run function turtlecraft:code/edit/display/selected_line/yellow_group

# Grab/drop <item>
execute if score $command turtlecraft.tmp matches 8..9 run tellraw @s ["",{"nbt":"number_json","storage":"turtlecraft:tmp","interpret":true},{"text":"| ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"turtlecraft:tmp","interpret":true},"  ",{"nbt":"selected_display.J1","storage":"turtlecraft:tmp","interpret":true,"color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -401"},"hover_event":{action:"show_text",value:[{"text":"Click to insert your selected item","color":"gray"}]}}]

# Empty/comment line
execute if score $command turtlecraft.tmp matches 90 run tellraw @s [{"text":"","click_event":{action:"run_command",command:"/trigger TurtleCraft set -401"},"hover_event":{action:"show_text",value:[{"text":"Click to insert a comment. You\nmust be holding a Book and Quill\nwith the comment text","color":"gray"}]}},{"score":{"name":"$page_selected","objective":"turtlecraft.tmp"},"color":"green"},{"score":{"name":"$index_selected","objective":"turtlecraft.tmp"},"color":"green"},{"text":" | ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"turtlecraft:tmp","interpret":true},"  ",{"nbt":"selected_display.J1","storage":"turtlecraft:tmp","interpret":true,"color":"aqua"}]

# Counter <name> <operation> value/counter/pos <value>
execute if score $command turtlecraft.tmp matches 91 run function turtlecraft:code/edit/display/selected_line/counter

# If/unless item/block/counter ..
execute if score $command turtlecraft.tmp matches 92..93 run function turtlecraft:code/edit/display/selected_line/if

# Fuel <item> <count>
execute if score $command turtlecraft.tmp matches 94 run function turtlecraft:code/edit/display/selected_line/fuel

# Line <operation> value/counter <value>
execute if score $command turtlecraft.tmp matches 95 run function turtlecraft:code/edit/display/selected_line/line

# wait, pause, stop, remove
execute if score $command turtlecraft.tmp matches 96..99 run tellraw @s ["",{"nbt":"number_json","storage":"turtlecraft:tmp","interpret":true},{"text":"| ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"turtlecraft:tmp","interpret":true}]

# Clear tmp
scoreboard players reset $command turtlecraft.tmp
