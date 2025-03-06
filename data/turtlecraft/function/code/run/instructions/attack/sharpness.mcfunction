# Executed by turtlecraft.body at attack block coordinates. All turtle entities have "turtlecraft.tmp"


# Sharpness bonus: [ 0.5 * max(0, lvl - 1) + 1 ] * 10
scoreboard players operation $damage_sharp turtlecraft.tmp = $sharp_lvl turtlecraft.tmp
execute if score $damage_sharp turtlecraft.tmp matches 1.. run scoreboard players remove $damage_sharp turtlecraft.tmp 1
scoreboard players operation $damage_sharp turtlecraft.tmp *= #10 turtlecraft.math
scoreboard players operation $damage_sharp turtlecraft.tmp /= #2 turtlecraft.math
scoreboard players add $damage_sharp turtlecraft.tmp 10
