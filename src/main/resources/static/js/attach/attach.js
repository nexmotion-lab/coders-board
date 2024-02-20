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
        if (posts.data.length > 0) {
            firstPostId = posts.data[0].postId;
            lastPostId = posts.data[posts.data.length - 1].postId;
        }
        show(posts);
    })
}

function goNextPage() {
    params = { postId : lastPostId }
    AJAX.call("/attach/select", params, function (data) {
        let posts = JSON.parse(data.trim());
        if (posts.data.length > 0) {
            firstPostId = posts.data[0].postId;
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
        s+="<td><p class='tw-line-clamp-1'>"+item.postTitle+"</p></td>";
        s+="<td>"+item.postAuthor+"</td>";
        s+="<td>"+item.postDate.split('T')[0].replace(/-/g, '.') +"</td>";
        s+="<td></td>";
        s+="<td>"+item.postHit+"</td>";
        s+="</tr>";
    });
    $("#posts").html(s)
}

function searchPosts() {
    const keyword = document.forms['search-form'].elements['keyword'].value;

    // 비동기적으로 서버에 검색 요청을 보낸다.
    $.ajax({
        url: '/attach/search/select',  // 검색을 처리하는 서버의 엔드포인트
        type: 'GET',
        data: { keyword: keyword },
        success: function (data) {
            // 서버에서 받아온 검색 결과를 가지고 화면을 업데이트한다.
            updatePosts(data);
        },
        error: function (error) {
            console.error('Error during search:', error);
        }
    });
}

function updatePosts(response) {
    let posts = response.data;
    let s = "";

    // 새로운 검색 결과로 화면을 업데이트한다.
    posts.forEach(function (item) {
        s+="<tr onclick=\"location.href='attach/details/" + item.postId + "'\">";
        s+="<td>"+item.postId+"</td>";
        s+="<td><p class='tw-line-clamp-1'>"+item.postTitle+"</p></td>";
        s+="<td>"+item.postAuthor+"</td>";
        s+="<td>"+item.postDate.split('T')[0].replace(/-/g, '.') +"</td>";
        s+="<td></td>";
        s+="<td>"+item.postHit+"</td>";
        s+="</tr>";
    });
    $("#posts").html(s)
}