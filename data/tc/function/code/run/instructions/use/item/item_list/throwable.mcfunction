# Executed by a new arrow/snowball/egg/... All turtle entities have "tc.tmp"


# launch_strength tc.options = 150 by default
data merge entity @s {pickup:1b, HasBeenShot:1b}
playsound minecraft:entity.arrow.shoot neutral @a ~ ~ ~ 1 1

# Launch Up (+Y)
execute store success score $launch_direction tc.tmp if data storage tc:tmp {run_line:{A:{direction:"up"}}} store result entity @s Motion[1] double 0.01 run scoreboard players get launch_strength tc.options

# Launch Down (-Y)
execute unless score $launch_direction tc.tmp matches 1 store success score $launch_direction tc.tmp if data storage tc:tmp {run_line:{A:{direction:"down"}}} store result entity @s Motion[1] double -0.01 run scoreboard players get launch_strength tc.options

# Launch East (+X)
execute unless score $launch_direction tc.tmp matches 1 store success score $launch_direction tc.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] positioned ~1 ~1 ~ if entity @s[distance=..1] store result entity @s Motion[0] double 0.01 run scoreboard players get launch_strength tc.options

# Launch West (-X)
execute unless score $launch_direction tc.tmp matches 1 store success score $launch_direction tc.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] positioned ~-1 ~1 ~ if entity @s[distance=..1] store result entity @s Motion[0] double -0.01 run scoreboard players get launch_strength tc.options

# Launch South (+Z)
execute unless score $launch_direction tc.tmp matches 1 store success score $launch_direction tc.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] positioned ~ ~1 ~1 if entity @s[distance=..1] store result entity @s Motion[2] double 0.01 run scoreboard players get launch_strength tc.options

# Launch North (-Z)
execute unless score $launch_direction tc.tmp matches 1 store success score $launch_direction tc.tmp at @e[distance=..4,limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] positioned ~ ~1 ~-1 if entity @s[distance=..1] store result entity @s Motion[2] double -0.01 run scoreboard players get launch_strength tc.options


# Clear tmp
scoreboard players reset $launch_direction tc.tmp
return 1
