#include "lua_lib.h"

	strncpy(config->luaScript, GET_BIT_RANGE_LSB TWO_BYTES_LSB PRINT_ARRAY SET_TWO_BYTES_LSB R"(

enableCanRxWorkaround()
global_can_data = {}


function onTick()
end

    )", efi::size(config->luaScript));
