# Executed by tc.body - all attached entities have "tc.tmp"


scoreboard players set @s tc.line 0
scoreboard players reset @s tc.timer

tag @s remove tc.breakpoint

execute store result score $silent tc.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].Silent 1
execute store result score $sound_line tc.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions
execute unless score $silent tc.tmp matches 1 if score $sound_line tc.tmp matches 3.. run playsound minecraft:block.lever.click neutral @a ~ ~ ~ 1 0.5

scoreboard players reset $silent tc.tmp
scoreboard players reset $sound_line tc.tmp
