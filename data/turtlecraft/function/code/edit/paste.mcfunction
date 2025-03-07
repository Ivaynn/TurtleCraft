# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get data
data modify storage turtlecraft:tmp item_tag set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft
data modify storage turtlecraft:tmp new_line set from storage turtlecraft:tmp item_tag.Clipboard
execute if data storage turtlecraft:tmp item_tag.Clipboard run function turtlecraft:code/edit/paste_success


# Clear tmp
data remove storage turtlecraft:tmp item_tag
data remove storage turtlecraft:tmp new_line
