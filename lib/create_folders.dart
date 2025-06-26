import 'dart:io';

void main() {
  // مسار المشروع الحالي
  final projectPath = "${Directory.current.path}/lib";

  // قائمة المجلدات التي سيتم إنشاؤها
  final directories = [
    '$projectPath/core/utils',
    '$projectPath/data/models',
    '$projectPath/data/repositories',
    '$projectPath/data/datasources',
    '$projectPath/domain/entities',
    '$projectPath/domain/repositories',
    '$projectPath/domain/usecases',
    '$projectPath/presentation/pages',
    '$projectPath/presentation/widgets',
  ];

  // حلقة لإنشاء كل المجلدات
  for (var dir in directories) {
    final directory = Directory(dir);

    // التحقق من وجود المجلد، وإن لم يكن موجودًا يتم إنشاؤه
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created: $dir ✔');
    } else {
      print('Directory already exists: $dir ');
    }
  }

  print('تم إنشاء المجلدات بنجاح ✔');
}
