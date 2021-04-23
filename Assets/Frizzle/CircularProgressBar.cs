using UnityEngine;
using UnityEngine.UI;

public class CircularProgressBar : MonoBehaviour {
  private Image bar;
  public float speed;

  void Start() {
    bar = GetComponent<Image>();
    bar.fillAmount = 0;
  }

  public void SetProgress(float progress) {
    bar.fillAmount = progress;
  }
}