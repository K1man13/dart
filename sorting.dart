import 'dart:math';
import 'dart:core';

// Quick Sort implementation
List<int> quickSort(List<int> arr) {
  if (arr.length < 2) return arr;

  int pivot = arr[Random().nextInt(arr.length)];
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  for (int num in arr) {
    if (num < pivot) {
      less.add(num);
    } else if (num == pivot) {
      equal.add(num);
    } else {
      greater.add(num);
    }
  }
  return quickSort(less) + equal + quickSort(greater);
}

// Merge Sort implementation
List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;

  int mid = arr.length ~/ 2;
  List<int> left = mergeSort(arr.sublist(0, mid));
  List<int> right = mergeSort(arr.sublist(mid));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

// Function to compare performance of Quick Sort and Merge Sort
void compareSorts(List<int> arr) {
  var arr1 = List<int>.from(arr);
  var arr2 = List<int>.from(arr);

  // Quick Sort Timing
  var quickStart = DateTime.now().microsecondsSinceEpoch;
  quickSort(arr1);
  var quickEnd = DateTime.now().microsecondsSinceEpoch;
  var quickTime = quickEnd - quickStart;

  // Merge Sort Timing
  var mergeStart = DateTime.now().microsecondsSinceEpoch;
  mergeSort(arr2);
  var mergeEnd = DateTime.now().microsecondsSinceEpoch;
  var mergeTime = mergeEnd - mergeStart;

  // Display Results
  print("Quick Sort Time: ${quickTime} microseconds");
  print("Merge Sort Time: ${mergeTime} microseconds");

  if (quickTime < mergeTime) {
    print("Quick Sort is faster by ${mergeTime - quickTime} microseconds");
  } else if (mergeTime < quickTime) {
    print("Merge Sort is faster by ${quickTime - mergeTime} microseconds");
  } else {
    print("Both sorting algorithms took the same time.");
  }
}

void main() {
  List<int> arr = List.generate(1000, (_) => Random().nextInt(10000));

  print("Unsorted array: ${arr.sublist(0, 10)}..."); // Preview of unsorted array
  compareSorts(arr);
}
