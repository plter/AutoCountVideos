/**
 * Created by plter on 1/8/15.
 */
package com.plter.autocountvideos {
import flash.events.EventDispatcher;
import flash.filesystem.File;

import mx.controls.VideoDisplay;
import mx.events.MetadataEvent;

[Event(type="com.plter.autocountvideos.VideoFileEvent",name="gotVideoLength")]
public class VideoFile extends EventDispatcher{
    public function VideoFile(file:File) {
        _file = file;
        _nativePath= file.nativePath;
    }


    private var _nativePath:String;
    public function get nativePath():String {
        return _nativePath;
    }


    private var _length:Number = 0;
    public function get length():Number {
        return _length;
    }


    function setLength(value:Number):void {
        _length = value;
    }


    private var _file:File=null;


    public function get file():File {
        return _file;
    }

    public function get url():String{
        return file.url;
    }
}
}
