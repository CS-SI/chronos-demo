#!/usr/bin/env cwl-runner
cwlVersion: v1.0
label: PGE_L2_RIVER_TILE

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 100  # just a default, could be lowered

class: CommandLineTool

inputs:
  L2_HR_PIXC:
    type: File
    inputBinding: { position: 1 }

baseCommand: [ task.py, 'PGE_L2_RIVER_TILE' ]

stdout: $(inputs.L2_HR_PIXC.nameroot).PGE_L2_RIVER_TILE.txt
outputs:
  L2_HR_RIVER_TILE: 
    type: stdout
  L2_HR_PIXC_VecRiver:
    type: stdout
