
# Generate a random number between 0 and 65535 (2^16)
execute store result score $counter_operator turtlecraft.tmp run random value 0..65535


# Get range from instruction line (must be between 1 and 128)
execute store result score $random_range turtlecraft.tmp run data get storage turtlecraft:tmp run_line.A.value
execute unless score $random_range turtlecraft.tmp matches 1.. run scoreboard players set $random_range turtlecraft.tmp 1
execute if score $random_range turtlecraft.tmp matches 129.. run scoreboard players set $random_range turtlecraft.tmp 128


# Convert random number to fit in the range (from 1 to $random_range)
scoreboard players set $random_2e16 turtlecraft.tmp 65536
scoreboard players operation $counter_operator turtlecraft.tmp *= $random_range turtlecraft.tmp
scoreboard players operation $counter_operator turtlecraft.tmp /= $random_2e16 turtlecraft.tmp
scoreboard players add $counter_operator turtlecraft.tmp 1


# Clear tmp
scoreboard players reset $random_range turtlecraft.tmp
scoreboard players reset $random_2e16 turtlecraft.tmp
