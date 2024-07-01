# Admin function - executed by player directly at any time

tellraw @s ["",{"text":"\n Turtle List","color":"dark_aqua","bold":true}]

scoreboard players set $found_count tc.tmp 0
tag @s add tc.tmp_player
execute as @e[type=minecraft:llama,tag=tc.body] at @s run function tc:entity/print_info
tag @s remove tc.tmp_player


# Found: 00,  Total: 00,  Max ID: 00  Invalid: 00 - with hover text for what each one means
tellraw @s ["\n ",{"text":"Found: ","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Turtles in loaded chunks","color":"gray"}]}},{"score":{"name":"$found_count","objective":"tc.tmp"},"color":"gray"},"  ",{"text":"Total: ","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Total turtle count","color":"gray"}]}},{"score":{"name":"$turtle_count","objective":"tc.id"},"color":"gray"},"  ",{"text":"Max ID: ","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Number of turtles spawned","color":"gray"}]}},{"score":{"name":"$new","objective":"tc.id"},"color":"gray"},"  ",{"text":"Invalid: ","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Invalid entities removed,\na turtle has up to 5 entities","color":"gray"}]}},{"score":{"name":"$invalid_count","objective":"tc.id"},"color":"gray"}]
scoreboard players reset $found_count tc.tmp
