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



class ActorEvents_95 extends ActorScript
{
	public var _buy:Bool;
	public var _buy1:Bool;
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			if(!((Engine.engine.getGameAttribute("backgrounds") : Array<Dynamic>)[0] == true))
			{
				if(((Engine.engine.getGameAttribute("coins") : Float) > 49.9))
				{
					if((_buy1 == true))
					{
						Engine.engine.setGameAttribute("c", (Engine.engine.getGameAttribute("coins") : Float));
						runLater(1000 * 0.1, function(timeTask:TimedTask):Void
						{
							Engine.engine.setGameAttribute("coins", ((Engine.engine.getGameAttribute("coins") : Float) - 50));
							playSoundOnChannel(getSound(154), 3);
							_buy = true;
							Engine.engine.setGameAttribute("backgroundglobal", 1);
							Engine.engine.setGameAttribute("nosound", true);
							runLater(1000 * 1, function(timeTask:TimedTask):Void
							{
								Engine.engine.setGameAttribute("nosound", false);
							}, actor);
							(Engine.engine.getGameAttribute("backgrounds") : Array<Dynamic>)[0] = true;
						}, actor);
					}
				}
			}
			else
			{
				if(!((Engine.engine.getGameAttribute("backgroundglobal") : Float) == 1))
				{
					Engine.engine.setGameAttribute("backgroundglobal", 1);
					actor.setAnimation("equipped");
				}
			}
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(!((Engine.engine.getGameAttribute("background") : Float) == 1))
			{
				recycleActor(actor);
			}
			runPeriodically(1000 * 0.5, function(timeTask:TimedTask):Void
			{
				recycleActor(actor);
			}, actor);
			if((_buy == true))
			{
				Engine.engine.setGameAttribute("coins", ((Engine.engine.getGameAttribute("c") : Float) - 50));
				_buy = false;
			}
			if(!((Engine.engine.getGameAttribute("backgrounds") : Array<Dynamic>)[0] == true))
			{
				actor.setAnimation("buy");
			}
			else
			{
				if(!((Engine.engine.getGameAttribute("backgroundglobal") : Float) == 1))
				{
					if(((Engine.engine.getGameAttribute("language") : String) == "ru"))
					{
						actor.setAnimation("equipru");
					}
					if(((Engine.engine.getGameAttribute("language") : String) == "en"))
					{
						actor.setAnimation("equipen");
					}
				}
				else
				{
					actor.setAnimation("equipped");
				}
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor2(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			if(!((Engine.engine.getGameAttribute("backgrounds") : Array<Dynamic>)[0] == true))
			{
				if(((Engine.engine.getGameAttribute("coins") : Float) < 49.9))
				{
					if(((Engine.engine.getGameAttribute("nosound") : Bool) == false))
					{
						playSoundOnChannel(getSound(103), 2);
						createRecycledActor(getActorType(213), 421, 533, Script.FRONT);
					}
				}
			}
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("buy", "_buy");
		_buy = false;
		nameMap.set("buy1", "_buy1");
		_buy1 = true;
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenUpdated, _event_Updating);
		addListener(actor.whenMousedOver, _event_OnActor2);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}