# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 2


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]


# Header
tellraw @s {"text":"\n Edit Instructions ","color":"dark_aqua"}


# Instruction page selection
scoreboard players operation $current_page turtlecraft.tmp = @s turtlecraft.line
scoreboard players operation $current_page turtlecraft.tmp /= #10 turtlecraft.math
scoreboard players add $current_page turtlecraft.tmp 1

scoreboard players operation $last_page turtlecraft.tmp = $line_count turtlecraft.tmp
scoreboard players operation $last_page turtlecraft.tmp /= #10 turtlecraft.math
scoreboard players add $last_page turtlecraft.tmp 1

tellraw @s ["",{"text":"      "},{"text":"1","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -310"},"hover_event":{action:"show_text",value:[{"text":"First page","color":"gray"}]}},{"text":" < ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -311"},"hover_event":{action:"show_text",value:[{"text":"Previous page","color":"gray"}]}},{"score":{"name":"$current_page","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" > ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -312"},"hover_event":{action:"show_text",value:[{"text":"Next page","color":"gray"}]}},{"score":{"name":"$last_page","objective":"turtlecraft.tmp"},"color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -313"},"hover_event":{action:"show_text",value:[{"text":"Last page","color":"gray"}]}},"      ",{"text":" ✕ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -314"},"hover_event":{action:"show_text",value:[{"text":"Remove line","color":"red"}]}},{"text":" ✂ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -315"},"hover_event":{action:"show_text",value:[{"text":"Cut","color":"gray"}]}},{"text":" 🗍 ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -316"},"hover_event":{action:"show_text",value:[{"text":"Copy","color":"gray"}]}},{"text":" 🗐 ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -317"},"hover_event":{action:"show_text",value:[{"text":"Paste","color":"gray"}]}},{"text":" ↑ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -318"},"hover_event":{action:"show_text",value:[{"text":"Switch up","color":"gray"}]}},{"text":" ↓ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -319"},"hover_event":{action:"show_text",value:[{"text":"Switch down","color":"gray"}]}},{"text":" ❏ ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -320"},"hover_event":{action:"show_text",value:[{"text":"Toggle Numpad","color":"gray"}]}}]

scoreboard players reset $current_page turtlecraft.tmp
scoreboard players reset $last_page turtlecraft.tmp


# Display instructions
function turtlecraft:code/edit/display/print_lines


# Buttons
execute if score $display_page turtlecraft.tmp matches 2 run function turtlecraft:code/edit/display/pages/edit_buttons


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"dark_aqua"},{"text":" COUNTERS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -206"},"hover_event":{action:"show_text",value:[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -207"},"hover_event":{action:"show_text",value:[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -208"},"hover_event":{action:"show_text",value:[{"text":"Credits and Tutorials","color":"gray"}]}}]
