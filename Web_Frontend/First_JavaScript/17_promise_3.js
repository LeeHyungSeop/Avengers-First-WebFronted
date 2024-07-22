// // promise를 이용한 비동기 서버 요청

// // XMLHttpRequest : event Handler를 이용한 비동기 처리 (구식)
// // Promise : fetch 라는 API를 이용한 비동기 처리 (요즘 대부분 사용)

// 'use strict'

// /*
//     일부러 error 발생 1: 'http://127.0.0.1:5500/../First_HTML_CSS/1_helloABC.html'
//     1_helloABC.html 라는 파일이 없으니까 server로부터 404라는 error code를 돌려준다. 
//     --> 서버로부터 응답이 온거니까 --> resolve 함수를 불러서 then으로 넘어간다

//     우리가 확인하고 싶은 error를 발생시키고 싶으면
//     아예 서버자체로 명령을 못 날리도록 해야 한다

//     일부러 error 발생 2: 'httpABC://127.0.0.1:5500/../First_HTML_CSS/1_hello.html'

// */

// // fetch : 가져오다, 서버로부터 web page를 가져오다

// // 정상 : 'http://127.0.0.1:5500/../First_HTML_CSS/1_hello.html'
// const a = fetch('http://127.0.0.1:5500/../First_HTML_CSS/1_hello.html') 
//     // fetch의 반환값이 Promise이다
//     // a는 Promise 이다.
//     // fetch에서 응답이 성공했는지 실패했는지에 대한 
//     // resolve(then 호출)와 reject(catch 호출) 함수까지 처리해준다

// a
// .then ((response)=>{    // fetch가 성공하여 서버로부터 응답이 제대로 왔을 때 실행됨
//     console.log(`서버응답 도착`);
//     // console.log(`응답을 텍스트로 바꾸면: ${response.text()}`); 
//     /*
//         fetch에서 then을 호출했는데
//         반환값이 text(문자열)이 아니라 promise이다.
//         또 다른 Promise로 반환한다.
//     */
//    return response.text() // response.text()라는 또 다른 promise를 반환한다.
//                           // fetch로부터 받아온 응답을 문자열로 바꾸는 일을 한다.
//                           // 그것이 또 성공하면 then, 실패하면 catch로 넘긴다
//                           // 넘길때 성공적으로 바꾼 문자열을 넘겨준다.
// })
// .then((data)=>{    // 그 또 다른 promise에 대한 then을 만들어서 문자열로 바꿔준다 (promise chaining)
//     console.log(`문자열로 바꾼 응답 : ${data}`);
// })

// .catch((err)=>{    // fetch가 실패하여 서버로부터 응답이 오지 않았을 때 실행됨
//     console.log(`서버 응답 Error : ${err}`);
// });


// // for 문 넣는 이유 :
// // 비동기 요청과 상관없는 부분이 별도로 실행되는지 확인하기 위함
// for(let i = 0;i<10;i++){
//     console.log(i);
// }


/////////////////////////////////////////////////////////////////////////////////////
// 간단하게 바꾸기


    fetch('http://127.0.0.1:5500/../First_HTML_CSS/1_hello.html') 
    .then ((response)=>{   
        console.log(`서버응답 도착`);
        return response.text() 
    })
    .then((data)=>{   
        console.log(`문자열로 바꾼 응답 : ${data}`);
    })

    .catch((err)=>{ 
        console.log(`서버 응답 Error : ${err}`);
    });
