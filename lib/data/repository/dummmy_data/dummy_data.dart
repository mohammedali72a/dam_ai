import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/models/article/article_type.dart';

List<Article> dummyArticlesList = [
  Article(
    id: "1",
    title:
        "أخبار مصر.. رئيس الوزراء: تسلم الدفعة الثانية من مستحقات رأس الحكمة خلال أسابيع",
    content:
        """نشر اليوم السابع خلال الساعات الأخيرة الماضية مجموعة من الاخبار الهامة على رأسها تأكيد الدكتور مصطفى مدبولي أن الحكومة، بمختلف وزاراتها، تعمل حاليا على تنفيذ التزاماتها المختلفة، في مشروع تطوير وتنمية مدينة رأس الحكمة، من خلال تيسير الإجراءات وتذليل أية عقبات؛ وذلك حتى يتسنى الإسراع ببدء تنفيذ المشروعات التنموية المختلفة، لافتا في هذا السياق إلى أنه سيتم خلال الأسابيع القليلة المقبلة تسلم الدفعة الثانية من المستحقات المالية للمشروع، كما يتم حاليا العمل على الترويج لعدة مشروعات استثمارية أخرى.
وأوضح الدكتور مصطفى مدبولي أنه تم التوافق على متابعة حركة السوق وتحقيق انخفاض للأسعار بما يتراوح بين 15 – 20 % خلال الفترة الحالية، مع العمل على الوصول بهذه النسبة إلى 30% عقب انتهاء عيد الفطر، مشيرا إلى أنه وفقًا لما تم التوافق عليه، فإنه يجب أن تنخفض الأسعار هذه الأيام بالنسب المقررة، على أن تزيد مستويات الانخفاض تدريجيًا خلال الأيام المقبلة.
وشدد رئيس مجلس الوزراء على ضرورة تكليف فرق عمل من جميع الوزارات والجهات المعنية والأجهزة الرقابية بالنزول إلى مختلف الأسواق للتأكد من خفض الأسعار بصورة حقيقية.
وخلال الاجتماع، أكد رئيس مجلس الوزراء أن هناك متابعة مستمرة للوضع الاقتصادي في ظل القرارات الأخيرة التي اتخذتها الدولة، مشيرا إلى أن الأمور تسير بوتيرة جيدة، مع استمرار الحكومة في اتخاذ الإجراءات الخاصة بالإصلاح الاقتصادي، والعمل على جذب الاستثمارات الخارجية، إضافة إلى الاستمرار في تعزيز فرص مشاركة القطاع الخاص في مختلف الأنشطة والقطاعات الاقتصادية.. وفيما يلى موجز لأهم الأخبار.""",
    images: ["https://img.youm7.com/large/202402230458125812.jpg"],
    datePosted: DateTime.now(),
    articleType: ArticleType.duUniversity,
  ),
  Article(
    id: "2",
    title:
        "WTO members examine ways to support smooth transition after graduation from LDC status",
    content:
        "Welcoming the decision on LDC graduation reached at the 13th WTO Ministerial Conference, WTO members shared experiences at a meeting of the Sub-Committee on Least Developed Countries (LDCs) on 25 March on how to support LDCs as they graduate from the LDC category. “It is very encouraging to see that WTO members have shown commitment to support a smooth transition for graduating LDCs,” said the newly elected chair of the Sub-Committee, Ambassador Ib Petersen of Denmark.",
    images: [
      "https://www.wto.org/images/img_index/photos/ldc_25mar24_lg.jpg",
    ],
    datePosted: DateTime.now(),
    articleType: ArticleType.education,
  ),
  Article(
    id: "3",
    title: "Territories in ACTION Live News",
    content:
        "Innovation for place-based transformations. ACTIONbook, practices and tools is a comprehensive hands-on resource set to empower local, regional and national stakeholders across Europe to drive societal well-being and climate-resilient development. More than 70 territories, including cities, regions, Member States and networks, are writing it and using it to draw together the map of innovative territories, sharing their experiences, learning from and with each other. On 9 April, we will present it and flesh it out in a Live streamed event with the President of the Committee of Regions, European Commissioners for Cohesion and Reforms and Research, Science and Innovation, and several Members of the European Parliament.",
    images: [
      "https://ec.europa.eu/regional_policy/images/upload/territories_ation.png"
    ],
    datePosted: DateTime.now(),
    articleType: ArticleType.duUniversity,
  ),
  Article(
    id: "4",
    title:
        "Russia-Ukraine latest: NATO 'considering shooting down missiles close to border'; Russia suggests UK-US had role in Moscow attack",
    content:
        "Russia's FSB chief Alexander Bortnikov has suggested Britain, the US and Ukraine could have been involved in the Moscow concert hall attack, which killed more than 130 people on Friday. Listen to a Daily podcast on how UK-made cars are getting into Russia while you scroll.",
    images: [
      "https://liveblog.digitalimages.sky/lc-images-sky/lcimg-c873b4b7-bda5-4a5c-8b0a-aa6d70604148.jpeg"
    ],
    datePosted: DateTime.now(),
    articleType: ArticleType.fairLife,
  ),
  Article(
    id: "5",
    title:
        "A vocal revolt: MSNBC personalities object to NBC News’ hiring of Ronna McDaniel as a contributor",
    content:
        """NEW YORK (AP) — The internal furor over NBC News’ decision to hire former Republican National Committee head Ronna McDaniel as a paid contributor spread Monday, with MSNBC personalities Rachel Maddow, Jen Psaki, Nicolle Wallace, Joy Reid, Lawrence O’Donnell and Joe Scarborough all using their shows to publicly object.
          Maddow, MSNBC’s most popular personality, compared it to putting a mobster to work in a district attorney’s office.
          “I find the decision to put her on the payroll inexplicable and I hope they will reconsider that decision,” she said on her weekly program Monday night.
          There was no immediate comment on Monday from NBC News or McDaniel about the extraordinary public revolt against network management that began with former “Meet the Press” moderator Chuck Todd a day earlier. Todd said that many NBC News journalists were uncomfortable with the hiring because of McDaniel’s “gaslighting” and “character assassination” while at the RNC.""",
    images: [
      "https://dims.apnews.com/dims4/default/7781f61/2147483647/strip/true/crop/4747x3163+0+1/resize/980x653!/format/webp/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F03%2Ff4%2Fbe8df831d48386c874e346174cbc%2F145b2412043d427c97c3a4a86f6cf0e7"
    ],
    datePosted: DateTime.now(),
    articleType: ArticleType.medicine,
  ),
  Article(
    id: "6",
    title: "CBS Mornings Deals: Save 25% on a digital picture frame",
    content:
        """This week on CBS Mornings, lifestyle expert Gayle Bass discussed deals on items that may make your life easier — all at exclusive discounts. Discover this week's exclusive deals below and visit CBSDeals.com or text "CBS" to 65000 to take advantage of them today.  

Disclaimer: CBS earns commissions on purchases made through CBSDeals.com. Deals are available for a limited time and while quantities last. Prices may change from the date of publication.""",
    images: [
      "https://assets2.cbsnewsstatic.com/hub/i/r/2024/03/26/6820c054-234a-4c9f-ab87-da79e515e61a/thumbnail/640x360/1078c1ba789a6a6c6fe6b68975bbe593/0326-cmo-cbsdeals-2787891-640x360.jpg?v=4baa656f7af774a52a8c6a88476cb826"
    ],
    datePosted: DateTime.now(),
    articleType: ArticleType.education,
  ),
];
