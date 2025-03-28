
data modify entity @s equipment.mainhand set value {id:"minecraft:red_stained_glass_pane",count:1,components:{"minecraft:lore":[{"color":"gray","italic":false,"text":"Hit this turtle with a tool"},{"color":"gray","italic":false,"text":"while sneaking to equip it"}],"minecraft:custom_name":{"color":"red","italic":false,"text":"No Tool Equiped"},"minecraft:custom_data":{turtlecraft:{ClearItem:1b}}}}
data modify entity @s equipment.body set from entity @s equipment.mainhand
