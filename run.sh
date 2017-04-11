docker run -it \
           --rm \
           --net pega-network \
           --link pegadb \
           -v /Users/viper/zgw/postgres-import/imports/pega_bare.2.dmp:/imports/pega.dmp \
       nlmacamp/zgw-import pega.dmp

