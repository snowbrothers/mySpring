console.log('common.js ===================================================')

// Get 방식 요청
function fetchGet(url, callback){
			
		try {
			
			fetch(url)
			// 요청결과 json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));
			
			} catch (e) {
			// TODO: handle exception
		}
}
		
// url 요청후 받아온 값을 가지고 callback 함수의 매개변수로 넣어줌...


// 데이터를 함께 전송하고싶당 ㅇㅅㅇ
// Post 방식 요청
function fetchPost(url, obj, callback){
			
		try {
			
			fetch(url
					,{method : 'post'
					, headers : {'Content-Type' : 'application/json'}
					, body : JSON.stringify(obj)
			})
			// 요청결과 json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));
			
		} catch (e) {
			console.log(e);
		}	
	}