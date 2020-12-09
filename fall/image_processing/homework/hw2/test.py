import cv2
file1 = 'img/p1im3_result.png'
file2 = 'img/p1im3_second.png'

img1 = cv2.imread(file1)
img2 = cv2.imread(file2)

assert img1.shape == img2.shape
print('Succeeded')
print(img1.shape)

for x in range(img1.shape[0]):
    for y in range(img1.shape[1]):
        if img1[x][y][0] != img2[x][y][0]:
            print(f"pixel {x}, {y} is not the same.")
            break

        if img1[x][y][1] != img2[x][y][1]:
            print(f"pixel {x}, {y} is not the same.")
            break

        if img1[x][y][2] != img2[x][y][2]:
            print(f"pixel {x}, {y} is not the same.")
            break 
