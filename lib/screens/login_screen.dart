import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kami/configs/login.dart';
import 'package:kami/screens/components/content_loading.dart';

import '../src/rust/api/api.dart' as api;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _username = "";
  late String _password = "";
  late String _token = "";

  @override
  void initState() {
    super.initState();
    loginEvent.subscribe(_setState);
    _loadProperties();
  }

  @override
  void dispose() {
    loginEvent.unsubscribe(_setState);
    super.dispose();
  }

  _setState(_) {
    setState(() {});
  }

  Future _loadProperties() async {
    var username = await api.loadProperty(k: "username");
    var password = await api.loadProperty(k: "password");
    var token = await api.loadProperty(k: "token");
    setState(() {
      _username = username;
      _password = password;
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("用户设置"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (logging) {
      return const ContentLoading(label: "处理中");
    }
    if (loginState.state == 1) {
      return const Text("登录成功");
    }
    return Column(children: [
      const Center(
        child: Text(
          "启动时登录失败可使用之前的token重新登录 账号和密码的输入框被注册和登录按钮共用",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Container(height: 50),
      ...(_token.isNotEmpty
          ? <Widget>[
              MaterialButton(
                onPressed: () async {
                  await initLogin();
                },
                child: const Text("使用之前的Token登录"),
              ),
              Container(height: 50),
            ]
          : []),
      ListTile(
        title: const Text("用户名"),
        subtitle: Text(_username),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () async {
            var username = await inputDialog(context, "用户名", "请输入用户名");
            if (username != null) {
              setState(() {
                _username = username;
              });
            }
          },
        ),
      ),
      ListTile(
        title: const Text("密码"),
        subtitle: Text(_password),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () async {
            var password = await inputDialog(context, "密码", "请输入密码");
            if (password != null) {
              setState(() {
                _password = password;
              });
            }
          },
        ),
      ),
      Container(height: 50),
      MaterialButton(
        onPressed: () async {
          await register(context, _username, _password);
        },
        child: const Text("注册"),
      ),
      Container(height: 50),
      MaterialButton(
        onPressed: () async {
          try {
            await login(_username, _password);
            _token = await api.loadProperty(k: "token");
          } catch (e, s) {
            log("$e\n$s");
          }
          setState(() {});
        },
        child: const Text("使用账号密码登录"),
      ),
      Container(height: 50),
      Text(loginState.message, style: const TextStyle(color: Colors.red)),
    ]);
  }

  Future<String?> inputDialog(
      BuildContext context, String title, String label) async {
    var controller = TextEditingController();
    var result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
    return result;
  }
}
