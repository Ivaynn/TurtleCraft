# Executed by the text display. All turtle components have tag "tc.tmp"

data modify entity @s text set value '{"nbt":"book.return","storage":"tc:tmp"}'

data modify storage tc:tmp book.return set from entity @s text
