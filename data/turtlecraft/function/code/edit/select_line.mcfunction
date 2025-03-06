# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Change Selected line
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation @s turtlecraft.line /= #10 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation @s turtlecraft.line *= #10 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation @s turtlecraft.line += $argument turtlecraft.tmp


# Change Page
execute if score $argument turtlecraft.tmp matches 10 run scoreboard players set @s turtlecraft.line 1
execute if score $argument turtlecraft.tmp matches 11 run scoreboard players remove @s turtlecraft.line 10
execute if score $argument turtlecraft.tmp matches 12 run scoreboard players add @s turtlecraft.line 10
execute if score $argument turtlecraft.tmp matches 13 run scoreboard players set @s turtlecraft.line 2147483647


# Verify limits
execute if score @s turtlecraft.line matches ..0 run scoreboard players set @s turtlecraft.line 1
