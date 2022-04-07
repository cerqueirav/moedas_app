import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/resultado_page.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/colors/colors.dart';

class CotacaoPage extends StatelessWidget {
  MoedaBaseController _controller;
  CotacaoPage(this._controller);

  @override
  Widget build(BuildContext context) {
    var moedaNome = getNameCoin(_controller.moedaEscolhida.name);
    _controller.atualizaLista();
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              height: 40,
              width: 150,
              child: Text(
                'Cotação',
                style: TextStyle(
                    fontSize: 24,
                    color: titleCardColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
              child: Text(
                'Selecione as moedas a serem cotadas na moeda $moedaNome',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              height: 48,
              width: 380,
            ),
            Center(
                child: Column(
              children: [
                Container(
                  height: 450,
                  width: 380,
                  child: ListView.builder(
                      itemCount: _controller.listaDeMoedas.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      itemBuilder: (context, index) => Card(
                            borderOnForeground: false,
                            color: Colors.grey.shade800,
                            elevation: 3,
                            margin: EdgeInsets.all(7),
                            child: ListTile(
                              minLeadingWidth: 10,
                              leading: const Icon(
                                Icons.attach_money,
                                color: backgroundIconColor,
                              ),
                              title: Text(
                                getNameCoin(
                                    _controller.listaDeMoedas[index].name),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              onTap: () {
                                bool isContained = _controller.listaProxima
                                    .contains(_controller.listaDeMoedas[index]);
                                if (!isContained) {
                                  _controller.listaProxima
                                      .add(_controller.listaDeMoedas[index]);
                                }
                              },
                            ),
                          )),
                ),
                Container(
                  padding: EdgeInsetsDirectional.all(20),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      backgroundColor: titleCardColor,
                    ),
                    child: Text(
                      'Próximo',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ResultadoPage(_controller)),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            )),
          ],
        )));
  }
}
