function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

function notice(message)
    for _, line in ipairs(message:split('\n')) do
        windower.add_to_chat(158, windower.to_shift_jis(line) .. _libs.chat.controls.reset)
    end
end

function error(message)
    for _, line in ipairs(message:split('\n')) do
        windower.add_to_chat(4, windower.to_shift_jis(line) .. _libs.chat.controls.reset)
    end
end

function objectPath(object, ...)
    local result = object
    for i, v in ipairs(arg) do
        if result[v] ~= nil then
            result = result[v]
        else
            return nil
        end
    end

    return result
end

function copy(table)
    result = {}

    for k, v in pairs(table) do
        result[k] = v
    end

    return result
end

function merge(t1, t2)
    result = {}

    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        result[k] = v
    end

    return result
end
