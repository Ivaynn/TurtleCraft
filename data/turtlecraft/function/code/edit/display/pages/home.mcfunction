# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 1


## GET DATA

# Get current status
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] unless score @s turtlecraft.line matches 1.. run scoreboard players set $status turtlecraft.tmp 0
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] if score @s turtlecraft.line matches 1.. if score @s turtlecraft.timer matches 0.. run scoreboard players set $status turtlecraft.tmp 1
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] if score @s turtlecraft.line matches 1.. if score @s turtlecraft.timer matches -1 run scoreboard players set $status turtlecraft.tmp 2
execute unless score $status turtlecraft.tmp matches 0.. run scoreboard players set $status turtlecraft.tmp 0

# Get other data
scoreboard players operation $current_line turtlecraft.tmp = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.line
execute unless score $current_line turtlecraft.tmp matches 0.. run scoreboard players set $current_line turtlecraft.tmp 1


## DISPLAY

# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n"


# Name - Status [owner, fuel, id]
execute if score $status turtlecraft.tmp matches 0 run tellraw @s [{"text":" ","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"equipment.feet.components.minecraft:custom_data.turtlecraft.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Idle","color": "red"}]
execute if score $status turtlecraft.tmp matches 1 run tellraw @s [{"text":" ","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"equipment.feet.components.minecraft:custom_data.turtlecraft.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Running","color": "dark_green"}]
execute if score $status turtlecraft.tmp matches 2 run tellraw @s [{"text":" ","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"equipment.feet.components.minecraft:custom_data.turtlecraft.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Paused","color": "green"}]


# MoveUp MoveForward MoveDown
tellraw @s ["\n                                     ",{"text":" ▲ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -705"},"hover_event":{action:"show_text",value:[{"text":"move up","color":"gray"}]}},{"text":" ↑ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -701"},"hover_event":{action:"show_text",value:[{"text":"move forward","color":"gray"}]}},{"text":" ▼ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -706"},"hover_event":{action:"show_text",value:[{"text":"move down","color":"gray"}]}}]


# START / STOP PAUSE / STOP UNPAUSE --- TurnLeft MoveBack TurnRight
execute if score $status turtlecraft.tmp matches 0 run tellraw @s ["            ",{"text":"  ","color":"dark_gray"},{"text":" START ","color":"dark_green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -201"},"hover_event":{action:"show_text",value:[{"text":"Click to start","color":"gray"}]}},{"text":"             ","color":"dark_gray"},{"text":" ← ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -707"},"hover_event":{action:"show_text",value:[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -702"},"hover_event":{action:"show_text",value:[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -708"},"hover_event":{action:"show_text",value:[{"text":"turn right","color":"gray"}]}}]
execute if score $status turtlecraft.tmp matches 1 run tellraw @s ["            ",{"text":"  ","color":"dark_gray"},{"text":"  ⏹  ","color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -202"},"hover_event":{action:"show_text",value:[{"text":"Click to stop","color":"gray"}]}},{"text":"  ⏸  ","color":"green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -203"},"hover_event":{action:"show_text",value:[{"text":"Click to pause","color":"gray"}]}},{"text":"            ","color":"dark_gray"},{"text":" ← ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -707"},"hover_event":{action:"show_text",value:[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -702"},"hover_event":{action:"show_text",value:[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -708"},"hover_event":{action:"show_text",value:[{"text":"turn right","color":"gray"}]}}]
execute if score $status turtlecraft.tmp matches 2 run tellraw @s ["         ",{"text":"  ","color":"dark_gray"},{"text":"  ⏹  ","color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -202"},"hover_event":{action:"show_text",value:[{"text":"Click to stop","color":"gray"}]}},{"text":"  ⏵  ","color":"dark_green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -204"},"hover_event":{action:"show_text",value:[{"text":"Click to continue","color":"gray"}]}},{"text":"  →  ","color":"green","click_event":{action:"run_command",command:"/trigger TurtleCraft set -209"},"hover_event":{action:"show_text",value:[{"text":"Click to run the next instruction","color":"gray"}]}},{"text":"         ","color":"dark_gray"},{"text":" ← ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -707"},"hover_event":{action:"show_text",value:[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -702"},"hover_event":{action:"show_text",value:[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -708"},"hover_event":{action:"show_text",value:[{"text":"turn right","color":"gray"}]}}]


# Music disc
execute if predicate turtlecraft:holding_disc if score use_discs turtlecraft.options matches 1 run function turtlecraft:code/edit/display/pages/home_disc
execute unless predicate turtlecraft:holding_disc run tellraw @s ""
execute unless score use_discs turtlecraft.options matches 1 run tellraw @s ""


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"dark_aqua"},{"text":" EDIT ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -500"},"hover_event":{action:"show_text",value:[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -206"},"hover_event":{action:"show_text",value:[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -207"},"hover_event":{action:"show_text",value:[{"text":"Other Options","color":"gray"}]}},{"text":" MORE","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -208"},"hover_event":{action:"show_text",value:[{"text":"Credits and Tutorials","color":"gray"}]}}]


## Clear tmp
scoreboard players reset $status turtlecraft.tmp
scoreboard players reset $current_line turtlecraft.tmp
