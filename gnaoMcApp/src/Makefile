TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = gnaoMc
# gnaoMc.dbd will be created and installed
DBD += gnaoMc.dbd

# gnaoMc.dbd will be made up from these files:
gnaoMc_DBD += base.dbd

# Include dbd files from all support applications:
gnaoMc_DBD += asyn.dbd ads.dbd motorSupport.dbd devSoftMotor.dbd

# Add all the support libraries needed by this IOC
gnaoMc_LIBS += asyn ads motor softMotor

# gnaoMc_registerRecordDeviceDriver.cpp derives from gnaoMc.dbd
gnaoMc_SRCS += gnaoMc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
gnaoMc_SRCS_DEFAULT += gnaoMcMain.cpp
gnaoMc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#gnaoMc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
gnaoMc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

