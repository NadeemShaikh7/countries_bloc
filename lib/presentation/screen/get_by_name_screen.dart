import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/country_bloc.dart';
import 'details_screen.dart';

class GetByNameScreen extends StatefulWidget{
  final TextEditingController textEditingController = TextEditingController();
  GetByNameScreen({super.key});


  @override
  State<GetByNameScreen> createState() {
    return _GetByNameState();
  }
}

class _GetByNameState extends State<GetByNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Get By Name"),
      ),
      body: Column(
        children: [
          TextField(controller: widget.textEditingController,onSubmitted: (value){
            // context.read<CountryBloc>().close();
            context.read<CountryBloc>().add(GetCountryEvent(value));
          },),
          SizedBox(height: 20,),
          Expanded(child: BlocBuilder<CountryBloc, CountryState>(builder: (context,state){
            if (state is CountryInitial) {
              return Center(child: Text('Search for a country to begin.'));
            }if( state is CountryError){
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
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsScreen(country: state.countries[index])));
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.textEditingController.dispose();
  }
}