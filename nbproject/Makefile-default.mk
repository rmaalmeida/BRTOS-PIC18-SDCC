#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/brtos/OS_RTC.o ${OBJECTDIR}/tasks.o ${OBJECTDIR}/brtos/semaphore.o ${OBJECTDIR}/main.o ${OBJECTDIR}/drivers/adc.o ${OBJECTDIR}/brtos/BRTOS.o ${OBJECTDIR}/hal/HAL.o ${OBJECTDIR}/brtos/queue.o ${OBJECTDIR}/drivers/lcd.o ${OBJECTDIR}/brtos/mbox.o ${OBJECTDIR}/brtos/mutex.o ${OBJECTDIR}/drivers/serial.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=/usr/lib/java/bin/
OS_ORIGINAL="Linux"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/usr/bin/sdcc
# MP_BC is not defined
# MP_AS is not defined
# MP_LD is not defined
# MP_AR is not defined
# MP_BC is not defined
MP_CC_DIR=/usr/bin
# MP_BC_DIR is not defined
# MP_AS_DIR is not defined
# MP_LD_DIR is not defined
# MP_AR_DIR is not defined
# MP_BC_DIR is not defined
.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/brtos/OS_RTC.o: brtos/OS_RTC.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/OS_RTC.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/OS_RTC.c  -o${OBJECTDIR}/brtos/OS_RTC.o
	
${OBJECTDIR}/tasks.o: tasks.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/tasks.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 tasks.c  -o${OBJECTDIR}/tasks.o
	
${OBJECTDIR}/brtos/semaphore.o: brtos/semaphore.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/semaphore.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/semaphore.c  -o${OBJECTDIR}/brtos/semaphore.o
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/main.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 main.c  -o${OBJECTDIR}/main.o
	
${OBJECTDIR}/drivers/adc.o: drivers/adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/adc.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/adc.c  -o${OBJECTDIR}/drivers/adc.o
	
${OBJECTDIR}/brtos/BRTOS.o: brtos/BRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/BRTOS.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/BRTOS.c  -o${OBJECTDIR}/brtos/BRTOS.o
	
${OBJECTDIR}/hal/HAL.o: hal/HAL.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/hal 
	${RM} ${OBJECTDIR}/hal/HAL.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 hal/HAL.c  -o${OBJECTDIR}/hal/HAL.o
	
${OBJECTDIR}/brtos/queue.o: brtos/queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/queue.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/queue.c  -o${OBJECTDIR}/brtos/queue.o
	
${OBJECTDIR}/drivers/lcd.o: drivers/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/lcd.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/lcd.c  -o${OBJECTDIR}/drivers/lcd.o
	
${OBJECTDIR}/brtos/mbox.o: brtos/mbox.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/mbox.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/mbox.c  -o${OBJECTDIR}/brtos/mbox.o
	
${OBJECTDIR}/brtos/mutex.o: brtos/mutex.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/mutex.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/mutex.c  -o${OBJECTDIR}/brtos/mutex.o
	
${OBJECTDIR}/drivers/serial.o: drivers/serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/serial.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/serial.c  -o${OBJECTDIR}/drivers/serial.o
	
else
${OBJECTDIR}/brtos/OS_RTC.o: brtos/OS_RTC.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/OS_RTC.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/OS_RTC.c  -o${OBJECTDIR}/brtos/OS_RTC.o
	
${OBJECTDIR}/tasks.o: tasks.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/tasks.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 tasks.c  -o${OBJECTDIR}/tasks.o
	
${OBJECTDIR}/brtos/semaphore.o: brtos/semaphore.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/semaphore.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/semaphore.c  -o${OBJECTDIR}/brtos/semaphore.o
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/main.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 main.c  -o${OBJECTDIR}/main.o
	
${OBJECTDIR}/drivers/adc.o: drivers/adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/adc.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/adc.c  -o${OBJECTDIR}/drivers/adc.o
	
${OBJECTDIR}/brtos/BRTOS.o: brtos/BRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/BRTOS.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/BRTOS.c  -o${OBJECTDIR}/brtos/BRTOS.o
	
${OBJECTDIR}/hal/HAL.o: hal/HAL.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/hal 
	${RM} ${OBJECTDIR}/hal/HAL.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 hal/HAL.c  -o${OBJECTDIR}/hal/HAL.o
	
${OBJECTDIR}/brtos/queue.o: brtos/queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/queue.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/queue.c  -o${OBJECTDIR}/brtos/queue.o
	
${OBJECTDIR}/drivers/lcd.o: drivers/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/lcd.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/lcd.c  -o${OBJECTDIR}/drivers/lcd.o
	
${OBJECTDIR}/brtos/mbox.o: brtos/mbox.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/mbox.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/mbox.c  -o${OBJECTDIR}/brtos/mbox.o
	
${OBJECTDIR}/brtos/mutex.o: brtos/mutex.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/brtos 
	${RM} ${OBJECTDIR}/brtos/mutex.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 brtos/mutex.c  -o${OBJECTDIR}/brtos/mutex.o
	
${OBJECTDIR}/drivers/serial.o: drivers/serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/drivers 
	${RM} ${OBJECTDIR}/drivers/serial.o 
	${MP_CC} --debug-ralloc --pstack-model=large -c -mpic16 -p18f4520 drivers/serial.c  -o${OBJECTDIR}/drivers/serial.o
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  --debug-ralloc -Wl-c -Wl-m --pstack-model=large -mpic16 -p18f4520 ${OBJECTFILES}  -odist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof 
else
dist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  --debug-ralloc -Wl-c -Wl-m --pstack-model=large -mpic16 -p18f4520 ${OBJECTFILES}  -odist/${CND_CONF}/${IMAGE_TYPE}/BRTOS-PIC18-SDCC.X.${IMAGE_TYPE}.cof 
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
