broker tenant set ovh
deploy cluster chronos create -F DCOS -C Small --cidr 192.168.14.0/24
deploy cluster chronos expand -n 2

install_script=$(cat<<- EOT
    useradd toil
    yum remove -y python-requests
    yum group install -y  "Development Tools"
    yum install -y python-devel nfs-utils nfs-utils-lib
    pip install --upgrade pip
    python -m pip install --upgrade --no-cache-dir toil[mesos,cwl]
    git clone https://github.com/ctriquet-cs/mesos-python/
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos.interface-*.egg
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos.executor-*.egg
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos.scheduler-*.egg
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos.native-*.egg
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos.cli-*.egg
    easy_install mesos-python/centos-7.3_mesos-1.5.1/mesos-*.egg
    rm -rf mesos-python
EOT
)

cat<<-EOT | broker ssh connect chronos-master-1
    sudo -s
    ${install_script}
EOT

for  num in {1..4} 
do
(cat<<-EOT | broker ssh connect chronos-node-${num}
    sudo -s
    ${install_script}
EOT
)&
done
wait

broker nas create --path="/data" chronos-nas chronos-master-1

for  num in {1..4} 
do
broker nas mount chronos-nas chronos-node-${num}&
done
wait


