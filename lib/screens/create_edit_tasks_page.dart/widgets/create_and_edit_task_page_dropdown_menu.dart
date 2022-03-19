import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class CreateAndEditTaskPageDropdownMenu extends StatelessWidget {
  const CreateAndEditTaskPageDropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.05,
      ),
      child: Consumer<CreateAndEditTaskController>(
        builder: (
          BuildContext context,
          value,
          Widget? child,
        ) {
          return DropdownButton<ImportanceLevel>(
            value: value.selectedImportanceLevel,
            onChanged:
                value.setselectedImportance, //mütiş kullanım,
            //! map fonksiyonunu öğren
            //! items ı create eden fonksiyonu ayır
            items: ImportanceLevel.values
                .map(
                  (ImportanceLevel item) => DropdownMenuItem<ImportanceLevel>(
                    //! burayı ayrı bir widget olarak yaz
                    value: item,
                    child: Row(
                      children: [
                        SvgCoveredSizedBox(
                          height: width * 0.08,
                          width: width * 0.08,
                          svgAssets: item.getImportanceLevelSvg,  
                        ),
                        
                        SizedBox(
                          width: width * 0.03,
                        ),
                        
                        Text(
                          item.getImportanceLevelText,
                          style: TextStyle(
                            fontSize: width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}