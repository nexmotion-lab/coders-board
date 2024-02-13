$(document).ready(function () {
    let postId = getPostId();
    upPostHit(postId);
});

function loadData(postId) {
    // Ajax를 통해 서버에서 데이터 가져오기
    $.ajax({
        url: '/notice/details/select',
        type: 'GET',
        data: {postId: postId},
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let post = response.data;
                // 가져온 데이터로 페이지 채우기
                fillPage(post);
            } else {
                alert('상세보기 데이터 가져오기 실패');
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    });
}

function upPostHit(postId) {
    $.ajax({
        url: '/notice/update/postHit',
        type: 'POST',
        data: { postId: postId },
        dataType: 'json',
        success: function (response) {
            if(response.returnCode === '200') {
                console.log("조회수 증가 성공");
                loadData(postId);
            } else {
                console.log("조회수 증가 안됨");
            }
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    })
}
function fillPage(post) {
    // 가져온 데이터로 페이지를 동적으로 채우는 코드
    let postDetailHtml =
        '<div class="border-bottom border-2 p-3">' +
        '<div class="fw-bold h4">' + post.postTitle + '</div>' +
        '<div class="text-secondary">' + post.postDate.replace('T', ' ') + ' | 조회수 ' + post.postHit + ' | ' + post.postAuthor + '</div>' +
        '</div>' +
        '<div class="p-3" style="min-height: 300px" id="postContent">' + post.postContent + '</div>';
    $('#postDetail').html(postDetailHtml);
}

// URL에서 특정 파라미터의 값을 가져오는 함수
function getPostId() {
    return window.location.pathname.split('/').pop();
}

function getPrevPost() {
    let postId = getPostId();
    window.location.href = '/notice/details/' + (parseInt(postId) + 1);
}

function getNextPost() {
    let postId = getPostId();
    window.location.href = '/notice/details/' + (parseInt(postId) - 1);
}

function reDirectNoticeUpdate() {

    let postId = getPostId(); // 이전에 정의한 함수 사용 (getPostId는 페이지의 postId를 가져오는 함수)

    // 쿼리 매개변수를 사용하여 URL 생성
    let redirectUrl = "/noticeModify/"+ postId;

    // 리다이렉트
    window.location.href = redirectUrl;
}

function noticeDelete() {

    let postId = getPostId();

    $.ajax({
        url: '/notice/delete',
        type: 'POST',
        data: { postId: postId },
        dataType: 'json',
        success: function (response) {
            if(response.returnCode === "200") {
                alert('게시글이 성공적으로 삭제되었습니다.');
            } else
                alert('게시글을 삭제하지 못했습니다.')
            window.location.href= "/notice";
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    })
}