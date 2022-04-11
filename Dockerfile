FROM public.ecr.aws/lambda/python:3.8

WORKDIR /
COPY foo/app.py .

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "/libs"

ENV PYTHONPATH=/libs:$PYTHONPATH

CMD [ "foo.app" ]
