; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [190 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [380 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 106
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 67
	i32 40744412, ; 2: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 79
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 178
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 64
	i32 98325684, ; 6: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 47
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 163
	i32 126276733, ; 8: Polly.Extensions.Http => 0x786d47d => 72
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 82
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 101
	i32 195452805, ; 11: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 12: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 123
	i32 220171995, ; 14: System.Diagnostics.Debug => 0xd1f8edb => 126
	i32 221958352, ; 15: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 46
	i32 230752869, ; 16: Microsoft.CSharp.dll => 0xdc10265 => 113
	i32 231814094, ; 17: System.Globalization => 0xdd133ce => 135
	i32 246610117, ; 18: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 155
	i32 280992041, ; 19: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 291275502, ; 20: Microsoft.Extensions.Http.dll => 0x115c82ee => 48
	i32 317674968, ; 21: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 22: Xamarin.AndroidX.Activity.dll => 0x13031348 => 75
	i32 336156722, ; 23: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 24: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 89
	i32 356389973, ; 25: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 367780167, ; 26: System.IO.Pipes => 0x15ebe147 => 138
	i32 379916513, ; 27: System.Threading.Thread.dll => 0x16a510e1 => 178
	i32 385762202, ; 28: System.Memory.dll => 0x16fe439a => 141
	i32 395744057, ; 29: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 30: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 31: System.Collections => 0x1a61054f => 119
	i32 450948140, ; 32: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 88
	i32 456227837, ; 33: System.Web.HttpUtility.dll => 0x1b317bfd => 180
	i32 459347974, ; 34: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 167
	i32 469710990, ; 35: System.dll => 0x1bff388e => 184
	i32 480374825, ; 36: Polly.Extensions.Http.dll => 0x1ca1f029 => 72
	i32 485463106, ; 37: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 54
	i32 498788369, ; 38: System.ObjectModel => 0x1dbae811 => 149
	i32 500358224, ; 39: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 40: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 41: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 53
	i32 539058512, ; 42: Microsoft.Extensions.Logging => 0x20216150 => 50
	i32 562494435, ; 43: Microsoft.Rest.ClientRuntime.Azure.dll => 0x2186fbe3 => 66
	i32 592146354, ; 44: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 45: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 613668793, ; 46: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 170
	i32 627609679, ; 47: Xamarin.AndroidX.CustomView => 0x2568904f => 86
	i32 627931235, ; 48: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 49: System.Text.Encodings.Web.dll => 0x27787397 => 173
	i32 672442732, ; 50: System.Collections.Concurrent => 0x2814a96c => 115
	i32 688181140, ; 51: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 52: System.Xml.Linq.dll => 0x29293ff5 => 181
	i32 699345723, ; 53: System.Reflection.Emit => 0x29af2b3b => 156
	i32 706645707, ; 54: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 55: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 56: System.Runtime.Loader.dll => 0x2b15ed29 => 164
	i32 759454413, ; 57: System.Net.Requests => 0x2d445acd => 146
	i32 762598435, ; 58: System.IO.Pipes.dll => 0x2d745423 => 138
	i32 775507847, ; 59: System.IO.Compression => 0x2e394f87 => 137
	i32 777317022, ; 60: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 783598934, ; 61: Fast_Cash => 0x2eb4c556 => 112
	i32 789151979, ; 62: Microsoft.Extensions.Options => 0x2f0980eb => 52
	i32 804715423, ; 63: System.Data.Common => 0x2ff6fb9f => 125
	i32 823281589, ; 64: System.Private.Uri.dll => 0x311247b5 => 151
	i32 830298997, ; 65: System.IO.Compression.Brotli => 0x317d5b75 => 136
	i32 839353180, ; 66: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 111
	i32 865465478, ; 67: zxing.dll => 0x3395f486 => 109
	i32 877678880, ; 68: System.Globalization.dll => 0x34505120 => 135
	i32 878954865, ; 69: System.Net.Http.Json => 0x3463c971 => 142
	i32 904024072, ; 70: System.ComponentModel.Primitives.dll => 0x35e25008 => 121
	i32 926902833, ; 71: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 72: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 106
	i32 939431778, ; 73: Polly.Core.dll => 0x37fe9762 => 71
	i32 955402788, ; 74: Newtonsoft.Json => 0x38f24a24 => 67
	i32 966729478, ; 75: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 105
	i32 967690846, ; 76: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 89
	i32 975236339, ; 77: System.Diagnostics.Tracing => 0x3a20ecf3 => 131
	i32 975874589, ; 78: System.Xml.XDocument => 0x3a2aaa1d => 183
	i32 986514023, ; 79: System.Private.DataContractSerialization.dll => 0x3acd0267 => 150
	i32 987214855, ; 80: System.Diagnostics.Tools => 0x3ad7b407 => 129
	i32 992768348, ; 81: System.Collections.dll => 0x3b2c715c => 119
	i32 1012816738, ; 82: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 99
	i32 1019214401, ; 83: System.Drawing => 0x3cbffa41 => 133
	i32 1028951442, ; 84: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 45
	i32 1029334545, ; 85: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 86: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 76
	i32 1036536393, ; 87: System.Drawing.Primitives.dll => 0x3dc84a49 => 132
	i32 1044663988, ; 88: System.Linq.Expressions.dll => 0x3e444eb4 => 139
	i32 1048992957, ; 89: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 47
	i32 1052210849, ; 90: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 91
	i32 1082857460, ; 91: System.ComponentModel.TypeConverter => 0x408b17f4 => 122
	i32 1084122840, ; 92: Xamarin.Kotlin.StdLib => 0x409e66d8 => 107
	i32 1098259244, ; 93: System => 0x41761b2c => 184
	i32 1118262833, ; 94: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1127295045, ; 95: Polly.dll => 0x43312845 => 70
	i32 1168523401, ; 96: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 97: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 96
	i32 1186231468, ; 98: Newtonsoft.Json.Bson.dll => 0x46b474ac => 68
	i32 1187360460, ; 99: Fast_Cash.dll => 0x46c5aecc => 112
	i32 1203215381, ; 100: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 101: System.Diagnostics.Process => 0x480a69ad => 128
	i32 1214827643, ; 102: CommunityToolkit.Mvvm => 0x4868cc7b => 38
	i32 1234928153, ; 103: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 104: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 105: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 87
	i32 1309188875, ; 106: System.Private.DataContractSerialization => 0x4e08a30b => 150
	i32 1324164729, ; 107: System.Linq => 0x4eed2679 => 140
	i32 1373134921, ; 108: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 109: Xamarin.AndroidX.SavedState => 0x52114ed3 => 99
	i32 1379779777, ; 110: System.Resources.ResourceManager => 0x523dc4c1 => 160
	i32 1406073936, ; 111: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 83
	i32 1408764838, ; 112: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 166
	i32 1411638395, ; 113: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 161
	i32 1424762768, ; 114: Microsoft.Rest.ClientRuntime.Azure => 0x54ec2790 => 66
	i32 1430672901, ; 115: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 116: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 105
	i32 1452070440, ; 117: System.Formats.Asn1.dll => 0x568cd628 => 134
	i32 1453312822, ; 118: System.Diagnostics.Tools.dll => 0x569fcb36 => 129
	i32 1460893475, ; 119: System.IdentityModel.Tokens.Jwt => 0x57137723 => 73
	i32 1461004990, ; 120: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 121: System.Collections.Immutable.dll => 0x5718a9ef => 116
	i32 1462112819, ; 122: System.IO.Compression.dll => 0x57261233 => 137
	i32 1469204771, ; 123: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 77
	i32 1470490898, ; 124: Microsoft.Extensions.Primitives => 0x57a5e912 => 53
	i32 1479771757, ; 125: System.Collections.Immutable => 0x5833866d => 116
	i32 1480492111, ; 126: System.IO.Compression.Brotli.dll => 0x583e844f => 136
	i32 1493001747, ; 127: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 128: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 55
	i32 1505131794, ; 129: Microsoft.Extensions.Http => 0x59b67d12 => 48
	i32 1514721132, ; 130: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 131: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 175
	i32 1543355203, ; 132: System.Reflection.Emit.dll => 0x5bfdbb43 => 156
	i32 1550322496, ; 133: System.Reflection.Extensions.dll => 0x5c680b40 => 157
	i32 1551623176, ; 134: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1551954004, ; 135: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 58
	i32 1570023712, ; 136: Microsoft.Azure.CognitiveServices.Vision.ComputerVision.dll => 0x5d94a920 => 41
	i32 1575375756, ; 137: Polly.Core => 0x5de6538c => 71
	i32 1622152042, ; 138: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 93
	i32 1624863272, ; 139: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 103
	i32 1634654947, ; 140: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 141: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 85
	i32 1639515021, ; 142: System.Net.Http.dll => 0x61b9038d => 143
	i32 1639986890, ; 143: System.Text.RegularExpressions => 0x61c036ca => 175
	i32 1641389582, ; 144: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 120
	i32 1657153582, ; 145: System.Runtime => 0x62c6282e => 168
	i32 1658251792, ; 146: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 104
	i32 1677501392, ; 147: System.Net.Primitives.dll => 0x63fca3d0 => 145
	i32 1679769178, ; 148: System.Security.Cryptography => 0x641f3e5a => 171
	i32 1701541528, ; 149: System.Diagnostics.Debug.dll => 0x656b7698 => 126
	i32 1726116996, ; 150: System.Reflection.dll => 0x66e27484 => 159
	i32 1729485958, ; 151: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 81
	i32 1736233607, ; 152: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 153: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 154: System.Diagnostics.TraceSource.dll => 0x69239124 => 130
	i32 1765942094, ; 155: System.Reflection.Extensions => 0x6942234e => 157
	i32 1766324549, ; 156: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 101
	i32 1770582343, ; 157: Microsoft.Extensions.Logging.dll => 0x6988f147 => 50
	i32 1780572499, ; 158: Mono.Android.Runtime.dll => 0x6a216153 => 188
	i32 1782862114, ; 159: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 160: Xamarin.AndroidX.Fragment => 0x6a96652d => 88
	i32 1793755602, ; 161: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 162: Xamarin.AndroidX.Loader => 0x6bcd3296 => 93
	i32 1813058853, ; 163: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 107
	i32 1813201214, ; 164: Xamarin.Google.Android.Material => 0x6c13413e => 104
	i32 1818569960, ; 165: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 97
	i32 1824175904, ; 166: System.Text.Encoding.Extensions => 0x6cbab720 => 172
	i32 1824722060, ; 167: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 166
	i32 1828688058, ; 168: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 51
	i32 1842015223, ; 169: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 170: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 171: System.Linq.Expressions => 0x6ec71a65 => 139
	i32 1870277092, ; 172: System.Reflection.Primitives => 0x6f7a29e4 => 158
	i32 1875935024, ; 173: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900610850, ; 174: System.Resources.ResourceManager.dll => 0x71490522 => 160
	i32 1910275211, ; 175: System.Collections.NonGeneric.dll => 0x71dc7c8b => 117
	i32 1939592360, ; 176: System.Private.Xml.Linq => 0x739bd4a8 => 152
	i32 1961813231, ; 177: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 100
	i32 1968388702, ; 178: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 42
	i32 1986222447, ; 179: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 57
	i32 2003115576, ; 180: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 181: System.Buffers.dll => 0x77ec19b4 => 114
	i32 2019465201, ; 182: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 91
	i32 2025202353, ; 183: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 184: System.Private.Xml => 0x79eb68ee => 153
	i32 2055257422, ; 185: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 90
	i32 2057861558, ; 186: CommunityToolkit.Maui.Markup => 0x7aa879b6 => 37
	i32 2066184531, ; 187: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2069514766, ; 188: Newtonsoft.Json.Bson => 0x7b5a4a0e => 68
	i32 2070888862, ; 189: System.Diagnostics.TraceSource => 0x7b6f419e => 130
	i32 2079903147, ; 190: System.Runtime.dll => 0x7bf8cdab => 168
	i32 2082593585, ; 191: Microsoft.Azure.CognitiveServices.Vision.ComputerVision => 0x7c21db31 => 41
	i32 2090596640, ; 192: System.Numerics.Vectors => 0x7c9bf920 => 148
	i32 2127167465, ; 193: System.Console => 0x7ec9ffe9 => 124
	i32 2142473426, ; 194: System.Collections.Specialized => 0x7fb38cd2 => 118
	i32 2143465592, ; 195: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 58
	i32 2159891885, ; 196: Microsoft.Maui => 0x80bd55ad => 62
	i32 2169148018, ; 197: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2179622097, ; 198: Emgu.CV => 0x81ea64d1 => 39
	i32 2181898931, ; 199: Microsoft.Extensions.Options.dll => 0x820d22b3 => 52
	i32 2192057212, ; 200: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 51
	i32 2193016926, ; 201: System.ObjectModel.dll => 0x82b6c85e => 149
	i32 2201107256, ; 202: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 108
	i32 2201231467, ; 203: System.Net.Http => 0x8334206b => 143
	i32 2207618523, ; 204: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 205: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 43
	i32 2270573516, ; 206: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 207: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 98
	i32 2295906218, ; 208: System.Net.Sockets => 0x88d8bfaa => 147
	i32 2298471582, ; 209: System.Net.Mail => 0x88ffe49e => 144
	i32 2303942373, ; 210: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 211: System.Private.CoreLib.dll => 0x896b7878 => 186
	i32 2340441535, ; 212: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 162
	i32 2350129686, ; 213: Microsoft.Rest.ClientRuntime.dll => 0x8c142216 => 65
	i32 2353062107, ; 214: System.Net.Primitives => 0x8c40e0db => 145
	i32 2368005991, ; 215: System.Xml.ReaderWriter.dll => 0x8d24e767 => 182
	i32 2369706906, ; 216: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 56
	i32 2371007202, ; 217: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 42
	i32 2392818924, ; 218: System.Net.Http.Formatting.dll => 0x8e9f84ec => 40
	i32 2395872292, ; 219: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 220: System.Web.HttpUtility => 0x8f24faee => 180
	i32 2427813419, ; 221: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 222: System.Console.dll => 0x912896e5 => 124
	i32 2458678730, ; 223: System.Net.Sockets.dll => 0x928c75ca => 147
	i32 2471841756, ; 224: netstandard.dll => 0x93554fdc => 185
	i32 2475788418, ; 225: Java.Interop.dll => 0x93918882 => 187
	i32 2480646305, ; 226: Microsoft.Maui.Controls => 0x93dba8a1 => 60
	i32 2483903535, ; 227: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 120
	i32 2538310050, ; 228: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 155
	i32 2550873716, ; 229: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 230: Microsoft.CSharp => 0x98ba5a04 => 113
	i32 2570120770, ; 231: System.Text.Encodings.Web => 0x9930ee42 => 173
	i32 2585220780, ; 232: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 172
	i32 2593496499, ; 233: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 234: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 108
	i32 2617129537, ; 235: System.Private.Xml.dll => 0x9bfe3a41 => 153
	i32 2620871830, ; 236: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 85
	i32 2626831493, ; 237: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2640290731, ; 238: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 56
	i32 2663698177, ; 239: System.Runtime.Loader => 0x9ec4cf01 => 164
	i32 2664396074, ; 240: System.Xml.XDocument.dll => 0x9ecf752a => 183
	i32 2665622720, ; 241: System.Drawing.Primitives => 0x9ee22cc0 => 132
	i32 2676780864, ; 242: System.Data.Common.dll => 0x9f8c6f40 => 125
	i32 2701298998, ; 243: Emgu.CV.dll => 0xa1028d36 => 39
	i32 2715334215, ; 244: System.Threading.Tasks.dll => 0xa1d8b647 => 177
	i32 2717744543, ; 245: System.Security.Claims => 0xa1fd7d9f => 169
	i32 2724373263, ; 246: System.Runtime.Numerics.dll => 0xa262a30f => 165
	i32 2732626843, ; 247: Xamarin.AndroidX.Activity => 0xa2e0939b => 75
	i32 2734223671, ; 248: Microsoft.Extensions.Http.Polly.dll => 0xa2f8f137 => 49
	i32 2737747696, ; 249: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 77
	i32 2752995522, ; 250: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 251: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 61
	i32 2764765095, ; 252: Microsoft.Maui.dll => 0xa4caf7a7 => 62
	i32 2778768386, ; 253: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 102
	i32 2785988530, ; 254: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 255: Microsoft.Maui.Graphics => 0xa7008e0b => 64
	i32 2806116107, ; 256: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 257: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 83
	i32 2831556043, ; 258: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 259: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 102
	i32 2861189240, ; 260: Microsoft.Maui.Essentials => 0xaa8a4878 => 63
	i32 2868488919, ; 261: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2901442782, ; 262: System.Reflection => 0xacf080de => 159
	i32 2909740682, ; 263: System.Private.CoreLib => 0xad6f1e8a => 186
	i32 2916838712, ; 264: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 103
	i32 2919462931, ; 265: System.Numerics.Vectors.dll => 0xae037813 => 148
	i32 2959614098, ; 266: System.ComponentModel.dll => 0xb0682092 => 123
	i32 2961259629, ; 267: Microsoft.Rest.ClientRuntime => 0xb0813c6d => 65
	i32 2965157864, ; 268: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 80
	i32 2972252294, ; 269: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 170
	i32 2978675010, ; 270: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 87
	i32 2987532451, ; 271: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 100
	i32 2991449226, ; 272: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 78
	i32 3000842441, ; 273: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 80
	i32 3020703001, ; 274: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 46
	i32 3038032645, ; 275: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 276: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 78
	i32 3057625584, ; 277: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 94
	i32 3059408633, ; 278: Mono.Android.Runtime => 0xb65adef9 => 188
	i32 3059793426, ; 279: System.ComponentModel.Primitives => 0xb660be12 => 121
	i32 3075834255, ; 280: System.Threading.Tasks => 0xb755818f => 177
	i32 3077302341, ; 281: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 282: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 57
	i32 3099732863, ; 283: System.Security.Claims.dll => 0xb8c22b7f => 169
	i32 3103600923, ; 284: System.Formats.Asn1 => 0xb8fd311b => 134
	i32 3124832203, ; 285: System.Threading.Tasks.Extensions => 0xba4127cb => 176
	i32 3147165239, ; 286: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 131
	i32 3159123045, ; 287: System.Reflection.Primitives.dll => 0xbc4c6465 => 158
	i32 3178803400, ; 288: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 95
	i32 3180026441, ; 289: Tesseract => 0xbd8b5a49 => 74
	i32 3215347189, ; 290: zxing => 0xbfa64df5 => 109
	i32 3220365878, ; 291: System.Threading => 0xbff2e236 => 179
	i32 3258312781, ; 292: Xamarin.AndroidX.CardView => 0xc235e84d => 81
	i32 3265893370, ; 293: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 176
	i32 3286373667, ; 294: ZXing.Net.MAUI.dll => 0xc3e21523 => 110
	i32 3305363605, ; 295: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 296: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 55
	i32 3316684772, ; 297: System.Net.Requests.dll => 0xc5b097e4 => 146
	i32 3317135071, ; 298: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 86
	i32 3346324047, ; 299: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 96
	i32 3357674450, ; 300: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 301: System.Text.Json => 0xc82afec1 => 174
	i32 3362522851, ; 302: Xamarin.AndroidX.Core => 0xc86c06e3 => 84
	i32 3366347497, ; 303: Java.Interop => 0xc8a662e9 => 187
	i32 3374999561, ; 304: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 98
	i32 3381016424, ; 305: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 306: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 161
	i32 3402775237, ; 307: CommunityToolkit.Maui.Markup.dll => 0xcad23ac5 => 37
	i32 3428513518, ; 308: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 44
	i32 3430777524, ; 309: netstandard => 0xcc7d82b4 => 185
	i32 3448896322, ; 310: Polly => 0xcd91fb42 => 70
	i32 3452344032, ; 311: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 59
	i32 3463511458, ; 312: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 313: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 122
	i32 3476120550, ; 314: Mono.Android => 0xcf3163e6 => 189
	i32 3479583265, ; 315: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 316: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 317: System.Text.Json.dll => 0xcfbaacae => 174
	i32 3509114376, ; 318: System.Xml.Linq => 0xd128d608 => 181
	i32 3580758918, ; 319: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 320: System.Linq.dll => 0xd715a361 => 140
	i32 3624195450, ; 321: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 162
	i32 3641597786, ; 322: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 90
	i32 3643446276, ; 323: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 324: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 95
	i32 3657292374, ; 325: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 43
	i32 3672681054, ; 326: Mono.Android.dll => 0xdae8aa5e => 189
	i32 3676461095, ; 327: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 79
	i32 3697841164, ; 328: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 329: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 54
	i32 3724971120, ; 330: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 94
	i32 3737834244, ; 331: System.Net.Http.Json.dll => 0xdecad304 => 142
	i32 3748608112, ; 332: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 127
	i32 3751582913, ; 333: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 111
	i32 3786282454, ; 334: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 82
	i32 3792276235, ; 335: System.Collections.NonGeneric => 0xe2098b0b => 117
	i32 3799742899, ; 336: Tesseract.dll => 0xe27b79b3 => 74
	i32 3800979733, ; 337: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 59
	i32 3802395368, ; 338: System.Collections.Specialized.dll => 0xe2a3f2e8 => 118
	i32 3817368567, ; 339: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 340: System.Security.Cryptography.dll => 0xe3df9d2b => 171
	i32 3841636137, ; 341: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 45
	i32 3842894692, ; 342: ZXing.Net.MAUI => 0xe50deb64 => 110
	i32 3844307129, ; 343: System.Net.Mail.dll => 0xe52378b9 => 144
	i32 3849253459, ; 344: System.Runtime.InteropServices.dll => 0xe56ef253 => 163
	i32 3889960447, ; 345: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896087913, ; 346: OpenCvSharp => 0xe8399569 => 69
	i32 3896106733, ; 347: System.Collections.Concurrent.dll => 0xe839deed => 115
	i32 3896760992, ; 348: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 84
	i32 3928044579, ; 349: System.Xml.ReaderWriter => 0xea213423 => 182
	i32 3931092270, ; 350: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 97
	i32 3955647286, ; 351: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 76
	i32 3980434154, ; 352: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 353: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 354: System.Diagnostics.Process.dll => 0xee9f991d => 128
	i32 4008686814, ; 355: Microsoft.Extensions.Http.Polly => 0xeeefb4de => 49
	i32 4025784931, ; 356: System.Memory => 0xeff49a63 => 141
	i32 4046471985, ; 357: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 61
	i32 4054681211, ; 358: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 154
	i32 4068434129, ; 359: System.Private.Xml.Linq.dll => 0xf27f60d1 => 152
	i32 4073602200, ; 360: System.Threading.dll => 0xf2ce3c98 => 179
	i32 4094352644, ; 361: Microsoft.Maui.Essentials.dll => 0xf40add04 => 63
	i32 4099507663, ; 362: System.Drawing.dll => 0xf45985cf => 133
	i32 4100113165, ; 363: System.Private.Uri => 0xf462c30d => 151
	i32 4102112229, ; 364: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 365: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 366: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 44
	i32 4131741489, ; 367: System.Net.Http.Formatting => 0xf6455f31 => 40
	i32 4147896353, ; 368: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 154
	i32 4150914736, ; 369: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 370: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 167
	i32 4182413190, ; 371: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 92
	i32 4213026141, ; 372: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 127
	i32 4260525087, ; 373: System.Buffers => 0xfdf2741f => 114
	i32 4263231520, ; 374: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 73
	i32 4271975918, ; 375: Microsoft.Maui.Controls.dll => 0xfea12dee => 60
	i32 4273543125, ; 376: OpenCvSharp.dll => 0xfeb917d5 => 69
	i32 4274623895, ; 377: CommunityToolkit.Mvvm.dll => 0xfec99597 => 38
	i32 4274976490, ; 378: System.Runtime.Numerics => 0xfecef6ea => 165
	i32 4292120959 ; 379: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 92
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [380 x i32] [
	i32 106, ; 0
	i32 67, ; 1
	i32 79, ; 2
	i32 178, ; 3
	i32 33, ; 4
	i32 64, ; 5
	i32 47, ; 6
	i32 163, ; 7
	i32 72, ; 8
	i32 82, ; 9
	i32 101, ; 10
	i32 30, ; 11
	i32 31, ; 12
	i32 123, ; 13
	i32 126, ; 14
	i32 46, ; 15
	i32 113, ; 16
	i32 135, ; 17
	i32 155, ; 18
	i32 2, ; 19
	i32 48, ; 20
	i32 30, ; 21
	i32 75, ; 22
	i32 15, ; 23
	i32 89, ; 24
	i32 14, ; 25
	i32 138, ; 26
	i32 178, ; 27
	i32 141, ; 28
	i32 34, ; 29
	i32 26, ; 30
	i32 119, ; 31
	i32 88, ; 32
	i32 180, ; 33
	i32 167, ; 34
	i32 184, ; 35
	i32 72, ; 36
	i32 54, ; 37
	i32 149, ; 38
	i32 13, ; 39
	i32 7, ; 40
	i32 53, ; 41
	i32 50, ; 42
	i32 66, ; 43
	i32 21, ; 44
	i32 35, ; 45
	i32 170, ; 46
	i32 86, ; 47
	i32 19, ; 48
	i32 173, ; 49
	i32 115, ; 50
	i32 1, ; 51
	i32 181, ; 52
	i32 156, ; 53
	i32 16, ; 54
	i32 4, ; 55
	i32 164, ; 56
	i32 146, ; 57
	i32 138, ; 58
	i32 137, ; 59
	i32 25, ; 60
	i32 112, ; 61
	i32 52, ; 62
	i32 125, ; 63
	i32 151, ; 64
	i32 136, ; 65
	i32 111, ; 66
	i32 109, ; 67
	i32 135, ; 68
	i32 142, ; 69
	i32 121, ; 70
	i32 28, ; 71
	i32 106, ; 72
	i32 71, ; 73
	i32 67, ; 74
	i32 105, ; 75
	i32 89, ; 76
	i32 131, ; 77
	i32 183, ; 78
	i32 150, ; 79
	i32 129, ; 80
	i32 119, ; 81
	i32 99, ; 82
	i32 133, ; 83
	i32 45, ; 84
	i32 3, ; 85
	i32 76, ; 86
	i32 132, ; 87
	i32 139, ; 88
	i32 47, ; 89
	i32 91, ; 90
	i32 122, ; 91
	i32 107, ; 92
	i32 184, ; 93
	i32 16, ; 94
	i32 70, ; 95
	i32 22, ; 96
	i32 96, ; 97
	i32 68, ; 98
	i32 112, ; 99
	i32 20, ; 100
	i32 128, ; 101
	i32 38, ; 102
	i32 18, ; 103
	i32 2, ; 104
	i32 87, ; 105
	i32 150, ; 106
	i32 140, ; 107
	i32 32, ; 108
	i32 99, ; 109
	i32 160, ; 110
	i32 83, ; 111
	i32 166, ; 112
	i32 161, ; 113
	i32 66, ; 114
	i32 0, ; 115
	i32 105, ; 116
	i32 134, ; 117
	i32 129, ; 118
	i32 73, ; 119
	i32 6, ; 120
	i32 116, ; 121
	i32 137, ; 122
	i32 77, ; 123
	i32 53, ; 124
	i32 116, ; 125
	i32 136, ; 126
	i32 10, ; 127
	i32 55, ; 128
	i32 48, ; 129
	i32 5, ; 130
	i32 175, ; 131
	i32 156, ; 132
	i32 157, ; 133
	i32 25, ; 134
	i32 58, ; 135
	i32 41, ; 136
	i32 71, ; 137
	i32 93, ; 138
	i32 103, ; 139
	i32 36, ; 140
	i32 85, ; 141
	i32 143, ; 142
	i32 175, ; 143
	i32 120, ; 144
	i32 168, ; 145
	i32 104, ; 146
	i32 145, ; 147
	i32 171, ; 148
	i32 126, ; 149
	i32 159, ; 150
	i32 81, ; 151
	i32 23, ; 152
	i32 1, ; 153
	i32 130, ; 154
	i32 157, ; 155
	i32 101, ; 156
	i32 50, ; 157
	i32 188, ; 158
	i32 17, ; 159
	i32 88, ; 160
	i32 9, ; 161
	i32 93, ; 162
	i32 107, ; 163
	i32 104, ; 164
	i32 97, ; 165
	i32 172, ; 166
	i32 166, ; 167
	i32 51, ; 168
	i32 29, ; 169
	i32 26, ; 170
	i32 139, ; 171
	i32 158, ; 172
	i32 8, ; 173
	i32 160, ; 174
	i32 117, ; 175
	i32 152, ; 176
	i32 100, ; 177
	i32 42, ; 178
	i32 57, ; 179
	i32 5, ; 180
	i32 114, ; 181
	i32 91, ; 182
	i32 0, ; 183
	i32 153, ; 184
	i32 90, ; 185
	i32 37, ; 186
	i32 4, ; 187
	i32 68, ; 188
	i32 130, ; 189
	i32 168, ; 190
	i32 41, ; 191
	i32 148, ; 192
	i32 124, ; 193
	i32 118, ; 194
	i32 58, ; 195
	i32 62, ; 196
	i32 12, ; 197
	i32 39, ; 198
	i32 52, ; 199
	i32 51, ; 200
	i32 149, ; 201
	i32 108, ; 202
	i32 143, ; 203
	i32 14, ; 204
	i32 43, ; 205
	i32 8, ; 206
	i32 98, ; 207
	i32 147, ; 208
	i32 144, ; 209
	i32 18, ; 210
	i32 186, ; 211
	i32 162, ; 212
	i32 65, ; 213
	i32 145, ; 214
	i32 182, ; 215
	i32 56, ; 216
	i32 42, ; 217
	i32 40, ; 218
	i32 13, ; 219
	i32 180, ; 220
	i32 10, ; 221
	i32 124, ; 222
	i32 147, ; 223
	i32 185, ; 224
	i32 187, ; 225
	i32 60, ; 226
	i32 120, ; 227
	i32 155, ; 228
	i32 11, ; 229
	i32 113, ; 230
	i32 173, ; 231
	i32 172, ; 232
	i32 20, ; 233
	i32 108, ; 234
	i32 153, ; 235
	i32 85, ; 236
	i32 15, ; 237
	i32 56, ; 238
	i32 164, ; 239
	i32 183, ; 240
	i32 132, ; 241
	i32 125, ; 242
	i32 39, ; 243
	i32 177, ; 244
	i32 169, ; 245
	i32 165, ; 246
	i32 75, ; 247
	i32 49, ; 248
	i32 77, ; 249
	i32 21, ; 250
	i32 61, ; 251
	i32 62, ; 252
	i32 102, ; 253
	i32 27, ; 254
	i32 64, ; 255
	i32 6, ; 256
	i32 83, ; 257
	i32 19, ; 258
	i32 102, ; 259
	i32 63, ; 260
	i32 36, ; 261
	i32 159, ; 262
	i32 186, ; 263
	i32 103, ; 264
	i32 148, ; 265
	i32 123, ; 266
	i32 65, ; 267
	i32 80, ; 268
	i32 170, ; 269
	i32 87, ; 270
	i32 100, ; 271
	i32 78, ; 272
	i32 80, ; 273
	i32 46, ; 274
	i32 34, ; 275
	i32 78, ; 276
	i32 94, ; 277
	i32 188, ; 278
	i32 121, ; 279
	i32 177, ; 280
	i32 12, ; 281
	i32 57, ; 282
	i32 169, ; 283
	i32 134, ; 284
	i32 176, ; 285
	i32 131, ; 286
	i32 158, ; 287
	i32 95, ; 288
	i32 74, ; 289
	i32 109, ; 290
	i32 179, ; 291
	i32 81, ; 292
	i32 176, ; 293
	i32 110, ; 294
	i32 7, ; 295
	i32 55, ; 296
	i32 146, ; 297
	i32 86, ; 298
	i32 96, ; 299
	i32 24, ; 300
	i32 174, ; 301
	i32 84, ; 302
	i32 187, ; 303
	i32 98, ; 304
	i32 3, ; 305
	i32 161, ; 306
	i32 37, ; 307
	i32 44, ; 308
	i32 185, ; 309
	i32 70, ; 310
	i32 59, ; 311
	i32 11, ; 312
	i32 122, ; 313
	i32 189, ; 314
	i32 24, ; 315
	i32 23, ; 316
	i32 174, ; 317
	i32 181, ; 318
	i32 31, ; 319
	i32 140, ; 320
	i32 162, ; 321
	i32 90, ; 322
	i32 28, ; 323
	i32 95, ; 324
	i32 43, ; 325
	i32 189, ; 326
	i32 79, ; 327
	i32 33, ; 328
	i32 54, ; 329
	i32 94, ; 330
	i32 142, ; 331
	i32 127, ; 332
	i32 111, ; 333
	i32 82, ; 334
	i32 117, ; 335
	i32 74, ; 336
	i32 59, ; 337
	i32 118, ; 338
	i32 35, ; 339
	i32 171, ; 340
	i32 45, ; 341
	i32 110, ; 342
	i32 144, ; 343
	i32 163, ; 344
	i32 32, ; 345
	i32 69, ; 346
	i32 115, ; 347
	i32 84, ; 348
	i32 182, ; 349
	i32 97, ; 350
	i32 76, ; 351
	i32 27, ; 352
	i32 9, ; 353
	i32 128, ; 354
	i32 49, ; 355
	i32 141, ; 356
	i32 61, ; 357
	i32 154, ; 358
	i32 152, ; 359
	i32 179, ; 360
	i32 63, ; 361
	i32 133, ; 362
	i32 151, ; 363
	i32 22, ; 364
	i32 17, ; 365
	i32 44, ; 366
	i32 40, ; 367
	i32 154, ; 368
	i32 29, ; 369
	i32 167, ; 370
	i32 92, ; 371
	i32 127, ; 372
	i32 114, ; 373
	i32 73, ; 374
	i32 60, ; 375
	i32 69, ; 376
	i32 38, ; 377
	i32 165, ; 378
	i32 92 ; 379
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
