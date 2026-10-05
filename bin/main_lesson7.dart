import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';
import 'device.dart';
import 'adjustable.dart';
import 'battery.dart';

void main() {
  List<Device> devices = [
    SmartLamp('Bedroom Lamp', 50),
    SmartSpeaker('Living Room Speaker', 50),
    SmartThermostat('Home Thermostat'),
  ];

  for (var device in devices) {
    device.showInfo();
    device.turnOn();

    if (device is Adjustable) {
      (device as Adjustable).increase();
    }

    if (device is BatteryPowered) {
      (device as BatteryPowered).showBattery();
    }

    print('');
  }

  print('All devices processed.');
}
