import 'dart:io';
import 'package:background_downloader/background_downloader.dart';

import '../vars/variables.dart';


Future<TaskStatus> downloadFile() async {
  String downloadStatus = '';
  //create download task
  final task = await DownloadTask(
          url: 'https://bioyar.by/wp/wp-content/uploads/bogdanova.pdf',
          updates: Updates.statusAndProgress,
          baseDirectory: Platform.isAndroid
              ? BaseDirectory.applicationSupport
              : BaseDirectory.applicationDocuments,
          allowPause: true,
          metaData: 'data for me')
      .withSuggestedFilename(unique: true);

  //settings for notifications
  if (Platform.isAndroid) {
    FileDownloader().configureNotification(
        running: const TaskNotification('Downloading', '{filename}'),
        complete: const TaskNotification('File downloaded', '{filename}'),
        paused: const TaskNotification('Pause', '{filename}'),
        error:
            const TaskNotification('File can\'t be downloaded', '{filename}'),
        progressBar: false,
        tapOpensFile: false);
  } else {
    FileDownloader().registerCallbacks(taskStatusCallback: (status) {
      print('status');
    });
  }

  final result = await FileDownloader().download(task,
      onProgress: (progress) => print('Progress: ${progress * 100}%'),
      onStatus: (status) {
        switch (status) {
          case TaskStatus.running:
            {
              downloadStatus = 'Downloading';
            }
            break;

          case TaskStatus.paused:
            {
              downloadStatus = 'Paused';
            }
            break;
          case TaskStatus.failed:
            {
              downloadStatus = 'File can\'t be downloaded';
            }
            break;
          case TaskStatus.complete:
            {
              downloadStatus = 'File downloaded';
            }
            break;

          default:
            {downloadStatus = '';}
            break;
        };
        if(downloadStatus != '') {
          service.showNotification(
              id: int.parse(task.taskId) % 1000000000, title: downloadStatus, body: task.filename);
        }


      });

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
