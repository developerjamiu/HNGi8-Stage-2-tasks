import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _userInputController = useTextEditingController();
    final _output = useState('');

    return Scaffold(
      appBar: AppBar(title: Text('User Input')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _userInputController,
              validator: (val) => val!.isEmpty ? 'Field cannot be empty' : null,
              decoration: InputDecoration(
                labelText: 'Enter your Full Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate())
                _output.value = _userInputController.text;
              else
                _output.value = '';
            },
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
            child: Text('Display Full Name'),
          ),
          SizedBox(height: 32),
          Text(
            'Output below:',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            _output.value,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
