summon block_display ~-0.0005 ~-0.0005 ~-0.0005 {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.001f,1.001f,1.001f]},block_state:{Name:"minecraft:command_block",Properties:{facing:"up"}},Tags:["turtlecraft.server"]}
summon minecraft:text_display ~.5 ~1.15 ~.5 {text:'{"text":""}',billboard:center,alignment:"center",Tags:["turtlecraft.server"],CustomName:'[{"text":"Server"}]'}
scoreboard players set @n[type=block_display] turtlecraft.s.mode 0