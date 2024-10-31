return {
    black = 0xff272722,
    white = 0xfff1f2f1,
    red = 0xffea687e,
    green = 0xff85f298,
    blue = 0xff86d0f9,
    yellow = 0xfffdf4b1,
    orange = 0xfff39660,
    magenta = 0xfff2a8d5,
    grey = 0xff888da7,
    transparent = 0x00000000,

    bar = {
        bg = 0xff353743,
        border = 0xff2c2e34,
    },
    popup = {
        bg = 0xc0353743,
        border = 0xff7f8490
    },
    item = {
        bg = 0xff303238,
        border = 0xff414550,
        border_selected = 0xfff1f2f1
    },
    bg1 = 0xff363944,
    bg2 = 0xff414550,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then return color end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
