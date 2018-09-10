from mediawiki:1.31

# mv /var/www/html to /var/www/html/w
RUN cd /var/www/ && \
  mkdir -p .html && \
  cp -rl html/* .html/ && \
  rm -rf html/* && \
  mv .html/ html/w

ADD htaccess /var/www/html/.htaccess

RUN a2enmod rewrite

ADD resources/ /var/www/html/w/resources/
ADD extensions/ /var/www/html/w/extensions/

RUN chown -R www-data:www-data /var/www/html/w/

ADD apache2.conf /etc/apache2/
