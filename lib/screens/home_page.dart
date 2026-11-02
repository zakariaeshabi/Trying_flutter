import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primaryColor = Color(0xFF00796B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EMSI Connect',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications consultées');
            },
          ),
          IconButton(
            tooltip: 'Informations',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              debugPrint('Informations EMSI Connect consultées');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/campus.jpg',
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 160,
                            color: Colors.blue.shade50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'Image introuvable : campus.jpg',
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Bienvenue sur EMSI Connect',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004D40),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Votre campus, toujours à portée de main.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Votre espace universitaire pour accéder à vos cours, '
                      'votre planning et vos informations personnelles.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Color(0xFF647067),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildRubrique(
                            icon: Icons.menu_book,
                            label: 'Mes cours',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildRubrique(
                            icon: Icons.calendar_month,
                            label: 'Planning',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildRubrique(
                            icon: Icons.person,
                            label: 'Mon profil',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildRubrique(
                            icon: Icons.task_alt,
                            label: 'Mes tâches',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter',
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          debugPrint('Fonctionnalité bientôt disponible');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRubrique({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade100,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 36,
            color: Colors.blue.shade700,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }
}