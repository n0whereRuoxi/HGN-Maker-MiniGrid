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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_232855 - OBJ
      ?auto_232854 - LOCATION
    )
    :vars
    (
      ?auto_232857 - LOCATION
      ?auto_232858 - CITY
      ?auto_232856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232857 ?auto_232858 ) ( IN-CITY ?auto_232854 ?auto_232858 ) ( not ( = ?auto_232854 ?auto_232857 ) ) ( OBJ-AT ?auto_232855 ?auto_232857 ) ( TRUCK-AT ?auto_232856 ?auto_232854 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_232856 ?auto_232854 ?auto_232857 ?auto_232858 )
      ( !LOAD-TRUCK ?auto_232855 ?auto_232856 ?auto_232857 )
      ( !DRIVE-TRUCK ?auto_232856 ?auto_232857 ?auto_232854 ?auto_232858 )
      ( !UNLOAD-TRUCK ?auto_232855 ?auto_232856 ?auto_232854 )
      ( DELIVER-1PKG-VERIFY ?auto_232855 ?auto_232854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_232876 - OBJ
      ?auto_232877 - OBJ
      ?auto_232875 - LOCATION
    )
    :vars
    (
      ?auto_232880 - LOCATION
      ?auto_232879 - CITY
      ?auto_232881 - LOCATION
      ?auto_232878 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232880 ?auto_232879 ) ( IN-CITY ?auto_232875 ?auto_232879 ) ( not ( = ?auto_232875 ?auto_232880 ) ) ( OBJ-AT ?auto_232877 ?auto_232880 ) ( IN-CITY ?auto_232881 ?auto_232879 ) ( not ( = ?auto_232875 ?auto_232881 ) ) ( OBJ-AT ?auto_232876 ?auto_232881 ) ( TRUCK-AT ?auto_232878 ?auto_232875 ) ( not ( = ?auto_232876 ?auto_232877 ) ) ( not ( = ?auto_232880 ?auto_232881 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_232876 ?auto_232875 )
      ( DELIVER-1PKG ?auto_232877 ?auto_232875 )
      ( DELIVER-2PKG-VERIFY ?auto_232876 ?auto_232877 ?auto_232875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_232987 - OBJ
      ?auto_232988 - OBJ
      ?auto_232989 - OBJ
      ?auto_232986 - LOCATION
    )
    :vars
    (
      ?auto_232991 - LOCATION
      ?auto_232992 - CITY
      ?auto_232993 - LOCATION
      ?auto_232994 - LOCATION
      ?auto_232990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232991 ?auto_232992 ) ( IN-CITY ?auto_232986 ?auto_232992 ) ( not ( = ?auto_232986 ?auto_232991 ) ) ( OBJ-AT ?auto_232989 ?auto_232991 ) ( IN-CITY ?auto_232993 ?auto_232992 ) ( not ( = ?auto_232986 ?auto_232993 ) ) ( OBJ-AT ?auto_232988 ?auto_232993 ) ( IN-CITY ?auto_232994 ?auto_232992 ) ( not ( = ?auto_232986 ?auto_232994 ) ) ( OBJ-AT ?auto_232987 ?auto_232994 ) ( TRUCK-AT ?auto_232990 ?auto_232986 ) ( not ( = ?auto_232987 ?auto_232988 ) ) ( not ( = ?auto_232993 ?auto_232994 ) ) ( not ( = ?auto_232987 ?auto_232989 ) ) ( not ( = ?auto_232988 ?auto_232989 ) ) ( not ( = ?auto_232991 ?auto_232993 ) ) ( not ( = ?auto_232991 ?auto_232994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_232987 ?auto_232988 ?auto_232986 )
      ( DELIVER-1PKG ?auto_232989 ?auto_232986 )
      ( DELIVER-3PKG-VERIFY ?auto_232987 ?auto_232988 ?auto_232989 ?auto_232986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234130 - OBJ
      ?auto_234131 - OBJ
      ?auto_234132 - OBJ
      ?auto_234133 - OBJ
      ?auto_234129 - LOCATION
    )
    :vars
    (
      ?auto_234135 - LOCATION
      ?auto_234134 - CITY
      ?auto_234138 - LOCATION
      ?auto_234139 - LOCATION
      ?auto_234137 - LOCATION
      ?auto_234136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234135 ?auto_234134 ) ( IN-CITY ?auto_234129 ?auto_234134 ) ( not ( = ?auto_234129 ?auto_234135 ) ) ( OBJ-AT ?auto_234133 ?auto_234135 ) ( IN-CITY ?auto_234138 ?auto_234134 ) ( not ( = ?auto_234129 ?auto_234138 ) ) ( OBJ-AT ?auto_234132 ?auto_234138 ) ( IN-CITY ?auto_234139 ?auto_234134 ) ( not ( = ?auto_234129 ?auto_234139 ) ) ( OBJ-AT ?auto_234131 ?auto_234139 ) ( IN-CITY ?auto_234137 ?auto_234134 ) ( not ( = ?auto_234129 ?auto_234137 ) ) ( OBJ-AT ?auto_234130 ?auto_234137 ) ( TRUCK-AT ?auto_234136 ?auto_234129 ) ( not ( = ?auto_234130 ?auto_234131 ) ) ( not ( = ?auto_234139 ?auto_234137 ) ) ( not ( = ?auto_234130 ?auto_234132 ) ) ( not ( = ?auto_234131 ?auto_234132 ) ) ( not ( = ?auto_234138 ?auto_234139 ) ) ( not ( = ?auto_234138 ?auto_234137 ) ) ( not ( = ?auto_234130 ?auto_234133 ) ) ( not ( = ?auto_234131 ?auto_234133 ) ) ( not ( = ?auto_234132 ?auto_234133 ) ) ( not ( = ?auto_234135 ?auto_234138 ) ) ( not ( = ?auto_234135 ?auto_234139 ) ) ( not ( = ?auto_234135 ?auto_234137 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_234130 ?auto_234131 ?auto_234132 ?auto_234129 )
      ( DELIVER-1PKG ?auto_234133 ?auto_234129 )
      ( DELIVER-4PKG-VERIFY ?auto_234130 ?auto_234131 ?auto_234132 ?auto_234133 ?auto_234129 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_249740 - OBJ
      ?auto_249741 - OBJ
      ?auto_249742 - OBJ
      ?auto_249743 - OBJ
      ?auto_249744 - OBJ
      ?auto_249739 - LOCATION
    )
    :vars
    (
      ?auto_249746 - LOCATION
      ?auto_249747 - CITY
      ?auto_249750 - LOCATION
      ?auto_249749 - LOCATION
      ?auto_249748 - LOCATION
      ?auto_249745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_249746 ?auto_249747 ) ( IN-CITY ?auto_249739 ?auto_249747 ) ( not ( = ?auto_249739 ?auto_249746 ) ) ( OBJ-AT ?auto_249744 ?auto_249746 ) ( IN-CITY ?auto_249750 ?auto_249747 ) ( not ( = ?auto_249739 ?auto_249750 ) ) ( OBJ-AT ?auto_249743 ?auto_249750 ) ( IN-CITY ?auto_249749 ?auto_249747 ) ( not ( = ?auto_249739 ?auto_249749 ) ) ( OBJ-AT ?auto_249742 ?auto_249749 ) ( OBJ-AT ?auto_249741 ?auto_249746 ) ( IN-CITY ?auto_249748 ?auto_249747 ) ( not ( = ?auto_249739 ?auto_249748 ) ) ( OBJ-AT ?auto_249740 ?auto_249748 ) ( TRUCK-AT ?auto_249745 ?auto_249739 ) ( not ( = ?auto_249740 ?auto_249741 ) ) ( not ( = ?auto_249746 ?auto_249748 ) ) ( not ( = ?auto_249740 ?auto_249742 ) ) ( not ( = ?auto_249741 ?auto_249742 ) ) ( not ( = ?auto_249749 ?auto_249746 ) ) ( not ( = ?auto_249749 ?auto_249748 ) ) ( not ( = ?auto_249740 ?auto_249743 ) ) ( not ( = ?auto_249741 ?auto_249743 ) ) ( not ( = ?auto_249742 ?auto_249743 ) ) ( not ( = ?auto_249750 ?auto_249749 ) ) ( not ( = ?auto_249750 ?auto_249746 ) ) ( not ( = ?auto_249750 ?auto_249748 ) ) ( not ( = ?auto_249740 ?auto_249744 ) ) ( not ( = ?auto_249741 ?auto_249744 ) ) ( not ( = ?auto_249742 ?auto_249744 ) ) ( not ( = ?auto_249743 ?auto_249744 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_249740 ?auto_249741 ?auto_249742 ?auto_249743 ?auto_249739 )
      ( DELIVER-1PKG ?auto_249744 ?auto_249739 )
      ( DELIVER-5PKG-VERIFY ?auto_249740 ?auto_249741 ?auto_249742 ?auto_249743 ?auto_249744 ?auto_249739 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_249791 - OBJ
      ?auto_249792 - OBJ
      ?auto_249793 - OBJ
      ?auto_249794 - OBJ
      ?auto_249795 - OBJ
      ?auto_249790 - LOCATION
    )
    :vars
    (
      ?auto_249797 - LOCATION
      ?auto_249796 - CITY
      ?auto_249800 - LOCATION
      ?auto_249799 - LOCATION
      ?auto_249798 - LOCATION
      ?auto_249801 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_249797 ?auto_249796 ) ( IN-CITY ?auto_249790 ?auto_249796 ) ( not ( = ?auto_249790 ?auto_249797 ) ) ( OBJ-AT ?auto_249794 ?auto_249797 ) ( IN-CITY ?auto_249800 ?auto_249796 ) ( not ( = ?auto_249790 ?auto_249800 ) ) ( OBJ-AT ?auto_249795 ?auto_249800 ) ( IN-CITY ?auto_249799 ?auto_249796 ) ( not ( = ?auto_249790 ?auto_249799 ) ) ( OBJ-AT ?auto_249793 ?auto_249799 ) ( OBJ-AT ?auto_249792 ?auto_249797 ) ( IN-CITY ?auto_249798 ?auto_249796 ) ( not ( = ?auto_249790 ?auto_249798 ) ) ( OBJ-AT ?auto_249791 ?auto_249798 ) ( TRUCK-AT ?auto_249801 ?auto_249790 ) ( not ( = ?auto_249791 ?auto_249792 ) ) ( not ( = ?auto_249797 ?auto_249798 ) ) ( not ( = ?auto_249791 ?auto_249793 ) ) ( not ( = ?auto_249792 ?auto_249793 ) ) ( not ( = ?auto_249799 ?auto_249797 ) ) ( not ( = ?auto_249799 ?auto_249798 ) ) ( not ( = ?auto_249791 ?auto_249795 ) ) ( not ( = ?auto_249792 ?auto_249795 ) ) ( not ( = ?auto_249793 ?auto_249795 ) ) ( not ( = ?auto_249800 ?auto_249799 ) ) ( not ( = ?auto_249800 ?auto_249797 ) ) ( not ( = ?auto_249800 ?auto_249798 ) ) ( not ( = ?auto_249791 ?auto_249794 ) ) ( not ( = ?auto_249792 ?auto_249794 ) ) ( not ( = ?auto_249793 ?auto_249794 ) ) ( not ( = ?auto_249795 ?auto_249794 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_249791 ?auto_249792 ?auto_249793 ?auto_249795 ?auto_249794 ?auto_249790 )
      ( DELIVER-5PKG-VERIFY ?auto_249791 ?auto_249792 ?auto_249793 ?auto_249794 ?auto_249795 ?auto_249790 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250094 - OBJ
      ?auto_250095 - OBJ
      ?auto_250096 - OBJ
      ?auto_250097 - OBJ
      ?auto_250098 - OBJ
      ?auto_250093 - LOCATION
    )
    :vars
    (
      ?auto_250099 - LOCATION
      ?auto_250101 - CITY
      ?auto_250104 - LOCATION
      ?auto_250102 - LOCATION
      ?auto_250103 - LOCATION
      ?auto_250100 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250099 ?auto_250101 ) ( IN-CITY ?auto_250093 ?auto_250101 ) ( not ( = ?auto_250093 ?auto_250099 ) ) ( OBJ-AT ?auto_250096 ?auto_250099 ) ( IN-CITY ?auto_250104 ?auto_250101 ) ( not ( = ?auto_250093 ?auto_250104 ) ) ( OBJ-AT ?auto_250098 ?auto_250104 ) ( IN-CITY ?auto_250102 ?auto_250101 ) ( not ( = ?auto_250093 ?auto_250102 ) ) ( OBJ-AT ?auto_250097 ?auto_250102 ) ( OBJ-AT ?auto_250095 ?auto_250099 ) ( IN-CITY ?auto_250103 ?auto_250101 ) ( not ( = ?auto_250093 ?auto_250103 ) ) ( OBJ-AT ?auto_250094 ?auto_250103 ) ( TRUCK-AT ?auto_250100 ?auto_250093 ) ( not ( = ?auto_250094 ?auto_250095 ) ) ( not ( = ?auto_250099 ?auto_250103 ) ) ( not ( = ?auto_250094 ?auto_250097 ) ) ( not ( = ?auto_250095 ?auto_250097 ) ) ( not ( = ?auto_250102 ?auto_250099 ) ) ( not ( = ?auto_250102 ?auto_250103 ) ) ( not ( = ?auto_250094 ?auto_250098 ) ) ( not ( = ?auto_250095 ?auto_250098 ) ) ( not ( = ?auto_250097 ?auto_250098 ) ) ( not ( = ?auto_250104 ?auto_250102 ) ) ( not ( = ?auto_250104 ?auto_250099 ) ) ( not ( = ?auto_250104 ?auto_250103 ) ) ( not ( = ?auto_250094 ?auto_250096 ) ) ( not ( = ?auto_250095 ?auto_250096 ) ) ( not ( = ?auto_250097 ?auto_250096 ) ) ( not ( = ?auto_250098 ?auto_250096 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250094 ?auto_250095 ?auto_250097 ?auto_250096 ?auto_250098 ?auto_250093 )
      ( DELIVER-5PKG-VERIFY ?auto_250094 ?auto_250095 ?auto_250096 ?auto_250097 ?auto_250098 ?auto_250093 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250406 - OBJ
      ?auto_250407 - OBJ
      ?auto_250408 - OBJ
      ?auto_250409 - OBJ
      ?auto_250410 - OBJ
      ?auto_250405 - LOCATION
    )
    :vars
    (
      ?auto_250411 - LOCATION
      ?auto_250413 - CITY
      ?auto_250416 - LOCATION
      ?auto_250414 - LOCATION
      ?auto_250415 - LOCATION
      ?auto_250412 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250411 ?auto_250413 ) ( IN-CITY ?auto_250405 ?auto_250413 ) ( not ( = ?auto_250405 ?auto_250411 ) ) ( OBJ-AT ?auto_250410 ?auto_250411 ) ( IN-CITY ?auto_250416 ?auto_250413 ) ( not ( = ?auto_250405 ?auto_250416 ) ) ( OBJ-AT ?auto_250409 ?auto_250416 ) ( IN-CITY ?auto_250414 ?auto_250413 ) ( not ( = ?auto_250405 ?auto_250414 ) ) ( OBJ-AT ?auto_250407 ?auto_250414 ) ( OBJ-AT ?auto_250408 ?auto_250411 ) ( IN-CITY ?auto_250415 ?auto_250413 ) ( not ( = ?auto_250405 ?auto_250415 ) ) ( OBJ-AT ?auto_250406 ?auto_250415 ) ( TRUCK-AT ?auto_250412 ?auto_250405 ) ( not ( = ?auto_250406 ?auto_250408 ) ) ( not ( = ?auto_250411 ?auto_250415 ) ) ( not ( = ?auto_250406 ?auto_250407 ) ) ( not ( = ?auto_250408 ?auto_250407 ) ) ( not ( = ?auto_250414 ?auto_250411 ) ) ( not ( = ?auto_250414 ?auto_250415 ) ) ( not ( = ?auto_250406 ?auto_250409 ) ) ( not ( = ?auto_250408 ?auto_250409 ) ) ( not ( = ?auto_250407 ?auto_250409 ) ) ( not ( = ?auto_250416 ?auto_250414 ) ) ( not ( = ?auto_250416 ?auto_250411 ) ) ( not ( = ?auto_250416 ?auto_250415 ) ) ( not ( = ?auto_250406 ?auto_250410 ) ) ( not ( = ?auto_250408 ?auto_250410 ) ) ( not ( = ?auto_250407 ?auto_250410 ) ) ( not ( = ?auto_250409 ?auto_250410 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250406 ?auto_250408 ?auto_250407 ?auto_250410 ?auto_250409 ?auto_250405 )
      ( DELIVER-5PKG-VERIFY ?auto_250406 ?auto_250407 ?auto_250408 ?auto_250409 ?auto_250410 ?auto_250405 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250457 - OBJ
      ?auto_250458 - OBJ
      ?auto_250459 - OBJ
      ?auto_250460 - OBJ
      ?auto_250461 - OBJ
      ?auto_250456 - LOCATION
    )
    :vars
    (
      ?auto_250462 - LOCATION
      ?auto_250464 - CITY
      ?auto_250467 - LOCATION
      ?auto_250465 - LOCATION
      ?auto_250466 - LOCATION
      ?auto_250463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250462 ?auto_250464 ) ( IN-CITY ?auto_250456 ?auto_250464 ) ( not ( = ?auto_250456 ?auto_250462 ) ) ( OBJ-AT ?auto_250460 ?auto_250462 ) ( IN-CITY ?auto_250467 ?auto_250464 ) ( not ( = ?auto_250456 ?auto_250467 ) ) ( OBJ-AT ?auto_250461 ?auto_250467 ) ( IN-CITY ?auto_250465 ?auto_250464 ) ( not ( = ?auto_250456 ?auto_250465 ) ) ( OBJ-AT ?auto_250458 ?auto_250465 ) ( OBJ-AT ?auto_250459 ?auto_250462 ) ( IN-CITY ?auto_250466 ?auto_250464 ) ( not ( = ?auto_250456 ?auto_250466 ) ) ( OBJ-AT ?auto_250457 ?auto_250466 ) ( TRUCK-AT ?auto_250463 ?auto_250456 ) ( not ( = ?auto_250457 ?auto_250459 ) ) ( not ( = ?auto_250462 ?auto_250466 ) ) ( not ( = ?auto_250457 ?auto_250458 ) ) ( not ( = ?auto_250459 ?auto_250458 ) ) ( not ( = ?auto_250465 ?auto_250462 ) ) ( not ( = ?auto_250465 ?auto_250466 ) ) ( not ( = ?auto_250457 ?auto_250461 ) ) ( not ( = ?auto_250459 ?auto_250461 ) ) ( not ( = ?auto_250458 ?auto_250461 ) ) ( not ( = ?auto_250467 ?auto_250465 ) ) ( not ( = ?auto_250467 ?auto_250462 ) ) ( not ( = ?auto_250467 ?auto_250466 ) ) ( not ( = ?auto_250457 ?auto_250460 ) ) ( not ( = ?auto_250459 ?auto_250460 ) ) ( not ( = ?auto_250458 ?auto_250460 ) ) ( not ( = ?auto_250461 ?auto_250460 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250457 ?auto_250459 ?auto_250458 ?auto_250460 ?auto_250461 ?auto_250456 )
      ( DELIVER-5PKG-VERIFY ?auto_250457 ?auto_250458 ?auto_250459 ?auto_250460 ?auto_250461 ?auto_250456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250617 - OBJ
      ?auto_250618 - OBJ
      ?auto_250619 - OBJ
      ?auto_250620 - OBJ
      ?auto_250621 - OBJ
      ?auto_250616 - LOCATION
    )
    :vars
    (
      ?auto_250622 - LOCATION
      ?auto_250624 - CITY
      ?auto_250627 - LOCATION
      ?auto_250625 - LOCATION
      ?auto_250626 - LOCATION
      ?auto_250623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250622 ?auto_250624 ) ( IN-CITY ?auto_250616 ?auto_250624 ) ( not ( = ?auto_250616 ?auto_250622 ) ) ( OBJ-AT ?auto_250621 ?auto_250622 ) ( IN-CITY ?auto_250627 ?auto_250624 ) ( not ( = ?auto_250616 ?auto_250627 ) ) ( OBJ-AT ?auto_250619 ?auto_250627 ) ( IN-CITY ?auto_250625 ?auto_250624 ) ( not ( = ?auto_250616 ?auto_250625 ) ) ( OBJ-AT ?auto_250618 ?auto_250625 ) ( OBJ-AT ?auto_250620 ?auto_250622 ) ( IN-CITY ?auto_250626 ?auto_250624 ) ( not ( = ?auto_250616 ?auto_250626 ) ) ( OBJ-AT ?auto_250617 ?auto_250626 ) ( TRUCK-AT ?auto_250623 ?auto_250616 ) ( not ( = ?auto_250617 ?auto_250620 ) ) ( not ( = ?auto_250622 ?auto_250626 ) ) ( not ( = ?auto_250617 ?auto_250618 ) ) ( not ( = ?auto_250620 ?auto_250618 ) ) ( not ( = ?auto_250625 ?auto_250622 ) ) ( not ( = ?auto_250625 ?auto_250626 ) ) ( not ( = ?auto_250617 ?auto_250619 ) ) ( not ( = ?auto_250620 ?auto_250619 ) ) ( not ( = ?auto_250618 ?auto_250619 ) ) ( not ( = ?auto_250627 ?auto_250625 ) ) ( not ( = ?auto_250627 ?auto_250622 ) ) ( not ( = ?auto_250627 ?auto_250626 ) ) ( not ( = ?auto_250617 ?auto_250621 ) ) ( not ( = ?auto_250620 ?auto_250621 ) ) ( not ( = ?auto_250618 ?auto_250621 ) ) ( not ( = ?auto_250619 ?auto_250621 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250617 ?auto_250620 ?auto_250618 ?auto_250621 ?auto_250619 ?auto_250616 )
      ( DELIVER-5PKG-VERIFY ?auto_250617 ?auto_250618 ?auto_250619 ?auto_250620 ?auto_250621 ?auto_250616 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253742 - OBJ
      ?auto_253743 - OBJ
      ?auto_253744 - OBJ
      ?auto_253745 - OBJ
      ?auto_253746 - OBJ
      ?auto_253741 - LOCATION
    )
    :vars
    (
      ?auto_253747 - LOCATION
      ?auto_253749 - CITY
      ?auto_253752 - LOCATION
      ?auto_253750 - LOCATION
      ?auto_253751 - LOCATION
      ?auto_253748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253747 ?auto_253749 ) ( IN-CITY ?auto_253741 ?auto_253749 ) ( not ( = ?auto_253741 ?auto_253747 ) ) ( OBJ-AT ?auto_253746 ?auto_253747 ) ( IN-CITY ?auto_253752 ?auto_253749 ) ( not ( = ?auto_253741 ?auto_253752 ) ) ( OBJ-AT ?auto_253745 ?auto_253752 ) ( IN-CITY ?auto_253750 ?auto_253749 ) ( not ( = ?auto_253741 ?auto_253750 ) ) ( OBJ-AT ?auto_253744 ?auto_253750 ) ( OBJ-AT ?auto_253742 ?auto_253747 ) ( IN-CITY ?auto_253751 ?auto_253749 ) ( not ( = ?auto_253741 ?auto_253751 ) ) ( OBJ-AT ?auto_253743 ?auto_253751 ) ( TRUCK-AT ?auto_253748 ?auto_253741 ) ( not ( = ?auto_253743 ?auto_253742 ) ) ( not ( = ?auto_253747 ?auto_253751 ) ) ( not ( = ?auto_253743 ?auto_253744 ) ) ( not ( = ?auto_253742 ?auto_253744 ) ) ( not ( = ?auto_253750 ?auto_253747 ) ) ( not ( = ?auto_253750 ?auto_253751 ) ) ( not ( = ?auto_253743 ?auto_253745 ) ) ( not ( = ?auto_253742 ?auto_253745 ) ) ( not ( = ?auto_253744 ?auto_253745 ) ) ( not ( = ?auto_253752 ?auto_253750 ) ) ( not ( = ?auto_253752 ?auto_253747 ) ) ( not ( = ?auto_253752 ?auto_253751 ) ) ( not ( = ?auto_253743 ?auto_253746 ) ) ( not ( = ?auto_253742 ?auto_253746 ) ) ( not ( = ?auto_253744 ?auto_253746 ) ) ( not ( = ?auto_253745 ?auto_253746 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253743 ?auto_253742 ?auto_253744 ?auto_253746 ?auto_253745 ?auto_253741 )
      ( DELIVER-5PKG-VERIFY ?auto_253742 ?auto_253743 ?auto_253744 ?auto_253745 ?auto_253746 ?auto_253741 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253793 - OBJ
      ?auto_253794 - OBJ
      ?auto_253795 - OBJ
      ?auto_253796 - OBJ
      ?auto_253797 - OBJ
      ?auto_253792 - LOCATION
    )
    :vars
    (
      ?auto_253798 - LOCATION
      ?auto_253800 - CITY
      ?auto_253803 - LOCATION
      ?auto_253801 - LOCATION
      ?auto_253802 - LOCATION
      ?auto_253799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253798 ?auto_253800 ) ( IN-CITY ?auto_253792 ?auto_253800 ) ( not ( = ?auto_253792 ?auto_253798 ) ) ( OBJ-AT ?auto_253796 ?auto_253798 ) ( IN-CITY ?auto_253803 ?auto_253800 ) ( not ( = ?auto_253792 ?auto_253803 ) ) ( OBJ-AT ?auto_253797 ?auto_253803 ) ( IN-CITY ?auto_253801 ?auto_253800 ) ( not ( = ?auto_253792 ?auto_253801 ) ) ( OBJ-AT ?auto_253795 ?auto_253801 ) ( OBJ-AT ?auto_253793 ?auto_253798 ) ( IN-CITY ?auto_253802 ?auto_253800 ) ( not ( = ?auto_253792 ?auto_253802 ) ) ( OBJ-AT ?auto_253794 ?auto_253802 ) ( TRUCK-AT ?auto_253799 ?auto_253792 ) ( not ( = ?auto_253794 ?auto_253793 ) ) ( not ( = ?auto_253798 ?auto_253802 ) ) ( not ( = ?auto_253794 ?auto_253795 ) ) ( not ( = ?auto_253793 ?auto_253795 ) ) ( not ( = ?auto_253801 ?auto_253798 ) ) ( not ( = ?auto_253801 ?auto_253802 ) ) ( not ( = ?auto_253794 ?auto_253797 ) ) ( not ( = ?auto_253793 ?auto_253797 ) ) ( not ( = ?auto_253795 ?auto_253797 ) ) ( not ( = ?auto_253803 ?auto_253801 ) ) ( not ( = ?auto_253803 ?auto_253798 ) ) ( not ( = ?auto_253803 ?auto_253802 ) ) ( not ( = ?auto_253794 ?auto_253796 ) ) ( not ( = ?auto_253793 ?auto_253796 ) ) ( not ( = ?auto_253795 ?auto_253796 ) ) ( not ( = ?auto_253797 ?auto_253796 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253794 ?auto_253793 ?auto_253795 ?auto_253796 ?auto_253797 ?auto_253792 )
      ( DELIVER-5PKG-VERIFY ?auto_253793 ?auto_253794 ?auto_253795 ?auto_253796 ?auto_253797 ?auto_253792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_254096 - OBJ
      ?auto_254097 - OBJ
      ?auto_254098 - OBJ
      ?auto_254099 - OBJ
      ?auto_254100 - OBJ
      ?auto_254095 - LOCATION
    )
    :vars
    (
      ?auto_254101 - LOCATION
      ?auto_254103 - CITY
      ?auto_254106 - LOCATION
      ?auto_254104 - LOCATION
      ?auto_254105 - LOCATION
      ?auto_254102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_254101 ?auto_254103 ) ( IN-CITY ?auto_254095 ?auto_254103 ) ( not ( = ?auto_254095 ?auto_254101 ) ) ( OBJ-AT ?auto_254098 ?auto_254101 ) ( IN-CITY ?auto_254106 ?auto_254103 ) ( not ( = ?auto_254095 ?auto_254106 ) ) ( OBJ-AT ?auto_254100 ?auto_254106 ) ( IN-CITY ?auto_254104 ?auto_254103 ) ( not ( = ?auto_254095 ?auto_254104 ) ) ( OBJ-AT ?auto_254099 ?auto_254104 ) ( OBJ-AT ?auto_254096 ?auto_254101 ) ( IN-CITY ?auto_254105 ?auto_254103 ) ( not ( = ?auto_254095 ?auto_254105 ) ) ( OBJ-AT ?auto_254097 ?auto_254105 ) ( TRUCK-AT ?auto_254102 ?auto_254095 ) ( not ( = ?auto_254097 ?auto_254096 ) ) ( not ( = ?auto_254101 ?auto_254105 ) ) ( not ( = ?auto_254097 ?auto_254099 ) ) ( not ( = ?auto_254096 ?auto_254099 ) ) ( not ( = ?auto_254104 ?auto_254101 ) ) ( not ( = ?auto_254104 ?auto_254105 ) ) ( not ( = ?auto_254097 ?auto_254100 ) ) ( not ( = ?auto_254096 ?auto_254100 ) ) ( not ( = ?auto_254099 ?auto_254100 ) ) ( not ( = ?auto_254106 ?auto_254104 ) ) ( not ( = ?auto_254106 ?auto_254101 ) ) ( not ( = ?auto_254106 ?auto_254105 ) ) ( not ( = ?auto_254097 ?auto_254098 ) ) ( not ( = ?auto_254096 ?auto_254098 ) ) ( not ( = ?auto_254099 ?auto_254098 ) ) ( not ( = ?auto_254100 ?auto_254098 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_254097 ?auto_254096 ?auto_254099 ?auto_254098 ?auto_254100 ?auto_254095 )
      ( DELIVER-5PKG-VERIFY ?auto_254096 ?auto_254097 ?auto_254098 ?auto_254099 ?auto_254100 ?auto_254095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_256805 - OBJ
      ?auto_256806 - OBJ
      ?auto_256807 - OBJ
      ?auto_256808 - OBJ
      ?auto_256809 - OBJ
      ?auto_256804 - LOCATION
    )
    :vars
    (
      ?auto_256810 - LOCATION
      ?auto_256812 - CITY
      ?auto_256815 - LOCATION
      ?auto_256813 - LOCATION
      ?auto_256814 - LOCATION
      ?auto_256811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_256810 ?auto_256812 ) ( IN-CITY ?auto_256804 ?auto_256812 ) ( not ( = ?auto_256804 ?auto_256810 ) ) ( OBJ-AT ?auto_256806 ?auto_256810 ) ( IN-CITY ?auto_256815 ?auto_256812 ) ( not ( = ?auto_256804 ?auto_256815 ) ) ( OBJ-AT ?auto_256809 ?auto_256815 ) ( IN-CITY ?auto_256813 ?auto_256812 ) ( not ( = ?auto_256804 ?auto_256813 ) ) ( OBJ-AT ?auto_256808 ?auto_256813 ) ( OBJ-AT ?auto_256805 ?auto_256810 ) ( IN-CITY ?auto_256814 ?auto_256812 ) ( not ( = ?auto_256804 ?auto_256814 ) ) ( OBJ-AT ?auto_256807 ?auto_256814 ) ( TRUCK-AT ?auto_256811 ?auto_256804 ) ( not ( = ?auto_256807 ?auto_256805 ) ) ( not ( = ?auto_256810 ?auto_256814 ) ) ( not ( = ?auto_256807 ?auto_256808 ) ) ( not ( = ?auto_256805 ?auto_256808 ) ) ( not ( = ?auto_256813 ?auto_256810 ) ) ( not ( = ?auto_256813 ?auto_256814 ) ) ( not ( = ?auto_256807 ?auto_256809 ) ) ( not ( = ?auto_256805 ?auto_256809 ) ) ( not ( = ?auto_256808 ?auto_256809 ) ) ( not ( = ?auto_256815 ?auto_256813 ) ) ( not ( = ?auto_256815 ?auto_256810 ) ) ( not ( = ?auto_256815 ?auto_256814 ) ) ( not ( = ?auto_256807 ?auto_256806 ) ) ( not ( = ?auto_256805 ?auto_256806 ) ) ( not ( = ?auto_256808 ?auto_256806 ) ) ( not ( = ?auto_256809 ?auto_256806 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_256807 ?auto_256805 ?auto_256808 ?auto_256806 ?auto_256809 ?auto_256804 )
      ( DELIVER-5PKG-VERIFY ?auto_256805 ?auto_256806 ?auto_256807 ?auto_256808 ?auto_256809 ?auto_256804 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_506984 - OBJ
      ?auto_506985 - OBJ
      ?auto_506986 - OBJ
      ?auto_506987 - OBJ
      ?auto_506988 - OBJ
      ?auto_506989 - OBJ
      ?auto_506983 - LOCATION
    )
    :vars
    (
      ?auto_506992 - LOCATION
      ?auto_506991 - CITY
      ?auto_506995 - LOCATION
      ?auto_506993 - LOCATION
      ?auto_506994 - LOCATION
      ?auto_506990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_506992 ?auto_506991 ) ( IN-CITY ?auto_506983 ?auto_506991 ) ( not ( = ?auto_506983 ?auto_506992 ) ) ( OBJ-AT ?auto_506989 ?auto_506992 ) ( OBJ-AT ?auto_506988 ?auto_506992 ) ( IN-CITY ?auto_506995 ?auto_506991 ) ( not ( = ?auto_506983 ?auto_506995 ) ) ( OBJ-AT ?auto_506987 ?auto_506995 ) ( IN-CITY ?auto_506993 ?auto_506991 ) ( not ( = ?auto_506983 ?auto_506993 ) ) ( OBJ-AT ?auto_506986 ?auto_506993 ) ( OBJ-AT ?auto_506985 ?auto_506992 ) ( IN-CITY ?auto_506994 ?auto_506991 ) ( not ( = ?auto_506983 ?auto_506994 ) ) ( OBJ-AT ?auto_506984 ?auto_506994 ) ( TRUCK-AT ?auto_506990 ?auto_506983 ) ( not ( = ?auto_506984 ?auto_506985 ) ) ( not ( = ?auto_506992 ?auto_506994 ) ) ( not ( = ?auto_506984 ?auto_506986 ) ) ( not ( = ?auto_506985 ?auto_506986 ) ) ( not ( = ?auto_506993 ?auto_506992 ) ) ( not ( = ?auto_506993 ?auto_506994 ) ) ( not ( = ?auto_506984 ?auto_506987 ) ) ( not ( = ?auto_506985 ?auto_506987 ) ) ( not ( = ?auto_506986 ?auto_506987 ) ) ( not ( = ?auto_506995 ?auto_506993 ) ) ( not ( = ?auto_506995 ?auto_506992 ) ) ( not ( = ?auto_506995 ?auto_506994 ) ) ( not ( = ?auto_506984 ?auto_506988 ) ) ( not ( = ?auto_506985 ?auto_506988 ) ) ( not ( = ?auto_506986 ?auto_506988 ) ) ( not ( = ?auto_506987 ?auto_506988 ) ) ( not ( = ?auto_506984 ?auto_506989 ) ) ( not ( = ?auto_506985 ?auto_506989 ) ) ( not ( = ?auto_506986 ?auto_506989 ) ) ( not ( = ?auto_506987 ?auto_506989 ) ) ( not ( = ?auto_506988 ?auto_506989 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_506984 ?auto_506985 ?auto_506986 ?auto_506988 ?auto_506987 ?auto_506983 )
      ( DELIVER-1PKG ?auto_506989 ?auto_506983 )
      ( DELIVER-6PKG-VERIFY ?auto_506984 ?auto_506985 ?auto_506986 ?auto_506987 ?auto_506988 ?auto_506989 ?auto_506983 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507116 - OBJ
      ?auto_507117 - OBJ
      ?auto_507118 - OBJ
      ?auto_507119 - OBJ
      ?auto_507120 - OBJ
      ?auto_507121 - OBJ
      ?auto_507115 - LOCATION
    )
    :vars
    (
      ?auto_507127 - LOCATION
      ?auto_507125 - CITY
      ?auto_507123 - LOCATION
      ?auto_507124 - LOCATION
      ?auto_507126 - LOCATION
      ?auto_507122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507127 ?auto_507125 ) ( IN-CITY ?auto_507115 ?auto_507125 ) ( not ( = ?auto_507115 ?auto_507127 ) ) ( OBJ-AT ?auto_507121 ?auto_507127 ) ( OBJ-AT ?auto_507119 ?auto_507127 ) ( IN-CITY ?auto_507123 ?auto_507125 ) ( not ( = ?auto_507115 ?auto_507123 ) ) ( OBJ-AT ?auto_507120 ?auto_507123 ) ( IN-CITY ?auto_507124 ?auto_507125 ) ( not ( = ?auto_507115 ?auto_507124 ) ) ( OBJ-AT ?auto_507118 ?auto_507124 ) ( OBJ-AT ?auto_507117 ?auto_507127 ) ( IN-CITY ?auto_507126 ?auto_507125 ) ( not ( = ?auto_507115 ?auto_507126 ) ) ( OBJ-AT ?auto_507116 ?auto_507126 ) ( TRUCK-AT ?auto_507122 ?auto_507115 ) ( not ( = ?auto_507116 ?auto_507117 ) ) ( not ( = ?auto_507127 ?auto_507126 ) ) ( not ( = ?auto_507116 ?auto_507118 ) ) ( not ( = ?auto_507117 ?auto_507118 ) ) ( not ( = ?auto_507124 ?auto_507127 ) ) ( not ( = ?auto_507124 ?auto_507126 ) ) ( not ( = ?auto_507116 ?auto_507120 ) ) ( not ( = ?auto_507117 ?auto_507120 ) ) ( not ( = ?auto_507118 ?auto_507120 ) ) ( not ( = ?auto_507123 ?auto_507124 ) ) ( not ( = ?auto_507123 ?auto_507127 ) ) ( not ( = ?auto_507123 ?auto_507126 ) ) ( not ( = ?auto_507116 ?auto_507119 ) ) ( not ( = ?auto_507117 ?auto_507119 ) ) ( not ( = ?auto_507118 ?auto_507119 ) ) ( not ( = ?auto_507120 ?auto_507119 ) ) ( not ( = ?auto_507116 ?auto_507121 ) ) ( not ( = ?auto_507117 ?auto_507121 ) ) ( not ( = ?auto_507118 ?auto_507121 ) ) ( not ( = ?auto_507120 ?auto_507121 ) ) ( not ( = ?auto_507119 ?auto_507121 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507116 ?auto_507117 ?auto_507118 ?auto_507120 ?auto_507119 ?auto_507121 ?auto_507115 )
      ( DELIVER-6PKG-VERIFY ?auto_507116 ?auto_507117 ?auto_507118 ?auto_507119 ?auto_507120 ?auto_507121 ?auto_507115 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507185 - OBJ
      ?auto_507186 - OBJ
      ?auto_507187 - OBJ
      ?auto_507188 - OBJ
      ?auto_507189 - OBJ
      ?auto_507190 - OBJ
      ?auto_507184 - LOCATION
    )
    :vars
    (
      ?auto_507195 - LOCATION
      ?auto_507193 - CITY
      ?auto_507191 - LOCATION
      ?auto_507194 - LOCATION
      ?auto_507196 - LOCATION
      ?auto_507192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507195 ?auto_507193 ) ( IN-CITY ?auto_507184 ?auto_507193 ) ( not ( = ?auto_507184 ?auto_507195 ) ) ( OBJ-AT ?auto_507189 ?auto_507195 ) ( OBJ-AT ?auto_507188 ?auto_507195 ) ( IN-CITY ?auto_507191 ?auto_507193 ) ( not ( = ?auto_507184 ?auto_507191 ) ) ( OBJ-AT ?auto_507190 ?auto_507191 ) ( IN-CITY ?auto_507194 ?auto_507193 ) ( not ( = ?auto_507184 ?auto_507194 ) ) ( OBJ-AT ?auto_507187 ?auto_507194 ) ( OBJ-AT ?auto_507186 ?auto_507195 ) ( IN-CITY ?auto_507196 ?auto_507193 ) ( not ( = ?auto_507184 ?auto_507196 ) ) ( OBJ-AT ?auto_507185 ?auto_507196 ) ( TRUCK-AT ?auto_507192 ?auto_507184 ) ( not ( = ?auto_507185 ?auto_507186 ) ) ( not ( = ?auto_507195 ?auto_507196 ) ) ( not ( = ?auto_507185 ?auto_507187 ) ) ( not ( = ?auto_507186 ?auto_507187 ) ) ( not ( = ?auto_507194 ?auto_507195 ) ) ( not ( = ?auto_507194 ?auto_507196 ) ) ( not ( = ?auto_507185 ?auto_507190 ) ) ( not ( = ?auto_507186 ?auto_507190 ) ) ( not ( = ?auto_507187 ?auto_507190 ) ) ( not ( = ?auto_507191 ?auto_507194 ) ) ( not ( = ?auto_507191 ?auto_507195 ) ) ( not ( = ?auto_507191 ?auto_507196 ) ) ( not ( = ?auto_507185 ?auto_507188 ) ) ( not ( = ?auto_507186 ?auto_507188 ) ) ( not ( = ?auto_507187 ?auto_507188 ) ) ( not ( = ?auto_507190 ?auto_507188 ) ) ( not ( = ?auto_507185 ?auto_507189 ) ) ( not ( = ?auto_507186 ?auto_507189 ) ) ( not ( = ?auto_507187 ?auto_507189 ) ) ( not ( = ?auto_507190 ?auto_507189 ) ) ( not ( = ?auto_507188 ?auto_507189 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507185 ?auto_507186 ?auto_507187 ?auto_507188 ?auto_507190 ?auto_507189 ?auto_507184 )
      ( DELIVER-6PKG-VERIFY ?auto_507185 ?auto_507186 ?auto_507187 ?auto_507188 ?auto_507189 ?auto_507190 ?auto_507184 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_509365 - OBJ
      ?auto_509366 - OBJ
      ?auto_509367 - OBJ
      ?auto_509368 - OBJ
      ?auto_509369 - OBJ
      ?auto_509370 - OBJ
      ?auto_509364 - LOCATION
    )
    :vars
    (
      ?auto_509375 - LOCATION
      ?auto_509373 - CITY
      ?auto_509371 - LOCATION
      ?auto_509374 - LOCATION
      ?auto_509376 - LOCATION
      ?auto_509372 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_509375 ?auto_509373 ) ( IN-CITY ?auto_509364 ?auto_509373 ) ( not ( = ?auto_509364 ?auto_509375 ) ) ( OBJ-AT ?auto_509370 ?auto_509375 ) ( OBJ-AT ?auto_509367 ?auto_509375 ) ( IN-CITY ?auto_509371 ?auto_509373 ) ( not ( = ?auto_509364 ?auto_509371 ) ) ( OBJ-AT ?auto_509369 ?auto_509371 ) ( IN-CITY ?auto_509374 ?auto_509373 ) ( not ( = ?auto_509364 ?auto_509374 ) ) ( OBJ-AT ?auto_509368 ?auto_509374 ) ( OBJ-AT ?auto_509366 ?auto_509375 ) ( IN-CITY ?auto_509376 ?auto_509373 ) ( not ( = ?auto_509364 ?auto_509376 ) ) ( OBJ-AT ?auto_509365 ?auto_509376 ) ( TRUCK-AT ?auto_509372 ?auto_509364 ) ( not ( = ?auto_509365 ?auto_509366 ) ) ( not ( = ?auto_509375 ?auto_509376 ) ) ( not ( = ?auto_509365 ?auto_509368 ) ) ( not ( = ?auto_509366 ?auto_509368 ) ) ( not ( = ?auto_509374 ?auto_509375 ) ) ( not ( = ?auto_509374 ?auto_509376 ) ) ( not ( = ?auto_509365 ?auto_509369 ) ) ( not ( = ?auto_509366 ?auto_509369 ) ) ( not ( = ?auto_509368 ?auto_509369 ) ) ( not ( = ?auto_509371 ?auto_509374 ) ) ( not ( = ?auto_509371 ?auto_509375 ) ) ( not ( = ?auto_509371 ?auto_509376 ) ) ( not ( = ?auto_509365 ?auto_509367 ) ) ( not ( = ?auto_509366 ?auto_509367 ) ) ( not ( = ?auto_509368 ?auto_509367 ) ) ( not ( = ?auto_509369 ?auto_509367 ) ) ( not ( = ?auto_509365 ?auto_509370 ) ) ( not ( = ?auto_509366 ?auto_509370 ) ) ( not ( = ?auto_509368 ?auto_509370 ) ) ( not ( = ?auto_509369 ?auto_509370 ) ) ( not ( = ?auto_509367 ?auto_509370 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_509365 ?auto_509366 ?auto_509368 ?auto_509367 ?auto_509369 ?auto_509370 ?auto_509364 )
      ( DELIVER-6PKG-VERIFY ?auto_509365 ?auto_509366 ?auto_509367 ?auto_509368 ?auto_509369 ?auto_509370 ?auto_509364 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_509434 - OBJ
      ?auto_509435 - OBJ
      ?auto_509436 - OBJ
      ?auto_509437 - OBJ
      ?auto_509438 - OBJ
      ?auto_509439 - OBJ
      ?auto_509433 - LOCATION
    )
    :vars
    (
      ?auto_509444 - LOCATION
      ?auto_509442 - CITY
      ?auto_509440 - LOCATION
      ?auto_509443 - LOCATION
      ?auto_509445 - LOCATION
      ?auto_509441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_509444 ?auto_509442 ) ( IN-CITY ?auto_509433 ?auto_509442 ) ( not ( = ?auto_509433 ?auto_509444 ) ) ( OBJ-AT ?auto_509438 ?auto_509444 ) ( OBJ-AT ?auto_509436 ?auto_509444 ) ( IN-CITY ?auto_509440 ?auto_509442 ) ( not ( = ?auto_509433 ?auto_509440 ) ) ( OBJ-AT ?auto_509439 ?auto_509440 ) ( IN-CITY ?auto_509443 ?auto_509442 ) ( not ( = ?auto_509433 ?auto_509443 ) ) ( OBJ-AT ?auto_509437 ?auto_509443 ) ( OBJ-AT ?auto_509435 ?auto_509444 ) ( IN-CITY ?auto_509445 ?auto_509442 ) ( not ( = ?auto_509433 ?auto_509445 ) ) ( OBJ-AT ?auto_509434 ?auto_509445 ) ( TRUCK-AT ?auto_509441 ?auto_509433 ) ( not ( = ?auto_509434 ?auto_509435 ) ) ( not ( = ?auto_509444 ?auto_509445 ) ) ( not ( = ?auto_509434 ?auto_509437 ) ) ( not ( = ?auto_509435 ?auto_509437 ) ) ( not ( = ?auto_509443 ?auto_509444 ) ) ( not ( = ?auto_509443 ?auto_509445 ) ) ( not ( = ?auto_509434 ?auto_509439 ) ) ( not ( = ?auto_509435 ?auto_509439 ) ) ( not ( = ?auto_509437 ?auto_509439 ) ) ( not ( = ?auto_509440 ?auto_509443 ) ) ( not ( = ?auto_509440 ?auto_509444 ) ) ( not ( = ?auto_509440 ?auto_509445 ) ) ( not ( = ?auto_509434 ?auto_509436 ) ) ( not ( = ?auto_509435 ?auto_509436 ) ) ( not ( = ?auto_509437 ?auto_509436 ) ) ( not ( = ?auto_509439 ?auto_509436 ) ) ( not ( = ?auto_509434 ?auto_509438 ) ) ( not ( = ?auto_509435 ?auto_509438 ) ) ( not ( = ?auto_509437 ?auto_509438 ) ) ( not ( = ?auto_509439 ?auto_509438 ) ) ( not ( = ?auto_509436 ?auto_509438 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_509434 ?auto_509435 ?auto_509437 ?auto_509436 ?auto_509439 ?auto_509438 ?auto_509433 )
      ( DELIVER-6PKG-VERIFY ?auto_509434 ?auto_509435 ?auto_509436 ?auto_509437 ?auto_509438 ?auto_509439 ?auto_509433 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_509994 - OBJ
      ?auto_509995 - OBJ
      ?auto_509996 - OBJ
      ?auto_509997 - OBJ
      ?auto_509998 - OBJ
      ?auto_509999 - OBJ
      ?auto_509993 - LOCATION
    )
    :vars
    (
      ?auto_510004 - LOCATION
      ?auto_510002 - CITY
      ?auto_510000 - LOCATION
      ?auto_510003 - LOCATION
      ?auto_510005 - LOCATION
      ?auto_510001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_510004 ?auto_510002 ) ( IN-CITY ?auto_509993 ?auto_510002 ) ( not ( = ?auto_509993 ?auto_510004 ) ) ( OBJ-AT ?auto_509997 ?auto_510004 ) ( OBJ-AT ?auto_509996 ?auto_510004 ) ( IN-CITY ?auto_510000 ?auto_510002 ) ( not ( = ?auto_509993 ?auto_510000 ) ) ( OBJ-AT ?auto_509999 ?auto_510000 ) ( IN-CITY ?auto_510003 ?auto_510002 ) ( not ( = ?auto_509993 ?auto_510003 ) ) ( OBJ-AT ?auto_509998 ?auto_510003 ) ( OBJ-AT ?auto_509995 ?auto_510004 ) ( IN-CITY ?auto_510005 ?auto_510002 ) ( not ( = ?auto_509993 ?auto_510005 ) ) ( OBJ-AT ?auto_509994 ?auto_510005 ) ( TRUCK-AT ?auto_510001 ?auto_509993 ) ( not ( = ?auto_509994 ?auto_509995 ) ) ( not ( = ?auto_510004 ?auto_510005 ) ) ( not ( = ?auto_509994 ?auto_509998 ) ) ( not ( = ?auto_509995 ?auto_509998 ) ) ( not ( = ?auto_510003 ?auto_510004 ) ) ( not ( = ?auto_510003 ?auto_510005 ) ) ( not ( = ?auto_509994 ?auto_509999 ) ) ( not ( = ?auto_509995 ?auto_509999 ) ) ( not ( = ?auto_509998 ?auto_509999 ) ) ( not ( = ?auto_510000 ?auto_510003 ) ) ( not ( = ?auto_510000 ?auto_510004 ) ) ( not ( = ?auto_510000 ?auto_510005 ) ) ( not ( = ?auto_509994 ?auto_509996 ) ) ( not ( = ?auto_509995 ?auto_509996 ) ) ( not ( = ?auto_509998 ?auto_509996 ) ) ( not ( = ?auto_509999 ?auto_509996 ) ) ( not ( = ?auto_509994 ?auto_509997 ) ) ( not ( = ?auto_509995 ?auto_509997 ) ) ( not ( = ?auto_509998 ?auto_509997 ) ) ( not ( = ?auto_509999 ?auto_509997 ) ) ( not ( = ?auto_509996 ?auto_509997 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_509994 ?auto_509995 ?auto_509998 ?auto_509996 ?auto_509999 ?auto_509997 ?auto_509993 )
      ( DELIVER-6PKG-VERIFY ?auto_509994 ?auto_509995 ?auto_509996 ?auto_509997 ?auto_509998 ?auto_509999 ?auto_509993 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515340 - OBJ
      ?auto_515341 - OBJ
      ?auto_515342 - OBJ
      ?auto_515343 - OBJ
      ?auto_515344 - OBJ
      ?auto_515345 - OBJ
      ?auto_515339 - LOCATION
    )
    :vars
    (
      ?auto_515350 - LOCATION
      ?auto_515348 - CITY
      ?auto_515346 - LOCATION
      ?auto_515349 - LOCATION
      ?auto_515351 - LOCATION
      ?auto_515347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515350 ?auto_515348 ) ( IN-CITY ?auto_515339 ?auto_515348 ) ( not ( = ?auto_515339 ?auto_515350 ) ) ( OBJ-AT ?auto_515345 ?auto_515350 ) ( OBJ-AT ?auto_515344 ?auto_515350 ) ( IN-CITY ?auto_515346 ?auto_515348 ) ( not ( = ?auto_515339 ?auto_515346 ) ) ( OBJ-AT ?auto_515343 ?auto_515346 ) ( IN-CITY ?auto_515349 ?auto_515348 ) ( not ( = ?auto_515339 ?auto_515349 ) ) ( OBJ-AT ?auto_515341 ?auto_515349 ) ( OBJ-AT ?auto_515342 ?auto_515350 ) ( IN-CITY ?auto_515351 ?auto_515348 ) ( not ( = ?auto_515339 ?auto_515351 ) ) ( OBJ-AT ?auto_515340 ?auto_515351 ) ( TRUCK-AT ?auto_515347 ?auto_515339 ) ( not ( = ?auto_515340 ?auto_515342 ) ) ( not ( = ?auto_515350 ?auto_515351 ) ) ( not ( = ?auto_515340 ?auto_515341 ) ) ( not ( = ?auto_515342 ?auto_515341 ) ) ( not ( = ?auto_515349 ?auto_515350 ) ) ( not ( = ?auto_515349 ?auto_515351 ) ) ( not ( = ?auto_515340 ?auto_515343 ) ) ( not ( = ?auto_515342 ?auto_515343 ) ) ( not ( = ?auto_515341 ?auto_515343 ) ) ( not ( = ?auto_515346 ?auto_515349 ) ) ( not ( = ?auto_515346 ?auto_515350 ) ) ( not ( = ?auto_515346 ?auto_515351 ) ) ( not ( = ?auto_515340 ?auto_515344 ) ) ( not ( = ?auto_515342 ?auto_515344 ) ) ( not ( = ?auto_515341 ?auto_515344 ) ) ( not ( = ?auto_515343 ?auto_515344 ) ) ( not ( = ?auto_515340 ?auto_515345 ) ) ( not ( = ?auto_515342 ?auto_515345 ) ) ( not ( = ?auto_515341 ?auto_515345 ) ) ( not ( = ?auto_515343 ?auto_515345 ) ) ( not ( = ?auto_515344 ?auto_515345 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515340 ?auto_515342 ?auto_515341 ?auto_515344 ?auto_515343 ?auto_515345 ?auto_515339 )
      ( DELIVER-6PKG-VERIFY ?auto_515340 ?auto_515341 ?auto_515342 ?auto_515343 ?auto_515344 ?auto_515345 ?auto_515339 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515472 - OBJ
      ?auto_515473 - OBJ
      ?auto_515474 - OBJ
      ?auto_515475 - OBJ
      ?auto_515476 - OBJ
      ?auto_515477 - OBJ
      ?auto_515471 - LOCATION
    )
    :vars
    (
      ?auto_515482 - LOCATION
      ?auto_515480 - CITY
      ?auto_515478 - LOCATION
      ?auto_515481 - LOCATION
      ?auto_515483 - LOCATION
      ?auto_515479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515482 ?auto_515480 ) ( IN-CITY ?auto_515471 ?auto_515480 ) ( not ( = ?auto_515471 ?auto_515482 ) ) ( OBJ-AT ?auto_515477 ?auto_515482 ) ( OBJ-AT ?auto_515475 ?auto_515482 ) ( IN-CITY ?auto_515478 ?auto_515480 ) ( not ( = ?auto_515471 ?auto_515478 ) ) ( OBJ-AT ?auto_515476 ?auto_515478 ) ( IN-CITY ?auto_515481 ?auto_515480 ) ( not ( = ?auto_515471 ?auto_515481 ) ) ( OBJ-AT ?auto_515473 ?auto_515481 ) ( OBJ-AT ?auto_515474 ?auto_515482 ) ( IN-CITY ?auto_515483 ?auto_515480 ) ( not ( = ?auto_515471 ?auto_515483 ) ) ( OBJ-AT ?auto_515472 ?auto_515483 ) ( TRUCK-AT ?auto_515479 ?auto_515471 ) ( not ( = ?auto_515472 ?auto_515474 ) ) ( not ( = ?auto_515482 ?auto_515483 ) ) ( not ( = ?auto_515472 ?auto_515473 ) ) ( not ( = ?auto_515474 ?auto_515473 ) ) ( not ( = ?auto_515481 ?auto_515482 ) ) ( not ( = ?auto_515481 ?auto_515483 ) ) ( not ( = ?auto_515472 ?auto_515476 ) ) ( not ( = ?auto_515474 ?auto_515476 ) ) ( not ( = ?auto_515473 ?auto_515476 ) ) ( not ( = ?auto_515478 ?auto_515481 ) ) ( not ( = ?auto_515478 ?auto_515482 ) ) ( not ( = ?auto_515478 ?auto_515483 ) ) ( not ( = ?auto_515472 ?auto_515475 ) ) ( not ( = ?auto_515474 ?auto_515475 ) ) ( not ( = ?auto_515473 ?auto_515475 ) ) ( not ( = ?auto_515476 ?auto_515475 ) ) ( not ( = ?auto_515472 ?auto_515477 ) ) ( not ( = ?auto_515474 ?auto_515477 ) ) ( not ( = ?auto_515473 ?auto_515477 ) ) ( not ( = ?auto_515476 ?auto_515477 ) ) ( not ( = ?auto_515475 ?auto_515477 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515472 ?auto_515474 ?auto_515473 ?auto_515475 ?auto_515476 ?auto_515477 ?auto_515471 )
      ( DELIVER-6PKG-VERIFY ?auto_515472 ?auto_515473 ?auto_515474 ?auto_515475 ?auto_515476 ?auto_515477 ?auto_515471 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515541 - OBJ
      ?auto_515542 - OBJ
      ?auto_515543 - OBJ
      ?auto_515544 - OBJ
      ?auto_515545 - OBJ
      ?auto_515546 - OBJ
      ?auto_515540 - LOCATION
    )
    :vars
    (
      ?auto_515551 - LOCATION
      ?auto_515549 - CITY
      ?auto_515547 - LOCATION
      ?auto_515550 - LOCATION
      ?auto_515552 - LOCATION
      ?auto_515548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515551 ?auto_515549 ) ( IN-CITY ?auto_515540 ?auto_515549 ) ( not ( = ?auto_515540 ?auto_515551 ) ) ( OBJ-AT ?auto_515545 ?auto_515551 ) ( OBJ-AT ?auto_515544 ?auto_515551 ) ( IN-CITY ?auto_515547 ?auto_515549 ) ( not ( = ?auto_515540 ?auto_515547 ) ) ( OBJ-AT ?auto_515546 ?auto_515547 ) ( IN-CITY ?auto_515550 ?auto_515549 ) ( not ( = ?auto_515540 ?auto_515550 ) ) ( OBJ-AT ?auto_515542 ?auto_515550 ) ( OBJ-AT ?auto_515543 ?auto_515551 ) ( IN-CITY ?auto_515552 ?auto_515549 ) ( not ( = ?auto_515540 ?auto_515552 ) ) ( OBJ-AT ?auto_515541 ?auto_515552 ) ( TRUCK-AT ?auto_515548 ?auto_515540 ) ( not ( = ?auto_515541 ?auto_515543 ) ) ( not ( = ?auto_515551 ?auto_515552 ) ) ( not ( = ?auto_515541 ?auto_515542 ) ) ( not ( = ?auto_515543 ?auto_515542 ) ) ( not ( = ?auto_515550 ?auto_515551 ) ) ( not ( = ?auto_515550 ?auto_515552 ) ) ( not ( = ?auto_515541 ?auto_515546 ) ) ( not ( = ?auto_515543 ?auto_515546 ) ) ( not ( = ?auto_515542 ?auto_515546 ) ) ( not ( = ?auto_515547 ?auto_515550 ) ) ( not ( = ?auto_515547 ?auto_515551 ) ) ( not ( = ?auto_515547 ?auto_515552 ) ) ( not ( = ?auto_515541 ?auto_515544 ) ) ( not ( = ?auto_515543 ?auto_515544 ) ) ( not ( = ?auto_515542 ?auto_515544 ) ) ( not ( = ?auto_515546 ?auto_515544 ) ) ( not ( = ?auto_515541 ?auto_515545 ) ) ( not ( = ?auto_515543 ?auto_515545 ) ) ( not ( = ?auto_515542 ?auto_515545 ) ) ( not ( = ?auto_515546 ?auto_515545 ) ) ( not ( = ?auto_515544 ?auto_515545 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515541 ?auto_515543 ?auto_515542 ?auto_515544 ?auto_515546 ?auto_515545 ?auto_515540 )
      ( DELIVER-6PKG-VERIFY ?auto_515541 ?auto_515542 ?auto_515543 ?auto_515544 ?auto_515545 ?auto_515546 ?auto_515540 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_517671 - OBJ
      ?auto_517672 - OBJ
      ?auto_517673 - OBJ
      ?auto_517674 - OBJ
      ?auto_517675 - OBJ
      ?auto_517676 - OBJ
      ?auto_517670 - LOCATION
    )
    :vars
    (
      ?auto_517681 - LOCATION
      ?auto_517679 - CITY
      ?auto_517677 - LOCATION
      ?auto_517680 - LOCATION
      ?auto_517682 - LOCATION
      ?auto_517678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_517681 ?auto_517679 ) ( IN-CITY ?auto_517670 ?auto_517679 ) ( not ( = ?auto_517670 ?auto_517681 ) ) ( OBJ-AT ?auto_517676 ?auto_517681 ) ( OBJ-AT ?auto_517675 ?auto_517681 ) ( IN-CITY ?auto_517677 ?auto_517679 ) ( not ( = ?auto_517670 ?auto_517677 ) ) ( OBJ-AT ?auto_517673 ?auto_517677 ) ( IN-CITY ?auto_517680 ?auto_517679 ) ( not ( = ?auto_517670 ?auto_517680 ) ) ( OBJ-AT ?auto_517672 ?auto_517680 ) ( OBJ-AT ?auto_517674 ?auto_517681 ) ( IN-CITY ?auto_517682 ?auto_517679 ) ( not ( = ?auto_517670 ?auto_517682 ) ) ( OBJ-AT ?auto_517671 ?auto_517682 ) ( TRUCK-AT ?auto_517678 ?auto_517670 ) ( not ( = ?auto_517671 ?auto_517674 ) ) ( not ( = ?auto_517681 ?auto_517682 ) ) ( not ( = ?auto_517671 ?auto_517672 ) ) ( not ( = ?auto_517674 ?auto_517672 ) ) ( not ( = ?auto_517680 ?auto_517681 ) ) ( not ( = ?auto_517680 ?auto_517682 ) ) ( not ( = ?auto_517671 ?auto_517673 ) ) ( not ( = ?auto_517674 ?auto_517673 ) ) ( not ( = ?auto_517672 ?auto_517673 ) ) ( not ( = ?auto_517677 ?auto_517680 ) ) ( not ( = ?auto_517677 ?auto_517681 ) ) ( not ( = ?auto_517677 ?auto_517682 ) ) ( not ( = ?auto_517671 ?auto_517675 ) ) ( not ( = ?auto_517674 ?auto_517675 ) ) ( not ( = ?auto_517672 ?auto_517675 ) ) ( not ( = ?auto_517673 ?auto_517675 ) ) ( not ( = ?auto_517671 ?auto_517676 ) ) ( not ( = ?auto_517674 ?auto_517676 ) ) ( not ( = ?auto_517672 ?auto_517676 ) ) ( not ( = ?auto_517673 ?auto_517676 ) ) ( not ( = ?auto_517675 ?auto_517676 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_517671 ?auto_517674 ?auto_517672 ?auto_517675 ?auto_517673 ?auto_517676 ?auto_517670 )
      ( DELIVER-6PKG-VERIFY ?auto_517671 ?auto_517672 ?auto_517673 ?auto_517674 ?auto_517675 ?auto_517676 ?auto_517670 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_564992 - OBJ
      ?auto_564993 - OBJ
      ?auto_564994 - OBJ
      ?auto_564995 - OBJ
      ?auto_564996 - OBJ
      ?auto_564997 - OBJ
      ?auto_564991 - LOCATION
    )
    :vars
    (
      ?auto_565002 - LOCATION
      ?auto_565000 - CITY
      ?auto_564998 - LOCATION
      ?auto_565001 - LOCATION
      ?auto_565003 - LOCATION
      ?auto_564999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_565002 ?auto_565000 ) ( IN-CITY ?auto_564991 ?auto_565000 ) ( not ( = ?auto_564991 ?auto_565002 ) ) ( OBJ-AT ?auto_564997 ?auto_565002 ) ( OBJ-AT ?auto_564996 ?auto_565002 ) ( IN-CITY ?auto_564998 ?auto_565000 ) ( not ( = ?auto_564991 ?auto_564998 ) ) ( OBJ-AT ?auto_564995 ?auto_564998 ) ( IN-CITY ?auto_565001 ?auto_565000 ) ( not ( = ?auto_564991 ?auto_565001 ) ) ( OBJ-AT ?auto_564994 ?auto_565001 ) ( OBJ-AT ?auto_564992 ?auto_565002 ) ( IN-CITY ?auto_565003 ?auto_565000 ) ( not ( = ?auto_564991 ?auto_565003 ) ) ( OBJ-AT ?auto_564993 ?auto_565003 ) ( TRUCK-AT ?auto_564999 ?auto_564991 ) ( not ( = ?auto_564993 ?auto_564992 ) ) ( not ( = ?auto_565002 ?auto_565003 ) ) ( not ( = ?auto_564993 ?auto_564994 ) ) ( not ( = ?auto_564992 ?auto_564994 ) ) ( not ( = ?auto_565001 ?auto_565002 ) ) ( not ( = ?auto_565001 ?auto_565003 ) ) ( not ( = ?auto_564993 ?auto_564995 ) ) ( not ( = ?auto_564992 ?auto_564995 ) ) ( not ( = ?auto_564994 ?auto_564995 ) ) ( not ( = ?auto_564998 ?auto_565001 ) ) ( not ( = ?auto_564998 ?auto_565002 ) ) ( not ( = ?auto_564998 ?auto_565003 ) ) ( not ( = ?auto_564993 ?auto_564996 ) ) ( not ( = ?auto_564992 ?auto_564996 ) ) ( not ( = ?auto_564994 ?auto_564996 ) ) ( not ( = ?auto_564995 ?auto_564996 ) ) ( not ( = ?auto_564993 ?auto_564997 ) ) ( not ( = ?auto_564992 ?auto_564997 ) ) ( not ( = ?auto_564994 ?auto_564997 ) ) ( not ( = ?auto_564995 ?auto_564997 ) ) ( not ( = ?auto_564996 ?auto_564997 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_564993 ?auto_564992 ?auto_564994 ?auto_564996 ?auto_564995 ?auto_564997 ?auto_564991 )
      ( DELIVER-6PKG-VERIFY ?auto_564992 ?auto_564993 ?auto_564994 ?auto_564995 ?auto_564996 ?auto_564997 ?auto_564991 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_565124 - OBJ
      ?auto_565125 - OBJ
      ?auto_565126 - OBJ
      ?auto_565127 - OBJ
      ?auto_565128 - OBJ
      ?auto_565129 - OBJ
      ?auto_565123 - LOCATION
    )
    :vars
    (
      ?auto_565134 - LOCATION
      ?auto_565132 - CITY
      ?auto_565130 - LOCATION
      ?auto_565133 - LOCATION
      ?auto_565135 - LOCATION
      ?auto_565131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_565134 ?auto_565132 ) ( IN-CITY ?auto_565123 ?auto_565132 ) ( not ( = ?auto_565123 ?auto_565134 ) ) ( OBJ-AT ?auto_565129 ?auto_565134 ) ( OBJ-AT ?auto_565127 ?auto_565134 ) ( IN-CITY ?auto_565130 ?auto_565132 ) ( not ( = ?auto_565123 ?auto_565130 ) ) ( OBJ-AT ?auto_565128 ?auto_565130 ) ( IN-CITY ?auto_565133 ?auto_565132 ) ( not ( = ?auto_565123 ?auto_565133 ) ) ( OBJ-AT ?auto_565126 ?auto_565133 ) ( OBJ-AT ?auto_565124 ?auto_565134 ) ( IN-CITY ?auto_565135 ?auto_565132 ) ( not ( = ?auto_565123 ?auto_565135 ) ) ( OBJ-AT ?auto_565125 ?auto_565135 ) ( TRUCK-AT ?auto_565131 ?auto_565123 ) ( not ( = ?auto_565125 ?auto_565124 ) ) ( not ( = ?auto_565134 ?auto_565135 ) ) ( not ( = ?auto_565125 ?auto_565126 ) ) ( not ( = ?auto_565124 ?auto_565126 ) ) ( not ( = ?auto_565133 ?auto_565134 ) ) ( not ( = ?auto_565133 ?auto_565135 ) ) ( not ( = ?auto_565125 ?auto_565128 ) ) ( not ( = ?auto_565124 ?auto_565128 ) ) ( not ( = ?auto_565126 ?auto_565128 ) ) ( not ( = ?auto_565130 ?auto_565133 ) ) ( not ( = ?auto_565130 ?auto_565134 ) ) ( not ( = ?auto_565130 ?auto_565135 ) ) ( not ( = ?auto_565125 ?auto_565127 ) ) ( not ( = ?auto_565124 ?auto_565127 ) ) ( not ( = ?auto_565126 ?auto_565127 ) ) ( not ( = ?auto_565128 ?auto_565127 ) ) ( not ( = ?auto_565125 ?auto_565129 ) ) ( not ( = ?auto_565124 ?auto_565129 ) ) ( not ( = ?auto_565126 ?auto_565129 ) ) ( not ( = ?auto_565128 ?auto_565129 ) ) ( not ( = ?auto_565127 ?auto_565129 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_565125 ?auto_565124 ?auto_565126 ?auto_565127 ?auto_565128 ?auto_565129 ?auto_565123 )
      ( DELIVER-6PKG-VERIFY ?auto_565124 ?auto_565125 ?auto_565126 ?auto_565127 ?auto_565128 ?auto_565129 ?auto_565123 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_565193 - OBJ
      ?auto_565194 - OBJ
      ?auto_565195 - OBJ
      ?auto_565196 - OBJ
      ?auto_565197 - OBJ
      ?auto_565198 - OBJ
      ?auto_565192 - LOCATION
    )
    :vars
    (
      ?auto_565203 - LOCATION
      ?auto_565201 - CITY
      ?auto_565199 - LOCATION
      ?auto_565202 - LOCATION
      ?auto_565204 - LOCATION
      ?auto_565200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_565203 ?auto_565201 ) ( IN-CITY ?auto_565192 ?auto_565201 ) ( not ( = ?auto_565192 ?auto_565203 ) ) ( OBJ-AT ?auto_565197 ?auto_565203 ) ( OBJ-AT ?auto_565196 ?auto_565203 ) ( IN-CITY ?auto_565199 ?auto_565201 ) ( not ( = ?auto_565192 ?auto_565199 ) ) ( OBJ-AT ?auto_565198 ?auto_565199 ) ( IN-CITY ?auto_565202 ?auto_565201 ) ( not ( = ?auto_565192 ?auto_565202 ) ) ( OBJ-AT ?auto_565195 ?auto_565202 ) ( OBJ-AT ?auto_565193 ?auto_565203 ) ( IN-CITY ?auto_565204 ?auto_565201 ) ( not ( = ?auto_565192 ?auto_565204 ) ) ( OBJ-AT ?auto_565194 ?auto_565204 ) ( TRUCK-AT ?auto_565200 ?auto_565192 ) ( not ( = ?auto_565194 ?auto_565193 ) ) ( not ( = ?auto_565203 ?auto_565204 ) ) ( not ( = ?auto_565194 ?auto_565195 ) ) ( not ( = ?auto_565193 ?auto_565195 ) ) ( not ( = ?auto_565202 ?auto_565203 ) ) ( not ( = ?auto_565202 ?auto_565204 ) ) ( not ( = ?auto_565194 ?auto_565198 ) ) ( not ( = ?auto_565193 ?auto_565198 ) ) ( not ( = ?auto_565195 ?auto_565198 ) ) ( not ( = ?auto_565199 ?auto_565202 ) ) ( not ( = ?auto_565199 ?auto_565203 ) ) ( not ( = ?auto_565199 ?auto_565204 ) ) ( not ( = ?auto_565194 ?auto_565196 ) ) ( not ( = ?auto_565193 ?auto_565196 ) ) ( not ( = ?auto_565195 ?auto_565196 ) ) ( not ( = ?auto_565198 ?auto_565196 ) ) ( not ( = ?auto_565194 ?auto_565197 ) ) ( not ( = ?auto_565193 ?auto_565197 ) ) ( not ( = ?auto_565195 ?auto_565197 ) ) ( not ( = ?auto_565198 ?auto_565197 ) ) ( not ( = ?auto_565196 ?auto_565197 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_565194 ?auto_565193 ?auto_565195 ?auto_565196 ?auto_565198 ?auto_565197 ?auto_565192 )
      ( DELIVER-6PKG-VERIFY ?auto_565193 ?auto_565194 ?auto_565195 ?auto_565196 ?auto_565197 ?auto_565198 ?auto_565192 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_567373 - OBJ
      ?auto_567374 - OBJ
      ?auto_567375 - OBJ
      ?auto_567376 - OBJ
      ?auto_567377 - OBJ
      ?auto_567378 - OBJ
      ?auto_567372 - LOCATION
    )
    :vars
    (
      ?auto_567383 - LOCATION
      ?auto_567381 - CITY
      ?auto_567379 - LOCATION
      ?auto_567382 - LOCATION
      ?auto_567384 - LOCATION
      ?auto_567380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_567383 ?auto_567381 ) ( IN-CITY ?auto_567372 ?auto_567381 ) ( not ( = ?auto_567372 ?auto_567383 ) ) ( OBJ-AT ?auto_567378 ?auto_567383 ) ( OBJ-AT ?auto_567375 ?auto_567383 ) ( IN-CITY ?auto_567379 ?auto_567381 ) ( not ( = ?auto_567372 ?auto_567379 ) ) ( OBJ-AT ?auto_567377 ?auto_567379 ) ( IN-CITY ?auto_567382 ?auto_567381 ) ( not ( = ?auto_567372 ?auto_567382 ) ) ( OBJ-AT ?auto_567376 ?auto_567382 ) ( OBJ-AT ?auto_567373 ?auto_567383 ) ( IN-CITY ?auto_567384 ?auto_567381 ) ( not ( = ?auto_567372 ?auto_567384 ) ) ( OBJ-AT ?auto_567374 ?auto_567384 ) ( TRUCK-AT ?auto_567380 ?auto_567372 ) ( not ( = ?auto_567374 ?auto_567373 ) ) ( not ( = ?auto_567383 ?auto_567384 ) ) ( not ( = ?auto_567374 ?auto_567376 ) ) ( not ( = ?auto_567373 ?auto_567376 ) ) ( not ( = ?auto_567382 ?auto_567383 ) ) ( not ( = ?auto_567382 ?auto_567384 ) ) ( not ( = ?auto_567374 ?auto_567377 ) ) ( not ( = ?auto_567373 ?auto_567377 ) ) ( not ( = ?auto_567376 ?auto_567377 ) ) ( not ( = ?auto_567379 ?auto_567382 ) ) ( not ( = ?auto_567379 ?auto_567383 ) ) ( not ( = ?auto_567379 ?auto_567384 ) ) ( not ( = ?auto_567374 ?auto_567375 ) ) ( not ( = ?auto_567373 ?auto_567375 ) ) ( not ( = ?auto_567376 ?auto_567375 ) ) ( not ( = ?auto_567377 ?auto_567375 ) ) ( not ( = ?auto_567374 ?auto_567378 ) ) ( not ( = ?auto_567373 ?auto_567378 ) ) ( not ( = ?auto_567376 ?auto_567378 ) ) ( not ( = ?auto_567377 ?auto_567378 ) ) ( not ( = ?auto_567375 ?auto_567378 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_567374 ?auto_567373 ?auto_567376 ?auto_567375 ?auto_567377 ?auto_567378 ?auto_567372 )
      ( DELIVER-6PKG-VERIFY ?auto_567373 ?auto_567374 ?auto_567375 ?auto_567376 ?auto_567377 ?auto_567378 ?auto_567372 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_567442 - OBJ
      ?auto_567443 - OBJ
      ?auto_567444 - OBJ
      ?auto_567445 - OBJ
      ?auto_567446 - OBJ
      ?auto_567447 - OBJ
      ?auto_567441 - LOCATION
    )
    :vars
    (
      ?auto_567452 - LOCATION
      ?auto_567450 - CITY
      ?auto_567448 - LOCATION
      ?auto_567451 - LOCATION
      ?auto_567453 - LOCATION
      ?auto_567449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_567452 ?auto_567450 ) ( IN-CITY ?auto_567441 ?auto_567450 ) ( not ( = ?auto_567441 ?auto_567452 ) ) ( OBJ-AT ?auto_567446 ?auto_567452 ) ( OBJ-AT ?auto_567444 ?auto_567452 ) ( IN-CITY ?auto_567448 ?auto_567450 ) ( not ( = ?auto_567441 ?auto_567448 ) ) ( OBJ-AT ?auto_567447 ?auto_567448 ) ( IN-CITY ?auto_567451 ?auto_567450 ) ( not ( = ?auto_567441 ?auto_567451 ) ) ( OBJ-AT ?auto_567445 ?auto_567451 ) ( OBJ-AT ?auto_567442 ?auto_567452 ) ( IN-CITY ?auto_567453 ?auto_567450 ) ( not ( = ?auto_567441 ?auto_567453 ) ) ( OBJ-AT ?auto_567443 ?auto_567453 ) ( TRUCK-AT ?auto_567449 ?auto_567441 ) ( not ( = ?auto_567443 ?auto_567442 ) ) ( not ( = ?auto_567452 ?auto_567453 ) ) ( not ( = ?auto_567443 ?auto_567445 ) ) ( not ( = ?auto_567442 ?auto_567445 ) ) ( not ( = ?auto_567451 ?auto_567452 ) ) ( not ( = ?auto_567451 ?auto_567453 ) ) ( not ( = ?auto_567443 ?auto_567447 ) ) ( not ( = ?auto_567442 ?auto_567447 ) ) ( not ( = ?auto_567445 ?auto_567447 ) ) ( not ( = ?auto_567448 ?auto_567451 ) ) ( not ( = ?auto_567448 ?auto_567452 ) ) ( not ( = ?auto_567448 ?auto_567453 ) ) ( not ( = ?auto_567443 ?auto_567444 ) ) ( not ( = ?auto_567442 ?auto_567444 ) ) ( not ( = ?auto_567445 ?auto_567444 ) ) ( not ( = ?auto_567447 ?auto_567444 ) ) ( not ( = ?auto_567443 ?auto_567446 ) ) ( not ( = ?auto_567442 ?auto_567446 ) ) ( not ( = ?auto_567445 ?auto_567446 ) ) ( not ( = ?auto_567447 ?auto_567446 ) ) ( not ( = ?auto_567444 ?auto_567446 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_567443 ?auto_567442 ?auto_567445 ?auto_567444 ?auto_567447 ?auto_567446 ?auto_567441 )
      ( DELIVER-6PKG-VERIFY ?auto_567442 ?auto_567443 ?auto_567444 ?auto_567445 ?auto_567446 ?auto_567447 ?auto_567441 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_568002 - OBJ
      ?auto_568003 - OBJ
      ?auto_568004 - OBJ
      ?auto_568005 - OBJ
      ?auto_568006 - OBJ
      ?auto_568007 - OBJ
      ?auto_568001 - LOCATION
    )
    :vars
    (
      ?auto_568012 - LOCATION
      ?auto_568010 - CITY
      ?auto_568008 - LOCATION
      ?auto_568011 - LOCATION
      ?auto_568013 - LOCATION
      ?auto_568009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_568012 ?auto_568010 ) ( IN-CITY ?auto_568001 ?auto_568010 ) ( not ( = ?auto_568001 ?auto_568012 ) ) ( OBJ-AT ?auto_568005 ?auto_568012 ) ( OBJ-AT ?auto_568004 ?auto_568012 ) ( IN-CITY ?auto_568008 ?auto_568010 ) ( not ( = ?auto_568001 ?auto_568008 ) ) ( OBJ-AT ?auto_568007 ?auto_568008 ) ( IN-CITY ?auto_568011 ?auto_568010 ) ( not ( = ?auto_568001 ?auto_568011 ) ) ( OBJ-AT ?auto_568006 ?auto_568011 ) ( OBJ-AT ?auto_568002 ?auto_568012 ) ( IN-CITY ?auto_568013 ?auto_568010 ) ( not ( = ?auto_568001 ?auto_568013 ) ) ( OBJ-AT ?auto_568003 ?auto_568013 ) ( TRUCK-AT ?auto_568009 ?auto_568001 ) ( not ( = ?auto_568003 ?auto_568002 ) ) ( not ( = ?auto_568012 ?auto_568013 ) ) ( not ( = ?auto_568003 ?auto_568006 ) ) ( not ( = ?auto_568002 ?auto_568006 ) ) ( not ( = ?auto_568011 ?auto_568012 ) ) ( not ( = ?auto_568011 ?auto_568013 ) ) ( not ( = ?auto_568003 ?auto_568007 ) ) ( not ( = ?auto_568002 ?auto_568007 ) ) ( not ( = ?auto_568006 ?auto_568007 ) ) ( not ( = ?auto_568008 ?auto_568011 ) ) ( not ( = ?auto_568008 ?auto_568012 ) ) ( not ( = ?auto_568008 ?auto_568013 ) ) ( not ( = ?auto_568003 ?auto_568004 ) ) ( not ( = ?auto_568002 ?auto_568004 ) ) ( not ( = ?auto_568006 ?auto_568004 ) ) ( not ( = ?auto_568007 ?auto_568004 ) ) ( not ( = ?auto_568003 ?auto_568005 ) ) ( not ( = ?auto_568002 ?auto_568005 ) ) ( not ( = ?auto_568006 ?auto_568005 ) ) ( not ( = ?auto_568007 ?auto_568005 ) ) ( not ( = ?auto_568004 ?auto_568005 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_568003 ?auto_568002 ?auto_568006 ?auto_568004 ?auto_568007 ?auto_568005 ?auto_568001 )
      ( DELIVER-6PKG-VERIFY ?auto_568002 ?auto_568003 ?auto_568004 ?auto_568005 ?auto_568006 ?auto_568007 ?auto_568001 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_601378 - OBJ
      ?auto_601379 - OBJ
      ?auto_601380 - OBJ
      ?auto_601381 - OBJ
      ?auto_601382 - OBJ
      ?auto_601383 - OBJ
      ?auto_601377 - LOCATION
    )
    :vars
    (
      ?auto_601388 - LOCATION
      ?auto_601386 - CITY
      ?auto_601384 - LOCATION
      ?auto_601387 - LOCATION
      ?auto_601389 - LOCATION
      ?auto_601385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_601388 ?auto_601386 ) ( IN-CITY ?auto_601377 ?auto_601386 ) ( not ( = ?auto_601377 ?auto_601388 ) ) ( OBJ-AT ?auto_601383 ?auto_601388 ) ( OBJ-AT ?auto_601379 ?auto_601388 ) ( IN-CITY ?auto_601384 ?auto_601386 ) ( not ( = ?auto_601377 ?auto_601384 ) ) ( OBJ-AT ?auto_601382 ?auto_601384 ) ( IN-CITY ?auto_601387 ?auto_601386 ) ( not ( = ?auto_601377 ?auto_601387 ) ) ( OBJ-AT ?auto_601381 ?auto_601387 ) ( OBJ-AT ?auto_601378 ?auto_601388 ) ( IN-CITY ?auto_601389 ?auto_601386 ) ( not ( = ?auto_601377 ?auto_601389 ) ) ( OBJ-AT ?auto_601380 ?auto_601389 ) ( TRUCK-AT ?auto_601385 ?auto_601377 ) ( not ( = ?auto_601380 ?auto_601378 ) ) ( not ( = ?auto_601388 ?auto_601389 ) ) ( not ( = ?auto_601380 ?auto_601381 ) ) ( not ( = ?auto_601378 ?auto_601381 ) ) ( not ( = ?auto_601387 ?auto_601388 ) ) ( not ( = ?auto_601387 ?auto_601389 ) ) ( not ( = ?auto_601380 ?auto_601382 ) ) ( not ( = ?auto_601378 ?auto_601382 ) ) ( not ( = ?auto_601381 ?auto_601382 ) ) ( not ( = ?auto_601384 ?auto_601387 ) ) ( not ( = ?auto_601384 ?auto_601388 ) ) ( not ( = ?auto_601384 ?auto_601389 ) ) ( not ( = ?auto_601380 ?auto_601379 ) ) ( not ( = ?auto_601378 ?auto_601379 ) ) ( not ( = ?auto_601381 ?auto_601379 ) ) ( not ( = ?auto_601382 ?auto_601379 ) ) ( not ( = ?auto_601380 ?auto_601383 ) ) ( not ( = ?auto_601378 ?auto_601383 ) ) ( not ( = ?auto_601381 ?auto_601383 ) ) ( not ( = ?auto_601382 ?auto_601383 ) ) ( not ( = ?auto_601379 ?auto_601383 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_601380 ?auto_601378 ?auto_601381 ?auto_601379 ?auto_601382 ?auto_601383 ?auto_601377 )
      ( DELIVER-6PKG-VERIFY ?auto_601378 ?auto_601379 ?auto_601380 ?auto_601381 ?auto_601382 ?auto_601383 ?auto_601377 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_601447 - OBJ
      ?auto_601448 - OBJ
      ?auto_601449 - OBJ
      ?auto_601450 - OBJ
      ?auto_601451 - OBJ
      ?auto_601452 - OBJ
      ?auto_601446 - LOCATION
    )
    :vars
    (
      ?auto_601457 - LOCATION
      ?auto_601455 - CITY
      ?auto_601453 - LOCATION
      ?auto_601456 - LOCATION
      ?auto_601458 - LOCATION
      ?auto_601454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_601457 ?auto_601455 ) ( IN-CITY ?auto_601446 ?auto_601455 ) ( not ( = ?auto_601446 ?auto_601457 ) ) ( OBJ-AT ?auto_601451 ?auto_601457 ) ( OBJ-AT ?auto_601448 ?auto_601457 ) ( IN-CITY ?auto_601453 ?auto_601455 ) ( not ( = ?auto_601446 ?auto_601453 ) ) ( OBJ-AT ?auto_601452 ?auto_601453 ) ( IN-CITY ?auto_601456 ?auto_601455 ) ( not ( = ?auto_601446 ?auto_601456 ) ) ( OBJ-AT ?auto_601450 ?auto_601456 ) ( OBJ-AT ?auto_601447 ?auto_601457 ) ( IN-CITY ?auto_601458 ?auto_601455 ) ( not ( = ?auto_601446 ?auto_601458 ) ) ( OBJ-AT ?auto_601449 ?auto_601458 ) ( TRUCK-AT ?auto_601454 ?auto_601446 ) ( not ( = ?auto_601449 ?auto_601447 ) ) ( not ( = ?auto_601457 ?auto_601458 ) ) ( not ( = ?auto_601449 ?auto_601450 ) ) ( not ( = ?auto_601447 ?auto_601450 ) ) ( not ( = ?auto_601456 ?auto_601457 ) ) ( not ( = ?auto_601456 ?auto_601458 ) ) ( not ( = ?auto_601449 ?auto_601452 ) ) ( not ( = ?auto_601447 ?auto_601452 ) ) ( not ( = ?auto_601450 ?auto_601452 ) ) ( not ( = ?auto_601453 ?auto_601456 ) ) ( not ( = ?auto_601453 ?auto_601457 ) ) ( not ( = ?auto_601453 ?auto_601458 ) ) ( not ( = ?auto_601449 ?auto_601448 ) ) ( not ( = ?auto_601447 ?auto_601448 ) ) ( not ( = ?auto_601450 ?auto_601448 ) ) ( not ( = ?auto_601452 ?auto_601448 ) ) ( not ( = ?auto_601449 ?auto_601451 ) ) ( not ( = ?auto_601447 ?auto_601451 ) ) ( not ( = ?auto_601450 ?auto_601451 ) ) ( not ( = ?auto_601452 ?auto_601451 ) ) ( not ( = ?auto_601448 ?auto_601451 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_601449 ?auto_601447 ?auto_601450 ?auto_601448 ?auto_601452 ?auto_601451 ?auto_601446 )
      ( DELIVER-6PKG-VERIFY ?auto_601447 ?auto_601448 ?auto_601449 ?auto_601450 ?auto_601451 ?auto_601452 ?auto_601446 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_602007 - OBJ
      ?auto_602008 - OBJ
      ?auto_602009 - OBJ
      ?auto_602010 - OBJ
      ?auto_602011 - OBJ
      ?auto_602012 - OBJ
      ?auto_602006 - LOCATION
    )
    :vars
    (
      ?auto_602017 - LOCATION
      ?auto_602015 - CITY
      ?auto_602013 - LOCATION
      ?auto_602016 - LOCATION
      ?auto_602018 - LOCATION
      ?auto_602014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_602017 ?auto_602015 ) ( IN-CITY ?auto_602006 ?auto_602015 ) ( not ( = ?auto_602006 ?auto_602017 ) ) ( OBJ-AT ?auto_602010 ?auto_602017 ) ( OBJ-AT ?auto_602008 ?auto_602017 ) ( IN-CITY ?auto_602013 ?auto_602015 ) ( not ( = ?auto_602006 ?auto_602013 ) ) ( OBJ-AT ?auto_602012 ?auto_602013 ) ( IN-CITY ?auto_602016 ?auto_602015 ) ( not ( = ?auto_602006 ?auto_602016 ) ) ( OBJ-AT ?auto_602011 ?auto_602016 ) ( OBJ-AT ?auto_602007 ?auto_602017 ) ( IN-CITY ?auto_602018 ?auto_602015 ) ( not ( = ?auto_602006 ?auto_602018 ) ) ( OBJ-AT ?auto_602009 ?auto_602018 ) ( TRUCK-AT ?auto_602014 ?auto_602006 ) ( not ( = ?auto_602009 ?auto_602007 ) ) ( not ( = ?auto_602017 ?auto_602018 ) ) ( not ( = ?auto_602009 ?auto_602011 ) ) ( not ( = ?auto_602007 ?auto_602011 ) ) ( not ( = ?auto_602016 ?auto_602017 ) ) ( not ( = ?auto_602016 ?auto_602018 ) ) ( not ( = ?auto_602009 ?auto_602012 ) ) ( not ( = ?auto_602007 ?auto_602012 ) ) ( not ( = ?auto_602011 ?auto_602012 ) ) ( not ( = ?auto_602013 ?auto_602016 ) ) ( not ( = ?auto_602013 ?auto_602017 ) ) ( not ( = ?auto_602013 ?auto_602018 ) ) ( not ( = ?auto_602009 ?auto_602008 ) ) ( not ( = ?auto_602007 ?auto_602008 ) ) ( not ( = ?auto_602011 ?auto_602008 ) ) ( not ( = ?auto_602012 ?auto_602008 ) ) ( not ( = ?auto_602009 ?auto_602010 ) ) ( not ( = ?auto_602007 ?auto_602010 ) ) ( not ( = ?auto_602011 ?auto_602010 ) ) ( not ( = ?auto_602012 ?auto_602010 ) ) ( not ( = ?auto_602008 ?auto_602010 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_602009 ?auto_602007 ?auto_602011 ?auto_602008 ?auto_602012 ?auto_602010 ?auto_602006 )
      ( DELIVER-6PKG-VERIFY ?auto_602007 ?auto_602008 ?auto_602009 ?auto_602010 ?auto_602011 ?auto_602012 ?auto_602006 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_607789 - OBJ
      ?auto_607790 - OBJ
      ?auto_607791 - OBJ
      ?auto_607792 - OBJ
      ?auto_607793 - OBJ
      ?auto_607794 - OBJ
      ?auto_607788 - LOCATION
    )
    :vars
    (
      ?auto_607799 - LOCATION
      ?auto_607797 - CITY
      ?auto_607795 - LOCATION
      ?auto_607798 - LOCATION
      ?auto_607800 - LOCATION
      ?auto_607796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_607799 ?auto_607797 ) ( IN-CITY ?auto_607788 ?auto_607797 ) ( not ( = ?auto_607788 ?auto_607799 ) ) ( OBJ-AT ?auto_607791 ?auto_607799 ) ( OBJ-AT ?auto_607790 ?auto_607799 ) ( IN-CITY ?auto_607795 ?auto_607797 ) ( not ( = ?auto_607788 ?auto_607795 ) ) ( OBJ-AT ?auto_607794 ?auto_607795 ) ( IN-CITY ?auto_607798 ?auto_607797 ) ( not ( = ?auto_607788 ?auto_607798 ) ) ( OBJ-AT ?auto_607793 ?auto_607798 ) ( OBJ-AT ?auto_607789 ?auto_607799 ) ( IN-CITY ?auto_607800 ?auto_607797 ) ( not ( = ?auto_607788 ?auto_607800 ) ) ( OBJ-AT ?auto_607792 ?auto_607800 ) ( TRUCK-AT ?auto_607796 ?auto_607788 ) ( not ( = ?auto_607792 ?auto_607789 ) ) ( not ( = ?auto_607799 ?auto_607800 ) ) ( not ( = ?auto_607792 ?auto_607793 ) ) ( not ( = ?auto_607789 ?auto_607793 ) ) ( not ( = ?auto_607798 ?auto_607799 ) ) ( not ( = ?auto_607798 ?auto_607800 ) ) ( not ( = ?auto_607792 ?auto_607794 ) ) ( not ( = ?auto_607789 ?auto_607794 ) ) ( not ( = ?auto_607793 ?auto_607794 ) ) ( not ( = ?auto_607795 ?auto_607798 ) ) ( not ( = ?auto_607795 ?auto_607799 ) ) ( not ( = ?auto_607795 ?auto_607800 ) ) ( not ( = ?auto_607792 ?auto_607790 ) ) ( not ( = ?auto_607789 ?auto_607790 ) ) ( not ( = ?auto_607793 ?auto_607790 ) ) ( not ( = ?auto_607794 ?auto_607790 ) ) ( not ( = ?auto_607792 ?auto_607791 ) ) ( not ( = ?auto_607789 ?auto_607791 ) ) ( not ( = ?auto_607793 ?auto_607791 ) ) ( not ( = ?auto_607794 ?auto_607791 ) ) ( not ( = ?auto_607790 ?auto_607791 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_607792 ?auto_607789 ?auto_607793 ?auto_607790 ?auto_607794 ?auto_607791 ?auto_607788 )
      ( DELIVER-6PKG-VERIFY ?auto_607789 ?auto_607790 ?auto_607791 ?auto_607792 ?auto_607793 ?auto_607794 ?auto_607788 ) )
  )

)

