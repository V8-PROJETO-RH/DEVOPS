FROM node:latest

WORKDIR /app

RUN git clone https://github.com/V8-PROJETO-RH/FRONTEND.git

WORKDIR /app/FRONTEND

RUN npm install

EXPOSE 80

CMD ["npm", "start"]
