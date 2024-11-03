return {
    black = 0xff1e222a,
    white = 0xffd7dae0,
    red = 0xffe06c75,
    green = 0xff98c379,
    blue = 0xff61afef,
    yellow = 0xffe7c787,
    orange = 0xfffca2aa,
    magenta = 0xfff2a8d5,
    grey = 0xff42464e,
    transparent = 0x00000000,

    bar = {
        bg = 0xff282c34,
        border = 0xff2c2e34,
    },
    popup = {
        bg = 0xc0282c34,
        border = 0xff7f8490
    },
    item = {
        bg = 0xff1e222a,
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
