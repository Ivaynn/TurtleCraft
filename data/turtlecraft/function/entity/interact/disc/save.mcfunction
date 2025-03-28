# Executed by player - all turtle entities have "turtlecraft.tmp"

advancement grant @s only turtlecraft:save_to_disc


# Save item to storage and modify it there for performance - add instructions
data modify storage turtlecraft:tmp item set from entity @s SelectedItem
data modify storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.TurtleDisc set value 1b
data modify storage turtlecraft:tmp item.components."minecraft:enchantment_glint_override" set value true
data modify storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions
data modify storage turtlecraft:tmp item.components."minecraft:lore" set value [{"text":""},{"text":"Contains Instructions","color":"gray","italic":true}]
data modify storage turtlecraft:tmp item.components."minecraft:item_name" set value {"text":"Turtle Disc"}
data modify storage turtlecraft:tmp item.components."minecraft:rarity" set value "epic"


# Replace item in player's hands with item from storage
setblock 10028 0 10028 minecraft:yellow_shulker_box
item replace block 10028 0 10028 container.0 with minecraft:stone
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp item
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp item
