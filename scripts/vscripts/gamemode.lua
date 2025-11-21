local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["17"] = 1,["18"] = 1,["19"] = 4,["20"] = 4,["21"] = 5,["22"] = 5,["23"] = 6,["24"] = 6,["25"] = 7,["26"] = 7,["27"] = 8,["28"] = 8,["29"] = 9,["30"] = 9,["31"] = 12,["32"] = 12,["33"] = 13,["34"] = 13,["35"] = 14,["36"] = 14,["37"] = 15,["38"] = 15,["39"] = 16,["40"] = 16,["41"] = 17,["42"] = 17,["43"] = 18,["44"] = 18,["45"] = 18,["46"] = 21,["47"] = 21,["48"] = 22,["49"] = 22,["50"] = 29,["51"] = 36,["52"] = 55,["53"] = 55,["54"] = 55,["55"] = 55,["56"] = 60,["57"] = 61,["58"] = 62,["59"] = 77,["60"] = 78,["61"] = 77,["63"] = 81,["64"] = 82,["65"] = 83,["66"] = 105,["67"] = 107,["68"] = 107,["69"] = 107,["70"] = 107,["71"] = 109,["72"] = 111,["73"] = 112,["74"] = 113,["75"] = 114,["76"] = 104,["77"] = 85,["78"] = 86,["79"] = 85,["80"] = 89,["81"] = 90,["82"] = 92,["83"] = 94,["84"] = 95,["85"] = 96,["87"] = 99,["88"] = 101,["89"] = 89,["90"] = 117,["91"] = 118,["92"] = 118,["93"] = 118,["94"] = 118,["95"] = 118,["96"] = 119,["97"] = 119,["98"] = 119,["99"] = 119,["100"] = 119,["101"] = 120,["102"] = 120,["103"] = 120,["104"] = 120,["105"] = 120,["106"] = 121,["107"] = 121,["108"] = 121,["109"] = 121,["110"] = 121,["111"] = 122,["112"] = 122,["113"] = 122,["114"] = 122,["115"] = 122,["116"] = 117,["117"] = 125,["118"] = 126,["119"] = 126,["120"] = 126,["121"] = 127,["124"] = 129,["125"] = 130,["128"] = 131,["129"] = 132,["132"] = 134,["133"] = 135,["134"] = 137,["135"] = 126,["136"] = 126,["137"] = 140,["138"] = 140,["139"] = 140,["140"] = 141,["141"] = 141,["142"] = 141,["143"] = 141,["144"] = 143,["147"] = 144,["150"] = 146,["151"] = 148,["152"] = 140,["153"] = 140,["154"] = 153,["155"] = 153,["156"] = 153,["157"] = 154,["160"] = 155,["163"] = 157,["164"] = 158,["167"] = 160,["168"] = 153,["169"] = 153,["170"] = 163,["171"] = 163,["172"] = 163,["173"] = 164,["176"] = 165,["179"] = 167,["180"] = 168,["183"] = 170,["184"] = 171,["187"] = 173,["190"] = 175,["191"] = 177,["192"] = 163,["193"] = 163,["194"] = 180,["195"] = 180,["196"] = 180,["197"] = 181,["198"] = 181,["199"] = 181,["200"] = 183,["203"] = 184,["206"] = 185,["209"] = 187,["210"] = 188,["213"] = 190,["214"] = 180,["215"] = 180,["216"] = 193,["217"] = 193,["218"] = 193,["219"] = 194,["220"] = 194,["221"] = 194,["222"] = 194,["223"] = 194,["224"] = 194,["225"] = 196,["228"] = 197,["231"] = 199,["232"] = 200,["233"] = 200,["234"] = 200,["235"] = 200,["236"] = 200,["237"] = 200,["238"] = 200,["239"] = 200,["240"] = 200,["241"] = 193,["242"] = 193,["243"] = 214,["244"] = 214,["245"] = 214,["246"] = 215,["247"] = 215,["248"] = 215,["249"] = 217,["252"] = 219,["253"] = 220,["254"] = 222,["255"] = 224,["256"] = 224,["257"] = 225,["260"] = 227,["261"] = 228,["262"] = 228,["263"] = 228,["264"] = 231,["265"] = 232,["266"] = 233,["267"] = 234,["270"] = 236,["271"] = 228,["272"] = 228,["273"] = 240,["274"] = 241,["275"] = 242,["276"] = 242,["277"] = 242,["278"] = 242,["279"] = 242,["280"] = 242,["281"] = 242,["282"] = 242,["283"] = 242,["284"] = 249,["285"] = 249,["286"] = 249,["287"] = 242,["288"] = 242,["289"] = 242,["290"] = 242,["291"] = 242,["292"] = 242,["293"] = 254,["294"] = 255,["295"] = 260,["296"] = 242,["297"] = 242,["299"] = 264,["300"] = 265,["302"] = 271,["304"] = 277,["305"] = 277,["306"] = 277,["307"] = 277,["308"] = 286,["309"] = 287,["310"] = 287,["311"] = 287,["312"] = 287,["313"] = 287,["314"] = 287,["315"] = 287,["316"] = 287,["317"] = 287,["319"] = 289,["320"] = 289,["321"] = 289,["322"] = 289,["323"] = 289,["324"] = 289,["325"] = 289,["326"] = 289,["328"] = 214,["329"] = 214,["330"] = 125,["331"] = 293,["332"] = 294,["333"] = 294,["334"] = 294,["335"] = 294,["336"] = 294,["337"] = 295,["340"] = 297,["341"] = 298,["344"] = 300,["345"] = 302,["346"] = 303,["347"] = 304,["350"] = 306,["351"] = 302,["352"] = 309,["353"] = 310,["354"] = 294,["355"] = 294,["356"] = 294,["357"] = 313,["358"] = 313,["359"] = 313,["360"] = 313,["361"] = 313,["362"] = 314,["363"] = 315,["366"] = 317,["367"] = 317,["368"] = 317,["369"] = 317,["370"] = 317,["371"] = 317,["372"] = 317,["373"] = 317,["374"] = 317,["375"] = 317,["376"] = 317,["377"] = 317,["378"] = 317,["379"] = 317,["380"] = 329,["381"] = 330,["382"] = 330,["383"] = 330,["384"] = 331,["385"] = 332,["388"] = 334,["389"] = 336,["390"] = 338,["391"] = 330,["392"] = 330,["393"] = 313,["394"] = 313,["395"] = 313,["396"] = 293,["397"] = 343,["398"] = 344,["399"] = 344,["400"] = 344,["401"] = 344,["402"] = 345,["403"] = 345,["404"] = 345,["405"] = 345,["406"] = 346,["407"] = 346,["408"] = 346,["409"] = 346,["410"] = 348,["411"] = 348,["412"] = 348,["413"] = 348,["414"] = 343,["415"] = 353,["416"] = 354,["417"] = 354,["418"] = 354,["419"] = 354,["420"] = 354,["421"] = 354,["422"] = 354,["423"] = 354,["424"] = 354,["425"] = 354,["426"] = 354,["427"] = 354,["428"] = 354,["429"] = 368,["430"] = 369,["432"] = 371,["433"] = 372,["435"] = 374,["436"] = 375,["437"] = 376,["439"] = 378,["440"] = 353,["441"] = 381,["442"] = 382,["443"] = 383,["445"] = 385,["446"] = 386,["447"] = 387,["449"] = 389,["450"] = 381,["451"] = 392,["452"] = 393,["453"] = 394,["455"] = 396,["456"] = 397,["457"] = 398,["459"] = 401,["460"] = 392,["461"] = 404,["462"] = 405,["463"] = 405,["464"] = 406,["466"] = 407,["468"] = 405,["469"] = 409,["470"] = 410,["471"] = 411,["474"] = 416,["475"] = 419,["477"] = 422,["478"] = 423,["479"] = 424,["480"] = 425,["481"] = 425,["482"] = 425,["483"] = 425,["484"] = 425,["485"] = 425,["486"] = 425,["487"] = 425,["488"] = 425,["489"] = 435,["490"] = 436,["491"] = 437,["492"] = 439,["493"] = 440,["497"] = 458,["498"] = 404,["499"] = 490,["500"] = 491,["501"] = 492,["502"] = 494,["503"] = 495,["504"] = 496,["505"] = 497,["506"] = 498,["507"] = 499,["508"] = 500,["509"] = 501,["510"] = 502,["511"] = 504,["512"] = 505,["513"] = 506,["514"] = 507,["515"] = 508,["516"] = 510,["517"] = 511,["518"] = 512,["519"] = 514,["520"] = 515,["521"] = 515,["522"] = 515,["523"] = 515,["524"] = 515,["525"] = 515,["526"] = 515,["527"] = 515,["528"] = 515,["529"] = 515,["530"] = 515,["531"] = 528,["532"] = 529,["533"] = 533,["535"] = 536,["536"] = 536,["537"] = 536,["538"] = 537,["539"] = 536,["540"] = 536,["541"] = 490,["542"] = 541,["543"] = 542,["545"] = 544,["549"] = 546,["550"] = 546,["551"] = 546,["552"] = 546,["559"] = 551,["560"] = 551,["561"] = 551,["562"] = 551,["569"] = 556,["570"] = 556,["571"] = 556,["572"] = 556,["579"] = 561,["580"] = 561,["581"] = 561,["582"] = 561,["589"] = 566,["590"] = 567,["592"] = 570,["593"] = 570,["594"] = 570,["595"] = 570,["603"] = 541,["604"] = 578,["605"] = 579,["606"] = 581,["607"] = 583,["608"] = 584,["610"] = 578,["611"] = 588,["612"] = 589,["613"] = 589,["615"] = 591,["616"] = 593,["617"] = 593,["618"] = 593,["619"] = 594,["622"] = 596,["623"] = 598,["626"] = 602,["627"] = 602,["628"] = 602,["630"] = 602,["631"] = 602,["632"] = 602,["634"] = 603,["635"] = 603,["636"] = 603,["638"] = 603,["639"] = 603,["640"] = 603,["642"] = 604,["643"] = 604,["644"] = 604,["646"] = 604,["647"] = 604,["648"] = 604,["650"] = 605,["651"] = 605,["652"] = 605,["654"] = 605,["655"] = 605,["656"] = 605,["658"] = 606,["659"] = 606,["660"] = 606,["662"] = 606,["663"] = 606,["664"] = 606,["666"] = 607,["667"] = 607,["668"] = 607,["670"] = 607,["671"] = 607,["672"] = 607,["674"] = 601,["675"] = 601,["676"] = 601,["677"] = 601,["678"] = 601,["679"] = 601,["680"] = 601,["681"] = 601,["682"] = 609,["683"] = 610,["684"] = 611,["685"] = 612,["686"] = 613,["687"] = 613,["688"] = 613,["690"] = 614,["691"] = 614,["692"] = 614,["694"] = 600,["695"] = 600,["696"] = 600,["697"] = 600,["698"] = 600,["699"] = 600,["700"] = 600,["701"] = 600,["702"] = 600,["703"] = 617,["704"] = 620,["705"] = 620,["706"] = 620,["707"] = 621,["708"] = 623,["711"] = 625,["712"] = 626,["713"] = 626,["714"] = 626,["716"] = 626,["718"] = 629,["719"] = 620,["720"] = 620,["722"] = 633,["723"] = 593,["724"] = 593,["725"] = 636,["726"] = 588,["727"] = 639,["728"] = 640,["729"] = 642,["730"] = 642,["731"] = 642,["732"] = 643,["733"] = 645,["734"] = 645,["735"] = 645,["736"] = 645,["737"] = 655,["738"] = 655,["739"] = 655,["740"] = 655,["741"] = 657,["742"] = 642,["743"] = 642,["744"] = 639,["745"] = 661,["746"] = 662,["747"] = 664,["748"] = 666,["749"] = 667,["750"] = 668,["751"] = 669,["752"] = 670,["753"] = 671,["754"] = 672,["755"] = 674,["756"] = 675,["757"] = 676,["758"] = 677,["759"] = 678,["760"] = 680,["761"] = 681,["762"] = 682,["763"] = 684,["765"] = 687,["766"] = 688,["768"] = 690,["769"] = 690,["770"] = 690,["771"] = 691,["772"] = 691,["773"] = 691,["774"] = 692,["775"] = 691,["776"] = 691,["777"] = 690,["778"] = 690,["779"] = 661,["780"] = 697,["781"] = 698,["782"] = 700,["784"] = 701,["785"] = 701,["786"] = 702,["787"] = 703,["788"] = 704,["789"] = 705,["791"] = 707,["793"] = 701,["796"] = 711,["797"] = 712,["798"] = 713,["799"] = 715,["800"] = 716,["801"] = 718,["802"] = 719,["803"] = 723,["804"] = 724,["805"] = 726,["806"] = 728,["807"] = 728,["808"] = 728,["809"] = 729,["812"] = 731,["813"] = 732,["814"] = 732,["816"] = 734,["817"] = 728,["818"] = 728,["819"] = 723,["820"] = 738,["821"] = 738,["822"] = 738,["823"] = 739,["824"] = 739,["826"] = 740,["827"] = 740,["829"] = 742,["830"] = 743,["831"] = 745,["832"] = 746,["833"] = 747,["834"] = 748,["835"] = 749,["836"] = 750,["837"] = 751,["838"] = 752,["839"] = 738,["840"] = 738,["842"] = 697,["843"] = 757,["844"] = 758,["845"] = 760,["846"] = 760,["847"] = 760,["848"] = 761,["849"] = 762,["850"] = 763,["851"] = 760,["852"] = 760,["853"] = 760,["854"] = 760,["855"] = 768,["856"] = 769,["857"] = 770,["859"] = 773,["860"] = 774,["861"] = 775,["862"] = 776,["863"] = 777,["865"] = 774,["866"] = 780,["867"] = 781,["868"] = 783,["869"] = 784,["870"] = 786,["871"] = 787,["872"] = 789,["873"] = 790,["875"] = 786,["876"] = 799,["877"] = 800,["878"] = 802,["879"] = 803,["881"] = 806,["882"] = 806,["883"] = 806,["884"] = 806,["885"] = 808,["886"] = 809,["887"] = 810,["888"] = 810,["889"] = 810,["890"] = 811,["891"] = 811,["892"] = 811,["893"] = 811,["894"] = 811,["895"] = 810,["896"] = 810,["898"] = 757,["899"] = 816,["900"] = 817,["901"] = 819,["902"] = 821,["903"] = 822,["904"] = 822,["905"] = 822,["906"] = 822,["907"] = 824,["908"] = 826,["909"] = 827,["911"] = 830,["912"] = 831,["914"] = 816,["915"] = 835,["916"] = 836,["917"] = 835,["918"] = 839,["919"] = 840,["920"] = 842,["921"] = 843,["922"] = 844,["923"] = 846,["924"] = 847,["925"] = 849,["929"] = 859,["930"] = 839,["931"] = 862,["932"] = 863,["933"] = 865,["934"] = 866,["935"] = 867,["936"] = 868,["939"] = 870,["940"] = 872,["941"] = 873,["942"] = 874,["943"] = 875,["945"] = 877,["946"] = 877,["947"] = 877,["948"] = 877,["949"] = 878,["952"] = 862,["953"] = 883,["954"] = 884,["955"] = 883,["956"] = 887,["957"] = 888,["958"] = 890,["959"] = 891,["962"] = 893,["963"] = 894,["964"] = 895,["967"] = 897,["968"] = 898,["970"] = 887,["971"] = 902,["972"] = 903,["973"] = 904,["974"] = 906,["975"] = 908,["976"] = 909,["977"] = 910,["978"] = 911,["980"] = 914,["981"] = 914,["983"] = 916,["984"] = 917,["985"] = 918,["986"] = 919,["988"] = 922,["989"] = 923,["990"] = 924,["991"] = 926,["992"] = 927,["994"] = 902,["995"] = 936,["996"] = 937,["997"] = 939,["998"] = 946,["999"] = 946,["1000"] = 946,["1001"] = 946,["1002"] = 946,["1003"] = 948,["1004"] = 949,["1005"] = 950,["1007"] = 952,["1009"] = 946,["1010"] = 946,["1011"] = 936,["1012"] = 956,["1013"] = 957,["1014"] = 959,["1015"] = 960,["1016"] = 961,["1017"] = 956,["1018"] = 966,["1019"] = 967,["1020"] = 968,["1021"] = 968,["1022"] = 968,["1023"] = 968,["1024"] = 970,["1025"] = 971,["1027"] = 973,["1029"] = 966,["1030"] = 977,["1031"] = 978,["1032"] = 980,["1033"] = 980,["1034"] = 980,["1035"] = 981,["1038"] = 983,["1039"] = 985,["1040"] = 980,["1041"] = 980,["1042"] = 977,["1043"] = 994,["1044"] = 995,["1045"] = 997,["1046"] = 997,["1047"] = 997,["1048"] = 998,["1051"] = 1000,["1052"] = 1000,["1053"] = 1000,["1054"] = 1001,["1055"] = 1003,["1056"] = 1004,["1057"] = 1005,["1058"] = 1006,["1059"] = 1008,["1060"] = 1008,["1061"] = 1008,["1062"] = 1008,["1063"] = 1008,["1064"] = 1008,["1065"] = 1008,["1066"] = 1009,["1067"] = 1009,["1068"] = 1009,["1069"] = 1009,["1070"] = 1009,["1071"] = 1009,["1072"] = 1009,["1074"] = 1000,["1075"] = 1000,["1076"] = 1013,["1077"] = 997,["1078"] = 997,["1079"] = 994,["1080"] = 1017,["1081"] = 1018,["1082"] = 1020,["1083"] = 1020,["1084"] = 1020,["1085"] = 1021,["1088"] = 1023,["1089"] = 1020,["1090"] = 1020,["1091"] = 1017,["1092"] = 77,["1093"] = 78});
local ____exports = {}
local ____tstl_2Dutils = require("lib.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____old_tinker_high_five = require("abilities.generic.old_tinker_high_five")
local old_tinker_high_five = ____old_tinker_high_five.old_tinker_high_five
local ____modifier_bot_difficulty_custom = require("abilities.generic.modifier_bot_difficulty_custom")
local modifier_bot_difficulty_custom = ____modifier_bot_difficulty_custom.modifier_bot_difficulty_custom
local ____modifier_turbo_mode_values = require("abilities.generic.modifier_turbo_mode_values")
local modifier_turbo_mode_values = ____modifier_turbo_mode_values.modifier_turbo_mode_values
local ____modifier_fountain_aura_custom = require("abilities.generic.modifier_fountain_aura_custom")
local modifier_fountain_aura_custom = ____modifier_fountain_aura_custom.modifier_fountain_aura_custom
local ____modifier_outpost_aura_custom = require("abilities.generic.modifier_outpost_aura_custom")
local modifier_outpost_aura_custom = ____modifier_outpost_aura_custom.modifier_outpost_aura_custom
local ____modifier_invulnerable_custom = require("abilities.generic.modifier_invulnerable_custom")
local modifier_invulnerable_custom = ____modifier_invulnerable_custom.modifier_invulnerable_custom
local ____precache = require("lib.precache")
local PrecacheResources = ____precache.PrecacheResources
local ____patch_manager = require("lib.patch_manager")
local PatchManager = ____patch_manager.PatchManager
local ____ability_textures = require("lib.ability_textures")
local AbilityTextureManager = ____ability_textures.AbilityTextureManager
local ____custom_chat = require("lib.custom_chat")
local CustomChat = ____custom_chat.CustomChat
local ____unique_portraits = require("lib.unique_portraits")
local UniquePortraits = ____unique_portraits.UniquePortraits
local ____neutral_camps = require("lib.neutral_camps")
local NeutralCamps = ____neutral_camps.NeutralCamps
local ____command_manager = require("lib.command_manager")
local ChatCommand = ____command_manager.ChatCommand
local CommandManager = ____command_manager.CommandManager
local ____dota = require("maps.dota")
local DotaMap = ____dota.DotaMap
local ____dota_728 = require("maps.dota_728")
local Dota728Map = ____dota_728.Dota728Map
local ____debug = IsInToolsMode() and true
local BOT_DIFFICULTIES = {[0] = {gold_multiplier = 0.5, xp_multiplier = 0.5}, [1] = {gold_multiplier = 1, xp_multiplier = 1}, [2] = {gold_multiplier = 1.5, xp_multiplier = 1.5}, [3] = {gold_multiplier = 2, xp_multiplier = 2}}
local maps = {
    __TS__New(DotaMap),
    __TS__New(Dota728Map)
}
local bot_difficulty
local bot_bonuses
local selectedPatch = {}
____exports.GameMode = __TS__Class()
local GameMode = ____exports.GameMode
GameMode.name = "GameMode"
function GameMode.prototype.____constructor(self)
    self.AllPickBanTime = 20
    self.TurboBanTime = 14
    self.SoloMidBanTime = 0
    GameModeEntity = GameRules:GetGameModeEntity()
    self.mapSettings = __TS__ArrayFind(
        maps,
        function(____, map) return map.name == GetMapName() end
    ) or __TS__New(DotaMap)
    self:configure()
    self:ListenGameEvents()
    self:ListenCustomEvents()
    self:RegisterCommands()
    self:SetModifyFilters()
end
function GameMode.Precache(context)
    PrecacheResources(nil, context)
end
function GameMode.Activate()
    require("lib.filters")
    GameRules.Addon = __TS__New(____exports.GameMode)
    SendToServerConsole("tv_delay 0")
    if ____debug then
        SendToServerConsole("dota_easybuy 1")
    end
    CustomNetTables:SetTableValue("settings", "updated", SETTINGS)
    PatchManager:LoadPatches()
end
function GameMode.prototype.ListenGameEvents(self)
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:OnStateChange() end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:OnNpcSpawned(event) end,
        nil
    )
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:OnEntityKilled(event) end,
        nil
    )
    ListenToGameEvent(
        "player_chat",
        function(event) return self:OnPlayerChat(event) end,
        nil
    )
    ListenToGameEvent(
        "dota_player_learned_ability",
        function(event) return self:OnAbilityLearned(event) end,
        nil
    )
