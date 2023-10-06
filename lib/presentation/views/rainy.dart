import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/consts/theme.dart';

class RainyView extends StatefulWidget {
  const RainyView({super.key});

  @override
  State<StatefulWidget> createState() => _RainyView();
}

class _RainyView extends State<RainyView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppThemes.rainy,
      body: Column(
        children: [ImageWidget(), Expanded(child: DaysWeatherView())],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/forest_rainy.png'),
            fit: BoxFit.fitHeight),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '15°',
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'RAINY',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class DaysWeatherView extends StatelessWidget {
  const DaysWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        const Row(
          children: [
            // min
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "10°",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "min",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
            //curent
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "19°",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "current",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
            // max
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "19°",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "max",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ))
          ],
        ),
        const Divider(color: Colors.white),
        ...<DayWeather>[
          DayWeather(day: "Monday", temperature: 23),
          DayWeather(day: "Tuesday", temperature: 23),
          DayWeather(day: "Wednesday", temperature: 23),
          DayWeather(day: "Thursday", temperature: 23),
          DayWeather(day: "Friday", temperature: 23),
          DayWeather(day: "Saturday", temperature: 23),
          DayWeather(day: "Sunday", temperature: 23),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        e.day,
                        style: const TextStyle(color: Colors.white),
                      )),
                      const Expanded(
                        child: Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 60),
                      Text(
                        "${e.temperature} °",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ))
            .toList()
      ],
    );
  }
}

class DayWeather {
  final String day;
  final num temperature;

  DayWeather({
    required this.day,
    required this.temperature,
  });
}
