package main

import "testing"

func TestDivide(t *testing.T){

    got := div(10,2)
    want := 5

    if got != want {
        t.Errorf("got %q, wanted %q", got, want)
    }
}