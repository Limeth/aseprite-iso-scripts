if app.apiVersion < 2 then
  return app.alert("This script requires Aseprite v1.2.10-beta4")
end

local sprite = app.activeSprite

local function setup_layer(name, description)
    local layer = nil

    for i, current_layer in ipairs(sprite.layers) do
        if string.lower(current_layer.name) == string.lower(name) then
            layer = current_layer
        end
    end

    if layer == nil then
        app.alert(string.format("Please create %s with the name '%s'.", description, name))
        return nil
    end

    if layer.opacity == 0 then
        layer.opacity = 255
    end

    layer.isVisible = true

    return layer
end

local layer_above = setup_layer("ISO Above", "an empty layer group above the isometric texture layer")
if layer_above == nil then return end

local layer_below = setup_layer("ISO Below", "an empty layer group below the isometric texture layer")
if layer_below == nil then return end

local function clear_layer(layer)
    local cel = sprite:newCel(layer, app.activeFrame)
    cel.image = Image(sprite.width, sprite.height, app.activeCel.image.colorMode)
end

local function copy_to_layer(layer_to, offset)
    local function pixelColor_to_color(color)
        return sprite.palettes[1]:getColor(color)
    end

    local cel_from = app.activeCel
    local image_from = cel_from.image
    local cel_to = layer_to:cel(cel_from.frameNumber)
    local image_to = cel_to.image

    for from_x = 0, image_from.width - 1 do
        for from_y = 0, image_from.height - 1 do
            local to_x = from_x + offset.x + cel_from.position.x;
            local to_y = from_y + offset.y + cel_from.position.y;
            local pixelColor = image_from:getPixel(from_x, from_y)
            local color = pixelColor_to_color(pixelColor)

            if color.alpha ~= 0 then
                image_to:drawPixel(to_x, to_y, pixelColor)
            end
        end
    end
end

app.transaction(function()
    clear_layer(layer_below)
    copy_to_layer(layer_below, Point(-16,   8))
    copy_to_layer(layer_below, Point(  0,  16))
    copy_to_layer(layer_below, Point( 16,  24))
    copy_to_layer(layer_below, Point(-16,  -8))

    clear_layer(layer_above)
    copy_to_layer(layer_above, Point(-16, -24))
    copy_to_layer(layer_above, Point(  0, -16))
    copy_to_layer(layer_above, Point( 16,   8))
    copy_to_layer(layer_above, Point( 16,  -8))
end)
