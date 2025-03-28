# Function triggered by a player

tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Imported instructions to disc!\n","color":"gray"}]

data modify storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.TurtleDisc set value 1b
data modify storage turtlecraft:tmp item.components."minecraft:enchantment_glint_override" set value true
data modify storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions
data modify storage turtlecraft:tmp item.components."minecraft:lore" set value [{"text":""},{"text":"Contains Instructions","color":"gray","italic":true}]
data modify storage turtlecraft:tmp item.components."minecraft:item_name" set value {"text":"Turtle Disc"}
data modify storage turtlecraft:tmp item.components."minecraft:rarity" set value "epic"


# Replace item in player's hands with item from storage
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp item
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
