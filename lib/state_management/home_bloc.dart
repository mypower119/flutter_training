import 'dart:convert';

import 'package:flutter_app/state_management/job_repo.dart';
import 'package:flutter_app/state_management/model/job_overview.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  BehaviorSubject<List<JobDetailOverview>> jobListController = BehaviorSubject<List<JobDetailOverview>>();
  List<JobDetailOverview> listJobOverview = [];

  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>();

  Future<bool> fetchJobList() async {
    try {
      loadingController.add(true);
      var res = await JobRepo.getJobList();
      listJobOverview = res.recCampaingn;
    } catch(e) {
      listJobOverview = [];
      print(e.toString());
    } finally {
      jobListController.add(listJobOverview);
      loadingController.add(false);
    }
    return true;
  }

  void dispose() {
    jobListController.close();
    loadingController.close();
  }
}