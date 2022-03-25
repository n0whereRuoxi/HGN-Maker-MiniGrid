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
      ?auto_174553 - OBJ
      ?auto_174552 - LOCATION
    )
    :vars
    (
      ?auto_174554 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174554 ?auto_174552 ) ( IN-TRUCK ?auto_174553 ?auto_174554 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_174553 ?auto_174554 ?auto_174552 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174571 - OBJ
      ?auto_174570 - LOCATION
    )
    :vars
    (
      ?auto_174572 - TRUCK
      ?auto_174573 - LOCATION
      ?auto_174574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174571 ?auto_174572 ) ( TRUCK-AT ?auto_174572 ?auto_174573 ) ( IN-CITY ?auto_174573 ?auto_174574 ) ( IN-CITY ?auto_174570 ?auto_174574 ) ( not ( = ?auto_174570 ?auto_174573 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_174572 ?auto_174573 ?auto_174570 ?auto_174574 )
      ( DELIVER-1PKG ?auto_174571 ?auto_174570 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174597 - OBJ
      ?auto_174596 - LOCATION
    )
    :vars
    (
      ?auto_174599 - TRUCK
      ?auto_174598 - LOCATION
      ?auto_174600 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174599 ?auto_174598 ) ( IN-CITY ?auto_174598 ?auto_174600 ) ( IN-CITY ?auto_174596 ?auto_174600 ) ( not ( = ?auto_174596 ?auto_174598 ) ) ( OBJ-AT ?auto_174597 ?auto_174598 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_174597 ?auto_174599 ?auto_174598 )
      ( DELIVER-1PKG ?auto_174597 ?auto_174596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174623 - OBJ
      ?auto_174622 - LOCATION
    )
    :vars
    (
      ?auto_174624 - LOCATION
      ?auto_174626 - CITY
      ?auto_174625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174624 ?auto_174626 ) ( IN-CITY ?auto_174622 ?auto_174626 ) ( not ( = ?auto_174622 ?auto_174624 ) ) ( OBJ-AT ?auto_174623 ?auto_174624 ) ( TRUCK-AT ?auto_174625 ?auto_174622 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_174625 ?auto_174622 ?auto_174624 ?auto_174626 )
      ( DELIVER-1PKG ?auto_174623 ?auto_174622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174766 - OBJ
      ?auto_174767 - OBJ
      ?auto_174765 - LOCATION
    )
    :vars
    (
      ?auto_174768 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174768 ?auto_174765 ) ( IN-TRUCK ?auto_174767 ?auto_174768 ) ( OBJ-AT ?auto_174766 ?auto_174765 ) ( not ( = ?auto_174766 ?auto_174767 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174767 ?auto_174765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174770 - OBJ
      ?auto_174771 - OBJ
      ?auto_174769 - LOCATION
    )
    :vars
    (
      ?auto_174772 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174772 ?auto_174769 ) ( IN-TRUCK ?auto_174770 ?auto_174772 ) ( OBJ-AT ?auto_174771 ?auto_174769 ) ( not ( = ?auto_174770 ?auto_174771 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174770 ?auto_174769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174778 - OBJ
      ?auto_174779 - OBJ
      ?auto_174780 - OBJ
      ?auto_174777 - LOCATION
    )
    :vars
    (
      ?auto_174781 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174781 ?auto_174777 ) ( IN-TRUCK ?auto_174780 ?auto_174781 ) ( OBJ-AT ?auto_174778 ?auto_174777 ) ( OBJ-AT ?auto_174779 ?auto_174777 ) ( not ( = ?auto_174778 ?auto_174779 ) ) ( not ( = ?auto_174778 ?auto_174780 ) ) ( not ( = ?auto_174779 ?auto_174780 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174780 ?auto_174777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174783 - OBJ
      ?auto_174784 - OBJ
      ?auto_174785 - OBJ
      ?auto_174782 - LOCATION
    )
    :vars
    (
      ?auto_174786 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174786 ?auto_174782 ) ( IN-TRUCK ?auto_174784 ?auto_174786 ) ( OBJ-AT ?auto_174783 ?auto_174782 ) ( OBJ-AT ?auto_174785 ?auto_174782 ) ( not ( = ?auto_174783 ?auto_174784 ) ) ( not ( = ?auto_174783 ?auto_174785 ) ) ( not ( = ?auto_174784 ?auto_174785 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174784 ?auto_174782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174793 - OBJ
      ?auto_174794 - OBJ
      ?auto_174795 - OBJ
      ?auto_174792 - LOCATION
    )
    :vars
    (
      ?auto_174796 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174796 ?auto_174792 ) ( IN-TRUCK ?auto_174793 ?auto_174796 ) ( OBJ-AT ?auto_174794 ?auto_174792 ) ( OBJ-AT ?auto_174795 ?auto_174792 ) ( not ( = ?auto_174793 ?auto_174794 ) ) ( not ( = ?auto_174793 ?auto_174795 ) ) ( not ( = ?auto_174794 ?auto_174795 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174793 ?auto_174792 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174813 - OBJ
      ?auto_174814 - OBJ
      ?auto_174815 - OBJ
      ?auto_174816 - OBJ
      ?auto_174812 - LOCATION
    )
    :vars
    (
      ?auto_174817 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174817 ?auto_174812 ) ( IN-TRUCK ?auto_174816 ?auto_174817 ) ( OBJ-AT ?auto_174813 ?auto_174812 ) ( OBJ-AT ?auto_174814 ?auto_174812 ) ( OBJ-AT ?auto_174815 ?auto_174812 ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174815 ) ) ( not ( = ?auto_174813 ?auto_174816 ) ) ( not ( = ?auto_174814 ?auto_174815 ) ) ( not ( = ?auto_174814 ?auto_174816 ) ) ( not ( = ?auto_174815 ?auto_174816 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174816 ?auto_174812 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174819 - OBJ
      ?auto_174820 - OBJ
      ?auto_174821 - OBJ
      ?auto_174822 - OBJ
      ?auto_174818 - LOCATION
    )
    :vars
    (
      ?auto_174823 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174823 ?auto_174818 ) ( IN-TRUCK ?auto_174821 ?auto_174823 ) ( OBJ-AT ?auto_174819 ?auto_174818 ) ( OBJ-AT ?auto_174820 ?auto_174818 ) ( OBJ-AT ?auto_174822 ?auto_174818 ) ( not ( = ?auto_174819 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174821 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) ( not ( = ?auto_174820 ?auto_174821 ) ) ( not ( = ?auto_174820 ?auto_174822 ) ) ( not ( = ?auto_174821 ?auto_174822 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174821 ?auto_174818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174831 - OBJ
      ?auto_174832 - OBJ
      ?auto_174833 - OBJ
      ?auto_174834 - OBJ
      ?auto_174830 - LOCATION
    )
    :vars
    (
      ?auto_174835 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174835 ?auto_174830 ) ( IN-TRUCK ?auto_174832 ?auto_174835 ) ( OBJ-AT ?auto_174831 ?auto_174830 ) ( OBJ-AT ?auto_174833 ?auto_174830 ) ( OBJ-AT ?auto_174834 ?auto_174830 ) ( not ( = ?auto_174831 ?auto_174832 ) ) ( not ( = ?auto_174831 ?auto_174833 ) ) ( not ( = ?auto_174831 ?auto_174834 ) ) ( not ( = ?auto_174832 ?auto_174833 ) ) ( not ( = ?auto_174832 ?auto_174834 ) ) ( not ( = ?auto_174833 ?auto_174834 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174832 ?auto_174830 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174855 - OBJ
      ?auto_174856 - OBJ
      ?auto_174857 - OBJ
      ?auto_174858 - OBJ
      ?auto_174854 - LOCATION
    )
    :vars
    (
      ?auto_174859 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174859 ?auto_174854 ) ( IN-TRUCK ?auto_174855 ?auto_174859 ) ( OBJ-AT ?auto_174856 ?auto_174854 ) ( OBJ-AT ?auto_174857 ?auto_174854 ) ( OBJ-AT ?auto_174858 ?auto_174854 ) ( not ( = ?auto_174855 ?auto_174856 ) ) ( not ( = ?auto_174855 ?auto_174857 ) ) ( not ( = ?auto_174855 ?auto_174858 ) ) ( not ( = ?auto_174856 ?auto_174857 ) ) ( not ( = ?auto_174856 ?auto_174858 ) ) ( not ( = ?auto_174857 ?auto_174858 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174855 ?auto_174854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174908 - OBJ
      ?auto_174909 - OBJ
      ?auto_174907 - LOCATION
    )
    :vars
    (
      ?auto_174910 - TRUCK
      ?auto_174912 - LOCATION
      ?auto_174911 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174909 ?auto_174910 ) ( TRUCK-AT ?auto_174910 ?auto_174912 ) ( IN-CITY ?auto_174912 ?auto_174911 ) ( IN-CITY ?auto_174907 ?auto_174911 ) ( not ( = ?auto_174907 ?auto_174912 ) ) ( OBJ-AT ?auto_174908 ?auto_174907 ) ( not ( = ?auto_174908 ?auto_174909 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174909 ?auto_174907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174914 - OBJ
      ?auto_174915 - OBJ
      ?auto_174913 - LOCATION
    )
    :vars
    (
      ?auto_174917 - TRUCK
      ?auto_174916 - LOCATION
      ?auto_174918 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174914 ?auto_174917 ) ( TRUCK-AT ?auto_174917 ?auto_174916 ) ( IN-CITY ?auto_174916 ?auto_174918 ) ( IN-CITY ?auto_174913 ?auto_174918 ) ( not ( = ?auto_174913 ?auto_174916 ) ) ( OBJ-AT ?auto_174915 ?auto_174913 ) ( not ( = ?auto_174915 ?auto_174914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174915 ?auto_174914 ?auto_174913 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174927 - OBJ
      ?auto_174928 - OBJ
      ?auto_174929 - OBJ
      ?auto_174926 - LOCATION
    )
    :vars
    (
      ?auto_174931 - TRUCK
      ?auto_174930 - LOCATION
      ?auto_174932 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174929 ?auto_174931 ) ( TRUCK-AT ?auto_174931 ?auto_174930 ) ( IN-CITY ?auto_174930 ?auto_174932 ) ( IN-CITY ?auto_174926 ?auto_174932 ) ( not ( = ?auto_174926 ?auto_174930 ) ) ( OBJ-AT ?auto_174928 ?auto_174926 ) ( not ( = ?auto_174928 ?auto_174929 ) ) ( OBJ-AT ?auto_174927 ?auto_174926 ) ( not ( = ?auto_174927 ?auto_174928 ) ) ( not ( = ?auto_174927 ?auto_174929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174928 ?auto_174929 ?auto_174926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174934 - OBJ
      ?auto_174935 - OBJ
      ?auto_174936 - OBJ
      ?auto_174933 - LOCATION
    )
    :vars
    (
      ?auto_174938 - TRUCK
      ?auto_174937 - LOCATION
      ?auto_174939 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174935 ?auto_174938 ) ( TRUCK-AT ?auto_174938 ?auto_174937 ) ( IN-CITY ?auto_174937 ?auto_174939 ) ( IN-CITY ?auto_174933 ?auto_174939 ) ( not ( = ?auto_174933 ?auto_174937 ) ) ( OBJ-AT ?auto_174936 ?auto_174933 ) ( not ( = ?auto_174936 ?auto_174935 ) ) ( OBJ-AT ?auto_174934 ?auto_174933 ) ( not ( = ?auto_174934 ?auto_174935 ) ) ( not ( = ?auto_174934 ?auto_174936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174936 ?auto_174935 ?auto_174933 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174948 - OBJ
      ?auto_174949 - OBJ
      ?auto_174950 - OBJ
      ?auto_174947 - LOCATION
    )
    :vars
    (
      ?auto_174952 - TRUCK
      ?auto_174951 - LOCATION
      ?auto_174953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174948 ?auto_174952 ) ( TRUCK-AT ?auto_174952 ?auto_174951 ) ( IN-CITY ?auto_174951 ?auto_174953 ) ( IN-CITY ?auto_174947 ?auto_174953 ) ( not ( = ?auto_174947 ?auto_174951 ) ) ( OBJ-AT ?auto_174950 ?auto_174947 ) ( not ( = ?auto_174950 ?auto_174948 ) ) ( OBJ-AT ?auto_174949 ?auto_174947 ) ( not ( = ?auto_174948 ?auto_174949 ) ) ( not ( = ?auto_174949 ?auto_174950 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174950 ?auto_174948 ?auto_174947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174977 - OBJ
      ?auto_174978 - OBJ
      ?auto_174979 - OBJ
      ?auto_174980 - OBJ
      ?auto_174976 - LOCATION
    )
    :vars
    (
      ?auto_174982 - TRUCK
      ?auto_174981 - LOCATION
      ?auto_174983 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174980 ?auto_174982 ) ( TRUCK-AT ?auto_174982 ?auto_174981 ) ( IN-CITY ?auto_174981 ?auto_174983 ) ( IN-CITY ?auto_174976 ?auto_174983 ) ( not ( = ?auto_174976 ?auto_174981 ) ) ( OBJ-AT ?auto_174977 ?auto_174976 ) ( not ( = ?auto_174977 ?auto_174980 ) ) ( OBJ-AT ?auto_174978 ?auto_174976 ) ( OBJ-AT ?auto_174979 ?auto_174976 ) ( not ( = ?auto_174977 ?auto_174978 ) ) ( not ( = ?auto_174977 ?auto_174979 ) ) ( not ( = ?auto_174978 ?auto_174979 ) ) ( not ( = ?auto_174978 ?auto_174980 ) ) ( not ( = ?auto_174979 ?auto_174980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174977 ?auto_174980 ?auto_174976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174985 - OBJ
      ?auto_174986 - OBJ
      ?auto_174987 - OBJ
      ?auto_174988 - OBJ
      ?auto_174984 - LOCATION
    )
    :vars
    (
      ?auto_174990 - TRUCK
      ?auto_174989 - LOCATION
      ?auto_174991 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174987 ?auto_174990 ) ( TRUCK-AT ?auto_174990 ?auto_174989 ) ( IN-CITY ?auto_174989 ?auto_174991 ) ( IN-CITY ?auto_174984 ?auto_174991 ) ( not ( = ?auto_174984 ?auto_174989 ) ) ( OBJ-AT ?auto_174985 ?auto_174984 ) ( not ( = ?auto_174985 ?auto_174987 ) ) ( OBJ-AT ?auto_174986 ?auto_174984 ) ( OBJ-AT ?auto_174988 ?auto_174984 ) ( not ( = ?auto_174985 ?auto_174986 ) ) ( not ( = ?auto_174985 ?auto_174988 ) ) ( not ( = ?auto_174986 ?auto_174987 ) ) ( not ( = ?auto_174986 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174988 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174985 ?auto_174987 ?auto_174984 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175001 - OBJ
      ?auto_175002 - OBJ
      ?auto_175003 - OBJ
      ?auto_175004 - OBJ
      ?auto_175000 - LOCATION
    )
    :vars
    (
      ?auto_175006 - TRUCK
      ?auto_175005 - LOCATION
      ?auto_175007 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175002 ?auto_175006 ) ( TRUCK-AT ?auto_175006 ?auto_175005 ) ( IN-CITY ?auto_175005 ?auto_175007 ) ( IN-CITY ?auto_175000 ?auto_175007 ) ( not ( = ?auto_175000 ?auto_175005 ) ) ( OBJ-AT ?auto_175004 ?auto_175000 ) ( not ( = ?auto_175004 ?auto_175002 ) ) ( OBJ-AT ?auto_175001 ?auto_175000 ) ( OBJ-AT ?auto_175003 ?auto_175000 ) ( not ( = ?auto_175001 ?auto_175002 ) ) ( not ( = ?auto_175001 ?auto_175003 ) ) ( not ( = ?auto_175001 ?auto_175004 ) ) ( not ( = ?auto_175002 ?auto_175003 ) ) ( not ( = ?auto_175003 ?auto_175004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175004 ?auto_175002 ?auto_175000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175033 - OBJ
      ?auto_175034 - OBJ
      ?auto_175035 - OBJ
      ?auto_175036 - OBJ
      ?auto_175032 - LOCATION
    )
    :vars
    (
      ?auto_175038 - TRUCK
      ?auto_175037 - LOCATION
      ?auto_175039 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175033 ?auto_175038 ) ( TRUCK-AT ?auto_175038 ?auto_175037 ) ( IN-CITY ?auto_175037 ?auto_175039 ) ( IN-CITY ?auto_175032 ?auto_175039 ) ( not ( = ?auto_175032 ?auto_175037 ) ) ( OBJ-AT ?auto_175034 ?auto_175032 ) ( not ( = ?auto_175034 ?auto_175033 ) ) ( OBJ-AT ?auto_175035 ?auto_175032 ) ( OBJ-AT ?auto_175036 ?auto_175032 ) ( not ( = ?auto_175033 ?auto_175035 ) ) ( not ( = ?auto_175033 ?auto_175036 ) ) ( not ( = ?auto_175034 ?auto_175035 ) ) ( not ( = ?auto_175034 ?auto_175036 ) ) ( not ( = ?auto_175035 ?auto_175036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175034 ?auto_175033 ?auto_175032 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175098 - OBJ
      ?auto_175097 - LOCATION
    )
    :vars
    (
      ?auto_175100 - TRUCK
      ?auto_175099 - LOCATION
      ?auto_175102 - CITY
      ?auto_175101 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175100 ?auto_175099 ) ( IN-CITY ?auto_175099 ?auto_175102 ) ( IN-CITY ?auto_175097 ?auto_175102 ) ( not ( = ?auto_175097 ?auto_175099 ) ) ( OBJ-AT ?auto_175101 ?auto_175097 ) ( not ( = ?auto_175101 ?auto_175098 ) ) ( OBJ-AT ?auto_175098 ?auto_175099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175098 ?auto_175100 ?auto_175099 )
      ( DELIVER-2PKG ?auto_175101 ?auto_175098 ?auto_175097 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175104 - OBJ
      ?auto_175105 - OBJ
      ?auto_175103 - LOCATION
    )
    :vars
    (
      ?auto_175106 - TRUCK
      ?auto_175108 - LOCATION
      ?auto_175107 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175106 ?auto_175108 ) ( IN-CITY ?auto_175108 ?auto_175107 ) ( IN-CITY ?auto_175103 ?auto_175107 ) ( not ( = ?auto_175103 ?auto_175108 ) ) ( OBJ-AT ?auto_175104 ?auto_175103 ) ( not ( = ?auto_175104 ?auto_175105 ) ) ( OBJ-AT ?auto_175105 ?auto_175108 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175105 ?auto_175103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175110 - OBJ
      ?auto_175111 - OBJ
      ?auto_175109 - LOCATION
    )
    :vars
    (
      ?auto_175113 - TRUCK
      ?auto_175112 - LOCATION
      ?auto_175114 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175113 ?auto_175112 ) ( IN-CITY ?auto_175112 ?auto_175114 ) ( IN-CITY ?auto_175109 ?auto_175114 ) ( not ( = ?auto_175109 ?auto_175112 ) ) ( OBJ-AT ?auto_175111 ?auto_175109 ) ( not ( = ?auto_175111 ?auto_175110 ) ) ( OBJ-AT ?auto_175110 ?auto_175112 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175111 ?auto_175110 ?auto_175109 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175123 - OBJ
      ?auto_175124 - OBJ
      ?auto_175125 - OBJ
      ?auto_175122 - LOCATION
    )
    :vars
    (
      ?auto_175127 - TRUCK
      ?auto_175126 - LOCATION
      ?auto_175128 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175127 ?auto_175126 ) ( IN-CITY ?auto_175126 ?auto_175128 ) ( IN-CITY ?auto_175122 ?auto_175128 ) ( not ( = ?auto_175122 ?auto_175126 ) ) ( OBJ-AT ?auto_175124 ?auto_175122 ) ( not ( = ?auto_175124 ?auto_175125 ) ) ( OBJ-AT ?auto_175125 ?auto_175126 ) ( OBJ-AT ?auto_175123 ?auto_175122 ) ( not ( = ?auto_175123 ?auto_175124 ) ) ( not ( = ?auto_175123 ?auto_175125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175124 ?auto_175125 ?auto_175122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175130 - OBJ
      ?auto_175131 - OBJ
      ?auto_175132 - OBJ
      ?auto_175129 - LOCATION
    )
    :vars
    (
      ?auto_175134 - TRUCK
      ?auto_175133 - LOCATION
      ?auto_175135 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175134 ?auto_175133 ) ( IN-CITY ?auto_175133 ?auto_175135 ) ( IN-CITY ?auto_175129 ?auto_175135 ) ( not ( = ?auto_175129 ?auto_175133 ) ) ( OBJ-AT ?auto_175130 ?auto_175129 ) ( not ( = ?auto_175130 ?auto_175131 ) ) ( OBJ-AT ?auto_175131 ?auto_175133 ) ( OBJ-AT ?auto_175132 ?auto_175129 ) ( not ( = ?auto_175130 ?auto_175132 ) ) ( not ( = ?auto_175131 ?auto_175132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175130 ?auto_175131 ?auto_175129 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175144 - OBJ
      ?auto_175145 - OBJ
      ?auto_175146 - OBJ
      ?auto_175143 - LOCATION
    )
    :vars
    (
      ?auto_175148 - TRUCK
      ?auto_175147 - LOCATION
      ?auto_175149 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175148 ?auto_175147 ) ( IN-CITY ?auto_175147 ?auto_175149 ) ( IN-CITY ?auto_175143 ?auto_175149 ) ( not ( = ?auto_175143 ?auto_175147 ) ) ( OBJ-AT ?auto_175146 ?auto_175143 ) ( not ( = ?auto_175146 ?auto_175144 ) ) ( OBJ-AT ?auto_175144 ?auto_175147 ) ( OBJ-AT ?auto_175145 ?auto_175143 ) ( not ( = ?auto_175144 ?auto_175145 ) ) ( not ( = ?auto_175145 ?auto_175146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175146 ?auto_175144 ?auto_175143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175173 - OBJ
      ?auto_175174 - OBJ
      ?auto_175175 - OBJ
      ?auto_175176 - OBJ
      ?auto_175172 - LOCATION
    )
    :vars
    (
      ?auto_175178 - TRUCK
      ?auto_175177 - LOCATION
      ?auto_175179 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175178 ?auto_175177 ) ( IN-CITY ?auto_175177 ?auto_175179 ) ( IN-CITY ?auto_175172 ?auto_175179 ) ( not ( = ?auto_175172 ?auto_175177 ) ) ( OBJ-AT ?auto_175175 ?auto_175172 ) ( not ( = ?auto_175175 ?auto_175176 ) ) ( OBJ-AT ?auto_175176 ?auto_175177 ) ( OBJ-AT ?auto_175173 ?auto_175172 ) ( OBJ-AT ?auto_175174 ?auto_175172 ) ( not ( = ?auto_175173 ?auto_175174 ) ) ( not ( = ?auto_175173 ?auto_175175 ) ) ( not ( = ?auto_175173 ?auto_175176 ) ) ( not ( = ?auto_175174 ?auto_175175 ) ) ( not ( = ?auto_175174 ?auto_175176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175175 ?auto_175176 ?auto_175172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175181 - OBJ
      ?auto_175182 - OBJ
      ?auto_175183 - OBJ
      ?auto_175184 - OBJ
      ?auto_175180 - LOCATION
    )
    :vars
    (
      ?auto_175186 - TRUCK
      ?auto_175185 - LOCATION
      ?auto_175187 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175186 ?auto_175185 ) ( IN-CITY ?auto_175185 ?auto_175187 ) ( IN-CITY ?auto_175180 ?auto_175187 ) ( not ( = ?auto_175180 ?auto_175185 ) ) ( OBJ-AT ?auto_175184 ?auto_175180 ) ( not ( = ?auto_175184 ?auto_175183 ) ) ( OBJ-AT ?auto_175183 ?auto_175185 ) ( OBJ-AT ?auto_175181 ?auto_175180 ) ( OBJ-AT ?auto_175182 ?auto_175180 ) ( not ( = ?auto_175181 ?auto_175182 ) ) ( not ( = ?auto_175181 ?auto_175183 ) ) ( not ( = ?auto_175181 ?auto_175184 ) ) ( not ( = ?auto_175182 ?auto_175183 ) ) ( not ( = ?auto_175182 ?auto_175184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175184 ?auto_175183 ?auto_175180 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175197 - OBJ
      ?auto_175198 - OBJ
      ?auto_175199 - OBJ
      ?auto_175200 - OBJ
      ?auto_175196 - LOCATION
    )
    :vars
    (
      ?auto_175202 - TRUCK
      ?auto_175201 - LOCATION
      ?auto_175203 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175202 ?auto_175201 ) ( IN-CITY ?auto_175201 ?auto_175203 ) ( IN-CITY ?auto_175196 ?auto_175203 ) ( not ( = ?auto_175196 ?auto_175201 ) ) ( OBJ-AT ?auto_175197 ?auto_175196 ) ( not ( = ?auto_175197 ?auto_175198 ) ) ( OBJ-AT ?auto_175198 ?auto_175201 ) ( OBJ-AT ?auto_175199 ?auto_175196 ) ( OBJ-AT ?auto_175200 ?auto_175196 ) ( not ( = ?auto_175197 ?auto_175199 ) ) ( not ( = ?auto_175197 ?auto_175200 ) ) ( not ( = ?auto_175198 ?auto_175199 ) ) ( not ( = ?auto_175198 ?auto_175200 ) ) ( not ( = ?auto_175199 ?auto_175200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175197 ?auto_175198 ?auto_175196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175229 - OBJ
      ?auto_175230 - OBJ
      ?auto_175231 - OBJ
      ?auto_175232 - OBJ
      ?auto_175228 - LOCATION
    )
    :vars
    (
      ?auto_175234 - TRUCK
      ?auto_175233 - LOCATION
      ?auto_175235 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175234 ?auto_175233 ) ( IN-CITY ?auto_175233 ?auto_175235 ) ( IN-CITY ?auto_175228 ?auto_175235 ) ( not ( = ?auto_175228 ?auto_175233 ) ) ( OBJ-AT ?auto_175232 ?auto_175228 ) ( not ( = ?auto_175232 ?auto_175229 ) ) ( OBJ-AT ?auto_175229 ?auto_175233 ) ( OBJ-AT ?auto_175230 ?auto_175228 ) ( OBJ-AT ?auto_175231 ?auto_175228 ) ( not ( = ?auto_175229 ?auto_175230 ) ) ( not ( = ?auto_175229 ?auto_175231 ) ) ( not ( = ?auto_175230 ?auto_175231 ) ) ( not ( = ?auto_175230 ?auto_175232 ) ) ( not ( = ?auto_175231 ?auto_175232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175232 ?auto_175229 ?auto_175228 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175294 - OBJ
      ?auto_175293 - LOCATION
    )
    :vars
    (
      ?auto_175295 - LOCATION
      ?auto_175298 - CITY
      ?auto_175296 - OBJ
      ?auto_175297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175295 ?auto_175298 ) ( IN-CITY ?auto_175293 ?auto_175298 ) ( not ( = ?auto_175293 ?auto_175295 ) ) ( OBJ-AT ?auto_175296 ?auto_175293 ) ( not ( = ?auto_175296 ?auto_175294 ) ) ( OBJ-AT ?auto_175294 ?auto_175295 ) ( TRUCK-AT ?auto_175297 ?auto_175293 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175297 ?auto_175293 ?auto_175295 ?auto_175298 )
      ( DELIVER-2PKG ?auto_175296 ?auto_175294 ?auto_175293 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175300 - OBJ
      ?auto_175301 - OBJ
      ?auto_175299 - LOCATION
    )
    :vars
    (
      ?auto_175304 - LOCATION
      ?auto_175302 - CITY
      ?auto_175303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175304 ?auto_175302 ) ( IN-CITY ?auto_175299 ?auto_175302 ) ( not ( = ?auto_175299 ?auto_175304 ) ) ( OBJ-AT ?auto_175300 ?auto_175299 ) ( not ( = ?auto_175300 ?auto_175301 ) ) ( OBJ-AT ?auto_175301 ?auto_175304 ) ( TRUCK-AT ?auto_175303 ?auto_175299 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175301 ?auto_175299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175306 - OBJ
      ?auto_175307 - OBJ
      ?auto_175305 - LOCATION
    )
    :vars
    (
      ?auto_175308 - LOCATION
      ?auto_175310 - CITY
      ?auto_175309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175308 ?auto_175310 ) ( IN-CITY ?auto_175305 ?auto_175310 ) ( not ( = ?auto_175305 ?auto_175308 ) ) ( OBJ-AT ?auto_175307 ?auto_175305 ) ( not ( = ?auto_175307 ?auto_175306 ) ) ( OBJ-AT ?auto_175306 ?auto_175308 ) ( TRUCK-AT ?auto_175309 ?auto_175305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175307 ?auto_175306 ?auto_175305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175319 - OBJ
      ?auto_175320 - OBJ
      ?auto_175321 - OBJ
      ?auto_175318 - LOCATION
    )
    :vars
    (
      ?auto_175322 - LOCATION
      ?auto_175324 - CITY
      ?auto_175323 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175322 ?auto_175324 ) ( IN-CITY ?auto_175318 ?auto_175324 ) ( not ( = ?auto_175318 ?auto_175322 ) ) ( OBJ-AT ?auto_175320 ?auto_175318 ) ( not ( = ?auto_175320 ?auto_175321 ) ) ( OBJ-AT ?auto_175321 ?auto_175322 ) ( TRUCK-AT ?auto_175323 ?auto_175318 ) ( OBJ-AT ?auto_175319 ?auto_175318 ) ( not ( = ?auto_175319 ?auto_175320 ) ) ( not ( = ?auto_175319 ?auto_175321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175320 ?auto_175321 ?auto_175318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175326 - OBJ
      ?auto_175327 - OBJ
      ?auto_175328 - OBJ
      ?auto_175325 - LOCATION
    )
    :vars
    (
      ?auto_175329 - LOCATION
      ?auto_175331 - CITY
      ?auto_175330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175329 ?auto_175331 ) ( IN-CITY ?auto_175325 ?auto_175331 ) ( not ( = ?auto_175325 ?auto_175329 ) ) ( OBJ-AT ?auto_175326 ?auto_175325 ) ( not ( = ?auto_175326 ?auto_175327 ) ) ( OBJ-AT ?auto_175327 ?auto_175329 ) ( TRUCK-AT ?auto_175330 ?auto_175325 ) ( OBJ-AT ?auto_175328 ?auto_175325 ) ( not ( = ?auto_175326 ?auto_175328 ) ) ( not ( = ?auto_175327 ?auto_175328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175326 ?auto_175327 ?auto_175325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175340 - OBJ
      ?auto_175341 - OBJ
      ?auto_175342 - OBJ
      ?auto_175339 - LOCATION
    )
    :vars
    (
      ?auto_175343 - LOCATION
      ?auto_175345 - CITY
      ?auto_175344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175343 ?auto_175345 ) ( IN-CITY ?auto_175339 ?auto_175345 ) ( not ( = ?auto_175339 ?auto_175343 ) ) ( OBJ-AT ?auto_175342 ?auto_175339 ) ( not ( = ?auto_175342 ?auto_175340 ) ) ( OBJ-AT ?auto_175340 ?auto_175343 ) ( TRUCK-AT ?auto_175344 ?auto_175339 ) ( OBJ-AT ?auto_175341 ?auto_175339 ) ( not ( = ?auto_175340 ?auto_175341 ) ) ( not ( = ?auto_175341 ?auto_175342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175342 ?auto_175340 ?auto_175339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175369 - OBJ
      ?auto_175370 - OBJ
      ?auto_175371 - OBJ
      ?auto_175372 - OBJ
      ?auto_175368 - LOCATION
    )
    :vars
    (
      ?auto_175373 - LOCATION
      ?auto_175375 - CITY
      ?auto_175374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175373 ?auto_175375 ) ( IN-CITY ?auto_175368 ?auto_175375 ) ( not ( = ?auto_175368 ?auto_175373 ) ) ( OBJ-AT ?auto_175371 ?auto_175368 ) ( not ( = ?auto_175371 ?auto_175372 ) ) ( OBJ-AT ?auto_175372 ?auto_175373 ) ( TRUCK-AT ?auto_175374 ?auto_175368 ) ( OBJ-AT ?auto_175369 ?auto_175368 ) ( OBJ-AT ?auto_175370 ?auto_175368 ) ( not ( = ?auto_175369 ?auto_175370 ) ) ( not ( = ?auto_175369 ?auto_175371 ) ) ( not ( = ?auto_175369 ?auto_175372 ) ) ( not ( = ?auto_175370 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175372 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175371 ?auto_175372 ?auto_175368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175377 - OBJ
      ?auto_175378 - OBJ
      ?auto_175379 - OBJ
      ?auto_175380 - OBJ
      ?auto_175376 - LOCATION
    )
    :vars
    (
      ?auto_175381 - LOCATION
      ?auto_175383 - CITY
      ?auto_175382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175381 ?auto_175383 ) ( IN-CITY ?auto_175376 ?auto_175383 ) ( not ( = ?auto_175376 ?auto_175381 ) ) ( OBJ-AT ?auto_175380 ?auto_175376 ) ( not ( = ?auto_175380 ?auto_175379 ) ) ( OBJ-AT ?auto_175379 ?auto_175381 ) ( TRUCK-AT ?auto_175382 ?auto_175376 ) ( OBJ-AT ?auto_175377 ?auto_175376 ) ( OBJ-AT ?auto_175378 ?auto_175376 ) ( not ( = ?auto_175377 ?auto_175378 ) ) ( not ( = ?auto_175377 ?auto_175379 ) ) ( not ( = ?auto_175377 ?auto_175380 ) ) ( not ( = ?auto_175378 ?auto_175379 ) ) ( not ( = ?auto_175378 ?auto_175380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175380 ?auto_175379 ?auto_175376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175393 - OBJ
      ?auto_175394 - OBJ
      ?auto_175395 - OBJ
      ?auto_175396 - OBJ
      ?auto_175392 - LOCATION
    )
    :vars
    (
      ?auto_175397 - LOCATION
      ?auto_175399 - CITY
      ?auto_175398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175397 ?auto_175399 ) ( IN-CITY ?auto_175392 ?auto_175399 ) ( not ( = ?auto_175392 ?auto_175397 ) ) ( OBJ-AT ?auto_175395 ?auto_175392 ) ( not ( = ?auto_175395 ?auto_175394 ) ) ( OBJ-AT ?auto_175394 ?auto_175397 ) ( TRUCK-AT ?auto_175398 ?auto_175392 ) ( OBJ-AT ?auto_175393 ?auto_175392 ) ( OBJ-AT ?auto_175396 ?auto_175392 ) ( not ( = ?auto_175393 ?auto_175394 ) ) ( not ( = ?auto_175393 ?auto_175395 ) ) ( not ( = ?auto_175393 ?auto_175396 ) ) ( not ( = ?auto_175394 ?auto_175396 ) ) ( not ( = ?auto_175395 ?auto_175396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175395 ?auto_175394 ?auto_175392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175425 - OBJ
      ?auto_175426 - OBJ
      ?auto_175427 - OBJ
      ?auto_175428 - OBJ
      ?auto_175424 - LOCATION
    )
    :vars
    (
      ?auto_175429 - LOCATION
      ?auto_175431 - CITY
      ?auto_175430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175429 ?auto_175431 ) ( IN-CITY ?auto_175424 ?auto_175431 ) ( not ( = ?auto_175424 ?auto_175429 ) ) ( OBJ-AT ?auto_175427 ?auto_175424 ) ( not ( = ?auto_175427 ?auto_175425 ) ) ( OBJ-AT ?auto_175425 ?auto_175429 ) ( TRUCK-AT ?auto_175430 ?auto_175424 ) ( OBJ-AT ?auto_175426 ?auto_175424 ) ( OBJ-AT ?auto_175428 ?auto_175424 ) ( not ( = ?auto_175425 ?auto_175426 ) ) ( not ( = ?auto_175425 ?auto_175428 ) ) ( not ( = ?auto_175426 ?auto_175427 ) ) ( not ( = ?auto_175426 ?auto_175428 ) ) ( not ( = ?auto_175427 ?auto_175428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175427 ?auto_175425 ?auto_175424 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175490 - OBJ
      ?auto_175489 - LOCATION
    )
    :vars
    (
      ?auto_175492 - LOCATION
      ?auto_175494 - CITY
      ?auto_175491 - OBJ
      ?auto_175493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175492 ?auto_175494 ) ( IN-CITY ?auto_175489 ?auto_175494 ) ( not ( = ?auto_175489 ?auto_175492 ) ) ( not ( = ?auto_175491 ?auto_175490 ) ) ( OBJ-AT ?auto_175490 ?auto_175492 ) ( TRUCK-AT ?auto_175493 ?auto_175489 ) ( IN-TRUCK ?auto_175491 ?auto_175493 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175491 ?auto_175489 )
      ( DELIVER-2PKG ?auto_175491 ?auto_175490 ?auto_175489 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175496 - OBJ
      ?auto_175497 - OBJ
      ?auto_175495 - LOCATION
    )
    :vars
    (
      ?auto_175498 - LOCATION
      ?auto_175499 - CITY
      ?auto_175500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175498 ?auto_175499 ) ( IN-CITY ?auto_175495 ?auto_175499 ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( OBJ-AT ?auto_175497 ?auto_175498 ) ( TRUCK-AT ?auto_175500 ?auto_175495 ) ( IN-TRUCK ?auto_175496 ?auto_175500 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175497 ?auto_175495 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175502 - OBJ
      ?auto_175503 - OBJ
      ?auto_175501 - LOCATION
    )
    :vars
    (
      ?auto_175506 - LOCATION
      ?auto_175504 - CITY
      ?auto_175505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175506 ?auto_175504 ) ( IN-CITY ?auto_175501 ?auto_175504 ) ( not ( = ?auto_175501 ?auto_175506 ) ) ( not ( = ?auto_175503 ?auto_175502 ) ) ( OBJ-AT ?auto_175502 ?auto_175506 ) ( TRUCK-AT ?auto_175505 ?auto_175501 ) ( IN-TRUCK ?auto_175503 ?auto_175505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175503 ?auto_175502 ?auto_175501 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175686 - OBJ
      ?auto_175685 - LOCATION
    )
    :vars
    (
      ?auto_175689 - LOCATION
      ?auto_175687 - CITY
      ?auto_175690 - OBJ
      ?auto_175688 - TRUCK
      ?auto_175691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175689 ?auto_175687 ) ( IN-CITY ?auto_175685 ?auto_175687 ) ( not ( = ?auto_175685 ?auto_175689 ) ) ( not ( = ?auto_175690 ?auto_175686 ) ) ( OBJ-AT ?auto_175686 ?auto_175689 ) ( IN-TRUCK ?auto_175690 ?auto_175688 ) ( TRUCK-AT ?auto_175688 ?auto_175691 ) ( IN-CITY ?auto_175691 ?auto_175687 ) ( not ( = ?auto_175685 ?auto_175691 ) ) ( not ( = ?auto_175689 ?auto_175691 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175688 ?auto_175691 ?auto_175685 ?auto_175687 )
      ( DELIVER-2PKG ?auto_175690 ?auto_175686 ?auto_175685 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175693 - OBJ
      ?auto_175694 - OBJ
      ?auto_175692 - LOCATION
    )
    :vars
    (
      ?auto_175698 - LOCATION
      ?auto_175697 - CITY
      ?auto_175696 - TRUCK
      ?auto_175695 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175698 ?auto_175697 ) ( IN-CITY ?auto_175692 ?auto_175697 ) ( not ( = ?auto_175692 ?auto_175698 ) ) ( not ( = ?auto_175693 ?auto_175694 ) ) ( OBJ-AT ?auto_175694 ?auto_175698 ) ( IN-TRUCK ?auto_175693 ?auto_175696 ) ( TRUCK-AT ?auto_175696 ?auto_175695 ) ( IN-CITY ?auto_175695 ?auto_175697 ) ( not ( = ?auto_175692 ?auto_175695 ) ) ( not ( = ?auto_175698 ?auto_175695 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175694 ?auto_175692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175700 - OBJ
      ?auto_175701 - OBJ
      ?auto_175699 - LOCATION
    )
    :vars
    (
      ?auto_175702 - LOCATION
      ?auto_175703 - CITY
      ?auto_175705 - TRUCK
      ?auto_175704 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175702 ?auto_175703 ) ( IN-CITY ?auto_175699 ?auto_175703 ) ( not ( = ?auto_175699 ?auto_175702 ) ) ( not ( = ?auto_175701 ?auto_175700 ) ) ( OBJ-AT ?auto_175700 ?auto_175702 ) ( IN-TRUCK ?auto_175701 ?auto_175705 ) ( TRUCK-AT ?auto_175705 ?auto_175704 ) ( IN-CITY ?auto_175704 ?auto_175703 ) ( not ( = ?auto_175699 ?auto_175704 ) ) ( not ( = ?auto_175702 ?auto_175704 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175701 ?auto_175700 ?auto_175699 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175908 - OBJ
      ?auto_175907 - LOCATION
    )
    :vars
    (
      ?auto_175909 - LOCATION
      ?auto_175911 - CITY
      ?auto_175910 - OBJ
      ?auto_175913 - TRUCK
      ?auto_175912 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175909 ?auto_175911 ) ( IN-CITY ?auto_175907 ?auto_175911 ) ( not ( = ?auto_175907 ?auto_175909 ) ) ( not ( = ?auto_175910 ?auto_175908 ) ) ( OBJ-AT ?auto_175908 ?auto_175909 ) ( TRUCK-AT ?auto_175913 ?auto_175912 ) ( IN-CITY ?auto_175912 ?auto_175911 ) ( not ( = ?auto_175907 ?auto_175912 ) ) ( not ( = ?auto_175909 ?auto_175912 ) ) ( OBJ-AT ?auto_175910 ?auto_175912 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175910 ?auto_175913 ?auto_175912 )
      ( DELIVER-2PKG ?auto_175910 ?auto_175908 ?auto_175907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175915 - OBJ
      ?auto_175916 - OBJ
      ?auto_175914 - LOCATION
    )
    :vars
    (
      ?auto_175918 - LOCATION
      ?auto_175920 - CITY
      ?auto_175919 - TRUCK
      ?auto_175917 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175918 ?auto_175920 ) ( IN-CITY ?auto_175914 ?auto_175920 ) ( not ( = ?auto_175914 ?auto_175918 ) ) ( not ( = ?auto_175915 ?auto_175916 ) ) ( OBJ-AT ?auto_175916 ?auto_175918 ) ( TRUCK-AT ?auto_175919 ?auto_175917 ) ( IN-CITY ?auto_175917 ?auto_175920 ) ( not ( = ?auto_175914 ?auto_175917 ) ) ( not ( = ?auto_175918 ?auto_175917 ) ) ( OBJ-AT ?auto_175915 ?auto_175917 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175916 ?auto_175914 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175922 - OBJ
      ?auto_175923 - OBJ
      ?auto_175921 - LOCATION
    )
    :vars
    (
      ?auto_175927 - LOCATION
      ?auto_175924 - CITY
      ?auto_175926 - TRUCK
      ?auto_175925 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175927 ?auto_175924 ) ( IN-CITY ?auto_175921 ?auto_175924 ) ( not ( = ?auto_175921 ?auto_175927 ) ) ( not ( = ?auto_175923 ?auto_175922 ) ) ( OBJ-AT ?auto_175922 ?auto_175927 ) ( TRUCK-AT ?auto_175926 ?auto_175925 ) ( IN-CITY ?auto_175925 ?auto_175924 ) ( not ( = ?auto_175921 ?auto_175925 ) ) ( not ( = ?auto_175927 ?auto_175925 ) ) ( OBJ-AT ?auto_175923 ?auto_175925 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175923 ?auto_175922 ?auto_175921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177267 - OBJ
      ?auto_177268 - OBJ
      ?auto_177269 - OBJ
      ?auto_177266 - LOCATION
    )
    :vars
    (
      ?auto_177272 - TRUCK
      ?auto_177270 - LOCATION
      ?auto_177271 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177269 ?auto_177272 ) ( TRUCK-AT ?auto_177272 ?auto_177270 ) ( IN-CITY ?auto_177270 ?auto_177271 ) ( IN-CITY ?auto_177266 ?auto_177271 ) ( not ( = ?auto_177266 ?auto_177270 ) ) ( OBJ-AT ?auto_177267 ?auto_177266 ) ( not ( = ?auto_177267 ?auto_177269 ) ) ( OBJ-AT ?auto_177268 ?auto_177266 ) ( not ( = ?auto_177267 ?auto_177268 ) ) ( not ( = ?auto_177268 ?auto_177269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177267 ?auto_177269 ?auto_177266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177300 - OBJ
      ?auto_177301 - OBJ
      ?auto_177302 - OBJ
      ?auto_177299 - LOCATION
    )
    :vars
    (
      ?auto_177306 - TRUCK
      ?auto_177304 - LOCATION
      ?auto_177305 - CITY
      ?auto_177303 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177302 ?auto_177306 ) ( TRUCK-AT ?auto_177306 ?auto_177304 ) ( IN-CITY ?auto_177304 ?auto_177305 ) ( IN-CITY ?auto_177299 ?auto_177305 ) ( not ( = ?auto_177299 ?auto_177304 ) ) ( OBJ-AT ?auto_177303 ?auto_177299 ) ( not ( = ?auto_177303 ?auto_177302 ) ) ( OBJ-AT ?auto_177300 ?auto_177299 ) ( OBJ-AT ?auto_177301 ?auto_177299 ) ( not ( = ?auto_177300 ?auto_177301 ) ) ( not ( = ?auto_177300 ?auto_177302 ) ) ( not ( = ?auto_177300 ?auto_177303 ) ) ( not ( = ?auto_177301 ?auto_177302 ) ) ( not ( = ?auto_177301 ?auto_177303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177303 ?auto_177302 ?auto_177299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177312 - OBJ
      ?auto_177313 - OBJ
      ?auto_177314 - OBJ
      ?auto_177311 - LOCATION
    )
    :vars
    (
      ?auto_177318 - TRUCK
      ?auto_177316 - LOCATION
      ?auto_177317 - CITY
      ?auto_177315 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177313 ?auto_177318 ) ( TRUCK-AT ?auto_177318 ?auto_177316 ) ( IN-CITY ?auto_177316 ?auto_177317 ) ( IN-CITY ?auto_177311 ?auto_177317 ) ( not ( = ?auto_177311 ?auto_177316 ) ) ( OBJ-AT ?auto_177315 ?auto_177311 ) ( not ( = ?auto_177315 ?auto_177313 ) ) ( OBJ-AT ?auto_177312 ?auto_177311 ) ( OBJ-AT ?auto_177314 ?auto_177311 ) ( not ( = ?auto_177312 ?auto_177313 ) ) ( not ( = ?auto_177312 ?auto_177314 ) ) ( not ( = ?auto_177312 ?auto_177315 ) ) ( not ( = ?auto_177313 ?auto_177314 ) ) ( not ( = ?auto_177314 ?auto_177315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177315 ?auto_177313 ?auto_177311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177350 - OBJ
      ?auto_177351 - OBJ
      ?auto_177352 - OBJ
      ?auto_177349 - LOCATION
    )
    :vars
    (
      ?auto_177356 - TRUCK
      ?auto_177354 - LOCATION
      ?auto_177355 - CITY
      ?auto_177353 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177350 ?auto_177356 ) ( TRUCK-AT ?auto_177356 ?auto_177354 ) ( IN-CITY ?auto_177354 ?auto_177355 ) ( IN-CITY ?auto_177349 ?auto_177355 ) ( not ( = ?auto_177349 ?auto_177354 ) ) ( OBJ-AT ?auto_177353 ?auto_177349 ) ( not ( = ?auto_177353 ?auto_177350 ) ) ( OBJ-AT ?auto_177351 ?auto_177349 ) ( OBJ-AT ?auto_177352 ?auto_177349 ) ( not ( = ?auto_177350 ?auto_177351 ) ) ( not ( = ?auto_177350 ?auto_177352 ) ) ( not ( = ?auto_177351 ?auto_177352 ) ) ( not ( = ?auto_177351 ?auto_177353 ) ) ( not ( = ?auto_177352 ?auto_177353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177353 ?auto_177350 ?auto_177349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177397 - OBJ
      ?auto_177398 - OBJ
      ?auto_177399 - OBJ
      ?auto_177400 - OBJ
      ?auto_177396 - LOCATION
    )
    :vars
    (
      ?auto_177403 - TRUCK
      ?auto_177401 - LOCATION
      ?auto_177402 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177400 ?auto_177403 ) ( TRUCK-AT ?auto_177403 ?auto_177401 ) ( IN-CITY ?auto_177401 ?auto_177402 ) ( IN-CITY ?auto_177396 ?auto_177402 ) ( not ( = ?auto_177396 ?auto_177401 ) ) ( OBJ-AT ?auto_177398 ?auto_177396 ) ( not ( = ?auto_177398 ?auto_177400 ) ) ( OBJ-AT ?auto_177397 ?auto_177396 ) ( OBJ-AT ?auto_177399 ?auto_177396 ) ( not ( = ?auto_177397 ?auto_177398 ) ) ( not ( = ?auto_177397 ?auto_177399 ) ) ( not ( = ?auto_177397 ?auto_177400 ) ) ( not ( = ?auto_177398 ?auto_177399 ) ) ( not ( = ?auto_177399 ?auto_177400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177398 ?auto_177400 ?auto_177396 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177413 - OBJ
      ?auto_177414 - OBJ
      ?auto_177415 - OBJ
      ?auto_177416 - OBJ
      ?auto_177412 - LOCATION
    )
    :vars
    (
      ?auto_177419 - TRUCK
      ?auto_177417 - LOCATION
      ?auto_177418 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177415 ?auto_177419 ) ( TRUCK-AT ?auto_177419 ?auto_177417 ) ( IN-CITY ?auto_177417 ?auto_177418 ) ( IN-CITY ?auto_177412 ?auto_177418 ) ( not ( = ?auto_177412 ?auto_177417 ) ) ( OBJ-AT ?auto_177414 ?auto_177412 ) ( not ( = ?auto_177414 ?auto_177415 ) ) ( OBJ-AT ?auto_177413 ?auto_177412 ) ( OBJ-AT ?auto_177416 ?auto_177412 ) ( not ( = ?auto_177413 ?auto_177414 ) ) ( not ( = ?auto_177413 ?auto_177415 ) ) ( not ( = ?auto_177413 ?auto_177416 ) ) ( not ( = ?auto_177414 ?auto_177416 ) ) ( not ( = ?auto_177415 ?auto_177416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177414 ?auto_177415 ?auto_177412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177429 - OBJ
      ?auto_177430 - OBJ
      ?auto_177431 - OBJ
      ?auto_177432 - OBJ
      ?auto_177428 - LOCATION
    )
    :vars
    (
      ?auto_177435 - TRUCK
      ?auto_177433 - LOCATION
      ?auto_177434 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177432 ?auto_177435 ) ( TRUCK-AT ?auto_177435 ?auto_177433 ) ( IN-CITY ?auto_177433 ?auto_177434 ) ( IN-CITY ?auto_177428 ?auto_177434 ) ( not ( = ?auto_177428 ?auto_177433 ) ) ( OBJ-AT ?auto_177431 ?auto_177428 ) ( not ( = ?auto_177431 ?auto_177432 ) ) ( OBJ-AT ?auto_177429 ?auto_177428 ) ( OBJ-AT ?auto_177430 ?auto_177428 ) ( not ( = ?auto_177429 ?auto_177430 ) ) ( not ( = ?auto_177429 ?auto_177431 ) ) ( not ( = ?auto_177429 ?auto_177432 ) ) ( not ( = ?auto_177430 ?auto_177431 ) ) ( not ( = ?auto_177430 ?auto_177432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177431 ?auto_177432 ?auto_177428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177469 - OBJ
      ?auto_177470 - OBJ
      ?auto_177471 - OBJ
      ?auto_177472 - OBJ
      ?auto_177468 - LOCATION
    )
    :vars
    (
      ?auto_177475 - TRUCK
      ?auto_177473 - LOCATION
      ?auto_177474 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177470 ?auto_177475 ) ( TRUCK-AT ?auto_177475 ?auto_177473 ) ( IN-CITY ?auto_177473 ?auto_177474 ) ( IN-CITY ?auto_177468 ?auto_177474 ) ( not ( = ?auto_177468 ?auto_177473 ) ) ( OBJ-AT ?auto_177469 ?auto_177468 ) ( not ( = ?auto_177469 ?auto_177470 ) ) ( OBJ-AT ?auto_177471 ?auto_177468 ) ( OBJ-AT ?auto_177472 ?auto_177468 ) ( not ( = ?auto_177469 ?auto_177471 ) ) ( not ( = ?auto_177469 ?auto_177472 ) ) ( not ( = ?auto_177470 ?auto_177471 ) ) ( not ( = ?auto_177470 ?auto_177472 ) ) ( not ( = ?auto_177471 ?auto_177472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177469 ?auto_177470 ?auto_177468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177477 - OBJ
      ?auto_177478 - OBJ
      ?auto_177479 - OBJ
      ?auto_177480 - OBJ
      ?auto_177476 - LOCATION
    )
    :vars
    (
      ?auto_177483 - TRUCK
      ?auto_177481 - LOCATION
      ?auto_177482 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177478 ?auto_177483 ) ( TRUCK-AT ?auto_177483 ?auto_177481 ) ( IN-CITY ?auto_177481 ?auto_177482 ) ( IN-CITY ?auto_177476 ?auto_177482 ) ( not ( = ?auto_177476 ?auto_177481 ) ) ( OBJ-AT ?auto_177479 ?auto_177476 ) ( not ( = ?auto_177479 ?auto_177478 ) ) ( OBJ-AT ?auto_177477 ?auto_177476 ) ( OBJ-AT ?auto_177480 ?auto_177476 ) ( not ( = ?auto_177477 ?auto_177478 ) ) ( not ( = ?auto_177477 ?auto_177479 ) ) ( not ( = ?auto_177477 ?auto_177480 ) ) ( not ( = ?auto_177478 ?auto_177480 ) ) ( not ( = ?auto_177479 ?auto_177480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177479 ?auto_177478 ?auto_177476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177589 - OBJ
      ?auto_177590 - OBJ
      ?auto_177591 - OBJ
      ?auto_177592 - OBJ
      ?auto_177588 - LOCATION
    )
    :vars
    (
      ?auto_177596 - TRUCK
      ?auto_177594 - LOCATION
      ?auto_177595 - CITY
      ?auto_177593 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177592 ?auto_177596 ) ( TRUCK-AT ?auto_177596 ?auto_177594 ) ( IN-CITY ?auto_177594 ?auto_177595 ) ( IN-CITY ?auto_177588 ?auto_177595 ) ( not ( = ?auto_177588 ?auto_177594 ) ) ( OBJ-AT ?auto_177593 ?auto_177588 ) ( not ( = ?auto_177593 ?auto_177592 ) ) ( OBJ-AT ?auto_177589 ?auto_177588 ) ( OBJ-AT ?auto_177590 ?auto_177588 ) ( OBJ-AT ?auto_177591 ?auto_177588 ) ( not ( = ?auto_177589 ?auto_177590 ) ) ( not ( = ?auto_177589 ?auto_177591 ) ) ( not ( = ?auto_177589 ?auto_177592 ) ) ( not ( = ?auto_177589 ?auto_177593 ) ) ( not ( = ?auto_177590 ?auto_177591 ) ) ( not ( = ?auto_177590 ?auto_177592 ) ) ( not ( = ?auto_177590 ?auto_177593 ) ) ( not ( = ?auto_177591 ?auto_177592 ) ) ( not ( = ?auto_177591 ?auto_177593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177593 ?auto_177592 ?auto_177588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177598 - OBJ
      ?auto_177599 - OBJ
      ?auto_177600 - OBJ
      ?auto_177601 - OBJ
      ?auto_177597 - LOCATION
    )
    :vars
    (
      ?auto_177604 - TRUCK
      ?auto_177602 - LOCATION
      ?auto_177603 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177600 ?auto_177604 ) ( TRUCK-AT ?auto_177604 ?auto_177602 ) ( IN-CITY ?auto_177602 ?auto_177603 ) ( IN-CITY ?auto_177597 ?auto_177603 ) ( not ( = ?auto_177597 ?auto_177602 ) ) ( OBJ-AT ?auto_177601 ?auto_177597 ) ( not ( = ?auto_177601 ?auto_177600 ) ) ( OBJ-AT ?auto_177598 ?auto_177597 ) ( OBJ-AT ?auto_177599 ?auto_177597 ) ( not ( = ?auto_177598 ?auto_177599 ) ) ( not ( = ?auto_177598 ?auto_177600 ) ) ( not ( = ?auto_177598 ?auto_177601 ) ) ( not ( = ?auto_177599 ?auto_177600 ) ) ( not ( = ?auto_177599 ?auto_177601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177601 ?auto_177600 ?auto_177597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177606 - OBJ
      ?auto_177607 - OBJ
      ?auto_177608 - OBJ
      ?auto_177609 - OBJ
      ?auto_177605 - LOCATION
    )
    :vars
    (
      ?auto_177613 - TRUCK
      ?auto_177611 - LOCATION
      ?auto_177612 - CITY
      ?auto_177610 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177608 ?auto_177613 ) ( TRUCK-AT ?auto_177613 ?auto_177611 ) ( IN-CITY ?auto_177611 ?auto_177612 ) ( IN-CITY ?auto_177605 ?auto_177612 ) ( not ( = ?auto_177605 ?auto_177611 ) ) ( OBJ-AT ?auto_177610 ?auto_177605 ) ( not ( = ?auto_177610 ?auto_177608 ) ) ( OBJ-AT ?auto_177606 ?auto_177605 ) ( OBJ-AT ?auto_177607 ?auto_177605 ) ( OBJ-AT ?auto_177609 ?auto_177605 ) ( not ( = ?auto_177606 ?auto_177607 ) ) ( not ( = ?auto_177606 ?auto_177608 ) ) ( not ( = ?auto_177606 ?auto_177609 ) ) ( not ( = ?auto_177606 ?auto_177610 ) ) ( not ( = ?auto_177607 ?auto_177608 ) ) ( not ( = ?auto_177607 ?auto_177609 ) ) ( not ( = ?auto_177607 ?auto_177610 ) ) ( not ( = ?auto_177608 ?auto_177609 ) ) ( not ( = ?auto_177609 ?auto_177610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177610 ?auto_177608 ?auto_177605 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177656 - OBJ
      ?auto_177657 - OBJ
      ?auto_177658 - OBJ
      ?auto_177659 - OBJ
      ?auto_177655 - LOCATION
    )
    :vars
    (
      ?auto_177663 - TRUCK
      ?auto_177661 - LOCATION
      ?auto_177662 - CITY
      ?auto_177660 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177657 ?auto_177663 ) ( TRUCK-AT ?auto_177663 ?auto_177661 ) ( IN-CITY ?auto_177661 ?auto_177662 ) ( IN-CITY ?auto_177655 ?auto_177662 ) ( not ( = ?auto_177655 ?auto_177661 ) ) ( OBJ-AT ?auto_177660 ?auto_177655 ) ( not ( = ?auto_177660 ?auto_177657 ) ) ( OBJ-AT ?auto_177656 ?auto_177655 ) ( OBJ-AT ?auto_177658 ?auto_177655 ) ( OBJ-AT ?auto_177659 ?auto_177655 ) ( not ( = ?auto_177656 ?auto_177657 ) ) ( not ( = ?auto_177656 ?auto_177658 ) ) ( not ( = ?auto_177656 ?auto_177659 ) ) ( not ( = ?auto_177656 ?auto_177660 ) ) ( not ( = ?auto_177657 ?auto_177658 ) ) ( not ( = ?auto_177657 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177660 ) ) ( not ( = ?auto_177659 ?auto_177660 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177660 ?auto_177657 ?auto_177655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177700 - OBJ
      ?auto_177701 - OBJ
      ?auto_177702 - OBJ
      ?auto_177703 - OBJ
      ?auto_177699 - LOCATION
    )
    :vars
    (
      ?auto_177706 - TRUCK
      ?auto_177704 - LOCATION
      ?auto_177705 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177700 ?auto_177706 ) ( TRUCK-AT ?auto_177706 ?auto_177704 ) ( IN-CITY ?auto_177704 ?auto_177705 ) ( IN-CITY ?auto_177699 ?auto_177705 ) ( not ( = ?auto_177699 ?auto_177704 ) ) ( OBJ-AT ?auto_177702 ?auto_177699 ) ( not ( = ?auto_177702 ?auto_177700 ) ) ( OBJ-AT ?auto_177701 ?auto_177699 ) ( OBJ-AT ?auto_177703 ?auto_177699 ) ( not ( = ?auto_177700 ?auto_177701 ) ) ( not ( = ?auto_177700 ?auto_177703 ) ) ( not ( = ?auto_177701 ?auto_177702 ) ) ( not ( = ?auto_177701 ?auto_177703 ) ) ( not ( = ?auto_177702 ?auto_177703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177702 ?auto_177700 ?auto_177699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177772 - OBJ
      ?auto_177773 - OBJ
      ?auto_177774 - OBJ
      ?auto_177775 - OBJ
      ?auto_177771 - LOCATION
    )
    :vars
    (
      ?auto_177778 - TRUCK
      ?auto_177776 - LOCATION
      ?auto_177777 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177772 ?auto_177778 ) ( TRUCK-AT ?auto_177778 ?auto_177776 ) ( IN-CITY ?auto_177776 ?auto_177777 ) ( IN-CITY ?auto_177771 ?auto_177777 ) ( not ( = ?auto_177771 ?auto_177776 ) ) ( OBJ-AT ?auto_177775 ?auto_177771 ) ( not ( = ?auto_177775 ?auto_177772 ) ) ( OBJ-AT ?auto_177773 ?auto_177771 ) ( OBJ-AT ?auto_177774 ?auto_177771 ) ( not ( = ?auto_177772 ?auto_177773 ) ) ( not ( = ?auto_177772 ?auto_177774 ) ) ( not ( = ?auto_177773 ?auto_177774 ) ) ( not ( = ?auto_177773 ?auto_177775 ) ) ( not ( = ?auto_177774 ?auto_177775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177775 ?auto_177772 ?auto_177771 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177804 - OBJ
      ?auto_177805 - OBJ
      ?auto_177806 - OBJ
      ?auto_177807 - OBJ
      ?auto_177803 - LOCATION
    )
    :vars
    (
      ?auto_177811 - TRUCK
      ?auto_177809 - LOCATION
      ?auto_177810 - CITY
      ?auto_177808 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177804 ?auto_177811 ) ( TRUCK-AT ?auto_177811 ?auto_177809 ) ( IN-CITY ?auto_177809 ?auto_177810 ) ( IN-CITY ?auto_177803 ?auto_177810 ) ( not ( = ?auto_177803 ?auto_177809 ) ) ( OBJ-AT ?auto_177808 ?auto_177803 ) ( not ( = ?auto_177808 ?auto_177804 ) ) ( OBJ-AT ?auto_177805 ?auto_177803 ) ( OBJ-AT ?auto_177806 ?auto_177803 ) ( OBJ-AT ?auto_177807 ?auto_177803 ) ( not ( = ?auto_177804 ?auto_177805 ) ) ( not ( = ?auto_177804 ?auto_177806 ) ) ( not ( = ?auto_177804 ?auto_177807 ) ) ( not ( = ?auto_177805 ?auto_177806 ) ) ( not ( = ?auto_177805 ?auto_177807 ) ) ( not ( = ?auto_177805 ?auto_177808 ) ) ( not ( = ?auto_177806 ?auto_177807 ) ) ( not ( = ?auto_177806 ?auto_177808 ) ) ( not ( = ?auto_177807 ?auto_177808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177808 ?auto_177804 ?auto_177803 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177955 - OBJ
      ?auto_177956 - OBJ
      ?auto_177957 - OBJ
      ?auto_177954 - LOCATION
    )
    :vars
    (
      ?auto_177958 - TRUCK
      ?auto_177959 - LOCATION
      ?auto_177960 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177958 ?auto_177959 ) ( IN-CITY ?auto_177959 ?auto_177960 ) ( IN-CITY ?auto_177954 ?auto_177960 ) ( not ( = ?auto_177954 ?auto_177959 ) ) ( OBJ-AT ?auto_177955 ?auto_177954 ) ( not ( = ?auto_177955 ?auto_177957 ) ) ( OBJ-AT ?auto_177957 ?auto_177959 ) ( OBJ-AT ?auto_177956 ?auto_177954 ) ( not ( = ?auto_177955 ?auto_177956 ) ) ( not ( = ?auto_177956 ?auto_177957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177955 ?auto_177957 ?auto_177954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177966 - OBJ
      ?auto_177967 - OBJ
      ?auto_177968 - OBJ
      ?auto_177965 - LOCATION
    )
    :vars
    (
      ?auto_177969 - TRUCK
      ?auto_177970 - LOCATION
      ?auto_177971 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177969 ?auto_177970 ) ( IN-CITY ?auto_177970 ?auto_177971 ) ( IN-CITY ?auto_177965 ?auto_177971 ) ( not ( = ?auto_177965 ?auto_177970 ) ) ( OBJ-AT ?auto_177968 ?auto_177965 ) ( not ( = ?auto_177968 ?auto_177967 ) ) ( OBJ-AT ?auto_177967 ?auto_177970 ) ( OBJ-AT ?auto_177966 ?auto_177965 ) ( not ( = ?auto_177966 ?auto_177967 ) ) ( not ( = ?auto_177966 ?auto_177968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177968 ?auto_177967 ?auto_177965 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177988 - OBJ
      ?auto_177989 - OBJ
      ?auto_177990 - OBJ
      ?auto_177987 - LOCATION
    )
    :vars
    (
      ?auto_177991 - TRUCK
      ?auto_177992 - LOCATION
      ?auto_177994 - CITY
      ?auto_177993 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177991 ?auto_177992 ) ( IN-CITY ?auto_177992 ?auto_177994 ) ( IN-CITY ?auto_177987 ?auto_177994 ) ( not ( = ?auto_177987 ?auto_177992 ) ) ( OBJ-AT ?auto_177993 ?auto_177987 ) ( not ( = ?auto_177993 ?auto_177990 ) ) ( OBJ-AT ?auto_177990 ?auto_177992 ) ( OBJ-AT ?auto_177988 ?auto_177987 ) ( OBJ-AT ?auto_177989 ?auto_177987 ) ( not ( = ?auto_177988 ?auto_177989 ) ) ( not ( = ?auto_177988 ?auto_177990 ) ) ( not ( = ?auto_177988 ?auto_177993 ) ) ( not ( = ?auto_177989 ?auto_177990 ) ) ( not ( = ?auto_177989 ?auto_177993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177993 ?auto_177990 ?auto_177987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178000 - OBJ
      ?auto_178001 - OBJ
      ?auto_178002 - OBJ
      ?auto_177999 - LOCATION
    )
    :vars
    (
      ?auto_178003 - TRUCK
      ?auto_178004 - LOCATION
      ?auto_178006 - CITY
      ?auto_178005 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178003 ?auto_178004 ) ( IN-CITY ?auto_178004 ?auto_178006 ) ( IN-CITY ?auto_177999 ?auto_178006 ) ( not ( = ?auto_177999 ?auto_178004 ) ) ( OBJ-AT ?auto_178005 ?auto_177999 ) ( not ( = ?auto_178005 ?auto_178001 ) ) ( OBJ-AT ?auto_178001 ?auto_178004 ) ( OBJ-AT ?auto_178000 ?auto_177999 ) ( OBJ-AT ?auto_178002 ?auto_177999 ) ( not ( = ?auto_178000 ?auto_178001 ) ) ( not ( = ?auto_178000 ?auto_178002 ) ) ( not ( = ?auto_178000 ?auto_178005 ) ) ( not ( = ?auto_178001 ?auto_178002 ) ) ( not ( = ?auto_178002 ?auto_178005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178005 ?auto_178001 ?auto_177999 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178038 - OBJ
      ?auto_178039 - OBJ
      ?auto_178040 - OBJ
      ?auto_178037 - LOCATION
    )
    :vars
    (
      ?auto_178041 - TRUCK
      ?auto_178042 - LOCATION
      ?auto_178044 - CITY
      ?auto_178043 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178041 ?auto_178042 ) ( IN-CITY ?auto_178042 ?auto_178044 ) ( IN-CITY ?auto_178037 ?auto_178044 ) ( not ( = ?auto_178037 ?auto_178042 ) ) ( OBJ-AT ?auto_178043 ?auto_178037 ) ( not ( = ?auto_178043 ?auto_178038 ) ) ( OBJ-AT ?auto_178038 ?auto_178042 ) ( OBJ-AT ?auto_178039 ?auto_178037 ) ( OBJ-AT ?auto_178040 ?auto_178037 ) ( not ( = ?auto_178038 ?auto_178039 ) ) ( not ( = ?auto_178038 ?auto_178040 ) ) ( not ( = ?auto_178039 ?auto_178040 ) ) ( not ( = ?auto_178039 ?auto_178043 ) ) ( not ( = ?auto_178040 ?auto_178043 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178043 ?auto_178038 ?auto_178037 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178085 - OBJ
      ?auto_178086 - OBJ
      ?auto_178087 - OBJ
      ?auto_178088 - OBJ
      ?auto_178084 - LOCATION
    )
    :vars
    (
      ?auto_178089 - TRUCK
      ?auto_178090 - LOCATION
      ?auto_178091 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178089 ?auto_178090 ) ( IN-CITY ?auto_178090 ?auto_178091 ) ( IN-CITY ?auto_178084 ?auto_178091 ) ( not ( = ?auto_178084 ?auto_178090 ) ) ( OBJ-AT ?auto_178085 ?auto_178084 ) ( not ( = ?auto_178085 ?auto_178088 ) ) ( OBJ-AT ?auto_178088 ?auto_178090 ) ( OBJ-AT ?auto_178086 ?auto_178084 ) ( OBJ-AT ?auto_178087 ?auto_178084 ) ( not ( = ?auto_178085 ?auto_178086 ) ) ( not ( = ?auto_178085 ?auto_178087 ) ) ( not ( = ?auto_178086 ?auto_178087 ) ) ( not ( = ?auto_178086 ?auto_178088 ) ) ( not ( = ?auto_178087 ?auto_178088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178085 ?auto_178088 ?auto_178084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178101 - OBJ
      ?auto_178102 - OBJ
      ?auto_178103 - OBJ
      ?auto_178104 - OBJ
      ?auto_178100 - LOCATION
    )
    :vars
    (
      ?auto_178105 - TRUCK
      ?auto_178106 - LOCATION
      ?auto_178107 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178105 ?auto_178106 ) ( IN-CITY ?auto_178106 ?auto_178107 ) ( IN-CITY ?auto_178100 ?auto_178107 ) ( not ( = ?auto_178100 ?auto_178106 ) ) ( OBJ-AT ?auto_178101 ?auto_178100 ) ( not ( = ?auto_178101 ?auto_178103 ) ) ( OBJ-AT ?auto_178103 ?auto_178106 ) ( OBJ-AT ?auto_178102 ?auto_178100 ) ( OBJ-AT ?auto_178104 ?auto_178100 ) ( not ( = ?auto_178101 ?auto_178102 ) ) ( not ( = ?auto_178101 ?auto_178104 ) ) ( not ( = ?auto_178102 ?auto_178103 ) ) ( not ( = ?auto_178102 ?auto_178104 ) ) ( not ( = ?auto_178103 ?auto_178104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178101 ?auto_178103 ?auto_178100 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178157 - OBJ
      ?auto_178158 - OBJ
      ?auto_178159 - OBJ
      ?auto_178160 - OBJ
      ?auto_178156 - LOCATION
    )
    :vars
    (
      ?auto_178161 - TRUCK
      ?auto_178162 - LOCATION
      ?auto_178163 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178161 ?auto_178162 ) ( IN-CITY ?auto_178162 ?auto_178163 ) ( IN-CITY ?auto_178156 ?auto_178163 ) ( not ( = ?auto_178156 ?auto_178162 ) ) ( OBJ-AT ?auto_178159 ?auto_178156 ) ( not ( = ?auto_178159 ?auto_178158 ) ) ( OBJ-AT ?auto_178158 ?auto_178162 ) ( OBJ-AT ?auto_178157 ?auto_178156 ) ( OBJ-AT ?auto_178160 ?auto_178156 ) ( not ( = ?auto_178157 ?auto_178158 ) ) ( not ( = ?auto_178157 ?auto_178159 ) ) ( not ( = ?auto_178157 ?auto_178160 ) ) ( not ( = ?auto_178158 ?auto_178160 ) ) ( not ( = ?auto_178159 ?auto_178160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178159 ?auto_178158 ?auto_178156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178237 - OBJ
      ?auto_178238 - OBJ
      ?auto_178239 - OBJ
      ?auto_178240 - OBJ
      ?auto_178236 - LOCATION
    )
    :vars
    (
      ?auto_178241 - TRUCK
      ?auto_178242 - LOCATION
      ?auto_178243 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178241 ?auto_178242 ) ( IN-CITY ?auto_178242 ?auto_178243 ) ( IN-CITY ?auto_178236 ?auto_178243 ) ( not ( = ?auto_178236 ?auto_178242 ) ) ( OBJ-AT ?auto_178238 ?auto_178236 ) ( not ( = ?auto_178238 ?auto_178240 ) ) ( OBJ-AT ?auto_178240 ?auto_178242 ) ( OBJ-AT ?auto_178237 ?auto_178236 ) ( OBJ-AT ?auto_178239 ?auto_178236 ) ( not ( = ?auto_178237 ?auto_178238 ) ) ( not ( = ?auto_178237 ?auto_178239 ) ) ( not ( = ?auto_178237 ?auto_178240 ) ) ( not ( = ?auto_178238 ?auto_178239 ) ) ( not ( = ?auto_178239 ?auto_178240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178238 ?auto_178240 ?auto_178236 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178253 - OBJ
      ?auto_178254 - OBJ
      ?auto_178255 - OBJ
      ?auto_178256 - OBJ
      ?auto_178252 - LOCATION
    )
    :vars
    (
      ?auto_178257 - TRUCK
      ?auto_178258 - LOCATION
      ?auto_178259 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178257 ?auto_178258 ) ( IN-CITY ?auto_178258 ?auto_178259 ) ( IN-CITY ?auto_178252 ?auto_178259 ) ( not ( = ?auto_178252 ?auto_178258 ) ) ( OBJ-AT ?auto_178254 ?auto_178252 ) ( not ( = ?auto_178254 ?auto_178255 ) ) ( OBJ-AT ?auto_178255 ?auto_178258 ) ( OBJ-AT ?auto_178253 ?auto_178252 ) ( OBJ-AT ?auto_178256 ?auto_178252 ) ( not ( = ?auto_178253 ?auto_178254 ) ) ( not ( = ?auto_178253 ?auto_178255 ) ) ( not ( = ?auto_178253 ?auto_178256 ) ) ( not ( = ?auto_178254 ?auto_178256 ) ) ( not ( = ?auto_178255 ?auto_178256 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178254 ?auto_178255 ?auto_178252 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178277 - OBJ
      ?auto_178278 - OBJ
      ?auto_178279 - OBJ
      ?auto_178280 - OBJ
      ?auto_178276 - LOCATION
    )
    :vars
    (
      ?auto_178281 - TRUCK
      ?auto_178282 - LOCATION
      ?auto_178284 - CITY
      ?auto_178283 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178281 ?auto_178282 ) ( IN-CITY ?auto_178282 ?auto_178284 ) ( IN-CITY ?auto_178276 ?auto_178284 ) ( not ( = ?auto_178276 ?auto_178282 ) ) ( OBJ-AT ?auto_178283 ?auto_178276 ) ( not ( = ?auto_178283 ?auto_178280 ) ) ( OBJ-AT ?auto_178280 ?auto_178282 ) ( OBJ-AT ?auto_178277 ?auto_178276 ) ( OBJ-AT ?auto_178278 ?auto_178276 ) ( OBJ-AT ?auto_178279 ?auto_178276 ) ( not ( = ?auto_178277 ?auto_178278 ) ) ( not ( = ?auto_178277 ?auto_178279 ) ) ( not ( = ?auto_178277 ?auto_178280 ) ) ( not ( = ?auto_178277 ?auto_178283 ) ) ( not ( = ?auto_178278 ?auto_178279 ) ) ( not ( = ?auto_178278 ?auto_178280 ) ) ( not ( = ?auto_178278 ?auto_178283 ) ) ( not ( = ?auto_178279 ?auto_178280 ) ) ( not ( = ?auto_178279 ?auto_178283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178283 ?auto_178280 ?auto_178276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178294 - OBJ
      ?auto_178295 - OBJ
      ?auto_178296 - OBJ
      ?auto_178297 - OBJ
      ?auto_178293 - LOCATION
    )
    :vars
    (
      ?auto_178298 - TRUCK
      ?auto_178299 - LOCATION
      ?auto_178301 - CITY
      ?auto_178300 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178298 ?auto_178299 ) ( IN-CITY ?auto_178299 ?auto_178301 ) ( IN-CITY ?auto_178293 ?auto_178301 ) ( not ( = ?auto_178293 ?auto_178299 ) ) ( OBJ-AT ?auto_178300 ?auto_178293 ) ( not ( = ?auto_178300 ?auto_178296 ) ) ( OBJ-AT ?auto_178296 ?auto_178299 ) ( OBJ-AT ?auto_178294 ?auto_178293 ) ( OBJ-AT ?auto_178295 ?auto_178293 ) ( OBJ-AT ?auto_178297 ?auto_178293 ) ( not ( = ?auto_178294 ?auto_178295 ) ) ( not ( = ?auto_178294 ?auto_178296 ) ) ( not ( = ?auto_178294 ?auto_178297 ) ) ( not ( = ?auto_178294 ?auto_178300 ) ) ( not ( = ?auto_178295 ?auto_178296 ) ) ( not ( = ?auto_178295 ?auto_178297 ) ) ( not ( = ?auto_178295 ?auto_178300 ) ) ( not ( = ?auto_178296 ?auto_178297 ) ) ( not ( = ?auto_178297 ?auto_178300 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178300 ?auto_178296 ?auto_178293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178336 - OBJ
      ?auto_178337 - OBJ
      ?auto_178338 - OBJ
      ?auto_178339 - OBJ
      ?auto_178335 - LOCATION
    )
    :vars
    (
      ?auto_178340 - TRUCK
      ?auto_178341 - LOCATION
      ?auto_178342 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178340 ?auto_178341 ) ( IN-CITY ?auto_178341 ?auto_178342 ) ( IN-CITY ?auto_178335 ?auto_178342 ) ( not ( = ?auto_178335 ?auto_178341 ) ) ( OBJ-AT ?auto_178339 ?auto_178335 ) ( not ( = ?auto_178339 ?auto_178337 ) ) ( OBJ-AT ?auto_178337 ?auto_178341 ) ( OBJ-AT ?auto_178336 ?auto_178335 ) ( OBJ-AT ?auto_178338 ?auto_178335 ) ( not ( = ?auto_178336 ?auto_178337 ) ) ( not ( = ?auto_178336 ?auto_178338 ) ) ( not ( = ?auto_178336 ?auto_178339 ) ) ( not ( = ?auto_178337 ?auto_178338 ) ) ( not ( = ?auto_178338 ?auto_178339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178339 ?auto_178337 ?auto_178335 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178344 - OBJ
      ?auto_178345 - OBJ
      ?auto_178346 - OBJ
      ?auto_178347 - OBJ
      ?auto_178343 - LOCATION
    )
    :vars
    (
      ?auto_178348 - TRUCK
      ?auto_178349 - LOCATION
      ?auto_178351 - CITY
      ?auto_178350 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178348 ?auto_178349 ) ( IN-CITY ?auto_178349 ?auto_178351 ) ( IN-CITY ?auto_178343 ?auto_178351 ) ( not ( = ?auto_178343 ?auto_178349 ) ) ( OBJ-AT ?auto_178350 ?auto_178343 ) ( not ( = ?auto_178350 ?auto_178345 ) ) ( OBJ-AT ?auto_178345 ?auto_178349 ) ( OBJ-AT ?auto_178344 ?auto_178343 ) ( OBJ-AT ?auto_178346 ?auto_178343 ) ( OBJ-AT ?auto_178347 ?auto_178343 ) ( not ( = ?auto_178344 ?auto_178345 ) ) ( not ( = ?auto_178344 ?auto_178346 ) ) ( not ( = ?auto_178344 ?auto_178347 ) ) ( not ( = ?auto_178344 ?auto_178350 ) ) ( not ( = ?auto_178345 ?auto_178346 ) ) ( not ( = ?auto_178345 ?auto_178347 ) ) ( not ( = ?auto_178346 ?auto_178347 ) ) ( not ( = ?auto_178346 ?auto_178350 ) ) ( not ( = ?auto_178347 ?auto_178350 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178350 ?auto_178345 ?auto_178343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178388 - OBJ
      ?auto_178389 - OBJ
      ?auto_178390 - OBJ
      ?auto_178391 - OBJ
      ?auto_178387 - LOCATION
    )
    :vars
    (
      ?auto_178392 - TRUCK
      ?auto_178393 - LOCATION
      ?auto_178394 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178392 ?auto_178393 ) ( IN-CITY ?auto_178393 ?auto_178394 ) ( IN-CITY ?auto_178387 ?auto_178394 ) ( not ( = ?auto_178387 ?auto_178393 ) ) ( OBJ-AT ?auto_178390 ?auto_178387 ) ( not ( = ?auto_178390 ?auto_178388 ) ) ( OBJ-AT ?auto_178388 ?auto_178393 ) ( OBJ-AT ?auto_178389 ?auto_178387 ) ( OBJ-AT ?auto_178391 ?auto_178387 ) ( not ( = ?auto_178388 ?auto_178389 ) ) ( not ( = ?auto_178388 ?auto_178391 ) ) ( not ( = ?auto_178389 ?auto_178390 ) ) ( not ( = ?auto_178389 ?auto_178391 ) ) ( not ( = ?auto_178390 ?auto_178391 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178390 ?auto_178388 ?auto_178387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178412 - OBJ
      ?auto_178413 - OBJ
      ?auto_178414 - OBJ
      ?auto_178415 - OBJ
      ?auto_178411 - LOCATION
    )
    :vars
    (
      ?auto_178416 - TRUCK
      ?auto_178417 - LOCATION
      ?auto_178418 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178416 ?auto_178417 ) ( IN-CITY ?auto_178417 ?auto_178418 ) ( IN-CITY ?auto_178411 ?auto_178418 ) ( not ( = ?auto_178411 ?auto_178417 ) ) ( OBJ-AT ?auto_178413 ?auto_178411 ) ( not ( = ?auto_178413 ?auto_178412 ) ) ( OBJ-AT ?auto_178412 ?auto_178417 ) ( OBJ-AT ?auto_178414 ?auto_178411 ) ( OBJ-AT ?auto_178415 ?auto_178411 ) ( not ( = ?auto_178412 ?auto_178414 ) ) ( not ( = ?auto_178412 ?auto_178415 ) ) ( not ( = ?auto_178413 ?auto_178414 ) ) ( not ( = ?auto_178413 ?auto_178415 ) ) ( not ( = ?auto_178414 ?auto_178415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178413 ?auto_178412 ?auto_178411 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178492 - OBJ
      ?auto_178493 - OBJ
      ?auto_178494 - OBJ
      ?auto_178495 - OBJ
      ?auto_178491 - LOCATION
    )
    :vars
    (
      ?auto_178496 - TRUCK
      ?auto_178497 - LOCATION
      ?auto_178499 - CITY
      ?auto_178498 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178496 ?auto_178497 ) ( IN-CITY ?auto_178497 ?auto_178499 ) ( IN-CITY ?auto_178491 ?auto_178499 ) ( not ( = ?auto_178491 ?auto_178497 ) ) ( OBJ-AT ?auto_178498 ?auto_178491 ) ( not ( = ?auto_178498 ?auto_178492 ) ) ( OBJ-AT ?auto_178492 ?auto_178497 ) ( OBJ-AT ?auto_178493 ?auto_178491 ) ( OBJ-AT ?auto_178494 ?auto_178491 ) ( OBJ-AT ?auto_178495 ?auto_178491 ) ( not ( = ?auto_178492 ?auto_178493 ) ) ( not ( = ?auto_178492 ?auto_178494 ) ) ( not ( = ?auto_178492 ?auto_178495 ) ) ( not ( = ?auto_178493 ?auto_178494 ) ) ( not ( = ?auto_178493 ?auto_178495 ) ) ( not ( = ?auto_178493 ?auto_178498 ) ) ( not ( = ?auto_178494 ?auto_178495 ) ) ( not ( = ?auto_178494 ?auto_178498 ) ) ( not ( = ?auto_178495 ?auto_178498 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178498 ?auto_178492 ?auto_178491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178676 - OBJ
      ?auto_178677 - OBJ
      ?auto_178678 - OBJ
      ?auto_178675 - LOCATION
    )
    :vars
    (
      ?auto_178682 - LOCATION
      ?auto_178680 - CITY
      ?auto_178679 - OBJ
      ?auto_178681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178682 ?auto_178680 ) ( IN-CITY ?auto_178675 ?auto_178680 ) ( not ( = ?auto_178675 ?auto_178682 ) ) ( OBJ-AT ?auto_178679 ?auto_178675 ) ( not ( = ?auto_178679 ?auto_178678 ) ) ( OBJ-AT ?auto_178678 ?auto_178682 ) ( TRUCK-AT ?auto_178681 ?auto_178675 ) ( OBJ-AT ?auto_178676 ?auto_178675 ) ( OBJ-AT ?auto_178677 ?auto_178675 ) ( not ( = ?auto_178676 ?auto_178677 ) ) ( not ( = ?auto_178676 ?auto_178678 ) ) ( not ( = ?auto_178676 ?auto_178679 ) ) ( not ( = ?auto_178677 ?auto_178678 ) ) ( not ( = ?auto_178677 ?auto_178679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178679 ?auto_178678 ?auto_178675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178688 - OBJ
      ?auto_178689 - OBJ
      ?auto_178690 - OBJ
      ?auto_178687 - LOCATION
    )
    :vars
    (
      ?auto_178694 - LOCATION
      ?auto_178692 - CITY
      ?auto_178691 - OBJ
      ?auto_178693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178694 ?auto_178692 ) ( IN-CITY ?auto_178687 ?auto_178692 ) ( not ( = ?auto_178687 ?auto_178694 ) ) ( OBJ-AT ?auto_178691 ?auto_178687 ) ( not ( = ?auto_178691 ?auto_178689 ) ) ( OBJ-AT ?auto_178689 ?auto_178694 ) ( TRUCK-AT ?auto_178693 ?auto_178687 ) ( OBJ-AT ?auto_178688 ?auto_178687 ) ( OBJ-AT ?auto_178690 ?auto_178687 ) ( not ( = ?auto_178688 ?auto_178689 ) ) ( not ( = ?auto_178688 ?auto_178690 ) ) ( not ( = ?auto_178688 ?auto_178691 ) ) ( not ( = ?auto_178689 ?auto_178690 ) ) ( not ( = ?auto_178690 ?auto_178691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178691 ?auto_178689 ?auto_178687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178726 - OBJ
      ?auto_178727 - OBJ
      ?auto_178728 - OBJ
      ?auto_178725 - LOCATION
    )
    :vars
    (
      ?auto_178732 - LOCATION
      ?auto_178730 - CITY
      ?auto_178729 - OBJ
      ?auto_178731 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178732 ?auto_178730 ) ( IN-CITY ?auto_178725 ?auto_178730 ) ( not ( = ?auto_178725 ?auto_178732 ) ) ( OBJ-AT ?auto_178729 ?auto_178725 ) ( not ( = ?auto_178729 ?auto_178726 ) ) ( OBJ-AT ?auto_178726 ?auto_178732 ) ( TRUCK-AT ?auto_178731 ?auto_178725 ) ( OBJ-AT ?auto_178727 ?auto_178725 ) ( OBJ-AT ?auto_178728 ?auto_178725 ) ( not ( = ?auto_178726 ?auto_178727 ) ) ( not ( = ?auto_178726 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178729 ) ) ( not ( = ?auto_178728 ?auto_178729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178729 ?auto_178726 ?auto_178725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178765 - OBJ
      ?auto_178766 - OBJ
      ?auto_178767 - OBJ
      ?auto_178768 - OBJ
      ?auto_178764 - LOCATION
    )
    :vars
    (
      ?auto_178771 - LOCATION
      ?auto_178769 - CITY
      ?auto_178770 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178771 ?auto_178769 ) ( IN-CITY ?auto_178764 ?auto_178769 ) ( not ( = ?auto_178764 ?auto_178771 ) ) ( OBJ-AT ?auto_178765 ?auto_178764 ) ( not ( = ?auto_178765 ?auto_178768 ) ) ( OBJ-AT ?auto_178768 ?auto_178771 ) ( TRUCK-AT ?auto_178770 ?auto_178764 ) ( OBJ-AT ?auto_178766 ?auto_178764 ) ( OBJ-AT ?auto_178767 ?auto_178764 ) ( not ( = ?auto_178765 ?auto_178766 ) ) ( not ( = ?auto_178765 ?auto_178767 ) ) ( not ( = ?auto_178766 ?auto_178767 ) ) ( not ( = ?auto_178766 ?auto_178768 ) ) ( not ( = ?auto_178767 ?auto_178768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178765 ?auto_178768 ?auto_178764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178781 - OBJ
      ?auto_178782 - OBJ
      ?auto_178783 - OBJ
      ?auto_178784 - OBJ
      ?auto_178780 - LOCATION
    )
    :vars
    (
      ?auto_178787 - LOCATION
      ?auto_178785 - CITY
      ?auto_178786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178787 ?auto_178785 ) ( IN-CITY ?auto_178780 ?auto_178785 ) ( not ( = ?auto_178780 ?auto_178787 ) ) ( OBJ-AT ?auto_178781 ?auto_178780 ) ( not ( = ?auto_178781 ?auto_178783 ) ) ( OBJ-AT ?auto_178783 ?auto_178787 ) ( TRUCK-AT ?auto_178786 ?auto_178780 ) ( OBJ-AT ?auto_178782 ?auto_178780 ) ( OBJ-AT ?auto_178784 ?auto_178780 ) ( not ( = ?auto_178781 ?auto_178782 ) ) ( not ( = ?auto_178781 ?auto_178784 ) ) ( not ( = ?auto_178782 ?auto_178783 ) ) ( not ( = ?auto_178782 ?auto_178784 ) ) ( not ( = ?auto_178783 ?auto_178784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178781 ?auto_178783 ?auto_178780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178845 - OBJ
      ?auto_178846 - OBJ
      ?auto_178847 - OBJ
      ?auto_178848 - OBJ
      ?auto_178844 - LOCATION
    )
    :vars
    (
      ?auto_178851 - LOCATION
      ?auto_178849 - CITY
      ?auto_178850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178851 ?auto_178849 ) ( IN-CITY ?auto_178844 ?auto_178849 ) ( not ( = ?auto_178844 ?auto_178851 ) ) ( OBJ-AT ?auto_178848 ?auto_178844 ) ( not ( = ?auto_178848 ?auto_178846 ) ) ( OBJ-AT ?auto_178846 ?auto_178851 ) ( TRUCK-AT ?auto_178850 ?auto_178844 ) ( OBJ-AT ?auto_178845 ?auto_178844 ) ( OBJ-AT ?auto_178847 ?auto_178844 ) ( not ( = ?auto_178845 ?auto_178846 ) ) ( not ( = ?auto_178845 ?auto_178847 ) ) ( not ( = ?auto_178845 ?auto_178848 ) ) ( not ( = ?auto_178846 ?auto_178847 ) ) ( not ( = ?auto_178847 ?auto_178848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178848 ?auto_178846 ?auto_178844 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178853 - OBJ
      ?auto_178854 - OBJ
      ?auto_178855 - OBJ
      ?auto_178856 - OBJ
      ?auto_178852 - LOCATION
    )
    :vars
    (
      ?auto_178859 - LOCATION
      ?auto_178857 - CITY
      ?auto_178858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178859 ?auto_178857 ) ( IN-CITY ?auto_178852 ?auto_178857 ) ( not ( = ?auto_178852 ?auto_178859 ) ) ( OBJ-AT ?auto_178853 ?auto_178852 ) ( not ( = ?auto_178853 ?auto_178854 ) ) ( OBJ-AT ?auto_178854 ?auto_178859 ) ( TRUCK-AT ?auto_178858 ?auto_178852 ) ( OBJ-AT ?auto_178855 ?auto_178852 ) ( OBJ-AT ?auto_178856 ?auto_178852 ) ( not ( = ?auto_178853 ?auto_178855 ) ) ( not ( = ?auto_178853 ?auto_178856 ) ) ( not ( = ?auto_178854 ?auto_178855 ) ) ( not ( = ?auto_178854 ?auto_178856 ) ) ( not ( = ?auto_178855 ?auto_178856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178853 ?auto_178854 ?auto_178852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178917 - OBJ
      ?auto_178918 - OBJ
      ?auto_178919 - OBJ
      ?auto_178920 - OBJ
      ?auto_178916 - LOCATION
    )
    :vars
    (
      ?auto_178923 - LOCATION
      ?auto_178921 - CITY
      ?auto_178922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178923 ?auto_178921 ) ( IN-CITY ?auto_178916 ?auto_178921 ) ( not ( = ?auto_178916 ?auto_178923 ) ) ( OBJ-AT ?auto_178918 ?auto_178916 ) ( not ( = ?auto_178918 ?auto_178920 ) ) ( OBJ-AT ?auto_178920 ?auto_178923 ) ( TRUCK-AT ?auto_178922 ?auto_178916 ) ( OBJ-AT ?auto_178917 ?auto_178916 ) ( OBJ-AT ?auto_178919 ?auto_178916 ) ( not ( = ?auto_178917 ?auto_178918 ) ) ( not ( = ?auto_178917 ?auto_178919 ) ) ( not ( = ?auto_178917 ?auto_178920 ) ) ( not ( = ?auto_178918 ?auto_178919 ) ) ( not ( = ?auto_178919 ?auto_178920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178918 ?auto_178920 ?auto_178916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178933 - OBJ
      ?auto_178934 - OBJ
      ?auto_178935 - OBJ
      ?auto_178936 - OBJ
      ?auto_178932 - LOCATION
    )
    :vars
    (
      ?auto_178939 - LOCATION
      ?auto_178937 - CITY
      ?auto_178938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178939 ?auto_178937 ) ( IN-CITY ?auto_178932 ?auto_178937 ) ( not ( = ?auto_178932 ?auto_178939 ) ) ( OBJ-AT ?auto_178934 ?auto_178932 ) ( not ( = ?auto_178934 ?auto_178935 ) ) ( OBJ-AT ?auto_178935 ?auto_178939 ) ( TRUCK-AT ?auto_178938 ?auto_178932 ) ( OBJ-AT ?auto_178933 ?auto_178932 ) ( OBJ-AT ?auto_178936 ?auto_178932 ) ( not ( = ?auto_178933 ?auto_178934 ) ) ( not ( = ?auto_178933 ?auto_178935 ) ) ( not ( = ?auto_178933 ?auto_178936 ) ) ( not ( = ?auto_178934 ?auto_178936 ) ) ( not ( = ?auto_178935 ?auto_178936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178934 ?auto_178935 ?auto_178932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178965 - OBJ
      ?auto_178966 - OBJ
      ?auto_178967 - OBJ
      ?auto_178968 - OBJ
      ?auto_178964 - LOCATION
    )
    :vars
    (
      ?auto_178972 - LOCATION
      ?auto_178970 - CITY
      ?auto_178969 - OBJ
      ?auto_178971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178972 ?auto_178970 ) ( IN-CITY ?auto_178964 ?auto_178970 ) ( not ( = ?auto_178964 ?auto_178972 ) ) ( OBJ-AT ?auto_178969 ?auto_178964 ) ( not ( = ?auto_178969 ?auto_178968 ) ) ( OBJ-AT ?auto_178968 ?auto_178972 ) ( TRUCK-AT ?auto_178971 ?auto_178964 ) ( OBJ-AT ?auto_178965 ?auto_178964 ) ( OBJ-AT ?auto_178966 ?auto_178964 ) ( OBJ-AT ?auto_178967 ?auto_178964 ) ( not ( = ?auto_178965 ?auto_178966 ) ) ( not ( = ?auto_178965 ?auto_178967 ) ) ( not ( = ?auto_178965 ?auto_178968 ) ) ( not ( = ?auto_178965 ?auto_178969 ) ) ( not ( = ?auto_178966 ?auto_178967 ) ) ( not ( = ?auto_178966 ?auto_178968 ) ) ( not ( = ?auto_178966 ?auto_178969 ) ) ( not ( = ?auto_178967 ?auto_178968 ) ) ( not ( = ?auto_178967 ?auto_178969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178969 ?auto_178968 ?auto_178964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178982 - OBJ
      ?auto_178983 - OBJ
      ?auto_178984 - OBJ
      ?auto_178985 - OBJ
      ?auto_178981 - LOCATION
    )
    :vars
    (
      ?auto_178989 - LOCATION
      ?auto_178987 - CITY
      ?auto_178986 - OBJ
      ?auto_178988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178989 ?auto_178987 ) ( IN-CITY ?auto_178981 ?auto_178987 ) ( not ( = ?auto_178981 ?auto_178989 ) ) ( OBJ-AT ?auto_178986 ?auto_178981 ) ( not ( = ?auto_178986 ?auto_178984 ) ) ( OBJ-AT ?auto_178984 ?auto_178989 ) ( TRUCK-AT ?auto_178988 ?auto_178981 ) ( OBJ-AT ?auto_178982 ?auto_178981 ) ( OBJ-AT ?auto_178983 ?auto_178981 ) ( OBJ-AT ?auto_178985 ?auto_178981 ) ( not ( = ?auto_178982 ?auto_178983 ) ) ( not ( = ?auto_178982 ?auto_178984 ) ) ( not ( = ?auto_178982 ?auto_178985 ) ) ( not ( = ?auto_178982 ?auto_178986 ) ) ( not ( = ?auto_178983 ?auto_178984 ) ) ( not ( = ?auto_178983 ?auto_178985 ) ) ( not ( = ?auto_178983 ?auto_178986 ) ) ( not ( = ?auto_178984 ?auto_178985 ) ) ( not ( = ?auto_178985 ?auto_178986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178986 ?auto_178984 ?auto_178981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179032 - OBJ
      ?auto_179033 - OBJ
      ?auto_179034 - OBJ
      ?auto_179035 - OBJ
      ?auto_179031 - LOCATION
    )
    :vars
    (
      ?auto_179039 - LOCATION
      ?auto_179037 - CITY
      ?auto_179036 - OBJ
      ?auto_179038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179039 ?auto_179037 ) ( IN-CITY ?auto_179031 ?auto_179037 ) ( not ( = ?auto_179031 ?auto_179039 ) ) ( OBJ-AT ?auto_179036 ?auto_179031 ) ( not ( = ?auto_179036 ?auto_179033 ) ) ( OBJ-AT ?auto_179033 ?auto_179039 ) ( TRUCK-AT ?auto_179038 ?auto_179031 ) ( OBJ-AT ?auto_179032 ?auto_179031 ) ( OBJ-AT ?auto_179034 ?auto_179031 ) ( OBJ-AT ?auto_179035 ?auto_179031 ) ( not ( = ?auto_179032 ?auto_179033 ) ) ( not ( = ?auto_179032 ?auto_179034 ) ) ( not ( = ?auto_179032 ?auto_179035 ) ) ( not ( = ?auto_179032 ?auto_179036 ) ) ( not ( = ?auto_179033 ?auto_179034 ) ) ( not ( = ?auto_179033 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179036 ) ) ( not ( = ?auto_179035 ?auto_179036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179036 ?auto_179033 ?auto_179031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179084 - OBJ
      ?auto_179085 - OBJ
      ?auto_179086 - OBJ
      ?auto_179087 - OBJ
      ?auto_179083 - LOCATION
    )
    :vars
    (
      ?auto_179090 - LOCATION
      ?auto_179088 - CITY
      ?auto_179089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179090 ?auto_179088 ) ( IN-CITY ?auto_179083 ?auto_179088 ) ( not ( = ?auto_179083 ?auto_179090 ) ) ( OBJ-AT ?auto_179085 ?auto_179083 ) ( not ( = ?auto_179085 ?auto_179084 ) ) ( OBJ-AT ?auto_179084 ?auto_179090 ) ( TRUCK-AT ?auto_179089 ?auto_179083 ) ( OBJ-AT ?auto_179086 ?auto_179083 ) ( OBJ-AT ?auto_179087 ?auto_179083 ) ( not ( = ?auto_179084 ?auto_179086 ) ) ( not ( = ?auto_179084 ?auto_179087 ) ) ( not ( = ?auto_179085 ?auto_179086 ) ) ( not ( = ?auto_179085 ?auto_179087 ) ) ( not ( = ?auto_179086 ?auto_179087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179085 ?auto_179084 ?auto_179083 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179148 - OBJ
      ?auto_179149 - OBJ
      ?auto_179150 - OBJ
      ?auto_179151 - OBJ
      ?auto_179147 - LOCATION
    )
    :vars
    (
      ?auto_179154 - LOCATION
      ?auto_179152 - CITY
      ?auto_179153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179154 ?auto_179152 ) ( IN-CITY ?auto_179147 ?auto_179152 ) ( not ( = ?auto_179147 ?auto_179154 ) ) ( OBJ-AT ?auto_179151 ?auto_179147 ) ( not ( = ?auto_179151 ?auto_179148 ) ) ( OBJ-AT ?auto_179148 ?auto_179154 ) ( TRUCK-AT ?auto_179153 ?auto_179147 ) ( OBJ-AT ?auto_179149 ?auto_179147 ) ( OBJ-AT ?auto_179150 ?auto_179147 ) ( not ( = ?auto_179148 ?auto_179149 ) ) ( not ( = ?auto_179148 ?auto_179150 ) ) ( not ( = ?auto_179149 ?auto_179150 ) ) ( not ( = ?auto_179149 ?auto_179151 ) ) ( not ( = ?auto_179150 ?auto_179151 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179151 ?auto_179148 ?auto_179147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179180 - OBJ
      ?auto_179181 - OBJ
      ?auto_179182 - OBJ
      ?auto_179183 - OBJ
      ?auto_179179 - LOCATION
    )
    :vars
    (
      ?auto_179187 - LOCATION
      ?auto_179185 - CITY
      ?auto_179184 - OBJ
      ?auto_179186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179187 ?auto_179185 ) ( IN-CITY ?auto_179179 ?auto_179185 ) ( not ( = ?auto_179179 ?auto_179187 ) ) ( OBJ-AT ?auto_179184 ?auto_179179 ) ( not ( = ?auto_179184 ?auto_179180 ) ) ( OBJ-AT ?auto_179180 ?auto_179187 ) ( TRUCK-AT ?auto_179186 ?auto_179179 ) ( OBJ-AT ?auto_179181 ?auto_179179 ) ( OBJ-AT ?auto_179182 ?auto_179179 ) ( OBJ-AT ?auto_179183 ?auto_179179 ) ( not ( = ?auto_179180 ?auto_179181 ) ) ( not ( = ?auto_179180 ?auto_179182 ) ) ( not ( = ?auto_179180 ?auto_179183 ) ) ( not ( = ?auto_179181 ?auto_179182 ) ) ( not ( = ?auto_179181 ?auto_179183 ) ) ( not ( = ?auto_179181 ?auto_179184 ) ) ( not ( = ?auto_179182 ?auto_179183 ) ) ( not ( = ?auto_179182 ?auto_179184 ) ) ( not ( = ?auto_179183 ?auto_179184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179184 ?auto_179180 ?auto_179179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179329 - OBJ
      ?auto_179330 - OBJ
      ?auto_179331 - OBJ
      ?auto_179328 - LOCATION
    )
    :vars
    (
      ?auto_179332 - LOCATION
      ?auto_179333 - CITY
      ?auto_179334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179332 ?auto_179333 ) ( IN-CITY ?auto_179328 ?auto_179333 ) ( not ( = ?auto_179328 ?auto_179332 ) ) ( OBJ-AT ?auto_179329 ?auto_179328 ) ( not ( = ?auto_179329 ?auto_179331 ) ) ( OBJ-AT ?auto_179331 ?auto_179332 ) ( TRUCK-AT ?auto_179334 ?auto_179328 ) ( OBJ-AT ?auto_179330 ?auto_179328 ) ( not ( = ?auto_179329 ?auto_179330 ) ) ( not ( = ?auto_179330 ?auto_179331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179329 ?auto_179331 ?auto_179328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179343 - OBJ
      ?auto_179344 - OBJ
      ?auto_179345 - OBJ
      ?auto_179342 - LOCATION
    )
    :vars
    (
      ?auto_179346 - LOCATION
      ?auto_179347 - CITY
      ?auto_179348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179346 ?auto_179347 ) ( IN-CITY ?auto_179342 ?auto_179347 ) ( not ( = ?auto_179342 ?auto_179346 ) ) ( OBJ-AT ?auto_179345 ?auto_179342 ) ( not ( = ?auto_179345 ?auto_179344 ) ) ( OBJ-AT ?auto_179344 ?auto_179346 ) ( TRUCK-AT ?auto_179348 ?auto_179342 ) ( OBJ-AT ?auto_179343 ?auto_179342 ) ( not ( = ?auto_179343 ?auto_179344 ) ) ( not ( = ?auto_179343 ?auto_179345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179345 ?auto_179344 ?auto_179342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179402 - OBJ
      ?auto_179403 - OBJ
      ?auto_179404 - OBJ
      ?auto_179401 - LOCATION
    )
    :vars
    (
      ?auto_179405 - LOCATION
      ?auto_179406 - CITY
      ?auto_179407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179405 ?auto_179406 ) ( IN-CITY ?auto_179401 ?auto_179406 ) ( not ( = ?auto_179401 ?auto_179405 ) ) ( OBJ-AT ?auto_179403 ?auto_179401 ) ( not ( = ?auto_179403 ?auto_179402 ) ) ( OBJ-AT ?auto_179402 ?auto_179405 ) ( TRUCK-AT ?auto_179407 ?auto_179401 ) ( OBJ-AT ?auto_179404 ?auto_179401 ) ( not ( = ?auto_179402 ?auto_179404 ) ) ( not ( = ?auto_179403 ?auto_179404 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179403 ?auto_179402 ?auto_179401 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_180004 - OBJ
      ?auto_180003 - LOCATION
    )
    :vars
    (
      ?auto_180005 - LOCATION
      ?auto_180007 - CITY
      ?auto_180006 - OBJ
      ?auto_180008 - TRUCK
      ?auto_180009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180005 ?auto_180007 ) ( IN-CITY ?auto_180003 ?auto_180007 ) ( not ( = ?auto_180003 ?auto_180005 ) ) ( OBJ-AT ?auto_180006 ?auto_180003 ) ( not ( = ?auto_180006 ?auto_180004 ) ) ( OBJ-AT ?auto_180004 ?auto_180005 ) ( TRUCK-AT ?auto_180008 ?auto_180009 ) ( IN-CITY ?auto_180009 ?auto_180007 ) ( not ( = ?auto_180003 ?auto_180009 ) ) ( not ( = ?auto_180005 ?auto_180009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_180008 ?auto_180009 ?auto_180003 ?auto_180007 )
      ( DELIVER-2PKG ?auto_180006 ?auto_180004 ?auto_180003 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180011 - OBJ
      ?auto_180012 - OBJ
      ?auto_180010 - LOCATION
    )
    :vars
    (
      ?auto_180014 - LOCATION
      ?auto_180013 - CITY
      ?auto_180016 - TRUCK
      ?auto_180015 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180014 ?auto_180013 ) ( IN-CITY ?auto_180010 ?auto_180013 ) ( not ( = ?auto_180010 ?auto_180014 ) ) ( OBJ-AT ?auto_180011 ?auto_180010 ) ( not ( = ?auto_180011 ?auto_180012 ) ) ( OBJ-AT ?auto_180012 ?auto_180014 ) ( TRUCK-AT ?auto_180016 ?auto_180015 ) ( IN-CITY ?auto_180015 ?auto_180013 ) ( not ( = ?auto_180010 ?auto_180015 ) ) ( not ( = ?auto_180014 ?auto_180015 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_180012 ?auto_180010 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180026 - OBJ
      ?auto_180027 - OBJ
      ?auto_180025 - LOCATION
    )
    :vars
    (
      ?auto_180029 - LOCATION
      ?auto_180028 - CITY
      ?auto_180030 - TRUCK
      ?auto_180031 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180029 ?auto_180028 ) ( IN-CITY ?auto_180025 ?auto_180028 ) ( not ( = ?auto_180025 ?auto_180029 ) ) ( OBJ-AT ?auto_180027 ?auto_180025 ) ( not ( = ?auto_180027 ?auto_180026 ) ) ( OBJ-AT ?auto_180026 ?auto_180029 ) ( TRUCK-AT ?auto_180030 ?auto_180031 ) ( IN-CITY ?auto_180031 ?auto_180028 ) ( not ( = ?auto_180025 ?auto_180031 ) ) ( not ( = ?auto_180029 ?auto_180031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180027 ?auto_180026 ?auto_180025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180049 - OBJ
      ?auto_180050 - OBJ
      ?auto_180051 - OBJ
      ?auto_180048 - LOCATION
    )
    :vars
    (
      ?auto_180053 - LOCATION
      ?auto_180052 - CITY
      ?auto_180054 - TRUCK
      ?auto_180055 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180053 ?auto_180052 ) ( IN-CITY ?auto_180048 ?auto_180052 ) ( not ( = ?auto_180048 ?auto_180053 ) ) ( OBJ-AT ?auto_180049 ?auto_180048 ) ( not ( = ?auto_180049 ?auto_180051 ) ) ( OBJ-AT ?auto_180051 ?auto_180053 ) ( TRUCK-AT ?auto_180054 ?auto_180055 ) ( IN-CITY ?auto_180055 ?auto_180052 ) ( not ( = ?auto_180048 ?auto_180055 ) ) ( not ( = ?auto_180053 ?auto_180055 ) ) ( OBJ-AT ?auto_180050 ?auto_180048 ) ( not ( = ?auto_180049 ?auto_180050 ) ) ( not ( = ?auto_180050 ?auto_180051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180049 ?auto_180051 ?auto_180048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180065 - OBJ
      ?auto_180066 - OBJ
      ?auto_180067 - OBJ
      ?auto_180064 - LOCATION
    )
    :vars
    (
      ?auto_180069 - LOCATION
      ?auto_180068 - CITY
      ?auto_180070 - TRUCK
      ?auto_180071 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180069 ?auto_180068 ) ( IN-CITY ?auto_180064 ?auto_180068 ) ( not ( = ?auto_180064 ?auto_180069 ) ) ( OBJ-AT ?auto_180067 ?auto_180064 ) ( not ( = ?auto_180067 ?auto_180066 ) ) ( OBJ-AT ?auto_180066 ?auto_180069 ) ( TRUCK-AT ?auto_180070 ?auto_180071 ) ( IN-CITY ?auto_180071 ?auto_180068 ) ( not ( = ?auto_180064 ?auto_180071 ) ) ( not ( = ?auto_180069 ?auto_180071 ) ) ( OBJ-AT ?auto_180065 ?auto_180064 ) ( not ( = ?auto_180065 ?auto_180066 ) ) ( not ( = ?auto_180065 ?auto_180067 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180067 ?auto_180066 ?auto_180064 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180132 - OBJ
      ?auto_180133 - OBJ
      ?auto_180134 - OBJ
      ?auto_180131 - LOCATION
    )
    :vars
    (
      ?auto_180136 - LOCATION
      ?auto_180135 - CITY
      ?auto_180137 - TRUCK
      ?auto_180138 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180136 ?auto_180135 ) ( IN-CITY ?auto_180131 ?auto_180135 ) ( not ( = ?auto_180131 ?auto_180136 ) ) ( OBJ-AT ?auto_180133 ?auto_180131 ) ( not ( = ?auto_180133 ?auto_180132 ) ) ( OBJ-AT ?auto_180132 ?auto_180136 ) ( TRUCK-AT ?auto_180137 ?auto_180138 ) ( IN-CITY ?auto_180138 ?auto_180135 ) ( not ( = ?auto_180131 ?auto_180138 ) ) ( not ( = ?auto_180136 ?auto_180138 ) ) ( OBJ-AT ?auto_180134 ?auto_180131 ) ( not ( = ?auto_180132 ?auto_180134 ) ) ( not ( = ?auto_180133 ?auto_180134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180133 ?auto_180132 ?auto_180131 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180208 - OBJ
      ?auto_180209 - OBJ
      ?auto_180210 - OBJ
      ?auto_180211 - OBJ
      ?auto_180207 - LOCATION
    )
    :vars
    (
      ?auto_180213 - LOCATION
      ?auto_180212 - CITY
      ?auto_180214 - TRUCK
      ?auto_180215 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180213 ?auto_180212 ) ( IN-CITY ?auto_180207 ?auto_180212 ) ( not ( = ?auto_180207 ?auto_180213 ) ) ( OBJ-AT ?auto_180208 ?auto_180207 ) ( not ( = ?auto_180208 ?auto_180211 ) ) ( OBJ-AT ?auto_180211 ?auto_180213 ) ( TRUCK-AT ?auto_180214 ?auto_180215 ) ( IN-CITY ?auto_180215 ?auto_180212 ) ( not ( = ?auto_180207 ?auto_180215 ) ) ( not ( = ?auto_180213 ?auto_180215 ) ) ( OBJ-AT ?auto_180209 ?auto_180207 ) ( OBJ-AT ?auto_180210 ?auto_180207 ) ( not ( = ?auto_180208 ?auto_180209 ) ) ( not ( = ?auto_180208 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180208 ?auto_180211 ?auto_180207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180226 - OBJ
      ?auto_180227 - OBJ
      ?auto_180228 - OBJ
      ?auto_180229 - OBJ
      ?auto_180225 - LOCATION
    )
    :vars
    (
      ?auto_180231 - LOCATION
      ?auto_180230 - CITY
      ?auto_180232 - TRUCK
      ?auto_180233 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180231 ?auto_180230 ) ( IN-CITY ?auto_180225 ?auto_180230 ) ( not ( = ?auto_180225 ?auto_180231 ) ) ( OBJ-AT ?auto_180229 ?auto_180225 ) ( not ( = ?auto_180229 ?auto_180228 ) ) ( OBJ-AT ?auto_180228 ?auto_180231 ) ( TRUCK-AT ?auto_180232 ?auto_180233 ) ( IN-CITY ?auto_180233 ?auto_180230 ) ( not ( = ?auto_180225 ?auto_180233 ) ) ( not ( = ?auto_180231 ?auto_180233 ) ) ( OBJ-AT ?auto_180226 ?auto_180225 ) ( OBJ-AT ?auto_180227 ?auto_180225 ) ( not ( = ?auto_180226 ?auto_180227 ) ) ( not ( = ?auto_180226 ?auto_180228 ) ) ( not ( = ?auto_180226 ?auto_180229 ) ) ( not ( = ?auto_180227 ?auto_180228 ) ) ( not ( = ?auto_180227 ?auto_180229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180229 ?auto_180228 ?auto_180225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180298 - OBJ
      ?auto_180299 - OBJ
      ?auto_180300 - OBJ
      ?auto_180301 - OBJ
      ?auto_180297 - LOCATION
    )
    :vars
    (
      ?auto_180303 - LOCATION
      ?auto_180302 - CITY
      ?auto_180304 - TRUCK
      ?auto_180305 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180303 ?auto_180302 ) ( IN-CITY ?auto_180297 ?auto_180302 ) ( not ( = ?auto_180297 ?auto_180303 ) ) ( OBJ-AT ?auto_180298 ?auto_180297 ) ( not ( = ?auto_180298 ?auto_180299 ) ) ( OBJ-AT ?auto_180299 ?auto_180303 ) ( TRUCK-AT ?auto_180304 ?auto_180305 ) ( IN-CITY ?auto_180305 ?auto_180302 ) ( not ( = ?auto_180297 ?auto_180305 ) ) ( not ( = ?auto_180303 ?auto_180305 ) ) ( OBJ-AT ?auto_180300 ?auto_180297 ) ( OBJ-AT ?auto_180301 ?auto_180297 ) ( not ( = ?auto_180298 ?auto_180300 ) ) ( not ( = ?auto_180298 ?auto_180301 ) ) ( not ( = ?auto_180299 ?auto_180300 ) ) ( not ( = ?auto_180299 ?auto_180301 ) ) ( not ( = ?auto_180300 ?auto_180301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180298 ?auto_180299 ?auto_180297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180557 - OBJ
      ?auto_180558 - OBJ
      ?auto_180559 - OBJ
      ?auto_180560 - OBJ
      ?auto_180556 - LOCATION
    )
    :vars
    (
      ?auto_180562 - LOCATION
      ?auto_180561 - CITY
      ?auto_180563 - TRUCK
      ?auto_180564 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180562 ?auto_180561 ) ( IN-CITY ?auto_180556 ?auto_180561 ) ( not ( = ?auto_180556 ?auto_180562 ) ) ( OBJ-AT ?auto_180559 ?auto_180556 ) ( not ( = ?auto_180559 ?auto_180557 ) ) ( OBJ-AT ?auto_180557 ?auto_180562 ) ( TRUCK-AT ?auto_180563 ?auto_180564 ) ( IN-CITY ?auto_180564 ?auto_180561 ) ( not ( = ?auto_180556 ?auto_180564 ) ) ( not ( = ?auto_180562 ?auto_180564 ) ) ( OBJ-AT ?auto_180558 ?auto_180556 ) ( OBJ-AT ?auto_180560 ?auto_180556 ) ( not ( = ?auto_180557 ?auto_180558 ) ) ( not ( = ?auto_180557 ?auto_180560 ) ) ( not ( = ?auto_180558 ?auto_180559 ) ) ( not ( = ?auto_180558 ?auto_180560 ) ) ( not ( = ?auto_180559 ?auto_180560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180559 ?auto_180557 ?auto_180556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180923 - OBJ
      ?auto_180924 - OBJ
      ?auto_180925 - OBJ
      ?auto_180922 - LOCATION
    )
    :vars
    (
      ?auto_180926 - LOCATION
      ?auto_180928 - CITY
      ?auto_180927 - TRUCK
      ?auto_180929 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180926 ?auto_180928 ) ( IN-CITY ?auto_180922 ?auto_180928 ) ( not ( = ?auto_180922 ?auto_180926 ) ) ( OBJ-AT ?auto_180925 ?auto_180922 ) ( not ( = ?auto_180925 ?auto_180923 ) ) ( OBJ-AT ?auto_180923 ?auto_180926 ) ( TRUCK-AT ?auto_180927 ?auto_180929 ) ( IN-CITY ?auto_180929 ?auto_180928 ) ( not ( = ?auto_180922 ?auto_180929 ) ) ( not ( = ?auto_180926 ?auto_180929 ) ) ( OBJ-AT ?auto_180924 ?auto_180922 ) ( not ( = ?auto_180923 ?auto_180924 ) ) ( not ( = ?auto_180924 ?auto_180925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180925 ?auto_180923 ?auto_180922 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181089 - OBJ
      ?auto_181090 - OBJ
      ?auto_181091 - OBJ
      ?auto_181092 - OBJ
      ?auto_181088 - LOCATION
    )
    :vars
    (
      ?auto_181093 - LOCATION
      ?auto_181095 - CITY
      ?auto_181094 - TRUCK
      ?auto_181096 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181093 ?auto_181095 ) ( IN-CITY ?auto_181088 ?auto_181095 ) ( not ( = ?auto_181088 ?auto_181093 ) ) ( OBJ-AT ?auto_181091 ?auto_181088 ) ( not ( = ?auto_181091 ?auto_181090 ) ) ( OBJ-AT ?auto_181090 ?auto_181093 ) ( TRUCK-AT ?auto_181094 ?auto_181096 ) ( IN-CITY ?auto_181096 ?auto_181095 ) ( not ( = ?auto_181088 ?auto_181096 ) ) ( not ( = ?auto_181093 ?auto_181096 ) ) ( OBJ-AT ?auto_181089 ?auto_181088 ) ( OBJ-AT ?auto_181092 ?auto_181088 ) ( not ( = ?auto_181089 ?auto_181090 ) ) ( not ( = ?auto_181089 ?auto_181091 ) ) ( not ( = ?auto_181089 ?auto_181092 ) ) ( not ( = ?auto_181090 ?auto_181092 ) ) ( not ( = ?auto_181091 ?auto_181092 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181091 ?auto_181090 ?auto_181088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187591 - OBJ
      ?auto_187592 - OBJ
      ?auto_187593 - OBJ
      ?auto_187590 - LOCATION
    )
    :vars
    (
      ?auto_187595 - TRUCK
      ?auto_187594 - LOCATION
      ?auto_187596 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_187592 ?auto_187595 ) ( TRUCK-AT ?auto_187595 ?auto_187594 ) ( IN-CITY ?auto_187594 ?auto_187596 ) ( IN-CITY ?auto_187590 ?auto_187596 ) ( not ( = ?auto_187590 ?auto_187594 ) ) ( OBJ-AT ?auto_187591 ?auto_187590 ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( OBJ-AT ?auto_187593 ?auto_187590 ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187591 ?auto_187592 ?auto_187590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187693 - OBJ
      ?auto_187694 - OBJ
      ?auto_187695 - OBJ
      ?auto_187692 - LOCATION
    )
    :vars
    (
      ?auto_187697 - TRUCK
      ?auto_187696 - LOCATION
      ?auto_187698 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_187693 ?auto_187697 ) ( TRUCK-AT ?auto_187697 ?auto_187696 ) ( IN-CITY ?auto_187696 ?auto_187698 ) ( IN-CITY ?auto_187692 ?auto_187698 ) ( not ( = ?auto_187692 ?auto_187696 ) ) ( OBJ-AT ?auto_187694 ?auto_187692 ) ( not ( = ?auto_187694 ?auto_187693 ) ) ( OBJ-AT ?auto_187695 ?auto_187692 ) ( not ( = ?auto_187693 ?auto_187695 ) ) ( not ( = ?auto_187694 ?auto_187695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187694 ?auto_187693 ?auto_187692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194294 - OBJ
      ?auto_194295 - OBJ
      ?auto_194296 - OBJ
      ?auto_194293 - LOCATION
    )
    :vars
    (
      ?auto_194298 - LOCATION
      ?auto_194299 - CITY
      ?auto_194297 - TRUCK
      ?auto_194300 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194298 ?auto_194299 ) ( IN-CITY ?auto_194293 ?auto_194299 ) ( not ( = ?auto_194293 ?auto_194298 ) ) ( OBJ-AT ?auto_194295 ?auto_194293 ) ( not ( = ?auto_194295 ?auto_194296 ) ) ( OBJ-AT ?auto_194296 ?auto_194298 ) ( TRUCK-AT ?auto_194297 ?auto_194300 ) ( IN-CITY ?auto_194300 ?auto_194299 ) ( not ( = ?auto_194293 ?auto_194300 ) ) ( not ( = ?auto_194298 ?auto_194300 ) ) ( OBJ-AT ?auto_194294 ?auto_194293 ) ( not ( = ?auto_194294 ?auto_194295 ) ) ( not ( = ?auto_194294 ?auto_194296 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194295 ?auto_194296 ?auto_194293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194314 - OBJ
      ?auto_194315 - OBJ
      ?auto_194316 - OBJ
      ?auto_194313 - LOCATION
    )
    :vars
    (
      ?auto_194318 - LOCATION
      ?auto_194319 - CITY
      ?auto_194317 - TRUCK
      ?auto_194320 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194318 ?auto_194319 ) ( IN-CITY ?auto_194313 ?auto_194319 ) ( not ( = ?auto_194313 ?auto_194318 ) ) ( OBJ-AT ?auto_194314 ?auto_194313 ) ( not ( = ?auto_194314 ?auto_194315 ) ) ( OBJ-AT ?auto_194315 ?auto_194318 ) ( TRUCK-AT ?auto_194317 ?auto_194320 ) ( IN-CITY ?auto_194320 ?auto_194319 ) ( not ( = ?auto_194313 ?auto_194320 ) ) ( not ( = ?auto_194318 ?auto_194320 ) ) ( OBJ-AT ?auto_194316 ?auto_194313 ) ( not ( = ?auto_194314 ?auto_194316 ) ) ( not ( = ?auto_194315 ?auto_194316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194314 ?auto_194315 ?auto_194313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194346 - OBJ
      ?auto_194347 - OBJ
      ?auto_194348 - OBJ
      ?auto_194345 - LOCATION
    )
    :vars
    (
      ?auto_194350 - LOCATION
      ?auto_194352 - CITY
      ?auto_194351 - OBJ
      ?auto_194349 - TRUCK
      ?auto_194353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194350 ?auto_194352 ) ( IN-CITY ?auto_194345 ?auto_194352 ) ( not ( = ?auto_194345 ?auto_194350 ) ) ( OBJ-AT ?auto_194351 ?auto_194345 ) ( not ( = ?auto_194351 ?auto_194348 ) ) ( OBJ-AT ?auto_194348 ?auto_194350 ) ( TRUCK-AT ?auto_194349 ?auto_194353 ) ( IN-CITY ?auto_194353 ?auto_194352 ) ( not ( = ?auto_194345 ?auto_194353 ) ) ( not ( = ?auto_194350 ?auto_194353 ) ) ( OBJ-AT ?auto_194346 ?auto_194345 ) ( OBJ-AT ?auto_194347 ?auto_194345 ) ( not ( = ?auto_194346 ?auto_194347 ) ) ( not ( = ?auto_194346 ?auto_194348 ) ) ( not ( = ?auto_194346 ?auto_194351 ) ) ( not ( = ?auto_194347 ?auto_194348 ) ) ( not ( = ?auto_194347 ?auto_194351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194351 ?auto_194348 ?auto_194345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194368 - OBJ
      ?auto_194369 - OBJ
      ?auto_194370 - OBJ
      ?auto_194367 - LOCATION
    )
    :vars
    (
      ?auto_194372 - LOCATION
      ?auto_194374 - CITY
      ?auto_194373 - OBJ
      ?auto_194371 - TRUCK
      ?auto_194375 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194372 ?auto_194374 ) ( IN-CITY ?auto_194367 ?auto_194374 ) ( not ( = ?auto_194367 ?auto_194372 ) ) ( OBJ-AT ?auto_194373 ?auto_194367 ) ( not ( = ?auto_194373 ?auto_194369 ) ) ( OBJ-AT ?auto_194369 ?auto_194372 ) ( TRUCK-AT ?auto_194371 ?auto_194375 ) ( IN-CITY ?auto_194375 ?auto_194374 ) ( not ( = ?auto_194367 ?auto_194375 ) ) ( not ( = ?auto_194372 ?auto_194375 ) ) ( OBJ-AT ?auto_194368 ?auto_194367 ) ( OBJ-AT ?auto_194370 ?auto_194367 ) ( not ( = ?auto_194368 ?auto_194369 ) ) ( not ( = ?auto_194368 ?auto_194370 ) ) ( not ( = ?auto_194368 ?auto_194373 ) ) ( not ( = ?auto_194369 ?auto_194370 ) ) ( not ( = ?auto_194370 ?auto_194373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194373 ?auto_194369 ?auto_194367 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194488 - OBJ
      ?auto_194489 - OBJ
      ?auto_194490 - OBJ
      ?auto_194487 - LOCATION
    )
    :vars
    (
      ?auto_194492 - LOCATION
      ?auto_194494 - CITY
      ?auto_194493 - OBJ
      ?auto_194491 - TRUCK
      ?auto_194495 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194492 ?auto_194494 ) ( IN-CITY ?auto_194487 ?auto_194494 ) ( not ( = ?auto_194487 ?auto_194492 ) ) ( OBJ-AT ?auto_194493 ?auto_194487 ) ( not ( = ?auto_194493 ?auto_194488 ) ) ( OBJ-AT ?auto_194488 ?auto_194492 ) ( TRUCK-AT ?auto_194491 ?auto_194495 ) ( IN-CITY ?auto_194495 ?auto_194494 ) ( not ( = ?auto_194487 ?auto_194495 ) ) ( not ( = ?auto_194492 ?auto_194495 ) ) ( OBJ-AT ?auto_194489 ?auto_194487 ) ( OBJ-AT ?auto_194490 ?auto_194487 ) ( not ( = ?auto_194488 ?auto_194489 ) ) ( not ( = ?auto_194488 ?auto_194490 ) ) ( not ( = ?auto_194489 ?auto_194490 ) ) ( not ( = ?auto_194489 ?auto_194493 ) ) ( not ( = ?auto_194490 ?auto_194493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194493 ?auto_194488 ?auto_194487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194585 - OBJ
      ?auto_194586 - OBJ
      ?auto_194587 - OBJ
      ?auto_194588 - OBJ
      ?auto_194584 - LOCATION
    )
    :vars
    (
      ?auto_194590 - LOCATION
      ?auto_194591 - CITY
      ?auto_194589 - TRUCK
      ?auto_194592 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194590 ?auto_194591 ) ( IN-CITY ?auto_194584 ?auto_194591 ) ( not ( = ?auto_194584 ?auto_194590 ) ) ( OBJ-AT ?auto_194587 ?auto_194584 ) ( not ( = ?auto_194587 ?auto_194588 ) ) ( OBJ-AT ?auto_194588 ?auto_194590 ) ( TRUCK-AT ?auto_194589 ?auto_194592 ) ( IN-CITY ?auto_194592 ?auto_194591 ) ( not ( = ?auto_194584 ?auto_194592 ) ) ( not ( = ?auto_194590 ?auto_194592 ) ) ( OBJ-AT ?auto_194585 ?auto_194584 ) ( OBJ-AT ?auto_194586 ?auto_194584 ) ( not ( = ?auto_194585 ?auto_194586 ) ) ( not ( = ?auto_194585 ?auto_194587 ) ) ( not ( = ?auto_194585 ?auto_194588 ) ) ( not ( = ?auto_194586 ?auto_194587 ) ) ( not ( = ?auto_194586 ?auto_194588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194587 ?auto_194588 ?auto_194584 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194621 - OBJ
      ?auto_194622 - OBJ
      ?auto_194623 - OBJ
      ?auto_194624 - OBJ
      ?auto_194620 - LOCATION
    )
    :vars
    (
      ?auto_194626 - LOCATION
      ?auto_194627 - CITY
      ?auto_194625 - TRUCK
      ?auto_194628 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194626 ?auto_194627 ) ( IN-CITY ?auto_194620 ?auto_194627 ) ( not ( = ?auto_194620 ?auto_194626 ) ) ( OBJ-AT ?auto_194622 ?auto_194620 ) ( not ( = ?auto_194622 ?auto_194623 ) ) ( OBJ-AT ?auto_194623 ?auto_194626 ) ( TRUCK-AT ?auto_194625 ?auto_194628 ) ( IN-CITY ?auto_194628 ?auto_194627 ) ( not ( = ?auto_194620 ?auto_194628 ) ) ( not ( = ?auto_194626 ?auto_194628 ) ) ( OBJ-AT ?auto_194621 ?auto_194620 ) ( OBJ-AT ?auto_194624 ?auto_194620 ) ( not ( = ?auto_194621 ?auto_194622 ) ) ( not ( = ?auto_194621 ?auto_194623 ) ) ( not ( = ?auto_194621 ?auto_194624 ) ) ( not ( = ?auto_194622 ?auto_194624 ) ) ( not ( = ?auto_194623 ?auto_194624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194622 ?auto_194623 ?auto_194620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194684 - OBJ
      ?auto_194685 - OBJ
      ?auto_194686 - OBJ
      ?auto_194687 - OBJ
      ?auto_194683 - LOCATION
    )
    :vars
    (
      ?auto_194689 - LOCATION
      ?auto_194690 - CITY
      ?auto_194688 - TRUCK
      ?auto_194691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194689 ?auto_194690 ) ( IN-CITY ?auto_194683 ?auto_194690 ) ( not ( = ?auto_194683 ?auto_194689 ) ) ( OBJ-AT ?auto_194684 ?auto_194683 ) ( not ( = ?auto_194684 ?auto_194686 ) ) ( OBJ-AT ?auto_194686 ?auto_194689 ) ( TRUCK-AT ?auto_194688 ?auto_194691 ) ( IN-CITY ?auto_194691 ?auto_194690 ) ( not ( = ?auto_194683 ?auto_194691 ) ) ( not ( = ?auto_194689 ?auto_194691 ) ) ( OBJ-AT ?auto_194685 ?auto_194683 ) ( OBJ-AT ?auto_194687 ?auto_194683 ) ( not ( = ?auto_194684 ?auto_194685 ) ) ( not ( = ?auto_194684 ?auto_194687 ) ) ( not ( = ?auto_194685 ?auto_194686 ) ) ( not ( = ?auto_194685 ?auto_194687 ) ) ( not ( = ?auto_194686 ?auto_194687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194684 ?auto_194686 ?auto_194683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194927 - OBJ
      ?auto_194928 - OBJ
      ?auto_194929 - OBJ
      ?auto_194930 - OBJ
      ?auto_194926 - LOCATION
    )
    :vars
    (
      ?auto_194932 - LOCATION
      ?auto_194933 - CITY
      ?auto_194931 - TRUCK
      ?auto_194934 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194932 ?auto_194933 ) ( IN-CITY ?auto_194926 ?auto_194933 ) ( not ( = ?auto_194926 ?auto_194932 ) ) ( OBJ-AT ?auto_194928 ?auto_194926 ) ( not ( = ?auto_194928 ?auto_194930 ) ) ( OBJ-AT ?auto_194930 ?auto_194932 ) ( TRUCK-AT ?auto_194931 ?auto_194934 ) ( IN-CITY ?auto_194934 ?auto_194933 ) ( not ( = ?auto_194926 ?auto_194934 ) ) ( not ( = ?auto_194932 ?auto_194934 ) ) ( OBJ-AT ?auto_194927 ?auto_194926 ) ( OBJ-AT ?auto_194929 ?auto_194926 ) ( not ( = ?auto_194927 ?auto_194928 ) ) ( not ( = ?auto_194927 ?auto_194929 ) ) ( not ( = ?auto_194927 ?auto_194930 ) ) ( not ( = ?auto_194928 ?auto_194929 ) ) ( not ( = ?auto_194929 ?auto_194930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194928 ?auto_194930 ?auto_194926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194990 - OBJ
      ?auto_194991 - OBJ
      ?auto_194992 - OBJ
      ?auto_194993 - OBJ
      ?auto_194989 - LOCATION
    )
    :vars
    (
      ?auto_194995 - LOCATION
      ?auto_194997 - CITY
      ?auto_194996 - OBJ
      ?auto_194994 - TRUCK
      ?auto_194998 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194995 ?auto_194997 ) ( IN-CITY ?auto_194989 ?auto_194997 ) ( not ( = ?auto_194989 ?auto_194995 ) ) ( OBJ-AT ?auto_194996 ?auto_194989 ) ( not ( = ?auto_194996 ?auto_194993 ) ) ( OBJ-AT ?auto_194993 ?auto_194995 ) ( TRUCK-AT ?auto_194994 ?auto_194998 ) ( IN-CITY ?auto_194998 ?auto_194997 ) ( not ( = ?auto_194989 ?auto_194998 ) ) ( not ( = ?auto_194995 ?auto_194998 ) ) ( OBJ-AT ?auto_194990 ?auto_194989 ) ( OBJ-AT ?auto_194991 ?auto_194989 ) ( OBJ-AT ?auto_194992 ?auto_194989 ) ( not ( = ?auto_194990 ?auto_194991 ) ) ( not ( = ?auto_194990 ?auto_194992 ) ) ( not ( = ?auto_194990 ?auto_194993 ) ) ( not ( = ?auto_194990 ?auto_194996 ) ) ( not ( = ?auto_194991 ?auto_194992 ) ) ( not ( = ?auto_194991 ?auto_194993 ) ) ( not ( = ?auto_194991 ?auto_194996 ) ) ( not ( = ?auto_194992 ?auto_194993 ) ) ( not ( = ?auto_194992 ?auto_194996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194996 ?auto_194993 ?auto_194989 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195019 - OBJ
      ?auto_195020 - OBJ
      ?auto_195021 - OBJ
      ?auto_195022 - OBJ
      ?auto_195018 - LOCATION
    )
    :vars
    (
      ?auto_195024 - LOCATION
      ?auto_195026 - CITY
      ?auto_195025 - OBJ
      ?auto_195023 - TRUCK
      ?auto_195027 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195024 ?auto_195026 ) ( IN-CITY ?auto_195018 ?auto_195026 ) ( not ( = ?auto_195018 ?auto_195024 ) ) ( OBJ-AT ?auto_195025 ?auto_195018 ) ( not ( = ?auto_195025 ?auto_195021 ) ) ( OBJ-AT ?auto_195021 ?auto_195024 ) ( TRUCK-AT ?auto_195023 ?auto_195027 ) ( IN-CITY ?auto_195027 ?auto_195026 ) ( not ( = ?auto_195018 ?auto_195027 ) ) ( not ( = ?auto_195024 ?auto_195027 ) ) ( OBJ-AT ?auto_195019 ?auto_195018 ) ( OBJ-AT ?auto_195020 ?auto_195018 ) ( OBJ-AT ?auto_195022 ?auto_195018 ) ( not ( = ?auto_195019 ?auto_195020 ) ) ( not ( = ?auto_195019 ?auto_195021 ) ) ( not ( = ?auto_195019 ?auto_195022 ) ) ( not ( = ?auto_195019 ?auto_195025 ) ) ( not ( = ?auto_195020 ?auto_195021 ) ) ( not ( = ?auto_195020 ?auto_195022 ) ) ( not ( = ?auto_195020 ?auto_195025 ) ) ( not ( = ?auto_195021 ?auto_195022 ) ) ( not ( = ?auto_195022 ?auto_195025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195025 ?auto_195021 ?auto_195018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195153 - OBJ
      ?auto_195154 - OBJ
      ?auto_195155 - OBJ
      ?auto_195156 - OBJ
      ?auto_195152 - LOCATION
    )
    :vars
    (
      ?auto_195158 - LOCATION
      ?auto_195159 - CITY
      ?auto_195157 - TRUCK
      ?auto_195160 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195158 ?auto_195159 ) ( IN-CITY ?auto_195152 ?auto_195159 ) ( not ( = ?auto_195152 ?auto_195158 ) ) ( OBJ-AT ?auto_195156 ?auto_195152 ) ( not ( = ?auto_195156 ?auto_195154 ) ) ( OBJ-AT ?auto_195154 ?auto_195158 ) ( TRUCK-AT ?auto_195157 ?auto_195160 ) ( IN-CITY ?auto_195160 ?auto_195159 ) ( not ( = ?auto_195152 ?auto_195160 ) ) ( not ( = ?auto_195158 ?auto_195160 ) ) ( OBJ-AT ?auto_195153 ?auto_195152 ) ( OBJ-AT ?auto_195155 ?auto_195152 ) ( not ( = ?auto_195153 ?auto_195154 ) ) ( not ( = ?auto_195153 ?auto_195155 ) ) ( not ( = ?auto_195153 ?auto_195156 ) ) ( not ( = ?auto_195154 ?auto_195155 ) ) ( not ( = ?auto_195155 ?auto_195156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195156 ?auto_195154 ?auto_195152 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195162 - OBJ
      ?auto_195163 - OBJ
      ?auto_195164 - OBJ
      ?auto_195165 - OBJ
      ?auto_195161 - LOCATION
    )
    :vars
    (
      ?auto_195167 - LOCATION
      ?auto_195169 - CITY
      ?auto_195168 - OBJ
      ?auto_195166 - TRUCK
      ?auto_195170 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195167 ?auto_195169 ) ( IN-CITY ?auto_195161 ?auto_195169 ) ( not ( = ?auto_195161 ?auto_195167 ) ) ( OBJ-AT ?auto_195168 ?auto_195161 ) ( not ( = ?auto_195168 ?auto_195163 ) ) ( OBJ-AT ?auto_195163 ?auto_195167 ) ( TRUCK-AT ?auto_195166 ?auto_195170 ) ( IN-CITY ?auto_195170 ?auto_195169 ) ( not ( = ?auto_195161 ?auto_195170 ) ) ( not ( = ?auto_195167 ?auto_195170 ) ) ( OBJ-AT ?auto_195162 ?auto_195161 ) ( OBJ-AT ?auto_195164 ?auto_195161 ) ( OBJ-AT ?auto_195165 ?auto_195161 ) ( not ( = ?auto_195162 ?auto_195163 ) ) ( not ( = ?auto_195162 ?auto_195164 ) ) ( not ( = ?auto_195162 ?auto_195165 ) ) ( not ( = ?auto_195162 ?auto_195168 ) ) ( not ( = ?auto_195163 ?auto_195164 ) ) ( not ( = ?auto_195163 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195168 ) ) ( not ( = ?auto_195165 ?auto_195168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195168 ?auto_195163 ?auto_195161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195658 - OBJ
      ?auto_195659 - OBJ
      ?auto_195660 - OBJ
      ?auto_195661 - OBJ
      ?auto_195657 - LOCATION
    )
    :vars
    (
      ?auto_195663 - LOCATION
      ?auto_195664 - CITY
      ?auto_195662 - TRUCK
      ?auto_195665 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195663 ?auto_195664 ) ( IN-CITY ?auto_195657 ?auto_195664 ) ( not ( = ?auto_195657 ?auto_195663 ) ) ( OBJ-AT ?auto_195659 ?auto_195657 ) ( not ( = ?auto_195659 ?auto_195658 ) ) ( OBJ-AT ?auto_195658 ?auto_195663 ) ( TRUCK-AT ?auto_195662 ?auto_195665 ) ( IN-CITY ?auto_195665 ?auto_195664 ) ( not ( = ?auto_195657 ?auto_195665 ) ) ( not ( = ?auto_195663 ?auto_195665 ) ) ( OBJ-AT ?auto_195660 ?auto_195657 ) ( OBJ-AT ?auto_195661 ?auto_195657 ) ( not ( = ?auto_195658 ?auto_195660 ) ) ( not ( = ?auto_195658 ?auto_195661 ) ) ( not ( = ?auto_195659 ?auto_195660 ) ) ( not ( = ?auto_195659 ?auto_195661 ) ) ( not ( = ?auto_195660 ?auto_195661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195659 ?auto_195658 ?auto_195657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195802 - OBJ
      ?auto_195803 - OBJ
      ?auto_195804 - OBJ
      ?auto_195805 - OBJ
      ?auto_195801 - LOCATION
    )
    :vars
    (
      ?auto_195807 - LOCATION
      ?auto_195808 - CITY
      ?auto_195806 - TRUCK
      ?auto_195809 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195807 ?auto_195808 ) ( IN-CITY ?auto_195801 ?auto_195808 ) ( not ( = ?auto_195801 ?auto_195807 ) ) ( OBJ-AT ?auto_195805 ?auto_195801 ) ( not ( = ?auto_195805 ?auto_195802 ) ) ( OBJ-AT ?auto_195802 ?auto_195807 ) ( TRUCK-AT ?auto_195806 ?auto_195809 ) ( IN-CITY ?auto_195809 ?auto_195808 ) ( not ( = ?auto_195801 ?auto_195809 ) ) ( not ( = ?auto_195807 ?auto_195809 ) ) ( OBJ-AT ?auto_195803 ?auto_195801 ) ( OBJ-AT ?auto_195804 ?auto_195801 ) ( not ( = ?auto_195802 ?auto_195803 ) ) ( not ( = ?auto_195802 ?auto_195804 ) ) ( not ( = ?auto_195803 ?auto_195804 ) ) ( not ( = ?auto_195803 ?auto_195805 ) ) ( not ( = ?auto_195804 ?auto_195805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195805 ?auto_195802 ?auto_195801 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195811 - OBJ
      ?auto_195812 - OBJ
      ?auto_195813 - OBJ
      ?auto_195814 - OBJ
      ?auto_195810 - LOCATION
    )
    :vars
    (
      ?auto_195816 - LOCATION
      ?auto_195818 - CITY
      ?auto_195817 - OBJ
      ?auto_195815 - TRUCK
      ?auto_195819 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195816 ?auto_195818 ) ( IN-CITY ?auto_195810 ?auto_195818 ) ( not ( = ?auto_195810 ?auto_195816 ) ) ( OBJ-AT ?auto_195817 ?auto_195810 ) ( not ( = ?auto_195817 ?auto_195811 ) ) ( OBJ-AT ?auto_195811 ?auto_195816 ) ( TRUCK-AT ?auto_195815 ?auto_195819 ) ( IN-CITY ?auto_195819 ?auto_195818 ) ( not ( = ?auto_195810 ?auto_195819 ) ) ( not ( = ?auto_195816 ?auto_195819 ) ) ( OBJ-AT ?auto_195812 ?auto_195810 ) ( OBJ-AT ?auto_195813 ?auto_195810 ) ( OBJ-AT ?auto_195814 ?auto_195810 ) ( not ( = ?auto_195811 ?auto_195812 ) ) ( not ( = ?auto_195811 ?auto_195813 ) ) ( not ( = ?auto_195811 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195813 ) ) ( not ( = ?auto_195812 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195817 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( not ( = ?auto_195813 ?auto_195817 ) ) ( not ( = ?auto_195814 ?auto_195817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195817 ?auto_195811 ?auto_195810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_203726 - OBJ
      ?auto_203727 - OBJ
      ?auto_203728 - OBJ
      ?auto_203725 - LOCATION
    )
    :vars
    (
      ?auto_203730 - TRUCK
      ?auto_203731 - LOCATION
      ?auto_203729 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_203730 ?auto_203731 ) ( IN-CITY ?auto_203731 ?auto_203729 ) ( IN-CITY ?auto_203725 ?auto_203729 ) ( not ( = ?auto_203725 ?auto_203731 ) ) ( OBJ-AT ?auto_203727 ?auto_203725 ) ( not ( = ?auto_203727 ?auto_203726 ) ) ( OBJ-AT ?auto_203726 ?auto_203731 ) ( OBJ-AT ?auto_203728 ?auto_203725 ) ( not ( = ?auto_203726 ?auto_203728 ) ) ( not ( = ?auto_203727 ?auto_203728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_203727 ?auto_203726 ?auto_203725 ) )
  )

)

