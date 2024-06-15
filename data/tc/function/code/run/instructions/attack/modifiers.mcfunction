# This function ignores every attribute that isn't "generic.attack_damage"

# Get operation and amount (scaled 100 for accuracy)
data modify storage tc:tmp attribute_op set from storage tc:tmp tool.components."minecraft:attribute_modifiers".modifiers.[{type:"minecraft:generic.attack_damage"}].operation
execute if data storage tc:tmp {attribute_op:"add_value"} run scoreboard players set $mod_operation tc.tmp 0
execute if data storage tc:tmp {attribute_op:"add_multiplied_base"} run scoreboard players set $mod_operation tc.tmp 1
execute if data storage tc:tmp {attribute_op:"add_multiplied_total"} run scoreboard players set $mod_operation tc.tmp 2
execute store result score $mod_amount tc.tmp run data get storage tc:tmp tool.components."minecraft:attribute_modifiers".modifiers.[{type:"minecraft:generic.attack_damage"}].amount 100


# 0 - Add
# Total = Base + Amount
execute if score $mod_operation tc.tmp matches 0 run scoreboard players operation $damage tc.tmp = $mod_amount tc.tmp
execute if score $mod_operation tc.tmp matches 0 run scoreboard players operation $damage tc.tmp /= #10 tc.math
execute if score $mod_operation tc.tmp matches 0 run scoreboard players add $damage tc.tmp 10


# 1/2 - Multiply (additive or multiplicative does the same in this case)
# Total = Base * (Amount + 1)
execute if score $mod_operation tc.tmp matches 1..2 run scoreboard players set $damage tc.tmp 10
execute if score $mod_operation tc.tmp matches 1..2 run scoreboard players add $mod_amount tc.tmp 100
execute if score $mod_operation tc.tmp matches 1..2 run scoreboard players operation $damage tc.tmp *= $mod_amount tc.tmp
execute if score $mod_operation tc.tmp matches 1..2 run scoreboard players operation $damage tc.tmp /= #100 tc.math


# Clear tmp
scoreboard players reset $mod_operation tc.tmp
scoreboard players reset $mod_amount tc.tmp
data remove storage tc:tmp attribute_op
