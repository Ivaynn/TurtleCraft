# Admin function - executed by player directly at any time


# Upgrade old turtle entities
execute as @e[tag=tc.turtle] run function turtlecraft:entity/upgrade_to_v3


# Force a global update
function turtlecraft:admin/global_update


# Transfer data pack options
scoreboard players operation max_turtle_count turtlecraft.options = max_turtle_count tc.options
scoreboard players operation max_actions_tick turtlecraft.options = max_actions_tick tc.options
scoreboard players operation max_length turtlecraft.options = max_length tc.options
scoreboard players operation skip_purple_delay turtlecraft.options = skip_purple_delay tc.options
scoreboard players operation global_update turtlecraft.options = global_update tc.options
scoreboard players operation show_warnings turtlecraft.options = show_warnings tc.options
scoreboard players operation ride_turtles turtlecraft.options = ride_turtles tc.options
scoreboard players operation use_tools turtlecraft.options = use_tools tc.options
scoreboard players operation use_discs turtlecraft.options = use_discs tc.options
scoreboard players operation use_fuel turtlecraft.options = use_fuel tc.options
scoreboard players operation change_appearance turtlecraft.options = change_appearance tc.options
scoreboard players operation locked_turtles turtlecraft.options = locked_turtles tc.options
scoreboard players operation delay_normal turtlecraft.options = delay_normal tc.options
scoreboard players operation delay_fueled turtlecraft.options = delay_fueled tc.options
scoreboard players operation fuel_multiplier turtlecraft.options = fuel_multiplier tc.options
scoreboard players operation limit_directions turtlecraft.options = limit_directions tc.options
scoreboard players operation limit_counter_display turtlecraft.options = limit_counter_display tc.options
scoreboard players operation launch_strength turtlecraft.options = launch_strength tc.options
scoreboard players operation auto_refresh turtlecraft.options = auto_refresh tc.options
scoreboard players operation paused turtlecraft.options = paused tc.options
scoreboard objectives remove tc.options
function turtlecraft:options/pages/update


# Update turtle disc
execute unless predicate turtlecraft:holding_disc run return 0
data modify storage turtlecraft:tmp upgrade_data set from entity @s SelectedItem.components."minecraft:custom_data".tc
data modify storage turtlecraft:tmp upgrade_data.Instructions[0].Version set value 3
item modify entity @s weapon.mainhand turtlecraft:upgrade_to_v3
