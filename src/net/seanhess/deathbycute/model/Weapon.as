package net.seanhess.deathbycute.model
{
	import assets.Weapons;
	
	public class Weapon extends Token
	{
		public static const BLOCKED:String = "blocked";
		
		public var owner:Character;
	
		public function Weapon(image:Class=null)
		{
			super(image);
		}
	}
}