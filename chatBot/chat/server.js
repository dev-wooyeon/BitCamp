	var app = require('express')();
	var http = require('http').Server(app);
	var io = require('socket.io')(http);
	var client = require('mongoose');
	
	//client.connect('mongodb://@127.0.0.1:27017/nodejs');
	client.connect('mongodb://@localhost:27017/chatbot');
	var db = client.connection;
	
	db.on('error',function(){
		console.log('connect fail');
	});

	db.once('open',function(){
		console.log('connect Success');
	});
	
//	var listUsers = db.collection('users').find();

	var chatbotDB = client.Schema({
		no : 'number',
		result : 'string',
		regDate : 'Date'
	});

	var chatbotDB2 = client.model('Schema', chatbotDB);

//	// SELECT LIST
//	newChatBot.find(function(error, Users){
//		console.log(' ================= Select List ================');
//
//		if(error){
//			console.log(error);
//		} else {
//			console.log(Users);
//		}
//	});
//
//	// SELECT ONE
//	User.findOne({name:'test'}, function(error,user){
//	    console.log(' ================= Select One ================');
//	    if(error){
//	        console.log(error);
//	    }else{
//	        console.log(user);
//	    }
//	});
//
//	// UPDATE
//	User.findOne({name:'test'}, function(error,user){
//	    console.log(' ================= Update ================');
//	    if(error){
//	        console.log(error);
//	    }else{
//			user.name = 'updateTest'
//			user.save(function(error,updateUser){
//				if(error){
//					console.log(error);
//				} else {
//					console.log(updateUser)
//				}
//			});
//	    }
//	});
//
//	// Delete
//	User.remove({name:'updateTest'}, function(error,output){
//	    console.log('================= Delete ================');
//	    if(error){
//	        console.log(error);
//	    }
//
//	    /* ( SINCE DELETE OPERATION IS IDEMPOTENT, NO NEED TO SPECIFY )
//	        어떤 과정을 반복적으로 수행 하여도 결과가 동일하다. 삭제한 데이터를 다시 삭제하더라도, 존재하지 않는 데이터를 제거요청 하더라도 오류가 아니기 때문에
//	        이부분에 대한 처리는 필요없다. 그냥 삭제 된것으로 처리
//	        */
//	    console.log('Name : updateTest , Delete Complete');
//	});
	
	var ChatBotcount = 0;
	//var room2count = 0;

	app.get('/', function(req, res){
	  res.send('<h1>#Protected 보호할개 챗봇 Server 입니다.</h1><a href=192.168.0.30:8080/></a>');
	});
	
	var ChatBot = io.of('/ChatBot');
	//var room2 = io.of('/room2');
	
	var ChatBotUser = [] ; 
	//var room2user = [] ;
	
	function userObject (id,name) {
		
		this.id = id;
		this.name = name;
		
	} 
	
	ChatBot.on('connection', function(socket){
	  		
	ChatBotcount++;
	  console.log(socket.id+'유저가 접속을 했습니다.(room1)현재 접속자--'+ChatBotcount+'명--');
	  //접속시 전체메세지
	  //ChatBot.emit('send_msg', 'developerNam : 현재 접속자 : '+room1count);
	    
	  socket.on('disconnect', function () {
		  ChatBotcount--;
		  		  
		  
		  console.log('유저가 접속해제를 했습니다.(room1)');
		  
		  for( var i = 0; i < ChatBotUser.length; i++){ 
			   if ( ChatBotUser[i].id === socket.id) {
				 ChatBot.emit('send_msg', 'developerNam :[ '+ChatBotUser[i].name+'님 퇴장 ] 현재 접속자 : '+ChatBotcount);  
				 ChatBotUser.splice(i, 1); 
			   }
			}
		  
		  ChatBot.emit('updateUser',ChatBotUser);
		  
		  
	  });	
	  
    	

		
	  socket.on('send_msg', function (msg) {

//		  newChatBot.findOne({no:10000}, function(error,data){
//			    console.log(' ================= Select One ================');
//			    if(error){
//			        console.log(error);
//			    }else{
//			        console.log(data);
//			    }
//			});
			
	      var onlyMsg = msg.split(":");
	      
	      console.log("onlyMsg[1]" + onlyMsg[1]);
	      
	      ChatBot.emit('send_msg', msg);
	      
	      var yok = ['개새끼', '씨발', '병신', '고자', '새끼'];
		  
			var newChatBotDB = new chatbotDB2({
				no : 100000,
				result : onlyMsg[1],
				regDate : new Date()
			});
			

			chatbotDB2.find({"result":{$ne:null}},function(error, Users){
			console.log(' ================= Select List ================');
	
			if(error){
				console.log(error);
			} else {
				console.log(Users);
				//console.log(Users.get('result'));
				
				var yokk = Users;

			}
			
			var resultYok = [];
			
			yokk.forEach(
					function(row){
						resultYok.push(row.text);
						console.log("row.text : " + row.text)
					}
			)
			
		});	
//			
//			newChatBot.save(function(error,data){
//				if(error){
//					console.log(error);
//				} else {			
//					console.log(newChatBot);
//					console.log('save Complete');
//				}
//			});
			
		  if(onlyMsg[1] != null){	
			  var msgContent =onlyMsg[1].trim();
			  
		      if(msgContent.indexOf('은우') != -1){
		    	  ChatBot.emit('send_msg', '멍봇 : 그 잘생기신분 ? ');
		    	  return;
		      }
		      
		      if(msgContent.indexOf('혜미') != -1){
		    	  ChatBot.emit('send_msg', '멍봇 : 생일 축하해');
		    	  return;
		      }
		      
		      if(msgContent.indexOf('지수') != -1){
		    	  ChatBot.emit('send_msg', '멍봇 : 이준기씨 사랑해요');
		    	  return;
		      }
		      
			  for(i = 0 ; i < yok.length; i++){
			      if(msgContent.indexOf(yok[i]) != -1){
			    	  ChatBot.emit('send_msg', '멍봇 : 욕은 하지 마세요.');
			    	  return;
			      }
			  }

			  if(msgContent != null){
				  ChatBot.emit('send_msg', '멍봇 : 난 그런말 몰라');
				  return;
			  }
		  }
		  

			
	  });
	  
	  
	  
	  socket.on('updateUser', function(userName) {
		
		  var user = new userObject(socket.id,userName);
		  
		  ChatBotUser.push(user);
		  ChatBot.emit('updateUser', ChatBotUser);
		  
		  
	  });
	  
	});
	