end
function GameMode.prototype.ListenCustomEvents(self)
    CustomGameEventManager:RegisterListener(
        "setting_changed",
        function(_, event)
            if event.PlayerID == nil then
                return
            end
            local player = PlayerResource:GetPlayer(event.PlayerID)
            if not player then
                return
            end
            local isHost = GameRules:PlayerHasCustomGameHostPrivileges(player)
            if not isHost then
                return
            end
            local setting = __TS__StringSplit(event.setting, "&")[2]
            Settings.QuickKeys[setting] = event.value
            CustomNetTables:SetTableValue("settings", "updated", SETTINGS)
        end
    )
    CustomGameEventManager:RegisterListener(
        "select_patch",
        function(_, event)
            local ____event_0 = event
            local PlayerID = ____event_0.PlayerID
            local hero = ____event_0.hero
            local patch = ____event_0.patch
            if PlayerID == nil then
                return
            end
            if not PlayerResource:IsValidPlayerID(PlayerID) then
                return
            end
            selectedPatch[hero] = patch
            CustomNetTables:SetTableValue("selected_patches", event.hero, {value = patch})
        end
    )
    CustomGameEventManager:RegisterListener(
        "select_item_patch",
        function(_, event)
            if event.PlayerID == nil then
                return
            end
            if not PlayerResource:IsValidPlayerID(event.PlayerID) then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(event.PlayerID)
            if not hero then
                return
            end
            PatchManager:ReplaceHeroItem(hero, event.item, event.patch, event.slot)
        end
    )
    CustomGameEventManager:RegisterListener(
        "activate_ability",
        function(_, event)
            if event.PlayerID == nil then
                return
            end
            if not PlayerResource:IsValidPlayerID(event.PlayerID) then
                return
            end
            local caster = EntIndexToHScript(event.entindex)
            if not caster then
                return
            end
            local ability = caster:FindAbilityByName(event.abilityName)
            if not ability or not ability.OnActivate then
                return
            end
            if not caster:IsAlive() or not ability:IsFullyCastable() then
                return
            end
            ability:OnActivate()
            ability:UseResources(true, false, false, true)
        end
    )
    CustomGameEventManager:RegisterListener(
        "debug_give_item",
        function(_, event)
            local ____event_1 = event
            local PlayerID = ____event_1.PlayerID
            local item = ____event_1.item
            if PlayerID == nil then
                return
            end
            if not PlayerResource:IsValidPlayerID(PlayerID) then
                return
            end
            if not GameRules:IsCheatMode() then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(PlayerID)
            if not hero then
                return
            end
            hero:AddItemByName(item)
        end
    )
    CustomGameEventManager:RegisterListener(
        "scepter_ping",
        function(_, event)
            local ____event_2 = event
            local PlayerID = ____event_2.PlayerID
            local token = ____event_2.token
            local color = ____event_2.color
            local unit_name = ____event_2.unit_name
            local abilities = ____event_2.abilities
            if PlayerID == nil then
                return
            end
            if not PlayerResource:IsValidPlayerID(PlayerID) then
                return
            end
            local team = PlayerResource:GetTeam(PlayerID)
            CustomChat:MessageToTeam(
                PlayerID,
                false,
                team,
                token,
                {hard_replace = {["%s1"] = abilities, ["%s3"] = "%ARROW%", ["%s4"] = color, ["%s5"] = "#" .. unit_name}, players = {}, not_localize = {}},
                true,
                false
            )
        end
    )
    CustomGameEventManager:RegisterListener(
        "player_tip",
        function(_, event)
            local ____event_3 = event
            local PlayerID = ____event_3.PlayerID
            local target = ____event_3.target
            if PlayerID == nil or target == nil then
                return
            end
            local player_team = PlayerResource:GetTeam(PlayerID)
            local target_team = PlayerResource:GetTeam(target)
            local playerString = tostring(PlayerID)
            local ____opt_4 = CustomNetTables:GetTableValue("units", playerString)
            local cooldown = ____opt_4 and ____opt_4.tip_cooldown
            if cooldown ~= nil and cooldown > 0 then
                return
            end
            CustomNetTables:SetTableValue("units", playerString, {tip_cooldown = ____debug and 5 or 15})
            Timers:CreateTimer({
                endTime = 1,
                useGameTime = false,
                callback = function()
                    local cooldown = CustomNetTables:GetTableValue("units", playerString).tip_cooldown - 1
                    CustomNetTables:SetTableValue("units", playerString, {tip_cooldown = cooldown})
                    if cooldown <= 0 then
                        return
                    end
                    return 1
                end
            })
            local selected_hero = PlayerResource:GetSelectedHeroEntity(target)
            if selected_hero then
                __TS__ArrayForEach(
                    __TS__ArrayFilter(
                        FindUnitsInRadius(
                            target_team,
                            Vector(0, 0, 0),
                            nil,
                            FIND_UNITS_EVERYWHERE,
                            1,
                            1,
                            bit.bor(
                                bit.bor(262144, 64),
                                8
                            ),
                            0,
                            false
                        ),
                        function(____, hero) return hero:IsHero() and hero:GetPlayerOwnerID() == target and hero:GetUnitName() == selected_hero:GetUnitName() end
                    ),
                    function(____, hero)
                        local particle = ParticleManager:CreateParticle("particles/prime/tip_player_shards_lvl2.vpcf", PATTACH_ABSORIGIN_FOLLOW, hero)
                        ParticleManager:ReleaseParticleIndex(particle)
                    end
                )
            end
            if player_team == target_team then
                CustomGameEventManager:Send_ServerToTeam(player_team, "player_tipped", {player = PlayerID, target = target, amount = 50})
            else
                CustomGameEventManager:Send_ServerToAllClients("player_tipped", {player = PlayerID, target = target, amount = 50})
            end
            local token = {
                hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>"},
                players = {[target] = CustomChat:Player(1)}
            }
            if player_team == target_team then
                CustomChat:MessageToTeam(
                    PlayerID,
                    true,
                    player_team,
                    "DOTA_PlayerSalute_ChatMessage",
                    token,
                    false,
                    false
                )
            else
                CustomChat:MessageToAll(
                    PlayerID,
                    true,
                    "DOTA_PlayerSalute_ChatMessage",
                    token,
                    false,
                    false
                )
            end
        end
    )
