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



class ActorEvents_155 extends ActorScript
{
	public var _:Bool;
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 3 == mouseState)
		{
			if((_ == false))
			{
				actor.moveTo(729, 216, 0.5, Easing.quadOut);
				Engine.engine.setGameAttribute("BuDBuGASHKE", true);
			}
			if((_ == true))
			{
				actor.moveTo(1240, 216, 0.5, Easing.quadIn);
				Engine.engine.setGameAttribute("BuDBuGASHKE", false);
			}
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if((actor.getX() == 729))
			{
				_ = true;
				if(((Engine.engine.getGameAttribute("language") : String) == "ru"))
				{
					actor.setAnimation("2ru");
				}
				if(((Engine.engine.getGameAttribute("language") : String) == "en"))
				{
					actor.setAnimation("2en");
				}
			}
			if((actor.getX() == 1240))
			{
				_ = false;
				if(((Engine.engine.getGameAttribute("language") : String) == "ru"))
				{
					actor.setAnimation("1ru");
				}
				if(((Engine.engine.getGameAttribute("language") : String) == "en"))
				{
					actor.setAnimation("1en");
				}
			}
			Engine.engine.setGameAttribute("activeboostersXAXIS", actor.getX());
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("выдвинулось", "_");
		_ = false;
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenUpdated, _event_Updating);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}