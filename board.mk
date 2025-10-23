include $(BOARD_DIR)/firmware/firmware.mk


BOARDINC += $(BOARD_DIR)/generated/controllers/generated

# defines SHORT_BOARD_NAME
include $(BOARD_DIR)/meta-info.env

# this would save some flash while being unable to update WBO controller firmware
DDEFS += -DEFI_WIDEBAND_FIRMWARE_UPDATE=FALSE

# assign critical LED to a non-existent pin if you do not have it on your board
# good old PD14 is still the default value
# DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=Gpio::I15

# EGT chip
#un-comment to enable
#DDEFS += -DEFI_MAX_31855=TRUE

#see main repo for details on this any many other optional subsystems. We have too many, one has to choose what fits into his choice of stm32
#DDEFS += -DEFI_ONBOARD_MEMS=TRUE


# Default H743 linker script is not compatible
DSCRIPT = $(PROJECT_DIR)/hw_layer/ports/stm32/stm32h7/STM32H723xG_ITCM64k.ld
# Do not use HSE autodetection
DDEFS += -DSTM32_HSECLK=20000000
DDEFS += -DENABLE_AUTO_DETECT_HSE=FALSE
