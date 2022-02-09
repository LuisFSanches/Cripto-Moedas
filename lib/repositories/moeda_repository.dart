import 'package:cripto_moedas/models/moeda.dart';

class MoedaRepository{
static List<Moeda> tabela=[
    Moeda(
      icone: 'assets/images/bitcoin.png', 
      nome: 'Bitcoin', 
      sigla: 'BTC', 
      preco: 164603.00
      ),
    Moeda(
      icone: 'assets/images/ethereum.png', 
      nome: 'Ethereum', 
      sigla: 'ETH', 
      preco: 9716.00
      ),
    Moeda(
      icone: 'assets/images/xrp.png', 
      nome: 'Xrp', 
      sigla: 'XRP', 
      preco: 3.34
      ),
    Moeda(
      icone: 'assets/images/cardano.png', 
      nome: 'Cardano', 
      sigla: 'ADA', 
      preco: 5.32
      ),
    Moeda(
      icone: 'assets/images/usdcoin.png', 
      nome: 'Usdcoin', 
      sigla: 'USDC', 
      preco: 5.02
      ),
    Moeda(
      icone: 'assets/images/litecoin.png', 
      nome: 'Litecoin', 
      sigla: 'LTC', 
      preco: 669.93
      ),

  ];
}