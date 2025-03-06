# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Make integer posivite - store original signal
scoreboard players set $negative turtlecraft.tmp 0
execute if score $new_value turtlecraft.tmp matches ..-1 run scoreboard players set $negative turtlecraft.tmp 1
execute if score $negative turtlecraft.tmp matches 1 run scoreboard players operation $new_value turtlecraft.tmp *= #_1 turtlecraft.math 


# Add number 0-9
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation $new_value turtlecraft.tmp *= #10 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation $new_value turtlecraft.tmp += $argument turtlecraft.tmp


# Check if there was an overflow
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation $test_value turtlecraft.tmp = $new_value turtlecraft.tmp
execute if score $argument turtlecraft.tmp matches 0..9 run scoreboard players operation $test_value turtlecraft.tmp /= #10 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 0..9 if score $negative turtlecraft.tmp matches 1 run scoreboard players operation $test_value turtlecraft.tmp *= #_1 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 0..9 unless score $test_value turtlecraft.tmp = $original_value turtlecraft.tmp run return -1


# Backspace (89) and Invert signal (88)
execute if score $argument turtlecraft.tmp matches 89 run scoreboard players operation $new_value turtlecraft.tmp /= #10 turtlecraft.math
execute if score $argument turtlecraft.tmp matches 88 run scoreboard players operation $new_value turtlecraft.tmp *= #_1 turtlecraft.math


# Restore original signal
execute if score $negative turtlecraft.tmp matches 1 run scoreboard players operation $new_value turtlecraft.tmp *= #_1 turtlecraft.math
return 1
