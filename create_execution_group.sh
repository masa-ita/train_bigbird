gcloud compute tpus execution-groups create \
    --name=train-bigbird \
    --zone=$GCP_ZONE \
    --tf-version=2.5.0 \
    --machine-type=n1-standard-8 \
    --accelerator-type=v3-8 \
    --preemptible \
    --preemptible-vm
# after exit do cleanup
./cleanup.sh
