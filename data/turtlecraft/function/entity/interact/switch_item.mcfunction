# Executed by player who is interacting - all turtle parts have tag "turtlecraft.tmp"

advancement grant @s only turtlecraft:equip

# Store player's selected item
data modify storage turtlecraft:tmp switch_item set from entity @s SelectedItem

scoreboard players set $valid_item turtlecraft.tmp 0
execute if data storage turtlecraft:tmp switch_item.id run scoreboard players set $valid_item turtlecraft.tmp 1

execute if score $valid_item turtlecraft.tmp matches 0 run data modify storage turtlecraft:tmp switch_item set value {id:"minecraft:air",count:1}
execute if score $valid_item turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp switch_item.components."minecraft:custom_data".turtlecraft.ClearItem set value 1b


# Give llama's item to player
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] if predicate turtlecraft:holding_equipment run data remove entity @s HandItems[0].components."minecraft:custom_data".turtlecraft
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] unless predicate turtlecraft:holding_equipment run data remove entity @s HandItems[0]
item replace entity @s weapon.mainhand from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] weapon


# Give stored item to llama
execute if score $valid_item turtlecraft.tmp matches 1 run data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] HandItems[0] set from storage turtlecraft:tmp switch_item
execute if score $valid_item turtlecraft.tmp matches 0 run data remove entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] HandItems[0]


# Empty item
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] unless data entity @s HandItems[0].id run function turtlecraft:entity/empty_item_slot


# Update visual item
execute if score $valid_item turtlecraft.tmp matches 1 run data modify entity @e[limit=1,type=minecraft:item_display,tag=turtlecraft.tmp,tag=turtlecraft.item] item set from storage turtlecraft:tmp switch_item
execute if score $valid_item turtlecraft.tmp matches 1 run data modify entity @e[limit=1,type=minecraft:item_display,tag=turtlecraft.tmp,tag=turtlecraft.item] view_range set value 1f
execute if score $valid_item turtlecraft.tmp matches 0 run data merge entity @e[limit=1,type=minecraft:item_display,tag=turtlecraft.tmp,tag=turtlecraft.item] {view_range:0f, item:{id:"minecraft:stone_button",count:1b}}


# Update visuals + clear tmp
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:entity/update
data remove storage turtlecraft:tmp switch_item
scoreboard players reset $valid_item turtlecraft.tmp
