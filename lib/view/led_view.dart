import 'dart:async';
import 'dart:convert';
import 'dart:typed_data'; // Importación necesaria
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:app_lampara/src/screens/smart_light/smart_light.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/led-view';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BluetoothConnection? connection;
  Color currentColor = Color.fromARGB(255, 173, 0, 255);
  double intensity = 1.0;
  bool isConnected = false;
  bool isOn = true;
  Timer? _timer; // Declarar un Timer

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _startConnectionCheck(); // Iniciar el chequeo de la conexión
  }

  Future<void> _requestPermissions() async {
    var status = await [
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location
    ].request();

    if (status[Permission.bluetooth]!.isGranted &&
        status[Permission.bluetoothConnect]!.isGranted &&
        status[Permission.bluetoothScan]!.isGranted &&
        status[Permission.location]!.isGranted) {
      // Permisos concedidos
    } else {
      print("Permisos no concedidos");
    }
  }

  Future<void> _connectToDevice() async {
    try {
      var devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      for (var device in devices) {
        if (device.name == "Sun-Ray") {
          connection = await BluetoothConnection.toAddress(device.address);
          setState(() {
            isConnected = true;
          });
          break;
        }
      }
      if (!isConnected) {
        print("No se encontró el dispositivo");
      }
    } catch (e) {
      print("Error connecting to device: $e");
    }
  }

  void _sendData(String command) {
    if (connection != null && connection!.isConnected) {
      connection!.output.add(Uint8List.fromList(utf8.encode(command)));
    }
  }

  void _toggleLed() {
    if (isOn) {
      _sendData("OFF\n");
    } else {
      _sendData(
          "${currentColor.red},${currentColor.green},${currentColor.blue},${(intensity * 100).toInt()}\n");
    }
    setState(() {
      isOn = !isOn;
    });
  }

  void _startConnectionCheck() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (connection != null) {
        setState(() {
          isConnected = connection!.isConnected;
        });
      } else {
        setState(() {
          isConnected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.of(context).pushNamed(SmartLight.routeName);
          },
        ),
      ),
      backgroundColor: Colors.white, // Cambiar el color de fondo a blanco
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Eliminar el Container que contiene el degradado
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SimpleShadow(
                  opacity: 0.6,
                  color: currentColor,
                  offset: Offset(5, 0),
                  sigma: 30,
                  child: InnerShadow(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: currentColor,
                          width: 7,
                        ),
                      ),
                    ),
                    shadows: [
                      Shadow(
                        color: currentColor,
                        blurRadius: 80,
                        offset: const Offset(2, 5),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _connectToDevice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 152, 150, 154),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: isConnected ? Text('Desconectar') : Text('Conectar'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isConnected
                        ? isOn
                            ? ElevatedButton(
                                onPressed: _toggleLed,
                                child: Text('Apagar'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: _toggleLed,
                                child: Text('Prender'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                ),
                              )
                        : SizedBox(), // Espacio vacío si no está conectado
                    SizedBox(width: 20), // Espaciado entre los botones
                    Text(
                      isConnected ? 'Conectado' : 'Sin conexión',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el Timer al descartar el widget
    connection?.dispose();
    super.dispose();
  }
}
