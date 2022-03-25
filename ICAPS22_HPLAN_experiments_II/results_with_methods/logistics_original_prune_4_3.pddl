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
      ?auto_134498 - OBJ
      ?auto_134497 - LOCATION
    )
    :vars
    (
      ?auto_134499 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134499 ?auto_134497 ) ( IN-TRUCK ?auto_134498 ?auto_134499 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_134498 ?auto_134499 ?auto_134497 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134516 - OBJ
      ?auto_134515 - LOCATION
    )
    :vars
    (
      ?auto_134517 - TRUCK
      ?auto_134518 - LOCATION
      ?auto_134519 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134516 ?auto_134517 ) ( TRUCK-AT ?auto_134517 ?auto_134518 ) ( IN-CITY ?auto_134518 ?auto_134519 ) ( IN-CITY ?auto_134515 ?auto_134519 ) ( not ( = ?auto_134515 ?auto_134518 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_134517 ?auto_134518 ?auto_134515 ?auto_134519 )
      ( DELIVER-1PKG ?auto_134516 ?auto_134515 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134542 - OBJ
      ?auto_134541 - LOCATION
    )
    :vars
    (
      ?auto_134545 - TRUCK
      ?auto_134543 - LOCATION
      ?auto_134544 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134545 ?auto_134543 ) ( IN-CITY ?auto_134543 ?auto_134544 ) ( IN-CITY ?auto_134541 ?auto_134544 ) ( not ( = ?auto_134541 ?auto_134543 ) ) ( OBJ-AT ?auto_134542 ?auto_134543 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_134542 ?auto_134545 ?auto_134543 )
      ( DELIVER-1PKG ?auto_134542 ?auto_134541 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134568 - OBJ
      ?auto_134567 - LOCATION
    )
    :vars
    (
      ?auto_134569 - LOCATION
      ?auto_134570 - CITY
      ?auto_134571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134569 ?auto_134570 ) ( IN-CITY ?auto_134567 ?auto_134570 ) ( not ( = ?auto_134567 ?auto_134569 ) ) ( OBJ-AT ?auto_134568 ?auto_134569 ) ( TRUCK-AT ?auto_134571 ?auto_134567 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_134571 ?auto_134567 ?auto_134569 ?auto_134570 )
      ( DELIVER-1PKG ?auto_134568 ?auto_134567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134711 - OBJ
      ?auto_134712 - OBJ
      ?auto_134710 - LOCATION
    )
    :vars
    (
      ?auto_134713 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134713 ?auto_134710 ) ( IN-TRUCK ?auto_134712 ?auto_134713 ) ( OBJ-AT ?auto_134711 ?auto_134710 ) ( not ( = ?auto_134711 ?auto_134712 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134712 ?auto_134710 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134715 - OBJ
      ?auto_134716 - OBJ
      ?auto_134714 - LOCATION
    )
    :vars
    (
      ?auto_134717 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134717 ?auto_134714 ) ( IN-TRUCK ?auto_134715 ?auto_134717 ) ( OBJ-AT ?auto_134716 ?auto_134714 ) ( not ( = ?auto_134715 ?auto_134716 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134715 ?auto_134714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134723 - OBJ
      ?auto_134724 - OBJ
      ?auto_134725 - OBJ
      ?auto_134722 - LOCATION
    )
    :vars
    (
      ?auto_134726 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134726 ?auto_134722 ) ( IN-TRUCK ?auto_134725 ?auto_134726 ) ( OBJ-AT ?auto_134723 ?auto_134722 ) ( OBJ-AT ?auto_134724 ?auto_134722 ) ( not ( = ?auto_134723 ?auto_134724 ) ) ( not ( = ?auto_134723 ?auto_134725 ) ) ( not ( = ?auto_134724 ?auto_134725 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134725 ?auto_134722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134728 - OBJ
      ?auto_134729 - OBJ
      ?auto_134730 - OBJ
      ?auto_134727 - LOCATION
    )
    :vars
    (
      ?auto_134731 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134731 ?auto_134727 ) ( IN-TRUCK ?auto_134729 ?auto_134731 ) ( OBJ-AT ?auto_134728 ?auto_134727 ) ( OBJ-AT ?auto_134730 ?auto_134727 ) ( not ( = ?auto_134728 ?auto_134729 ) ) ( not ( = ?auto_134728 ?auto_134730 ) ) ( not ( = ?auto_134729 ?auto_134730 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134729 ?auto_134727 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134738 - OBJ
      ?auto_134739 - OBJ
      ?auto_134740 - OBJ
      ?auto_134737 - LOCATION
    )
    :vars
    (
      ?auto_134741 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134741 ?auto_134737 ) ( IN-TRUCK ?auto_134738 ?auto_134741 ) ( OBJ-AT ?auto_134739 ?auto_134737 ) ( OBJ-AT ?auto_134740 ?auto_134737 ) ( not ( = ?auto_134738 ?auto_134739 ) ) ( not ( = ?auto_134738 ?auto_134740 ) ) ( not ( = ?auto_134739 ?auto_134740 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134738 ?auto_134737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134758 - OBJ
      ?auto_134759 - OBJ
      ?auto_134760 - OBJ
      ?auto_134761 - OBJ
      ?auto_134757 - LOCATION
    )
    :vars
    (
      ?auto_134762 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134762 ?auto_134757 ) ( IN-TRUCK ?auto_134761 ?auto_134762 ) ( OBJ-AT ?auto_134758 ?auto_134757 ) ( OBJ-AT ?auto_134759 ?auto_134757 ) ( OBJ-AT ?auto_134760 ?auto_134757 ) ( not ( = ?auto_134758 ?auto_134759 ) ) ( not ( = ?auto_134758 ?auto_134760 ) ) ( not ( = ?auto_134758 ?auto_134761 ) ) ( not ( = ?auto_134759 ?auto_134760 ) ) ( not ( = ?auto_134759 ?auto_134761 ) ) ( not ( = ?auto_134760 ?auto_134761 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134761 ?auto_134757 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134764 - OBJ
      ?auto_134765 - OBJ
      ?auto_134766 - OBJ
      ?auto_134767 - OBJ
      ?auto_134763 - LOCATION
    )
    :vars
    (
      ?auto_134768 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134768 ?auto_134763 ) ( IN-TRUCK ?auto_134766 ?auto_134768 ) ( OBJ-AT ?auto_134764 ?auto_134763 ) ( OBJ-AT ?auto_134765 ?auto_134763 ) ( OBJ-AT ?auto_134767 ?auto_134763 ) ( not ( = ?auto_134764 ?auto_134765 ) ) ( not ( = ?auto_134764 ?auto_134766 ) ) ( not ( = ?auto_134764 ?auto_134767 ) ) ( not ( = ?auto_134765 ?auto_134766 ) ) ( not ( = ?auto_134765 ?auto_134767 ) ) ( not ( = ?auto_134766 ?auto_134767 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134766 ?auto_134763 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134776 - OBJ
      ?auto_134777 - OBJ
      ?auto_134778 - OBJ
      ?auto_134779 - OBJ
      ?auto_134775 - LOCATION
    )
    :vars
    (
      ?auto_134780 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134780 ?auto_134775 ) ( IN-TRUCK ?auto_134777 ?auto_134780 ) ( OBJ-AT ?auto_134776 ?auto_134775 ) ( OBJ-AT ?auto_134778 ?auto_134775 ) ( OBJ-AT ?auto_134779 ?auto_134775 ) ( not ( = ?auto_134776 ?auto_134777 ) ) ( not ( = ?auto_134776 ?auto_134778 ) ) ( not ( = ?auto_134776 ?auto_134779 ) ) ( not ( = ?auto_134777 ?auto_134778 ) ) ( not ( = ?auto_134777 ?auto_134779 ) ) ( not ( = ?auto_134778 ?auto_134779 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134777 ?auto_134775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134800 - OBJ
      ?auto_134801 - OBJ
      ?auto_134802 - OBJ
      ?auto_134803 - OBJ
      ?auto_134799 - LOCATION
    )
    :vars
    (
      ?auto_134804 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134804 ?auto_134799 ) ( IN-TRUCK ?auto_134800 ?auto_134804 ) ( OBJ-AT ?auto_134801 ?auto_134799 ) ( OBJ-AT ?auto_134802 ?auto_134799 ) ( OBJ-AT ?auto_134803 ?auto_134799 ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134800 ?auto_134803 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134803 ) ) ( not ( = ?auto_134802 ?auto_134803 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134800 ?auto_134799 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134853 - OBJ
      ?auto_134854 - OBJ
      ?auto_134852 - LOCATION
    )
    :vars
    (
      ?auto_134855 - TRUCK
      ?auto_134856 - LOCATION
      ?auto_134857 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134854 ?auto_134855 ) ( TRUCK-AT ?auto_134855 ?auto_134856 ) ( IN-CITY ?auto_134856 ?auto_134857 ) ( IN-CITY ?auto_134852 ?auto_134857 ) ( not ( = ?auto_134852 ?auto_134856 ) ) ( OBJ-AT ?auto_134853 ?auto_134852 ) ( not ( = ?auto_134853 ?auto_134854 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134854 ?auto_134852 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134859 - OBJ
      ?auto_134860 - OBJ
      ?auto_134858 - LOCATION
    )
    :vars
    (
      ?auto_134863 - TRUCK
      ?auto_134862 - LOCATION
      ?auto_134861 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134859 ?auto_134863 ) ( TRUCK-AT ?auto_134863 ?auto_134862 ) ( IN-CITY ?auto_134862 ?auto_134861 ) ( IN-CITY ?auto_134858 ?auto_134861 ) ( not ( = ?auto_134858 ?auto_134862 ) ) ( OBJ-AT ?auto_134860 ?auto_134858 ) ( not ( = ?auto_134860 ?auto_134859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134860 ?auto_134859 ?auto_134858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134872 - OBJ
      ?auto_134873 - OBJ
      ?auto_134874 - OBJ
      ?auto_134871 - LOCATION
    )
    :vars
    (
      ?auto_134877 - TRUCK
      ?auto_134876 - LOCATION
      ?auto_134875 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134874 ?auto_134877 ) ( TRUCK-AT ?auto_134877 ?auto_134876 ) ( IN-CITY ?auto_134876 ?auto_134875 ) ( IN-CITY ?auto_134871 ?auto_134875 ) ( not ( = ?auto_134871 ?auto_134876 ) ) ( OBJ-AT ?auto_134873 ?auto_134871 ) ( not ( = ?auto_134873 ?auto_134874 ) ) ( OBJ-AT ?auto_134872 ?auto_134871 ) ( not ( = ?auto_134872 ?auto_134873 ) ) ( not ( = ?auto_134872 ?auto_134874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134873 ?auto_134874 ?auto_134871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134879 - OBJ
      ?auto_134880 - OBJ
      ?auto_134881 - OBJ
      ?auto_134878 - LOCATION
    )
    :vars
    (
      ?auto_134884 - TRUCK
      ?auto_134883 - LOCATION
      ?auto_134882 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134880 ?auto_134884 ) ( TRUCK-AT ?auto_134884 ?auto_134883 ) ( IN-CITY ?auto_134883 ?auto_134882 ) ( IN-CITY ?auto_134878 ?auto_134882 ) ( not ( = ?auto_134878 ?auto_134883 ) ) ( OBJ-AT ?auto_134881 ?auto_134878 ) ( not ( = ?auto_134881 ?auto_134880 ) ) ( OBJ-AT ?auto_134879 ?auto_134878 ) ( not ( = ?auto_134879 ?auto_134880 ) ) ( not ( = ?auto_134879 ?auto_134881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134881 ?auto_134880 ?auto_134878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134893 - OBJ
      ?auto_134894 - OBJ
      ?auto_134895 - OBJ
      ?auto_134892 - LOCATION
    )
    :vars
    (
      ?auto_134898 - TRUCK
      ?auto_134897 - LOCATION
      ?auto_134896 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134893 ?auto_134898 ) ( TRUCK-AT ?auto_134898 ?auto_134897 ) ( IN-CITY ?auto_134897 ?auto_134896 ) ( IN-CITY ?auto_134892 ?auto_134896 ) ( not ( = ?auto_134892 ?auto_134897 ) ) ( OBJ-AT ?auto_134894 ?auto_134892 ) ( not ( = ?auto_134894 ?auto_134893 ) ) ( OBJ-AT ?auto_134895 ?auto_134892 ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134894 ?auto_134893 ?auto_134892 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134922 - OBJ
      ?auto_134923 - OBJ
      ?auto_134924 - OBJ
      ?auto_134925 - OBJ
      ?auto_134921 - LOCATION
    )
    :vars
    (
      ?auto_134928 - TRUCK
      ?auto_134927 - LOCATION
      ?auto_134926 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134925 ?auto_134928 ) ( TRUCK-AT ?auto_134928 ?auto_134927 ) ( IN-CITY ?auto_134927 ?auto_134926 ) ( IN-CITY ?auto_134921 ?auto_134926 ) ( not ( = ?auto_134921 ?auto_134927 ) ) ( OBJ-AT ?auto_134923 ?auto_134921 ) ( not ( = ?auto_134923 ?auto_134925 ) ) ( OBJ-AT ?auto_134922 ?auto_134921 ) ( OBJ-AT ?auto_134924 ?auto_134921 ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134924 ) ) ( not ( = ?auto_134922 ?auto_134925 ) ) ( not ( = ?auto_134923 ?auto_134924 ) ) ( not ( = ?auto_134924 ?auto_134925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134923 ?auto_134925 ?auto_134921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134930 - OBJ
      ?auto_134931 - OBJ
      ?auto_134932 - OBJ
      ?auto_134933 - OBJ
      ?auto_134929 - LOCATION
    )
    :vars
    (
      ?auto_134936 - TRUCK
      ?auto_134935 - LOCATION
      ?auto_134934 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134932 ?auto_134936 ) ( TRUCK-AT ?auto_134936 ?auto_134935 ) ( IN-CITY ?auto_134935 ?auto_134934 ) ( IN-CITY ?auto_134929 ?auto_134934 ) ( not ( = ?auto_134929 ?auto_134935 ) ) ( OBJ-AT ?auto_134933 ?auto_134929 ) ( not ( = ?auto_134933 ?auto_134932 ) ) ( OBJ-AT ?auto_134930 ?auto_134929 ) ( OBJ-AT ?auto_134931 ?auto_134929 ) ( not ( = ?auto_134930 ?auto_134931 ) ) ( not ( = ?auto_134930 ?auto_134932 ) ) ( not ( = ?auto_134930 ?auto_134933 ) ) ( not ( = ?auto_134931 ?auto_134932 ) ) ( not ( = ?auto_134931 ?auto_134933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134933 ?auto_134932 ?auto_134929 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134946 - OBJ
      ?auto_134947 - OBJ
      ?auto_134948 - OBJ
      ?auto_134949 - OBJ
      ?auto_134945 - LOCATION
    )
    :vars
    (
      ?auto_134952 - TRUCK
      ?auto_134951 - LOCATION
      ?auto_134950 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134947 ?auto_134952 ) ( TRUCK-AT ?auto_134952 ?auto_134951 ) ( IN-CITY ?auto_134951 ?auto_134950 ) ( IN-CITY ?auto_134945 ?auto_134950 ) ( not ( = ?auto_134945 ?auto_134951 ) ) ( OBJ-AT ?auto_134946 ?auto_134945 ) ( not ( = ?auto_134946 ?auto_134947 ) ) ( OBJ-AT ?auto_134948 ?auto_134945 ) ( OBJ-AT ?auto_134949 ?auto_134945 ) ( not ( = ?auto_134946 ?auto_134948 ) ) ( not ( = ?auto_134946 ?auto_134949 ) ) ( not ( = ?auto_134947 ?auto_134948 ) ) ( not ( = ?auto_134947 ?auto_134949 ) ) ( not ( = ?auto_134948 ?auto_134949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134946 ?auto_134947 ?auto_134945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134978 - OBJ
      ?auto_134979 - OBJ
      ?auto_134980 - OBJ
      ?auto_134981 - OBJ
      ?auto_134977 - LOCATION
    )
    :vars
    (
      ?auto_134984 - TRUCK
      ?auto_134983 - LOCATION
      ?auto_134982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134978 ?auto_134984 ) ( TRUCK-AT ?auto_134984 ?auto_134983 ) ( IN-CITY ?auto_134983 ?auto_134982 ) ( IN-CITY ?auto_134977 ?auto_134982 ) ( not ( = ?auto_134977 ?auto_134983 ) ) ( OBJ-AT ?auto_134979 ?auto_134977 ) ( not ( = ?auto_134979 ?auto_134978 ) ) ( OBJ-AT ?auto_134980 ?auto_134977 ) ( OBJ-AT ?auto_134981 ?auto_134977 ) ( not ( = ?auto_134978 ?auto_134980 ) ) ( not ( = ?auto_134978 ?auto_134981 ) ) ( not ( = ?auto_134979 ?auto_134980 ) ) ( not ( = ?auto_134979 ?auto_134981 ) ) ( not ( = ?auto_134980 ?auto_134981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134979 ?auto_134978 ?auto_134977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135043 - OBJ
      ?auto_135042 - LOCATION
    )
    :vars
    (
      ?auto_135047 - TRUCK
      ?auto_135046 - LOCATION
      ?auto_135045 - CITY
      ?auto_135044 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135047 ?auto_135046 ) ( IN-CITY ?auto_135046 ?auto_135045 ) ( IN-CITY ?auto_135042 ?auto_135045 ) ( not ( = ?auto_135042 ?auto_135046 ) ) ( OBJ-AT ?auto_135044 ?auto_135042 ) ( not ( = ?auto_135044 ?auto_135043 ) ) ( OBJ-AT ?auto_135043 ?auto_135046 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135043 ?auto_135047 ?auto_135046 )
      ( DELIVER-2PKG ?auto_135044 ?auto_135043 ?auto_135042 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135049 - OBJ
      ?auto_135050 - OBJ
      ?auto_135048 - LOCATION
    )
    :vars
    (
      ?auto_135052 - TRUCK
      ?auto_135051 - LOCATION
      ?auto_135053 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135052 ?auto_135051 ) ( IN-CITY ?auto_135051 ?auto_135053 ) ( IN-CITY ?auto_135048 ?auto_135053 ) ( not ( = ?auto_135048 ?auto_135051 ) ) ( OBJ-AT ?auto_135049 ?auto_135048 ) ( not ( = ?auto_135049 ?auto_135050 ) ) ( OBJ-AT ?auto_135050 ?auto_135051 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135050 ?auto_135048 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135055 - OBJ
      ?auto_135056 - OBJ
      ?auto_135054 - LOCATION
    )
    :vars
    (
      ?auto_135058 - TRUCK
      ?auto_135057 - LOCATION
      ?auto_135059 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135058 ?auto_135057 ) ( IN-CITY ?auto_135057 ?auto_135059 ) ( IN-CITY ?auto_135054 ?auto_135059 ) ( not ( = ?auto_135054 ?auto_135057 ) ) ( OBJ-AT ?auto_135056 ?auto_135054 ) ( not ( = ?auto_135056 ?auto_135055 ) ) ( OBJ-AT ?auto_135055 ?auto_135057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135056 ?auto_135055 ?auto_135054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135068 - OBJ
      ?auto_135069 - OBJ
      ?auto_135070 - OBJ
      ?auto_135067 - LOCATION
    )
    :vars
    (
      ?auto_135072 - TRUCK
      ?auto_135071 - LOCATION
      ?auto_135073 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135072 ?auto_135071 ) ( IN-CITY ?auto_135071 ?auto_135073 ) ( IN-CITY ?auto_135067 ?auto_135073 ) ( not ( = ?auto_135067 ?auto_135071 ) ) ( OBJ-AT ?auto_135069 ?auto_135067 ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( OBJ-AT ?auto_135070 ?auto_135071 ) ( OBJ-AT ?auto_135068 ?auto_135067 ) ( not ( = ?auto_135068 ?auto_135069 ) ) ( not ( = ?auto_135068 ?auto_135070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135069 ?auto_135070 ?auto_135067 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135075 - OBJ
      ?auto_135076 - OBJ
      ?auto_135077 - OBJ
      ?auto_135074 - LOCATION
    )
    :vars
    (
      ?auto_135079 - TRUCK
      ?auto_135078 - LOCATION
      ?auto_135080 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135079 ?auto_135078 ) ( IN-CITY ?auto_135078 ?auto_135080 ) ( IN-CITY ?auto_135074 ?auto_135080 ) ( not ( = ?auto_135074 ?auto_135078 ) ) ( OBJ-AT ?auto_135075 ?auto_135074 ) ( not ( = ?auto_135075 ?auto_135076 ) ) ( OBJ-AT ?auto_135076 ?auto_135078 ) ( OBJ-AT ?auto_135077 ?auto_135074 ) ( not ( = ?auto_135075 ?auto_135077 ) ) ( not ( = ?auto_135076 ?auto_135077 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135075 ?auto_135076 ?auto_135074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135089 - OBJ
      ?auto_135090 - OBJ
      ?auto_135091 - OBJ
      ?auto_135088 - LOCATION
    )
    :vars
    (
      ?auto_135093 - TRUCK
      ?auto_135092 - LOCATION
      ?auto_135094 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135093 ?auto_135092 ) ( IN-CITY ?auto_135092 ?auto_135094 ) ( IN-CITY ?auto_135088 ?auto_135094 ) ( not ( = ?auto_135088 ?auto_135092 ) ) ( OBJ-AT ?auto_135090 ?auto_135088 ) ( not ( = ?auto_135090 ?auto_135089 ) ) ( OBJ-AT ?auto_135089 ?auto_135092 ) ( OBJ-AT ?auto_135091 ?auto_135088 ) ( not ( = ?auto_135089 ?auto_135091 ) ) ( not ( = ?auto_135090 ?auto_135091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135090 ?auto_135089 ?auto_135088 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135118 - OBJ
      ?auto_135119 - OBJ
      ?auto_135120 - OBJ
      ?auto_135121 - OBJ
      ?auto_135117 - LOCATION
    )
    :vars
    (
      ?auto_135123 - TRUCK
      ?auto_135122 - LOCATION
      ?auto_135124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135123 ?auto_135122 ) ( IN-CITY ?auto_135122 ?auto_135124 ) ( IN-CITY ?auto_135117 ?auto_135124 ) ( not ( = ?auto_135117 ?auto_135122 ) ) ( OBJ-AT ?auto_135118 ?auto_135117 ) ( not ( = ?auto_135118 ?auto_135121 ) ) ( OBJ-AT ?auto_135121 ?auto_135122 ) ( OBJ-AT ?auto_135119 ?auto_135117 ) ( OBJ-AT ?auto_135120 ?auto_135117 ) ( not ( = ?auto_135118 ?auto_135119 ) ) ( not ( = ?auto_135118 ?auto_135120 ) ) ( not ( = ?auto_135119 ?auto_135120 ) ) ( not ( = ?auto_135119 ?auto_135121 ) ) ( not ( = ?auto_135120 ?auto_135121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135118 ?auto_135121 ?auto_135117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135126 - OBJ
      ?auto_135127 - OBJ
      ?auto_135128 - OBJ
      ?auto_135129 - OBJ
      ?auto_135125 - LOCATION
    )
    :vars
    (
      ?auto_135131 - TRUCK
      ?auto_135130 - LOCATION
      ?auto_135132 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135131 ?auto_135130 ) ( IN-CITY ?auto_135130 ?auto_135132 ) ( IN-CITY ?auto_135125 ?auto_135132 ) ( not ( = ?auto_135125 ?auto_135130 ) ) ( OBJ-AT ?auto_135129 ?auto_135125 ) ( not ( = ?auto_135129 ?auto_135128 ) ) ( OBJ-AT ?auto_135128 ?auto_135130 ) ( OBJ-AT ?auto_135126 ?auto_135125 ) ( OBJ-AT ?auto_135127 ?auto_135125 ) ( not ( = ?auto_135126 ?auto_135127 ) ) ( not ( = ?auto_135126 ?auto_135128 ) ) ( not ( = ?auto_135126 ?auto_135129 ) ) ( not ( = ?auto_135127 ?auto_135128 ) ) ( not ( = ?auto_135127 ?auto_135129 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135129 ?auto_135128 ?auto_135125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135142 - OBJ
      ?auto_135143 - OBJ
      ?auto_135144 - OBJ
      ?auto_135145 - OBJ
      ?auto_135141 - LOCATION
    )
    :vars
    (
      ?auto_135147 - TRUCK
      ?auto_135146 - LOCATION
      ?auto_135148 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135147 ?auto_135146 ) ( IN-CITY ?auto_135146 ?auto_135148 ) ( IN-CITY ?auto_135141 ?auto_135148 ) ( not ( = ?auto_135141 ?auto_135146 ) ) ( OBJ-AT ?auto_135145 ?auto_135141 ) ( not ( = ?auto_135145 ?auto_135143 ) ) ( OBJ-AT ?auto_135143 ?auto_135146 ) ( OBJ-AT ?auto_135142 ?auto_135141 ) ( OBJ-AT ?auto_135144 ?auto_135141 ) ( not ( = ?auto_135142 ?auto_135143 ) ) ( not ( = ?auto_135142 ?auto_135144 ) ) ( not ( = ?auto_135142 ?auto_135145 ) ) ( not ( = ?auto_135143 ?auto_135144 ) ) ( not ( = ?auto_135144 ?auto_135145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135145 ?auto_135143 ?auto_135141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135174 - OBJ
      ?auto_135175 - OBJ
      ?auto_135176 - OBJ
      ?auto_135177 - OBJ
      ?auto_135173 - LOCATION
    )
    :vars
    (
      ?auto_135179 - TRUCK
      ?auto_135178 - LOCATION
      ?auto_135180 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135179 ?auto_135178 ) ( IN-CITY ?auto_135178 ?auto_135180 ) ( IN-CITY ?auto_135173 ?auto_135180 ) ( not ( = ?auto_135173 ?auto_135178 ) ) ( OBJ-AT ?auto_135175 ?auto_135173 ) ( not ( = ?auto_135175 ?auto_135174 ) ) ( OBJ-AT ?auto_135174 ?auto_135178 ) ( OBJ-AT ?auto_135176 ?auto_135173 ) ( OBJ-AT ?auto_135177 ?auto_135173 ) ( not ( = ?auto_135174 ?auto_135176 ) ) ( not ( = ?auto_135174 ?auto_135177 ) ) ( not ( = ?auto_135175 ?auto_135176 ) ) ( not ( = ?auto_135175 ?auto_135177 ) ) ( not ( = ?auto_135176 ?auto_135177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135175 ?auto_135174 ?auto_135173 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135239 - OBJ
      ?auto_135238 - LOCATION
    )
    :vars
    (
      ?auto_135241 - LOCATION
      ?auto_135243 - CITY
      ?auto_135240 - OBJ
      ?auto_135242 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135241 ?auto_135243 ) ( IN-CITY ?auto_135238 ?auto_135243 ) ( not ( = ?auto_135238 ?auto_135241 ) ) ( OBJ-AT ?auto_135240 ?auto_135238 ) ( not ( = ?auto_135240 ?auto_135239 ) ) ( OBJ-AT ?auto_135239 ?auto_135241 ) ( TRUCK-AT ?auto_135242 ?auto_135238 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135242 ?auto_135238 ?auto_135241 ?auto_135243 )
      ( DELIVER-2PKG ?auto_135240 ?auto_135239 ?auto_135238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135245 - OBJ
      ?auto_135246 - OBJ
      ?auto_135244 - LOCATION
    )
    :vars
    (
      ?auto_135248 - LOCATION
      ?auto_135247 - CITY
      ?auto_135249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135248 ?auto_135247 ) ( IN-CITY ?auto_135244 ?auto_135247 ) ( not ( = ?auto_135244 ?auto_135248 ) ) ( OBJ-AT ?auto_135245 ?auto_135244 ) ( not ( = ?auto_135245 ?auto_135246 ) ) ( OBJ-AT ?auto_135246 ?auto_135248 ) ( TRUCK-AT ?auto_135249 ?auto_135244 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135246 ?auto_135244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135251 - OBJ
      ?auto_135252 - OBJ
      ?auto_135250 - LOCATION
    )
    :vars
    (
      ?auto_135255 - LOCATION
      ?auto_135253 - CITY
      ?auto_135254 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135255 ?auto_135253 ) ( IN-CITY ?auto_135250 ?auto_135253 ) ( not ( = ?auto_135250 ?auto_135255 ) ) ( OBJ-AT ?auto_135252 ?auto_135250 ) ( not ( = ?auto_135252 ?auto_135251 ) ) ( OBJ-AT ?auto_135251 ?auto_135255 ) ( TRUCK-AT ?auto_135254 ?auto_135250 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135252 ?auto_135251 ?auto_135250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135264 - OBJ
      ?auto_135265 - OBJ
      ?auto_135266 - OBJ
      ?auto_135263 - LOCATION
    )
    :vars
    (
      ?auto_135269 - LOCATION
      ?auto_135267 - CITY
      ?auto_135268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135269 ?auto_135267 ) ( IN-CITY ?auto_135263 ?auto_135267 ) ( not ( = ?auto_135263 ?auto_135269 ) ) ( OBJ-AT ?auto_135264 ?auto_135263 ) ( not ( = ?auto_135264 ?auto_135266 ) ) ( OBJ-AT ?auto_135266 ?auto_135269 ) ( TRUCK-AT ?auto_135268 ?auto_135263 ) ( OBJ-AT ?auto_135265 ?auto_135263 ) ( not ( = ?auto_135264 ?auto_135265 ) ) ( not ( = ?auto_135265 ?auto_135266 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135264 ?auto_135266 ?auto_135263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135271 - OBJ
      ?auto_135272 - OBJ
      ?auto_135273 - OBJ
      ?auto_135270 - LOCATION
    )
    :vars
    (
      ?auto_135276 - LOCATION
      ?auto_135274 - CITY
      ?auto_135275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135276 ?auto_135274 ) ( IN-CITY ?auto_135270 ?auto_135274 ) ( not ( = ?auto_135270 ?auto_135276 ) ) ( OBJ-AT ?auto_135273 ?auto_135270 ) ( not ( = ?auto_135273 ?auto_135272 ) ) ( OBJ-AT ?auto_135272 ?auto_135276 ) ( TRUCK-AT ?auto_135275 ?auto_135270 ) ( OBJ-AT ?auto_135271 ?auto_135270 ) ( not ( = ?auto_135271 ?auto_135272 ) ) ( not ( = ?auto_135271 ?auto_135273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135273 ?auto_135272 ?auto_135270 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135285 - OBJ
      ?auto_135286 - OBJ
      ?auto_135287 - OBJ
      ?auto_135284 - LOCATION
    )
    :vars
    (
      ?auto_135290 - LOCATION
      ?auto_135288 - CITY
      ?auto_135289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135290 ?auto_135288 ) ( IN-CITY ?auto_135284 ?auto_135288 ) ( not ( = ?auto_135284 ?auto_135290 ) ) ( OBJ-AT ?auto_135286 ?auto_135284 ) ( not ( = ?auto_135286 ?auto_135285 ) ) ( OBJ-AT ?auto_135285 ?auto_135290 ) ( TRUCK-AT ?auto_135289 ?auto_135284 ) ( OBJ-AT ?auto_135287 ?auto_135284 ) ( not ( = ?auto_135285 ?auto_135287 ) ) ( not ( = ?auto_135286 ?auto_135287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135286 ?auto_135285 ?auto_135284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135314 - OBJ
      ?auto_135315 - OBJ
      ?auto_135316 - OBJ
      ?auto_135317 - OBJ
      ?auto_135313 - LOCATION
    )
    :vars
    (
      ?auto_135320 - LOCATION
      ?auto_135318 - CITY
      ?auto_135319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135320 ?auto_135318 ) ( IN-CITY ?auto_135313 ?auto_135318 ) ( not ( = ?auto_135313 ?auto_135320 ) ) ( OBJ-AT ?auto_135316 ?auto_135313 ) ( not ( = ?auto_135316 ?auto_135317 ) ) ( OBJ-AT ?auto_135317 ?auto_135320 ) ( TRUCK-AT ?auto_135319 ?auto_135313 ) ( OBJ-AT ?auto_135314 ?auto_135313 ) ( OBJ-AT ?auto_135315 ?auto_135313 ) ( not ( = ?auto_135314 ?auto_135315 ) ) ( not ( = ?auto_135314 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135317 ) ) ( not ( = ?auto_135315 ?auto_135316 ) ) ( not ( = ?auto_135315 ?auto_135317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135316 ?auto_135317 ?auto_135313 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135322 - OBJ
      ?auto_135323 - OBJ
      ?auto_135324 - OBJ
      ?auto_135325 - OBJ
      ?auto_135321 - LOCATION
    )
    :vars
    (
      ?auto_135328 - LOCATION
      ?auto_135326 - CITY
      ?auto_135327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135328 ?auto_135326 ) ( IN-CITY ?auto_135321 ?auto_135326 ) ( not ( = ?auto_135321 ?auto_135328 ) ) ( OBJ-AT ?auto_135322 ?auto_135321 ) ( not ( = ?auto_135322 ?auto_135324 ) ) ( OBJ-AT ?auto_135324 ?auto_135328 ) ( TRUCK-AT ?auto_135327 ?auto_135321 ) ( OBJ-AT ?auto_135323 ?auto_135321 ) ( OBJ-AT ?auto_135325 ?auto_135321 ) ( not ( = ?auto_135322 ?auto_135323 ) ) ( not ( = ?auto_135322 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135324 ) ) ( not ( = ?auto_135323 ?auto_135325 ) ) ( not ( = ?auto_135324 ?auto_135325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135322 ?auto_135324 ?auto_135321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135338 - OBJ
      ?auto_135339 - OBJ
      ?auto_135340 - OBJ
      ?auto_135341 - OBJ
      ?auto_135337 - LOCATION
    )
    :vars
    (
      ?auto_135344 - LOCATION
      ?auto_135342 - CITY
      ?auto_135343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135344 ?auto_135342 ) ( IN-CITY ?auto_135337 ?auto_135342 ) ( not ( = ?auto_135337 ?auto_135344 ) ) ( OBJ-AT ?auto_135340 ?auto_135337 ) ( not ( = ?auto_135340 ?auto_135339 ) ) ( OBJ-AT ?auto_135339 ?auto_135344 ) ( TRUCK-AT ?auto_135343 ?auto_135337 ) ( OBJ-AT ?auto_135338 ?auto_135337 ) ( OBJ-AT ?auto_135341 ?auto_135337 ) ( not ( = ?auto_135338 ?auto_135339 ) ) ( not ( = ?auto_135338 ?auto_135340 ) ) ( not ( = ?auto_135338 ?auto_135341 ) ) ( not ( = ?auto_135339 ?auto_135341 ) ) ( not ( = ?auto_135340 ?auto_135341 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135340 ?auto_135339 ?auto_135337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135370 - OBJ
      ?auto_135371 - OBJ
      ?auto_135372 - OBJ
      ?auto_135373 - OBJ
      ?auto_135369 - LOCATION
    )
    :vars
    (
      ?auto_135376 - LOCATION
      ?auto_135374 - CITY
      ?auto_135375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135376 ?auto_135374 ) ( IN-CITY ?auto_135369 ?auto_135374 ) ( not ( = ?auto_135369 ?auto_135376 ) ) ( OBJ-AT ?auto_135371 ?auto_135369 ) ( not ( = ?auto_135371 ?auto_135370 ) ) ( OBJ-AT ?auto_135370 ?auto_135376 ) ( TRUCK-AT ?auto_135375 ?auto_135369 ) ( OBJ-AT ?auto_135372 ?auto_135369 ) ( OBJ-AT ?auto_135373 ?auto_135369 ) ( not ( = ?auto_135370 ?auto_135372 ) ) ( not ( = ?auto_135370 ?auto_135373 ) ) ( not ( = ?auto_135371 ?auto_135372 ) ) ( not ( = ?auto_135371 ?auto_135373 ) ) ( not ( = ?auto_135372 ?auto_135373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135371 ?auto_135370 ?auto_135369 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135435 - OBJ
      ?auto_135434 - LOCATION
    )
    :vars
    (
      ?auto_135439 - LOCATION
      ?auto_135436 - CITY
      ?auto_135438 - OBJ
      ?auto_135437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135439 ?auto_135436 ) ( IN-CITY ?auto_135434 ?auto_135436 ) ( not ( = ?auto_135434 ?auto_135439 ) ) ( not ( = ?auto_135438 ?auto_135435 ) ) ( OBJ-AT ?auto_135435 ?auto_135439 ) ( TRUCK-AT ?auto_135437 ?auto_135434 ) ( IN-TRUCK ?auto_135438 ?auto_135437 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135438 ?auto_135434 )
      ( DELIVER-2PKG ?auto_135438 ?auto_135435 ?auto_135434 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135441 - OBJ
      ?auto_135442 - OBJ
      ?auto_135440 - LOCATION
    )
    :vars
    (
      ?auto_135445 - LOCATION
      ?auto_135443 - CITY
      ?auto_135444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135445 ?auto_135443 ) ( IN-CITY ?auto_135440 ?auto_135443 ) ( not ( = ?auto_135440 ?auto_135445 ) ) ( not ( = ?auto_135441 ?auto_135442 ) ) ( OBJ-AT ?auto_135442 ?auto_135445 ) ( TRUCK-AT ?auto_135444 ?auto_135440 ) ( IN-TRUCK ?auto_135441 ?auto_135444 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135442 ?auto_135440 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135447 - OBJ
      ?auto_135448 - OBJ
      ?auto_135446 - LOCATION
    )
    :vars
    (
      ?auto_135449 - LOCATION
      ?auto_135451 - CITY
      ?auto_135450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135449 ?auto_135451 ) ( IN-CITY ?auto_135446 ?auto_135451 ) ( not ( = ?auto_135446 ?auto_135449 ) ) ( not ( = ?auto_135448 ?auto_135447 ) ) ( OBJ-AT ?auto_135447 ?auto_135449 ) ( TRUCK-AT ?auto_135450 ?auto_135446 ) ( IN-TRUCK ?auto_135448 ?auto_135450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135448 ?auto_135447 ?auto_135446 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135631 - OBJ
      ?auto_135630 - LOCATION
    )
    :vars
    (
      ?auto_135632 - LOCATION
      ?auto_135635 - CITY
      ?auto_135633 - OBJ
      ?auto_135634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135632 ?auto_135635 ) ( IN-CITY ?auto_135630 ?auto_135635 ) ( not ( = ?auto_135630 ?auto_135632 ) ) ( not ( = ?auto_135633 ?auto_135631 ) ) ( OBJ-AT ?auto_135631 ?auto_135632 ) ( IN-TRUCK ?auto_135633 ?auto_135634 ) ( TRUCK-AT ?auto_135634 ?auto_135632 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135634 ?auto_135632 ?auto_135630 ?auto_135635 )
      ( DELIVER-2PKG ?auto_135633 ?auto_135631 ?auto_135630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135637 - OBJ
      ?auto_135638 - OBJ
      ?auto_135636 - LOCATION
    )
    :vars
    (
      ?auto_135639 - LOCATION
      ?auto_135641 - CITY
      ?auto_135640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135639 ?auto_135641 ) ( IN-CITY ?auto_135636 ?auto_135641 ) ( not ( = ?auto_135636 ?auto_135639 ) ) ( not ( = ?auto_135637 ?auto_135638 ) ) ( OBJ-AT ?auto_135638 ?auto_135639 ) ( IN-TRUCK ?auto_135637 ?auto_135640 ) ( TRUCK-AT ?auto_135640 ?auto_135639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135638 ?auto_135636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135643 - OBJ
      ?auto_135644 - OBJ
      ?auto_135642 - LOCATION
    )
    :vars
    (
      ?auto_135645 - LOCATION
      ?auto_135646 - CITY
      ?auto_135647 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135645 ?auto_135646 ) ( IN-CITY ?auto_135642 ?auto_135646 ) ( not ( = ?auto_135642 ?auto_135645 ) ) ( not ( = ?auto_135644 ?auto_135643 ) ) ( OBJ-AT ?auto_135643 ?auto_135645 ) ( IN-TRUCK ?auto_135644 ?auto_135647 ) ( TRUCK-AT ?auto_135647 ?auto_135645 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135644 ?auto_135643 ?auto_135642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137164 - OBJ
      ?auto_137165 - OBJ
      ?auto_137166 - OBJ
      ?auto_137163 - LOCATION
    )
    :vars
    (
      ?auto_137168 - TRUCK
      ?auto_137167 - LOCATION
      ?auto_137169 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137165 ?auto_137168 ) ( TRUCK-AT ?auto_137168 ?auto_137167 ) ( IN-CITY ?auto_137167 ?auto_137169 ) ( IN-CITY ?auto_137163 ?auto_137169 ) ( not ( = ?auto_137163 ?auto_137167 ) ) ( OBJ-AT ?auto_137164 ?auto_137163 ) ( not ( = ?auto_137164 ?auto_137165 ) ) ( OBJ-AT ?auto_137166 ?auto_137163 ) ( not ( = ?auto_137164 ?auto_137166 ) ) ( not ( = ?auto_137165 ?auto_137166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137164 ?auto_137165 ?auto_137163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137186 - OBJ
      ?auto_137187 - OBJ
      ?auto_137188 - OBJ
      ?auto_137185 - LOCATION
    )
    :vars
    (
      ?auto_137191 - TRUCK
      ?auto_137189 - LOCATION
      ?auto_137192 - CITY
      ?auto_137190 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137188 ?auto_137191 ) ( TRUCK-AT ?auto_137191 ?auto_137189 ) ( IN-CITY ?auto_137189 ?auto_137192 ) ( IN-CITY ?auto_137185 ?auto_137192 ) ( not ( = ?auto_137185 ?auto_137189 ) ) ( OBJ-AT ?auto_137190 ?auto_137185 ) ( not ( = ?auto_137190 ?auto_137188 ) ) ( OBJ-AT ?auto_137186 ?auto_137185 ) ( OBJ-AT ?auto_137187 ?auto_137185 ) ( not ( = ?auto_137186 ?auto_137187 ) ) ( not ( = ?auto_137186 ?auto_137188 ) ) ( not ( = ?auto_137186 ?auto_137190 ) ) ( not ( = ?auto_137187 ?auto_137188 ) ) ( not ( = ?auto_137187 ?auto_137190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137190 ?auto_137188 ?auto_137185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137198 - OBJ
      ?auto_137199 - OBJ
      ?auto_137200 - OBJ
      ?auto_137197 - LOCATION
    )
    :vars
    (
      ?auto_137203 - TRUCK
      ?auto_137201 - LOCATION
      ?auto_137204 - CITY
      ?auto_137202 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137199 ?auto_137203 ) ( TRUCK-AT ?auto_137203 ?auto_137201 ) ( IN-CITY ?auto_137201 ?auto_137204 ) ( IN-CITY ?auto_137197 ?auto_137204 ) ( not ( = ?auto_137197 ?auto_137201 ) ) ( OBJ-AT ?auto_137202 ?auto_137197 ) ( not ( = ?auto_137202 ?auto_137199 ) ) ( OBJ-AT ?auto_137198 ?auto_137197 ) ( OBJ-AT ?auto_137200 ?auto_137197 ) ( not ( = ?auto_137198 ?auto_137199 ) ) ( not ( = ?auto_137198 ?auto_137200 ) ) ( not ( = ?auto_137198 ?auto_137202 ) ) ( not ( = ?auto_137199 ?auto_137200 ) ) ( not ( = ?auto_137200 ?auto_137202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137202 ?auto_137199 ?auto_137197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137236 - OBJ
      ?auto_137237 - OBJ
      ?auto_137238 - OBJ
      ?auto_137235 - LOCATION
    )
    :vars
    (
      ?auto_137241 - TRUCK
      ?auto_137239 - LOCATION
      ?auto_137242 - CITY
      ?auto_137240 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137236 ?auto_137241 ) ( TRUCK-AT ?auto_137241 ?auto_137239 ) ( IN-CITY ?auto_137239 ?auto_137242 ) ( IN-CITY ?auto_137235 ?auto_137242 ) ( not ( = ?auto_137235 ?auto_137239 ) ) ( OBJ-AT ?auto_137240 ?auto_137235 ) ( not ( = ?auto_137240 ?auto_137236 ) ) ( OBJ-AT ?auto_137237 ?auto_137235 ) ( OBJ-AT ?auto_137238 ?auto_137235 ) ( not ( = ?auto_137236 ?auto_137237 ) ) ( not ( = ?auto_137236 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137238 ?auto_137240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137240 ?auto_137236 ?auto_137235 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137275 - OBJ
      ?auto_137276 - OBJ
      ?auto_137277 - OBJ
      ?auto_137278 - OBJ
      ?auto_137274 - LOCATION
    )
    :vars
    (
      ?auto_137280 - TRUCK
      ?auto_137279 - LOCATION
      ?auto_137281 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137278 ?auto_137280 ) ( TRUCK-AT ?auto_137280 ?auto_137279 ) ( IN-CITY ?auto_137279 ?auto_137281 ) ( IN-CITY ?auto_137274 ?auto_137281 ) ( not ( = ?auto_137274 ?auto_137279 ) ) ( OBJ-AT ?auto_137275 ?auto_137274 ) ( not ( = ?auto_137275 ?auto_137278 ) ) ( OBJ-AT ?auto_137276 ?auto_137274 ) ( OBJ-AT ?auto_137277 ?auto_137274 ) ( not ( = ?auto_137275 ?auto_137276 ) ) ( not ( = ?auto_137275 ?auto_137277 ) ) ( not ( = ?auto_137276 ?auto_137277 ) ) ( not ( = ?auto_137276 ?auto_137278 ) ) ( not ( = ?auto_137277 ?auto_137278 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137275 ?auto_137278 ?auto_137274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137291 - OBJ
      ?auto_137292 - OBJ
      ?auto_137293 - OBJ
      ?auto_137294 - OBJ
      ?auto_137290 - LOCATION
    )
    :vars
    (
      ?auto_137296 - TRUCK
      ?auto_137295 - LOCATION
      ?auto_137297 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137293 ?auto_137296 ) ( TRUCK-AT ?auto_137296 ?auto_137295 ) ( IN-CITY ?auto_137295 ?auto_137297 ) ( IN-CITY ?auto_137290 ?auto_137297 ) ( not ( = ?auto_137290 ?auto_137295 ) ) ( OBJ-AT ?auto_137291 ?auto_137290 ) ( not ( = ?auto_137291 ?auto_137293 ) ) ( OBJ-AT ?auto_137292 ?auto_137290 ) ( OBJ-AT ?auto_137294 ?auto_137290 ) ( not ( = ?auto_137291 ?auto_137292 ) ) ( not ( = ?auto_137291 ?auto_137294 ) ) ( not ( = ?auto_137292 ?auto_137293 ) ) ( not ( = ?auto_137292 ?auto_137294 ) ) ( not ( = ?auto_137293 ?auto_137294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137291 ?auto_137293 ?auto_137290 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137355 - OBJ
      ?auto_137356 - OBJ
      ?auto_137357 - OBJ
      ?auto_137358 - OBJ
      ?auto_137354 - LOCATION
    )
    :vars
    (
      ?auto_137360 - TRUCK
      ?auto_137359 - LOCATION
      ?auto_137361 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137356 ?auto_137360 ) ( TRUCK-AT ?auto_137360 ?auto_137359 ) ( IN-CITY ?auto_137359 ?auto_137361 ) ( IN-CITY ?auto_137354 ?auto_137361 ) ( not ( = ?auto_137354 ?auto_137359 ) ) ( OBJ-AT ?auto_137358 ?auto_137354 ) ( not ( = ?auto_137358 ?auto_137356 ) ) ( OBJ-AT ?auto_137355 ?auto_137354 ) ( OBJ-AT ?auto_137357 ?auto_137354 ) ( not ( = ?auto_137355 ?auto_137356 ) ) ( not ( = ?auto_137355 ?auto_137357 ) ) ( not ( = ?auto_137355 ?auto_137358 ) ) ( not ( = ?auto_137356 ?auto_137357 ) ) ( not ( = ?auto_137357 ?auto_137358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137358 ?auto_137356 ?auto_137354 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137363 - OBJ
      ?auto_137364 - OBJ
      ?auto_137365 - OBJ
      ?auto_137366 - OBJ
      ?auto_137362 - LOCATION
    )
    :vars
    (
      ?auto_137368 - TRUCK
      ?auto_137367 - LOCATION
      ?auto_137369 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137364 ?auto_137368 ) ( TRUCK-AT ?auto_137368 ?auto_137367 ) ( IN-CITY ?auto_137367 ?auto_137369 ) ( IN-CITY ?auto_137362 ?auto_137369 ) ( not ( = ?auto_137362 ?auto_137367 ) ) ( OBJ-AT ?auto_137365 ?auto_137362 ) ( not ( = ?auto_137365 ?auto_137364 ) ) ( OBJ-AT ?auto_137363 ?auto_137362 ) ( OBJ-AT ?auto_137366 ?auto_137362 ) ( not ( = ?auto_137363 ?auto_137364 ) ) ( not ( = ?auto_137363 ?auto_137365 ) ) ( not ( = ?auto_137363 ?auto_137366 ) ) ( not ( = ?auto_137364 ?auto_137366 ) ) ( not ( = ?auto_137365 ?auto_137366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137365 ?auto_137364 ?auto_137362 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137427 - OBJ
      ?auto_137428 - OBJ
      ?auto_137429 - OBJ
      ?auto_137430 - OBJ
      ?auto_137426 - LOCATION
    )
    :vars
    (
      ?auto_137432 - TRUCK
      ?auto_137431 - LOCATION
      ?auto_137433 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137430 ?auto_137432 ) ( TRUCK-AT ?auto_137432 ?auto_137431 ) ( IN-CITY ?auto_137431 ?auto_137433 ) ( IN-CITY ?auto_137426 ?auto_137433 ) ( not ( = ?auto_137426 ?auto_137431 ) ) ( OBJ-AT ?auto_137429 ?auto_137426 ) ( not ( = ?auto_137429 ?auto_137430 ) ) ( OBJ-AT ?auto_137427 ?auto_137426 ) ( OBJ-AT ?auto_137428 ?auto_137426 ) ( not ( = ?auto_137427 ?auto_137428 ) ) ( not ( = ?auto_137427 ?auto_137429 ) ) ( not ( = ?auto_137427 ?auto_137430 ) ) ( not ( = ?auto_137428 ?auto_137429 ) ) ( not ( = ?auto_137428 ?auto_137430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137429 ?auto_137430 ?auto_137426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137451 - OBJ
      ?auto_137452 - OBJ
      ?auto_137453 - OBJ
      ?auto_137454 - OBJ
      ?auto_137450 - LOCATION
    )
    :vars
    (
      ?auto_137456 - TRUCK
      ?auto_137455 - LOCATION
      ?auto_137457 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137453 ?auto_137456 ) ( TRUCK-AT ?auto_137456 ?auto_137455 ) ( IN-CITY ?auto_137455 ?auto_137457 ) ( IN-CITY ?auto_137450 ?auto_137457 ) ( not ( = ?auto_137450 ?auto_137455 ) ) ( OBJ-AT ?auto_137452 ?auto_137450 ) ( not ( = ?auto_137452 ?auto_137453 ) ) ( OBJ-AT ?auto_137451 ?auto_137450 ) ( OBJ-AT ?auto_137454 ?auto_137450 ) ( not ( = ?auto_137451 ?auto_137452 ) ) ( not ( = ?auto_137451 ?auto_137453 ) ) ( not ( = ?auto_137451 ?auto_137454 ) ) ( not ( = ?auto_137452 ?auto_137454 ) ) ( not ( = ?auto_137453 ?auto_137454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137452 ?auto_137453 ?auto_137450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137475 - OBJ
      ?auto_137476 - OBJ
      ?auto_137477 - OBJ
      ?auto_137478 - OBJ
      ?auto_137474 - LOCATION
    )
    :vars
    (
      ?auto_137481 - TRUCK
      ?auto_137479 - LOCATION
      ?auto_137482 - CITY
      ?auto_137480 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137478 ?auto_137481 ) ( TRUCK-AT ?auto_137481 ?auto_137479 ) ( IN-CITY ?auto_137479 ?auto_137482 ) ( IN-CITY ?auto_137474 ?auto_137482 ) ( not ( = ?auto_137474 ?auto_137479 ) ) ( OBJ-AT ?auto_137480 ?auto_137474 ) ( not ( = ?auto_137480 ?auto_137478 ) ) ( OBJ-AT ?auto_137475 ?auto_137474 ) ( OBJ-AT ?auto_137476 ?auto_137474 ) ( OBJ-AT ?auto_137477 ?auto_137474 ) ( not ( = ?auto_137475 ?auto_137476 ) ) ( not ( = ?auto_137475 ?auto_137477 ) ) ( not ( = ?auto_137475 ?auto_137478 ) ) ( not ( = ?auto_137475 ?auto_137480 ) ) ( not ( = ?auto_137476 ?auto_137477 ) ) ( not ( = ?auto_137476 ?auto_137478 ) ) ( not ( = ?auto_137476 ?auto_137480 ) ) ( not ( = ?auto_137477 ?auto_137478 ) ) ( not ( = ?auto_137477 ?auto_137480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137480 ?auto_137478 ?auto_137474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137492 - OBJ
      ?auto_137493 - OBJ
      ?auto_137494 - OBJ
      ?auto_137495 - OBJ
      ?auto_137491 - LOCATION
    )
    :vars
    (
      ?auto_137498 - TRUCK
      ?auto_137496 - LOCATION
      ?auto_137499 - CITY
      ?auto_137497 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137494 ?auto_137498 ) ( TRUCK-AT ?auto_137498 ?auto_137496 ) ( IN-CITY ?auto_137496 ?auto_137499 ) ( IN-CITY ?auto_137491 ?auto_137499 ) ( not ( = ?auto_137491 ?auto_137496 ) ) ( OBJ-AT ?auto_137497 ?auto_137491 ) ( not ( = ?auto_137497 ?auto_137494 ) ) ( OBJ-AT ?auto_137492 ?auto_137491 ) ( OBJ-AT ?auto_137493 ?auto_137491 ) ( OBJ-AT ?auto_137495 ?auto_137491 ) ( not ( = ?auto_137492 ?auto_137493 ) ) ( not ( = ?auto_137492 ?auto_137494 ) ) ( not ( = ?auto_137492 ?auto_137495 ) ) ( not ( = ?auto_137492 ?auto_137497 ) ) ( not ( = ?auto_137493 ?auto_137494 ) ) ( not ( = ?auto_137493 ?auto_137495 ) ) ( not ( = ?auto_137493 ?auto_137497 ) ) ( not ( = ?auto_137494 ?auto_137495 ) ) ( not ( = ?auto_137495 ?auto_137497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137497 ?auto_137494 ?auto_137491 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137542 - OBJ
      ?auto_137543 - OBJ
      ?auto_137544 - OBJ
      ?auto_137545 - OBJ
      ?auto_137541 - LOCATION
    )
    :vars
    (
      ?auto_137548 - TRUCK
      ?auto_137546 - LOCATION
      ?auto_137549 - CITY
      ?auto_137547 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137543 ?auto_137548 ) ( TRUCK-AT ?auto_137548 ?auto_137546 ) ( IN-CITY ?auto_137546 ?auto_137549 ) ( IN-CITY ?auto_137541 ?auto_137549 ) ( not ( = ?auto_137541 ?auto_137546 ) ) ( OBJ-AT ?auto_137547 ?auto_137541 ) ( not ( = ?auto_137547 ?auto_137543 ) ) ( OBJ-AT ?auto_137542 ?auto_137541 ) ( OBJ-AT ?auto_137544 ?auto_137541 ) ( OBJ-AT ?auto_137545 ?auto_137541 ) ( not ( = ?auto_137542 ?auto_137543 ) ) ( not ( = ?auto_137542 ?auto_137544 ) ) ( not ( = ?auto_137542 ?auto_137545 ) ) ( not ( = ?auto_137542 ?auto_137547 ) ) ( not ( = ?auto_137543 ?auto_137544 ) ) ( not ( = ?auto_137543 ?auto_137545 ) ) ( not ( = ?auto_137544 ?auto_137545 ) ) ( not ( = ?auto_137544 ?auto_137547 ) ) ( not ( = ?auto_137545 ?auto_137547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137547 ?auto_137543 ?auto_137541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137586 - OBJ
      ?auto_137587 - OBJ
      ?auto_137588 - OBJ
      ?auto_137589 - OBJ
      ?auto_137585 - LOCATION
    )
    :vars
    (
      ?auto_137591 - TRUCK
      ?auto_137590 - LOCATION
      ?auto_137592 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137586 ?auto_137591 ) ( TRUCK-AT ?auto_137591 ?auto_137590 ) ( IN-CITY ?auto_137590 ?auto_137592 ) ( IN-CITY ?auto_137585 ?auto_137592 ) ( not ( = ?auto_137585 ?auto_137590 ) ) ( OBJ-AT ?auto_137588 ?auto_137585 ) ( not ( = ?auto_137588 ?auto_137586 ) ) ( OBJ-AT ?auto_137587 ?auto_137585 ) ( OBJ-AT ?auto_137589 ?auto_137585 ) ( not ( = ?auto_137586 ?auto_137587 ) ) ( not ( = ?auto_137586 ?auto_137589 ) ) ( not ( = ?auto_137587 ?auto_137588 ) ) ( not ( = ?auto_137587 ?auto_137589 ) ) ( not ( = ?auto_137588 ?auto_137589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137588 ?auto_137586 ?auto_137585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137610 - OBJ
      ?auto_137611 - OBJ
      ?auto_137612 - OBJ
      ?auto_137613 - OBJ
      ?auto_137609 - LOCATION
    )
    :vars
    (
      ?auto_137615 - TRUCK
      ?auto_137614 - LOCATION
      ?auto_137616 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137610 ?auto_137615 ) ( TRUCK-AT ?auto_137615 ?auto_137614 ) ( IN-CITY ?auto_137614 ?auto_137616 ) ( IN-CITY ?auto_137609 ?auto_137616 ) ( not ( = ?auto_137609 ?auto_137614 ) ) ( OBJ-AT ?auto_137613 ?auto_137609 ) ( not ( = ?auto_137613 ?auto_137610 ) ) ( OBJ-AT ?auto_137611 ?auto_137609 ) ( OBJ-AT ?auto_137612 ?auto_137609 ) ( not ( = ?auto_137610 ?auto_137611 ) ) ( not ( = ?auto_137610 ?auto_137612 ) ) ( not ( = ?auto_137611 ?auto_137612 ) ) ( not ( = ?auto_137611 ?auto_137613 ) ) ( not ( = ?auto_137612 ?auto_137613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137613 ?auto_137610 ?auto_137609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137690 - OBJ
      ?auto_137691 - OBJ
      ?auto_137692 - OBJ
      ?auto_137693 - OBJ
      ?auto_137689 - LOCATION
    )
    :vars
    (
      ?auto_137696 - TRUCK
      ?auto_137694 - LOCATION
      ?auto_137697 - CITY
      ?auto_137695 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137690 ?auto_137696 ) ( TRUCK-AT ?auto_137696 ?auto_137694 ) ( IN-CITY ?auto_137694 ?auto_137697 ) ( IN-CITY ?auto_137689 ?auto_137697 ) ( not ( = ?auto_137689 ?auto_137694 ) ) ( OBJ-AT ?auto_137695 ?auto_137689 ) ( not ( = ?auto_137695 ?auto_137690 ) ) ( OBJ-AT ?auto_137691 ?auto_137689 ) ( OBJ-AT ?auto_137692 ?auto_137689 ) ( OBJ-AT ?auto_137693 ?auto_137689 ) ( not ( = ?auto_137690 ?auto_137691 ) ) ( not ( = ?auto_137690 ?auto_137692 ) ) ( not ( = ?auto_137690 ?auto_137693 ) ) ( not ( = ?auto_137691 ?auto_137692 ) ) ( not ( = ?auto_137691 ?auto_137693 ) ) ( not ( = ?auto_137691 ?auto_137695 ) ) ( not ( = ?auto_137692 ?auto_137693 ) ) ( not ( = ?auto_137692 ?auto_137695 ) ) ( not ( = ?auto_137693 ?auto_137695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137695 ?auto_137690 ?auto_137689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137841 - OBJ
      ?auto_137842 - OBJ
      ?auto_137843 - OBJ
      ?auto_137840 - LOCATION
    )
    :vars
    (
      ?auto_137845 - TRUCK
      ?auto_137844 - LOCATION
      ?auto_137846 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137845 ?auto_137844 ) ( IN-CITY ?auto_137844 ?auto_137846 ) ( IN-CITY ?auto_137840 ?auto_137846 ) ( not ( = ?auto_137840 ?auto_137844 ) ) ( OBJ-AT ?auto_137841 ?auto_137840 ) ( not ( = ?auto_137841 ?auto_137843 ) ) ( OBJ-AT ?auto_137843 ?auto_137844 ) ( OBJ-AT ?auto_137842 ?auto_137840 ) ( not ( = ?auto_137841 ?auto_137842 ) ) ( not ( = ?auto_137842 ?auto_137843 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137841 ?auto_137843 ?auto_137840 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137852 - OBJ
      ?auto_137853 - OBJ
      ?auto_137854 - OBJ
      ?auto_137851 - LOCATION
    )
    :vars
    (
      ?auto_137856 - TRUCK
      ?auto_137855 - LOCATION
      ?auto_137857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137856 ?auto_137855 ) ( IN-CITY ?auto_137855 ?auto_137857 ) ( IN-CITY ?auto_137851 ?auto_137857 ) ( not ( = ?auto_137851 ?auto_137855 ) ) ( OBJ-AT ?auto_137854 ?auto_137851 ) ( not ( = ?auto_137854 ?auto_137853 ) ) ( OBJ-AT ?auto_137853 ?auto_137855 ) ( OBJ-AT ?auto_137852 ?auto_137851 ) ( not ( = ?auto_137852 ?auto_137853 ) ) ( not ( = ?auto_137852 ?auto_137854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137854 ?auto_137853 ?auto_137851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137874 - OBJ
      ?auto_137875 - OBJ
      ?auto_137876 - OBJ
      ?auto_137873 - LOCATION
    )
    :vars
    (
      ?auto_137879 - TRUCK
      ?auto_137878 - LOCATION
      ?auto_137880 - CITY
      ?auto_137877 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137879 ?auto_137878 ) ( IN-CITY ?auto_137878 ?auto_137880 ) ( IN-CITY ?auto_137873 ?auto_137880 ) ( not ( = ?auto_137873 ?auto_137878 ) ) ( OBJ-AT ?auto_137877 ?auto_137873 ) ( not ( = ?auto_137877 ?auto_137876 ) ) ( OBJ-AT ?auto_137876 ?auto_137878 ) ( OBJ-AT ?auto_137874 ?auto_137873 ) ( OBJ-AT ?auto_137875 ?auto_137873 ) ( not ( = ?auto_137874 ?auto_137875 ) ) ( not ( = ?auto_137874 ?auto_137876 ) ) ( not ( = ?auto_137874 ?auto_137877 ) ) ( not ( = ?auto_137875 ?auto_137876 ) ) ( not ( = ?auto_137875 ?auto_137877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137877 ?auto_137876 ?auto_137873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137886 - OBJ
      ?auto_137887 - OBJ
      ?auto_137888 - OBJ
      ?auto_137885 - LOCATION
    )
    :vars
    (
      ?auto_137891 - TRUCK
      ?auto_137890 - LOCATION
      ?auto_137892 - CITY
      ?auto_137889 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137891 ?auto_137890 ) ( IN-CITY ?auto_137890 ?auto_137892 ) ( IN-CITY ?auto_137885 ?auto_137892 ) ( not ( = ?auto_137885 ?auto_137890 ) ) ( OBJ-AT ?auto_137889 ?auto_137885 ) ( not ( = ?auto_137889 ?auto_137887 ) ) ( OBJ-AT ?auto_137887 ?auto_137890 ) ( OBJ-AT ?auto_137886 ?auto_137885 ) ( OBJ-AT ?auto_137888 ?auto_137885 ) ( not ( = ?auto_137886 ?auto_137887 ) ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137889 ) ) ( not ( = ?auto_137887 ?auto_137888 ) ) ( not ( = ?auto_137888 ?auto_137889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137889 ?auto_137887 ?auto_137885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137924 - OBJ
      ?auto_137925 - OBJ
      ?auto_137926 - OBJ
      ?auto_137923 - LOCATION
    )
    :vars
    (
      ?auto_137929 - TRUCK
      ?auto_137928 - LOCATION
      ?auto_137930 - CITY
      ?auto_137927 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137929 ?auto_137928 ) ( IN-CITY ?auto_137928 ?auto_137930 ) ( IN-CITY ?auto_137923 ?auto_137930 ) ( not ( = ?auto_137923 ?auto_137928 ) ) ( OBJ-AT ?auto_137927 ?auto_137923 ) ( not ( = ?auto_137927 ?auto_137924 ) ) ( OBJ-AT ?auto_137924 ?auto_137928 ) ( OBJ-AT ?auto_137925 ?auto_137923 ) ( OBJ-AT ?auto_137926 ?auto_137923 ) ( not ( = ?auto_137924 ?auto_137925 ) ) ( not ( = ?auto_137924 ?auto_137926 ) ) ( not ( = ?auto_137925 ?auto_137926 ) ) ( not ( = ?auto_137925 ?auto_137927 ) ) ( not ( = ?auto_137926 ?auto_137927 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137927 ?auto_137924 ?auto_137923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137963 - OBJ
      ?auto_137964 - OBJ
      ?auto_137965 - OBJ
      ?auto_137966 - OBJ
      ?auto_137962 - LOCATION
    )
    :vars
    (
      ?auto_137968 - TRUCK
      ?auto_137967 - LOCATION
      ?auto_137969 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137968 ?auto_137967 ) ( IN-CITY ?auto_137967 ?auto_137969 ) ( IN-CITY ?auto_137962 ?auto_137969 ) ( not ( = ?auto_137962 ?auto_137967 ) ) ( OBJ-AT ?auto_137964 ?auto_137962 ) ( not ( = ?auto_137964 ?auto_137966 ) ) ( OBJ-AT ?auto_137966 ?auto_137967 ) ( OBJ-AT ?auto_137963 ?auto_137962 ) ( OBJ-AT ?auto_137965 ?auto_137962 ) ( not ( = ?auto_137963 ?auto_137964 ) ) ( not ( = ?auto_137963 ?auto_137965 ) ) ( not ( = ?auto_137963 ?auto_137966 ) ) ( not ( = ?auto_137964 ?auto_137965 ) ) ( not ( = ?auto_137965 ?auto_137966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137964 ?auto_137966 ?auto_137962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137979 - OBJ
      ?auto_137980 - OBJ
      ?auto_137981 - OBJ
      ?auto_137982 - OBJ
      ?auto_137978 - LOCATION
    )
    :vars
    (
      ?auto_137984 - TRUCK
      ?auto_137983 - LOCATION
      ?auto_137985 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137984 ?auto_137983 ) ( IN-CITY ?auto_137983 ?auto_137985 ) ( IN-CITY ?auto_137978 ?auto_137985 ) ( not ( = ?auto_137978 ?auto_137983 ) ) ( OBJ-AT ?auto_137979 ?auto_137978 ) ( not ( = ?auto_137979 ?auto_137981 ) ) ( OBJ-AT ?auto_137981 ?auto_137983 ) ( OBJ-AT ?auto_137980 ?auto_137978 ) ( OBJ-AT ?auto_137982 ?auto_137978 ) ( not ( = ?auto_137979 ?auto_137980 ) ) ( not ( = ?auto_137979 ?auto_137982 ) ) ( not ( = ?auto_137980 ?auto_137981 ) ) ( not ( = ?auto_137980 ?auto_137982 ) ) ( not ( = ?auto_137981 ?auto_137982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137979 ?auto_137981 ?auto_137978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138043 - OBJ
      ?auto_138044 - OBJ
      ?auto_138045 - OBJ
      ?auto_138046 - OBJ
      ?auto_138042 - LOCATION
    )
    :vars
    (
      ?auto_138048 - TRUCK
      ?auto_138047 - LOCATION
      ?auto_138049 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138048 ?auto_138047 ) ( IN-CITY ?auto_138047 ?auto_138049 ) ( IN-CITY ?auto_138042 ?auto_138049 ) ( not ( = ?auto_138042 ?auto_138047 ) ) ( OBJ-AT ?auto_138045 ?auto_138042 ) ( not ( = ?auto_138045 ?auto_138044 ) ) ( OBJ-AT ?auto_138044 ?auto_138047 ) ( OBJ-AT ?auto_138043 ?auto_138042 ) ( OBJ-AT ?auto_138046 ?auto_138042 ) ( not ( = ?auto_138043 ?auto_138044 ) ) ( not ( = ?auto_138043 ?auto_138045 ) ) ( not ( = ?auto_138043 ?auto_138046 ) ) ( not ( = ?auto_138044 ?auto_138046 ) ) ( not ( = ?auto_138045 ?auto_138046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138045 ?auto_138044 ?auto_138042 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138051 - OBJ
      ?auto_138052 - OBJ
      ?auto_138053 - OBJ
      ?auto_138054 - OBJ
      ?auto_138050 - LOCATION
    )
    :vars
    (
      ?auto_138056 - TRUCK
      ?auto_138055 - LOCATION
      ?auto_138057 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138056 ?auto_138055 ) ( IN-CITY ?auto_138055 ?auto_138057 ) ( IN-CITY ?auto_138050 ?auto_138057 ) ( not ( = ?auto_138050 ?auto_138055 ) ) ( OBJ-AT ?auto_138051 ?auto_138050 ) ( not ( = ?auto_138051 ?auto_138052 ) ) ( OBJ-AT ?auto_138052 ?auto_138055 ) ( OBJ-AT ?auto_138053 ?auto_138050 ) ( OBJ-AT ?auto_138054 ?auto_138050 ) ( not ( = ?auto_138051 ?auto_138053 ) ) ( not ( = ?auto_138051 ?auto_138054 ) ) ( not ( = ?auto_138052 ?auto_138053 ) ) ( not ( = ?auto_138052 ?auto_138054 ) ) ( not ( = ?auto_138053 ?auto_138054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138051 ?auto_138052 ?auto_138050 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138115 - OBJ
      ?auto_138116 - OBJ
      ?auto_138117 - OBJ
      ?auto_138118 - OBJ
      ?auto_138114 - LOCATION
    )
    :vars
    (
      ?auto_138120 - TRUCK
      ?auto_138119 - LOCATION
      ?auto_138121 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138120 ?auto_138119 ) ( IN-CITY ?auto_138119 ?auto_138121 ) ( IN-CITY ?auto_138114 ?auto_138121 ) ( not ( = ?auto_138114 ?auto_138119 ) ) ( OBJ-AT ?auto_138117 ?auto_138114 ) ( not ( = ?auto_138117 ?auto_138118 ) ) ( OBJ-AT ?auto_138118 ?auto_138119 ) ( OBJ-AT ?auto_138115 ?auto_138114 ) ( OBJ-AT ?auto_138116 ?auto_138114 ) ( not ( = ?auto_138115 ?auto_138116 ) ) ( not ( = ?auto_138115 ?auto_138117 ) ) ( not ( = ?auto_138115 ?auto_138118 ) ) ( not ( = ?auto_138116 ?auto_138117 ) ) ( not ( = ?auto_138116 ?auto_138118 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138117 ?auto_138118 ?auto_138114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138131 - OBJ
      ?auto_138132 - OBJ
      ?auto_138133 - OBJ
      ?auto_138134 - OBJ
      ?auto_138130 - LOCATION
    )
    :vars
    (
      ?auto_138136 - TRUCK
      ?auto_138135 - LOCATION
      ?auto_138137 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138136 ?auto_138135 ) ( IN-CITY ?auto_138135 ?auto_138137 ) ( IN-CITY ?auto_138130 ?auto_138137 ) ( not ( = ?auto_138130 ?auto_138135 ) ) ( OBJ-AT ?auto_138132 ?auto_138130 ) ( not ( = ?auto_138132 ?auto_138133 ) ) ( OBJ-AT ?auto_138133 ?auto_138135 ) ( OBJ-AT ?auto_138131 ?auto_138130 ) ( OBJ-AT ?auto_138134 ?auto_138130 ) ( not ( = ?auto_138131 ?auto_138132 ) ) ( not ( = ?auto_138131 ?auto_138133 ) ) ( not ( = ?auto_138131 ?auto_138134 ) ) ( not ( = ?auto_138132 ?auto_138134 ) ) ( not ( = ?auto_138133 ?auto_138134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138132 ?auto_138133 ?auto_138130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138163 - OBJ
      ?auto_138164 - OBJ
      ?auto_138165 - OBJ
      ?auto_138166 - OBJ
      ?auto_138162 - LOCATION
    )
    :vars
    (
      ?auto_138169 - TRUCK
      ?auto_138168 - LOCATION
      ?auto_138170 - CITY
      ?auto_138167 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138169 ?auto_138168 ) ( IN-CITY ?auto_138168 ?auto_138170 ) ( IN-CITY ?auto_138162 ?auto_138170 ) ( not ( = ?auto_138162 ?auto_138168 ) ) ( OBJ-AT ?auto_138167 ?auto_138162 ) ( not ( = ?auto_138167 ?auto_138166 ) ) ( OBJ-AT ?auto_138166 ?auto_138168 ) ( OBJ-AT ?auto_138163 ?auto_138162 ) ( OBJ-AT ?auto_138164 ?auto_138162 ) ( OBJ-AT ?auto_138165 ?auto_138162 ) ( not ( = ?auto_138163 ?auto_138164 ) ) ( not ( = ?auto_138163 ?auto_138165 ) ) ( not ( = ?auto_138163 ?auto_138166 ) ) ( not ( = ?auto_138163 ?auto_138167 ) ) ( not ( = ?auto_138164 ?auto_138165 ) ) ( not ( = ?auto_138164 ?auto_138166 ) ) ( not ( = ?auto_138164 ?auto_138167 ) ) ( not ( = ?auto_138165 ?auto_138166 ) ) ( not ( = ?auto_138165 ?auto_138167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138167 ?auto_138166 ?auto_138162 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138180 - OBJ
      ?auto_138181 - OBJ
      ?auto_138182 - OBJ
      ?auto_138183 - OBJ
      ?auto_138179 - LOCATION
    )
    :vars
    (
      ?auto_138186 - TRUCK
      ?auto_138185 - LOCATION
      ?auto_138187 - CITY
      ?auto_138184 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138186 ?auto_138185 ) ( IN-CITY ?auto_138185 ?auto_138187 ) ( IN-CITY ?auto_138179 ?auto_138187 ) ( not ( = ?auto_138179 ?auto_138185 ) ) ( OBJ-AT ?auto_138184 ?auto_138179 ) ( not ( = ?auto_138184 ?auto_138182 ) ) ( OBJ-AT ?auto_138182 ?auto_138185 ) ( OBJ-AT ?auto_138180 ?auto_138179 ) ( OBJ-AT ?auto_138181 ?auto_138179 ) ( OBJ-AT ?auto_138183 ?auto_138179 ) ( not ( = ?auto_138180 ?auto_138181 ) ) ( not ( = ?auto_138180 ?auto_138182 ) ) ( not ( = ?auto_138180 ?auto_138183 ) ) ( not ( = ?auto_138180 ?auto_138184 ) ) ( not ( = ?auto_138181 ?auto_138182 ) ) ( not ( = ?auto_138181 ?auto_138183 ) ) ( not ( = ?auto_138181 ?auto_138184 ) ) ( not ( = ?auto_138182 ?auto_138183 ) ) ( not ( = ?auto_138183 ?auto_138184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138184 ?auto_138182 ?auto_138179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138230 - OBJ
      ?auto_138231 - OBJ
      ?auto_138232 - OBJ
      ?auto_138233 - OBJ
      ?auto_138229 - LOCATION
    )
    :vars
    (
      ?auto_138236 - TRUCK
      ?auto_138235 - LOCATION
      ?auto_138237 - CITY
      ?auto_138234 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138236 ?auto_138235 ) ( IN-CITY ?auto_138235 ?auto_138237 ) ( IN-CITY ?auto_138229 ?auto_138237 ) ( not ( = ?auto_138229 ?auto_138235 ) ) ( OBJ-AT ?auto_138234 ?auto_138229 ) ( not ( = ?auto_138234 ?auto_138231 ) ) ( OBJ-AT ?auto_138231 ?auto_138235 ) ( OBJ-AT ?auto_138230 ?auto_138229 ) ( OBJ-AT ?auto_138232 ?auto_138229 ) ( OBJ-AT ?auto_138233 ?auto_138229 ) ( not ( = ?auto_138230 ?auto_138231 ) ) ( not ( = ?auto_138230 ?auto_138232 ) ) ( not ( = ?auto_138230 ?auto_138233 ) ) ( not ( = ?auto_138230 ?auto_138234 ) ) ( not ( = ?auto_138231 ?auto_138232 ) ) ( not ( = ?auto_138231 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138234 ) ) ( not ( = ?auto_138233 ?auto_138234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138234 ?auto_138231 ?auto_138229 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138274 - OBJ
      ?auto_138275 - OBJ
      ?auto_138276 - OBJ
      ?auto_138277 - OBJ
      ?auto_138273 - LOCATION
    )
    :vars
    (
      ?auto_138279 - TRUCK
      ?auto_138278 - LOCATION
      ?auto_138280 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138279 ?auto_138278 ) ( IN-CITY ?auto_138278 ?auto_138280 ) ( IN-CITY ?auto_138273 ?auto_138280 ) ( not ( = ?auto_138273 ?auto_138278 ) ) ( OBJ-AT ?auto_138276 ?auto_138273 ) ( not ( = ?auto_138276 ?auto_138274 ) ) ( OBJ-AT ?auto_138274 ?auto_138278 ) ( OBJ-AT ?auto_138275 ?auto_138273 ) ( OBJ-AT ?auto_138277 ?auto_138273 ) ( not ( = ?auto_138274 ?auto_138275 ) ) ( not ( = ?auto_138274 ?auto_138277 ) ) ( not ( = ?auto_138275 ?auto_138276 ) ) ( not ( = ?auto_138275 ?auto_138277 ) ) ( not ( = ?auto_138276 ?auto_138277 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138276 ?auto_138274 ?auto_138273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138370 - OBJ
      ?auto_138371 - OBJ
      ?auto_138372 - OBJ
      ?auto_138373 - OBJ
      ?auto_138369 - LOCATION
    )
    :vars
    (
      ?auto_138375 - TRUCK
      ?auto_138374 - LOCATION
      ?auto_138376 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138375 ?auto_138374 ) ( IN-CITY ?auto_138374 ?auto_138376 ) ( IN-CITY ?auto_138369 ?auto_138376 ) ( not ( = ?auto_138369 ?auto_138374 ) ) ( OBJ-AT ?auto_138373 ?auto_138369 ) ( not ( = ?auto_138373 ?auto_138370 ) ) ( OBJ-AT ?auto_138370 ?auto_138374 ) ( OBJ-AT ?auto_138371 ?auto_138369 ) ( OBJ-AT ?auto_138372 ?auto_138369 ) ( not ( = ?auto_138370 ?auto_138371 ) ) ( not ( = ?auto_138370 ?auto_138372 ) ) ( not ( = ?auto_138371 ?auto_138372 ) ) ( not ( = ?auto_138371 ?auto_138373 ) ) ( not ( = ?auto_138372 ?auto_138373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138373 ?auto_138370 ?auto_138369 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138378 - OBJ
      ?auto_138379 - OBJ
      ?auto_138380 - OBJ
      ?auto_138381 - OBJ
      ?auto_138377 - LOCATION
    )
    :vars
    (
      ?auto_138384 - TRUCK
      ?auto_138383 - LOCATION
      ?auto_138385 - CITY
      ?auto_138382 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138384 ?auto_138383 ) ( IN-CITY ?auto_138383 ?auto_138385 ) ( IN-CITY ?auto_138377 ?auto_138385 ) ( not ( = ?auto_138377 ?auto_138383 ) ) ( OBJ-AT ?auto_138382 ?auto_138377 ) ( not ( = ?auto_138382 ?auto_138378 ) ) ( OBJ-AT ?auto_138378 ?auto_138383 ) ( OBJ-AT ?auto_138379 ?auto_138377 ) ( OBJ-AT ?auto_138380 ?auto_138377 ) ( OBJ-AT ?auto_138381 ?auto_138377 ) ( not ( = ?auto_138378 ?auto_138379 ) ) ( not ( = ?auto_138378 ?auto_138380 ) ) ( not ( = ?auto_138378 ?auto_138381 ) ) ( not ( = ?auto_138379 ?auto_138380 ) ) ( not ( = ?auto_138379 ?auto_138381 ) ) ( not ( = ?auto_138379 ?auto_138382 ) ) ( not ( = ?auto_138380 ?auto_138381 ) ) ( not ( = ?auto_138380 ?auto_138382 ) ) ( not ( = ?auto_138381 ?auto_138382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138382 ?auto_138378 ?auto_138377 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138529 - OBJ
      ?auto_138530 - OBJ
      ?auto_138531 - OBJ
      ?auto_138528 - LOCATION
    )
    :vars
    (
      ?auto_138533 - LOCATION
      ?auto_138532 - CITY
      ?auto_138534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138533 ?auto_138532 ) ( IN-CITY ?auto_138528 ?auto_138532 ) ( not ( = ?auto_138528 ?auto_138533 ) ) ( OBJ-AT ?auto_138530 ?auto_138528 ) ( not ( = ?auto_138530 ?auto_138531 ) ) ( OBJ-AT ?auto_138531 ?auto_138533 ) ( TRUCK-AT ?auto_138534 ?auto_138528 ) ( OBJ-AT ?auto_138529 ?auto_138528 ) ( not ( = ?auto_138529 ?auto_138530 ) ) ( not ( = ?auto_138529 ?auto_138531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138530 ?auto_138531 ?auto_138528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138562 - OBJ
      ?auto_138563 - OBJ
      ?auto_138564 - OBJ
      ?auto_138561 - LOCATION
    )
    :vars
    (
      ?auto_138567 - LOCATION
      ?auto_138566 - CITY
      ?auto_138565 - OBJ
      ?auto_138568 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138567 ?auto_138566 ) ( IN-CITY ?auto_138561 ?auto_138566 ) ( not ( = ?auto_138561 ?auto_138567 ) ) ( OBJ-AT ?auto_138565 ?auto_138561 ) ( not ( = ?auto_138565 ?auto_138564 ) ) ( OBJ-AT ?auto_138564 ?auto_138567 ) ( TRUCK-AT ?auto_138568 ?auto_138561 ) ( OBJ-AT ?auto_138562 ?auto_138561 ) ( OBJ-AT ?auto_138563 ?auto_138561 ) ( not ( = ?auto_138562 ?auto_138563 ) ) ( not ( = ?auto_138562 ?auto_138564 ) ) ( not ( = ?auto_138562 ?auto_138565 ) ) ( not ( = ?auto_138563 ?auto_138564 ) ) ( not ( = ?auto_138563 ?auto_138565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138565 ?auto_138564 ?auto_138561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138574 - OBJ
      ?auto_138575 - OBJ
      ?auto_138576 - OBJ
      ?auto_138573 - LOCATION
    )
    :vars
    (
      ?auto_138579 - LOCATION
      ?auto_138578 - CITY
      ?auto_138577 - OBJ
      ?auto_138580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138579 ?auto_138578 ) ( IN-CITY ?auto_138573 ?auto_138578 ) ( not ( = ?auto_138573 ?auto_138579 ) ) ( OBJ-AT ?auto_138577 ?auto_138573 ) ( not ( = ?auto_138577 ?auto_138575 ) ) ( OBJ-AT ?auto_138575 ?auto_138579 ) ( TRUCK-AT ?auto_138580 ?auto_138573 ) ( OBJ-AT ?auto_138574 ?auto_138573 ) ( OBJ-AT ?auto_138576 ?auto_138573 ) ( not ( = ?auto_138574 ?auto_138575 ) ) ( not ( = ?auto_138574 ?auto_138576 ) ) ( not ( = ?auto_138574 ?auto_138577 ) ) ( not ( = ?auto_138575 ?auto_138576 ) ) ( not ( = ?auto_138576 ?auto_138577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138577 ?auto_138575 ?auto_138573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138612 - OBJ
      ?auto_138613 - OBJ
      ?auto_138614 - OBJ
      ?auto_138611 - LOCATION
    )
    :vars
    (
      ?auto_138617 - LOCATION
      ?auto_138616 - CITY
      ?auto_138615 - OBJ
      ?auto_138618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138617 ?auto_138616 ) ( IN-CITY ?auto_138611 ?auto_138616 ) ( not ( = ?auto_138611 ?auto_138617 ) ) ( OBJ-AT ?auto_138615 ?auto_138611 ) ( not ( = ?auto_138615 ?auto_138612 ) ) ( OBJ-AT ?auto_138612 ?auto_138617 ) ( TRUCK-AT ?auto_138618 ?auto_138611 ) ( OBJ-AT ?auto_138613 ?auto_138611 ) ( OBJ-AT ?auto_138614 ?auto_138611 ) ( not ( = ?auto_138612 ?auto_138613 ) ) ( not ( = ?auto_138612 ?auto_138614 ) ) ( not ( = ?auto_138613 ?auto_138614 ) ) ( not ( = ?auto_138613 ?auto_138615 ) ) ( not ( = ?auto_138614 ?auto_138615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138615 ?auto_138612 ?auto_138611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138659 - OBJ
      ?auto_138660 - OBJ
      ?auto_138661 - OBJ
      ?auto_138662 - OBJ
      ?auto_138658 - LOCATION
    )
    :vars
    (
      ?auto_138664 - LOCATION
      ?auto_138663 - CITY
      ?auto_138665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138664 ?auto_138663 ) ( IN-CITY ?auto_138658 ?auto_138663 ) ( not ( = ?auto_138658 ?auto_138664 ) ) ( OBJ-AT ?auto_138659 ?auto_138658 ) ( not ( = ?auto_138659 ?auto_138662 ) ) ( OBJ-AT ?auto_138662 ?auto_138664 ) ( TRUCK-AT ?auto_138665 ?auto_138658 ) ( OBJ-AT ?auto_138660 ?auto_138658 ) ( OBJ-AT ?auto_138661 ?auto_138658 ) ( not ( = ?auto_138659 ?auto_138660 ) ) ( not ( = ?auto_138659 ?auto_138661 ) ) ( not ( = ?auto_138660 ?auto_138661 ) ) ( not ( = ?auto_138660 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138659 ?auto_138662 ?auto_138658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138667 - OBJ
      ?auto_138668 - OBJ
      ?auto_138669 - OBJ
      ?auto_138670 - OBJ
      ?auto_138666 - LOCATION
    )
    :vars
    (
      ?auto_138672 - LOCATION
      ?auto_138671 - CITY
      ?auto_138673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138672 ?auto_138671 ) ( IN-CITY ?auto_138666 ?auto_138671 ) ( not ( = ?auto_138666 ?auto_138672 ) ) ( OBJ-AT ?auto_138670 ?auto_138666 ) ( not ( = ?auto_138670 ?auto_138669 ) ) ( OBJ-AT ?auto_138669 ?auto_138672 ) ( TRUCK-AT ?auto_138673 ?auto_138666 ) ( OBJ-AT ?auto_138667 ?auto_138666 ) ( OBJ-AT ?auto_138668 ?auto_138666 ) ( not ( = ?auto_138667 ?auto_138668 ) ) ( not ( = ?auto_138667 ?auto_138669 ) ) ( not ( = ?auto_138667 ?auto_138670 ) ) ( not ( = ?auto_138668 ?auto_138669 ) ) ( not ( = ?auto_138668 ?auto_138670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138670 ?auto_138669 ?auto_138666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138739 - OBJ
      ?auto_138740 - OBJ
      ?auto_138741 - OBJ
      ?auto_138742 - OBJ
      ?auto_138738 - LOCATION
    )
    :vars
    (
      ?auto_138744 - LOCATION
      ?auto_138743 - CITY
      ?auto_138745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138744 ?auto_138743 ) ( IN-CITY ?auto_138738 ?auto_138743 ) ( not ( = ?auto_138738 ?auto_138744 ) ) ( OBJ-AT ?auto_138739 ?auto_138738 ) ( not ( = ?auto_138739 ?auto_138740 ) ) ( OBJ-AT ?auto_138740 ?auto_138744 ) ( TRUCK-AT ?auto_138745 ?auto_138738 ) ( OBJ-AT ?auto_138741 ?auto_138738 ) ( OBJ-AT ?auto_138742 ?auto_138738 ) ( not ( = ?auto_138739 ?auto_138741 ) ) ( not ( = ?auto_138739 ?auto_138742 ) ) ( not ( = ?auto_138740 ?auto_138741 ) ) ( not ( = ?auto_138740 ?auto_138742 ) ) ( not ( = ?auto_138741 ?auto_138742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138739 ?auto_138740 ?auto_138738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138811 - OBJ
      ?auto_138812 - OBJ
      ?auto_138813 - OBJ
      ?auto_138814 - OBJ
      ?auto_138810 - LOCATION
    )
    :vars
    (
      ?auto_138816 - LOCATION
      ?auto_138815 - CITY
      ?auto_138817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138816 ?auto_138815 ) ( IN-CITY ?auto_138810 ?auto_138815 ) ( not ( = ?auto_138810 ?auto_138816 ) ) ( OBJ-AT ?auto_138812 ?auto_138810 ) ( not ( = ?auto_138812 ?auto_138814 ) ) ( OBJ-AT ?auto_138814 ?auto_138816 ) ( TRUCK-AT ?auto_138817 ?auto_138810 ) ( OBJ-AT ?auto_138811 ?auto_138810 ) ( OBJ-AT ?auto_138813 ?auto_138810 ) ( not ( = ?auto_138811 ?auto_138812 ) ) ( not ( = ?auto_138811 ?auto_138813 ) ) ( not ( = ?auto_138811 ?auto_138814 ) ) ( not ( = ?auto_138812 ?auto_138813 ) ) ( not ( = ?auto_138813 ?auto_138814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138812 ?auto_138814 ?auto_138810 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138827 - OBJ
      ?auto_138828 - OBJ
      ?auto_138829 - OBJ
      ?auto_138830 - OBJ
      ?auto_138826 - LOCATION
    )
    :vars
    (
      ?auto_138832 - LOCATION
      ?auto_138831 - CITY
      ?auto_138833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138832 ?auto_138831 ) ( IN-CITY ?auto_138826 ?auto_138831 ) ( not ( = ?auto_138826 ?auto_138832 ) ) ( OBJ-AT ?auto_138828 ?auto_138826 ) ( not ( = ?auto_138828 ?auto_138829 ) ) ( OBJ-AT ?auto_138829 ?auto_138832 ) ( TRUCK-AT ?auto_138833 ?auto_138826 ) ( OBJ-AT ?auto_138827 ?auto_138826 ) ( OBJ-AT ?auto_138830 ?auto_138826 ) ( not ( = ?auto_138827 ?auto_138828 ) ) ( not ( = ?auto_138827 ?auto_138829 ) ) ( not ( = ?auto_138827 ?auto_138830 ) ) ( not ( = ?auto_138828 ?auto_138830 ) ) ( not ( = ?auto_138829 ?auto_138830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138828 ?auto_138829 ?auto_138826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138851 - OBJ
      ?auto_138852 - OBJ
      ?auto_138853 - OBJ
      ?auto_138854 - OBJ
      ?auto_138850 - LOCATION
    )
    :vars
    (
      ?auto_138857 - LOCATION
      ?auto_138856 - CITY
      ?auto_138855 - OBJ
      ?auto_138858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138857 ?auto_138856 ) ( IN-CITY ?auto_138850 ?auto_138856 ) ( not ( = ?auto_138850 ?auto_138857 ) ) ( OBJ-AT ?auto_138855 ?auto_138850 ) ( not ( = ?auto_138855 ?auto_138854 ) ) ( OBJ-AT ?auto_138854 ?auto_138857 ) ( TRUCK-AT ?auto_138858 ?auto_138850 ) ( OBJ-AT ?auto_138851 ?auto_138850 ) ( OBJ-AT ?auto_138852 ?auto_138850 ) ( OBJ-AT ?auto_138853 ?auto_138850 ) ( not ( = ?auto_138851 ?auto_138852 ) ) ( not ( = ?auto_138851 ?auto_138853 ) ) ( not ( = ?auto_138851 ?auto_138854 ) ) ( not ( = ?auto_138851 ?auto_138855 ) ) ( not ( = ?auto_138852 ?auto_138853 ) ) ( not ( = ?auto_138852 ?auto_138854 ) ) ( not ( = ?auto_138852 ?auto_138855 ) ) ( not ( = ?auto_138853 ?auto_138854 ) ) ( not ( = ?auto_138853 ?auto_138855 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138855 ?auto_138854 ?auto_138850 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138868 - OBJ
      ?auto_138869 - OBJ
      ?auto_138870 - OBJ
      ?auto_138871 - OBJ
      ?auto_138867 - LOCATION
    )
    :vars
    (
      ?auto_138874 - LOCATION
      ?auto_138873 - CITY
      ?auto_138872 - OBJ
      ?auto_138875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138874 ?auto_138873 ) ( IN-CITY ?auto_138867 ?auto_138873 ) ( not ( = ?auto_138867 ?auto_138874 ) ) ( OBJ-AT ?auto_138872 ?auto_138867 ) ( not ( = ?auto_138872 ?auto_138870 ) ) ( OBJ-AT ?auto_138870 ?auto_138874 ) ( TRUCK-AT ?auto_138875 ?auto_138867 ) ( OBJ-AT ?auto_138868 ?auto_138867 ) ( OBJ-AT ?auto_138869 ?auto_138867 ) ( OBJ-AT ?auto_138871 ?auto_138867 ) ( not ( = ?auto_138868 ?auto_138869 ) ) ( not ( = ?auto_138868 ?auto_138870 ) ) ( not ( = ?auto_138868 ?auto_138871 ) ) ( not ( = ?auto_138868 ?auto_138872 ) ) ( not ( = ?auto_138869 ?auto_138870 ) ) ( not ( = ?auto_138869 ?auto_138871 ) ) ( not ( = ?auto_138869 ?auto_138872 ) ) ( not ( = ?auto_138870 ?auto_138871 ) ) ( not ( = ?auto_138871 ?auto_138872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138872 ?auto_138870 ?auto_138867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138886 - OBJ
      ?auto_138887 - OBJ
      ?auto_138888 - OBJ
      ?auto_138889 - OBJ
      ?auto_138885 - LOCATION
    )
    :vars
    (
      ?auto_138891 - LOCATION
      ?auto_138890 - CITY
      ?auto_138892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138891 ?auto_138890 ) ( IN-CITY ?auto_138885 ?auto_138890 ) ( not ( = ?auto_138885 ?auto_138891 ) ) ( OBJ-AT ?auto_138889 ?auto_138885 ) ( not ( = ?auto_138889 ?auto_138887 ) ) ( OBJ-AT ?auto_138887 ?auto_138891 ) ( TRUCK-AT ?auto_138892 ?auto_138885 ) ( OBJ-AT ?auto_138886 ?auto_138885 ) ( OBJ-AT ?auto_138888 ?auto_138885 ) ( not ( = ?auto_138886 ?auto_138887 ) ) ( not ( = ?auto_138886 ?auto_138888 ) ) ( not ( = ?auto_138886 ?auto_138889 ) ) ( not ( = ?auto_138887 ?auto_138888 ) ) ( not ( = ?auto_138888 ?auto_138889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138889 ?auto_138887 ?auto_138885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138918 - OBJ
      ?auto_138919 - OBJ
      ?auto_138920 - OBJ
      ?auto_138921 - OBJ
      ?auto_138917 - LOCATION
    )
    :vars
    (
      ?auto_138924 - LOCATION
      ?auto_138923 - CITY
      ?auto_138922 - OBJ
      ?auto_138925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138924 ?auto_138923 ) ( IN-CITY ?auto_138917 ?auto_138923 ) ( not ( = ?auto_138917 ?auto_138924 ) ) ( OBJ-AT ?auto_138922 ?auto_138917 ) ( not ( = ?auto_138922 ?auto_138919 ) ) ( OBJ-AT ?auto_138919 ?auto_138924 ) ( TRUCK-AT ?auto_138925 ?auto_138917 ) ( OBJ-AT ?auto_138918 ?auto_138917 ) ( OBJ-AT ?auto_138920 ?auto_138917 ) ( OBJ-AT ?auto_138921 ?auto_138917 ) ( not ( = ?auto_138918 ?auto_138919 ) ) ( not ( = ?auto_138918 ?auto_138920 ) ) ( not ( = ?auto_138918 ?auto_138921 ) ) ( not ( = ?auto_138918 ?auto_138922 ) ) ( not ( = ?auto_138919 ?auto_138920 ) ) ( not ( = ?auto_138919 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138922 ) ) ( not ( = ?auto_138921 ?auto_138922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138922 ?auto_138919 ?auto_138917 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138962 - OBJ
      ?auto_138963 - OBJ
      ?auto_138964 - OBJ
      ?auto_138965 - OBJ
      ?auto_138961 - LOCATION
    )
    :vars
    (
      ?auto_138967 - LOCATION
      ?auto_138966 - CITY
      ?auto_138968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138967 ?auto_138966 ) ( IN-CITY ?auto_138961 ?auto_138966 ) ( not ( = ?auto_138961 ?auto_138967 ) ) ( OBJ-AT ?auto_138964 ?auto_138961 ) ( not ( = ?auto_138964 ?auto_138962 ) ) ( OBJ-AT ?auto_138962 ?auto_138967 ) ( TRUCK-AT ?auto_138968 ?auto_138961 ) ( OBJ-AT ?auto_138963 ?auto_138961 ) ( OBJ-AT ?auto_138965 ?auto_138961 ) ( not ( = ?auto_138962 ?auto_138963 ) ) ( not ( = ?auto_138962 ?auto_138965 ) ) ( not ( = ?auto_138963 ?auto_138964 ) ) ( not ( = ?auto_138963 ?auto_138965 ) ) ( not ( = ?auto_138964 ?auto_138965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138964 ?auto_138962 ?auto_138961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138986 - OBJ
      ?auto_138987 - OBJ
      ?auto_138988 - OBJ
      ?auto_138989 - OBJ
      ?auto_138985 - LOCATION
    )
    :vars
    (
      ?auto_138991 - LOCATION
      ?auto_138990 - CITY
      ?auto_138992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138991 ?auto_138990 ) ( IN-CITY ?auto_138985 ?auto_138990 ) ( not ( = ?auto_138985 ?auto_138991 ) ) ( OBJ-AT ?auto_138989 ?auto_138985 ) ( not ( = ?auto_138989 ?auto_138986 ) ) ( OBJ-AT ?auto_138986 ?auto_138991 ) ( TRUCK-AT ?auto_138992 ?auto_138985 ) ( OBJ-AT ?auto_138987 ?auto_138985 ) ( OBJ-AT ?auto_138988 ?auto_138985 ) ( not ( = ?auto_138986 ?auto_138987 ) ) ( not ( = ?auto_138986 ?auto_138988 ) ) ( not ( = ?auto_138987 ?auto_138988 ) ) ( not ( = ?auto_138987 ?auto_138989 ) ) ( not ( = ?auto_138988 ?auto_138989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138989 ?auto_138986 ?auto_138985 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139066 - OBJ
      ?auto_139067 - OBJ
      ?auto_139068 - OBJ
      ?auto_139069 - OBJ
      ?auto_139065 - LOCATION
    )
    :vars
    (
      ?auto_139072 - LOCATION
      ?auto_139071 - CITY
      ?auto_139070 - OBJ
      ?auto_139073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139072 ?auto_139071 ) ( IN-CITY ?auto_139065 ?auto_139071 ) ( not ( = ?auto_139065 ?auto_139072 ) ) ( OBJ-AT ?auto_139070 ?auto_139065 ) ( not ( = ?auto_139070 ?auto_139066 ) ) ( OBJ-AT ?auto_139066 ?auto_139072 ) ( TRUCK-AT ?auto_139073 ?auto_139065 ) ( OBJ-AT ?auto_139067 ?auto_139065 ) ( OBJ-AT ?auto_139068 ?auto_139065 ) ( OBJ-AT ?auto_139069 ?auto_139065 ) ( not ( = ?auto_139066 ?auto_139067 ) ) ( not ( = ?auto_139066 ?auto_139068 ) ) ( not ( = ?auto_139066 ?auto_139069 ) ) ( not ( = ?auto_139067 ?auto_139068 ) ) ( not ( = ?auto_139067 ?auto_139069 ) ) ( not ( = ?auto_139067 ?auto_139070 ) ) ( not ( = ?auto_139068 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139070 ) ) ( not ( = ?auto_139069 ?auto_139070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139070 ?auto_139066 ?auto_139065 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141400 - OBJ
      ?auto_141401 - OBJ
      ?auto_141402 - OBJ
      ?auto_141399 - LOCATION
    )
    :vars
    (
      ?auto_141403 - LOCATION
      ?auto_141405 - CITY
      ?auto_141404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141403 ?auto_141405 ) ( IN-CITY ?auto_141399 ?auto_141405 ) ( not ( = ?auto_141399 ?auto_141403 ) ) ( OBJ-AT ?auto_141402 ?auto_141399 ) ( not ( = ?auto_141402 ?auto_141400 ) ) ( OBJ-AT ?auto_141400 ?auto_141403 ) ( TRUCK-AT ?auto_141404 ?auto_141399 ) ( OBJ-AT ?auto_141401 ?auto_141399 ) ( not ( = ?auto_141400 ?auto_141401 ) ) ( not ( = ?auto_141401 ?auto_141402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141402 ?auto_141400 ?auto_141399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147082 - OBJ
      ?auto_147083 - OBJ
      ?auto_147084 - OBJ
      ?auto_147081 - LOCATION
    )
    :vars
    (
      ?auto_147086 - TRUCK
      ?auto_147085 - LOCATION
      ?auto_147087 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_147084 ?auto_147086 ) ( TRUCK-AT ?auto_147086 ?auto_147085 ) ( IN-CITY ?auto_147085 ?auto_147087 ) ( IN-CITY ?auto_147081 ?auto_147087 ) ( not ( = ?auto_147081 ?auto_147085 ) ) ( OBJ-AT ?auto_147082 ?auto_147081 ) ( not ( = ?auto_147082 ?auto_147084 ) ) ( OBJ-AT ?auto_147083 ?auto_147081 ) ( not ( = ?auto_147082 ?auto_147083 ) ) ( not ( = ?auto_147083 ?auto_147084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147082 ?auto_147084 ?auto_147081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148847 - OBJ
      ?auto_148848 - OBJ
      ?auto_148849 - OBJ
      ?auto_148846 - LOCATION
    )
    :vars
    (
      ?auto_148851 - TRUCK
      ?auto_148852 - LOCATION
      ?auto_148850 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_148851 ?auto_148852 ) ( IN-CITY ?auto_148852 ?auto_148850 ) ( IN-CITY ?auto_148846 ?auto_148850 ) ( not ( = ?auto_148846 ?auto_148852 ) ) ( OBJ-AT ?auto_148849 ?auto_148846 ) ( not ( = ?auto_148849 ?auto_148847 ) ) ( OBJ-AT ?auto_148847 ?auto_148852 ) ( OBJ-AT ?auto_148848 ?auto_148846 ) ( not ( = ?auto_148847 ?auto_148848 ) ) ( not ( = ?auto_148848 ?auto_148849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_148849 ?auto_148847 ?auto_148846 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_152042 - OBJ
      ?auto_152043 - OBJ
      ?auto_152044 - OBJ
      ?auto_152041 - LOCATION
    )
    :vars
    (
      ?auto_152047 - LOCATION
      ?auto_152046 - CITY
      ?auto_152045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152047 ?auto_152046 ) ( IN-CITY ?auto_152041 ?auto_152046 ) ( not ( = ?auto_152041 ?auto_152047 ) ) ( OBJ-AT ?auto_152042 ?auto_152041 ) ( not ( = ?auto_152042 ?auto_152043 ) ) ( OBJ-AT ?auto_152043 ?auto_152047 ) ( TRUCK-AT ?auto_152045 ?auto_152041 ) ( OBJ-AT ?auto_152044 ?auto_152041 ) ( not ( = ?auto_152042 ?auto_152044 ) ) ( not ( = ?auto_152043 ?auto_152044 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_152042 ?auto_152043 ?auto_152041 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_153749 - OBJ
      ?auto_153748 - LOCATION
    )
    :vars
    (
      ?auto_153752 - LOCATION
      ?auto_153751 - CITY
      ?auto_153753 - OBJ
      ?auto_153750 - TRUCK
      ?auto_153754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153752 ?auto_153751 ) ( IN-CITY ?auto_153748 ?auto_153751 ) ( not ( = ?auto_153748 ?auto_153752 ) ) ( OBJ-AT ?auto_153753 ?auto_153748 ) ( not ( = ?auto_153753 ?auto_153749 ) ) ( OBJ-AT ?auto_153749 ?auto_153752 ) ( TRUCK-AT ?auto_153750 ?auto_153754 ) ( IN-CITY ?auto_153754 ?auto_153751 ) ( not ( = ?auto_153748 ?auto_153754 ) ) ( not ( = ?auto_153752 ?auto_153754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_153750 ?auto_153754 ?auto_153748 ?auto_153751 )
      ( DELIVER-2PKG ?auto_153753 ?auto_153749 ?auto_153748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_153756 - OBJ
      ?auto_153757 - OBJ
      ?auto_153755 - LOCATION
    )
    :vars
    (
      ?auto_153759 - LOCATION
      ?auto_153758 - CITY
      ?auto_153760 - TRUCK
      ?auto_153761 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153759 ?auto_153758 ) ( IN-CITY ?auto_153755 ?auto_153758 ) ( not ( = ?auto_153755 ?auto_153759 ) ) ( OBJ-AT ?auto_153756 ?auto_153755 ) ( not ( = ?auto_153756 ?auto_153757 ) ) ( OBJ-AT ?auto_153757 ?auto_153759 ) ( TRUCK-AT ?auto_153760 ?auto_153761 ) ( IN-CITY ?auto_153761 ?auto_153758 ) ( not ( = ?auto_153755 ?auto_153761 ) ) ( not ( = ?auto_153759 ?auto_153761 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_153757 ?auto_153755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_153774 - OBJ
      ?auto_153775 - OBJ
      ?auto_153773 - LOCATION
    )
    :vars
    (
      ?auto_153776 - LOCATION
      ?auto_153779 - CITY
      ?auto_153778 - TRUCK
      ?auto_153777 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153776 ?auto_153779 ) ( IN-CITY ?auto_153773 ?auto_153779 ) ( not ( = ?auto_153773 ?auto_153776 ) ) ( OBJ-AT ?auto_153775 ?auto_153773 ) ( not ( = ?auto_153775 ?auto_153774 ) ) ( OBJ-AT ?auto_153774 ?auto_153776 ) ( TRUCK-AT ?auto_153778 ?auto_153777 ) ( IN-CITY ?auto_153777 ?auto_153779 ) ( not ( = ?auto_153773 ?auto_153777 ) ) ( not ( = ?auto_153776 ?auto_153777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153775 ?auto_153774 ?auto_153773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153800 - OBJ
      ?auto_153801 - OBJ
      ?auto_153802 - OBJ
      ?auto_153799 - LOCATION
    )
    :vars
    (
      ?auto_153803 - LOCATION
      ?auto_153806 - CITY
      ?auto_153805 - TRUCK
      ?auto_153804 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153803 ?auto_153806 ) ( IN-CITY ?auto_153799 ?auto_153806 ) ( not ( = ?auto_153799 ?auto_153803 ) ) ( OBJ-AT ?auto_153800 ?auto_153799 ) ( not ( = ?auto_153800 ?auto_153802 ) ) ( OBJ-AT ?auto_153802 ?auto_153803 ) ( TRUCK-AT ?auto_153805 ?auto_153804 ) ( IN-CITY ?auto_153804 ?auto_153806 ) ( not ( = ?auto_153799 ?auto_153804 ) ) ( not ( = ?auto_153803 ?auto_153804 ) ) ( OBJ-AT ?auto_153801 ?auto_153799 ) ( not ( = ?auto_153800 ?auto_153801 ) ) ( not ( = ?auto_153801 ?auto_153802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153800 ?auto_153802 ?auto_153799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153820 - OBJ
      ?auto_153821 - OBJ
      ?auto_153822 - OBJ
      ?auto_153819 - LOCATION
    )
    :vars
    (
      ?auto_153823 - LOCATION
      ?auto_153826 - CITY
      ?auto_153825 - TRUCK
      ?auto_153824 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153823 ?auto_153826 ) ( IN-CITY ?auto_153819 ?auto_153826 ) ( not ( = ?auto_153819 ?auto_153823 ) ) ( OBJ-AT ?auto_153820 ?auto_153819 ) ( not ( = ?auto_153820 ?auto_153821 ) ) ( OBJ-AT ?auto_153821 ?auto_153823 ) ( TRUCK-AT ?auto_153825 ?auto_153824 ) ( IN-CITY ?auto_153824 ?auto_153826 ) ( not ( = ?auto_153819 ?auto_153824 ) ) ( not ( = ?auto_153823 ?auto_153824 ) ) ( OBJ-AT ?auto_153822 ?auto_153819 ) ( not ( = ?auto_153820 ?auto_153822 ) ) ( not ( = ?auto_153821 ?auto_153822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153820 ?auto_153821 ?auto_153819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153852 - OBJ
      ?auto_153853 - OBJ
      ?auto_153854 - OBJ
      ?auto_153851 - LOCATION
    )
    :vars
    (
      ?auto_153856 - LOCATION
      ?auto_153859 - CITY
      ?auto_153855 - OBJ
      ?auto_153858 - TRUCK
      ?auto_153857 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153856 ?auto_153859 ) ( IN-CITY ?auto_153851 ?auto_153859 ) ( not ( = ?auto_153851 ?auto_153856 ) ) ( OBJ-AT ?auto_153855 ?auto_153851 ) ( not ( = ?auto_153855 ?auto_153854 ) ) ( OBJ-AT ?auto_153854 ?auto_153856 ) ( TRUCK-AT ?auto_153858 ?auto_153857 ) ( IN-CITY ?auto_153857 ?auto_153859 ) ( not ( = ?auto_153851 ?auto_153857 ) ) ( not ( = ?auto_153856 ?auto_153857 ) ) ( OBJ-AT ?auto_153852 ?auto_153851 ) ( OBJ-AT ?auto_153853 ?auto_153851 ) ( not ( = ?auto_153852 ?auto_153853 ) ) ( not ( = ?auto_153852 ?auto_153854 ) ) ( not ( = ?auto_153852 ?auto_153855 ) ) ( not ( = ?auto_153853 ?auto_153854 ) ) ( not ( = ?auto_153853 ?auto_153855 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153855 ?auto_153854 ?auto_153851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153874 - OBJ
      ?auto_153875 - OBJ
      ?auto_153876 - OBJ
      ?auto_153873 - LOCATION
    )
    :vars
    (
      ?auto_153878 - LOCATION
      ?auto_153881 - CITY
      ?auto_153877 - OBJ
      ?auto_153880 - TRUCK
      ?auto_153879 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153878 ?auto_153881 ) ( IN-CITY ?auto_153873 ?auto_153881 ) ( not ( = ?auto_153873 ?auto_153878 ) ) ( OBJ-AT ?auto_153877 ?auto_153873 ) ( not ( = ?auto_153877 ?auto_153875 ) ) ( OBJ-AT ?auto_153875 ?auto_153878 ) ( TRUCK-AT ?auto_153880 ?auto_153879 ) ( IN-CITY ?auto_153879 ?auto_153881 ) ( not ( = ?auto_153873 ?auto_153879 ) ) ( not ( = ?auto_153878 ?auto_153879 ) ) ( OBJ-AT ?auto_153874 ?auto_153873 ) ( OBJ-AT ?auto_153876 ?auto_153873 ) ( not ( = ?auto_153874 ?auto_153875 ) ) ( not ( = ?auto_153874 ?auto_153876 ) ) ( not ( = ?auto_153874 ?auto_153877 ) ) ( not ( = ?auto_153875 ?auto_153876 ) ) ( not ( = ?auto_153876 ?auto_153877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153877 ?auto_153875 ?auto_153873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153962 - OBJ
      ?auto_153963 - OBJ
      ?auto_153964 - OBJ
      ?auto_153961 - LOCATION
    )
    :vars
    (
      ?auto_153965 - LOCATION
      ?auto_153968 - CITY
      ?auto_153967 - TRUCK
      ?auto_153966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153965 ?auto_153968 ) ( IN-CITY ?auto_153961 ?auto_153968 ) ( not ( = ?auto_153961 ?auto_153965 ) ) ( OBJ-AT ?auto_153963 ?auto_153961 ) ( not ( = ?auto_153963 ?auto_153962 ) ) ( OBJ-AT ?auto_153962 ?auto_153965 ) ( TRUCK-AT ?auto_153967 ?auto_153966 ) ( IN-CITY ?auto_153966 ?auto_153968 ) ( not ( = ?auto_153961 ?auto_153966 ) ) ( not ( = ?auto_153965 ?auto_153966 ) ) ( OBJ-AT ?auto_153964 ?auto_153961 ) ( not ( = ?auto_153962 ?auto_153964 ) ) ( not ( = ?auto_153963 ?auto_153964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153963 ?auto_153962 ?auto_153961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153994 - OBJ
      ?auto_153995 - OBJ
      ?auto_153996 - OBJ
      ?auto_153993 - LOCATION
    )
    :vars
    (
      ?auto_153998 - LOCATION
      ?auto_154001 - CITY
      ?auto_153997 - OBJ
      ?auto_154000 - TRUCK
      ?auto_153999 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153998 ?auto_154001 ) ( IN-CITY ?auto_153993 ?auto_154001 ) ( not ( = ?auto_153993 ?auto_153998 ) ) ( OBJ-AT ?auto_153997 ?auto_153993 ) ( not ( = ?auto_153997 ?auto_153994 ) ) ( OBJ-AT ?auto_153994 ?auto_153998 ) ( TRUCK-AT ?auto_154000 ?auto_153999 ) ( IN-CITY ?auto_153999 ?auto_154001 ) ( not ( = ?auto_153993 ?auto_153999 ) ) ( not ( = ?auto_153998 ?auto_153999 ) ) ( OBJ-AT ?auto_153995 ?auto_153993 ) ( OBJ-AT ?auto_153996 ?auto_153993 ) ( not ( = ?auto_153994 ?auto_153995 ) ) ( not ( = ?auto_153994 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153997 ) ) ( not ( = ?auto_153996 ?auto_153997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153997 ?auto_153994 ?auto_153993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154091 - OBJ
      ?auto_154092 - OBJ
      ?auto_154093 - OBJ
      ?auto_154094 - OBJ
      ?auto_154090 - LOCATION
    )
    :vars
    (
      ?auto_154095 - LOCATION
      ?auto_154098 - CITY
      ?auto_154097 - TRUCK
      ?auto_154096 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154095 ?auto_154098 ) ( IN-CITY ?auto_154090 ?auto_154098 ) ( not ( = ?auto_154090 ?auto_154095 ) ) ( OBJ-AT ?auto_154091 ?auto_154090 ) ( not ( = ?auto_154091 ?auto_154094 ) ) ( OBJ-AT ?auto_154094 ?auto_154095 ) ( TRUCK-AT ?auto_154097 ?auto_154096 ) ( IN-CITY ?auto_154096 ?auto_154098 ) ( not ( = ?auto_154090 ?auto_154096 ) ) ( not ( = ?auto_154095 ?auto_154096 ) ) ( OBJ-AT ?auto_154092 ?auto_154090 ) ( OBJ-AT ?auto_154093 ?auto_154090 ) ( not ( = ?auto_154091 ?auto_154092 ) ) ( not ( = ?auto_154091 ?auto_154093 ) ) ( not ( = ?auto_154092 ?auto_154093 ) ) ( not ( = ?auto_154092 ?auto_154094 ) ) ( not ( = ?auto_154093 ?auto_154094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154091 ?auto_154094 ?auto_154090 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154118 - OBJ
      ?auto_154119 - OBJ
      ?auto_154120 - OBJ
      ?auto_154121 - OBJ
      ?auto_154117 - LOCATION
    )
    :vars
    (
      ?auto_154122 - LOCATION
      ?auto_154125 - CITY
      ?auto_154124 - TRUCK
      ?auto_154123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154122 ?auto_154125 ) ( IN-CITY ?auto_154117 ?auto_154125 ) ( not ( = ?auto_154117 ?auto_154122 ) ) ( OBJ-AT ?auto_154121 ?auto_154117 ) ( not ( = ?auto_154121 ?auto_154120 ) ) ( OBJ-AT ?auto_154120 ?auto_154122 ) ( TRUCK-AT ?auto_154124 ?auto_154123 ) ( IN-CITY ?auto_154123 ?auto_154125 ) ( not ( = ?auto_154117 ?auto_154123 ) ) ( not ( = ?auto_154122 ?auto_154123 ) ) ( OBJ-AT ?auto_154118 ?auto_154117 ) ( OBJ-AT ?auto_154119 ?auto_154117 ) ( not ( = ?auto_154118 ?auto_154119 ) ) ( not ( = ?auto_154118 ?auto_154120 ) ) ( not ( = ?auto_154118 ?auto_154121 ) ) ( not ( = ?auto_154119 ?auto_154120 ) ) ( not ( = ?auto_154119 ?auto_154121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154121 ?auto_154120 ?auto_154117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154127 - OBJ
      ?auto_154128 - OBJ
      ?auto_154129 - OBJ
      ?auto_154130 - OBJ
      ?auto_154126 - LOCATION
    )
    :vars
    (
      ?auto_154131 - LOCATION
      ?auto_154134 - CITY
      ?auto_154133 - TRUCK
      ?auto_154132 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154131 ?auto_154134 ) ( IN-CITY ?auto_154126 ?auto_154134 ) ( not ( = ?auto_154126 ?auto_154131 ) ) ( OBJ-AT ?auto_154127 ?auto_154126 ) ( not ( = ?auto_154127 ?auto_154129 ) ) ( OBJ-AT ?auto_154129 ?auto_154131 ) ( TRUCK-AT ?auto_154133 ?auto_154132 ) ( IN-CITY ?auto_154132 ?auto_154134 ) ( not ( = ?auto_154126 ?auto_154132 ) ) ( not ( = ?auto_154131 ?auto_154132 ) ) ( OBJ-AT ?auto_154128 ?auto_154126 ) ( OBJ-AT ?auto_154130 ?auto_154126 ) ( not ( = ?auto_154127 ?auto_154128 ) ) ( not ( = ?auto_154127 ?auto_154130 ) ) ( not ( = ?auto_154128 ?auto_154129 ) ) ( not ( = ?auto_154128 ?auto_154130 ) ) ( not ( = ?auto_154129 ?auto_154130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154127 ?auto_154129 ?auto_154126 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154154 - OBJ
      ?auto_154155 - OBJ
      ?auto_154156 - OBJ
      ?auto_154157 - OBJ
      ?auto_154153 - LOCATION
    )
    :vars
    (
      ?auto_154158 - LOCATION
      ?auto_154161 - CITY
      ?auto_154160 - TRUCK
      ?auto_154159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154158 ?auto_154161 ) ( IN-CITY ?auto_154153 ?auto_154161 ) ( not ( = ?auto_154153 ?auto_154158 ) ) ( OBJ-AT ?auto_154156 ?auto_154153 ) ( not ( = ?auto_154156 ?auto_154157 ) ) ( OBJ-AT ?auto_154157 ?auto_154158 ) ( TRUCK-AT ?auto_154160 ?auto_154159 ) ( IN-CITY ?auto_154159 ?auto_154161 ) ( not ( = ?auto_154153 ?auto_154159 ) ) ( not ( = ?auto_154158 ?auto_154159 ) ) ( OBJ-AT ?auto_154154 ?auto_154153 ) ( OBJ-AT ?auto_154155 ?auto_154153 ) ( not ( = ?auto_154154 ?auto_154155 ) ) ( not ( = ?auto_154154 ?auto_154156 ) ) ( not ( = ?auto_154154 ?auto_154157 ) ) ( not ( = ?auto_154155 ?auto_154156 ) ) ( not ( = ?auto_154155 ?auto_154157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154156 ?auto_154157 ?auto_154153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154280 - OBJ
      ?auto_154281 - OBJ
      ?auto_154282 - OBJ
      ?auto_154283 - OBJ
      ?auto_154279 - LOCATION
    )
    :vars
    (
      ?auto_154284 - LOCATION
      ?auto_154287 - CITY
      ?auto_154286 - TRUCK
      ?auto_154285 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154284 ?auto_154287 ) ( IN-CITY ?auto_154279 ?auto_154287 ) ( not ( = ?auto_154279 ?auto_154284 ) ) ( OBJ-AT ?auto_154282 ?auto_154279 ) ( not ( = ?auto_154282 ?auto_154281 ) ) ( OBJ-AT ?auto_154281 ?auto_154284 ) ( TRUCK-AT ?auto_154286 ?auto_154285 ) ( IN-CITY ?auto_154285 ?auto_154287 ) ( not ( = ?auto_154279 ?auto_154285 ) ) ( not ( = ?auto_154284 ?auto_154285 ) ) ( OBJ-AT ?auto_154280 ?auto_154279 ) ( OBJ-AT ?auto_154283 ?auto_154279 ) ( not ( = ?auto_154280 ?auto_154281 ) ) ( not ( = ?auto_154280 ?auto_154282 ) ) ( not ( = ?auto_154280 ?auto_154283 ) ) ( not ( = ?auto_154281 ?auto_154283 ) ) ( not ( = ?auto_154282 ?auto_154283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154282 ?auto_154281 ?auto_154279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154316 - OBJ
      ?auto_154317 - OBJ
      ?auto_154318 - OBJ
      ?auto_154319 - OBJ
      ?auto_154315 - LOCATION
    )
    :vars
    (
      ?auto_154320 - LOCATION
      ?auto_154323 - CITY
      ?auto_154322 - TRUCK
      ?auto_154321 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154320 ?auto_154323 ) ( IN-CITY ?auto_154315 ?auto_154323 ) ( not ( = ?auto_154315 ?auto_154320 ) ) ( OBJ-AT ?auto_154319 ?auto_154315 ) ( not ( = ?auto_154319 ?auto_154317 ) ) ( OBJ-AT ?auto_154317 ?auto_154320 ) ( TRUCK-AT ?auto_154322 ?auto_154321 ) ( IN-CITY ?auto_154321 ?auto_154323 ) ( not ( = ?auto_154315 ?auto_154321 ) ) ( not ( = ?auto_154320 ?auto_154321 ) ) ( OBJ-AT ?auto_154316 ?auto_154315 ) ( OBJ-AT ?auto_154318 ?auto_154315 ) ( not ( = ?auto_154316 ?auto_154317 ) ) ( not ( = ?auto_154316 ?auto_154318 ) ) ( not ( = ?auto_154316 ?auto_154319 ) ) ( not ( = ?auto_154317 ?auto_154318 ) ) ( not ( = ?auto_154318 ?auto_154319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154319 ?auto_154317 ?auto_154315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154325 - OBJ
      ?auto_154326 - OBJ
      ?auto_154327 - OBJ
      ?auto_154328 - OBJ
      ?auto_154324 - LOCATION
    )
    :vars
    (
      ?auto_154329 - LOCATION
      ?auto_154332 - CITY
      ?auto_154331 - TRUCK
      ?auto_154330 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154329 ?auto_154332 ) ( IN-CITY ?auto_154324 ?auto_154332 ) ( not ( = ?auto_154324 ?auto_154329 ) ) ( OBJ-AT ?auto_154325 ?auto_154324 ) ( not ( = ?auto_154325 ?auto_154326 ) ) ( OBJ-AT ?auto_154326 ?auto_154329 ) ( TRUCK-AT ?auto_154331 ?auto_154330 ) ( IN-CITY ?auto_154330 ?auto_154332 ) ( not ( = ?auto_154324 ?auto_154330 ) ) ( not ( = ?auto_154329 ?auto_154330 ) ) ( OBJ-AT ?auto_154327 ?auto_154324 ) ( OBJ-AT ?auto_154328 ?auto_154324 ) ( not ( = ?auto_154325 ?auto_154327 ) ) ( not ( = ?auto_154325 ?auto_154328 ) ) ( not ( = ?auto_154326 ?auto_154327 ) ) ( not ( = ?auto_154326 ?auto_154328 ) ) ( not ( = ?auto_154327 ?auto_154328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154325 ?auto_154326 ?auto_154324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154433 - OBJ
      ?auto_154434 - OBJ
      ?auto_154435 - OBJ
      ?auto_154436 - OBJ
      ?auto_154432 - LOCATION
    )
    :vars
    (
      ?auto_154437 - LOCATION
      ?auto_154440 - CITY
      ?auto_154439 - TRUCK
      ?auto_154438 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154437 ?auto_154440 ) ( IN-CITY ?auto_154432 ?auto_154440 ) ( not ( = ?auto_154432 ?auto_154437 ) ) ( OBJ-AT ?auto_154434 ?auto_154432 ) ( not ( = ?auto_154434 ?auto_154436 ) ) ( OBJ-AT ?auto_154436 ?auto_154437 ) ( TRUCK-AT ?auto_154439 ?auto_154438 ) ( IN-CITY ?auto_154438 ?auto_154440 ) ( not ( = ?auto_154432 ?auto_154438 ) ) ( not ( = ?auto_154437 ?auto_154438 ) ) ( OBJ-AT ?auto_154433 ?auto_154432 ) ( OBJ-AT ?auto_154435 ?auto_154432 ) ( not ( = ?auto_154433 ?auto_154434 ) ) ( not ( = ?auto_154433 ?auto_154435 ) ) ( not ( = ?auto_154433 ?auto_154436 ) ) ( not ( = ?auto_154434 ?auto_154435 ) ) ( not ( = ?auto_154435 ?auto_154436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154434 ?auto_154436 ?auto_154432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154460 - OBJ
      ?auto_154461 - OBJ
      ?auto_154462 - OBJ
      ?auto_154463 - OBJ
      ?auto_154459 - LOCATION
    )
    :vars
    (
      ?auto_154464 - LOCATION
      ?auto_154467 - CITY
      ?auto_154466 - TRUCK
      ?auto_154465 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154464 ?auto_154467 ) ( IN-CITY ?auto_154459 ?auto_154467 ) ( not ( = ?auto_154459 ?auto_154464 ) ) ( OBJ-AT ?auto_154461 ?auto_154459 ) ( not ( = ?auto_154461 ?auto_154462 ) ) ( OBJ-AT ?auto_154462 ?auto_154464 ) ( TRUCK-AT ?auto_154466 ?auto_154465 ) ( IN-CITY ?auto_154465 ?auto_154467 ) ( not ( = ?auto_154459 ?auto_154465 ) ) ( not ( = ?auto_154464 ?auto_154465 ) ) ( OBJ-AT ?auto_154460 ?auto_154459 ) ( OBJ-AT ?auto_154463 ?auto_154459 ) ( not ( = ?auto_154460 ?auto_154461 ) ) ( not ( = ?auto_154460 ?auto_154462 ) ) ( not ( = ?auto_154460 ?auto_154463 ) ) ( not ( = ?auto_154461 ?auto_154463 ) ) ( not ( = ?auto_154462 ?auto_154463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154461 ?auto_154462 ?auto_154459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154496 - OBJ
      ?auto_154497 - OBJ
      ?auto_154498 - OBJ
      ?auto_154499 - OBJ
      ?auto_154495 - LOCATION
    )
    :vars
    (
      ?auto_154501 - LOCATION
      ?auto_154504 - CITY
      ?auto_154500 - OBJ
      ?auto_154503 - TRUCK
      ?auto_154502 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154501 ?auto_154504 ) ( IN-CITY ?auto_154495 ?auto_154504 ) ( not ( = ?auto_154495 ?auto_154501 ) ) ( OBJ-AT ?auto_154500 ?auto_154495 ) ( not ( = ?auto_154500 ?auto_154499 ) ) ( OBJ-AT ?auto_154499 ?auto_154501 ) ( TRUCK-AT ?auto_154503 ?auto_154502 ) ( IN-CITY ?auto_154502 ?auto_154504 ) ( not ( = ?auto_154495 ?auto_154502 ) ) ( not ( = ?auto_154501 ?auto_154502 ) ) ( OBJ-AT ?auto_154496 ?auto_154495 ) ( OBJ-AT ?auto_154497 ?auto_154495 ) ( OBJ-AT ?auto_154498 ?auto_154495 ) ( not ( = ?auto_154496 ?auto_154497 ) ) ( not ( = ?auto_154496 ?auto_154498 ) ) ( not ( = ?auto_154496 ?auto_154499 ) ) ( not ( = ?auto_154496 ?auto_154500 ) ) ( not ( = ?auto_154497 ?auto_154498 ) ) ( not ( = ?auto_154497 ?auto_154499 ) ) ( not ( = ?auto_154497 ?auto_154500 ) ) ( not ( = ?auto_154498 ?auto_154499 ) ) ( not ( = ?auto_154498 ?auto_154500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154500 ?auto_154499 ?auto_154495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154525 - OBJ
      ?auto_154526 - OBJ
      ?auto_154527 - OBJ
      ?auto_154528 - OBJ
      ?auto_154524 - LOCATION
    )
    :vars
    (
      ?auto_154530 - LOCATION
      ?auto_154533 - CITY
      ?auto_154529 - OBJ
      ?auto_154532 - TRUCK
      ?auto_154531 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154530 ?auto_154533 ) ( IN-CITY ?auto_154524 ?auto_154533 ) ( not ( = ?auto_154524 ?auto_154530 ) ) ( OBJ-AT ?auto_154529 ?auto_154524 ) ( not ( = ?auto_154529 ?auto_154527 ) ) ( OBJ-AT ?auto_154527 ?auto_154530 ) ( TRUCK-AT ?auto_154532 ?auto_154531 ) ( IN-CITY ?auto_154531 ?auto_154533 ) ( not ( = ?auto_154524 ?auto_154531 ) ) ( not ( = ?auto_154530 ?auto_154531 ) ) ( OBJ-AT ?auto_154525 ?auto_154524 ) ( OBJ-AT ?auto_154526 ?auto_154524 ) ( OBJ-AT ?auto_154528 ?auto_154524 ) ( not ( = ?auto_154525 ?auto_154526 ) ) ( not ( = ?auto_154525 ?auto_154527 ) ) ( not ( = ?auto_154525 ?auto_154528 ) ) ( not ( = ?auto_154525 ?auto_154529 ) ) ( not ( = ?auto_154526 ?auto_154527 ) ) ( not ( = ?auto_154526 ?auto_154528 ) ) ( not ( = ?auto_154526 ?auto_154529 ) ) ( not ( = ?auto_154527 ?auto_154528 ) ) ( not ( = ?auto_154528 ?auto_154529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154529 ?auto_154527 ?auto_154524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154668 - OBJ
      ?auto_154669 - OBJ
      ?auto_154670 - OBJ
      ?auto_154671 - OBJ
      ?auto_154667 - LOCATION
    )
    :vars
    (
      ?auto_154673 - LOCATION
      ?auto_154676 - CITY
      ?auto_154672 - OBJ
      ?auto_154675 - TRUCK
      ?auto_154674 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154673 ?auto_154676 ) ( IN-CITY ?auto_154667 ?auto_154676 ) ( not ( = ?auto_154667 ?auto_154673 ) ) ( OBJ-AT ?auto_154672 ?auto_154667 ) ( not ( = ?auto_154672 ?auto_154669 ) ) ( OBJ-AT ?auto_154669 ?auto_154673 ) ( TRUCK-AT ?auto_154675 ?auto_154674 ) ( IN-CITY ?auto_154674 ?auto_154676 ) ( not ( = ?auto_154667 ?auto_154674 ) ) ( not ( = ?auto_154673 ?auto_154674 ) ) ( OBJ-AT ?auto_154668 ?auto_154667 ) ( OBJ-AT ?auto_154670 ?auto_154667 ) ( OBJ-AT ?auto_154671 ?auto_154667 ) ( not ( = ?auto_154668 ?auto_154669 ) ) ( not ( = ?auto_154668 ?auto_154670 ) ) ( not ( = ?auto_154668 ?auto_154671 ) ) ( not ( = ?auto_154668 ?auto_154672 ) ) ( not ( = ?auto_154669 ?auto_154670 ) ) ( not ( = ?auto_154669 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154672 ) ) ( not ( = ?auto_154671 ?auto_154672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154672 ?auto_154669 ?auto_154667 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155128 - OBJ
      ?auto_155129 - OBJ
      ?auto_155130 - OBJ
      ?auto_155131 - OBJ
      ?auto_155127 - LOCATION
    )
    :vars
    (
      ?auto_155132 - LOCATION
      ?auto_155135 - CITY
      ?auto_155134 - TRUCK
      ?auto_155133 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155132 ?auto_155135 ) ( IN-CITY ?auto_155127 ?auto_155135 ) ( not ( = ?auto_155127 ?auto_155132 ) ) ( OBJ-AT ?auto_155130 ?auto_155127 ) ( not ( = ?auto_155130 ?auto_155128 ) ) ( OBJ-AT ?auto_155128 ?auto_155132 ) ( TRUCK-AT ?auto_155134 ?auto_155133 ) ( IN-CITY ?auto_155133 ?auto_155135 ) ( not ( = ?auto_155127 ?auto_155133 ) ) ( not ( = ?auto_155132 ?auto_155133 ) ) ( OBJ-AT ?auto_155129 ?auto_155127 ) ( OBJ-AT ?auto_155131 ?auto_155127 ) ( not ( = ?auto_155128 ?auto_155129 ) ) ( not ( = ?auto_155128 ?auto_155131 ) ) ( not ( = ?auto_155129 ?auto_155130 ) ) ( not ( = ?auto_155129 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155130 ?auto_155128 ?auto_155127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155164 - OBJ
      ?auto_155165 - OBJ
      ?auto_155166 - OBJ
      ?auto_155167 - OBJ
      ?auto_155163 - LOCATION
    )
    :vars
    (
      ?auto_155168 - LOCATION
      ?auto_155171 - CITY
      ?auto_155170 - TRUCK
      ?auto_155169 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155168 ?auto_155171 ) ( IN-CITY ?auto_155163 ?auto_155171 ) ( not ( = ?auto_155163 ?auto_155168 ) ) ( OBJ-AT ?auto_155167 ?auto_155163 ) ( not ( = ?auto_155167 ?auto_155164 ) ) ( OBJ-AT ?auto_155164 ?auto_155168 ) ( TRUCK-AT ?auto_155170 ?auto_155169 ) ( IN-CITY ?auto_155169 ?auto_155171 ) ( not ( = ?auto_155163 ?auto_155169 ) ) ( not ( = ?auto_155168 ?auto_155169 ) ) ( OBJ-AT ?auto_155165 ?auto_155163 ) ( OBJ-AT ?auto_155166 ?auto_155163 ) ( not ( = ?auto_155164 ?auto_155165 ) ) ( not ( = ?auto_155164 ?auto_155166 ) ) ( not ( = ?auto_155165 ?auto_155166 ) ) ( not ( = ?auto_155165 ?auto_155167 ) ) ( not ( = ?auto_155166 ?auto_155167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155167 ?auto_155164 ?auto_155163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155173 - OBJ
      ?auto_155174 - OBJ
      ?auto_155175 - OBJ
      ?auto_155176 - OBJ
      ?auto_155172 - LOCATION
    )
    :vars
    (
      ?auto_155177 - LOCATION
      ?auto_155180 - CITY
      ?auto_155179 - TRUCK
      ?auto_155178 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155177 ?auto_155180 ) ( IN-CITY ?auto_155172 ?auto_155180 ) ( not ( = ?auto_155172 ?auto_155177 ) ) ( OBJ-AT ?auto_155174 ?auto_155172 ) ( not ( = ?auto_155174 ?auto_155173 ) ) ( OBJ-AT ?auto_155173 ?auto_155177 ) ( TRUCK-AT ?auto_155179 ?auto_155178 ) ( IN-CITY ?auto_155178 ?auto_155180 ) ( not ( = ?auto_155172 ?auto_155178 ) ) ( not ( = ?auto_155177 ?auto_155178 ) ) ( OBJ-AT ?auto_155175 ?auto_155172 ) ( OBJ-AT ?auto_155176 ?auto_155172 ) ( not ( = ?auto_155173 ?auto_155175 ) ) ( not ( = ?auto_155173 ?auto_155176 ) ) ( not ( = ?auto_155174 ?auto_155175 ) ) ( not ( = ?auto_155174 ?auto_155176 ) ) ( not ( = ?auto_155175 ?auto_155176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155174 ?auto_155173 ?auto_155172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155317 - OBJ
      ?auto_155318 - OBJ
      ?auto_155319 - OBJ
      ?auto_155320 - OBJ
      ?auto_155316 - LOCATION
    )
    :vars
    (
      ?auto_155322 - LOCATION
      ?auto_155325 - CITY
      ?auto_155321 - OBJ
      ?auto_155324 - TRUCK
      ?auto_155323 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155322 ?auto_155325 ) ( IN-CITY ?auto_155316 ?auto_155325 ) ( not ( = ?auto_155316 ?auto_155322 ) ) ( OBJ-AT ?auto_155321 ?auto_155316 ) ( not ( = ?auto_155321 ?auto_155317 ) ) ( OBJ-AT ?auto_155317 ?auto_155322 ) ( TRUCK-AT ?auto_155324 ?auto_155323 ) ( IN-CITY ?auto_155323 ?auto_155325 ) ( not ( = ?auto_155316 ?auto_155323 ) ) ( not ( = ?auto_155322 ?auto_155323 ) ) ( OBJ-AT ?auto_155318 ?auto_155316 ) ( OBJ-AT ?auto_155319 ?auto_155316 ) ( OBJ-AT ?auto_155320 ?auto_155316 ) ( not ( = ?auto_155317 ?auto_155318 ) ) ( not ( = ?auto_155317 ?auto_155319 ) ) ( not ( = ?auto_155317 ?auto_155320 ) ) ( not ( = ?auto_155318 ?auto_155319 ) ) ( not ( = ?auto_155318 ?auto_155320 ) ) ( not ( = ?auto_155318 ?auto_155321 ) ) ( not ( = ?auto_155319 ?auto_155320 ) ) ( not ( = ?auto_155319 ?auto_155321 ) ) ( not ( = ?auto_155320 ?auto_155321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155321 ?auto_155317 ?auto_155316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155789 - OBJ
      ?auto_155790 - OBJ
      ?auto_155791 - OBJ
      ?auto_155788 - LOCATION
    )
    :vars
    (
      ?auto_155794 - LOCATION
      ?auto_155795 - CITY
      ?auto_155793 - TRUCK
      ?auto_155792 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155794 ?auto_155795 ) ( IN-CITY ?auto_155788 ?auto_155795 ) ( not ( = ?auto_155788 ?auto_155794 ) ) ( OBJ-AT ?auto_155791 ?auto_155788 ) ( not ( = ?auto_155791 ?auto_155790 ) ) ( OBJ-AT ?auto_155790 ?auto_155794 ) ( TRUCK-AT ?auto_155793 ?auto_155792 ) ( IN-CITY ?auto_155792 ?auto_155795 ) ( not ( = ?auto_155788 ?auto_155792 ) ) ( not ( = ?auto_155794 ?auto_155792 ) ) ( OBJ-AT ?auto_155789 ?auto_155788 ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155791 ?auto_155790 ?auto_155788 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161472 - OBJ
      ?auto_161473 - OBJ
      ?auto_161474 - OBJ
      ?auto_161471 - LOCATION
    )
    :vars
    (
      ?auto_161478 - LOCATION
      ?auto_161477 - CITY
      ?auto_161476 - TRUCK
      ?auto_161475 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_161478 ?auto_161477 ) ( IN-CITY ?auto_161471 ?auto_161477 ) ( not ( = ?auto_161471 ?auto_161478 ) ) ( OBJ-AT ?auto_161474 ?auto_161471 ) ( not ( = ?auto_161474 ?auto_161472 ) ) ( OBJ-AT ?auto_161472 ?auto_161478 ) ( TRUCK-AT ?auto_161476 ?auto_161475 ) ( IN-CITY ?auto_161475 ?auto_161477 ) ( not ( = ?auto_161471 ?auto_161475 ) ) ( not ( = ?auto_161478 ?auto_161475 ) ) ( OBJ-AT ?auto_161473 ?auto_161471 ) ( not ( = ?auto_161472 ?auto_161473 ) ) ( not ( = ?auto_161473 ?auto_161474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161474 ?auto_161472 ?auto_161471 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_168824 - OBJ
      ?auto_168823 - LOCATION
    )
    :vars
    (
      ?auto_168825 - LOCATION
      ?auto_168828 - CITY
      ?auto_168826 - OBJ
      ?auto_168827 - TRUCK
      ?auto_168829 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168825 ?auto_168828 ) ( IN-CITY ?auto_168823 ?auto_168828 ) ( not ( = ?auto_168823 ?auto_168825 ) ) ( not ( = ?auto_168826 ?auto_168824 ) ) ( OBJ-AT ?auto_168824 ?auto_168825 ) ( IN-TRUCK ?auto_168826 ?auto_168827 ) ( TRUCK-AT ?auto_168827 ?auto_168829 ) ( IN-CITY ?auto_168829 ?auto_168828 ) ( not ( = ?auto_168823 ?auto_168829 ) ) ( not ( = ?auto_168825 ?auto_168829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_168827 ?auto_168829 ?auto_168823 ?auto_168828 )
      ( DELIVER-2PKG ?auto_168826 ?auto_168824 ?auto_168823 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_168831 - OBJ
      ?auto_168832 - OBJ
      ?auto_168830 - LOCATION
    )
    :vars
    (
      ?auto_168836 - LOCATION
      ?auto_168833 - CITY
      ?auto_168835 - TRUCK
      ?auto_168834 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168836 ?auto_168833 ) ( IN-CITY ?auto_168830 ?auto_168833 ) ( not ( = ?auto_168830 ?auto_168836 ) ) ( not ( = ?auto_168831 ?auto_168832 ) ) ( OBJ-AT ?auto_168832 ?auto_168836 ) ( IN-TRUCK ?auto_168831 ?auto_168835 ) ( TRUCK-AT ?auto_168835 ?auto_168834 ) ( IN-CITY ?auto_168834 ?auto_168833 ) ( not ( = ?auto_168830 ?auto_168834 ) ) ( not ( = ?auto_168836 ?auto_168834 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_168832 ?auto_168830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_168854 - OBJ
      ?auto_168855 - OBJ
      ?auto_168853 - LOCATION
    )
    :vars
    (
      ?auto_168856 - LOCATION
      ?auto_168858 - CITY
      ?auto_168857 - TRUCK
      ?auto_168859 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168856 ?auto_168858 ) ( IN-CITY ?auto_168853 ?auto_168858 ) ( not ( = ?auto_168853 ?auto_168856 ) ) ( not ( = ?auto_168855 ?auto_168854 ) ) ( OBJ-AT ?auto_168854 ?auto_168856 ) ( IN-TRUCK ?auto_168855 ?auto_168857 ) ( TRUCK-AT ?auto_168857 ?auto_168859 ) ( IN-CITY ?auto_168859 ?auto_168858 ) ( not ( = ?auto_168853 ?auto_168859 ) ) ( not ( = ?auto_168856 ?auto_168859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168855 ?auto_168854 ?auto_168853 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_170840 - OBJ
      ?auto_170839 - LOCATION
    )
    :vars
    (
      ?auto_170841 - LOCATION
      ?auto_170844 - CITY
      ?auto_170842 - OBJ
      ?auto_170843 - TRUCK
      ?auto_170845 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170841 ?auto_170844 ) ( IN-CITY ?auto_170839 ?auto_170844 ) ( not ( = ?auto_170839 ?auto_170841 ) ) ( not ( = ?auto_170842 ?auto_170840 ) ) ( OBJ-AT ?auto_170840 ?auto_170841 ) ( TRUCK-AT ?auto_170843 ?auto_170845 ) ( IN-CITY ?auto_170845 ?auto_170844 ) ( not ( = ?auto_170839 ?auto_170845 ) ) ( not ( = ?auto_170841 ?auto_170845 ) ) ( OBJ-AT ?auto_170842 ?auto_170845 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_170842 ?auto_170843 ?auto_170845 )
      ( DELIVER-2PKG ?auto_170842 ?auto_170840 ?auto_170839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170847 - OBJ
      ?auto_170848 - OBJ
      ?auto_170846 - LOCATION
    )
    :vars
    (
      ?auto_170851 - LOCATION
      ?auto_170852 - CITY
      ?auto_170850 - TRUCK
      ?auto_170849 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170851 ?auto_170852 ) ( IN-CITY ?auto_170846 ?auto_170852 ) ( not ( = ?auto_170846 ?auto_170851 ) ) ( not ( = ?auto_170847 ?auto_170848 ) ) ( OBJ-AT ?auto_170848 ?auto_170851 ) ( TRUCK-AT ?auto_170850 ?auto_170849 ) ( IN-CITY ?auto_170849 ?auto_170852 ) ( not ( = ?auto_170846 ?auto_170849 ) ) ( not ( = ?auto_170851 ?auto_170849 ) ) ( OBJ-AT ?auto_170847 ?auto_170849 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_170848 ?auto_170846 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170860 - OBJ
      ?auto_170861 - OBJ
      ?auto_170859 - LOCATION
    )
    :vars
    (
      ?auto_170864 - LOCATION
      ?auto_170863 - CITY
      ?auto_170865 - TRUCK
      ?auto_170862 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170864 ?auto_170863 ) ( IN-CITY ?auto_170859 ?auto_170863 ) ( not ( = ?auto_170859 ?auto_170864 ) ) ( not ( = ?auto_170861 ?auto_170860 ) ) ( OBJ-AT ?auto_170860 ?auto_170864 ) ( TRUCK-AT ?auto_170865 ?auto_170862 ) ( IN-CITY ?auto_170862 ?auto_170863 ) ( not ( = ?auto_170859 ?auto_170862 ) ) ( not ( = ?auto_170864 ?auto_170862 ) ) ( OBJ-AT ?auto_170861 ?auto_170862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170861 ?auto_170860 ?auto_170859 ) )
  )

)

