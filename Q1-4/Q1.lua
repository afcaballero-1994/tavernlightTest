--values were harcoded and probably did not point to the intended player ID. The rest of the implementation only make sure to releaseStorage if the
--player was actually connected and it is only going to be executed once the player will logout

local function releaseStorage(player)
    player:setStorageValue(player.uid, -1)
end

function onLogout(player)
    if player:getStorageValue(player.uid) == 1 then
        addEvent(releaseStorage, 0 ,player.uid, player)
    end
    return true
end
