# Line <operation> value/counter <value>

execute if data storage tc:tmp {selected_display:{A1:"set"}} run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"green"},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"green"},{"text":" | ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true,"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -600"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove line","color":"red"}]}},"  ",{"nbt":"selected_display.J1","storage":"tc:tmp","interpret":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -401"},"hoverEvent":{"action":"show_text","contents":[{"text":"set","color":"aqua"},{"text":"\nadd\nremove","color":"gray"}]}},"  ",{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -402"},"hoverEvent":{"action":"show_text","contents":[{"text":"-10","color":"gray"}]}},{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -403"},"hoverEvent":{"action":"show_text","contents":[{"text":"-1","color":"gray"}]}},{"nbt":"selected_display.J2","storage":"tc:tmp","interpret":true,"color":"gray"},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -404"},"hoverEvent":{"action":"show_text","contents":[{"text":"+1","color":"gray"}]}},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -405"},"hoverEvent":{"action":"show_text","contents":[{"text":"+10","color":"gray"}]}}]
execute if data storage tc:tmp {selected_display:{A1:"add"}} run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"green"},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"green"},{"text":" | ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true,"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -600"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove line","color":"red"}]}},"  ",{"nbt":"selected_display.J1","storage":"tc:tmp","interpret":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -401"},"hoverEvent":{"action":"show_text","contents":[{"text":"set","color":"gray"},{"text":"\nadd","color":"aqua"},{"text":"\nremove","color":"gray"}]}},"  ",{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -402"},"hoverEvent":{"action":"show_text","contents":[{"text":"-10","color":"gray"}]}},{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -403"},"hoverEvent":{"action":"show_text","contents":[{"text":"-1","color":"gray"}]}},{"nbt":"selected_display.J2","storage":"tc:tmp","interpret":true,"color":"gray"},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -404"},"hoverEvent":{"action":"show_text","contents":[{"text":"+1","color":"gray"}]}},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -405"},"hoverEvent":{"action":"show_text","contents":[{"text":"+10","color":"gray"}]}}]
execute if data storage tc:tmp {selected_display:{A1:"remove"}} run tellraw @s ["",{"score":{"name":"$page_selected","objective":"tc.tmp"},"color":"green"},{"score":{"name":"$index_selected","objective":"tc.tmp"},"color":"green"},{"text":" | ","color":"dark_green"}," ",{"nbt":"selected_display.C","storage":"tc:tmp","interpret":true,"clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -600"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove line","color":"red"}]}},"  ",{"nbt":"selected_display.J1","storage":"tc:tmp","interpret":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -401"},"hoverEvent":{"action":"show_text","contents":[{"text":"set\nadd","color":"gray"},{"text":"\nremove","color":"aqua"}]}},"  ",{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -402"},"hoverEvent":{"action":"show_text","contents":[{"text":"-10","color":"gray"}]}},{"text":"< ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -403"},"hoverEvent":{"action":"show_text","contents":[{"text":"-1","color":"gray"}]}},{"nbt":"selected_display.J2","storage":"tc:tmp","interpret":true,"color":"gray"},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -404"},"hoverEvent":{"action":"show_text","contents":[{"text":"+1","color":"gray"}]}},{"text":" >","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger tc.trigger set -405"},"hoverEvent":{"action":"show_text","contents":[{"text":"+10","color":"gray"}]}}]