import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/route_handlers.dart';
import 'package:flutter_sample/page/me/me_setting/me_setting_list.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String pageOne = "/page/one";
  static String meSettingList = "/me/setting";//地址列表

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    //跳转设置页面
    router.define(meSettingList, handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new MeSettingPage();
    }));
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(demoFunc, handler: demoFunctionHandler);
    router.define(deepLink, handler: deepLinkHandler);

    router.define(pageOne, handler: pageOneHandler);
  }
}
