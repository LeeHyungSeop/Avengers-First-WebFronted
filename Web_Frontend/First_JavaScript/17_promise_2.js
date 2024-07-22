// promise를 사용하지 않고 비동기식으로 하는 방법 ///////////////////////////////////////////////////////
// 웹 프로그래밍에서는 대부분 비동기식으로 한다.

// 비동기식 요청 (1. Promise Class 사용, 2. Promise 없이 사용)
// 코드가 작성된 순서와는 상관없이 진행

'use strict'

let request = new XMLHttpRequest()

// if(request.status === 200){ // 비동기식으로 짤때는 서버로부터 언제 응답이 올지 모르니까
//                             // 이 코드는 쓰지 않는다.
//     console.log(request.responseText); 
// }

////////////////////// reqeust에 대한 응답이 올때 처리해야 하는 부분
request.onload = () => {
    if(request.status=== 200){
        console.log('응답이 제대로 왔음');
        console.log(request.responseText);
    }
    else{
        console.log('응답이 제대로 오지 않았음');
    }
}; 
/*
    request.onload : 요청에 대한 응답이 로딩될 때

    서버로부터 요청에 대한 응답이 왔을 때,
    실행될 코드를 지정, 핸들러, 이벤트 핸들러를 지정해서 응답을 처리

    request를 만들고 보내는 부분보다 먼저 작성해야 하는 이유 :
    ->
    답장이 왔을 때 수행해야할 부분을 만들기도 전에 답장이 올 수 있기 때문에
    프로그램의 안정성을 위해 request.onload를 먼저 작성한 후에
    request.open과 .send를 작성해야 한다.
*/

////////////////////// request를 만들고 보내는 부분 
request.open('GET','http://127.0.0.1:5500/../First_HTML_cSS/1_hello.html',true);
request.send(null); 
/*
        false -> 비동기식입니까? 라고 물어보는 것에 대한 답변.
        true -> request가 비동기식으로 진행된다
*/

///////////////////////////////////////////////////

for(let i = 0;i<10;i++){
    console.log(i);
}