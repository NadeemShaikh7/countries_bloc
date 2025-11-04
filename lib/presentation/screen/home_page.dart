import 'package:countires_bloc/presentation/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/country_bloc.dart';
import 'get_by_name_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(title: Text("Get By Name"),onTap: (){
              context.read<CountryBloc>().add(ResetCountriesEvent());
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return GetByNameScreen();
              })).then((value) {
                context.read<CountryBloc>().add(GetAllCountriesEvent());
              },);
            },),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Countries',
          ),
          Expanded(child: BlocBuilder<CountryBloc, CountryState>(builder: (context,state){
            print(state);
            if( state is CountryError){
              return Center(child: Text("error loading data - ${state.error}"));
            }
            else if(state is CountrySuccess){
              return ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  leading: (state.countries[index].flag != null) ? SizedBox(
                    width: 80,
                    height: 40,
                    child: SvgPicture.network(
                      state.countries[index].flag!,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Icon(Icons.flag),
                  title: Text(state.countries[index].name ?? ""),
                  subtitle: Text(state.countries[index].capital ?? ""),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(country: state.countries[index]))).then((onValue){

                    });
                  },
                );
              },
                itemCount: state.countries.length,);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          })),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(GetAllCountriesEvent());
  }
}