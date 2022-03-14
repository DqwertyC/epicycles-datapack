execute as @e[tag=epi_point] run scoreboard players operation @s epi_rot_y += @s epi_freq
execute as @e[tag=epi_marker] at @s run function epi_draw:position_enter