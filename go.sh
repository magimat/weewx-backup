printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export AWS" > /root/project_env.sh
cron -f