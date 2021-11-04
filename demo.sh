source /srv/login.sh
source /srv/format.sh
oc-login 1
cluster1="local-cluster"
cluster2=$(echo ${clusters[2]} | cut -d\. -f1)
cluster3=$(echo ${clusters[3]} | cut -d\. -f1)


___ "Remove app-env-hello labels"
oc label ManagedCluster --all app-env-hello-

___ "Add app-env-hello labels to all clusters"
oc label ManagedCluster --overwrite=true -l name=$cluster1 app-env-hello=development
oc label ManagedCluster --overwrite=true -l name=$cluster2 app-env-hello=development
oc label ManagedCluster --overwrite=true -l name=$cluster3 app-env-hello=production

___ "Move cluster 2 to production"
oc label ManagedCluster --overwrite=true -l name=$cluster2 app-env-hello=production

___ "Move cluster 3 to development"
oc label ManagedCluster --overwrite=true -l name=$cluster3 app-env-hello=development

___ "Move cluster 1 to production"
oc label ManagedCluster --overwrite=true -l name=$cluster1 app-env-hello=production

___ "Remove app from cluster 1"
oc label ManagedCluster --overwrite=true -l name=$cluster1 app-env-hello-

___ "Create code change"
git checkout origin-gitlab development
perl -pe 's/(VERSION\D+)\d+$/${1}2/' -i server.js
git diff server.js
___ "Push change to development"
git commit -m 'Version bump' server.js; git push origin-gitlab development
