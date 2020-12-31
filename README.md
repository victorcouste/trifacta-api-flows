# Examples for Trifacta REST API use cases


![Trifacta logo](trifactalogo.png)

Scripts using Trifacta REST API (https://api.trifacta.com/) to deploy and run a Trifacta flow from development to production environment with flow package backup and versioning with Github.

- **flow_checkin.sh <flow_id>** : Export Trifacta flow <flow_id> and checkin (commit+push) in Github <flow_id> folder.
- **flow_import-rules_prod.sh <deploy_id>** : Create import rules for values (Bucket, FileLocation) and objects (Connections) for <deploy_id> production deployment.
- **flow_checkout_dev.sh -f <flow_id> -p <folder_id>** : Checkout last version of <flow_id> from Github and import in Trifacta <folder_id> folder.
- **flow_checkout_prodv.sh -f <flow_id> -d <deploy_id>** : Checkout last version of <flow_id> from Github and deploy it in Trifacta <deploy_id> production deployment.
- **flow_run_prod.sh <deploy_id>** : Run last version of flow in <deploy_id> production deployment.
- **recipe_run_dev.sh <recipe_id**> : Run recipe <recipe_id> in development.

Extra script **AllFlows_Migration.sh**  to migrate all flows from an environment to another one.
