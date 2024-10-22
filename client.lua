-- ____  _____ _____
-- |    \|     |  _  |
-- |  |  |  |  |   __|
-- |____/|_____|__|
-- Dop © 2024
-- Toute copie est interdite sans autorisation préalable.

local voiceModes = {}
local CreateZoneTimeout = 1000
local isCreatingZone = false -- Ajout d'une variable pour vérifier si une zone est en cours de création

-- Cette fonction est déclenchée par l'événement "pma-voice:settingsCallback". Elle reçoit les paramètres de voix et les stocke dans la variable locale `voiceModes`.
TriggerEvent("pma-voice:settingsCallback", function(voiceSettings)
    voiceModes = voiceSettings.voiceModes
    print("Type de voix chargé avec succès.")
end)

-- Cet événement est déclenché pour définir le mode de parole du joueur.
AddEventHandler('pma-voice:setTalkingMode', function(mode)
    -- Si l'envoi de notifications est activé dans la configuration, envoie une notification au joueur pour l'informer du changement de mode vocal.
    if Config.sendNotify then
        Config.notify("Votre type de voix a été changé en: " .. voiceModes[mode][2] .. ".")
    end

    -- Si l'affichage du rayon de voix est activé dans la configuration, crée une zone autour du joueur pour indiquer la portée de sa voix.
    if Config.showRadius then
        -- Annule la création de la zone en cours si elle existe
        isCreatingZone = false

        -- Attends un instant pour s'assurer que la zone précédente est annulée
        Citizen.Wait(10)

        -- Démarre la création de la nouvelle zone
        CreateZoneTimeout = 1000 -- Réinitialise le timeout avant la création de la zone
        isCreatingZone = true

        Citizen.CreateThread(function()
            while CreateZoneTimeout > 0 and isCreatingZone do
                Citizen.Wait(0) -- Attend une petite période (0 millisecondes) avant de continuer l'exécution.
                CreateZoneTimeout = CreateZoneTimeout - 1 -- Décrémente le timeout.
                Config.CreateZone(voiceModes[mode][1]) -- Crée une zone avec la portée vocale actuelle.
            end
            isCreatingZone = false -- Marque la fin de la création de la zone
        end)
    end
end)