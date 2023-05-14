
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box
scoreboard players set $egg_item_count tc.tmp 1
loot insert 10028 0 10028 loot tc:egg
scoreboard players reset $egg_item_count tc.tmp

data modify block 10028 0 10028 Items[0].tag.display.Name set from storage tc:tmp new_turtle.Name
data modify block 10028 0 10028 Items[0].tag.EntityTag.data.Instructions set from storage tc:tmp new_turtle.Instructions
data modify block 10028 0 10028 Items[0].tag.EntityTag.data.Fuel set from storage tc:tmp new_turtle.Fuel

loot spawn ~ ~0.25 ~ mine 10028 0 10028 minecraft:air{drop_contents:1b}
setblock 10028 0 10028 minecraft:bedrock
