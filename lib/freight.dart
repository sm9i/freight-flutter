import 'dart:async';

import 'package:flutter/services.dart';

///仅有 ios
///android 实现在appp  因为和 amap冲突
class Freight {
  static const MethodChannel _channel = const MethodChannel('freight');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 初始化服务
  static Future<Map<String, dynamic>?> init(
      String appId, String appSecurity, String eeCode, String env) async {
    return await _channel.invokeMethod<Map<String, dynamic>?>("init", {
      "appId": appId,
      "appSecurity": appSecurity,
      "eeCode": eeCode,
      "env": env
    });
  }

  /// 启用定位
  static Future<Map<String, dynamic>?> start(
      List<Map<String, dynamic>> ships) async {
    return await _channel.invokeMethod("start", {"ships": ships});
  }

  /// 结束定位
  static Future<Map<String, dynamic>?> stop(
      List<Map<String, dynamic>> ships) async {
    return await _channel.invokeMethod("stop", {"ships": ships});
  }

  /// 初始化高德地图服务
  /// 备注: 仅在iOS平台下调用
  /// @param 高德地图服务key
  static Future<bool?> initAmap(String key) async {
    return await _channel.invokeMethod<bool?>("initAmap", {"key": key});
  }

  /// 获取定位信息
  static Future<Map<dynamic, dynamic>?> getLocation() async {
    return await _channel.invokeMethod("getLocation");
  }
}
