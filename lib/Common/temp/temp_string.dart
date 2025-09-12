
import 'package:e_commerce46/Common/temp/temp_model.dart';

import '../image.dart';

List<String> carouselList = [
  'https://s3-alpha-sig.figma.com/img/60a7/e8d7/dacdf948b46a66800d6a7c98d4baca74?Expires=1682294400&Signature=egLti~010X2QKAL1OclhBzA34jB-0625-kJDCsCHeex4ISqwp9~wYG7-DQYJbVvad2wyDOtk8DbmDi5JUzdy3VIkJw8Dulox~xEEORKfkCQ5-curTmxCj7jivlCH7sm~XFUaxz3ltctruBIQJUZxZtBBphSxFtwJGS63HZy9qpXZ8dvRTWCeT1Eps0TzHBjR7ixkpa5hW78nw~Tj39Tc4aCEpKhni42A5TkdmEAveNvz~~UrXoNTGKkwrid3Pg26OoinbBp92mlFY~d2Upv0TlZ3ne5Wssp8kg6pjwcvIiUg4zWrjvOx3YEO9BlwR9Kt0FuyS0EkOOZ3AsIwsNXyWw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  'https://s3-alpha-sig.figma.com/img/70b0/9551/e273b407a810c7fda07aa24cd39464d7?Expires=1682294400&Signature=HYApTImhR6AgRvLwyYJk9O5yL3HjomaBJrOFfIAaVAAL-KCi0FoZPmaaRXEwd4bUPo6H7VbgWOexLmdTMgv~~Mpe03vgHUv9A4GbV-A8jtcgOHN04W9wV2g2k4UlPoGumSd5QR7z-ncD8JiAimdYAFRr0okJ-xWfcP0S~S10etpj46m3VmXrM6ZzJOeFOs8~5aulxWXI0VonlLZV05gImEGqnudK6Yw79GWv7Lu6Ziz8fNLQReraGNizOEbOWU92B~O99ZADj5BvN0sbCl7zY9~Nc6q6oM54~jZTDOL8-EJNWiVlUt-q9R~zHJ0o6-8TXivkVLeq2O53GV1TgLatMQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  'https://s3-alpha-sig.figma.com/img/019b/5141/d25b7799cd0e8ae2cfc630ee5d61b174?Expires=1682294400&Signature=Ae1zXSI2x7WhPzJuC4yl8D0oTcT2v84WK26wwp6AE50H9iqMcH-7ChKALN5oCkS8jzQgr1s187bKVW2cKE0s3Mw7m7WAmB63azU2zY8PfEGIAPZxB~wUMh3ISiU7uqv0MS3YrUiFjc8C4Qr89Jt0SUmMpQ-DfU~wxZxK5pkVX5bJcJExbd7EpaTTzsZIuQsUXdiZtmeOLEmMYuVRfc4grSzJFT5uCIi1AY3PJTDvzCdG0xHZYDnvabnMSI1G1xTny94VOyYR~YWOVl8X1-qstb7qCn~1HOW5l1t0UX8fb~UWrdMIw~puARBriMfucu09OJShLOwvnODmm5XtEG3jWA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'
];

List<CategoryModel> categoryList = [
  CategoryModel(title: 'Food', imageUrl: PNGImages.cd1),
  CategoryModel(title: 'Frozen', imageUrl: PNGImages.cd2),
  CategoryModel(title: 'Health & Beauty', imageUrl: PNGImages.cd3),
  CategoryModel(title: 'Office', imageUrl: PNGImages.cd4),
  CategoryModel(title: 'Packaging', imageUrl: PNGImages.cd5),
  CategoryModel(title: 'Food', imageUrl: PNGImages.cd1),
  CategoryModel(title: 'Frozen', imageUrl: PNGImages.cd2),
];
List<CategoryModel> brandList = [
  CategoryModel(title: 'Apple', imageUrl: PNGImages.pb1),
  CategoryModel(title: 'Lacoste', imageUrl: PNGImages.pb2),
  CategoryModel(title: 'Gap', imageUrl: PNGImages.pb3),
  CategoryModel(title: 'Lacoste', imageUrl: PNGImages.pb2),
  CategoryModel(title: 'Gap', imageUrl: PNGImages.pb3),
];
List<CategoryModel> productByCountryList = [
  CategoryModel(title: 'India', imageUrl: PNGImages.co1),
  CategoryModel(title: 'Algeria', imageUrl: PNGImages.co2),
];
