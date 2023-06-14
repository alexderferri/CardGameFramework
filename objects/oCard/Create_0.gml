/// @description Initialize Card


// This variable holds the card's data
cardData = undefined;

// Card Owner ID
owner    = undefined;



function TakeDamage(_amount) {
	
	assert_greater_than_or_equal(_amount, 0, "Damage cannot be negative.");
	
	
	if (_amount >= 0) {
		// Take Damage and calculate HP
		cardData.HP = max(cardData.HP - _amount, 0);
		
		return true;
		
	} else {
		return false;
	}

}

function Heal(_amount) {
	
	assert_greater_than_or_equal(_amount, 0, "Heal amount cannot be negative.");
	
	if (_amount >= 0) {
		// Heal and calculate HP
		cardData.HP += _amount;
		
		return true;
		
	} else {
		return false;
	}
	
}
