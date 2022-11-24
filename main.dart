

import 'package:flutter/material.dart';

/*Mude no arequivo test/widget_test.dart a linha
      await tester.pumpWidget(const MyApp()); 
  para
      await tester.pumpWidget(const MaterialApp());

*/
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner:false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{
  String _info = "Entre com o primeiro valor da prestação";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController valorController = TextEditingController();

  void _resetFields(){
    valorController.text = '';
    setState((){
      _info = "Entre com o primeiro valor da prestação";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcularEmprestimoFuturo(){
    setState((){
      double valor = double.parse(valorController.text);
      int ano = 0;
      double valorFinal = 0;
      
      do{
        if (ano == 0){valorFinal += valor; }
        else{valorFinal = valorFinal*2; }
        ano++;
  print(valorFinal);
      }while(valorFinal < 5000);

      

      _info = 'Daqui ${ano} ano(s) os empréstimo será de maior do que 5000.00';
    
    });
  }
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estipular futuro empréstimo"),
        centerTitle : true,
        backgroundColor: Colors.pink,
        actions:<Widget>[
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.account_balance_sharp, 
              size: 120.0, 
              color: Colors.pink),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor do emprestimo:",
                labelStyle: TextStyle(color: Colors.pink)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.pink, fontSize: 25.0),
                controller: valorController,
                validator:(value){
                  if(value!.isEmpty){
                    return "Insira o valor do emprestimo";
                  }
                  return null;
                },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      _calcularEmprestimoFuturo();
                    }
                  },
                  color:Colors.pink,
                  child: const Text(
                    'Calcular emprestimo',
                    style: TextStyle(color: Colors.white, fontSize:25.0),
                  ),
                ),
              ),
  
              ),
              Text(
                _info,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.pink, fontSize: 25),
                )

            ],
          ),
        )
      )
    );
  }

}






