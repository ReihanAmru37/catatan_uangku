import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/data/flow.dart';
import 'package:my_cash_book/app/utils/database_helper.dart';
import 'package:my_cash_book/app/utils/extract_month.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final dbHelper = DatabaseHelper.instance;
  RxList<flow> cashflows = RxList<flow>();

  // Deklarasi dan inisialisasi list data totalIncome dan totalExpense
  RxList<FlSpot> incomeSpots = RxList<FlSpot>();
  RxList<FlSpot> expendSpots = RxList<FlSpot>();

  @override
  void onInit() {
    super.onInit();
    loadCashflows();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void reInitialize() {
    onInit();
  }

  // Fungsi untuk mengisi data totalIncome dan totalExpense dari cashflow
  void fillSpotsFromCashflows(List<flow> flows) {
    // Bersihkan list sebelum mengisi ulang
    incomeSpots.clear();
    expendSpots.clear();

    // Buat map untuk mengelompokkan nilai berdasarkan tanggal
    final incomeMap = <double, double>{};
    final expendMap = <double, double>{};

    // Iterasi melalui cashflows
    for (final flow in flows) {
      final date = flow.date; // Ubah ini sesuai dengan format tanggal Anda
      final nominal = flow.nominal.toDouble(); // Ubah ke double

      // Tentukan apakah ini income atau expense berdasarkan status
      if (flow.status == 'income') {
        if (incomeMap.containsKey(extractMonth(date))) {
          // Jika tanggal sudah ada, tambahkan nominal ke nilai yang sudah ada
          incomeMap[extractMonth(date)] =
              (incomeMap[extractMonth(date)] ?? 0) + nominal;
        } else {
          // Jika tanggal belum ada, tambahkan sebagai kunci baru
          incomeMap[extractMonth(date)] = nominal;
        }
      } else if (flow.status == 'expend') {
        if (expendMap.containsKey(extractMonth(date))) {
          // Jika tanggal sudah ada, tambahkan nominal ke nilai yang sudah ada
          expendMap[extractMonth(date)] =
              (expendMap[extractMonth(date)] ?? 0) + nominal;
        } else {
          // Jika tanggal belum ada, tambahkan sebagai kunci baru
          expendMap[extractMonth(date)] = nominal;
        }
      }
    }

    // Konversi map menjadi daftar FlSpot
    incomeSpots.addAll(
        incomeMap.entries.map((entry) => FlSpot(entry.key, entry.value)));
    expendSpots.addAll(
        expendMap.entries.map((entry) => FlSpot(entry.key, entry.value)));

    print(incomeSpots);
    print(expendSpots);
  }

  void loadCashflows() async {
    final cashflowList = await dbHelper.getCashflows();
    cashflows.assignAll(cashflowList);

    fillSpotsFromCashflows(cashflowList);
    update();
  }
}
