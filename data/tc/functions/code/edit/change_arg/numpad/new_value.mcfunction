# Executed by the player. All turtle components have tag "tc.tmp"


# Make integer posivite - store original signal
scoreboard players set $negative tc.tmp 0
execute if score $new_value tc.tmp matches ..-1 run scoreboard players set $negative tc.tmp 1
execute if score $negative tc.tmp matches 1 run scoreboard players operation $new_value tc.tmp *= #_1 tc.math 


# Add number 0-9
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation $new_value tc.tmp *= #10 tc.math
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation $new_value tc.tmp += $argument tc.tmp


# Check if there was an overflow
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation $test_value tc.tmp = $new_value tc.tmp
execute if score $argument tc.tmp matches 0..9 run scoreboard players operation $test_value tc.tmp /= #10 tc.math
execute if score $argument tc.tmp matches 0..9 if score $negative tc.tmp matches 1 run scoreboard players operation $test_value tc.tmp *= #_1 tc.math
execute if score $argument tc.tmp matches 0..9 unless score $test_value tc.tmp = $original_value tc.tmp run return -1


# Backspace (89) and Invert signal (88)
execute if score $argument tc.tmp matches 89 run scoreboard players operation $new_value tc.tmp /= #10 tc.math
execute if score $argument tc.tmp matches 88 run scoreboard players operation $new_value tc.tmp *= #_1 tc.math


# Restore original signal
execute if score $negative tc.tmp matches 1 run scoreboard players operation $new_value tc.tmp *= #_1 tc.math
