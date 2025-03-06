# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get command ID
execute store result score $disp_command turtlecraft.tmp run data get storage turtlecraft:tmp list_end[0].C


# Append text for current line to a list of every line that will be displayed
data modify storage turtlecraft:tmp new_display set value {C:'{"text":""}', A1:"", A2:"", A3:"", A4:"", A5:""}

# move, turn, mine <direction>
execute if score $disp_command turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"move","color":"#00B000"}'
execute if score $disp_command turtlecraft.tmp matches 2 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"turn","color":"#00B000"}'
execute if score $disp_command turtlecraft.tmp matches 3 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"mine","color":"#67C967"}'
execute if score $disp_command turtlecraft.tmp matches 4 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"attack","color":"#67C967"}'
execute if score $disp_command turtlecraft.tmp matches 1..4 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.direction

# use, insert, take, grab, drop <item> (<direction>)
execute if score $disp_command turtlecraft.tmp matches 5 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"use","color":"#E8D94D"}'
execute if score $disp_command turtlecraft.tmp matches 6 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"insert","color":"#E8D94D"}'
execute if score $disp_command turtlecraft.tmp matches 7 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"take","color":"#E8D94D"}'
execute if score $disp_command turtlecraft.tmp matches 8 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"grab","color":"#E68957"}'
execute if score $disp_command turtlecraft.tmp matches 9 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"drop","color":"#E68957"}'
execute if score $disp_command turtlecraft.tmp matches 5..9 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.item
execute if score $disp_command turtlecraft.tmp matches 5..7 run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.direction

# harvest <direction>
execute if score $disp_command turtlecraft.tmp matches 10 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"harvest","color":"#67C967"}'
execute if score $disp_command turtlecraft.tmp matches 10 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.direction


# empty/comment
execute if score $disp_command turtlecraft.tmp matches 90 run data modify storage turtlecraft:tmp new_display.C set value '{"text":":","color":"#A2A2A2"}'
execute if score $disp_command turtlecraft.tmp matches 90 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.comment

# counter <name> <operation> <type> <value>
execute if score $disp_command turtlecraft.tmp matches 91 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"counter","color":"#FD93FD"}'
execute if score $disp_command turtlecraft.tmp matches 91 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.name
execute if score $disp_command turtlecraft.tmp matches 91 run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.operation
execute if score $disp_command turtlecraft.tmp matches 91 run data modify storage turtlecraft:tmp new_display.A3 set from storage turtlecraft:tmp list_end[0].A.type
execute if score $disp_command turtlecraft.tmp matches 91 if data storage turtlecraft:tmp {new_display:{A3:"value"}} run data modify storage turtlecraft:tmp new_display.A4 set from storage turtlecraft:tmp list_end[0].A.value
execute if score $disp_command turtlecraft.tmp matches 91 if data storage turtlecraft:tmp {new_display:{A3:"counter"}} run data modify storage turtlecraft:tmp new_display.A4 set from storage turtlecraft:tmp list_end[0].A.value
execute if score $disp_command turtlecraft.tmp matches 91 if data storage turtlecraft:tmp {new_display:{A3:"pos"}} run data modify storage turtlecraft:tmp new_display.A4 set from storage turtlecraft:tmp list_end[0].A.value
execute if score $disp_command turtlecraft.tmp matches 91 if data storage turtlecraft:tmp {new_display:{A3:"random"}} run data modify storage turtlecraft:tmp new_display.A4 set from storage turtlecraft:tmp list_end[0].A.value

# if/unless item <item>
#           block <block> <direction>
#           counter <name> <operation> <type> <value>
execute if score $disp_command turtlecraft.tmp matches 92 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"if","color":"#FD93FD"}'
execute if score $disp_command turtlecraft.tmp matches 93 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"unless","color":"#FD93FD"}'
execute if score $disp_command turtlecraft.tmp matches 92..93 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.condition
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"item"}} run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.item
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"block"}} run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.block
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"block"}} run data modify storage turtlecraft:tmp new_display.A3 set from storage turtlecraft:tmp list_end[0].A.direction
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"counter"}} run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.name
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"counter"}} run data modify storage turtlecraft:tmp new_display.A3 set from storage turtlecraft:tmp list_end[0].A.operation
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"counter"}} run data modify storage turtlecraft:tmp new_display.A4 set from storage turtlecraft:tmp list_end[0].A.type
execute if score $disp_command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {new_display:{A1:"counter"}} run data modify storage turtlecraft:tmp new_display.A5 set from storage turtlecraft:tmp list_end[0].A.value

# fuel
execute if score $disp_command turtlecraft.tmp matches 94 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"fuel","color":"#4E8DCC"}'
execute if score $disp_command turtlecraft.tmp matches 94 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.item
execute if score $disp_command turtlecraft.tmp matches 94 run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.count

# line set/add/remove <line>
execute if score $disp_command turtlecraft.tmp matches 95 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"line","color":"#FD93FD"}'
execute if score $disp_command turtlecraft.tmp matches 95 run data modify storage turtlecraft:tmp new_display.A1 set from storage turtlecraft:tmp list_end[0].A.operation
execute if score $disp_command turtlecraft.tmp matches 95 run data modify storage turtlecraft:tmp new_display.A2 set from storage turtlecraft:tmp list_end[0].A.line

# wait, pause, stop, remove
execute if score $disp_command turtlecraft.tmp matches 96 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"wait","color":"#A2A2A2"}'
execute if score $disp_command turtlecraft.tmp matches 97 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"pause","color":"#4E8DCC"}'
execute if score $disp_command turtlecraft.tmp matches 98 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"stop","color":"#4E8DCC"}'
execute if score $disp_command turtlecraft.tmp matches 99 run data modify storage turtlecraft:tmp new_display.C set value '{"text":"remove","color":"#E6553E"}'


# Make arguments json
execute as @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] run function turtlecraft:code/edit/display/json_args/init


# Append new line to list
data modify storage turtlecraft:tmp displays append from storage turtlecraft:tmp new_display


# If line is selected, save it on tmp storage
execute if score $index turtlecraft.tmp = $index_selected turtlecraft.tmp run data modify storage turtlecraft:tmp selected_display set from storage turtlecraft:tmp new_display
execute if score $index turtlecraft.tmp = $index_selected turtlecraft.tmp run data modify storage turtlecraft:tmp selected_display.CID set from storage turtlecraft:tmp list_end[0].C
execute if score $index turtlecraft.tmp = $index_selected turtlecraft.tmp run data modify storage turtlecraft:tmp selected_display.bp set from storage turtlecraft:tmp list_end[0].bp


# Iterate
data remove storage turtlecraft:tmp list_end[0]
scoreboard players add $index turtlecraft.tmp 1
execute if score $index turtlecraft.tmp matches 0..9 run function turtlecraft:code/edit/display/get_display
