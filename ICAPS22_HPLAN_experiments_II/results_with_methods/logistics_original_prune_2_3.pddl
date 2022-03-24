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
      ?auto_737 - OBJ
      ?auto_736 - LOCATION
    )
    :vars
    (
      ?auto_738 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_738 ?auto_736 ) ( IN-TRUCK ?auto_737 ?auto_738 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_737 ?auto_738 ?auto_736 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_744 - OBJ
      ?auto_743 - LOCATION
    )
    :vars
    (
      ?auto_745 - TRUCK
      ?auto_746 - LOCATION
      ?auto_747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_744 ?auto_745 ) ( TRUCK-AT ?auto_745 ?auto_746 ) ( IN-CITY ?auto_746 ?auto_747 ) ( IN-CITY ?auto_743 ?auto_747 ) ( not ( = ?auto_743 ?auto_746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_745 ?auto_746 ?auto_743 ?auto_747 )
      ( DELIVER-1PKG ?auto_744 ?auto_743 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_755 - OBJ
      ?auto_754 - LOCATION
    )
    :vars
    (
      ?auto_757 - TRUCK
      ?auto_758 - LOCATION
      ?auto_756 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_757 ?auto_758 ) ( IN-CITY ?auto_758 ?auto_756 ) ( IN-CITY ?auto_754 ?auto_756 ) ( not ( = ?auto_754 ?auto_758 ) ) ( OBJ-AT ?auto_755 ?auto_758 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_755 ?auto_757 ?auto_758 )
      ( DELIVER-1PKG ?auto_755 ?auto_754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_766 - OBJ
      ?auto_765 - LOCATION
    )
    :vars
    (
      ?auto_768 - LOCATION
      ?auto_769 - CITY
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_768 ?auto_769 ) ( IN-CITY ?auto_765 ?auto_769 ) ( not ( = ?auto_765 ?auto_768 ) ) ( OBJ-AT ?auto_766 ?auto_768 ) ( TRUCK-AT ?auto_767 ?auto_765 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_767 ?auto_765 ?auto_768 ?auto_769 )
      ( DELIVER-1PKG ?auto_766 ?auto_765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_791 - OBJ
      ?auto_792 - OBJ
      ?auto_790 - LOCATION
    )
    :vars
    (
      ?auto_793 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_793 ?auto_790 ) ( IN-TRUCK ?auto_792 ?auto_793 ) ( OBJ-AT ?auto_791 ?auto_790 ) ( not ( = ?auto_791 ?auto_792 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_792 ?auto_790 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_795 - OBJ
      ?auto_796 - OBJ
      ?auto_794 - LOCATION
    )
    :vars
    (
      ?auto_797 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_797 ?auto_794 ) ( IN-TRUCK ?auto_795 ?auto_797 ) ( OBJ-AT ?auto_796 ?auto_794 ) ( not ( = ?auto_795 ?auto_796 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_795 ?auto_794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_808 - OBJ
      ?auto_809 - OBJ
      ?auto_807 - LOCATION
    )
    :vars
    (
      ?auto_810 - TRUCK
      ?auto_811 - LOCATION
      ?auto_812 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_809 ?auto_810 ) ( TRUCK-AT ?auto_810 ?auto_811 ) ( IN-CITY ?auto_811 ?auto_812 ) ( IN-CITY ?auto_807 ?auto_812 ) ( not ( = ?auto_807 ?auto_811 ) ) ( OBJ-AT ?auto_808 ?auto_807 ) ( not ( = ?auto_808 ?auto_809 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_809 ?auto_807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_814 - OBJ
      ?auto_815 - OBJ
      ?auto_813 - LOCATION
    )
    :vars
    (
      ?auto_818 - TRUCK
      ?auto_817 - LOCATION
      ?auto_816 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_814 ?auto_818 ) ( TRUCK-AT ?auto_818 ?auto_817 ) ( IN-CITY ?auto_817 ?auto_816 ) ( IN-CITY ?auto_813 ?auto_816 ) ( not ( = ?auto_813 ?auto_817 ) ) ( OBJ-AT ?auto_815 ?auto_813 ) ( not ( = ?auto_815 ?auto_814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_815 ?auto_814 ?auto_813 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_827 - OBJ
      ?auto_826 - LOCATION
    )
    :vars
    (
      ?auto_831 - TRUCK
      ?auto_830 - LOCATION
      ?auto_829 - CITY
      ?auto_828 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_831 ?auto_830 ) ( IN-CITY ?auto_830 ?auto_829 ) ( IN-CITY ?auto_826 ?auto_829 ) ( not ( = ?auto_826 ?auto_830 ) ) ( OBJ-AT ?auto_828 ?auto_826 ) ( not ( = ?auto_828 ?auto_827 ) ) ( OBJ-AT ?auto_827 ?auto_830 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_827 ?auto_831 ?auto_830 )
      ( DELIVER-2PKG ?auto_828 ?auto_827 ?auto_826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_833 - OBJ
      ?auto_834 - OBJ
      ?auto_832 - LOCATION
    )
    :vars
    (
      ?auto_836 - TRUCK
      ?auto_837 - LOCATION
      ?auto_835 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_836 ?auto_837 ) ( IN-CITY ?auto_837 ?auto_835 ) ( IN-CITY ?auto_832 ?auto_835 ) ( not ( = ?auto_832 ?auto_837 ) ) ( OBJ-AT ?auto_833 ?auto_832 ) ( not ( = ?auto_833 ?auto_834 ) ) ( OBJ-AT ?auto_834 ?auto_837 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_834 ?auto_832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_839 - OBJ
      ?auto_840 - OBJ
      ?auto_838 - LOCATION
    )
    :vars
    (
      ?auto_843 - TRUCK
      ?auto_841 - LOCATION
      ?auto_842 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_843 ?auto_841 ) ( IN-CITY ?auto_841 ?auto_842 ) ( IN-CITY ?auto_838 ?auto_842 ) ( not ( = ?auto_838 ?auto_841 ) ) ( OBJ-AT ?auto_840 ?auto_838 ) ( not ( = ?auto_840 ?auto_839 ) ) ( OBJ-AT ?auto_839 ?auto_841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_840 ?auto_839 ?auto_838 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_852 - OBJ
      ?auto_851 - LOCATION
    )
    :vars
    (
      ?auto_853 - LOCATION
      ?auto_854 - CITY
      ?auto_855 - OBJ
      ?auto_856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_853 ?auto_854 ) ( IN-CITY ?auto_851 ?auto_854 ) ( not ( = ?auto_851 ?auto_853 ) ) ( OBJ-AT ?auto_855 ?auto_851 ) ( not ( = ?auto_855 ?auto_852 ) ) ( OBJ-AT ?auto_852 ?auto_853 ) ( TRUCK-AT ?auto_856 ?auto_851 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_856 ?auto_851 ?auto_853 ?auto_854 )
      ( DELIVER-2PKG ?auto_855 ?auto_852 ?auto_851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_858 - OBJ
      ?auto_859 - OBJ
      ?auto_857 - LOCATION
    )
    :vars
    (
      ?auto_860 - LOCATION
      ?auto_862 - CITY
      ?auto_861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_860 ?auto_862 ) ( IN-CITY ?auto_857 ?auto_862 ) ( not ( = ?auto_857 ?auto_860 ) ) ( OBJ-AT ?auto_858 ?auto_857 ) ( not ( = ?auto_858 ?auto_859 ) ) ( OBJ-AT ?auto_859 ?auto_860 ) ( TRUCK-AT ?auto_861 ?auto_857 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_859 ?auto_857 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_864 - OBJ
      ?auto_865 - OBJ
      ?auto_863 - LOCATION
    )
    :vars
    (
      ?auto_868 - LOCATION
      ?auto_866 - CITY
      ?auto_867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_868 ?auto_866 ) ( IN-CITY ?auto_863 ?auto_866 ) ( not ( = ?auto_863 ?auto_868 ) ) ( OBJ-AT ?auto_865 ?auto_863 ) ( not ( = ?auto_865 ?auto_864 ) ) ( OBJ-AT ?auto_864 ?auto_868 ) ( TRUCK-AT ?auto_867 ?auto_863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_865 ?auto_864 ?auto_863 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_877 - OBJ
      ?auto_876 - LOCATION
    )
    :vars
    (
      ?auto_880 - LOCATION
      ?auto_878 - CITY
      ?auto_881 - OBJ
      ?auto_879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_880 ?auto_878 ) ( IN-CITY ?auto_876 ?auto_878 ) ( not ( = ?auto_876 ?auto_880 ) ) ( not ( = ?auto_881 ?auto_877 ) ) ( OBJ-AT ?auto_877 ?auto_880 ) ( TRUCK-AT ?auto_879 ?auto_876 ) ( IN-TRUCK ?auto_881 ?auto_879 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_881 ?auto_876 )
      ( DELIVER-2PKG ?auto_881 ?auto_877 ?auto_876 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_883 - OBJ
      ?auto_884 - OBJ
      ?auto_882 - LOCATION
    )
    :vars
    (
      ?auto_886 - LOCATION
      ?auto_887 - CITY
      ?auto_885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_886 ?auto_887 ) ( IN-CITY ?auto_882 ?auto_887 ) ( not ( = ?auto_882 ?auto_886 ) ) ( not ( = ?auto_883 ?auto_884 ) ) ( OBJ-AT ?auto_884 ?auto_886 ) ( TRUCK-AT ?auto_885 ?auto_882 ) ( IN-TRUCK ?auto_883 ?auto_885 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_884 ?auto_882 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_889 - OBJ
      ?auto_890 - OBJ
      ?auto_888 - LOCATION
    )
    :vars
    (
      ?auto_893 - LOCATION
      ?auto_891 - CITY
      ?auto_892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_893 ?auto_891 ) ( IN-CITY ?auto_888 ?auto_891 ) ( not ( = ?auto_888 ?auto_893 ) ) ( not ( = ?auto_890 ?auto_889 ) ) ( OBJ-AT ?auto_889 ?auto_893 ) ( TRUCK-AT ?auto_892 ?auto_888 ) ( IN-TRUCK ?auto_890 ?auto_892 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_890 ?auto_889 ?auto_888 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_902 - OBJ
      ?auto_901 - LOCATION
    )
    :vars
    (
      ?auto_905 - LOCATION
      ?auto_903 - CITY
      ?auto_906 - OBJ
      ?auto_904 - TRUCK
      ?auto_907 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_905 ?auto_903 ) ( IN-CITY ?auto_901 ?auto_903 ) ( not ( = ?auto_901 ?auto_905 ) ) ( not ( = ?auto_906 ?auto_902 ) ) ( OBJ-AT ?auto_902 ?auto_905 ) ( IN-TRUCK ?auto_906 ?auto_904 ) ( TRUCK-AT ?auto_904 ?auto_907 ) ( IN-CITY ?auto_907 ?auto_903 ) ( not ( = ?auto_901 ?auto_907 ) ) ( not ( = ?auto_905 ?auto_907 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_904 ?auto_907 ?auto_901 ?auto_903 )
      ( DELIVER-2PKG ?auto_906 ?auto_902 ?auto_901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_909 - OBJ
      ?auto_910 - OBJ
      ?auto_908 - LOCATION
    )
    :vars
    (
      ?auto_911 - LOCATION
      ?auto_914 - CITY
      ?auto_912 - TRUCK
      ?auto_913 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911 ?auto_914 ) ( IN-CITY ?auto_908 ?auto_914 ) ( not ( = ?auto_908 ?auto_911 ) ) ( not ( = ?auto_909 ?auto_910 ) ) ( OBJ-AT ?auto_910 ?auto_911 ) ( IN-TRUCK ?auto_909 ?auto_912 ) ( TRUCK-AT ?auto_912 ?auto_913 ) ( IN-CITY ?auto_913 ?auto_914 ) ( not ( = ?auto_908 ?auto_913 ) ) ( not ( = ?auto_911 ?auto_913 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_910 ?auto_908 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_916 - OBJ
      ?auto_917 - OBJ
      ?auto_915 - LOCATION
    )
    :vars
    (
      ?auto_920 - LOCATION
      ?auto_921 - CITY
      ?auto_918 - TRUCK
      ?auto_919 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_920 ?auto_921 ) ( IN-CITY ?auto_915 ?auto_921 ) ( not ( = ?auto_915 ?auto_920 ) ) ( not ( = ?auto_917 ?auto_916 ) ) ( OBJ-AT ?auto_916 ?auto_920 ) ( IN-TRUCK ?auto_917 ?auto_918 ) ( TRUCK-AT ?auto_918 ?auto_919 ) ( IN-CITY ?auto_919 ?auto_921 ) ( not ( = ?auto_915 ?auto_919 ) ) ( not ( = ?auto_920 ?auto_919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_917 ?auto_916 ?auto_915 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_931 - OBJ
      ?auto_930 - LOCATION
    )
    :vars
    (
      ?auto_934 - LOCATION
      ?auto_936 - CITY
      ?auto_935 - OBJ
      ?auto_932 - TRUCK
      ?auto_933 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_934 ?auto_936 ) ( IN-CITY ?auto_930 ?auto_936 ) ( not ( = ?auto_930 ?auto_934 ) ) ( not ( = ?auto_935 ?auto_931 ) ) ( OBJ-AT ?auto_931 ?auto_934 ) ( TRUCK-AT ?auto_932 ?auto_933 ) ( IN-CITY ?auto_933 ?auto_936 ) ( not ( = ?auto_930 ?auto_933 ) ) ( not ( = ?auto_934 ?auto_933 ) ) ( OBJ-AT ?auto_935 ?auto_933 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_935 ?auto_932 ?auto_933 )
      ( DELIVER-2PKG ?auto_935 ?auto_931 ?auto_930 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_938 - OBJ
      ?auto_939 - OBJ
      ?auto_937 - LOCATION
    )
    :vars
    (
      ?auto_942 - LOCATION
      ?auto_943 - CITY
      ?auto_940 - TRUCK
      ?auto_941 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_942 ?auto_943 ) ( IN-CITY ?auto_937 ?auto_943 ) ( not ( = ?auto_937 ?auto_942 ) ) ( not ( = ?auto_938 ?auto_939 ) ) ( OBJ-AT ?auto_939 ?auto_942 ) ( TRUCK-AT ?auto_940 ?auto_941 ) ( IN-CITY ?auto_941 ?auto_943 ) ( not ( = ?auto_937 ?auto_941 ) ) ( not ( = ?auto_942 ?auto_941 ) ) ( OBJ-AT ?auto_938 ?auto_941 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_939 ?auto_937 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_945 - OBJ
      ?auto_946 - OBJ
      ?auto_944 - LOCATION
    )
    :vars
    (
      ?auto_948 - LOCATION
      ?auto_950 - CITY
      ?auto_949 - TRUCK
      ?auto_947 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_948 ?auto_950 ) ( IN-CITY ?auto_944 ?auto_950 ) ( not ( = ?auto_944 ?auto_948 ) ) ( not ( = ?auto_946 ?auto_945 ) ) ( OBJ-AT ?auto_945 ?auto_948 ) ( TRUCK-AT ?auto_949 ?auto_947 ) ( IN-CITY ?auto_947 ?auto_950 ) ( not ( = ?auto_944 ?auto_947 ) ) ( not ( = ?auto_948 ?auto_947 ) ) ( OBJ-AT ?auto_946 ?auto_947 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_946 ?auto_945 ?auto_944 ) )
  )

)

