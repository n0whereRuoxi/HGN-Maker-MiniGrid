( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4851 - OBJ
      ?auto_4850 - LOCATION
    )
    :vars
    (
      ?auto_4853 - LOCATION
      ?auto_4854 - CITY
      ?auto_4852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4853 ?auto_4854 ) ( IN-CITY ?auto_4850 ?auto_4854 ) ( not ( = ?auto_4850 ?auto_4853 ) ) ( OBJ-AT ?auto_4851 ?auto_4853 ) ( TRUCK-AT ?auto_4852 ?auto_4850 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4852 ?auto_4850 ?auto_4853 ?auto_4854 )
      ( !LOAD-TRUCK ?auto_4851 ?auto_4852 ?auto_4853 )
      ( !DRIVE-TRUCK ?auto_4852 ?auto_4853 ?auto_4850 ?auto_4854 )
      ( !UNLOAD-TRUCK ?auto_4851 ?auto_4852 ?auto_4850 )
      ( DELIVER-1PKG-VERIFY ?auto_4851 ?auto_4850 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4858 - OBJ
      ?auto_4857 - LOCATION
    )
    :vars
    (
      ?auto_4860 - LOCATION
      ?auto_4861 - CITY
      ?auto_4859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4860 ?auto_4861 ) ( IN-CITY ?auto_4857 ?auto_4861 ) ( not ( = ?auto_4857 ?auto_4860 ) ) ( OBJ-AT ?auto_4858 ?auto_4860 ) ( TRUCK-AT ?auto_4859 ?auto_4857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4859 ?auto_4857 ?auto_4860 ?auto_4861 )
      ( !LOAD-TRUCK ?auto_4858 ?auto_4859 ?auto_4860 )
      ( !DRIVE-TRUCK ?auto_4859 ?auto_4860 ?auto_4857 ?auto_4861 )
      ( !UNLOAD-TRUCK ?auto_4858 ?auto_4859 ?auto_4857 )
      ( DELIVER-1PKG-VERIFY ?auto_4858 ?auto_4857 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4872 - OBJ
      ?auto_4873 - OBJ
      ?auto_4871 - LOCATION
    )
    :vars
    (
      ?auto_4875 - LOCATION
      ?auto_4876 - CITY
      ?auto_4874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4875 ?auto_4876 ) ( IN-CITY ?auto_4871 ?auto_4876 ) ( not ( = ?auto_4871 ?auto_4875 ) ) ( OBJ-AT ?auto_4873 ?auto_4875 ) ( OBJ-AT ?auto_4872 ?auto_4875 ) ( TRUCK-AT ?auto_4874 ?auto_4871 ) ( not ( = ?auto_4872 ?auto_4873 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4872 ?auto_4871 )
      ( DELIVER-1PKG ?auto_4873 ?auto_4871 )
      ( DELIVER-2PKG-VERIFY ?auto_4872 ?auto_4873 ?auto_4871 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4878 - OBJ
      ?auto_4879 - OBJ
      ?auto_4877 - LOCATION
    )
    :vars
    (
      ?auto_4881 - LOCATION
      ?auto_4880 - CITY
      ?auto_4882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4881 ?auto_4880 ) ( IN-CITY ?auto_4877 ?auto_4880 ) ( not ( = ?auto_4877 ?auto_4881 ) ) ( OBJ-AT ?auto_4878 ?auto_4881 ) ( OBJ-AT ?auto_4879 ?auto_4881 ) ( TRUCK-AT ?auto_4882 ?auto_4877 ) ( not ( = ?auto_4879 ?auto_4878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4879 ?auto_4878 ?auto_4877 )
      ( DELIVER-2PKG-VERIFY ?auto_4878 ?auto_4879 ?auto_4877 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4893 - OBJ
      ?auto_4892 - LOCATION
    )
    :vars
    (
      ?auto_4895 - LOCATION
      ?auto_4896 - CITY
      ?auto_4894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4895 ?auto_4896 ) ( IN-CITY ?auto_4892 ?auto_4896 ) ( not ( = ?auto_4892 ?auto_4895 ) ) ( OBJ-AT ?auto_4893 ?auto_4895 ) ( TRUCK-AT ?auto_4894 ?auto_4892 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4894 ?auto_4892 ?auto_4895 ?auto_4896 )
      ( !LOAD-TRUCK ?auto_4893 ?auto_4894 ?auto_4895 )
      ( !DRIVE-TRUCK ?auto_4894 ?auto_4895 ?auto_4892 ?auto_4896 )
      ( !UNLOAD-TRUCK ?auto_4893 ?auto_4894 ?auto_4892 )
      ( DELIVER-1PKG-VERIFY ?auto_4893 ?auto_4892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4983 - OBJ
      ?auto_4984 - OBJ
      ?auto_4985 - OBJ
      ?auto_4982 - LOCATION
    )
    :vars
    (
      ?auto_4988 - LOCATION
      ?auto_4987 - CITY
      ?auto_4989 - LOCATION
      ?auto_4986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4988 ?auto_4987 ) ( IN-CITY ?auto_4982 ?auto_4987 ) ( not ( = ?auto_4982 ?auto_4988 ) ) ( OBJ-AT ?auto_4985 ?auto_4988 ) ( IN-CITY ?auto_4989 ?auto_4987 ) ( not ( = ?auto_4982 ?auto_4989 ) ) ( OBJ-AT ?auto_4984 ?auto_4989 ) ( OBJ-AT ?auto_4983 ?auto_4989 ) ( TRUCK-AT ?auto_4986 ?auto_4982 ) ( not ( = ?auto_4983 ?auto_4984 ) ) ( not ( = ?auto_4983 ?auto_4985 ) ) ( not ( = ?auto_4984 ?auto_4985 ) ) ( not ( = ?auto_4988 ?auto_4989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4984 ?auto_4983 ?auto_4982 )
      ( DELIVER-1PKG ?auto_4985 ?auto_4982 )
      ( DELIVER-3PKG-VERIFY ?auto_4983 ?auto_4984 ?auto_4985 ?auto_4982 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5000 - OBJ
      ?auto_5001 - OBJ
      ?auto_5002 - OBJ
      ?auto_4999 - LOCATION
    )
    :vars
    (
      ?auto_5006 - LOCATION
      ?auto_5003 - CITY
      ?auto_5004 - LOCATION
      ?auto_5005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5006 ?auto_5003 ) ( IN-CITY ?auto_4999 ?auto_5003 ) ( not ( = ?auto_4999 ?auto_5006 ) ) ( OBJ-AT ?auto_5001 ?auto_5006 ) ( IN-CITY ?auto_5004 ?auto_5003 ) ( not ( = ?auto_4999 ?auto_5004 ) ) ( OBJ-AT ?auto_5002 ?auto_5004 ) ( OBJ-AT ?auto_5000 ?auto_5004 ) ( TRUCK-AT ?auto_5005 ?auto_4999 ) ( not ( = ?auto_5000 ?auto_5002 ) ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5002 ?auto_5001 ) ) ( not ( = ?auto_5006 ?auto_5004 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5000 ?auto_5002 ?auto_5001 ?auto_4999 )
      ( DELIVER-3PKG-VERIFY ?auto_5000 ?auto_5001 ?auto_5002 ?auto_4999 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5017 - OBJ
      ?auto_5018 - OBJ
      ?auto_5019 - OBJ
      ?auto_5016 - LOCATION
    )
    :vars
    (
      ?auto_5022 - LOCATION
      ?auto_5021 - CITY
      ?auto_5020 - LOCATION
      ?auto_5023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5022 ?auto_5021 ) ( IN-CITY ?auto_5016 ?auto_5021 ) ( not ( = ?auto_5016 ?auto_5022 ) ) ( OBJ-AT ?auto_5019 ?auto_5022 ) ( IN-CITY ?auto_5020 ?auto_5021 ) ( not ( = ?auto_5016 ?auto_5020 ) ) ( OBJ-AT ?auto_5017 ?auto_5020 ) ( OBJ-AT ?auto_5018 ?auto_5020 ) ( TRUCK-AT ?auto_5023 ?auto_5016 ) ( not ( = ?auto_5018 ?auto_5017 ) ) ( not ( = ?auto_5018 ?auto_5019 ) ) ( not ( = ?auto_5017 ?auto_5019 ) ) ( not ( = ?auto_5022 ?auto_5020 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5018 ?auto_5019 ?auto_5017 ?auto_5016 )
      ( DELIVER-3PKG-VERIFY ?auto_5017 ?auto_5018 ?auto_5019 ?auto_5016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5034 - OBJ
      ?auto_5035 - OBJ
      ?auto_5036 - OBJ
      ?auto_5033 - LOCATION
    )
    :vars
    (
      ?auto_5039 - LOCATION
      ?auto_5038 - CITY
      ?auto_5037 - LOCATION
      ?auto_5040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5039 ?auto_5038 ) ( IN-CITY ?auto_5033 ?auto_5038 ) ( not ( = ?auto_5033 ?auto_5039 ) ) ( OBJ-AT ?auto_5035 ?auto_5039 ) ( IN-CITY ?auto_5037 ?auto_5038 ) ( not ( = ?auto_5033 ?auto_5037 ) ) ( OBJ-AT ?auto_5034 ?auto_5037 ) ( OBJ-AT ?auto_5036 ?auto_5037 ) ( TRUCK-AT ?auto_5040 ?auto_5033 ) ( not ( = ?auto_5036 ?auto_5034 ) ) ( not ( = ?auto_5036 ?auto_5035 ) ) ( not ( = ?auto_5034 ?auto_5035 ) ) ( not ( = ?auto_5039 ?auto_5037 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5036 ?auto_5035 ?auto_5034 ?auto_5033 )
      ( DELIVER-3PKG-VERIFY ?auto_5034 ?auto_5035 ?auto_5036 ?auto_5033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5069 - OBJ
      ?auto_5070 - OBJ
      ?auto_5071 - OBJ
      ?auto_5068 - LOCATION
    )
    :vars
    (
      ?auto_5074 - LOCATION
      ?auto_5073 - CITY
      ?auto_5072 - LOCATION
      ?auto_5075 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5074 ?auto_5073 ) ( IN-CITY ?auto_5068 ?auto_5073 ) ( not ( = ?auto_5068 ?auto_5074 ) ) ( OBJ-AT ?auto_5069 ?auto_5074 ) ( IN-CITY ?auto_5072 ?auto_5073 ) ( not ( = ?auto_5068 ?auto_5072 ) ) ( OBJ-AT ?auto_5071 ?auto_5072 ) ( OBJ-AT ?auto_5070 ?auto_5072 ) ( TRUCK-AT ?auto_5075 ?auto_5068 ) ( not ( = ?auto_5070 ?auto_5071 ) ) ( not ( = ?auto_5070 ?auto_5069 ) ) ( not ( = ?auto_5071 ?auto_5069 ) ) ( not ( = ?auto_5074 ?auto_5072 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5070 ?auto_5069 ?auto_5071 ?auto_5068 )
      ( DELIVER-3PKG-VERIFY ?auto_5069 ?auto_5070 ?auto_5071 ?auto_5068 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5086 - OBJ
      ?auto_5087 - OBJ
      ?auto_5088 - OBJ
      ?auto_5085 - LOCATION
    )
    :vars
    (
      ?auto_5091 - LOCATION
      ?auto_5090 - CITY
      ?auto_5089 - LOCATION
      ?auto_5092 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5091 ?auto_5090 ) ( IN-CITY ?auto_5085 ?auto_5090 ) ( not ( = ?auto_5085 ?auto_5091 ) ) ( OBJ-AT ?auto_5086 ?auto_5091 ) ( IN-CITY ?auto_5089 ?auto_5090 ) ( not ( = ?auto_5085 ?auto_5089 ) ) ( OBJ-AT ?auto_5087 ?auto_5089 ) ( OBJ-AT ?auto_5088 ?auto_5089 ) ( TRUCK-AT ?auto_5092 ?auto_5085 ) ( not ( = ?auto_5088 ?auto_5087 ) ) ( not ( = ?auto_5088 ?auto_5086 ) ) ( not ( = ?auto_5087 ?auto_5086 ) ) ( not ( = ?auto_5091 ?auto_5089 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5088 ?auto_5086 ?auto_5087 ?auto_5085 )
      ( DELIVER-3PKG-VERIFY ?auto_5086 ?auto_5087 ?auto_5088 ?auto_5085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5142 - OBJ
      ?auto_5141 - LOCATION
    )
    :vars
    (
      ?auto_5144 - LOCATION
      ?auto_5145 - CITY
      ?auto_5143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5144 ?auto_5145 ) ( IN-CITY ?auto_5141 ?auto_5145 ) ( not ( = ?auto_5141 ?auto_5144 ) ) ( OBJ-AT ?auto_5142 ?auto_5144 ) ( TRUCK-AT ?auto_5143 ?auto_5141 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5143 ?auto_5141 ?auto_5144 ?auto_5145 )
      ( !LOAD-TRUCK ?auto_5142 ?auto_5143 ?auto_5144 )
      ( !DRIVE-TRUCK ?auto_5143 ?auto_5144 ?auto_5141 ?auto_5145 )
      ( !UNLOAD-TRUCK ?auto_5142 ?auto_5143 ?auto_5141 )
      ( DELIVER-1PKG-VERIFY ?auto_5142 ?auto_5141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6115 - OBJ
      ?auto_6116 - OBJ
      ?auto_6117 - OBJ
      ?auto_6118 - OBJ
      ?auto_6114 - LOCATION
    )
    :vars
    (
      ?auto_6121 - LOCATION
      ?auto_6119 - CITY
      ?auto_6122 - LOCATION
      ?auto_6120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6121 ?auto_6119 ) ( IN-CITY ?auto_6114 ?auto_6119 ) ( not ( = ?auto_6114 ?auto_6121 ) ) ( OBJ-AT ?auto_6118 ?auto_6121 ) ( IN-CITY ?auto_6122 ?auto_6119 ) ( not ( = ?auto_6114 ?auto_6122 ) ) ( OBJ-AT ?auto_6117 ?auto_6122 ) ( OBJ-AT ?auto_6116 ?auto_6121 ) ( OBJ-AT ?auto_6115 ?auto_6121 ) ( TRUCK-AT ?auto_6120 ?auto_6114 ) ( not ( = ?auto_6115 ?auto_6116 ) ) ( not ( = ?auto_6115 ?auto_6117 ) ) ( not ( = ?auto_6116 ?auto_6117 ) ) ( not ( = ?auto_6122 ?auto_6121 ) ) ( not ( = ?auto_6115 ?auto_6118 ) ) ( not ( = ?auto_6116 ?auto_6118 ) ) ( not ( = ?auto_6117 ?auto_6118 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_6115 ?auto_6117 ?auto_6116 ?auto_6114 )
      ( DELIVER-1PKG ?auto_6118 ?auto_6114 )
      ( DELIVER-4PKG-VERIFY ?auto_6115 ?auto_6116 ?auto_6117 ?auto_6118 ?auto_6114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6144 - OBJ
      ?auto_6145 - OBJ
      ?auto_6146 - OBJ
      ?auto_6147 - OBJ
      ?auto_6143 - LOCATION
    )
    :vars
    (
      ?auto_6149 - LOCATION
      ?auto_6151 - CITY
      ?auto_6148 - LOCATION
      ?auto_6150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6149 ?auto_6151 ) ( IN-CITY ?auto_6143 ?auto_6151 ) ( not ( = ?auto_6143 ?auto_6149 ) ) ( OBJ-AT ?auto_6146 ?auto_6149 ) ( IN-CITY ?auto_6148 ?auto_6151 ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( OBJ-AT ?auto_6147 ?auto_6148 ) ( OBJ-AT ?auto_6145 ?auto_6149 ) ( OBJ-AT ?auto_6144 ?auto_6149 ) ( TRUCK-AT ?auto_6150 ?auto_6143 ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( not ( = ?auto_6144 ?auto_6147 ) ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6147 ?auto_6146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6144 ?auto_6145 ?auto_6147 ?auto_6146 ?auto_6143 )
      ( DELIVER-4PKG-VERIFY ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6173 - OBJ
      ?auto_6174 - OBJ
      ?auto_6175 - OBJ
      ?auto_6176 - OBJ
      ?auto_6172 - LOCATION
    )
    :vars
    (
      ?auto_6178 - LOCATION
      ?auto_6180 - CITY
      ?auto_6179 - LOCATION
      ?auto_6177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6178 ?auto_6180 ) ( IN-CITY ?auto_6172 ?auto_6180 ) ( not ( = ?auto_6172 ?auto_6178 ) ) ( OBJ-AT ?auto_6176 ?auto_6178 ) ( IN-CITY ?auto_6179 ?auto_6180 ) ( not ( = ?auto_6172 ?auto_6179 ) ) ( OBJ-AT ?auto_6174 ?auto_6179 ) ( OBJ-AT ?auto_6175 ?auto_6178 ) ( OBJ-AT ?auto_6173 ?auto_6178 ) ( TRUCK-AT ?auto_6177 ?auto_6172 ) ( not ( = ?auto_6173 ?auto_6175 ) ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6175 ?auto_6174 ) ) ( not ( = ?auto_6179 ?auto_6178 ) ) ( not ( = ?auto_6173 ?auto_6176 ) ) ( not ( = ?auto_6175 ?auto_6176 ) ) ( not ( = ?auto_6174 ?auto_6176 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6173 ?auto_6175 ?auto_6176 ?auto_6174 ?auto_6172 )
      ( DELIVER-4PKG-VERIFY ?auto_6173 ?auto_6174 ?auto_6175 ?auto_6176 ?auto_6172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6202 - OBJ
      ?auto_6203 - OBJ
      ?auto_6204 - OBJ
      ?auto_6205 - OBJ
      ?auto_6201 - LOCATION
    )
    :vars
    (
      ?auto_6207 - LOCATION
      ?auto_6209 - CITY
      ?auto_6208 - LOCATION
      ?auto_6206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6207 ?auto_6209 ) ( IN-CITY ?auto_6201 ?auto_6209 ) ( not ( = ?auto_6201 ?auto_6207 ) ) ( OBJ-AT ?auto_6204 ?auto_6207 ) ( IN-CITY ?auto_6208 ?auto_6209 ) ( not ( = ?auto_6201 ?auto_6208 ) ) ( OBJ-AT ?auto_6203 ?auto_6208 ) ( OBJ-AT ?auto_6205 ?auto_6207 ) ( OBJ-AT ?auto_6202 ?auto_6207 ) ( TRUCK-AT ?auto_6206 ?auto_6201 ) ( not ( = ?auto_6202 ?auto_6205 ) ) ( not ( = ?auto_6202 ?auto_6203 ) ) ( not ( = ?auto_6205 ?auto_6203 ) ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( not ( = ?auto_6202 ?auto_6204 ) ) ( not ( = ?auto_6205 ?auto_6204 ) ) ( not ( = ?auto_6203 ?auto_6204 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6202 ?auto_6205 ?auto_6204 ?auto_6203 ?auto_6201 )
      ( DELIVER-4PKG-VERIFY ?auto_6202 ?auto_6203 ?auto_6204 ?auto_6205 ?auto_6201 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6293 - OBJ
      ?auto_6294 - OBJ
      ?auto_6295 - OBJ
      ?auto_6296 - OBJ
      ?auto_6292 - LOCATION
    )
    :vars
    (
      ?auto_6298 - LOCATION
      ?auto_6300 - CITY
      ?auto_6299 - LOCATION
      ?auto_6297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6298 ?auto_6300 ) ( IN-CITY ?auto_6292 ?auto_6300 ) ( not ( = ?auto_6292 ?auto_6298 ) ) ( OBJ-AT ?auto_6294 ?auto_6298 ) ( IN-CITY ?auto_6299 ?auto_6300 ) ( not ( = ?auto_6292 ?auto_6299 ) ) ( OBJ-AT ?auto_6296 ?auto_6299 ) ( OBJ-AT ?auto_6295 ?auto_6298 ) ( OBJ-AT ?auto_6293 ?auto_6298 ) ( TRUCK-AT ?auto_6297 ?auto_6292 ) ( not ( = ?auto_6293 ?auto_6295 ) ) ( not ( = ?auto_6293 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6296 ) ) ( not ( = ?auto_6299 ?auto_6298 ) ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( not ( = ?auto_6295 ?auto_6294 ) ) ( not ( = ?auto_6296 ?auto_6294 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6293 ?auto_6295 ?auto_6294 ?auto_6296 ?auto_6292 )
      ( DELIVER-4PKG-VERIFY ?auto_6293 ?auto_6294 ?auto_6295 ?auto_6296 ?auto_6292 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6322 - OBJ
      ?auto_6323 - OBJ
      ?auto_6324 - OBJ
      ?auto_6325 - OBJ
      ?auto_6321 - LOCATION
    )
    :vars
    (
      ?auto_6327 - LOCATION
      ?auto_6329 - CITY
      ?auto_6328 - LOCATION
      ?auto_6326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6327 ?auto_6329 ) ( IN-CITY ?auto_6321 ?auto_6329 ) ( not ( = ?auto_6321 ?auto_6327 ) ) ( OBJ-AT ?auto_6323 ?auto_6327 ) ( IN-CITY ?auto_6328 ?auto_6329 ) ( not ( = ?auto_6321 ?auto_6328 ) ) ( OBJ-AT ?auto_6324 ?auto_6328 ) ( OBJ-AT ?auto_6325 ?auto_6327 ) ( OBJ-AT ?auto_6322 ?auto_6327 ) ( TRUCK-AT ?auto_6326 ?auto_6321 ) ( not ( = ?auto_6322 ?auto_6325 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6325 ?auto_6324 ) ) ( not ( = ?auto_6328 ?auto_6327 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6325 ?auto_6323 ) ) ( not ( = ?auto_6324 ?auto_6323 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6322 ?auto_6325 ?auto_6323 ?auto_6324 ?auto_6321 )
      ( DELIVER-4PKG-VERIFY ?auto_6322 ?auto_6323 ?auto_6324 ?auto_6325 ?auto_6321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6413 - OBJ
      ?auto_6414 - OBJ
      ?auto_6415 - OBJ
      ?auto_6416 - OBJ
      ?auto_6412 - LOCATION
    )
    :vars
    (
      ?auto_6418 - LOCATION
      ?auto_6420 - CITY
      ?auto_6419 - LOCATION
      ?auto_6417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6418 ?auto_6420 ) ( IN-CITY ?auto_6412 ?auto_6420 ) ( not ( = ?auto_6412 ?auto_6418 ) ) ( OBJ-AT ?auto_6416 ?auto_6418 ) ( IN-CITY ?auto_6419 ?auto_6420 ) ( not ( = ?auto_6412 ?auto_6419 ) ) ( OBJ-AT ?auto_6415 ?auto_6419 ) ( OBJ-AT ?auto_6413 ?auto_6418 ) ( OBJ-AT ?auto_6414 ?auto_6418 ) ( TRUCK-AT ?auto_6417 ?auto_6412 ) ( not ( = ?auto_6414 ?auto_6413 ) ) ( not ( = ?auto_6414 ?auto_6415 ) ) ( not ( = ?auto_6413 ?auto_6415 ) ) ( not ( = ?auto_6419 ?auto_6418 ) ) ( not ( = ?auto_6414 ?auto_6416 ) ) ( not ( = ?auto_6413 ?auto_6416 ) ) ( not ( = ?auto_6415 ?auto_6416 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6414 ?auto_6413 ?auto_6416 ?auto_6415 ?auto_6412 )
      ( DELIVER-4PKG-VERIFY ?auto_6413 ?auto_6414 ?auto_6415 ?auto_6416 ?auto_6412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6442 - OBJ
      ?auto_6443 - OBJ
      ?auto_6444 - OBJ
      ?auto_6445 - OBJ
      ?auto_6441 - LOCATION
    )
    :vars
    (
      ?auto_6447 - LOCATION
      ?auto_6449 - CITY
      ?auto_6448 - LOCATION
      ?auto_6446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6447 ?auto_6449 ) ( IN-CITY ?auto_6441 ?auto_6449 ) ( not ( = ?auto_6441 ?auto_6447 ) ) ( OBJ-AT ?auto_6444 ?auto_6447 ) ( IN-CITY ?auto_6448 ?auto_6449 ) ( not ( = ?auto_6441 ?auto_6448 ) ) ( OBJ-AT ?auto_6445 ?auto_6448 ) ( OBJ-AT ?auto_6442 ?auto_6447 ) ( OBJ-AT ?auto_6443 ?auto_6447 ) ( TRUCK-AT ?auto_6446 ?auto_6441 ) ( not ( = ?auto_6443 ?auto_6442 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6448 ?auto_6447 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6445 ?auto_6444 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6443 ?auto_6442 ?auto_6444 ?auto_6445 ?auto_6441 )
      ( DELIVER-4PKG-VERIFY ?auto_6442 ?auto_6443 ?auto_6444 ?auto_6445 ?auto_6441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6534 - OBJ
      ?auto_6535 - OBJ
      ?auto_6536 - OBJ
      ?auto_6537 - OBJ
      ?auto_6533 - LOCATION
    )
    :vars
    (
      ?auto_6539 - LOCATION
      ?auto_6541 - CITY
      ?auto_6540 - LOCATION
      ?auto_6538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6539 ?auto_6541 ) ( IN-CITY ?auto_6533 ?auto_6541 ) ( not ( = ?auto_6533 ?auto_6539 ) ) ( OBJ-AT ?auto_6537 ?auto_6539 ) ( IN-CITY ?auto_6540 ?auto_6541 ) ( not ( = ?auto_6533 ?auto_6540 ) ) ( OBJ-AT ?auto_6535 ?auto_6540 ) ( OBJ-AT ?auto_6534 ?auto_6539 ) ( OBJ-AT ?auto_6536 ?auto_6539 ) ( TRUCK-AT ?auto_6538 ?auto_6533 ) ( not ( = ?auto_6536 ?auto_6534 ) ) ( not ( = ?auto_6536 ?auto_6535 ) ) ( not ( = ?auto_6534 ?auto_6535 ) ) ( not ( = ?auto_6540 ?auto_6539 ) ) ( not ( = ?auto_6536 ?auto_6537 ) ) ( not ( = ?auto_6534 ?auto_6537 ) ) ( not ( = ?auto_6535 ?auto_6537 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6536 ?auto_6534 ?auto_6537 ?auto_6535 ?auto_6533 )
      ( DELIVER-4PKG-VERIFY ?auto_6534 ?auto_6535 ?auto_6536 ?auto_6537 ?auto_6533 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6563 - OBJ
      ?auto_6564 - OBJ
      ?auto_6565 - OBJ
      ?auto_6566 - OBJ
      ?auto_6562 - LOCATION
    )
    :vars
    (
      ?auto_6568 - LOCATION
      ?auto_6570 - CITY
      ?auto_6569 - LOCATION
      ?auto_6567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6568 ?auto_6570 ) ( IN-CITY ?auto_6562 ?auto_6570 ) ( not ( = ?auto_6562 ?auto_6568 ) ) ( OBJ-AT ?auto_6565 ?auto_6568 ) ( IN-CITY ?auto_6569 ?auto_6570 ) ( not ( = ?auto_6562 ?auto_6569 ) ) ( OBJ-AT ?auto_6564 ?auto_6569 ) ( OBJ-AT ?auto_6563 ?auto_6568 ) ( OBJ-AT ?auto_6566 ?auto_6568 ) ( TRUCK-AT ?auto_6567 ?auto_6562 ) ( not ( = ?auto_6566 ?auto_6563 ) ) ( not ( = ?auto_6566 ?auto_6564 ) ) ( not ( = ?auto_6563 ?auto_6564 ) ) ( not ( = ?auto_6569 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6565 ) ) ( not ( = ?auto_6563 ?auto_6565 ) ) ( not ( = ?auto_6564 ?auto_6565 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6566 ?auto_6563 ?auto_6565 ?auto_6564 ?auto_6562 )
      ( DELIVER-4PKG-VERIFY ?auto_6563 ?auto_6564 ?auto_6565 ?auto_6566 ?auto_6562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6622 - OBJ
      ?auto_6623 - OBJ
      ?auto_6624 - OBJ
      ?auto_6625 - OBJ
      ?auto_6621 - LOCATION
    )
    :vars
    (
      ?auto_6627 - LOCATION
      ?auto_6629 - CITY
      ?auto_6628 - LOCATION
      ?auto_6626 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6627 ?auto_6629 ) ( IN-CITY ?auto_6621 ?auto_6629 ) ( not ( = ?auto_6621 ?auto_6627 ) ) ( OBJ-AT ?auto_6623 ?auto_6627 ) ( IN-CITY ?auto_6628 ?auto_6629 ) ( not ( = ?auto_6621 ?auto_6628 ) ) ( OBJ-AT ?auto_6625 ?auto_6628 ) ( OBJ-AT ?auto_6622 ?auto_6627 ) ( OBJ-AT ?auto_6624 ?auto_6627 ) ( TRUCK-AT ?auto_6626 ?auto_6621 ) ( not ( = ?auto_6624 ?auto_6622 ) ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6628 ?auto_6627 ) ) ( not ( = ?auto_6624 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6625 ?auto_6623 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6624 ?auto_6622 ?auto_6623 ?auto_6625 ?auto_6621 )
      ( DELIVER-4PKG-VERIFY ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 ?auto_6621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6683 - OBJ
      ?auto_6684 - OBJ
      ?auto_6685 - OBJ
      ?auto_6686 - OBJ
      ?auto_6682 - LOCATION
    )
    :vars
    (
      ?auto_6688 - LOCATION
      ?auto_6690 - CITY
      ?auto_6689 - LOCATION
      ?auto_6687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6688 ?auto_6690 ) ( IN-CITY ?auto_6682 ?auto_6690 ) ( not ( = ?auto_6682 ?auto_6688 ) ) ( OBJ-AT ?auto_6684 ?auto_6688 ) ( IN-CITY ?auto_6689 ?auto_6690 ) ( not ( = ?auto_6682 ?auto_6689 ) ) ( OBJ-AT ?auto_6685 ?auto_6689 ) ( OBJ-AT ?auto_6683 ?auto_6688 ) ( OBJ-AT ?auto_6686 ?auto_6688 ) ( TRUCK-AT ?auto_6687 ?auto_6682 ) ( not ( = ?auto_6686 ?auto_6683 ) ) ( not ( = ?auto_6686 ?auto_6685 ) ) ( not ( = ?auto_6683 ?auto_6685 ) ) ( not ( = ?auto_6689 ?auto_6688 ) ) ( not ( = ?auto_6686 ?auto_6684 ) ) ( not ( = ?auto_6683 ?auto_6684 ) ) ( not ( = ?auto_6685 ?auto_6684 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6686 ?auto_6683 ?auto_6684 ?auto_6685 ?auto_6682 )
      ( DELIVER-4PKG-VERIFY ?auto_6683 ?auto_6684 ?auto_6685 ?auto_6686 ?auto_6682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6774 - OBJ
      ?auto_6775 - OBJ
      ?auto_6776 - OBJ
      ?auto_6777 - OBJ
      ?auto_6773 - LOCATION
    )
    :vars
    (
      ?auto_6779 - LOCATION
      ?auto_6781 - CITY
      ?auto_6780 - LOCATION
      ?auto_6778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6779 ?auto_6781 ) ( IN-CITY ?auto_6773 ?auto_6781 ) ( not ( = ?auto_6773 ?auto_6779 ) ) ( OBJ-AT ?auto_6777 ?auto_6779 ) ( IN-CITY ?auto_6780 ?auto_6781 ) ( not ( = ?auto_6773 ?auto_6780 ) ) ( OBJ-AT ?auto_6774 ?auto_6780 ) ( OBJ-AT ?auto_6776 ?auto_6779 ) ( OBJ-AT ?auto_6775 ?auto_6779 ) ( TRUCK-AT ?auto_6778 ?auto_6773 ) ( not ( = ?auto_6775 ?auto_6776 ) ) ( not ( = ?auto_6775 ?auto_6774 ) ) ( not ( = ?auto_6776 ?auto_6774 ) ) ( not ( = ?auto_6780 ?auto_6779 ) ) ( not ( = ?auto_6775 ?auto_6777 ) ) ( not ( = ?auto_6776 ?auto_6777 ) ) ( not ( = ?auto_6774 ?auto_6777 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6775 ?auto_6776 ?auto_6777 ?auto_6774 ?auto_6773 )
      ( DELIVER-4PKG-VERIFY ?auto_6774 ?auto_6775 ?auto_6776 ?auto_6777 ?auto_6773 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6803 - OBJ
      ?auto_6804 - OBJ
      ?auto_6805 - OBJ
      ?auto_6806 - OBJ
      ?auto_6802 - LOCATION
    )
    :vars
    (
      ?auto_6808 - LOCATION
      ?auto_6810 - CITY
      ?auto_6809 - LOCATION
      ?auto_6807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6808 ?auto_6810 ) ( IN-CITY ?auto_6802 ?auto_6810 ) ( not ( = ?auto_6802 ?auto_6808 ) ) ( OBJ-AT ?auto_6805 ?auto_6808 ) ( IN-CITY ?auto_6809 ?auto_6810 ) ( not ( = ?auto_6802 ?auto_6809 ) ) ( OBJ-AT ?auto_6803 ?auto_6809 ) ( OBJ-AT ?auto_6806 ?auto_6808 ) ( OBJ-AT ?auto_6804 ?auto_6808 ) ( TRUCK-AT ?auto_6807 ?auto_6802 ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( not ( = ?auto_6804 ?auto_6803 ) ) ( not ( = ?auto_6806 ?auto_6803 ) ) ( not ( = ?auto_6809 ?auto_6808 ) ) ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6806 ?auto_6805 ) ) ( not ( = ?auto_6803 ?auto_6805 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6804 ?auto_6806 ?auto_6805 ?auto_6803 ?auto_6802 )
      ( DELIVER-4PKG-VERIFY ?auto_6803 ?auto_6804 ?auto_6805 ?auto_6806 ?auto_6802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6832 - OBJ
      ?auto_6833 - OBJ
      ?auto_6834 - OBJ
      ?auto_6835 - OBJ
      ?auto_6831 - LOCATION
    )
    :vars
    (
      ?auto_6837 - LOCATION
      ?auto_6839 - CITY
      ?auto_6838 - LOCATION
      ?auto_6836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6837 ?auto_6839 ) ( IN-CITY ?auto_6831 ?auto_6839 ) ( not ( = ?auto_6831 ?auto_6837 ) ) ( OBJ-AT ?auto_6835 ?auto_6837 ) ( IN-CITY ?auto_6838 ?auto_6839 ) ( not ( = ?auto_6831 ?auto_6838 ) ) ( OBJ-AT ?auto_6832 ?auto_6838 ) ( OBJ-AT ?auto_6833 ?auto_6837 ) ( OBJ-AT ?auto_6834 ?auto_6837 ) ( TRUCK-AT ?auto_6836 ?auto_6831 ) ( not ( = ?auto_6834 ?auto_6833 ) ) ( not ( = ?auto_6834 ?auto_6832 ) ) ( not ( = ?auto_6833 ?auto_6832 ) ) ( not ( = ?auto_6838 ?auto_6837 ) ) ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6833 ?auto_6835 ) ) ( not ( = ?auto_6832 ?auto_6835 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6834 ?auto_6833 ?auto_6835 ?auto_6832 ?auto_6831 )
      ( DELIVER-4PKG-VERIFY ?auto_6832 ?auto_6833 ?auto_6834 ?auto_6835 ?auto_6831 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6861 - OBJ
      ?auto_6862 - OBJ
      ?auto_6863 - OBJ
      ?auto_6864 - OBJ
      ?auto_6860 - LOCATION
    )
    :vars
    (
      ?auto_6866 - LOCATION
      ?auto_6868 - CITY
      ?auto_6867 - LOCATION
      ?auto_6865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6866 ?auto_6868 ) ( IN-CITY ?auto_6860 ?auto_6868 ) ( not ( = ?auto_6860 ?auto_6866 ) ) ( OBJ-AT ?auto_6863 ?auto_6866 ) ( IN-CITY ?auto_6867 ?auto_6868 ) ( not ( = ?auto_6860 ?auto_6867 ) ) ( OBJ-AT ?auto_6861 ?auto_6867 ) ( OBJ-AT ?auto_6862 ?auto_6866 ) ( OBJ-AT ?auto_6864 ?auto_6866 ) ( TRUCK-AT ?auto_6865 ?auto_6860 ) ( not ( = ?auto_6864 ?auto_6862 ) ) ( not ( = ?auto_6864 ?auto_6861 ) ) ( not ( = ?auto_6862 ?auto_6861 ) ) ( not ( = ?auto_6867 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6863 ) ) ( not ( = ?auto_6862 ?auto_6863 ) ) ( not ( = ?auto_6861 ?auto_6863 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6864 ?auto_6862 ?auto_6863 ?auto_6861 ?auto_6860 )
      ( DELIVER-4PKG-VERIFY ?auto_6861 ?auto_6862 ?auto_6863 ?auto_6864 ?auto_6860 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6983 - OBJ
      ?auto_6984 - OBJ
      ?auto_6985 - OBJ
      ?auto_6986 - OBJ
      ?auto_6982 - LOCATION
    )
    :vars
    (
      ?auto_6988 - LOCATION
      ?auto_6990 - CITY
      ?auto_6989 - LOCATION
      ?auto_6987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6988 ?auto_6990 ) ( IN-CITY ?auto_6982 ?auto_6990 ) ( not ( = ?auto_6982 ?auto_6988 ) ) ( OBJ-AT ?auto_6984 ?auto_6988 ) ( IN-CITY ?auto_6989 ?auto_6990 ) ( not ( = ?auto_6982 ?auto_6989 ) ) ( OBJ-AT ?auto_6983 ?auto_6989 ) ( OBJ-AT ?auto_6986 ?auto_6988 ) ( OBJ-AT ?auto_6985 ?auto_6988 ) ( TRUCK-AT ?auto_6987 ?auto_6982 ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( not ( = ?auto_6985 ?auto_6983 ) ) ( not ( = ?auto_6986 ?auto_6983 ) ) ( not ( = ?auto_6989 ?auto_6988 ) ) ( not ( = ?auto_6985 ?auto_6984 ) ) ( not ( = ?auto_6986 ?auto_6984 ) ) ( not ( = ?auto_6983 ?auto_6984 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6985 ?auto_6986 ?auto_6984 ?auto_6983 ?auto_6982 )
      ( DELIVER-4PKG-VERIFY ?auto_6983 ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6982 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7012 - OBJ
      ?auto_7013 - OBJ
      ?auto_7014 - OBJ
      ?auto_7015 - OBJ
      ?auto_7011 - LOCATION
    )
    :vars
    (
      ?auto_7017 - LOCATION
      ?auto_7019 - CITY
      ?auto_7018 - LOCATION
      ?auto_7016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7017 ?auto_7019 ) ( IN-CITY ?auto_7011 ?auto_7019 ) ( not ( = ?auto_7011 ?auto_7017 ) ) ( OBJ-AT ?auto_7013 ?auto_7017 ) ( IN-CITY ?auto_7018 ?auto_7019 ) ( not ( = ?auto_7011 ?auto_7018 ) ) ( OBJ-AT ?auto_7012 ?auto_7018 ) ( OBJ-AT ?auto_7014 ?auto_7017 ) ( OBJ-AT ?auto_7015 ?auto_7017 ) ( TRUCK-AT ?auto_7016 ?auto_7011 ) ( not ( = ?auto_7015 ?auto_7014 ) ) ( not ( = ?auto_7015 ?auto_7012 ) ) ( not ( = ?auto_7014 ?auto_7012 ) ) ( not ( = ?auto_7018 ?auto_7017 ) ) ( not ( = ?auto_7015 ?auto_7013 ) ) ( not ( = ?auto_7014 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7013 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7015 ?auto_7014 ?auto_7013 ?auto_7012 ?auto_7011 )
      ( DELIVER-4PKG-VERIFY ?auto_7012 ?auto_7013 ?auto_7014 ?auto_7015 ?auto_7011 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7197 - OBJ
      ?auto_7198 - OBJ
      ?auto_7199 - OBJ
      ?auto_7200 - OBJ
      ?auto_7196 - LOCATION
    )
    :vars
    (
      ?auto_7202 - LOCATION
      ?auto_7204 - CITY
      ?auto_7203 - LOCATION
      ?auto_7201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7202 ?auto_7204 ) ( IN-CITY ?auto_7196 ?auto_7204 ) ( not ( = ?auto_7196 ?auto_7202 ) ) ( OBJ-AT ?auto_7197 ?auto_7202 ) ( IN-CITY ?auto_7203 ?auto_7204 ) ( not ( = ?auto_7196 ?auto_7203 ) ) ( OBJ-AT ?auto_7200 ?auto_7203 ) ( OBJ-AT ?auto_7199 ?auto_7202 ) ( OBJ-AT ?auto_7198 ?auto_7202 ) ( TRUCK-AT ?auto_7201 ?auto_7196 ) ( not ( = ?auto_7198 ?auto_7199 ) ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( not ( = ?auto_7203 ?auto_7202 ) ) ( not ( = ?auto_7198 ?auto_7197 ) ) ( not ( = ?auto_7199 ?auto_7197 ) ) ( not ( = ?auto_7200 ?auto_7197 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7198 ?auto_7199 ?auto_7197 ?auto_7200 ?auto_7196 )
      ( DELIVER-4PKG-VERIFY ?auto_7197 ?auto_7198 ?auto_7199 ?auto_7200 ?auto_7196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7226 - OBJ
      ?auto_7227 - OBJ
      ?auto_7228 - OBJ
      ?auto_7229 - OBJ
      ?auto_7225 - LOCATION
    )
    :vars
    (
      ?auto_7231 - LOCATION
      ?auto_7233 - CITY
      ?auto_7232 - LOCATION
      ?auto_7230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7231 ?auto_7233 ) ( IN-CITY ?auto_7225 ?auto_7233 ) ( not ( = ?auto_7225 ?auto_7231 ) ) ( OBJ-AT ?auto_7226 ?auto_7231 ) ( IN-CITY ?auto_7232 ?auto_7233 ) ( not ( = ?auto_7225 ?auto_7232 ) ) ( OBJ-AT ?auto_7228 ?auto_7232 ) ( OBJ-AT ?auto_7229 ?auto_7231 ) ( OBJ-AT ?auto_7227 ?auto_7231 ) ( TRUCK-AT ?auto_7230 ?auto_7225 ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( not ( = ?auto_7227 ?auto_7228 ) ) ( not ( = ?auto_7229 ?auto_7228 ) ) ( not ( = ?auto_7232 ?auto_7231 ) ) ( not ( = ?auto_7227 ?auto_7226 ) ) ( not ( = ?auto_7229 ?auto_7226 ) ) ( not ( = ?auto_7228 ?auto_7226 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7227 ?auto_7229 ?auto_7226 ?auto_7228 ?auto_7225 )
      ( DELIVER-4PKG-VERIFY ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7317 - OBJ
      ?auto_7318 - OBJ
      ?auto_7319 - OBJ
      ?auto_7320 - OBJ
      ?auto_7316 - LOCATION
    )
    :vars
    (
      ?auto_7322 - LOCATION
      ?auto_7324 - CITY
      ?auto_7323 - LOCATION
      ?auto_7321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7322 ?auto_7324 ) ( IN-CITY ?auto_7316 ?auto_7324 ) ( not ( = ?auto_7316 ?auto_7322 ) ) ( OBJ-AT ?auto_7317 ?auto_7322 ) ( IN-CITY ?auto_7323 ?auto_7324 ) ( not ( = ?auto_7316 ?auto_7323 ) ) ( OBJ-AT ?auto_7320 ?auto_7323 ) ( OBJ-AT ?auto_7318 ?auto_7322 ) ( OBJ-AT ?auto_7319 ?auto_7322 ) ( TRUCK-AT ?auto_7321 ?auto_7316 ) ( not ( = ?auto_7319 ?auto_7318 ) ) ( not ( = ?auto_7319 ?auto_7320 ) ) ( not ( = ?auto_7318 ?auto_7320 ) ) ( not ( = ?auto_7323 ?auto_7322 ) ) ( not ( = ?auto_7319 ?auto_7317 ) ) ( not ( = ?auto_7318 ?auto_7317 ) ) ( not ( = ?auto_7320 ?auto_7317 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7319 ?auto_7318 ?auto_7317 ?auto_7320 ?auto_7316 )
      ( DELIVER-4PKG-VERIFY ?auto_7317 ?auto_7318 ?auto_7319 ?auto_7320 ?auto_7316 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7378 - OBJ
      ?auto_7379 - OBJ
      ?auto_7380 - OBJ
      ?auto_7381 - OBJ
      ?auto_7377 - LOCATION
    )
    :vars
    (
      ?auto_7383 - LOCATION
      ?auto_7385 - CITY
      ?auto_7384 - LOCATION
      ?auto_7382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7383 ?auto_7385 ) ( IN-CITY ?auto_7377 ?auto_7385 ) ( not ( = ?auto_7377 ?auto_7383 ) ) ( OBJ-AT ?auto_7378 ?auto_7383 ) ( IN-CITY ?auto_7384 ?auto_7385 ) ( not ( = ?auto_7377 ?auto_7384 ) ) ( OBJ-AT ?auto_7380 ?auto_7384 ) ( OBJ-AT ?auto_7379 ?auto_7383 ) ( OBJ-AT ?auto_7381 ?auto_7383 ) ( TRUCK-AT ?auto_7382 ?auto_7377 ) ( not ( = ?auto_7381 ?auto_7379 ) ) ( not ( = ?auto_7381 ?auto_7380 ) ) ( not ( = ?auto_7379 ?auto_7380 ) ) ( not ( = ?auto_7384 ?auto_7383 ) ) ( not ( = ?auto_7381 ?auto_7378 ) ) ( not ( = ?auto_7379 ?auto_7378 ) ) ( not ( = ?auto_7380 ?auto_7378 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7381 ?auto_7379 ?auto_7378 ?auto_7380 ?auto_7377 )
      ( DELIVER-4PKG-VERIFY ?auto_7378 ?auto_7379 ?auto_7380 ?auto_7381 ?auto_7377 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7469 - OBJ
      ?auto_7470 - OBJ
      ?auto_7471 - OBJ
      ?auto_7472 - OBJ
      ?auto_7468 - LOCATION
    )
    :vars
    (
      ?auto_7474 - LOCATION
      ?auto_7476 - CITY
      ?auto_7475 - LOCATION
      ?auto_7473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7474 ?auto_7476 ) ( IN-CITY ?auto_7468 ?auto_7476 ) ( not ( = ?auto_7468 ?auto_7474 ) ) ( OBJ-AT ?auto_7469 ?auto_7474 ) ( IN-CITY ?auto_7475 ?auto_7476 ) ( not ( = ?auto_7468 ?auto_7475 ) ) ( OBJ-AT ?auto_7470 ?auto_7475 ) ( OBJ-AT ?auto_7472 ?auto_7474 ) ( OBJ-AT ?auto_7471 ?auto_7474 ) ( TRUCK-AT ?auto_7473 ?auto_7468 ) ( not ( = ?auto_7471 ?auto_7472 ) ) ( not ( = ?auto_7471 ?auto_7470 ) ) ( not ( = ?auto_7472 ?auto_7470 ) ) ( not ( = ?auto_7475 ?auto_7474 ) ) ( not ( = ?auto_7471 ?auto_7469 ) ) ( not ( = ?auto_7472 ?auto_7469 ) ) ( not ( = ?auto_7470 ?auto_7469 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7471 ?auto_7472 ?auto_7469 ?auto_7470 ?auto_7468 )
      ( DELIVER-4PKG-VERIFY ?auto_7469 ?auto_7470 ?auto_7471 ?auto_7472 ?auto_7468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7498 - OBJ
      ?auto_7499 - OBJ
      ?auto_7500 - OBJ
      ?auto_7501 - OBJ
      ?auto_7497 - LOCATION
    )
    :vars
    (
      ?auto_7503 - LOCATION
      ?auto_7505 - CITY
      ?auto_7504 - LOCATION
      ?auto_7502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7503 ?auto_7505 ) ( IN-CITY ?auto_7497 ?auto_7505 ) ( not ( = ?auto_7497 ?auto_7503 ) ) ( OBJ-AT ?auto_7498 ?auto_7503 ) ( IN-CITY ?auto_7504 ?auto_7505 ) ( not ( = ?auto_7497 ?auto_7504 ) ) ( OBJ-AT ?auto_7499 ?auto_7504 ) ( OBJ-AT ?auto_7500 ?auto_7503 ) ( OBJ-AT ?auto_7501 ?auto_7503 ) ( TRUCK-AT ?auto_7502 ?auto_7497 ) ( not ( = ?auto_7501 ?auto_7500 ) ) ( not ( = ?auto_7501 ?auto_7499 ) ) ( not ( = ?auto_7500 ?auto_7499 ) ) ( not ( = ?auto_7504 ?auto_7503 ) ) ( not ( = ?auto_7501 ?auto_7498 ) ) ( not ( = ?auto_7500 ?auto_7498 ) ) ( not ( = ?auto_7499 ?auto_7498 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7501 ?auto_7500 ?auto_7498 ?auto_7499 ?auto_7497 )
      ( DELIVER-4PKG-VERIFY ?auto_7498 ?auto_7499 ?auto_7500 ?auto_7501 ?auto_7497 ) )
  )

)

