#Inherits Kinematics Code
extends Kinematic
class_name Actor
#------------------------------------------------------------------------------#
#Variables
#Bool Variables
var found_wall: bool = false
var found_ledge: bool = false
#OnReady Variables
@onready var camera_arm = $Camera_Arm
#Detectors
@onready var detectors_ground = $Detectors_World/Detectors_Ground
@onready var detectors_wall = $Detectors_World/Detectors_Wall
@onready var dw_front = $Detectors_World/Detectors_Wall/DW_Front
@onready var dw_back = $Detectors_World/Detectors_Wall/DW_Back
@onready var dw_right = $Detectors_World/Detectors_Wall/DW_Right
@onready var dw_left = $Detectors_World/Detectors_Wall/DW_Left
#------------------------------------------------------------------------------#
#World Detection
func check_grounded():
	for detector in detectors_ground.get_children():
		if detector.is_colliding(): return true
	return false
