watch "function curl { $(which curl) --max-time 0.5 -ks \$@ | grep -i hello; };"\
"echo '* Global Load Balancer'; echo ' - Production'; curl https://multi-cloud.kcdc.rhlabs.io; echo ' - Development'; curl https://multi-cloud.dev.kcdc.rhlabs.io; echo; echo; echo '* Individual Clusters'; curl $(. /srv/login.sh && for i in 1 2 3; do echo -n "http://hello-multi-cloud.apps.${clusters[$i]} "; done)"
