#tellraw @a {"text":"> Reloaded!"}
gamerule maxCommandChainLength 1000000000


# Reset advancement triggers
advancement revoke @a only tc:root
advancement revoke @a only tc:craft_egg


# Do this for every dimension - Blocks at [10028 0 10028] and [10028 1 10028] will be replaced with bedrock
function tc:forceload


# Scores
scoreboard objectives add tc.id dummy
scoreboard objectives add tc.update_id dummy
scoreboard objectives add tc.line dummy
scoreboard objectives add tc.timer dummy
scoreboard objectives add tc.fuel dummy
scoreboard objectives add tc.trigger trigger {"text":"Turtle Trigger"}
scoreboard objectives add tc.tmp dummy
scoreboard objectives add tc.relog minecraft.custom:minecraft.leave_game
scoreboard objectives add tc.msg dummy
scoreboard objectives add tc.page dummy
scoreboard objectives add tc.numpad dummy
execute unless score $invalid_count tc.id matches 0.. run scoreboard players set $invalid_count tc.id 0


# Math
scoreboard objectives add tc.math dummy
scoreboard players set #_1 tc.math -1
scoreboard players set #2 tc.math 2
scoreboard players set #5 tc.math 5
scoreboard players set #10 tc.math 10
scoreboard players set #20 tc.math 20
scoreboard players set #25 tc.math 25
scoreboard players set #80 tc.math 80
scoreboard players set #90 tc.math 90
scoreboard players set #100 tc.math 100
scoreboard players set #10000 tc.math 10000
scoreboard players set #1000000 tc.math 1000000


# Options
scoreboard objectives add tc.options dummy {"text":"Options"}
execute unless score #run tc.options matches 1 run tellraw @a ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"TurtleCraft data pack installed!\n","color":"gray"}]
scoreboard players set #run tc.options 1

execute unless score max_turtle_count tc.options matches 1.. run scoreboard players set max_turtle_count tc.options 100
execute unless score max_actions_tick tc.options matches 1.. run scoreboard players set max_actions_tick tc.options 20
execute unless score max_length tc.options matches 1.. run scoreboard players set max_length tc.options 999
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
