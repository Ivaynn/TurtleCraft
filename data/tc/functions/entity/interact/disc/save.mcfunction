# Executed by player - all turtle entities have "tc.tmp"

advancement grant @s only tc:save_to_disc

tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Saved Instructions and Options to Disc!\n","color":"gray"}]


# Save item to storage and modify it there for performance - add instructions
data modify storage tc:tmp item set from entity @s SelectedItem
data modify storage tc:tmp item.tag.TurtleDisc set value 1b
data modify storage tc:tmp item.tag.HideFlags set value 127
data modify storage tc:tmp item.tag.Enchantments set value [{}]
data modify storage tc:tmp item.tag.Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Instructions
data modify storage tc:tmp item.tag.display.Lore set value ['{"text":"Turtle Disc","color":"dark_aqua","italic":false}']


# Replace item in player's hands with item from storage
setblock 10028 0 10028 minecraft:yellow_shulker_box
item replace block 10028 0 10028 container.0 with minecraft:stone
data modify block 10028 0 10028 Items[0] set from storage tc:tmp item
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp item
