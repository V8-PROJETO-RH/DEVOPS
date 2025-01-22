FROM postgres:latest

ENV POSTGRES_USER=meu_usuario
ENV POSTGRES_PASSWORD=minha_senha
ENV POSTGRES_DB=meu_banco_de_dados

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432