end
function GameMode.prototype.RegisterCommands(self)
    ChatCommand(
        nil,
        "souls",
        "Gives some souls for Shadow Fiend's Necromastery.",
        function(____, id, args)
            if #args == 0 then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(id)
            if not hero or hero:GetUnitName() ~= "npc_dota_hero_nevermore" then
                return
            end
            local count = __TS__ParseInt(args[1])
            local function modifySouls(____, modifierName)
                local modifier = hero:FindModifierByName(modifierName)
                if not modifier then
                    return
                end
                modifier:SetStackCount(count)
            end
            modifySouls(nil, "modifier_nevermore_necromastery")
            modifySouls(nil, "modifier_nevermore_necromastery_custom_728")
        end,
        1
    )
    ChatCommand(
        nil,
        "push",
        "Destroys all towers on the map.",
        function(____, playerId)
            local attacker = PlayerResource:GetSelectedHeroEntity(playerId)
            if not attacker then
                return
            end
            local buildings = __TS__ArrayFilter(
                FindUnitsInRadius(
                    attacker:GetTeamNumber(),
                    Vector(0, 0, 0),
                    nil,
                    FIND_UNITS_EVERYWHERE,
                    3,
                    4,
                    64,
                    1,
                    false
                ),
                function(____, building) return building:IsTower() end
            )
            local i = 0
            Timers:CreateTimer(
                0.1,
                function()
                    local building = buildings[i + 1]
                    if not building then
                        return
                    end
                    building:Kill(nil, attacker)
                    i = i + 1
                    return 0.1
                end
            )
        end,
        2
    )
