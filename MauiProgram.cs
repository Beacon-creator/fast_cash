using Fast_Cash.Model;
using Fast_Cash.Pages;
using Fast_Cash.Pages.TabbedPages;
using Fast_Cash.ViewModels;
using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Microsoft.Maui;
using Microsoft.Maui.Hosting;
using Fast_Cash.EventHandlers;
using Microsoft.Extensions.DependencyInjection;
using System.Net.Http;
using ZXing.Net.Maui.Controls;


namespace Fast_Cash
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder.UseMauiApp<App>().ConfigureFonts(fonts =>
            {
                fonts.AddFont("Lato-Regular.ttf", "LatoRegular");
                fonts.AddFont("Lato-Bold.ttf", "LatoBold");
            }).UseMauiCommunityToolkit();

            //extensions
            builder.Services.AddHttpClient();
            builder.UseMauiApp<App>();
            builder.UseBarcodeReader();


            //pages
            builder.Services.AddSingleton<StartPage1>();
            builder.Services.AddTransient<SignUpPage>();
            builder.Services.AddTransient<SignInPage>();
            builder.Services.AddTransient<HomePage>();
            builder.Services.AddTransient<ServicesPage>();
            builder.Services.AddTransient<TransactionPage>();
            builder.Services.AddTransient<AccountPageMain>();
            builder.Services.AddTransient<AccountPage>();
            builder.Services.AddTransient<BankVerificationPage>();
            builder.Services.AddTransient<LinkBankPage>();
            builder.Services.AddTransient<LinkCardPage>();
            builder.Services.AddTransient<CardscanPage>();
            builder.Services.AddTransient<FacescanPage>();
            builder.Services.AddTransient<ForgotPasswordPage>();
            builder.Services.AddTransient<ForgotPasswordVerificationPage>();
            builder.Services.AddTransient<NewPasswordPage>();
            builder.Services.AddTransient<CardLinkSuccess>();

            //viewmodel
            builder.Services.AddTransient<StartPageViewModel>();
            builder.Services.AddTransient<SignInViewModel>();
            builder.Services.AddTransient<SignUpViewModel>();
            builder.Services.AddTransient<AccountMainViewModel>();
            builder.Services.AddTransient<AccountViewModel>();
            builder.Services.AddTransient<HomePageVM>();
            builder.Services.AddTransient<ForgotPasswordViewModel>();
            builder.Services.AddTransient<ForgotPasswordVerificationViewModel>();
            builder.Services.AddTransient<NewPasswordViewModel>();
            builder.Services.AddTransient<TransactionPageViewModel>();
            builder.Services.AddTransient<LinkBankViewModel>();
            builder.Services.AddTransient<BankVerificationViewModel>();
            builder.Services.AddTransient<LinkCardViewModel>();
            builder.Services.AddTransient<ConfirmationDialogViewModel>();
            builder.Services.AddTransient<PopupViewModel>();

            //handlers
            builder.Services.AddSingleton<HttpClient>();
            builder.Services.AddSingleton<HttpClientService>();
            builder.Services.AddSingleton<IAlertService, AlertService>();
            builder.Services.AddSingleton<JwtService>();
            builder.Services.AddSingleton<TokenService>();
            Microsoft.Maui.Handlers.EntryHandler.Mapper.AppendToMapping("LineEntry", (handler, view) =>
            {
                if (view is LineEntry)
                {
#if __ANDROID__
                                handler.PlatformView.Background = null;
                                handler.PlatformView.SetBackgroundColor(Android.Graphics.Color.Transparent);

                                // Change the cursor color to black
                                if (handler.PlatformView.TextCursorDrawable != null)
                                {
                                    var cursorDrawable = handler.PlatformView.TextCursorDrawable;
                                    cursorDrawable.SetColorFilter(Android.Graphics.Color.Black, Android.Graphics.PorterDuff.Mode.SrcIn);
                                    handler.PlatformView.TextCursorDrawable = cursorDrawable;
                                }

#elif __IOS__ || MACCATALYST
                    handler.PlatformView.BackgroundColor = UIKit.UIColor.Clear;
                    handler.PlatformView.BorderStyle = UIKit.UITextBorderStyle.None;
                    // Change the cursor color to black
                    handler.PlatformView.TintColor = UIKit.UIColor.Black;
#endif
                }
            });
            Microsoft.Maui.Handlers.CheckBoxHandler.Mapper.AppendToMapping("CheckBoxEntry", (handler, view) =>
            {
                if (view is CheckBoxEntry)
                {
#if __ANDROID__
                                handler.PlatformView.Background = null;
                                handler.PlatformView.SetBackgroundColor(Android.Graphics.Color.Yellow);
                               
                                // Change the cursor color to black
                                if (handler.PlatformView.TextCursorDrawable != null)
                                {
                                    var cursorDrawable = handler.PlatformView.TextCursorDrawable;
                                    cursorDrawable.SetColorFilter(Android.Graphics.Color.Black, Android.Graphics.PorterDuff.Mode.SrcIn);
                                    handler.PlatformView.TextCursorDrawable = cursorDrawable;
                                }

#elif __IOS__ || MACCATALYST
                    handler.PlatformView.BackgroundColor = UIKit.UIColor.Clear;
                    //  handler.PlatformView.BorderStyle = UIKit.UITextBorderStyle.None;
                    // Change the cursor color to black
                    handler.PlatformView.TintColor = UIKit.UIColor.Black;
#endif
                }
            });
#if DEBUG
            builder.Logging.AddDebug();
#endif

            var app = builder.Build();
            ServiceProviderHelper.ServiceProvider = app.Services;


            return builder.Build();
        }
    }
}