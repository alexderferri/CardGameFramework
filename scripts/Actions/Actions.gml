// ====================== Abstract Class | Interface of an Action  ===========================
function IAction() constructor {};


// ================= Implementations of IAction ===============================


// DealDamage(targets, amount);
// targets { instance_id [] } - list of all the targets that will take damage
// amount  { int } - Amount of damage
function DealDamage(_targets = [], _amount) : IAction()  constructor{
	
	// Get the size of the targets list
	var _targetsCount = array_length(_targets);
	
	// Loop through all the targets list
	for (var i = 0; i < _targetsCount; i++) {
		
		// Get the card from the targets list
		var _card = _targets[i];
		
		// Test if the card is undefined
		assert_isnt_undefined(_card, "Cannot deal damage as card is undefined.");
		
		// Card is defined
		if (_card) {
			
			// Take Damage
			_card.TakeDamage(_amount);
		}
		
		
		
	}
	
	
}
	
// Heal(targets, amount);
// targets { instance_id [] } - list of all the targets that will heal
// amount  { int } - Amount of Heal	
function Heal(_targets = [], _amount) : IAction() constructor{
	
	// Get the size of the targets list
	var _targetsCount = array_length(_targets);
	
	// Loop through all the targets list
	for (var i = 0; i < _targetsCount; i++) {
		
		// Get the card from the targets list
		var _card = _targets[i];
		
		// Test if the card is undefined
		assert_isnt_undefined(_card, "Cannot heal as card is undefined.");
		
		// Card is defined
		if (_card) {
			
			// Heal
			_card.Heal(_amount);
		}
		
		
		
	}

}