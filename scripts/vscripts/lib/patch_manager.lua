local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectFromEntries = ____lualib.__TS__ObjectFromEntries
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 3,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 7,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 26,["50"] = 26,["51"] = 26,["52"] = 26,["53"] = 7,["54"] = 7,["55"] = 7,["56"] = 7,["57"] = 7,["58"] = 6,["59"] = 65,["60"] = 65,["61"] = 65,["62"] = 65,["63"] = 65,["64"] = 65,["65"] = 65,["66"] = 64,["67"] = 74,["68"] = 74,["69"] = 74,["70"] = 74,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 74,["75"] = 74,["76"] = 64,["77"] = 85,["78"] = 85,["79"] = 85,["80"] = 85,["81"] = 85,["82"] = 85,["83"] = 85,["84"] = 85,["85"] = 85,["86"] = 85,["87"] = 85,["88"] = 85,["89"] = 85,["90"] = 85,["91"] = 85,["92"] = 85,["93"] = 85,["94"] = 85,["95"] = 85,["96"] = 85,["97"] = 85,["98"] = 85,["99"] = 85,["100"] = 64,["101"] = 64,["102"] = 64,["103"] = 64,["104"] = 64,["105"] = 6,["106"] = 124,["107"] = 124,["108"] = 124,["109"] = 124,["110"] = 124,["111"] = 124,["112"] = 5,["113"] = 139,["114"] = 140,["115"] = 148,["116"] = 148,["117"] = 148,["118"] = 148,["119"] = 148,["120"] = 148,["121"] = 148,["122"] = 148,["123"] = 148,["124"] = 140,["125"] = 159,["126"] = 159,["127"] = 159,["128"] = 159,["129"] = 159,["130"] = 159,["131"] = 159,["132"] = 159,["133"] = 159,["134"] = 159,["135"] = 159,["136"] = 159,["137"] = 159,["138"] = 159,["139"] = 159,["140"] = 159,["141"] = 159,["142"] = 159,["143"] = 159,["144"] = 159,["145"] = 159,["146"] = 159,["147"] = 159,["148"] = 140,["149"] = 140,["150"] = 140,["151"] = 140,["152"] = 140,["153"] = 139,["154"] = 198,["155"] = 198,["156"] = 198,["157"] = 198,["158"] = 198,["159"] = 198,["160"] = 5,["161"] = 213,["162"] = 215,["163"] = 215,["164"] = 215,["165"] = 215,["166"] = 215,["167"] = 215,["168"] = 215,["169"] = 214,["170"] = 224,["171"] = 224,["172"] = 224,["173"] = 224,["174"] = 224,["175"] = 224,["176"] = 224,["177"] = 224,["178"] = 224,["179"] = 214,["180"] = 235,["181"] = 235,["182"] = 235,["183"] = 235,["184"] = 235,["185"] = 235,["186"] = 235,["187"] = 235,["188"] = 235,["189"] = 235,["190"] = 235,["191"] = 235,["192"] = 235,["193"] = 235,["194"] = 235,["195"] = 235,["196"] = 235,["197"] = 235,["198"] = 235,["199"] = 235,["200"] = 235,["201"] = 235,["202"] = 235,["203"] = 214,["204"] = 214,["205"] = 214,["206"] = 214,["207"] = 214,["208"] = 213,["209"] = 274,["210"] = 274,["211"] = 274,["212"] = 274,["213"] = 274,["214"] = 274,["215"] = 5,["216"] = 289,["217"] = 291,["218"] = 291,["219"] = 291,["220"] = 291,["221"] = 291,["222"] = 291,["223"] = 291,["224"] = 290,["225"] = 300,["226"] = 300,["227"] = 300,["228"] = 300,["229"] = 300,["230"] = 300,["231"] = 300,["232"] = 300,["233"] = 300,["234"] = 300,["235"] = 300,["236"] = 300,["237"] = 300,["238"] = 300,["239"] = 300,["240"] = 300,["241"] = 300,["242"] = 300,["243"] = 300,["244"] = 300,["245"] = 300,["246"] = 300,["247"] = 300,["248"] = 290,["249"] = 290,["250"] = 290,["251"] = 290,["252"] = 290,["253"] = 289,["254"] = 338,["255"] = 338,["256"] = 338,["257"] = 338,["258"] = 338,["259"] = 338,["260"] = 338,["261"] = 337,["262"] = 347,["263"] = 347,["264"] = 347,["265"] = 347,["266"] = 347,["267"] = 347,["268"] = 347,["269"] = 347,["270"] = 347,["271"] = 337,["272"] = 358,["273"] = 358,["274"] = 358,["275"] = 358,["276"] = 358,["277"] = 358,["278"] = 358,["279"] = 358,["280"] = 358,["281"] = 358,["282"] = 358,["283"] = 358,["284"] = 358,["285"] = 358,["286"] = 358,["287"] = 358,["288"] = 358,["289"] = 358,["290"] = 358,["291"] = 358,["292"] = 358,["293"] = 358,["294"] = 358,["295"] = 337,["296"] = 337,["297"] = 337,["298"] = 337,["299"] = 337,["300"] = 289,["301"] = 397,["302"] = 397,["303"] = 397,["304"] = 397,["305"] = 397,["306"] = 5,["307"] = 411,["308"] = 413,["309"] = 413,["310"] = 413,["311"] = 413,["312"] = 413,["313"] = 413,["314"] = 412,["315"] = 421,["316"] = 421,["317"] = 421,["318"] = 421,["319"] = 421,["320"] = 421,["321"] = 421,["322"] = 421,["323"] = 421,["324"] = 412,["325"] = 432,["326"] = 432,["327"] = 432,["328"] = 432,["329"] = 432,["330"] = 432,["331"] = 432,["332"] = 432,["333"] = 432,["334"] = 432,["335"] = 432,["336"] = 432,["337"] = 432,["338"] = 432,["339"] = 432,["340"] = 432,["341"] = 432,["342"] = 432,["343"] = 432,["344"] = 432,["345"] = 432,["346"] = 432,["347"] = 432,["348"] = 412,["349"] = 412,["350"] = 412,["351"] = 412,["352"] = 412,["353"] = 411,["354"] = 471,["355"] = 471,["356"] = 471,["357"] = 471,["358"] = 471,["359"] = 471,["360"] = 5,["361"] = 486,["362"] = 487,["363"] = 495,["364"] = 495,["365"] = 495,["366"] = 495,["367"] = 495,["368"] = 495,["369"] = 495,["370"] = 495,["371"] = 495,["372"] = 487,["373"] = 506,["374"] = 506,["375"] = 506,["376"] = 506,["377"] = 506,["378"] = 506,["379"] = 506,["380"] = 506,["381"] = 506,["382"] = 506,["383"] = 506,["384"] = 506,["385"] = 506,["386"] = 506,["387"] = 506,["388"] = 506,["389"] = 506,["390"] = 506,["391"] = 506,["392"] = 506,["393"] = 506,["394"] = 506,["395"] = 506,["396"] = 487,["397"] = 487,["398"] = 487,["399"] = 487,["400"] = 487,["401"] = 5,["402"] = 558,["403"] = 559,["404"] = 567,["405"] = 567,["406"] = 567,["407"] = 567,["408"] = 567,["409"] = 567,["410"] = 567,["411"] = 567,["412"] = 567,["413"] = 559,["414"] = 578,["415"] = 578,["416"] = 578,["417"] = 578,["418"] = 578,["419"] = 578,["420"] = 578,["421"] = 578,["422"] = 578,["423"] = 578,["424"] = 578,["425"] = 578,["426"] = 578,["427"] = 578,["428"] = 578,["429"] = 578,["430"] = 578,["431"] = 578,["432"] = 578,["433"] = 578,["434"] = 578,["435"] = 578,["436"] = 578,["437"] = 578,["438"] = 559,["439"] = 559,["440"] = 559,["441"] = 559,["442"] = 559,["443"] = 5,["444"] = 632,["445"] = 633,["446"] = 641,["447"] = 641,["448"] = 641,["449"] = 641,["450"] = 641,["451"] = 641,["452"] = 641,["453"] = 641,["454"] = 641,["455"] = 633,["456"] = 652,["457"] = 652,["458"] = 652,["459"] = 652,["460"] = 652,["461"] = 652,["462"] = 652,["463"] = 652,["464"] = 652,["465"] = 652,["466"] = 652,["467"] = 652,["468"] = 652,["469"] = 652,["470"] = 652,["471"] = 652,["472"] = 652,["473"] = 652,["474"] = 652,["475"] = 652,["476"] = 652,["477"] = 652,["478"] = 652,["479"] = 633,["480"] = 633,["481"] = 633,["482"] = 633,["483"] = 633,["484"] = 5,["485"] = 704,["486"] = 706,["487"] = 706,["488"] = 706,["489"] = 706,["490"] = 706,["491"] = 706,["492"] = 705,["493"] = 717,["494"] = 717,["495"] = 717,["496"] = 717,["497"] = 717,["498"] = 717,["499"] = 717,["500"] = 717,["501"] = 717,["502"] = 705,["503"] = 728,["504"] = 728,["505"] = 728,["506"] = 728,["507"] = 728,["508"] = 728,["509"] = 728,["510"] = 728,["511"] = 728,["512"] = 728,["513"] = 728,["514"] = 728,["515"] = 728,["516"] = 728,["517"] = 728,["518"] = 728,["519"] = 728,["520"] = 728,["521"] = 728,["522"] = 728,["523"] = 728,["524"] = 728,["525"] = 728,["526"] = 705,["527"] = 705,["528"] = 705,["529"] = 705,["530"] = 705,["531"] = 5,["532"] = 780,["533"] = 782,["534"] = 782,["535"] = 782,["536"] = 782,["537"] = 782,["538"] = 782,["539"] = 782,["540"] = 782,["541"] = 782,["542"] = 782,["543"] = 782,["544"] = 782,["545"] = 782,["546"] = 782,["547"] = 782,["548"] = 782,["549"] = 782,["550"] = 781,["551"] = 807,["552"] = 807,["553"] = 807,["554"] = 807,["555"] = 807,["556"] = 807,["557"] = 807,["558"] = 807,["559"] = 807,["560"] = 781,["561"] = 818,["562"] = 818,["563"] = 818,["564"] = 818,["565"] = 818,["566"] = 818,["567"] = 818,["568"] = 818,["569"] = 818,["570"] = 818,["571"] = 818,["572"] = 818,["573"] = 818,["574"] = 818,["575"] = 818,["576"] = 818,["577"] = 818,["578"] = 818,["579"] = 818,["580"] = 818,["581"] = 818,["582"] = 818,["583"] = 818,["584"] = 781,["585"] = 781,["586"] = 781,["587"] = 781,["588"] = 781,["589"] = 5,["590"] = 870,["591"] = 871,["592"] = 879,["593"] = 879,["594"] = 879,["595"] = 879,["596"] = 879,["597"] = 879,["598"] = 879,["599"] = 879,["600"] = 879,["601"] = 871,["602"] = 890,["603"] = 890,["604"] = 890,["605"] = 890,["606"] = 890,["607"] = 890,["608"] = 890,["609"] = 890,["610"] = 890,["611"] = 890,["612"] = 890,["613"] = 890,["614"] = 890,["615"] = 890,["616"] = 890,["617"] = 890,["618"] = 890,["619"] = 890,["620"] = 890,["621"] = 890,["622"] = 890,["623"] = 890,["624"] = 890,["625"] = 871,["626"] = 871,["627"] = 871,["628"] = 871,["629"] = 871,["630"] = 5,["631"] = 942,["632"] = 944,["633"] = 944,["634"] = 944,["635"] = 944,["636"] = 944,["637"] = 944,["638"] = 943,["639"] = 952,["640"] = 952,["641"] = 952,["642"] = 952,["643"] = 952,["644"] = 952,["645"] = 952,["646"] = 952,["647"] = 952,["648"] = 943,["649"] = 963,["650"] = 963,["651"] = 963,["652"] = 963,["653"] = 963,["654"] = 963,["655"] = 963,["656"] = 963,["657"] = 963,["658"] = 963,["659"] = 963,["660"] = 963,["661"] = 963,["662"] = 963,["663"] = 963,["664"] = 963,["665"] = 963,["666"] = 963,["667"] = 963,["668"] = 963,["669"] = 963,["670"] = 963,["671"] = 963,["672"] = 963,["673"] = 943,["674"] = 943,["675"] = 943,["676"] = 943,["677"] = 943,["678"] = 5,["679"] = 1016,["680"] = 1018,["681"] = 1018,["682"] = 1018,["683"] = 1018,["684"] = 1018,["685"] = 1018,["686"] = 1018,["687"] = 1018,["688"] = 1017,["689"] = 1031,["690"] = 1031,["691"] = 1031,["692"] = 1031,["693"] = 1031,["694"] = 1031,["695"] = 1031,["696"] = 1031,["697"] = 1031,["698"] = 1017,["699"] = 1042,["700"] = 1042,["701"] = 1042,["702"] = 1042,["703"] = 1042,["704"] = 1042,["705"] = 1042,["706"] = 1042,["707"] = 1042,["708"] = 1042,["709"] = 1042,["710"] = 1042,["711"] = 1042,["712"] = 1042,["713"] = 1042,["714"] = 1042,["715"] = 1042,["716"] = 1042,["717"] = 1042,["718"] = 1042,["719"] = 1042,["720"] = 1042,["721"] = 1042,["722"] = 1017,["723"] = 1017,["724"] = 1017,["725"] = 1017,["726"] = 1017,["727"] = 1016,["728"] = 1081,["729"] = 1081,["730"] = 1081,["731"] = 1081,["732"] = 1081,["733"] = 5,["734"] = 5,["735"] = 1096,["736"] = 1096,["737"] = 1096,["738"] = 1096,["739"] = 1096,["740"] = 1096,["741"] = 1096,["742"] = 1096,["743"] = 1096,["744"] = 1096,["745"] = 1096,["746"] = 1096,["747"] = 1096,["748"] = 1096,["749"] = 1096,["750"] = 1096,["751"] = 1096,["752"] = 1096,["753"] = 1096,["754"] = 1096,["755"] = 1096,["756"] = 1096,["757"] = 1309,["758"] = 1309,["759"] = 1309,["760"] = 1309,["761"] = 1309,["762"] = 1309,["763"] = 1309,["764"] = 1317,["765"] = 1317,["766"] = 1317,["768"] = 1317,["769"] = 1318,["770"] = 1319,["771"] = 1318,["772"] = 1322,["773"] = 1323,["774"] = 1327,["775"] = 1327,["776"] = 1327,["777"] = 1327,["778"] = 1327,["779"] = 1327,["780"] = 1327,["781"] = 1328,["784"] = 1330,["785"] = 1330,["786"] = 1330,["787"] = 1331,["788"] = 1331,["789"] = 1331,["790"] = 1331,["791"] = 1331,["792"] = 1330,["793"] = 1330,["794"] = 1332,["795"] = 1332,["796"] = 1332,["797"] = 1332,["798"] = 1332,["799"] = 1332,["800"] = 1330,["801"] = 1330,["802"] = 1334,["803"] = 1327,["804"] = 1327,["805"] = 1337,["806"] = 1337,["807"] = 1337,["808"] = 1337,["809"] = 1337,["810"] = 1337,["811"] = 1337,["812"] = 1338,["815"] = 1340,["816"] = 1341,["817"] = 1341,["818"] = 1341,["819"] = 1341,["820"] = 1341,["821"] = 1341,["822"] = 1341,["823"] = 1342,["824"] = 1341,["825"] = 1341,["826"] = 1349,["827"] = 1337,["828"] = 1337,["829"] = 1352,["830"] = 1322,["831"] = 1355,["832"] = 1356,["835"] = 1358,["836"] = 1359,["837"] = 1361,["840"] = 1362,["841"] = 1362,["842"] = 1362,["843"] = 1362,["846"] = 1363,["847"] = 1363,["848"] = 1363,["849"] = 1363,["852"] = 1365,["853"] = 1367,["854"] = 1368,["857"] = 1370,["858"] = 1371,["861"] = 1373,["862"] = 1373,["863"] = 1373,["864"] = 1374,["865"] = 1374,["866"] = 1374,["867"] = 1373,["868"] = 1373,["869"] = 1373,["870"] = 1373,["871"] = 1377,["873"] = 1378,["874"] = 1378,["875"] = 1379,["876"] = 1380,["879"] = 1382,["880"] = 1383,["881"] = 1384,["883"] = 1386,["885"] = 1389,["886"] = 1389,["887"] = 1389,["888"] = 1390,["889"] = 1389,["890"] = 1389,["891"] = 1378,["895"] = 1395,["897"] = 1396,["898"] = 1396,["899"] = 1397,["900"] = 1398,["901"] = 1400,["902"] = 1401,["903"] = 1403,["904"] = 1403,["905"] = 1403,["906"] = 1404,["907"] = 1405,["908"] = 1403,["909"] = 1403,["910"] = 1396,["914"] = 1410,["915"] = 1410,["917"] = 1412,["918"] = 1413,["919"] = 1414,["920"] = 1415,["921"] = 1415,["922"] = 1415,["923"] = 1416,["924"] = 1415,["925"] = 1415,["926"] = 1419,["927"] = 1421,["928"] = 1422,["931"] = 1433,["932"] = 1433,["934"] = 1434,["935"] = 1434,["936"] = 1434,["937"] = 1434,["939"] = 1435,["940"] = 1435,["942"] = 1436,["943"] = 1436,["944"] = 1436,["945"] = 1436,["947"] = 1437,["948"] = 1437,["950"] = 1438,["951"] = 1438,["952"] = 1438,["953"] = 1438,["955"] = 1440,["956"] = 1440,["958"] = 1441,["959"] = 1441,["961"] = 1443,["962"] = 1443,["964"] = 1444,["965"] = 1444,["967"] = 1446,["968"] = 1446,["970"] = 1447,["971"] = 1447,["973"] = 1449,["974"] = 1449,["976"] = 1451,["977"] = 1451,["978"] = 1451,["979"] = 1451,["981"] = 1452,["982"] = 1452,["983"] = 1452,["984"] = 1452,["986"] = 1453,["987"] = 1453,["989"] = 1454,["990"] = 1454,["992"] = 1455,["993"] = 1455,["994"] = 1455,["995"] = 1455,["997"] = 1457,["998"] = 1457,["1000"] = 1458,["1001"] = 1458,["1003"] = 1460,["1004"] = 1461,["1006"] = 1464,["1007"] = 1465,["1009"] = 1473,["1010"] = 1474,["1011"] = 1475,["1012"] = 1476,["1013"] = 1477,["1014"] = 1478,["1015"] = 1479,["1016"] = 1473,["1017"] = 1473,["1018"] = 1473,["1019"] = 1473,["1020"] = 1473,["1021"] = 1473,["1022"] = 1473,["1023"] = 1473,["1024"] = 1473,["1025"] = 1483,["1026"] = 1484,["1027"] = 1484,["1028"] = 1484,["1029"] = 1484,["1031"] = 1355,["1032"] = 1487,["1033"] = 1488,["1036"] = 1490,["1037"] = 1491,["1040"] = 1493,["1041"] = 1493,["1042"] = 1493,["1043"] = 1493,["1044"] = 1493,["1045"] = 1493,["1046"] = 1493,["1047"] = 1494,["1050"] = 1496,["1051"] = 1497,["1054"] = 1499,["1057"] = 1501,["1058"] = 1502,["1061"] = 1504,["1062"] = 1505,["1063"] = 1507,["1065"] = 1509,["1066"] = 1510,["1068"] = 1511,["1069"] = 1511,["1070"] = 1511,["1071"] = 1511,["1073"] = 1511,["1076"] = 1514,["1078"] = 1515,["1079"] = 1515,["1080"] = 1515,["1082"] = 1515,["1083"] = 1517,["1084"] = 1518,["1088"] = 1523,["1090"] = 1524,["1091"] = 1525,["1092"] = 1526,["1093"] = 1527,["1095"] = 1530,["1096"] = 1531,["1100"] = 1536,["1102"] = 1537,["1103"] = 1537,["1104"] = 1537,["1106"] = 1537,["1109"] = 1541,["1111"] = 1543,["1112"] = 1544,["1113"] = 1545,["1114"] = 1546,["1122"] = 1554,["1123"] = 1556,["1124"] = 1556,["1125"] = 1556,["1126"] = 1556,["1127"] = 1487,["1128"] = 1559,["1129"] = 1560,["1130"] = 1559,["1131"] = 1563,["1132"] = 1564,["1133"] = 1563});
local ____exports = {}
local ____modifier_old_universal_damage_custom = require("abilities.generic.modifier_old_universal_damage_custom")
local modifier_old_universal_damage_custom = ____modifier_old_universal_damage_custom.modifier_old_universal_damage_custom
local CURRENT_PATCH = "7.38c"
local HERO_PATCHES = {
    npc_dota_hero_tinker = {["7.07"] = {
        abilities = {ability1 = "tinker_laser_custom_707", ability2 = "tinker_heat_seeking_missile_custom_707", ability3 = "tinker_march_of_the_machines_custom_707", ability6 = "tinker_rearm_custom_707"},
        talents = {
            right10 = "special_bonus_spell_amplify_6",
            left10 = "special_bonus_cast_range_75",
            right15 = "special_bonus_movement_speed_40",
            left15 = "special_bonus_spell_lifesteal_10",
            right20 = "special_bonus_attack_damage_100",
            left20 = "special_bonus_unique_tinker_707_custom",
            right25 = "special_bonus_unique_tinker_707_custom_2",
            left25 = "special_bonus_unique_tinker_707_custom_3"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_INTELLECT,
            strength = 17,
            strengthGain = 2.3,
            agility = 13,
            agilityGain = 1.2,
            intelligence = 30,
            intelligenceGain = 2.2,
            attackDamageMin = 22,
            attackDamageMax = 28,
            healthRegen = 1.5,
            manaRegen = 0.9,
            armor = 2,
            magicResistance = 25,
            movementSpeed = 305,
            turnRate = 0.6,
            attackRange = 500,
            attackPoint = 0.35,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = true
    }, ["7.30"] = {
        abilities = {
            ability1 = "tinker_laser_custom_730",
            ability2 = "tinker_heat_seeking_missile_custom_730",
            ability3 = "tinker_defense_matrix_custom_730",
            ability4 = "tinker_march_of_the_machines_custom_730",
            ability5 = "tinker_keen_teleport_custom_730",
            ability6 = "tinker_rearm_custom_730"
        },
        talents = {
            right10 = "special_bonus_unique_tinker_730_custom",
            left10 = "special_bonus_mana_reduction_8",
            right15 = "special_bonus_unique_tinker_730_custom_3",
            left15 = "special_bonus_unique_tinker_730_custom_2",
            right20 = "special_bonus_spell_amplify_10",
            left20 = "special_bonus_unique_tinker_730_custom_4",
            right25 = "special_bonus_unique_tinker_730_custom_5",
            left25 = "special_bonus_unique_tinker_730_custom_6"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_INTELLECT,
            strength = 18,
            strengthGain = 2.5,
            agility = 13,
            agilityGain = 1.2,
            intelligence = 30,
            intelligenceGain = 3.3,
            attackDamageMin = 24,
            attackDamageMax = 30,
            healthRegen = 0.25,
            manaRegen = 0.75,
            armor = 2,
            magicResistance = 25,
            movementSpeed = 290,
            turnRate = 0.6,
            attackRange = 500,
            attackPoint = 0.35,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "tinker_laser",
        ability2 = "tinker_march_of_the_machines",
        ability3 = "tinker_defense_matrix",
        ability4 = "tinker_warp_grenade",
        ability5 = "tinker_keen_teleport",
        ability6 = "tinker_rearm"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_pudge = {["7.22"] = {
        abilities = {ability1 = "pudge_meat_hook_custom_722", ability2 = "pudge_rot_custom_722", ability3 = "pudge_flesh_heap_custom_722", ability6 = "pudge_dismember_custom_722"},
        talents = {
            right10 = "special_bonus_exp_boost_30",
            left10 = "special_bonus_unique_pudge_722_custom",
            right15 = "special_bonus_spell_lifesteal_13",
            left15 = "special_bonus_unique_pudge_722_custom_2",
            right20 = "special_bonus_gold_income_180",
            left20 = "special_bonus_cooldown_reduction_15",
            right25 = "special_bonus_unique_pudge_722_custom_3",
            left25 = "special_bonus_unique_pudge_722_custom_4"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_STRENGTH,
            strength = 25,
            strengthGain = 4,
            agility = 14,
            agilityGain = 1.5,
            intelligence = 16,
            intelligenceGain = 1.5,
            attackDamageMin = 40,
            attackDamageMax = 46,
            healthRegen = 0,
            manaRegen = 0,
            armor = -2,
            magicResistance = 25,
            movementSpeed = 280,
            turnRate = 0.7,
            attackRange = 150,
            attackPoint = 0.5,
            attackType = DOTA_UNIT_CAP_MELEE_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 300,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "pudge_meat_hook",
        ability2 = "pudge_rot",
        ability3 = "pudge_flesh_heap",
        ability4 = "pudge_eject",
        ability5 = "pudge_innate_graft_flesh",
        ability6 = "pudge_dismember"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_nevermore = {["7.28"] = {
        abilities = {
            ability1 = "nevermore_shadowraze1_custom_728",
            ability2 = "nevermore_shadowraze2_custom_728",
            ability3 = "nevermore_shadowraze3_custom_728",
            ability4 = "nevermore_necromastery_custom_728",
            ability5 = "nevermore_dark_lord_custom_728",
            ability6 = "nevermore_requiem_custom_728"
        },
        talents = {
            right10 = "special_bonus_spell_amplify_6",
            left10 = "special_bonus_attack_speed_20",
            right15 = "special_bonus_unique_nevermore_728_custom",
            left15 = "special_bonus_movement_speed_25",
            right20 = "special_bonus_unique_nevermore_728_custom_2",
            left20 = "special_bonus_unique_nevermore_728_custom_3",
            right25 = "special_bonus_unique_nevermore_728_custom_4",
            left25 = "special_bonus_cooldown_reduction_30"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 19,
            strengthGain = 2.7,
            agility = 20,
            agilityGain = 3.5,
            intelligence = 18,
            intelligenceGain = 2.2,
            attackDamageMin = 19,
            attackDamageMax = 25,
            healthRegen = 0.25,
            manaRegen = 0.3,
            armor = 0,
            magicResistance = 25,
            movementSpeed = 305,
            turnRate = 0.6,
            attackRange = 500,
            attackPoint = 0.5,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 1200,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "nevermore_shadowraze1",
        ability2 = "nevermore_shadowraze2",
        ability3 = "nevermore_shadowraze3",
        ability4 = "nevermore_frenzy",
        ability5 = "nevermore_dark_lord",
        ability6 = "nevermore_requiem"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_techies = {["6.84"] = {
        abilities = {
            ability1 = "techies_land_mines_custom_684",
            ability2 = "techies_stasis_trap_custom_684",
            ability3 = "techies_suicide_custom_684",
            ability4 = "techies_focused_detonate_custom_684",
            ability5 = "techies_minefield_sign_custom_684",
            ability6 = "techies_remote_mines_custom_684"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_INTELLECT,
            strength = 17,
            strengthGain = 2,
            agility = 14,
            agilityGain = 1.3,
            intelligence = 22,
            intelligenceGain = 2.9,
            attackDamageMin = 7,
            attackDamageMax = 9,
            healthRegen = 0.25,
            manaRegen = 0.02,
            armor = 5,
            magicResistance = 25,
            movementSpeed = 270,
            turnRate = 0.5,
            attackRange = 700,
            attackPoint = 0.5,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = false,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = true
    }, ["7.25"] = {
        abilities = {
            ability1 = "techies_land_mines_custom_725",
            ability2 = "techies_stasis_trap_custom_725",
            ability3 = "techies_suicide_custom_725",
            ability4 = "techies_focused_detonate_custom_725",
            ability5 = "techies_minefield_sign_custom_725",
            ability6 = "techies_remote_mines_custom_725"
        },
        talents = {
            right10 = "special_bonus_magic_resistance_25",
            left10 = "special_bonus_unique_techies_725_custom",
            right15 = "special_bonus_unique_techies_725_custom_2",
            left15 = "special_bonus_mp_regen_6",
            right20 = "special_bonus_movement_speed_50",
            left20 = "special_bonus_unique_techies_725_custom_3",
            right25 = "special_bonus_attack_damage_251",
            left25 = "special_bonus_unique_techies_725_custom_4"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_INTELLECT,
            strength = 19,
            strengthGain = 2.5,
            agility = 14,
            agilityGain = 1.3,
            intelligence = 25,
            intelligenceGain = 3.3,
            attackDamageMin = 9,
            attackDamageMax = 11,
            healthRegen = 0.25,
            manaRegen = 0.02,
            armor = 5,
            magicResistance = 25,
            movementSpeed = 310,
            turnRate = 0.5,
            attackRange = 700,
            attackPoint = 0.5,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "techies_sticky_bomb",
        ability2 = "techies_reactive_tazer",
        ability3 = "techies_suicide",
        ability5 = "techies_minefield_sign",
        ability6 = "techies_land_mines"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_clinkz = {["7.30"] = {
        abilities = {
            ability1 = "clinkz_burning_barrage_custom_730",
            ability2 = "clinkz_searing_arrows_custom_730",
            ability3 = "clinkz_wind_walk_custom_730",
            ability4 = "clinkz_burning_army_custom_730",
            ability6 = "clinkz_death_pact_custom_730"
        },
        talents = {
            left10 = "special_bonus_magic_resistance_12",
            right10 = "special_bonus_mp_regen_175",
            left15 = "special_bonus_unique_clinkz_730_custom",
            right15 = "special_bonus_unique_clinkz_730_custom_2",
            left20 = "special_bonus_attack_range_125",
            right20 = "special_bonus_unique_clinkz_730_custom_3",
            left25 = "special_bonus_unique_clinkz_730_custom_4",
            right25 = "special_bonus_unique_clinkz_730_custom_5"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 16,
            strengthGain = 2,
            agility = 22,
            agilityGain = 2.5,
            intelligence = 18,
            intelligenceGain = 2.2,
            attackDamageMin = 15,
            attackDamageMax = 21,
            healthRegen = 0.25,
            manaRegen = 0,
            armor = 0,
            magicResistance = 25,
            movementSpeed = 290,
            turnRate = 0.6,
            attackRange = 600,
            attackPoint = 0.4,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "clinkz_strafe",
        ability2 = "clinkz_tar_bomb",
        ability3 = "clinkz_death_pact",
        ability4 = "clinkz_burning_barrage",
        ability5 = "clinkz_burning_army",
        ability6 = "clinkz_wind_walk"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_arc_warden = {["7.31"] = {
        abilities = {ability1 = "arc_warden_flux_custom_731", ability2 = "arc_warden_magnetic_field_custom_731", ability3 = "arc_warden_spark_wraith_custom_731", ability6 = "arc_warden_tempest_double_custom_731"},
        talents = {
            right10 = "special_bonus_unique_arc_warden_731_custom",
            left10 = "special_bonus_hp_225",
            right15 = "special_bonus_unique_arc_warden_731_custom_2",
            left15 = "special_bonus_unique_arc_warden_731_custom_3",
            right20 = "special_bonus_unique_arc_warden_731_custom_4",
            left20 = "special_bonus_unique_arc_warden_731_custom_5",
            right25 = "special_bonus_unique_arc_warden_731_custom_6",
            left25 = "special_bonus_unique_arc_warden_731_custom_7"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 22,
            strengthGain = 2.6,
            agility = 20,
            agilityGain = 3,
            intelligence = 24,
            intelligenceGain = 2.6,
            attackDamageMin = 27,
            attackDamageMax = 37,
            healthRegen = 0.25,
            manaRegen = 0,
            armor = -1,
            magicResistance = 25,
            movementSpeed = 285,
            turnRate = 0.7,
            attackRange = 625,
            attackPoint = 0.3,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {ability1 = "arc_warden_flux", ability2 = "arc_warden_magnetic_field", ability3 = "arc_warden_spark_wraith", ability6 = "arc_warden_tempest_double"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_dazzle = {["7.34"] = {
        abilities = {ability1 = "dazzle_poison_touch_custom_734", ability2 = "dazzle_shallow_grave_custom_734", ability3 = "dazzle_shadow_wave_custom_734", ability6 = "dazzle_bad_juju_custom_734"},
        talents = {
            right10 = "special_bonus_unique_dazzle_734_custom",
            left10 = "special_bonus_mp_regen_175",
            right15 = "special_bonus_unique_dazzle_734_custom_2",
            left15 = "special_bonus_attack_speed_80",
            right20 = "special_bonus_unique_dazzle_734_custom_3",
            left20 = "special_bonus_unique_dazzle_734_custom_4",
            right25 = "special_bonus_unique_dazzle_734_custom_5",
            left25 = "special_bonus_unique_dazzle_734_custom_6"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_ALL,
            strength = 18,
            strengthGain = 2,
            agility = 20,
            agilityGain = 1.4,
            intelligence = 25,
            intelligenceGain = 2.8,
            allDamageBonus = 0.7,
            attackDamageMin = 3,
            attackDamageMax = 9,
            healthRegen = 0.25,
            manaRegen = 0.3,
            armor = 0,
            magicResistance = 25,
            movementSpeed = 305,
            turnRate = 0.7,
            attackRange = 575,
            attackPoint = 0.3,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 1200,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {ability1 = "dazzle_poison_touch", ability2 = "dazzle_shallow_grave", ability3 = "dazzle_shadow_wave", ability6 = "dazzle_bad_juju"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_huskar = {["7.17"] = {
        abilities = {ability1 = "huskar_inner_vitality_custom_717", ability2 = "huskar_burning_spear_custom_717", ability3 = "huskar_berserkers_blood_custom_717", ability6 = "huskar_life_break_custom_717"},
        talents = {
            right10 = "special_bonus_hp_175",
            left10 = "special_bonus_attack_damage_20",
            right15 = "special_bonus_unique_huskar_717_custom",
            left15 = "special_bonus_lifesteal_15",
            right20 = "special_bonus_strength_15",
            left20 = "special_bonus_unique_huskar_717_custom_2",
            right25 = "special_bonus_attack_range_150",
            left25 = "special_bonus_unique_huskar_717_custom_3"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_STRENGTH,
            strength = 21,
            strengthGain = 2.7,
            agility = 15,
            agilityGain = 1.4,
            intelligence = 18,
            intelligenceGain = 1.5,
            attackDamageMin = 21,
            attackDamageMax = 30,
            healthRegen = 1.5,
            manaRegen = 0.9,
            armor = -2,
            magicResistance = 25,
            movementSpeed = 290,
            turnRate = 0.5,
            attackRange = 400,
            attackPoint = 0.4,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.6,
            projectileSpeed = 1400,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = false
    }, default = {abilities = {ability1 = "huskar_inner_fire", ability2 = "huskar_burning_spear", ability3 = "huskar_berserkers_blood", ability6 = "huskar_life_break"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_pangolier = {["7.17"] = {
        abilities = {
            ability1 = "pangolier_swashbuckle_custom_717",
            ability2 = "pangolier_shield_crash_custom_717",
            ability3 = "pangolier_heartpiercer_custom_717",
            ability6 = "pangolier_gyroshell_custom_717",
            ability7 = {name = "pangolier_gyroshell_stop_custom_717", visible = false}
        },
        talents = {
            right10 = "special_bonus_mp_regen_150",
            left10 = "special_bonus_movement_speed_25",
            right15 = "special_bonus_unique_pangolier_717_custom_2",
            left15 = "special_bonus_unique_pangolier_717_custom",
            right20 = "special_bonus_unique_pangolier_717_custom_3",
            left20 = "special_bonus_strength_20",
            right25 = "special_bonus_unique_pangolier_717_custom_4",
            left25 = "special_bonus_unique_pangolier_717_custom_5"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 17,
            strengthGain = 2.5,
            agility = 18,
            agilityGain = 2.8,
            intelligence = 16,
            intelligenceGain = 1.9,
            attackDamageMin = 29,
            attackDamageMax = 35,
            healthRegen = 1.75,
            manaRegen = 0.9,
            armor = 1,
            magicResistance = 25,
            movementSpeed = 305,
            turnRate = 1,
            attackRange = 150,
            attackPoint = 0.33,
            attackType = DOTA_UNIT_CAP_MELEE_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 300,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = false
    }, default = {abilities = {ability1 = "pangolier_swashbuckle", ability2 = "pangolier_shield_crash", ability3 = "pangolier_lucky_shot", ability6 = "pangolier_gyroshell"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_invoker = {["7.32"] = {
        abilities = {
            ability1 = "invoker_quas_custom_732",
            ability2 = "invoker_wex_custom_732",
            ability3 = "invoker_exort_custom_732",
            ability4 = {name = "invoker_empty1", visible = false},
            ability5 = {name = "invoker_empty2", visible = false},
            ability6 = "invoker_invoke_custom_732",
            ability7 = "invoker_cold_snap_custom_732",
            ability8 = "invoker_ghost_walk_custom_732",
            ability9 = "invoker_tornado_custom_732",
            ability10 = "invoker_emp_custom_732",
            ability11 = "invoker_alacrity_custom_732",
            ability12 = "invoker_chaos_meteor_custom_732",
            ability13 = "invoker_sun_strike_custom_732",
            ability14 = "invoker_forge_spirit_custom_732",
            ability15 = "invoker_ice_wall_custom_732",
            ability16 = "invoker_deafening_blast_custom_732"
        },
        talents = {
            right10 = "special_bonus_unique_invoker_732_custom",
            left10 = "special_bonus_unique_invoker_732_custom_2",
            right15 = "special_bonus_unique_invoker_732_custom_3",
            left15 = "special_bonus_unique_invoker_732_custom_4",
            right20 = "special_bonus_unique_invoker_732_custom_5",
            left20 = "special_bonus_unique_invoker_732_custom_6",
            right25 = "special_bonus_unique_invoker_732_custom_7",
            left25 = "special_bonus_unique_invoker_732_custom_8"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_INTELLECT,
            strength = 18,
            strengthGain = 2.4,
            agility = 14,
            agilityGain = 1.9,
            intelligence = 15,
            intelligenceGain = 4.6,
            attackDamageMin = 29,
            attackDamageMax = 35,
            healthRegen = 0,
            manaRegen = 0,
            armor = 0,
            magicResistance = 25,
            movementSpeed = 285,
            turnRate = 0.6,
            attackRange = 600,
            attackPoint = 0.4,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 900,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = false
    }, default = {abilities = {ability1 = "invoker_quas", ability2 = "invoker_wex", ability3 = "invoker_exort", ability6 = "invoker_invoke"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_sniper = {["7.22"] = {
        abilities = {ability1 = "sniper_shrapnel_custom_722", ability2 = "sniper_headshot_custom_722", ability3 = "sniper_take_aim_custom_722", ability6 = "sniper_assassinate_custom_722"},
        talents = {
            right10 = "special_bonus_cooldown_reduction_25",
            left10 = "special_bonus_attack_damage_20",
            right15 = "special_bonus_attack_speed_40",
            left15 = "special_bonus_unique_sniper_722_custom",
            right20 = "special_bonus_unique_sniper_722_custom_2",
            left20 = "special_bonus_unique_sniper_722_custom_3",
            right25 = "special_bonus_attack_range_125",
            left25 = "special_bonus_unique_sniper_722_custom_4"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 19,
            strengthGain = 1.7,
            agility = 21,
            agilityGain = 3.1,
            intelligence = 15,
            intelligenceGain = 2.6,
            attackDamageMin = 15,
            attackDamageMax = 21,
            healthRegen = 0,
            manaRegen = 0,
            armor = -1,
            magicResistance = 25,
            movementSpeed = 285,
            turnRate = 0.7,
            attackRange = 550,
            attackPoint = 0.17,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 3000,
            dayVision = 1800,
            nightVision = 1400
        },
        hasTalents = true,
        hasAghanimsShard = false,
        hasFacet = false,
        hasAttributeBonus = false
    }, default = {abilities = {ability1 = "sniper_shrapnel", ability2 = "sniper_headshot", ability3 = "sniper_take_aim", ability6 = "sniper_assassinate"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_broodmother = {["7.28"] = {
        abilities = {
            ability1 = "broodmother_spawn_spiderlings_custom_728",
            ability2 = "broodmother_spin_web_custom_728",
            ability3 = "broodmother_incapacitating_bite_custom_728",
            ability4 = "broodmother_silken_bola_custom_728",
            ability6 = "broodmother_insatiable_hunger_custom_728"
        },
        talents = {
            right10 = "special_bonus_unique_broodmother_728_custom",
            left10 = "special_bonus_agility_10",
            right15 = "special_bonus_cooldown_reduction_15",
            left15 = "special_bonus_attack_speed_30",
            right20 = "special_bonus_unique_broodmother_728_custom_2",
            left20 = "special_bonus_hp_400",
            right25 = "special_bonus_unique_broodmother_728_custom_3",
            left25 = "special_bonus_unique_broodmother_728_custom_4"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 18,
            strengthGain = 3.2,
            agility = 15,
            agilityGain = 3,
            intelligence = 18,
            intelligenceGain = 2,
            attackDamageMin = 29,
            attackDamageMax = 35,
            healthRegen = 0,
            manaRegen = 0,
            armor = 0,
            magicResistance = 25,
            movementSpeed = 275,
            attackSpeed = 175,
            turnRate = 0.5,
            attackRange = 150,
            attackPoint = 0.4,
            attackType = DOTA_UNIT_CAP_MELEE_ATTACK,
            baseAttackTime = 1.7,
            projectileSpeed = 300,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = false
    }, default = {abilities = {ability1 = "broodmother_insatiable_hunger", ability2 = "broodmother_spin_web", ability3 = "broodmother_incapacitating_bite", ability6 = "broodmother_spawn_spiderlings"}, hasTalents = true, hasAghanimsShard = true, hasFacet = true}},
    npc_dota_hero_morphling = {["7.29"] = {
        abilities = {
            ability1 = "morphling_waveform_custom_729",
            ability2 = "morphling_adaptive_strike_agi_custom_729",
            ability3 = "morphling_adaptive_strike_str_custom_729",
            ability4 = "morphling_morph_agi_custom_729",
            ability5 = "morphling_morph_str_custom_729",
            ability6 = "morphling_replicate_custom_729",
            ability7 = {name = "morphling_morph_replicate_custom_729", visible = false}
        },
        talents = {
            right10 = "special_bonus_magic_resistance_15",
            left10 = "special_bonus_unique_morphling_729_custom",
            right15 = "special_bonus_unique_morphling_729_custom_2",
            left15 = "special_bonus_agility_15",
            right20 = "special_bonus_strength_20",
            left20 = "special_bonus_unique_morphling_729_custom_3",
            right25 = "special_bonus_unique_morphling_729_custom_4",
            left25 = "special_bonus_unique_morphling_729_custom_5"
        },
        stats = {
            primaryAttribute = DOTA_ATTRIBUTE_AGILITY,
            strength = 22,
            strengthGain = 3,
            agility = 24,
            agilityGain = 4.3,
            intelligence = 19,
            intelligenceGain = 1.8,
            attackDamageMin = 9,
            attackDamageMax = 18,
            healthRegen = 0,
            manaRegen = 0,
            armor = -2,
            magicResistance = 25,
            movementSpeed = 280,
            turnRate = 0.7,
            attackRange = 350,
            attackPoint = 0.5,
            attackType = DOTA_UNIT_CAP_RANGED_ATTACK,
            baseAttackTime = 1.5,
            projectileSpeed = 1300,
            dayVision = 1800,
            nightVision = 800
        },
        hasTalents = true,
        hasAghanimsShard = true,
        hasFacet = false,
        hasAttributeBonus = true
    }, default = {abilities = {
        ability1 = "morphling_waveform",
        ability2 = "morphling_adaptive_strike_agi",
        ability3 = "morphling_morph_agi",
        ability4 = "morphling_morph_str",
        ability6 = "morphling_replicate"
    }, hasTalents = true, hasAghanimsShard = true, hasFacet = true}}
}
local ITEM_PATCHES = {
    {items = {"item_arcane_blink", "item_arcane_blink_custom_730", "item_arcane_blink_custom_731"}, patches = {["7.30"] = "item_arcane_blink_custom_730", ["7.31"] = "item_arcane_blink_custom_731", default = "item_arcane_blink"}},
    {items = {"item_abyssal_blade", "item_abyssal_blade_custom_725"}, patches = {["7.25"] = "item_abyssal_blade_custom_725", default = "item_abyssal_blade"}},
    {items = {"item_bloodstone", "item_bloodstone_custom_707", "item_bloodstone_custom_728"}, patches = {["7.07"] = "item_bloodstone_custom_707", ["7.28"] = "item_bloodstone_custom_728", default = "item_bloodstone"}},
    {items = {"item_ethereal_blade", "item_ethereal_blade_custom_724"}, patches = {["7.24"] = "item_ethereal_blade_custom_724", default = "item_ethereal_blade"}},
    {items = {"item_null_talisman", "item_null_talisman_custom_720", "item_null_talisman_custom_731"}, patches = {["7.20"] = "item_null_talisman_custom_720", ["7.31"] = "item_null_talisman_custom_731", default = "item_null_talisman"}},
    {items = {"item_bracer", "item_bracer_custom_727"}, patches = {["7.27"] = "item_bracer_custom_727", default = "item_bracer"}},
    {items = {"item_silver_edge", "item_silver_edge_custom_734"}, patches = {["7.34"] = "item_silver_edge_custom_734", default = "item_silver_edge"}},
    {items = {"item_nullifier", "item_nullifier_custom_721"}, patches = {["7.21"] = "item_nullifier_custom_721", default = "item_nullifier"}},
    {items = {"item_bloodthorn", "item_bloodthorn_custom_730", "item_bloodthorn_custom_733"}, patches = {["7.30"] = "item_bloodthorn_custom_730", ["7.33"] = "item_bloodthorn_custom_733", default = "item_bloodthorn"}},
    {items = {"item_black_king_bar", "item_black_king_bar_custom_728"}, patches = {["7.28"] = "item_black_king_bar_custom_728", default = "item_black_king_bar"}},
    {items = {"item_solar_crest", "item_solar_crest_custom_733"}, patches = {["7.33"] = "item_solar_crest_custom_733", default = "item_solar_crest"}},
    {items = {"item_octarine_core", "item_octarine_core_custom_728"}, patches = {["7.28"] = "item_octarine_core_custom_728", default = "item_octarine_core"}},
    {items = {"item_revenants_brooch", "item_revenants_brooch_custom_734", "item_revenants_brooch_custom_736"}, patches = {["7.34"] = "item_revenants_brooch_custom_734", ["7.36"] = "item_revenants_brooch_custom_736", default = "item_revenants_brooch"}},
    {items = {"item_hand_of_midas", "item_hand_of_midas_custom_727"}, patches = {["7.27"] = "item_hand_of_midas_custom_727", default = "item_hand_of_midas"}},
    {items = {"item_overwhelming_blink", "item_overwhelming_blink_custom_731"}, patches = {["7.31"] = "item_overwhelming_blink_custom_731", default = "item_overwhelming_blink"}},
    {items = {"item_heart", "item_heart_custom_726"}, patches = {["7.26"] = "item_heart_custom_726", default = "item_heart"}},
    {items = {"item_eternal_shroud", "item_eternal_shroud_custom_732"}, patches = {["7.32"] = "item_eternal_shroud_custom_732", default = "item_eternal_shroud"}},
    {items = {"item_angels_demise", "item_angels_demise_custom_737"}, patches = {["7.37"] = "item_angels_demise_custom_737", default = "item_angels_demise"}},
    {items = {"item_gungir", "item_gungir_custom_735"}, patches = {["7.35"] = "item_gungir_custom_735", default = "item_gungir"}},
    {items = {"item_sange_and_yasha", "item_sange_and_yasha_custom_714"}, patches = {["7.14"] = "item_sange_and_yasha_custom_714", default = "item_sange_and_yasha"}}
}
local ABILITY_EXCEPTIONS = {
    "ability_capture",
    "ability_lamp_use",
    "ability_pluck_famango",
    "twin_gate_portal_warp",
    "old_tinker_high_five"
}
____exports.PatchManager = __TS__Class()
local PatchManager = ____exports.PatchManager
PatchManager.name = "PatchManager"
function PatchManager.prototype.____constructor(self)
end
function PatchManager.GetHeroes(self)
    return __TS__ObjectKeys(HERO_PATCHES)
end
function PatchManager.LoadPatches(self)
    CustomNetTables:SetTableValue("game", "current_patch", {patch = CURRENT_PATCH})
    __TS__ArrayForEach(
        __TS__ObjectEntries(HERO_PATCHES),
        function(____, ____bindingPattern0)
            local patches
            local hero
            hero = ____bindingPattern0[1]
            patches = ____bindingPattern0[2]
            if not patches then
                return
            end
            local abilities = __TS__ObjectFromEntries(__TS__ArrayMap(
                __TS__ArrayFilter(
                    __TS__ObjectEntries(patches),
                    function(____, ____bindingPattern0)
                        local info
                        local _ = ____bindingPattern0[1]
                        info = ____bindingPattern0[2]
                        return info.abilities ~= nil and info.enabled ~= false
                    end
                ),
                function(____, ____bindingPattern0)
                    local info
                    local patch
                    patch = ____bindingPattern0[1]
                    info = ____bindingPattern0[2]
                    return {patch, info.abilities}
                end
            ))
            CustomNetTables:SetTableValue("patches", hero, abilities)
        end
    )
    __TS__ArrayForEach(
        __TS__ObjectEntries(HERO_PATCHES),
        function(____, ____bindingPattern0)
            local patches
            local hero
            hero = ____bindingPattern0[1]
            patches = ____bindingPattern0[2]
            if not patches then
                return
            end
            local infos = {}
            __TS__ArrayForEach(
                __TS__ObjectEntries(patches),
                function(____, ____bindingPattern0)
                    local info
                    local patch
                    patch = ____bindingPattern0[1]
                    info = ____bindingPattern0[2]
                    infos[patch] = {hasTalents = not not info.hasTalents, hasAghanimsShard = not not info.hasAghanimsShard, hasFacet = not not info.hasFacet}
                end
            )
            CustomNetTables:SetTableValue("info", hero, infos)
        end
    )
    CustomNetTables:SetTableValue("item_patches", "items", ITEM_PATCHES)
end
function PatchManager.ReplaceHeroAbilities(self, unit, selectedPatch)
    if not unit:IsRealHero() then
        return
    end
    local unitName = unit:GetUnitName()
    local playerId = unit:GetPlayerID()
    if selectedPatch == nil or selectedPatch == CURRENT_PATCH or selectedPatch == "default" then
        return
    end
    if not __TS__ArrayIncludes(
        __TS__ObjectKeys(HERO_PATCHES),
        unitName
    ) then
        return
    end
    if not __TS__ArrayIncludes(
        __TS__ObjectKeys(HERO_PATCHES[unitName] or ({})),
        selectedPatch
    ) then
        return
    end
    print((((("[" .. self.name) .. "] ") .. unitName) .. " select ") .. selectedPatch)
    local heroChanges = HERO_PATCHES[unitName]
    if heroChanges == nil then
        return
    end
    local heroInfo = heroChanges[selectedPatch]
    if heroChanges == nil then
        return
    end
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            unit:GetAbilities(),
            function(____, ability) return not __TS__ArrayIncludes(
                ABILITY_EXCEPTIONS,
                ability:GetAbilityName()
            ) end
        ),
        function(____, ability) return unit:RemoveAbilityByHandle(ability) end
    )
    if heroInfo.abilities then
        do
            local i = 1
            while i <= 16 do
                local ability = heroInfo.abilities["ability" .. tostring(i)]
                if i > 6 and ability == nil then
                    break
                end
                local abilityHandler
                if type(ability) == "table" then
                    abilityHandler = unit:AddAbility(ability.name)
                else
                    abilityHandler = unit:AddAbility(self:GetAbilityReplacement(ability))
                end
                Timers:CreateTimer(
                    FrameTime(),
                    function()
                        abilityHandler:MarkAbilityButtonDirty()
                    end
                )
                i = i + 1
            end
        end
    end
    if heroInfo.talents then
        do
            local i = 10
            while i <= 25 do
                local rightTalent = heroInfo.talents["right" .. tostring(i)]
                local leftTalent = heroInfo.talents["left" .. tostring(i)]
                local rightHandler = unit:AddAbility(self:GetTalentReplacement(rightTalent))
                local leftHandler = unit:AddAbility(self:GetTalentReplacement(leftTalent))
                Timers:CreateTimer(
                    FrameTime(),
                    function()
                        rightHandler:MarkAbilityButtonDirty()
                        leftHandler:MarkAbilityButtonDirty()
                    end
                )
                i = i + 5
            end
        end
    end
    if heroInfo.hasAttributeBonus then
        unit:AddAbility("special_bonus_attributes")
    end
    if heroInfo.stats then
        if heroInfo.stats.primaryAttribute then
            local attribute = heroInfo.stats.primaryAttribute
            Timers:CreateTimer(
                0.1,
                function()
                    unit:SetPrimaryAttribute(attribute)
                end
            )
            unit.custom_data.selected_attribute = attribute
            if attribute == DOTA_ATTRIBUTE_ALL then
                modifier_old_universal_damage_custom:apply(unit, unit, nil, {bonus_damage = heroInfo.stats.allDamageBonus})
            end
        end
        if heroInfo.stats.agility then
            unit:SetBaseAgility(heroInfo.stats.agility)
        end
        if heroInfo.stats.agilityGain then
            unit.GetAgilityGain = function(self)
                return heroInfo.stats.agilityGain
            end
        end
        if heroInfo.stats.strength then
            unit:SetBaseStrength(heroInfo.stats.strength)
        end
        if heroInfo.stats.strengthGain then
            unit.GetStrengthGain = function(self)
                return heroInfo.stats.strengthGain
            end
        end
        if heroInfo.stats.intelligence then
            unit:SetBaseIntellect(heroInfo.stats.intelligence)
        end
        if heroInfo.stats.intelligenceGain then
            unit.GetIntellectGain = function(self)
                return heroInfo.stats.intelligenceGain
            end
        end
        if heroInfo.stats.attackDamageMin then
            unit:SetBaseDamageMin(heroInfo.stats.attackDamageMin)
        end
        if heroInfo.stats.attackDamageMax then
            unit:SetBaseDamageMax(heroInfo.stats.attackDamageMax)
        end
        if heroInfo.stats.healthRegen then
            unit:SetBaseHealthRegen(heroInfo.stats.healthRegen)
        end
        if heroInfo.stats.manaRegen then
            unit:SetBaseManaRegen(heroInfo.stats.manaRegen)
        end
        if heroInfo.stats.armor then
            unit:SetPhysicalArmorBaseValue(heroInfo.stats.armor)
        end
        if heroInfo.stats.magicResistance then
            unit:SetBaseMagicalResistanceValue(heroInfo.stats.magicResistance)
        end
        if heroInfo.stats.movementSpeed then
            unit:SetBaseMoveSpeed(heroInfo.stats.movementSpeed)
        end
        if heroInfo.stats.attackRange then
            unit.GetBaseAttackRange = function(self)
                return heroInfo.stats.attackRange
            end
        end
        if heroInfo.stats.attackPoint then
            unit.GetAttackAnimationPoint = function(self)
                return heroInfo.stats.attackPoint
            end
        end
        if heroInfo.stats.attackType then
            unit:SetAttackCapability(heroInfo.stats.attackType)
        end
        if heroInfo.stats.baseAttackTime then
            unit:SetBaseAttackTime(heroInfo.stats.baseAttackTime)
        end
        if heroInfo.stats.projectileSpeed then
            unit.GetProjectileSpeed = function(self)
                return heroInfo.stats.projectileSpeed
            end
        end
        if heroInfo.stats.dayVision then
            unit:SetDayTimeVisionRange(heroInfo.stats.dayVision)
        end
        if heroInfo.stats.nightVision then
            unit:SetNightTimeVisionRange(heroInfo.stats.nightVision)
        end
        unit:CalculateGenericBonuses()
        unit:CalculateStatBonus(true)
    end
    if not heroInfo.hasAghanimsShard then
        unit:AddNewModifier(unit, nil, "modifier_item_aghanims_shard", {})
    end
    local ____CustomNetTables_SetTableValue_7 = CustomNetTables.SetTableValue
    local ____temp_2 = not not heroInfo.hasTalents
    local ____temp_3 = not not heroInfo.hasAghanimsShard
    local ____temp_4 = not not heroInfo.hasFacet
    local ____temp_5 = not not heroInfo.hasAttributeBonus
    local ____selectedPatch_6 = selectedPatch
    local ____opt_0 = heroInfo.stats
    ____CustomNetTables_SetTableValue_7(CustomNetTables, "heroes", unitName, {
        showTalents = ____temp_2,
        showAghanims = ____temp_3,
        showFacets = ____temp_4,
        showAttribute = ____temp_5,
        selectedPatch = ____selectedPatch_6,
        mainAttribute = ____opt_0 and ____opt_0.primaryAttribute,
        maxLevel = heroInfo.maxLevel
    })
    if unit:GetUnitName() == "npc_dota_hero_huskar" then
        Timers:CreateTimer(
            FrameTime(),
            function() return unit:SetMana(unit:GetMaxMana()) end
        )
    end
end
function PatchManager.ReplaceHeroItem(self, unit, item, patch, slot)
    if not unit:IsFullyRealHero() then
        return
    end
    local slotItem = unit:GetItemInSlot(slot)
    if not slotItem then
        return
    end
    local patchItem = __TS__ArrayFind(
        ITEM_PATCHES,
        function(____, patchItem) return __TS__ArrayIncludes(patchItem.items, item) and __TS__ArrayIncludes(
            __TS__ObjectKeys(patchItem.patches),
            patch
        ) end
    )
    if not patchItem then
        return
    end
    local replacement = patchItem.patches[patch]
    if not replacement then
        return
    end
    if replacement == item then
        return
    end
    local newItem = unit:AddItemByName(replacement)
    if not newItem then
        return
    end
    newItem:SetPurchaser(unit)
    newItem:SetPurchaseTime(0)
    local slotItemCastable = slotItem:IsFullyCastable()
    repeat
        local ____switch72 = newItem:GetName()
        local ____cond72 = ____switch72 == "item_black_king_bar_custom_728"
        if ____cond72 then
            local ____newItem_SetLevel_9 = newItem.SetLevel
            local ____unit_custom_data_bkb_level_8 = unit.custom_data.bkb_level
            if ____unit_custom_data_bkb_level_8 == nil then
                ____unit_custom_data_bkb_level_8 = 1
            end
            ____newItem_SetLevel_9(newItem, ____unit_custom_data_bkb_level_8)
            break
        end
        ____cond72 = ____cond72 or ____switch72 == "item_hand_of_midas_custom_727"
        if ____cond72 then
            local ____newItem_10, ____charges_11 = newItem, "charges"
            if ____newItem_10[____charges_11] == nil then
                ____newItem_10[____charges_11] = slotItem:GetCurrentCharges()
            end
            newItem.charges = newItem.charges
            if not slotItemCastable then
                newItem:StartCooldown(110 * unit:GetCooldownReduction())
            end
            break
        end
        ____cond72 = ____cond72 or ____switch72 == "item_hand_of_midas"
        if ____cond72 then
            if slotItem.charges ~= nil then
                local charges = slotItem.charges
                if not slotItemCastable then
                    charges = charges - 1
                end
                newItem:RefreshCharges()
                newItem:SetCurrentCharges(math.max(0, charges))
            end
            break
        end
        ____cond72 = ____cond72 or ____switch72 == "item_bloodstone"
        if ____cond72 then
            local ____newItem_13, ____charges_14 = newItem, "charges"
            if ____newItem_13[____charges_14] == nil then
                ____newItem_13[____charges_14] = slotItem:GetCurrentCharges()
            end
            newItem.charges = newItem.charges
            break
        end
        ____cond72 = ____cond72 or (____switch72 == "item_bloodstone_custom_707" or ____switch72 == "item_bloodstone_custom_728")
        if ____cond72 then
            if slotItem:GetName() ~= "item_bloodstone" then
                newItem:SetCurrentCharges(slotItem:GetCurrentCharges())
            elseif slotItem.charges ~= nil then
                newItem:SetCurrentCharges(slotItem.charges)
            end
            break
        end
        do
            break
        end
    until true
    UTIL_Remove(slotItem)
    unit:SwapItems(
        newItem:GetItemSlot(),
        slot
    )
end
function PatchManager.GetAbilityReplacement(self, abilityName)
    return abilityName or "generic_hidden"
end
function PatchManager.GetTalentReplacement(self, talentName)
    return talentName or "special_bonus_undefined"
end
return ____exports
