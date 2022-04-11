FROM public.ecr.aws/lambda/python:3.8

#RUN install shadow-utils

#RUN /usr/sbin/useradd --create-home owuser
#USER owuser

COPY foo/app.py foo/

COPY requirements.txt  .
RUN pip3 install -r requirements.txt --target "libs"

ENV PYTHONPATH=libs:$PYTHONPATH

COPY tests/* tests/
RUN pip3 install -r tests/requirements.txt --target "libs"

ENV PATH=libs/bin:$PATH
RUN pytest

CMD [ "foo.app" ]
