import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentVal: Float = 300;
  currentVal := 400;
  Debug.print(debug_show(currentVal));


  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  //let id = 1234;

   public func topUp(amount: Float) {
    currentVal += amount;
    Debug.print(debug_show(currentVal));
  };

  public func withdrawal(amount: Float) {
    let tempValue: Float = currentVal -amount;
    if (tempValue >=0) {
      currentVal -= amount;
    Debug.print(debug_show(currentVal));
    } else {
      Debug.print("Amount too large, currentVal less than zero.");
    }
    
  };

  public query func checkBalance(): async Float {
    return currentVal;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / (10**9);
    currentVal := currentVal * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}


