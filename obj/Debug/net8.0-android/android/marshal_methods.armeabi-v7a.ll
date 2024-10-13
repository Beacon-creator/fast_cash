; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [385 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [764 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 300
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 336
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 240
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 39593970, ; 8: Microsoft.Extensions.Telemetry => 0x25c27f2 => 223
	i32 40744412, ; 9: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 271
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 380
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 237
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 98325684, ; 16: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 206
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 318
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 318
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 126276733, ; 21: Polly.Extensions.Http => 0x786d47d => 246
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 340
	i32 142721839, ; 23: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 24: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 25: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 26: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 274
	i32 176265551, ; 27: System.ServiceProcess => 0xa81994f => 132
	i32 178574765, ; 28: Microsoft.Extensions.Compliance.Abstractions => 0xaa4d5ad => 198
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 320
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 31: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 377
	i32 199333315, ; 32: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 378
	i32 205061960, ; 33: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 34: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 268
	i32 220171995, ; 35: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 36: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 205
	i32 230216969, ; 37: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 294
	i32 230752869, ; 38: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 39: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 40: System.Globalization => 0xdd133ce => 42
	i32 235582017, ; 41: Microsoft.Extensions.Resilience => 0xe0ab241 => 222
	i32 246610117, ; 42: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 43: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 277
	i32 276479776, ; 44: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 296
	i32 280482487, ; 46: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 293
	i32 280992041, ; 47: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 349
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 49: Microsoft.Extensions.Http.dll => 0x115c82ee => 210
	i32 298918909, ; 50: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 51: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 377
	i32 318968648, ; 52: Xamarin.AndroidX.Activity.dll => 0x13031348 => 259
	i32 321597661, ; 53: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 54: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 362
	i32 342366114, ; 55: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 295
	i32 356389973, ; 56: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 361
	i32 360082299, ; 57: System.ServiceModel.Web => 0x15766b7b => 131
	i32 364956269, ; 58: Grpc.Net.Common => 0x15c0ca6d => 193
	i32 367780167, ; 59: System.IO.Pipes => 0x15ebe147 => 55
	i32 371306672, ; 60: Grpc.Core.Api.dll => 0x1621b0b0 => 191
	i32 374914964, ; 61: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 62: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 63: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 64: System.Memory.dll => 0x16fe439a => 62
	i32 391886110, ; 65: Grpc.Net.Client.dll => 0x175bb51e => 192
	i32 392610295, ; 66: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 67: _Microsoft.Android.Resource.Designer => 0x17969339 => 381
	i32 403441872, ; 68: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 69: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 373
	i32 441335492, ; 70: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 278
	i32 442521989, ; 71: Xamarin.Essentials => 0x1a605985 => 330
	i32 442565967, ; 72: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 73: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 291
	i32 451504562, ; 74: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 75: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 76: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 77: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 78: System.dll => 0x1bff388e => 164
	i32 476646585, ; 79: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 293
	i32 480374825, ; 80: Polly.Extensions.Http.dll => 0x1ca1f029 => 246
	i32 485463106, ; 81: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 227
	i32 486930444, ; 82: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 306
	i32 498788369, ; 83: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 84: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 360
	i32 503918385, ; 85: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 354
	i32 513247710, ; 86: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 221
	i32 526420162, ; 87: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 88: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 340
	i32 530272170, ; 89: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 90: Microsoft.Extensions.Logging => 0x20216150 => 214
	i32 540030774, ; 91: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 92: System.Runtime.Extensions => 0x2080b118 => 103
	i32 545795345, ; 93: Microsoft.Extensions.Logging.Configuration.dll => 0x20882d11 => 216
	i32 546455878, ; 94: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 95: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 196
	i32 549171840, ; 96: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 97: Jsr305Binding => 0x213954e7 => 333
	i32 562494435, ; 98: Microsoft.Rest.ClientRuntime.Azure.dll => 0x2186fbe3 => 239
	i32 569601784, ; 99: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 329
	i32 577335427, ; 100: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 591770108, ; 101: Microsoft.Extensions.Http.Resilience.dll => 0x2345b1fc => 213
	i32 592146354, ; 102: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 368
	i32 597488923, ; 103: CommunityToolkit.Maui => 0x239cf51b => 175
	i32 601371474, ; 104: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 105: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 106: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 107: Xamarin.AndroidX.CustomView => 0x2568904f => 283
	i32 627931235, ; 108: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 366
	i32 639843206, ; 109: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 289
	i32 643868501, ; 110: System.Net => 0x2660a755 => 81
	i32 662205335, ; 111: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 112: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 325
	i32 666292255, ; 113: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 266
	i32 672442732, ; 114: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 115: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 116: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 348
	i32 690569205, ; 117: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 118: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 342
	i32 693804605, ; 119: System.Windows => 0x295a9e3d => 154
	i32 695458937, ; 120: Microsoft.Extensions.AmbientMetadata.Application.dll => 0x2973dc79 => 197
	i32 699345723, ; 121: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 122: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 337
	i32 700358131, ; 123: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 124: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 363
	i32 709557578, ; 125: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 351
	i32 720511267, ; 126: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 341
	i32 722857257, ; 127: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 723796036, ; 128: System.ClientModel.dll => 0x2b244044 => 248
	i32 731701662, ; 129: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 220
	i32 735137430, ; 130: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 131: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 132: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 256
	i32 759454413, ; 133: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 134: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 135: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 136: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 372
	i32 782533833, ; 137: Xamarin.Google.AutoValue.Annotations.dll => 0x2ea484c9 => 332
	i32 783598934, ; 138: Fast_Cash => 0x2eb4c556 => 0
	i32 789151979, ; 139: Microsoft.Extensions.Options => 0x2f0980eb => 219
	i32 790371945, ; 140: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 284
	i32 799104817, ; 141: Google.Cloud.Vision.V1.dll => 0x2fa15f31 => 186
	i32 804715423, ; 142: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 143: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 298
	i32 823281589, ; 144: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 145: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 146: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 147: System.Net.Quic => 0x31b69d60 => 71
	i32 839353180, ; 148: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 346
	i32 843511501, ; 149: Xamarin.AndroidX.Print => 0x3246f6cd => 311
	i32 865465478, ; 150: zxing.dll => 0x3395f486 => 344
	i32 873119928, ; 151: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 152: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 153: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 154: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 155: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 156: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 375
	i32 928116545, ; 157: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 336
	i32 939431778, ; 158: Polly.Core.dll => 0x37fe9762 => 244
	i32 952186615, ; 159: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 160: Newtonsoft.Json => 0x38f24a24 => 240
	i32 956575887, ; 161: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 341
	i32 966729478, ; 162: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 334
	i32 967690846, ; 163: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 295
	i32 975236339, ; 164: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 165: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 166: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 167: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 168: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 169: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 170: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 171: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 315
	i32 1019214401, ; 172: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 173: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 203
	i32 1029334545, ; 174: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 350
	i32 1031528504, ; 175: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 335
	i32 1035644815, ; 176: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 264
	i32 1036536393, ; 177: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 178: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 179: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 206
	i32 1049751285, ; 180: Google.Api.CommonProtos.dll => 0x3e91eef5 => 180
	i32 1052210849, ; 181: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 302
	i32 1061503568, ; 182: Xamarin.Google.AutoValue.Annotations => 0x3f454250 => 332
	i32 1062017875, ; 183: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 226
	i32 1067306892, ; 184: GoogleGson => 0x3f9dcf8c => 189
	i32 1082857460, ; 185: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 186: Xamarin.Kotlin.StdLib => 0x409e66d8 => 338
	i32 1098259244, ; 187: System => 0x41761b2c => 164
	i32 1110309514, ; 188: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 209
	i32 1114503370, ; 189: Microsoft.Extensions.Http.Diagnostics => 0x426df8ca => 211
	i32 1118262833, ; 190: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 363
	i32 1121599056, ; 191: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 301
	i32 1127295045, ; 192: Polly.dll => 0x43312845 => 243
	i32 1127624469, ; 193: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 217
	i32 1149092582, ; 194: Xamarin.AndroidX.Window => 0x447dc2e6 => 328
	i32 1168523401, ; 195: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 369
	i32 1170634674, ; 196: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 197: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 208
	i32 1175144683, ; 198: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 324
	i32 1178241025, ; 199: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 309
	i32 1186231468, ; 200: Newtonsoft.Json.Bson.dll => 0x46b474ac => 241
	i32 1187360460, ; 201: Fast_Cash.dll => 0x46c5aecc => 0
	i32 1203173028, ; 202: Grpc.Net.Client => 0x47b6f6a4 => 192
	i32 1203215381, ; 203: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 367
	i32 1204270330, ; 204: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 266
	i32 1208641965, ; 205: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 206: CommunityToolkit.Mvvm => 0x4868cc7b => 178
	i32 1219128291, ; 207: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 208: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 365
	i32 1243150071, ; 209: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 329
	i32 1253011324, ; 210: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1259219886, ; 211: Google.Cloud.Vision.V1 => 0x4b0e2bae => 186
	i32 1260983243, ; 212: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 349
	i32 1264511973, ; 213: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 319
	i32 1267360935, ; 214: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 323
	i32 1273260888, ; 215: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 275
	i32 1275534314, ; 216: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 342
	i32 1278448581, ; 217: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 263
	i32 1293217323, ; 218: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 286
	i32 1309188875, ; 219: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 220: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 328
	i32 1324164729, ; 221: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 222: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 223: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 224: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 379
	i32 1376866003, ; 225: Xamarin.AndroidX.SavedState => 0x52114ed3 => 315
	i32 1379779777, ; 226: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 227: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 228: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 279
	i32 1408764838, ; 229: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 230: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 231: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1424762768, ; 232: Microsoft.Rest.ClientRuntime.Azure => 0x54ec2790 => 239
	i32 1430672901, ; 233: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 347
	i32 1434145427, ; 234: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 235: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 334
	i32 1437713837, ; 236: Grpc.Auth => 0x55b1c5ad => 190
	i32 1439761251, ; 237: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 238: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 239: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 240: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 241: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 242: System.IdentityModel.Tokens.Jwt => 0x57137723 => 250
	i32 1461004990, ; 243: es\Microsoft.Maui.Controls.resources => 0x57152abe => 353
	i32 1461234159, ; 244: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 245: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 246: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 247: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 265
	i32 1470490898, ; 248: Microsoft.Extensions.Primitives => 0x57a5e912 => 221
	i32 1479771757, ; 249: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 250: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 251: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 252: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 316
	i32 1493001747, ; 253: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 357
	i32 1496985141, ; 254: Microsoft.Extensions.Diagnostics.ExceptionSummarization.dll => 0x593a2e35 => 207
	i32 1498168481, ; 255: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 228
	i32 1505131794, ; 256: Microsoft.Extensions.Http => 0x59b67d12 => 210
	i32 1514721132, ; 257: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 352
	i32 1536373174, ; 258: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 259: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 260: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 261: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 262: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 372
	i32 1551954004, ; 263: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 231
	i32 1565862583, ; 264: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 265: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1570023712, ; 266: Microsoft.Azure.CognitiveServices.Vision.ComputerVision.dll => 0x5d94a920 => 195
	i32 1573704789, ; 267: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1575375756, ; 268: Polly.Core => 0x5de6538c => 244
	i32 1580037396, ; 269: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 270: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 271: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 285
	i32 1592978981, ; 272: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 273: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 335
	i32 1601112923, ; 274: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 275: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 276: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 277: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 305
	i32 1622358360, ; 278: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 279: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 327
	i32 1634654947, ; 280: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 176
	i32 1635184631, ; 281: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 289
	i32 1636350590, ; 282: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 282
	i32 1639515021, ; 283: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 284: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 285: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 286: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 287: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 321
	i32 1658251792, ; 288: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 331
	i32 1670060433, ; 289: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 277
	i32 1675553242, ; 290: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 291: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 292: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 293: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 294: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 295: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 296: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 339
	i32 1701541528, ; 297: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 298: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 298
	i32 1726116996, ; 299: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 300: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 301: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 273
	i32 1736233607, ; 302: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 370
	i32 1743415430, ; 303: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 348
	i32 1744735666, ; 304: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 305: Mono.Android.Export => 0x6816ab6a => 169
	i32 1748279916, ; 306: Polly.RateLimiting.dll => 0x6834a26c => 247
	i32 1750313021, ; 307: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 308: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 309: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 310: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 311: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 320
	i32 1770582343, ; 312: Microsoft.Extensions.Logging.dll => 0x6988f147 => 214
	i32 1776026572, ; 313: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 314: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 315: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782161461, ; 316: Grpc.Core.Api => 0x6a39a035 => 191
	i32 1782862114, ; 317: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 364
	i32 1788241197, ; 318: Xamarin.AndroidX.Fragment => 0x6a96652d => 291
	i32 1793755602, ; 319: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 356
	i32 1794500907, ; 320: Microsoft.Identity.Client.dll => 0x6af5e92b => 225
	i32 1796167890, ; 321: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 196
	i32 1808609942, ; 322: Xamarin.AndroidX.Loader => 0x6bcd3296 => 305
	i32 1813058853, ; 323: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 338
	i32 1813201214, ; 324: Xamarin.Google.Android.Material => 0x6c13413e => 331
	i32 1818569960, ; 325: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 310
	i32 1818787751, ; 326: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 327: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 328: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 329: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 215
	i32 1842015223, ; 330: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 376
	i32 1845699015, ; 331: Microsoft.Extensions.Diagnostics.ExceptionSummarization => 0x6e0321c7 => 207
	i32 1847515442, ; 332: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 256
	i32 1853025655, ; 333: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 373
	i32 1858542181, ; 334: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1859239007, ; 335: Microsoft.Extensions.DependencyInjection.AutoActivation => 0x6ed1bc5f => 204
	i32 1867746548, ; 336: Xamarin.Essentials.dll => 0x6f538cf4 => 330
	i32 1870277092, ; 337: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 338: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 355
	i32 1879696579, ; 339: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 340: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 267
	i32 1888955245, ; 341: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 342: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 343: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900519031, ; 344: Grpc.Auth.dll => 0x71479e77 => 190
	i32 1900610850, ; 345: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 346: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 347: System.CodeDom.dll => 0x72e96247 => 249
	i32 1939592360, ; 348: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 349: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 350: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 317
	i32 1968388702, ; 351: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 199
	i32 1983156543, ; 352: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 339
	i32 1985761444, ; 353: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 258
	i32 1986222447, ; 354: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 230
	i32 2003115576, ; 355: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 352
	i32 2011961780, ; 356: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 357: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 302
	i32 2025202353, ; 358: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 347
	i32 2031763787, ; 359: Xamarin.Android.Glide => 0x791a414b => 255
	i32 2040764568, ; 360: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 226
	i32 2045470958, ; 361: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 362: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 201
	i32 2055257422, ; 363: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 297
	i32 2057861558, ; 364: CommunityToolkit.Maui.Markup => 0x7aa879b6 => 177
	i32 2060060697, ; 365: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 366: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 351
	i32 2069514766, ; 367: Newtonsoft.Json.Bson => 0x7b5a4a0e => 241
	i32 2070888862, ; 368: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 369: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2082593585, ; 370: Microsoft.Azure.CognitiveServices.Vision.ComputerVision => 0x7c21db31 => 195
	i32 2090596640, ; 371: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 372: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 373: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143465592, ; 374: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 231
	i32 2143790110, ; 375: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 376: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 377: Microsoft.Maui => 0x80bd55ad => 235
	i32 2169148018, ; 378: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 359
	i32 2178612968, ; 379: System.CodeDom => 0x81dafee8 => 249
	i32 2179622097, ; 380: Emgu.CV => 0x81ea64d1 => 179
	i32 2181898931, ; 381: Microsoft.Extensions.Options.dll => 0x820d22b3 => 219
	i32 2192057212, ; 382: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 215
	i32 2193016926, ; 383: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 384: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 343
	i32 2201231467, ; 385: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 386: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 218
	i32 2207618523, ; 387: it\Microsoft.Maui.Controls.resources => 0x839595db => 361
	i32 2217644978, ; 388: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 324
	i32 2222056684, ; 389: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 390: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 306
	i32 2251018166, ; 391: Microsoft.Extensions.Compliance.Abstractions.dll => 0x862bcfb6 => 198
	i32 2252106437, ; 392: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 393: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 394: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 395: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 200
	i32 2267999099, ; 396: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 257
	i32 2270573516, ; 397: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 355
	i32 2279755925, ; 398: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 313
	i32 2293034957, ; 399: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 400: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 401: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 402: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 365
	i32 2305521784, ; 403: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 404: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 261
	i32 2320631194, ; 405: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 406: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 407: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2350129686, ; 408: Microsoft.Rest.ClientRuntime.dll => 0x8c142216 => 238
	i32 2353062107, ; 409: System.Net.Primitives => 0x8c40e0db => 70
	i32 2363639319, ; 410: Polly.Extensions.dll => 0x8ce24617 => 245
	i32 2368005991, ; 411: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 412: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 229
	i32 2371007202, ; 413: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 199
	i32 2378619854, ; 414: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 415: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2392818924, ; 416: System.Net.Http.Formatting.dll => 0x8e9f84ec => 194
	i32 2395872292, ; 417: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 360
	i32 2397347608, ; 418: Google.LongRunning.dll => 0x8ee49f18 => 187
	i32 2401565422, ; 419: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 420: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 288
	i32 2421380589, ; 421: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 422: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 275
	i32 2427813419, ; 423: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 357
	i32 2435356389, ; 424: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 425: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 426: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 427: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 428: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 429: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 278
	i32 2468819159, ; 430: Microsoft.Extensions.Telemetry.Abstractions.dll => 0x932730d7 => 224
	i32 2471841756, ; 431: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 432: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 433: Microsoft.Maui.Controls => 0x93dba8a1 => 233
	i32 2483903535, ; 434: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 435: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2486847491, ; 436: Google.Api.Gax => 0x943a4803 => 181
	i32 2490993605, ; 437: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 438: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2504990885, ; 439: Microsoft.Extensions.AmbientMetadata.Application => 0x954f20a5 => 197
	i32 2505896520, ; 440: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 300
	i32 2522472828, ; 441: Xamarin.Android.Glide.dll => 0x9659e17c => 255
	i32 2538310050, ; 442: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 443: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 358
	i32 2562349572, ; 444: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 445: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576008504, ; 446: Microsoft.Extensions.Telemetry.dll => 0x998ac538 => 223
	i32 2581783588, ; 447: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 301
	i32 2581819634, ; 448: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 323
	i32 2585220780, ; 449: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 450: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 451: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 452: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 208
	i32 2593496499, ; 453: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 367
	i32 2605712449, ; 454: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 343
	i32 2606408534, ; 455: Microsoft.Extensions.Telemetry.Abstractions => 0x9b5aa356 => 224
	i32 2615233544, ; 456: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 292
	i32 2616218305, ; 457: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 217
	i32 2617129537, ; 458: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 459: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 460: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 282
	i32 2624644809, ; 461: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 287
	i32 2626831493, ; 462: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 362
	i32 2627185994, ; 463: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 464: System.Memory.Data => 0x9ca74fdc => 252
	i32 2629843544, ; 465: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 466: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 296
	i32 2640290731, ; 467: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 229
	i32 2640706905, ; 468: Azure.Core => 0x9d65fd59 => 173
	i32 2663391936, ; 469: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 257
	i32 2663698177, ; 470: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 471: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 472: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 473: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 474: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 475: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 476: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 477: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 321
	i32 2701298998, ; 478: Emgu.CV.dll => 0xa1028d36 => 179
	i32 2715334215, ; 479: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 480: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 481: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 482: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 483: Xamarin.AndroidX.Activity => 0xa2e0939b => 259
	i32 2734223671, ; 484: Microsoft.Extensions.Http.Polly.dll => 0xa2f8f137 => 212
	i32 2735172069, ; 485: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 486: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 265
	i32 2740051746, ; 487: Microsoft.Identity.Client => 0xa351df22 => 225
	i32 2740948882, ; 488: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2744327253, ; 489: Google.Api.Gax.Grpc.dll => 0xa3931c55 => 182
	i32 2748088231, ; 490: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 491: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 368
	i32 2757554483, ; 492: Google.Api.Gax.Grpc => 0xa45cf133 => 182
	i32 2758225723, ; 493: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 234
	i32 2764765095, ; 494: Microsoft.Maui.dll => 0xa4caf7a7 => 235
	i32 2765824710, ; 495: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 496: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 337
	i32 2778768386, ; 497: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 326
	i32 2779977773, ; 498: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 314
	i32 2785988530, ; 499: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 374
	i32 2788224221, ; 500: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 292
	i32 2801831435, ; 501: Microsoft.Maui.Graphics => 0xa7008e0b => 237
	i32 2803228030, ; 502: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 503: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 353
	i32 2810250172, ; 504: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 279
	i32 2819470561, ; 505: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 506: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 507: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 314
	i32 2824502124, ; 508: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 509: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 366
	i32 2838993487, ; 510: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 303
	i32 2839679515, ; 511: Google.LongRunning => 0xa942121b => 187
	i32 2849599387, ; 512: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 513: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 326
	i32 2855708567, ; 514: Xamarin.AndroidX.Transition => 0xaa36a797 => 322
	i32 2861098320, ; 515: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 516: Microsoft.Maui.Essentials => 0xaa8a4878 => 236
	i32 2868488919, ; 517: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 176
	i32 2870099610, ; 518: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 260
	i32 2875164099, ; 519: Jsr305Binding.dll => 0xab5f85c3 => 333
	i32 2875220617, ; 520: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 521: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 290
	i32 2887636118, ; 522: System.Net.dll => 0xac1dd496 => 81
	i32 2893550578, ; 523: Google.Apis.Core => 0xac7813f2 => 185
	i32 2898407901, ; 524: System.Management => 0xacc231dd => 251
	i32 2899753641, ; 525: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 526: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 527: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 528: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 529: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2912646636, ; 530: Google.Api.CommonProtos => 0xad9b75ec => 180
	i32 2916838712, ; 531: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 327
	i32 2919462931, ; 532: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 533: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 262
	i32 2936416060, ; 534: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 535: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 536: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 537: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2961259629, ; 538: Microsoft.Rest.ClientRuntime => 0xb0813c6d => 238
	i32 2965157864, ; 539: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 272
	i32 2968338931, ; 540: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 541: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 220
	i32 2972252294, ; 542: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 543: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 286
	i32 2987532451, ; 544: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 317
	i32 2990604888, ; 545: Google.Apis => 0xb2410258 => 183
	i32 2991449226, ; 546: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 270
	i32 2996846495, ; 547: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 299
	i32 3000842441, ; 548: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 272
	i32 3016983068, ; 549: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 319
	i32 3017413932, ; 550: Polly.Extensions => 0xb3da152c => 245
	i32 3020703001, ; 551: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 205
	i32 3023353419, ; 552: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 553: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 294
	i32 3033605958, ; 554: System.Memory.Data.dll => 0xb4d12746 => 252
	i32 3038032645, ; 555: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 381
	i32 3047751430, ; 556: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 270
	i32 3056245963, ; 557: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 316
	i32 3057625584, ; 558: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 307
	i32 3059408633, ; 559: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 560: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 561: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 562: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 359
	i32 3084678329, ; 563: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 230
	i32 3090735792, ; 564: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 565: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 566: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3106263381, ; 567: Grpc.Net.Common.dll => 0xb925d155 => 193
	i32 3109243939, ; 568: Microsoft.Extensions.Logging.Configuration => 0xb9534c23 => 216
	i32 3111772706, ; 569: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3112611272, ; 570: Polly.RateLimiting => 0xb986adc8 => 247
	i32 3121463068, ; 571: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 572: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 573: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 574: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 575: GoogleGson.dll => 0xbba64c02 => 189
	i32 3159123045, ; 576: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 577: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 578: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 308
	i32 3180026441, ; 579: Tesseract => 0xbd8b5a49 => 254
	i32 3192346100, ; 580: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 581: System.Web => 0xbe592c0c => 153
	i32 3203277885, ; 582: Google.Api.Gax.dll => 0xbeee243d => 181
	i32 3204380047, ; 583: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 584: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 585: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 285
	i32 3215347189, ; 586: zxing => 0xbfa64df5 => 344
	i32 3220365878, ; 587: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 588: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 589: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 590: Xamarin.AndroidX.CardView => 0xc235e84d => 273
	i32 3265493905, ; 591: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 592: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 593: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 594: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 595: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286373667, ; 596: ZXing.Net.MAUI.dll => 0xc3e21523 => 345
	i32 3290767353, ; 597: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 598: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 599: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 600: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 354
	i32 3312457198, ; 601: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 228
	i32 3316684772, ; 602: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 603: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 283
	i32 3317144872, ; 604: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 605: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 267
	i32 3345895724, ; 606: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 312
	i32 3346324047, ; 607: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 309
	i32 3357674450, ; 608: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 371
	i32 3358260929, ; 609: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 610: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 260
	i32 3362522851, ; 611: Xamarin.AndroidX.Core => 0xc86c06e3 => 280
	i32 3366347497, ; 612: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 613: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 313
	i32 3381016424, ; 614: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 350
	i32 3395150330, ; 615: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3402775237, ; 616: CommunityToolkit.Maui.Markup.dll => 0xcad23ac5 => 177
	i32 3403906625, ; 617: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 618: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 284
	i32 3413944578, ; 619: Xamarin.AndroidX.Camera.Camera2.dll => 0xcb7ca902 => 269
	i32 3421170118, ; 620: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 201
	i32 3421910702, ; 621: Xamarin.AndroidX.Camera.Camera2 => 0xcbf636ae => 269
	i32 3428513518, ; 622: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 202
	i32 3429136800, ; 623: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 624: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 625: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 287
	i32 3445260447, ; 626: System.Formats.Tar => 0xcd5a809f => 39
	i32 3448896322, ; 627: Polly => 0xcd91fb42 => 243
	i32 3452344032, ; 628: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 232
	i32 3453592554, ; 629: Google.Apis.Core.dll => 0xcdd9a3ea => 185
	i32 3463511458, ; 630: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 358
	i32 3471940407, ; 631: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 632: Mono.Android => 0xcf3163e6 => 171
	i32 3479005784, ; 633: Microsoft.Extensions.Resilience.dll => 0xcf5d6a58 => 222
	i32 3479583265, ; 634: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 371
	i32 3484440000, ; 635: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 370
	i32 3485117614, ; 636: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 637: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 638: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 276
	i32 3499097210, ; 639: Google.Protobuf.dll => 0xd08ffc7a => 188
	i32 3509114376, ; 640: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 641: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 642: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 643: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3558648585, ; 644: System.ClientModel => 0xd41cab09 => 248
	i32 3560100363, ; 645: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 646: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 647: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 648: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 378
	i32 3597029428, ; 649: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 258
	i32 3598340787, ; 650: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 651: System.Linq.dll => 0xd715a361 => 61
	i32 3612435020, ; 652: System.Management.dll => 0xd751624c => 251
	i32 3624195450, ; 653: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 654: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 311
	i32 3633644679, ; 655: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 262
	i32 3638274909, ; 656: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 657: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 297
	i32 3643446276, ; 658: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 375
	i32 3643854240, ; 659: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 308
	i32 3645089577, ; 660: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 661: Google.Protobuf => 0xd94bea07 => 188
	i32 3657292374, ; 662: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 200
	i32 3659663228, ; 663: Microsoft.Extensions.DependencyInjection.AutoActivation.dll => 0xda22077c => 204
	i32 3660523487, ; 664: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 665: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676461095, ; 666: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 271
	i32 3682565725, ; 667: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 268
	i32 3684561358, ; 668: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 276
	i32 3688203248, ; 669: Microsoft.Extensions.Http.Resilience => 0xdbd583f0 => 213
	i32 3697841164, ; 670: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 380
	i32 3700591436, ; 671: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 227
	i32 3700866549, ; 672: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 673: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 281
	i32 3716563718, ; 674: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 675: Xamarin.AndroidX.Annotation => 0xdda814c6 => 261
	i32 3724971120, ; 676: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 307
	i32 3732100267, ; 677: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 678: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 679: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 680: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751582913, ; 681: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 346
	i32 3765508441, ; 682: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 218
	i32 3786282454, ; 683: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 274
	i32 3792276235, ; 684: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3793997468, ; 685: Google.Apis.Auth.dll => 0xe223ce9c => 184
	i32 3799742899, ; 686: Tesseract.dll => 0xe27b79b3 => 254
	i32 3800979733, ; 687: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 232
	i32 3802395368, ; 688: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 689: CommunityToolkit.Maui.dll => 0xe3886bf7 => 175
	i32 3819260425, ; 690: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 691: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 692: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 693: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 203
	i32 3842894692, ; 694: ZXing.Net.MAUI => 0xe50deb64 => 345
	i32 3844307129, ; 695: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 696: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 697: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 698: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 699: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 700: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 701: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 322
	i32 3888767677, ; 702: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 312
	i32 3889960447, ; 703: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 379
	i32 3896087913, ; 704: OpenCvSharp => 0xe8399569 => 242
	i32 3896106733, ; 705: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 706: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 280
	i32 3901907137, ; 707: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 708: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 709: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 325
	i32 3928044579, ; 710: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 711: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 712: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 310
	i32 3945713374, ; 713: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 714: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 715: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 264
	i32 3959773229, ; 716: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 299
	i32 3972781778, ; 717: System.Threading.RateLimiting => 0xeccbd6d2 => 253
	i32 3980434154, ; 718: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 374
	i32 3987592930, ; 719: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 356
	i32 4003436829, ; 720: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4008686814, ; 721: Microsoft.Extensions.Http.Polly => 0xeeefb4de => 212
	i32 4015948917, ; 722: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 263
	i32 4025784931, ; 723: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 724: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 234
	i32 4054681211, ; 725: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4059682726, ; 726: Google.Apis.dll => 0xf1f9d7a6 => 183
	i32 4068434129, ; 727: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 728: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4076805585, ; 729: Microsoft.Extensions.Http.Diagnostics.dll => 0xf2ff1dd1 => 211
	i32 4078967171, ; 730: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 209
	i32 4082882467, ; 731: Google.Apis.Auth => 0xf35bd7a3 => 184
	i32 4094352644, ; 732: Microsoft.Maui.Essentials.dll => 0xf40add04 => 236
	i32 4099507663, ; 733: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 734: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 735: Xamarin.AndroidX.Emoji2 => 0xf479582c => 288
	i32 4102112229, ; 736: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 369
	i32 4125707920, ; 737: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 364
	i32 4126470640, ; 738: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 202
	i32 4127667938, ; 739: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 740: System.AppContext => 0xf6318da0 => 6
	i32 4131741489, ; 741: System.Net.Http.Formatting => 0xf6455f31 => 194
	i32 4147896353, ; 742: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 743: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 376
	i32 4151237749, ; 744: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 745: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 746: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 747: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 748: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 749: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 304
	i32 4185676441, ; 750: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 751: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 752: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4247542317, ; 753: System.Threading.RateLimiting.dll => 0xfd2c5a2d => 253
	i32 4256097574, ; 754: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 281
	i32 4258378803, ; 755: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 303
	i32 4260525087, ; 756: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 757: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 250
	i32 4271975918, ; 758: Microsoft.Maui.Controls.dll => 0xfea12dee => 233
	i32 4273543125, ; 759: OpenCvSharp.dll => 0xfeb917d5 => 242
	i32 4274623895, ; 760: CommunityToolkit.Mvvm.dll => 0xfec99597 => 178
	i32 4274976490, ; 761: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 762: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 304
	i32 4294763496 ; 763: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 290
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [764 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 300, ; 3
	i32 336, ; 4
	i32 48, ; 5
	i32 240, ; 6
	i32 80, ; 7
	i32 223, ; 8
	i32 271, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 380, ; 12
	i32 124, ; 13
	i32 237, ; 14
	i32 102, ; 15
	i32 206, ; 16
	i32 318, ; 17
	i32 107, ; 18
	i32 318, ; 19
	i32 139, ; 20
	i32 246, ; 21
	i32 340, ; 22
	i32 77, ; 23
	i32 124, ; 24
	i32 13, ; 25
	i32 274, ; 26
	i32 132, ; 27
	i32 198, ; 28
	i32 320, ; 29
	i32 151, ; 30
	i32 377, ; 31
	i32 378, ; 32
	i32 18, ; 33
	i32 268, ; 34
	i32 26, ; 35
	i32 205, ; 36
	i32 294, ; 37
	i32 1, ; 38
	i32 59, ; 39
	i32 42, ; 40
	i32 222, ; 41
	i32 91, ; 42
	i32 277, ; 43
	i32 147, ; 44
	i32 296, ; 45
	i32 293, ; 46
	i32 349, ; 47
	i32 54, ; 48
	i32 210, ; 49
	i32 69, ; 50
	i32 377, ; 51
	i32 259, ; 52
	i32 83, ; 53
	i32 362, ; 54
	i32 295, ; 55
	i32 361, ; 56
	i32 131, ; 57
	i32 193, ; 58
	i32 55, ; 59
	i32 191, ; 60
	i32 149, ; 61
	i32 74, ; 62
	i32 145, ; 63
	i32 62, ; 64
	i32 192, ; 65
	i32 146, ; 66
	i32 381, ; 67
	i32 165, ; 68
	i32 373, ; 69
	i32 278, ; 70
	i32 330, ; 71
	i32 12, ; 72
	i32 291, ; 73
	i32 125, ; 74
	i32 152, ; 75
	i32 113, ; 76
	i32 166, ; 77
	i32 164, ; 78
	i32 293, ; 79
	i32 246, ; 80
	i32 227, ; 81
	i32 306, ; 82
	i32 84, ; 83
	i32 360, ; 84
	i32 354, ; 85
	i32 221, ; 86
	i32 150, ; 87
	i32 340, ; 88
	i32 60, ; 89
	i32 214, ; 90
	i32 51, ; 91
	i32 103, ; 92
	i32 216, ; 93
	i32 114, ; 94
	i32 196, ; 95
	i32 40, ; 96
	i32 333, ; 97
	i32 239, ; 98
	i32 329, ; 99
	i32 120, ; 100
	i32 213, ; 101
	i32 368, ; 102
	i32 175, ; 103
	i32 52, ; 104
	i32 44, ; 105
	i32 119, ; 106
	i32 283, ; 107
	i32 366, ; 108
	i32 289, ; 109
	i32 81, ; 110
	i32 136, ; 111
	i32 325, ; 112
	i32 266, ; 113
	i32 8, ; 114
	i32 73, ; 115
	i32 348, ; 116
	i32 155, ; 117
	i32 342, ; 118
	i32 154, ; 119
	i32 197, ; 120
	i32 92, ; 121
	i32 337, ; 122
	i32 45, ; 123
	i32 363, ; 124
	i32 351, ; 125
	i32 341, ; 126
	i32 109, ; 127
	i32 248, ; 128
	i32 220, ; 129
	i32 129, ; 130
	i32 25, ; 131
	i32 256, ; 132
	i32 72, ; 133
	i32 55, ; 134
	i32 46, ; 135
	i32 372, ; 136
	i32 332, ; 137
	i32 0, ; 138
	i32 219, ; 139
	i32 284, ; 140
	i32 186, ; 141
	i32 22, ; 142
	i32 298, ; 143
	i32 86, ; 144
	i32 43, ; 145
	i32 160, ; 146
	i32 71, ; 147
	i32 346, ; 148
	i32 311, ; 149
	i32 344, ; 150
	i32 3, ; 151
	i32 42, ; 152
	i32 63, ; 153
	i32 16, ; 154
	i32 53, ; 155
	i32 375, ; 156
	i32 336, ; 157
	i32 244, ; 158
	i32 105, ; 159
	i32 240, ; 160
	i32 341, ; 161
	i32 334, ; 162
	i32 295, ; 163
	i32 34, ; 164
	i32 158, ; 165
	i32 85, ; 166
	i32 32, ; 167
	i32 12, ; 168
	i32 51, ; 169
	i32 56, ; 170
	i32 315, ; 171
	i32 36, ; 172
	i32 203, ; 173
	i32 350, ; 174
	i32 335, ; 175
	i32 264, ; 176
	i32 35, ; 177
	i32 58, ; 178
	i32 206, ; 179
	i32 180, ; 180
	i32 302, ; 181
	i32 332, ; 182
	i32 226, ; 183
	i32 189, ; 184
	i32 17, ; 185
	i32 338, ; 186
	i32 164, ; 187
	i32 209, ; 188
	i32 211, ; 189
	i32 363, ; 190
	i32 301, ; 191
	i32 243, ; 192
	i32 217, ; 193
	i32 328, ; 194
	i32 369, ; 195
	i32 153, ; 196
	i32 208, ; 197
	i32 324, ; 198
	i32 309, ; 199
	i32 241, ; 200
	i32 0, ; 201
	i32 192, ; 202
	i32 367, ; 203
	i32 266, ; 204
	i32 29, ; 205
	i32 178, ; 206
	i32 52, ; 207
	i32 365, ; 208
	i32 329, ; 209
	i32 5, ; 210
	i32 186, ; 211
	i32 349, ; 212
	i32 319, ; 213
	i32 323, ; 214
	i32 275, ; 215
	i32 342, ; 216
	i32 263, ; 217
	i32 286, ; 218
	i32 85, ; 219
	i32 328, ; 220
	i32 61, ; 221
	i32 112, ; 222
	i32 57, ; 223
	i32 379, ; 224
	i32 315, ; 225
	i32 99, ; 226
	i32 19, ; 227
	i32 279, ; 228
	i32 111, ; 229
	i32 101, ; 230
	i32 102, ; 231
	i32 239, ; 232
	i32 347, ; 233
	i32 104, ; 234
	i32 334, ; 235
	i32 190, ; 236
	i32 71, ; 237
	i32 38, ; 238
	i32 32, ; 239
	i32 103, ; 240
	i32 73, ; 241
	i32 250, ; 242
	i32 353, ; 243
	i32 9, ; 244
	i32 123, ; 245
	i32 46, ; 246
	i32 265, ; 247
	i32 221, ; 248
	i32 9, ; 249
	i32 43, ; 250
	i32 4, ; 251
	i32 316, ; 252
	i32 357, ; 253
	i32 207, ; 254
	i32 228, ; 255
	i32 210, ; 256
	i32 352, ; 257
	i32 31, ; 258
	i32 138, ; 259
	i32 92, ; 260
	i32 93, ; 261
	i32 372, ; 262
	i32 231, ; 263
	i32 49, ; 264
	i32 141, ; 265
	i32 195, ; 266
	i32 112, ; 267
	i32 244, ; 268
	i32 140, ; 269
	i32 174, ; 270
	i32 285, ; 271
	i32 115, ; 272
	i32 335, ; 273
	i32 157, ; 274
	i32 76, ; 275
	i32 79, ; 276
	i32 305, ; 277
	i32 37, ; 278
	i32 327, ; 279
	i32 176, ; 280
	i32 289, ; 281
	i32 282, ; 282
	i32 64, ; 283
	i32 138, ; 284
	i32 15, ; 285
	i32 116, ; 286
	i32 321, ; 287
	i32 331, ; 288
	i32 277, ; 289
	i32 48, ; 290
	i32 70, ; 291
	i32 80, ; 292
	i32 126, ; 293
	i32 94, ; 294
	i32 121, ; 295
	i32 339, ; 296
	i32 26, ; 297
	i32 298, ; 298
	i32 97, ; 299
	i32 28, ; 300
	i32 273, ; 301
	i32 370, ; 302
	i32 348, ; 303
	i32 149, ; 304
	i32 169, ; 305
	i32 247, ; 306
	i32 4, ; 307
	i32 98, ; 308
	i32 33, ; 309
	i32 93, ; 310
	i32 320, ; 311
	i32 214, ; 312
	i32 21, ; 313
	i32 41, ; 314
	i32 170, ; 315
	i32 191, ; 316
	i32 364, ; 317
	i32 291, ; 318
	i32 356, ; 319
	i32 225, ; 320
	i32 196, ; 321
	i32 305, ; 322
	i32 338, ; 323
	i32 331, ; 324
	i32 310, ; 325
	i32 2, ; 326
	i32 134, ; 327
	i32 111, ; 328
	i32 215, ; 329
	i32 376, ; 330
	i32 207, ; 331
	i32 256, ; 332
	i32 373, ; 333
	i32 58, ; 334
	i32 204, ; 335
	i32 330, ; 336
	i32 95, ; 337
	i32 355, ; 338
	i32 39, ; 339
	i32 267, ; 340
	i32 25, ; 341
	i32 94, ; 342
	i32 89, ; 343
	i32 190, ; 344
	i32 99, ; 345
	i32 10, ; 346
	i32 249, ; 347
	i32 87, ; 348
	i32 100, ; 349
	i32 317, ; 350
	i32 199, ; 351
	i32 339, ; 352
	i32 258, ; 353
	i32 230, ; 354
	i32 352, ; 355
	i32 7, ; 356
	i32 302, ; 357
	i32 347, ; 358
	i32 255, ; 359
	i32 226, ; 360
	i32 88, ; 361
	i32 201, ; 362
	i32 297, ; 363
	i32 177, ; 364
	i32 154, ; 365
	i32 351, ; 366
	i32 241, ; 367
	i32 33, ; 368
	i32 116, ; 369
	i32 195, ; 370
	i32 82, ; 371
	i32 20, ; 372
	i32 11, ; 373
	i32 231, ; 374
	i32 162, ; 375
	i32 3, ; 376
	i32 235, ; 377
	i32 359, ; 378
	i32 249, ; 379
	i32 179, ; 380
	i32 219, ; 381
	i32 215, ; 382
	i32 84, ; 383
	i32 343, ; 384
	i32 64, ; 385
	i32 218, ; 386
	i32 361, ; 387
	i32 324, ; 388
	i32 143, ; 389
	i32 306, ; 390
	i32 198, ; 391
	i32 157, ; 392
	i32 41, ; 393
	i32 117, ; 394
	i32 200, ; 395
	i32 257, ; 396
	i32 355, ; 397
	i32 313, ; 398
	i32 131, ; 399
	i32 75, ; 400
	i32 66, ; 401
	i32 365, ; 402
	i32 172, ; 403
	i32 261, ; 404
	i32 143, ; 405
	i32 106, ; 406
	i32 151, ; 407
	i32 238, ; 408
	i32 70, ; 409
	i32 245, ; 410
	i32 156, ; 411
	i32 229, ; 412
	i32 199, ; 413
	i32 121, ; 414
	i32 127, ; 415
	i32 194, ; 416
	i32 360, ; 417
	i32 187, ; 418
	i32 152, ; 419
	i32 288, ; 420
	i32 141, ; 421
	i32 275, ; 422
	i32 357, ; 423
	i32 20, ; 424
	i32 14, ; 425
	i32 135, ; 426
	i32 75, ; 427
	i32 59, ; 428
	i32 278, ; 429
	i32 224, ; 430
	i32 167, ; 431
	i32 168, ; 432
	i32 233, ; 433
	i32 15, ; 434
	i32 74, ; 435
	i32 181, ; 436
	i32 6, ; 437
	i32 23, ; 438
	i32 197, ; 439
	i32 300, ; 440
	i32 255, ; 441
	i32 91, ; 442
	i32 358, ; 443
	i32 1, ; 444
	i32 136, ; 445
	i32 223, ; 446
	i32 301, ; 447
	i32 323, ; 448
	i32 134, ; 449
	i32 69, ; 450
	i32 146, ; 451
	i32 208, ; 452
	i32 367, ; 453
	i32 343, ; 454
	i32 224, ; 455
	i32 292, ; 456
	i32 217, ; 457
	i32 88, ; 458
	i32 96, ; 459
	i32 282, ; 460
	i32 287, ; 461
	i32 362, ; 462
	i32 31, ; 463
	i32 252, ; 464
	i32 45, ; 465
	i32 296, ; 466
	i32 229, ; 467
	i32 173, ; 468
	i32 257, ; 469
	i32 109, ; 470
	i32 158, ; 471
	i32 35, ; 472
	i32 22, ; 473
	i32 174, ; 474
	i32 114, ; 475
	i32 57, ; 476
	i32 321, ; 477
	i32 179, ; 478
	i32 144, ; 479
	i32 118, ; 480
	i32 120, ; 481
	i32 110, ; 482
	i32 259, ; 483
	i32 212, ; 484
	i32 139, ; 485
	i32 265, ; 486
	i32 225, ; 487
	i32 54, ; 488
	i32 182, ; 489
	i32 105, ; 490
	i32 368, ; 491
	i32 182, ; 492
	i32 234, ; 493
	i32 235, ; 494
	i32 133, ; 495
	i32 337, ; 496
	i32 326, ; 497
	i32 314, ; 498
	i32 374, ; 499
	i32 292, ; 500
	i32 237, ; 501
	i32 159, ; 502
	i32 353, ; 503
	i32 279, ; 504
	i32 163, ; 505
	i32 132, ; 506
	i32 314, ; 507
	i32 161, ; 508
	i32 366, ; 509
	i32 303, ; 510
	i32 187, ; 511
	i32 140, ; 512
	i32 326, ; 513
	i32 322, ; 514
	i32 169, ; 515
	i32 236, ; 516
	i32 176, ; 517
	i32 260, ; 518
	i32 333, ; 519
	i32 40, ; 520
	i32 290, ; 521
	i32 81, ; 522
	i32 185, ; 523
	i32 251, ; 524
	i32 56, ; 525
	i32 37, ; 526
	i32 97, ; 527
	i32 166, ; 528
	i32 172, ; 529
	i32 180, ; 530
	i32 327, ; 531
	i32 82, ; 532
	i32 262, ; 533
	i32 98, ; 534
	i32 30, ; 535
	i32 159, ; 536
	i32 18, ; 537
	i32 238, ; 538
	i32 272, ; 539
	i32 127, ; 540
	i32 220, ; 541
	i32 119, ; 542
	i32 286, ; 543
	i32 317, ; 544
	i32 183, ; 545
	i32 270, ; 546
	i32 299, ; 547
	i32 272, ; 548
	i32 319, ; 549
	i32 245, ; 550
	i32 205, ; 551
	i32 165, ; 552
	i32 294, ; 553
	i32 252, ; 554
	i32 381, ; 555
	i32 270, ; 556
	i32 316, ; 557
	i32 307, ; 558
	i32 170, ; 559
	i32 16, ; 560
	i32 144, ; 561
	i32 359, ; 562
	i32 230, ; 563
	i32 125, ; 564
	i32 118, ; 565
	i32 38, ; 566
	i32 193, ; 567
	i32 216, ; 568
	i32 115, ; 569
	i32 247, ; 570
	i32 47, ; 571
	i32 142, ; 572
	i32 117, ; 573
	i32 34, ; 574
	i32 189, ; 575
	i32 95, ; 576
	i32 53, ; 577
	i32 308, ; 578
	i32 254, ; 579
	i32 129, ; 580
	i32 153, ; 581
	i32 181, ; 582
	i32 24, ; 583
	i32 161, ; 584
	i32 285, ; 585
	i32 344, ; 586
	i32 148, ; 587
	i32 104, ; 588
	i32 89, ; 589
	i32 273, ; 590
	i32 60, ; 591
	i32 142, ; 592
	i32 100, ; 593
	i32 5, ; 594
	i32 13, ; 595
	i32 345, ; 596
	i32 122, ; 597
	i32 135, ; 598
	i32 28, ; 599
	i32 354, ; 600
	i32 228, ; 601
	i32 72, ; 602
	i32 283, ; 603
	i32 24, ; 604
	i32 267, ; 605
	i32 312, ; 606
	i32 309, ; 607
	i32 371, ; 608
	i32 137, ; 609
	i32 260, ; 610
	i32 280, ; 611
	i32 168, ; 612
	i32 313, ; 613
	i32 350, ; 614
	i32 101, ; 615
	i32 177, ; 616
	i32 123, ; 617
	i32 284, ; 618
	i32 269, ; 619
	i32 201, ; 620
	i32 269, ; 621
	i32 202, ; 622
	i32 163, ; 623
	i32 167, ; 624
	i32 287, ; 625
	i32 39, ; 626
	i32 243, ; 627
	i32 232, ; 628
	i32 185, ; 629
	i32 358, ; 630
	i32 17, ; 631
	i32 171, ; 632
	i32 222, ; 633
	i32 371, ; 634
	i32 370, ; 635
	i32 137, ; 636
	i32 150, ; 637
	i32 276, ; 638
	i32 188, ; 639
	i32 155, ; 640
	i32 130, ; 641
	i32 19, ; 642
	i32 65, ; 643
	i32 248, ; 644
	i32 147, ; 645
	i32 173, ; 646
	i32 47, ; 647
	i32 378, ; 648
	i32 258, ; 649
	i32 79, ; 650
	i32 61, ; 651
	i32 251, ; 652
	i32 106, ; 653
	i32 311, ; 654
	i32 262, ; 655
	i32 49, ; 656
	i32 297, ; 657
	i32 375, ; 658
	i32 308, ; 659
	i32 14, ; 660
	i32 188, ; 661
	i32 200, ; 662
	i32 204, ; 663
	i32 68, ; 664
	i32 171, ; 665
	i32 271, ; 666
	i32 268, ; 667
	i32 276, ; 668
	i32 213, ; 669
	i32 380, ; 670
	i32 227, ; 671
	i32 78, ; 672
	i32 281, ; 673
	i32 108, ; 674
	i32 261, ; 675
	i32 307, ; 676
	i32 67, ; 677
	i32 63, ; 678
	i32 27, ; 679
	i32 160, ; 680
	i32 346, ; 681
	i32 218, ; 682
	i32 274, ; 683
	i32 10, ; 684
	i32 184, ; 685
	i32 254, ; 686
	i32 232, ; 687
	i32 11, ; 688
	i32 175, ; 689
	i32 78, ; 690
	i32 126, ; 691
	i32 83, ; 692
	i32 203, ; 693
	i32 345, ; 694
	i32 66, ; 695
	i32 107, ; 696
	i32 65, ; 697
	i32 128, ; 698
	i32 122, ; 699
	i32 77, ; 700
	i32 322, ; 701
	i32 312, ; 702
	i32 379, ; 703
	i32 242, ; 704
	i32 8, ; 705
	i32 280, ; 706
	i32 2, ; 707
	i32 44, ; 708
	i32 325, ; 709
	i32 156, ; 710
	i32 128, ; 711
	i32 310, ; 712
	i32 23, ; 713
	i32 133, ; 714
	i32 264, ; 715
	i32 299, ; 716
	i32 253, ; 717
	i32 374, ; 718
	i32 356, ; 719
	i32 29, ; 720
	i32 212, ; 721
	i32 263, ; 722
	i32 62, ; 723
	i32 234, ; 724
	i32 90, ; 725
	i32 183, ; 726
	i32 87, ; 727
	i32 148, ; 728
	i32 211, ; 729
	i32 209, ; 730
	i32 184, ; 731
	i32 236, ; 732
	i32 36, ; 733
	i32 86, ; 734
	i32 288, ; 735
	i32 369, ; 736
	i32 364, ; 737
	i32 202, ; 738
	i32 50, ; 739
	i32 6, ; 740
	i32 194, ; 741
	i32 90, ; 742
	i32 376, ; 743
	i32 21, ; 744
	i32 162, ; 745
	i32 96, ; 746
	i32 50, ; 747
	i32 113, ; 748
	i32 304, ; 749
	i32 130, ; 750
	i32 76, ; 751
	i32 27, ; 752
	i32 253, ; 753
	i32 281, ; 754
	i32 303, ; 755
	i32 7, ; 756
	i32 250, ; 757
	i32 233, ; 758
	i32 242, ; 759
	i32 178, ; 760
	i32 110, ; 761
	i32 304, ; 762
	i32 290 ; 763
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
