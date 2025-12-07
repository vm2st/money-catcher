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



class ActorEvents_140 extends ActorScript
{
	
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if((actor.getX() < 169))
			{
				actor.setX(169);
			}
			if((actor.getX() > 305))
			{
				actor.setX(305);
			}
			if((getMouseY() >= 65))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", true);
			}
			if((getMouseX() >= 169))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", true);
			}
			if((getMouseY() >= 140))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", false);
			}
			if((getMouseX() >= 383))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", false);
			}
			if((getMouseX() < 169))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", false);
			}
			if((getMouseY() < 65))
			{
				Engine.engine.setGameAttribute("mouseisinmusic", false);
			}
			if(((Engine.engine.getGameAttribute("mouseisinmusic") : Bool) == true))
			{
				if(isMouseDown())
				{
					actor.setX((getMouseX() - 40));
					if((actor.getX() < 169))
					{
						actor.setX(169);
					}
					if((actor.getX() > 305))
					{
						actor.setX(305);
					}
				}
			}
			if(((Engine.engine.getGameAttribute("mouseisinmusic") : Bool) == false))
			{
				
			}
			if(isMouseReleased())
			{
				actor.setAnimation("0");
			}
			if(((actor.getX() >= 169) && (actor.getX() <= 182)))
			{
				setVolumeForAllSounds(0/100);
				Engine.engine.setGameAttribute("volume", 0);
			}
			if(((actor.getX() >= 183) && (actor.getX() <= 195)))
			{
				setVolumeForAllSounds(10/100);
				Engine.engine.setGameAttribute("volume", 10);
			}
			if(((actor.getX() >= 196) && (actor.getX() <= 209)))
			{
				setVolumeForAllSounds(20/100);
				Engine.engine.setGameAttribute("volume", 20);
			}
			if(((actor.getX() >= 210) && (actor.getX() <= 222)))
			{
				setVolumeForAllSounds(30/100);
				Engine.engine.setGameAttribute("volume", 30);
			}
			if(((actor.getX() >= 223) && (actor.getX() <= 236)))
			{
				setVolumeForAllSounds(40/100);
				Engine.engine.setGameAttribute("volume", 40);
			}
			if(((actor.getX() >= 237) && (actor.getX() <= 250)))
			{
				setVolumeForAllSounds(50/100);
				Engine.engine.setGameAttribute("volume", 50);
			}
			if(((actor.getX() >= 251) && (actor.getX() <= 263)))
			{
				setVolumeForAllSounds(60/100);
				Engine.engine.setGameAttribute("volume", 60);
			}
			if(((actor.getX() >= 264) && (actor.getX() <= 277)))
			{
				setVolumeForAllSounds(70/100);
				Engine.engine.setGameAttribute("volume", 70);
			}
			if(((actor.getX() >= 278) && (actor.getX() <= 290)))
			{
				setVolumeForAllSounds(80/100);
				Engine.engine.setGameAttribute("volume", 80);
			}
			if(((actor.getX() >= 291) && (actor.getX() <= 300)))
			{
				setVolumeForAllSounds(90/100);
				Engine.engine.setGameAttribute("volume", 90);
			}
			if(((actor.getX() >= 301) && (actor.getX() <= 305)))
			{
				setVolumeForAllSounds(100/100);
				Engine.engine.setGameAttribute("volume", 100);
			}
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			g.drawString("" + Engine.engine.getGameAttribute("volume"), 27, 15);
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			if(((Engine.engine.getGameAttribute("volume") : Float) == 0))
			{
				actor.setX(169);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 10))
			{
				actor.setX(183);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 20))
			{
				actor.setX(196);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 30))
			{
				actor.setX(210);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 40))
			{
				actor.setX(223);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 50))
			{
				actor.setX(237);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 60))
			{
				actor.setX(251);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 70))
			{
				actor.setX(264);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 80))
			{
				actor.setX(278);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 90))
			{
				actor.setX(291);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 100))
			{
				actor.setX(305);
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor2(mouseState:Int):Void
	{
		if(wrapper.enabled && 3 == mouseState)
		{
			actor.setAnimation("1");
		}
	}
	/* ======================= After N seconds ======================== */
	public function _event_AfterNsecs(timeTask:TimedTask):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("volume") : Float) == 0))
			{
				actor.setX(169);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 10))
			{
				actor.setX(183);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 20))
			{
				actor.setX(196);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 30))
			{
				actor.setX(210);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 40))
			{
				actor.setX(223);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 50))
			{
				actor.setX(237);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 60))
			{
				actor.setX(251);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 70))
			{
				actor.setX(264);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 80))
			{
				actor.setX(278);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 90))
			{
				actor.setX(291);
			}
			if(((Engine.engine.getGameAttribute("volume") : Float) == 100))
			{
				actor.setX(305);
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
		addListener(actor.whenDrawing, _event_Drawing);
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenMousedOver, _event_OnActor2);
		runLater(1000 * 0, _event_AfterNsecs, actor);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}