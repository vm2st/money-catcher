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



class ActorEvents_187 extends ActorScript
{
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			Engine.engine.setGameAttribute("skinsh", ((Engine.engine.getGameAttribute("skinsh") : Float) + 1));
			if(((Engine.engine.getGameAttribute("skinsh") : Float) == 3))
			{
				Engine.engine.setGameAttribute("skinsh", 0);
			}
			if(((Engine.engine.getGameAttribute("skinsh") : Float) == 0))
			{
				createRecycledActor(getActorType(191), 518, 90, Script.MIDDLE);
				createRecycledActor(getActorType(207), 453, 585, Script.FRONT);
			}
			if(((Engine.engine.getGameAttribute("skinsh") : Float) == 1))
			{
				createRecycledActor(getActorType(183), 518, 90, Script.MIDDLE);
				createRecycledActor(getActorType(185), 453, 585, Script.FRONT);
			}
			if(((Engine.engine.getGameAttribute("skinsh") : Float) == 2))
			{
				createRecycledActor(getActorType(203), 518, 90, Script.MIDDLE);
				createRecycledActor(getActorType(205), 453, 585, Script.FRONT);
			}
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(isKeyReleased("right"))
			{
				Engine.engine.setGameAttribute("skinsh", ((Engine.engine.getGameAttribute("skinsh") : Float) + 1));
				if(((Engine.engine.getGameAttribute("skinsh") : Float) == 3))
				{
					Engine.engine.setGameAttribute("skinsh", 0);
				}
				if(((Engine.engine.getGameAttribute("skinsh") : Float) == 0))
				{
					createRecycledActor(getActorType(191), 518, 90, Script.MIDDLE);
					createRecycledActor(getActorType(207), 453, 585, Script.FRONT);
				}
				if(((Engine.engine.getGameAttribute("skinsh") : Float) == 1))
				{
					createRecycledActor(getActorType(183), 518, 90, Script.MIDDLE);
					createRecycledActor(getActorType(185), 453, 585, Script.FRONT);
				}
				if(((Engine.engine.getGameAttribute("skinsh") : Float) == 2))
				{
					createRecycledActor(getActorType(203), 518, 90, Script.MIDDLE);
					createRecycledActor(getActorType(205), 453, 585, Script.FRONT);
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
		
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenUpdated, _event_Updating);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}