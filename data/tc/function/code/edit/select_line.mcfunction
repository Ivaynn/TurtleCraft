# Executed by the player. All turtle components have tag "tc.tmp"


# Change Selected line
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation @s tc.line /= #10 tc.math
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation @s tc.line *= #10 tc.math
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation @s tc.line += $argument tc.tmp


# Change Page
execute if score $argument tc.tmp matches 10 run scoreboard players set @s tc.line 1
execute if score $argument tc.tmp matches 11 run scoreboard players remove @s tc.line 10
execute if score $argument tc.tmp matches 12 run scoreboard players add @s tc.line 10
execute if score $argument tc.tmp matches 13 run scoreboard players set @s tc.line 2147483647


# Verify limits
execute if score @s tc.line matches ..0 run scoreboard players set @s tc.line 1
