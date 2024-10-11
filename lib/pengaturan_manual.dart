import 'package:flutter/material.dart';

void main() {
  runApp(HydroponicControlApp());
}

class HydroponicControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydroponic Control',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ManualControlScreen(),
    );
  }
}

class ManualControlScreen extends StatefulWidget {
  @override
  _ManualControlScreenState createState() => _ManualControlScreenState();
}

class _ManualControlScreenState extends State<ManualControlScreen> {
  bool pump1Switch = false;
  bool pump2Switch = false;
  bool uvLightSwitch = false;
  bool cameraSwitch = false;

  TimeOfDay pump1StartTime = TimeOfDay(hour: 19, minute: 0);
  TimeOfDay pump1EndTime = TimeOfDay(hour: 22, minute: 0);
  TimeOfDay pump2StartTime = TimeOfDay(hour: 19, minute: 0);
  TimeOfDay pump2EndTime = TimeOfDay(hour: 22, minute: 0);
  TimeOfDay uvLightStartTime = TimeOfDay(hour: 19, minute: 0);
  TimeOfDay uvLightEndTime = TimeOfDay(hour: 22, minute: 0);
  TimeOfDay cameraStartTime = TimeOfDay(hour: 19, minute: 0);
  TimeOfDay cameraEndTime = TimeOfDay(hour: 22, minute: 0);

  Future<void> _selectTime(BuildContext context, Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Go back when the arrow is pressed
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Pengaturan Manual',
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.left, 
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Text(
            'List Konfigurasi',
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center, // Center the text
          ),
          SizedBox(height: 20), // Add spacing below the title
          buildControlTile(
            'Pompa nutrisi 1',
            pump1StartTime.format(context),
            pump1EndTime.format(context),
            Icons.local_drink,
            pump1Switch,
            (value) {
              setState(() {
                pump1Switch = value;
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  pump1StartTime = newTime;
                });
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  pump1EndTime = newTime;
                });
              });
            },
          ),
          buildControlTile(
            'Pompa nutrisi 2',
            pump2StartTime.format(context),
            pump2EndTime.format(context),
            Icons.local_drink,
            pump2Switch,
            (value) {
              setState(() {
                pump2Switch = value;
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  pump2StartTime = newTime;
                });
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  pump2EndTime = newTime;
                });
              });
            },
          ),
          buildControlTile(
            'Lampu UV',
            uvLightStartTime.format(context),
            uvLightEndTime.format(context),
            Icons.lightbulb_outline,
            uvLightSwitch,
            (value) {
              setState(() {
                uvLightSwitch = value;
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  uvLightStartTime = newTime;
                });
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  uvLightEndTime = newTime;
                });
              });
            },
          ),
          buildControlTile(
            'Kamera',
            cameraStartTime.format(context),
            cameraEndTime.format(context),
            Icons.camera_alt,
            cameraSwitch,
            (value) {
              setState(() {
                cameraSwitch = value;
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  cameraStartTime = newTime;
                });
              });
            },
            () {
              _selectTime(context, (newTime) {
                setState(() {
                  cameraEndTime = newTime;
                });
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildControlTile(
    String title,
    String startTime,
    String endTime,
    IconData icon,
    bool switchValue,
    Function(bool) onChanged,
    VoidCallback onStartTimeTap,
    VoidCallback onEndTimeTap,
  ) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onStartTimeTap,
              child: Text('Mulai: $startTime'),
            ),
            GestureDetector(
              onTap: onEndTimeTap,
              child: Text('Berakhir: $endTime'),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: switchValue,
              onChanged: onChanged,
            ),
            Text(
              switchValue ? 'on' : 'off',
              style: TextStyle(
                color: switchValue ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
