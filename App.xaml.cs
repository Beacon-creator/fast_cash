using Fast_Cash.Pages;
using Fast_Cash.Pages.TabbedPages;

namespace Fast_Cash
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();

         //  MainPage = new NavigationPage(new HomePage());
          //   MainPage = new StartPage1();


        }

        protected override async void OnStart()
        {
        //    await Shell.Current.GoToAsync("//Signup");

                base.OnStart();
        }
    }
}
