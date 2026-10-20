<?xml version="1.0" encoding="UTF-8"?>
<SCL version="2007" revision="B" release="4" xmlns="http://www.iec.ch/61850/2003/SCL" xsi:schemaLocation="http://www.iec.ch/61850/2003/SCL SCL.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:IEC_60870_5_104="http://www.iec.ch/61850-80-1/2007/SCL" xmlns:siebase="http://www.siemens.com/energy/2009/09/siprotec5/SieBase" xmlns:siedig="http://www.siemens.com/energy/2011/11/Siedig">
	<Private type="Siemens-SclLib-V5-Version">V03.20.01.000</Private>
	<Private type="Siemens-SclLib-V5-EditTime">24.09.2026 16:15:28</Private>
	<Private type="Siemens-Configurator-Version">6.80.61</Private>
	<Private type="Siemens_SiedigGooseApplicationStorage">
		<siedig:GooseApplicationStorage>
			<siedig:MacAddrMin>01-0C-CD-01-00-00</siedig:MacAddrMin>
			<siedig:MacAddrMax>01-0C-CD-01-01-FF</siedig:MacAddrMax>
			<siedig:GooseApplication name="Trip_ind" desc="" profileName="PriorityLow">
				<siedig:AppId>0001</siedig:AppId>
				<siedig:MinTime unit="s" multiplier="m">10</siedig:MinTime>
				<siedig:MaxTime unit="s" multiplier="m">2000</siedig:MaxTime>
				<siedig:VLanId>000</siedig:VLanId>
				<siedig:VLanPriority>4</siedig:VLanPriority>
				<siedig:DataSet guidRef="03f6eeabc21647cda2640670d974b6bc" />
				<siedig:DataSet guidRef="70bb08b1db72413696545ef36a34cc9e" />
			</siedig:GooseApplication>
		</siedig:GooseApplicationStorage>
	</Private>
	<Header id="IEC station 1" version="1" revision="9" toolID="IEC 61850 System Configurator, Version: 6.80.61" nameStructure="IEDName">
		<Text>IEC station 1</Text>
		<History>
			<Hitem version="1" revision="1" when="Tuesday, February 13, 2024 4:45:40 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP is imported from C:\Users\Administrator.SECES\AppData\Local\Temp\n3cz20fp.1xu\SIP.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="2" when="Tuesday, February 13, 2024 4:45:40 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP1 is imported from C:\Users\Administrator.SECES\AppData\Local\Temp\n3cz20fp.1xu\SIP1.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="3" when="Tuesday, February 13, 2024 4:45:40 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP2 is imported from C:\Users\Administrator.SECES\AppData\Local\Temp\n3cz20fp.1xu\SIP2.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="4" when="Tuesday, September 22, 2026 10:57:55 AM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP1 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\2knxrqc4.45a\SIP1.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="5" when="Tuesday, September 22, 2026 10:57:55 AM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP2 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\2knxrqc4.45a\SIP2.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="6" when="Tuesday, September 22, 2026 10:57:55 AM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP3 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\2knxrqc4.45a\SIP3.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="7" when="Thursday, September 24, 2026 3:49:56 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP2 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\rdfjmrrt.1s4\SIP2.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="8" when="Thursday, September 24, 2026 4:13:19 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP2 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\lupfozvk.gab\SIP2.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="9" when="Thursday, September 24, 2026 4:13:19 PM" who="Licenced User:  Administrator Machine: SECES User: Administrator" what="Device SIP3 updated from C:\Users\Administrator.SECES\AppData\Local\Temp\lupfozvk.gab\SIP3.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
		</History>
	</Header>
	<Substation name="FEEDER">
		<VoltageLevel name="Voltage level1">
			<Voltage unit="V" multiplier="k">400</Voltage>
			<Bay name="Feld1">
				<ConductingEquipment name="QB1" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/BB1/CN_BB1" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="BB1" cNodeName="CN_BB1" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Feld1/CN2" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Feld1" cNodeName="CN2" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="Dc1" lnClass="XSWI" lnInst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConductingEquipment name="QA1" virtual="false" type="CBR">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Feld1/CN2" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Feld1" cNodeName="CN2" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="CB1" lnClass="XCBR" lnInst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConnectivityNode name="CN2" pathName="FEEDER/Voltage level1/Feld1/CN2" />
			</Bay>
			<Bay name="BB1">
				<ConnectivityNode name="CN_BB1" pathName="FEEDER/Voltage level1/BB1/CN_BB1" />
			</Bay>
			<Bay name="Bay1">
				<ConductingEquipment name="QB1" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/BB1/CN_BB1" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="BB1" cNodeName="CN_BB1" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/CN3" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN3" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="Dc1" lnClass="XSWI" lnInst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConductingEquipment name="QB2" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/BB2/CN_BB2" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="BB2" cNodeName="CN_BB2" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/CN3" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN3" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="Dc2" lnClass="XSWI" lnInst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConductingEquipment name="QC1" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN3" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN3" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/grounded" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="grounded" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="Dc3" lnClass="XSWI" lnInst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConductingEquipment name="QA" virtual="false" type="CBR">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN3" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN3" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/CN4" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN4" />
					<SubEquipment name="A" phase="A" virtual="false">
						<LNode iedName="SIP1" ldInst="CB1" lnClass="XCBR" lnInst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" />
					</SubEquipment>
				</ConductingEquipment>
				<ConductingEquipment name="QC2" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN4" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN4" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/grounded" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="grounded" />
				</ConductingEquipment>
				<ConductingEquipment name="BE1" virtual="false" type="CTR">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN4" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN4" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/CN5" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN5" />
				</ConductingEquipment>
				<ConductingEquipment name="BE5" virtual="false" type="VTR">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN5" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN5" />
				</ConductingEquipment>
				<ConductingEquipment name="QB9" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN5" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN5" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/CN6" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN6" />
				</ConductingEquipment>
				<ConductingEquipment name="QC9" virtual="false" type="DIS">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN6" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN6" />
					<Terminal name="T2" connectivityNode="FEEDER/Voltage level1/Bay1/grounded" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="grounded" />
				</ConductingEquipment>
				<ConductingEquipment name="WB1" virtual="false" type="IFL">
					<Terminal name="T1" connectivityNode="FEEDER/Voltage level1/Bay1/CN6" substationName="FEEDER" voltageLevelName="Voltage level1" bayName="Bay1" cNodeName="CN6" />
				</ConductingEquipment>
				<ConnectivityNode name="CN3" pathName="FEEDER/Voltage level1/Bay1/CN3" />
				<ConnectivityNode name="grounded" pathName="FEEDER/Voltage level1/Bay1/grounded" />
				<ConnectivityNode name="CN4" pathName="FEEDER/Voltage level1/Bay1/CN4" />
				<ConnectivityNode name="CN5" pathName="FEEDER/Voltage level1/Bay1/CN5" />
				<ConnectivityNode name="CN6" pathName="FEEDER/Voltage level1/Bay1/CN6" />
			</Bay>
			<Bay name="BB2">
				<ConnectivityNode name="CN_BB2" pathName="FEEDER/Voltage level1/BB2/CN_BB2" />
			</Bay>
		</VoltageLevel>
	</Substation>
	<Communication>
		<SubNetwork name="Default_subnet" type="8-MMS">
			<Private type="Siemens-Start-Address">172.16.0.1</Private>
			<ConnectedAP iedName="SIP1" apName="E">
				<Address>
					<P type="IP" xsi:type="tP_IP">10.1.3.1</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL">00000001</P>
					<P type="OSI-SSEL">0001</P>
					<P type="OSI-TSEL">0001</P>
				</Address>
			</ConnectedAP>
			<ConnectedAP iedName="SIP3" apName="E">
				<Address>
					<P type="IP" xsi:type="tP_IP">10.1.3.51</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL">00000001</P>
					<P type="OSI-SSEL">0001</P>
					<P type="OSI-TSEL">0001</P>
				</Address>
				<GSE ldInst="CB1" cbName="GCB_Trip_ind">
					<Address>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-01-00-00</P>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="APPID" xsi:type="tP_APPID">0002</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
			</ConnectedAP>
			<ConnectedAP iedName="SIP2" apName="E">
				<Address>
					<P type="IP" xsi:type="tP_IP">10.1.3.50</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL">00000001</P>
					<P type="OSI-SSEL">0001</P>
					<P type="OSI-TSEL">0001</P>
				</Address>
				<GSE ldInst="CB1" cbName="GCB_Trip_ind">
					<Address>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-01-00-01</P>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="APPID" xsi:type="tP_APPID">0001</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
			</ConnectedAP>
		</SubNetwork>
	</Communication>
	<IED desc="Hafen -Q61" name="SIP1" type="7SJ82" manufacturer="SIEMENS" configVersion="V08.30.06" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">f975b452-8d5f-4b28-9b3d-fbc86c8e689a</Private>
		<Private type="Siemens-s7ManagerName">7SJ82_1</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Private>
		<Private type="Siemens-Siprotec5-Application-Template">7SJ82_Non_Directional_OC_4I</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">83006</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V08.30.06</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">f975b452-8d5f-4b28-9b3d-fbc86c8e689a</Private>
		<Private type="Siemens-ModifiedDate">09/22/2026 08:57:56</Private>
		<Private type="Siemens-ModificationCounter">4</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="false" supportsLdName="true" maxGOOSE="128" rGOOSE="false" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="6" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="100" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="false" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="0" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
		</Services>
		<AccessPoint desc="Port E" name="E" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">71696749-a4b3-42c3-86c1-ec84a6b074f1</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_Application" desc="General">
						<Private type="Siemens-MasterId">6f0b9b3e-b062-4cb6-9f40-eaed0f833ee4</Private>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP1Application/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">69ad8207-2aeb-440e-a90a-8e5b656b0487</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="0" lnType="SIPROTEC5_LNType_LPHD" desc="Device">
						<Private type="Siemens-MasterId">6005bf6f-65cb-4479-b342-4f4a80683a7e</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V08.30</Val>
							</DAI>
							<DAI name="model">
								<Val>7SJ82</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_LNType_CALH_Application" desc="Alarm handling">
						<Private type="Siemens-MasterId">5916a30e-a707-4dc1-a6b5-33becb8b8ffe</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_LNType_LTIM_Application" desc="Time managem.">
						<Private type="Siemens-MasterId">9af39025-d000-4945-8091-84ff8afb73cd</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_LNType_LTMS_Application" desc="Time sync.">
						<Private type="Siemens-MasterId">f9051c64-7f64-467e-8196-9cb66d9ed8f1</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source" />
						<DOI name="TmSrcTyp" desc="Type of clock source" />
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">49d8e9d4-e1ac-4e92-b666-7d326db2ab50</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetLed" desc="LED not in FG">
						<Private type="Siemens-MasterId">4511f866-a5b2-4494-9426-d12c4718adb9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="CB1" inst="CB1">
					<Private type="Siemens-MasterId">7f6b3087-6d94-4f40-a988-ad165b3db501</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">ef16fbc1-0bf3-48ce-a691-1e5d57139173</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">aefa478d-7f81-4da3-8e58-8c6d56690c97</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_Trip_3pol" desc="Trip logic">
						<Private type="Siemens-MasterId">a6ef0109-0c2a-452f-a1f9-f4d45ed6a8e4</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">235ed4a2-b90d-4b40-9326-826084862673</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">4bbb86a0-2cf4-4afd-8483-1135104967b9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Reset LED Group">
						<Private type="Siemens-MasterId">3870f8d1-44ca-4ed6-bf2b-acaacaa7b75e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">66aaad60-cf83-43c3-a275-567f5dce847f</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">eb669879-a1ae-4d0b-b582-a14a3fe2fd3a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="CB test">
						<Private type="Siemens-MasterId">9fe216ff-ab33-416a-8606-e42c6df8bda0</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="CB1_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">67390bd7-8b82-4886-a213-8088414e95f1</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">0680e8c9-ffed-41e8-8fb2-b4ecdb71a46c</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">9b6592b0-3a27-474e-ac23-1ad36a60799f</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Dc1" inst="Dc1">
					<Private type="Siemens-MasterId">911b3f3d-e765-4b18-a1f7-d6a76c394b36</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">478f1d9c-a6e0-4fa7-94b6-5404555271df</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">23739411-4bc6-44be-aefd-8a9dcd2fec20</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>direct-with-normal-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">4421b8cb-6acb-41ec-b13b-6d3a55ee9c85</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">7a0a3a36-9ceb-42e9-b59c-4e027c369882</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="Dc2" inst="Dc2">
					<Private type="Siemens-MasterId">1c1c2ae0-b61d-4199-8bd3-0696fa5da5fa</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">aa734041-3cd3-4235-872f-117581e3c958</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">7379e256-2ee1-4b17-ac1f-dd5ee279b998</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>direct-with-normal-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">f2fdb456-671b-4116-a830-55840d965ba0</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">51b994a1-f8d6-4658-8427-8c3635eaa7d7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="Dc3" inst="Dc3">
					<Private type="Siemens-MasterId">c689fcee-2472-431e-8101-8d2e83ca82aa</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">76d62805-7acb-4cf5-a586-8578a48ae860</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">ada1ce96-f638-47f5-8540-921bc5fe7de8</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>direct-with-normal-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">27d699b6-d851-4587-83a6-7e1966585f04</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">025511df-7e54-4257-bbd8-72b65dd14110</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">f3cff617-d859-4047-9845-3be9279e4f94</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">070f46f9-1c53-4f08-843e-11b177c8b9a1</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">df357f42-2397-460b-89be-561031cd39f1</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">4ceff460-5a24-4d7c-b4ea-6d87fbf28e2d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL" inst="Mod2">
					<Private type="Siemens-MasterId">5aaf403d-4162-4d1d-905e-9b07cfd7a173</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">df1e0a9e-02ea-4f56-a63f-8a219d810c8d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">2b0c6c50-fc3b-4a93-a17e-1703ee7e7d61</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">100b9b1c-0b4e-4834-98ca-84f3bf012259</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">ad7d126d-fcf8-4658-a0e7-ebd83b141b19</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="2" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="SNMP">
						<Private type="Siemens-MasterId">c14b6895-d777-4326-8cce-2acb20976244</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-01-25 09:09:15</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">605c4468-1d77-4e44-b8dc-88579197c8b7</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-01-25 09:18:06</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN lnClass="LCCH" inst="3" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="SNTP" prefix="">
						<Private type="Siemens-MasterId">2e847c26-7482-4010-a2e2-b66b894de6b0</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-06-11 12:34:22</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">24d98718-3978-40c7-a64b-c8e9192d6bfa</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">53156554-4a06-4172-96cc-6d5b78aae8a8</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">9f0a969a-ca45-4c7f-b04e-925a88d0a877</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS_MPI3p1" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">1d409065-b1c3-4ce1-9de2-af6512abc20d</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">24658417-e623-4bf9-8a16-f4ed869c9ea4</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="CT 3-phase">
						<Private type="Siemens-MasterId">c99b2e76-b5ef-4ed2-870f-318d9cefc05e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">3753ab10-8453-48e7-81ac-2043aa188fe7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">53bb7f75-65a8-4b9f-b05d-368ccc6759a6</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">cc032db0-aa20-4af5-8c10-9f55ca8d6217</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">949b92c6-33d8-49b1-8311-e8031bdf5e49</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">91d0efd9-7828-4cb2-96e9-8868976ba554</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">131bfdbd-f316-4290-bf57-90bb70655474</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">a525a830-2569-4dc0-8839-30025e9f5f1d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">40344299-acd3-44bc-882f-e9d1d86f81e9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">d4170f5f-def0-4052-94a9-77eb4794e5c0</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">fd7a36b9-3e19-4178-8a9e-8c91225aa54c</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">434fd06d-011e-453e-b7a6-688cea78c1f4</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_LNType_RDRE_DEF" desc="Control">
						<Private type="Siemens-MasterId">72886e72-f633-408e-88b5-8576ee0244c3</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1" inst="VI3p1">
					<Private type="Siemens-MasterId">781d254a-e223-4330-a89b-7c531a12257c</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">89619bc2-35e8-4869-a513-751f0eb4fbba</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VI3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">897bd365-f820-4d63-b0bd-fe8dfcac2196</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_Line_3ph" desc="Group indicat.">
						<Private type="Siemens-MasterId">7db0e827-b349-4cea-b650-6aeaf2e5f662</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Reset LED Group">
						<Private type="Siemens-MasterId">24c125f8-6338-41e9-a818-101dc4a3efad</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PHAR" inst="1" lnType="SIPROTEC5_LNType_PHAR" desc="Inrush detect.">
						<Private type="Siemens-MasterId">0e4d3ded-3aa1-4cd2-a38b-c2c855be43ee</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="OCGI" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_OC_Group_Indication" desc="OC group ind.">
						<Private type="Siemens-MasterId">0668ab28-f11f-4dae-bb95-a21f9064f9a6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51N-B1" inst="VI3p1_5051NOCgndB1">
					<Private type="Siemens-MasterId">7135cbb8-e5e9-4a7c-aa18-de5b8bf9cb12</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">1cfefca2-1fcd-4859-a9d1-554a104645cd</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">01174bde-c4af-4e30-9670-c3f686bbc9e5</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Definite-T 1">
						<Private type="Siemens-MasterId">190bc3b8-a0cf-4d31-8694-b3fa2a35f69b</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Definite-T 2">
						<Private type="Siemens-MasterId">2f87742c-3600-448f-8ddc-bd2665bfcc7f</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="NI_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">ba7ef448-659d-46d9-a4a2-d5febd2a31ee</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51-B 1" inst="VI3p1_5051OC3phase1">
					<Private type="Siemens-MasterId">58380006-99f5-4afb-b544-fbf976d78ae9</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">1bc84c16-3813-4263-b3ef-0f28017020b5</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">89be9090-d764-471a-ba1c-e2d1c47f40a1</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Definite-T 1">
						<Private type="Siemens-MasterId">e6220148-f12a-4f30-912e-24fd583f9407</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Definite-T 2">
						<Private type="Siemens-MasterId">8922820b-a49a-4317-aaa8-b277c8eec74b</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="II_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">d5d735af-412c-40a4-83c6-b9fba3d2203c</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_FdSym" inst="VI3p1_FundSymComp">
					<Private type="Siemens-MasterId">1b7eae42-38e3-476c-bc31-99bf4d0e6fad</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">55a6bf76-e84e-433a-8390-51c4b8f6b2f2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">7a91446b-bf45-4ca6-8bec-4e89a3551b29</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">bb7a68a2-0490-40f6-bfe9-ddf293b5dd46</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">4023b512-377b-4599-9a42-42edd6363b14</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_OMV" inst="VI3p1_OperationalValues">
					<Private type="Siemens-MasterId">33f8761f-d69c-4ae4-bbec-6bad18145ec5</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">aeb5f1e2-0def-4860-bc52-0f232b8b19bc</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">ada2ec39-7000-4ba0-946e-cad86414bf93</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">c3612073-3052-443f-88b1-55024958c243</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">34b6bf53-5733-4994-91db-d6023d7d78ea</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cosφ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_ProMon" inst="VI3p1_ProcessMonitor">
					<Private type="Siemens-MasterId">f21362e4-bcb6-4835-8c6a-9f4d6acde510</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">dbbe4f0f-3c0d-46c3-9fd8-5fcc0fdccf07</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="VI3p1_SOTF 1" inst="VI3p1_SwitchOntoFault">
					<Private type="Siemens-MasterId">50887835-73fa-44e6-9382-182739383eb7</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="LLN0">
						<Private type="Siemens-MasterId">c2fb1940-392d-45df-aed7-666a4a797daf</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">d9dfaac9-2477-426c-912b-f7a80527f6f2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="PSOF" inst="1" lnType="SIPROTEC5_LNType_RSOF" desc="Stage 1">
						<Private type="Siemens-MasterId">4e70ca90-ab83-4295-a987-e6f8a63f6d13</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
					</LN>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<IED desc="Altstadt -Q71" name="SIP3" type="7SJ82" manufacturer="SIEMENS" configVersion="V08.30.06" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">b39929fa-e47c-432e-9053-cfcf7b99f7eb</Private>
		<Private type="Siemens-s7ManagerName">7SJ82_3</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Private>
		<Private type="Siemens-Siprotec5-Application-Template">7SJ82_Non_Directional_OC_4I</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">83006</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V08.30.06</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">b39929fa-e47c-432e-9053-cfcf7b99f7eb</Private>
		<Private type="Siemens-ModifiedDate">09/24/2026 13:47:29</Private>
		<Private type="Siemens-ModificationCounter">6</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="false" supportsLdName="true" maxGOOSE="128" rGOOSE="false" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="6" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="100" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="false" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="0" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
		</Services>
		<AccessPoint desc="Port E" name="E" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">0018e6c9-f08f-426a-a51c-518fb1644d93</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1007" desc="General">
						<Private type="Siemens-MasterId">f917c509-3925-41a3-a1c8-73b68c6529e2</Private>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP3Application/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="SGChoiceB1" desc="&gt;SG choice bit 1" />
						<DOI name="SGChoiceB2" desc="&gt;SG choice bit 2" />
						<DOI name="SGChoiceB3" desc="&gt;SG choice bit 3" />
						<DOI name="LedTstStrt" desc="&gt;LED reset" />
						<DOI name="FloOn" desc="&gt;Dev. funct.logout on" />
						<DOI name="FloOff" desc="&gt;Dev. funct.logout off" />
						<DOI name="LightOn" desc="&gt;Light on" />
						<DOI name="FloCmd" desc="Logged off via control" />
						<DOI name="FloState" desc="Device logged off" />
						<DOI name="HealthDev" desc="Health" />
						<DOI name="Inactive" desc="Protection inactive" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="ActiveSG" desc="Active settings group" />
						<DOI name="FunInTest" desc="Functions in Test mode" />
						<DOI name="ProtOnOff" desc="Protection on" />
						<DOI name="FnctLO" desc="Device logout" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="ResCmpFmt" desc="Set. format residu. comp.">
							<DAI name="setVal">
								<Val>RERL_XEXL</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="EnTestMod" desc="Activate device test mode">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="RelBoOnTst" desc="Oper.bin.outp. under test">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="ResvTms" desc="Reserv.time for com.prot.">
							<DAI name="setVal">
								<Val>120</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>65535</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
							</SDI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">8e4ce74a-7027-4eac-8dcf-4ef70077d063</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="0" lnType="SIPROTEC5_1000" desc="Device">
						<Private type="Siemens-MasterId">1e990015-4bae-4160-9de3-60aa85272387</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V08.30</Val>
							</DAI>
							<DAI name="model">
								<Val>7SJ82</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
						<DOI name="GoStop" desc="&gt;GOOSE Stop" />
						<DOI name="SvStop" desc="&gt;SV Stop" />
						<DOI name="LifeCon" desc="Life contact" />
						<DOI name="BatFail" desc="Battery failure" />
						<DOI name="ClkFail" desc="Clock fail" />
						<DOI name="ErrMeasT" desc="Error meas. trans." />
						<DOI name="ErrComp" desc="Compensation error" />
						<DOI name="ErrOffset" desc="Offset error" />
						<DOI name="DigsiAct" desc="DIGSI active" />
						<DOI name="SimuMode" desc="Simulation mode active" />
						<DOI name="CommMode" desc="Commiss. mode active" />
						<DOI name="ErrMemory" desc="Error memory" />
						<DOI name="AuxPwrFail" desc="Auxiliary Power Fail" />
						<DOI name="PSModFail" desc="Power sup. Module fail." />
						<DOI name="PSModOK" desc="Power sup. Module OK" />
						<DOI name="PSAuxPwrFail" desc="Pow. sup. aux. pow. fail." />
						<DOI name="PSAuxPwrOK" desc="Power sup.aux.pow.OK" />
						<DOI name="PSModFailSps" desc="Power sup. Module fail." />
						<DOI name="PSAuxFailSps" desc="Pow. sup. aux. pow. fail." />
						<DOI name="Logon" desc="Cyber Security state" />
						<DOI name="CybSecEvt" desc="Cyber-security event" />
						<DOI name="MsgLost" desc="Event lost" />
						<DOI name="ChtBlk" desc="Chatter blocking" />
						<DOI name="FlshDskHth" desc="Flash disk health" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_1003" desc="Alarm handling">
						<Private type="Siemens-MasterId">116add69-b6ac-4bba-a2cc-86dc85790221</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
						<DOI name="GrIndIn" desc="&gt;Group indication" />
						<DOI name="GrWrnIn" desc="&gt;Group Warning" />
						<DOI name="GrAlmIn" desc="&gt;Group Alarm" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_1004" desc="Time managem.">
						<Private type="Siemens-MasterId">6e2859a4-1e26-4764-b79c-87e59c6064cf</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ClkSetMan" desc="Clock set manually" />
						<DOI name="TmOfsDT" desc="Offset daylight sav. time">
							<SDI name="setMag">
								<DAI name="i">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="i">
									<Val>0</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="i">
									<Val>120</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="i">
									<Val>15</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="DateFormat" desc="Date format">
							<DAI name="setVal">
								<Val>DD.MM.YYYY</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_1005" desc="Time sync.">
						<Private type="Siemens-MasterId">638539b6-fe0a-46e0-a464-0eaa74901b1d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source">
							<DAI name="stVal">
								<Val>not supported</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrcTyp" desc="Type of clock source">
							<DAI name="stVal">
								<Val>Unknown</Val>
							</DAI>
						</DOI>
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
						<DOI name="TmSynErr" desc="Time sync. error" />
						<DOI name="LeapSecond" desc="Leap second" />
						<DOI name="Sync" desc="High accuracy" />
						<DOI name="FltTmSyn" desc="Fault indication after">
							<SDI name="setMag">
								<DAI name="i">
									<Val>600</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="i">
									<Val>0</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="i">
									<Val>3600</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="i">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmSrc1Std" desc="Time source 1">
							<DAI name="setVal">
								<Val>none</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc1Port" desc="Time source 1 port">
							<DAI name="setVal">
								<Val>NotUsed</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc1Ch" desc="Time source 1 channel">
							<DAI name="setVal">
								<Val>NotUsed</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc2Std" desc="Time source 2">
							<DAI name="setVal">
								<Val>none</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc2Port" desc="Time source 2 port">
							<DAI name="setVal">
								<Val>NotUsed</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc2Ch" desc="Time source 2 channel">
							<DAI name="setVal">
								<Val>NotUsed</Val>
							</DAI>
						</DOI>
						<DOI name="TmZnTmSrc1" desc="Time zone time source 1">
							<DAI name="setVal">
								<Val>local</Val>
							</DAI>
						</DOI>
						<DOI name="TmZnTmSrc2" desc="Time zone time source 2">
							<DAI name="setVal">
								<Val>local</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">c4b5aac1-61b7-45e2-954a-b91376d588c1</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_1006" desc="LED not in FG">
						<Private type="Siemens-MasterId">bc7e8d7c-89cd-4a85-a834-849a642a692a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ResetIn" desc="&gt;LED reset" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="ResetCtl" desc="Reset LEDs" />
					</LN>
				</LDevice>
				<LDevice desc="CB1" inst="CB1">
					<Private type="Siemens-MasterId">ec41c981-8c5f-40bd-8231-8f91b90c483d</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">5ccd6022-2d0b-4ec5-8dff-f93f157a67c4</Private>
						<DataSet name="DS_Trip_ind">
							<Private type="Siemens-GUID">70bb08b1db72413696545ef36a34cc9e</Private>
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Tr" daName="general" fc="ST" />
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Tr" daName="q" fc="ST" />
						</DataSet>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
						<GSEControl datSet="DS_Trip_ind" confRev="20001" appID="SIP3/CB1/LLN0/GCB_Trip_ind" name="GCB_Trip_ind" type="GOOSE">
							<IEDName apRef="E">SIP2</IEDName>
						</GSEControl>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">2432bff6-d37e-40ec-93f9-a953e2486e77</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ARtgObj" desc="Rated normal current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.2</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtgObj" desc="Rated voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.2</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PoleOpenA" desc="Current thresh. CB open">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpModeRBRF" desc="Op. mode BFP">
							<DAI name="setVal">
								<Val>unbalancing</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_1032" desc="Trip logic">
						<Private type="Siemens-MasterId">1f04d8a8-70c8-48ba-90cc-6726c1a6f055</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
						<DOI name="TrpBbpDiff" desc="Trip ind.:Busbar diff.prt." />
						<DOI name="TrpBbpBFP" desc="Trip ind.:Busbar BFP" />
						<DOI name="TrpBbpExt" desc="Trip ind.:Busbar ext.trip" />
						<DOI name="ResetTrip" desc="Reset of trip command">
							<DAI name="setVal">
								<Val>accelarated</Val>
							</DAI>
						</DOI>
						<DOI name="RxTr" desc="RxTr">
							<DAI name="dataNs">
								<Val>SIPROTEC5/userdefined</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef iedName="SIP2" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Tr" daName="general" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="GCB_Trip_ind" pServT="GOOSE" desc="RxTr" intAddr="RxTr;/Op/general" pDO="Op" pDA="general" />
							<ExtRef iedName="SIP2" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Tr" daName="q" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="GCB_Trip_ind" pServT="GOOSE" desc="RxTr" intAddr="RxTr;/Op/q" pDO="Op" pDA="q" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsA" pServT="GOOSE" pDO="Op" pDA="phsA" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsB" pServT="GOOSE" pDO="Op" pDA="phsB" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsC" pServT="GOOSE" pDO="Op" pDA="phsC" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/neut" pServT="GOOSE" pDO="Op" pDA="neut" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/t" pServT="GOOSE" pDO="Op" pDA="t" />
						</Inputs>
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_1009" desc="Circuit break.">
						<Private type="Siemens-MasterId">98514b3e-6853-4f09-8df0-57e8e55136c3</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
						<DOI name="SetOpCnt" desc="Set operation counter">
							<DAI name="maxVal">
								<Val>999999999</Val>
							</DAI>
						</DOI>
						<DOI name="SetSwASumA" desc="Set break.cur.sum phA" />
						<DOI name="SetSwASumB" desc="Set break.cur.sum phB" />
						<DOI name="SetSwASumC" desc="Set break.cur.sum phC" />
						<DOI name="SetOpnHrs" desc="Set CB open hours">
							<DAI name="maxVal">
								<Val>9999999</Val>
							</DAI>
						</DOI>
						<DOI name="SetOpHrs" desc="Set operating hours">
							<DAI name="maxVal">
								<Val>9999999</Val>
							</DAI>
						</DOI>
						<DOI name="AqBlk" desc="&gt;Acquisition blocking" />
						<DOI name="Rdy" desc="&gt;Ready" />
						<DOI name="RsSwStat" desc="&gt;Reset switch statist." />
						<DOI name="RsAqBlkSub" desc="&gt;Reset AcqBlk&amp;Subst" />
						<DOI name="TripRelViaBi" desc="&gt;Trip release BBP" />
						<DOI name="TripOpnCmd" desc="Trip/open cmd." />
						<DOI name="ClsCmd" desc="Close command" />
						<DOI name="CmdActv" desc="Command active" />
						<DOI name="AlmSupp" desc="Alarm suppression" />
						<DOI name="DefTr" desc="Definitive trip" />
						<DOI name="SumSwARsA" desc="ΣIA Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
						<DOI name="SumSwARsB" desc="ΣIB Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
						<DOI name="SumSwARsC" desc="ΣIC Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
						<DOI name="SwAphsA" desc="Break.-current phs A">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwAphsB" desc="Break.-current phs B">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwAphsC" desc="Break.-current phs C">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwANeut" desc="Break. current 3I0/IN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwVphsA" desc="Break. voltage phs A">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwVphsB" desc="Break. voltage phs B">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SwVphsC" desc="Break. voltage phs C">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="CBOpnHrs" desc="CB open hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpHrs" desc="Operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AnnBrkVal" desc="Indicat. of breaking values">
							<DAI name="setVal">
								<Val>always</Val>
							</DAI>
						</DOI>
						<DOI name="BbpBlockDO" desc="BBP trip relays blocked" />
						<DOI name="NoTrpRelBi" desc="no release of trip cmd" />
						<DOI name="RxPos1" desc="RxPos1">
							<DAI name="dataNs">
								<Val>SIPROTEC5/userdefined</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="RxPos1" intAddr="RxPos1;/Pos/stVal" pServT="GOOSE" pDO="Pos" pDA="stVal" />
							<ExtRef desc="RxPos1" intAddr="RxPos1;/Pos/q" pServT="GOOSE" pDO="Pos" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_1010" desc="Manual close">
						<Private type="Siemens-MasterId">cbef35da-3908-42a1-96ce-d6e281b0ac20</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
						<DOI name="Input" desc="&gt;Input" />
						<DOI name="Detected" desc="Detected" />
						<DOI name="ActionTmms" desc="Action time">
							<DAI name="setVal">
								<Val>300</Val>
							</DAI>
							<DAI name="minVal">
								<Val>10</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>60000</Val>
							</DAI>
						</DOI>
						<DOI name="CbOpDrpDel" desc="CB open dropout delay">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>60000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_1006" desc="Reset LED Group">
						<Private type="Siemens-MasterId">380e45ff-4a14-4020-92ee-777d400c5d08</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ResetIn" desc="&gt;LED reset" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="ResetCtl" desc="Reset LEDs" />
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_1011" desc="Control">
						<Private type="Siemens-MasterId">61ae6712-425a-4e31-a3da-aa490461b8d8</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthChk" desc="Check switching authority">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="NomEqActl" desc="Check if pos. is reached">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="DblActBlk" desc="Check double activat. blk.">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkByProt" desc="Check blk. by protection">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="OwnSwAuth" desc="Swi.dev. related sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_1012" desc="Interlocking">
						<Private type="Siemens-MasterId">24d48277-d3ef-4f05-a842-f918b3e9c382</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
						<DOI name="EnaOpnFix" desc="&gt;Enable opening(fixed)" />
						<DOI name="EnaClsFix" desc="&gt;Enable closing (fixed)" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_CBT_3pol" desc="CB test">
						<Private type="Siemens-MasterId">7fce47e6-ef3d-4400-bc44-ac8f4f56ec96</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="StrTst3p" desc="3-pole open-close">
							<DAI name="operTimeout">
								<Val>5300</Val>
							</DAI>
						</DOI>
						<DOI name="TstExec" desc="Test execution" />
						<DOI name="TstTr" desc="Trip command issued" />
						<DOI name="TstCls" desc="Close command issued" />
						<DOI name="TstCnc" desc="Test canceled" />
					</LN>
				</LDevice>
				<LDevice desc="CB1_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">5e94b578-317e-428a-b2c8-e355ec832fc2</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">b73250da-fe35-40c7-8816-e5953a0a8f95</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_1014" desc="Fundam">
						<Private type="Siemens-MasterId">0e9e0376-b0fc-44ab-a6e3-d38b3cc2444d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>RMS_FUNDAMENTAL</Val>
							</DAI>
						</DOI>
						<DOI name="VneutC" desc="VN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="AneutC" desc="IN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Dc1" inst="Dc1">
					<Private type="Siemens-MasterId">9e672b73-3161-4aea-803d-1052b7d9fd08</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">eb379b11-531a-47a4-8c33-b30ca3ae8261</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_1011" desc="Control">
						<Private type="Siemens-MasterId">f9f71e62-b29d-4a03-bfa3-2d4d41114fab</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthChk" desc="Check switching authority">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="NomEqActl" desc="Check if pos. is reached">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="DblActBlk" desc="Check double activat. blk.">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkByProt" desc="Check blk. by protection">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="OwnSwAuth" desc="Swi.dev. related sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_1012" desc="Interlocking">
						<Private type="Siemens-MasterId">80d51a7f-dea5-4aa9-b207-a0b314cbc59d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
						<DOI name="EnaOpnFix" desc="&gt;Enable opening(fixed)" />
						<DOI name="EnaClsFix" desc="&gt;Enable closing (fixed)" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_1015" desc="Disconnector">
						<Private type="Siemens-MasterId">8da5f340-84fa-440c-b2fc-3e496470b78f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
						<DOI name="SetOpCnt" desc="Set operation counter">
							<DAI name="maxVal">
								<Val>999999999</Val>
							</DAI>
						</DOI>
						<DOI name="AqBlk" desc="&gt;Acquisition blocking" />
						<DOI name="RsSwStat" desc="&gt;Reset switch statist." />
						<DOI name="RsAqBlkSub" desc="&gt;Reset AcqBlk&amp;Subst" />
						<DOI name="OpnCmd" desc="Open command" />
						<DOI name="ClsCmd" desc="Close command" />
						<DOI name="CmdActv" desc="Command active" />
					</LN>
				</LDevice>
				<LDevice desc="Dc2" inst="Dc2">
					<Private type="Siemens-MasterId">b4d4f73f-36ff-432c-8227-d43cadcd5c26</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">b165af64-c037-4c3b-b0b3-83297fed844b</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_1011" desc="Control">
						<Private type="Siemens-MasterId">69e09b70-1f8c-4646-b80c-8f30171106ba</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthChk" desc="Check switching authority">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="NomEqActl" desc="Check if pos. is reached">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="DblActBlk" desc="Check double activat. blk.">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkByProt" desc="Check blk. by protection">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="OwnSwAuth" desc="Swi.dev. related sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_1012" desc="Interlocking">
						<Private type="Siemens-MasterId">d4905c76-8f46-48dd-9974-b1e83ef0c321</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
						<DOI name="EnaOpnFix" desc="&gt;Enable opening(fixed)" />
						<DOI name="EnaClsFix" desc="&gt;Enable closing (fixed)" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_1015" desc="Disconnector">
						<Private type="Siemens-MasterId">a5b926db-109d-4d22-acbe-e835e3c91960</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
						<DOI name="SetOpCnt" desc="Set operation counter">
							<DAI name="maxVal">
								<Val>999999999</Val>
							</DAI>
						</DOI>
						<DOI name="AqBlk" desc="&gt;Acquisition blocking" />
						<DOI name="RsSwStat" desc="&gt;Reset switch statist." />
						<DOI name="RsAqBlkSub" desc="&gt;Reset AcqBlk&amp;Subst" />
						<DOI name="OpnCmd" desc="Open command" />
						<DOI name="ClsCmd" desc="Close command" />
						<DOI name="CmdActv" desc="Command active" />
					</LN>
				</LDevice>
				<LDevice desc="Dc3" inst="Dc3">
					<Private type="Siemens-MasterId">b31bab80-327a-440e-acce-0156a9e8544a</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">e1726037-c88e-413a-abd2-736e4e89bd7f</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_1011" desc="Control">
						<Private type="Siemens-MasterId">e721fd59-ea6c-4cfc-8379-315fa7ea6ec5</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthChk" desc="Check switching authority">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="NomEqActl" desc="Check if pos. is reached">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="DblActBlk" desc="Check double activat. blk.">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkByProt" desc="Check blk. by protection">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="OwnSwAuth" desc="Swi.dev. related sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_1012" desc="Interlocking">
						<Private type="Siemens-MasterId">73b11499-cb70-4ff0-b93c-21846b23d274</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
						<DOI name="EnaOpnFix" desc="&gt;Enable opening(fixed)" />
						<DOI name="EnaClsFix" desc="&gt;Enable closing (fixed)" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_1015" desc="Disconnector">
						<Private type="Siemens-MasterId">7bd6dc6a-c707-46a4-b623-958860ab9fdc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
						<DOI name="SetOpCnt" desc="Set operation counter">
							<DAI name="maxVal">
								<Val>999999999</Val>
							</DAI>
						</DOI>
						<DOI name="AqBlk" desc="&gt;Acquisition blocking" />
						<DOI name="RsSwStat" desc="&gt;Reset switch statist." />
						<DOI name="RsAqBlkSub" desc="&gt;Reset AcqBlk&amp;Subst" />
						<DOI name="OpnCmd" desc="Open command" />
						<DOI name="ClsCmd" desc="Close command" />
						<DOI name="CmdActv" desc="Command active" />
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">da91f8d7-9937-493a-9333-49170fb09c9f</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">8b76f421-e497-49de-bc9a-fffe98481f3a</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">4947c946-58f4-460e-9b6f-0f23551dd5a0</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">2ff3108d-a289-4155-95e8-5ae02240ea1d</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL" inst="Mod2">
					<Private type="Siemens-MasterId">9929e2a8-0e52-47c1-ac1f-567606e52ff8</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">04554dff-db15-4398-8992-d3766220d01f</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">590ea3b1-c63a-4031-bd18-008cce9d57ee</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">c06d5999-68e3-41f0-bf36-046e2e488ac8</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">ebe35a55-9c1e-4204-8e0e-6d1e592575ec</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="2" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="SNMP">
						<Private type="Siemens-MasterId">99fc9657-d55c-4bcf-be1d-72de4ac7da75</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-02-13 14:06:21</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">b9753e2a-d14f-4382-b8bf-720d4b8890a4</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-02-13 15:28:15</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="MQTTChLiv" desc="MQTT Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">ebe0fe57-b31d-4788-9752-6da8779ac5c9</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">2d1aafff-4e56-4548-ae2c-fcea4382a27c</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_PowerSystem" desc="General">
						<Private type="Siemens-MasterId">45e7f033-196c-4f05-911e-4ea59932eeca</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PhaseRev" desc="&gt;Phs-rotation reversal" />
						<DOI name="InvPhases" desc="&gt;Invert Phases" />
						<DOI name="PhsSeq" desc="Phase sequence">
							<DAI name="setVal">
								<Val>ABC</Val>
							</DAI>
						</DOI>
						<DOI name="PhRevABC" desc="Phase sequence ABC" />
						<DOI name="PhRevACB" desc="Phase sequence ACB" />
						<DOI name="FOutOfRg" desc="Freq.out of oper.range" />
					</LN>
				</LDevice>
				<LDevice desc="PowS_MPI3p1" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">9428ef02-67f1-4b7a-9a58-ca8e9b90d145</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">0bdf592e-7f6f-4aae-ae99-558f628cd42c</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_MUCurrent_3ph" desc="CT 3-phase">
						<Private type="Siemens-MasterId">2e2abcac-5118-4253-8206-fc38d620bfa6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="CtrlIn" desc="Disconnection" />
						<DOI name="DisSet" desc="&gt;Disconnection on" />
						<DOI name="DisReset" desc="&gt;Disconnection off" />
						<DOI name="InvPhABCur" desc="Phases AB inverted" />
						<DOI name="InvPhBCCur" desc="Phases BC inverted" />
						<DOI name="InvPhACCur" desc="Phases AC inverted" />
						<DOI name="StateBi" desc="Disconnection via BI" />
						<DOI name="StateCmd" desc="Disconnect. via control" />
						<DOI name="InvertedPh" desc="Inverted phases">
							<DAI name="setVal">
								<Val>None</Val>
							</DAI>
						</DOI>
						<DOI name="CTConnect" desc="CT connection">
							<DAI name="setVal">
								<Val>3-phase + IN</Val>
							</DAI>
						</DOI>
						<DOI name="CTSPInDir" desc="Neutr.point in dir.of ref.obj">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="CtInvPol" desc="Invert current polarity">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="ARtgSec" desc="Rated secondary current">
							<DAI name="setVal">
								<Val>1A</Val>
							</DAI>
						</DOI>
						<DOI name="AMeasRange" desc="Current range">
							<DAI name="setVal">
								<Val>50 x IR</Val>
							</DAI>
						</DOI>
						<DOI name="AInternTyp" desc="Internal CT type">
							<DAI name="setVal">
								<Val>CT Protection Light</Val>
							</DAI>
						</DOI>
						<DOI name="ARtgSecIN" desc="Rated secondary current">
							<DAI name="setVal">
								<Val>1A</Val>
							</DAI>
						</DOI>
						<DOI name="AMeasRgIN" desc="Current range">
							<DAI name="setVal">
								<Val>50 x IR</Val>
							</DAI>
						</DOI>
						<DOI name="AIntTypIN" desc="Internal CT type">
							<DAI name="setVal">
								<Val>CT Protection Light</Val>
							</DAI>
						</DOI>
						<DOI name="AMeasRgIN2" desc="Current range">
							<DAI name="setVal">
								<Val>50 x IR</Val>
							</DAI>
						</DOI>
						<DOI name="AIntTypIN2" desc="Internal CT type">
							<DAI name="setVal">
								<Val>CT Protection Light</Val>
							</DAI>
						</DOI>
						<DOI name="KToRtgK" desc="CT error changeover">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ErrKToRtgK" desc="CT error A">
							<SDI name="setMag">
								<DAI name="f">
									<Val>5</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="multiplier">
									<Val>c</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.5</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ErrRtgK" desc="CT error B">
							<SDI name="setMag">
								<DAI name="f">
									<Val>15</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="multiplier">
									<Val>c</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.5</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="MuIndex" desc="Measuring-point ID">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="Tracking" desc="Tracking">
							<DAI name="setVal">
								<Val>active</Val>
							</DAI>
						</DOI>
						<DOI name="MUDisActTr" desc="Current check">
							<DAI name="setVal">
								<Val>active</Val>
							</DAI>
						</DOI>
						<DOI name="MUDisTr" desc="I&lt; threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">154d4378-7100-4f2a-ae32-833a6257aede</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">7b9612b7-5e10-4851-8984-20a81f0e5181</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">3758bcdd-2dbc-4c9e-9797-a2a02ceb3e19</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">d578584c-7246-4fbe-8a00-4d9bf625d903</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN lnClass="SBWI" inst="1" lnType="SIPROTEC5_LNType_SBWS_BW_Tr" desc="Brk.wire det." prefix="TR_">
						<Private type="Siemens-MasterId">419a8b39-3f8f-42b3-9d0f-34ffb107dbf7</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ResetBW" desc="&gt;Block function" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="PhABWsus" desc="Phs A BW suspected" />
						<DOI name="PhBBWsus" desc="Phs B BW suspected" />
						<DOI name="PhCBWsus" desc="Phs C BW suspected" />
						<DOI name="PhABW" desc="Phase A broken wire" />
						<DOI name="PhBBW" desc="Phase B broken wire" />
						<DOI name="PhCBW" desc="Phase C broken wire" />
						<DOI name="BWsus" desc="Broken wire suspected" />
						<DOI name="BrokenWire" desc="Broken wire confirmed" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkMod" desc="Mode of blocking">
							<DAI name="setVal">
								<Val>Blocking</Val>
							</DAI>
						</DOI>
						<DOI name="DltAblk" desc="Delta value for autoblock">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.004</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>5</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN lnClass="SSYM" inst="1" lnType="SIPROTEC5_LNType_SSYM_CurBalSV" desc="Supv. balan. I" prefix="I_">
						<Private type="Siemens-MasterId">3edd170f-d0de-4db8-8d41-075c9c4c1a28</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="Failure" desc="Failure" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="OpDlTmms" desc="Delay failure indication">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100000</Val>
							</DAI>
						</DOI>
						<DOI name="BalLimit" desc="Release threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>500</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BalFactor" desc="Threshold min/max">
							<SDI name="setMag">
								<DAI name="f">
									<Val>0.5</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>0.95</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN lnClass="SPSQ" inst="1" lnType="SIPROTEC5_LNType_SPSQ_CurPhSeqSV" desc="Supv. ph.seq.I" prefix="I_">
						<Private type="Siemens-MasterId">2ecbc490-7bf9-4fdc-87be-50492da3bdbe</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="Failure" desc="Failure" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="OpDlTmms" desc="Delay failure indication">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100000</Val>
							</DAI>
						</DOI>
						<DOI name="RlsThrshld" desc="Release threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>500</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN lnClass="SSUM" inst="1" lnType="SIPROTEC5_LNType_SSUM_SlowCurSumSV" desc="Supv. sum I" prefix="I_">
						<Private type="Siemens-MasterId">14263dbd-60f5-4391-afe9-9bc6040e1bf6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="Failure" desc="Failure" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="OpDlTmms" desc="Delay failure indication">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100000</Val>
							</DAI>
						</DOI>
						<DOI name="SumAFactor" desc="Slope factor">
							<SDI name="setMag">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>0.95</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SumAThrld" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN lnClass="SADC" inst="1" lnType="SIPROTEC5_LNType_SADC_FastCurSumSV" desc="Supv.ADC sum I" prefix="ISUM_">
						<Private type="Siemens-MasterId">506f1cac-1646-42e1-ad48-b3eb57f274f0</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="Failure" desc="Failure" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">1bb9c45e-9dd6-49dc-b416-e61104c0c4e2</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">d271ea19-df55-4335-9c95-4c65b255435b</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_RECORDING" desc="General">
						<Private type="Siemens-MasterId">97ab635d-2bfa-49d9-a8b0-7fb676a696ad</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>on</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_GroundFaultLog" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">7c0c9950-a63c-470a-9dd6-babfbd9151e9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>on</Val>
							</DAI>
						</DOI>
						<DOI name="GflNum" desc="Fault number" />
						<DOI name="GflFull" desc="Ground-fault log is full" />
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">b7f5c29a-9f98-444c-adb1-fd4e864c90e4</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">6e983339-853f-430d-8e96-6626ba0cca65</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_RECORDING" desc="General">
						<Private type="Siemens-MasterId">d7548b66-5361-452f-9708-ca52971ce5ca</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>on</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_1017" desc="Control">
						<Private type="Siemens-MasterId">4405b53e-bd18-4550-b26e-8b3b7d0cde1f</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
						<DOI name="PreTmms" desc="Pre-trigger time">
							<DAI name="setVal">
								<Val>500</Val>
							</DAI>
							<DAI name="minVal">
								<Val>50</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>16000</Val>
							</DAI>
						</DOI>
						<DOI name="PstTmms" desc="Post-trigger time">
							<DAI name="setVal">
								<Val>500</Val>
							</DAI>
							<DAI name="minVal">
								<Val>50</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>16000</Val>
							</DAI>
						</DOI>
						<DOI name="StrExt" desc="&gt;External start" />
						<DOI name="ManTrg" desc="&gt;Manual start" />
						<DOI name="RcdStart" desc="Fault recording">
							<DAI name="setVal">
								<Val>Start with pickup</Val>
							</DAI>
						</DOI>
						<DOI name="RcdStore" desc="Storage">
							<DAI name="setVal">
								<Val>Store without release</Val>
							</DAI>
						</DOI>
						<DOI name="MaxTmms" desc="Maximum record time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>200</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>80000</Val>
							</DAI>
						</DOI>
						<DOI name="ManTmms" desc="Manual record time">
							<DAI name="setVal">
								<Val>500</Val>
							</DAI>
							<DAI name="minVal">
								<Val>200</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>80000</Val>
							</DAI>
						</DOI>
						<DOI name="SmpRate" desc="Sampling frequency">
							<DAI name="setVal">
								<Val>2 kHz</Val>
							</DAI>
						</DOI>
						<DOI name="CalcINChl" desc="Cal.zero.seq.cur.channel">
							<DAI name="setVal">
								<Val>No</Val>
							</DAI>
						</DOI>
						<DOI name="CalcVNChl" desc="Cal.zero seq.volt.channel">
							<DAI name="setVal">
								<Val>No</Val>
							</DAI>
						</DOI>
						<DOI name="FltLogFull" desc="Fault log is full" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1" inst="VI3p1">
					<Private type="Siemens-MasterId">6d547b7d-da8e-4803-a43e-a151b187ee7d</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">7862ac8c-e793-4d7e-ab99-f1bcf73559ee</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VI3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ZLIN_FB0_FGStandardUI" desc="General">
						<Private type="Siemens-MasterId">a9b89c52-e24f-40eb-94f3-676131dc5450</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ARtgObj" desc="Rated current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtgObj" desc="Rated voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.2</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VARtgObj" desc="Rated apparent power">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>M</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SysNeutPt" desc="Power-sys. neutral point">
							<DAI name="setVal">
								<Val>grounded</Val>
							</DAI>
						</DOI>
						<DOI name="PQSign" desc="P, Q sign">
							<DAI name="setVal">
								<Val>not reversed</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_Line_3ph" desc="Group indicat.">
						<Private type="Siemens-MasterId">71d3f103-e969-4683-bb35-f73a5cd11d97</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_1006" desc="Reset LED Group">
						<Private type="Siemens-MasterId">c6dadbf0-82fb-47c7-92fc-128cd814e341</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ResetIn" desc="&gt;LED reset" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="ResetCtl" desc="Reset LEDs" />
					</LN>
					<LN prefix="" lnClass="PHAR" inst="1" lnType="SIPROTEC5_1018" desc="Inrush detect.">
						<Private type="Siemens-MasterId">5b3a0bb7-48be-43eb-b188-aa138378865a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="Irs2HaDetA" desc="2.harmonic phase A" />
						<DOI name="Irs2HaDetB" desc="2.harmonic phase B" />
						<DOI name="Irs2HaDetC" desc="2.harmonic phase C" />
						<DOI name="IrsCWADet" desc="CWA" />
						<DOI name="IrsCrsBlk" desc="Cross-blocking" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>On</Val>
							</DAI>
						</DOI>
						<DOI name="CrossBlk" desc="Cross-blocking">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="StrVal2Ha" desc="2nd harmonic content">
							<SDI name="setMag">
								<DAI name="f">
									<Val>15</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="multiplier">
									<Val>c</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>45</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="StrValAMax" desc="Operat.-range limit Imax">
							<SDI name="setMag">
								<DAI name="f">
									<Val>7500</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkIrshCWA" desc="Blocking with CWA">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkIrsh2Ha" desc="Blocking with 2. harmonic">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="CrossBlkTm" desc="Cross-blocking time">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>30</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>200000</Val>
							</DAI>
						</DOI>
						<DOI name="TrFltRec" desc="Start flt.rec">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="OCGI" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_OC_Group_Indication" desc="OC group ind.">
						<Private type="Siemens-MasterId">f25d94b3-f62f-4b71-b54f-0340bc4c9c15</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
					</LN>
					<LN lnClass="SBWI" inst="1" lnType="SIPROTEC5_LNType_SBWS_BW_confirm" desc="Brk.wire conf" prefix="CF_">
						<Private type="Siemens-MasterId">7696cb77-1ca2-43fa-a818-05536d913e6a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Inactive" desc="Inactive" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51N-B1" inst="VI3p1_5051NOCgndB1">
					<Private type="Siemens-MasterId">7766539b-8c11-4b0d-b8f8-2e435cdbb476</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">86ca1c52-8b3f-4812-b922-d754400ec98b</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">38730184-e39a-4040-9e7a-fb35f0d148b4</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_1019" desc="Definite-T 1">
						<Private type="Siemens-MasterId">ac3cd1dc-5ff4-4007-a263-f75f82a8b706</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>9.999999</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpDlTmms" desc="Operate delay">
							<DAI name="setVal">
								<Val>300</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>60000</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="SecHGndDet" desc="Blk. w. 2nd harm. gnd. det.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_1019" desc="Definite-T 2">
						<Private type="Siemens-MasterId">1067e5d2-bf6a-4a93-8cc1-0b1aaecaee24</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>9.999999</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpDlTmms" desc="Operate delay">
							<DAI name="setVal">
								<Val>300</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>60000</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="SecHGndDet" desc="Blk. w. 2nd harm. gnd. det.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="NI_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_Gnd_IOCP_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">928ac068-d2a6-4527-917e-36225dd1e1ce</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="TmACrv" desc="Type of character. curve">
							<DAI name="setCharact">
								<Val>IEC Normal Inverse</Val>
							</DAI>
						</DOI>
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>9.999999</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmMult" desc="Time dial">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.05</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>15</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TypRsCrv" desc="Reset">
							<DAI name="setVal">
								<Val>Inverse Reset</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="DskRng" desc="Disk emulation running" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="SecHGndDet" desc="Blk. w. 2nd harm. gnd. det.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51-B 1" inst="VI3p1_5051OC3phase1">
					<Private type="Siemens-MasterId">1b88e09d-a8cb-4663-8e2a-76639db11296</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">ac10af3f-34dd-49ac-8924-584c02a73f35</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">36aeb62a-4a4d-4d85-9ecd-c4a3c804b5f2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_1020" desc="Definite-T 1">
						<Private type="Siemens-MasterId">d444d003-e3f3-4009-a0e4-e69fddc38d17</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1500</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpDlTmms" desc="Operate delay">
							<DAI name="setVal">
								<Val>300</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100000</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_1020" desc="Definite-T 2">
						<Private type="Siemens-MasterId">34de6de7-b433-4b6a-afb5-566ac6d1eb0e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OpDlTmms" desc="Operate delay">
							<DAI name="setVal">
								<Val>100</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>100000</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="II_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_IOCP_3pol_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">f973b4d3-cece-4f12-8a21-4877ffcd1621</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="TmACrv" desc="Type of character. curve">
							<DAI name="setCharact">
								<Val>IEC Normal Inverse</Val>
							</DAI>
						</DOI>
						<DOI name="StrVal" desc="Threshold">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1500</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>30</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>35000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmMult" desc="Time dial">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.05</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>15</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TypRsCrv" desc="Reset">
							<DAI name="setVal">
								<Val>Inverse Reset</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOpDlTm" desc="&gt;Block delay &amp; op." />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="InrshBlkOp" desc="Inrush blocks operate" />
						<DOI name="DskRng" desc="Disk emulation running" />
						<DOI name="OpTmExp" desc="Operate delay expired" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="InrushDet" desc="Blk. w. inrush curr. detect.">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="MeasMethod" desc="Method of measurement">
							<DAI name="setVal">
								<Val>Fundcomp</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_FdSym" inst="VI3p1_FundSymComp">
					<Private type="Siemens-MasterId">002630e3-02db-4bc7-8afb-3bd1882c50fd</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">3b7d61bb-0a3f-4eb4-a1f3-72f70e65c6a3</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_1014" desc="Fundam">
						<Private type="Siemens-MasterId">9100474c-7f7b-4633-a6b5-3c39e4fc216e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>RMS_FUNDAMENTAL</Val>
							</DAI>
						</DOI>
						<DOI name="VneutC" desc="VN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="AneutC" desc="IN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_1021" desc="Fundam">
						<Private type="Siemens-MasterId">f8e086bd-f400-421e-9b01-62c1fc7c3117</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>RMS_FUNDAMENTAL</Val>
							</DAI>
						</DOI>
						<DOI name="VxC" desc="V">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="VsynxC" desc="Vsy">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="ANparLnC" desc="INp.line">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="AstarPtC" desc="IY traf.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="AxC" desc="I">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="VneutC" desc="VN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="SeqV0" desc="Vseq:0">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_1022" desc="Sy.co.">
						<Private type="Siemens-MasterId">fc5055d6-f590-43c9-8cc2-37465be192dc</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<DAI name="seqT">
								<Val>pos-neg-zero</Val>
							</DAI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<DAI name="seqT">
								<Val>pos-neg-zero</Val>
							</DAI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>RMS_FUNDAMENTAL</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_OMV" inst="VI3p1_OperationalValues">
					<Private type="Siemens-MasterId">9930d299-0317-4642-b41b-fc8910d10218</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">c88893ac-28b6-4c29-8fd2-914c1bdeddb3</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_1023" desc="RMS">
						<Private type="Siemens-MasterId">f60fe365-853c-4250-8210-ab1c60cd7642</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>TRUE_RMS</Val>
							</DAI>
						</DOI>
						<DOI name="Vneut" desc="VN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>2000</Val>
							</DAI>
						</DOI>
						<DOI name="Aneut" desc="IN">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_RMS_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">7092c25f-75c4-4b69-84ea-f0784ba32b7a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>TRUE_RMS</Val>
							</DAI>
						</DOI>
						<DOI name="ANparLn" desc="INp.line">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="AstarPt" desc="IY traf.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_1024" desc="Power">
						<Private type="Siemens-MasterId">4927414e-6d97-40a3-bd82-e473909366a9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cosφ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="ClcMth" desc="Calculation method">
							<DAI name="setVal">
								<Val>TRUE_RMS</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_ProMon" inst="VI3p1_ProcessMonitor">
					<Private type="Siemens-MasterId">ed60b40f-e095-47fa-b2c5-324c9d3c5f92</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">9df20608-2303-434d-be86-8c95f8a31fcd</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN lnClass="ROPA" inst="1" lnType="SIPROTEC5_LNType_ROPA_OpenPoleCurrent" desc="Curr.criterion" prefix="PROM_">
						<Private type="Siemens-MasterId">5537bc56-9876-4fe3-beb6-64b58ea0f002</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Inactive" desc="Inactive" />
					</LN>
					<LN lnClass="RSSR" inst="1" lnType="SIPROTEC5_LNType_RSSR_SwitchingStateRecognitionBasic" desc="Closure detec." prefix="PROM_">
						<Private type="Siemens-MasterId">371b9835-0d20-470e-917b-78628368561e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="DisCntrOpn" desc="&gt;Disconnector open" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="SwitchOn" desc="Closure" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_SOTF 1" inst="VI3p1_SwitchOntoFault">
					<Private type="Siemens-MasterId">73a845a9-2d91-4547-bee3-844d2384c6a3</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">9277e6d7-a0be-46a8-85cd-403b278e3001</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">42bb24d6-89cd-4c23-ba93-8aa336b96ecb</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="PSOF" inst="1" lnType="SIPROTEC5_1025" desc="Stage 1">
						<Private type="Siemens-MasterId">de4ed75c-f7a0-48a7-b762-0369eae7f521</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Inactive" desc="Inactive" />
						<DOI name="Mode" desc="Mode">
							<DAI name="setVal">
								<Val>Off</Val>
							</DAI>
						</DOI>
						<DOI name="BlkOp" desc="Operate &amp; flt.rec. blocked">
							<DAI name="setVal">
								<Val>no</Val>
							</DAI>
						</DOI>
						<DOI name="OpDlTmms" desc="Operate delay">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>60000</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="CBc1" inst="CBc1">
					<Private type="Siemens-MasterId">26d88ee1-2abb-4c26-8f0d-e01fbce91a11</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CBc1/LLN0/LLN0">
						<Private type="Siemens-MasterId">cd6f2b13-4644-446f-aa04-8dc34644e79b</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol_CtlOnly" desc="General" prefix="">
						<Private type="Siemens-MasterId">ece84fb0-1d42-4eea-a1d2-040476fa0135</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="VRtgObj" desc="Rated voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.2</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_CtlOnly" desc="Circuit break." prefix="">
						<Private type="Siemens-MasterId">afea2876-f002-49ed-8824-e42af3e7e274</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SetOpCnt" desc="Set operation counter">
							<DAI name="maxVal">
								<Val>999999999</Val>
							</DAI>
						</DOI>
						<DOI name="AqBlk" desc="&gt;Acquisition blocking" />
						<DOI name="Rdy" desc="&gt;Ready" />
						<DOI name="RsAqBlkSub" desc="&gt;Reset AcqBlk&amp;Subst" />
						<DOI name="RsSwStat" desc="&gt;Reset switch statist." />
						<DOI name="OpnCmd" desc="Open command" />
						<DOI name="ClsCmd" desc="Close command" />
						<DOI name="CmdActv" desc="Command active" />
					</LN>
					<LN lnClass="CSWI" inst="1" lnType="SIPROTEC5_1011" desc="Control" prefix="">
						<Private type="Siemens-MasterId">bc1bf565-7126-4790-bfcb-ddc9215a9ee0</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthChk" desc="Check switching authority">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="NomEqActl" desc="Check if pos. is reached">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="DblActBlk" desc="Check double activat. blk.">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="BlkByProt" desc="Check blk. by protection">
							<DAI name="setVal">
								<Val>yes</Val>
							</DAI>
						</DOI>
						<DOI name="OwnSwAuth" desc="Swi.dev. related sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="EnaAuthID" desc="Specific sw. authorities">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="AuthIDLev" desc="Specific sw.auth. valid for">
							<DAI name="setVal">
								<Val>station/remote</Val>
							</DAI>
						</DOI>
						<DOI name="NumAuthID" desc="Num. of specific sw.auth.">
							<DAI name="setVal">
								<Val>2</Val>
							</DAI>
							<DAI name="minVal">
								<Val>2</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>5</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="MltAuthID" desc="Multiple specific sw.auth.">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthID1" desc="Ident. sw.auth. 1" />
						<DOI name="SwAuthID2" desc="Ident. sw.auth. 2" />
						<DOI name="SwAuthID3" desc="Ident. sw.auth. 3" />
						<DOI name="SwAuthID4" desc="Ident. sw.auth. 4" />
						<DOI name="SwAuthID5" desc="Ident. sw.auth. 5" />
						<DOI name="SwAuth" desc="Switching authority" />
						<DOI name="SwMod" desc="Switching mode" />
						<DOI name="SwAuthEna1" desc="Enable sw. auth. 1">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna2" desc="Enable sw. auth. 2">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna3" desc="Enable sw. auth. 3">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna4" desc="Enable sw. auth. 4">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="SwAuthEna5" desc="Enable sw. auth. 5">
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
					</LN>
					<LN lnClass="CILO" inst="1" lnType="SIPROTEC5_1012" desc="Interlocking" prefix="">
						<Private type="Siemens-MasterId">2ce35dd9-738f-4e30-9aca-b7dccd438f23</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
						<DOI name="EnaOpnFix" desc="&gt;Enable opening(fixed)" />
						<DOI name="EnaClsFix" desc="&gt;Enable closing (fixed)" />
					</LN>
					<LN lnClass="GAPC" inst="1" lnType="SIPROTEC5_1006" desc="Reset LED Group" prefix="RSLED">
						<Private type="Siemens-MasterId">0c118735-1726-415b-8af3-b1afb3290dbc</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="ResetIn" desc="&gt;LED reset" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="ResetCtl" desc="Reset LEDs" />
					</LN>
				</LDevice>
				<LDevice desc="UD1" inst="UD1">
					<Private type="Siemens-MasterId">a54cd114-64dd-464b-b159-c8e112c1bfa3</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="UD1/LLN0/LLN0">
						<Private type="Siemens-MasterId">ebc88752-2fe5-4471-b329-b9ff2c818007</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN lnClass="GAPC" inst="1" lnType="SIPROTEC5_1006" desc="Reset LED Group" prefix="RSLED">
						<Private type="Siemens-MasterId">5c8ac5c3-50db-43cc-98e7-bf757c364fd2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
						</DOI>
						<DOI name="ResetIn" desc="&gt;LED reset" />
						<DOI name="LedTstOut" desc="LED have been reset" />
						<DOI name="ResetCtl" desc="Reset LEDs" />
					</LN>
					<LN lnClass="USER" inst="1" lnType="SIPROTEC5_LNType_USER_Universal" desc="User-def. FB 1" prefix="">
						<Private type="Siemens-MasterId">db0ab0db-4925-4225-9dfe-3bfcf036b8b7</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>Siprotec5/user-defined</Val>
							</DAI>
						</DOI>
					</LN>
					<LN lnClass="USER" inst="2" lnType="SIPROTEC5_LNType_USER_Universal" desc="User-def. FB 2" prefix="">
						<Private type="Siemens-MasterId">c7faa265-e9c1-439c-9b99-3fce0639f545</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>Siprotec5/user-defined</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="UD1_UD1" inst="UD1_FUD1">
					<Private type="Siemens-MasterId">b3afad53-0a9e-4ade-858a-dba47da5460e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="UD1_FUD1/LLN0/LLN0">
						<Private type="Siemens-MasterId">241d66f7-6967-405b-be27-41b899f926fb</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-09-22 08:57:06</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@UD1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<IED desc="Nord -Q51" name="SIP2" type="7SJ82" manufacturer="SIEMENS" configVersion="V08.30.06" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">d18e79ec-16a6-443c-be55-9bfafe25861f</Private>
		<Private type="Siemens-s7ManagerName">7SJ82_2</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Private>
		<Private type="Siemens-Siprotec5-Application-Template">7SJ82_Non_Directional_OC_4I</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">83006</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V08.30.06</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">d18e79ec-16a6-443c-be55-9bfafe25861f</Private>
		<Private type="Siemens-ModifiedDate">09/24/2026 13:50:40</Private>
		<Private type="Siemens-ModificationCounter">6</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="false" supportsLdName="true" maxGOOSE="128" rGOOSE="false" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="6" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="100" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="false" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="0" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
		</Services>
		<AccessPoint desc="Port E" name="E" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">ae914e19-75d9-480e-aca8-de03de81d1ff</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="General">
						<Private type="Siemens-MasterId">8a5ff9ba-8f06-4314-8335-9825852db058</Private>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="SIP2Application/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">530c16e2-5171-4915-885f-1e54e46bc0a7</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="0" lnType="SIPROTEC5_LNType_LPHD" desc="Device">
						<Private type="Siemens-MasterId">0a9ad7dd-d3bb-46c6-a803-c2f9cc89d26d</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>7SJ82-DAAA-AA0-0AAAA0-AA0211-12111B-AAA000-000AB0-HA1BD2-JZ0</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V08.30</Val>
							</DAI>
							<DAI name="model">
								<Val>7SJ82</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_LNType_CALH_Application" desc="Alarm handling">
						<Private type="Siemens-MasterId">0334599f-81ad-4790-8337-4e14ddf2f4cf</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_LNType_LTIM_Application" desc="Time managem.">
						<Private type="Siemens-MasterId">a4ced85e-89cd-4eb9-8fd8-a3053ae5122d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_LNType_LTMS_Application" desc="Time sync.">
						<Private type="Siemens-MasterId">fcf5716a-0105-429e-8a9c-4d7745826f7b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source">
							<DAI name="stVal">
								<Val>not supported</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrcTyp" desc="Type of clock source">
							<DAI name="stVal">
								<Val>Unknown</Val>
							</DAI>
						</DOI>
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">d87934f2-3e0d-4385-8626-97004782950e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetLed" desc="LED not in FG">
						<Private type="Siemens-MasterId">a617603f-db70-457b-bfdd-030d403c6335</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="CB1" inst="CB1">
					<Private type="Siemens-MasterId">210acf94-8a4a-4d00-a0ea-869a6327c61e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">df2252fe-0607-49d2-afab-bdf62c83b525</Private>
						<DataSet name="DS_Trip_ind">
							<Private type="Siemens-GUID">03f6eeabc21647cda2640670d974b6bc</Private>
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Tr" daName="general" fc="ST" />
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Tr" daName="q" fc="ST" />
						</DataSet>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
						<GSEControl datSet="DS_Trip_ind" confRev="20001" appID="SIP2/CB1/LLN0/GCB_Trip_ind" name="GCB_Trip_ind" type="GOOSE">
							<IEDName apRef="E">SIP3</IEDName>
						</GSEControl>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">450bb896-c561-4330-9eff-173baccd29fc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_1026" desc="Trip logic">
						<Private type="Siemens-MasterId">a9208a25-2f2e-40af-8e6a-c3721aef6cc7</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
						<DOI name="RxTr" desc="RxTr">
							<DAI name="dataNs">
								<Val>SIPROTEC5/userdefined</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef iedName="SIP3" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Tr" daName="general" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="GCB_Trip_ind" pServT="GOOSE" desc="RxTr" intAddr="RxTr;/Op/general" pDO="Op" pDA="general" />
							<ExtRef iedName="SIP3" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Tr" daName="q" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="GCB_Trip_ind" pServT="GOOSE" desc="RxTr" intAddr="RxTr;/Op/q" pDO="Op" pDA="q" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsA" pServT="GOOSE" pDO="Op" pDA="phsA" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsB" pServT="GOOSE" pDO="Op" pDA="phsB" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/phsC" pServT="GOOSE" pDO="Op" pDA="phsC" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/neut" pServT="GOOSE" pDO="Op" pDA="neut" />
							<ExtRef desc="RxTr" intAddr="RxTr;/Op/t" pServT="GOOSE" pDO="Op" pDA="t" />
						</Inputs>
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">d5dc2a36-13c4-410e-afcf-1e69bda49597</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">30c7d501-8198-4fde-bb54-c2390c9a6b0e</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Reset LED Group">
						<Private type="Siemens-MasterId">c6082f17-7323-4367-aea7-ad6b77c7a002</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">855242bb-17d8-4e5e-9b27-772e00f7932b</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">ef96b8d9-2e30-4018-a90f-39aebf35938c</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="CB test">
						<Private type="Siemens-MasterId">e7881478-dae1-40aa-a375-43a8aa99b849</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="CB1_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">9ab45fe9-7c7c-4ec3-bf36-09c1da46d57b</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">b4b9462a-d025-4b9d-b823-beee4ed947f3</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">ca17e607-0b85-4887-a9c8-fcd6a82c757b</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Dc1" inst="Dc1">
					<Private type="Siemens-MasterId">102cbbdf-89d7-4567-9ab4-e4a9f0e37514</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">819f0618-03b7-4bd9-9836-61661412c958</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">5b4a0aec-fd45-45c1-a452-2aa71a7410e5</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">e5b92a76-52b5-4009-a914-a49baa003a0a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">d840d695-fe58-450c-aacf-175fe15dad10</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="Dc2" inst="Dc2">
					<Private type="Siemens-MasterId">05a03365-df2e-47b4-a5a2-cb63ac5c2ebf</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">e3e8218c-62d1-42ad-881a-1a886fa36d79</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">239ee2cd-23ef-4c30-bfe9-6f0e751c1883</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">9976bbfc-6e8f-4ff0-9d61-6aee5e27478a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">7bbf5890-e6f1-4ef2-a58e-0178eb37ed84</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="Dc3" inst="Dc3">
					<Private type="Siemens-MasterId">b38cb5cc-fec4-495c-ac15-76fdef8955b7</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">3e0f80c1-9ab4-4e66-aae6-6713d095512e</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">26061c77-64b2-490b-b994-a115b8729755</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">826b0826-8fca-4087-9dec-4d4dc22f41a3</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="" lnClass="XSWI" inst="1" lnType="SIPROTEC5_LNType_XSWI_Ctl" desc="Disconnector">
						<Private type="Siemens-MasterId">f65a3d0a-d8f0-4e32-9d53-5d4c8f37c88b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>10000</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SwTyp" desc="Switching-device type" />
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">5c032dca-663e-46ce-bcb2-77c5f6a29c1b</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">49ccb82a-444e-418b-bb6d-63a235e33ec9</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">14f2254a-0faa-46e7-aa47-4751387bea23</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">74aa14bd-cbfe-43a6-8b60-064f5f394fde</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL" inst="Mod2">
					<Private type="Siemens-MasterId">6261b0b8-7762-41c3-9a32-41c31b4c6fd1</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">f6a77b69-1eb8-4fe2-9e11-434c585ebcec</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">23289882-ded1-40aa-acb7-2a830b15c053</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">c7b05dde-e690-4f23-b295-e323162db133</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">83ac2a8a-3146-4b0a-a1ae-83a0ce285880</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="2" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="SNMP">
						<Private type="Siemens-MasterId">bb205993-f410-4451-a9c4-3edb347a92f5</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-02-13 15:14:33</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_SNMP" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">75115bd0-2cfe-46d4-911e-8096281a8f54</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2024-02-13 15:15:57</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">bc5cf8b1-f6f7-4ad7-9bdf-507b04d4a3c1</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">11f2bb53-5e28-4258-bbff-ab867bdf7be6</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">91bdc332-234b-4202-b964-d52fc310f5ec</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS_MPI3p1" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">a2b4db80-7f0a-4ef7-92b0-e1815da0fd28</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">f91a671b-de95-4399-b05f-0c11b23de3b9</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="CT 3-phase">
						<Private type="Siemens-MasterId">fd89facb-8fe5-42ef-bf95-26207c644b8f</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">9584fef7-bf06-4fc4-8ab9-b94fa0151d0b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">135e3f34-abbe-40c1-9a45-8f941f3fb75e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">3236d505-82ae-4889-92d6-8254ec6a7f31</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">916597e3-41d7-4113-a8c2-84c461c77cfd</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPS</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">baed4388-04d2-4da5-921b-6ff644fdd76a</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">3a4403a4-3b90-4c77-9f2a-94f1280bb077</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">809e994f-8bdd-45b8-8a63-f293b357aab6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">790b2d63-581a-42a7-adb5-119722366365</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">d63bb693-c70e-409c-8069-083bf3ef8518</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">74667b69-ff4a-44fd-bfab-89b22b6e1a4f</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">468be9d7-bfb0-4521-aeb3-bbac9d8b8d25</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_LNType_RDRE_DEF" desc="Control">
						<Private type="Siemens-MasterId">f4571007-596e-457a-ae0f-ecf90ff5fae8</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1" inst="VI3p1">
					<Private type="Siemens-MasterId">f924ee97-13e5-4ea7-894f-8cbe15eeffbe</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">8ca45385-4599-48c4-96f2-1d3f6434fb90</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VI3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="General">
						<Private type="Siemens-MasterId">50bcfc78-b649-464d-9365-f313eb7c82d6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_Line_3ph" desc="Group indicat.">
						<Private type="Siemens-MasterId">697f2c6b-e462-46aa-9b8a-4fca792152e2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetLed" desc="Reset LED Group">
						<Private type="Siemens-MasterId">184f9999-b434-4f18-8c56-44bf2ebed480</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PHAR" inst="1" lnType="SIPROTEC5_LNType_PHAR" desc="Inrush detect.">
						<Private type="Siemens-MasterId">fabaf179-adc8-4ec5-84e4-64d94beec0af</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="OCGI" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_OC_Group_Indication" desc="OC group ind.">
						<Private type="Siemens-MasterId">7ea71dcc-d7f0-4554-a320-b7ce9a91d312</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51N-B1" inst="VI3p1_5051NOCgndB1">
					<Private type="Siemens-MasterId">c27da67b-372f-4b91-9d8f-be15ce8739f2</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">a50dfb34-f3fc-4319-8cfd-a6499a14ac39</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">c5e3b447-8ba0-48f7-bb59-cacee7432500</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Definite-T 1">
						<Private type="Siemens-MasterId">c69d7f59-257f-4a4e-b27a-339d0c291bb6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="ND_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Definite-T 2">
						<Private type="Siemens-MasterId">e5ddd900-d509-4700-adc9-c68c3dd8dbb9</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="NI_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">9c84f13c-0a72-4508-98bb-e1d9c85b4623</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_51-B 1" inst="VI3p1_5051OC3phase1">
					<Private type="Siemens-MasterId">b9b36c21-bc0a-41be-abe0-8a53102dbcae</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">4559a21b-430f-46f9-bb86-2cb98874d491</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">99fe3626-deda-4967-b998-9965d76b5519</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Definite-T 1">
						<Private type="Siemens-MasterId">87185970-9f7b-4995-8eff-88ce2401c0d5</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="2" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Definite-T 2">
						<Private type="Siemens-MasterId">94176779-c56b-4f5a-aa7c-0c0e82e29925</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="II_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">ee1bdc41-d978-44b3-907f-4dcd9a6191de</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_FdSym" inst="VI3p1_FundSymComp">
					<Private type="Siemens-MasterId">fafe6740-4fd9-4add-bf18-7e85aca5d7c5</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">dbef0d26-96c1-4b2f-b9e9-9ad9a0d910f1</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">0f8ca87d-5ab6-4d9c-a285-9db9398ca381</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">556fdea4-39ad-43e1-b5a7-e9fbbd8374a7</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">7ed5a9f2-9a1f-49c8-90d7-882fa6b12df6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<DAI name="seqT">
								<Val>pos-neg-zero</Val>
							</DAI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<DAI name="seqT">
								<Val>pos-neg-zero</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_OMV" inst="VI3p1_OperationalValues">
					<Private type="Siemens-MasterId">6227c344-7f5a-4e4c-a3b6-1bed6e4abbbc</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">ede55e42-a013-4557-b340-117626b27b62</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">fcd51af8-374d-405f-8c70-a21bef1da9ab</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">45528f34-529b-4089-9393-486cc5e7c214</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">f58d7c3e-9009-4008-8fdd-57fd7ee910d8</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cosφ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_ProMon" inst="VI3p1_ProcessMonitor">
					<Private type="Siemens-MasterId">a023174c-e3d5-460a-810e-66e47d9dbf17</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">8385ec66-b72b-460f-9b50-fc5e8a279d19</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="VI3p1_SOTF 1" inst="VI3p1_SwitchOntoFault">
					<Private type="Siemens-MasterId">85341302-6599-4f36-875c-dcebd4c1f12d</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1002" desc="LLN0">
						<Private type="Siemens-MasterId">4818df4d-7ea2-4fff-afaa-21d36afb6cd0</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health">
							<DAI name="stVal">
								<Val>Ok</Val>
							</DAI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">d553b056-49f0-4f4c-adb8-f4fcaf74de8a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="PSOF" inst="1" lnType="SIPROTEC5_LNType_RSOF" desc="Stage 1">
						<Private type="Siemens-MasterId">3aaa6b44-b7a7-4ea4-84ea-d6d49dc9fe63</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2021-02-18 12:49:43</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block stage" />
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
					</LN>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<DataTypeTemplates>
		<LNodeType id="SIPROTEC5_LNType_LLN0_Application" lnClass="LLN0">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" />
			<DO name="LEDRs" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="MltLev" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LPHD" lnClass="LPHD">
			<DO name="PhyNam" type="SIPROTEC5_DOType_DPL_V08.30.06_V08.00.00" />
			<DO name="PhyHealth" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="Proxy" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="PwrUp" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="Sim" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmh" type="SIPROTEC5_DOType_INS_INT32_with_units_V08.30.06_V08.00.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PrcModIna" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CALH_Application" lnClass="CALH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="GrAlm" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="GrWrn" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="GrInd" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTIM_Application" lnClass="LTIM">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TmDT" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="TmOfsTmm" type="SIPROTEC5_DOType_ING_INT32_edit_V08.30.06_V08.00.00" />
			<DO name="TmUseDT" type="SIPROTEC5_DOType_SPG_edit_V08.30.06_V07.90.00" />
			<DO name="TmChgDT" type="SIPROTEC5_DOType_TSG_V08.30.06_V08.01.00" />
			<DO name="TmChgST" type="SIPROTEC5_DOType_TSG_V08.30.06_V08.01.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTMS_Application" lnClass="LTMS">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TmSrc" type="SIPROTEC5_DOType_VSS_V08.30.06_V07.90.00" />
			<DO name="TmSrcTyp" type="SIPROTEC5_DOType_ENS_TmSrcTyp_V08.30.06_V08.01.00" />
			<DO name="TmChSt1" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="TmChSt2" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTRK_Application" lnClass="LTRK">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="GenTrk" type="SIPROTEC5_DOType_CST_V08.30.06_V07.90.00" />
			<DO name="SgcbTrk" type="SIPROTEC5_DOType_STS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_ResetLed" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LLN0_LDevice_Generic" lnClass="LLN0">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" />
			<DO name="GrRef" type="SIPROTEC5_DOType_ORG_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_Trip_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Tr" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_XCBR_3pol_Ctl" lnClass="XCBR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EEHealth" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="SumSwARs" type="SIPROTEC5_DOType_BCR_noFreeze_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_ManualClose" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CSWI" lnClass="CSWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_CSWI_Pos_V08.30.06_V08.00.00" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_statusOnly_and_dir_with_nor_sec_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CILO" lnClass="CILO">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="EnaOpn" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EnaCls" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_V08.30.06_V08.00.00" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_V08.30.06_V08.00.00" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_XSWI_Ctl" lnClass="XSWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="SwTyp" type="SIPROTEC5_DOType_ENS_SwitchType_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LCCH_LineMode" lnClass="LCCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ChLiv" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="RedChLiv" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LCCH_SNMP" lnClass="LCCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ChLiv" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_TCTR" lnClass="TCTR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ARtg" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="Rat" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V08.30.06_V08.00.00" />
			<DO name="HzRtg" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V08.30.06_V08.00.00" />
			<DO name="Cor" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="AmpSv" type="SIPROTEC5_DOType_SAV_VDEWChannelNumber_V08.30.06_V08.00.00" />
			<DO name="Trp" type="SIPROTEC5_DOType_ENG_TextList_Trp_edit_V08.30.06_V08.00.00" />
			<DO name="ScndTmms" type="SIPROTEC5_DOType_ING_INT32_div_readOnly_V08.30.06_V08.00.00" />
			<DO name="Clip" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AccMeas" type="SIPROTEC5_DOType_ENG_TextList_AccMeas_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AccPro" type="SIPROTEC5_DOType_ENG_TextList_AccPro_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="HoldTmms" type="SIPROTEC5_DOType_ING_INT32_div_readOnly_V08.30.06_V08.00.00" />
			<DO name="NamAccRtg" type="SIPROTEC5_DOType_VSD_readOnly_V08.30.06_V08.00.00" />
			<DO name="NamARtg" type="SIPROTEC5_DOType_VSD_readOnly_V08.30.06_V08.00.00" />
			<DO name="NamClipRtg" type="SIPROTEC5_DOType_VSD_readOnly_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_RDRE_DEF" lnClass="RDRE">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="RcdTrg" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="MemRs" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V08.30.06_V07.90.00" />
			<DO name="MemClr" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V08.30.06_V07.90.00" />
			<DO name="RcdMade" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="FltNum" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="RcdStr" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FG_Line_3ph" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PHAR" lnClass="PHAR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_OC_Group_Indication" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABCN_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FN_Str_NonPhsSel_Without_DirRouting_Op_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOC_Gnd_DOCP_Bas" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol_Bas" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" lnClass="MMXN">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" lnClass="MSQI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="SeqA" type="SIPROTEC5_DOType_SEQ_V08.30.06_V08.00.00" />
			<DO name="SeqV" type="SIPROTEC5_DOType_SEQ_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_mag_V08.30.06_V08.00.00" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V08.30.06_V08.00.00" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TotW" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotVAr" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotVA" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotPF" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="Hz" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="W" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
			<DO name="VAr" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
			<DO name="VA" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_RSOF" lnClass="PSOF">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1001" lnClass="LLN0">
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="LEDRs" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="MltLev" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1002" lnClass="LLN0">
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" />
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="GrRef" type="SIPROTEC5_DOType_ORG_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1000" lnClass="LPHD">
			<DO name="PhyNam" type="SIPROTEC5_DOType_DPL_V08.30.06_V08.00.00" />
			<DO name="PhyHealth" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="Proxy" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="PwrUp" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="Sim" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmh" type="SIPROTEC5_DOType_INS_INT32_with_units_V08.30.06_V08.00.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="GoStop" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SvStop" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="LifeCon" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BatFail" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ClkFail" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ErrMeasT" type="SIPROTEC5_DOType_ENS_ErrMeasT_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ErrComp" type="SIPROTEC5_DOType_ENS_ErrComp_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ErrOffset" type="SIPROTEC5_DOType_ENS_ErrOffset_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DigsiAct" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SimuMode" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CommMode" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ErrMemory" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AuxPwrFail" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PSModFail" type="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PSModOK" type="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PSAuxPwrFail" type="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PSAuxPwrOK" type="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PSModFailSps" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="PSAuxFailSps" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Logon" type="SIPROTEC5_DOType_ENS_Login_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CybSecEvt" type="SIPROTEC5_DOType_ENS_CyberSecEvent_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MsgLost" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ChtBlk" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FlshDskHth" type="SIPROTEC5_DOType_ENS_Health_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PrcModIna" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1003" lnClass="CALH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="GrAlm" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="GrWrn" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="GrInd" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="GrIndIn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="GrWrnIn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="GrAlmIn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1004" lnClass="LTIM">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TmDT" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="TmOfsTmm" type="SIPROTEC5_DOType_ING_INT32_edit_V08.30.06_V08.00.00" />
			<DO name="TmUseDT" type="SIPROTEC5_DOType_SPG_edit_V08.30.06_V07.90.00" />
			<DO name="TmChgDT" type="SIPROTEC5_DOType_TSG_V08.30.06_V08.01.00" />
			<DO name="TmChgST" type="SIPROTEC5_DOType_TSG_V08.30.06_V08.01.00" />
			<DO name="ClkSetMan" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmOfsDT" type="SIPROTEC5_DOType_ASG_INT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="DateFormat" type="SIPROTEC5_DOType_ENG_TextList_DateFormat_edit_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1005" lnClass="LTMS">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TmSrc" type="SIPROTEC5_DOType_VSS_V08.30.06_V07.90.00" />
			<DO name="TmSrcTyp" type="SIPROTEC5_DOType_ENS_TmSrcTyp_V08.30.06_V08.01.00" />
			<DO name="TmChSt1" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="TmChSt2" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="TmSynErr" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="LeapSecond" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Sync" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FltTmSyn" type="SIPROTEC5_DOType_ASG_INT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="TmSrc1Std" type="SIPROTEC5_DOType_ENG_TextList_TmSrcStd_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmSrc1Port" type="SIPROTEC5_DOType_ENG_TextList_Ports_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmSrc1Ch" type="SIPROTEC5_DOType_ENG_TextList_TmSrcCh_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmSrc2Std" type="SIPROTEC5_DOType_ENG_TextList_TmSrcStd_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmSrc2Port" type="SIPROTEC5_DOType_ENG_TextList_Ports_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmSrc2Ch" type="SIPROTEC5_DOType_ENG_TextList_TmSrcCh_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmZnTmSrc1" type="SIPROTEC5_DOType_ENG_TextList_TmZnTmSrc_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TmZnTmSrc2" type="SIPROTEC5_DOType_ENG_TextList_TmZnTmSrc_edit_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1006" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ResetIn" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="LedTstOut" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ResetCtl" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1007" lnClass="LLN0">
			<DO name="SGChoiceB1" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SGChoiceB2" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SGChoiceB3" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="LedTstStrt" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="FloOn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="FloOff" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="LightOn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="FloCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FloState" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="HealthDev" type="SIPROTEC5_DOType_ENS_Health_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="LedTstOut" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuth" type="SIPROTEC5_DOType_ENS_SwitchingAuthority_LocalDigsiStationRemote_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwMod" type="SIPROTEC5_DOType_ENS_SwitchingMode_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ActiveSG" type="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FunInTest" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="ProtOnOff" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="FnctLO" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna1" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna2" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna3" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna4" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna5" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="LEDRs" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="ResCmpFmt" type="SIPROTEC5_DOType_ENG_TextList_ResCmpFmt_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MltLev" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="EnaAuthID" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AuthIDLev" type="SIPROTEC5_DOType_ENG_SwitchingAuthority_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="NumAuthID" type="SIPROTEC5_DOType_ING_INT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="MltAuthID" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID1" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID2" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID3" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID4" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID5" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="EnTestMod" type="SIPROTEC5_DOType_SPG_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="RelBoOnTst" type="SIPROTEC5_DOType_SPG_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ResvTms" type="SIPROTEC5_DOType_ING_INT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ARtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VRtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="PoleOpenA" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="OpModeRBRF" type="SIPROTEC5_DOType_ENG_TextList_OpModeRBRF_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1009" lnClass="XCBR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EEHealth" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="SumSwARs" type="SIPROTEC5_DOType_BCR_noFreeze_V08.30.06_V08.00.00" />
			<DO name="SetOpCnt" type="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SetSwASumA" type="SIPROTEC5_DOType_APC_FLOAT32_controllable_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SetSwASumB" type="SIPROTEC5_DOType_APC_FLOAT32_controllable_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SetSwASumC" type="SIPROTEC5_DOType_APC_FLOAT32_controllable_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SetOpnHrs" type="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SetOpHrs" type="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AqBlk" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Rdy" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsSwStat" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsAqBlkSub" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="TripRelViaBi" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="TripOpnCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ClsCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CmdActv" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AlmSupp" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DefTr" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SumSwARsA" type="SIPROTEC5_DOType_BCR_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SumSwARsB" type="SIPROTEC5_DOType_BCR_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SumSwARsC" type="SIPROTEC5_DOType_BCR_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwAphsA" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwAphsB" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwAphsC" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwANeut" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwVphsA" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwVphsB" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SwVphsC" type="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="CBOpnHrs" type="SIPROTEC5_DOType_INS_INT32_with_units_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="OpHrs" type="SIPROTEC5_DOType_INS_INT32_with_units_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AnnBrkVal" type="SIPROTEC5_DOType_ENG_TextList_Always_WithTrip_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BbpBlockDO" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="NoTrpRelBi" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="RxPos1" type="SIPROTEC5_DOType_ComProxy_DPC_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1010" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Input" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Detected" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ActionTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="CbOpDrpDel" type="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1011" lnClass="CSWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_CSWI_Pos_V08.30.06_V08.00.00" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_statusOnly_and_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="SwAuthChk" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_Advanced_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="NomEqActl" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DblActBlk" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkByProt" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OwnSwAuth" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="EnaAuthID" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AuthIDLev" type="SIPROTEC5_DOType_ENG_SwitchingAuthority_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="NumAuthID" type="SIPROTEC5_DOType_ING_INT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="MltAuthID" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID1" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID2" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID3" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID4" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthID5" type="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuth" type="SIPROTEC5_DOType_ENS_SwitchingAuthority_LocalDigsiStationRemote_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwMod" type="SIPROTEC5_DOType_ENS_SwitchingMode_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna1" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna2" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna3" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna4" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwAuthEna5" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1012" lnClass="CILO">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="EnaOpn" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EnaCls" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EnaOpnFix" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="EnaClsFix" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_CBT_3pol" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="StrTst3p" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="TstExec" type="SIPROTEC5_DOType_ENS_TextList_CBT_TstExec_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TstTr" type="SIPROTEC5_DOType_ENS_TextList_CBT_TstTr_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TstCls" type="SIPROTEC5_DOType_ENS_TextList_CBT_TstCls_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TstCnc" type="SIPROTEC5_DOType_ENS_TextList_CBT_TstCnc_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1014" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_V08.30.06_V08.00.00" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_V08.30.06_V08.00.00" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VneutC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AneutC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol_CtlOnly" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="VRtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_XCBR_3pol_CtlOnly" lnClass="XCBR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="EEHealth" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="SetOpCnt" type="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AqBlk" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Rdy" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsAqBlkSub" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsSwStat" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="OpnCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ClsCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CmdActv" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1015" lnClass="XSWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" />
			<DO name="SwTyp" type="SIPROTEC5_DOType_ENS_SwitchType_V08.30.06_V07.90.00" />
			<DO name="SetOpCnt" type="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AqBlk" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsSwStat" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RsAqBlkSub" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="OpnCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ClsCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CmdActv" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LCCH_61850" lnClass="LCCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ChLiv" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="MQTTChLiv" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_PowerSystem" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PhaseRev" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="InvPhases" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="PhsSeq" type="SIPROTEC5_DOType_ENG_TextList_PhsSeq_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhRevABC" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhRevACB" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FOutOfRg" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_MUCurrent_3ph" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="CtrlIn" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="DisSet" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="DisReset" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="InvPhABCur" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InvPhBCCur" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InvPhACCur" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="StateBi" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="StateCmd" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InvertedPh" type="SIPROTEC5_DOType_ENG_TextList_InvertedPh_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CTConnect" type="SIPROTEC5_DOType_ENG_TextList_CTConnect_with_dataNs_V08.30.06_V08.30.00" />
			<DO name="CTSPInDir" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CtInvPol" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ARtgSec" type="SIPROTEC5_DOType_ENG_TextList_ArtgSec_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AMeasRange" type="SIPROTEC5_DOType_ENG_TextList_AMeasRange_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AInternTyp" type="SIPROTEC5_DOType_ENG_TextList_AInternTyp_with_dataNs_V08.30.06_V08.01.00" />
			<DO name="ARtgSecIN" type="SIPROTEC5_DOType_ENG_TextList_ArtgSec_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AMeasRgIN" type="SIPROTEC5_DOType_ENG_TextList_AMeasRange_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AIntTypIN" type="SIPROTEC5_DOType_ENG_TextList_AInternTyp_with_dataNs_V08.30.06_V08.01.00" />
			<DO name="AMeasRgIN2" type="SIPROTEC5_DOType_ENG_TextList_AMeasRange_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="AIntTypIN2" type="SIPROTEC5_DOType_ENG_TextList_AInternTyp_with_dataNs_V08.30.06_V08.01.00" />
			<DO name="KToRtgK" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ErrKToRtgK" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ErrRtgK" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="MuIndex" type="SIPROTEC5_DOType_ING_INT32_readOnly_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Tracking" type="SIPROTEC5_DOType_ENG_TextList_ActiveInactive_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MUDisActTr" type="SIPROTEC5_DOType_ENG_TextList_ActiveInactive_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MUDisTr" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SBWS_BW_Tr" lnClass="SBWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="ResetBW" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhABWsus" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhBBWsus" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhCBWsus" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhABW" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhBBW" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PhCBW" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BWsus" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BrokenWire" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkMod" type="SIPROTEC5_DOType_ENG_TextList_BlkMod_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DltAblk" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SSYM_CurBalSV" lnClass="SSYM">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Failure" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="BalLimit" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="BalFactor" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SPSQ_CurPhSeqSV" lnClass="SPSQ">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Failure" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="RlsThrshld" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SSUM_SlowCurSumSV" lnClass="SSUM">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Failure" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="SumAFactor" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SumAThrld" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SADC_FastCurSumSV" lnClass="SADC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Failure" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_RECORDING" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_On_Test_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_GroundFaultLog" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_On_Test_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="GflNum" type="SIPROTEC5_DOType_INS_INT32_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="GflFull" type="SIPROTEC5_DOType_INS_INT32_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1017" lnClass="RDRE">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="RcdTrg" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" />
			<DO name="MemRs" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V08.30.06_V07.90.00" />
			<DO name="MemClr" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V08.30.06_V07.90.00" />
			<DO name="RcdMade" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="FltNum" type="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" />
			<DO name="RcdStr" type="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" />
			<DO name="PreTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="PstTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="StrExt" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ManTrg" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="RcdStart" type="SIPROTEC5_DOType_ENG_TextList_RcdStart_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="RcdStore" type="SIPROTEC5_DOType_ENG_TextList_RcdStore_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MaxTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ManTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SmpRate" type="SIPROTEC5_DOType_ENG_TextList_SmpRate_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CalcINChl" type="SIPROTEC5_DOType_ENG_TextList_CalcINChannel_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CalcVNChl" type="SIPROTEC5_DOType_ENG_TextList_CalcVNChannel_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="FltLogFull" type="SIPROTEC5_DOType_INS_INT32_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_USER_Universal" lnClass="USER">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_ZLIN_FB0_FGStandardUI" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ARtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VRtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VARtgObj" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_internal_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SysNeutPt" type="SIPROTEC5_DOType_ENG_TextList_System_Neutralpoint_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="PQSign" type="SIPROTEC5_DOType_ENG_TextList_PQ_Sign_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_SBWS_BW_confirm" lnClass="SBWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1018" lnClass="PHAR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Irs2HaDetA" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Irs2HaDetB" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Irs2HaDetC" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="IrsCWADet" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="IrsCrsBlk" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CrossBlk" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="StrVal2Ha" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="StrValAMax" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="BlkIrshCWA" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkIrsh2Ha" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="CrossBlkTm" type="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="TrFltRec" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1019" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="StrVal" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="BlkOpDlTm" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrshBlkOp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmExp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkOp" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrushDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SecHGndDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MeasMethod" type="SIPROTEC5_DOType_ENG_TextList_MeasMethod_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOC_Gnd_IOCP_Bas" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="TmACrv" type="SIPROTEC5_DOType_CURVE_TextList_TmACrv_Standard_V08.30.06_V07.90.00" />
			<DO name="StrVal" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="TmMult" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="TypRsCrv" type="SIPROTEC5_DOType_ENG_TextList_TypRsCrv_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="BlkOpDlTm" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrshBlkOp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DskRng" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmExp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkOp" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrushDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SecHGndDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MeasMethod" type="SIPROTEC5_DOType_ENG_TextList_MeasMethod_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1020" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="StrVal" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="BlkOpDlTm" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrshBlkOp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmExp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkOp" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrushDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MeasMethod" type="SIPROTEC5_DOType_ENG_TextList_MeasMethod_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOC_3ph_IOCP_3pol_Bas" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="TmACrv" type="SIPROTEC5_DOType_CURVE_TextList_TmACrv_Standard_V08.30.06_V07.90.00" />
			<DO name="StrVal" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="TmMult" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" />
			<DO name="TypRsCrv" type="SIPROTEC5_DOType_ENG_TextList_TypRsCrv_V08.30.06_V07.90.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="BlkOpDlTm" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrshBlkOp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="DskRng" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpTmExp" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkOp" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="InrushDet" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="MeasMethod" type="SIPROTEC5_DOType_ENG_TextList_MeasMethod_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1021" lnClass="MMXN">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VxC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VsynxC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ANparLnC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AstarPtC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AxC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="VneutC" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="SeqV0" type="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1022" lnClass="MSQI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="SeqA" type="SIPROTEC5_DOType_SEQ_V08.30.06_V08.00.00" />
			<DO name="SeqV" type="SIPROTEC5_DOType_SEQ_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1023" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_mag_V08.30.06_V08.00.00" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V08.30.06_V08.00.00" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Vneut" type="SIPROTEC5_DOType_MV_Float_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Aneut" type="SIPROTEC5_DOType_MV_Float_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXN_OpMeas_RMS_1ph_Pres" lnClass="MMXN">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="ANparLn" type="SIPROTEC5_DOType_MV_Float_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="AstarPt" type="SIPROTEC5_DOType_MV_Float_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1024" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="TotW" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotVAr" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotVA" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="TotPF" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="Hz" type="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" />
			<DO name="W" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
			<DO name="VAr" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
			<DO name="VA" type="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" />
			<DO name="ClcMth" type="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_ROPA_OpenPoleCurrent" lnClass="ROPA">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_RSSR_SwitchingStateRecognitionBasic" lnClass="RSSR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" />
			<DO name="DisCntrOpn" type="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="SwitchOn" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1025" lnClass="PSOF">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Inactive" type="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="Mode" type="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="BlkOp" type="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="OpDlTmms" type="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1026" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Tr" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="RxTr" type="SIPROTEC5_DOType_ComProxy_ACT_V08.30.06_V07.90.00" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1032" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" />
			<DO name="Tr" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" />
			<DO name="TrpBbpDiff" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TrpBbpBFP" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="TrpBbpExt" type="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" />
			<DO name="ResetTrip" type="SIPROTEC5_DOType_ENG_TextList_ResetTrip_edit_and_dataNs_V08.30.06_V07.90.00" />
			<DO name="RxTr" type="SIPROTEC5_DOType_ComProxy_ACT_V08.30.06_V07.90.00" />
		</LNodeType>
		<DOType id="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V08.30.06_V07.90.00" cdc="SPG">
			<DA fc="SE" name="setVal" bType="BOOLEAN" valKind="RO" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_nor_sec_and_dataNs_V08.30.06_V07.90.00" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_with_dataNs_V08.30.06_V07.90.00" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V08.30.06_V07.90.00" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V08.30.06_V07.90.00" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="ldNs" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Health_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Health_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Behavior_V08.30.06_V08.30.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V08.30.06_V08.30.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V08.30.06_V08.30.00" cdc="ENC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V08.30.06_V08.30.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Mod_OnBlockedTestTestBlocked_V08.30.06_V08.30.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V08.30.06_V08.00.00" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="BOOLEAN" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
			<DA fc="BL" name="blkEna" bType="BOOLEAN" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5/userdefined</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V08.30.06_V08.00.00" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="lnNs" bType="VisString255" valKind="RO">
				<Val>IEC 61850-7-4:2007B</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_with_units_V08.30.06_V08.00.00" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_V08.30.06_V07.90.00" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPL_V08.30.06_V08.00.00" cdc="DPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="hwRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="serNum" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="model" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="location" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="owner" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V08.30.06_V08.30.00" cdc="ENC">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V08.30.06_V08.30.00">
				<Val>on</Val>
			</DA>
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V08.30.06_V07.90.00">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_TSG_V08.30.06_V08.01.00" cdc="TSG">
			<DA fc="SE" name="setCal" bType="Struct" type="SIPROTEC5_DAType_CalendarTime_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPG_edit_V08.30.06_V07.90.00" cdc="SPG">
			<DA fc="SE" name="setVal" bType="BOOLEAN" valKind="Set" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_edit_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="Set" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TmSrcTyp_V08.30.06_V08.01.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_TmSrcTyp_V08.30.06_V08.01.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_VSS_V08.30.06_V07.90.00" cdc="VSS">
			<DA dchg="true" fc="ST" name="stVal" bType="VisString255" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_STS_V08.30.06_V07.90.00" cdc="STS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V08.30.06_V07.90.00" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V08.30.06_V07.90.00" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="numOfSG" bType="INT8U" />
			<DA fc="SR" name="actSG" bType="INT8U" />
			<DA fc="SR" name="editSG" bType="INT8U" />
			<DA fc="SR" name="cnfEdit" bType="BOOLEAN" />
			<DA fc="SR" name="lActTm" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CST_V08.30.06_V07.90.00" cdc="CST">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V08.30.06_V07.90.00" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V08.30.06_V07.90.00" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ORG_V08.30.06_V08.00.00" cdc="ORG">
			<DA dchg="true" fc="SP" name="setSrcRef" bType="ObjRef" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V08.30.06_V07.90.00" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsA" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsB" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsC" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="neut" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirNeut" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_3pol_V08.30.06_V07.90.00" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_V08.30.06_V07.90.00" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_BCR_noFreeze_V08.30.06_V08.00.00" cdc="BCR">
			<DA dchg="true" fc="ST" name="actVal" bType="INT64" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="pulsQty" bType="FLOAT32" valKind="RO">
				<Val>1</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_status_only_V08.30.06_V07.90.00" cdc="SPC">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V08.30.06_V07.90.00">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPC_XCBR_Pos_V08.30.06_V07.90.00" cdc="DPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Dbpos" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="ST" name="stSeld" bType="BOOLEAN" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="Dbpos" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
			<DA fc="BL" name="blkEna" bType="BOOLEAN" />
			<DA dchg="true" fc="CF" name="pulseConfig" bType="Struct" type="SIPROTEC5_DAType_PulseConfig_XCBR_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V08.30.06_V07.90.00">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_V08.30.06_V07.90.00" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_for_Input_V08.30.06_V08.00.00" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="BOOLEAN" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V08.30.06_V08.30.00" cdc="ENC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V08.30.06_V08.30.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Mod_V08.30.06_V08.30.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_statusOnly_and_dir_with_nor_sec_V08.30.06_V07.90.00" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPC_CSWI_Pos_V08.30.06_V08.00.00" cdc="DPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Dbpos" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="ST" name="stSeld" bType="BOOLEAN" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_V08.30.06_V07.90.00">
				<Val>status-only</Val>
			</DA>
			<DA dchg="true" fc="CF" name="sboTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="operTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="CO" name="SBO" bType="VisString129">
				<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
			</DA>
			<DA fc="CO" name="SBOw" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
			<DA fc="CO" name="Cancel" bType="Struct" type="SIPROTEC5_DAType_Cancel_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABCRes_V08.30.06_V08.00.00" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="res" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" cdc="CMV">
			<DA fc="MX" name="instCVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="MX" name="cVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAng" bType="INT32U" valKind="Set">
				<Val>333</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAngRef" bType="FLOAT32" valKind="RO">
				<Val>360</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DEL_V08.30.06_V08.00.00" cdc="DEL">
			<SDO name="phsAB" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsBC" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsCA" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_SwitchType_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_SwitchType_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_VSD_readOnly_V08.30.06_V08.00.00" cdc="VSD">
			<DA fc="DC" name="val" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_div_readOnly_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="RO" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AccPro_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_EnType_InstrumentTransformerProtectionRatingKind_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AccMeas_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_EnType_InstrumentTransformerMeasurementRatingKind_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Trp_edit_V08.30.06_V08.00.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Trp_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SAV_VDEWChannelNumber_V08.30.06_V08.00.00" cdc="SAV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="sVC" bType="Struct" type="SIPROTEC5_DAType_ScaledValueConfig_readOnly_VisAsProperty_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_edit_V08.30.06_V08.00.00" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V08.30.06_V08.00.00" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V08.30.06_V07.90.00" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_enh_sec_V08.30.06_V07.90.00">
				<Val>direct-with-enhanced-security</Val>
			</DA>
			<DA dchg="true" fc="CF" name="operTimeout" bType="INT32U">
				<Val>0</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V08.30.06_V07.90.00" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_1_3pol_GABCN_V08.30.06_V07.90.00" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="neut" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V08.30.06_V07.90.00" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_V08.30.06_V07.90.00" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsA" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsB" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsC" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SEQ_V08.30.06_V08.00.00" cdc="SEQ">
			<SDO name="c1" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="c2" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="c3" type="SIPROTEC5_DOType_CMV_without_convertions_V08.30.06_V08.00.00" />
			<DA fc="MX" name="seqT" bType="Enum" type="SIPROTEC5_Textlist_SEQtype_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABCRes_mag_V08.30.06_V08.00.00" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="res" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" cdc="CMV">
			<DA fc="MX" name="instCVal" bType="Struct" type="SIPROTEC5_DAType_Vector_mag_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="MX" name="cVal" bType="Struct" type="SIPROTEC5_DAType_Vector_mag_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DEL_mag_V08.30.06_V08.00.00" cdc="DEL">
			<SDO name="phsAB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsBC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsCA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABC_mag_V08.30.06_V08.00.00" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V08.30.06_V08.00.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_MV_Float_V08.30.06_V08.00.00" cdc="MV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="MX" name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Health_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Health_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_CyberSecEvent_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_Login_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Login_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_Login_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_for_Input_with_dataNs_V08.30.06_V08.00.00" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="BOOLEAN" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_dupd_with_dataNs_V08.30.06_V07.90.00" cdc="INS">
			<DA dupd="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_ErrOffset_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_ErrOffset_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_ErrComp_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_ErrComp_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_ErrMeasT_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_ErrMeasT_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_DateFormat_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_DateFormat_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_INT32_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="sVC" bType="Struct" type="SIPROTEC5_DAType_ScaledValueConfig_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_readOnly_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_TmZnTmSrc_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_TmZnTmSrc_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_TmSrcCh_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_TmSrcCh_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Ports_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Ports_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_TmSrcStd_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_TmSrcStd_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="Set" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPG_edit_with_dataNs_V08.30.06_V07.90.00" cdc="SPG">
			<DA fc="SE" name="setVal" bType="BOOLEAN" valKind="Set" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_VSG_ASCII_edit_with_dataNs_V08.30.06_V07.90.00" cdc="VSG">
			<DA fc="SE" name="setVal" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_SwitchingAuthority_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" type="SIPROTEC5_Textlist_SpecificSwitchingAuthorityLevel_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_ResCmpFmt_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_ResCmpFmt_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_enh_sec_initVal_and_dataNs_V08.30.06_V07.90.00" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_enh_sec_V08.30.06_V07.90.00">
				<Val>direct-with-enhanced-security</Val>
			</DA>
			<DA dchg="true" fc="CF" name="operTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_SwitchingMode_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_SwitchingMode_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_SwitchingAuthority_LocalDigsiStationRemote_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_EnType_SwitchingAuthority_LocalDigsiStationRemote_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_OpModeRBRF_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_OpModeRBRF_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_ResetTrip_edit_and_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_ResetTrip_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_3pol_with_dataNs_V08.30.06_V07.90.00" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ComProxy_DPC_V08.30.06_V07.90.00" cdc="DPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Dbpos" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="ST" name="stSeld" bType="BOOLEAN" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V08.30.06_V07.90.00">
				<Val>status-only</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Always_WithTrip_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Always_WithTrip_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_with_units_with_dataNs_V08.30.06_V08.00.00" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_MV_Float_dupd_with_dataNs_V08.30.06_V08.00.00" cdc="MV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA dupd="true" fc="MX" name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_BCR_with_dataNs_V08.30.06_V08.00.00" cdc="BCR">
			<DA dchg="true" fc="ST" name="actVal" bType="INT64" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="pulsQty" bType="FLOAT32" valKind="RO">
				<Val>1</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INC_controllable_with_dataNs_V08.30.06_V07.90.00" cdc="INC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_INT32_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_APC_FLOAT32_controllable_with_dataNs_V08.30.06_V08.00.00" cdc="APC">
			<DA fc="MX" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<DA fc="MX" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="MX" name="mxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="MX" name="stSeld" bType="BOOLEAN" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA dchg="true" fc="CF" name="sboTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="sboClass" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_sboClass_V08.30.06_V07.90.00">
				<Val>operate-once</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
			<DA fc="CO" name="SBO" bType="VisString129">
				<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
			</DA>
			<DA fc="CO" name="SBOw" bType="Struct" type="SIPROTEC5_DAType_Oper_Analog_V08.30.06_V07.90.00" />
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Analog_V08.30.06_V07.90.00" />
			<DA fc="CO" name="Cancel" bType="Struct" type="SIPROTEC5_DAType_Cancel_Analog_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_div_edit_with_dataNs_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="Set" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_No_Yes_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_No_Yes_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_No_Yes_Advanced_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_No_Yes_Advanced_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TextList_CBT_TstCnc_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_CBT_TstCnc_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TextList_CBT_TstCls_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_CBT_TstCls_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TextList_CBT_TstTr_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_CBT_TstTr_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TextList_CBT_TstExec_with_dataNs_V08.30.06_V07.90.00" cdc="ENS">
			<DA dupd="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_CBT_TstExec_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_CMV_with_dataNs_V08.30.06_V08.00.00" cdc="CMV">
			<DA fc="MX" name="instCVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="MX" name="cVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAng" bType="INT32U" valKind="Set">
				<Val>333</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAngRef" bType="FLOAT32" valKind="RO">
				<Val>360</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_ClcMth_readOnly_with_dataNs_V08.30.06_V08.00.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ClcMth_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>IEC 61850-7-4:2007B</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_PhsSeq_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_PhaseSequence_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_ActiveInactive_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_ActiveInactive_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_readOnly_with_dataNs_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="RO" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AInternTyp_with_dataNs_V08.30.06_V08.01.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_AInternTyp_V08.30.06_V08.01.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AMeasRange_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_AMeasRange_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_ArtgSec_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_ArtgSec_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_CTConnect_with_dataNs_V08.30.06_V08.30.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_CTConnect_V08.30.06_V08.30.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_InvertedPh_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_InvertedPh_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_BlkMod_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_BlkMod_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Mode_edit_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Mode_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_for_SIEMENS_LN_V08.30.06_V08.00.00" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="lnNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_div_edit_V08.30.06_V08.00.00" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="Set" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Mode_On_Test_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Behavior_Test_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_with_dataNs_V08.30.06_V07.90.00" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_CalcVNChannel_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_CalcVNChannel_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_CalcINChannel_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_CalcINChannel_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_SmpRate_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_SmpRate_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_RcdStore_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_RcdStore_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_RcdStart_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_RcdStart_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_PQ_Sign_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_PQ_Sign_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_System_Neutralpoint_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_System_Neutralpoint_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_internal_with_dataNs_V08.30.06_V08.00.00" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_MeasMethod_with_dataNs_V08.30.06_V07.90.00" cdc="ENG">
			<DA dchg="true" fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_FundComp_TrRMS_V08.30.06_V07.90.00" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_TypRsCrv_V08.30.06_V07.90.00" cdc="ENG">
			<DA dchg="true" fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_None_InverseReset_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CURVE_TextList_TmACrv_Standard_V08.30.06_V07.90.00" cdc="CURVE">
			<DA fc="SE" name="setCharact" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_TmACrv_Standard_V08.30.06_V07.90.00" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_MV_Float_with_dataNs_V08.30.06_V08.00.00" cdc="MV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA dchg="true" fc="MX" name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ComProxy_ACT_V08.30.06_V07.90.00" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="neut" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DAType id="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00">
			<BDA name="orCat" bType="Enum" type="SIPROTEC5_Textlist_orCategory_V08.30.06_V07.90.00" />
			<BDA name="orIdent" bType="Octet64" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Boolean_V08.30.06_V07.90.00">
			<BDA name="ctlVal" bType="BOOLEAN" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Mod_OnBlockedTestTestBlocked_V08.30.06_V08.30.00">
			<BDA name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V08.30.06_V08.30.00" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Units_1_V08.30.06_V08.00.00">
			<BDA name="SIUnit" bType="Enum" valKind="RO" type="SIPROTEC5_EnType_SIUnit_V08.30.06_V08.00.00" />
			<BDA name="multiplier" bType="Enum" valKind="RO" type="SIPROTEC5_EnType_Multiplier_V08.30.06_V07.90.00" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_CalendarTime_V08.30.06_V07.90.00">
			<BDA name="occ" bType="INT16U" />
			<BDA name="occType" bType="Enum" type="SIPROTEC5_EnType_Cal_Occ_Type_V08.30.06_V07.90.00" />
			<BDA name="occPer" bType="Enum" type="SIPROTEC5_EnType_Cal_Occ_Period_V08.30.06_V07.90.00" />
			<BDA name="weekDay" bType="Enum" type="SIPROTEC5_EnType_Cal_WeekDay_V08.30.06_V07.90.00" />
			<BDA name="month" bType="Enum" type="SIPROTEC5_EnType_Cal_Month_V08.30.06_V07.90.00" />
			<BDA name="day" bType="INT8U" />
			<BDA name="hr" bType="INT8U" />
			<BDA name="mn" bType="INT8U" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_PulseConfig_XCBR_V08.30.06_V07.90.00">
			<BDA name="cmdQual" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_PulseConfigCmdQual_V08.30.06_V07.90.00" />
			<BDA name="onDur" bType="INT32U" valKind="RO" />
			<BDA name="offDur" bType="INT32U" valKind="RO" />
			<BDA name="numPls" bType="INT32U" valKind="RO" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Mod_V08.30.06_V08.30.00">
			<BDA name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V08.30.06_V08.30.00" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Cancel_Boolean_V08.30.06_V07.90.00">
			<BDA name="ctlVal" bType="BOOLEAN" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Vector_V08.30.06_V07.90.00">
			<BDA name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<BDA name="ang" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00">
			<BDA name="f" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V08.30.06_V07.90.00">
			<BDA name="f" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_INT32_V08.30.06_V07.90.00">
			<BDA name="i" bType="INT32" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_ScaledValueConfig_readOnly_VisAsProperty_V08.30.06_V08.00.00">
			<BDA name="scaleFactor" bType="FLOAT32" valKind="Set">
				<Val>1</Val>
			</BDA>
			<BDA name="offset" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Vector_mag_V08.30.06_V07.90.00">
			<BDA name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_ScaledValueConfig_readOnly_V08.30.06_V07.90.00">
			<BDA name="scaleFactor" bType="FLOAT32" valKind="RO">
				<Val>1</Val>
			</BDA>
			<BDA name="offset" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_INT32_readOnly_V08.30.06_V07.90.00">
			<BDA name="i" bType="INT32" valKind="RO" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_INT32_V08.30.06_V07.90.00">
			<BDA name="ctlVal" bType="INT32" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Analog_V08.30.06_V07.90.00">
			<BDA name="ctlVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Cancel_Analog_V08.30.06_V07.90.00">
			<BDA name="ctlVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V08.30.06_V07.90.00" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V08.30.06_V07.90.00" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<EnumType id="SIPROTEC5_Textlist_orCategory_V08.30.06_V07.90.00">
			<EnumVal ord="0">not-supported</EnumVal>
			<EnumVal ord="1">bay-control</EnumVal>
			<EnumVal ord="2">station-control</EnumVal>
			<EnumVal ord="3">remote-control</EnumVal>
			<EnumVal ord="4">automatic-bay</EnumVal>
			<EnumVal ord="5">automatic-station</EnumVal>
			<EnumVal ord="6">automatic-remote</EnumVal>
			<EnumVal ord="7">maintenance</EnumVal>
			<EnumVal ord="8">process</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V08.30.06_V07.90.00">
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Health_V08.30.06_V07.90.00">
			<EnumVal ord="1">Ok</EnumVal>
			<EnumVal ord="2">Warning</EnumVal>
			<EnumVal ord="3">Alarm</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_V08.30.06_V08.30.00">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="2">blocked</EnumVal>
			<EnumVal ord="3">test</EnumVal>
			<EnumVal ord="4">test/blocked</EnumVal>
			<EnumVal ord="5">off</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V08.30.06_V08.30.00">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="2">blocked</EnumVal>
			<EnumVal ord="3">test</EnumVal>
			<EnumVal ord="4">test/blocked</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_SIUnit_V08.30.06_V08.00.00">
			<EnumVal ord="-38">kV/mA</EnumVal>
			<EnumVal ord="-37">kA/V</EnumVal>
			<EnumVal ord="-36">ohm/m</EnumVal>
			<EnumVal ord="-35">ppm/°C</EnumVal>
			<EnumVal ord="-34">F/m</EnumVal>
			<EnumVal ord="-33">H/m</EnumVal>
			<EnumVal ord="-32">ms/kPa</EnumVal>
			<EnumVal ord="-31">kPa</EnumVal>
			<EnumVal ord="-30">ms/V</EnumVal>
			<EnumVal ord="-29">ms/K</EnumVal>
			<EnumVal ord="-28">V/s</EnumVal>
			<EnumVal ord="-27">I/Ir*s</EnumVal>
			<EnumVal ord="-26">1/week</EnumVal>
			<EnumVal ord="-25">1/d</EnumVal>
			<EnumVal ord="-24">1/h</EnumVal>
			<EnumVal ord="-23">1/min</EnumVal>
			<EnumVal ord="-22">periods</EnumVal>
			<EnumVal ord="-21">GB</EnumVal>
			<EnumVal ord="-19">cycle</EnumVal>
			<EnumVal ord="-18">mile</EnumVal>
			<EnumVal ord="-17">inch</EnumVal>
			<EnumVal ord="-16">°F</EnumVal>
			<EnumVal ord="-15">I/IrObj</EnumVal>
			<EnumVal ord="-14">MB</EnumVal>
			<EnumVal ord="-13">KB</EnumVal>
			<EnumVal ord="-12">Bytes</EnumVal>
			<EnumVal ord="-11">p.u.</EnumVal>
			<EnumVal ord="-10">day(s)</EnumVal>
			<EnumVal ord="-7">%</EnumVal>
			<EnumVal ord="-4">F/mi</EnumVal>
			<EnumVal ord="-3">ohm/mi</EnumVal>
			<EnumVal ord="-2">F/km</EnumVal>
			<EnumVal ord="-1">ohm/km</EnumVal>
			<EnumVal ord="1" />
			<EnumVal ord="2">m</EnumVal>
			<EnumVal ord="3">kg</EnumVal>
			<EnumVal ord="4">s</EnumVal>
			<EnumVal ord="5">A</EnumVal>
			<EnumVal ord="6">K</EnumVal>
			<EnumVal ord="7">mol</EnumVal>
			<EnumVal ord="8">cd</EnumVal>
			<EnumVal ord="9">deg</EnumVal>
			<EnumVal ord="10">rad</EnumVal>
			<EnumVal ord="11">sr</EnumVal>
			<EnumVal ord="21">Gy</EnumVal>
			<EnumVal ord="23">°C</EnumVal>
			<EnumVal ord="24">Sv</EnumVal>
			<EnumVal ord="25">F</EnumVal>
			<EnumVal ord="26">C</EnumVal>
			<EnumVal ord="27">S</EnumVal>
			<EnumVal ord="28">H</EnumVal>
			<EnumVal ord="29">V</EnumVal>
			<EnumVal ord="30">ohm</EnumVal>
			<EnumVal ord="31">J</EnumVal>
			<EnumVal ord="32">N</EnumVal>
			<EnumVal ord="33">Hz</EnumVal>
			<EnumVal ord="34">lx</EnumVal>
			<EnumVal ord="35">Lm</EnumVal>
			<EnumVal ord="36">Wb</EnumVal>
			<EnumVal ord="37">T</EnumVal>
			<EnumVal ord="38">W</EnumVal>
			<EnumVal ord="39">Pa</EnumVal>
			<EnumVal ord="41">m²</EnumVal>
			<EnumVal ord="42">m³</EnumVal>
			<EnumVal ord="43">m/s</EnumVal>
			<EnumVal ord="44">m/s²</EnumVal>
			<EnumVal ord="45">m³/s</EnumVal>
			<EnumVal ord="46">m/m³</EnumVal>
			<EnumVal ord="47">M</EnumVal>
			<EnumVal ord="48">kg/m³</EnumVal>
			<EnumVal ord="49">m²/s</EnumVal>
			<EnumVal ord="50">W/m K</EnumVal>
			<EnumVal ord="51">J/K</EnumVal>
			<EnumVal ord="52">ppm</EnumVal>
			<EnumVal ord="53">1/s</EnumVal>
			<EnumVal ord="54">rad/s</EnumVal>
			<EnumVal ord="55">W/m²</EnumVal>
			<EnumVal ord="56">J/m²</EnumVal>
			<EnumVal ord="57">S/m</EnumVal>
			<EnumVal ord="58">K/s</EnumVal>
			<EnumVal ord="59">Pa/s</EnumVal>
			<EnumVal ord="60">J/kg K</EnumVal>
			<EnumVal ord="61">VA</EnumVal>
			<EnumVal ord="63">VAr</EnumVal>
			<EnumVal ord="64">phi</EnumVal>
			<EnumVal ord="65">cos(phi)</EnumVal>
			<EnumVal ord="66">Vs</EnumVal>
			<EnumVal ord="67">V²</EnumVal>
			<EnumVal ord="68">As</EnumVal>
			<EnumVal ord="69">A²</EnumVal>
			<EnumVal ord="70">A²t</EnumVal>
			<EnumVal ord="71">VAh</EnumVal>
			<EnumVal ord="72">Wh</EnumVal>
			<EnumVal ord="73">VArh</EnumVal>
			<EnumVal ord="74">V/Hz</EnumVal>
			<EnumVal ord="75">Hz/s</EnumVal>
			<EnumVal ord="76">char</EnumVal>
			<EnumVal ord="77">char/s</EnumVal>
			<EnumVal ord="78">kgm²</EnumVal>
			<EnumVal ord="79">dB</EnumVal>
			<EnumVal ord="80">J/Wh</EnumVal>
			<EnumVal ord="81">W/s</EnumVal>
			<EnumVal ord="82">l/s</EnumVal>
			<EnumVal ord="83">dBm</EnumVal>
			<EnumVal ord="84">h</EnumVal>
			<EnumVal ord="85">min</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Multiplier_V08.30.06_V07.90.00">
			<EnumVal ord="-24">y</EnumVal>
			<EnumVal ord="-21">z</EnumVal>
			<EnumVal ord="-18">a</EnumVal>
			<EnumVal ord="-15">f</EnumVal>
			<EnumVal ord="-12">p</EnumVal>
			<EnumVal ord="-9">n</EnumVal>
			<EnumVal ord="-6">µ</EnumVal>
			<EnumVal ord="-3">m</EnumVal>
			<EnumVal ord="-2">c</EnumVal>
			<EnumVal ord="-1">d</EnumVal>
			<EnumVal ord="0" />
			<EnumVal ord="1">da</EnumVal>
			<EnumVal ord="2">h</EnumVal>
			<EnumVal ord="3">k</EnumVal>
			<EnumVal ord="6">M</EnumVal>
			<EnumVal ord="9">G</EnumVal>
			<EnumVal ord="12">T</EnumVal>
			<EnumVal ord="15">P</EnumVal>
			<EnumVal ord="18">E</EnumVal>
			<EnumVal ord="21">Z</EnumVal>
			<EnumVal ord="24">Y</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_status_only_V08.30.06_V07.90.00">
			<EnumVal ord="0">status-only</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Occ_Type_V08.30.06_V07.90.00">
			<EnumVal ord="0">Time</EnumVal>
			<EnumVal ord="1">WeekDay</EnumVal>
			<EnumVal ord="2">WeekOfYear</EnumVal>
			<EnumVal ord="3">DayOfMonth</EnumVal>
			<EnumVal ord="4">DayOfYear</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Occ_Period_V08.30.06_V07.90.00">
			<EnumVal ord="0">Hour</EnumVal>
			<EnumVal ord="1">Day</EnumVal>
			<EnumVal ord="2">Week</EnumVal>
			<EnumVal ord="3">Month</EnumVal>
			<EnumVal ord="4">Year</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_WeekDay_V08.30.06_V07.90.00">
			<EnumVal ord="1">Monday</EnumVal>
			<EnumVal ord="2">Tuesday</EnumVal>
			<EnumVal ord="3">Wednesday</EnumVal>
			<EnumVal ord="4">Thursday</EnumVal>
			<EnumVal ord="5">Friday</EnumVal>
			<EnumVal ord="6">Saturday</EnumVal>
			<EnumVal ord="7">Sunday</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Month_V08.30.06_V07.90.00">
			<EnumVal ord="1">January</EnumVal>
			<EnumVal ord="2">February</EnumVal>
			<EnumVal ord="3">March</EnumVal>
			<EnumVal ord="4">April</EnumVal>
			<EnumVal ord="5">May</EnumVal>
			<EnumVal ord="6">June</EnumVal>
			<EnumVal ord="7">July</EnumVal>
			<EnumVal ord="8">August</EnumVal>
			<EnumVal ord="9">September</EnumVal>
			<EnumVal ord="10">October</EnumVal>
			<EnumVal ord="11">November</EnumVal>
			<EnumVal ord="12">December</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmSrcTyp_V08.30.06_V08.01.00">
			<EnumVal ord="-15">ERR</EnumVal>
			<EnumVal ord="-14">T104</EnumVal>
			<EnumVal ord="-13">T103</EnumVal>
			<EnumVal ord="-12">RTC</EnumVal>
			<EnumVal ord="-11">IEEE1588</EnumVal>
			<EnumVal ord="-10">EXTERN_SIPROTEC</EnumVal>
			<EnumVal ord="-9">MINUTE_PULS</EnumVal>
			<EnumVal ord="-8">DNP30</EnumVal>
			<EnumVal ord="-7">MODBUS</EnumVal>
			<EnumVal ord="-6">PROFIBUS</EnumVal>
			<EnumVal ord="-5">GALILEO</EnumVal>
			<EnumVal ord="-4">SYNC_BOX</EnumVal>
			<EnumVal ord="-3">DCF77</EnumVal>
			<EnumVal ord="-2">GPS</EnumVal>
			<EnumVal ord="-1">HMI</EnumVal>
			<EnumVal ord="1">Unknown</EnumVal>
			<EnumVal ord="2">SNTP</EnumVal>
			<EnumVal ord="3">PTP</EnumVal>
			<EnumVal ord="4">IRIG-B</EnumVal>
			<EnumVal ord="5">Substation internal</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ServiceType_V08.30.06_V07.90.00">
			<EnumVal ord="-3">CancelEditSG</EnumVal>
			<EnumVal ord="-2">None</EnumVal>
			<EnumVal ord="-1">Unknown</EnumVal>
			<EnumVal ord="1">Associate</EnumVal>
			<EnumVal ord="2">Abort</EnumVal>
			<EnumVal ord="3">Release</EnumVal>
			<EnumVal ord="4">GetServerDirectory</EnumVal>
			<EnumVal ord="5">GetLogicalDeviceDirectory</EnumVal>
			<EnumVal ord="6">GetAllDataValues</EnumVal>
			<EnumVal ord="7">GetDataValues</EnumVal>
			<EnumVal ord="8">SetDataValues</EnumVal>
			<EnumVal ord="9">GetDataDirectory</EnumVal>
			<EnumVal ord="10">GetDataDefinition</EnumVal>
			<EnumVal ord="11">GetDataSetValues</EnumVal>
			<EnumVal ord="12">SetDataSetValues</EnumVal>
			<EnumVal ord="13">CreateDataSet</EnumVal>
			<EnumVal ord="14">DeleteDataSet</EnumVal>
			<EnumVal ord="15">GetDataSetDirectory</EnumVal>
			<EnumVal ord="16">SelectActiveSG</EnumVal>
			<EnumVal ord="17">SelectEditSG</EnumVal>
			<EnumVal ord="18">SetEditSGValue</EnumVal>
			<EnumVal ord="19">ConfirmEditSGValues</EnumVal>
			<EnumVal ord="20">GetEditSGValue</EnumVal>
			<EnumVal ord="21">GetSGCBValues</EnumVal>
			<EnumVal ord="22">Report</EnumVal>
			<EnumVal ord="23">GetBRCBValues</EnumVal>
			<EnumVal ord="24">SetBRCBValues</EnumVal>
			<EnumVal ord="25">GetURCBValues</EnumVal>
			<EnumVal ord="26">SetURCBValues</EnumVal>
			<EnumVal ord="27">GetLCBValues</EnumVal>
			<EnumVal ord="28">SetLCBValues</EnumVal>
			<EnumVal ord="29">QueryLogByTime</EnumVal>
			<EnumVal ord="30">QueryLogAfter</EnumVal>
			<EnumVal ord="31">GetLogStatusValues</EnumVal>
			<EnumVal ord="32">SendGOOSEMessage</EnumVal>
			<EnumVal ord="33">GetGoCBValues</EnumVal>
			<EnumVal ord="34">SetGoCBValues</EnumVal>
			<EnumVal ord="35">GetGoReference</EnumVal>
			<EnumVal ord="36">GetGOOSEElementNumber</EnumVal>
			<EnumVal ord="37">SendMSVMessage</EnumVal>
			<EnumVal ord="38">GetMSVCBValues</EnumVal>
			<EnumVal ord="39">SetMSVCBValues</EnumVal>
			<EnumVal ord="40">SendUSVMessage</EnumVal>
			<EnumVal ord="41">GetUSVCBValues</EnumVal>
			<EnumVal ord="42">SetUSVCBValues</EnumVal>
			<EnumVal ord="43">Select</EnumVal>
			<EnumVal ord="44">SelectWithValue</EnumVal>
			<EnumVal ord="45">Cancel</EnumVal>
			<EnumVal ord="46">Operate</EnumVal>
			<EnumVal ord="47">CommandTermination</EnumVal>
			<EnumVal ord="48">TimeActivatedOperate</EnumVal>
			<EnumVal ord="49">GetFile</EnumVal>
			<EnumVal ord="50">SetFile</EnumVal>
			<EnumVal ord="51">DeleteFile</EnumVal>
			<EnumVal ord="52">GetFileAttributeValues</EnumVal>
			<EnumVal ord="53">TimeSynchronization</EnumVal>
			<EnumVal ord="54">InternalChange</EnumVal>
			<EnumVal ord="55">GetLogicalNodeDirectory</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ServiceError_V08.30.06_V07.90.00">
			<EnumVal ord="0">no-error</EnumVal>
			<EnumVal ord="1">instance-not-available</EnumVal>
			<EnumVal ord="2">instance-in-use</EnumVal>
			<EnumVal ord="3">access-violation</EnumVal>
			<EnumVal ord="4">access-not-allowed-in-current-state</EnumVal>
			<EnumVal ord="5">parameter-value-inappropriate</EnumVal>
			<EnumVal ord="6">parameter-value-inconsistent</EnumVal>
			<EnumVal ord="7">class-not-supported</EnumVal>
			<EnumVal ord="8">instance-locked-by-other-client</EnumVal>
			<EnumVal ord="9">control-must-be-selected</EnumVal>
			<EnumVal ord="10">type-conflict</EnumVal>
			<EnumVal ord="11">failed-due-to-communications-constraint</EnumVal>
			<EnumVal ord="12">failed-due-to-server-constraint</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_DirectionGeneral_V08.30.06_V07.90.00">
			<EnumVal ord="0">unknown</EnumVal>
			<EnumVal ord="1">forward</EnumVal>
			<EnumVal ord="2">backward</EnumVal>
			<EnumVal ord="3">both</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_DirectionPhase_V08.30.06_V07.90.00">
			<EnumVal ord="0">unknown</EnumVal>
			<EnumVal ord="1">forward</EnumVal>
			<EnumVal ord="2">backward</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_PulseConfigCmdQual_V08.30.06_V07.90.00">
			<EnumVal ord="0">pulse</EnumVal>
			<EnumVal ord="1">persistent</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V08.30.06_V07.90.00">
			<EnumVal ord="0">status-only</EnumVal>
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_V08.30.06_V07.90.00">
			<EnumVal ord="0">status-only</EnumVal>
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
			<EnumVal ord="2">sbo-with-normal-security</EnumVal>
			<EnumVal ord="3">direct-with-enhanced-security</EnumVal>
			<EnumVal ord="4">sbo-with-enhanced-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_SwitchType_V08.30.06_V07.90.00">
			<EnumVal ord="1">Load Break</EnumVal>
			<EnumVal ord="2">Disconnector</EnumVal>
			<EnumVal ord="3">Earthing Switch</EnumVal>
			<EnumVal ord="4">High Speed Earthing Switch</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_InstrumentTransformerProtectionRatingKind_V08.30.06_V08.00.00">
			<EnumVal ord="1">1</EnumVal>
			<EnumVal ord="2">3</EnumVal>
			<EnumVal ord="3">5</EnumVal>
			<EnumVal ord="4">6</EnumVal>
			<EnumVal ord="5">10</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_InstrumentTransformerMeasurementRatingKind_V08.30.06_V08.00.00">
			<EnumVal ord="1">0.05</EnumVal>
			<EnumVal ord="2">0.1</EnumVal>
			<EnumVal ord="3">0.2</EnumVal>
			<EnumVal ord="4">0.2S</EnumVal>
			<EnumVal ord="5">0.5</EnumVal>
			<EnumVal ord="6">0.5S</EnumVal>
			<EnumVal ord="7">1</EnumVal>
			<EnumVal ord="8">3</EnumVal>
			<EnumVal ord="9">5</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Trp_V08.30.06_V08.00.00">
			<EnumVal ord="1">Unknown</EnumVal>
			<EnumVal ord="2">P</EnumVal>
			<EnumVal ord="3">PR</EnumVal>
			<EnumVal ord="4">PX</EnumVal>
			<EnumVal ord="5">PXR</EnumVal>
			<EnumVal ord="6">TPX</EnumVal>
			<EnumVal ord="7">TPY</EnumVal>
			<EnumVal ord="8">TPZ</EnumVal>
			<EnumVal ord="9">TPE</EnumVal>
			<EnumVal ord="10">TPS</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_dir_with_enh_sec_V08.30.06_V07.90.00">
			<EnumVal ord="3">direct-with-enhanced-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_SEQtype_V08.30.06_V07.90.00">
			<EnumVal ord="0">pos-neg-zero</EnumVal>
			<EnumVal ord="1">dir-quad-zero</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Login_V08.30.06_V07.90.00">
			<EnumVal ord="0">invalid</EnumVal>
			<EnumVal ord="1">logon blocked</EnumVal>
			<EnumVal ord="2">logon reactivated</EnumVal>
			<EnumVal ord="3">PW change OK</EnumVal>
			<EnumVal ord="4">PW change failed</EnumVal>
			<EnumVal ord="5">logon OK</EnumVal>
			<EnumVal ord="6">logon failed</EnumVal>
			<EnumVal ord="7">activation of connection PW OK</EnumVal>
			<EnumVal ord="8">activation of connection PW failed</EnumVal>
			<EnumVal ord="9">deactivation of connection PW OK</EnumVal>
			<EnumVal ord="10">deactivation of connection PW failed</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_ErrOffset_V08.30.06_V07.90.00">
			<EnumVal ord="1">Offset error at board 1 on</EnumVal>
			<EnumVal ord="2">Offset error at board 2 on</EnumVal>
			<EnumVal ord="3">Offset error at board 3 on</EnumVal>
			<EnumVal ord="4">Offset error at board 4 on</EnumVal>
			<EnumVal ord="5">Offset error at board 5 on</EnumVal>
			<EnumVal ord="6">Offset error at board 6 on</EnumVal>
			<EnumVal ord="7">Offset error at board 7 on</EnumVal>
			<EnumVal ord="8">Offset error at board 8 on</EnumVal>
			<EnumVal ord="9">Offset error at board 9 on</EnumVal>
			<EnumVal ord="10">Offset error at board 10 on</EnumVal>
			<EnumVal ord="11">Offset error at board 11 on</EnumVal>
			<EnumVal ord="12">Offset error at board 12 on</EnumVal>
			<EnumVal ord="13">Offset error at board 1 off</EnumVal>
			<EnumVal ord="14">Offset error at board 2 off</EnumVal>
			<EnumVal ord="15">Offset error at board 3 off</EnumVal>
			<EnumVal ord="16">Offset error at board 4 off</EnumVal>
			<EnumVal ord="17">Offset error at board 5 off</EnumVal>
			<EnumVal ord="18">Offset error at board 6 off</EnumVal>
			<EnumVal ord="19">Offset error at board 7 off</EnumVal>
			<EnumVal ord="20">Offset error at board 8 off</EnumVal>
			<EnumVal ord="21">Offset error at board 9 off</EnumVal>
			<EnumVal ord="22">Offset error at board 10 off</EnumVal>
			<EnumVal ord="23">Offset error at board 11 off</EnumVal>
			<EnumVal ord="24">Offset error at board 12 off</EnumVal>
			<EnumVal ord="25">No offset error</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_ErrComp_V08.30.06_V07.90.00">
			<EnumVal ord="1">Comp. err. Brd1/Term1</EnumVal>
			<EnumVal ord="2">Comp. err. Brd1/Term2</EnumVal>
			<EnumVal ord="3">Comp. err. Brd2/Term1</EnumVal>
			<EnumVal ord="4">Comp. err. Brd2/Term2</EnumVal>
			<EnumVal ord="5">Comp. err. Brd3/Term1</EnumVal>
			<EnumVal ord="6">Comp. err. Brd3/Term2</EnumVal>
			<EnumVal ord="7">Comp. err. Brd4/Term1</EnumVal>
			<EnumVal ord="8">Comp. err. Brd4/Term2</EnumVal>
			<EnumVal ord="9">Comp. err. Brd5/Term1</EnumVal>
			<EnumVal ord="10">Comp. err. Brd5/Term2</EnumVal>
			<EnumVal ord="11">Comp. err. Brd6/Term1</EnumVal>
			<EnumVal ord="12">Comp. err. Brd6/Term2</EnumVal>
			<EnumVal ord="13">Comp. err. Brd7/Term1</EnumVal>
			<EnumVal ord="14">Comp. err. Brd7/Term2</EnumVal>
			<EnumVal ord="15">Comp. err. Brd8/Term1</EnumVal>
			<EnumVal ord="16">Comp. err. Brd8/Term2</EnumVal>
			<EnumVal ord="17">Comp. err. Brd9/Term1</EnumVal>
			<EnumVal ord="18">Comp. err. Brd9/Term2</EnumVal>
			<EnumVal ord="19">Comp. err. Brd10/Term1</EnumVal>
			<EnumVal ord="20">Comp. err. Brd10/Term2</EnumVal>
			<EnumVal ord="21">Comp. err. Brd11/Term1</EnumVal>
			<EnumVal ord="22">Comp. err. Brd11/Term2</EnumVal>
			<EnumVal ord="23">Comp. err. Brd12/Term1</EnumVal>
			<EnumVal ord="24">Comp. err. Brd12/Term2</EnumVal>
			<EnumVal ord="25">Comp. err. Brd1</EnumVal>
			<EnumVal ord="26">Comp. err. Brd2</EnumVal>
			<EnumVal ord="27">Comp. err. Brd3</EnumVal>
			<EnumVal ord="28">Comp. err. Brd4</EnumVal>
			<EnumVal ord="29">Comp. err. Brd5</EnumVal>
			<EnumVal ord="30">Comp. err. Brd6</EnumVal>
			<EnumVal ord="31">Comp. err. Brd7</EnumVal>
			<EnumVal ord="32">Comp. err. Brd8</EnumVal>
			<EnumVal ord="33">Comp. err. Brd9</EnumVal>
			<EnumVal ord="34">Comp. err. Brd10</EnumVal>
			<EnumVal ord="35">Comp. err. Brd11</EnumVal>
			<EnumVal ord="36">Comp. err. Brd12</EnumVal>
			<EnumVal ord="37">Compensation err. free.</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_ErrMeasT_V08.30.06_V07.90.00">
			<EnumVal ord="1">Error Meas. Trans. 1</EnumVal>
			<EnumVal ord="2">Error Meas. Trans. 2</EnumVal>
			<EnumVal ord="3">Error Meas. Trans. 3</EnumVal>
			<EnumVal ord="4">Error Meas. Trans. 4</EnumVal>
			<EnumVal ord="5">Error Meas. Trans. 5</EnumVal>
			<EnumVal ord="6">Meas. Transd. 1..5 no error</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_DateFormat_V08.30.06_V07.90.00">
			<EnumVal ord="0">DD.MM.YYYY</EnumVal>
			<EnumVal ord="1">MM/DD/YYYY</EnumVal>
			<EnumVal ord="2">YYYY-MM-DD</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmZnTmSrc_V08.30.06_V07.90.00">
			<EnumVal ord="0">UTC</EnumVal>
			<EnumVal ord="1">local</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmSrcCh_V08.30.06_V07.90.00">
			<EnumVal ord="0">NotUsed</EnumVal>
			<EnumVal ord="1">Ch1</EnumVal>
			<EnumVal ord="2">Ch2</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Ports_V08.30.06_V07.90.00">
			<EnumVal ord="0">PortJ</EnumVal>
			<EnumVal ord="1">PortF</EnumVal>
			<EnumVal ord="2">PortE</EnumVal>
			<EnumVal ord="3">PortP</EnumVal>
			<EnumVal ord="4">PortN</EnumVal>
			<EnumVal ord="5">PortG</EnumVal>
			<EnumVal ord="6">NotUsed</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmSrcStd_V08.30.06_V07.90.00">
			<EnumVal ord="0">none</EnumVal>
			<EnumVal ord="1">PPM</EnumVal>
			<EnumVal ord="2">IRIGB</EnumVal>
			<EnumVal ord="3">DCF77</EnumVal>
			<EnumVal ord="4">Syncbox</EnumVal>
			<EnumVal ord="5">PI</EnumVal>
			<EnumVal ord="6">SNTP</EnumVal>
			<EnumVal ord="7">T103</EnumVal>
			<EnumVal ord="8">Profibus</EnumVal>
			<EnumVal ord="9">Modbus</EnumVal>
			<EnumVal ord="10">DNP3</EnumVal>
			<EnumVal ord="11">IEEE1588</EnumVal>
			<EnumVal ord="12">T104</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_SpecificSwitchingAuthorityLevel_V08.30.06_V07.90.00">
			<EnumVal ord="3">station</EnumVal>
			<EnumVal ord="4">station/remote</EnumVal>
			<EnumVal ord="5">remote</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ResCmpFmt_V08.30.06_V07.90.00">
			<EnumVal ord="0">RERL_XEXL</EnumVal>
			<EnumVal ord="1">K0</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_SwitchingMode_V08.30.06_V07.90.00">
			<EnumVal ord="0">not relevant</EnumVal>
			<EnumVal ord="1">interlocked</EnumVal>
			<EnumVal ord="2">non-interlocked</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_SwitchingAuthority_LocalDigsiStationRemote_V08.30.06_V07.90.00">
			<EnumVal ord="0">local</EnumVal>
			<EnumVal ord="1">DIGSI</EnumVal>
			<EnumVal ord="2">local/station</EnumVal>
			<EnumVal ord="3">station</EnumVal>
			<EnumVal ord="4">station/remote</EnumVal>
			<EnumVal ord="5">remote</EnumVal>
			<EnumVal ord="6">local/station/remote</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_OpModeRBRF_V08.30.06_V07.90.00">
			<EnumVal ord="1">unbalancing</EnumVal>
			<EnumVal ord="2">I&gt; query</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ResetTrip_V08.30.06_V07.90.00">
			<EnumVal ord="0">accelarated</EnumVal>
			<EnumVal ord="1">safe</EnumVal>
			<EnumVal ord="2">directly</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Always_WithTrip_V08.30.06_V07.90.00">
			<EnumVal ord="0">with trip</EnumVal>
			<EnumVal ord="1">always</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_sboClass_V08.30.06_V07.90.00">
			<EnumVal ord="0">operate-once</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_No_Yes_V08.30.06_V07.90.00">
			<EnumVal ord="0">no</EnumVal>
			<EnumVal ord="1">yes</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_No_Yes_Advanced_V08.30.06_V07.90.00">
			<EnumVal ord="0">no</EnumVal>
			<EnumVal ord="1">yes</EnumVal>
			<EnumVal ord="2">Advanced</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CBT_TstCnc_V08.30.06_V07.90.00">
			<EnumVal ord="0">Inactive</EnumVal>
			<EnumVal ord="1">Fault occurred</EnumVal>
			<EnumVal ord="2">CB not closed</EnumVal>
			<EnumVal ord="3">CB not ready</EnumVal>
			<EnumVal ord="4">CB stayed closed</EnumVal>
			<EnumVal ord="5">Command</EnumVal>
			<EnumVal ord="6">Current crit.</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CBT_TstCls_V08.30.06_V07.90.00">
			<EnumVal ord="0">Inactive</EnumVal>
			<EnumVal ord="1">3-pole</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CBT_TstTr_V08.30.06_V07.90.00">
			<EnumVal ord="0">Inactive</EnumVal>
			<EnumVal ord="1">1-pole phsA</EnumVal>
			<EnumVal ord="2">1-pole phsB</EnumVal>
			<EnumVal ord="3">1-pole phsC</EnumVal>
			<EnumVal ord="4">3-pole</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CBT_TstExec_V08.30.06_V07.90.00">
			<EnumVal ord="0">Inactive</EnumVal>
			<EnumVal ord="1">Started</EnumVal>
			<EnumVal ord="2">Failed</EnumVal>
			<EnumVal ord="3">Successful</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ClcMth_V08.30.06_V07.90.00">
			<EnumVal ord="1">UNSPECIFIED</EnumVal>
			<EnumVal ord="2">TRUE_RMS</EnumVal>
			<EnumVal ord="3">PEAK_FUNDAMENTAL</EnumVal>
			<EnumVal ord="4">RMS_FUNDAMENTAL</EnumVal>
			<EnumVal ord="5">MIN</EnumVal>
			<EnumVal ord="6">MAX</EnumVal>
			<EnumVal ord="7">AVG</EnumVal>
			<EnumVal ord="8">SDV</EnumVal>
			<EnumVal ord="9">PREDICTION</EnumVal>
			<EnumVal ord="10">RATE</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_PhaseSequence_V08.30.06_V07.90.00">
			<EnumVal ord="0">ABC</EnumVal>
			<EnumVal ord="1">ACB</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ActiveInactive_V08.30.06_V07.90.00">
			<EnumVal ord="0">inactive</EnumVal>
			<EnumVal ord="1">active</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_AInternTyp_V08.30.06_V08.01.00">
			<EnumVal ord="0">CT Protection</EnumVal>
			<EnumVal ord="1">CT Measurement</EnumVal>
			<EnumVal ord="2">CT Protection Light</EnumVal>
			<EnumVal ord="3">CT Measurement Light</EnumVal>
			<EnumVal ord="4">CT Processbus</EnumVal>
			<EnumVal ord="5">CT PBClient BD</EnumVal>
			<EnumVal ord="6">CT LPCT Protection</EnumVal>
			<EnumVal ord="7">CT LPCT Measurement</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_AMeasRange_V08.30.06_V07.90.00">
			<EnumVal ord="1">1.6 x IR</EnumVal>
			<EnumVal ord="2">8 x IR</EnumVal>
			<EnumVal ord="3">20 x IR</EnumVal>
			<EnumVal ord="4">100 x IR</EnumVal>
			<EnumVal ord="5">50 x IR</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ArtgSec_V08.30.06_V07.90.00">
			<EnumVal ord="1">1A</EnumVal>
			<EnumVal ord="5">5A</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CTConnect_V08.30.06_V08.30.00">
			<EnumVal ord="0">not assigned</EnumVal>
			<EnumVal ord="1">3-phase + IN</EnumVal>
			<EnumVal ord="2">3-phase</EnumVal>
			<EnumVal ord="3">3-phase + IN-separate</EnumVal>
			<EnumVal ord="5">3-phase, 2 primary CT</EnumVal>
			<EnumVal ord="6">3ph,2prim.CT + IN-sep</EnumVal>
			<EnumVal ord="8">2ph, 2p. CT + IN-sep</EnumVal>
			<EnumVal ord="11">2-phase + IN</EnumVal>
			<EnumVal ord="12">2-phase</EnumVal>
			<EnumVal ord="13">2ph,2p.CT + 2IN-sep</EnumVal>
			<EnumVal ord="15">I Overhead</EnumVal>
			<EnumVal ord="16">I pF, I nF</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_InvertedPh_V08.30.06_V07.90.00">
			<EnumVal ord="0">None</EnumVal>
			<EnumVal ord="1">A-C</EnumVal>
			<EnumVal ord="2">B-C</EnumVal>
			<EnumVal ord="3">A-B</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_BlkMod_V08.30.06_V07.90.00">
			<EnumVal ord="0">Blocking</EnumVal>
			<EnumVal ord="1">Auto blocking</EnumVal>
			<EnumVal ord="2">Not blocking</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Mode_V08.30.06_V07.90.00">
			<EnumVal ord="5">Off</EnumVal>
			<EnumVal ord="1">On</EnumVal>
			<EnumVal ord="3">Test</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_Test_V08.30.06_V07.90.00">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="3">test</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CalcVNChannel_V08.30.06_V07.90.00">
			<EnumVal ord="0">No</EnumVal>
			<EnumVal ord="1">V0</EnumVal>
			<EnumVal ord="2">3V0</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_CalcINChannel_V08.30.06_V07.90.00">
			<EnumVal ord="0">No</EnumVal>
			<EnumVal ord="1">-3I0</EnumVal>
			<EnumVal ord="2">3I0</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_SmpRate_V08.30.06_V07.90.00">
			<EnumVal ord="0">8 kHz</EnumVal>
			<EnumVal ord="1">4 kHz</EnumVal>
			<EnumVal ord="2">2 kHz</EnumVal>
			<EnumVal ord="3">1 kHz</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_RcdStore_V08.30.06_V07.90.00">
			<EnumVal ord="0">Store without release</EnumVal>
			<EnumVal ord="1">Store with trip</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_RcdStart_V08.30.06_V07.90.00">
			<EnumVal ord="0">Start with pickup</EnumVal>
			<EnumVal ord="1">Start with pickup and AR</EnumVal>
			<EnumVal ord="2">Start with flexible signal</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_PQ_Sign_V08.30.06_V07.90.00">
			<EnumVal ord="0">not reversed</EnumVal>
			<EnumVal ord="1">reversed</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_System_Neutralpoint_V08.30.06_V07.90.00">
			<EnumVal ord="0">grounded</EnumVal>
			<EnumVal ord="1">ptcoil</EnumVal>
			<EnumVal ord="2">isolated</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_FundComp_TrRMS_V08.30.06_V07.90.00">
			<EnumVal ord="0">Fundcomp</EnumVal>
			<EnumVal ord="1">TrueRMS</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_None_InverseReset_V08.30.06_V07.90.00">
			<EnumVal ord="1">None</EnumVal>
			<EnumVal ord="3">Inverse Reset</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmACrv_Standard_V08.30.06_V07.90.00">
			<EnumVal ord="-2">ANSI Long-Time Inverse</EnumVal>
			<EnumVal ord="-1">ANSI Short-Time Inverse</EnumVal>
			<EnumVal ord="1">ANSI Extremely Inverse</EnumVal>
			<EnumVal ord="2">ANSI Very Inverse</EnumVal>
			<EnumVal ord="3">ANSI Normal Inverse</EnumVal>
			<EnumVal ord="4">ANSI Moderate Inverse</EnumVal>
			<EnumVal ord="5">ANSI Definite Time</EnumVal>
			<EnumVal ord="9">IEC Normal Inverse</EnumVal>
			<EnumVal ord="10">IEC Very Inverse</EnumVal>
			<EnumVal ord="12">IEC Extremely Inverse</EnumVal>
			<EnumVal ord="14">IEC Long-Time Inverse</EnumVal>
		</EnumType>
	</DataTypeTemplates>
</SCL>