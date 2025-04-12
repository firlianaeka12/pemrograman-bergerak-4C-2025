// File: bin/exam2/exam2.dart

// Fungsi untuk menentukan bilangan ganjil atau genap
String oddOrEven(int number) {
  return number % 2 == 0 ? 'Genap' : 'Ganjil';
}

// Fungsi untuk membuat list dari 1 hingga X
List<int> createListOneToX(int x) {
  if (x <= 0) return [];
  return List.generate(x, (index) => index + 1);
}

// Fungsi untuk membentuk pola bintang menurun
String getStars(int n) {
  if (n <= 0) return '';

  String result = '';
  for (int i = n; i > 0; i--) {
    result += '*' * i + '\n';
  }
  return result;
}
