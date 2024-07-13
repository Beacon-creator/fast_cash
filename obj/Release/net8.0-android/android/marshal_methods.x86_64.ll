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

@assembly_image_cache = dso_local local_unnamed_addr global [190 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [380 x i64] [
	i64 6915655445739883, ; 0: Microsoft.Extensions.Http.Polly.dll => 0x1891c0823b796b => 49
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 53
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 189
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 63
	i64 195258733703605363, ; 4: System.Net.Http.Formatting => 0x2b5b2c8a5b22c73 => 40
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 139
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 82
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 99
	i64 435118502366263740, ; 8: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 100
	i64 545109961164950392, ; 9: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 10: System.Reflection.Primitives => 0x7c6829760de3975 => 158
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 178
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 123
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 87
	i64 936039815759675814, ; 15: OpenCvSharp => 0xcfd7b40c9fa41a6 => 69
	i64 1010599046655515943, ; 16: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 158
	i64 1120440138749646132, ; 17: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 104
	i64 1121665720830085036, ; 18: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 19: System.Drawing.dll => 0x119be62002c19ebb => 133
	i64 1369545283391376210, ; 20: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 95
	i64 1476839205573959279, ; 21: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 145
	i64 1486715745332614827, ; 22: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 60
	i64 1513467482682125403, ; 23: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 188
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 178
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 77
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 92
	i64 1731380447121279447, ; 28: Newtonsoft.Json => 0x18071957e9b889d7 => 67
	i64 1735388228521408345, ; 29: System.Net.Mail.dll => 0x181556663c69b759 => 144
	i64 1743969030606105336, ; 30: System.Memory.dll => 0x1833d297e88f2af8 => 141
	i64 1767386781656293639, ; 31: System.Private.Uri.dll => 0x188704e9f5582107 => 151
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 76
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 162
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 99
	i64 1875417405349196092, ; 36: System.Drawing.Primitives => 0x1a06d2319b6c713c => 132
	i64 1881198190668717030, ; 37: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 38: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 100
	i64 1920760634179481754, ; 39: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 61
	i64 1930726298510463061, ; 40: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 38
	i64 1959996714666907089, ; 41: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 42: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 170
	i64 1981742497975770890, ; 43: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 91
	i64 1983698669889758782, ; 44: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 45: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 46: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 176
	i64 2102659300918482391, ; 47: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 132
	i64 2133195048986300728, ; 48: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 67
	i64 2262844636196693701, ; 49: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 87
	i64 2287834202362508563, ; 50: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 115
	i64 2302323944321350744, ; 51: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 52: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 90
	i64 2335503487726329082, ; 53: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 173
	i64 2337758774805907496, ; 54: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 161
	i64 2470498323731680442, ; 55: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 83
	i64 2497223385847772520, ; 56: System.Runtime => 0x22a7eb7046413568 => 168
	i64 2547086958574651984, ; 57: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 75
	i64 2602673633151553063, ; 58: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 59: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 57
	i64 2656907746661064104, ; 60: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 44
	i64 2662981627730767622, ; 61: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2783046991838674048, ; 62: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 161
	i64 2789714023057451704, ; 63: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 55
	i64 2895129759130297543, ; 64: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 65: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 104
	i64 3289520064315143713, ; 66: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 89
	i64 3311221304742556517, ; 67: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 148
	i64 3313953730132644392, ; 68: Microsoft.Rest.ClientRuntime => 0x2dfd875c06a31228 => 65
	i64 3325875462027654285, ; 69: System.Runtime.Numerics => 0x2e27e21c8958b48d => 165
	i64 3328853167529574890, ; 70: System.Net.Sockets.dll => 0x2e327651a008c1ea => 147
	i64 3344514922410554693, ; 71: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 108
	i64 3402534845034375023, ; 72: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 73
	i64 3429672777697402584, ; 73: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 63
	i64 3494946837667399002, ; 74: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 42
	i64 3522470458906976663, ; 75: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 101
	i64 3551103847008531295, ; 76: System.Private.CoreLib.dll => 0x31480e226177735f => 186
	i64 3567343442040498961, ; 77: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 78: System.Runtime.dll => 0x319037675df7e556 => 168
	i64 3638003163729360188, ; 79: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 43
	i64 3647754201059316852, ; 80: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 182
	i64 3655542548057982301, ; 81: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 42
	i64 3716579019761409177, ; 82: netstandard.dll => 0x3393f0ed5c8c5c99 => 185
	i64 3727469159507183293, ; 83: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 98
	i64 3869221888984012293, ; 84: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 50
	i64 3869649043256705283, ; 85: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 129
	i64 3890352374528606784, ; 86: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 61
	i64 3933965368022646939, ; 87: System.Net.Requests => 0x369840a8bfadc09b => 146
	i64 3966267475168208030, ; 88: System.Memory => 0x370b03412596249e => 141
	i64 4009997192427317104, ; 89: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 167
	i64 4073500526318903918, ; 90: System.Private.Xml.dll => 0x3887fb25779ae26e => 153
	i64 4073631083018132676, ; 91: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 59
	i64 4120493066591692148, ; 92: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 93: System.ComponentModel => 0x39a7562737acb67e => 123
	i64 4168469861834746866, ; 94: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 169
	i64 4187479170553454871, ; 95: System.Linq.Expressions => 0x3a1cea1e912fa117 => 139
	i64 4202567570116092282, ; 96: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 68
	i64 4205801962323029395, ; 97: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 122
	i64 4282138915307457788, ; 98: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 156
	i64 4356591372459378815, ; 99: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 100: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 138
	i64 4477672992252076438, ; 101: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 180
	i64 4533124835995628778, ; 102: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 156
	i64 4657212095206026001, ; 103: Microsoft.Extensions.Http.dll => 0x40a1bdb9c2686b11 => 48
	i64 4679594760078841447, ; 104: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4725285941539738176, ; 105: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 79
	i64 4783554999938465879, ; 106: CommunityToolkit.Maui.Markup.dll => 0x426299ed96e04057 => 37
	i64 4794310189461587505, ; 107: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 75
	i64 4795410492532947900, ; 108: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 101
	i64 4809057822547766521, ; 109: System.Drawing => 0x42bd349c3145ecf9 => 133
	i64 4853321196694829351, ; 110: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 164
	i64 5081566143765835342, ; 111: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 160
	i64 5099468265966638712, ; 112: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 160
	i64 5103417709280584325, ; 113: System.Collections.Specialized => 0x46d2fb5e161b6285 => 118
	i64 5182934613077526976, ; 114: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 118
	i64 5290786973231294105, ; 115: System.Runtime.Loader => 0x496ca6b869b72699 => 164
	i64 5423376490970181369, ; 116: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 162
	i64 5446034149219586269, ; 117: System.Diagnostics.Debug => 0x4b94333452e150dd => 126
	i64 5471532531798518949, ; 118: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 119: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 120: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 136
	i64 5573260873512690141, ; 121: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 171
	i64 5598400384561465322, ; 122: Polly.Extensions.Http.dll => 0x4db1837cf83247ea => 72
	i64 5650097808083101034, ; 123: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 170
	i64 5692067934154308417, ; 124: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 103
	i64 5894383691361090976, ; 125: Polly.Core.dll => 0x51cd0ebccd6efda0 => 71
	i64 5979151488806146654, ; 126: System.Formats.Asn1 => 0x52fa3699a489d25e => 134
	i64 6010974535988770325, ; 127: Microsoft.Extensions.Diagnostics.dll => 0x536b457e33877615 => 46
	i64 6068057819846744445, ; 128: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 129: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 130: System.Text.Json.dll => 0x565a67a0ffe264a7 => 174
	i64 6278736998281604212, ; 131: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 150
	i64 6284145129771520194, ; 132: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 154
	i64 6357457916754632952, ; 133: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 134: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 90
	i64 6478287442656530074, ; 135: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 136: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 86
	i64 6560151584539558821, ; 137: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 52
	i64 6702948511146257190, ; 138: Microsoft.Rest.ClientRuntime.dll => 0x5d05a8283a9b2b26 => 65
	i64 6743165466166707109, ; 139: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 140: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 141: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 130
	i64 6814185388980153342, ; 142: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 183
	i64 6876862101832370452, ; 143: System.Xml.Linq => 0x5f6f85a57d108914 => 181
	i64 6894844156784520562, ; 144: System.Numerics.Vectors => 0x5faf683aead1ad72 => 148
	i64 6939043805913733614, ; 145: Tesseract.dll => 0x604c6f93ac5cd9ee => 74
	i64 6985504089449394141, ; 146: ZXing.Net.MAUI.Controls.dll => 0x60f17ef564ab6fdd => 111
	i64 7083547580668757502, ; 147: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 152
	i64 7220009545223068405, ; 148: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 149: System.Linq => 0x64e71ccf51a90a5a => 140
	i64 7338192458477945005, ; 150: System.Reflection => 0x65d67f295d0740ad => 159
	i64 7377312882064240630, ; 151: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 122
	i64 7488575175965059935, ; 152: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 181
	i64 7489048572193775167, ; 153: System.ObjectModel => 0x67ee71ff6b419e3f => 149
	i64 7496222613193209122, ; 154: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 73
	i64 7592577537120840276, ; 155: System.Diagnostics.Process => 0x695e410af5b2aa54 => 128
	i64 7654504624184590948, ; 156: System.Net.Http => 0x6a3a4366801b8264 => 143
	i64 7694700312542370399, ; 157: System.Net.Mail => 0x6ac9112a7e2cda5f => 144
	i64 7708790323521193081, ; 158: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 159: System.Private.CoreLib => 0x6b0ff375198b9c17 => 186
	i64 7735176074855944702, ; 160: Microsoft.CSharp => 0x6b58dda848e391fe => 113
	i64 7735352534559001595, ; 161: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 107
	i64 7836164640616011524, ; 162: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 77
	i64 7919757340696389605, ; 163: Microsoft.Extensions.Diagnostics.Abstractions => 0x6de8a157378027e5 => 47
	i64 8064050204834738623, ; 164: System.Collections.dll => 0x6fe942efa61731bf => 119
	i64 8083354569033831015, ; 165: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 89
	i64 8085230611270010360, ; 166: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 142
	i64 8087206902342787202, ; 167: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 127
	i64 8113615946733131500, ; 168: System.Reflection.Extensions => 0x70995ab73cf916ec => 157
	i64 8167236081217502503, ; 169: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 187
	i64 8185542183669246576, ; 170: System.Collections => 0x7198e33f4794aa70 => 119
	i64 8246048515196606205, ; 171: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 64
	i64 8264926008854159966, ; 172: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 128
	i64 8320777595162576093, ; 173: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 80
	i64 8368701292315763008, ; 174: System.Security.Cryptography => 0x7423997c6fd56140 => 171
	i64 8400357532724379117, ; 175: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 97
	i64 8410671156615598628, ; 176: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 155
	i64 8518412311883997971, ; 177: System.Collections.Immutable => 0x76377add7c28e313 => 116
	i64 8563666267364444763, ; 178: System.Private.Uri => 0x76d841191140ca5b => 151
	i64 8599632406834268464, ; 179: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 180: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 181: Java.Interop => 0x77b654e585b55834 => 187
	i64 8629545377263870989, ; 182: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 78
	i64 8638972117149407195, ; 183: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 113
	i64 8639588376636138208, ; 184: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 96
	i64 8677882282824630478, ; 185: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 186: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 127
	i64 8816904670177563593, ; 187: Microsoft.Extensions.Diagnostics => 0x7a5bf015646a93c9 => 46
	i64 8941376889969657626, ; 188: System.Xml.XDocument => 0x7c1626e87187471a => 183
	i64 9045785047181495996, ; 189: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9131857290992441898, ; 190: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 78
	i64 9312692141327339315, ; 191: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 103
	i64 9324707631942237306, ; 192: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 76
	i64 9427266486299436557, ; 193: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 56
	i64 9575902398040817096, ; 194: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 105
	i64 9659729154652888475, ; 195: System.Text.RegularExpressions => 0x860e407c9991dd9b => 175
	i64 9678050649315576968, ; 196: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 83
	i64 9702891218465930390, ; 197: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 117
	i64 9808709177481450983, ; 198: Mono.Android.dll => 0x881f890734e555e7 => 189
	i64 9956195530459977388, ; 199: Microsoft.Maui => 0x8a2b8315b36616ac => 62
	i64 9991543690424095600, ; 200: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 9994308163963284983, ; 201: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 68
	i64 10038780035334861115, ; 202: System.Net.Http.dll => 0x8b50e941206af13b => 143
	i64 10051358222726253779, ; 203: System.Private.Xml => 0x8b7d990c97ccccd3 => 153
	i64 10092835686693276772, ; 204: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 60
	i64 10143853363526200146, ; 205: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 206: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 86
	i64 10245369515835430794, ; 207: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 155
	i64 10258340260528075680, ; 208: CommunityToolkit.Maui.Markup => 0x8e5cf21daddd33a0 => 37
	i64 10364469296367737616, ; 209: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 154
	i64 10406448008575299332, ; 210: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 108
	i64 10430153318873392755, ; 211: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 84
	i64 10506226065143327199, ; 212: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10566960649245365243, ; 213: System.Globalization.dll => 0x92a562b96dcd13fb => 135
	i64 10785150219063592792, ; 214: System.Net.Primitives => 0x95ac8cfb68830758 => 145
	i64 10880838204485145808, ; 215: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 10964653383833615866, ; 216: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 131
	i64 11002576679268595294, ; 217: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 51
	i64 11009005086950030778, ; 218: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 62
	i64 11044929383126564683, ; 219: Tesseract => 0x994778c162887f4b => 74
	i64 11103970607964515343, ; 220: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 221: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 102
	i64 11220793807500858938, ; 222: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 223: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 52
	i64 11237162742616054720, ; 224: Polly => 0x9bf26bfa34e25bc0 => 70
	i64 11340910727871153756, ; 225: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 85
	i64 11485890710487134646, ; 226: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 163
	i64 11517440453979132662, ; 227: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 54
	i64 11518296021396496455, ; 228: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 229: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 102
	i64 11530571088791430846, ; 230: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 50
	i64 11597940890313164233, ; 231: netstandard => 0xa0f429ca8d1805c9 => 185
	i64 11705530742807338875, ; 232: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11743665907891708234, ; 233: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 177
	i64 12102847907131387746, ; 234: System.Buffers => 0xa7f5f40c43256f62 => 114
	i64 12123043025855404482, ; 235: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 157
	i64 12145679461940342714, ; 236: System.Text.Json => 0xa88e1f1ebcb62fba => 174
	i64 12201331334810686224, ; 237: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 167
	i64 12269460666702402136, ; 238: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 116
	i64 12341818387765915815, ; 239: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12439275739440478309, ; 240: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 55
	i64 12451044538927396471, ; 241: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 88
	i64 12466513435562512481, ; 242: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 93
	i64 12475113361194491050, ; 243: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 244: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 130
	i64 12538491095302438457, ; 245: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 81
	i64 12550732019250633519, ; 246: System.IO.Compression => 0xae2d28465e8e1b2f => 137
	i64 12681088699309157496, ; 247: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 248: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 82
	i64 12708922737231849740, ; 249: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 172
	i64 12760970142902902754, ; 250: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 79
	i64 12823819093633476069, ; 251: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 252: System.IO.Pipes => 0xb21ff0d5d6c0740f => 138
	i64 12843321153144804894, ; 253: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 53
	i64 12930559889093992073, ; 254: Polly.Core => 0xb37293b5c85c9e89 => 71
	i64 13068258254871114833, ; 255: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 166
	i64 13221551921002590604, ; 256: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 257: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 258: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 188
	i64 13356437296799949984, ; 259: Polly.Extensions.Http => 0xb95b98f4bc8a24a0 => 72
	i64 13381594904270902445, ; 260: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13454009404024712428, ; 261: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 106
	i64 13463706743370286408, ; 262: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 150
	i64 13465488254036897740, ; 263: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 107
	i64 13467053111158216594, ; 264: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13468599844293614727, ; 265: Fast_Cash => 0xbaea1432dd009c87 => 112
	i64 13540124433173649601, ; 266: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 267: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 268: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 98
	i64 13702626353344114072, ; 269: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 129
	i64 13717397318615465333, ; 270: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 121
	i64 13755568601956062840, ; 271: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 272: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 273: System.Console.dll => 0xc0a5f3cade5c6774 => 124
	i64 13959074834287824816, ; 274: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 88
	i64 14086126540404249975, ; 275: Microsoft.Azure.CognitiveServices.Vision.ComputerVision.dll => 0xc37bf974fdff5577 => 41
	i64 14100563506285742564, ; 276: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 277: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 81
	i64 14125464355221830302, ; 278: System.Threading.dll => 0xc407bafdbc707a9e => 179
	i64 14254574811015963973, ; 279: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 172
	i64 14327695147300244862, ; 280: System.Reflection.dll => 0xc6d632d338eb4d7e => 159
	i64 14461014870687870182, ; 281: System.Net.Requests.dll => 0xc8afd8683afdece6 => 146
	i64 14464374589798375073, ; 282: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 283: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 284: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 173
	i64 14556034074661724008, ; 285: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14622043554576106986, ; 286: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 166
	i64 14669215534098758659, ; 287: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 44
	i64 14690985099581930927, ; 288: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 180
	i64 14705122255218365489, ; 289: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 290: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14792063746108907174, ; 291: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 106
	i64 14832630590065248058, ; 292: System.Security.Claims => 0xcdd816ef5d6e873a => 169
	i64 14852515768018889994, ; 293: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 85
	i64 14892012299694389861, ; 294: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14899131007316230958, ; 295: Emgu.CV.dll => 0xcec458b65117832e => 39
	i64 14904040806490515477, ; 296: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 297: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 45
	i64 14987728460634540364, ; 298: System.IO.Compression.dll => 0xcfff1ba06622494c => 137
	i64 15024878362326791334, ; 299: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 142
	i64 15051741671811457419, ; 300: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0xd0e2874d8f44218b => 47
	i64 15076659072870671916, ; 301: System.ObjectModel.dll => 0xd13b0d8c1620662c => 149
	i64 15111608613780139878, ; 302: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 303: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 136
	i64 15133485256822086103, ; 304: System.Linq.dll => 0xd204f0a9127dd9d7 => 140
	i64 15138356091203993725, ; 305: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 54
	i64 15188909515173929580, ; 306: Fast_Cash.dll => 0xd2c9d8bad17e226c => 112
	i64 15227001540531775957, ; 307: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 43
	i64 15370334346939861994, ; 308: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 84
	i64 15391712275433856905, ; 309: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 45
	i64 15527772828719725935, ; 310: System.Console => 0xd77dbb1e38cd3d6f => 124
	i64 15536481058354060254, ; 311: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15557562860424774966, ; 312: System.Net.Sockets => 0xd7e790fe7a6dc536 => 147
	i64 15582737692548360875, ; 313: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 92
	i64 15609085926864131306, ; 314: System.dll => 0xd89e9cf3334914ea => 184
	i64 15661133872274321916, ; 315: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 182
	i64 15664356999916475676, ; 316: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 317: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15750144475371186037, ; 318: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 80
	i64 15783653065526199428, ; 319: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15816802106201839939, ; 320: Microsoft.Extensions.Http.Polly => 0xdb8091b6eecf9943 => 49
	i64 15817206913877585035, ; 321: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 177
	i64 15928521404965645318, ; 322: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 59
	i64 15963349826457351533, ; 323: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 176
	i64 16154507427712707110, ; 324: System => 0xe03056ea4e39aa26 => 184
	i64 16274182383641215830, ; 325: zxing.dll => 0xe1d982a752dac356 => 109
	i64 16288847719894691167, ; 326: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 327: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 51
	i64 16558262036769511634, ; 328: Microsoft.Extensions.Http => 0xe5cac397cf7b98d2 => 48
	i64 16648892297579399389, ; 329: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 38
	i64 16649148416072044166, ; 330: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 64
	i64 16677317093839702854, ; 331: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 97
	i64 16856067890322379635, ; 332: System.Data.Common.dll => 0xe9ecc87060889373 => 125
	i64 16877330677009816501, ; 333: Microsoft.Rest.ClientRuntime.Azure.dll => 0xea3852d4aff91bb5 => 66
	i64 16885326587688996227, ; 334: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 110
	i64 16890310621557459193, ; 335: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 175
	i64 16942731696432749159, ; 336: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 337: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 95
	i64 17008137082415910100, ; 338: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 117
	i64 17031351772568316411, ; 339: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 94
	i64 17040771374769818752, ; 340: zxing => 0xec7cfb478bcccc80 => 109
	i64 17062143951396181894, ; 341: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 121
	i64 17089008752050867324, ; 342: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17137864900836977098, ; 343: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 57
	i64 17201328579425343169, ; 344: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 120
	i64 17230721278011714856, ; 345: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 152
	i64 17260702271250283638, ; 346: System.Data.Common => 0xef8a5543bba6bc76 => 125
	i64 17306917412052548875, ; 347: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 110
	i64 17333249706306540043, ; 348: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 131
	i64 17342750010158924305, ; 349: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17360349973592121190, ; 350: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 105
	i64 17403194674689759865, ; 351: Emgu.CV => 0xf1849159bdda5a79 => 39
	i64 17438153253682247751, ; 352: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 353: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17538742406391395438, ; 354: Microsoft.Rest.ClientRuntime.Azure => 0xf366214b5c09f46e => 66
	i64 17608862831326185980, ; 355: Microsoft.IO.RecyclableMemoryStream.dll => 0xf45f3f7307c6c9fc => 58
	i64 17623389608345532001, ; 356: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17627500474728259406, ; 357: System.Globalization => 0xf4a176498a351f4e => 135
	i64 17675249797910273188, ; 358: Polly.dll => 0xf54b1a0b30bc9ca4 => 70
	i64 17685921127322830888, ; 359: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 126
	i64 17696650387778805162, ; 360: Microsoft.Azure.CognitiveServices.Vision.ComputerVision => 0xf59721c44dd59daa => 41
	i64 17702523067201099846, ; 361: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 362: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 93
	i64 17710060891934109755, ; 363: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 91
	i64 17712670374920797664, ; 364: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 163
	i64 17727188866493996799, ; 365: System.Net.Http.Formatting.dll => 0xf603a059f5a25eff => 40
	i64 17777860260071588075, ; 366: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 165
	i64 17790600151040787804, ; 367: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 56
	i64 17838668724098252521, ; 368: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 114
	i64 17958341848870185232, ; 369: Microsoft.IO.RecyclableMemoryStream => 0xf938d8c3a0f06910 => 58
	i64 18025913125965088385, ; 370: System.Threading => 0xfa28e87b91334681 => 179
	i64 18099568558057551825, ; 371: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 372: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 94
	i64 18146411883821974900, ; 373: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 134
	i64 18146811631844267958, ; 374: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 120
	i64 18245806341561545090, ; 375: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 115
	i64 18283932263412303006, ; 376: OpenCvSharp.dll => 0xfdbd938569fe849e => 69
	i64 18305135509493619199, ; 377: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 96
	i64 18324163916253801303, ; 378: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18335459783622540540 ; 379: ZXing.Net.MAUI.Controls => 0xfe74a3871c483cfc => 111
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [380 x i32] [
	i32 49, ; 0
	i32 53, ; 1
	i32 189, ; 2
	i32 63, ; 3
	i32 40, ; 4
	i32 139, ; 5
	i32 82, ; 6
	i32 99, ; 7
	i32 100, ; 8
	i32 7, ; 9
	i32 158, ; 10
	i32 178, ; 11
	i32 123, ; 12
	i32 10, ; 13
	i32 87, ; 14
	i32 69, ; 15
	i32 158, ; 16
	i32 104, ; 17
	i32 18, ; 18
	i32 133, ; 19
	i32 95, ; 20
	i32 145, ; 21
	i32 60, ; 22
	i32 188, ; 23
	i32 178, ; 24
	i32 16, ; 25
	i32 77, ; 26
	i32 92, ; 27
	i32 67, ; 28
	i32 144, ; 29
	i32 141, ; 30
	i32 151, ; 31
	i32 76, ; 32
	i32 162, ; 33
	i32 6, ; 34
	i32 99, ; 35
	i32 132, ; 36
	i32 28, ; 37
	i32 100, ; 38
	i32 61, ; 39
	i32 38, ; 40
	i32 28, ; 41
	i32 170, ; 42
	i32 91, ; 43
	i32 2, ; 44
	i32 20, ; 45
	i32 176, ; 46
	i32 132, ; 47
	i32 67, ; 48
	i32 87, ; 49
	i32 115, ; 50
	i32 24, ; 51
	i32 90, ; 52
	i32 173, ; 53
	i32 161, ; 54
	i32 83, ; 55
	i32 168, ; 56
	i32 75, ; 57
	i32 27, ; 58
	i32 57, ; 59
	i32 44, ; 60
	i32 2, ; 61
	i32 161, ; 62
	i32 55, ; 63
	i32 7, ; 64
	i32 104, ; 65
	i32 89, ; 66
	i32 148, ; 67
	i32 65, ; 68
	i32 165, ; 69
	i32 147, ; 70
	i32 108, ; 71
	i32 73, ; 72
	i32 63, ; 73
	i32 42, ; 74
	i32 101, ; 75
	i32 186, ; 76
	i32 22, ; 77
	i32 168, ; 78
	i32 43, ; 79
	i32 182, ; 80
	i32 42, ; 81
	i32 185, ; 82
	i32 98, ; 83
	i32 50, ; 84
	i32 129, ; 85
	i32 61, ; 86
	i32 146, ; 87
	i32 141, ; 88
	i32 167, ; 89
	i32 153, ; 90
	i32 59, ; 91
	i32 33, ; 92
	i32 123, ; 93
	i32 169, ; 94
	i32 139, ; 95
	i32 68, ; 96
	i32 122, ; 97
	i32 156, ; 98
	i32 30, ; 99
	i32 138, ; 100
	i32 180, ; 101
	i32 156, ; 102
	i32 48, ; 103
	i32 0, ; 104
	i32 79, ; 105
	i32 37, ; 106
	i32 75, ; 107
	i32 101, ; 108
	i32 133, ; 109
	i32 164, ; 110
	i32 160, ; 111
	i32 160, ; 112
	i32 118, ; 113
	i32 118, ; 114
	i32 164, ; 115
	i32 162, ; 116
	i32 126, ; 117
	i32 26, ; 118
	i32 29, ; 119
	i32 136, ; 120
	i32 171, ; 121
	i32 72, ; 122
	i32 170, ; 123
	i32 103, ; 124
	i32 71, ; 125
	i32 134, ; 126
	i32 46, ; 127
	i32 23, ; 128
	i32 23, ; 129
	i32 174, ; 130
	i32 150, ; 131
	i32 154, ; 132
	i32 34, ; 133
	i32 90, ; 134
	i32 11, ; 135
	i32 86, ; 136
	i32 52, ; 137
	i32 65, ; 138
	i32 19, ; 139
	i32 22, ; 140
	i32 130, ; 141
	i32 183, ; 142
	i32 181, ; 143
	i32 148, ; 144
	i32 74, ; 145
	i32 111, ; 146
	i32 152, ; 147
	i32 26, ; 148
	i32 140, ; 149
	i32 159, ; 150
	i32 122, ; 151
	i32 181, ; 152
	i32 149, ; 153
	i32 73, ; 154
	i32 128, ; 155
	i32 143, ; 156
	i32 144, ; 157
	i32 17, ; 158
	i32 186, ; 159
	i32 113, ; 160
	i32 107, ; 161
	i32 77, ; 162
	i32 47, ; 163
	i32 119, ; 164
	i32 89, ; 165
	i32 142, ; 166
	i32 127, ; 167
	i32 157, ; 168
	i32 187, ; 169
	i32 119, ; 170
	i32 64, ; 171
	i32 128, ; 172
	i32 80, ; 173
	i32 171, ; 174
	i32 97, ; 175
	i32 155, ; 176
	i32 116, ; 177
	i32 151, ; 178
	i32 35, ; 179
	i32 21, ; 180
	i32 187, ; 181
	i32 78, ; 182
	i32 113, ; 183
	i32 96, ; 184
	i32 21, ; 185
	i32 127, ; 186
	i32 46, ; 187
	i32 183, ; 188
	i32 31, ; 189
	i32 78, ; 190
	i32 103, ; 191
	i32 76, ; 192
	i32 56, ; 193
	i32 105, ; 194
	i32 175, ; 195
	i32 83, ; 196
	i32 117, ; 197
	i32 189, ; 198
	i32 62, ; 199
	i32 6, ; 200
	i32 68, ; 201
	i32 143, ; 202
	i32 153, ; 203
	i32 60, ; 204
	i32 3, ; 205
	i32 86, ; 206
	i32 155, ; 207
	i32 37, ; 208
	i32 154, ; 209
	i32 108, ; 210
	i32 84, ; 211
	i32 1, ; 212
	i32 135, ; 213
	i32 145, ; 214
	i32 35, ; 215
	i32 131, ; 216
	i32 51, ; 217
	i32 62, ; 218
	i32 74, ; 219
	i32 12, ; 220
	i32 102, ; 221
	i32 15, ; 222
	i32 52, ; 223
	i32 70, ; 224
	i32 85, ; 225
	i32 163, ; 226
	i32 54, ; 227
	i32 13, ; 228
	i32 102, ; 229
	i32 50, ; 230
	i32 185, ; 231
	i32 9, ; 232
	i32 177, ; 233
	i32 114, ; 234
	i32 157, ; 235
	i32 174, ; 236
	i32 167, ; 237
	i32 116, ; 238
	i32 36, ; 239
	i32 55, ; 240
	i32 88, ; 241
	i32 93, ; 242
	i32 34, ; 243
	i32 130, ; 244
	i32 81, ; 245
	i32 137, ; 246
	i32 14, ; 247
	i32 82, ; 248
	i32 172, ; 249
	i32 79, ; 250
	i32 27, ; 251
	i32 138, ; 252
	i32 53, ; 253
	i32 71, ; 254
	i32 166, ; 255
	i32 1, ; 256
	i32 15, ; 257
	i32 188, ; 258
	i32 72, ; 259
	i32 9, ; 260
	i32 106, ; 261
	i32 150, ; 262
	i32 107, ; 263
	i32 29, ; 264
	i32 112, ; 265
	i32 30, ; 266
	i32 13, ; 267
	i32 98, ; 268
	i32 129, ; 269
	i32 121, ; 270
	i32 8, ; 271
	i32 11, ; 272
	i32 124, ; 273
	i32 88, ; 274
	i32 41, ; 275
	i32 3, ; 276
	i32 81, ; 277
	i32 179, ; 278
	i32 172, ; 279
	i32 159, ; 280
	i32 146, ; 281
	i32 24, ; 282
	i32 5, ; 283
	i32 173, ; 284
	i32 36, ; 285
	i32 166, ; 286
	i32 44, ; 287
	i32 180, ; 288
	i32 16, ; 289
	i32 32, ; 290
	i32 106, ; 291
	i32 169, ; 292
	i32 85, ; 293
	i32 33, ; 294
	i32 39, ; 295
	i32 0, ; 296
	i32 45, ; 297
	i32 137, ; 298
	i32 142, ; 299
	i32 47, ; 300
	i32 149, ; 301
	i32 17, ; 302
	i32 136, ; 303
	i32 140, ; 304
	i32 54, ; 305
	i32 112, ; 306
	i32 43, ; 307
	i32 84, ; 308
	i32 45, ; 309
	i32 124, ; 310
	i32 4, ; 311
	i32 147, ; 312
	i32 92, ; 313
	i32 184, ; 314
	i32 182, ; 315
	i32 4, ; 316
	i32 12, ; 317
	i32 80, ; 318
	i32 5, ; 319
	i32 49, ; 320
	i32 177, ; 321
	i32 59, ; 322
	i32 176, ; 323
	i32 184, ; 324
	i32 109, ; 325
	i32 18, ; 326
	i32 51, ; 327
	i32 48, ; 328
	i32 38, ; 329
	i32 64, ; 330
	i32 97, ; 331
	i32 125, ; 332
	i32 66, ; 333
	i32 110, ; 334
	i32 175, ; 335
	i32 25, ; 336
	i32 95, ; 337
	i32 117, ; 338
	i32 94, ; 339
	i32 109, ; 340
	i32 121, ; 341
	i32 32, ; 342
	i32 57, ; 343
	i32 120, ; 344
	i32 152, ; 345
	i32 125, ; 346
	i32 110, ; 347
	i32 131, ; 348
	i32 10, ; 349
	i32 105, ; 350
	i32 39, ; 351
	i32 25, ; 352
	i32 8, ; 353
	i32 66, ; 354
	i32 58, ; 355
	i32 20, ; 356
	i32 135, ; 357
	i32 70, ; 358
	i32 126, ; 359
	i32 41, ; 360
	i32 31, ; 361
	i32 93, ; 362
	i32 91, ; 363
	i32 163, ; 364
	i32 40, ; 365
	i32 165, ; 366
	i32 56, ; 367
	i32 114, ; 368
	i32 58, ; 369
	i32 179, ; 370
	i32 19, ; 371
	i32 94, ; 372
	i32 134, ; 373
	i32 120, ; 374
	i32 115, ; 375
	i32 69, ; 376
	i32 96, ; 377
	i32 14, ; 378
	i32 111 ; 379
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
