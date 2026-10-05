import '../models/driver.dart';

class DummyData {
  // ==========================================================
  // DRIVER
  // ==========================================================

  static final List<Driver> drivers = [
    const Driver(
      id: 'D001',
      name: 'Andi Pratama',
      nim: '221401001',
      vehicle: 'Honda Beat',
      plateNumber: 'BK 1234 ABC',
      rating: 4.9,
      totalTrips: 128,
      distance: 0.8,
      isOnline: true,
      faculty: 'Fasilkom-TI',
      price: 8000,
    ),

    const Driver(
      id: 'D002',
      name: 'Muhammad Fajar',
      nim: '221401015',
      vehicle: 'Honda Vario',
      plateNumber: 'BK 5678 DEF',
      rating: 4.8,
      totalTrips: 96,
      distance: 1.2,
      isOnline: true,
      faculty: 'Teknik',
      price: 9000,
    ),

    const Driver(
      id: 'D003',
      name: 'Rizky Ramadhan',
      nim: '221401028',
      vehicle: 'Yamaha NMAX',
      plateNumber: 'BK 9012 GHI',
      rating: 4.7,
      totalTrips: 75,
      distance: 1.7,
      isOnline: true,
      faculty: 'Ekonomi',
      price: 10000,
    ),

    const Driver(
      id: 'D004',
      name: 'Dimas Saputra',
      nim: '221401041',
      vehicle: 'Honda Scoopy',
      plateNumber: 'BK 3456 JKL',
      rating: 4.9,
      totalTrips: 143,
      distance: 2.1,
      isOnline: false,
      faculty: 'Hukum',
      price: 8500,
    ),
  ];

  // ==========================================================
  // PASSENGER
  // ==========================================================

  static final PassengerData passenger = const PassengerData(
    id: 'P001',
    name: 'Jefri Al Bukhori',
    nim: '241401142',
    faculty: 'Fasilkom-TI',
    university: 'Universitas Sumatera Utara',
    phone: '081234567890',
    isVerified: true,
  );

  static final List<PassengerData> passengers = [
    passenger,
  ];

  // ==========================================================
  // TRIP
  // ==========================================================

  static final List<TripData> trips = [
    const TripData(
      id: 'T001',
      passengerName: 'Jefri Al Bukhori',
      driverName: 'Andi Pratama',
      pickupLocation: 'Universitas Sumatera Utara',
      destination: 'Pajak USU',
      distance: '1.8 km',
      estimatedTime: '8 menit',
      price: 8000,
      status: 'Selesai',
      paymentMethod: 'Tunai',
      date: '30 September 2026',
    ),

    const TripData(
      id: 'T002',
      passengerName: 'Jefri Al Bukhori',
      driverName: 'Muhammad Fajar',
      pickupLocation: 'Fasilkom-TI USU',
      destination: 'Sumber',
      distance: '2.4 km',
      estimatedTime: '10 menit',
      price: 10000,
      status: 'Selesai',
      paymentMethod: 'Tunai',
      date: '29 September 2026',
    ),

    const TripData(
      id: 'T003',
      passengerName: 'Jefri Al Bukhori',
      driverName: 'Rizky Ramadhan',
      pickupLocation: 'Gerbang 1 USU',
      destination: 'Simpang Pos',
      distance: '3.1 km',
      estimatedTime: '13 menit',
      price: 12000,
      status: 'Selesai',
      paymentMethod: 'Tunai',
      date: '28 September 2026',
    ),
  ];

  // ==========================================================
  // ONLINE DRIVER
  // ==========================================================

  static List<Driver> get onlineDrivers {
    return drivers
        .where((driver) => driver.isOnline)
        .toList();
  }

  // ==========================================================
  // CURRENT PASSENGER
  // ==========================================================

  static PassengerData get currentPassenger {
    return passenger;
  }

  // ==========================================================
  // CURRENT DRIVER
  // ==========================================================

  static Driver get currentDriver {
    return drivers.first;
  }

  // ==========================================================
  // CURRENT TRIP
  // ==========================================================

  static TripData get currentTrip {
    return trips.first;
  }
}

// ============================================================
// PASSENGER DATA
// ============================================================

class PassengerData {
  final String id;
  final String name;
  final String nim;
  final String faculty;
  final String university;
  final String phone;
  final bool isVerified;

  const PassengerData({
    required this.id,
    required this.name,
    required this.nim,
    required this.faculty,
    required this.university,
    required this.phone,
    required this.isVerified,
  });
}

// ============================================================
// TRIP DATA
// ============================================================

class TripData {
  final String id;
  final String passengerName;
  final String driverName;
  final String pickupLocation;
  final String destination;
  final String distance;
  final String estimatedTime;
  final int price;
  final String status;
  final String paymentMethod;
  final String date;

  const TripData({
    required this.id,
    required this.passengerName,
    required this.driverName,
    required this.pickupLocation,
    required this.destination,
    required this.distance,
    required this.estimatedTime,
    required this.price,
    required this.status,
    required this.paymentMethod,
    required this.date,
  });
}