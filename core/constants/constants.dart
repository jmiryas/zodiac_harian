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
  0xFFccae62,
  0xFFc44569,
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

const zodiacImageList = [
  "01_aries_image.png",
  "02_taurus_image.png",
  "03_gemini_image.png",
  "04_cancer_image.png",
  "05_leo_image.png",
  "06_virgo_image.png",
  "07_libra_image.png",
  "08_scorpio_image.png",
  "09_sagittarius_image.png",
  "10_capricorn_image.png",
  "11_aquarius_image.png",
  "12_pisces_image.png",
];

const primaryColor = 0xFF227093;
const secondaryColor = 0xFF576574;
