$.fn.getTableData = function(node) { // row 是行(一个 string)，node 是 x, y
											// 轴等信息（一个数组）
	var data = [];
	$(this).each(function() {
		var temp = {};
		var $that = $(this);
		node.forEach(function(element) {
			temp[element] = $that.find('.' + element).text();
		})
		data.push(temp);
	})
	return data;
}