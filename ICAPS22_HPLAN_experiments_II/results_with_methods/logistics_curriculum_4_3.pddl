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
      ?auto_10740 - OBJ
      ?auto_10739 - LOCATION
    )
    :vars
    (
      ?auto_10742 - LOCATION
      ?auto_10743 - CITY
      ?auto_10741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10742 ?auto_10743 ) ( IN-CITY ?auto_10739 ?auto_10743 ) ( not ( = ?auto_10739 ?auto_10742 ) ) ( OBJ-AT ?auto_10740 ?auto_10742 ) ( TRUCK-AT ?auto_10741 ?auto_10739 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10741 ?auto_10739 ?auto_10742 ?auto_10743 )
      ( !LOAD-TRUCK ?auto_10740 ?auto_10741 ?auto_10742 )
      ( !DRIVE-TRUCK ?auto_10741 ?auto_10742 ?auto_10739 ?auto_10743 )
      ( !UNLOAD-TRUCK ?auto_10740 ?auto_10741 ?auto_10739 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10747 - OBJ
      ?auto_10746 - LOCATION
    )
    :vars
    (
      ?auto_10749 - LOCATION
      ?auto_10750 - CITY
      ?auto_10748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10749 ?auto_10750 ) ( IN-CITY ?auto_10746 ?auto_10750 ) ( not ( = ?auto_10746 ?auto_10749 ) ) ( OBJ-AT ?auto_10747 ?auto_10749 ) ( TRUCK-AT ?auto_10748 ?auto_10746 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10748 ?auto_10746 ?auto_10749 ?auto_10750 )
      ( !LOAD-TRUCK ?auto_10747 ?auto_10748 ?auto_10749 )
      ( !DRIVE-TRUCK ?auto_10748 ?auto_10749 ?auto_10746 ?auto_10750 )
      ( !UNLOAD-TRUCK ?auto_10747 ?auto_10748 ?auto_10746 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10761 - OBJ
      ?auto_10762 - OBJ
      ?auto_10760 - LOCATION
    )
    :vars
    (
      ?auto_10763 - LOCATION
      ?auto_10765 - CITY
      ?auto_10764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10763 ?auto_10765 ) ( IN-CITY ?auto_10760 ?auto_10765 ) ( not ( = ?auto_10760 ?auto_10763 ) ) ( OBJ-AT ?auto_10762 ?auto_10763 ) ( OBJ-AT ?auto_10761 ?auto_10763 ) ( TRUCK-AT ?auto_10764 ?auto_10760 ) ( not ( = ?auto_10761 ?auto_10762 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10761 ?auto_10760 )
      ( DELIVER-1PKG ?auto_10762 ?auto_10760 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10767 - OBJ
      ?auto_10768 - OBJ
      ?auto_10766 - LOCATION
    )
    :vars
    (
      ?auto_10769 - LOCATION
      ?auto_10770 - CITY
      ?auto_10771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10769 ?auto_10770 ) ( IN-CITY ?auto_10766 ?auto_10770 ) ( not ( = ?auto_10766 ?auto_10769 ) ) ( OBJ-AT ?auto_10767 ?auto_10769 ) ( OBJ-AT ?auto_10768 ?auto_10769 ) ( TRUCK-AT ?auto_10771 ?auto_10766 ) ( not ( = ?auto_10768 ?auto_10767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10768 ?auto_10767 ?auto_10766 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10782 - OBJ
      ?auto_10781 - LOCATION
    )
    :vars
    (
      ?auto_10784 - LOCATION
      ?auto_10785 - CITY
      ?auto_10783 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10784 ?auto_10785 ) ( IN-CITY ?auto_10781 ?auto_10785 ) ( not ( = ?auto_10781 ?auto_10784 ) ) ( OBJ-AT ?auto_10782 ?auto_10784 ) ( TRUCK-AT ?auto_10783 ?auto_10781 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10783 ?auto_10781 ?auto_10784 ?auto_10785 )
      ( !LOAD-TRUCK ?auto_10782 ?auto_10783 ?auto_10784 )
      ( !DRIVE-TRUCK ?auto_10783 ?auto_10784 ?auto_10781 ?auto_10785 )
      ( !UNLOAD-TRUCK ?auto_10782 ?auto_10783 ?auto_10781 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10871 - OBJ
      ?auto_10872 - OBJ
      ?auto_10873 - OBJ
      ?auto_10870 - LOCATION
    )
    :vars
    (
      ?auto_10876 - LOCATION
      ?auto_10875 - CITY
      ?auto_10874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10876 ?auto_10875 ) ( IN-CITY ?auto_10870 ?auto_10875 ) ( not ( = ?auto_10870 ?auto_10876 ) ) ( OBJ-AT ?auto_10873 ?auto_10876 ) ( OBJ-AT ?auto_10872 ?auto_10876 ) ( OBJ-AT ?auto_10871 ?auto_10876 ) ( TRUCK-AT ?auto_10874 ?auto_10870 ) ( not ( = ?auto_10871 ?auto_10872 ) ) ( not ( = ?auto_10871 ?auto_10873 ) ) ( not ( = ?auto_10872 ?auto_10873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10872 ?auto_10871 ?auto_10870 )
      ( DELIVER-1PKG ?auto_10873 ?auto_10870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10886 - OBJ
      ?auto_10887 - OBJ
      ?auto_10888 - OBJ
      ?auto_10885 - LOCATION
    )
    :vars
    (
      ?auto_10891 - LOCATION
      ?auto_10890 - CITY
      ?auto_10889 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10891 ?auto_10890 ) ( IN-CITY ?auto_10885 ?auto_10890 ) ( not ( = ?auto_10885 ?auto_10891 ) ) ( OBJ-AT ?auto_10887 ?auto_10891 ) ( OBJ-AT ?auto_10888 ?auto_10891 ) ( OBJ-AT ?auto_10886 ?auto_10891 ) ( TRUCK-AT ?auto_10889 ?auto_10885 ) ( not ( = ?auto_10886 ?auto_10888 ) ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( not ( = ?auto_10888 ?auto_10887 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10886 ?auto_10888 ?auto_10887 ?auto_10885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10901 - OBJ
      ?auto_10902 - OBJ
      ?auto_10903 - OBJ
      ?auto_10900 - LOCATION
    )
    :vars
    (
      ?auto_10905 - LOCATION
      ?auto_10906 - CITY
      ?auto_10904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10905 ?auto_10906 ) ( IN-CITY ?auto_10900 ?auto_10906 ) ( not ( = ?auto_10900 ?auto_10905 ) ) ( OBJ-AT ?auto_10903 ?auto_10905 ) ( OBJ-AT ?auto_10901 ?auto_10905 ) ( OBJ-AT ?auto_10902 ?auto_10905 ) ( TRUCK-AT ?auto_10904 ?auto_10900 ) ( not ( = ?auto_10902 ?auto_10901 ) ) ( not ( = ?auto_10902 ?auto_10903 ) ) ( not ( = ?auto_10901 ?auto_10903 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10902 ?auto_10903 ?auto_10901 ?auto_10900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10916 - OBJ
      ?auto_10917 - OBJ
      ?auto_10918 - OBJ
      ?auto_10915 - LOCATION
    )
    :vars
    (
      ?auto_10920 - LOCATION
      ?auto_10921 - CITY
      ?auto_10919 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10920 ?auto_10921 ) ( IN-CITY ?auto_10915 ?auto_10921 ) ( not ( = ?auto_10915 ?auto_10920 ) ) ( OBJ-AT ?auto_10917 ?auto_10920 ) ( OBJ-AT ?auto_10916 ?auto_10920 ) ( OBJ-AT ?auto_10918 ?auto_10920 ) ( TRUCK-AT ?auto_10919 ?auto_10915 ) ( not ( = ?auto_10918 ?auto_10916 ) ) ( not ( = ?auto_10918 ?auto_10917 ) ) ( not ( = ?auto_10916 ?auto_10917 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10918 ?auto_10917 ?auto_10916 ?auto_10915 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10947 - OBJ
      ?auto_10948 - OBJ
      ?auto_10949 - OBJ
      ?auto_10946 - LOCATION
    )
    :vars
    (
      ?auto_10951 - LOCATION
      ?auto_10952 - CITY
      ?auto_10950 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10951 ?auto_10952 ) ( IN-CITY ?auto_10946 ?auto_10952 ) ( not ( = ?auto_10946 ?auto_10951 ) ) ( OBJ-AT ?auto_10947 ?auto_10951 ) ( OBJ-AT ?auto_10949 ?auto_10951 ) ( OBJ-AT ?auto_10948 ?auto_10951 ) ( TRUCK-AT ?auto_10950 ?auto_10946 ) ( not ( = ?auto_10948 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10947 ) ) ( not ( = ?auto_10949 ?auto_10947 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10948 ?auto_10947 ?auto_10949 ?auto_10946 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10962 - OBJ
      ?auto_10963 - OBJ
      ?auto_10964 - OBJ
      ?auto_10961 - LOCATION
    )
    :vars
    (
      ?auto_10966 - LOCATION
      ?auto_10967 - CITY
      ?auto_10965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10966 ?auto_10967 ) ( IN-CITY ?auto_10961 ?auto_10967 ) ( not ( = ?auto_10961 ?auto_10966 ) ) ( OBJ-AT ?auto_10962 ?auto_10966 ) ( OBJ-AT ?auto_10963 ?auto_10966 ) ( OBJ-AT ?auto_10964 ?auto_10966 ) ( TRUCK-AT ?auto_10965 ?auto_10961 ) ( not ( = ?auto_10964 ?auto_10963 ) ) ( not ( = ?auto_10964 ?auto_10962 ) ) ( not ( = ?auto_10963 ?auto_10962 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10964 ?auto_10962 ?auto_10963 ?auto_10961 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11012 - OBJ
      ?auto_11011 - LOCATION
    )
    :vars
    (
      ?auto_11014 - LOCATION
      ?auto_11015 - CITY
      ?auto_11013 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11014 ?auto_11015 ) ( IN-CITY ?auto_11011 ?auto_11015 ) ( not ( = ?auto_11011 ?auto_11014 ) ) ( OBJ-AT ?auto_11012 ?auto_11014 ) ( TRUCK-AT ?auto_11013 ?auto_11011 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11013 ?auto_11011 ?auto_11014 ?auto_11015 )
      ( !LOAD-TRUCK ?auto_11012 ?auto_11013 ?auto_11014 )
      ( !DRIVE-TRUCK ?auto_11013 ?auto_11014 ?auto_11011 ?auto_11015 )
      ( !UNLOAD-TRUCK ?auto_11012 ?auto_11013 ?auto_11011 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11985 - OBJ
      ?auto_11986 - OBJ
      ?auto_11987 - OBJ
      ?auto_11988 - OBJ
      ?auto_11984 - LOCATION
    )
    :vars
    (
      ?auto_11989 - LOCATION
      ?auto_11991 - CITY
      ?auto_11992 - LOCATION
      ?auto_11990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11989 ?auto_11991 ) ( IN-CITY ?auto_11984 ?auto_11991 ) ( not ( = ?auto_11984 ?auto_11989 ) ) ( OBJ-AT ?auto_11988 ?auto_11989 ) ( IN-CITY ?auto_11992 ?auto_11991 ) ( not ( = ?auto_11984 ?auto_11992 ) ) ( OBJ-AT ?auto_11987 ?auto_11992 ) ( OBJ-AT ?auto_11986 ?auto_11992 ) ( OBJ-AT ?auto_11985 ?auto_11992 ) ( TRUCK-AT ?auto_11990 ?auto_11984 ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( not ( = ?auto_11985 ?auto_11987 ) ) ( not ( = ?auto_11986 ?auto_11987 ) ) ( not ( = ?auto_11985 ?auto_11988 ) ) ( not ( = ?auto_11986 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11988 ) ) ( not ( = ?auto_11989 ?auto_11992 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11985 ?auto_11987 ?auto_11986 ?auto_11984 )
      ( DELIVER-1PKG ?auto_11988 ?auto_11984 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12014 - OBJ
      ?auto_12015 - OBJ
      ?auto_12016 - OBJ
      ?auto_12017 - OBJ
      ?auto_12013 - LOCATION
    )
    :vars
    (
      ?auto_12021 - LOCATION
      ?auto_12020 - CITY
      ?auto_12019 - LOCATION
      ?auto_12018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12021 ?auto_12020 ) ( IN-CITY ?auto_12013 ?auto_12020 ) ( not ( = ?auto_12013 ?auto_12021 ) ) ( OBJ-AT ?auto_12016 ?auto_12021 ) ( IN-CITY ?auto_12019 ?auto_12020 ) ( not ( = ?auto_12013 ?auto_12019 ) ) ( OBJ-AT ?auto_12017 ?auto_12019 ) ( OBJ-AT ?auto_12015 ?auto_12019 ) ( OBJ-AT ?auto_12014 ?auto_12019 ) ( TRUCK-AT ?auto_12018 ?auto_12013 ) ( not ( = ?auto_12014 ?auto_12015 ) ) ( not ( = ?auto_12014 ?auto_12017 ) ) ( not ( = ?auto_12015 ?auto_12017 ) ) ( not ( = ?auto_12014 ?auto_12016 ) ) ( not ( = ?auto_12015 ?auto_12016 ) ) ( not ( = ?auto_12017 ?auto_12016 ) ) ( not ( = ?auto_12021 ?auto_12019 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12014 ?auto_12015 ?auto_12017 ?auto_12016 ?auto_12013 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12043 - OBJ
      ?auto_12044 - OBJ
      ?auto_12045 - OBJ
      ?auto_12046 - OBJ
      ?auto_12042 - LOCATION
    )
    :vars
    (
      ?auto_12049 - LOCATION
      ?auto_12048 - CITY
      ?auto_12047 - LOCATION
      ?auto_12050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12049 ?auto_12048 ) ( IN-CITY ?auto_12042 ?auto_12048 ) ( not ( = ?auto_12042 ?auto_12049 ) ) ( OBJ-AT ?auto_12046 ?auto_12049 ) ( IN-CITY ?auto_12047 ?auto_12048 ) ( not ( = ?auto_12042 ?auto_12047 ) ) ( OBJ-AT ?auto_12044 ?auto_12047 ) ( OBJ-AT ?auto_12045 ?auto_12047 ) ( OBJ-AT ?auto_12043 ?auto_12047 ) ( TRUCK-AT ?auto_12050 ?auto_12042 ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12044 ) ) ( not ( = ?auto_12045 ?auto_12044 ) ) ( not ( = ?auto_12043 ?auto_12046 ) ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12044 ?auto_12046 ) ) ( not ( = ?auto_12049 ?auto_12047 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12043 ?auto_12045 ?auto_12046 ?auto_12044 ?auto_12042 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12072 - OBJ
      ?auto_12073 - OBJ
      ?auto_12074 - OBJ
      ?auto_12075 - OBJ
      ?auto_12071 - LOCATION
    )
    :vars
    (
      ?auto_12078 - LOCATION
      ?auto_12077 - CITY
      ?auto_12076 - LOCATION
      ?auto_12079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12078 ?auto_12077 ) ( IN-CITY ?auto_12071 ?auto_12077 ) ( not ( = ?auto_12071 ?auto_12078 ) ) ( OBJ-AT ?auto_12074 ?auto_12078 ) ( IN-CITY ?auto_12076 ?auto_12077 ) ( not ( = ?auto_12071 ?auto_12076 ) ) ( OBJ-AT ?auto_12073 ?auto_12076 ) ( OBJ-AT ?auto_12075 ?auto_12076 ) ( OBJ-AT ?auto_12072 ?auto_12076 ) ( TRUCK-AT ?auto_12079 ?auto_12071 ) ( not ( = ?auto_12072 ?auto_12075 ) ) ( not ( = ?auto_12072 ?auto_12073 ) ) ( not ( = ?auto_12075 ?auto_12073 ) ) ( not ( = ?auto_12072 ?auto_12074 ) ) ( not ( = ?auto_12075 ?auto_12074 ) ) ( not ( = ?auto_12073 ?auto_12074 ) ) ( not ( = ?auto_12078 ?auto_12076 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12072 ?auto_12075 ?auto_12074 ?auto_12073 ?auto_12071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12163 - OBJ
      ?auto_12164 - OBJ
      ?auto_12165 - OBJ
      ?auto_12166 - OBJ
      ?auto_12162 - LOCATION
    )
    :vars
    (
      ?auto_12169 - LOCATION
      ?auto_12168 - CITY
      ?auto_12167 - LOCATION
      ?auto_12170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12169 ?auto_12168 ) ( IN-CITY ?auto_12162 ?auto_12168 ) ( not ( = ?auto_12162 ?auto_12169 ) ) ( OBJ-AT ?auto_12164 ?auto_12169 ) ( IN-CITY ?auto_12167 ?auto_12168 ) ( not ( = ?auto_12162 ?auto_12167 ) ) ( OBJ-AT ?auto_12166 ?auto_12167 ) ( OBJ-AT ?auto_12165 ?auto_12167 ) ( OBJ-AT ?auto_12163 ?auto_12167 ) ( TRUCK-AT ?auto_12170 ?auto_12162 ) ( not ( = ?auto_12163 ?auto_12165 ) ) ( not ( = ?auto_12163 ?auto_12166 ) ) ( not ( = ?auto_12165 ?auto_12166 ) ) ( not ( = ?auto_12163 ?auto_12164 ) ) ( not ( = ?auto_12165 ?auto_12164 ) ) ( not ( = ?auto_12166 ?auto_12164 ) ) ( not ( = ?auto_12169 ?auto_12167 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12163 ?auto_12165 ?auto_12164 ?auto_12166 ?auto_12162 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12192 - OBJ
      ?auto_12193 - OBJ
      ?auto_12194 - OBJ
      ?auto_12195 - OBJ
      ?auto_12191 - LOCATION
    )
    :vars
    (
      ?auto_12198 - LOCATION
      ?auto_12197 - CITY
      ?auto_12196 - LOCATION
      ?auto_12199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12198 ?auto_12197 ) ( IN-CITY ?auto_12191 ?auto_12197 ) ( not ( = ?auto_12191 ?auto_12198 ) ) ( OBJ-AT ?auto_12193 ?auto_12198 ) ( IN-CITY ?auto_12196 ?auto_12197 ) ( not ( = ?auto_12191 ?auto_12196 ) ) ( OBJ-AT ?auto_12194 ?auto_12196 ) ( OBJ-AT ?auto_12195 ?auto_12196 ) ( OBJ-AT ?auto_12192 ?auto_12196 ) ( TRUCK-AT ?auto_12199 ?auto_12191 ) ( not ( = ?auto_12192 ?auto_12195 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( not ( = ?auto_12195 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( not ( = ?auto_12195 ?auto_12193 ) ) ( not ( = ?auto_12194 ?auto_12193 ) ) ( not ( = ?auto_12198 ?auto_12196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12192 ?auto_12195 ?auto_12193 ?auto_12194 ?auto_12191 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12283 - OBJ
      ?auto_12284 - OBJ
      ?auto_12285 - OBJ
      ?auto_12286 - OBJ
      ?auto_12282 - LOCATION
    )
    :vars
    (
      ?auto_12289 - LOCATION
      ?auto_12288 - CITY
      ?auto_12287 - LOCATION
      ?auto_12290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12289 ?auto_12288 ) ( IN-CITY ?auto_12282 ?auto_12288 ) ( not ( = ?auto_12282 ?auto_12289 ) ) ( OBJ-AT ?auto_12286 ?auto_12289 ) ( IN-CITY ?auto_12287 ?auto_12288 ) ( not ( = ?auto_12282 ?auto_12287 ) ) ( OBJ-AT ?auto_12285 ?auto_12287 ) ( OBJ-AT ?auto_12283 ?auto_12287 ) ( OBJ-AT ?auto_12284 ?auto_12287 ) ( TRUCK-AT ?auto_12290 ?auto_12282 ) ( not ( = ?auto_12284 ?auto_12283 ) ) ( not ( = ?auto_12284 ?auto_12285 ) ) ( not ( = ?auto_12283 ?auto_12285 ) ) ( not ( = ?auto_12284 ?auto_12286 ) ) ( not ( = ?auto_12283 ?auto_12286 ) ) ( not ( = ?auto_12285 ?auto_12286 ) ) ( not ( = ?auto_12289 ?auto_12287 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12284 ?auto_12283 ?auto_12286 ?auto_12285 ?auto_12282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12312 - OBJ
      ?auto_12313 - OBJ
      ?auto_12314 - OBJ
      ?auto_12315 - OBJ
      ?auto_12311 - LOCATION
    )
    :vars
    (
      ?auto_12318 - LOCATION
      ?auto_12317 - CITY
      ?auto_12316 - LOCATION
      ?auto_12319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12318 ?auto_12317 ) ( IN-CITY ?auto_12311 ?auto_12317 ) ( not ( = ?auto_12311 ?auto_12318 ) ) ( OBJ-AT ?auto_12314 ?auto_12318 ) ( IN-CITY ?auto_12316 ?auto_12317 ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( OBJ-AT ?auto_12315 ?auto_12316 ) ( OBJ-AT ?auto_12312 ?auto_12316 ) ( OBJ-AT ?auto_12313 ?auto_12316 ) ( TRUCK-AT ?auto_12319 ?auto_12311 ) ( not ( = ?auto_12313 ?auto_12312 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12312 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( not ( = ?auto_12312 ?auto_12314 ) ) ( not ( = ?auto_12315 ?auto_12314 ) ) ( not ( = ?auto_12318 ?auto_12316 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12313 ?auto_12312 ?auto_12314 ?auto_12315 ?auto_12311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12404 - OBJ
      ?auto_12405 - OBJ
      ?auto_12406 - OBJ
      ?auto_12407 - OBJ
      ?auto_12403 - LOCATION
    )
    :vars
    (
      ?auto_12410 - LOCATION
      ?auto_12409 - CITY
      ?auto_12408 - LOCATION
      ?auto_12411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12410 ?auto_12409 ) ( IN-CITY ?auto_12403 ?auto_12409 ) ( not ( = ?auto_12403 ?auto_12410 ) ) ( OBJ-AT ?auto_12407 ?auto_12410 ) ( IN-CITY ?auto_12408 ?auto_12409 ) ( not ( = ?auto_12403 ?auto_12408 ) ) ( OBJ-AT ?auto_12405 ?auto_12408 ) ( OBJ-AT ?auto_12404 ?auto_12408 ) ( OBJ-AT ?auto_12406 ?auto_12408 ) ( TRUCK-AT ?auto_12411 ?auto_12403 ) ( not ( = ?auto_12406 ?auto_12404 ) ) ( not ( = ?auto_12406 ?auto_12405 ) ) ( not ( = ?auto_12404 ?auto_12405 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( not ( = ?auto_12404 ?auto_12407 ) ) ( not ( = ?auto_12405 ?auto_12407 ) ) ( not ( = ?auto_12410 ?auto_12408 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12406 ?auto_12404 ?auto_12407 ?auto_12405 ?auto_12403 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12433 - OBJ
      ?auto_12434 - OBJ
      ?auto_12435 - OBJ
      ?auto_12436 - OBJ
      ?auto_12432 - LOCATION
    )
    :vars
    (
      ?auto_12439 - LOCATION
      ?auto_12438 - CITY
      ?auto_12437 - LOCATION
      ?auto_12440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12439 ?auto_12438 ) ( IN-CITY ?auto_12432 ?auto_12438 ) ( not ( = ?auto_12432 ?auto_12439 ) ) ( OBJ-AT ?auto_12435 ?auto_12439 ) ( IN-CITY ?auto_12437 ?auto_12438 ) ( not ( = ?auto_12432 ?auto_12437 ) ) ( OBJ-AT ?auto_12434 ?auto_12437 ) ( OBJ-AT ?auto_12433 ?auto_12437 ) ( OBJ-AT ?auto_12436 ?auto_12437 ) ( TRUCK-AT ?auto_12440 ?auto_12432 ) ( not ( = ?auto_12436 ?auto_12433 ) ) ( not ( = ?auto_12436 ?auto_12434 ) ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( not ( = ?auto_12436 ?auto_12435 ) ) ( not ( = ?auto_12433 ?auto_12435 ) ) ( not ( = ?auto_12434 ?auto_12435 ) ) ( not ( = ?auto_12439 ?auto_12437 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12436 ?auto_12433 ?auto_12435 ?auto_12434 ?auto_12432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12492 - OBJ
      ?auto_12493 - OBJ
      ?auto_12494 - OBJ
      ?auto_12495 - OBJ
      ?auto_12491 - LOCATION
    )
    :vars
    (
      ?auto_12498 - LOCATION
      ?auto_12497 - CITY
      ?auto_12496 - LOCATION
      ?auto_12499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12498 ?auto_12497 ) ( IN-CITY ?auto_12491 ?auto_12497 ) ( not ( = ?auto_12491 ?auto_12498 ) ) ( OBJ-AT ?auto_12493 ?auto_12498 ) ( IN-CITY ?auto_12496 ?auto_12497 ) ( not ( = ?auto_12491 ?auto_12496 ) ) ( OBJ-AT ?auto_12495 ?auto_12496 ) ( OBJ-AT ?auto_12492 ?auto_12496 ) ( OBJ-AT ?auto_12494 ?auto_12496 ) ( TRUCK-AT ?auto_12499 ?auto_12491 ) ( not ( = ?auto_12494 ?auto_12492 ) ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( not ( = ?auto_12492 ?auto_12495 ) ) ( not ( = ?auto_12494 ?auto_12493 ) ) ( not ( = ?auto_12492 ?auto_12493 ) ) ( not ( = ?auto_12495 ?auto_12493 ) ) ( not ( = ?auto_12498 ?auto_12496 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12494 ?auto_12492 ?auto_12493 ?auto_12495 ?auto_12491 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12553 - OBJ
      ?auto_12554 - OBJ
      ?auto_12555 - OBJ
      ?auto_12556 - OBJ
      ?auto_12552 - LOCATION
    )
    :vars
    (
      ?auto_12559 - LOCATION
      ?auto_12558 - CITY
      ?auto_12557 - LOCATION
      ?auto_12560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12559 ?auto_12558 ) ( IN-CITY ?auto_12552 ?auto_12558 ) ( not ( = ?auto_12552 ?auto_12559 ) ) ( OBJ-AT ?auto_12554 ?auto_12559 ) ( IN-CITY ?auto_12557 ?auto_12558 ) ( not ( = ?auto_12552 ?auto_12557 ) ) ( OBJ-AT ?auto_12555 ?auto_12557 ) ( OBJ-AT ?auto_12553 ?auto_12557 ) ( OBJ-AT ?auto_12556 ?auto_12557 ) ( TRUCK-AT ?auto_12560 ?auto_12552 ) ( not ( = ?auto_12556 ?auto_12553 ) ) ( not ( = ?auto_12556 ?auto_12555 ) ) ( not ( = ?auto_12553 ?auto_12555 ) ) ( not ( = ?auto_12556 ?auto_12554 ) ) ( not ( = ?auto_12553 ?auto_12554 ) ) ( not ( = ?auto_12555 ?auto_12554 ) ) ( not ( = ?auto_12559 ?auto_12557 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12556 ?auto_12553 ?auto_12554 ?auto_12555 ?auto_12552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12644 - OBJ
      ?auto_12645 - OBJ
      ?auto_12646 - OBJ
      ?auto_12647 - OBJ
      ?auto_12643 - LOCATION
    )
    :vars
    (
      ?auto_12650 - LOCATION
      ?auto_12649 - CITY
      ?auto_12648 - LOCATION
      ?auto_12651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12650 ?auto_12649 ) ( IN-CITY ?auto_12643 ?auto_12649 ) ( not ( = ?auto_12643 ?auto_12650 ) ) ( OBJ-AT ?auto_12647 ?auto_12650 ) ( IN-CITY ?auto_12648 ?auto_12649 ) ( not ( = ?auto_12643 ?auto_12648 ) ) ( OBJ-AT ?auto_12644 ?auto_12648 ) ( OBJ-AT ?auto_12646 ?auto_12648 ) ( OBJ-AT ?auto_12645 ?auto_12648 ) ( TRUCK-AT ?auto_12651 ?auto_12643 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12644 ) ) ( not ( = ?auto_12646 ?auto_12644 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( not ( = ?auto_12650 ?auto_12648 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12644 ?auto_12643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12673 - OBJ
      ?auto_12674 - OBJ
      ?auto_12675 - OBJ
      ?auto_12676 - OBJ
      ?auto_12672 - LOCATION
    )
    :vars
    (
      ?auto_12679 - LOCATION
      ?auto_12678 - CITY
      ?auto_12677 - LOCATION
      ?auto_12680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12679 ?auto_12678 ) ( IN-CITY ?auto_12672 ?auto_12678 ) ( not ( = ?auto_12672 ?auto_12679 ) ) ( OBJ-AT ?auto_12675 ?auto_12679 ) ( IN-CITY ?auto_12677 ?auto_12678 ) ( not ( = ?auto_12672 ?auto_12677 ) ) ( OBJ-AT ?auto_12673 ?auto_12677 ) ( OBJ-AT ?auto_12676 ?auto_12677 ) ( OBJ-AT ?auto_12674 ?auto_12677 ) ( TRUCK-AT ?auto_12680 ?auto_12672 ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12673 ) ) ( not ( = ?auto_12676 ?auto_12673 ) ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12676 ?auto_12675 ) ) ( not ( = ?auto_12673 ?auto_12675 ) ) ( not ( = ?auto_12679 ?auto_12677 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12674 ?auto_12676 ?auto_12675 ?auto_12673 ?auto_12672 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12702 - OBJ
      ?auto_12703 - OBJ
      ?auto_12704 - OBJ
      ?auto_12705 - OBJ
      ?auto_12701 - LOCATION
    )
    :vars
    (
      ?auto_12708 - LOCATION
      ?auto_12707 - CITY
      ?auto_12706 - LOCATION
      ?auto_12709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12708 ?auto_12707 ) ( IN-CITY ?auto_12701 ?auto_12707 ) ( not ( = ?auto_12701 ?auto_12708 ) ) ( OBJ-AT ?auto_12705 ?auto_12708 ) ( IN-CITY ?auto_12706 ?auto_12707 ) ( not ( = ?auto_12701 ?auto_12706 ) ) ( OBJ-AT ?auto_12702 ?auto_12706 ) ( OBJ-AT ?auto_12703 ?auto_12706 ) ( OBJ-AT ?auto_12704 ?auto_12706 ) ( TRUCK-AT ?auto_12709 ?auto_12701 ) ( not ( = ?auto_12704 ?auto_12703 ) ) ( not ( = ?auto_12704 ?auto_12702 ) ) ( not ( = ?auto_12703 ?auto_12702 ) ) ( not ( = ?auto_12704 ?auto_12705 ) ) ( not ( = ?auto_12703 ?auto_12705 ) ) ( not ( = ?auto_12702 ?auto_12705 ) ) ( not ( = ?auto_12708 ?auto_12706 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12704 ?auto_12703 ?auto_12705 ?auto_12702 ?auto_12701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12731 - OBJ
      ?auto_12732 - OBJ
      ?auto_12733 - OBJ
      ?auto_12734 - OBJ
      ?auto_12730 - LOCATION
    )
    :vars
    (
      ?auto_12737 - LOCATION
      ?auto_12736 - CITY
      ?auto_12735 - LOCATION
      ?auto_12738 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12737 ?auto_12736 ) ( IN-CITY ?auto_12730 ?auto_12736 ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( OBJ-AT ?auto_12733 ?auto_12737 ) ( IN-CITY ?auto_12735 ?auto_12736 ) ( not ( = ?auto_12730 ?auto_12735 ) ) ( OBJ-AT ?auto_12731 ?auto_12735 ) ( OBJ-AT ?auto_12732 ?auto_12735 ) ( OBJ-AT ?auto_12734 ?auto_12735 ) ( TRUCK-AT ?auto_12738 ?auto_12730 ) ( not ( = ?auto_12734 ?auto_12732 ) ) ( not ( = ?auto_12734 ?auto_12731 ) ) ( not ( = ?auto_12732 ?auto_12731 ) ) ( not ( = ?auto_12734 ?auto_12733 ) ) ( not ( = ?auto_12732 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12733 ) ) ( not ( = ?auto_12737 ?auto_12735 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12734 ?auto_12732 ?auto_12733 ?auto_12731 ?auto_12730 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12853 - OBJ
      ?auto_12854 - OBJ
      ?auto_12855 - OBJ
      ?auto_12856 - OBJ
      ?auto_12852 - LOCATION
    )
    :vars
    (
      ?auto_12859 - LOCATION
      ?auto_12858 - CITY
      ?auto_12857 - LOCATION
      ?auto_12860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12859 ?auto_12858 ) ( IN-CITY ?auto_12852 ?auto_12858 ) ( not ( = ?auto_12852 ?auto_12859 ) ) ( OBJ-AT ?auto_12854 ?auto_12859 ) ( IN-CITY ?auto_12857 ?auto_12858 ) ( not ( = ?auto_12852 ?auto_12857 ) ) ( OBJ-AT ?auto_12853 ?auto_12857 ) ( OBJ-AT ?auto_12856 ?auto_12857 ) ( OBJ-AT ?auto_12855 ?auto_12857 ) ( TRUCK-AT ?auto_12860 ?auto_12852 ) ( not ( = ?auto_12855 ?auto_12856 ) ) ( not ( = ?auto_12855 ?auto_12853 ) ) ( not ( = ?auto_12856 ?auto_12853 ) ) ( not ( = ?auto_12855 ?auto_12854 ) ) ( not ( = ?auto_12856 ?auto_12854 ) ) ( not ( = ?auto_12853 ?auto_12854 ) ) ( not ( = ?auto_12859 ?auto_12857 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12855 ?auto_12856 ?auto_12854 ?auto_12853 ?auto_12852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12882 - OBJ
      ?auto_12883 - OBJ
      ?auto_12884 - OBJ
      ?auto_12885 - OBJ
      ?auto_12881 - LOCATION
    )
    :vars
    (
      ?auto_12888 - LOCATION
      ?auto_12887 - CITY
      ?auto_12886 - LOCATION
      ?auto_12889 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12888 ?auto_12887 ) ( IN-CITY ?auto_12881 ?auto_12887 ) ( not ( = ?auto_12881 ?auto_12888 ) ) ( OBJ-AT ?auto_12883 ?auto_12888 ) ( IN-CITY ?auto_12886 ?auto_12887 ) ( not ( = ?auto_12881 ?auto_12886 ) ) ( OBJ-AT ?auto_12882 ?auto_12886 ) ( OBJ-AT ?auto_12884 ?auto_12886 ) ( OBJ-AT ?auto_12885 ?auto_12886 ) ( TRUCK-AT ?auto_12889 ?auto_12881 ) ( not ( = ?auto_12885 ?auto_12884 ) ) ( not ( = ?auto_12885 ?auto_12882 ) ) ( not ( = ?auto_12884 ?auto_12882 ) ) ( not ( = ?auto_12885 ?auto_12883 ) ) ( not ( = ?auto_12884 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12888 ?auto_12886 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12885 ?auto_12884 ?auto_12883 ?auto_12882 ?auto_12881 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13067 - OBJ
      ?auto_13068 - OBJ
      ?auto_13069 - OBJ
      ?auto_13070 - OBJ
      ?auto_13066 - LOCATION
    )
    :vars
    (
      ?auto_13073 - LOCATION
      ?auto_13072 - CITY
      ?auto_13071 - LOCATION
      ?auto_13074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13073 ?auto_13072 ) ( IN-CITY ?auto_13066 ?auto_13072 ) ( not ( = ?auto_13066 ?auto_13073 ) ) ( OBJ-AT ?auto_13067 ?auto_13073 ) ( IN-CITY ?auto_13071 ?auto_13072 ) ( not ( = ?auto_13066 ?auto_13071 ) ) ( OBJ-AT ?auto_13070 ?auto_13071 ) ( OBJ-AT ?auto_13069 ?auto_13071 ) ( OBJ-AT ?auto_13068 ?auto_13071 ) ( TRUCK-AT ?auto_13074 ?auto_13066 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13067 ) ) ( not ( = ?auto_13069 ?auto_13067 ) ) ( not ( = ?auto_13070 ?auto_13067 ) ) ( not ( = ?auto_13073 ?auto_13071 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13068 ?auto_13069 ?auto_13067 ?auto_13070 ?auto_13066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13096 - OBJ
      ?auto_13097 - OBJ
      ?auto_13098 - OBJ
      ?auto_13099 - OBJ
      ?auto_13095 - LOCATION
    )
    :vars
    (
      ?auto_13102 - LOCATION
      ?auto_13101 - CITY
      ?auto_13100 - LOCATION
      ?auto_13103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13102 ?auto_13101 ) ( IN-CITY ?auto_13095 ?auto_13101 ) ( not ( = ?auto_13095 ?auto_13102 ) ) ( OBJ-AT ?auto_13096 ?auto_13102 ) ( IN-CITY ?auto_13100 ?auto_13101 ) ( not ( = ?auto_13095 ?auto_13100 ) ) ( OBJ-AT ?auto_13098 ?auto_13100 ) ( OBJ-AT ?auto_13099 ?auto_13100 ) ( OBJ-AT ?auto_13097 ?auto_13100 ) ( TRUCK-AT ?auto_13103 ?auto_13095 ) ( not ( = ?auto_13097 ?auto_13099 ) ) ( not ( = ?auto_13097 ?auto_13098 ) ) ( not ( = ?auto_13099 ?auto_13098 ) ) ( not ( = ?auto_13097 ?auto_13096 ) ) ( not ( = ?auto_13099 ?auto_13096 ) ) ( not ( = ?auto_13098 ?auto_13096 ) ) ( not ( = ?auto_13102 ?auto_13100 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13097 ?auto_13099 ?auto_13096 ?auto_13098 ?auto_13095 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13187 - OBJ
      ?auto_13188 - OBJ
      ?auto_13189 - OBJ
      ?auto_13190 - OBJ
      ?auto_13186 - LOCATION
    )
    :vars
    (
      ?auto_13193 - LOCATION
      ?auto_13192 - CITY
      ?auto_13191 - LOCATION
      ?auto_13194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13193 ?auto_13192 ) ( IN-CITY ?auto_13186 ?auto_13192 ) ( not ( = ?auto_13186 ?auto_13193 ) ) ( OBJ-AT ?auto_13187 ?auto_13193 ) ( IN-CITY ?auto_13191 ?auto_13192 ) ( not ( = ?auto_13186 ?auto_13191 ) ) ( OBJ-AT ?auto_13190 ?auto_13191 ) ( OBJ-AT ?auto_13188 ?auto_13191 ) ( OBJ-AT ?auto_13189 ?auto_13191 ) ( TRUCK-AT ?auto_13194 ?auto_13186 ) ( not ( = ?auto_13189 ?auto_13188 ) ) ( not ( = ?auto_13189 ?auto_13190 ) ) ( not ( = ?auto_13188 ?auto_13190 ) ) ( not ( = ?auto_13189 ?auto_13187 ) ) ( not ( = ?auto_13188 ?auto_13187 ) ) ( not ( = ?auto_13190 ?auto_13187 ) ) ( not ( = ?auto_13193 ?auto_13191 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13189 ?auto_13188 ?auto_13187 ?auto_13190 ?auto_13186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13248 - OBJ
      ?auto_13249 - OBJ
      ?auto_13250 - OBJ
      ?auto_13251 - OBJ
      ?auto_13247 - LOCATION
    )
    :vars
    (
      ?auto_13254 - LOCATION
      ?auto_13253 - CITY
      ?auto_13252 - LOCATION
      ?auto_13255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13254 ?auto_13253 ) ( IN-CITY ?auto_13247 ?auto_13253 ) ( not ( = ?auto_13247 ?auto_13254 ) ) ( OBJ-AT ?auto_13248 ?auto_13254 ) ( IN-CITY ?auto_13252 ?auto_13253 ) ( not ( = ?auto_13247 ?auto_13252 ) ) ( OBJ-AT ?auto_13250 ?auto_13252 ) ( OBJ-AT ?auto_13249 ?auto_13252 ) ( OBJ-AT ?auto_13251 ?auto_13252 ) ( TRUCK-AT ?auto_13255 ?auto_13247 ) ( not ( = ?auto_13251 ?auto_13249 ) ) ( not ( = ?auto_13251 ?auto_13250 ) ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13251 ?auto_13248 ) ) ( not ( = ?auto_13249 ?auto_13248 ) ) ( not ( = ?auto_13250 ?auto_13248 ) ) ( not ( = ?auto_13254 ?auto_13252 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13251 ?auto_13249 ?auto_13248 ?auto_13250 ?auto_13247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13339 - OBJ
      ?auto_13340 - OBJ
      ?auto_13341 - OBJ
      ?auto_13342 - OBJ
      ?auto_13338 - LOCATION
    )
    :vars
    (
      ?auto_13345 - LOCATION
      ?auto_13344 - CITY
      ?auto_13343 - LOCATION
      ?auto_13346 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13345 ?auto_13344 ) ( IN-CITY ?auto_13338 ?auto_13344 ) ( not ( = ?auto_13338 ?auto_13345 ) ) ( OBJ-AT ?auto_13339 ?auto_13345 ) ( IN-CITY ?auto_13343 ?auto_13344 ) ( not ( = ?auto_13338 ?auto_13343 ) ) ( OBJ-AT ?auto_13340 ?auto_13343 ) ( OBJ-AT ?auto_13342 ?auto_13343 ) ( OBJ-AT ?auto_13341 ?auto_13343 ) ( TRUCK-AT ?auto_13346 ?auto_13338 ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13340 ) ) ( not ( = ?auto_13342 ?auto_13340 ) ) ( not ( = ?auto_13341 ?auto_13339 ) ) ( not ( = ?auto_13342 ?auto_13339 ) ) ( not ( = ?auto_13340 ?auto_13339 ) ) ( not ( = ?auto_13345 ?auto_13343 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13341 ?auto_13342 ?auto_13339 ?auto_13340 ?auto_13338 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13368 - OBJ
      ?auto_13369 - OBJ
      ?auto_13370 - OBJ
      ?auto_13371 - OBJ
      ?auto_13367 - LOCATION
    )
    :vars
    (
      ?auto_13374 - LOCATION
      ?auto_13373 - CITY
      ?auto_13372 - LOCATION
      ?auto_13375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13374 ?auto_13373 ) ( IN-CITY ?auto_13367 ?auto_13373 ) ( not ( = ?auto_13367 ?auto_13374 ) ) ( OBJ-AT ?auto_13368 ?auto_13374 ) ( IN-CITY ?auto_13372 ?auto_13373 ) ( not ( = ?auto_13367 ?auto_13372 ) ) ( OBJ-AT ?auto_13369 ?auto_13372 ) ( OBJ-AT ?auto_13370 ?auto_13372 ) ( OBJ-AT ?auto_13371 ?auto_13372 ) ( TRUCK-AT ?auto_13375 ?auto_13367 ) ( not ( = ?auto_13371 ?auto_13370 ) ) ( not ( = ?auto_13371 ?auto_13369 ) ) ( not ( = ?auto_13370 ?auto_13369 ) ) ( not ( = ?auto_13371 ?auto_13368 ) ) ( not ( = ?auto_13370 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13374 ?auto_13372 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13371 ?auto_13370 ?auto_13368 ?auto_13369 ?auto_13367 ) )
  )

)

