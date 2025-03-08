# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 3


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"


# Header
tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to refresh","color":"gray"}]}},{"text":" Counters  ","color":"dark_aqua"},{"text":" R \n","color":"aqua"}]


# Print counters <name>: <value>
data modify storage turtlecraft:tmp Counters set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[3].components."minecraft:custom_data".turtlecraft.Counters
execute store result score $counter_index turtlecraft.tmp run data get storage turtlecraft:tmp Counters
execute if score $counter_index turtlecraft.tmp matches 0 run tellraw @s [" ",{"text":"Empty list","color":"gray","italic":true,"hoverEvent":{"action":"show_text","contents":[{"text":"Use the ","color":"gray"},{"text":"counter","color":"#FD93FD"},{"text":" instruction\nto see a list of counters here","color":"gray"}]}}]

execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 11.. run scoreboard players operation $display_more turtlecraft.tmp = $counter_index turtlecraft.tmp
execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 11.. run scoreboard players remove $display_more turtlecraft.tmp 14
execute if score limit_counter_display turtlecraft.options matches 1 if score $counter_index turtlecraft.tmp matches 15.. run scoreboard players set $counter_index turtlecraft.tmp 14

execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/display/pages/counter_list

execute if score limit_counter_display turtlecraft.options matches 1 if score $display_more turtlecraft.tmp matches 1.. run tellraw @s [" ",{"text":"... and ","color":"gray","italic":true},{"score":{"name":"$display_more","objective":"turtlecraft.tmp"},"color":"gray","italic":true},{"text":" others","color":"gray","italic":true}]


# Clear tmp
data remove storage turtlecraft:tmp Counters
scoreboard players reset $counter_index turtlecraft.tmp
scoreboard players reset $display_more turtlecraft.tmp

data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text set value '{"text":""}'
scoreboard players reset $convert_str turtlecraft.tmp
data remove storage turtlecraft:tmp json_arg


# Tabs
tellraw @s ["\n",{"translate":"turtlecraft.tab.home","fallback":"HOME","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -100"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.home.description","fallback":"Home Page","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.edit","fallback":"EDIT","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -500"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.edit.description","fallback":"Edit Saved Instructions","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.counters","fallback":"COUNTERS","color":"dark_aqua"},"  ",{"translate":"turtlecraft.tab.options","fallback":"OPTIONS","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -207"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.options.description","fallback":"Other Options","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.more","fallback":"MORE","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -208"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.more.description","fallback":"Credits and Tutorials","color":"gray"}]}}]
