// node_modules/combinejs 모듈 호출
var combinejs = require('combinejs');

// combinejs 모듈 테스트
combinejs(['./watch.js', './writeFileSync.js'], './all.js', true);