end
function GameMode.prototype.SetModifyFilters(self)
    GameModeEntity:SetModifyGoldFilter(
        function(____, event) return self:GoldFilter(event) end,
        self
    )
    GameModeEntity:SetBountyRunePickupFilter(
        function(____, event) return self:BountyPickUp(event) end,
        self
    )
    GameModeEntity:SetModifyExperienceFilter(
        function(____, event) return self:XpFilter(event) end,
        self
    )
    GameModeEntity:SetExecuteOrderFilter(
        function(____, event) return self:OnOrderFilter(event) end,
        self
    )
end
function GameMode.prototype.GoldFilter(self, event)
    local allowedReasons = {
        DOTA_ModifyGold_GameTick,
        DOTA_ModifyGold_Building,
        DOTA_ModifyGold_HeroKill,
        DOTA_ModifyGold_CreepKill,
        DOTA_ModifyGold_NeutralKill,
        DOTA_ModifyGold_RoshanKill,
        DOTA_ModifyGold_CourierKill,
        DOTA_ModifyGold_BountyRune,
        DOTA_ModifyGold_SharedGold,
        DOTA_ModifyGold_WardKill,
        DOTA_ModifyGold_CourierKilledByThisPlayer
    }
    if not __TS__ArrayIncludes(allowedReasons, event.reason_const) then
        return true
    end
    if GameRules:IsTurboMode() then
        event.gold = event.gold * 2
    end
    local hero = PlayerResource:GetSelectedHeroEntity(event.player_id_const)
    if hero and hero.custom_data.is_bot and bot_bonuses then
        event.gold = event.gold * bot_bonuses.gold_multiplier
    end
    return true
