
# Check turtle count. If below max, increment count and new ID
execute if score $turtle_count tc.id >= max_turtle_count tc.options run scoreboard players set $cancel tc.tmp 1


# Spawn turtle or drop egg
execute unless score $cancel tc.tmp matches 1 run function tc:entity/spawn/summon/init
execute if score $cancel tc.tmp matches 1 run function tc:entity/spawn/cancel
execute if score show_warnings tc.options matches 1 if score $cancel tc.tmp matches 1 run tellraw @a ["",{"text":"WARNING: ","color":"gold"},{"text":"Maximum Turtle count reached!","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"To add more, remove some Turtles\nor increase this limit","color":"gray"}]}}]

# Clear tmp
scoreboard players reset $cancel tc.tmp
return 1