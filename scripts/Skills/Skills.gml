
// Skill Interface
function ISkill(_owner) : constructor {
	
	owner = _owner;
	
	// Skill effect target {ID}
	targets  = [];
	
	// Skill invoke event {EventType}
	eventID = undefined;
	
	// Action {Action}
	actions = [];
	
	ignoreSkills = [{}];
}

function AllIn() : ISkill(_owner) {
	// Not Implemented
	
	owner = _owner;
	
	targets = [Target.OPPONENT];
	
	eventID = global.EVENT_TYPE.ON_DAMAGE_DEALT;
	
	actions = [
		new DealDamage(targets, owner.damage)
	]
	
	ignoreSkills = [{}];
	
	
}

function ArcanePower() : ISkill {
	// Not Implemented
}

function Barrage() : ISkill {
	// Not Implemented
}

function Batter() : ISkill {
	// Not Implemented
}

function Bombardment() : ISkill {
	// Not Implemented
}