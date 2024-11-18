local function replace_ingredient(ingredients, old_ingredient, new_ingredient)
    for i, ingredient in pairs(ingredients) do
        if ingredient.name then
            if ingredient.name == old_ingredient then
                ingredient.name = new_ingredient
            end
        end
    end
end

local function replace_results(results, old_result, new_result)
    for i, result in pairs(results) do
        if result.name then
            if result.name == old_result then
                result.name = new_result
            end
        end
    end
end

local function update_recipe(recipe, old_item, new_item)
    if data.raw.recipe[recipe].ingredients then
        replace_ingredient(data.raw.recipe[recipe].ingredients, old_item, new_item)
    end

    if data.raw.recipe[recipe .. "-recycling"].results then
        replace_results(data.raw.recipe[recipe .. "-recycling"].results, old_item, new_item)
    end
end

update_recipe("concrete", "iron-ore", "iron-stick")

if mods["Dectorio"] then
    update_recipe("dect-concrete-grid", "iron-ore", "iron-stick")
end
