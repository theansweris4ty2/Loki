package Loki


import "core:c"
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import stb "vendor:stb/image"

Color_Shift :: enum {
	red,
	green,
	blue,
}

main :: proc() {

	color_change()

}


color_change :: proc() {

	change: Color_Shift
	csp: ^Color_Shift = &change
	width, height, ch: i32
	img := stb.load("logo.jpg", &width, &height, &ch, 0)
	if img == nil {
		fmt.println("Error in loading file")
	}

	// fmt.printf(
	// 	"Loaded image with a width of %dpx, height of %dpx, channels of %d \n",
	// 	width,
	// 	height,
	// 	ch,
	// )
	fmt.println("which color do you want to change?")
	buf: [100]byte
	os.read(os.stdin, buf[:])
	color := string(buf[:])


	switch color {
	case "red":
		csp^ = red
	case "green":
		csp^ = green
	case "blue":
		csp^ = blue
	}


	for i: i32 = 0; i < height; i += 1 {
		for j: i32 = 0; j < width; j += 1 {
			img[(i * width + j) * ch + i32(change)] = 255
		}
	}
	// stb.flip_vertically_on_write(true)
	stb.write_png("new_logo.png", width, height, ch, img, width * ch)
	stb.image_free(img)
}
