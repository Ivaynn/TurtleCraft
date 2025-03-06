# Executed by the player. All turtle components have tag "turtlecraft.tmp"


scoreboard players set $display_page turtlecraft.tmp 1

execute if score use_discs turtlecraft.options matches 1 if score $argument turtlecraft.tmp matches 99 if predicate turtlecraft:holding_disc run function turtlecraft:entity/interact/disc/save

execute if score use_discs turtlecraft.options matches 1 if score $argument turtlecraft.tmp matches 98 if predicate turtlecraft:holding_disc_turtle run scoreboard players set $pause turtlecraft.tmp 1
execute if score use_discs turtlecraft.options matches 1 if score $argument turtlecraft.tmp matches 98 if predicate turtlecraft:holding_disc_turtle run function turtlecraft:entity/interact/disc/load

execute if score use_discs turtlecraft.options matches 1 if score $argument turtlecraft.tmp matches 97 if predicate turtlecraft:holding_disc_turtle run function turtlecraft:entity/interact/disc/reset_disc
