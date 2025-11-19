include $(BOARD_DIR)/firmware/firmware.mk

DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=Gpio::C15
# PC14, PC15 are used for LEDs
DDEFS += -DSTM32_LSE_ENABLED=FALSE

BOARDINC += $(BOARD_DIR)/generated/controllers/generated

# defines SHORT_BOARD_NAME
include $(BOARD_DIR)/meta-info.env

# this would save some flash while being unable to update WBO controller firmware
DDEFS += -DEFI_WIDEBAND_FIRMWARE_UPDATE=FALSE

DDEFS += -DUSB_DESCRIPTOR_B_LENGTH=38
DDEFS += -DUSB_DESCRIPTOR_STRING_CONTENT="'r', 0, 'u', 0, 's', 0, 'E', 0, 'F', 0, 'I', 0, ' ', 0, 'u', 0, 'a', 0, 'C', 0, 'a', 0, 'n', 0, 'B', 0, 'r', 0, 'i', 0, 'd', 0, 'g', 0, 'e', 0"

DDEFS += -DBOARD_SERIAL="\"000000000000060000000000\""

# Default H743 linker script is not compatible
LDSCRIPT = $(PROJECT_DIR)/hw_layer/ports/stm32/stm32h7/STM32H723xG_ITCM64k.ld
# Do not use HSE autodetection
DDEFS += -DSTM32_HSECLK=20000000
DDEFS += -DENABLE_AUTO_DETECT_HSE=FALSE

DDEFS += -DEFI_SDC_DEVICE=SDCD1
