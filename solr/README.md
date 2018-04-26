# Solr em desenvolvimento

É necessário executar a criação dos índices:

```
curl 'http://localhost:8983/solr/admin/cores?action=CREATE&name=sei-protocolos&instanceDir=/dados/sei-protocolos&config=sei-protocolos-config.xml&schema=sei-protocolos-schema.xml&dataDir=/dados/sei-protocolos/conteudo'
curl 'http://localhost:8983/solr/admin/cores?action=CREATE&name=sei-bases-conhecimento&instanceDir=/dados/sei-bases-conhecimento&config=sei-bases-conhecimento-config.xml&schema=sei-bases-conhecimento-schema.xml&dataDir=/dados/sei-bases-conhecimento/conteudo'
curl 'http://localhost:8983/solr/admin/cores?action=CREATE&name=sei-publicacoes&instanceDir=/dados/sei-publicacoes&config=sei-publicacoes-config.xml&schema=sei-publicacoes-schema.xml&dataDir=/dados/sei-publicacoes/conteudo'
```

@TODO:

Verificar possibilidade de fazer isso na construção da imagem
