package net.seanhess.deathbycute.model
{
	import assets.Weapons;
	
	public class Character extends Token
	{
		public static const ALIVE:String = "alive";
		public static const DEAD:String = "dead";
		
		public function Character()
		{
			this.weapon = new Weapon(Weapons.GEM);
			this.state = ALIVE;
		}
		
		public function get active():Boolean 
		{
			return (state == ALIVE);
		}
		
		public var firing:Weapon;
		
		public function set weapon(value:Weapon):void
		{
			_weapon = value;
			_weapon.owner = this;
		}
		
		public function get weapon():Weapon
		{
			return _weapon;	
		}
		
		protected var _weapon:Weapon;
	}
}