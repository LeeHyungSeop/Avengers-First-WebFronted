// Module --> logger.js의 showLogMessage 사용할 것이다

// logger.js 모듈을 불러온다.
const logger = require('./logger.js')   // 어차피 js파일들이 다 모듈이기 때문에 .js를 붙이지 않아도 된다

logger.showLogMessage('첫번째 로그메시지');
logger.secondLog('두번째 로그메시지');
console.log('Logger 모듈에 들어있는 소중한 값은 : '+logger.pvalue);
 
// logger.showLogMessage3('이 함수는 exports를 하지 않아서 error가 날 것임');