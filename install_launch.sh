#!/bin/bash -ex
sudo yum install -y python3 stress git pip
sudo amazon-linux-extras install epel -y
pip3 install -r requirements.txt

export PHOTOS_BUCKET=g15-assignment-2
export AWS_DEFAULT_REGION=us-east-1
export DYNAMO_MODE=1
export DATABASE_DB_NAME=Employees-2

FLASK_APP=application.py flask app run --host=0.0.0.0 --port=5000

