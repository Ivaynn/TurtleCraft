# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

data modify storage turtlecraft:tmp fuel_id set value "any"
scoreboard players set $fuel_count turtlecraft.tmp 1
function turtlecraft:code/run/instructions/fuel/setup
