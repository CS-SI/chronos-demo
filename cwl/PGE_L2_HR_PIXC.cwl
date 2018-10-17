#!/usr/bin/env cwl-runner
cwlVersion: v1.0

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

class: CommandLineTool

inputs:
  L1B_HR_SCL:
    type: File
    inputBinding: { position: 1 }

baseCommand: [ task.py, 'PGE_L2_HR_PIXC' ]

stdout: $(inputs.L1B_HR_SCL.nameroot).PGE_L2_HR_PIXC.txt
outputs:
  L2_HR_PIXC: 
    type: stdout
