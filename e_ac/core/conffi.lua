cfg = {}
qbcore = nil

cfg.bigTriggers = {
    money = 5000,
    bank = 20000,
    black_money = 20000,
}

cfg.overtimeTriggers = {
    money = {
        soft = {
            value =  10000,
            timeframe = 10000,
        },
        hard = {
            value =  100000,
            timeframe = 60000,
        },
    },
    bank = {
        soft = { 
            value =  10000,
            timeframe = 10000, 
        },
        hard = {
            value =  100000,
            timeframe = 60000,
        },
    },
    black_money = {
        soft = { 
            value =  10000,
            timeframe = 10000,
        },
        hard = {
            value =  100000,
            timeframe = 60000,
        },
    },
}

cfg.weaponsInGame = {
    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_REVOLVER_MK2',
    'WEAPON_SNSPISTOL',
    'WEAPON_SNSPISTOL_MK2',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MINISMG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_COMBATPDW',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_PUMPSHOTGUN_MK2',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_SPECIALCARBINE_MK2',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_STONE_HATCHET',
    'WEAPON_GUSENBERG',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_MARKSMANRIFLE_MK2',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_MINIGUN',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_DIGISCANNER',
    'WEAPON_BALL',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_FIREWORK',
    'WEAPON_MUSKET',
    'WEAPON_STUNGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_PROXMINE',
    'WEAPON_SNOWBALL',
    'WEAPON_FLAREGUN',
    'WEAPON_GARBAGEBAG',
    'WEAPON_HANDCUFFS',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_KNUCKLE',
    'WEAPON_HATCHET',
    'WEAPON_RAILGUN',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_BATTLEAXE',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_PIPEBOMB',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_FLASHLIGHT',
    'WEAPON_FLARE',
    'WEAPON_RAYMINIGUN',
    'WEAPON_RAYPISTOL',
    'WEAPON_RAYCARBINE',
    'WEAPON_BULLPUPRIFLE_MK2',
    'WEAPON_DOUBLEACTION',
    'WEAPON_PISTOL50',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_PETROLCAN',
    'WEAPON_SAWNOFFSHOTGUN',
}

sCfg = {}
sCfg.webHooks = {
    moneySoft = {
        queue = {},
        webhook = ''
    },
    moneyHard = {
        queue = {},
        webhook = ''
    },
    moneyBig = {
        queue = {},
        webhook = ''
    },
    bankSoft = {
        queue = {},
        webhook = ''
    },
    bankHard = {
        queue = {},
        webhook = ''
    },
    bankBig = {
        queue = {},
        webhook = ''
    },
    blackSoft = {
        queue = {},
        webhook = ''
    },
    blackHard = {
        queue = {},
        webhook = ''
    },
    blackBig = {
        queue = {},
        webhook = ''
    },
    moddedWeapon = {
        queue = {},
        webhook = ''
    }
}
