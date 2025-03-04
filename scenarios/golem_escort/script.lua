--game constants. Only change them if you change the order or factions above
magicHuman = 0
tech1 = 1
tech2 = 2
magicAlly = 3

-- Initialize some variables used to decide victory conditions
castleCount=0
mageTowerCount=0

helpArrivalTime = 11 * 60
golemArrived = 0
function golemDest()
	return {startLocation(magicHuman)[1]-18, startLocation(magicHuman)[2]+30}
end

function startup()
	disableAi(magicAlly)
	createUnit('power_golem', magicAlly, {6,252})
	golemID=lastCreatedUnit()
	givePositionCommand(golemID, 'move', startLocation(magicHuman))
	helpArrives = startTimerEvent()

	for _, i in ipairs({tech1, tech2}) do
		for __, unit in ipairs({'castle', 'worker', 'worker', 'worker', 'barracks', 'cow'}) do
			createUnit(unit, i , startLocation(i))
		end
	end

	for _, unit in ipairs({'mage_tower', 'initiate', 'initiate', 'initiate', 'energy_source'}) do
		createUnit(unit, magicHuman, startLocation(magicHuman))
	end
	createUnitNoSpacing('summoner_guild', magicHuman, {startLocation(magicHuman)[1]-14, startLocation(magicHuman)[2]+29})

	togglePauseGame(1)
	showMessage ( 'Objective', 'Golem Escort' )
end

function timerTriggerEvent()
	eventID=triggeredTimerEventId()
	if eventID == helpArrives then
		if timerEventSecondsElapsed(triggeredTimerEventId()) >= helpArrivalTime then
			for i=1,10 do
				for _, unit in ipairs({'behemoth', 'battlemage'}) do
					createUnit(unit, magicAlly, {startLocation(tech1)[1]+40, startLocation(tech1)[2]+40})
					createUnit(unit, magicAlly, {startLocation(tech2)[1]+40, startLocation(tech2)[2]+40})
				end
			end
			enableAi(magicAlly)
			golemArrived = 1
			showMessage ( 'Reinforced', 'StoneGodArrived' )
			stopTimerEvent(eventID)
		end
	end
end

function unitCreated()
	if lastCreatedUnitName() == 'mage_tower' then
		mageTowerCount = mageTowerCount + 1
	elseif lastCreatedUnitName() == 'castle' then
		castleCount = castleCount + 1
	end
end

function unitDied()
	if lastDeadUnitName() == 'mage_tower' then
		mageTowerCount = mageTowerCount - 1
	elseif lastDeadUnitName() == 'castle' then
		castleCount = castleCount - 1
	end
	if mageTowerCount == 0 or (lastDeadUnit() == golemID and golemArrived == 0) then
		if golemArrived == 0 then
			showMessage ( 'GolemDestroyed', 'Golem Escort' )
		end
		setPlayerAsWinner(tech1)
		setPlayerAsWinner(tech2)
		endGame()
	elseif castleCount == 0 then
		setPlayerAsWinner(magicHuman)
		setPlayerAsWinner(magicAlly)
		endGame()
	end
end
