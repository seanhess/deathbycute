package net.seanhess.deathbycute.control
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import net.seanhess.deathbycute.model.Character;
	import net.seanhess.deathbycute.view.render.TokenView;
	
	[Event("collision")]
	public class Collisions extends EventDispatcher
	{
		public var views:Dictionary;
		public var character:Character;
		
		[Bindable]
		public var collided:Character;
		
		public function test():void
		{
			if (views && character && character.firing)
			{
				for (var token:Object in views)
				{
					if (token is Character && token != character)
					{
						var weaponView:TokenView = views[character.firing];
						var otherCharacterToken:TokenView = views[token];
						
						if (weaponView && otherCharacterToken && weaponView.hitTestObject(otherCharacterToken))
							collide(token as Character);
					}
				}
			}
		}
		
		public function collide(character:Character):void
		{
			collided = character;
			dispatchEvent(new Event("collision"));
		}
		
	}
}