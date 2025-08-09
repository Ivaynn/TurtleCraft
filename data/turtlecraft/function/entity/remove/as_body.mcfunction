# Executed by turtlecraft.body. All turtle components have tag "turtlecraft.tmp"

# Drop: Inventory
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[]}
data modify block 10028 0 10028 Items set from entity @s Items

# Drop: Held item
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
execute if predicate turtlecraft:holding_equipment run data remove entity @s equipment.mainhand.components."minecraft:custom_data".turtlecraft
execute unless predicate turtlecraft:holding_equipment run data remove entity @s equipment.mainhand
execute if data entity @s equipment.mainhand.id run data modify block 10028 1 10028 Items[0] set from entity @s equipment.mainhand
execute if data entity @s equipment.mainhand.id run loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Drop: Egg
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[]}
loot insert 10028 1 10028 loot turtlecraft:egg
data modify block 10028 1 10028 Items[0].components."minecraft:custom_name" set from entity @s CustomName
data modify block 10028 1 10028 Items[0].components."minecraft:entity_data".data.turtlecraft.Instructions set from entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions
execute store result block 10028 1 10028 Items[0].components."minecraft:entity_data".data.turtlecraft.Fuel int 1 run scoreboard players get @s turtlecraft.fuel
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Drop: Apply
execute at @s run loot spawn ~ ~1 ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Effects
execute at @s run particle minecraft:explosion ~ ~1.5 ~ 0 0 0 0 0 force @a


# Clear entity data
data merge entity @s {DeathLootTable:"turtlecraft:empty",ChestedHorse:0b}
data remove entity @s equipment
data remove entity @s CustomName


# Teleport llama away
execute as @s on passengers if entity @s[type=minecraft:player] run ride @s dismount
execute at @s run tp @s ~ ~-1000 ~


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
