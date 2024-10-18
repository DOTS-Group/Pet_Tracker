import 'package:flutter/material.dart';
import '../../shared/constants_shared.dart';

class SettingsListtileWidget extends StatelessWidget {
  final List<dynamic> listileList;

  const SettingsListtileWidget({
    required this.listileList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingSmall),
          child: Text(
            listileList[0],
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        // Ayarlar Listesi
        ListView.builder(
          shrinkWrap: true, // Column içinde boyut problemini önlemek için
          physics:
              const NeverScrollableScrollPhysics(), // İçeride kaydırmayı kapat
          itemCount: listileList.length - 1, // İlk eleman başlık olduğu için
          itemBuilder: (context, index) {
            final item = listileList[index + 1]; // Başlığı atlamak için
            return ListTile(
              contentPadding: EdgeInsets.zero, // Padding ve margin kaldırıldı
              leading: Container(
                decoration: BoxDecoration(
                  color: item.leadingIconColor,
                  borderRadius: BorderRadius.circular(
                    height * SharedConstants.paddingSmall,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    height * SharedConstants.paddingSmall,
                  ),
                  child: Icon(item.leadingIcon),
                ),
              ),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: item.trailingIconPressed,
            );
          },
        ),
      ],
    );
  }
}
