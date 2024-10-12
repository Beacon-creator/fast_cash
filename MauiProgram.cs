using Cashnal.Model;
using Cashnal.Pages;
using Cashnal.Pages.TabbedPages;
using Cashnal.ViewModels;
using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using Cashnal.EventHandlers;
using ZXing.Net.Maui.Controls;
using Microsoft.Extensions.Configuration; // For IConfiguration

namespace Cashnal
    {
    public static class MauiProgram
        {
        public static MauiApp CreateMauiApp()
            {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("Lato-Regular.ttf", "LatoRegular");
                    fonts.AddFont("Lato-Bold.ttf", "LatoBold");
                }).UseMauiCommunityToolkit();

            // Configure HttpClient
            builder.Services.AddHttpClient();
            builder.UseMauiApp<App>();
            builder.UseBarcodeReader();


            builder.Services.AddSingleton<TokenService>(); // Register TokenService, it will pull from IConfiguration

            // Register other pages
            builder.Services.AddSingleton<StartPage>();
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

            // ViewModel registration
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

            // Handlers registration
            builder.Services.AddSingleton<HttpClient>();
            builder.Services.AddSingleton<HttpClientService>();
            builder.Services.AddSingleton<IAlertService, AlertService>();
            builder.Services.AddSingleton<JwtService>();

            // Custom handlers
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

#if DEBUG
            builder.Logging.AddDebug();
#endif

            var app = builder.Build();
            ServiceProviderHelper.ServiceProvider = app.Services;

            return app; // Ensure the final app is returned here
            }
        }
    }
