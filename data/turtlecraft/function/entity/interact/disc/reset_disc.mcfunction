# Executed by player - all turtle entities have "turtlecraft.tmp"


# Remove tag from held item
setblock 10028 0 10028 minecraft:yellow_shulker_box
item replace block 10028 0 10028 container.0 from entity @s weapon.mainhand
data remove block 10028 0 10028 Items[0].components."minecraft:custom_data"
data remove block 10028 0 10028 Items[0].components."minecraft:enchantment_glint_override"
data remove block 10028 0 10028 Items[0].components."minecraft:lore"
data remove block 10028 0 10028 Items[0].components."minecraft:item_name"
data remove block 10028 0 10028 Items[0].components."minecraft:rarity"
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

 
# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp disc_name
