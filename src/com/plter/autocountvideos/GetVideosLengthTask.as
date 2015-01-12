/**
 * Created by plter on 1/12/15.
 */
package com.plter.autocountvideos {
import mx.controls.VideoDisplay;
import mx.events.MetadataEvent;

public class GetVideosLengthTask {


    /**
     *
     * @param videos
     * @param completeHandler
     * @param progressHandler function(progress:Number){}
     */
    public function GetVideosLengthTask(videos:Array,completeHandler:Function,progressHandler:Function=null) {

        _vd = new VideoDisplay();
        _vd.addEventListener(MetadataEvent.METADATA_RECEIVED, vd_metadataReceivedHandler);

        _videos = videos;
        _completeHandler = completeHandler;
        _progressHandler = progressHandler;

        _videoIndex = 0;
        getVideoLength(_videoIndex);
    }

    private function getVideoLength(index:int){
        _vd.source = _videos[index].url;
        _vd.load();
    }

    private var _vd:VideoDisplay;

    private function vd_metadataReceivedHandler(event:MetadataEvent):void {
        _videos[_videoIndex].setLength(Math.floor(_vd.totalTime));

        _videoIndex++;

        if(_progressHandler){
            _progressHandler(_videoIndex/_videos.length);
        }
        if(_videoIndex>=_videos.length&&_completeHandler){
            _completeHandler();
        }

        if(_videoIndex<_videos.length) {
            getVideoLength(_videoIndex);
        }
    }

    private var _videos:Array;

    private var _videoIndex:Number = 0;

    private var _completeHandler:Function=null;
    private var _progressHandler:Function=null;
}
}
