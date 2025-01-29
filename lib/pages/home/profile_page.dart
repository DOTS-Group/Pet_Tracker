import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';

import '../../widgets/generaladdbutton_widget.dart';
import '../../controllers/home/profilepage_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/general/auth_required_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        try {
          ProfilepageController().checkAuth(ref);
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildProfileHeader(context),
                            const SizedBox(height: 24),
                            _buildTabBar(),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPetsTab(),
                    _buildVaccinesTab(),
                    _buildFoodStockTab(),
                  ],
                ),
              ),
            ),
            floatingActionButton: _buildFloatingActionButton(context),
          );
        } catch (e) {
          return const AuthRequiredWidget();
        }
      },
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: SharedConstants.orangeColor.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 40,
                color: SharedConstants.orangeColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'İsmail Can Korucu',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '@ismailcankorucu',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.pets,
                          size: 16, color: SharedConstants.orangeColor),
                      const SizedBox(width: 4),
                      Text(
                        context.tr('pets', args: ['1']),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/qrcode'),
                  icon: Icon(Icons.qr_code, color: SharedConstants.orangeColor),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                  icon:
                      Icon(Icons.settings, color: SharedConstants.orangeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: SharedConstants.orangeColor,
        unselectedLabelColor: Colors.grey,
        indicatorColor: SharedConstants.orangeColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(text: context.tr('myPets')),
          Tab(text: context.tr('vaccines')),
          Tab(text: context.tr('foodStock')),
        ],
      ),
    );
  }

  Widget _buildPetsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 1,
      itemBuilder: (context, index) {
        return _buildPetCard();
      },
    );
  }

  Widget _buildPetCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: SharedConstants.blueColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.pets,
                size: 64,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poyraz',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: SharedConstants.orangeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '67 Kg',
                        style: TextStyle(
                          color: SharedConstants.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Rottweiler',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3, // Örnek veri
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: SharedConstants.orangeColor.withOpacity(0.1),
              child: Icon(Icons.medical_services,
                  color: SharedConstants.orangeColor),
            ),
            title: Text('Kuduz Aşısı ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                    'Son Aşı: ${DateTime.now().subtract(Duration(days: index * 30)).toString().split(' ')[0]}'),
                Text(
                    'Sonraki Aşı: ${DateTime.now().add(Duration(days: 30 - index * 10)).toString().split(' ')[0]}'),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                color: SharedConstants.orangeColor),
            onTap: () => Navigator.pushNamed(context, '/vaccinedetails'),
          ),
        );
      },
    );
  }

  Widget _buildFoodStockTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2, // Örnek veri
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: SharedConstants.blueColor.withOpacity(0.1),
              child: Icon(Icons.food_bank, color: SharedConstants.blueColor),
            ),
            title: Text('Royal Canin ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Stok: ${(index + 1) * 5} kg'),
                Text(
                    'Son Alım: ${DateTime.now().subtract(Duration(days: index * 15)).toString().split(' ')[0]}'),
              ],
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, color: SharedConstants.blueColor),
            onTap: () => Navigator.pushNamed(context, '/foodTracking'),
          ),
        );
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: SharedConstants.orangeColor,
      onPressed: () {
        switch (_tabController.index) {
          case 0:
            Navigator.pushNamed(context, '/petadd');
            break;
          case 1:
            Navigator.pushNamed(context, '/vaccinedetails');
            break;
          case 2:
            Navigator.pushNamed(context, '/foodTracking');
            break;
        }
      },
      child: const Icon(Icons.add),
    );
  }
}

class FoodTrackingWidget extends StatelessWidget {
  const FoodTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * SharedConstants.paddingSmall,
          ),
          child: ListtileCardWidget(
            icon: Icons.food_bank,
            iconInfoText: "K. Mama",
            title: "Mama Markası",
            subtitle: "Mama detay bilgisi",
            informationdata: "id: 123456789",
            isShowShoppingButton: true,
          ),
        ),
        GeneralAddButton(route: '/foodadd'),
      ],
    );
  }
}

