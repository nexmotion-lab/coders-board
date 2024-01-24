var loading = false;
var page= 1;

$(document).ready(function () {
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() + 10 >= $(document).height()) {
            if (!loading) {
                console.log("loading" + loading);
                loading = true;
                // 데이터를 가져오는 함수 호출
                loadData(page++);
                console.log("page" + page);
            }
        }
    });

    loadData(page);
    console.log("page" + page);
})

function loadData(page) {
    $.ajax({
        url: '/free/select',
        type: 'GET',
        data: { page: page, pageSize: 10 },
        dataType: 'json',
        success: function(response) {
            if(response.returnCode === "200") {
                var freeList = response.data;
                var table = $('#freeTable');

                var nextPostId;
                for(var i = 0; i < freeList.length; i++) {
                    var post = freeList[i];
                    var row = '<tr onclick="location.href=\'free/details/' + post.postId + '\'">' +
                        '<td>' + post.postId + '</td>' +
                        '<td>' + post.postTitle + '</td>' +
                        '<td>' + post.postAuthor + '</td>' +
                        '<td>' + post.postDate + '</td>' +
                        '<td></td>' +
                        '<td>' + post.postHit + '</td>' +
                        '</tr>';

                    table.append(row);
                }
            } else {
                alert('데이터 가져오기 실패');
            }
            loading = false;
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}