let login = {}

login.fn = {
    // 초기화
    init: function() {
        login.fn.ready();
    },

    ready : function() {

        // 로그인 버튼 클릭
        $(document).on('click', '#login', function() {

            let id = $('#username');
            let pwd = $('#password');

            if (id.val() === "") {
                alert('사용자 아이디를 입력하여 주십시오');
                id.focus();
                return;
            }

            if (pwd.val() === "") {
                alert('비밀번호를 입력하여 주십시오');
                pwd.focus();
                return;
            }

            $('#frm').submit();
        });

        // 엔터키 입력
        $(document).on('keydown', function (event) {
            let key = event.which || event.keyCode;
            if (key == 13) {
                let id = $('#username');
                let pwd = $('#password');

                if (id.val() === "") {
                    alert('사용자 아이디를 입력하여 주십시오');
                    id.focus();
                    return;
                }

                if (pwd.val() === "") {
                    alert('비밀번호를 입력하여 주십시오');
                    pwd.focus();
                    return;
                }

                $('#frm').submit();
                return;
            }
        })
    }
};

login.fn.init();