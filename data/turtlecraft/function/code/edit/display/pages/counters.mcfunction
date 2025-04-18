# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 3


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"


# Header
tellraw @s [{"text":"","click_event":{action:"run_command",command:"/trigger TurtleCraft set -206"},"hover_event":{action:"show_text",value:[{"text":"Click to refresh","color":"gray"}]}},{"text":" Counters  ","color":"dark_aqua"},{"text":" R \n","color":"aqua"}]


# Print counters <name>: <value>
data modify storage turtlecraft:tmp Counters set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.head.components."minecraft:custom_data".turtlecraft.Counters
execute store result score $counter_index turtlecraft.tmp run data get storage turtlecraft:tmp Counters
execute if score $counter_index turtlecraft.tmp matches 0 run tellraw @s [" ",{"text":"Empty list","color":"gray","italic":true,"hover_event":{action:"show_text",value:[{"text":"Use the ","color":"gray"},{"text":"counter","color":"#FD93FD"},{"text":" instruction\nto see a list of counters here","color":"gray"}]}}]

execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 11.. run scoreboard players operation $display_more turtlecraft.tmp = $counter_index turtlecraft.tmp
execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 11.. run scoreboard players remove $display_more turtlecraft.tmp 14
execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 15.. run scoreboard players set $counter_index turtlecraft.tmp 14

execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/display/pages/counter_list

execute if score limit_counter_display turtlecraft.options matches 1 if score $display_more turtlecraft.tmp matches 1.. run tellraw @s [" ",{"text":"... and ","color":"gray","italic":true},{"score":{"name":"$display_more","objective":"turtlecraft.tmp"},"color":"gray","italic":true},{"text":" others","color":"gray","italic":true}]


# Clear tmp
data remove storage turtlecraft:tmp Counters
scoreboard players reset $counter_index turtlecraft.tmp
scoreboard players reset $display_more turtlecraft.tmp

data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text set value {"text":""}
scoreboard players reset $convert_str turtlecraft.tmp
data remove storage turtlecraft:tmp json_arg


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -500"},"hover_event":{action:"show_text",value:[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"dark_aqua"},{"text":" OPTIONS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -207"},"hover_event":{action:"show_text",value:[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -208"},"hover_event":{action:"show_text",value:[{"text":"Credits and Tutorials","color":"gray"}]}}]
