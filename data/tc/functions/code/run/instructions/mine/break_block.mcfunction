# Break block at this position, with the break animation but without dropping any items
execute store result score $rule_tiledrop tc.tmp run gamerule doTileDrops
gamerule doTileDrops false
setblock ~ ~ ~ minecraft:air destroy
execute if score $rule_tiledrop tc.tmp matches 1 run gamerule doTileDrops true
scoreboard players reset $rule_tiledrop tc.tmp