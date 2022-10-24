// Error message.

const serverFailureMessage = "Server Failure";

// API

const _aztroApi = "https://aztro.sameerkumar.website/";

String getAztroApi(String sign, String day) {
  return "$_aztroApi?sign=$sign&day=$day";
}

const zodiacSignString = [
  "aries",
  "taurus",
  "gemini",
  "cancer",
  "leo",
  "virgo",
  "libra",
  "scorpio",
  "sagittarius",
  "capricorn",
  "aquarius",
  "pisces",
];

const zodiacDayString = [
  "yesterday",
  "today",
  "tomorrow",
];

const zodiacColorList = [
  0xFFf19066,
  0xFFf5cd79,
  0xFF546de5,
  0xFFe15f41,
  0xFFc44569,
  0xFF786fa6,
  0xFFf8a5c2,
  0xFF63cdda,
  0xFFea8685,
  0xFF596275,
  0xFF574b90,
  0xFFf78fb3,
];

const zodiacIconList = [
  "01_aries.png",
  "02_taurus.png",
  "03_gemini.png",
  "04_cancer.png",
  "05_leo.png",
  "06_virgo.png",
  "07_libra.png",
  "08_scorpio.png",
  "09_sagittarius.png",
  "10_capricorn.png",
  "11_aquarius.png",
  "12_pisces.png",
];
