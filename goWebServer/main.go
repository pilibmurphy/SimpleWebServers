package main

import (
    "fmt"
    "html"
    "log"
    "net/http"
    "strconv"
)

func main() {

    http.HandleFunc("/divide", func(w http.ResponseWriter, r *http.Request){

        //set up a boolean to fail if any of the sections below fail
    
        x , err := strconv.Atoi(r.FormValue("x"))
        y , err2 := strconv.Atoi(r.FormValue("y"))

        var ans int

        if err == nil && err2 == nil {
            ans = int(div(x,y))
        }else{
            //return some error
        }

        //if pass then make sucessful responce here
        //go.divid

        //var ans int = int(div(x,y))
        strAns := strconv.Itoa(ans)

        fmt.Fprintf(w, strAns)
    })

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
    })

    log.Fatal(http.ListenAndServe(":8081", nil))

}



func div(x int, y int) int{
    ans := x / y
    return ans
}

//http://localhost:8080/example?x=9&y=3