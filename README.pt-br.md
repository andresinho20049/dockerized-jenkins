[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/andresinho20049/dockerized-jenkins/blob/main/README.md)

# Projeto Dockerized Jenkins
Este é um projeto 'Dockerizado' Jenkins que usa o Dockerfile, Docker Compose e Containerd para executar uma instância de Jenkins completa.


## Resumo
O objetivo deste projeto é criar uma imagem de Docker para Jenkins que possa ser facilmente implantada e gerenciada em um ambiente de nuvem ou no local. A imagem inclui os seguintes componentes:
* **Dockerfile**: O principal Dockerfile utilizado para construir a imagem base.
* **Docker-Compose**: Um docker compose com as configurações de privilégios de usuário e volume para permitir a execução de comandos do docker em pipelines, por exemplo: docker build -t {image}

![Prévia](https://github.com/andresinho20049/dockerized-jenkins/blob/main/preview.gif)

## Começando
1. Clonar este repositório: `git clone https://github.com/andresinho20049/dockerized-jenkins.git`
2. No diretório do projeto, execute o comando:
    ```
    docker-compose up
    ```
3. Uma vez terminado, acesse `http://localhost:8080` no navegador

---

> Ao acessar pela primeira vez, você precisará inserir o código de administração, que estará disponível no log do consola, se tiver executado o container em plano de fundo, execute:
> 1. `docker ps`
> 2. `docker logs {id_do_contêiner}`

## Executando Comandos do Docker dentro do Jenkins
Uma das principais características do nosso projeto de Dockerizado Jenkins é a capacidade de executar comandos do Docker diretamente em pipelines de Jenkins. Pois construímos a imagem de Jenkins com o Docker instalado, é possível executar `docker` comandos assim como se estivesse no seu local.

O segredo está na configuração do `Docker Compose`, que define volumes que permitem executar comandos do Docker sem problemas dentro do container. Ao montar o espaço de trabalho do Jenkins e os arquivos de configuração como volumes a partir da máquina hospedeira, criamos um ambiente fechado onde o Docker pode funcionar sem problemas.

### Exemplo: Executando `docker build`

Como exemplo, digamos que você queira construir uma imagem Docker usando pipelines Jenkins. Você pode simplesmente adicionar o seguinte comando ao seu pipeline:
```groovy
sh 'docker build -t my-image'
```
Isso executará o comando `docker build` dentro do container, construindo a imagem especificada sem necessidade de configurações adicionais.

### Benefícios

Ao permitir que os comandos do Docker sejam executados dentro de Jenkins, este projeto fornece vários benefícios:

* **Desenvolvimento de Pipelines Simplificado**: Os desenvolvedores podem se concentrar em escrever código de pipeline em vez de gerenciar manualmente dependências e configuração de ambiente.
* **Flexibilidade Aumentada**: Com o Docker disponível no Jenkins, você pode usar várias imagens do Docker como ferramentas de compilação ou executar contêineres personalizados para tarefas específicas.
* **Pipelines CI/CD mais Eficientes**: Ao integrar comandos do Docker diretamente em pipelines, você pode criar fluxos de trabalho mais eficientes e automatizados.

No geral, a capacidade deste projeto de executar comandos do Docker dentro do Jenkins o torna uma solução ideal para equipes que buscam otimizar seus processos de integração e entrega contínuas.

## Configuração persistente do Jenkins
No nosso projeto **Dockerizado Jenkins**, configuramos o `Docker Compose` para montar volumes da máquina hospedeira para a instância do Jenkins. Isso garante que:

* **Configurações de Arquivo**: O arquivo `config.xml` do Jenkins, contendo configurações importantes, permanece intacto.
* **Scripts de Pipeline Armazenados**: Os scripts de pipeline são armazenados.
* **Dados de Plugin Armazenados**: Os dados e cache dos plugins permanecem.

Isso significa que, mesmo que o contêiner seja reiniciado ou excluído, todas as suas configurações do Jenkins permanecem seguras, garantindo um processo de recuperação perfeito. Esse nível de persistência permite o máximo de uptime e o downtime reduzido, tornando-o uma solução ideal para ambientes de produção.

O volume do docker pode ser salvo em um armazenamento para maior segurança, como o S3.

## :copyright: Copyright
**Desenvolvido por** [Andresinho20049](https://andresinho20049.com.br/) \
**Projeto**: Dockerized Jenkins \
Nosso projeto Dockerized Jenkins utiliza o Docker para executar um ambiente Jenkins autocontido. Os pipelines do Jenkins podem executar comandos `docker` diretamente usando volumes configurados no `Docker Compose`, garantindo a execução perfeita dos processos de construção, teste e implantação.

Dados confidenciais persistem mesmo em caso de reinicializações ou falhas do contêiner devido a configurações de volume cuidadosamente projetadas. Isso garante o máximo de tempo de atividade e tempo de inatividade reduzido.