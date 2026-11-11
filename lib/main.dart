import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Dice • Lắc may mắn',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB8452C)),
      scaffoldBackgroundColor: const Color(0xFFFFF8F0),
    ),
    home: const DicePage(),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key, this.random});
  final Random? random;
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late final Random _random = widget.random ?? Random();
  int _left = 1, _right = 1, _rolls = 0;
  void _roll() => setState(() {
    _left = _random.nextInt(6) + 1;
    _right = _random.nextInt(6) + 1;
    _rolls++;
  });

  Widget _die(int value, String side) => Expanded(
    child: Semantics(
      label: 'Xúc xắc $side: $value',
      image: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          child: Image.asset(
            'assets/images/dice$value.png',
            key: ValueKey('$side-$value'),
            excludeFromSemantics: true,
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('DICE / 03')),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              children: [
                const Icon(
                  Icons.casino_outlined,
                  size: 36,
                  color: Color(0xFFB8452C),
                ),
                const SizedBox(height: 20),
                Text(
                  'Một chút may mắn',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Chạm nút, để những con số lên tiếng.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                Row(children: [_die(_left, 'trái'), _die(_right, 'phải')]),
                const SizedBox(height: 24),
                Text(
                  'TỔNG ĐIỂM',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  '${_left + _right}',
                  key: const Key('total'),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  key: const Key('roll'),
                  onPressed: _roll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB8452C),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Lắc xúc xắc'),
                ),
                const SizedBox(height: 16),
                Text('Đã lắc $_rolls lần', key: const Key('roll-count')),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
