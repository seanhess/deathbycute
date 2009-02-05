package net.seanhess.deathbycute.control
{
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	
	import net.seanhess.deathbycute.model.Character;
	import net.seanhess.deathbycute.model.Token;
	import net.seanhess.deathbycute.model.Weapon;
	
	/**
	 * Makes the changes necessary for user actions and events
	 */
	public class Actions 
	{
		public var character:Character;
		public var tokens:ArrayCollection; 
		
		public function move(location:Point):void
		{
			if (character.active)
				character.desintation = new Point(location.x, location.y);
		}
		
		public function shoot(location:Point):void
		{
			// can only shoot 1 at a time //
			// When it removes itself, it is responsible for removing from the tokens thing? //
			if (character.active && !character.firing)
			{
				character.weapon.state = Token.NONE;
				character.firing = character.weapon;
				character.firing.location = new Point(character.location.x, character.location.y); // (Actually, I need it to start at the current spot) 
				character.firing.desintation = new Point(location.x, location.y);
				
				if (!tokens.contains(character.firing))
					tokens.addItem(character.firing);
			} 
		}
		
		public function kill(character:Character):void
		{
			// kill them // 
			character.state = Character.DEAD;
		}
		
		public function block(weapon:Weapon):void
		{
			weapon.state = Weapon.BLOCKED; // Yes? We really just want it to stop somehow
		}
	}
}