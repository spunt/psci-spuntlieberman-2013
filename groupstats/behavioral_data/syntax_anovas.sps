

DATASET ACTIVATE DataSet0.

USE ALL.
COMPUTE filter_$=(exclude = 0).
VARIABLE LABELS filter_$ 'exclude = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM accr_low_obs accr_low_how accr_low_what accr_low_why accr_high_obs accr_high_how accr_high_what 
    accr_high_why
  /WSFACTOR=Load 2 Polynomial Goal 4 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.

GLM diff_low_obs diff_low_how diff_low_what diff_low_why diff_high_obs diff_high_how diff_high_what 
    diff_high_why
  /WSFACTOR=Load 2 Polynomial Goal 4 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.

GLM accr_low_how accr_low_what accr_low_why accr_high_how accr_high_what 
    accr_high_why
  /WSFACTOR=Load 2 Polynomial Goal 3 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.

GLM diff_low_how diff_low_what diff_low_why diff_high_how diff_high_what 
    diff_high_why
  /WSFACTOR=Load 2 Polynomial Goal 3 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.

GLM accr_low_how accr_low_why accr_high_how accr_high_why
  /WSFACTOR=Load 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.

GLM diff_low_how diff_low_why diff_high_how diff_high_why
  /WSFACTOR=Load 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Load Goal Load*Goal.


DATASET ACTIVATE DataSet1.
T-TEST PAIRS=accr_low_all WITH accr_high_all (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=diff_low_all WITH diff_high_all (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=obs WITH how (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
DATASET ACTIVATE DataSet1.
T-TEST PAIRS=obs WITH what (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
DATASET ACTIVATE DataSet1.
T-TEST PAIRS=obs WITH why (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=how WITH why (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=diff_high_how WITH diff_high_why (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=accr_high_how WITH accr_high_why (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.





