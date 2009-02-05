package net.seanhess.deathbycute.control
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import net.seanhess.deathbycute.model.Character;
	import net.seanhess.deathbycute.model.Weapon;
	import net.seanhess.deathbycute.view.render.TokenView;
	
	[Event("collision")]
	[Event("block")]
	public class Collisions extends EventDispatcher
	{
		public var views:Dictionary;
		public var character:Character;
		
		[Bindable]
		public var collided:Character;
		
		[Bindable]
		public var blockedWeapon:Weapon;
		
		public function test():void
		{
			if (views && character && character.firing)
			{
				for (var token:Object in views)
				{
					if (character.firing == token)
						continue;

					var weaponView:TokenView = views[character.firing];
					var otherTokenView:TokenView = views[token];
						
					if (!weaponView || !otherTokenView)
						continue;
						
					if (!weaponView.hitTestObject(otherTokenView))
						continue;

					if (token is Character && token != character)
					{
						// collide with character
						collide(token as Character);
					}
								
					else if (token is Weapon)
					{
						// block both weapons
						block(token as Weapon);
						block(character.firing as Weapon);
					}
				}
			}
		}
		
		// the hit character
		public function collide(character:Character):void
		{
			collided = character;
			dispatchEvent(new Event("collision"));
		}
		
		// the blocked weapon
		public function block(weapon:Weapon):void
		{
			blockedWeapon = weapon;
			dispatchEvent(new Event("block"));
		}
		
	}
}