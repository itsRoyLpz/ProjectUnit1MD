
import 'package:flutter/material.dart';
import 'package:project_unit1_sanchezlopez_victorrogelio/screens/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  final double percent;
  const Homescreen(this.percent, {Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final textcont1 = TextEditingController();
  final textcont2 = TextEditingController();

  double tip= 0;

  void setDefaultValues(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('Percentage you want to give', value);
  }

  Future<double?> getDefaultValues() async {
    final prefs = await SharedPreferences.getInstance();
    final double percent = prefs.getDouble('Percentage you want to give') ?? widget.percent;

    return percent;
  }

  @override
  Widget build(BuildContext context) {
    getDefaultValues().then((value) => {textcont2.text = value.toString()});

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 224, 226),
        appBar: AppBar(
            title: const Text("Calculate"),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 63, 60, 185)),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 63, 60, 185),
                ),
                child: Text(
                  'MY PROJECT', //´´´´
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Main '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.build),
                title: const Text('Settings'),
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const SecondScreen());
                  Navigator.push(context, route);
                },
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: textcont1,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 63, 60, 185))),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: textcont2,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  labelText: 'Percentage',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              //agregue el const
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              child: Center(
                child: Text(
                  'The total tip is: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              child: Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 63, 60, 185))),
                    onPressed: () {
                      tip = (double.parse(textcont1.text) *
                              double.parse(textcont2.text)) /
                          100;
                      setDefaultValues(double.parse(textcont2.text));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Add"),
                              content: Text("The total of tip is: $tip"),
                            );
                          });
                    },
                    child: const Text("calculate")),
              ),
            )
          ],
        ));
  }
}
