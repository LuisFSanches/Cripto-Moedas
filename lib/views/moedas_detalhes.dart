import 'package:cripto_moedas/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MoedasDetalhes extends StatefulWidget {

   Moeda moeda;
 
 MoedasDetalhes({Key? key, required this.moeda}) : super(key: key);

  @override
  _MoedasDetalhesState createState() => _MoedasDetalhesState();
}

NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name:'R\$');


class _MoedasDetalhesState extends State<MoedasDetalhes> {
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}