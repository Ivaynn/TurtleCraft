
# Check turtle count. If below max, increment count and new ID
execute if score $turtle_count turtlecraft.id >= max_turtle_count turtlecraft.options run scoreboard players set $cancel turtlecraft.tmp 1


# Spawn turtle or drop egg
execute unless score $cancel turtlecraft.tmp matches 1 run function turtlecraft:entity/spawn/summon/init
execute if score $cancel turtlecraft.tmp matches 1 run function turtlecraft:entity/spawn/cancel
execute if score show_warnings turtlecraft.options matches 1 if score $cancel turtlecraft.tmp matches 1 run tellraw @a ["",{"text":"WARNING: ","color":"gold"},{"text":"Maximum Turtle count reached!","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"To add more, remove some Turtles\nor increase this limit","color":"gray"}]}}]

# Clear tmp
scoreboard players reset $cancel turtlecraft.tmp
return 1