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
      ?auto_13664 - OBJ
      ?auto_13663 - LOCATION
    )
    :vars
    (
      ?auto_13666 - LOCATION
      ?auto_13667 - CITY
      ?auto_13665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13666 ?auto_13667 ) ( IN-CITY ?auto_13663 ?auto_13667 ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( OBJ-AT ?auto_13664 ?auto_13666 ) ( TRUCK-AT ?auto_13665 ?auto_13663 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13665 ?auto_13663 ?auto_13666 ?auto_13667 )
      ( !LOAD-TRUCK ?auto_13664 ?auto_13665 ?auto_13666 )
      ( !DRIVE-TRUCK ?auto_13665 ?auto_13666 ?auto_13663 ?auto_13667 )
      ( !UNLOAD-TRUCK ?auto_13664 ?auto_13665 ?auto_13663 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13671 - OBJ
      ?auto_13670 - LOCATION
    )
    :vars
    (
      ?auto_13673 - LOCATION
      ?auto_13674 - CITY
      ?auto_13672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13673 ?auto_13674 ) ( IN-CITY ?auto_13670 ?auto_13674 ) ( not ( = ?auto_13670 ?auto_13673 ) ) ( OBJ-AT ?auto_13671 ?auto_13673 ) ( TRUCK-AT ?auto_13672 ?auto_13670 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13672 ?auto_13670 ?auto_13673 ?auto_13674 )
      ( !LOAD-TRUCK ?auto_13671 ?auto_13672 ?auto_13673 )
      ( !DRIVE-TRUCK ?auto_13672 ?auto_13673 ?auto_13670 ?auto_13674 )
      ( !UNLOAD-TRUCK ?auto_13671 ?auto_13672 ?auto_13670 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13685 - OBJ
      ?auto_13686 - OBJ
      ?auto_13684 - LOCATION
    )
    :vars
    (
      ?auto_13688 - LOCATION
      ?auto_13689 - CITY
      ?auto_13690 - LOCATION
      ?auto_13687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13688 ?auto_13689 ) ( IN-CITY ?auto_13684 ?auto_13689 ) ( not ( = ?auto_13684 ?auto_13688 ) ) ( OBJ-AT ?auto_13686 ?auto_13688 ) ( IN-CITY ?auto_13690 ?auto_13689 ) ( not ( = ?auto_13684 ?auto_13690 ) ) ( OBJ-AT ?auto_13685 ?auto_13690 ) ( TRUCK-AT ?auto_13687 ?auto_13684 ) ( not ( = ?auto_13685 ?auto_13686 ) ) ( not ( = ?auto_13688 ?auto_13690 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13685 ?auto_13684 )
      ( DELIVER-1PKG ?auto_13686 ?auto_13684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13692 - OBJ
      ?auto_13693 - OBJ
      ?auto_13691 - LOCATION
    )
    :vars
    (
      ?auto_13694 - LOCATION
      ?auto_13695 - CITY
      ?auto_13697 - LOCATION
      ?auto_13696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13694 ?auto_13695 ) ( IN-CITY ?auto_13691 ?auto_13695 ) ( not ( = ?auto_13691 ?auto_13694 ) ) ( OBJ-AT ?auto_13692 ?auto_13694 ) ( IN-CITY ?auto_13697 ?auto_13695 ) ( not ( = ?auto_13691 ?auto_13697 ) ) ( OBJ-AT ?auto_13693 ?auto_13697 ) ( TRUCK-AT ?auto_13696 ?auto_13691 ) ( not ( = ?auto_13693 ?auto_13692 ) ) ( not ( = ?auto_13694 ?auto_13697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13693 ?auto_13692 ?auto_13691 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13709 - OBJ
      ?auto_13708 - LOCATION
    )
    :vars
    (
      ?auto_13711 - LOCATION
      ?auto_13712 - CITY
      ?auto_13710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13711 ?auto_13712 ) ( IN-CITY ?auto_13708 ?auto_13712 ) ( not ( = ?auto_13708 ?auto_13711 ) ) ( OBJ-AT ?auto_13709 ?auto_13711 ) ( TRUCK-AT ?auto_13710 ?auto_13708 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13710 ?auto_13708 ?auto_13711 ?auto_13712 )
      ( !LOAD-TRUCK ?auto_13709 ?auto_13710 ?auto_13711 )
      ( !DRIVE-TRUCK ?auto_13710 ?auto_13711 ?auto_13708 ?auto_13712 )
      ( !UNLOAD-TRUCK ?auto_13709 ?auto_13710 ?auto_13708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13800 - OBJ
      ?auto_13801 - OBJ
      ?auto_13802 - OBJ
      ?auto_13799 - LOCATION
    )
    :vars
    (
      ?auto_13805 - LOCATION
      ?auto_13804 - CITY
      ?auto_13807 - LOCATION
      ?auto_13806 - LOCATION
      ?auto_13803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13805 ?auto_13804 ) ( IN-CITY ?auto_13799 ?auto_13804 ) ( not ( = ?auto_13799 ?auto_13805 ) ) ( OBJ-AT ?auto_13802 ?auto_13805 ) ( IN-CITY ?auto_13807 ?auto_13804 ) ( not ( = ?auto_13799 ?auto_13807 ) ) ( OBJ-AT ?auto_13801 ?auto_13807 ) ( IN-CITY ?auto_13806 ?auto_13804 ) ( not ( = ?auto_13799 ?auto_13806 ) ) ( OBJ-AT ?auto_13800 ?auto_13806 ) ( TRUCK-AT ?auto_13803 ?auto_13799 ) ( not ( = ?auto_13800 ?auto_13801 ) ) ( not ( = ?auto_13807 ?auto_13806 ) ) ( not ( = ?auto_13800 ?auto_13802 ) ) ( not ( = ?auto_13801 ?auto_13802 ) ) ( not ( = ?auto_13805 ?auto_13807 ) ) ( not ( = ?auto_13805 ?auto_13806 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13801 ?auto_13800 ?auto_13799 )
      ( DELIVER-1PKG ?auto_13802 ?auto_13799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13819 - OBJ
      ?auto_13820 - OBJ
      ?auto_13821 - OBJ
      ?auto_13818 - LOCATION
    )
    :vars
    (
      ?auto_13824 - LOCATION
      ?auto_13823 - CITY
      ?auto_13826 - LOCATION
      ?auto_13822 - LOCATION
      ?auto_13825 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13824 ?auto_13823 ) ( IN-CITY ?auto_13818 ?auto_13823 ) ( not ( = ?auto_13818 ?auto_13824 ) ) ( OBJ-AT ?auto_13820 ?auto_13824 ) ( IN-CITY ?auto_13826 ?auto_13823 ) ( not ( = ?auto_13818 ?auto_13826 ) ) ( OBJ-AT ?auto_13821 ?auto_13826 ) ( IN-CITY ?auto_13822 ?auto_13823 ) ( not ( = ?auto_13818 ?auto_13822 ) ) ( OBJ-AT ?auto_13819 ?auto_13822 ) ( TRUCK-AT ?auto_13825 ?auto_13818 ) ( not ( = ?auto_13819 ?auto_13821 ) ) ( not ( = ?auto_13826 ?auto_13822 ) ) ( not ( = ?auto_13819 ?auto_13820 ) ) ( not ( = ?auto_13821 ?auto_13820 ) ) ( not ( = ?auto_13824 ?auto_13826 ) ) ( not ( = ?auto_13824 ?auto_13822 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13819 ?auto_13821 ?auto_13820 ?auto_13818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13838 - OBJ
      ?auto_13839 - OBJ
      ?auto_13840 - OBJ
      ?auto_13837 - LOCATION
    )
    :vars
    (
      ?auto_13841 - LOCATION
      ?auto_13845 - CITY
      ?auto_13842 - LOCATION
      ?auto_13844 - LOCATION
      ?auto_13843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13841 ?auto_13845 ) ( IN-CITY ?auto_13837 ?auto_13845 ) ( not ( = ?auto_13837 ?auto_13841 ) ) ( OBJ-AT ?auto_13840 ?auto_13841 ) ( IN-CITY ?auto_13842 ?auto_13845 ) ( not ( = ?auto_13837 ?auto_13842 ) ) ( OBJ-AT ?auto_13838 ?auto_13842 ) ( IN-CITY ?auto_13844 ?auto_13845 ) ( not ( = ?auto_13837 ?auto_13844 ) ) ( OBJ-AT ?auto_13839 ?auto_13844 ) ( TRUCK-AT ?auto_13843 ?auto_13837 ) ( not ( = ?auto_13839 ?auto_13838 ) ) ( not ( = ?auto_13842 ?auto_13844 ) ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( not ( = ?auto_13838 ?auto_13840 ) ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13844 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13839 ?auto_13840 ?auto_13838 ?auto_13837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13857 - OBJ
      ?auto_13858 - OBJ
      ?auto_13859 - OBJ
      ?auto_13856 - LOCATION
    )
    :vars
    (
      ?auto_13860 - LOCATION
      ?auto_13864 - CITY
      ?auto_13861 - LOCATION
      ?auto_13863 - LOCATION
      ?auto_13862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13860 ?auto_13864 ) ( IN-CITY ?auto_13856 ?auto_13864 ) ( not ( = ?auto_13856 ?auto_13860 ) ) ( OBJ-AT ?auto_13858 ?auto_13860 ) ( IN-CITY ?auto_13861 ?auto_13864 ) ( not ( = ?auto_13856 ?auto_13861 ) ) ( OBJ-AT ?auto_13857 ?auto_13861 ) ( IN-CITY ?auto_13863 ?auto_13864 ) ( not ( = ?auto_13856 ?auto_13863 ) ) ( OBJ-AT ?auto_13859 ?auto_13863 ) ( TRUCK-AT ?auto_13862 ?auto_13856 ) ( not ( = ?auto_13859 ?auto_13857 ) ) ( not ( = ?auto_13861 ?auto_13863 ) ) ( not ( = ?auto_13859 ?auto_13858 ) ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( not ( = ?auto_13860 ?auto_13861 ) ) ( not ( = ?auto_13860 ?auto_13863 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13859 ?auto_13858 ?auto_13857 ?auto_13856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13896 - OBJ
      ?auto_13897 - OBJ
      ?auto_13898 - OBJ
      ?auto_13895 - LOCATION
    )
    :vars
    (
      ?auto_13899 - LOCATION
      ?auto_13903 - CITY
      ?auto_13900 - LOCATION
      ?auto_13902 - LOCATION
      ?auto_13901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13899 ?auto_13903 ) ( IN-CITY ?auto_13895 ?auto_13903 ) ( not ( = ?auto_13895 ?auto_13899 ) ) ( OBJ-AT ?auto_13896 ?auto_13899 ) ( IN-CITY ?auto_13900 ?auto_13903 ) ( not ( = ?auto_13895 ?auto_13900 ) ) ( OBJ-AT ?auto_13898 ?auto_13900 ) ( IN-CITY ?auto_13902 ?auto_13903 ) ( not ( = ?auto_13895 ?auto_13902 ) ) ( OBJ-AT ?auto_13897 ?auto_13902 ) ( TRUCK-AT ?auto_13901 ?auto_13895 ) ( not ( = ?auto_13897 ?auto_13898 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( not ( = ?auto_13897 ?auto_13896 ) ) ( not ( = ?auto_13898 ?auto_13896 ) ) ( not ( = ?auto_13899 ?auto_13900 ) ) ( not ( = ?auto_13899 ?auto_13902 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13897 ?auto_13896 ?auto_13898 ?auto_13895 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13915 - OBJ
      ?auto_13916 - OBJ
      ?auto_13917 - OBJ
      ?auto_13914 - LOCATION
    )
    :vars
    (
      ?auto_13918 - LOCATION
      ?auto_13922 - CITY
      ?auto_13919 - LOCATION
      ?auto_13921 - LOCATION
      ?auto_13920 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13918 ?auto_13922 ) ( IN-CITY ?auto_13914 ?auto_13922 ) ( not ( = ?auto_13914 ?auto_13918 ) ) ( OBJ-AT ?auto_13915 ?auto_13918 ) ( IN-CITY ?auto_13919 ?auto_13922 ) ( not ( = ?auto_13914 ?auto_13919 ) ) ( OBJ-AT ?auto_13916 ?auto_13919 ) ( IN-CITY ?auto_13921 ?auto_13922 ) ( not ( = ?auto_13914 ?auto_13921 ) ) ( OBJ-AT ?auto_13917 ?auto_13921 ) ( TRUCK-AT ?auto_13920 ?auto_13914 ) ( not ( = ?auto_13917 ?auto_13916 ) ) ( not ( = ?auto_13919 ?auto_13921 ) ) ( not ( = ?auto_13917 ?auto_13915 ) ) ( not ( = ?auto_13916 ?auto_13915 ) ) ( not ( = ?auto_13918 ?auto_13919 ) ) ( not ( = ?auto_13918 ?auto_13921 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13917 ?auto_13915 ?auto_13916 ?auto_13914 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13977 - OBJ
      ?auto_13976 - LOCATION
    )
    :vars
    (
      ?auto_13979 - LOCATION
      ?auto_13980 - CITY
      ?auto_13978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13979 ?auto_13980 ) ( IN-CITY ?auto_13976 ?auto_13980 ) ( not ( = ?auto_13976 ?auto_13979 ) ) ( OBJ-AT ?auto_13977 ?auto_13979 ) ( TRUCK-AT ?auto_13978 ?auto_13976 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13978 ?auto_13976 ?auto_13979 ?auto_13980 )
      ( !LOAD-TRUCK ?auto_13977 ?auto_13978 ?auto_13979 )
      ( !DRIVE-TRUCK ?auto_13978 ?auto_13979 ?auto_13976 ?auto_13980 )
      ( !UNLOAD-TRUCK ?auto_13977 ?auto_13978 ?auto_13976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14959 - OBJ
      ?auto_14960 - OBJ
      ?auto_14961 - OBJ
      ?auto_14962 - OBJ
      ?auto_14958 - LOCATION
    )
    :vars
    (
      ?auto_14965 - LOCATION
      ?auto_14963 - CITY
      ?auto_14966 - LOCATION
      ?auto_14967 - LOCATION
      ?auto_14964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14965 ?auto_14963 ) ( IN-CITY ?auto_14958 ?auto_14963 ) ( not ( = ?auto_14958 ?auto_14965 ) ) ( OBJ-AT ?auto_14962 ?auto_14965 ) ( IN-CITY ?auto_14966 ?auto_14963 ) ( not ( = ?auto_14958 ?auto_14966 ) ) ( OBJ-AT ?auto_14961 ?auto_14966 ) ( OBJ-AT ?auto_14960 ?auto_14965 ) ( IN-CITY ?auto_14967 ?auto_14963 ) ( not ( = ?auto_14958 ?auto_14967 ) ) ( OBJ-AT ?auto_14959 ?auto_14967 ) ( TRUCK-AT ?auto_14964 ?auto_14958 ) ( not ( = ?auto_14959 ?auto_14960 ) ) ( not ( = ?auto_14965 ?auto_14967 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( not ( = ?auto_14966 ?auto_14965 ) ) ( not ( = ?auto_14966 ?auto_14967 ) ) ( not ( = ?auto_14959 ?auto_14962 ) ) ( not ( = ?auto_14960 ?auto_14962 ) ) ( not ( = ?auto_14961 ?auto_14962 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14959 ?auto_14961 ?auto_14960 ?auto_14958 )
      ( DELIVER-1PKG ?auto_14962 ?auto_14958 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14991 - OBJ
      ?auto_14992 - OBJ
      ?auto_14993 - OBJ
      ?auto_14994 - OBJ
      ?auto_14990 - LOCATION
    )
    :vars
    (
      ?auto_14998 - LOCATION
      ?auto_14997 - CITY
      ?auto_14996 - LOCATION
      ?auto_14999 - LOCATION
      ?auto_14995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14998 ?auto_14997 ) ( IN-CITY ?auto_14990 ?auto_14997 ) ( not ( = ?auto_14990 ?auto_14998 ) ) ( OBJ-AT ?auto_14993 ?auto_14998 ) ( IN-CITY ?auto_14996 ?auto_14997 ) ( not ( = ?auto_14990 ?auto_14996 ) ) ( OBJ-AT ?auto_14994 ?auto_14996 ) ( OBJ-AT ?auto_14992 ?auto_14998 ) ( IN-CITY ?auto_14999 ?auto_14997 ) ( not ( = ?auto_14990 ?auto_14999 ) ) ( OBJ-AT ?auto_14991 ?auto_14999 ) ( TRUCK-AT ?auto_14995 ?auto_14990 ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14998 ?auto_14999 ) ) ( not ( = ?auto_14991 ?auto_14994 ) ) ( not ( = ?auto_14992 ?auto_14994 ) ) ( not ( = ?auto_14996 ?auto_14998 ) ) ( not ( = ?auto_14996 ?auto_14999 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14994 ?auto_14993 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14991 ?auto_14992 ?auto_14994 ?auto_14993 ?auto_14990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15023 - OBJ
      ?auto_15024 - OBJ
      ?auto_15025 - OBJ
      ?auto_15026 - OBJ
      ?auto_15022 - LOCATION
    )
    :vars
    (
      ?auto_15031 - LOCATION
      ?auto_15029 - CITY
      ?auto_15027 - LOCATION
      ?auto_15030 - LOCATION
      ?auto_15028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15031 ?auto_15029 ) ( IN-CITY ?auto_15022 ?auto_15029 ) ( not ( = ?auto_15022 ?auto_15031 ) ) ( OBJ-AT ?auto_15026 ?auto_15031 ) ( IN-CITY ?auto_15027 ?auto_15029 ) ( not ( = ?auto_15022 ?auto_15027 ) ) ( OBJ-AT ?auto_15024 ?auto_15027 ) ( OBJ-AT ?auto_15025 ?auto_15031 ) ( IN-CITY ?auto_15030 ?auto_15029 ) ( not ( = ?auto_15022 ?auto_15030 ) ) ( OBJ-AT ?auto_15023 ?auto_15030 ) ( TRUCK-AT ?auto_15028 ?auto_15022 ) ( not ( = ?auto_15023 ?auto_15025 ) ) ( not ( = ?auto_15031 ?auto_15030 ) ) ( not ( = ?auto_15023 ?auto_15024 ) ) ( not ( = ?auto_15025 ?auto_15024 ) ) ( not ( = ?auto_15027 ?auto_15031 ) ) ( not ( = ?auto_15027 ?auto_15030 ) ) ( not ( = ?auto_15023 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15026 ) ) ( not ( = ?auto_15024 ?auto_15026 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15023 ?auto_15025 ?auto_15026 ?auto_15024 ?auto_15022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15055 - OBJ
      ?auto_15056 - OBJ
      ?auto_15057 - OBJ
      ?auto_15058 - OBJ
      ?auto_15054 - LOCATION
    )
    :vars
    (
      ?auto_15063 - LOCATION
      ?auto_15061 - CITY
      ?auto_15059 - LOCATION
      ?auto_15062 - LOCATION
      ?auto_15060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15063 ?auto_15061 ) ( IN-CITY ?auto_15054 ?auto_15061 ) ( not ( = ?auto_15054 ?auto_15063 ) ) ( OBJ-AT ?auto_15057 ?auto_15063 ) ( IN-CITY ?auto_15059 ?auto_15061 ) ( not ( = ?auto_15054 ?auto_15059 ) ) ( OBJ-AT ?auto_15056 ?auto_15059 ) ( OBJ-AT ?auto_15058 ?auto_15063 ) ( IN-CITY ?auto_15062 ?auto_15061 ) ( not ( = ?auto_15054 ?auto_15062 ) ) ( OBJ-AT ?auto_15055 ?auto_15062 ) ( TRUCK-AT ?auto_15060 ?auto_15054 ) ( not ( = ?auto_15055 ?auto_15058 ) ) ( not ( = ?auto_15063 ?auto_15062 ) ) ( not ( = ?auto_15055 ?auto_15056 ) ) ( not ( = ?auto_15058 ?auto_15056 ) ) ( not ( = ?auto_15059 ?auto_15063 ) ) ( not ( = ?auto_15059 ?auto_15062 ) ) ( not ( = ?auto_15055 ?auto_15057 ) ) ( not ( = ?auto_15058 ?auto_15057 ) ) ( not ( = ?auto_15056 ?auto_15057 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15055 ?auto_15058 ?auto_15057 ?auto_15056 ?auto_15054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15155 - OBJ
      ?auto_15156 - OBJ
      ?auto_15157 - OBJ
      ?auto_15158 - OBJ
      ?auto_15154 - LOCATION
    )
    :vars
    (
      ?auto_15163 - LOCATION
      ?auto_15161 - CITY
      ?auto_15159 - LOCATION
      ?auto_15162 - LOCATION
      ?auto_15160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15163 ?auto_15161 ) ( IN-CITY ?auto_15154 ?auto_15161 ) ( not ( = ?auto_15154 ?auto_15163 ) ) ( OBJ-AT ?auto_15156 ?auto_15163 ) ( IN-CITY ?auto_15159 ?auto_15161 ) ( not ( = ?auto_15154 ?auto_15159 ) ) ( OBJ-AT ?auto_15158 ?auto_15159 ) ( OBJ-AT ?auto_15157 ?auto_15163 ) ( IN-CITY ?auto_15162 ?auto_15161 ) ( not ( = ?auto_15154 ?auto_15162 ) ) ( OBJ-AT ?auto_15155 ?auto_15162 ) ( TRUCK-AT ?auto_15160 ?auto_15154 ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15163 ?auto_15162 ) ) ( not ( = ?auto_15155 ?auto_15158 ) ) ( not ( = ?auto_15157 ?auto_15158 ) ) ( not ( = ?auto_15159 ?auto_15163 ) ) ( not ( = ?auto_15159 ?auto_15162 ) ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15157 ?auto_15156 ) ) ( not ( = ?auto_15158 ?auto_15156 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15155 ?auto_15157 ?auto_15156 ?auto_15158 ?auto_15154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15187 - OBJ
      ?auto_15188 - OBJ
      ?auto_15189 - OBJ
      ?auto_15190 - OBJ
      ?auto_15186 - LOCATION
    )
    :vars
    (
      ?auto_15195 - LOCATION
      ?auto_15193 - CITY
      ?auto_15191 - LOCATION
      ?auto_15194 - LOCATION
      ?auto_15192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15195 ?auto_15193 ) ( IN-CITY ?auto_15186 ?auto_15193 ) ( not ( = ?auto_15186 ?auto_15195 ) ) ( OBJ-AT ?auto_15188 ?auto_15195 ) ( IN-CITY ?auto_15191 ?auto_15193 ) ( not ( = ?auto_15186 ?auto_15191 ) ) ( OBJ-AT ?auto_15189 ?auto_15191 ) ( OBJ-AT ?auto_15190 ?auto_15195 ) ( IN-CITY ?auto_15194 ?auto_15193 ) ( not ( = ?auto_15186 ?auto_15194 ) ) ( OBJ-AT ?auto_15187 ?auto_15194 ) ( TRUCK-AT ?auto_15192 ?auto_15186 ) ( not ( = ?auto_15187 ?auto_15190 ) ) ( not ( = ?auto_15195 ?auto_15194 ) ) ( not ( = ?auto_15187 ?auto_15189 ) ) ( not ( = ?auto_15190 ?auto_15189 ) ) ( not ( = ?auto_15191 ?auto_15195 ) ) ( not ( = ?auto_15191 ?auto_15194 ) ) ( not ( = ?auto_15187 ?auto_15188 ) ) ( not ( = ?auto_15190 ?auto_15188 ) ) ( not ( = ?auto_15189 ?auto_15188 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15187 ?auto_15190 ?auto_15188 ?auto_15189 ?auto_15186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15287 - OBJ
      ?auto_15288 - OBJ
      ?auto_15289 - OBJ
      ?auto_15290 - OBJ
      ?auto_15286 - LOCATION
    )
    :vars
    (
      ?auto_15295 - LOCATION
      ?auto_15293 - CITY
      ?auto_15291 - LOCATION
      ?auto_15294 - LOCATION
      ?auto_15292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15295 ?auto_15293 ) ( IN-CITY ?auto_15286 ?auto_15293 ) ( not ( = ?auto_15286 ?auto_15295 ) ) ( OBJ-AT ?auto_15290 ?auto_15295 ) ( IN-CITY ?auto_15291 ?auto_15293 ) ( not ( = ?auto_15286 ?auto_15291 ) ) ( OBJ-AT ?auto_15289 ?auto_15291 ) ( OBJ-AT ?auto_15287 ?auto_15295 ) ( IN-CITY ?auto_15294 ?auto_15293 ) ( not ( = ?auto_15286 ?auto_15294 ) ) ( OBJ-AT ?auto_15288 ?auto_15294 ) ( TRUCK-AT ?auto_15292 ?auto_15286 ) ( not ( = ?auto_15288 ?auto_15287 ) ) ( not ( = ?auto_15295 ?auto_15294 ) ) ( not ( = ?auto_15288 ?auto_15289 ) ) ( not ( = ?auto_15287 ?auto_15289 ) ) ( not ( = ?auto_15291 ?auto_15295 ) ) ( not ( = ?auto_15291 ?auto_15294 ) ) ( not ( = ?auto_15288 ?auto_15290 ) ) ( not ( = ?auto_15287 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15290 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15288 ?auto_15287 ?auto_15290 ?auto_15289 ?auto_15286 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15319 - OBJ
      ?auto_15320 - OBJ
      ?auto_15321 - OBJ
      ?auto_15322 - OBJ
      ?auto_15318 - LOCATION
    )
    :vars
    (
      ?auto_15327 - LOCATION
      ?auto_15325 - CITY
      ?auto_15323 - LOCATION
      ?auto_15326 - LOCATION
      ?auto_15324 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15327 ?auto_15325 ) ( IN-CITY ?auto_15318 ?auto_15325 ) ( not ( = ?auto_15318 ?auto_15327 ) ) ( OBJ-AT ?auto_15321 ?auto_15327 ) ( IN-CITY ?auto_15323 ?auto_15325 ) ( not ( = ?auto_15318 ?auto_15323 ) ) ( OBJ-AT ?auto_15322 ?auto_15323 ) ( OBJ-AT ?auto_15319 ?auto_15327 ) ( IN-CITY ?auto_15326 ?auto_15325 ) ( not ( = ?auto_15318 ?auto_15326 ) ) ( OBJ-AT ?auto_15320 ?auto_15326 ) ( TRUCK-AT ?auto_15324 ?auto_15318 ) ( not ( = ?auto_15320 ?auto_15319 ) ) ( not ( = ?auto_15327 ?auto_15326 ) ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( not ( = ?auto_15323 ?auto_15327 ) ) ( not ( = ?auto_15323 ?auto_15326 ) ) ( not ( = ?auto_15320 ?auto_15321 ) ) ( not ( = ?auto_15319 ?auto_15321 ) ) ( not ( = ?auto_15322 ?auto_15321 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15320 ?auto_15319 ?auto_15321 ?auto_15322 ?auto_15318 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15420 - OBJ
      ?auto_15421 - OBJ
      ?auto_15422 - OBJ
      ?auto_15423 - OBJ
      ?auto_15419 - LOCATION
    )
    :vars
    (
      ?auto_15428 - LOCATION
      ?auto_15426 - CITY
      ?auto_15424 - LOCATION
      ?auto_15427 - LOCATION
      ?auto_15425 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15428 ?auto_15426 ) ( IN-CITY ?auto_15419 ?auto_15426 ) ( not ( = ?auto_15419 ?auto_15428 ) ) ( OBJ-AT ?auto_15423 ?auto_15428 ) ( IN-CITY ?auto_15424 ?auto_15426 ) ( not ( = ?auto_15419 ?auto_15424 ) ) ( OBJ-AT ?auto_15421 ?auto_15424 ) ( OBJ-AT ?auto_15420 ?auto_15428 ) ( IN-CITY ?auto_15427 ?auto_15426 ) ( not ( = ?auto_15419 ?auto_15427 ) ) ( OBJ-AT ?auto_15422 ?auto_15427 ) ( TRUCK-AT ?auto_15425 ?auto_15419 ) ( not ( = ?auto_15422 ?auto_15420 ) ) ( not ( = ?auto_15428 ?auto_15427 ) ) ( not ( = ?auto_15422 ?auto_15421 ) ) ( not ( = ?auto_15420 ?auto_15421 ) ) ( not ( = ?auto_15424 ?auto_15428 ) ) ( not ( = ?auto_15424 ?auto_15427 ) ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( not ( = ?auto_15420 ?auto_15423 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15422 ?auto_15420 ?auto_15423 ?auto_15421 ?auto_15419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15452 - OBJ
      ?auto_15453 - OBJ
      ?auto_15454 - OBJ
      ?auto_15455 - OBJ
      ?auto_15451 - LOCATION
    )
    :vars
    (
      ?auto_15460 - LOCATION
      ?auto_15458 - CITY
      ?auto_15456 - LOCATION
      ?auto_15459 - LOCATION
      ?auto_15457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15460 ?auto_15458 ) ( IN-CITY ?auto_15451 ?auto_15458 ) ( not ( = ?auto_15451 ?auto_15460 ) ) ( OBJ-AT ?auto_15454 ?auto_15460 ) ( IN-CITY ?auto_15456 ?auto_15458 ) ( not ( = ?auto_15451 ?auto_15456 ) ) ( OBJ-AT ?auto_15453 ?auto_15456 ) ( OBJ-AT ?auto_15452 ?auto_15460 ) ( IN-CITY ?auto_15459 ?auto_15458 ) ( not ( = ?auto_15451 ?auto_15459 ) ) ( OBJ-AT ?auto_15455 ?auto_15459 ) ( TRUCK-AT ?auto_15457 ?auto_15451 ) ( not ( = ?auto_15455 ?auto_15452 ) ) ( not ( = ?auto_15460 ?auto_15459 ) ) ( not ( = ?auto_15455 ?auto_15453 ) ) ( not ( = ?auto_15452 ?auto_15453 ) ) ( not ( = ?auto_15456 ?auto_15460 ) ) ( not ( = ?auto_15456 ?auto_15459 ) ) ( not ( = ?auto_15455 ?auto_15454 ) ) ( not ( = ?auto_15452 ?auto_15454 ) ) ( not ( = ?auto_15453 ?auto_15454 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15455 ?auto_15452 ?auto_15454 ?auto_15453 ?auto_15451 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15517 - OBJ
      ?auto_15518 - OBJ
      ?auto_15519 - OBJ
      ?auto_15520 - OBJ
      ?auto_15516 - LOCATION
    )
    :vars
    (
      ?auto_15525 - LOCATION
      ?auto_15523 - CITY
      ?auto_15521 - LOCATION
      ?auto_15524 - LOCATION
      ?auto_15522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15525 ?auto_15523 ) ( IN-CITY ?auto_15516 ?auto_15523 ) ( not ( = ?auto_15516 ?auto_15525 ) ) ( OBJ-AT ?auto_15518 ?auto_15525 ) ( IN-CITY ?auto_15521 ?auto_15523 ) ( not ( = ?auto_15516 ?auto_15521 ) ) ( OBJ-AT ?auto_15520 ?auto_15521 ) ( OBJ-AT ?auto_15517 ?auto_15525 ) ( IN-CITY ?auto_15524 ?auto_15523 ) ( not ( = ?auto_15516 ?auto_15524 ) ) ( OBJ-AT ?auto_15519 ?auto_15524 ) ( TRUCK-AT ?auto_15522 ?auto_15516 ) ( not ( = ?auto_15519 ?auto_15517 ) ) ( not ( = ?auto_15525 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15517 ?auto_15520 ) ) ( not ( = ?auto_15521 ?auto_15525 ) ) ( not ( = ?auto_15521 ?auto_15524 ) ) ( not ( = ?auto_15519 ?auto_15518 ) ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15520 ?auto_15518 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15519 ?auto_15517 ?auto_15518 ?auto_15520 ?auto_15516 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15584 - OBJ
      ?auto_15585 - OBJ
      ?auto_15586 - OBJ
      ?auto_15587 - OBJ
      ?auto_15583 - LOCATION
    )
    :vars
    (
      ?auto_15592 - LOCATION
      ?auto_15590 - CITY
      ?auto_15588 - LOCATION
      ?auto_15591 - LOCATION
      ?auto_15589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15592 ?auto_15590 ) ( IN-CITY ?auto_15583 ?auto_15590 ) ( not ( = ?auto_15583 ?auto_15592 ) ) ( OBJ-AT ?auto_15585 ?auto_15592 ) ( IN-CITY ?auto_15588 ?auto_15590 ) ( not ( = ?auto_15583 ?auto_15588 ) ) ( OBJ-AT ?auto_15586 ?auto_15588 ) ( OBJ-AT ?auto_15584 ?auto_15592 ) ( IN-CITY ?auto_15591 ?auto_15590 ) ( not ( = ?auto_15583 ?auto_15591 ) ) ( OBJ-AT ?auto_15587 ?auto_15591 ) ( TRUCK-AT ?auto_15589 ?auto_15583 ) ( not ( = ?auto_15587 ?auto_15584 ) ) ( not ( = ?auto_15592 ?auto_15591 ) ) ( not ( = ?auto_15587 ?auto_15586 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( not ( = ?auto_15588 ?auto_15592 ) ) ( not ( = ?auto_15588 ?auto_15591 ) ) ( not ( = ?auto_15587 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15586 ?auto_15585 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15587 ?auto_15584 ?auto_15585 ?auto_15586 ?auto_15583 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15684 - OBJ
      ?auto_15685 - OBJ
      ?auto_15686 - OBJ
      ?auto_15687 - OBJ
      ?auto_15683 - LOCATION
    )
    :vars
    (
      ?auto_15692 - LOCATION
      ?auto_15690 - CITY
      ?auto_15688 - LOCATION
      ?auto_15691 - LOCATION
      ?auto_15689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15692 ?auto_15690 ) ( IN-CITY ?auto_15683 ?auto_15690 ) ( not ( = ?auto_15683 ?auto_15692 ) ) ( OBJ-AT ?auto_15687 ?auto_15692 ) ( IN-CITY ?auto_15688 ?auto_15690 ) ( not ( = ?auto_15683 ?auto_15688 ) ) ( OBJ-AT ?auto_15684 ?auto_15688 ) ( OBJ-AT ?auto_15686 ?auto_15692 ) ( IN-CITY ?auto_15691 ?auto_15690 ) ( not ( = ?auto_15683 ?auto_15691 ) ) ( OBJ-AT ?auto_15685 ?auto_15691 ) ( TRUCK-AT ?auto_15689 ?auto_15683 ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15692 ?auto_15691 ) ) ( not ( = ?auto_15685 ?auto_15684 ) ) ( not ( = ?auto_15686 ?auto_15684 ) ) ( not ( = ?auto_15688 ?auto_15692 ) ) ( not ( = ?auto_15688 ?auto_15691 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15684 ?auto_15687 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15685 ?auto_15686 ?auto_15687 ?auto_15684 ?auto_15683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15716 - OBJ
      ?auto_15717 - OBJ
      ?auto_15718 - OBJ
      ?auto_15719 - OBJ
      ?auto_15715 - LOCATION
    )
    :vars
    (
      ?auto_15724 - LOCATION
      ?auto_15722 - CITY
      ?auto_15720 - LOCATION
      ?auto_15723 - LOCATION
      ?auto_15721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15724 ?auto_15722 ) ( IN-CITY ?auto_15715 ?auto_15722 ) ( not ( = ?auto_15715 ?auto_15724 ) ) ( OBJ-AT ?auto_15718 ?auto_15724 ) ( IN-CITY ?auto_15720 ?auto_15722 ) ( not ( = ?auto_15715 ?auto_15720 ) ) ( OBJ-AT ?auto_15716 ?auto_15720 ) ( OBJ-AT ?auto_15719 ?auto_15724 ) ( IN-CITY ?auto_15723 ?auto_15722 ) ( not ( = ?auto_15715 ?auto_15723 ) ) ( OBJ-AT ?auto_15717 ?auto_15723 ) ( TRUCK-AT ?auto_15721 ?auto_15715 ) ( not ( = ?auto_15717 ?auto_15719 ) ) ( not ( = ?auto_15724 ?auto_15723 ) ) ( not ( = ?auto_15717 ?auto_15716 ) ) ( not ( = ?auto_15719 ?auto_15716 ) ) ( not ( = ?auto_15720 ?auto_15724 ) ) ( not ( = ?auto_15720 ?auto_15723 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15719 ?auto_15718 ) ) ( not ( = ?auto_15716 ?auto_15718 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15717 ?auto_15719 ?auto_15718 ?auto_15716 ?auto_15715 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15748 - OBJ
      ?auto_15749 - OBJ
      ?auto_15750 - OBJ
      ?auto_15751 - OBJ
      ?auto_15747 - LOCATION
    )
    :vars
    (
      ?auto_15756 - LOCATION
      ?auto_15754 - CITY
      ?auto_15752 - LOCATION
      ?auto_15755 - LOCATION
      ?auto_15753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15756 ?auto_15754 ) ( IN-CITY ?auto_15747 ?auto_15754 ) ( not ( = ?auto_15747 ?auto_15756 ) ) ( OBJ-AT ?auto_15751 ?auto_15756 ) ( IN-CITY ?auto_15752 ?auto_15754 ) ( not ( = ?auto_15747 ?auto_15752 ) ) ( OBJ-AT ?auto_15748 ?auto_15752 ) ( OBJ-AT ?auto_15749 ?auto_15756 ) ( IN-CITY ?auto_15755 ?auto_15754 ) ( not ( = ?auto_15747 ?auto_15755 ) ) ( OBJ-AT ?auto_15750 ?auto_15755 ) ( TRUCK-AT ?auto_15753 ?auto_15747 ) ( not ( = ?auto_15750 ?auto_15749 ) ) ( not ( = ?auto_15756 ?auto_15755 ) ) ( not ( = ?auto_15750 ?auto_15748 ) ) ( not ( = ?auto_15749 ?auto_15748 ) ) ( not ( = ?auto_15752 ?auto_15756 ) ) ( not ( = ?auto_15752 ?auto_15755 ) ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( not ( = ?auto_15749 ?auto_15751 ) ) ( not ( = ?auto_15748 ?auto_15751 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15750 ?auto_15749 ?auto_15751 ?auto_15748 ?auto_15747 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15780 - OBJ
      ?auto_15781 - OBJ
      ?auto_15782 - OBJ
      ?auto_15783 - OBJ
      ?auto_15779 - LOCATION
    )
    :vars
    (
      ?auto_15788 - LOCATION
      ?auto_15786 - CITY
      ?auto_15784 - LOCATION
      ?auto_15787 - LOCATION
      ?auto_15785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15788 ?auto_15786 ) ( IN-CITY ?auto_15779 ?auto_15786 ) ( not ( = ?auto_15779 ?auto_15788 ) ) ( OBJ-AT ?auto_15782 ?auto_15788 ) ( IN-CITY ?auto_15784 ?auto_15786 ) ( not ( = ?auto_15779 ?auto_15784 ) ) ( OBJ-AT ?auto_15780 ?auto_15784 ) ( OBJ-AT ?auto_15781 ?auto_15788 ) ( IN-CITY ?auto_15787 ?auto_15786 ) ( not ( = ?auto_15779 ?auto_15787 ) ) ( OBJ-AT ?auto_15783 ?auto_15787 ) ( TRUCK-AT ?auto_15785 ?auto_15779 ) ( not ( = ?auto_15783 ?auto_15781 ) ) ( not ( = ?auto_15788 ?auto_15787 ) ) ( not ( = ?auto_15783 ?auto_15780 ) ) ( not ( = ?auto_15781 ?auto_15780 ) ) ( not ( = ?auto_15784 ?auto_15788 ) ) ( not ( = ?auto_15784 ?auto_15787 ) ) ( not ( = ?auto_15783 ?auto_15782 ) ) ( not ( = ?auto_15781 ?auto_15782 ) ) ( not ( = ?auto_15780 ?auto_15782 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15783 ?auto_15781 ?auto_15782 ?auto_15780 ?auto_15779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15914 - OBJ
      ?auto_15915 - OBJ
      ?auto_15916 - OBJ
      ?auto_15917 - OBJ
      ?auto_15913 - LOCATION
    )
    :vars
    (
      ?auto_15922 - LOCATION
      ?auto_15920 - CITY
      ?auto_15918 - LOCATION
      ?auto_15921 - LOCATION
      ?auto_15919 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15922 ?auto_15920 ) ( IN-CITY ?auto_15913 ?auto_15920 ) ( not ( = ?auto_15913 ?auto_15922 ) ) ( OBJ-AT ?auto_15915 ?auto_15922 ) ( IN-CITY ?auto_15918 ?auto_15920 ) ( not ( = ?auto_15913 ?auto_15918 ) ) ( OBJ-AT ?auto_15914 ?auto_15918 ) ( OBJ-AT ?auto_15917 ?auto_15922 ) ( IN-CITY ?auto_15921 ?auto_15920 ) ( not ( = ?auto_15913 ?auto_15921 ) ) ( OBJ-AT ?auto_15916 ?auto_15921 ) ( TRUCK-AT ?auto_15919 ?auto_15913 ) ( not ( = ?auto_15916 ?auto_15917 ) ) ( not ( = ?auto_15922 ?auto_15921 ) ) ( not ( = ?auto_15916 ?auto_15914 ) ) ( not ( = ?auto_15917 ?auto_15914 ) ) ( not ( = ?auto_15918 ?auto_15922 ) ) ( not ( = ?auto_15918 ?auto_15921 ) ) ( not ( = ?auto_15916 ?auto_15915 ) ) ( not ( = ?auto_15917 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15915 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15916 ?auto_15917 ?auto_15915 ?auto_15914 ?auto_15913 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15946 - OBJ
      ?auto_15947 - OBJ
      ?auto_15948 - OBJ
      ?auto_15949 - OBJ
      ?auto_15945 - LOCATION
    )
    :vars
    (
      ?auto_15954 - LOCATION
      ?auto_15952 - CITY
      ?auto_15950 - LOCATION
      ?auto_15953 - LOCATION
      ?auto_15951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15954 ?auto_15952 ) ( IN-CITY ?auto_15945 ?auto_15952 ) ( not ( = ?auto_15945 ?auto_15954 ) ) ( OBJ-AT ?auto_15947 ?auto_15954 ) ( IN-CITY ?auto_15950 ?auto_15952 ) ( not ( = ?auto_15945 ?auto_15950 ) ) ( OBJ-AT ?auto_15946 ?auto_15950 ) ( OBJ-AT ?auto_15948 ?auto_15954 ) ( IN-CITY ?auto_15953 ?auto_15952 ) ( not ( = ?auto_15945 ?auto_15953 ) ) ( OBJ-AT ?auto_15949 ?auto_15953 ) ( TRUCK-AT ?auto_15951 ?auto_15945 ) ( not ( = ?auto_15949 ?auto_15948 ) ) ( not ( = ?auto_15954 ?auto_15953 ) ) ( not ( = ?auto_15949 ?auto_15946 ) ) ( not ( = ?auto_15948 ?auto_15946 ) ) ( not ( = ?auto_15950 ?auto_15954 ) ) ( not ( = ?auto_15950 ?auto_15953 ) ) ( not ( = ?auto_15949 ?auto_15947 ) ) ( not ( = ?auto_15948 ?auto_15947 ) ) ( not ( = ?auto_15946 ?auto_15947 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15949 ?auto_15948 ?auto_15947 ?auto_15946 ?auto_15945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16149 - OBJ
      ?auto_16150 - OBJ
      ?auto_16151 - OBJ
      ?auto_16152 - OBJ
      ?auto_16148 - LOCATION
    )
    :vars
    (
      ?auto_16157 - LOCATION
      ?auto_16155 - CITY
      ?auto_16153 - LOCATION
      ?auto_16156 - LOCATION
      ?auto_16154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16157 ?auto_16155 ) ( IN-CITY ?auto_16148 ?auto_16155 ) ( not ( = ?auto_16148 ?auto_16157 ) ) ( OBJ-AT ?auto_16149 ?auto_16157 ) ( IN-CITY ?auto_16153 ?auto_16155 ) ( not ( = ?auto_16148 ?auto_16153 ) ) ( OBJ-AT ?auto_16152 ?auto_16153 ) ( OBJ-AT ?auto_16151 ?auto_16157 ) ( IN-CITY ?auto_16156 ?auto_16155 ) ( not ( = ?auto_16148 ?auto_16156 ) ) ( OBJ-AT ?auto_16150 ?auto_16156 ) ( TRUCK-AT ?auto_16154 ?auto_16148 ) ( not ( = ?auto_16150 ?auto_16151 ) ) ( not ( = ?auto_16157 ?auto_16156 ) ) ( not ( = ?auto_16150 ?auto_16152 ) ) ( not ( = ?auto_16151 ?auto_16152 ) ) ( not ( = ?auto_16153 ?auto_16157 ) ) ( not ( = ?auto_16153 ?auto_16156 ) ) ( not ( = ?auto_16150 ?auto_16149 ) ) ( not ( = ?auto_16151 ?auto_16149 ) ) ( not ( = ?auto_16152 ?auto_16149 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16150 ?auto_16151 ?auto_16149 ?auto_16152 ?auto_16148 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16181 - OBJ
      ?auto_16182 - OBJ
      ?auto_16183 - OBJ
      ?auto_16184 - OBJ
      ?auto_16180 - LOCATION
    )
    :vars
    (
      ?auto_16189 - LOCATION
      ?auto_16187 - CITY
      ?auto_16185 - LOCATION
      ?auto_16188 - LOCATION
      ?auto_16186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16189 ?auto_16187 ) ( IN-CITY ?auto_16180 ?auto_16187 ) ( not ( = ?auto_16180 ?auto_16189 ) ) ( OBJ-AT ?auto_16181 ?auto_16189 ) ( IN-CITY ?auto_16185 ?auto_16187 ) ( not ( = ?auto_16180 ?auto_16185 ) ) ( OBJ-AT ?auto_16183 ?auto_16185 ) ( OBJ-AT ?auto_16184 ?auto_16189 ) ( IN-CITY ?auto_16188 ?auto_16187 ) ( not ( = ?auto_16180 ?auto_16188 ) ) ( OBJ-AT ?auto_16182 ?auto_16188 ) ( TRUCK-AT ?auto_16186 ?auto_16180 ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16189 ?auto_16188 ) ) ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16184 ?auto_16183 ) ) ( not ( = ?auto_16185 ?auto_16189 ) ) ( not ( = ?auto_16185 ?auto_16188 ) ) ( not ( = ?auto_16182 ?auto_16181 ) ) ( not ( = ?auto_16184 ?auto_16181 ) ) ( not ( = ?auto_16183 ?auto_16181 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16182 ?auto_16184 ?auto_16181 ?auto_16183 ?auto_16180 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16281 - OBJ
      ?auto_16282 - OBJ
      ?auto_16283 - OBJ
      ?auto_16284 - OBJ
      ?auto_16280 - LOCATION
    )
    :vars
    (
      ?auto_16289 - LOCATION
      ?auto_16287 - CITY
      ?auto_16285 - LOCATION
      ?auto_16288 - LOCATION
      ?auto_16286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16289 ?auto_16287 ) ( IN-CITY ?auto_16280 ?auto_16287 ) ( not ( = ?auto_16280 ?auto_16289 ) ) ( OBJ-AT ?auto_16281 ?auto_16289 ) ( IN-CITY ?auto_16285 ?auto_16287 ) ( not ( = ?auto_16280 ?auto_16285 ) ) ( OBJ-AT ?auto_16284 ?auto_16285 ) ( OBJ-AT ?auto_16282 ?auto_16289 ) ( IN-CITY ?auto_16288 ?auto_16287 ) ( not ( = ?auto_16280 ?auto_16288 ) ) ( OBJ-AT ?auto_16283 ?auto_16288 ) ( TRUCK-AT ?auto_16286 ?auto_16280 ) ( not ( = ?auto_16283 ?auto_16282 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16285 ?auto_16289 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) ( not ( = ?auto_16283 ?auto_16281 ) ) ( not ( = ?auto_16282 ?auto_16281 ) ) ( not ( = ?auto_16284 ?auto_16281 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16283 ?auto_16282 ?auto_16281 ?auto_16284 ?auto_16280 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16348 - OBJ
      ?auto_16349 - OBJ
      ?auto_16350 - OBJ
      ?auto_16351 - OBJ
      ?auto_16347 - LOCATION
    )
    :vars
    (
      ?auto_16356 - LOCATION
      ?auto_16354 - CITY
      ?auto_16352 - LOCATION
      ?auto_16355 - LOCATION
      ?auto_16353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16356 ?auto_16354 ) ( IN-CITY ?auto_16347 ?auto_16354 ) ( not ( = ?auto_16347 ?auto_16356 ) ) ( OBJ-AT ?auto_16348 ?auto_16356 ) ( IN-CITY ?auto_16352 ?auto_16354 ) ( not ( = ?auto_16347 ?auto_16352 ) ) ( OBJ-AT ?auto_16350 ?auto_16352 ) ( OBJ-AT ?auto_16349 ?auto_16356 ) ( IN-CITY ?auto_16355 ?auto_16354 ) ( not ( = ?auto_16347 ?auto_16355 ) ) ( OBJ-AT ?auto_16351 ?auto_16355 ) ( TRUCK-AT ?auto_16353 ?auto_16347 ) ( not ( = ?auto_16351 ?auto_16349 ) ) ( not ( = ?auto_16356 ?auto_16355 ) ) ( not ( = ?auto_16351 ?auto_16350 ) ) ( not ( = ?auto_16349 ?auto_16350 ) ) ( not ( = ?auto_16352 ?auto_16356 ) ) ( not ( = ?auto_16352 ?auto_16355 ) ) ( not ( = ?auto_16351 ?auto_16348 ) ) ( not ( = ?auto_16349 ?auto_16348 ) ) ( not ( = ?auto_16350 ?auto_16348 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16351 ?auto_16349 ?auto_16348 ?auto_16350 ?auto_16347 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16448 - OBJ
      ?auto_16449 - OBJ
      ?auto_16450 - OBJ
      ?auto_16451 - OBJ
      ?auto_16447 - LOCATION
    )
    :vars
    (
      ?auto_16456 - LOCATION
      ?auto_16454 - CITY
      ?auto_16452 - LOCATION
      ?auto_16455 - LOCATION
      ?auto_16453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16456 ?auto_16454 ) ( IN-CITY ?auto_16447 ?auto_16454 ) ( not ( = ?auto_16447 ?auto_16456 ) ) ( OBJ-AT ?auto_16448 ?auto_16456 ) ( IN-CITY ?auto_16452 ?auto_16454 ) ( not ( = ?auto_16447 ?auto_16452 ) ) ( OBJ-AT ?auto_16449 ?auto_16452 ) ( OBJ-AT ?auto_16451 ?auto_16456 ) ( IN-CITY ?auto_16455 ?auto_16454 ) ( not ( = ?auto_16447 ?auto_16455 ) ) ( OBJ-AT ?auto_16450 ?auto_16455 ) ( TRUCK-AT ?auto_16453 ?auto_16447 ) ( not ( = ?auto_16450 ?auto_16451 ) ) ( not ( = ?auto_16456 ?auto_16455 ) ) ( not ( = ?auto_16450 ?auto_16449 ) ) ( not ( = ?auto_16451 ?auto_16449 ) ) ( not ( = ?auto_16452 ?auto_16456 ) ) ( not ( = ?auto_16452 ?auto_16455 ) ) ( not ( = ?auto_16450 ?auto_16448 ) ) ( not ( = ?auto_16451 ?auto_16448 ) ) ( not ( = ?auto_16449 ?auto_16448 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16450 ?auto_16451 ?auto_16448 ?auto_16449 ?auto_16447 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16480 - OBJ
      ?auto_16481 - OBJ
      ?auto_16482 - OBJ
      ?auto_16483 - OBJ
      ?auto_16479 - LOCATION
    )
    :vars
    (
      ?auto_16488 - LOCATION
      ?auto_16486 - CITY
      ?auto_16484 - LOCATION
      ?auto_16487 - LOCATION
      ?auto_16485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16488 ?auto_16486 ) ( IN-CITY ?auto_16479 ?auto_16486 ) ( not ( = ?auto_16479 ?auto_16488 ) ) ( OBJ-AT ?auto_16480 ?auto_16488 ) ( IN-CITY ?auto_16484 ?auto_16486 ) ( not ( = ?auto_16479 ?auto_16484 ) ) ( OBJ-AT ?auto_16481 ?auto_16484 ) ( OBJ-AT ?auto_16482 ?auto_16488 ) ( IN-CITY ?auto_16487 ?auto_16486 ) ( not ( = ?auto_16479 ?auto_16487 ) ) ( OBJ-AT ?auto_16483 ?auto_16487 ) ( TRUCK-AT ?auto_16485 ?auto_16479 ) ( not ( = ?auto_16483 ?auto_16482 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( not ( = ?auto_16483 ?auto_16481 ) ) ( not ( = ?auto_16482 ?auto_16481 ) ) ( not ( = ?auto_16484 ?auto_16488 ) ) ( not ( = ?auto_16484 ?auto_16487 ) ) ( not ( = ?auto_16483 ?auto_16480 ) ) ( not ( = ?auto_16482 ?auto_16480 ) ) ( not ( = ?auto_16481 ?auto_16480 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16483 ?auto_16482 ?auto_16480 ?auto_16481 ?auto_16479 ) )
  )

)

