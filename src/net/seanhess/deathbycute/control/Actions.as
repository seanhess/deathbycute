package net.seanhess.deathbycute.control
{
	import flash.geom.Point;
	
	import net.seanhess.deathbycute.model.Character;
	import net.seanhess.deathbycute.model.Weapon;
	
	/**
	 * Makes the changes necessary for user actions
	 */
	public class Actions
	{
		public var character:Character;
		
		public function move(location:Point):void
		{
			character.desintation = location;
		}
		
		public function shoot(location:Point):void
		{
			character.firing = character.weapon;
			character.firing.desintation = location; 
		}
	}
}