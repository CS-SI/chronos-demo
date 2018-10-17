# CWL example

See CWL graph rendered at
https://view.commonwl.org/workflows/github.com/CS-SI/chronos-demo/blob/master/cwl/KARIN_HR.cwl

![](https://view.commonwl.org/graph/png/github.com/CS-SI/chronos-demo/blob/master/cwl/KARIN_HR.cwl) 

## Test locally

```bash
cd
git clone https://github.com/CS-SI/chronos-demo

virtualenv cwltool
source cwltool/bin/activate
pip install cwltool

mkdir -p ~/.local/bin
# add ~/.local/bin into PATH
ln -s ~/chronos-demo/pge/task.py ~/.local/bin
ln -s ~/chronos-demo/init_input.sh ~/.local/bin
ln -s ~/chronos-demo/init_args.py ~/.local/bin

WDIR=work_$(date '+%Y%m%d-%H%M%S')
mkdir $WDIR
cd $WDIR
init_input.sh input
init_args.py input

cwltool ~/chronos-demo/cwl/KARIN_HR.cwl args.json
```

A Toil job Python script is also provided as an example. To run it, execute:

```bash
cd chronos-demo
python hello_world_multi.py \
    file:/data/toil/job_stores/my-job-store \
    --batchSystem=mesos \
    --mesosMaster=<mesos_master_host>:5050
```

## Run on the cloud

Safescale cloud management platform can be used to deploy a Toil-Mesos cluster automatically on a cloud provider infrastructure.

See https://github.com/CS-SI/SafeScale

## Deploy Mesos cluster

Run `chronos_deploy.sh` to get a Mesos cluster up and running. The script also executes to required configuration to execute the CWL graph.

## Run CWL graph

```bash
cd
WDIR=work_$(date '+%Y%m%d-%H%M%S')
mkdir $WDIR
cd $WDIR

toil-cwl-runner \
    --jobStore=file:/data/toil/job_stores/my-job-store \
    --batchSystem=mesos \
    --mesosMaster=<mesos_master_host>:5050 \
    ../chronos-demo/cwl/KARIN_HR.cwl \
    ../chronos-demo/args.json
```

Output files are generated into current work directory.

If required, run `toil clean /data/toil/job_stores/my-job-store/` to cleanup job store.
