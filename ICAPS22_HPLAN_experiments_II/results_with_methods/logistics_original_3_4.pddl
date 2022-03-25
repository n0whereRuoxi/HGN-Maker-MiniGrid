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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13765 - OBJ
      ?auto_13764 - LOCATION
    )
    :vars
    (
      ?auto_13766 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13766 ?auto_13764 ) ( IN-TRUCK ?auto_13765 ?auto_13766 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13765 ?auto_13766 ?auto_13764 )
      ( DELIVER-1PKG-VERIFY ?auto_13765 ?auto_13764 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13777 - OBJ
      ?auto_13776 - LOCATION
    )
    :vars
    (
      ?auto_13778 - TRUCK
      ?auto_13779 - LOCATION
      ?auto_13780 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13777 ?auto_13778 ) ( TRUCK-AT ?auto_13778 ?auto_13779 ) ( IN-CITY ?auto_13779 ?auto_13780 ) ( IN-CITY ?auto_13776 ?auto_13780 ) ( not ( = ?auto_13776 ?auto_13779 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13778 ?auto_13779 ?auto_13776 ?auto_13780 )
      ( DELIVER-1PKG ?auto_13777 ?auto_13776 )
      ( DELIVER-1PKG-VERIFY ?auto_13777 ?auto_13776 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13795 - OBJ
      ?auto_13794 - LOCATION
    )
    :vars
    (
      ?auto_13798 - TRUCK
      ?auto_13796 - LOCATION
      ?auto_13797 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13798 ?auto_13796 ) ( IN-CITY ?auto_13796 ?auto_13797 ) ( IN-CITY ?auto_13794 ?auto_13797 ) ( not ( = ?auto_13794 ?auto_13796 ) ) ( OBJ-AT ?auto_13795 ?auto_13796 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13795 ?auto_13798 ?auto_13796 )
      ( DELIVER-1PKG ?auto_13795 ?auto_13794 )
      ( DELIVER-1PKG-VERIFY ?auto_13795 ?auto_13794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13813 - OBJ
      ?auto_13812 - LOCATION
    )
    :vars
    (
      ?auto_13815 - LOCATION
      ?auto_13816 - CITY
      ?auto_13814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13815 ?auto_13816 ) ( IN-CITY ?auto_13812 ?auto_13816 ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( OBJ-AT ?auto_13813 ?auto_13815 ) ( TRUCK-AT ?auto_13814 ?auto_13812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13814 ?auto_13812 ?auto_13815 ?auto_13816 )
      ( DELIVER-1PKG ?auto_13813 ?auto_13812 )
      ( DELIVER-1PKG-VERIFY ?auto_13813 ?auto_13812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13870 - OBJ
      ?auto_13869 - LOCATION
    )
    :vars
    (
      ?auto_13871 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13871 ?auto_13869 ) ( IN-TRUCK ?auto_13870 ?auto_13871 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13870 ?auto_13871 ?auto_13869 )
      ( DELIVER-1PKG-VERIFY ?auto_13870 ?auto_13869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13873 - OBJ
      ?auto_13874 - OBJ
      ?auto_13872 - LOCATION
    )
    :vars
    (
      ?auto_13875 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13875 ?auto_13872 ) ( IN-TRUCK ?auto_13874 ?auto_13875 ) ( OBJ-AT ?auto_13873 ?auto_13872 ) ( not ( = ?auto_13873 ?auto_13874 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13874 ?auto_13872 )
      ( DELIVER-2PKG-VERIFY ?auto_13873 ?auto_13874 ?auto_13872 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13877 - OBJ
      ?auto_13878 - OBJ
      ?auto_13876 - LOCATION
    )
    :vars
    (
      ?auto_13879 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13879 ?auto_13876 ) ( IN-TRUCK ?auto_13877 ?auto_13879 ) ( OBJ-AT ?auto_13878 ?auto_13876 ) ( not ( = ?auto_13877 ?auto_13878 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13877 ?auto_13876 )
      ( DELIVER-2PKG-VERIFY ?auto_13877 ?auto_13878 ?auto_13876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13885 - OBJ
      ?auto_13886 - OBJ
      ?auto_13887 - OBJ
      ?auto_13884 - LOCATION
    )
    :vars
    (
      ?auto_13888 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13888 ?auto_13884 ) ( IN-TRUCK ?auto_13887 ?auto_13888 ) ( OBJ-AT ?auto_13885 ?auto_13884 ) ( OBJ-AT ?auto_13886 ?auto_13884 ) ( not ( = ?auto_13885 ?auto_13886 ) ) ( not ( = ?auto_13885 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13887 ?auto_13884 )
      ( DELIVER-3PKG-VERIFY ?auto_13885 ?auto_13886 ?auto_13887 ?auto_13884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13890 - OBJ
      ?auto_13891 - OBJ
      ?auto_13892 - OBJ
      ?auto_13889 - LOCATION
    )
    :vars
    (
      ?auto_13893 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13893 ?auto_13889 ) ( IN-TRUCK ?auto_13891 ?auto_13893 ) ( OBJ-AT ?auto_13890 ?auto_13889 ) ( OBJ-AT ?auto_13892 ?auto_13889 ) ( not ( = ?auto_13890 ?auto_13891 ) ) ( not ( = ?auto_13890 ?auto_13892 ) ) ( not ( = ?auto_13891 ?auto_13892 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13891 ?auto_13889 )
      ( DELIVER-3PKG-VERIFY ?auto_13890 ?auto_13891 ?auto_13892 ?auto_13889 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13900 - OBJ
      ?auto_13901 - OBJ
      ?auto_13902 - OBJ
      ?auto_13899 - LOCATION
    )
    :vars
    (
      ?auto_13903 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13903 ?auto_13899 ) ( IN-TRUCK ?auto_13900 ?auto_13903 ) ( OBJ-AT ?auto_13901 ?auto_13899 ) ( OBJ-AT ?auto_13902 ?auto_13899 ) ( not ( = ?auto_13900 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( not ( = ?auto_13901 ?auto_13902 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13900 ?auto_13899 )
      ( DELIVER-3PKG-VERIFY ?auto_13900 ?auto_13901 ?auto_13902 ?auto_13899 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13920 - OBJ
      ?auto_13919 - LOCATION
    )
    :vars
    (
      ?auto_13921 - TRUCK
      ?auto_13922 - LOCATION
      ?auto_13923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13920 ?auto_13921 ) ( TRUCK-AT ?auto_13921 ?auto_13922 ) ( IN-CITY ?auto_13922 ?auto_13923 ) ( IN-CITY ?auto_13919 ?auto_13923 ) ( not ( = ?auto_13919 ?auto_13922 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13921 ?auto_13922 ?auto_13919 ?auto_13923 )
      ( DELIVER-1PKG ?auto_13920 ?auto_13919 )
      ( DELIVER-1PKG-VERIFY ?auto_13920 ?auto_13919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13925 - OBJ
      ?auto_13926 - OBJ
      ?auto_13924 - LOCATION
    )
    :vars
    (
      ?auto_13928 - TRUCK
      ?auto_13929 - LOCATION
      ?auto_13927 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13926 ?auto_13928 ) ( TRUCK-AT ?auto_13928 ?auto_13929 ) ( IN-CITY ?auto_13929 ?auto_13927 ) ( IN-CITY ?auto_13924 ?auto_13927 ) ( not ( = ?auto_13924 ?auto_13929 ) ) ( OBJ-AT ?auto_13925 ?auto_13924 ) ( not ( = ?auto_13925 ?auto_13926 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13926 ?auto_13924 )
      ( DELIVER-2PKG-VERIFY ?auto_13925 ?auto_13926 ?auto_13924 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13931 - OBJ
      ?auto_13932 - OBJ
      ?auto_13930 - LOCATION
    )
    :vars
    (
      ?auto_13934 - TRUCK
      ?auto_13935 - LOCATION
      ?auto_13933 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13931 ?auto_13934 ) ( TRUCK-AT ?auto_13934 ?auto_13935 ) ( IN-CITY ?auto_13935 ?auto_13933 ) ( IN-CITY ?auto_13930 ?auto_13933 ) ( not ( = ?auto_13930 ?auto_13935 ) ) ( OBJ-AT ?auto_13932 ?auto_13930 ) ( not ( = ?auto_13932 ?auto_13931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13932 ?auto_13931 ?auto_13930 )
      ( DELIVER-2PKG-VERIFY ?auto_13931 ?auto_13932 ?auto_13930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13944 - OBJ
      ?auto_13945 - OBJ
      ?auto_13946 - OBJ
      ?auto_13943 - LOCATION
    )
    :vars
    (
      ?auto_13948 - TRUCK
      ?auto_13949 - LOCATION
      ?auto_13947 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13946 ?auto_13948 ) ( TRUCK-AT ?auto_13948 ?auto_13949 ) ( IN-CITY ?auto_13949 ?auto_13947 ) ( IN-CITY ?auto_13943 ?auto_13947 ) ( not ( = ?auto_13943 ?auto_13949 ) ) ( OBJ-AT ?auto_13945 ?auto_13943 ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( OBJ-AT ?auto_13944 ?auto_13943 ) ( not ( = ?auto_13944 ?auto_13945 ) ) ( not ( = ?auto_13944 ?auto_13946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13945 ?auto_13946 ?auto_13943 )
      ( DELIVER-3PKG-VERIFY ?auto_13944 ?auto_13945 ?auto_13946 ?auto_13943 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13951 - OBJ
      ?auto_13952 - OBJ
      ?auto_13953 - OBJ
      ?auto_13950 - LOCATION
    )
    :vars
    (
      ?auto_13955 - TRUCK
      ?auto_13956 - LOCATION
      ?auto_13954 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13952 ?auto_13955 ) ( TRUCK-AT ?auto_13955 ?auto_13956 ) ( IN-CITY ?auto_13956 ?auto_13954 ) ( IN-CITY ?auto_13950 ?auto_13954 ) ( not ( = ?auto_13950 ?auto_13956 ) ) ( OBJ-AT ?auto_13951 ?auto_13950 ) ( not ( = ?auto_13951 ?auto_13952 ) ) ( OBJ-AT ?auto_13953 ?auto_13950 ) ( not ( = ?auto_13951 ?auto_13953 ) ) ( not ( = ?auto_13952 ?auto_13953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13951 ?auto_13952 ?auto_13950 )
      ( DELIVER-3PKG-VERIFY ?auto_13951 ?auto_13952 ?auto_13953 ?auto_13950 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13965 - OBJ
      ?auto_13966 - OBJ
      ?auto_13967 - OBJ
      ?auto_13964 - LOCATION
    )
    :vars
    (
      ?auto_13969 - TRUCK
      ?auto_13970 - LOCATION
      ?auto_13968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13965 ?auto_13969 ) ( TRUCK-AT ?auto_13969 ?auto_13970 ) ( IN-CITY ?auto_13970 ?auto_13968 ) ( IN-CITY ?auto_13964 ?auto_13968 ) ( not ( = ?auto_13964 ?auto_13970 ) ) ( OBJ-AT ?auto_13967 ?auto_13964 ) ( not ( = ?auto_13967 ?auto_13965 ) ) ( OBJ-AT ?auto_13966 ?auto_13964 ) ( not ( = ?auto_13965 ?auto_13966 ) ) ( not ( = ?auto_13966 ?auto_13967 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13967 ?auto_13965 ?auto_13964 )
      ( DELIVER-3PKG-VERIFY ?auto_13965 ?auto_13966 ?auto_13967 ?auto_13964 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13994 - OBJ
      ?auto_13993 - LOCATION
    )
    :vars
    (
      ?auto_13997 - TRUCK
      ?auto_13998 - LOCATION
      ?auto_13995 - CITY
      ?auto_13996 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13997 ?auto_13998 ) ( IN-CITY ?auto_13998 ?auto_13995 ) ( IN-CITY ?auto_13993 ?auto_13995 ) ( not ( = ?auto_13993 ?auto_13998 ) ) ( OBJ-AT ?auto_13996 ?auto_13993 ) ( not ( = ?auto_13996 ?auto_13994 ) ) ( OBJ-AT ?auto_13994 ?auto_13998 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13994 ?auto_13997 ?auto_13998 )
      ( DELIVER-2PKG ?auto_13996 ?auto_13994 ?auto_13993 )
      ( DELIVER-1PKG-VERIFY ?auto_13994 ?auto_13993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14000 - OBJ
      ?auto_14001 - OBJ
      ?auto_13999 - LOCATION
    )
    :vars
    (
      ?auto_14002 - TRUCK
      ?auto_14003 - LOCATION
      ?auto_14004 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14002 ?auto_14003 ) ( IN-CITY ?auto_14003 ?auto_14004 ) ( IN-CITY ?auto_13999 ?auto_14004 ) ( not ( = ?auto_13999 ?auto_14003 ) ) ( OBJ-AT ?auto_14000 ?auto_13999 ) ( not ( = ?auto_14000 ?auto_14001 ) ) ( OBJ-AT ?auto_14001 ?auto_14003 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14001 ?auto_13999 )
      ( DELIVER-2PKG-VERIFY ?auto_14000 ?auto_14001 ?auto_13999 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14006 - OBJ
      ?auto_14007 - OBJ
      ?auto_14005 - LOCATION
    )
    :vars
    (
      ?auto_14010 - TRUCK
      ?auto_14009 - LOCATION
      ?auto_14008 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14010 ?auto_14009 ) ( IN-CITY ?auto_14009 ?auto_14008 ) ( IN-CITY ?auto_14005 ?auto_14008 ) ( not ( = ?auto_14005 ?auto_14009 ) ) ( OBJ-AT ?auto_14007 ?auto_14005 ) ( not ( = ?auto_14007 ?auto_14006 ) ) ( OBJ-AT ?auto_14006 ?auto_14009 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14007 ?auto_14006 ?auto_14005 )
      ( DELIVER-2PKG-VERIFY ?auto_14006 ?auto_14007 ?auto_14005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14019 - OBJ
      ?auto_14020 - OBJ
      ?auto_14021 - OBJ
      ?auto_14018 - LOCATION
    )
    :vars
    (
      ?auto_14024 - TRUCK
      ?auto_14023 - LOCATION
      ?auto_14022 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14024 ?auto_14023 ) ( IN-CITY ?auto_14023 ?auto_14022 ) ( IN-CITY ?auto_14018 ?auto_14022 ) ( not ( = ?auto_14018 ?auto_14023 ) ) ( OBJ-AT ?auto_14020 ?auto_14018 ) ( not ( = ?auto_14020 ?auto_14021 ) ) ( OBJ-AT ?auto_14021 ?auto_14023 ) ( OBJ-AT ?auto_14019 ?auto_14018 ) ( not ( = ?auto_14019 ?auto_14020 ) ) ( not ( = ?auto_14019 ?auto_14021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14020 ?auto_14021 ?auto_14018 )
      ( DELIVER-3PKG-VERIFY ?auto_14019 ?auto_14020 ?auto_14021 ?auto_14018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14026 - OBJ
      ?auto_14027 - OBJ
      ?auto_14028 - OBJ
      ?auto_14025 - LOCATION
    )
    :vars
    (
      ?auto_14031 - TRUCK
      ?auto_14030 - LOCATION
      ?auto_14029 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14031 ?auto_14030 ) ( IN-CITY ?auto_14030 ?auto_14029 ) ( IN-CITY ?auto_14025 ?auto_14029 ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( OBJ-AT ?auto_14028 ?auto_14025 ) ( not ( = ?auto_14028 ?auto_14027 ) ) ( OBJ-AT ?auto_14027 ?auto_14030 ) ( OBJ-AT ?auto_14026 ?auto_14025 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14028 ?auto_14027 ?auto_14025 )
      ( DELIVER-3PKG-VERIFY ?auto_14026 ?auto_14027 ?auto_14028 ?auto_14025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14040 - OBJ
      ?auto_14041 - OBJ
      ?auto_14042 - OBJ
      ?auto_14039 - LOCATION
    )
    :vars
    (
      ?auto_14045 - TRUCK
      ?auto_14044 - LOCATION
      ?auto_14043 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14045 ?auto_14044 ) ( IN-CITY ?auto_14044 ?auto_14043 ) ( IN-CITY ?auto_14039 ?auto_14043 ) ( not ( = ?auto_14039 ?auto_14044 ) ) ( OBJ-AT ?auto_14041 ?auto_14039 ) ( not ( = ?auto_14041 ?auto_14040 ) ) ( OBJ-AT ?auto_14040 ?auto_14044 ) ( OBJ-AT ?auto_14042 ?auto_14039 ) ( not ( = ?auto_14040 ?auto_14042 ) ) ( not ( = ?auto_14041 ?auto_14042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14041 ?auto_14040 ?auto_14039 )
      ( DELIVER-3PKG-VERIFY ?auto_14040 ?auto_14041 ?auto_14042 ?auto_14039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14069 - OBJ
      ?auto_14068 - LOCATION
    )
    :vars
    (
      ?auto_14071 - LOCATION
      ?auto_14070 - CITY
      ?auto_14072 - OBJ
      ?auto_14073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14071 ?auto_14070 ) ( IN-CITY ?auto_14068 ?auto_14070 ) ( not ( = ?auto_14068 ?auto_14071 ) ) ( OBJ-AT ?auto_14072 ?auto_14068 ) ( not ( = ?auto_14072 ?auto_14069 ) ) ( OBJ-AT ?auto_14069 ?auto_14071 ) ( TRUCK-AT ?auto_14073 ?auto_14068 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14073 ?auto_14068 ?auto_14071 ?auto_14070 )
      ( DELIVER-2PKG ?auto_14072 ?auto_14069 ?auto_14068 )
      ( DELIVER-1PKG-VERIFY ?auto_14069 ?auto_14068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14075 - OBJ
      ?auto_14076 - OBJ
      ?auto_14074 - LOCATION
    )
    :vars
    (
      ?auto_14077 - LOCATION
      ?auto_14079 - CITY
      ?auto_14078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14077 ?auto_14079 ) ( IN-CITY ?auto_14074 ?auto_14079 ) ( not ( = ?auto_14074 ?auto_14077 ) ) ( OBJ-AT ?auto_14075 ?auto_14074 ) ( not ( = ?auto_14075 ?auto_14076 ) ) ( OBJ-AT ?auto_14076 ?auto_14077 ) ( TRUCK-AT ?auto_14078 ?auto_14074 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14076 ?auto_14074 )
      ( DELIVER-2PKG-VERIFY ?auto_14075 ?auto_14076 ?auto_14074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14081 - OBJ
      ?auto_14082 - OBJ
      ?auto_14080 - LOCATION
    )
    :vars
    (
      ?auto_14084 - LOCATION
      ?auto_14083 - CITY
      ?auto_14085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14084 ?auto_14083 ) ( IN-CITY ?auto_14080 ?auto_14083 ) ( not ( = ?auto_14080 ?auto_14084 ) ) ( OBJ-AT ?auto_14082 ?auto_14080 ) ( not ( = ?auto_14082 ?auto_14081 ) ) ( OBJ-AT ?auto_14081 ?auto_14084 ) ( TRUCK-AT ?auto_14085 ?auto_14080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14082 ?auto_14081 ?auto_14080 )
      ( DELIVER-2PKG-VERIFY ?auto_14081 ?auto_14082 ?auto_14080 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14094 - OBJ
      ?auto_14095 - OBJ
      ?auto_14096 - OBJ
      ?auto_14093 - LOCATION
    )
    :vars
    (
      ?auto_14098 - LOCATION
      ?auto_14097 - CITY
      ?auto_14099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14098 ?auto_14097 ) ( IN-CITY ?auto_14093 ?auto_14097 ) ( not ( = ?auto_14093 ?auto_14098 ) ) ( OBJ-AT ?auto_14094 ?auto_14093 ) ( not ( = ?auto_14094 ?auto_14096 ) ) ( OBJ-AT ?auto_14096 ?auto_14098 ) ( TRUCK-AT ?auto_14099 ?auto_14093 ) ( OBJ-AT ?auto_14095 ?auto_14093 ) ( not ( = ?auto_14094 ?auto_14095 ) ) ( not ( = ?auto_14095 ?auto_14096 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14094 ?auto_14096 ?auto_14093 )
      ( DELIVER-3PKG-VERIFY ?auto_14094 ?auto_14095 ?auto_14096 ?auto_14093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14101 - OBJ
      ?auto_14102 - OBJ
      ?auto_14103 - OBJ
      ?auto_14100 - LOCATION
    )
    :vars
    (
      ?auto_14105 - LOCATION
      ?auto_14104 - CITY
      ?auto_14106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14105 ?auto_14104 ) ( IN-CITY ?auto_14100 ?auto_14104 ) ( not ( = ?auto_14100 ?auto_14105 ) ) ( OBJ-AT ?auto_14103 ?auto_14100 ) ( not ( = ?auto_14103 ?auto_14102 ) ) ( OBJ-AT ?auto_14102 ?auto_14105 ) ( TRUCK-AT ?auto_14106 ?auto_14100 ) ( OBJ-AT ?auto_14101 ?auto_14100 ) ( not ( = ?auto_14101 ?auto_14102 ) ) ( not ( = ?auto_14101 ?auto_14103 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14103 ?auto_14102 ?auto_14100 )
      ( DELIVER-3PKG-VERIFY ?auto_14101 ?auto_14102 ?auto_14103 ?auto_14100 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14115 - OBJ
      ?auto_14116 - OBJ
      ?auto_14117 - OBJ
      ?auto_14114 - LOCATION
    )
    :vars
    (
      ?auto_14119 - LOCATION
      ?auto_14118 - CITY
      ?auto_14120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14119 ?auto_14118 ) ( IN-CITY ?auto_14114 ?auto_14118 ) ( not ( = ?auto_14114 ?auto_14119 ) ) ( OBJ-AT ?auto_14117 ?auto_14114 ) ( not ( = ?auto_14117 ?auto_14115 ) ) ( OBJ-AT ?auto_14115 ?auto_14119 ) ( TRUCK-AT ?auto_14120 ?auto_14114 ) ( OBJ-AT ?auto_14116 ?auto_14114 ) ( not ( = ?auto_14115 ?auto_14116 ) ) ( not ( = ?auto_14116 ?auto_14117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14117 ?auto_14115 ?auto_14114 )
      ( DELIVER-3PKG-VERIFY ?auto_14115 ?auto_14116 ?auto_14117 ?auto_14114 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14144 - OBJ
      ?auto_14143 - LOCATION
    )
    :vars
    (
      ?auto_14146 - LOCATION
      ?auto_14145 - CITY
      ?auto_14148 - OBJ
      ?auto_14147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14146 ?auto_14145 ) ( IN-CITY ?auto_14143 ?auto_14145 ) ( not ( = ?auto_14143 ?auto_14146 ) ) ( not ( = ?auto_14148 ?auto_14144 ) ) ( OBJ-AT ?auto_14144 ?auto_14146 ) ( TRUCK-AT ?auto_14147 ?auto_14143 ) ( IN-TRUCK ?auto_14148 ?auto_14147 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14148 ?auto_14143 )
      ( DELIVER-2PKG ?auto_14148 ?auto_14144 ?auto_14143 )
      ( DELIVER-1PKG-VERIFY ?auto_14144 ?auto_14143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14150 - OBJ
      ?auto_14151 - OBJ
      ?auto_14149 - LOCATION
    )
    :vars
    (
      ?auto_14153 - LOCATION
      ?auto_14154 - CITY
      ?auto_14152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14153 ?auto_14154 ) ( IN-CITY ?auto_14149 ?auto_14154 ) ( not ( = ?auto_14149 ?auto_14153 ) ) ( not ( = ?auto_14150 ?auto_14151 ) ) ( OBJ-AT ?auto_14151 ?auto_14153 ) ( TRUCK-AT ?auto_14152 ?auto_14149 ) ( IN-TRUCK ?auto_14150 ?auto_14152 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14151 ?auto_14149 )
      ( DELIVER-2PKG-VERIFY ?auto_14150 ?auto_14151 ?auto_14149 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14156 - OBJ
      ?auto_14157 - OBJ
      ?auto_14155 - LOCATION
    )
    :vars
    (
      ?auto_14159 - LOCATION
      ?auto_14160 - CITY
      ?auto_14158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14159 ?auto_14160 ) ( IN-CITY ?auto_14155 ?auto_14160 ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( not ( = ?auto_14157 ?auto_14156 ) ) ( OBJ-AT ?auto_14156 ?auto_14159 ) ( TRUCK-AT ?auto_14158 ?auto_14155 ) ( IN-TRUCK ?auto_14157 ?auto_14158 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14157 ?auto_14156 ?auto_14155 )
      ( DELIVER-2PKG-VERIFY ?auto_14156 ?auto_14157 ?auto_14155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14219 - OBJ
      ?auto_14218 - LOCATION
    )
    :vars
    (
      ?auto_14222 - LOCATION
      ?auto_14223 - CITY
      ?auto_14220 - OBJ
      ?auto_14221 - TRUCK
      ?auto_14224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14222 ?auto_14223 ) ( IN-CITY ?auto_14218 ?auto_14223 ) ( not ( = ?auto_14218 ?auto_14222 ) ) ( not ( = ?auto_14220 ?auto_14219 ) ) ( OBJ-AT ?auto_14219 ?auto_14222 ) ( IN-TRUCK ?auto_14220 ?auto_14221 ) ( TRUCK-AT ?auto_14221 ?auto_14224 ) ( IN-CITY ?auto_14224 ?auto_14223 ) ( not ( = ?auto_14218 ?auto_14224 ) ) ( not ( = ?auto_14222 ?auto_14224 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14221 ?auto_14224 ?auto_14218 ?auto_14223 )
      ( DELIVER-2PKG ?auto_14220 ?auto_14219 ?auto_14218 )
      ( DELIVER-1PKG-VERIFY ?auto_14219 ?auto_14218 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14226 - OBJ
      ?auto_14227 - OBJ
      ?auto_14225 - LOCATION
    )
    :vars
    (
      ?auto_14228 - LOCATION
      ?auto_14230 - CITY
      ?auto_14231 - TRUCK
      ?auto_14229 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14228 ?auto_14230 ) ( IN-CITY ?auto_14225 ?auto_14230 ) ( not ( = ?auto_14225 ?auto_14228 ) ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( OBJ-AT ?auto_14227 ?auto_14228 ) ( IN-TRUCK ?auto_14226 ?auto_14231 ) ( TRUCK-AT ?auto_14231 ?auto_14229 ) ( IN-CITY ?auto_14229 ?auto_14230 ) ( not ( = ?auto_14225 ?auto_14229 ) ) ( not ( = ?auto_14228 ?auto_14229 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14227 ?auto_14225 )
      ( DELIVER-2PKG-VERIFY ?auto_14226 ?auto_14227 ?auto_14225 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14233 - OBJ
      ?auto_14234 - OBJ
      ?auto_14232 - LOCATION
    )
    :vars
    (
      ?auto_14237 - LOCATION
      ?auto_14235 - CITY
      ?auto_14236 - TRUCK
      ?auto_14238 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14237 ?auto_14235 ) ( IN-CITY ?auto_14232 ?auto_14235 ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14234 ?auto_14233 ) ) ( OBJ-AT ?auto_14233 ?auto_14237 ) ( IN-TRUCK ?auto_14234 ?auto_14236 ) ( TRUCK-AT ?auto_14236 ?auto_14238 ) ( IN-CITY ?auto_14238 ?auto_14235 ) ( not ( = ?auto_14232 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14234 ?auto_14233 ?auto_14232 )
      ( DELIVER-2PKG-VERIFY ?auto_14233 ?auto_14234 ?auto_14232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14305 - OBJ
      ?auto_14304 - LOCATION
    )
    :vars
    (
      ?auto_14309 - LOCATION
      ?auto_14306 - CITY
      ?auto_14308 - OBJ
      ?auto_14307 - TRUCK
      ?auto_14310 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14309 ?auto_14306 ) ( IN-CITY ?auto_14304 ?auto_14306 ) ( not ( = ?auto_14304 ?auto_14309 ) ) ( not ( = ?auto_14308 ?auto_14305 ) ) ( OBJ-AT ?auto_14305 ?auto_14309 ) ( TRUCK-AT ?auto_14307 ?auto_14310 ) ( IN-CITY ?auto_14310 ?auto_14306 ) ( not ( = ?auto_14304 ?auto_14310 ) ) ( not ( = ?auto_14309 ?auto_14310 ) ) ( OBJ-AT ?auto_14308 ?auto_14310 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14308 ?auto_14307 ?auto_14310 )
      ( DELIVER-2PKG ?auto_14308 ?auto_14305 ?auto_14304 )
      ( DELIVER-1PKG-VERIFY ?auto_14305 ?auto_14304 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14312 - OBJ
      ?auto_14313 - OBJ
      ?auto_14311 - LOCATION
    )
    :vars
    (
      ?auto_14316 - LOCATION
      ?auto_14314 - CITY
      ?auto_14315 - TRUCK
      ?auto_14317 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14316 ?auto_14314 ) ( IN-CITY ?auto_14311 ?auto_14314 ) ( not ( = ?auto_14311 ?auto_14316 ) ) ( not ( = ?auto_14312 ?auto_14313 ) ) ( OBJ-AT ?auto_14313 ?auto_14316 ) ( TRUCK-AT ?auto_14315 ?auto_14317 ) ( IN-CITY ?auto_14317 ?auto_14314 ) ( not ( = ?auto_14311 ?auto_14317 ) ) ( not ( = ?auto_14316 ?auto_14317 ) ) ( OBJ-AT ?auto_14312 ?auto_14317 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14313 ?auto_14311 )
      ( DELIVER-2PKG-VERIFY ?auto_14312 ?auto_14313 ?auto_14311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14319 - OBJ
      ?auto_14320 - OBJ
      ?auto_14318 - LOCATION
    )
    :vars
    (
      ?auto_14321 - LOCATION
      ?auto_14322 - CITY
      ?auto_14324 - TRUCK
      ?auto_14323 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14321 ?auto_14322 ) ( IN-CITY ?auto_14318 ?auto_14322 ) ( not ( = ?auto_14318 ?auto_14321 ) ) ( not ( = ?auto_14320 ?auto_14319 ) ) ( OBJ-AT ?auto_14319 ?auto_14321 ) ( TRUCK-AT ?auto_14324 ?auto_14323 ) ( IN-CITY ?auto_14323 ?auto_14322 ) ( not ( = ?auto_14318 ?auto_14323 ) ) ( not ( = ?auto_14321 ?auto_14323 ) ) ( OBJ-AT ?auto_14320 ?auto_14323 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14320 ?auto_14319 ?auto_14318 )
      ( DELIVER-2PKG-VERIFY ?auto_14319 ?auto_14320 ?auto_14318 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14391 - OBJ
      ?auto_14390 - LOCATION
    )
    :vars
    (
      ?auto_14392 - LOCATION
      ?auto_14393 - CITY
      ?auto_14396 - OBJ
      ?auto_14394 - LOCATION
      ?auto_14395 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14392 ?auto_14393 ) ( IN-CITY ?auto_14390 ?auto_14393 ) ( not ( = ?auto_14390 ?auto_14392 ) ) ( not ( = ?auto_14396 ?auto_14391 ) ) ( OBJ-AT ?auto_14391 ?auto_14392 ) ( IN-CITY ?auto_14394 ?auto_14393 ) ( not ( = ?auto_14390 ?auto_14394 ) ) ( not ( = ?auto_14392 ?auto_14394 ) ) ( OBJ-AT ?auto_14396 ?auto_14394 ) ( TRUCK-AT ?auto_14395 ?auto_14390 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14395 ?auto_14390 ?auto_14394 ?auto_14393 )
      ( DELIVER-2PKG ?auto_14396 ?auto_14391 ?auto_14390 )
      ( DELIVER-1PKG-VERIFY ?auto_14391 ?auto_14390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14398 - OBJ
      ?auto_14399 - OBJ
      ?auto_14397 - LOCATION
    )
    :vars
    (
      ?auto_14402 - LOCATION
      ?auto_14401 - CITY
      ?auto_14403 - LOCATION
      ?auto_14400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14402 ?auto_14401 ) ( IN-CITY ?auto_14397 ?auto_14401 ) ( not ( = ?auto_14397 ?auto_14402 ) ) ( not ( = ?auto_14398 ?auto_14399 ) ) ( OBJ-AT ?auto_14399 ?auto_14402 ) ( IN-CITY ?auto_14403 ?auto_14401 ) ( not ( = ?auto_14397 ?auto_14403 ) ) ( not ( = ?auto_14402 ?auto_14403 ) ) ( OBJ-AT ?auto_14398 ?auto_14403 ) ( TRUCK-AT ?auto_14400 ?auto_14397 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14399 ?auto_14397 )
      ( DELIVER-2PKG-VERIFY ?auto_14398 ?auto_14399 ?auto_14397 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14405 - OBJ
      ?auto_14406 - OBJ
      ?auto_14404 - LOCATION
    )
    :vars
    (
      ?auto_14409 - LOCATION
      ?auto_14407 - CITY
      ?auto_14408 - LOCATION
      ?auto_14410 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14409 ?auto_14407 ) ( IN-CITY ?auto_14404 ?auto_14407 ) ( not ( = ?auto_14404 ?auto_14409 ) ) ( not ( = ?auto_14406 ?auto_14405 ) ) ( OBJ-AT ?auto_14405 ?auto_14409 ) ( IN-CITY ?auto_14408 ?auto_14407 ) ( not ( = ?auto_14404 ?auto_14408 ) ) ( not ( = ?auto_14409 ?auto_14408 ) ) ( OBJ-AT ?auto_14406 ?auto_14408 ) ( TRUCK-AT ?auto_14410 ?auto_14404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14406 ?auto_14405 ?auto_14404 )
      ( DELIVER-2PKG-VERIFY ?auto_14405 ?auto_14406 ?auto_14404 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14570 - OBJ
      ?auto_14569 - LOCATION
    )
    :vars
    (
      ?auto_14571 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14571 ?auto_14569 ) ( IN-TRUCK ?auto_14570 ?auto_14571 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14570 ?auto_14571 ?auto_14569 )
      ( DELIVER-1PKG-VERIFY ?auto_14570 ?auto_14569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14573 - OBJ
      ?auto_14574 - OBJ
      ?auto_14572 - LOCATION
    )
    :vars
    (
      ?auto_14575 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14575 ?auto_14572 ) ( IN-TRUCK ?auto_14574 ?auto_14575 ) ( OBJ-AT ?auto_14573 ?auto_14572 ) ( not ( = ?auto_14573 ?auto_14574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14574 ?auto_14572 )
      ( DELIVER-2PKG-VERIFY ?auto_14573 ?auto_14574 ?auto_14572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14577 - OBJ
      ?auto_14578 - OBJ
      ?auto_14576 - LOCATION
    )
    :vars
    (
      ?auto_14579 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14579 ?auto_14576 ) ( IN-TRUCK ?auto_14578 ?auto_14579 ) ( OBJ-AT ?auto_14577 ?auto_14576 ) ( not ( = ?auto_14577 ?auto_14578 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14578 ?auto_14576 )
      ( DELIVER-2PKG-VERIFY ?auto_14577 ?auto_14578 ?auto_14576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14581 - OBJ
      ?auto_14582 - OBJ
      ?auto_14580 - LOCATION
    )
    :vars
    (
      ?auto_14583 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14583 ?auto_14580 ) ( IN-TRUCK ?auto_14581 ?auto_14583 ) ( OBJ-AT ?auto_14582 ?auto_14580 ) ( not ( = ?auto_14581 ?auto_14582 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14581 ?auto_14580 )
      ( DELIVER-2PKG-VERIFY ?auto_14581 ?auto_14582 ?auto_14580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14585 - OBJ
      ?auto_14586 - OBJ
      ?auto_14584 - LOCATION
    )
    :vars
    (
      ?auto_14587 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14587 ?auto_14584 ) ( IN-TRUCK ?auto_14585 ?auto_14587 ) ( OBJ-AT ?auto_14586 ?auto_14584 ) ( not ( = ?auto_14585 ?auto_14586 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14585 ?auto_14584 )
      ( DELIVER-2PKG-VERIFY ?auto_14585 ?auto_14586 ?auto_14584 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14593 - OBJ
      ?auto_14594 - OBJ
      ?auto_14595 - OBJ
      ?auto_14592 - LOCATION
    )
    :vars
    (
      ?auto_14596 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14596 ?auto_14592 ) ( IN-TRUCK ?auto_14595 ?auto_14596 ) ( OBJ-AT ?auto_14593 ?auto_14592 ) ( OBJ-AT ?auto_14594 ?auto_14592 ) ( not ( = ?auto_14593 ?auto_14594 ) ) ( not ( = ?auto_14593 ?auto_14595 ) ) ( not ( = ?auto_14594 ?auto_14595 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14595 ?auto_14592 )
      ( DELIVER-3PKG-VERIFY ?auto_14593 ?auto_14594 ?auto_14595 ?auto_14592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14598 - OBJ
      ?auto_14599 - OBJ
      ?auto_14600 - OBJ
      ?auto_14597 - LOCATION
    )
    :vars
    (
      ?auto_14601 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14601 ?auto_14597 ) ( IN-TRUCK ?auto_14600 ?auto_14601 ) ( OBJ-AT ?auto_14598 ?auto_14597 ) ( OBJ-AT ?auto_14599 ?auto_14597 ) ( not ( = ?auto_14598 ?auto_14599 ) ) ( not ( = ?auto_14598 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14600 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14600 ?auto_14597 )
      ( DELIVER-3PKG-VERIFY ?auto_14598 ?auto_14599 ?auto_14600 ?auto_14597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14603 - OBJ
      ?auto_14604 - OBJ
      ?auto_14605 - OBJ
      ?auto_14602 - LOCATION
    )
    :vars
    (
      ?auto_14606 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14606 ?auto_14602 ) ( IN-TRUCK ?auto_14604 ?auto_14606 ) ( OBJ-AT ?auto_14603 ?auto_14602 ) ( OBJ-AT ?auto_14605 ?auto_14602 ) ( not ( = ?auto_14603 ?auto_14604 ) ) ( not ( = ?auto_14603 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14605 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14604 ?auto_14602 )
      ( DELIVER-3PKG-VERIFY ?auto_14603 ?auto_14604 ?auto_14605 ?auto_14602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14608 - OBJ
      ?auto_14609 - OBJ
      ?auto_14610 - OBJ
      ?auto_14607 - LOCATION
    )
    :vars
    (
      ?auto_14611 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14611 ?auto_14607 ) ( IN-TRUCK ?auto_14609 ?auto_14611 ) ( OBJ-AT ?auto_14608 ?auto_14607 ) ( OBJ-AT ?auto_14610 ?auto_14607 ) ( not ( = ?auto_14608 ?auto_14609 ) ) ( not ( = ?auto_14608 ?auto_14610 ) ) ( not ( = ?auto_14609 ?auto_14610 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14609 ?auto_14607 )
      ( DELIVER-3PKG-VERIFY ?auto_14608 ?auto_14609 ?auto_14610 ?auto_14607 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14618 - OBJ
      ?auto_14619 - OBJ
      ?auto_14620 - OBJ
      ?auto_14617 - LOCATION
    )
    :vars
    (
      ?auto_14621 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14621 ?auto_14617 ) ( IN-TRUCK ?auto_14620 ?auto_14621 ) ( OBJ-AT ?auto_14618 ?auto_14617 ) ( OBJ-AT ?auto_14619 ?auto_14617 ) ( not ( = ?auto_14618 ?auto_14619 ) ) ( not ( = ?auto_14618 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14620 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14620 ?auto_14617 )
      ( DELIVER-3PKG-VERIFY ?auto_14618 ?auto_14619 ?auto_14620 ?auto_14617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14623 - OBJ
      ?auto_14624 - OBJ
      ?auto_14625 - OBJ
      ?auto_14622 - LOCATION
    )
    :vars
    (
      ?auto_14626 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14626 ?auto_14622 ) ( IN-TRUCK ?auto_14625 ?auto_14626 ) ( OBJ-AT ?auto_14623 ?auto_14622 ) ( OBJ-AT ?auto_14624 ?auto_14622 ) ( not ( = ?auto_14623 ?auto_14624 ) ) ( not ( = ?auto_14623 ?auto_14625 ) ) ( not ( = ?auto_14624 ?auto_14625 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14625 ?auto_14622 )
      ( DELIVER-3PKG-VERIFY ?auto_14623 ?auto_14624 ?auto_14625 ?auto_14622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14628 - OBJ
      ?auto_14629 - OBJ
      ?auto_14630 - OBJ
      ?auto_14627 - LOCATION
    )
    :vars
    (
      ?auto_14631 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14631 ?auto_14627 ) ( IN-TRUCK ?auto_14629 ?auto_14631 ) ( OBJ-AT ?auto_14628 ?auto_14627 ) ( OBJ-AT ?auto_14630 ?auto_14627 ) ( not ( = ?auto_14628 ?auto_14629 ) ) ( not ( = ?auto_14628 ?auto_14630 ) ) ( not ( = ?auto_14629 ?auto_14630 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14629 ?auto_14627 )
      ( DELIVER-3PKG-VERIFY ?auto_14628 ?auto_14629 ?auto_14630 ?auto_14627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14633 - OBJ
      ?auto_14634 - OBJ
      ?auto_14635 - OBJ
      ?auto_14632 - LOCATION
    )
    :vars
    (
      ?auto_14636 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14636 ?auto_14632 ) ( IN-TRUCK ?auto_14634 ?auto_14636 ) ( OBJ-AT ?auto_14633 ?auto_14632 ) ( OBJ-AT ?auto_14635 ?auto_14632 ) ( not ( = ?auto_14633 ?auto_14634 ) ) ( not ( = ?auto_14633 ?auto_14635 ) ) ( not ( = ?auto_14634 ?auto_14635 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14634 ?auto_14632 )
      ( DELIVER-3PKG-VERIFY ?auto_14633 ?auto_14634 ?auto_14635 ?auto_14632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14643 - OBJ
      ?auto_14644 - OBJ
      ?auto_14645 - OBJ
      ?auto_14642 - LOCATION
    )
    :vars
    (
      ?auto_14646 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14646 ?auto_14642 ) ( IN-TRUCK ?auto_14643 ?auto_14646 ) ( OBJ-AT ?auto_14644 ?auto_14642 ) ( OBJ-AT ?auto_14645 ?auto_14642 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14643 ?auto_14642 )
      ( DELIVER-3PKG-VERIFY ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14648 - OBJ
      ?auto_14649 - OBJ
      ?auto_14650 - OBJ
      ?auto_14647 - LOCATION
    )
    :vars
    (
      ?auto_14651 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14651 ?auto_14647 ) ( IN-TRUCK ?auto_14648 ?auto_14651 ) ( OBJ-AT ?auto_14649 ?auto_14647 ) ( OBJ-AT ?auto_14650 ?auto_14647 ) ( not ( = ?auto_14648 ?auto_14649 ) ) ( not ( = ?auto_14648 ?auto_14650 ) ) ( not ( = ?auto_14649 ?auto_14650 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14648 ?auto_14647 )
      ( DELIVER-3PKG-VERIFY ?auto_14648 ?auto_14649 ?auto_14650 ?auto_14647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14658 - OBJ
      ?auto_14659 - OBJ
      ?auto_14660 - OBJ
      ?auto_14657 - LOCATION
    )
    :vars
    (
      ?auto_14661 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14661 ?auto_14657 ) ( IN-TRUCK ?auto_14658 ?auto_14661 ) ( OBJ-AT ?auto_14659 ?auto_14657 ) ( OBJ-AT ?auto_14660 ?auto_14657 ) ( not ( = ?auto_14658 ?auto_14659 ) ) ( not ( = ?auto_14658 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14660 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14658 ?auto_14657 )
      ( DELIVER-3PKG-VERIFY ?auto_14658 ?auto_14659 ?auto_14660 ?auto_14657 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14663 - OBJ
      ?auto_14664 - OBJ
      ?auto_14665 - OBJ
      ?auto_14662 - LOCATION
    )
    :vars
    (
      ?auto_14666 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14666 ?auto_14662 ) ( IN-TRUCK ?auto_14663 ?auto_14666 ) ( OBJ-AT ?auto_14664 ?auto_14662 ) ( OBJ-AT ?auto_14665 ?auto_14662 ) ( not ( = ?auto_14663 ?auto_14664 ) ) ( not ( = ?auto_14663 ?auto_14665 ) ) ( not ( = ?auto_14664 ?auto_14665 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14663 ?auto_14662 )
      ( DELIVER-3PKG-VERIFY ?auto_14663 ?auto_14664 ?auto_14665 ?auto_14662 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14688 - OBJ
      ?auto_14687 - LOCATION
    )
    :vars
    (
      ?auto_14689 - TRUCK
      ?auto_14690 - LOCATION
      ?auto_14691 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14688 ?auto_14689 ) ( TRUCK-AT ?auto_14689 ?auto_14690 ) ( IN-CITY ?auto_14690 ?auto_14691 ) ( IN-CITY ?auto_14687 ?auto_14691 ) ( not ( = ?auto_14687 ?auto_14690 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14689 ?auto_14690 ?auto_14687 ?auto_14691 )
      ( DELIVER-1PKG ?auto_14688 ?auto_14687 )
      ( DELIVER-1PKG-VERIFY ?auto_14688 ?auto_14687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14693 - OBJ
      ?auto_14694 - OBJ
      ?auto_14692 - LOCATION
    )
    :vars
    (
      ?auto_14697 - TRUCK
      ?auto_14695 - LOCATION
      ?auto_14696 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14694 ?auto_14697 ) ( TRUCK-AT ?auto_14697 ?auto_14695 ) ( IN-CITY ?auto_14695 ?auto_14696 ) ( IN-CITY ?auto_14692 ?auto_14696 ) ( not ( = ?auto_14692 ?auto_14695 ) ) ( OBJ-AT ?auto_14693 ?auto_14692 ) ( not ( = ?auto_14693 ?auto_14694 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14694 ?auto_14692 )
      ( DELIVER-2PKG-VERIFY ?auto_14693 ?auto_14694 ?auto_14692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14699 - OBJ
      ?auto_14700 - OBJ
      ?auto_14698 - LOCATION
    )
    :vars
    (
      ?auto_14701 - TRUCK
      ?auto_14703 - LOCATION
      ?auto_14702 - CITY
      ?auto_14704 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14700 ?auto_14701 ) ( TRUCK-AT ?auto_14701 ?auto_14703 ) ( IN-CITY ?auto_14703 ?auto_14702 ) ( IN-CITY ?auto_14698 ?auto_14702 ) ( not ( = ?auto_14698 ?auto_14703 ) ) ( OBJ-AT ?auto_14704 ?auto_14698 ) ( not ( = ?auto_14704 ?auto_14700 ) ) ( OBJ-AT ?auto_14699 ?auto_14698 ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14704 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14704 ?auto_14700 ?auto_14698 )
      ( DELIVER-2PKG-VERIFY ?auto_14699 ?auto_14700 ?auto_14698 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14706 - OBJ
      ?auto_14707 - OBJ
      ?auto_14705 - LOCATION
    )
    :vars
    (
      ?auto_14708 - TRUCK
      ?auto_14710 - LOCATION
      ?auto_14709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14706 ?auto_14708 ) ( TRUCK-AT ?auto_14708 ?auto_14710 ) ( IN-CITY ?auto_14710 ?auto_14709 ) ( IN-CITY ?auto_14705 ?auto_14709 ) ( not ( = ?auto_14705 ?auto_14710 ) ) ( OBJ-AT ?auto_14707 ?auto_14705 ) ( not ( = ?auto_14707 ?auto_14706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14707 ?auto_14706 ?auto_14705 )
      ( DELIVER-2PKG-VERIFY ?auto_14706 ?auto_14707 ?auto_14705 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14712 - OBJ
      ?auto_14713 - OBJ
      ?auto_14711 - LOCATION
    )
    :vars
    (
      ?auto_14714 - TRUCK
      ?auto_14716 - LOCATION
      ?auto_14715 - CITY
      ?auto_14717 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14712 ?auto_14714 ) ( TRUCK-AT ?auto_14714 ?auto_14716 ) ( IN-CITY ?auto_14716 ?auto_14715 ) ( IN-CITY ?auto_14711 ?auto_14715 ) ( not ( = ?auto_14711 ?auto_14716 ) ) ( OBJ-AT ?auto_14717 ?auto_14711 ) ( not ( = ?auto_14717 ?auto_14712 ) ) ( OBJ-AT ?auto_14713 ?auto_14711 ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( not ( = ?auto_14713 ?auto_14717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14717 ?auto_14712 ?auto_14711 )
      ( DELIVER-2PKG-VERIFY ?auto_14712 ?auto_14713 ?auto_14711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14726 - OBJ
      ?auto_14727 - OBJ
      ?auto_14728 - OBJ
      ?auto_14725 - LOCATION
    )
    :vars
    (
      ?auto_14729 - TRUCK
      ?auto_14731 - LOCATION
      ?auto_14730 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14728 ?auto_14729 ) ( TRUCK-AT ?auto_14729 ?auto_14731 ) ( IN-CITY ?auto_14731 ?auto_14730 ) ( IN-CITY ?auto_14725 ?auto_14730 ) ( not ( = ?auto_14725 ?auto_14731 ) ) ( OBJ-AT ?auto_14727 ?auto_14725 ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( OBJ-AT ?auto_14726 ?auto_14725 ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14727 ?auto_14728 ?auto_14725 )
      ( DELIVER-3PKG-VERIFY ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14733 - OBJ
      ?auto_14734 - OBJ
      ?auto_14735 - OBJ
      ?auto_14732 - LOCATION
    )
    :vars
    (
      ?auto_14736 - TRUCK
      ?auto_14738 - LOCATION
      ?auto_14737 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14735 ?auto_14736 ) ( TRUCK-AT ?auto_14736 ?auto_14738 ) ( IN-CITY ?auto_14738 ?auto_14737 ) ( IN-CITY ?auto_14732 ?auto_14737 ) ( not ( = ?auto_14732 ?auto_14738 ) ) ( OBJ-AT ?auto_14733 ?auto_14732 ) ( not ( = ?auto_14733 ?auto_14735 ) ) ( OBJ-AT ?auto_14734 ?auto_14732 ) ( not ( = ?auto_14733 ?auto_14734 ) ) ( not ( = ?auto_14734 ?auto_14735 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14733 ?auto_14735 ?auto_14732 )
      ( DELIVER-3PKG-VERIFY ?auto_14733 ?auto_14734 ?auto_14735 ?auto_14732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14740 - OBJ
      ?auto_14741 - OBJ
      ?auto_14742 - OBJ
      ?auto_14739 - LOCATION
    )
    :vars
    (
      ?auto_14743 - TRUCK
      ?auto_14745 - LOCATION
      ?auto_14744 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14741 ?auto_14743 ) ( TRUCK-AT ?auto_14743 ?auto_14745 ) ( IN-CITY ?auto_14745 ?auto_14744 ) ( IN-CITY ?auto_14739 ?auto_14744 ) ( not ( = ?auto_14739 ?auto_14745 ) ) ( OBJ-AT ?auto_14742 ?auto_14739 ) ( not ( = ?auto_14742 ?auto_14741 ) ) ( OBJ-AT ?auto_14740 ?auto_14739 ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14742 ?auto_14741 ?auto_14739 )
      ( DELIVER-3PKG-VERIFY ?auto_14740 ?auto_14741 ?auto_14742 ?auto_14739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14747 - OBJ
      ?auto_14748 - OBJ
      ?auto_14749 - OBJ
      ?auto_14746 - LOCATION
    )
    :vars
    (
      ?auto_14750 - TRUCK
      ?auto_14752 - LOCATION
      ?auto_14751 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14748 ?auto_14750 ) ( TRUCK-AT ?auto_14750 ?auto_14752 ) ( IN-CITY ?auto_14752 ?auto_14751 ) ( IN-CITY ?auto_14746 ?auto_14751 ) ( not ( = ?auto_14746 ?auto_14752 ) ) ( OBJ-AT ?auto_14747 ?auto_14746 ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( OBJ-AT ?auto_14749 ?auto_14746 ) ( not ( = ?auto_14747 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14747 ?auto_14748 ?auto_14746 )
      ( DELIVER-3PKG-VERIFY ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14761 - OBJ
      ?auto_14762 - OBJ
      ?auto_14763 - OBJ
      ?auto_14760 - LOCATION
    )
    :vars
    (
      ?auto_14764 - TRUCK
      ?auto_14766 - LOCATION
      ?auto_14765 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14763 ?auto_14764 ) ( TRUCK-AT ?auto_14764 ?auto_14766 ) ( IN-CITY ?auto_14766 ?auto_14765 ) ( IN-CITY ?auto_14760 ?auto_14765 ) ( not ( = ?auto_14760 ?auto_14766 ) ) ( OBJ-AT ?auto_14762 ?auto_14760 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( OBJ-AT ?auto_14761 ?auto_14760 ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14762 ?auto_14763 ?auto_14760 )
      ( DELIVER-3PKG-VERIFY ?auto_14761 ?auto_14762 ?auto_14763 ?auto_14760 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14768 - OBJ
      ?auto_14769 - OBJ
      ?auto_14770 - OBJ
      ?auto_14767 - LOCATION
    )
    :vars
    (
      ?auto_14771 - TRUCK
      ?auto_14773 - LOCATION
      ?auto_14772 - CITY
      ?auto_14774 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14770 ?auto_14771 ) ( TRUCK-AT ?auto_14771 ?auto_14773 ) ( IN-CITY ?auto_14773 ?auto_14772 ) ( IN-CITY ?auto_14767 ?auto_14772 ) ( not ( = ?auto_14767 ?auto_14773 ) ) ( OBJ-AT ?auto_14774 ?auto_14767 ) ( not ( = ?auto_14774 ?auto_14770 ) ) ( OBJ-AT ?auto_14768 ?auto_14767 ) ( OBJ-AT ?auto_14769 ?auto_14767 ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( not ( = ?auto_14768 ?auto_14770 ) ) ( not ( = ?auto_14768 ?auto_14774 ) ) ( not ( = ?auto_14769 ?auto_14770 ) ) ( not ( = ?auto_14769 ?auto_14774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14774 ?auto_14770 ?auto_14767 )
      ( DELIVER-3PKG-VERIFY ?auto_14768 ?auto_14769 ?auto_14770 ?auto_14767 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14776 - OBJ
      ?auto_14777 - OBJ
      ?auto_14778 - OBJ
      ?auto_14775 - LOCATION
    )
    :vars
    (
      ?auto_14779 - TRUCK
      ?auto_14781 - LOCATION
      ?auto_14780 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14777 ?auto_14779 ) ( TRUCK-AT ?auto_14779 ?auto_14781 ) ( IN-CITY ?auto_14781 ?auto_14780 ) ( IN-CITY ?auto_14775 ?auto_14780 ) ( not ( = ?auto_14775 ?auto_14781 ) ) ( OBJ-AT ?auto_14778 ?auto_14775 ) ( not ( = ?auto_14778 ?auto_14777 ) ) ( OBJ-AT ?auto_14776 ?auto_14775 ) ( not ( = ?auto_14776 ?auto_14777 ) ) ( not ( = ?auto_14776 ?auto_14778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14778 ?auto_14777 ?auto_14775 )
      ( DELIVER-3PKG-VERIFY ?auto_14776 ?auto_14777 ?auto_14778 ?auto_14775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14783 - OBJ
      ?auto_14784 - OBJ
      ?auto_14785 - OBJ
      ?auto_14782 - LOCATION
    )
    :vars
    (
      ?auto_14786 - TRUCK
      ?auto_14788 - LOCATION
      ?auto_14787 - CITY
      ?auto_14789 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14784 ?auto_14786 ) ( TRUCK-AT ?auto_14786 ?auto_14788 ) ( IN-CITY ?auto_14788 ?auto_14787 ) ( IN-CITY ?auto_14782 ?auto_14787 ) ( not ( = ?auto_14782 ?auto_14788 ) ) ( OBJ-AT ?auto_14789 ?auto_14782 ) ( not ( = ?auto_14789 ?auto_14784 ) ) ( OBJ-AT ?auto_14783 ?auto_14782 ) ( OBJ-AT ?auto_14785 ?auto_14782 ) ( not ( = ?auto_14783 ?auto_14784 ) ) ( not ( = ?auto_14783 ?auto_14785 ) ) ( not ( = ?auto_14783 ?auto_14789 ) ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14785 ?auto_14789 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14789 ?auto_14784 ?auto_14782 )
      ( DELIVER-3PKG-VERIFY ?auto_14783 ?auto_14784 ?auto_14785 ?auto_14782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14799 - OBJ
      ?auto_14800 - OBJ
      ?auto_14801 - OBJ
      ?auto_14798 - LOCATION
    )
    :vars
    (
      ?auto_14802 - TRUCK
      ?auto_14804 - LOCATION
      ?auto_14803 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14799 ?auto_14802 ) ( TRUCK-AT ?auto_14802 ?auto_14804 ) ( IN-CITY ?auto_14804 ?auto_14803 ) ( IN-CITY ?auto_14798 ?auto_14803 ) ( not ( = ?auto_14798 ?auto_14804 ) ) ( OBJ-AT ?auto_14801 ?auto_14798 ) ( not ( = ?auto_14801 ?auto_14799 ) ) ( OBJ-AT ?auto_14800 ?auto_14798 ) ( not ( = ?auto_14799 ?auto_14800 ) ) ( not ( = ?auto_14800 ?auto_14801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14801 ?auto_14799 ?auto_14798 )
      ( DELIVER-3PKG-VERIFY ?auto_14799 ?auto_14800 ?auto_14801 ?auto_14798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14806 - OBJ
      ?auto_14807 - OBJ
      ?auto_14808 - OBJ
      ?auto_14805 - LOCATION
    )
    :vars
    (
      ?auto_14809 - TRUCK
      ?auto_14811 - LOCATION
      ?auto_14810 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14806 ?auto_14809 ) ( TRUCK-AT ?auto_14809 ?auto_14811 ) ( IN-CITY ?auto_14811 ?auto_14810 ) ( IN-CITY ?auto_14805 ?auto_14810 ) ( not ( = ?auto_14805 ?auto_14811 ) ) ( OBJ-AT ?auto_14807 ?auto_14805 ) ( not ( = ?auto_14807 ?auto_14806 ) ) ( OBJ-AT ?auto_14808 ?auto_14805 ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14807 ?auto_14806 ?auto_14805 )
      ( DELIVER-3PKG-VERIFY ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14820 - OBJ
      ?auto_14821 - OBJ
      ?auto_14822 - OBJ
      ?auto_14819 - LOCATION
    )
    :vars
    (
      ?auto_14823 - TRUCK
      ?auto_14825 - LOCATION
      ?auto_14824 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14820 ?auto_14823 ) ( TRUCK-AT ?auto_14823 ?auto_14825 ) ( IN-CITY ?auto_14825 ?auto_14824 ) ( IN-CITY ?auto_14819 ?auto_14824 ) ( not ( = ?auto_14819 ?auto_14825 ) ) ( OBJ-AT ?auto_14822 ?auto_14819 ) ( not ( = ?auto_14822 ?auto_14820 ) ) ( OBJ-AT ?auto_14821 ?auto_14819 ) ( not ( = ?auto_14820 ?auto_14821 ) ) ( not ( = ?auto_14821 ?auto_14822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14822 ?auto_14820 ?auto_14819 )
      ( DELIVER-3PKG-VERIFY ?auto_14820 ?auto_14821 ?auto_14822 ?auto_14819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14827 - OBJ
      ?auto_14828 - OBJ
      ?auto_14829 - OBJ
      ?auto_14826 - LOCATION
    )
    :vars
    (
      ?auto_14830 - TRUCK
      ?auto_14832 - LOCATION
      ?auto_14831 - CITY
      ?auto_14833 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14827 ?auto_14830 ) ( TRUCK-AT ?auto_14830 ?auto_14832 ) ( IN-CITY ?auto_14832 ?auto_14831 ) ( IN-CITY ?auto_14826 ?auto_14831 ) ( not ( = ?auto_14826 ?auto_14832 ) ) ( OBJ-AT ?auto_14833 ?auto_14826 ) ( not ( = ?auto_14833 ?auto_14827 ) ) ( OBJ-AT ?auto_14828 ?auto_14826 ) ( OBJ-AT ?auto_14829 ?auto_14826 ) ( not ( = ?auto_14827 ?auto_14828 ) ) ( not ( = ?auto_14827 ?auto_14829 ) ) ( not ( = ?auto_14828 ?auto_14829 ) ) ( not ( = ?auto_14828 ?auto_14833 ) ) ( not ( = ?auto_14829 ?auto_14833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14833 ?auto_14827 ?auto_14826 )
      ( DELIVER-3PKG-VERIFY ?auto_14827 ?auto_14828 ?auto_14829 ?auto_14826 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14866 - OBJ
      ?auto_14865 - LOCATION
    )
    :vars
    (
      ?auto_14867 - TRUCK
      ?auto_14869 - LOCATION
      ?auto_14868 - CITY
      ?auto_14870 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14867 ?auto_14869 ) ( IN-CITY ?auto_14869 ?auto_14868 ) ( IN-CITY ?auto_14865 ?auto_14868 ) ( not ( = ?auto_14865 ?auto_14869 ) ) ( OBJ-AT ?auto_14870 ?auto_14865 ) ( not ( = ?auto_14870 ?auto_14866 ) ) ( OBJ-AT ?auto_14866 ?auto_14869 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14866 ?auto_14867 ?auto_14869 )
      ( DELIVER-2PKG ?auto_14870 ?auto_14866 ?auto_14865 )
      ( DELIVER-1PKG-VERIFY ?auto_14866 ?auto_14865 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14872 - OBJ
      ?auto_14873 - OBJ
      ?auto_14871 - LOCATION
    )
    :vars
    (
      ?auto_14876 - TRUCK
      ?auto_14874 - LOCATION
      ?auto_14875 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14876 ?auto_14874 ) ( IN-CITY ?auto_14874 ?auto_14875 ) ( IN-CITY ?auto_14871 ?auto_14875 ) ( not ( = ?auto_14871 ?auto_14874 ) ) ( OBJ-AT ?auto_14872 ?auto_14871 ) ( not ( = ?auto_14872 ?auto_14873 ) ) ( OBJ-AT ?auto_14873 ?auto_14874 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14873 ?auto_14871 )
      ( DELIVER-2PKG-VERIFY ?auto_14872 ?auto_14873 ?auto_14871 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14878 - OBJ
      ?auto_14879 - OBJ
      ?auto_14877 - LOCATION
    )
    :vars
    (
      ?auto_14881 - TRUCK
      ?auto_14880 - LOCATION
      ?auto_14882 - CITY
      ?auto_14883 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14881 ?auto_14880 ) ( IN-CITY ?auto_14880 ?auto_14882 ) ( IN-CITY ?auto_14877 ?auto_14882 ) ( not ( = ?auto_14877 ?auto_14880 ) ) ( OBJ-AT ?auto_14883 ?auto_14877 ) ( not ( = ?auto_14883 ?auto_14879 ) ) ( OBJ-AT ?auto_14879 ?auto_14880 ) ( OBJ-AT ?auto_14878 ?auto_14877 ) ( not ( = ?auto_14878 ?auto_14879 ) ) ( not ( = ?auto_14878 ?auto_14883 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14883 ?auto_14879 ?auto_14877 )
      ( DELIVER-2PKG-VERIFY ?auto_14878 ?auto_14879 ?auto_14877 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14885 - OBJ
      ?auto_14886 - OBJ
      ?auto_14884 - LOCATION
    )
    :vars
    (
      ?auto_14888 - TRUCK
      ?auto_14887 - LOCATION
      ?auto_14889 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14888 ?auto_14887 ) ( IN-CITY ?auto_14887 ?auto_14889 ) ( IN-CITY ?auto_14884 ?auto_14889 ) ( not ( = ?auto_14884 ?auto_14887 ) ) ( OBJ-AT ?auto_14886 ?auto_14884 ) ( not ( = ?auto_14886 ?auto_14885 ) ) ( OBJ-AT ?auto_14885 ?auto_14887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14886 ?auto_14885 ?auto_14884 )
      ( DELIVER-2PKG-VERIFY ?auto_14885 ?auto_14886 ?auto_14884 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14891 - OBJ
      ?auto_14892 - OBJ
      ?auto_14890 - LOCATION
    )
    :vars
    (
      ?auto_14894 - TRUCK
      ?auto_14893 - LOCATION
      ?auto_14895 - CITY
      ?auto_14896 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14894 ?auto_14893 ) ( IN-CITY ?auto_14893 ?auto_14895 ) ( IN-CITY ?auto_14890 ?auto_14895 ) ( not ( = ?auto_14890 ?auto_14893 ) ) ( OBJ-AT ?auto_14896 ?auto_14890 ) ( not ( = ?auto_14896 ?auto_14891 ) ) ( OBJ-AT ?auto_14891 ?auto_14893 ) ( OBJ-AT ?auto_14892 ?auto_14890 ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14896 ?auto_14891 ?auto_14890 )
      ( DELIVER-2PKG-VERIFY ?auto_14891 ?auto_14892 ?auto_14890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14905 - OBJ
      ?auto_14906 - OBJ
      ?auto_14907 - OBJ
      ?auto_14904 - LOCATION
    )
    :vars
    (
      ?auto_14909 - TRUCK
      ?auto_14908 - LOCATION
      ?auto_14910 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14909 ?auto_14908 ) ( IN-CITY ?auto_14908 ?auto_14910 ) ( IN-CITY ?auto_14904 ?auto_14910 ) ( not ( = ?auto_14904 ?auto_14908 ) ) ( OBJ-AT ?auto_14906 ?auto_14904 ) ( not ( = ?auto_14906 ?auto_14907 ) ) ( OBJ-AT ?auto_14907 ?auto_14908 ) ( OBJ-AT ?auto_14905 ?auto_14904 ) ( not ( = ?auto_14905 ?auto_14906 ) ) ( not ( = ?auto_14905 ?auto_14907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14906 ?auto_14907 ?auto_14904 )
      ( DELIVER-3PKG-VERIFY ?auto_14905 ?auto_14906 ?auto_14907 ?auto_14904 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14912 - OBJ
      ?auto_14913 - OBJ
      ?auto_14914 - OBJ
      ?auto_14911 - LOCATION
    )
    :vars
    (
      ?auto_14916 - TRUCK
      ?auto_14915 - LOCATION
      ?auto_14917 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14916 ?auto_14915 ) ( IN-CITY ?auto_14915 ?auto_14917 ) ( IN-CITY ?auto_14911 ?auto_14917 ) ( not ( = ?auto_14911 ?auto_14915 ) ) ( OBJ-AT ?auto_14912 ?auto_14911 ) ( not ( = ?auto_14912 ?auto_14914 ) ) ( OBJ-AT ?auto_14914 ?auto_14915 ) ( OBJ-AT ?auto_14913 ?auto_14911 ) ( not ( = ?auto_14912 ?auto_14913 ) ) ( not ( = ?auto_14913 ?auto_14914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14912 ?auto_14914 ?auto_14911 )
      ( DELIVER-3PKG-VERIFY ?auto_14912 ?auto_14913 ?auto_14914 ?auto_14911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14919 - OBJ
      ?auto_14920 - OBJ
      ?auto_14921 - OBJ
      ?auto_14918 - LOCATION
    )
    :vars
    (
      ?auto_14923 - TRUCK
      ?auto_14922 - LOCATION
      ?auto_14924 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14923 ?auto_14922 ) ( IN-CITY ?auto_14922 ?auto_14924 ) ( IN-CITY ?auto_14918 ?auto_14924 ) ( not ( = ?auto_14918 ?auto_14922 ) ) ( OBJ-AT ?auto_14921 ?auto_14918 ) ( not ( = ?auto_14921 ?auto_14920 ) ) ( OBJ-AT ?auto_14920 ?auto_14922 ) ( OBJ-AT ?auto_14919 ?auto_14918 ) ( not ( = ?auto_14919 ?auto_14920 ) ) ( not ( = ?auto_14919 ?auto_14921 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14921 ?auto_14920 ?auto_14918 )
      ( DELIVER-3PKG-VERIFY ?auto_14919 ?auto_14920 ?auto_14921 ?auto_14918 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14926 - OBJ
      ?auto_14927 - OBJ
      ?auto_14928 - OBJ
      ?auto_14925 - LOCATION
    )
    :vars
    (
      ?auto_14930 - TRUCK
      ?auto_14929 - LOCATION
      ?auto_14931 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14930 ?auto_14929 ) ( IN-CITY ?auto_14929 ?auto_14931 ) ( IN-CITY ?auto_14925 ?auto_14931 ) ( not ( = ?auto_14925 ?auto_14929 ) ) ( OBJ-AT ?auto_14926 ?auto_14925 ) ( not ( = ?auto_14926 ?auto_14927 ) ) ( OBJ-AT ?auto_14927 ?auto_14929 ) ( OBJ-AT ?auto_14928 ?auto_14925 ) ( not ( = ?auto_14926 ?auto_14928 ) ) ( not ( = ?auto_14927 ?auto_14928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14926 ?auto_14927 ?auto_14925 )
      ( DELIVER-3PKG-VERIFY ?auto_14926 ?auto_14927 ?auto_14928 ?auto_14925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14940 - OBJ
      ?auto_14941 - OBJ
      ?auto_14942 - OBJ
      ?auto_14939 - LOCATION
    )
    :vars
    (
      ?auto_14944 - TRUCK
      ?auto_14943 - LOCATION
      ?auto_14945 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14944 ?auto_14943 ) ( IN-CITY ?auto_14943 ?auto_14945 ) ( IN-CITY ?auto_14939 ?auto_14945 ) ( not ( = ?auto_14939 ?auto_14943 ) ) ( OBJ-AT ?auto_14941 ?auto_14939 ) ( not ( = ?auto_14941 ?auto_14942 ) ) ( OBJ-AT ?auto_14942 ?auto_14943 ) ( OBJ-AT ?auto_14940 ?auto_14939 ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14941 ?auto_14942 ?auto_14939 )
      ( DELIVER-3PKG-VERIFY ?auto_14940 ?auto_14941 ?auto_14942 ?auto_14939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14947 - OBJ
      ?auto_14948 - OBJ
      ?auto_14949 - OBJ
      ?auto_14946 - LOCATION
    )
    :vars
    (
      ?auto_14951 - TRUCK
      ?auto_14950 - LOCATION
      ?auto_14952 - CITY
      ?auto_14953 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14951 ?auto_14950 ) ( IN-CITY ?auto_14950 ?auto_14952 ) ( IN-CITY ?auto_14946 ?auto_14952 ) ( not ( = ?auto_14946 ?auto_14950 ) ) ( OBJ-AT ?auto_14953 ?auto_14946 ) ( not ( = ?auto_14953 ?auto_14949 ) ) ( OBJ-AT ?auto_14949 ?auto_14950 ) ( OBJ-AT ?auto_14947 ?auto_14946 ) ( OBJ-AT ?auto_14948 ?auto_14946 ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14953 ) ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14953 ?auto_14949 ?auto_14946 )
      ( DELIVER-3PKG-VERIFY ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14946 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14955 - OBJ
      ?auto_14956 - OBJ
      ?auto_14957 - OBJ
      ?auto_14954 - LOCATION
    )
    :vars
    (
      ?auto_14959 - TRUCK
      ?auto_14958 - LOCATION
      ?auto_14960 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14959 ?auto_14958 ) ( IN-CITY ?auto_14958 ?auto_14960 ) ( IN-CITY ?auto_14954 ?auto_14960 ) ( not ( = ?auto_14954 ?auto_14958 ) ) ( OBJ-AT ?auto_14957 ?auto_14954 ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( OBJ-AT ?auto_14956 ?auto_14958 ) ( OBJ-AT ?auto_14955 ?auto_14954 ) ( not ( = ?auto_14955 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14957 ?auto_14956 ?auto_14954 )
      ( DELIVER-3PKG-VERIFY ?auto_14955 ?auto_14956 ?auto_14957 ?auto_14954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14962 - OBJ
      ?auto_14963 - OBJ
      ?auto_14964 - OBJ
      ?auto_14961 - LOCATION
    )
    :vars
    (
      ?auto_14966 - TRUCK
      ?auto_14965 - LOCATION
      ?auto_14967 - CITY
      ?auto_14968 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14966 ?auto_14965 ) ( IN-CITY ?auto_14965 ?auto_14967 ) ( IN-CITY ?auto_14961 ?auto_14967 ) ( not ( = ?auto_14961 ?auto_14965 ) ) ( OBJ-AT ?auto_14968 ?auto_14961 ) ( not ( = ?auto_14968 ?auto_14963 ) ) ( OBJ-AT ?auto_14963 ?auto_14965 ) ( OBJ-AT ?auto_14962 ?auto_14961 ) ( OBJ-AT ?auto_14964 ?auto_14961 ) ( not ( = ?auto_14962 ?auto_14963 ) ) ( not ( = ?auto_14962 ?auto_14964 ) ) ( not ( = ?auto_14962 ?auto_14968 ) ) ( not ( = ?auto_14963 ?auto_14964 ) ) ( not ( = ?auto_14964 ?auto_14968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14968 ?auto_14963 ?auto_14961 )
      ( DELIVER-3PKG-VERIFY ?auto_14962 ?auto_14963 ?auto_14964 ?auto_14961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14978 - OBJ
      ?auto_14979 - OBJ
      ?auto_14980 - OBJ
      ?auto_14977 - LOCATION
    )
    :vars
    (
      ?auto_14982 - TRUCK
      ?auto_14981 - LOCATION
      ?auto_14983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14982 ?auto_14981 ) ( IN-CITY ?auto_14981 ?auto_14983 ) ( IN-CITY ?auto_14977 ?auto_14983 ) ( not ( = ?auto_14977 ?auto_14981 ) ) ( OBJ-AT ?auto_14980 ?auto_14977 ) ( not ( = ?auto_14980 ?auto_14978 ) ) ( OBJ-AT ?auto_14978 ?auto_14981 ) ( OBJ-AT ?auto_14979 ?auto_14977 ) ( not ( = ?auto_14978 ?auto_14979 ) ) ( not ( = ?auto_14979 ?auto_14980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14980 ?auto_14978 ?auto_14977 )
      ( DELIVER-3PKG-VERIFY ?auto_14978 ?auto_14979 ?auto_14980 ?auto_14977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14985 - OBJ
      ?auto_14986 - OBJ
      ?auto_14987 - OBJ
      ?auto_14984 - LOCATION
    )
    :vars
    (
      ?auto_14989 - TRUCK
      ?auto_14988 - LOCATION
      ?auto_14990 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14989 ?auto_14988 ) ( IN-CITY ?auto_14988 ?auto_14990 ) ( IN-CITY ?auto_14984 ?auto_14990 ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( OBJ-AT ?auto_14986 ?auto_14984 ) ( not ( = ?auto_14986 ?auto_14985 ) ) ( OBJ-AT ?auto_14985 ?auto_14988 ) ( OBJ-AT ?auto_14987 ?auto_14984 ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_14987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14986 ?auto_14985 ?auto_14984 )
      ( DELIVER-3PKG-VERIFY ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14999 - OBJ
      ?auto_15000 - OBJ
      ?auto_15001 - OBJ
      ?auto_14998 - LOCATION
    )
    :vars
    (
      ?auto_15003 - TRUCK
      ?auto_15002 - LOCATION
      ?auto_15004 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15003 ?auto_15002 ) ( IN-CITY ?auto_15002 ?auto_15004 ) ( IN-CITY ?auto_14998 ?auto_15004 ) ( not ( = ?auto_14998 ?auto_15002 ) ) ( OBJ-AT ?auto_15001 ?auto_14998 ) ( not ( = ?auto_15001 ?auto_14999 ) ) ( OBJ-AT ?auto_14999 ?auto_15002 ) ( OBJ-AT ?auto_15000 ?auto_14998 ) ( not ( = ?auto_14999 ?auto_15000 ) ) ( not ( = ?auto_15000 ?auto_15001 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15001 ?auto_14999 ?auto_14998 )
      ( DELIVER-3PKG-VERIFY ?auto_14999 ?auto_15000 ?auto_15001 ?auto_14998 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15006 - OBJ
      ?auto_15007 - OBJ
      ?auto_15008 - OBJ
      ?auto_15005 - LOCATION
    )
    :vars
    (
      ?auto_15010 - TRUCK
      ?auto_15009 - LOCATION
      ?auto_15011 - CITY
      ?auto_15012 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15010 ?auto_15009 ) ( IN-CITY ?auto_15009 ?auto_15011 ) ( IN-CITY ?auto_15005 ?auto_15011 ) ( not ( = ?auto_15005 ?auto_15009 ) ) ( OBJ-AT ?auto_15012 ?auto_15005 ) ( not ( = ?auto_15012 ?auto_15006 ) ) ( OBJ-AT ?auto_15006 ?auto_15009 ) ( OBJ-AT ?auto_15007 ?auto_15005 ) ( OBJ-AT ?auto_15008 ?auto_15005 ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15012 ) ) ( not ( = ?auto_15008 ?auto_15012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15012 ?auto_15006 ?auto_15005 )
      ( DELIVER-3PKG-VERIFY ?auto_15006 ?auto_15007 ?auto_15008 ?auto_15005 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15045 - OBJ
      ?auto_15044 - LOCATION
    )
    :vars
    (
      ?auto_15046 - LOCATION
      ?auto_15048 - CITY
      ?auto_15049 - OBJ
      ?auto_15047 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15046 ?auto_15048 ) ( IN-CITY ?auto_15044 ?auto_15048 ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( OBJ-AT ?auto_15049 ?auto_15044 ) ( not ( = ?auto_15049 ?auto_15045 ) ) ( OBJ-AT ?auto_15045 ?auto_15046 ) ( TRUCK-AT ?auto_15047 ?auto_15044 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15047 ?auto_15044 ?auto_15046 ?auto_15048 )
      ( DELIVER-2PKG ?auto_15049 ?auto_15045 ?auto_15044 )
      ( DELIVER-1PKG-VERIFY ?auto_15045 ?auto_15044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15051 - OBJ
      ?auto_15052 - OBJ
      ?auto_15050 - LOCATION
    )
    :vars
    (
      ?auto_15054 - LOCATION
      ?auto_15055 - CITY
      ?auto_15053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15054 ?auto_15055 ) ( IN-CITY ?auto_15050 ?auto_15055 ) ( not ( = ?auto_15050 ?auto_15054 ) ) ( OBJ-AT ?auto_15051 ?auto_15050 ) ( not ( = ?auto_15051 ?auto_15052 ) ) ( OBJ-AT ?auto_15052 ?auto_15054 ) ( TRUCK-AT ?auto_15053 ?auto_15050 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15052 ?auto_15050 )
      ( DELIVER-2PKG-VERIFY ?auto_15051 ?auto_15052 ?auto_15050 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15057 - OBJ
      ?auto_15058 - OBJ
      ?auto_15056 - LOCATION
    )
    :vars
    (
      ?auto_15059 - LOCATION
      ?auto_15060 - CITY
      ?auto_15061 - OBJ
      ?auto_15062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15059 ?auto_15060 ) ( IN-CITY ?auto_15056 ?auto_15060 ) ( not ( = ?auto_15056 ?auto_15059 ) ) ( OBJ-AT ?auto_15061 ?auto_15056 ) ( not ( = ?auto_15061 ?auto_15058 ) ) ( OBJ-AT ?auto_15058 ?auto_15059 ) ( TRUCK-AT ?auto_15062 ?auto_15056 ) ( OBJ-AT ?auto_15057 ?auto_15056 ) ( not ( = ?auto_15057 ?auto_15058 ) ) ( not ( = ?auto_15057 ?auto_15061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15061 ?auto_15058 ?auto_15056 )
      ( DELIVER-2PKG-VERIFY ?auto_15057 ?auto_15058 ?auto_15056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15064 - OBJ
      ?auto_15065 - OBJ
      ?auto_15063 - LOCATION
    )
    :vars
    (
      ?auto_15066 - LOCATION
      ?auto_15067 - CITY
      ?auto_15068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15066 ?auto_15067 ) ( IN-CITY ?auto_15063 ?auto_15067 ) ( not ( = ?auto_15063 ?auto_15066 ) ) ( OBJ-AT ?auto_15065 ?auto_15063 ) ( not ( = ?auto_15065 ?auto_15064 ) ) ( OBJ-AT ?auto_15064 ?auto_15066 ) ( TRUCK-AT ?auto_15068 ?auto_15063 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15065 ?auto_15064 ?auto_15063 )
      ( DELIVER-2PKG-VERIFY ?auto_15064 ?auto_15065 ?auto_15063 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15070 - OBJ
      ?auto_15071 - OBJ
      ?auto_15069 - LOCATION
    )
    :vars
    (
      ?auto_15072 - LOCATION
      ?auto_15073 - CITY
      ?auto_15074 - OBJ
      ?auto_15075 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15072 ?auto_15073 ) ( IN-CITY ?auto_15069 ?auto_15073 ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( OBJ-AT ?auto_15074 ?auto_15069 ) ( not ( = ?auto_15074 ?auto_15070 ) ) ( OBJ-AT ?auto_15070 ?auto_15072 ) ( TRUCK-AT ?auto_15075 ?auto_15069 ) ( OBJ-AT ?auto_15071 ?auto_15069 ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15074 ?auto_15070 ?auto_15069 )
      ( DELIVER-2PKG-VERIFY ?auto_15070 ?auto_15071 ?auto_15069 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15084 - OBJ
      ?auto_15085 - OBJ
      ?auto_15086 - OBJ
      ?auto_15083 - LOCATION
    )
    :vars
    (
      ?auto_15087 - LOCATION
      ?auto_15088 - CITY
      ?auto_15089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15087 ?auto_15088 ) ( IN-CITY ?auto_15083 ?auto_15088 ) ( not ( = ?auto_15083 ?auto_15087 ) ) ( OBJ-AT ?auto_15085 ?auto_15083 ) ( not ( = ?auto_15085 ?auto_15086 ) ) ( OBJ-AT ?auto_15086 ?auto_15087 ) ( TRUCK-AT ?auto_15089 ?auto_15083 ) ( OBJ-AT ?auto_15084 ?auto_15083 ) ( not ( = ?auto_15084 ?auto_15085 ) ) ( not ( = ?auto_15084 ?auto_15086 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15085 ?auto_15086 ?auto_15083 )
      ( DELIVER-3PKG-VERIFY ?auto_15084 ?auto_15085 ?auto_15086 ?auto_15083 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15091 - OBJ
      ?auto_15092 - OBJ
      ?auto_15093 - OBJ
      ?auto_15090 - LOCATION
    )
    :vars
    (
      ?auto_15094 - LOCATION
      ?auto_15095 - CITY
      ?auto_15096 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15094 ?auto_15095 ) ( IN-CITY ?auto_15090 ?auto_15095 ) ( not ( = ?auto_15090 ?auto_15094 ) ) ( OBJ-AT ?auto_15091 ?auto_15090 ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( OBJ-AT ?auto_15093 ?auto_15094 ) ( TRUCK-AT ?auto_15096 ?auto_15090 ) ( OBJ-AT ?auto_15092 ?auto_15090 ) ( not ( = ?auto_15091 ?auto_15092 ) ) ( not ( = ?auto_15092 ?auto_15093 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15091 ?auto_15093 ?auto_15090 )
      ( DELIVER-3PKG-VERIFY ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15098 - OBJ
      ?auto_15099 - OBJ
      ?auto_15100 - OBJ
      ?auto_15097 - LOCATION
    )
    :vars
    (
      ?auto_15101 - LOCATION
      ?auto_15102 - CITY
      ?auto_15103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15101 ?auto_15102 ) ( IN-CITY ?auto_15097 ?auto_15102 ) ( not ( = ?auto_15097 ?auto_15101 ) ) ( OBJ-AT ?auto_15100 ?auto_15097 ) ( not ( = ?auto_15100 ?auto_15099 ) ) ( OBJ-AT ?auto_15099 ?auto_15101 ) ( TRUCK-AT ?auto_15103 ?auto_15097 ) ( OBJ-AT ?auto_15098 ?auto_15097 ) ( not ( = ?auto_15098 ?auto_15099 ) ) ( not ( = ?auto_15098 ?auto_15100 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15100 ?auto_15099 ?auto_15097 )
      ( DELIVER-3PKG-VERIFY ?auto_15098 ?auto_15099 ?auto_15100 ?auto_15097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15105 - OBJ
      ?auto_15106 - OBJ
      ?auto_15107 - OBJ
      ?auto_15104 - LOCATION
    )
    :vars
    (
      ?auto_15108 - LOCATION
      ?auto_15109 - CITY
      ?auto_15110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15108 ?auto_15109 ) ( IN-CITY ?auto_15104 ?auto_15109 ) ( not ( = ?auto_15104 ?auto_15108 ) ) ( OBJ-AT ?auto_15105 ?auto_15104 ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( OBJ-AT ?auto_15106 ?auto_15108 ) ( TRUCK-AT ?auto_15110 ?auto_15104 ) ( OBJ-AT ?auto_15107 ?auto_15104 ) ( not ( = ?auto_15105 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15105 ?auto_15106 ?auto_15104 )
      ( DELIVER-3PKG-VERIFY ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15104 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15119 - OBJ
      ?auto_15120 - OBJ
      ?auto_15121 - OBJ
      ?auto_15118 - LOCATION
    )
    :vars
    (
      ?auto_15122 - LOCATION
      ?auto_15123 - CITY
      ?auto_15124 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15122 ?auto_15123 ) ( IN-CITY ?auto_15118 ?auto_15123 ) ( not ( = ?auto_15118 ?auto_15122 ) ) ( OBJ-AT ?auto_15120 ?auto_15118 ) ( not ( = ?auto_15120 ?auto_15121 ) ) ( OBJ-AT ?auto_15121 ?auto_15122 ) ( TRUCK-AT ?auto_15124 ?auto_15118 ) ( OBJ-AT ?auto_15119 ?auto_15118 ) ( not ( = ?auto_15119 ?auto_15120 ) ) ( not ( = ?auto_15119 ?auto_15121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15120 ?auto_15121 ?auto_15118 )
      ( DELIVER-3PKG-VERIFY ?auto_15119 ?auto_15120 ?auto_15121 ?auto_15118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15126 - OBJ
      ?auto_15127 - OBJ
      ?auto_15128 - OBJ
      ?auto_15125 - LOCATION
    )
    :vars
    (
      ?auto_15129 - LOCATION
      ?auto_15130 - CITY
      ?auto_15131 - OBJ
      ?auto_15132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15129 ?auto_15130 ) ( IN-CITY ?auto_15125 ?auto_15130 ) ( not ( = ?auto_15125 ?auto_15129 ) ) ( OBJ-AT ?auto_15131 ?auto_15125 ) ( not ( = ?auto_15131 ?auto_15128 ) ) ( OBJ-AT ?auto_15128 ?auto_15129 ) ( TRUCK-AT ?auto_15132 ?auto_15125 ) ( OBJ-AT ?auto_15126 ?auto_15125 ) ( OBJ-AT ?auto_15127 ?auto_15125 ) ( not ( = ?auto_15126 ?auto_15127 ) ) ( not ( = ?auto_15126 ?auto_15128 ) ) ( not ( = ?auto_15126 ?auto_15131 ) ) ( not ( = ?auto_15127 ?auto_15128 ) ) ( not ( = ?auto_15127 ?auto_15131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15131 ?auto_15128 ?auto_15125 )
      ( DELIVER-3PKG-VERIFY ?auto_15126 ?auto_15127 ?auto_15128 ?auto_15125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15134 - OBJ
      ?auto_15135 - OBJ
      ?auto_15136 - OBJ
      ?auto_15133 - LOCATION
    )
    :vars
    (
      ?auto_15137 - LOCATION
      ?auto_15138 - CITY
      ?auto_15139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15137 ?auto_15138 ) ( IN-CITY ?auto_15133 ?auto_15138 ) ( not ( = ?auto_15133 ?auto_15137 ) ) ( OBJ-AT ?auto_15136 ?auto_15133 ) ( not ( = ?auto_15136 ?auto_15135 ) ) ( OBJ-AT ?auto_15135 ?auto_15137 ) ( TRUCK-AT ?auto_15139 ?auto_15133 ) ( OBJ-AT ?auto_15134 ?auto_15133 ) ( not ( = ?auto_15134 ?auto_15135 ) ) ( not ( = ?auto_15134 ?auto_15136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15136 ?auto_15135 ?auto_15133 )
      ( DELIVER-3PKG-VERIFY ?auto_15134 ?auto_15135 ?auto_15136 ?auto_15133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15141 - OBJ
      ?auto_15142 - OBJ
      ?auto_15143 - OBJ
      ?auto_15140 - LOCATION
    )
    :vars
    (
      ?auto_15144 - LOCATION
      ?auto_15145 - CITY
      ?auto_15146 - OBJ
      ?auto_15147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15144 ?auto_15145 ) ( IN-CITY ?auto_15140 ?auto_15145 ) ( not ( = ?auto_15140 ?auto_15144 ) ) ( OBJ-AT ?auto_15146 ?auto_15140 ) ( not ( = ?auto_15146 ?auto_15142 ) ) ( OBJ-AT ?auto_15142 ?auto_15144 ) ( TRUCK-AT ?auto_15147 ?auto_15140 ) ( OBJ-AT ?auto_15141 ?auto_15140 ) ( OBJ-AT ?auto_15143 ?auto_15140 ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15146 ) ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15143 ?auto_15146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15146 ?auto_15142 ?auto_15140 )
      ( DELIVER-3PKG-VERIFY ?auto_15141 ?auto_15142 ?auto_15143 ?auto_15140 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15157 - OBJ
      ?auto_15158 - OBJ
      ?auto_15159 - OBJ
      ?auto_15156 - LOCATION
    )
    :vars
    (
      ?auto_15160 - LOCATION
      ?auto_15161 - CITY
      ?auto_15162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15160 ?auto_15161 ) ( IN-CITY ?auto_15156 ?auto_15161 ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( OBJ-AT ?auto_15159 ?auto_15156 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( OBJ-AT ?auto_15157 ?auto_15160 ) ( TRUCK-AT ?auto_15162 ?auto_15156 ) ( OBJ-AT ?auto_15158 ?auto_15156 ) ( not ( = ?auto_15157 ?auto_15158 ) ) ( not ( = ?auto_15158 ?auto_15159 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15159 ?auto_15157 ?auto_15156 )
      ( DELIVER-3PKG-VERIFY ?auto_15157 ?auto_15158 ?auto_15159 ?auto_15156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15164 - OBJ
      ?auto_15165 - OBJ
      ?auto_15166 - OBJ
      ?auto_15163 - LOCATION
    )
    :vars
    (
      ?auto_15167 - LOCATION
      ?auto_15168 - CITY
      ?auto_15169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15167 ?auto_15168 ) ( IN-CITY ?auto_15163 ?auto_15168 ) ( not ( = ?auto_15163 ?auto_15167 ) ) ( OBJ-AT ?auto_15165 ?auto_15163 ) ( not ( = ?auto_15165 ?auto_15164 ) ) ( OBJ-AT ?auto_15164 ?auto_15167 ) ( TRUCK-AT ?auto_15169 ?auto_15163 ) ( OBJ-AT ?auto_15166 ?auto_15163 ) ( not ( = ?auto_15164 ?auto_15166 ) ) ( not ( = ?auto_15165 ?auto_15166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15165 ?auto_15164 ?auto_15163 )
      ( DELIVER-3PKG-VERIFY ?auto_15164 ?auto_15165 ?auto_15166 ?auto_15163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15178 - OBJ
      ?auto_15179 - OBJ
      ?auto_15180 - OBJ
      ?auto_15177 - LOCATION
    )
    :vars
    (
      ?auto_15181 - LOCATION
      ?auto_15182 - CITY
      ?auto_15183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15181 ?auto_15182 ) ( IN-CITY ?auto_15177 ?auto_15182 ) ( not ( = ?auto_15177 ?auto_15181 ) ) ( OBJ-AT ?auto_15180 ?auto_15177 ) ( not ( = ?auto_15180 ?auto_15178 ) ) ( OBJ-AT ?auto_15178 ?auto_15181 ) ( TRUCK-AT ?auto_15183 ?auto_15177 ) ( OBJ-AT ?auto_15179 ?auto_15177 ) ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15179 ?auto_15180 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15180 ?auto_15178 ?auto_15177 )
      ( DELIVER-3PKG-VERIFY ?auto_15178 ?auto_15179 ?auto_15180 ?auto_15177 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15185 - OBJ
      ?auto_15186 - OBJ
      ?auto_15187 - OBJ
      ?auto_15184 - LOCATION
    )
    :vars
    (
      ?auto_15188 - LOCATION
      ?auto_15189 - CITY
      ?auto_15190 - OBJ
      ?auto_15191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15188 ?auto_15189 ) ( IN-CITY ?auto_15184 ?auto_15189 ) ( not ( = ?auto_15184 ?auto_15188 ) ) ( OBJ-AT ?auto_15190 ?auto_15184 ) ( not ( = ?auto_15190 ?auto_15185 ) ) ( OBJ-AT ?auto_15185 ?auto_15188 ) ( TRUCK-AT ?auto_15191 ?auto_15184 ) ( OBJ-AT ?auto_15186 ?auto_15184 ) ( OBJ-AT ?auto_15187 ?auto_15184 ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15190 ) ) ( not ( = ?auto_15187 ?auto_15190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15190 ?auto_15185 ?auto_15184 )
      ( DELIVER-3PKG-VERIFY ?auto_15185 ?auto_15186 ?auto_15187 ?auto_15184 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15224 - OBJ
      ?auto_15223 - LOCATION
    )
    :vars
    (
      ?auto_15225 - LOCATION
      ?auto_15226 - CITY
      ?auto_15227 - OBJ
      ?auto_15228 - TRUCK
      ?auto_15229 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15225 ?auto_15226 ) ( IN-CITY ?auto_15223 ?auto_15226 ) ( not ( = ?auto_15223 ?auto_15225 ) ) ( OBJ-AT ?auto_15227 ?auto_15223 ) ( not ( = ?auto_15227 ?auto_15224 ) ) ( OBJ-AT ?auto_15224 ?auto_15225 ) ( TRUCK-AT ?auto_15228 ?auto_15223 ) ( IN-TRUCK ?auto_15229 ?auto_15228 ) ( not ( = ?auto_15227 ?auto_15229 ) ) ( not ( = ?auto_15224 ?auto_15229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15227 ?auto_15229 ?auto_15223 )
      ( DELIVER-2PKG ?auto_15227 ?auto_15224 ?auto_15223 )
      ( DELIVER-1PKG-VERIFY ?auto_15224 ?auto_15223 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15231 - OBJ
      ?auto_15232 - OBJ
      ?auto_15230 - LOCATION
    )
    :vars
    (
      ?auto_15236 - LOCATION
      ?auto_15235 - CITY
      ?auto_15234 - TRUCK
      ?auto_15233 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15236 ?auto_15235 ) ( IN-CITY ?auto_15230 ?auto_15235 ) ( not ( = ?auto_15230 ?auto_15236 ) ) ( OBJ-AT ?auto_15231 ?auto_15230 ) ( not ( = ?auto_15231 ?auto_15232 ) ) ( OBJ-AT ?auto_15232 ?auto_15236 ) ( TRUCK-AT ?auto_15234 ?auto_15230 ) ( IN-TRUCK ?auto_15233 ?auto_15234 ) ( not ( = ?auto_15231 ?auto_15233 ) ) ( not ( = ?auto_15232 ?auto_15233 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15232 ?auto_15230 )
      ( DELIVER-2PKG-VERIFY ?auto_15231 ?auto_15232 ?auto_15230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15238 - OBJ
      ?auto_15239 - OBJ
      ?auto_15237 - LOCATION
    )
    :vars
    (
      ?auto_15241 - LOCATION
      ?auto_15242 - CITY
      ?auto_15243 - OBJ
      ?auto_15240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15241 ?auto_15242 ) ( IN-CITY ?auto_15237 ?auto_15242 ) ( not ( = ?auto_15237 ?auto_15241 ) ) ( OBJ-AT ?auto_15243 ?auto_15237 ) ( not ( = ?auto_15243 ?auto_15239 ) ) ( OBJ-AT ?auto_15239 ?auto_15241 ) ( TRUCK-AT ?auto_15240 ?auto_15237 ) ( IN-TRUCK ?auto_15238 ?auto_15240 ) ( not ( = ?auto_15243 ?auto_15238 ) ) ( not ( = ?auto_15239 ?auto_15238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15243 ?auto_15239 ?auto_15237 )
      ( DELIVER-2PKG-VERIFY ?auto_15238 ?auto_15239 ?auto_15237 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15245 - OBJ
      ?auto_15246 - OBJ
      ?auto_15244 - LOCATION
    )
    :vars
    (
      ?auto_15249 - LOCATION
      ?auto_15250 - CITY
      ?auto_15248 - TRUCK
      ?auto_15247 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15249 ?auto_15250 ) ( IN-CITY ?auto_15244 ?auto_15250 ) ( not ( = ?auto_15244 ?auto_15249 ) ) ( OBJ-AT ?auto_15246 ?auto_15244 ) ( not ( = ?auto_15246 ?auto_15245 ) ) ( OBJ-AT ?auto_15245 ?auto_15249 ) ( TRUCK-AT ?auto_15248 ?auto_15244 ) ( IN-TRUCK ?auto_15247 ?auto_15248 ) ( not ( = ?auto_15246 ?auto_15247 ) ) ( not ( = ?auto_15245 ?auto_15247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15246 ?auto_15245 ?auto_15244 )
      ( DELIVER-2PKG-VERIFY ?auto_15245 ?auto_15246 ?auto_15244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15252 - OBJ
      ?auto_15253 - OBJ
      ?auto_15251 - LOCATION
    )
    :vars
    (
      ?auto_15255 - LOCATION
      ?auto_15256 - CITY
      ?auto_15257 - OBJ
      ?auto_15254 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15255 ?auto_15256 ) ( IN-CITY ?auto_15251 ?auto_15256 ) ( not ( = ?auto_15251 ?auto_15255 ) ) ( OBJ-AT ?auto_15257 ?auto_15251 ) ( not ( = ?auto_15257 ?auto_15252 ) ) ( OBJ-AT ?auto_15252 ?auto_15255 ) ( TRUCK-AT ?auto_15254 ?auto_15251 ) ( IN-TRUCK ?auto_15253 ?auto_15254 ) ( not ( = ?auto_15257 ?auto_15253 ) ) ( not ( = ?auto_15252 ?auto_15253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15257 ?auto_15252 ?auto_15251 )
      ( DELIVER-2PKG-VERIFY ?auto_15252 ?auto_15253 ?auto_15251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15267 - OBJ
      ?auto_15268 - OBJ
      ?auto_15269 - OBJ
      ?auto_15266 - LOCATION
    )
    :vars
    (
      ?auto_15272 - LOCATION
      ?auto_15273 - CITY
      ?auto_15271 - TRUCK
      ?auto_15270 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15272 ?auto_15273 ) ( IN-CITY ?auto_15266 ?auto_15273 ) ( not ( = ?auto_15266 ?auto_15272 ) ) ( OBJ-AT ?auto_15267 ?auto_15266 ) ( not ( = ?auto_15267 ?auto_15269 ) ) ( OBJ-AT ?auto_15269 ?auto_15272 ) ( TRUCK-AT ?auto_15271 ?auto_15266 ) ( IN-TRUCK ?auto_15270 ?auto_15271 ) ( not ( = ?auto_15267 ?auto_15270 ) ) ( not ( = ?auto_15269 ?auto_15270 ) ) ( OBJ-AT ?auto_15268 ?auto_15266 ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15268 ?auto_15269 ) ) ( not ( = ?auto_15268 ?auto_15270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15267 ?auto_15269 ?auto_15266 )
      ( DELIVER-3PKG-VERIFY ?auto_15267 ?auto_15268 ?auto_15269 ?auto_15266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15275 - OBJ
      ?auto_15276 - OBJ
      ?auto_15277 - OBJ
      ?auto_15274 - LOCATION
    )
    :vars
    (
      ?auto_15279 - LOCATION
      ?auto_15280 - CITY
      ?auto_15278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15279 ?auto_15280 ) ( IN-CITY ?auto_15274 ?auto_15280 ) ( not ( = ?auto_15274 ?auto_15279 ) ) ( OBJ-AT ?auto_15275 ?auto_15274 ) ( not ( = ?auto_15275 ?auto_15277 ) ) ( OBJ-AT ?auto_15277 ?auto_15279 ) ( TRUCK-AT ?auto_15278 ?auto_15274 ) ( IN-TRUCK ?auto_15276 ?auto_15278 ) ( not ( = ?auto_15275 ?auto_15276 ) ) ( not ( = ?auto_15277 ?auto_15276 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15275 ?auto_15277 ?auto_15274 )
      ( DELIVER-3PKG-VERIFY ?auto_15275 ?auto_15276 ?auto_15277 ?auto_15274 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15282 - OBJ
      ?auto_15283 - OBJ
      ?auto_15284 - OBJ
      ?auto_15281 - LOCATION
    )
    :vars
    (
      ?auto_15287 - LOCATION
      ?auto_15288 - CITY
      ?auto_15286 - TRUCK
      ?auto_15285 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15287 ?auto_15288 ) ( IN-CITY ?auto_15281 ?auto_15288 ) ( not ( = ?auto_15281 ?auto_15287 ) ) ( OBJ-AT ?auto_15284 ?auto_15281 ) ( not ( = ?auto_15284 ?auto_15283 ) ) ( OBJ-AT ?auto_15283 ?auto_15287 ) ( TRUCK-AT ?auto_15286 ?auto_15281 ) ( IN-TRUCK ?auto_15285 ?auto_15286 ) ( not ( = ?auto_15284 ?auto_15285 ) ) ( not ( = ?auto_15283 ?auto_15285 ) ) ( OBJ-AT ?auto_15282 ?auto_15281 ) ( not ( = ?auto_15282 ?auto_15283 ) ) ( not ( = ?auto_15282 ?auto_15284 ) ) ( not ( = ?auto_15282 ?auto_15285 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15284 ?auto_15283 ?auto_15281 )
      ( DELIVER-3PKG-VERIFY ?auto_15282 ?auto_15283 ?auto_15284 ?auto_15281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15290 - OBJ
      ?auto_15291 - OBJ
      ?auto_15292 - OBJ
      ?auto_15289 - LOCATION
    )
    :vars
    (
      ?auto_15294 - LOCATION
      ?auto_15295 - CITY
      ?auto_15293 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15294 ?auto_15295 ) ( IN-CITY ?auto_15289 ?auto_15295 ) ( not ( = ?auto_15289 ?auto_15294 ) ) ( OBJ-AT ?auto_15290 ?auto_15289 ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( OBJ-AT ?auto_15291 ?auto_15294 ) ( TRUCK-AT ?auto_15293 ?auto_15289 ) ( IN-TRUCK ?auto_15292 ?auto_15293 ) ( not ( = ?auto_15290 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15290 ?auto_15291 ?auto_15289 )
      ( DELIVER-3PKG-VERIFY ?auto_15290 ?auto_15291 ?auto_15292 ?auto_15289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15305 - OBJ
      ?auto_15306 - OBJ
      ?auto_15307 - OBJ
      ?auto_15304 - LOCATION
    )
    :vars
    (
      ?auto_15309 - LOCATION
      ?auto_15310 - CITY
      ?auto_15308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15309 ?auto_15310 ) ( IN-CITY ?auto_15304 ?auto_15310 ) ( not ( = ?auto_15304 ?auto_15309 ) ) ( OBJ-AT ?auto_15306 ?auto_15304 ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( OBJ-AT ?auto_15307 ?auto_15309 ) ( TRUCK-AT ?auto_15308 ?auto_15304 ) ( IN-TRUCK ?auto_15305 ?auto_15308 ) ( not ( = ?auto_15306 ?auto_15305 ) ) ( not ( = ?auto_15307 ?auto_15305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15306 ?auto_15307 ?auto_15304 )
      ( DELIVER-3PKG-VERIFY ?auto_15305 ?auto_15306 ?auto_15307 ?auto_15304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15320 - OBJ
      ?auto_15321 - OBJ
      ?auto_15322 - OBJ
      ?auto_15319 - LOCATION
    )
    :vars
    (
      ?auto_15324 - LOCATION
      ?auto_15325 - CITY
      ?auto_15323 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15324 ?auto_15325 ) ( IN-CITY ?auto_15319 ?auto_15325 ) ( not ( = ?auto_15319 ?auto_15324 ) ) ( OBJ-AT ?auto_15322 ?auto_15319 ) ( not ( = ?auto_15322 ?auto_15321 ) ) ( OBJ-AT ?auto_15321 ?auto_15324 ) ( TRUCK-AT ?auto_15323 ?auto_15319 ) ( IN-TRUCK ?auto_15320 ?auto_15323 ) ( not ( = ?auto_15322 ?auto_15320 ) ) ( not ( = ?auto_15321 ?auto_15320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15322 ?auto_15321 ?auto_15319 )
      ( DELIVER-3PKG-VERIFY ?auto_15320 ?auto_15321 ?auto_15322 ?auto_15319 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15343 - OBJ
      ?auto_15344 - OBJ
      ?auto_15345 - OBJ
      ?auto_15342 - LOCATION
    )
    :vars
    (
      ?auto_15348 - LOCATION
      ?auto_15349 - CITY
      ?auto_15347 - TRUCK
      ?auto_15346 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15348 ?auto_15349 ) ( IN-CITY ?auto_15342 ?auto_15349 ) ( not ( = ?auto_15342 ?auto_15348 ) ) ( OBJ-AT ?auto_15344 ?auto_15342 ) ( not ( = ?auto_15344 ?auto_15343 ) ) ( OBJ-AT ?auto_15343 ?auto_15348 ) ( TRUCK-AT ?auto_15347 ?auto_15342 ) ( IN-TRUCK ?auto_15346 ?auto_15347 ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) ( OBJ-AT ?auto_15345 ?auto_15342 ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15345 ?auto_15346 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15344 ?auto_15343 ?auto_15342 )
      ( DELIVER-3PKG-VERIFY ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15351 - OBJ
      ?auto_15352 - OBJ
      ?auto_15353 - OBJ
      ?auto_15350 - LOCATION
    )
    :vars
    (
      ?auto_15355 - LOCATION
      ?auto_15356 - CITY
      ?auto_15354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15355 ?auto_15356 ) ( IN-CITY ?auto_15350 ?auto_15356 ) ( not ( = ?auto_15350 ?auto_15355 ) ) ( OBJ-AT ?auto_15352 ?auto_15350 ) ( not ( = ?auto_15352 ?auto_15351 ) ) ( OBJ-AT ?auto_15351 ?auto_15355 ) ( TRUCK-AT ?auto_15354 ?auto_15350 ) ( IN-TRUCK ?auto_15353 ?auto_15354 ) ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15351 ?auto_15353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15352 ?auto_15351 ?auto_15350 )
      ( DELIVER-3PKG-VERIFY ?auto_15351 ?auto_15352 ?auto_15353 ?auto_15350 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15366 - OBJ
      ?auto_15367 - OBJ
      ?auto_15368 - OBJ
      ?auto_15365 - LOCATION
    )
    :vars
    (
      ?auto_15370 - LOCATION
      ?auto_15371 - CITY
      ?auto_15369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15370 ?auto_15371 ) ( IN-CITY ?auto_15365 ?auto_15371 ) ( not ( = ?auto_15365 ?auto_15370 ) ) ( OBJ-AT ?auto_15368 ?auto_15365 ) ( not ( = ?auto_15368 ?auto_15366 ) ) ( OBJ-AT ?auto_15366 ?auto_15370 ) ( TRUCK-AT ?auto_15369 ?auto_15365 ) ( IN-TRUCK ?auto_15367 ?auto_15369 ) ( not ( = ?auto_15368 ?auto_15367 ) ) ( not ( = ?auto_15366 ?auto_15367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15368 ?auto_15366 ?auto_15365 )
      ( DELIVER-3PKG-VERIFY ?auto_15366 ?auto_15367 ?auto_15368 ?auto_15365 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15414 - OBJ
      ?auto_15413 - LOCATION
    )
    :vars
    (
      ?auto_15417 - LOCATION
      ?auto_15418 - CITY
      ?auto_15419 - OBJ
      ?auto_15415 - OBJ
      ?auto_15416 - TRUCK
      ?auto_15420 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15417 ?auto_15418 ) ( IN-CITY ?auto_15413 ?auto_15418 ) ( not ( = ?auto_15413 ?auto_15417 ) ) ( OBJ-AT ?auto_15419 ?auto_15413 ) ( not ( = ?auto_15419 ?auto_15414 ) ) ( OBJ-AT ?auto_15414 ?auto_15417 ) ( IN-TRUCK ?auto_15415 ?auto_15416 ) ( not ( = ?auto_15419 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15415 ) ) ( TRUCK-AT ?auto_15416 ?auto_15420 ) ( IN-CITY ?auto_15420 ?auto_15418 ) ( not ( = ?auto_15413 ?auto_15420 ) ) ( not ( = ?auto_15417 ?auto_15420 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15416 ?auto_15420 ?auto_15413 ?auto_15418 )
      ( DELIVER-2PKG ?auto_15419 ?auto_15414 ?auto_15413 )
      ( DELIVER-1PKG-VERIFY ?auto_15414 ?auto_15413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15422 - OBJ
      ?auto_15423 - OBJ
      ?auto_15421 - LOCATION
    )
    :vars
    (
      ?auto_15424 - LOCATION
      ?auto_15428 - CITY
      ?auto_15425 - OBJ
      ?auto_15426 - TRUCK
      ?auto_15427 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15424 ?auto_15428 ) ( IN-CITY ?auto_15421 ?auto_15428 ) ( not ( = ?auto_15421 ?auto_15424 ) ) ( OBJ-AT ?auto_15422 ?auto_15421 ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( OBJ-AT ?auto_15423 ?auto_15424 ) ( IN-TRUCK ?auto_15425 ?auto_15426 ) ( not ( = ?auto_15422 ?auto_15425 ) ) ( not ( = ?auto_15423 ?auto_15425 ) ) ( TRUCK-AT ?auto_15426 ?auto_15427 ) ( IN-CITY ?auto_15427 ?auto_15428 ) ( not ( = ?auto_15421 ?auto_15427 ) ) ( not ( = ?auto_15424 ?auto_15427 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15423 ?auto_15421 )
      ( DELIVER-2PKG-VERIFY ?auto_15422 ?auto_15423 ?auto_15421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15430 - OBJ
      ?auto_15431 - OBJ
      ?auto_15429 - LOCATION
    )
    :vars
    (
      ?auto_15434 - LOCATION
      ?auto_15432 - CITY
      ?auto_15435 - OBJ
      ?auto_15436 - TRUCK
      ?auto_15433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15434 ?auto_15432 ) ( IN-CITY ?auto_15429 ?auto_15432 ) ( not ( = ?auto_15429 ?auto_15434 ) ) ( OBJ-AT ?auto_15435 ?auto_15429 ) ( not ( = ?auto_15435 ?auto_15431 ) ) ( OBJ-AT ?auto_15431 ?auto_15434 ) ( IN-TRUCK ?auto_15430 ?auto_15436 ) ( not ( = ?auto_15435 ?auto_15430 ) ) ( not ( = ?auto_15431 ?auto_15430 ) ) ( TRUCK-AT ?auto_15436 ?auto_15433 ) ( IN-CITY ?auto_15433 ?auto_15432 ) ( not ( = ?auto_15429 ?auto_15433 ) ) ( not ( = ?auto_15434 ?auto_15433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15435 ?auto_15431 ?auto_15429 )
      ( DELIVER-2PKG-VERIFY ?auto_15430 ?auto_15431 ?auto_15429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15438 - OBJ
      ?auto_15439 - OBJ
      ?auto_15437 - LOCATION
    )
    :vars
    (
      ?auto_15443 - LOCATION
      ?auto_15440 - CITY
      ?auto_15441 - OBJ
      ?auto_15444 - TRUCK
      ?auto_15442 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15443 ?auto_15440 ) ( IN-CITY ?auto_15437 ?auto_15440 ) ( not ( = ?auto_15437 ?auto_15443 ) ) ( OBJ-AT ?auto_15439 ?auto_15437 ) ( not ( = ?auto_15439 ?auto_15438 ) ) ( OBJ-AT ?auto_15438 ?auto_15443 ) ( IN-TRUCK ?auto_15441 ?auto_15444 ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( TRUCK-AT ?auto_15444 ?auto_15442 ) ( IN-CITY ?auto_15442 ?auto_15440 ) ( not ( = ?auto_15437 ?auto_15442 ) ) ( not ( = ?auto_15443 ?auto_15442 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15439 ?auto_15438 ?auto_15437 )
      ( DELIVER-2PKG-VERIFY ?auto_15438 ?auto_15439 ?auto_15437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15446 - OBJ
      ?auto_15447 - OBJ
      ?auto_15445 - LOCATION
    )
    :vars
    (
      ?auto_15450 - LOCATION
      ?auto_15448 - CITY
      ?auto_15451 - OBJ
      ?auto_15452 - TRUCK
      ?auto_15449 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15450 ?auto_15448 ) ( IN-CITY ?auto_15445 ?auto_15448 ) ( not ( = ?auto_15445 ?auto_15450 ) ) ( OBJ-AT ?auto_15451 ?auto_15445 ) ( not ( = ?auto_15451 ?auto_15446 ) ) ( OBJ-AT ?auto_15446 ?auto_15450 ) ( IN-TRUCK ?auto_15447 ?auto_15452 ) ( not ( = ?auto_15451 ?auto_15447 ) ) ( not ( = ?auto_15446 ?auto_15447 ) ) ( TRUCK-AT ?auto_15452 ?auto_15449 ) ( IN-CITY ?auto_15449 ?auto_15448 ) ( not ( = ?auto_15445 ?auto_15449 ) ) ( not ( = ?auto_15450 ?auto_15449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15451 ?auto_15446 ?auto_15445 )
      ( DELIVER-2PKG-VERIFY ?auto_15446 ?auto_15447 ?auto_15445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15463 - OBJ
      ?auto_15464 - OBJ
      ?auto_15465 - OBJ
      ?auto_15462 - LOCATION
    )
    :vars
    (
      ?auto_15469 - LOCATION
      ?auto_15466 - CITY
      ?auto_15467 - OBJ
      ?auto_15470 - TRUCK
      ?auto_15468 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15469 ?auto_15466 ) ( IN-CITY ?auto_15462 ?auto_15466 ) ( not ( = ?auto_15462 ?auto_15469 ) ) ( OBJ-AT ?auto_15464 ?auto_15462 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( OBJ-AT ?auto_15465 ?auto_15469 ) ( IN-TRUCK ?auto_15467 ?auto_15470 ) ( not ( = ?auto_15464 ?auto_15467 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( TRUCK-AT ?auto_15470 ?auto_15468 ) ( IN-CITY ?auto_15468 ?auto_15466 ) ( not ( = ?auto_15462 ?auto_15468 ) ) ( not ( = ?auto_15469 ?auto_15468 ) ) ( OBJ-AT ?auto_15463 ?auto_15462 ) ( not ( = ?auto_15463 ?auto_15464 ) ) ( not ( = ?auto_15463 ?auto_15465 ) ) ( not ( = ?auto_15463 ?auto_15467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15464 ?auto_15465 ?auto_15462 )
      ( DELIVER-3PKG-VERIFY ?auto_15463 ?auto_15464 ?auto_15465 ?auto_15462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15472 - OBJ
      ?auto_15473 - OBJ
      ?auto_15474 - OBJ
      ?auto_15471 - LOCATION
    )
    :vars
    (
      ?auto_15477 - LOCATION
      ?auto_15475 - CITY
      ?auto_15478 - TRUCK
      ?auto_15476 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15477 ?auto_15475 ) ( IN-CITY ?auto_15471 ?auto_15475 ) ( not ( = ?auto_15471 ?auto_15477 ) ) ( OBJ-AT ?auto_15472 ?auto_15471 ) ( not ( = ?auto_15472 ?auto_15474 ) ) ( OBJ-AT ?auto_15474 ?auto_15477 ) ( IN-TRUCK ?auto_15473 ?auto_15478 ) ( not ( = ?auto_15472 ?auto_15473 ) ) ( not ( = ?auto_15474 ?auto_15473 ) ) ( TRUCK-AT ?auto_15478 ?auto_15476 ) ( IN-CITY ?auto_15476 ?auto_15475 ) ( not ( = ?auto_15471 ?auto_15476 ) ) ( not ( = ?auto_15477 ?auto_15476 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15472 ?auto_15474 ?auto_15471 )
      ( DELIVER-3PKG-VERIFY ?auto_15472 ?auto_15473 ?auto_15474 ?auto_15471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15480 - OBJ
      ?auto_15481 - OBJ
      ?auto_15482 - OBJ
      ?auto_15479 - LOCATION
    )
    :vars
    (
      ?auto_15486 - LOCATION
      ?auto_15483 - CITY
      ?auto_15484 - OBJ
      ?auto_15487 - TRUCK
      ?auto_15485 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15486 ?auto_15483 ) ( IN-CITY ?auto_15479 ?auto_15483 ) ( not ( = ?auto_15479 ?auto_15486 ) ) ( OBJ-AT ?auto_15482 ?auto_15479 ) ( not ( = ?auto_15482 ?auto_15481 ) ) ( OBJ-AT ?auto_15481 ?auto_15486 ) ( IN-TRUCK ?auto_15484 ?auto_15487 ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( TRUCK-AT ?auto_15487 ?auto_15485 ) ( IN-CITY ?auto_15485 ?auto_15483 ) ( not ( = ?auto_15479 ?auto_15485 ) ) ( not ( = ?auto_15486 ?auto_15485 ) ) ( OBJ-AT ?auto_15480 ?auto_15479 ) ( not ( = ?auto_15480 ?auto_15481 ) ) ( not ( = ?auto_15480 ?auto_15482 ) ) ( not ( = ?auto_15480 ?auto_15484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15482 ?auto_15481 ?auto_15479 )
      ( DELIVER-3PKG-VERIFY ?auto_15480 ?auto_15481 ?auto_15482 ?auto_15479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15489 - OBJ
      ?auto_15490 - OBJ
      ?auto_15491 - OBJ
      ?auto_15488 - LOCATION
    )
    :vars
    (
      ?auto_15494 - LOCATION
      ?auto_15492 - CITY
      ?auto_15495 - TRUCK
      ?auto_15493 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15494 ?auto_15492 ) ( IN-CITY ?auto_15488 ?auto_15492 ) ( not ( = ?auto_15488 ?auto_15494 ) ) ( OBJ-AT ?auto_15489 ?auto_15488 ) ( not ( = ?auto_15489 ?auto_15490 ) ) ( OBJ-AT ?auto_15490 ?auto_15494 ) ( IN-TRUCK ?auto_15491 ?auto_15495 ) ( not ( = ?auto_15489 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( TRUCK-AT ?auto_15495 ?auto_15493 ) ( IN-CITY ?auto_15493 ?auto_15492 ) ( not ( = ?auto_15488 ?auto_15493 ) ) ( not ( = ?auto_15494 ?auto_15493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15489 ?auto_15490 ?auto_15488 )
      ( DELIVER-3PKG-VERIFY ?auto_15489 ?auto_15490 ?auto_15491 ?auto_15488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15506 - OBJ
      ?auto_15507 - OBJ
      ?auto_15508 - OBJ
      ?auto_15505 - LOCATION
    )
    :vars
    (
      ?auto_15511 - LOCATION
      ?auto_15509 - CITY
      ?auto_15512 - TRUCK
      ?auto_15510 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15511 ?auto_15509 ) ( IN-CITY ?auto_15505 ?auto_15509 ) ( not ( = ?auto_15505 ?auto_15511 ) ) ( OBJ-AT ?auto_15507 ?auto_15505 ) ( not ( = ?auto_15507 ?auto_15508 ) ) ( OBJ-AT ?auto_15508 ?auto_15511 ) ( IN-TRUCK ?auto_15506 ?auto_15512 ) ( not ( = ?auto_15507 ?auto_15506 ) ) ( not ( = ?auto_15508 ?auto_15506 ) ) ( TRUCK-AT ?auto_15512 ?auto_15510 ) ( IN-CITY ?auto_15510 ?auto_15509 ) ( not ( = ?auto_15505 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15507 ?auto_15508 ?auto_15505 )
      ( DELIVER-3PKG-VERIFY ?auto_15506 ?auto_15507 ?auto_15508 ?auto_15505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15523 - OBJ
      ?auto_15524 - OBJ
      ?auto_15525 - OBJ
      ?auto_15522 - LOCATION
    )
    :vars
    (
      ?auto_15528 - LOCATION
      ?auto_15526 - CITY
      ?auto_15529 - TRUCK
      ?auto_15527 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15528 ?auto_15526 ) ( IN-CITY ?auto_15522 ?auto_15526 ) ( not ( = ?auto_15522 ?auto_15528 ) ) ( OBJ-AT ?auto_15525 ?auto_15522 ) ( not ( = ?auto_15525 ?auto_15524 ) ) ( OBJ-AT ?auto_15524 ?auto_15528 ) ( IN-TRUCK ?auto_15523 ?auto_15529 ) ( not ( = ?auto_15525 ?auto_15523 ) ) ( not ( = ?auto_15524 ?auto_15523 ) ) ( TRUCK-AT ?auto_15529 ?auto_15527 ) ( IN-CITY ?auto_15527 ?auto_15526 ) ( not ( = ?auto_15522 ?auto_15527 ) ) ( not ( = ?auto_15528 ?auto_15527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15525 ?auto_15524 ?auto_15522 )
      ( DELIVER-3PKG-VERIFY ?auto_15523 ?auto_15524 ?auto_15525 ?auto_15522 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15549 - OBJ
      ?auto_15550 - OBJ
      ?auto_15551 - OBJ
      ?auto_15548 - LOCATION
    )
    :vars
    (
      ?auto_15555 - LOCATION
      ?auto_15552 - CITY
      ?auto_15553 - OBJ
      ?auto_15556 - TRUCK
      ?auto_15554 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15555 ?auto_15552 ) ( IN-CITY ?auto_15548 ?auto_15552 ) ( not ( = ?auto_15548 ?auto_15555 ) ) ( OBJ-AT ?auto_15551 ?auto_15548 ) ( not ( = ?auto_15551 ?auto_15549 ) ) ( OBJ-AT ?auto_15549 ?auto_15555 ) ( IN-TRUCK ?auto_15553 ?auto_15556 ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( not ( = ?auto_15549 ?auto_15553 ) ) ( TRUCK-AT ?auto_15556 ?auto_15554 ) ( IN-CITY ?auto_15554 ?auto_15552 ) ( not ( = ?auto_15548 ?auto_15554 ) ) ( not ( = ?auto_15555 ?auto_15554 ) ) ( OBJ-AT ?auto_15550 ?auto_15548 ) ( not ( = ?auto_15549 ?auto_15550 ) ) ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15551 ?auto_15549 ?auto_15548 )
      ( DELIVER-3PKG-VERIFY ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15548 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15558 - OBJ
      ?auto_15559 - OBJ
      ?auto_15560 - OBJ
      ?auto_15557 - LOCATION
    )
    :vars
    (
      ?auto_15563 - LOCATION
      ?auto_15561 - CITY
      ?auto_15564 - TRUCK
      ?auto_15562 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15563 ?auto_15561 ) ( IN-CITY ?auto_15557 ?auto_15561 ) ( not ( = ?auto_15557 ?auto_15563 ) ) ( OBJ-AT ?auto_15559 ?auto_15557 ) ( not ( = ?auto_15559 ?auto_15558 ) ) ( OBJ-AT ?auto_15558 ?auto_15563 ) ( IN-TRUCK ?auto_15560 ?auto_15564 ) ( not ( = ?auto_15559 ?auto_15560 ) ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( TRUCK-AT ?auto_15564 ?auto_15562 ) ( IN-CITY ?auto_15562 ?auto_15561 ) ( not ( = ?auto_15557 ?auto_15562 ) ) ( not ( = ?auto_15563 ?auto_15562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15559 ?auto_15558 ?auto_15557 )
      ( DELIVER-3PKG-VERIFY ?auto_15558 ?auto_15559 ?auto_15560 ?auto_15557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15575 - OBJ
      ?auto_15576 - OBJ
      ?auto_15577 - OBJ
      ?auto_15574 - LOCATION
    )
    :vars
    (
      ?auto_15580 - LOCATION
      ?auto_15578 - CITY
      ?auto_15581 - TRUCK
      ?auto_15579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15580 ?auto_15578 ) ( IN-CITY ?auto_15574 ?auto_15578 ) ( not ( = ?auto_15574 ?auto_15580 ) ) ( OBJ-AT ?auto_15577 ?auto_15574 ) ( not ( = ?auto_15577 ?auto_15575 ) ) ( OBJ-AT ?auto_15575 ?auto_15580 ) ( IN-TRUCK ?auto_15576 ?auto_15581 ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( TRUCK-AT ?auto_15581 ?auto_15579 ) ( IN-CITY ?auto_15579 ?auto_15578 ) ( not ( = ?auto_15574 ?auto_15579 ) ) ( not ( = ?auto_15580 ?auto_15579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15577 ?auto_15575 ?auto_15574 )
      ( DELIVER-3PKG-VERIFY ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15574 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15629 - OBJ
      ?auto_15628 - LOCATION
    )
    :vars
    (
      ?auto_15633 - LOCATION
      ?auto_15630 - CITY
      ?auto_15634 - OBJ
      ?auto_15631 - OBJ
      ?auto_15635 - TRUCK
      ?auto_15632 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15633 ?auto_15630 ) ( IN-CITY ?auto_15628 ?auto_15630 ) ( not ( = ?auto_15628 ?auto_15633 ) ) ( OBJ-AT ?auto_15634 ?auto_15628 ) ( not ( = ?auto_15634 ?auto_15629 ) ) ( OBJ-AT ?auto_15629 ?auto_15633 ) ( not ( = ?auto_15634 ?auto_15631 ) ) ( not ( = ?auto_15629 ?auto_15631 ) ) ( TRUCK-AT ?auto_15635 ?auto_15632 ) ( IN-CITY ?auto_15632 ?auto_15630 ) ( not ( = ?auto_15628 ?auto_15632 ) ) ( not ( = ?auto_15633 ?auto_15632 ) ) ( OBJ-AT ?auto_15631 ?auto_15632 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15631 ?auto_15635 ?auto_15632 )
      ( DELIVER-2PKG ?auto_15634 ?auto_15629 ?auto_15628 )
      ( DELIVER-1PKG-VERIFY ?auto_15629 ?auto_15628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15637 - OBJ
      ?auto_15638 - OBJ
      ?auto_15636 - LOCATION
    )
    :vars
    (
      ?auto_15641 - LOCATION
      ?auto_15643 - CITY
      ?auto_15642 - OBJ
      ?auto_15640 - TRUCK
      ?auto_15639 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15641 ?auto_15643 ) ( IN-CITY ?auto_15636 ?auto_15643 ) ( not ( = ?auto_15636 ?auto_15641 ) ) ( OBJ-AT ?auto_15637 ?auto_15636 ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( OBJ-AT ?auto_15638 ?auto_15641 ) ( not ( = ?auto_15637 ?auto_15642 ) ) ( not ( = ?auto_15638 ?auto_15642 ) ) ( TRUCK-AT ?auto_15640 ?auto_15639 ) ( IN-CITY ?auto_15639 ?auto_15643 ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15641 ?auto_15639 ) ) ( OBJ-AT ?auto_15642 ?auto_15639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15638 ?auto_15636 )
      ( DELIVER-2PKG-VERIFY ?auto_15637 ?auto_15638 ?auto_15636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15645 - OBJ
      ?auto_15646 - OBJ
      ?auto_15644 - LOCATION
    )
    :vars
    (
      ?auto_15649 - LOCATION
      ?auto_15648 - CITY
      ?auto_15651 - OBJ
      ?auto_15647 - TRUCK
      ?auto_15650 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15649 ?auto_15648 ) ( IN-CITY ?auto_15644 ?auto_15648 ) ( not ( = ?auto_15644 ?auto_15649 ) ) ( OBJ-AT ?auto_15651 ?auto_15644 ) ( not ( = ?auto_15651 ?auto_15646 ) ) ( OBJ-AT ?auto_15646 ?auto_15649 ) ( not ( = ?auto_15651 ?auto_15645 ) ) ( not ( = ?auto_15646 ?auto_15645 ) ) ( TRUCK-AT ?auto_15647 ?auto_15650 ) ( IN-CITY ?auto_15650 ?auto_15648 ) ( not ( = ?auto_15644 ?auto_15650 ) ) ( not ( = ?auto_15649 ?auto_15650 ) ) ( OBJ-AT ?auto_15645 ?auto_15650 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15651 ?auto_15646 ?auto_15644 )
      ( DELIVER-2PKG-VERIFY ?auto_15645 ?auto_15646 ?auto_15644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15653 - OBJ
      ?auto_15654 - OBJ
      ?auto_15652 - LOCATION
    )
    :vars
    (
      ?auto_15657 - LOCATION
      ?auto_15656 - CITY
      ?auto_15658 - OBJ
      ?auto_15655 - TRUCK
      ?auto_15659 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15657 ?auto_15656 ) ( IN-CITY ?auto_15652 ?auto_15656 ) ( not ( = ?auto_15652 ?auto_15657 ) ) ( OBJ-AT ?auto_15654 ?auto_15652 ) ( not ( = ?auto_15654 ?auto_15653 ) ) ( OBJ-AT ?auto_15653 ?auto_15657 ) ( not ( = ?auto_15654 ?auto_15658 ) ) ( not ( = ?auto_15653 ?auto_15658 ) ) ( TRUCK-AT ?auto_15655 ?auto_15659 ) ( IN-CITY ?auto_15659 ?auto_15656 ) ( not ( = ?auto_15652 ?auto_15659 ) ) ( not ( = ?auto_15657 ?auto_15659 ) ) ( OBJ-AT ?auto_15658 ?auto_15659 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15654 ?auto_15653 ?auto_15652 )
      ( DELIVER-2PKG-VERIFY ?auto_15653 ?auto_15654 ?auto_15652 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15661 - OBJ
      ?auto_15662 - OBJ
      ?auto_15660 - LOCATION
    )
    :vars
    (
      ?auto_15665 - LOCATION
      ?auto_15664 - CITY
      ?auto_15667 - OBJ
      ?auto_15663 - TRUCK
      ?auto_15666 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15665 ?auto_15664 ) ( IN-CITY ?auto_15660 ?auto_15664 ) ( not ( = ?auto_15660 ?auto_15665 ) ) ( OBJ-AT ?auto_15667 ?auto_15660 ) ( not ( = ?auto_15667 ?auto_15661 ) ) ( OBJ-AT ?auto_15661 ?auto_15665 ) ( not ( = ?auto_15667 ?auto_15662 ) ) ( not ( = ?auto_15661 ?auto_15662 ) ) ( TRUCK-AT ?auto_15663 ?auto_15666 ) ( IN-CITY ?auto_15666 ?auto_15664 ) ( not ( = ?auto_15660 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( OBJ-AT ?auto_15662 ?auto_15666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15667 ?auto_15661 ?auto_15660 )
      ( DELIVER-2PKG-VERIFY ?auto_15661 ?auto_15662 ?auto_15660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15678 - OBJ
      ?auto_15679 - OBJ
      ?auto_15680 - OBJ
      ?auto_15677 - LOCATION
    )
    :vars
    (
      ?auto_15683 - LOCATION
      ?auto_15682 - CITY
      ?auto_15684 - OBJ
      ?auto_15681 - TRUCK
      ?auto_15685 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15683 ?auto_15682 ) ( IN-CITY ?auto_15677 ?auto_15682 ) ( not ( = ?auto_15677 ?auto_15683 ) ) ( OBJ-AT ?auto_15679 ?auto_15677 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( OBJ-AT ?auto_15680 ?auto_15683 ) ( not ( = ?auto_15679 ?auto_15684 ) ) ( not ( = ?auto_15680 ?auto_15684 ) ) ( TRUCK-AT ?auto_15681 ?auto_15685 ) ( IN-CITY ?auto_15685 ?auto_15682 ) ( not ( = ?auto_15677 ?auto_15685 ) ) ( not ( = ?auto_15683 ?auto_15685 ) ) ( OBJ-AT ?auto_15684 ?auto_15685 ) ( OBJ-AT ?auto_15678 ?auto_15677 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15680 ) ) ( not ( = ?auto_15678 ?auto_15684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15679 ?auto_15680 ?auto_15677 )
      ( DELIVER-3PKG-VERIFY ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15687 - OBJ
      ?auto_15688 - OBJ
      ?auto_15689 - OBJ
      ?auto_15686 - LOCATION
    )
    :vars
    (
      ?auto_15692 - LOCATION
      ?auto_15691 - CITY
      ?auto_15690 - TRUCK
      ?auto_15693 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15692 ?auto_15691 ) ( IN-CITY ?auto_15686 ?auto_15691 ) ( not ( = ?auto_15686 ?auto_15692 ) ) ( OBJ-AT ?auto_15687 ?auto_15686 ) ( not ( = ?auto_15687 ?auto_15689 ) ) ( OBJ-AT ?auto_15689 ?auto_15692 ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15689 ?auto_15688 ) ) ( TRUCK-AT ?auto_15690 ?auto_15693 ) ( IN-CITY ?auto_15693 ?auto_15691 ) ( not ( = ?auto_15686 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( OBJ-AT ?auto_15688 ?auto_15693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15687 ?auto_15689 ?auto_15686 )
      ( DELIVER-3PKG-VERIFY ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15695 - OBJ
      ?auto_15696 - OBJ
      ?auto_15697 - OBJ
      ?auto_15694 - LOCATION
    )
    :vars
    (
      ?auto_15700 - LOCATION
      ?auto_15699 - CITY
      ?auto_15701 - OBJ
      ?auto_15698 - TRUCK
      ?auto_15702 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15700 ?auto_15699 ) ( IN-CITY ?auto_15694 ?auto_15699 ) ( not ( = ?auto_15694 ?auto_15700 ) ) ( OBJ-AT ?auto_15697 ?auto_15694 ) ( not ( = ?auto_15697 ?auto_15696 ) ) ( OBJ-AT ?auto_15696 ?auto_15700 ) ( not ( = ?auto_15697 ?auto_15701 ) ) ( not ( = ?auto_15696 ?auto_15701 ) ) ( TRUCK-AT ?auto_15698 ?auto_15702 ) ( IN-CITY ?auto_15702 ?auto_15699 ) ( not ( = ?auto_15694 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( OBJ-AT ?auto_15701 ?auto_15702 ) ( OBJ-AT ?auto_15695 ?auto_15694 ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15697 ?auto_15696 ?auto_15694 )
      ( DELIVER-3PKG-VERIFY ?auto_15695 ?auto_15696 ?auto_15697 ?auto_15694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15704 - OBJ
      ?auto_15705 - OBJ
      ?auto_15706 - OBJ
      ?auto_15703 - LOCATION
    )
    :vars
    (
      ?auto_15709 - LOCATION
      ?auto_15708 - CITY
      ?auto_15707 - TRUCK
      ?auto_15710 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15709 ?auto_15708 ) ( IN-CITY ?auto_15703 ?auto_15708 ) ( not ( = ?auto_15703 ?auto_15709 ) ) ( OBJ-AT ?auto_15704 ?auto_15703 ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( OBJ-AT ?auto_15705 ?auto_15709 ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( TRUCK-AT ?auto_15707 ?auto_15710 ) ( IN-CITY ?auto_15710 ?auto_15708 ) ( not ( = ?auto_15703 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( OBJ-AT ?auto_15706 ?auto_15710 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15704 ?auto_15705 ?auto_15703 )
      ( DELIVER-3PKG-VERIFY ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15721 - OBJ
      ?auto_15722 - OBJ
      ?auto_15723 - OBJ
      ?auto_15720 - LOCATION
    )
    :vars
    (
      ?auto_15726 - LOCATION
      ?auto_15725 - CITY
      ?auto_15724 - TRUCK
      ?auto_15727 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15726 ?auto_15725 ) ( IN-CITY ?auto_15720 ?auto_15725 ) ( not ( = ?auto_15720 ?auto_15726 ) ) ( OBJ-AT ?auto_15722 ?auto_15720 ) ( not ( = ?auto_15722 ?auto_15723 ) ) ( OBJ-AT ?auto_15723 ?auto_15726 ) ( not ( = ?auto_15722 ?auto_15721 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( TRUCK-AT ?auto_15724 ?auto_15727 ) ( IN-CITY ?auto_15727 ?auto_15725 ) ( not ( = ?auto_15720 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( OBJ-AT ?auto_15721 ?auto_15727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15722 ?auto_15723 ?auto_15720 )
      ( DELIVER-3PKG-VERIFY ?auto_15721 ?auto_15722 ?auto_15723 ?auto_15720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15738 - OBJ
      ?auto_15739 - OBJ
      ?auto_15740 - OBJ
      ?auto_15737 - LOCATION
    )
    :vars
    (
      ?auto_15743 - LOCATION
      ?auto_15742 - CITY
      ?auto_15741 - TRUCK
      ?auto_15744 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15743 ?auto_15742 ) ( IN-CITY ?auto_15737 ?auto_15742 ) ( not ( = ?auto_15737 ?auto_15743 ) ) ( OBJ-AT ?auto_15740 ?auto_15737 ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( OBJ-AT ?auto_15739 ?auto_15743 ) ( not ( = ?auto_15740 ?auto_15738 ) ) ( not ( = ?auto_15739 ?auto_15738 ) ) ( TRUCK-AT ?auto_15741 ?auto_15744 ) ( IN-CITY ?auto_15744 ?auto_15742 ) ( not ( = ?auto_15737 ?auto_15744 ) ) ( not ( = ?auto_15743 ?auto_15744 ) ) ( OBJ-AT ?auto_15738 ?auto_15744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15740 ?auto_15739 ?auto_15737 )
      ( DELIVER-3PKG-VERIFY ?auto_15738 ?auto_15739 ?auto_15740 ?auto_15737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15764 - OBJ
      ?auto_15765 - OBJ
      ?auto_15766 - OBJ
      ?auto_15763 - LOCATION
    )
    :vars
    (
      ?auto_15769 - LOCATION
      ?auto_15768 - CITY
      ?auto_15770 - OBJ
      ?auto_15767 - TRUCK
      ?auto_15771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15769 ?auto_15768 ) ( IN-CITY ?auto_15763 ?auto_15768 ) ( not ( = ?auto_15763 ?auto_15769 ) ) ( OBJ-AT ?auto_15766 ?auto_15763 ) ( not ( = ?auto_15766 ?auto_15764 ) ) ( OBJ-AT ?auto_15764 ?auto_15769 ) ( not ( = ?auto_15766 ?auto_15770 ) ) ( not ( = ?auto_15764 ?auto_15770 ) ) ( TRUCK-AT ?auto_15767 ?auto_15771 ) ( IN-CITY ?auto_15771 ?auto_15768 ) ( not ( = ?auto_15763 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( OBJ-AT ?auto_15770 ?auto_15771 ) ( OBJ-AT ?auto_15765 ?auto_15763 ) ( not ( = ?auto_15764 ?auto_15765 ) ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( not ( = ?auto_15765 ?auto_15770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15766 ?auto_15764 ?auto_15763 )
      ( DELIVER-3PKG-VERIFY ?auto_15764 ?auto_15765 ?auto_15766 ?auto_15763 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15773 - OBJ
      ?auto_15774 - OBJ
      ?auto_15775 - OBJ
      ?auto_15772 - LOCATION
    )
    :vars
    (
      ?auto_15778 - LOCATION
      ?auto_15777 - CITY
      ?auto_15776 - TRUCK
      ?auto_15779 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15778 ?auto_15777 ) ( IN-CITY ?auto_15772 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( OBJ-AT ?auto_15774 ?auto_15772 ) ( not ( = ?auto_15774 ?auto_15773 ) ) ( OBJ-AT ?auto_15773 ?auto_15778 ) ( not ( = ?auto_15774 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15775 ) ) ( TRUCK-AT ?auto_15776 ?auto_15779 ) ( IN-CITY ?auto_15779 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( OBJ-AT ?auto_15775 ?auto_15779 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15774 ?auto_15773 ?auto_15772 )
      ( DELIVER-3PKG-VERIFY ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15790 - OBJ
      ?auto_15791 - OBJ
      ?auto_15792 - OBJ
      ?auto_15789 - LOCATION
    )
    :vars
    (
      ?auto_15795 - LOCATION
      ?auto_15794 - CITY
      ?auto_15793 - TRUCK
      ?auto_15796 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15795 ?auto_15794 ) ( IN-CITY ?auto_15789 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15795 ) ) ( OBJ-AT ?auto_15792 ?auto_15789 ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( OBJ-AT ?auto_15790 ?auto_15795 ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( TRUCK-AT ?auto_15793 ?auto_15796 ) ( IN-CITY ?auto_15796 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( OBJ-AT ?auto_15791 ?auto_15796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15792 ?auto_15790 ?auto_15789 )
      ( DELIVER-3PKG-VERIFY ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15789 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15844 - OBJ
      ?auto_15843 - LOCATION
    )
    :vars
    (
      ?auto_15847 - LOCATION
      ?auto_15846 - CITY
      ?auto_15850 - OBJ
      ?auto_15848 - OBJ
      ?auto_15849 - LOCATION
      ?auto_15845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15847 ?auto_15846 ) ( IN-CITY ?auto_15843 ?auto_15846 ) ( not ( = ?auto_15843 ?auto_15847 ) ) ( OBJ-AT ?auto_15850 ?auto_15843 ) ( not ( = ?auto_15850 ?auto_15844 ) ) ( OBJ-AT ?auto_15844 ?auto_15847 ) ( not ( = ?auto_15850 ?auto_15848 ) ) ( not ( = ?auto_15844 ?auto_15848 ) ) ( IN-CITY ?auto_15849 ?auto_15846 ) ( not ( = ?auto_15843 ?auto_15849 ) ) ( not ( = ?auto_15847 ?auto_15849 ) ) ( OBJ-AT ?auto_15848 ?auto_15849 ) ( TRUCK-AT ?auto_15845 ?auto_15843 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15845 ?auto_15843 ?auto_15849 ?auto_15846 )
      ( DELIVER-2PKG ?auto_15850 ?auto_15844 ?auto_15843 )
      ( DELIVER-1PKG-VERIFY ?auto_15844 ?auto_15843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15852 - OBJ
      ?auto_15853 - OBJ
      ?auto_15851 - LOCATION
    )
    :vars
    (
      ?auto_15854 - LOCATION
      ?auto_15858 - CITY
      ?auto_15857 - OBJ
      ?auto_15856 - LOCATION
      ?auto_15855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15854 ?auto_15858 ) ( IN-CITY ?auto_15851 ?auto_15858 ) ( not ( = ?auto_15851 ?auto_15854 ) ) ( OBJ-AT ?auto_15852 ?auto_15851 ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( OBJ-AT ?auto_15853 ?auto_15854 ) ( not ( = ?auto_15852 ?auto_15857 ) ) ( not ( = ?auto_15853 ?auto_15857 ) ) ( IN-CITY ?auto_15856 ?auto_15858 ) ( not ( = ?auto_15851 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( OBJ-AT ?auto_15857 ?auto_15856 ) ( TRUCK-AT ?auto_15855 ?auto_15851 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15853 ?auto_15851 )
      ( DELIVER-2PKG-VERIFY ?auto_15852 ?auto_15853 ?auto_15851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15860 - OBJ
      ?auto_15861 - OBJ
      ?auto_15859 - LOCATION
    )
    :vars
    (
      ?auto_15862 - LOCATION
      ?auto_15863 - CITY
      ?auto_15866 - OBJ
      ?auto_15865 - LOCATION
      ?auto_15864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15862 ?auto_15863 ) ( IN-CITY ?auto_15859 ?auto_15863 ) ( not ( = ?auto_15859 ?auto_15862 ) ) ( OBJ-AT ?auto_15866 ?auto_15859 ) ( not ( = ?auto_15866 ?auto_15861 ) ) ( OBJ-AT ?auto_15861 ?auto_15862 ) ( not ( = ?auto_15866 ?auto_15860 ) ) ( not ( = ?auto_15861 ?auto_15860 ) ) ( IN-CITY ?auto_15865 ?auto_15863 ) ( not ( = ?auto_15859 ?auto_15865 ) ) ( not ( = ?auto_15862 ?auto_15865 ) ) ( OBJ-AT ?auto_15860 ?auto_15865 ) ( TRUCK-AT ?auto_15864 ?auto_15859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15866 ?auto_15861 ?auto_15859 )
      ( DELIVER-2PKG-VERIFY ?auto_15860 ?auto_15861 ?auto_15859 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15868 - OBJ
      ?auto_15869 - OBJ
      ?auto_15867 - LOCATION
    )
    :vars
    (
      ?auto_15870 - LOCATION
      ?auto_15871 - CITY
      ?auto_15874 - OBJ
      ?auto_15873 - LOCATION
      ?auto_15872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15870 ?auto_15871 ) ( IN-CITY ?auto_15867 ?auto_15871 ) ( not ( = ?auto_15867 ?auto_15870 ) ) ( OBJ-AT ?auto_15869 ?auto_15867 ) ( not ( = ?auto_15869 ?auto_15868 ) ) ( OBJ-AT ?auto_15868 ?auto_15870 ) ( not ( = ?auto_15869 ?auto_15874 ) ) ( not ( = ?auto_15868 ?auto_15874 ) ) ( IN-CITY ?auto_15873 ?auto_15871 ) ( not ( = ?auto_15867 ?auto_15873 ) ) ( not ( = ?auto_15870 ?auto_15873 ) ) ( OBJ-AT ?auto_15874 ?auto_15873 ) ( TRUCK-AT ?auto_15872 ?auto_15867 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15869 ?auto_15868 ?auto_15867 )
      ( DELIVER-2PKG-VERIFY ?auto_15868 ?auto_15869 ?auto_15867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15876 - OBJ
      ?auto_15877 - OBJ
      ?auto_15875 - LOCATION
    )
    :vars
    (
      ?auto_15878 - LOCATION
      ?auto_15879 - CITY
      ?auto_15882 - OBJ
      ?auto_15881 - LOCATION
      ?auto_15880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15878 ?auto_15879 ) ( IN-CITY ?auto_15875 ?auto_15879 ) ( not ( = ?auto_15875 ?auto_15878 ) ) ( OBJ-AT ?auto_15882 ?auto_15875 ) ( not ( = ?auto_15882 ?auto_15876 ) ) ( OBJ-AT ?auto_15876 ?auto_15878 ) ( not ( = ?auto_15882 ?auto_15877 ) ) ( not ( = ?auto_15876 ?auto_15877 ) ) ( IN-CITY ?auto_15881 ?auto_15879 ) ( not ( = ?auto_15875 ?auto_15881 ) ) ( not ( = ?auto_15878 ?auto_15881 ) ) ( OBJ-AT ?auto_15877 ?auto_15881 ) ( TRUCK-AT ?auto_15880 ?auto_15875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15882 ?auto_15876 ?auto_15875 )
      ( DELIVER-2PKG-VERIFY ?auto_15876 ?auto_15877 ?auto_15875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15893 - OBJ
      ?auto_15894 - OBJ
      ?auto_15895 - OBJ
      ?auto_15892 - LOCATION
    )
    :vars
    (
      ?auto_15896 - LOCATION
      ?auto_15897 - CITY
      ?auto_15900 - OBJ
      ?auto_15899 - LOCATION
      ?auto_15898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15896 ?auto_15897 ) ( IN-CITY ?auto_15892 ?auto_15897 ) ( not ( = ?auto_15892 ?auto_15896 ) ) ( OBJ-AT ?auto_15894 ?auto_15892 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( OBJ-AT ?auto_15895 ?auto_15896 ) ( not ( = ?auto_15894 ?auto_15900 ) ) ( not ( = ?auto_15895 ?auto_15900 ) ) ( IN-CITY ?auto_15899 ?auto_15897 ) ( not ( = ?auto_15892 ?auto_15899 ) ) ( not ( = ?auto_15896 ?auto_15899 ) ) ( OBJ-AT ?auto_15900 ?auto_15899 ) ( TRUCK-AT ?auto_15898 ?auto_15892 ) ( OBJ-AT ?auto_15893 ?auto_15892 ) ( not ( = ?auto_15893 ?auto_15894 ) ) ( not ( = ?auto_15893 ?auto_15895 ) ) ( not ( = ?auto_15893 ?auto_15900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15894 ?auto_15895 ?auto_15892 )
      ( DELIVER-3PKG-VERIFY ?auto_15893 ?auto_15894 ?auto_15895 ?auto_15892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15902 - OBJ
      ?auto_15903 - OBJ
      ?auto_15904 - OBJ
      ?auto_15901 - LOCATION
    )
    :vars
    (
      ?auto_15905 - LOCATION
      ?auto_15906 - CITY
      ?auto_15908 - LOCATION
      ?auto_15907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15905 ?auto_15906 ) ( IN-CITY ?auto_15901 ?auto_15906 ) ( not ( = ?auto_15901 ?auto_15905 ) ) ( OBJ-AT ?auto_15902 ?auto_15901 ) ( not ( = ?auto_15902 ?auto_15904 ) ) ( OBJ-AT ?auto_15904 ?auto_15905 ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( not ( = ?auto_15904 ?auto_15903 ) ) ( IN-CITY ?auto_15908 ?auto_15906 ) ( not ( = ?auto_15901 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( OBJ-AT ?auto_15903 ?auto_15908 ) ( TRUCK-AT ?auto_15907 ?auto_15901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15902 ?auto_15904 ?auto_15901 )
      ( DELIVER-3PKG-VERIFY ?auto_15902 ?auto_15903 ?auto_15904 ?auto_15901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15910 - OBJ
      ?auto_15911 - OBJ
      ?auto_15912 - OBJ
      ?auto_15909 - LOCATION
    )
    :vars
    (
      ?auto_15913 - LOCATION
      ?auto_15914 - CITY
      ?auto_15917 - OBJ
      ?auto_15916 - LOCATION
      ?auto_15915 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15913 ?auto_15914 ) ( IN-CITY ?auto_15909 ?auto_15914 ) ( not ( = ?auto_15909 ?auto_15913 ) ) ( OBJ-AT ?auto_15912 ?auto_15909 ) ( not ( = ?auto_15912 ?auto_15911 ) ) ( OBJ-AT ?auto_15911 ?auto_15913 ) ( not ( = ?auto_15912 ?auto_15917 ) ) ( not ( = ?auto_15911 ?auto_15917 ) ) ( IN-CITY ?auto_15916 ?auto_15914 ) ( not ( = ?auto_15909 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15916 ) ) ( OBJ-AT ?auto_15917 ?auto_15916 ) ( TRUCK-AT ?auto_15915 ?auto_15909 ) ( OBJ-AT ?auto_15910 ?auto_15909 ) ( not ( = ?auto_15910 ?auto_15911 ) ) ( not ( = ?auto_15910 ?auto_15912 ) ) ( not ( = ?auto_15910 ?auto_15917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15912 ?auto_15911 ?auto_15909 )
      ( DELIVER-3PKG-VERIFY ?auto_15910 ?auto_15911 ?auto_15912 ?auto_15909 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15919 - OBJ
      ?auto_15920 - OBJ
      ?auto_15921 - OBJ
      ?auto_15918 - LOCATION
    )
    :vars
    (
      ?auto_15922 - LOCATION
      ?auto_15923 - CITY
      ?auto_15925 - LOCATION
      ?auto_15924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15922 ?auto_15923 ) ( IN-CITY ?auto_15918 ?auto_15923 ) ( not ( = ?auto_15918 ?auto_15922 ) ) ( OBJ-AT ?auto_15919 ?auto_15918 ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( OBJ-AT ?auto_15920 ?auto_15922 ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15920 ?auto_15921 ) ) ( IN-CITY ?auto_15925 ?auto_15923 ) ( not ( = ?auto_15918 ?auto_15925 ) ) ( not ( = ?auto_15922 ?auto_15925 ) ) ( OBJ-AT ?auto_15921 ?auto_15925 ) ( TRUCK-AT ?auto_15924 ?auto_15918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15919 ?auto_15920 ?auto_15918 )
      ( DELIVER-3PKG-VERIFY ?auto_15919 ?auto_15920 ?auto_15921 ?auto_15918 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15936 - OBJ
      ?auto_15937 - OBJ
      ?auto_15938 - OBJ
      ?auto_15935 - LOCATION
    )
    :vars
    (
      ?auto_15939 - LOCATION
      ?auto_15940 - CITY
      ?auto_15942 - LOCATION
      ?auto_15941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15939 ?auto_15940 ) ( IN-CITY ?auto_15935 ?auto_15940 ) ( not ( = ?auto_15935 ?auto_15939 ) ) ( OBJ-AT ?auto_15937 ?auto_15935 ) ( not ( = ?auto_15937 ?auto_15938 ) ) ( OBJ-AT ?auto_15938 ?auto_15939 ) ( not ( = ?auto_15937 ?auto_15936 ) ) ( not ( = ?auto_15938 ?auto_15936 ) ) ( IN-CITY ?auto_15942 ?auto_15940 ) ( not ( = ?auto_15935 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( OBJ-AT ?auto_15936 ?auto_15942 ) ( TRUCK-AT ?auto_15941 ?auto_15935 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15937 ?auto_15938 ?auto_15935 )
      ( DELIVER-3PKG-VERIFY ?auto_15936 ?auto_15937 ?auto_15938 ?auto_15935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15953 - OBJ
      ?auto_15954 - OBJ
      ?auto_15955 - OBJ
      ?auto_15952 - LOCATION
    )
    :vars
    (
      ?auto_15956 - LOCATION
      ?auto_15957 - CITY
      ?auto_15959 - LOCATION
      ?auto_15958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15956 ?auto_15957 ) ( IN-CITY ?auto_15952 ?auto_15957 ) ( not ( = ?auto_15952 ?auto_15956 ) ) ( OBJ-AT ?auto_15955 ?auto_15952 ) ( not ( = ?auto_15955 ?auto_15954 ) ) ( OBJ-AT ?auto_15954 ?auto_15956 ) ( not ( = ?auto_15955 ?auto_15953 ) ) ( not ( = ?auto_15954 ?auto_15953 ) ) ( IN-CITY ?auto_15959 ?auto_15957 ) ( not ( = ?auto_15952 ?auto_15959 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( OBJ-AT ?auto_15953 ?auto_15959 ) ( TRUCK-AT ?auto_15958 ?auto_15952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15955 ?auto_15954 ?auto_15952 )
      ( DELIVER-3PKG-VERIFY ?auto_15953 ?auto_15954 ?auto_15955 ?auto_15952 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15979 - OBJ
      ?auto_15980 - OBJ
      ?auto_15981 - OBJ
      ?auto_15978 - LOCATION
    )
    :vars
    (
      ?auto_15982 - LOCATION
      ?auto_15983 - CITY
      ?auto_15986 - OBJ
      ?auto_15985 - LOCATION
      ?auto_15984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15982 ?auto_15983 ) ( IN-CITY ?auto_15978 ?auto_15983 ) ( not ( = ?auto_15978 ?auto_15982 ) ) ( OBJ-AT ?auto_15981 ?auto_15978 ) ( not ( = ?auto_15981 ?auto_15979 ) ) ( OBJ-AT ?auto_15979 ?auto_15982 ) ( not ( = ?auto_15981 ?auto_15986 ) ) ( not ( = ?auto_15979 ?auto_15986 ) ) ( IN-CITY ?auto_15985 ?auto_15983 ) ( not ( = ?auto_15978 ?auto_15985 ) ) ( not ( = ?auto_15982 ?auto_15985 ) ) ( OBJ-AT ?auto_15986 ?auto_15985 ) ( TRUCK-AT ?auto_15984 ?auto_15978 ) ( OBJ-AT ?auto_15980 ?auto_15978 ) ( not ( = ?auto_15979 ?auto_15980 ) ) ( not ( = ?auto_15980 ?auto_15981 ) ) ( not ( = ?auto_15980 ?auto_15986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15981 ?auto_15979 ?auto_15978 )
      ( DELIVER-3PKG-VERIFY ?auto_15979 ?auto_15980 ?auto_15981 ?auto_15978 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15988 - OBJ
      ?auto_15989 - OBJ
      ?auto_15990 - OBJ
      ?auto_15987 - LOCATION
    )
    :vars
    (
      ?auto_15991 - LOCATION
      ?auto_15992 - CITY
      ?auto_15994 - LOCATION
      ?auto_15993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15991 ?auto_15992 ) ( IN-CITY ?auto_15987 ?auto_15992 ) ( not ( = ?auto_15987 ?auto_15991 ) ) ( OBJ-AT ?auto_15989 ?auto_15987 ) ( not ( = ?auto_15989 ?auto_15988 ) ) ( OBJ-AT ?auto_15988 ?auto_15991 ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( not ( = ?auto_15988 ?auto_15990 ) ) ( IN-CITY ?auto_15994 ?auto_15992 ) ( not ( = ?auto_15987 ?auto_15994 ) ) ( not ( = ?auto_15991 ?auto_15994 ) ) ( OBJ-AT ?auto_15990 ?auto_15994 ) ( TRUCK-AT ?auto_15993 ?auto_15987 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15989 ?auto_15988 ?auto_15987 )
      ( DELIVER-3PKG-VERIFY ?auto_15988 ?auto_15989 ?auto_15990 ?auto_15987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16005 - OBJ
      ?auto_16006 - OBJ
      ?auto_16007 - OBJ
      ?auto_16004 - LOCATION
    )
    :vars
    (
      ?auto_16008 - LOCATION
      ?auto_16009 - CITY
      ?auto_16011 - LOCATION
      ?auto_16010 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16008 ?auto_16009 ) ( IN-CITY ?auto_16004 ?auto_16009 ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( OBJ-AT ?auto_16007 ?auto_16004 ) ( not ( = ?auto_16007 ?auto_16005 ) ) ( OBJ-AT ?auto_16005 ?auto_16008 ) ( not ( = ?auto_16007 ?auto_16006 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( IN-CITY ?auto_16011 ?auto_16009 ) ( not ( = ?auto_16004 ?auto_16011 ) ) ( not ( = ?auto_16008 ?auto_16011 ) ) ( OBJ-AT ?auto_16006 ?auto_16011 ) ( TRUCK-AT ?auto_16010 ?auto_16004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16007 ?auto_16005 ?auto_16004 )
      ( DELIVER-3PKG-VERIFY ?auto_16005 ?auto_16006 ?auto_16007 ?auto_16004 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16059 - OBJ
      ?auto_16058 - LOCATION
    )
    :vars
    (
      ?auto_16060 - LOCATION
      ?auto_16061 - CITY
      ?auto_16065 - OBJ
      ?auto_16064 - OBJ
      ?auto_16063 - LOCATION
      ?auto_16062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16060 ?auto_16061 ) ( IN-CITY ?auto_16058 ?auto_16061 ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16065 ?auto_16059 ) ) ( OBJ-AT ?auto_16059 ?auto_16060 ) ( not ( = ?auto_16065 ?auto_16064 ) ) ( not ( = ?auto_16059 ?auto_16064 ) ) ( IN-CITY ?auto_16063 ?auto_16061 ) ( not ( = ?auto_16058 ?auto_16063 ) ) ( not ( = ?auto_16060 ?auto_16063 ) ) ( OBJ-AT ?auto_16064 ?auto_16063 ) ( TRUCK-AT ?auto_16062 ?auto_16058 ) ( IN-TRUCK ?auto_16065 ?auto_16062 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16065 ?auto_16058 )
      ( DELIVER-2PKG ?auto_16065 ?auto_16059 ?auto_16058 )
      ( DELIVER-1PKG-VERIFY ?auto_16059 ?auto_16058 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16067 - OBJ
      ?auto_16068 - OBJ
      ?auto_16066 - LOCATION
    )
    :vars
    (
      ?auto_16072 - LOCATION
      ?auto_16069 - CITY
      ?auto_16073 - OBJ
      ?auto_16071 - LOCATION
      ?auto_16070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16072 ?auto_16069 ) ( IN-CITY ?auto_16066 ?auto_16069 ) ( not ( = ?auto_16066 ?auto_16072 ) ) ( not ( = ?auto_16067 ?auto_16068 ) ) ( OBJ-AT ?auto_16068 ?auto_16072 ) ( not ( = ?auto_16067 ?auto_16073 ) ) ( not ( = ?auto_16068 ?auto_16073 ) ) ( IN-CITY ?auto_16071 ?auto_16069 ) ( not ( = ?auto_16066 ?auto_16071 ) ) ( not ( = ?auto_16072 ?auto_16071 ) ) ( OBJ-AT ?auto_16073 ?auto_16071 ) ( TRUCK-AT ?auto_16070 ?auto_16066 ) ( IN-TRUCK ?auto_16067 ?auto_16070 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16068 ?auto_16066 )
      ( DELIVER-2PKG-VERIFY ?auto_16067 ?auto_16068 ?auto_16066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16075 - OBJ
      ?auto_16076 - OBJ
      ?auto_16074 - LOCATION
    )
    :vars
    (
      ?auto_16077 - LOCATION
      ?auto_16080 - CITY
      ?auto_16081 - OBJ
      ?auto_16078 - LOCATION
      ?auto_16079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16077 ?auto_16080 ) ( IN-CITY ?auto_16074 ?auto_16080 ) ( not ( = ?auto_16074 ?auto_16077 ) ) ( not ( = ?auto_16081 ?auto_16076 ) ) ( OBJ-AT ?auto_16076 ?auto_16077 ) ( not ( = ?auto_16081 ?auto_16075 ) ) ( not ( = ?auto_16076 ?auto_16075 ) ) ( IN-CITY ?auto_16078 ?auto_16080 ) ( not ( = ?auto_16074 ?auto_16078 ) ) ( not ( = ?auto_16077 ?auto_16078 ) ) ( OBJ-AT ?auto_16075 ?auto_16078 ) ( TRUCK-AT ?auto_16079 ?auto_16074 ) ( IN-TRUCK ?auto_16081 ?auto_16079 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16081 ?auto_16076 ?auto_16074 )
      ( DELIVER-2PKG-VERIFY ?auto_16075 ?auto_16076 ?auto_16074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16083 - OBJ
      ?auto_16084 - OBJ
      ?auto_16082 - LOCATION
    )
    :vars
    (
      ?auto_16086 - LOCATION
      ?auto_16089 - CITY
      ?auto_16085 - OBJ
      ?auto_16087 - LOCATION
      ?auto_16088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16086 ?auto_16089 ) ( IN-CITY ?auto_16082 ?auto_16089 ) ( not ( = ?auto_16082 ?auto_16086 ) ) ( not ( = ?auto_16084 ?auto_16083 ) ) ( OBJ-AT ?auto_16083 ?auto_16086 ) ( not ( = ?auto_16084 ?auto_16085 ) ) ( not ( = ?auto_16083 ?auto_16085 ) ) ( IN-CITY ?auto_16087 ?auto_16089 ) ( not ( = ?auto_16082 ?auto_16087 ) ) ( not ( = ?auto_16086 ?auto_16087 ) ) ( OBJ-AT ?auto_16085 ?auto_16087 ) ( TRUCK-AT ?auto_16088 ?auto_16082 ) ( IN-TRUCK ?auto_16084 ?auto_16088 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16084 ?auto_16083 ?auto_16082 )
      ( DELIVER-2PKG-VERIFY ?auto_16083 ?auto_16084 ?auto_16082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16091 - OBJ
      ?auto_16092 - OBJ
      ?auto_16090 - LOCATION
    )
    :vars
    (
      ?auto_16093 - LOCATION
      ?auto_16096 - CITY
      ?auto_16097 - OBJ
      ?auto_16094 - LOCATION
      ?auto_16095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16093 ?auto_16096 ) ( IN-CITY ?auto_16090 ?auto_16096 ) ( not ( = ?auto_16090 ?auto_16093 ) ) ( not ( = ?auto_16097 ?auto_16091 ) ) ( OBJ-AT ?auto_16091 ?auto_16093 ) ( not ( = ?auto_16097 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( IN-CITY ?auto_16094 ?auto_16096 ) ( not ( = ?auto_16090 ?auto_16094 ) ) ( not ( = ?auto_16093 ?auto_16094 ) ) ( OBJ-AT ?auto_16092 ?auto_16094 ) ( TRUCK-AT ?auto_16095 ?auto_16090 ) ( IN-TRUCK ?auto_16097 ?auto_16095 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16097 ?auto_16091 ?auto_16090 )
      ( DELIVER-2PKG-VERIFY ?auto_16091 ?auto_16092 ?auto_16090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16117 - OBJ
      ?auto_16118 - OBJ
      ?auto_16119 - OBJ
      ?auto_16116 - LOCATION
    )
    :vars
    (
      ?auto_16120 - LOCATION
      ?auto_16123 - CITY
      ?auto_16121 - LOCATION
      ?auto_16122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16120 ?auto_16123 ) ( IN-CITY ?auto_16116 ?auto_16123 ) ( not ( = ?auto_16116 ?auto_16120 ) ) ( not ( = ?auto_16117 ?auto_16119 ) ) ( OBJ-AT ?auto_16119 ?auto_16120 ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( not ( = ?auto_16119 ?auto_16118 ) ) ( IN-CITY ?auto_16121 ?auto_16123 ) ( not ( = ?auto_16116 ?auto_16121 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( OBJ-AT ?auto_16118 ?auto_16121 ) ( TRUCK-AT ?auto_16122 ?auto_16116 ) ( IN-TRUCK ?auto_16117 ?auto_16122 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16117 ?auto_16119 ?auto_16116 )
      ( DELIVER-3PKG-VERIFY ?auto_16117 ?auto_16118 ?auto_16119 ?auto_16116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16134 - OBJ
      ?auto_16135 - OBJ
      ?auto_16136 - OBJ
      ?auto_16133 - LOCATION
    )
    :vars
    (
      ?auto_16137 - LOCATION
      ?auto_16140 - CITY
      ?auto_16138 - LOCATION
      ?auto_16139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16137 ?auto_16140 ) ( IN-CITY ?auto_16133 ?auto_16140 ) ( not ( = ?auto_16133 ?auto_16137 ) ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( OBJ-AT ?auto_16135 ?auto_16137 ) ( not ( = ?auto_16134 ?auto_16136 ) ) ( not ( = ?auto_16135 ?auto_16136 ) ) ( IN-CITY ?auto_16138 ?auto_16140 ) ( not ( = ?auto_16133 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( OBJ-AT ?auto_16136 ?auto_16138 ) ( TRUCK-AT ?auto_16139 ?auto_16133 ) ( IN-TRUCK ?auto_16134 ?auto_16139 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16134 ?auto_16135 ?auto_16133 )
      ( DELIVER-3PKG-VERIFY ?auto_16134 ?auto_16135 ?auto_16136 ?auto_16133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16151 - OBJ
      ?auto_16152 - OBJ
      ?auto_16153 - OBJ
      ?auto_16150 - LOCATION
    )
    :vars
    (
      ?auto_16154 - LOCATION
      ?auto_16157 - CITY
      ?auto_16155 - LOCATION
      ?auto_16156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16154 ?auto_16157 ) ( IN-CITY ?auto_16150 ?auto_16157 ) ( not ( = ?auto_16150 ?auto_16154 ) ) ( not ( = ?auto_16152 ?auto_16153 ) ) ( OBJ-AT ?auto_16153 ?auto_16154 ) ( not ( = ?auto_16152 ?auto_16151 ) ) ( not ( = ?auto_16153 ?auto_16151 ) ) ( IN-CITY ?auto_16155 ?auto_16157 ) ( not ( = ?auto_16150 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( OBJ-AT ?auto_16151 ?auto_16155 ) ( TRUCK-AT ?auto_16156 ?auto_16150 ) ( IN-TRUCK ?auto_16152 ?auto_16156 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16152 ?auto_16153 ?auto_16150 )
      ( DELIVER-3PKG-VERIFY ?auto_16151 ?auto_16152 ?auto_16153 ?auto_16150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16168 - OBJ
      ?auto_16169 - OBJ
      ?auto_16170 - OBJ
      ?auto_16167 - LOCATION
    )
    :vars
    (
      ?auto_16171 - LOCATION
      ?auto_16174 - CITY
      ?auto_16172 - LOCATION
      ?auto_16173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16171 ?auto_16174 ) ( IN-CITY ?auto_16167 ?auto_16174 ) ( not ( = ?auto_16167 ?auto_16171 ) ) ( not ( = ?auto_16170 ?auto_16169 ) ) ( OBJ-AT ?auto_16169 ?auto_16171 ) ( not ( = ?auto_16170 ?auto_16168 ) ) ( not ( = ?auto_16169 ?auto_16168 ) ) ( IN-CITY ?auto_16172 ?auto_16174 ) ( not ( = ?auto_16167 ?auto_16172 ) ) ( not ( = ?auto_16171 ?auto_16172 ) ) ( OBJ-AT ?auto_16168 ?auto_16172 ) ( TRUCK-AT ?auto_16173 ?auto_16167 ) ( IN-TRUCK ?auto_16170 ?auto_16173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16170 ?auto_16169 ?auto_16167 )
      ( DELIVER-3PKG-VERIFY ?auto_16168 ?auto_16169 ?auto_16170 ?auto_16167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16203 - OBJ
      ?auto_16204 - OBJ
      ?auto_16205 - OBJ
      ?auto_16202 - LOCATION
    )
    :vars
    (
      ?auto_16206 - LOCATION
      ?auto_16209 - CITY
      ?auto_16207 - LOCATION
      ?auto_16208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16206 ?auto_16209 ) ( IN-CITY ?auto_16202 ?auto_16209 ) ( not ( = ?auto_16202 ?auto_16206 ) ) ( not ( = ?auto_16204 ?auto_16203 ) ) ( OBJ-AT ?auto_16203 ?auto_16206 ) ( not ( = ?auto_16204 ?auto_16205 ) ) ( not ( = ?auto_16203 ?auto_16205 ) ) ( IN-CITY ?auto_16207 ?auto_16209 ) ( not ( = ?auto_16202 ?auto_16207 ) ) ( not ( = ?auto_16206 ?auto_16207 ) ) ( OBJ-AT ?auto_16205 ?auto_16207 ) ( TRUCK-AT ?auto_16208 ?auto_16202 ) ( IN-TRUCK ?auto_16204 ?auto_16208 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16204 ?auto_16203 ?auto_16202 )
      ( DELIVER-3PKG-VERIFY ?auto_16203 ?auto_16204 ?auto_16205 ?auto_16202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16220 - OBJ
      ?auto_16221 - OBJ
      ?auto_16222 - OBJ
      ?auto_16219 - LOCATION
    )
    :vars
    (
      ?auto_16223 - LOCATION
      ?auto_16226 - CITY
      ?auto_16224 - LOCATION
      ?auto_16225 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16223 ?auto_16226 ) ( IN-CITY ?auto_16219 ?auto_16226 ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16220 ) ) ( OBJ-AT ?auto_16220 ?auto_16223 ) ( not ( = ?auto_16222 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( IN-CITY ?auto_16224 ?auto_16226 ) ( not ( = ?auto_16219 ?auto_16224 ) ) ( not ( = ?auto_16223 ?auto_16224 ) ) ( OBJ-AT ?auto_16221 ?auto_16224 ) ( TRUCK-AT ?auto_16225 ?auto_16219 ) ( IN-TRUCK ?auto_16222 ?auto_16225 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16222 ?auto_16220 ?auto_16219 )
      ( DELIVER-3PKG-VERIFY ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16219 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16274 - OBJ
      ?auto_16273 - LOCATION
    )
    :vars
    (
      ?auto_16276 - LOCATION
      ?auto_16279 - CITY
      ?auto_16280 - OBJ
      ?auto_16275 - OBJ
      ?auto_16277 - LOCATION
      ?auto_16278 - TRUCK
      ?auto_16281 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16276 ?auto_16279 ) ( IN-CITY ?auto_16273 ?auto_16279 ) ( not ( = ?auto_16273 ?auto_16276 ) ) ( not ( = ?auto_16280 ?auto_16274 ) ) ( OBJ-AT ?auto_16274 ?auto_16276 ) ( not ( = ?auto_16280 ?auto_16275 ) ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( IN-CITY ?auto_16277 ?auto_16279 ) ( not ( = ?auto_16273 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( OBJ-AT ?auto_16275 ?auto_16277 ) ( IN-TRUCK ?auto_16280 ?auto_16278 ) ( TRUCK-AT ?auto_16278 ?auto_16281 ) ( IN-CITY ?auto_16281 ?auto_16279 ) ( not ( = ?auto_16273 ?auto_16281 ) ) ( not ( = ?auto_16276 ?auto_16281 ) ) ( not ( = ?auto_16277 ?auto_16281 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16278 ?auto_16281 ?auto_16273 ?auto_16279 )
      ( DELIVER-2PKG ?auto_16280 ?auto_16274 ?auto_16273 )
      ( DELIVER-1PKG-VERIFY ?auto_16274 ?auto_16273 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16283 - OBJ
      ?auto_16284 - OBJ
      ?auto_16282 - LOCATION
    )
    :vars
    (
      ?auto_16289 - LOCATION
      ?auto_16287 - CITY
      ?auto_16286 - OBJ
      ?auto_16285 - LOCATION
      ?auto_16290 - TRUCK
      ?auto_16288 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16289 ?auto_16287 ) ( IN-CITY ?auto_16282 ?auto_16287 ) ( not ( = ?auto_16282 ?auto_16289 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( OBJ-AT ?auto_16284 ?auto_16289 ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( IN-CITY ?auto_16285 ?auto_16287 ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16289 ?auto_16285 ) ) ( OBJ-AT ?auto_16286 ?auto_16285 ) ( IN-TRUCK ?auto_16283 ?auto_16290 ) ( TRUCK-AT ?auto_16290 ?auto_16288 ) ( IN-CITY ?auto_16288 ?auto_16287 ) ( not ( = ?auto_16282 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16284 ?auto_16282 )
      ( DELIVER-2PKG-VERIFY ?auto_16283 ?auto_16284 ?auto_16282 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16292 - OBJ
      ?auto_16293 - OBJ
      ?auto_16291 - LOCATION
    )
    :vars
    (
      ?auto_16297 - LOCATION
      ?auto_16298 - CITY
      ?auto_16299 - OBJ
      ?auto_16295 - LOCATION
      ?auto_16296 - TRUCK
      ?auto_16294 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16297 ?auto_16298 ) ( IN-CITY ?auto_16291 ?auto_16298 ) ( not ( = ?auto_16291 ?auto_16297 ) ) ( not ( = ?auto_16299 ?auto_16293 ) ) ( OBJ-AT ?auto_16293 ?auto_16297 ) ( not ( = ?auto_16299 ?auto_16292 ) ) ( not ( = ?auto_16293 ?auto_16292 ) ) ( IN-CITY ?auto_16295 ?auto_16298 ) ( not ( = ?auto_16291 ?auto_16295 ) ) ( not ( = ?auto_16297 ?auto_16295 ) ) ( OBJ-AT ?auto_16292 ?auto_16295 ) ( IN-TRUCK ?auto_16299 ?auto_16296 ) ( TRUCK-AT ?auto_16296 ?auto_16294 ) ( IN-CITY ?auto_16294 ?auto_16298 ) ( not ( = ?auto_16291 ?auto_16294 ) ) ( not ( = ?auto_16297 ?auto_16294 ) ) ( not ( = ?auto_16295 ?auto_16294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16299 ?auto_16293 ?auto_16291 )
      ( DELIVER-2PKG-VERIFY ?auto_16292 ?auto_16293 ?auto_16291 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16301 - OBJ
      ?auto_16302 - OBJ
      ?auto_16300 - LOCATION
    )
    :vars
    (
      ?auto_16307 - LOCATION
      ?auto_16308 - CITY
      ?auto_16305 - OBJ
      ?auto_16304 - LOCATION
      ?auto_16306 - TRUCK
      ?auto_16303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16307 ?auto_16308 ) ( IN-CITY ?auto_16300 ?auto_16308 ) ( not ( = ?auto_16300 ?auto_16307 ) ) ( not ( = ?auto_16302 ?auto_16301 ) ) ( OBJ-AT ?auto_16301 ?auto_16307 ) ( not ( = ?auto_16302 ?auto_16305 ) ) ( not ( = ?auto_16301 ?auto_16305 ) ) ( IN-CITY ?auto_16304 ?auto_16308 ) ( not ( = ?auto_16300 ?auto_16304 ) ) ( not ( = ?auto_16307 ?auto_16304 ) ) ( OBJ-AT ?auto_16305 ?auto_16304 ) ( IN-TRUCK ?auto_16302 ?auto_16306 ) ( TRUCK-AT ?auto_16306 ?auto_16303 ) ( IN-CITY ?auto_16303 ?auto_16308 ) ( not ( = ?auto_16300 ?auto_16303 ) ) ( not ( = ?auto_16307 ?auto_16303 ) ) ( not ( = ?auto_16304 ?auto_16303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16302 ?auto_16301 ?auto_16300 )
      ( DELIVER-2PKG-VERIFY ?auto_16301 ?auto_16302 ?auto_16300 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16310 - OBJ
      ?auto_16311 - OBJ
      ?auto_16309 - LOCATION
    )
    :vars
    (
      ?auto_16315 - LOCATION
      ?auto_16316 - CITY
      ?auto_16317 - OBJ
      ?auto_16313 - LOCATION
      ?auto_16314 - TRUCK
      ?auto_16312 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16315 ?auto_16316 ) ( IN-CITY ?auto_16309 ?auto_16316 ) ( not ( = ?auto_16309 ?auto_16315 ) ) ( not ( = ?auto_16317 ?auto_16310 ) ) ( OBJ-AT ?auto_16310 ?auto_16315 ) ( not ( = ?auto_16317 ?auto_16311 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( IN-CITY ?auto_16313 ?auto_16316 ) ( not ( = ?auto_16309 ?auto_16313 ) ) ( not ( = ?auto_16315 ?auto_16313 ) ) ( OBJ-AT ?auto_16311 ?auto_16313 ) ( IN-TRUCK ?auto_16317 ?auto_16314 ) ( TRUCK-AT ?auto_16314 ?auto_16312 ) ( IN-CITY ?auto_16312 ?auto_16316 ) ( not ( = ?auto_16309 ?auto_16312 ) ) ( not ( = ?auto_16315 ?auto_16312 ) ) ( not ( = ?auto_16313 ?auto_16312 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16317 ?auto_16310 ?auto_16309 )
      ( DELIVER-2PKG-VERIFY ?auto_16310 ?auto_16311 ?auto_16309 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16339 - OBJ
      ?auto_16340 - OBJ
      ?auto_16341 - OBJ
      ?auto_16338 - LOCATION
    )
    :vars
    (
      ?auto_16345 - LOCATION
      ?auto_16346 - CITY
      ?auto_16343 - LOCATION
      ?auto_16344 - TRUCK
      ?auto_16342 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16345 ?auto_16346 ) ( IN-CITY ?auto_16338 ?auto_16346 ) ( not ( = ?auto_16338 ?auto_16345 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( OBJ-AT ?auto_16341 ?auto_16345 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16341 ?auto_16340 ) ) ( IN-CITY ?auto_16343 ?auto_16346 ) ( not ( = ?auto_16338 ?auto_16343 ) ) ( not ( = ?auto_16345 ?auto_16343 ) ) ( OBJ-AT ?auto_16340 ?auto_16343 ) ( IN-TRUCK ?auto_16339 ?auto_16344 ) ( TRUCK-AT ?auto_16344 ?auto_16342 ) ( IN-CITY ?auto_16342 ?auto_16346 ) ( not ( = ?auto_16338 ?auto_16342 ) ) ( not ( = ?auto_16345 ?auto_16342 ) ) ( not ( = ?auto_16343 ?auto_16342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16339 ?auto_16341 ?auto_16338 )
      ( DELIVER-3PKG-VERIFY ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16358 - OBJ
      ?auto_16359 - OBJ
      ?auto_16360 - OBJ
      ?auto_16357 - LOCATION
    )
    :vars
    (
      ?auto_16364 - LOCATION
      ?auto_16365 - CITY
      ?auto_16362 - LOCATION
      ?auto_16363 - TRUCK
      ?auto_16361 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16364 ?auto_16365 ) ( IN-CITY ?auto_16357 ?auto_16365 ) ( not ( = ?auto_16357 ?auto_16364 ) ) ( not ( = ?auto_16358 ?auto_16359 ) ) ( OBJ-AT ?auto_16359 ?auto_16364 ) ( not ( = ?auto_16358 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( IN-CITY ?auto_16362 ?auto_16365 ) ( not ( = ?auto_16357 ?auto_16362 ) ) ( not ( = ?auto_16364 ?auto_16362 ) ) ( OBJ-AT ?auto_16360 ?auto_16362 ) ( IN-TRUCK ?auto_16358 ?auto_16363 ) ( TRUCK-AT ?auto_16363 ?auto_16361 ) ( IN-CITY ?auto_16361 ?auto_16365 ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( not ( = ?auto_16364 ?auto_16361 ) ) ( not ( = ?auto_16362 ?auto_16361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16358 ?auto_16359 ?auto_16357 )
      ( DELIVER-3PKG-VERIFY ?auto_16358 ?auto_16359 ?auto_16360 ?auto_16357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16377 - OBJ
      ?auto_16378 - OBJ
      ?auto_16379 - OBJ
      ?auto_16376 - LOCATION
    )
    :vars
    (
      ?auto_16383 - LOCATION
      ?auto_16384 - CITY
      ?auto_16381 - LOCATION
      ?auto_16382 - TRUCK
      ?auto_16380 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16383 ?auto_16384 ) ( IN-CITY ?auto_16376 ?auto_16384 ) ( not ( = ?auto_16376 ?auto_16383 ) ) ( not ( = ?auto_16378 ?auto_16379 ) ) ( OBJ-AT ?auto_16379 ?auto_16383 ) ( not ( = ?auto_16378 ?auto_16377 ) ) ( not ( = ?auto_16379 ?auto_16377 ) ) ( IN-CITY ?auto_16381 ?auto_16384 ) ( not ( = ?auto_16376 ?auto_16381 ) ) ( not ( = ?auto_16383 ?auto_16381 ) ) ( OBJ-AT ?auto_16377 ?auto_16381 ) ( IN-TRUCK ?auto_16378 ?auto_16382 ) ( TRUCK-AT ?auto_16382 ?auto_16380 ) ( IN-CITY ?auto_16380 ?auto_16384 ) ( not ( = ?auto_16376 ?auto_16380 ) ) ( not ( = ?auto_16383 ?auto_16380 ) ) ( not ( = ?auto_16381 ?auto_16380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16378 ?auto_16379 ?auto_16376 )
      ( DELIVER-3PKG-VERIFY ?auto_16377 ?auto_16378 ?auto_16379 ?auto_16376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16396 - OBJ
      ?auto_16397 - OBJ
      ?auto_16398 - OBJ
      ?auto_16395 - LOCATION
    )
    :vars
    (
      ?auto_16402 - LOCATION
      ?auto_16403 - CITY
      ?auto_16400 - LOCATION
      ?auto_16401 - TRUCK
      ?auto_16399 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16402 ?auto_16403 ) ( IN-CITY ?auto_16395 ?auto_16403 ) ( not ( = ?auto_16395 ?auto_16402 ) ) ( not ( = ?auto_16398 ?auto_16397 ) ) ( OBJ-AT ?auto_16397 ?auto_16402 ) ( not ( = ?auto_16398 ?auto_16396 ) ) ( not ( = ?auto_16397 ?auto_16396 ) ) ( IN-CITY ?auto_16400 ?auto_16403 ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( not ( = ?auto_16402 ?auto_16400 ) ) ( OBJ-AT ?auto_16396 ?auto_16400 ) ( IN-TRUCK ?auto_16398 ?auto_16401 ) ( TRUCK-AT ?auto_16401 ?auto_16399 ) ( IN-CITY ?auto_16399 ?auto_16403 ) ( not ( = ?auto_16395 ?auto_16399 ) ) ( not ( = ?auto_16402 ?auto_16399 ) ) ( not ( = ?auto_16400 ?auto_16399 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16398 ?auto_16397 ?auto_16395 )
      ( DELIVER-3PKG-VERIFY ?auto_16396 ?auto_16397 ?auto_16398 ?auto_16395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16435 - OBJ
      ?auto_16436 - OBJ
      ?auto_16437 - OBJ
      ?auto_16434 - LOCATION
    )
    :vars
    (
      ?auto_16441 - LOCATION
      ?auto_16442 - CITY
      ?auto_16439 - LOCATION
      ?auto_16440 - TRUCK
      ?auto_16438 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16441 ?auto_16442 ) ( IN-CITY ?auto_16434 ?auto_16442 ) ( not ( = ?auto_16434 ?auto_16441 ) ) ( not ( = ?auto_16436 ?auto_16435 ) ) ( OBJ-AT ?auto_16435 ?auto_16441 ) ( not ( = ?auto_16436 ?auto_16437 ) ) ( not ( = ?auto_16435 ?auto_16437 ) ) ( IN-CITY ?auto_16439 ?auto_16442 ) ( not ( = ?auto_16434 ?auto_16439 ) ) ( not ( = ?auto_16441 ?auto_16439 ) ) ( OBJ-AT ?auto_16437 ?auto_16439 ) ( IN-TRUCK ?auto_16436 ?auto_16440 ) ( TRUCK-AT ?auto_16440 ?auto_16438 ) ( IN-CITY ?auto_16438 ?auto_16442 ) ( not ( = ?auto_16434 ?auto_16438 ) ) ( not ( = ?auto_16441 ?auto_16438 ) ) ( not ( = ?auto_16439 ?auto_16438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16436 ?auto_16435 ?auto_16434 )
      ( DELIVER-3PKG-VERIFY ?auto_16435 ?auto_16436 ?auto_16437 ?auto_16434 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16454 - OBJ
      ?auto_16455 - OBJ
      ?auto_16456 - OBJ
      ?auto_16453 - LOCATION
    )
    :vars
    (
      ?auto_16460 - LOCATION
      ?auto_16461 - CITY
      ?auto_16458 - LOCATION
      ?auto_16459 - TRUCK
      ?auto_16457 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16460 ?auto_16461 ) ( IN-CITY ?auto_16453 ?auto_16461 ) ( not ( = ?auto_16453 ?auto_16460 ) ) ( not ( = ?auto_16456 ?auto_16454 ) ) ( OBJ-AT ?auto_16454 ?auto_16460 ) ( not ( = ?auto_16456 ?auto_16455 ) ) ( not ( = ?auto_16454 ?auto_16455 ) ) ( IN-CITY ?auto_16458 ?auto_16461 ) ( not ( = ?auto_16453 ?auto_16458 ) ) ( not ( = ?auto_16460 ?auto_16458 ) ) ( OBJ-AT ?auto_16455 ?auto_16458 ) ( IN-TRUCK ?auto_16456 ?auto_16459 ) ( TRUCK-AT ?auto_16459 ?auto_16457 ) ( IN-CITY ?auto_16457 ?auto_16461 ) ( not ( = ?auto_16453 ?auto_16457 ) ) ( not ( = ?auto_16460 ?auto_16457 ) ) ( not ( = ?auto_16458 ?auto_16457 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16456 ?auto_16454 ?auto_16453 )
      ( DELIVER-3PKG-VERIFY ?auto_16454 ?auto_16455 ?auto_16456 ?auto_16453 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16514 - OBJ
      ?auto_16513 - LOCATION
    )
    :vars
    (
      ?auto_16519 - LOCATION
      ?auto_16520 - CITY
      ?auto_16521 - OBJ
      ?auto_16517 - OBJ
      ?auto_16516 - LOCATION
      ?auto_16518 - TRUCK
      ?auto_16515 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16519 ?auto_16520 ) ( IN-CITY ?auto_16513 ?auto_16520 ) ( not ( = ?auto_16513 ?auto_16519 ) ) ( not ( = ?auto_16521 ?auto_16514 ) ) ( OBJ-AT ?auto_16514 ?auto_16519 ) ( not ( = ?auto_16521 ?auto_16517 ) ) ( not ( = ?auto_16514 ?auto_16517 ) ) ( IN-CITY ?auto_16516 ?auto_16520 ) ( not ( = ?auto_16513 ?auto_16516 ) ) ( not ( = ?auto_16519 ?auto_16516 ) ) ( OBJ-AT ?auto_16517 ?auto_16516 ) ( TRUCK-AT ?auto_16518 ?auto_16515 ) ( IN-CITY ?auto_16515 ?auto_16520 ) ( not ( = ?auto_16513 ?auto_16515 ) ) ( not ( = ?auto_16519 ?auto_16515 ) ) ( not ( = ?auto_16516 ?auto_16515 ) ) ( OBJ-AT ?auto_16521 ?auto_16515 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16521 ?auto_16518 ?auto_16515 )
      ( DELIVER-2PKG ?auto_16521 ?auto_16514 ?auto_16513 )
      ( DELIVER-1PKG-VERIFY ?auto_16514 ?auto_16513 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16523 - OBJ
      ?auto_16524 - OBJ
      ?auto_16522 - LOCATION
    )
    :vars
    (
      ?auto_16529 - LOCATION
      ?auto_16525 - CITY
      ?auto_16528 - OBJ
      ?auto_16526 - LOCATION
      ?auto_16530 - TRUCK
      ?auto_16527 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16529 ?auto_16525 ) ( IN-CITY ?auto_16522 ?auto_16525 ) ( not ( = ?auto_16522 ?auto_16529 ) ) ( not ( = ?auto_16523 ?auto_16524 ) ) ( OBJ-AT ?auto_16524 ?auto_16529 ) ( not ( = ?auto_16523 ?auto_16528 ) ) ( not ( = ?auto_16524 ?auto_16528 ) ) ( IN-CITY ?auto_16526 ?auto_16525 ) ( not ( = ?auto_16522 ?auto_16526 ) ) ( not ( = ?auto_16529 ?auto_16526 ) ) ( OBJ-AT ?auto_16528 ?auto_16526 ) ( TRUCK-AT ?auto_16530 ?auto_16527 ) ( IN-CITY ?auto_16527 ?auto_16525 ) ( not ( = ?auto_16522 ?auto_16527 ) ) ( not ( = ?auto_16529 ?auto_16527 ) ) ( not ( = ?auto_16526 ?auto_16527 ) ) ( OBJ-AT ?auto_16523 ?auto_16527 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16524 ?auto_16522 )
      ( DELIVER-2PKG-VERIFY ?auto_16523 ?auto_16524 ?auto_16522 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16532 - OBJ
      ?auto_16533 - OBJ
      ?auto_16531 - LOCATION
    )
    :vars
    (
      ?auto_16535 - LOCATION
      ?auto_16538 - CITY
      ?auto_16539 - OBJ
      ?auto_16534 - LOCATION
      ?auto_16537 - TRUCK
      ?auto_16536 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16535 ?auto_16538 ) ( IN-CITY ?auto_16531 ?auto_16538 ) ( not ( = ?auto_16531 ?auto_16535 ) ) ( not ( = ?auto_16539 ?auto_16533 ) ) ( OBJ-AT ?auto_16533 ?auto_16535 ) ( not ( = ?auto_16539 ?auto_16532 ) ) ( not ( = ?auto_16533 ?auto_16532 ) ) ( IN-CITY ?auto_16534 ?auto_16538 ) ( not ( = ?auto_16531 ?auto_16534 ) ) ( not ( = ?auto_16535 ?auto_16534 ) ) ( OBJ-AT ?auto_16532 ?auto_16534 ) ( TRUCK-AT ?auto_16537 ?auto_16536 ) ( IN-CITY ?auto_16536 ?auto_16538 ) ( not ( = ?auto_16531 ?auto_16536 ) ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16534 ?auto_16536 ) ) ( OBJ-AT ?auto_16539 ?auto_16536 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16539 ?auto_16533 ?auto_16531 )
      ( DELIVER-2PKG-VERIFY ?auto_16532 ?auto_16533 ?auto_16531 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16541 - OBJ
      ?auto_16542 - OBJ
      ?auto_16540 - LOCATION
    )
    :vars
    (
      ?auto_16544 - LOCATION
      ?auto_16548 - CITY
      ?auto_16547 - OBJ
      ?auto_16543 - LOCATION
      ?auto_16546 - TRUCK
      ?auto_16545 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16544 ?auto_16548 ) ( IN-CITY ?auto_16540 ?auto_16548 ) ( not ( = ?auto_16540 ?auto_16544 ) ) ( not ( = ?auto_16542 ?auto_16541 ) ) ( OBJ-AT ?auto_16541 ?auto_16544 ) ( not ( = ?auto_16542 ?auto_16547 ) ) ( not ( = ?auto_16541 ?auto_16547 ) ) ( IN-CITY ?auto_16543 ?auto_16548 ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16544 ?auto_16543 ) ) ( OBJ-AT ?auto_16547 ?auto_16543 ) ( TRUCK-AT ?auto_16546 ?auto_16545 ) ( IN-CITY ?auto_16545 ?auto_16548 ) ( not ( = ?auto_16540 ?auto_16545 ) ) ( not ( = ?auto_16544 ?auto_16545 ) ) ( not ( = ?auto_16543 ?auto_16545 ) ) ( OBJ-AT ?auto_16542 ?auto_16545 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16542 ?auto_16541 ?auto_16540 )
      ( DELIVER-2PKG-VERIFY ?auto_16541 ?auto_16542 ?auto_16540 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16550 - OBJ
      ?auto_16551 - OBJ
      ?auto_16549 - LOCATION
    )
    :vars
    (
      ?auto_16553 - LOCATION
      ?auto_16556 - CITY
      ?auto_16557 - OBJ
      ?auto_16552 - LOCATION
      ?auto_16555 - TRUCK
      ?auto_16554 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16553 ?auto_16556 ) ( IN-CITY ?auto_16549 ?auto_16556 ) ( not ( = ?auto_16549 ?auto_16553 ) ) ( not ( = ?auto_16557 ?auto_16550 ) ) ( OBJ-AT ?auto_16550 ?auto_16553 ) ( not ( = ?auto_16557 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16551 ) ) ( IN-CITY ?auto_16552 ?auto_16556 ) ( not ( = ?auto_16549 ?auto_16552 ) ) ( not ( = ?auto_16553 ?auto_16552 ) ) ( OBJ-AT ?auto_16551 ?auto_16552 ) ( TRUCK-AT ?auto_16555 ?auto_16554 ) ( IN-CITY ?auto_16554 ?auto_16556 ) ( not ( = ?auto_16549 ?auto_16554 ) ) ( not ( = ?auto_16553 ?auto_16554 ) ) ( not ( = ?auto_16552 ?auto_16554 ) ) ( OBJ-AT ?auto_16557 ?auto_16554 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16557 ?auto_16550 ?auto_16549 )
      ( DELIVER-2PKG-VERIFY ?auto_16550 ?auto_16551 ?auto_16549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16579 - OBJ
      ?auto_16580 - OBJ
      ?auto_16581 - OBJ
      ?auto_16578 - LOCATION
    )
    :vars
    (
      ?auto_16583 - LOCATION
      ?auto_16586 - CITY
      ?auto_16582 - LOCATION
      ?auto_16585 - TRUCK
      ?auto_16584 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16583 ?auto_16586 ) ( IN-CITY ?auto_16578 ?auto_16586 ) ( not ( = ?auto_16578 ?auto_16583 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( OBJ-AT ?auto_16581 ?auto_16583 ) ( not ( = ?auto_16579 ?auto_16580 ) ) ( not ( = ?auto_16581 ?auto_16580 ) ) ( IN-CITY ?auto_16582 ?auto_16586 ) ( not ( = ?auto_16578 ?auto_16582 ) ) ( not ( = ?auto_16583 ?auto_16582 ) ) ( OBJ-AT ?auto_16580 ?auto_16582 ) ( TRUCK-AT ?auto_16585 ?auto_16584 ) ( IN-CITY ?auto_16584 ?auto_16586 ) ( not ( = ?auto_16578 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( not ( = ?auto_16582 ?auto_16584 ) ) ( OBJ-AT ?auto_16579 ?auto_16584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16579 ?auto_16581 ?auto_16578 )
      ( DELIVER-3PKG-VERIFY ?auto_16579 ?auto_16580 ?auto_16581 ?auto_16578 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16598 - OBJ
      ?auto_16599 - OBJ
      ?auto_16600 - OBJ
      ?auto_16597 - LOCATION
    )
    :vars
    (
      ?auto_16602 - LOCATION
      ?auto_16605 - CITY
      ?auto_16601 - LOCATION
      ?auto_16604 - TRUCK
      ?auto_16603 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16602 ?auto_16605 ) ( IN-CITY ?auto_16597 ?auto_16605 ) ( not ( = ?auto_16597 ?auto_16602 ) ) ( not ( = ?auto_16598 ?auto_16599 ) ) ( OBJ-AT ?auto_16599 ?auto_16602 ) ( not ( = ?auto_16598 ?auto_16600 ) ) ( not ( = ?auto_16599 ?auto_16600 ) ) ( IN-CITY ?auto_16601 ?auto_16605 ) ( not ( = ?auto_16597 ?auto_16601 ) ) ( not ( = ?auto_16602 ?auto_16601 ) ) ( OBJ-AT ?auto_16600 ?auto_16601 ) ( TRUCK-AT ?auto_16604 ?auto_16603 ) ( IN-CITY ?auto_16603 ?auto_16605 ) ( not ( = ?auto_16597 ?auto_16603 ) ) ( not ( = ?auto_16602 ?auto_16603 ) ) ( not ( = ?auto_16601 ?auto_16603 ) ) ( OBJ-AT ?auto_16598 ?auto_16603 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16598 ?auto_16599 ?auto_16597 )
      ( DELIVER-3PKG-VERIFY ?auto_16598 ?auto_16599 ?auto_16600 ?auto_16597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16617 - OBJ
      ?auto_16618 - OBJ
      ?auto_16619 - OBJ
      ?auto_16616 - LOCATION
    )
    :vars
    (
      ?auto_16621 - LOCATION
      ?auto_16624 - CITY
      ?auto_16620 - LOCATION
      ?auto_16623 - TRUCK
      ?auto_16622 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16621 ?auto_16624 ) ( IN-CITY ?auto_16616 ?auto_16624 ) ( not ( = ?auto_16616 ?auto_16621 ) ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( OBJ-AT ?auto_16619 ?auto_16621 ) ( not ( = ?auto_16618 ?auto_16617 ) ) ( not ( = ?auto_16619 ?auto_16617 ) ) ( IN-CITY ?auto_16620 ?auto_16624 ) ( not ( = ?auto_16616 ?auto_16620 ) ) ( not ( = ?auto_16621 ?auto_16620 ) ) ( OBJ-AT ?auto_16617 ?auto_16620 ) ( TRUCK-AT ?auto_16623 ?auto_16622 ) ( IN-CITY ?auto_16622 ?auto_16624 ) ( not ( = ?auto_16616 ?auto_16622 ) ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( OBJ-AT ?auto_16618 ?auto_16622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16618 ?auto_16619 ?auto_16616 )
      ( DELIVER-3PKG-VERIFY ?auto_16617 ?auto_16618 ?auto_16619 ?auto_16616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16636 - OBJ
      ?auto_16637 - OBJ
      ?auto_16638 - OBJ
      ?auto_16635 - LOCATION
    )
    :vars
    (
      ?auto_16640 - LOCATION
      ?auto_16643 - CITY
      ?auto_16639 - LOCATION
      ?auto_16642 - TRUCK
      ?auto_16641 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16640 ?auto_16643 ) ( IN-CITY ?auto_16635 ?auto_16643 ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( not ( = ?auto_16638 ?auto_16637 ) ) ( OBJ-AT ?auto_16637 ?auto_16640 ) ( not ( = ?auto_16638 ?auto_16636 ) ) ( not ( = ?auto_16637 ?auto_16636 ) ) ( IN-CITY ?auto_16639 ?auto_16643 ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16640 ?auto_16639 ) ) ( OBJ-AT ?auto_16636 ?auto_16639 ) ( TRUCK-AT ?auto_16642 ?auto_16641 ) ( IN-CITY ?auto_16641 ?auto_16643 ) ( not ( = ?auto_16635 ?auto_16641 ) ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( not ( = ?auto_16639 ?auto_16641 ) ) ( OBJ-AT ?auto_16638 ?auto_16641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16638 ?auto_16637 ?auto_16635 )
      ( DELIVER-3PKG-VERIFY ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16675 - OBJ
      ?auto_16676 - OBJ
      ?auto_16677 - OBJ
      ?auto_16674 - LOCATION
    )
    :vars
    (
      ?auto_16679 - LOCATION
      ?auto_16682 - CITY
      ?auto_16678 - LOCATION
      ?auto_16681 - TRUCK
      ?auto_16680 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16679 ?auto_16682 ) ( IN-CITY ?auto_16674 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16679 ) ) ( not ( = ?auto_16676 ?auto_16675 ) ) ( OBJ-AT ?auto_16675 ?auto_16679 ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( not ( = ?auto_16675 ?auto_16677 ) ) ( IN-CITY ?auto_16678 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( not ( = ?auto_16679 ?auto_16678 ) ) ( OBJ-AT ?auto_16677 ?auto_16678 ) ( TRUCK-AT ?auto_16681 ?auto_16680 ) ( IN-CITY ?auto_16680 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16680 ) ) ( not ( = ?auto_16679 ?auto_16680 ) ) ( not ( = ?auto_16678 ?auto_16680 ) ) ( OBJ-AT ?auto_16676 ?auto_16680 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16676 ?auto_16675 ?auto_16674 )
      ( DELIVER-3PKG-VERIFY ?auto_16675 ?auto_16676 ?auto_16677 ?auto_16674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16694 - OBJ
      ?auto_16695 - OBJ
      ?auto_16696 - OBJ
      ?auto_16693 - LOCATION
    )
    :vars
    (
      ?auto_16698 - LOCATION
      ?auto_16701 - CITY
      ?auto_16697 - LOCATION
      ?auto_16700 - TRUCK
      ?auto_16699 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16698 ?auto_16701 ) ( IN-CITY ?auto_16693 ?auto_16701 ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( not ( = ?auto_16696 ?auto_16694 ) ) ( OBJ-AT ?auto_16694 ?auto_16698 ) ( not ( = ?auto_16696 ?auto_16695 ) ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( IN-CITY ?auto_16697 ?auto_16701 ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16698 ?auto_16697 ) ) ( OBJ-AT ?auto_16695 ?auto_16697 ) ( TRUCK-AT ?auto_16700 ?auto_16699 ) ( IN-CITY ?auto_16699 ?auto_16701 ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( OBJ-AT ?auto_16696 ?auto_16699 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16696 ?auto_16694 ?auto_16693 )
      ( DELIVER-3PKG-VERIFY ?auto_16694 ?auto_16695 ?auto_16696 ?auto_16693 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16754 - OBJ
      ?auto_16753 - LOCATION
    )
    :vars
    (
      ?auto_16756 - LOCATION
      ?auto_16760 - CITY
      ?auto_16761 - OBJ
      ?auto_16759 - OBJ
      ?auto_16755 - LOCATION
      ?auto_16757 - LOCATION
      ?auto_16758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16756 ?auto_16760 ) ( IN-CITY ?auto_16753 ?auto_16760 ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16761 ?auto_16754 ) ) ( OBJ-AT ?auto_16754 ?auto_16756 ) ( not ( = ?auto_16761 ?auto_16759 ) ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( IN-CITY ?auto_16755 ?auto_16760 ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16756 ?auto_16755 ) ) ( OBJ-AT ?auto_16759 ?auto_16755 ) ( IN-CITY ?auto_16757 ?auto_16760 ) ( not ( = ?auto_16753 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16755 ?auto_16757 ) ) ( OBJ-AT ?auto_16761 ?auto_16757 ) ( TRUCK-AT ?auto_16758 ?auto_16753 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16758 ?auto_16753 ?auto_16757 ?auto_16760 )
      ( DELIVER-2PKG ?auto_16761 ?auto_16754 ?auto_16753 )
      ( DELIVER-1PKG-VERIFY ?auto_16754 ?auto_16753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16763 - OBJ
      ?auto_16764 - OBJ
      ?auto_16762 - LOCATION
    )
    :vars
    (
      ?auto_16768 - LOCATION
      ?auto_16769 - CITY
      ?auto_16766 - OBJ
      ?auto_16767 - LOCATION
      ?auto_16770 - LOCATION
      ?auto_16765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16768 ?auto_16769 ) ( IN-CITY ?auto_16762 ?auto_16769 ) ( not ( = ?auto_16762 ?auto_16768 ) ) ( not ( = ?auto_16763 ?auto_16764 ) ) ( OBJ-AT ?auto_16764 ?auto_16768 ) ( not ( = ?auto_16763 ?auto_16766 ) ) ( not ( = ?auto_16764 ?auto_16766 ) ) ( IN-CITY ?auto_16767 ?auto_16769 ) ( not ( = ?auto_16762 ?auto_16767 ) ) ( not ( = ?auto_16768 ?auto_16767 ) ) ( OBJ-AT ?auto_16766 ?auto_16767 ) ( IN-CITY ?auto_16770 ?auto_16769 ) ( not ( = ?auto_16762 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( OBJ-AT ?auto_16763 ?auto_16770 ) ( TRUCK-AT ?auto_16765 ?auto_16762 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16764 ?auto_16762 )
      ( DELIVER-2PKG-VERIFY ?auto_16763 ?auto_16764 ?auto_16762 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16772 - OBJ
      ?auto_16773 - OBJ
      ?auto_16771 - LOCATION
    )
    :vars
    (
      ?auto_16774 - LOCATION
      ?auto_16778 - CITY
      ?auto_16779 - OBJ
      ?auto_16777 - LOCATION
      ?auto_16775 - LOCATION
      ?auto_16776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16774 ?auto_16778 ) ( IN-CITY ?auto_16771 ?auto_16778 ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( not ( = ?auto_16779 ?auto_16773 ) ) ( OBJ-AT ?auto_16773 ?auto_16774 ) ( not ( = ?auto_16779 ?auto_16772 ) ) ( not ( = ?auto_16773 ?auto_16772 ) ) ( IN-CITY ?auto_16777 ?auto_16778 ) ( not ( = ?auto_16771 ?auto_16777 ) ) ( not ( = ?auto_16774 ?auto_16777 ) ) ( OBJ-AT ?auto_16772 ?auto_16777 ) ( IN-CITY ?auto_16775 ?auto_16778 ) ( not ( = ?auto_16771 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16777 ?auto_16775 ) ) ( OBJ-AT ?auto_16779 ?auto_16775 ) ( TRUCK-AT ?auto_16776 ?auto_16771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16779 ?auto_16773 ?auto_16771 )
      ( DELIVER-2PKG-VERIFY ?auto_16772 ?auto_16773 ?auto_16771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16781 - OBJ
      ?auto_16782 - OBJ
      ?auto_16780 - LOCATION
    )
    :vars
    (
      ?auto_16783 - LOCATION
      ?auto_16787 - CITY
      ?auto_16788 - OBJ
      ?auto_16786 - LOCATION
      ?auto_16784 - LOCATION
      ?auto_16785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16783 ?auto_16787 ) ( IN-CITY ?auto_16780 ?auto_16787 ) ( not ( = ?auto_16780 ?auto_16783 ) ) ( not ( = ?auto_16782 ?auto_16781 ) ) ( OBJ-AT ?auto_16781 ?auto_16783 ) ( not ( = ?auto_16782 ?auto_16788 ) ) ( not ( = ?auto_16781 ?auto_16788 ) ) ( IN-CITY ?auto_16786 ?auto_16787 ) ( not ( = ?auto_16780 ?auto_16786 ) ) ( not ( = ?auto_16783 ?auto_16786 ) ) ( OBJ-AT ?auto_16788 ?auto_16786 ) ( IN-CITY ?auto_16784 ?auto_16787 ) ( not ( = ?auto_16780 ?auto_16784 ) ) ( not ( = ?auto_16783 ?auto_16784 ) ) ( not ( = ?auto_16786 ?auto_16784 ) ) ( OBJ-AT ?auto_16782 ?auto_16784 ) ( TRUCK-AT ?auto_16785 ?auto_16780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16782 ?auto_16781 ?auto_16780 )
      ( DELIVER-2PKG-VERIFY ?auto_16781 ?auto_16782 ?auto_16780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16790 - OBJ
      ?auto_16791 - OBJ
      ?auto_16789 - LOCATION
    )
    :vars
    (
      ?auto_16792 - LOCATION
      ?auto_16796 - CITY
      ?auto_16797 - OBJ
      ?auto_16795 - LOCATION
      ?auto_16793 - LOCATION
      ?auto_16794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16792 ?auto_16796 ) ( IN-CITY ?auto_16789 ?auto_16796 ) ( not ( = ?auto_16789 ?auto_16792 ) ) ( not ( = ?auto_16797 ?auto_16790 ) ) ( OBJ-AT ?auto_16790 ?auto_16792 ) ( not ( = ?auto_16797 ?auto_16791 ) ) ( not ( = ?auto_16790 ?auto_16791 ) ) ( IN-CITY ?auto_16795 ?auto_16796 ) ( not ( = ?auto_16789 ?auto_16795 ) ) ( not ( = ?auto_16792 ?auto_16795 ) ) ( OBJ-AT ?auto_16791 ?auto_16795 ) ( IN-CITY ?auto_16793 ?auto_16796 ) ( not ( = ?auto_16789 ?auto_16793 ) ) ( not ( = ?auto_16792 ?auto_16793 ) ) ( not ( = ?auto_16795 ?auto_16793 ) ) ( OBJ-AT ?auto_16797 ?auto_16793 ) ( TRUCK-AT ?auto_16794 ?auto_16789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16797 ?auto_16790 ?auto_16789 )
      ( DELIVER-2PKG-VERIFY ?auto_16790 ?auto_16791 ?auto_16789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16819 - OBJ
      ?auto_16820 - OBJ
      ?auto_16821 - OBJ
      ?auto_16818 - LOCATION
    )
    :vars
    (
      ?auto_16822 - LOCATION
      ?auto_16826 - CITY
      ?auto_16825 - LOCATION
      ?auto_16823 - LOCATION
      ?auto_16824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16822 ?auto_16826 ) ( IN-CITY ?auto_16818 ?auto_16826 ) ( not ( = ?auto_16818 ?auto_16822 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( OBJ-AT ?auto_16821 ?auto_16822 ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16821 ?auto_16820 ) ) ( IN-CITY ?auto_16825 ?auto_16826 ) ( not ( = ?auto_16818 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( OBJ-AT ?auto_16820 ?auto_16825 ) ( IN-CITY ?auto_16823 ?auto_16826 ) ( not ( = ?auto_16818 ?auto_16823 ) ) ( not ( = ?auto_16822 ?auto_16823 ) ) ( not ( = ?auto_16825 ?auto_16823 ) ) ( OBJ-AT ?auto_16819 ?auto_16823 ) ( TRUCK-AT ?auto_16824 ?auto_16818 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16819 ?auto_16821 ?auto_16818 )
      ( DELIVER-3PKG-VERIFY ?auto_16819 ?auto_16820 ?auto_16821 ?auto_16818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16838 - OBJ
      ?auto_16839 - OBJ
      ?auto_16840 - OBJ
      ?auto_16837 - LOCATION
    )
    :vars
    (
      ?auto_16841 - LOCATION
      ?auto_16845 - CITY
      ?auto_16844 - LOCATION
      ?auto_16842 - LOCATION
      ?auto_16843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16841 ?auto_16845 ) ( IN-CITY ?auto_16837 ?auto_16845 ) ( not ( = ?auto_16837 ?auto_16841 ) ) ( not ( = ?auto_16838 ?auto_16839 ) ) ( OBJ-AT ?auto_16839 ?auto_16841 ) ( not ( = ?auto_16838 ?auto_16840 ) ) ( not ( = ?auto_16839 ?auto_16840 ) ) ( IN-CITY ?auto_16844 ?auto_16845 ) ( not ( = ?auto_16837 ?auto_16844 ) ) ( not ( = ?auto_16841 ?auto_16844 ) ) ( OBJ-AT ?auto_16840 ?auto_16844 ) ( IN-CITY ?auto_16842 ?auto_16845 ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( not ( = ?auto_16841 ?auto_16842 ) ) ( not ( = ?auto_16844 ?auto_16842 ) ) ( OBJ-AT ?auto_16838 ?auto_16842 ) ( TRUCK-AT ?auto_16843 ?auto_16837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16838 ?auto_16839 ?auto_16837 )
      ( DELIVER-3PKG-VERIFY ?auto_16838 ?auto_16839 ?auto_16840 ?auto_16837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16857 - OBJ
      ?auto_16858 - OBJ
      ?auto_16859 - OBJ
      ?auto_16856 - LOCATION
    )
    :vars
    (
      ?auto_16860 - LOCATION
      ?auto_16864 - CITY
      ?auto_16863 - LOCATION
      ?auto_16861 - LOCATION
      ?auto_16862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16860 ?auto_16864 ) ( IN-CITY ?auto_16856 ?auto_16864 ) ( not ( = ?auto_16856 ?auto_16860 ) ) ( not ( = ?auto_16858 ?auto_16859 ) ) ( OBJ-AT ?auto_16859 ?auto_16860 ) ( not ( = ?auto_16858 ?auto_16857 ) ) ( not ( = ?auto_16859 ?auto_16857 ) ) ( IN-CITY ?auto_16863 ?auto_16864 ) ( not ( = ?auto_16856 ?auto_16863 ) ) ( not ( = ?auto_16860 ?auto_16863 ) ) ( OBJ-AT ?auto_16857 ?auto_16863 ) ( IN-CITY ?auto_16861 ?auto_16864 ) ( not ( = ?auto_16856 ?auto_16861 ) ) ( not ( = ?auto_16860 ?auto_16861 ) ) ( not ( = ?auto_16863 ?auto_16861 ) ) ( OBJ-AT ?auto_16858 ?auto_16861 ) ( TRUCK-AT ?auto_16862 ?auto_16856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16858 ?auto_16859 ?auto_16856 )
      ( DELIVER-3PKG-VERIFY ?auto_16857 ?auto_16858 ?auto_16859 ?auto_16856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16876 - OBJ
      ?auto_16877 - OBJ
      ?auto_16878 - OBJ
      ?auto_16875 - LOCATION
    )
    :vars
    (
      ?auto_16879 - LOCATION
      ?auto_16883 - CITY
      ?auto_16882 - LOCATION
      ?auto_16880 - LOCATION
      ?auto_16881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16879 ?auto_16883 ) ( IN-CITY ?auto_16875 ?auto_16883 ) ( not ( = ?auto_16875 ?auto_16879 ) ) ( not ( = ?auto_16878 ?auto_16877 ) ) ( OBJ-AT ?auto_16877 ?auto_16879 ) ( not ( = ?auto_16878 ?auto_16876 ) ) ( not ( = ?auto_16877 ?auto_16876 ) ) ( IN-CITY ?auto_16882 ?auto_16883 ) ( not ( = ?auto_16875 ?auto_16882 ) ) ( not ( = ?auto_16879 ?auto_16882 ) ) ( OBJ-AT ?auto_16876 ?auto_16882 ) ( IN-CITY ?auto_16880 ?auto_16883 ) ( not ( = ?auto_16875 ?auto_16880 ) ) ( not ( = ?auto_16879 ?auto_16880 ) ) ( not ( = ?auto_16882 ?auto_16880 ) ) ( OBJ-AT ?auto_16878 ?auto_16880 ) ( TRUCK-AT ?auto_16881 ?auto_16875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16878 ?auto_16877 ?auto_16875 )
      ( DELIVER-3PKG-VERIFY ?auto_16876 ?auto_16877 ?auto_16878 ?auto_16875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16915 - OBJ
      ?auto_16916 - OBJ
      ?auto_16917 - OBJ
      ?auto_16914 - LOCATION
    )
    :vars
    (
      ?auto_16918 - LOCATION
      ?auto_16922 - CITY
      ?auto_16921 - LOCATION
      ?auto_16919 - LOCATION
      ?auto_16920 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16918 ?auto_16922 ) ( IN-CITY ?auto_16914 ?auto_16922 ) ( not ( = ?auto_16914 ?auto_16918 ) ) ( not ( = ?auto_16916 ?auto_16915 ) ) ( OBJ-AT ?auto_16915 ?auto_16918 ) ( not ( = ?auto_16916 ?auto_16917 ) ) ( not ( = ?auto_16915 ?auto_16917 ) ) ( IN-CITY ?auto_16921 ?auto_16922 ) ( not ( = ?auto_16914 ?auto_16921 ) ) ( not ( = ?auto_16918 ?auto_16921 ) ) ( OBJ-AT ?auto_16917 ?auto_16921 ) ( IN-CITY ?auto_16919 ?auto_16922 ) ( not ( = ?auto_16914 ?auto_16919 ) ) ( not ( = ?auto_16918 ?auto_16919 ) ) ( not ( = ?auto_16921 ?auto_16919 ) ) ( OBJ-AT ?auto_16916 ?auto_16919 ) ( TRUCK-AT ?auto_16920 ?auto_16914 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16916 ?auto_16915 ?auto_16914 )
      ( DELIVER-3PKG-VERIFY ?auto_16915 ?auto_16916 ?auto_16917 ?auto_16914 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16934 - OBJ
      ?auto_16935 - OBJ
      ?auto_16936 - OBJ
      ?auto_16933 - LOCATION
    )
    :vars
    (
      ?auto_16937 - LOCATION
      ?auto_16941 - CITY
      ?auto_16940 - LOCATION
      ?auto_16938 - LOCATION
      ?auto_16939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16937 ?auto_16941 ) ( IN-CITY ?auto_16933 ?auto_16941 ) ( not ( = ?auto_16933 ?auto_16937 ) ) ( not ( = ?auto_16936 ?auto_16934 ) ) ( OBJ-AT ?auto_16934 ?auto_16937 ) ( not ( = ?auto_16936 ?auto_16935 ) ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( IN-CITY ?auto_16940 ?auto_16941 ) ( not ( = ?auto_16933 ?auto_16940 ) ) ( not ( = ?auto_16937 ?auto_16940 ) ) ( OBJ-AT ?auto_16935 ?auto_16940 ) ( IN-CITY ?auto_16938 ?auto_16941 ) ( not ( = ?auto_16933 ?auto_16938 ) ) ( not ( = ?auto_16937 ?auto_16938 ) ) ( not ( = ?auto_16940 ?auto_16938 ) ) ( OBJ-AT ?auto_16936 ?auto_16938 ) ( TRUCK-AT ?auto_16939 ?auto_16933 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16936 ?auto_16934 ?auto_16933 )
      ( DELIVER-3PKG-VERIFY ?auto_16934 ?auto_16935 ?auto_16936 ?auto_16933 ) )
  )

)

