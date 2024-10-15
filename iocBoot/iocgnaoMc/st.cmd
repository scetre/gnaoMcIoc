#!../../bin/linux-x86_64/gnaoMc

< envPaths

## Set EPICS_DB_INCLUDE_PATH to help find .dbd files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(MOTOR)/dbd:$(EPICS_BASE)/dbd")

## Register all support components
dbLoadDatabase "$(EPICS_BASE)/dbd/base.dbd"
dbLoadDatabase "$(MOTOR)/dbd/motorSupport.dbd"
dbLoadDatabase "$(MOTOR)/dbd/devSoftMotor.dbd"

cd "${TOP}"
dbLoadDatabase "dbd/gnaoMc.dbd"
gnaoMc_registerRecordDeviceDriver pdbbase

# Set local AMS net ID
AdsSetLocalAMSNetID("192.168.200.9.1.1")

# gnaoMc PLC program connection parameters
epicsEnvSet("PREFIX_ADSGNAOMC", "ADS-GNAOMC")
epicsEnvSet("PORT_ADSGNAOMC", "ads-gnaoMc-port")
epicsEnvSet("IP_ADSGNAOMC", "192.168.206.5")
epicsEnvSet("AMS_ID_ADSGNAOMC", "192.168.206.1.1")

## Load record instances
dbLoadRecords("db/gnaoMc.db","P=$(PREFIX_ADSGNAOMC), PORT=$(PORT_ADSGNAOMC)")

# Open ADS port
# AdsOpen(port_name,
#         remote_ip_address,
#         remote_ams_net_id,
#         sum_buffer_nelem (default: 500),
#         ads_timeout (default: 500 ms),
#         device_ads_port (default: 851),
#         sum_read_period (default: 1 ms))
AdsOpen("$(PORT_ADSGNAOMC)", "$(IP_ADSGNAOMC)", "$(AMS_ID_ADSGNAOMC)", 1000, 1000, 851, 10)

# Enable asyn trace output for errors and warnings
asynSetTraceMask("$(PORT_ADSGNAOMC)", 0, 0x21)
# Alternatively, output everything
#asynSetTraceMask("$(PORT_ADSGNAOMC)", 0, 0xff)

cd "${TOP}/iocBoot/${IOC}"
iocInit

