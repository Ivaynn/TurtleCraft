# Executed by tc.body - all attached entities have "tc.tmp"


scoreboard players set @s tc.line 0
scoreboard players set @s tc.timer 0

execute store result score $sound_line tc.tmp run data get entity @s ArmorItems[0].tag.Instructions
execute if score $sound_line tc.tmp matches 3.. run playsound minecraft:block.lever.click neutral @a ~ ~ ~ 1 0.5
scoreboard players reset $sound_line tc.tmp
