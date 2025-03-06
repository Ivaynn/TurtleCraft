# Break block at this position, with the break animation but without dropping any items
execute store result score $rule_tiledrop turtlecraft.tmp run gamerule doTileDrops
gamerule doTileDrops false
setblock ~ ~ ~ minecraft:air destroy
execute if score $rule_tiledrop turtlecraft.tmp matches 1 run gamerule doTileDrops true
scoreboard players reset $rule_tiledrop turtlecraft.tmp