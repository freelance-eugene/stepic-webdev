sudo rm /etc/nginx/sites-enabled/default
sudo ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/lesson.conf
sudo /etc/init.d/nginx restart

sudo ln -s ~/web/etc/hello.py /etc/gunicorn.d/hello.py
cd ~/web
gunicorn -c /etc/gunicorn.d/hello.py hello:application &
cd ~/web/ask/ask
gunicorn --bind 0.0.0.0:8000 ask.wsgi:application &

sudo /etc/init.d/mysql start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ask;"
mysql -uroot -e "CREATE USER 'eugene'@'localhost' IDENTIFIED BY 'mypass';"
mysql -uroot -e "GRANT ALL ON ask.* TO 'eugene'@'localhost'";

python ~/web/ask/managy.py syncdb