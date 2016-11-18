sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/lesson.conf
sudo /etc/init.d/nginx restart
gunicorn -c /home/box/web/ask/ask/wsgi.py &