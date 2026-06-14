# Extia-Mentorat-TF

Dépôt de support pour le mentorat Terraform : une série d'exercices progressifs pour découvrir Terraform, de la prise en main des commandes de base jusqu'à la création de modules réutilisables pour déployer des ressources Azure.

## Prérequis

- [Terraform](https://developer.hashicorp.com/terraform/downloads) (>= 1.0)
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) pour les exercices 2 et 3 (authentification via `az login`)
- Un abonnement Azure (subscription_id / tenant_id) pour les exercices 2 et 3

## Environnement de développement

Le projet fournit un devcontainer ([.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)) basé sur Debian avec Terraform et Azure CLI préinstallés. Il peut être utilisé avec GitHub Codespaces ou VS Code + Dev Containers. Les mises à jour du devcontainer sont suivies par Dependabot ([.github/dependabot.yml](.github/dependabot.yml)).

## Structure du dépôt

| Dossier | Sujet | Provider(s) |
|---|---|---|
| [0-apprendre-cmd-TF](0-apprendre-cmd-TF) | Prise en main des commandes Terraform (`init`, `plan`, `apply`, `destroy`) via la création d'un fichier local | `local` |
| [1-utilisation-variable-TF](1-utilisation-variable-TF) | Utilisation des variables, valeurs par défaut, fichiers `.tfvars` et ressources aléatoires | `local`, `random` |
| [2-premier-deploiement](2-premier-deploiement) | Premier déploiement Azure : réseau, NSG, VM Linux et génération d'une paire de clés SSH | `azurerm`, `azapi`, `random` |
| [3-premier-module](3-premier-module) | Refactorisation en modules réutilisables (resource group, réseau, VM Linux/Windows) | `azurerm`, `azapi`, `random` |

### 0 - apprendre-cmd-TF

Crée un fichier local (`myfile.md`) via le provider `local`. Objectif : comprendre le cycle `terraform init` / `plan` / `apply` / `destroy` et la notion d'état.

### 1 - utilisation-variable-TF

Crée deux fichiers locaux dont le nom dépend de variables (`namefile`, `personnalpath`) et d'une ressource `random_pet`. Les variables sont fournies via des valeurs par défaut ou via le fichier [myGlobalVariable.tfvars](1-utilisation-variable-TF/myGlobalVariable.tfvars).

### 2 - premier-deploiement

Déploie sur Azure :
- un groupe de ressources et un réseau virtuel (vnet + subnet)
- un groupe de sécurité réseau autorisant le SSH (port 22)
- une VM Linux (Ubuntu 22.04) avec une paire de clés SSH générée via `azapi_resource_action`

Les variables sensibles (`subscription_id`, `tenant_id`, `password_admin`) doivent être fournies par vous-même, par exemple via un fichier `terraform.tfvars` non versionné.

### 3 - premier-module

Reprend l'architecture de l'exercice 2 en la découpant en modules réutilisables :
- [modules/resource_group](3-premier-module/modules/resource_group) : crée le groupe de ressources
- [modules/network](3-premier-module/modules/network) : crée le vnet et le subnet
- [modules/vm_linux](3-premier-module/modules/vm_linux) : crée une VM Linux (IP publique, NSG, choix de la distribution)
- [modules/vm_windows](3-premier-module/modules/vm_windows) : crée une VM Windows

Le fichier [terraform.tfvars](3-premier-module/terraform.tfvars) contient des valeurs d'exemple (`XXXXXXXX-...`) à remplacer par vos propres identifiants Azure (`subscription_id`, `tenant_id`, `admin_password`).

## Utilisation

Pour chaque exercice :

```bash
cd <dossier-de-l-exercice>
terraform init
terraform plan
terraform apply
```

Pensez à exécuter `terraform destroy` après chaque exercice pour éviter des coûts inutiles sur Azure.

> ⚠️ Ne committez jamais de fichier `.tfvars` contenant des identifiants ou secrets réels.

Enjoy 🥳
