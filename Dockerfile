# Dockerfile
FROM node:18

WORKDIR /usr/src/app

# Copiar o package.json e o package-lock.json (se presente)
COPY package*.json ./

# Instalar todas as dependências, incluindo dev
RUN npm install 

# Copiar o restante dos arquivos (tsconfig e src)
COPY tsconfig.json ./
COPY src ./src

# Compilar o código TypeScript
RUN npm run build

# Expor a porta, se necessário
EXPOSE 3000

# Iniciar a aplicação
CMD ["npm", "start"]