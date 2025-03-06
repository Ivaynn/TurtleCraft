
# Page 1
execute unless score max_turtle_count turtlecraft.options matches 1.. run scoreboard players set max_turtle_count turtlecraft.options 100
execute unless score max_actions_tick turtlecraft.options matches 1.. run scoreboard players set max_actions_tick turtlecraft.options 20
execute unless score max_length turtlecraft.options matches 1.. run scoreboard players set max_length turtlecraft.options 1000
execute unless score skip_purple_delay turtlecraft.options matches 0..1 run scoreboard players set skip_purple_delay turtlecraft.options 1
execute unless score global_update turtlecraft.options matches 0..1 run scoreboard players set global_update turtlecraft.options 1
execute unless score show_warnings turtlecraft.options matches 0..1 run scoreboard players set show_warnings turtlecraft.options 0

execute unless score ride_turtles turtlecraft.options matches 0..1 run scoreboard players set ride_turtles turtlecraft.options 0
execute unless score use_tools turtlecraft.options matches 0..1 run scoreboard players set use_tools turtlecraft.options 1
execute unless score use_discs turtlecraft.options matches 0..1 run scoreboard players set use_discs turtlecraft.options 1
execute unless score use_fuel turtlecraft.options matches 0..1 run scoreboard players set use_fuel turtlecraft.options 1
execute unless score change_appearance turtlecraft.options matches 0..1 run scoreboard players set change_appearance turtlecraft.options 1
execute unless score locked_turtles turtlecraft.options matches 0..1 run scoreboard players set locked_turtles turtlecraft.options 1

execute unless score delay_normal turtlecraft.options matches 1.. run scoreboard players set delay_normal turtlecraft.options 40
execute unless score delay_fueled turtlecraft.options matches 1.. run scoreboard players set delay_fueled turtlecraft.options 15
execute unless score fuel_multiplier turtlecraft.options matches 0.. run scoreboard players set fuel_multiplier turtlecraft.options 100
execute unless score limit_directions turtlecraft.options matches 0..1 run scoreboard players set limit_directions turtlecraft.options 1
execute unless score limit_counter_display turtlecraft.options matches 0..1 run scoreboard players set limit_counter_display turtlecraft.options 1
execute unless score launch_strength turtlecraft.options matches 0.. run scoreboard players set launch_strength turtlecraft.options 150
execute unless score auto_refresh turtlecraft.options matches 0..1 run scoreboard players set auto_refresh turtlecraft.options 0
execute unless score paused turtlecraft.options matches 0..1 run scoreboard players set paused turtlecraft.options 0
