function onCreatePost()
    scaleObject('healthBarBG', 0.6, 0.6)
    scaleObject('healthBar', 0.6, 0.6)

    setProperty('healthBar.scale.x', 0.572)
    setProperty('healthBar.scale.y', 0.32)

    screenCenter('healthBar', 'x')
    setProperty('healthBar.y', getProperty('healthBar.y')-10)

    setProperty('healthBar.origin.x', getProperty('healthBar.origin.x')-4)
    setProperty('healthBar.origin.y', getProperty('healthBar.origin.y')-3)

    if songName == "Shop" then
        setProperty('healthBarBG.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('scoreTxt.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
    end
end