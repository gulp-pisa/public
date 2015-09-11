var x interface{} = 7  // x type dinamico int e valore 7
i := x.(int)           // i type int e valore 7

type I interface { m() }
var y I
s := y.(string)        // illegal: string non implementa I (missing method m)
r := y.(io.Reader)     // r ha type io.Reader e y deve implementare I e io.Reader
