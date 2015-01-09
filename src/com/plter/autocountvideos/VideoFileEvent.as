/**
 * Created by plter on 1/8/15.
 */
package com.plter.autocountvideos {
import flash.events.Event;

public class VideoFileEvent extends Event {


    public static const GOT_VIDEO_LENGTH:String="gotVideoLength";

    public function VideoFileEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
