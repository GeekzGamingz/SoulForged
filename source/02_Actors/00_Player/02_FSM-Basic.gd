#Inherits FSM_Player Code
extends FSM_Player
#------------------------------------------------------------------------------#
#Basic Movement
func move_basic():
	#Idle
	if p.velocity.x == 0 && p.check_grounded(): return states.idle
	#Verticle Movement
	if !p.check_grounded(): #When Airbourne
		if p.velocity.y > 0: return states.jump
		elif p.velocity.y < 0: return states.fall
	#Horizontal Movement
	elif p.velocity.x != 0 || p.velocity.z != 0:
		if p.max_speed == p.walk_speed: #When Walking
			if Input.get_action_strength("move_forward") > 0: return states.walk_f
			elif Input.get_action_strength("move_back") > 0: return states.walk_b
			elif Input.get_action_strength("move_left") > 0: return states.walk_l
			elif Input.get_action_strength("move_right") > 0: return states.walk_r
		elif ((p.max_speed == p.run_speed) || #When Running
			(p.max_speed == p.strafe_speed)): #When Strafing
			if p.velocity.x || p.velocity.z != 0:
				if Input.get_action_strength("move_forward") == 0:
					if Input.get_action_strength("move_left") > 0: return states.strafe_l
					elif Input.get_action_strength("move_right") > 0: return states.strafe_r
					elif Input.get_action_strength("move_back") > 0: return states.backstep
				else: return states.run
