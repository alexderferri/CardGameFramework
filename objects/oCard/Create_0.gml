/// @description Initialize Card


// This variable holds the card's data
cardData = undefined;

// Card Owner ID
owner    = undefined;

// Card Data
enum AttackType {
	MELEE,
	RANGED,
	MAGIC,
	RANDOM_DMG,
	HEAL,
	HEAL_GROUP
}

enum CardFaction {
	 CHAOS,
	 NATURE,
	 BALANCE,
	 FORTUNE,
	 WAR
}

function CardData(_initData = {} /*Struct|JSON*/) constructor {
	
	// ============== Constructor ===============
	
	// Faction {CardFaction}
	faction        = _initData.faction ?? CardFaction.NATURE;
	
	// Card's HP {int}
	HP             = _initData.HP ?? 5;  
	
	// Attack Type {AttackType}
	attackType     = _initData.attackType ?? AttackType.MELEE;
	
	// Attack Modifier {modifier struct}
	attackModifier = _initData.attackModifier ?? {};
	
	// Skills {ISkill struct}
	skills         = _initData.skills ?? [{}];
	
	// Armor {armor struct}
	armor          = _initData.armor ?? {};
	

}





