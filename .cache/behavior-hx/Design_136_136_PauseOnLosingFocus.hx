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
import box2D.collision.shapes.B2Shape;

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



class Design_136_136_PauseOnLosingFocus extends SceneScript
{
	public var _PauseControl:String;
	public var _DimScreen:Bool;
	public var _DimmingOpacity:Float;
	public var _DimmingColor:Int;
	public var _FocusLost:Bool;
	public var _PausedText:String;
	public var _Font:Font;
	
	/* ============================ Focus ============================= */
	public function _event_Focus(lost:Bool):Void
	{
		if(wrapper.enabled && lost)
		{
			_FocusLost = true;
			setVolumeForAllSounds(0/100);
			engine.pause();
		}
	}
	/* ============================ Click ============================= */
	public function _event_Click():Void
	{
		if(wrapper.enabled && true)
		{
			if((engine.isPaused() && _FocusLost))
			{
				engine.unpause();
				setVolumeForAllSounds((Engine.engine.getGameAttribute("volume") : Float)/100);
			}
			_FocusLost = false;
		}
	}
	/* =========================== Keyboard =========================== */
	public function _event_Keyboard(pressed:Bool, released:Bool):Void
	{
		if(wrapper.enabled && released)
		{
			if(!(engine.isPaused()))
			{
				setVolumeForAllSounds((Engine.engine.getGameAttribute("volume") : Float)/100);
				engine.unpause();
			}
			else
			{
				setVolumeForAllSounds(0/100);
				engine.pause();
			}
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if((engine.isPaused() && _FocusLost))
			{
				if(_DimScreen)
				{
					g.fillColor = Utils.convertColor(_DimmingColor);
					g.alpha = (_DimmingOpacity/100);
					g.fillRect(0, 0, getScreenWidth(), getScreenHeight());
				}
				if(((_PausedText).length > 0))
				{
					g.setFont(_Font);
					g.drawString(_PausedText, ((getScreenWidth() - g.font.getTextWidth(_PausedText)/Engine.SCALE) / 2), ((getScreenHeight() - g.font.getHeight()/Engine.SCALE) / 2));
				}
			}
		}
	}
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Pause Control", "_PauseControl");
		nameMap.set("Dim Screen", "_DimScreen");
		_DimScreen = true;
		nameMap.set("Dimming Opacity", "_DimmingOpacity");
		_DimmingOpacity = 50.0;
		nameMap.set("Dimming Color", "_DimmingColor");
		_DimmingColor = Utils.getColorRGB(0,0,0);
		nameMap.set("Focus Lost", "_FocusLost");
		_FocusLost = false;
		nameMap.set("Paused Text", "_PausedText");
		_PausedText = "Paused";
		nameMap.set("Font", "_Font");
		
	}
	
	override public function init()
	{
		
		
		addListener(engine.whenFocusChanged, _event_Focus);
		addListener(engine.whenMouseReleased, _event_Click);
		addListener(engine.whenKeyPressedEvents.getOrCreateEvent(_PauseControl), _event_Keyboard);
		addListener(engine.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}