---
layout: post
title:  "Como enviar imagem para Harbor"
date:   2022-04-30 13:19:55 -0300
categories: inline infra harbor
---

**Introdução**

![titre image]({{ site.url }}/assets/images/harbor.png)

Harbor é uma ferramenta simples para armazenar suas imagens docker.

Em nosso exemplo vamos fazer a entrega de um site simples, onde os arquivos estão dentro da pasta `/dist`

**Pré Requisitos**

1. Sua máquina deve ter o Docker instalado, aqui você pode ver [como.](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt)

2. Sua aplicação deve ter um [Dockerfile](https://docs.docker.com/engine/reference/builder/) com as configurações necessárias para executar seu container com sucesso.

Por exemplo:

```
FROM httpd:2.4

ENV IP_API=192.0.0.1

COPY ./dist/ /usr/local/apache2/htdocs/
```

**Criando sua imagem**

1. Dentro a pasta do site digite o seguinte comando

```bash
sudo docker build -t {nome-sua-app}:{versao} .
```

por exemplo:
```bash
sudo docker build -t site-sample:0.0.1 .
```

**Criando tag**

Precisamos criar tag para cada versão da nossa aplicação, podemos usar o seguinte comando:

```bash
sudo docker tag {nome-sua-app}:{versao} {url-registry}/{projeto}/{nome-sua-app}:{versao}
```

por exemplo:

```bash
sudo docker tag site-sample:0.0.1 registry.inlinesoft.com.br/test/site-sample:0.0.1
```

**Push para repositório**

Para enviar uma image para o repositório devemos executar o comando `push` seguindo o seguinte template:

```bash
sudo docker push {url-registry}/{projeto}/{nome-sua-app}:{versao}
```

por exemplo:

```bash
sudo docker push site-sample:0.0.1 registry.inlinesoft.com.br/test/site-sample:0.0.1
```

Se tiver dado tudo certo, ao acessar seu registry você verá sua imagem disponível.

Agora é só colocar para rodar no seu servidor.

  <img src='https://listmonk.inlinesoft.com.br/home/upload/inline-blog-banner.png' style="cursor: pointer;width: 100%;height: auto;" onclick='window.open("https://inlinesoft.com.br/treinamentos", "_blank").focus()' >