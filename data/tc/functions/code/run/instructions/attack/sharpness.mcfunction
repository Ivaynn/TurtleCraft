# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"


# Sharpness bonus: [ 0.5 * max(0, lvl - 1) + 1 ] * 10
scoreboard players operation $damage_sharp tc.tmp = $sharp_lvl tc.tmp
execute if score $damage_sharp tc.tmp matches 1.. run scoreboard players remove $damage_sharp tc.tmp 1
scoreboard players operation $damage_sharp tc.tmp *= #10 tc.math
scoreboard players operation $damage_sharp tc.tmp /= #2 tc.math
scoreboard players add $damage_sharp tc.tmp 10
