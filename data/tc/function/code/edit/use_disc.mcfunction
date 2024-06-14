# Executed by the player. All turtle components have tag "tc.tmp"


scoreboard players set $display_page tc.tmp 1

execute if score use_discs tc.options matches 1 if score $argument tc.tmp matches 99 if predicate tc:holding_disc run function tc:entity/interact/disc/save

execute if score use_discs tc.options matches 1 if score $argument tc.tmp matches 98 if predicate tc:holding_disc_turtle run scoreboard players set $pause tc.tmp 1
execute if score use_discs tc.options matches 1 if score $argument tc.tmp matches 98 if predicate tc:holding_disc_turtle run function tc:entity/interact/disc/load

execute if score use_discs tc.options matches 1 if score $argument tc.tmp matches 97 if predicate tc:holding_disc_turtle run function tc:entity/interact/disc/reset_disc
