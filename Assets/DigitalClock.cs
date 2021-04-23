using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System;
using TMPro;

public class DigitalClock : MonoBehaviour {
  private TextMeshProUGUI t;
  void Awake() {
    t = GetComponent<TextMeshProUGUI>();
  }

  void Update() {
    DateTime time = DateTime.Now;
    string hour = LeadingZero(time.Hour);
    string minute = LeadingZero(time.Minute);
    string second = LeadingZero(time.Second);
    t.text = hour + ":" + minute + ":" + second;
  }
  string LeadingZero(int n) {
    return n.ToString().PadLeft(2, '0');
  }
}