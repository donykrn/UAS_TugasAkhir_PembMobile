import 'package:flutter/material.dart';
import 'package:uas_flutter/services/api_service.dart';
import 'models/cases.dart';

enum Gender { male, female }

enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _namaController = TextEditingController();
  String gender = 'male';
  Gender _gender = Gender.male;
  final _umurController = TextEditingController();
  final _alamatController = TextEditingController();
  final _kotaController = TextEditingController();
  final _negaraController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

  @override
  void initState() {
    id = widget.cases.id;
    _namaController.text = widget.cases.nama;
    gender = widget.cases.gender;
    if (widget.cases.gender == 'male') {
      _gender = Gender.male;
    } else {
      _gender = Gender.female;
    }
    _umurController.text = widget.cases.umur.toString();
    _alamatController.text = widget.cases.alamat;
    _kotaController.text = widget.cases.kota;
    _negaraController.text = widget.cases.negara;
    status = widget.cases.status;
    if (widget.cases.status == 'positive') {
      _status = Status.positive;
    } else if (widget.cases.status == 'dead') {
      _status = Status.dead;
    } else {
      _status = Status.recovered;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Full Name'),
                              TextFormField(
                                controller: _namaController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gender'),
                              ListTile(
                                title: const Text('Male'),
                                leading: Radio(
                                  value: Gender.male,
                                  groupValue: _gender,
                                  onChanged: (Gender value) {
                                    setState(() {
                                      _gender = value;
                                      gender = 'male';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Female'),
                                leading: Radio(
                                  value: Gender.female,
                                  groupValue: _gender,
                                  onChanged: (Gender value) {
                                    setState(() {
                                      _gender = value;
                                      gender = 'female';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Age'),
                              TextFormField(
                                controller: _umurController,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Address'),
                              TextFormField(
                                controller: _alamatController,
                                decoration: const InputDecoration(
                                  hintText: 'Address',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter address';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('City'),
                              TextFormField(
                                controller: _kotaController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter city';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Country'),
                              TextFormField(
                                controller: _negaraController,
                                decoration: const InputDecoration(
                                  hintText: 'Country',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter country';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Status'),
                              ListTile(
                                title: const Text('Positive'),
                                leading: Radio(
                                  value: Status.positive,
                                  groupValue: _status,
                                  onChanged: (Status value) {
                                    setState(() {
                                      _status = value;
                                      status = 'positive';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Dead'),
                                leading: Radio(
                                  value: Status.dead,
                                  groupValue: _status,
                                  onChanged: (Status value) {
                                    setState(() {
                                      _status = value;
                                      status = 'dead';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Recovered'),
                                leading: Radio(
                                  value: Status.recovered,
                                  groupValue: _status,
                                  onChanged: (Status value) {
                                    setState(() {
                                      _status = value;
                                      status = 'recovered';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    api.updateCases(
                                        id,
                                        Cases(
                                            nama: _namaController.text,
                                            gender: gender,
                                            umur:
                                                int.parse(_umurController.text),
                                            alamat: _alamatController.text,
                                            kota: _kotaController.text,
                                            negara: _negaraController.text,
                                            status: status));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
