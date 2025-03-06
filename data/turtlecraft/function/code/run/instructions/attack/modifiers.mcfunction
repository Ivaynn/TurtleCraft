# This function ignores every attribute that isn't "attack_damage"

# Get operation and amount (scaled 100 for accuracy)
data modify storage turtlecraft:tmp attribute_op set from storage turtlecraft:tmp tool.components."minecraft:attribute_modifiers".modifiers.[{type:"minecraft:attack_damage"}].operation
execute if data storage turtlecraft:tmp {attribute_op:"add_value"} run scoreboard players set $mod_operation turtlecraft.tmp 0
execute if data storage turtlecraft:tmp {attribute_op:"add_multiplied_base"} run scoreboard players set $mod_operation turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {attribute_op:"add_multiplied_total"} run scoreboard players set $mod_operation turtlecraft.tmp 2
execute store result score $mod_amount turtlecraft.tmp run data get storage turtlecraft:tmp tool.components."minecraft:attribute_modifiers".modifiers.[{type:"minecraft:attack_damage"}].amount 100


# 0 - Add
# Total = Base + Amount
execute if score $mod_operation turtlecraft.tmp matches 0 run scoreboard players operation $damage turtlecraft.tmp = $mod_amount turtlecraft.tmp
execute if score $mod_operation turtlecraft.tmp matches 0 run scoreboard players operation $damage turtlecraft.tmp /= #10 turtlecraft.math
execute if score $mod_operation turtlecraft.tmp matches 0 run scoreboard players add $damage turtlecraft.tmp 10


# 1/2 - Multiply (additive or multiplicative does the same in this case)
# Total = Base * (Amount + 1)
execute if score $mod_operation turtlecraft.tmp matches 1..2 run scoreboard players set $damage turtlecraft.tmp 10
execute if score $mod_operation turtlecraft.tmp matches 1..2 run scoreboard players add $mod_amount turtlecraft.tmp 100
execute if score $mod_operation turtlecraft.tmp matches 1..2 run scoreboard players operation $damage turtlecraft.tmp *= $mod_amount turtlecraft.tmp
execute if score $mod_operation turtlecraft.tmp matches 1..2 run scoreboard players operation $damage turtlecraft.tmp /= #100 turtlecraft.math


# Clear tmp
scoreboard players reset $mod_operation turtlecraft.tmp
scoreboard players reset $mod_amount turtlecraft.tmp
data remove storage turtlecraft:tmp attribute_op
