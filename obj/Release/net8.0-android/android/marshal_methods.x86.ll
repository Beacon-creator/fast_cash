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

@assembly_image_cache = dso_local local_unnamed_addr global [232 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [464 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 175
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 174
	i32 34715100, ; 2: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 130
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 85
	i32 40744412, ; 4: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 102
	i32 42639949, ; 5: System.Threading.Thread => 0x28aa24d => 219
	i32 66541672, ; 6: System.Diagnostics.StackTrace => 0x3f75868 => 154
	i32 67008169, ; 7: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 8: System.Security.Cryptography.Primitives => 0x410f24b => 208
	i32 72070932, ; 9: Microsoft.Maui.Graphics.dll => 0x44bb714 => 82
	i32 98325684, ; 10: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 63
	i32 117431740, ; 11: System.Runtime.InteropServices => 0x6ffddbc => 198
	i32 122350210, ; 12: System.Threading.Channels.dll => 0x74aea82 => 216
	i32 126276733, ; 13: Polly.Extensions.Http => 0x786d47d => 90
	i32 142721839, ; 14: System.Net.WebHeaderCollection => 0x881c32f => 181
	i32 149972175, ; 15: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 208
	i32 165246403, ; 16: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 105
	i32 182336117, ; 17: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 124
	i32 195452805, ; 18: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 19: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 20: System.ComponentModel => 0xc38ff48 => 147
	i32 209399409, ; 21: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 100
	i32 220171995, ; 22: System.Diagnostics.Debug => 0xd1f8edb => 151
	i32 221958352, ; 23: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 62
	i32 230752869, ; 24: Microsoft.CSharp.dll => 0xdc10265 => 137
	i32 231814094, ; 25: System.Globalization => 0xdd133ce => 161
	i32 246610117, ; 26: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 190
	i32 280992041, ; 27: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 291275502, ; 28: Microsoft.Extensions.Http.dll => 0x115c82ee => 64
	i32 317674968, ; 29: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 30: Xamarin.AndroidX.Activity.dll => 0x13031348 => 97
	i32 321597661, ; 31: System.Numerics => 0x132b30dd => 183
	i32 336156722, ; 32: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 33: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 112
	i32 356389973, ; 34: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364956269, ; 35: Grpc.Net.Common => 0x15c0ca6d => 54
	i32 367780167, ; 36: System.IO.Pipes => 0x15ebe147 => 166
	i32 371306672, ; 37: Grpc.Core.Api.dll => 0x1621b0b0 => 52
	i32 375677976, ; 38: System.Net.ServicePoint.dll => 0x16646418 => 179
	i32 379916513, ; 39: System.Threading.Thread.dll => 0x16a510e1 => 219
	i32 385762202, ; 40: System.Memory.dll => 0x16fe439a => 169
	i32 391886110, ; 41: Grpc.Net.Client.dll => 0x175bb51e => 53
	i32 395744057, ; 42: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 43: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442521989, ; 44: Xamarin.Essentials => 0x1a605985 => 127
	i32 442565967, ; 45: System.Collections => 0x1a61054f => 143
	i32 450948140, ; 46: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 111
	i32 451504562, ; 47: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 209
	i32 456227837, ; 48: System.Web.HttpUtility.dll => 0x1b317bfd => 221
	i32 459347974, ; 49: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 202
	i32 465846621, ; 50: mscorlib => 0x1bc4415d => 226
	i32 469710990, ; 51: System.dll => 0x1bff388e => 225
	i32 480374825, ; 52: Polly.Extensions.Http.dll => 0x1ca1f029 => 90
	i32 485463106, ; 53: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 72
	i32 498788369, ; 54: System.ObjectModel => 0x1dbae811 => 184
	i32 500358224, ; 55: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 56: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 57: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 69
	i32 539058512, ; 58: Microsoft.Extensions.Logging => 0x20216150 => 66
	i32 548916678, ; 59: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 57
	i32 562494435, ; 60: Microsoft.Rest.ClientRuntime.Azure.dll => 0x2186fbe3 => 84
	i32 592146354, ; 61: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 62: CommunityToolkit.Maui => 0x239cf51b => 37
	i32 613668793, ; 63: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 206
	i32 627609679, ; 64: Xamarin.AndroidX.CustomView => 0x2568904f => 109
	i32 627931235, ; 65: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 66: System.Text.Encodings.Web.dll => 0x27787397 => 213
	i32 672442732, ; 67: System.Collections.Concurrent => 0x2814a96c => 139
	i32 683518922, ; 68: System.Net.Security => 0x28bdabca => 178
	i32 688181140, ; 69: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 70: System.Xml.Linq.dll => 0x29293ff5 => 222
	i32 699345723, ; 71: System.Reflection.Emit => 0x29af2b3b => 191
	i32 706645707, ; 72: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 73: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 74: System.Runtime.Loader.dll => 0x2b15ed29 => 199
	i32 723796036, ; 75: System.ClientModel.dll => 0x2b244044 => 91
	i32 759454413, ; 76: System.Net.Requests => 0x2d445acd => 177
	i32 762598435, ; 77: System.IO.Pipes.dll => 0x2d745423 => 166
	i32 775507847, ; 78: System.IO.Compression => 0x2e394f87 => 163
	i32 777317022, ; 79: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 783598934, ; 80: Fast_Cash => 0x2eb4c556 => 136
	i32 789151979, ; 81: Microsoft.Extensions.Options => 0x2f0980eb => 68
	i32 799104817, ; 82: Google.Cloud.Vision.V1.dll => 0x2fa15f31 => 48
	i32 804715423, ; 83: System.Data.Common => 0x2ff6fb9f => 150
	i32 823281589, ; 84: System.Private.Uri.dll => 0x311247b5 => 186
	i32 830298997, ; 85: System.IO.Compression.Brotli => 0x317d5b75 => 162
	i32 839353180, ; 86: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 135
	i32 865465478, ; 87: zxing.dll => 0x3395f486 => 133
	i32 877678880, ; 88: System.Globalization.dll => 0x34505120 => 161
	i32 878954865, ; 89: System.Net.Http.Json => 0x3463c971 => 170
	i32 904024072, ; 90: System.ComponentModel.Primitives.dll => 0x35e25008 => 145
	i32 926902833, ; 91: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 92: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 130
	i32 939431778, ; 93: Polly.Core.dll => 0x37fe9762 => 89
	i32 955402788, ; 94: Newtonsoft.Json => 0x38f24a24 => 85
	i32 966729478, ; 95: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 129
	i32 967690846, ; 96: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 112
	i32 975236339, ; 97: System.Diagnostics.Tracing => 0x3a20ecf3 => 157
	i32 975874589, ; 98: System.Xml.XDocument => 0x3a2aaa1d => 224
	i32 986514023, ; 99: System.Private.DataContractSerialization.dll => 0x3acd0267 => 185
	i32 987214855, ; 100: System.Diagnostics.Tools => 0x3ad7b407 => 155
	i32 992768348, ; 101: System.Collections.dll => 0x3b2c715c => 143
	i32 1012816738, ; 102: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 122
	i32 1019214401, ; 103: System.Drawing => 0x3cbffa41 => 159
	i32 1028951442, ; 104: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 61
	i32 1029334545, ; 105: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 106: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 98
	i32 1036536393, ; 107: System.Drawing.Primitives.dll => 0x3dc84a49 => 158
	i32 1044663988, ; 108: System.Linq.Expressions.dll => 0x3e444eb4 => 167
	i32 1048992957, ; 109: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 63
	i32 1049751285, ; 110: Google.Api.CommonProtos.dll => 0x3e91eef5 => 42
	i32 1052210849, ; 111: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 114
	i32 1062017875, ; 112: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 71
	i32 1082857460, ; 113: System.ComponentModel.TypeConverter => 0x408b17f4 => 146
	i32 1084122840, ; 114: Xamarin.Kotlin.StdLib => 0x409e66d8 => 131
	i32 1098259244, ; 115: System => 0x41761b2c => 225
	i32 1118262833, ; 116: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1127295045, ; 117: Polly.dll => 0x43312845 => 88
	i32 1168523401, ; 118: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 119: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 119
	i32 1186231468, ; 120: Newtonsoft.Json.Bson.dll => 0x46b474ac => 86
	i32 1187360460, ; 121: Fast_Cash.dll => 0x46c5aecc => 136
	i32 1203173028, ; 122: Grpc.Net.Client => 0x47b6f6a4 => 53
	i32 1203215381, ; 123: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 124: System.Diagnostics.Process => 0x480a69ad => 153
	i32 1214827643, ; 125: CommunityToolkit.Mvvm => 0x4868cc7b => 40
	i32 1234928153, ; 126: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1259219886, ; 127: Google.Cloud.Vision.V1 => 0x4b0e2bae => 48
	i32 1260983243, ; 128: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 129: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 110
	i32 1309188875, ; 130: System.Private.DataContractSerialization => 0x4e08a30b => 185
	i32 1324164729, ; 131: System.Linq => 0x4eed2679 => 168
	i32 1373134921, ; 132: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 133: Xamarin.AndroidX.SavedState => 0x52114ed3 => 122
	i32 1379779777, ; 134: System.Resources.ResourceManager => 0x523dc4c1 => 195
	i32 1406073936, ; 135: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 106
	i32 1408764838, ; 136: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 201
	i32 1411638395, ; 137: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 196
	i32 1424762768, ; 138: Microsoft.Rest.ClientRuntime.Azure => 0x54ec2790 => 84
	i32 1430672901, ; 139: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 140: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 129
	i32 1437713837, ; 141: Grpc.Auth => 0x55b1c5ad => 51
	i32 1452070440, ; 142: System.Formats.Asn1.dll => 0x568cd628 => 160
	i32 1453312822, ; 143: System.Diagnostics.Tools.dll => 0x569fcb36 => 155
	i32 1458022317, ; 144: System.Net.Security.dll => 0x56e7a7ad => 178
	i32 1460893475, ; 145: System.IdentityModel.Tokens.Jwt => 0x57137723 => 93
	i32 1461004990, ; 146: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 147: System.Collections.Immutable.dll => 0x5718a9ef => 140
	i32 1462112819, ; 148: System.IO.Compression.dll => 0x57261233 => 163
	i32 1469204771, ; 149: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 99
	i32 1470490898, ; 150: Microsoft.Extensions.Primitives => 0x57a5e912 => 69
	i32 1479771757, ; 151: System.Collections.Immutable => 0x5833866d => 140
	i32 1480492111, ; 152: System.IO.Compression.Brotli.dll => 0x583e844f => 162
	i32 1493001747, ; 153: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 154: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 73
	i32 1505131794, ; 155: Microsoft.Extensions.Http => 0x59b67d12 => 64
	i32 1514721132, ; 156: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 157: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 215
	i32 1543355203, ; 158: System.Reflection.Emit.dll => 0x5bfdbb43 => 191
	i32 1550322496, ; 159: System.Reflection.Extensions.dll => 0x5c680b40 => 192
	i32 1551623176, ; 160: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1551954004, ; 161: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 76
	i32 1570023712, ; 162: Microsoft.Azure.CognitiveServices.Vision.ComputerVision.dll => 0x5d94a920 => 56
	i32 1575375756, ; 163: Polly.Core => 0x5de6538c => 89
	i32 1582305585, ; 164: Azure.Identity => 0x5e501131 => 36
	i32 1622152042, ; 165: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 116
	i32 1624863272, ; 166: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 126
	i32 1634654947, ; 167: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 38
	i32 1636350590, ; 168: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 108
	i32 1639515021, ; 169: System.Net.Http.dll => 0x61b9038d => 171
	i32 1639986890, ; 170: System.Text.RegularExpressions => 0x61c036ca => 215
	i32 1641389582, ; 171: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 144
	i32 1657153582, ; 172: System.Runtime => 0x62c6282e => 203
	i32 1658251792, ; 173: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 128
	i32 1677501392, ; 174: System.Net.Primitives.dll => 0x63fca3d0 => 176
	i32 1679769178, ; 175: System.Security.Cryptography => 0x641f3e5a => 210
	i32 1701541528, ; 176: System.Diagnostics.Debug.dll => 0x656b7698 => 151
	i32 1726116996, ; 177: System.Reflection.dll => 0x66e27484 => 194
	i32 1729485958, ; 178: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 104
	i32 1736233607, ; 179: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 180: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 181: System.Diagnostics.TraceSource.dll => 0x69239124 => 156
	i32 1765942094, ; 182: System.Reflection.Extensions => 0x6942234e => 192
	i32 1766324549, ; 183: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 124
	i32 1770582343, ; 184: Microsoft.Extensions.Logging.dll => 0x6988f147 => 66
	i32 1776026572, ; 185: System.Core.dll => 0x69dc03cc => 149
	i32 1780572499, ; 186: Mono.Android.Runtime.dll => 0x6a216153 => 230
	i32 1782161461, ; 187: Grpc.Core.Api => 0x6a39a035 => 52
	i32 1782862114, ; 188: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 189: Xamarin.AndroidX.Fragment => 0x6a96652d => 111
	i32 1793755602, ; 190: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1794500907, ; 191: Microsoft.Identity.Client.dll => 0x6af5e92b => 70
	i32 1796167890, ; 192: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 57
	i32 1808609942, ; 193: Xamarin.AndroidX.Loader => 0x6bcd3296 => 116
	i32 1813058853, ; 194: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 131
	i32 1813201214, ; 195: Xamarin.Google.Android.Material => 0x6c13413e => 128
	i32 1818569960, ; 196: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 120
	i32 1824175904, ; 197: System.Text.Encoding.Extensions => 0x6cbab720 => 212
	i32 1824722060, ; 198: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 201
	i32 1828688058, ; 199: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 67
	i32 1842015223, ; 200: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 201: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 202: System.Linq.Expressions => 0x6ec71a65 => 167
	i32 1867746548, ; 203: Xamarin.Essentials.dll => 0x6f538cf4 => 127
	i32 1870277092, ; 204: System.Reflection.Primitives => 0x6f7a29e4 => 193
	i32 1875935024, ; 205: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900519031, ; 206: Grpc.Auth.dll => 0x71479e77 => 51
	i32 1900610850, ; 207: System.Resources.ResourceManager.dll => 0x71490522 => 195
	i32 1910275211, ; 208: System.Collections.NonGeneric.dll => 0x71dc7c8b => 141
	i32 1927897671, ; 209: System.CodeDom.dll => 0x72e96247 => 92
	i32 1939592360, ; 210: System.Private.Xml.Linq => 0x739bd4a8 => 187
	i32 1961813231, ; 211: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 123
	i32 1968388702, ; 212: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 58
	i32 1986222447, ; 213: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 75
	i32 2003115576, ; 214: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 215: System.Buffers.dll => 0x77ec19b4 => 138
	i32 2019465201, ; 216: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 114
	i32 2025202353, ; 217: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2040764568, ; 218: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 71
	i32 2045470958, ; 219: System.Private.Xml => 0x79eb68ee => 188
	i32 2055257422, ; 220: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 113
	i32 2057861558, ; 221: CommunityToolkit.Maui.Markup => 0x7aa879b6 => 39
	i32 2066184531, ; 222: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2069514766, ; 223: Newtonsoft.Json.Bson => 0x7b5a4a0e => 86
	i32 2070888862, ; 224: System.Diagnostics.TraceSource => 0x7b6f419e => 156
	i32 2079903147, ; 225: System.Runtime.dll => 0x7bf8cdab => 203
	i32 2082593585, ; 226: Microsoft.Azure.CognitiveServices.Vision.ComputerVision => 0x7c21db31 => 56
	i32 2090596640, ; 227: System.Numerics.Vectors => 0x7c9bf920 => 182
	i32 2127167465, ; 228: System.Console => 0x7ec9ffe9 => 148
	i32 2142473426, ; 229: System.Collections.Specialized => 0x7fb38cd2 => 142
	i32 2143465592, ; 230: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 76
	i32 2159891885, ; 231: Microsoft.Maui => 0x80bd55ad => 80
	i32 2169148018, ; 232: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2178612968, ; 233: System.CodeDom => 0x81dafee8 => 92
	i32 2179622097, ; 234: Emgu.CV => 0x81ea64d1 => 41
	i32 2181898931, ; 235: Microsoft.Extensions.Options.dll => 0x820d22b3 => 68
	i32 2192057212, ; 236: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 67
	i32 2193016926, ; 237: System.ObjectModel.dll => 0x82b6c85e => 184
	i32 2201107256, ; 238: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 132
	i32 2201231467, ; 239: System.Net.Http => 0x8334206b => 171
	i32 2207618523, ; 240: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2265110946, ; 241: System.Security.AccessControl.dll => 0x8702d9a2 => 204
	i32 2266799131, ; 242: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 59
	i32 2270573516, ; 243: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 244: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 121
	i32 2295906218, ; 245: System.Net.Sockets => 0x88d8bfaa => 180
	i32 2298471582, ; 246: System.Net.Mail => 0x88ffe49e => 173
	i32 2303942373, ; 247: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 248: System.Private.CoreLib.dll => 0x896b7878 => 228
	i32 2340441535, ; 249: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 197
	i32 2350129686, ; 250: Microsoft.Rest.ClientRuntime.dll => 0x8c142216 => 83
	i32 2353062107, ; 251: System.Net.Primitives => 0x8c40e0db => 176
	i32 2368005991, ; 252: System.Xml.ReaderWriter.dll => 0x8d24e767 => 223
	i32 2369706906, ; 253: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 74
	i32 2371007202, ; 254: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 58
	i32 2383496789, ; 255: System.Security.Principal.Windows.dll => 0x8e114655 => 211
	i32 2392818924, ; 256: System.Net.Http.Formatting.dll => 0x8e9f84ec => 55
	i32 2395872292, ; 257: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2397347608, ; 258: Google.LongRunning.dll => 0x8ee49f18 => 49
	i32 2401565422, ; 259: System.Web.HttpUtility => 0x8f24faee => 221
	i32 2427813419, ; 260: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 261: System.Console.dll => 0x912896e5 => 148
	i32 2458678730, ; 262: System.Net.Sockets.dll => 0x928c75ca => 180
	i32 2471841756, ; 263: netstandard.dll => 0x93554fdc => 227
	i32 2475788418, ; 264: Java.Interop.dll => 0x93918882 => 229
	i32 2480646305, ; 265: Microsoft.Maui.Controls => 0x93dba8a1 => 78
	i32 2483903535, ; 266: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 144
	i32 2484371297, ; 267: System.Net.ServicePoint => 0x94147f61 => 179
	i32 2486847491, ; 268: Google.Api.Gax => 0x943a4803 => 43
	i32 2538310050, ; 269: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 190
	i32 2550873716, ; 270: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 271: Microsoft.CSharp => 0x98ba5a04 => 137
	i32 2570120770, ; 272: System.Text.Encodings.Web => 0x9930ee42 => 213
	i32 2585220780, ; 273: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 212
	i32 2593496499, ; 274: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 275: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 132
	i32 2617129537, ; 276: System.Private.Xml.dll => 0x9bfe3a41 => 188
	i32 2620871830, ; 277: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 108
	i32 2626831493, ; 278: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2628210652, ; 279: System.Memory.Data => 0x9ca74fdc => 95
	i32 2640290731, ; 280: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 74
	i32 2640706905, ; 281: Azure.Core => 0x9d65fd59 => 35
	i32 2663698177, ; 282: System.Runtime.Loader => 0x9ec4cf01 => 199
	i32 2664396074, ; 283: System.Xml.XDocument.dll => 0x9ecf752a => 224
	i32 2665622720, ; 284: System.Drawing.Primitives => 0x9ee22cc0 => 158
	i32 2676780864, ; 285: System.Data.Common.dll => 0x9f8c6f40 => 150
	i32 2677098746, ; 286: Azure.Identity.dll => 0x9f9148fa => 36
	i32 2701298998, ; 287: Emgu.CV.dll => 0xa1028d36 => 41
	i32 2715334215, ; 288: System.Threading.Tasks.dll => 0xa1d8b647 => 218
	i32 2717744543, ; 289: System.Security.Claims => 0xa1fd7d9f => 205
	i32 2724373263, ; 290: System.Runtime.Numerics.dll => 0xa262a30f => 200
	i32 2732626843, ; 291: Xamarin.AndroidX.Activity => 0xa2e0939b => 97
	i32 2734223671, ; 292: Microsoft.Extensions.Http.Polly.dll => 0xa2f8f137 => 65
	i32 2735172069, ; 293: System.Threading.Channels => 0xa30769e5 => 216
	i32 2737747696, ; 294: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 99
	i32 2740051746, ; 295: Microsoft.Identity.Client => 0xa351df22 => 70
	i32 2744327253, ; 296: Google.Api.Gax.Grpc.dll => 0xa3931c55 => 44
	i32 2752995522, ; 297: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2757554483, ; 298: Google.Api.Gax.Grpc => 0xa45cf133 => 44
	i32 2758225723, ; 299: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 79
	i32 2764765095, ; 300: Microsoft.Maui.dll => 0xa4caf7a7 => 80
	i32 2778768386, ; 301: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 125
	i32 2785988530, ; 302: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 303: Microsoft.Maui.Graphics => 0xa7008e0b => 82
	i32 2806116107, ; 304: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 305: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 106
	i32 2831556043, ; 306: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2839679515, ; 307: Google.LongRunning => 0xa942121b => 49
	i32 2853208004, ; 308: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 125
	i32 2861189240, ; 309: Microsoft.Maui.Essentials => 0xaa8a4878 => 81
	i32 2868488919, ; 310: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 38
	i32 2893550578, ; 311: Google.Apis.Core => 0xac7813f2 => 47
	i32 2898407901, ; 312: System.Management => 0xacc231dd => 94
	i32 2901442782, ; 313: System.Reflection => 0xacf080de => 194
	i32 2905242038, ; 314: mscorlib.dll => 0xad2a79b6 => 226
	i32 2909740682, ; 315: System.Private.CoreLib => 0xad6f1e8a => 228
	i32 2912646636, ; 316: Google.Api.CommonProtos => 0xad9b75ec => 42
	i32 2916838712, ; 317: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 126
	i32 2919462931, ; 318: System.Numerics.Vectors.dll => 0xae037813 => 182
	i32 2940926066, ; 319: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 154
	i32 2959614098, ; 320: System.ComponentModel.dll => 0xb0682092 => 147
	i32 2961259629, ; 321: Microsoft.Rest.ClientRuntime => 0xb0813c6d => 83
	i32 2965157864, ; 322: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 103
	i32 2968338931, ; 323: System.Security.Principal.Windows => 0xb0ed41f3 => 211
	i32 2972252294, ; 324: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 206
	i32 2978675010, ; 325: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 110
	i32 2987532451, ; 326: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 123
	i32 2990604888, ; 327: Google.Apis => 0xb2410258 => 45
	i32 2991449226, ; 328: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 101
	i32 3000842441, ; 329: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 103
	i32 3020703001, ; 330: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 62
	i32 3033605958, ; 331: System.Memory.Data.dll => 0xb4d12746 => 95
	i32 3038032645, ; 332: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 333: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 101
	i32 3057625584, ; 334: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 117
	i32 3059408633, ; 335: Mono.Android.Runtime => 0xb65adef9 => 230
	i32 3059793426, ; 336: System.ComponentModel.Primitives => 0xb660be12 => 145
	i32 3075834255, ; 337: System.Threading.Tasks => 0xb755818f => 218
	i32 3077302341, ; 338: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 339: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 75
	i32 3090735792, ; 340: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 209
	i32 3099732863, ; 341: System.Security.Claims.dll => 0xb8c22b7f => 205
	i32 3103600923, ; 342: System.Formats.Asn1 => 0xb8fd311b => 160
	i32 3106263381, ; 343: Grpc.Net.Common.dll => 0xb925d155 => 54
	i32 3121463068, ; 344: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 164
	i32 3124832203, ; 345: System.Threading.Tasks.Extensions => 0xba4127cb => 217
	i32 3132293585, ; 346: System.Security.AccessControl => 0xbab301d1 => 204
	i32 3147165239, ; 347: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 157
	i32 3159123045, ; 348: System.Reflection.Primitives.dll => 0xbc4c6465 => 193
	i32 3178803400, ; 349: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 118
	i32 3180026441, ; 350: Tesseract => 0xbd8b5a49 => 96
	i32 3203277885, ; 351: Google.Api.Gax.dll => 0xbeee243d => 43
	i32 3215347189, ; 352: zxing => 0xbfa64df5 => 133
	i32 3220365878, ; 353: System.Threading => 0xbff2e236 => 220
	i32 3258312781, ; 354: Xamarin.AndroidX.CardView => 0xc235e84d => 104
	i32 3265893370, ; 355: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 217
	i32 3286373667, ; 356: ZXing.Net.MAUI.dll => 0xc3e21523 => 134
	i32 3290767353, ; 357: System.Security.Cryptography.Encoding => 0xc4251ff9 => 207
	i32 3305363605, ; 358: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 359: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 73
	i32 3316684772, ; 360: System.Net.Requests.dll => 0xc5b097e4 => 177
	i32 3317135071, ; 361: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 109
	i32 3346324047, ; 362: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 119
	i32 3357674450, ; 363: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 364: System.Text.Json => 0xc82afec1 => 214
	i32 3362522851, ; 365: Xamarin.AndroidX.Core => 0xc86c06e3 => 107
	i32 3366347497, ; 366: Java.Interop => 0xc8a662e9 => 229
	i32 3374999561, ; 367: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 121
	i32 3381016424, ; 368: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 369: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 196
	i32 3402775237, ; 370: CommunityToolkit.Maui.Markup.dll => 0xcad23ac5 => 39
	i32 3428513518, ; 371: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 60
	i32 3430777524, ; 372: netstandard => 0xcc7d82b4 => 227
	i32 3448896322, ; 373: Polly => 0xcd91fb42 => 88
	i32 3452344032, ; 374: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 77
	i32 3453592554, ; 375: Google.Apis.Core.dll => 0xcdd9a3ea => 47
	i32 3463511458, ; 376: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 377: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 146
	i32 3476120550, ; 378: Mono.Android => 0xcf3163e6 => 231
	i32 3479583265, ; 379: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 380: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 381: System.Text.Json.dll => 0xcfbaacae => 214
	i32 3499097210, ; 382: Google.Protobuf.dll => 0xd08ffc7a => 50
	i32 3509114376, ; 383: System.Xml.Linq => 0xd128d608 => 222
	i32 3539954161, ; 384: System.Net.HttpListener => 0xd2ff69f1 => 172
	i32 3558648585, ; 385: System.ClientModel => 0xd41cab09 => 91
	i32 3561949811, ; 386: Azure.Core.dll => 0xd44f0a73 => 35
	i32 3570554715, ; 387: System.IO.FileSystem.AccessControl => 0xd4d2575b => 164
	i32 3580758918, ; 388: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 389: System.Linq.dll => 0xd715a361 => 168
	i32 3612435020, ; 390: System.Management.dll => 0xd751624c => 94
	i32 3624195450, ; 391: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 197
	i32 3641597786, ; 392: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 113
	i32 3643446276, ; 393: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 394: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 118
	i32 3645630983, ; 395: Google.Protobuf => 0xd94bea07 => 50
	i32 3657292374, ; 396: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 59
	i32 3660523487, ; 397: System.Net.NetworkInformation => 0xda2f27df => 175
	i32 3672681054, ; 398: Mono.Android.dll => 0xdae8aa5e => 231
	i32 3676461095, ; 399: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 102
	i32 3682565725, ; 400: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 100
	i32 3697841164, ; 401: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 402: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 72
	i32 3724971120, ; 403: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 117
	i32 3732100267, ; 404: System.Net.NameResolution => 0xde7354ab => 174
	i32 3737834244, ; 405: System.Net.Http.Json.dll => 0xdecad304 => 170
	i32 3748608112, ; 406: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 152
	i32 3751582913, ; 407: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 135
	i32 3786282454, ; 408: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 105
	i32 3792276235, ; 409: System.Collections.NonGeneric => 0xe2098b0b => 141
	i32 3793997468, ; 410: Google.Apis.Auth.dll => 0xe223ce9c => 46
	i32 3799742899, ; 411: Tesseract.dll => 0xe27b79b3 => 96
	i32 3800979733, ; 412: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 77
	i32 3802395368, ; 413: System.Collections.Specialized.dll => 0xe2a3f2e8 => 142
	i32 3817368567, ; 414: CommunityToolkit.Maui.dll => 0xe3886bf7 => 37
	i32 3823082795, ; 415: System.Security.Cryptography.dll => 0xe3df9d2b => 210
	i32 3829621856, ; 416: System.Numerics.dll => 0xe4436460 => 183
	i32 3841636137, ; 417: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 61
	i32 3842894692, ; 418: ZXing.Net.MAUI => 0xe50deb64 => 134
	i32 3844307129, ; 419: System.Net.Mail.dll => 0xe52378b9 => 173
	i32 3849253459, ; 420: System.Runtime.InteropServices.dll => 0xe56ef253 => 198
	i32 3870376305, ; 421: System.Net.HttpListener.dll => 0xe6b14171 => 172
	i32 3875112723, ; 422: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 207
	i32 3885497537, ; 423: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 181
	i32 3889960447, ; 424: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896087913, ; 425: OpenCvSharp => 0xe8399569 => 87
	i32 3896106733, ; 426: System.Collections.Concurrent.dll => 0xe839deed => 139
	i32 3896760992, ; 427: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 107
	i32 3928044579, ; 428: System.Xml.ReaderWriter => 0xea213423 => 223
	i32 3931092270, ; 429: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 120
	i32 3955647286, ; 430: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 98
	i32 3980434154, ; 431: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 432: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 433: System.Diagnostics.Process.dll => 0xee9f991d => 153
	i32 4008686814, ; 434: Microsoft.Extensions.Http.Polly => 0xeeefb4de => 65
	i32 4025784931, ; 435: System.Memory => 0xeff49a63 => 169
	i32 4046471985, ; 436: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 79
	i32 4054681211, ; 437: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 189
	i32 4059682726, ; 438: Google.Apis.dll => 0xf1f9d7a6 => 45
	i32 4068434129, ; 439: System.Private.Xml.Linq.dll => 0xf27f60d1 => 187
	i32 4073602200, ; 440: System.Threading.dll => 0xf2ce3c98 => 220
	i32 4082882467, ; 441: Google.Apis.Auth => 0xf35bd7a3 => 46
	i32 4094352644, ; 442: Microsoft.Maui.Essentials.dll => 0xf40add04 => 81
	i32 4099507663, ; 443: System.Drawing.dll => 0xf45985cf => 159
	i32 4100113165, ; 444: System.Private.Uri => 0xf462c30d => 186
	i32 4102112229, ; 445: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 446: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 447: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 60
	i32 4127667938, ; 448: System.IO.FileSystem.Watcher => 0xf60736e2 => 165
	i32 4131741489, ; 449: System.Net.Http.Formatting => 0xf6455f31 => 55
	i32 4147896353, ; 450: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 189
	i32 4150914736, ; 451: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4151237749, ; 452: System.Core => 0xf76edc75 => 149
	i32 4164802419, ; 453: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 165
	i32 4181436372, ; 454: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 202
	i32 4182413190, ; 455: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 115
	i32 4213026141, ; 456: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 152
	i32 4260525087, ; 457: System.Buffers => 0xfdf2741f => 138
	i32 4263231520, ; 458: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 93
	i32 4271975918, ; 459: Microsoft.Maui.Controls.dll => 0xfea12dee => 78
	i32 4273543125, ; 460: OpenCvSharp.dll => 0xfeb917d5 => 87
	i32 4274623895, ; 461: CommunityToolkit.Mvvm.dll => 0xfec99597 => 40
	i32 4274976490, ; 462: System.Runtime.Numerics => 0xfecef6ea => 200
	i32 4292120959 ; 463: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 115
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [464 x i32] [
	i32 175, ; 0
	i32 174, ; 1
	i32 130, ; 2
	i32 85, ; 3
	i32 102, ; 4
	i32 219, ; 5
	i32 154, ; 6
	i32 33, ; 7
	i32 208, ; 8
	i32 82, ; 9
	i32 63, ; 10
	i32 198, ; 11
	i32 216, ; 12
	i32 90, ; 13
	i32 181, ; 14
	i32 208, ; 15
	i32 105, ; 16
	i32 124, ; 17
	i32 30, ; 18
	i32 31, ; 19
	i32 147, ; 20
	i32 100, ; 21
	i32 151, ; 22
	i32 62, ; 23
	i32 137, ; 24
	i32 161, ; 25
	i32 190, ; 26
	i32 2, ; 27
	i32 64, ; 28
	i32 30, ; 29
	i32 97, ; 30
	i32 183, ; 31
	i32 15, ; 32
	i32 112, ; 33
	i32 14, ; 34
	i32 54, ; 35
	i32 166, ; 36
	i32 52, ; 37
	i32 179, ; 38
	i32 219, ; 39
	i32 169, ; 40
	i32 53, ; 41
	i32 34, ; 42
	i32 26, ; 43
	i32 127, ; 44
	i32 143, ; 45
	i32 111, ; 46
	i32 209, ; 47
	i32 221, ; 48
	i32 202, ; 49
	i32 226, ; 50
	i32 225, ; 51
	i32 90, ; 52
	i32 72, ; 53
	i32 184, ; 54
	i32 13, ; 55
	i32 7, ; 56
	i32 69, ; 57
	i32 66, ; 58
	i32 57, ; 59
	i32 84, ; 60
	i32 21, ; 61
	i32 37, ; 62
	i32 206, ; 63
	i32 109, ; 64
	i32 19, ; 65
	i32 213, ; 66
	i32 139, ; 67
	i32 178, ; 68
	i32 1, ; 69
	i32 222, ; 70
	i32 191, ; 71
	i32 16, ; 72
	i32 4, ; 73
	i32 199, ; 74
	i32 91, ; 75
	i32 177, ; 76
	i32 166, ; 77
	i32 163, ; 78
	i32 25, ; 79
	i32 136, ; 80
	i32 68, ; 81
	i32 48, ; 82
	i32 150, ; 83
	i32 186, ; 84
	i32 162, ; 85
	i32 135, ; 86
	i32 133, ; 87
	i32 161, ; 88
	i32 170, ; 89
	i32 145, ; 90
	i32 28, ; 91
	i32 130, ; 92
	i32 89, ; 93
	i32 85, ; 94
	i32 129, ; 95
	i32 112, ; 96
	i32 157, ; 97
	i32 224, ; 98
	i32 185, ; 99
	i32 155, ; 100
	i32 143, ; 101
	i32 122, ; 102
	i32 159, ; 103
	i32 61, ; 104
	i32 3, ; 105
	i32 98, ; 106
	i32 158, ; 107
	i32 167, ; 108
	i32 63, ; 109
	i32 42, ; 110
	i32 114, ; 111
	i32 71, ; 112
	i32 146, ; 113
	i32 131, ; 114
	i32 225, ; 115
	i32 16, ; 116
	i32 88, ; 117
	i32 22, ; 118
	i32 119, ; 119
	i32 86, ; 120
	i32 136, ; 121
	i32 53, ; 122
	i32 20, ; 123
	i32 153, ; 124
	i32 40, ; 125
	i32 18, ; 126
	i32 48, ; 127
	i32 2, ; 128
	i32 110, ; 129
	i32 185, ; 130
	i32 168, ; 131
	i32 32, ; 132
	i32 122, ; 133
	i32 195, ; 134
	i32 106, ; 135
	i32 201, ; 136
	i32 196, ; 137
	i32 84, ; 138
	i32 0, ; 139
	i32 129, ; 140
	i32 51, ; 141
	i32 160, ; 142
	i32 155, ; 143
	i32 178, ; 144
	i32 93, ; 145
	i32 6, ; 146
	i32 140, ; 147
	i32 163, ; 148
	i32 99, ; 149
	i32 69, ; 150
	i32 140, ; 151
	i32 162, ; 152
	i32 10, ; 153
	i32 73, ; 154
	i32 64, ; 155
	i32 5, ; 156
	i32 215, ; 157
	i32 191, ; 158
	i32 192, ; 159
	i32 25, ; 160
	i32 76, ; 161
	i32 56, ; 162
	i32 89, ; 163
	i32 36, ; 164
	i32 116, ; 165
	i32 126, ; 166
	i32 38, ; 167
	i32 108, ; 168
	i32 171, ; 169
	i32 215, ; 170
	i32 144, ; 171
	i32 203, ; 172
	i32 128, ; 173
	i32 176, ; 174
	i32 210, ; 175
	i32 151, ; 176
	i32 194, ; 177
	i32 104, ; 178
	i32 23, ; 179
	i32 1, ; 180
	i32 156, ; 181
	i32 192, ; 182
	i32 124, ; 183
	i32 66, ; 184
	i32 149, ; 185
	i32 230, ; 186
	i32 52, ; 187
	i32 17, ; 188
	i32 111, ; 189
	i32 9, ; 190
	i32 70, ; 191
	i32 57, ; 192
	i32 116, ; 193
	i32 131, ; 194
	i32 128, ; 195
	i32 120, ; 196
	i32 212, ; 197
	i32 201, ; 198
	i32 67, ; 199
	i32 29, ; 200
	i32 26, ; 201
	i32 167, ; 202
	i32 127, ; 203
	i32 193, ; 204
	i32 8, ; 205
	i32 51, ; 206
	i32 195, ; 207
	i32 141, ; 208
	i32 92, ; 209
	i32 187, ; 210
	i32 123, ; 211
	i32 58, ; 212
	i32 75, ; 213
	i32 5, ; 214
	i32 138, ; 215
	i32 114, ; 216
	i32 0, ; 217
	i32 71, ; 218
	i32 188, ; 219
	i32 113, ; 220
	i32 39, ; 221
	i32 4, ; 222
	i32 86, ; 223
	i32 156, ; 224
	i32 203, ; 225
	i32 56, ; 226
	i32 182, ; 227
	i32 148, ; 228
	i32 142, ; 229
	i32 76, ; 230
	i32 80, ; 231
	i32 12, ; 232
	i32 92, ; 233
	i32 41, ; 234
	i32 68, ; 235
	i32 67, ; 236
	i32 184, ; 237
	i32 132, ; 238
	i32 171, ; 239
	i32 14, ; 240
	i32 204, ; 241
	i32 59, ; 242
	i32 8, ; 243
	i32 121, ; 244
	i32 180, ; 245
	i32 173, ; 246
	i32 18, ; 247
	i32 228, ; 248
	i32 197, ; 249
	i32 83, ; 250
	i32 176, ; 251
	i32 223, ; 252
	i32 74, ; 253
	i32 58, ; 254
	i32 211, ; 255
	i32 55, ; 256
	i32 13, ; 257
	i32 49, ; 258
	i32 221, ; 259
	i32 10, ; 260
	i32 148, ; 261
	i32 180, ; 262
	i32 227, ; 263
	i32 229, ; 264
	i32 78, ; 265
	i32 144, ; 266
	i32 179, ; 267
	i32 43, ; 268
	i32 190, ; 269
	i32 11, ; 270
	i32 137, ; 271
	i32 213, ; 272
	i32 212, ; 273
	i32 20, ; 274
	i32 132, ; 275
	i32 188, ; 276
	i32 108, ; 277
	i32 15, ; 278
	i32 95, ; 279
	i32 74, ; 280
	i32 35, ; 281
	i32 199, ; 282
	i32 224, ; 283
	i32 158, ; 284
	i32 150, ; 285
	i32 36, ; 286
	i32 41, ; 287
	i32 218, ; 288
	i32 205, ; 289
	i32 200, ; 290
	i32 97, ; 291
	i32 65, ; 292
	i32 216, ; 293
	i32 99, ; 294
	i32 70, ; 295
	i32 44, ; 296
	i32 21, ; 297
	i32 44, ; 298
	i32 79, ; 299
	i32 80, ; 300
	i32 125, ; 301
	i32 27, ; 302
	i32 82, ; 303
	i32 6, ; 304
	i32 106, ; 305
	i32 19, ; 306
	i32 49, ; 307
	i32 125, ; 308
	i32 81, ; 309
	i32 38, ; 310
	i32 47, ; 311
	i32 94, ; 312
	i32 194, ; 313
	i32 226, ; 314
	i32 228, ; 315
	i32 42, ; 316
	i32 126, ; 317
	i32 182, ; 318
	i32 154, ; 319
	i32 147, ; 320
	i32 83, ; 321
	i32 103, ; 322
	i32 211, ; 323
	i32 206, ; 324
	i32 110, ; 325
	i32 123, ; 326
	i32 45, ; 327
	i32 101, ; 328
	i32 103, ; 329
	i32 62, ; 330
	i32 95, ; 331
	i32 34, ; 332
	i32 101, ; 333
	i32 117, ; 334
	i32 230, ; 335
	i32 145, ; 336
	i32 218, ; 337
	i32 12, ; 338
	i32 75, ; 339
	i32 209, ; 340
	i32 205, ; 341
	i32 160, ; 342
	i32 54, ; 343
	i32 164, ; 344
	i32 217, ; 345
	i32 204, ; 346
	i32 157, ; 347
	i32 193, ; 348
	i32 118, ; 349
	i32 96, ; 350
	i32 43, ; 351
	i32 133, ; 352
	i32 220, ; 353
	i32 104, ; 354
	i32 217, ; 355
	i32 134, ; 356
	i32 207, ; 357
	i32 7, ; 358
	i32 73, ; 359
	i32 177, ; 360
	i32 109, ; 361
	i32 119, ; 362
	i32 24, ; 363
	i32 214, ; 364
	i32 107, ; 365
	i32 229, ; 366
	i32 121, ; 367
	i32 3, ; 368
	i32 196, ; 369
	i32 39, ; 370
	i32 60, ; 371
	i32 227, ; 372
	i32 88, ; 373
	i32 77, ; 374
	i32 47, ; 375
	i32 11, ; 376
	i32 146, ; 377
	i32 231, ; 378
	i32 24, ; 379
	i32 23, ; 380
	i32 214, ; 381
	i32 50, ; 382
	i32 222, ; 383
	i32 172, ; 384
	i32 91, ; 385
	i32 35, ; 386
	i32 164, ; 387
	i32 31, ; 388
	i32 168, ; 389
	i32 94, ; 390
	i32 197, ; 391
	i32 113, ; 392
	i32 28, ; 393
	i32 118, ; 394
	i32 50, ; 395
	i32 59, ; 396
	i32 175, ; 397
	i32 231, ; 398
	i32 102, ; 399
	i32 100, ; 400
	i32 33, ; 401
	i32 72, ; 402
	i32 117, ; 403
	i32 174, ; 404
	i32 170, ; 405
	i32 152, ; 406
	i32 135, ; 407
	i32 105, ; 408
	i32 141, ; 409
	i32 46, ; 410
	i32 96, ; 411
	i32 77, ; 412
	i32 142, ; 413
	i32 37, ; 414
	i32 210, ; 415
	i32 183, ; 416
	i32 61, ; 417
	i32 134, ; 418
	i32 173, ; 419
	i32 198, ; 420
	i32 172, ; 421
	i32 207, ; 422
	i32 181, ; 423
	i32 32, ; 424
	i32 87, ; 425
	i32 139, ; 426
	i32 107, ; 427
	i32 223, ; 428
	i32 120, ; 429
	i32 98, ; 430
	i32 27, ; 431
	i32 9, ; 432
	i32 153, ; 433
	i32 65, ; 434
	i32 169, ; 435
	i32 79, ; 436
	i32 189, ; 437
	i32 45, ; 438
	i32 187, ; 439
	i32 220, ; 440
	i32 46, ; 441
	i32 81, ; 442
	i32 159, ; 443
	i32 186, ; 444
	i32 22, ; 445
	i32 17, ; 446
	i32 60, ; 447
	i32 165, ; 448
	i32 55, ; 449
	i32 189, ; 450
	i32 29, ; 451
	i32 149, ; 452
	i32 165, ; 453
	i32 202, ; 454
	i32 115, ; 455
	i32 152, ; 456
	i32 138, ; 457
	i32 93, ; 458
	i32 78, ; 459
	i32 87, ; 460
	i32 40, ; 461
	i32 200, ; 462
	i32 115 ; 463
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
