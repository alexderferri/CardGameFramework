/// @description Insert description here
// You can write your code in this editor



EventSubscribe(global.EVENT_TYPE.ON_DRAW_PHASE, function() {
	
	var _card = deck.DrawCard();
	hand.AddCard(_card);
	
});

// Create the card collection
myDeckData = new DeckData();
myDeckData.AddCard(global.CARD_DB[0]);

// Create the playable deck
deck = new Deck(myDeckData, id);
deck.InitDeckFromData();

// Create the Hand
hand = new Hand(-1, id);




