# Executed by the player. All turtle components have tag "tc.tmp"
scoreboard players set @s tc.page 1


## GET DATA

# Get current status
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] unless score @s tc.line matches 1.. run scoreboard players set $status tc.tmp 0
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] if score @s tc.line matches 1.. if score @s tc.timer matches 0.. run scoreboard players set $status tc.tmp 1
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] if score @s tc.line matches 1.. if score @s tc.timer matches -1 run scoreboard players set $status tc.tmp 2
execute unless score $status tc.tmp matches 0.. run scoreboard players set $status tc.tmp 0

# Get other data
scoreboard players operation $current_line tc.tmp = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.line
execute unless score $current_line tc.tmp matches 0.. run scoreboard players set $current_line tc.tmp 1


## DISPLAY

# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n"


# Name - Status [owner, fuel, id]
execute if score $status tc.tmp matches 0 run tellraw @s [{"text":" ","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"ArmorItems[0].components.minecraft:custom_data.tc.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"tc.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Idle","color": "red"}]
execute if score $status tc.tmp matches 1 run tellraw @s [{"text":" ","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"ArmorItems[0].components.minecraft:custom_data.tc.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"tc.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Running","color": "dark_green"}]
execute if score $status tc.tmp matches 2 run tellraw @s [{"text":" ","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Owner: ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"ArmorItems[0].components.minecraft:custom_data.tc.Owner.Name","interpret":true,"color":"white"},{"text":"\nFuel: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.fuel"},"color":"white"},{"text":"\nID: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.id"},"color":"white"},{"text":"\nLine: ","color":"gray"},{"score":{"name":"$current_line","objective":"tc.tmp"},"color":"white"},{"text":"\n\nClick to refresh","color": "gray"}]}},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"CustomName","interpret":true,"color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Paused","color": "green"}]


# MoveUp MoveForward MoveDown
tellraw @s ["\n                                     ",{"text":" ▲ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -705"},"hoverEvent":{"action":"show_text","contents":[{"text":"move up","color":"gray"}]}},{"text":" ↑ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -701"},"hoverEvent":{"action":"show_text","contents":[{"text":"move forward","color":"gray"}]}},{"text":" ▼ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -706"},"hoverEvent":{"action":"show_text","contents":[{"text":"move down","color":"gray"}]}}]


# START / STOP PAUSE / STOP UNPAUSE --- TurnLeft MoveBack TurnRight
execute if score $status tc.tmp matches 0 run tellraw @s ["            ",{"text":"  ","color":"dark_gray"},{"text":" START ","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -201"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to start","color":"gray"}]}},{"text":"             ","color":"dark_gray"},{"text":" ← ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -707"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -702"},"hoverEvent":{"action":"show_text","contents":[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -708"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn right","color":"gray"}]}}]
execute if score $status tc.tmp matches 1 run tellraw @s ["            ",{"text":"  ","color":"dark_gray"},{"text":"  ⏹  ","color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -202"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to stop","color":"gray"}]}},{"text":"  ⏸  ","color":"green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -203"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to pause","color":"gray"}]}},{"text":"            ","color":"dark_gray"},{"text":" ← ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -707"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -702"},"hoverEvent":{"action":"show_text","contents":[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -708"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn right","color":"gray"}]}}]
execute if score $status tc.tmp matches 2 run tellraw @s ["         ",{"text":"  ","color":"dark_gray"},{"text":"  ⏹  ","color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -202"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to stop","color":"gray"}]}},{"text":"  ⏵  ","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -204"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to continue","color":"gray"}]}},{"text":"  →  ","color":"green","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -209"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to run the next instruction","color":"gray"}]}},{"text":"         ","color":"dark_gray"},{"text":" ← ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -707"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn left","color":"gray"}]}},{"text":" ↓ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -702"},"hoverEvent":{"action":"show_text","contents":[{"text":"move back","color":"gray"}]}},{"text":" → ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -708"},"hoverEvent":{"action":"show_text","contents":[{"text":"turn right","color":"gray"}]}}]


# Music disc
execute if predicate tc:holding_disc if score use_discs tc.options matches 1 run function tc:code/edit/display/pages/home_disc
execute unless predicate tc:holding_disc run tellraw @s ""
execute unless score use_discs tc.options matches 1 run tellraw @s ""


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"dark_aqua"},{"text":" EDIT ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -500"},"hoverEvent":{"action":"show_text","contents":[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -207"},"hoverEvent":{"action":"show_text","contents":[{"text":"Other Options","color":"gray"}]}},{"text":" MORE","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -208"},"hoverEvent":{"action":"show_text","contents":[{"text":"Credits and Tutorials","color":"gray"}]}}]


## Clear tmp
scoreboard players reset $status tc.tmp
scoreboard players reset $current_line tc.tmp
