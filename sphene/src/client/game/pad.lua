-----------------------------------
-- * Variables
-----------------------------------

Pad = {}
Pad.__index = Pad

Pad.KEY_CODE_TO_NAME_TABLE = {
    "mouse1", "mouse2", "mouse3", "mouse4", "mouse5", "mouse_wheel_up", "mouse_wheel_down", "arrow_l", "arrow_u",
    "arrow_r", "arrow_d", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
    "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "num_0", "num_1", "num_2", "num_3", "num_4", "num_5",
    "num_6", "num_7", "num_8", "num_9", "num_mul", "num_add", "num_sep", "num_sub", "num_div", "num_dec", "num_enter", "F1", "F2", "F3", "F4", "F5",
    "F6", "F7", "F8", "F9", "F10", "F11", "F12", "escape", "backspace", "tab", "lalt", "ralt", "enter", "space", "pgup", "pgdn", "end", "home",
    "insert", "delete", "lshift", "rshift", "lctrl", "rctrl", "[", "]", "pause", "capslock", "scroll", ";", ",", "-", ".", "/", "#", "\\", "="
}

Pad.KEY_TABLE = {
    {
        foot = {
            analog = {'left', 'right'}
        },
        vehicle = {
            analog = {'vehicle_left', 'vehicle_right'}
        }
    },
    {
        foot = {
            analog = {'forwards', 'backwards'}
        },
        vehicle = {
            analog = {'steer_forward', 'steer_back'}
        }
    },
    {
        vehicle = {
            analog = {'special_control_left', 'special_control_right'}
        }
    },
    {
        vehicle = {
            analog = {'special_control_up', 'special_control_down'}
        }
    },
    {
        foot = {
            key = {'action'}
        },
        vehicle = {
            key = {'vehicle_secondary_fire'}
        }
    },
    {
        foot = {
            key = {'previous_weapon'}
        },
        vehicle = {
            key = {'vehicle_look_left'}
        }
    },
    {
        foot = {
            key = {'aim_weapon'}
        },
        vehicle = {
            key = {'handbrake'}
        }
    },
    {
        foot = {
            key = {'next_weapon'}
        },
        vehicle = {
            key = {'vehicle_look_right'}
        }
    },
    {
        foot = {
            key = {'group_control_forwards'}
        },
        vehicle = {
            key = {'radio_previous'}
        }
    },
    {
        foot = {
            key = {'group_control_back'}
        },
        vehicle = {
            key = {'radio_next'}
        }
    },
    {
        foot = {
            key = {'conversation_no'}
        },
        vehicle = {
            key = {'conversation_no'}
        }
    },
    {
        foot = {
            key = {'conversation_yes'}
        },
        vehicle = {
            key = {'conversation_yes'}
        }
    },
    {},
    {
        foot = {
            key = {'change_camera'}
        },
        vehicle = {
            key = {'change_camera'}
        }
    },
    {
        foot = {
            key = {'jump', 'zoom_in'}
        },
        vehicle = {
            key = {'brake_reverse'}
        }
    },
    {
        foot = {
            key = {'enter_exit'}
        },
        vehicle = {
            key = {'enter_exit'}
        }
    },
    {
        foot = {
            key = {'sprint', 'zoom_out'}
        },
        vehicle = {
            key = {'accelerate'}
        }
    },
    {
        foot = {
            key = {'fire'}
        },
        vehicle = {
            key = {'vehicle_fire'}
        }
    },
    {
        foot = {
            key = {'crouch'}
        },
        vehicle = {
            key = {'horn'}
        }
    },
    {
        foot = {
            key = {'look_behind'}
        },
        vehicle = {
            key = {'sub_mission'}
        }
    }
}

Pad.GTA_TO_MTA_CONVERT_TABLE = {
    ["ped_fireweapon"] = "fire",
    ["ped_cycle_weapon_right"] = "next_weapon",
    ["ped_cycle_weapon_left"] = "previous_weapon",
    ["group_control_fwd"] = "group_control_forwards",
    ["group_control_bwd"] = "group_control_back",
    ["conversation_no"] = "conversation_no",
    ["conversation_yes"] = "conversation_yes",
    ["go_forward"] = "forwards",
    ["go_back"] = "backwards",
    ["go_left"] = "left",
    ["go_right"] = "right",
    ["ped_sniper_zoom_in"] = "zoom_in",
    ["ped_sniper_zoom_out"] = "zoom_out",
    ["vehicle_enter_exit"] = "enter_exit",
    ["camera_change_view_all_situations"] = "change_camera",
    ["ped_jumping"] = "jump",
    ["ped_sprint"] = "sprint",
    ["ped_lock_target"] = "aim_weapon",
    ["ped_duck"] = "crouch",
    ["ped_answer_phone"] = "action",
    ["sneak_about"] = "walk",
    ["ped_lookbehind"] = "look_behind",
    ["vehicle_fireweapon"] = "vehicle_fire",
    ["vehicle_fireweapon_alt"] = "vehicle_secondary_fire",
    ["vehicle_accelerate"] = "accelerate",
    ["vehicle_brake"] = "brake_reverse",
    ["vehicle_steerleft"] = "vehicle_left",
    ["vehicle_steerright"] = "vehicle_right",
    ["vehicle_steerdown"] = "steer_forward",
    ["vehicle_steerup"] = "steer_back",
    ["vehicle_radio_station_up"] = "radio_next",
    ["vehicle_radio_station_down"] = "radio_previous",
    ["vehicle_horn"] = "horn",
    ["toggle_submissions"] = "sub_mission",
    ["vehicle_handbrake"] = "handbrake",
    ["vehicle_mouselook"] = "vehicle_mouse_look",
    ["vehicle_lookleft"] = "vehicle_look_left",
    ["vehicle_lookright"] = "vehicle_look_right",
    ["vehicle_turretleft"] = "special_control_left",
    ["vehicle_turretright"] = "special_control_right",
    ["vehicle_turretup"] = "special_control_up",
    ["vehicle_turretdown"] = "special_control_down",
    ["vehicle_lookbehind"] = "vehicle_look_behind"
}

