import time

from toil.common import Toil
from toil.job import Job

TASKS_NB=10


def helloWorld(job, message, memory="1G", cores=1, disk="1G"):
    time.sleep(1)
    job.log("Hello, world!, here's a message: %s" % message)

if __name__ == "__main__":
    parser = Job.Runner.getDefaultArgumentParser()
    options = parser.parse_args()

    job_init = Job.wrapJobFn(helloWorld, "initial")
    for i in range(TASKS_NB - 1):
        job_main = Job.wrapJobFn(helloWorld, "main")
        job_init.addChild(job_main)
    job_join = Job.wrapJobFn(helloWorld, "join")
    job_init.addFollowOn(job_join)

    with Toil(options) as toil:
        toil.start(job_init)

