
# Terraform AWS Architecture

Ce projet Terraform permet de déployer une architecture AWS complète avec les composants suivants :

- **VPC** : Configuration d'un VPC avec des sous-réseaux publics et privés.
- **AWS Managed Microsoft AD** : Service d'annuaire géré pour l'authentification et l'autorisation.
- **Amazon FSx for Windows File Server** : Système de fichiers compatible avec Windows.
- **EC2 Bastion Host** : Instance EC2 pour un accès sécurisé au domaine.
- **Amazon Route 53 Outbound Endpoint** : Résolution DNS sécurisée pour les ressources internes et externes.

## Prérequis

- **Terraform** : Assurez-vous d'avoir Terraform installé sur votre machine. Vous pouvez le télécharger [ici](https://www.terraform.io/downloads).
- **AWS CLI** : Configurez l'AWS CLI avec les informations d'identification appropriées.

## Structure du Projet

```plaintext
terraform-aws-architecture/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── managed_ad/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── fsx/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── ec2_bastion/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── route53_outbound/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── security/
    ├── main.tf
    └── network_acls.tf
    └── variables.tf
    └── outputs.tf
```

## Utilisation

1. **Clonez le dépôt** :
   ```bash
   git clone <votre-repo-url>
   cd terraform-aws-architecture
   ```

2. **Initialisez Terraform** :
   ```bash
   terraform init
   ```

3. **Appliquez la configuration** :
   ```bash
   terraform apply
   ```

4. **Vérifiez les changements** :
   ```bash
   terraform plan
   ```

## Variables

Les variables peuvent être définies dans le fichier `variables.tf` à la racine du projet. Vous pouvez également utiliser un fichier `terraform.tfvars` pour définir des valeurs spécifiques à votre environnement.

- `vpc_cidr_block` : Le bloc CIDR pour le VPC.
- `domain_name` : Le nom de domaine pour le Managed AD.
- `admin_password` : Le mot de passe administrateur pour le Managed AD.
- `availability_zones` : Liste des zones de disponibilité pour les sous-réseaux.

## Sorties

Les sorties sont définies dans le fichier `outputs.tf` et incluent :

- `vpc_id` : L'ID du VPC créé.
- `managed_ad_id` : L'ID du Managed AD.
- `bastion_public_ip` : L'adresse IP publique de l'instance bastion.

## Contributions

Les contributions sont les bienvenues ! Veuillez ouvrir une issue ou soumettre une pull request pour toute amélioration ou correction.

## Licence

Ce projet est sous licence MIT.

