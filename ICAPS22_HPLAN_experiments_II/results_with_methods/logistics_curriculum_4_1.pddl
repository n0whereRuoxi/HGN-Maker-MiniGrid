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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4832 - OBJ
      ?auto_4831 - LOCATION
    )
    :vars
    (
      ?auto_4834 - LOCATION
      ?auto_4835 - CITY
      ?auto_4833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4834 ?auto_4835 ) ( IN-CITY ?auto_4831 ?auto_4835 ) ( not ( = ?auto_4831 ?auto_4834 ) ) ( OBJ-AT ?auto_4832 ?auto_4834 ) ( TRUCK-AT ?auto_4833 ?auto_4831 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4833 ?auto_4831 ?auto_4834 ?auto_4835 )
      ( !LOAD-TRUCK ?auto_4832 ?auto_4833 ?auto_4834 )
      ( !DRIVE-TRUCK ?auto_4833 ?auto_4834 ?auto_4831 ?auto_4835 )
      ( !UNLOAD-TRUCK ?auto_4832 ?auto_4833 ?auto_4831 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4839 - OBJ
      ?auto_4838 - LOCATION
    )
    :vars
    (
      ?auto_4841 - LOCATION
      ?auto_4842 - CITY
      ?auto_4840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4841 ?auto_4842 ) ( IN-CITY ?auto_4838 ?auto_4842 ) ( not ( = ?auto_4838 ?auto_4841 ) ) ( OBJ-AT ?auto_4839 ?auto_4841 ) ( TRUCK-AT ?auto_4840 ?auto_4838 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4840 ?auto_4838 ?auto_4841 ?auto_4842 )
      ( !LOAD-TRUCK ?auto_4839 ?auto_4840 ?auto_4841 )
      ( !DRIVE-TRUCK ?auto_4840 ?auto_4841 ?auto_4838 ?auto_4842 )
      ( !UNLOAD-TRUCK ?auto_4839 ?auto_4840 ?auto_4838 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4853 - OBJ
      ?auto_4854 - OBJ
      ?auto_4852 - LOCATION
    )
    :vars
    (
      ?auto_4857 - LOCATION
      ?auto_4855 - CITY
      ?auto_4856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4857 ?auto_4855 ) ( IN-CITY ?auto_4852 ?auto_4855 ) ( not ( = ?auto_4852 ?auto_4857 ) ) ( OBJ-AT ?auto_4854 ?auto_4857 ) ( OBJ-AT ?auto_4853 ?auto_4857 ) ( TRUCK-AT ?auto_4856 ?auto_4852 ) ( not ( = ?auto_4853 ?auto_4854 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4853 ?auto_4852 )
      ( DELIVER-1PKG ?auto_4854 ?auto_4852 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4859 - OBJ
      ?auto_4860 - OBJ
      ?auto_4858 - LOCATION
    )
    :vars
    (
      ?auto_4861 - LOCATION
      ?auto_4862 - CITY
      ?auto_4863 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4861 ?auto_4862 ) ( IN-CITY ?auto_4858 ?auto_4862 ) ( not ( = ?auto_4858 ?auto_4861 ) ) ( OBJ-AT ?auto_4859 ?auto_4861 ) ( OBJ-AT ?auto_4860 ?auto_4861 ) ( TRUCK-AT ?auto_4863 ?auto_4858 ) ( not ( = ?auto_4860 ?auto_4859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4860 ?auto_4859 ?auto_4858 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4874 - OBJ
      ?auto_4873 - LOCATION
    )
    :vars
    (
      ?auto_4876 - LOCATION
      ?auto_4877 - CITY
      ?auto_4875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4876 ?auto_4877 ) ( IN-CITY ?auto_4873 ?auto_4877 ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( OBJ-AT ?auto_4874 ?auto_4876 ) ( TRUCK-AT ?auto_4875 ?auto_4873 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4875 ?auto_4873 ?auto_4876 ?auto_4877 )
      ( !LOAD-TRUCK ?auto_4874 ?auto_4875 ?auto_4876 )
      ( !DRIVE-TRUCK ?auto_4875 ?auto_4876 ?auto_4873 ?auto_4877 )
      ( !UNLOAD-TRUCK ?auto_4874 ?auto_4875 ?auto_4873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4964 - OBJ
      ?auto_4965 - OBJ
      ?auto_4966 - OBJ
      ?auto_4963 - LOCATION
    )
    :vars
    (
      ?auto_4967 - LOCATION
      ?auto_4968 - CITY
      ?auto_4970 - LOCATION
      ?auto_4969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4967 ?auto_4968 ) ( IN-CITY ?auto_4963 ?auto_4968 ) ( not ( = ?auto_4963 ?auto_4967 ) ) ( OBJ-AT ?auto_4966 ?auto_4967 ) ( IN-CITY ?auto_4970 ?auto_4968 ) ( not ( = ?auto_4963 ?auto_4970 ) ) ( OBJ-AT ?auto_4965 ?auto_4970 ) ( OBJ-AT ?auto_4964 ?auto_4970 ) ( TRUCK-AT ?auto_4969 ?auto_4963 ) ( not ( = ?auto_4964 ?auto_4965 ) ) ( not ( = ?auto_4964 ?auto_4966 ) ) ( not ( = ?auto_4965 ?auto_4966 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4965 ?auto_4964 ?auto_4963 )
      ( DELIVER-1PKG ?auto_4966 ?auto_4963 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4981 - OBJ
      ?auto_4982 - OBJ
      ?auto_4983 - OBJ
      ?auto_4980 - LOCATION
    )
    :vars
    (
      ?auto_4986 - LOCATION
      ?auto_4985 - CITY
      ?auto_4987 - LOCATION
      ?auto_4984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4986 ?auto_4985 ) ( IN-CITY ?auto_4980 ?auto_4985 ) ( not ( = ?auto_4980 ?auto_4986 ) ) ( OBJ-AT ?auto_4982 ?auto_4986 ) ( IN-CITY ?auto_4987 ?auto_4985 ) ( not ( = ?auto_4980 ?auto_4987 ) ) ( OBJ-AT ?auto_4983 ?auto_4987 ) ( OBJ-AT ?auto_4981 ?auto_4987 ) ( TRUCK-AT ?auto_4984 ?auto_4980 ) ( not ( = ?auto_4981 ?auto_4983 ) ) ( not ( = ?auto_4981 ?auto_4982 ) ) ( not ( = ?auto_4983 ?auto_4982 ) ) ( not ( = ?auto_4986 ?auto_4987 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4981 ?auto_4983 ?auto_4982 ?auto_4980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4998 - OBJ
      ?auto_4999 - OBJ
      ?auto_5000 - OBJ
      ?auto_4997 - LOCATION
    )
    :vars
    (
      ?auto_5002 - LOCATION
      ?auto_5004 - CITY
      ?auto_5003 - LOCATION
      ?auto_5001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5002 ?auto_5004 ) ( IN-CITY ?auto_4997 ?auto_5004 ) ( not ( = ?auto_4997 ?auto_5002 ) ) ( OBJ-AT ?auto_5000 ?auto_5002 ) ( IN-CITY ?auto_5003 ?auto_5004 ) ( not ( = ?auto_4997 ?auto_5003 ) ) ( OBJ-AT ?auto_4998 ?auto_5003 ) ( OBJ-AT ?auto_4999 ?auto_5003 ) ( TRUCK-AT ?auto_5001 ?auto_4997 ) ( not ( = ?auto_4999 ?auto_4998 ) ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4998 ?auto_5000 ) ) ( not ( = ?auto_5002 ?auto_5003 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4999 ?auto_5000 ?auto_4998 ?auto_4997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5015 - OBJ
      ?auto_5016 - OBJ
      ?auto_5017 - OBJ
      ?auto_5014 - LOCATION
    )
    :vars
    (
      ?auto_5019 - LOCATION
      ?auto_5021 - CITY
      ?auto_5020 - LOCATION
      ?auto_5018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5019 ?auto_5021 ) ( IN-CITY ?auto_5014 ?auto_5021 ) ( not ( = ?auto_5014 ?auto_5019 ) ) ( OBJ-AT ?auto_5016 ?auto_5019 ) ( IN-CITY ?auto_5020 ?auto_5021 ) ( not ( = ?auto_5014 ?auto_5020 ) ) ( OBJ-AT ?auto_5015 ?auto_5020 ) ( OBJ-AT ?auto_5017 ?auto_5020 ) ( TRUCK-AT ?auto_5018 ?auto_5014 ) ( not ( = ?auto_5017 ?auto_5015 ) ) ( not ( = ?auto_5017 ?auto_5016 ) ) ( not ( = ?auto_5015 ?auto_5016 ) ) ( not ( = ?auto_5019 ?auto_5020 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5017 ?auto_5016 ?auto_5015 ?auto_5014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5050 - OBJ
      ?auto_5051 - OBJ
      ?auto_5052 - OBJ
      ?auto_5049 - LOCATION
    )
    :vars
    (
      ?auto_5054 - LOCATION
      ?auto_5056 - CITY
      ?auto_5055 - LOCATION
      ?auto_5053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5054 ?auto_5056 ) ( IN-CITY ?auto_5049 ?auto_5056 ) ( not ( = ?auto_5049 ?auto_5054 ) ) ( OBJ-AT ?auto_5050 ?auto_5054 ) ( IN-CITY ?auto_5055 ?auto_5056 ) ( not ( = ?auto_5049 ?auto_5055 ) ) ( OBJ-AT ?auto_5052 ?auto_5055 ) ( OBJ-AT ?auto_5051 ?auto_5055 ) ( TRUCK-AT ?auto_5053 ?auto_5049 ) ( not ( = ?auto_5051 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5050 ) ) ( not ( = ?auto_5052 ?auto_5050 ) ) ( not ( = ?auto_5054 ?auto_5055 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5051 ?auto_5050 ?auto_5052 ?auto_5049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5067 - OBJ
      ?auto_5068 - OBJ
      ?auto_5069 - OBJ
      ?auto_5066 - LOCATION
    )
    :vars
    (
      ?auto_5071 - LOCATION
      ?auto_5073 - CITY
      ?auto_5072 - LOCATION
      ?auto_5070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5071 ?auto_5073 ) ( IN-CITY ?auto_5066 ?auto_5073 ) ( not ( = ?auto_5066 ?auto_5071 ) ) ( OBJ-AT ?auto_5067 ?auto_5071 ) ( IN-CITY ?auto_5072 ?auto_5073 ) ( not ( = ?auto_5066 ?auto_5072 ) ) ( OBJ-AT ?auto_5068 ?auto_5072 ) ( OBJ-AT ?auto_5069 ?auto_5072 ) ( TRUCK-AT ?auto_5070 ?auto_5066 ) ( not ( = ?auto_5069 ?auto_5068 ) ) ( not ( = ?auto_5069 ?auto_5067 ) ) ( not ( = ?auto_5068 ?auto_5067 ) ) ( not ( = ?auto_5071 ?auto_5072 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5069 ?auto_5067 ?auto_5068 ?auto_5066 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5123 - OBJ
      ?auto_5122 - LOCATION
    )
    :vars
    (
      ?auto_5125 - LOCATION
      ?auto_5126 - CITY
      ?auto_5124 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5125 ?auto_5126 ) ( IN-CITY ?auto_5122 ?auto_5126 ) ( not ( = ?auto_5122 ?auto_5125 ) ) ( OBJ-AT ?auto_5123 ?auto_5125 ) ( TRUCK-AT ?auto_5124 ?auto_5122 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5124 ?auto_5122 ?auto_5125 ?auto_5126 )
      ( !LOAD-TRUCK ?auto_5123 ?auto_5124 ?auto_5125 )
      ( !DRIVE-TRUCK ?auto_5124 ?auto_5125 ?auto_5122 ?auto_5126 )
      ( !UNLOAD-TRUCK ?auto_5123 ?auto_5124 ?auto_5122 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6105 - OBJ
      ?auto_6106 - OBJ
      ?auto_6107 - OBJ
      ?auto_6108 - OBJ
      ?auto_6104 - LOCATION
    )
    :vars
    (
      ?auto_6110 - LOCATION
      ?auto_6109 - CITY
      ?auto_6112 - LOCATION
      ?auto_6113 - LOCATION
      ?auto_6111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6110 ?auto_6109 ) ( IN-CITY ?auto_6104 ?auto_6109 ) ( not ( = ?auto_6104 ?auto_6110 ) ) ( OBJ-AT ?auto_6108 ?auto_6110 ) ( IN-CITY ?auto_6112 ?auto_6109 ) ( not ( = ?auto_6104 ?auto_6112 ) ) ( OBJ-AT ?auto_6107 ?auto_6112 ) ( IN-CITY ?auto_6113 ?auto_6109 ) ( not ( = ?auto_6104 ?auto_6113 ) ) ( OBJ-AT ?auto_6106 ?auto_6113 ) ( OBJ-AT ?auto_6105 ?auto_6113 ) ( TRUCK-AT ?auto_6111 ?auto_6104 ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6112 ?auto_6113 ) ) ( not ( = ?auto_6105 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6110 ?auto_6113 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_6105 ?auto_6107 ?auto_6106 ?auto_6104 )
      ( DELIVER-1PKG ?auto_6108 ?auto_6104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6137 - OBJ
      ?auto_6138 - OBJ
      ?auto_6139 - OBJ
      ?auto_6140 - OBJ
      ?auto_6136 - LOCATION
    )
    :vars
    (
      ?auto_6141 - LOCATION
      ?auto_6144 - CITY
      ?auto_6142 - LOCATION
      ?auto_6143 - LOCATION
      ?auto_6145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6141 ?auto_6144 ) ( IN-CITY ?auto_6136 ?auto_6144 ) ( not ( = ?auto_6136 ?auto_6141 ) ) ( OBJ-AT ?auto_6139 ?auto_6141 ) ( IN-CITY ?auto_6142 ?auto_6144 ) ( not ( = ?auto_6136 ?auto_6142 ) ) ( OBJ-AT ?auto_6140 ?auto_6142 ) ( IN-CITY ?auto_6143 ?auto_6144 ) ( not ( = ?auto_6136 ?auto_6143 ) ) ( OBJ-AT ?auto_6138 ?auto_6143 ) ( OBJ-AT ?auto_6137 ?auto_6143 ) ( TRUCK-AT ?auto_6145 ?auto_6136 ) ( not ( = ?auto_6137 ?auto_6138 ) ) ( not ( = ?auto_6137 ?auto_6140 ) ) ( not ( = ?auto_6138 ?auto_6140 ) ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( not ( = ?auto_6137 ?auto_6139 ) ) ( not ( = ?auto_6138 ?auto_6139 ) ) ( not ( = ?auto_6140 ?auto_6139 ) ) ( not ( = ?auto_6141 ?auto_6142 ) ) ( not ( = ?auto_6141 ?auto_6143 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6137 ?auto_6138 ?auto_6140 ?auto_6139 ?auto_6136 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6169 - OBJ
      ?auto_6170 - OBJ
      ?auto_6171 - OBJ
      ?auto_6172 - OBJ
      ?auto_6168 - LOCATION
    )
    :vars
    (
      ?auto_6177 - LOCATION
      ?auto_6173 - CITY
      ?auto_6176 - LOCATION
      ?auto_6174 - LOCATION
      ?auto_6175 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6177 ?auto_6173 ) ( IN-CITY ?auto_6168 ?auto_6173 ) ( not ( = ?auto_6168 ?auto_6177 ) ) ( OBJ-AT ?auto_6172 ?auto_6177 ) ( IN-CITY ?auto_6176 ?auto_6173 ) ( not ( = ?auto_6168 ?auto_6176 ) ) ( OBJ-AT ?auto_6170 ?auto_6176 ) ( IN-CITY ?auto_6174 ?auto_6173 ) ( not ( = ?auto_6168 ?auto_6174 ) ) ( OBJ-AT ?auto_6171 ?auto_6174 ) ( OBJ-AT ?auto_6169 ?auto_6174 ) ( TRUCK-AT ?auto_6175 ?auto_6168 ) ( not ( = ?auto_6169 ?auto_6171 ) ) ( not ( = ?auto_6169 ?auto_6170 ) ) ( not ( = ?auto_6171 ?auto_6170 ) ) ( not ( = ?auto_6176 ?auto_6174 ) ) ( not ( = ?auto_6169 ?auto_6172 ) ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( not ( = ?auto_6170 ?auto_6172 ) ) ( not ( = ?auto_6177 ?auto_6176 ) ) ( not ( = ?auto_6177 ?auto_6174 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6169 ?auto_6171 ?auto_6172 ?auto_6170 ?auto_6168 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6201 - OBJ
      ?auto_6202 - OBJ
      ?auto_6203 - OBJ
      ?auto_6204 - OBJ
      ?auto_6200 - LOCATION
    )
    :vars
    (
      ?auto_6209 - LOCATION
      ?auto_6205 - CITY
      ?auto_6208 - LOCATION
      ?auto_6206 - LOCATION
      ?auto_6207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6209 ?auto_6205 ) ( IN-CITY ?auto_6200 ?auto_6205 ) ( not ( = ?auto_6200 ?auto_6209 ) ) ( OBJ-AT ?auto_6203 ?auto_6209 ) ( IN-CITY ?auto_6208 ?auto_6205 ) ( not ( = ?auto_6200 ?auto_6208 ) ) ( OBJ-AT ?auto_6202 ?auto_6208 ) ( IN-CITY ?auto_6206 ?auto_6205 ) ( not ( = ?auto_6200 ?auto_6206 ) ) ( OBJ-AT ?auto_6204 ?auto_6206 ) ( OBJ-AT ?auto_6201 ?auto_6206 ) ( TRUCK-AT ?auto_6207 ?auto_6200 ) ( not ( = ?auto_6201 ?auto_6204 ) ) ( not ( = ?auto_6201 ?auto_6202 ) ) ( not ( = ?auto_6204 ?auto_6202 ) ) ( not ( = ?auto_6208 ?auto_6206 ) ) ( not ( = ?auto_6201 ?auto_6203 ) ) ( not ( = ?auto_6204 ?auto_6203 ) ) ( not ( = ?auto_6202 ?auto_6203 ) ) ( not ( = ?auto_6209 ?auto_6208 ) ) ( not ( = ?auto_6209 ?auto_6206 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6201 ?auto_6204 ?auto_6203 ?auto_6202 ?auto_6200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6301 - OBJ
      ?auto_6302 - OBJ
      ?auto_6303 - OBJ
      ?auto_6304 - OBJ
      ?auto_6300 - LOCATION
    )
    :vars
    (
      ?auto_6309 - LOCATION
      ?auto_6305 - CITY
      ?auto_6308 - LOCATION
      ?auto_6306 - LOCATION
      ?auto_6307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6309 ?auto_6305 ) ( IN-CITY ?auto_6300 ?auto_6305 ) ( not ( = ?auto_6300 ?auto_6309 ) ) ( OBJ-AT ?auto_6302 ?auto_6309 ) ( IN-CITY ?auto_6308 ?auto_6305 ) ( not ( = ?auto_6300 ?auto_6308 ) ) ( OBJ-AT ?auto_6304 ?auto_6308 ) ( IN-CITY ?auto_6306 ?auto_6305 ) ( not ( = ?auto_6300 ?auto_6306 ) ) ( OBJ-AT ?auto_6303 ?auto_6306 ) ( OBJ-AT ?auto_6301 ?auto_6306 ) ( TRUCK-AT ?auto_6307 ?auto_6300 ) ( not ( = ?auto_6301 ?auto_6303 ) ) ( not ( = ?auto_6301 ?auto_6304 ) ) ( not ( = ?auto_6303 ?auto_6304 ) ) ( not ( = ?auto_6308 ?auto_6306 ) ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( not ( = ?auto_6303 ?auto_6302 ) ) ( not ( = ?auto_6304 ?auto_6302 ) ) ( not ( = ?auto_6309 ?auto_6308 ) ) ( not ( = ?auto_6309 ?auto_6306 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6301 ?auto_6303 ?auto_6302 ?auto_6304 ?auto_6300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6333 - OBJ
      ?auto_6334 - OBJ
      ?auto_6335 - OBJ
      ?auto_6336 - OBJ
      ?auto_6332 - LOCATION
    )
    :vars
    (
      ?auto_6341 - LOCATION
      ?auto_6337 - CITY
      ?auto_6340 - LOCATION
      ?auto_6338 - LOCATION
      ?auto_6339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6341 ?auto_6337 ) ( IN-CITY ?auto_6332 ?auto_6337 ) ( not ( = ?auto_6332 ?auto_6341 ) ) ( OBJ-AT ?auto_6334 ?auto_6341 ) ( IN-CITY ?auto_6340 ?auto_6337 ) ( not ( = ?auto_6332 ?auto_6340 ) ) ( OBJ-AT ?auto_6335 ?auto_6340 ) ( IN-CITY ?auto_6338 ?auto_6337 ) ( not ( = ?auto_6332 ?auto_6338 ) ) ( OBJ-AT ?auto_6336 ?auto_6338 ) ( OBJ-AT ?auto_6333 ?auto_6338 ) ( TRUCK-AT ?auto_6339 ?auto_6332 ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) ( not ( = ?auto_6336 ?auto_6335 ) ) ( not ( = ?auto_6340 ?auto_6338 ) ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6336 ?auto_6334 ) ) ( not ( = ?auto_6335 ?auto_6334 ) ) ( not ( = ?auto_6341 ?auto_6340 ) ) ( not ( = ?auto_6341 ?auto_6338 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6333 ?auto_6336 ?auto_6334 ?auto_6335 ?auto_6332 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6433 - OBJ
      ?auto_6434 - OBJ
      ?auto_6435 - OBJ
      ?auto_6436 - OBJ
      ?auto_6432 - LOCATION
    )
    :vars
    (
      ?auto_6441 - LOCATION
      ?auto_6437 - CITY
      ?auto_6440 - LOCATION
      ?auto_6438 - LOCATION
      ?auto_6439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6441 ?auto_6437 ) ( IN-CITY ?auto_6432 ?auto_6437 ) ( not ( = ?auto_6432 ?auto_6441 ) ) ( OBJ-AT ?auto_6436 ?auto_6441 ) ( IN-CITY ?auto_6440 ?auto_6437 ) ( not ( = ?auto_6432 ?auto_6440 ) ) ( OBJ-AT ?auto_6435 ?auto_6440 ) ( IN-CITY ?auto_6438 ?auto_6437 ) ( not ( = ?auto_6432 ?auto_6438 ) ) ( OBJ-AT ?auto_6433 ?auto_6438 ) ( OBJ-AT ?auto_6434 ?auto_6438 ) ( TRUCK-AT ?auto_6439 ?auto_6432 ) ( not ( = ?auto_6434 ?auto_6433 ) ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6440 ?auto_6438 ) ) ( not ( = ?auto_6434 ?auto_6436 ) ) ( not ( = ?auto_6433 ?auto_6436 ) ) ( not ( = ?auto_6435 ?auto_6436 ) ) ( not ( = ?auto_6441 ?auto_6440 ) ) ( not ( = ?auto_6441 ?auto_6438 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6434 ?auto_6433 ?auto_6436 ?auto_6435 ?auto_6432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6465 - OBJ
      ?auto_6466 - OBJ
      ?auto_6467 - OBJ
      ?auto_6468 - OBJ
      ?auto_6464 - LOCATION
    )
    :vars
    (
      ?auto_6473 - LOCATION
      ?auto_6469 - CITY
      ?auto_6472 - LOCATION
      ?auto_6470 - LOCATION
      ?auto_6471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6473 ?auto_6469 ) ( IN-CITY ?auto_6464 ?auto_6469 ) ( not ( = ?auto_6464 ?auto_6473 ) ) ( OBJ-AT ?auto_6467 ?auto_6473 ) ( IN-CITY ?auto_6472 ?auto_6469 ) ( not ( = ?auto_6464 ?auto_6472 ) ) ( OBJ-AT ?auto_6468 ?auto_6472 ) ( IN-CITY ?auto_6470 ?auto_6469 ) ( not ( = ?auto_6464 ?auto_6470 ) ) ( OBJ-AT ?auto_6465 ?auto_6470 ) ( OBJ-AT ?auto_6466 ?auto_6470 ) ( TRUCK-AT ?auto_6471 ?auto_6464 ) ( not ( = ?auto_6466 ?auto_6465 ) ) ( not ( = ?auto_6466 ?auto_6468 ) ) ( not ( = ?auto_6465 ?auto_6468 ) ) ( not ( = ?auto_6472 ?auto_6470 ) ) ( not ( = ?auto_6466 ?auto_6467 ) ) ( not ( = ?auto_6465 ?auto_6467 ) ) ( not ( = ?auto_6468 ?auto_6467 ) ) ( not ( = ?auto_6473 ?auto_6472 ) ) ( not ( = ?auto_6473 ?auto_6470 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6466 ?auto_6465 ?auto_6467 ?auto_6468 ?auto_6464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6566 - OBJ
      ?auto_6567 - OBJ
      ?auto_6568 - OBJ
      ?auto_6569 - OBJ
      ?auto_6565 - LOCATION
    )
    :vars
    (
      ?auto_6574 - LOCATION
      ?auto_6570 - CITY
      ?auto_6573 - LOCATION
      ?auto_6571 - LOCATION
      ?auto_6572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6574 ?auto_6570 ) ( IN-CITY ?auto_6565 ?auto_6570 ) ( not ( = ?auto_6565 ?auto_6574 ) ) ( OBJ-AT ?auto_6569 ?auto_6574 ) ( IN-CITY ?auto_6573 ?auto_6570 ) ( not ( = ?auto_6565 ?auto_6573 ) ) ( OBJ-AT ?auto_6567 ?auto_6573 ) ( IN-CITY ?auto_6571 ?auto_6570 ) ( not ( = ?auto_6565 ?auto_6571 ) ) ( OBJ-AT ?auto_6566 ?auto_6571 ) ( OBJ-AT ?auto_6568 ?auto_6571 ) ( TRUCK-AT ?auto_6572 ?auto_6565 ) ( not ( = ?auto_6568 ?auto_6566 ) ) ( not ( = ?auto_6568 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6573 ?auto_6571 ) ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6574 ?auto_6573 ) ) ( not ( = ?auto_6574 ?auto_6571 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6568 ?auto_6566 ?auto_6569 ?auto_6567 ?auto_6565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6598 - OBJ
      ?auto_6599 - OBJ
      ?auto_6600 - OBJ
      ?auto_6601 - OBJ
      ?auto_6597 - LOCATION
    )
    :vars
    (
      ?auto_6606 - LOCATION
      ?auto_6602 - CITY
      ?auto_6605 - LOCATION
      ?auto_6603 - LOCATION
      ?auto_6604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6606 ?auto_6602 ) ( IN-CITY ?auto_6597 ?auto_6602 ) ( not ( = ?auto_6597 ?auto_6606 ) ) ( OBJ-AT ?auto_6600 ?auto_6606 ) ( IN-CITY ?auto_6605 ?auto_6602 ) ( not ( = ?auto_6597 ?auto_6605 ) ) ( OBJ-AT ?auto_6599 ?auto_6605 ) ( IN-CITY ?auto_6603 ?auto_6602 ) ( not ( = ?auto_6597 ?auto_6603 ) ) ( OBJ-AT ?auto_6598 ?auto_6603 ) ( OBJ-AT ?auto_6601 ?auto_6603 ) ( TRUCK-AT ?auto_6604 ?auto_6597 ) ( not ( = ?auto_6601 ?auto_6598 ) ) ( not ( = ?auto_6601 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6605 ?auto_6603 ) ) ( not ( = ?auto_6601 ?auto_6600 ) ) ( not ( = ?auto_6598 ?auto_6600 ) ) ( not ( = ?auto_6599 ?auto_6600 ) ) ( not ( = ?auto_6606 ?auto_6605 ) ) ( not ( = ?auto_6606 ?auto_6603 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6601 ?auto_6598 ?auto_6600 ?auto_6599 ?auto_6597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6663 - OBJ
      ?auto_6664 - OBJ
      ?auto_6665 - OBJ
      ?auto_6666 - OBJ
      ?auto_6662 - LOCATION
    )
    :vars
    (
      ?auto_6671 - LOCATION
      ?auto_6667 - CITY
      ?auto_6670 - LOCATION
      ?auto_6668 - LOCATION
      ?auto_6669 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6671 ?auto_6667 ) ( IN-CITY ?auto_6662 ?auto_6667 ) ( not ( = ?auto_6662 ?auto_6671 ) ) ( OBJ-AT ?auto_6664 ?auto_6671 ) ( IN-CITY ?auto_6670 ?auto_6667 ) ( not ( = ?auto_6662 ?auto_6670 ) ) ( OBJ-AT ?auto_6666 ?auto_6670 ) ( IN-CITY ?auto_6668 ?auto_6667 ) ( not ( = ?auto_6662 ?auto_6668 ) ) ( OBJ-AT ?auto_6663 ?auto_6668 ) ( OBJ-AT ?auto_6665 ?auto_6668 ) ( TRUCK-AT ?auto_6669 ?auto_6662 ) ( not ( = ?auto_6665 ?auto_6663 ) ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( not ( = ?auto_6663 ?auto_6666 ) ) ( not ( = ?auto_6670 ?auto_6668 ) ) ( not ( = ?auto_6665 ?auto_6664 ) ) ( not ( = ?auto_6663 ?auto_6664 ) ) ( not ( = ?auto_6666 ?auto_6664 ) ) ( not ( = ?auto_6671 ?auto_6670 ) ) ( not ( = ?auto_6671 ?auto_6668 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6665 ?auto_6663 ?auto_6664 ?auto_6666 ?auto_6662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6730 - OBJ
      ?auto_6731 - OBJ
      ?auto_6732 - OBJ
      ?auto_6733 - OBJ
      ?auto_6729 - LOCATION
    )
    :vars
    (
      ?auto_6738 - LOCATION
      ?auto_6734 - CITY
      ?auto_6737 - LOCATION
      ?auto_6735 - LOCATION
      ?auto_6736 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6738 ?auto_6734 ) ( IN-CITY ?auto_6729 ?auto_6734 ) ( not ( = ?auto_6729 ?auto_6738 ) ) ( OBJ-AT ?auto_6731 ?auto_6738 ) ( IN-CITY ?auto_6737 ?auto_6734 ) ( not ( = ?auto_6729 ?auto_6737 ) ) ( OBJ-AT ?auto_6732 ?auto_6737 ) ( IN-CITY ?auto_6735 ?auto_6734 ) ( not ( = ?auto_6729 ?auto_6735 ) ) ( OBJ-AT ?auto_6730 ?auto_6735 ) ( OBJ-AT ?auto_6733 ?auto_6735 ) ( TRUCK-AT ?auto_6736 ?auto_6729 ) ( not ( = ?auto_6733 ?auto_6730 ) ) ( not ( = ?auto_6733 ?auto_6732 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6737 ?auto_6735 ) ) ( not ( = ?auto_6733 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6732 ?auto_6731 ) ) ( not ( = ?auto_6738 ?auto_6737 ) ) ( not ( = ?auto_6738 ?auto_6735 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6733 ?auto_6730 ?auto_6731 ?auto_6732 ?auto_6729 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6830 - OBJ
      ?auto_6831 - OBJ
      ?auto_6832 - OBJ
      ?auto_6833 - OBJ
      ?auto_6829 - LOCATION
    )
    :vars
    (
      ?auto_6838 - LOCATION
      ?auto_6834 - CITY
      ?auto_6837 - LOCATION
      ?auto_6835 - LOCATION
      ?auto_6836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6838 ?auto_6834 ) ( IN-CITY ?auto_6829 ?auto_6834 ) ( not ( = ?auto_6829 ?auto_6838 ) ) ( OBJ-AT ?auto_6833 ?auto_6838 ) ( IN-CITY ?auto_6837 ?auto_6834 ) ( not ( = ?auto_6829 ?auto_6837 ) ) ( OBJ-AT ?auto_6830 ?auto_6837 ) ( IN-CITY ?auto_6835 ?auto_6834 ) ( not ( = ?auto_6829 ?auto_6835 ) ) ( OBJ-AT ?auto_6832 ?auto_6835 ) ( OBJ-AT ?auto_6831 ?auto_6835 ) ( TRUCK-AT ?auto_6836 ?auto_6829 ) ( not ( = ?auto_6831 ?auto_6832 ) ) ( not ( = ?auto_6831 ?auto_6830 ) ) ( not ( = ?auto_6832 ?auto_6830 ) ) ( not ( = ?auto_6837 ?auto_6835 ) ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( not ( = ?auto_6832 ?auto_6833 ) ) ( not ( = ?auto_6830 ?auto_6833 ) ) ( not ( = ?auto_6838 ?auto_6837 ) ) ( not ( = ?auto_6838 ?auto_6835 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6831 ?auto_6832 ?auto_6833 ?auto_6830 ?auto_6829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6862 - OBJ
      ?auto_6863 - OBJ
      ?auto_6864 - OBJ
      ?auto_6865 - OBJ
      ?auto_6861 - LOCATION
    )
    :vars
    (
      ?auto_6870 - LOCATION
      ?auto_6866 - CITY
      ?auto_6869 - LOCATION
      ?auto_6867 - LOCATION
      ?auto_6868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6870 ?auto_6866 ) ( IN-CITY ?auto_6861 ?auto_6866 ) ( not ( = ?auto_6861 ?auto_6870 ) ) ( OBJ-AT ?auto_6864 ?auto_6870 ) ( IN-CITY ?auto_6869 ?auto_6866 ) ( not ( = ?auto_6861 ?auto_6869 ) ) ( OBJ-AT ?auto_6862 ?auto_6869 ) ( IN-CITY ?auto_6867 ?auto_6866 ) ( not ( = ?auto_6861 ?auto_6867 ) ) ( OBJ-AT ?auto_6865 ?auto_6867 ) ( OBJ-AT ?auto_6863 ?auto_6867 ) ( TRUCK-AT ?auto_6868 ?auto_6861 ) ( not ( = ?auto_6863 ?auto_6865 ) ) ( not ( = ?auto_6863 ?auto_6862 ) ) ( not ( = ?auto_6865 ?auto_6862 ) ) ( not ( = ?auto_6869 ?auto_6867 ) ) ( not ( = ?auto_6863 ?auto_6864 ) ) ( not ( = ?auto_6865 ?auto_6864 ) ) ( not ( = ?auto_6862 ?auto_6864 ) ) ( not ( = ?auto_6870 ?auto_6869 ) ) ( not ( = ?auto_6870 ?auto_6867 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6863 ?auto_6865 ?auto_6864 ?auto_6862 ?auto_6861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6894 - OBJ
      ?auto_6895 - OBJ
      ?auto_6896 - OBJ
      ?auto_6897 - OBJ
      ?auto_6893 - LOCATION
    )
    :vars
    (
      ?auto_6902 - LOCATION
      ?auto_6898 - CITY
      ?auto_6901 - LOCATION
      ?auto_6899 - LOCATION
      ?auto_6900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6902 ?auto_6898 ) ( IN-CITY ?auto_6893 ?auto_6898 ) ( not ( = ?auto_6893 ?auto_6902 ) ) ( OBJ-AT ?auto_6897 ?auto_6902 ) ( IN-CITY ?auto_6901 ?auto_6898 ) ( not ( = ?auto_6893 ?auto_6901 ) ) ( OBJ-AT ?auto_6894 ?auto_6901 ) ( IN-CITY ?auto_6899 ?auto_6898 ) ( not ( = ?auto_6893 ?auto_6899 ) ) ( OBJ-AT ?auto_6895 ?auto_6899 ) ( OBJ-AT ?auto_6896 ?auto_6899 ) ( TRUCK-AT ?auto_6900 ?auto_6893 ) ( not ( = ?auto_6896 ?auto_6895 ) ) ( not ( = ?auto_6896 ?auto_6894 ) ) ( not ( = ?auto_6895 ?auto_6894 ) ) ( not ( = ?auto_6901 ?auto_6899 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6902 ?auto_6901 ) ) ( not ( = ?auto_6902 ?auto_6899 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6896 ?auto_6895 ?auto_6897 ?auto_6894 ?auto_6893 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6926 - OBJ
      ?auto_6927 - OBJ
      ?auto_6928 - OBJ
      ?auto_6929 - OBJ
      ?auto_6925 - LOCATION
    )
    :vars
    (
      ?auto_6934 - LOCATION
      ?auto_6930 - CITY
      ?auto_6933 - LOCATION
      ?auto_6931 - LOCATION
      ?auto_6932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6934 ?auto_6930 ) ( IN-CITY ?auto_6925 ?auto_6930 ) ( not ( = ?auto_6925 ?auto_6934 ) ) ( OBJ-AT ?auto_6928 ?auto_6934 ) ( IN-CITY ?auto_6933 ?auto_6930 ) ( not ( = ?auto_6925 ?auto_6933 ) ) ( OBJ-AT ?auto_6926 ?auto_6933 ) ( IN-CITY ?auto_6931 ?auto_6930 ) ( not ( = ?auto_6925 ?auto_6931 ) ) ( OBJ-AT ?auto_6927 ?auto_6931 ) ( OBJ-AT ?auto_6929 ?auto_6931 ) ( TRUCK-AT ?auto_6932 ?auto_6925 ) ( not ( = ?auto_6929 ?auto_6927 ) ) ( not ( = ?auto_6929 ?auto_6926 ) ) ( not ( = ?auto_6927 ?auto_6926 ) ) ( not ( = ?auto_6933 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6934 ?auto_6933 ) ) ( not ( = ?auto_6934 ?auto_6931 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6929 ?auto_6927 ?auto_6928 ?auto_6926 ?auto_6925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7060 - OBJ
      ?auto_7061 - OBJ
      ?auto_7062 - OBJ
      ?auto_7063 - OBJ
      ?auto_7059 - LOCATION
    )
    :vars
    (
      ?auto_7068 - LOCATION
      ?auto_7064 - CITY
      ?auto_7067 - LOCATION
      ?auto_7065 - LOCATION
      ?auto_7066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7068 ?auto_7064 ) ( IN-CITY ?auto_7059 ?auto_7064 ) ( not ( = ?auto_7059 ?auto_7068 ) ) ( OBJ-AT ?auto_7061 ?auto_7068 ) ( IN-CITY ?auto_7067 ?auto_7064 ) ( not ( = ?auto_7059 ?auto_7067 ) ) ( OBJ-AT ?auto_7060 ?auto_7067 ) ( IN-CITY ?auto_7065 ?auto_7064 ) ( not ( = ?auto_7059 ?auto_7065 ) ) ( OBJ-AT ?auto_7063 ?auto_7065 ) ( OBJ-AT ?auto_7062 ?auto_7065 ) ( TRUCK-AT ?auto_7066 ?auto_7059 ) ( not ( = ?auto_7062 ?auto_7063 ) ) ( not ( = ?auto_7062 ?auto_7060 ) ) ( not ( = ?auto_7063 ?auto_7060 ) ) ( not ( = ?auto_7067 ?auto_7065 ) ) ( not ( = ?auto_7062 ?auto_7061 ) ) ( not ( = ?auto_7063 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( not ( = ?auto_7068 ?auto_7067 ) ) ( not ( = ?auto_7068 ?auto_7065 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7062 ?auto_7063 ?auto_7061 ?auto_7060 ?auto_7059 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7092 - OBJ
      ?auto_7093 - OBJ
      ?auto_7094 - OBJ
      ?auto_7095 - OBJ
      ?auto_7091 - LOCATION
    )
    :vars
    (
      ?auto_7100 - LOCATION
      ?auto_7096 - CITY
      ?auto_7099 - LOCATION
      ?auto_7097 - LOCATION
      ?auto_7098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7100 ?auto_7096 ) ( IN-CITY ?auto_7091 ?auto_7096 ) ( not ( = ?auto_7091 ?auto_7100 ) ) ( OBJ-AT ?auto_7093 ?auto_7100 ) ( IN-CITY ?auto_7099 ?auto_7096 ) ( not ( = ?auto_7091 ?auto_7099 ) ) ( OBJ-AT ?auto_7092 ?auto_7099 ) ( IN-CITY ?auto_7097 ?auto_7096 ) ( not ( = ?auto_7091 ?auto_7097 ) ) ( OBJ-AT ?auto_7094 ?auto_7097 ) ( OBJ-AT ?auto_7095 ?auto_7097 ) ( TRUCK-AT ?auto_7098 ?auto_7091 ) ( not ( = ?auto_7095 ?auto_7094 ) ) ( not ( = ?auto_7095 ?auto_7092 ) ) ( not ( = ?auto_7094 ?auto_7092 ) ) ( not ( = ?auto_7099 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7093 ) ) ( not ( = ?auto_7094 ?auto_7093 ) ) ( not ( = ?auto_7092 ?auto_7093 ) ) ( not ( = ?auto_7100 ?auto_7099 ) ) ( not ( = ?auto_7100 ?auto_7097 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7095 ?auto_7094 ?auto_7093 ?auto_7092 ?auto_7091 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7295 - OBJ
      ?auto_7296 - OBJ
      ?auto_7297 - OBJ
      ?auto_7298 - OBJ
      ?auto_7294 - LOCATION
    )
    :vars
    (
      ?auto_7303 - LOCATION
      ?auto_7299 - CITY
      ?auto_7302 - LOCATION
      ?auto_7300 - LOCATION
      ?auto_7301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7303 ?auto_7299 ) ( IN-CITY ?auto_7294 ?auto_7299 ) ( not ( = ?auto_7294 ?auto_7303 ) ) ( OBJ-AT ?auto_7295 ?auto_7303 ) ( IN-CITY ?auto_7302 ?auto_7299 ) ( not ( = ?auto_7294 ?auto_7302 ) ) ( OBJ-AT ?auto_7298 ?auto_7302 ) ( IN-CITY ?auto_7300 ?auto_7299 ) ( not ( = ?auto_7294 ?auto_7300 ) ) ( OBJ-AT ?auto_7297 ?auto_7300 ) ( OBJ-AT ?auto_7296 ?auto_7300 ) ( TRUCK-AT ?auto_7301 ?auto_7294 ) ( not ( = ?auto_7296 ?auto_7297 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7297 ?auto_7298 ) ) ( not ( = ?auto_7302 ?auto_7300 ) ) ( not ( = ?auto_7296 ?auto_7295 ) ) ( not ( = ?auto_7297 ?auto_7295 ) ) ( not ( = ?auto_7298 ?auto_7295 ) ) ( not ( = ?auto_7303 ?auto_7302 ) ) ( not ( = ?auto_7303 ?auto_7300 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7296 ?auto_7297 ?auto_7295 ?auto_7298 ?auto_7294 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7327 - OBJ
      ?auto_7328 - OBJ
      ?auto_7329 - OBJ
      ?auto_7330 - OBJ
      ?auto_7326 - LOCATION
    )
    :vars
    (
      ?auto_7335 - LOCATION
      ?auto_7331 - CITY
      ?auto_7334 - LOCATION
      ?auto_7332 - LOCATION
      ?auto_7333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7335 ?auto_7331 ) ( IN-CITY ?auto_7326 ?auto_7331 ) ( not ( = ?auto_7326 ?auto_7335 ) ) ( OBJ-AT ?auto_7327 ?auto_7335 ) ( IN-CITY ?auto_7334 ?auto_7331 ) ( not ( = ?auto_7326 ?auto_7334 ) ) ( OBJ-AT ?auto_7329 ?auto_7334 ) ( IN-CITY ?auto_7332 ?auto_7331 ) ( not ( = ?auto_7326 ?auto_7332 ) ) ( OBJ-AT ?auto_7330 ?auto_7332 ) ( OBJ-AT ?auto_7328 ?auto_7332 ) ( TRUCK-AT ?auto_7333 ?auto_7326 ) ( not ( = ?auto_7328 ?auto_7330 ) ) ( not ( = ?auto_7328 ?auto_7329 ) ) ( not ( = ?auto_7330 ?auto_7329 ) ) ( not ( = ?auto_7334 ?auto_7332 ) ) ( not ( = ?auto_7328 ?auto_7327 ) ) ( not ( = ?auto_7330 ?auto_7327 ) ) ( not ( = ?auto_7329 ?auto_7327 ) ) ( not ( = ?auto_7335 ?auto_7334 ) ) ( not ( = ?auto_7335 ?auto_7332 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7328 ?auto_7330 ?auto_7327 ?auto_7329 ?auto_7326 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7427 - OBJ
      ?auto_7428 - OBJ
      ?auto_7429 - OBJ
      ?auto_7430 - OBJ
      ?auto_7426 - LOCATION
    )
    :vars
    (
      ?auto_7435 - LOCATION
      ?auto_7431 - CITY
      ?auto_7434 - LOCATION
      ?auto_7432 - LOCATION
      ?auto_7433 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7435 ?auto_7431 ) ( IN-CITY ?auto_7426 ?auto_7431 ) ( not ( = ?auto_7426 ?auto_7435 ) ) ( OBJ-AT ?auto_7427 ?auto_7435 ) ( IN-CITY ?auto_7434 ?auto_7431 ) ( not ( = ?auto_7426 ?auto_7434 ) ) ( OBJ-AT ?auto_7430 ?auto_7434 ) ( IN-CITY ?auto_7432 ?auto_7431 ) ( not ( = ?auto_7426 ?auto_7432 ) ) ( OBJ-AT ?auto_7428 ?auto_7432 ) ( OBJ-AT ?auto_7429 ?auto_7432 ) ( TRUCK-AT ?auto_7433 ?auto_7426 ) ( not ( = ?auto_7429 ?auto_7428 ) ) ( not ( = ?auto_7429 ?auto_7430 ) ) ( not ( = ?auto_7428 ?auto_7430 ) ) ( not ( = ?auto_7434 ?auto_7432 ) ) ( not ( = ?auto_7429 ?auto_7427 ) ) ( not ( = ?auto_7428 ?auto_7427 ) ) ( not ( = ?auto_7430 ?auto_7427 ) ) ( not ( = ?auto_7435 ?auto_7434 ) ) ( not ( = ?auto_7435 ?auto_7432 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7429 ?auto_7428 ?auto_7427 ?auto_7430 ?auto_7426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7494 - OBJ
      ?auto_7495 - OBJ
      ?auto_7496 - OBJ
      ?auto_7497 - OBJ
      ?auto_7493 - LOCATION
    )
    :vars
    (
      ?auto_7502 - LOCATION
      ?auto_7498 - CITY
      ?auto_7501 - LOCATION
      ?auto_7499 - LOCATION
      ?auto_7500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7502 ?auto_7498 ) ( IN-CITY ?auto_7493 ?auto_7498 ) ( not ( = ?auto_7493 ?auto_7502 ) ) ( OBJ-AT ?auto_7494 ?auto_7502 ) ( IN-CITY ?auto_7501 ?auto_7498 ) ( not ( = ?auto_7493 ?auto_7501 ) ) ( OBJ-AT ?auto_7496 ?auto_7501 ) ( IN-CITY ?auto_7499 ?auto_7498 ) ( not ( = ?auto_7493 ?auto_7499 ) ) ( OBJ-AT ?auto_7495 ?auto_7499 ) ( OBJ-AT ?auto_7497 ?auto_7499 ) ( TRUCK-AT ?auto_7500 ?auto_7493 ) ( not ( = ?auto_7497 ?auto_7495 ) ) ( not ( = ?auto_7497 ?auto_7496 ) ) ( not ( = ?auto_7495 ?auto_7496 ) ) ( not ( = ?auto_7501 ?auto_7499 ) ) ( not ( = ?auto_7497 ?auto_7494 ) ) ( not ( = ?auto_7495 ?auto_7494 ) ) ( not ( = ?auto_7496 ?auto_7494 ) ) ( not ( = ?auto_7502 ?auto_7501 ) ) ( not ( = ?auto_7502 ?auto_7499 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7497 ?auto_7495 ?auto_7494 ?auto_7496 ?auto_7493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7594 - OBJ
      ?auto_7595 - OBJ
      ?auto_7596 - OBJ
      ?auto_7597 - OBJ
      ?auto_7593 - LOCATION
    )
    :vars
    (
      ?auto_7602 - LOCATION
      ?auto_7598 - CITY
      ?auto_7601 - LOCATION
      ?auto_7599 - LOCATION
      ?auto_7600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7602 ?auto_7598 ) ( IN-CITY ?auto_7593 ?auto_7598 ) ( not ( = ?auto_7593 ?auto_7602 ) ) ( OBJ-AT ?auto_7594 ?auto_7602 ) ( IN-CITY ?auto_7601 ?auto_7598 ) ( not ( = ?auto_7593 ?auto_7601 ) ) ( OBJ-AT ?auto_7595 ?auto_7601 ) ( IN-CITY ?auto_7599 ?auto_7598 ) ( not ( = ?auto_7593 ?auto_7599 ) ) ( OBJ-AT ?auto_7597 ?auto_7599 ) ( OBJ-AT ?auto_7596 ?auto_7599 ) ( TRUCK-AT ?auto_7600 ?auto_7593 ) ( not ( = ?auto_7596 ?auto_7597 ) ) ( not ( = ?auto_7596 ?auto_7595 ) ) ( not ( = ?auto_7597 ?auto_7595 ) ) ( not ( = ?auto_7601 ?auto_7599 ) ) ( not ( = ?auto_7596 ?auto_7594 ) ) ( not ( = ?auto_7597 ?auto_7594 ) ) ( not ( = ?auto_7595 ?auto_7594 ) ) ( not ( = ?auto_7602 ?auto_7601 ) ) ( not ( = ?auto_7602 ?auto_7599 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7596 ?auto_7597 ?auto_7594 ?auto_7595 ?auto_7593 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_7626 - OBJ
      ?auto_7627 - OBJ
      ?auto_7628 - OBJ
      ?auto_7629 - OBJ
      ?auto_7625 - LOCATION
    )
    :vars
    (
      ?auto_7634 - LOCATION
      ?auto_7630 - CITY
      ?auto_7633 - LOCATION
      ?auto_7631 - LOCATION
      ?auto_7632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7634 ?auto_7630 ) ( IN-CITY ?auto_7625 ?auto_7630 ) ( not ( = ?auto_7625 ?auto_7634 ) ) ( OBJ-AT ?auto_7626 ?auto_7634 ) ( IN-CITY ?auto_7633 ?auto_7630 ) ( not ( = ?auto_7625 ?auto_7633 ) ) ( OBJ-AT ?auto_7627 ?auto_7633 ) ( IN-CITY ?auto_7631 ?auto_7630 ) ( not ( = ?auto_7625 ?auto_7631 ) ) ( OBJ-AT ?auto_7628 ?auto_7631 ) ( OBJ-AT ?auto_7629 ?auto_7631 ) ( TRUCK-AT ?auto_7632 ?auto_7625 ) ( not ( = ?auto_7629 ?auto_7628 ) ) ( not ( = ?auto_7629 ?auto_7627 ) ) ( not ( = ?auto_7628 ?auto_7627 ) ) ( not ( = ?auto_7633 ?auto_7631 ) ) ( not ( = ?auto_7629 ?auto_7626 ) ) ( not ( = ?auto_7628 ?auto_7626 ) ) ( not ( = ?auto_7627 ?auto_7626 ) ) ( not ( = ?auto_7634 ?auto_7633 ) ) ( not ( = ?auto_7634 ?auto_7631 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_7629 ?auto_7628 ?auto_7626 ?auto_7627 ?auto_7625 ) )
  )

)

