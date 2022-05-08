
client
	var/_rotation_speed = 10

	Move(loc, dir)
		..()
		mob.SetForward(dir2vector(dir))

	MouseWheel(object, delta_x, delta_y, location, control, params)
		..()
		var/scroll_direction = delta_y ? delta_y / abs(delta_y) : 0
		mob.Turn(-scroll_direction * _rotation_speed * world.tick_lag)

mob
	icon = 'Arrow.dmi'

	var/vector/_forward

	proc/Forward()
		return _forward

	proc/SetForward(vector/forward)
		_forward = forward.Direction()
		transform = _forward.Rotation()

	proc/Turn(clockwise_degrees)
		SetForward(Forward().Turn(clockwise_degrees))

	New()
		..()
		_forward = new(0, 1, 0)

world
	fps = 60
	maxz = 1
	icon_size = 128
