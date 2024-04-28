#Inherits StateMachine Code
extends StateMachine
class_name FSM_Player
#------------------------------------------------------------------------------#
#Variables
#OnReady Variables
@onready var state_output = $"../Outputs/Output_State"
#------------------------------------------------------------------------------#
#Ready Function
func _ready():
	state_add("idle")
	state_add("walk_f")
	state_add("walk_b")
	state_add("walk_l")
	state_add("walk_r")
	state_add("run")
	state_add("strafe_l")
	state_add("strafe_r")
	state_add("backstep")
	state_add("jump")
	state_add("fall")
	call_deferred("state_set", states.idle)
#------------------------------------------------------------------------------#
func _process(_delta: float):
	state_output.text = str(states.keys()[state])
#------------------------------------------------------------------------------#
#State Machine
#State Logistics
@warning_ignore("unused_parameter")
func state_logic(delta):
	if p.controllable:
		p.apply_gravity(delta)
		p.handle_movement()
#State Transitions
func transitions(_delta):
	match(state):
	#Basic Movement
		states.idle: return basic_move()
		states.walk_f, states.walk_b, states.walk_l, states.walk_r:
			return basic_move()
		states.run, states.strafe_l, states.strafe_r, states.backstep:
			return basic_move()
		states.fall: return basic_move()
		states.jump: return basic_move()
#Enter State
@warning_ignore("unused_parameter")
func state_enter(state_new, state_old):
	match(state_new):
		states.idle: p.anim_player.play("idle")
		states.walk_f, states.walk_b, states.walk_l, states.walk_r: pass
			#p.anim_player.play("float_f")
		states.strafe_l: p.max_speed = p.strafe_speed
		states.strafe_r: p.max_speed = p.strafe_speed
		states.backstep: p.max_speed = p.strafe_speed
	#Exit State
@warning_ignore("unused_parameter")
func state_exit(state_old, state_new):
	match(state_old):
		states.idle: pass
#------------------------------------------------------------------------------#
#Verbose Transitions
#Basic Movement
func basic_move(): pass
#Fly Movement
func fly_move(): pass
