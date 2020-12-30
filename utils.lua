function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

function notice(message)
    for _, line in ipairs(message:split('\n')) do
        windower.add_to_chat(160, windower.to_shift_jis(line) .. _libs.chat.controls.reset)
    end
end
