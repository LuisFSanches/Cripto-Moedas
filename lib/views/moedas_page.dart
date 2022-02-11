import 'package:cripto_moedas/models/moeda.dart';
import 'package:cripto_moedas/repositories/favoritas_repository.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:cripto_moedas/views/moedas_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
      final tabela = MoedaRepository.tabela;

      NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name:'R\$');

      List <Moeda> selecionadas = [];

      late FavoritasRepository favoritas;

      appBarDinamica(){

        if(selecionadas.isEmpty){
          return AppBar(
             title: Text('Cripto Moedas'),
        );
        }
        else{
          return AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back), 
                onPressed: (){
                  setState(() {
                    selecionadas=[];
                  });
                },
                ),
                title: Center(child: Text('${selecionadas.length} selecionadas')),
                backgroundColor: Colors.blueGrey[50],
                elevation: 1,
                iconTheme: const IconThemeData(color: Colors.black87),
                foregroundColor: Colors.black87, 
          );
        }
      }
      
      mostrarDetalhes(Moeda moeda){
          Navigator.push(context, MaterialPageRoute(
            builder: (_)=> MoedasDetalhes(moeda: moeda),
            ));
      }

      limparSelecionados(){
        setState(() {
          selecionadas = [];
        });
      }
      

  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);

    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda){
          return ListTile(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            leading: (selecionadas.contains(tabela[moeda]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                )
                : SizedBox(
                    child: Image.asset(tabela[moeda].icone),
                    width: 40,
                  ),
            title: 
             Row(
               children: [
                 Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  if(favoritas.lista.contains(tabela[moeda]))
                    Icon(Icons.star, color: Colors.amber,size: 16,)
                  
               ],
             ),
            trailing: Text(real.format(tabela[moeda].preco)),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: (){
              setState(() {
                  (selecionadas.contains(tabela[moeda])) ?
                    selecionadas.remove(tabela[moeda]) : 
                    selecionadas.add(tabela[moeda]);
              });
            },
            onTap: ()=> mostrarDetalhes(tabela[moeda]),
          );
        }, 
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_,__)=>Divider(), 
        itemCount: tabela.length
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selecionadas.isNotEmpty ? FloatingActionButton.extended(
          onPressed: (){
            favoritas.saveAll(selecionadas);
            limparSelecionados();
          }, 
          icon: Icon(Icons.star),
          label: const Text(
            'Favoritar',
            style:TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.bold
            )),
          ) : null
    );
  }
}