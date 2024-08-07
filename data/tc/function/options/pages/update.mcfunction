
# Page 1
execute unless score max_turtle_count tc.options matches 1.. run scoreboard players set max_turtle_count tc.options 100
execute unless score max_actions_tick tc.options matches 1.. run scoreboard players set max_actions_tick tc.options 20
execute unless score max_length tc.options matches 1.. run scoreboard players set max_length tc.options 1000
execute unless score skip_purple_delay tc.options matches 0..1 run scoreboard players set skip_purple_delay tc.options 1
execute unless score global_update tc.options matches 0..1 run scoreboard players set global_update tc.options 1
execute unless score show_warnings tc.options matches 0..1 run scoreboard players set show_warnings tc.options 0

execute unless score ride_turtles tc.options matches 0..1 run scoreboard players set ride_turtles tc.options 0
execute unless score use_tools tc.options matches 0..1 run scoreboard players set use_tools tc.options 1
execute unless score use_discs tc.options matches 0..1 run scoreboard players set use_discs tc.options 1
execute unless score use_fuel tc.options matches 0..1 run scoreboard players set use_fuel tc.options 1
execute unless score change_appearance tc.options matches 0..1 run scoreboard players set change_appearance tc.options 1
execute unless score locked_turtles tc.options matches 0..1 run scoreboard players set locked_turtles tc.options 1

execute unless score delay_normal tc.options matches 1.. run scoreboard players set delay_normal tc.options 40
execute unless score delay_fueled tc.options matches 1.. run scoreboard players set delay_fueled tc.options 15
execute unless score fuel_multiplier tc.options matches 0.. run scoreboard players set fuel_multiplier tc.options 100
execute unless score limit_directions tc.options matches 0..1 run scoreboard players set limit_directions tc.options 1
execute unless score limit_counter_display tc.options matches 0..1 run scoreboard players set limit_counter_display tc.options 1
execute unless score launch_strength tc.options matches 0.. run scoreboard players set launch_strength tc.options 150
execute unless score auto_refresh tc.options matches 0..1 run scoreboard players set auto_refresh tc.options 0
execute unless score paused tc.options matches 0..1 run scoreboard players set paused tc.options 0
