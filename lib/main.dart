import 'package:flutter/material.dart';

main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    celsiusController.text = "";
    fahrenheitController.text = "";
  }

  void _converter() {
    double celsius = double.parse(celsiusController.text);
    double fahrenheit = celsius * 1.8 + 32;
    fahrenheitController.text =
        fahrenheit.toStringAsFixed(2); //  "2" numero de casas decimais
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text('Conversor de Temperatura'),
      centerTitle: true,
      backgroundColor: Colors.blue, // cor da appBar
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetFields,
        ),
      ],
    );

    Image imgLogo = Image.asset("assets/images/logo.png", height: 120, width: 120,);


   /* Icon icon = Icon(
      Icons.add_call,
      size: 100,
      color: Colors.blue,
    );*/ // remover isto foi so para testar icones

    TextStyle styleDecoration = TextStyle(
        color: Colors.amber, fontSize: 20); // cor do texto da label ou hint
    TextStyle styleField =
        TextStyle(color: Colors.green); // cor do texto dentro do field

    TextFormField tmpCelsius = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Graus Celsius",
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: celsiusController,
      validator: (value) {
        if (value.isEmpty) {
          return "Informe um valor";
        }
      },
    );

    TextFormField tmpFahrenheit = TextFormField(
      enabled: false, // bloqueia campo para editar
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Graus Fahrenheit",
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
      border: OutlineInputBorder(),
      suffixText: "ºF",
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
      //validator: (value) {
      // if (value.isEmpty) {
      //    return "Informe um valor";
      //  }
      //},
    );

    RaisedButton btnCalcular = RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _converter();
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Text("Calcular"),
      color: Colors.blue[400],
    );

    Container containerBtn = Container(
      height: 200,
      child: btnCalcular,
    );

    Padding padding = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: containerBtn,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[//icon, tmpCelsius, tmpFahrenheit, padding
        imgLogo, tmpCelsius, Divider(), tmpFahrenheit, padding ],
    );

    Form form = Form(
      child: column,
      key: _formKey,
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white, // cor do fundo da tela geral
      body: singleChildScrollView,
    );

    return scaffold;
  }
}
