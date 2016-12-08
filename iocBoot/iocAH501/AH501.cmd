epicsEnvSet("PREFIX",    "quadEMTest:")
epicsEnvSet("RECORD",    "AH501:")
epicsEnvSet("PORT",      "AH501")
epicsEnvSet("TEMPLATE",  "AH501")
epicsEnvSet("MODEL",     "AH501D")
epicsEnvSet("QSIZE",     "20")
epicsEnvSet("RING_SIZE", "10000")
epicsEnvSet("TSPOINTS",  "1000")
epicsEnvSet("IP",        "164.54.160.11:10001")

< $(QUADEM)/iocBoot/AHxxx.cmd
dbLoadRecords("$(QUADEM)/db/AH501.template", "P=$(PREFIX), R=$(RECORD), PORT=$(PORT)")

< $(QUADEM)/iocBoot/saveRestore.cmd

iocInit()

# save settings every thirty seconds
create_monitor_set("auto_settings.req",30,"P=$(PREFIX), R=$(RECORD)")
