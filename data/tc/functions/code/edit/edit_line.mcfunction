# Executed by the player. All turtle components have tag "tc.tmp"

scoreboard players set $pause tc.tmp 1
scoreboard players set $display_page tc.tmp 2


# Remove line
execute if score $argument tc.tmp matches 14 run function tc:code/edit/remove

execute if score $argument tc.tmp matches 15 run say cut
execute if score $argument tc.tmp matches 16 run say copy
execute if score $argument tc.tmp matches 17 run say paste
execute if score $argument tc.tmp matches 18 run say switch up
execute if score $argument tc.tmp matches 19 run say switch down
execute if score $argument tc.tmp matches 20 run say toggle breakpoint
