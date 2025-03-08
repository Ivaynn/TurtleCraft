# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

# Get data from arguments
execute if data storage turtlecraft:tmp {run_line:{A:{item:"any"}}} run data modify storage turtlecraft:tmp fuel_id set value "any"
execute if data storage turtlecraft:tmp {run_line:{A:{item:"coal"}}} run data modify storage turtlecraft:tmp fuel_id set value "minecraft:coal"
execute if data storage turtlecraft:tmp {run_line:{A:{item:"charcoal"}}} run data modify storage turtlecraft:tmp fuel_id set value "minecraft:charcoal"
execute if data storage turtlecraft:tmp {run_line:{A:{item:"coal_block"}}} run data modify storage turtlecraft:tmp fuel_id set value "minecraft:coal_block"
execute if data storage turtlecraft:tmp {run_line:{A:{item:"blaze_rod"}}} run data modify storage turtlecraft:tmp fuel_id set value "minecraft:blaze_rod"
execute if data storage turtlecraft:tmp {run_line:{A:{item:"lava_bucket"}}} run data modify storage turtlecraft:tmp fuel_id set value "minecraft:lava_bucket"

execute store result score $fuel_count turtlecraft.tmp run data get storage turtlecraft:tmp run_line.A.count


# Start
function turtlecraft:code/run/instructions/fuel/setup
