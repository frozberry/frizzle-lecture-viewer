using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BNG;

public class Env : MonoBehaviour {
  public bool production;
  [SerializeField] private VREmulator emulator;
  [SerializeField] private SmoothLocomotion locomotion;

  void Start() {
    if (production) {
      emulator.EmulatorEnabled = false;
      locomotion.MovementSpeed = 0;
    } else {
      emulator.EmulatorEnabled = true;
      locomotion.MovementSpeed = 5;
    }
  }
}
