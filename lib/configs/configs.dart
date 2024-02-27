import 'package:kami/configs/login.dart';
import 'package:kami/configs/proxy.dart';
import 'package:kami/configs/reader_controller_type.dart';
import 'package:kami/configs/reader_direction.dart';
import 'package:kami/configs/reader_slider_position.dart';
import 'package:kami/configs/reader_type.dart';
import 'package:kami/configs/versions.dart';

import 'cache_time.dart';

Future initConfigs() async {
  await initProxy();
  await initCacheTime();
  await initReaderControllerType();
  await initReaderDirection();
  await initReaderSliderPosition();
  await initReaderType();
  await initLogin();
  await initVersion();
  autoCheckNewVersion();
}
