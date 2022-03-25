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
      ?auto_9594 - OBJ
      ?auto_9593 - LOCATION
    )
    :vars
    (
      ?auto_9595 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9595 ?auto_9593 ) ( IN-TRUCK ?auto_9594 ?auto_9595 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9594 ?auto_9595 ?auto_9593 )
      ( DELIVER-1PKG-VERIFY ?auto_9594 ?auto_9593 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9606 - OBJ
      ?auto_9605 - LOCATION
    )
    :vars
    (
      ?auto_9607 - TRUCK
      ?auto_9608 - LOCATION
      ?auto_9609 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9606 ?auto_9607 ) ( TRUCK-AT ?auto_9607 ?auto_9608 ) ( IN-CITY ?auto_9608 ?auto_9609 ) ( IN-CITY ?auto_9605 ?auto_9609 ) ( not ( = ?auto_9605 ?auto_9608 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9607 ?auto_9608 ?auto_9605 ?auto_9609 )
      ( DELIVER-1PKG ?auto_9606 ?auto_9605 )
      ( DELIVER-1PKG-VERIFY ?auto_9606 ?auto_9605 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9624 - OBJ
      ?auto_9623 - LOCATION
    )
    :vars
    (
      ?auto_9625 - TRUCK
      ?auto_9626 - LOCATION
      ?auto_9627 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9625 ?auto_9626 ) ( IN-CITY ?auto_9626 ?auto_9627 ) ( IN-CITY ?auto_9623 ?auto_9627 ) ( not ( = ?auto_9623 ?auto_9626 ) ) ( OBJ-AT ?auto_9624 ?auto_9626 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9624 ?auto_9625 ?auto_9626 )
      ( DELIVER-1PKG ?auto_9624 ?auto_9623 )
      ( DELIVER-1PKG-VERIFY ?auto_9624 ?auto_9623 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9642 - OBJ
      ?auto_9641 - LOCATION
    )
    :vars
    (
      ?auto_9644 - LOCATION
      ?auto_9645 - CITY
      ?auto_9643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9644 ?auto_9645 ) ( IN-CITY ?auto_9641 ?auto_9645 ) ( not ( = ?auto_9641 ?auto_9644 ) ) ( OBJ-AT ?auto_9642 ?auto_9644 ) ( TRUCK-AT ?auto_9643 ?auto_9641 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9643 ?auto_9641 ?auto_9644 ?auto_9645 )
      ( DELIVER-1PKG ?auto_9642 ?auto_9641 )
      ( DELIVER-1PKG-VERIFY ?auto_9642 ?auto_9641 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9702 - OBJ
      ?auto_9703 - OBJ
      ?auto_9701 - LOCATION
    )
    :vars
    (
      ?auto_9704 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9704 ?auto_9701 ) ( IN-TRUCK ?auto_9703 ?auto_9704 ) ( OBJ-AT ?auto_9702 ?auto_9701 ) ( not ( = ?auto_9702 ?auto_9703 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9703 ?auto_9701 )
      ( DELIVER-2PKG-VERIFY ?auto_9702 ?auto_9703 ?auto_9701 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9706 - OBJ
      ?auto_9707 - OBJ
      ?auto_9705 - LOCATION
    )
    :vars
    (
      ?auto_9708 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9708 ?auto_9705 ) ( IN-TRUCK ?auto_9706 ?auto_9708 ) ( OBJ-AT ?auto_9707 ?auto_9705 ) ( not ( = ?auto_9706 ?auto_9707 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9706 ?auto_9705 )
      ( DELIVER-2PKG-VERIFY ?auto_9706 ?auto_9707 ?auto_9705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9714 - OBJ
      ?auto_9715 - OBJ
      ?auto_9716 - OBJ
      ?auto_9713 - LOCATION
    )
    :vars
    (
      ?auto_9717 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9717 ?auto_9713 ) ( IN-TRUCK ?auto_9716 ?auto_9717 ) ( OBJ-AT ?auto_9714 ?auto_9713 ) ( OBJ-AT ?auto_9715 ?auto_9713 ) ( not ( = ?auto_9714 ?auto_9715 ) ) ( not ( = ?auto_9714 ?auto_9716 ) ) ( not ( = ?auto_9715 ?auto_9716 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9716 ?auto_9713 )
      ( DELIVER-3PKG-VERIFY ?auto_9714 ?auto_9715 ?auto_9716 ?auto_9713 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9719 - OBJ
      ?auto_9720 - OBJ
      ?auto_9721 - OBJ
      ?auto_9718 - LOCATION
    )
    :vars
    (
      ?auto_9722 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9722 ?auto_9718 ) ( IN-TRUCK ?auto_9720 ?auto_9722 ) ( OBJ-AT ?auto_9719 ?auto_9718 ) ( OBJ-AT ?auto_9721 ?auto_9718 ) ( not ( = ?auto_9719 ?auto_9720 ) ) ( not ( = ?auto_9719 ?auto_9721 ) ) ( not ( = ?auto_9720 ?auto_9721 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9720 ?auto_9718 )
      ( DELIVER-3PKG-VERIFY ?auto_9719 ?auto_9720 ?auto_9721 ?auto_9718 ) )
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
    ( and ( TRUCK-AT ?auto_9732 ?auto_9728 ) ( IN-TRUCK ?auto_9729 ?auto_9732 ) ( OBJ-AT ?auto_9730 ?auto_9728 ) ( OBJ-AT ?auto_9731 ?auto_9728 ) ( not ( = ?auto_9729 ?auto_9730 ) ) ( not ( = ?auto_9729 ?auto_9731 ) ) ( not ( = ?auto_9730 ?auto_9731 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9729 ?auto_9728 )
      ( DELIVER-3PKG-VERIFY ?auto_9729 ?auto_9730 ?auto_9731 ?auto_9728 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9754 - OBJ
      ?auto_9755 - OBJ
      ?auto_9753 - LOCATION
    )
    :vars
    (
      ?auto_9757 - TRUCK
      ?auto_9758 - LOCATION
      ?auto_9756 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9755 ?auto_9757 ) ( TRUCK-AT ?auto_9757 ?auto_9758 ) ( IN-CITY ?auto_9758 ?auto_9756 ) ( IN-CITY ?auto_9753 ?auto_9756 ) ( not ( = ?auto_9753 ?auto_9758 ) ) ( OBJ-AT ?auto_9754 ?auto_9753 ) ( not ( = ?auto_9754 ?auto_9755 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9755 ?auto_9753 )
      ( DELIVER-2PKG-VERIFY ?auto_9754 ?auto_9755 ?auto_9753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9760 - OBJ
      ?auto_9761 - OBJ
      ?auto_9759 - LOCATION
    )
    :vars
    (
      ?auto_9764 - TRUCK
      ?auto_9762 - LOCATION
      ?auto_9763 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9760 ?auto_9764 ) ( TRUCK-AT ?auto_9764 ?auto_9762 ) ( IN-CITY ?auto_9762 ?auto_9763 ) ( IN-CITY ?auto_9759 ?auto_9763 ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( OBJ-AT ?auto_9761 ?auto_9759 ) ( not ( = ?auto_9761 ?auto_9760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9761 ?auto_9760 ?auto_9759 )
      ( DELIVER-2PKG-VERIFY ?auto_9760 ?auto_9761 ?auto_9759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9773 - OBJ
      ?auto_9774 - OBJ
      ?auto_9775 - OBJ
      ?auto_9772 - LOCATION
    )
    :vars
    (
      ?auto_9778 - TRUCK
      ?auto_9776 - LOCATION
      ?auto_9777 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9775 ?auto_9778 ) ( TRUCK-AT ?auto_9778 ?auto_9776 ) ( IN-CITY ?auto_9776 ?auto_9777 ) ( IN-CITY ?auto_9772 ?auto_9777 ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( OBJ-AT ?auto_9774 ?auto_9772 ) ( not ( = ?auto_9774 ?auto_9775 ) ) ( OBJ-AT ?auto_9773 ?auto_9772 ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( not ( = ?auto_9773 ?auto_9775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9774 ?auto_9775 ?auto_9772 )
      ( DELIVER-3PKG-VERIFY ?auto_9773 ?auto_9774 ?auto_9775 ?auto_9772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9780 - OBJ
      ?auto_9781 - OBJ
      ?auto_9782 - OBJ
      ?auto_9779 - LOCATION
    )
    :vars
    (
      ?auto_9785 - TRUCK
      ?auto_9783 - LOCATION
      ?auto_9784 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9781 ?auto_9785 ) ( TRUCK-AT ?auto_9785 ?auto_9783 ) ( IN-CITY ?auto_9783 ?auto_9784 ) ( IN-CITY ?auto_9779 ?auto_9784 ) ( not ( = ?auto_9779 ?auto_9783 ) ) ( OBJ-AT ?auto_9780 ?auto_9779 ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( OBJ-AT ?auto_9782 ?auto_9779 ) ( not ( = ?auto_9780 ?auto_9782 ) ) ( not ( = ?auto_9781 ?auto_9782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9780 ?auto_9781 ?auto_9779 )
      ( DELIVER-3PKG-VERIFY ?auto_9780 ?auto_9781 ?auto_9782 ?auto_9779 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9794 - OBJ
      ?auto_9795 - OBJ
      ?auto_9796 - OBJ
      ?auto_9793 - LOCATION
    )
    :vars
    (
      ?auto_9799 - TRUCK
      ?auto_9797 - LOCATION
      ?auto_9798 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9794 ?auto_9799 ) ( TRUCK-AT ?auto_9799 ?auto_9797 ) ( IN-CITY ?auto_9797 ?auto_9798 ) ( IN-CITY ?auto_9793 ?auto_9798 ) ( not ( = ?auto_9793 ?auto_9797 ) ) ( OBJ-AT ?auto_9795 ?auto_9793 ) ( not ( = ?auto_9795 ?auto_9794 ) ) ( OBJ-AT ?auto_9796 ?auto_9793 ) ( not ( = ?auto_9794 ?auto_9796 ) ) ( not ( = ?auto_9795 ?auto_9796 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9795 ?auto_9794 ?auto_9793 )
      ( DELIVER-3PKG-VERIFY ?auto_9794 ?auto_9795 ?auto_9796 ?auto_9793 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9823 - OBJ
      ?auto_9822 - LOCATION
    )
    :vars
    (
      ?auto_9827 - TRUCK
      ?auto_9824 - LOCATION
      ?auto_9826 - CITY
      ?auto_9825 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9827 ?auto_9824 ) ( IN-CITY ?auto_9824 ?auto_9826 ) ( IN-CITY ?auto_9822 ?auto_9826 ) ( not ( = ?auto_9822 ?auto_9824 ) ) ( OBJ-AT ?auto_9825 ?auto_9822 ) ( not ( = ?auto_9825 ?auto_9823 ) ) ( OBJ-AT ?auto_9823 ?auto_9824 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9823 ?auto_9827 ?auto_9824 )
      ( DELIVER-2PKG ?auto_9825 ?auto_9823 ?auto_9822 )
      ( DELIVER-1PKG-VERIFY ?auto_9823 ?auto_9822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9829 - OBJ
      ?auto_9830 - OBJ
      ?auto_9828 - LOCATION
    )
    :vars
    (
      ?auto_9831 - TRUCK
      ?auto_9832 - LOCATION
      ?auto_9833 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9831 ?auto_9832 ) ( IN-CITY ?auto_9832 ?auto_9833 ) ( IN-CITY ?auto_9828 ?auto_9833 ) ( not ( = ?auto_9828 ?auto_9832 ) ) ( OBJ-AT ?auto_9829 ?auto_9828 ) ( not ( = ?auto_9829 ?auto_9830 ) ) ( OBJ-AT ?auto_9830 ?auto_9832 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9830 ?auto_9828 )
      ( DELIVER-2PKG-VERIFY ?auto_9829 ?auto_9830 ?auto_9828 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9835 - OBJ
      ?auto_9836 - OBJ
      ?auto_9834 - LOCATION
    )
    :vars
    (
      ?auto_9837 - TRUCK
      ?auto_9839 - LOCATION
      ?auto_9838 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9837 ?auto_9839 ) ( IN-CITY ?auto_9839 ?auto_9838 ) ( IN-CITY ?auto_9834 ?auto_9838 ) ( not ( = ?auto_9834 ?auto_9839 ) ) ( OBJ-AT ?auto_9836 ?auto_9834 ) ( not ( = ?auto_9836 ?auto_9835 ) ) ( OBJ-AT ?auto_9835 ?auto_9839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9836 ?auto_9835 ?auto_9834 )
      ( DELIVER-2PKG-VERIFY ?auto_9835 ?auto_9836 ?auto_9834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9848 - OBJ
      ?auto_9849 - OBJ
      ?auto_9850 - OBJ
      ?auto_9847 - LOCATION
    )
    :vars
    (
      ?auto_9851 - TRUCK
      ?auto_9853 - LOCATION
      ?auto_9852 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9851 ?auto_9853 ) ( IN-CITY ?auto_9853 ?auto_9852 ) ( IN-CITY ?auto_9847 ?auto_9852 ) ( not ( = ?auto_9847 ?auto_9853 ) ) ( OBJ-AT ?auto_9848 ?auto_9847 ) ( not ( = ?auto_9848 ?auto_9850 ) ) ( OBJ-AT ?auto_9850 ?auto_9853 ) ( OBJ-AT ?auto_9849 ?auto_9847 ) ( not ( = ?auto_9848 ?auto_9849 ) ) ( not ( = ?auto_9849 ?auto_9850 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9848 ?auto_9850 ?auto_9847 )
      ( DELIVER-3PKG-VERIFY ?auto_9848 ?auto_9849 ?auto_9850 ?auto_9847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9855 - OBJ
      ?auto_9856 - OBJ
      ?auto_9857 - OBJ
      ?auto_9854 - LOCATION
    )
    :vars
    (
      ?auto_9858 - TRUCK
      ?auto_9860 - LOCATION
      ?auto_9859 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9858 ?auto_9860 ) ( IN-CITY ?auto_9860 ?auto_9859 ) ( IN-CITY ?auto_9854 ?auto_9859 ) ( not ( = ?auto_9854 ?auto_9860 ) ) ( OBJ-AT ?auto_9855 ?auto_9854 ) ( not ( = ?auto_9855 ?auto_9856 ) ) ( OBJ-AT ?auto_9856 ?auto_9860 ) ( OBJ-AT ?auto_9857 ?auto_9854 ) ( not ( = ?auto_9855 ?auto_9857 ) ) ( not ( = ?auto_9856 ?auto_9857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9855 ?auto_9856 ?auto_9854 )
      ( DELIVER-3PKG-VERIFY ?auto_9855 ?auto_9856 ?auto_9857 ?auto_9854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9869 - OBJ
      ?auto_9870 - OBJ
      ?auto_9871 - OBJ
      ?auto_9868 - LOCATION
    )
    :vars
    (
      ?auto_9872 - TRUCK
      ?auto_9874 - LOCATION
      ?auto_9873 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9872 ?auto_9874 ) ( IN-CITY ?auto_9874 ?auto_9873 ) ( IN-CITY ?auto_9868 ?auto_9873 ) ( not ( = ?auto_9868 ?auto_9874 ) ) ( OBJ-AT ?auto_9870 ?auto_9868 ) ( not ( = ?auto_9870 ?auto_9869 ) ) ( OBJ-AT ?auto_9869 ?auto_9874 ) ( OBJ-AT ?auto_9871 ?auto_9868 ) ( not ( = ?auto_9869 ?auto_9871 ) ) ( not ( = ?auto_9870 ?auto_9871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9870 ?auto_9869 ?auto_9868 )
      ( DELIVER-3PKG-VERIFY ?auto_9869 ?auto_9870 ?auto_9871 ?auto_9868 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9898 - OBJ
      ?auto_9897 - LOCATION
    )
    :vars
    (
      ?auto_9902 - LOCATION
      ?auto_9900 - CITY
      ?auto_9901 - OBJ
      ?auto_9899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9902 ?auto_9900 ) ( IN-CITY ?auto_9897 ?auto_9900 ) ( not ( = ?auto_9897 ?auto_9902 ) ) ( OBJ-AT ?auto_9901 ?auto_9897 ) ( not ( = ?auto_9901 ?auto_9898 ) ) ( OBJ-AT ?auto_9898 ?auto_9902 ) ( TRUCK-AT ?auto_9899 ?auto_9897 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9899 ?auto_9897 ?auto_9902 ?auto_9900 )
      ( DELIVER-2PKG ?auto_9901 ?auto_9898 ?auto_9897 )
      ( DELIVER-1PKG-VERIFY ?auto_9898 ?auto_9897 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9904 - OBJ
      ?auto_9905 - OBJ
      ?auto_9903 - LOCATION
    )
    :vars
    (
      ?auto_9906 - LOCATION
      ?auto_9908 - CITY
      ?auto_9907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9906 ?auto_9908 ) ( IN-CITY ?auto_9903 ?auto_9908 ) ( not ( = ?auto_9903 ?auto_9906 ) ) ( OBJ-AT ?auto_9904 ?auto_9903 ) ( not ( = ?auto_9904 ?auto_9905 ) ) ( OBJ-AT ?auto_9905 ?auto_9906 ) ( TRUCK-AT ?auto_9907 ?auto_9903 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9905 ?auto_9903 )
      ( DELIVER-2PKG-VERIFY ?auto_9904 ?auto_9905 ?auto_9903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9910 - OBJ
      ?auto_9911 - OBJ
      ?auto_9909 - LOCATION
    )
    :vars
    (
      ?auto_9913 - LOCATION
      ?auto_9912 - CITY
      ?auto_9914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9913 ?auto_9912 ) ( IN-CITY ?auto_9909 ?auto_9912 ) ( not ( = ?auto_9909 ?auto_9913 ) ) ( OBJ-AT ?auto_9911 ?auto_9909 ) ( not ( = ?auto_9911 ?auto_9910 ) ) ( OBJ-AT ?auto_9910 ?auto_9913 ) ( TRUCK-AT ?auto_9914 ?auto_9909 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9911 ?auto_9910 ?auto_9909 )
      ( DELIVER-2PKG-VERIFY ?auto_9910 ?auto_9911 ?auto_9909 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9923 - OBJ
      ?auto_9924 - OBJ
      ?auto_9925 - OBJ
      ?auto_9922 - LOCATION
    )
    :vars
    (
      ?auto_9927 - LOCATION
      ?auto_9926 - CITY
      ?auto_9928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9927 ?auto_9926 ) ( IN-CITY ?auto_9922 ?auto_9926 ) ( not ( = ?auto_9922 ?auto_9927 ) ) ( OBJ-AT ?auto_9924 ?auto_9922 ) ( not ( = ?auto_9924 ?auto_9925 ) ) ( OBJ-AT ?auto_9925 ?auto_9927 ) ( TRUCK-AT ?auto_9928 ?auto_9922 ) ( OBJ-AT ?auto_9923 ?auto_9922 ) ( not ( = ?auto_9923 ?auto_9924 ) ) ( not ( = ?auto_9923 ?auto_9925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9924 ?auto_9925 ?auto_9922 )
      ( DELIVER-3PKG-VERIFY ?auto_9923 ?auto_9924 ?auto_9925 ?auto_9922 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9930 - OBJ
      ?auto_9931 - OBJ
      ?auto_9932 - OBJ
      ?auto_9929 - LOCATION
    )
    :vars
    (
      ?auto_9934 - LOCATION
      ?auto_9933 - CITY
      ?auto_9935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9934 ?auto_9933 ) ( IN-CITY ?auto_9929 ?auto_9933 ) ( not ( = ?auto_9929 ?auto_9934 ) ) ( OBJ-AT ?auto_9932 ?auto_9929 ) ( not ( = ?auto_9932 ?auto_9931 ) ) ( OBJ-AT ?auto_9931 ?auto_9934 ) ( TRUCK-AT ?auto_9935 ?auto_9929 ) ( OBJ-AT ?auto_9930 ?auto_9929 ) ( not ( = ?auto_9930 ?auto_9931 ) ) ( not ( = ?auto_9930 ?auto_9932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9932 ?auto_9931 ?auto_9929 )
      ( DELIVER-3PKG-VERIFY ?auto_9930 ?auto_9931 ?auto_9932 ?auto_9929 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9944 - OBJ
      ?auto_9945 - OBJ
      ?auto_9946 - OBJ
      ?auto_9943 - LOCATION
    )
    :vars
    (
      ?auto_9948 - LOCATION
      ?auto_9947 - CITY
      ?auto_9949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9948 ?auto_9947 ) ( IN-CITY ?auto_9943 ?auto_9947 ) ( not ( = ?auto_9943 ?auto_9948 ) ) ( OBJ-AT ?auto_9945 ?auto_9943 ) ( not ( = ?auto_9945 ?auto_9944 ) ) ( OBJ-AT ?auto_9944 ?auto_9948 ) ( TRUCK-AT ?auto_9949 ?auto_9943 ) ( OBJ-AT ?auto_9946 ?auto_9943 ) ( not ( = ?auto_9944 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9945 ?auto_9944 ?auto_9943 )
      ( DELIVER-3PKG-VERIFY ?auto_9944 ?auto_9945 ?auto_9946 ?auto_9943 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9973 - OBJ
      ?auto_9972 - LOCATION
    )
    :vars
    (
      ?auto_9975 - LOCATION
      ?auto_9974 - CITY
      ?auto_9977 - OBJ
      ?auto_9976 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9975 ?auto_9974 ) ( IN-CITY ?auto_9972 ?auto_9974 ) ( not ( = ?auto_9972 ?auto_9975 ) ) ( not ( = ?auto_9977 ?auto_9973 ) ) ( OBJ-AT ?auto_9973 ?auto_9975 ) ( TRUCK-AT ?auto_9976 ?auto_9972 ) ( IN-TRUCK ?auto_9977 ?auto_9976 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9977 ?auto_9972 )
      ( DELIVER-2PKG ?auto_9977 ?auto_9973 ?auto_9972 )
      ( DELIVER-1PKG-VERIFY ?auto_9973 ?auto_9972 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9979 - OBJ
      ?auto_9980 - OBJ
      ?auto_9978 - LOCATION
    )
    :vars
    (
      ?auto_9982 - LOCATION
      ?auto_9981 - CITY
      ?auto_9983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9982 ?auto_9981 ) ( IN-CITY ?auto_9978 ?auto_9981 ) ( not ( = ?auto_9978 ?auto_9982 ) ) ( not ( = ?auto_9979 ?auto_9980 ) ) ( OBJ-AT ?auto_9980 ?auto_9982 ) ( TRUCK-AT ?auto_9983 ?auto_9978 ) ( IN-TRUCK ?auto_9979 ?auto_9983 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9980 ?auto_9978 )
      ( DELIVER-2PKG-VERIFY ?auto_9979 ?auto_9980 ?auto_9978 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9985 - OBJ
      ?auto_9986 - OBJ
      ?auto_9984 - LOCATION
    )
    :vars
    (
      ?auto_9987 - LOCATION
      ?auto_9989 - CITY
      ?auto_9988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9987 ?auto_9989 ) ( IN-CITY ?auto_9984 ?auto_9989 ) ( not ( = ?auto_9984 ?auto_9987 ) ) ( not ( = ?auto_9986 ?auto_9985 ) ) ( OBJ-AT ?auto_9985 ?auto_9987 ) ( TRUCK-AT ?auto_9988 ?auto_9984 ) ( IN-TRUCK ?auto_9986 ?auto_9988 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9986 ?auto_9985 ?auto_9984 )
      ( DELIVER-2PKG-VERIFY ?auto_9985 ?auto_9986 ?auto_9984 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10048 - OBJ
      ?auto_10047 - LOCATION
    )
    :vars
    (
      ?auto_10049 - LOCATION
      ?auto_10051 - CITY
      ?auto_10052 - OBJ
      ?auto_10050 - TRUCK
      ?auto_10053 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10049 ?auto_10051 ) ( IN-CITY ?auto_10047 ?auto_10051 ) ( not ( = ?auto_10047 ?auto_10049 ) ) ( not ( = ?auto_10052 ?auto_10048 ) ) ( OBJ-AT ?auto_10048 ?auto_10049 ) ( IN-TRUCK ?auto_10052 ?auto_10050 ) ( TRUCK-AT ?auto_10050 ?auto_10053 ) ( IN-CITY ?auto_10053 ?auto_10051 ) ( not ( = ?auto_10047 ?auto_10053 ) ) ( not ( = ?auto_10049 ?auto_10053 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10050 ?auto_10053 ?auto_10047 ?auto_10051 )
      ( DELIVER-2PKG ?auto_10052 ?auto_10048 ?auto_10047 )
      ( DELIVER-1PKG-VERIFY ?auto_10048 ?auto_10047 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10055 - OBJ
      ?auto_10056 - OBJ
      ?auto_10054 - LOCATION
    )
    :vars
    (
      ?auto_10057 - LOCATION
      ?auto_10058 - CITY
      ?auto_10060 - TRUCK
      ?auto_10059 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10057 ?auto_10058 ) ( IN-CITY ?auto_10054 ?auto_10058 ) ( not ( = ?auto_10054 ?auto_10057 ) ) ( not ( = ?auto_10055 ?auto_10056 ) ) ( OBJ-AT ?auto_10056 ?auto_10057 ) ( IN-TRUCK ?auto_10055 ?auto_10060 ) ( TRUCK-AT ?auto_10060 ?auto_10059 ) ( IN-CITY ?auto_10059 ?auto_10058 ) ( not ( = ?auto_10054 ?auto_10059 ) ) ( not ( = ?auto_10057 ?auto_10059 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10056 ?auto_10054 )
      ( DELIVER-2PKG-VERIFY ?auto_10055 ?auto_10056 ?auto_10054 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10062 - OBJ
      ?auto_10063 - OBJ
      ?auto_10061 - LOCATION
    )
    :vars
    (
      ?auto_10065 - LOCATION
      ?auto_10064 - CITY
      ?auto_10067 - TRUCK
      ?auto_10066 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10065 ?auto_10064 ) ( IN-CITY ?auto_10061 ?auto_10064 ) ( not ( = ?auto_10061 ?auto_10065 ) ) ( not ( = ?auto_10063 ?auto_10062 ) ) ( OBJ-AT ?auto_10062 ?auto_10065 ) ( IN-TRUCK ?auto_10063 ?auto_10067 ) ( TRUCK-AT ?auto_10067 ?auto_10066 ) ( IN-CITY ?auto_10066 ?auto_10064 ) ( not ( = ?auto_10061 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10063 ?auto_10062 ?auto_10061 )
      ( DELIVER-2PKG-VERIFY ?auto_10062 ?auto_10063 ?auto_10061 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10134 - OBJ
      ?auto_10133 - LOCATION
    )
    :vars
    (
      ?auto_10137 - LOCATION
      ?auto_10135 - CITY
      ?auto_10136 - OBJ
      ?auto_10139 - TRUCK
      ?auto_10138 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10137 ?auto_10135 ) ( IN-CITY ?auto_10133 ?auto_10135 ) ( not ( = ?auto_10133 ?auto_10137 ) ) ( not ( = ?auto_10136 ?auto_10134 ) ) ( OBJ-AT ?auto_10134 ?auto_10137 ) ( TRUCK-AT ?auto_10139 ?auto_10138 ) ( IN-CITY ?auto_10138 ?auto_10135 ) ( not ( = ?auto_10133 ?auto_10138 ) ) ( not ( = ?auto_10137 ?auto_10138 ) ) ( OBJ-AT ?auto_10136 ?auto_10138 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10136 ?auto_10139 ?auto_10138 )
      ( DELIVER-2PKG ?auto_10136 ?auto_10134 ?auto_10133 )
      ( DELIVER-1PKG-VERIFY ?auto_10134 ?auto_10133 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10141 - OBJ
      ?auto_10142 - OBJ
      ?auto_10140 - LOCATION
    )
    :vars
    (
      ?auto_10143 - LOCATION
      ?auto_10144 - CITY
      ?auto_10146 - TRUCK
      ?auto_10145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10143 ?auto_10144 ) ( IN-CITY ?auto_10140 ?auto_10144 ) ( not ( = ?auto_10140 ?auto_10143 ) ) ( not ( = ?auto_10141 ?auto_10142 ) ) ( OBJ-AT ?auto_10142 ?auto_10143 ) ( TRUCK-AT ?auto_10146 ?auto_10145 ) ( IN-CITY ?auto_10145 ?auto_10144 ) ( not ( = ?auto_10140 ?auto_10145 ) ) ( not ( = ?auto_10143 ?auto_10145 ) ) ( OBJ-AT ?auto_10141 ?auto_10145 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10142 ?auto_10140 )
      ( DELIVER-2PKG-VERIFY ?auto_10141 ?auto_10142 ?auto_10140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10148 - OBJ
      ?auto_10149 - OBJ
      ?auto_10147 - LOCATION
    )
    :vars
    (
      ?auto_10152 - LOCATION
      ?auto_10151 - CITY
      ?auto_10150 - TRUCK
      ?auto_10153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10152 ?auto_10151 ) ( IN-CITY ?auto_10147 ?auto_10151 ) ( not ( = ?auto_10147 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10148 ) ) ( OBJ-AT ?auto_10148 ?auto_10152 ) ( TRUCK-AT ?auto_10150 ?auto_10153 ) ( IN-CITY ?auto_10153 ?auto_10151 ) ( not ( = ?auto_10147 ?auto_10153 ) ) ( not ( = ?auto_10152 ?auto_10153 ) ) ( OBJ-AT ?auto_10149 ?auto_10153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10149 ?auto_10148 ?auto_10147 )
      ( DELIVER-2PKG-VERIFY ?auto_10148 ?auto_10149 ?auto_10147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10555 - OBJ
      ?auto_10556 - OBJ
      ?auto_10557 - OBJ
      ?auto_10554 - LOCATION
    )
    :vars
    (
      ?auto_10559 - TRUCK
      ?auto_10561 - LOCATION
      ?auto_10560 - CITY
      ?auto_10558 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10557 ?auto_10559 ) ( TRUCK-AT ?auto_10559 ?auto_10561 ) ( IN-CITY ?auto_10561 ?auto_10560 ) ( IN-CITY ?auto_10554 ?auto_10560 ) ( not ( = ?auto_10554 ?auto_10561 ) ) ( OBJ-AT ?auto_10558 ?auto_10554 ) ( not ( = ?auto_10558 ?auto_10557 ) ) ( OBJ-AT ?auto_10555 ?auto_10554 ) ( OBJ-AT ?auto_10556 ?auto_10554 ) ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10558 ) ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10558 ?auto_10557 ?auto_10554 )
      ( DELIVER-3PKG-VERIFY ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10554 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10567 - OBJ
      ?auto_10568 - OBJ
      ?auto_10569 - OBJ
      ?auto_10566 - LOCATION
    )
    :vars
    (
      ?auto_10571 - TRUCK
      ?auto_10573 - LOCATION
      ?auto_10572 - CITY
      ?auto_10570 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10568 ?auto_10571 ) ( TRUCK-AT ?auto_10571 ?auto_10573 ) ( IN-CITY ?auto_10573 ?auto_10572 ) ( IN-CITY ?auto_10566 ?auto_10572 ) ( not ( = ?auto_10566 ?auto_10573 ) ) ( OBJ-AT ?auto_10570 ?auto_10566 ) ( not ( = ?auto_10570 ?auto_10568 ) ) ( OBJ-AT ?auto_10567 ?auto_10566 ) ( OBJ-AT ?auto_10569 ?auto_10566 ) ( not ( = ?auto_10567 ?auto_10568 ) ) ( not ( = ?auto_10567 ?auto_10569 ) ) ( not ( = ?auto_10567 ?auto_10570 ) ) ( not ( = ?auto_10568 ?auto_10569 ) ) ( not ( = ?auto_10569 ?auto_10570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10570 ?auto_10568 ?auto_10566 )
      ( DELIVER-3PKG-VERIFY ?auto_10567 ?auto_10568 ?auto_10569 ?auto_10566 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10583 - OBJ
      ?auto_10584 - OBJ
      ?auto_10585 - OBJ
      ?auto_10582 - LOCATION
    )
    :vars
    (
      ?auto_10586 - TRUCK
      ?auto_10588 - LOCATION
      ?auto_10587 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10583 ?auto_10586 ) ( TRUCK-AT ?auto_10586 ?auto_10588 ) ( IN-CITY ?auto_10588 ?auto_10587 ) ( IN-CITY ?auto_10582 ?auto_10587 ) ( not ( = ?auto_10582 ?auto_10588 ) ) ( OBJ-AT ?auto_10585 ?auto_10582 ) ( not ( = ?auto_10585 ?auto_10583 ) ) ( OBJ-AT ?auto_10584 ?auto_10582 ) ( not ( = ?auto_10583 ?auto_10584 ) ) ( not ( = ?auto_10584 ?auto_10585 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10585 ?auto_10583 ?auto_10582 )
      ( DELIVER-3PKG-VERIFY ?auto_10583 ?auto_10584 ?auto_10585 ?auto_10582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10605 - OBJ
      ?auto_10606 - OBJ
      ?auto_10607 - OBJ
      ?auto_10604 - LOCATION
    )
    :vars
    (
      ?auto_10609 - TRUCK
      ?auto_10611 - LOCATION
      ?auto_10610 - CITY
      ?auto_10608 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10605 ?auto_10609 ) ( TRUCK-AT ?auto_10609 ?auto_10611 ) ( IN-CITY ?auto_10611 ?auto_10610 ) ( IN-CITY ?auto_10604 ?auto_10610 ) ( not ( = ?auto_10604 ?auto_10611 ) ) ( OBJ-AT ?auto_10608 ?auto_10604 ) ( not ( = ?auto_10608 ?auto_10605 ) ) ( OBJ-AT ?auto_10606 ?auto_10604 ) ( OBJ-AT ?auto_10607 ?auto_10604 ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10608 ?auto_10605 ?auto_10604 )
      ( DELIVER-3PKG-VERIFY ?auto_10605 ?auto_10606 ?auto_10607 ?auto_10604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10708 - OBJ
      ?auto_10709 - OBJ
      ?auto_10710 - OBJ
      ?auto_10707 - LOCATION
    )
    :vars
    (
      ?auto_10712 - TRUCK
      ?auto_10713 - LOCATION
      ?auto_10711 - CITY
      ?auto_10714 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10712 ?auto_10713 ) ( IN-CITY ?auto_10713 ?auto_10711 ) ( IN-CITY ?auto_10707 ?auto_10711 ) ( not ( = ?auto_10707 ?auto_10713 ) ) ( OBJ-AT ?auto_10714 ?auto_10707 ) ( not ( = ?auto_10714 ?auto_10710 ) ) ( OBJ-AT ?auto_10710 ?auto_10713 ) ( OBJ-AT ?auto_10708 ?auto_10707 ) ( OBJ-AT ?auto_10709 ?auto_10707 ) ( not ( = ?auto_10708 ?auto_10709 ) ) ( not ( = ?auto_10708 ?auto_10710 ) ) ( not ( = ?auto_10708 ?auto_10714 ) ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10714 ?auto_10710 ?auto_10707 )
      ( DELIVER-3PKG-VERIFY ?auto_10708 ?auto_10709 ?auto_10710 ?auto_10707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10720 - OBJ
      ?auto_10721 - OBJ
      ?auto_10722 - OBJ
      ?auto_10719 - LOCATION
    )
    :vars
    (
      ?auto_10724 - TRUCK
      ?auto_10725 - LOCATION
      ?auto_10723 - CITY
      ?auto_10726 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10724 ?auto_10725 ) ( IN-CITY ?auto_10725 ?auto_10723 ) ( IN-CITY ?auto_10719 ?auto_10723 ) ( not ( = ?auto_10719 ?auto_10725 ) ) ( OBJ-AT ?auto_10726 ?auto_10719 ) ( not ( = ?auto_10726 ?auto_10721 ) ) ( OBJ-AT ?auto_10721 ?auto_10725 ) ( OBJ-AT ?auto_10720 ?auto_10719 ) ( OBJ-AT ?auto_10722 ?auto_10719 ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10726 ) ) ( not ( = ?auto_10721 ?auto_10722 ) ) ( not ( = ?auto_10722 ?auto_10726 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10726 ?auto_10721 ?auto_10719 )
      ( DELIVER-3PKG-VERIFY ?auto_10720 ?auto_10721 ?auto_10722 ?auto_10719 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10758 - OBJ
      ?auto_10759 - OBJ
      ?auto_10760 - OBJ
      ?auto_10757 - LOCATION
    )
    :vars
    (
      ?auto_10762 - TRUCK
      ?auto_10763 - LOCATION
      ?auto_10761 - CITY
      ?auto_10764 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10762 ?auto_10763 ) ( IN-CITY ?auto_10763 ?auto_10761 ) ( IN-CITY ?auto_10757 ?auto_10761 ) ( not ( = ?auto_10757 ?auto_10763 ) ) ( OBJ-AT ?auto_10764 ?auto_10757 ) ( not ( = ?auto_10764 ?auto_10758 ) ) ( OBJ-AT ?auto_10758 ?auto_10763 ) ( OBJ-AT ?auto_10759 ?auto_10757 ) ( OBJ-AT ?auto_10760 ?auto_10757 ) ( not ( = ?auto_10758 ?auto_10759 ) ) ( not ( = ?auto_10758 ?auto_10760 ) ) ( not ( = ?auto_10759 ?auto_10760 ) ) ( not ( = ?auto_10759 ?auto_10764 ) ) ( not ( = ?auto_10760 ?auto_10764 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10764 ?auto_10758 ?auto_10757 )
      ( DELIVER-3PKG-VERIFY ?auto_10758 ?auto_10759 ?auto_10760 ?auto_10757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10828 - OBJ
      ?auto_10829 - OBJ
      ?auto_10830 - OBJ
      ?auto_10827 - LOCATION
    )
    :vars
    (
      ?auto_10833 - LOCATION
      ?auto_10832 - CITY
      ?auto_10831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10833 ?auto_10832 ) ( IN-CITY ?auto_10827 ?auto_10832 ) ( not ( = ?auto_10827 ?auto_10833 ) ) ( OBJ-AT ?auto_10828 ?auto_10827 ) ( not ( = ?auto_10828 ?auto_10830 ) ) ( OBJ-AT ?auto_10830 ?auto_10833 ) ( TRUCK-AT ?auto_10831 ?auto_10827 ) ( OBJ-AT ?auto_10829 ?auto_10827 ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10829 ?auto_10830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10828 ?auto_10830 ?auto_10827 )
      ( DELIVER-3PKG-VERIFY ?auto_10828 ?auto_10829 ?auto_10830 ?auto_10827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10839 - OBJ
      ?auto_10840 - OBJ
      ?auto_10841 - OBJ
      ?auto_10838 - LOCATION
    )
    :vars
    (
      ?auto_10844 - LOCATION
      ?auto_10843 - CITY
      ?auto_10842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10844 ?auto_10843 ) ( IN-CITY ?auto_10838 ?auto_10843 ) ( not ( = ?auto_10838 ?auto_10844 ) ) ( OBJ-AT ?auto_10839 ?auto_10838 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( OBJ-AT ?auto_10840 ?auto_10844 ) ( TRUCK-AT ?auto_10842 ?auto_10838 ) ( OBJ-AT ?auto_10841 ?auto_10838 ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10839 ?auto_10840 ?auto_10838 )
      ( DELIVER-3PKG-VERIFY ?auto_10839 ?auto_10840 ?auto_10841 ?auto_10838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10861 - OBJ
      ?auto_10862 - OBJ
      ?auto_10863 - OBJ
      ?auto_10860 - LOCATION
    )
    :vars
    (
      ?auto_10866 - LOCATION
      ?auto_10865 - CITY
      ?auto_10867 - OBJ
      ?auto_10864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10866 ?auto_10865 ) ( IN-CITY ?auto_10860 ?auto_10865 ) ( not ( = ?auto_10860 ?auto_10866 ) ) ( OBJ-AT ?auto_10867 ?auto_10860 ) ( not ( = ?auto_10867 ?auto_10863 ) ) ( OBJ-AT ?auto_10863 ?auto_10866 ) ( TRUCK-AT ?auto_10864 ?auto_10860 ) ( OBJ-AT ?auto_10861 ?auto_10860 ) ( OBJ-AT ?auto_10862 ?auto_10860 ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10863 ) ) ( not ( = ?auto_10861 ?auto_10867 ) ) ( not ( = ?auto_10862 ?auto_10863 ) ) ( not ( = ?auto_10862 ?auto_10867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10867 ?auto_10863 ?auto_10860 )
      ( DELIVER-3PKG-VERIFY ?auto_10861 ?auto_10862 ?auto_10863 ?auto_10860 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10873 - OBJ
      ?auto_10874 - OBJ
      ?auto_10875 - OBJ
      ?auto_10872 - LOCATION
    )
    :vars
    (
      ?auto_10878 - LOCATION
      ?auto_10877 - CITY
      ?auto_10879 - OBJ
      ?auto_10876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10878 ?auto_10877 ) ( IN-CITY ?auto_10872 ?auto_10877 ) ( not ( = ?auto_10872 ?auto_10878 ) ) ( OBJ-AT ?auto_10879 ?auto_10872 ) ( not ( = ?auto_10879 ?auto_10874 ) ) ( OBJ-AT ?auto_10874 ?auto_10878 ) ( TRUCK-AT ?auto_10876 ?auto_10872 ) ( OBJ-AT ?auto_10873 ?auto_10872 ) ( OBJ-AT ?auto_10875 ?auto_10872 ) ( not ( = ?auto_10873 ?auto_10874 ) ) ( not ( = ?auto_10873 ?auto_10875 ) ) ( not ( = ?auto_10873 ?auto_10879 ) ) ( not ( = ?auto_10874 ?auto_10875 ) ) ( not ( = ?auto_10875 ?auto_10879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10879 ?auto_10874 ?auto_10872 )
      ( DELIVER-3PKG-VERIFY ?auto_10873 ?auto_10874 ?auto_10875 ?auto_10872 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10911 - OBJ
      ?auto_10912 - OBJ
      ?auto_10913 - OBJ
      ?auto_10910 - LOCATION
    )
    :vars
    (
      ?auto_10916 - LOCATION
      ?auto_10915 - CITY
      ?auto_10917 - OBJ
      ?auto_10914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10916 ?auto_10915 ) ( IN-CITY ?auto_10910 ?auto_10915 ) ( not ( = ?auto_10910 ?auto_10916 ) ) ( OBJ-AT ?auto_10917 ?auto_10910 ) ( not ( = ?auto_10917 ?auto_10911 ) ) ( OBJ-AT ?auto_10911 ?auto_10916 ) ( TRUCK-AT ?auto_10914 ?auto_10910 ) ( OBJ-AT ?auto_10912 ?auto_10910 ) ( OBJ-AT ?auto_10913 ?auto_10910 ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10911 ?auto_10913 ) ) ( not ( = ?auto_10912 ?auto_10913 ) ) ( not ( = ?auto_10912 ?auto_10917 ) ) ( not ( = ?auto_10913 ?auto_10917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10917 ?auto_10911 ?auto_10910 )
      ( DELIVER-3PKG-VERIFY ?auto_10911 ?auto_10912 ?auto_10913 ?auto_10910 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11119 - OBJ
      ?auto_11118 - LOCATION
    )
    :vars
    (
      ?auto_11121 - LOCATION
      ?auto_11122 - CITY
      ?auto_11123 - OBJ
      ?auto_11120 - TRUCK
      ?auto_11124 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11121 ?auto_11122 ) ( IN-CITY ?auto_11118 ?auto_11122 ) ( not ( = ?auto_11118 ?auto_11121 ) ) ( OBJ-AT ?auto_11123 ?auto_11118 ) ( not ( = ?auto_11123 ?auto_11119 ) ) ( OBJ-AT ?auto_11119 ?auto_11121 ) ( TRUCK-AT ?auto_11120 ?auto_11124 ) ( IN-CITY ?auto_11124 ?auto_11122 ) ( not ( = ?auto_11118 ?auto_11124 ) ) ( not ( = ?auto_11121 ?auto_11124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11120 ?auto_11124 ?auto_11118 ?auto_11122 )
      ( DELIVER-2PKG ?auto_11123 ?auto_11119 ?auto_11118 )
      ( DELIVER-1PKG-VERIFY ?auto_11119 ?auto_11118 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11126 - OBJ
      ?auto_11127 - OBJ
      ?auto_11125 - LOCATION
    )
    :vars
    (
      ?auto_11130 - LOCATION
      ?auto_11128 - CITY
      ?auto_11129 - TRUCK
      ?auto_11131 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11130 ?auto_11128 ) ( IN-CITY ?auto_11125 ?auto_11128 ) ( not ( = ?auto_11125 ?auto_11130 ) ) ( OBJ-AT ?auto_11126 ?auto_11125 ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( OBJ-AT ?auto_11127 ?auto_11130 ) ( TRUCK-AT ?auto_11129 ?auto_11131 ) ( IN-CITY ?auto_11131 ?auto_11128 ) ( not ( = ?auto_11125 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11131 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11127 ?auto_11125 )
      ( DELIVER-2PKG-VERIFY ?auto_11126 ?auto_11127 ?auto_11125 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11141 - OBJ
      ?auto_11142 - OBJ
      ?auto_11140 - LOCATION
    )
    :vars
    (
      ?auto_11146 - LOCATION
      ?auto_11143 - CITY
      ?auto_11145 - TRUCK
      ?auto_11144 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11146 ?auto_11143 ) ( IN-CITY ?auto_11140 ?auto_11143 ) ( not ( = ?auto_11140 ?auto_11146 ) ) ( OBJ-AT ?auto_11142 ?auto_11140 ) ( not ( = ?auto_11142 ?auto_11141 ) ) ( OBJ-AT ?auto_11141 ?auto_11146 ) ( TRUCK-AT ?auto_11145 ?auto_11144 ) ( IN-CITY ?auto_11144 ?auto_11143 ) ( not ( = ?auto_11140 ?auto_11144 ) ) ( not ( = ?auto_11146 ?auto_11144 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11142 ?auto_11141 ?auto_11140 )
      ( DELIVER-2PKG-VERIFY ?auto_11141 ?auto_11142 ?auto_11140 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11164 - OBJ
      ?auto_11165 - OBJ
      ?auto_11166 - OBJ
      ?auto_11163 - LOCATION
    )
    :vars
    (
      ?auto_11170 - LOCATION
      ?auto_11167 - CITY
      ?auto_11169 - TRUCK
      ?auto_11168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11170 ?auto_11167 ) ( IN-CITY ?auto_11163 ?auto_11167 ) ( not ( = ?auto_11163 ?auto_11170 ) ) ( OBJ-AT ?auto_11165 ?auto_11163 ) ( not ( = ?auto_11165 ?auto_11166 ) ) ( OBJ-AT ?auto_11166 ?auto_11170 ) ( TRUCK-AT ?auto_11169 ?auto_11168 ) ( IN-CITY ?auto_11168 ?auto_11167 ) ( not ( = ?auto_11163 ?auto_11168 ) ) ( not ( = ?auto_11170 ?auto_11168 ) ) ( OBJ-AT ?auto_11164 ?auto_11163 ) ( not ( = ?auto_11164 ?auto_11165 ) ) ( not ( = ?auto_11164 ?auto_11166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11165 ?auto_11166 ?auto_11163 )
      ( DELIVER-3PKG-VERIFY ?auto_11164 ?auto_11165 ?auto_11166 ?auto_11163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11180 - OBJ
      ?auto_11181 - OBJ
      ?auto_11182 - OBJ
      ?auto_11179 - LOCATION
    )
    :vars
    (
      ?auto_11186 - LOCATION
      ?auto_11183 - CITY
      ?auto_11185 - TRUCK
      ?auto_11184 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11186 ?auto_11183 ) ( IN-CITY ?auto_11179 ?auto_11183 ) ( not ( = ?auto_11179 ?auto_11186 ) ) ( OBJ-AT ?auto_11182 ?auto_11179 ) ( not ( = ?auto_11182 ?auto_11181 ) ) ( OBJ-AT ?auto_11181 ?auto_11186 ) ( TRUCK-AT ?auto_11185 ?auto_11184 ) ( IN-CITY ?auto_11184 ?auto_11183 ) ( not ( = ?auto_11179 ?auto_11184 ) ) ( not ( = ?auto_11186 ?auto_11184 ) ) ( OBJ-AT ?auto_11180 ?auto_11179 ) ( not ( = ?auto_11180 ?auto_11181 ) ) ( not ( = ?auto_11180 ?auto_11182 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11182 ?auto_11181 ?auto_11179 )
      ( DELIVER-3PKG-VERIFY ?auto_11180 ?auto_11181 ?auto_11182 ?auto_11179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11247 - OBJ
      ?auto_11248 - OBJ
      ?auto_11249 - OBJ
      ?auto_11246 - LOCATION
    )
    :vars
    (
      ?auto_11253 - LOCATION
      ?auto_11250 - CITY
      ?auto_11252 - TRUCK
      ?auto_11251 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11253 ?auto_11250 ) ( IN-CITY ?auto_11246 ?auto_11250 ) ( not ( = ?auto_11246 ?auto_11253 ) ) ( OBJ-AT ?auto_11249 ?auto_11246 ) ( not ( = ?auto_11249 ?auto_11247 ) ) ( OBJ-AT ?auto_11247 ?auto_11253 ) ( TRUCK-AT ?auto_11252 ?auto_11251 ) ( IN-CITY ?auto_11251 ?auto_11250 ) ( not ( = ?auto_11246 ?auto_11251 ) ) ( not ( = ?auto_11253 ?auto_11251 ) ) ( OBJ-AT ?auto_11248 ?auto_11246 ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11248 ?auto_11249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11249 ?auto_11247 ?auto_11246 )
      ( DELIVER-3PKG-VERIFY ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11246 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11355 - OBJ
      ?auto_11356 - OBJ
      ?auto_11357 - OBJ
      ?auto_11354 - LOCATION
    )
    :vars
    (
      ?auto_11360 - LOCATION
      ?auto_11359 - CITY
      ?auto_11361 - TRUCK
      ?auto_11358 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11360 ?auto_11359 ) ( IN-CITY ?auto_11354 ?auto_11359 ) ( not ( = ?auto_11354 ?auto_11360 ) ) ( OBJ-AT ?auto_11355 ?auto_11354 ) ( not ( = ?auto_11355 ?auto_11357 ) ) ( OBJ-AT ?auto_11357 ?auto_11360 ) ( TRUCK-AT ?auto_11361 ?auto_11358 ) ( IN-CITY ?auto_11358 ?auto_11359 ) ( not ( = ?auto_11354 ?auto_11358 ) ) ( not ( = ?auto_11360 ?auto_11358 ) ) ( OBJ-AT ?auto_11356 ?auto_11354 ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11356 ?auto_11357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11355 ?auto_11357 ?auto_11354 )
      ( DELIVER-3PKG-VERIFY ?auto_11355 ?auto_11356 ?auto_11357 ?auto_11354 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11438 - OBJ
      ?auto_11439 - OBJ
      ?auto_11440 - OBJ
      ?auto_11437 - LOCATION
    )
    :vars
    (
      ?auto_11443 - LOCATION
      ?auto_11442 - CITY
      ?auto_11444 - TRUCK
      ?auto_11441 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11443 ?auto_11442 ) ( IN-CITY ?auto_11437 ?auto_11442 ) ( not ( = ?auto_11437 ?auto_11443 ) ) ( OBJ-AT ?auto_11439 ?auto_11437 ) ( not ( = ?auto_11439 ?auto_11438 ) ) ( OBJ-AT ?auto_11438 ?auto_11443 ) ( TRUCK-AT ?auto_11444 ?auto_11441 ) ( IN-CITY ?auto_11441 ?auto_11442 ) ( not ( = ?auto_11437 ?auto_11441 ) ) ( not ( = ?auto_11443 ?auto_11441 ) ) ( OBJ-AT ?auto_11440 ?auto_11437 ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11439 ?auto_11438 ?auto_11437 )
      ( DELIVER-3PKG-VERIFY ?auto_11438 ?auto_11439 ?auto_11440 ?auto_11437 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11616 - OBJ
      ?auto_11617 - OBJ
      ?auto_11618 - OBJ
      ?auto_11615 - LOCATION
    )
    :vars
    (
      ?auto_11620 - LOCATION
      ?auto_11621 - CITY
      ?auto_11619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11620 ?auto_11621 ) ( IN-CITY ?auto_11615 ?auto_11621 ) ( not ( = ?auto_11615 ?auto_11620 ) ) ( OBJ-AT ?auto_11618 ?auto_11615 ) ( not ( = ?auto_11618 ?auto_11616 ) ) ( OBJ-AT ?auto_11616 ?auto_11620 ) ( TRUCK-AT ?auto_11619 ?auto_11615 ) ( OBJ-AT ?auto_11617 ?auto_11615 ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( not ( = ?auto_11617 ?auto_11618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11618 ?auto_11616 ?auto_11615 )
      ( DELIVER-3PKG-VERIFY ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11615 ) )
  )

)

