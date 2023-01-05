/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 13Oct2022:19:05:48
     Locale           : en_US
     Model Type       : Logistic Regression
     Interval variable: WeekOfMonthClaimed
     Interval variable: PolicyNumber
     Interval variable: RepNumber
     Interval variable: Year
     Class variable   : BasePolicy
     Class variable   : PolicyType
     Class variable   : VehicleCategory
     Class variable   : Fault
     Class variable   : VehiclePrice
     Class variable   : PastNumberOfClaims
     Class variable   : Make
     Class variable   : Month
     Class variable   : AgeOfVehicle
     Class variable   : AgeOfPolicyHolder
     Class variable   : NumberOfSuppliments
     Class variable   : AccidentArea
     Class variable   : MonthClaimed
     Class variable   : Sex
     Class variable   : DayOfWeek
     Class variable   : DayOfWeekClaimed
     Class variable   : FraudFound
     Response variable: FraudFound
     Distribution     : Binary
     Link Function    : Logit
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 13Oct2022:19:05:48
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_15019_0_{110} _temporary_;
   array _beta_15019_0_{110} _temporary_ (    2980.21920903895
           5.58277703155722
           4.33955437425271
                          0
           0.46184207562515
            2.4736719550586
           3.30072802861595
           -2.8584716429538
            2.7421447852858
                          0
                          0
                          0
                          0
                          0
                          0
           3.53909482780207
                          0
          -0.48313970334202
          -1.37677800548741
           -0.2863387121575
           1.20649943503934
          -0.38121855623726
                          0
          -0.83201952572159
          -0.97731295034166
           0.35200261631808
                          0
          -0.94905995825411
           8.72206604034599
          -0.80051056780477
          -2.55228793714737
          -1.50549607433766
          -0.92993223470411
           4.00509261051617
          -0.88894175365699
          -22.5211422080673
           4.10398258516738
          -43.1035252243122
          -0.34799680163905
           2.63767320610715
           -2.9415710304751
          -0.64537695586964
                          0
          -1.46239796879543
          -0.61630677035993
          -2.02342063349084
           1.55165336510357
          -3.33224602479073
           0.54724752353786
           2.04045316717792
          -2.73884363757635
           0.01764157947478
           0.78633590089672
           0.56507622632904
                          0
          -7.35222693468728
           11.5713680387195
           8.28721432416246
           9.79163112879303
           9.67999951391441
           8.69381712458268
           8.32359286678321
                          0
           8.77028419333728
           3.33730649844701
           3.40996580807725
           0.49253232144654
           -0.1918897817989
           0.11192978937691
           0.74217728650232
           0.15861948708163
                          0
           0.00743624576475
          -0.79404706924507
          -0.43005947704475
                          0
          -0.48542974293815
                          0
          -5.64756902423816
           -0.7143399037476
          -0.98119484574996
            -3.591511486283
          -9.47602644946206
          -2.47029844925777
          -4.57811222658945
          -4.30858919749563
          -4.76454721608323
          -1.55999147364878
           0.25348318311748
                          0
          -0.15581482120289
                          0
          -0.32699616843892
             0.174039640428
          -0.71273286353388
          -0.61272369046196
           0.59855924287233
           0.11664355854199
                          0
           0.56774968001955
           0.08810233965709
           4.48785891387336
           5.58662371205148
           0.30597693666698
           0.15522902458547
                          0
           0.55081478019962
          -0.00438683422402
          -0.04618222142969
          -1.47020175079763);

   length _AccidentArea_ $5; drop _AccidentArea_;
   _AccidentArea_ = left(trim(put(AccidentArea,$5.)));
   length _MonthClaimed_ $3; drop _MonthClaimed_;
   _MonthClaimed_ = left(trim(put(MonthClaimed,$3.)));
   length _Sex_ $6; drop _Sex_;
   _Sex_ = left(trim(put(Sex,$6.)));
   length _Month_ $3; drop _Month_;
   _Month_ = left(trim(put(Month,$3.)));
   length _AgeOfPolicyHolder_ $8; drop _AgeOfPolicyHolder_;
   _AgeOfPolicyHolder_ = left(trim(put(AgeOfPolicyHolder,$8.)));
   length _NumberOfSuppliments_ $11; drop _NumberOfSuppliments_;
   _NumberOfSuppliments_ = left(trim(put(NumberOfSuppliments,$11.)));
   length _BasePolicy_ $10; drop _BasePolicy_;
   _BasePolicy_ = left(trim(put(BasePolicy,$10.)));
   length _VehiclePrice_ $16; drop _VehiclePrice_;
   _VehiclePrice_ = left(trim(put(VehiclePrice,$16.)));
   length _DayOfWeek_ $9; drop _DayOfWeek_;
   _DayOfWeek_ = left(trim(put(DayOfWeek,$9.)));
   length _VehicleCategory_ $7; drop _VehicleCategory_;
   _VehicleCategory_ = left(trim(put(VehicleCategory,$7.)));
   length _AgeOfVehicle_ $11; drop _AgeOfVehicle_;
   _AgeOfVehicle_ = left(trim(put(AgeOfVehicle,$11.)));
   length _PolicyType_ $20; drop _PolicyType_;
   _PolicyType_ = left(trim(put(PolicyType,$20.)));
   length _DayOfWeekClaimed_ $9; drop _DayOfWeekClaimed_;
   _DayOfWeekClaimed_ = left(trim(put(DayOfWeekClaimed,$9.)));
   length _Fault_ $13; drop _Fault_;
   _Fault_ = left(trim(put(Fault,$13.)));
   length _PastNumberOfClaims_ $11; drop _PastNumberOfClaims_;
   _PastNumberOfClaims_ = left(trim(put(PastNumberOfClaims,$11.)));
   length _Make_ $9; drop _Make_;
   _Make_ = left(trim(put(Make,$9.)));
   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(RepNumber) 
      or missing(PolicyNumber) 
      or missing(Year) 
      or missing(WeekOfMonthClaimed) 
      then do;
         _badval_ = 1;
         goto skip_15019_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 110; _xrow_15019_0_{_i_} = 0; end;

   _xrow_15019_0_[1] = 1;

   _temp_ = 1;
   select (_BasePolicy_);
      when ('All Perils') _xrow_15019_0_[2] = _temp_;
      when ('Collision') _xrow_15019_0_[3] = _temp_;
      when ('Liability') _xrow_15019_0_[4] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_PolicyType_);
      when ('Sedan - All Perils') _xrow_15019_0_[5] = _temp_;
      when ('Sedan - Collision') _xrow_15019_0_[6] = _temp_;
      when ('Sedan - Liability') _xrow_15019_0_[7] = _temp_;
      when ('Sport - All Perils') _xrow_15019_0_[8] = _temp_;
      when ('Sport - Collision') _xrow_15019_0_[9] = _temp_;
      when ('Utility - All Perils') _xrow_15019_0_[10] = _temp_;
      when ('Utility - Collision') _xrow_15019_0_[11] = _temp_;
      when ('Utility - Liability') _xrow_15019_0_[12] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_VehicleCategory_);
      when ('Sedan') _xrow_15019_0_[13] = _temp_;
      when ('Sport') _xrow_15019_0_[14] = _temp_;
      when ('Utility') _xrow_15019_0_[15] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_Fault_);
      when ('Policy Holder') _xrow_15019_0_[16] = _temp_;
      when ('Third Party') _xrow_15019_0_[17] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_VehiclePrice_);
      when ('20,000 to 29,000') _xrow_15019_0_[18] = _temp_;
      when ('30,000 to 39,000') _xrow_15019_0_[19] = _temp_;
      when ('40,000 to 59,000') _xrow_15019_0_[20] = _temp_;
      when ('60,000 to 69,000') _xrow_15019_0_[21] = _temp_;
      when ('less than 20,000') _xrow_15019_0_[22] = _temp_;
      when ('more than 69,000') _xrow_15019_0_[23] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_PastNumberOfClaims_);
      when ('1') _xrow_15019_0_[24] = _temp_;
      when ('2 to 4') _xrow_15019_0_[25] = _temp_;
      when ('more than 4') _xrow_15019_0_[26] = _temp_;
      when ('none') _xrow_15019_0_[27] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_Make_);
      when ('Accura') _xrow_15019_0_[28] = _temp_;
      when ('BMW') _xrow_15019_0_[29] = _temp_;
      when ('Chevrolet') _xrow_15019_0_[30] = _temp_;
      when ('Dodge') _xrow_15019_0_[31] = _temp_;
      when ('Ford') _xrow_15019_0_[32] = _temp_;
      when ('Honda') _xrow_15019_0_[33] = _temp_;
      when ('Jaguar') _xrow_15019_0_[34] = _temp_;
      when ('Mazda') _xrow_15019_0_[35] = _temp_;
      when ('Mecedes') _xrow_15019_0_[36] = _temp_;
      when ('Mercury') _xrow_15019_0_[37] = _temp_;
      when ('Nisson') _xrow_15019_0_[38] = _temp_;
      when ('Pontiac') _xrow_15019_0_[39] = _temp_;
      when ('Saab') _xrow_15019_0_[40] = _temp_;
      when ('Saturn') _xrow_15019_0_[41] = _temp_;
      when ('Toyota') _xrow_15019_0_[42] = _temp_;
      when ('VW') _xrow_15019_0_[43] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_Month_);
      when ('Apr') _xrow_15019_0_[44] = _temp_;
      when ('Aug') _xrow_15019_0_[45] = _temp_;
      when ('Dec') _xrow_15019_0_[46] = _temp_;
      when ('Feb') _xrow_15019_0_[47] = _temp_;
      when ('Jan') _xrow_15019_0_[48] = _temp_;
      when ('Jul') _xrow_15019_0_[49] = _temp_;
      when ('Jun') _xrow_15019_0_[50] = _temp_;
      when ('Mar') _xrow_15019_0_[51] = _temp_;
      when ('May') _xrow_15019_0_[52] = _temp_;
      when ('Nov') _xrow_15019_0_[53] = _temp_;
      when ('Oct') _xrow_15019_0_[54] = _temp_;
      when ('Sep') _xrow_15019_0_[55] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_AgeOfVehicle_);
      when ('2 years') _xrow_15019_0_[56] = _temp_;
      when ('3 years') _xrow_15019_0_[57] = _temp_;
      when ('4 years') _xrow_15019_0_[58] = _temp_;
      when ('5 years') _xrow_15019_0_[59] = _temp_;
      when ('6 years') _xrow_15019_0_[60] = _temp_;
      when ('7 years') _xrow_15019_0_[61] = _temp_;
      when ('more than 7') _xrow_15019_0_[62] = _temp_;
      when ('new') _xrow_15019_0_[63] = _temp_;

      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_AgeOfPolicyHolder_);
      when ('16 to 17') _xrow_15019_0_[64] = _temp_;
      when ('18 to 20') _xrow_15019_0_[65] = _temp_;
      when ('21 to 25') _xrow_15019_0_[66] = _temp_;
      when ('26 to 30') _xrow_15019_0_[67] = _temp_;
      when ('31 to 35') _xrow_15019_0_[68] = _temp_;
      when ('36 to 40') _xrow_15019_0_[69] = _temp_;
      when ('41 to 50') _xrow_15019_0_[70] = _temp_;
      when ('51 to 65') _xrow_15019_0_[71] = _temp_;
      when ('over 65') _xrow_15019_0_[72] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_NumberOfSuppliments_);
      when ('1 to 2') _xrow_15019_0_[73] = _temp_;
      when ('3 to 5') _xrow_15019_0_[74] = _temp_;
      when ('more than 5') _xrow_15019_0_[75] = _temp_;
      when ('none') _xrow_15019_0_[76] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_AccidentArea_);
      when ('Rural') _xrow_15019_0_[77] = _temp_;
      when ('Urban') _xrow_15019_0_[78] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_MonthClaimed_);
      when ('Apr') _xrow_15019_0_[79] = _temp_;
      when ('Aug') _xrow_15019_0_[80] = _temp_;
      when ('Dec') _xrow_15019_0_[81] = _temp_;
      when ('Feb') _xrow_15019_0_[82] = _temp_;
      when ('Jan') _xrow_15019_0_[83] = _temp_;
      when ('Jul') _xrow_15019_0_[84] = _temp_;
      when ('Jun') _xrow_15019_0_[85] = _temp_;
      when ('Mar') _xrow_15019_0_[86] = _temp_;
      when ('May') _xrow_15019_0_[87] = _temp_;
      when ('Nov') _xrow_15019_0_[88] = _temp_;
      when ('Oct') _xrow_15019_0_[89] = _temp_;
      when ('Sep') _xrow_15019_0_[90] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_Sex_);
      when ('Female') _xrow_15019_0_[91] = _temp_;
      when ('Male') _xrow_15019_0_[92] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_DayOfWeek_);
      when ('Friday') _xrow_15019_0_[93] = _temp_;
      when ('Monday') _xrow_15019_0_[94] = _temp_;
      when ('Saturday') _xrow_15019_0_[95] = _temp_;
      when ('Sunday') _xrow_15019_0_[96] = _temp_;
      when ('Thursday') _xrow_15019_0_[97] = _temp_;
      when ('Tuesday') _xrow_15019_0_[98] = _temp_;
      when ('Wednesday') _xrow_15019_0_[99] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _temp_ = 1;
   select (_DayOfWeekClaimed_);
      when ('Friday') _xrow_15019_0_[100] = _temp_;
      when ('Monday') _xrow_15019_0_[101] = _temp_;
      when ('Saturday') _xrow_15019_0_[102] = _temp_;
      when ('Sunday') _xrow_15019_0_[103] = _temp_;
      when ('Thursday') _xrow_15019_0_[104] = _temp_;
      when ('Tuesday') _xrow_15019_0_[105] = _temp_;
      when ('Wednesday') _xrow_15019_0_[106] = _temp_;
      otherwise do; _badval_ = 1; goto skip_15019_0; end;
   end;

   _xrow_15019_0_[107] = WeekOfMonthClaimed;

   _xrow_15019_0_[108] = PolicyNumber;

   _xrow_15019_0_[109] = RepNumber;

   _xrow_15019_0_[110] = Year;

   do _i_=1 to 110;
      _linp_ + _xrow_15019_0_{_i_} * _beta_15019_0_{_i_};
   end;

   skip_15019_0:
   length I_FraudFound $3;
   label I_FraudFound = 'Into: FraudFound';
   array _levels_15019_{2} $ 3 _TEMPORARY_ ('Yes'
   ,'No'
   );
   label P_FraudFoundYes = 'Predicted: FraudFound=Yes';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_FraudFoundYes = 1 / (1+exp(-_linp_));
      end; else do;
         P_FraudFoundYes = exp(_linp_) / (1+exp(_linp_));
      end;
      P_FraudFoundNo = 1 - P_FraudFoundYes;
      if P_FraudFoundYes >= 0.5                  then do;
         I_FraudFound = _levels_15019_{1};
      end; else do;
         I_FraudFound = _levels_15019_{2};
      end;
   end; else do;
      _linp_ = .;
      P_FraudFoundYes = .;
      P_FraudFoundNo = .;
      I_FraudFound = ' ';
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'I_FraudFound'n 'P_FraudFoundYes'n 'P_FraudFoundNo'n;
length 'I_FraudFound_15019'n $3;
      'I_FraudFound_15019'n='I_FraudFound'n;
'P_FraudFoundYes_15019'n='P_FraudFoundYes'n;
'P_FraudFoundNo_15019'n='P_FraudFoundNo'n;
   /*------------------------------------------*/