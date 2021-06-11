gcloud compute tpus execution-groups create \
    --name=train-bigbird \
    --zone=europe-west4-a \
    --tf-version=2.5.0 \
    --machine-type=n1-standard-1 \
    --accelerator-type=v3-8
