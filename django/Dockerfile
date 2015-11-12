FROM django:1.8.6

EXPOSE 8000

RUN mkdir -p /usr/src/app

COPY . /user/src/app

WORKDIR /user/src/app

RUN pip install -r requirements.txt

WORKDIR /user/src/app/mysite

CMD ["gunicorn", "mysite.wsgi:application", "-w 1", "-b :8000"]
