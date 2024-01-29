$(document).ready(function () {
    let postId = getPostId();
    console.log(111, postId)
    loadData(postId);
});

function loadData(postId) {
    // Ajax를 통해 서버에서 데이터 가져오기
    $.ajax({
        url: '/attach/details/select',
        type: 'GET',
        data: {postId: postId},
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let post = response.data;
                console.log(post)
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

function fillPage(post) {
    // 가져온 데이터로 페이지를 동적으로 채우는 코드
    let postDetailHtml =
        '<div class="border-bottom border-2 p-3">' +
        '<div class="fw-bold h4" id="postTitle">' + post.postTitle + '</div>' +
        '<div class="text-secondary">' + post.postDate + ' | 조회수 ' + post.postHit + ' | ' + post.postAuthor + '</div>' +
        '</div>' +
        '<div class="p-3" style="" id="postContent">' + post.postContent + '</div>';
    $('#postDetail').html(postDetailHtml);
}

// URL에서 특정 파라미터의 값을 가져오는 함수
function getPostId() {
    let postId = window.location.pathname.split('/').pop();
    return postId;
}

function getPrevPost() {
    let postId = getPostId();
    let prevUrl = '/attach/details/' + (postId - 1);
    window.location.href = prevUrl;
}

function getNextPost() {
    let postId = getPostId();
    let nextUrl = '/attach/details/' + (postId + 1);
    window.location.href = nextUrl;
}

function attachUpdate() {

    let postId = getPostId(); // 이전에 정의한 함수 사용 (getPostId는 페이지의 postId를 가져오는 함수)

    // 쿼리 매개변수를 사용하여 URL 생성
    let redirectUrl = `/attachWrite?postId=${postId}&postContent=${encodeURIComponent(postContent)}&postTitle=${encodeURIComponent(postTitle)}`;

    // 리다이렉트
    window.location.href = redirectUrl;
}

function attachDelete() {


    let postId =getPostId();

    $.ajax({
        url: '/attach/delete',
        type: 'POST',
        data: { postId: postId },
        dataType: 'json',
        success: function (response) {
            if(response.returnCode === "200") {
                alert('게시글이 성공적으로 삭제되었습니다.');
            } else
                alert('게시글을 삭제하지 못했습니다.')
            window.location.href= "/attach";
        },
        error: function () {
            alert('서버와의 통신 중 오류가 발생했습니다.');
        }
    })
}