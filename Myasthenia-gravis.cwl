cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  myasthenia---secondary:
    run: myasthenia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  myasthenia-gravis-exacerbation---secondary:
    run: myasthenia-gravis-exacerbation---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: myasthenia---secondary/output
  neonatal-myasthenia-gravis---secondary:
    run: neonatal-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-exacerbation---secondary/output
  myasthenia-gravis-acetylcholinesterase---secondary:
    run: myasthenia-gravis-acetylcholinesterase---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: neonatal-myasthenia-gravis---secondary/output
  myasthenia-gravis-generalized---secondary:
    run: myasthenia-gravis-generalized---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-acetylcholinesterase---secondary/output
  transient-myasthenia-gravis---secondary:
    run: transient-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-generalized---secondary/output
  myasthenia-gravis-thymoma---secondary:
    run: myasthenia-gravis-thymoma---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: transient-myasthenia-gravis---secondary/output
  myopathy-myasthenia-gravis---secondary:
    run: myopathy-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-thymoma---secondary/output
  determined-myasthenia-gravis---secondary:
    run: determined-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: myopathy-myasthenia-gravis---secondary/output
  congenital-myasthenia-gravis---secondary:
    run: congenital-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: determined-myasthenia-gravis---secondary/output
  myasthenia-gravis-infantile---secondary:
    run: myasthenia-gravis-infantile---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: congenital-myasthenia-gravis---secondary/output
  pseudomyopathic-myasthenia-gravis---secondary:
    run: pseudomyopathic-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-infantile---secondary/output
  myasthenia-gravis-vesicle---secondary:
    run: myasthenia-gravis-vesicle---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: pseudomyopathic-myasthenia-gravis---secondary/output
  ocular-myasthenia-gravis---secondary:
    run: ocular-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-vesicle---secondary/output
  developmental-myasthenia-gravis---secondary:
    run: developmental-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ocular-myasthenia-gravis---secondary/output
  adult-myasthenia-gravis---secondary:
    run: adult-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: developmental-myasthenia-gravis---secondary/output
  persistent-myasthenia-gravis---secondary:
    run: persistent-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: adult-myasthenia-gravis---secondary/output
  myasthenia-gravis-strabismu---secondary:
    run: myasthenia-gravis-strabismu---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: persistent-myasthenia-gravis---secondary/output
  juvenile-myasthenia-gravis---secondary:
    run: juvenile-myasthenia-gravis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: myasthenia-gravis-strabismu---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: juvenile-myasthenia-gravis---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
