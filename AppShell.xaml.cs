using Fast_Cash.Pages;
using Fast_Cash.Pages.TabbedPages;
//using Fast_Cash.Pages.TabbedPages;

namespace Fast_Cash
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            // Register routes for other pages if necessary
        
            Routing.RegisterRoute("AccountPage", typeof(Pages.TabbedPages.AccountPage));
            Routing.RegisterRoute("HomePage", typeof(Pages.TabbedPages.HomePage));
            Routing.RegisterRoute("TransactionPage", typeof(Pages.TabbedPages.TransactionPage));
            Routing.RegisterRoute("ServicesPage", typeof(Pages.TabbedPages.ServicesPage));


            Routing.RegisterRoute(nameof(StartPage1), typeof(Pages.StartPage1));
            Routing.RegisterRoute(nameof(SignUpPage), typeof(Pages.SignUpPage));
            Routing.RegisterRoute(nameof(SignInPage), typeof(Pages.SignInPage));


            Routing.RegisterRoute(nameof(ForgotPasswordPage), typeof(Pages.ForgotPasswordPage));
            Routing.RegisterRoute(nameof(ForgotPasswordVerificationPage), typeof(Pages.ForgotPasswordVerificationPage));
            Routing.RegisterRoute(nameof(NewPasswordPage), typeof(Pages.NewPasswordPage));
            Routing.RegisterRoute(nameof(AccountPageMain), typeof(Pages.AccountPageMain));
            Routing.RegisterRoute(nameof(LinkCardPage), typeof(Pages.LinkCardPage));
            Routing.RegisterRoute(nameof(LinkBankPage), typeof(Pages.LinkBankPage));
            Routing.RegisterRoute(nameof(BankVerificationPage), typeof(Pages.BankVerificationPage));
            Routing.RegisterRoute(nameof(CardLinkSuccess), typeof(Pages.CardLinkSuccess));
        }

        public async Task NavigateToHomeScreen()
        {
            // Set the TabBar to visible
            MainTabBar.IsVisible = true;

            // Navigate to the HomePage tab
              await Shell.Current.GoToAsync("///HomePage");

            //    await Shell.Current.GoToAsync(nameof(HomePage));

          //  await GoToAsync(nameof(HomePage));

        }

        public async Task NavigateToLoginPage()
        {
            // Set the TabBar to hidden
            MainTabBar.IsVisible = false;
            // Navigate to the SignInPage
            await GoToAsync(nameof(SignInPage));
        }
    }
}
