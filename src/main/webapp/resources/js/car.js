console.log("Car Module...");

let CarService = (function() {
	function add(car, callback, error){
		console.log("add car..............");
		
		$.ajax({
			type : 'post',
			url : '/car/new',
			data : JSON.stringfy(car),
			contentType : "application/json; charset=utf-8",
			success :function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	function getList(param, callback, error) {
		let page = param.page || 1;      
        $.getJSON("/car/list" + ".json",
            function (data) {
                if (callback)
                    callback(data); // 댓글 목록만 가져오는 경우
                    //callback(data.list, page); // 댓글 숫자와 목록(페이징)
            }).fail(function (xhr, status, err) {
            if(error){ error();}
        });
	}
	function remove(carid, replyer, callback, error){
		$.ajax({
    		type : 'delete',
    		url : '/car/' + carid,
    		
    		data: JSON.stringify({
    			carid:carid
    		}),
    		contentType: "application/json; charset=utf-8",
    		
    		success : function(deleteResult, status, xhr){
    			if(callback){
    				callback(deleteResult);
    			}
    		},
    		error : function(xhr, status, er){
    			if(error) error(er);
    		}
    	});
	}
	return {
		add : add,
		getList : getList,
		remove : remove
	};
})();