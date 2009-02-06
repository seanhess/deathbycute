package net.seanhess.deathbycute.model
{
	import mx.collections.ArrayCollection;
	
	import net.seanhess.deathbycute.test.MockData;
	
	[Bindable]
	public class Game
	{
		public var players:ArrayCollection = new ArrayCollection()
		public var tokens:ArrayCollection = new ArrayCollection();

		public function set currentPlayer(value:Player):void
		{
			if (_player && tokens.contains(_player.character))
				tokens.removeItemAt(tokens.getItemIndex(_player.character));

			_player = value;	
			
			tokens.addItem(_player.character);
		}
		
		public function get currentPlayer():Player
		{
			return _player;
		}
		
		private var _player:Player;
		
		public function set mockData(value:MockData):void
		{
			this.tokens = value.tokens;
			this.players = value.players;
//			this.currentPlayer = value.currentPlayer;
		}
	}
}