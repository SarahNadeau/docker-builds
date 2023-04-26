# Based on UShER's own dockerfile but with pandas installed

FROM jmcbroome/bte:v0.9.0 as app

RUN conda activate bte && python3 -m pip install pandas

FROM app as test

RUN python3 -m unittest run_test.py
