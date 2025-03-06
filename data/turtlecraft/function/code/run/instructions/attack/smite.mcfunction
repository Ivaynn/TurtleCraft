# Executed by turtlecraft.body at attack block coordinates. All turtle entities have "turtlecraft.tmp"


# Smite bonus: 2.5 * lvl
scoreboard players operation $damage_smite turtlecraft.tmp = $smite_lvl turtlecraft.tmp
scoreboard players operation $damage_smite turtlecraft.tmp *= #25 turtlecraft.math
