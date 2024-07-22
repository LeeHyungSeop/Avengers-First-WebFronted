// Module (library들의 집합)
function showLogMessage(msg){

    console.log('-------------------------------------------');
    console.log(`로그메시지는 : ${msg}`);
    console.log('-------------------------------------------');

}

function showLogMessage2(msg){

    console.log('===========================================');
    console.log(`로그메시지는 : ${msg}`);
    console.log('===========================================');

}

function showLogMessage3(msg){

    console.log('===========================================');
    console.log(`로그메시지는 : ${msg}`);
    console.log('===========================================');

}

const precioust_value = 78;

// logger.js 파일을 module로 만들어야 한다.
// showLogMessage를 다른 js파일에서 갖다 써도 된다고
// 지정만 해주면 된다
// module.exports.(다른 파일에서 쓸 이름 지정) = (쓸 함수 이름)

module.exports.showLogMessage = showLogMessage;   // 이제 다른 js 파일(app.js)에서 이 module을 쓸 수 있게 되었다
module.exports.secondLog = showLogMessage2;
module.exports.pvalue = precioust_value;
// showLogMessage3 함수는 exports를 하지 않음. (다른 파일에서 쓸 수 없는 것을 확인하기 위함)

