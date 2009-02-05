package net.seanhess.deathbycute.control
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.effects.AnimateProperty;
	import mx.events.EffectEvent;
	
	import net.seanhess.deathbycute.model.Token;
	import net.seanhess.deathbycute.view.render.TokenView;
	
	/**
	 * Responsible for making sure that the tokens are all moving where they
	 * need to be moving.
	 * 
	 * 
	 */
	public class Movement
	{
		public var tokens:ArrayCollection;
		public var views:Dictionary;
		
		public function move():void
		{
			for each (var token:Token in tokens)
			{
				moveToken(token);
			}
		}
		
		// well, really, I just need to respond to any kind of change // 
		protected function moveToken(token:Token):void
		{
			if (!token.moving && token.desintation)
			{
				var view:TokenView = views[token];
				
				var animation:MoveAnimation = new MoveAnimation(view, token, token.location, token.desintation);
					animation.addEventListener(EffectEvent.EFFECT_END, onEnd);
					animation.play();
					
				token.moving = true;
			}			
		}
		
		protected function onEnd(event:Event):void
		{
			var animation:MoveAnimation = event.target as MoveAnimation;
			animation.token.moving = false;
 
			animation.token.desintation = null;
		}
	}
}

import mx.effects.AnimateProperty;
import flash.geom.Point;
import flash.events.EventDispatcher;
import mx.events.EffectEvent;
import flash.events.Event;
import net.seanhess.deathbycute.model.Token;

class MoveAnimation extends EventDispatcher
{
	public var x:AnimateProperty;
	public var y:AnimateProperty;
	public var token:Token;
	
	public function MoveAnimation(target:Object, token:Token, start:Point, end:Point)
	{
		this.token = token;
		
		x = new AnimateProperty();
		x.target = target;
		x.property = "x";
		x.fromValue = start.x;
		x.toValue = end.x;
		x.addEventListener(EffectEvent.EFFECT_END, onEnd);
		
		y = new AnimateProperty();
		y.target = target;
		y.property = "y";
		y.fromValue = start.y;
		y.toValue = end.y;
	}
	
	protected function onEnd(event:Event):void
	{
		dispatchEvent(event);
	}
	
	public function play():void
	{
		x.play();
		y.play();
	}
	
	public function stop():void
	{
		x.stop();
		y.stop();
	}
}