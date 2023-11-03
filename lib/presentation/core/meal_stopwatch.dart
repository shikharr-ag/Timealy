import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:timealy/application/providers/onboarding_provider.dart';

import '../../application/providers/tick_state_provider.dart';
import '../../utils/helper.dart';

class MealStopwatch extends StatelessWidget {
  const MealStopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: Container(
        height: height * 0.32,
        padding: const EdgeInsets.all(10.0),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Consumer<TickStateProvider>(
          builder: (context, prov, _) {
            return SfRadialGauge(
              // backgroundColor: Colors.white,
              axes: <RadialAxis>[
                RadialAxis(
                    showLabels: false,
                    startAngle: 270,
                    endAngle: 270,
                    minimum: 0,
                    maximum: 60,
                    interval: 15,
                    showAxisLine: false,
                    tickOffset: 5,
                    useRangeColorForAxis: true,
                    labelsPosition: ElementsPosition.outside,
                    majorTickStyle:
                        const MajorTickStyle(length: 12, thickness: 4),
                    minorTickStyle:
                        const MinorTickStyle(thickness: 2, length: 8),
                    minorTicksPerInterval: 14,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 60 - prov.tickCount,
                        color: Colors.green,
                        startWidth: 8,
                        endWidth: 8,
                      ),
                    ],
                    pointers: const [],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text: Helpers()
                                    .getFormattedTime(30 - prov.factorCount),
                                // '00:${(30 - prov.factorCount).toStringAsFixed(0) == '0' ? '00' : ((30 - prov.factorCount).toStringAsFixed(0) < 9 )}\n',
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'minutes remaining',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          angle: 0,
                          positionFactor: 0)
                    ])
              ],
            );
          },
        ),
      ),
    );
  }
}
