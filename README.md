# CWL example

See CWL graph rendered at
https://view.commonwl.org/workflows/github.com/CS-SI/chronos-demo/blob/master/cwl/KARIN_HR.cwl

![](https://view.commonwl.org/graph/png/github.com/CS-SI/chronos-demo/blob/master/cwl/KARIN_HR.cwl) 

## Deploy Mesos cluster

Use `safescale_deploy.sh` to deploy a Mesos cluster with 4 agents with Safescale.

## Setup

* Create folder shared between Mesos master and Mesos agents: `/data/toil`
* Create Toil job store directory into shared folder: `/data/toil/job_stores`
* Clone this repository and enter the project directory.
* Copy task script into shared folder: `cp -r ./pge /data/toil`
* Initialize input files: `./init_input.sh`

## Run CWL graph

```bash
WDIR=work_$(date '+%Y%m%d-%H%M%S')
mkdir $WDIR
cd $WDIR

toil-cwl-runner \
    --jobStore=file:/data/toil/job_stores/my-job-store \
    --batchSystem=mesos \
    --mesosMaster=<mesos_master_host>:5050 \
    ../cwl/KARIN_HR.cwl \
    ../args.json
```

Output files are generated into current work directory.

If required, run `toil clean /data/toil/job_stores/my-job-store/` to cleanup job store.
