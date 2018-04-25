# Como construir a imagem do SEI?

É assumido que nesta pasta vai estar o código php do SEI conforme baixado do software público br. Nesse exemplo a pasta é: `v3.0.10_BaseRef`. 

## Arquivos de configuração

Nos arquivos de configuração, configure as URLs do sei/sip e os nomes das máquinas (ex.: mysql, jod, etc) são os mesmos nomes nos links do `docker-compose.yml`.

@TODO:

- [ ] Configurar as URLs pra serem variáveis de ambiente no docker-compose
- [ ] Configurar os links names pra serem variáveis de ambiente no docker-compose
- [ ] Trocar da imagem ubuntu pra imagem do php/apache
