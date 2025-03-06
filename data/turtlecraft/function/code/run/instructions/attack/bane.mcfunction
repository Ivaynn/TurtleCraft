# Executed by turtlecraft.body at attack block coordinates. All turtle entities have "turtlecraft.tmp"


# Bane bonus: 2.5 * lvl
scoreboard players operation $damage_bane turtlecraft.tmp = $bane_lvl turtlecraft.tmp
scoreboard players operation $damage_bane turtlecraft.tmp *= #25 turtlecraft.math
