local function replace_ingredient(ingredients, old_ingredient, new_ingredient)
    for i, ingredient in pairs(ingredients) do
        if ingredient.name then
            if ingredient.name == old_ingredient then
                ingredient.name = new_ingredient
            end
        end
    end
end

local function update_recipe(recipe_name, old_item, new_item)
    if not data.raw["recipe"][recipe_name] then return end

    local recipe = data.raw["recipe"][recipe_name]

    if recipe.ingredients then
        replace_ingredient(recipe.ingredients, old_item, new_item)
    end

    if mods["quality"] and settings.startup["sc2-modify-recycling-recipe"] then
        if settings.startup["sc2-modify-recycling-recipe"].value then
            local recycling = require("__quality__/prototypes/recycling")

            recycling.generate_recycling_recipe(recipe)
            auto_recycle = false
        end
    end
end

update_recipe("concrete", "iron-ore", "iron-stick")

if mods["Dectorio"] then
    update_recipe("dect-concrete-grid", "iron-ore", "iron-stick")
end
