class ChatModels {
  String pesan, waktu, image;
  bool pengirim;

  ChatModels({
    this.pesan,
    this.waktu,
    this.pengirim,
    this.image,
  });
}

List<ChatModels> messages = [
  ChatModels(
    pesan:
        "Hallo Maya, Hari ini film-film apa saja yang sedang tayang di bioskop ? ",
    waktu: "07:00 PM",
    pengirim: false, // mengaktifkan image
    image: "images/assets/Tommy.png",
  ),
  ChatModels(
    pesan:
        "Hallo mas Tommy, hari ini yang sedang tayang film-film Drama, Action, Science Fiction, dan Comedy mas Tommy.",
    waktu: "07:05 PM",
    pengirim: false,
    image: "images/assets/guide cinema 21.png",
  ),
  ChatModels(
    pesan:
        "Kalau film Animasi tayang ga hari ini.. anak saya & keluarga ingin nonton animasi.",
    waktu: "07:15 PM",
    pengirim: true,
    image: "images/assets/Tommy.png",
  ),
  ChatModels(
    pesan: "Film-film animasi lusa akan tayang di semua bioskop mas tommy.",
    waktu: "07:20 PM",
    pengirim: false,
    image: "images/assets/guide cinema 21.png",
  ),
  ChatModels(
    pesan:
        "Oo begitu yaa... kalau begitu saya pesan dari sekarang tiketnya. Saya pesan 11 tiket.",
    waktu: "07:23 PM",
    pengirim: true,
    image: "images/assets/Tommy.png",
  ),
  ChatModels(
    pesan: "Baik mas tommy saya buatkan tiket 11 orang untuk anda.",
    waktu: "07:26 PM",
    pengirim: false,
    image: "images/assets/guide cinema 21.png",
  ),
];
