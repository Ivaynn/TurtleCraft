# Executed by the text display. All turtle components have tag "turtlecraft.tmp"

data modify entity @s text set value '{"nbt":"book.return","storage":"turtlecraft:tmp"}'

data modify storage turtlecraft:tmp book.return set from entity @s text
