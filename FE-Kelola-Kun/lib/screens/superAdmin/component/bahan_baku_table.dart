import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_int2/models/item.dart';
import 'package:flutter/material.dart';

import 'detail_bahan_baku_page.dart';

class BahanBakuTable extends StatefulWidget {
  const BahanBakuTable({super.key});

  @override
  State<BahanBakuTable> createState() => _BahanBakuTableState();
}

List<Item> data = [
  Item(
    itemId: 1,
    name: 'Bahan Baku 1',
    price: 'Rp. 100.000',
    weight: '100',
    categoryId: 1,
  ),
  Item(
    itemId: 2,
    name: 'Bahan Baku 2',
    price: 'Rp. 200.000',
    weight: '200',
    categoryId: 1,
  ),
  Item(
    itemId: 3,
    name: 'Bahan Baku 3',
    price: 'Rp. 300.000',
    weight: '300',
    categoryId: 1,
  ),
  Item(
    itemId: 4,
    name: 'Bahan Baku 4',
    price: 'Rp. 400.000',
    weight: '400',
    categoryId: 1,
  ),
  Item(
    itemId: 5,
    name: 'Bahan Baku 5',
    price: 'Rp. 500.000',
    weight: '500',
    categoryId: 1,
  ),
  Item(
    itemId: 6,
    name: 'Bahan Baku 6',
    price: 'Rp. 600.000',
    weight: '600',
    categoryId: 1,
  ),
  Item(
    itemId: 7,
    name: 'Bahan Baku 7',
    price: 'Rp. 700.000',
    weight: '700',
    categoryId: 1,
  ),
  Item(
    itemId: 8,
    name: 'Bahan Baku 8',
    price: 'Rp. 800.000',
    weight: '800',
    categoryId: 1,
  ),
  Item(
    itemId: 9,
    name: 'Bahan Baku 9',
    price: 'Rp. 900.000',
    weight: '900',
    categoryId: 1,
  ),
  Item(
    itemId: 10,
    name: 'Bahan Baku 10',
    price: 'Rp. 1.000.000',
    weight: '1.000',
    categoryId: 1,
  ),
  Item(
    itemId: 11,
    name: 'Bahan Baku 11',
    price: 'Rp. 1.100.000',
    weight: '1.100',
    categoryId: 1,
  ),
];

class _BahanBakuTableState extends State<BahanBakuTable> {
  bool sort = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        child: PaginatedDataTable(
          // sortColumnIndex: sortColumnIndex,
          sortAscending: sort,
          horizontalMargin: 10,
          columnSpacing: 12,
          headingRowHeight: 40,
          dataRowHeight: 36,
          columns: [
            DataColumn(
              label: Text(
                'No.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Id Bahan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Nama Bahan Baku',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Berat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Harga',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
          ],
          rowsPerPage: 5,
          source: _DataSource(data, context, data.length),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<Item> data;
  final BuildContext context;
  final count;

  _DataSource(this.data, this.context, this.count) {
    // filteredData = data;
  }

  @override
  DataRow? getRow(int index) {
    debugPrint(count.toString());
    if (index >= rowCount) {
      return null;
    } else {
      return recentFileDataRow(index, data[index]);
    }

    // final item = filteredData[index];
  }

  DataRow recentFileDataRow(int index, var item) {
    debugPrint(index.toString());
    return DataRow(
      cells: [
        // for (int i = 0; i < 12; i++) ...[
        DataCell(
          Text(
            (index + 1).toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        DataCell(
          Text(
            item.itemId.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        DataCell(
          Text(
            item.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        DataCell(
          Text(
            item.weight,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        DataCell(
          Text(
            item.price,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBahanBakuPage(),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
      ],
      // ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}
