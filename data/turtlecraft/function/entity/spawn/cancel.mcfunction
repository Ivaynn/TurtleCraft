
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 loot turtlecraft:egg

data modify block 10028 0 10028 Items[0].components."minecraft:custom_name" set from storage turtlecraft:tmp new_turtle.Name
data modify block 10028 0 10028 Items[0].components."minecraft:entity_data".data.turtlecraft.Instructions set from storage turtlecraft:tmp new_turtle.Instructions
data modify block 10028 0 10028 Items[0].components."minecraft:entity_data".data.turtlecraft.Fuel set from storage turtlecraft:tmp new_turtle.Fuel

loot spawn ~ ~0.25 ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
setblock 10028 0 10028 minecraft:bedrock
