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
        useMaterial3:true,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Container(
          width:340,
          margin:const EdgeInsets.symmetric(vertical:24),
          padding:const EdgeInsets.all(16),
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(12),
            boxShadow:[
              BoxShadow(
                color:Colors.black12,
                blurRadius:12,
                offset:const Offset(0,4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children:[
              Stack(
                clipBehavior:Clip.none,
                children:[
                  const CircleAvatar(
                    radius:40,
                    backgroundColor:Colors.teal,
                    child:Icon(Icons.person,size:44,color:Colors.white),
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
                const SizedBox(height:12),
                const Text(
                  '星辰',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '吾日三省吾身',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height:20),
                Container( 
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children:[
                      Expanded(child: _stat('36','关注')),
                      Expanded(child: _stat('87','粉丝')),
                      Expanded(child: _stat('354','点赞')),
                    ]
                  ),
                ),
                const SizedBox(height:20),
                const Wrap(
                  spacing:8,
                  runSpacing:8,
                  alignment:WrapAlignment.center,
                  children:[
                    Chip(label: Text('小说')),
                    Chip(label: Text('游戏')),
                    Chip(label: Text('旅行')),
                    Chip(label: Text('计算机')),
                  ],
                ),
              ],
          ),
        ),
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
}
