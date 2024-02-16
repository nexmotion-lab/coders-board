let notice = {};
let page = 1;

$(document).ready(function () {
    loadData(page);
});

function loadData(current_page) {
    loadPagination(current_page);
    console.log("current_page: " , current_page);

    $.ajax({
        url: '/notice/select',
        type: 'GET',
        data: { page: current_page, pageSize: 10 },
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let table = $('#posts');
                let noticeList = response.data;

                table.empty();
                for (let i = 0; i < noticeList.length; i++) {
                    let post = noticeList[i];
                    let row = '<tr onclick="location.href=\'notice/details/' + post.postId + '\'">' +
                        '<td>' + post.postId + '</td>' +
                        '<td>' + post.postTitle + '</td>' +
                        '<td>' + post.postAuthor + '</td>' +
                        '<td>' + post.postDate.split('T')[0].replace(/-/g, '.') + '</td>' +
                        '<td></td>' +
                        '<td>' + post.postHit + '</td>' +
                        '</tr>';
                    table.append(row);
                }
            } else {
                alert('데이터 가져오기 실패');
            }
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.1');
        }
    });
}

function loadPagination(page) {
    $.ajax({
        url: '/paging',
        type: 'GET',
        data: { page: page },
        dataType: 'json',
        success: function (response) {
            if (response.returnCode === "200") {
                let pagination = $('#page');
                let data = response.data;
                // let pageNum;

                pagination.empty();

                pagination.append('<li class="page-item"><a class="page-link" href="#" onclick="movePage(' + 1 + ')">' + '<<' + '</a></li>');
                pagination.append('<li class="page-item"><a class="page-link" href="#" onclick="prevPage(' + page + ')">' + '<' + '</a></li>');
                for(let i = data.startPage; i <= data.endPage; i++) {
                    // pageNum = '<li class="page-item"><a class="page-link" href="#" onclick="movePage(' + i + ')">' + i + '</a></li>';
                    pagination.append('<li class="page-item"><a class="page-link" href="#" onclick="movePage(' + i + ')">' + i + '</a></li>');
                }
                pagination.append('<li class="page-item"><a class="page-link" href="#" onClick="nextPage(' + page + ')">' + '>' + '</a></li>');
                pagination.append('<li class="page-item"><a class="page-link" href="#" onClick="movePage(' + data.totalPageCnt + ')">' + '>>' + '</a></li>');

            } else {
                alert('데이터 가져오기 실패');
            }
        },
        error: function() {
            alert('서버와의 통신 중 오류가 발생했습니다.2');
        }
    });
}

function movePage(current_page) {
    console.log("current_page: " , current_page);
    loadData(current_page);
}

function prevPage(current_page) {
    console.log("current_page: " , current_page);
    if (current_page > 1) {
        loadData(current_page - 1);
    }
}

function nextPage(current_page) {
    console.log("current_page: " , current_page);
    loadData(current_page + 1);
}