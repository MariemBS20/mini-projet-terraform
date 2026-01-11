# mini-projet-terraform

##  Contexte

Ce projet consiste à déployer une application **WordPress** dans un cluster **Kubernetes** en utilisant exclusivement des **manifests YAML**, sans recourir à Helm.

L’objectif est de comprendre en profondeur :
- le fonctionnement interne de Kubernetes,
- le rôle de chaque ressource (Deployment, Service, Volume, Secret, etc.),
- et la manière dont une application réelle (WordPress + MySQL) est déployée dans un cluster.

---

##  Mise en place de l’architecture Kubernetes

Dans le cadre de cet exercice, l’objectif est de concevoir et déployer une architecture complète WordPress sur Kubernetes en utilisant uniquement des manifests YAML.

Les réalisations  sont  :

- Déployer WordPress à l’aide de manifests YAML  
- Créer un Deployment MySQL avec un seul replica  
- Exposer MySQL via un Service de type ClusterIP  
- Créer un Deployment WordPress avec les variables d’environnement nécessaires à la connexion MySQL  
- Stocker les données WordPress sur un volume monté dans le `/data` du nœud  
- Exposer le frontend WordPress via un Service de type NodePort  
- Utiliser les manifests YAML afin de mieux comprendre le contenu d’un chart WordPress  

Cette approche permet de comprendre concrètement comment Kubernetes orchestre une application distribuée.



##  Structure du projet

```text
kustomize-wordpress/
├── base/
│   ├── mysql/
│   │   ├── kustomization.yml
│   │   ├── mysql-pv.yml
│   │   ├── mysql-pvc.yml
│   │   ├── mysql-secret.yml
│   │   ├── mysql-deploy.yml
│   │   └── mysql-svc.yml
│   │
│   └── wordpress/
│       ├── wp-deploy.yml
│       ├── wp-secret.yml
│       └── wp-svc.yml
│
└── overlays/
    └── dev/
        └── kustomization.yml

```
### mysql-deployment.yaml

Rôle :  Déployer et gérer l’exécution de MySQL dans le cluster Kubernetes.

**Ce fichier contient** :

- Déploiement de MySQL sous forme de pod géré automatiquement par Kubernetes

- Configuration d’une seule instance (1 réplicat)

- Utilisation de variables d’environnement pour configurer la base de données

- Sécurisation des identifiants via un Secret Kubernetes

- Exposition du port MySQL pour la communication interne

- Montage d’un volume persistant pour conserver les données MySQL

### mysql-pv.yaml (PersistentVolume)

Rôle : Fournir un espace de stockage physique persistant pour la base de données MySQL.

**Ce fichier contient** :

- Création d’un volume de stockage de 10 Go

- Stockage local sur le nœud Kubernetes

- Mode d’accès adapté à une base de données (un seul pod à la fois)

- Gestion manuelle du stockage

### mysql-pvc.yaml (PersistentVolumeClaim)

Rôle : Permettre à MySQL de demander et d’utiliser un espace de stockage persistant.

**Ce fichier contient** :

- Demande de 10 Go de stockage persistant

- Liaison automatique avec le volume physique disponible

- Définition des droits d’accès au volume

- Abstraction du stockage pour l’application MySQL

### mysql-secret.yaml

Rôle : Stocker de manière sécurisée les informations sensibles de MySQL.

**Ce fichier contient** :

- Stockage du nom de la base de données

- Stockage du nom d’utilisateur MySQL

- Stockage du mot de passe MySQL

- Protection des données sensibles hors des fichiers de configuration classiques

### mysql-service.yaml

Rôle : Rendre MySQL accessible uniquement à l’intérieur du cluster Kubernetes.

**Ce fichier contient** :

- Exposition de MySQL via un service interne
 
- Communication sécurisée entre WordPress et MySQL

- Association automatique aux pods MySQL

- Utilisation d’un service non exposé à l’extérieur
