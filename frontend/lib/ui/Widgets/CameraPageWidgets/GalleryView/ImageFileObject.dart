class FileObject{
  List<String> files;
  String folder;

  FileObject({this.files, this.folder});

  FileObject.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}