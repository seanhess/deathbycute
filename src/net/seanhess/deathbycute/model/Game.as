package net.seanhess.deathbycute.model
{
	import mx.collections.ArrayCollection;
	
	import net.seanhess.deathbycute.test.MockData;
	
	[Bindable]
	public class Game
	{
		public var characters:ArrayCollection;
		public var players:ArrayCollection;
		
		public var currentPlayer:Player = new Player();
		
		public function set mockData(value:MockData):void
		{
			this.characters = value.characters;
			this.players = value.players;
			this.currentPlayer = value.currentPlayer;
		}
	}
}