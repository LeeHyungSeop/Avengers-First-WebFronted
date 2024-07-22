'use strict'

// async : syntactic sugar for promise
//  syntactic sugar : 문법적인 완화 (어려운 문법을 쉽도록 해주는)

/*  ex. C언어

int k = 0;
if(k>1)
    k=3
else
    k=0;

--> (syntactic sugar)
k = (k>1) ? 3 : 0;

*/
// /////////////////////////////////////////////////////////////////////

// function fetchUser() {
//     return new Promise((resolve,reject)=>{
//         console.log(`Promise 실행`);
//         resolve(`실행 끝`);
//     })
// }

// const a = fetchUser()

// a.then((v)=>{
//     console.log(`fetchUser result : ${v}`);
// })


// ///////////////////////////////////////////////////////////////////
// // Promise의 syntactic sugar

// async function fetchUser(a) {    // async를 붙이면 fetchUser function은 무조건 Promise를 반환
//     console.log(`Promise 실행`);

//     if(a>=0){    // 양수가 들어오면 resolve에 해당
//         return `실행 끝`;
//     }
//     else{   // 음수가 들어오면 reject에 해당
//         throw new Error('음수'); // JS에서 제공하는 Error라는 class에 에러내용을 문자열로 기입
//     }
// }
// // fetchUser는 Promise를 반환하기 때문에
// // return --> resolve를 부름
// // throw --> reject를 부름

// const a = fetchUser(-10)
// .then((v)=>{    // resolve할 때 부르는 then
//     console.log(`fetchUser result : ${v}`);
// })
// .catch((error)=>{   // reject할 때 부르는 catch
//     console.log(`에러발생 : ${error}`);
// })
// .finally(()=>{  // resolve, reject에 상관 없이 
//                 // Promise가 종료되면 공통적으로 실행돼야 하는 부분
//     console.log(`Promise 끝 from finally`);
// })

// ///////////////////////////////////////////////////////////////////

// async function fetchUser(a) {   
//     console.log(`Promise 실행`);
    
//     B().then((k)=>{ // fucntion B가 Promise를 반환하니까 이렇게 코딩한다.
//                     // k에 45가 넘어올 것이다
//                     // 그런데 fetchUser result : undefined가 나온다.
//                     // resolve가 안뚫어졌는데도 then이실행된 것이다. 
//                     // B가 완전히 끝날 때까지 기다려주는.. 동기화가 안된 것이다.
//                     // 이것을 해결 하기 위해 await 사용 
//                     // (Promise 안에서 또 다른 Promise가 동기적으로 실행하는 것을 가능하게 한다)
        
//         if(k>=0){   
//             return `실행 끝`;
//         }
//         else{   
//             throw new Error('음수');
//         }
//     });
// }

// const a = fetchUser(-10)
// .then((v)=>{    
//     console.log(`fetchUser result : ${v}`);
// })
// .catch((error)=>{   
//     console.log(`에러발생 : ${error}`);
// })
// .finally(()=>{  
//     console.log(`Promise 끝 from finally`);
// })

// function B() {
//     return new Promise((resolve,reject)=>{
//         setTimeout(()=>{
//             console.log('B가 실행됨');
//             resolve(45);
//         },3000);
//     })
// }

// function B() {
//     return new Promise((resolve,reject)=>{
//         setTimeout(()=>{
//             console.log('B가 실행됨');
//             resolve(45);
//         },3000);
//     })
// }

///////////////////////////////////////////////////////////////////
// async의 함수의 await 기능 
//(Promise 안에서 또 다른 Promise가 동기적으로 실행하는 것을 가능하게 한다)

async function fetchUser(a) {   
    console.log(`Promise 실행`);

    const k = await B(); // *await는 async 함수 내에서만, 다른 Promise의 종료를 기다릴 때 사용 가능*

        if(k>=0){   
            return `실행 끝`;
        }
        else{   
            throw new Error('음수');
        }
};


const a = fetchUser(-10)
.then((v)=>{    
    console.log(`fetchUser result : ${v}`);
})
.catch((error)=>{   
    console.log(`에러발생 : ${error}`);
})
.finally(()=>{  
    console.log(`Promise 끝 from finally`);
})

function B() {
    return new Promise((resolve,reject)=>{
        setTimeout(()=>{
            console.log('B가 실행됨');
            resolve(-45);
        },3000);
    })
}