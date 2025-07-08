# Etapa 1: Escolher uma imagem base oficial do Python.
# A imagem 'slim' é uma boa escolha por ser leve, mas contendo as ferramentas essenciais.
FROM python:3.11-slim

# Etapa 2: Definir o diretório de trabalho dentro do contêiner.
# Isso garante que os comandos subsequentes sejam executados neste diretório.
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências.
# Copiamos este arquivo primeiro para aproveitar o cache de camadas do Docker.
# Se o requirements.txt não mudar, o Docker reutilizará a camada de instalação das dependências.
COPY requirements.txt .

# Etapa 4: Instalar as dependências do projeto.
# O '--no-cache-dir' ajuda a manter o tamanho da imagem menor.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar o restante do código da aplicação para o diretório de trabalho.
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada.
# O Uvicorn, por padrão, roda na porta 8000.
EXPOSE 8000

# Etapa 7: Definir o comando para iniciar a aplicação quando o contêiner for executado.
# Usamos '--host 0.0.0.0' para tornar a API acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

## Palavra-chave 1: MARVEL
