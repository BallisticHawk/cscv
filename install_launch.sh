#!/bin/bash -ex
sudo yum install -y python3 stress git
sudo amazon-linux-extras install epel -y
amazon-linux-extras install epel
pip3 install -r requirements.txt
yum -y install stress

export PHOTOS_BUCKET=g15-assignment
export AWS_DEFAULT_REGION=us-east-1
export DYNAMO_MODE=1
export DATABASE_DB_NAME=Employees
cat database_create_tables.sql | \
mysql -h $$DATABASE_HOST -u $$DATABASE_USER -p$$DATABASE_PASSWORD
FLASK_APP=application.py /usr/local/bin/flask run --host=0.0.0.0 --port=80
