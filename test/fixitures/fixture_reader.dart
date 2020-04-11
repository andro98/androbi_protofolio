import 'dart:io';

String fixture(String name) => File('test/fixitures/$name').readAsStringSync();
