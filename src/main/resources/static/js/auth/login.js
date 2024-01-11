let login = {}

login.fn = {

    init: function() {
        login.fn.ready();
    },

    ready : function() {
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
    }
};

login.fn.init();