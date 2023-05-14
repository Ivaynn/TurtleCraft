# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"


# Bane bonus: 2.5 * lvl
scoreboard players operation $damage_bane tc.tmp = $bane_lvl tc.tmp
scoreboard players operation $damage_bane tc.tmp *= #25 tc.math
