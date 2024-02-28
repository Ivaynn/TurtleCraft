
# Generate a random number between 0 and 65535 (2^16)
execute store result score $counter_operator tc.tmp run random value 0..65535


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
