FROM public.ecr.aws/lambda/python:3.8

WORKDIR /
COPY foo/app.py .

COPY requirements.txt  .
RUN  sudo pip3 install -r requirements.txt --target "/libs"

ENV PYTHONPATH=/libs:$PYTHONPATH

CMD [ "foo.app" ]
