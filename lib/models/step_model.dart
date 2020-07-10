class StepModel {
  final int id;
  final String text,title;

  StepModel({this.id, this.text,this.title});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "Build stronge Community\nShare eco-friendly ideas\nImplement together",
      title:"Build Community"
    ),
    StepModel(
      id: 2,
      text:
          "Plant more tree\nGrow them\nmake earth happy",
        title:"Plant Tree"
    ),
    StepModel(
      id: 3,
      text: "Scan QR-code\nKeep digital record\nBuild statestics",
        title:"Keep Records"
    ),
  ];
}
