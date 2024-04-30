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
		states.idle: return move_basic()
		states.walk_f, states.walk_b, states.walk_l, states.walk_r:
			return move_basic()
		states.run, states.strafe_l, states.strafe_r, states.backstep:
			return move_basic()
		states.fall: return move_basic()
		states.jump: return move_basic()
#Enter State
@warning_ignore("unused_parameter")
func state_enter(state_new, state_old):
	match(state_new):
		states.idle: p.anim_player.play("idle")
		states.walk_f, states.walk_b, states.walk_l, states.walk_r:
			p.anim_player.play("float_forward")
		states.run: p.anim_player.play("float_quick")
		states.jump: p.anim_player.play("jump")
		states.fall: p.anim_player.play("fall")
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
func move_basic(): pass
#Swim Movement
func move_swim(): pass
#Fly Movement
func move_fly(): pass
