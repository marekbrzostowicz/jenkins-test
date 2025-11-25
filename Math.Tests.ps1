Describe "Test dodawania" {
    
    BeforeAll {

        . $PSScriptRoot\Math.ps1
    }

    It "Powinien dodawac 2 liczby" {
        $wynik = Add-Numbers 2 2
        $wynik | Should -Be 4
    }

    It "Oblusga liczb ujemnych" {
        $wynik = Add-Numbers 0 -4
        $wynik | Should -Be -4
    }

    It "zero" {
        $wynik = Add-Numbers -4 -4
        $wynik | Should -Be 0
    }
}