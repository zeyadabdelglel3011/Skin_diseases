class Data {
  final String pic;
  final String title;
  final String text;

  Data({required this.pic, required this.title, required this.text});
}

final List<Data> data = [
  Data(
    pic: "images/splash1.png",
    title: "Track Your Symptoms",
    text: "Stay on top of your skin's health by logging symptoms, treatments, and changes.",
  ),
  Data(
    pic: "images/splash2.png",
    title: "Personalized Treatment Plans",
    text: "Create and adjust care plans tailored to each patient's unique needs and skin conditions.",
  ),
  Data(
    pic: "images/splash3.png",
    title: "Patient Safety First",
    text: "Ensure the safest treatment with allergy checks and drug interaction alerts built into the system.",
  ),
];