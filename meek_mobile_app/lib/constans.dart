import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

//API Routes

const String ROOTURL = "https://7431a83db8a2.ngrok.io/InvestmentApi/";

const String GetPitchesNotReviewedByCategory = ROOTURL +
    "API/Application/Get"
        "PitchesNotReviewedByCategory";
const String GetPitchReviewedByCategory = ROOTURL +
    "API/Application/GetPitch"
        "esReviewedByCategory";
const String GetPitch = ROOTURL +
    "API/Application/GetPitches";
const String GetPitchesReviewedSuccessfully = ROOTURL +
    "API/Application/GetP"
        "itchesReviewedisSuccess";
const String GetPitchesNotReviewed = ROOTURL +
    "API/Application/GetPitchesNot"
        "Reviewed";
const String GetInvestorRequirements = ROOTURL +
    "API/Application/GetInvestor"
        "Requirements";

//String ROOTURL = "http://localhost/InvestmentApi/";

// const String ROOTURL = "https://efc773cbe0f0.ngrok.io/InvestmentApi/";

// const String GetPitchesNotReviewedByCategory3 = ROOTURL +
//     "API/Application/Get"
//         "PitchesNotReviewedByCategory";
// const String GetPitchReviewedByCategory2 = ROOTURL +
//     "API/Application/GetPitch"
//         "esReviewedByCategory";
// const String GetPitchesReviewedSuccessfully = ROOTURL +
//     "API/Application/GetP"
//         "itchesReviewedisSuccess";
// const String GetPitchesNotReviewed = ROOTURL +
//     "API/Application/GetPitchesNot"
//         "Reviewed";
// const String GetInvestorRequirements = ROOTURL +
//     "API/Application/GetInvestor"
//         "Requirements";

const String UserLogin = ROOTURL + "API/User/UserLogin";
const String UserRegistration = ROOTURL + "API/User/UserRegistration";
const String InvestorGetPitchById = ROOTURL + "API/Application/GetPitchById";
const String ReviewerGetPitchById = ROOTURL + "API/Application/GetPitchById";
const String AddInvestorRequirements = ROOTURL +
    "API/Application/AddInvestor"
        "Requirements";
const String MeetingSetUP = ROOTURL + "API/Application/ChoosePitch";
const String AddingPitch = ROOTURL + "API/Application/AddPitch";
const String AddingAChoosenPitchToInvestor = ROOTURL +
    "API/Application/Choos"
        "ePitch";
const String AddingMeetingDetails = ROOTURL +
    "API/Application/AddMeetingDeta"
        "ils";
const String GetUserPitch = ROOTURL + "API/Application/GetUsersPitch";
const String UpdatePitchDescion = ROOTURL +
    "API/Application/UpdatePitchDecis"
        "ion";
const String GetPitchProgress = ROOTURL + "API/Application/GetProgress";
const String GetMeetingDetails = ROOTURL + "API/Application/GetMeetingDetails";
const String GetMeetingPitch = ROOTURL + "API/Application/GetMeetingPitches";
const String AddBid = ROOTURL + "API/Application/BidEquity";
const String GetBidDetails = ROOTURL + "API/Application/GetBidDetails";
const String UpdateInnovatorBidDecision = ROOTURL +
    "API/Application/UpdateIn"
        "novatorDecision";
const String CounterInnovatorBidDecision = ROOTURL +
    "API/Application/Counter"
        "Offer";
const String UpdateInvestorBidDecision = ROOTURL +
    "API/Application/InvestorU"
        "pdateBid";
const String SavedLaterPitch = ROOTURL + "API/Application/GetSavedPitches";
const String GetUserDetails = ROOTURL + "API/User/GetUserDetails";

const String GetRewards = ROOTURL + "API/GetRewards";
