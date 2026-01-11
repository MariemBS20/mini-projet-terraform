# mini-projet-terraform

##  Contexte du mini-projet

Ce mini-projet a pour objectif de **déployer une infrastructure AWS complète** en utilisant **Terraform** et une **approche modulaire**. Il s’inscrit dans une démarche DevOps et vise à comprendre les concepts fondamentaux de l’Infrastructure as Code (IaC).

L’infrastructure déployée comprend :

* Une **instance EC2 Ubuntu (dernière version Ubuntu Bionic)**
* Un **volume EBS** attaché à l’instance
* Une **adresse IP publique (Elastic IP)**
* Une **Security Group** autorisant les ports **80 (HTTP)** et **443 (HTTPS)**
* L’installation automatique de **Nginx**
* L’enregistrement de l’IP publique dans un fichier `ip_ec2.txt`

---

##  Objectifs pédagogiques

* Comprendre le rôle de Terraform dans un processus DevOps
* Apprendre à découper une infrastructure en **modules Terraform**
* Savoir utiliser `variables.tf`, `outputs.tf` et `main.tf`
* Comprendre la gestion des dépendances entre ressources
* Déployer une infrastructure reproductible et configurable

---

##  Architecture globale

L’architecture déployée est composée des éléments suivants :

* **EC2** : machine virtuelle Ubuntu Bionic
* **EBS** : volume de stockage attaché à l’EC2
* **Elastic IP** : IP publique associée à l’EC2
* **Security Group** : règles réseau (ports 80 et 443 ouverts)
* **Key Pair** : clé SSH pour la connexion sécurisée

Tous ces éléments sont encapsulés dans des **modules Terraform** réutilisables.

---

##  Structure du projet

```
mini-projet-terraform/
├── app/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── files/
│       └── terraform-project.pem
│
├── modules/
│   ├── ec2/
│   ├── ebs/
│   ├── eip/
│   ├── sg/
│   └── keypair/
│
└── README.md
```

---

##  Description des modules

###  Module EC2

**Rôle :**

* Créer une instance EC2 basée sur la dernière image Ubuntu Bionic
* Associer une clé SSH, un security group et une zone de disponibilité
* Installer automatiquement **Nginx**

**Fonctionnalités clés :**

* L’AMI Ubuntu est récupérée dynamiquement via `data "aws_ami"`
* Les paramètres comme le type d’instance, les tags et l’utilisateur sont variabilisés
* Un provisioner `remote-exec` installe Nginx

---

###  Module EBS

**Rôle :**

* Créer un volume EBS indépendant
* Variabiliser la taille du volume

---

###  Module Elastic IP (EIP)

**Rôle :**

* Créer une IP publique statique
* Associer l’IP à l’instance EC2
* Enregistrer l’IP publique dans un fichier `ip_ec2.txt`

---

###  Module Security Group

**Rôle :**

* Autoriser le trafic entrant sur :

  * Port 80 (HTTP)
  * Port 443 (HTTPS)
* Autoriser tout le trafic sortant

---

###  Module Key Pair

**Rôle :**

* Générer une clé SSH localement avec Terraform
* Créer une Key Pair AWS à partir de la clé publique
* Sauvegarder la clé privée au format `.pem`

---

##  Dossier `app`

Le dossier `app` représente le **root module**.

**Responsabilités :**

* Appeler tous les modules (`ec2`, `ebs`, `eip`, `sg`, `keypair`)
* Surcharger les variables pour rendre l’infrastructure dynamique
* Gérer les dépendances entre modules (attachement EBS, association EIP)

---

##  Rôle des fichiers Terraform

### `main.tf`

* Orchestration globale de l’infrastructure
* Appels des modules
* Ressources de liaison (`aws_volume_attachment`, `aws_eip_association`)

### `variables.tf`

* Déclaration des variables configurables
* Rend le projet flexible et paramétrable

### `terraform.tfvars`

* Valeurs concrètes des variables
* Facilite la personnalisation sans modifier le code

### `provider.tf`

* Déclaration des providers (AWS, TLS, Local)
* Configuration de la région

---

##  Nginx

**Nginx** est un serveur web léger et performant.

Dans ce projet :

* Il est installé automatiquement sur l’EC2
* Il permet de vérifier rapidement que l’instance est accessible via HTTP

---

##  Connexion SSH

La clé SSH permet de se connecter **à l’instance EC2** de manière sécurisée :

```bash
ssh -i terraform-project.pem ubuntu@<IP_PUBLIQUE>
```

---

##  Commandes Terraform utilisées

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```







