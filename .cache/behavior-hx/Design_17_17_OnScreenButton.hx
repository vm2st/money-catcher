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



class Design_17_17_OnScreenButton extends ActorScript
{
	public var _NormalAnimation:String;
	public var _PressedAnimation:String;
	public var _Control:String;
	public var _ShowOnlyinMobileGames:Bool;
	public var _Down:Bool;
	public var _AllowSlide:Bool;
	public var _HoverAnimation:String;
	public var _TouchingIDs:Array<Dynamic>;
	public var _OnSelf:Bool;
	public var _WasTouching:Bool;
	public var _EnableMultiTouch:Bool;
	public var _ButtonName:String;
	
	/* =========================== On Actor =========================== */
	public function _event_OnActor(mouseState:Int):Void
	{
		if(wrapper.enabled && 3 == mouseState)
		{
			if(!((_EnableMultiTouch && #if mobile true #else false #end)))
			{
				simulateKeyPress(_Control);
				actor.setAnimation(_PressedAnimation);
				_Down = true;
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor2(mouseState:Int):Void
	{
		if(wrapper.enabled && 5 == mouseState)
		{
			if(!((_EnableMultiTouch && #if mobile true #else false #end)))
			{
				if(_Down)
				{
					simulateKeyRelease(_Control);
					if(#if mobile true #else false #end)
					{
						actor.setAnimation(_NormalAnimation);
					}
					else
					{
						actor.setAnimation(_HoverAnimation);
					}
					_Down = false;
				}
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor3(mouseState:Int):Void
	{
		if(wrapper.enabled && 1 == mouseState)
		{
			if(!((_EnableMultiTouch && #if mobile true #else false #end)))
			{
				if((_AllowSlide && isMouseDown()))
				{
					simulateKeyPress(_Control);
					actor.setAnimation(_PressedAnimation);
					_Down = true;
				}
				else
				{
					actor.setAnimation(_HoverAnimation);
				}
			}
		}
	}
	/* =========================== On Actor =========================== */
	public function _event_OnActor4(mouseState:Int):Void
	{
		if(wrapper.enabled && -1 == mouseState)
		{
			if(!((_EnableMultiTouch && #if mobile true #else false #end)))
			{
				if((_AllowSlide && _Down))
				{
					simulateKeyRelease(_Control);
				}
				actor.setAnimation(_NormalAnimation);
				_Down = false;
			}
		}
	}
	/* ========================= Multi-Touch ========================== */
	public function _event_MultiTouch(event:TouchEvent):Void
	{
		if(wrapper.enabled && true)
		{
			if(_EnableMultiTouch)
			{
				_TouchingIDs = (touchMap.get(_ButtonName) : Array<Dynamic>);
				_TouchingIDs.remove((event.touchPointID));
				_OnSelf = ((((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) > actor.getX()) && ((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) < (actor.getX() + (actor.getWidth())))) && (((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) > actor.getY()) && ((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) < (actor.getY() + (actor.getHeight())))));
				if(_OnSelf)
				{
					simulateKeyPress(_Control);
					actor.setAnimation(_PressedAnimation);
					_TouchingIDs.push((event.touchPointID));
				}
			}
		}
	}
	/* ========================= Multi-Touch ========================== */
	public function _event_MultiTouch2(event:TouchEvent):Void
	{
		if(wrapper.enabled && true)
		{
			if(_EnableMultiTouch)
			{
				_TouchingIDs = (touchMap.get(_ButtonName) : Array<Dynamic>);
				_OnSelf = ((((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) > actor.getX()) && ((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) < (actor.getX() + (actor.getWidth())))) && (((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) > actor.getY()) && ((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) < (actor.getY() + (actor.getHeight())))));
				_WasTouching = Utils.contains(_TouchingIDs, (event.touchPointID));
				if(((_OnSelf && !(_WasTouching)) && _AllowSlide))
				{
					simulateKeyPress(_Control);
					actor.setAnimation(_PressedAnimation);
					_TouchingIDs.push((event.touchPointID));
				}
				else if((!(_OnSelf) && _WasTouching))
				{
					if(_AllowSlide)
					{
						simulateKeyRelease(_Control);
					}
					actor.setAnimation(_NormalAnimation);
					_TouchingIDs.remove((event.touchPointID));
				}
			}
		}
	}
	/* ========================= Multi-Touch ========================== */
	public function _event_MultiTouch3(event:TouchEvent):Void
	{
		if(wrapper.enabled && true)
		{
			if(_EnableMultiTouch)
			{
				_TouchingIDs = (touchMap.get(_ButtonName) : Array<Dynamic>);
				_OnSelf = ((((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) > actor.getX()) && ((event.stageX - Engine.screenOffsetX) / (Engine.screenScaleX * Engine.SCALE) < (actor.getX() + (actor.getWidth())))) && (((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) > actor.getY()) && ((event.stageY - Engine.screenOffsetY) / (Engine.screenScaleY * Engine.SCALE) < (actor.getY() + (actor.getHeight())))));
				_WasTouching = Utils.contains(_TouchingIDs, (event.touchPointID));
				if(((_OnSelf || _AllowSlide) && _WasTouching))
				{
					simulateKeyRelease(_Control);
					_TouchingIDs.remove((event.touchPointID));
					actor.setAnimation(_NormalAnimation);
				}
			}
		}
	}
	/* ========================= Custom Code ========================== */
	/* The touch map needs to be global to persist when changing scenes. */
		public static var touchMap:Map<String, Array<Dynamic>>;
	//---
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Normal Animation", "_NormalAnimation");
		_NormalAnimation = "";
		nameMap.set("Pressed Animation", "_PressedAnimation");
		_PressedAnimation = "";
		nameMap.set("Control", "_Control");
		nameMap.set("Show Only in Mobile Games", "_ShowOnlyinMobileGames");
		_ShowOnlyinMobileGames = false;
		nameMap.set("Down", "_Down");
		_Down = false;
		nameMap.set("Allow Slide", "_AllowSlide");
		_AllowSlide = false;
		nameMap.set("Hover Animation", "_HoverAnimation");
		_HoverAnimation = "";
		nameMap.set("Touching IDs", "_TouchingIDs");
		nameMap.set("On Self", "_OnSelf");
		_OnSelf = false;
		nameMap.set("Was Touching", "_WasTouching");
		_WasTouching = false;
		nameMap.set("Enable Multi-Touch", "_EnableMultiTouch");
		_EnableMultiTouch = true;
		nameMap.set("Button Name", "_ButtonName");
		_ButtonName = "";
		
	}
	
	override public function init()
	{
		/* ======================== When Creating ========================= */
		if((_ButtonName) == (""))
		{
			_ButtonName = ("" + actor.getType());
		}
		/* Init map if needed */
			if(touchMap == null)
			{
				touchMap = new Map<String, Array<Dynamic>>();
			}
			if(!(touchMap.exists(_ButtonName)))
			{
				touchMap.set(_ButtonName, new Array<Dynamic>());
			}
		//---
		actor.anchorToScreen();
		actor.setAnimation(_NormalAnimation);
		if((_ShowOnlyinMobileGames && !(#if mobile true #else false #end)))
		{
			recycleActor(actor);
		}
		
		addListener(actor.whenMousedOver, _event_OnActor);
		addListener(actor.whenMousedOver, _event_OnActor2);
		addListener(actor.whenMousedOver, _event_OnActor3);
		addListener(actor.whenMousedOver, _event_OnActor4);
		addListener(engine.whenMTStarted, _event_MultiTouch);
		addListener(engine.whenMTDragged, _event_MultiTouch2);
		addListener(engine.whenMTEnded, _event_MultiTouch3);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}