# Executed by player - all turtle entities have "tc.tmp"


# Remove tag from held item
setblock 10028 0 10028 minecraft:yellow_shulker_box
item replace block 10028 0 10028 container.0 from entity @s weapon.mainhand
data modify storage tc:tmp disc_name set from block 10028 0 10028 Items[0].tag.display.Name
data remove block 10028 0 10028 Items[0].tag
data modify block 10028 0 10028 Items[0].tag.display.Name set from storage tc:tmp disc_name
loot replace entity @s weapon.mainhand 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

 
# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp disc_name
