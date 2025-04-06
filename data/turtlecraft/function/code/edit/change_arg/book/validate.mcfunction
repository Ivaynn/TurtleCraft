# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Iterate
data modify storage turtlecraft:tmp book.iterate set from storage turtlecraft:tmp book.return
function turtlecraft:code/edit/change_arg/book/iterate


# Clear tmp
scoreboard players reset $newline turtlecraft.tmp
scoreboard players reset $more_char turtlecraft.tmp
