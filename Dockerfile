FROM node:22-alpine

WORKDIR /app

# Copia apenas o que é necessário para rodar via pacote npm
COPY package.json package-lock.json* ./
RUN npm install

# Variáveis de ambiente (deixe vazias aqui, preencha no Coolify)
ENV KLING_ACCESS_KEY=""
ENV KLING_SECRET_KEY=""

# Diretório onde o mcp-kling salva vídeos/imagens
RUN mkdir -p /app/downloads
VOLUME ["/app/downloads"]

# Comando: roda o servidor MCP Kling via npx
CMD ["npx", "-y", "mcp-kling@latest"]
