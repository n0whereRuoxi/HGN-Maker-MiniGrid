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
      ?auto_6837 - OBJ
      ?auto_6836 - LOCATION
    )
    :vars
    (
      ?auto_6838 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6838 ?auto_6836 ) ( IN-TRUCK ?auto_6837 ?auto_6838 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6837 ?auto_6838 ?auto_6836 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6849 - OBJ
      ?auto_6848 - LOCATION
    )
    :vars
    (
      ?auto_6850 - TRUCK
      ?auto_6851 - LOCATION
      ?auto_6852 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6849 ?auto_6850 ) ( TRUCK-AT ?auto_6850 ?auto_6851 ) ( IN-CITY ?auto_6851 ?auto_6852 ) ( IN-CITY ?auto_6848 ?auto_6852 ) ( not ( = ?auto_6848 ?auto_6851 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6850 ?auto_6851 ?auto_6848 ?auto_6852 )
      ( DELIVER-1PKG ?auto_6849 ?auto_6848 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6867 - OBJ
      ?auto_6866 - LOCATION
    )
    :vars
    (
      ?auto_6868 - TRUCK
      ?auto_6870 - LOCATION
      ?auto_6869 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6868 ?auto_6870 ) ( IN-CITY ?auto_6870 ?auto_6869 ) ( IN-CITY ?auto_6866 ?auto_6869 ) ( not ( = ?auto_6866 ?auto_6870 ) ) ( OBJ-AT ?auto_6867 ?auto_6870 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6867 ?auto_6868 ?auto_6870 )
      ( DELIVER-1PKG ?auto_6867 ?auto_6866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6885 - OBJ
      ?auto_6884 - LOCATION
    )
    :vars
    (
      ?auto_6888 - LOCATION
      ?auto_6887 - CITY
      ?auto_6886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6888 ?auto_6887 ) ( IN-CITY ?auto_6884 ?auto_6887 ) ( not ( = ?auto_6884 ?auto_6888 ) ) ( OBJ-AT ?auto_6885 ?auto_6888 ) ( TRUCK-AT ?auto_6886 ?auto_6884 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6886 ?auto_6884 ?auto_6888 ?auto_6887 )
      ( DELIVER-1PKG ?auto_6885 ?auto_6884 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6945 - OBJ
      ?auto_6946 - OBJ
      ?auto_6944 - LOCATION
    )
    :vars
    (
      ?auto_6947 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6947 ?auto_6944 ) ( IN-TRUCK ?auto_6946 ?auto_6947 ) ( OBJ-AT ?auto_6945 ?auto_6944 ) ( not ( = ?auto_6945 ?auto_6946 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6946 ?auto_6944 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6949 - OBJ
      ?auto_6950 - OBJ
      ?auto_6948 - LOCATION
    )
    :vars
    (
      ?auto_6951 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6951 ?auto_6948 ) ( IN-TRUCK ?auto_6949 ?auto_6951 ) ( OBJ-AT ?auto_6950 ?auto_6948 ) ( not ( = ?auto_6949 ?auto_6950 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6949 ?auto_6948 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6957 - OBJ
      ?auto_6958 - OBJ
      ?auto_6959 - OBJ
      ?auto_6956 - LOCATION
    )
    :vars
    (
      ?auto_6960 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6960 ?auto_6956 ) ( IN-TRUCK ?auto_6959 ?auto_6960 ) ( OBJ-AT ?auto_6957 ?auto_6956 ) ( OBJ-AT ?auto_6958 ?auto_6956 ) ( not ( = ?auto_6957 ?auto_6958 ) ) ( not ( = ?auto_6957 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6959 ?auto_6956 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6962 - OBJ
      ?auto_6963 - OBJ
      ?auto_6964 - OBJ
      ?auto_6961 - LOCATION
    )
    :vars
    (
      ?auto_6965 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6965 ?auto_6961 ) ( IN-TRUCK ?auto_6963 ?auto_6965 ) ( OBJ-AT ?auto_6962 ?auto_6961 ) ( OBJ-AT ?auto_6964 ?auto_6961 ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6963 ?auto_6961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6972 - OBJ
      ?auto_6973 - OBJ
      ?auto_6974 - OBJ
      ?auto_6971 - LOCATION
    )
    :vars
    (
      ?auto_6975 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6975 ?auto_6971 ) ( IN-TRUCK ?auto_6972 ?auto_6975 ) ( OBJ-AT ?auto_6973 ?auto_6971 ) ( OBJ-AT ?auto_6974 ?auto_6971 ) ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6972 ?auto_6974 ) ) ( not ( = ?auto_6973 ?auto_6974 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6972 ?auto_6971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6997 - OBJ
      ?auto_6998 - OBJ
      ?auto_6996 - LOCATION
    )
    :vars
    (
      ?auto_6999 - TRUCK
      ?auto_7000 - LOCATION
      ?auto_7001 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6998 ?auto_6999 ) ( TRUCK-AT ?auto_6999 ?auto_7000 ) ( IN-CITY ?auto_7000 ?auto_7001 ) ( IN-CITY ?auto_6996 ?auto_7001 ) ( not ( = ?auto_6996 ?auto_7000 ) ) ( OBJ-AT ?auto_6997 ?auto_6996 ) ( not ( = ?auto_6997 ?auto_6998 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6998 ?auto_6996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7003 - OBJ
      ?auto_7004 - OBJ
      ?auto_7002 - LOCATION
    )
    :vars
    (
      ?auto_7006 - TRUCK
      ?auto_7007 - LOCATION
      ?auto_7005 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7003 ?auto_7006 ) ( TRUCK-AT ?auto_7006 ?auto_7007 ) ( IN-CITY ?auto_7007 ?auto_7005 ) ( IN-CITY ?auto_7002 ?auto_7005 ) ( not ( = ?auto_7002 ?auto_7007 ) ) ( OBJ-AT ?auto_7004 ?auto_7002 ) ( not ( = ?auto_7004 ?auto_7003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7004 ?auto_7003 ?auto_7002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7016 - OBJ
      ?auto_7017 - OBJ
      ?auto_7018 - OBJ
      ?auto_7015 - LOCATION
    )
    :vars
    (
      ?auto_7020 - TRUCK
      ?auto_7021 - LOCATION
      ?auto_7019 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7018 ?auto_7020 ) ( TRUCK-AT ?auto_7020 ?auto_7021 ) ( IN-CITY ?auto_7021 ?auto_7019 ) ( IN-CITY ?auto_7015 ?auto_7019 ) ( not ( = ?auto_7015 ?auto_7021 ) ) ( OBJ-AT ?auto_7016 ?auto_7015 ) ( not ( = ?auto_7016 ?auto_7018 ) ) ( OBJ-AT ?auto_7017 ?auto_7015 ) ( not ( = ?auto_7016 ?auto_7017 ) ) ( not ( = ?auto_7017 ?auto_7018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7016 ?auto_7018 ?auto_7015 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7023 - OBJ
      ?auto_7024 - OBJ
      ?auto_7025 - OBJ
      ?auto_7022 - LOCATION
    )
    :vars
    (
      ?auto_7027 - TRUCK
      ?auto_7028 - LOCATION
      ?auto_7026 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7024 ?auto_7027 ) ( TRUCK-AT ?auto_7027 ?auto_7028 ) ( IN-CITY ?auto_7028 ?auto_7026 ) ( IN-CITY ?auto_7022 ?auto_7026 ) ( not ( = ?auto_7022 ?auto_7028 ) ) ( OBJ-AT ?auto_7023 ?auto_7022 ) ( not ( = ?auto_7023 ?auto_7024 ) ) ( OBJ-AT ?auto_7025 ?auto_7022 ) ( not ( = ?auto_7023 ?auto_7025 ) ) ( not ( = ?auto_7024 ?auto_7025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7023 ?auto_7024 ?auto_7022 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7037 - OBJ
      ?auto_7038 - OBJ
      ?auto_7039 - OBJ
      ?auto_7036 - LOCATION
    )
    :vars
    (
      ?auto_7041 - TRUCK
      ?auto_7042 - LOCATION
      ?auto_7040 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7037 ?auto_7041 ) ( TRUCK-AT ?auto_7041 ?auto_7042 ) ( IN-CITY ?auto_7042 ?auto_7040 ) ( IN-CITY ?auto_7036 ?auto_7040 ) ( not ( = ?auto_7036 ?auto_7042 ) ) ( OBJ-AT ?auto_7039 ?auto_7036 ) ( not ( = ?auto_7039 ?auto_7037 ) ) ( OBJ-AT ?auto_7038 ?auto_7036 ) ( not ( = ?auto_7037 ?auto_7038 ) ) ( not ( = ?auto_7038 ?auto_7039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7039 ?auto_7037 ?auto_7036 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7066 - OBJ
      ?auto_7065 - LOCATION
    )
    :vars
    (
      ?auto_7068 - TRUCK
      ?auto_7069 - LOCATION
      ?auto_7067 - CITY
      ?auto_7070 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7068 ?auto_7069 ) ( IN-CITY ?auto_7069 ?auto_7067 ) ( IN-CITY ?auto_7065 ?auto_7067 ) ( not ( = ?auto_7065 ?auto_7069 ) ) ( OBJ-AT ?auto_7070 ?auto_7065 ) ( not ( = ?auto_7070 ?auto_7066 ) ) ( OBJ-AT ?auto_7066 ?auto_7069 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7066 ?auto_7068 ?auto_7069 )
      ( DELIVER-2PKG ?auto_7070 ?auto_7066 ?auto_7065 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7072 - OBJ
      ?auto_7073 - OBJ
      ?auto_7071 - LOCATION
    )
    :vars
    (
      ?auto_7075 - TRUCK
      ?auto_7074 - LOCATION
      ?auto_7076 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7075 ?auto_7074 ) ( IN-CITY ?auto_7074 ?auto_7076 ) ( IN-CITY ?auto_7071 ?auto_7076 ) ( not ( = ?auto_7071 ?auto_7074 ) ) ( OBJ-AT ?auto_7072 ?auto_7071 ) ( not ( = ?auto_7072 ?auto_7073 ) ) ( OBJ-AT ?auto_7073 ?auto_7074 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7073 ?auto_7071 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7078 - OBJ
      ?auto_7079 - OBJ
      ?auto_7077 - LOCATION
    )
    :vars
    (
      ?auto_7080 - TRUCK
      ?auto_7082 - LOCATION
      ?auto_7081 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7080 ?auto_7082 ) ( IN-CITY ?auto_7082 ?auto_7081 ) ( IN-CITY ?auto_7077 ?auto_7081 ) ( not ( = ?auto_7077 ?auto_7082 ) ) ( OBJ-AT ?auto_7079 ?auto_7077 ) ( not ( = ?auto_7079 ?auto_7078 ) ) ( OBJ-AT ?auto_7078 ?auto_7082 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7079 ?auto_7078 ?auto_7077 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7091 - OBJ
      ?auto_7092 - OBJ
      ?auto_7093 - OBJ
      ?auto_7090 - LOCATION
    )
    :vars
    (
      ?auto_7094 - TRUCK
      ?auto_7096 - LOCATION
      ?auto_7095 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7094 ?auto_7096 ) ( IN-CITY ?auto_7096 ?auto_7095 ) ( IN-CITY ?auto_7090 ?auto_7095 ) ( not ( = ?auto_7090 ?auto_7096 ) ) ( OBJ-AT ?auto_7092 ?auto_7090 ) ( not ( = ?auto_7092 ?auto_7093 ) ) ( OBJ-AT ?auto_7093 ?auto_7096 ) ( OBJ-AT ?auto_7091 ?auto_7090 ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7093 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7092 ?auto_7093 ?auto_7090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7098 - OBJ
      ?auto_7099 - OBJ
      ?auto_7100 - OBJ
      ?auto_7097 - LOCATION
    )
    :vars
    (
      ?auto_7101 - TRUCK
      ?auto_7103 - LOCATION
      ?auto_7102 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7101 ?auto_7103 ) ( IN-CITY ?auto_7103 ?auto_7102 ) ( IN-CITY ?auto_7097 ?auto_7102 ) ( not ( = ?auto_7097 ?auto_7103 ) ) ( OBJ-AT ?auto_7100 ?auto_7097 ) ( not ( = ?auto_7100 ?auto_7099 ) ) ( OBJ-AT ?auto_7099 ?auto_7103 ) ( OBJ-AT ?auto_7098 ?auto_7097 ) ( not ( = ?auto_7098 ?auto_7099 ) ) ( not ( = ?auto_7098 ?auto_7100 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7100 ?auto_7099 ?auto_7097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7112 - OBJ
      ?auto_7113 - OBJ
      ?auto_7114 - OBJ
      ?auto_7111 - LOCATION
    )
    :vars
    (
      ?auto_7115 - TRUCK
      ?auto_7117 - LOCATION
      ?auto_7116 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7115 ?auto_7117 ) ( IN-CITY ?auto_7117 ?auto_7116 ) ( IN-CITY ?auto_7111 ?auto_7116 ) ( not ( = ?auto_7111 ?auto_7117 ) ) ( OBJ-AT ?auto_7113 ?auto_7111 ) ( not ( = ?auto_7113 ?auto_7112 ) ) ( OBJ-AT ?auto_7112 ?auto_7117 ) ( OBJ-AT ?auto_7114 ?auto_7111 ) ( not ( = ?auto_7112 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7114 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7113 ?auto_7112 ?auto_7111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7141 - OBJ
      ?auto_7140 - LOCATION
    )
    :vars
    (
      ?auto_7144 - LOCATION
      ?auto_7143 - CITY
      ?auto_7145 - OBJ
      ?auto_7142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7144 ?auto_7143 ) ( IN-CITY ?auto_7140 ?auto_7143 ) ( not ( = ?auto_7140 ?auto_7144 ) ) ( OBJ-AT ?auto_7145 ?auto_7140 ) ( not ( = ?auto_7145 ?auto_7141 ) ) ( OBJ-AT ?auto_7141 ?auto_7144 ) ( TRUCK-AT ?auto_7142 ?auto_7140 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7142 ?auto_7140 ?auto_7144 ?auto_7143 )
      ( DELIVER-2PKG ?auto_7145 ?auto_7141 ?auto_7140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7147 - OBJ
      ?auto_7148 - OBJ
      ?auto_7146 - LOCATION
    )
    :vars
    (
      ?auto_7151 - LOCATION
      ?auto_7150 - CITY
      ?auto_7149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7151 ?auto_7150 ) ( IN-CITY ?auto_7146 ?auto_7150 ) ( not ( = ?auto_7146 ?auto_7151 ) ) ( OBJ-AT ?auto_7147 ?auto_7146 ) ( not ( = ?auto_7147 ?auto_7148 ) ) ( OBJ-AT ?auto_7148 ?auto_7151 ) ( TRUCK-AT ?auto_7149 ?auto_7146 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7148 ?auto_7146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7153 - OBJ
      ?auto_7154 - OBJ
      ?auto_7152 - LOCATION
    )
    :vars
    (
      ?auto_7157 - LOCATION
      ?auto_7155 - CITY
      ?auto_7156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7157 ?auto_7155 ) ( IN-CITY ?auto_7152 ?auto_7155 ) ( not ( = ?auto_7152 ?auto_7157 ) ) ( OBJ-AT ?auto_7154 ?auto_7152 ) ( not ( = ?auto_7154 ?auto_7153 ) ) ( OBJ-AT ?auto_7153 ?auto_7157 ) ( TRUCK-AT ?auto_7156 ?auto_7152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7154 ?auto_7153 ?auto_7152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7166 - OBJ
      ?auto_7167 - OBJ
      ?auto_7168 - OBJ
      ?auto_7165 - LOCATION
    )
    :vars
    (
      ?auto_7171 - LOCATION
      ?auto_7169 - CITY
      ?auto_7170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7171 ?auto_7169 ) ( IN-CITY ?auto_7165 ?auto_7169 ) ( not ( = ?auto_7165 ?auto_7171 ) ) ( OBJ-AT ?auto_7167 ?auto_7165 ) ( not ( = ?auto_7167 ?auto_7168 ) ) ( OBJ-AT ?auto_7168 ?auto_7171 ) ( TRUCK-AT ?auto_7170 ?auto_7165 ) ( OBJ-AT ?auto_7166 ?auto_7165 ) ( not ( = ?auto_7166 ?auto_7167 ) ) ( not ( = ?auto_7166 ?auto_7168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7167 ?auto_7168 ?auto_7165 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7173 - OBJ
      ?auto_7174 - OBJ
      ?auto_7175 - OBJ
      ?auto_7172 - LOCATION
    )
    :vars
    (
      ?auto_7178 - LOCATION
      ?auto_7176 - CITY
      ?auto_7177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7178 ?auto_7176 ) ( IN-CITY ?auto_7172 ?auto_7176 ) ( not ( = ?auto_7172 ?auto_7178 ) ) ( OBJ-AT ?auto_7173 ?auto_7172 ) ( not ( = ?auto_7173 ?auto_7174 ) ) ( OBJ-AT ?auto_7174 ?auto_7178 ) ( TRUCK-AT ?auto_7177 ?auto_7172 ) ( OBJ-AT ?auto_7175 ?auto_7172 ) ( not ( = ?auto_7173 ?auto_7175 ) ) ( not ( = ?auto_7174 ?auto_7175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7173 ?auto_7174 ?auto_7172 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7187 - OBJ
      ?auto_7188 - OBJ
      ?auto_7189 - OBJ
      ?auto_7186 - LOCATION
    )
    :vars
    (
      ?auto_7192 - LOCATION
      ?auto_7190 - CITY
      ?auto_7191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7192 ?auto_7190 ) ( IN-CITY ?auto_7186 ?auto_7190 ) ( not ( = ?auto_7186 ?auto_7192 ) ) ( OBJ-AT ?auto_7188 ?auto_7186 ) ( not ( = ?auto_7188 ?auto_7187 ) ) ( OBJ-AT ?auto_7187 ?auto_7192 ) ( TRUCK-AT ?auto_7191 ?auto_7186 ) ( OBJ-AT ?auto_7189 ?auto_7186 ) ( not ( = ?auto_7187 ?auto_7189 ) ) ( not ( = ?auto_7188 ?auto_7189 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7188 ?auto_7187 ?auto_7186 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7216 - OBJ
      ?auto_7215 - LOCATION
    )
    :vars
    (
      ?auto_7220 - LOCATION
      ?auto_7218 - CITY
      ?auto_7217 - OBJ
      ?auto_7219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7220 ?auto_7218 ) ( IN-CITY ?auto_7215 ?auto_7218 ) ( not ( = ?auto_7215 ?auto_7220 ) ) ( not ( = ?auto_7217 ?auto_7216 ) ) ( OBJ-AT ?auto_7216 ?auto_7220 ) ( TRUCK-AT ?auto_7219 ?auto_7215 ) ( IN-TRUCK ?auto_7217 ?auto_7219 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7217 ?auto_7215 )
      ( DELIVER-2PKG ?auto_7217 ?auto_7216 ?auto_7215 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7222 - OBJ
      ?auto_7223 - OBJ
      ?auto_7221 - LOCATION
    )
    :vars
    (
      ?auto_7225 - LOCATION
      ?auto_7224 - CITY
      ?auto_7226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7225 ?auto_7224 ) ( IN-CITY ?auto_7221 ?auto_7224 ) ( not ( = ?auto_7221 ?auto_7225 ) ) ( not ( = ?auto_7222 ?auto_7223 ) ) ( OBJ-AT ?auto_7223 ?auto_7225 ) ( TRUCK-AT ?auto_7226 ?auto_7221 ) ( IN-TRUCK ?auto_7222 ?auto_7226 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7223 ?auto_7221 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7228 - OBJ
      ?auto_7229 - OBJ
      ?auto_7227 - LOCATION
    )
    :vars
    (
      ?auto_7232 - LOCATION
      ?auto_7231 - CITY
      ?auto_7230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7232 ?auto_7231 ) ( IN-CITY ?auto_7227 ?auto_7231 ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7228 ) ) ( OBJ-AT ?auto_7228 ?auto_7232 ) ( TRUCK-AT ?auto_7230 ?auto_7227 ) ( IN-TRUCK ?auto_7229 ?auto_7230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7229 ?auto_7228 ?auto_7227 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7291 - OBJ
      ?auto_7290 - LOCATION
    )
    :vars
    (
      ?auto_7295 - LOCATION
      ?auto_7294 - CITY
      ?auto_7293 - OBJ
      ?auto_7292 - TRUCK
      ?auto_7296 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7295 ?auto_7294 ) ( IN-CITY ?auto_7290 ?auto_7294 ) ( not ( = ?auto_7290 ?auto_7295 ) ) ( not ( = ?auto_7293 ?auto_7291 ) ) ( OBJ-AT ?auto_7291 ?auto_7295 ) ( IN-TRUCK ?auto_7293 ?auto_7292 ) ( TRUCK-AT ?auto_7292 ?auto_7296 ) ( IN-CITY ?auto_7296 ?auto_7294 ) ( not ( = ?auto_7290 ?auto_7296 ) ) ( not ( = ?auto_7295 ?auto_7296 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7292 ?auto_7296 ?auto_7290 ?auto_7294 )
      ( DELIVER-2PKG ?auto_7293 ?auto_7291 ?auto_7290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7298 - OBJ
      ?auto_7299 - OBJ
      ?auto_7297 - LOCATION
    )
    :vars
    (
      ?auto_7300 - LOCATION
      ?auto_7303 - CITY
      ?auto_7301 - TRUCK
      ?auto_7302 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7300 ?auto_7303 ) ( IN-CITY ?auto_7297 ?auto_7303 ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) ( OBJ-AT ?auto_7299 ?auto_7300 ) ( IN-TRUCK ?auto_7298 ?auto_7301 ) ( TRUCK-AT ?auto_7301 ?auto_7302 ) ( IN-CITY ?auto_7302 ?auto_7303 ) ( not ( = ?auto_7297 ?auto_7302 ) ) ( not ( = ?auto_7300 ?auto_7302 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7299 ?auto_7297 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7305 - OBJ
      ?auto_7306 - OBJ
      ?auto_7304 - LOCATION
    )
    :vars
    (
      ?auto_7310 - LOCATION
      ?auto_7307 - CITY
      ?auto_7308 - TRUCK
      ?auto_7309 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7310 ?auto_7307 ) ( IN-CITY ?auto_7304 ?auto_7307 ) ( not ( = ?auto_7304 ?auto_7310 ) ) ( not ( = ?auto_7306 ?auto_7305 ) ) ( OBJ-AT ?auto_7305 ?auto_7310 ) ( IN-TRUCK ?auto_7306 ?auto_7308 ) ( TRUCK-AT ?auto_7308 ?auto_7309 ) ( IN-CITY ?auto_7309 ?auto_7307 ) ( not ( = ?auto_7304 ?auto_7309 ) ) ( not ( = ?auto_7310 ?auto_7309 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7306 ?auto_7305 ?auto_7304 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7377 - OBJ
      ?auto_7376 - LOCATION
    )
    :vars
    (
      ?auto_7382 - LOCATION
      ?auto_7378 - CITY
      ?auto_7379 - OBJ
      ?auto_7380 - TRUCK
      ?auto_7381 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7382 ?auto_7378 ) ( IN-CITY ?auto_7376 ?auto_7378 ) ( not ( = ?auto_7376 ?auto_7382 ) ) ( not ( = ?auto_7379 ?auto_7377 ) ) ( OBJ-AT ?auto_7377 ?auto_7382 ) ( TRUCK-AT ?auto_7380 ?auto_7381 ) ( IN-CITY ?auto_7381 ?auto_7378 ) ( not ( = ?auto_7376 ?auto_7381 ) ) ( not ( = ?auto_7382 ?auto_7381 ) ) ( OBJ-AT ?auto_7379 ?auto_7381 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7379 ?auto_7380 ?auto_7381 )
      ( DELIVER-2PKG ?auto_7379 ?auto_7377 ?auto_7376 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7384 - OBJ
      ?auto_7385 - OBJ
      ?auto_7383 - LOCATION
    )
    :vars
    (
      ?auto_7389 - LOCATION
      ?auto_7388 - CITY
      ?auto_7386 - TRUCK
      ?auto_7387 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7389 ?auto_7388 ) ( IN-CITY ?auto_7383 ?auto_7388 ) ( not ( = ?auto_7383 ?auto_7389 ) ) ( not ( = ?auto_7384 ?auto_7385 ) ) ( OBJ-AT ?auto_7385 ?auto_7389 ) ( TRUCK-AT ?auto_7386 ?auto_7387 ) ( IN-CITY ?auto_7387 ?auto_7388 ) ( not ( = ?auto_7383 ?auto_7387 ) ) ( not ( = ?auto_7389 ?auto_7387 ) ) ( OBJ-AT ?auto_7384 ?auto_7387 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7385 ?auto_7383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7391 - OBJ
      ?auto_7392 - OBJ
      ?auto_7390 - LOCATION
    )
    :vars
    (
      ?auto_7394 - LOCATION
      ?auto_7396 - CITY
      ?auto_7393 - TRUCK
      ?auto_7395 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7394 ?auto_7396 ) ( IN-CITY ?auto_7390 ?auto_7396 ) ( not ( = ?auto_7390 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7391 ) ) ( OBJ-AT ?auto_7391 ?auto_7394 ) ( TRUCK-AT ?auto_7393 ?auto_7395 ) ( IN-CITY ?auto_7395 ?auto_7396 ) ( not ( = ?auto_7390 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( OBJ-AT ?auto_7392 ?auto_7395 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7392 ?auto_7391 ?auto_7390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7776 - OBJ
      ?auto_7777 - OBJ
      ?auto_7778 - OBJ
      ?auto_7775 - LOCATION
    )
    :vars
    (
      ?auto_7780 - TRUCK
      ?auto_7781 - LOCATION
      ?auto_7779 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7777 ?auto_7780 ) ( TRUCK-AT ?auto_7780 ?auto_7781 ) ( IN-CITY ?auto_7781 ?auto_7779 ) ( IN-CITY ?auto_7775 ?auto_7779 ) ( not ( = ?auto_7775 ?auto_7781 ) ) ( OBJ-AT ?auto_7778 ?auto_7775 ) ( not ( = ?auto_7778 ?auto_7777 ) ) ( OBJ-AT ?auto_7776 ?auto_7775 ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7776 ?auto_7778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7778 ?auto_7777 ?auto_7775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7798 - OBJ
      ?auto_7799 - OBJ
      ?auto_7800 - OBJ
      ?auto_7797 - LOCATION
    )
    :vars
    (
      ?auto_7802 - TRUCK
      ?auto_7804 - LOCATION
      ?auto_7801 - CITY
      ?auto_7803 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7800 ?auto_7802 ) ( TRUCK-AT ?auto_7802 ?auto_7804 ) ( IN-CITY ?auto_7804 ?auto_7801 ) ( IN-CITY ?auto_7797 ?auto_7801 ) ( not ( = ?auto_7797 ?auto_7804 ) ) ( OBJ-AT ?auto_7803 ?auto_7797 ) ( not ( = ?auto_7803 ?auto_7800 ) ) ( OBJ-AT ?auto_7798 ?auto_7797 ) ( OBJ-AT ?auto_7799 ?auto_7797 ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7800 ) ) ( not ( = ?auto_7798 ?auto_7803 ) ) ( not ( = ?auto_7799 ?auto_7800 ) ) ( not ( = ?auto_7799 ?auto_7803 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7803 ?auto_7800 ?auto_7797 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7810 - OBJ
      ?auto_7811 - OBJ
      ?auto_7812 - OBJ
      ?auto_7809 - LOCATION
    )
    :vars
    (
      ?auto_7814 - TRUCK
      ?auto_7816 - LOCATION
      ?auto_7813 - CITY
      ?auto_7815 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7811 ?auto_7814 ) ( TRUCK-AT ?auto_7814 ?auto_7816 ) ( IN-CITY ?auto_7816 ?auto_7813 ) ( IN-CITY ?auto_7809 ?auto_7813 ) ( not ( = ?auto_7809 ?auto_7816 ) ) ( OBJ-AT ?auto_7815 ?auto_7809 ) ( not ( = ?auto_7815 ?auto_7811 ) ) ( OBJ-AT ?auto_7810 ?auto_7809 ) ( OBJ-AT ?auto_7812 ?auto_7809 ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7815 ) ) ( not ( = ?auto_7811 ?auto_7812 ) ) ( not ( = ?auto_7812 ?auto_7815 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7815 ?auto_7811 ?auto_7809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7848 - OBJ
      ?auto_7849 - OBJ
      ?auto_7850 - OBJ
      ?auto_7847 - LOCATION
    )
    :vars
    (
      ?auto_7852 - TRUCK
      ?auto_7854 - LOCATION
      ?auto_7851 - CITY
      ?auto_7853 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7848 ?auto_7852 ) ( TRUCK-AT ?auto_7852 ?auto_7854 ) ( IN-CITY ?auto_7854 ?auto_7851 ) ( IN-CITY ?auto_7847 ?auto_7851 ) ( not ( = ?auto_7847 ?auto_7854 ) ) ( OBJ-AT ?auto_7853 ?auto_7847 ) ( not ( = ?auto_7853 ?auto_7848 ) ) ( OBJ-AT ?auto_7849 ?auto_7847 ) ( OBJ-AT ?auto_7850 ?auto_7847 ) ( not ( = ?auto_7848 ?auto_7849 ) ) ( not ( = ?auto_7848 ?auto_7850 ) ) ( not ( = ?auto_7849 ?auto_7850 ) ) ( not ( = ?auto_7849 ?auto_7853 ) ) ( not ( = ?auto_7850 ?auto_7853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7853 ?auto_7848 ?auto_7847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7918 - OBJ
      ?auto_7919 - OBJ
      ?auto_7920 - OBJ
      ?auto_7917 - LOCATION
    )
    :vars
    (
      ?auto_7923 - TRUCK
      ?auto_7922 - LOCATION
      ?auto_7921 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7923 ?auto_7922 ) ( IN-CITY ?auto_7922 ?auto_7921 ) ( IN-CITY ?auto_7917 ?auto_7921 ) ( not ( = ?auto_7917 ?auto_7922 ) ) ( OBJ-AT ?auto_7918 ?auto_7917 ) ( not ( = ?auto_7918 ?auto_7920 ) ) ( OBJ-AT ?auto_7920 ?auto_7922 ) ( OBJ-AT ?auto_7919 ?auto_7917 ) ( not ( = ?auto_7918 ?auto_7919 ) ) ( not ( = ?auto_7919 ?auto_7920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7918 ?auto_7920 ?auto_7917 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7951 - OBJ
      ?auto_7952 - OBJ
      ?auto_7953 - OBJ
      ?auto_7950 - LOCATION
    )
    :vars
    (
      ?auto_7956 - TRUCK
      ?auto_7955 - LOCATION
      ?auto_7954 - CITY
      ?auto_7957 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7956 ?auto_7955 ) ( IN-CITY ?auto_7955 ?auto_7954 ) ( IN-CITY ?auto_7950 ?auto_7954 ) ( not ( = ?auto_7950 ?auto_7955 ) ) ( OBJ-AT ?auto_7957 ?auto_7950 ) ( not ( = ?auto_7957 ?auto_7953 ) ) ( OBJ-AT ?auto_7953 ?auto_7955 ) ( OBJ-AT ?auto_7951 ?auto_7950 ) ( OBJ-AT ?auto_7952 ?auto_7950 ) ( not ( = ?auto_7951 ?auto_7952 ) ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7957 ) ) ( not ( = ?auto_7952 ?auto_7953 ) ) ( not ( = ?auto_7952 ?auto_7957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7957 ?auto_7953 ?auto_7950 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7963 - OBJ
      ?auto_7964 - OBJ
      ?auto_7965 - OBJ
      ?auto_7962 - LOCATION
    )
    :vars
    (
      ?auto_7968 - TRUCK
      ?auto_7967 - LOCATION
      ?auto_7966 - CITY
      ?auto_7969 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7968 ?auto_7967 ) ( IN-CITY ?auto_7967 ?auto_7966 ) ( IN-CITY ?auto_7962 ?auto_7966 ) ( not ( = ?auto_7962 ?auto_7967 ) ) ( OBJ-AT ?auto_7969 ?auto_7962 ) ( not ( = ?auto_7969 ?auto_7964 ) ) ( OBJ-AT ?auto_7964 ?auto_7967 ) ( OBJ-AT ?auto_7963 ?auto_7962 ) ( OBJ-AT ?auto_7965 ?auto_7962 ) ( not ( = ?auto_7963 ?auto_7964 ) ) ( not ( = ?auto_7963 ?auto_7965 ) ) ( not ( = ?auto_7963 ?auto_7969 ) ) ( not ( = ?auto_7964 ?auto_7965 ) ) ( not ( = ?auto_7965 ?auto_7969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7969 ?auto_7964 ?auto_7962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8001 - OBJ
      ?auto_8002 - OBJ
      ?auto_8003 - OBJ
      ?auto_8000 - LOCATION
    )
    :vars
    (
      ?auto_8006 - TRUCK
      ?auto_8005 - LOCATION
      ?auto_8004 - CITY
      ?auto_8007 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8006 ?auto_8005 ) ( IN-CITY ?auto_8005 ?auto_8004 ) ( IN-CITY ?auto_8000 ?auto_8004 ) ( not ( = ?auto_8000 ?auto_8005 ) ) ( OBJ-AT ?auto_8007 ?auto_8000 ) ( not ( = ?auto_8007 ?auto_8001 ) ) ( OBJ-AT ?auto_8001 ?auto_8005 ) ( OBJ-AT ?auto_8002 ?auto_8000 ) ( OBJ-AT ?auto_8003 ?auto_8000 ) ( not ( = ?auto_8001 ?auto_8002 ) ) ( not ( = ?auto_8001 ?auto_8003 ) ) ( not ( = ?auto_8002 ?auto_8003 ) ) ( not ( = ?auto_8002 ?auto_8007 ) ) ( not ( = ?auto_8003 ?auto_8007 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8007 ?auto_8001 ?auto_8000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8082 - OBJ
      ?auto_8083 - OBJ
      ?auto_8084 - OBJ
      ?auto_8081 - LOCATION
    )
    :vars
    (
      ?auto_8086 - LOCATION
      ?auto_8087 - CITY
      ?auto_8085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8086 ?auto_8087 ) ( IN-CITY ?auto_8081 ?auto_8087 ) ( not ( = ?auto_8081 ?auto_8086 ) ) ( OBJ-AT ?auto_8084 ?auto_8081 ) ( not ( = ?auto_8084 ?auto_8083 ) ) ( OBJ-AT ?auto_8083 ?auto_8086 ) ( TRUCK-AT ?auto_8085 ?auto_8081 ) ( OBJ-AT ?auto_8082 ?auto_8081 ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8084 ?auto_8083 ?auto_8081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8104 - OBJ
      ?auto_8105 - OBJ
      ?auto_8106 - OBJ
      ?auto_8103 - LOCATION
    )
    :vars
    (
      ?auto_8108 - LOCATION
      ?auto_8109 - CITY
      ?auto_8110 - OBJ
      ?auto_8107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8108 ?auto_8109 ) ( IN-CITY ?auto_8103 ?auto_8109 ) ( not ( = ?auto_8103 ?auto_8108 ) ) ( OBJ-AT ?auto_8110 ?auto_8103 ) ( not ( = ?auto_8110 ?auto_8106 ) ) ( OBJ-AT ?auto_8106 ?auto_8108 ) ( TRUCK-AT ?auto_8107 ?auto_8103 ) ( OBJ-AT ?auto_8104 ?auto_8103 ) ( OBJ-AT ?auto_8105 ?auto_8103 ) ( not ( = ?auto_8104 ?auto_8105 ) ) ( not ( = ?auto_8104 ?auto_8106 ) ) ( not ( = ?auto_8104 ?auto_8110 ) ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8105 ?auto_8110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8110 ?auto_8106 ?auto_8103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8116 - OBJ
      ?auto_8117 - OBJ
      ?auto_8118 - OBJ
      ?auto_8115 - LOCATION
    )
    :vars
    (
      ?auto_8120 - LOCATION
      ?auto_8121 - CITY
      ?auto_8122 - OBJ
      ?auto_8119 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8120 ?auto_8121 ) ( IN-CITY ?auto_8115 ?auto_8121 ) ( not ( = ?auto_8115 ?auto_8120 ) ) ( OBJ-AT ?auto_8122 ?auto_8115 ) ( not ( = ?auto_8122 ?auto_8117 ) ) ( OBJ-AT ?auto_8117 ?auto_8120 ) ( TRUCK-AT ?auto_8119 ?auto_8115 ) ( OBJ-AT ?auto_8116 ?auto_8115 ) ( OBJ-AT ?auto_8118 ?auto_8115 ) ( not ( = ?auto_8116 ?auto_8117 ) ) ( not ( = ?auto_8116 ?auto_8118 ) ) ( not ( = ?auto_8116 ?auto_8122 ) ) ( not ( = ?auto_8117 ?auto_8118 ) ) ( not ( = ?auto_8118 ?auto_8122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8122 ?auto_8117 ?auto_8115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8132 - OBJ
      ?auto_8133 - OBJ
      ?auto_8134 - OBJ
      ?auto_8131 - LOCATION
    )
    :vars
    (
      ?auto_8136 - LOCATION
      ?auto_8137 - CITY
      ?auto_8135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8136 ?auto_8137 ) ( IN-CITY ?auto_8131 ?auto_8137 ) ( not ( = ?auto_8131 ?auto_8136 ) ) ( OBJ-AT ?auto_8134 ?auto_8131 ) ( not ( = ?auto_8134 ?auto_8132 ) ) ( OBJ-AT ?auto_8132 ?auto_8136 ) ( TRUCK-AT ?auto_8135 ?auto_8131 ) ( OBJ-AT ?auto_8133 ?auto_8131 ) ( not ( = ?auto_8132 ?auto_8133 ) ) ( not ( = ?auto_8133 ?auto_8134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8134 ?auto_8132 ?auto_8131 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8154 - OBJ
      ?auto_8155 - OBJ
      ?auto_8156 - OBJ
      ?auto_8153 - LOCATION
    )
    :vars
    (
      ?auto_8158 - LOCATION
      ?auto_8159 - CITY
      ?auto_8160 - OBJ
      ?auto_8157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8158 ?auto_8159 ) ( IN-CITY ?auto_8153 ?auto_8159 ) ( not ( = ?auto_8153 ?auto_8158 ) ) ( OBJ-AT ?auto_8160 ?auto_8153 ) ( not ( = ?auto_8160 ?auto_8154 ) ) ( OBJ-AT ?auto_8154 ?auto_8158 ) ( TRUCK-AT ?auto_8157 ?auto_8153 ) ( OBJ-AT ?auto_8155 ?auto_8153 ) ( OBJ-AT ?auto_8156 ?auto_8153 ) ( not ( = ?auto_8154 ?auto_8155 ) ) ( not ( = ?auto_8154 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8160 ) ) ( not ( = ?auto_8156 ?auto_8160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8160 ?auto_8154 ?auto_8153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8222 - OBJ
      ?auto_8223 - OBJ
      ?auto_8224 - OBJ
      ?auto_8221 - LOCATION
    )
    :vars
    (
      ?auto_8225 - LOCATION
      ?auto_8227 - CITY
      ?auto_8226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8225 ?auto_8227 ) ( IN-CITY ?auto_8221 ?auto_8227 ) ( not ( = ?auto_8221 ?auto_8225 ) ) ( OBJ-AT ?auto_8222 ?auto_8221 ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( OBJ-AT ?auto_8224 ?auto_8225 ) ( TRUCK-AT ?auto_8226 ?auto_8221 ) ( OBJ-AT ?auto_8223 ?auto_8221 ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( not ( = ?auto_8223 ?auto_8224 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8222 ?auto_8224 ?auto_8221 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8633 - OBJ
      ?auto_8634 - OBJ
      ?auto_8635 - OBJ
      ?auto_8632 - LOCATION
    )
    :vars
    (
      ?auto_8637 - TRUCK
      ?auto_8636 - LOCATION
      ?auto_8638 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8637 ?auto_8636 ) ( IN-CITY ?auto_8636 ?auto_8638 ) ( IN-CITY ?auto_8632 ?auto_8638 ) ( not ( = ?auto_8632 ?auto_8636 ) ) ( OBJ-AT ?auto_8635 ?auto_8632 ) ( not ( = ?auto_8635 ?auto_8633 ) ) ( OBJ-AT ?auto_8633 ?auto_8636 ) ( OBJ-AT ?auto_8634 ?auto_8632 ) ( not ( = ?auto_8633 ?auto_8634 ) ) ( not ( = ?auto_8634 ?auto_8635 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8635 ?auto_8633 ?auto_8632 ) )
  )

)

