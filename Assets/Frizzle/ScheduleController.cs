using System.Collections;
using UnityEngine;
using UnityEngine.Networking;
using SimpleJSON;
using System;
using TMPro;

public class ScheduleController : MonoBehaviour {
  private const string getURL = "https://api-6311.herokuapp.com/lectures/pending";
  private TextMeshProUGUI t;

  void Start() {
    t = GetComponent<TextMeshProUGUI>();
    t.text = "";
    GetSchedule();
  }

  public void GetSchedule() {
    StartCoroutine(GetRequest());
  }

  IEnumerator GetRequest() {
    UnityWebRequest www = UnityWebRequest.Get(getURL);

    yield return www.SendWebRequest();

    if (www.isNetworkError || www.isHttpError) {
      Debug.LogError(www.error);
    } else {
      var res = JSON.Parse(www.downloadHandler.text);

      for (int i = 0; i < res.Count; i++) {
        string name = res[i]["name"].Value;
        double start = res[i]["start"].AsDouble;
        DateTime date = DateTimeOffset.FromUnixTimeMilliseconds((long)start).LocalDateTime;
        string formattedDate = date.ToString("hh:mm tt dddd d MMMM");

        string entry = name + " \u000a" + formattedDate + " \u000a\u000a";
        t.text += entry;
      }
    }
  }
}
