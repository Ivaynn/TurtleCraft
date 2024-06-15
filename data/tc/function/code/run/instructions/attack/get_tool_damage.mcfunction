# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"

data modify storage tc:tmp tool set from entity @s HandItems[0]


# Base damage / Attribute Modifier
execute unless data storage tc:tmp tool.components."minecraft:attribute_modifiers" run function tc:code/run/instructions/attack/base_damage
execute if data storage tc:tmp tool.components."minecraft:attribute_modifiers" run function tc:code/run/instructions/attack/modifiers


# Get enchantments
execute store result score $sharp_lvl tc.tmp run data get storage tc:tmp tool.components."minecraft:enchantments".levels."minecraft:sharpness"
execute store result score $smite_lvl tc.tmp run data get storage tc:tmp tool.components."minecraft:enchantments".levels."minecraft:smite"
execute store result score $bane_lvl tc.tmp run data get storage tc:tmp tool.components."minecraft:enchantments".levels."minecraft:bane_of_arthropods"
execute store result score $fire_lvl tc.tmp run data get storage tc:tmp tool.components."minecraft:enchantments".levels."minecraft:fire_aspect"


# Apply modifiers from enchantments
execute if score $sharp_lvl tc.tmp matches 1.. run function tc:code/run/instructions/attack/sharpness
execute if score $smite_lvl tc.tmp matches 1.. run function tc:code/run/instructions/attack/smite
execute if score $bane_lvl tc.tmp matches 1.. run function tc:code/run/instructions/attack/bane
execute if score $fire_lvl tc.tmp matches 1.. run function tc:code/run/instructions/attack/fire
scoreboard players operation $damage tc.tmp += $damage_sharp tc.tmp


# Clear tmp
data remove storage tc:tmp tool
scoreboard players reset $sharp_lvl tc.tmp
scoreboard players reset $smite_lvl tc.tmp
scoreboard players reset $bane_lvl tc.tmp
scoreboard players reset $fire_lvl tc.tmp
scoreboard players reset $damage_sharp tc.tmp
