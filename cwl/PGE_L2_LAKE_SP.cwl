#!/usr/bin/env cwl-runner
cwlVersion: v1.0

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

class: CommandLineTool

inputs:
  L2_HR_LAKE_TILE:
    type: File[]
    inputBinding: { position: 1 }

baseCommand: [ /data/toil/pge/task.py, 'PGE_L2_LAKE_SP' ]

stdout: $(inputs.L2_HR_LAKE_TILE[0].nameroot).PGE_L2_LAKE_SP.txt
outputs:
  L2_HR_LAKE_SP: 
    type: stdout
