# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"


# Fire duration: 80 ticks per level
scoreboard players operation $fire_duration tc.tmp = $fire_lvl tc.tmp
scoreboard players operation $fire_duration tc.tmp *= #80 tc.math
