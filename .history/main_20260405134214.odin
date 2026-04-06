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
	change2: Color_Shift
	color_value: int
	csp: ^Color_Shift = &change
	width, height, ch: i32
	img := stb.load("logo.jpg", &width, &height, &ch, 0)
	if img == nil {
		fmt.println("Error in loading file")
	}

	fmt.printf(
		"Loaded image with a width of %dpx, height of %dpx, channels of %d \n",
		width,
		height,
		ch,
	)
	fmt.println("which color do you want to change?")
	buf: [100]byte
	n, _ := os.read(os.stdin, buf[:])
	color := strings.trim_space(string(buf[:n]))

	fmt.println("what is the color value")
	buf3: [100]byte
	m, _ := os.read(os.stdin, buf3[:])
	num := strings.trim_space(string(buf3[:m]))
	number, ok := strconv.parse_int(num)
	fmt.printf("%d", number)


	switch color {
	case "red":
		change = .red
	case "green":
		change = .green
	case "blue":
		change = .blue
	}


	for i: i32 = 0; i < height; i += 1 {
		for j: i32 = 0; j < width; j += 1 {
			img[(i * width + j) * ch + i32(change)] = number
		}
	}

	fmt.println("which other color do you want to change?")
	buf2: [100]byte
	i, _ := os.read(os.stdin, buf2[:])
	color2 := strings.trim_space(string(buf2[:i]))
	if len(color2) == 0 {
		fmt.println("no second color selected")
	} else {
		switch color2 {
		case "red":
			change2 = .red
		case "green":
			change2 = .green
		case "blue":
			change2 = .blue
		}
		for i: i32 = 0; i < height; i += 1 {
			for j: i32 = 0; j < width; j += 1 {
				img[(i * width + j) * ch + i32(change2)] = 255
			}
		}
		// fmt.println("which other color do you want to change?")
		// buf3: [100]byte
		// j, _ := os.read(os.stdin, buf3[:])
		// color3 := strings.trim_space(string(buf2[:j]))
		// if len(color3) == 0 {
		// 	fmt.println("no third color selected")
		// } else {
		// 	switch color3 {
		// 	case "red":
		// 		change3 = .red
		// 	case "green":
		// 		change3 = .green
		// 	case "blue":
		// 		change3 = .blue
		// 	}
		// 	for i: i32 = 0; i < height; i += 1 {
		// 		for j: i32 = 0; j < width; j += 1 {
		// 			img[(i * width + j) * ch + i32(change3)] = 255
		// 		}
		// 	}

		// }
		// stb.flip_vertically_on_write(true)
		stb.write_png("new_logo2.png", width, height, ch, img, width * ch)
		stb.image_free(img)
	}
}
