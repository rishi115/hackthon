import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController descriptionController = TextEditingController();
  List<String> imageList = [];
  void selectImages() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counsellor"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/icons8-student-48.png'),
          tooltip: 'Back to Home Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelHeader('Image'),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Upload image ',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Color(0xFF233657),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                selectImages();
              },
              child: Container(
                // height: MediaQuery.of(context).size.height * .09,
                // width: MediaQuery.of(context).size.width * .22,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF233657).withOpacity(0.5),
                  ),
                  color: Color(0xFFEFF5FF),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.upload,
                      color: Color(0xFF517BC8),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Upload',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Color(0xFF517BC8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            imageList.isNotEmpty
                ? SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              child: Wrap(
                direction: Axis.horizontal,
                children: imageList.map((item) {
                  return Stack(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        margin: const EdgeInsets.only(
                          top: 10.0,
                          right: 5.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF233657)
                                .withOpacity(0.5),
                          ),
                        ),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context,
                              Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress
                                    .expectedTotalBytes !=
                                    null
                                    ? loadingProgress
                                    .cumulativeBytesLoaded /
                                    loadingProgress
                                        .expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              imageList.remove(item);
                            });
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Color(0xFFFF5454),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
                : SizedBox.shrink(),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Add Blog',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Color(0xFF233657),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 200,
              child: TextField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 100,
                // maxLines: 6,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF233657).withOpacity(0.5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF233657),
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Product Description...',
                  hintStyle: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF233657).withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row labelHeader(String label) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: Color(0xFF233657),
        ),
      ),
      Text(
        '*',
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: Color(0xFFFF5454),
        ),
      ),
    ],
  );
}