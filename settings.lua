local hidden = not mods["quality"]

data.extend({
    {
        type = "bool-setting",
        name = "sc2-modify-recycling-recipe",
        setting_type = "startup",
        default_value = true,
        order = "a",
        hidden = hidden
    }
})
