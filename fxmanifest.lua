-- ____  _____ _____
-- |    \|     |  _  |
-- |  |  |  |  |   __|
-- |____/|_____|__|
-- Dop © 2024
-- Toute copie est interdite sans autorisation préalable.

-- Spécifie la version de FXServer (FiveM) à utiliser, ainsi que les jeux compatibles (Red Dead Redemption 2 et Grand Theft Auto V).
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

-- Spécifie les informations sur le script.
author 'Dop <@472132977195876353>'
description 'Range system for pma-voice, don\'t need to configure anything, just install and use.'
gitlab 'https://gitlab.madelew.com/dop/pma-range'
version '1.1'

-- Spécifie les dépendances/scripts nécessaires pour le script. 
shared_scripts {
    '@es_extended/imports.lua',
    'shared.lua'
}

client_script 'client.lua'

dependencies {
    'pma-voice'
}

