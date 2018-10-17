#!/usr/bin/env cwl-runner
cwlVersion: v1.0

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

class: CommandLineTool

inputs:
  L2_HR_PIXC_VecRiver:
    type: File
    inputBinding: { position: 1 }

baseCommand: [ /data/toil/pge/task.py, 'PGE_L2_LAKE_TILE' ]

stdout: $(inputs.L2_HR_PIXC_VecRiver.nameroot).PGE_L2_LAKE_TILE.txt
outputs:
  L2_HR_LAKE_TILE: 
    type: stdout
