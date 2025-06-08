import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text("I Have Develeoped This App to Showcase My Toggle Between Dark & Light Theme and A DropDown Button",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        )
    );

  }

}
