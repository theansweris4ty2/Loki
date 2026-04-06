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
	original_file_name: cstring
	new_file_name: cstring
	width, height, ch: i32
	buf: [100]byte
	fmt.println("what is the name of file you wish to edit")
	o, _ := os.read(os.stdin, buf[:])
	name := strings.trim_space(string(buf[:o]))
	original_file_name = fmt.ctprintf(name)

	img := stb.load(original_file_name, &width, &height, &ch, 0)
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
	buf2: [100]byte
	n, _ := os.read(os.stdin, buf2[:])
	color := strings.trim_space(string(buf2[:n]))

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
			img[(i * width + j) * ch + i32(change)] = 255
		}
	}

	fmt.println("which other color do you want to change?")
	buf4: [100]byte
	c, _ := os.read(os.stdin, buf4[:])
	color2 := strings.trim_space(string(buf4[:c]))
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
	}


	fmt.println("what is the name of new file")
	buf3: [100]byte
	m, _ := os.read(os.stdin, buf3[:])
	new_name := strings.trim_space(string(buf3[:m]))
	new_file_name = fmt.ctprintf(new_name)

	// stb.flip_vertically_on_write(true)
	stb.write_png(new_file_name, width, height, ch, img, width * ch)
	stb.image_free(img)
}


// TODO Finish crop image function

// crop_image :: proc() {
// 	width, height, ch: i32
// 	img := stb.load("cthulhu.png", &width, &height, &ch, 0)
// 	defer stb.image_free(img)
// 	new_width: i32 = 300
// 	new_height: i32 = 200
// 	new_channels: i32 = 3
// }
