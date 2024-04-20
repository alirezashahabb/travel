class Travel {
  final String name;
  final String location;
  final String img;
  final String distance;
  final String temp;
  final String rating;
  final String description;
  final String price;

  Travel({
    required this.name,
    required this.location,
    required this.img,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.description,
    required this.price,
  });
}

List<Travel> travelList = [
  Travel(
      name: 'گیلان',
      location: 'شمال',
      img: 'assets/img/shomal.jpg',
      distance: '500کیلومتر',
      temp: '23درجه',
      rating: '4.5',
      description:
          'استان گیلان، یکی از زیباترین و سرسبزترین استان‌های کشور ایران است. این استان در میان کوه‌های البرز و تالش در شمال کشور قرار گرفته‌ است. گیلان از شمال به دریای خزر و کشور جمهوری آذربایجان، از غرب به استان اردبیل، از شرق به استان مازندران و از جنوب به استان زنجان و قزوین محدود می‌شود. مرکز استان گیلان، شهر رشت است. جاهای دیدنی رشت هم بسیار است',
      price: '200000'),
  Travel(
      name: 'کردستان',
      location: 'غرب',
      img: 'assets/img/gharb.png',
      distance: '340کیلومتر',
      temp: '25 درجه',
      rating: '4',
      description:
          'استان کردستان که یکی از استان‌های غربی کشورمان به شمار می‌رود، در دامنه رشته کوه‌های زاگرس قرار گرفته است. سروآباد، سنندج، دهگلان، سقز، دیواندره، مریوان، بیجار، بانه، کامیاران و قروه، از شهرستان‌های کردستان به شمار می‌روند. کردستان به عنوان یکی از زیباترین استان‌های ایران شناخته می‌شود',
      price: '180000'),
  Travel(
      name: 'بندر عباس',
      location: 'جنوب',
      img: 'assets/img/jonob.png',
      distance: '30 کیلومتر',
      temp: '70 درجه',
      rating: '3.9',
      description:
          'سفر به خطه جنوبی کشور یکی از جذاب ترین سفرهای داخلی محسوب می شود، مخصوصا سفر به بندرعباس یکی از خاطره انگیزترین سفرهای عمرتان خواهد بود. بندرعباس شهری با مردم خونگرم و جاذبه های دیدنی خود، میزبان مسافرانی از داخل و خارج کشور است',
      price: '5500000'),
  Travel(
      name: 'مشهد',
      location: 'شرق',
      img: 'assets/img/shargh.png',
      distance: '1200 کیلومتر',
      temp: '40 درجه',
      rating: '5',
      description:
          'شهر مشهد و اقع در استان خراسان رضوی یکی از استان‌های تاریخی و مذهبی ایران محسوب می‌شود. این شهر سالانه میزبان حدود ۲۷ میلیون نفر از مسافران داخلی و خارجی است که برای زیارت و مراسم‌های مذهبی به این مکان سفر می‌کنند. دلیل اصلی این حجم مسافر و گردشگر وجود بارگاه امام رضا(ع) در شهر مشهد است. این شهر به لحاظ فرهنگی هم بسیار غنی است',
      price: '90000'),
];
