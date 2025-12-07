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



class ActorEvents_205 extends ActorScript
{
	
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(!((Engine.engine.getGameAttribute("skinsh") : Float) == 2))
			{
				recycleActor(actor);
			}
			if(!((Engine.engine.getGameAttribute("skin") : Float) == 2))
			{
				if(((Engine.engine.getGameAttribute("skins") : Array<Dynamic>)[1] == true))
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
					actor.setAnimation("buy");
				}
			}
			if(((Engine.engine.getGameAttribute("skin") : Float) == 2))
			{
				actor.setAnimation("equipped");
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			if(!((Engine.engine.getGameAttribute("skins") : Array<Dynamic>)[1] == true))
			{
				if(((Engine.engine.getGameAttribute("coins") : Float) >= 50))
				{
					Engine.engine.setGameAttribute("skin", 2);
					Engine.engine.setGameAttribute("coins", ((Engine.engine.getGameAttribute("coins") : Float) - 50));
					playSound(getSound(154));
					(Engine.engine.getGameAttribute("skins") : Array<Dynamic>)[1] = true;
					actor.setAnimation("equipped");
				}
				else
				{
					playSound(getSound(103));
					createRecycledActor(getActorType(213), 432, 325, Script.FRONT);
				}
			}
			else
			{
				if(!((Engine.engine.getGameAttribute("skin") : Float) == 2))
				{
					Engine.engine.setGameAttribute("skin", 2);
					actor.setAnimation("equipped");
				}
				else
				{
					playSound(getSound(103));
					createRecycledActor(getActorType(209), 427, 565, Script.FRONT);
				}
			}
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenUpdated, _event_Updating);
		addListener(actor.whenMousedOver, _event_OnActor);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}