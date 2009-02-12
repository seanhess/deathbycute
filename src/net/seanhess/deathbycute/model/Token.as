package net.seanhess.deathbycute.model
{
	import assets.Other;
	
	import flash.geom.Point;
	
	import mx.core.IUID;
	
	[Bindable]
	public class Token implements IUID
	{
		public static const LINEAR:String = "linear";
		public static const CIRCULAR:String = "circular";
		public static const ERRATIC:String = "erratic";
		
		public static const NONE:String = "none";
		
		public var state:String = NONE;
		
		public var uid:String = Math.random().toString();
		
		public var image:String = Images.CIRCLE_PATH;
		public var location:Point = new Point(0, 0);
		public var destination:Point = null;
		public var moving:Boolean = false;
		
		public var movement:String = LINEAR;
	}
}