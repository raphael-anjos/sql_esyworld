start transaction;
update vd_pedido_comissao 
set perc_participacao = 1
where perc_participacao = 0 and tp_owner = 1 
and cod_pedido in (96800,96914,97668,97670,97673,97674,97676,97677,98581,99290,99300,99483,99494,99510,99527,99544,99573,99576,99578,99592,
99656,99684,99699,99786,99803,99821,99824,99827,99846,99892,99893,99911,99928,99995,100056,100090,100106,100159,100167,100192,
100196,100201,100203,100235,100240,100284,99968,97381,99373,99423,99436,99455,99462,99464,99472,99473,99474,99475,99478,99484,
99492,99493,99495,99496,99512,99513,99514,99515,99518,99537,99538,99551,99554,99556,99577,99580,99581,99584,99594,99611,99620,99622,99624,99627,
99628,99630,99631,99659,99664,99666,99670,99671,99675,99681,99682,99683,99721,99723,99731,99732,99733,99734,99746,99748,99754,99760,99787,99789,
99793,99796,99799,99805,99812,99815,99816,99831,99837,99851,99871,99874,99879,99883,99898,99899,99901,99902,99903,99904,99917,99925,99929,99930,
99934,99935,99937,99943,99947,99949,99951,99954,99970,99972,99981,100012,100020,100024,100025,100026,100027,100028,100030,100045,100046,100052,
100055,100059,100062,100063,100081,100085,100086,100101,100102,100103,100119,100126,100127,100130,100132,100144,100146,100149,100152,100153,
100163,100164,100171,100174,100176,100187,100209,100210,100213,100233,100251,100253,100256,100265,100268,100285,100286,100288,100291,100292,
100296,100312,100317,100328,100361,100389,103313,99524,99716,100150,98586,98861,98862,98863,99246,99281,99435,99438,
99442,99457,99461,99467,99479,99480,99489,99503,99526,99535,99549,99552,99555,99560,99562,99563,99564,99565,99566,99570,
99633,99647,99648,99654,99674,99714,99726,99739,99740,99745,99773,99877,99880,99938,99984,100018,100023,100050,100084,100109,100116,100117,
100165,100198,100200,100204,100242,100246,100252,100255,100261,101754,102133,98270,99365,99453,99468,99482,99486,99491,99655,99661,99663,
99665,99667,99700,99713,99715,99718,99742,99747,99755,99762,99792,99810,99825,99826,99833,99839,99844,99847,99849,99860,99966,99983,
100013,100033,100035,100070,100071,100098,100105,100124,100136,100141,100154,100156,100243,100247,100274,100275,100276,100277,100278,
100279,100282,100316,101312,99306,99448,99451,99504,99532,99533,99543,99546,99553,99610,99650,99668,99691,99693,99694,99695,99697,
99708,99772,99809,99822,99828,99922,99924,99927,99936,100003,100004,100014,100034,100044,100047,100091,100166,100169,100228,100237,
100297,100300,100303,100310,100324,100329,99388,99406,99432,99444,99454,99485,99500,99501,99506,99511,99517,99523,99529,99540,
99574,99579,99582,99626,99632,99672,99673,99690,99724,99725,99738,99743,99749,99751,99753,99776,99784,99836,99840,99843,99867,99886,
99912,99923,99926,99932,99933,99948,99973,99974,99992,99994,100019,100022,100039,100042,100048,100061,100110,100111,100113,100120,
100180,100184,100206,100211,100258,100262,100272,100289,100304,100308,100314,100322,100326,100398,102161,98223,98687,98898,98970,
99528,99534,99547,99598,99677,99680,99703,99730,99757,99779,99781,99782,99783,99802,99804,99820,99869,99876,99895,99913,99952,99980,
99982,100009,100010,100049,100053,100114,100129,100134,100138,100186,100189,100207,100229,100241,100270,100273,100299,100301,99061,
99297,99433,99439,99440,99441,99443,99460,99471,99481,99498,99502,99507,99508,99509,99522,99545,99559,99567,99569,99575,99596,99597,
99614,99649,99669,99704,99706,99707,99710,99719,99727,99761,99764,99768,99775,99778,99780,99788,99811,99813,99818,99829,99832,99835,
99841,99845,99866,99887,99890,99896,99910,99915,99920,99921,99931,99945,99967,99969,99971,99985,99993,100005,100006,100031,100032,100072,100075,100115,
100128,100172,100175,100178,100181,100185,100234,100290,100293,100313,100320,98117,99542,99658,99763,99996,100017,100021,100100,100131,98302,98521,
99521,99561,99595,99720,99729,99741,99766,99771,99878,99888,99897,99916,99977,99986,100051,100089,100097,100123,100147,100151,100161,100177,
100193,100226,100281,100305,100334,100345,100360);

commit;