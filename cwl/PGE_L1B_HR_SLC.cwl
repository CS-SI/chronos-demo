#!/usr/bin/env cwl-runner
cwlVersion: v1.0

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

hints:
  DockerRequirement:
    dockerPull: alpine

class: CommandLineTool

inputs:
  L0B_HR_RAW:
    type: File
    inputBinding: { position: 1 }

baseCommand: [ echo, 'PGE_L1B_HR_SLC' ]

stdout: $(inputs.L0B_HR_RAW.nameroot).PGE_L1B_HR_SLC.txt
outputs:
  L1B_HR_SLC: 
    type: stdout