class PetVaccineWidget extends StatelessWidget {
  const PetVaccineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PetSelectedDropdownButtonWidget(),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingSmall,
                ),
                child: index == 1
                    ? GeneralAddButton(
                        route: '/vaccineadd',
                      )
                    : ListtileCardWidget(
                        icon: Icons.vaccines,
                        iconInfoText: "Aşı",
                        title: "İşlem adı",
                        subtitle: "Klinik Adı",
                        informationdata: "id: 123456789",
                        date: "24.10.2025 - 12:30",
                        isShowShoppingButton: false,
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ListtileCardWidget extends StatelessWidget {
  final IconData icon;
  final String iconInfoText, title, subtitle, informationdata;
  final String? date;
  final bool? isShowShoppingButton;
  const ListtileCardWidget({
    required this.icon,
    required this.iconInfoText,
    required this.title,
    required this.subtitle,
    required this.informationdata,
    this.date,
    this.isShowShoppingButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: SharedConstants.orangeColor,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * SharedConstants.paddingGenerall,
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leading Icon and Info
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: SharedConstants.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      height * SharedConstants.paddingSmall,
                    ),
                    child: Icon(
                      icon,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * SharedConstants.paddingSmall,
                  ),
                  child: Text(
                    iconInfoText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: SharedConstants.whiteColor,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * SharedConstants.paddingGenerall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 2; i++)
                    Text(
                      i == 0 ? title : subtitle,
                      style: i == 0
                          ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: SharedConstants.whiteColor,
                              )
                          : Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: SharedConstants.whiteColor,
                              ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < 2; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      top: i == 0 ? 0 : height * SharedConstants.paddingSmall,
                    ),
                    child: isShowShoppingButton == true
                        ? i == 0
                            ? Text(
                                informationdata,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: SharedConstants.whiteColor,
                                    ),
                              )
                            : GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/market'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: SharedConstants.whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      height * SharedConstants.paddingGenerall,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          height * SharedConstants.paddingSmall,
                                      horizontal:
                                          width * SharedConstants.paddingMedium,
                                    ),
                                    child: Text(
                                      "Satın Al",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              )
                        : Text(
                            i == 0 ? informationdata : "24.10.2025 - 12:30",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: SharedConstants.whiteColor,
                                    ),
                          ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyPetsWidget extends StatelessWidget {
  const MyPetsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: width * SharedConstants.paddingGenerall,
          ),
          child: PetInfoCardWidget(),
        ),
        // Add Pet Button
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: GeneralAddButton(
            route: '/petadd',
          ),
        ),
      ],
    );
  }
}

class PetInfoCardWidget extends StatelessWidget {
  const PetInfoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: SharedConstants.blueColor,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // horizontal: width * SharedConstants.paddingGenerall,
          vertical: height * SharedConstants.paddingGenerall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Pet
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      height * 0.025,
                    ),
                    child: Placeholder(
                      fallbackHeight: height * 0.05,
                      fallbackWidth: height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  // Info Pet
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * SharedConstants.paddingGenerall,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Text(
                            i == 0 ? "Poyraz" : "Rottweiler",
                            style: i == 0
                                ? Theme.of(context).textTheme.bodyMedium
                                : Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: SharedConstants.whiteColor,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * SharedConstants.paddingGenerall,
                          vertical: height * SharedConstants.paddingSmall),
                      child: Text(
                        "67 Kg",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image List
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: SizedBox(
                height: height * 0.11,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: width * SharedConstants.paddingGenerall,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: Placeholder(
                          fallbackHeight: height * 0.11,
                          fallbackWidth: height * 0.11,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: width * SharedConstants.paddingGenerall,
              ),
              child: SizedBox(
                width: width * 0.4,
                child: const GeneralButtonWidget(
                  text: "Fotoğraf Yükle",
                  backgroundColor: SharedConstants.whiteColor,
                  textColor: SharedConstants.blackColor,
                  isSmall: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
