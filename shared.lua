-- ____  _____ _____
-- |    \|     |  _  |
-- |  |  |  |  |   __|
-- |____/|_____|__|
-- Dop © 2024
-- Toute copie est interdite sans autorisation préalable.

Config = {}

-- Si activé, affiche le rayon de voix autour du joueur lorsqu'il appuie sur la touche de changement de mode vocal.
Config.showRadius = true 

-- Si activé, envoie une notification au joueur lorsqu'il change de mode vocal.
Config.sendNotify = false

---@param message string
Config.notify = function(message) 
    -- Fonction pour envoyer un message de notification. 
    -- Si vous ne savez pas ce que vous faites, ne modifiez pas cette fonction.
    ESX.ShowNotification(message)
    
    -- Les lignes suivantes sont des exemples de code pour afficher une notification,
    -- mais elles sont actuellement désactivées.
    -- SetNotificationTextEntry("STRING")
    -- AddTextComponentString(message)
    -- DrawNotification(false, false)
end

-- Cette fonction crée un marqueur visuel autour du joueur pour représenter la portée de sa voix.
---@param voiceRange number 
Config.CreateZone = function(voiceRange)
    local coords = GetEntityCoords(PlayerPedId()) -- Obtient les coordonnées du joueur.
    -- Dessine un marqueur vert autour du joueur avec un diamètre basé sur la portée de la voix.
    DrawMarker(1, coords.x, coords.y, coords.z - 1.0, 0, 0, 0, 0, 0, 0, voiceRange * 2.0, voiceRange * 2.0, 0.1, 0, 255, 0, 100, 0, 0, 0, 0)
end
