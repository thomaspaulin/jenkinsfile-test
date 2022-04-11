FROM public.ecr.aws/lambda/python:3.8

WORKDIR ${LAMBDA_TASK_ROOT}/foo/
COPY foo/*.py ./

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}/libs"

ENV PYTHONPATH=${LAMBDA_TASK_ROOT}/libs:$PYTHONPATH

CMD [ "foo.app.lambda_handler" ]
