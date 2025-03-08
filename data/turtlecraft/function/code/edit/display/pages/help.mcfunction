# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 5


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n"

tellraw @s ["\n                ",{"text":"TurtleCraft","color":"dark_aqua"}]
tellraw @s ["\n       ",{"text":"Data pack made by ","color":"gray"},{"text":"Ivaynn","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Check the links below\nfor contact information","color":"gray"}]}}]

tellraw @s {"text":"\n\n           Links and Tutorials","color":"dark_aqua"}
tellraw @s ["\n ",{"text":"Planet Minecraft","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/turtlecraft-programmable-turtles/"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"GitHub","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://github.com/Ivaynn/TurtleCraft"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"YouTube","color":"gray","underlined": true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/@Ivaynn"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open link","color":"gray"}]}}]


# Tabs
tellraw @s ""
tellraw @s ["\n",{"translate":"turtlecraft.tab.home","fallback":"HOME","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -100"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.home.description","fallback":"Home Page","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.edit","fallback":"EDIT","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -500"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.edit.description","fallback":"Edit Saved Instructions","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.counters","fallback":"COUNTERS","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -206"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.counters.description","fallback":"Show List of Counters","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.options","fallback":"OPTIONS","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -207"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.options.description","fallback":"Other Options","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.more","fallback":"MORE","color":"dark_aqua"}]
