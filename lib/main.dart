import 'package:flutter/material.dart';

void main() {
  runApp(const CounterMod());
}

// Root aplikasi menggunakan StatelessWidget
class CounterMod extends StatelessWidget {
  const CounterMod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter State Latihan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

// Halaman utama menggunakan StatefulWidget agar tampilan bisa berubah (rebuild)
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // State lokal: data yang akan berubah
  int _counter = 0;

  // Fungsi untuk menambah nilai
  void _incrementCounter() {
    setState(() {
      _counter++; // Memicu UI untuk rebuild dengan nilai baru
    });
  }

  // Fungsi untuk mengurangi nilai (Tugas: Tombol Minus)
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) { // Opsional: agar tidak negatif
        _counter--;
      }
    });
  }

  // Fungsi untuk mereset nilai (Tugas: Tombol Reset)
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter & setState()"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 50, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            // Deretan tombol aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Minus", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Reset", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Add", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}