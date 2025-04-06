# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get the last characters of the string (reset on new iteration to avoid issues)
data modify storage turtlecraft:tmp book.last set value ""
data modify storage turtlecraft:tmp book.last set string storage turtlecraft:tmp book.iterate -1


# Remove the last character of the string - if this fails, the string is empty
execute store success score $more_char turtlecraft.tmp run data modify storage turtlecraft:tmp book.iterate set string storage turtlecraft:tmp book.iterate 0 -1


# Character is "\n" -> invalid
execute if data storage turtlecraft:tmp {book:{last:"\n"}} run return run data modify storage turtlecraft:tmp book.return set value "?"


# No more characters -> valid
execute if score $more_char turtlecraft.tmp matches 0 run return 0


# Next iteration
function turtlecraft:code/edit/change_arg/book/iterate