//	room2.on('connection', function(socket){
//  		
//		  room2count++;
//		  console.log(socket.id+'유저가 접속을 했습니다.(room2)현재 접속자--'+room2count+'명--');
//		  //접속시 전체메세지
//		  room2.emit('send_msg', 'developerNam : 현재 접속자 : '+room2count);
//		    
//		  socket.on('disconnect', function () {
//			  room2count--;
//			  
//			  console.log('유저가 접속해제를 했습니다.(room2)');
//			  
//			  for( var i = 0; i < room2user.length; i++){ 
//				   if ( room2user[i].id === socket.id) {
//					 room2.emit('send_msg', 'developerNam : --------------'+room2user[i].name+'님 퇴장--------------현재 접속자 : '+room2count);  
//				     room2user.splice(i, 1); 
//				   }
//				}
//			  
//			  room2.emit('updateUser',room2user);
//
//		  });	
//		  socket.on('send_msg', function (msg) {
//			  
//		      console.log(msg);
//		      room2.emit('send_msg', msg);
//		  });
//		  
//		  socket.on('updateUser', function(userName) {
//			
//			  var user = new userObject(socket.id,userName);
//			  
//			  room2user.push(user);
//			  room2.emit('updateUser', room2user);
//			  
//		  });
//		  
//		});
	
	http.listen(82, function(){
	  console.log('listening on *:82');
	});

