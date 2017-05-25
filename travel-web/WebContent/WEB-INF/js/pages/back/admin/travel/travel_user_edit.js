$(function(){
	loadData() ;
	$(addBtn).on("click",function(){
		// Ajax异步读取用户信息
		// 将异步加载信息填充到模态窗口的组件之中
		$("#userInfo").modal("toggle") ;	// 显示模态窗口
	}) ;
})
function loadData() {
	createSplitBar(20) ;	// 创建分页控制项
}