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



class ActorEvents_16 extends ActorScript
{
	public var _coins:Float;
	
	/* ========================= Type & Type ========================== */
	public function _event_TypeType(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	/* ========================= Type & Type ========================== */
	public function _event_TypeTypeCopy(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	/* ========================= Type & Type ========================== */
	public function _event_TypeTypeCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	/* ========================= Type & Type ========================== */
	public function _event_TypeTypeCopyCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	/* ========================= Type & Type ========================== */
	public function _event_TypeTypeCopyCopyCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	/* ========================= Type & Type ========================== */
	public function _event_TypeTypeCopyCopyCopyCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("cooldown") : Bool) == false))
			{
				actor.setY(randomInt(30, 674));
				actor.setX(randomInt(30, 1250));
			}
			runLater(1000 * 0.0001, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("cooldown", true);
				runLater(1000 * 0.1, function(timeTask:TimedTask):Void
				{
					Engine.engine.setGameAttribute("cooldown", false);
				}, actor);
			}, actor);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("coins", "_coins");
		_coins = 0.0;
		
	}
	
	override public function init()
	{
		/* ======================== When Creating ========================= */
		actor.setY(randomInt(30, 674));
		actor.setX(randomInt(30, 1250));
		
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(14).ID, getActorType(16).ID, _event_TypeType);
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(160).ID, getActorType(16).ID, _event_TypeTypeCopy);
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(166).ID, getActorType(16).ID, _event_TypeTypeCopyCopy);
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(168).ID, getActorType(16).ID, _event_TypeTypeCopyCopyCopy);
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(195).ID, getActorType(16).ID, _event_TypeTypeCopyCopyCopyCopy);
		addListenerWithKey2(engine.whenCollidedEvents, getActorType(199).ID, getActorType(16).ID, _event_TypeTypeCopyCopyCopyCopyCopy);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}