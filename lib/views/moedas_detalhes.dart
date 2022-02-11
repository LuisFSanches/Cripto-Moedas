import 'package:cripto_moedas/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class MoedasDetalhes extends StatefulWidget {

   Moeda moeda;
 
 MoedasDetalhes({Key? key, required this.moeda}) : super(key: key);

  @override
  _MoedasDetalhesState createState() => _MoedasDetalhesState();
}


class _MoedasDetalhesState extends State<MoedasDetalhes> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name:'R\$');

  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  double quantidade = 0;

  comprar(){
    if(_form.currentState!.validate()){
      //Salvar a compra no DB
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Compra realizada com sucesso'))
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.moeda.nome))
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(widget.moeda.icone),
                    width: 50,
                    ),
                  const SizedBox(width: 10,),
                  Text(
                    real.format(widget.moeda.preco),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800]
                    ),
                    )
                  ],
                ),
              ),
              (quantidade > 0) ?
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Text(
                    '$quantidade ${widget.moeda.sigla}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                   
                ),
              ) 
              : Container(
                margin: const EdgeInsets.only(bottom: 24),
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: _valor,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    suffix: Text('R\$',
                    style: TextStyle(
                      fontSize: 16
                    ),)
                  ),
                 keyboardType: TextInputType.number,
                 inputFormatters: [
                   FilteringTextInputFormatter.digitsOnly
                 ],
                 validator: (value){
                   if(value!.isEmpty){
                      return 'Informe o valor da compra';
                   } else if(double.parse(value) < 50){
                     return 'Compra mínima é de R\$ 50,00';
                   }
                   return null;
                 },
                 onChanged: (value){
                   setState(() {
                      quantidade = (value.isEmpty) ? 0 : double.parse(value)/widget.moeda.preco;
                   });
                 },
                )),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top:24),
                  child: ElevatedButton(
                    onPressed: comprar,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.check),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.all(16),
                          // ignore: prefer_const_constructors
                          child: Text(
                            'Comprar',
                            style: TextStyle(fontSize: 20),
                            ),
                          )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      
    );
  }
}