
# Store marker data + remove marker
data modify storage tc:tmp new_turtle set from entity @s data
data modify storage tc:tmp new_turtle.Name set from entity @s CustomName
kill @s[type=minecraft:marker,tag=tc.egg]


# If spawn position is valid, continue
execute if score #run tc.options matches 1 store success score $valid_pos tc.tmp align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #tc:no_hitbox run function tc:entity/spawn/check_id
execute if score #run tc.options matches 1 unless score $valid_pos tc.tmp matches 1 store success score $valid_pos tc.tmp align xyz positioned ~0.5 ~1 ~0.5 if block ~ ~ ~ #tc:no_hitbox run function tc:entity/spawn/check_id
execute if score #run tc.options matches 1 unless score $valid_pos tc.tmp matches 1 align xyz positioned ~0.5 ~ ~0.5 run function tc:entity/spawn/cancel


# Clear tmp
data remove storage tc:tmp new_turtle
scoreboard players reset $valid_pos tc.tmp
