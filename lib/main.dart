import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ProfilePage(title: 'Profile Page'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double _w = 340;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          // Center 撑满窗口宽度，再把 340 宽的内容放到中间
          child: Column(
            children: [
              _profileCard(),
              const SizedBox(height: 24),
              _alignSection(),
              const SizedBox(height: 24),
              _flexSection(),
              const SizedBox(height: 24),
              _imageBadgeSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      width: _w,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, size: 44, color: Colors.white),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '星辰',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            '吾日三省吾身',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _stat('36', '关注')),
                Expanded(child: _stat('87', '粉丝')),
                Expanded(child: _stat('354', '点赞')),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              Chip(label: Text('小说')),
              Chip(label: Text('游戏')),
              Chip(label: Text('旅行')),
              Chip(label: Text('计算机')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(String num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(num,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _alignSection() {
    return SizedBox(
      width: _w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('自主实践 1：六种对齐',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _alignRow('start', MainAxisAlignment.start),
          _alignRow('center', MainAxisAlignment.center),
          _alignRow('end', MainAxisAlignment.end),
          _alignRow('spaceBetween', MainAxisAlignment.spaceBetween),
          _alignRow('spaceAround', MainAxisAlignment.spaceAround),
          _alignRow('spaceEvenly', MainAxisAlignment.spaceEvenly),
        ],
      ),
    );
  }

  Widget _alignRow(String name, MainAxisAlignment align) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('mainAxisAlignment: $name',
              style: const TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 3),
          Container(
            height: 36,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: align,
              children: const [_Box('A'), _Box('B'), _Box('C')],
            ),
          ),
        ],
      ),
    );
  }

  Widget _flexSection() {
    return SizedBox(
      width: _w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('自主实践 2：弹性 2:1:1',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('正常内容', style: TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 3),
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(flex: 2, child: _cell('flex:2', Colors.red.shade100)),
                Expanded(flex: 1, child: _cell('1', Colors.green.shade100)),
                Expanded(flex: 1, child: _cell('1', Colors.blue.shade100)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text('内容超长', style: TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 3),
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _cell('那是一个很长很长但又可以一笑而过的故事', Colors.red.shade100),
                ),
                Expanded(flex: 1, child: _cell('1', Colors.green.shade100)),
                Expanded(flex: 1, child: _cell('1', Colors.blue.shade100)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cell(String text, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _imageBadgeSection() {
    return SizedBox(
      width: _w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('自主实践 3：图片浮层文字',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Colors.teal.shade200),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('VIP',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 22,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      color: Colors.teal.shade200,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontSize: 11)),
    );
  }
}
