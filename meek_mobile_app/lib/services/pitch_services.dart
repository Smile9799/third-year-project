import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/model/pitch_response.dart';
import 'package:http/http.dart' as http;

class MEEKServices{
  static const ROUTE = 'http://192.168.43.108/InvestmentApi/';
  static const ADDPITCH = ROUTE +'API/Application/AddPitch';


  Future<PitchResponse> addPitch(Pitch newpitch) async{
    final response = await http.post(MEEKServices.ADDPITCH,
        body:{
          "id": 1,
          "PitchName": newpitch.title,
          "ManagementLocation": newpitch.location,
          "Industry": newpitch.industry,
          "Stage": newpitch.stage,
          "IdealInvestorRole": newpitch.investorRole,
          "Budget": newpitch.budget,
          "MinimumInvestmentPerInvestor": newpitch.minimumAmountPerInvestor,
          "MaximumInvestmentPerInvestor": newpitch.maximumAmountPerInvestor,
          "PreviousRoundRaise": newpitch.amountRaised,
          "ShortSummary": newpitch.shortSummary,
          "TheBusiness": newpitch.theBusiness,
          "TheMarket": newpitch.theMarket,
          "ProgressProof": newpitch.progressProof,
          "Objectives": newpitch.objectives,
          "VideoLink": newpitch.videoUrlLink
        });
    if(response.statusCode == 200){
        final String responseString = response.body;
        return pitchResponseFromJson(responseString);
    }
    else{
      return null;
    }
  }
}