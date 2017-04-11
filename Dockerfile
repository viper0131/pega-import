FROM sameersbn/postgresql:9.4-24

VOLUME /imports

ADD scripts/import.sh /

RUN chmod +x /import.sh

ENV PGHOST="pegadb"
ENV PGUSER="postgres"
ENV PGPASSWORD="welkom"

ENTRYPOINT [ "/import.sh" ]
