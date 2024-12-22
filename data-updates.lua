local function replace_ingredient(ingredients, old_ingredient, new_ingredient)
    for i, ingredient in pairs(ingredients) do
        if ingredient.name then
            if ingredient.name == old_ingredient then
                ingredient.name = new_ingredient
            end
        end
    end
end

local function update_recipe(recipe, old_item, new_item)
    if data.raw.recipe[recipe] and data.raw.recipe[recipe].ingredients then
        replace_ingredient(data.raw.recipe[recipe].ingredients, old_item, new_item)
    end
end

update_recipe("concrete", "iron-ore", "iron-stick")

if mods["Dectorio"] then
    update_recipe("dect-concrete-grid", "iron-ore", "iron-stick")
end

if mods["quality"] then require("__quality__.data-updates") end
