# Based on UShER's own dockerfile but with pandas installed

FROM jmcbroome/bte:v0.9.0 as app

RUN conda install -n base pandas

FROM app as test

RUN python3 -m unittest run_test.py
