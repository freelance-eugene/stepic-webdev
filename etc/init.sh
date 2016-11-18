sudo rm /etc/nginx/sites-enabled/default
sudo ln -s ~/web/etc/nginx.conf /etc/nginx/sites-enabled/lesson.conf
sudo /etc/init.d/nginx restart

sudo ln -s ~/web/etc/hello.py /etc/gunicorn.d/hello.py
cd ~/web
gunicorn -c /etc/gunicorn.d/hello.py hello:application &
cd ~/web/ask
gunicorn --bind 0.0.0.0:8000 wsgi &