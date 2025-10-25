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



class ActorEvents_41 extends ActorScript
{
	
	/* ========================== On Region =========================== */
	public function _event_OnRegion(mouseState:Int):Void
	{
		if(wrapper.enabled && 4 == mouseState)
		{
			actor.setXCenter(getMouseX());
			actor.setYCenter(getMouseY());
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if((actor.getY() <= 500))
			{
				Engine.engine.setGameAttribute("up", 1);
			}
			else
			{
				Engine.engine.setGameAttribute("up", 0);
			}
			if((actor.getY() >= 580))
			{
				Engine.engine.setGameAttribute("down", 1);
			}
			else
			{
				Engine.engine.setGameAttribute("down", 0);
			}
			if((actor.getX() <= 110))
			{
				Engine.engine.setGameAttribute("left", 1);
			}
			else
			{
				Engine.engine.setGameAttribute("left", 0);
			}
			if((actor.getX() >= 170))
			{
				Engine.engine.setGameAttribute("right", 1);
			}
			else
			{
				Engine.engine.setGameAttribute("right", 0);
			}
		}
	}
	/* ============================ Click ============================= */
	public function _event_Click():Void
	{
		if(wrapper.enabled && true)
		{
			actor.setX(132);
			actor.setY(519);
			Engine.engine.setGameAttribute("up", 0);
			Engine.engine.setGameAttribute("down", 0);
			Engine.engine.setGameAttribute("left", 0);
			Engine.engine.setGameAttribute("right", 0);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		/* ======================== When Creating ========================= */
		createCircularRegion(47, 435, 110);
		
		addListener(getLastCreatedRegion().whenMousedOver, _event_OnRegion);
		addListener(actor.whenUpdated, _event_Updating);
		addListener(engine.whenMouseReleased, _event_Click);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}