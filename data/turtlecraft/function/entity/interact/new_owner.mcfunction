# Executed by turtlecraft.body - player has "turtlecraft.player" - turtle entities have "turtlecraft.tmp"

data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text set value {"selector":"@p[tag=turtlecraft.player]"}
data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Owner.Name set from entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text.hover_event.name
data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Owner.UUID set from entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text.hover_event.uuid
data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text set value {"text":""}