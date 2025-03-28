# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

execute if score $text_id turtlecraft.tmp matches 1.. if score $error_pause turtlecraft.tmp matches 1 run function turtlecraft:code/pause

execute if score $text_id turtlecraft.tmp matches 0 run data modify entity @s text set value {"text":""}

execute if score $text_id turtlecraft.tmp matches 0 run data modify entity @s view_range set value 0f
execute if score $text_id turtlecraft.tmp matches 1.. run data modify entity @s view_range set value 1f

# Error messages
execute if score $text_id turtlecraft.tmp matches 1 run data modify entity @s text set value {"text":"Inventory full!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 2 run data modify entity @s text set value {"text":"I can\'t move there!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 3 run data modify entity @s text set value {"text":"I can\'t mine this!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 4 run data modify entity @s text set value {"text":"I can\'t use this!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 5 run data modify entity @s text set value {"text":"Item not found!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 6 run data modify entity @s text set value {"text":"This isn\'t a crop!","color":"red"}

# Info
execute if score $text_id turtlecraft.tmp matches 7 run data modify entity @s text set value {"text":"Paused!","color":"blue"}
execute if score $text_id turtlecraft.tmp matches 8 run data modify entity @s text set value {"text":"Stopped!","color":"red"}
execute if score $text_id turtlecraft.tmp matches 9 run data modify entity @s text set value {"text":"Done!","color":"green"}
execute if score $text_id turtlecraft.tmp matches 10 run data modify entity @s text set value {"text":"Hello!","color":"green"}
execute if score $text_id turtlecraft.tmp matches 11 run data modify entity @s text set value {"text":"Breakpoint","color":"red"}
