FROM solr:7.3

COPY assets/index/* /tmp/
COPY install.sh /install.sh
#COPY install.sh /docker-entrypoint-initdb.d/install.sh

USER root
RUN mkdir -v /dados
RUN ln -vs /dados /opt/solr/server/solr
RUN mkdir -v /dados/sei-protocolos
RUN mkdir -v /dados/sei-bases-conhecimento
RUN mkdir -v /dados/sei-publicacoes
RUN cp -R /opt/solr/example/files/conf /dados/sei-protocolos
RUN cp -R /opt/solr/example/files/conf /dados/sei-bases-conhecimento
RUN cp -R /opt/solr/example/files/conf /dados/sei-publicacoes
RUN rm -v /dados/sei-protocolos/conf/solrconfig.xml
RUN rm -v /dados/sei-bases-conhecimento/conf/solrconfig.xml
RUN rm -v /dados/sei-publicacoes/conf/solrconfig.xml
RUN cp -v /tmp/sei-protocolos-*.xml /dados/sei-protocolos/conf
RUN cp -v /tmp/sei-bases-conhecimento-*.xml /dados/sei-bases-conhecimento/conf
RUN cp -v /tmp/sei-publicacoes-*.xml /dados/sei-publicacoes/conf
RUN mkdir -v /dados/sei-protocolos/conteudo
RUN mkdir -v /dados/sei-bases-conhecimento/conteudo
RUN mkdir -v /dados/sei-publicacoes/conteudo
RUN ln -vs /opt/solr/contrib /dados/sei-protocolos/contrib
RUN ln -vs /opt/solr/dist /dados/sei-protocolos/dist
RUN ln -vs /opt/solr/contrib /dados/sei-bases-conhecimento/contrib
RUN ln -vs /opt/solr/dist /dados/sei-bases-conhecimento/dist
RUN ln -vs /opt/solr/contrib /dados/sei-publicacoes/contrib
RUN ln -vs /opt/solr/dist /dados/sei-publicacoes/dist

RUN chown -R solr:solr /dados
RUN chown -R solr:solr /opt/solr/server/solr/dados
USER solr

#RUN /opt/solr/bin/solr start -f && \
	#sleep 30 && \
	#curl 'http://localhost:8983/solr/admin/cores?action=CREATE&name=sei-protocolos&instanceDir=/dados/sei-protocolos&config=sei-protocolos-config.xml&schema=sei-protocolos-schema.xml&dataDir=/dados/sei-protocolos/conteudo'


USER root
RUN chmod a+x /install.sh
RUN chown solr:solr /install.sh

USER solr
#RUN sh /install.sh
