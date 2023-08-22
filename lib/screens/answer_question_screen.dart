import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_and_question/screens/detail_answer_and_queston_screen.dart';

import '../bloc/answer_and_question_bloc/answer_and_question_bloc.dart';

class AnswerQuestionScreen extends StatefulWidget {
  const AnswerQuestionScreen({super.key});

  @override
  State<AnswerQuestionScreen> createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  bool isFAQ = true;

  // Список часто задаваемых вопросов
  List<String> FAQ = [
    'Может ли самозанятый (платильщик НПД) оформить социальный контракт с последующей регистрацией ИП?',
    'Может ли оформить социальный контракт по временной, а не постоянной прописке?',
    'По каким критериям определяют срок социального контракта?',
    'В случае если придпринимательская деятельность не  будет успешной, заставят ли меня вернуть денежные средства?',
    'Есть ли ограничения по направлениям ИП?'
  ];

  // Список отвеченных вопросов
  List<List<String>> readyCustomerQuestion = [
    [
      '15',
      'Добрый день, необходима консультация по открытию собстенного дела Я хотел бы спросить'
    ],
    [
      '14',
      'Приветствую, у меня имеется вопрос насчёт помощи в трудной жизненной ситуации'
    ],
  ];

  // Список вопросов в обработке
  List<List<String>> processingCustomerQuestion = [
    [
      '16',
      'Здравствуйте, возникли трудности с получением социального контракта. Я хотел бы спросить'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: BlocBuilder<AnswerAndQuestionBloc, AnswerAndQuestionState>(
        builder: (context, state) {
          // Скелетон
          if (state is AnswerAndQuestionSkeletonState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Помощь и вопросы',
                  style: TextStyle(
                      color: Color(0xff0D1421),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter'),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            const Color(0xffF5F5F5),
                            const Color(0xffF5F5F5).withOpacity(0)
                          ]),
                        ),
                      ),
                      Container(
                        height: 64,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            const Color(0xffF5F5F5),
                            const Color(0xffF5F5F5).withOpacity(0)
                          ]),
                        ),
                      ),
                      Container(
                        height: 22,
                        margin: EdgeInsets.only(
                            top: 8,
                            right:
                            (MediaQuery
                                .of(context)
                                .size
                                .width - 48) / 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            const Color(0xffF5F5F5),
                            const Color(0xffF5F5F5).withOpacity(0)
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AnswerAndQuestionLoadedState) {
            // Основной экран с данными
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: true,
                  title: Text(
                    'Помощь и вопросы',
                    style: TextStyle(
                      color: Color(0xff0D1421),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Виджет переключения между FAQ и своими вопросами
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width - 48) / 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFAQ = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Часто задаваемые',
                                  style: TextStyle(
                                    color: isFAQ
                                        ? const Color(0xff0D1421)
                                        : const Color(0xff667085),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: (MediaQuery
                                        .of(context)
                                        .size
                                        .width -
                                        48) /
                                        2 -
                                        32,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: isFAQ
                                          ? const Color(0xffFF6F3D)
                                          : const Color(0xffFF6F3D).withOpacity(0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width - 48) / 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFAQ = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Мои вопросы',
                                  style: TextStyle(
                                    color: isFAQ
                                        ? const Color(0xff667085)
                                        : const Color(0xff0D1421),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: (MediaQuery
                                        .of(context)
                                        .size
                                        .width -
                                        48) /
                                        2 -
                                        32,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: isFAQ
                                          ? const Color(0xffFF6F3D).withOpacity(0)
                                          : const Color(0xffFF6F3D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Виджет со списком вопросов
                isFAQ ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width -
                                      88,
                                  child: Text(
                                    FAQ[index],
                                    style: const TextStyle(
                                      color: Color(0xff0D1421),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    child:
                                    const Icon(Icons.keyboard_arrow_right),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 1,
                            color: const Color(0xffEAECF0),
                          ),
                        ],
                      );
                    },
                    childCount: FAQ.length,
                  ),
                )

                    :
                // Проверка есть ли в обработке вопросы или нет
                processingCustomerQuestion.isNotEmpty ?
                SliverToBoxAdapter(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Container(
                          width: 9,
                          height: 9,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffFF6F3D),
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                                color: const Color(0xffFF6F3D).withOpacity(0.2),
                                width: 2),
                          ),
                        ),
                        const Text(
                          'В обработке',
                          style: TextStyle(
                            color: Color(0xff0D1421),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : const SliverPadding(padding: EdgeInsets.zero),
                // В случае если нет ничего в обработке то пустая заглушка

                isFAQ ? const SliverPadding(padding: EdgeInsets.zero) :
                // Проверка есть ли в обработке вопросы или нет
                processingCustomerQuestion.isNotEmpty ?
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Обращение №${processingCustomerQuestion[index][0]}',
                                      style: const TextStyle(
                                        color: Color(0xff0D1421),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width -
                                          88,
                                      child: Text(
                                        processingCustomerQuestion[index][1],
                                        maxLines: 2, // максимальное количество строк
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xff0D1421),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const DetailAnswerQuestionScreen()),
                                      );
                                    },
                                    child:
                                    const Icon(Icons.keyboard_arrow_right),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 1,
                            color: const Color(0xffEAECF0),
                          ),
                        ],
                      );
                    },
                    childCount: processingCustomerQuestion.length,
                  ),
                ) : const SliverPadding(padding: EdgeInsets.zero),
                // В случае если нет ничего в обработке то пустая заглушка




                isFAQ ? const SliverPadding(padding: EdgeInsets.zero) :
                // Проверка есть ли в отвеченные вопросы или нет
                readyCustomerQuestion.isNotEmpty ?
                const SliverToBoxAdapter(child: Padding(
                  padding:  EdgeInsets.only(left: 24, right: 24, top: 16),
                  child: Text(
                    'Ответ получен',
                    style: TextStyle(
                      color: Color(0xff667085),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ) : const SliverPadding(padding: EdgeInsets.zero),

                isFAQ ? const SliverPadding(padding: EdgeInsets.zero) :
                // Проверка есть ли в обработке вопросы или нет
                readyCustomerQuestion.isNotEmpty ?
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Обращение №${readyCustomerQuestion[index][0]}',
                                      style: const TextStyle(
                                        color: Color(0xff0D1421),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width -
                                          88,
                                      child: Text(
                                        readyCustomerQuestion[index][1],
                                        maxLines: 2, // максимальное количество строк
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xff0D1421),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    child:
                                    const Icon(Icons.keyboard_arrow_right),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 1,
                            color: const Color(0xffEAECF0),
                          ),
                        ],
                      );
                    },
                    childCount: readyCustomerQuestion.length,
                  ),
                ) : const SliverPadding(padding: EdgeInsets.zero),
                // В случае если нет ничего в обработке то пустая заглушка





                // Виджет "Не нашли ответ на свой вопрос"
                SliverToBoxAdapter(
                  child: Padding(
                    padding: isFAQ
                        ? const EdgeInsets.only(top: 32, bottom: 48)
                        : const EdgeInsets.only(top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isFAQ
                            ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'Не нашли ответа на свой вопрос?',
                            style: TextStyle(
                              color: Color(0xff0D1421),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                            : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        isFAQ
                            ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'Напишите в поддержку и специалист ответит лично на ваш вопрос',
                            style: TextStyle(
                              color: Color(0xff667085),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                            : Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: const Color(0xffEAECF0),
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.only(
                              top: isFAQ ? 16 : 14, left: 24, right: 24),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor:
                              MaterialStateProperty.all(const Color(0xffFF6F3D)),
                              //minimumSize:
                            ),
                            child: const Text(
                              'Задать вопрос',
                              style: TextStyle(
                                color: Color(0xffFBFDFC),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
