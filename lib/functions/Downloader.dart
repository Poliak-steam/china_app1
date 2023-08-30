import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:path_provider/path_provider.dart';

 Future<TaskStatus> downloadFile() async {
  //create download task
  final task = await DownloadTask(
          url: 'http://spspo.ru/data/3497.pdf',
          updates: Updates.statusAndProgress,
          baseDirectory: BaseDirectory.applicationSupport,
          allowPause: true,
          metaData: 'data for me')
      .withSuggestedFilename(unique: true);

  //settings for notifications
  FileDownloader().configureNotification(
      running: const TaskNotification('Downloading', '{filename}'),
      complete: const TaskNotification('File downloaded', '{filename}'),
      paused: const TaskNotification('Pause', '{filename}'),
      error: const TaskNotification('File can\'t be downloaded', '{filename}'),
      progressBar: true,
      tapOpensFile: true);

  final result = await FileDownloader().download(task,
      onProgress: (progress) => print('Progress: ${progress * 100}%'),
      onStatus: (status) => print('Status: $status'));

  //logs
  switch (result.status) {
    case TaskStatus.complete:
      print('Success!');

    case TaskStatus.canceled:
      print('Download was canceled');

    case TaskStatus.paused:
      print('Download was paused');

    default:
      print('Download not successful ${result.exception}');
  }
  return result.status;
}
