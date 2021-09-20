<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
</head>

<body>
	<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast-body">
			${MainMessage}
			<div class="mt-2 pt-2 border-top">
				<button type="button" class="btn btn-primary btn-sm">사용하기</button>
				<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">닫기</button>
			</div>
		</div>
	</div>
</body>

</html>