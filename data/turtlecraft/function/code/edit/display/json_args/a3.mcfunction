# Executed by the turtlecraft.text. All turtle components have tag "turtlecraft.tmp"

data modify storage turtlecraft:tmp json_arg.copy set string storage turtlecraft:tmp new_display.A3 0 1
execute store success score $convert_str turtlecraft.tmp run data modify storage turtlecraft:tmp json_arg.copy set string storage turtlecraft:tmp json_arg.check
execute if score $convert_str turtlecraft.tmp matches 1 run data modify entity @s text set value {"nbt":"new_display.A3","storage":"turtlecraft:tmp"}
execute if score $convert_str turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp new_display.J3 set from entity @s text
execute if score $convert_str turtlecraft.tmp matches 0 run data modify storage turtlecraft:tmp new_display.J3 set from storage turtlecraft:tmp new_display.A3
