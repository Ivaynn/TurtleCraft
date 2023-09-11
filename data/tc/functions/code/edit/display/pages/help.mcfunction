# Executed by the player. All turtle components have tag "tc.tmp"
scoreboard players set @s tc.page 5


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n"

tellraw @s ["\n                ",{"text":"TurtleCraft","color":"dark_aqua"}]
tellraw @s ["\n       ",{"text":"Data pack made by ","color":"gray"},{"text":"Ivaynn","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Check the links below\nfor contact information","color":"gray"}]}}]

tellraw @s {"text":"\n\n           Links and Tutorials","color":"dark_aqua"}
tellraw @s ["\n ",{"text":"Planet Minecraft","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/turtlecraft-programmable-turtles/"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"GitHub","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://github.com/Ivaynn/TurtleCraft"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"YouTube","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/@Ivaynn"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}}]


# Tabs
tellraw @s ["\n\n",{"text":"HOME ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -100"},"hoverEvent":{"action":"show_text","contents":[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -500"},"hoverEvent":{"action":"show_text","contents":[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -206"},"hoverEvent":{"action":"show_text","contents":[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -207"},"hoverEvent":{"action":"show_text","contents":[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"dark_aqua"}]
