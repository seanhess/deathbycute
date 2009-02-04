package net.seanhess.deathbycute.model
{
	import assets.Weapons;
	
	public class Weapon extends Token
	{
		public var owner:Character;
	
		public static const BUG:Weapon = new Weapon(Weapons.BUG);
		public static const GEM:Weapon = new Weapon(Weapons.GEM);
	}
}