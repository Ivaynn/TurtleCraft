# Executed by the player. All turtle components have tag "tc.tmp"


# Get data
data modify storage tc:tmp item_tag set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag
data modify storage tc:tmp new_line set from storage tc:tmp item_tag.Clipboard
execute if data storage tc:tmp item_tag.Clipboard run function tc:code/edit/paste_success


# Clear tmp
data remove storage tc:tmp item_tag
data remove storage tc:tmp new_line
