function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end
