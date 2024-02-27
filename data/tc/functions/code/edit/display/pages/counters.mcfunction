# Executed by the player. All turtle components have tag "tc.tmp"
scoreboard players set @s tc.page 3


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"


# Header
tellraw @s [{"text":"","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to refresh","color":"gray"}]}},{"text":" Counters  ","color":"dark_aqua"},{"text":" R \n","color":"aqua"}]


# Print counters <name>: <value>
data modify storage tc:tmp Counters set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[3].tag.Counters
execute store result score $counter_index tc.tmp run data get storage tc:tmp Counters
execute if score $counter_index tc.tmp matches 0 run tellraw @s [" ",{"text":"Empty list","color":"gray","italic":true,"hoverEvent":{"action":"show_text","contents":[{"text":"Use the ","color":"gray"},{"text":"counter","color":"#FD93FD"},{"text":" instruction\nto see a list of counters here","color":"gray"}]}}]

execute if score limit_counter_display tc.options matches 1 if score $counter_index tc.tmp matches 11.. run scoreboard players operation $display_more tc.tmp = $counter_index tc.tmp
execute if score limit_counter_display tc.options matches 1 if score $counter_index tc.tmp matches 11.. run scoreboard players remove $display_more tc.tmp 14
execute if score limit_counter_display tc.options matches 1 if score $counter_index tc.tmp matches 15.. run scoreboard players set $counter_index tc.tmp 14

execute if score $counter_index tc.tmp matches 1.. run function tc:code/edit/display/pages/counter_list

execute if score limit_counter_display tc.options matches 1 if score $display_more tc.tmp matches 1.. run tellraw @s [" ",{"text":"... and ","color":"gray","italic":true},{"score":{"name":"$display_more","objective":"tc.tmp"},"color":"gray","italic":true},{"text":" others","color":"gray","italic":true}]


# Clear tmp
data remove storage tc:tmp Counters
scoreboard players reset $counter_index tc.tmp
scoreboard players reset $display_more tc.tmp

data modify entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text set value '{"text":""}'
scoreboard players reset $convert_str tc.tmp
data remove storage tc:tmp json_arg


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -500"},"hoverEvent":{"action":"show_text","contents":[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"dark_aqua"},{"text":" OPTIONS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -207"},"hoverEvent":{"action":"show_text","contents":[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -208"},"hoverEvent":{"action":"show_text","contents":[{"text":"Credits and Tutorials","color":"gray"}]}}]
