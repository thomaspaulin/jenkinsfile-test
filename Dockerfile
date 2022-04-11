FROM public.ecr.aws/lambda/python:3.8

#RUN install shadow-utils

#RUN /usr/sbin/useradd --create-home owuser
#USER owuser

COPY foo/app.py foo/

COPY requirements.txt  .
RUN pip3 install -r requirements.txt --target "libs"

ENV PYTHONPATH=${LAMBDA_TASK_ROOT}/libs:$PYTHONPATH

COPY tests/* tests/
RUN pip3 install -r tests/requirements.txt --target "${LAMBDA_TASK_ROOT}/libs"

ENV PATH=${LAMBDA_TASK_ROOT}/libs/bin:$PATH

CMD [ "foo.app" ]
