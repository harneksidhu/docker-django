# docker-django

This is a basic docker setup for developing/hosting django applications. The environment utilizes three containers:

* Django 1.8.6 (with Gunicorn installed for serving the application)
* Nginx Latest
* PostgreSQL Latest

# Local Environment

### Prerequisites

The environment requires the host machine to have VirtualBox/Vagrant installed. The installation instructions are available [here](https://docs.vagrantup.com/v2/installation/index.html)

### Creating the Local Environment

The environment can be created on the host machine using the following command inside the project directory

`vagrant up`

### Accessing the Application through Nginx

The application is served by Nginx at `http://localhost:8080`. Application file changes are automatically reflected on this port.

### Accessing the Application through Django runserver

`vagrant ssh` (password: vagrant)
`sudo docker exec -it ${PWD##*/}_django_1 python manage.py runserver 0.0.0.0:8001`

The Django runserver can be accessed at `http://localhost:8081`

### Sending manage.py commands to Django

To run a manage.py command in the Django container, run a command using the following structure inside Vagrant

`sudo docker exec -it ${PWD##*/}_django_1 [command]`

### Backup and Restore PostgreSQL

Backup:

`docker exec ${PWD##*/}_postgres_1 pg_dump -U postgres -c -f /backup/output.tar -b -F tar postgres`

Restore:

`docker exec ${PWD##*/}_postgres_1  pg_restore -U postgres -d postgres "/backup/output.tar"`



### TODO

* Create a seperate docker-compose file for production
* Specify docker container names
* Clean up rendundant data found in .env files
