package net.seanhess.deathbycute.model
{
	import assets.Other;
	
	import flash.geom.Point;
	
	[Bindable]
	public class Token
	{
		public static const LINEAR:String = "linear";
		public static const CIRCULAR:String = "circular";
		public static const ERRATIC:String = "erratic";
		
		public var image:Class = Other.CIRCLE;
		public var location:Point = new Point(0, 0);
		public var desintation:Point = null;
		public var moving:Boolean = false;
		
		public var movement:String = LINEAR;
		
		public function Token(image:Class=null)
		{
			this.image = image;
		}
	}
}