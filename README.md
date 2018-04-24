# SEI - Sistema Eletrônico de Informações usando docker

Alternativa a versão do MPOG [sei-vagrant](https://softwarepublico.gov.br/gitlab/sei/sei-vagrant/tree/master) usando docker puro e imagens já otimizadas para cada módulo.

## Como contribuir

```diff
@TODO
```

## Como executar

A execução pode ser individual usando cada Dockerfile ou usando docker composer

Para construir (build):

```
docker-compose build
```

Para construir cada serviço individualmente:

```
docker-compose build $SERVICE_NAME
```

Para executar (`$SERVICE_NAME` é opcional, para execução de um serviço em si)

```
docker-compose up -d $SERVICE_NAME
```