end
function GameMode.prototype.BountyPickUp(self, event)
    if GameRules:IsTurboMode() then
        event.gold_bounty = event.gold_bounty * 2
    end
    local hero = PlayerResource:GetSelectedHeroEntity(event.player_id_const)
    if hero and hero.custom_data.is_bot and bot_bonuses then
        event.gold_bounty = event.gold_bounty * bot_bonuses.gold_multiplier
    end
    return true
end
function GameMode.prototype.XpFilter(self, event)
    if GameRules:IsTurboMode() then
        event.experience = event.experience * 2
    end
    local hero = PlayerResource:GetSelectedHeroEntity(event.player_id_const)
    if hero and hero.custom_data.is_bot and bot_bonuses then
        event.experience = event.experience * bot_bonuses.xp_multiplier
    end
    return true
end
function GameMode.prototype.OnOrderFilter(self, event)
    local ____temp_6
    if event.entindex_target ~= 0 then
        ____temp_6 = EntIndexToHScript(event.entindex_target)
    else
        ____temp_6 = nil
    end
    local target = ____temp_6
    if GameRules:IsTurboMode() then
        if event.order_type == 42 then
            event.order_type = DOTA_UNIT_ORDER_SELL_ITEM
        end
    end
    if event.order_type == DOTA_UNIT_ORDER_PICKUP_RUNE and GameRules:GetDOTATime(false, false) < 0.1 then
        return false
    end
    local hero = PlayerResource:GetSelectedHeroEntity(event.issuer_player_id_const)
    if hero ~= nil then
        if hero:HasModifier("modifier_pangolier_gyroshell_custom_717") then
            local validOrder = {
                DOTA_UNIT_ORDER_ATTACK_TARGET,
                DOTA_UNIT_ORDER_MOVE_TO_TARGET,
                DOTA_UNIT_ORDER_MOVE_TO_POSITION,
                DOTA_UNIT_ORDER_ATTACK_MOVE,
                DOTA_UNIT_ORDER_PICKUP_ITEM,
                DOTA_UNIT_ORDER_PICKUP_RUNE,
                DOTA_UNIT_ORDER_MOVE_TO_DIRECTION
            }
            if __TS__ArrayIncludes(validOrder, event.order_type) then
                local pos = Vector(event.position_x, event.position_y, event.position_z)
                local modifier = hero:FindModifierByName("modifier_pangolier_gyroshell_custom_717")
                modifier:OnOrderCustom(pos, target)
                return false
            end
        end
    end
    return true
end
function GameMode.prototype.configure(self)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 5)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 5)
    GameModeEntity:SetFreeCourierModeEnabled(true)
    GameModeEntity:SetUseDefaultDOTARuneSpawnLogic(true)
    GameModeEntity:SetBountyRuneSpawnInterval(240)
    GameModeEntity:SetTowerBackdoorProtectionEnabled(true)
    GameModeEntity:SetDaynightCycleAdvanceRate(1)
    GameModeEntity:SetRespawnTimeScale(1)
    GameModeEntity:SetBotThinkingEnabled(false)
    GameRules:SetGoldPerTick(1)
    GameRules:SetGoldTickTime(0.67)
    GameModeEntity:SetDraftingHeroPickSelectTimeOverride(110)
    GameModeEntity:SetDraftingBanningTimeOverride(____debug and 0 or self.AllPickBanTime)
    GameRules:SetStrategyTime(____debug and 9999 or 25)
    GameRules:SetPostGameTime(180)
    GameRules:SetPreGameTime(90)
    GameRules:SetCreepSpawningEnabled(not ____debug)
    GameRules:SetFilterMoreGold(true)
    GameRules:SetSafeToLeave(true)
    GameRules:SetPostGameLayout(DOTA_POST_GAME_LAYOUT_SINGLE_COLUMN)
    GameRules:SetPostGameColumns({
        DOTA_POST_GAME_COLUMN_LEVEL,
        DOTA_POST_GAME_COLUMN_KILLS,
        DOTA_POST_GAME_COLUMN_DEATHS,
        DOTA_POST_GAME_COLUMN_ASSISTS,
        DOTA_POST_GAME_COLUMN_NET_WORTH,
        DOTA_POST_GAME_COLUMN_LAST_HITS,
        DOTA_POST_GAME_COLUMN_DENIES,
        DOTA_POST_GAME_COLUMN_DAMAGE,
        DOTA_POST_GAME_COLUMN_HEALING
    })
    if self.mapSettings.name ~= "dota" then
        GameModeEntity:SetCustomScanMaxCharges(1)
        GameModeEntity:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MAGIC_RESIST, 0)
    end
    __TS__ArrayForEach(
        PatchManager:GetHeroes(),
        function(____, hero)
            GameRules:AddHeroToBlacklist(hero)
        end
    )
