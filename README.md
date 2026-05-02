XpertBot Farmers Market 🌾 — POS Mobile App
Cette application mobile est une solution de Point de Vente (POS) destinée aux opérateurs sur le terrain. Elle permet de gérer les transactions des fermiers en temps réel avec une interface intuitive et réactive, développée avec Flutter et connectée à un backend Laravel.

🚀 Liens du projet (Livrables)
Déploiement Web (Livrable 03) : Consulter l'application en ligne https://aristidenikiema046-lang.github.io/xpertbot-farmers-mobile/

Dépôt Backend (API) : [https://github.com/aristidenikiema046-lang/xpertbot-farmers-backend]

✨ Fonctionnalités Mobile
Authentification sécurisée : Connexion via token Laravel Sanctum pour protéger les accès.

Recherche de fermiers : Identification rapide par ID ou numéro de téléphone pour récupérer les données en temps réel via l'API.

Gestion des ventes : Sélection de produits, calcul automatique du total et choix du mode de paiement (Cash/Crédit).

Suivi des dettes : Visualisation claire du solde restant et des limites de crédit pour chaque fermier.

Remboursement en produits : Interface de saisie des kilos de cacao avec conversion instantanée en FCFA.

Badges Dynamiques : Intégration du système d'identification par badges générés par le système.

🛠️ Stack Technique
Frontend : Flutter 3.x (Dart).

Backend : API REST Laravel (PHP 8.1+).

Gestion d'état : Architecture propre pour la communication avec les services API.

Design : Interface responsive inspirée de Tailwind CSS.

⚙️ Configuration et Installation
1. Cloner le dépôt

Bash
git clone https://github.com/aristidenikiema046-lang/xpertbot-farmers-mobile.git
cd xpertbot-farmers-mobile


2. Configurer l'URL de l'API
Ouvrez lib/services/api_service.dart et assurez-vous que la baseUrl pointe vers votre backend :

Dart
static const String baseUrl ="http://192.168.1.16:8000/api"

3. Installer les packages

Bash
flutter pub get
4. Lancer l'application

Bash
flutter run
👷 Auteur
Aristide Nikiema

Développeur Full-Stack basé à Abidjan.

Diplômes : Licence Professionnelle en Sciences Informatiques & BTS en Développement d'Applications.

Expertise : Laravel, PHP, Node.js, JavaScript et Flutter.