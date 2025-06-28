class MedicalBlog {
 final String pic , title , desc ;

  MedicalBlog({required this.pic, required this.title, required this.desc});
}
List<MedicalBlog> medicalData = [
  MedicalBlog(
      pic: "images/first.png",
      title: "Seborrhea Dermatitis",
      desc: "Seborrhea (seb-o-REE-ik) dermatitis is a common skin condition that mainly affects your scalp. It causes scaly patches, inflamed skin and stubborn dandruff. It usually affects oily areas of the body, such as the face, sides of the nose, eyebrows, ears, eyelids and chest"),

  MedicalBlog(
      pic: "images/second.png",
      title: "Monkeypox",
      desc: "Mpox (formerly known as monkeypox) is a disease caused by infection with a virus, known as  Monkeypox virus. This virus is part of the same family as the virus that causes smallpox. People with mpox often get a rash, along with other symptoms"),

  MedicalBlog(
      pic: "images/third.png",
      title: "Hives (Urticaria)",
      desc: "Hives — also called urticaria (ur-tih-KAR-e-uh) — is a skin reaction that causes itchy welts. Chronic hives are welts that last for more than six weeks and return often over months or years. Often, the cause of chronic hives isn't clear."),

];