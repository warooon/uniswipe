import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController {

  var profiles = <Map<String, dynamic>>[].obs;
  var swipeItems = <SwipeItem>[].obs;
  Rx<MatchEngine?> matchEngine = Rx<MatchEngine?>(null);  

  @override
  void onInit() {
    super.onInit();

    profiles.addAll([
      {
        'name': 'Ava',
        'age': 24,
        'bio': 'Into AI Research and Coffee! ☕',
        'imageUrl': 'https://randomuser.me/api/portraits/women/5.jpg'
      },
      {
        'name': 'Liam',
        'age': 27,
        'bio': 'Tech enthusiast & foodie 🍣',
        'imageUrl': 'https://randomuser.me/api/portraits/men/23.jpg'
      },
      {
        'name': 'Sophia',
        'age': 22,
        'bio': 'Looking for fellow researchers 🌍',
        'imageUrl': 'https://randomuser.me/api/portraits/women/12.jpg'
      },
      {
        'name': 'James',
        'age': 29,
        'bio': 'Acoustic Engineering Intern 🎸',
        'imageUrl': 'https://randomuser.me/api/portraits/men/32.jpg'
      }
    ]);

    swipeItems.addAll(profiles.map((profile) {
      return SwipeItem(
        content: profile,
        likeAction: () {},
        nopeAction: () {},
        superlikeAction: () {},
      );
    }).toList());

    matchEngine.value = MatchEngine(swipeItems: swipeItems);
  }
}
