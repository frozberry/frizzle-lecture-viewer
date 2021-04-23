using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using UnityEngine.Networking;
using SimpleJSON;
using System;
using TMPro;

public class VideoController : MonoBehaviour {
  private const string getURL = "https://api-6311.herokuapp.com/lectures/active";
  private VideoPlayer video;
  private ScheduleController schedule;
  private bool _needNewUrl = false;
  private bool _noUpcomingVideo = false;
  private float _timer = 0f;
  private float _ratio;
  private long _manualTimestamp;
  private float _duration;

  private string _url = "";
  private long _startsAt;
  private long _expiresAt;

  private bool _end = true;

  [SerializeField] private TextMeshProUGUI t;
  [SerializeField] private CircularProgressBar progressBar;

  void Start() {
    video = GetComponent<VideoPlayer>();
    schedule = GetComponent<ScheduleController>();
    video.loopPointReached += EndReached;
    StartCoroutine(GetActiveVideo());
  }

  void Update() {
    DateTime now = DateTime.UtcNow;
    long timeNow = new DateTimeOffset(now).ToUnixTimeMilliseconds();

    if (_end && _url != "") {
      if (timeNow > _startsAt) {
        video.url = _url;
        video.Play();
        _end = false;
      }
    }

    // get a new url from the server 20s before the start time 
    if (_needNewUrl && timeNow > _startsAt - 20000) {
      StartCoroutine(GetActiveVideo());
      _needNewUrl = false;
    }

    // check every 10m if there's no upcoming video
    if (_noUpcomingVideo) {
      _timer += Time.deltaTime;
      if (_timer > 10 * 60) {
        StartCoroutine(GetActiveVideo());
        _noUpcomingVideo = false;
      }
    }

    // prevent video from pausing if the device going in to standby
    _manualTimestamp = timeNow - _startsAt;
    if (video.isPlaying && Math.Abs(video.time - _manualTimestamp / 1000) > 10) {
      video.time = (int)_manualTimestamp / 1000;
    }

    if (video.isPlaying) {
      progressBar.SetProgress((float)video.time / (_duration / 1000));
    } else {
      progressBar.SetProgress(0f);
    }
  }

  IEnumerator GetActiveVideo() {
    UnityWebRequest www = UnityWebRequest.Get(getURL);

    yield return www.SendWebRequest();

    if (www.isNetworkError || www.isHttpError) {
      Debug.LogError(www.error);
    } else {
      var d = JSON.Parse(www.downloadHandler.text);

      if (d["message"].Value == "no upcoming events") {
        _noUpcomingVideo = true;
      } else {
        _url = d["url"].Value;
        _startsAt = (long)d["start"].AsDouble;
        _expiresAt = (long)d["expires"].AsDouble;
        _ratio = d["ratio"].AsFloat;
        _duration = d["duration"].AsFloat;

        // if the url expires before the video is scheduled to start
        if (_expiresAt < _startsAt) {
          _needNewUrl = true;
        }
      }
    }
  }

  void EndReached(VideoPlayer vp) {
    _end = true;
    _url = "";
    _startsAt = 0;
    _expiresAt = 0;
    _duration = 0;
    video.Stop();

    StartCoroutine(GetActiveVideo());
    schedule.GetSchedule();
  }
}
