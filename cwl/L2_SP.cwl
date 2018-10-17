class: Workflow
cwlVersion: v1.0
id: L2_SP
label: L2_SP

inputs:

  - id: L1B_HR_SCL_150
    type: 'File[]'

outputs:

  - id: L2_HR_LAKE_TILE_150
    outputSource:
      - PGE_L2_LAKE_TILE/L2_HR_LAKE_TILE
    type: 'File[]'

  - id: L2_HR_RIVER_TILE_150
    outputSource:
      - PGE_L2_RIVER_TILE/L2_HR_RIVER_TILE
    type: 'File[]'

steps:

  - id: PGE_L2_HR_PIXC
    in:
      - id: L1B_HR_SCL
        source: L1B_HR_SCL_150
    out:
      - id: L2_HR_PIXC
    run: ./PGE_L2_HR_PIXC.cwl
    scatter:
      - L1B_HR_SCL
    scatterMethod: dotproduct

  - id: PGE_L2_RIVER_TILE
    in:
      - id: L2_HR_PIXC
        source: PGE_L2_HR_PIXC/L2_HR_PIXC
    out:
      - id: L2_HR_PIXC_VecRiver
      - id: L2_HR_RIVER_TILE
    run: ./PGE_L2_RIVER_TILE.cwl
    scatter:
      - L2_HR_PIXC
    scatterMethod: dotproduct

  - id: PGE_L2_LAKE_TILE
    in:
      - id: L2_HR_PIXC_VecRiver
        source: PGE_L2_RIVER_TILE/L2_HR_PIXC_VecRiver
    out:
      - id: L2_HR_LAKE_TILE
    run: ./PGE_L2_LAKE_TILE.cwl
    scatter:
      - L2_HR_PIXC_VecRiver
    scatterMethod: dotproduct

requirements:
  - class: ScatterFeatureRequirement
