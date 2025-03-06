# Executed by turtlecraft.body at attack block coordinates. All turtle entities have "turtlecraft.tmp"

data modify storage turtlecraft:tmp tool set from entity @s HandItems[0]


# Base damage / Attribute Modifier
execute unless data storage turtlecraft:tmp tool.components."minecraft:attribute_modifiers" run function turtlecraft:code/run/instructions/attack/base_damage
execute if data storage turtlecraft:tmp tool.components."minecraft:attribute_modifiers" run function turtlecraft:code/run/instructions/attack/modifiers


# Get enchantments
execute store result score $sharp_lvl turtlecraft.tmp run data get storage turtlecraft:tmp tool.components."minecraft:enchantments".levels."minecraft:sharpness"
execute store result score $smite_lvl turtlecraft.tmp run data get storage turtlecraft:tmp tool.components."minecraft:enchantments".levels."minecraft:smite"
execute store result score $bane_lvl turtlecraft.tmp run data get storage turtlecraft:tmp tool.components."minecraft:enchantments".levels."minecraft:bane_of_arthropods"
execute store result score $fire_lvl turtlecraft.tmp run data get storage turtlecraft:tmp tool.components."minecraft:enchantments".levels."minecraft:fire_aspect"


# Apply modifiers from enchantments
execute if score $sharp_lvl turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/attack/sharpness
execute if score $smite_lvl turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/attack/smite
execute if score $bane_lvl turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/attack/bane
execute if score $fire_lvl turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/attack/fire
scoreboard players operation $damage turtlecraft.tmp += $damage_sharp turtlecraft.tmp


# Clear tmp
data remove storage turtlecraft:tmp tool
scoreboard players reset $sharp_lvl turtlecraft.tmp
scoreboard players reset $smite_lvl turtlecraft.tmp
scoreboard players reset $bane_lvl turtlecraft.tmp
scoreboard players reset $fire_lvl turtlecraft.tmp
scoreboard players reset $damage_sharp turtlecraft.tmp
