; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [232 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [464 x i64] [
	i64 6915655445739883, ; 0: Microsoft.Extensions.Http.Polly.dll => 0x1891c0823b796b => 65
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 69
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 231
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 81
	i64 195258733703605363, ; 4: System.Net.Http.Formatting => 0x2b5b2c8a5b22c73 => 55
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 167
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 105
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 122
	i64 435118502366263740, ; 8: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 123
	i64 502670939551102150, ; 9: System.Management.dll => 0x6f9d88e66daf4c6 => 94
	i64 545109961164950392, ; 10: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 11: System.Reflection.Primitives => 0x7c6829760de3975 => 193
	i64 670564002081277297, ; 12: Microsoft.Identity.Client.dll => 0x94e526837380571 => 70
	i64 750875890346172408, ; 13: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 219
	i64 799765834175365804, ; 14: System.ComponentModel.dll => 0xb1956c9f18442ac => 147
	i64 849051935479314978, ; 15: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 16: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 110
	i64 936039815759675814, ; 17: OpenCvSharp => 0xcfd7b40c9fa41a6 => 87
	i64 1010599046655515943, ; 18: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 193
	i64 1060858978308751610, ; 19: Azure.Core.dll => 0xeb8ed9ebee080fa => 35
	i64 1120440138749646132, ; 20: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 128
	i64 1121665720830085036, ; 21: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 22: System.Drawing.dll => 0x119be62002c19ebb => 159
	i64 1369545283391376210, ; 23: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 118
	i64 1404195534211153682, ; 24: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 165
	i64 1476839205573959279, ; 25: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 176
	i64 1486715745332614827, ; 26: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 78
	i64 1492954217099365037, ; 27: System.Net.HttpListener => 0x14b809f350210aad => 172
	i64 1513467482682125403, ; 28: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 230
	i64 1537168428375924959, ; 29: System.Threading.Thread.dll => 0x15551e8a954ae0df => 219
	i64 1556147632182429976, ; 30: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 31: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 99
	i64 1628611045998245443, ; 32: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 115
	i64 1731380447121279447, ; 33: Newtonsoft.Json => 0x18071957e9b889d7 => 85
	i64 1735388228521408345, ; 34: System.Net.Mail.dll => 0x181556663c69b759 => 173
	i64 1743969030606105336, ; 35: System.Memory.dll => 0x1833d297e88f2af8 => 169
	i64 1767386781656293639, ; 36: System.Private.Uri.dll => 0x188704e9f5582107 => 186
	i64 1769105627832031750, ; 37: Google.Protobuf => 0x188d203205129a06 => 50
	i64 1795316252682057001, ; 38: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 98
	i64 1825687700144851180, ; 39: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 197
	i64 1835311033149317475, ; 40: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 41: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 122
	i64 1865037103900624886, ; 42: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 57
	i64 1875417405349196092, ; 43: System.Drawing.Primitives => 0x1a06d2319b6c713c => 158
	i64 1881198190668717030, ; 44: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 45: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 123
	i64 1920760634179481754, ; 46: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 79
	i64 1930726298510463061, ; 47: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 40
	i64 1959996714666907089, ; 48: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 49: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 206
	i64 1981742497975770890, ; 50: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 114
	i64 1983698669889758782, ; 51: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 52: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 53: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 217
	i64 2102659300918482391, ; 54: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 158
	i64 2133195048986300728, ; 55: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 85
	i64 2165725771938924357, ; 56: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 100
	i64 2262844636196693701, ; 57: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 110
	i64 2287834202362508563, ; 58: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 139
	i64 2302323944321350744, ; 59: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 60: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 113
	i64 2335503487726329082, ; 61: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 213
	i64 2337758774805907496, ; 62: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 196
	i64 2470498323731680442, ; 63: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 106
	i64 2497223385847772520, ; 64: System.Runtime => 0x22a7eb7046413568 => 203
	i64 2547086958574651984, ; 65: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 97
	i64 2602673633151553063, ; 66: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 67: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 75
	i64 2624866290265602282, ; 68: mscorlib.dll => 0x246d65fbde2db8ea => 226
	i64 2632269733008246987, ; 69: System.Net.NameResolution => 0x2487b36034f808cb => 174
	i64 2656907746661064104, ; 70: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 60
	i64 2662981627730767622, ; 71: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2783046991838674048, ; 72: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 196
	i64 2789714023057451704, ; 73: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 73
	i64 2812926542227278819, ; 74: Google.Apis.Core.dll => 0x270985c960b98be3 => 47
	i64 2815524396660695947, ; 75: System.Security.AccessControl => 0x2712c0857f68238b => 204
	i64 2895129759130297543, ; 76: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 77: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 128
	i64 3063847325783385934, ; 78: System.ClientModel.dll => 0x2a84f8e8eb59674e => 91
	i64 3289520064315143713, ; 79: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 112
	i64 3311221304742556517, ; 80: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 182
	i64 3313953730132644392, ; 81: Microsoft.Rest.ClientRuntime => 0x2dfd875c06a31228 => 83
	i64 3325875462027654285, ; 82: System.Runtime.Numerics => 0x2e27e21c8958b48d => 200
	i64 3328853167529574890, ; 83: System.Net.Sockets.dll => 0x2e327651a008c1ea => 180
	i64 3344514922410554693, ; 84: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 132
	i64 3402534845034375023, ; 85: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 93
	i64 3429672777697402584, ; 86: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 81
	i64 3430216265859992823, ; 87: Grpc.Auth.dll => 0x2f9a93850d5a0cf7 => 51
	i64 3494946837667399002, ; 88: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 58
	i64 3522470458906976663, ; 89: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 124
	i64 3531994851595924923, ; 90: System.Numerics => 0x31042a9aade235bb => 183
	i64 3551103847008531295, ; 91: System.Private.CoreLib.dll => 0x31480e226177735f => 228
	i64 3567343442040498961, ; 92: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 93: System.Runtime.dll => 0x319037675df7e556 => 203
	i64 3638003163729360188, ; 94: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 59
	i64 3647754201059316852, ; 95: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 223
	i64 3655542548057982301, ; 96: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 58
	i64 3716579019761409177, ; 97: netstandard.dll => 0x3393f0ed5c8c5c99 => 227
	i64 3727469159507183293, ; 98: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 121
	i64 3869221888984012293, ; 99: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 66
	i64 3869649043256705283, ; 100: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 155
	i64 3890352374528606784, ; 101: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 79
	i64 3919223565570527920, ; 102: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 207
	i64 3933965368022646939, ; 103: System.Net.Requests => 0x369840a8bfadc09b => 177
	i64 3966267475168208030, ; 104: System.Memory => 0x370b03412596249e => 169
	i64 4009997192427317104, ; 105: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 202
	i64 4056584864658557221, ; 106: Google.Apis.Auth => 0x384be27113330925 => 46
	i64 4073500526318903918, ; 107: System.Private.Xml.dll => 0x3887fb25779ae26e => 188
	i64 4073631083018132676, ; 108: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 77
	i64 4120493066591692148, ; 109: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 110: System.ComponentModel => 0x39a7562737acb67e => 147
	i64 4168469861834746866, ; 111: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 205
	i64 4187479170553454871, ; 112: System.Linq.Expressions => 0x3a1cea1e912fa117 => 167
	i64 4202567570116092282, ; 113: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 86
	i64 4205801962323029395, ; 114: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 146
	i64 4282138915307457788, ; 115: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 191
	i64 4356591372459378815, ; 116: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 117: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 166
	i64 4477672992252076438, ; 118: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 221
	i64 4533124835995628778, ; 119: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 191
	i64 4657212095206026001, ; 120: Microsoft.Extensions.Http.dll => 0x40a1bdb9c2686b11 => 64
	i64 4672453897036726049, ; 121: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 165
	i64 4679594760078841447, ; 122: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4725285941539738176, ; 123: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 102
	i64 4783554999938465879, ; 124: CommunityToolkit.Maui.Markup.dll => 0x426299ed96e04057 => 39
	i64 4794310189461587505, ; 125: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 97
	i64 4795410492532947900, ; 126: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 124
	i64 4809057822547766521, ; 127: System.Drawing => 0x42bd349c3145ecf9 => 159
	i64 4814660307502931973, ; 128: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 174
	i64 4853321196694829351, ; 129: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 199
	i64 5081566143765835342, ; 130: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 195
	i64 5099468265966638712, ; 131: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 195
	i64 5103417709280584325, ; 132: System.Collections.Specialized => 0x46d2fb5e161b6285 => 142
	i64 5182934613077526976, ; 133: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 142
	i64 5203618020066742981, ; 134: Xamarin.Essentials => 0x4836f704f0e652c5 => 127
	i64 5290786973231294105, ; 135: System.Runtime.Loader => 0x496ca6b869b72699 => 199
	i64 5423376490970181369, ; 136: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 197
	i64 5446034149219586269, ; 137: System.Diagnostics.Debug => 0x4b94333452e150dd => 151
	i64 5471532531798518949, ; 138: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5507995362134886206, ; 139: System.Core.dll => 0x4c705499688c873e => 149
	i64 5522859530602327440, ; 140: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 141: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 162
	i64 5573260873512690141, ; 142: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 210
	i64 5598400384561465322, ; 143: Polly.Extensions.Http.dll => 0x4db1837cf83247ea => 90
	i64 5650097808083101034, ; 144: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 206
	i64 5665389054145784248, ; 145: Google.Apis.Core => 0x4e9f815406bee9b8 => 47
	i64 5692067934154308417, ; 146: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 126
	i64 5894383691361090976, ; 147: Polly.Core.dll => 0x51cd0ebccd6efda0 => 89
	i64 5979151488806146654, ; 148: System.Formats.Asn1 => 0x52fa3699a489d25e => 160
	i64 5984759512290286505, ; 149: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 208
	i64 6010974535988770325, ; 150: Microsoft.Extensions.Diagnostics.dll => 0x536b457e33877615 => 62
	i64 6068057819846744445, ; 151: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6184471962645441510, ; 152: Google.Cloud.Vision.V1.dll => 0x55d3a87bb8d82be6 => 48
	i64 6200764641006662125, ; 153: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 154: System.Text.Json.dll => 0x565a67a0ffe264a7 => 214
	i64 6278736998281604212, ; 155: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 185
	i64 6284145129771520194, ; 156: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 189
	i64 6357457916754632952, ; 157: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 158: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 113
	i64 6478287442656530074, ; 159: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 160: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 100
	i64 6548213210057960872, ; 161: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 109
	i64 6560151584539558821, ; 162: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 68
	i64 6702948511146257190, ; 163: Microsoft.Rest.ClientRuntime.dll => 0x5d05a8283a9b2b26 => 83
	i64 6743165466166707109, ; 164: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 165: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 166: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 156
	i64 6814185388980153342, ; 167: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 224
	i64 6876862101832370452, ; 168: System.Xml.Linq => 0x5f6f85a57d108914 => 222
	i64 6894844156784520562, ; 169: System.Numerics.Vectors => 0x5faf683aead1ad72 => 182
	i64 6939043805913733614, ; 170: Tesseract.dll => 0x604c6f93ac5cd9ee => 96
	i64 6985504089449394141, ; 171: ZXing.Net.MAUI.Controls.dll => 0x60f17ef564ab6fdd => 135
	i64 6987056692196838363, ; 172: System.Management => 0x60f7030ae3e88bdb => 94
	i64 7083547580668757502, ; 173: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 187
	i64 7220009545223068405, ; 174: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 175: System.Linq => 0x64e71ccf51a90a5a => 168
	i64 7338192458477945005, ; 176: System.Reflection => 0x65d67f295d0740ad => 194
	i64 7348123982286201829, ; 177: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 95
	i64 7377312882064240630, ; 178: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 146
	i64 7488575175965059935, ; 179: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 222
	i64 7489048572193775167, ; 180: System.ObjectModel => 0x67ee71ff6b419e3f => 184
	i64 7496222613193209122, ; 181: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 93
	i64 7592577537120840276, ; 182: System.Diagnostics.Process => 0x695e410af5b2aa54 => 153
	i64 7621211152690795761, ; 183: Google.LongRunning.dll => 0x69c3fb2a1a6154f1 => 49
	i64 7637365915383206639, ; 184: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 127
	i64 7654504624184590948, ; 185: System.Net.Http => 0x6a3a4366801b8264 => 171
	i64 7694700312542370399, ; 186: System.Net.Mail => 0x6ac9112a7e2cda5f => 173
	i64 7708790323521193081, ; 187: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 188: System.Private.CoreLib => 0x6b0ff375198b9c17 => 228
	i64 7735176074855944702, ; 189: Microsoft.CSharp => 0x6b58dda848e391fe => 137
	i64 7735352534559001595, ; 190: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 131
	i64 7740912860115050295, ; 191: Google.Api.CommonProtos => 0x6b6d3f3bb0691f37 => 42
	i64 7791074099216502080, ; 192: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 164
	i64 7836164640616011524, ; 193: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 99
	i64 7843473411302439824, ; 194: Google.LongRunning => 0x6cd99d82d5e73b90 => 49
	i64 7919757340696389605, ; 195: Microsoft.Extensions.Diagnostics.Abstractions => 0x6de8a157378027e5 => 63
	i64 8064050204834738623, ; 196: System.Collections.dll => 0x6fe942efa61731bf => 143
	i64 8083354569033831015, ; 197: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 112
	i64 8085230611270010360, ; 198: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 170
	i64 8087206902342787202, ; 199: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 152
	i64 8113615946733131500, ; 200: System.Reflection.Extensions => 0x70995ab73cf916ec => 192
	i64 8167236081217502503, ; 201: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 229
	i64 8185542183669246576, ; 202: System.Collections => 0x7198e33f4794aa70 => 143
	i64 8234598844743906698, ; 203: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 71
	i64 8246048515196606205, ; 204: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 82
	i64 8264926008854159966, ; 205: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 153
	i64 8320777595162576093, ; 206: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 103
	i64 8368701292315763008, ; 207: System.Security.Cryptography => 0x7423997c6fd56140 => 210
	i64 8400357532724379117, ; 208: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 120
	i64 8410671156615598628, ; 209: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 190
	i64 8518412311883997971, ; 210: System.Collections.Immutable => 0x76377add7c28e313 => 140
	i64 8563666267364444763, ; 211: System.Private.Uri => 0x76d841191140ca5b => 186
	i64 8599632406834268464, ; 212: CommunityToolkit.Maui => 0x7758081c784b4930 => 37
	i64 8614108721271900878, ; 213: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 214: Java.Interop => 0x77b654e585b55834 => 229
	i64 8629545377263870989, ; 215: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 101
	i64 8638972117149407195, ; 216: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 137
	i64 8639588376636138208, ; 217: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 119
	i64 8677882282824630478, ; 218: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8685687024490312494, ; 219: Google.Api.Gax.Grpc => 0x7889c2547cf6f32e => 44
	i64 8725526185868997716, ; 220: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 152
	i64 8816904670177563593, ; 221: Microsoft.Extensions.Diagnostics => 0x7a5bf015646a93c9 => 62
	i64 8941376889969657626, ; 222: System.Xml.XDocument => 0x7c1626e87187471a => 224
	i64 8955323522379913726, ; 223: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 70
	i64 9045785047181495996, ; 224: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9131857290992441898, ; 225: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 101
	i64 9312692141327339315, ; 226: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 126
	i64 9324707631942237306, ; 227: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 98
	i64 9404599086328396064, ; 228: Grpc.Net.Client.dll => 0x8283d90a93913920 => 53
	i64 9427266486299436557, ; 229: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 74
	i64 9575902398040817096, ; 230: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 129
	i64 9659729154652888475, ; 231: System.Text.RegularExpressions => 0x860e407c9991dd9b => 215
	i64 9662334977499516867, ; 232: System.Numerics.dll => 0x8617827802b0cfc3 => 183
	i64 9667360217193089419, ; 233: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 154
	i64 9678050649315576968, ; 234: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 106
	i64 9702891218465930390, ; 235: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 141
	i64 9808709177481450983, ; 236: Mono.Android.dll => 0x881f890734e555e7 => 231
	i64 9956195530459977388, ; 237: Microsoft.Maui => 0x8a2b8315b36616ac => 80
	i64 9959489431142554298, ; 238: System.CodeDom => 0x8a3736deb7825aba => 92
	i64 9991543690424095600, ; 239: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 9994308163963284983, ; 240: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 86
	i64 10038780035334861115, ; 241: System.Net.Http.dll => 0x8b50e941206af13b => 171
	i64 10051358222726253779, ; 242: System.Private.Xml => 0x8b7d990c97ccccd3 => 188
	i64 10051920404523413229, ; 243: Grpc.Net.Common => 0x8b7f9859be1e6eed => 54
	i64 10089571585547156312, ; 244: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 164
	i64 10092835686693276772, ; 245: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 78
	i64 10143853363526200146, ; 246: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 247: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 109
	i64 10236703004850800690, ; 248: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 179
	i64 10245369515835430794, ; 249: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 190
	i64 10258340260528075680, ; 250: CommunityToolkit.Maui.Markup => 0x8e5cf21daddd33a0 => 39
	i64 10364469296367737616, ; 251: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 189
	i64 10406448008575299332, ; 252: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 132
	i64 10430153318873392755, ; 253: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 107
	i64 10447083246144586668, ; 254: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 57
	i64 10506226065143327199, ; 255: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10566960649245365243, ; 256: System.Globalization.dll => 0x92a562b96dcd13fb => 161
	i64 10785150219063592792, ; 257: System.Net.Primitives => 0x95ac8cfb68830758 => 176
	i64 10823124638835005028, ; 258: Google.Api.Gax.dll => 0x963376840189d664 => 43
	i64 10854473764158213966, ; 259: Grpc.Core.Api.dll => 0x96a2d66108728f4e => 52
	i64 10880838204485145808, ; 260: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 37
	i64 10964653383833615866, ; 261: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 157
	i64 11002576679268595294, ; 262: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 67
	i64 11009005086950030778, ; 263: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 80
	i64 11023048688141570732, ; 264: System.Core => 0x98f9bc61168392ac => 149
	i64 11044929383126564683, ; 265: Tesseract => 0x994778c162887f4b => 96
	i64 11103970607964515343, ; 266: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 267: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 125
	i64 11220793807500858938, ; 268: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 269: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 68
	i64 11237162742616054720, ; 270: Polly => 0x9bf26bfa34e25bc0 => 88
	i64 11340910727871153756, ; 271: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 108
	i64 11435314654401632883, ; 272: Grpc.Core.Api => 0x9eb266175e6d9a73 => 52
	i64 11441445377436144712, ; 273: Grpc.Net.Common.dll => 0x9ec82df38f1dd448 => 54
	i64 11485890710487134646, ; 274: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 198
	i64 11517440453979132662, ; 275: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 72
	i64 11518296021396496455, ; 276: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 277: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 125
	i64 11530571088791430846, ; 278: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 66
	i64 11543207250219725293, ; 279: Grpc.Net.Client => 0xa031b5d5e60f71ed => 53
	i64 11597940890313164233, ; 280: netstandard => 0xa0f429ca8d1805c9 => 227
	i64 11705530742807338875, ; 281: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11708980696326071484, ; 282: Google.Cloud.Vision.V1 => 0xa27ea7e80e6be4bc => 48
	i64 11743665907891708234, ; 283: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 218
	i64 12040886584167504988, ; 284: System.Net.ServicePoint => 0xa719d28d8e121c5c => 179
	i64 12102847907131387746, ; 285: System.Buffers => 0xa7f5f40c43256f62 => 138
	i64 12123043025855404482, ; 286: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 192
	i64 12145679461940342714, ; 287: System.Text.Json => 0xa88e1f1ebcb62fba => 214
	i64 12201331334810686224, ; 288: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 202
	i64 12269460666702402136, ; 289: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 140
	i64 12341818387765915815, ; 290: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 38
	i64 12437742355241350664, ; 291: Google.Apis.dll => 0xac9bbcc62bfdb608 => 45
	i64 12439275739440478309, ; 292: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 73
	i64 12451044538927396471, ; 293: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 111
	i64 12466513435562512481, ; 294: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 116
	i64 12475113361194491050, ; 295: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 296: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 156
	i64 12538491095302438457, ; 297: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 104
	i64 12550732019250633519, ; 298: System.IO.Compression => 0xae2d28465e8e1b2f => 163
	i64 12681088699309157496, ; 299: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12699999919562409296, ; 300: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 154
	i64 12700543734426720211, ; 301: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 105
	i64 12708922737231849740, ; 302: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 212
	i64 12760970142902902754, ; 303: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 102
	i64 12823819093633476069, ; 304: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 305: System.IO.Pipes => 0xb21ff0d5d6c0740f => 166
	i64 12843321153144804894, ; 306: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 69
	i64 12859557719246324186, ; 307: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 181
	i64 12930559889093992073, ; 308: Polly.Core => 0xb37293b5c85c9e89 => 89
	i64 12958614573187252691, ; 309: Google.Apis => 0xb3d63f4bf006c1d3 => 45
	i64 13068258254871114833, ; 310: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 201
	i64 13221551921002590604, ; 311: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 312: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 313: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 230
	i64 13356437296799949984, ; 314: Polly.Extensions.Http => 0xb95b98f4bc8a24a0 => 90
	i64 13381594904270902445, ; 315: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13454009404024712428, ; 316: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 130
	i64 13463706743370286408, ; 317: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 185
	i64 13465488254036897740, ; 318: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 131
	i64 13467053111158216594, ; 319: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13468599844293614727, ; 320: Fast_Cash => 0xbaea1432dd009c87 => 136
	i64 13540124433173649601, ; 321: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 322: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 323: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 121
	i64 13702626353344114072, ; 324: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 155
	i64 13710614125866346983, ; 325: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 204
	i64 13717397318615465333, ; 326: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 145
	i64 13742054908850494594, ; 327: Azure.Identity => 0xbeb596218df25c82 => 36
	i64 13755568601956062840, ; 328: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13782512541859110153, ; 329: Google.Apis.Auth.dll => 0xbf45522249e0dd09 => 46
	i64 13814445057219246765, ; 330: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 331: System.Console.dll => 0xc0a5f3cade5c6774 => 148
	i64 13959074834287824816, ; 332: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 111
	i64 14086126540404249975, ; 333: Microsoft.Azure.CognitiveServices.Vision.ComputerVision.dll => 0xc37bf974fdff5577 => 56
	i64 14100563506285742564, ; 334: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 335: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 104
	i64 14125464355221830302, ; 336: System.Threading.dll => 0xc407bafdbc707a9e => 220
	i64 14254574811015963973, ; 337: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 212
	i64 14327695147300244862, ; 338: System.Reflection.dll => 0xc6d632d338eb4d7e => 194
	i64 14327709162229390963, ; 339: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 209
	i64 14461014870687870182, ; 340: System.Net.Requests.dll => 0xc8afd8683afdece6 => 177
	i64 14464374589798375073, ; 341: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 342: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 343: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 213
	i64 14556034074661724008, ; 344: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 38
	i64 14561513370130550166, ; 345: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 208
	i64 14622043554576106986, ; 346: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 201
	i64 14648804764802849406, ; 347: Azure.Identity.dll => 0xcb4b0252261f9a7e => 36
	i64 14650706219563630045, ; 348: Grpc.Auth => 0xcb51c3af15b23ddd => 51
	i64 14669215534098758659, ; 349: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 60
	i64 14690985099581930927, ; 350: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 221
	i64 14705122255218365489, ; 351: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 352: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14792063746108907174, ; 353: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 130
	i64 14832630590065248058, ; 354: System.Security.Claims => 0xcdd816ef5d6e873a => 205
	i64 14852515768018889994, ; 355: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 108
	i64 14892012299694389861, ; 356: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14899131007316230958, ; 357: Emgu.CV.dll => 0xcec458b65117832e => 41
	i64 14904040806490515477, ; 358: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14912225920358050525, ; 359: System.Security.Principal.Windows => 0xcef2de7759506add => 211
	i64 14954917835170835695, ; 360: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 61
	i64 14984936317414011727, ; 361: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 181
	i64 14987728460634540364, ; 362: System.IO.Compression.dll => 0xcfff1ba06622494c => 163
	i64 15015154896917945444, ; 363: System.Net.Security.dll => 0xd0608bd33642dc64 => 178
	i64 15024878362326791334, ; 364: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 170
	i64 15051741671811457419, ; 365: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0xd0e2874d8f44218b => 63
	i64 15076659072870671916, ; 366: System.ObjectModel.dll => 0xd13b0d8c1620662c => 184
	i64 15097078878581906526, ; 367: Google.Api.Gax.Grpc.dll => 0xd183994097ed5c5e => 44
	i64 15111608613780139878, ; 368: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 369: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 162
	i64 15133485256822086103, ; 370: System.Linq.dll => 0xd204f0a9127dd9d7 => 168
	i64 15138356091203993725, ; 371: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 72
	i64 15188909515173929580, ; 372: Fast_Cash.dll => 0xd2c9d8bad17e226c => 136
	i64 15227001540531775957, ; 373: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 59
	i64 15370334346939861994, ; 374: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 107
	i64 15383240894167415497, ; 375: System.Memory.Data => 0xd57c4016df1c7ac9 => 95
	i64 15391712275433856905, ; 376: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 61
	i64 15527772828719725935, ; 377: System.Console => 0xd77dbb1e38cd3d6f => 148
	i64 15530465045505749832, ; 378: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 172
	i64 15536481058354060254, ; 379: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 380: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 209
	i64 15557562860424774966, ; 381: System.Net.Sockets => 0xd7e790fe7a6dc536 => 180
	i64 15582737692548360875, ; 382: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 115
	i64 15609085926864131306, ; 383: System.dll => 0xd89e9cf3334914ea => 225
	i64 15661133872274321916, ; 384: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 223
	i64 15664356999916475676, ; 385: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 386: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15750144475371186037, ; 387: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 103
	i64 15783653065526199428, ; 388: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15816802106201839939, ; 389: Microsoft.Extensions.Http.Polly => 0xdb8091b6eecf9943 => 65
	i64 15817206913877585035, ; 390: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 218
	i64 15847085070278954535, ; 391: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 216
	i64 15928521404965645318, ; 392: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 77
	i64 15963349826457351533, ; 393: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 217
	i64 16018552496348375205, ; 394: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 175
	i64 16154507427712707110, ; 395: System => 0xe03056ea4e39aa26 => 225
	i64 16219561732052121626, ; 396: System.Net.Security => 0xe1177575db7c781a => 178
	i64 16274182383641215830, ; 397: zxing.dll => 0xe1d982a752dac356 => 133
	i64 16288847719894691167, ; 398: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 399: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 67
	i64 16337011941688632206, ; 400: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 211
	i64 16454459195343277943, ; 401: System.Net.NetworkInformation => 0xe459fb756d988f77 => 175
	i64 16558262036769511634, ; 402: Microsoft.Extensions.Http => 0xe5cac397cf7b98d2 => 64
	i64 16648892297579399389, ; 403: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 40
	i64 16649148416072044166, ; 404: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 82
	i64 16677317093839702854, ; 405: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 120
	i64 16833383113903931215, ; 406: mscorlib => 0xe99c30c1484d7f4f => 226
	i64 16856067890322379635, ; 407: System.Data.Common.dll => 0xe9ecc87060889373 => 150
	i64 16877330677009816501, ; 408: Microsoft.Rest.ClientRuntime.Azure.dll => 0xea3852d4aff91bb5 => 84
	i64 16885326587688996227, ; 409: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 134
	i64 16890310621557459193, ; 410: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 215
	i64 16942731696432749159, ; 411: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16945858842201062480, ; 412: Azure.Core => 0xeb2bc8d57f4e7c50 => 35
	i64 16955525858597485057, ; 413: Google.Api.Gax => 0xeb4e20ef25a73a01 => 43
	i64 16991533501433402966, ; 414: Google.Api.CommonProtos.dll => 0xebce0db1ce165656 => 42
	i64 16998075588627545693, ; 415: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 118
	i64 17006954551347072385, ; 416: System.ClientModel => 0xec04d70ec8414d81 => 91
	i64 17008137082415910100, ; 417: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 141
	i64 17031351772568316411, ; 418: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 117
	i64 17040771374769818752, ; 419: zxing => 0xec7cfb478bcccc80 => 133
	i64 17062143951396181894, ; 420: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 145
	i64 17089008752050867324, ; 421: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 422: System.Threading.Channels => 0xed8ff6060fc420b2 => 216
	i64 17137864900836977098, ; 423: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 75
	i64 17197986060146327831, ; 424: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 71
	i64 17201328579425343169, ; 425: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 144
	i64 17202182880784296190, ; 426: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 207
	i64 17230721278011714856, ; 427: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 187
	i64 17260702271250283638, ; 428: System.Data.Common => 0xef8a5543bba6bc76 => 150
	i64 17306917412052548875, ; 429: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 134
	i64 17333249706306540043, ; 430: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 157
	i64 17342750010158924305, ; 431: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17360349973592121190, ; 432: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 129
	i64 17403194674689759865, ; 433: Emgu.CV => 0xf1849159bdda5a79 => 41
	i64 17438153253682247751, ; 434: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 435: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17538742406391395438, ; 436: Microsoft.Rest.ClientRuntime.Azure => 0xf366214b5c09f46e => 84
	i64 17553799493972570483, ; 437: Google.Protobuf.dll => 0xf39b9fa2c0aab173 => 50
	i64 17608862831326185980, ; 438: Microsoft.IO.RecyclableMemoryStream.dll => 0xf45f3f7307c6c9fc => 76
	i64 17623389608345532001, ; 439: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17627500474728259406, ; 440: System.Globalization => 0xf4a176498a351f4e => 161
	i64 17675249797910273188, ; 441: Polly.dll => 0xf54b1a0b30bc9ca4 => 88
	i64 17685921127322830888, ; 442: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 151
	i64 17696650387778805162, ; 443: Microsoft.Azure.CognitiveServices.Vision.ComputerVision => 0xf59721c44dd59daa => 56
	i64 17702523067201099846, ; 444: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 445: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 116
	i64 17710060891934109755, ; 446: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 114
	i64 17712670374920797664, ; 447: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 198
	i64 17727188866493996799, ; 448: System.Net.Http.Formatting.dll => 0xf603a059f5a25eff => 55
	i64 17743407583038752114, ; 449: System.CodeDom.dll => 0xf63d3f302bff4572 => 92
	i64 17777860260071588075, ; 450: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 200
	i64 17790600151040787804, ; 451: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 74
	i64 17838668724098252521, ; 452: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 138
	i64 17958341848870185232, ; 453: Microsoft.IO.RecyclableMemoryStream => 0xf938d8c3a0f06910 => 76
	i64 18025913125965088385, ; 454: System.Threading => 0xfa28e87b91334681 => 220
	i64 18099568558057551825, ; 455: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 456: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 117
	i64 18146411883821974900, ; 457: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 160
	i64 18146811631844267958, ; 458: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 144
	i64 18245806341561545090, ; 459: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 139
	i64 18283932263412303006, ; 460: OpenCvSharp.dll => 0xfdbd938569fe849e => 87
	i64 18305135509493619199, ; 461: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 119
	i64 18324163916253801303, ; 462: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18335459783622540540 ; 463: ZXing.Net.MAUI.Controls => 0xfe74a3871c483cfc => 135
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [464 x i32] [
	i32 65, ; 0
	i32 69, ; 1
	i32 231, ; 2
	i32 81, ; 3
	i32 55, ; 4
	i32 167, ; 5
	i32 105, ; 6
	i32 122, ; 7
	i32 123, ; 8
	i32 94, ; 9
	i32 7, ; 10
	i32 193, ; 11
	i32 70, ; 12
	i32 219, ; 13
	i32 147, ; 14
	i32 10, ; 15
	i32 110, ; 16
	i32 87, ; 17
	i32 193, ; 18
	i32 35, ; 19
	i32 128, ; 20
	i32 18, ; 21
	i32 159, ; 22
	i32 118, ; 23
	i32 165, ; 24
	i32 176, ; 25
	i32 78, ; 26
	i32 172, ; 27
	i32 230, ; 28
	i32 219, ; 29
	i32 16, ; 30
	i32 99, ; 31
	i32 115, ; 32
	i32 85, ; 33
	i32 173, ; 34
	i32 169, ; 35
	i32 186, ; 36
	i32 50, ; 37
	i32 98, ; 38
	i32 197, ; 39
	i32 6, ; 40
	i32 122, ; 41
	i32 57, ; 42
	i32 158, ; 43
	i32 28, ; 44
	i32 123, ; 45
	i32 79, ; 46
	i32 40, ; 47
	i32 28, ; 48
	i32 206, ; 49
	i32 114, ; 50
	i32 2, ; 51
	i32 20, ; 52
	i32 217, ; 53
	i32 158, ; 54
	i32 85, ; 55
	i32 100, ; 56
	i32 110, ; 57
	i32 139, ; 58
	i32 24, ; 59
	i32 113, ; 60
	i32 213, ; 61
	i32 196, ; 62
	i32 106, ; 63
	i32 203, ; 64
	i32 97, ; 65
	i32 27, ; 66
	i32 75, ; 67
	i32 226, ; 68
	i32 174, ; 69
	i32 60, ; 70
	i32 2, ; 71
	i32 196, ; 72
	i32 73, ; 73
	i32 47, ; 74
	i32 204, ; 75
	i32 7, ; 76
	i32 128, ; 77
	i32 91, ; 78
	i32 112, ; 79
	i32 182, ; 80
	i32 83, ; 81
	i32 200, ; 82
	i32 180, ; 83
	i32 132, ; 84
	i32 93, ; 85
	i32 81, ; 86
	i32 51, ; 87
	i32 58, ; 88
	i32 124, ; 89
	i32 183, ; 90
	i32 228, ; 91
	i32 22, ; 92
	i32 203, ; 93
	i32 59, ; 94
	i32 223, ; 95
	i32 58, ; 96
	i32 227, ; 97
	i32 121, ; 98
	i32 66, ; 99
	i32 155, ; 100
	i32 79, ; 101
	i32 207, ; 102
	i32 177, ; 103
	i32 169, ; 104
	i32 202, ; 105
	i32 46, ; 106
	i32 188, ; 107
	i32 77, ; 108
	i32 33, ; 109
	i32 147, ; 110
	i32 205, ; 111
	i32 167, ; 112
	i32 86, ; 113
	i32 146, ; 114
	i32 191, ; 115
	i32 30, ; 116
	i32 166, ; 117
	i32 221, ; 118
	i32 191, ; 119
	i32 64, ; 120
	i32 165, ; 121
	i32 0, ; 122
	i32 102, ; 123
	i32 39, ; 124
	i32 97, ; 125
	i32 124, ; 126
	i32 159, ; 127
	i32 174, ; 128
	i32 199, ; 129
	i32 195, ; 130
	i32 195, ; 131
	i32 142, ; 132
	i32 142, ; 133
	i32 127, ; 134
	i32 199, ; 135
	i32 197, ; 136
	i32 151, ; 137
	i32 26, ; 138
	i32 149, ; 139
	i32 29, ; 140
	i32 162, ; 141
	i32 210, ; 142
	i32 90, ; 143
	i32 206, ; 144
	i32 47, ; 145
	i32 126, ; 146
	i32 89, ; 147
	i32 160, ; 148
	i32 208, ; 149
	i32 62, ; 150
	i32 23, ; 151
	i32 48, ; 152
	i32 23, ; 153
	i32 214, ; 154
	i32 185, ; 155
	i32 189, ; 156
	i32 34, ; 157
	i32 113, ; 158
	i32 11, ; 159
	i32 100, ; 160
	i32 109, ; 161
	i32 68, ; 162
	i32 83, ; 163
	i32 19, ; 164
	i32 22, ; 165
	i32 156, ; 166
	i32 224, ; 167
	i32 222, ; 168
	i32 182, ; 169
	i32 96, ; 170
	i32 135, ; 171
	i32 94, ; 172
	i32 187, ; 173
	i32 26, ; 174
	i32 168, ; 175
	i32 194, ; 176
	i32 95, ; 177
	i32 146, ; 178
	i32 222, ; 179
	i32 184, ; 180
	i32 93, ; 181
	i32 153, ; 182
	i32 49, ; 183
	i32 127, ; 184
	i32 171, ; 185
	i32 173, ; 186
	i32 17, ; 187
	i32 228, ; 188
	i32 137, ; 189
	i32 131, ; 190
	i32 42, ; 191
	i32 164, ; 192
	i32 99, ; 193
	i32 49, ; 194
	i32 63, ; 195
	i32 143, ; 196
	i32 112, ; 197
	i32 170, ; 198
	i32 152, ; 199
	i32 192, ; 200
	i32 229, ; 201
	i32 143, ; 202
	i32 71, ; 203
	i32 82, ; 204
	i32 153, ; 205
	i32 103, ; 206
	i32 210, ; 207
	i32 120, ; 208
	i32 190, ; 209
	i32 140, ; 210
	i32 186, ; 211
	i32 37, ; 212
	i32 21, ; 213
	i32 229, ; 214
	i32 101, ; 215
	i32 137, ; 216
	i32 119, ; 217
	i32 21, ; 218
	i32 44, ; 219
	i32 152, ; 220
	i32 62, ; 221
	i32 224, ; 222
	i32 70, ; 223
	i32 31, ; 224
	i32 101, ; 225
	i32 126, ; 226
	i32 98, ; 227
	i32 53, ; 228
	i32 74, ; 229
	i32 129, ; 230
	i32 215, ; 231
	i32 183, ; 232
	i32 154, ; 233
	i32 106, ; 234
	i32 141, ; 235
	i32 231, ; 236
	i32 80, ; 237
	i32 92, ; 238
	i32 6, ; 239
	i32 86, ; 240
	i32 171, ; 241
	i32 188, ; 242
	i32 54, ; 243
	i32 164, ; 244
	i32 78, ; 245
	i32 3, ; 246
	i32 109, ; 247
	i32 179, ; 248
	i32 190, ; 249
	i32 39, ; 250
	i32 189, ; 251
	i32 132, ; 252
	i32 107, ; 253
	i32 57, ; 254
	i32 1, ; 255
	i32 161, ; 256
	i32 176, ; 257
	i32 43, ; 258
	i32 52, ; 259
	i32 37, ; 260
	i32 157, ; 261
	i32 67, ; 262
	i32 80, ; 263
	i32 149, ; 264
	i32 96, ; 265
	i32 12, ; 266
	i32 125, ; 267
	i32 15, ; 268
	i32 68, ; 269
	i32 88, ; 270
	i32 108, ; 271
	i32 52, ; 272
	i32 54, ; 273
	i32 198, ; 274
	i32 72, ; 275
	i32 13, ; 276
	i32 125, ; 277
	i32 66, ; 278
	i32 53, ; 279
	i32 227, ; 280
	i32 9, ; 281
	i32 48, ; 282
	i32 218, ; 283
	i32 179, ; 284
	i32 138, ; 285
	i32 192, ; 286
	i32 214, ; 287
	i32 202, ; 288
	i32 140, ; 289
	i32 38, ; 290
	i32 45, ; 291
	i32 73, ; 292
	i32 111, ; 293
	i32 116, ; 294
	i32 34, ; 295
	i32 156, ; 296
	i32 104, ; 297
	i32 163, ; 298
	i32 14, ; 299
	i32 154, ; 300
	i32 105, ; 301
	i32 212, ; 302
	i32 102, ; 303
	i32 27, ; 304
	i32 166, ; 305
	i32 69, ; 306
	i32 181, ; 307
	i32 89, ; 308
	i32 45, ; 309
	i32 201, ; 310
	i32 1, ; 311
	i32 15, ; 312
	i32 230, ; 313
	i32 90, ; 314
	i32 9, ; 315
	i32 130, ; 316
	i32 185, ; 317
	i32 131, ; 318
	i32 29, ; 319
	i32 136, ; 320
	i32 30, ; 321
	i32 13, ; 322
	i32 121, ; 323
	i32 155, ; 324
	i32 204, ; 325
	i32 145, ; 326
	i32 36, ; 327
	i32 8, ; 328
	i32 46, ; 329
	i32 11, ; 330
	i32 148, ; 331
	i32 111, ; 332
	i32 56, ; 333
	i32 3, ; 334
	i32 104, ; 335
	i32 220, ; 336
	i32 212, ; 337
	i32 194, ; 338
	i32 209, ; 339
	i32 177, ; 340
	i32 24, ; 341
	i32 5, ; 342
	i32 213, ; 343
	i32 38, ; 344
	i32 208, ; 345
	i32 201, ; 346
	i32 36, ; 347
	i32 51, ; 348
	i32 60, ; 349
	i32 221, ; 350
	i32 16, ; 351
	i32 32, ; 352
	i32 130, ; 353
	i32 205, ; 354
	i32 108, ; 355
	i32 33, ; 356
	i32 41, ; 357
	i32 0, ; 358
	i32 211, ; 359
	i32 61, ; 360
	i32 181, ; 361
	i32 163, ; 362
	i32 178, ; 363
	i32 170, ; 364
	i32 63, ; 365
	i32 184, ; 366
	i32 44, ; 367
	i32 17, ; 368
	i32 162, ; 369
	i32 168, ; 370
	i32 72, ; 371
	i32 136, ; 372
	i32 59, ; 373
	i32 107, ; 374
	i32 95, ; 375
	i32 61, ; 376
	i32 148, ; 377
	i32 172, ; 378
	i32 4, ; 379
	i32 209, ; 380
	i32 180, ; 381
	i32 115, ; 382
	i32 225, ; 383
	i32 223, ; 384
	i32 4, ; 385
	i32 12, ; 386
	i32 103, ; 387
	i32 5, ; 388
	i32 65, ; 389
	i32 218, ; 390
	i32 216, ; 391
	i32 77, ; 392
	i32 217, ; 393
	i32 175, ; 394
	i32 225, ; 395
	i32 178, ; 396
	i32 133, ; 397
	i32 18, ; 398
	i32 67, ; 399
	i32 211, ; 400
	i32 175, ; 401
	i32 64, ; 402
	i32 40, ; 403
	i32 82, ; 404
	i32 120, ; 405
	i32 226, ; 406
	i32 150, ; 407
	i32 84, ; 408
	i32 134, ; 409
	i32 215, ; 410
	i32 25, ; 411
	i32 35, ; 412
	i32 43, ; 413
	i32 42, ; 414
	i32 118, ; 415
	i32 91, ; 416
	i32 141, ; 417
	i32 117, ; 418
	i32 133, ; 419
	i32 145, ; 420
	i32 32, ; 421
	i32 216, ; 422
	i32 75, ; 423
	i32 71, ; 424
	i32 144, ; 425
	i32 207, ; 426
	i32 187, ; 427
	i32 150, ; 428
	i32 134, ; 429
	i32 157, ; 430
	i32 10, ; 431
	i32 129, ; 432
	i32 41, ; 433
	i32 25, ; 434
	i32 8, ; 435
	i32 84, ; 436
	i32 50, ; 437
	i32 76, ; 438
	i32 20, ; 439
	i32 161, ; 440
	i32 88, ; 441
	i32 151, ; 442
	i32 56, ; 443
	i32 31, ; 444
	i32 116, ; 445
	i32 114, ; 446
	i32 198, ; 447
	i32 55, ; 448
	i32 92, ; 449
	i32 200, ; 450
	i32 74, ; 451
	i32 138, ; 452
	i32 76, ; 453
	i32 220, ; 454
	i32 19, ; 455
	i32 117, ; 456
	i32 160, ; 457
	i32 144, ; 458
	i32 139, ; 459
	i32 87, ; 460
	i32 119, ; 461
	i32 14, ; 462
	i32 135 ; 463
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
