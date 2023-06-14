
// Skill Interface
function ISkill(_owner) constructor {
	
	owner = _owner;
	
	// Skill effect target {ID}
	targets  = [];
	
	// Skill invoke event {EventType}
	eventID = undefined;
	
	// Action {Action}
	actions = [];
	
	ignoreSkills = [{}];
}


function AllIn(_owner) : ISkill(_owner) constructor {
	
	owner = _owner;
	
	targets = [Target.OPPONENT];
	
	eventID = global.EVENT_TYPE.ON_DAMAGE_DEALT;
	
	actions = [
		new DealDamage(targets, owner.damage)
	]
	
	ignoreSkills = [{}];
	
	
}

function ArcanePower(_owner) : ISkill(_owner) constructor {
	// Not Implemented
}

function Barrage(_owner) : ISkill(_owner)  constructor {
	// Not Implemented
}

function Batter(_owner) : ISkill(_owner)  constructor {
	// Not Implemented
}

function Bombardment(_owner) : ISkill(_owner)  constructor {
	// Not Implemented
}