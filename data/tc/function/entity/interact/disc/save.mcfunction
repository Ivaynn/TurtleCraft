# Executed by player - all turtle entities have "tc.tmp"

advancement grant @s only tc:save_to_disc


# Save item to storage and modify it there for performance - add instructions
data modify storage tc:tmp item set from entity @s SelectedItem
data modify storage tc:tmp item.components."minecraft:custom_data".tc.TurtleDisc set value 1b
data modify storage tc:tmp item.components."minecraft:enchantment_glint_override" set value true
data modify storage tc:tmp item.components."minecraft:custom_data".tc.Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions
data modify storage tc:tmp item.components."minecraft:lore" set value ['{"text":""}','{"text":"Contains Instructions","color":"gray","italic":true}']
data modify storage tc:tmp item.components."minecraft:item_name" set value '{"text":"Turtle Disc"}'
data modify storage tc:tmp item.components."minecraft:rarity" set value "epic"


# Replace item in player's hands with item from storage
setblock 10028 0 10028 minecraft:yellow_shulker_box
item replace block 10028 0 10028 container.0 with minecraft:stone
data modify block 10028 0 10028 Items[0] set from storage tc:tmp item
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp item