end
function GameMode.prototype.OnStateChange(self)
    local state = GameRules:State_Get()
    repeat
        local ____switch88 = state
        local ____cond88 = ____switch88 == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP
        if ____cond88 then
            do
                Timers:CreateTimer(
                    0.2,
                    function() return self:GameSetup() end
                )
                break
            end
        end
        ____cond88 = ____cond88 or ____switch88 == DOTA_GAMERULES_STATE_HERO_SELECTION
        if ____cond88 then
            do
                Timers:CreateTimer(
                    0.2,
                    function() return self:HeroSelection() end
                )
                break
            end
        end
        ____cond88 = ____cond88 or ____switch88 == DOTA_GAMERULES_STATE_STRATEGY_TIME
        if ____cond88 then
            do
                Timers:CreateTimer(
                    0.2,
                    function() return self:StrategyTime() end
                )
                break
            end
        end
        ____cond88 = ____cond88 or ____switch88 == DOTA_GAMERULES_STATE_PRE_GAME
        if ____cond88 then
            do
                Timers:CreateTimer(
                    0.2,
                    function() return self:PreGame() end
                )
                break
            end
        end
        ____cond88 = ____cond88 or ____switch88 == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
        if ____cond88 then
            do
                if self.mapSettings.name ~= "dota" then
                    self:RemoveDefaultBounty()
                end
                Timers:CreateTimer(
                    0.2,
                    function() return self:StartGame() end
                )
                break
            end
        end
        do
            break
        end
    until true
end
function GameMode.prototype.GameSetup(self)
    print("Game setuping!")
    self:LoadHeroKeyValues()
    if GameRules:IsTurboMode() then
        GameModeEntity:SetDraftingBanningTimeOverride(____debug and 0 or self.TurboBanTime)
    end
end
function GameMode.prototype.ParseAbilityKV(self, ability_keys, ability_file)
    if #ability_keys == 0 then
        return {}
    end
    local abilities = {}
    __TS__ArrayForEach(
        ability_keys,
        function(____, ability_name)
            if ability_name == "Version" or __TS__StringStartsWith(ability_name, "special_bonus_unique_") then
                return
            end
            local ability_value = ability_file[ability_name]
            if ability_value.AbilityValues == nil then
                return
            end
            local ____ability_value_AbilityValues_AbilityCastRange_7 = ability_value.AbilityValues.AbilityCastRange
            if ____ability_value_AbilityValues_AbilityCastRange_7 == nil then
                ____ability_value_AbilityValues_AbilityCastRange_7 = ability_value.AbilityCastRange
            end
            local ____ability_value_AbilityValues_AbilityCastRange_7_8 = ____ability_value_AbilityValues_AbilityCastRange_7
            if ____ability_value_AbilityValues_AbilityCastRange_7_8 == nil then
                ____ability_value_AbilityValues_AbilityCastRange_7_8 = 0
            end
            local ____ability_value_AbilityValues_AbilityCooldown_9 = ability_value.AbilityValues.AbilityCooldown
            if ____ability_value_AbilityValues_AbilityCooldown_9 == nil then
                ____ability_value_AbilityValues_AbilityCooldown_9 = ability_value.AbilityCooldown
            end
            local ____ability_value_AbilityValues_AbilityCooldown_9_10 = ____ability_value_AbilityValues_AbilityCooldown_9
            if ____ability_value_AbilityValues_AbilityCooldown_9_10 == nil then
                ____ability_value_AbilityValues_AbilityCooldown_9_10 = 0
            end
            local ____ability_value_AbilityValues_AbilityManaCost_11 = ability_value.AbilityValues.AbilityManaCost
            if ____ability_value_AbilityValues_AbilityManaCost_11 == nil then
                ____ability_value_AbilityValues_AbilityManaCost_11 = ability_value.AbilityManaCost
            end
            local ____ability_value_AbilityValues_AbilityManaCost_11_12 = ____ability_value_AbilityValues_AbilityManaCost_11
            if ____ability_value_AbilityValues_AbilityManaCost_11_12 == nil then
                ____ability_value_AbilityValues_AbilityManaCost_11_12 = 0
            end
            local ____ability_value_AbilityValues_AbilityHealthCost_13 = ability_value.AbilityValues.AbilityHealthCost
            if ____ability_value_AbilityValues_AbilityHealthCost_13 == nil then
                ____ability_value_AbilityValues_AbilityHealthCost_13 = ability_value.AbilityHealthCost
            end
            local ____ability_value_AbilityValues_AbilityHealthCost_13_14 = ____ability_value_AbilityValues_AbilityHealthCost_13
            if ____ability_value_AbilityValues_AbilityHealthCost_13_14 == nil then
                ____ability_value_AbilityValues_AbilityHealthCost_13_14 = 0
            end
            local ____ability_value_AbilityValues_AbilityDamage_15 = ability_value.AbilityValues.AbilityDamage
            if ____ability_value_AbilityValues_AbilityDamage_15 == nil then
                ____ability_value_AbilityValues_AbilityDamage_15 = ability_value.AbilityDamage
            end
            local ____ability_value_AbilityValues_AbilityDamage_15_16 = ____ability_value_AbilityValues_AbilityDamage_15
            if ____ability_value_AbilityValues_AbilityDamage_15_16 == nil then
                ____ability_value_AbilityValues_AbilityDamage_15_16 = 0
            end
            local ____ability_value_AbilityValues_AbilityDuration_17 = ability_value.AbilityValues.AbilityDuration
            if ____ability_value_AbilityValues_AbilityDuration_17 == nil then
                ____ability_value_AbilityValues_AbilityDuration_17 = ability_value.AbilityDuration
            end
            local ____ability_value_AbilityValues_AbilityDuration_17_18 = ____ability_value_AbilityValues_AbilityDuration_17
            if ____ability_value_AbilityValues_AbilityDuration_17_18 == nil then
                ____ability_value_AbilityValues_AbilityDuration_17_18 = 0
            end
            local ____temp_21 = {
                AbilityCastRange = ____ability_value_AbilityValues_AbilityCastRange_7_8,
                AbilityCooldown = ____ability_value_AbilityValues_AbilityCooldown_9_10,
                AbilityManaCost = ____ability_value_AbilityValues_AbilityManaCost_11_12,
                AbilityHealthCost = ____ability_value_AbilityValues_AbilityHealthCost_13_14,
                AbilityDamage = ____ability_value_AbilityValues_AbilityDamage_15_16,
                AbilityDuration = ____ability_value_AbilityValues_AbilityDuration_17_18
            }
            local ____BoolToNum_result_22 = BoolToNum(nil, ability_value.IsGrantedByScepter)
            local ____BoolToNum_result_23 = BoolToNum(nil, ability_value.IsGrantedByShard)
            local ____BoolToNum_result_24 = BoolToNum(nil, ability_value.HasScepterUpgrade)
            local ____BoolToNum_result_25 = BoolToNum(nil, ability_value.HasShardUpgrade)
            local ____ability_value_ShardRequiredFacet_19 = ability_value.ShardRequiredFacet
            if ____ability_value_ShardRequiredFacet_19 == nil then
                ____ability_value_ShardRequiredFacet_19 = ""
            end
            local ____ability_value_ScepterRequiredFacet_20 = ability_value.ScepterRequiredFacet
            if ____ability_value_ScepterRequiredFacet_20 == nil then
                ____ability_value_ScepterRequiredFacet_20 = ""
            end
            local ability = {
                AbilityValues = ____temp_21,
                IsGrantedByScepter = ____BoolToNum_result_22,
                IsGrantedByShard = ____BoolToNum_result_23,
                HasScepterUpgrade = ____BoolToNum_result_24,
                HasShardUpgrade = ____BoolToNum_result_25,
                ShardRequiredFacet = ____ability_value_ShardRequiredFacet_19,
                ScepterRequiredFacet = ____ability_value_ScepterRequiredFacet_20
            }
            if ability_value.AbilityValues then
                __TS__ArrayForEach(
                    __TS__ObjectKeys(ability_value.AbilityValues),
                    function(____, key)
                        local value = ability_value.AbilityValues[key]
                        if value == nil then
                            return
                        end
                        if type(value) == "table" then
                            local ____value_value_26 = value.value
                            if ____value_value_26 == nil then
                                ____value_value_26 = 0
                            end
                            value.value = ____value_value_26
                        end
                        ability.AbilityValues[key] = value
                    end
                )
            end
            abilities[ability_name] = ability
        end
    )
    return abilities
