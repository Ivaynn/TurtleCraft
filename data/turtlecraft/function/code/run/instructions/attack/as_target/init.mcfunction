# Executed by attack target. All turtle entities have "turtlecraft.tmp"

scoreboard players add $target_count turtlecraft.tmp 1


# Get damage bonus for special cases
execute if predicate turtlecraft:is_undead run scoreboard players operation $damage turtlecraft.tmp += $damage_smite turtlecraft.tmp
execute if predicate turtlecraft:is_arthropod run scoreboard players operation $damage turtlecraft.tmp += $damage_bane turtlecraft.tmp


# Fire aspect
execute if score $fire_duration turtlecraft.tmp matches 1.. store result entity @s Fire short 1 run scoreboard players get $fire_duration turtlecraft.tmp


# Deal damage, up to 100 (50 hearts)
execute if score $damage turtlecraft.tmp matches 1..100 run function turtlecraft:code/run/instructions/attack/as_target/d10
execute if score $damage turtlecraft.tmp matches 101..200 run function turtlecraft:code/run/instructions/attack/as_target/d20
execute if score $damage turtlecraft.tmp matches 201..300 run function turtlecraft:code/run/instructions/attack/as_target/d30
execute if score $damage turtlecraft.tmp matches 301..400 run function turtlecraft:code/run/instructions/attack/as_target/d40
execute if score $damage turtlecraft.tmp matches 401..500 run function turtlecraft:code/run/instructions/attack/as_target/d50
execute if score $damage turtlecraft.tmp matches 501..600 run function turtlecraft:code/run/instructions/attack/as_target/d60
execute if score $damage turtlecraft.tmp matches 601..700 run function turtlecraft:code/run/instructions/attack/as_target/d70
execute if score $damage turtlecraft.tmp matches 701..800 run function turtlecraft:code/run/instructions/attack/as_target/d80
execute if score $damage turtlecraft.tmp matches 801..900 run function turtlecraft:code/run/instructions/attack/as_target/d90
execute if score $damage turtlecraft.tmp matches 901..1000 run function turtlecraft:code/run/instructions/attack/as_target/d100
execute if score $damage turtlecraft.tmp matches 1001.. run damage @s 100.0 minecraft:generic
