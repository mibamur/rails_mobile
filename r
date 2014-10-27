RAILS_ENV=production thin -c /var/www/fin/private/adminka -s 1 -e production -S /var/www/fin/private/adminka/tmp/sockets/thin.sock stop
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production thin -c /var/www/fin/private/adminka -s 1 -e production -S /var/www/fin/private/adminka/tmp/sockets/thin.sock start
