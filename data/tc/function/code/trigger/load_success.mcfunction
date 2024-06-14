# Function triggered by a player

tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Imported instructions to disc!\n","color":"gray"}]

data modify storage tc:tmp item.components."minecraft:custom_data".tc.TurtleDisc set value 1b
data modify storage tc:tmp item.tag.HideFlags set value 127
data modify storage tc:tmp item.tag.Enchantments set value [{}]
data modify storage tc:tmp item.tag.display.Lore set value ['{"text":"Turtle Disc","color":"dark_aqua","italic":false}']


# Replace item in player's hands with item from storage
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp item
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
