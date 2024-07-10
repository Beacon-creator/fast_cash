﻿using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.ViewModels
{
    public partial class ConfirmationDialogViewModel : ObservableObject
    {
        private readonly HomePageVM _homePageVM;

        public ConfirmationDialogViewModel(HomePageVM homePageVM)
        {
            _homePageVM = homePageVM;
        }

        [RelayCommand]
        private async Task Cancel()
        {
            await Application.Current.MainPage.Navigation.PopModalAsync();
        }

        [RelayCommand]
        private async Task Delete()
        {
            await _homePageVM.ConfirmDeleteAccount();
            await Application.Current.MainPage.Navigation.PopModalAsync();
        }
    }
}