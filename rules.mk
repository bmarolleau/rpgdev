PGMs := WS1USR.PGM WS2SQL.PGM WS3DTAS.PGM WS4VARCH.PGM TESTPGM.PGM DSPUSR.PGM
WS1USR.PGM:    $(d)/WS1USR.PGM.RPGLE
WS2SQL.PGM:    $(d)/WS2SQL.PGM.SQLRPGLE
WS3DTAS.PGM:    $(d)/WS3DTAS.PGM.SQLRPGLE
WS4VARCH.PGM:    $(d)/WS4VARCH.PGM.SQLRPGLE
TESTPGM.PGM: $(d)/TESTPGM.PGM.RPGLE
DSPUSR.PGM: $(d)/DSPUSR.PGM.SQLRPGLE


