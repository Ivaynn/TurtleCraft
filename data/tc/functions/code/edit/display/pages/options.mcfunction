# Executed by the player. All turtle components have tag "tc.tmp"
scoreboard players set @s tc.page 4


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n"


# Header
tellraw @s {"text":" Options\n","color":"dark_aqua"}


# Options
execute if score $auto_mine tc.tmp matches 0 run tellraw @s ["",{"text":" Auto Mine ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"Automatically mine blocks in the\nturtle's way when moving","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -601"}}]
execute if score $auto_mine tc.tmp matches 1 run tellraw @s ["",{"text":" Auto Mine ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"Automatically mine blocks in the\nturtle's way when moving","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -601"}}]

execute if score $error_pause tc.tmp matches 0 run tellraw @s ["",{"text":" Pause On Error ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"Pause the turtle when there's an error\nwhile running an instruction","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -602"}}]
execute if score $error_pause tc.tmp matches 1 run tellraw @s ["",{"text":" Pause On Error ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"Pause the turtle when there's an error\nwhile running an instruction","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -602"}}]

execute if score $turtle_lock tc.tmp matches 0 run tellraw @s ["",{"text":" Locked ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"Only the turtle's owner can interact\nwith it. This doesn't lock its inventory","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -603"}}]
execute if score $turtle_lock tc.tmp matches 1 run tellraw @s ["",{"text":" Locked ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"Only the turtle's owner can interact\nwith it. This doesn't lock its inventory","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -603"}}]

execute if score $auto_fuel tc.tmp matches 0 run tellraw @s ["",{"text":" Auto Fuel ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"When the fuel level reaches zero,\nconsume the first fuel item","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -604"}}]
execute if score $auto_fuel tc.tmp matches 1 run tellraw @s ["",{"text":" Auto Fuel ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"When the fuel level reaches zero,\nconsume the first fuel item","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -604"}}]

execute if score $safe_mine tc.tmp matches 0 run tellraw @s ["",{"text":" Safe Mine ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"Stop the turtle from mining important\nblocks and containers, like chests","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -605"}}]
execute if score $safe_mine tc.tmp matches 1 run tellraw @s ["",{"text":" Safe Mine ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"Stop the turtle from mining important\nblocks and containers, like chests","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -605"}}]

execute if score $show_text tc.tmp matches 0 run tellraw @s ["",{"text":" Show Text ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"While running an instruction, display the\nname and line number above the turtle","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -606"}}]
execute if score $show_text tc.tmp matches 1 run tellraw @s ["",{"text":" Show Text ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"While running an instruction, display the\nname and line number above the turtle","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -606"}}]

execute if score $damage_players tc.tmp matches 0 run tellraw @s ["",{"text":" Damage Players ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"The attack instruction can\ndamage and kill players","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -607"}}]
execute if score $damage_players tc.tmp matches 1 run tellraw @s ["",{"text":" Damage Players ","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"The attack instruction can\ndamage and kill players","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -607"}}]


# Other
tellraw @s ["\n",{"text":" RESET ","color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -699"},"hoverEvent":{"action":"show_text","contents":[{"text":"Clear instructions and reset options","color":"gray"}]}},"  ",{"text":" PICK UP ","color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -698"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove this turtle and drop all items","color":"gray"}]}},"  ",{"text":" EXIT ","color":"red","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -697"},"hoverEvent":{"action":"show_text","contents":[{"text":"Close this menu","color":"gray"}]}}]


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -500"},"hoverEvent":{"action":"show_text","contents":[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"dark_aqua"},{"text":" MORE ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -208"},"hoverEvent":{"action":"show_text","contents":[{"text":"Credits and Tutorials","color":"gray"}]}}]
