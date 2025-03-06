# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

# Reset nbt
execute store result score $silent turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Silent 1
execute unless score $silent turtlecraft.tmp matches 1 unless data entity @s {Fire:-1s} run playsound minecraft:entity.generic.extinguish_fire neutral @a ~ ~ ~ 1 1
data modify entity @s Fire set value -1s


# Refresh effects
effect give @s minecraft:invisibility infinite 255 true
effect give @s minecraft:resistance infinite 255 true
effect give @s minecraft:regeneration infinite 255 true
effect give @s minecraft:fire_resistance infinite 255 true


# Make sure turtle is on grid
execute at @s align xyz run tp @s ~0.5 ~ ~0.5 ~ 0
execute store result score $angle turtlecraft.tmp run data get entity @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] Rotation[0]
scoreboard players operation $angle turtlecraft.tmp %= #90 turtlecraft.math
execute unless score $angle turtlecraft.tmp matches 0 run data modify entity @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] Rotation[0] set value 0f
data modify entity @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] Rotation[1] set value 0f


# Show errors
scoreboard players operation $text_id turtlecraft.tmp = @s turtlecraft.msg
execute as @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] run function turtlecraft:entity/update_text


# Teleport attached entities
ride @s mount @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base]
tp @e[limit=4,type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=!turtlecraft.base] @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base]
execute at @s align xyz positioned ~0.5 ~1.5 ~0.5 run tp @e[limit=1,type=minecraft:item_display,tag=turtlecraft.tmp,tag=turtlecraft.item] ~ ~ ~ ~ 0
execute at @s align xyz positioned ~0.5 ~1.5 ~0.5 run tp @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.block] ~ ~ ~ ~ 0
execute at @s run tp @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] ~ ~1.9 ~ ~ 90


# Clear tmp
scoreboard players reset $silent turtlecraft.tmp
scoreboard players reset $angle turtlecraft.tmp
scoreboard players reset $text_id turtlecraft.tmp
