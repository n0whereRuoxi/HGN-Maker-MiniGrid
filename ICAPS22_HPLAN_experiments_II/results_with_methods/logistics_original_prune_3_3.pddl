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
      ?auto_9609 - OBJ
      ?auto_9608 - LOCATION
    )
    :vars
    (
      ?auto_9610 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9610 ?auto_9608 ) ( IN-TRUCK ?auto_9609 ?auto_9610 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9609 ?auto_9610 ?auto_9608 )
      ( DELIVER-1PKG-VERIFY ?auto_9609 ?auto_9608 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9621 - OBJ
      ?auto_9620 - LOCATION
    )
    :vars
    (
      ?auto_9622 - TRUCK
      ?auto_9623 - LOCATION
      ?auto_9624 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9621 ?auto_9622 ) ( TRUCK-AT ?auto_9622 ?auto_9623 ) ( IN-CITY ?auto_9623 ?auto_9624 ) ( IN-CITY ?auto_9620 ?auto_9624 ) ( not ( = ?auto_9620 ?auto_9623 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9622 ?auto_9623 ?auto_9620 ?auto_9624 )
      ( DELIVER-1PKG ?auto_9621 ?auto_9620 )
      ( DELIVER-1PKG-VERIFY ?auto_9621 ?auto_9620 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9639 - OBJ
      ?auto_9638 - LOCATION
    )
    :vars
    (
      ?auto_9642 - TRUCK
      ?auto_9640 - LOCATION
      ?auto_9641 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9642 ?auto_9640 ) ( IN-CITY ?auto_9640 ?auto_9641 ) ( IN-CITY ?auto_9638 ?auto_9641 ) ( not ( = ?auto_9638 ?auto_9640 ) ) ( OBJ-AT ?auto_9639 ?auto_9640 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9639 ?auto_9642 ?auto_9640 )
      ( DELIVER-1PKG ?auto_9639 ?auto_9638 )
      ( DELIVER-1PKG-VERIFY ?auto_9639 ?auto_9638 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9657 - OBJ
      ?auto_9656 - LOCATION
    )
    :vars
    (
      ?auto_9658 - LOCATION
      ?auto_9660 - CITY
      ?auto_9659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9658 ?auto_9660 ) ( IN-CITY ?auto_9656 ?auto_9660 ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( OBJ-AT ?auto_9657 ?auto_9658 ) ( TRUCK-AT ?auto_9659 ?auto_9656 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9659 ?auto_9656 ?auto_9658 ?auto_9660 )
      ( DELIVER-1PKG ?auto_9657 ?auto_9656 )
      ( DELIVER-1PKG-VERIFY ?auto_9657 ?auto_9656 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9717 - OBJ
      ?auto_9718 - OBJ
      ?auto_9716 - LOCATION
    )
    :vars
    (
      ?auto_9719 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9719 ?auto_9716 ) ( IN-TRUCK ?auto_9718 ?auto_9719 ) ( OBJ-AT ?auto_9717 ?auto_9716 ) ( not ( = ?auto_9717 ?auto_9718 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9718 ?auto_9716 )
      ( DELIVER-2PKG-VERIFY ?auto_9717 ?auto_9718 ?auto_9716 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9721 - OBJ
      ?auto_9722 - OBJ
      ?auto_9720 - LOCATION
    )
    :vars
    (
      ?auto_9723 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9723 ?auto_9720 ) ( IN-TRUCK ?auto_9721 ?auto_9723 ) ( OBJ-AT ?auto_9722 ?auto_9720 ) ( not ( = ?auto_9721 ?auto_9722 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9721 ?auto_9720 )
      ( DELIVER-2PKG-VERIFY ?auto_9721 ?auto_9722 ?auto_9720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9729 - OBJ
      ?auto_9730 - OBJ
      ?auto_9731 - OBJ
      ?auto_9728 - LOCATION
    )
    :vars
    (
      ?auto_9732 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9732 ?auto_9728 ) ( IN-TRUCK ?auto_9731 ?auto_9732 ) ( OBJ-AT ?auto_9729 ?auto_9728 ) ( OBJ-AT ?auto_9730 ?auto_9728 ) ( not ( = ?auto_9729 ?auto_9730 ) ) ( not ( = ?auto_9729 ?auto_9731 ) ) ( not ( = ?auto_9730 ?auto_9731 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9731 ?auto_9728 )
      ( DELIVER-3PKG-VERIFY ?auto_9729 ?auto_9730 ?auto_9731 ?auto_9728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9734 - OBJ
      ?auto_9735 - OBJ
      ?auto_9736 - OBJ
      ?auto_9733 - LOCATION
    )
    :vars
    (
      ?auto_9737 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9737 ?auto_9733 ) ( IN-TRUCK ?auto_9735 ?auto_9737 ) ( OBJ-AT ?auto_9734 ?auto_9733 ) ( OBJ-AT ?auto_9736 ?auto_9733 ) ( not ( = ?auto_9734 ?auto_9735 ) ) ( not ( = ?auto_9734 ?auto_9736 ) ) ( not ( = ?auto_9735 ?auto_9736 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9735 ?auto_9733 )
      ( DELIVER-3PKG-VERIFY ?auto_9734 ?auto_9735 ?auto_9736 ?auto_9733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9744 - OBJ
      ?auto_9745 - OBJ
      ?auto_9746 - OBJ
      ?auto_9743 - LOCATION
    )
    :vars
    (
      ?auto_9747 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9747 ?auto_9743 ) ( IN-TRUCK ?auto_9744 ?auto_9747 ) ( OBJ-AT ?auto_9745 ?auto_9743 ) ( OBJ-AT ?auto_9746 ?auto_9743 ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( not ( = ?auto_9744 ?auto_9746 ) ) ( not ( = ?auto_9745 ?auto_9746 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9744 ?auto_9743 )
      ( DELIVER-3PKG-VERIFY ?auto_9744 ?auto_9745 ?auto_9746 ?auto_9743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9769 - OBJ
      ?auto_9770 - OBJ
      ?auto_9768 - LOCATION
    )
    :vars
    (
      ?auto_9773 - TRUCK
      ?auto_9772 - LOCATION
      ?auto_9771 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9770 ?auto_9773 ) ( TRUCK-AT ?auto_9773 ?auto_9772 ) ( IN-CITY ?auto_9772 ?auto_9771 ) ( IN-CITY ?auto_9768 ?auto_9771 ) ( not ( = ?auto_9768 ?auto_9772 ) ) ( OBJ-AT ?auto_9769 ?auto_9768 ) ( not ( = ?auto_9769 ?auto_9770 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9770 ?auto_9768 )
      ( DELIVER-2PKG-VERIFY ?auto_9769 ?auto_9770 ?auto_9768 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9775 - OBJ
      ?auto_9776 - OBJ
      ?auto_9774 - LOCATION
    )
    :vars
    (
      ?auto_9778 - TRUCK
      ?auto_9777 - LOCATION
      ?auto_9779 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9775 ?auto_9778 ) ( TRUCK-AT ?auto_9778 ?auto_9777 ) ( IN-CITY ?auto_9777 ?auto_9779 ) ( IN-CITY ?auto_9774 ?auto_9779 ) ( not ( = ?auto_9774 ?auto_9777 ) ) ( OBJ-AT ?auto_9776 ?auto_9774 ) ( not ( = ?auto_9776 ?auto_9775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9776 ?auto_9775 ?auto_9774 )
      ( DELIVER-2PKG-VERIFY ?auto_9775 ?auto_9776 ?auto_9774 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9788 - OBJ
      ?auto_9789 - OBJ
      ?auto_9790 - OBJ
      ?auto_9787 - LOCATION
    )
    :vars
    (
      ?auto_9792 - TRUCK
      ?auto_9791 - LOCATION
      ?auto_9793 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9790 ?auto_9792 ) ( TRUCK-AT ?auto_9792 ?auto_9791 ) ( IN-CITY ?auto_9791 ?auto_9793 ) ( IN-CITY ?auto_9787 ?auto_9793 ) ( not ( = ?auto_9787 ?auto_9791 ) ) ( OBJ-AT ?auto_9789 ?auto_9787 ) ( not ( = ?auto_9789 ?auto_9790 ) ) ( OBJ-AT ?auto_9788 ?auto_9787 ) ( not ( = ?auto_9788 ?auto_9789 ) ) ( not ( = ?auto_9788 ?auto_9790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9789 ?auto_9790 ?auto_9787 )
      ( DELIVER-3PKG-VERIFY ?auto_9788 ?auto_9789 ?auto_9790 ?auto_9787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9795 - OBJ
      ?auto_9796 - OBJ
      ?auto_9797 - OBJ
      ?auto_9794 - LOCATION
    )
    :vars
    (
      ?auto_9799 - TRUCK
      ?auto_9798 - LOCATION
      ?auto_9800 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9796 ?auto_9799 ) ( TRUCK-AT ?auto_9799 ?auto_9798 ) ( IN-CITY ?auto_9798 ?auto_9800 ) ( IN-CITY ?auto_9794 ?auto_9800 ) ( not ( = ?auto_9794 ?auto_9798 ) ) ( OBJ-AT ?auto_9795 ?auto_9794 ) ( not ( = ?auto_9795 ?auto_9796 ) ) ( OBJ-AT ?auto_9797 ?auto_9794 ) ( not ( = ?auto_9795 ?auto_9797 ) ) ( not ( = ?auto_9796 ?auto_9797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9795 ?auto_9796 ?auto_9794 )
      ( DELIVER-3PKG-VERIFY ?auto_9795 ?auto_9796 ?auto_9797 ?auto_9794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9809 - OBJ
      ?auto_9810 - OBJ
      ?auto_9811 - OBJ
      ?auto_9808 - LOCATION
    )
    :vars
    (
      ?auto_9813 - TRUCK
      ?auto_9812 - LOCATION
      ?auto_9814 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9809 ?auto_9813 ) ( TRUCK-AT ?auto_9813 ?auto_9812 ) ( IN-CITY ?auto_9812 ?auto_9814 ) ( IN-CITY ?auto_9808 ?auto_9814 ) ( not ( = ?auto_9808 ?auto_9812 ) ) ( OBJ-AT ?auto_9810 ?auto_9808 ) ( not ( = ?auto_9810 ?auto_9809 ) ) ( OBJ-AT ?auto_9811 ?auto_9808 ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9810 ?auto_9809 ?auto_9808 )
      ( DELIVER-3PKG-VERIFY ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9808 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9838 - OBJ
      ?auto_9837 - LOCATION
    )
    :vars
    (
      ?auto_9841 - TRUCK
      ?auto_9840 - LOCATION
      ?auto_9842 - CITY
      ?auto_9839 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9841 ?auto_9840 ) ( IN-CITY ?auto_9840 ?auto_9842 ) ( IN-CITY ?auto_9837 ?auto_9842 ) ( not ( = ?auto_9837 ?auto_9840 ) ) ( OBJ-AT ?auto_9839 ?auto_9837 ) ( not ( = ?auto_9839 ?auto_9838 ) ) ( OBJ-AT ?auto_9838 ?auto_9840 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9838 ?auto_9841 ?auto_9840 )
      ( DELIVER-2PKG ?auto_9839 ?auto_9838 ?auto_9837 )
      ( DELIVER-1PKG-VERIFY ?auto_9838 ?auto_9837 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9844 - OBJ
      ?auto_9845 - OBJ
      ?auto_9843 - LOCATION
    )
    :vars
    (
      ?auto_9846 - TRUCK
      ?auto_9848 - LOCATION
      ?auto_9847 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9846 ?auto_9848 ) ( IN-CITY ?auto_9848 ?auto_9847 ) ( IN-CITY ?auto_9843 ?auto_9847 ) ( not ( = ?auto_9843 ?auto_9848 ) ) ( OBJ-AT ?auto_9844 ?auto_9843 ) ( not ( = ?auto_9844 ?auto_9845 ) ) ( OBJ-AT ?auto_9845 ?auto_9848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9845 ?auto_9843 )
      ( DELIVER-2PKG-VERIFY ?auto_9844 ?auto_9845 ?auto_9843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9850 - OBJ
      ?auto_9851 - OBJ
      ?auto_9849 - LOCATION
    )
    :vars
    (
      ?auto_9852 - TRUCK
      ?auto_9853 - LOCATION
      ?auto_9854 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9852 ?auto_9853 ) ( IN-CITY ?auto_9853 ?auto_9854 ) ( IN-CITY ?auto_9849 ?auto_9854 ) ( not ( = ?auto_9849 ?auto_9853 ) ) ( OBJ-AT ?auto_9851 ?auto_9849 ) ( not ( = ?auto_9851 ?auto_9850 ) ) ( OBJ-AT ?auto_9850 ?auto_9853 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9851 ?auto_9850 ?auto_9849 )
      ( DELIVER-2PKG-VERIFY ?auto_9850 ?auto_9851 ?auto_9849 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9863 - OBJ
      ?auto_9864 - OBJ
      ?auto_9865 - OBJ
      ?auto_9862 - LOCATION
    )
    :vars
    (
      ?auto_9866 - TRUCK
      ?auto_9867 - LOCATION
      ?auto_9868 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9866 ?auto_9867 ) ( IN-CITY ?auto_9867 ?auto_9868 ) ( IN-CITY ?auto_9862 ?auto_9868 ) ( not ( = ?auto_9862 ?auto_9867 ) ) ( OBJ-AT ?auto_9863 ?auto_9862 ) ( not ( = ?auto_9863 ?auto_9865 ) ) ( OBJ-AT ?auto_9865 ?auto_9867 ) ( OBJ-AT ?auto_9864 ?auto_9862 ) ( not ( = ?auto_9863 ?auto_9864 ) ) ( not ( = ?auto_9864 ?auto_9865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9863 ?auto_9865 ?auto_9862 )
      ( DELIVER-3PKG-VERIFY ?auto_9863 ?auto_9864 ?auto_9865 ?auto_9862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9870 - OBJ
      ?auto_9871 - OBJ
      ?auto_9872 - OBJ
      ?auto_9869 - LOCATION
    )
    :vars
    (
      ?auto_9873 - TRUCK
      ?auto_9874 - LOCATION
      ?auto_9875 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9873 ?auto_9874 ) ( IN-CITY ?auto_9874 ?auto_9875 ) ( IN-CITY ?auto_9869 ?auto_9875 ) ( not ( = ?auto_9869 ?auto_9874 ) ) ( OBJ-AT ?auto_9870 ?auto_9869 ) ( not ( = ?auto_9870 ?auto_9871 ) ) ( OBJ-AT ?auto_9871 ?auto_9874 ) ( OBJ-AT ?auto_9872 ?auto_9869 ) ( not ( = ?auto_9870 ?auto_9872 ) ) ( not ( = ?auto_9871 ?auto_9872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9870 ?auto_9871 ?auto_9869 )
      ( DELIVER-3PKG-VERIFY ?auto_9870 ?auto_9871 ?auto_9872 ?auto_9869 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9884 - OBJ
      ?auto_9885 - OBJ
      ?auto_9886 - OBJ
      ?auto_9883 - LOCATION
    )
    :vars
    (
      ?auto_9887 - TRUCK
      ?auto_9888 - LOCATION
      ?auto_9889 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9887 ?auto_9888 ) ( IN-CITY ?auto_9888 ?auto_9889 ) ( IN-CITY ?auto_9883 ?auto_9889 ) ( not ( = ?auto_9883 ?auto_9888 ) ) ( OBJ-AT ?auto_9885 ?auto_9883 ) ( not ( = ?auto_9885 ?auto_9884 ) ) ( OBJ-AT ?auto_9884 ?auto_9888 ) ( OBJ-AT ?auto_9886 ?auto_9883 ) ( not ( = ?auto_9884 ?auto_9886 ) ) ( not ( = ?auto_9885 ?auto_9886 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9885 ?auto_9884 ?auto_9883 )
      ( DELIVER-3PKG-VERIFY ?auto_9884 ?auto_9885 ?auto_9886 ?auto_9883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9913 - OBJ
      ?auto_9912 - LOCATION
    )
    :vars
    (
      ?auto_9916 - LOCATION
      ?auto_9917 - CITY
      ?auto_9915 - OBJ
      ?auto_9914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9916 ?auto_9917 ) ( IN-CITY ?auto_9912 ?auto_9917 ) ( not ( = ?auto_9912 ?auto_9916 ) ) ( OBJ-AT ?auto_9915 ?auto_9912 ) ( not ( = ?auto_9915 ?auto_9913 ) ) ( OBJ-AT ?auto_9913 ?auto_9916 ) ( TRUCK-AT ?auto_9914 ?auto_9912 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9914 ?auto_9912 ?auto_9916 ?auto_9917 )
      ( DELIVER-2PKG ?auto_9915 ?auto_9913 ?auto_9912 )
      ( DELIVER-1PKG-VERIFY ?auto_9913 ?auto_9912 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9919 - OBJ
      ?auto_9920 - OBJ
      ?auto_9918 - LOCATION
    )
    :vars
    (
      ?auto_9922 - LOCATION
      ?auto_9923 - CITY
      ?auto_9921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9922 ?auto_9923 ) ( IN-CITY ?auto_9918 ?auto_9923 ) ( not ( = ?auto_9918 ?auto_9922 ) ) ( OBJ-AT ?auto_9919 ?auto_9918 ) ( not ( = ?auto_9919 ?auto_9920 ) ) ( OBJ-AT ?auto_9920 ?auto_9922 ) ( TRUCK-AT ?auto_9921 ?auto_9918 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9920 ?auto_9918 )
      ( DELIVER-2PKG-VERIFY ?auto_9919 ?auto_9920 ?auto_9918 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9925 - OBJ
      ?auto_9926 - OBJ
      ?auto_9924 - LOCATION
    )
    :vars
    (
      ?auto_9929 - LOCATION
      ?auto_9928 - CITY
      ?auto_9927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9929 ?auto_9928 ) ( IN-CITY ?auto_9924 ?auto_9928 ) ( not ( = ?auto_9924 ?auto_9929 ) ) ( OBJ-AT ?auto_9926 ?auto_9924 ) ( not ( = ?auto_9926 ?auto_9925 ) ) ( OBJ-AT ?auto_9925 ?auto_9929 ) ( TRUCK-AT ?auto_9927 ?auto_9924 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9926 ?auto_9925 ?auto_9924 )
      ( DELIVER-2PKG-VERIFY ?auto_9925 ?auto_9926 ?auto_9924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9938 - OBJ
      ?auto_9939 - OBJ
      ?auto_9940 - OBJ
      ?auto_9937 - LOCATION
    )
    :vars
    (
      ?auto_9943 - LOCATION
      ?auto_9942 - CITY
      ?auto_9941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9943 ?auto_9942 ) ( IN-CITY ?auto_9937 ?auto_9942 ) ( not ( = ?auto_9937 ?auto_9943 ) ) ( OBJ-AT ?auto_9939 ?auto_9937 ) ( not ( = ?auto_9939 ?auto_9940 ) ) ( OBJ-AT ?auto_9940 ?auto_9943 ) ( TRUCK-AT ?auto_9941 ?auto_9937 ) ( OBJ-AT ?auto_9938 ?auto_9937 ) ( not ( = ?auto_9938 ?auto_9939 ) ) ( not ( = ?auto_9938 ?auto_9940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9939 ?auto_9940 ?auto_9937 )
      ( DELIVER-3PKG-VERIFY ?auto_9938 ?auto_9939 ?auto_9940 ?auto_9937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9945 - OBJ
      ?auto_9946 - OBJ
      ?auto_9947 - OBJ
      ?auto_9944 - LOCATION
    )
    :vars
    (
      ?auto_9950 - LOCATION
      ?auto_9949 - CITY
      ?auto_9948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9950 ?auto_9949 ) ( IN-CITY ?auto_9944 ?auto_9949 ) ( not ( = ?auto_9944 ?auto_9950 ) ) ( OBJ-AT ?auto_9945 ?auto_9944 ) ( not ( = ?auto_9945 ?auto_9946 ) ) ( OBJ-AT ?auto_9946 ?auto_9950 ) ( TRUCK-AT ?auto_9948 ?auto_9944 ) ( OBJ-AT ?auto_9947 ?auto_9944 ) ( not ( = ?auto_9945 ?auto_9947 ) ) ( not ( = ?auto_9946 ?auto_9947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9945 ?auto_9946 ?auto_9944 )
      ( DELIVER-3PKG-VERIFY ?auto_9945 ?auto_9946 ?auto_9947 ?auto_9944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9959 - OBJ
      ?auto_9960 - OBJ
      ?auto_9961 - OBJ
      ?auto_9958 - LOCATION
    )
    :vars
    (
      ?auto_9964 - LOCATION
      ?auto_9963 - CITY
      ?auto_9962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9964 ?auto_9963 ) ( IN-CITY ?auto_9958 ?auto_9963 ) ( not ( = ?auto_9958 ?auto_9964 ) ) ( OBJ-AT ?auto_9961 ?auto_9958 ) ( not ( = ?auto_9961 ?auto_9959 ) ) ( OBJ-AT ?auto_9959 ?auto_9964 ) ( TRUCK-AT ?auto_9962 ?auto_9958 ) ( OBJ-AT ?auto_9960 ?auto_9958 ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9960 ?auto_9961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9961 ?auto_9959 ?auto_9958 )
      ( DELIVER-3PKG-VERIFY ?auto_9959 ?auto_9960 ?auto_9961 ?auto_9958 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9988 - OBJ
      ?auto_9987 - LOCATION
    )
    :vars
    (
      ?auto_9991 - LOCATION
      ?auto_9990 - CITY
      ?auto_9992 - OBJ
      ?auto_9989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9991 ?auto_9990 ) ( IN-CITY ?auto_9987 ?auto_9990 ) ( not ( = ?auto_9987 ?auto_9991 ) ) ( not ( = ?auto_9992 ?auto_9988 ) ) ( OBJ-AT ?auto_9988 ?auto_9991 ) ( TRUCK-AT ?auto_9989 ?auto_9987 ) ( IN-TRUCK ?auto_9992 ?auto_9989 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9992 ?auto_9987 )
      ( DELIVER-2PKG ?auto_9992 ?auto_9988 ?auto_9987 )
      ( DELIVER-1PKG-VERIFY ?auto_9988 ?auto_9987 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9994 - OBJ
      ?auto_9995 - OBJ
      ?auto_9993 - LOCATION
    )
    :vars
    (
      ?auto_9997 - LOCATION
      ?auto_9996 - CITY
      ?auto_9998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9997 ?auto_9996 ) ( IN-CITY ?auto_9993 ?auto_9996 ) ( not ( = ?auto_9993 ?auto_9997 ) ) ( not ( = ?auto_9994 ?auto_9995 ) ) ( OBJ-AT ?auto_9995 ?auto_9997 ) ( TRUCK-AT ?auto_9998 ?auto_9993 ) ( IN-TRUCK ?auto_9994 ?auto_9998 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9995 ?auto_9993 )
      ( DELIVER-2PKG-VERIFY ?auto_9994 ?auto_9995 ?auto_9993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10000 - OBJ
      ?auto_10001 - OBJ
      ?auto_9999 - LOCATION
    )
    :vars
    (
      ?auto_10003 - LOCATION
      ?auto_10004 - CITY
      ?auto_10002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10003 ?auto_10004 ) ( IN-CITY ?auto_9999 ?auto_10004 ) ( not ( = ?auto_9999 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10000 ) ) ( OBJ-AT ?auto_10000 ?auto_10003 ) ( TRUCK-AT ?auto_10002 ?auto_9999 ) ( IN-TRUCK ?auto_10001 ?auto_10002 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10001 ?auto_10000 ?auto_9999 )
      ( DELIVER-2PKG-VERIFY ?auto_10000 ?auto_10001 ?auto_9999 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10063 - OBJ
      ?auto_10062 - LOCATION
    )
    :vars
    (
      ?auto_10066 - LOCATION
      ?auto_10067 - CITY
      ?auto_10065 - OBJ
      ?auto_10064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10066 ?auto_10067 ) ( IN-CITY ?auto_10062 ?auto_10067 ) ( not ( = ?auto_10062 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10063 ) ) ( OBJ-AT ?auto_10063 ?auto_10066 ) ( IN-TRUCK ?auto_10065 ?auto_10064 ) ( TRUCK-AT ?auto_10064 ?auto_10066 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10064 ?auto_10066 ?auto_10062 ?auto_10067 )
      ( DELIVER-2PKG ?auto_10065 ?auto_10063 ?auto_10062 )
      ( DELIVER-1PKG-VERIFY ?auto_10063 ?auto_10062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10069 - OBJ
      ?auto_10070 - OBJ
      ?auto_10068 - LOCATION
    )
    :vars
    (
      ?auto_10072 - LOCATION
      ?auto_10073 - CITY
      ?auto_10071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10072 ?auto_10073 ) ( IN-CITY ?auto_10068 ?auto_10073 ) ( not ( = ?auto_10068 ?auto_10072 ) ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( OBJ-AT ?auto_10070 ?auto_10072 ) ( IN-TRUCK ?auto_10069 ?auto_10071 ) ( TRUCK-AT ?auto_10071 ?auto_10072 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10070 ?auto_10068 )
      ( DELIVER-2PKG-VERIFY ?auto_10069 ?auto_10070 ?auto_10068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10075 - OBJ
      ?auto_10076 - OBJ
      ?auto_10074 - LOCATION
    )
    :vars
    (
      ?auto_10077 - LOCATION
      ?auto_10079 - CITY
      ?auto_10078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10077 ?auto_10079 ) ( IN-CITY ?auto_10074 ?auto_10079 ) ( not ( = ?auto_10074 ?auto_10077 ) ) ( not ( = ?auto_10076 ?auto_10075 ) ) ( OBJ-AT ?auto_10075 ?auto_10077 ) ( IN-TRUCK ?auto_10076 ?auto_10078 ) ( TRUCK-AT ?auto_10078 ?auto_10077 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10076 ?auto_10075 ?auto_10074 )
      ( DELIVER-2PKG-VERIFY ?auto_10075 ?auto_10076 ?auto_10074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10542 - OBJ
      ?auto_10543 - OBJ
      ?auto_10544 - OBJ
      ?auto_10541 - LOCATION
    )
    :vars
    (
      ?auto_10548 - TRUCK
      ?auto_10547 - LOCATION
      ?auto_10546 - CITY
      ?auto_10545 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10544 ?auto_10548 ) ( TRUCK-AT ?auto_10548 ?auto_10547 ) ( IN-CITY ?auto_10547 ?auto_10546 ) ( IN-CITY ?auto_10541 ?auto_10546 ) ( not ( = ?auto_10541 ?auto_10547 ) ) ( OBJ-AT ?auto_10545 ?auto_10541 ) ( not ( = ?auto_10545 ?auto_10544 ) ) ( OBJ-AT ?auto_10542 ?auto_10541 ) ( OBJ-AT ?auto_10543 ?auto_10541 ) ( not ( = ?auto_10542 ?auto_10543 ) ) ( not ( = ?auto_10542 ?auto_10544 ) ) ( not ( = ?auto_10542 ?auto_10545 ) ) ( not ( = ?auto_10543 ?auto_10544 ) ) ( not ( = ?auto_10543 ?auto_10545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10545 ?auto_10544 ?auto_10541 )
      ( DELIVER-3PKG-VERIFY ?auto_10542 ?auto_10543 ?auto_10544 ?auto_10541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10554 - OBJ
      ?auto_10555 - OBJ
      ?auto_10556 - OBJ
      ?auto_10553 - LOCATION
    )
    :vars
    (
      ?auto_10560 - TRUCK
      ?auto_10559 - LOCATION
      ?auto_10558 - CITY
      ?auto_10557 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10555 ?auto_10560 ) ( TRUCK-AT ?auto_10560 ?auto_10559 ) ( IN-CITY ?auto_10559 ?auto_10558 ) ( IN-CITY ?auto_10553 ?auto_10558 ) ( not ( = ?auto_10553 ?auto_10559 ) ) ( OBJ-AT ?auto_10557 ?auto_10553 ) ( not ( = ?auto_10557 ?auto_10555 ) ) ( OBJ-AT ?auto_10554 ?auto_10553 ) ( OBJ-AT ?auto_10556 ?auto_10553 ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( not ( = ?auto_10554 ?auto_10556 ) ) ( not ( = ?auto_10554 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10556 ?auto_10557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10557 ?auto_10555 ?auto_10553 )
      ( DELIVER-3PKG-VERIFY ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10570 - OBJ
      ?auto_10571 - OBJ
      ?auto_10572 - OBJ
      ?auto_10569 - LOCATION
    )
    :vars
    (
      ?auto_10575 - TRUCK
      ?auto_10574 - LOCATION
      ?auto_10573 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10570 ?auto_10575 ) ( TRUCK-AT ?auto_10575 ?auto_10574 ) ( IN-CITY ?auto_10574 ?auto_10573 ) ( IN-CITY ?auto_10569 ?auto_10573 ) ( not ( = ?auto_10569 ?auto_10574 ) ) ( OBJ-AT ?auto_10572 ?auto_10569 ) ( not ( = ?auto_10572 ?auto_10570 ) ) ( OBJ-AT ?auto_10571 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10571 ?auto_10572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10572 ?auto_10570 ?auto_10569 )
      ( DELIVER-3PKG-VERIFY ?auto_10570 ?auto_10571 ?auto_10572 ?auto_10569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10592 - OBJ
      ?auto_10593 - OBJ
      ?auto_10594 - OBJ
      ?auto_10591 - LOCATION
    )
    :vars
    (
      ?auto_10598 - TRUCK
      ?auto_10597 - LOCATION
      ?auto_10596 - CITY
      ?auto_10595 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10592 ?auto_10598 ) ( TRUCK-AT ?auto_10598 ?auto_10597 ) ( IN-CITY ?auto_10597 ?auto_10596 ) ( IN-CITY ?auto_10591 ?auto_10596 ) ( not ( = ?auto_10591 ?auto_10597 ) ) ( OBJ-AT ?auto_10595 ?auto_10591 ) ( not ( = ?auto_10595 ?auto_10592 ) ) ( OBJ-AT ?auto_10593 ?auto_10591 ) ( OBJ-AT ?auto_10594 ?auto_10591 ) ( not ( = ?auto_10592 ?auto_10593 ) ) ( not ( = ?auto_10592 ?auto_10594 ) ) ( not ( = ?auto_10593 ?auto_10594 ) ) ( not ( = ?auto_10593 ?auto_10595 ) ) ( not ( = ?auto_10594 ?auto_10595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10595 ?auto_10592 ?auto_10591 )
      ( DELIVER-3PKG-VERIFY ?auto_10592 ?auto_10593 ?auto_10594 ?auto_10591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10695 - OBJ
      ?auto_10696 - OBJ
      ?auto_10697 - OBJ
      ?auto_10694 - LOCATION
    )
    :vars
    (
      ?auto_10700 - TRUCK
      ?auto_10698 - LOCATION
      ?auto_10699 - CITY
      ?auto_10701 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10700 ?auto_10698 ) ( IN-CITY ?auto_10698 ?auto_10699 ) ( IN-CITY ?auto_10694 ?auto_10699 ) ( not ( = ?auto_10694 ?auto_10698 ) ) ( OBJ-AT ?auto_10701 ?auto_10694 ) ( not ( = ?auto_10701 ?auto_10697 ) ) ( OBJ-AT ?auto_10697 ?auto_10698 ) ( OBJ-AT ?auto_10695 ?auto_10694 ) ( OBJ-AT ?auto_10696 ?auto_10694 ) ( not ( = ?auto_10695 ?auto_10696 ) ) ( not ( = ?auto_10695 ?auto_10697 ) ) ( not ( = ?auto_10695 ?auto_10701 ) ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10696 ?auto_10701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10701 ?auto_10697 ?auto_10694 )
      ( DELIVER-3PKG-VERIFY ?auto_10695 ?auto_10696 ?auto_10697 ?auto_10694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10707 - OBJ
      ?auto_10708 - OBJ
      ?auto_10709 - OBJ
      ?auto_10706 - LOCATION
    )
    :vars
    (
      ?auto_10712 - TRUCK
      ?auto_10710 - LOCATION
      ?auto_10711 - CITY
      ?auto_10713 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10712 ?auto_10710 ) ( IN-CITY ?auto_10710 ?auto_10711 ) ( IN-CITY ?auto_10706 ?auto_10711 ) ( not ( = ?auto_10706 ?auto_10710 ) ) ( OBJ-AT ?auto_10713 ?auto_10706 ) ( not ( = ?auto_10713 ?auto_10708 ) ) ( OBJ-AT ?auto_10708 ?auto_10710 ) ( OBJ-AT ?auto_10707 ?auto_10706 ) ( OBJ-AT ?auto_10709 ?auto_10706 ) ( not ( = ?auto_10707 ?auto_10708 ) ) ( not ( = ?auto_10707 ?auto_10709 ) ) ( not ( = ?auto_10707 ?auto_10713 ) ) ( not ( = ?auto_10708 ?auto_10709 ) ) ( not ( = ?auto_10709 ?auto_10713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10713 ?auto_10708 ?auto_10706 )
      ( DELIVER-3PKG-VERIFY ?auto_10707 ?auto_10708 ?auto_10709 ?auto_10706 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10745 - OBJ
      ?auto_10746 - OBJ
      ?auto_10747 - OBJ
      ?auto_10744 - LOCATION
    )
    :vars
    (
      ?auto_10750 - TRUCK
      ?auto_10748 - LOCATION
      ?auto_10749 - CITY
      ?auto_10751 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10750 ?auto_10748 ) ( IN-CITY ?auto_10748 ?auto_10749 ) ( IN-CITY ?auto_10744 ?auto_10749 ) ( not ( = ?auto_10744 ?auto_10748 ) ) ( OBJ-AT ?auto_10751 ?auto_10744 ) ( not ( = ?auto_10751 ?auto_10745 ) ) ( OBJ-AT ?auto_10745 ?auto_10748 ) ( OBJ-AT ?auto_10746 ?auto_10744 ) ( OBJ-AT ?auto_10747 ?auto_10744 ) ( not ( = ?auto_10745 ?auto_10746 ) ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10751 ) ) ( not ( = ?auto_10747 ?auto_10751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10751 ?auto_10745 ?auto_10744 )
      ( DELIVER-3PKG-VERIFY ?auto_10745 ?auto_10746 ?auto_10747 ?auto_10744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10815 - OBJ
      ?auto_10816 - OBJ
      ?auto_10817 - OBJ
      ?auto_10814 - LOCATION
    )
    :vars
    (
      ?auto_10819 - LOCATION
      ?auto_10818 - CITY
      ?auto_10820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10819 ?auto_10818 ) ( IN-CITY ?auto_10814 ?auto_10818 ) ( not ( = ?auto_10814 ?auto_10819 ) ) ( OBJ-AT ?auto_10815 ?auto_10814 ) ( not ( = ?auto_10815 ?auto_10817 ) ) ( OBJ-AT ?auto_10817 ?auto_10819 ) ( TRUCK-AT ?auto_10820 ?auto_10814 ) ( OBJ-AT ?auto_10816 ?auto_10814 ) ( not ( = ?auto_10815 ?auto_10816 ) ) ( not ( = ?auto_10816 ?auto_10817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10815 ?auto_10817 ?auto_10814 )
      ( DELIVER-3PKG-VERIFY ?auto_10815 ?auto_10816 ?auto_10817 ?auto_10814 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10848 - OBJ
      ?auto_10849 - OBJ
      ?auto_10850 - OBJ
      ?auto_10847 - LOCATION
    )
    :vars
    (
      ?auto_10852 - LOCATION
      ?auto_10851 - CITY
      ?auto_10854 - OBJ
      ?auto_10853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10852 ?auto_10851 ) ( IN-CITY ?auto_10847 ?auto_10851 ) ( not ( = ?auto_10847 ?auto_10852 ) ) ( OBJ-AT ?auto_10854 ?auto_10847 ) ( not ( = ?auto_10854 ?auto_10850 ) ) ( OBJ-AT ?auto_10850 ?auto_10852 ) ( TRUCK-AT ?auto_10853 ?auto_10847 ) ( OBJ-AT ?auto_10848 ?auto_10847 ) ( OBJ-AT ?auto_10849 ?auto_10847 ) ( not ( = ?auto_10848 ?auto_10849 ) ) ( not ( = ?auto_10848 ?auto_10850 ) ) ( not ( = ?auto_10848 ?auto_10854 ) ) ( not ( = ?auto_10849 ?auto_10850 ) ) ( not ( = ?auto_10849 ?auto_10854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10854 ?auto_10850 ?auto_10847 )
      ( DELIVER-3PKG-VERIFY ?auto_10848 ?auto_10849 ?auto_10850 ?auto_10847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10860 - OBJ
      ?auto_10861 - OBJ
      ?auto_10862 - OBJ
      ?auto_10859 - LOCATION
    )
    :vars
    (
      ?auto_10864 - LOCATION
      ?auto_10863 - CITY
      ?auto_10866 - OBJ
      ?auto_10865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10864 ?auto_10863 ) ( IN-CITY ?auto_10859 ?auto_10863 ) ( not ( = ?auto_10859 ?auto_10864 ) ) ( OBJ-AT ?auto_10866 ?auto_10859 ) ( not ( = ?auto_10866 ?auto_10861 ) ) ( OBJ-AT ?auto_10861 ?auto_10864 ) ( TRUCK-AT ?auto_10865 ?auto_10859 ) ( OBJ-AT ?auto_10860 ?auto_10859 ) ( OBJ-AT ?auto_10862 ?auto_10859 ) ( not ( = ?auto_10860 ?auto_10861 ) ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10860 ?auto_10866 ) ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10862 ?auto_10866 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10866 ?auto_10861 ?auto_10859 )
      ( DELIVER-3PKG-VERIFY ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10876 - OBJ
      ?auto_10877 - OBJ
      ?auto_10878 - OBJ
      ?auto_10875 - LOCATION
    )
    :vars
    (
      ?auto_10880 - LOCATION
      ?auto_10879 - CITY
      ?auto_10881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10880 ?auto_10879 ) ( IN-CITY ?auto_10875 ?auto_10879 ) ( not ( = ?auto_10875 ?auto_10880 ) ) ( OBJ-AT ?auto_10877 ?auto_10875 ) ( not ( = ?auto_10877 ?auto_10876 ) ) ( OBJ-AT ?auto_10876 ?auto_10880 ) ( TRUCK-AT ?auto_10881 ?auto_10875 ) ( OBJ-AT ?auto_10878 ?auto_10875 ) ( not ( = ?auto_10876 ?auto_10878 ) ) ( not ( = ?auto_10877 ?auto_10878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10877 ?auto_10876 ?auto_10875 )
      ( DELIVER-3PKG-VERIFY ?auto_10876 ?auto_10877 ?auto_10878 ?auto_10875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10898 - OBJ
      ?auto_10899 - OBJ
      ?auto_10900 - OBJ
      ?auto_10897 - LOCATION
    )
    :vars
    (
      ?auto_10902 - LOCATION
      ?auto_10901 - CITY
      ?auto_10904 - OBJ
      ?auto_10903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10902 ?auto_10901 ) ( IN-CITY ?auto_10897 ?auto_10901 ) ( not ( = ?auto_10897 ?auto_10902 ) ) ( OBJ-AT ?auto_10904 ?auto_10897 ) ( not ( = ?auto_10904 ?auto_10898 ) ) ( OBJ-AT ?auto_10898 ?auto_10902 ) ( TRUCK-AT ?auto_10903 ?auto_10897 ) ( OBJ-AT ?auto_10899 ?auto_10897 ) ( OBJ-AT ?auto_10900 ?auto_10897 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10904 ) ) ( not ( = ?auto_10900 ?auto_10904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10904 ?auto_10898 ?auto_10897 )
      ( DELIVER-3PKG-VERIFY ?auto_10898 ?auto_10899 ?auto_10900 ?auto_10897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10980 - OBJ
      ?auto_10981 - OBJ
      ?auto_10982 - OBJ
      ?auto_10979 - LOCATION
    )
    :vars
    (
      ?auto_10985 - LOCATION
      ?auto_10984 - CITY
      ?auto_10983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10985 ?auto_10984 ) ( IN-CITY ?auto_10979 ?auto_10984 ) ( not ( = ?auto_10979 ?auto_10985 ) ) ( OBJ-AT ?auto_10982 ?auto_10979 ) ( not ( = ?auto_10982 ?auto_10981 ) ) ( OBJ-AT ?auto_10981 ?auto_10985 ) ( TRUCK-AT ?auto_10983 ?auto_10979 ) ( OBJ-AT ?auto_10980 ?auto_10979 ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( not ( = ?auto_10980 ?auto_10982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10982 ?auto_10981 ?auto_10979 )
      ( DELIVER-3PKG-VERIFY ?auto_10980 ?auto_10981 ?auto_10982 ?auto_10979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11149 - OBJ
      ?auto_11150 - OBJ
      ?auto_11151 - OBJ
      ?auto_11148 - LOCATION
    )
    :vars
    (
      ?auto_11152 - TRUCK
      ?auto_11154 - LOCATION
      ?auto_11153 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11152 ?auto_11154 ) ( IN-CITY ?auto_11154 ?auto_11153 ) ( IN-CITY ?auto_11148 ?auto_11153 ) ( not ( = ?auto_11148 ?auto_11154 ) ) ( OBJ-AT ?auto_11151 ?auto_11148 ) ( not ( = ?auto_11151 ?auto_11150 ) ) ( OBJ-AT ?auto_11150 ?auto_11154 ) ( OBJ-AT ?auto_11149 ?auto_11148 ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11151 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11151 ?auto_11150 ?auto_11148 )
      ( DELIVER-3PKG-VERIFY ?auto_11149 ?auto_11150 ?auto_11151 ?auto_11148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11208 - OBJ
      ?auto_11209 - OBJ
      ?auto_11210 - OBJ
      ?auto_11207 - LOCATION
    )
    :vars
    (
      ?auto_11211 - TRUCK
      ?auto_11213 - LOCATION
      ?auto_11212 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11211 ?auto_11213 ) ( IN-CITY ?auto_11213 ?auto_11212 ) ( IN-CITY ?auto_11207 ?auto_11212 ) ( not ( = ?auto_11207 ?auto_11213 ) ) ( OBJ-AT ?auto_11210 ?auto_11207 ) ( not ( = ?auto_11210 ?auto_11208 ) ) ( OBJ-AT ?auto_11208 ?auto_11213 ) ( OBJ-AT ?auto_11209 ?auto_11207 ) ( not ( = ?auto_11208 ?auto_11209 ) ) ( not ( = ?auto_11209 ?auto_11210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11210 ?auto_11208 ?auto_11207 )
      ( DELIVER-3PKG-VERIFY ?auto_11208 ?auto_11209 ?auto_11210 ?auto_11207 ) )
  )

)

