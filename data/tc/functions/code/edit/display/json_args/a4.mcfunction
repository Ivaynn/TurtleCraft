# Executed by the tc.text. All turtle components have tag "tc.tmp"

data modify storage tc:tmp json_arg.copy set string storage tc:tmp new_display.A4 0 1
execute store success score $convert_str tc.tmp run data modify storage tc:tmp json_arg.copy set string storage tc:tmp json_arg.check
execute if score $convert_str tc.tmp matches 1 run data modify entity @s text set value '{"nbt":"new_display.A4","storage":"tc:tmp"}'
execute if score $convert_str tc.tmp matches 1 run data modify storage tc:tmp new_display.J4 set from entity @s text
execute if score $convert_str tc.tmp matches 0 run data modify storage tc:tmp new_display.J4 set from storage tc:tmp new_display.A4
