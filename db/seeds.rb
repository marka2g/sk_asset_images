# setup - refactor/ cleanup, yuk!

def grab_test_files(id)
	path = "#{Rails.root.join('public/test_images')}/#{id}/"
	file_name = Dir.entries("#{path}").last
	the_file = File.open(path + file_name)
	[the_file, file_name]
end

ImageType.create(name: 'biopic', crop_x: 144, crop_y: 200)
ImageType.create(name: 'headshot', crop_x: 75, crop_y: 85)
ImageType.create(name: 'boxcover', crop_x: 144, crop_y: 200)
ImageType.create(name: 'promo', crop_x: 300, crop_y: 200)

Celeb.create(name: 'Kevin Spacey')
Celeb.create(name: 'Keanu Reeves')
Celeb.create(name: 'Bob Marley')
Title.create(name: 'Breaking Bad')
Title.create(name: 'Emmanuelle')
Title.create(name: 'Game of Thrones')

c1 = Celeb.find 1
c2 = Celeb.find 2
c3 = Celeb.find 3
t1 = Title.find 1
t2 = Title.find 2
t3 = Title.find 3

new_image_c1 = c1.images.build
test_file_c1, file_name_c1 = grab_test_files(new_image_c1.imageable_id)
new_image_c1.name = "kevin_spacey_base_image"
new_image_c1.asset_image = file_name_c1
new_image_c1.save
new_image_c1.asset_image.store!(test_file_c1)

new_image_c2 = c2.images.build
test_file_c2, file_name_c2 = grab_test_files(new_image_c2.imageable_id)
new_image_c2.name = "keanu_reeves_base_image"
new_image_c2.asset_image = file_name_c2
new_image_c2.save
new_image_c2.asset_image.store!(test_file_c2)

new_image_c3 = c3.images.build
test_file_c3, file_name_c3 = grab_test_files(new_image_c3.imageable_id)
new_image_c3.name = "bob_marley_base_image"
new_image_c3.asset_image = file_name_c3
new_image_c3.save
new_image_c3.asset_image.store!(test_file_c3)

new_image_t1 = t1.images.build
test_file_t1, file_name_t1 = grab_test_files(new_image_t1.imageable_id + 3)
new_image_t1.name = "breaking_bad_base_image"
new_image_t1.asset_image = file_name_t1
new_image_t1.save
new_image_t1.asset_image.store!(test_file_t1)

new_image_t2 = t2.images.build
test_file_t2, file_name_t2 = grab_test_files(new_image_t2.imageable_id + 3)
new_image_t2.name = "emmanuelle_base_image"
new_image_t2.asset_image = file_name_t2
new_image_t2.save
new_image_t2.asset_image.store!(test_file_t2)

new_image_t3 = t3.images.build
test_file_t3, file_name_t3 = grab_test_files(new_image_t3.imageable_id + 3)
new_image_t3.name = "game_of_thrones_base_image"
new_image_t3.asset_image = file_name_t3
new_image_t3.save
new_image_t3.asset_image.store!(test_file_t3)

i1 = Image.find 1
i2 = Image.find 2
i3 = Image.find 3
i4 = Image.find 4
i5 = Image.find 5
i6 = Image.find 6

it1 = ImageType.find 1
it2 = ImageType.find 2
it3 = ImageType.find 3
it4 = ImageType.find 4

i1.image_types << [it1]
i2.image_types << [it2]
i3.image_types << [it3]
i4.image_types << [it4]
i5.image_types << [it1]
i6.image_types << [it2]
