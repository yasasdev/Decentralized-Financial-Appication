import Debug "mo:base/Debug"; // Importing the Debug module (To print the output in the console)

// Creating the class (Canister)
actor DBank {
  //Creating a mutable variable
  var currentValue: Nat = 300;

  //Updating the value of a mutable variable
  currentValue := 500;

  // Printing the numeric values in the console
  Debug.print(debug_show(currentValue)); 

  // Private function
  public func topUp(amount: Nat) { // Nat is a data type for numeric values (Nat - Natural numbers)
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the cuttentValue by the amount
  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Insufficient funds");
    }    
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }
}