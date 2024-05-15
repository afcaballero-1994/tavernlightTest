function removePlayerFromParty(playerId, membername)
-- is not neccesary to loop over the party members since there is a method that can remove a player from the party
--the method accepts the player as parameter and the second parameter is forceremove, I am assuming that the caller
--is expecting to remove the player from the party no matter what, this is why i use true as parameter
    player = Player(playerId)
    local party = player:getParty()
    party:leaveParty(player, true)
end
