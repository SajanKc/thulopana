// Nav Toggler
const toggle = document.querySelector(".toggle");
const navmenu = document.querySelector(".navmenu");
if (toggle) {
	/* Toggle mobile menu */
	function toggleMenu() {
		if (navmenu.classList.contains("active")) {
			navmenu.classList.remove("active");
			toggle.querySelector("a").innerHTML = "<i class='fas fa-bars'></i>";
		} else {
			navmenu.classList.add("active");
			toggle.querySelector("a").innerHTML =
				"<i class='fas fa-times'></i>";
		}
	}
	/* Event Listeners */
	toggle.addEventListener("click", toggleMenu, true);
}

//Theme Changer
var checkbox = document.querySelector("input[name=theme]");
if (checkbox) {
	checkbox.addEventListener("change", function () {
		if (this.checked) {
			trans();
			document.documentElement.setAttribute("data-theme", "light");
		} else {
			trans();
			document.documentElement.setAttribute("data-theme", "dark");
		}
	});
}

let trans = () => {
	document.documentElement.classList.add("transition");
	window.setTimeout(() => {
		document.documentElement.classList.remove("transition");
	}, 1000);
};
