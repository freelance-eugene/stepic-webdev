sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/lesson.conf
sudo /etc/init.d/nginx restart

sudo ln -s /home/box/etc/hello.py /etc/gunicorn.d/hello.py
gunicorn -c /etc/gunicorn.d/hello.py hello:application &

cd ~/web/ask
gunicorn wsgi &