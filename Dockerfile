FROM quay.io/ukhomeofficedigital/aws-dsp-toolset:v1.2.5

COPY . /cluster-scaler
WORKDIR /cluster-scaler

CMD scripts/run.sh
