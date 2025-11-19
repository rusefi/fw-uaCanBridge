
-- RX performance, requires 'luaCanRxWorkaround' calibration flag
global_can_data = {}
enableCanRxWorkaround()

MAIN_BUS = 1
BUS2 = 2
BUS3 = 3

bus2offset = 0x20000
bus2range  =   0x800

function onAnythingFromMainBus(bus, id, dlc, data)
    -- print("onAnythingFromMainBus")
    if id >= bus2offset and id < bus2offset + bus2range then
        txCan(BUS2, id - bus2offset, 0, data) -- relay from main into bus2
    end
end

function onAnythingFromBus2(bus, id, dlc, data)
    -- print("onAnythingFromBus2")
    txCan(MAIN_BUS, id + bus2offset, 1, data) -- relay from bus2 into main bus, applying offset
end

canRxAddMask(MAIN_BUS, 0, 0, onAnythingFromMainBus)
canRxAddMask(BUS2,     0, 0, onAnythingFromBus2)