# Update the position for this armor stand based on the position and rotation of the previous one
execute at @e[tag=epi_target] rotated as @e[tag=epi_target] positioned ^ ^ ^10 run tp @e[tag=epi_active] ~ ~ ~

execute store result score @e[tag=epi_active] epi_pos_x run data get entity @e[tag=epi_active,limit=1] Pos[0] 1000
execute store result score @e[tag=epi_active] epi_pos_z run data get entity @e[tag=epi_active,limit=1] Pos[2] 1000
execute store result score @e[tag=epi_target] epi_pos_x run data get entity @e[tag=epi_target,limit=1] Pos[0] 1000
execute store result score @e[tag=epi_target] epi_pos_z run data get entity @e[tag=epi_target,limit=1] Pos[2] 1000

scoreboard players operation @e[tag=epi_active] epi_pos_x -= @e[tag=epi_target,limit=1] epi_pos_x
scoreboard players operation @e[tag=epi_active] epi_pos_z -= @e[tag=epi_target,limit=1] epi_pos_z

scoreboard players operation @e[tag=epi_active] epi_pos_x *= @e[tag=epi_target,limit=1] epi_amp
scoreboard players operation @e[tag=epi_active] epi_pos_z *= @e[tag=epi_target,limit=1] epi_amp

scoreboard players operation @e[tag=epi_active] epi_pos_x /= EpiGen epi_amp
scoreboard players operation @e[tag=epi_active] epi_pos_z /= EpiGen epi_amp

scoreboard players operation @e[tag=epi_active] epi_pos_x += @e[tag=epi_target,limit=1] epi_pos_x
scoreboard players operation @e[tag=epi_active] epi_pos_z += @e[tag=epi_target,limit=1] epi_pos_z

execute store result entity @e[tag=epi_active,limit=1] Pos[0] double 0.001 run scoreboard players get @e[tag=epi_active,limit=1] epi_pos_x
execute store result entity @e[tag=epi_active,limit=1] Pos[2] double 0.001 run scoreboard players get @e[tag=epi_active,limit=1] epi_pos_z