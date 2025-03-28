# Executed by player - all turtle entities have "turtlecraft.tmp"


# Clear text
scoreboard players reset @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.msg


# Player gets linked to turtle, unlink any other players
scoreboard players operation @s turtlecraft.id = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.id
execute as @a[tag=!turtlecraft.player] if score @s turtlecraft.id = @p[tag=turtlecraft.player] turtlecraft.id run function turtlecraft:reset_player


# If turtle has no owner, this player is the new one
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] unless data entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Owner run function turtlecraft:entity/interact/new_owner


# Choose action from player items/sneak
scoreboard players set $action turtlecraft.tmp 0
execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_equipment run scoreboard players set $action turtlecraft.tmp 1
# execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_disc unless predicate turtlecraft:holding_disc_turtle run scoreboard players set $action turtlecraft.tmp 2
# execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_disc_turtle run scoreboard players set $action turtlecraft.tmp 3
execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_cosmetic run scoreboard players set $action turtlecraft.tmp 4
execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_fuel run scoreboard players set $action turtlecraft.tmp 5
execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_lever run scoreboard players set $action turtlecraft.tmp 6
execute if predicate turtlecraft:sneak if predicate turtlecraft:holding_stick run scoreboard players set $action turtlecraft.tmp 7

execute if score use_tools turtlecraft.options matches 1 if predicate turtlecraft:sneak unless data entity @s SelectedItem unless data entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] {HandItems:[{id:"minecraft:red_stained_glass_pane"}]} run scoreboard players set $action turtlecraft.tmp 1


# Actions
execute if score $action turtlecraft.tmp matches 0 run scoreboard players reset @s turtlecraft.line
execute if score $action turtlecraft.tmp matches 0 run advancement grant @s only turtlecraft:open_menu

execute if score $action turtlecraft.tmp matches 0 run function turtlecraft:code/edit/display/init
execute if score $action turtlecraft.tmp matches 1 if score use_tools turtlecraft.options matches 1 run function turtlecraft:entity/interact/switch_item
# execute if score $action turtlecraft.tmp matches 2 if score use_discs turtlecraft.options matches 1 run function turtlecraft:entity/interact/disc/save
# execute if score $action turtlecraft.tmp matches 3 if score use_discs turtlecraft.options matches 1 run function turtlecraft:entity/interact/disc/load
execute if score $action turtlecraft.tmp matches 4 if score change_appearance turtlecraft.options matches 1 run function turtlecraft:entity/interact/change_cosmetic
execute if score $action turtlecraft.tmp matches 5 if score use_fuel turtlecraft.options matches 1 run function turtlecraft:entity/interact/use_fuel

execute if score $action turtlecraft.tmp matches 1 if score use_tools turtlecraft.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
# execute if score $action turtlecraft.tmp matches 2..3 if score use_discs turtlecraft.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
execute if score $action turtlecraft.tmp matches 4 if score change_appearance turtlecraft.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]
execute if score $action turtlecraft.tmp matches 5 if score use_fuel turtlecraft.options matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This feature has been disabled!\n","color":"gray"}]

execute if score $action turtlecraft.tmp matches 6 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/toggle
execute if score $action turtlecraft.tmp matches 7 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:entity/remove/init


# Clear tmp
scoreboard players reset $action turtlecraft.tmp
