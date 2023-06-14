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
	
	// Name
	name           = _initData.name ?? "Undefined";
	
	// Cost
	cost           = _initData.cost ?? 1;
	
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
	
function DeckData() : IPersistanceData() constructor {
	
	cards = ds_list_create();
	
	static AddCard = function(_card = {}, _insertAsFirst = false) {
		
		assert_isnt_struct(_card, "Cannot add card to the deck as it is not a struct");
		
		// The card data is empty
		if (_card == {}) return false;
		
		
		// Insert the card in the deck (first or last?)
		if (_insertAsFirst) {
			ds_list_insert(cards, 0, _card);
		} else {
			ds_list_add(cards, _card);
		}
		
		
		return true;
		
	}
	
	
	static CardIsInDeck = function(_card) {
		
		return ds_list_find_index(cards, _card) > 0;
	}
	
	static IndexOfCard = function(_card) {
		
		return ds_list_find_index(_card, _card);
	}
	
	static Size = function() {
		
		return ds_list_size(cards);
	}
	
		
	
	static OnDestroy = function() {
		
		// Clear list data structure from memory
		if (ds_exists(cards, ds_type_list)) {
			ds_list_destroy(cards);
		}
		
	
	}
	
	Save = function() {
	
	}
	
	Load = function() {
		
	}

}
	
function Deck(_deckData = {}, _owner) constructor {
	
	assert_is_undefined(_owner, "The deck must have an owner");
	
	cards = ds_list_create();
	
	owner = _owner;
	
	static InitDeckFromData = function() {
		
		// Copy the deck data to the playable deck
		ds_list_copy(cards, _deckData.cards);
		
		// Shuffle the deck
		Shuffle();
	
	}
	
	static AddCard = function(_card = {}, _insertAsFirst = false) {
		
		assert_isnt_struct(_card, "Cannot add card to the deck as it is not a struct");
		
		// The card data is empty
		if (_card == {}) return false;
		
		
		// Insert the card in the deck (first or last?)
		if (_insertAsFirst) {
			ds_list_insert(cards, 0, _card);
		} else {
			ds_list_add(cards, _card);
		}
		
		
		return true;
		
	}
	
	static ShuffleDeck = function(_shuffles = 1) {
		
		repeat (_shuffles) {
			ds_list_shuffle(cards);
		}
	}
	
	static CardIsInDeck = function(_card) {
		
		return ds_list_find_index(cards, _card) > 0;
	}
	
	static IndexOfCard = function(_card) {
		
		return ds_list_find_index(_card, _card);
	}
	
	static Size = function() {
		
		return ds_list_size(cards);
	}
	
	static DrawCard = function() {
		
		// No more cards in the deck
		if (Size() <= 0) return false;
		
		// Get the card from the deck
		var _drawnCard = cards[| 0];
		
		// Remove the card from the deck
		ds_list_delete(cards, 0);
		
		// Create an instance of that card
		var _cardInstance = instance_create_layer(0, 0, "Instances", oCard);
		_cardInstance.cardData = new Card(_drawnCard);
		
		// Return the card
		return _cardInstance;
	}
	
	static DrawMultipleCards = function(_amount = 2) {
		
		// Not enough cards in the deck
		if (Size() < _amount) return false;
	
		
		// Get the cards from the deck
		var _drawnCards = [];
		
		for (var i = 0; i < _amount; i++) {
			
			// Create an instance of that card
			var _cardInstance = instance_create_layer(0, 0, "Instances", oCard);
			_cardInstance.cardData = new Card(_drawnCard);
			
			// Add the card to the return list
			array_push(_drawnCards, _cardInstance);
			
			// Remove the card from the deck
			ds_list_delete(cards, 0);
		}
		
		
		
		// Return the card
		return _drawnCards;
	}
		
	static OnDestroy = function() {
		
		// Clear list data structure from memory
		if (ds_exists(cards, ds_type_list)) {
			ds_list_destroy(cards);
		}
		
	
	}

}
	
function Hand(_maxSize = -1, _owner) {
	
	assert_is_undefined(_owner, "The hand must have an owner");
	
	cards = ds_list_create();
	maxSize = _maxSize;
	
	owner = _owner;
	
	static AddCard = function(_card) {
		
		assert_isnt_undefined(_card, "Cannot add card to the hand as it is undefined");
		
		if (maxSize != -1) {
			assert_greater_than(Size(), maxSize, "Cannot add more cards to the hand");
		}
		
		// The card data is empty
		if (_card == undefined) return false;
		
		
		// Add the card to the hand
		ds_list_add(cards, _card);
		
		
		
		return true;
	}
		
	static PlayCardByIndex = function(_index) {
		
		if (Size() <= 0) return undefined;
		
		
		var _card = ds_list_find_value(cards, _index);
		
		assert_isnt_undefined(_card, "The card you tried to play is undefined");
		
		if (_card) {
			
			with (_card) {
				// Play the card	
			}
			
		} 
		
		
		return _card;
	}
	
	static PlayCardByID = function(_card) {
		
		if (Size() <= 0) return undefined;
		
		
		var _cardLookingFor = ds_list_find_index(cards, _card);
		
		assert_isnt_undefined(_cardLookingFor, "The card you tried to play is undefined");
		
		if (_cardLookingFor) {
			
			with (_cardLookingFor) {
				// Play the card	
			}
			
		} 
		
		
		return _cardLookingFor;
		
	}
	
	static Size = function() {
		
		return ds_list_size(cards);
	}
	
	static OnDestroy = function() {
		
		if (ds_exists(cards, ds_type_list)) {
			ds_list_destroy(cards);
		}
	}
}