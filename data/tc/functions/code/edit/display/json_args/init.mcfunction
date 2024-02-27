# Executed by the tc.text. All turtle components have tag "tc.tmp"

data modify storage tc:tmp json_arg.check set value "{"


# If string doesn't exist, create it
# If string exists and doesn't start with "{", convert to a json string so that it can be interpreted
execute if data storage tc:tmp {new_display:{A1:""}} run data modify storage tc:tmp new_display.J1 set value '{"text":""}'
execute unless data storage tc:tmp {new_display:{A1:""}} run function tc:code/edit/display/json_args/a1

execute if data storage tc:tmp {new_display:{A2:""}} run data modify storage tc:tmp new_display.J2 set value '{"text":""}'
execute unless data storage tc:tmp {new_display:{A2:""}} run function tc:code/edit/display/json_args/a2

execute if data storage tc:tmp {new_display:{A3:""}} run data modify storage tc:tmp new_display.J3 set value '{"text":""}'
execute unless data storage tc:tmp {new_display:{A3:""}} run function tc:code/edit/display/json_args/a3

execute if data storage tc:tmp {new_display:{A4:""}} run data modify storage tc:tmp new_display.J4 set value '{"text":""}'
execute unless data storage tc:tmp {new_display:{A4:""}} run function tc:code/edit/display/json_args/a4

execute if data storage tc:tmp {new_display:{A5:""}} run data modify storage tc:tmp new_display.J5 set value '{"text":""}'
execute unless data storage tc:tmp {new_display:{A5:""}} run function tc:code/edit/display/json_args/a5


# Clear tmp
data modify entity @s text set value '{"text":""}'
scoreboard players reset $convert_str tc.tmp
data remove storage tc:tmp json_arg
