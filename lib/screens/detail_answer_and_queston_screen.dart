import 'package:flutter/material.dart';

class DetailAnswerQuestionScreen extends StatefulWidget {
  const DetailAnswerQuestionScreen({super.key});

  @override
  State<DetailAnswerQuestionScreen> createState() => _DetailAnswerQuestionScreenState();
}

class _DetailAnswerQuestionScreenState extends State<DetailAnswerQuestionScreen> {

  String title = '15';
  String date = '13 августа 2023 года в 09:41';
  String nameHelper = 'Островский Константин';
  String textQuestion = 'Здравствуйте, возникли трудности с получением социального контракта. Но экономическая повестка сегодняшнего дня прекрасно подходит для реализации позиций, занимаемых участниками в отношении поставленных задач. Как принято считать, базовые сценарии поведения пользователей, вне зависимости от их уровня, должны быть преданы социально-демократической анафеме. Повседневная практика показывает, что консультация с широким активом позволяет выполнить важные задания по разработке соответствующих условий активизации. ';

  bool isReadyAnswer = true;

  bool viewFull = false;

  List<String> questionDocument = ['Справка о доходах.pdf', 'Заявление на соцконтр...docx', 'IMG_5547.png', 'RAR-архив.rar', 'ZIP-архив.zip'];
  List<String> answerDocument = ['Образец заявления на...docx'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Обращение №$title',
          style: const TextStyle(
              color: Color(0xff0D1421),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Виджет вопроса человека
            Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Ваш вопрос',
                      style: TextStyle(
                        color: Color(0xff0D1421),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xff667085),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: viewFull ? Column(
                      children: [
                        Text(
                          textQuestion,
                          style: const TextStyle(
                            color: Color(0xff0D1421),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 88 * questionDocument.length.toDouble(),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: questionDocument.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {

                                String typeDocument;
                                switch(questionDocument[index].split('.').last){
                                  case 'pdf':
                                    typeDocument = 'pdf';
                                    break;
                                  case 'img':
                                    typeDocument = 'img';
                                    break;
                                  case 'png':
                                    typeDocument = 'img';
                                    break;
                                  case 'jpeg':
                                    typeDocument = 'img';
                                    break;
                                  case 'rar':
                                    typeDocument = 'rar';
                                    break;
                                  case 'zip':
                                    typeDocument = 'zip';
                                    break;
                                  case 'doc':
                                    typeDocument = 'doc';
                                    break;
                                  case 'docx':
                                    typeDocument = 'doc';
                                    break;
                                  default:
                                    typeDocument = 'doc';
                                }

                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                                  margin: questionDocument.length - 1 != index ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xffEAECF0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Image.asset('assets/images/$typeDocument.png', width: 56, height: 56,),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              questionDocument[index],
                                              style: const TextStyle(
                                                color: Color(0xff0D1421),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text(
                                                  '193 КБ',
                                                  style: TextStyle(
                                                    color: Color(0xff667085),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: const Icon(Icons.delete_outline, size: 20, color: Color(0xff667085),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    )
                        : Text(
                      textQuestion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff0D1421),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        viewFull= !viewFull;
                      });
                    },
                    child: viewFull ? Row(
                      children: [
                        const Text(
                          'Скрыть',
                          style: TextStyle(
                            color: Color(0xff667085),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Image.asset('assets/images/chevron-up.png', width: 16, height: 16,),
                        ),
                        //Icon(Icons.arrow_drop_up, color: Color(0xff667085), size: 16,),
                      ],
                    ) : Row(
                      children: [
                        const Text(
                          'Показать полностью',
                          style: TextStyle(
                            color: Color(0xff667085),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Image.asset('assets/images/chevron-down.png', width: 16, height: 16,),
                        ),
                        // Icon(Icons.arrow_drop_down, color: Color(0xff667085), size: 16,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Виджет отражения есть ли ответ
            isReadyAnswer ?
            // Вариация когда есть ответ
            Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Ответ',
                      style: TextStyle(
                        color: Color(0xff0D1421),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xff667085),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      nameHelper,
                      style: const TextStyle(
                        color: Color(0xff667085),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          textQuestion,
                          style: const TextStyle(
                            color: Color(0xff0D1421),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 88 * answerDocument.length.toDouble(),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: answerDocument.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                // Переменная для типа документа
                                String typeDocument;
                                switch(answerDocument[index].split('.').last){
                                  case 'pdf':
                                    typeDocument = 'pdf';
                                    break;
                                  case 'img':
                                    typeDocument = 'img';
                                    break;
                                  case 'png':
                                    typeDocument = 'img';
                                    break;
                                  case 'jpeg':
                                    typeDocument = 'img';
                                    break;
                                  case 'rar':
                                    typeDocument = 'rar';
                                    break;
                                  case 'zip':
                                    typeDocument = 'zip';
                                    break;
                                  case 'doc':
                                    typeDocument = 'doc';
                                    break;
                                  case 'docx':
                                    typeDocument = 'doc';
                                    break;
                                  default:
                                    typeDocument = 'doc';
                                }

                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                                  margin: answerDocument.length - 1 != index ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xffEAECF0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Image.asset('assets/images/$typeDocument.png', width: 56, height: 56,),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              answerDocument[index],
                                              style: const TextStyle(
                                                color: Color(0xff0D1421),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text(
                                                  '193 КБ',
                                                  style: TextStyle(
                                                    color: Color(0xff667085),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: const Icon(Icons.delete_outline, size: 20, color: Color(0xff667085),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ) :
            // Вариация когда нет ответа
            Column(
              children: [
                Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEAECF0).withOpacity(0.2),),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: Center(
                    child: Container(
                      width: 192,
                      height: 192,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffEAECF0).withOpacity(0.4),),
                        borderRadius: BorderRadius.circular(180),
                      ),
                      child: Center(
                        child: Container(
                          width: 144,
                          height: 144,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffEAECF0).withOpacity(0.6),),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Center(
                            child: Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffEAECF0).withOpacity(0.8),),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: Center(
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xffEAECF0),),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.message_outlined,
                                    color: Color(0xff354153),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 16, left: 32, right: 32),
                  child: Text(
                    'Ожидаем ответа специалиста',
                    style: TextStyle(
                      color: Color(0xff0D1421),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    //'Когда специалист ответит \u00A0на обращение, его ответ\u00A0 отобразится здесь',
                    'Когда специалист ответит \nна обращение, его ответ\nотобразится здесь',
                    style: TextStyle(
                      color: Color(0xff667085),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
