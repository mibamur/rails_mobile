#!/usr/bin/zsh --login
cd /var/www/fin/adminka
rvm use ruby-2.1.2@rails414
#rvm use ruby-2.1.1@default
[ -s "/home/debadmin/.nvm/nvm.sh" ] && . "/home/debadmin/.nvm/nvm.sh"
mkdir -p db/backup/
RAILS_ENV=production rake tmp:create
git add -A
git commit -m "some fix from production"
git push
git pull
RAILS_ENV=production thin -c /var/www/fin/private/adminka -s 1 -e production -S /var/www/fin/private/adminka/tmp/sockets/thin.sock stop
cp -rf db/production.sqlite3 db/backup/production.sqlite3.`date +%d.%m.%Y_%T`
bundle install
RAILS_ENV=production rake db:seed:dump
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake tmp:clear
RAILS_ENV=production rake assets:clean
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production thin -c /var/www/fin/private/adminka -s 1 -e production -S /var/www/fin/private/adminka/tmp/sockets/thin.sock start
git add -A
git commit -m "some fix from production"
git pull
git push

