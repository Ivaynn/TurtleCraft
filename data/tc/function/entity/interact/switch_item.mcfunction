# Executed by player who is interacting - all turtle parts have tag "tc.tmp"

advancement grant @s only tc:equip

# Store player's selected item
data modify storage tc:tmp switch_item set from entity @s SelectedItem
data modify storage tc:tmp switch_item.components."minecraft:custom_data".tc.ClearItem set value 1b


# Give llama's item to player
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] if predicate tc:holding_equipment run data remove entity @s HandItems[0].components."minecraft:custom_data".tc
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] unless predicate tc:holding_equipment run data remove entity @s HandItems[0]
item replace entity @s weapon.mainhand from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] weapon


# Give stored item to llama
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] HandItems[0] set from storage tc:tmp switch_item


# Empty item
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] unless data entity @s HandItems[0].id run function tc:entity/empty_item_slot


# Update visual item
data modify entity @e[limit=1,type=minecraft:item_display,tag=tc.tmp,tag=tc.item] item set from storage tc:tmp switch_item


# Update visuals + clear tmp
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:entity/update
data remove storage tc:tmp switch_item
