//回到顶部按钮
window.addEventListener("load",function() {
	var btn = document.getElementById("back_top");
	//用于向指定元素添加事件句柄。
	btn.addEventListener("mouseover",moveIn, false);
	btn.addEventListener("mouseout", moveOut, false);

	function moveIn() {
		btn.style.color = "#ffffff"; //修改的是内联样式，具有最高的优先级;
		btn.style.textIndent = "0em";
		btn.style.opacity = "1";
	}
	function moveOut() {
		btn.style.textIndent = "-9999em";
		btn.style.opacity = "0.5";
	}
	//移动到页面顶部
	function goTop(acceleration, time) { //修改参数可调整返回顶部的速度
		acceleration = acceleration || 0.1;
		time = time || 10;
		var speed = 1 + acceleration;
		function getScrollTop() { //取得滚动条的竖直距离
			return document.documentElement.scrollTop || document.body.scrollTop;
		}
		function setScrollTop(value) { //设置滚动条的竖直距离,实现效果的关键就是在很短的间隔时间内不断地修改滚动条的竖直距离,以实现滚动效果
			document.documentElement.scrollTop = value;
			document.body.scrollTop = value;
		}
		window.onscroll = function() {
			var scrollTop = getScrollTop();
			if (scrollTop > 100) { //判断滚动条距离窗口顶部多远时显示出来，这里是100px
				btn.style.display = "block";
		} else {
			btn.style.display = "none";
			}
		};
		btn.onclick = function () {
			var timer = setInterval(function() {
				setScrollTop(Math.floor(getScrollTop() / speed)); //取得滚动条竖直距离，除以speed后再给滚动条设置竖直距离
				if (getScrollTop() == 0)
					clearInterval(timer);
			}, time);
		};
	}
	goTop(0.2, 20);
}, false); 