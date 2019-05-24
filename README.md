# trifacta-flows


![Trifacta logo](trifactalogo.png)

Scripts using Trifacta REST API to run and deploy a Trifacta flow from development to production environment with flow package backup and versions management within Github.

- flow_checkin.sh <flow_id> : Export Trifacta flow <flow_id> and checkin (commit+push) in Github <flow_id> folder.
- flow_checkout_dev.sh -f <flow_id> -p <folder_id> : Checkout last version of <flow_id> from Github and import in Trifacta <folder_id> folder.
- flow_checkout_prodv.sh -f <flow_id> -d <deploy_id> : Checkout last version of <flow_id> from Github and deploy it in Trifacta <deploy_id> production deployment.
- flow_run_prod.sh <deploy_id> : Run last version of flow in <deploy_id> production deployment.
- recipe_run_dev.sh <recipe_id> : Run recipe <recipe_id> in development.
