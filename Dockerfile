FROM jekyll/minimal:stable

COPY chowdown.sh /usr/local/bin/chowdown.sh
RUN chmod +x /usr/local/bin/chowdown.sh

COPY chowdown/ /srv/

# Remove the default content
RUN rm -rf /srv/_components
RUN rm -rf /srv/_posts
RUN rm -rf /srv/_recipes
RUN rm -rf /srv/images

EXPOSE 4000

# Add in our content
COPY components/ /srv/_components
COPY images/ /srv/images
COPY recipes/ /srv/_recipes
COPY posts/ /srv/_posts

RUN chown -R jekyll:jekyll /srv
RUN chmod -R 755 /srv

CMD [ "sh", "/usr/local/bin/chowdown.sh" ]
