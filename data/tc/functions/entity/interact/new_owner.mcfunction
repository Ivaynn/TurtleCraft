# Executed by tc.body - player has "tc.player" - turtle entities have "tc.tmp"

data modify entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text set value '{"selector":"@p[tag=tc.player]"}'
data modify entity @s ArmorItems[0].tag.Owner.Name set from entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text
data modify entity @s ArmorItems[0].tag.Owner.UUID set from entity @p[tag=tc.player] UUID
data modify entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text set value '{"text":""}'