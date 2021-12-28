fx_version 'cerulean'

game 'gta5'

author 'guillerp#1928'

lua54 'yes'

shared_scripts {

}

server_scripts {
    './Server/SMain.lua',

    './Server/Modules/Logger.lua',
    './Server/Modules/Functions.lua',
    './Server/Modules/Database.lua',
    './Server/Modules/Database.js',

    './Server/Classes/Job.lua',
    './Server/Classes/Player.lua',

    './Server/Modules/Init.lua',
}

client_scripts {
    './Client/CMain.lua',
    
    './Client/Modules/NuiCallbacks.lua',
    './Client/Modules/Functions.lua',
}

ui_page './Ui/Index.html'

files {
    './Ui/Js/Main.js',

    './Ui/Css/Style.css',
    './Ui/Css/Creatorpage.css',

    './Ui/Assets/*.png',

    './Ui/Index.html',
}