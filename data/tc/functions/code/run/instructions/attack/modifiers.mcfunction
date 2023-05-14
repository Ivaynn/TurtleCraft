# This function ignores every attribute that isn't "generic.attack_damage"

# Get operation and amount (scaled 100 for accuracy)
execute store result score $mod_operation tc.tmp run data get storage tc:tmp tool.tag.AttributeModifiers[{AttributeName:"generic.attack_damage"}].Operation 1
execute store result score $mod_amount tc.tmp run data get storage tc:tmp tool.tag.AttributeModifiers[{AttributeName:"generic.attack_damage"}].Amount 100


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
