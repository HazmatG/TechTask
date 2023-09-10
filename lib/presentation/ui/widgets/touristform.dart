import 'package:flutter/material.dart';
import 'customtextfield.dart';

class ExpansionText {
  ExpansionText({
    required this.cotext,
    required this.extext,
    this.isExpanded = false
  });

  String extext;
  String cotext;
  bool isExpanded;
}

class TouristForm extends StatefulWidget {
  const TouristForm({Key? key}) : super(key: key);

  @override
  _TouristFormState createState() => _TouristFormState();
}

class _TouristFormState extends State<TouristForm> {

  List<ExpansionText> _list = List<ExpansionText>.generate(4, (index) {
    return ExpansionText(
        cotext: 'Hello', extext: 'Hello there sdds;dsovksdvovonisnio');
  });

  List<String> touristnumberlist = [
    'Первый',
    'Второй',
    'Третий',
    'Четвертый',
    'Пятый'
  ];

  List<String> touristinfo = [
    'Имя',
    'Фамилия',
    'Дата Рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
        // child: ExpansionPanelList(
        //     expansionCallback: (index, isExpanded) {
        //       setState(() {
        //         _list[index].isExpanded = !isExpanded;
        //       });
        //     },
        //     children: _list.map<ExpansionPanel>((ExpansionText item) {
        //       return ExpansionPanel(headerBuilder: (context, isExpanded) {
        //         return ListTile(
        //           title: Text(item.cotext),
        //         );
        //       },
        //           isExpanded: item.isExpanded,
        //           body: ListTile(
        //         title: Text(item.extext),
        //       ));
        //     }).toList()
        // )
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${touristnumberlist[0]} турист', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            CustomTextField(textfield: touristinfo[0],),
            CustomTextField(textfield: touristinfo[1],),
            CustomTextField(textfield: touristinfo[2],),
            CustomTextField(textfield: touristinfo[3],),
            CustomTextField(textfield: touristinfo[4],),
            CustomTextField(textfield: touristinfo[5],),
            const Text('Эти данные никому не передаются. После оплаты'
                ' мы вышли чек на указанный вами номер и почту', style: TextStyle(fontSize: 16, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}