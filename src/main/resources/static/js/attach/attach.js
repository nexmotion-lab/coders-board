let attach = {};
let firstPostId = null;
let lastPostId = null;
let params = null;

let AJAX = {
    call: function (url, params, func,isfd) {
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

    $("#prevButton").on("click", function() {
        goPrevPage();
    });

    $("#nextButton").on("click", function(){
        goNextPage();
    });
});

function start() {

    AJAX.call("/attach/select", null, function (data) {
        let posts = JSON.parse(data.trim());
        if (posts.data.length > 0) {
            firstPostId = posts.data[0].postId;
            lastPostId = posts.data[posts.data.length - 1].postId;
        }
        show(posts);
    })
}

function goPrevPage() {
    params = { postId : firstPostId + 11 };
    AJAX.call("/attach/select", params, function (data) {
        let posts = JSON.parse(data.trim());
        if (posts.length > 0) {
            firstPostId = posts[0].postId;
            lastPostId = posts[posts.length - 1].postId;
        }
        show(posts);
    })
}

function goNextPage() {
    params = { postId : lastPostId }
    AJAX.call("/attach/select", params, function (data) {
        let posts = JSON.parse(data.trim());
        if (posts.data.length > 0) {
            firstPostId = posts.data[0].postId + 11;
            lastPostId = posts.data[posts.data.length - 1].postId;
        }
        show(posts);

    })
}


function show(response){
    let posts =response.data;
    let s = "";
    posts.forEach(function(item){
        s+="<tr onclick=\"location.href='attach/details/" + item.postId + "'\">";
        s+="<td>"+item.postId+"</td>";
        s+="<td>"+item.postTitle+"</td>";
        s+="<td>"+item.postAuthor+"</td>";
        s+="<td>"+item.postDate.split('T')[0].replace(/-/g, '.') +"</td>";
        s+="<td>없음</td>";
        s+="<td>"+item.postHit+"</td>";
        s+="</tr>";
    });
    $("#posts").html(s)
}

