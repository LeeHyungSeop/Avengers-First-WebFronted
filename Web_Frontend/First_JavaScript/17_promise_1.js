// 'use strict'

// // WB에서 server들로 network를 타고 request를 보낼 수 있다.
// // 그것을 편하게 해주는 객체 request를 만든다.
// let request = new XMLHttpRequest()    // XMLHttpRequest : event handler
// request.open('GET','http://127.0.0.1:5500/../First_HTML_cSS/1_hello.html',false)   
//                        /* 
//                             http://127.0.0.1:5500/First_HTML_CSS/1_hello.html 에 가서 가져와라

//                             wb가 http 프로토콜로 ws에 17_defer.html 파일에 대한 웹페이지를
//                             요청하기 위해 http 명령어 중 'GET'이라는 명령어를 사용한다.
//                             wb는 html 파일을 rendring해서 화면에 출력하게 된다
                            
//                             127.0.0.1는 자기 자신을 가리키는 IP주소이다. (local loop)
//                             모든 컴퓨터들은 예를 들어 117.23.25.4 라는 고유한 IP주소를 갖고 있는데,
//                             고유한 IP주소 외에 127.0.0.1 이라는 IP주소를 기본적으로 갖고 있다.

//                             WS를 내 컴퓨터에서 돌리고 WB도 내 컴퓨터에서 돌리기 때문에 
//                             굳이 외부에 있는 고유한 IP주소로 하지 않고 127.0.0.1 IP 주소를 이용하면 된다
//                             (비유를 하자면 집에서 어머니 성함을 직접 부르는 것이 아닌 어머니라고 부르는 것)

//                             :5500 --> 포트 번호이다.

//                              false에 대한 설명은 17_promise_2.js 에서.. (비동기식)

//                             이 코드에서 한 일 : HTML 파일에 대한 요청을 만듦
//                        */
// request.send(null);  // HTML 파일에 대한 요청을 보냄

// if(request.status === 200){  // request가 성공적으로 보내졌으면 Server에서 200이라고 응답한다
//     console.log(request.responseText); // HTML 파일에 대한 요청을 받아온 것을 출력
// }

// for(let i = 0;i<10;i++){
//     console.log(i);
// }
//     /* for loop 코드를 쓴 이유?   (Asynchronous execution : 비동기 실행)을 공부하기 위해

//         만약 위에서 요청했던 HTML 파일이 크거나 서버네트워크 딜레이 때문에 오래걸린다면
//         for loop 코드도 똑같이 delay가 된다. 
//         따라서 효율성 측면에서 안좋기 때문에 HTML 파일에 대한 처리와 전혀 상관없이
//         for loop을 동시에 돌릴 수 있다 --> Asynchronous execution : 비동기 실행
//     */

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Asynchronous execution : 비동기 실행

// JS에서 제공해주는 Promise(약속)라는 Class가 있다.
    /*
        const a = new Promise((resolve, reject)=>{
            // 해야 할 일을 지정
        });

        resolve : 약속이 지켜져서(성공해서) 해야 할 일에 대한 함수. 
                  resolve가 실행되면 then 부분을호출
                  
        reject : 실패했을 때 해야 할 일에 대한 함수
                 reject가 실행되면 catch 부분을 호출
    */

const a = new Promise((resolve, reject)=>{
    // ------------------ 해야 할 일 지정
    console.log('hello')

    // resolve('ended'); // then을 부른다

    setTimeout(()=>{
        resolve('ended')  // 3초 후에 resolve함수를 부른다
    },3000);

});

a
.then ((v)=>{   // 'ended'가 v로 오게됨
    console.log(`then received : ${v}`);
});

for(let i = 0;i<10;i++){
    console.log(i);
}

/*
    동기식-------  (코드가 위에서 아래로)
    hello   출력
    (3초후) then received : 'ended' 출력
    0~9 출력

    비동기식------- (Promise를 이용해서 비동기식으로 실행)
    hello   출력
    0~9 출력
    (3초후) then received : 'ended' 출력
*/