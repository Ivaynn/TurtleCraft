# Executed by tc.body. All turtle entities have "tc.tmp"

data modify storage tc:tmp fuel_id set value "any"
scoreboard players set $fuel_count tc.tmp 1
function tc:code/run/instructions/fuel/setup
