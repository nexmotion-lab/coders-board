let AJAX = {
    call: function (url, params, func, isfd) {
        let callobj = {
            url: url,
            type: "post",
            data: params,
            dataType: "text",
            success: func,
            error: function (xhr, status, error) {
                if (xhr.status === 0) {
                    alert("네트워크 접속이 원할하지 않습니다.");
                } else {
                    console.log(xhr.responseText);
                    alert("에러가 발생하였습니다. 관리자에게 문의해주세요.");
                }
            },
        };
        if (isfd) {
            callobj.processData = false;
            callobj.contentType = false;
        }
        jQuery.ajax(callobj);
    }
}

$(document).ready(function(){
    start();
});

function start() {
    AJAX.call("/attach/select", null, function (data) {
        let posts = JSON.parse(data.trim());
        show(posts);
    })
}

function show(response){
    let posts =response.data;
    console.log(posts);
    let s = "";
    posts.forEach(function(item){
        console.log(item);
        s+="<tr>"
        s+="<td>"+item.postId+"</td>";
        s+="<td>"+item.postTitle+"</td>";
        s+="<td>"+item.postAuthor+"</td>";
        s+="<td>"+item.postDate+"</td>";
        s+="<td>없음</td>";
        s+="<td>"+item.postHit+"</td>";
        s+="</tr>";
    });
    $("#posts").html(s)
}