end
function GameMode.prototype.LoadHeroKeyValues(self)
    local heroes = __TS__ObjectKeys(LoadKeyValues("scripts/npc/activelist.txt"))
    __TS__ArrayForEach(
        heroes,
        function(____, hero)
            local hero_file = LoadKeyValues(("scripts/npc/heroes/" .. hero) .. ".txt")
            local hero_patch_file = __TS__ArrayIncludes(
                PatchManager:GetHeroes(),
                hero
            ) and (LoadKeyValues(("scripts/npc/heroes/" .. hero) .. "/abilities.kv") or ({})) or ({})
            local abilities = self:ParseAbilityKV(
                __TS__ObjectKeys(hero_patch_file),
                hero_patch_file
            )
            CustomNetTables:SetTableValue("abilities", hero, abilities)
        end
    )
end
function GameMode.prototype.HeroSelection(self)
    print("Hero picking!")
    local delay = self.AllPickBanTime
    if GameRules:IsTurboMode() then
        GameRules:SetUseUniversalShopMode(true)
        GameRules:SetGoldPerTick(2)
        GameRules:SetGoldTickTime(0.67)
        GameRules:SetStrategyTime(____debug and 9999 or 20)
        GameRules:SetPostGameTime(180)
        GameRules:SetPreGameTime(60)
        GameModeEntity:SetLoseGoldOnDeath(false)
        GameModeEntity:SetDraftingHeroPickSelectTimeOverride(40)
        GameModeEntity:SetUseTurboCouriers(true)
        GameModeEntity:SetCanSellAnywhere(true)
        GameModeEntity:SetRespawnTimeScale(0.75)
        delay = self.TurboBanTime
    elseif GameRules:GetGameModeType() == "SM" then
        GameModeEntity:SetDraftingBanningTimeOverride(self.SoloMidBanTime)
        delay = self.SoloMidBanTime
    end
    if ____debug then
        delay = 0
    end
    Timers:CreateTimer(
        delay + 0.125 + FrameTime(),
        function()
            __TS__ArrayForEach(
                PatchManager:GetHeroes(),
                function(____, hero)
                    GameRules:RemoveHeroFromBlacklist(hero)
                end
            )
        end
    )
end
function GameMode.prototype.StrategyTime(self)
    print("Hero strategy!")
    local lastHeroName = "npc_dota_hero_luna"
    do
        local i = 0
        while i < 5 do
            if PlayerResource:IsValidPlayer(i) then
                local player = PlayerResource:GetPlayer(i)
                if player and PlayerResource:HasSelectedHero(i) == false then
                    player:MakeRandomHeroSelection()
                end
                lastHeroName = PlayerResource:GetSelectedHeroName(i)
            end
            i = i + 1
        end
    end
    local radiantBots = Settings:GetQuick("RADIANT_BOTS") == 1
    local direBots = Settings:GetQuick("DIRE_BOTS") == 1
    local difficulty = Settings:GetQuick("BOTS_DIFFICULTY")
    bot_difficulty = __TS__ParseInt(difficulty)
    bot_bonuses = BOT_DIFFICULTIES[bot_difficulty]
    if Settings:GetQuick("USE_BOTS") == 1 and (radiantBots or direBots) then
        local maxBots = GameRules:GetGameModeType() == "SM" and 1 or 5
        local function addBots(____, team)
            local i = maxBots - PlayerResource:GetPlayerCountForTeam(team)
            local goodTeam = team == DOTA_TEAM_GOODGUYS
            Timers:CreateTimer(
                0.1,
                function()
                    if i <= 0 then
                        return
                    end
                    local botAdded = Tutorial:AddBot(lastHeroName, "", "", goodTeam)
                    if botAdded then
                        i = i - 1
                    end
                    return 0.1
                end
            )
        end
        Timers:CreateTimer(
            0.5,
            function()
                if radiantBots then
                    addBots(nil, DOTA_TEAM_GOODGUYS)
                end
                if direBots then
                    addBots(nil, DOTA_TEAM_BADGUYS)
                end
                GameModeEntity:SetBotThinkingEnabled(true)
                GameModeEntity:SetBotsAlwaysPushWithHuman(true)
                SendToServerConsole("dota_bot_set_difficulty " .. difficulty)
                SendToServerConsole("dota_bot_mode 1")
                SendToServerConsole("dota_bot_disable 0")
                SendToServerConsole("dota_bot_takeover_disconnected 1")
                SendToServerConsole("dota_bot_practice_difficulty 3")
                SendToServerConsole("dota_bot_match_difficulty 3")
                SendToServerConsole("dota_bot_practice_start 1")
                SendToServerConsole("dota_bot_use_machine_learned_weights 1")
            end
        )
    end
end
function GameMode.prototype.PreGame(self)
    print("Pre-game starting!")
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            HeroList:GetAllHeroes(),
            function(____, hero)
                local playerID = hero:GetPlayerID()
                return PlayerResource:IsValidPlayer(playerID) and PlayerResource:IsFakeClient(playerID)
            end
        ),
        function(____, hero) return hero:SetBotDifficulty(bot_difficulty) end
    )
    if self.mapSettings.name ~= "dota" then
        self:ChangeFountainBuff()
        self:SetOutpostVision()
    end
    if GameRules:GetGameModeType() == "SM" then
        local function deleteSpawner(____, name)
            local entity = Entities:FindByClassname(nil, name)
            if entity then
                UTIL_Remove(entity)
            end
        end
        deleteSpawner(nil, "npc_dota_spawner_good_top")
        deleteSpawner(nil, "npc_dota_spawner_good_bot")
        deleteSpawner(nil, "npc_dota_spawner_bad_bot")
        deleteSpawner(nil, "npc_dota_spawner_bad_top")
        local function invulnerableTower(____, name)
            local tower = Entities:FindByName(nil, name)
            if tower and tower:IsBaseNPC() then
                modifier_invulnerable_custom:apply(tower, tower, nil, {})
            end
        end
        invulnerableTower(nil, "dota_badguys_tower1_top")
        invulnerableTower(nil, "dota_badguys_tower1_bot")
        invulnerableTower(nil, "dota_goodguys_tower1_top")
        invulnerableTower(nil, "dota_goodguys_tower1_bot")
    end
    local commands = __TS__ArrayFilter(
        CommandManager:GetCommands(),
        function(____, command) return command:CanBeRun() end
    )
    if #commands > 0 then
        GameRules:SendCustomMessage("Custom command list:", 0, 0)
        __TS__ArrayForEach(
            commands,
            function(____, command)
                GameRules:SendCustomMessage(
                    (("  -" .. command:getName()) .. " — ") .. command:getDescription(),
                    0,
                    0
                )
            end
        )
    end
