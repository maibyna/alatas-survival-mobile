import 'package:flutter/material.dart';
import 'package:alatas_survival/widgets/left_drawer.dart';

class AlEntryFormPage extends StatefulWidget {
  const AlEntryFormPage({super.key});

  @override
  State<AlEntryFormPage> createState() => _AlEntryFormPageState();
}

class _AlEntryFormPageState extends State<AlEntryFormPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  int _amount = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Tambah Produk Ala Alatas Survival',
            ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Your Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _name = value!;
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Name tidak boleh kosong!";
                        }
                        else if (value.length < 5) {
                            return "Name harus terdiri dari minimal 5 huruf!";
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Description",
                            labelText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                                _description = value!;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return "Description tidak boleh kosong!";
                            }
                            if (value.length < 10 || value.length > 100) {
                                return "Description harus dalam rentang 10 sampai 100 karakter!";
                            }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Amount",
                            labelText: "Amount",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                                _amount = int.tryParse(value!) ?? 0;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return "Amount tidak boleh kosong!";
                            }
                            if (int.tryParse(value) != null && int.tryParse(value)! < 1) {
                                return "Amount tidak boleh nol atau negatif!";
                            }
                            if (int.tryParse(value) == null) {
                                return "Amount harus berupa angka!";
                            }
                        return null;
                        },
                    ),
                    ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.primary),
                            ),
                            onPressed: () {
                            if (_formKey.currentState!.validate()) {
                                showDialog(
                                context: context,
                                builder: (context) {
                                    return AlertDialog(
                                    title: const Text('Produk berhasil tersimpan'),
                                    content: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text('Name: $_name'),
                                                Text('Description: $_description'),
                                                Text('Amount: $_amount'),
                                            ],
                                        ),
                                    ),
                                    actions: [
                                        TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                            Navigator.pop(context);
                                            _formKey.currentState!.reset();
                                            },
                                        ),
                                    ],
                                    );
                                },
                                );
                            }
                            },
                            child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                            ),
                        ),
                    ),
                    ),
                ],
                ),
            ),
        ),
    );
  }
}

