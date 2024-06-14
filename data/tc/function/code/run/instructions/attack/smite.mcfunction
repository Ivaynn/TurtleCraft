# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"


# Smite bonus: 2.5 * lvl
scoreboard players operation $damage_smite tc.tmp = $smite_lvl tc.tmp
scoreboard players operation $damage_smite tc.tmp *= #25 tc.math