end
function GameMode.prototype.StartGame(self)
    print("Game starting!")
    GameRules:SetTimeOfDay(0.25)
    NeutralCamps:Init()
    Timers:CreateTimer(
        60 - 0.2,
        function() return NeutralCamps:OnThink() end
    )
    self.mapSettings:StartGame()
    if self.mapSettings.name ~= "dota" then
        self.mapSettings.runeSpawner:StartCycle()
    end
    if ____debug then
        GameRules:SpawnNeutralCreeps()
    end
end
function GameMode.prototype.Reload(self)
    print("Script reloaded!")
end
function GameMode.prototype.OnNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if unit:IsRealHero() then
        if event.is_respawn == 0 then
            self:HeroUnitInit(unit)
            if PlayerResource:IsFakeClient(unit:GetPlayerID()) then
                unit.custom_data.is_bot = true
                modifier_bot_difficulty_custom:apply(unit, unit, nil, {}):SetStackCount(bot_difficulty or 1)
            end
        end
    end
    self.mapSettings:OnNpcSpawned(event)
end
function GameMode.prototype.OnEntityKilled(self, event)
    self.mapSettings.OnEntityKilled(self.mapSettings, event)
    if GameRules:GetGameModeType() == "SM" then
        local attacker = EntIndexToHScript(event.entindex_attacker)
        local unit = EntIndexToHScript(event.entindex_killed)
        if not attacker or not unit then
            return
        end
        local team = unit:GetTeamNumber()
        if unit:IsRealHero() then
            local kills = PlayerResource:GetTeamKills(attacker:GetTeamNumber())
            if kills >= 2 then
                self:DestroyAncient(team, attacker)
            end
        elseif unit:IsTower() and __TS__StringIncludes(
            unit:GetUnitName(),
            "tower1_mid"
        ) then
            self:DestroyAncient(team, attacker)
        end
    end
end
function GameMode.prototype.OnPlayerChat(self, event)
    CommandManager:ProcessChatEvent(event)
end
function GameMode.prototype.OnAbilityLearned(self, event)
    CustomGameEventManager:Send_ServerToAllClients("dota_hud_player_learned_ability", event)
    local hero = PlayerResource:GetSelectedHeroEntity(event.PlayerID)
    if not hero then
        return
    end
    if event.abilityname == "special_bonus_unique_sniper_722_custom_4" then
        local charges = hero:FindModifierByName("modifier_sniper_shrapnel_custom_722_charges")
        if not charges then
            return
        end
        charges:SetStackCount(charges:GetStackCount() + 6)
        charges:CalculateCharge()
    end
end
function GameMode.prototype.HeroUnitInit(self, hero)
    local unitName = hero:GetUnitName()
    local player_id = hero:GetPlayerID()
    hero.custom_data = {}
    if not hero:HasAbility(old_tinker_high_five.name) then
        local high_five = hero:AddAbility(old_tinker_high_five.name)
        high_five:SetLevel(1)
        high_five:SetHidden(true)
    end
    if ____debug then
        self:WearableDebugger(hero)
    end
    local patch = selectedPatch[unitName]
    if patch ~= nil then
        PatchManager:ReplaceHeroAbilities(hero, patch)
        selectedPatch[unitName] = nil
    end
    AbilityTextureManager:InitHero(hero)
    UniquePortraits:UpdatePortraitsDataFromPlayer(player_id)
    self:UpdateFacetData(hero)
    if GameRules:IsTurboMode() then
        modifier_turbo_mode_values:apply(hero, hero, nil, {})
    end
end
function GameMode.prototype.WearableDebugger(self, unit)
    local hero_name = unit:GetUnitName()
    local HASH_STYLES = {[1977497166] = 0, [1055040020] = 0, [628863847] = 1, [1347516877] = 2}
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            unit:GetWearables(),
            function(____, wearable) return wearable.modelName end
        ),
        function(____, wearable)
            if HASH_STYLES[wearable.material] ~= nil then
                print((((("[DEBUG] [" .. hero_name) .. "] - ") .. wearable.modelName) .. " - ") .. tostring(HASH_STYLES[wearable.material]))
            else
                print((("[DEBUG] [" .. hero_name) .. "] - ") .. wearable.modelName)
            end
        end
    )
end
function GameMode.prototype.UpdateFacetData(self, hero)
    local hero_name = hero:GetUnitName()
    local facets = CustomNetTables:GetTableValue("game", "facets") or ({})
    facets[hero_name] = hero:GetHeroFacetID()
    CustomNetTables:SetTableValue("game", "facets", facets)
end
function GameMode.prototype.DestroyAncient(self, team, killer)
    local ancients = Entities:FindAllByClassname("npc_dota_fort")
    local ancient = __TS__ArrayFind(
        ancients,
        function(____, ancient) return ancient:IsAlive() and ancient:GetTeamNumber() == team end
    )
    if ancient then
        ancient:Kill(nil, killer)
    else
        GameRules:MakeTeamLose(team)
    end
end
function GameMode.prototype.ChangeFountainBuff(self)
    local fountains = Entities:FindAllByClassname("ent_dota_fountain")
    __TS__ArrayForEach(
        fountains,
        function(____, fountain)
            if not fountain then
                return
            end
            fountain:RemoveModifierByName("modifier_fountain_aura")
            modifier_fountain_aura_custom:apply(fountain, fountain, nil, {})
        end
    )
end
function GameMode.prototype.RemoveDefaultBounty(self)
    local deleted = 0
    Timers:CreateTimer(
        0,
        function()
            if deleted >= 2 then
                return
            end
            __TS__ArrayForEach(
                Entities:FindAllByName("dota_item_rune_spawner_powerup"),
                function(____, spawner)
                    local origin = spawner:GetAbsOrigin()
                    local near_rune = Entities:FindByModelWithin(nil, "models/props_gameplay/rune_goldxp.vmdl", origin, 300)
                    if near_rune then
                        near_rune:Destroy()
                        deleted = deleted + 1
                        AddFOWViewer(
                            DOTA_TEAM_GOODGUYS,
                            origin,
                            100,
                            FrameTime(),
                            false
                        )
                        AddFOWViewer(
                            DOTA_TEAM_BADGUYS,
                            origin,
                            100,
                            FrameTime(),
                            false
                        )
                    end
                end
            )
            return FrameTime()
        end
    )
end
function GameMode.prototype.SetOutpostVision(self)
    local outposts = Entities:FindAllByClassname("npc_dota_watch_tower")
    __TS__ArrayForEach(
        outposts,
        function(____, outpost)
            if not outpost then
                return
            end
            modifier_outpost_aura_custom:apply(outpost, outpost, nil, {radius = 700})
        end
    )
end
GameMode = __TS__Decorate(GameMode, GameMode, {reloadable}, {kind = "class", name = "GameMode"})
____exports.GameMode = GameMode
return ____exports
