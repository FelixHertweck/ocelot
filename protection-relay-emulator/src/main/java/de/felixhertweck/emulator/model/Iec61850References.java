package de.felixhertweck.emulator.model;

public final class Iec61850References {

    public static final String IED_NAME = "RelayIED";
    public static final String LD_PROT = "PROT";

    private Iec61850References() {}

    // MMXU
    public static final String MMXU_HZ_MAG_F = "RelayIEDPROT/MMXU1.Hz.mag.f";
    public static final String MMXU_TOTW_MAG_F = "RelayIEDPROT/MMXU1.TotW.mag.f";
    public static final String MMXU_A_PHSA_MAG_F = "RelayIEDPROT/MMXU1.A.phsA.cVal.mag.f";
    public static final String MMXU_A_PHSB_MAG_F = "RelayIEDPROT/MMXU1.A.phsB.cVal.mag.f";
    public static final String MMXU_A_PHSC_MAG_F = "RelayIEDPROT/MMXU1.A.phsC.cVal.mag.f";
    public static final String MMXU_PPV_PHSAB_MAG_F = "RelayIEDPROT/MMXU1.PPV.phsAB.cVal.mag.f";
    public static final String MMXU_PPV_PHSBC_MAG_F = "RelayIEDPROT/MMXU1.PPV.phsBC.cVal.mag.f";
    public static final String MMXU_PPV_PHSCA_MAG_F = "RelayIEDPROT/MMXU1.PPV.phsCA.cVal.mag.f";

    // PTOC
    public static final String PTOC_STR_GENERAL = "RelayIEDPROT/PTOC1.Str.general";
    public static final String PTOC_OP_GENERAL = "RelayIEDPROT/PTOC1.Op.general";

    // XCBR
    public static final String XCBR_POS_STVAL = "RelayIEDPROT/XCBR1.Pos.stVal";
    public static final String XCBR_POS_OPER_CTLVAL = "RelayIEDPROT/XCBR1.Pos.Oper.ctlVal";
    public static final String XCBR_POS_CTL_MODEL = "RelayIEDPROT/XCBR1.Pos.ctlModel";
}
