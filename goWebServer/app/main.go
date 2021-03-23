package main

import (
    "log"
    "net/http"
    "strconv"
    "encoding/json"
)

func main() {

    type JsonReply struct {
        Error    bool
        Equation string
        Answer   int
    }

    http.HandleFunc("/divide", func(w http.ResponseWriter, r *http.Request){
        var ans int = 0
        strEquation := "NULL"
        var errorBool bool = true
        data := JsonReply{}
    
        x , err := strconv.Atoi(r.FormValue("x"))
        y , err2 := strconv.Atoi(r.FormValue("y"))

        w.Header().Set("Content-Type", "application/json")
        w.Header().Set("Access-Contorl", "*")

        if err == nil && err2 == nil {
            ans = int(div(x,y))
            strEquation = strconv.Itoa(x) + "/" + strconv.Itoa(y) + "=" + strconv.Itoa(ans)
            errorBool = false

            data = JsonReply{
                Error: errorBool,
                Equation: strEquation,
                Answer: ans,
            }
    
            content, err3 := json.Marshal(data)
            if err3 != nil{
                panic(err3)
            }
            w.WriteHeader(http.StatusOK)
        }else{
            
            //I think that NULL Will break this
            data = JsonReply{
                Error: ture,
                Equation: NULL,
                Answer: NULL,
            }
    
            content, err3 := json.Marshal(data)
            if err3 != nil{
                panic(err3)
            }
            w.WriteHeader(http.StatusUnprocessableEntity)
        }
        w.Write(content)
    })

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Content-Type", "application/json")
        w.Header().Set("Access-Control", "*")
        w.WriteHeader(http.StatusForbidden)
    })

    log.Fatal(http.ListenAndServe(":5000", nil))
}



//http://localhost:8080/example?x=9&y=3

//this is the responce we are looking for 
//{"error": false, "string": "1*2=2", "answer": "2"}