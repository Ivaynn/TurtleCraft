# Executed by tc.body. All turtle components have tag "tc.tmp"

# Drop: Inventory
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box
data modify block 10028 0 10028 Items set from entity @s Items

# Drop: Held item
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
execute if predicate tc:holding_equipment run data remove entity @s HandItems[0].components."minecraft:custom_data".tc
execute unless predicate tc:holding_equipment run data remove entity @s HandItems[0]
data modify block 10028 1 10028 Items[0] set from entity @s HandItems[0]
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Drop: Egg
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box
loot insert 10028 1 10028 loot tc:egg
data modify block 10028 1 10028 Items[0].tag.display.Name set from entity @s CustomName
data modify block 10028 1 10028 Items[0].tag.EntityTag.data.Instructions set from entity @s ArmorItems[0].tag.Instructions
execute store result block 10028 1 10028 Items[0].tag.EntityTag.data.Fuel int 1 run scoreboard players get @s tc.fuel
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Drop: Apply
execute at @s run loot spawn ~ ~1 ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Effects
execute at @s run particle minecraft:explosion ~ ~1.5 ~ 0 0 0 0 0 force @a


# Clear entity data
data merge entity @s {DeathLootTable:"tc:empty",ChestedHorse:0b,DecorItem:{id:"minecraft:air"},HandItems:[{},{}],ArmorItems:[{},{},{},{}]}
data remove entity @s CustomName


# Teleport llama away
execute as @s on passengers if entity @s[type=minecraft:player] run ride @s dismount
execute at @s run tp @s ~ ~-1000 ~


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
