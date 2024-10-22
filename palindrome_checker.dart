/// Function to check if a string is a palindrome
/// It ignores spaces, punctuation, and case-sensitivity.
bool isPalindrome(String input) {
  // Normalize the string: remove spaces, punctuation, and convert to lowercase
  String cleanedInput = input
      .replaceAll(RegExp(r'[^A-Za-z0-9]'), '') // Remove non-alphanumeric characters
      .toLowerCase(); // Convert to lowercase for case insensitivity

  // Compare the cleaned string with its reverse
  String reversedInput = cleanedInput.split('').reversed.join('');

  // Check if the cleaned string is the same as its reverse
  return cleanedInput == reversedInput;
}

/// Function to check if a number is a palindrome
/// Converts the number to a string and utilizes the isPalindrome function
bool isNumericPalindrome(int number) {
  // Convert the number to a string and check its palindrome property
  return isPalindrome(number.toString());
}

void main() {
  // Testing string palindromes
  print(isPalindrome("A man, a plan, a canal, Panama"));  // true
  print(isPalindrome("Was it a car or a cat I saw?"));  // true
  print(isPalindrome("Eva, can I see bees in a cave?",));  // true
  print(isPalindrome("No 'x' in Nixon"));                 // true
  print(isPalindrome("Hello, world!"));                   // false

  // Testing numeric palindromes
  print(isNumericPalindrome(12321));                      // true
  print(isNumericPalindrome(12345));                      // false

  // Additional test cases for edge cases
  print(isPalindrome(""));                                // true (Empty string is considered a palindrome)
  print(isPalindrome("a"));                               // true (Single character is a palindrome)
  print(isNumericPalindrome(0));                          // true (Single digit is a palindrome)
  print(isNumericPalindrome(-121));                       // false (Negative number is not a palindrome)
}
