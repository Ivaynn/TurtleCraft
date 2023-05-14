
# Generate a random number between 0 and 65535 (2^16)
scoreboard players set $counter_operator tc.tmp 0
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 1
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 2
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 4
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 8
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 16
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 32
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 64
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 128
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 256
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 512
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 1024
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 2048
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 4096
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 8192
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 16384
execute if predicate tc:random_50 run scoreboard players add $counter_operator tc.tmp 32768


# Get range from instruction line (must be between 1 and 128)
execute store result score $random_range tc.tmp run data get storage tc:tmp run_line.A.value
execute unless score $random_range tc.tmp matches 1.. run scoreboard players set $random_range tc.tmp 1
execute if score $random_range tc.tmp matches 129.. run scoreboard players set $random_range tc.tmp 128


# Convert random number to fit in the range (from 1 to $random_range)
scoreboard players set $random_2e16 tc.tmp 65536
scoreboard players operation $counter_operator tc.tmp *= $random_range tc.tmp
scoreboard players operation $counter_operator tc.tmp /= $random_2e16 tc.tmp
scoreboard players add $counter_operator tc.tmp 1


# Clear tmp
scoreboard players reset $random_range tc.tmp
scoreboard players reset $random_2e16 tc.tmp
