select cod_pedido as 'pedido', 
		 cod_cliente as 'codigo cliente', 
		 upper(nome_cliente) as 'nome do cliente', 
		 lower(email_cliente) as 'e-mail', 
		 concat ('(',ddd,') ',telefone) as 'telefone'
from vd_pedido
where cod_pedido in (98176,98177,98179,98182,98183,98184,98253,98254,98255,98256,98307,98308,98310,98311,98312,98314,98315,98316,
98322,98363,98366,98367,98369,98387,98370,98371,98372,98381,98382,98384,98386,98388,98389,98390,98391,98422,99193,
98423,98424,98425,98426,98450,98441,98467,98470,98472,98473,98474,98990,98786,98475,98476,98477,98478,98479,
98480,98536,98892,98895,98537,98538,98539,98547,98549,98551,98552,98553,98555,98562,98563,98566,98904,98905,
98568,98589,98590,98591,98592,98657,98660,98661,98663,98665,98666,98698,98700,98703,98977,98704,98906,98910,
98705,98706,98708,98710,98711,98712,98713,98714,98765,98766,98768,98771,98772,98774,98775,98776,98911,98959,
98778,98779,98780,98782,98783,98785,98787,98788,98865,98866,98868,98869,98871,98872,98886,98889,98960,98961,
98963,98966,98969,98971,98973,98974,98975,98978,98981,98989,99034,99036,99042,99093,99094,99095,99097,99098,
99099,99100,99101,99102,99191,99192,99247,99248,99250,99251,99252,99255,99257,99259,99260,99261,99347,99348,
99349,99350,99351,99352,99354,99396,99414,99585,99586,99587,99588,99599,99601,99602,99603,99604,99605,99606,
99607,99608,99609,97022,99615,99616,99617,99618,99621,99623,99625,99629,99643,99644,99646,99689,99692,99696,
99698,99701,99702,100150,99791,99794,99795,99797,99798,99800,99806,99830,99853,99854,99855,99856,99857,99858,
99859,99862,99863,99865,99868,99870,99872,99873,99884,99889,99953,99957,99955,99956,99987,100155,99990,100057,
100058,100060,100064,100065,100066,100076,100077,100087,100099,100143,100145,100191,100194,100195,100197,100199,
100202,100339,100340,100342,100343,100344,100346,100349,100350,100351,100352,100353,100354,100524,100528,100530,
100531,100532,100533,100534,100535,100536,100537,100538,100568,100569,100570,100572,100573,100574,100626,100707,
100709,100711,100717,100721,100722,100338,100348,100789,100791,100792,100793,100795,100889,100888,100886,100885,
100890,100892,100895,100896,100897,100898,100901,100902,100903,100906,100964,100965,101070,101514,101238,101240,
101243,101244,101245,101247,101249,101135,101251,101252,101253,101254,101255,101256,101257,101259,101260,101261,
101345,101344,101347,101424,101454,101495,101496,101497,101498,101499,101500,101508,101510,101518,101520,101516,
101522,101525,101526,101528,101532,101536,101494,101537,101539,101540,101541,101543,101548,101550,101551,101552,
101553,101618,101619,101620,101621,101622,101624,101625,101626,101627,101628,101629,101693,101694,101695,101697,
101716,101720,101721,101722,101723,101724,101725,101726,101777,101778,101780,101786,101788,101790,101819,101823,
101828,101829,101970,101972,100653,100654,100656,100658,100660,101976,101978,101981,101984,101986,101987,101988,
101992,101994,102007,102008,102029,102031,102032,102175,102177,102178,102181,102182,102186,102187,102189,102190,
102191,102192,102193,102633,102635,102636,102637,102639,102641,102643,102646,102649,102650,102651,102653,102654,
102644,102655,102656,102657,102659,102660,102661,102662,102663,102664,102665,102666,102667,102668,102669,102670,
102671,102672,102673,102674,102727,102746,102750,102753,102754,102757,102759,102760,102762,102763,102764,102768,
102769,102772,102773,102774,102775,102777,102778,102779,102780,102781,102789,102791,102793,102794,102796,102799,
102850,102856,102857,102859,102862,102864,102865,102866,102870,102871,102872,102873,102874,102876,102880,102883,
102942,103155,103165,103169,103172,103174,103180,103184,103185,103187,103191,103194,103196,103201,103229,103228,
103227,103226,103225,103224,103223,103230,103222,102221,103220,103218,103217,103216,103215,103203,103206,103207,
103209,103211,103213,102776,103507,103161,103509,103512,103515,103519,103521,103579,103580,103524,103582,103637,
103639,103646,103651,103699,103702,103704,103708,103709,103710,103711,103713,103714,103523,103718,103720,103722,
103723,103724,103726,103727,103728,103729,103731,103782,103783,103784,103785,103816,103819,103820,103825,103826,
103834,103843,103845,103846,103847,103848,103849,103850,103852,103853,103856,103857,103858,103861,103865,103869,
103872,103873,103874,103875,103876,104023,104025,104026,104027,104028,104029,104030,104031,104032,104040,104041,
104042,104046,104049,104051,104053,104056,104057,104126,104127,104129,104132,104186,104187,104188,104189,104190,
104191,104224,104225,104226,104230,104232,104233,104234,104236,104411,104412,104413,104414,104087,104088,104090,
104091,104093,104094,104096,104097,104122,104151,104152,104153,104239,104240,104241,104280,104501,104523,104525,
104526,104527,104528,104529,104530,104531,104532,104533,104534,104535,104536,104537,104538,104539,104540,104541,
104542,104543,104544,104545,104546,104547,104548,104549,104550,104551,104552,104644,104637,104640,104646,104652,
104656,104658,104661,105062,105064,105065,105077,105079,105086,105087,105089,105090,105093,105094,105095,105096,
105097,105171,105173,105174,105176,105177,105178,105180,105182,105183,105185,105187,105189,105191,105192,105193,
105194,105197,105199,105200,105202,105204,105206,105208,105221,105222,105223,105224,105225,105236,105238,105246,
105248,105250,105252,105253,105254,105257,105258,105259,105260,105262,105269,105270,105302,105306,105311,105315,
105316,105317,105318,105319,105321,105360,105361,105362,105363,105364,105365,105376,105377,105407,105446,105409,
105410,105411,105422,105423,105424,105428,105430,105431,105433,105436,105438,105445,105268,105366,105408,105412,
105413,105420,105421,105425,105426,105434,105435,105442,105447,105448,105451,105454,105455,105812,105814,105815,
105817,105820,105822,105823,105825,105858,105859,105860,105861,105863,105864,105866,105868,105869,105894,105897,
105901,105902,105904,105905,105915,105916,105917,105918,105919,105921,105922,105924,105925,105926,105927,105928,
105929,105930,105931,105943,105944,105946,105950,105951,105954,105955,105960,105961,105963,105965,105967,105972,
106154,106156,106158,106060,106059,106164,106167,106180,106183,106186,106187,106190,106191,106192,106193,106194,
106195,106201,106202,106203,106204,106205,106206,106207,106209,106210,106211,106213,106216,106217,106219,106221,
106268,106269,106271,106223,106226,106227,106230,106232,106250,106237,106238,106239,106240,106241,106242,106244,
106245,106247,106248,106249,106251,106252,106253,106254,106255,106256,106289,106290,106291,106292,106293,106294,
106296);