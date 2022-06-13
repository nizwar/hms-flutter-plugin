/*
    Copyright 2021-2022. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0
        
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';

import '../utils/demo_utils.dart';

class LanguagesDemo extends StatefulWidget {
  const LanguagesDemo({Key? key}) : super(key: key);

  @override
  _LanguagesDemoState createState() => _LanguagesDemoState();
}

class _LanguagesDemoState extends State<LanguagesDemo> {
  late MLTranslateLanguage mlTranslateLanguage;

  List cloudSync = ['no item'];
  List cloud = ['no item'];
  List localSync = ['no item'];
  List local = ['no item'];

  @override
  void initState() {
    mlTranslateLanguage = MLTranslateLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translate Lang Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cloud Sync'),
            Text(cloudSync.toString()),
            Divider(height: 5),
            Text('Cloud'),
            Text(cloud.toString()),
            Divider(height: 5),
            Text('Local Sync'),
            Text(localSync.toString()),
            Divider(height: 5),
            Text('Local'),
            Text(local.toString()),
            recognitionButton(getCloudSync, text: 'Get cloud langs sync'),
            recognitionButton(getCloud, text: 'Get cloud langs async'),
            recognitionButton(getLocalSync, text: 'Get local langs sync'),
            recognitionButton(getLocal, text: 'Get local langs async'),
          ],
        ),
      ),
    );
  }

  void getCloudSync() async {
    try {
      final res = await mlTranslateLanguage.syncGetCloudAllLanguages();
      setState(() => cloudSync.addAll(res));
    } on Exception catch (e) {
      exceptionDialog(context, e.toString());
    }
  }

  void getCloud() async {
    try {
      final res = await mlTranslateLanguage.getCloudAllLanguages();
      setState(() => cloud.addAll(res));
    } on Exception catch (e) {
      exceptionDialog(context, e.toString());
    }
  }

  void getLocalSync() async {
    try {
      final res = await mlTranslateLanguage.syncGetLocalAllLanguages();
      setState(() => localSync.addAll(res));
    } on Exception catch (e) {
      exceptionDialog(context, e.toString());
    }
  }

  void getLocal() async {
    try {
      final res = await mlTranslateLanguage.getLocalAllLanguages();
      setState(() => local.addAll(res));
    } on Exception catch (e) {
      exceptionDialog(context, e.toString());
    }
  }
}
