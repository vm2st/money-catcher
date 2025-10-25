package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.filters.BitmapFilter;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class ActorEvents_33 extends ActorScript
{
	public var _ActivatedPressedAnimation:String;
	public var _Activated:Bool;
	public var _PressedAnimation:String;
	public var _Down:Bool;
	public var _music:Float;
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 3 == mouseState)
		{
			Engine.engine.setGameAttribute("music", 0);
			runLater(1000 * 1, function(timeTask:TimedTask):Void
			{
				recycleActor(actor);
			}, actor);
		}
	}
	/* ============================ Click ============================= */
	public function _event_Click():Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("music") : Float) == 0))
			{
				createRecycledActor(getActorType(59), 310, 66, Script.FRONT);
			}
			if(((Engine.engine.getGameAttribute("music") : Float) == 1))
			{
				createRecycledActor(getActorType(33), 310, 66, Script.FRONT);
			}
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			g.drawString("" + Engine.engine.getGameAttribute("music"), 100, 100);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Activated Pressed Animation", "_ActivatedPressedAnimation");
		_ActivatedPressedAnimation = "";
		nameMap.set("Activated", "_Activated");
		_Activated = false;
		nameMap.set("Pressed Animation", "_PressedAnimation");
		_PressedAnimation = "";
		nameMap.set("Down", "_Down");
		_Down = false;
		nameMap.set("music", "_music");
		_music = 0.0;
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(engine.whenMousePressed, _event_Click);
		addListener(actor.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}