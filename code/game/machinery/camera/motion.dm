/obj/machinery/camera
	var/list/motionTargets = list()
	var/detectTime = 0
	var/alarm_delay = 100 // Don't forget, there's another 10 seconds in queueAlarm()
	movable_flags = MOVABLE_FLAG_PROXMOVE

/obj/machinery/camera/proc/internal_process()
	// motion camera event loop
	if (GET_FLAGS(stat, MACHINE_STAT_EMPED) || !is_powered())
		return
	if(!isMotion())
		. = PROCESS_KILL
		return
	if (detectTime > 0)
		var/elapsed = world.time - detectTime
		if (elapsed > alarm_delay)
			triggerAlarm()
	else if (detectTime == -1)
		for (var/mob/target in motionTargets)
			if (target.stat == DEAD)
				lostTarget(target)
			// See if the camera is still in range
			if(!in_range(src, target))
				// If they aren't in range, lose the target.
				lostTarget(target)

/obj/machinery/camera/proc/newTarget(mob/target)
	if (istype(target, /mob/living/silicon/ai)) return 0
	if (detectTime == 0)
		detectTime = world.time // start the clock
	if (!(target in motionTargets))
		motionTargets += target
	return 1

/obj/machinery/camera/proc/lostTarget(mob/target)
	if (target in motionTargets)
		motionTargets -= target
	if (motionTargets.len == 0)
		cancelAlarm()

/obj/machinery/camera/proc/cancelAlarm()
	if (!status || (!is_powered()))
		return 0
	if (detectTime == -1)
		GLOB.motion_alarm.clearAlarm(loc, src)
	detectTime = 0
	return 1

/obj/machinery/camera/proc/triggerAlarm()
	if (!status || (!is_powered()))
		return 0
	if (!detectTime) return 0
	GLOB.motion_alarm.triggerAlarm(loc, src)
	detectTime = -1
	return 1

/obj/machinery/camera/HasProximity(atom/movable/AM as mob|obj)
	if(isliving(AM))
		newTarget(AM)