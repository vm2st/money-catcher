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



class ActorEvents_78 extends ActorScript
{
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 3 == mouseState)
		{
			Engine.engine.setGameAttribute("background", ((Engine.engine.getGameAttribute("background") : Float) - 1));
			
			
			
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("background") : Float) > 1.1))
			{
				Engine.engine.setGameAttribute("background", -1);
			}
			if(((Engine.engine.getGameAttribute("background") : Float) < -1.1))
			{
				Engine.engine.setGameAttribute("background", 1);
			}
			if(((Engine.engine.getGameAttribute("background") : Float) == 1))
			{
				createRecycledActor(getActorType(83), 0, 0, Script.MIDDLE);
				createRecycledActor(getActorType(95), 453, 585, Script.FRONT);
			}
			if(((Engine.engine.getGameAttribute("background") : Float) == -1))
			{
				createRecycledActor(getActorType(104), 0, 0, Script.MIDDLE);
				createRecycledActor(getActorType(97), 453, 585, Script.FRONT);
			}
			if(((Engine.engine.getGameAttribute("background") : Float) == 0))
			{
				createRecycledActor(getActorType(74), 453, 585, Script.FRONT);
			}
			if(isKeyReleased("left"))
			{
				Engine.engine.setGameAttribute("background", ((Engine.engine.getGameAttribute("background") : Float) - 1));
			}
			setVolumeForChannel(100/100, 2);
			setVolumeForChannel(75/100, 3);
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			g.drawString("" + Engine.engine.getGameAttribute("coins"), 1210, -345);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenUpdated, _event_Updating);
		addListener(actor.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}