import '../models/category_model.dart';
import '../models/service_model.dart';

/// Cleaning Services
final List<ServiceModel> cleaningServices = [
  ServiceModel(
    id: '1',
    name: 'House Cleaning',
    image: 'assets/images/services/cleaning/house_cleaning.png',
    description: 'Professional house cleaning service.',
    price: 'Starting from 200 EGP',
    rating: 4.9,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '2',
    name: 'Post Construction Cleaning',
    image: 'assets/images/services/cleaning/post_construction_cleaning.png',
    description: 'Cleaning after renovation and construction.',
    price: 'Starting from 350 EGP',
    rating: 4.8,
    duration: '4 Hours',
  ),
  ServiceModel(
    id: '3',
    name: 'Carpet Cleaning',
    image: 'assets/images/services/cleaning/carpet_cleaning.png',
    description: 'Deep carpet cleaning service.',
    price: 'Starting from 180 EGP',
    rating: 4.8,
    duration: '1 Hour',
  ),
  ServiceModel(
    id: '4',
    name: 'Sofa Cleaning',
    image: 'assets/images/services/cleaning/sofa_upholstery_cleaning.png',
    description: 'Professional sofa and upholstery cleaning.',
    price: 'Starting from 250 EGP',
    rating: 4.9,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '5',
    name: 'Water Tank Cleaning',
    image: 'assets/images/services/cleaning/water_tank_cleaning.png',
    description: 'Water tank cleaning and sanitization.',
    price: 'Starting from 300 EGP',
    rating: 4.7,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '6',
    name: 'Home Disinfection',
    image: 'assets/images/services/cleaning/home_disinfection.png',
    description: 'Complete home disinfection service.',
    price: 'Starting from 220 EGP',
    rating: 4.8,
    duration: '1 Hour',
  ),
  ServiceModel(
    id: '7',
    name: 'Glass Cleaning',
    image: 'assets/images/services/cleaning/window_glass_cleaning.png',
    description: 'Professional window and glass cleaning.',
    price: 'Starting from 170 EGP',
    rating: 4.8,
    duration: '1 Hour',
  ),
  ServiceModel(
    id: '8',
    name: 'Marble Polishing',
    image: 'assets/images/services/cleaning/marble_polishing.png',
    description: 'Restore marble shine and polish.',
    price: 'Starting from 350 EGP',
    rating: 4.9,
    duration: '3 Hours',
  ),
];

/// Maintenance Services
final List<ServiceModel> maintenanceServices = [
  ServiceModel(
    id: '9',
    name: 'Plumbing',
    image: 'assets/images/services/maintenance/plumbing.png',
    description: 'Professional plumbing services.',
    price: 'Starting from 180 EGP',
    rating: 4.9,
    duration: '1 Hour',
  ),
  ServiceModel(
    id: '10',
    name: 'Electrical',
    image: 'assets/images/services/maintenance/electrical.png',
    description: 'Electrical repair and installation.',
    price: 'Starting from 220 EGP',
    rating: 4.9,
    duration: '1 Hour',
  ),
  ServiceModel(
    id: '11',
    name: 'Carpenter',
    image: 'assets/images/services/maintenance/carpenter.png',
    description: 'Furniture repair and carpentry work.',
    price: 'Starting from 250 EGP',
    rating: 4.8,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '12',
    name: 'Blacksmith',
    image: 'assets/images/services/maintenance/blacksmith.png',
    description: 'Metal and welding services.',
    price: 'Starting from 300 EGP',
    rating: 4.7,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '13',
    name: 'AC Technician',
    image: 'assets/images/services/maintenance/ac.png',
    description: 'Air conditioner maintenance and repair.',
    price: 'Starting from 350 EGP',
    rating: 4.9,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '14',
    name: 'Home Appliances',
    image: 'assets/images/services/maintenance/appliances.png',
    description: 'Repair all household appliances.',
    price: 'Starting from 280 EGP',
    rating: 4.8,
    duration: '2 Hours',
  ),
];

/// Finishing & Repair Services
final List<ServiceModel> finishingServices = [
  ServiceModel(
    id: '15',
    name: 'Gypsum Board',
    image: 'assets/images/services/finishing/gypsum_board.png',
    description: 'Professional gypsum board installation.',
    price: 'Starting from 400 EGP',
    rating: 4.9,
    duration: '4 Hours',
  ),
  ServiceModel(
    id: '16',
    name: 'Ceramic & Marble',
    image: 'assets/images/services/finishing/ceramic_marble_tile.png',
    description: 'Ceramic, marble and tile installation.',
    price: 'Starting from 500 EGP',
    rating: 4.8,
    duration: '5 Hours',
  ),
  ServiceModel(
    id: '17',
    name: 'Aluminum Works',
    image: 'assets/images/services/finishing/aluminum_work.png',
    description: 'Aluminum doors and windows installation.',
    price: 'Starting from 450 EGP',
    rating: 4.8,
    duration: '4 Hours',
  ),
  ServiceModel(
    id: '18',
    name: 'Door & Window Repair',
    image: 'assets/images/services/finishing/doors_windows_repair.png',
    description: 'Repair all types of doors and windows.',
    price: 'Starting from 250 EGP',
    rating: 4.7,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '19',
    name: 'Painting',
    image: 'assets/images/services/finishing/painting.png',
    description: 'Professional wall painting service.',
    price: 'Starting from 300 EGP',
    rating: 4.9,
    duration: '3 Hours',
  ),
];

