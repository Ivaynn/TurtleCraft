# Executed by tc.body. All turtle entities have "tc.tmp"

# Get data from arguments
execute if data storage tc:tmp {run_line:{A:{item:"any"}}} run data modify storage tc:tmp fuel_id set value "any"
execute if data storage tc:tmp {run_line:{A:{item:"coal"}}} run data modify storage tc:tmp fuel_id set value "minecraft:coal"
execute if data storage tc:tmp {run_line:{A:{item:"charcoal"}}} run data modify storage tc:tmp fuel_id set value "minecraft:charcoal"
execute if data storage tc:tmp {run_line:{A:{item:"coal_block"}}} run data modify storage tc:tmp fuel_id set value "minecraft:coal_block"
execute if data storage tc:tmp {run_line:{A:{item:"blaze_rod"}}} run data modify storage tc:tmp fuel_id set value "minecraft:blaze_rod"

execute store result score $fuel_count tc.tmp run data get storage tc:tmp run_line.A.count


# Start
function tc:code/run/instructions/fuel/setup
