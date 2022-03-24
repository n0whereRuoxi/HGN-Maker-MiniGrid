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
      ?auto_6732 - OBJ
      ?auto_6731 - LOCATION
    )
    :vars
    (
      ?auto_6733 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6733 ?auto_6731 ) ( IN-TRUCK ?auto_6732 ?auto_6733 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6732 ?auto_6733 ?auto_6731 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6744 - OBJ
      ?auto_6743 - LOCATION
    )
    :vars
    (
      ?auto_6745 - TRUCK
      ?auto_6746 - LOCATION
      ?auto_6747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6744 ?auto_6745 ) ( TRUCK-AT ?auto_6745 ?auto_6746 ) ( IN-CITY ?auto_6746 ?auto_6747 ) ( IN-CITY ?auto_6743 ?auto_6747 ) ( not ( = ?auto_6743 ?auto_6746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6745 ?auto_6746 ?auto_6743 ?auto_6747 )
      ( DELIVER-1PKG ?auto_6744 ?auto_6743 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6762 - OBJ
      ?auto_6761 - LOCATION
    )
    :vars
    (
      ?auto_6764 - TRUCK
      ?auto_6763 - LOCATION
      ?auto_6765 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6764 ?auto_6763 ) ( IN-CITY ?auto_6763 ?auto_6765 ) ( IN-CITY ?auto_6761 ?auto_6765 ) ( not ( = ?auto_6761 ?auto_6763 ) ) ( OBJ-AT ?auto_6762 ?auto_6763 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6762 ?auto_6764 ?auto_6763 )
      ( DELIVER-1PKG ?auto_6762 ?auto_6761 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6780 - OBJ
      ?auto_6779 - LOCATION
    )
    :vars
    (
      ?auto_6781 - LOCATION
      ?auto_6782 - CITY
      ?auto_6783 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6781 ?auto_6782 ) ( IN-CITY ?auto_6779 ?auto_6782 ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( OBJ-AT ?auto_6780 ?auto_6781 ) ( TRUCK-AT ?auto_6783 ?auto_6779 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6783 ?auto_6779 ?auto_6781 ?auto_6782 )
      ( DELIVER-1PKG ?auto_6780 ?auto_6779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6840 - OBJ
      ?auto_6841 - OBJ
      ?auto_6839 - LOCATION
    )
    :vars
    (
      ?auto_6842 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6842 ?auto_6839 ) ( IN-TRUCK ?auto_6841 ?auto_6842 ) ( OBJ-AT ?auto_6840 ?auto_6839 ) ( not ( = ?auto_6840 ?auto_6841 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6841 ?auto_6839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6844 - OBJ
      ?auto_6845 - OBJ
      ?auto_6843 - LOCATION
    )
    :vars
    (
      ?auto_6846 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6846 ?auto_6843 ) ( IN-TRUCK ?auto_6844 ?auto_6846 ) ( OBJ-AT ?auto_6845 ?auto_6843 ) ( not ( = ?auto_6844 ?auto_6845 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6844 ?auto_6843 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6852 - OBJ
      ?auto_6853 - OBJ
      ?auto_6854 - OBJ
      ?auto_6851 - LOCATION
    )
    :vars
    (
      ?auto_6855 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6855 ?auto_6851 ) ( IN-TRUCK ?auto_6854 ?auto_6855 ) ( OBJ-AT ?auto_6852 ?auto_6851 ) ( OBJ-AT ?auto_6853 ?auto_6851 ) ( not ( = ?auto_6852 ?auto_6853 ) ) ( not ( = ?auto_6852 ?auto_6854 ) ) ( not ( = ?auto_6853 ?auto_6854 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6854 ?auto_6851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6857 - OBJ
      ?auto_6858 - OBJ
      ?auto_6859 - OBJ
      ?auto_6856 - LOCATION
    )
    :vars
    (
      ?auto_6860 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6860 ?auto_6856 ) ( IN-TRUCK ?auto_6858 ?auto_6860 ) ( OBJ-AT ?auto_6857 ?auto_6856 ) ( OBJ-AT ?auto_6859 ?auto_6856 ) ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6857 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6858 ?auto_6856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6867 - OBJ
      ?auto_6868 - OBJ
      ?auto_6869 - OBJ
      ?auto_6866 - LOCATION
    )
    :vars
    (
      ?auto_6870 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6870 ?auto_6866 ) ( IN-TRUCK ?auto_6867 ?auto_6870 ) ( OBJ-AT ?auto_6868 ?auto_6866 ) ( OBJ-AT ?auto_6869 ?auto_6866 ) ( not ( = ?auto_6867 ?auto_6868 ) ) ( not ( = ?auto_6867 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6869 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6867 ?auto_6866 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6892 - OBJ
      ?auto_6893 - OBJ
      ?auto_6891 - LOCATION
    )
    :vars
    (
      ?auto_6895 - TRUCK
      ?auto_6896 - LOCATION
      ?auto_6894 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6893 ?auto_6895 ) ( TRUCK-AT ?auto_6895 ?auto_6896 ) ( IN-CITY ?auto_6896 ?auto_6894 ) ( IN-CITY ?auto_6891 ?auto_6894 ) ( not ( = ?auto_6891 ?auto_6896 ) ) ( OBJ-AT ?auto_6892 ?auto_6891 ) ( not ( = ?auto_6892 ?auto_6893 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6893 ?auto_6891 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6898 - OBJ
      ?auto_6899 - OBJ
      ?auto_6897 - LOCATION
    )
    :vars
    (
      ?auto_6900 - TRUCK
      ?auto_6901 - LOCATION
      ?auto_6902 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6898 ?auto_6900 ) ( TRUCK-AT ?auto_6900 ?auto_6901 ) ( IN-CITY ?auto_6901 ?auto_6902 ) ( IN-CITY ?auto_6897 ?auto_6902 ) ( not ( = ?auto_6897 ?auto_6901 ) ) ( OBJ-AT ?auto_6899 ?auto_6897 ) ( not ( = ?auto_6899 ?auto_6898 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6899 ?auto_6898 ?auto_6897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6911 - OBJ
      ?auto_6912 - OBJ
      ?auto_6913 - OBJ
      ?auto_6910 - LOCATION
    )
    :vars
    (
      ?auto_6914 - TRUCK
      ?auto_6915 - LOCATION
      ?auto_6916 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6913 ?auto_6914 ) ( TRUCK-AT ?auto_6914 ?auto_6915 ) ( IN-CITY ?auto_6915 ?auto_6916 ) ( IN-CITY ?auto_6910 ?auto_6916 ) ( not ( = ?auto_6910 ?auto_6915 ) ) ( OBJ-AT ?auto_6912 ?auto_6910 ) ( not ( = ?auto_6912 ?auto_6913 ) ) ( OBJ-AT ?auto_6911 ?auto_6910 ) ( not ( = ?auto_6911 ?auto_6912 ) ) ( not ( = ?auto_6911 ?auto_6913 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6912 ?auto_6913 ?auto_6910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6918 - OBJ
      ?auto_6919 - OBJ
      ?auto_6920 - OBJ
      ?auto_6917 - LOCATION
    )
    :vars
    (
      ?auto_6921 - TRUCK
      ?auto_6922 - LOCATION
      ?auto_6923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6919 ?auto_6921 ) ( TRUCK-AT ?auto_6921 ?auto_6922 ) ( IN-CITY ?auto_6922 ?auto_6923 ) ( IN-CITY ?auto_6917 ?auto_6923 ) ( not ( = ?auto_6917 ?auto_6922 ) ) ( OBJ-AT ?auto_6920 ?auto_6917 ) ( not ( = ?auto_6920 ?auto_6919 ) ) ( OBJ-AT ?auto_6918 ?auto_6917 ) ( not ( = ?auto_6918 ?auto_6919 ) ) ( not ( = ?auto_6918 ?auto_6920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6920 ?auto_6919 ?auto_6917 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6932 - OBJ
      ?auto_6933 - OBJ
      ?auto_6934 - OBJ
      ?auto_6931 - LOCATION
    )
    :vars
    (
      ?auto_6935 - TRUCK
      ?auto_6936 - LOCATION
      ?auto_6937 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6932 ?auto_6935 ) ( TRUCK-AT ?auto_6935 ?auto_6936 ) ( IN-CITY ?auto_6936 ?auto_6937 ) ( IN-CITY ?auto_6931 ?auto_6937 ) ( not ( = ?auto_6931 ?auto_6936 ) ) ( OBJ-AT ?auto_6933 ?auto_6931 ) ( not ( = ?auto_6933 ?auto_6932 ) ) ( OBJ-AT ?auto_6934 ?auto_6931 ) ( not ( = ?auto_6932 ?auto_6934 ) ) ( not ( = ?auto_6933 ?auto_6934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6933 ?auto_6932 ?auto_6931 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6961 - OBJ
      ?auto_6960 - LOCATION
    )
    :vars
    (
      ?auto_6962 - TRUCK
      ?auto_6963 - LOCATION
      ?auto_6964 - CITY
      ?auto_6965 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6962 ?auto_6963 ) ( IN-CITY ?auto_6963 ?auto_6964 ) ( IN-CITY ?auto_6960 ?auto_6964 ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( OBJ-AT ?auto_6965 ?auto_6960 ) ( not ( = ?auto_6965 ?auto_6961 ) ) ( OBJ-AT ?auto_6961 ?auto_6963 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6961 ?auto_6962 ?auto_6963 )
      ( DELIVER-2PKG ?auto_6965 ?auto_6961 ?auto_6960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6967 - OBJ
      ?auto_6968 - OBJ
      ?auto_6966 - LOCATION
    )
    :vars
    (
      ?auto_6970 - TRUCK
      ?auto_6969 - LOCATION
      ?auto_6971 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6970 ?auto_6969 ) ( IN-CITY ?auto_6969 ?auto_6971 ) ( IN-CITY ?auto_6966 ?auto_6971 ) ( not ( = ?auto_6966 ?auto_6969 ) ) ( OBJ-AT ?auto_6967 ?auto_6966 ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( OBJ-AT ?auto_6968 ?auto_6969 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6968 ?auto_6966 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6973 - OBJ
      ?auto_6974 - OBJ
      ?auto_6972 - LOCATION
    )
    :vars
    (
      ?auto_6977 - TRUCK
      ?auto_6976 - LOCATION
      ?auto_6975 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6977 ?auto_6976 ) ( IN-CITY ?auto_6976 ?auto_6975 ) ( IN-CITY ?auto_6972 ?auto_6975 ) ( not ( = ?auto_6972 ?auto_6976 ) ) ( OBJ-AT ?auto_6974 ?auto_6972 ) ( not ( = ?auto_6974 ?auto_6973 ) ) ( OBJ-AT ?auto_6973 ?auto_6976 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6974 ?auto_6973 ?auto_6972 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6986 - OBJ
      ?auto_6987 - OBJ
      ?auto_6988 - OBJ
      ?auto_6985 - LOCATION
    )
    :vars
    (
      ?auto_6991 - TRUCK
      ?auto_6990 - LOCATION
      ?auto_6989 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6991 ?auto_6990 ) ( IN-CITY ?auto_6990 ?auto_6989 ) ( IN-CITY ?auto_6985 ?auto_6989 ) ( not ( = ?auto_6985 ?auto_6990 ) ) ( OBJ-AT ?auto_6987 ?auto_6985 ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( OBJ-AT ?auto_6988 ?auto_6990 ) ( OBJ-AT ?auto_6986 ?auto_6985 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_6988 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6987 ?auto_6988 ?auto_6985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6993 - OBJ
      ?auto_6994 - OBJ
      ?auto_6995 - OBJ
      ?auto_6992 - LOCATION
    )
    :vars
    (
      ?auto_6998 - TRUCK
      ?auto_6997 - LOCATION
      ?auto_6996 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6998 ?auto_6997 ) ( IN-CITY ?auto_6997 ?auto_6996 ) ( IN-CITY ?auto_6992 ?auto_6996 ) ( not ( = ?auto_6992 ?auto_6997 ) ) ( OBJ-AT ?auto_6995 ?auto_6992 ) ( not ( = ?auto_6995 ?auto_6994 ) ) ( OBJ-AT ?auto_6994 ?auto_6997 ) ( OBJ-AT ?auto_6993 ?auto_6992 ) ( not ( = ?auto_6993 ?auto_6994 ) ) ( not ( = ?auto_6993 ?auto_6995 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6995 ?auto_6994 ?auto_6992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7007 - OBJ
      ?auto_7008 - OBJ
      ?auto_7009 - OBJ
      ?auto_7006 - LOCATION
    )
    :vars
    (
      ?auto_7012 - TRUCK
      ?auto_7011 - LOCATION
      ?auto_7010 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7012 ?auto_7011 ) ( IN-CITY ?auto_7011 ?auto_7010 ) ( IN-CITY ?auto_7006 ?auto_7010 ) ( not ( = ?auto_7006 ?auto_7011 ) ) ( OBJ-AT ?auto_7008 ?auto_7006 ) ( not ( = ?auto_7008 ?auto_7007 ) ) ( OBJ-AT ?auto_7007 ?auto_7011 ) ( OBJ-AT ?auto_7009 ?auto_7006 ) ( not ( = ?auto_7007 ?auto_7009 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7008 ?auto_7007 ?auto_7006 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7036 - OBJ
      ?auto_7035 - LOCATION
    )
    :vars
    (
      ?auto_7039 - LOCATION
      ?auto_7038 - CITY
      ?auto_7037 - OBJ
      ?auto_7040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7039 ?auto_7038 ) ( IN-CITY ?auto_7035 ?auto_7038 ) ( not ( = ?auto_7035 ?auto_7039 ) ) ( OBJ-AT ?auto_7037 ?auto_7035 ) ( not ( = ?auto_7037 ?auto_7036 ) ) ( OBJ-AT ?auto_7036 ?auto_7039 ) ( TRUCK-AT ?auto_7040 ?auto_7035 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7040 ?auto_7035 ?auto_7039 ?auto_7038 )
      ( DELIVER-2PKG ?auto_7037 ?auto_7036 ?auto_7035 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7042 - OBJ
      ?auto_7043 - OBJ
      ?auto_7041 - LOCATION
    )
    :vars
    (
      ?auto_7046 - LOCATION
      ?auto_7044 - CITY
      ?auto_7045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7046 ?auto_7044 ) ( IN-CITY ?auto_7041 ?auto_7044 ) ( not ( = ?auto_7041 ?auto_7046 ) ) ( OBJ-AT ?auto_7042 ?auto_7041 ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( OBJ-AT ?auto_7043 ?auto_7046 ) ( TRUCK-AT ?auto_7045 ?auto_7041 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7043 ?auto_7041 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7048 - OBJ
      ?auto_7049 - OBJ
      ?auto_7047 - LOCATION
    )
    :vars
    (
      ?auto_7051 - LOCATION
      ?auto_7052 - CITY
      ?auto_7050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7051 ?auto_7052 ) ( IN-CITY ?auto_7047 ?auto_7052 ) ( not ( = ?auto_7047 ?auto_7051 ) ) ( OBJ-AT ?auto_7049 ?auto_7047 ) ( not ( = ?auto_7049 ?auto_7048 ) ) ( OBJ-AT ?auto_7048 ?auto_7051 ) ( TRUCK-AT ?auto_7050 ?auto_7047 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7049 ?auto_7048 ?auto_7047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7061 - OBJ
      ?auto_7062 - OBJ
      ?auto_7063 - OBJ
      ?auto_7060 - LOCATION
    )
    :vars
    (
      ?auto_7065 - LOCATION
      ?auto_7066 - CITY
      ?auto_7064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7065 ?auto_7066 ) ( IN-CITY ?auto_7060 ?auto_7066 ) ( not ( = ?auto_7060 ?auto_7065 ) ) ( OBJ-AT ?auto_7062 ?auto_7060 ) ( not ( = ?auto_7062 ?auto_7063 ) ) ( OBJ-AT ?auto_7063 ?auto_7065 ) ( TRUCK-AT ?auto_7064 ?auto_7060 ) ( OBJ-AT ?auto_7061 ?auto_7060 ) ( not ( = ?auto_7061 ?auto_7062 ) ) ( not ( = ?auto_7061 ?auto_7063 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7062 ?auto_7063 ?auto_7060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7068 - OBJ
      ?auto_7069 - OBJ
      ?auto_7070 - OBJ
      ?auto_7067 - LOCATION
    )
    :vars
    (
      ?auto_7072 - LOCATION
      ?auto_7073 - CITY
      ?auto_7071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7072 ?auto_7073 ) ( IN-CITY ?auto_7067 ?auto_7073 ) ( not ( = ?auto_7067 ?auto_7072 ) ) ( OBJ-AT ?auto_7068 ?auto_7067 ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( OBJ-AT ?auto_7069 ?auto_7072 ) ( TRUCK-AT ?auto_7071 ?auto_7067 ) ( OBJ-AT ?auto_7070 ?auto_7067 ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( not ( = ?auto_7069 ?auto_7070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7068 ?auto_7069 ?auto_7067 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7082 - OBJ
      ?auto_7083 - OBJ
      ?auto_7084 - OBJ
      ?auto_7081 - LOCATION
    )
    :vars
    (
      ?auto_7086 - LOCATION
      ?auto_7087 - CITY
      ?auto_7085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7086 ?auto_7087 ) ( IN-CITY ?auto_7081 ?auto_7087 ) ( not ( = ?auto_7081 ?auto_7086 ) ) ( OBJ-AT ?auto_7083 ?auto_7081 ) ( not ( = ?auto_7083 ?auto_7082 ) ) ( OBJ-AT ?auto_7082 ?auto_7086 ) ( TRUCK-AT ?auto_7085 ?auto_7081 ) ( OBJ-AT ?auto_7084 ?auto_7081 ) ( not ( = ?auto_7082 ?auto_7084 ) ) ( not ( = ?auto_7083 ?auto_7084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7083 ?auto_7082 ?auto_7081 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7111 - OBJ
      ?auto_7110 - LOCATION
    )
    :vars
    (
      ?auto_7114 - LOCATION
      ?auto_7115 - CITY
      ?auto_7113 - OBJ
      ?auto_7112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7114 ?auto_7115 ) ( IN-CITY ?auto_7110 ?auto_7115 ) ( not ( = ?auto_7110 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7111 ) ) ( OBJ-AT ?auto_7111 ?auto_7114 ) ( TRUCK-AT ?auto_7112 ?auto_7110 ) ( IN-TRUCK ?auto_7113 ?auto_7112 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7113 ?auto_7110 )
      ( DELIVER-2PKG ?auto_7113 ?auto_7111 ?auto_7110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7117 - OBJ
      ?auto_7118 - OBJ
      ?auto_7116 - LOCATION
    )
    :vars
    (
      ?auto_7119 - LOCATION
      ?auto_7120 - CITY
      ?auto_7121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7119 ?auto_7120 ) ( IN-CITY ?auto_7116 ?auto_7120 ) ( not ( = ?auto_7116 ?auto_7119 ) ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( OBJ-AT ?auto_7118 ?auto_7119 ) ( TRUCK-AT ?auto_7121 ?auto_7116 ) ( IN-TRUCK ?auto_7117 ?auto_7121 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7118 ?auto_7116 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7123 - OBJ
      ?auto_7124 - OBJ
      ?auto_7122 - LOCATION
    )
    :vars
    (
      ?auto_7125 - LOCATION
      ?auto_7127 - CITY
      ?auto_7126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7125 ?auto_7127 ) ( IN-CITY ?auto_7122 ?auto_7127 ) ( not ( = ?auto_7122 ?auto_7125 ) ) ( not ( = ?auto_7124 ?auto_7123 ) ) ( OBJ-AT ?auto_7123 ?auto_7125 ) ( TRUCK-AT ?auto_7126 ?auto_7122 ) ( IN-TRUCK ?auto_7124 ?auto_7126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7124 ?auto_7123 ?auto_7122 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7186 - OBJ
      ?auto_7185 - LOCATION
    )
    :vars
    (
      ?auto_7187 - LOCATION
      ?auto_7189 - CITY
      ?auto_7190 - OBJ
      ?auto_7188 - TRUCK
      ?auto_7191 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7187 ?auto_7189 ) ( IN-CITY ?auto_7185 ?auto_7189 ) ( not ( = ?auto_7185 ?auto_7187 ) ) ( not ( = ?auto_7190 ?auto_7186 ) ) ( OBJ-AT ?auto_7186 ?auto_7187 ) ( IN-TRUCK ?auto_7190 ?auto_7188 ) ( TRUCK-AT ?auto_7188 ?auto_7191 ) ( IN-CITY ?auto_7191 ?auto_7189 ) ( not ( = ?auto_7185 ?auto_7191 ) ) ( not ( = ?auto_7187 ?auto_7191 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7188 ?auto_7191 ?auto_7185 ?auto_7189 )
      ( DELIVER-2PKG ?auto_7190 ?auto_7186 ?auto_7185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7193 - OBJ
      ?auto_7194 - OBJ
      ?auto_7192 - LOCATION
    )
    :vars
    (
      ?auto_7196 - LOCATION
      ?auto_7198 - CITY
      ?auto_7197 - TRUCK
      ?auto_7195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7196 ?auto_7198 ) ( IN-CITY ?auto_7192 ?auto_7198 ) ( not ( = ?auto_7192 ?auto_7196 ) ) ( not ( = ?auto_7193 ?auto_7194 ) ) ( OBJ-AT ?auto_7194 ?auto_7196 ) ( IN-TRUCK ?auto_7193 ?auto_7197 ) ( TRUCK-AT ?auto_7197 ?auto_7195 ) ( IN-CITY ?auto_7195 ?auto_7198 ) ( not ( = ?auto_7192 ?auto_7195 ) ) ( not ( = ?auto_7196 ?auto_7195 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7194 ?auto_7192 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7200 - OBJ
      ?auto_7201 - OBJ
      ?auto_7199 - LOCATION
    )
    :vars
    (
      ?auto_7204 - LOCATION
      ?auto_7203 - CITY
      ?auto_7205 - TRUCK
      ?auto_7202 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7204 ?auto_7203 ) ( IN-CITY ?auto_7199 ?auto_7203 ) ( not ( = ?auto_7199 ?auto_7204 ) ) ( not ( = ?auto_7201 ?auto_7200 ) ) ( OBJ-AT ?auto_7200 ?auto_7204 ) ( IN-TRUCK ?auto_7201 ?auto_7205 ) ( TRUCK-AT ?auto_7205 ?auto_7202 ) ( IN-CITY ?auto_7202 ?auto_7203 ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7204 ?auto_7202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7201 ?auto_7200 ?auto_7199 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7272 - OBJ
      ?auto_7271 - LOCATION
    )
    :vars
    (
      ?auto_7276 - LOCATION
      ?auto_7275 - CITY
      ?auto_7273 - OBJ
      ?auto_7277 - TRUCK
      ?auto_7274 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7276 ?auto_7275 ) ( IN-CITY ?auto_7271 ?auto_7275 ) ( not ( = ?auto_7271 ?auto_7276 ) ) ( not ( = ?auto_7273 ?auto_7272 ) ) ( OBJ-AT ?auto_7272 ?auto_7276 ) ( TRUCK-AT ?auto_7277 ?auto_7274 ) ( IN-CITY ?auto_7274 ?auto_7275 ) ( not ( = ?auto_7271 ?auto_7274 ) ) ( not ( = ?auto_7276 ?auto_7274 ) ) ( OBJ-AT ?auto_7273 ?auto_7274 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7273 ?auto_7277 ?auto_7274 )
      ( DELIVER-2PKG ?auto_7273 ?auto_7272 ?auto_7271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7279 - OBJ
      ?auto_7280 - OBJ
      ?auto_7278 - LOCATION
    )
    :vars
    (
      ?auto_7284 - LOCATION
      ?auto_7281 - CITY
      ?auto_7282 - TRUCK
      ?auto_7283 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7284 ?auto_7281 ) ( IN-CITY ?auto_7278 ?auto_7281 ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( OBJ-AT ?auto_7280 ?auto_7284 ) ( TRUCK-AT ?auto_7282 ?auto_7283 ) ( IN-CITY ?auto_7283 ?auto_7281 ) ( not ( = ?auto_7278 ?auto_7283 ) ) ( not ( = ?auto_7284 ?auto_7283 ) ) ( OBJ-AT ?auto_7279 ?auto_7283 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7280 ?auto_7278 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7286 - OBJ
      ?auto_7287 - OBJ
      ?auto_7285 - LOCATION
    )
    :vars
    (
      ?auto_7290 - LOCATION
      ?auto_7291 - CITY
      ?auto_7289 - TRUCK
      ?auto_7288 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7290 ?auto_7291 ) ( IN-CITY ?auto_7285 ?auto_7291 ) ( not ( = ?auto_7285 ?auto_7290 ) ) ( not ( = ?auto_7287 ?auto_7286 ) ) ( OBJ-AT ?auto_7286 ?auto_7290 ) ( TRUCK-AT ?auto_7289 ?auto_7288 ) ( IN-CITY ?auto_7288 ?auto_7291 ) ( not ( = ?auto_7285 ?auto_7288 ) ) ( not ( = ?auto_7290 ?auto_7288 ) ) ( OBJ-AT ?auto_7287 ?auto_7288 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7287 ?auto_7286 ?auto_7285 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7660 - OBJ
      ?auto_7661 - OBJ
      ?auto_7662 - OBJ
      ?auto_7659 - LOCATION
    )
    :vars
    (
      ?auto_7664 - TRUCK
      ?auto_7665 - LOCATION
      ?auto_7663 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7662 ?auto_7664 ) ( TRUCK-AT ?auto_7664 ?auto_7665 ) ( IN-CITY ?auto_7665 ?auto_7663 ) ( IN-CITY ?auto_7659 ?auto_7663 ) ( not ( = ?auto_7659 ?auto_7665 ) ) ( OBJ-AT ?auto_7660 ?auto_7659 ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( OBJ-AT ?auto_7661 ?auto_7659 ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7661 ?auto_7662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7660 ?auto_7662 ?auto_7659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7671 - OBJ
      ?auto_7672 - OBJ
      ?auto_7673 - OBJ
      ?auto_7670 - LOCATION
    )
    :vars
    (
      ?auto_7675 - TRUCK
      ?auto_7676 - LOCATION
      ?auto_7674 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7672 ?auto_7675 ) ( TRUCK-AT ?auto_7675 ?auto_7676 ) ( IN-CITY ?auto_7676 ?auto_7674 ) ( IN-CITY ?auto_7670 ?auto_7674 ) ( not ( = ?auto_7670 ?auto_7676 ) ) ( OBJ-AT ?auto_7671 ?auto_7670 ) ( not ( = ?auto_7671 ?auto_7672 ) ) ( OBJ-AT ?auto_7673 ?auto_7670 ) ( not ( = ?auto_7671 ?auto_7673 ) ) ( not ( = ?auto_7672 ?auto_7673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7671 ?auto_7672 ?auto_7670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7693 - OBJ
      ?auto_7694 - OBJ
      ?auto_7695 - OBJ
      ?auto_7692 - LOCATION
    )
    :vars
    (
      ?auto_7697 - TRUCK
      ?auto_7699 - LOCATION
      ?auto_7696 - CITY
      ?auto_7698 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7695 ?auto_7697 ) ( TRUCK-AT ?auto_7697 ?auto_7699 ) ( IN-CITY ?auto_7699 ?auto_7696 ) ( IN-CITY ?auto_7692 ?auto_7696 ) ( not ( = ?auto_7692 ?auto_7699 ) ) ( OBJ-AT ?auto_7698 ?auto_7692 ) ( not ( = ?auto_7698 ?auto_7695 ) ) ( OBJ-AT ?auto_7693 ?auto_7692 ) ( OBJ-AT ?auto_7694 ?auto_7692 ) ( not ( = ?auto_7693 ?auto_7694 ) ) ( not ( = ?auto_7693 ?auto_7695 ) ) ( not ( = ?auto_7693 ?auto_7698 ) ) ( not ( = ?auto_7694 ?auto_7695 ) ) ( not ( = ?auto_7694 ?auto_7698 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7698 ?auto_7695 ?auto_7692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7705 - OBJ
      ?auto_7706 - OBJ
      ?auto_7707 - OBJ
      ?auto_7704 - LOCATION
    )
    :vars
    (
      ?auto_7709 - TRUCK
      ?auto_7711 - LOCATION
      ?auto_7708 - CITY
      ?auto_7710 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7706 ?auto_7709 ) ( TRUCK-AT ?auto_7709 ?auto_7711 ) ( IN-CITY ?auto_7711 ?auto_7708 ) ( IN-CITY ?auto_7704 ?auto_7708 ) ( not ( = ?auto_7704 ?auto_7711 ) ) ( OBJ-AT ?auto_7710 ?auto_7704 ) ( not ( = ?auto_7710 ?auto_7706 ) ) ( OBJ-AT ?auto_7705 ?auto_7704 ) ( OBJ-AT ?auto_7707 ?auto_7704 ) ( not ( = ?auto_7705 ?auto_7706 ) ) ( not ( = ?auto_7705 ?auto_7707 ) ) ( not ( = ?auto_7705 ?auto_7710 ) ) ( not ( = ?auto_7706 ?auto_7707 ) ) ( not ( = ?auto_7707 ?auto_7710 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7710 ?auto_7706 ?auto_7704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7721 - OBJ
      ?auto_7722 - OBJ
      ?auto_7723 - OBJ
      ?auto_7720 - LOCATION
    )
    :vars
    (
      ?auto_7725 - TRUCK
      ?auto_7726 - LOCATION
      ?auto_7724 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7721 ?auto_7725 ) ( TRUCK-AT ?auto_7725 ?auto_7726 ) ( IN-CITY ?auto_7726 ?auto_7724 ) ( IN-CITY ?auto_7720 ?auto_7724 ) ( not ( = ?auto_7720 ?auto_7726 ) ) ( OBJ-AT ?auto_7723 ?auto_7720 ) ( not ( = ?auto_7723 ?auto_7721 ) ) ( OBJ-AT ?auto_7722 ?auto_7720 ) ( not ( = ?auto_7721 ?auto_7722 ) ) ( not ( = ?auto_7722 ?auto_7723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7723 ?auto_7721 ?auto_7720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7743 - OBJ
      ?auto_7744 - OBJ
      ?auto_7745 - OBJ
      ?auto_7742 - LOCATION
    )
    :vars
    (
      ?auto_7747 - TRUCK
      ?auto_7749 - LOCATION
      ?auto_7746 - CITY
      ?auto_7748 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7743 ?auto_7747 ) ( TRUCK-AT ?auto_7747 ?auto_7749 ) ( IN-CITY ?auto_7749 ?auto_7746 ) ( IN-CITY ?auto_7742 ?auto_7746 ) ( not ( = ?auto_7742 ?auto_7749 ) ) ( OBJ-AT ?auto_7748 ?auto_7742 ) ( not ( = ?auto_7748 ?auto_7743 ) ) ( OBJ-AT ?auto_7744 ?auto_7742 ) ( OBJ-AT ?auto_7745 ?auto_7742 ) ( not ( = ?auto_7743 ?auto_7744 ) ) ( not ( = ?auto_7743 ?auto_7745 ) ) ( not ( = ?auto_7744 ?auto_7745 ) ) ( not ( = ?auto_7744 ?auto_7748 ) ) ( not ( = ?auto_7745 ?auto_7748 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7748 ?auto_7743 ?auto_7742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7813 - OBJ
      ?auto_7814 - OBJ
      ?auto_7815 - OBJ
      ?auto_7812 - LOCATION
    )
    :vars
    (
      ?auto_7818 - TRUCK
      ?auto_7817 - LOCATION
      ?auto_7816 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7818 ?auto_7817 ) ( IN-CITY ?auto_7817 ?auto_7816 ) ( IN-CITY ?auto_7812 ?auto_7816 ) ( not ( = ?auto_7812 ?auto_7817 ) ) ( OBJ-AT ?auto_7813 ?auto_7812 ) ( not ( = ?auto_7813 ?auto_7815 ) ) ( OBJ-AT ?auto_7815 ?auto_7817 ) ( OBJ-AT ?auto_7814 ?auto_7812 ) ( not ( = ?auto_7813 ?auto_7814 ) ) ( not ( = ?auto_7814 ?auto_7815 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7813 ?auto_7815 ?auto_7812 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7846 - OBJ
      ?auto_7847 - OBJ
      ?auto_7848 - OBJ
      ?auto_7845 - LOCATION
    )
    :vars
    (
      ?auto_7851 - TRUCK
      ?auto_7850 - LOCATION
      ?auto_7849 - CITY
      ?auto_7852 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7851 ?auto_7850 ) ( IN-CITY ?auto_7850 ?auto_7849 ) ( IN-CITY ?auto_7845 ?auto_7849 ) ( not ( = ?auto_7845 ?auto_7850 ) ) ( OBJ-AT ?auto_7852 ?auto_7845 ) ( not ( = ?auto_7852 ?auto_7848 ) ) ( OBJ-AT ?auto_7848 ?auto_7850 ) ( OBJ-AT ?auto_7846 ?auto_7845 ) ( OBJ-AT ?auto_7847 ?auto_7845 ) ( not ( = ?auto_7846 ?auto_7847 ) ) ( not ( = ?auto_7846 ?auto_7848 ) ) ( not ( = ?auto_7846 ?auto_7852 ) ) ( not ( = ?auto_7847 ?auto_7848 ) ) ( not ( = ?auto_7847 ?auto_7852 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7852 ?auto_7848 ?auto_7845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7858 - OBJ
      ?auto_7859 - OBJ
      ?auto_7860 - OBJ
      ?auto_7857 - LOCATION
    )
    :vars
    (
      ?auto_7863 - TRUCK
      ?auto_7862 - LOCATION
      ?auto_7861 - CITY
      ?auto_7864 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7863 ?auto_7862 ) ( IN-CITY ?auto_7862 ?auto_7861 ) ( IN-CITY ?auto_7857 ?auto_7861 ) ( not ( = ?auto_7857 ?auto_7862 ) ) ( OBJ-AT ?auto_7864 ?auto_7857 ) ( not ( = ?auto_7864 ?auto_7859 ) ) ( OBJ-AT ?auto_7859 ?auto_7862 ) ( OBJ-AT ?auto_7858 ?auto_7857 ) ( OBJ-AT ?auto_7860 ?auto_7857 ) ( not ( = ?auto_7858 ?auto_7859 ) ) ( not ( = ?auto_7858 ?auto_7860 ) ) ( not ( = ?auto_7858 ?auto_7864 ) ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( not ( = ?auto_7860 ?auto_7864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7864 ?auto_7859 ?auto_7857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7896 - OBJ
      ?auto_7897 - OBJ
      ?auto_7898 - OBJ
      ?auto_7895 - LOCATION
    )
    :vars
    (
      ?auto_7901 - TRUCK
      ?auto_7900 - LOCATION
      ?auto_7899 - CITY
      ?auto_7902 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7901 ?auto_7900 ) ( IN-CITY ?auto_7900 ?auto_7899 ) ( IN-CITY ?auto_7895 ?auto_7899 ) ( not ( = ?auto_7895 ?auto_7900 ) ) ( OBJ-AT ?auto_7902 ?auto_7895 ) ( not ( = ?auto_7902 ?auto_7896 ) ) ( OBJ-AT ?auto_7896 ?auto_7900 ) ( OBJ-AT ?auto_7897 ?auto_7895 ) ( OBJ-AT ?auto_7898 ?auto_7895 ) ( not ( = ?auto_7896 ?auto_7897 ) ) ( not ( = ?auto_7896 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7902 ) ) ( not ( = ?auto_7898 ?auto_7902 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7902 ?auto_7896 ?auto_7895 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7977 - OBJ
      ?auto_7978 - OBJ
      ?auto_7979 - OBJ
      ?auto_7976 - LOCATION
    )
    :vars
    (
      ?auto_7980 - LOCATION
      ?auto_7981 - CITY
      ?auto_7982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7980 ?auto_7981 ) ( IN-CITY ?auto_7976 ?auto_7981 ) ( not ( = ?auto_7976 ?auto_7980 ) ) ( OBJ-AT ?auto_7979 ?auto_7976 ) ( not ( = ?auto_7979 ?auto_7978 ) ) ( OBJ-AT ?auto_7978 ?auto_7980 ) ( TRUCK-AT ?auto_7982 ?auto_7976 ) ( OBJ-AT ?auto_7977 ?auto_7976 ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7979 ?auto_7978 ?auto_7976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7999 - OBJ
      ?auto_8000 - OBJ
      ?auto_8001 - OBJ
      ?auto_7998 - LOCATION
    )
    :vars
    (
      ?auto_8002 - LOCATION
      ?auto_8003 - CITY
      ?auto_8005 - OBJ
      ?auto_8004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8002 ?auto_8003 ) ( IN-CITY ?auto_7998 ?auto_8003 ) ( not ( = ?auto_7998 ?auto_8002 ) ) ( OBJ-AT ?auto_8005 ?auto_7998 ) ( not ( = ?auto_8005 ?auto_8001 ) ) ( OBJ-AT ?auto_8001 ?auto_8002 ) ( TRUCK-AT ?auto_8004 ?auto_7998 ) ( OBJ-AT ?auto_7999 ?auto_7998 ) ( OBJ-AT ?auto_8000 ?auto_7998 ) ( not ( = ?auto_7999 ?auto_8000 ) ) ( not ( = ?auto_7999 ?auto_8001 ) ) ( not ( = ?auto_7999 ?auto_8005 ) ) ( not ( = ?auto_8000 ?auto_8001 ) ) ( not ( = ?auto_8000 ?auto_8005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8005 ?auto_8001 ?auto_7998 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8011 - OBJ
      ?auto_8012 - OBJ
      ?auto_8013 - OBJ
      ?auto_8010 - LOCATION
    )
    :vars
    (
      ?auto_8014 - LOCATION
      ?auto_8015 - CITY
      ?auto_8017 - OBJ
      ?auto_8016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8014 ?auto_8015 ) ( IN-CITY ?auto_8010 ?auto_8015 ) ( not ( = ?auto_8010 ?auto_8014 ) ) ( OBJ-AT ?auto_8017 ?auto_8010 ) ( not ( = ?auto_8017 ?auto_8012 ) ) ( OBJ-AT ?auto_8012 ?auto_8014 ) ( TRUCK-AT ?auto_8016 ?auto_8010 ) ( OBJ-AT ?auto_8011 ?auto_8010 ) ( OBJ-AT ?auto_8013 ?auto_8010 ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( not ( = ?auto_8011 ?auto_8017 ) ) ( not ( = ?auto_8012 ?auto_8013 ) ) ( not ( = ?auto_8013 ?auto_8017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8017 ?auto_8012 ?auto_8010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8027 - OBJ
      ?auto_8028 - OBJ
      ?auto_8029 - OBJ
      ?auto_8026 - LOCATION
    )
    :vars
    (
      ?auto_8030 - LOCATION
      ?auto_8031 - CITY
      ?auto_8032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8030 ?auto_8031 ) ( IN-CITY ?auto_8026 ?auto_8031 ) ( not ( = ?auto_8026 ?auto_8030 ) ) ( OBJ-AT ?auto_8029 ?auto_8026 ) ( not ( = ?auto_8029 ?auto_8027 ) ) ( OBJ-AT ?auto_8027 ?auto_8030 ) ( TRUCK-AT ?auto_8032 ?auto_8026 ) ( OBJ-AT ?auto_8028 ?auto_8026 ) ( not ( = ?auto_8027 ?auto_8028 ) ) ( not ( = ?auto_8028 ?auto_8029 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8029 ?auto_8027 ?auto_8026 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8049 - OBJ
      ?auto_8050 - OBJ
      ?auto_8051 - OBJ
      ?auto_8048 - LOCATION
    )
    :vars
    (
      ?auto_8052 - LOCATION
      ?auto_8053 - CITY
      ?auto_8055 - OBJ
      ?auto_8054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8052 ?auto_8053 ) ( IN-CITY ?auto_8048 ?auto_8053 ) ( not ( = ?auto_8048 ?auto_8052 ) ) ( OBJ-AT ?auto_8055 ?auto_8048 ) ( not ( = ?auto_8055 ?auto_8049 ) ) ( OBJ-AT ?auto_8049 ?auto_8052 ) ( TRUCK-AT ?auto_8054 ?auto_8048 ) ( OBJ-AT ?auto_8050 ?auto_8048 ) ( OBJ-AT ?auto_8051 ?auto_8048 ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8055 ) ) ( not ( = ?auto_8051 ?auto_8055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8055 ?auto_8049 ?auto_8048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8117 - OBJ
      ?auto_8118 - OBJ
      ?auto_8119 - OBJ
      ?auto_8116 - LOCATION
    )
    :vars
    (
      ?auto_8121 - LOCATION
      ?auto_8120 - CITY
      ?auto_8122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8121 ?auto_8120 ) ( IN-CITY ?auto_8116 ?auto_8120 ) ( not ( = ?auto_8116 ?auto_8121 ) ) ( OBJ-AT ?auto_8117 ?auto_8116 ) ( not ( = ?auto_8117 ?auto_8119 ) ) ( OBJ-AT ?auto_8119 ?auto_8121 ) ( TRUCK-AT ?auto_8122 ?auto_8116 ) ( OBJ-AT ?auto_8118 ?auto_8116 ) ( not ( = ?auto_8117 ?auto_8118 ) ) ( not ( = ?auto_8118 ?auto_8119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8117 ?auto_8119 ?auto_8116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8528 - OBJ
      ?auto_8529 - OBJ
      ?auto_8530 - OBJ
      ?auto_8527 - LOCATION
    )
    :vars
    (
      ?auto_8533 - TRUCK
      ?auto_8532 - LOCATION
      ?auto_8531 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8533 ?auto_8532 ) ( IN-CITY ?auto_8532 ?auto_8531 ) ( IN-CITY ?auto_8527 ?auto_8531 ) ( not ( = ?auto_8527 ?auto_8532 ) ) ( OBJ-AT ?auto_8530 ?auto_8527 ) ( not ( = ?auto_8530 ?auto_8528 ) ) ( OBJ-AT ?auto_8528 ?auto_8532 ) ( OBJ-AT ?auto_8529 ?auto_8527 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8529 ?auto_8530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8530 ?auto_8528 ?auto_8527 ) )
  )

)