/// Moving Services
final List<ServiceModel> movingServices = [
  ServiceModel(
    id: '20',
    name: 'Furniture Moving',
    image: 'assets/images/services/moving/furniture_moving.png',
    description: 'Safe furniture moving service.',
    price: 'Starting from 450 EGP',
    rating: 4.9,
    duration: '5 Hours',
  ),
  ServiceModel(
    id: '21',
    name: 'Furniture Assembly',
    image: 'assets/images/services/moving/installation.png',
    description: 'Furniture assembly and disassembly.',
    price: 'Starting from 250 EGP',
    rating: 4.8,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '22',
    name: 'Packing',
    image: 'assets/images/services/moving/packing.png',
    description: 'Professional packing service.',
    price: 'Starting from 200 EGP',
    rating: 4.8,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '23',
    name: 'Crane Service',
    image: 'assets/images/services/moving/crane.png',
    description: 'Heavy furniture lifting service.',
    price: 'Starting from 600 EGP',
    rating: 4.9,
    duration: '4 Hours',
  ),
];

/// Security Services
final List<ServiceModel> securityServices = [
  ServiceModel(
    id: '24',
    name: 'CCTV Installation',
    image: 'assets/images/services/security/camera_installation.png',
    description: 'Professional CCTV installation.',
    price: 'Starting from 500 EGP',
    rating: 4.9,
    duration: '3 Hours',
  ),
  ServiceModel(
    id: '25',
    name: 'Intercom Installation',
    image: 'assets/images/services/security/intercom_installation.png',
    description: 'Modern intercom installation.',
    price: 'Starting from 450 EGP',
    rating: 4.8,
    duration: '2 Hours',
  ),
  ServiceModel(
    id: '26',
    name: 'Alarm Systems',
    image: 'assets/images/services/security/alarm_installation.png',
    description: 'Smart alarm systems for your home.',
    price: 'Starting from 600 EGP',
    rating: 4.9,
    duration: '3 Hours',
  ),
  ServiceModel(
    id: '27',
    name: 'Security Solutions',
    image: 'assets/images/services/security/security_solutions.png',
    description: 'Complete home security solutions.',
    price: 'Starting from 800 EGP',
    rating: 4.9,
    duration: '4 Hours',
  ),
];

/// Daily Services
final List<ServiceModel> dailyServices = [
  ServiceModel(
    id: '28',
    name: 'Elderly Care',
    image: 'assets/images/services/daily_services/elderly_care.png',
    description: 'Professional elderly care at home.',
    price: 'Starting from 250 EGP',
    rating: 4.8,
    duration: 'Per Hour',
  ),
  ServiceModel(
    id: '29',
    name: 'Child Care',
    image: 'assets/images/services/daily_services/child_care.png',
    description: 'Professional child care services.',
    price: 'Starting from 220 EGP',
    rating: 4.9,
    duration: 'Per Hour',
  ),
];

/// Outdoor Services
final List<ServiceModel> outdoorServices = [
  ServiceModel(
    id: '30',
    name: 'Garden Design',
    image: 'assets/images/services/outdoor/landscaping.png',
    description: 'Professional garden landscaping.',
    price: 'Starting from 500 EGP',
    rating: 4.9,
    duration: '5 Hours',
  ),
  ServiceModel(
    id: '31',
    name: 'Tree Cutting',
    image: 'assets/images/services/outdoor/tree_trimming.png',
    description: 'Safe tree cutting service.',
    price: 'Starting from 350 EGP',
    rating: 4.8,
    duration: '3 Hours',
  ),
  ServiceModel(
    id: '32',
    name: 'Irrigation Systems',
    image: 'assets/images/services/outdoor/irrigation_system.png',
    description: 'Modern irrigation system installation.',
    price: 'Starting from 650 EGP',
    rating: 4.8,
    duration: '4 Hours',
  ),
  ServiceModel(
    id: '33',
    name: 'Garden Cleaning',
    image: 'assets/images/services/outdoor/garden_cleaning.png',
    description: 'Complete garden cleaning service.',
    price: 'Starting from 300 EGP',
    rating: 4.7,
    duration: '2 Hours',
  ),
];

/// Main Categories
final List<CategoryModel> categories = [
  CategoryModel(
    title: 'Cleaning',
    heroImage: 'assets/images/categories/cleaning_hero.png',
    services: cleaningServices,
  ),
  CategoryModel(
    title: 'Finishing & Repair',
    heroImage: 'assets/images/categories/finishing_hero.png',
    services: finishingServices,
  ),
  CategoryModel(
    title: 'Maintenance',
    heroImage: 'assets/images/categories/maintenance_hero.png',
    services: maintenanceServices,
  ),
  CategoryModel(
    title: 'Moving',
    heroImage: 'assets/images/categories/moving_hero.png',
    services: movingServices,
  ),
  CategoryModel(
    title: 'Security',
    heroImage: 'assets/images/categories/security_hero.png',
    services: securityServices,
  ),
  CategoryModel(
    title: 'Daily Services',
    heroImage: 'assets/images/categories/daily_hero.png',
    services: dailyServices,
  ),
  CategoryModel(
    title: 'Outdoor Services',
    heroImage: 'assets/images/categories/outdoor_hero.png',
    services: outdoorServices,
  ),
];