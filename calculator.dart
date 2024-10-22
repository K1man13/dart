import 'dart:io';

// Basic calculator function
double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        throw Exception("Error: Division by zero");
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw Exception("Error: Division by zero");
      }
      return num1 % num2;
    default:
      throw Exception("Invalid operator. Please use one of: +, -, *, /, %");
  }
}

// Multi-step operations (e.g., 5 + 3 - 2)
double multiStepCalculate(List<String> operations) {
  if (operations.length < 3 || operations.length % 2 == 0) {
    throw Exception("Invalid input for multi-step calculation.");
  }

  double result = double.parse(operations[0]);

  for (int i = 1; i < operations.length; i += 2) {
    String operator = operations[i];
    double nextNum = double.parse(operations[i + 1]);
    result = calculate(result, nextNum, operator);
  }

  return result;
}

void main() {
  try {
    // Example usage for basic calculation
    double num1 = 10;
    double num2 = 2;
    String operator = '/';
    double result = calculate(num1, num2, operator);
    print("Basic Calculation: $num1 $operator $num2 = $result");

    // Example usage for multi-step calculation
    List<String> operations = ['10', '+', '5', '*', '2', '/', '3'];
    double multiStepResult = multiStepCalculate(operations);
    print("Multi-step Calculation: ${operations.join(' ')} = $multiStepResult");
  } catch (e) {
    print(e);
  }
}
