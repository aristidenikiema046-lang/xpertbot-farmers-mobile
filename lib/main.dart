import 'package:flutter/material.dart';
import 'models/farmer.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XpertBot Farmers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const FarmerListPage(),
    );
  }
}

class FarmerListPage extends StatefulWidget {
  const FarmerListPage({super.key});

  @override
  State<FarmerListPage> createState() => _FarmerListPageState();
}

class _FarmerListPageState extends State<FarmerListPage> {
  final ApiService apiService = ApiService();
  late Future<List<Farmer>> futureFarmers;

  @override
  void initState() {
    super.initState();
    // On lance l'appel API dès le démarrage
    futureFarmers = apiService.fetchFarmers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fermiers XpertBot'),
        backgroundColor: Colors.green.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                futureFarmers = apiService.fetchFarmers();
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Farmer>>(
        future: futureFarmers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun fermier trouvé.'));
          }

          final farmers = snapshot.data!;

          return ListView.builder(
            itemCount: farmers.length,
            itemBuilder: (context, index) {
              final farmer = farmers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('${farmer.firstname} ${farmer.lastname}'),
                  subtitle: Text('ID: ${farmer.identifier}'),
                  trailing: Text(
                    '${farmer.creditLimit.toStringAsFixed(0)} FCFA',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}