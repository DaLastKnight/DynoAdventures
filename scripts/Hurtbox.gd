class_name Hurtbox

extends Area2D


func init():
	collision_layer = 0 # No need to detect other nodes
	collision_mask = 2 # To detect Hitbox nodes that enters the area of the Hurtbox
	
func _ready():
	connect("area_entered", self._on_area_entered)
	
func _on_area_entered(hitbox: Hitbox):
	if Hitbox == null:
		return
		
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
		
	if owner.has_method("receive_knockback"):
		owner.receive_knockback(hitbox.global_position, hitbox.damage)

	# E 0:00:00:0852   emit_signalp: Error calling from signal 'area_entered' to callable: 'Area2D(Hurtbox.gd)::_on_area_entered': Cannot convert argument 1 from Object to Object.
  	# <C++ Source>   core/object/object.cpp:1140 @ emit_signalp()
	# Got the above error, though logic is working so can be ignored for now?
