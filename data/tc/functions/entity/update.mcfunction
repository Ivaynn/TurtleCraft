# Executed by tc.body - all attached entities have "tc.tmp"

# Reset nbt
execute unless data entity @s {Fire:0s} run playsound minecraft:entity.generic.extinguish_fire neutral @a ~ ~ ~ 1 1
data modify entity @s Fire set value 0s


# Refresh effects
effect give @s minecraft:invisibility infinite 255 true
effect give @s minecraft:resistance infinite 255 true
effect give @s minecraft:regeneration infinite 255 true
effect give @s minecraft:fire_resistance infinite 255 true


# Make sure turtle is on grid
execute at @s align xyz run tp @s ~0.5 ~ ~0.5 ~ 0
execute store result score $angle tc.tmp run data get entity @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] Rotation[0]
scoreboard players operation $angle tc.tmp %= #90 tc.math
execute unless score $angle tc.tmp matches 0 run data modify entity @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] Rotation[0] set value 0f
data modify entity @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] Rotation[1] set value 0f


# Show errors
scoreboard players operation $text_id tc.tmp = @s tc.msg
execute as @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] run function tc:entity/update_text


# Teleport attached entities
ride @s mount @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base]
tp @e[limit=4,type=#tc:turtle_parts,tag=tc.tmp,tag=!tc.base] @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base]
execute at @s align xyz positioned ~0.5 ~1.5 ~0.5 run tp @e[limit=1,type=minecraft:item_display,tag=tc.tmp,tag=tc.item] ~ ~ ~ ~ 0
execute at @s align xyz positioned ~0.5 ~1.5 ~0.5 run tp @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.block] ~ ~ ~ ~ 0
execute at @s run tp @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] ~ ~1.9 ~ ~ 90


# Clear tmp
scoreboard players reset $angle tc.tmp
scoreboard players reset $text_id tc.tmp
