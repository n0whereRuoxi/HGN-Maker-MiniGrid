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
      ?auto_13602 - OBJ
      ?auto_13601 - LOCATION
    )
    :vars
    (
      ?auto_13603 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13603 ?auto_13601 ) ( IN-TRUCK ?auto_13602 ?auto_13603 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13602 ?auto_13603 ?auto_13601 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13614 - OBJ
      ?auto_13613 - LOCATION
    )
    :vars
    (
      ?auto_13615 - TRUCK
      ?auto_13616 - LOCATION
      ?auto_13617 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13614 ?auto_13615 ) ( TRUCK-AT ?auto_13615 ?auto_13616 ) ( IN-CITY ?auto_13616 ?auto_13617 ) ( IN-CITY ?auto_13613 ?auto_13617 ) ( not ( = ?auto_13613 ?auto_13616 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13615 ?auto_13616 ?auto_13613 ?auto_13617 )
      ( DELIVER-1PKG ?auto_13614 ?auto_13613 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13632 - OBJ
      ?auto_13631 - LOCATION
    )
    :vars
    (
      ?auto_13633 - TRUCK
      ?auto_13634 - LOCATION
      ?auto_13635 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13633 ?auto_13634 ) ( IN-CITY ?auto_13634 ?auto_13635 ) ( IN-CITY ?auto_13631 ?auto_13635 ) ( not ( = ?auto_13631 ?auto_13634 ) ) ( OBJ-AT ?auto_13632 ?auto_13634 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13632 ?auto_13633 ?auto_13634 )
      ( DELIVER-1PKG ?auto_13632 ?auto_13631 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13650 - OBJ
      ?auto_13649 - LOCATION
    )
    :vars
    (
      ?auto_13652 - LOCATION
      ?auto_13653 - CITY
      ?auto_13651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13652 ?auto_13653 ) ( IN-CITY ?auto_13649 ?auto_13653 ) ( not ( = ?auto_13649 ?auto_13652 ) ) ( OBJ-AT ?auto_13650 ?auto_13652 ) ( TRUCK-AT ?auto_13651 ?auto_13649 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13651 ?auto_13649 ?auto_13652 ?auto_13653 )
      ( DELIVER-1PKG ?auto_13650 ?auto_13649 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13707 - OBJ
      ?auto_13706 - LOCATION
    )
    :vars
    (
      ?auto_13708 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13708 ?auto_13706 ) ( IN-TRUCK ?auto_13707 ?auto_13708 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13707 ?auto_13708 ?auto_13706 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13710 - OBJ
      ?auto_13711 - OBJ
      ?auto_13709 - LOCATION
    )
    :vars
    (
      ?auto_13712 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13712 ?auto_13709 ) ( IN-TRUCK ?auto_13711 ?auto_13712 ) ( OBJ-AT ?auto_13710 ?auto_13709 ) ( not ( = ?auto_13710 ?auto_13711 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13711 ?auto_13709 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13714 - OBJ
      ?auto_13715 - OBJ
      ?auto_13713 - LOCATION
    )
    :vars
    (
      ?auto_13716 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13716 ?auto_13713 ) ( IN-TRUCK ?auto_13714 ?auto_13716 ) ( OBJ-AT ?auto_13715 ?auto_13713 ) ( not ( = ?auto_13714 ?auto_13715 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13714 ?auto_13713 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13722 - OBJ
      ?auto_13723 - OBJ
      ?auto_13724 - OBJ
      ?auto_13721 - LOCATION
    )
    :vars
    (
      ?auto_13725 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13725 ?auto_13721 ) ( IN-TRUCK ?auto_13724 ?auto_13725 ) ( OBJ-AT ?auto_13722 ?auto_13721 ) ( OBJ-AT ?auto_13723 ?auto_13721 ) ( not ( = ?auto_13722 ?auto_13723 ) ) ( not ( = ?auto_13722 ?auto_13724 ) ) ( not ( = ?auto_13723 ?auto_13724 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13724 ?auto_13721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13727 - OBJ
      ?auto_13728 - OBJ
      ?auto_13729 - OBJ
      ?auto_13726 - LOCATION
    )
    :vars
    (
      ?auto_13730 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13730 ?auto_13726 ) ( IN-TRUCK ?auto_13728 ?auto_13730 ) ( OBJ-AT ?auto_13727 ?auto_13726 ) ( OBJ-AT ?auto_13729 ?auto_13726 ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13729 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13728 ?auto_13726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13737 - OBJ
      ?auto_13738 - OBJ
      ?auto_13739 - OBJ
      ?auto_13736 - LOCATION
    )
    :vars
    (
      ?auto_13740 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13740 ?auto_13736 ) ( IN-TRUCK ?auto_13737 ?auto_13740 ) ( OBJ-AT ?auto_13738 ?auto_13736 ) ( OBJ-AT ?auto_13739 ?auto_13736 ) ( not ( = ?auto_13737 ?auto_13738 ) ) ( not ( = ?auto_13737 ?auto_13739 ) ) ( not ( = ?auto_13738 ?auto_13739 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13737 ?auto_13736 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13757 - OBJ
      ?auto_13756 - LOCATION
    )
    :vars
    (
      ?auto_13758 - TRUCK
      ?auto_13759 - LOCATION
      ?auto_13760 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13757 ?auto_13758 ) ( TRUCK-AT ?auto_13758 ?auto_13759 ) ( IN-CITY ?auto_13759 ?auto_13760 ) ( IN-CITY ?auto_13756 ?auto_13760 ) ( not ( = ?auto_13756 ?auto_13759 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13758 ?auto_13759 ?auto_13756 ?auto_13760 )
      ( DELIVER-1PKG ?auto_13757 ?auto_13756 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13762 - OBJ
      ?auto_13763 - OBJ
      ?auto_13761 - LOCATION
    )
    :vars
    (
      ?auto_13764 - TRUCK
      ?auto_13766 - LOCATION
      ?auto_13765 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13763 ?auto_13764 ) ( TRUCK-AT ?auto_13764 ?auto_13766 ) ( IN-CITY ?auto_13766 ?auto_13765 ) ( IN-CITY ?auto_13761 ?auto_13765 ) ( not ( = ?auto_13761 ?auto_13766 ) ) ( OBJ-AT ?auto_13762 ?auto_13761 ) ( not ( = ?auto_13762 ?auto_13763 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13763 ?auto_13761 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13768 - OBJ
      ?auto_13769 - OBJ
      ?auto_13767 - LOCATION
    )
    :vars
    (
      ?auto_13770 - TRUCK
      ?auto_13772 - LOCATION
      ?auto_13771 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13768 ?auto_13770 ) ( TRUCK-AT ?auto_13770 ?auto_13772 ) ( IN-CITY ?auto_13772 ?auto_13771 ) ( IN-CITY ?auto_13767 ?auto_13771 ) ( not ( = ?auto_13767 ?auto_13772 ) ) ( OBJ-AT ?auto_13769 ?auto_13767 ) ( not ( = ?auto_13769 ?auto_13768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13769 ?auto_13768 ?auto_13767 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13781 - OBJ
      ?auto_13782 - OBJ
      ?auto_13783 - OBJ
      ?auto_13780 - LOCATION
    )
    :vars
    (
      ?auto_13784 - TRUCK
      ?auto_13786 - LOCATION
      ?auto_13785 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13783 ?auto_13784 ) ( TRUCK-AT ?auto_13784 ?auto_13786 ) ( IN-CITY ?auto_13786 ?auto_13785 ) ( IN-CITY ?auto_13780 ?auto_13785 ) ( not ( = ?auto_13780 ?auto_13786 ) ) ( OBJ-AT ?auto_13782 ?auto_13780 ) ( not ( = ?auto_13782 ?auto_13783 ) ) ( OBJ-AT ?auto_13781 ?auto_13780 ) ( not ( = ?auto_13781 ?auto_13782 ) ) ( not ( = ?auto_13781 ?auto_13783 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13782 ?auto_13783 ?auto_13780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13788 - OBJ
      ?auto_13789 - OBJ
      ?auto_13790 - OBJ
      ?auto_13787 - LOCATION
    )
    :vars
    (
      ?auto_13791 - TRUCK
      ?auto_13793 - LOCATION
      ?auto_13792 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13789 ?auto_13791 ) ( TRUCK-AT ?auto_13791 ?auto_13793 ) ( IN-CITY ?auto_13793 ?auto_13792 ) ( IN-CITY ?auto_13787 ?auto_13792 ) ( not ( = ?auto_13787 ?auto_13793 ) ) ( OBJ-AT ?auto_13788 ?auto_13787 ) ( not ( = ?auto_13788 ?auto_13789 ) ) ( OBJ-AT ?auto_13790 ?auto_13787 ) ( not ( = ?auto_13788 ?auto_13790 ) ) ( not ( = ?auto_13789 ?auto_13790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13788 ?auto_13789 ?auto_13787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13802 - OBJ
      ?auto_13803 - OBJ
      ?auto_13804 - OBJ
      ?auto_13801 - LOCATION
    )
    :vars
    (
      ?auto_13805 - TRUCK
      ?auto_13807 - LOCATION
      ?auto_13806 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13802 ?auto_13805 ) ( TRUCK-AT ?auto_13805 ?auto_13807 ) ( IN-CITY ?auto_13807 ?auto_13806 ) ( IN-CITY ?auto_13801 ?auto_13806 ) ( not ( = ?auto_13801 ?auto_13807 ) ) ( OBJ-AT ?auto_13804 ?auto_13801 ) ( not ( = ?auto_13804 ?auto_13802 ) ) ( OBJ-AT ?auto_13803 ?auto_13801 ) ( not ( = ?auto_13802 ?auto_13803 ) ) ( not ( = ?auto_13803 ?auto_13804 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13804 ?auto_13802 ?auto_13801 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13831 - OBJ
      ?auto_13830 - LOCATION
    )
    :vars
    (
      ?auto_13832 - TRUCK
      ?auto_13835 - LOCATION
      ?auto_13833 - CITY
      ?auto_13834 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13832 ?auto_13835 ) ( IN-CITY ?auto_13835 ?auto_13833 ) ( IN-CITY ?auto_13830 ?auto_13833 ) ( not ( = ?auto_13830 ?auto_13835 ) ) ( OBJ-AT ?auto_13834 ?auto_13830 ) ( not ( = ?auto_13834 ?auto_13831 ) ) ( OBJ-AT ?auto_13831 ?auto_13835 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13831 ?auto_13832 ?auto_13835 )
      ( DELIVER-2PKG ?auto_13834 ?auto_13831 ?auto_13830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13837 - OBJ
      ?auto_13838 - OBJ
      ?auto_13836 - LOCATION
    )
    :vars
    (
      ?auto_13839 - TRUCK
      ?auto_13840 - LOCATION
      ?auto_13841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13839 ?auto_13840 ) ( IN-CITY ?auto_13840 ?auto_13841 ) ( IN-CITY ?auto_13836 ?auto_13841 ) ( not ( = ?auto_13836 ?auto_13840 ) ) ( OBJ-AT ?auto_13837 ?auto_13836 ) ( not ( = ?auto_13837 ?auto_13838 ) ) ( OBJ-AT ?auto_13838 ?auto_13840 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13838 ?auto_13836 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13843 - OBJ
      ?auto_13844 - OBJ
      ?auto_13842 - LOCATION
    )
    :vars
    (
      ?auto_13846 - TRUCK
      ?auto_13847 - LOCATION
      ?auto_13845 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13846 ?auto_13847 ) ( IN-CITY ?auto_13847 ?auto_13845 ) ( IN-CITY ?auto_13842 ?auto_13845 ) ( not ( = ?auto_13842 ?auto_13847 ) ) ( OBJ-AT ?auto_13844 ?auto_13842 ) ( not ( = ?auto_13844 ?auto_13843 ) ) ( OBJ-AT ?auto_13843 ?auto_13847 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13844 ?auto_13843 ?auto_13842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13856 - OBJ
      ?auto_13857 - OBJ
      ?auto_13858 - OBJ
      ?auto_13855 - LOCATION
    )
    :vars
    (
      ?auto_13860 - TRUCK
      ?auto_13861 - LOCATION
      ?auto_13859 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13860 ?auto_13861 ) ( IN-CITY ?auto_13861 ?auto_13859 ) ( IN-CITY ?auto_13855 ?auto_13859 ) ( not ( = ?auto_13855 ?auto_13861 ) ) ( OBJ-AT ?auto_13857 ?auto_13855 ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( OBJ-AT ?auto_13858 ?auto_13861 ) ( OBJ-AT ?auto_13856 ?auto_13855 ) ( not ( = ?auto_13856 ?auto_13857 ) ) ( not ( = ?auto_13856 ?auto_13858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13857 ?auto_13858 ?auto_13855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13863 - OBJ
      ?auto_13864 - OBJ
      ?auto_13865 - OBJ
      ?auto_13862 - LOCATION
    )
    :vars
    (
      ?auto_13867 - TRUCK
      ?auto_13868 - LOCATION
      ?auto_13866 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13867 ?auto_13868 ) ( IN-CITY ?auto_13868 ?auto_13866 ) ( IN-CITY ?auto_13862 ?auto_13866 ) ( not ( = ?auto_13862 ?auto_13868 ) ) ( OBJ-AT ?auto_13863 ?auto_13862 ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( OBJ-AT ?auto_13864 ?auto_13868 ) ( OBJ-AT ?auto_13865 ?auto_13862 ) ( not ( = ?auto_13863 ?auto_13865 ) ) ( not ( = ?auto_13864 ?auto_13865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13863 ?auto_13864 ?auto_13862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13877 - OBJ
      ?auto_13878 - OBJ
      ?auto_13879 - OBJ
      ?auto_13876 - LOCATION
    )
    :vars
    (
      ?auto_13881 - TRUCK
      ?auto_13882 - LOCATION
      ?auto_13880 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13881 ?auto_13882 ) ( IN-CITY ?auto_13882 ?auto_13880 ) ( IN-CITY ?auto_13876 ?auto_13880 ) ( not ( = ?auto_13876 ?auto_13882 ) ) ( OBJ-AT ?auto_13879 ?auto_13876 ) ( not ( = ?auto_13879 ?auto_13877 ) ) ( OBJ-AT ?auto_13877 ?auto_13882 ) ( OBJ-AT ?auto_13878 ?auto_13876 ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13879 ?auto_13877 ?auto_13876 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13906 - OBJ
      ?auto_13905 - LOCATION
    )
    :vars
    (
      ?auto_13909 - LOCATION
      ?auto_13907 - CITY
      ?auto_13910 - OBJ
      ?auto_13908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13909 ?auto_13907 ) ( IN-CITY ?auto_13905 ?auto_13907 ) ( not ( = ?auto_13905 ?auto_13909 ) ) ( OBJ-AT ?auto_13910 ?auto_13905 ) ( not ( = ?auto_13910 ?auto_13906 ) ) ( OBJ-AT ?auto_13906 ?auto_13909 ) ( TRUCK-AT ?auto_13908 ?auto_13905 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13908 ?auto_13905 ?auto_13909 ?auto_13907 )
      ( DELIVER-2PKG ?auto_13910 ?auto_13906 ?auto_13905 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13912 - OBJ
      ?auto_13913 - OBJ
      ?auto_13911 - LOCATION
    )
    :vars
    (
      ?auto_13916 - LOCATION
      ?auto_13914 - CITY
      ?auto_13915 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13916 ?auto_13914 ) ( IN-CITY ?auto_13911 ?auto_13914 ) ( not ( = ?auto_13911 ?auto_13916 ) ) ( OBJ-AT ?auto_13912 ?auto_13911 ) ( not ( = ?auto_13912 ?auto_13913 ) ) ( OBJ-AT ?auto_13913 ?auto_13916 ) ( TRUCK-AT ?auto_13915 ?auto_13911 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13913 ?auto_13911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13918 - OBJ
      ?auto_13919 - OBJ
      ?auto_13917 - LOCATION
    )
    :vars
    (
      ?auto_13921 - LOCATION
      ?auto_13920 - CITY
      ?auto_13922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13921 ?auto_13920 ) ( IN-CITY ?auto_13917 ?auto_13920 ) ( not ( = ?auto_13917 ?auto_13921 ) ) ( OBJ-AT ?auto_13919 ?auto_13917 ) ( not ( = ?auto_13919 ?auto_13918 ) ) ( OBJ-AT ?auto_13918 ?auto_13921 ) ( TRUCK-AT ?auto_13922 ?auto_13917 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13919 ?auto_13918 ?auto_13917 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13931 - OBJ
      ?auto_13932 - OBJ
      ?auto_13933 - OBJ
      ?auto_13930 - LOCATION
    )
    :vars
    (
      ?auto_13935 - LOCATION
      ?auto_13934 - CITY
      ?auto_13936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13935 ?auto_13934 ) ( IN-CITY ?auto_13930 ?auto_13934 ) ( not ( = ?auto_13930 ?auto_13935 ) ) ( OBJ-AT ?auto_13932 ?auto_13930 ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( OBJ-AT ?auto_13933 ?auto_13935 ) ( TRUCK-AT ?auto_13936 ?auto_13930 ) ( OBJ-AT ?auto_13931 ?auto_13930 ) ( not ( = ?auto_13931 ?auto_13932 ) ) ( not ( = ?auto_13931 ?auto_13933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13932 ?auto_13933 ?auto_13930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13938 - OBJ
      ?auto_13939 - OBJ
      ?auto_13940 - OBJ
      ?auto_13937 - LOCATION
    )
    :vars
    (
      ?auto_13942 - LOCATION
      ?auto_13941 - CITY
      ?auto_13943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13942 ?auto_13941 ) ( IN-CITY ?auto_13937 ?auto_13941 ) ( not ( = ?auto_13937 ?auto_13942 ) ) ( OBJ-AT ?auto_13940 ?auto_13937 ) ( not ( = ?auto_13940 ?auto_13939 ) ) ( OBJ-AT ?auto_13939 ?auto_13942 ) ( TRUCK-AT ?auto_13943 ?auto_13937 ) ( OBJ-AT ?auto_13938 ?auto_13937 ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13940 ?auto_13939 ?auto_13937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13952 - OBJ
      ?auto_13953 - OBJ
      ?auto_13954 - OBJ
      ?auto_13951 - LOCATION
    )
    :vars
    (
      ?auto_13956 - LOCATION
      ?auto_13955 - CITY
      ?auto_13957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13956 ?auto_13955 ) ( IN-CITY ?auto_13951 ?auto_13955 ) ( not ( = ?auto_13951 ?auto_13956 ) ) ( OBJ-AT ?auto_13954 ?auto_13951 ) ( not ( = ?auto_13954 ?auto_13952 ) ) ( OBJ-AT ?auto_13952 ?auto_13956 ) ( TRUCK-AT ?auto_13957 ?auto_13951 ) ( OBJ-AT ?auto_13953 ?auto_13951 ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( not ( = ?auto_13953 ?auto_13954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13954 ?auto_13952 ?auto_13951 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13981 - OBJ
      ?auto_13980 - LOCATION
    )
    :vars
    (
      ?auto_13983 - LOCATION
      ?auto_13982 - CITY
      ?auto_13985 - OBJ
      ?auto_13984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13983 ?auto_13982 ) ( IN-CITY ?auto_13980 ?auto_13982 ) ( not ( = ?auto_13980 ?auto_13983 ) ) ( not ( = ?auto_13985 ?auto_13981 ) ) ( OBJ-AT ?auto_13981 ?auto_13983 ) ( TRUCK-AT ?auto_13984 ?auto_13980 ) ( IN-TRUCK ?auto_13985 ?auto_13984 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13985 ?auto_13980 )
      ( DELIVER-2PKG ?auto_13985 ?auto_13981 ?auto_13980 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13987 - OBJ
      ?auto_13988 - OBJ
      ?auto_13986 - LOCATION
    )
    :vars
    (
      ?auto_13991 - LOCATION
      ?auto_13990 - CITY
      ?auto_13989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13991 ?auto_13990 ) ( IN-CITY ?auto_13986 ?auto_13990 ) ( not ( = ?auto_13986 ?auto_13991 ) ) ( not ( = ?auto_13987 ?auto_13988 ) ) ( OBJ-AT ?auto_13988 ?auto_13991 ) ( TRUCK-AT ?auto_13989 ?auto_13986 ) ( IN-TRUCK ?auto_13987 ?auto_13989 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13988 ?auto_13986 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13993 - OBJ
      ?auto_13994 - OBJ
      ?auto_13992 - LOCATION
    )
    :vars
    (
      ?auto_13996 - LOCATION
      ?auto_13995 - CITY
      ?auto_13997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13996 ?auto_13995 ) ( IN-CITY ?auto_13992 ?auto_13995 ) ( not ( = ?auto_13992 ?auto_13996 ) ) ( not ( = ?auto_13994 ?auto_13993 ) ) ( OBJ-AT ?auto_13993 ?auto_13996 ) ( TRUCK-AT ?auto_13997 ?auto_13992 ) ( IN-TRUCK ?auto_13994 ?auto_13997 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13994 ?auto_13993 ?auto_13992 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14056 - OBJ
      ?auto_14055 - LOCATION
    )
    :vars
    (
      ?auto_14058 - LOCATION
      ?auto_14057 - CITY
      ?auto_14060 - OBJ
      ?auto_14059 - TRUCK
      ?auto_14061 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14058 ?auto_14057 ) ( IN-CITY ?auto_14055 ?auto_14057 ) ( not ( = ?auto_14055 ?auto_14058 ) ) ( not ( = ?auto_14060 ?auto_14056 ) ) ( OBJ-AT ?auto_14056 ?auto_14058 ) ( IN-TRUCK ?auto_14060 ?auto_14059 ) ( TRUCK-AT ?auto_14059 ?auto_14061 ) ( IN-CITY ?auto_14061 ?auto_14057 ) ( not ( = ?auto_14055 ?auto_14061 ) ) ( not ( = ?auto_14058 ?auto_14061 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14059 ?auto_14061 ?auto_14055 ?auto_14057 )
      ( DELIVER-2PKG ?auto_14060 ?auto_14056 ?auto_14055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14063 - OBJ
      ?auto_14064 - OBJ
      ?auto_14062 - LOCATION
    )
    :vars
    (
      ?auto_14065 - LOCATION
      ?auto_14068 - CITY
      ?auto_14067 - TRUCK
      ?auto_14066 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14065 ?auto_14068 ) ( IN-CITY ?auto_14062 ?auto_14068 ) ( not ( = ?auto_14062 ?auto_14065 ) ) ( not ( = ?auto_14063 ?auto_14064 ) ) ( OBJ-AT ?auto_14064 ?auto_14065 ) ( IN-TRUCK ?auto_14063 ?auto_14067 ) ( TRUCK-AT ?auto_14067 ?auto_14066 ) ( IN-CITY ?auto_14066 ?auto_14068 ) ( not ( = ?auto_14062 ?auto_14066 ) ) ( not ( = ?auto_14065 ?auto_14066 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14064 ?auto_14062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14070 - OBJ
      ?auto_14071 - OBJ
      ?auto_14069 - LOCATION
    )
    :vars
    (
      ?auto_14073 - LOCATION
      ?auto_14075 - CITY
      ?auto_14072 - TRUCK
      ?auto_14074 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14073 ?auto_14075 ) ( IN-CITY ?auto_14069 ?auto_14075 ) ( not ( = ?auto_14069 ?auto_14073 ) ) ( not ( = ?auto_14071 ?auto_14070 ) ) ( OBJ-AT ?auto_14070 ?auto_14073 ) ( IN-TRUCK ?auto_14071 ?auto_14072 ) ( TRUCK-AT ?auto_14072 ?auto_14074 ) ( IN-CITY ?auto_14074 ?auto_14075 ) ( not ( = ?auto_14069 ?auto_14074 ) ) ( not ( = ?auto_14073 ?auto_14074 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14071 ?auto_14070 ?auto_14069 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14142 - OBJ
      ?auto_14141 - LOCATION
    )
    :vars
    (
      ?auto_14144 - LOCATION
      ?auto_14146 - CITY
      ?auto_14147 - OBJ
      ?auto_14143 - TRUCK
      ?auto_14145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14144 ?auto_14146 ) ( IN-CITY ?auto_14141 ?auto_14146 ) ( not ( = ?auto_14141 ?auto_14144 ) ) ( not ( = ?auto_14147 ?auto_14142 ) ) ( OBJ-AT ?auto_14142 ?auto_14144 ) ( TRUCK-AT ?auto_14143 ?auto_14145 ) ( IN-CITY ?auto_14145 ?auto_14146 ) ( not ( = ?auto_14141 ?auto_14145 ) ) ( not ( = ?auto_14144 ?auto_14145 ) ) ( OBJ-AT ?auto_14147 ?auto_14145 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14147 ?auto_14143 ?auto_14145 )
      ( DELIVER-2PKG ?auto_14147 ?auto_14142 ?auto_14141 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14149 - OBJ
      ?auto_14150 - OBJ
      ?auto_14148 - LOCATION
    )
    :vars
    (
      ?auto_14153 - LOCATION
      ?auto_14154 - CITY
      ?auto_14151 - TRUCK
      ?auto_14152 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14153 ?auto_14154 ) ( IN-CITY ?auto_14148 ?auto_14154 ) ( not ( = ?auto_14148 ?auto_14153 ) ) ( not ( = ?auto_14149 ?auto_14150 ) ) ( OBJ-AT ?auto_14150 ?auto_14153 ) ( TRUCK-AT ?auto_14151 ?auto_14152 ) ( IN-CITY ?auto_14152 ?auto_14154 ) ( not ( = ?auto_14148 ?auto_14152 ) ) ( not ( = ?auto_14153 ?auto_14152 ) ) ( OBJ-AT ?auto_14149 ?auto_14152 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14150 ?auto_14148 ) )
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
      ?auto_14158 - CITY
      ?auto_14160 - TRUCK
      ?auto_14161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14159 ?auto_14158 ) ( IN-CITY ?auto_14155 ?auto_14158 ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( not ( = ?auto_14157 ?auto_14156 ) ) ( OBJ-AT ?auto_14156 ?auto_14159 ) ( TRUCK-AT ?auto_14160 ?auto_14161 ) ( IN-CITY ?auto_14161 ?auto_14158 ) ( not ( = ?auto_14155 ?auto_14161 ) ) ( not ( = ?auto_14159 ?auto_14161 ) ) ( OBJ-AT ?auto_14157 ?auto_14161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14157 ?auto_14156 ?auto_14155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14228 - OBJ
      ?auto_14227 - LOCATION
    )
    :vars
    (
      ?auto_14231 - LOCATION
      ?auto_14229 - CITY
      ?auto_14230 - OBJ
      ?auto_14233 - LOCATION
      ?auto_14232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14231 ?auto_14229 ) ( IN-CITY ?auto_14227 ?auto_14229 ) ( not ( = ?auto_14227 ?auto_14231 ) ) ( not ( = ?auto_14230 ?auto_14228 ) ) ( OBJ-AT ?auto_14228 ?auto_14231 ) ( IN-CITY ?auto_14233 ?auto_14229 ) ( not ( = ?auto_14227 ?auto_14233 ) ) ( not ( = ?auto_14231 ?auto_14233 ) ) ( OBJ-AT ?auto_14230 ?auto_14233 ) ( TRUCK-AT ?auto_14232 ?auto_14227 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14232 ?auto_14227 ?auto_14233 ?auto_14229 )
      ( DELIVER-2PKG ?auto_14230 ?auto_14228 ?auto_14227 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14235 - OBJ
      ?auto_14236 - OBJ
      ?auto_14234 - LOCATION
    )
    :vars
    (
      ?auto_14240 - LOCATION
      ?auto_14238 - CITY
      ?auto_14239 - LOCATION
      ?auto_14237 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14240 ?auto_14238 ) ( IN-CITY ?auto_14234 ?auto_14238 ) ( not ( = ?auto_14234 ?auto_14240 ) ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( OBJ-AT ?auto_14236 ?auto_14240 ) ( IN-CITY ?auto_14239 ?auto_14238 ) ( not ( = ?auto_14234 ?auto_14239 ) ) ( not ( = ?auto_14240 ?auto_14239 ) ) ( OBJ-AT ?auto_14235 ?auto_14239 ) ( TRUCK-AT ?auto_14237 ?auto_14234 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14236 ?auto_14234 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14242 - OBJ
      ?auto_14243 - OBJ
      ?auto_14241 - LOCATION
    )
    :vars
    (
      ?auto_14244 - LOCATION
      ?auto_14247 - CITY
      ?auto_14246 - LOCATION
      ?auto_14245 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14244 ?auto_14247 ) ( IN-CITY ?auto_14241 ?auto_14247 ) ( not ( = ?auto_14241 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14242 ) ) ( OBJ-AT ?auto_14242 ?auto_14244 ) ( IN-CITY ?auto_14246 ?auto_14247 ) ( not ( = ?auto_14241 ?auto_14246 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( OBJ-AT ?auto_14243 ?auto_14246 ) ( TRUCK-AT ?auto_14245 ?auto_14241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14243 ?auto_14242 ?auto_14241 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14407 - OBJ
      ?auto_14406 - LOCATION
    )
    :vars
    (
      ?auto_14408 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14408 ?auto_14406 ) ( IN-TRUCK ?auto_14407 ?auto_14408 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14407 ?auto_14408 ?auto_14406 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14410 - OBJ
      ?auto_14411 - OBJ
      ?auto_14409 - LOCATION
    )
    :vars
    (
      ?auto_14412 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14412 ?auto_14409 ) ( IN-TRUCK ?auto_14411 ?auto_14412 ) ( OBJ-AT ?auto_14410 ?auto_14409 ) ( not ( = ?auto_14410 ?auto_14411 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14411 ?auto_14409 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14414 - OBJ
      ?auto_14415 - OBJ
      ?auto_14413 - LOCATION
    )
    :vars
    (
      ?auto_14416 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14416 ?auto_14413 ) ( IN-TRUCK ?auto_14415 ?auto_14416 ) ( OBJ-AT ?auto_14414 ?auto_14413 ) ( not ( = ?auto_14414 ?auto_14415 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14415 ?auto_14413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14418 - OBJ
      ?auto_14419 - OBJ
      ?auto_14417 - LOCATION
    )
    :vars
    (
      ?auto_14420 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14420 ?auto_14417 ) ( IN-TRUCK ?auto_14418 ?auto_14420 ) ( OBJ-AT ?auto_14419 ?auto_14417 ) ( not ( = ?auto_14418 ?auto_14419 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14418 ?auto_14417 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14422 - OBJ
      ?auto_14423 - OBJ
      ?auto_14421 - LOCATION
    )
    :vars
    (
      ?auto_14424 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14424 ?auto_14421 ) ( IN-TRUCK ?auto_14422 ?auto_14424 ) ( OBJ-AT ?auto_14423 ?auto_14421 ) ( not ( = ?auto_14422 ?auto_14423 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14422 ?auto_14421 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14430 - OBJ
      ?auto_14431 - OBJ
      ?auto_14432 - OBJ
      ?auto_14429 - LOCATION
    )
    :vars
    (
      ?auto_14433 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14433 ?auto_14429 ) ( IN-TRUCK ?auto_14432 ?auto_14433 ) ( OBJ-AT ?auto_14430 ?auto_14429 ) ( OBJ-AT ?auto_14431 ?auto_14429 ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14432 ?auto_14429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14435 - OBJ
      ?auto_14436 - OBJ
      ?auto_14437 - OBJ
      ?auto_14434 - LOCATION
    )
    :vars
    (
      ?auto_14438 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14438 ?auto_14434 ) ( IN-TRUCK ?auto_14437 ?auto_14438 ) ( OBJ-AT ?auto_14435 ?auto_14434 ) ( OBJ-AT ?auto_14436 ?auto_14434 ) ( not ( = ?auto_14435 ?auto_14436 ) ) ( not ( = ?auto_14435 ?auto_14437 ) ) ( not ( = ?auto_14436 ?auto_14437 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14437 ?auto_14434 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14440 - OBJ
      ?auto_14441 - OBJ
      ?auto_14442 - OBJ
      ?auto_14439 - LOCATION
    )
    :vars
    (
      ?auto_14443 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14443 ?auto_14439 ) ( IN-TRUCK ?auto_14441 ?auto_14443 ) ( OBJ-AT ?auto_14440 ?auto_14439 ) ( OBJ-AT ?auto_14442 ?auto_14439 ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14442 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14441 ?auto_14439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14445 - OBJ
      ?auto_14446 - OBJ
      ?auto_14447 - OBJ
      ?auto_14444 - LOCATION
    )
    :vars
    (
      ?auto_14448 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14448 ?auto_14444 ) ( IN-TRUCK ?auto_14446 ?auto_14448 ) ( OBJ-AT ?auto_14445 ?auto_14444 ) ( OBJ-AT ?auto_14447 ?auto_14444 ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14447 ) ) ( not ( = ?auto_14446 ?auto_14447 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14446 ?auto_14444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14455 - OBJ
      ?auto_14456 - OBJ
      ?auto_14457 - OBJ
      ?auto_14454 - LOCATION
    )
    :vars
    (
      ?auto_14458 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14458 ?auto_14454 ) ( IN-TRUCK ?auto_14457 ?auto_14458 ) ( OBJ-AT ?auto_14455 ?auto_14454 ) ( OBJ-AT ?auto_14456 ?auto_14454 ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14457 ) ) ( not ( = ?auto_14456 ?auto_14457 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14457 ?auto_14454 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14460 - OBJ
      ?auto_14461 - OBJ
      ?auto_14462 - OBJ
      ?auto_14459 - LOCATION
    )
    :vars
    (
      ?auto_14463 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14463 ?auto_14459 ) ( IN-TRUCK ?auto_14462 ?auto_14463 ) ( OBJ-AT ?auto_14460 ?auto_14459 ) ( OBJ-AT ?auto_14461 ?auto_14459 ) ( not ( = ?auto_14460 ?auto_14461 ) ) ( not ( = ?auto_14460 ?auto_14462 ) ) ( not ( = ?auto_14461 ?auto_14462 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14462 ?auto_14459 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14465 - OBJ
      ?auto_14466 - OBJ
      ?auto_14467 - OBJ
      ?auto_14464 - LOCATION
    )
    :vars
    (
      ?auto_14468 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14468 ?auto_14464 ) ( IN-TRUCK ?auto_14466 ?auto_14468 ) ( OBJ-AT ?auto_14465 ?auto_14464 ) ( OBJ-AT ?auto_14467 ?auto_14464 ) ( not ( = ?auto_14465 ?auto_14466 ) ) ( not ( = ?auto_14465 ?auto_14467 ) ) ( not ( = ?auto_14466 ?auto_14467 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14466 ?auto_14464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14470 - OBJ
      ?auto_14471 - OBJ
      ?auto_14472 - OBJ
      ?auto_14469 - LOCATION
    )
    :vars
    (
      ?auto_14473 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14473 ?auto_14469 ) ( IN-TRUCK ?auto_14471 ?auto_14473 ) ( OBJ-AT ?auto_14470 ?auto_14469 ) ( OBJ-AT ?auto_14472 ?auto_14469 ) ( not ( = ?auto_14470 ?auto_14471 ) ) ( not ( = ?auto_14470 ?auto_14472 ) ) ( not ( = ?auto_14471 ?auto_14472 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14471 ?auto_14469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14480 - OBJ
      ?auto_14481 - OBJ
      ?auto_14482 - OBJ
      ?auto_14479 - LOCATION
    )
    :vars
    (
      ?auto_14483 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14483 ?auto_14479 ) ( IN-TRUCK ?auto_14480 ?auto_14483 ) ( OBJ-AT ?auto_14481 ?auto_14479 ) ( OBJ-AT ?auto_14482 ?auto_14479 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14480 ?auto_14479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14485 - OBJ
      ?auto_14486 - OBJ
      ?auto_14487 - OBJ
      ?auto_14484 - LOCATION
    )
    :vars
    (
      ?auto_14488 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14488 ?auto_14484 ) ( IN-TRUCK ?auto_14485 ?auto_14488 ) ( OBJ-AT ?auto_14486 ?auto_14484 ) ( OBJ-AT ?auto_14487 ?auto_14484 ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14487 ) ) ( not ( = ?auto_14486 ?auto_14487 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14485 ?auto_14484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14495 - OBJ
      ?auto_14496 - OBJ
      ?auto_14497 - OBJ
      ?auto_14494 - LOCATION
    )
    :vars
    (
      ?auto_14498 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14498 ?auto_14494 ) ( IN-TRUCK ?auto_14495 ?auto_14498 ) ( OBJ-AT ?auto_14496 ?auto_14494 ) ( OBJ-AT ?auto_14497 ?auto_14494 ) ( not ( = ?auto_14495 ?auto_14496 ) ) ( not ( = ?auto_14495 ?auto_14497 ) ) ( not ( = ?auto_14496 ?auto_14497 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14495 ?auto_14494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14500 - OBJ
      ?auto_14501 - OBJ
      ?auto_14502 - OBJ
      ?auto_14499 - LOCATION
    )
    :vars
    (
      ?auto_14503 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14503 ?auto_14499 ) ( IN-TRUCK ?auto_14500 ?auto_14503 ) ( OBJ-AT ?auto_14501 ?auto_14499 ) ( OBJ-AT ?auto_14502 ?auto_14499 ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( not ( = ?auto_14501 ?auto_14502 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14500 ?auto_14499 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14525 - OBJ
      ?auto_14524 - LOCATION
    )
    :vars
    (
      ?auto_14526 - TRUCK
      ?auto_14527 - LOCATION
      ?auto_14528 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14525 ?auto_14526 ) ( TRUCK-AT ?auto_14526 ?auto_14527 ) ( IN-CITY ?auto_14527 ?auto_14528 ) ( IN-CITY ?auto_14524 ?auto_14528 ) ( not ( = ?auto_14524 ?auto_14527 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14526 ?auto_14527 ?auto_14524 ?auto_14528 )
      ( DELIVER-1PKG ?auto_14525 ?auto_14524 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14530 - OBJ
      ?auto_14531 - OBJ
      ?auto_14529 - LOCATION
    )
    :vars
    (
      ?auto_14533 - TRUCK
      ?auto_14534 - LOCATION
      ?auto_14532 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14531 ?auto_14533 ) ( TRUCK-AT ?auto_14533 ?auto_14534 ) ( IN-CITY ?auto_14534 ?auto_14532 ) ( IN-CITY ?auto_14529 ?auto_14532 ) ( not ( = ?auto_14529 ?auto_14534 ) ) ( OBJ-AT ?auto_14530 ?auto_14529 ) ( not ( = ?auto_14530 ?auto_14531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14531 ?auto_14529 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14536 - OBJ
      ?auto_14537 - OBJ
      ?auto_14535 - LOCATION
    )
    :vars
    (
      ?auto_14538 - TRUCK
      ?auto_14540 - LOCATION
      ?auto_14539 - CITY
      ?auto_14541 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14537 ?auto_14538 ) ( TRUCK-AT ?auto_14538 ?auto_14540 ) ( IN-CITY ?auto_14540 ?auto_14539 ) ( IN-CITY ?auto_14535 ?auto_14539 ) ( not ( = ?auto_14535 ?auto_14540 ) ) ( OBJ-AT ?auto_14541 ?auto_14535 ) ( not ( = ?auto_14541 ?auto_14537 ) ) ( OBJ-AT ?auto_14536 ?auto_14535 ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14541 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14541 ?auto_14537 ?auto_14535 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14543 - OBJ
      ?auto_14544 - OBJ
      ?auto_14542 - LOCATION
    )
    :vars
    (
      ?auto_14545 - TRUCK
      ?auto_14547 - LOCATION
      ?auto_14546 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14543 ?auto_14545 ) ( TRUCK-AT ?auto_14545 ?auto_14547 ) ( IN-CITY ?auto_14547 ?auto_14546 ) ( IN-CITY ?auto_14542 ?auto_14546 ) ( not ( = ?auto_14542 ?auto_14547 ) ) ( OBJ-AT ?auto_14544 ?auto_14542 ) ( not ( = ?auto_14544 ?auto_14543 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14544 ?auto_14543 ?auto_14542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14549 - OBJ
      ?auto_14550 - OBJ
      ?auto_14548 - LOCATION
    )
    :vars
    (
      ?auto_14551 - TRUCK
      ?auto_14553 - LOCATION
      ?auto_14552 - CITY
      ?auto_14554 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14549 ?auto_14551 ) ( TRUCK-AT ?auto_14551 ?auto_14553 ) ( IN-CITY ?auto_14553 ?auto_14552 ) ( IN-CITY ?auto_14548 ?auto_14552 ) ( not ( = ?auto_14548 ?auto_14553 ) ) ( OBJ-AT ?auto_14554 ?auto_14548 ) ( not ( = ?auto_14554 ?auto_14549 ) ) ( OBJ-AT ?auto_14550 ?auto_14548 ) ( not ( = ?auto_14549 ?auto_14550 ) ) ( not ( = ?auto_14550 ?auto_14554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14554 ?auto_14549 ?auto_14548 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14563 - OBJ
      ?auto_14564 - OBJ
      ?auto_14565 - OBJ
      ?auto_14562 - LOCATION
    )
    :vars
    (
      ?auto_14566 - TRUCK
      ?auto_14568 - LOCATION
      ?auto_14567 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14565 ?auto_14566 ) ( TRUCK-AT ?auto_14566 ?auto_14568 ) ( IN-CITY ?auto_14568 ?auto_14567 ) ( IN-CITY ?auto_14562 ?auto_14567 ) ( not ( = ?auto_14562 ?auto_14568 ) ) ( OBJ-AT ?auto_14563 ?auto_14562 ) ( not ( = ?auto_14563 ?auto_14565 ) ) ( OBJ-AT ?auto_14564 ?auto_14562 ) ( not ( = ?auto_14563 ?auto_14564 ) ) ( not ( = ?auto_14564 ?auto_14565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14563 ?auto_14565 ?auto_14562 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14570 - OBJ
      ?auto_14571 - OBJ
      ?auto_14572 - OBJ
      ?auto_14569 - LOCATION
    )
    :vars
    (
      ?auto_14573 - TRUCK
      ?auto_14575 - LOCATION
      ?auto_14574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14572 ?auto_14573 ) ( TRUCK-AT ?auto_14573 ?auto_14575 ) ( IN-CITY ?auto_14575 ?auto_14574 ) ( IN-CITY ?auto_14569 ?auto_14574 ) ( not ( = ?auto_14569 ?auto_14575 ) ) ( OBJ-AT ?auto_14570 ?auto_14569 ) ( not ( = ?auto_14570 ?auto_14572 ) ) ( OBJ-AT ?auto_14571 ?auto_14569 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( not ( = ?auto_14571 ?auto_14572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14570 ?auto_14572 ?auto_14569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14577 - OBJ
      ?auto_14578 - OBJ
      ?auto_14579 - OBJ
      ?auto_14576 - LOCATION
    )
    :vars
    (
      ?auto_14580 - TRUCK
      ?auto_14582 - LOCATION
      ?auto_14581 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14578 ?auto_14580 ) ( TRUCK-AT ?auto_14580 ?auto_14582 ) ( IN-CITY ?auto_14582 ?auto_14581 ) ( IN-CITY ?auto_14576 ?auto_14581 ) ( not ( = ?auto_14576 ?auto_14582 ) ) ( OBJ-AT ?auto_14579 ?auto_14576 ) ( not ( = ?auto_14579 ?auto_14578 ) ) ( OBJ-AT ?auto_14577 ?auto_14576 ) ( not ( = ?auto_14577 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14579 ?auto_14578 ?auto_14576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14584 - OBJ
      ?auto_14585 - OBJ
      ?auto_14586 - OBJ
      ?auto_14583 - LOCATION
    )
    :vars
    (
      ?auto_14587 - TRUCK
      ?auto_14589 - LOCATION
      ?auto_14588 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14585 ?auto_14587 ) ( TRUCK-AT ?auto_14587 ?auto_14589 ) ( IN-CITY ?auto_14589 ?auto_14588 ) ( IN-CITY ?auto_14583 ?auto_14588 ) ( not ( = ?auto_14583 ?auto_14589 ) ) ( OBJ-AT ?auto_14584 ?auto_14583 ) ( not ( = ?auto_14584 ?auto_14585 ) ) ( OBJ-AT ?auto_14586 ?auto_14583 ) ( not ( = ?auto_14584 ?auto_14586 ) ) ( not ( = ?auto_14585 ?auto_14586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14584 ?auto_14585 ?auto_14583 ) )
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
      ?auto_14603 - LOCATION
      ?auto_14602 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14600 ?auto_14601 ) ( TRUCK-AT ?auto_14601 ?auto_14603 ) ( IN-CITY ?auto_14603 ?auto_14602 ) ( IN-CITY ?auto_14597 ?auto_14602 ) ( not ( = ?auto_14597 ?auto_14603 ) ) ( OBJ-AT ?auto_14599 ?auto_14597 ) ( not ( = ?auto_14599 ?auto_14600 ) ) ( OBJ-AT ?auto_14598 ?auto_14597 ) ( not ( = ?auto_14598 ?auto_14599 ) ) ( not ( = ?auto_14598 ?auto_14600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14599 ?auto_14600 ?auto_14597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14605 - OBJ
      ?auto_14606 - OBJ
      ?auto_14607 - OBJ
      ?auto_14604 - LOCATION
    )
    :vars
    (
      ?auto_14608 - TRUCK
      ?auto_14610 - LOCATION
      ?auto_14609 - CITY
      ?auto_14611 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14607 ?auto_14608 ) ( TRUCK-AT ?auto_14608 ?auto_14610 ) ( IN-CITY ?auto_14610 ?auto_14609 ) ( IN-CITY ?auto_14604 ?auto_14609 ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( OBJ-AT ?auto_14611 ?auto_14604 ) ( not ( = ?auto_14611 ?auto_14607 ) ) ( OBJ-AT ?auto_14605 ?auto_14604 ) ( OBJ-AT ?auto_14606 ?auto_14604 ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14607 ) ) ( not ( = ?auto_14605 ?auto_14611 ) ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14606 ?auto_14611 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14611 ?auto_14607 ?auto_14604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14613 - OBJ
      ?auto_14614 - OBJ
      ?auto_14615 - OBJ
      ?auto_14612 - LOCATION
    )
    :vars
    (
      ?auto_14616 - TRUCK
      ?auto_14618 - LOCATION
      ?auto_14617 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14614 ?auto_14616 ) ( TRUCK-AT ?auto_14616 ?auto_14618 ) ( IN-CITY ?auto_14618 ?auto_14617 ) ( IN-CITY ?auto_14612 ?auto_14617 ) ( not ( = ?auto_14612 ?auto_14618 ) ) ( OBJ-AT ?auto_14615 ?auto_14612 ) ( not ( = ?auto_14615 ?auto_14614 ) ) ( OBJ-AT ?auto_14613 ?auto_14612 ) ( not ( = ?auto_14613 ?auto_14614 ) ) ( not ( = ?auto_14613 ?auto_14615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14615 ?auto_14614 ?auto_14612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14620 - OBJ
      ?auto_14621 - OBJ
      ?auto_14622 - OBJ
      ?auto_14619 - LOCATION
    )
    :vars
    (
      ?auto_14623 - TRUCK
      ?auto_14625 - LOCATION
      ?auto_14624 - CITY
      ?auto_14626 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14621 ?auto_14623 ) ( TRUCK-AT ?auto_14623 ?auto_14625 ) ( IN-CITY ?auto_14625 ?auto_14624 ) ( IN-CITY ?auto_14619 ?auto_14624 ) ( not ( = ?auto_14619 ?auto_14625 ) ) ( OBJ-AT ?auto_14626 ?auto_14619 ) ( not ( = ?auto_14626 ?auto_14621 ) ) ( OBJ-AT ?auto_14620 ?auto_14619 ) ( OBJ-AT ?auto_14622 ?auto_14619 ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( not ( = ?auto_14620 ?auto_14622 ) ) ( not ( = ?auto_14620 ?auto_14626 ) ) ( not ( = ?auto_14621 ?auto_14622 ) ) ( not ( = ?auto_14622 ?auto_14626 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14626 ?auto_14621 ?auto_14619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14636 - OBJ
      ?auto_14637 - OBJ
      ?auto_14638 - OBJ
      ?auto_14635 - LOCATION
    )
    :vars
    (
      ?auto_14639 - TRUCK
      ?auto_14641 - LOCATION
      ?auto_14640 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14636 ?auto_14639 ) ( TRUCK-AT ?auto_14639 ?auto_14641 ) ( IN-CITY ?auto_14641 ?auto_14640 ) ( IN-CITY ?auto_14635 ?auto_14640 ) ( not ( = ?auto_14635 ?auto_14641 ) ) ( OBJ-AT ?auto_14638 ?auto_14635 ) ( not ( = ?auto_14638 ?auto_14636 ) ) ( OBJ-AT ?auto_14637 ?auto_14635 ) ( not ( = ?auto_14636 ?auto_14637 ) ) ( not ( = ?auto_14637 ?auto_14638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14638 ?auto_14636 ?auto_14635 ) )
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
      ?auto_14648 - LOCATION
      ?auto_14647 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14643 ?auto_14646 ) ( TRUCK-AT ?auto_14646 ?auto_14648 ) ( IN-CITY ?auto_14648 ?auto_14647 ) ( IN-CITY ?auto_14642 ?auto_14647 ) ( not ( = ?auto_14642 ?auto_14648 ) ) ( OBJ-AT ?auto_14644 ?auto_14642 ) ( not ( = ?auto_14644 ?auto_14643 ) ) ( OBJ-AT ?auto_14645 ?auto_14642 ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14644 ?auto_14643 ?auto_14642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14657 - OBJ
      ?auto_14658 - OBJ
      ?auto_14659 - OBJ
      ?auto_14656 - LOCATION
    )
    :vars
    (
      ?auto_14660 - TRUCK
      ?auto_14662 - LOCATION
      ?auto_14661 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14657 ?auto_14660 ) ( TRUCK-AT ?auto_14660 ?auto_14662 ) ( IN-CITY ?auto_14662 ?auto_14661 ) ( IN-CITY ?auto_14656 ?auto_14661 ) ( not ( = ?auto_14656 ?auto_14662 ) ) ( OBJ-AT ?auto_14659 ?auto_14656 ) ( not ( = ?auto_14659 ?auto_14657 ) ) ( OBJ-AT ?auto_14658 ?auto_14656 ) ( not ( = ?auto_14657 ?auto_14658 ) ) ( not ( = ?auto_14658 ?auto_14659 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14659 ?auto_14657 ?auto_14656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14664 - OBJ
      ?auto_14665 - OBJ
      ?auto_14666 - OBJ
      ?auto_14663 - LOCATION
    )
    :vars
    (
      ?auto_14667 - TRUCK
      ?auto_14669 - LOCATION
      ?auto_14668 - CITY
      ?auto_14670 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14664 ?auto_14667 ) ( TRUCK-AT ?auto_14667 ?auto_14669 ) ( IN-CITY ?auto_14669 ?auto_14668 ) ( IN-CITY ?auto_14663 ?auto_14668 ) ( not ( = ?auto_14663 ?auto_14669 ) ) ( OBJ-AT ?auto_14670 ?auto_14663 ) ( not ( = ?auto_14670 ?auto_14664 ) ) ( OBJ-AT ?auto_14665 ?auto_14663 ) ( OBJ-AT ?auto_14666 ?auto_14663 ) ( not ( = ?auto_14664 ?auto_14665 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14670 ) ) ( not ( = ?auto_14666 ?auto_14670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14670 ?auto_14664 ?auto_14663 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14703 - OBJ
      ?auto_14702 - LOCATION
    )
    :vars
    (
      ?auto_14704 - TRUCK
      ?auto_14706 - LOCATION
      ?auto_14705 - CITY
      ?auto_14707 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14704 ?auto_14706 ) ( IN-CITY ?auto_14706 ?auto_14705 ) ( IN-CITY ?auto_14702 ?auto_14705 ) ( not ( = ?auto_14702 ?auto_14706 ) ) ( OBJ-AT ?auto_14707 ?auto_14702 ) ( not ( = ?auto_14707 ?auto_14703 ) ) ( OBJ-AT ?auto_14703 ?auto_14706 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14703 ?auto_14704 ?auto_14706 )
      ( DELIVER-2PKG ?auto_14707 ?auto_14703 ?auto_14702 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14709 - OBJ
      ?auto_14710 - OBJ
      ?auto_14708 - LOCATION
    )
    :vars
    (
      ?auto_14713 - TRUCK
      ?auto_14711 - LOCATION
      ?auto_14712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14713 ?auto_14711 ) ( IN-CITY ?auto_14711 ?auto_14712 ) ( IN-CITY ?auto_14708 ?auto_14712 ) ( not ( = ?auto_14708 ?auto_14711 ) ) ( OBJ-AT ?auto_14709 ?auto_14708 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( OBJ-AT ?auto_14710 ?auto_14711 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14710 ?auto_14708 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14715 - OBJ
      ?auto_14716 - OBJ
      ?auto_14714 - LOCATION
    )
    :vars
    (
      ?auto_14717 - TRUCK
      ?auto_14718 - LOCATION
      ?auto_14719 - CITY
      ?auto_14720 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14717 ?auto_14718 ) ( IN-CITY ?auto_14718 ?auto_14719 ) ( IN-CITY ?auto_14714 ?auto_14719 ) ( not ( = ?auto_14714 ?auto_14718 ) ) ( OBJ-AT ?auto_14720 ?auto_14714 ) ( not ( = ?auto_14720 ?auto_14716 ) ) ( OBJ-AT ?auto_14716 ?auto_14718 ) ( OBJ-AT ?auto_14715 ?auto_14714 ) ( not ( = ?auto_14715 ?auto_14716 ) ) ( not ( = ?auto_14715 ?auto_14720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14720 ?auto_14716 ?auto_14714 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14722 - OBJ
      ?auto_14723 - OBJ
      ?auto_14721 - LOCATION
    )
    :vars
    (
      ?auto_14724 - TRUCK
      ?auto_14725 - LOCATION
      ?auto_14726 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14724 ?auto_14725 ) ( IN-CITY ?auto_14725 ?auto_14726 ) ( IN-CITY ?auto_14721 ?auto_14726 ) ( not ( = ?auto_14721 ?auto_14725 ) ) ( OBJ-AT ?auto_14723 ?auto_14721 ) ( not ( = ?auto_14723 ?auto_14722 ) ) ( OBJ-AT ?auto_14722 ?auto_14725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14723 ?auto_14722 ?auto_14721 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14728 - OBJ
      ?auto_14729 - OBJ
      ?auto_14727 - LOCATION
    )
    :vars
    (
      ?auto_14730 - TRUCK
      ?auto_14731 - LOCATION
      ?auto_14732 - CITY
      ?auto_14733 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14730 ?auto_14731 ) ( IN-CITY ?auto_14731 ?auto_14732 ) ( IN-CITY ?auto_14727 ?auto_14732 ) ( not ( = ?auto_14727 ?auto_14731 ) ) ( OBJ-AT ?auto_14733 ?auto_14727 ) ( not ( = ?auto_14733 ?auto_14728 ) ) ( OBJ-AT ?auto_14728 ?auto_14731 ) ( OBJ-AT ?auto_14729 ?auto_14727 ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14733 ?auto_14728 ?auto_14727 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14742 - OBJ
      ?auto_14743 - OBJ
      ?auto_14744 - OBJ
      ?auto_14741 - LOCATION
    )
    :vars
    (
      ?auto_14745 - TRUCK
      ?auto_14746 - LOCATION
      ?auto_14747 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14745 ?auto_14746 ) ( IN-CITY ?auto_14746 ?auto_14747 ) ( IN-CITY ?auto_14741 ?auto_14747 ) ( not ( = ?auto_14741 ?auto_14746 ) ) ( OBJ-AT ?auto_14743 ?auto_14741 ) ( not ( = ?auto_14743 ?auto_14744 ) ) ( OBJ-AT ?auto_14744 ?auto_14746 ) ( OBJ-AT ?auto_14742 ?auto_14741 ) ( not ( = ?auto_14742 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14744 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14743 ?auto_14744 ?auto_14741 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14749 - OBJ
      ?auto_14750 - OBJ
      ?auto_14751 - OBJ
      ?auto_14748 - LOCATION
    )
    :vars
    (
      ?auto_14752 - TRUCK
      ?auto_14753 - LOCATION
      ?auto_14754 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14752 ?auto_14753 ) ( IN-CITY ?auto_14753 ?auto_14754 ) ( IN-CITY ?auto_14748 ?auto_14754 ) ( not ( = ?auto_14748 ?auto_14753 ) ) ( OBJ-AT ?auto_14749 ?auto_14748 ) ( not ( = ?auto_14749 ?auto_14751 ) ) ( OBJ-AT ?auto_14751 ?auto_14753 ) ( OBJ-AT ?auto_14750 ?auto_14748 ) ( not ( = ?auto_14749 ?auto_14750 ) ) ( not ( = ?auto_14750 ?auto_14751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14749 ?auto_14751 ?auto_14748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14756 - OBJ
      ?auto_14757 - OBJ
      ?auto_14758 - OBJ
      ?auto_14755 - LOCATION
    )
    :vars
    (
      ?auto_14759 - TRUCK
      ?auto_14760 - LOCATION
      ?auto_14761 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14759 ?auto_14760 ) ( IN-CITY ?auto_14760 ?auto_14761 ) ( IN-CITY ?auto_14755 ?auto_14761 ) ( not ( = ?auto_14755 ?auto_14760 ) ) ( OBJ-AT ?auto_14758 ?auto_14755 ) ( not ( = ?auto_14758 ?auto_14757 ) ) ( OBJ-AT ?auto_14757 ?auto_14760 ) ( OBJ-AT ?auto_14756 ?auto_14755 ) ( not ( = ?auto_14756 ?auto_14757 ) ) ( not ( = ?auto_14756 ?auto_14758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14758 ?auto_14757 ?auto_14755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14763 - OBJ
      ?auto_14764 - OBJ
      ?auto_14765 - OBJ
      ?auto_14762 - LOCATION
    )
    :vars
    (
      ?auto_14766 - TRUCK
      ?auto_14767 - LOCATION
      ?auto_14768 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14766 ?auto_14767 ) ( IN-CITY ?auto_14767 ?auto_14768 ) ( IN-CITY ?auto_14762 ?auto_14768 ) ( not ( = ?auto_14762 ?auto_14767 ) ) ( OBJ-AT ?auto_14763 ?auto_14762 ) ( not ( = ?auto_14763 ?auto_14764 ) ) ( OBJ-AT ?auto_14764 ?auto_14767 ) ( OBJ-AT ?auto_14765 ?auto_14762 ) ( not ( = ?auto_14763 ?auto_14765 ) ) ( not ( = ?auto_14764 ?auto_14765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14763 ?auto_14764 ?auto_14762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14777 - OBJ
      ?auto_14778 - OBJ
      ?auto_14779 - OBJ
      ?auto_14776 - LOCATION
    )
    :vars
    (
      ?auto_14780 - TRUCK
      ?auto_14781 - LOCATION
      ?auto_14782 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14780 ?auto_14781 ) ( IN-CITY ?auto_14781 ?auto_14782 ) ( IN-CITY ?auto_14776 ?auto_14782 ) ( not ( = ?auto_14776 ?auto_14781 ) ) ( OBJ-AT ?auto_14778 ?auto_14776 ) ( not ( = ?auto_14778 ?auto_14779 ) ) ( OBJ-AT ?auto_14779 ?auto_14781 ) ( OBJ-AT ?auto_14777 ?auto_14776 ) ( not ( = ?auto_14777 ?auto_14778 ) ) ( not ( = ?auto_14777 ?auto_14779 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14778 ?auto_14779 ?auto_14776 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14784 - OBJ
      ?auto_14785 - OBJ
      ?auto_14786 - OBJ
      ?auto_14783 - LOCATION
    )
    :vars
    (
      ?auto_14787 - TRUCK
      ?auto_14788 - LOCATION
      ?auto_14789 - CITY
      ?auto_14790 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14787 ?auto_14788 ) ( IN-CITY ?auto_14788 ?auto_14789 ) ( IN-CITY ?auto_14783 ?auto_14789 ) ( not ( = ?auto_14783 ?auto_14788 ) ) ( OBJ-AT ?auto_14790 ?auto_14783 ) ( not ( = ?auto_14790 ?auto_14786 ) ) ( OBJ-AT ?auto_14786 ?auto_14788 ) ( OBJ-AT ?auto_14784 ?auto_14783 ) ( OBJ-AT ?auto_14785 ?auto_14783 ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14784 ?auto_14786 ) ) ( not ( = ?auto_14784 ?auto_14790 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( not ( = ?auto_14785 ?auto_14790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14790 ?auto_14786 ?auto_14783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14792 - OBJ
      ?auto_14793 - OBJ
      ?auto_14794 - OBJ
      ?auto_14791 - LOCATION
    )
    :vars
    (
      ?auto_14795 - TRUCK
      ?auto_14796 - LOCATION
      ?auto_14797 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14795 ?auto_14796 ) ( IN-CITY ?auto_14796 ?auto_14797 ) ( IN-CITY ?auto_14791 ?auto_14797 ) ( not ( = ?auto_14791 ?auto_14796 ) ) ( OBJ-AT ?auto_14794 ?auto_14791 ) ( not ( = ?auto_14794 ?auto_14793 ) ) ( OBJ-AT ?auto_14793 ?auto_14796 ) ( OBJ-AT ?auto_14792 ?auto_14791 ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14794 ?auto_14793 ?auto_14791 ) )
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
      ?auto_14803 - LOCATION
      ?auto_14804 - CITY
      ?auto_14805 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14802 ?auto_14803 ) ( IN-CITY ?auto_14803 ?auto_14804 ) ( IN-CITY ?auto_14798 ?auto_14804 ) ( not ( = ?auto_14798 ?auto_14803 ) ) ( OBJ-AT ?auto_14805 ?auto_14798 ) ( not ( = ?auto_14805 ?auto_14800 ) ) ( OBJ-AT ?auto_14800 ?auto_14803 ) ( OBJ-AT ?auto_14799 ?auto_14798 ) ( OBJ-AT ?auto_14801 ?auto_14798 ) ( not ( = ?auto_14799 ?auto_14800 ) ) ( not ( = ?auto_14799 ?auto_14801 ) ) ( not ( = ?auto_14799 ?auto_14805 ) ) ( not ( = ?auto_14800 ?auto_14801 ) ) ( not ( = ?auto_14801 ?auto_14805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14805 ?auto_14800 ?auto_14798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14815 - OBJ
      ?auto_14816 - OBJ
      ?auto_14817 - OBJ
      ?auto_14814 - LOCATION
    )
    :vars
    (
      ?auto_14818 - TRUCK
      ?auto_14819 - LOCATION
      ?auto_14820 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14818 ?auto_14819 ) ( IN-CITY ?auto_14819 ?auto_14820 ) ( IN-CITY ?auto_14814 ?auto_14820 ) ( not ( = ?auto_14814 ?auto_14819 ) ) ( OBJ-AT ?auto_14816 ?auto_14814 ) ( not ( = ?auto_14816 ?auto_14815 ) ) ( OBJ-AT ?auto_14815 ?auto_14819 ) ( OBJ-AT ?auto_14817 ?auto_14814 ) ( not ( = ?auto_14815 ?auto_14817 ) ) ( not ( = ?auto_14816 ?auto_14817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14816 ?auto_14815 ?auto_14814 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14822 - OBJ
      ?auto_14823 - OBJ
      ?auto_14824 - OBJ
      ?auto_14821 - LOCATION
    )
    :vars
    (
      ?auto_14825 - TRUCK
      ?auto_14826 - LOCATION
      ?auto_14827 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14825 ?auto_14826 ) ( IN-CITY ?auto_14826 ?auto_14827 ) ( IN-CITY ?auto_14821 ?auto_14827 ) ( not ( = ?auto_14821 ?auto_14826 ) ) ( OBJ-AT ?auto_14823 ?auto_14821 ) ( not ( = ?auto_14823 ?auto_14822 ) ) ( OBJ-AT ?auto_14822 ?auto_14826 ) ( OBJ-AT ?auto_14824 ?auto_14821 ) ( not ( = ?auto_14822 ?auto_14824 ) ) ( not ( = ?auto_14823 ?auto_14824 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14823 ?auto_14822 ?auto_14821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14836 - OBJ
      ?auto_14837 - OBJ
      ?auto_14838 - OBJ
      ?auto_14835 - LOCATION
    )
    :vars
    (
      ?auto_14839 - TRUCK
      ?auto_14840 - LOCATION
      ?auto_14841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14839 ?auto_14840 ) ( IN-CITY ?auto_14840 ?auto_14841 ) ( IN-CITY ?auto_14835 ?auto_14841 ) ( not ( = ?auto_14835 ?auto_14840 ) ) ( OBJ-AT ?auto_14838 ?auto_14835 ) ( not ( = ?auto_14838 ?auto_14836 ) ) ( OBJ-AT ?auto_14836 ?auto_14840 ) ( OBJ-AT ?auto_14837 ?auto_14835 ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( not ( = ?auto_14837 ?auto_14838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14838 ?auto_14836 ?auto_14835 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14843 - OBJ
      ?auto_14844 - OBJ
      ?auto_14845 - OBJ
      ?auto_14842 - LOCATION
    )
    :vars
    (
      ?auto_14846 - TRUCK
      ?auto_14847 - LOCATION
      ?auto_14848 - CITY
      ?auto_14849 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14846 ?auto_14847 ) ( IN-CITY ?auto_14847 ?auto_14848 ) ( IN-CITY ?auto_14842 ?auto_14848 ) ( not ( = ?auto_14842 ?auto_14847 ) ) ( OBJ-AT ?auto_14849 ?auto_14842 ) ( not ( = ?auto_14849 ?auto_14843 ) ) ( OBJ-AT ?auto_14843 ?auto_14847 ) ( OBJ-AT ?auto_14844 ?auto_14842 ) ( OBJ-AT ?auto_14845 ?auto_14842 ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14849 ) ) ( not ( = ?auto_14845 ?auto_14849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14849 ?auto_14843 ?auto_14842 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14882 - OBJ
      ?auto_14881 - LOCATION
    )
    :vars
    (
      ?auto_14884 - LOCATION
      ?auto_14885 - CITY
      ?auto_14886 - OBJ
      ?auto_14883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14884 ?auto_14885 ) ( IN-CITY ?auto_14881 ?auto_14885 ) ( not ( = ?auto_14881 ?auto_14884 ) ) ( OBJ-AT ?auto_14886 ?auto_14881 ) ( not ( = ?auto_14886 ?auto_14882 ) ) ( OBJ-AT ?auto_14882 ?auto_14884 ) ( TRUCK-AT ?auto_14883 ?auto_14881 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14883 ?auto_14881 ?auto_14884 ?auto_14885 )
      ( DELIVER-2PKG ?auto_14886 ?auto_14882 ?auto_14881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14888 - OBJ
      ?auto_14889 - OBJ
      ?auto_14887 - LOCATION
    )
    :vars
    (
      ?auto_14890 - LOCATION
      ?auto_14891 - CITY
      ?auto_14892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14890 ?auto_14891 ) ( IN-CITY ?auto_14887 ?auto_14891 ) ( not ( = ?auto_14887 ?auto_14890 ) ) ( OBJ-AT ?auto_14888 ?auto_14887 ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( OBJ-AT ?auto_14889 ?auto_14890 ) ( TRUCK-AT ?auto_14892 ?auto_14887 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14889 ?auto_14887 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14894 - OBJ
      ?auto_14895 - OBJ
      ?auto_14893 - LOCATION
    )
    :vars
    (
      ?auto_14896 - LOCATION
      ?auto_14898 - CITY
      ?auto_14899 - OBJ
      ?auto_14897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14896 ?auto_14898 ) ( IN-CITY ?auto_14893 ?auto_14898 ) ( not ( = ?auto_14893 ?auto_14896 ) ) ( OBJ-AT ?auto_14899 ?auto_14893 ) ( not ( = ?auto_14899 ?auto_14895 ) ) ( OBJ-AT ?auto_14895 ?auto_14896 ) ( TRUCK-AT ?auto_14897 ?auto_14893 ) ( OBJ-AT ?auto_14894 ?auto_14893 ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14899 ?auto_14895 ?auto_14893 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14901 - OBJ
      ?auto_14902 - OBJ
      ?auto_14900 - LOCATION
    )
    :vars
    (
      ?auto_14903 - LOCATION
      ?auto_14905 - CITY
      ?auto_14904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14903 ?auto_14905 ) ( IN-CITY ?auto_14900 ?auto_14905 ) ( not ( = ?auto_14900 ?auto_14903 ) ) ( OBJ-AT ?auto_14902 ?auto_14900 ) ( not ( = ?auto_14902 ?auto_14901 ) ) ( OBJ-AT ?auto_14901 ?auto_14903 ) ( TRUCK-AT ?auto_14904 ?auto_14900 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14902 ?auto_14901 ?auto_14900 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14907 - OBJ
      ?auto_14908 - OBJ
      ?auto_14906 - LOCATION
    )
    :vars
    (
      ?auto_14909 - LOCATION
      ?auto_14911 - CITY
      ?auto_14912 - OBJ
      ?auto_14910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14909 ?auto_14911 ) ( IN-CITY ?auto_14906 ?auto_14911 ) ( not ( = ?auto_14906 ?auto_14909 ) ) ( OBJ-AT ?auto_14912 ?auto_14906 ) ( not ( = ?auto_14912 ?auto_14907 ) ) ( OBJ-AT ?auto_14907 ?auto_14909 ) ( TRUCK-AT ?auto_14910 ?auto_14906 ) ( OBJ-AT ?auto_14908 ?auto_14906 ) ( not ( = ?auto_14907 ?auto_14908 ) ) ( not ( = ?auto_14908 ?auto_14912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14912 ?auto_14907 ?auto_14906 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14921 - OBJ
      ?auto_14922 - OBJ
      ?auto_14923 - OBJ
      ?auto_14920 - LOCATION
    )
    :vars
    (
      ?auto_14924 - LOCATION
      ?auto_14926 - CITY
      ?auto_14925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14924 ?auto_14926 ) ( IN-CITY ?auto_14920 ?auto_14926 ) ( not ( = ?auto_14920 ?auto_14924 ) ) ( OBJ-AT ?auto_14921 ?auto_14920 ) ( not ( = ?auto_14921 ?auto_14923 ) ) ( OBJ-AT ?auto_14923 ?auto_14924 ) ( TRUCK-AT ?auto_14925 ?auto_14920 ) ( OBJ-AT ?auto_14922 ?auto_14920 ) ( not ( = ?auto_14921 ?auto_14922 ) ) ( not ( = ?auto_14922 ?auto_14923 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14921 ?auto_14923 ?auto_14920 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14928 - OBJ
      ?auto_14929 - OBJ
      ?auto_14930 - OBJ
      ?auto_14927 - LOCATION
    )
    :vars
    (
      ?auto_14931 - LOCATION
      ?auto_14933 - CITY
      ?auto_14932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14931 ?auto_14933 ) ( IN-CITY ?auto_14927 ?auto_14933 ) ( not ( = ?auto_14927 ?auto_14931 ) ) ( OBJ-AT ?auto_14928 ?auto_14927 ) ( not ( = ?auto_14928 ?auto_14930 ) ) ( OBJ-AT ?auto_14930 ?auto_14931 ) ( TRUCK-AT ?auto_14932 ?auto_14927 ) ( OBJ-AT ?auto_14929 ?auto_14927 ) ( not ( = ?auto_14928 ?auto_14929 ) ) ( not ( = ?auto_14929 ?auto_14930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14928 ?auto_14930 ?auto_14927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14935 - OBJ
      ?auto_14936 - OBJ
      ?auto_14937 - OBJ
      ?auto_14934 - LOCATION
    )
    :vars
    (
      ?auto_14938 - LOCATION
      ?auto_14940 - CITY
      ?auto_14939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14938 ?auto_14940 ) ( IN-CITY ?auto_14934 ?auto_14940 ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( OBJ-AT ?auto_14937 ?auto_14934 ) ( not ( = ?auto_14937 ?auto_14936 ) ) ( OBJ-AT ?auto_14936 ?auto_14938 ) ( TRUCK-AT ?auto_14939 ?auto_14934 ) ( OBJ-AT ?auto_14935 ?auto_14934 ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14937 ?auto_14936 ?auto_14934 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14942 - OBJ
      ?auto_14943 - OBJ
      ?auto_14944 - OBJ
      ?auto_14941 - LOCATION
    )
    :vars
    (
      ?auto_14945 - LOCATION
      ?auto_14947 - CITY
      ?auto_14946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14945 ?auto_14947 ) ( IN-CITY ?auto_14941 ?auto_14947 ) ( not ( = ?auto_14941 ?auto_14945 ) ) ( OBJ-AT ?auto_14942 ?auto_14941 ) ( not ( = ?auto_14942 ?auto_14943 ) ) ( OBJ-AT ?auto_14943 ?auto_14945 ) ( TRUCK-AT ?auto_14946 ?auto_14941 ) ( OBJ-AT ?auto_14944 ?auto_14941 ) ( not ( = ?auto_14942 ?auto_14944 ) ) ( not ( = ?auto_14943 ?auto_14944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14942 ?auto_14943 ?auto_14941 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14956 - OBJ
      ?auto_14957 - OBJ
      ?auto_14958 - OBJ
      ?auto_14955 - LOCATION
    )
    :vars
    (
      ?auto_14959 - LOCATION
      ?auto_14961 - CITY
      ?auto_14960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14959 ?auto_14961 ) ( IN-CITY ?auto_14955 ?auto_14961 ) ( not ( = ?auto_14955 ?auto_14959 ) ) ( OBJ-AT ?auto_14957 ?auto_14955 ) ( not ( = ?auto_14957 ?auto_14958 ) ) ( OBJ-AT ?auto_14958 ?auto_14959 ) ( TRUCK-AT ?auto_14960 ?auto_14955 ) ( OBJ-AT ?auto_14956 ?auto_14955 ) ( not ( = ?auto_14956 ?auto_14957 ) ) ( not ( = ?auto_14956 ?auto_14958 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14957 ?auto_14958 ?auto_14955 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14963 - OBJ
      ?auto_14964 - OBJ
      ?auto_14965 - OBJ
      ?auto_14962 - LOCATION
    )
    :vars
    (
      ?auto_14966 - LOCATION
      ?auto_14968 - CITY
      ?auto_14969 - OBJ
      ?auto_14967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14966 ?auto_14968 ) ( IN-CITY ?auto_14962 ?auto_14968 ) ( not ( = ?auto_14962 ?auto_14966 ) ) ( OBJ-AT ?auto_14969 ?auto_14962 ) ( not ( = ?auto_14969 ?auto_14965 ) ) ( OBJ-AT ?auto_14965 ?auto_14966 ) ( TRUCK-AT ?auto_14967 ?auto_14962 ) ( OBJ-AT ?auto_14963 ?auto_14962 ) ( OBJ-AT ?auto_14964 ?auto_14962 ) ( not ( = ?auto_14963 ?auto_14964 ) ) ( not ( = ?auto_14963 ?auto_14965 ) ) ( not ( = ?auto_14963 ?auto_14969 ) ) ( not ( = ?auto_14964 ?auto_14965 ) ) ( not ( = ?auto_14964 ?auto_14969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14969 ?auto_14965 ?auto_14962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14971 - OBJ
      ?auto_14972 - OBJ
      ?auto_14973 - OBJ
      ?auto_14970 - LOCATION
    )
    :vars
    (
      ?auto_14974 - LOCATION
      ?auto_14976 - CITY
      ?auto_14975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14974 ?auto_14976 ) ( IN-CITY ?auto_14970 ?auto_14976 ) ( not ( = ?auto_14970 ?auto_14974 ) ) ( OBJ-AT ?auto_14973 ?auto_14970 ) ( not ( = ?auto_14973 ?auto_14972 ) ) ( OBJ-AT ?auto_14972 ?auto_14974 ) ( TRUCK-AT ?auto_14975 ?auto_14970 ) ( OBJ-AT ?auto_14971 ?auto_14970 ) ( not ( = ?auto_14971 ?auto_14972 ) ) ( not ( = ?auto_14971 ?auto_14973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14973 ?auto_14972 ?auto_14970 ) )
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
      ?auto_14981 - LOCATION
      ?auto_14983 - CITY
      ?auto_14984 - OBJ
      ?auto_14982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14981 ?auto_14983 ) ( IN-CITY ?auto_14977 ?auto_14983 ) ( not ( = ?auto_14977 ?auto_14981 ) ) ( OBJ-AT ?auto_14984 ?auto_14977 ) ( not ( = ?auto_14984 ?auto_14979 ) ) ( OBJ-AT ?auto_14979 ?auto_14981 ) ( TRUCK-AT ?auto_14982 ?auto_14977 ) ( OBJ-AT ?auto_14978 ?auto_14977 ) ( OBJ-AT ?auto_14980 ?auto_14977 ) ( not ( = ?auto_14978 ?auto_14979 ) ) ( not ( = ?auto_14978 ?auto_14980 ) ) ( not ( = ?auto_14978 ?auto_14984 ) ) ( not ( = ?auto_14979 ?auto_14980 ) ) ( not ( = ?auto_14980 ?auto_14984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14984 ?auto_14979 ?auto_14977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14994 - OBJ
      ?auto_14995 - OBJ
      ?auto_14996 - OBJ
      ?auto_14993 - LOCATION
    )
    :vars
    (
      ?auto_14997 - LOCATION
      ?auto_14999 - CITY
      ?auto_14998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14997 ?auto_14999 ) ( IN-CITY ?auto_14993 ?auto_14999 ) ( not ( = ?auto_14993 ?auto_14997 ) ) ( OBJ-AT ?auto_14995 ?auto_14993 ) ( not ( = ?auto_14995 ?auto_14994 ) ) ( OBJ-AT ?auto_14994 ?auto_14997 ) ( TRUCK-AT ?auto_14998 ?auto_14993 ) ( OBJ-AT ?auto_14996 ?auto_14993 ) ( not ( = ?auto_14994 ?auto_14996 ) ) ( not ( = ?auto_14995 ?auto_14996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14995 ?auto_14994 ?auto_14993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15001 - OBJ
      ?auto_15002 - OBJ
      ?auto_15003 - OBJ
      ?auto_15000 - LOCATION
    )
    :vars
    (
      ?auto_15004 - LOCATION
      ?auto_15006 - CITY
      ?auto_15005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15004 ?auto_15006 ) ( IN-CITY ?auto_15000 ?auto_15006 ) ( not ( = ?auto_15000 ?auto_15004 ) ) ( OBJ-AT ?auto_15002 ?auto_15000 ) ( not ( = ?auto_15002 ?auto_15001 ) ) ( OBJ-AT ?auto_15001 ?auto_15004 ) ( TRUCK-AT ?auto_15005 ?auto_15000 ) ( OBJ-AT ?auto_15003 ?auto_15000 ) ( not ( = ?auto_15001 ?auto_15003 ) ) ( not ( = ?auto_15002 ?auto_15003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15002 ?auto_15001 ?auto_15000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15015 - OBJ
      ?auto_15016 - OBJ
      ?auto_15017 - OBJ
      ?auto_15014 - LOCATION
    )
    :vars
    (
      ?auto_15018 - LOCATION
      ?auto_15020 - CITY
      ?auto_15019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15018 ?auto_15020 ) ( IN-CITY ?auto_15014 ?auto_15020 ) ( not ( = ?auto_15014 ?auto_15018 ) ) ( OBJ-AT ?auto_15017 ?auto_15014 ) ( not ( = ?auto_15017 ?auto_15015 ) ) ( OBJ-AT ?auto_15015 ?auto_15018 ) ( TRUCK-AT ?auto_15019 ?auto_15014 ) ( OBJ-AT ?auto_15016 ?auto_15014 ) ( not ( = ?auto_15015 ?auto_15016 ) ) ( not ( = ?auto_15016 ?auto_15017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15017 ?auto_15015 ?auto_15014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15022 - OBJ
      ?auto_15023 - OBJ
      ?auto_15024 - OBJ
      ?auto_15021 - LOCATION
    )
    :vars
    (
      ?auto_15025 - LOCATION
      ?auto_15027 - CITY
      ?auto_15028 - OBJ
      ?auto_15026 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15025 ?auto_15027 ) ( IN-CITY ?auto_15021 ?auto_15027 ) ( not ( = ?auto_15021 ?auto_15025 ) ) ( OBJ-AT ?auto_15028 ?auto_15021 ) ( not ( = ?auto_15028 ?auto_15022 ) ) ( OBJ-AT ?auto_15022 ?auto_15025 ) ( TRUCK-AT ?auto_15026 ?auto_15021 ) ( OBJ-AT ?auto_15023 ?auto_15021 ) ( OBJ-AT ?auto_15024 ?auto_15021 ) ( not ( = ?auto_15022 ?auto_15023 ) ) ( not ( = ?auto_15022 ?auto_15024 ) ) ( not ( = ?auto_15023 ?auto_15024 ) ) ( not ( = ?auto_15023 ?auto_15028 ) ) ( not ( = ?auto_15024 ?auto_15028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15028 ?auto_15022 ?auto_15021 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15061 - OBJ
      ?auto_15060 - LOCATION
    )
    :vars
    (
      ?auto_15062 - LOCATION
      ?auto_15064 - CITY
      ?auto_15065 - OBJ
      ?auto_15063 - TRUCK
      ?auto_15066 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15062 ?auto_15064 ) ( IN-CITY ?auto_15060 ?auto_15064 ) ( not ( = ?auto_15060 ?auto_15062 ) ) ( OBJ-AT ?auto_15065 ?auto_15060 ) ( not ( = ?auto_15065 ?auto_15061 ) ) ( OBJ-AT ?auto_15061 ?auto_15062 ) ( TRUCK-AT ?auto_15063 ?auto_15060 ) ( IN-TRUCK ?auto_15066 ?auto_15063 ) ( not ( = ?auto_15065 ?auto_15066 ) ) ( not ( = ?auto_15061 ?auto_15066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15065 ?auto_15066 ?auto_15060 )
      ( DELIVER-2PKG ?auto_15065 ?auto_15061 ?auto_15060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15068 - OBJ
      ?auto_15069 - OBJ
      ?auto_15067 - LOCATION
    )
    :vars
    (
      ?auto_15072 - LOCATION
      ?auto_15073 - CITY
      ?auto_15071 - TRUCK
      ?auto_15070 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15072 ?auto_15073 ) ( IN-CITY ?auto_15067 ?auto_15073 ) ( not ( = ?auto_15067 ?auto_15072 ) ) ( OBJ-AT ?auto_15068 ?auto_15067 ) ( not ( = ?auto_15068 ?auto_15069 ) ) ( OBJ-AT ?auto_15069 ?auto_15072 ) ( TRUCK-AT ?auto_15071 ?auto_15067 ) ( IN-TRUCK ?auto_15070 ?auto_15071 ) ( not ( = ?auto_15068 ?auto_15070 ) ) ( not ( = ?auto_15069 ?auto_15070 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15069 ?auto_15067 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15075 - OBJ
      ?auto_15076 - OBJ
      ?auto_15074 - LOCATION
    )
    :vars
    (
      ?auto_15077 - LOCATION
      ?auto_15080 - CITY
      ?auto_15078 - OBJ
      ?auto_15079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15077 ?auto_15080 ) ( IN-CITY ?auto_15074 ?auto_15080 ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( OBJ-AT ?auto_15078 ?auto_15074 ) ( not ( = ?auto_15078 ?auto_15076 ) ) ( OBJ-AT ?auto_15076 ?auto_15077 ) ( TRUCK-AT ?auto_15079 ?auto_15074 ) ( IN-TRUCK ?auto_15075 ?auto_15079 ) ( not ( = ?auto_15078 ?auto_15075 ) ) ( not ( = ?auto_15076 ?auto_15075 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15078 ?auto_15076 ?auto_15074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15082 - OBJ
      ?auto_15083 - OBJ
      ?auto_15081 - LOCATION
    )
    :vars
    (
      ?auto_15085 - LOCATION
      ?auto_15087 - CITY
      ?auto_15086 - TRUCK
      ?auto_15084 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15085 ?auto_15087 ) ( IN-CITY ?auto_15081 ?auto_15087 ) ( not ( = ?auto_15081 ?auto_15085 ) ) ( OBJ-AT ?auto_15083 ?auto_15081 ) ( not ( = ?auto_15083 ?auto_15082 ) ) ( OBJ-AT ?auto_15082 ?auto_15085 ) ( TRUCK-AT ?auto_15086 ?auto_15081 ) ( IN-TRUCK ?auto_15084 ?auto_15086 ) ( not ( = ?auto_15083 ?auto_15084 ) ) ( not ( = ?auto_15082 ?auto_15084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15083 ?auto_15082 ?auto_15081 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15089 - OBJ
      ?auto_15090 - OBJ
      ?auto_15088 - LOCATION
    )
    :vars
    (
      ?auto_15091 - LOCATION
      ?auto_15094 - CITY
      ?auto_15092 - OBJ
      ?auto_15093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15091 ?auto_15094 ) ( IN-CITY ?auto_15088 ?auto_15094 ) ( not ( = ?auto_15088 ?auto_15091 ) ) ( OBJ-AT ?auto_15092 ?auto_15088 ) ( not ( = ?auto_15092 ?auto_15089 ) ) ( OBJ-AT ?auto_15089 ?auto_15091 ) ( TRUCK-AT ?auto_15093 ?auto_15088 ) ( IN-TRUCK ?auto_15090 ?auto_15093 ) ( not ( = ?auto_15092 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15092 ?auto_15089 ?auto_15088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15104 - OBJ
      ?auto_15105 - OBJ
      ?auto_15106 - OBJ
      ?auto_15103 - LOCATION
    )
    :vars
    (
      ?auto_15108 - LOCATION
      ?auto_15110 - CITY
      ?auto_15109 - TRUCK
      ?auto_15107 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15108 ?auto_15110 ) ( IN-CITY ?auto_15103 ?auto_15110 ) ( not ( = ?auto_15103 ?auto_15108 ) ) ( OBJ-AT ?auto_15104 ?auto_15103 ) ( not ( = ?auto_15104 ?auto_15106 ) ) ( OBJ-AT ?auto_15106 ?auto_15108 ) ( TRUCK-AT ?auto_15109 ?auto_15103 ) ( IN-TRUCK ?auto_15107 ?auto_15109 ) ( not ( = ?auto_15104 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15107 ) ) ( OBJ-AT ?auto_15105 ?auto_15103 ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( not ( = ?auto_15105 ?auto_15107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15104 ?auto_15106 ?auto_15103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15112 - OBJ
      ?auto_15113 - OBJ
      ?auto_15114 - OBJ
      ?auto_15111 - LOCATION
    )
    :vars
    (
      ?auto_15115 - LOCATION
      ?auto_15117 - CITY
      ?auto_15116 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15115 ?auto_15117 ) ( IN-CITY ?auto_15111 ?auto_15117 ) ( not ( = ?auto_15111 ?auto_15115 ) ) ( OBJ-AT ?auto_15112 ?auto_15111 ) ( not ( = ?auto_15112 ?auto_15114 ) ) ( OBJ-AT ?auto_15114 ?auto_15115 ) ( TRUCK-AT ?auto_15116 ?auto_15111 ) ( IN-TRUCK ?auto_15113 ?auto_15116 ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15114 ?auto_15113 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15112 ?auto_15114 ?auto_15111 ) )
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
      ?auto_15123 - LOCATION
      ?auto_15125 - CITY
      ?auto_15124 - TRUCK
      ?auto_15122 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15123 ?auto_15125 ) ( IN-CITY ?auto_15118 ?auto_15125 ) ( not ( = ?auto_15118 ?auto_15123 ) ) ( OBJ-AT ?auto_15121 ?auto_15118 ) ( not ( = ?auto_15121 ?auto_15120 ) ) ( OBJ-AT ?auto_15120 ?auto_15123 ) ( TRUCK-AT ?auto_15124 ?auto_15118 ) ( IN-TRUCK ?auto_15122 ?auto_15124 ) ( not ( = ?auto_15121 ?auto_15122 ) ) ( not ( = ?auto_15120 ?auto_15122 ) ) ( OBJ-AT ?auto_15119 ?auto_15118 ) ( not ( = ?auto_15119 ?auto_15120 ) ) ( not ( = ?auto_15119 ?auto_15121 ) ) ( not ( = ?auto_15119 ?auto_15122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15121 ?auto_15120 ?auto_15118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15127 - OBJ
      ?auto_15128 - OBJ
      ?auto_15129 - OBJ
      ?auto_15126 - LOCATION
    )
    :vars
    (
      ?auto_15130 - LOCATION
      ?auto_15132 - CITY
      ?auto_15131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15130 ?auto_15132 ) ( IN-CITY ?auto_15126 ?auto_15132 ) ( not ( = ?auto_15126 ?auto_15130 ) ) ( OBJ-AT ?auto_15127 ?auto_15126 ) ( not ( = ?auto_15127 ?auto_15128 ) ) ( OBJ-AT ?auto_15128 ?auto_15130 ) ( TRUCK-AT ?auto_15131 ?auto_15126 ) ( IN-TRUCK ?auto_15129 ?auto_15131 ) ( not ( = ?auto_15127 ?auto_15129 ) ) ( not ( = ?auto_15128 ?auto_15129 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15127 ?auto_15128 ?auto_15126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15142 - OBJ
      ?auto_15143 - OBJ
      ?auto_15144 - OBJ
      ?auto_15141 - LOCATION
    )
    :vars
    (
      ?auto_15145 - LOCATION
      ?auto_15147 - CITY
      ?auto_15146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15145 ?auto_15147 ) ( IN-CITY ?auto_15141 ?auto_15147 ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( OBJ-AT ?auto_15143 ?auto_15141 ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( OBJ-AT ?auto_15144 ?auto_15145 ) ( TRUCK-AT ?auto_15146 ?auto_15141 ) ( IN-TRUCK ?auto_15142 ?auto_15146 ) ( not ( = ?auto_15143 ?auto_15142 ) ) ( not ( = ?auto_15144 ?auto_15142 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15143 ?auto_15144 ?auto_15141 ) )
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
      ?auto_15162 - CITY
      ?auto_15161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15160 ?auto_15162 ) ( IN-CITY ?auto_15156 ?auto_15162 ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( OBJ-AT ?auto_15159 ?auto_15156 ) ( not ( = ?auto_15159 ?auto_15158 ) ) ( OBJ-AT ?auto_15158 ?auto_15160 ) ( TRUCK-AT ?auto_15161 ?auto_15156 ) ( IN-TRUCK ?auto_15157 ?auto_15161 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( not ( = ?auto_15158 ?auto_15157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15159 ?auto_15158 ?auto_15156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15180 - OBJ
      ?auto_15181 - OBJ
      ?auto_15182 - OBJ
      ?auto_15179 - LOCATION
    )
    :vars
    (
      ?auto_15184 - LOCATION
      ?auto_15186 - CITY
      ?auto_15185 - TRUCK
      ?auto_15183 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15184 ?auto_15186 ) ( IN-CITY ?auto_15179 ?auto_15186 ) ( not ( = ?auto_15179 ?auto_15184 ) ) ( OBJ-AT ?auto_15181 ?auto_15179 ) ( not ( = ?auto_15181 ?auto_15180 ) ) ( OBJ-AT ?auto_15180 ?auto_15184 ) ( TRUCK-AT ?auto_15185 ?auto_15179 ) ( IN-TRUCK ?auto_15183 ?auto_15185 ) ( not ( = ?auto_15181 ?auto_15183 ) ) ( not ( = ?auto_15180 ?auto_15183 ) ) ( OBJ-AT ?auto_15182 ?auto_15179 ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15182 ?auto_15183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15181 ?auto_15180 ?auto_15179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15188 - OBJ
      ?auto_15189 - OBJ
      ?auto_15190 - OBJ
      ?auto_15187 - LOCATION
    )
    :vars
    (
      ?auto_15191 - LOCATION
      ?auto_15193 - CITY
      ?auto_15192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15191 ?auto_15193 ) ( IN-CITY ?auto_15187 ?auto_15193 ) ( not ( = ?auto_15187 ?auto_15191 ) ) ( OBJ-AT ?auto_15189 ?auto_15187 ) ( not ( = ?auto_15189 ?auto_15188 ) ) ( OBJ-AT ?auto_15188 ?auto_15191 ) ( TRUCK-AT ?auto_15192 ?auto_15187 ) ( IN-TRUCK ?auto_15190 ?auto_15192 ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15189 ?auto_15188 ?auto_15187 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15203 - OBJ
      ?auto_15204 - OBJ
      ?auto_15205 - OBJ
      ?auto_15202 - LOCATION
    )
    :vars
    (
      ?auto_15206 - LOCATION
      ?auto_15208 - CITY
      ?auto_15207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15206 ?auto_15208 ) ( IN-CITY ?auto_15202 ?auto_15208 ) ( not ( = ?auto_15202 ?auto_15206 ) ) ( OBJ-AT ?auto_15205 ?auto_15202 ) ( not ( = ?auto_15205 ?auto_15203 ) ) ( OBJ-AT ?auto_15203 ?auto_15206 ) ( TRUCK-AT ?auto_15207 ?auto_15202 ) ( IN-TRUCK ?auto_15204 ?auto_15207 ) ( not ( = ?auto_15205 ?auto_15204 ) ) ( not ( = ?auto_15203 ?auto_15204 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15205 ?auto_15203 ?auto_15202 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15251 - OBJ
      ?auto_15250 - LOCATION
    )
    :vars
    (
      ?auto_15253 - LOCATION
      ?auto_15256 - CITY
      ?auto_15254 - OBJ
      ?auto_15252 - OBJ
      ?auto_15255 - TRUCK
      ?auto_15257 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15253 ?auto_15256 ) ( IN-CITY ?auto_15250 ?auto_15256 ) ( not ( = ?auto_15250 ?auto_15253 ) ) ( OBJ-AT ?auto_15254 ?auto_15250 ) ( not ( = ?auto_15254 ?auto_15251 ) ) ( OBJ-AT ?auto_15251 ?auto_15253 ) ( IN-TRUCK ?auto_15252 ?auto_15255 ) ( not ( = ?auto_15254 ?auto_15252 ) ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( TRUCK-AT ?auto_15255 ?auto_15257 ) ( IN-CITY ?auto_15257 ?auto_15256 ) ( not ( = ?auto_15250 ?auto_15257 ) ) ( not ( = ?auto_15253 ?auto_15257 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15255 ?auto_15257 ?auto_15250 ?auto_15256 )
      ( DELIVER-2PKG ?auto_15254 ?auto_15251 ?auto_15250 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15259 - OBJ
      ?auto_15260 - OBJ
      ?auto_15258 - LOCATION
    )
    :vars
    (
      ?auto_15262 - LOCATION
      ?auto_15265 - CITY
      ?auto_15263 - OBJ
      ?auto_15261 - TRUCK
      ?auto_15264 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15262 ?auto_15265 ) ( IN-CITY ?auto_15258 ?auto_15265 ) ( not ( = ?auto_15258 ?auto_15262 ) ) ( OBJ-AT ?auto_15259 ?auto_15258 ) ( not ( = ?auto_15259 ?auto_15260 ) ) ( OBJ-AT ?auto_15260 ?auto_15262 ) ( IN-TRUCK ?auto_15263 ?auto_15261 ) ( not ( = ?auto_15259 ?auto_15263 ) ) ( not ( = ?auto_15260 ?auto_15263 ) ) ( TRUCK-AT ?auto_15261 ?auto_15264 ) ( IN-CITY ?auto_15264 ?auto_15265 ) ( not ( = ?auto_15258 ?auto_15264 ) ) ( not ( = ?auto_15262 ?auto_15264 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15260 ?auto_15258 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15267 - OBJ
      ?auto_15268 - OBJ
      ?auto_15266 - LOCATION
    )
    :vars
    (
      ?auto_15270 - LOCATION
      ?auto_15272 - CITY
      ?auto_15273 - OBJ
      ?auto_15269 - TRUCK
      ?auto_15271 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15270 ?auto_15272 ) ( IN-CITY ?auto_15266 ?auto_15272 ) ( not ( = ?auto_15266 ?auto_15270 ) ) ( OBJ-AT ?auto_15273 ?auto_15266 ) ( not ( = ?auto_15273 ?auto_15268 ) ) ( OBJ-AT ?auto_15268 ?auto_15270 ) ( IN-TRUCK ?auto_15267 ?auto_15269 ) ( not ( = ?auto_15273 ?auto_15267 ) ) ( not ( = ?auto_15268 ?auto_15267 ) ) ( TRUCK-AT ?auto_15269 ?auto_15271 ) ( IN-CITY ?auto_15271 ?auto_15272 ) ( not ( = ?auto_15266 ?auto_15271 ) ) ( not ( = ?auto_15270 ?auto_15271 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15273 ?auto_15268 ?auto_15266 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15275 - OBJ
      ?auto_15276 - OBJ
      ?auto_15274 - LOCATION
    )
    :vars
    (
      ?auto_15278 - LOCATION
      ?auto_15281 - CITY
      ?auto_15279 - OBJ
      ?auto_15277 - TRUCK
      ?auto_15280 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15278 ?auto_15281 ) ( IN-CITY ?auto_15274 ?auto_15281 ) ( not ( = ?auto_15274 ?auto_15278 ) ) ( OBJ-AT ?auto_15276 ?auto_15274 ) ( not ( = ?auto_15276 ?auto_15275 ) ) ( OBJ-AT ?auto_15275 ?auto_15278 ) ( IN-TRUCK ?auto_15279 ?auto_15277 ) ( not ( = ?auto_15276 ?auto_15279 ) ) ( not ( = ?auto_15275 ?auto_15279 ) ) ( TRUCK-AT ?auto_15277 ?auto_15280 ) ( IN-CITY ?auto_15280 ?auto_15281 ) ( not ( = ?auto_15274 ?auto_15280 ) ) ( not ( = ?auto_15278 ?auto_15280 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15276 ?auto_15275 ?auto_15274 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15283 - OBJ
      ?auto_15284 - OBJ
      ?auto_15282 - LOCATION
    )
    :vars
    (
      ?auto_15286 - LOCATION
      ?auto_15288 - CITY
      ?auto_15289 - OBJ
      ?auto_15285 - TRUCK
      ?auto_15287 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15286 ?auto_15288 ) ( IN-CITY ?auto_15282 ?auto_15288 ) ( not ( = ?auto_15282 ?auto_15286 ) ) ( OBJ-AT ?auto_15289 ?auto_15282 ) ( not ( = ?auto_15289 ?auto_15283 ) ) ( OBJ-AT ?auto_15283 ?auto_15286 ) ( IN-TRUCK ?auto_15284 ?auto_15285 ) ( not ( = ?auto_15289 ?auto_15284 ) ) ( not ( = ?auto_15283 ?auto_15284 ) ) ( TRUCK-AT ?auto_15285 ?auto_15287 ) ( IN-CITY ?auto_15287 ?auto_15288 ) ( not ( = ?auto_15282 ?auto_15287 ) ) ( not ( = ?auto_15286 ?auto_15287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15289 ?auto_15283 ?auto_15282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15300 - OBJ
      ?auto_15301 - OBJ
      ?auto_15302 - OBJ
      ?auto_15299 - LOCATION
    )
    :vars
    (
      ?auto_15304 - LOCATION
      ?auto_15307 - CITY
      ?auto_15305 - OBJ
      ?auto_15303 - TRUCK
      ?auto_15306 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15304 ?auto_15307 ) ( IN-CITY ?auto_15299 ?auto_15307 ) ( not ( = ?auto_15299 ?auto_15304 ) ) ( OBJ-AT ?auto_15300 ?auto_15299 ) ( not ( = ?auto_15300 ?auto_15302 ) ) ( OBJ-AT ?auto_15302 ?auto_15304 ) ( IN-TRUCK ?auto_15305 ?auto_15303 ) ( not ( = ?auto_15300 ?auto_15305 ) ) ( not ( = ?auto_15302 ?auto_15305 ) ) ( TRUCK-AT ?auto_15303 ?auto_15306 ) ( IN-CITY ?auto_15306 ?auto_15307 ) ( not ( = ?auto_15299 ?auto_15306 ) ) ( not ( = ?auto_15304 ?auto_15306 ) ) ( OBJ-AT ?auto_15301 ?auto_15299 ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( not ( = ?auto_15301 ?auto_15302 ) ) ( not ( = ?auto_15301 ?auto_15305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15300 ?auto_15302 ?auto_15299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15309 - OBJ
      ?auto_15310 - OBJ
      ?auto_15311 - OBJ
      ?auto_15308 - LOCATION
    )
    :vars
    (
      ?auto_15313 - LOCATION
      ?auto_15315 - CITY
      ?auto_15312 - TRUCK
      ?auto_15314 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15313 ?auto_15315 ) ( IN-CITY ?auto_15308 ?auto_15315 ) ( not ( = ?auto_15308 ?auto_15313 ) ) ( OBJ-AT ?auto_15309 ?auto_15308 ) ( not ( = ?auto_15309 ?auto_15311 ) ) ( OBJ-AT ?auto_15311 ?auto_15313 ) ( IN-TRUCK ?auto_15310 ?auto_15312 ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15311 ?auto_15310 ) ) ( TRUCK-AT ?auto_15312 ?auto_15314 ) ( IN-CITY ?auto_15314 ?auto_15315 ) ( not ( = ?auto_15308 ?auto_15314 ) ) ( not ( = ?auto_15313 ?auto_15314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15309 ?auto_15311 ?auto_15308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15317 - OBJ
      ?auto_15318 - OBJ
      ?auto_15319 - OBJ
      ?auto_15316 - LOCATION
    )
    :vars
    (
      ?auto_15321 - LOCATION
      ?auto_15324 - CITY
      ?auto_15322 - OBJ
      ?auto_15320 - TRUCK
      ?auto_15323 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15321 ?auto_15324 ) ( IN-CITY ?auto_15316 ?auto_15324 ) ( not ( = ?auto_15316 ?auto_15321 ) ) ( OBJ-AT ?auto_15319 ?auto_15316 ) ( not ( = ?auto_15319 ?auto_15318 ) ) ( OBJ-AT ?auto_15318 ?auto_15321 ) ( IN-TRUCK ?auto_15322 ?auto_15320 ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( not ( = ?auto_15318 ?auto_15322 ) ) ( TRUCK-AT ?auto_15320 ?auto_15323 ) ( IN-CITY ?auto_15323 ?auto_15324 ) ( not ( = ?auto_15316 ?auto_15323 ) ) ( not ( = ?auto_15321 ?auto_15323 ) ) ( OBJ-AT ?auto_15317 ?auto_15316 ) ( not ( = ?auto_15317 ?auto_15318 ) ) ( not ( = ?auto_15317 ?auto_15319 ) ) ( not ( = ?auto_15317 ?auto_15322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15319 ?auto_15318 ?auto_15316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15326 - OBJ
      ?auto_15327 - OBJ
      ?auto_15328 - OBJ
      ?auto_15325 - LOCATION
    )
    :vars
    (
      ?auto_15330 - LOCATION
      ?auto_15332 - CITY
      ?auto_15329 - TRUCK
      ?auto_15331 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15330 ?auto_15332 ) ( IN-CITY ?auto_15325 ?auto_15332 ) ( not ( = ?auto_15325 ?auto_15330 ) ) ( OBJ-AT ?auto_15326 ?auto_15325 ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( OBJ-AT ?auto_15327 ?auto_15330 ) ( IN-TRUCK ?auto_15328 ?auto_15329 ) ( not ( = ?auto_15326 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( TRUCK-AT ?auto_15329 ?auto_15331 ) ( IN-CITY ?auto_15331 ?auto_15332 ) ( not ( = ?auto_15325 ?auto_15331 ) ) ( not ( = ?auto_15330 ?auto_15331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15326 ?auto_15327 ?auto_15325 ) )
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
      ?auto_15347 - LOCATION
      ?auto_15349 - CITY
      ?auto_15346 - TRUCK
      ?auto_15348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15347 ?auto_15349 ) ( IN-CITY ?auto_15342 ?auto_15349 ) ( not ( = ?auto_15342 ?auto_15347 ) ) ( OBJ-AT ?auto_15344 ?auto_15342 ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( OBJ-AT ?auto_15345 ?auto_15347 ) ( IN-TRUCK ?auto_15343 ?auto_15346 ) ( not ( = ?auto_15344 ?auto_15343 ) ) ( not ( = ?auto_15345 ?auto_15343 ) ) ( TRUCK-AT ?auto_15346 ?auto_15348 ) ( IN-CITY ?auto_15348 ?auto_15349 ) ( not ( = ?auto_15342 ?auto_15348 ) ) ( not ( = ?auto_15347 ?auto_15348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15344 ?auto_15345 ?auto_15342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15360 - OBJ
      ?auto_15361 - OBJ
      ?auto_15362 - OBJ
      ?auto_15359 - LOCATION
    )
    :vars
    (
      ?auto_15364 - LOCATION
      ?auto_15366 - CITY
      ?auto_15363 - TRUCK
      ?auto_15365 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15364 ?auto_15366 ) ( IN-CITY ?auto_15359 ?auto_15366 ) ( not ( = ?auto_15359 ?auto_15364 ) ) ( OBJ-AT ?auto_15362 ?auto_15359 ) ( not ( = ?auto_15362 ?auto_15361 ) ) ( OBJ-AT ?auto_15361 ?auto_15364 ) ( IN-TRUCK ?auto_15360 ?auto_15363 ) ( not ( = ?auto_15362 ?auto_15360 ) ) ( not ( = ?auto_15361 ?auto_15360 ) ) ( TRUCK-AT ?auto_15363 ?auto_15365 ) ( IN-CITY ?auto_15365 ?auto_15366 ) ( not ( = ?auto_15359 ?auto_15365 ) ) ( not ( = ?auto_15364 ?auto_15365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15362 ?auto_15361 ?auto_15359 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15386 - OBJ
      ?auto_15387 - OBJ
      ?auto_15388 - OBJ
      ?auto_15385 - LOCATION
    )
    :vars
    (
      ?auto_15390 - LOCATION
      ?auto_15393 - CITY
      ?auto_15391 - OBJ
      ?auto_15389 - TRUCK
      ?auto_15392 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15390 ?auto_15393 ) ( IN-CITY ?auto_15385 ?auto_15393 ) ( not ( = ?auto_15385 ?auto_15390 ) ) ( OBJ-AT ?auto_15388 ?auto_15385 ) ( not ( = ?auto_15388 ?auto_15386 ) ) ( OBJ-AT ?auto_15386 ?auto_15390 ) ( IN-TRUCK ?auto_15391 ?auto_15389 ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( not ( = ?auto_15386 ?auto_15391 ) ) ( TRUCK-AT ?auto_15389 ?auto_15392 ) ( IN-CITY ?auto_15392 ?auto_15393 ) ( not ( = ?auto_15385 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( OBJ-AT ?auto_15387 ?auto_15385 ) ( not ( = ?auto_15386 ?auto_15387 ) ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15391 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15388 ?auto_15386 ?auto_15385 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15395 - OBJ
      ?auto_15396 - OBJ
      ?auto_15397 - OBJ
      ?auto_15394 - LOCATION
    )
    :vars
    (
      ?auto_15399 - LOCATION
      ?auto_15401 - CITY
      ?auto_15398 - TRUCK
      ?auto_15400 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15399 ?auto_15401 ) ( IN-CITY ?auto_15394 ?auto_15401 ) ( not ( = ?auto_15394 ?auto_15399 ) ) ( OBJ-AT ?auto_15396 ?auto_15394 ) ( not ( = ?auto_15396 ?auto_15395 ) ) ( OBJ-AT ?auto_15395 ?auto_15399 ) ( IN-TRUCK ?auto_15397 ?auto_15398 ) ( not ( = ?auto_15396 ?auto_15397 ) ) ( not ( = ?auto_15395 ?auto_15397 ) ) ( TRUCK-AT ?auto_15398 ?auto_15400 ) ( IN-CITY ?auto_15400 ?auto_15401 ) ( not ( = ?auto_15394 ?auto_15400 ) ) ( not ( = ?auto_15399 ?auto_15400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15396 ?auto_15395 ?auto_15394 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15412 - OBJ
      ?auto_15413 - OBJ
      ?auto_15414 - OBJ
      ?auto_15411 - LOCATION
    )
    :vars
    (
      ?auto_15416 - LOCATION
      ?auto_15418 - CITY
      ?auto_15415 - TRUCK
      ?auto_15417 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15416 ?auto_15418 ) ( IN-CITY ?auto_15411 ?auto_15418 ) ( not ( = ?auto_15411 ?auto_15416 ) ) ( OBJ-AT ?auto_15414 ?auto_15411 ) ( not ( = ?auto_15414 ?auto_15412 ) ) ( OBJ-AT ?auto_15412 ?auto_15416 ) ( IN-TRUCK ?auto_15413 ?auto_15415 ) ( not ( = ?auto_15414 ?auto_15413 ) ) ( not ( = ?auto_15412 ?auto_15413 ) ) ( TRUCK-AT ?auto_15415 ?auto_15417 ) ( IN-CITY ?auto_15417 ?auto_15418 ) ( not ( = ?auto_15411 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15414 ?auto_15412 ?auto_15411 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15466 - OBJ
      ?auto_15465 - LOCATION
    )
    :vars
    (
      ?auto_15468 - LOCATION
      ?auto_15471 - CITY
      ?auto_15472 - OBJ
      ?auto_15469 - OBJ
      ?auto_15467 - TRUCK
      ?auto_15470 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15468 ?auto_15471 ) ( IN-CITY ?auto_15465 ?auto_15471 ) ( not ( = ?auto_15465 ?auto_15468 ) ) ( OBJ-AT ?auto_15472 ?auto_15465 ) ( not ( = ?auto_15472 ?auto_15466 ) ) ( OBJ-AT ?auto_15466 ?auto_15468 ) ( not ( = ?auto_15472 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( TRUCK-AT ?auto_15467 ?auto_15470 ) ( IN-CITY ?auto_15470 ?auto_15471 ) ( not ( = ?auto_15465 ?auto_15470 ) ) ( not ( = ?auto_15468 ?auto_15470 ) ) ( OBJ-AT ?auto_15469 ?auto_15470 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15469 ?auto_15467 ?auto_15470 )
      ( DELIVER-2PKG ?auto_15472 ?auto_15466 ?auto_15465 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15474 - OBJ
      ?auto_15475 - OBJ
      ?auto_15473 - LOCATION
    )
    :vars
    (
      ?auto_15478 - LOCATION
      ?auto_15476 - CITY
      ?auto_15480 - OBJ
      ?auto_15479 - TRUCK
      ?auto_15477 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15478 ?auto_15476 ) ( IN-CITY ?auto_15473 ?auto_15476 ) ( not ( = ?auto_15473 ?auto_15478 ) ) ( OBJ-AT ?auto_15474 ?auto_15473 ) ( not ( = ?auto_15474 ?auto_15475 ) ) ( OBJ-AT ?auto_15475 ?auto_15478 ) ( not ( = ?auto_15474 ?auto_15480 ) ) ( not ( = ?auto_15475 ?auto_15480 ) ) ( TRUCK-AT ?auto_15479 ?auto_15477 ) ( IN-CITY ?auto_15477 ?auto_15476 ) ( not ( = ?auto_15473 ?auto_15477 ) ) ( not ( = ?auto_15478 ?auto_15477 ) ) ( OBJ-AT ?auto_15480 ?auto_15477 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15475 ?auto_15473 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15482 - OBJ
      ?auto_15483 - OBJ
      ?auto_15481 - LOCATION
    )
    :vars
    (
      ?auto_15484 - LOCATION
      ?auto_15487 - CITY
      ?auto_15488 - OBJ
      ?auto_15486 - TRUCK
      ?auto_15485 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15484 ?auto_15487 ) ( IN-CITY ?auto_15481 ?auto_15487 ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( OBJ-AT ?auto_15488 ?auto_15481 ) ( not ( = ?auto_15488 ?auto_15483 ) ) ( OBJ-AT ?auto_15483 ?auto_15484 ) ( not ( = ?auto_15488 ?auto_15482 ) ) ( not ( = ?auto_15483 ?auto_15482 ) ) ( TRUCK-AT ?auto_15486 ?auto_15485 ) ( IN-CITY ?auto_15485 ?auto_15487 ) ( not ( = ?auto_15481 ?auto_15485 ) ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( OBJ-AT ?auto_15482 ?auto_15485 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15488 ?auto_15483 ?auto_15481 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15490 - OBJ
      ?auto_15491 - OBJ
      ?auto_15489 - LOCATION
    )
    :vars
    (
      ?auto_15492 - LOCATION
      ?auto_15496 - CITY
      ?auto_15494 - OBJ
      ?auto_15495 - TRUCK
      ?auto_15493 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15492 ?auto_15496 ) ( IN-CITY ?auto_15489 ?auto_15496 ) ( not ( = ?auto_15489 ?auto_15492 ) ) ( OBJ-AT ?auto_15491 ?auto_15489 ) ( not ( = ?auto_15491 ?auto_15490 ) ) ( OBJ-AT ?auto_15490 ?auto_15492 ) ( not ( = ?auto_15491 ?auto_15494 ) ) ( not ( = ?auto_15490 ?auto_15494 ) ) ( TRUCK-AT ?auto_15495 ?auto_15493 ) ( IN-CITY ?auto_15493 ?auto_15496 ) ( not ( = ?auto_15489 ?auto_15493 ) ) ( not ( = ?auto_15492 ?auto_15493 ) ) ( OBJ-AT ?auto_15494 ?auto_15493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15491 ?auto_15490 ?auto_15489 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15498 - OBJ
      ?auto_15499 - OBJ
      ?auto_15497 - LOCATION
    )
    :vars
    (
      ?auto_15500 - LOCATION
      ?auto_15503 - CITY
      ?auto_15504 - OBJ
      ?auto_15502 - TRUCK
      ?auto_15501 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15500 ?auto_15503 ) ( IN-CITY ?auto_15497 ?auto_15503 ) ( not ( = ?auto_15497 ?auto_15500 ) ) ( OBJ-AT ?auto_15504 ?auto_15497 ) ( not ( = ?auto_15504 ?auto_15498 ) ) ( OBJ-AT ?auto_15498 ?auto_15500 ) ( not ( = ?auto_15504 ?auto_15499 ) ) ( not ( = ?auto_15498 ?auto_15499 ) ) ( TRUCK-AT ?auto_15502 ?auto_15501 ) ( IN-CITY ?auto_15501 ?auto_15503 ) ( not ( = ?auto_15497 ?auto_15501 ) ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( OBJ-AT ?auto_15499 ?auto_15501 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15504 ?auto_15498 ?auto_15497 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15515 - OBJ
      ?auto_15516 - OBJ
      ?auto_15517 - OBJ
      ?auto_15514 - LOCATION
    )
    :vars
    (
      ?auto_15518 - LOCATION
      ?auto_15522 - CITY
      ?auto_15520 - OBJ
      ?auto_15521 - TRUCK
      ?auto_15519 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15518 ?auto_15522 ) ( IN-CITY ?auto_15514 ?auto_15522 ) ( not ( = ?auto_15514 ?auto_15518 ) ) ( OBJ-AT ?auto_15516 ?auto_15514 ) ( not ( = ?auto_15516 ?auto_15517 ) ) ( OBJ-AT ?auto_15517 ?auto_15518 ) ( not ( = ?auto_15516 ?auto_15520 ) ) ( not ( = ?auto_15517 ?auto_15520 ) ) ( TRUCK-AT ?auto_15521 ?auto_15519 ) ( IN-CITY ?auto_15519 ?auto_15522 ) ( not ( = ?auto_15514 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( OBJ-AT ?auto_15520 ?auto_15519 ) ( OBJ-AT ?auto_15515 ?auto_15514 ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15516 ?auto_15517 ?auto_15514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15524 - OBJ
      ?auto_15525 - OBJ
      ?auto_15526 - OBJ
      ?auto_15523 - LOCATION
    )
    :vars
    (
      ?auto_15527 - LOCATION
      ?auto_15530 - CITY
      ?auto_15529 - TRUCK
      ?auto_15528 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15527 ?auto_15530 ) ( IN-CITY ?auto_15523 ?auto_15530 ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( OBJ-AT ?auto_15524 ?auto_15523 ) ( not ( = ?auto_15524 ?auto_15526 ) ) ( OBJ-AT ?auto_15526 ?auto_15527 ) ( not ( = ?auto_15524 ?auto_15525 ) ) ( not ( = ?auto_15526 ?auto_15525 ) ) ( TRUCK-AT ?auto_15529 ?auto_15528 ) ( IN-CITY ?auto_15528 ?auto_15530 ) ( not ( = ?auto_15523 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( OBJ-AT ?auto_15525 ?auto_15528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15524 ?auto_15526 ?auto_15523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15532 - OBJ
      ?auto_15533 - OBJ
      ?auto_15534 - OBJ
      ?auto_15531 - LOCATION
    )
    :vars
    (
      ?auto_15535 - LOCATION
      ?auto_15539 - CITY
      ?auto_15537 - OBJ
      ?auto_15538 - TRUCK
      ?auto_15536 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15535 ?auto_15539 ) ( IN-CITY ?auto_15531 ?auto_15539 ) ( not ( = ?auto_15531 ?auto_15535 ) ) ( OBJ-AT ?auto_15534 ?auto_15531 ) ( not ( = ?auto_15534 ?auto_15533 ) ) ( OBJ-AT ?auto_15533 ?auto_15535 ) ( not ( = ?auto_15534 ?auto_15537 ) ) ( not ( = ?auto_15533 ?auto_15537 ) ) ( TRUCK-AT ?auto_15538 ?auto_15536 ) ( IN-CITY ?auto_15536 ?auto_15539 ) ( not ( = ?auto_15531 ?auto_15536 ) ) ( not ( = ?auto_15535 ?auto_15536 ) ) ( OBJ-AT ?auto_15537 ?auto_15536 ) ( OBJ-AT ?auto_15532 ?auto_15531 ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( not ( = ?auto_15532 ?auto_15534 ) ) ( not ( = ?auto_15532 ?auto_15537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15534 ?auto_15533 ?auto_15531 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15541 - OBJ
      ?auto_15542 - OBJ
      ?auto_15543 - OBJ
      ?auto_15540 - LOCATION
    )
    :vars
    (
      ?auto_15544 - LOCATION
      ?auto_15547 - CITY
      ?auto_15546 - TRUCK
      ?auto_15545 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15544 ?auto_15547 ) ( IN-CITY ?auto_15540 ?auto_15547 ) ( not ( = ?auto_15540 ?auto_15544 ) ) ( OBJ-AT ?auto_15541 ?auto_15540 ) ( not ( = ?auto_15541 ?auto_15542 ) ) ( OBJ-AT ?auto_15542 ?auto_15544 ) ( not ( = ?auto_15541 ?auto_15543 ) ) ( not ( = ?auto_15542 ?auto_15543 ) ) ( TRUCK-AT ?auto_15546 ?auto_15545 ) ( IN-CITY ?auto_15545 ?auto_15547 ) ( not ( = ?auto_15540 ?auto_15545 ) ) ( not ( = ?auto_15544 ?auto_15545 ) ) ( OBJ-AT ?auto_15543 ?auto_15545 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15541 ?auto_15542 ?auto_15540 ) )
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
      ?auto_15561 - LOCATION
      ?auto_15564 - CITY
      ?auto_15563 - TRUCK
      ?auto_15562 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15561 ?auto_15564 ) ( IN-CITY ?auto_15557 ?auto_15564 ) ( not ( = ?auto_15557 ?auto_15561 ) ) ( OBJ-AT ?auto_15559 ?auto_15557 ) ( not ( = ?auto_15559 ?auto_15560 ) ) ( OBJ-AT ?auto_15560 ?auto_15561 ) ( not ( = ?auto_15559 ?auto_15558 ) ) ( not ( = ?auto_15560 ?auto_15558 ) ) ( TRUCK-AT ?auto_15563 ?auto_15562 ) ( IN-CITY ?auto_15562 ?auto_15564 ) ( not ( = ?auto_15557 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15562 ) ) ( OBJ-AT ?auto_15558 ?auto_15562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15559 ?auto_15560 ?auto_15557 ) )
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
      ?auto_15578 - LOCATION
      ?auto_15581 - CITY
      ?auto_15580 - TRUCK
      ?auto_15579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15578 ?auto_15581 ) ( IN-CITY ?auto_15574 ?auto_15581 ) ( not ( = ?auto_15574 ?auto_15578 ) ) ( OBJ-AT ?auto_15577 ?auto_15574 ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( OBJ-AT ?auto_15576 ?auto_15578 ) ( not ( = ?auto_15577 ?auto_15575 ) ) ( not ( = ?auto_15576 ?auto_15575 ) ) ( TRUCK-AT ?auto_15580 ?auto_15579 ) ( IN-CITY ?auto_15579 ?auto_15581 ) ( not ( = ?auto_15574 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( OBJ-AT ?auto_15575 ?auto_15579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15577 ?auto_15576 ?auto_15574 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15601 - OBJ
      ?auto_15602 - OBJ
      ?auto_15603 - OBJ
      ?auto_15600 - LOCATION
    )
    :vars
    (
      ?auto_15604 - LOCATION
      ?auto_15608 - CITY
      ?auto_15606 - OBJ
      ?auto_15607 - TRUCK
      ?auto_15605 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15604 ?auto_15608 ) ( IN-CITY ?auto_15600 ?auto_15608 ) ( not ( = ?auto_15600 ?auto_15604 ) ) ( OBJ-AT ?auto_15603 ?auto_15600 ) ( not ( = ?auto_15603 ?auto_15601 ) ) ( OBJ-AT ?auto_15601 ?auto_15604 ) ( not ( = ?auto_15603 ?auto_15606 ) ) ( not ( = ?auto_15601 ?auto_15606 ) ) ( TRUCK-AT ?auto_15607 ?auto_15605 ) ( IN-CITY ?auto_15605 ?auto_15608 ) ( not ( = ?auto_15600 ?auto_15605 ) ) ( not ( = ?auto_15604 ?auto_15605 ) ) ( OBJ-AT ?auto_15606 ?auto_15605 ) ( OBJ-AT ?auto_15602 ?auto_15600 ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15606 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15603 ?auto_15601 ?auto_15600 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15610 - OBJ
      ?auto_15611 - OBJ
      ?auto_15612 - OBJ
      ?auto_15609 - LOCATION
    )
    :vars
    (
      ?auto_15613 - LOCATION
      ?auto_15616 - CITY
      ?auto_15615 - TRUCK
      ?auto_15614 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15613 ?auto_15616 ) ( IN-CITY ?auto_15609 ?auto_15616 ) ( not ( = ?auto_15609 ?auto_15613 ) ) ( OBJ-AT ?auto_15611 ?auto_15609 ) ( not ( = ?auto_15611 ?auto_15610 ) ) ( OBJ-AT ?auto_15610 ?auto_15613 ) ( not ( = ?auto_15611 ?auto_15612 ) ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( TRUCK-AT ?auto_15615 ?auto_15614 ) ( IN-CITY ?auto_15614 ?auto_15616 ) ( not ( = ?auto_15609 ?auto_15614 ) ) ( not ( = ?auto_15613 ?auto_15614 ) ) ( OBJ-AT ?auto_15612 ?auto_15614 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15611 ?auto_15610 ?auto_15609 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15627 - OBJ
      ?auto_15628 - OBJ
      ?auto_15629 - OBJ
      ?auto_15626 - LOCATION
    )
    :vars
    (
      ?auto_15630 - LOCATION
      ?auto_15633 - CITY
      ?auto_15632 - TRUCK
      ?auto_15631 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15630 ?auto_15633 ) ( IN-CITY ?auto_15626 ?auto_15633 ) ( not ( = ?auto_15626 ?auto_15630 ) ) ( OBJ-AT ?auto_15629 ?auto_15626 ) ( not ( = ?auto_15629 ?auto_15627 ) ) ( OBJ-AT ?auto_15627 ?auto_15630 ) ( not ( = ?auto_15629 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( TRUCK-AT ?auto_15632 ?auto_15631 ) ( IN-CITY ?auto_15631 ?auto_15633 ) ( not ( = ?auto_15626 ?auto_15631 ) ) ( not ( = ?auto_15630 ?auto_15631 ) ) ( OBJ-AT ?auto_15628 ?auto_15631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15629 ?auto_15627 ?auto_15626 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15681 - OBJ
      ?auto_15680 - LOCATION
    )
    :vars
    (
      ?auto_15682 - LOCATION
      ?auto_15686 - CITY
      ?auto_15687 - OBJ
      ?auto_15684 - OBJ
      ?auto_15683 - LOCATION
      ?auto_15685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15682 ?auto_15686 ) ( IN-CITY ?auto_15680 ?auto_15686 ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( OBJ-AT ?auto_15687 ?auto_15680 ) ( not ( = ?auto_15687 ?auto_15681 ) ) ( OBJ-AT ?auto_15681 ?auto_15682 ) ( not ( = ?auto_15687 ?auto_15684 ) ) ( not ( = ?auto_15681 ?auto_15684 ) ) ( IN-CITY ?auto_15683 ?auto_15686 ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( OBJ-AT ?auto_15684 ?auto_15683 ) ( TRUCK-AT ?auto_15685 ?auto_15680 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15685 ?auto_15680 ?auto_15683 ?auto_15686 )
      ( DELIVER-2PKG ?auto_15687 ?auto_15681 ?auto_15680 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15689 - OBJ
      ?auto_15690 - OBJ
      ?auto_15688 - LOCATION
    )
    :vars
    (
      ?auto_15694 - LOCATION
      ?auto_15691 - CITY
      ?auto_15695 - OBJ
      ?auto_15693 - LOCATION
      ?auto_15692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15694 ?auto_15691 ) ( IN-CITY ?auto_15688 ?auto_15691 ) ( not ( = ?auto_15688 ?auto_15694 ) ) ( OBJ-AT ?auto_15689 ?auto_15688 ) ( not ( = ?auto_15689 ?auto_15690 ) ) ( OBJ-AT ?auto_15690 ?auto_15694 ) ( not ( = ?auto_15689 ?auto_15695 ) ) ( not ( = ?auto_15690 ?auto_15695 ) ) ( IN-CITY ?auto_15693 ?auto_15691 ) ( not ( = ?auto_15688 ?auto_15693 ) ) ( not ( = ?auto_15694 ?auto_15693 ) ) ( OBJ-AT ?auto_15695 ?auto_15693 ) ( TRUCK-AT ?auto_15692 ?auto_15688 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15690 ?auto_15688 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15697 - OBJ
      ?auto_15698 - OBJ
      ?auto_15696 - LOCATION
    )
    :vars
    (
      ?auto_15699 - LOCATION
      ?auto_15700 - CITY
      ?auto_15703 - OBJ
      ?auto_15701 - LOCATION
      ?auto_15702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15699 ?auto_15700 ) ( IN-CITY ?auto_15696 ?auto_15700 ) ( not ( = ?auto_15696 ?auto_15699 ) ) ( OBJ-AT ?auto_15703 ?auto_15696 ) ( not ( = ?auto_15703 ?auto_15698 ) ) ( OBJ-AT ?auto_15698 ?auto_15699 ) ( not ( = ?auto_15703 ?auto_15697 ) ) ( not ( = ?auto_15698 ?auto_15697 ) ) ( IN-CITY ?auto_15701 ?auto_15700 ) ( not ( = ?auto_15696 ?auto_15701 ) ) ( not ( = ?auto_15699 ?auto_15701 ) ) ( OBJ-AT ?auto_15697 ?auto_15701 ) ( TRUCK-AT ?auto_15702 ?auto_15696 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15703 ?auto_15698 ?auto_15696 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15705 - OBJ
      ?auto_15706 - OBJ
      ?auto_15704 - LOCATION
    )
    :vars
    (
      ?auto_15708 - LOCATION
      ?auto_15709 - CITY
      ?auto_15707 - OBJ
      ?auto_15710 - LOCATION
      ?auto_15711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15708 ?auto_15709 ) ( IN-CITY ?auto_15704 ?auto_15709 ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( OBJ-AT ?auto_15706 ?auto_15704 ) ( not ( = ?auto_15706 ?auto_15705 ) ) ( OBJ-AT ?auto_15705 ?auto_15708 ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( IN-CITY ?auto_15710 ?auto_15709 ) ( not ( = ?auto_15704 ?auto_15710 ) ) ( not ( = ?auto_15708 ?auto_15710 ) ) ( OBJ-AT ?auto_15707 ?auto_15710 ) ( TRUCK-AT ?auto_15711 ?auto_15704 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15706 ?auto_15705 ?auto_15704 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15713 - OBJ
      ?auto_15714 - OBJ
      ?auto_15712 - LOCATION
    )
    :vars
    (
      ?auto_15715 - LOCATION
      ?auto_15716 - CITY
      ?auto_15719 - OBJ
      ?auto_15717 - LOCATION
      ?auto_15718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15715 ?auto_15716 ) ( IN-CITY ?auto_15712 ?auto_15716 ) ( not ( = ?auto_15712 ?auto_15715 ) ) ( OBJ-AT ?auto_15719 ?auto_15712 ) ( not ( = ?auto_15719 ?auto_15713 ) ) ( OBJ-AT ?auto_15713 ?auto_15715 ) ( not ( = ?auto_15719 ?auto_15714 ) ) ( not ( = ?auto_15713 ?auto_15714 ) ) ( IN-CITY ?auto_15717 ?auto_15716 ) ( not ( = ?auto_15712 ?auto_15717 ) ) ( not ( = ?auto_15715 ?auto_15717 ) ) ( OBJ-AT ?auto_15714 ?auto_15717 ) ( TRUCK-AT ?auto_15718 ?auto_15712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15719 ?auto_15713 ?auto_15712 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15730 - OBJ
      ?auto_15731 - OBJ
      ?auto_15732 - OBJ
      ?auto_15729 - LOCATION
    )
    :vars
    (
      ?auto_15734 - LOCATION
      ?auto_15735 - CITY
      ?auto_15733 - OBJ
      ?auto_15736 - LOCATION
      ?auto_15737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15734 ?auto_15735 ) ( IN-CITY ?auto_15729 ?auto_15735 ) ( not ( = ?auto_15729 ?auto_15734 ) ) ( OBJ-AT ?auto_15730 ?auto_15729 ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( OBJ-AT ?auto_15732 ?auto_15734 ) ( not ( = ?auto_15730 ?auto_15733 ) ) ( not ( = ?auto_15732 ?auto_15733 ) ) ( IN-CITY ?auto_15736 ?auto_15735 ) ( not ( = ?auto_15729 ?auto_15736 ) ) ( not ( = ?auto_15734 ?auto_15736 ) ) ( OBJ-AT ?auto_15733 ?auto_15736 ) ( TRUCK-AT ?auto_15737 ?auto_15729 ) ( OBJ-AT ?auto_15731 ?auto_15729 ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15730 ?auto_15732 ?auto_15729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15739 - OBJ
      ?auto_15740 - OBJ
      ?auto_15741 - OBJ
      ?auto_15738 - LOCATION
    )
    :vars
    (
      ?auto_15742 - LOCATION
      ?auto_15743 - CITY
      ?auto_15744 - LOCATION
      ?auto_15745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15742 ?auto_15743 ) ( IN-CITY ?auto_15738 ?auto_15743 ) ( not ( = ?auto_15738 ?auto_15742 ) ) ( OBJ-AT ?auto_15739 ?auto_15738 ) ( not ( = ?auto_15739 ?auto_15741 ) ) ( OBJ-AT ?auto_15741 ?auto_15742 ) ( not ( = ?auto_15739 ?auto_15740 ) ) ( not ( = ?auto_15741 ?auto_15740 ) ) ( IN-CITY ?auto_15744 ?auto_15743 ) ( not ( = ?auto_15738 ?auto_15744 ) ) ( not ( = ?auto_15742 ?auto_15744 ) ) ( OBJ-AT ?auto_15740 ?auto_15744 ) ( TRUCK-AT ?auto_15745 ?auto_15738 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15739 ?auto_15741 ?auto_15738 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15747 - OBJ
      ?auto_15748 - OBJ
      ?auto_15749 - OBJ
      ?auto_15746 - LOCATION
    )
    :vars
    (
      ?auto_15751 - LOCATION
      ?auto_15752 - CITY
      ?auto_15750 - OBJ
      ?auto_15753 - LOCATION
      ?auto_15754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15751 ?auto_15752 ) ( IN-CITY ?auto_15746 ?auto_15752 ) ( not ( = ?auto_15746 ?auto_15751 ) ) ( OBJ-AT ?auto_15749 ?auto_15746 ) ( not ( = ?auto_15749 ?auto_15748 ) ) ( OBJ-AT ?auto_15748 ?auto_15751 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( not ( = ?auto_15748 ?auto_15750 ) ) ( IN-CITY ?auto_15753 ?auto_15752 ) ( not ( = ?auto_15746 ?auto_15753 ) ) ( not ( = ?auto_15751 ?auto_15753 ) ) ( OBJ-AT ?auto_15750 ?auto_15753 ) ( TRUCK-AT ?auto_15754 ?auto_15746 ) ( OBJ-AT ?auto_15747 ?auto_15746 ) ( not ( = ?auto_15747 ?auto_15748 ) ) ( not ( = ?auto_15747 ?auto_15749 ) ) ( not ( = ?auto_15747 ?auto_15750 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15749 ?auto_15748 ?auto_15746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15756 - OBJ
      ?auto_15757 - OBJ
      ?auto_15758 - OBJ
      ?auto_15755 - LOCATION
    )
    :vars
    (
      ?auto_15759 - LOCATION
      ?auto_15760 - CITY
      ?auto_15761 - LOCATION
      ?auto_15762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15759 ?auto_15760 ) ( IN-CITY ?auto_15755 ?auto_15760 ) ( not ( = ?auto_15755 ?auto_15759 ) ) ( OBJ-AT ?auto_15756 ?auto_15755 ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( OBJ-AT ?auto_15757 ?auto_15759 ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( IN-CITY ?auto_15761 ?auto_15760 ) ( not ( = ?auto_15755 ?auto_15761 ) ) ( not ( = ?auto_15759 ?auto_15761 ) ) ( OBJ-AT ?auto_15758 ?auto_15761 ) ( TRUCK-AT ?auto_15762 ?auto_15755 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15756 ?auto_15757 ?auto_15755 ) )
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
      ?auto_15776 - LOCATION
      ?auto_15777 - CITY
      ?auto_15778 - LOCATION
      ?auto_15779 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15776 ?auto_15777 ) ( IN-CITY ?auto_15772 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15776 ) ) ( OBJ-AT ?auto_15774 ?auto_15772 ) ( not ( = ?auto_15774 ?auto_15775 ) ) ( OBJ-AT ?auto_15775 ?auto_15776 ) ( not ( = ?auto_15774 ?auto_15773 ) ) ( not ( = ?auto_15775 ?auto_15773 ) ) ( IN-CITY ?auto_15778 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( not ( = ?auto_15776 ?auto_15778 ) ) ( OBJ-AT ?auto_15773 ?auto_15778 ) ( TRUCK-AT ?auto_15779 ?auto_15772 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15774 ?auto_15775 ?auto_15772 ) )
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
      ?auto_15793 - LOCATION
      ?auto_15794 - CITY
      ?auto_15795 - LOCATION
      ?auto_15796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15793 ?auto_15794 ) ( IN-CITY ?auto_15789 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15793 ) ) ( OBJ-AT ?auto_15792 ?auto_15789 ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( OBJ-AT ?auto_15791 ?auto_15793 ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( not ( = ?auto_15791 ?auto_15790 ) ) ( IN-CITY ?auto_15795 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15795 ) ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( OBJ-AT ?auto_15790 ?auto_15795 ) ( TRUCK-AT ?auto_15796 ?auto_15789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15792 ?auto_15791 ?auto_15789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15816 - OBJ
      ?auto_15817 - OBJ
      ?auto_15818 - OBJ
      ?auto_15815 - LOCATION
    )
    :vars
    (
      ?auto_15820 - LOCATION
      ?auto_15821 - CITY
      ?auto_15819 - OBJ
      ?auto_15822 - LOCATION
      ?auto_15823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15820 ?auto_15821 ) ( IN-CITY ?auto_15815 ?auto_15821 ) ( not ( = ?auto_15815 ?auto_15820 ) ) ( OBJ-AT ?auto_15818 ?auto_15815 ) ( not ( = ?auto_15818 ?auto_15816 ) ) ( OBJ-AT ?auto_15816 ?auto_15820 ) ( not ( = ?auto_15818 ?auto_15819 ) ) ( not ( = ?auto_15816 ?auto_15819 ) ) ( IN-CITY ?auto_15822 ?auto_15821 ) ( not ( = ?auto_15815 ?auto_15822 ) ) ( not ( = ?auto_15820 ?auto_15822 ) ) ( OBJ-AT ?auto_15819 ?auto_15822 ) ( TRUCK-AT ?auto_15823 ?auto_15815 ) ( OBJ-AT ?auto_15817 ?auto_15815 ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15817 ?auto_15818 ) ) ( not ( = ?auto_15817 ?auto_15819 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15818 ?auto_15816 ?auto_15815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15825 - OBJ
      ?auto_15826 - OBJ
      ?auto_15827 - OBJ
      ?auto_15824 - LOCATION
    )
    :vars
    (
      ?auto_15828 - LOCATION
      ?auto_15829 - CITY
      ?auto_15830 - LOCATION
      ?auto_15831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15828 ?auto_15829 ) ( IN-CITY ?auto_15824 ?auto_15829 ) ( not ( = ?auto_15824 ?auto_15828 ) ) ( OBJ-AT ?auto_15826 ?auto_15824 ) ( not ( = ?auto_15826 ?auto_15825 ) ) ( OBJ-AT ?auto_15825 ?auto_15828 ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( not ( = ?auto_15825 ?auto_15827 ) ) ( IN-CITY ?auto_15830 ?auto_15829 ) ( not ( = ?auto_15824 ?auto_15830 ) ) ( not ( = ?auto_15828 ?auto_15830 ) ) ( OBJ-AT ?auto_15827 ?auto_15830 ) ( TRUCK-AT ?auto_15831 ?auto_15824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15826 ?auto_15825 ?auto_15824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15842 - OBJ
      ?auto_15843 - OBJ
      ?auto_15844 - OBJ
      ?auto_15841 - LOCATION
    )
    :vars
    (
      ?auto_15845 - LOCATION
      ?auto_15846 - CITY
      ?auto_15847 - LOCATION
      ?auto_15848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15845 ?auto_15846 ) ( IN-CITY ?auto_15841 ?auto_15846 ) ( not ( = ?auto_15841 ?auto_15845 ) ) ( OBJ-AT ?auto_15844 ?auto_15841 ) ( not ( = ?auto_15844 ?auto_15842 ) ) ( OBJ-AT ?auto_15842 ?auto_15845 ) ( not ( = ?auto_15844 ?auto_15843 ) ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( IN-CITY ?auto_15847 ?auto_15846 ) ( not ( = ?auto_15841 ?auto_15847 ) ) ( not ( = ?auto_15845 ?auto_15847 ) ) ( OBJ-AT ?auto_15843 ?auto_15847 ) ( TRUCK-AT ?auto_15848 ?auto_15841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15844 ?auto_15842 ?auto_15841 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15896 - OBJ
      ?auto_15895 - LOCATION
    )
    :vars
    (
      ?auto_15898 - LOCATION
      ?auto_15899 - CITY
      ?auto_15902 - OBJ
      ?auto_15897 - OBJ
      ?auto_15900 - LOCATION
      ?auto_15901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15898 ?auto_15899 ) ( IN-CITY ?auto_15895 ?auto_15899 ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15902 ?auto_15896 ) ) ( OBJ-AT ?auto_15896 ?auto_15898 ) ( not ( = ?auto_15902 ?auto_15897 ) ) ( not ( = ?auto_15896 ?auto_15897 ) ) ( IN-CITY ?auto_15900 ?auto_15899 ) ( not ( = ?auto_15895 ?auto_15900 ) ) ( not ( = ?auto_15898 ?auto_15900 ) ) ( OBJ-AT ?auto_15897 ?auto_15900 ) ( TRUCK-AT ?auto_15901 ?auto_15895 ) ( IN-TRUCK ?auto_15902 ?auto_15901 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15902 ?auto_15895 )
      ( DELIVER-2PKG ?auto_15902 ?auto_15896 ?auto_15895 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15904 - OBJ
      ?auto_15905 - OBJ
      ?auto_15903 - LOCATION
    )
    :vars
    (
      ?auto_15910 - LOCATION
      ?auto_15906 - CITY
      ?auto_15908 - OBJ
      ?auto_15907 - LOCATION
      ?auto_15909 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15910 ?auto_15906 ) ( IN-CITY ?auto_15903 ?auto_15906 ) ( not ( = ?auto_15903 ?auto_15910 ) ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( OBJ-AT ?auto_15905 ?auto_15910 ) ( not ( = ?auto_15904 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( IN-CITY ?auto_15907 ?auto_15906 ) ( not ( = ?auto_15903 ?auto_15907 ) ) ( not ( = ?auto_15910 ?auto_15907 ) ) ( OBJ-AT ?auto_15908 ?auto_15907 ) ( TRUCK-AT ?auto_15909 ?auto_15903 ) ( IN-TRUCK ?auto_15904 ?auto_15909 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15905 ?auto_15903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15912 - OBJ
      ?auto_15913 - OBJ
      ?auto_15911 - LOCATION
    )
    :vars
    (
      ?auto_15915 - LOCATION
      ?auto_15917 - CITY
      ?auto_15918 - OBJ
      ?auto_15916 - LOCATION
      ?auto_15914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15915 ?auto_15917 ) ( IN-CITY ?auto_15911 ?auto_15917 ) ( not ( = ?auto_15911 ?auto_15915 ) ) ( not ( = ?auto_15918 ?auto_15913 ) ) ( OBJ-AT ?auto_15913 ?auto_15915 ) ( not ( = ?auto_15918 ?auto_15912 ) ) ( not ( = ?auto_15913 ?auto_15912 ) ) ( IN-CITY ?auto_15916 ?auto_15917 ) ( not ( = ?auto_15911 ?auto_15916 ) ) ( not ( = ?auto_15915 ?auto_15916 ) ) ( OBJ-AT ?auto_15912 ?auto_15916 ) ( TRUCK-AT ?auto_15914 ?auto_15911 ) ( IN-TRUCK ?auto_15918 ?auto_15914 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15918 ?auto_15913 ?auto_15911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15920 - OBJ
      ?auto_15921 - OBJ
      ?auto_15919 - LOCATION
    )
    :vars
    (
      ?auto_15924 - LOCATION
      ?auto_15926 - CITY
      ?auto_15923 - OBJ
      ?auto_15925 - LOCATION
      ?auto_15922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15924 ?auto_15926 ) ( IN-CITY ?auto_15919 ?auto_15926 ) ( not ( = ?auto_15919 ?auto_15924 ) ) ( not ( = ?auto_15921 ?auto_15920 ) ) ( OBJ-AT ?auto_15920 ?auto_15924 ) ( not ( = ?auto_15921 ?auto_15923 ) ) ( not ( = ?auto_15920 ?auto_15923 ) ) ( IN-CITY ?auto_15925 ?auto_15926 ) ( not ( = ?auto_15919 ?auto_15925 ) ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( OBJ-AT ?auto_15923 ?auto_15925 ) ( TRUCK-AT ?auto_15922 ?auto_15919 ) ( IN-TRUCK ?auto_15921 ?auto_15922 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15921 ?auto_15920 ?auto_15919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15928 - OBJ
      ?auto_15929 - OBJ
      ?auto_15927 - LOCATION
    )
    :vars
    (
      ?auto_15931 - LOCATION
      ?auto_15933 - CITY
      ?auto_15934 - OBJ
      ?auto_15932 - LOCATION
      ?auto_15930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15931 ?auto_15933 ) ( IN-CITY ?auto_15927 ?auto_15933 ) ( not ( = ?auto_15927 ?auto_15931 ) ) ( not ( = ?auto_15934 ?auto_15928 ) ) ( OBJ-AT ?auto_15928 ?auto_15931 ) ( not ( = ?auto_15934 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( IN-CITY ?auto_15932 ?auto_15933 ) ( not ( = ?auto_15927 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( OBJ-AT ?auto_15929 ?auto_15932 ) ( TRUCK-AT ?auto_15930 ?auto_15927 ) ( IN-TRUCK ?auto_15934 ?auto_15930 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15934 ?auto_15928 ?auto_15927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15954 - OBJ
      ?auto_15955 - OBJ
      ?auto_15956 - OBJ
      ?auto_15953 - LOCATION
    )
    :vars
    (
      ?auto_15958 - LOCATION
      ?auto_15960 - CITY
      ?auto_15959 - LOCATION
      ?auto_15957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15958 ?auto_15960 ) ( IN-CITY ?auto_15953 ?auto_15960 ) ( not ( = ?auto_15953 ?auto_15958 ) ) ( not ( = ?auto_15954 ?auto_15956 ) ) ( OBJ-AT ?auto_15956 ?auto_15958 ) ( not ( = ?auto_15954 ?auto_15955 ) ) ( not ( = ?auto_15956 ?auto_15955 ) ) ( IN-CITY ?auto_15959 ?auto_15960 ) ( not ( = ?auto_15953 ?auto_15959 ) ) ( not ( = ?auto_15958 ?auto_15959 ) ) ( OBJ-AT ?auto_15955 ?auto_15959 ) ( TRUCK-AT ?auto_15957 ?auto_15953 ) ( IN-TRUCK ?auto_15954 ?auto_15957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15954 ?auto_15956 ?auto_15953 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15971 - OBJ
      ?auto_15972 - OBJ
      ?auto_15973 - OBJ
      ?auto_15970 - LOCATION
    )
    :vars
    (
      ?auto_15975 - LOCATION
      ?auto_15977 - CITY
      ?auto_15976 - LOCATION
      ?auto_15974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15975 ?auto_15977 ) ( IN-CITY ?auto_15970 ?auto_15977 ) ( not ( = ?auto_15970 ?auto_15975 ) ) ( not ( = ?auto_15971 ?auto_15972 ) ) ( OBJ-AT ?auto_15972 ?auto_15975 ) ( not ( = ?auto_15971 ?auto_15973 ) ) ( not ( = ?auto_15972 ?auto_15973 ) ) ( IN-CITY ?auto_15976 ?auto_15977 ) ( not ( = ?auto_15970 ?auto_15976 ) ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( OBJ-AT ?auto_15973 ?auto_15976 ) ( TRUCK-AT ?auto_15974 ?auto_15970 ) ( IN-TRUCK ?auto_15971 ?auto_15974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15971 ?auto_15972 ?auto_15970 ) )
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
      ?auto_15992 - LOCATION
      ?auto_15994 - CITY
      ?auto_15993 - LOCATION
      ?auto_15991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15992 ?auto_15994 ) ( IN-CITY ?auto_15987 ?auto_15994 ) ( not ( = ?auto_15987 ?auto_15992 ) ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( OBJ-AT ?auto_15990 ?auto_15992 ) ( not ( = ?auto_15989 ?auto_15988 ) ) ( not ( = ?auto_15990 ?auto_15988 ) ) ( IN-CITY ?auto_15993 ?auto_15994 ) ( not ( = ?auto_15987 ?auto_15993 ) ) ( not ( = ?auto_15992 ?auto_15993 ) ) ( OBJ-AT ?auto_15988 ?auto_15993 ) ( TRUCK-AT ?auto_15991 ?auto_15987 ) ( IN-TRUCK ?auto_15989 ?auto_15991 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15989 ?auto_15990 ?auto_15987 ) )
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
      ?auto_16009 - LOCATION
      ?auto_16011 - CITY
      ?auto_16010 - LOCATION
      ?auto_16008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16009 ?auto_16011 ) ( IN-CITY ?auto_16004 ?auto_16011 ) ( not ( = ?auto_16004 ?auto_16009 ) ) ( not ( = ?auto_16007 ?auto_16006 ) ) ( OBJ-AT ?auto_16006 ?auto_16009 ) ( not ( = ?auto_16007 ?auto_16005 ) ) ( not ( = ?auto_16006 ?auto_16005 ) ) ( IN-CITY ?auto_16010 ?auto_16011 ) ( not ( = ?auto_16004 ?auto_16010 ) ) ( not ( = ?auto_16009 ?auto_16010 ) ) ( OBJ-AT ?auto_16005 ?auto_16010 ) ( TRUCK-AT ?auto_16008 ?auto_16004 ) ( IN-TRUCK ?auto_16007 ?auto_16008 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16007 ?auto_16006 ?auto_16004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16040 - OBJ
      ?auto_16041 - OBJ
      ?auto_16042 - OBJ
      ?auto_16039 - LOCATION
    )
    :vars
    (
      ?auto_16044 - LOCATION
      ?auto_16046 - CITY
      ?auto_16045 - LOCATION
      ?auto_16043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16044 ?auto_16046 ) ( IN-CITY ?auto_16039 ?auto_16046 ) ( not ( = ?auto_16039 ?auto_16044 ) ) ( not ( = ?auto_16041 ?auto_16040 ) ) ( OBJ-AT ?auto_16040 ?auto_16044 ) ( not ( = ?auto_16041 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) ( IN-CITY ?auto_16045 ?auto_16046 ) ( not ( = ?auto_16039 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( OBJ-AT ?auto_16042 ?auto_16045 ) ( TRUCK-AT ?auto_16043 ?auto_16039 ) ( IN-TRUCK ?auto_16041 ?auto_16043 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16041 ?auto_16040 ?auto_16039 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16057 - OBJ
      ?auto_16058 - OBJ
      ?auto_16059 - OBJ
      ?auto_16056 - LOCATION
    )
    :vars
    (
      ?auto_16061 - LOCATION
      ?auto_16063 - CITY
      ?auto_16062 - LOCATION
      ?auto_16060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16061 ?auto_16063 ) ( IN-CITY ?auto_16056 ?auto_16063 ) ( not ( = ?auto_16056 ?auto_16061 ) ) ( not ( = ?auto_16059 ?auto_16057 ) ) ( OBJ-AT ?auto_16057 ?auto_16061 ) ( not ( = ?auto_16059 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( IN-CITY ?auto_16062 ?auto_16063 ) ( not ( = ?auto_16056 ?auto_16062 ) ) ( not ( = ?auto_16061 ?auto_16062 ) ) ( OBJ-AT ?auto_16058 ?auto_16062 ) ( TRUCK-AT ?auto_16060 ?auto_16056 ) ( IN-TRUCK ?auto_16059 ?auto_16060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16059 ?auto_16057 ?auto_16056 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16111 - OBJ
      ?auto_16110 - LOCATION
    )
    :vars
    (
      ?auto_16114 - LOCATION
      ?auto_16116 - CITY
      ?auto_16117 - OBJ
      ?auto_16113 - OBJ
      ?auto_16115 - LOCATION
      ?auto_16112 - TRUCK
      ?auto_16118 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16114 ?auto_16116 ) ( IN-CITY ?auto_16110 ?auto_16116 ) ( not ( = ?auto_16110 ?auto_16114 ) ) ( not ( = ?auto_16117 ?auto_16111 ) ) ( OBJ-AT ?auto_16111 ?auto_16114 ) ( not ( = ?auto_16117 ?auto_16113 ) ) ( not ( = ?auto_16111 ?auto_16113 ) ) ( IN-CITY ?auto_16115 ?auto_16116 ) ( not ( = ?auto_16110 ?auto_16115 ) ) ( not ( = ?auto_16114 ?auto_16115 ) ) ( OBJ-AT ?auto_16113 ?auto_16115 ) ( IN-TRUCK ?auto_16117 ?auto_16112 ) ( TRUCK-AT ?auto_16112 ?auto_16118 ) ( IN-CITY ?auto_16118 ?auto_16116 ) ( not ( = ?auto_16110 ?auto_16118 ) ) ( not ( = ?auto_16114 ?auto_16118 ) ) ( not ( = ?auto_16115 ?auto_16118 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16112 ?auto_16118 ?auto_16110 ?auto_16116 )
      ( DELIVER-2PKG ?auto_16117 ?auto_16111 ?auto_16110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16120 - OBJ
      ?auto_16121 - OBJ
      ?auto_16119 - LOCATION
    )
    :vars
    (
      ?auto_16126 - LOCATION
      ?auto_16127 - CITY
      ?auto_16124 - OBJ
      ?auto_16125 - LOCATION
      ?auto_16123 - TRUCK
      ?auto_16122 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16126 ?auto_16127 ) ( IN-CITY ?auto_16119 ?auto_16127 ) ( not ( = ?auto_16119 ?auto_16126 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( OBJ-AT ?auto_16121 ?auto_16126 ) ( not ( = ?auto_16120 ?auto_16124 ) ) ( not ( = ?auto_16121 ?auto_16124 ) ) ( IN-CITY ?auto_16125 ?auto_16127 ) ( not ( = ?auto_16119 ?auto_16125 ) ) ( not ( = ?auto_16126 ?auto_16125 ) ) ( OBJ-AT ?auto_16124 ?auto_16125 ) ( IN-TRUCK ?auto_16120 ?auto_16123 ) ( TRUCK-AT ?auto_16123 ?auto_16122 ) ( IN-CITY ?auto_16122 ?auto_16127 ) ( not ( = ?auto_16119 ?auto_16122 ) ) ( not ( = ?auto_16126 ?auto_16122 ) ) ( not ( = ?auto_16125 ?auto_16122 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16121 ?auto_16119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16129 - OBJ
      ?auto_16130 - OBJ
      ?auto_16128 - LOCATION
    )
    :vars
    (
      ?auto_16132 - LOCATION
      ?auto_16131 - CITY
      ?auto_16136 - OBJ
      ?auto_16134 - LOCATION
      ?auto_16133 - TRUCK
      ?auto_16135 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16132 ?auto_16131 ) ( IN-CITY ?auto_16128 ?auto_16131 ) ( not ( = ?auto_16128 ?auto_16132 ) ) ( not ( = ?auto_16136 ?auto_16130 ) ) ( OBJ-AT ?auto_16130 ?auto_16132 ) ( not ( = ?auto_16136 ?auto_16129 ) ) ( not ( = ?auto_16130 ?auto_16129 ) ) ( IN-CITY ?auto_16134 ?auto_16131 ) ( not ( = ?auto_16128 ?auto_16134 ) ) ( not ( = ?auto_16132 ?auto_16134 ) ) ( OBJ-AT ?auto_16129 ?auto_16134 ) ( IN-TRUCK ?auto_16136 ?auto_16133 ) ( TRUCK-AT ?auto_16133 ?auto_16135 ) ( IN-CITY ?auto_16135 ?auto_16131 ) ( not ( = ?auto_16128 ?auto_16135 ) ) ( not ( = ?auto_16132 ?auto_16135 ) ) ( not ( = ?auto_16134 ?auto_16135 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16136 ?auto_16130 ?auto_16128 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16138 - OBJ
      ?auto_16139 - OBJ
      ?auto_16137 - LOCATION
    )
    :vars
    (
      ?auto_16142 - LOCATION
      ?auto_16140 - CITY
      ?auto_16141 - OBJ
      ?auto_16144 - LOCATION
      ?auto_16143 - TRUCK
      ?auto_16145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16142 ?auto_16140 ) ( IN-CITY ?auto_16137 ?auto_16140 ) ( not ( = ?auto_16137 ?auto_16142 ) ) ( not ( = ?auto_16139 ?auto_16138 ) ) ( OBJ-AT ?auto_16138 ?auto_16142 ) ( not ( = ?auto_16139 ?auto_16141 ) ) ( not ( = ?auto_16138 ?auto_16141 ) ) ( IN-CITY ?auto_16144 ?auto_16140 ) ( not ( = ?auto_16137 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16144 ) ) ( OBJ-AT ?auto_16141 ?auto_16144 ) ( IN-TRUCK ?auto_16139 ?auto_16143 ) ( TRUCK-AT ?auto_16143 ?auto_16145 ) ( IN-CITY ?auto_16145 ?auto_16140 ) ( not ( = ?auto_16137 ?auto_16145 ) ) ( not ( = ?auto_16142 ?auto_16145 ) ) ( not ( = ?auto_16144 ?auto_16145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16139 ?auto_16138 ?auto_16137 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16147 - OBJ
      ?auto_16148 - OBJ
      ?auto_16146 - LOCATION
    )
    :vars
    (
      ?auto_16150 - LOCATION
      ?auto_16149 - CITY
      ?auto_16154 - OBJ
      ?auto_16152 - LOCATION
      ?auto_16151 - TRUCK
      ?auto_16153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16150 ?auto_16149 ) ( IN-CITY ?auto_16146 ?auto_16149 ) ( not ( = ?auto_16146 ?auto_16150 ) ) ( not ( = ?auto_16154 ?auto_16147 ) ) ( OBJ-AT ?auto_16147 ?auto_16150 ) ( not ( = ?auto_16154 ?auto_16148 ) ) ( not ( = ?auto_16147 ?auto_16148 ) ) ( IN-CITY ?auto_16152 ?auto_16149 ) ( not ( = ?auto_16146 ?auto_16152 ) ) ( not ( = ?auto_16150 ?auto_16152 ) ) ( OBJ-AT ?auto_16148 ?auto_16152 ) ( IN-TRUCK ?auto_16154 ?auto_16151 ) ( TRUCK-AT ?auto_16151 ?auto_16153 ) ( IN-CITY ?auto_16153 ?auto_16149 ) ( not ( = ?auto_16146 ?auto_16153 ) ) ( not ( = ?auto_16150 ?auto_16153 ) ) ( not ( = ?auto_16152 ?auto_16153 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16154 ?auto_16147 ?auto_16146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16176 - OBJ
      ?auto_16177 - OBJ
      ?auto_16178 - OBJ
      ?auto_16175 - LOCATION
    )
    :vars
    (
      ?auto_16180 - LOCATION
      ?auto_16179 - CITY
      ?auto_16182 - LOCATION
      ?auto_16181 - TRUCK
      ?auto_16183 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16180 ?auto_16179 ) ( IN-CITY ?auto_16175 ?auto_16179 ) ( not ( = ?auto_16175 ?auto_16180 ) ) ( not ( = ?auto_16176 ?auto_16178 ) ) ( OBJ-AT ?auto_16178 ?auto_16180 ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( not ( = ?auto_16178 ?auto_16177 ) ) ( IN-CITY ?auto_16182 ?auto_16179 ) ( not ( = ?auto_16175 ?auto_16182 ) ) ( not ( = ?auto_16180 ?auto_16182 ) ) ( OBJ-AT ?auto_16177 ?auto_16182 ) ( IN-TRUCK ?auto_16176 ?auto_16181 ) ( TRUCK-AT ?auto_16181 ?auto_16183 ) ( IN-CITY ?auto_16183 ?auto_16179 ) ( not ( = ?auto_16175 ?auto_16183 ) ) ( not ( = ?auto_16180 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16176 ?auto_16178 ?auto_16175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16195 - OBJ
      ?auto_16196 - OBJ
      ?auto_16197 - OBJ
      ?auto_16194 - LOCATION
    )
    :vars
    (
      ?auto_16199 - LOCATION
      ?auto_16198 - CITY
      ?auto_16201 - LOCATION
      ?auto_16200 - TRUCK
      ?auto_16202 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16199 ?auto_16198 ) ( IN-CITY ?auto_16194 ?auto_16198 ) ( not ( = ?auto_16194 ?auto_16199 ) ) ( not ( = ?auto_16195 ?auto_16196 ) ) ( OBJ-AT ?auto_16196 ?auto_16199 ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( IN-CITY ?auto_16201 ?auto_16198 ) ( not ( = ?auto_16194 ?auto_16201 ) ) ( not ( = ?auto_16199 ?auto_16201 ) ) ( OBJ-AT ?auto_16197 ?auto_16201 ) ( IN-TRUCK ?auto_16195 ?auto_16200 ) ( TRUCK-AT ?auto_16200 ?auto_16202 ) ( IN-CITY ?auto_16202 ?auto_16198 ) ( not ( = ?auto_16194 ?auto_16202 ) ) ( not ( = ?auto_16199 ?auto_16202 ) ) ( not ( = ?auto_16201 ?auto_16202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16195 ?auto_16196 ?auto_16194 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16214 - OBJ
      ?auto_16215 - OBJ
      ?auto_16216 - OBJ
      ?auto_16213 - LOCATION
    )
    :vars
    (
      ?auto_16218 - LOCATION
      ?auto_16217 - CITY
      ?auto_16220 - LOCATION
      ?auto_16219 - TRUCK
      ?auto_16221 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16218 ?auto_16217 ) ( IN-CITY ?auto_16213 ?auto_16217 ) ( not ( = ?auto_16213 ?auto_16218 ) ) ( not ( = ?auto_16215 ?auto_16216 ) ) ( OBJ-AT ?auto_16216 ?auto_16218 ) ( not ( = ?auto_16215 ?auto_16214 ) ) ( not ( = ?auto_16216 ?auto_16214 ) ) ( IN-CITY ?auto_16220 ?auto_16217 ) ( not ( = ?auto_16213 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( OBJ-AT ?auto_16214 ?auto_16220 ) ( IN-TRUCK ?auto_16215 ?auto_16219 ) ( TRUCK-AT ?auto_16219 ?auto_16221 ) ( IN-CITY ?auto_16221 ?auto_16217 ) ( not ( = ?auto_16213 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16221 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16215 ?auto_16216 ?auto_16213 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16233 - OBJ
      ?auto_16234 - OBJ
      ?auto_16235 - OBJ
      ?auto_16232 - LOCATION
    )
    :vars
    (
      ?auto_16237 - LOCATION
      ?auto_16236 - CITY
      ?auto_16239 - LOCATION
      ?auto_16238 - TRUCK
      ?auto_16240 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16237 ?auto_16236 ) ( IN-CITY ?auto_16232 ?auto_16236 ) ( not ( = ?auto_16232 ?auto_16237 ) ) ( not ( = ?auto_16235 ?auto_16234 ) ) ( OBJ-AT ?auto_16234 ?auto_16237 ) ( not ( = ?auto_16235 ?auto_16233 ) ) ( not ( = ?auto_16234 ?auto_16233 ) ) ( IN-CITY ?auto_16239 ?auto_16236 ) ( not ( = ?auto_16232 ?auto_16239 ) ) ( not ( = ?auto_16237 ?auto_16239 ) ) ( OBJ-AT ?auto_16233 ?auto_16239 ) ( IN-TRUCK ?auto_16235 ?auto_16238 ) ( TRUCK-AT ?auto_16238 ?auto_16240 ) ( IN-CITY ?auto_16240 ?auto_16236 ) ( not ( = ?auto_16232 ?auto_16240 ) ) ( not ( = ?auto_16237 ?auto_16240 ) ) ( not ( = ?auto_16239 ?auto_16240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16235 ?auto_16234 ?auto_16232 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16272 - OBJ
      ?auto_16273 - OBJ
      ?auto_16274 - OBJ
      ?auto_16271 - LOCATION
    )
    :vars
    (
      ?auto_16276 - LOCATION
      ?auto_16275 - CITY
      ?auto_16278 - LOCATION
      ?auto_16277 - TRUCK
      ?auto_16279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16276 ?auto_16275 ) ( IN-CITY ?auto_16271 ?auto_16275 ) ( not ( = ?auto_16271 ?auto_16276 ) ) ( not ( = ?auto_16273 ?auto_16272 ) ) ( OBJ-AT ?auto_16272 ?auto_16276 ) ( not ( = ?auto_16273 ?auto_16274 ) ) ( not ( = ?auto_16272 ?auto_16274 ) ) ( IN-CITY ?auto_16278 ?auto_16275 ) ( not ( = ?auto_16271 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( OBJ-AT ?auto_16274 ?auto_16278 ) ( IN-TRUCK ?auto_16273 ?auto_16277 ) ( TRUCK-AT ?auto_16277 ?auto_16279 ) ( IN-CITY ?auto_16279 ?auto_16275 ) ( not ( = ?auto_16271 ?auto_16279 ) ) ( not ( = ?auto_16276 ?auto_16279 ) ) ( not ( = ?auto_16278 ?auto_16279 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16273 ?auto_16272 ?auto_16271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16291 - OBJ
      ?auto_16292 - OBJ
      ?auto_16293 - OBJ
      ?auto_16290 - LOCATION
    )
    :vars
    (
      ?auto_16295 - LOCATION
      ?auto_16294 - CITY
      ?auto_16297 - LOCATION
      ?auto_16296 - TRUCK
      ?auto_16298 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16295 ?auto_16294 ) ( IN-CITY ?auto_16290 ?auto_16294 ) ( not ( = ?auto_16290 ?auto_16295 ) ) ( not ( = ?auto_16293 ?auto_16291 ) ) ( OBJ-AT ?auto_16291 ?auto_16295 ) ( not ( = ?auto_16293 ?auto_16292 ) ) ( not ( = ?auto_16291 ?auto_16292 ) ) ( IN-CITY ?auto_16297 ?auto_16294 ) ( not ( = ?auto_16290 ?auto_16297 ) ) ( not ( = ?auto_16295 ?auto_16297 ) ) ( OBJ-AT ?auto_16292 ?auto_16297 ) ( IN-TRUCK ?auto_16293 ?auto_16296 ) ( TRUCK-AT ?auto_16296 ?auto_16298 ) ( IN-CITY ?auto_16298 ?auto_16294 ) ( not ( = ?auto_16290 ?auto_16298 ) ) ( not ( = ?auto_16295 ?auto_16298 ) ) ( not ( = ?auto_16297 ?auto_16298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16293 ?auto_16291 ?auto_16290 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16351 - OBJ
      ?auto_16350 - LOCATION
    )
    :vars
    (
      ?auto_16354 - LOCATION
      ?auto_16352 - CITY
      ?auto_16358 - OBJ
      ?auto_16353 - OBJ
      ?auto_16356 - LOCATION
      ?auto_16355 - TRUCK
      ?auto_16357 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16354 ?auto_16352 ) ( IN-CITY ?auto_16350 ?auto_16352 ) ( not ( = ?auto_16350 ?auto_16354 ) ) ( not ( = ?auto_16358 ?auto_16351 ) ) ( OBJ-AT ?auto_16351 ?auto_16354 ) ( not ( = ?auto_16358 ?auto_16353 ) ) ( not ( = ?auto_16351 ?auto_16353 ) ) ( IN-CITY ?auto_16356 ?auto_16352 ) ( not ( = ?auto_16350 ?auto_16356 ) ) ( not ( = ?auto_16354 ?auto_16356 ) ) ( OBJ-AT ?auto_16353 ?auto_16356 ) ( TRUCK-AT ?auto_16355 ?auto_16357 ) ( IN-CITY ?auto_16357 ?auto_16352 ) ( not ( = ?auto_16350 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( OBJ-AT ?auto_16358 ?auto_16357 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16358 ?auto_16355 ?auto_16357 )
      ( DELIVER-2PKG ?auto_16358 ?auto_16351 ?auto_16350 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16360 - OBJ
      ?auto_16361 - OBJ
      ?auto_16359 - LOCATION
    )
    :vars
    (
      ?auto_16365 - LOCATION
      ?auto_16364 - CITY
      ?auto_16363 - OBJ
      ?auto_16366 - LOCATION
      ?auto_16367 - TRUCK
      ?auto_16362 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16365 ?auto_16364 ) ( IN-CITY ?auto_16359 ?auto_16364 ) ( not ( = ?auto_16359 ?auto_16365 ) ) ( not ( = ?auto_16360 ?auto_16361 ) ) ( OBJ-AT ?auto_16361 ?auto_16365 ) ( not ( = ?auto_16360 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( IN-CITY ?auto_16366 ?auto_16364 ) ( not ( = ?auto_16359 ?auto_16366 ) ) ( not ( = ?auto_16365 ?auto_16366 ) ) ( OBJ-AT ?auto_16363 ?auto_16366 ) ( TRUCK-AT ?auto_16367 ?auto_16362 ) ( IN-CITY ?auto_16362 ?auto_16364 ) ( not ( = ?auto_16359 ?auto_16362 ) ) ( not ( = ?auto_16365 ?auto_16362 ) ) ( not ( = ?auto_16366 ?auto_16362 ) ) ( OBJ-AT ?auto_16360 ?auto_16362 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16361 ?auto_16359 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16369 - OBJ
      ?auto_16370 - OBJ
      ?auto_16368 - LOCATION
    )
    :vars
    (
      ?auto_16374 - LOCATION
      ?auto_16371 - CITY
      ?auto_16376 - OBJ
      ?auto_16373 - LOCATION
      ?auto_16372 - TRUCK
      ?auto_16375 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16374 ?auto_16371 ) ( IN-CITY ?auto_16368 ?auto_16371 ) ( not ( = ?auto_16368 ?auto_16374 ) ) ( not ( = ?auto_16376 ?auto_16370 ) ) ( OBJ-AT ?auto_16370 ?auto_16374 ) ( not ( = ?auto_16376 ?auto_16369 ) ) ( not ( = ?auto_16370 ?auto_16369 ) ) ( IN-CITY ?auto_16373 ?auto_16371 ) ( not ( = ?auto_16368 ?auto_16373 ) ) ( not ( = ?auto_16374 ?auto_16373 ) ) ( OBJ-AT ?auto_16369 ?auto_16373 ) ( TRUCK-AT ?auto_16372 ?auto_16375 ) ( IN-CITY ?auto_16375 ?auto_16371 ) ( not ( = ?auto_16368 ?auto_16375 ) ) ( not ( = ?auto_16374 ?auto_16375 ) ) ( not ( = ?auto_16373 ?auto_16375 ) ) ( OBJ-AT ?auto_16376 ?auto_16375 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16376 ?auto_16370 ?auto_16368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16378 - OBJ
      ?auto_16379 - OBJ
      ?auto_16377 - LOCATION
    )
    :vars
    (
      ?auto_16384 - LOCATION
      ?auto_16381 - CITY
      ?auto_16380 - OBJ
      ?auto_16383 - LOCATION
      ?auto_16382 - TRUCK
      ?auto_16385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16384 ?auto_16381 ) ( IN-CITY ?auto_16377 ?auto_16381 ) ( not ( = ?auto_16377 ?auto_16384 ) ) ( not ( = ?auto_16379 ?auto_16378 ) ) ( OBJ-AT ?auto_16378 ?auto_16384 ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16378 ?auto_16380 ) ) ( IN-CITY ?auto_16383 ?auto_16381 ) ( not ( = ?auto_16377 ?auto_16383 ) ) ( not ( = ?auto_16384 ?auto_16383 ) ) ( OBJ-AT ?auto_16380 ?auto_16383 ) ( TRUCK-AT ?auto_16382 ?auto_16385 ) ( IN-CITY ?auto_16385 ?auto_16381 ) ( not ( = ?auto_16377 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( not ( = ?auto_16383 ?auto_16385 ) ) ( OBJ-AT ?auto_16379 ?auto_16385 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16379 ?auto_16378 ?auto_16377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16387 - OBJ
      ?auto_16388 - OBJ
      ?auto_16386 - LOCATION
    )
    :vars
    (
      ?auto_16392 - LOCATION
      ?auto_16389 - CITY
      ?auto_16394 - OBJ
      ?auto_16391 - LOCATION
      ?auto_16390 - TRUCK
      ?auto_16393 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16392 ?auto_16389 ) ( IN-CITY ?auto_16386 ?auto_16389 ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( not ( = ?auto_16394 ?auto_16387 ) ) ( OBJ-AT ?auto_16387 ?auto_16392 ) ( not ( = ?auto_16394 ?auto_16388 ) ) ( not ( = ?auto_16387 ?auto_16388 ) ) ( IN-CITY ?auto_16391 ?auto_16389 ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( not ( = ?auto_16392 ?auto_16391 ) ) ( OBJ-AT ?auto_16388 ?auto_16391 ) ( TRUCK-AT ?auto_16390 ?auto_16393 ) ( IN-CITY ?auto_16393 ?auto_16389 ) ( not ( = ?auto_16386 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16391 ?auto_16393 ) ) ( OBJ-AT ?auto_16394 ?auto_16393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16394 ?auto_16387 ?auto_16386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16416 - OBJ
      ?auto_16417 - OBJ
      ?auto_16418 - OBJ
      ?auto_16415 - LOCATION
    )
    :vars
    (
      ?auto_16422 - LOCATION
      ?auto_16419 - CITY
      ?auto_16421 - LOCATION
      ?auto_16420 - TRUCK
      ?auto_16423 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16422 ?auto_16419 ) ( IN-CITY ?auto_16415 ?auto_16419 ) ( not ( = ?auto_16415 ?auto_16422 ) ) ( not ( = ?auto_16416 ?auto_16418 ) ) ( OBJ-AT ?auto_16418 ?auto_16422 ) ( not ( = ?auto_16416 ?auto_16417 ) ) ( not ( = ?auto_16418 ?auto_16417 ) ) ( IN-CITY ?auto_16421 ?auto_16419 ) ( not ( = ?auto_16415 ?auto_16421 ) ) ( not ( = ?auto_16422 ?auto_16421 ) ) ( OBJ-AT ?auto_16417 ?auto_16421 ) ( TRUCK-AT ?auto_16420 ?auto_16423 ) ( IN-CITY ?auto_16423 ?auto_16419 ) ( not ( = ?auto_16415 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16423 ) ) ( not ( = ?auto_16421 ?auto_16423 ) ) ( OBJ-AT ?auto_16416 ?auto_16423 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16416 ?auto_16418 ?auto_16415 ) )
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
      ?auto_16438 - CITY
      ?auto_16440 - LOCATION
      ?auto_16439 - TRUCK
      ?auto_16442 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16441 ?auto_16438 ) ( IN-CITY ?auto_16434 ?auto_16438 ) ( not ( = ?auto_16434 ?auto_16441 ) ) ( not ( = ?auto_16435 ?auto_16436 ) ) ( OBJ-AT ?auto_16436 ?auto_16441 ) ( not ( = ?auto_16435 ?auto_16437 ) ) ( not ( = ?auto_16436 ?auto_16437 ) ) ( IN-CITY ?auto_16440 ?auto_16438 ) ( not ( = ?auto_16434 ?auto_16440 ) ) ( not ( = ?auto_16441 ?auto_16440 ) ) ( OBJ-AT ?auto_16437 ?auto_16440 ) ( TRUCK-AT ?auto_16439 ?auto_16442 ) ( IN-CITY ?auto_16442 ?auto_16438 ) ( not ( = ?auto_16434 ?auto_16442 ) ) ( not ( = ?auto_16441 ?auto_16442 ) ) ( not ( = ?auto_16440 ?auto_16442 ) ) ( OBJ-AT ?auto_16435 ?auto_16442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16435 ?auto_16436 ?auto_16434 ) )
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
      ?auto_16457 - CITY
      ?auto_16459 - LOCATION
      ?auto_16458 - TRUCK
      ?auto_16461 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16460 ?auto_16457 ) ( IN-CITY ?auto_16453 ?auto_16457 ) ( not ( = ?auto_16453 ?auto_16460 ) ) ( not ( = ?auto_16455 ?auto_16456 ) ) ( OBJ-AT ?auto_16456 ?auto_16460 ) ( not ( = ?auto_16455 ?auto_16454 ) ) ( not ( = ?auto_16456 ?auto_16454 ) ) ( IN-CITY ?auto_16459 ?auto_16457 ) ( not ( = ?auto_16453 ?auto_16459 ) ) ( not ( = ?auto_16460 ?auto_16459 ) ) ( OBJ-AT ?auto_16454 ?auto_16459 ) ( TRUCK-AT ?auto_16458 ?auto_16461 ) ( IN-CITY ?auto_16461 ?auto_16457 ) ( not ( = ?auto_16453 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16459 ?auto_16461 ) ) ( OBJ-AT ?auto_16455 ?auto_16461 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16455 ?auto_16456 ?auto_16453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16473 - OBJ
      ?auto_16474 - OBJ
      ?auto_16475 - OBJ
      ?auto_16472 - LOCATION
    )
    :vars
    (
      ?auto_16479 - LOCATION
      ?auto_16476 - CITY
      ?auto_16478 - LOCATION
      ?auto_16477 - TRUCK
      ?auto_16480 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16479 ?auto_16476 ) ( IN-CITY ?auto_16472 ?auto_16476 ) ( not ( = ?auto_16472 ?auto_16479 ) ) ( not ( = ?auto_16475 ?auto_16474 ) ) ( OBJ-AT ?auto_16474 ?auto_16479 ) ( not ( = ?auto_16475 ?auto_16473 ) ) ( not ( = ?auto_16474 ?auto_16473 ) ) ( IN-CITY ?auto_16478 ?auto_16476 ) ( not ( = ?auto_16472 ?auto_16478 ) ) ( not ( = ?auto_16479 ?auto_16478 ) ) ( OBJ-AT ?auto_16473 ?auto_16478 ) ( TRUCK-AT ?auto_16477 ?auto_16480 ) ( IN-CITY ?auto_16480 ?auto_16476 ) ( not ( = ?auto_16472 ?auto_16480 ) ) ( not ( = ?auto_16479 ?auto_16480 ) ) ( not ( = ?auto_16478 ?auto_16480 ) ) ( OBJ-AT ?auto_16475 ?auto_16480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16475 ?auto_16474 ?auto_16472 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16512 - OBJ
      ?auto_16513 - OBJ
      ?auto_16514 - OBJ
      ?auto_16511 - LOCATION
    )
    :vars
    (
      ?auto_16518 - LOCATION
      ?auto_16515 - CITY
      ?auto_16517 - LOCATION
      ?auto_16516 - TRUCK
      ?auto_16519 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16518 ?auto_16515 ) ( IN-CITY ?auto_16511 ?auto_16515 ) ( not ( = ?auto_16511 ?auto_16518 ) ) ( not ( = ?auto_16513 ?auto_16512 ) ) ( OBJ-AT ?auto_16512 ?auto_16518 ) ( not ( = ?auto_16513 ?auto_16514 ) ) ( not ( = ?auto_16512 ?auto_16514 ) ) ( IN-CITY ?auto_16517 ?auto_16515 ) ( not ( = ?auto_16511 ?auto_16517 ) ) ( not ( = ?auto_16518 ?auto_16517 ) ) ( OBJ-AT ?auto_16514 ?auto_16517 ) ( TRUCK-AT ?auto_16516 ?auto_16519 ) ( IN-CITY ?auto_16519 ?auto_16515 ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16517 ?auto_16519 ) ) ( OBJ-AT ?auto_16513 ?auto_16519 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16513 ?auto_16512 ?auto_16511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16531 - OBJ
      ?auto_16532 - OBJ
      ?auto_16533 - OBJ
      ?auto_16530 - LOCATION
    )
    :vars
    (
      ?auto_16537 - LOCATION
      ?auto_16534 - CITY
      ?auto_16536 - LOCATION
      ?auto_16535 - TRUCK
      ?auto_16538 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16537 ?auto_16534 ) ( IN-CITY ?auto_16530 ?auto_16534 ) ( not ( = ?auto_16530 ?auto_16537 ) ) ( not ( = ?auto_16533 ?auto_16531 ) ) ( OBJ-AT ?auto_16531 ?auto_16537 ) ( not ( = ?auto_16533 ?auto_16532 ) ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( IN-CITY ?auto_16536 ?auto_16534 ) ( not ( = ?auto_16530 ?auto_16536 ) ) ( not ( = ?auto_16537 ?auto_16536 ) ) ( OBJ-AT ?auto_16532 ?auto_16536 ) ( TRUCK-AT ?auto_16535 ?auto_16538 ) ( IN-CITY ?auto_16538 ?auto_16534 ) ( not ( = ?auto_16530 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16536 ?auto_16538 ) ) ( OBJ-AT ?auto_16533 ?auto_16538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16533 ?auto_16531 ?auto_16530 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16591 - OBJ
      ?auto_16590 - LOCATION
    )
    :vars
    (
      ?auto_16596 - LOCATION
      ?auto_16593 - CITY
      ?auto_16598 - OBJ
      ?auto_16592 - OBJ
      ?auto_16595 - LOCATION
      ?auto_16597 - LOCATION
      ?auto_16594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16596 ?auto_16593 ) ( IN-CITY ?auto_16590 ?auto_16593 ) ( not ( = ?auto_16590 ?auto_16596 ) ) ( not ( = ?auto_16598 ?auto_16591 ) ) ( OBJ-AT ?auto_16591 ?auto_16596 ) ( not ( = ?auto_16598 ?auto_16592 ) ) ( not ( = ?auto_16591 ?auto_16592 ) ) ( IN-CITY ?auto_16595 ?auto_16593 ) ( not ( = ?auto_16590 ?auto_16595 ) ) ( not ( = ?auto_16596 ?auto_16595 ) ) ( OBJ-AT ?auto_16592 ?auto_16595 ) ( IN-CITY ?auto_16597 ?auto_16593 ) ( not ( = ?auto_16590 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( OBJ-AT ?auto_16598 ?auto_16597 ) ( TRUCK-AT ?auto_16594 ?auto_16590 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16594 ?auto_16590 ?auto_16597 ?auto_16593 )
      ( DELIVER-2PKG ?auto_16598 ?auto_16591 ?auto_16590 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16600 - OBJ
      ?auto_16601 - OBJ
      ?auto_16599 - LOCATION
    )
    :vars
    (
      ?auto_16602 - LOCATION
      ?auto_16604 - CITY
      ?auto_16603 - OBJ
      ?auto_16606 - LOCATION
      ?auto_16605 - LOCATION
      ?auto_16607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16602 ?auto_16604 ) ( IN-CITY ?auto_16599 ?auto_16604 ) ( not ( = ?auto_16599 ?auto_16602 ) ) ( not ( = ?auto_16600 ?auto_16601 ) ) ( OBJ-AT ?auto_16601 ?auto_16602 ) ( not ( = ?auto_16600 ?auto_16603 ) ) ( not ( = ?auto_16601 ?auto_16603 ) ) ( IN-CITY ?auto_16606 ?auto_16604 ) ( not ( = ?auto_16599 ?auto_16606 ) ) ( not ( = ?auto_16602 ?auto_16606 ) ) ( OBJ-AT ?auto_16603 ?auto_16606 ) ( IN-CITY ?auto_16605 ?auto_16604 ) ( not ( = ?auto_16599 ?auto_16605 ) ) ( not ( = ?auto_16602 ?auto_16605 ) ) ( not ( = ?auto_16606 ?auto_16605 ) ) ( OBJ-AT ?auto_16600 ?auto_16605 ) ( TRUCK-AT ?auto_16607 ?auto_16599 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16601 ?auto_16599 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16609 - OBJ
      ?auto_16610 - OBJ
      ?auto_16608 - LOCATION
    )
    :vars
    (
      ?auto_16613 - LOCATION
      ?auto_16614 - CITY
      ?auto_16616 - OBJ
      ?auto_16615 - LOCATION
      ?auto_16612 - LOCATION
      ?auto_16611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16613 ?auto_16614 ) ( IN-CITY ?auto_16608 ?auto_16614 ) ( not ( = ?auto_16608 ?auto_16613 ) ) ( not ( = ?auto_16616 ?auto_16610 ) ) ( OBJ-AT ?auto_16610 ?auto_16613 ) ( not ( = ?auto_16616 ?auto_16609 ) ) ( not ( = ?auto_16610 ?auto_16609 ) ) ( IN-CITY ?auto_16615 ?auto_16614 ) ( not ( = ?auto_16608 ?auto_16615 ) ) ( not ( = ?auto_16613 ?auto_16615 ) ) ( OBJ-AT ?auto_16609 ?auto_16615 ) ( IN-CITY ?auto_16612 ?auto_16614 ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16613 ?auto_16612 ) ) ( not ( = ?auto_16615 ?auto_16612 ) ) ( OBJ-AT ?auto_16616 ?auto_16612 ) ( TRUCK-AT ?auto_16611 ?auto_16608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16616 ?auto_16610 ?auto_16608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16618 - OBJ
      ?auto_16619 - OBJ
      ?auto_16617 - LOCATION
    )
    :vars
    (
      ?auto_16622 - LOCATION
      ?auto_16623 - CITY
      ?auto_16625 - OBJ
      ?auto_16624 - LOCATION
      ?auto_16621 - LOCATION
      ?auto_16620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16622 ?auto_16623 ) ( IN-CITY ?auto_16617 ?auto_16623 ) ( not ( = ?auto_16617 ?auto_16622 ) ) ( not ( = ?auto_16619 ?auto_16618 ) ) ( OBJ-AT ?auto_16618 ?auto_16622 ) ( not ( = ?auto_16619 ?auto_16625 ) ) ( not ( = ?auto_16618 ?auto_16625 ) ) ( IN-CITY ?auto_16624 ?auto_16623 ) ( not ( = ?auto_16617 ?auto_16624 ) ) ( not ( = ?auto_16622 ?auto_16624 ) ) ( OBJ-AT ?auto_16625 ?auto_16624 ) ( IN-CITY ?auto_16621 ?auto_16623 ) ( not ( = ?auto_16617 ?auto_16621 ) ) ( not ( = ?auto_16622 ?auto_16621 ) ) ( not ( = ?auto_16624 ?auto_16621 ) ) ( OBJ-AT ?auto_16619 ?auto_16621 ) ( TRUCK-AT ?auto_16620 ?auto_16617 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16619 ?auto_16618 ?auto_16617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16627 - OBJ
      ?auto_16628 - OBJ
      ?auto_16626 - LOCATION
    )
    :vars
    (
      ?auto_16631 - LOCATION
      ?auto_16632 - CITY
      ?auto_16634 - OBJ
      ?auto_16633 - LOCATION
      ?auto_16630 - LOCATION
      ?auto_16629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16631 ?auto_16632 ) ( IN-CITY ?auto_16626 ?auto_16632 ) ( not ( = ?auto_16626 ?auto_16631 ) ) ( not ( = ?auto_16634 ?auto_16627 ) ) ( OBJ-AT ?auto_16627 ?auto_16631 ) ( not ( = ?auto_16634 ?auto_16628 ) ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( IN-CITY ?auto_16633 ?auto_16632 ) ( not ( = ?auto_16626 ?auto_16633 ) ) ( not ( = ?auto_16631 ?auto_16633 ) ) ( OBJ-AT ?auto_16628 ?auto_16633 ) ( IN-CITY ?auto_16630 ?auto_16632 ) ( not ( = ?auto_16626 ?auto_16630 ) ) ( not ( = ?auto_16631 ?auto_16630 ) ) ( not ( = ?auto_16633 ?auto_16630 ) ) ( OBJ-AT ?auto_16634 ?auto_16630 ) ( TRUCK-AT ?auto_16629 ?auto_16626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16634 ?auto_16627 ?auto_16626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16656 - OBJ
      ?auto_16657 - OBJ
      ?auto_16658 - OBJ
      ?auto_16655 - LOCATION
    )
    :vars
    (
      ?auto_16661 - LOCATION
      ?auto_16662 - CITY
      ?auto_16663 - LOCATION
      ?auto_16660 - LOCATION
      ?auto_16659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16661 ?auto_16662 ) ( IN-CITY ?auto_16655 ?auto_16662 ) ( not ( = ?auto_16655 ?auto_16661 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( OBJ-AT ?auto_16658 ?auto_16661 ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16658 ?auto_16657 ) ) ( IN-CITY ?auto_16663 ?auto_16662 ) ( not ( = ?auto_16655 ?auto_16663 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( OBJ-AT ?auto_16657 ?auto_16663 ) ( IN-CITY ?auto_16660 ?auto_16662 ) ( not ( = ?auto_16655 ?auto_16660 ) ) ( not ( = ?auto_16661 ?auto_16660 ) ) ( not ( = ?auto_16663 ?auto_16660 ) ) ( OBJ-AT ?auto_16656 ?auto_16660 ) ( TRUCK-AT ?auto_16659 ?auto_16655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16656 ?auto_16658 ?auto_16655 ) )
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
      ?auto_16680 - LOCATION
      ?auto_16681 - CITY
      ?auto_16682 - LOCATION
      ?auto_16679 - LOCATION
      ?auto_16678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16680 ?auto_16681 ) ( IN-CITY ?auto_16674 ?auto_16681 ) ( not ( = ?auto_16674 ?auto_16680 ) ) ( not ( = ?auto_16675 ?auto_16676 ) ) ( OBJ-AT ?auto_16676 ?auto_16680 ) ( not ( = ?auto_16675 ?auto_16677 ) ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( IN-CITY ?auto_16682 ?auto_16681 ) ( not ( = ?auto_16674 ?auto_16682 ) ) ( not ( = ?auto_16680 ?auto_16682 ) ) ( OBJ-AT ?auto_16677 ?auto_16682 ) ( IN-CITY ?auto_16679 ?auto_16681 ) ( not ( = ?auto_16674 ?auto_16679 ) ) ( not ( = ?auto_16680 ?auto_16679 ) ) ( not ( = ?auto_16682 ?auto_16679 ) ) ( OBJ-AT ?auto_16675 ?auto_16679 ) ( TRUCK-AT ?auto_16678 ?auto_16674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16675 ?auto_16676 ?auto_16674 ) )
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
      ?auto_16699 - LOCATION
      ?auto_16700 - CITY
      ?auto_16701 - LOCATION
      ?auto_16698 - LOCATION
      ?auto_16697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16699 ?auto_16700 ) ( IN-CITY ?auto_16693 ?auto_16700 ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( OBJ-AT ?auto_16696 ?auto_16699 ) ( not ( = ?auto_16695 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16694 ) ) ( IN-CITY ?auto_16701 ?auto_16700 ) ( not ( = ?auto_16693 ?auto_16701 ) ) ( not ( = ?auto_16699 ?auto_16701 ) ) ( OBJ-AT ?auto_16694 ?auto_16701 ) ( IN-CITY ?auto_16698 ?auto_16700 ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( not ( = ?auto_16699 ?auto_16698 ) ) ( not ( = ?auto_16701 ?auto_16698 ) ) ( OBJ-AT ?auto_16695 ?auto_16698 ) ( TRUCK-AT ?auto_16697 ?auto_16693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16695 ?auto_16696 ?auto_16693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16713 - OBJ
      ?auto_16714 - OBJ
      ?auto_16715 - OBJ
      ?auto_16712 - LOCATION
    )
    :vars
    (
      ?auto_16718 - LOCATION
      ?auto_16719 - CITY
      ?auto_16720 - LOCATION
      ?auto_16717 - LOCATION
      ?auto_16716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16718 ?auto_16719 ) ( IN-CITY ?auto_16712 ?auto_16719 ) ( not ( = ?auto_16712 ?auto_16718 ) ) ( not ( = ?auto_16715 ?auto_16714 ) ) ( OBJ-AT ?auto_16714 ?auto_16718 ) ( not ( = ?auto_16715 ?auto_16713 ) ) ( not ( = ?auto_16714 ?auto_16713 ) ) ( IN-CITY ?auto_16720 ?auto_16719 ) ( not ( = ?auto_16712 ?auto_16720 ) ) ( not ( = ?auto_16718 ?auto_16720 ) ) ( OBJ-AT ?auto_16713 ?auto_16720 ) ( IN-CITY ?auto_16717 ?auto_16719 ) ( not ( = ?auto_16712 ?auto_16717 ) ) ( not ( = ?auto_16718 ?auto_16717 ) ) ( not ( = ?auto_16720 ?auto_16717 ) ) ( OBJ-AT ?auto_16715 ?auto_16717 ) ( TRUCK-AT ?auto_16716 ?auto_16712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16715 ?auto_16714 ?auto_16712 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16752 - OBJ
      ?auto_16753 - OBJ
      ?auto_16754 - OBJ
      ?auto_16751 - LOCATION
    )
    :vars
    (
      ?auto_16757 - LOCATION
      ?auto_16758 - CITY
      ?auto_16759 - LOCATION
      ?auto_16756 - LOCATION
      ?auto_16755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16757 ?auto_16758 ) ( IN-CITY ?auto_16751 ?auto_16758 ) ( not ( = ?auto_16751 ?auto_16757 ) ) ( not ( = ?auto_16753 ?auto_16752 ) ) ( OBJ-AT ?auto_16752 ?auto_16757 ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( IN-CITY ?auto_16759 ?auto_16758 ) ( not ( = ?auto_16751 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( OBJ-AT ?auto_16754 ?auto_16759 ) ( IN-CITY ?auto_16756 ?auto_16758 ) ( not ( = ?auto_16751 ?auto_16756 ) ) ( not ( = ?auto_16757 ?auto_16756 ) ) ( not ( = ?auto_16759 ?auto_16756 ) ) ( OBJ-AT ?auto_16753 ?auto_16756 ) ( TRUCK-AT ?auto_16755 ?auto_16751 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16753 ?auto_16752 ?auto_16751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16771 - OBJ
      ?auto_16772 - OBJ
      ?auto_16773 - OBJ
      ?auto_16770 - LOCATION
    )
    :vars
    (
      ?auto_16776 - LOCATION
      ?auto_16777 - CITY
      ?auto_16778 - LOCATION
      ?auto_16775 - LOCATION
      ?auto_16774 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16776 ?auto_16777 ) ( IN-CITY ?auto_16770 ?auto_16777 ) ( not ( = ?auto_16770 ?auto_16776 ) ) ( not ( = ?auto_16773 ?auto_16771 ) ) ( OBJ-AT ?auto_16771 ?auto_16776 ) ( not ( = ?auto_16773 ?auto_16772 ) ) ( not ( = ?auto_16771 ?auto_16772 ) ) ( IN-CITY ?auto_16778 ?auto_16777 ) ( not ( = ?auto_16770 ?auto_16778 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( OBJ-AT ?auto_16772 ?auto_16778 ) ( IN-CITY ?auto_16775 ?auto_16777 ) ( not ( = ?auto_16770 ?auto_16775 ) ) ( not ( = ?auto_16776 ?auto_16775 ) ) ( not ( = ?auto_16778 ?auto_16775 ) ) ( OBJ-AT ?auto_16773 ?auto_16775 ) ( TRUCK-AT ?auto_16774 ?auto_16770 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16773 ?auto_16771 ?auto_16770 ) )
  )

)

