# Executed by the player. All turtle components have tag "tc.tmp"
scoreboard players set @s tc.page 2


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]


# Header
tellraw @s {"text":"\n Edit Instructions ","color":"dark_aqua"}


# Instruction page selection
scoreboard players operation $current_page tc.tmp = @s tc.line
scoreboard players operation $current_page tc.tmp /= #10 tc.math
scoreboard players add $current_page tc.tmp 1

scoreboard players operation $last_page tc.tmp = $line_count tc.tmp
scoreboard players operation $last_page tc.tmp /= #10 tc.math
scoreboard players add $last_page tc.tmp 1

tellraw @s ["",{"text":"      "},{"text":"1","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -310"}},{"text":" < ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -311"}},{"score":{"name":"$current_page","objective":"tc.tmp"},"color":"gray"},{"text":" > ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -312"}},{"score":{"name":"$last_page","objective":"tc.tmp"},"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -313"}}]

scoreboard players reset $current_page tc.tmp
scoreboard players reset $last_page tc.tmp


# Display instructions
function tc:code/edit/display/print_lines


# Buttons
execute if score $display_page tc.tmp matches 2 run function tc:code/edit/display/pages/edit_buttons


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"dark_aqua"},{"text":" COUNTERS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -207"},"hoverEvent":{"action":"show_text","contents":[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -208"},"hoverEvent":{"action":"show_text","contents":[{"text":"Credits and Tutorials","color":"gray"}]}}]
