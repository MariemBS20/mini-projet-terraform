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

---

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
# Déploiement de WordPress avec Kubernetes (Manifests YAML & Kustomize)

## 📌 Contexte

Ce projet consiste à déployer une application **WordPress** dans un cluster **Kubernetes** en utilisant exclusivement des **manifests YAML**, sans recourir à Helm.

L’objectif est de comprendre en profondeur :
- le fonctionnement interne de Kubernetes,
- le rôle de chaque ressource (Deployment, Service, Volume, Secret, etc.),
- et la manière dont une application réelle (WordPress + MySQL) est déployée dans un cluster.

---

## 🧩 Mise en place de l’architecture Kubernetes

Dans le cadre de cet exercice, l’objectif est de concevoir et déployer une architecture complète WordPress sur Kubernetes en utilisant uniquement des manifests YAML.

Les réalisations attendues sont les suivantes :

- Déployer WordPress à l’aide de manifests YAML  
- Créer un Deployment MySQL avec un seul replica  
- Exposer MySQL via un Service de type ClusterIP  
- Créer un Deployment WordPress avec les variables d’environnement nécessaires à la connexion MySQL  
- Stocker les données WordPress sur un volume monté dans le `/data` du nœud  
- Exposer le frontend WordPress via un Service de type NodePort  
- Utiliser les manifests YAML afin de mieux comprendre le contenu d’un chart WordPress  

👉 Cette approche permet de comprendre concrètement comment Kubernetes orchestre une application distribuée.

---

## 🗂️ Structure du projet

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