Pad.DISABLE_KEYS = {
    'vehicle_left', 'vehicle_right', 'vehicle_fire', 'vehicle_secondary_fire', 'vehicle_look_left',
    'accelerate', 'brake_reverse', 'handbrake', 'radio_next', 'radio_previous', 'sub_mission', 'horn', 'special_control_left',
    'forwards', 'backwards', 'left', 'right', 'jump', 'sprint', 'crouch', 'look_behind', 'change_camera', 'enter_exit', 'zoom_in',
}

Pad.moveable = true

-----------------------------------
-- * Functions
-----------------------------------

function Pad.convertGtaControlToMta(control)
    return Pad.GTA_TO_MTA_CONVERT_TABLE[control:lower()] or false
end

function Pad.setMoveable(moveable)
    Pad.moveable = moveable

    Logger.info('PAD', 'Set moveable to {}', tostring(moveable))

    if (not moveable) then
        for _, control in pairs(Pad.DISABLE_KEYS) do
            PlayerElement.getLocalPlayer():setControlState(control, false)
        end
    end
end

function Pad.onClientKey(button, pressed)
    if (isCursorShowing() or isMTAWindowActive() or isMainMenuActive() or isConsoleActive() or isChatBoxInputActive()) then
        cancelEvent()
        return
    end

    if (Pad.moveable) then
        return
    end

    for _, control in pairs(Pad.DISABLE_KEYS) do
        local keys = getBoundKeys(control)

        if (keys) then
            for key, _ in pairs(keys) do
                if (key == button) then
                    cancelEvent()
                    return
                end
            end
        end
    end
end

function Pad.isKeyPressed(buttonId)
    if (isMTAWindowActive() or isMainMenuActive() or isConsoleActive() or isChatBoxInputActive()
        or isCursorShowing()) then
        return false
    end

    buttonId = buttonId + 1

    local binding = Pad.KEY_TABLE[buttonId]

    if (binding ~= nil) then
        local inVehicle = PlayerElement.getLocalPlayer():isInVehicle()
        local keyBindings = {}
        local analogBindings = {}

        if (inVehicle) then
            if (binding.vehicle ~= nil) then
                if (binding.vehicle.key ~= nil) then
                    keyBindings = binding.vehicle.key
                end

                if (binding.vehicle.analog ~= nil) then
                    analogBindings = binding.vehicle.analog
                end
            end
        else
            if (binding.foot ~= nil) then
                if (binding.foot.key ~= nil) then
                    keyBindings = binding.foot.key
                end

                if (binding.foot.analog ~= nil) then
                    analogBindings = binding.foot.analog
                end
            end
        end

        for _, key in ipairs(keyBindings) do
            if (Pad.isControlPressed(key)) then
                return true
            end
        end

        for _, analogKey in ipairs(analogBindings) do
            if (Pad.isAnalogControlPressed(analogKey)) then
                return true
            end
        end
    end

    return false
end

function Pad.isKeyPressedByCode(code)
    local keyName = Pad.KEY_CODE_TO_NAME_TABLE[code]

    if (keyName) then
        return getKeyState(keyName)
    end

    return false
end

function Pad.isKeyBoundToControl(key, control)
    local boundKeys = getBoundKeys(control)

    if (boundKeys) then
        for boundKey, _ in pairs(boundKeys) do
            if (boundKey == key) then
                return true
            end
        end
    end

    return false
end

function Pad.isControlPressed(key)
    if (getControlState(key)) then
        return true
    else
        local boundKeys = getBoundKeys(key)

        if (boundKeys) then
            for boundKey, _ in pairs(boundKeys) do
                if (getKeyState(boundKey)) then
                    return true
                end
            end
        end
    end

    return false
end

function Pad.isAnalogControlPressed(analogKey)
    if (getAnalogControlState(analogKey) > 0) then
        return true
    else
        local boundKeys = getBoundKeys(analogKey)

        if (boundKeys) then
            for boundKey, _ in pairs(boundKeys) do
                if (getKeyState(boundKey)) then
                    return true
                end
            end
        end
    end
end

function Pad.isMoveable()
    return Pad.moveable
end

function Pad.getAnalogState(analogKey)
    return getAnalogControlState(analogKey)
end