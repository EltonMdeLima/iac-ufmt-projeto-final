FROM nginx:alpine

# Copia os arquivos do site para o local padrão do nginx
COPY ./site /usr/share/nginx/html

# Substitui a configuração padrão do nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
