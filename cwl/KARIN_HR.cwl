class: Workflow
cwlVersion: v1.0
id: KARIN_HR
label: KARIN_HR

inputs:

  - id: L0B_HR_RAW_150
    type: 'File[]'

outputs:

  - id: L2_HR_RIVER_SP
    outputSource:
      - PGE_L2_RIV_SP/L2_HR_RIVER_SP
    type: File

  - id: L2_HR_LAKE_SP
    outputSource:
      - PGE_L2_LAKE_SP/L2_HR_LAKE_SP
    type: File

  - id: L2_HR_LAKE_TILE_150
    outputSource:
      - L2_SP/L2_HR_LAKE_TILE_150
    type: 'File[]'

  - id: L2_HR_RIVER_TILE_150
    outputSource:
      - L2_SP/L2_HR_RIVER_TILE_150
    type: 'File[]'

  - id: L1B_HR_SLC_150
    outputSource:
      - L1B_SP/L1B_HR_SLC_150
    type: 'File[]'

steps:

  - id: L1B_SP
    in:
      - id: L0B_HR_RAW_150
        source:
          - L0B_HR_RAW_150
    out:
      - id: L1B_HR_SLC_150
    run: ./L1B_SP.cwl

  - id: L2_SP
    in:
      - id: L1B_HR_SCL_150
        source:
          - L1B_SP/L1B_HR_SLC_150
    out:
      - id: L2_HR_LAKE_TILE_150
      - id: L2_HR_RIVER_TILE_150
    run: ./L2_SP.cwl

  - id: PGE_L2_RIV_SP
    in:
      - id: L2_HR_RIVER_TILE
        source:
          - L2_SP/L2_HR_RIVER_TILE_150
    out:
      - id: L2_HR_RIVER_SP
    run: ./PGE_L2_RIV_SP.cwl

  - id: PGE_L2_LAKE_SP
    in:
      - id: L2_HR_LAKE_TILE
        source:
          - L2_SP/L2_HR_LAKE_TILE_150
    out:
      - id: L2_HR_LAKE_SP
    run: ./PGE_L2_LAKE_SP.cwl

requirements:
  - class: SubworkflowFeatureRequirement
