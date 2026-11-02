import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  static const Color primaryColor = Color(0xFF00796B);

  @override
  Widget build(BuildContext context) {
    final modules = <Map<String, Object>>[
      {
        'nom': 'Développement Multi-Plateforme',
        'enseignant': 'Mme Aouraghe',
        'heures': 32,
        'icone': Icons.menu_book,
      },
      {
        'nom': 'Bases de données avancées',
        'enseignant': 'M. Exemple A',
        'heures': 30,
        'icone': Icons.storage,
      },
      {
        'nom': 'Réseaux informatiques',
        'enseignant': 'Mme Exemple B',
        'heures': 24,
        'icone': Icons.network_check,
      },
      {
        'nom': 'Intelligence artificielle',
        'enseignant': 'M. Exemple C',
        'heures': 32,
        'icone': Icons.psychology,
      },
      {
        'nom': 'Cybersécurité',
        'enseignant': 'Mme Exemple D',
        'heures': 28,
        'icone': Icons.security,
      },
      {
        'nom': 'Gestion de projet',
        'enseignant': 'M. Exemple E',
        'heures': 24,
        'icone': Icons.computer,
      },
      {
        'nom': 'Développement des applications Web',
        'enseignant': 'Mme Exemple F',
        'heures': 36,
        'icone': Icons.computer,
      },
      {
        'nom': 'Architecture des systèmes et services Cloud',
        'enseignant': 'M. Exemple G',
        'heures': 30,
        'icone': Icons.network_check,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mes cours',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 750,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // En-tête fixe, indépendant du défilement.
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Modules du semestre',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004D40),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${modules.length} modules disponibles',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // La liste utilise la hauteur restante.
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      final module = modules[index];

                      final nom = module['nom'] as String;
                      final enseignant = module['enseignant'] as String;
                      final heures = module['heures'] as int;
                      final icone = module['icone'] as IconData;

                      return Card(
                        elevation: 2,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 12),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                            color: Colors.teal.shade100,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),

                          // Défi B : numéro du module.
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.teal.shade50,
                            foregroundColor: primaryColor,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          title: Text(
                            nom,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF263238),
                            ),
                          ),

                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      icone,
                                      size: 18,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        'Enseignant : $enseignant',
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Volume horaire : $heures h',
                                ),
                              ],
                            ),
                          ),

                          trailing: const Icon(
                            Icons.chevron_right,
                            color: primaryColor,
                          ),

                          // Défi C : nom exact du module sélectionné.
                          onTap: () {
                            final messenger = ScaffoldMessenger.of(context);

                            messenger.hideCurrentSnackBar();

                            messenger.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Module sélectionné : $nom',
                                ),
                                backgroundColor: primaryColor,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}