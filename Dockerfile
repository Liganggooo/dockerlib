FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN mkdir /webapp
WORKDIR /webapp
RUN python -m pip install --upgrade pip -i https://pypi.doubanio.com/simple/
RUN apk add --update --no-cache jpeg-dev zlib-dev g++ gcc mysql-client
COPY requirements.txt /webapp/
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
COPY . /webapp
COPY ./start.sh /webapp/start.sh
RUN sed -i 's/\r//' ./start.sh
RUN chmod 777 ./start.sh
RUN mv /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/base.py /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/base_bak.py
RUN sed -e 35,36d /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/base_bak.py > /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/base.py
RUN rm -rf /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/operations.py 
COPY ./operations.py /usr/local/lib/python3.6/site-packages/django/db/backends/mysql/