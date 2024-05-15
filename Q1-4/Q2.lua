function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    --this makes sure that we got a result in the query to the database
    if resultId then
    -- if we got a valid result, then we loop through the results got by the query.
        repeat
            local guildName = result.getString(resultID, "guild_name")
            print(guildName)
        until not result.next(resultID)
        result.free(resultID)
    end
end
