# Executed by a new arrow/snowball/egg/... All turtle entities have "turtlecraft.tmp"


# launch_strength turtlecraft.options = 150 by default
data merge entity @s {pickup:1b, HasBeenShot:1b}
execute unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:entity.arrow.shoot neutral @a ~ ~ ~ 1 1

# Launch Up (+Y)
execute store success score $launch_direction turtlecraft.tmp if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} store result entity @s Motion[1] double 0.01 run scoreboard players get launch_strength turtlecraft.options

# Launch Down (-Y)
execute unless score $launch_direction turtlecraft.tmp matches 1 store success score $launch_direction turtlecraft.tmp if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} store result entity @s Motion[1] double -0.01 run scoreboard players get launch_strength turtlecraft.options

# Launch East (+X)
execute unless score $launch_direction turtlecraft.tmp matches 1 store success score $launch_direction turtlecraft.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] positioned ~1 ~1 ~ if entity @s[distance=..1] store result entity @s Motion[0] double 0.01 run scoreboard players get launch_strength turtlecraft.options

# Launch West (-X)
execute unless score $launch_direction turtlecraft.tmp matches 1 store success score $launch_direction turtlecraft.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] positioned ~-1 ~1 ~ if entity @s[distance=..1] store result entity @s Motion[0] double -0.01 run scoreboard players get launch_strength turtlecraft.options

# Launch South (+Z)
execute unless score $launch_direction turtlecraft.tmp matches 1 store success score $launch_direction turtlecraft.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] positioned ~ ~1 ~1 if entity @s[distance=..1] store result entity @s Motion[2] double 0.01 run scoreboard players get launch_strength turtlecraft.options

# Launch North (-Z)
execute unless score $launch_direction turtlecraft.tmp matches 1 store success score $launch_direction turtlecraft.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] positioned ~ ~1 ~-1 if entity @s[distance=..1] store result entity @s Motion[2] double -0.01 run scoreboard players get launch_strength turtlecraft.options


# Clear tmp
scoreboard players reset $launch_direction turtlecraft.tmp
return 1
