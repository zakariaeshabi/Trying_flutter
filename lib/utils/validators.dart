class Validators {
  Validators._();

  static String? email(String? value) {
    final email = (value ?? '').trim();

    if (email.isEmpty) {
      return 'Email obligatoire';
    }

    if (!email.contains('@')) {
      return 'Email invalide';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe obligatoire';
    }

    if (value.length < 8) {
      return 'Au moins 8 caractères';
    }

    return null;
  }

  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nom complet obligatoire';
    }

    return null;
  }

  // Règle pédagogique : téléphone facultatif, de 10 à 15 chiffres.
  static String? phone(String? value) {
    final phone = (value ?? '').trim();

    if (phone.isEmpty) {
      return null;
    }

    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone)) {
      return 'Entrez 10 à 15 chiffres, avec + facultatif';
    }

    return null;
  }
}