# Executed by tc.body - all attached entities have "tc.tmp"

execute if score skip_purple_delay tc.options matches 1 if score @s tc.fuel matches 1.. if score use_fuel tc.options matches 1 run scoreboard players operation @s tc.timer = delay_fueled tc.options 
execute if score skip_purple_delay tc.options matches 1 if score @s tc.fuel matches 1.. unless score use_fuel tc.options matches 1 run scoreboard players operation @s tc.timer = delay_normal tc.options 
execute if score skip_purple_delay tc.options matches 1 unless score @s tc.fuel matches 1.. run scoreboard players operation @s tc.timer = delay_normal tc.options 
