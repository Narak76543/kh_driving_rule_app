import 'package:flutter/cupertino.dart';
import 'package:kh_driving_rule/app/modules/test/drivingSkill_view.dart';
import 'package:kh_driving_rule/app/modules/test/rightOfWay_view.dart';
import 'package:kh_driving_rule/app/modules/test/roadTrafficLaw_view.dart';
import 'package:kh_driving_rule/app/modules/test/traffic_sign.dart';
import 'package:kh_driving_rule/app/modules/test/vihicleTechnic_view.dart';
import '../../app/modules/test/firstAid_view.dart';
import '../../app/modules/test/generalKnowLedge_view.dart';
import '../../app/modules/test/transport_view.dart';

List<Widget> screen_list = [
  TrafficLawView(),
  TrafficSignViews(),
  RightOfWayView(),
  DrivingSkillView(),
  VehicleTechView (),
  FirstAidView(),
  TransportView(),
  GeneralKnowLedgeView(),
];

