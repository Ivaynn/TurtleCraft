# Executed by tc.body at attack block coordinates. All turtle entities have "tc.tmp"

execute if score $chunk_loaded tc.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded tc.tmp 0
execute if score $chunk_loaded tc.tmp matches 0 run return 0

# Get Attack Damage from weapon
scoreboard players set $damage tc.tmp 10
execute if predicate tc:holding_equipment run function tc:code/run/instructions/attack/get_tool_damage


# Deal damage
execute if score $damage_players tc.tmp matches 1 as @e[distance=..1.25,type=!minecraft:item,tag=!tc.turtle] run function tc:code/run/instructions/attack/as_target/init
execute if score $damage_players tc.tmp matches 0 as @e[distance=..1.25,type=!minecraft:item,type=!minecraft:player,tag=!tc.turtle] run function tc:code/run/instructions/attack/as_target/init


# Sounds
particle minecraft:sweep_attack ~ ~0.5 ~ 0 0 0 0 0 force @a
execute unless score $silent tc.tmp matches 1 unless score $target_count tc.tmp matches 1.. run playsound minecraft:entity.player.attack.nodamage neutral @a ~ ~0.5 ~ 1 1.15
execute unless score $silent tc.tmp matches 1 if score $target_count tc.tmp matches 1.. if score $damage tc.tmp matches ..10 run playsound minecraft:entity.player.attack.strong neutral @a ~ ~0.5 ~ 1 1.15
execute unless score $silent tc.tmp matches 1 if score $target_count tc.tmp matches 1.. if score $damage tc.tmp matches 11..99 run playsound minecraft:entity.player.attack.strong neutral @a ~ ~0.5 ~ 1 0.9
execute unless score $silent tc.tmp matches 1 if score $target_count tc.tmp matches 1.. if score $damage tc.tmp matches 100.. run playsound minecraft:entity.player.attack.crit neutral @a ~ ~0.5 ~ 1 1


# Clear tmp
scoreboard players reset $damage tc.tmp
scoreboard players reset $damage_smite tc.tmp
scoreboard players reset $damage_bane tc.tmp
scoreboard players reset $fire_duration tc.tmp
scoreboard players reset $target_count tc.tmp
