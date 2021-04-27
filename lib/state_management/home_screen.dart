import 'package:flutter/material.dart';
import 'package:flutter_app/state_management/home_bloc.dart';
import 'package:flutter_app/state_management/model/job_overview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static newInstance() => Provider<HomeBloc>(
    create: (_) => HomeBloc(),
    dispose: (_, _bloc) => _bloc.dispose(),
    child: HomeScreen(),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = Provider.of<HomeBloc>(context, listen: false);
    _homeBloc.jobListController.listen((value) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BloC - Provider - RXDart'),),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _homeBloc.fetchJobList,
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<JobDetailOverview>>(
                    stream: _homeBloc.jobListController,
                    initialData: _homeBloc.listJobOverview,
                    builder: (context, snap) {
                      return ListView.builder(
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) {
                            var item = snap.data![index];
                            return Container(
                              padding: EdgeInsets.all(18),
                              child: Text(item.campaignName??''),
                            );
                          });
                    },
                  ),
                )
              ],
            ),
          ),
          StreamBuilder<bool>(
            stream: _homeBloc.loadingController,
            builder: (context, snap) {
              if(snap.hasData) {
                return snap.data! ? Center(
                  child: CircularProgressIndicator(),
                ) : Container();
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
