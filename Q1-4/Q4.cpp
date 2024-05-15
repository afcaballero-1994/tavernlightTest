void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    //since the player could not be found and we still do not know if it could not be created beforehand
    //we need to check if the allocation is neccesary
    bool isAllocated = false;
    if (!player) {
        //to avoid the memory leak is necessary to delete the allocated memory in the early returns
        player = new Player(nullptr);
        isAllocated = true;
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        delete player;
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
    //in case the allocation was neccesary then proceed to deallocate the memory
    if(isAllocated){
        delete player;
    }
}
