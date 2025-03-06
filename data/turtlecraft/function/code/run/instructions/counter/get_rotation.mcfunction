
execute store result score $counter_operator turtlecraft.tmp run data get entity @s Rotation[0] 1
scoreboard players add $counter_operator turtlecraft.tmp 180

# North (0)
execute if score $counter_operator turtlecraft.tmp matches ..45 run return run scoreboard players set $counter_operator turtlecraft.tmp 0
execute if score $counter_operator turtlecraft.tmp matches 315.. run return run scoreboard players set $counter_operator turtlecraft.tmp 0

# East (1)
execute if score $counter_operator turtlecraft.tmp matches 45..135 run return run scoreboard players set $counter_operator turtlecraft.tmp 1

# South (2)
execute if score $counter_operator turtlecraft.tmp matches 135..225 run return run scoreboard players set $counter_operator turtlecraft.tmp 2

# West (3)
execute if score $counter_operator turtlecraft.tmp matches 225..315 run return run scoreboard players set $counter_operator turtlecraft.tmp 3
