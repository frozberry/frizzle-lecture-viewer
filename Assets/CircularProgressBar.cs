using UnityEngine;
using UnityEngine.UI;

public class CircularProgressBar : MonoBehaviour {
  private Image bar;
  float currentValue;
  public float speed;
  void Start() {
    bar = GetComponent<Image>();
  }

  // Update is called once per frame
  void Update() {
    if (currentValue < 100) {
      currentValue += speed * Time.deltaTime;
    } else {
    }

    bar.fillAmount = currentValue / 100;

    Debug.Log(currentValue);
  }
}