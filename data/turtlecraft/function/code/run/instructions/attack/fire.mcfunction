# Executed by turtlecraft.body at attack block coordinates. All turtle entities have "turtlecraft.tmp"


# Fire duration: 80 ticks per level
scoreboard players operation $fire_duration turtlecraft.tmp = $fire_lvl turtlecraft.tmp
scoreboard players operation $fire_duration turtlecraft.tmp *= #80 turtlecraft.math
