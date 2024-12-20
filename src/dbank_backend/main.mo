import Debug "mo:base/Debug"; // Importing the Debug module (To print the output in the console)
import Time "mo:base/Time"; // Importing the Time module 
import Float "mo:base/Float"; // Importing the Float module

// Creating the class (Canister)
actor DBank {
  //Creating a mutable variable
  // Stable variables are immutable
  stable var currentValue: Float = 300;
  // currentValue := 300.00; // Assigning the value to the variable

  // Function to print the current time since 1970-01-01
  stable var startTime = Time.now();
  // startTime := Time.now(); // Assigning the current time to the variable
  Debug.print(debug_show(startTime));

  // Printing the numeric values in the console
  Debug.print(debug_show(currentValue)); 

  // Private function
  public func topUp(amount: Float) { // Nat is a data type for numeric values (Nat - Natural numbers)
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the cuttentValue by the amount
  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Insufficient funds");
    }    
  };

  // Query function to check the current balance
  // Query functions are read-only functions
  public query func checkBalance(): async Float {
    return currentValue;
  };

  // Function to check the time since the canister was created
  public func compound() {
    let currentTme = Time.now();
    let timeElapsedNS = currentTme - startTime; //NS - NanoSeconds
    let timeElapsedS = timeElapsedNS / 1000000000; // Converting the time to seconds (dividing from 1 billion)
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); // Compounding the interest (1.01 = 1%) - 1 + 0.01
    startTime := currentTme; // Updating the startTime
  }
}