class: Workflow
cwlVersion: v1.0
id: L1B_SP
label: L1B_SP

inputs:

  - id: L0B_HR_RAW_150
    type: 'File[]'

outputs:

  - id: L1B_HR_SLC_150
    outputSource:
      - L1B_SP/L1B_HR_SLC
    type: 'File[]'

steps:
  - id: L1B_SP
    in:
      - id: L0B_HR_RAW
        source: L0B_HR_RAW_150
    out:
      - id: L1B_HR_SLC
    run: ./PGE_L1B_HR_SLC.cwl
    scatter:
      - L0B_HR_RAW
    scatterMethod: dotproduct

requirements:
  - class: ScatterFeatureRequirement
