package net.seanhess.deathbycute.model
{
	import assets.Weapons;
	
	public class Character extends Token
	{
		public function Character()
		{
			this.weapon = new Weapon(Weapons.GEM);
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