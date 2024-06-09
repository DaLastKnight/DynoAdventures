class_name Hitbox # First time I learnt you could make your own nodes through code!
extends Area2D

@export var damage = 25

func init():
	collision_layer = 2 # Allows the hitbox to be detected by other hurtbox (aka enemies)
	collision_mask = 0 # No need for mask to detect other nodes
