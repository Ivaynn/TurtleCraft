# Executed by player - all turtle entities have "tc.tmp"


# Clear text
scoreboard players reset @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.msg


# Player gets linked to turtle, unlink any other players
scoreboard players operation @s tc.id = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.id
execute as @a[tag=!tc.player] if score @s tc.id = @p[tag=tc.player] tc.id run function tc:reset_player


# If turtle has no owner, this player is the new one
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] unless data entity @s ArmorItems[0].tag.Owner run function tc:entity/interact/new_owner


# Choose action from player items/sneak
scoreboard players set $action tc.tmp 0
execute if predicate tc:sneak if predicate tc:holding_equipment run scoreboard players set $action tc.tmp 1
# execute if predicate tc:sneak if predicate tc:holding_disc unless predicate tc:holding_disc_turtle run scoreboard players set $action tc.tmp 2
# execute if predicate tc:sneak if predicate tc:holding_disc_turtle run scoreboard players set $action tc.tmp 3
execute if predicate tc:sneak if predicate tc:holding_cosmetic run scoreboard players set $action tc.tmp 4
execute if predicate tc:sneak if predicate tc:holding_fuel run scoreboard players set $action tc.tmp 5
execute if predicate tc:sneak if predicate tc:holding_lever run scoreboard players set $action tc.tmp 6
execute if predicate tc:sneak if predicate tc:holding_stick run scoreboard players set $action tc.tmp 7

execute if score use_tools tc.options matches 1 if predicate tc:sneak unless data entity @s SelectedItem unless data entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] {HandItems:[{id:"minecraft:red_stained_glass_pane"}]} run scoreboard players set $action tc.tmp 1


# Actions
execute if score $action tc.tmp matches 0 run scoreboard players reset @s tc.line
execute if score $action tc.tmp matches 0 run advancement grant @s only tc:open_menu

execute if score $action tc.tmp matches 0 run function tc:code/edit/display/init
execute if score $action tc.tmp matches 1 if score use_tools tc.options matches 1 run function tc:entity/interact/switch_item
# execute if score $action tc.tmp matches 2 if score use_discs tc.options matches 1 run function tc:entity/interact/disc/save
# execute if score $action tc.tmp matches 3 if score use_discs tc.options matches 1 run function tc:entity/interact/disc/load
execute if score $action tc.tmp matches 4 if score change_appearance tc.options matches 1 run function tc:entity/interact/change_cosmetic
execute if score $action tc.tmp matches 5 if score use_fuel tc.options matches 1 run function tc:entity/interact/use_fuel

execute if score $action tc.tmp matches 1 if score use_tools tc.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
# execute if score $action tc.tmp matches 2..3 if score use_discs tc.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
execute if score $action tc.tmp matches 4 if score change_appearance tc.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
execute if score $action tc.tmp matches 5 if score use_fuel tc.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]

execute if score $action tc.tmp matches 6 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/toggle
execute if score $action tc.tmp matches 7 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:entity/remove/init


# Clear tmp
scoreboard players reset $action tc.tmp
