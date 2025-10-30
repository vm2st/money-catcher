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
	public var _minDown:Float;
	public var _minLeft:Float;
	public var _minRght:Float;
	public var _minUp:Float;
	
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(isMouseDown())
			{
				if((actor.getY() < _minUp))
				{
					Engine.engine.setGameAttribute("up", 1);
				}
				else
				{
					Engine.engine.setGameAttribute("up", 0);
				}
				if((actor.getY() > _minDown))
				{
					Engine.engine.setGameAttribute("down", 1);
				}
				else
				{
					Engine.engine.setGameAttribute("down", 0);
				}
				if((actor.getX() < _minLeft))
				{
					Engine.engine.setGameAttribute("left", 1);
				}
				else
				{
					Engine.engine.setGameAttribute("left", 0);
				}
				if((actor.getX() > _minRght))
				{
					Engine.engine.setGameAttribute("right", 1);
				}
				else
				{
					Engine.engine.setGameAttribute("right", 0);
				}
			}
			if(((Engine.engine.getGameAttribute("pause") : Float) == 1))
			{
				recycleActor(actor);
			}
		}
	}
	/* ============================ Click ============================= */
	public function _event_Click():Void
	{
		if(wrapper.enabled && true)
		{
			Engine.engine.setGameAttribute("up", 0);
			Engine.engine.setGameAttribute("down", 0);
			Engine.engine.setGameAttribute("left", 0);
			Engine.engine.setGameAttribute("right", 0);
			Engine.engine.setGameAttribute("izdrgng", false);
			removeRegion(getLastCreatedRegion().getID());
			recycleActor(actor);
		}
	}
	/* ========================== On Region =========================== */
	public function _event_OnRegion(mouseState:Int):Void
	{
		if(wrapper.enabled && 4 == mouseState)
		{
			actor.setXCenter(getMouseX());
			actor.setYCenter(getMouseY());
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("devmode") : Bool) == true))
			{
				g.drawString("" + _minUp, 50, 50);
				g.drawString("" + _minDown, 50, 60);
				g.drawString("" + _minLeft, 50, 70);
				g.drawString("" + _minRght, 50, 80);
				g.drawString("" + Engine.engine.getGameAttribute("izdrgng"), 50, 90);
			}
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("minDown", "_minDown");
		_minDown = 0.0;
		nameMap.set("minLeft", "_minLeft");
		_minLeft = 0.0;
		nameMap.set("minRght", "_minRght");
		_minRght = 0.0;
		nameMap.set("minUp", "_minUp");
		_minUp = 0.0;
		
	}
	
	override public function init()
	{
		/* ======================== When Creating ========================= */
		createCircularRegion((actor.getX() - 176), (actor.getY() - 176), 200);
		createRecycledActor(getActorType(39), (actor.getX() - 102), (actor.getY() - 101), Script.FRONT);
		_minDown = (actor.getY() + 30);
		_minLeft = (actor.getX() - 20);
		_minRght = (actor.getX() + 30);
		_minUp = (actor.getY() - 20);
		
		addListener(actor.whenUpdated, _event_Updating);
		addListener(engine.whenMouseReleased, _event_Click);
		addListener(getLastCreatedRegion().whenMousedOver, _event_OnRegion);
		addListener(actor.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}