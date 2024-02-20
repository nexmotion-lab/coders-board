let loading = false;
let lastPostId;

$(document).ready(function () {
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() + 10 >= $(document).height()) {
            if (!loading) {
                loading = true;

                loadData();
            }
        }
    });

    loadData();
});

function loadData() {
    $.ajax({
        url: '/free/select',
        type: 'GET',
        data: { postId: lastPostId },
        dataType: 'json',
        success: function(response) {
            if (response.returnCode === "200") {
                let freeList = response.data;
                let table = $('#posts');

                for (let i = 0; i < freeList.length; i++) {
                    let post = freeList[i];
                    let row = '<tr onclick="location.href=\'free/details/' + post.postId + '\'">' +
                        '<td>' + post.postId + '</td>' +
                        '<td>' + post.postTitle + '</td>' +
                        '<td>' + post.postAuthor + '</td>' +
                        '<td>' + post.postDate.split('T')[0].replace(/-/g, '.') + '</td>' +
                        '<td></td>' +
                        '<td>' + post.postHit + '</td>' +
                        '</tr>';

                    table.append(row);

                    lastPostId = post.postId;   //LastPostId 갱신
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