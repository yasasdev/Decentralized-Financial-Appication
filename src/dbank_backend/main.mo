import Debug "mo:base/Debug"; // Importing the Debug module (To print the output in the console)

// Creating the class (Canister)
actor DBank {
  //Creating a mutable variable
  var currentValue = 300;

  //Updating the value of a mutable variable
  currentValue := 500;

  // Creating immutable variable
  // let id = 1258545;

  // Printing string value in the console
  // Debug.print("Hello"); 

  // Printing the numeric values in the console
  Debug.print(debug_show(currentValue)); 
}