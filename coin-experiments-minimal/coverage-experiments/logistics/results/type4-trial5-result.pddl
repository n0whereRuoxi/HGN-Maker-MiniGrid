( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?A - OBJ ?B - LOCATION )
    ( TRUCK-AT ?C - TRUCK ?D - LOCATION )
    ( AIRPLANE-AT ?E - AIRPLANE ?F - LOCATION )
    ( IN-TRUCK ?G - OBJ ?H - TRUCK )
    ( IN-AIRPLANE ?I - OBJ ?J - AIRPLANE )
    ( IN-CITY ?K - LOCATION ?L - CITY )
    ( DIFFERENT ?M - LOCATION ?N - LOCATION )
    ( AIRPORT ?O - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( OBJ-AT ?OBJ ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-TRUCK ?OBJ ?TRUCK ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?LOC ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-AIRPLANE ?OBJ ?AIRPLANE ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( IN-TRUCK ?OBJ ?TRUCK ) )
    :effect
    ( and ( not ( IN-TRUCK ?OBJ ?TRUCK ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?TRUCK - TRUCK
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
      ?CITY - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC-FROM ) ( IN-CITY ?LOC-FROM ?CITY ) ( IN-CITY ?LOC-TO ?CITY ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?TRUCK ?LOC-FROM ) ) ( TRUCK-AT ?TRUCK ?LOC-TO ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?AIRPLANE - AIRPLANE
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?LOC-FROM ) ( AIRPORT ?LOC-TO ) ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ) ( AIRPLANE-AT ?AIRPLANE ?LOC-TO ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG-VERIFY
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2 - OBJ
      ?AUTO_3 - LOCATION
    )
    :vars
    (
      ?AUTO_4 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2 ?AUTO_4 ) ( AIRPLANE-AT ?AUTO_4 ?AUTO_3 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2 ?AUTO_4 ?AUTO_3 )
      ( DELIVER-PKG-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5 - OBJ
      ?AUTO_6 - LOCATION
    )
    :vars
    (
      ?AUTO_7 - AIRPLANE
      ?AUTO_8 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5 ?AUTO_7 ) ( AIRPORT ?AUTO_8 ) ( AIRPORT ?AUTO_6 ) ( AIRPLANE-AT ?AUTO_7 ?AUTO_8 ) ( not ( = ?AUTO_8 ?AUTO_6 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7 ?AUTO_8 ?AUTO_6 )
      ( DELIVER-PKG ?AUTO_5 ?AUTO_6 )
      ( DELIVER-PKG-VERIFY ?AUTO_5 ?AUTO_6 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9 - OBJ
      ?AUTO_10 - LOCATION
    )
    :vars
    (
      ?AUTO_11 - LOCATION
      ?AUTO_12 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11 ) ( AIRPORT ?AUTO_10 ) ( AIRPLANE-AT ?AUTO_12 ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_10 ) ) ( OBJ-AT ?AUTO_9 ?AUTO_11 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9 ?AUTO_12 ?AUTO_11 )
      ( DELIVER-PKG ?AUTO_9 ?AUTO_10 )
      ( DELIVER-PKG-VERIFY ?AUTO_9 ?AUTO_10 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13 - OBJ
      ?AUTO_14 - LOCATION
    )
    :vars
    (
      ?AUTO_15 - LOCATION
      ?AUTO_17 - LOCATION
      ?AUTO_16 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_15 ) ( AIRPORT ?AUTO_14 ) ( not ( = ?AUTO_15 ?AUTO_14 ) ) ( OBJ-AT ?AUTO_13 ?AUTO_15 ) ( AIRPORT ?AUTO_17 ) ( AIRPLANE-AT ?AUTO_16 ?AUTO_17 ) ( not ( = ?AUTO_17 ?AUTO_15 ) ) ( not ( = ?AUTO_14 ?AUTO_17 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_16 ?AUTO_17 ?AUTO_15 )
      ( DELIVER-PKG ?AUTO_13 ?AUTO_14 )
      ( DELIVER-PKG-VERIFY ?AUTO_13 ?AUTO_14 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_20 - OBJ
      ?AUTO_21 - LOCATION
    )
    :vars
    (
      ?AUTO_22 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_22 ?AUTO_21 ) ( IN-TRUCK ?AUTO_20 ?AUTO_22 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_20 ?AUTO_22 ?AUTO_21 )
      ( DELIVER-PKG-VERIFY ?AUTO_20 ?AUTO_21 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_23 - OBJ
      ?AUTO_24 - LOCATION
    )
    :vars
    (
      ?AUTO_25 - TRUCK
      ?AUTO_26 - LOCATION
      ?AUTO_27 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_23 ?AUTO_25 ) ( TRUCK-AT ?AUTO_25 ?AUTO_26 ) ( IN-CITY ?AUTO_26 ?AUTO_27 ) ( IN-CITY ?AUTO_24 ?AUTO_27 ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_25 ?AUTO_26 ?AUTO_24 ?AUTO_27 )
      ( DELIVER-PKG ?AUTO_23 ?AUTO_24 )
      ( DELIVER-PKG-VERIFY ?AUTO_23 ?AUTO_24 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_28 - OBJ
      ?AUTO_29 - LOCATION
    )
    :vars
    (
      ?AUTO_30 - TRUCK
      ?AUTO_31 - LOCATION
      ?AUTO_32 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_30 ?AUTO_31 ) ( IN-CITY ?AUTO_31 ?AUTO_32 ) ( IN-CITY ?AUTO_29 ?AUTO_32 ) ( not ( = ?AUTO_29 ?AUTO_31 ) ) ( OBJ-AT ?AUTO_28 ?AUTO_31 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_28 ?AUTO_30 ?AUTO_31 )
      ( DELIVER-PKG ?AUTO_28 ?AUTO_29 )
      ( DELIVER-PKG-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_33 - OBJ
      ?AUTO_34 - LOCATION
    )
    :vars
    (
      ?AUTO_35 - LOCATION
      ?AUTO_37 - CITY
      ?AUTO_36 - TRUCK
      ?AUTO_38 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_35 ?AUTO_37 ) ( IN-CITY ?AUTO_34 ?AUTO_37 ) ( not ( = ?AUTO_34 ?AUTO_35 ) ) ( OBJ-AT ?AUTO_33 ?AUTO_35 ) ( TRUCK-AT ?AUTO_36 ?AUTO_38 ) ( IN-CITY ?AUTO_38 ?AUTO_37 ) ( not ( = ?AUTO_35 ?AUTO_38 ) ) ( not ( = ?AUTO_34 ?AUTO_38 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_36 ?AUTO_38 ?AUTO_35 ?AUTO_37 )
      ( DELIVER-PKG ?AUTO_33 ?AUTO_34 )
      ( DELIVER-PKG-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_49 - OBJ
      ?AUTO_50 - LOCATION
    )
    :vars
    (
      ?AUTO_51 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_49 ?AUTO_51 ) ( AIRPLANE-AT ?AUTO_51 ?AUTO_50 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_49 ?AUTO_51 ?AUTO_50 )
      ( DELIVER-PKG-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_52 - OBJ
      ?AUTO_53 - LOCATION
    )
    :vars
    (
      ?AUTO_54 - AIRPLANE
      ?AUTO_55 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_52 ?AUTO_54 ) ( AIRPORT ?AUTO_55 ) ( AIRPORT ?AUTO_53 ) ( AIRPLANE-AT ?AUTO_54 ?AUTO_55 ) ( not ( = ?AUTO_55 ?AUTO_53 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_54 ?AUTO_55 ?AUTO_53 )
      ( DELIVER-PKG ?AUTO_52 ?AUTO_53 )
      ( DELIVER-PKG-VERIFY ?AUTO_52 ?AUTO_53 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_56 - OBJ
      ?AUTO_57 - LOCATION
    )
    :vars
    (
      ?AUTO_59 - LOCATION
      ?AUTO_58 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_59 ) ( AIRPORT ?AUTO_57 ) ( AIRPLANE-AT ?AUTO_58 ?AUTO_59 ) ( not ( = ?AUTO_59 ?AUTO_57 ) ) ( OBJ-AT ?AUTO_56 ?AUTO_59 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_56 ?AUTO_58 ?AUTO_59 )
      ( DELIVER-PKG ?AUTO_56 ?AUTO_57 )
      ( DELIVER-PKG-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - LOCATION
      ?AUTO_62 - AIRPLANE
      ?AUTO_64 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_63 ) ( AIRPORT ?AUTO_61 ) ( AIRPLANE-AT ?AUTO_62 ?AUTO_63 ) ( not ( = ?AUTO_63 ?AUTO_61 ) ) ( TRUCK-AT ?AUTO_64 ?AUTO_63 ) ( IN-TRUCK ?AUTO_60 ?AUTO_64 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_60 ?AUTO_64 ?AUTO_63 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_65 - OBJ
      ?AUTO_66 - LOCATION
    )
    :vars
    (
      ?AUTO_67 - LOCATION
      ?AUTO_68 - AIRPLANE
      ?AUTO_69 - TRUCK
      ?AUTO_70 - LOCATION
      ?AUTO_71 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_67 ) ( AIRPORT ?AUTO_66 ) ( AIRPLANE-AT ?AUTO_68 ?AUTO_67 ) ( not ( = ?AUTO_67 ?AUTO_66 ) ) ( IN-TRUCK ?AUTO_65 ?AUTO_69 ) ( TRUCK-AT ?AUTO_69 ?AUTO_70 ) ( IN-CITY ?AUTO_70 ?AUTO_71 ) ( IN-CITY ?AUTO_67 ?AUTO_71 ) ( not ( = ?AUTO_67 ?AUTO_70 ) ) ( not ( = ?AUTO_66 ?AUTO_70 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_69 ?AUTO_70 ?AUTO_67 ?AUTO_71 )
      ( DELIVER-PKG ?AUTO_65 ?AUTO_66 )
      ( DELIVER-PKG-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_72 - OBJ
      ?AUTO_73 - LOCATION
    )
    :vars
    (
      ?AUTO_74 - LOCATION
      ?AUTO_75 - AIRPLANE
      ?AUTO_76 - TRUCK
      ?AUTO_77 - LOCATION
      ?AUTO_78 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_74 ) ( AIRPORT ?AUTO_73 ) ( AIRPLANE-AT ?AUTO_75 ?AUTO_74 ) ( not ( = ?AUTO_74 ?AUTO_73 ) ) ( TRUCK-AT ?AUTO_76 ?AUTO_77 ) ( IN-CITY ?AUTO_77 ?AUTO_78 ) ( IN-CITY ?AUTO_74 ?AUTO_78 ) ( not ( = ?AUTO_74 ?AUTO_77 ) ) ( not ( = ?AUTO_73 ?AUTO_77 ) ) ( OBJ-AT ?AUTO_72 ?AUTO_77 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_72 ?AUTO_76 ?AUTO_77 )
      ( DELIVER-PKG ?AUTO_72 ?AUTO_73 )
      ( DELIVER-PKG-VERIFY ?AUTO_72 ?AUTO_73 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_79 - OBJ
      ?AUTO_80 - LOCATION
    )
    :vars
    (
      ?AUTO_85 - LOCATION
      ?AUTO_81 - AIRPLANE
      ?AUTO_84 - LOCATION
      ?AUTO_82 - CITY
      ?AUTO_83 - TRUCK
      ?AUTO_86 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_85 ) ( AIRPORT ?AUTO_80 ) ( AIRPLANE-AT ?AUTO_81 ?AUTO_85 ) ( not ( = ?AUTO_85 ?AUTO_80 ) ) ( IN-CITY ?AUTO_84 ?AUTO_82 ) ( IN-CITY ?AUTO_85 ?AUTO_82 ) ( not ( = ?AUTO_85 ?AUTO_84 ) ) ( not ( = ?AUTO_80 ?AUTO_84 ) ) ( OBJ-AT ?AUTO_79 ?AUTO_84 ) ( TRUCK-AT ?AUTO_83 ?AUTO_86 ) ( IN-CITY ?AUTO_86 ?AUTO_82 ) ( not ( = ?AUTO_84 ?AUTO_86 ) ) ( not ( = ?AUTO_80 ?AUTO_86 ) ) ( not ( = ?AUTO_85 ?AUTO_86 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_83 ?AUTO_86 ?AUTO_84 ?AUTO_82 )
      ( DELIVER-PKG ?AUTO_79 ?AUTO_80 )
      ( DELIVER-PKG-VERIFY ?AUTO_79 ?AUTO_80 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_89 - OBJ
      ?AUTO_90 - LOCATION
    )
    :vars
    (
      ?AUTO_96 - LOCATION
      ?AUTO_95 - LOCATION
      ?AUTO_93 - CITY
      ?AUTO_92 - TRUCK
      ?AUTO_94 - LOCATION
      ?AUTO_97 - LOCATION
      ?AUTO_91 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_96 ) ( AIRPORT ?AUTO_90 ) ( not ( = ?AUTO_96 ?AUTO_90 ) ) ( IN-CITY ?AUTO_95 ?AUTO_93 ) ( IN-CITY ?AUTO_96 ?AUTO_93 ) ( not ( = ?AUTO_96 ?AUTO_95 ) ) ( not ( = ?AUTO_90 ?AUTO_95 ) ) ( OBJ-AT ?AUTO_89 ?AUTO_95 ) ( TRUCK-AT ?AUTO_92 ?AUTO_94 ) ( IN-CITY ?AUTO_94 ?AUTO_93 ) ( not ( = ?AUTO_95 ?AUTO_94 ) ) ( not ( = ?AUTO_90 ?AUTO_94 ) ) ( not ( = ?AUTO_96 ?AUTO_94 ) ) ( AIRPORT ?AUTO_97 ) ( AIRPLANE-AT ?AUTO_91 ?AUTO_97 ) ( not ( = ?AUTO_97 ?AUTO_96 ) ) ( not ( = ?AUTO_90 ?AUTO_97 ) ) ( not ( = ?AUTO_95 ?AUTO_97 ) ) ( not ( = ?AUTO_94 ?AUTO_97 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_91 ?AUTO_97 ?AUTO_96 )
      ( DELIVER-PKG ?AUTO_89 ?AUTO_90 )
      ( DELIVER-PKG-VERIFY ?AUTO_89 ?AUTO_90 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_106 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_106 ?AUTO_105 ) ( IN-TRUCK ?AUTO_104 ?AUTO_106 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_104 ?AUTO_106 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_107 - OBJ
      ?AUTO_108 - LOCATION
    )
    :vars
    (
      ?AUTO_109 - TRUCK
      ?AUTO_110 - LOCATION
      ?AUTO_111 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_107 ?AUTO_109 ) ( TRUCK-AT ?AUTO_109 ?AUTO_110 ) ( IN-CITY ?AUTO_110 ?AUTO_111 ) ( IN-CITY ?AUTO_108 ?AUTO_111 ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_109 ?AUTO_110 ?AUTO_108 ?AUTO_111 )
      ( DELIVER-PKG ?AUTO_107 ?AUTO_108 )
      ( DELIVER-PKG-VERIFY ?AUTO_107 ?AUTO_108 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_118 - OBJ
      ?AUTO_119 - LOCATION
    )
    :vars
    (
      ?AUTO_121 - TRUCK
      ?AUTO_122 - LOCATION
      ?AUTO_120 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_121 ?AUTO_122 ) ( IN-CITY ?AUTO_122 ?AUTO_120 ) ( IN-CITY ?AUTO_119 ?AUTO_120 ) ( not ( = ?AUTO_119 ?AUTO_122 ) ) ( OBJ-AT ?AUTO_118 ?AUTO_122 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_118 ?AUTO_121 ?AUTO_122 )
      ( DELIVER-PKG ?AUTO_118 ?AUTO_119 )
      ( DELIVER-PKG-VERIFY ?AUTO_118 ?AUTO_119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_131 - OBJ
      ?AUTO_132 - LOCATION
    )
    :vars
    (
      ?AUTO_133 - LOCATION
      ?AUTO_135 - CITY
      ?AUTO_134 - TRUCK
      ?AUTO_136 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_133 ?AUTO_135 ) ( IN-CITY ?AUTO_132 ?AUTO_135 ) ( not ( = ?AUTO_132 ?AUTO_133 ) ) ( OBJ-AT ?AUTO_131 ?AUTO_133 ) ( TRUCK-AT ?AUTO_134 ?AUTO_136 ) ( IN-CITY ?AUTO_136 ?AUTO_135 ) ( not ( = ?AUTO_133 ?AUTO_136 ) ) ( not ( = ?AUTO_132 ?AUTO_136 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_134 ?AUTO_136 ?AUTO_133 ?AUTO_135 )
      ( DELIVER-PKG ?AUTO_131 ?AUTO_132 )
      ( DELIVER-PKG-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_141 - OBJ
      ?AUTO_142 - LOCATION
    )
    :vars
    (
      ?AUTO_146 - LOCATION
      ?AUTO_145 - CITY
      ?AUTO_143 - TRUCK
      ?AUTO_144 - LOCATION
      ?AUTO_147 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_146 ?AUTO_145 ) ( IN-CITY ?AUTO_142 ?AUTO_145 ) ( not ( = ?AUTO_142 ?AUTO_146 ) ) ( TRUCK-AT ?AUTO_143 ?AUTO_144 ) ( IN-CITY ?AUTO_144 ?AUTO_145 ) ( not ( = ?AUTO_146 ?AUTO_144 ) ) ( not ( = ?AUTO_142 ?AUTO_144 ) ) ( IN-AIRPLANE ?AUTO_141 ?AUTO_147 ) ( AIRPLANE-AT ?AUTO_147 ?AUTO_146 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_141 ?AUTO_147 ?AUTO_146 )
      ( DELIVER-PKG ?AUTO_141 ?AUTO_142 )
      ( DELIVER-PKG-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_148 - OBJ
      ?AUTO_149 - LOCATION
    )
    :vars
    (
      ?AUTO_152 - LOCATION
      ?AUTO_153 - CITY
      ?AUTO_151 - TRUCK
      ?AUTO_150 - LOCATION
      ?AUTO_154 - AIRPLANE
      ?AUTO_155 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_152 ?AUTO_153 ) ( IN-CITY ?AUTO_149 ?AUTO_153 ) ( not ( = ?AUTO_149 ?AUTO_152 ) ) ( TRUCK-AT ?AUTO_151 ?AUTO_150 ) ( IN-CITY ?AUTO_150 ?AUTO_153 ) ( not ( = ?AUTO_152 ?AUTO_150 ) ) ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( IN-AIRPLANE ?AUTO_148 ?AUTO_154 ) ( AIRPORT ?AUTO_155 ) ( AIRPORT ?AUTO_152 ) ( AIRPLANE-AT ?AUTO_154 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_152 ) ) ( not ( = ?AUTO_149 ?AUTO_155 ) ) ( not ( = ?AUTO_150 ?AUTO_155 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_154 ?AUTO_155 ?AUTO_152 )
      ( DELIVER-PKG ?AUTO_148 ?AUTO_149 )
      ( DELIVER-PKG-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_156 - OBJ
      ?AUTO_157 - LOCATION
    )
    :vars
    (
      ?AUTO_163 - LOCATION
      ?AUTO_160 - CITY
      ?AUTO_158 - TRUCK
      ?AUTO_159 - LOCATION
      ?AUTO_162 - LOCATION
      ?AUTO_161 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_163 ?AUTO_160 ) ( IN-CITY ?AUTO_157 ?AUTO_160 ) ( not ( = ?AUTO_157 ?AUTO_163 ) ) ( TRUCK-AT ?AUTO_158 ?AUTO_159 ) ( IN-CITY ?AUTO_159 ?AUTO_160 ) ( not ( = ?AUTO_163 ?AUTO_159 ) ) ( not ( = ?AUTO_157 ?AUTO_159 ) ) ( AIRPORT ?AUTO_162 ) ( AIRPORT ?AUTO_163 ) ( AIRPLANE-AT ?AUTO_161 ?AUTO_162 ) ( not ( = ?AUTO_162 ?AUTO_163 ) ) ( not ( = ?AUTO_157 ?AUTO_162 ) ) ( not ( = ?AUTO_159 ?AUTO_162 ) ) ( OBJ-AT ?AUTO_156 ?AUTO_162 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_156 ?AUTO_161 ?AUTO_162 )
      ( DELIVER-PKG ?AUTO_156 ?AUTO_157 )
      ( DELIVER-PKG-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_164 - OBJ
      ?AUTO_165 - LOCATION
    )
    :vars
    (
      ?AUTO_171 - LOCATION
      ?AUTO_168 - CITY
      ?AUTO_167 - TRUCK
      ?AUTO_169 - LOCATION
      ?AUTO_170 - LOCATION
      ?AUTO_172 - LOCATION
      ?AUTO_166 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_171 ?AUTO_168 ) ( IN-CITY ?AUTO_165 ?AUTO_168 ) ( not ( = ?AUTO_165 ?AUTO_171 ) ) ( TRUCK-AT ?AUTO_167 ?AUTO_169 ) ( IN-CITY ?AUTO_169 ?AUTO_168 ) ( not ( = ?AUTO_171 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( AIRPORT ?AUTO_170 ) ( AIRPORT ?AUTO_171 ) ( not ( = ?AUTO_170 ?AUTO_171 ) ) ( not ( = ?AUTO_165 ?AUTO_170 ) ) ( not ( = ?AUTO_169 ?AUTO_170 ) ) ( OBJ-AT ?AUTO_164 ?AUTO_170 ) ( AIRPORT ?AUTO_172 ) ( AIRPLANE-AT ?AUTO_166 ?AUTO_172 ) ( not ( = ?AUTO_172 ?AUTO_170 ) ) ( not ( = ?AUTO_165 ?AUTO_172 ) ) ( not ( = ?AUTO_171 ?AUTO_172 ) ) ( not ( = ?AUTO_169 ?AUTO_172 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_166 ?AUTO_172 ?AUTO_170 )
      ( DELIVER-PKG ?AUTO_164 ?AUTO_165 )
      ( DELIVER-PKG-VERIFY ?AUTO_164 ?AUTO_165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_175 - OBJ
      ?AUTO_176 - LOCATION
    )
    :vars
    (
      ?AUTO_177 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_177 ?AUTO_176 ) ( IN-TRUCK ?AUTO_175 ?AUTO_177 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_175 ?AUTO_177 ?AUTO_176 )
      ( DELIVER-PKG-VERIFY ?AUTO_175 ?AUTO_176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_188 - OBJ
      ?AUTO_189 - LOCATION
    )
    :vars
    (
      ?AUTO_191 - TRUCK
      ?AUTO_192 - LOCATION
      ?AUTO_190 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_191 ?AUTO_192 ) ( IN-CITY ?AUTO_192 ?AUTO_190 ) ( IN-CITY ?AUTO_189 ?AUTO_190 ) ( not ( = ?AUTO_189 ?AUTO_192 ) ) ( OBJ-AT ?AUTO_188 ?AUTO_192 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_188 ?AUTO_191 ?AUTO_192 )
      ( DELIVER-PKG ?AUTO_188 ?AUTO_189 )
      ( DELIVER-PKG-VERIFY ?AUTO_188 ?AUTO_189 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_195 - OBJ
      ?AUTO_196 - LOCATION
    )
    :vars
    (
      ?AUTO_197 - TRUCK
      ?AUTO_199 - LOCATION
      ?AUTO_198 - CITY
      ?AUTO_200 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_197 ?AUTO_199 ) ( IN-CITY ?AUTO_199 ?AUTO_198 ) ( IN-CITY ?AUTO_196 ?AUTO_198 ) ( not ( = ?AUTO_196 ?AUTO_199 ) ) ( IN-AIRPLANE ?AUTO_195 ?AUTO_200 ) ( AIRPLANE-AT ?AUTO_200 ?AUTO_199 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_195 ?AUTO_200 ?AUTO_199 )
      ( DELIVER-PKG ?AUTO_195 ?AUTO_196 )
      ( DELIVER-PKG-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_201 - OBJ
      ?AUTO_202 - LOCATION
    )
    :vars
    (
      ?AUTO_204 - TRUCK
      ?AUTO_205 - LOCATION
      ?AUTO_203 - CITY
      ?AUTO_206 - AIRPLANE
      ?AUTO_207 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_204 ?AUTO_205 ) ( IN-CITY ?AUTO_205 ?AUTO_203 ) ( IN-CITY ?AUTO_202 ?AUTO_203 ) ( not ( = ?AUTO_202 ?AUTO_205 ) ) ( IN-AIRPLANE ?AUTO_201 ?AUTO_206 ) ( AIRPORT ?AUTO_207 ) ( AIRPORT ?AUTO_205 ) ( AIRPLANE-AT ?AUTO_206 ?AUTO_207 ) ( not ( = ?AUTO_207 ?AUTO_205 ) ) ( not ( = ?AUTO_202 ?AUTO_207 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_206 ?AUTO_207 ?AUTO_205 )
      ( DELIVER-PKG ?AUTO_201 ?AUTO_202 )
      ( DELIVER-PKG-VERIFY ?AUTO_201 ?AUTO_202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_208 - OBJ
      ?AUTO_209 - LOCATION
    )
    :vars
    (
      ?AUTO_212 - TRUCK
      ?AUTO_213 - LOCATION
      ?AUTO_210 - CITY
      ?AUTO_214 - LOCATION
      ?AUTO_211 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_212 ?AUTO_213 ) ( IN-CITY ?AUTO_213 ?AUTO_210 ) ( IN-CITY ?AUTO_209 ?AUTO_210 ) ( not ( = ?AUTO_209 ?AUTO_213 ) ) ( AIRPORT ?AUTO_214 ) ( AIRPORT ?AUTO_213 ) ( AIRPLANE-AT ?AUTO_211 ?AUTO_214 ) ( not ( = ?AUTO_214 ?AUTO_213 ) ) ( not ( = ?AUTO_209 ?AUTO_214 ) ) ( OBJ-AT ?AUTO_208 ?AUTO_214 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_208 ?AUTO_211 ?AUTO_214 )
      ( DELIVER-PKG ?AUTO_208 ?AUTO_209 )
      ( DELIVER-PKG-VERIFY ?AUTO_208 ?AUTO_209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_218 - TRUCK
      ?AUTO_219 - LOCATION
      ?AUTO_217 - CITY
      ?AUTO_220 - LOCATION
      ?AUTO_221 - AIRPLANE
      ?AUTO_222 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_218 ?AUTO_219 ) ( IN-CITY ?AUTO_219 ?AUTO_217 ) ( IN-CITY ?AUTO_216 ?AUTO_217 ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) ( AIRPORT ?AUTO_220 ) ( AIRPORT ?AUTO_219 ) ( AIRPLANE-AT ?AUTO_221 ?AUTO_220 ) ( not ( = ?AUTO_220 ?AUTO_219 ) ) ( not ( = ?AUTO_216 ?AUTO_220 ) ) ( TRUCK-AT ?AUTO_222 ?AUTO_220 ) ( IN-TRUCK ?AUTO_215 ?AUTO_222 ) ( not ( = ?AUTO_218 ?AUTO_222 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_215 ?AUTO_222 ?AUTO_220 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_223 - OBJ
      ?AUTO_224 - LOCATION
    )
    :vars
    (
      ?AUTO_227 - TRUCK
      ?AUTO_229 - LOCATION
      ?AUTO_226 - CITY
      ?AUTO_228 - LOCATION
      ?AUTO_225 - AIRPLANE
      ?AUTO_230 - TRUCK
      ?AUTO_231 - LOCATION
      ?AUTO_232 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_227 ?AUTO_229 ) ( IN-CITY ?AUTO_229 ?AUTO_226 ) ( IN-CITY ?AUTO_224 ?AUTO_226 ) ( not ( = ?AUTO_224 ?AUTO_229 ) ) ( AIRPORT ?AUTO_228 ) ( AIRPORT ?AUTO_229 ) ( AIRPLANE-AT ?AUTO_225 ?AUTO_228 ) ( not ( = ?AUTO_228 ?AUTO_229 ) ) ( not ( = ?AUTO_224 ?AUTO_228 ) ) ( IN-TRUCK ?AUTO_223 ?AUTO_230 ) ( not ( = ?AUTO_227 ?AUTO_230 ) ) ( TRUCK-AT ?AUTO_230 ?AUTO_231 ) ( IN-CITY ?AUTO_231 ?AUTO_232 ) ( IN-CITY ?AUTO_228 ?AUTO_232 ) ( not ( = ?AUTO_228 ?AUTO_231 ) ) ( not ( = ?AUTO_224 ?AUTO_231 ) ) ( not ( = ?AUTO_229 ?AUTO_231 ) ) ( not ( = ?AUTO_226 ?AUTO_232 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_230 ?AUTO_231 ?AUTO_228 ?AUTO_232 )
      ( DELIVER-PKG ?AUTO_223 ?AUTO_224 )
      ( DELIVER-PKG-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_233 - OBJ
      ?AUTO_234 - LOCATION
    )
    :vars
    (
      ?AUTO_241 - TRUCK
      ?AUTO_240 - LOCATION
      ?AUTO_235 - CITY
      ?AUTO_238 - LOCATION
      ?AUTO_236 - AIRPLANE
      ?AUTO_239 - TRUCK
      ?AUTO_237 - LOCATION
      ?AUTO_242 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_241 ?AUTO_240 ) ( IN-CITY ?AUTO_240 ?AUTO_235 ) ( IN-CITY ?AUTO_234 ?AUTO_235 ) ( not ( = ?AUTO_234 ?AUTO_240 ) ) ( AIRPORT ?AUTO_238 ) ( AIRPORT ?AUTO_240 ) ( AIRPLANE-AT ?AUTO_236 ?AUTO_238 ) ( not ( = ?AUTO_238 ?AUTO_240 ) ) ( not ( = ?AUTO_234 ?AUTO_238 ) ) ( not ( = ?AUTO_241 ?AUTO_239 ) ) ( TRUCK-AT ?AUTO_239 ?AUTO_237 ) ( IN-CITY ?AUTO_237 ?AUTO_242 ) ( IN-CITY ?AUTO_238 ?AUTO_242 ) ( not ( = ?AUTO_238 ?AUTO_237 ) ) ( not ( = ?AUTO_234 ?AUTO_237 ) ) ( not ( = ?AUTO_240 ?AUTO_237 ) ) ( not ( = ?AUTO_235 ?AUTO_242 ) ) ( OBJ-AT ?AUTO_233 ?AUTO_237 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_233 ?AUTO_239 ?AUTO_237 )
      ( DELIVER-PKG ?AUTO_233 ?AUTO_234 )
      ( DELIVER-PKG-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_243 - OBJ
      ?AUTO_244 - LOCATION
    )
    :vars
    (
      ?AUTO_246 - TRUCK
      ?AUTO_250 - LOCATION
      ?AUTO_249 - CITY
      ?AUTO_248 - LOCATION
      ?AUTO_251 - AIRPLANE
      ?AUTO_247 - TRUCK
      ?AUTO_245 - LOCATION
      ?AUTO_252 - CITY
      ?AUTO_253 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_246 ?AUTO_250 ) ( IN-CITY ?AUTO_250 ?AUTO_249 ) ( IN-CITY ?AUTO_244 ?AUTO_249 ) ( not ( = ?AUTO_244 ?AUTO_250 ) ) ( AIRPORT ?AUTO_248 ) ( AIRPORT ?AUTO_250 ) ( AIRPLANE-AT ?AUTO_251 ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_244 ?AUTO_248 ) ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) ( IN-CITY ?AUTO_245 ?AUTO_252 ) ( IN-CITY ?AUTO_248 ?AUTO_252 ) ( not ( = ?AUTO_248 ?AUTO_245 ) ) ( not ( = ?AUTO_244 ?AUTO_245 ) ) ( not ( = ?AUTO_250 ?AUTO_245 ) ) ( not ( = ?AUTO_249 ?AUTO_252 ) ) ( OBJ-AT ?AUTO_243 ?AUTO_245 ) ( TRUCK-AT ?AUTO_247 ?AUTO_253 ) ( IN-CITY ?AUTO_253 ?AUTO_252 ) ( not ( = ?AUTO_245 ?AUTO_253 ) ) ( not ( = ?AUTO_244 ?AUTO_253 ) ) ( not ( = ?AUTO_250 ?AUTO_253 ) ) ( not ( = ?AUTO_248 ?AUTO_253 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_247 ?AUTO_253 ?AUTO_245 ?AUTO_252 )
      ( DELIVER-PKG ?AUTO_243 ?AUTO_244 )
      ( DELIVER-PKG-VERIFY ?AUTO_243 ?AUTO_244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_256 - OBJ
      ?AUTO_257 - LOCATION
    )
    :vars
    (
      ?AUTO_266 - TRUCK
      ?AUTO_263 - LOCATION
      ?AUTO_264 - CITY
      ?AUTO_258 - LOCATION
      ?AUTO_260 - TRUCK
      ?AUTO_265 - LOCATION
      ?AUTO_262 - CITY
      ?AUTO_261 - LOCATION
      ?AUTO_267 - LOCATION
      ?AUTO_259 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_266 ?AUTO_263 ) ( IN-CITY ?AUTO_263 ?AUTO_264 ) ( IN-CITY ?AUTO_257 ?AUTO_264 ) ( not ( = ?AUTO_257 ?AUTO_263 ) ) ( AIRPORT ?AUTO_258 ) ( AIRPORT ?AUTO_263 ) ( not ( = ?AUTO_258 ?AUTO_263 ) ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( not ( = ?AUTO_266 ?AUTO_260 ) ) ( IN-CITY ?AUTO_265 ?AUTO_262 ) ( IN-CITY ?AUTO_258 ?AUTO_262 ) ( not ( = ?AUTO_258 ?AUTO_265 ) ) ( not ( = ?AUTO_257 ?AUTO_265 ) ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_262 ) ) ( OBJ-AT ?AUTO_256 ?AUTO_265 ) ( TRUCK-AT ?AUTO_260 ?AUTO_261 ) ( IN-CITY ?AUTO_261 ?AUTO_262 ) ( not ( = ?AUTO_265 ?AUTO_261 ) ) ( not ( = ?AUTO_257 ?AUTO_261 ) ) ( not ( = ?AUTO_263 ?AUTO_261 ) ) ( not ( = ?AUTO_258 ?AUTO_261 ) ) ( AIRPORT ?AUTO_267 ) ( AIRPLANE-AT ?AUTO_259 ?AUTO_267 ) ( not ( = ?AUTO_267 ?AUTO_258 ) ) ( not ( = ?AUTO_257 ?AUTO_267 ) ) ( not ( = ?AUTO_263 ?AUTO_267 ) ) ( not ( = ?AUTO_265 ?AUTO_267 ) ) ( not ( = ?AUTO_261 ?AUTO_267 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_259 ?AUTO_267 ?AUTO_258 )
      ( DELIVER-PKG ?AUTO_256 ?AUTO_257 )
      ( DELIVER-PKG-VERIFY ?AUTO_256 ?AUTO_257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_274 - OBJ
      ?AUTO_275 - LOCATION
    )
    :vars
    (
      ?AUTO_276 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_276 ?AUTO_275 ) ( IN-TRUCK ?AUTO_274 ?AUTO_276 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_274 ?AUTO_276 ?AUTO_275 )
      ( DELIVER-PKG-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_279 - OBJ
      ?AUTO_280 - LOCATION
    )
    :vars
    (
      ?AUTO_281 - TRUCK
      ?AUTO_282 - LOCATION
      ?AUTO_283 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_279 ?AUTO_281 ) ( TRUCK-AT ?AUTO_281 ?AUTO_282 ) ( IN-CITY ?AUTO_282 ?AUTO_283 ) ( IN-CITY ?AUTO_280 ?AUTO_283 ) ( not ( = ?AUTO_280 ?AUTO_282 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_281 ?AUTO_282 ?AUTO_280 ?AUTO_283 )
      ( DELIVER-PKG ?AUTO_279 ?AUTO_280 )
      ( DELIVER-PKG-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_288 - OBJ
      ?AUTO_289 - LOCATION
    )
    :vars
    (
      ?AUTO_292 - TRUCK
      ?AUTO_290 - LOCATION
      ?AUTO_291 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_292 ?AUTO_290 ) ( IN-CITY ?AUTO_290 ?AUTO_291 ) ( IN-CITY ?AUTO_289 ?AUTO_291 ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( OBJ-AT ?AUTO_288 ?AUTO_290 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_288 ?AUTO_292 ?AUTO_290 )
      ( DELIVER-PKG ?AUTO_288 ?AUTO_289 )
      ( DELIVER-PKG-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_295 - OBJ
      ?AUTO_296 - LOCATION
    )
    :vars
    (
      ?AUTO_297 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_297 ?AUTO_296 ) ( IN-TRUCK ?AUTO_295 ?AUTO_297 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_295 ?AUTO_297 ?AUTO_296 )
      ( DELIVER-PKG-VERIFY ?AUTO_295 ?AUTO_296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_298 - OBJ
      ?AUTO_299 - LOCATION
    )
    :vars
    (
      ?AUTO_300 - TRUCK
      ?AUTO_301 - LOCATION
      ?AUTO_302 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_298 ?AUTO_300 ) ( TRUCK-AT ?AUTO_300 ?AUTO_301 ) ( IN-CITY ?AUTO_301 ?AUTO_302 ) ( IN-CITY ?AUTO_299 ?AUTO_302 ) ( not ( = ?AUTO_299 ?AUTO_301 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_300 ?AUTO_301 ?AUTO_299 ?AUTO_302 )
      ( DELIVER-PKG ?AUTO_298 ?AUTO_299 )
      ( DELIVER-PKG-VERIFY ?AUTO_298 ?AUTO_299 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_305 - OBJ
      ?AUTO_306 - LOCATION
    )
    :vars
    (
      ?AUTO_307 - TRUCK
      ?AUTO_309 - LOCATION
      ?AUTO_308 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_307 ?AUTO_309 ) ( IN-CITY ?AUTO_309 ?AUTO_308 ) ( IN-CITY ?AUTO_306 ?AUTO_308 ) ( not ( = ?AUTO_306 ?AUTO_309 ) ) ( OBJ-AT ?AUTO_305 ?AUTO_309 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_305 ?AUTO_307 ?AUTO_309 )
      ( DELIVER-PKG ?AUTO_305 ?AUTO_306 )
      ( DELIVER-PKG-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_310 - OBJ
      ?AUTO_311 - LOCATION
    )
    :vars
    (
      ?AUTO_313 - LOCATION
      ?AUTO_314 - CITY
      ?AUTO_312 - TRUCK
      ?AUTO_315 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_313 ?AUTO_314 ) ( IN-CITY ?AUTO_311 ?AUTO_314 ) ( not ( = ?AUTO_311 ?AUTO_313 ) ) ( OBJ-AT ?AUTO_310 ?AUTO_313 ) ( TRUCK-AT ?AUTO_312 ?AUTO_315 ) ( IN-CITY ?AUTO_315 ?AUTO_314 ) ( not ( = ?AUTO_313 ?AUTO_315 ) ) ( not ( = ?AUTO_311 ?AUTO_315 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_312 ?AUTO_315 ?AUTO_313 ?AUTO_314 )
      ( DELIVER-PKG ?AUTO_310 ?AUTO_311 )
      ( DELIVER-PKG-VERIFY ?AUTO_310 ?AUTO_311 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_318 - OBJ
      ?AUTO_319 - LOCATION
    )
    :vars
    (
      ?AUTO_320 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_320 ?AUTO_319 ) ( IN-TRUCK ?AUTO_318 ?AUTO_320 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_318 ?AUTO_320 ?AUTO_319 )
      ( DELIVER-PKG-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_325 - OBJ
      ?AUTO_326 - LOCATION
    )
    :vars
    (
      ?AUTO_328 - TRUCK
      ?AUTO_327 - LOCATION
      ?AUTO_329 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_328 ?AUTO_327 ) ( IN-CITY ?AUTO_327 ?AUTO_329 ) ( IN-CITY ?AUTO_326 ?AUTO_329 ) ( not ( = ?AUTO_326 ?AUTO_327 ) ) ( OBJ-AT ?AUTO_325 ?AUTO_327 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_325 ?AUTO_328 ?AUTO_327 )
      ( DELIVER-PKG ?AUTO_325 ?AUTO_326 )
      ( DELIVER-PKG-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_336 - OBJ
      ?AUTO_337 - LOCATION
    )
    :vars
    (
      ?AUTO_338 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_336 ?AUTO_338 ) ( AIRPLANE-AT ?AUTO_338 ?AUTO_337 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_336 ?AUTO_338 ?AUTO_337 )
      ( DELIVER-PKG-VERIFY ?AUTO_336 ?AUTO_337 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_339 - OBJ
      ?AUTO_340 - LOCATION
    )
    :vars
    (
      ?AUTO_341 - AIRPLANE
      ?AUTO_342 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_339 ?AUTO_341 ) ( AIRPORT ?AUTO_342 ) ( AIRPORT ?AUTO_340 ) ( AIRPLANE-AT ?AUTO_341 ?AUTO_342 ) ( not ( = ?AUTO_342 ?AUTO_340 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_341 ?AUTO_342 ?AUTO_340 )
      ( DELIVER-PKG ?AUTO_339 ?AUTO_340 )
      ( DELIVER-PKG-VERIFY ?AUTO_339 ?AUTO_340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_343 - OBJ
      ?AUTO_344 - LOCATION
    )
    :vars
    (
      ?AUTO_345 - LOCATION
      ?AUTO_346 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_345 ) ( AIRPORT ?AUTO_344 ) ( AIRPLANE-AT ?AUTO_346 ?AUTO_345 ) ( not ( = ?AUTO_345 ?AUTO_344 ) ) ( OBJ-AT ?AUTO_343 ?AUTO_345 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_343 ?AUTO_346 ?AUTO_345 )
      ( DELIVER-PKG ?AUTO_343 ?AUTO_344 )
      ( DELIVER-PKG-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_367 - OBJ
      ?AUTO_368 - LOCATION
    )
    :vars
    (
      ?AUTO_369 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_367 ?AUTO_369 ) ( AIRPLANE-AT ?AUTO_369 ?AUTO_368 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_367 ?AUTO_369 ?AUTO_368 )
      ( DELIVER-PKG-VERIFY ?AUTO_367 ?AUTO_368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_370 - OBJ
      ?AUTO_371 - LOCATION
    )
    :vars
    (
      ?AUTO_372 - AIRPLANE
      ?AUTO_373 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_370 ?AUTO_372 ) ( AIRPORT ?AUTO_373 ) ( AIRPORT ?AUTO_371 ) ( AIRPLANE-AT ?AUTO_372 ?AUTO_373 ) ( not ( = ?AUTO_373 ?AUTO_371 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_372 ?AUTO_373 ?AUTO_371 )
      ( DELIVER-PKG ?AUTO_370 ?AUTO_371 )
      ( DELIVER-PKG-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_388 - OBJ
      ?AUTO_389 - LOCATION
    )
    :vars
    (
      ?AUTO_390 - LOCATION
      ?AUTO_391 - AIRPLANE
      ?AUTO_392 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_390 ) ( AIRPORT ?AUTO_389 ) ( AIRPLANE-AT ?AUTO_391 ?AUTO_390 ) ( not ( = ?AUTO_390 ?AUTO_389 ) ) ( TRUCK-AT ?AUTO_392 ?AUTO_390 ) ( IN-TRUCK ?AUTO_388 ?AUTO_392 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_388 ?AUTO_392 ?AUTO_390 )
      ( DELIVER-PKG ?AUTO_388 ?AUTO_389 )
      ( DELIVER-PKG-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_393 - OBJ
      ?AUTO_394 - LOCATION
    )
    :vars
    (
      ?AUTO_395 - LOCATION
      ?AUTO_396 - AIRPLANE
      ?AUTO_397 - TRUCK
      ?AUTO_398 - LOCATION
      ?AUTO_399 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_395 ) ( AIRPORT ?AUTO_394 ) ( AIRPLANE-AT ?AUTO_396 ?AUTO_395 ) ( not ( = ?AUTO_395 ?AUTO_394 ) ) ( IN-TRUCK ?AUTO_393 ?AUTO_397 ) ( TRUCK-AT ?AUTO_397 ?AUTO_398 ) ( IN-CITY ?AUTO_398 ?AUTO_399 ) ( IN-CITY ?AUTO_395 ?AUTO_399 ) ( not ( = ?AUTO_395 ?AUTO_398 ) ) ( not ( = ?AUTO_394 ?AUTO_398 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_397 ?AUTO_398 ?AUTO_395 ?AUTO_399 )
      ( DELIVER-PKG ?AUTO_393 ?AUTO_394 )
      ( DELIVER-PKG-VERIFY ?AUTO_393 ?AUTO_394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_402 - OBJ
      ?AUTO_403 - LOCATION
    )
    :vars
    (
      ?AUTO_407 - LOCATION
      ?AUTO_408 - AIRPLANE
      ?AUTO_406 - TRUCK
      ?AUTO_405 - LOCATION
      ?AUTO_404 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_407 ) ( AIRPORT ?AUTO_403 ) ( AIRPLANE-AT ?AUTO_408 ?AUTO_407 ) ( not ( = ?AUTO_407 ?AUTO_403 ) ) ( TRUCK-AT ?AUTO_406 ?AUTO_405 ) ( IN-CITY ?AUTO_405 ?AUTO_404 ) ( IN-CITY ?AUTO_407 ?AUTO_404 ) ( not ( = ?AUTO_407 ?AUTO_405 ) ) ( not ( = ?AUTO_403 ?AUTO_405 ) ) ( OBJ-AT ?AUTO_402 ?AUTO_405 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_402 ?AUTO_406 ?AUTO_405 )
      ( DELIVER-PKG ?AUTO_402 ?AUTO_403 )
      ( DELIVER-PKG-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_409 - OBJ
      ?AUTO_410 - LOCATION
    )
    :vars
    (
      ?AUTO_412 - LOCATION
      ?AUTO_414 - AIRPLANE
      ?AUTO_413 - LOCATION
      ?AUTO_411 - CITY
      ?AUTO_415 - TRUCK
      ?AUTO_416 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_412 ) ( AIRPORT ?AUTO_410 ) ( AIRPLANE-AT ?AUTO_414 ?AUTO_412 ) ( not ( = ?AUTO_412 ?AUTO_410 ) ) ( IN-CITY ?AUTO_413 ?AUTO_411 ) ( IN-CITY ?AUTO_412 ?AUTO_411 ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( not ( = ?AUTO_410 ?AUTO_413 ) ) ( OBJ-AT ?AUTO_409 ?AUTO_413 ) ( TRUCK-AT ?AUTO_415 ?AUTO_416 ) ( IN-CITY ?AUTO_416 ?AUTO_411 ) ( not ( = ?AUTO_413 ?AUTO_416 ) ) ( not ( = ?AUTO_410 ?AUTO_416 ) ) ( not ( = ?AUTO_412 ?AUTO_416 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_415 ?AUTO_416 ?AUTO_413 ?AUTO_411 )
      ( DELIVER-PKG ?AUTO_409 ?AUTO_410 )
      ( DELIVER-PKG-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_419 - OBJ
      ?AUTO_420 - LOCATION
    )
    :vars
    (
      ?AUTO_421 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_419 ?AUTO_421 ) ( AIRPLANE-AT ?AUTO_421 ?AUTO_420 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_419 ?AUTO_421 ?AUTO_420 )
      ( DELIVER-PKG-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_438 - OBJ
      ?AUTO_439 - LOCATION
    )
    :vars
    (
      ?AUTO_441 - LOCATION
      ?AUTO_440 - AIRPLANE
      ?AUTO_442 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_441 ) ( AIRPORT ?AUTO_439 ) ( AIRPLANE-AT ?AUTO_440 ?AUTO_441 ) ( not ( = ?AUTO_441 ?AUTO_439 ) ) ( TRUCK-AT ?AUTO_442 ?AUTO_441 ) ( IN-TRUCK ?AUTO_438 ?AUTO_442 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_438 ?AUTO_442 ?AUTO_441 )
      ( DELIVER-PKG ?AUTO_438 ?AUTO_439 )
      ( DELIVER-PKG-VERIFY ?AUTO_438 ?AUTO_439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_447 - OBJ
      ?AUTO_448 - LOCATION
    )
    :vars
    (
      ?AUTO_452 - LOCATION
      ?AUTO_453 - AIRPLANE
      ?AUTO_450 - TRUCK
      ?AUTO_451 - LOCATION
      ?AUTO_449 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_452 ) ( AIRPORT ?AUTO_448 ) ( AIRPLANE-AT ?AUTO_453 ?AUTO_452 ) ( not ( = ?AUTO_452 ?AUTO_448 ) ) ( TRUCK-AT ?AUTO_450 ?AUTO_451 ) ( IN-CITY ?AUTO_451 ?AUTO_449 ) ( IN-CITY ?AUTO_452 ?AUTO_449 ) ( not ( = ?AUTO_452 ?AUTO_451 ) ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) ( OBJ-AT ?AUTO_447 ?AUTO_451 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_447 ?AUTO_450 ?AUTO_451 )
      ( DELIVER-PKG ?AUTO_447 ?AUTO_448 )
      ( DELIVER-PKG-VERIFY ?AUTO_447 ?AUTO_448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_460 - OBJ
      ?AUTO_461 - LOCATION
    )
    :vars
    (
      ?AUTO_462 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_460 ?AUTO_462 ) ( AIRPLANE-AT ?AUTO_462 ?AUTO_461 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_460 ?AUTO_462 ?AUTO_461 )
      ( DELIVER-PKG-VERIFY ?AUTO_460 ?AUTO_461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_495 - OBJ
      ?AUTO_496 - LOCATION
    )
    :vars
    (
      ?AUTO_497 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_497 ?AUTO_496 ) ( IN-TRUCK ?AUTO_495 ?AUTO_497 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_495 ?AUTO_497 ?AUTO_496 )
      ( DELIVER-PKG-VERIFY ?AUTO_495 ?AUTO_496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_502 - OBJ
      ?AUTO_503 - LOCATION
    )
    :vars
    (
      ?AUTO_504 - TRUCK
      ?AUTO_505 - LOCATION
      ?AUTO_506 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_502 ?AUTO_504 ) ( TRUCK-AT ?AUTO_504 ?AUTO_505 ) ( IN-CITY ?AUTO_505 ?AUTO_506 ) ( IN-CITY ?AUTO_503 ?AUTO_506 ) ( not ( = ?AUTO_503 ?AUTO_505 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_504 ?AUTO_505 ?AUTO_503 ?AUTO_506 )
      ( DELIVER-PKG ?AUTO_502 ?AUTO_503 )
      ( DELIVER-PKG-VERIFY ?AUTO_502 ?AUTO_503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_507 - OBJ
      ?AUTO_508 - LOCATION
    )
    :vars
    (
      ?AUTO_509 - TRUCK
      ?AUTO_510 - LOCATION
      ?AUTO_511 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_509 ?AUTO_510 ) ( IN-CITY ?AUTO_510 ?AUTO_511 ) ( IN-CITY ?AUTO_508 ?AUTO_511 ) ( not ( = ?AUTO_508 ?AUTO_510 ) ) ( OBJ-AT ?AUTO_507 ?AUTO_510 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_507 ?AUTO_509 ?AUTO_510 )
      ( DELIVER-PKG ?AUTO_507 ?AUTO_508 )
      ( DELIVER-PKG-VERIFY ?AUTO_507 ?AUTO_508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_516 - OBJ
      ?AUTO_517 - LOCATION
    )
    :vars
    (
      ?AUTO_520 - TRUCK
      ?AUTO_519 - LOCATION
      ?AUTO_518 - CITY
      ?AUTO_521 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_520 ?AUTO_519 ) ( IN-CITY ?AUTO_519 ?AUTO_518 ) ( IN-CITY ?AUTO_517 ?AUTO_518 ) ( not ( = ?AUTO_517 ?AUTO_519 ) ) ( IN-AIRPLANE ?AUTO_516 ?AUTO_521 ) ( AIRPLANE-AT ?AUTO_521 ?AUTO_519 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_516 ?AUTO_521 ?AUTO_519 )
      ( DELIVER-PKG ?AUTO_516 ?AUTO_517 )
      ( DELIVER-PKG-VERIFY ?AUTO_516 ?AUTO_517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_522 - OBJ
      ?AUTO_523 - LOCATION
    )
    :vars
    (
      ?AUTO_526 - TRUCK
      ?AUTO_524 - LOCATION
      ?AUTO_525 - CITY
      ?AUTO_527 - AIRPLANE
      ?AUTO_528 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_526 ?AUTO_524 ) ( IN-CITY ?AUTO_524 ?AUTO_525 ) ( IN-CITY ?AUTO_523 ?AUTO_525 ) ( not ( = ?AUTO_523 ?AUTO_524 ) ) ( IN-AIRPLANE ?AUTO_522 ?AUTO_527 ) ( AIRPORT ?AUTO_528 ) ( AIRPORT ?AUTO_524 ) ( AIRPLANE-AT ?AUTO_527 ?AUTO_528 ) ( not ( = ?AUTO_528 ?AUTO_524 ) ) ( not ( = ?AUTO_523 ?AUTO_528 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_527 ?AUTO_528 ?AUTO_524 )
      ( DELIVER-PKG ?AUTO_522 ?AUTO_523 )
      ( DELIVER-PKG-VERIFY ?AUTO_522 ?AUTO_523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_539 - OBJ
      ?AUTO_540 - LOCATION
    )
    :vars
    (
      ?AUTO_544 - TRUCK
      ?AUTO_543 - LOCATION
      ?AUTO_541 - CITY
      ?AUTO_542 - LOCATION
      ?AUTO_545 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_544 ?AUTO_543 ) ( IN-CITY ?AUTO_543 ?AUTO_541 ) ( IN-CITY ?AUTO_540 ?AUTO_541 ) ( not ( = ?AUTO_540 ?AUTO_543 ) ) ( AIRPORT ?AUTO_542 ) ( AIRPORT ?AUTO_543 ) ( AIRPLANE-AT ?AUTO_545 ?AUTO_542 ) ( not ( = ?AUTO_542 ?AUTO_543 ) ) ( not ( = ?AUTO_540 ?AUTO_542 ) ) ( OBJ-AT ?AUTO_539 ?AUTO_542 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_539 ?AUTO_545 ?AUTO_542 )
      ( DELIVER-PKG ?AUTO_539 ?AUTO_540 )
      ( DELIVER-PKG-VERIFY ?AUTO_539 ?AUTO_540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_548 - OBJ
      ?AUTO_549 - LOCATION
    )
    :vars
    (
      ?AUTO_552 - TRUCK
      ?AUTO_551 - LOCATION
      ?AUTO_554 - CITY
      ?AUTO_553 - LOCATION
      ?AUTO_550 - AIRPLANE
      ?AUTO_555 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_552 ?AUTO_551 ) ( IN-CITY ?AUTO_551 ?AUTO_554 ) ( IN-CITY ?AUTO_549 ?AUTO_554 ) ( not ( = ?AUTO_549 ?AUTO_551 ) ) ( AIRPORT ?AUTO_553 ) ( AIRPORT ?AUTO_551 ) ( AIRPLANE-AT ?AUTO_550 ?AUTO_553 ) ( not ( = ?AUTO_553 ?AUTO_551 ) ) ( not ( = ?AUTO_549 ?AUTO_553 ) ) ( TRUCK-AT ?AUTO_555 ?AUTO_553 ) ( IN-TRUCK ?AUTO_548 ?AUTO_555 ) ( not ( = ?AUTO_552 ?AUTO_555 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_548 ?AUTO_555 ?AUTO_553 )
      ( DELIVER-PKG ?AUTO_548 ?AUTO_549 )
      ( DELIVER-PKG-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_556 - OBJ
      ?AUTO_557 - LOCATION
    )
    :vars
    (
      ?AUTO_562 - TRUCK
      ?AUTO_558 - LOCATION
      ?AUTO_561 - CITY
      ?AUTO_559 - LOCATION
      ?AUTO_560 - AIRPLANE
      ?AUTO_563 - TRUCK
      ?AUTO_564 - LOCATION
      ?AUTO_565 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_562 ?AUTO_558 ) ( IN-CITY ?AUTO_558 ?AUTO_561 ) ( IN-CITY ?AUTO_557 ?AUTO_561 ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) ( AIRPORT ?AUTO_559 ) ( AIRPORT ?AUTO_558 ) ( AIRPLANE-AT ?AUTO_560 ?AUTO_559 ) ( not ( = ?AUTO_559 ?AUTO_558 ) ) ( not ( = ?AUTO_557 ?AUTO_559 ) ) ( IN-TRUCK ?AUTO_556 ?AUTO_563 ) ( not ( = ?AUTO_562 ?AUTO_563 ) ) ( TRUCK-AT ?AUTO_563 ?AUTO_564 ) ( IN-CITY ?AUTO_564 ?AUTO_565 ) ( IN-CITY ?AUTO_559 ?AUTO_565 ) ( not ( = ?AUTO_559 ?AUTO_564 ) ) ( not ( = ?AUTO_557 ?AUTO_564 ) ) ( not ( = ?AUTO_558 ?AUTO_564 ) ) ( not ( = ?AUTO_561 ?AUTO_565 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_563 ?AUTO_564 ?AUTO_559 ?AUTO_565 )
      ( DELIVER-PKG ?AUTO_556 ?AUTO_557 )
      ( DELIVER-PKG-VERIFY ?AUTO_556 ?AUTO_557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_568 - OBJ
      ?AUTO_569 - LOCATION
    )
    :vars
    (
      ?AUTO_570 - TRUCK
      ?AUTO_572 - LOCATION
      ?AUTO_571 - CITY
      ?AUTO_576 - LOCATION
      ?AUTO_573 - AIRPLANE
      ?AUTO_577 - TRUCK
      ?AUTO_574 - LOCATION
      ?AUTO_575 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_570 ?AUTO_572 ) ( IN-CITY ?AUTO_572 ?AUTO_571 ) ( IN-CITY ?AUTO_569 ?AUTO_571 ) ( not ( = ?AUTO_569 ?AUTO_572 ) ) ( AIRPORT ?AUTO_576 ) ( AIRPORT ?AUTO_572 ) ( AIRPLANE-AT ?AUTO_573 ?AUTO_576 ) ( not ( = ?AUTO_576 ?AUTO_572 ) ) ( not ( = ?AUTO_569 ?AUTO_576 ) ) ( not ( = ?AUTO_570 ?AUTO_577 ) ) ( TRUCK-AT ?AUTO_577 ?AUTO_574 ) ( IN-CITY ?AUTO_574 ?AUTO_575 ) ( IN-CITY ?AUTO_576 ?AUTO_575 ) ( not ( = ?AUTO_576 ?AUTO_574 ) ) ( not ( = ?AUTO_569 ?AUTO_574 ) ) ( not ( = ?AUTO_572 ?AUTO_574 ) ) ( not ( = ?AUTO_571 ?AUTO_575 ) ) ( OBJ-AT ?AUTO_568 ?AUTO_574 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_568 ?AUTO_577 ?AUTO_574 )
      ( DELIVER-PKG ?AUTO_568 ?AUTO_569 )
      ( DELIVER-PKG-VERIFY ?AUTO_568 ?AUTO_569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_578 - OBJ
      ?AUTO_579 - LOCATION
    )
    :vars
    (
      ?AUTO_582 - TRUCK
      ?AUTO_587 - LOCATION
      ?AUTO_583 - CITY
      ?AUTO_584 - LOCATION
      ?AUTO_586 - AIRPLANE
      ?AUTO_581 - TRUCK
      ?AUTO_585 - LOCATION
      ?AUTO_580 - CITY
      ?AUTO_588 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_582 ?AUTO_587 ) ( IN-CITY ?AUTO_587 ?AUTO_583 ) ( IN-CITY ?AUTO_579 ?AUTO_583 ) ( not ( = ?AUTO_579 ?AUTO_587 ) ) ( AIRPORT ?AUTO_584 ) ( AIRPORT ?AUTO_587 ) ( AIRPLANE-AT ?AUTO_586 ?AUTO_584 ) ( not ( = ?AUTO_584 ?AUTO_587 ) ) ( not ( = ?AUTO_579 ?AUTO_584 ) ) ( not ( = ?AUTO_582 ?AUTO_581 ) ) ( IN-CITY ?AUTO_585 ?AUTO_580 ) ( IN-CITY ?AUTO_584 ?AUTO_580 ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) ( not ( = ?AUTO_579 ?AUTO_585 ) ) ( not ( = ?AUTO_587 ?AUTO_585 ) ) ( not ( = ?AUTO_583 ?AUTO_580 ) ) ( OBJ-AT ?AUTO_578 ?AUTO_585 ) ( TRUCK-AT ?AUTO_581 ?AUTO_588 ) ( IN-CITY ?AUTO_588 ?AUTO_580 ) ( not ( = ?AUTO_585 ?AUTO_588 ) ) ( not ( = ?AUTO_579 ?AUTO_588 ) ) ( not ( = ?AUTO_587 ?AUTO_588 ) ) ( not ( = ?AUTO_584 ?AUTO_588 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_581 ?AUTO_588 ?AUTO_585 ?AUTO_580 )
      ( DELIVER-PKG ?AUTO_578 ?AUTO_579 )
      ( DELIVER-PKG-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_591 - OBJ
      ?AUTO_592 - LOCATION
    )
    :vars
    (
      ?AUTO_593 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_593 ?AUTO_592 ) ( IN-TRUCK ?AUTO_591 ?AUTO_593 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_591 ?AUTO_593 ?AUTO_592 )
      ( DELIVER-PKG-VERIFY ?AUTO_591 ?AUTO_592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_596 - OBJ
      ?AUTO_597 - LOCATION
    )
    :vars
    (
      ?AUTO_598 - TRUCK
      ?AUTO_599 - LOCATION
      ?AUTO_600 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_596 ?AUTO_598 ) ( TRUCK-AT ?AUTO_598 ?AUTO_599 ) ( IN-CITY ?AUTO_599 ?AUTO_600 ) ( IN-CITY ?AUTO_597 ?AUTO_600 ) ( not ( = ?AUTO_597 ?AUTO_599 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_598 ?AUTO_599 ?AUTO_597 ?AUTO_600 )
      ( DELIVER-PKG ?AUTO_596 ?AUTO_597 )
      ( DELIVER-PKG-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_605 - OBJ
      ?AUTO_606 - LOCATION
    )
    :vars
    (
      ?AUTO_609 - TRUCK
      ?AUTO_607 - LOCATION
      ?AUTO_608 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_609 ?AUTO_607 ) ( IN-CITY ?AUTO_607 ?AUTO_608 ) ( IN-CITY ?AUTO_606 ?AUTO_608 ) ( not ( = ?AUTO_606 ?AUTO_607 ) ) ( OBJ-AT ?AUTO_605 ?AUTO_607 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_605 ?AUTO_609 ?AUTO_607 )
      ( DELIVER-PKG ?AUTO_605 ?AUTO_606 )
      ( DELIVER-PKG-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_616 - OBJ
      ?AUTO_617 - LOCATION
    )
    :vars
    (
      ?AUTO_620 - TRUCK
      ?AUTO_618 - LOCATION
      ?AUTO_619 - CITY
      ?AUTO_621 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_620 ?AUTO_618 ) ( IN-CITY ?AUTO_618 ?AUTO_619 ) ( IN-CITY ?AUTO_617 ?AUTO_619 ) ( not ( = ?AUTO_617 ?AUTO_618 ) ) ( IN-AIRPLANE ?AUTO_616 ?AUTO_621 ) ( AIRPLANE-AT ?AUTO_621 ?AUTO_618 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_616 ?AUTO_621 ?AUTO_618 )
      ( DELIVER-PKG ?AUTO_616 ?AUTO_617 )
      ( DELIVER-PKG-VERIFY ?AUTO_616 ?AUTO_617 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_634 - OBJ
      ?AUTO_635 - LOCATION
    )
    :vars
    (
      ?AUTO_640 - TRUCK
      ?AUTO_638 - LOCATION
      ?AUTO_636 - CITY
      ?AUTO_637 - LOCATION
      ?AUTO_639 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_640 ?AUTO_638 ) ( IN-CITY ?AUTO_638 ?AUTO_636 ) ( IN-CITY ?AUTO_635 ?AUTO_636 ) ( not ( = ?AUTO_635 ?AUTO_638 ) ) ( AIRPORT ?AUTO_637 ) ( AIRPORT ?AUTO_638 ) ( AIRPLANE-AT ?AUTO_639 ?AUTO_637 ) ( not ( = ?AUTO_637 ?AUTO_638 ) ) ( not ( = ?AUTO_635 ?AUTO_637 ) ) ( OBJ-AT ?AUTO_634 ?AUTO_637 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_634 ?AUTO_639 ?AUTO_637 )
      ( DELIVER-PKG ?AUTO_634 ?AUTO_635 )
      ( DELIVER-PKG-VERIFY ?AUTO_634 ?AUTO_635 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_643 - OBJ
      ?AUTO_644 - LOCATION
    )
    :vars
    (
      ?AUTO_645 - TRUCK
      ?AUTO_646 - LOCATION
      ?AUTO_648 - CITY
      ?AUTO_649 - LOCATION
      ?AUTO_647 - AIRPLANE
      ?AUTO_650 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_645 ?AUTO_646 ) ( IN-CITY ?AUTO_646 ?AUTO_648 ) ( IN-CITY ?AUTO_644 ?AUTO_648 ) ( not ( = ?AUTO_644 ?AUTO_646 ) ) ( AIRPORT ?AUTO_649 ) ( AIRPORT ?AUTO_646 ) ( AIRPLANE-AT ?AUTO_647 ?AUTO_649 ) ( not ( = ?AUTO_649 ?AUTO_646 ) ) ( not ( = ?AUTO_644 ?AUTO_649 ) ) ( TRUCK-AT ?AUTO_650 ?AUTO_649 ) ( IN-TRUCK ?AUTO_643 ?AUTO_650 ) ( not ( = ?AUTO_645 ?AUTO_650 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_643 ?AUTO_650 ?AUTO_649 )
      ( DELIVER-PKG ?AUTO_643 ?AUTO_644 )
      ( DELIVER-PKG-VERIFY ?AUTO_643 ?AUTO_644 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_655 - OBJ
      ?AUTO_656 - LOCATION
    )
    :vars
    (
      ?AUTO_659 - TRUCK
      ?AUTO_660 - LOCATION
      ?AUTO_658 - CITY
      ?AUTO_661 - LOCATION
      ?AUTO_657 - AIRPLANE
      ?AUTO_664 - TRUCK
      ?AUTO_662 - LOCATION
      ?AUTO_663 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_659 ?AUTO_660 ) ( IN-CITY ?AUTO_660 ?AUTO_658 ) ( IN-CITY ?AUTO_656 ?AUTO_658 ) ( not ( = ?AUTO_656 ?AUTO_660 ) ) ( AIRPORT ?AUTO_661 ) ( AIRPORT ?AUTO_660 ) ( AIRPLANE-AT ?AUTO_657 ?AUTO_661 ) ( not ( = ?AUTO_661 ?AUTO_660 ) ) ( not ( = ?AUTO_656 ?AUTO_661 ) ) ( not ( = ?AUTO_659 ?AUTO_664 ) ) ( TRUCK-AT ?AUTO_664 ?AUTO_662 ) ( IN-CITY ?AUTO_662 ?AUTO_663 ) ( IN-CITY ?AUTO_661 ?AUTO_663 ) ( not ( = ?AUTO_661 ?AUTO_662 ) ) ( not ( = ?AUTO_656 ?AUTO_662 ) ) ( not ( = ?AUTO_660 ?AUTO_662 ) ) ( not ( = ?AUTO_658 ?AUTO_663 ) ) ( OBJ-AT ?AUTO_655 ?AUTO_662 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_655 ?AUTO_664 ?AUTO_662 )
      ( DELIVER-PKG ?AUTO_655 ?AUTO_656 )
      ( DELIVER-PKG-VERIFY ?AUTO_655 ?AUTO_656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_671 - OBJ
      ?AUTO_672 - LOCATION
    )
    :vars
    (
      ?AUTO_673 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_673 ?AUTO_672 ) ( IN-TRUCK ?AUTO_671 ?AUTO_673 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_671 ?AUTO_673 ?AUTO_672 )
      ( DELIVER-PKG-VERIFY ?AUTO_671 ?AUTO_672 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_682 - OBJ
      ?AUTO_683 - LOCATION
    )
    :vars
    (
      ?AUTO_685 - TRUCK
      ?AUTO_686 - LOCATION
      ?AUTO_684 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_685 ?AUTO_686 ) ( IN-CITY ?AUTO_686 ?AUTO_684 ) ( IN-CITY ?AUTO_683 ?AUTO_684 ) ( not ( = ?AUTO_683 ?AUTO_686 ) ) ( OBJ-AT ?AUTO_682 ?AUTO_686 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_682 ?AUTO_685 ?AUTO_686 )
      ( DELIVER-PKG ?AUTO_682 ?AUTO_683 )
      ( DELIVER-PKG-VERIFY ?AUTO_682 ?AUTO_683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_693 - OBJ
      ?AUTO_694 - LOCATION
    )
    :vars
    (
      ?AUTO_697 - TRUCK
      ?AUTO_696 - LOCATION
      ?AUTO_695 - CITY
      ?AUTO_698 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_697 ?AUTO_696 ) ( IN-CITY ?AUTO_696 ?AUTO_695 ) ( IN-CITY ?AUTO_694 ?AUTO_695 ) ( not ( = ?AUTO_694 ?AUTO_696 ) ) ( IN-AIRPLANE ?AUTO_693 ?AUTO_698 ) ( AIRPLANE-AT ?AUTO_698 ?AUTO_696 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_693 ?AUTO_698 ?AUTO_696 )
      ( DELIVER-PKG ?AUTO_693 ?AUTO_694 )
      ( DELIVER-PKG-VERIFY ?AUTO_693 ?AUTO_694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_711 - OBJ
      ?AUTO_712 - LOCATION
    )
    :vars
    (
      ?AUTO_714 - TRUCK
      ?AUTO_717 - LOCATION
      ?AUTO_715 - CITY
      ?AUTO_716 - LOCATION
      ?AUTO_713 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_714 ?AUTO_717 ) ( IN-CITY ?AUTO_717 ?AUTO_715 ) ( IN-CITY ?AUTO_712 ?AUTO_715 ) ( not ( = ?AUTO_712 ?AUTO_717 ) ) ( AIRPORT ?AUTO_716 ) ( AIRPORT ?AUTO_717 ) ( AIRPLANE-AT ?AUTO_713 ?AUTO_716 ) ( not ( = ?AUTO_716 ?AUTO_717 ) ) ( not ( = ?AUTO_712 ?AUTO_716 ) ) ( OBJ-AT ?AUTO_711 ?AUTO_716 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_711 ?AUTO_713 ?AUTO_716 )
      ( DELIVER-PKG ?AUTO_711 ?AUTO_712 )
      ( DELIVER-PKG-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_736 - OBJ
      ?AUTO_737 - LOCATION
    )
    :vars
    (
      ?AUTO_738 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_738 ?AUTO_737 ) ( IN-TRUCK ?AUTO_736 ?AUTO_738 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_736 ?AUTO_738 ?AUTO_737 )
      ( DELIVER-PKG-VERIFY ?AUTO_736 ?AUTO_737 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_739 - OBJ
      ?AUTO_740 - LOCATION
    )
    :vars
    (
      ?AUTO_741 - TRUCK
      ?AUTO_742 - LOCATION
      ?AUTO_743 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_739 ?AUTO_741 ) ( TRUCK-AT ?AUTO_741 ?AUTO_742 ) ( IN-CITY ?AUTO_742 ?AUTO_743 ) ( IN-CITY ?AUTO_740 ?AUTO_743 ) ( not ( = ?AUTO_740 ?AUTO_742 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_741 ?AUTO_742 ?AUTO_740 ?AUTO_743 )
      ( DELIVER-PKG ?AUTO_739 ?AUTO_740 )
      ( DELIVER-PKG-VERIFY ?AUTO_739 ?AUTO_740 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_748 - OBJ
      ?AUTO_749 - LOCATION
    )
    :vars
    (
      ?AUTO_752 - TRUCK
      ?AUTO_750 - LOCATION
      ?AUTO_751 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_752 ?AUTO_750 ) ( IN-CITY ?AUTO_750 ?AUTO_751 ) ( IN-CITY ?AUTO_749 ?AUTO_751 ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( OBJ-AT ?AUTO_748 ?AUTO_750 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_748 ?AUTO_752 ?AUTO_750 )
      ( DELIVER-PKG ?AUTO_748 ?AUTO_749 )
      ( DELIVER-PKG-VERIFY ?AUTO_748 ?AUTO_749 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_753 - OBJ
      ?AUTO_754 - LOCATION
    )
    :vars
    (
      ?AUTO_756 - LOCATION
      ?AUTO_755 - CITY
      ?AUTO_757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_756 ?AUTO_755 ) ( IN-CITY ?AUTO_754 ?AUTO_755 ) ( not ( = ?AUTO_754 ?AUTO_756 ) ) ( OBJ-AT ?AUTO_753 ?AUTO_756 ) ( TRUCK-AT ?AUTO_757 ?AUTO_754 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_757 ?AUTO_754 ?AUTO_756 ?AUTO_755 )
      ( DELIVER-PKG ?AUTO_753 ?AUTO_754 )
      ( DELIVER-PKG-VERIFY ?AUTO_753 ?AUTO_754 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_802 - OBJ
      ?AUTO_803 - LOCATION
    )
    :vars
    (
      ?AUTO_804 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_802 ?AUTO_804 ) ( AIRPLANE-AT ?AUTO_804 ?AUTO_803 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_802 ?AUTO_804 ?AUTO_803 )
      ( DELIVER-PKG-VERIFY ?AUTO_802 ?AUTO_803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_805 - OBJ
      ?AUTO_806 - LOCATION
    )
    :vars
    (
      ?AUTO_807 - AIRPLANE
      ?AUTO_808 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_805 ?AUTO_807 ) ( AIRPORT ?AUTO_808 ) ( AIRPORT ?AUTO_806 ) ( AIRPLANE-AT ?AUTO_807 ?AUTO_808 ) ( not ( = ?AUTO_808 ?AUTO_806 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_807 ?AUTO_808 ?AUTO_806 )
      ( DELIVER-PKG ?AUTO_805 ?AUTO_806 )
      ( DELIVER-PKG-VERIFY ?AUTO_805 ?AUTO_806 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_809 - OBJ
      ?AUTO_810 - LOCATION
    )
    :vars
    (
      ?AUTO_812 - LOCATION
      ?AUTO_811 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_812 ) ( AIRPORT ?AUTO_810 ) ( AIRPLANE-AT ?AUTO_811 ?AUTO_812 ) ( not ( = ?AUTO_812 ?AUTO_810 ) ) ( OBJ-AT ?AUTO_809 ?AUTO_812 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_809 ?AUTO_811 ?AUTO_812 )
      ( DELIVER-PKG ?AUTO_809 ?AUTO_810 )
      ( DELIVER-PKG-VERIFY ?AUTO_809 ?AUTO_810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_813 - OBJ
      ?AUTO_814 - LOCATION
    )
    :vars
    (
      ?AUTO_816 - LOCATION
      ?AUTO_815 - AIRPLANE
      ?AUTO_817 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_816 ) ( AIRPORT ?AUTO_814 ) ( AIRPLANE-AT ?AUTO_815 ?AUTO_816 ) ( not ( = ?AUTO_816 ?AUTO_814 ) ) ( TRUCK-AT ?AUTO_817 ?AUTO_816 ) ( IN-TRUCK ?AUTO_813 ?AUTO_817 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_813 ?AUTO_817 ?AUTO_816 )
      ( DELIVER-PKG ?AUTO_813 ?AUTO_814 )
      ( DELIVER-PKG-VERIFY ?AUTO_813 ?AUTO_814 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_818 - OBJ
      ?AUTO_819 - LOCATION
    )
    :vars
    (
      ?AUTO_821 - LOCATION
      ?AUTO_820 - AIRPLANE
      ?AUTO_822 - TRUCK
      ?AUTO_823 - LOCATION
      ?AUTO_824 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_821 ) ( AIRPORT ?AUTO_819 ) ( AIRPLANE-AT ?AUTO_820 ?AUTO_821 ) ( not ( = ?AUTO_821 ?AUTO_819 ) ) ( IN-TRUCK ?AUTO_818 ?AUTO_822 ) ( TRUCK-AT ?AUTO_822 ?AUTO_823 ) ( IN-CITY ?AUTO_823 ?AUTO_824 ) ( IN-CITY ?AUTO_821 ?AUTO_824 ) ( not ( = ?AUTO_821 ?AUTO_823 ) ) ( not ( = ?AUTO_819 ?AUTO_823 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_822 ?AUTO_823 ?AUTO_821 ?AUTO_824 )
      ( DELIVER-PKG ?AUTO_818 ?AUTO_819 )
      ( DELIVER-PKG-VERIFY ?AUTO_818 ?AUTO_819 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_829 - OBJ
      ?AUTO_830 - LOCATION
    )
    :vars
    (
      ?AUTO_832 - LOCATION
      ?AUTO_831 - AIRPLANE
      ?AUTO_833 - TRUCK
      ?AUTO_835 - LOCATION
      ?AUTO_834 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_832 ) ( AIRPORT ?AUTO_830 ) ( AIRPLANE-AT ?AUTO_831 ?AUTO_832 ) ( not ( = ?AUTO_832 ?AUTO_830 ) ) ( TRUCK-AT ?AUTO_833 ?AUTO_835 ) ( IN-CITY ?AUTO_835 ?AUTO_834 ) ( IN-CITY ?AUTO_832 ?AUTO_834 ) ( not ( = ?AUTO_832 ?AUTO_835 ) ) ( not ( = ?AUTO_830 ?AUTO_835 ) ) ( OBJ-AT ?AUTO_829 ?AUTO_835 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_829 ?AUTO_833 ?AUTO_835 )
      ( DELIVER-PKG ?AUTO_829 ?AUTO_830 )
      ( DELIVER-PKG-VERIFY ?AUTO_829 ?AUTO_830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_836 - OBJ
      ?AUTO_837 - LOCATION
    )
    :vars
    (
      ?AUTO_840 - LOCATION
      ?AUTO_839 - AIRPLANE
      ?AUTO_838 - LOCATION
      ?AUTO_841 - CITY
      ?AUTO_842 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_840 ) ( AIRPORT ?AUTO_837 ) ( AIRPLANE-AT ?AUTO_839 ?AUTO_840 ) ( not ( = ?AUTO_840 ?AUTO_837 ) ) ( IN-CITY ?AUTO_838 ?AUTO_841 ) ( IN-CITY ?AUTO_840 ?AUTO_841 ) ( not ( = ?AUTO_840 ?AUTO_838 ) ) ( not ( = ?AUTO_837 ?AUTO_838 ) ) ( OBJ-AT ?AUTO_836 ?AUTO_838 ) ( TRUCK-AT ?AUTO_842 ?AUTO_840 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_842 ?AUTO_840 ?AUTO_838 ?AUTO_841 )
      ( DELIVER-PKG ?AUTO_836 ?AUTO_837 )
      ( DELIVER-PKG-VERIFY ?AUTO_836 ?AUTO_837 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_859 - OBJ
      ?AUTO_860 - LOCATION
    )
    :vars
    (
      ?AUTO_861 - LOCATION
      ?AUTO_863 - LOCATION
      ?AUTO_864 - CITY
      ?AUTO_862 - TRUCK
      ?AUTO_866 - LOCATION
      ?AUTO_865 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_861 ) ( AIRPORT ?AUTO_860 ) ( not ( = ?AUTO_861 ?AUTO_860 ) ) ( IN-CITY ?AUTO_863 ?AUTO_864 ) ( IN-CITY ?AUTO_861 ?AUTO_864 ) ( not ( = ?AUTO_861 ?AUTO_863 ) ) ( not ( = ?AUTO_860 ?AUTO_863 ) ) ( OBJ-AT ?AUTO_859 ?AUTO_863 ) ( TRUCK-AT ?AUTO_862 ?AUTO_861 ) ( AIRPORT ?AUTO_866 ) ( AIRPLANE-AT ?AUTO_865 ?AUTO_866 ) ( not ( = ?AUTO_866 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_866 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_865 ?AUTO_866 ?AUTO_861 )
      ( DELIVER-PKG ?AUTO_859 ?AUTO_860 )
      ( DELIVER-PKG-VERIFY ?AUTO_859 ?AUTO_860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_869 - OBJ
      ?AUTO_870 - LOCATION
    )
    :vars
    (
      ?AUTO_871 - LOCATION
      ?AUTO_876 - LOCATION
      ?AUTO_875 - CITY
      ?AUTO_872 - TRUCK
      ?AUTO_873 - LOCATION
      ?AUTO_874 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_871 ) ( AIRPORT ?AUTO_870 ) ( not ( = ?AUTO_871 ?AUTO_870 ) ) ( IN-CITY ?AUTO_876 ?AUTO_875 ) ( IN-CITY ?AUTO_871 ?AUTO_875 ) ( not ( = ?AUTO_871 ?AUTO_876 ) ) ( not ( = ?AUTO_870 ?AUTO_876 ) ) ( OBJ-AT ?AUTO_869 ?AUTO_876 ) ( TRUCK-AT ?AUTO_872 ?AUTO_871 ) ( AIRPORT ?AUTO_873 ) ( not ( = ?AUTO_873 ?AUTO_871 ) ) ( not ( = ?AUTO_870 ?AUTO_873 ) ) ( not ( = ?AUTO_876 ?AUTO_873 ) ) ( AIRPLANE-AT ?AUTO_874 ?AUTO_870 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_874 ?AUTO_870 ?AUTO_873 )
      ( DELIVER-PKG ?AUTO_869 ?AUTO_870 )
      ( DELIVER-PKG-VERIFY ?AUTO_869 ?AUTO_870 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_879 - OBJ
      ?AUTO_880 - LOCATION
    )
    :vars
    (
      ?AUTO_881 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_881 ?AUTO_880 ) ( IN-TRUCK ?AUTO_879 ?AUTO_881 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_879 ?AUTO_881 ?AUTO_880 )
      ( DELIVER-PKG-VERIFY ?AUTO_879 ?AUTO_880 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_884 - OBJ
      ?AUTO_885 - LOCATION
    )
    :vars
    (
      ?AUTO_886 - TRUCK
      ?AUTO_887 - LOCATION
      ?AUTO_888 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_884 ?AUTO_886 ) ( TRUCK-AT ?AUTO_886 ?AUTO_887 ) ( IN-CITY ?AUTO_887 ?AUTO_888 ) ( IN-CITY ?AUTO_885 ?AUTO_888 ) ( not ( = ?AUTO_885 ?AUTO_887 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_886 ?AUTO_887 ?AUTO_885 ?AUTO_888 )
      ( DELIVER-PKG ?AUTO_884 ?AUTO_885 )
      ( DELIVER-PKG-VERIFY ?AUTO_884 ?AUTO_885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_889 - OBJ
      ?AUTO_890 - LOCATION
    )
    :vars
    (
      ?AUTO_891 - TRUCK
      ?AUTO_892 - LOCATION
      ?AUTO_893 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_891 ?AUTO_892 ) ( IN-CITY ?AUTO_892 ?AUTO_893 ) ( IN-CITY ?AUTO_890 ?AUTO_893 ) ( not ( = ?AUTO_890 ?AUTO_892 ) ) ( OBJ-AT ?AUTO_889 ?AUTO_892 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_889 ?AUTO_891 ?AUTO_892 )
      ( DELIVER-PKG ?AUTO_889 ?AUTO_890 )
      ( DELIVER-PKG-VERIFY ?AUTO_889 ?AUTO_890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_896 - OBJ
      ?AUTO_897 - LOCATION
    )
    :vars
    (
      ?AUTO_898 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_896 ?AUTO_898 ) ( AIRPLANE-AT ?AUTO_898 ?AUTO_897 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_896 ?AUTO_898 ?AUTO_897 )
      ( DELIVER-PKG-VERIFY ?AUTO_896 ?AUTO_897 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_899 - OBJ
      ?AUTO_900 - LOCATION
    )
    :vars
    (
      ?AUTO_901 - AIRPLANE
      ?AUTO_902 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_899 ?AUTO_901 ) ( AIRPORT ?AUTO_902 ) ( AIRPORT ?AUTO_900 ) ( AIRPLANE-AT ?AUTO_901 ?AUTO_902 ) ( not ( = ?AUTO_902 ?AUTO_900 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_901 ?AUTO_902 ?AUTO_900 )
      ( DELIVER-PKG ?AUTO_899 ?AUTO_900 )
      ( DELIVER-PKG-VERIFY ?AUTO_899 ?AUTO_900 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_903 - OBJ
      ?AUTO_904 - LOCATION
    )
    :vars
    (
      ?AUTO_906 - LOCATION
      ?AUTO_905 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_906 ) ( AIRPORT ?AUTO_904 ) ( AIRPLANE-AT ?AUTO_905 ?AUTO_906 ) ( not ( = ?AUTO_906 ?AUTO_904 ) ) ( OBJ-AT ?AUTO_903 ?AUTO_906 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_903 ?AUTO_905 ?AUTO_906 )
      ( DELIVER-PKG ?AUTO_903 ?AUTO_904 )
      ( DELIVER-PKG-VERIFY ?AUTO_903 ?AUTO_904 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_917 - OBJ
      ?AUTO_918 - LOCATION
    )
    :vars
    (
      ?AUTO_919 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_919 ?AUTO_918 ) ( IN-TRUCK ?AUTO_917 ?AUTO_919 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_917 ?AUTO_919 ?AUTO_918 )
      ( DELIVER-PKG-VERIFY ?AUTO_917 ?AUTO_918 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_926 - OBJ
      ?AUTO_927 - LOCATION
    )
    :vars
    (
      ?AUTO_928 - TRUCK
      ?AUTO_929 - LOCATION
      ?AUTO_930 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_926 ?AUTO_928 ) ( TRUCK-AT ?AUTO_928 ?AUTO_929 ) ( IN-CITY ?AUTO_929 ?AUTO_930 ) ( IN-CITY ?AUTO_927 ?AUTO_930 ) ( not ( = ?AUTO_927 ?AUTO_929 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_928 ?AUTO_929 ?AUTO_927 ?AUTO_930 )
      ( DELIVER-PKG ?AUTO_926 ?AUTO_927 )
      ( DELIVER-PKG-VERIFY ?AUTO_926 ?AUTO_927 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_931 - OBJ
      ?AUTO_932 - LOCATION
    )
    :vars
    (
      ?AUTO_933 - TRUCK
      ?AUTO_934 - LOCATION
      ?AUTO_935 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_933 ?AUTO_934 ) ( IN-CITY ?AUTO_934 ?AUTO_935 ) ( IN-CITY ?AUTO_932 ?AUTO_935 ) ( not ( = ?AUTO_932 ?AUTO_934 ) ) ( OBJ-AT ?AUTO_931 ?AUTO_934 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_931 ?AUTO_933 ?AUTO_934 )
      ( DELIVER-PKG ?AUTO_931 ?AUTO_932 )
      ( DELIVER-PKG-VERIFY ?AUTO_931 ?AUTO_932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_936 - OBJ
      ?AUTO_937 - LOCATION
    )
    :vars
    (
      ?AUTO_939 - TRUCK
      ?AUTO_938 - LOCATION
      ?AUTO_940 - CITY
      ?AUTO_941 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_939 ?AUTO_938 ) ( IN-CITY ?AUTO_938 ?AUTO_940 ) ( IN-CITY ?AUTO_937 ?AUTO_940 ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( IN-AIRPLANE ?AUTO_936 ?AUTO_941 ) ( AIRPLANE-AT ?AUTO_941 ?AUTO_938 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_936 ?AUTO_941 ?AUTO_938 )
      ( DELIVER-PKG ?AUTO_936 ?AUTO_937 )
      ( DELIVER-PKG-VERIFY ?AUTO_936 ?AUTO_937 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_942 - OBJ
      ?AUTO_943 - LOCATION
    )
    :vars
    (
      ?AUTO_944 - TRUCK
      ?AUTO_946 - LOCATION
      ?AUTO_945 - CITY
      ?AUTO_947 - AIRPLANE
      ?AUTO_948 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_944 ?AUTO_946 ) ( IN-CITY ?AUTO_946 ?AUTO_945 ) ( IN-CITY ?AUTO_943 ?AUTO_945 ) ( not ( = ?AUTO_943 ?AUTO_946 ) ) ( IN-AIRPLANE ?AUTO_942 ?AUTO_947 ) ( AIRPORT ?AUTO_948 ) ( AIRPORT ?AUTO_946 ) ( AIRPLANE-AT ?AUTO_947 ?AUTO_948 ) ( not ( = ?AUTO_948 ?AUTO_946 ) ) ( not ( = ?AUTO_943 ?AUTO_948 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_947 ?AUTO_948 ?AUTO_946 )
      ( DELIVER-PKG ?AUTO_942 ?AUTO_943 )
      ( DELIVER-PKG-VERIFY ?AUTO_942 ?AUTO_943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_949 - OBJ
      ?AUTO_950 - LOCATION
    )
    :vars
    (
      ?AUTO_952 - TRUCK
      ?AUTO_953 - LOCATION
      ?AUTO_951 - CITY
      ?AUTO_954 - LOCATION
      ?AUTO_955 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_952 ?AUTO_953 ) ( IN-CITY ?AUTO_953 ?AUTO_951 ) ( IN-CITY ?AUTO_950 ?AUTO_951 ) ( not ( = ?AUTO_950 ?AUTO_953 ) ) ( AIRPORT ?AUTO_954 ) ( AIRPORT ?AUTO_953 ) ( AIRPLANE-AT ?AUTO_955 ?AUTO_954 ) ( not ( = ?AUTO_954 ?AUTO_953 ) ) ( not ( = ?AUTO_950 ?AUTO_954 ) ) ( OBJ-AT ?AUTO_949 ?AUTO_954 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_949 ?AUTO_955 ?AUTO_954 )
      ( DELIVER-PKG ?AUTO_949 ?AUTO_950 )
      ( DELIVER-PKG-VERIFY ?AUTO_949 ?AUTO_950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_966 - OBJ
      ?AUTO_967 - LOCATION
    )
    :vars
    (
      ?AUTO_968 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_966 ?AUTO_968 ) ( AIRPLANE-AT ?AUTO_968 ?AUTO_967 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_966 ?AUTO_968 ?AUTO_967 )
      ( DELIVER-PKG-VERIFY ?AUTO_966 ?AUTO_967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_973 - OBJ
      ?AUTO_974 - LOCATION
    )
    :vars
    (
      ?AUTO_975 - AIRPLANE
      ?AUTO_976 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_973 ?AUTO_975 ) ( AIRPORT ?AUTO_976 ) ( AIRPORT ?AUTO_974 ) ( AIRPLANE-AT ?AUTO_975 ?AUTO_976 ) ( not ( = ?AUTO_976 ?AUTO_974 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_975 ?AUTO_976 ?AUTO_974 )
      ( DELIVER-PKG ?AUTO_973 ?AUTO_974 )
      ( DELIVER-PKG-VERIFY ?AUTO_973 ?AUTO_974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_977 - OBJ
      ?AUTO_978 - LOCATION
    )
    :vars
    (
      ?AUTO_980 - LOCATION
      ?AUTO_979 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_980 ) ( AIRPORT ?AUTO_978 ) ( AIRPLANE-AT ?AUTO_979 ?AUTO_980 ) ( not ( = ?AUTO_980 ?AUTO_978 ) ) ( OBJ-AT ?AUTO_977 ?AUTO_980 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_977 ?AUTO_979 ?AUTO_980 )
      ( DELIVER-PKG ?AUTO_977 ?AUTO_978 )
      ( DELIVER-PKG-VERIFY ?AUTO_977 ?AUTO_978 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_987 - OBJ
      ?AUTO_988 - LOCATION
    )
    :vars
    (
      ?AUTO_989 - LOCATION
      ?AUTO_991 - LOCATION
      ?AUTO_990 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_989 ) ( AIRPORT ?AUTO_988 ) ( not ( = ?AUTO_989 ?AUTO_988 ) ) ( OBJ-AT ?AUTO_987 ?AUTO_989 ) ( AIRPORT ?AUTO_991 ) ( AIRPLANE-AT ?AUTO_990 ?AUTO_991 ) ( not ( = ?AUTO_991 ?AUTO_989 ) ) ( not ( = ?AUTO_988 ?AUTO_991 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_990 ?AUTO_991 ?AUTO_989 )
      ( DELIVER-PKG ?AUTO_987 ?AUTO_988 )
      ( DELIVER-PKG-VERIFY ?AUTO_987 ?AUTO_988 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1004 - OBJ
      ?AUTO_1005 - LOCATION
    )
    :vars
    (
      ?AUTO_1006 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1006 ?AUTO_1005 ) ( IN-TRUCK ?AUTO_1004 ?AUTO_1006 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1004 ?AUTO_1006 ?AUTO_1005 )
      ( DELIVER-PKG-VERIFY ?AUTO_1004 ?AUTO_1005 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1007 - OBJ
      ?AUTO_1008 - LOCATION
    )
    :vars
    (
      ?AUTO_1009 - TRUCK
      ?AUTO_1010 - LOCATION
      ?AUTO_1011 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1007 ?AUTO_1009 ) ( TRUCK-AT ?AUTO_1009 ?AUTO_1010 ) ( IN-CITY ?AUTO_1010 ?AUTO_1011 ) ( IN-CITY ?AUTO_1008 ?AUTO_1011 ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1009 ?AUTO_1010 ?AUTO_1008 ?AUTO_1011 )
      ( DELIVER-PKG ?AUTO_1007 ?AUTO_1008 )
      ( DELIVER-PKG-VERIFY ?AUTO_1007 ?AUTO_1008 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1044 - OBJ
      ?AUTO_1045 - LOCATION
    )
    :vars
    (
      ?AUTO_1046 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1044 ?AUTO_1046 ) ( AIRPLANE-AT ?AUTO_1046 ?AUTO_1045 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1044 ?AUTO_1046 ?AUTO_1045 )
      ( DELIVER-PKG-VERIFY ?AUTO_1044 ?AUTO_1045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1055 - OBJ
      ?AUTO_1056 - LOCATION
    )
    :vars
    (
      ?AUTO_1057 - AIRPLANE
      ?AUTO_1058 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1055 ?AUTO_1057 ) ( AIRPORT ?AUTO_1058 ) ( AIRPORT ?AUTO_1056 ) ( AIRPLANE-AT ?AUTO_1057 ?AUTO_1058 ) ( not ( = ?AUTO_1058 ?AUTO_1056 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1057 ?AUTO_1058 ?AUTO_1056 )
      ( DELIVER-PKG ?AUTO_1055 ?AUTO_1056 )
      ( DELIVER-PKG-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1063 - OBJ
      ?AUTO_1064 - LOCATION
    )
    :vars
    (
      ?AUTO_1065 - LOCATION
      ?AUTO_1066 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1065 ) ( AIRPORT ?AUTO_1064 ) ( AIRPLANE-AT ?AUTO_1066 ?AUTO_1065 ) ( not ( = ?AUTO_1065 ?AUTO_1064 ) ) ( OBJ-AT ?AUTO_1063 ?AUTO_1065 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1063 ?AUTO_1066 ?AUTO_1065 )
      ( DELIVER-PKG ?AUTO_1063 ?AUTO_1064 )
      ( DELIVER-PKG-VERIFY ?AUTO_1063 ?AUTO_1064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1067 - OBJ
      ?AUTO_1068 - LOCATION
    )
    :vars
    (
      ?AUTO_1070 - LOCATION
      ?AUTO_1071 - LOCATION
      ?AUTO_1069 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1070 ) ( AIRPORT ?AUTO_1068 ) ( not ( = ?AUTO_1070 ?AUTO_1068 ) ) ( OBJ-AT ?AUTO_1067 ?AUTO_1070 ) ( AIRPORT ?AUTO_1071 ) ( AIRPLANE-AT ?AUTO_1069 ?AUTO_1071 ) ( not ( = ?AUTO_1071 ?AUTO_1070 ) ) ( not ( = ?AUTO_1068 ?AUTO_1071 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1069 ?AUTO_1071 ?AUTO_1070 )
      ( DELIVER-PKG ?AUTO_1067 ?AUTO_1068 )
      ( DELIVER-PKG-VERIFY ?AUTO_1067 ?AUTO_1068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1084 - OBJ
      ?AUTO_1085 - LOCATION
    )
    :vars
    (
      ?AUTO_1088 - LOCATION
      ?AUTO_1087 - LOCATION
      ?AUTO_1086 - AIRPLANE
      ?AUTO_1089 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1088 ) ( AIRPORT ?AUTO_1085 ) ( not ( = ?AUTO_1088 ?AUTO_1085 ) ) ( AIRPORT ?AUTO_1087 ) ( AIRPLANE-AT ?AUTO_1086 ?AUTO_1087 ) ( not ( = ?AUTO_1087 ?AUTO_1088 ) ) ( not ( = ?AUTO_1085 ?AUTO_1087 ) ) ( TRUCK-AT ?AUTO_1089 ?AUTO_1088 ) ( IN-TRUCK ?AUTO_1084 ?AUTO_1089 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1084 ?AUTO_1089 ?AUTO_1088 )
      ( DELIVER-PKG ?AUTO_1084 ?AUTO_1085 )
      ( DELIVER-PKG-VERIFY ?AUTO_1084 ?AUTO_1085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1092 - OBJ
      ?AUTO_1093 - LOCATION
    )
    :vars
    (
      ?AUTO_1096 - LOCATION
      ?AUTO_1094 - LOCATION
      ?AUTO_1097 - AIRPLANE
      ?AUTO_1095 - TRUCK
      ?AUTO_1098 - LOCATION
      ?AUTO_1099 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1096 ) ( AIRPORT ?AUTO_1093 ) ( not ( = ?AUTO_1096 ?AUTO_1093 ) ) ( AIRPORT ?AUTO_1094 ) ( AIRPLANE-AT ?AUTO_1097 ?AUTO_1094 ) ( not ( = ?AUTO_1094 ?AUTO_1096 ) ) ( not ( = ?AUTO_1093 ?AUTO_1094 ) ) ( IN-TRUCK ?AUTO_1092 ?AUTO_1095 ) ( TRUCK-AT ?AUTO_1095 ?AUTO_1098 ) ( IN-CITY ?AUTO_1098 ?AUTO_1099 ) ( IN-CITY ?AUTO_1096 ?AUTO_1099 ) ( not ( = ?AUTO_1096 ?AUTO_1098 ) ) ( not ( = ?AUTO_1093 ?AUTO_1098 ) ) ( not ( = ?AUTO_1094 ?AUTO_1098 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1095 ?AUTO_1098 ?AUTO_1096 ?AUTO_1099 )
      ( DELIVER-PKG ?AUTO_1092 ?AUTO_1093 )
      ( DELIVER-PKG-VERIFY ?AUTO_1092 ?AUTO_1093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1100 - OBJ
      ?AUTO_1101 - LOCATION
    )
    :vars
    (
      ?AUTO_1107 - LOCATION
      ?AUTO_1104 - LOCATION
      ?AUTO_1103 - AIRPLANE
      ?AUTO_1102 - TRUCK
      ?AUTO_1106 - LOCATION
      ?AUTO_1105 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1107 ) ( AIRPORT ?AUTO_1101 ) ( not ( = ?AUTO_1107 ?AUTO_1101 ) ) ( AIRPORT ?AUTO_1104 ) ( AIRPLANE-AT ?AUTO_1103 ?AUTO_1104 ) ( not ( = ?AUTO_1104 ?AUTO_1107 ) ) ( not ( = ?AUTO_1101 ?AUTO_1104 ) ) ( TRUCK-AT ?AUTO_1102 ?AUTO_1106 ) ( IN-CITY ?AUTO_1106 ?AUTO_1105 ) ( IN-CITY ?AUTO_1107 ?AUTO_1105 ) ( not ( = ?AUTO_1107 ?AUTO_1106 ) ) ( not ( = ?AUTO_1101 ?AUTO_1106 ) ) ( not ( = ?AUTO_1104 ?AUTO_1106 ) ) ( OBJ-AT ?AUTO_1100 ?AUTO_1106 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1100 ?AUTO_1102 ?AUTO_1106 )
      ( DELIVER-PKG ?AUTO_1100 ?AUTO_1101 )
      ( DELIVER-PKG-VERIFY ?AUTO_1100 ?AUTO_1101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1110 - OBJ
      ?AUTO_1111 - LOCATION
    )
    :vars
    (
      ?AUTO_1112 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1110 ?AUTO_1112 ) ( AIRPLANE-AT ?AUTO_1112 ?AUTO_1111 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1110 ?AUTO_1112 ?AUTO_1111 )
      ( DELIVER-PKG-VERIFY ?AUTO_1110 ?AUTO_1111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1115 - OBJ
      ?AUTO_1116 - LOCATION
    )
    :vars
    (
      ?AUTO_1117 - AIRPLANE
      ?AUTO_1118 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1115 ?AUTO_1117 ) ( AIRPORT ?AUTO_1118 ) ( AIRPORT ?AUTO_1116 ) ( AIRPLANE-AT ?AUTO_1117 ?AUTO_1118 ) ( not ( = ?AUTO_1118 ?AUTO_1116 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1117 ?AUTO_1118 ?AUTO_1116 )
      ( DELIVER-PKG ?AUTO_1115 ?AUTO_1116 )
      ( DELIVER-PKG-VERIFY ?AUTO_1115 ?AUTO_1116 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1119 - OBJ
      ?AUTO_1120 - LOCATION
    )
    :vars
    (
      ?AUTO_1122 - LOCATION
      ?AUTO_1121 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1122 ) ( AIRPORT ?AUTO_1120 ) ( AIRPLANE-AT ?AUTO_1121 ?AUTO_1122 ) ( not ( = ?AUTO_1122 ?AUTO_1120 ) ) ( OBJ-AT ?AUTO_1119 ?AUTO_1122 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1119 ?AUTO_1121 ?AUTO_1122 )
      ( DELIVER-PKG ?AUTO_1119 ?AUTO_1120 )
      ( DELIVER-PKG-VERIFY ?AUTO_1119 ?AUTO_1120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1123 - OBJ
      ?AUTO_1124 - LOCATION
    )
    :vars
    (
      ?AUTO_1125 - LOCATION
      ?AUTO_1126 - AIRPLANE
      ?AUTO_1127 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1125 ) ( AIRPORT ?AUTO_1124 ) ( AIRPLANE-AT ?AUTO_1126 ?AUTO_1125 ) ( not ( = ?AUTO_1125 ?AUTO_1124 ) ) ( TRUCK-AT ?AUTO_1127 ?AUTO_1125 ) ( IN-TRUCK ?AUTO_1123 ?AUTO_1127 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1123 ?AUTO_1127 ?AUTO_1125 )
      ( DELIVER-PKG ?AUTO_1123 ?AUTO_1124 )
      ( DELIVER-PKG-VERIFY ?AUTO_1123 ?AUTO_1124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1128 - OBJ
      ?AUTO_1129 - LOCATION
    )
    :vars
    (
      ?AUTO_1130 - LOCATION
      ?AUTO_1131 - AIRPLANE
      ?AUTO_1132 - TRUCK
      ?AUTO_1133 - LOCATION
      ?AUTO_1134 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1130 ) ( AIRPORT ?AUTO_1129 ) ( AIRPLANE-AT ?AUTO_1131 ?AUTO_1130 ) ( not ( = ?AUTO_1130 ?AUTO_1129 ) ) ( IN-TRUCK ?AUTO_1128 ?AUTO_1132 ) ( TRUCK-AT ?AUTO_1132 ?AUTO_1133 ) ( IN-CITY ?AUTO_1133 ?AUTO_1134 ) ( IN-CITY ?AUTO_1130 ?AUTO_1134 ) ( not ( = ?AUTO_1130 ?AUTO_1133 ) ) ( not ( = ?AUTO_1129 ?AUTO_1133 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1132 ?AUTO_1133 ?AUTO_1130 ?AUTO_1134 )
      ( DELIVER-PKG ?AUTO_1128 ?AUTO_1129 )
      ( DELIVER-PKG-VERIFY ?AUTO_1128 ?AUTO_1129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1159 - OBJ
      ?AUTO_1160 - LOCATION
    )
    :vars
    (
      ?AUTO_1162 - LOCATION
      ?AUTO_1161 - AIRPLANE
      ?AUTO_1164 - TRUCK
      ?AUTO_1165 - LOCATION
      ?AUTO_1163 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1162 ) ( AIRPORT ?AUTO_1160 ) ( AIRPLANE-AT ?AUTO_1161 ?AUTO_1162 ) ( not ( = ?AUTO_1162 ?AUTO_1160 ) ) ( TRUCK-AT ?AUTO_1164 ?AUTO_1165 ) ( IN-CITY ?AUTO_1165 ?AUTO_1163 ) ( IN-CITY ?AUTO_1162 ?AUTO_1163 ) ( not ( = ?AUTO_1162 ?AUTO_1165 ) ) ( not ( = ?AUTO_1160 ?AUTO_1165 ) ) ( OBJ-AT ?AUTO_1159 ?AUTO_1165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1159 ?AUTO_1164 ?AUTO_1165 )
      ( DELIVER-PKG ?AUTO_1159 ?AUTO_1160 )
      ( DELIVER-PKG-VERIFY ?AUTO_1159 ?AUTO_1160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1172 - OBJ
      ?AUTO_1173 - LOCATION
    )
    :vars
    (
      ?AUTO_1174 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1174 ?AUTO_1173 ) ( IN-TRUCK ?AUTO_1172 ?AUTO_1174 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1172 ?AUTO_1174 ?AUTO_1173 )
      ( DELIVER-PKG-VERIFY ?AUTO_1172 ?AUTO_1173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1175 - OBJ
      ?AUTO_1176 - LOCATION
    )
    :vars
    (
      ?AUTO_1177 - TRUCK
      ?AUTO_1178 - LOCATION
      ?AUTO_1179 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1175 ?AUTO_1177 ) ( TRUCK-AT ?AUTO_1177 ?AUTO_1178 ) ( IN-CITY ?AUTO_1178 ?AUTO_1179 ) ( IN-CITY ?AUTO_1176 ?AUTO_1179 ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1177 ?AUTO_1178 ?AUTO_1176 ?AUTO_1179 )
      ( DELIVER-PKG ?AUTO_1175 ?AUTO_1176 )
      ( DELIVER-PKG-VERIFY ?AUTO_1175 ?AUTO_1176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1180 - OBJ
      ?AUTO_1181 - LOCATION
    )
    :vars
    (
      ?AUTO_1182 - TRUCK
      ?AUTO_1183 - LOCATION
      ?AUTO_1184 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1182 ?AUTO_1183 ) ( IN-CITY ?AUTO_1183 ?AUTO_1184 ) ( IN-CITY ?AUTO_1181 ?AUTO_1184 ) ( not ( = ?AUTO_1181 ?AUTO_1183 ) ) ( OBJ-AT ?AUTO_1180 ?AUTO_1183 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1180 ?AUTO_1182 ?AUTO_1183 )
      ( DELIVER-PKG ?AUTO_1180 ?AUTO_1181 )
      ( DELIVER-PKG-VERIFY ?AUTO_1180 ?AUTO_1181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1187 - OBJ
      ?AUTO_1188 - LOCATION
    )
    :vars
    (
      ?AUTO_1189 - TRUCK
      ?AUTO_1191 - LOCATION
      ?AUTO_1190 - CITY
      ?AUTO_1192 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1189 ?AUTO_1191 ) ( IN-CITY ?AUTO_1191 ?AUTO_1190 ) ( IN-CITY ?AUTO_1188 ?AUTO_1190 ) ( not ( = ?AUTO_1188 ?AUTO_1191 ) ) ( IN-AIRPLANE ?AUTO_1187 ?AUTO_1192 ) ( AIRPLANE-AT ?AUTO_1192 ?AUTO_1191 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1187 ?AUTO_1192 ?AUTO_1191 )
      ( DELIVER-PKG ?AUTO_1187 ?AUTO_1188 )
      ( DELIVER-PKG-VERIFY ?AUTO_1187 ?AUTO_1188 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1201 - OBJ
      ?AUTO_1202 - LOCATION
    )
    :vars
    (
      ?AUTO_1205 - TRUCK
      ?AUTO_1206 - LOCATION
      ?AUTO_1203 - CITY
      ?AUTO_1204 - AIRPLANE
      ?AUTO_1207 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1205 ?AUTO_1206 ) ( IN-CITY ?AUTO_1206 ?AUTO_1203 ) ( IN-CITY ?AUTO_1202 ?AUTO_1203 ) ( not ( = ?AUTO_1202 ?AUTO_1206 ) ) ( IN-AIRPLANE ?AUTO_1201 ?AUTO_1204 ) ( AIRPORT ?AUTO_1207 ) ( AIRPORT ?AUTO_1206 ) ( AIRPLANE-AT ?AUTO_1204 ?AUTO_1207 ) ( not ( = ?AUTO_1207 ?AUTO_1206 ) ) ( not ( = ?AUTO_1202 ?AUTO_1207 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1204 ?AUTO_1207 ?AUTO_1206 )
      ( DELIVER-PKG ?AUTO_1201 ?AUTO_1202 )
      ( DELIVER-PKG-VERIFY ?AUTO_1201 ?AUTO_1202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1212 - OBJ
      ?AUTO_1213 - LOCATION
    )
    :vars
    (
      ?AUTO_1215 - TRUCK
      ?AUTO_1218 - LOCATION
      ?AUTO_1214 - CITY
      ?AUTO_1217 - LOCATION
      ?AUTO_1216 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1215 ?AUTO_1218 ) ( IN-CITY ?AUTO_1218 ?AUTO_1214 ) ( IN-CITY ?AUTO_1213 ?AUTO_1214 ) ( not ( = ?AUTO_1213 ?AUTO_1218 ) ) ( AIRPORT ?AUTO_1217 ) ( AIRPORT ?AUTO_1218 ) ( AIRPLANE-AT ?AUTO_1216 ?AUTO_1217 ) ( not ( = ?AUTO_1217 ?AUTO_1218 ) ) ( not ( = ?AUTO_1213 ?AUTO_1217 ) ) ( OBJ-AT ?AUTO_1212 ?AUTO_1217 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1212 ?AUTO_1216 ?AUTO_1217 )
      ( DELIVER-PKG ?AUTO_1212 ?AUTO_1213 )
      ( DELIVER-PKG-VERIFY ?AUTO_1212 ?AUTO_1213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1219 - OBJ
      ?AUTO_1220 - LOCATION
    )
    :vars
    (
      ?AUTO_1221 - TRUCK
      ?AUTO_1225 - LOCATION
      ?AUTO_1222 - CITY
      ?AUTO_1223 - LOCATION
      ?AUTO_1226 - LOCATION
      ?AUTO_1224 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1221 ?AUTO_1225 ) ( IN-CITY ?AUTO_1225 ?AUTO_1222 ) ( IN-CITY ?AUTO_1220 ?AUTO_1222 ) ( not ( = ?AUTO_1220 ?AUTO_1225 ) ) ( AIRPORT ?AUTO_1223 ) ( AIRPORT ?AUTO_1225 ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( not ( = ?AUTO_1220 ?AUTO_1223 ) ) ( OBJ-AT ?AUTO_1219 ?AUTO_1223 ) ( AIRPORT ?AUTO_1226 ) ( AIRPLANE-AT ?AUTO_1224 ?AUTO_1226 ) ( not ( = ?AUTO_1226 ?AUTO_1223 ) ) ( not ( = ?AUTO_1220 ?AUTO_1226 ) ) ( not ( = ?AUTO_1225 ?AUTO_1226 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1224 ?AUTO_1226 ?AUTO_1223 )
      ( DELIVER-PKG ?AUTO_1219 ?AUTO_1220 )
      ( DELIVER-PKG-VERIFY ?AUTO_1219 ?AUTO_1220 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1239 - OBJ
      ?AUTO_1240 - LOCATION
    )
    :vars
    (
      ?AUTO_1243 - TRUCK
      ?AUTO_1244 - LOCATION
      ?AUTO_1246 - CITY
      ?AUTO_1242 - LOCATION
      ?AUTO_1245 - LOCATION
      ?AUTO_1241 - AIRPLANE
      ?AUTO_1247 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1243 ?AUTO_1244 ) ( IN-CITY ?AUTO_1244 ?AUTO_1246 ) ( IN-CITY ?AUTO_1240 ?AUTO_1246 ) ( not ( = ?AUTO_1240 ?AUTO_1244 ) ) ( AIRPORT ?AUTO_1242 ) ( AIRPORT ?AUTO_1244 ) ( not ( = ?AUTO_1242 ?AUTO_1244 ) ) ( not ( = ?AUTO_1240 ?AUTO_1242 ) ) ( AIRPORT ?AUTO_1245 ) ( AIRPLANE-AT ?AUTO_1241 ?AUTO_1245 ) ( not ( = ?AUTO_1245 ?AUTO_1242 ) ) ( not ( = ?AUTO_1240 ?AUTO_1245 ) ) ( not ( = ?AUTO_1244 ?AUTO_1245 ) ) ( TRUCK-AT ?AUTO_1247 ?AUTO_1242 ) ( IN-TRUCK ?AUTO_1239 ?AUTO_1247 ) ( not ( = ?AUTO_1243 ?AUTO_1247 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1239 ?AUTO_1247 ?AUTO_1242 )
      ( DELIVER-PKG ?AUTO_1239 ?AUTO_1240 )
      ( DELIVER-PKG-VERIFY ?AUTO_1239 ?AUTO_1240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1250 - OBJ
      ?AUTO_1251 - LOCATION
    )
    :vars
    (
      ?AUTO_1252 - TRUCK
      ?AUTO_1258 - LOCATION
      ?AUTO_1253 - CITY
      ?AUTO_1255 - LOCATION
      ?AUTO_1257 - LOCATION
      ?AUTO_1254 - AIRPLANE
      ?AUTO_1256 - TRUCK
      ?AUTO_1259 - LOCATION
      ?AUTO_1260 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1252 ?AUTO_1258 ) ( IN-CITY ?AUTO_1258 ?AUTO_1253 ) ( IN-CITY ?AUTO_1251 ?AUTO_1253 ) ( not ( = ?AUTO_1251 ?AUTO_1258 ) ) ( AIRPORT ?AUTO_1255 ) ( AIRPORT ?AUTO_1258 ) ( not ( = ?AUTO_1255 ?AUTO_1258 ) ) ( not ( = ?AUTO_1251 ?AUTO_1255 ) ) ( AIRPORT ?AUTO_1257 ) ( AIRPLANE-AT ?AUTO_1254 ?AUTO_1257 ) ( not ( = ?AUTO_1257 ?AUTO_1255 ) ) ( not ( = ?AUTO_1251 ?AUTO_1257 ) ) ( not ( = ?AUTO_1258 ?AUTO_1257 ) ) ( IN-TRUCK ?AUTO_1250 ?AUTO_1256 ) ( not ( = ?AUTO_1252 ?AUTO_1256 ) ) ( TRUCK-AT ?AUTO_1256 ?AUTO_1259 ) ( IN-CITY ?AUTO_1259 ?AUTO_1260 ) ( IN-CITY ?AUTO_1255 ?AUTO_1260 ) ( not ( = ?AUTO_1255 ?AUTO_1259 ) ) ( not ( = ?AUTO_1251 ?AUTO_1259 ) ) ( not ( = ?AUTO_1258 ?AUTO_1259 ) ) ( not ( = ?AUTO_1253 ?AUTO_1260 ) ) ( not ( = ?AUTO_1257 ?AUTO_1259 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1256 ?AUTO_1259 ?AUTO_1255 ?AUTO_1260 )
      ( DELIVER-PKG ?AUTO_1250 ?AUTO_1251 )
      ( DELIVER-PKG-VERIFY ?AUTO_1250 ?AUTO_1251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1261 - OBJ
      ?AUTO_1262 - LOCATION
    )
    :vars
    (
      ?AUTO_1267 - TRUCK
      ?AUTO_1266 - LOCATION
      ?AUTO_1265 - CITY
      ?AUTO_1264 - LOCATION
      ?AUTO_1263 - LOCATION
      ?AUTO_1268 - AIRPLANE
      ?AUTO_1269 - TRUCK
      ?AUTO_1270 - LOCATION
      ?AUTO_1271 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1267 ?AUTO_1266 ) ( IN-CITY ?AUTO_1266 ?AUTO_1265 ) ( IN-CITY ?AUTO_1262 ?AUTO_1265 ) ( not ( = ?AUTO_1262 ?AUTO_1266 ) ) ( AIRPORT ?AUTO_1264 ) ( AIRPORT ?AUTO_1266 ) ( not ( = ?AUTO_1264 ?AUTO_1266 ) ) ( not ( = ?AUTO_1262 ?AUTO_1264 ) ) ( AIRPORT ?AUTO_1263 ) ( AIRPLANE-AT ?AUTO_1268 ?AUTO_1263 ) ( not ( = ?AUTO_1263 ?AUTO_1264 ) ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1266 ?AUTO_1263 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( TRUCK-AT ?AUTO_1269 ?AUTO_1270 ) ( IN-CITY ?AUTO_1270 ?AUTO_1271 ) ( IN-CITY ?AUTO_1264 ?AUTO_1271 ) ( not ( = ?AUTO_1264 ?AUTO_1270 ) ) ( not ( = ?AUTO_1262 ?AUTO_1270 ) ) ( not ( = ?AUTO_1266 ?AUTO_1270 ) ) ( not ( = ?AUTO_1265 ?AUTO_1271 ) ) ( not ( = ?AUTO_1263 ?AUTO_1270 ) ) ( OBJ-AT ?AUTO_1261 ?AUTO_1270 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1261 ?AUTO_1269 ?AUTO_1270 )
      ( DELIVER-PKG ?AUTO_1261 ?AUTO_1262 )
      ( DELIVER-PKG-VERIFY ?AUTO_1261 ?AUTO_1262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1274 - OBJ
      ?AUTO_1275 - LOCATION
    )
    :vars
    (
      ?AUTO_1276 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1276 ?AUTO_1275 ) ( IN-TRUCK ?AUTO_1274 ?AUTO_1276 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1274 ?AUTO_1276 ?AUTO_1275 )
      ( DELIVER-PKG-VERIFY ?AUTO_1274 ?AUTO_1275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1277 - OBJ
      ?AUTO_1278 - LOCATION
    )
    :vars
    (
      ?AUTO_1279 - TRUCK
      ?AUTO_1280 - LOCATION
      ?AUTO_1281 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1277 ?AUTO_1279 ) ( TRUCK-AT ?AUTO_1279 ?AUTO_1280 ) ( IN-CITY ?AUTO_1280 ?AUTO_1281 ) ( IN-CITY ?AUTO_1278 ?AUTO_1281 ) ( not ( = ?AUTO_1278 ?AUTO_1280 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1279 ?AUTO_1280 ?AUTO_1278 ?AUTO_1281 )
      ( DELIVER-PKG ?AUTO_1277 ?AUTO_1278 )
      ( DELIVER-PKG-VERIFY ?AUTO_1277 ?AUTO_1278 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1282 - OBJ
      ?AUTO_1283 - LOCATION
    )
    :vars
    (
      ?AUTO_1286 - TRUCK
      ?AUTO_1284 - LOCATION
      ?AUTO_1285 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1286 ?AUTO_1284 ) ( IN-CITY ?AUTO_1284 ?AUTO_1285 ) ( IN-CITY ?AUTO_1283 ?AUTO_1285 ) ( not ( = ?AUTO_1283 ?AUTO_1284 ) ) ( OBJ-AT ?AUTO_1282 ?AUTO_1284 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1282 ?AUTO_1286 ?AUTO_1284 )
      ( DELIVER-PKG ?AUTO_1282 ?AUTO_1283 )
      ( DELIVER-PKG-VERIFY ?AUTO_1282 ?AUTO_1283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1287 - OBJ
      ?AUTO_1288 - LOCATION
    )
    :vars
    (
      ?AUTO_1290 - LOCATION
      ?AUTO_1291 - CITY
      ?AUTO_1289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1290 ?AUTO_1291 ) ( IN-CITY ?AUTO_1288 ?AUTO_1291 ) ( not ( = ?AUTO_1288 ?AUTO_1290 ) ) ( OBJ-AT ?AUTO_1287 ?AUTO_1290 ) ( TRUCK-AT ?AUTO_1289 ?AUTO_1288 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1289 ?AUTO_1288 ?AUTO_1290 ?AUTO_1291 )
      ( DELIVER-PKG ?AUTO_1287 ?AUTO_1288 )
      ( DELIVER-PKG-VERIFY ?AUTO_1287 ?AUTO_1288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1298 - OBJ
      ?AUTO_1299 - LOCATION
    )
    :vars
    (
      ?AUTO_1302 - LOCATION
      ?AUTO_1300 - CITY
      ?AUTO_1301 - TRUCK
      ?AUTO_1303 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1302 ?AUTO_1300 ) ( IN-CITY ?AUTO_1299 ?AUTO_1300 ) ( not ( = ?AUTO_1299 ?AUTO_1302 ) ) ( TRUCK-AT ?AUTO_1301 ?AUTO_1299 ) ( IN-AIRPLANE ?AUTO_1298 ?AUTO_1303 ) ( AIRPLANE-AT ?AUTO_1303 ?AUTO_1302 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1298 ?AUTO_1303 ?AUTO_1302 )
      ( DELIVER-PKG ?AUTO_1298 ?AUTO_1299 )
      ( DELIVER-PKG-VERIFY ?AUTO_1298 ?AUTO_1299 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1306 - OBJ
      ?AUTO_1307 - LOCATION
    )
    :vars
    (
      ?AUTO_1308 - LOCATION
      ?AUTO_1310 - CITY
      ?AUTO_1311 - TRUCK
      ?AUTO_1309 - AIRPLANE
      ?AUTO_1312 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1308 ?AUTO_1310 ) ( IN-CITY ?AUTO_1307 ?AUTO_1310 ) ( not ( = ?AUTO_1307 ?AUTO_1308 ) ) ( TRUCK-AT ?AUTO_1311 ?AUTO_1307 ) ( IN-AIRPLANE ?AUTO_1306 ?AUTO_1309 ) ( AIRPORT ?AUTO_1312 ) ( AIRPORT ?AUTO_1308 ) ( AIRPLANE-AT ?AUTO_1309 ?AUTO_1312 ) ( not ( = ?AUTO_1312 ?AUTO_1308 ) ) ( not ( = ?AUTO_1307 ?AUTO_1312 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1309 ?AUTO_1312 ?AUTO_1308 )
      ( DELIVER-PKG ?AUTO_1306 ?AUTO_1307 )
      ( DELIVER-PKG-VERIFY ?AUTO_1306 ?AUTO_1307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1313 - OBJ
      ?AUTO_1314 - LOCATION
    )
    :vars
    (
      ?AUTO_1319 - LOCATION
      ?AUTO_1316 - CITY
      ?AUTO_1318 - TRUCK
      ?AUTO_1317 - LOCATION
      ?AUTO_1315 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1319 ?AUTO_1316 ) ( IN-CITY ?AUTO_1314 ?AUTO_1316 ) ( not ( = ?AUTO_1314 ?AUTO_1319 ) ) ( TRUCK-AT ?AUTO_1318 ?AUTO_1314 ) ( AIRPORT ?AUTO_1317 ) ( AIRPORT ?AUTO_1319 ) ( AIRPLANE-AT ?AUTO_1315 ?AUTO_1317 ) ( not ( = ?AUTO_1317 ?AUTO_1319 ) ) ( not ( = ?AUTO_1314 ?AUTO_1317 ) ) ( OBJ-AT ?AUTO_1313 ?AUTO_1317 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1313 ?AUTO_1315 ?AUTO_1317 )
      ( DELIVER-PKG ?AUTO_1313 ?AUTO_1314 )
      ( DELIVER-PKG-VERIFY ?AUTO_1313 ?AUTO_1314 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1320 - OBJ
      ?AUTO_1321 - LOCATION
    )
    :vars
    (
      ?AUTO_1324 - LOCATION
      ?AUTO_1326 - CITY
      ?AUTO_1323 - TRUCK
      ?AUTO_1322 - LOCATION
      ?AUTO_1325 - AIRPLANE
      ?AUTO_1327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1324 ?AUTO_1326 ) ( IN-CITY ?AUTO_1321 ?AUTO_1326 ) ( not ( = ?AUTO_1321 ?AUTO_1324 ) ) ( TRUCK-AT ?AUTO_1323 ?AUTO_1321 ) ( AIRPORT ?AUTO_1322 ) ( AIRPORT ?AUTO_1324 ) ( AIRPLANE-AT ?AUTO_1325 ?AUTO_1322 ) ( not ( = ?AUTO_1322 ?AUTO_1324 ) ) ( not ( = ?AUTO_1321 ?AUTO_1322 ) ) ( TRUCK-AT ?AUTO_1327 ?AUTO_1322 ) ( IN-TRUCK ?AUTO_1320 ?AUTO_1327 ) ( not ( = ?AUTO_1323 ?AUTO_1327 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1320 ?AUTO_1327 ?AUTO_1322 )
      ( DELIVER-PKG ?AUTO_1320 ?AUTO_1321 )
      ( DELIVER-PKG-VERIFY ?AUTO_1320 ?AUTO_1321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1328 - OBJ
      ?AUTO_1329 - LOCATION
    )
    :vars
    (
      ?AUTO_1330 - LOCATION
      ?AUTO_1333 - CITY
      ?AUTO_1334 - TRUCK
      ?AUTO_1331 - LOCATION
      ?AUTO_1332 - AIRPLANE
      ?AUTO_1335 - TRUCK
      ?AUTO_1336 - LOCATION
      ?AUTO_1337 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1330 ?AUTO_1333 ) ( IN-CITY ?AUTO_1329 ?AUTO_1333 ) ( not ( = ?AUTO_1329 ?AUTO_1330 ) ) ( TRUCK-AT ?AUTO_1334 ?AUTO_1329 ) ( AIRPORT ?AUTO_1331 ) ( AIRPORT ?AUTO_1330 ) ( AIRPLANE-AT ?AUTO_1332 ?AUTO_1331 ) ( not ( = ?AUTO_1331 ?AUTO_1330 ) ) ( not ( = ?AUTO_1329 ?AUTO_1331 ) ) ( IN-TRUCK ?AUTO_1328 ?AUTO_1335 ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( TRUCK-AT ?AUTO_1335 ?AUTO_1336 ) ( IN-CITY ?AUTO_1336 ?AUTO_1337 ) ( IN-CITY ?AUTO_1331 ?AUTO_1337 ) ( not ( = ?AUTO_1331 ?AUTO_1336 ) ) ( not ( = ?AUTO_1329 ?AUTO_1336 ) ) ( not ( = ?AUTO_1330 ?AUTO_1336 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1335 ?AUTO_1336 ?AUTO_1331 ?AUTO_1337 )
      ( DELIVER-PKG ?AUTO_1328 ?AUTO_1329 )
      ( DELIVER-PKG-VERIFY ?AUTO_1328 ?AUTO_1329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1362 - OBJ
      ?AUTO_1363 - LOCATION
    )
    :vars
    (
      ?AUTO_1367 - LOCATION
      ?AUTO_1364 - CITY
      ?AUTO_1368 - TRUCK
      ?AUTO_1365 - LOCATION
      ?AUTO_1366 - AIRPLANE
      ?AUTO_1371 - TRUCK
      ?AUTO_1370 - LOCATION
      ?AUTO_1369 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1367 ?AUTO_1364 ) ( IN-CITY ?AUTO_1363 ?AUTO_1364 ) ( not ( = ?AUTO_1363 ?AUTO_1367 ) ) ( TRUCK-AT ?AUTO_1368 ?AUTO_1363 ) ( AIRPORT ?AUTO_1365 ) ( AIRPORT ?AUTO_1367 ) ( AIRPLANE-AT ?AUTO_1366 ?AUTO_1365 ) ( not ( = ?AUTO_1365 ?AUTO_1367 ) ) ( not ( = ?AUTO_1363 ?AUTO_1365 ) ) ( not ( = ?AUTO_1368 ?AUTO_1371 ) ) ( TRUCK-AT ?AUTO_1371 ?AUTO_1370 ) ( IN-CITY ?AUTO_1370 ?AUTO_1369 ) ( IN-CITY ?AUTO_1365 ?AUTO_1369 ) ( not ( = ?AUTO_1365 ?AUTO_1370 ) ) ( not ( = ?AUTO_1363 ?AUTO_1370 ) ) ( not ( = ?AUTO_1367 ?AUTO_1370 ) ) ( not ( = ?AUTO_1364 ?AUTO_1369 ) ) ( OBJ-AT ?AUTO_1362 ?AUTO_1370 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1362 ?AUTO_1371 ?AUTO_1370 )
      ( DELIVER-PKG ?AUTO_1362 ?AUTO_1363 )
      ( DELIVER-PKG-VERIFY ?AUTO_1362 ?AUTO_1363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1374 - OBJ
      ?AUTO_1375 - LOCATION
    )
    :vars
    (
      ?AUTO_1376 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1376 ?AUTO_1375 ) ( IN-TRUCK ?AUTO_1374 ?AUTO_1376 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1374 ?AUTO_1376 ?AUTO_1375 )
      ( DELIVER-PKG-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1385 - OBJ
      ?AUTO_1386 - LOCATION
    )
    :vars
    (
      ?AUTO_1387 - TRUCK
      ?AUTO_1388 - LOCATION
      ?AUTO_1389 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1385 ?AUTO_1387 ) ( TRUCK-AT ?AUTO_1387 ?AUTO_1388 ) ( IN-CITY ?AUTO_1388 ?AUTO_1389 ) ( IN-CITY ?AUTO_1386 ?AUTO_1389 ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1387 ?AUTO_1388 ?AUTO_1386 ?AUTO_1389 )
      ( DELIVER-PKG ?AUTO_1385 ?AUTO_1386 )
      ( DELIVER-PKG-VERIFY ?AUTO_1385 ?AUTO_1386 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1390 - OBJ
      ?AUTO_1391 - LOCATION
    )
    :vars
    (
      ?AUTO_1392 - TRUCK
      ?AUTO_1393 - LOCATION
      ?AUTO_1394 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1392 ?AUTO_1393 ) ( IN-CITY ?AUTO_1393 ?AUTO_1394 ) ( IN-CITY ?AUTO_1391 ?AUTO_1394 ) ( not ( = ?AUTO_1391 ?AUTO_1393 ) ) ( OBJ-AT ?AUTO_1390 ?AUTO_1393 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1390 ?AUTO_1392 ?AUTO_1393 )
      ( DELIVER-PKG ?AUTO_1390 ?AUTO_1391 )
      ( DELIVER-PKG-VERIFY ?AUTO_1390 ?AUTO_1391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1409 - OBJ
      ?AUTO_1410 - LOCATION
    )
    :vars
    (
      ?AUTO_1411 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1409 ?AUTO_1411 ) ( AIRPLANE-AT ?AUTO_1411 ?AUTO_1410 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1409 ?AUTO_1411 ?AUTO_1410 )
      ( DELIVER-PKG-VERIFY ?AUTO_1409 ?AUTO_1410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1418 - OBJ
      ?AUTO_1419 - LOCATION
    )
    :vars
    (
      ?AUTO_1420 - AIRPLANE
      ?AUTO_1421 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1418 ?AUTO_1420 ) ( AIRPORT ?AUTO_1421 ) ( AIRPORT ?AUTO_1419 ) ( AIRPLANE-AT ?AUTO_1420 ?AUTO_1421 ) ( not ( = ?AUTO_1421 ?AUTO_1419 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1420 ?AUTO_1421 ?AUTO_1419 )
      ( DELIVER-PKG ?AUTO_1418 ?AUTO_1419 )
      ( DELIVER-PKG-VERIFY ?AUTO_1418 ?AUTO_1419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1422 - OBJ
      ?AUTO_1423 - LOCATION
    )
    :vars
    (
      ?AUTO_1425 - LOCATION
      ?AUTO_1424 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1425 ) ( AIRPORT ?AUTO_1423 ) ( AIRPLANE-AT ?AUTO_1424 ?AUTO_1425 ) ( not ( = ?AUTO_1425 ?AUTO_1423 ) ) ( OBJ-AT ?AUTO_1422 ?AUTO_1425 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1422 ?AUTO_1424 ?AUTO_1425 )
      ( DELIVER-PKG ?AUTO_1422 ?AUTO_1423 )
      ( DELIVER-PKG-VERIFY ?AUTO_1422 ?AUTO_1423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1430 - OBJ
      ?AUTO_1431 - LOCATION
    )
    :vars
    (
      ?AUTO_1433 - LOCATION
      ?AUTO_1434 - LOCATION
      ?AUTO_1432 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1433 ) ( AIRPORT ?AUTO_1431 ) ( not ( = ?AUTO_1433 ?AUTO_1431 ) ) ( OBJ-AT ?AUTO_1430 ?AUTO_1433 ) ( AIRPORT ?AUTO_1434 ) ( AIRPLANE-AT ?AUTO_1432 ?AUTO_1434 ) ( not ( = ?AUTO_1434 ?AUTO_1433 ) ) ( not ( = ?AUTO_1431 ?AUTO_1434 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1432 ?AUTO_1434 ?AUTO_1433 )
      ( DELIVER-PKG ?AUTO_1430 ?AUTO_1431 )
      ( DELIVER-PKG-VERIFY ?AUTO_1430 ?AUTO_1431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1447 - OBJ
      ?AUTO_1448 - LOCATION
    )
    :vars
    (
      ?AUTO_1449 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1449 ?AUTO_1448 ) ( IN-TRUCK ?AUTO_1447 ?AUTO_1449 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1447 ?AUTO_1449 ?AUTO_1448 )
      ( DELIVER-PKG-VERIFY ?AUTO_1447 ?AUTO_1448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1458 - OBJ
      ?AUTO_1459 - LOCATION
    )
    :vars
    (
      ?AUTO_1460 - TRUCK
      ?AUTO_1461 - LOCATION
      ?AUTO_1462 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1458 ?AUTO_1460 ) ( TRUCK-AT ?AUTO_1460 ?AUTO_1461 ) ( IN-CITY ?AUTO_1461 ?AUTO_1462 ) ( IN-CITY ?AUTO_1459 ?AUTO_1462 ) ( not ( = ?AUTO_1459 ?AUTO_1461 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1460 ?AUTO_1461 ?AUTO_1459 ?AUTO_1462 )
      ( DELIVER-PKG ?AUTO_1458 ?AUTO_1459 )
      ( DELIVER-PKG-VERIFY ?AUTO_1458 ?AUTO_1459 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1481 - OBJ
      ?AUTO_1482 - LOCATION
    )
    :vars
    (
      ?AUTO_1485 - LOCATION
      ?AUTO_1483 - CITY
      ?AUTO_1484 - TRUCK
      ?AUTO_1486 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1485 ?AUTO_1483 ) ( IN-CITY ?AUTO_1482 ?AUTO_1483 ) ( not ( = ?AUTO_1482 ?AUTO_1485 ) ) ( OBJ-AT ?AUTO_1481 ?AUTO_1485 ) ( TRUCK-AT ?AUTO_1484 ?AUTO_1486 ) ( IN-CITY ?AUTO_1486 ?AUTO_1483 ) ( not ( = ?AUTO_1485 ?AUTO_1486 ) ) ( not ( = ?AUTO_1482 ?AUTO_1486 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1484 ?AUTO_1486 ?AUTO_1485 ?AUTO_1483 )
      ( DELIVER-PKG ?AUTO_1481 ?AUTO_1482 )
      ( DELIVER-PKG-VERIFY ?AUTO_1481 ?AUTO_1482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1489 - OBJ
      ?AUTO_1490 - LOCATION
    )
    :vars
    (
      ?AUTO_1491 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1489 ?AUTO_1491 ) ( AIRPLANE-AT ?AUTO_1491 ?AUTO_1490 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1489 ?AUTO_1491 ?AUTO_1490 )
      ( DELIVER-PKG-VERIFY ?AUTO_1489 ?AUTO_1490 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1496 - OBJ
      ?AUTO_1497 - LOCATION
    )
    :vars
    (
      ?AUTO_1498 - AIRPLANE
      ?AUTO_1499 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1496 ?AUTO_1498 ) ( AIRPORT ?AUTO_1499 ) ( AIRPORT ?AUTO_1497 ) ( AIRPLANE-AT ?AUTO_1498 ?AUTO_1499 ) ( not ( = ?AUTO_1499 ?AUTO_1497 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1498 ?AUTO_1499 ?AUTO_1497 )
      ( DELIVER-PKG ?AUTO_1496 ?AUTO_1497 )
      ( DELIVER-PKG-VERIFY ?AUTO_1496 ?AUTO_1497 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1530 - OBJ
      ?AUTO_1531 - LOCATION
    )
    :vars
    (
      ?AUTO_1532 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1530 ?AUTO_1532 ) ( AIRPLANE-AT ?AUTO_1532 ?AUTO_1531 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1530 ?AUTO_1532 ?AUTO_1531 )
      ( DELIVER-PKG-VERIFY ?AUTO_1530 ?AUTO_1531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1533 - OBJ
      ?AUTO_1534 - LOCATION
    )
    :vars
    (
      ?AUTO_1535 - AIRPLANE
      ?AUTO_1536 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1533 ?AUTO_1535 ) ( AIRPORT ?AUTO_1536 ) ( AIRPORT ?AUTO_1534 ) ( AIRPLANE-AT ?AUTO_1535 ?AUTO_1536 ) ( not ( = ?AUTO_1536 ?AUTO_1534 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1535 ?AUTO_1536 ?AUTO_1534 )
      ( DELIVER-PKG ?AUTO_1533 ?AUTO_1534 )
      ( DELIVER-PKG-VERIFY ?AUTO_1533 ?AUTO_1534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1539 - OBJ
      ?AUTO_1540 - LOCATION
    )
    :vars
    (
      ?AUTO_1542 - LOCATION
      ?AUTO_1541 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1542 ) ( AIRPORT ?AUTO_1540 ) ( AIRPLANE-AT ?AUTO_1541 ?AUTO_1542 ) ( not ( = ?AUTO_1542 ?AUTO_1540 ) ) ( OBJ-AT ?AUTO_1539 ?AUTO_1542 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1539 ?AUTO_1541 ?AUTO_1542 )
      ( DELIVER-PKG ?AUTO_1539 ?AUTO_1540 )
      ( DELIVER-PKG-VERIFY ?AUTO_1539 ?AUTO_1540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1543 - OBJ
      ?AUTO_1544 - LOCATION
    )
    :vars
    (
      ?AUTO_1546 - LOCATION
      ?AUTO_1545 - AIRPLANE
      ?AUTO_1547 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1546 ) ( AIRPORT ?AUTO_1544 ) ( AIRPLANE-AT ?AUTO_1545 ?AUTO_1546 ) ( not ( = ?AUTO_1546 ?AUTO_1544 ) ) ( TRUCK-AT ?AUTO_1547 ?AUTO_1546 ) ( IN-TRUCK ?AUTO_1543 ?AUTO_1547 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1543 ?AUTO_1547 ?AUTO_1546 )
      ( DELIVER-PKG ?AUTO_1543 ?AUTO_1544 )
      ( DELIVER-PKG-VERIFY ?AUTO_1543 ?AUTO_1544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1556 - OBJ
      ?AUTO_1557 - LOCATION
    )
    :vars
    (
      ?AUTO_1560 - LOCATION
      ?AUTO_1558 - AIRPLANE
      ?AUTO_1559 - TRUCK
      ?AUTO_1561 - LOCATION
      ?AUTO_1562 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1560 ) ( AIRPORT ?AUTO_1557 ) ( AIRPLANE-AT ?AUTO_1558 ?AUTO_1560 ) ( not ( = ?AUTO_1560 ?AUTO_1557 ) ) ( IN-TRUCK ?AUTO_1556 ?AUTO_1559 ) ( TRUCK-AT ?AUTO_1559 ?AUTO_1561 ) ( IN-CITY ?AUTO_1561 ?AUTO_1562 ) ( IN-CITY ?AUTO_1560 ?AUTO_1562 ) ( not ( = ?AUTO_1560 ?AUTO_1561 ) ) ( not ( = ?AUTO_1557 ?AUTO_1561 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1559 ?AUTO_1561 ?AUTO_1560 ?AUTO_1562 )
      ( DELIVER-PKG ?AUTO_1556 ?AUTO_1557 )
      ( DELIVER-PKG-VERIFY ?AUTO_1556 ?AUTO_1557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1579 - OBJ
      ?AUTO_1580 - LOCATION
    )
    :vars
    (
      ?AUTO_1582 - LOCATION
      ?AUTO_1584 - AIRPLANE
      ?AUTO_1583 - TRUCK
      ?AUTO_1585 - LOCATION
      ?AUTO_1581 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1582 ) ( AIRPORT ?AUTO_1580 ) ( AIRPLANE-AT ?AUTO_1584 ?AUTO_1582 ) ( not ( = ?AUTO_1582 ?AUTO_1580 ) ) ( TRUCK-AT ?AUTO_1583 ?AUTO_1585 ) ( IN-CITY ?AUTO_1585 ?AUTO_1581 ) ( IN-CITY ?AUTO_1582 ?AUTO_1581 ) ( not ( = ?AUTO_1582 ?AUTO_1585 ) ) ( not ( = ?AUTO_1580 ?AUTO_1585 ) ) ( OBJ-AT ?AUTO_1579 ?AUTO_1585 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1579 ?AUTO_1583 ?AUTO_1585 )
      ( DELIVER-PKG ?AUTO_1579 ?AUTO_1580 )
      ( DELIVER-PKG-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1586 - OBJ
      ?AUTO_1587 - LOCATION
    )
    :vars
    (
      ?AUTO_1589 - LOCATION
      ?AUTO_1591 - AIRPLANE
      ?AUTO_1590 - LOCATION
      ?AUTO_1588 - CITY
      ?AUTO_1592 - TRUCK
      ?AUTO_1593 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1589 ) ( AIRPORT ?AUTO_1587 ) ( AIRPLANE-AT ?AUTO_1591 ?AUTO_1589 ) ( not ( = ?AUTO_1589 ?AUTO_1587 ) ) ( IN-CITY ?AUTO_1590 ?AUTO_1588 ) ( IN-CITY ?AUTO_1589 ?AUTO_1588 ) ( not ( = ?AUTO_1589 ?AUTO_1590 ) ) ( not ( = ?AUTO_1587 ?AUTO_1590 ) ) ( OBJ-AT ?AUTO_1586 ?AUTO_1590 ) ( TRUCK-AT ?AUTO_1592 ?AUTO_1593 ) ( IN-CITY ?AUTO_1593 ?AUTO_1588 ) ( not ( = ?AUTO_1590 ?AUTO_1593 ) ) ( not ( = ?AUTO_1587 ?AUTO_1593 ) ) ( not ( = ?AUTO_1589 ?AUTO_1593 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1592 ?AUTO_1593 ?AUTO_1590 ?AUTO_1588 )
      ( DELIVER-PKG ?AUTO_1586 ?AUTO_1587 )
      ( DELIVER-PKG-VERIFY ?AUTO_1586 ?AUTO_1587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1596 - OBJ
      ?AUTO_1597 - LOCATION
    )
    :vars
    (
      ?AUTO_1598 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1596 ?AUTO_1598 ) ( AIRPLANE-AT ?AUTO_1598 ?AUTO_1597 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1596 ?AUTO_1598 ?AUTO_1597 )
      ( DELIVER-PKG-VERIFY ?AUTO_1596 ?AUTO_1597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1641 - OBJ
      ?AUTO_1642 - LOCATION
    )
    :vars
    (
      ?AUTO_1643 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1643 ?AUTO_1642 ) ( IN-TRUCK ?AUTO_1641 ?AUTO_1643 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1641 ?AUTO_1643 ?AUTO_1642 )
      ( DELIVER-PKG-VERIFY ?AUTO_1641 ?AUTO_1642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1644 - OBJ
      ?AUTO_1645 - LOCATION
    )
    :vars
    (
      ?AUTO_1646 - TRUCK
      ?AUTO_1647 - LOCATION
      ?AUTO_1648 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1644 ?AUTO_1646 ) ( TRUCK-AT ?AUTO_1646 ?AUTO_1647 ) ( IN-CITY ?AUTO_1647 ?AUTO_1648 ) ( IN-CITY ?AUTO_1645 ?AUTO_1648 ) ( not ( = ?AUTO_1645 ?AUTO_1647 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1646 ?AUTO_1647 ?AUTO_1645 ?AUTO_1648 )
      ( DELIVER-PKG ?AUTO_1644 ?AUTO_1645 )
      ( DELIVER-PKG-VERIFY ?AUTO_1644 ?AUTO_1645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1655 - OBJ
      ?AUTO_1656 - LOCATION
    )
    :vars
    (
      ?AUTO_1658 - TRUCK
      ?AUTO_1659 - LOCATION
      ?AUTO_1657 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1658 ?AUTO_1659 ) ( IN-CITY ?AUTO_1659 ?AUTO_1657 ) ( IN-CITY ?AUTO_1656 ?AUTO_1657 ) ( not ( = ?AUTO_1656 ?AUTO_1659 ) ) ( OBJ-AT ?AUTO_1655 ?AUTO_1659 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1655 ?AUTO_1658 ?AUTO_1659 )
      ( DELIVER-PKG ?AUTO_1655 ?AUTO_1656 )
      ( DELIVER-PKG-VERIFY ?AUTO_1655 ?AUTO_1656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1662 - OBJ
      ?AUTO_1663 - LOCATION
    )
    :vars
    (
      ?AUTO_1666 - TRUCK
      ?AUTO_1665 - LOCATION
      ?AUTO_1664 - CITY
      ?AUTO_1667 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1666 ?AUTO_1665 ) ( IN-CITY ?AUTO_1665 ?AUTO_1664 ) ( IN-CITY ?AUTO_1663 ?AUTO_1664 ) ( not ( = ?AUTO_1663 ?AUTO_1665 ) ) ( IN-AIRPLANE ?AUTO_1662 ?AUTO_1667 ) ( AIRPLANE-AT ?AUTO_1667 ?AUTO_1665 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1662 ?AUTO_1667 ?AUTO_1665 )
      ( DELIVER-PKG ?AUTO_1662 ?AUTO_1663 )
      ( DELIVER-PKG-VERIFY ?AUTO_1662 ?AUTO_1663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1668 - OBJ
      ?AUTO_1669 - LOCATION
    )
    :vars
    (
      ?AUTO_1671 - TRUCK
      ?AUTO_1672 - LOCATION
      ?AUTO_1670 - CITY
      ?AUTO_1673 - AIRPLANE
      ?AUTO_1674 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1671 ?AUTO_1672 ) ( IN-CITY ?AUTO_1672 ?AUTO_1670 ) ( IN-CITY ?AUTO_1669 ?AUTO_1670 ) ( not ( = ?AUTO_1669 ?AUTO_1672 ) ) ( IN-AIRPLANE ?AUTO_1668 ?AUTO_1673 ) ( AIRPORT ?AUTO_1674 ) ( AIRPORT ?AUTO_1672 ) ( AIRPLANE-AT ?AUTO_1673 ?AUTO_1674 ) ( not ( = ?AUTO_1674 ?AUTO_1672 ) ) ( not ( = ?AUTO_1669 ?AUTO_1674 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1673 ?AUTO_1674 ?AUTO_1672 )
      ( DELIVER-PKG ?AUTO_1668 ?AUTO_1669 )
      ( DELIVER-PKG-VERIFY ?AUTO_1668 ?AUTO_1669 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1677 - OBJ
      ?AUTO_1678 - LOCATION
    )
    :vars
    (
      ?AUTO_1682 - TRUCK
      ?AUTO_1681 - LOCATION
      ?AUTO_1683 - CITY
      ?AUTO_1680 - LOCATION
      ?AUTO_1679 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1682 ?AUTO_1681 ) ( IN-CITY ?AUTO_1681 ?AUTO_1683 ) ( IN-CITY ?AUTO_1678 ?AUTO_1683 ) ( not ( = ?AUTO_1678 ?AUTO_1681 ) ) ( AIRPORT ?AUTO_1680 ) ( AIRPORT ?AUTO_1681 ) ( AIRPLANE-AT ?AUTO_1679 ?AUTO_1680 ) ( not ( = ?AUTO_1680 ?AUTO_1681 ) ) ( not ( = ?AUTO_1678 ?AUTO_1680 ) ) ( OBJ-AT ?AUTO_1677 ?AUTO_1680 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1677 ?AUTO_1679 ?AUTO_1680 )
      ( DELIVER-PKG ?AUTO_1677 ?AUTO_1678 )
      ( DELIVER-PKG-VERIFY ?AUTO_1677 ?AUTO_1678 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1684 - OBJ
      ?AUTO_1685 - LOCATION
    )
    :vars
    (
      ?AUTO_1688 - TRUCK
      ?AUTO_1690 - LOCATION
      ?AUTO_1687 - CITY
      ?AUTO_1689 - LOCATION
      ?AUTO_1686 - AIRPLANE
      ?AUTO_1691 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1688 ?AUTO_1690 ) ( IN-CITY ?AUTO_1690 ?AUTO_1687 ) ( IN-CITY ?AUTO_1685 ?AUTO_1687 ) ( not ( = ?AUTO_1685 ?AUTO_1690 ) ) ( AIRPORT ?AUTO_1689 ) ( AIRPORT ?AUTO_1690 ) ( AIRPLANE-AT ?AUTO_1686 ?AUTO_1689 ) ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( not ( = ?AUTO_1685 ?AUTO_1689 ) ) ( TRUCK-AT ?AUTO_1691 ?AUTO_1689 ) ( IN-TRUCK ?AUTO_1684 ?AUTO_1691 ) ( not ( = ?AUTO_1688 ?AUTO_1691 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1684 ?AUTO_1691 ?AUTO_1689 )
      ( DELIVER-PKG ?AUTO_1684 ?AUTO_1685 )
      ( DELIVER-PKG-VERIFY ?AUTO_1684 ?AUTO_1685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1698 - OBJ
      ?AUTO_1699 - LOCATION
    )
    :vars
    (
      ?AUTO_1702 - LOCATION
      ?AUTO_1703 - CITY
      ?AUTO_1700 - LOCATION
      ?AUTO_1705 - AIRPLANE
      ?AUTO_1704 - TRUCK
      ?AUTO_1701 - TRUCK
      ?AUTO_1706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1702 ?AUTO_1703 ) ( IN-CITY ?AUTO_1699 ?AUTO_1703 ) ( not ( = ?AUTO_1699 ?AUTO_1702 ) ) ( AIRPORT ?AUTO_1700 ) ( AIRPORT ?AUTO_1702 ) ( AIRPLANE-AT ?AUTO_1705 ?AUTO_1700 ) ( not ( = ?AUTO_1700 ?AUTO_1702 ) ) ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) ( TRUCK-AT ?AUTO_1704 ?AUTO_1700 ) ( IN-TRUCK ?AUTO_1698 ?AUTO_1704 ) ( not ( = ?AUTO_1701 ?AUTO_1704 ) ) ( TRUCK-AT ?AUTO_1701 ?AUTO_1706 ) ( IN-CITY ?AUTO_1706 ?AUTO_1703 ) ( not ( = ?AUTO_1702 ?AUTO_1706 ) ) ( not ( = ?AUTO_1699 ?AUTO_1706 ) ) ( not ( = ?AUTO_1700 ?AUTO_1706 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1701 ?AUTO_1706 ?AUTO_1702 ?AUTO_1703 )
      ( DELIVER-PKG ?AUTO_1698 ?AUTO_1699 )
      ( DELIVER-PKG-VERIFY ?AUTO_1698 ?AUTO_1699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1707 - OBJ
      ?AUTO_1708 - LOCATION
    )
    :vars
    (
      ?AUTO_1713 - LOCATION
      ?AUTO_1712 - CITY
      ?AUTO_1709 - LOCATION
      ?AUTO_1711 - AIRPLANE
      ?AUTO_1714 - TRUCK
      ?AUTO_1710 - TRUCK
      ?AUTO_1715 - LOCATION
      ?AUTO_1716 - LOCATION
      ?AUTO_1717 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1713 ?AUTO_1712 ) ( IN-CITY ?AUTO_1708 ?AUTO_1712 ) ( not ( = ?AUTO_1708 ?AUTO_1713 ) ) ( AIRPORT ?AUTO_1709 ) ( AIRPORT ?AUTO_1713 ) ( AIRPLANE-AT ?AUTO_1711 ?AUTO_1709 ) ( not ( = ?AUTO_1709 ?AUTO_1713 ) ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( IN-TRUCK ?AUTO_1707 ?AUTO_1714 ) ( not ( = ?AUTO_1710 ?AUTO_1714 ) ) ( TRUCK-AT ?AUTO_1710 ?AUTO_1715 ) ( IN-CITY ?AUTO_1715 ?AUTO_1712 ) ( not ( = ?AUTO_1713 ?AUTO_1715 ) ) ( not ( = ?AUTO_1708 ?AUTO_1715 ) ) ( not ( = ?AUTO_1709 ?AUTO_1715 ) ) ( TRUCK-AT ?AUTO_1714 ?AUTO_1716 ) ( IN-CITY ?AUTO_1716 ?AUTO_1717 ) ( IN-CITY ?AUTO_1709 ?AUTO_1717 ) ( not ( = ?AUTO_1709 ?AUTO_1716 ) ) ( not ( = ?AUTO_1708 ?AUTO_1716 ) ) ( not ( = ?AUTO_1713 ?AUTO_1716 ) ) ( not ( = ?AUTO_1712 ?AUTO_1717 ) ) ( not ( = ?AUTO_1715 ?AUTO_1716 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1714 ?AUTO_1716 ?AUTO_1709 ?AUTO_1717 )
      ( DELIVER-PKG ?AUTO_1707 ?AUTO_1708 )
      ( DELIVER-PKG-VERIFY ?AUTO_1707 ?AUTO_1708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1734 - OBJ
      ?AUTO_1735 - LOCATION
    )
    :vars
    (
      ?AUTO_1738 - LOCATION
      ?AUTO_1741 - CITY
      ?AUTO_1739 - LOCATION
      ?AUTO_1736 - AIRPLANE
      ?AUTO_1744 - TRUCK
      ?AUTO_1737 - TRUCK
      ?AUTO_1742 - LOCATION
      ?AUTO_1743 - LOCATION
      ?AUTO_1740 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1738 ?AUTO_1741 ) ( IN-CITY ?AUTO_1735 ?AUTO_1741 ) ( not ( = ?AUTO_1735 ?AUTO_1738 ) ) ( AIRPORT ?AUTO_1739 ) ( AIRPORT ?AUTO_1738 ) ( AIRPLANE-AT ?AUTO_1736 ?AUTO_1739 ) ( not ( = ?AUTO_1739 ?AUTO_1738 ) ) ( not ( = ?AUTO_1735 ?AUTO_1739 ) ) ( not ( = ?AUTO_1744 ?AUTO_1737 ) ) ( TRUCK-AT ?AUTO_1744 ?AUTO_1742 ) ( IN-CITY ?AUTO_1742 ?AUTO_1741 ) ( not ( = ?AUTO_1738 ?AUTO_1742 ) ) ( not ( = ?AUTO_1735 ?AUTO_1742 ) ) ( not ( = ?AUTO_1739 ?AUTO_1742 ) ) ( TRUCK-AT ?AUTO_1737 ?AUTO_1743 ) ( IN-CITY ?AUTO_1743 ?AUTO_1740 ) ( IN-CITY ?AUTO_1739 ?AUTO_1740 ) ( not ( = ?AUTO_1739 ?AUTO_1743 ) ) ( not ( = ?AUTO_1735 ?AUTO_1743 ) ) ( not ( = ?AUTO_1738 ?AUTO_1743 ) ) ( not ( = ?AUTO_1741 ?AUTO_1740 ) ) ( not ( = ?AUTO_1742 ?AUTO_1743 ) ) ( OBJ-AT ?AUTO_1734 ?AUTO_1743 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1734 ?AUTO_1737 ?AUTO_1743 )
      ( DELIVER-PKG ?AUTO_1734 ?AUTO_1735 )
      ( DELIVER-PKG-VERIFY ?AUTO_1734 ?AUTO_1735 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1745 - OBJ
      ?AUTO_1746 - LOCATION
    )
    :vars
    (
      ?AUTO_1752 - LOCATION
      ?AUTO_1753 - CITY
      ?AUTO_1751 - LOCATION
      ?AUTO_1747 - AIRPLANE
      ?AUTO_1755 - TRUCK
      ?AUTO_1748 - TRUCK
      ?AUTO_1749 - LOCATION
      ?AUTO_1750 - LOCATION
      ?AUTO_1754 - CITY
      ?AUTO_1756 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1752 ?AUTO_1753 ) ( IN-CITY ?AUTO_1746 ?AUTO_1753 ) ( not ( = ?AUTO_1746 ?AUTO_1752 ) ) ( AIRPORT ?AUTO_1751 ) ( AIRPORT ?AUTO_1752 ) ( AIRPLANE-AT ?AUTO_1747 ?AUTO_1751 ) ( not ( = ?AUTO_1751 ?AUTO_1752 ) ) ( not ( = ?AUTO_1746 ?AUTO_1751 ) ) ( not ( = ?AUTO_1755 ?AUTO_1748 ) ) ( TRUCK-AT ?AUTO_1755 ?AUTO_1749 ) ( IN-CITY ?AUTO_1749 ?AUTO_1753 ) ( not ( = ?AUTO_1752 ?AUTO_1749 ) ) ( not ( = ?AUTO_1746 ?AUTO_1749 ) ) ( not ( = ?AUTO_1751 ?AUTO_1749 ) ) ( IN-CITY ?AUTO_1750 ?AUTO_1754 ) ( IN-CITY ?AUTO_1751 ?AUTO_1754 ) ( not ( = ?AUTO_1751 ?AUTO_1750 ) ) ( not ( = ?AUTO_1746 ?AUTO_1750 ) ) ( not ( = ?AUTO_1752 ?AUTO_1750 ) ) ( not ( = ?AUTO_1753 ?AUTO_1754 ) ) ( not ( = ?AUTO_1749 ?AUTO_1750 ) ) ( OBJ-AT ?AUTO_1745 ?AUTO_1750 ) ( TRUCK-AT ?AUTO_1748 ?AUTO_1756 ) ( IN-CITY ?AUTO_1756 ?AUTO_1754 ) ( not ( = ?AUTO_1750 ?AUTO_1756 ) ) ( not ( = ?AUTO_1746 ?AUTO_1756 ) ) ( not ( = ?AUTO_1752 ?AUTO_1756 ) ) ( not ( = ?AUTO_1751 ?AUTO_1756 ) ) ( not ( = ?AUTO_1749 ?AUTO_1756 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1748 ?AUTO_1756 ?AUTO_1750 ?AUTO_1754 )
      ( DELIVER-PKG ?AUTO_1745 ?AUTO_1746 )
      ( DELIVER-PKG-VERIFY ?AUTO_1745 ?AUTO_1746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1759 - OBJ
      ?AUTO_1760 - LOCATION
    )
    :vars
    (
      ?AUTO_1761 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1761 ?AUTO_1760 ) ( IN-TRUCK ?AUTO_1759 ?AUTO_1761 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1759 ?AUTO_1761 ?AUTO_1760 )
      ( DELIVER-PKG-VERIFY ?AUTO_1759 ?AUTO_1760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1772 - OBJ
      ?AUTO_1773 - LOCATION
    )
    :vars
    (
      ?AUTO_1775 - TRUCK
      ?AUTO_1776 - LOCATION
      ?AUTO_1774 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1775 ?AUTO_1776 ) ( IN-CITY ?AUTO_1776 ?AUTO_1774 ) ( IN-CITY ?AUTO_1773 ?AUTO_1774 ) ( not ( = ?AUTO_1773 ?AUTO_1776 ) ) ( OBJ-AT ?AUTO_1772 ?AUTO_1776 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1772 ?AUTO_1775 ?AUTO_1776 )
      ( DELIVER-PKG ?AUTO_1772 ?AUTO_1773 )
      ( DELIVER-PKG-VERIFY ?AUTO_1772 ?AUTO_1773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1799 - OBJ
      ?AUTO_1800 - LOCATION
    )
    :vars
    (
      ?AUTO_1801 - LOCATION
      ?AUTO_1803 - CITY
      ?AUTO_1802 - AIRPLANE
      ?AUTO_1804 - LOCATION
      ?AUTO_1805 - TRUCK
      ?AUTO_1806 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1801 ?AUTO_1803 ) ( IN-CITY ?AUTO_1800 ?AUTO_1803 ) ( not ( = ?AUTO_1800 ?AUTO_1801 ) ) ( IN-AIRPLANE ?AUTO_1799 ?AUTO_1802 ) ( AIRPORT ?AUTO_1804 ) ( AIRPORT ?AUTO_1801 ) ( AIRPLANE-AT ?AUTO_1802 ?AUTO_1804 ) ( not ( = ?AUTO_1804 ?AUTO_1801 ) ) ( not ( = ?AUTO_1800 ?AUTO_1804 ) ) ( TRUCK-AT ?AUTO_1805 ?AUTO_1806 ) ( IN-CITY ?AUTO_1806 ?AUTO_1803 ) ( not ( = ?AUTO_1801 ?AUTO_1806 ) ) ( not ( = ?AUTO_1800 ?AUTO_1806 ) ) ( not ( = ?AUTO_1804 ?AUTO_1806 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1805 ?AUTO_1806 ?AUTO_1801 ?AUTO_1803 )
      ( DELIVER-PKG ?AUTO_1799 ?AUTO_1800 )
      ( DELIVER-PKG-VERIFY ?AUTO_1799 ?AUTO_1800 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1819 - OBJ
      ?AUTO_1820 - LOCATION
    )
    :vars
    (
      ?AUTO_1821 - LOCATION
      ?AUTO_1822 - CITY
      ?AUTO_1823 - LOCATION
      ?AUTO_1826 - AIRPLANE
      ?AUTO_1825 - TRUCK
      ?AUTO_1824 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1821 ?AUTO_1822 ) ( IN-CITY ?AUTO_1820 ?AUTO_1822 ) ( not ( = ?AUTO_1820 ?AUTO_1821 ) ) ( AIRPORT ?AUTO_1823 ) ( AIRPORT ?AUTO_1821 ) ( AIRPLANE-AT ?AUTO_1826 ?AUTO_1823 ) ( not ( = ?AUTO_1823 ?AUTO_1821 ) ) ( not ( = ?AUTO_1820 ?AUTO_1823 ) ) ( TRUCK-AT ?AUTO_1825 ?AUTO_1824 ) ( IN-CITY ?AUTO_1824 ?AUTO_1822 ) ( not ( = ?AUTO_1821 ?AUTO_1824 ) ) ( not ( = ?AUTO_1820 ?AUTO_1824 ) ) ( not ( = ?AUTO_1823 ?AUTO_1824 ) ) ( OBJ-AT ?AUTO_1819 ?AUTO_1823 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1819 ?AUTO_1826 ?AUTO_1823 )
      ( DELIVER-PKG ?AUTO_1819 ?AUTO_1820 )
      ( DELIVER-PKG-VERIFY ?AUTO_1819 ?AUTO_1820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1827 - OBJ
      ?AUTO_1828 - LOCATION
    )
    :vars
    (
      ?AUTO_1830 - LOCATION
      ?AUTO_1832 - CITY
      ?AUTO_1829 - LOCATION
      ?AUTO_1831 - TRUCK
      ?AUTO_1833 - LOCATION
      ?AUTO_1835 - LOCATION
      ?AUTO_1834 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1830 ?AUTO_1832 ) ( IN-CITY ?AUTO_1828 ?AUTO_1832 ) ( not ( = ?AUTO_1828 ?AUTO_1830 ) ) ( AIRPORT ?AUTO_1829 ) ( AIRPORT ?AUTO_1830 ) ( not ( = ?AUTO_1829 ?AUTO_1830 ) ) ( not ( = ?AUTO_1828 ?AUTO_1829 ) ) ( TRUCK-AT ?AUTO_1831 ?AUTO_1833 ) ( IN-CITY ?AUTO_1833 ?AUTO_1832 ) ( not ( = ?AUTO_1830 ?AUTO_1833 ) ) ( not ( = ?AUTO_1828 ?AUTO_1833 ) ) ( not ( = ?AUTO_1829 ?AUTO_1833 ) ) ( OBJ-AT ?AUTO_1827 ?AUTO_1829 ) ( AIRPORT ?AUTO_1835 ) ( AIRPLANE-AT ?AUTO_1834 ?AUTO_1835 ) ( not ( = ?AUTO_1835 ?AUTO_1829 ) ) ( not ( = ?AUTO_1828 ?AUTO_1835 ) ) ( not ( = ?AUTO_1830 ?AUTO_1835 ) ) ( not ( = ?AUTO_1833 ?AUTO_1835 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1834 ?AUTO_1835 ?AUTO_1829 )
      ( DELIVER-PKG ?AUTO_1827 ?AUTO_1828 )
      ( DELIVER-PKG-VERIFY ?AUTO_1827 ?AUTO_1828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1842 - OBJ
      ?AUTO_1843 - LOCATION
    )
    :vars
    (
      ?AUTO_1844 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1844 ?AUTO_1843 ) ( IN-TRUCK ?AUTO_1842 ?AUTO_1844 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1842 ?AUTO_1844 ?AUTO_1843 )
      ( DELIVER-PKG-VERIFY ?AUTO_1842 ?AUTO_1843 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1847 - OBJ
      ?AUTO_1848 - LOCATION
    )
    :vars
    (
      ?AUTO_1849 - TRUCK
      ?AUTO_1850 - LOCATION
      ?AUTO_1851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1847 ?AUTO_1849 ) ( TRUCK-AT ?AUTO_1849 ?AUTO_1850 ) ( IN-CITY ?AUTO_1850 ?AUTO_1851 ) ( IN-CITY ?AUTO_1848 ?AUTO_1851 ) ( not ( = ?AUTO_1848 ?AUTO_1850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1849 ?AUTO_1850 ?AUTO_1848 ?AUTO_1851 )
      ( DELIVER-PKG ?AUTO_1847 ?AUTO_1848 )
      ( DELIVER-PKG-VERIFY ?AUTO_1847 ?AUTO_1848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1856 - OBJ
      ?AUTO_1857 - LOCATION
    )
    :vars
    (
      ?AUTO_1860 - TRUCK
      ?AUTO_1858 - LOCATION
      ?AUTO_1859 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1860 ?AUTO_1858 ) ( IN-CITY ?AUTO_1858 ?AUTO_1859 ) ( IN-CITY ?AUTO_1857 ?AUTO_1859 ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( OBJ-AT ?AUTO_1856 ?AUTO_1858 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1856 ?AUTO_1860 ?AUTO_1858 )
      ( DELIVER-PKG ?AUTO_1856 ?AUTO_1857 )
      ( DELIVER-PKG-VERIFY ?AUTO_1856 ?AUTO_1857 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1867 - OBJ
      ?AUTO_1868 - LOCATION
    )
    :vars
    (
      ?AUTO_1871 - TRUCK
      ?AUTO_1870 - LOCATION
      ?AUTO_1869 - CITY
      ?AUTO_1872 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1871 ?AUTO_1870 ) ( IN-CITY ?AUTO_1870 ?AUTO_1869 ) ( IN-CITY ?AUTO_1868 ?AUTO_1869 ) ( not ( = ?AUTO_1868 ?AUTO_1870 ) ) ( IN-AIRPLANE ?AUTO_1867 ?AUTO_1872 ) ( AIRPLANE-AT ?AUTO_1872 ?AUTO_1870 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1867 ?AUTO_1872 ?AUTO_1870 )
      ( DELIVER-PKG ?AUTO_1867 ?AUTO_1868 )
      ( DELIVER-PKG-VERIFY ?AUTO_1867 ?AUTO_1868 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1889 - OBJ
      ?AUTO_1890 - LOCATION
    )
    :vars
    (
      ?AUTO_1892 - LOCATION
      ?AUTO_1891 - CITY
      ?AUTO_1893 - AIRPLANE
      ?AUTO_1894 - LOCATION
      ?AUTO_1895 - TRUCK
      ?AUTO_1896 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1892 ?AUTO_1891 ) ( IN-CITY ?AUTO_1890 ?AUTO_1891 ) ( not ( = ?AUTO_1890 ?AUTO_1892 ) ) ( IN-AIRPLANE ?AUTO_1889 ?AUTO_1893 ) ( AIRPORT ?AUTO_1894 ) ( AIRPORT ?AUTO_1892 ) ( AIRPLANE-AT ?AUTO_1893 ?AUTO_1894 ) ( not ( = ?AUTO_1894 ?AUTO_1892 ) ) ( not ( = ?AUTO_1890 ?AUTO_1894 ) ) ( TRUCK-AT ?AUTO_1895 ?AUTO_1896 ) ( IN-CITY ?AUTO_1896 ?AUTO_1891 ) ( not ( = ?AUTO_1892 ?AUTO_1896 ) ) ( not ( = ?AUTO_1890 ?AUTO_1896 ) ) ( not ( = ?AUTO_1894 ?AUTO_1896 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1895 ?AUTO_1896 ?AUTO_1892 ?AUTO_1891 )
      ( DELIVER-PKG ?AUTO_1889 ?AUTO_1890 )
      ( DELIVER-PKG-VERIFY ?AUTO_1889 ?AUTO_1890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1909 - OBJ
      ?AUTO_1910 - LOCATION
    )
    :vars
    (
      ?AUTO_1914 - LOCATION
      ?AUTO_1915 - CITY
      ?AUTO_1912 - LOCATION
      ?AUTO_1916 - AIRPLANE
      ?AUTO_1913 - TRUCK
      ?AUTO_1911 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1914 ?AUTO_1915 ) ( IN-CITY ?AUTO_1910 ?AUTO_1915 ) ( not ( = ?AUTO_1910 ?AUTO_1914 ) ) ( AIRPORT ?AUTO_1912 ) ( AIRPORT ?AUTO_1914 ) ( AIRPLANE-AT ?AUTO_1916 ?AUTO_1912 ) ( not ( = ?AUTO_1912 ?AUTO_1914 ) ) ( not ( = ?AUTO_1910 ?AUTO_1912 ) ) ( TRUCK-AT ?AUTO_1913 ?AUTO_1911 ) ( IN-CITY ?AUTO_1911 ?AUTO_1915 ) ( not ( = ?AUTO_1914 ?AUTO_1911 ) ) ( not ( = ?AUTO_1910 ?AUTO_1911 ) ) ( not ( = ?AUTO_1912 ?AUTO_1911 ) ) ( OBJ-AT ?AUTO_1909 ?AUTO_1912 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1909 ?AUTO_1916 ?AUTO_1912 )
      ( DELIVER-PKG ?AUTO_1909 ?AUTO_1910 )
      ( DELIVER-PKG-VERIFY ?AUTO_1909 ?AUTO_1910 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1919 - OBJ
      ?AUTO_1920 - LOCATION
    )
    :vars
    (
      ?AUTO_1921 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1921 ?AUTO_1920 ) ( IN-TRUCK ?AUTO_1919 ?AUTO_1921 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1919 ?AUTO_1921 ?AUTO_1920 )
      ( DELIVER-PKG-VERIFY ?AUTO_1919 ?AUTO_1920 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1922 - OBJ
      ?AUTO_1923 - LOCATION
    )
    :vars
    (
      ?AUTO_1924 - TRUCK
      ?AUTO_1925 - LOCATION
      ?AUTO_1926 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1922 ?AUTO_1924 ) ( TRUCK-AT ?AUTO_1924 ?AUTO_1925 ) ( IN-CITY ?AUTO_1925 ?AUTO_1926 ) ( IN-CITY ?AUTO_1923 ?AUTO_1926 ) ( not ( = ?AUTO_1923 ?AUTO_1925 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1924 ?AUTO_1925 ?AUTO_1923 ?AUTO_1926 )
      ( DELIVER-PKG ?AUTO_1922 ?AUTO_1923 )
      ( DELIVER-PKG-VERIFY ?AUTO_1922 ?AUTO_1923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1927 - OBJ
      ?AUTO_1928 - LOCATION
    )
    :vars
    (
      ?AUTO_1929 - TRUCK
      ?AUTO_1930 - LOCATION
      ?AUTO_1931 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1929 ?AUTO_1930 ) ( IN-CITY ?AUTO_1930 ?AUTO_1931 ) ( IN-CITY ?AUTO_1928 ?AUTO_1931 ) ( not ( = ?AUTO_1928 ?AUTO_1930 ) ) ( OBJ-AT ?AUTO_1927 ?AUTO_1930 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1927 ?AUTO_1929 ?AUTO_1930 )
      ( DELIVER-PKG ?AUTO_1927 ?AUTO_1928 )
      ( DELIVER-PKG-VERIFY ?AUTO_1927 ?AUTO_1928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1934 - OBJ
      ?AUTO_1935 - LOCATION
    )
    :vars
    (
      ?AUTO_1936 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1934 ?AUTO_1936 ) ( AIRPLANE-AT ?AUTO_1936 ?AUTO_1935 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1934 ?AUTO_1936 ?AUTO_1935 )
      ( DELIVER-PKG-VERIFY ?AUTO_1934 ?AUTO_1935 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1937 - OBJ
      ?AUTO_1938 - LOCATION
    )
    :vars
    (
      ?AUTO_1939 - AIRPLANE
      ?AUTO_1940 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1937 ?AUTO_1939 ) ( AIRPORT ?AUTO_1940 ) ( AIRPORT ?AUTO_1938 ) ( AIRPLANE-AT ?AUTO_1939 ?AUTO_1940 ) ( not ( = ?AUTO_1940 ?AUTO_1938 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1939 ?AUTO_1940 ?AUTO_1938 )
      ( DELIVER-PKG ?AUTO_1937 ?AUTO_1938 )
      ( DELIVER-PKG-VERIFY ?AUTO_1937 ?AUTO_1938 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1945 - OBJ
      ?AUTO_1946 - LOCATION
    )
    :vars
    (
      ?AUTO_1947 - LOCATION
      ?AUTO_1948 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1947 ) ( AIRPORT ?AUTO_1946 ) ( AIRPLANE-AT ?AUTO_1948 ?AUTO_1947 ) ( not ( = ?AUTO_1947 ?AUTO_1946 ) ) ( OBJ-AT ?AUTO_1945 ?AUTO_1947 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1945 ?AUTO_1948 ?AUTO_1947 )
      ( DELIVER-PKG ?AUTO_1945 ?AUTO_1946 )
      ( DELIVER-PKG-VERIFY ?AUTO_1945 ?AUTO_1946 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1957 - OBJ
      ?AUTO_1958 - LOCATION
    )
    :vars
    (
      ?AUTO_1959 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1957 ?AUTO_1959 ) ( AIRPLANE-AT ?AUTO_1959 ?AUTO_1958 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1957 ?AUTO_1959 ?AUTO_1958 )
      ( DELIVER-PKG-VERIFY ?AUTO_1957 ?AUTO_1958 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1960 - OBJ
      ?AUTO_1961 - LOCATION
    )
    :vars
    (
      ?AUTO_1962 - AIRPLANE
      ?AUTO_1963 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1960 ?AUTO_1962 ) ( AIRPORT ?AUTO_1963 ) ( AIRPORT ?AUTO_1961 ) ( AIRPLANE-AT ?AUTO_1962 ?AUTO_1963 ) ( not ( = ?AUTO_1963 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1962 ?AUTO_1963 ?AUTO_1961 )
      ( DELIVER-PKG ?AUTO_1960 ?AUTO_1961 )
      ( DELIVER-PKG-VERIFY ?AUTO_1960 ?AUTO_1961 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1968 - OBJ
      ?AUTO_1969 - LOCATION
    )
    :vars
    (
      ?AUTO_1970 - LOCATION
      ?AUTO_1971 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1970 ) ( AIRPORT ?AUTO_1969 ) ( AIRPLANE-AT ?AUTO_1971 ?AUTO_1970 ) ( not ( = ?AUTO_1970 ?AUTO_1969 ) ) ( OBJ-AT ?AUTO_1968 ?AUTO_1970 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1968 ?AUTO_1971 ?AUTO_1970 )
      ( DELIVER-PKG ?AUTO_1968 ?AUTO_1969 )
      ( DELIVER-PKG-VERIFY ?AUTO_1968 ?AUTO_1969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1972 - OBJ
      ?AUTO_1973 - LOCATION
    )
    :vars
    (
      ?AUTO_1975 - LOCATION
      ?AUTO_1976 - LOCATION
      ?AUTO_1974 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1975 ) ( AIRPORT ?AUTO_1973 ) ( not ( = ?AUTO_1975 ?AUTO_1973 ) ) ( OBJ-AT ?AUTO_1972 ?AUTO_1975 ) ( AIRPORT ?AUTO_1976 ) ( AIRPLANE-AT ?AUTO_1974 ?AUTO_1976 ) ( not ( = ?AUTO_1976 ?AUTO_1975 ) ) ( not ( = ?AUTO_1973 ?AUTO_1976 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1974 ?AUTO_1976 ?AUTO_1975 )
      ( DELIVER-PKG ?AUTO_1972 ?AUTO_1973 )
      ( DELIVER-PKG-VERIFY ?AUTO_1972 ?AUTO_1973 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1979 - OBJ
      ?AUTO_1980 - LOCATION
    )
    :vars
    (
      ?AUTO_1983 - LOCATION
      ?AUTO_1981 - LOCATION
      ?AUTO_1982 - AIRPLANE
      ?AUTO_1984 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1983 ) ( AIRPORT ?AUTO_1980 ) ( not ( = ?AUTO_1983 ?AUTO_1980 ) ) ( AIRPORT ?AUTO_1981 ) ( AIRPLANE-AT ?AUTO_1982 ?AUTO_1981 ) ( not ( = ?AUTO_1981 ?AUTO_1983 ) ) ( not ( = ?AUTO_1980 ?AUTO_1981 ) ) ( TRUCK-AT ?AUTO_1984 ?AUTO_1983 ) ( IN-TRUCK ?AUTO_1979 ?AUTO_1984 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1979 ?AUTO_1984 ?AUTO_1983 )
      ( DELIVER-PKG ?AUTO_1979 ?AUTO_1980 )
      ( DELIVER-PKG-VERIFY ?AUTO_1979 ?AUTO_1980 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1985 - OBJ
      ?AUTO_1986 - LOCATION
    )
    :vars
    (
      ?AUTO_1989 - LOCATION
      ?AUTO_1988 - LOCATION
      ?AUTO_1987 - AIRPLANE
      ?AUTO_1990 - TRUCK
      ?AUTO_1991 - LOCATION
      ?AUTO_1992 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1989 ) ( AIRPORT ?AUTO_1986 ) ( not ( = ?AUTO_1989 ?AUTO_1986 ) ) ( AIRPORT ?AUTO_1988 ) ( AIRPLANE-AT ?AUTO_1987 ?AUTO_1988 ) ( not ( = ?AUTO_1988 ?AUTO_1989 ) ) ( not ( = ?AUTO_1986 ?AUTO_1988 ) ) ( IN-TRUCK ?AUTO_1985 ?AUTO_1990 ) ( TRUCK-AT ?AUTO_1990 ?AUTO_1991 ) ( IN-CITY ?AUTO_1991 ?AUTO_1992 ) ( IN-CITY ?AUTO_1989 ?AUTO_1992 ) ( not ( = ?AUTO_1989 ?AUTO_1991 ) ) ( not ( = ?AUTO_1986 ?AUTO_1991 ) ) ( not ( = ?AUTO_1988 ?AUTO_1991 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1990 ?AUTO_1991 ?AUTO_1989 ?AUTO_1992 )
      ( DELIVER-PKG ?AUTO_1985 ?AUTO_1986 )
      ( DELIVER-PKG-VERIFY ?AUTO_1985 ?AUTO_1986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1993 - OBJ
      ?AUTO_1994 - LOCATION
    )
    :vars
    (
      ?AUTO_2000 - LOCATION
      ?AUTO_1997 - LOCATION
      ?AUTO_1995 - AIRPLANE
      ?AUTO_1999 - TRUCK
      ?AUTO_1998 - LOCATION
      ?AUTO_1996 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2000 ) ( AIRPORT ?AUTO_1994 ) ( not ( = ?AUTO_2000 ?AUTO_1994 ) ) ( AIRPORT ?AUTO_1997 ) ( AIRPLANE-AT ?AUTO_1995 ?AUTO_1997 ) ( not ( = ?AUTO_1997 ?AUTO_2000 ) ) ( not ( = ?AUTO_1994 ?AUTO_1997 ) ) ( TRUCK-AT ?AUTO_1999 ?AUTO_1998 ) ( IN-CITY ?AUTO_1998 ?AUTO_1996 ) ( IN-CITY ?AUTO_2000 ?AUTO_1996 ) ( not ( = ?AUTO_2000 ?AUTO_1998 ) ) ( not ( = ?AUTO_1994 ?AUTO_1998 ) ) ( not ( = ?AUTO_1997 ?AUTO_1998 ) ) ( OBJ-AT ?AUTO_1993 ?AUTO_1998 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1993 ?AUTO_1999 ?AUTO_1998 )
      ( DELIVER-PKG ?AUTO_1993 ?AUTO_1994 )
      ( DELIVER-PKG-VERIFY ?AUTO_1993 ?AUTO_1994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2003 - OBJ
      ?AUTO_2004 - LOCATION
    )
    :vars
    (
      ?AUTO_2005 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2005 ?AUTO_2004 ) ( IN-TRUCK ?AUTO_2003 ?AUTO_2005 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2003 ?AUTO_2005 ?AUTO_2004 )
      ( DELIVER-PKG-VERIFY ?AUTO_2003 ?AUTO_2004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2006 - OBJ
      ?AUTO_2007 - LOCATION
    )
    :vars
    (
      ?AUTO_2008 - TRUCK
      ?AUTO_2009 - LOCATION
      ?AUTO_2010 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2006 ?AUTO_2008 ) ( TRUCK-AT ?AUTO_2008 ?AUTO_2009 ) ( IN-CITY ?AUTO_2009 ?AUTO_2010 ) ( IN-CITY ?AUTO_2007 ?AUTO_2010 ) ( not ( = ?AUTO_2007 ?AUTO_2009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2008 ?AUTO_2009 ?AUTO_2007 ?AUTO_2010 )
      ( DELIVER-PKG ?AUTO_2006 ?AUTO_2007 )
      ( DELIVER-PKG-VERIFY ?AUTO_2006 ?AUTO_2007 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2011 - OBJ
      ?AUTO_2012 - LOCATION
    )
    :vars
    (
      ?AUTO_2013 - TRUCK
      ?AUTO_2014 - LOCATION
      ?AUTO_2015 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2013 ?AUTO_2014 ) ( IN-CITY ?AUTO_2014 ?AUTO_2015 ) ( IN-CITY ?AUTO_2012 ?AUTO_2015 ) ( not ( = ?AUTO_2012 ?AUTO_2014 ) ) ( OBJ-AT ?AUTO_2011 ?AUTO_2014 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2011 ?AUTO_2013 ?AUTO_2014 )
      ( DELIVER-PKG ?AUTO_2011 ?AUTO_2012 )
      ( DELIVER-PKG-VERIFY ?AUTO_2011 ?AUTO_2012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2016 - OBJ
      ?AUTO_2017 - LOCATION
    )
    :vars
    (
      ?AUTO_2018 - LOCATION
      ?AUTO_2020 - CITY
      ?AUTO_2019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2018 ?AUTO_2020 ) ( IN-CITY ?AUTO_2017 ?AUTO_2020 ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) ( OBJ-AT ?AUTO_2016 ?AUTO_2018 ) ( TRUCK-AT ?AUTO_2019 ?AUTO_2017 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2019 ?AUTO_2017 ?AUTO_2018 ?AUTO_2020 )
      ( DELIVER-PKG ?AUTO_2016 ?AUTO_2017 )
      ( DELIVER-PKG-VERIFY ?AUTO_2016 ?AUTO_2017 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2025 - OBJ
      ?AUTO_2026 - LOCATION
    )
    :vars
    (
      ?AUTO_2027 - LOCATION
      ?AUTO_2029 - CITY
      ?AUTO_2028 - TRUCK
      ?AUTO_2030 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2027 ?AUTO_2029 ) ( IN-CITY ?AUTO_2026 ?AUTO_2029 ) ( not ( = ?AUTO_2026 ?AUTO_2027 ) ) ( TRUCK-AT ?AUTO_2028 ?AUTO_2026 ) ( IN-AIRPLANE ?AUTO_2025 ?AUTO_2030 ) ( AIRPLANE-AT ?AUTO_2030 ?AUTO_2027 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2025 ?AUTO_2030 ?AUTO_2027 )
      ( DELIVER-PKG ?AUTO_2025 ?AUTO_2026 )
      ( DELIVER-PKG-VERIFY ?AUTO_2025 ?AUTO_2026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2031 - OBJ
      ?AUTO_2032 - LOCATION
    )
    :vars
    (
      ?AUTO_2033 - LOCATION
      ?AUTO_2035 - CITY
      ?AUTO_2034 - TRUCK
      ?AUTO_2036 - AIRPLANE
      ?AUTO_2037 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2033 ?AUTO_2035 ) ( IN-CITY ?AUTO_2032 ?AUTO_2035 ) ( not ( = ?AUTO_2032 ?AUTO_2033 ) ) ( TRUCK-AT ?AUTO_2034 ?AUTO_2032 ) ( IN-AIRPLANE ?AUTO_2031 ?AUTO_2036 ) ( AIRPORT ?AUTO_2037 ) ( AIRPORT ?AUTO_2033 ) ( AIRPLANE-AT ?AUTO_2036 ?AUTO_2037 ) ( not ( = ?AUTO_2037 ?AUTO_2033 ) ) ( not ( = ?AUTO_2032 ?AUTO_2037 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2036 ?AUTO_2037 ?AUTO_2033 )
      ( DELIVER-PKG ?AUTO_2031 ?AUTO_2032 )
      ( DELIVER-PKG-VERIFY ?AUTO_2031 ?AUTO_2032 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2042 - OBJ
      ?AUTO_2043 - LOCATION
    )
    :vars
    (
      ?AUTO_2044 - LOCATION
      ?AUTO_2048 - CITY
      ?AUTO_2045 - TRUCK
      ?AUTO_2047 - LOCATION
      ?AUTO_2046 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2044 ?AUTO_2048 ) ( IN-CITY ?AUTO_2043 ?AUTO_2048 ) ( not ( = ?AUTO_2043 ?AUTO_2044 ) ) ( TRUCK-AT ?AUTO_2045 ?AUTO_2043 ) ( AIRPORT ?AUTO_2047 ) ( AIRPORT ?AUTO_2044 ) ( AIRPLANE-AT ?AUTO_2046 ?AUTO_2047 ) ( not ( = ?AUTO_2047 ?AUTO_2044 ) ) ( not ( = ?AUTO_2043 ?AUTO_2047 ) ) ( OBJ-AT ?AUTO_2042 ?AUTO_2047 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2042 ?AUTO_2046 ?AUTO_2047 )
      ( DELIVER-PKG ?AUTO_2042 ?AUTO_2043 )
      ( DELIVER-PKG-VERIFY ?AUTO_2042 ?AUTO_2043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2057 - OBJ
      ?AUTO_2058 - LOCATION
    )
    :vars
    (
      ?AUTO_2059 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2059 ?AUTO_2058 ) ( IN-TRUCK ?AUTO_2057 ?AUTO_2059 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2057 ?AUTO_2059 ?AUTO_2058 )
      ( DELIVER-PKG-VERIFY ?AUTO_2057 ?AUTO_2058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2060 - OBJ
      ?AUTO_2061 - LOCATION
    )
    :vars
    (
      ?AUTO_2062 - TRUCK
      ?AUTO_2063 - LOCATION
      ?AUTO_2064 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2060 ?AUTO_2062 ) ( TRUCK-AT ?AUTO_2062 ?AUTO_2063 ) ( IN-CITY ?AUTO_2063 ?AUTO_2064 ) ( IN-CITY ?AUTO_2061 ?AUTO_2064 ) ( not ( = ?AUTO_2061 ?AUTO_2063 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2062 ?AUTO_2063 ?AUTO_2061 ?AUTO_2064 )
      ( DELIVER-PKG ?AUTO_2060 ?AUTO_2061 )
      ( DELIVER-PKG-VERIFY ?AUTO_2060 ?AUTO_2061 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2065 - OBJ
      ?AUTO_2066 - LOCATION
    )
    :vars
    (
      ?AUTO_2067 - TRUCK
      ?AUTO_2068 - LOCATION
      ?AUTO_2069 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2067 ?AUTO_2068 ) ( IN-CITY ?AUTO_2068 ?AUTO_2069 ) ( IN-CITY ?AUTO_2066 ?AUTO_2069 ) ( not ( = ?AUTO_2066 ?AUTO_2068 ) ) ( OBJ-AT ?AUTO_2065 ?AUTO_2068 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2065 ?AUTO_2067 ?AUTO_2068 )
      ( DELIVER-PKG ?AUTO_2065 ?AUTO_2066 )
      ( DELIVER-PKG-VERIFY ?AUTO_2065 ?AUTO_2066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2070 - OBJ
      ?AUTO_2071 - LOCATION
    )
    :vars
    (
      ?AUTO_2072 - LOCATION
      ?AUTO_2074 - CITY
      ?AUTO_2073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2072 ?AUTO_2074 ) ( IN-CITY ?AUTO_2071 ?AUTO_2074 ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) ( OBJ-AT ?AUTO_2070 ?AUTO_2072 ) ( TRUCK-AT ?AUTO_2073 ?AUTO_2071 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2073 ?AUTO_2071 ?AUTO_2072 ?AUTO_2074 )
      ( DELIVER-PKG ?AUTO_2070 ?AUTO_2071 )
      ( DELIVER-PKG-VERIFY ?AUTO_2070 ?AUTO_2071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2083 - OBJ
      ?AUTO_2084 - LOCATION
    )
    :vars
    (
      ?AUTO_2086 - LOCATION
      ?AUTO_2087 - CITY
      ?AUTO_2085 - TRUCK
      ?AUTO_2088 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2086 ?AUTO_2087 ) ( IN-CITY ?AUTO_2084 ?AUTO_2087 ) ( not ( = ?AUTO_2084 ?AUTO_2086 ) ) ( TRUCK-AT ?AUTO_2085 ?AUTO_2084 ) ( IN-AIRPLANE ?AUTO_2083 ?AUTO_2088 ) ( AIRPLANE-AT ?AUTO_2088 ?AUTO_2086 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2083 ?AUTO_2088 ?AUTO_2086 )
      ( DELIVER-PKG ?AUTO_2083 ?AUTO_2084 )
      ( DELIVER-PKG-VERIFY ?AUTO_2083 ?AUTO_2084 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2089 - OBJ
      ?AUTO_2090 - LOCATION
    )
    :vars
    (
      ?AUTO_2091 - LOCATION
      ?AUTO_2093 - CITY
      ?AUTO_2092 - TRUCK
      ?AUTO_2094 - AIRPLANE
      ?AUTO_2095 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2091 ?AUTO_2093 ) ( IN-CITY ?AUTO_2090 ?AUTO_2093 ) ( not ( = ?AUTO_2090 ?AUTO_2091 ) ) ( TRUCK-AT ?AUTO_2092 ?AUTO_2090 ) ( IN-AIRPLANE ?AUTO_2089 ?AUTO_2094 ) ( AIRPORT ?AUTO_2095 ) ( AIRPORT ?AUTO_2091 ) ( AIRPLANE-AT ?AUTO_2094 ?AUTO_2095 ) ( not ( = ?AUTO_2095 ?AUTO_2091 ) ) ( not ( = ?AUTO_2090 ?AUTO_2095 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2094 ?AUTO_2095 ?AUTO_2091 )
      ( DELIVER-PKG ?AUTO_2089 ?AUTO_2090 )
      ( DELIVER-PKG-VERIFY ?AUTO_2089 ?AUTO_2090 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2100 - OBJ
      ?AUTO_2101 - LOCATION
    )
    :vars
    (
      ?AUTO_2105 - LOCATION
      ?AUTO_2103 - CITY
      ?AUTO_2102 - TRUCK
      ?AUTO_2106 - LOCATION
      ?AUTO_2104 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2105 ?AUTO_2103 ) ( IN-CITY ?AUTO_2101 ?AUTO_2103 ) ( not ( = ?AUTO_2101 ?AUTO_2105 ) ) ( TRUCK-AT ?AUTO_2102 ?AUTO_2101 ) ( AIRPORT ?AUTO_2106 ) ( AIRPORT ?AUTO_2105 ) ( AIRPLANE-AT ?AUTO_2104 ?AUTO_2106 ) ( not ( = ?AUTO_2106 ?AUTO_2105 ) ) ( not ( = ?AUTO_2101 ?AUTO_2106 ) ) ( OBJ-AT ?AUTO_2100 ?AUTO_2106 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2100 ?AUTO_2104 ?AUTO_2106 )
      ( DELIVER-PKG ?AUTO_2100 ?AUTO_2101 )
      ( DELIVER-PKG-VERIFY ?AUTO_2100 ?AUTO_2101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2107 - OBJ
      ?AUTO_2108 - LOCATION
    )
    :vars
    (
      ?AUTO_2111 - LOCATION
      ?AUTO_2109 - CITY
      ?AUTO_2110 - TRUCK
      ?AUTO_2112 - LOCATION
      ?AUTO_2113 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2111 ?AUTO_2109 ) ( IN-CITY ?AUTO_2108 ?AUTO_2109 ) ( not ( = ?AUTO_2108 ?AUTO_2111 ) ) ( TRUCK-AT ?AUTO_2110 ?AUTO_2108 ) ( AIRPORT ?AUTO_2112 ) ( AIRPORT ?AUTO_2111 ) ( not ( = ?AUTO_2112 ?AUTO_2111 ) ) ( not ( = ?AUTO_2108 ?AUTO_2112 ) ) ( OBJ-AT ?AUTO_2107 ?AUTO_2112 ) ( AIRPLANE-AT ?AUTO_2113 ?AUTO_2111 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2113 ?AUTO_2111 ?AUTO_2112 )
      ( DELIVER-PKG ?AUTO_2107 ?AUTO_2108 )
      ( DELIVER-PKG-VERIFY ?AUTO_2107 ?AUTO_2108 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2116 - OBJ
      ?AUTO_2117 - LOCATION
    )
    :vars
    (
      ?AUTO_2119 - LOCATION
      ?AUTO_2118 - CITY
      ?AUTO_2122 - TRUCK
      ?AUTO_2121 - LOCATION
      ?AUTO_2120 - AIRPLANE
      ?AUTO_2123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2119 ?AUTO_2118 ) ( IN-CITY ?AUTO_2117 ?AUTO_2118 ) ( not ( = ?AUTO_2117 ?AUTO_2119 ) ) ( TRUCK-AT ?AUTO_2122 ?AUTO_2117 ) ( AIRPORT ?AUTO_2121 ) ( AIRPORT ?AUTO_2119 ) ( not ( = ?AUTO_2121 ?AUTO_2119 ) ) ( not ( = ?AUTO_2117 ?AUTO_2121 ) ) ( AIRPLANE-AT ?AUTO_2120 ?AUTO_2119 ) ( TRUCK-AT ?AUTO_2123 ?AUTO_2121 ) ( IN-TRUCK ?AUTO_2116 ?AUTO_2123 ) ( not ( = ?AUTO_2122 ?AUTO_2123 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2116 ?AUTO_2123 ?AUTO_2121 )
      ( DELIVER-PKG ?AUTO_2116 ?AUTO_2117 )
      ( DELIVER-PKG-VERIFY ?AUTO_2116 ?AUTO_2117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2124 - OBJ
      ?AUTO_2125 - LOCATION
    )
    :vars
    (
      ?AUTO_2126 - LOCATION
      ?AUTO_2130 - CITY
      ?AUTO_2129 - TRUCK
      ?AUTO_2128 - LOCATION
      ?AUTO_2127 - AIRPLANE
      ?AUTO_2131 - TRUCK
      ?AUTO_2132 - LOCATION
      ?AUTO_2133 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2126 ?AUTO_2130 ) ( IN-CITY ?AUTO_2125 ?AUTO_2130 ) ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) ( TRUCK-AT ?AUTO_2129 ?AUTO_2125 ) ( AIRPORT ?AUTO_2128 ) ( AIRPORT ?AUTO_2126 ) ( not ( = ?AUTO_2128 ?AUTO_2126 ) ) ( not ( = ?AUTO_2125 ?AUTO_2128 ) ) ( AIRPLANE-AT ?AUTO_2127 ?AUTO_2126 ) ( IN-TRUCK ?AUTO_2124 ?AUTO_2131 ) ( not ( = ?AUTO_2129 ?AUTO_2131 ) ) ( TRUCK-AT ?AUTO_2131 ?AUTO_2132 ) ( IN-CITY ?AUTO_2132 ?AUTO_2133 ) ( IN-CITY ?AUTO_2128 ?AUTO_2133 ) ( not ( = ?AUTO_2128 ?AUTO_2132 ) ) ( not ( = ?AUTO_2125 ?AUTO_2132 ) ) ( not ( = ?AUTO_2126 ?AUTO_2132 ) ) ( not ( = ?AUTO_2130 ?AUTO_2133 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2131 ?AUTO_2132 ?AUTO_2128 ?AUTO_2133 )
      ( DELIVER-PKG ?AUTO_2124 ?AUTO_2125 )
      ( DELIVER-PKG-VERIFY ?AUTO_2124 ?AUTO_2125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2134 - OBJ
      ?AUTO_2135 - LOCATION
    )
    :vars
    (
      ?AUTO_2141 - LOCATION
      ?AUTO_2139 - CITY
      ?AUTO_2136 - TRUCK
      ?AUTO_2140 - LOCATION
      ?AUTO_2137 - AIRPLANE
      ?AUTO_2138 - TRUCK
      ?AUTO_2143 - LOCATION
      ?AUTO_2142 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2141 ?AUTO_2139 ) ( IN-CITY ?AUTO_2135 ?AUTO_2139 ) ( not ( = ?AUTO_2135 ?AUTO_2141 ) ) ( TRUCK-AT ?AUTO_2136 ?AUTO_2135 ) ( AIRPORT ?AUTO_2140 ) ( AIRPORT ?AUTO_2141 ) ( not ( = ?AUTO_2140 ?AUTO_2141 ) ) ( not ( = ?AUTO_2135 ?AUTO_2140 ) ) ( AIRPLANE-AT ?AUTO_2137 ?AUTO_2141 ) ( not ( = ?AUTO_2136 ?AUTO_2138 ) ) ( TRUCK-AT ?AUTO_2138 ?AUTO_2143 ) ( IN-CITY ?AUTO_2143 ?AUTO_2142 ) ( IN-CITY ?AUTO_2140 ?AUTO_2142 ) ( not ( = ?AUTO_2140 ?AUTO_2143 ) ) ( not ( = ?AUTO_2135 ?AUTO_2143 ) ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2139 ?AUTO_2142 ) ) ( OBJ-AT ?AUTO_2134 ?AUTO_2143 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2134 ?AUTO_2138 ?AUTO_2143 )
      ( DELIVER-PKG ?AUTO_2134 ?AUTO_2135 )
      ( DELIVER-PKG-VERIFY ?AUTO_2134 ?AUTO_2135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2146 - OBJ
      ?AUTO_2147 - LOCATION
    )
    :vars
    (
      ?AUTO_2148 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2146 ?AUTO_2148 ) ( AIRPLANE-AT ?AUTO_2148 ?AUTO_2147 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2146 ?AUTO_2148 ?AUTO_2147 )
      ( DELIVER-PKG-VERIFY ?AUTO_2146 ?AUTO_2147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2149 - OBJ
      ?AUTO_2150 - LOCATION
    )
    :vars
    (
      ?AUTO_2151 - AIRPLANE
      ?AUTO_2152 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2149 ?AUTO_2151 ) ( AIRPORT ?AUTO_2152 ) ( AIRPORT ?AUTO_2150 ) ( AIRPLANE-AT ?AUTO_2151 ?AUTO_2152 ) ( not ( = ?AUTO_2152 ?AUTO_2150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2151 ?AUTO_2152 ?AUTO_2150 )
      ( DELIVER-PKG ?AUTO_2149 ?AUTO_2150 )
      ( DELIVER-PKG-VERIFY ?AUTO_2149 ?AUTO_2150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2157 - OBJ
      ?AUTO_2158 - LOCATION
    )
    :vars
    (
      ?AUTO_2159 - LOCATION
      ?AUTO_2160 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2159 ) ( AIRPORT ?AUTO_2158 ) ( AIRPLANE-AT ?AUTO_2160 ?AUTO_2159 ) ( not ( = ?AUTO_2159 ?AUTO_2158 ) ) ( OBJ-AT ?AUTO_2157 ?AUTO_2159 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2157 ?AUTO_2160 ?AUTO_2159 )
      ( DELIVER-PKG ?AUTO_2157 ?AUTO_2158 )
      ( DELIVER-PKG-VERIFY ?AUTO_2157 ?AUTO_2158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2163 - OBJ
      ?AUTO_2164 - LOCATION
    )
    :vars
    (
      ?AUTO_2166 - LOCATION
      ?AUTO_2167 - LOCATION
      ?AUTO_2165 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2166 ) ( AIRPORT ?AUTO_2164 ) ( not ( = ?AUTO_2166 ?AUTO_2164 ) ) ( OBJ-AT ?AUTO_2163 ?AUTO_2166 ) ( AIRPORT ?AUTO_2167 ) ( AIRPLANE-AT ?AUTO_2165 ?AUTO_2167 ) ( not ( = ?AUTO_2167 ?AUTO_2166 ) ) ( not ( = ?AUTO_2164 ?AUTO_2167 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2165 ?AUTO_2167 ?AUTO_2166 )
      ( DELIVER-PKG ?AUTO_2163 ?AUTO_2164 )
      ( DELIVER-PKG-VERIFY ?AUTO_2163 ?AUTO_2164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2172 - OBJ
      ?AUTO_2173 - LOCATION
    )
    :vars
    (
      ?AUTO_2174 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2174 ?AUTO_2173 ) ( IN-TRUCK ?AUTO_2172 ?AUTO_2174 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2172 ?AUTO_2174 ?AUTO_2173 )
      ( DELIVER-PKG-VERIFY ?AUTO_2172 ?AUTO_2173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2175 - OBJ
      ?AUTO_2176 - LOCATION
    )
    :vars
    (
      ?AUTO_2177 - TRUCK
      ?AUTO_2178 - LOCATION
      ?AUTO_2179 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2175 ?AUTO_2177 ) ( TRUCK-AT ?AUTO_2177 ?AUTO_2178 ) ( IN-CITY ?AUTO_2178 ?AUTO_2179 ) ( IN-CITY ?AUTO_2176 ?AUTO_2179 ) ( not ( = ?AUTO_2176 ?AUTO_2178 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2177 ?AUTO_2178 ?AUTO_2176 ?AUTO_2179 )
      ( DELIVER-PKG ?AUTO_2175 ?AUTO_2176 )
      ( DELIVER-PKG-VERIFY ?AUTO_2175 ?AUTO_2176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2196 - OBJ
      ?AUTO_2197 - LOCATION
    )
    :vars
    (
      ?AUTO_2200 - TRUCK
      ?AUTO_2199 - LOCATION
      ?AUTO_2198 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2200 ?AUTO_2199 ) ( IN-CITY ?AUTO_2199 ?AUTO_2198 ) ( IN-CITY ?AUTO_2197 ?AUTO_2198 ) ( not ( = ?AUTO_2197 ?AUTO_2199 ) ) ( OBJ-AT ?AUTO_2196 ?AUTO_2199 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2196 ?AUTO_2200 ?AUTO_2199 )
      ( DELIVER-PKG ?AUTO_2196 ?AUTO_2197 )
      ( DELIVER-PKG-VERIFY ?AUTO_2196 ?AUTO_2197 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2203 - OBJ
      ?AUTO_2204 - LOCATION
    )
    :vars
    (
      ?AUTO_2205 - LOCATION
      ?AUTO_2206 - CITY
      ?AUTO_2207 - TRUCK
      ?AUTO_2208 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2205 ?AUTO_2206 ) ( IN-CITY ?AUTO_2204 ?AUTO_2206 ) ( not ( = ?AUTO_2204 ?AUTO_2205 ) ) ( OBJ-AT ?AUTO_2203 ?AUTO_2205 ) ( TRUCK-AT ?AUTO_2207 ?AUTO_2208 ) ( IN-CITY ?AUTO_2208 ?AUTO_2206 ) ( not ( = ?AUTO_2205 ?AUTO_2208 ) ) ( not ( = ?AUTO_2204 ?AUTO_2208 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2207 ?AUTO_2208 ?AUTO_2205 ?AUTO_2206 )
      ( DELIVER-PKG ?AUTO_2203 ?AUTO_2204 )
      ( DELIVER-PKG-VERIFY ?AUTO_2203 ?AUTO_2204 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2211 - OBJ
      ?AUTO_2212 - LOCATION
    )
    :vars
    (
      ?AUTO_2213 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2211 ?AUTO_2213 ) ( AIRPLANE-AT ?AUTO_2213 ?AUTO_2212 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2211 ?AUTO_2213 ?AUTO_2212 )
      ( DELIVER-PKG-VERIFY ?AUTO_2211 ?AUTO_2212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2218 - OBJ
      ?AUTO_2219 - LOCATION
    )
    :vars
    (
      ?AUTO_2220 - AIRPLANE
      ?AUTO_2221 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2218 ?AUTO_2220 ) ( AIRPORT ?AUTO_2221 ) ( AIRPORT ?AUTO_2219 ) ( AIRPLANE-AT ?AUTO_2220 ?AUTO_2221 ) ( not ( = ?AUTO_2221 ?AUTO_2219 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2220 ?AUTO_2221 ?AUTO_2219 )
      ( DELIVER-PKG ?AUTO_2218 ?AUTO_2219 )
      ( DELIVER-PKG-VERIFY ?AUTO_2218 ?AUTO_2219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2230 - OBJ
      ?AUTO_2231 - LOCATION
    )
    :vars
    (
      ?AUTO_2232 - LOCATION
      ?AUTO_2233 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2232 ) ( AIRPORT ?AUTO_2231 ) ( AIRPLANE-AT ?AUTO_2233 ?AUTO_2232 ) ( not ( = ?AUTO_2232 ?AUTO_2231 ) ) ( OBJ-AT ?AUTO_2230 ?AUTO_2232 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2230 ?AUTO_2233 ?AUTO_2232 )
      ( DELIVER-PKG ?AUTO_2230 ?AUTO_2231 )
      ( DELIVER-PKG-VERIFY ?AUTO_2230 ?AUTO_2231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2234 - OBJ
      ?AUTO_2235 - LOCATION
    )
    :vars
    (
      ?AUTO_2237 - LOCATION
      ?AUTO_2238 - LOCATION
      ?AUTO_2236 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2237 ) ( AIRPORT ?AUTO_2235 ) ( not ( = ?AUTO_2237 ?AUTO_2235 ) ) ( OBJ-AT ?AUTO_2234 ?AUTO_2237 ) ( AIRPORT ?AUTO_2238 ) ( AIRPLANE-AT ?AUTO_2236 ?AUTO_2238 ) ( not ( = ?AUTO_2238 ?AUTO_2237 ) ) ( not ( = ?AUTO_2235 ?AUTO_2238 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2236 ?AUTO_2238 ?AUTO_2237 )
      ( DELIVER-PKG ?AUTO_2234 ?AUTO_2235 )
      ( DELIVER-PKG-VERIFY ?AUTO_2234 ?AUTO_2235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2249 - OBJ
      ?AUTO_2250 - LOCATION
    )
    :vars
    (
      ?AUTO_2251 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2249 ?AUTO_2251 ) ( AIRPLANE-AT ?AUTO_2251 ?AUTO_2250 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2249 ?AUTO_2251 ?AUTO_2250 )
      ( DELIVER-PKG-VERIFY ?AUTO_2249 ?AUTO_2250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2252 - OBJ
      ?AUTO_2253 - LOCATION
    )
    :vars
    (
      ?AUTO_2254 - AIRPLANE
      ?AUTO_2255 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2252 ?AUTO_2254 ) ( AIRPORT ?AUTO_2255 ) ( AIRPORT ?AUTO_2253 ) ( AIRPLANE-AT ?AUTO_2254 ?AUTO_2255 ) ( not ( = ?AUTO_2255 ?AUTO_2253 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2254 ?AUTO_2255 ?AUTO_2253 )
      ( DELIVER-PKG ?AUTO_2252 ?AUTO_2253 )
      ( DELIVER-PKG-VERIFY ?AUTO_2252 ?AUTO_2253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2260 - OBJ
      ?AUTO_2261 - LOCATION
    )
    :vars
    (
      ?AUTO_2262 - LOCATION
      ?AUTO_2263 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2262 ) ( AIRPORT ?AUTO_2261 ) ( AIRPLANE-AT ?AUTO_2263 ?AUTO_2262 ) ( not ( = ?AUTO_2262 ?AUTO_2261 ) ) ( OBJ-AT ?AUTO_2260 ?AUTO_2262 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2260 ?AUTO_2263 ?AUTO_2262 )
      ( DELIVER-PKG ?AUTO_2260 ?AUTO_2261 )
      ( DELIVER-PKG-VERIFY ?AUTO_2260 ?AUTO_2261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2266 - OBJ
      ?AUTO_2267 - LOCATION
    )
    :vars
    (
      ?AUTO_2269 - LOCATION
      ?AUTO_2268 - AIRPLANE
      ?AUTO_2270 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2269 ) ( AIRPORT ?AUTO_2267 ) ( AIRPLANE-AT ?AUTO_2268 ?AUTO_2269 ) ( not ( = ?AUTO_2269 ?AUTO_2267 ) ) ( TRUCK-AT ?AUTO_2270 ?AUTO_2269 ) ( IN-TRUCK ?AUTO_2266 ?AUTO_2270 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2266 ?AUTO_2270 ?AUTO_2269 )
      ( DELIVER-PKG ?AUTO_2266 ?AUTO_2267 )
      ( DELIVER-PKG-VERIFY ?AUTO_2266 ?AUTO_2267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2271 - OBJ
      ?AUTO_2272 - LOCATION
    )
    :vars
    (
      ?AUTO_2273 - LOCATION
      ?AUTO_2274 - AIRPLANE
      ?AUTO_2275 - TRUCK
      ?AUTO_2276 - LOCATION
      ?AUTO_2277 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2273 ) ( AIRPORT ?AUTO_2272 ) ( AIRPLANE-AT ?AUTO_2274 ?AUTO_2273 ) ( not ( = ?AUTO_2273 ?AUTO_2272 ) ) ( IN-TRUCK ?AUTO_2271 ?AUTO_2275 ) ( TRUCK-AT ?AUTO_2275 ?AUTO_2276 ) ( IN-CITY ?AUTO_2276 ?AUTO_2277 ) ( IN-CITY ?AUTO_2273 ?AUTO_2277 ) ( not ( = ?AUTO_2273 ?AUTO_2276 ) ) ( not ( = ?AUTO_2272 ?AUTO_2276 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2275 ?AUTO_2276 ?AUTO_2273 ?AUTO_2277 )
      ( DELIVER-PKG ?AUTO_2271 ?AUTO_2272 )
      ( DELIVER-PKG-VERIFY ?AUTO_2271 ?AUTO_2272 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2278 - OBJ
      ?AUTO_2279 - LOCATION
    )
    :vars
    (
      ?AUTO_2280 - LOCATION
      ?AUTO_2283 - TRUCK
      ?AUTO_2284 - LOCATION
      ?AUTO_2282 - CITY
      ?AUTO_2285 - LOCATION
      ?AUTO_2281 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2280 ) ( AIRPORT ?AUTO_2279 ) ( not ( = ?AUTO_2280 ?AUTO_2279 ) ) ( IN-TRUCK ?AUTO_2278 ?AUTO_2283 ) ( TRUCK-AT ?AUTO_2283 ?AUTO_2284 ) ( IN-CITY ?AUTO_2284 ?AUTO_2282 ) ( IN-CITY ?AUTO_2280 ?AUTO_2282 ) ( not ( = ?AUTO_2280 ?AUTO_2284 ) ) ( not ( = ?AUTO_2279 ?AUTO_2284 ) ) ( AIRPORT ?AUTO_2285 ) ( AIRPLANE-AT ?AUTO_2281 ?AUTO_2285 ) ( not ( = ?AUTO_2285 ?AUTO_2280 ) ) ( not ( = ?AUTO_2279 ?AUTO_2285 ) ) ( not ( = ?AUTO_2284 ?AUTO_2285 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2281 ?AUTO_2285 ?AUTO_2280 )
      ( DELIVER-PKG ?AUTO_2278 ?AUTO_2279 )
      ( DELIVER-PKG-VERIFY ?AUTO_2278 ?AUTO_2279 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2300 - OBJ
      ?AUTO_2301 - LOCATION
    )
    :vars
    (
      ?AUTO_2305 - LOCATION
      ?AUTO_2303 - TRUCK
      ?AUTO_2302 - LOCATION
      ?AUTO_2307 - CITY
      ?AUTO_2304 - LOCATION
      ?AUTO_2306 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2305 ) ( AIRPORT ?AUTO_2301 ) ( not ( = ?AUTO_2305 ?AUTO_2301 ) ) ( TRUCK-AT ?AUTO_2303 ?AUTO_2302 ) ( IN-CITY ?AUTO_2302 ?AUTO_2307 ) ( IN-CITY ?AUTO_2305 ?AUTO_2307 ) ( not ( = ?AUTO_2305 ?AUTO_2302 ) ) ( not ( = ?AUTO_2301 ?AUTO_2302 ) ) ( AIRPORT ?AUTO_2304 ) ( AIRPLANE-AT ?AUTO_2306 ?AUTO_2304 ) ( not ( = ?AUTO_2304 ?AUTO_2305 ) ) ( not ( = ?AUTO_2301 ?AUTO_2304 ) ) ( not ( = ?AUTO_2302 ?AUTO_2304 ) ) ( OBJ-AT ?AUTO_2300 ?AUTO_2302 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2300 ?AUTO_2303 ?AUTO_2302 )
      ( DELIVER-PKG ?AUTO_2300 ?AUTO_2301 )
      ( DELIVER-PKG-VERIFY ?AUTO_2300 ?AUTO_2301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2310 - OBJ
      ?AUTO_2311 - LOCATION
    )
    :vars
    (
      ?AUTO_2314 - LOCATION
      ?AUTO_2312 - LOCATION
      ?AUTO_2317 - CITY
      ?AUTO_2316 - LOCATION
      ?AUTO_2315 - AIRPLANE
      ?AUTO_2313 - TRUCK
      ?AUTO_2318 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2314 ) ( AIRPORT ?AUTO_2311 ) ( not ( = ?AUTO_2314 ?AUTO_2311 ) ) ( IN-CITY ?AUTO_2312 ?AUTO_2317 ) ( IN-CITY ?AUTO_2314 ?AUTO_2317 ) ( not ( = ?AUTO_2314 ?AUTO_2312 ) ) ( not ( = ?AUTO_2311 ?AUTO_2312 ) ) ( AIRPORT ?AUTO_2316 ) ( AIRPLANE-AT ?AUTO_2315 ?AUTO_2316 ) ( not ( = ?AUTO_2316 ?AUTO_2314 ) ) ( not ( = ?AUTO_2311 ?AUTO_2316 ) ) ( not ( = ?AUTO_2312 ?AUTO_2316 ) ) ( OBJ-AT ?AUTO_2310 ?AUTO_2312 ) ( TRUCK-AT ?AUTO_2313 ?AUTO_2318 ) ( IN-CITY ?AUTO_2318 ?AUTO_2317 ) ( not ( = ?AUTO_2312 ?AUTO_2318 ) ) ( not ( = ?AUTO_2311 ?AUTO_2318 ) ) ( not ( = ?AUTO_2314 ?AUTO_2318 ) ) ( not ( = ?AUTO_2316 ?AUTO_2318 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2313 ?AUTO_2318 ?AUTO_2312 ?AUTO_2317 )
      ( DELIVER-PKG ?AUTO_2310 ?AUTO_2311 )
      ( DELIVER-PKG-VERIFY ?AUTO_2310 ?AUTO_2311 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2321 - OBJ
      ?AUTO_2322 - LOCATION
    )
    :vars
    (
      ?AUTO_2323 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2323 ?AUTO_2322 ) ( IN-TRUCK ?AUTO_2321 ?AUTO_2323 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2321 ?AUTO_2323 ?AUTO_2322 )
      ( DELIVER-PKG-VERIFY ?AUTO_2321 ?AUTO_2322 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2328 - OBJ
      ?AUTO_2329 - LOCATION
    )
    :vars
    (
      ?AUTO_2330 - TRUCK
      ?AUTO_2331 - LOCATION
      ?AUTO_2332 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2328 ?AUTO_2330 ) ( TRUCK-AT ?AUTO_2330 ?AUTO_2331 ) ( IN-CITY ?AUTO_2331 ?AUTO_2332 ) ( IN-CITY ?AUTO_2329 ?AUTO_2332 ) ( not ( = ?AUTO_2329 ?AUTO_2331 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2330 ?AUTO_2331 ?AUTO_2329 ?AUTO_2332 )
      ( DELIVER-PKG ?AUTO_2328 ?AUTO_2329 )
      ( DELIVER-PKG-VERIFY ?AUTO_2328 ?AUTO_2329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2333 - OBJ
      ?AUTO_2334 - LOCATION
    )
    :vars
    (
      ?AUTO_2335 - TRUCK
      ?AUTO_2336 - LOCATION
      ?AUTO_2337 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2335 ?AUTO_2336 ) ( IN-CITY ?AUTO_2336 ?AUTO_2337 ) ( IN-CITY ?AUTO_2334 ?AUTO_2337 ) ( not ( = ?AUTO_2334 ?AUTO_2336 ) ) ( OBJ-AT ?AUTO_2333 ?AUTO_2336 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2333 ?AUTO_2335 ?AUTO_2336 )
      ( DELIVER-PKG ?AUTO_2333 ?AUTO_2334 )
      ( DELIVER-PKG-VERIFY ?AUTO_2333 ?AUTO_2334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2340 - OBJ
      ?AUTO_2341 - LOCATION
    )
    :vars
    (
      ?AUTO_2342 - TRUCK
      ?AUTO_2344 - LOCATION
      ?AUTO_2343 - CITY
      ?AUTO_2345 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2342 ?AUTO_2344 ) ( IN-CITY ?AUTO_2344 ?AUTO_2343 ) ( IN-CITY ?AUTO_2341 ?AUTO_2343 ) ( not ( = ?AUTO_2341 ?AUTO_2344 ) ) ( IN-AIRPLANE ?AUTO_2340 ?AUTO_2345 ) ( AIRPLANE-AT ?AUTO_2345 ?AUTO_2344 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2340 ?AUTO_2345 ?AUTO_2344 )
      ( DELIVER-PKG ?AUTO_2340 ?AUTO_2341 )
      ( DELIVER-PKG-VERIFY ?AUTO_2340 ?AUTO_2341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2348 - OBJ
      ?AUTO_2349 - LOCATION
    )
    :vars
    (
      ?AUTO_2350 - LOCATION
      ?AUTO_2351 - CITY
      ?AUTO_2352 - AIRPLANE
      ?AUTO_2353 - TRUCK
      ?AUTO_2354 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2350 ?AUTO_2351 ) ( IN-CITY ?AUTO_2349 ?AUTO_2351 ) ( not ( = ?AUTO_2349 ?AUTO_2350 ) ) ( IN-AIRPLANE ?AUTO_2348 ?AUTO_2352 ) ( AIRPLANE-AT ?AUTO_2352 ?AUTO_2350 ) ( TRUCK-AT ?AUTO_2353 ?AUTO_2354 ) ( IN-CITY ?AUTO_2354 ?AUTO_2351 ) ( not ( = ?AUTO_2350 ?AUTO_2354 ) ) ( not ( = ?AUTO_2349 ?AUTO_2354 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2353 ?AUTO_2354 ?AUTO_2350 ?AUTO_2351 )
      ( DELIVER-PKG ?AUTO_2348 ?AUTO_2349 )
      ( DELIVER-PKG-VERIFY ?AUTO_2348 ?AUTO_2349 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2355 - OBJ
      ?AUTO_2356 - LOCATION
    )
    :vars
    (
      ?AUTO_2357 - LOCATION
      ?AUTO_2358 - CITY
      ?AUTO_2360 - AIRPLANE
      ?AUTO_2359 - TRUCK
      ?AUTO_2361 - LOCATION
      ?AUTO_2362 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2357 ?AUTO_2358 ) ( IN-CITY ?AUTO_2356 ?AUTO_2358 ) ( not ( = ?AUTO_2356 ?AUTO_2357 ) ) ( IN-AIRPLANE ?AUTO_2355 ?AUTO_2360 ) ( TRUCK-AT ?AUTO_2359 ?AUTO_2361 ) ( IN-CITY ?AUTO_2361 ?AUTO_2358 ) ( not ( = ?AUTO_2357 ?AUTO_2361 ) ) ( not ( = ?AUTO_2356 ?AUTO_2361 ) ) ( AIRPORT ?AUTO_2362 ) ( AIRPORT ?AUTO_2357 ) ( AIRPLANE-AT ?AUTO_2360 ?AUTO_2362 ) ( not ( = ?AUTO_2362 ?AUTO_2357 ) ) ( not ( = ?AUTO_2356 ?AUTO_2362 ) ) ( not ( = ?AUTO_2361 ?AUTO_2362 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2360 ?AUTO_2362 ?AUTO_2357 )
      ( DELIVER-PKG ?AUTO_2355 ?AUTO_2356 )
      ( DELIVER-PKG-VERIFY ?AUTO_2355 ?AUTO_2356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2371 - OBJ
      ?AUTO_2372 - LOCATION
    )
    :vars
    (
      ?AUTO_2376 - LOCATION
      ?AUTO_2375 - CITY
      ?AUTO_2377 - TRUCK
      ?AUTO_2374 - LOCATION
      ?AUTO_2373 - LOCATION
      ?AUTO_2378 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2376 ?AUTO_2375 ) ( IN-CITY ?AUTO_2372 ?AUTO_2375 ) ( not ( = ?AUTO_2372 ?AUTO_2376 ) ) ( TRUCK-AT ?AUTO_2377 ?AUTO_2374 ) ( IN-CITY ?AUTO_2374 ?AUTO_2375 ) ( not ( = ?AUTO_2376 ?AUTO_2374 ) ) ( not ( = ?AUTO_2372 ?AUTO_2374 ) ) ( AIRPORT ?AUTO_2373 ) ( AIRPORT ?AUTO_2376 ) ( AIRPLANE-AT ?AUTO_2378 ?AUTO_2373 ) ( not ( = ?AUTO_2373 ?AUTO_2376 ) ) ( not ( = ?AUTO_2372 ?AUTO_2373 ) ) ( not ( = ?AUTO_2374 ?AUTO_2373 ) ) ( OBJ-AT ?AUTO_2371 ?AUTO_2373 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2371 ?AUTO_2378 ?AUTO_2373 )
      ( DELIVER-PKG ?AUTO_2371 ?AUTO_2372 )
      ( DELIVER-PKG-VERIFY ?AUTO_2371 ?AUTO_2372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2379 - OBJ
      ?AUTO_2380 - LOCATION
    )
    :vars
    (
      ?AUTO_2385 - LOCATION
      ?AUTO_2384 - CITY
      ?AUTO_2381 - TRUCK
      ?AUTO_2383 - LOCATION
      ?AUTO_2386 - LOCATION
      ?AUTO_2387 - LOCATION
      ?AUTO_2382 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2385 ?AUTO_2384 ) ( IN-CITY ?AUTO_2380 ?AUTO_2384 ) ( not ( = ?AUTO_2380 ?AUTO_2385 ) ) ( TRUCK-AT ?AUTO_2381 ?AUTO_2383 ) ( IN-CITY ?AUTO_2383 ?AUTO_2384 ) ( not ( = ?AUTO_2385 ?AUTO_2383 ) ) ( not ( = ?AUTO_2380 ?AUTO_2383 ) ) ( AIRPORT ?AUTO_2386 ) ( AIRPORT ?AUTO_2385 ) ( not ( = ?AUTO_2386 ?AUTO_2385 ) ) ( not ( = ?AUTO_2380 ?AUTO_2386 ) ) ( not ( = ?AUTO_2383 ?AUTO_2386 ) ) ( OBJ-AT ?AUTO_2379 ?AUTO_2386 ) ( AIRPORT ?AUTO_2387 ) ( AIRPLANE-AT ?AUTO_2382 ?AUTO_2387 ) ( not ( = ?AUTO_2387 ?AUTO_2386 ) ) ( not ( = ?AUTO_2380 ?AUTO_2387 ) ) ( not ( = ?AUTO_2385 ?AUTO_2387 ) ) ( not ( = ?AUTO_2383 ?AUTO_2387 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2382 ?AUTO_2387 ?AUTO_2386 )
      ( DELIVER-PKG ?AUTO_2379 ?AUTO_2380 )
      ( DELIVER-PKG-VERIFY ?AUTO_2379 ?AUTO_2380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2398 - OBJ
      ?AUTO_2399 - LOCATION
    )
    :vars
    (
      ?AUTO_2400 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2398 ?AUTO_2400 ) ( AIRPLANE-AT ?AUTO_2400 ?AUTO_2399 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2398 ?AUTO_2400 ?AUTO_2399 )
      ( DELIVER-PKG-VERIFY ?AUTO_2398 ?AUTO_2399 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2423 - OBJ
      ?AUTO_2424 - LOCATION
    )
    :vars
    (
      ?AUTO_2426 - LOCATION
      ?AUTO_2427 - LOCATION
      ?AUTO_2425 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2426 ) ( AIRPORT ?AUTO_2424 ) ( not ( = ?AUTO_2426 ?AUTO_2424 ) ) ( OBJ-AT ?AUTO_2423 ?AUTO_2426 ) ( AIRPORT ?AUTO_2427 ) ( AIRPLANE-AT ?AUTO_2425 ?AUTO_2427 ) ( not ( = ?AUTO_2427 ?AUTO_2426 ) ) ( not ( = ?AUTO_2424 ?AUTO_2427 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2425 ?AUTO_2427 ?AUTO_2426 )
      ( DELIVER-PKG ?AUTO_2423 ?AUTO_2424 )
      ( DELIVER-PKG-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2446 - OBJ
      ?AUTO_2447 - LOCATION
    )
    :vars
    (
      ?AUTO_2448 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2448 ?AUTO_2447 ) ( IN-TRUCK ?AUTO_2446 ?AUTO_2448 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2446 ?AUTO_2448 ?AUTO_2447 )
      ( DELIVER-PKG-VERIFY ?AUTO_2446 ?AUTO_2447 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2449 - OBJ
      ?AUTO_2450 - LOCATION
    )
    :vars
    (
      ?AUTO_2451 - TRUCK
      ?AUTO_2452 - LOCATION
      ?AUTO_2453 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2449 ?AUTO_2451 ) ( TRUCK-AT ?AUTO_2451 ?AUTO_2452 ) ( IN-CITY ?AUTO_2452 ?AUTO_2453 ) ( IN-CITY ?AUTO_2450 ?AUTO_2453 ) ( not ( = ?AUTO_2450 ?AUTO_2452 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2451 ?AUTO_2452 ?AUTO_2450 ?AUTO_2453 )
      ( DELIVER-PKG ?AUTO_2449 ?AUTO_2450 )
      ( DELIVER-PKG-VERIFY ?AUTO_2449 ?AUTO_2450 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2454 - OBJ
      ?AUTO_2455 - LOCATION
    )
    :vars
    (
      ?AUTO_2456 - TRUCK
      ?AUTO_2457 - LOCATION
      ?AUTO_2458 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2456 ?AUTO_2457 ) ( IN-CITY ?AUTO_2457 ?AUTO_2458 ) ( IN-CITY ?AUTO_2455 ?AUTO_2458 ) ( not ( = ?AUTO_2455 ?AUTO_2457 ) ) ( OBJ-AT ?AUTO_2454 ?AUTO_2457 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2454 ?AUTO_2456 ?AUTO_2457 )
      ( DELIVER-PKG ?AUTO_2454 ?AUTO_2455 )
      ( DELIVER-PKG-VERIFY ?AUTO_2454 ?AUTO_2455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2459 - OBJ
      ?AUTO_2460 - LOCATION
    )
    :vars
    (
      ?AUTO_2461 - LOCATION
      ?AUTO_2463 - CITY
      ?AUTO_2462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2461 ?AUTO_2463 ) ( IN-CITY ?AUTO_2460 ?AUTO_2463 ) ( not ( = ?AUTO_2460 ?AUTO_2461 ) ) ( OBJ-AT ?AUTO_2459 ?AUTO_2461 ) ( TRUCK-AT ?AUTO_2462 ?AUTO_2460 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2462 ?AUTO_2460 ?AUTO_2461 ?AUTO_2463 )
      ( DELIVER-PKG ?AUTO_2459 ?AUTO_2460 )
      ( DELIVER-PKG-VERIFY ?AUTO_2459 ?AUTO_2460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2490 - OBJ
      ?AUTO_2491 - LOCATION
    )
    :vars
    (
      ?AUTO_2493 - LOCATION
      ?AUTO_2492 - CITY
      ?AUTO_2494 - TRUCK
      ?AUTO_2495 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2493 ?AUTO_2492 ) ( IN-CITY ?AUTO_2491 ?AUTO_2492 ) ( not ( = ?AUTO_2491 ?AUTO_2493 ) ) ( TRUCK-AT ?AUTO_2494 ?AUTO_2491 ) ( IN-AIRPLANE ?AUTO_2490 ?AUTO_2495 ) ( AIRPLANE-AT ?AUTO_2495 ?AUTO_2493 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2490 ?AUTO_2495 ?AUTO_2493 )
      ( DELIVER-PKG ?AUTO_2490 ?AUTO_2491 )
      ( DELIVER-PKG-VERIFY ?AUTO_2490 ?AUTO_2491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2496 - OBJ
      ?AUTO_2497 - LOCATION
    )
    :vars
    (
      ?AUTO_2498 - LOCATION
      ?AUTO_2499 - CITY
      ?AUTO_2501 - TRUCK
      ?AUTO_2500 - AIRPLANE
      ?AUTO_2502 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2498 ?AUTO_2499 ) ( IN-CITY ?AUTO_2497 ?AUTO_2499 ) ( not ( = ?AUTO_2497 ?AUTO_2498 ) ) ( TRUCK-AT ?AUTO_2501 ?AUTO_2497 ) ( IN-AIRPLANE ?AUTO_2496 ?AUTO_2500 ) ( AIRPORT ?AUTO_2502 ) ( AIRPORT ?AUTO_2498 ) ( AIRPLANE-AT ?AUTO_2500 ?AUTO_2502 ) ( not ( = ?AUTO_2502 ?AUTO_2498 ) ) ( not ( = ?AUTO_2497 ?AUTO_2502 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2500 ?AUTO_2502 ?AUTO_2498 )
      ( DELIVER-PKG ?AUTO_2496 ?AUTO_2497 )
      ( DELIVER-PKG-VERIFY ?AUTO_2496 ?AUTO_2497 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2507 - OBJ
      ?AUTO_2508 - LOCATION
    )
    :vars
    (
      ?AUTO_2513 - LOCATION
      ?AUTO_2510 - CITY
      ?AUTO_2509 - TRUCK
      ?AUTO_2511 - LOCATION
      ?AUTO_2512 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2513 ?AUTO_2510 ) ( IN-CITY ?AUTO_2508 ?AUTO_2510 ) ( not ( = ?AUTO_2508 ?AUTO_2513 ) ) ( TRUCK-AT ?AUTO_2509 ?AUTO_2508 ) ( AIRPORT ?AUTO_2511 ) ( AIRPORT ?AUTO_2513 ) ( AIRPLANE-AT ?AUTO_2512 ?AUTO_2511 ) ( not ( = ?AUTO_2511 ?AUTO_2513 ) ) ( not ( = ?AUTO_2508 ?AUTO_2511 ) ) ( OBJ-AT ?AUTO_2507 ?AUTO_2511 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2507 ?AUTO_2512 ?AUTO_2511 )
      ( DELIVER-PKG ?AUTO_2507 ?AUTO_2508 )
      ( DELIVER-PKG-VERIFY ?AUTO_2507 ?AUTO_2508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2516 - OBJ
      ?AUTO_2517 - LOCATION
    )
    :vars
    (
      ?AUTO_2521 - LOCATION
      ?AUTO_2519 - CITY
      ?AUTO_2518 - TRUCK
      ?AUTO_2520 - LOCATION
      ?AUTO_2523 - LOCATION
      ?AUTO_2522 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2521 ?AUTO_2519 ) ( IN-CITY ?AUTO_2517 ?AUTO_2519 ) ( not ( = ?AUTO_2517 ?AUTO_2521 ) ) ( TRUCK-AT ?AUTO_2518 ?AUTO_2517 ) ( AIRPORT ?AUTO_2520 ) ( AIRPORT ?AUTO_2521 ) ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( not ( = ?AUTO_2517 ?AUTO_2520 ) ) ( OBJ-AT ?AUTO_2516 ?AUTO_2520 ) ( AIRPORT ?AUTO_2523 ) ( AIRPLANE-AT ?AUTO_2522 ?AUTO_2523 ) ( not ( = ?AUTO_2523 ?AUTO_2520 ) ) ( not ( = ?AUTO_2517 ?AUTO_2523 ) ) ( not ( = ?AUTO_2521 ?AUTO_2523 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2522 ?AUTO_2523 ?AUTO_2520 )
      ( DELIVER-PKG ?AUTO_2516 ?AUTO_2517 )
      ( DELIVER-PKG-VERIFY ?AUTO_2516 ?AUTO_2517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2526 - OBJ
      ?AUTO_2527 - LOCATION
    )
    :vars
    (
      ?AUTO_2528 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2528 ?AUTO_2527 ) ( IN-TRUCK ?AUTO_2526 ?AUTO_2528 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2526 ?AUTO_2528 ?AUTO_2527 )
      ( DELIVER-PKG-VERIFY ?AUTO_2526 ?AUTO_2527 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2529 - OBJ
      ?AUTO_2530 - LOCATION
    )
    :vars
    (
      ?AUTO_2531 - TRUCK
      ?AUTO_2532 - LOCATION
      ?AUTO_2533 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2529 ?AUTO_2531 ) ( TRUCK-AT ?AUTO_2531 ?AUTO_2532 ) ( IN-CITY ?AUTO_2532 ?AUTO_2533 ) ( IN-CITY ?AUTO_2530 ?AUTO_2533 ) ( not ( = ?AUTO_2530 ?AUTO_2532 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2531 ?AUTO_2532 ?AUTO_2530 ?AUTO_2533 )
      ( DELIVER-PKG ?AUTO_2529 ?AUTO_2530 )
      ( DELIVER-PKG-VERIFY ?AUTO_2529 ?AUTO_2530 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2540 - OBJ
      ?AUTO_2541 - LOCATION
    )
    :vars
    (
      ?AUTO_2543 - TRUCK
      ?AUTO_2542 - LOCATION
      ?AUTO_2544 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2543 ?AUTO_2542 ) ( IN-CITY ?AUTO_2542 ?AUTO_2544 ) ( IN-CITY ?AUTO_2541 ?AUTO_2544 ) ( not ( = ?AUTO_2541 ?AUTO_2542 ) ) ( OBJ-AT ?AUTO_2540 ?AUTO_2542 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2540 ?AUTO_2543 ?AUTO_2542 )
      ( DELIVER-PKG ?AUTO_2540 ?AUTO_2541 )
      ( DELIVER-PKG-VERIFY ?AUTO_2540 ?AUTO_2541 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2547 - OBJ
      ?AUTO_2548 - LOCATION
    )
    :vars
    (
      ?AUTO_2549 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2547 ?AUTO_2549 ) ( AIRPLANE-AT ?AUTO_2549 ?AUTO_2548 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2547 ?AUTO_2549 ?AUTO_2548 )
      ( DELIVER-PKG-VERIFY ?AUTO_2547 ?AUTO_2548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2550 - OBJ
      ?AUTO_2551 - LOCATION
    )
    :vars
    (
      ?AUTO_2552 - AIRPLANE
      ?AUTO_2553 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2550 ?AUTO_2552 ) ( AIRPORT ?AUTO_2553 ) ( AIRPORT ?AUTO_2551 ) ( AIRPLANE-AT ?AUTO_2552 ?AUTO_2553 ) ( not ( = ?AUTO_2553 ?AUTO_2551 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2552 ?AUTO_2553 ?AUTO_2551 )
      ( DELIVER-PKG ?AUTO_2550 ?AUTO_2551 )
      ( DELIVER-PKG-VERIFY ?AUTO_2550 ?AUTO_2551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2554 - OBJ
      ?AUTO_2555 - LOCATION
    )
    :vars
    (
      ?AUTO_2556 - LOCATION
      ?AUTO_2557 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2556 ) ( AIRPORT ?AUTO_2555 ) ( AIRPLANE-AT ?AUTO_2557 ?AUTO_2556 ) ( not ( = ?AUTO_2556 ?AUTO_2555 ) ) ( OBJ-AT ?AUTO_2554 ?AUTO_2556 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2554 ?AUTO_2557 ?AUTO_2556 )
      ( DELIVER-PKG ?AUTO_2554 ?AUTO_2555 )
      ( DELIVER-PKG-VERIFY ?AUTO_2554 ?AUTO_2555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2558 - OBJ
      ?AUTO_2559 - LOCATION
    )
    :vars
    (
      ?AUTO_2561 - LOCATION
      ?AUTO_2562 - LOCATION
      ?AUTO_2560 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2561 ) ( AIRPORT ?AUTO_2559 ) ( not ( = ?AUTO_2561 ?AUTO_2559 ) ) ( OBJ-AT ?AUTO_2558 ?AUTO_2561 ) ( AIRPORT ?AUTO_2562 ) ( AIRPLANE-AT ?AUTO_2560 ?AUTO_2562 ) ( not ( = ?AUTO_2562 ?AUTO_2561 ) ) ( not ( = ?AUTO_2559 ?AUTO_2562 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2560 ?AUTO_2562 ?AUTO_2561 )
      ( DELIVER-PKG ?AUTO_2558 ?AUTO_2559 )
      ( DELIVER-PKG-VERIFY ?AUTO_2558 ?AUTO_2559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2563 - OBJ
      ?AUTO_2564 - LOCATION
    )
    :vars
    (
      ?AUTO_2565 - LOCATION
      ?AUTO_2567 - LOCATION
      ?AUTO_2566 - AIRPLANE
      ?AUTO_2568 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2565 ) ( AIRPORT ?AUTO_2564 ) ( not ( = ?AUTO_2565 ?AUTO_2564 ) ) ( AIRPORT ?AUTO_2567 ) ( AIRPLANE-AT ?AUTO_2566 ?AUTO_2567 ) ( not ( = ?AUTO_2567 ?AUTO_2565 ) ) ( not ( = ?AUTO_2564 ?AUTO_2567 ) ) ( TRUCK-AT ?AUTO_2568 ?AUTO_2565 ) ( IN-TRUCK ?AUTO_2563 ?AUTO_2568 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2563 ?AUTO_2568 ?AUTO_2565 )
      ( DELIVER-PKG ?AUTO_2563 ?AUTO_2564 )
      ( DELIVER-PKG-VERIFY ?AUTO_2563 ?AUTO_2564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2569 - OBJ
      ?AUTO_2570 - LOCATION
    )
    :vars
    (
      ?AUTO_2571 - LOCATION
      ?AUTO_2573 - LOCATION
      ?AUTO_2572 - AIRPLANE
      ?AUTO_2574 - TRUCK
      ?AUTO_2575 - LOCATION
      ?AUTO_2576 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2571 ) ( AIRPORT ?AUTO_2570 ) ( not ( = ?AUTO_2571 ?AUTO_2570 ) ) ( AIRPORT ?AUTO_2573 ) ( AIRPLANE-AT ?AUTO_2572 ?AUTO_2573 ) ( not ( = ?AUTO_2573 ?AUTO_2571 ) ) ( not ( = ?AUTO_2570 ?AUTO_2573 ) ) ( IN-TRUCK ?AUTO_2569 ?AUTO_2574 ) ( TRUCK-AT ?AUTO_2574 ?AUTO_2575 ) ( IN-CITY ?AUTO_2575 ?AUTO_2576 ) ( IN-CITY ?AUTO_2571 ?AUTO_2576 ) ( not ( = ?AUTO_2571 ?AUTO_2575 ) ) ( not ( = ?AUTO_2570 ?AUTO_2575 ) ) ( not ( = ?AUTO_2573 ?AUTO_2575 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2574 ?AUTO_2575 ?AUTO_2571 ?AUTO_2576 )
      ( DELIVER-PKG ?AUTO_2569 ?AUTO_2570 )
      ( DELIVER-PKG-VERIFY ?AUTO_2569 ?AUTO_2570 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2583 - OBJ
      ?AUTO_2584 - LOCATION
    )
    :vars
    (
      ?AUTO_2588 - LOCATION
      ?AUTO_2587 - LOCATION
      ?AUTO_2585 - AIRPLANE
      ?AUTO_2590 - TRUCK
      ?AUTO_2586 - LOCATION
      ?AUTO_2589 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2588 ) ( AIRPORT ?AUTO_2584 ) ( not ( = ?AUTO_2588 ?AUTO_2584 ) ) ( AIRPORT ?AUTO_2587 ) ( AIRPLANE-AT ?AUTO_2585 ?AUTO_2587 ) ( not ( = ?AUTO_2587 ?AUTO_2588 ) ) ( not ( = ?AUTO_2584 ?AUTO_2587 ) ) ( TRUCK-AT ?AUTO_2590 ?AUTO_2586 ) ( IN-CITY ?AUTO_2586 ?AUTO_2589 ) ( IN-CITY ?AUTO_2588 ?AUTO_2589 ) ( not ( = ?AUTO_2588 ?AUTO_2586 ) ) ( not ( = ?AUTO_2584 ?AUTO_2586 ) ) ( not ( = ?AUTO_2587 ?AUTO_2586 ) ) ( OBJ-AT ?AUTO_2583 ?AUTO_2586 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2583 ?AUTO_2590 ?AUTO_2586 )
      ( DELIVER-PKG ?AUTO_2583 ?AUTO_2584 )
      ( DELIVER-PKG-VERIFY ?AUTO_2583 ?AUTO_2584 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2593 - OBJ
      ?AUTO_2594 - LOCATION
    )
    :vars
    (
      ?AUTO_2595 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2595 ?AUTO_2594 ) ( IN-TRUCK ?AUTO_2593 ?AUTO_2595 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2593 ?AUTO_2595 ?AUTO_2594 )
      ( DELIVER-PKG-VERIFY ?AUTO_2593 ?AUTO_2594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2608 - OBJ
      ?AUTO_2609 - LOCATION
    )
    :vars
    (
      ?AUTO_2610 - TRUCK
      ?AUTO_2611 - LOCATION
      ?AUTO_2612 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2610 ?AUTO_2611 ) ( IN-CITY ?AUTO_2611 ?AUTO_2612 ) ( IN-CITY ?AUTO_2609 ?AUTO_2612 ) ( not ( = ?AUTO_2609 ?AUTO_2611 ) ) ( OBJ-AT ?AUTO_2608 ?AUTO_2611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2608 ?AUTO_2610 ?AUTO_2611 )
      ( DELIVER-PKG ?AUTO_2608 ?AUTO_2609 )
      ( DELIVER-PKG-VERIFY ?AUTO_2608 ?AUTO_2609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2613 - OBJ
      ?AUTO_2614 - LOCATION
    )
    :vars
    (
      ?AUTO_2615 - LOCATION
      ?AUTO_2616 - CITY
      ?AUTO_2617 - TRUCK
      ?AUTO_2618 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2615 ?AUTO_2616 ) ( IN-CITY ?AUTO_2614 ?AUTO_2616 ) ( not ( = ?AUTO_2614 ?AUTO_2615 ) ) ( OBJ-AT ?AUTO_2613 ?AUTO_2615 ) ( TRUCK-AT ?AUTO_2617 ?AUTO_2618 ) ( IN-CITY ?AUTO_2618 ?AUTO_2616 ) ( not ( = ?AUTO_2615 ?AUTO_2618 ) ) ( not ( = ?AUTO_2614 ?AUTO_2618 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2617 ?AUTO_2618 ?AUTO_2615 ?AUTO_2616 )
      ( DELIVER-PKG ?AUTO_2613 ?AUTO_2614 )
      ( DELIVER-PKG-VERIFY ?AUTO_2613 ?AUTO_2614 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2625 - OBJ
      ?AUTO_2626 - LOCATION
    )
    :vars
    (
      ?AUTO_2627 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2627 ?AUTO_2626 ) ( IN-TRUCK ?AUTO_2625 ?AUTO_2627 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2625 ?AUTO_2627 ?AUTO_2626 )
      ( DELIVER-PKG-VERIFY ?AUTO_2625 ?AUTO_2626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2628 - OBJ
      ?AUTO_2629 - LOCATION
    )
    :vars
    (
      ?AUTO_2630 - TRUCK
      ?AUTO_2631 - LOCATION
      ?AUTO_2632 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2628 ?AUTO_2630 ) ( TRUCK-AT ?AUTO_2630 ?AUTO_2631 ) ( IN-CITY ?AUTO_2631 ?AUTO_2632 ) ( IN-CITY ?AUTO_2629 ?AUTO_2632 ) ( not ( = ?AUTO_2629 ?AUTO_2631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2630 ?AUTO_2631 ?AUTO_2629 ?AUTO_2632 )
      ( DELIVER-PKG ?AUTO_2628 ?AUTO_2629 )
      ( DELIVER-PKG-VERIFY ?AUTO_2628 ?AUTO_2629 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2657 - OBJ
      ?AUTO_2658 - LOCATION
    )
    :vars
    (
      ?AUTO_2659 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2657 ?AUTO_2659 ) ( AIRPLANE-AT ?AUTO_2659 ?AUTO_2658 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2657 ?AUTO_2659 ?AUTO_2658 )
      ( DELIVER-PKG-VERIFY ?AUTO_2657 ?AUTO_2658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2660 - OBJ
      ?AUTO_2661 - LOCATION
    )
    :vars
    (
      ?AUTO_2662 - AIRPLANE
      ?AUTO_2663 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2660 ?AUTO_2662 ) ( AIRPORT ?AUTO_2663 ) ( AIRPORT ?AUTO_2661 ) ( AIRPLANE-AT ?AUTO_2662 ?AUTO_2663 ) ( not ( = ?AUTO_2663 ?AUTO_2661 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2662 ?AUTO_2663 ?AUTO_2661 )
      ( DELIVER-PKG ?AUTO_2660 ?AUTO_2661 )
      ( DELIVER-PKG-VERIFY ?AUTO_2660 ?AUTO_2661 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2664 - OBJ
      ?AUTO_2665 - LOCATION
    )
    :vars
    (
      ?AUTO_2667 - LOCATION
      ?AUTO_2666 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2667 ) ( AIRPORT ?AUTO_2665 ) ( AIRPLANE-AT ?AUTO_2666 ?AUTO_2667 ) ( not ( = ?AUTO_2667 ?AUTO_2665 ) ) ( OBJ-AT ?AUTO_2664 ?AUTO_2667 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2664 ?AUTO_2666 ?AUTO_2667 )
      ( DELIVER-PKG ?AUTO_2664 ?AUTO_2665 )
      ( DELIVER-PKG-VERIFY ?AUTO_2664 ?AUTO_2665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2668 - OBJ
      ?AUTO_2669 - LOCATION
    )
    :vars
    (
      ?AUTO_2671 - LOCATION
      ?AUTO_2670 - AIRPLANE
      ?AUTO_2672 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2671 ) ( AIRPORT ?AUTO_2669 ) ( AIRPLANE-AT ?AUTO_2670 ?AUTO_2671 ) ( not ( = ?AUTO_2671 ?AUTO_2669 ) ) ( TRUCK-AT ?AUTO_2672 ?AUTO_2671 ) ( IN-TRUCK ?AUTO_2668 ?AUTO_2672 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2668 ?AUTO_2672 ?AUTO_2671 )
      ( DELIVER-PKG ?AUTO_2668 ?AUTO_2669 )
      ( DELIVER-PKG-VERIFY ?AUTO_2668 ?AUTO_2669 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2673 - OBJ
      ?AUTO_2674 - LOCATION
    )
    :vars
    (
      ?AUTO_2676 - LOCATION
      ?AUTO_2675 - AIRPLANE
      ?AUTO_2677 - TRUCK
      ?AUTO_2678 - LOCATION
      ?AUTO_2679 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2676 ) ( AIRPORT ?AUTO_2674 ) ( AIRPLANE-AT ?AUTO_2675 ?AUTO_2676 ) ( not ( = ?AUTO_2676 ?AUTO_2674 ) ) ( IN-TRUCK ?AUTO_2673 ?AUTO_2677 ) ( TRUCK-AT ?AUTO_2677 ?AUTO_2678 ) ( IN-CITY ?AUTO_2678 ?AUTO_2679 ) ( IN-CITY ?AUTO_2676 ?AUTO_2679 ) ( not ( = ?AUTO_2676 ?AUTO_2678 ) ) ( not ( = ?AUTO_2674 ?AUTO_2678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2677 ?AUTO_2678 ?AUTO_2676 ?AUTO_2679 )
      ( DELIVER-PKG ?AUTO_2673 ?AUTO_2674 )
      ( DELIVER-PKG-VERIFY ?AUTO_2673 ?AUTO_2674 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2684 - OBJ
      ?AUTO_2685 - LOCATION
    )
    :vars
    (
      ?AUTO_2687 - LOCATION
      ?AUTO_2689 - TRUCK
      ?AUTO_2690 - LOCATION
      ?AUTO_2688 - CITY
      ?AUTO_2691 - LOCATION
      ?AUTO_2686 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2687 ) ( AIRPORT ?AUTO_2685 ) ( not ( = ?AUTO_2687 ?AUTO_2685 ) ) ( IN-TRUCK ?AUTO_2684 ?AUTO_2689 ) ( TRUCK-AT ?AUTO_2689 ?AUTO_2690 ) ( IN-CITY ?AUTO_2690 ?AUTO_2688 ) ( IN-CITY ?AUTO_2687 ?AUTO_2688 ) ( not ( = ?AUTO_2687 ?AUTO_2690 ) ) ( not ( = ?AUTO_2685 ?AUTO_2690 ) ) ( AIRPORT ?AUTO_2691 ) ( AIRPLANE-AT ?AUTO_2686 ?AUTO_2691 ) ( not ( = ?AUTO_2691 ?AUTO_2687 ) ) ( not ( = ?AUTO_2685 ?AUTO_2691 ) ) ( not ( = ?AUTO_2690 ?AUTO_2691 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2686 ?AUTO_2691 ?AUTO_2687 )
      ( DELIVER-PKG ?AUTO_2684 ?AUTO_2685 )
      ( DELIVER-PKG-VERIFY ?AUTO_2684 ?AUTO_2685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2704 - OBJ
      ?AUTO_2705 - LOCATION
    )
    :vars
    (
      ?AUTO_2708 - LOCATION
      ?AUTO_2709 - TRUCK
      ?AUTO_2707 - LOCATION
      ?AUTO_2711 - CITY
      ?AUTO_2706 - LOCATION
      ?AUTO_2710 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2708 ) ( AIRPORT ?AUTO_2705 ) ( not ( = ?AUTO_2708 ?AUTO_2705 ) ) ( TRUCK-AT ?AUTO_2709 ?AUTO_2707 ) ( IN-CITY ?AUTO_2707 ?AUTO_2711 ) ( IN-CITY ?AUTO_2708 ?AUTO_2711 ) ( not ( = ?AUTO_2708 ?AUTO_2707 ) ) ( not ( = ?AUTO_2705 ?AUTO_2707 ) ) ( AIRPORT ?AUTO_2706 ) ( AIRPLANE-AT ?AUTO_2710 ?AUTO_2706 ) ( not ( = ?AUTO_2706 ?AUTO_2708 ) ) ( not ( = ?AUTO_2705 ?AUTO_2706 ) ) ( not ( = ?AUTO_2707 ?AUTO_2706 ) ) ( OBJ-AT ?AUTO_2704 ?AUTO_2707 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2704 ?AUTO_2709 ?AUTO_2707 )
      ( DELIVER-PKG ?AUTO_2704 ?AUTO_2705 )
      ( DELIVER-PKG-VERIFY ?AUTO_2704 ?AUTO_2705 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2716 - OBJ
      ?AUTO_2717 - LOCATION
    )
    :vars
    (
      ?AUTO_2718 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2718 ?AUTO_2717 ) ( IN-TRUCK ?AUTO_2716 ?AUTO_2718 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2716 ?AUTO_2718 ?AUTO_2717 )
      ( DELIVER-PKG-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2719 - OBJ
      ?AUTO_2720 - LOCATION
    )
    :vars
    (
      ?AUTO_2721 - TRUCK
      ?AUTO_2722 - LOCATION
      ?AUTO_2723 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2719 ?AUTO_2721 ) ( TRUCK-AT ?AUTO_2721 ?AUTO_2722 ) ( IN-CITY ?AUTO_2722 ?AUTO_2723 ) ( IN-CITY ?AUTO_2720 ?AUTO_2723 ) ( not ( = ?AUTO_2720 ?AUTO_2722 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2721 ?AUTO_2722 ?AUTO_2720 ?AUTO_2723 )
      ( DELIVER-PKG ?AUTO_2719 ?AUTO_2720 )
      ( DELIVER-PKG-VERIFY ?AUTO_2719 ?AUTO_2720 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2724 - OBJ
      ?AUTO_2725 - LOCATION
    )
    :vars
    (
      ?AUTO_2726 - TRUCK
      ?AUTO_2727 - LOCATION
      ?AUTO_2728 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2726 ?AUTO_2727 ) ( IN-CITY ?AUTO_2727 ?AUTO_2728 ) ( IN-CITY ?AUTO_2725 ?AUTO_2728 ) ( not ( = ?AUTO_2725 ?AUTO_2727 ) ) ( OBJ-AT ?AUTO_2724 ?AUTO_2727 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2724 ?AUTO_2726 ?AUTO_2727 )
      ( DELIVER-PKG ?AUTO_2724 ?AUTO_2725 )
      ( DELIVER-PKG-VERIFY ?AUTO_2724 ?AUTO_2725 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2737 - OBJ
      ?AUTO_2738 - LOCATION
    )
    :vars
    (
      ?AUTO_2740 - LOCATION
      ?AUTO_2739 - CITY
      ?AUTO_2741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2740 ?AUTO_2739 ) ( IN-CITY ?AUTO_2738 ?AUTO_2739 ) ( not ( = ?AUTO_2738 ?AUTO_2740 ) ) ( OBJ-AT ?AUTO_2737 ?AUTO_2740 ) ( TRUCK-AT ?AUTO_2741 ?AUTO_2738 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2741 ?AUTO_2738 ?AUTO_2740 ?AUTO_2739 )
      ( DELIVER-PKG ?AUTO_2737 ?AUTO_2738 )
      ( DELIVER-PKG-VERIFY ?AUTO_2737 ?AUTO_2738 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2744 - OBJ
      ?AUTO_2745 - LOCATION
    )
    :vars
    (
      ?AUTO_2746 - LOCATION
      ?AUTO_2747 - CITY
      ?AUTO_2748 - TRUCK
      ?AUTO_2749 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2746 ?AUTO_2747 ) ( IN-CITY ?AUTO_2745 ?AUTO_2747 ) ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( TRUCK-AT ?AUTO_2748 ?AUTO_2745 ) ( IN-AIRPLANE ?AUTO_2744 ?AUTO_2749 ) ( AIRPLANE-AT ?AUTO_2749 ?AUTO_2746 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2744 ?AUTO_2749 ?AUTO_2746 )
      ( DELIVER-PKG ?AUTO_2744 ?AUTO_2745 )
      ( DELIVER-PKG-VERIFY ?AUTO_2744 ?AUTO_2745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2750 - OBJ
      ?AUTO_2751 - LOCATION
    )
    :vars
    (
      ?AUTO_2754 - LOCATION
      ?AUTO_2753 - CITY
      ?AUTO_2752 - TRUCK
      ?AUTO_2755 - AIRPLANE
      ?AUTO_2756 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2754 ?AUTO_2753 ) ( IN-CITY ?AUTO_2751 ?AUTO_2753 ) ( not ( = ?AUTO_2751 ?AUTO_2754 ) ) ( TRUCK-AT ?AUTO_2752 ?AUTO_2751 ) ( IN-AIRPLANE ?AUTO_2750 ?AUTO_2755 ) ( AIRPORT ?AUTO_2756 ) ( AIRPORT ?AUTO_2754 ) ( AIRPLANE-AT ?AUTO_2755 ?AUTO_2756 ) ( not ( = ?AUTO_2756 ?AUTO_2754 ) ) ( not ( = ?AUTO_2751 ?AUTO_2756 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2755 ?AUTO_2756 ?AUTO_2754 )
      ( DELIVER-PKG ?AUTO_2750 ?AUTO_2751 )
      ( DELIVER-PKG-VERIFY ?AUTO_2750 ?AUTO_2751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2757 - OBJ
      ?AUTO_2758 - LOCATION
    )
    :vars
    (
      ?AUTO_2762 - LOCATION
      ?AUTO_2759 - CITY
      ?AUTO_2760 - TRUCK
      ?AUTO_2763 - LOCATION
      ?AUTO_2761 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2762 ?AUTO_2759 ) ( IN-CITY ?AUTO_2758 ?AUTO_2759 ) ( not ( = ?AUTO_2758 ?AUTO_2762 ) ) ( TRUCK-AT ?AUTO_2760 ?AUTO_2758 ) ( AIRPORT ?AUTO_2763 ) ( AIRPORT ?AUTO_2762 ) ( AIRPLANE-AT ?AUTO_2761 ?AUTO_2763 ) ( not ( = ?AUTO_2763 ?AUTO_2762 ) ) ( not ( = ?AUTO_2758 ?AUTO_2763 ) ) ( OBJ-AT ?AUTO_2757 ?AUTO_2763 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2757 ?AUTO_2761 ?AUTO_2763 )
      ( DELIVER-PKG ?AUTO_2757 ?AUTO_2758 )
      ( DELIVER-PKG-VERIFY ?AUTO_2757 ?AUTO_2758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2764 - OBJ
      ?AUTO_2765 - LOCATION
    )
    :vars
    (
      ?AUTO_2766 - LOCATION
      ?AUTO_2769 - CITY
      ?AUTO_2768 - TRUCK
      ?AUTO_2770 - LOCATION
      ?AUTO_2771 - LOCATION
      ?AUTO_2767 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2766 ?AUTO_2769 ) ( IN-CITY ?AUTO_2765 ?AUTO_2769 ) ( not ( = ?AUTO_2765 ?AUTO_2766 ) ) ( TRUCK-AT ?AUTO_2768 ?AUTO_2765 ) ( AIRPORT ?AUTO_2770 ) ( AIRPORT ?AUTO_2766 ) ( not ( = ?AUTO_2770 ?AUTO_2766 ) ) ( not ( = ?AUTO_2765 ?AUTO_2770 ) ) ( OBJ-AT ?AUTO_2764 ?AUTO_2770 ) ( AIRPORT ?AUTO_2771 ) ( AIRPLANE-AT ?AUTO_2767 ?AUTO_2771 ) ( not ( = ?AUTO_2771 ?AUTO_2770 ) ) ( not ( = ?AUTO_2765 ?AUTO_2771 ) ) ( not ( = ?AUTO_2766 ?AUTO_2771 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2767 ?AUTO_2771 ?AUTO_2770 )
      ( DELIVER-PKG ?AUTO_2764 ?AUTO_2765 )
      ( DELIVER-PKG-VERIFY ?AUTO_2764 ?AUTO_2765 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2772 - OBJ
      ?AUTO_2773 - LOCATION
    )
    :vars
    (
      ?AUTO_2778 - LOCATION
      ?AUTO_2774 - CITY
      ?AUTO_2777 - TRUCK
      ?AUTO_2776 - LOCATION
      ?AUTO_2779 - LOCATION
      ?AUTO_2775 - AIRPLANE
      ?AUTO_2780 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2778 ?AUTO_2774 ) ( IN-CITY ?AUTO_2773 ?AUTO_2774 ) ( not ( = ?AUTO_2773 ?AUTO_2778 ) ) ( TRUCK-AT ?AUTO_2777 ?AUTO_2773 ) ( AIRPORT ?AUTO_2776 ) ( AIRPORT ?AUTO_2778 ) ( not ( = ?AUTO_2776 ?AUTO_2778 ) ) ( not ( = ?AUTO_2773 ?AUTO_2776 ) ) ( AIRPORT ?AUTO_2779 ) ( AIRPLANE-AT ?AUTO_2775 ?AUTO_2779 ) ( not ( = ?AUTO_2779 ?AUTO_2776 ) ) ( not ( = ?AUTO_2773 ?AUTO_2779 ) ) ( not ( = ?AUTO_2778 ?AUTO_2779 ) ) ( TRUCK-AT ?AUTO_2780 ?AUTO_2776 ) ( IN-TRUCK ?AUTO_2772 ?AUTO_2780 ) ( not ( = ?AUTO_2777 ?AUTO_2780 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2772 ?AUTO_2780 ?AUTO_2776 )
      ( DELIVER-PKG ?AUTO_2772 ?AUTO_2773 )
      ( DELIVER-PKG-VERIFY ?AUTO_2772 ?AUTO_2773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2781 - OBJ
      ?AUTO_2782 - LOCATION
    )
    :vars
    (
      ?AUTO_2788 - LOCATION
      ?AUTO_2783 - CITY
      ?AUTO_2787 - TRUCK
      ?AUTO_2789 - LOCATION
      ?AUTO_2784 - LOCATION
      ?AUTO_2785 - AIRPLANE
      ?AUTO_2786 - TRUCK
      ?AUTO_2790 - LOCATION
      ?AUTO_2791 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2788 ?AUTO_2783 ) ( IN-CITY ?AUTO_2782 ?AUTO_2783 ) ( not ( = ?AUTO_2782 ?AUTO_2788 ) ) ( TRUCK-AT ?AUTO_2787 ?AUTO_2782 ) ( AIRPORT ?AUTO_2789 ) ( AIRPORT ?AUTO_2788 ) ( not ( = ?AUTO_2789 ?AUTO_2788 ) ) ( not ( = ?AUTO_2782 ?AUTO_2789 ) ) ( AIRPORT ?AUTO_2784 ) ( AIRPLANE-AT ?AUTO_2785 ?AUTO_2784 ) ( not ( = ?AUTO_2784 ?AUTO_2789 ) ) ( not ( = ?AUTO_2782 ?AUTO_2784 ) ) ( not ( = ?AUTO_2788 ?AUTO_2784 ) ) ( IN-TRUCK ?AUTO_2781 ?AUTO_2786 ) ( not ( = ?AUTO_2787 ?AUTO_2786 ) ) ( TRUCK-AT ?AUTO_2786 ?AUTO_2790 ) ( IN-CITY ?AUTO_2790 ?AUTO_2791 ) ( IN-CITY ?AUTO_2789 ?AUTO_2791 ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) ( not ( = ?AUTO_2782 ?AUTO_2790 ) ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2783 ?AUTO_2791 ) ) ( not ( = ?AUTO_2784 ?AUTO_2790 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2786 ?AUTO_2790 ?AUTO_2789 ?AUTO_2791 )
      ( DELIVER-PKG ?AUTO_2781 ?AUTO_2782 )
      ( DELIVER-PKG-VERIFY ?AUTO_2781 ?AUTO_2782 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2798 - OBJ
      ?AUTO_2799 - LOCATION
    )
    :vars
    (
      ?AUTO_2805 - LOCATION
      ?AUTO_2804 - CITY
      ?AUTO_2802 - TRUCK
      ?AUTO_2803 - LOCATION
      ?AUTO_2800 - LOCATION
      ?AUTO_2801 - AIRPLANE
      ?AUTO_2807 - TRUCK
      ?AUTO_2808 - LOCATION
      ?AUTO_2806 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2805 ?AUTO_2804 ) ( IN-CITY ?AUTO_2799 ?AUTO_2804 ) ( not ( = ?AUTO_2799 ?AUTO_2805 ) ) ( TRUCK-AT ?AUTO_2802 ?AUTO_2799 ) ( AIRPORT ?AUTO_2803 ) ( AIRPORT ?AUTO_2805 ) ( not ( = ?AUTO_2803 ?AUTO_2805 ) ) ( not ( = ?AUTO_2799 ?AUTO_2803 ) ) ( AIRPORT ?AUTO_2800 ) ( AIRPLANE-AT ?AUTO_2801 ?AUTO_2800 ) ( not ( = ?AUTO_2800 ?AUTO_2803 ) ) ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( not ( = ?AUTO_2805 ?AUTO_2800 ) ) ( not ( = ?AUTO_2802 ?AUTO_2807 ) ) ( TRUCK-AT ?AUTO_2807 ?AUTO_2808 ) ( IN-CITY ?AUTO_2808 ?AUTO_2806 ) ( IN-CITY ?AUTO_2803 ?AUTO_2806 ) ( not ( = ?AUTO_2803 ?AUTO_2808 ) ) ( not ( = ?AUTO_2799 ?AUTO_2808 ) ) ( not ( = ?AUTO_2805 ?AUTO_2808 ) ) ( not ( = ?AUTO_2804 ?AUTO_2806 ) ) ( not ( = ?AUTO_2800 ?AUTO_2808 ) ) ( OBJ-AT ?AUTO_2798 ?AUTO_2808 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2798 ?AUTO_2807 ?AUTO_2808 )
      ( DELIVER-PKG ?AUTO_2798 ?AUTO_2799 )
      ( DELIVER-PKG-VERIFY ?AUTO_2798 ?AUTO_2799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2811 - OBJ
      ?AUTO_2812 - LOCATION
    )
    :vars
    (
      ?AUTO_2813 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2813 ?AUTO_2812 ) ( IN-TRUCK ?AUTO_2811 ?AUTO_2813 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2811 ?AUTO_2813 ?AUTO_2812 )
      ( DELIVER-PKG-VERIFY ?AUTO_2811 ?AUTO_2812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2814 - OBJ
      ?AUTO_2815 - LOCATION
    )
    :vars
    (
      ?AUTO_2816 - TRUCK
      ?AUTO_2817 - LOCATION
      ?AUTO_2818 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2814 ?AUTO_2816 ) ( TRUCK-AT ?AUTO_2816 ?AUTO_2817 ) ( IN-CITY ?AUTO_2817 ?AUTO_2818 ) ( IN-CITY ?AUTO_2815 ?AUTO_2818 ) ( not ( = ?AUTO_2815 ?AUTO_2817 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2816 ?AUTO_2817 ?AUTO_2815 ?AUTO_2818 )
      ( DELIVER-PKG ?AUTO_2814 ?AUTO_2815 )
      ( DELIVER-PKG-VERIFY ?AUTO_2814 ?AUTO_2815 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2819 - OBJ
      ?AUTO_2820 - LOCATION
    )
    :vars
    (
      ?AUTO_2821 - TRUCK
      ?AUTO_2822 - LOCATION
      ?AUTO_2823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2821 ?AUTO_2822 ) ( IN-CITY ?AUTO_2822 ?AUTO_2823 ) ( IN-CITY ?AUTO_2820 ?AUTO_2823 ) ( not ( = ?AUTO_2820 ?AUTO_2822 ) ) ( OBJ-AT ?AUTO_2819 ?AUTO_2822 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2819 ?AUTO_2821 ?AUTO_2822 )
      ( DELIVER-PKG ?AUTO_2819 ?AUTO_2820 )
      ( DELIVER-PKG-VERIFY ?AUTO_2819 ?AUTO_2820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2824 - OBJ
      ?AUTO_2825 - LOCATION
    )
    :vars
    (
      ?AUTO_2826 - LOCATION
      ?AUTO_2827 - CITY
      ?AUTO_2828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2826 ?AUTO_2827 ) ( IN-CITY ?AUTO_2825 ?AUTO_2827 ) ( not ( = ?AUTO_2825 ?AUTO_2826 ) ) ( OBJ-AT ?AUTO_2824 ?AUTO_2826 ) ( TRUCK-AT ?AUTO_2828 ?AUTO_2825 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2828 ?AUTO_2825 ?AUTO_2826 ?AUTO_2827 )
      ( DELIVER-PKG ?AUTO_2824 ?AUTO_2825 )
      ( DELIVER-PKG-VERIFY ?AUTO_2824 ?AUTO_2825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2835 - OBJ
      ?AUTO_2836 - LOCATION
    )
    :vars
    (
      ?AUTO_2837 - LOCATION
      ?AUTO_2839 - CITY
      ?AUTO_2838 - TRUCK
      ?AUTO_2840 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2837 ?AUTO_2839 ) ( IN-CITY ?AUTO_2836 ?AUTO_2839 ) ( not ( = ?AUTO_2836 ?AUTO_2837 ) ) ( TRUCK-AT ?AUTO_2838 ?AUTO_2836 ) ( IN-AIRPLANE ?AUTO_2835 ?AUTO_2840 ) ( AIRPLANE-AT ?AUTO_2840 ?AUTO_2837 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2835 ?AUTO_2840 ?AUTO_2837 )
      ( DELIVER-PKG ?AUTO_2835 ?AUTO_2836 )
      ( DELIVER-PKG-VERIFY ?AUTO_2835 ?AUTO_2836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2841 - OBJ
      ?AUTO_2842 - LOCATION
    )
    :vars
    (
      ?AUTO_2845 - LOCATION
      ?AUTO_2844 - CITY
      ?AUTO_2843 - TRUCK
      ?AUTO_2846 - AIRPLANE
      ?AUTO_2847 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2845 ?AUTO_2844 ) ( IN-CITY ?AUTO_2842 ?AUTO_2844 ) ( not ( = ?AUTO_2842 ?AUTO_2845 ) ) ( TRUCK-AT ?AUTO_2843 ?AUTO_2842 ) ( IN-AIRPLANE ?AUTO_2841 ?AUTO_2846 ) ( AIRPORT ?AUTO_2847 ) ( AIRPORT ?AUTO_2845 ) ( AIRPLANE-AT ?AUTO_2846 ?AUTO_2847 ) ( not ( = ?AUTO_2847 ?AUTO_2845 ) ) ( not ( = ?AUTO_2842 ?AUTO_2847 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2846 ?AUTO_2847 ?AUTO_2845 )
      ( DELIVER-PKG ?AUTO_2841 ?AUTO_2842 )
      ( DELIVER-PKG-VERIFY ?AUTO_2841 ?AUTO_2842 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2848 - OBJ
      ?AUTO_2849 - LOCATION
    )
    :vars
    (
      ?AUTO_2852 - LOCATION
      ?AUTO_2851 - CITY
      ?AUTO_2850 - TRUCK
      ?AUTO_2854 - LOCATION
      ?AUTO_2853 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2852 ?AUTO_2851 ) ( IN-CITY ?AUTO_2849 ?AUTO_2851 ) ( not ( = ?AUTO_2849 ?AUTO_2852 ) ) ( TRUCK-AT ?AUTO_2850 ?AUTO_2849 ) ( AIRPORT ?AUTO_2854 ) ( AIRPORT ?AUTO_2852 ) ( AIRPLANE-AT ?AUTO_2853 ?AUTO_2854 ) ( not ( = ?AUTO_2854 ?AUTO_2852 ) ) ( not ( = ?AUTO_2849 ?AUTO_2854 ) ) ( OBJ-AT ?AUTO_2848 ?AUTO_2854 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2848 ?AUTO_2853 ?AUTO_2854 )
      ( DELIVER-PKG ?AUTO_2848 ?AUTO_2849 )
      ( DELIVER-PKG-VERIFY ?AUTO_2848 ?AUTO_2849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2855 - OBJ
      ?AUTO_2856 - LOCATION
    )
    :vars
    (
      ?AUTO_2858 - LOCATION
      ?AUTO_2860 - CITY
      ?AUTO_2859 - TRUCK
      ?AUTO_2861 - LOCATION
      ?AUTO_2857 - AIRPLANE
      ?AUTO_2862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2858 ?AUTO_2860 ) ( IN-CITY ?AUTO_2856 ?AUTO_2860 ) ( not ( = ?AUTO_2856 ?AUTO_2858 ) ) ( TRUCK-AT ?AUTO_2859 ?AUTO_2856 ) ( AIRPORT ?AUTO_2861 ) ( AIRPORT ?AUTO_2858 ) ( AIRPLANE-AT ?AUTO_2857 ?AUTO_2861 ) ( not ( = ?AUTO_2861 ?AUTO_2858 ) ) ( not ( = ?AUTO_2856 ?AUTO_2861 ) ) ( TRUCK-AT ?AUTO_2862 ?AUTO_2861 ) ( IN-TRUCK ?AUTO_2855 ?AUTO_2862 ) ( not ( = ?AUTO_2859 ?AUTO_2862 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2855 ?AUTO_2862 ?AUTO_2861 )
      ( DELIVER-PKG ?AUTO_2855 ?AUTO_2856 )
      ( DELIVER-PKG-VERIFY ?AUTO_2855 ?AUTO_2856 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2863 - OBJ
      ?AUTO_2864 - LOCATION
    )
    :vars
    (
      ?AUTO_2869 - LOCATION
      ?AUTO_2865 - CITY
      ?AUTO_2866 - TRUCK
      ?AUTO_2868 - LOCATION
      ?AUTO_2867 - AIRPLANE
      ?AUTO_2870 - TRUCK
      ?AUTO_2871 - LOCATION
      ?AUTO_2872 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2869 ?AUTO_2865 ) ( IN-CITY ?AUTO_2864 ?AUTO_2865 ) ( not ( = ?AUTO_2864 ?AUTO_2869 ) ) ( TRUCK-AT ?AUTO_2866 ?AUTO_2864 ) ( AIRPORT ?AUTO_2868 ) ( AIRPORT ?AUTO_2869 ) ( AIRPLANE-AT ?AUTO_2867 ?AUTO_2868 ) ( not ( = ?AUTO_2868 ?AUTO_2869 ) ) ( not ( = ?AUTO_2864 ?AUTO_2868 ) ) ( IN-TRUCK ?AUTO_2863 ?AUTO_2870 ) ( not ( = ?AUTO_2866 ?AUTO_2870 ) ) ( TRUCK-AT ?AUTO_2870 ?AUTO_2871 ) ( IN-CITY ?AUTO_2871 ?AUTO_2872 ) ( IN-CITY ?AUTO_2868 ?AUTO_2872 ) ( not ( = ?AUTO_2868 ?AUTO_2871 ) ) ( not ( = ?AUTO_2864 ?AUTO_2871 ) ) ( not ( = ?AUTO_2869 ?AUTO_2871 ) ) ( not ( = ?AUTO_2865 ?AUTO_2872 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2870 ?AUTO_2871 ?AUTO_2868 ?AUTO_2872 )
      ( DELIVER-PKG ?AUTO_2863 ?AUTO_2864 )
      ( DELIVER-PKG-VERIFY ?AUTO_2863 ?AUTO_2864 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2877 - OBJ
      ?AUTO_2878 - LOCATION
    )
    :vars
    (
      ?AUTO_2885 - LOCATION
      ?AUTO_2882 - CITY
      ?AUTO_2881 - TRUCK
      ?AUTO_2886 - LOCATION
      ?AUTO_2879 - TRUCK
      ?AUTO_2880 - LOCATION
      ?AUTO_2884 - CITY
      ?AUTO_2887 - LOCATION
      ?AUTO_2883 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2885 ?AUTO_2882 ) ( IN-CITY ?AUTO_2878 ?AUTO_2882 ) ( not ( = ?AUTO_2878 ?AUTO_2885 ) ) ( TRUCK-AT ?AUTO_2881 ?AUTO_2878 ) ( AIRPORT ?AUTO_2886 ) ( AIRPORT ?AUTO_2885 ) ( not ( = ?AUTO_2886 ?AUTO_2885 ) ) ( not ( = ?AUTO_2878 ?AUTO_2886 ) ) ( IN-TRUCK ?AUTO_2877 ?AUTO_2879 ) ( not ( = ?AUTO_2881 ?AUTO_2879 ) ) ( TRUCK-AT ?AUTO_2879 ?AUTO_2880 ) ( IN-CITY ?AUTO_2880 ?AUTO_2884 ) ( IN-CITY ?AUTO_2886 ?AUTO_2884 ) ( not ( = ?AUTO_2886 ?AUTO_2880 ) ) ( not ( = ?AUTO_2878 ?AUTO_2880 ) ) ( not ( = ?AUTO_2885 ?AUTO_2880 ) ) ( not ( = ?AUTO_2882 ?AUTO_2884 ) ) ( AIRPORT ?AUTO_2887 ) ( AIRPLANE-AT ?AUTO_2883 ?AUTO_2887 ) ( not ( = ?AUTO_2887 ?AUTO_2886 ) ) ( not ( = ?AUTO_2878 ?AUTO_2887 ) ) ( not ( = ?AUTO_2885 ?AUTO_2887 ) ) ( not ( = ?AUTO_2880 ?AUTO_2887 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2883 ?AUTO_2887 ?AUTO_2886 )
      ( DELIVER-PKG ?AUTO_2877 ?AUTO_2878 )
      ( DELIVER-PKG-VERIFY ?AUTO_2877 ?AUTO_2878 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2900 - OBJ
      ?AUTO_2901 - LOCATION
    )
    :vars
    (
      ?AUTO_2910 - LOCATION
      ?AUTO_2905 - CITY
      ?AUTO_2903 - TRUCK
      ?AUTO_2902 - LOCATION
      ?AUTO_2909 - TRUCK
      ?AUTO_2908 - LOCATION
      ?AUTO_2904 - CITY
      ?AUTO_2906 - LOCATION
      ?AUTO_2907 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2910 ?AUTO_2905 ) ( IN-CITY ?AUTO_2901 ?AUTO_2905 ) ( not ( = ?AUTO_2901 ?AUTO_2910 ) ) ( TRUCK-AT ?AUTO_2903 ?AUTO_2901 ) ( AIRPORT ?AUTO_2902 ) ( AIRPORT ?AUTO_2910 ) ( not ( = ?AUTO_2902 ?AUTO_2910 ) ) ( not ( = ?AUTO_2901 ?AUTO_2902 ) ) ( not ( = ?AUTO_2903 ?AUTO_2909 ) ) ( TRUCK-AT ?AUTO_2909 ?AUTO_2908 ) ( IN-CITY ?AUTO_2908 ?AUTO_2904 ) ( IN-CITY ?AUTO_2902 ?AUTO_2904 ) ( not ( = ?AUTO_2902 ?AUTO_2908 ) ) ( not ( = ?AUTO_2901 ?AUTO_2908 ) ) ( not ( = ?AUTO_2910 ?AUTO_2908 ) ) ( not ( = ?AUTO_2905 ?AUTO_2904 ) ) ( AIRPORT ?AUTO_2906 ) ( AIRPLANE-AT ?AUTO_2907 ?AUTO_2906 ) ( not ( = ?AUTO_2906 ?AUTO_2902 ) ) ( not ( = ?AUTO_2901 ?AUTO_2906 ) ) ( not ( = ?AUTO_2910 ?AUTO_2906 ) ) ( not ( = ?AUTO_2908 ?AUTO_2906 ) ) ( OBJ-AT ?AUTO_2900 ?AUTO_2908 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2900 ?AUTO_2909 ?AUTO_2908 )
      ( DELIVER-PKG ?AUTO_2900 ?AUTO_2901 )
      ( DELIVER-PKG-VERIFY ?AUTO_2900 ?AUTO_2901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2913 - OBJ
      ?AUTO_2914 - LOCATION
    )
    :vars
    (
      ?AUTO_2915 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2915 ?AUTO_2914 ) ( IN-TRUCK ?AUTO_2913 ?AUTO_2915 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2913 ?AUTO_2915 ?AUTO_2914 )
      ( DELIVER-PKG-VERIFY ?AUTO_2913 ?AUTO_2914 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2916 - OBJ
      ?AUTO_2917 - LOCATION
    )
    :vars
    (
      ?AUTO_2918 - TRUCK
      ?AUTO_2919 - LOCATION
      ?AUTO_2920 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2916 ?AUTO_2918 ) ( TRUCK-AT ?AUTO_2918 ?AUTO_2919 ) ( IN-CITY ?AUTO_2919 ?AUTO_2920 ) ( IN-CITY ?AUTO_2917 ?AUTO_2920 ) ( not ( = ?AUTO_2917 ?AUTO_2919 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2918 ?AUTO_2919 ?AUTO_2917 ?AUTO_2920 )
      ( DELIVER-PKG ?AUTO_2916 ?AUTO_2917 )
      ( DELIVER-PKG-VERIFY ?AUTO_2916 ?AUTO_2917 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2925 - OBJ
      ?AUTO_2926 - LOCATION
    )
    :vars
    (
      ?AUTO_2929 - TRUCK
      ?AUTO_2927 - LOCATION
      ?AUTO_2928 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2929 ?AUTO_2927 ) ( IN-CITY ?AUTO_2927 ?AUTO_2928 ) ( IN-CITY ?AUTO_2926 ?AUTO_2928 ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( OBJ-AT ?AUTO_2925 ?AUTO_2927 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2925 ?AUTO_2929 ?AUTO_2927 )
      ( DELIVER-PKG ?AUTO_2925 ?AUTO_2926 )
      ( DELIVER-PKG-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2930 - OBJ
      ?AUTO_2931 - LOCATION
    )
    :vars
    (
      ?AUTO_2932 - LOCATION
      ?AUTO_2933 - CITY
      ?AUTO_2934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2932 ?AUTO_2933 ) ( IN-CITY ?AUTO_2931 ?AUTO_2933 ) ( not ( = ?AUTO_2931 ?AUTO_2932 ) ) ( OBJ-AT ?AUTO_2930 ?AUTO_2932 ) ( TRUCK-AT ?AUTO_2934 ?AUTO_2931 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2934 ?AUTO_2931 ?AUTO_2932 ?AUTO_2933 )
      ( DELIVER-PKG ?AUTO_2930 ?AUTO_2931 )
      ( DELIVER-PKG-VERIFY ?AUTO_2930 ?AUTO_2931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2939 - OBJ
      ?AUTO_2940 - LOCATION
    )
    :vars
    (
      ?AUTO_2941 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2941 ?AUTO_2940 ) ( IN-TRUCK ?AUTO_2939 ?AUTO_2941 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2939 ?AUTO_2941 ?AUTO_2940 )
      ( DELIVER-PKG-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2946 - OBJ
      ?AUTO_2947 - LOCATION
    )
    :vars
    (
      ?AUTO_2949 - TRUCK
      ?AUTO_2948 - LOCATION
      ?AUTO_2950 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2949 ?AUTO_2948 ) ( IN-CITY ?AUTO_2948 ?AUTO_2950 ) ( IN-CITY ?AUTO_2947 ?AUTO_2950 ) ( not ( = ?AUTO_2947 ?AUTO_2948 ) ) ( OBJ-AT ?AUTO_2946 ?AUTO_2948 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2946 ?AUTO_2949 ?AUTO_2948 )
      ( DELIVER-PKG ?AUTO_2946 ?AUTO_2947 )
      ( DELIVER-PKG-VERIFY ?AUTO_2946 ?AUTO_2947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2951 - OBJ
      ?AUTO_2952 - LOCATION
    )
    :vars
    (
      ?AUTO_2954 - LOCATION
      ?AUTO_2955 - CITY
      ?AUTO_2953 - TRUCK
      ?AUTO_2956 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2954 ?AUTO_2955 ) ( IN-CITY ?AUTO_2952 ?AUTO_2955 ) ( not ( = ?AUTO_2952 ?AUTO_2954 ) ) ( OBJ-AT ?AUTO_2951 ?AUTO_2954 ) ( TRUCK-AT ?AUTO_2953 ?AUTO_2956 ) ( IN-CITY ?AUTO_2956 ?AUTO_2955 ) ( not ( = ?AUTO_2954 ?AUTO_2956 ) ) ( not ( = ?AUTO_2952 ?AUTO_2956 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2953 ?AUTO_2956 ?AUTO_2954 ?AUTO_2955 )
      ( DELIVER-PKG ?AUTO_2951 ?AUTO_2952 )
      ( DELIVER-PKG-VERIFY ?AUTO_2951 ?AUTO_2952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2965 - OBJ
      ?AUTO_2966 - LOCATION
    )
    :vars
    (
      ?AUTO_2967 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2965 ?AUTO_2967 ) ( AIRPLANE-AT ?AUTO_2967 ?AUTO_2966 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2965 ?AUTO_2967 ?AUTO_2966 )
      ( DELIVER-PKG-VERIFY ?AUTO_2965 ?AUTO_2966 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2968 - OBJ
      ?AUTO_2969 - LOCATION
    )
    :vars
    (
      ?AUTO_2970 - AIRPLANE
      ?AUTO_2971 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2968 ?AUTO_2970 ) ( AIRPORT ?AUTO_2971 ) ( AIRPORT ?AUTO_2969 ) ( AIRPLANE-AT ?AUTO_2970 ?AUTO_2971 ) ( not ( = ?AUTO_2971 ?AUTO_2969 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2970 ?AUTO_2971 ?AUTO_2969 )
      ( DELIVER-PKG ?AUTO_2968 ?AUTO_2969 )
      ( DELIVER-PKG-VERIFY ?AUTO_2968 ?AUTO_2969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2974 - OBJ
      ?AUTO_2975 - LOCATION
    )
    :vars
    (
      ?AUTO_2977 - LOCATION
      ?AUTO_2976 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2977 ) ( AIRPORT ?AUTO_2975 ) ( AIRPLANE-AT ?AUTO_2976 ?AUTO_2977 ) ( not ( = ?AUTO_2977 ?AUTO_2975 ) ) ( OBJ-AT ?AUTO_2974 ?AUTO_2977 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2974 ?AUTO_2976 ?AUTO_2977 )
      ( DELIVER-PKG ?AUTO_2974 ?AUTO_2975 )
      ( DELIVER-PKG-VERIFY ?AUTO_2974 ?AUTO_2975 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2978 - OBJ
      ?AUTO_2979 - LOCATION
    )
    :vars
    (
      ?AUTO_2981 - LOCATION
      ?AUTO_2982 - LOCATION
      ?AUTO_2980 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2981 ) ( AIRPORT ?AUTO_2979 ) ( not ( = ?AUTO_2981 ?AUTO_2979 ) ) ( OBJ-AT ?AUTO_2978 ?AUTO_2981 ) ( AIRPORT ?AUTO_2982 ) ( AIRPLANE-AT ?AUTO_2980 ?AUTO_2982 ) ( not ( = ?AUTO_2982 ?AUTO_2981 ) ) ( not ( = ?AUTO_2979 ?AUTO_2982 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2980 ?AUTO_2982 ?AUTO_2981 )
      ( DELIVER-PKG ?AUTO_2978 ?AUTO_2979 )
      ( DELIVER-PKG-VERIFY ?AUTO_2978 ?AUTO_2979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2985 - OBJ
      ?AUTO_2986 - LOCATION
    )
    :vars
    (
      ?AUTO_2989 - LOCATION
      ?AUTO_2987 - LOCATION
      ?AUTO_2988 - AIRPLANE
      ?AUTO_2990 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2989 ) ( AIRPORT ?AUTO_2986 ) ( not ( = ?AUTO_2989 ?AUTO_2986 ) ) ( AIRPORT ?AUTO_2987 ) ( AIRPLANE-AT ?AUTO_2988 ?AUTO_2987 ) ( not ( = ?AUTO_2987 ?AUTO_2989 ) ) ( not ( = ?AUTO_2986 ?AUTO_2987 ) ) ( TRUCK-AT ?AUTO_2990 ?AUTO_2989 ) ( IN-TRUCK ?AUTO_2985 ?AUTO_2990 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2985 ?AUTO_2990 ?AUTO_2989 )
      ( DELIVER-PKG ?AUTO_2985 ?AUTO_2986 )
      ( DELIVER-PKG-VERIFY ?AUTO_2985 ?AUTO_2986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2991 - OBJ
      ?AUTO_2992 - LOCATION
    )
    :vars
    (
      ?AUTO_2995 - LOCATION
      ?AUTO_2993 - LOCATION
      ?AUTO_2994 - AIRPLANE
      ?AUTO_2996 - TRUCK
      ?AUTO_2997 - LOCATION
      ?AUTO_2998 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2995 ) ( AIRPORT ?AUTO_2992 ) ( not ( = ?AUTO_2995 ?AUTO_2992 ) ) ( AIRPORT ?AUTO_2993 ) ( AIRPLANE-AT ?AUTO_2994 ?AUTO_2993 ) ( not ( = ?AUTO_2993 ?AUTO_2995 ) ) ( not ( = ?AUTO_2992 ?AUTO_2993 ) ) ( IN-TRUCK ?AUTO_2991 ?AUTO_2996 ) ( TRUCK-AT ?AUTO_2996 ?AUTO_2997 ) ( IN-CITY ?AUTO_2997 ?AUTO_2998 ) ( IN-CITY ?AUTO_2995 ?AUTO_2998 ) ( not ( = ?AUTO_2995 ?AUTO_2997 ) ) ( not ( = ?AUTO_2992 ?AUTO_2997 ) ) ( not ( = ?AUTO_2993 ?AUTO_2997 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2996 ?AUTO_2997 ?AUTO_2995 ?AUTO_2998 )
      ( DELIVER-PKG ?AUTO_2991 ?AUTO_2992 )
      ( DELIVER-PKG-VERIFY ?AUTO_2991 ?AUTO_2992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3003 - OBJ
      ?AUTO_3004 - LOCATION
    )
    :vars
    (
      ?AUTO_3005 - LOCATION
      ?AUTO_3008 - LOCATION
      ?AUTO_3006 - AIRPLANE
      ?AUTO_3007 - TRUCK
      ?AUTO_3009 - LOCATION
      ?AUTO_3010 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3005 ) ( AIRPORT ?AUTO_3004 ) ( not ( = ?AUTO_3005 ?AUTO_3004 ) ) ( AIRPORT ?AUTO_3008 ) ( AIRPLANE-AT ?AUTO_3006 ?AUTO_3008 ) ( not ( = ?AUTO_3008 ?AUTO_3005 ) ) ( not ( = ?AUTO_3004 ?AUTO_3008 ) ) ( TRUCK-AT ?AUTO_3007 ?AUTO_3009 ) ( IN-CITY ?AUTO_3009 ?AUTO_3010 ) ( IN-CITY ?AUTO_3005 ?AUTO_3010 ) ( not ( = ?AUTO_3005 ?AUTO_3009 ) ) ( not ( = ?AUTO_3004 ?AUTO_3009 ) ) ( not ( = ?AUTO_3008 ?AUTO_3009 ) ) ( OBJ-AT ?AUTO_3003 ?AUTO_3009 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3003 ?AUTO_3007 ?AUTO_3009 )
      ( DELIVER-PKG ?AUTO_3003 ?AUTO_3004 )
      ( DELIVER-PKG-VERIFY ?AUTO_3003 ?AUTO_3004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3011 - OBJ
      ?AUTO_3012 - LOCATION
    )
    :vars
    (
      ?AUTO_3014 - LOCATION
      ?AUTO_3016 - LOCATION
      ?AUTO_3013 - AIRPLANE
      ?AUTO_3015 - LOCATION
      ?AUTO_3018 - CITY
      ?AUTO_3017 - TRUCK
      ?AUTO_3019 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3014 ) ( AIRPORT ?AUTO_3012 ) ( not ( = ?AUTO_3014 ?AUTO_3012 ) ) ( AIRPORT ?AUTO_3016 ) ( AIRPLANE-AT ?AUTO_3013 ?AUTO_3016 ) ( not ( = ?AUTO_3016 ?AUTO_3014 ) ) ( not ( = ?AUTO_3012 ?AUTO_3016 ) ) ( IN-CITY ?AUTO_3015 ?AUTO_3018 ) ( IN-CITY ?AUTO_3014 ?AUTO_3018 ) ( not ( = ?AUTO_3014 ?AUTO_3015 ) ) ( not ( = ?AUTO_3012 ?AUTO_3015 ) ) ( not ( = ?AUTO_3016 ?AUTO_3015 ) ) ( OBJ-AT ?AUTO_3011 ?AUTO_3015 ) ( TRUCK-AT ?AUTO_3017 ?AUTO_3019 ) ( IN-CITY ?AUTO_3019 ?AUTO_3018 ) ( not ( = ?AUTO_3015 ?AUTO_3019 ) ) ( not ( = ?AUTO_3012 ?AUTO_3019 ) ) ( not ( = ?AUTO_3014 ?AUTO_3019 ) ) ( not ( = ?AUTO_3016 ?AUTO_3019 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3017 ?AUTO_3019 ?AUTO_3015 ?AUTO_3018 )
      ( DELIVER-PKG ?AUTO_3011 ?AUTO_3012 )
      ( DELIVER-PKG-VERIFY ?AUTO_3011 ?AUTO_3012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3024 - OBJ
      ?AUTO_3025 - LOCATION
    )
    :vars
    (
      ?AUTO_3026 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3024 ?AUTO_3026 ) ( AIRPLANE-AT ?AUTO_3026 ?AUTO_3025 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3024 ?AUTO_3026 ?AUTO_3025 )
      ( DELIVER-PKG-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3031 - OBJ
      ?AUTO_3032 - LOCATION
    )
    :vars
    (
      ?AUTO_3033 - AIRPLANE
      ?AUTO_3034 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3031 ?AUTO_3033 ) ( AIRPORT ?AUTO_3034 ) ( AIRPORT ?AUTO_3032 ) ( AIRPLANE-AT ?AUTO_3033 ?AUTO_3034 ) ( not ( = ?AUTO_3034 ?AUTO_3032 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3033 ?AUTO_3034 ?AUTO_3032 )
      ( DELIVER-PKG ?AUTO_3031 ?AUTO_3032 )
      ( DELIVER-PKG-VERIFY ?AUTO_3031 ?AUTO_3032 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3039 - OBJ
      ?AUTO_3040 - LOCATION
    )
    :vars
    (
      ?AUTO_3041 - LOCATION
      ?AUTO_3042 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3041 ) ( AIRPORT ?AUTO_3040 ) ( AIRPLANE-AT ?AUTO_3042 ?AUTO_3041 ) ( not ( = ?AUTO_3041 ?AUTO_3040 ) ) ( OBJ-AT ?AUTO_3039 ?AUTO_3041 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3039 ?AUTO_3042 ?AUTO_3041 )
      ( DELIVER-PKG ?AUTO_3039 ?AUTO_3040 )
      ( DELIVER-PKG-VERIFY ?AUTO_3039 ?AUTO_3040 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3045 - OBJ
      ?AUTO_3046 - LOCATION
    )
    :vars
    (
      ?AUTO_3047 - LOCATION
      ?AUTO_3048 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3047 ) ( AIRPORT ?AUTO_3046 ) ( not ( = ?AUTO_3047 ?AUTO_3046 ) ) ( OBJ-AT ?AUTO_3045 ?AUTO_3047 ) ( AIRPLANE-AT ?AUTO_3048 ?AUTO_3046 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3048 ?AUTO_3046 ?AUTO_3047 )
      ( DELIVER-PKG ?AUTO_3045 ?AUTO_3046 )
      ( DELIVER-PKG-VERIFY ?AUTO_3045 ?AUTO_3046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3049 - OBJ
      ?AUTO_3050 - LOCATION
    )
    :vars
    (
      ?AUTO_3052 - LOCATION
      ?AUTO_3051 - AIRPLANE
      ?AUTO_3053 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3052 ) ( AIRPORT ?AUTO_3050 ) ( not ( = ?AUTO_3052 ?AUTO_3050 ) ) ( AIRPLANE-AT ?AUTO_3051 ?AUTO_3050 ) ( TRUCK-AT ?AUTO_3053 ?AUTO_3052 ) ( IN-TRUCK ?AUTO_3049 ?AUTO_3053 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3049 ?AUTO_3053 ?AUTO_3052 )
      ( DELIVER-PKG ?AUTO_3049 ?AUTO_3050 )
      ( DELIVER-PKG-VERIFY ?AUTO_3049 ?AUTO_3050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3056 - OBJ
      ?AUTO_3057 - LOCATION
    )
    :vars
    (
      ?AUTO_3058 - LOCATION
      ?AUTO_3059 - AIRPLANE
      ?AUTO_3060 - TRUCK
      ?AUTO_3061 - LOCATION
      ?AUTO_3062 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3058 ) ( AIRPORT ?AUTO_3057 ) ( not ( = ?AUTO_3058 ?AUTO_3057 ) ) ( AIRPLANE-AT ?AUTO_3059 ?AUTO_3057 ) ( IN-TRUCK ?AUTO_3056 ?AUTO_3060 ) ( TRUCK-AT ?AUTO_3060 ?AUTO_3061 ) ( IN-CITY ?AUTO_3061 ?AUTO_3062 ) ( IN-CITY ?AUTO_3058 ?AUTO_3062 ) ( not ( = ?AUTO_3058 ?AUTO_3061 ) ) ( not ( = ?AUTO_3057 ?AUTO_3061 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3060 ?AUTO_3061 ?AUTO_3058 ?AUTO_3062 )
      ( DELIVER-PKG ?AUTO_3056 ?AUTO_3057 )
      ( DELIVER-PKG-VERIFY ?AUTO_3056 ?AUTO_3057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3063 - OBJ
      ?AUTO_3064 - LOCATION
    )
    :vars
    (
      ?AUTO_3068 - LOCATION
      ?AUTO_3067 - AIRPLANE
      ?AUTO_3069 - TRUCK
      ?AUTO_3066 - LOCATION
      ?AUTO_3065 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3068 ) ( AIRPORT ?AUTO_3064 ) ( not ( = ?AUTO_3068 ?AUTO_3064 ) ) ( AIRPLANE-AT ?AUTO_3067 ?AUTO_3064 ) ( TRUCK-AT ?AUTO_3069 ?AUTO_3066 ) ( IN-CITY ?AUTO_3066 ?AUTO_3065 ) ( IN-CITY ?AUTO_3068 ?AUTO_3065 ) ( not ( = ?AUTO_3068 ?AUTO_3066 ) ) ( not ( = ?AUTO_3064 ?AUTO_3066 ) ) ( OBJ-AT ?AUTO_3063 ?AUTO_3066 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3063 ?AUTO_3069 ?AUTO_3066 )
      ( DELIVER-PKG ?AUTO_3063 ?AUTO_3064 )
      ( DELIVER-PKG-VERIFY ?AUTO_3063 ?AUTO_3064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3070 - OBJ
      ?AUTO_3071 - LOCATION
    )
    :vars
    (
      ?AUTO_3072 - LOCATION
      ?AUTO_3074 - AIRPLANE
      ?AUTO_3073 - LOCATION
      ?AUTO_3075 - CITY
      ?AUTO_3076 - TRUCK
      ?AUTO_3077 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3072 ) ( AIRPORT ?AUTO_3071 ) ( not ( = ?AUTO_3072 ?AUTO_3071 ) ) ( AIRPLANE-AT ?AUTO_3074 ?AUTO_3071 ) ( IN-CITY ?AUTO_3073 ?AUTO_3075 ) ( IN-CITY ?AUTO_3072 ?AUTO_3075 ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) ( not ( = ?AUTO_3071 ?AUTO_3073 ) ) ( OBJ-AT ?AUTO_3070 ?AUTO_3073 ) ( TRUCK-AT ?AUTO_3076 ?AUTO_3077 ) ( IN-CITY ?AUTO_3077 ?AUTO_3075 ) ( not ( = ?AUTO_3073 ?AUTO_3077 ) ) ( not ( = ?AUTO_3071 ?AUTO_3077 ) ) ( not ( = ?AUTO_3072 ?AUTO_3077 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3076 ?AUTO_3077 ?AUTO_3073 ?AUTO_3075 )
      ( DELIVER-PKG ?AUTO_3070 ?AUTO_3071 )
      ( DELIVER-PKG-VERIFY ?AUTO_3070 ?AUTO_3071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3086 - OBJ
      ?AUTO_3087 - LOCATION
    )
    :vars
    (
      ?AUTO_3088 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3088 ?AUTO_3087 ) ( IN-TRUCK ?AUTO_3086 ?AUTO_3088 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3086 ?AUTO_3088 ?AUTO_3087 )
      ( DELIVER-PKG-VERIFY ?AUTO_3086 ?AUTO_3087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3091 - OBJ
      ?AUTO_3092 - LOCATION
    )
    :vars
    (
      ?AUTO_3093 - TRUCK
      ?AUTO_3094 - LOCATION
      ?AUTO_3095 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3091 ?AUTO_3093 ) ( TRUCK-AT ?AUTO_3093 ?AUTO_3094 ) ( IN-CITY ?AUTO_3094 ?AUTO_3095 ) ( IN-CITY ?AUTO_3092 ?AUTO_3095 ) ( not ( = ?AUTO_3092 ?AUTO_3094 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3093 ?AUTO_3094 ?AUTO_3092 ?AUTO_3095 )
      ( DELIVER-PKG ?AUTO_3091 ?AUTO_3092 )
      ( DELIVER-PKG-VERIFY ?AUTO_3091 ?AUTO_3092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3096 - OBJ
      ?AUTO_3097 - LOCATION
    )
    :vars
    (
      ?AUTO_3098 - TRUCK
      ?AUTO_3099 - LOCATION
      ?AUTO_3100 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3098 ?AUTO_3099 ) ( IN-CITY ?AUTO_3099 ?AUTO_3100 ) ( IN-CITY ?AUTO_3097 ?AUTO_3100 ) ( not ( = ?AUTO_3097 ?AUTO_3099 ) ) ( OBJ-AT ?AUTO_3096 ?AUTO_3099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3096 ?AUTO_3098 ?AUTO_3099 )
      ( DELIVER-PKG ?AUTO_3096 ?AUTO_3097 )
      ( DELIVER-PKG-VERIFY ?AUTO_3096 ?AUTO_3097 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3103 - OBJ
      ?AUTO_3104 - LOCATION
    )
    :vars
    (
      ?AUTO_3107 - TRUCK
      ?AUTO_3105 - LOCATION
      ?AUTO_3106 - CITY
      ?AUTO_3108 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3107 ?AUTO_3105 ) ( IN-CITY ?AUTO_3105 ?AUTO_3106 ) ( IN-CITY ?AUTO_3104 ?AUTO_3106 ) ( not ( = ?AUTO_3104 ?AUTO_3105 ) ) ( IN-AIRPLANE ?AUTO_3103 ?AUTO_3108 ) ( AIRPLANE-AT ?AUTO_3108 ?AUTO_3105 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3103 ?AUTO_3108 ?AUTO_3105 )
      ( DELIVER-PKG ?AUTO_3103 ?AUTO_3104 )
      ( DELIVER-PKG-VERIFY ?AUTO_3103 ?AUTO_3104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3109 - OBJ
      ?AUTO_3110 - LOCATION
    )
    :vars
    (
      ?AUTO_3113 - TRUCK
      ?AUTO_3112 - LOCATION
      ?AUTO_3111 - CITY
      ?AUTO_3114 - AIRPLANE
      ?AUTO_3115 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3113 ?AUTO_3112 ) ( IN-CITY ?AUTO_3112 ?AUTO_3111 ) ( IN-CITY ?AUTO_3110 ?AUTO_3111 ) ( not ( = ?AUTO_3110 ?AUTO_3112 ) ) ( IN-AIRPLANE ?AUTO_3109 ?AUTO_3114 ) ( AIRPORT ?AUTO_3115 ) ( AIRPORT ?AUTO_3112 ) ( AIRPLANE-AT ?AUTO_3114 ?AUTO_3115 ) ( not ( = ?AUTO_3115 ?AUTO_3112 ) ) ( not ( = ?AUTO_3110 ?AUTO_3115 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3114 ?AUTO_3115 ?AUTO_3112 )
      ( DELIVER-PKG ?AUTO_3109 ?AUTO_3110 )
      ( DELIVER-PKG-VERIFY ?AUTO_3109 ?AUTO_3110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3118 - OBJ
      ?AUTO_3119 - LOCATION
    )
    :vars
    (
      ?AUTO_3120 - TRUCK
      ?AUTO_3121 - LOCATION
      ?AUTO_3124 - CITY
      ?AUTO_3122 - LOCATION
      ?AUTO_3123 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3120 ?AUTO_3121 ) ( IN-CITY ?AUTO_3121 ?AUTO_3124 ) ( IN-CITY ?AUTO_3119 ?AUTO_3124 ) ( not ( = ?AUTO_3119 ?AUTO_3121 ) ) ( AIRPORT ?AUTO_3122 ) ( AIRPORT ?AUTO_3121 ) ( AIRPLANE-AT ?AUTO_3123 ?AUTO_3122 ) ( not ( = ?AUTO_3122 ?AUTO_3121 ) ) ( not ( = ?AUTO_3119 ?AUTO_3122 ) ) ( OBJ-AT ?AUTO_3118 ?AUTO_3122 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3118 ?AUTO_3123 ?AUTO_3122 )
      ( DELIVER-PKG ?AUTO_3118 ?AUTO_3119 )
      ( DELIVER-PKG-VERIFY ?AUTO_3118 ?AUTO_3119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3125 - OBJ
      ?AUTO_3126 - LOCATION
    )
    :vars
    (
      ?AUTO_3127 - TRUCK
      ?AUTO_3129 - LOCATION
      ?AUTO_3128 - CITY
      ?AUTO_3131 - LOCATION
      ?AUTO_3132 - LOCATION
      ?AUTO_3130 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3127 ?AUTO_3129 ) ( IN-CITY ?AUTO_3129 ?AUTO_3128 ) ( IN-CITY ?AUTO_3126 ?AUTO_3128 ) ( not ( = ?AUTO_3126 ?AUTO_3129 ) ) ( AIRPORT ?AUTO_3131 ) ( AIRPORT ?AUTO_3129 ) ( not ( = ?AUTO_3131 ?AUTO_3129 ) ) ( not ( = ?AUTO_3126 ?AUTO_3131 ) ) ( OBJ-AT ?AUTO_3125 ?AUTO_3131 ) ( AIRPORT ?AUTO_3132 ) ( AIRPLANE-AT ?AUTO_3130 ?AUTO_3132 ) ( not ( = ?AUTO_3132 ?AUTO_3131 ) ) ( not ( = ?AUTO_3126 ?AUTO_3132 ) ) ( not ( = ?AUTO_3129 ?AUTO_3132 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3130 ?AUTO_3132 ?AUTO_3131 )
      ( DELIVER-PKG ?AUTO_3125 ?AUTO_3126 )
      ( DELIVER-PKG-VERIFY ?AUTO_3125 ?AUTO_3126 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3135 - OBJ
      ?AUTO_3136 - LOCATION
    )
    :vars
    (
      ?AUTO_3141 - TRUCK
      ?AUTO_3140 - LOCATION
      ?AUTO_3139 - CITY
      ?AUTO_3137 - LOCATION
      ?AUTO_3138 - LOCATION
      ?AUTO_3142 - AIRPLANE
      ?AUTO_3143 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3141 ?AUTO_3140 ) ( IN-CITY ?AUTO_3140 ?AUTO_3139 ) ( IN-CITY ?AUTO_3136 ?AUTO_3139 ) ( not ( = ?AUTO_3136 ?AUTO_3140 ) ) ( AIRPORT ?AUTO_3137 ) ( AIRPORT ?AUTO_3140 ) ( not ( = ?AUTO_3137 ?AUTO_3140 ) ) ( not ( = ?AUTO_3136 ?AUTO_3137 ) ) ( AIRPORT ?AUTO_3138 ) ( AIRPLANE-AT ?AUTO_3142 ?AUTO_3138 ) ( not ( = ?AUTO_3138 ?AUTO_3137 ) ) ( not ( = ?AUTO_3136 ?AUTO_3138 ) ) ( not ( = ?AUTO_3140 ?AUTO_3138 ) ) ( TRUCK-AT ?AUTO_3143 ?AUTO_3137 ) ( IN-TRUCK ?AUTO_3135 ?AUTO_3143 ) ( not ( = ?AUTO_3141 ?AUTO_3143 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3135 ?AUTO_3143 ?AUTO_3137 )
      ( DELIVER-PKG ?AUTO_3135 ?AUTO_3136 )
      ( DELIVER-PKG-VERIFY ?AUTO_3135 ?AUTO_3136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3144 - OBJ
      ?AUTO_3145 - LOCATION
    )
    :vars
    (
      ?AUTO_3148 - TRUCK
      ?AUTO_3147 - LOCATION
      ?AUTO_3150 - CITY
      ?AUTO_3149 - LOCATION
      ?AUTO_3146 - LOCATION
      ?AUTO_3151 - AIRPLANE
      ?AUTO_3152 - TRUCK
      ?AUTO_3153 - LOCATION
      ?AUTO_3154 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3148 ?AUTO_3147 ) ( IN-CITY ?AUTO_3147 ?AUTO_3150 ) ( IN-CITY ?AUTO_3145 ?AUTO_3150 ) ( not ( = ?AUTO_3145 ?AUTO_3147 ) ) ( AIRPORT ?AUTO_3149 ) ( AIRPORT ?AUTO_3147 ) ( not ( = ?AUTO_3149 ?AUTO_3147 ) ) ( not ( = ?AUTO_3145 ?AUTO_3149 ) ) ( AIRPORT ?AUTO_3146 ) ( AIRPLANE-AT ?AUTO_3151 ?AUTO_3146 ) ( not ( = ?AUTO_3146 ?AUTO_3149 ) ) ( not ( = ?AUTO_3145 ?AUTO_3146 ) ) ( not ( = ?AUTO_3147 ?AUTO_3146 ) ) ( IN-TRUCK ?AUTO_3144 ?AUTO_3152 ) ( not ( = ?AUTO_3148 ?AUTO_3152 ) ) ( TRUCK-AT ?AUTO_3152 ?AUTO_3153 ) ( IN-CITY ?AUTO_3153 ?AUTO_3154 ) ( IN-CITY ?AUTO_3149 ?AUTO_3154 ) ( not ( = ?AUTO_3149 ?AUTO_3153 ) ) ( not ( = ?AUTO_3145 ?AUTO_3153 ) ) ( not ( = ?AUTO_3147 ?AUTO_3153 ) ) ( not ( = ?AUTO_3150 ?AUTO_3154 ) ) ( not ( = ?AUTO_3146 ?AUTO_3153 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3152 ?AUTO_3153 ?AUTO_3149 ?AUTO_3154 )
      ( DELIVER-PKG ?AUTO_3144 ?AUTO_3145 )
      ( DELIVER-PKG-VERIFY ?AUTO_3144 ?AUTO_3145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3159 - OBJ
      ?AUTO_3160 - LOCATION
    )
    :vars
    (
      ?AUTO_3163 - TRUCK
      ?AUTO_3169 - LOCATION
      ?AUTO_3166 - CITY
      ?AUTO_3165 - LOCATION
      ?AUTO_3167 - LOCATION
      ?AUTO_3161 - AIRPLANE
      ?AUTO_3168 - TRUCK
      ?AUTO_3164 - LOCATION
      ?AUTO_3162 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3163 ?AUTO_3169 ) ( IN-CITY ?AUTO_3169 ?AUTO_3166 ) ( IN-CITY ?AUTO_3160 ?AUTO_3166 ) ( not ( = ?AUTO_3160 ?AUTO_3169 ) ) ( AIRPORT ?AUTO_3165 ) ( AIRPORT ?AUTO_3169 ) ( not ( = ?AUTO_3165 ?AUTO_3169 ) ) ( not ( = ?AUTO_3160 ?AUTO_3165 ) ) ( AIRPORT ?AUTO_3167 ) ( AIRPLANE-AT ?AUTO_3161 ?AUTO_3167 ) ( not ( = ?AUTO_3167 ?AUTO_3165 ) ) ( not ( = ?AUTO_3160 ?AUTO_3167 ) ) ( not ( = ?AUTO_3169 ?AUTO_3167 ) ) ( not ( = ?AUTO_3163 ?AUTO_3168 ) ) ( TRUCK-AT ?AUTO_3168 ?AUTO_3164 ) ( IN-CITY ?AUTO_3164 ?AUTO_3162 ) ( IN-CITY ?AUTO_3165 ?AUTO_3162 ) ( not ( = ?AUTO_3165 ?AUTO_3164 ) ) ( not ( = ?AUTO_3160 ?AUTO_3164 ) ) ( not ( = ?AUTO_3169 ?AUTO_3164 ) ) ( not ( = ?AUTO_3166 ?AUTO_3162 ) ) ( not ( = ?AUTO_3167 ?AUTO_3164 ) ) ( OBJ-AT ?AUTO_3159 ?AUTO_3164 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3159 ?AUTO_3168 ?AUTO_3164 )
      ( DELIVER-PKG ?AUTO_3159 ?AUTO_3160 )
      ( DELIVER-PKG-VERIFY ?AUTO_3159 ?AUTO_3160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3170 - OBJ
      ?AUTO_3171 - LOCATION
    )
    :vars
    (
      ?AUTO_3175 - TRUCK
      ?AUTO_3180 - LOCATION
      ?AUTO_3178 - CITY
      ?AUTO_3173 - LOCATION
      ?AUTO_3176 - LOCATION
      ?AUTO_3174 - AIRPLANE
      ?AUTO_3179 - TRUCK
      ?AUTO_3172 - LOCATION
      ?AUTO_3177 - CITY
      ?AUTO_3181 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3175 ?AUTO_3180 ) ( IN-CITY ?AUTO_3180 ?AUTO_3178 ) ( IN-CITY ?AUTO_3171 ?AUTO_3178 ) ( not ( = ?AUTO_3171 ?AUTO_3180 ) ) ( AIRPORT ?AUTO_3173 ) ( AIRPORT ?AUTO_3180 ) ( not ( = ?AUTO_3173 ?AUTO_3180 ) ) ( not ( = ?AUTO_3171 ?AUTO_3173 ) ) ( AIRPORT ?AUTO_3176 ) ( AIRPLANE-AT ?AUTO_3174 ?AUTO_3176 ) ( not ( = ?AUTO_3176 ?AUTO_3173 ) ) ( not ( = ?AUTO_3171 ?AUTO_3176 ) ) ( not ( = ?AUTO_3180 ?AUTO_3176 ) ) ( not ( = ?AUTO_3175 ?AUTO_3179 ) ) ( IN-CITY ?AUTO_3172 ?AUTO_3177 ) ( IN-CITY ?AUTO_3173 ?AUTO_3177 ) ( not ( = ?AUTO_3173 ?AUTO_3172 ) ) ( not ( = ?AUTO_3171 ?AUTO_3172 ) ) ( not ( = ?AUTO_3180 ?AUTO_3172 ) ) ( not ( = ?AUTO_3178 ?AUTO_3177 ) ) ( not ( = ?AUTO_3176 ?AUTO_3172 ) ) ( OBJ-AT ?AUTO_3170 ?AUTO_3172 ) ( TRUCK-AT ?AUTO_3179 ?AUTO_3181 ) ( IN-CITY ?AUTO_3181 ?AUTO_3177 ) ( not ( = ?AUTO_3172 ?AUTO_3181 ) ) ( not ( = ?AUTO_3171 ?AUTO_3181 ) ) ( not ( = ?AUTO_3180 ?AUTO_3181 ) ) ( not ( = ?AUTO_3173 ?AUTO_3181 ) ) ( not ( = ?AUTO_3176 ?AUTO_3181 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3179 ?AUTO_3181 ?AUTO_3172 ?AUTO_3177 )
      ( DELIVER-PKG ?AUTO_3170 ?AUTO_3171 )
      ( DELIVER-PKG-VERIFY ?AUTO_3170 ?AUTO_3171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3182 - OBJ
      ?AUTO_3183 - LOCATION
    )
    :vars
    (
      ?AUTO_3187 - LOCATION
      ?AUTO_3185 - CITY
      ?AUTO_3186 - LOCATION
      ?AUTO_3189 - LOCATION
      ?AUTO_3193 - AIRPLANE
      ?AUTO_3191 - TRUCK
      ?AUTO_3188 - TRUCK
      ?AUTO_3190 - LOCATION
      ?AUTO_3184 - CITY
      ?AUTO_3192 - LOCATION
      ?AUTO_3194 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3187 ?AUTO_3185 ) ( IN-CITY ?AUTO_3183 ?AUTO_3185 ) ( not ( = ?AUTO_3183 ?AUTO_3187 ) ) ( AIRPORT ?AUTO_3186 ) ( AIRPORT ?AUTO_3187 ) ( not ( = ?AUTO_3186 ?AUTO_3187 ) ) ( not ( = ?AUTO_3183 ?AUTO_3186 ) ) ( AIRPORT ?AUTO_3189 ) ( AIRPLANE-AT ?AUTO_3193 ?AUTO_3189 ) ( not ( = ?AUTO_3189 ?AUTO_3186 ) ) ( not ( = ?AUTO_3183 ?AUTO_3189 ) ) ( not ( = ?AUTO_3187 ?AUTO_3189 ) ) ( not ( = ?AUTO_3191 ?AUTO_3188 ) ) ( IN-CITY ?AUTO_3190 ?AUTO_3184 ) ( IN-CITY ?AUTO_3186 ?AUTO_3184 ) ( not ( = ?AUTO_3186 ?AUTO_3190 ) ) ( not ( = ?AUTO_3183 ?AUTO_3190 ) ) ( not ( = ?AUTO_3187 ?AUTO_3190 ) ) ( not ( = ?AUTO_3185 ?AUTO_3184 ) ) ( not ( = ?AUTO_3189 ?AUTO_3190 ) ) ( OBJ-AT ?AUTO_3182 ?AUTO_3190 ) ( TRUCK-AT ?AUTO_3188 ?AUTO_3192 ) ( IN-CITY ?AUTO_3192 ?AUTO_3184 ) ( not ( = ?AUTO_3190 ?AUTO_3192 ) ) ( not ( = ?AUTO_3183 ?AUTO_3192 ) ) ( not ( = ?AUTO_3187 ?AUTO_3192 ) ) ( not ( = ?AUTO_3186 ?AUTO_3192 ) ) ( not ( = ?AUTO_3189 ?AUTO_3192 ) ) ( TRUCK-AT ?AUTO_3191 ?AUTO_3194 ) ( IN-CITY ?AUTO_3194 ?AUTO_3185 ) ( not ( = ?AUTO_3187 ?AUTO_3194 ) ) ( not ( = ?AUTO_3183 ?AUTO_3194 ) ) ( not ( = ?AUTO_3186 ?AUTO_3194 ) ) ( not ( = ?AUTO_3189 ?AUTO_3194 ) ) ( not ( = ?AUTO_3190 ?AUTO_3194 ) ) ( not ( = ?AUTO_3192 ?AUTO_3194 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3191 ?AUTO_3194 ?AUTO_3187 ?AUTO_3185 )
      ( DELIVER-PKG ?AUTO_3182 ?AUTO_3183 )
      ( DELIVER-PKG-VERIFY ?AUTO_3182 ?AUTO_3183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3197 - OBJ
      ?AUTO_3198 - LOCATION
    )
    :vars
    (
      ?AUTO_3199 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3199 ?AUTO_3198 ) ( IN-TRUCK ?AUTO_3197 ?AUTO_3199 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3197 ?AUTO_3199 ?AUTO_3198 )
      ( DELIVER-PKG-VERIFY ?AUTO_3197 ?AUTO_3198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3202 - OBJ
      ?AUTO_3203 - LOCATION
    )
    :vars
    (
      ?AUTO_3204 - TRUCK
      ?AUTO_3205 - LOCATION
      ?AUTO_3206 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3202 ?AUTO_3204 ) ( TRUCK-AT ?AUTO_3204 ?AUTO_3205 ) ( IN-CITY ?AUTO_3205 ?AUTO_3206 ) ( IN-CITY ?AUTO_3203 ?AUTO_3206 ) ( not ( = ?AUTO_3203 ?AUTO_3205 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3204 ?AUTO_3205 ?AUTO_3203 ?AUTO_3206 )
      ( DELIVER-PKG ?AUTO_3202 ?AUTO_3203 )
      ( DELIVER-PKG-VERIFY ?AUTO_3202 ?AUTO_3203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3207 - OBJ
      ?AUTO_3208 - LOCATION
    )
    :vars
    (
      ?AUTO_3209 - TRUCK
      ?AUTO_3210 - LOCATION
      ?AUTO_3211 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3209 ?AUTO_3210 ) ( IN-CITY ?AUTO_3210 ?AUTO_3211 ) ( IN-CITY ?AUTO_3208 ?AUTO_3211 ) ( not ( = ?AUTO_3208 ?AUTO_3210 ) ) ( OBJ-AT ?AUTO_3207 ?AUTO_3210 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3207 ?AUTO_3209 ?AUTO_3210 )
      ( DELIVER-PKG ?AUTO_3207 ?AUTO_3208 )
      ( DELIVER-PKG-VERIFY ?AUTO_3207 ?AUTO_3208 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3216 - OBJ
      ?AUTO_3217 - LOCATION
    )
    :vars
    (
      ?AUTO_3218 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3218 ?AUTO_3217 ) ( IN-TRUCK ?AUTO_3216 ?AUTO_3218 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3216 ?AUTO_3218 ?AUTO_3217 )
      ( DELIVER-PKG-VERIFY ?AUTO_3216 ?AUTO_3217 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3219 - OBJ
      ?AUTO_3220 - LOCATION
    )
    :vars
    (
      ?AUTO_3221 - TRUCK
      ?AUTO_3222 - LOCATION
      ?AUTO_3223 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3219 ?AUTO_3221 ) ( TRUCK-AT ?AUTO_3221 ?AUTO_3222 ) ( IN-CITY ?AUTO_3222 ?AUTO_3223 ) ( IN-CITY ?AUTO_3220 ?AUTO_3223 ) ( not ( = ?AUTO_3220 ?AUTO_3222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3221 ?AUTO_3222 ?AUTO_3220 ?AUTO_3223 )
      ( DELIVER-PKG ?AUTO_3219 ?AUTO_3220 )
      ( DELIVER-PKG-VERIFY ?AUTO_3219 ?AUTO_3220 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3236 - OBJ
      ?AUTO_3237 - LOCATION
    )
    :vars
    (
      ?AUTO_3238 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3236 ?AUTO_3238 ) ( AIRPLANE-AT ?AUTO_3238 ?AUTO_3237 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3236 ?AUTO_3238 ?AUTO_3237 )
      ( DELIVER-PKG-VERIFY ?AUTO_3236 ?AUTO_3237 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3241 - OBJ
      ?AUTO_3242 - LOCATION
    )
    :vars
    (
      ?AUTO_3243 - AIRPLANE
      ?AUTO_3244 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3241 ?AUTO_3243 ) ( AIRPORT ?AUTO_3244 ) ( AIRPORT ?AUTO_3242 ) ( AIRPLANE-AT ?AUTO_3243 ?AUTO_3244 ) ( not ( = ?AUTO_3244 ?AUTO_3242 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3243 ?AUTO_3244 ?AUTO_3242 )
      ( DELIVER-PKG ?AUTO_3241 ?AUTO_3242 )
      ( DELIVER-PKG-VERIFY ?AUTO_3241 ?AUTO_3242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3245 - OBJ
      ?AUTO_3246 - LOCATION
    )
    :vars
    (
      ?AUTO_3248 - LOCATION
      ?AUTO_3247 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3248 ) ( AIRPORT ?AUTO_3246 ) ( AIRPLANE-AT ?AUTO_3247 ?AUTO_3248 ) ( not ( = ?AUTO_3248 ?AUTO_3246 ) ) ( OBJ-AT ?AUTO_3245 ?AUTO_3248 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3245 ?AUTO_3247 ?AUTO_3248 )
      ( DELIVER-PKG ?AUTO_3245 ?AUTO_3246 )
      ( DELIVER-PKG-VERIFY ?AUTO_3245 ?AUTO_3246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3249 - OBJ
      ?AUTO_3250 - LOCATION
    )
    :vars
    (
      ?AUTO_3252 - LOCATION
      ?AUTO_3253 - LOCATION
      ?AUTO_3251 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3252 ) ( AIRPORT ?AUTO_3250 ) ( not ( = ?AUTO_3252 ?AUTO_3250 ) ) ( OBJ-AT ?AUTO_3249 ?AUTO_3252 ) ( AIRPORT ?AUTO_3253 ) ( AIRPLANE-AT ?AUTO_3251 ?AUTO_3253 ) ( not ( = ?AUTO_3253 ?AUTO_3252 ) ) ( not ( = ?AUTO_3250 ?AUTO_3253 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3251 ?AUTO_3253 ?AUTO_3252 )
      ( DELIVER-PKG ?AUTO_3249 ?AUTO_3250 )
      ( DELIVER-PKG-VERIFY ?AUTO_3249 ?AUTO_3250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3270 - OBJ
      ?AUTO_3271 - LOCATION
    )
    :vars
    (
      ?AUTO_3272 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3270 ?AUTO_3272 ) ( AIRPLANE-AT ?AUTO_3272 ?AUTO_3271 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3270 ?AUTO_3272 ?AUTO_3271 )
      ( DELIVER-PKG-VERIFY ?AUTO_3270 ?AUTO_3271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3273 - OBJ
      ?AUTO_3274 - LOCATION
    )
    :vars
    (
      ?AUTO_3275 - AIRPLANE
      ?AUTO_3276 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3273 ?AUTO_3275 ) ( AIRPORT ?AUTO_3276 ) ( AIRPORT ?AUTO_3274 ) ( AIRPLANE-AT ?AUTO_3275 ?AUTO_3276 ) ( not ( = ?AUTO_3276 ?AUTO_3274 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3275 ?AUTO_3276 ?AUTO_3274 )
      ( DELIVER-PKG ?AUTO_3273 ?AUTO_3274 )
      ( DELIVER-PKG-VERIFY ?AUTO_3273 ?AUTO_3274 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3279 - OBJ
      ?AUTO_3280 - LOCATION
    )
    :vars
    (
      ?AUTO_3282 - LOCATION
      ?AUTO_3281 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3282 ) ( AIRPORT ?AUTO_3280 ) ( AIRPLANE-AT ?AUTO_3281 ?AUTO_3282 ) ( not ( = ?AUTO_3282 ?AUTO_3280 ) ) ( OBJ-AT ?AUTO_3279 ?AUTO_3282 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3279 ?AUTO_3281 ?AUTO_3282 )
      ( DELIVER-PKG ?AUTO_3279 ?AUTO_3280 )
      ( DELIVER-PKG-VERIFY ?AUTO_3279 ?AUTO_3280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3283 - OBJ
      ?AUTO_3284 - LOCATION
    )
    :vars
    (
      ?AUTO_3286 - LOCATION
      ?AUTO_3287 - LOCATION
      ?AUTO_3285 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3286 ) ( AIRPORT ?AUTO_3284 ) ( not ( = ?AUTO_3286 ?AUTO_3284 ) ) ( OBJ-AT ?AUTO_3283 ?AUTO_3286 ) ( AIRPORT ?AUTO_3287 ) ( AIRPLANE-AT ?AUTO_3285 ?AUTO_3287 ) ( not ( = ?AUTO_3287 ?AUTO_3286 ) ) ( not ( = ?AUTO_3284 ?AUTO_3287 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3285 ?AUTO_3287 ?AUTO_3286 )
      ( DELIVER-PKG ?AUTO_3283 ?AUTO_3284 )
      ( DELIVER-PKG-VERIFY ?AUTO_3283 ?AUTO_3284 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3290 - OBJ
      ?AUTO_3291 - LOCATION
    )
    :vars
    (
      ?AUTO_3294 - LOCATION
      ?AUTO_3293 - LOCATION
      ?AUTO_3292 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3294 ) ( AIRPORT ?AUTO_3291 ) ( not ( = ?AUTO_3294 ?AUTO_3291 ) ) ( OBJ-AT ?AUTO_3290 ?AUTO_3294 ) ( AIRPORT ?AUTO_3293 ) ( not ( = ?AUTO_3293 ?AUTO_3294 ) ) ( not ( = ?AUTO_3291 ?AUTO_3293 ) ) ( AIRPLANE-AT ?AUTO_3292 ?AUTO_3291 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3292 ?AUTO_3291 ?AUTO_3293 )
      ( DELIVER-PKG ?AUTO_3290 ?AUTO_3291 )
      ( DELIVER-PKG-VERIFY ?AUTO_3290 ?AUTO_3291 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3295 - OBJ
      ?AUTO_3296 - LOCATION
    )
    :vars
    (
      ?AUTO_3298 - LOCATION
      ?AUTO_3297 - LOCATION
      ?AUTO_3299 - AIRPLANE
      ?AUTO_3300 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3298 ) ( AIRPORT ?AUTO_3296 ) ( not ( = ?AUTO_3298 ?AUTO_3296 ) ) ( AIRPORT ?AUTO_3297 ) ( not ( = ?AUTO_3297 ?AUTO_3298 ) ) ( not ( = ?AUTO_3296 ?AUTO_3297 ) ) ( AIRPLANE-AT ?AUTO_3299 ?AUTO_3296 ) ( TRUCK-AT ?AUTO_3300 ?AUTO_3298 ) ( IN-TRUCK ?AUTO_3295 ?AUTO_3300 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3295 ?AUTO_3300 ?AUTO_3298 )
      ( DELIVER-PKG ?AUTO_3295 ?AUTO_3296 )
      ( DELIVER-PKG-VERIFY ?AUTO_3295 ?AUTO_3296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3301 - OBJ
      ?AUTO_3302 - LOCATION
    )
    :vars
    (
      ?AUTO_3303 - LOCATION
      ?AUTO_3304 - LOCATION
      ?AUTO_3305 - AIRPLANE
      ?AUTO_3306 - TRUCK
      ?AUTO_3307 - LOCATION
      ?AUTO_3308 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3303 ) ( AIRPORT ?AUTO_3302 ) ( not ( = ?AUTO_3303 ?AUTO_3302 ) ) ( AIRPORT ?AUTO_3304 ) ( not ( = ?AUTO_3304 ?AUTO_3303 ) ) ( not ( = ?AUTO_3302 ?AUTO_3304 ) ) ( AIRPLANE-AT ?AUTO_3305 ?AUTO_3302 ) ( IN-TRUCK ?AUTO_3301 ?AUTO_3306 ) ( TRUCK-AT ?AUTO_3306 ?AUTO_3307 ) ( IN-CITY ?AUTO_3307 ?AUTO_3308 ) ( IN-CITY ?AUTO_3303 ?AUTO_3308 ) ( not ( = ?AUTO_3303 ?AUTO_3307 ) ) ( not ( = ?AUTO_3302 ?AUTO_3307 ) ) ( not ( = ?AUTO_3304 ?AUTO_3307 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3306 ?AUTO_3307 ?AUTO_3303 ?AUTO_3308 )
      ( DELIVER-PKG ?AUTO_3301 ?AUTO_3302 )
      ( DELIVER-PKG-VERIFY ?AUTO_3301 ?AUTO_3302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3317 - OBJ
      ?AUTO_3318 - LOCATION
    )
    :vars
    (
      ?AUTO_3324 - LOCATION
      ?AUTO_3323 - LOCATION
      ?AUTO_3322 - AIRPLANE
      ?AUTO_3319 - TRUCK
      ?AUTO_3320 - LOCATION
      ?AUTO_3321 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3324 ) ( AIRPORT ?AUTO_3318 ) ( not ( = ?AUTO_3324 ?AUTO_3318 ) ) ( AIRPORT ?AUTO_3323 ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) ( not ( = ?AUTO_3318 ?AUTO_3323 ) ) ( AIRPLANE-AT ?AUTO_3322 ?AUTO_3318 ) ( TRUCK-AT ?AUTO_3319 ?AUTO_3320 ) ( IN-CITY ?AUTO_3320 ?AUTO_3321 ) ( IN-CITY ?AUTO_3324 ?AUTO_3321 ) ( not ( = ?AUTO_3324 ?AUTO_3320 ) ) ( not ( = ?AUTO_3318 ?AUTO_3320 ) ) ( not ( = ?AUTO_3323 ?AUTO_3320 ) ) ( OBJ-AT ?AUTO_3317 ?AUTO_3320 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3317 ?AUTO_3319 ?AUTO_3320 )
      ( DELIVER-PKG ?AUTO_3317 ?AUTO_3318 )
      ( DELIVER-PKG-VERIFY ?AUTO_3317 ?AUTO_3318 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3327 - OBJ
      ?AUTO_3328 - LOCATION
    )
    :vars
    (
      ?AUTO_3329 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3329 ?AUTO_3328 ) ( IN-TRUCK ?AUTO_3327 ?AUTO_3329 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3327 ?AUTO_3329 ?AUTO_3328 )
      ( DELIVER-PKG-VERIFY ?AUTO_3327 ?AUTO_3328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3334 - OBJ
      ?AUTO_3335 - LOCATION
    )
    :vars
    (
      ?AUTO_3336 - TRUCK
      ?AUTO_3337 - LOCATION
      ?AUTO_3338 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3334 ?AUTO_3336 ) ( TRUCK-AT ?AUTO_3336 ?AUTO_3337 ) ( IN-CITY ?AUTO_3337 ?AUTO_3338 ) ( IN-CITY ?AUTO_3335 ?AUTO_3338 ) ( not ( = ?AUTO_3335 ?AUTO_3337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3336 ?AUTO_3337 ?AUTO_3335 ?AUTO_3338 )
      ( DELIVER-PKG ?AUTO_3334 ?AUTO_3335 )
      ( DELIVER-PKG-VERIFY ?AUTO_3334 ?AUTO_3335 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3339 - OBJ
      ?AUTO_3340 - LOCATION
    )
    :vars
    (
      ?AUTO_3341 - TRUCK
      ?AUTO_3342 - LOCATION
      ?AUTO_3343 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3341 ?AUTO_3342 ) ( IN-CITY ?AUTO_3342 ?AUTO_3343 ) ( IN-CITY ?AUTO_3340 ?AUTO_3343 ) ( not ( = ?AUTO_3340 ?AUTO_3342 ) ) ( OBJ-AT ?AUTO_3339 ?AUTO_3342 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3339 ?AUTO_3341 ?AUTO_3342 )
      ( DELIVER-PKG ?AUTO_3339 ?AUTO_3340 )
      ( DELIVER-PKG-VERIFY ?AUTO_3339 ?AUTO_3340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3344 - OBJ
      ?AUTO_3345 - LOCATION
    )
    :vars
    (
      ?AUTO_3346 - TRUCK
      ?AUTO_3347 - LOCATION
      ?AUTO_3348 - CITY
      ?AUTO_3349 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3346 ?AUTO_3347 ) ( IN-CITY ?AUTO_3347 ?AUTO_3348 ) ( IN-CITY ?AUTO_3345 ?AUTO_3348 ) ( not ( = ?AUTO_3345 ?AUTO_3347 ) ) ( IN-AIRPLANE ?AUTO_3344 ?AUTO_3349 ) ( AIRPLANE-AT ?AUTO_3349 ?AUTO_3347 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3344 ?AUTO_3349 ?AUTO_3347 )
      ( DELIVER-PKG ?AUTO_3344 ?AUTO_3345 )
      ( DELIVER-PKG-VERIFY ?AUTO_3344 ?AUTO_3345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3350 - OBJ
      ?AUTO_3351 - LOCATION
    )
    :vars
    (
      ?AUTO_3354 - TRUCK
      ?AUTO_3353 - LOCATION
      ?AUTO_3352 - CITY
      ?AUTO_3355 - AIRPLANE
      ?AUTO_3356 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3354 ?AUTO_3353 ) ( IN-CITY ?AUTO_3353 ?AUTO_3352 ) ( IN-CITY ?AUTO_3351 ?AUTO_3352 ) ( not ( = ?AUTO_3351 ?AUTO_3353 ) ) ( IN-AIRPLANE ?AUTO_3350 ?AUTO_3355 ) ( AIRPORT ?AUTO_3356 ) ( AIRPORT ?AUTO_3353 ) ( AIRPLANE-AT ?AUTO_3355 ?AUTO_3356 ) ( not ( = ?AUTO_3356 ?AUTO_3353 ) ) ( not ( = ?AUTO_3351 ?AUTO_3356 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3355 ?AUTO_3356 ?AUTO_3353 )
      ( DELIVER-PKG ?AUTO_3350 ?AUTO_3351 )
      ( DELIVER-PKG-VERIFY ?AUTO_3350 ?AUTO_3351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3359 - OBJ
      ?AUTO_3360 - LOCATION
    )
    :vars
    (
      ?AUTO_3362 - TRUCK
      ?AUTO_3364 - LOCATION
      ?AUTO_3365 - CITY
      ?AUTO_3361 - LOCATION
      ?AUTO_3363 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3362 ?AUTO_3364 ) ( IN-CITY ?AUTO_3364 ?AUTO_3365 ) ( IN-CITY ?AUTO_3360 ?AUTO_3365 ) ( not ( = ?AUTO_3360 ?AUTO_3364 ) ) ( AIRPORT ?AUTO_3361 ) ( AIRPORT ?AUTO_3364 ) ( AIRPLANE-AT ?AUTO_3363 ?AUTO_3361 ) ( not ( = ?AUTO_3361 ?AUTO_3364 ) ) ( not ( = ?AUTO_3360 ?AUTO_3361 ) ) ( OBJ-AT ?AUTO_3359 ?AUTO_3361 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3359 ?AUTO_3363 ?AUTO_3361 )
      ( DELIVER-PKG ?AUTO_3359 ?AUTO_3360 )
      ( DELIVER-PKG-VERIFY ?AUTO_3359 ?AUTO_3360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3366 - OBJ
      ?AUTO_3367 - LOCATION
    )
    :vars
    (
      ?AUTO_3371 - TRUCK
      ?AUTO_3372 - LOCATION
      ?AUTO_3370 - CITY
      ?AUTO_3368 - LOCATION
      ?AUTO_3373 - LOCATION
      ?AUTO_3369 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3371 ?AUTO_3372 ) ( IN-CITY ?AUTO_3372 ?AUTO_3370 ) ( IN-CITY ?AUTO_3367 ?AUTO_3370 ) ( not ( = ?AUTO_3367 ?AUTO_3372 ) ) ( AIRPORT ?AUTO_3368 ) ( AIRPORT ?AUTO_3372 ) ( not ( = ?AUTO_3368 ?AUTO_3372 ) ) ( not ( = ?AUTO_3367 ?AUTO_3368 ) ) ( OBJ-AT ?AUTO_3366 ?AUTO_3368 ) ( AIRPORT ?AUTO_3373 ) ( AIRPLANE-AT ?AUTO_3369 ?AUTO_3373 ) ( not ( = ?AUTO_3373 ?AUTO_3368 ) ) ( not ( = ?AUTO_3367 ?AUTO_3373 ) ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3369 ?AUTO_3373 ?AUTO_3368 )
      ( DELIVER-PKG ?AUTO_3366 ?AUTO_3367 )
      ( DELIVER-PKG-VERIFY ?AUTO_3366 ?AUTO_3367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3376 - OBJ
      ?AUTO_3377 - LOCATION
    )
    :vars
    (
      ?AUTO_3383 - TRUCK
      ?AUTO_3381 - LOCATION
      ?AUTO_3379 - CITY
      ?AUTO_3382 - LOCATION
      ?AUTO_3378 - LOCATION
      ?AUTO_3380 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3383 ?AUTO_3381 ) ( IN-CITY ?AUTO_3381 ?AUTO_3379 ) ( IN-CITY ?AUTO_3377 ?AUTO_3379 ) ( not ( = ?AUTO_3377 ?AUTO_3381 ) ) ( AIRPORT ?AUTO_3382 ) ( AIRPORT ?AUTO_3381 ) ( not ( = ?AUTO_3382 ?AUTO_3381 ) ) ( not ( = ?AUTO_3377 ?AUTO_3382 ) ) ( OBJ-AT ?AUTO_3376 ?AUTO_3382 ) ( AIRPORT ?AUTO_3378 ) ( not ( = ?AUTO_3378 ?AUTO_3382 ) ) ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( not ( = ?AUTO_3381 ?AUTO_3378 ) ) ( AIRPLANE-AT ?AUTO_3380 ?AUTO_3381 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3380 ?AUTO_3381 ?AUTO_3378 )
      ( DELIVER-PKG ?AUTO_3376 ?AUTO_3377 )
      ( DELIVER-PKG-VERIFY ?AUTO_3376 ?AUTO_3377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3384 - OBJ
      ?AUTO_3385 - LOCATION
    )
    :vars
    (
      ?AUTO_3387 - TRUCK
      ?AUTO_3389 - LOCATION
      ?AUTO_3386 - CITY
      ?AUTO_3391 - LOCATION
      ?AUTO_3388 - LOCATION
      ?AUTO_3390 - AIRPLANE
      ?AUTO_3392 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3387 ?AUTO_3389 ) ( IN-CITY ?AUTO_3389 ?AUTO_3386 ) ( IN-CITY ?AUTO_3385 ?AUTO_3386 ) ( not ( = ?AUTO_3385 ?AUTO_3389 ) ) ( AIRPORT ?AUTO_3391 ) ( AIRPORT ?AUTO_3389 ) ( not ( = ?AUTO_3391 ?AUTO_3389 ) ) ( not ( = ?AUTO_3385 ?AUTO_3391 ) ) ( AIRPORT ?AUTO_3388 ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( not ( = ?AUTO_3385 ?AUTO_3388 ) ) ( not ( = ?AUTO_3389 ?AUTO_3388 ) ) ( AIRPLANE-AT ?AUTO_3390 ?AUTO_3389 ) ( TRUCK-AT ?AUTO_3392 ?AUTO_3391 ) ( IN-TRUCK ?AUTO_3384 ?AUTO_3392 ) ( not ( = ?AUTO_3387 ?AUTO_3392 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3384 ?AUTO_3392 ?AUTO_3391 )
      ( DELIVER-PKG ?AUTO_3384 ?AUTO_3385 )
      ( DELIVER-PKG-VERIFY ?AUTO_3384 ?AUTO_3385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3393 - OBJ
      ?AUTO_3394 - LOCATION
    )
    :vars
    (
      ?AUTO_3400 - TRUCK
      ?AUTO_3397 - LOCATION
      ?AUTO_3398 - CITY
      ?AUTO_3396 - LOCATION
      ?AUTO_3395 - LOCATION
      ?AUTO_3399 - AIRPLANE
      ?AUTO_3401 - TRUCK
      ?AUTO_3402 - LOCATION
      ?AUTO_3403 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3400 ?AUTO_3397 ) ( IN-CITY ?AUTO_3397 ?AUTO_3398 ) ( IN-CITY ?AUTO_3394 ?AUTO_3398 ) ( not ( = ?AUTO_3394 ?AUTO_3397 ) ) ( AIRPORT ?AUTO_3396 ) ( AIRPORT ?AUTO_3397 ) ( not ( = ?AUTO_3396 ?AUTO_3397 ) ) ( not ( = ?AUTO_3394 ?AUTO_3396 ) ) ( AIRPORT ?AUTO_3395 ) ( not ( = ?AUTO_3395 ?AUTO_3396 ) ) ( not ( = ?AUTO_3394 ?AUTO_3395 ) ) ( not ( = ?AUTO_3397 ?AUTO_3395 ) ) ( AIRPLANE-AT ?AUTO_3399 ?AUTO_3397 ) ( IN-TRUCK ?AUTO_3393 ?AUTO_3401 ) ( not ( = ?AUTO_3400 ?AUTO_3401 ) ) ( TRUCK-AT ?AUTO_3401 ?AUTO_3402 ) ( IN-CITY ?AUTO_3402 ?AUTO_3403 ) ( IN-CITY ?AUTO_3396 ?AUTO_3403 ) ( not ( = ?AUTO_3396 ?AUTO_3402 ) ) ( not ( = ?AUTO_3394 ?AUTO_3402 ) ) ( not ( = ?AUTO_3397 ?AUTO_3402 ) ) ( not ( = ?AUTO_3398 ?AUTO_3403 ) ) ( not ( = ?AUTO_3395 ?AUTO_3402 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3401 ?AUTO_3402 ?AUTO_3396 ?AUTO_3403 )
      ( DELIVER-PKG ?AUTO_3393 ?AUTO_3394 )
      ( DELIVER-PKG-VERIFY ?AUTO_3393 ?AUTO_3394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3412 - OBJ
      ?AUTO_3413 - LOCATION
    )
    :vars
    (
      ?AUTO_3422 - TRUCK
      ?AUTO_3418 - LOCATION
      ?AUTO_3417 - CITY
      ?AUTO_3415 - LOCATION
      ?AUTO_3416 - LOCATION
      ?AUTO_3419 - AIRPLANE
      ?AUTO_3420 - TRUCK
      ?AUTO_3414 - LOCATION
      ?AUTO_3421 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3422 ?AUTO_3418 ) ( IN-CITY ?AUTO_3418 ?AUTO_3417 ) ( IN-CITY ?AUTO_3413 ?AUTO_3417 ) ( not ( = ?AUTO_3413 ?AUTO_3418 ) ) ( AIRPORT ?AUTO_3415 ) ( AIRPORT ?AUTO_3418 ) ( not ( = ?AUTO_3415 ?AUTO_3418 ) ) ( not ( = ?AUTO_3413 ?AUTO_3415 ) ) ( AIRPORT ?AUTO_3416 ) ( not ( = ?AUTO_3416 ?AUTO_3415 ) ) ( not ( = ?AUTO_3413 ?AUTO_3416 ) ) ( not ( = ?AUTO_3418 ?AUTO_3416 ) ) ( AIRPLANE-AT ?AUTO_3419 ?AUTO_3418 ) ( not ( = ?AUTO_3422 ?AUTO_3420 ) ) ( TRUCK-AT ?AUTO_3420 ?AUTO_3414 ) ( IN-CITY ?AUTO_3414 ?AUTO_3421 ) ( IN-CITY ?AUTO_3415 ?AUTO_3421 ) ( not ( = ?AUTO_3415 ?AUTO_3414 ) ) ( not ( = ?AUTO_3413 ?AUTO_3414 ) ) ( not ( = ?AUTO_3418 ?AUTO_3414 ) ) ( not ( = ?AUTO_3417 ?AUTO_3421 ) ) ( not ( = ?AUTO_3416 ?AUTO_3414 ) ) ( OBJ-AT ?AUTO_3412 ?AUTO_3414 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3412 ?AUTO_3420 ?AUTO_3414 )
      ( DELIVER-PKG ?AUTO_3412 ?AUTO_3413 )
      ( DELIVER-PKG-VERIFY ?AUTO_3412 ?AUTO_3413 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3425 - OBJ
      ?AUTO_3426 - LOCATION
    )
    :vars
    (
      ?AUTO_3427 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3427 ?AUTO_3426 ) ( IN-TRUCK ?AUTO_3425 ?AUTO_3427 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3425 ?AUTO_3427 ?AUTO_3426 )
      ( DELIVER-PKG-VERIFY ?AUTO_3425 ?AUTO_3426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3430 - OBJ
      ?AUTO_3431 - LOCATION
    )
    :vars
    (
      ?AUTO_3432 - TRUCK
      ?AUTO_3433 - LOCATION
      ?AUTO_3434 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3430 ?AUTO_3432 ) ( TRUCK-AT ?AUTO_3432 ?AUTO_3433 ) ( IN-CITY ?AUTO_3433 ?AUTO_3434 ) ( IN-CITY ?AUTO_3431 ?AUTO_3434 ) ( not ( = ?AUTO_3431 ?AUTO_3433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3432 ?AUTO_3433 ?AUTO_3431 ?AUTO_3434 )
      ( DELIVER-PKG ?AUTO_3430 ?AUTO_3431 )
      ( DELIVER-PKG-VERIFY ?AUTO_3430 ?AUTO_3431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3435 - OBJ
      ?AUTO_3436 - LOCATION
    )
    :vars
    (
      ?AUTO_3437 - TRUCK
      ?AUTO_3438 - LOCATION
      ?AUTO_3439 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3437 ?AUTO_3438 ) ( IN-CITY ?AUTO_3438 ?AUTO_3439 ) ( IN-CITY ?AUTO_3436 ?AUTO_3439 ) ( not ( = ?AUTO_3436 ?AUTO_3438 ) ) ( OBJ-AT ?AUTO_3435 ?AUTO_3438 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3435 ?AUTO_3437 ?AUTO_3438 )
      ( DELIVER-PKG ?AUTO_3435 ?AUTO_3436 )
      ( DELIVER-PKG-VERIFY ?AUTO_3435 ?AUTO_3436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3460 - OBJ
      ?AUTO_3461 - LOCATION
    )
    :vars
    (
      ?AUTO_3465 - LOCATION
      ?AUTO_3464 - CITY
      ?AUTO_3466 - LOCATION
      ?AUTO_3463 - LOCATION
      ?AUTO_3462 - AIRPLANE
      ?AUTO_3467 - TRUCK
      ?AUTO_3468 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3465 ?AUTO_3464 ) ( IN-CITY ?AUTO_3461 ?AUTO_3464 ) ( not ( = ?AUTO_3461 ?AUTO_3465 ) ) ( AIRPORT ?AUTO_3466 ) ( AIRPORT ?AUTO_3465 ) ( not ( = ?AUTO_3466 ?AUTO_3465 ) ) ( not ( = ?AUTO_3461 ?AUTO_3466 ) ) ( OBJ-AT ?AUTO_3460 ?AUTO_3466 ) ( AIRPORT ?AUTO_3463 ) ( AIRPLANE-AT ?AUTO_3462 ?AUTO_3463 ) ( not ( = ?AUTO_3463 ?AUTO_3466 ) ) ( not ( = ?AUTO_3461 ?AUTO_3463 ) ) ( not ( = ?AUTO_3465 ?AUTO_3463 ) ) ( TRUCK-AT ?AUTO_3467 ?AUTO_3468 ) ( IN-CITY ?AUTO_3468 ?AUTO_3464 ) ( not ( = ?AUTO_3465 ?AUTO_3468 ) ) ( not ( = ?AUTO_3461 ?AUTO_3468 ) ) ( not ( = ?AUTO_3466 ?AUTO_3468 ) ) ( not ( = ?AUTO_3463 ?AUTO_3468 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3467 ?AUTO_3468 ?AUTO_3465 ?AUTO_3464 )
      ( DELIVER-PKG ?AUTO_3460 ?AUTO_3461 )
      ( DELIVER-PKG-VERIFY ?AUTO_3460 ?AUTO_3461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3471 - OBJ
      ?AUTO_3472 - LOCATION
    )
    :vars
    (
      ?AUTO_3473 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3473 ?AUTO_3472 ) ( IN-TRUCK ?AUTO_3471 ?AUTO_3473 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3471 ?AUTO_3473 ?AUTO_3472 )
      ( DELIVER-PKG-VERIFY ?AUTO_3471 ?AUTO_3472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3474 - OBJ
      ?AUTO_3475 - LOCATION
    )
    :vars
    (
      ?AUTO_3476 - TRUCK
      ?AUTO_3477 - LOCATION
      ?AUTO_3478 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3474 ?AUTO_3476 ) ( TRUCK-AT ?AUTO_3476 ?AUTO_3477 ) ( IN-CITY ?AUTO_3477 ?AUTO_3478 ) ( IN-CITY ?AUTO_3475 ?AUTO_3478 ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3476 ?AUTO_3477 ?AUTO_3475 ?AUTO_3478 )
      ( DELIVER-PKG ?AUTO_3474 ?AUTO_3475 )
      ( DELIVER-PKG-VERIFY ?AUTO_3474 ?AUTO_3475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3479 - OBJ
      ?AUTO_3480 - LOCATION
    )
    :vars
    (
      ?AUTO_3481 - TRUCK
      ?AUTO_3482 - LOCATION
      ?AUTO_3483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3481 ?AUTO_3482 ) ( IN-CITY ?AUTO_3482 ?AUTO_3483 ) ( IN-CITY ?AUTO_3480 ?AUTO_3483 ) ( not ( = ?AUTO_3480 ?AUTO_3482 ) ) ( OBJ-AT ?AUTO_3479 ?AUTO_3482 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3479 ?AUTO_3481 ?AUTO_3482 )
      ( DELIVER-PKG ?AUTO_3479 ?AUTO_3480 )
      ( DELIVER-PKG-VERIFY ?AUTO_3479 ?AUTO_3480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3488 - OBJ
      ?AUTO_3489 - LOCATION
    )
    :vars
    (
      ?AUTO_3490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3490 ?AUTO_3489 ) ( IN-TRUCK ?AUTO_3488 ?AUTO_3490 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3488 ?AUTO_3490 ?AUTO_3489 )
      ( DELIVER-PKG-VERIFY ?AUTO_3488 ?AUTO_3489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3491 - OBJ
      ?AUTO_3492 - LOCATION
    )
    :vars
    (
      ?AUTO_3493 - TRUCK
      ?AUTO_3494 - LOCATION
      ?AUTO_3495 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3491 ?AUTO_3493 ) ( TRUCK-AT ?AUTO_3493 ?AUTO_3494 ) ( IN-CITY ?AUTO_3494 ?AUTO_3495 ) ( IN-CITY ?AUTO_3492 ?AUTO_3495 ) ( not ( = ?AUTO_3492 ?AUTO_3494 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3493 ?AUTO_3494 ?AUTO_3492 ?AUTO_3495 )
      ( DELIVER-PKG ?AUTO_3491 ?AUTO_3492 )
      ( DELIVER-PKG-VERIFY ?AUTO_3491 ?AUTO_3492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3496 - OBJ
      ?AUTO_3497 - LOCATION
    )
    :vars
    (
      ?AUTO_3498 - TRUCK
      ?AUTO_3499 - LOCATION
      ?AUTO_3500 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3498 ?AUTO_3499 ) ( IN-CITY ?AUTO_3499 ?AUTO_3500 ) ( IN-CITY ?AUTO_3497 ?AUTO_3500 ) ( not ( = ?AUTO_3497 ?AUTO_3499 ) ) ( OBJ-AT ?AUTO_3496 ?AUTO_3499 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3496 ?AUTO_3498 ?AUTO_3499 )
      ( DELIVER-PKG ?AUTO_3496 ?AUTO_3497 )
      ( DELIVER-PKG-VERIFY ?AUTO_3496 ?AUTO_3497 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3501 - OBJ
      ?AUTO_3502 - LOCATION
    )
    :vars
    (
      ?AUTO_3503 - LOCATION
      ?AUTO_3505 - CITY
      ?AUTO_3504 - TRUCK
      ?AUTO_3506 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3503 ?AUTO_3505 ) ( IN-CITY ?AUTO_3502 ?AUTO_3505 ) ( not ( = ?AUTO_3502 ?AUTO_3503 ) ) ( OBJ-AT ?AUTO_3501 ?AUTO_3503 ) ( TRUCK-AT ?AUTO_3504 ?AUTO_3506 ) ( IN-CITY ?AUTO_3506 ?AUTO_3505 ) ( not ( = ?AUTO_3503 ?AUTO_3506 ) ) ( not ( = ?AUTO_3502 ?AUTO_3506 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3504 ?AUTO_3506 ?AUTO_3503 ?AUTO_3505 )
      ( DELIVER-PKG ?AUTO_3501 ?AUTO_3502 )
      ( DELIVER-PKG-VERIFY ?AUTO_3501 ?AUTO_3502 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3523 - OBJ
      ?AUTO_3524 - LOCATION
    )
    :vars
    (
      ?AUTO_3525 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3525 ?AUTO_3524 ) ( IN-TRUCK ?AUTO_3523 ?AUTO_3525 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3523 ?AUTO_3525 ?AUTO_3524 )
      ( DELIVER-PKG-VERIFY ?AUTO_3523 ?AUTO_3524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3550 - OBJ
      ?AUTO_3551 - LOCATION
    )
    :vars
    (
      ?AUTO_3552 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3552 ?AUTO_3551 ) ( IN-TRUCK ?AUTO_3550 ?AUTO_3552 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3550 ?AUTO_3552 ?AUTO_3551 )
      ( DELIVER-PKG-VERIFY ?AUTO_3550 ?AUTO_3551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3555 - OBJ
      ?AUTO_3556 - LOCATION
    )
    :vars
    (
      ?AUTO_3557 - TRUCK
      ?AUTO_3558 - LOCATION
      ?AUTO_3559 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3555 ?AUTO_3557 ) ( TRUCK-AT ?AUTO_3557 ?AUTO_3558 ) ( IN-CITY ?AUTO_3558 ?AUTO_3559 ) ( IN-CITY ?AUTO_3556 ?AUTO_3559 ) ( not ( = ?AUTO_3556 ?AUTO_3558 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3557 ?AUTO_3558 ?AUTO_3556 ?AUTO_3559 )
      ( DELIVER-PKG ?AUTO_3555 ?AUTO_3556 )
      ( DELIVER-PKG-VERIFY ?AUTO_3555 ?AUTO_3556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3586 - OBJ
      ?AUTO_3587 - LOCATION
    )
    :vars
    (
      ?AUTO_3588 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3586 ?AUTO_3588 ) ( AIRPLANE-AT ?AUTO_3588 ?AUTO_3587 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3586 ?AUTO_3588 ?AUTO_3587 )
      ( DELIVER-PKG-VERIFY ?AUTO_3586 ?AUTO_3587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3589 - OBJ
      ?AUTO_3590 - LOCATION
    )
    :vars
    (
      ?AUTO_3591 - AIRPLANE
      ?AUTO_3592 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3589 ?AUTO_3591 ) ( AIRPORT ?AUTO_3592 ) ( AIRPORT ?AUTO_3590 ) ( AIRPLANE-AT ?AUTO_3591 ?AUTO_3592 ) ( not ( = ?AUTO_3592 ?AUTO_3590 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3591 ?AUTO_3592 ?AUTO_3590 )
      ( DELIVER-PKG ?AUTO_3589 ?AUTO_3590 )
      ( DELIVER-PKG-VERIFY ?AUTO_3589 ?AUTO_3590 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3595 - OBJ
      ?AUTO_3596 - LOCATION
    )
    :vars
    (
      ?AUTO_3598 - LOCATION
      ?AUTO_3597 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3598 ) ( AIRPORT ?AUTO_3596 ) ( AIRPLANE-AT ?AUTO_3597 ?AUTO_3598 ) ( not ( = ?AUTO_3598 ?AUTO_3596 ) ) ( OBJ-AT ?AUTO_3595 ?AUTO_3598 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3595 ?AUTO_3597 ?AUTO_3598 )
      ( DELIVER-PKG ?AUTO_3595 ?AUTO_3596 )
      ( DELIVER-PKG-VERIFY ?AUTO_3595 ?AUTO_3596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3599 - OBJ
      ?AUTO_3600 - LOCATION
    )
    :vars
    (
      ?AUTO_3602 - LOCATION
      ?AUTO_3601 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3602 ) ( AIRPORT ?AUTO_3600 ) ( not ( = ?AUTO_3602 ?AUTO_3600 ) ) ( OBJ-AT ?AUTO_3599 ?AUTO_3602 ) ( AIRPLANE-AT ?AUTO_3601 ?AUTO_3600 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3601 ?AUTO_3600 ?AUTO_3602 )
      ( DELIVER-PKG ?AUTO_3599 ?AUTO_3600 )
      ( DELIVER-PKG-VERIFY ?AUTO_3599 ?AUTO_3600 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3611 - OBJ
      ?AUTO_3612 - LOCATION
    )
    :vars
    (
      ?AUTO_3613 - LOCATION
      ?AUTO_3614 - AIRPLANE
      ?AUTO_3615 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3613 ) ( AIRPORT ?AUTO_3612 ) ( not ( = ?AUTO_3613 ?AUTO_3612 ) ) ( AIRPLANE-AT ?AUTO_3614 ?AUTO_3612 ) ( TRUCK-AT ?AUTO_3615 ?AUTO_3613 ) ( IN-TRUCK ?AUTO_3611 ?AUTO_3615 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3611 ?AUTO_3615 ?AUTO_3613 )
      ( DELIVER-PKG ?AUTO_3611 ?AUTO_3612 )
      ( DELIVER-PKG-VERIFY ?AUTO_3611 ?AUTO_3612 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3616 - OBJ
      ?AUTO_3617 - LOCATION
    )
    :vars
    (
      ?AUTO_3619 - LOCATION
      ?AUTO_3618 - AIRPLANE
      ?AUTO_3620 - TRUCK
      ?AUTO_3621 - LOCATION
      ?AUTO_3622 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3619 ) ( AIRPORT ?AUTO_3617 ) ( not ( = ?AUTO_3619 ?AUTO_3617 ) ) ( AIRPLANE-AT ?AUTO_3618 ?AUTO_3617 ) ( IN-TRUCK ?AUTO_3616 ?AUTO_3620 ) ( TRUCK-AT ?AUTO_3620 ?AUTO_3621 ) ( IN-CITY ?AUTO_3621 ?AUTO_3622 ) ( IN-CITY ?AUTO_3619 ?AUTO_3622 ) ( not ( = ?AUTO_3619 ?AUTO_3621 ) ) ( not ( = ?AUTO_3617 ?AUTO_3621 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3620 ?AUTO_3621 ?AUTO_3619 ?AUTO_3622 )
      ( DELIVER-PKG ?AUTO_3616 ?AUTO_3617 )
      ( DELIVER-PKG-VERIFY ?AUTO_3616 ?AUTO_3617 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3623 - OBJ
      ?AUTO_3624 - LOCATION
    )
    :vars
    (
      ?AUTO_3625 - LOCATION
      ?AUTO_3626 - AIRPLANE
      ?AUTO_3627 - TRUCK
      ?AUTO_3629 - LOCATION
      ?AUTO_3628 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3625 ) ( AIRPORT ?AUTO_3624 ) ( not ( = ?AUTO_3625 ?AUTO_3624 ) ) ( AIRPLANE-AT ?AUTO_3626 ?AUTO_3624 ) ( TRUCK-AT ?AUTO_3627 ?AUTO_3629 ) ( IN-CITY ?AUTO_3629 ?AUTO_3628 ) ( IN-CITY ?AUTO_3625 ?AUTO_3628 ) ( not ( = ?AUTO_3625 ?AUTO_3629 ) ) ( not ( = ?AUTO_3624 ?AUTO_3629 ) ) ( OBJ-AT ?AUTO_3623 ?AUTO_3629 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3623 ?AUTO_3627 ?AUTO_3629 )
      ( DELIVER-PKG ?AUTO_3623 ?AUTO_3624 )
      ( DELIVER-PKG-VERIFY ?AUTO_3623 ?AUTO_3624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3630 - OBJ
      ?AUTO_3631 - LOCATION
    )
    :vars
    (
      ?AUTO_3633 - LOCATION
      ?AUTO_3634 - AIRPLANE
      ?AUTO_3632 - LOCATION
      ?AUTO_3635 - CITY
      ?AUTO_3636 - TRUCK
      ?AUTO_3637 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3633 ) ( AIRPORT ?AUTO_3631 ) ( not ( = ?AUTO_3633 ?AUTO_3631 ) ) ( AIRPLANE-AT ?AUTO_3634 ?AUTO_3631 ) ( IN-CITY ?AUTO_3632 ?AUTO_3635 ) ( IN-CITY ?AUTO_3633 ?AUTO_3635 ) ( not ( = ?AUTO_3633 ?AUTO_3632 ) ) ( not ( = ?AUTO_3631 ?AUTO_3632 ) ) ( OBJ-AT ?AUTO_3630 ?AUTO_3632 ) ( TRUCK-AT ?AUTO_3636 ?AUTO_3637 ) ( IN-CITY ?AUTO_3637 ?AUTO_3635 ) ( not ( = ?AUTO_3632 ?AUTO_3637 ) ) ( not ( = ?AUTO_3631 ?AUTO_3637 ) ) ( not ( = ?AUTO_3633 ?AUTO_3637 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3636 ?AUTO_3637 ?AUTO_3632 ?AUTO_3635 )
      ( DELIVER-PKG ?AUTO_3630 ?AUTO_3631 )
      ( DELIVER-PKG-VERIFY ?AUTO_3630 ?AUTO_3631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3654 - OBJ
      ?AUTO_3655 - LOCATION
    )
    :vars
    (
      ?AUTO_3656 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3654 ?AUTO_3656 ) ( AIRPLANE-AT ?AUTO_3656 ?AUTO_3655 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3654 ?AUTO_3656 ?AUTO_3655 )
      ( DELIVER-PKG-VERIFY ?AUTO_3654 ?AUTO_3655 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3661 - OBJ
      ?AUTO_3662 - LOCATION
    )
    :vars
    (
      ?AUTO_3663 - LOCATION
      ?AUTO_3664 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3663 ) ( AIRPORT ?AUTO_3662 ) ( AIRPLANE-AT ?AUTO_3664 ?AUTO_3663 ) ( not ( = ?AUTO_3663 ?AUTO_3662 ) ) ( OBJ-AT ?AUTO_3661 ?AUTO_3663 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3661 ?AUTO_3664 ?AUTO_3663 )
      ( DELIVER-PKG ?AUTO_3661 ?AUTO_3662 )
      ( DELIVER-PKG-VERIFY ?AUTO_3661 ?AUTO_3662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3675 - OBJ
      ?AUTO_3676 - LOCATION
    )
    :vars
    (
      ?AUTO_3678 - LOCATION
      ?AUTO_3677 - AIRPLANE
      ?AUTO_3679 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3678 ) ( AIRPORT ?AUTO_3676 ) ( not ( = ?AUTO_3678 ?AUTO_3676 ) ) ( AIRPLANE-AT ?AUTO_3677 ?AUTO_3676 ) ( TRUCK-AT ?AUTO_3679 ?AUTO_3678 ) ( IN-TRUCK ?AUTO_3675 ?AUTO_3679 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3675 ?AUTO_3679 ?AUTO_3678 )
      ( DELIVER-PKG ?AUTO_3675 ?AUTO_3676 )
      ( DELIVER-PKG-VERIFY ?AUTO_3675 ?AUTO_3676 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3704 - OBJ
      ?AUTO_3705 - LOCATION
    )
    :vars
    (
      ?AUTO_3706 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3704 ?AUTO_3706 ) ( AIRPLANE-AT ?AUTO_3706 ?AUTO_3705 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3704 ?AUTO_3706 ?AUTO_3705 )
      ( DELIVER-PKG-VERIFY ?AUTO_3704 ?AUTO_3705 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3707 - OBJ
      ?AUTO_3708 - LOCATION
    )
    :vars
    (
      ?AUTO_3709 - AIRPLANE
      ?AUTO_3710 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3707 ?AUTO_3709 ) ( AIRPORT ?AUTO_3710 ) ( AIRPORT ?AUTO_3708 ) ( AIRPLANE-AT ?AUTO_3709 ?AUTO_3710 ) ( not ( = ?AUTO_3710 ?AUTO_3708 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3709 ?AUTO_3710 ?AUTO_3708 )
      ( DELIVER-PKG ?AUTO_3707 ?AUTO_3708 )
      ( DELIVER-PKG-VERIFY ?AUTO_3707 ?AUTO_3708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3755 - OBJ
      ?AUTO_3756 - LOCATION
    )
    :vars
    (
      ?AUTO_3757 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3755 ?AUTO_3757 ) ( AIRPLANE-AT ?AUTO_3757 ?AUTO_3756 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3755 ?AUTO_3757 ?AUTO_3756 )
      ( DELIVER-PKG-VERIFY ?AUTO_3755 ?AUTO_3756 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3796 - OBJ
      ?AUTO_3797 - LOCATION
    )
    :vars
    (
      ?AUTO_3799 - LOCATION
      ?AUTO_3798 - AIRPLANE
      ?AUTO_3800 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3799 ) ( AIRPORT ?AUTO_3797 ) ( AIRPLANE-AT ?AUTO_3798 ?AUTO_3799 ) ( not ( = ?AUTO_3799 ?AUTO_3797 ) ) ( TRUCK-AT ?AUTO_3800 ?AUTO_3799 ) ( IN-TRUCK ?AUTO_3796 ?AUTO_3800 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3796 ?AUTO_3800 ?AUTO_3799 )
      ( DELIVER-PKG ?AUTO_3796 ?AUTO_3797 )
      ( DELIVER-PKG-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3801 - OBJ
      ?AUTO_3802 - LOCATION
    )
    :vars
    (
      ?AUTO_3804 - LOCATION
      ?AUTO_3803 - AIRPLANE
      ?AUTO_3805 - TRUCK
      ?AUTO_3806 - LOCATION
      ?AUTO_3807 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3804 ) ( AIRPORT ?AUTO_3802 ) ( AIRPLANE-AT ?AUTO_3803 ?AUTO_3804 ) ( not ( = ?AUTO_3804 ?AUTO_3802 ) ) ( IN-TRUCK ?AUTO_3801 ?AUTO_3805 ) ( TRUCK-AT ?AUTO_3805 ?AUTO_3806 ) ( IN-CITY ?AUTO_3806 ?AUTO_3807 ) ( IN-CITY ?AUTO_3804 ?AUTO_3807 ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) ( not ( = ?AUTO_3802 ?AUTO_3806 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3805 ?AUTO_3806 ?AUTO_3804 ?AUTO_3807 )
      ( DELIVER-PKG ?AUTO_3801 ?AUTO_3802 )
      ( DELIVER-PKG-VERIFY ?AUTO_3801 ?AUTO_3802 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3808 - OBJ
      ?AUTO_3809 - LOCATION
    )
    :vars
    (
      ?AUTO_3810 - LOCATION
      ?AUTO_3812 - AIRPLANE
      ?AUTO_3811 - TRUCK
      ?AUTO_3814 - LOCATION
      ?AUTO_3813 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3810 ) ( AIRPORT ?AUTO_3809 ) ( AIRPLANE-AT ?AUTO_3812 ?AUTO_3810 ) ( not ( = ?AUTO_3810 ?AUTO_3809 ) ) ( TRUCK-AT ?AUTO_3811 ?AUTO_3814 ) ( IN-CITY ?AUTO_3814 ?AUTO_3813 ) ( IN-CITY ?AUTO_3810 ?AUTO_3813 ) ( not ( = ?AUTO_3810 ?AUTO_3814 ) ) ( not ( = ?AUTO_3809 ?AUTO_3814 ) ) ( OBJ-AT ?AUTO_3808 ?AUTO_3814 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3808 ?AUTO_3811 ?AUTO_3814 )
      ( DELIVER-PKG ?AUTO_3808 ?AUTO_3809 )
      ( DELIVER-PKG-VERIFY ?AUTO_3808 ?AUTO_3809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3819 - OBJ
      ?AUTO_3820 - LOCATION
    )
    :vars
    (
      ?AUTO_3821 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3821 ?AUTO_3820 ) ( IN-TRUCK ?AUTO_3819 ?AUTO_3821 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3819 ?AUTO_3821 ?AUTO_3820 )
      ( DELIVER-PKG-VERIFY ?AUTO_3819 ?AUTO_3820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3826 - OBJ
      ?AUTO_3827 - LOCATION
    )
    :vars
    (
      ?AUTO_3828 - TRUCK
      ?AUTO_3829 - LOCATION
      ?AUTO_3830 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3826 ?AUTO_3828 ) ( TRUCK-AT ?AUTO_3828 ?AUTO_3829 ) ( IN-CITY ?AUTO_3829 ?AUTO_3830 ) ( IN-CITY ?AUTO_3827 ?AUTO_3830 ) ( not ( = ?AUTO_3827 ?AUTO_3829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3828 ?AUTO_3829 ?AUTO_3827 ?AUTO_3830 )
      ( DELIVER-PKG ?AUTO_3826 ?AUTO_3827 )
      ( DELIVER-PKG-VERIFY ?AUTO_3826 ?AUTO_3827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3831 - OBJ
      ?AUTO_3832 - LOCATION
    )
    :vars
    (
      ?AUTO_3833 - TRUCK
      ?AUTO_3834 - LOCATION
      ?AUTO_3835 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3833 ?AUTO_3834 ) ( IN-CITY ?AUTO_3834 ?AUTO_3835 ) ( IN-CITY ?AUTO_3832 ?AUTO_3835 ) ( not ( = ?AUTO_3832 ?AUTO_3834 ) ) ( OBJ-AT ?AUTO_3831 ?AUTO_3834 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3831 ?AUTO_3833 ?AUTO_3834 )
      ( DELIVER-PKG ?AUTO_3831 ?AUTO_3832 )
      ( DELIVER-PKG-VERIFY ?AUTO_3831 ?AUTO_3832 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3844 - OBJ
      ?AUTO_3845 - LOCATION
    )
    :vars
    (
      ?AUTO_3846 - TRUCK
      ?AUTO_3847 - LOCATION
      ?AUTO_3848 - CITY
      ?AUTO_3849 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3846 ?AUTO_3847 ) ( IN-CITY ?AUTO_3847 ?AUTO_3848 ) ( IN-CITY ?AUTO_3845 ?AUTO_3848 ) ( not ( = ?AUTO_3845 ?AUTO_3847 ) ) ( IN-AIRPLANE ?AUTO_3844 ?AUTO_3849 ) ( AIRPLANE-AT ?AUTO_3849 ?AUTO_3847 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3844 ?AUTO_3849 ?AUTO_3847 )
      ( DELIVER-PKG ?AUTO_3844 ?AUTO_3845 )
      ( DELIVER-PKG-VERIFY ?AUTO_3844 ?AUTO_3845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3850 - OBJ
      ?AUTO_3851 - LOCATION
    )
    :vars
    (
      ?AUTO_3854 - TRUCK
      ?AUTO_3852 - LOCATION
      ?AUTO_3853 - CITY
      ?AUTO_3855 - AIRPLANE
      ?AUTO_3856 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3854 ?AUTO_3852 ) ( IN-CITY ?AUTO_3852 ?AUTO_3853 ) ( IN-CITY ?AUTO_3851 ?AUTO_3853 ) ( not ( = ?AUTO_3851 ?AUTO_3852 ) ) ( IN-AIRPLANE ?AUTO_3850 ?AUTO_3855 ) ( AIRPORT ?AUTO_3856 ) ( AIRPORT ?AUTO_3852 ) ( AIRPLANE-AT ?AUTO_3855 ?AUTO_3856 ) ( not ( = ?AUTO_3856 ?AUTO_3852 ) ) ( not ( = ?AUTO_3851 ?AUTO_3856 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3855 ?AUTO_3856 ?AUTO_3852 )
      ( DELIVER-PKG ?AUTO_3850 ?AUTO_3851 )
      ( DELIVER-PKG-VERIFY ?AUTO_3850 ?AUTO_3851 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3859 - OBJ
      ?AUTO_3860 - LOCATION
    )
    :vars
    (
      ?AUTO_3862 - TRUCK
      ?AUTO_3865 - LOCATION
      ?AUTO_3863 - CITY
      ?AUTO_3864 - LOCATION
      ?AUTO_3861 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3862 ?AUTO_3865 ) ( IN-CITY ?AUTO_3865 ?AUTO_3863 ) ( IN-CITY ?AUTO_3860 ?AUTO_3863 ) ( not ( = ?AUTO_3860 ?AUTO_3865 ) ) ( AIRPORT ?AUTO_3864 ) ( AIRPORT ?AUTO_3865 ) ( AIRPLANE-AT ?AUTO_3861 ?AUTO_3864 ) ( not ( = ?AUTO_3864 ?AUTO_3865 ) ) ( not ( = ?AUTO_3860 ?AUTO_3864 ) ) ( OBJ-AT ?AUTO_3859 ?AUTO_3864 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3859 ?AUTO_3861 ?AUTO_3864 )
      ( DELIVER-PKG ?AUTO_3859 ?AUTO_3860 )
      ( DELIVER-PKG-VERIFY ?AUTO_3859 ?AUTO_3860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3866 - OBJ
      ?AUTO_3867 - LOCATION
    )
    :vars
    (
      ?AUTO_3869 - TRUCK
      ?AUTO_3868 - LOCATION
      ?AUTO_3872 - CITY
      ?AUTO_3871 - LOCATION
      ?AUTO_3870 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3869 ?AUTO_3868 ) ( IN-CITY ?AUTO_3868 ?AUTO_3872 ) ( IN-CITY ?AUTO_3867 ?AUTO_3872 ) ( not ( = ?AUTO_3867 ?AUTO_3868 ) ) ( AIRPORT ?AUTO_3871 ) ( AIRPORT ?AUTO_3868 ) ( not ( = ?AUTO_3871 ?AUTO_3868 ) ) ( not ( = ?AUTO_3867 ?AUTO_3871 ) ) ( OBJ-AT ?AUTO_3866 ?AUTO_3871 ) ( AIRPLANE-AT ?AUTO_3870 ?AUTO_3868 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3870 ?AUTO_3868 ?AUTO_3871 )
      ( DELIVER-PKG ?AUTO_3866 ?AUTO_3867 )
      ( DELIVER-PKG-VERIFY ?AUTO_3866 ?AUTO_3867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3881 - OBJ
      ?AUTO_3882 - LOCATION
    )
    :vars
    (
      ?AUTO_3884 - TRUCK
      ?AUTO_3885 - LOCATION
      ?AUTO_3887 - CITY
      ?AUTO_3886 - LOCATION
      ?AUTO_3883 - AIRPLANE
      ?AUTO_3888 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3884 ?AUTO_3885 ) ( IN-CITY ?AUTO_3885 ?AUTO_3887 ) ( IN-CITY ?AUTO_3882 ?AUTO_3887 ) ( not ( = ?AUTO_3882 ?AUTO_3885 ) ) ( AIRPORT ?AUTO_3886 ) ( AIRPORT ?AUTO_3885 ) ( not ( = ?AUTO_3886 ?AUTO_3885 ) ) ( not ( = ?AUTO_3882 ?AUTO_3886 ) ) ( AIRPLANE-AT ?AUTO_3883 ?AUTO_3885 ) ( TRUCK-AT ?AUTO_3888 ?AUTO_3886 ) ( IN-TRUCK ?AUTO_3881 ?AUTO_3888 ) ( not ( = ?AUTO_3884 ?AUTO_3888 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3881 ?AUTO_3888 ?AUTO_3886 )
      ( DELIVER-PKG ?AUTO_3881 ?AUTO_3882 )
      ( DELIVER-PKG-VERIFY ?AUTO_3881 ?AUTO_3882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3889 - OBJ
      ?AUTO_3890 - LOCATION
    )
    :vars
    (
      ?AUTO_3895 - TRUCK
      ?AUTO_3893 - LOCATION
      ?AUTO_3891 - CITY
      ?AUTO_3892 - LOCATION
      ?AUTO_3894 - AIRPLANE
      ?AUTO_3896 - TRUCK
      ?AUTO_3897 - LOCATION
      ?AUTO_3898 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3895 ?AUTO_3893 ) ( IN-CITY ?AUTO_3893 ?AUTO_3891 ) ( IN-CITY ?AUTO_3890 ?AUTO_3891 ) ( not ( = ?AUTO_3890 ?AUTO_3893 ) ) ( AIRPORT ?AUTO_3892 ) ( AIRPORT ?AUTO_3893 ) ( not ( = ?AUTO_3892 ?AUTO_3893 ) ) ( not ( = ?AUTO_3890 ?AUTO_3892 ) ) ( AIRPLANE-AT ?AUTO_3894 ?AUTO_3893 ) ( IN-TRUCK ?AUTO_3889 ?AUTO_3896 ) ( not ( = ?AUTO_3895 ?AUTO_3896 ) ) ( TRUCK-AT ?AUTO_3896 ?AUTO_3897 ) ( IN-CITY ?AUTO_3897 ?AUTO_3898 ) ( IN-CITY ?AUTO_3892 ?AUTO_3898 ) ( not ( = ?AUTO_3892 ?AUTO_3897 ) ) ( not ( = ?AUTO_3890 ?AUTO_3897 ) ) ( not ( = ?AUTO_3893 ?AUTO_3897 ) ) ( not ( = ?AUTO_3891 ?AUTO_3898 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3896 ?AUTO_3897 ?AUTO_3892 ?AUTO_3898 )
      ( DELIVER-PKG ?AUTO_3889 ?AUTO_3890 )
      ( DELIVER-PKG-VERIFY ?AUTO_3889 ?AUTO_3890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3899 - OBJ
      ?AUTO_3900 - LOCATION
    )
    :vars
    (
      ?AUTO_3905 - TRUCK
      ?AUTO_3903 - LOCATION
      ?AUTO_3906 - CITY
      ?AUTO_3901 - LOCATION
      ?AUTO_3904 - AIRPLANE
      ?AUTO_3902 - TRUCK
      ?AUTO_3907 - LOCATION
      ?AUTO_3908 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3905 ?AUTO_3903 ) ( IN-CITY ?AUTO_3903 ?AUTO_3906 ) ( IN-CITY ?AUTO_3900 ?AUTO_3906 ) ( not ( = ?AUTO_3900 ?AUTO_3903 ) ) ( AIRPORT ?AUTO_3901 ) ( AIRPORT ?AUTO_3903 ) ( not ( = ?AUTO_3901 ?AUTO_3903 ) ) ( not ( = ?AUTO_3900 ?AUTO_3901 ) ) ( AIRPLANE-AT ?AUTO_3904 ?AUTO_3903 ) ( not ( = ?AUTO_3905 ?AUTO_3902 ) ) ( TRUCK-AT ?AUTO_3902 ?AUTO_3907 ) ( IN-CITY ?AUTO_3907 ?AUTO_3908 ) ( IN-CITY ?AUTO_3901 ?AUTO_3908 ) ( not ( = ?AUTO_3901 ?AUTO_3907 ) ) ( not ( = ?AUTO_3900 ?AUTO_3907 ) ) ( not ( = ?AUTO_3903 ?AUTO_3907 ) ) ( not ( = ?AUTO_3906 ?AUTO_3908 ) ) ( OBJ-AT ?AUTO_3899 ?AUTO_3907 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3899 ?AUTO_3902 ?AUTO_3907 )
      ( DELIVER-PKG ?AUTO_3899 ?AUTO_3900 )
      ( DELIVER-PKG-VERIFY ?AUTO_3899 ?AUTO_3900 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3909 - OBJ
      ?AUTO_3910 - LOCATION
    )
    :vars
    (
      ?AUTO_3915 - TRUCK
      ?AUTO_3916 - LOCATION
      ?AUTO_3917 - CITY
      ?AUTO_3911 - LOCATION
      ?AUTO_3912 - AIRPLANE
      ?AUTO_3918 - TRUCK
      ?AUTO_3914 - LOCATION
      ?AUTO_3913 - CITY
      ?AUTO_3919 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3915 ?AUTO_3916 ) ( IN-CITY ?AUTO_3916 ?AUTO_3917 ) ( IN-CITY ?AUTO_3910 ?AUTO_3917 ) ( not ( = ?AUTO_3910 ?AUTO_3916 ) ) ( AIRPORT ?AUTO_3911 ) ( AIRPORT ?AUTO_3916 ) ( not ( = ?AUTO_3911 ?AUTO_3916 ) ) ( not ( = ?AUTO_3910 ?AUTO_3911 ) ) ( AIRPLANE-AT ?AUTO_3912 ?AUTO_3916 ) ( not ( = ?AUTO_3915 ?AUTO_3918 ) ) ( IN-CITY ?AUTO_3914 ?AUTO_3913 ) ( IN-CITY ?AUTO_3911 ?AUTO_3913 ) ( not ( = ?AUTO_3911 ?AUTO_3914 ) ) ( not ( = ?AUTO_3910 ?AUTO_3914 ) ) ( not ( = ?AUTO_3916 ?AUTO_3914 ) ) ( not ( = ?AUTO_3917 ?AUTO_3913 ) ) ( OBJ-AT ?AUTO_3909 ?AUTO_3914 ) ( TRUCK-AT ?AUTO_3918 ?AUTO_3919 ) ( IN-CITY ?AUTO_3919 ?AUTO_3913 ) ( not ( = ?AUTO_3914 ?AUTO_3919 ) ) ( not ( = ?AUTO_3910 ?AUTO_3919 ) ) ( not ( = ?AUTO_3916 ?AUTO_3919 ) ) ( not ( = ?AUTO_3911 ?AUTO_3919 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3918 ?AUTO_3919 ?AUTO_3914 ?AUTO_3913 )
      ( DELIVER-PKG ?AUTO_3909 ?AUTO_3910 )
      ( DELIVER-PKG-VERIFY ?AUTO_3909 ?AUTO_3910 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3928 - OBJ
      ?AUTO_3929 - LOCATION
    )
    :vars
    (
      ?AUTO_3935 - LOCATION
      ?AUTO_3937 - CITY
      ?AUTO_3930 - LOCATION
      ?AUTO_3934 - AIRPLANE
      ?AUTO_3932 - TRUCK
      ?AUTO_3938 - TRUCK
      ?AUTO_3933 - LOCATION
      ?AUTO_3936 - CITY
      ?AUTO_3931 - LOCATION
      ?AUTO_3939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3935 ?AUTO_3937 ) ( IN-CITY ?AUTO_3929 ?AUTO_3937 ) ( not ( = ?AUTO_3929 ?AUTO_3935 ) ) ( AIRPORT ?AUTO_3930 ) ( AIRPORT ?AUTO_3935 ) ( not ( = ?AUTO_3930 ?AUTO_3935 ) ) ( not ( = ?AUTO_3929 ?AUTO_3930 ) ) ( AIRPLANE-AT ?AUTO_3934 ?AUTO_3935 ) ( not ( = ?AUTO_3932 ?AUTO_3938 ) ) ( IN-CITY ?AUTO_3933 ?AUTO_3936 ) ( IN-CITY ?AUTO_3930 ?AUTO_3936 ) ( not ( = ?AUTO_3930 ?AUTO_3933 ) ) ( not ( = ?AUTO_3929 ?AUTO_3933 ) ) ( not ( = ?AUTO_3935 ?AUTO_3933 ) ) ( not ( = ?AUTO_3937 ?AUTO_3936 ) ) ( OBJ-AT ?AUTO_3928 ?AUTO_3933 ) ( TRUCK-AT ?AUTO_3938 ?AUTO_3931 ) ( IN-CITY ?AUTO_3931 ?AUTO_3936 ) ( not ( = ?AUTO_3933 ?AUTO_3931 ) ) ( not ( = ?AUTO_3929 ?AUTO_3931 ) ) ( not ( = ?AUTO_3935 ?AUTO_3931 ) ) ( not ( = ?AUTO_3930 ?AUTO_3931 ) ) ( TRUCK-AT ?AUTO_3932 ?AUTO_3939 ) ( IN-CITY ?AUTO_3939 ?AUTO_3937 ) ( not ( = ?AUTO_3935 ?AUTO_3939 ) ) ( not ( = ?AUTO_3929 ?AUTO_3939 ) ) ( not ( = ?AUTO_3930 ?AUTO_3939 ) ) ( not ( = ?AUTO_3933 ?AUTO_3939 ) ) ( not ( = ?AUTO_3931 ?AUTO_3939 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3932 ?AUTO_3939 ?AUTO_3935 ?AUTO_3937 )
      ( DELIVER-PKG ?AUTO_3928 ?AUTO_3929 )
      ( DELIVER-PKG-VERIFY ?AUTO_3928 ?AUTO_3929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3946 - OBJ
      ?AUTO_3947 - LOCATION
    )
    :vars
    (
      ?AUTO_3948 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3948 ?AUTO_3947 ) ( IN-TRUCK ?AUTO_3946 ?AUTO_3948 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3946 ?AUTO_3948 ?AUTO_3947 )
      ( DELIVER-PKG-VERIFY ?AUTO_3946 ?AUTO_3947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3951 - OBJ
      ?AUTO_3952 - LOCATION
    )
    :vars
    (
      ?AUTO_3953 - TRUCK
      ?AUTO_3954 - LOCATION
      ?AUTO_3955 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3951 ?AUTO_3953 ) ( TRUCK-AT ?AUTO_3953 ?AUTO_3954 ) ( IN-CITY ?AUTO_3954 ?AUTO_3955 ) ( IN-CITY ?AUTO_3952 ?AUTO_3955 ) ( not ( = ?AUTO_3952 ?AUTO_3954 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3953 ?AUTO_3954 ?AUTO_3952 ?AUTO_3955 )
      ( DELIVER-PKG ?AUTO_3951 ?AUTO_3952 )
      ( DELIVER-PKG-VERIFY ?AUTO_3951 ?AUTO_3952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3956 - OBJ
      ?AUTO_3957 - LOCATION
    )
    :vars
    (
      ?AUTO_3958 - TRUCK
      ?AUTO_3959 - LOCATION
      ?AUTO_3960 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3958 ?AUTO_3959 ) ( IN-CITY ?AUTO_3959 ?AUTO_3960 ) ( IN-CITY ?AUTO_3957 ?AUTO_3960 ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( OBJ-AT ?AUTO_3956 ?AUTO_3959 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3956 ?AUTO_3958 ?AUTO_3959 )
      ( DELIVER-PKG ?AUTO_3956 ?AUTO_3957 )
      ( DELIVER-PKG-VERIFY ?AUTO_3956 ?AUTO_3957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3971 - OBJ
      ?AUTO_3972 - LOCATION
    )
    :vars
    (
      ?AUTO_3975 - TRUCK
      ?AUTO_3973 - LOCATION
      ?AUTO_3974 - CITY
      ?AUTO_3976 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3975 ?AUTO_3973 ) ( IN-CITY ?AUTO_3973 ?AUTO_3974 ) ( IN-CITY ?AUTO_3972 ?AUTO_3974 ) ( not ( = ?AUTO_3972 ?AUTO_3973 ) ) ( IN-AIRPLANE ?AUTO_3971 ?AUTO_3976 ) ( AIRPLANE-AT ?AUTO_3976 ?AUTO_3973 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3971 ?AUTO_3976 ?AUTO_3973 )
      ( DELIVER-PKG ?AUTO_3971 ?AUTO_3972 )
      ( DELIVER-PKG-VERIFY ?AUTO_3971 ?AUTO_3972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3981 - OBJ
      ?AUTO_3982 - LOCATION
    )
    :vars
    (
      ?AUTO_3983 - TRUCK
      ?AUTO_3987 - LOCATION
      ?AUTO_3986 - CITY
      ?AUTO_3985 - LOCATION
      ?AUTO_3984 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3983 ?AUTO_3987 ) ( IN-CITY ?AUTO_3987 ?AUTO_3986 ) ( IN-CITY ?AUTO_3982 ?AUTO_3986 ) ( not ( = ?AUTO_3982 ?AUTO_3987 ) ) ( AIRPORT ?AUTO_3985 ) ( AIRPORT ?AUTO_3987 ) ( AIRPLANE-AT ?AUTO_3984 ?AUTO_3985 ) ( not ( = ?AUTO_3985 ?AUTO_3987 ) ) ( not ( = ?AUTO_3982 ?AUTO_3985 ) ) ( OBJ-AT ?AUTO_3981 ?AUTO_3985 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3981 ?AUTO_3984 ?AUTO_3985 )
      ( DELIVER-PKG ?AUTO_3981 ?AUTO_3982 )
      ( DELIVER-PKG-VERIFY ?AUTO_3981 ?AUTO_3982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3998 - OBJ
      ?AUTO_3999 - LOCATION
    )
    :vars
    (
      ?AUTO_4001 - TRUCK
      ?AUTO_4003 - LOCATION
      ?AUTO_4002 - CITY
      ?AUTO_4004 - LOCATION
      ?AUTO_4000 - AIRPLANE
      ?AUTO_4005 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4001 ?AUTO_4003 ) ( IN-CITY ?AUTO_4003 ?AUTO_4002 ) ( IN-CITY ?AUTO_3999 ?AUTO_4002 ) ( not ( = ?AUTO_3999 ?AUTO_4003 ) ) ( AIRPORT ?AUTO_4004 ) ( AIRPORT ?AUTO_4003 ) ( not ( = ?AUTO_4004 ?AUTO_4003 ) ) ( not ( = ?AUTO_3999 ?AUTO_4004 ) ) ( AIRPLANE-AT ?AUTO_4000 ?AUTO_4003 ) ( TRUCK-AT ?AUTO_4005 ?AUTO_4004 ) ( IN-TRUCK ?AUTO_3998 ?AUTO_4005 ) ( not ( = ?AUTO_4001 ?AUTO_4005 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3998 ?AUTO_4005 ?AUTO_4004 )
      ( DELIVER-PKG ?AUTO_3998 ?AUTO_3999 )
      ( DELIVER-PKG-VERIFY ?AUTO_3998 ?AUTO_3999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4022 - OBJ
      ?AUTO_4023 - LOCATION
    )
    :vars
    (
      ?AUTO_4031 - LOCATION
      ?AUTO_4028 - CITY
      ?AUTO_4024 - LOCATION
      ?AUTO_4026 - AIRPLANE
      ?AUTO_4029 - TRUCK
      ?AUTO_4027 - TRUCK
      ?AUTO_4030 - LOCATION
      ?AUTO_4025 - CITY
      ?AUTO_4032 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4031 ?AUTO_4028 ) ( IN-CITY ?AUTO_4023 ?AUTO_4028 ) ( not ( = ?AUTO_4023 ?AUTO_4031 ) ) ( AIRPORT ?AUTO_4024 ) ( AIRPORT ?AUTO_4031 ) ( not ( = ?AUTO_4024 ?AUTO_4031 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( AIRPLANE-AT ?AUTO_4026 ?AUTO_4031 ) ( IN-TRUCK ?AUTO_4022 ?AUTO_4029 ) ( not ( = ?AUTO_4027 ?AUTO_4029 ) ) ( TRUCK-AT ?AUTO_4029 ?AUTO_4030 ) ( IN-CITY ?AUTO_4030 ?AUTO_4025 ) ( IN-CITY ?AUTO_4024 ?AUTO_4025 ) ( not ( = ?AUTO_4024 ?AUTO_4030 ) ) ( not ( = ?AUTO_4023 ?AUTO_4030 ) ) ( not ( = ?AUTO_4031 ?AUTO_4030 ) ) ( not ( = ?AUTO_4028 ?AUTO_4025 ) ) ( TRUCK-AT ?AUTO_4027 ?AUTO_4032 ) ( IN-CITY ?AUTO_4032 ?AUTO_4028 ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) ( not ( = ?AUTO_4023 ?AUTO_4032 ) ) ( not ( = ?AUTO_4024 ?AUTO_4032 ) ) ( not ( = ?AUTO_4030 ?AUTO_4032 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4027 ?AUTO_4032 ?AUTO_4031 ?AUTO_4028 )
      ( DELIVER-PKG ?AUTO_4022 ?AUTO_4023 )
      ( DELIVER-PKG-VERIFY ?AUTO_4022 ?AUTO_4023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4035 - OBJ
      ?AUTO_4036 - LOCATION
    )
    :vars
    (
      ?AUTO_4038 - LOCATION
      ?AUTO_4042 - CITY
      ?AUTO_4039 - LOCATION
      ?AUTO_4043 - AIRPLANE
      ?AUTO_4040 - TRUCK
      ?AUTO_4041 - TRUCK
      ?AUTO_4044 - LOCATION
      ?AUTO_4037 - CITY
      ?AUTO_4045 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4038 ?AUTO_4042 ) ( IN-CITY ?AUTO_4036 ?AUTO_4042 ) ( not ( = ?AUTO_4036 ?AUTO_4038 ) ) ( AIRPORT ?AUTO_4039 ) ( AIRPORT ?AUTO_4038 ) ( not ( = ?AUTO_4039 ?AUTO_4038 ) ) ( not ( = ?AUTO_4036 ?AUTO_4039 ) ) ( AIRPLANE-AT ?AUTO_4043 ?AUTO_4038 ) ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( TRUCK-AT ?AUTO_4041 ?AUTO_4044 ) ( IN-CITY ?AUTO_4044 ?AUTO_4037 ) ( IN-CITY ?AUTO_4039 ?AUTO_4037 ) ( not ( = ?AUTO_4039 ?AUTO_4044 ) ) ( not ( = ?AUTO_4036 ?AUTO_4044 ) ) ( not ( = ?AUTO_4038 ?AUTO_4044 ) ) ( not ( = ?AUTO_4042 ?AUTO_4037 ) ) ( TRUCK-AT ?AUTO_4040 ?AUTO_4045 ) ( IN-CITY ?AUTO_4045 ?AUTO_4042 ) ( not ( = ?AUTO_4038 ?AUTO_4045 ) ) ( not ( = ?AUTO_4036 ?AUTO_4045 ) ) ( not ( = ?AUTO_4039 ?AUTO_4045 ) ) ( not ( = ?AUTO_4044 ?AUTO_4045 ) ) ( OBJ-AT ?AUTO_4035 ?AUTO_4044 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4035 ?AUTO_4041 ?AUTO_4044 )
      ( DELIVER-PKG ?AUTO_4035 ?AUTO_4036 )
      ( DELIVER-PKG-VERIFY ?AUTO_4035 ?AUTO_4036 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4048 - OBJ
      ?AUTO_4049 - LOCATION
    )
    :vars
    (
      ?AUTO_4050 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4050 ?AUTO_4049 ) ( IN-TRUCK ?AUTO_4048 ?AUTO_4050 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4048 ?AUTO_4050 ?AUTO_4049 )
      ( DELIVER-PKG-VERIFY ?AUTO_4048 ?AUTO_4049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4051 - OBJ
      ?AUTO_4052 - LOCATION
    )
    :vars
    (
      ?AUTO_4053 - TRUCK
      ?AUTO_4054 - LOCATION
      ?AUTO_4055 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4051 ?AUTO_4053 ) ( TRUCK-AT ?AUTO_4053 ?AUTO_4054 ) ( IN-CITY ?AUTO_4054 ?AUTO_4055 ) ( IN-CITY ?AUTO_4052 ?AUTO_4055 ) ( not ( = ?AUTO_4052 ?AUTO_4054 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4053 ?AUTO_4054 ?AUTO_4052 ?AUTO_4055 )
      ( DELIVER-PKG ?AUTO_4051 ?AUTO_4052 )
      ( DELIVER-PKG-VERIFY ?AUTO_4051 ?AUTO_4052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4056 - OBJ
      ?AUTO_4057 - LOCATION
    )
    :vars
    (
      ?AUTO_4058 - TRUCK
      ?AUTO_4059 - LOCATION
      ?AUTO_4060 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4058 ?AUTO_4059 ) ( IN-CITY ?AUTO_4059 ?AUTO_4060 ) ( IN-CITY ?AUTO_4057 ?AUTO_4060 ) ( not ( = ?AUTO_4057 ?AUTO_4059 ) ) ( OBJ-AT ?AUTO_4056 ?AUTO_4059 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4056 ?AUTO_4058 ?AUTO_4059 )
      ( DELIVER-PKG ?AUTO_4056 ?AUTO_4057 )
      ( DELIVER-PKG-VERIFY ?AUTO_4056 ?AUTO_4057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4061 - OBJ
      ?AUTO_4062 - LOCATION
    )
    :vars
    (
      ?AUTO_4063 - LOCATION
      ?AUTO_4065 - CITY
      ?AUTO_4064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4063 ?AUTO_4065 ) ( IN-CITY ?AUTO_4062 ?AUTO_4065 ) ( not ( = ?AUTO_4062 ?AUTO_4063 ) ) ( OBJ-AT ?AUTO_4061 ?AUTO_4063 ) ( TRUCK-AT ?AUTO_4064 ?AUTO_4062 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4064 ?AUTO_4062 ?AUTO_4063 ?AUTO_4065 )
      ( DELIVER-PKG ?AUTO_4061 ?AUTO_4062 )
      ( DELIVER-PKG-VERIFY ?AUTO_4061 ?AUTO_4062 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4080 - OBJ
      ?AUTO_4081 - LOCATION
    )
    :vars
    (
      ?AUTO_4082 - LOCATION
      ?AUTO_4083 - CITY
      ?AUTO_4084 - TRUCK
      ?AUTO_4085 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4082 ?AUTO_4083 ) ( IN-CITY ?AUTO_4081 ?AUTO_4083 ) ( not ( = ?AUTO_4081 ?AUTO_4082 ) ) ( TRUCK-AT ?AUTO_4084 ?AUTO_4081 ) ( IN-AIRPLANE ?AUTO_4080 ?AUTO_4085 ) ( AIRPLANE-AT ?AUTO_4085 ?AUTO_4082 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4080 ?AUTO_4085 ?AUTO_4082 )
      ( DELIVER-PKG ?AUTO_4080 ?AUTO_4081 )
      ( DELIVER-PKG-VERIFY ?AUTO_4080 ?AUTO_4081 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4086 - OBJ
      ?AUTO_4087 - LOCATION
    )
    :vars
    (
      ?AUTO_4088 - LOCATION
      ?AUTO_4090 - CITY
      ?AUTO_4089 - TRUCK
      ?AUTO_4091 - AIRPLANE
      ?AUTO_4092 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4088 ?AUTO_4090 ) ( IN-CITY ?AUTO_4087 ?AUTO_4090 ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( TRUCK-AT ?AUTO_4089 ?AUTO_4087 ) ( IN-AIRPLANE ?AUTO_4086 ?AUTO_4091 ) ( AIRPORT ?AUTO_4092 ) ( AIRPORT ?AUTO_4088 ) ( AIRPLANE-AT ?AUTO_4091 ?AUTO_4092 ) ( not ( = ?AUTO_4092 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4092 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4091 ?AUTO_4092 ?AUTO_4088 )
      ( DELIVER-PKG ?AUTO_4086 ?AUTO_4087 )
      ( DELIVER-PKG-VERIFY ?AUTO_4086 ?AUTO_4087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4125 - OBJ
      ?AUTO_4126 - LOCATION
    )
    :vars
    (
      ?AUTO_4130 - LOCATION
      ?AUTO_4127 - CITY
      ?AUTO_4131 - TRUCK
      ?AUTO_4129 - LOCATION
      ?AUTO_4128 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4130 ?AUTO_4127 ) ( IN-CITY ?AUTO_4126 ?AUTO_4127 ) ( not ( = ?AUTO_4126 ?AUTO_4130 ) ) ( TRUCK-AT ?AUTO_4131 ?AUTO_4126 ) ( AIRPORT ?AUTO_4129 ) ( AIRPORT ?AUTO_4130 ) ( AIRPLANE-AT ?AUTO_4128 ?AUTO_4129 ) ( not ( = ?AUTO_4129 ?AUTO_4130 ) ) ( not ( = ?AUTO_4126 ?AUTO_4129 ) ) ( OBJ-AT ?AUTO_4125 ?AUTO_4129 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4125 ?AUTO_4128 ?AUTO_4129 )
      ( DELIVER-PKG ?AUTO_4125 ?AUTO_4126 )
      ( DELIVER-PKG-VERIFY ?AUTO_4125 ?AUTO_4126 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4142 - OBJ
      ?AUTO_4143 - LOCATION
    )
    :vars
    (
      ?AUTO_4144 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4144 ?AUTO_4143 ) ( IN-TRUCK ?AUTO_4142 ?AUTO_4144 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4142 ?AUTO_4144 ?AUTO_4143 )
      ( DELIVER-PKG-VERIFY ?AUTO_4142 ?AUTO_4143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4145 - OBJ
      ?AUTO_4146 - LOCATION
    )
    :vars
    (
      ?AUTO_4147 - TRUCK
      ?AUTO_4148 - LOCATION
      ?AUTO_4149 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4145 ?AUTO_4147 ) ( TRUCK-AT ?AUTO_4147 ?AUTO_4148 ) ( IN-CITY ?AUTO_4148 ?AUTO_4149 ) ( IN-CITY ?AUTO_4146 ?AUTO_4149 ) ( not ( = ?AUTO_4146 ?AUTO_4148 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4147 ?AUTO_4148 ?AUTO_4146 ?AUTO_4149 )
      ( DELIVER-PKG ?AUTO_4145 ?AUTO_4146 )
      ( DELIVER-PKG-VERIFY ?AUTO_4145 ?AUTO_4146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4150 - OBJ
      ?AUTO_4151 - LOCATION
    )
    :vars
    (
      ?AUTO_4152 - TRUCK
      ?AUTO_4153 - LOCATION
      ?AUTO_4154 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4152 ?AUTO_4153 ) ( IN-CITY ?AUTO_4153 ?AUTO_4154 ) ( IN-CITY ?AUTO_4151 ?AUTO_4154 ) ( not ( = ?AUTO_4151 ?AUTO_4153 ) ) ( OBJ-AT ?AUTO_4150 ?AUTO_4153 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4150 ?AUTO_4152 ?AUTO_4153 )
      ( DELIVER-PKG ?AUTO_4150 ?AUTO_4151 )
      ( DELIVER-PKG-VERIFY ?AUTO_4150 ?AUTO_4151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4155 - OBJ
      ?AUTO_4156 - LOCATION
    )
    :vars
    (
      ?AUTO_4157 - LOCATION
      ?AUTO_4159 - CITY
      ?AUTO_4158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4157 ?AUTO_4159 ) ( IN-CITY ?AUTO_4156 ?AUTO_4159 ) ( not ( = ?AUTO_4156 ?AUTO_4157 ) ) ( OBJ-AT ?AUTO_4155 ?AUTO_4157 ) ( TRUCK-AT ?AUTO_4158 ?AUTO_4156 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4158 ?AUTO_4156 ?AUTO_4157 ?AUTO_4159 )
      ( DELIVER-PKG ?AUTO_4155 ?AUTO_4156 )
      ( DELIVER-PKG-VERIFY ?AUTO_4155 ?AUTO_4156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4180 - OBJ
      ?AUTO_4181 - LOCATION
    )
    :vars
    (
      ?AUTO_4182 - LOCATION
      ?AUTO_4184 - CITY
      ?AUTO_4183 - TRUCK
      ?AUTO_4185 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4182 ?AUTO_4184 ) ( IN-CITY ?AUTO_4181 ?AUTO_4184 ) ( not ( = ?AUTO_4181 ?AUTO_4182 ) ) ( TRUCK-AT ?AUTO_4183 ?AUTO_4181 ) ( IN-AIRPLANE ?AUTO_4180 ?AUTO_4185 ) ( AIRPLANE-AT ?AUTO_4185 ?AUTO_4182 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4180 ?AUTO_4185 ?AUTO_4182 )
      ( DELIVER-PKG ?AUTO_4180 ?AUTO_4181 )
      ( DELIVER-PKG-VERIFY ?AUTO_4180 ?AUTO_4181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4220 - OBJ
      ?AUTO_4221 - LOCATION
    )
    :vars
    (
      ?AUTO_4224 - LOCATION
      ?AUTO_4222 - CITY
      ?AUTO_4226 - TRUCK
      ?AUTO_4225 - LOCATION
      ?AUTO_4223 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4224 ?AUTO_4222 ) ( IN-CITY ?AUTO_4221 ?AUTO_4222 ) ( not ( = ?AUTO_4221 ?AUTO_4224 ) ) ( TRUCK-AT ?AUTO_4226 ?AUTO_4221 ) ( AIRPORT ?AUTO_4225 ) ( AIRPORT ?AUTO_4224 ) ( AIRPLANE-AT ?AUTO_4223 ?AUTO_4225 ) ( not ( = ?AUTO_4225 ?AUTO_4224 ) ) ( not ( = ?AUTO_4221 ?AUTO_4225 ) ) ( OBJ-AT ?AUTO_4220 ?AUTO_4225 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4220 ?AUTO_4223 ?AUTO_4225 )
      ( DELIVER-PKG ?AUTO_4220 ?AUTO_4221 )
      ( DELIVER-PKG-VERIFY ?AUTO_4220 ?AUTO_4221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4229 - OBJ
      ?AUTO_4230 - LOCATION
    )
    :vars
    (
      ?AUTO_4234 - LOCATION
      ?AUTO_4232 - CITY
      ?AUTO_4231 - TRUCK
      ?AUTO_4233 - LOCATION
      ?AUTO_4235 - AIRPLANE
      ?AUTO_4236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4234 ?AUTO_4232 ) ( IN-CITY ?AUTO_4230 ?AUTO_4232 ) ( not ( = ?AUTO_4230 ?AUTO_4234 ) ) ( TRUCK-AT ?AUTO_4231 ?AUTO_4230 ) ( AIRPORT ?AUTO_4233 ) ( AIRPORT ?AUTO_4234 ) ( AIRPLANE-AT ?AUTO_4235 ?AUTO_4233 ) ( not ( = ?AUTO_4233 ?AUTO_4234 ) ) ( not ( = ?AUTO_4230 ?AUTO_4233 ) ) ( TRUCK-AT ?AUTO_4236 ?AUTO_4233 ) ( IN-TRUCK ?AUTO_4229 ?AUTO_4236 ) ( not ( = ?AUTO_4231 ?AUTO_4236 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4229 ?AUTO_4236 ?AUTO_4233 )
      ( DELIVER-PKG ?AUTO_4229 ?AUTO_4230 )
      ( DELIVER-PKG-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4237 - OBJ
      ?AUTO_4238 - LOCATION
    )
    :vars
    (
      ?AUTO_4243 - LOCATION
      ?AUTO_4239 - CITY
      ?AUTO_4241 - TRUCK
      ?AUTO_4242 - LOCATION
      ?AUTO_4244 - AIRPLANE
      ?AUTO_4240 - TRUCK
      ?AUTO_4245 - LOCATION
      ?AUTO_4246 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4243 ?AUTO_4239 ) ( IN-CITY ?AUTO_4238 ?AUTO_4239 ) ( not ( = ?AUTO_4238 ?AUTO_4243 ) ) ( TRUCK-AT ?AUTO_4241 ?AUTO_4238 ) ( AIRPORT ?AUTO_4242 ) ( AIRPORT ?AUTO_4243 ) ( AIRPLANE-AT ?AUTO_4244 ?AUTO_4242 ) ( not ( = ?AUTO_4242 ?AUTO_4243 ) ) ( not ( = ?AUTO_4238 ?AUTO_4242 ) ) ( IN-TRUCK ?AUTO_4237 ?AUTO_4240 ) ( not ( = ?AUTO_4241 ?AUTO_4240 ) ) ( TRUCK-AT ?AUTO_4240 ?AUTO_4245 ) ( IN-CITY ?AUTO_4245 ?AUTO_4246 ) ( IN-CITY ?AUTO_4242 ?AUTO_4246 ) ( not ( = ?AUTO_4242 ?AUTO_4245 ) ) ( not ( = ?AUTO_4238 ?AUTO_4245 ) ) ( not ( = ?AUTO_4243 ?AUTO_4245 ) ) ( not ( = ?AUTO_4239 ?AUTO_4246 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4240 ?AUTO_4245 ?AUTO_4242 ?AUTO_4246 )
      ( DELIVER-PKG ?AUTO_4237 ?AUTO_4238 )
      ( DELIVER-PKG-VERIFY ?AUTO_4237 ?AUTO_4238 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4247 - OBJ
      ?AUTO_4248 - LOCATION
    )
    :vars
    (
      ?AUTO_4251 - LOCATION
      ?AUTO_4252 - CITY
      ?AUTO_4249 - TRUCK
      ?AUTO_4256 - LOCATION
      ?AUTO_4253 - AIRPLANE
      ?AUTO_4255 - TRUCK
      ?AUTO_4250 - LOCATION
      ?AUTO_4254 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4251 ?AUTO_4252 ) ( IN-CITY ?AUTO_4248 ?AUTO_4252 ) ( not ( = ?AUTO_4248 ?AUTO_4251 ) ) ( TRUCK-AT ?AUTO_4249 ?AUTO_4248 ) ( AIRPORT ?AUTO_4256 ) ( AIRPORT ?AUTO_4251 ) ( AIRPLANE-AT ?AUTO_4253 ?AUTO_4256 ) ( not ( = ?AUTO_4256 ?AUTO_4251 ) ) ( not ( = ?AUTO_4248 ?AUTO_4256 ) ) ( not ( = ?AUTO_4249 ?AUTO_4255 ) ) ( TRUCK-AT ?AUTO_4255 ?AUTO_4250 ) ( IN-CITY ?AUTO_4250 ?AUTO_4254 ) ( IN-CITY ?AUTO_4256 ?AUTO_4254 ) ( not ( = ?AUTO_4256 ?AUTO_4250 ) ) ( not ( = ?AUTO_4248 ?AUTO_4250 ) ) ( not ( = ?AUTO_4251 ?AUTO_4250 ) ) ( not ( = ?AUTO_4252 ?AUTO_4254 ) ) ( OBJ-AT ?AUTO_4247 ?AUTO_4250 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4247 ?AUTO_4255 ?AUTO_4250 )
      ( DELIVER-PKG ?AUTO_4247 ?AUTO_4248 )
      ( DELIVER-PKG-VERIFY ?AUTO_4247 ?AUTO_4248 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4259 - OBJ
      ?AUTO_4260 - LOCATION
    )
    :vars
    (
      ?AUTO_4261 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4261 ?AUTO_4260 ) ( IN-TRUCK ?AUTO_4259 ?AUTO_4261 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4259 ?AUTO_4261 ?AUTO_4260 )
      ( DELIVER-PKG-VERIFY ?AUTO_4259 ?AUTO_4260 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4270 - OBJ
      ?AUTO_4271 - LOCATION
    )
    :vars
    (
      ?AUTO_4272 - TRUCK
      ?AUTO_4273 - LOCATION
      ?AUTO_4274 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4270 ?AUTO_4272 ) ( TRUCK-AT ?AUTO_4272 ?AUTO_4273 ) ( IN-CITY ?AUTO_4273 ?AUTO_4274 ) ( IN-CITY ?AUTO_4271 ?AUTO_4274 ) ( not ( = ?AUTO_4271 ?AUTO_4273 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4272 ?AUTO_4273 ?AUTO_4271 ?AUTO_4274 )
      ( DELIVER-PKG ?AUTO_4270 ?AUTO_4271 )
      ( DELIVER-PKG-VERIFY ?AUTO_4270 ?AUTO_4271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4275 - OBJ
      ?AUTO_4276 - LOCATION
    )
    :vars
    (
      ?AUTO_4277 - TRUCK
      ?AUTO_4278 - LOCATION
      ?AUTO_4279 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4277 ?AUTO_4278 ) ( IN-CITY ?AUTO_4278 ?AUTO_4279 ) ( IN-CITY ?AUTO_4276 ?AUTO_4279 ) ( not ( = ?AUTO_4276 ?AUTO_4278 ) ) ( OBJ-AT ?AUTO_4275 ?AUTO_4278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4275 ?AUTO_4277 ?AUTO_4278 )
      ( DELIVER-PKG ?AUTO_4275 ?AUTO_4276 )
      ( DELIVER-PKG-VERIFY ?AUTO_4275 ?AUTO_4276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4282 - OBJ
      ?AUTO_4283 - LOCATION
    )
    :vars
    (
      ?AUTO_4286 - LOCATION
      ?AUTO_4285 - CITY
      ?AUTO_4284 - TRUCK
      ?AUTO_4287 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4286 ?AUTO_4285 ) ( IN-CITY ?AUTO_4283 ?AUTO_4285 ) ( not ( = ?AUTO_4283 ?AUTO_4286 ) ) ( OBJ-AT ?AUTO_4282 ?AUTO_4286 ) ( TRUCK-AT ?AUTO_4284 ?AUTO_4287 ) ( IN-CITY ?AUTO_4287 ?AUTO_4285 ) ( not ( = ?AUTO_4286 ?AUTO_4287 ) ) ( not ( = ?AUTO_4283 ?AUTO_4287 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4284 ?AUTO_4287 ?AUTO_4286 ?AUTO_4285 )
      ( DELIVER-PKG ?AUTO_4282 ?AUTO_4283 )
      ( DELIVER-PKG-VERIFY ?AUTO_4282 ?AUTO_4283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4292 - OBJ
      ?AUTO_4293 - LOCATION
    )
    :vars
    (
      ?AUTO_4294 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4294 ?AUTO_4293 ) ( IN-TRUCK ?AUTO_4292 ?AUTO_4294 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4292 ?AUTO_4294 ?AUTO_4293 )
      ( DELIVER-PKG-VERIFY ?AUTO_4292 ?AUTO_4293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4301 - OBJ
      ?AUTO_4302 - LOCATION
    )
    :vars
    (
      ?AUTO_4303 - TRUCK
      ?AUTO_4304 - LOCATION
      ?AUTO_4305 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4301 ?AUTO_4303 ) ( TRUCK-AT ?AUTO_4303 ?AUTO_4304 ) ( IN-CITY ?AUTO_4304 ?AUTO_4305 ) ( IN-CITY ?AUTO_4302 ?AUTO_4305 ) ( not ( = ?AUTO_4302 ?AUTO_4304 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4303 ?AUTO_4304 ?AUTO_4302 ?AUTO_4305 )
      ( DELIVER-PKG ?AUTO_4301 ?AUTO_4302 )
      ( DELIVER-PKG-VERIFY ?AUTO_4301 ?AUTO_4302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4306 - OBJ
      ?AUTO_4307 - LOCATION
    )
    :vars
    (
      ?AUTO_4308 - TRUCK
      ?AUTO_4309 - LOCATION
      ?AUTO_4310 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4308 ?AUTO_4309 ) ( IN-CITY ?AUTO_4309 ?AUTO_4310 ) ( IN-CITY ?AUTO_4307 ?AUTO_4310 ) ( not ( = ?AUTO_4307 ?AUTO_4309 ) ) ( OBJ-AT ?AUTO_4306 ?AUTO_4309 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4306 ?AUTO_4308 ?AUTO_4309 )
      ( DELIVER-PKG ?AUTO_4306 ?AUTO_4307 )
      ( DELIVER-PKG-VERIFY ?AUTO_4306 ?AUTO_4307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4323 - OBJ
      ?AUTO_4324 - LOCATION
    )
    :vars
    (
      ?AUTO_4325 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4325 ?AUTO_4324 ) ( IN-TRUCK ?AUTO_4323 ?AUTO_4325 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4323 ?AUTO_4325 ?AUTO_4324 )
      ( DELIVER-PKG-VERIFY ?AUTO_4323 ?AUTO_4324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4330 - OBJ
      ?AUTO_4331 - LOCATION
    )
    :vars
    (
      ?AUTO_4332 - TRUCK
      ?AUTO_4333 - LOCATION
      ?AUTO_4334 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4330 ?AUTO_4332 ) ( TRUCK-AT ?AUTO_4332 ?AUTO_4333 ) ( IN-CITY ?AUTO_4333 ?AUTO_4334 ) ( IN-CITY ?AUTO_4331 ?AUTO_4334 ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4332 ?AUTO_4333 ?AUTO_4331 ?AUTO_4334 )
      ( DELIVER-PKG ?AUTO_4330 ?AUTO_4331 )
      ( DELIVER-PKG-VERIFY ?AUTO_4330 ?AUTO_4331 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4335 - OBJ
      ?AUTO_4336 - LOCATION
    )
    :vars
    (
      ?AUTO_4337 - TRUCK
      ?AUTO_4338 - LOCATION
      ?AUTO_4339 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4337 ?AUTO_4338 ) ( IN-CITY ?AUTO_4338 ?AUTO_4339 ) ( IN-CITY ?AUTO_4336 ?AUTO_4339 ) ( not ( = ?AUTO_4336 ?AUTO_4338 ) ) ( OBJ-AT ?AUTO_4335 ?AUTO_4338 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4335 ?AUTO_4337 ?AUTO_4338 )
      ( DELIVER-PKG ?AUTO_4335 ?AUTO_4336 )
      ( DELIVER-PKG-VERIFY ?AUTO_4335 ?AUTO_4336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4356 - OBJ
      ?AUTO_4357 - LOCATION
    )
    :vars
    (
      ?AUTO_4358 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4356 ?AUTO_4358 ) ( AIRPLANE-AT ?AUTO_4358 ?AUTO_4357 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4356 ?AUTO_4358 ?AUTO_4357 )
      ( DELIVER-PKG-VERIFY ?AUTO_4356 ?AUTO_4357 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4359 - OBJ
      ?AUTO_4360 - LOCATION
    )
    :vars
    (
      ?AUTO_4361 - AIRPLANE
      ?AUTO_4362 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4359 ?AUTO_4361 ) ( AIRPORT ?AUTO_4362 ) ( AIRPORT ?AUTO_4360 ) ( AIRPLANE-AT ?AUTO_4361 ?AUTO_4362 ) ( not ( = ?AUTO_4362 ?AUTO_4360 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4361 ?AUTO_4362 ?AUTO_4360 )
      ( DELIVER-PKG ?AUTO_4359 ?AUTO_4360 )
      ( DELIVER-PKG-VERIFY ?AUTO_4359 ?AUTO_4360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4371 - OBJ
      ?AUTO_4372 - LOCATION
    )
    :vars
    (
      ?AUTO_4373 - LOCATION
      ?AUTO_4374 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4373 ) ( AIRPORT ?AUTO_4372 ) ( AIRPLANE-AT ?AUTO_4374 ?AUTO_4373 ) ( not ( = ?AUTO_4373 ?AUTO_4372 ) ) ( OBJ-AT ?AUTO_4371 ?AUTO_4373 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4371 ?AUTO_4374 ?AUTO_4373 )
      ( DELIVER-PKG ?AUTO_4371 ?AUTO_4372 )
      ( DELIVER-PKG-VERIFY ?AUTO_4371 ?AUTO_4372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4401 - OBJ
      ?AUTO_4402 - LOCATION
    )
    :vars
    (
      ?AUTO_4403 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4401 ?AUTO_4403 ) ( AIRPLANE-AT ?AUTO_4403 ?AUTO_4402 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4401 ?AUTO_4403 ?AUTO_4402 )
      ( DELIVER-PKG-VERIFY ?AUTO_4401 ?AUTO_4402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4410 - OBJ
      ?AUTO_4411 - LOCATION
    )
    :vars
    (
      ?AUTO_4413 - LOCATION
      ?AUTO_4412 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4413 ) ( AIRPORT ?AUTO_4411 ) ( AIRPLANE-AT ?AUTO_4412 ?AUTO_4413 ) ( not ( = ?AUTO_4413 ?AUTO_4411 ) ) ( OBJ-AT ?AUTO_4410 ?AUTO_4413 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4410 ?AUTO_4412 ?AUTO_4413 )
      ( DELIVER-PKG ?AUTO_4410 ?AUTO_4411 )
      ( DELIVER-PKG-VERIFY ?AUTO_4410 ?AUTO_4411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4414 - OBJ
      ?AUTO_4415 - LOCATION
    )
    :vars
    (
      ?AUTO_4417 - LOCATION
      ?AUTO_4418 - LOCATION
      ?AUTO_4416 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4417 ) ( AIRPORT ?AUTO_4415 ) ( not ( = ?AUTO_4417 ?AUTO_4415 ) ) ( OBJ-AT ?AUTO_4414 ?AUTO_4417 ) ( AIRPORT ?AUTO_4418 ) ( AIRPLANE-AT ?AUTO_4416 ?AUTO_4418 ) ( not ( = ?AUTO_4418 ?AUTO_4417 ) ) ( not ( = ?AUTO_4415 ?AUTO_4418 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4416 ?AUTO_4418 ?AUTO_4417 )
      ( DELIVER-PKG ?AUTO_4414 ?AUTO_4415 )
      ( DELIVER-PKG-VERIFY ?AUTO_4414 ?AUTO_4415 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4427 - OBJ
      ?AUTO_4428 - LOCATION
    )
    :vars
    (
      ?AUTO_4430 - LOCATION
      ?AUTO_4429 - LOCATION
      ?AUTO_4431 - AIRPLANE
      ?AUTO_4432 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4430 ) ( AIRPORT ?AUTO_4428 ) ( not ( = ?AUTO_4430 ?AUTO_4428 ) ) ( AIRPORT ?AUTO_4429 ) ( AIRPLANE-AT ?AUTO_4431 ?AUTO_4429 ) ( not ( = ?AUTO_4429 ?AUTO_4430 ) ) ( not ( = ?AUTO_4428 ?AUTO_4429 ) ) ( TRUCK-AT ?AUTO_4432 ?AUTO_4430 ) ( IN-TRUCK ?AUTO_4427 ?AUTO_4432 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4427 ?AUTO_4432 ?AUTO_4430 )
      ( DELIVER-PKG ?AUTO_4427 ?AUTO_4428 )
      ( DELIVER-PKG-VERIFY ?AUTO_4427 ?AUTO_4428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4441 - OBJ
      ?AUTO_4442 - LOCATION
    )
    :vars
    (
      ?AUTO_4446 - LOCATION
      ?AUTO_4444 - LOCATION
      ?AUTO_4443 - AIRPLANE
      ?AUTO_4445 - TRUCK
      ?AUTO_4447 - LOCATION
      ?AUTO_4448 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4446 ) ( AIRPORT ?AUTO_4442 ) ( not ( = ?AUTO_4446 ?AUTO_4442 ) ) ( AIRPORT ?AUTO_4444 ) ( AIRPLANE-AT ?AUTO_4443 ?AUTO_4444 ) ( not ( = ?AUTO_4444 ?AUTO_4446 ) ) ( not ( = ?AUTO_4442 ?AUTO_4444 ) ) ( IN-TRUCK ?AUTO_4441 ?AUTO_4445 ) ( TRUCK-AT ?AUTO_4445 ?AUTO_4447 ) ( IN-CITY ?AUTO_4447 ?AUTO_4448 ) ( IN-CITY ?AUTO_4446 ?AUTO_4448 ) ( not ( = ?AUTO_4446 ?AUTO_4447 ) ) ( not ( = ?AUTO_4442 ?AUTO_4447 ) ) ( not ( = ?AUTO_4444 ?AUTO_4447 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4445 ?AUTO_4447 ?AUTO_4446 ?AUTO_4448 )
      ( DELIVER-PKG ?AUTO_4441 ?AUTO_4442 )
      ( DELIVER-PKG-VERIFY ?AUTO_4441 ?AUTO_4442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4449 - OBJ
      ?AUTO_4450 - LOCATION
    )
    :vars
    (
      ?AUTO_4451 - LOCATION
      ?AUTO_4452 - LOCATION
      ?AUTO_4453 - AIRPLANE
      ?AUTO_4454 - TRUCK
      ?AUTO_4456 - LOCATION
      ?AUTO_4455 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4451 ) ( AIRPORT ?AUTO_4450 ) ( not ( = ?AUTO_4451 ?AUTO_4450 ) ) ( AIRPORT ?AUTO_4452 ) ( AIRPLANE-AT ?AUTO_4453 ?AUTO_4452 ) ( not ( = ?AUTO_4452 ?AUTO_4451 ) ) ( not ( = ?AUTO_4450 ?AUTO_4452 ) ) ( TRUCK-AT ?AUTO_4454 ?AUTO_4456 ) ( IN-CITY ?AUTO_4456 ?AUTO_4455 ) ( IN-CITY ?AUTO_4451 ?AUTO_4455 ) ( not ( = ?AUTO_4451 ?AUTO_4456 ) ) ( not ( = ?AUTO_4450 ?AUTO_4456 ) ) ( not ( = ?AUTO_4452 ?AUTO_4456 ) ) ( OBJ-AT ?AUTO_4449 ?AUTO_4456 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4449 ?AUTO_4454 ?AUTO_4456 )
      ( DELIVER-PKG ?AUTO_4449 ?AUTO_4450 )
      ( DELIVER-PKG-VERIFY ?AUTO_4449 ?AUTO_4450 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4459 - OBJ
      ?AUTO_4460 - LOCATION
    )
    :vars
    (
      ?AUTO_4462 - LOCATION
      ?AUTO_4463 - LOCATION
      ?AUTO_4466 - AIRPLANE
      ?AUTO_4465 - LOCATION
      ?AUTO_4461 - CITY
      ?AUTO_4464 - TRUCK
      ?AUTO_4467 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4462 ) ( AIRPORT ?AUTO_4460 ) ( not ( = ?AUTO_4462 ?AUTO_4460 ) ) ( AIRPORT ?AUTO_4463 ) ( AIRPLANE-AT ?AUTO_4466 ?AUTO_4463 ) ( not ( = ?AUTO_4463 ?AUTO_4462 ) ) ( not ( = ?AUTO_4460 ?AUTO_4463 ) ) ( IN-CITY ?AUTO_4465 ?AUTO_4461 ) ( IN-CITY ?AUTO_4462 ?AUTO_4461 ) ( not ( = ?AUTO_4462 ?AUTO_4465 ) ) ( not ( = ?AUTO_4460 ?AUTO_4465 ) ) ( not ( = ?AUTO_4463 ?AUTO_4465 ) ) ( OBJ-AT ?AUTO_4459 ?AUTO_4465 ) ( TRUCK-AT ?AUTO_4464 ?AUTO_4467 ) ( IN-CITY ?AUTO_4467 ?AUTO_4461 ) ( not ( = ?AUTO_4465 ?AUTO_4467 ) ) ( not ( = ?AUTO_4460 ?AUTO_4467 ) ) ( not ( = ?AUTO_4462 ?AUTO_4467 ) ) ( not ( = ?AUTO_4463 ?AUTO_4467 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4464 ?AUTO_4467 ?AUTO_4465 ?AUTO_4461 )
      ( DELIVER-PKG ?AUTO_4459 ?AUTO_4460 )
      ( DELIVER-PKG-VERIFY ?AUTO_4459 ?AUTO_4460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4472 - OBJ
      ?AUTO_4473 - LOCATION
    )
    :vars
    (
      ?AUTO_4474 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4474 ?AUTO_4473 ) ( IN-TRUCK ?AUTO_4472 ?AUTO_4474 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4472 ?AUTO_4474 ?AUTO_4473 )
      ( DELIVER-PKG-VERIFY ?AUTO_4472 ?AUTO_4473 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4475 - OBJ
      ?AUTO_4476 - LOCATION
    )
    :vars
    (
      ?AUTO_4477 - TRUCK
      ?AUTO_4478 - LOCATION
      ?AUTO_4479 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4475 ?AUTO_4477 ) ( TRUCK-AT ?AUTO_4477 ?AUTO_4478 ) ( IN-CITY ?AUTO_4478 ?AUTO_4479 ) ( IN-CITY ?AUTO_4476 ?AUTO_4479 ) ( not ( = ?AUTO_4476 ?AUTO_4478 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4477 ?AUTO_4478 ?AUTO_4476 ?AUTO_4479 )
      ( DELIVER-PKG ?AUTO_4475 ?AUTO_4476 )
      ( DELIVER-PKG-VERIFY ?AUTO_4475 ?AUTO_4476 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4528 - OBJ
      ?AUTO_4529 - LOCATION
    )
    :vars
    (
      ?AUTO_4530 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4528 ?AUTO_4530 ) ( AIRPLANE-AT ?AUTO_4530 ?AUTO_4529 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4528 ?AUTO_4530 ?AUTO_4529 )
      ( DELIVER-PKG-VERIFY ?AUTO_4528 ?AUTO_4529 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4537 - OBJ
      ?AUTO_4538 - LOCATION
    )
    :vars
    (
      ?AUTO_4539 - AIRPLANE
      ?AUTO_4540 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4537 ?AUTO_4539 ) ( AIRPORT ?AUTO_4540 ) ( AIRPORT ?AUTO_4538 ) ( AIRPLANE-AT ?AUTO_4539 ?AUTO_4540 ) ( not ( = ?AUTO_4540 ?AUTO_4538 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4539 ?AUTO_4540 ?AUTO_4538 )
      ( DELIVER-PKG ?AUTO_4537 ?AUTO_4538 )
      ( DELIVER-PKG-VERIFY ?AUTO_4537 ?AUTO_4538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4551 - OBJ
      ?AUTO_4552 - LOCATION
    )
    :vars
    (
      ?AUTO_4554 - LOCATION
      ?AUTO_4553 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4554 ) ( AIRPORT ?AUTO_4552 ) ( AIRPLANE-AT ?AUTO_4553 ?AUTO_4554 ) ( not ( = ?AUTO_4554 ?AUTO_4552 ) ) ( OBJ-AT ?AUTO_4551 ?AUTO_4554 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4551 ?AUTO_4553 ?AUTO_4554 )
      ( DELIVER-PKG ?AUTO_4551 ?AUTO_4552 )
      ( DELIVER-PKG-VERIFY ?AUTO_4551 ?AUTO_4552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4563 - OBJ
      ?AUTO_4564 - LOCATION
    )
    :vars
    (
      ?AUTO_4565 - LOCATION
      ?AUTO_4567 - LOCATION
      ?AUTO_4566 - AIRPLANE
      ?AUTO_4568 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4565 ) ( AIRPORT ?AUTO_4564 ) ( not ( = ?AUTO_4565 ?AUTO_4564 ) ) ( AIRPORT ?AUTO_4567 ) ( AIRPLANE-AT ?AUTO_4566 ?AUTO_4567 ) ( not ( = ?AUTO_4567 ?AUTO_4565 ) ) ( not ( = ?AUTO_4564 ?AUTO_4567 ) ) ( TRUCK-AT ?AUTO_4568 ?AUTO_4565 ) ( IN-TRUCK ?AUTO_4563 ?AUTO_4568 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4563 ?AUTO_4568 ?AUTO_4565 )
      ( DELIVER-PKG ?AUTO_4563 ?AUTO_4564 )
      ( DELIVER-PKG-VERIFY ?AUTO_4563 ?AUTO_4564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4573 - OBJ
      ?AUTO_4574 - LOCATION
    )
    :vars
    (
      ?AUTO_4577 - LOCATION
      ?AUTO_4578 - LOCATION
      ?AUTO_4575 - AIRPLANE
      ?AUTO_4576 - TRUCK
      ?AUTO_4579 - LOCATION
      ?AUTO_4580 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4577 ) ( AIRPORT ?AUTO_4574 ) ( not ( = ?AUTO_4577 ?AUTO_4574 ) ) ( AIRPORT ?AUTO_4578 ) ( AIRPLANE-AT ?AUTO_4575 ?AUTO_4578 ) ( not ( = ?AUTO_4578 ?AUTO_4577 ) ) ( not ( = ?AUTO_4574 ?AUTO_4578 ) ) ( IN-TRUCK ?AUTO_4573 ?AUTO_4576 ) ( TRUCK-AT ?AUTO_4576 ?AUTO_4579 ) ( IN-CITY ?AUTO_4579 ?AUTO_4580 ) ( IN-CITY ?AUTO_4577 ?AUTO_4580 ) ( not ( = ?AUTO_4577 ?AUTO_4579 ) ) ( not ( = ?AUTO_4574 ?AUTO_4579 ) ) ( not ( = ?AUTO_4578 ?AUTO_4579 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4576 ?AUTO_4579 ?AUTO_4577 ?AUTO_4580 )
      ( DELIVER-PKG ?AUTO_4573 ?AUTO_4574 )
      ( DELIVER-PKG-VERIFY ?AUTO_4573 ?AUTO_4574 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4581 - OBJ
      ?AUTO_4582 - LOCATION
    )
    :vars
    (
      ?AUTO_4586 - LOCATION
      ?AUTO_4584 - LOCATION
      ?AUTO_4585 - AIRPLANE
      ?AUTO_4583 - TRUCK
      ?AUTO_4588 - LOCATION
      ?AUTO_4587 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4586 ) ( AIRPORT ?AUTO_4582 ) ( not ( = ?AUTO_4586 ?AUTO_4582 ) ) ( AIRPORT ?AUTO_4584 ) ( AIRPLANE-AT ?AUTO_4585 ?AUTO_4584 ) ( not ( = ?AUTO_4584 ?AUTO_4586 ) ) ( not ( = ?AUTO_4582 ?AUTO_4584 ) ) ( TRUCK-AT ?AUTO_4583 ?AUTO_4588 ) ( IN-CITY ?AUTO_4588 ?AUTO_4587 ) ( IN-CITY ?AUTO_4586 ?AUTO_4587 ) ( not ( = ?AUTO_4586 ?AUTO_4588 ) ) ( not ( = ?AUTO_4582 ?AUTO_4588 ) ) ( not ( = ?AUTO_4584 ?AUTO_4588 ) ) ( OBJ-AT ?AUTO_4581 ?AUTO_4588 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4581 ?AUTO_4583 ?AUTO_4588 )
      ( DELIVER-PKG ?AUTO_4581 ?AUTO_4582 )
      ( DELIVER-PKG-VERIFY ?AUTO_4581 ?AUTO_4582 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4605 - OBJ
      ?AUTO_4606 - LOCATION
    )
    :vars
    (
      ?AUTO_4607 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4605 ?AUTO_4607 ) ( AIRPLANE-AT ?AUTO_4607 ?AUTO_4606 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4605 ?AUTO_4607 ?AUTO_4606 )
      ( DELIVER-PKG-VERIFY ?AUTO_4605 ?AUTO_4606 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4608 - OBJ
      ?AUTO_4609 - LOCATION
    )
    :vars
    (
      ?AUTO_4610 - AIRPLANE
      ?AUTO_4611 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4608 ?AUTO_4610 ) ( AIRPORT ?AUTO_4611 ) ( AIRPORT ?AUTO_4609 ) ( AIRPLANE-AT ?AUTO_4610 ?AUTO_4611 ) ( not ( = ?AUTO_4611 ?AUTO_4609 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4610 ?AUTO_4611 ?AUTO_4609 )
      ( DELIVER-PKG ?AUTO_4608 ?AUTO_4609 )
      ( DELIVER-PKG-VERIFY ?AUTO_4608 ?AUTO_4609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4614 - OBJ
      ?AUTO_4615 - LOCATION
    )
    :vars
    (
      ?AUTO_4617 - LOCATION
      ?AUTO_4616 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4617 ) ( AIRPORT ?AUTO_4615 ) ( AIRPLANE-AT ?AUTO_4616 ?AUTO_4617 ) ( not ( = ?AUTO_4617 ?AUTO_4615 ) ) ( OBJ-AT ?AUTO_4614 ?AUTO_4617 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4614 ?AUTO_4616 ?AUTO_4617 )
      ( DELIVER-PKG ?AUTO_4614 ?AUTO_4615 )
      ( DELIVER-PKG-VERIFY ?AUTO_4614 ?AUTO_4615 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4618 - OBJ
      ?AUTO_4619 - LOCATION
    )
    :vars
    (
      ?AUTO_4621 - LOCATION
      ?AUTO_4620 - AIRPLANE
      ?AUTO_4622 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4621 ) ( AIRPORT ?AUTO_4619 ) ( AIRPLANE-AT ?AUTO_4620 ?AUTO_4621 ) ( not ( = ?AUTO_4621 ?AUTO_4619 ) ) ( TRUCK-AT ?AUTO_4622 ?AUTO_4621 ) ( IN-TRUCK ?AUTO_4618 ?AUTO_4622 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4618 ?AUTO_4622 ?AUTO_4621 )
      ( DELIVER-PKG ?AUTO_4618 ?AUTO_4619 )
      ( DELIVER-PKG-VERIFY ?AUTO_4618 ?AUTO_4619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4623 - OBJ
      ?AUTO_4624 - LOCATION
    )
    :vars
    (
      ?AUTO_4626 - LOCATION
      ?AUTO_4625 - AIRPLANE
      ?AUTO_4627 - TRUCK
      ?AUTO_4628 - LOCATION
      ?AUTO_4629 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4626 ) ( AIRPORT ?AUTO_4624 ) ( AIRPLANE-AT ?AUTO_4625 ?AUTO_4626 ) ( not ( = ?AUTO_4626 ?AUTO_4624 ) ) ( IN-TRUCK ?AUTO_4623 ?AUTO_4627 ) ( TRUCK-AT ?AUTO_4627 ?AUTO_4628 ) ( IN-CITY ?AUTO_4628 ?AUTO_4629 ) ( IN-CITY ?AUTO_4626 ?AUTO_4629 ) ( not ( = ?AUTO_4626 ?AUTO_4628 ) ) ( not ( = ?AUTO_4624 ?AUTO_4628 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4627 ?AUTO_4628 ?AUTO_4626 ?AUTO_4629 )
      ( DELIVER-PKG ?AUTO_4623 ?AUTO_4624 )
      ( DELIVER-PKG-VERIFY ?AUTO_4623 ?AUTO_4624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4678 - OBJ
      ?AUTO_4679 - LOCATION
    )
    :vars
    (
      ?AUTO_4680 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4678 ?AUTO_4680 ) ( AIRPLANE-AT ?AUTO_4680 ?AUTO_4679 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4678 ?AUTO_4680 ?AUTO_4679 )
      ( DELIVER-PKG-VERIFY ?AUTO_4678 ?AUTO_4679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4743 - OBJ
      ?AUTO_4744 - LOCATION
    )
    :vars
    (
      ?AUTO_4745 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4745 ?AUTO_4744 ) ( IN-TRUCK ?AUTO_4743 ?AUTO_4745 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4743 ?AUTO_4745 ?AUTO_4744 )
      ( DELIVER-PKG-VERIFY ?AUTO_4743 ?AUTO_4744 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4754 - OBJ
      ?AUTO_4755 - LOCATION
    )
    :vars
    (
      ?AUTO_4756 - TRUCK
      ?AUTO_4757 - LOCATION
      ?AUTO_4758 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4754 ?AUTO_4756 ) ( TRUCK-AT ?AUTO_4756 ?AUTO_4757 ) ( IN-CITY ?AUTO_4757 ?AUTO_4758 ) ( IN-CITY ?AUTO_4755 ?AUTO_4758 ) ( not ( = ?AUTO_4755 ?AUTO_4757 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4756 ?AUTO_4757 ?AUTO_4755 ?AUTO_4758 )
      ( DELIVER-PKG ?AUTO_4754 ?AUTO_4755 )
      ( DELIVER-PKG-VERIFY ?AUTO_4754 ?AUTO_4755 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4759 - OBJ
      ?AUTO_4760 - LOCATION
    )
    :vars
    (
      ?AUTO_4761 - TRUCK
      ?AUTO_4762 - LOCATION
      ?AUTO_4763 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4761 ?AUTO_4762 ) ( IN-CITY ?AUTO_4762 ?AUTO_4763 ) ( IN-CITY ?AUTO_4760 ?AUTO_4763 ) ( not ( = ?AUTO_4760 ?AUTO_4762 ) ) ( OBJ-AT ?AUTO_4759 ?AUTO_4762 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4759 ?AUTO_4761 ?AUTO_4762 )
      ( DELIVER-PKG ?AUTO_4759 ?AUTO_4760 )
      ( DELIVER-PKG-VERIFY ?AUTO_4759 ?AUTO_4760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4768 - OBJ
      ?AUTO_4769 - LOCATION
    )
    :vars
    (
      ?AUTO_4771 - TRUCK
      ?AUTO_4772 - LOCATION
      ?AUTO_4770 - CITY
      ?AUTO_4773 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4771 ?AUTO_4772 ) ( IN-CITY ?AUTO_4772 ?AUTO_4770 ) ( IN-CITY ?AUTO_4769 ?AUTO_4770 ) ( not ( = ?AUTO_4769 ?AUTO_4772 ) ) ( IN-AIRPLANE ?AUTO_4768 ?AUTO_4773 ) ( AIRPLANE-AT ?AUTO_4773 ?AUTO_4772 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4768 ?AUTO_4773 ?AUTO_4772 )
      ( DELIVER-PKG ?AUTO_4768 ?AUTO_4769 )
      ( DELIVER-PKG-VERIFY ?AUTO_4768 ?AUTO_4769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4774 - OBJ
      ?AUTO_4775 - LOCATION
    )
    :vars
    (
      ?AUTO_4776 - TRUCK
      ?AUTO_4778 - LOCATION
      ?AUTO_4777 - CITY
      ?AUTO_4779 - AIRPLANE
      ?AUTO_4780 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4776 ?AUTO_4778 ) ( IN-CITY ?AUTO_4778 ?AUTO_4777 ) ( IN-CITY ?AUTO_4775 ?AUTO_4777 ) ( not ( = ?AUTO_4775 ?AUTO_4778 ) ) ( IN-AIRPLANE ?AUTO_4774 ?AUTO_4779 ) ( AIRPORT ?AUTO_4780 ) ( AIRPORT ?AUTO_4778 ) ( AIRPLANE-AT ?AUTO_4779 ?AUTO_4780 ) ( not ( = ?AUTO_4780 ?AUTO_4778 ) ) ( not ( = ?AUTO_4775 ?AUTO_4780 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4779 ?AUTO_4780 ?AUTO_4778 )
      ( DELIVER-PKG ?AUTO_4774 ?AUTO_4775 )
      ( DELIVER-PKG-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4783 - OBJ
      ?AUTO_4784 - LOCATION
    )
    :vars
    (
      ?AUTO_4787 - TRUCK
      ?AUTO_4789 - LOCATION
      ?AUTO_4785 - CITY
      ?AUTO_4788 - LOCATION
      ?AUTO_4786 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4787 ?AUTO_4789 ) ( IN-CITY ?AUTO_4789 ?AUTO_4785 ) ( IN-CITY ?AUTO_4784 ?AUTO_4785 ) ( not ( = ?AUTO_4784 ?AUTO_4789 ) ) ( AIRPORT ?AUTO_4788 ) ( AIRPORT ?AUTO_4789 ) ( AIRPLANE-AT ?AUTO_4786 ?AUTO_4788 ) ( not ( = ?AUTO_4788 ?AUTO_4789 ) ) ( not ( = ?AUTO_4784 ?AUTO_4788 ) ) ( OBJ-AT ?AUTO_4783 ?AUTO_4788 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4783 ?AUTO_4786 ?AUTO_4788 )
      ( DELIVER-PKG ?AUTO_4783 ?AUTO_4784 )
      ( DELIVER-PKG-VERIFY ?AUTO_4783 ?AUTO_4784 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4790 - OBJ
      ?AUTO_4791 - LOCATION
    )
    :vars
    (
      ?AUTO_4795 - TRUCK
      ?AUTO_4796 - LOCATION
      ?AUTO_4794 - CITY
      ?AUTO_4792 - LOCATION
      ?AUTO_4793 - AIRPLANE
      ?AUTO_4797 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4795 ?AUTO_4796 ) ( IN-CITY ?AUTO_4796 ?AUTO_4794 ) ( IN-CITY ?AUTO_4791 ?AUTO_4794 ) ( not ( = ?AUTO_4791 ?AUTO_4796 ) ) ( AIRPORT ?AUTO_4792 ) ( AIRPORT ?AUTO_4796 ) ( AIRPLANE-AT ?AUTO_4793 ?AUTO_4792 ) ( not ( = ?AUTO_4792 ?AUTO_4796 ) ) ( not ( = ?AUTO_4791 ?AUTO_4792 ) ) ( TRUCK-AT ?AUTO_4797 ?AUTO_4792 ) ( IN-TRUCK ?AUTO_4790 ?AUTO_4797 ) ( not ( = ?AUTO_4795 ?AUTO_4797 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4790 ?AUTO_4797 ?AUTO_4792 )
      ( DELIVER-PKG ?AUTO_4790 ?AUTO_4791 )
      ( DELIVER-PKG-VERIFY ?AUTO_4790 ?AUTO_4791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4798 - OBJ
      ?AUTO_4799 - LOCATION
    )
    :vars
    (
      ?AUTO_4800 - TRUCK
      ?AUTO_4802 - LOCATION
      ?AUTO_4804 - CITY
      ?AUTO_4803 - LOCATION
      ?AUTO_4801 - AIRPLANE
      ?AUTO_4805 - TRUCK
      ?AUTO_4806 - LOCATION
      ?AUTO_4807 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4800 ?AUTO_4802 ) ( IN-CITY ?AUTO_4802 ?AUTO_4804 ) ( IN-CITY ?AUTO_4799 ?AUTO_4804 ) ( not ( = ?AUTO_4799 ?AUTO_4802 ) ) ( AIRPORT ?AUTO_4803 ) ( AIRPORT ?AUTO_4802 ) ( AIRPLANE-AT ?AUTO_4801 ?AUTO_4803 ) ( not ( = ?AUTO_4803 ?AUTO_4802 ) ) ( not ( = ?AUTO_4799 ?AUTO_4803 ) ) ( IN-TRUCK ?AUTO_4798 ?AUTO_4805 ) ( not ( = ?AUTO_4800 ?AUTO_4805 ) ) ( TRUCK-AT ?AUTO_4805 ?AUTO_4806 ) ( IN-CITY ?AUTO_4806 ?AUTO_4807 ) ( IN-CITY ?AUTO_4803 ?AUTO_4807 ) ( not ( = ?AUTO_4803 ?AUTO_4806 ) ) ( not ( = ?AUTO_4799 ?AUTO_4806 ) ) ( not ( = ?AUTO_4802 ?AUTO_4806 ) ) ( not ( = ?AUTO_4804 ?AUTO_4807 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4805 ?AUTO_4806 ?AUTO_4803 ?AUTO_4807 )
      ( DELIVER-PKG ?AUTO_4798 ?AUTO_4799 )
      ( DELIVER-PKG-VERIFY ?AUTO_4798 ?AUTO_4799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4848 - OBJ
      ?AUTO_4849 - LOCATION
    )
    :vars
    (
      ?AUTO_4855 - TRUCK
      ?AUTO_4850 - LOCATION
      ?AUTO_4854 - CITY
      ?AUTO_4851 - LOCATION
      ?AUTO_4852 - AIRPLANE
      ?AUTO_4853 - TRUCK
      ?AUTO_4856 - LOCATION
      ?AUTO_4857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4855 ?AUTO_4850 ) ( IN-CITY ?AUTO_4850 ?AUTO_4854 ) ( IN-CITY ?AUTO_4849 ?AUTO_4854 ) ( not ( = ?AUTO_4849 ?AUTO_4850 ) ) ( AIRPORT ?AUTO_4851 ) ( AIRPORT ?AUTO_4850 ) ( AIRPLANE-AT ?AUTO_4852 ?AUTO_4851 ) ( not ( = ?AUTO_4851 ?AUTO_4850 ) ) ( not ( = ?AUTO_4849 ?AUTO_4851 ) ) ( not ( = ?AUTO_4855 ?AUTO_4853 ) ) ( TRUCK-AT ?AUTO_4853 ?AUTO_4856 ) ( IN-CITY ?AUTO_4856 ?AUTO_4857 ) ( IN-CITY ?AUTO_4851 ?AUTO_4857 ) ( not ( = ?AUTO_4851 ?AUTO_4856 ) ) ( not ( = ?AUTO_4849 ?AUTO_4856 ) ) ( not ( = ?AUTO_4850 ?AUTO_4856 ) ) ( not ( = ?AUTO_4854 ?AUTO_4857 ) ) ( OBJ-AT ?AUTO_4848 ?AUTO_4856 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4848 ?AUTO_4853 ?AUTO_4856 )
      ( DELIVER-PKG ?AUTO_4848 ?AUTO_4849 )
      ( DELIVER-PKG-VERIFY ?AUTO_4848 ?AUTO_4849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4860 - OBJ
      ?AUTO_4861 - LOCATION
    )
    :vars
    (
      ?AUTO_4868 - TRUCK
      ?AUTO_4864 - LOCATION
      ?AUTO_4862 - CITY
      ?AUTO_4865 - LOCATION
      ?AUTO_4869 - AIRPLANE
      ?AUTO_4866 - TRUCK
      ?AUTO_4867 - LOCATION
      ?AUTO_4863 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4868 ?AUTO_4864 ) ( IN-CITY ?AUTO_4864 ?AUTO_4862 ) ( IN-CITY ?AUTO_4861 ?AUTO_4862 ) ( not ( = ?AUTO_4861 ?AUTO_4864 ) ) ( AIRPORT ?AUTO_4865 ) ( AIRPORT ?AUTO_4864 ) ( AIRPLANE-AT ?AUTO_4869 ?AUTO_4865 ) ( not ( = ?AUTO_4865 ?AUTO_4864 ) ) ( not ( = ?AUTO_4861 ?AUTO_4865 ) ) ( not ( = ?AUTO_4868 ?AUTO_4866 ) ) ( IN-CITY ?AUTO_4867 ?AUTO_4863 ) ( IN-CITY ?AUTO_4865 ?AUTO_4863 ) ( not ( = ?AUTO_4865 ?AUTO_4867 ) ) ( not ( = ?AUTO_4861 ?AUTO_4867 ) ) ( not ( = ?AUTO_4864 ?AUTO_4867 ) ) ( not ( = ?AUTO_4862 ?AUTO_4863 ) ) ( OBJ-AT ?AUTO_4860 ?AUTO_4867 ) ( TRUCK-AT ?AUTO_4866 ?AUTO_4865 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4866 ?AUTO_4865 ?AUTO_4867 ?AUTO_4863 )
      ( DELIVER-PKG ?AUTO_4860 ?AUTO_4861 )
      ( DELIVER-PKG-VERIFY ?AUTO_4860 ?AUTO_4861 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4872 - OBJ
      ?AUTO_4873 - LOCATION
    )
    :vars
    (
      ?AUTO_4874 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4872 ?AUTO_4874 ) ( AIRPLANE-AT ?AUTO_4874 ?AUTO_4873 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4872 ?AUTO_4874 ?AUTO_4873 )
      ( DELIVER-PKG-VERIFY ?AUTO_4872 ?AUTO_4873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4953 - OBJ
      ?AUTO_4954 - LOCATION
    )
    :vars
    (
      ?AUTO_4955 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4955 ?AUTO_4954 ) ( IN-TRUCK ?AUTO_4953 ?AUTO_4955 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4953 ?AUTO_4955 ?AUTO_4954 )
      ( DELIVER-PKG-VERIFY ?AUTO_4953 ?AUTO_4954 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4964 - OBJ
      ?AUTO_4965 - LOCATION
    )
    :vars
    (
      ?AUTO_4966 - TRUCK
      ?AUTO_4967 - LOCATION
      ?AUTO_4968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4964 ?AUTO_4966 ) ( TRUCK-AT ?AUTO_4966 ?AUTO_4967 ) ( IN-CITY ?AUTO_4967 ?AUTO_4968 ) ( IN-CITY ?AUTO_4965 ?AUTO_4968 ) ( not ( = ?AUTO_4965 ?AUTO_4967 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4966 ?AUTO_4967 ?AUTO_4965 ?AUTO_4968 )
      ( DELIVER-PKG ?AUTO_4964 ?AUTO_4965 )
      ( DELIVER-PKG-VERIFY ?AUTO_4964 ?AUTO_4965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4969 - OBJ
      ?AUTO_4970 - LOCATION
    )
    :vars
    (
      ?AUTO_4971 - TRUCK
      ?AUTO_4972 - LOCATION
      ?AUTO_4973 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4971 ?AUTO_4972 ) ( IN-CITY ?AUTO_4972 ?AUTO_4973 ) ( IN-CITY ?AUTO_4970 ?AUTO_4973 ) ( not ( = ?AUTO_4970 ?AUTO_4972 ) ) ( OBJ-AT ?AUTO_4969 ?AUTO_4972 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4969 ?AUTO_4971 ?AUTO_4972 )
      ( DELIVER-PKG ?AUTO_4969 ?AUTO_4970 )
      ( DELIVER-PKG-VERIFY ?AUTO_4969 ?AUTO_4970 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4978 - OBJ
      ?AUTO_4979 - LOCATION
    )
    :vars
    (
      ?AUTO_4982 - TRUCK
      ?AUTO_4981 - LOCATION
      ?AUTO_4980 - CITY
      ?AUTO_4983 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4982 ?AUTO_4981 ) ( IN-CITY ?AUTO_4981 ?AUTO_4980 ) ( IN-CITY ?AUTO_4979 ?AUTO_4980 ) ( not ( = ?AUTO_4979 ?AUTO_4981 ) ) ( IN-AIRPLANE ?AUTO_4978 ?AUTO_4983 ) ( AIRPLANE-AT ?AUTO_4983 ?AUTO_4981 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4978 ?AUTO_4983 ?AUTO_4981 )
      ( DELIVER-PKG ?AUTO_4978 ?AUTO_4979 )
      ( DELIVER-PKG-VERIFY ?AUTO_4978 ?AUTO_4979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5032 - OBJ
      ?AUTO_5033 - LOCATION
    )
    :vars
    (
      ?AUTO_5040 - TRUCK
      ?AUTO_5041 - LOCATION
      ?AUTO_5038 - CITY
      ?AUTO_5037 - LOCATION
      ?AUTO_5039 - AIRPLANE
      ?AUTO_5036 - TRUCK
      ?AUTO_5034 - LOCATION
      ?AUTO_5035 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5040 ?AUTO_5041 ) ( IN-CITY ?AUTO_5041 ?AUTO_5038 ) ( IN-CITY ?AUTO_5033 ?AUTO_5038 ) ( not ( = ?AUTO_5033 ?AUTO_5041 ) ) ( AIRPORT ?AUTO_5037 ) ( AIRPORT ?AUTO_5041 ) ( AIRPLANE-AT ?AUTO_5039 ?AUTO_5037 ) ( not ( = ?AUTO_5037 ?AUTO_5041 ) ) ( not ( = ?AUTO_5033 ?AUTO_5037 ) ) ( not ( = ?AUTO_5040 ?AUTO_5036 ) ) ( TRUCK-AT ?AUTO_5036 ?AUTO_5034 ) ( IN-CITY ?AUTO_5034 ?AUTO_5035 ) ( IN-CITY ?AUTO_5037 ?AUTO_5035 ) ( not ( = ?AUTO_5037 ?AUTO_5034 ) ) ( not ( = ?AUTO_5033 ?AUTO_5034 ) ) ( not ( = ?AUTO_5041 ?AUTO_5034 ) ) ( not ( = ?AUTO_5038 ?AUTO_5035 ) ) ( OBJ-AT ?AUTO_5032 ?AUTO_5034 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5032 ?AUTO_5036 ?AUTO_5034 )
      ( DELIVER-PKG ?AUTO_5032 ?AUTO_5033 )
      ( DELIVER-PKG-VERIFY ?AUTO_5032 ?AUTO_5033 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5054 - OBJ
      ?AUTO_5055 - LOCATION
    )
    :vars
    (
      ?AUTO_5056 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5056 ?AUTO_5055 ) ( IN-TRUCK ?AUTO_5054 ?AUTO_5056 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5054 ?AUTO_5056 ?AUTO_5055 )
      ( DELIVER-PKG-VERIFY ?AUTO_5054 ?AUTO_5055 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5063 - OBJ
      ?AUTO_5064 - LOCATION
    )
    :vars
    (
      ?AUTO_5065 - TRUCK
      ?AUTO_5066 - LOCATION
      ?AUTO_5067 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5063 ?AUTO_5065 ) ( TRUCK-AT ?AUTO_5065 ?AUTO_5066 ) ( IN-CITY ?AUTO_5066 ?AUTO_5067 ) ( IN-CITY ?AUTO_5064 ?AUTO_5067 ) ( not ( = ?AUTO_5064 ?AUTO_5066 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5065 ?AUTO_5066 ?AUTO_5064 ?AUTO_5067 )
      ( DELIVER-PKG ?AUTO_5063 ?AUTO_5064 )
      ( DELIVER-PKG-VERIFY ?AUTO_5063 ?AUTO_5064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5068 - OBJ
      ?AUTO_5069 - LOCATION
    )
    :vars
    (
      ?AUTO_5070 - TRUCK
      ?AUTO_5071 - LOCATION
      ?AUTO_5072 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5070 ?AUTO_5071 ) ( IN-CITY ?AUTO_5071 ?AUTO_5072 ) ( IN-CITY ?AUTO_5069 ?AUTO_5072 ) ( not ( = ?AUTO_5069 ?AUTO_5071 ) ) ( OBJ-AT ?AUTO_5068 ?AUTO_5071 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5068 ?AUTO_5070 ?AUTO_5071 )
      ( DELIVER-PKG ?AUTO_5068 ?AUTO_5069 )
      ( DELIVER-PKG-VERIFY ?AUTO_5068 ?AUTO_5069 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5095 - OBJ
      ?AUTO_5096 - LOCATION
    )
    :vars
    (
      ?AUTO_5097 - LOCATION
      ?AUTO_5099 - CITY
      ?AUTO_5100 - AIRPLANE
      ?AUTO_5098 - TRUCK
      ?AUTO_5101 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5097 ?AUTO_5099 ) ( IN-CITY ?AUTO_5096 ?AUTO_5099 ) ( not ( = ?AUTO_5096 ?AUTO_5097 ) ) ( IN-AIRPLANE ?AUTO_5095 ?AUTO_5100 ) ( AIRPLANE-AT ?AUTO_5100 ?AUTO_5097 ) ( TRUCK-AT ?AUTO_5098 ?AUTO_5101 ) ( IN-CITY ?AUTO_5101 ?AUTO_5099 ) ( not ( = ?AUTO_5097 ?AUTO_5101 ) ) ( not ( = ?AUTO_5096 ?AUTO_5101 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5098 ?AUTO_5101 ?AUTO_5097 ?AUTO_5099 )
      ( DELIVER-PKG ?AUTO_5095 ?AUTO_5096 )
      ( DELIVER-PKG-VERIFY ?AUTO_5095 ?AUTO_5096 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5102 - OBJ
      ?AUTO_5103 - LOCATION
    )
    :vars
    (
      ?AUTO_5108 - LOCATION
      ?AUTO_5104 - CITY
      ?AUTO_5105 - AIRPLANE
      ?AUTO_5107 - TRUCK
      ?AUTO_5106 - LOCATION
      ?AUTO_5109 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5108 ?AUTO_5104 ) ( IN-CITY ?AUTO_5103 ?AUTO_5104 ) ( not ( = ?AUTO_5103 ?AUTO_5108 ) ) ( IN-AIRPLANE ?AUTO_5102 ?AUTO_5105 ) ( TRUCK-AT ?AUTO_5107 ?AUTO_5106 ) ( IN-CITY ?AUTO_5106 ?AUTO_5104 ) ( not ( = ?AUTO_5108 ?AUTO_5106 ) ) ( not ( = ?AUTO_5103 ?AUTO_5106 ) ) ( AIRPORT ?AUTO_5109 ) ( AIRPORT ?AUTO_5108 ) ( AIRPLANE-AT ?AUTO_5105 ?AUTO_5109 ) ( not ( = ?AUTO_5109 ?AUTO_5108 ) ) ( not ( = ?AUTO_5103 ?AUTO_5109 ) ) ( not ( = ?AUTO_5106 ?AUTO_5109 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5105 ?AUTO_5109 ?AUTO_5108 )
      ( DELIVER-PKG ?AUTO_5102 ?AUTO_5103 )
      ( DELIVER-PKG-VERIFY ?AUTO_5102 ?AUTO_5103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5120 - OBJ
      ?AUTO_5121 - LOCATION
    )
    :vars
    (
      ?AUTO_5127 - LOCATION
      ?AUTO_5126 - CITY
      ?AUTO_5125 - TRUCK
      ?AUTO_5122 - LOCATION
      ?AUTO_5124 - LOCATION
      ?AUTO_5123 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5127 ?AUTO_5126 ) ( IN-CITY ?AUTO_5121 ?AUTO_5126 ) ( not ( = ?AUTO_5121 ?AUTO_5127 ) ) ( TRUCK-AT ?AUTO_5125 ?AUTO_5122 ) ( IN-CITY ?AUTO_5122 ?AUTO_5126 ) ( not ( = ?AUTO_5127 ?AUTO_5122 ) ) ( not ( = ?AUTO_5121 ?AUTO_5122 ) ) ( AIRPORT ?AUTO_5124 ) ( AIRPORT ?AUTO_5127 ) ( AIRPLANE-AT ?AUTO_5123 ?AUTO_5124 ) ( not ( = ?AUTO_5124 ?AUTO_5127 ) ) ( not ( = ?AUTO_5121 ?AUTO_5124 ) ) ( not ( = ?AUTO_5122 ?AUTO_5124 ) ) ( OBJ-AT ?AUTO_5120 ?AUTO_5124 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5120 ?AUTO_5123 ?AUTO_5124 )
      ( DELIVER-PKG ?AUTO_5120 ?AUTO_5121 )
      ( DELIVER-PKG-VERIFY ?AUTO_5120 ?AUTO_5121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5130 - OBJ
      ?AUTO_5131 - LOCATION
    )
    :vars
    (
      ?AUTO_5135 - LOCATION
      ?AUTO_5136 - CITY
      ?AUTO_5137 - TRUCK
      ?AUTO_5134 - LOCATION
      ?AUTO_5132 - LOCATION
      ?AUTO_5138 - LOCATION
      ?AUTO_5133 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5135 ?AUTO_5136 ) ( IN-CITY ?AUTO_5131 ?AUTO_5136 ) ( not ( = ?AUTO_5131 ?AUTO_5135 ) ) ( TRUCK-AT ?AUTO_5137 ?AUTO_5134 ) ( IN-CITY ?AUTO_5134 ?AUTO_5136 ) ( not ( = ?AUTO_5135 ?AUTO_5134 ) ) ( not ( = ?AUTO_5131 ?AUTO_5134 ) ) ( AIRPORT ?AUTO_5132 ) ( AIRPORT ?AUTO_5135 ) ( not ( = ?AUTO_5132 ?AUTO_5135 ) ) ( not ( = ?AUTO_5131 ?AUTO_5132 ) ) ( not ( = ?AUTO_5134 ?AUTO_5132 ) ) ( OBJ-AT ?AUTO_5130 ?AUTO_5132 ) ( AIRPORT ?AUTO_5138 ) ( AIRPLANE-AT ?AUTO_5133 ?AUTO_5138 ) ( not ( = ?AUTO_5138 ?AUTO_5132 ) ) ( not ( = ?AUTO_5131 ?AUTO_5138 ) ) ( not ( = ?AUTO_5135 ?AUTO_5138 ) ) ( not ( = ?AUTO_5134 ?AUTO_5138 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5133 ?AUTO_5138 ?AUTO_5132 )
      ( DELIVER-PKG ?AUTO_5130 ?AUTO_5131 )
      ( DELIVER-PKG-VERIFY ?AUTO_5130 ?AUTO_5131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5143 - OBJ
      ?AUTO_5144 - LOCATION
    )
    :vars
    (
      ?AUTO_5148 - LOCATION
      ?AUTO_5150 - CITY
      ?AUTO_5146 - TRUCK
      ?AUTO_5145 - LOCATION
      ?AUTO_5149 - LOCATION
      ?AUTO_5151 - LOCATION
      ?AUTO_5147 - AIRPLANE
      ?AUTO_5152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5148 ?AUTO_5150 ) ( IN-CITY ?AUTO_5144 ?AUTO_5150 ) ( not ( = ?AUTO_5144 ?AUTO_5148 ) ) ( TRUCK-AT ?AUTO_5146 ?AUTO_5145 ) ( IN-CITY ?AUTO_5145 ?AUTO_5150 ) ( not ( = ?AUTO_5148 ?AUTO_5145 ) ) ( not ( = ?AUTO_5144 ?AUTO_5145 ) ) ( AIRPORT ?AUTO_5149 ) ( AIRPORT ?AUTO_5148 ) ( not ( = ?AUTO_5149 ?AUTO_5148 ) ) ( not ( = ?AUTO_5144 ?AUTO_5149 ) ) ( not ( = ?AUTO_5145 ?AUTO_5149 ) ) ( AIRPORT ?AUTO_5151 ) ( AIRPLANE-AT ?AUTO_5147 ?AUTO_5151 ) ( not ( = ?AUTO_5151 ?AUTO_5149 ) ) ( not ( = ?AUTO_5144 ?AUTO_5151 ) ) ( not ( = ?AUTO_5148 ?AUTO_5151 ) ) ( not ( = ?AUTO_5145 ?AUTO_5151 ) ) ( TRUCK-AT ?AUTO_5152 ?AUTO_5149 ) ( IN-TRUCK ?AUTO_5143 ?AUTO_5152 ) ( not ( = ?AUTO_5146 ?AUTO_5152 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5143 ?AUTO_5152 ?AUTO_5149 )
      ( DELIVER-PKG ?AUTO_5143 ?AUTO_5144 )
      ( DELIVER-PKG-VERIFY ?AUTO_5143 ?AUTO_5144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5157 - OBJ
      ?AUTO_5158 - LOCATION
    )
    :vars
    (
      ?AUTO_5164 - LOCATION
      ?AUTO_5162 - CITY
      ?AUTO_5160 - TRUCK
      ?AUTO_5161 - LOCATION
      ?AUTO_5163 - LOCATION
      ?AUTO_5165 - LOCATION
      ?AUTO_5159 - AIRPLANE
      ?AUTO_5166 - TRUCK
      ?AUTO_5167 - LOCATION
      ?AUTO_5168 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5164 ?AUTO_5162 ) ( IN-CITY ?AUTO_5158 ?AUTO_5162 ) ( not ( = ?AUTO_5158 ?AUTO_5164 ) ) ( TRUCK-AT ?AUTO_5160 ?AUTO_5161 ) ( IN-CITY ?AUTO_5161 ?AUTO_5162 ) ( not ( = ?AUTO_5164 ?AUTO_5161 ) ) ( not ( = ?AUTO_5158 ?AUTO_5161 ) ) ( AIRPORT ?AUTO_5163 ) ( AIRPORT ?AUTO_5164 ) ( not ( = ?AUTO_5163 ?AUTO_5164 ) ) ( not ( = ?AUTO_5158 ?AUTO_5163 ) ) ( not ( = ?AUTO_5161 ?AUTO_5163 ) ) ( AIRPORT ?AUTO_5165 ) ( AIRPLANE-AT ?AUTO_5159 ?AUTO_5165 ) ( not ( = ?AUTO_5165 ?AUTO_5163 ) ) ( not ( = ?AUTO_5158 ?AUTO_5165 ) ) ( not ( = ?AUTO_5164 ?AUTO_5165 ) ) ( not ( = ?AUTO_5161 ?AUTO_5165 ) ) ( IN-TRUCK ?AUTO_5157 ?AUTO_5166 ) ( not ( = ?AUTO_5160 ?AUTO_5166 ) ) ( TRUCK-AT ?AUTO_5166 ?AUTO_5167 ) ( IN-CITY ?AUTO_5167 ?AUTO_5168 ) ( IN-CITY ?AUTO_5163 ?AUTO_5168 ) ( not ( = ?AUTO_5163 ?AUTO_5167 ) ) ( not ( = ?AUTO_5158 ?AUTO_5167 ) ) ( not ( = ?AUTO_5164 ?AUTO_5167 ) ) ( not ( = ?AUTO_5162 ?AUTO_5168 ) ) ( not ( = ?AUTO_5161 ?AUTO_5167 ) ) ( not ( = ?AUTO_5165 ?AUTO_5167 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5166 ?AUTO_5167 ?AUTO_5163 ?AUTO_5168 )
      ( DELIVER-PKG ?AUTO_5157 ?AUTO_5158 )
      ( DELIVER-PKG-VERIFY ?AUTO_5157 ?AUTO_5158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5169 - OBJ
      ?AUTO_5170 - LOCATION
    )
    :vars
    (
      ?AUTO_5177 - LOCATION
      ?AUTO_5173 - CITY
      ?AUTO_5176 - TRUCK
      ?AUTO_5174 - LOCATION
      ?AUTO_5175 - LOCATION
      ?AUTO_5171 - LOCATION
      ?AUTO_5178 - AIRPLANE
      ?AUTO_5172 - TRUCK
      ?AUTO_5180 - LOCATION
      ?AUTO_5179 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5177 ?AUTO_5173 ) ( IN-CITY ?AUTO_5170 ?AUTO_5173 ) ( not ( = ?AUTO_5170 ?AUTO_5177 ) ) ( TRUCK-AT ?AUTO_5176 ?AUTO_5174 ) ( IN-CITY ?AUTO_5174 ?AUTO_5173 ) ( not ( = ?AUTO_5177 ?AUTO_5174 ) ) ( not ( = ?AUTO_5170 ?AUTO_5174 ) ) ( AIRPORT ?AUTO_5175 ) ( AIRPORT ?AUTO_5177 ) ( not ( = ?AUTO_5175 ?AUTO_5177 ) ) ( not ( = ?AUTO_5170 ?AUTO_5175 ) ) ( not ( = ?AUTO_5174 ?AUTO_5175 ) ) ( AIRPORT ?AUTO_5171 ) ( AIRPLANE-AT ?AUTO_5178 ?AUTO_5171 ) ( not ( = ?AUTO_5171 ?AUTO_5175 ) ) ( not ( = ?AUTO_5170 ?AUTO_5171 ) ) ( not ( = ?AUTO_5177 ?AUTO_5171 ) ) ( not ( = ?AUTO_5174 ?AUTO_5171 ) ) ( not ( = ?AUTO_5176 ?AUTO_5172 ) ) ( TRUCK-AT ?AUTO_5172 ?AUTO_5180 ) ( IN-CITY ?AUTO_5180 ?AUTO_5179 ) ( IN-CITY ?AUTO_5175 ?AUTO_5179 ) ( not ( = ?AUTO_5175 ?AUTO_5180 ) ) ( not ( = ?AUTO_5170 ?AUTO_5180 ) ) ( not ( = ?AUTO_5177 ?AUTO_5180 ) ) ( not ( = ?AUTO_5173 ?AUTO_5179 ) ) ( not ( = ?AUTO_5174 ?AUTO_5180 ) ) ( not ( = ?AUTO_5171 ?AUTO_5180 ) ) ( OBJ-AT ?AUTO_5169 ?AUTO_5180 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5169 ?AUTO_5172 ?AUTO_5180 )
      ( DELIVER-PKG ?AUTO_5169 ?AUTO_5170 )
      ( DELIVER-PKG-VERIFY ?AUTO_5169 ?AUTO_5170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5197 - OBJ
      ?AUTO_5198 - LOCATION
    )
    :vars
    (
      ?AUTO_5199 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5199 ?AUTO_5198 ) ( IN-TRUCK ?AUTO_5197 ?AUTO_5199 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5197 ?AUTO_5199 ?AUTO_5198 )
      ( DELIVER-PKG-VERIFY ?AUTO_5197 ?AUTO_5198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5200 - OBJ
      ?AUTO_5201 - LOCATION
    )
    :vars
    (
      ?AUTO_5202 - TRUCK
      ?AUTO_5203 - LOCATION
      ?AUTO_5204 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5200 ?AUTO_5202 ) ( TRUCK-AT ?AUTO_5202 ?AUTO_5203 ) ( IN-CITY ?AUTO_5203 ?AUTO_5204 ) ( IN-CITY ?AUTO_5201 ?AUTO_5204 ) ( not ( = ?AUTO_5201 ?AUTO_5203 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5202 ?AUTO_5203 ?AUTO_5201 ?AUTO_5204 )
      ( DELIVER-PKG ?AUTO_5200 ?AUTO_5201 )
      ( DELIVER-PKG-VERIFY ?AUTO_5200 ?AUTO_5201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5205 - OBJ
      ?AUTO_5206 - LOCATION
    )
    :vars
    (
      ?AUTO_5207 - TRUCK
      ?AUTO_5208 - LOCATION
      ?AUTO_5209 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5207 ?AUTO_5208 ) ( IN-CITY ?AUTO_5208 ?AUTO_5209 ) ( IN-CITY ?AUTO_5206 ?AUTO_5209 ) ( not ( = ?AUTO_5206 ?AUTO_5208 ) ) ( OBJ-AT ?AUTO_5205 ?AUTO_5208 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5205 ?AUTO_5207 ?AUTO_5208 )
      ( DELIVER-PKG ?AUTO_5205 ?AUTO_5206 )
      ( DELIVER-PKG-VERIFY ?AUTO_5205 ?AUTO_5206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5210 - OBJ
      ?AUTO_5211 - LOCATION
    )
    :vars
    (
      ?AUTO_5212 - LOCATION
      ?AUTO_5214 - CITY
      ?AUTO_5213 - TRUCK
      ?AUTO_5215 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5212 ?AUTO_5214 ) ( IN-CITY ?AUTO_5211 ?AUTO_5214 ) ( not ( = ?AUTO_5211 ?AUTO_5212 ) ) ( OBJ-AT ?AUTO_5210 ?AUTO_5212 ) ( TRUCK-AT ?AUTO_5213 ?AUTO_5215 ) ( IN-CITY ?AUTO_5215 ?AUTO_5214 ) ( not ( = ?AUTO_5212 ?AUTO_5215 ) ) ( not ( = ?AUTO_5211 ?AUTO_5215 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5213 ?AUTO_5215 ?AUTO_5212 ?AUTO_5214 )
      ( DELIVER-PKG ?AUTO_5210 ?AUTO_5211 )
      ( DELIVER-PKG-VERIFY ?AUTO_5210 ?AUTO_5211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5300 - OBJ
      ?AUTO_5301 - LOCATION
    )
    :vars
    (
      ?AUTO_5302 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5302 ?AUTO_5301 ) ( IN-TRUCK ?AUTO_5300 ?AUTO_5302 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5300 ?AUTO_5302 ?AUTO_5301 )
      ( DELIVER-PKG-VERIFY ?AUTO_5300 ?AUTO_5301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5303 - OBJ
      ?AUTO_5304 - LOCATION
    )
    :vars
    (
      ?AUTO_5305 - TRUCK
      ?AUTO_5306 - LOCATION
      ?AUTO_5307 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5303 ?AUTO_5305 ) ( TRUCK-AT ?AUTO_5305 ?AUTO_5306 ) ( IN-CITY ?AUTO_5306 ?AUTO_5307 ) ( IN-CITY ?AUTO_5304 ?AUTO_5307 ) ( not ( = ?AUTO_5304 ?AUTO_5306 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5305 ?AUTO_5306 ?AUTO_5304 ?AUTO_5307 )
      ( DELIVER-PKG ?AUTO_5303 ?AUTO_5304 )
      ( DELIVER-PKG-VERIFY ?AUTO_5303 ?AUTO_5304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5310 - OBJ
      ?AUTO_5311 - LOCATION
    )
    :vars
    (
      ?AUTO_5312 - TRUCK
      ?AUTO_5314 - LOCATION
      ?AUTO_5313 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5312 ?AUTO_5314 ) ( IN-CITY ?AUTO_5314 ?AUTO_5313 ) ( IN-CITY ?AUTO_5311 ?AUTO_5313 ) ( not ( = ?AUTO_5311 ?AUTO_5314 ) ) ( OBJ-AT ?AUTO_5310 ?AUTO_5314 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5310 ?AUTO_5312 ?AUTO_5314 )
      ( DELIVER-PKG ?AUTO_5310 ?AUTO_5311 )
      ( DELIVER-PKG-VERIFY ?AUTO_5310 ?AUTO_5311 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5317 - OBJ
      ?AUTO_5318 - LOCATION
    )
    :vars
    (
      ?AUTO_5320 - LOCATION
      ?AUTO_5321 - CITY
      ?AUTO_5319 - TRUCK
      ?AUTO_5322 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5320 ?AUTO_5321 ) ( IN-CITY ?AUTO_5318 ?AUTO_5321 ) ( not ( = ?AUTO_5318 ?AUTO_5320 ) ) ( OBJ-AT ?AUTO_5317 ?AUTO_5320 ) ( TRUCK-AT ?AUTO_5319 ?AUTO_5322 ) ( IN-CITY ?AUTO_5322 ?AUTO_5321 ) ( not ( = ?AUTO_5320 ?AUTO_5322 ) ) ( not ( = ?AUTO_5318 ?AUTO_5322 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5319 ?AUTO_5322 ?AUTO_5320 ?AUTO_5321 )
      ( DELIVER-PKG ?AUTO_5317 ?AUTO_5318 )
      ( DELIVER-PKG-VERIFY ?AUTO_5317 ?AUTO_5318 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5325 - OBJ
      ?AUTO_5326 - LOCATION
    )
    :vars
    (
      ?AUTO_5329 - LOCATION
      ?AUTO_5327 - CITY
      ?AUTO_5328 - LOCATION
      ?AUTO_5330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5329 ?AUTO_5327 ) ( IN-CITY ?AUTO_5326 ?AUTO_5327 ) ( not ( = ?AUTO_5326 ?AUTO_5329 ) ) ( OBJ-AT ?AUTO_5325 ?AUTO_5329 ) ( IN-CITY ?AUTO_5328 ?AUTO_5327 ) ( not ( = ?AUTO_5329 ?AUTO_5328 ) ) ( not ( = ?AUTO_5326 ?AUTO_5328 ) ) ( TRUCK-AT ?AUTO_5330 ?AUTO_5326 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5330 ?AUTO_5326 ?AUTO_5328 ?AUTO_5327 )
      ( DELIVER-PKG ?AUTO_5325 ?AUTO_5326 )
      ( DELIVER-PKG-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5375 - OBJ
      ?AUTO_5376 - LOCATION
    )
    :vars
    (
      ?AUTO_5378 - LOCATION
      ?AUTO_5377 - CITY
      ?AUTO_5380 - LOCATION
      ?AUTO_5379 - TRUCK
      ?AUTO_5381 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5378 ?AUTO_5377 ) ( IN-CITY ?AUTO_5376 ?AUTO_5377 ) ( not ( = ?AUTO_5376 ?AUTO_5378 ) ) ( IN-CITY ?AUTO_5380 ?AUTO_5377 ) ( not ( = ?AUTO_5378 ?AUTO_5380 ) ) ( not ( = ?AUTO_5376 ?AUTO_5380 ) ) ( TRUCK-AT ?AUTO_5379 ?AUTO_5376 ) ( IN-AIRPLANE ?AUTO_5375 ?AUTO_5381 ) ( AIRPLANE-AT ?AUTO_5381 ?AUTO_5378 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5375 ?AUTO_5381 ?AUTO_5378 )
      ( DELIVER-PKG ?AUTO_5375 ?AUTO_5376 )
      ( DELIVER-PKG-VERIFY ?AUTO_5375 ?AUTO_5376 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5382 - OBJ
      ?AUTO_5383 - LOCATION
    )
    :vars
    (
      ?AUTO_5385 - LOCATION
      ?AUTO_5386 - CITY
      ?AUTO_5384 - LOCATION
      ?AUTO_5387 - TRUCK
      ?AUTO_5388 - AIRPLANE
      ?AUTO_5389 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5385 ?AUTO_5386 ) ( IN-CITY ?AUTO_5383 ?AUTO_5386 ) ( not ( = ?AUTO_5383 ?AUTO_5385 ) ) ( IN-CITY ?AUTO_5384 ?AUTO_5386 ) ( not ( = ?AUTO_5385 ?AUTO_5384 ) ) ( not ( = ?AUTO_5383 ?AUTO_5384 ) ) ( TRUCK-AT ?AUTO_5387 ?AUTO_5383 ) ( IN-AIRPLANE ?AUTO_5382 ?AUTO_5388 ) ( AIRPORT ?AUTO_5389 ) ( AIRPORT ?AUTO_5385 ) ( AIRPLANE-AT ?AUTO_5388 ?AUTO_5389 ) ( not ( = ?AUTO_5389 ?AUTO_5385 ) ) ( not ( = ?AUTO_5383 ?AUTO_5389 ) ) ( not ( = ?AUTO_5384 ?AUTO_5389 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5388 ?AUTO_5389 ?AUTO_5385 )
      ( DELIVER-PKG ?AUTO_5382 ?AUTO_5383 )
      ( DELIVER-PKG-VERIFY ?AUTO_5382 ?AUTO_5383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5398 - OBJ
      ?AUTO_5399 - LOCATION
    )
    :vars
    (
      ?AUTO_5403 - LOCATION
      ?AUTO_5401 - CITY
      ?AUTO_5404 - LOCATION
      ?AUTO_5400 - TRUCK
      ?AUTO_5405 - LOCATION
      ?AUTO_5402 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5403 ?AUTO_5401 ) ( IN-CITY ?AUTO_5399 ?AUTO_5401 ) ( not ( = ?AUTO_5399 ?AUTO_5403 ) ) ( IN-CITY ?AUTO_5404 ?AUTO_5401 ) ( not ( = ?AUTO_5403 ?AUTO_5404 ) ) ( not ( = ?AUTO_5399 ?AUTO_5404 ) ) ( TRUCK-AT ?AUTO_5400 ?AUTO_5399 ) ( AIRPORT ?AUTO_5405 ) ( AIRPORT ?AUTO_5403 ) ( AIRPLANE-AT ?AUTO_5402 ?AUTO_5405 ) ( not ( = ?AUTO_5405 ?AUTO_5403 ) ) ( not ( = ?AUTO_5399 ?AUTO_5405 ) ) ( not ( = ?AUTO_5404 ?AUTO_5405 ) ) ( OBJ-AT ?AUTO_5398 ?AUTO_5405 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5398 ?AUTO_5402 ?AUTO_5405 )
      ( DELIVER-PKG ?AUTO_5398 ?AUTO_5399 )
      ( DELIVER-PKG-VERIFY ?AUTO_5398 ?AUTO_5399 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5432 - OBJ
      ?AUTO_5433 - LOCATION
    )
    :vars
    (
      ?AUTO_5434 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5434 ?AUTO_5433 ) ( IN-TRUCK ?AUTO_5432 ?AUTO_5434 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5432 ?AUTO_5434 ?AUTO_5433 )
      ( DELIVER-PKG-VERIFY ?AUTO_5432 ?AUTO_5433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5439 - OBJ
      ?AUTO_5440 - LOCATION
    )
    :vars
    (
      ?AUTO_5442 - TRUCK
      ?AUTO_5441 - LOCATION
      ?AUTO_5443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5442 ?AUTO_5441 ) ( IN-CITY ?AUTO_5441 ?AUTO_5443 ) ( IN-CITY ?AUTO_5440 ?AUTO_5443 ) ( not ( = ?AUTO_5440 ?AUTO_5441 ) ) ( OBJ-AT ?AUTO_5439 ?AUTO_5441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5439 ?AUTO_5442 ?AUTO_5441 )
      ( DELIVER-PKG ?AUTO_5439 ?AUTO_5440 )
      ( DELIVER-PKG-VERIFY ?AUTO_5439 ?AUTO_5440 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5496 - OBJ
      ?AUTO_5497 - LOCATION
    )
    :vars
    (
      ?AUTO_5501 - LOCATION
      ?AUTO_5498 - CITY
      ?AUTO_5500 - LOCATION
      ?AUTO_5499 - TRUCK
      ?AUTO_5502 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5501 ?AUTO_5498 ) ( IN-CITY ?AUTO_5497 ?AUTO_5498 ) ( not ( = ?AUTO_5497 ?AUTO_5501 ) ) ( IN-CITY ?AUTO_5500 ?AUTO_5498 ) ( not ( = ?AUTO_5501 ?AUTO_5500 ) ) ( not ( = ?AUTO_5497 ?AUTO_5500 ) ) ( TRUCK-AT ?AUTO_5499 ?AUTO_5497 ) ( IN-AIRPLANE ?AUTO_5496 ?AUTO_5502 ) ( AIRPLANE-AT ?AUTO_5502 ?AUTO_5501 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5496 ?AUTO_5502 ?AUTO_5501 )
      ( DELIVER-PKG ?AUTO_5496 ?AUTO_5497 )
      ( DELIVER-PKG-VERIFY ?AUTO_5496 ?AUTO_5497 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5509 - OBJ
      ?AUTO_5510 - LOCATION
    )
    :vars
    (
      ?AUTO_5516 - LOCATION
      ?AUTO_5512 - CITY
      ?AUTO_5511 - LOCATION
      ?AUTO_5514 - TRUCK
      ?AUTO_5515 - LOCATION
      ?AUTO_5513 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5516 ?AUTO_5512 ) ( IN-CITY ?AUTO_5510 ?AUTO_5512 ) ( not ( = ?AUTO_5510 ?AUTO_5516 ) ) ( IN-CITY ?AUTO_5511 ?AUTO_5512 ) ( not ( = ?AUTO_5516 ?AUTO_5511 ) ) ( not ( = ?AUTO_5510 ?AUTO_5511 ) ) ( TRUCK-AT ?AUTO_5514 ?AUTO_5510 ) ( AIRPORT ?AUTO_5515 ) ( AIRPORT ?AUTO_5516 ) ( AIRPLANE-AT ?AUTO_5513 ?AUTO_5515 ) ( not ( = ?AUTO_5515 ?AUTO_5516 ) ) ( not ( = ?AUTO_5510 ?AUTO_5515 ) ) ( not ( = ?AUTO_5511 ?AUTO_5515 ) ) ( OBJ-AT ?AUTO_5509 ?AUTO_5515 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5509 ?AUTO_5513 ?AUTO_5515 )
      ( DELIVER-PKG ?AUTO_5509 ?AUTO_5510 )
      ( DELIVER-PKG-VERIFY ?AUTO_5509 ?AUTO_5510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5517 - OBJ
      ?AUTO_5518 - LOCATION
    )
    :vars
    (
      ?AUTO_5519 - LOCATION
      ?AUTO_5520 - CITY
      ?AUTO_5524 - LOCATION
      ?AUTO_5523 - TRUCK
      ?AUTO_5522 - LOCATION
      ?AUTO_5525 - LOCATION
      ?AUTO_5521 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5519 ?AUTO_5520 ) ( IN-CITY ?AUTO_5518 ?AUTO_5520 ) ( not ( = ?AUTO_5518 ?AUTO_5519 ) ) ( IN-CITY ?AUTO_5524 ?AUTO_5520 ) ( not ( = ?AUTO_5519 ?AUTO_5524 ) ) ( not ( = ?AUTO_5518 ?AUTO_5524 ) ) ( TRUCK-AT ?AUTO_5523 ?AUTO_5518 ) ( AIRPORT ?AUTO_5522 ) ( AIRPORT ?AUTO_5519 ) ( not ( = ?AUTO_5522 ?AUTO_5519 ) ) ( not ( = ?AUTO_5518 ?AUTO_5522 ) ) ( not ( = ?AUTO_5524 ?AUTO_5522 ) ) ( OBJ-AT ?AUTO_5517 ?AUTO_5522 ) ( AIRPORT ?AUTO_5525 ) ( AIRPLANE-AT ?AUTO_5521 ?AUTO_5525 ) ( not ( = ?AUTO_5525 ?AUTO_5522 ) ) ( not ( = ?AUTO_5518 ?AUTO_5525 ) ) ( not ( = ?AUTO_5519 ?AUTO_5525 ) ) ( not ( = ?AUTO_5524 ?AUTO_5525 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5521 ?AUTO_5525 ?AUTO_5522 )
      ( DELIVER-PKG ?AUTO_5517 ?AUTO_5518 )
      ( DELIVER-PKG-VERIFY ?AUTO_5517 ?AUTO_5518 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5534 - OBJ
      ?AUTO_5535 - LOCATION
    )
    :vars
    (
      ?AUTO_5542 - LOCATION
      ?AUTO_5537 - CITY
      ?AUTO_5538 - LOCATION
      ?AUTO_5536 - TRUCK
      ?AUTO_5540 - LOCATION
      ?AUTO_5541 - LOCATION
      ?AUTO_5539 - AIRPLANE
      ?AUTO_5543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5542 ?AUTO_5537 ) ( IN-CITY ?AUTO_5535 ?AUTO_5537 ) ( not ( = ?AUTO_5535 ?AUTO_5542 ) ) ( IN-CITY ?AUTO_5538 ?AUTO_5537 ) ( not ( = ?AUTO_5542 ?AUTO_5538 ) ) ( not ( = ?AUTO_5535 ?AUTO_5538 ) ) ( TRUCK-AT ?AUTO_5536 ?AUTO_5535 ) ( AIRPORT ?AUTO_5540 ) ( AIRPORT ?AUTO_5542 ) ( not ( = ?AUTO_5540 ?AUTO_5542 ) ) ( not ( = ?AUTO_5535 ?AUTO_5540 ) ) ( not ( = ?AUTO_5538 ?AUTO_5540 ) ) ( AIRPORT ?AUTO_5541 ) ( AIRPLANE-AT ?AUTO_5539 ?AUTO_5541 ) ( not ( = ?AUTO_5541 ?AUTO_5540 ) ) ( not ( = ?AUTO_5535 ?AUTO_5541 ) ) ( not ( = ?AUTO_5542 ?AUTO_5541 ) ) ( not ( = ?AUTO_5538 ?AUTO_5541 ) ) ( TRUCK-AT ?AUTO_5543 ?AUTO_5540 ) ( IN-TRUCK ?AUTO_5534 ?AUTO_5543 ) ( not ( = ?AUTO_5536 ?AUTO_5543 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5534 ?AUTO_5543 ?AUTO_5540 )
      ( DELIVER-PKG ?AUTO_5534 ?AUTO_5535 )
      ( DELIVER-PKG-VERIFY ?AUTO_5534 ?AUTO_5535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5552 - OBJ
      ?AUTO_5553 - LOCATION
    )
    :vars
    (
      ?AUTO_5560 - LOCATION
      ?AUTO_5559 - CITY
      ?AUTO_5556 - LOCATION
      ?AUTO_5561 - TRUCK
      ?AUTO_5555 - LOCATION
      ?AUTO_5558 - LOCATION
      ?AUTO_5557 - AIRPLANE
      ?AUTO_5554 - TRUCK
      ?AUTO_5562 - LOCATION
      ?AUTO_5563 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5560 ?AUTO_5559 ) ( IN-CITY ?AUTO_5553 ?AUTO_5559 ) ( not ( = ?AUTO_5553 ?AUTO_5560 ) ) ( IN-CITY ?AUTO_5556 ?AUTO_5559 ) ( not ( = ?AUTO_5560 ?AUTO_5556 ) ) ( not ( = ?AUTO_5553 ?AUTO_5556 ) ) ( TRUCK-AT ?AUTO_5561 ?AUTO_5553 ) ( AIRPORT ?AUTO_5555 ) ( AIRPORT ?AUTO_5560 ) ( not ( = ?AUTO_5555 ?AUTO_5560 ) ) ( not ( = ?AUTO_5553 ?AUTO_5555 ) ) ( not ( = ?AUTO_5556 ?AUTO_5555 ) ) ( AIRPORT ?AUTO_5558 ) ( AIRPLANE-AT ?AUTO_5557 ?AUTO_5558 ) ( not ( = ?AUTO_5558 ?AUTO_5555 ) ) ( not ( = ?AUTO_5553 ?AUTO_5558 ) ) ( not ( = ?AUTO_5560 ?AUTO_5558 ) ) ( not ( = ?AUTO_5556 ?AUTO_5558 ) ) ( IN-TRUCK ?AUTO_5552 ?AUTO_5554 ) ( not ( = ?AUTO_5561 ?AUTO_5554 ) ) ( TRUCK-AT ?AUTO_5554 ?AUTO_5562 ) ( IN-CITY ?AUTO_5562 ?AUTO_5563 ) ( IN-CITY ?AUTO_5555 ?AUTO_5563 ) ( not ( = ?AUTO_5555 ?AUTO_5562 ) ) ( not ( = ?AUTO_5553 ?AUTO_5562 ) ) ( not ( = ?AUTO_5560 ?AUTO_5562 ) ) ( not ( = ?AUTO_5559 ?AUTO_5563 ) ) ( not ( = ?AUTO_5556 ?AUTO_5562 ) ) ( not ( = ?AUTO_5558 ?AUTO_5562 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5554 ?AUTO_5562 ?AUTO_5555 ?AUTO_5563 )
      ( DELIVER-PKG ?AUTO_5552 ?AUTO_5553 )
      ( DELIVER-PKG-VERIFY ?AUTO_5552 ?AUTO_5553 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5564 - OBJ
      ?AUTO_5565 - LOCATION
    )
    :vars
    (
      ?AUTO_5572 - LOCATION
      ?AUTO_5567 - CITY
      ?AUTO_5571 - LOCATION
      ?AUTO_5566 - TRUCK
      ?AUTO_5569 - LOCATION
      ?AUTO_5573 - LOCATION
      ?AUTO_5574 - AIRPLANE
      ?AUTO_5575 - TRUCK
      ?AUTO_5568 - LOCATION
      ?AUTO_5570 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5572 ?AUTO_5567 ) ( IN-CITY ?AUTO_5565 ?AUTO_5567 ) ( not ( = ?AUTO_5565 ?AUTO_5572 ) ) ( IN-CITY ?AUTO_5571 ?AUTO_5567 ) ( not ( = ?AUTO_5572 ?AUTO_5571 ) ) ( not ( = ?AUTO_5565 ?AUTO_5571 ) ) ( TRUCK-AT ?AUTO_5566 ?AUTO_5565 ) ( AIRPORT ?AUTO_5569 ) ( AIRPORT ?AUTO_5572 ) ( not ( = ?AUTO_5569 ?AUTO_5572 ) ) ( not ( = ?AUTO_5565 ?AUTO_5569 ) ) ( not ( = ?AUTO_5571 ?AUTO_5569 ) ) ( AIRPORT ?AUTO_5573 ) ( AIRPLANE-AT ?AUTO_5574 ?AUTO_5573 ) ( not ( = ?AUTO_5573 ?AUTO_5569 ) ) ( not ( = ?AUTO_5565 ?AUTO_5573 ) ) ( not ( = ?AUTO_5572 ?AUTO_5573 ) ) ( not ( = ?AUTO_5571 ?AUTO_5573 ) ) ( not ( = ?AUTO_5566 ?AUTO_5575 ) ) ( TRUCK-AT ?AUTO_5575 ?AUTO_5568 ) ( IN-CITY ?AUTO_5568 ?AUTO_5570 ) ( IN-CITY ?AUTO_5569 ?AUTO_5570 ) ( not ( = ?AUTO_5569 ?AUTO_5568 ) ) ( not ( = ?AUTO_5565 ?AUTO_5568 ) ) ( not ( = ?AUTO_5572 ?AUTO_5568 ) ) ( not ( = ?AUTO_5567 ?AUTO_5570 ) ) ( not ( = ?AUTO_5571 ?AUTO_5568 ) ) ( not ( = ?AUTO_5573 ?AUTO_5568 ) ) ( OBJ-AT ?AUTO_5564 ?AUTO_5568 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5564 ?AUTO_5575 ?AUTO_5568 )
      ( DELIVER-PKG ?AUTO_5564 ?AUTO_5565 )
      ( DELIVER-PKG-VERIFY ?AUTO_5564 ?AUTO_5565 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5578 - OBJ
      ?AUTO_5579 - LOCATION
    )
    :vars
    (
      ?AUTO_5589 - LOCATION
      ?AUTO_5580 - CITY
      ?AUTO_5588 - LOCATION
      ?AUTO_5581 - TRUCK
      ?AUTO_5587 - LOCATION
      ?AUTO_5585 - LOCATION
      ?AUTO_5586 - AIRPLANE
      ?AUTO_5582 - TRUCK
      ?AUTO_5584 - LOCATION
      ?AUTO_5583 - CITY
      ?AUTO_5590 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5589 ?AUTO_5580 ) ( IN-CITY ?AUTO_5579 ?AUTO_5580 ) ( not ( = ?AUTO_5579 ?AUTO_5589 ) ) ( IN-CITY ?AUTO_5588 ?AUTO_5580 ) ( not ( = ?AUTO_5589 ?AUTO_5588 ) ) ( not ( = ?AUTO_5579 ?AUTO_5588 ) ) ( TRUCK-AT ?AUTO_5581 ?AUTO_5579 ) ( AIRPORT ?AUTO_5587 ) ( AIRPORT ?AUTO_5589 ) ( not ( = ?AUTO_5587 ?AUTO_5589 ) ) ( not ( = ?AUTO_5579 ?AUTO_5587 ) ) ( not ( = ?AUTO_5588 ?AUTO_5587 ) ) ( AIRPORT ?AUTO_5585 ) ( AIRPLANE-AT ?AUTO_5586 ?AUTO_5585 ) ( not ( = ?AUTO_5585 ?AUTO_5587 ) ) ( not ( = ?AUTO_5579 ?AUTO_5585 ) ) ( not ( = ?AUTO_5589 ?AUTO_5585 ) ) ( not ( = ?AUTO_5588 ?AUTO_5585 ) ) ( not ( = ?AUTO_5581 ?AUTO_5582 ) ) ( IN-CITY ?AUTO_5584 ?AUTO_5583 ) ( IN-CITY ?AUTO_5587 ?AUTO_5583 ) ( not ( = ?AUTO_5587 ?AUTO_5584 ) ) ( not ( = ?AUTO_5579 ?AUTO_5584 ) ) ( not ( = ?AUTO_5589 ?AUTO_5584 ) ) ( not ( = ?AUTO_5580 ?AUTO_5583 ) ) ( not ( = ?AUTO_5588 ?AUTO_5584 ) ) ( not ( = ?AUTO_5585 ?AUTO_5584 ) ) ( OBJ-AT ?AUTO_5578 ?AUTO_5584 ) ( TRUCK-AT ?AUTO_5582 ?AUTO_5590 ) ( IN-CITY ?AUTO_5590 ?AUTO_5583 ) ( not ( = ?AUTO_5584 ?AUTO_5590 ) ) ( not ( = ?AUTO_5579 ?AUTO_5590 ) ) ( not ( = ?AUTO_5589 ?AUTO_5590 ) ) ( not ( = ?AUTO_5588 ?AUTO_5590 ) ) ( not ( = ?AUTO_5587 ?AUTO_5590 ) ) ( not ( = ?AUTO_5585 ?AUTO_5590 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5582 ?AUTO_5590 ?AUTO_5584 ?AUTO_5583 )
      ( DELIVER-PKG ?AUTO_5578 ?AUTO_5579 )
      ( DELIVER-PKG-VERIFY ?AUTO_5578 ?AUTO_5579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5595 - OBJ
      ?AUTO_5596 - LOCATION
    )
    :vars
    (
      ?AUTO_5597 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5595 ?AUTO_5597 ) ( AIRPLANE-AT ?AUTO_5597 ?AUTO_5596 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5595 ?AUTO_5597 ?AUTO_5596 )
      ( DELIVER-PKG-VERIFY ?AUTO_5595 ?AUTO_5596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5598 - OBJ
      ?AUTO_5599 - LOCATION
    )
    :vars
    (
      ?AUTO_5600 - AIRPLANE
      ?AUTO_5601 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5598 ?AUTO_5600 ) ( AIRPORT ?AUTO_5601 ) ( AIRPORT ?AUTO_5599 ) ( AIRPLANE-AT ?AUTO_5600 ?AUTO_5601 ) ( not ( = ?AUTO_5601 ?AUTO_5599 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5600 ?AUTO_5601 ?AUTO_5599 )
      ( DELIVER-PKG ?AUTO_5598 ?AUTO_5599 )
      ( DELIVER-PKG-VERIFY ?AUTO_5598 ?AUTO_5599 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5602 - OBJ
      ?AUTO_5603 - LOCATION
    )
    :vars
    (
      ?AUTO_5605 - LOCATION
      ?AUTO_5604 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5605 ) ( AIRPORT ?AUTO_5603 ) ( AIRPLANE-AT ?AUTO_5604 ?AUTO_5605 ) ( not ( = ?AUTO_5605 ?AUTO_5603 ) ) ( OBJ-AT ?AUTO_5602 ?AUTO_5605 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5602 ?AUTO_5604 ?AUTO_5605 )
      ( DELIVER-PKG ?AUTO_5602 ?AUTO_5603 )
      ( DELIVER-PKG-VERIFY ?AUTO_5602 ?AUTO_5603 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5606 - OBJ
      ?AUTO_5607 - LOCATION
    )
    :vars
    (
      ?AUTO_5609 - LOCATION
      ?AUTO_5608 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5609 ) ( AIRPORT ?AUTO_5607 ) ( not ( = ?AUTO_5609 ?AUTO_5607 ) ) ( OBJ-AT ?AUTO_5606 ?AUTO_5609 ) ( AIRPLANE-AT ?AUTO_5608 ?AUTO_5607 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5608 ?AUTO_5607 ?AUTO_5609 )
      ( DELIVER-PKG ?AUTO_5606 ?AUTO_5607 )
      ( DELIVER-PKG-VERIFY ?AUTO_5606 ?AUTO_5607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5620 - OBJ
      ?AUTO_5621 - LOCATION
    )
    :vars
    (
      ?AUTO_5622 - LOCATION
      ?AUTO_5623 - AIRPLANE
      ?AUTO_5624 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5622 ) ( AIRPORT ?AUTO_5621 ) ( not ( = ?AUTO_5622 ?AUTO_5621 ) ) ( AIRPLANE-AT ?AUTO_5623 ?AUTO_5621 ) ( TRUCK-AT ?AUTO_5624 ?AUTO_5622 ) ( IN-TRUCK ?AUTO_5620 ?AUTO_5624 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5620 ?AUTO_5624 ?AUTO_5622 )
      ( DELIVER-PKG ?AUTO_5620 ?AUTO_5621 )
      ( DELIVER-PKG-VERIFY ?AUTO_5620 ?AUTO_5621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5625 - OBJ
      ?AUTO_5626 - LOCATION
    )
    :vars
    (
      ?AUTO_5628 - LOCATION
      ?AUTO_5627 - AIRPLANE
      ?AUTO_5629 - TRUCK
      ?AUTO_5630 - LOCATION
      ?AUTO_5631 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5628 ) ( AIRPORT ?AUTO_5626 ) ( not ( = ?AUTO_5628 ?AUTO_5626 ) ) ( AIRPLANE-AT ?AUTO_5627 ?AUTO_5626 ) ( IN-TRUCK ?AUTO_5625 ?AUTO_5629 ) ( TRUCK-AT ?AUTO_5629 ?AUTO_5630 ) ( IN-CITY ?AUTO_5630 ?AUTO_5631 ) ( IN-CITY ?AUTO_5628 ?AUTO_5631 ) ( not ( = ?AUTO_5628 ?AUTO_5630 ) ) ( not ( = ?AUTO_5626 ?AUTO_5630 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5629 ?AUTO_5630 ?AUTO_5628 ?AUTO_5631 )
      ( DELIVER-PKG ?AUTO_5625 ?AUTO_5626 )
      ( DELIVER-PKG-VERIFY ?AUTO_5625 ?AUTO_5626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5632 - OBJ
      ?AUTO_5633 - LOCATION
    )
    :vars
    (
      ?AUTO_5635 - LOCATION
      ?AUTO_5634 - AIRPLANE
      ?AUTO_5638 - TRUCK
      ?AUTO_5637 - LOCATION
      ?AUTO_5636 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5635 ) ( AIRPORT ?AUTO_5633 ) ( not ( = ?AUTO_5635 ?AUTO_5633 ) ) ( AIRPLANE-AT ?AUTO_5634 ?AUTO_5633 ) ( TRUCK-AT ?AUTO_5638 ?AUTO_5637 ) ( IN-CITY ?AUTO_5637 ?AUTO_5636 ) ( IN-CITY ?AUTO_5635 ?AUTO_5636 ) ( not ( = ?AUTO_5635 ?AUTO_5637 ) ) ( not ( = ?AUTO_5633 ?AUTO_5637 ) ) ( OBJ-AT ?AUTO_5632 ?AUTO_5637 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5632 ?AUTO_5638 ?AUTO_5637 )
      ( DELIVER-PKG ?AUTO_5632 ?AUTO_5633 )
      ( DELIVER-PKG-VERIFY ?AUTO_5632 ?AUTO_5633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5639 - OBJ
      ?AUTO_5640 - LOCATION
    )
    :vars
    (
      ?AUTO_5642 - LOCATION
      ?AUTO_5641 - AIRPLANE
      ?AUTO_5645 - LOCATION
      ?AUTO_5644 - CITY
      ?AUTO_5643 - TRUCK
      ?AUTO_5646 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5642 ) ( AIRPORT ?AUTO_5640 ) ( not ( = ?AUTO_5642 ?AUTO_5640 ) ) ( AIRPLANE-AT ?AUTO_5641 ?AUTO_5640 ) ( IN-CITY ?AUTO_5645 ?AUTO_5644 ) ( IN-CITY ?AUTO_5642 ?AUTO_5644 ) ( not ( = ?AUTO_5642 ?AUTO_5645 ) ) ( not ( = ?AUTO_5640 ?AUTO_5645 ) ) ( OBJ-AT ?AUTO_5639 ?AUTO_5645 ) ( TRUCK-AT ?AUTO_5643 ?AUTO_5646 ) ( IN-CITY ?AUTO_5646 ?AUTO_5644 ) ( not ( = ?AUTO_5645 ?AUTO_5646 ) ) ( not ( = ?AUTO_5640 ?AUTO_5646 ) ) ( not ( = ?AUTO_5642 ?AUTO_5646 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5643 ?AUTO_5646 ?AUTO_5645 ?AUTO_5644 )
      ( DELIVER-PKG ?AUTO_5639 ?AUTO_5640 )
      ( DELIVER-PKG-VERIFY ?AUTO_5639 ?AUTO_5640 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5649 - OBJ
      ?AUTO_5650 - LOCATION
    )
    :vars
    (
      ?AUTO_5651 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5651 ?AUTO_5650 ) ( IN-TRUCK ?AUTO_5649 ?AUTO_5651 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5649 ?AUTO_5651 ?AUTO_5650 )
      ( DELIVER-PKG-VERIFY ?AUTO_5649 ?AUTO_5650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5652 - OBJ
      ?AUTO_5653 - LOCATION
    )
    :vars
    (
      ?AUTO_5654 - TRUCK
      ?AUTO_5655 - LOCATION
      ?AUTO_5656 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5652 ?AUTO_5654 ) ( TRUCK-AT ?AUTO_5654 ?AUTO_5655 ) ( IN-CITY ?AUTO_5655 ?AUTO_5656 ) ( IN-CITY ?AUTO_5653 ?AUTO_5656 ) ( not ( = ?AUTO_5653 ?AUTO_5655 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5654 ?AUTO_5655 ?AUTO_5653 ?AUTO_5656 )
      ( DELIVER-PKG ?AUTO_5652 ?AUTO_5653 )
      ( DELIVER-PKG-VERIFY ?AUTO_5652 ?AUTO_5653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5657 - OBJ
      ?AUTO_5658 - LOCATION
    )
    :vars
    (
      ?AUTO_5659 - TRUCK
      ?AUTO_5660 - LOCATION
      ?AUTO_5661 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5659 ?AUTO_5660 ) ( IN-CITY ?AUTO_5660 ?AUTO_5661 ) ( IN-CITY ?AUTO_5658 ?AUTO_5661 ) ( not ( = ?AUTO_5658 ?AUTO_5660 ) ) ( OBJ-AT ?AUTO_5657 ?AUTO_5660 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5657 ?AUTO_5659 ?AUTO_5660 )
      ( DELIVER-PKG ?AUTO_5657 ?AUTO_5658 )
      ( DELIVER-PKG-VERIFY ?AUTO_5657 ?AUTO_5658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5662 - OBJ
      ?AUTO_5663 - LOCATION
    )
    :vars
    (
      ?AUTO_5665 - LOCATION
      ?AUTO_5664 - CITY
      ?AUTO_5666 - TRUCK
      ?AUTO_5667 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5665 ?AUTO_5664 ) ( IN-CITY ?AUTO_5663 ?AUTO_5664 ) ( not ( = ?AUTO_5663 ?AUTO_5665 ) ) ( OBJ-AT ?AUTO_5662 ?AUTO_5665 ) ( TRUCK-AT ?AUTO_5666 ?AUTO_5667 ) ( IN-CITY ?AUTO_5667 ?AUTO_5664 ) ( not ( = ?AUTO_5665 ?AUTO_5667 ) ) ( not ( = ?AUTO_5663 ?AUTO_5667 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5666 ?AUTO_5667 ?AUTO_5665 ?AUTO_5664 )
      ( DELIVER-PKG ?AUTO_5662 ?AUTO_5663 )
      ( DELIVER-PKG-VERIFY ?AUTO_5662 ?AUTO_5663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5672 - OBJ
      ?AUTO_5673 - LOCATION
    )
    :vars
    (
      ?AUTO_5674 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5674 ?AUTO_5673 ) ( IN-TRUCK ?AUTO_5672 ?AUTO_5674 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5672 ?AUTO_5674 ?AUTO_5673 )
      ( DELIVER-PKG-VERIFY ?AUTO_5672 ?AUTO_5673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5675 - OBJ
      ?AUTO_5676 - LOCATION
    )
    :vars
    (
      ?AUTO_5677 - TRUCK
      ?AUTO_5678 - LOCATION
      ?AUTO_5679 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5675 ?AUTO_5677 ) ( TRUCK-AT ?AUTO_5677 ?AUTO_5678 ) ( IN-CITY ?AUTO_5678 ?AUTO_5679 ) ( IN-CITY ?AUTO_5676 ?AUTO_5679 ) ( not ( = ?AUTO_5676 ?AUTO_5678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5677 ?AUTO_5678 ?AUTO_5676 ?AUTO_5679 )
      ( DELIVER-PKG ?AUTO_5675 ?AUTO_5676 )
      ( DELIVER-PKG-VERIFY ?AUTO_5675 ?AUTO_5676 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5682 - OBJ
      ?AUTO_5683 - LOCATION
    )
    :vars
    (
      ?AUTO_5684 - TRUCK
      ?AUTO_5686 - LOCATION
      ?AUTO_5685 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5684 ?AUTO_5686 ) ( IN-CITY ?AUTO_5686 ?AUTO_5685 ) ( IN-CITY ?AUTO_5683 ?AUTO_5685 ) ( not ( = ?AUTO_5683 ?AUTO_5686 ) ) ( OBJ-AT ?AUTO_5682 ?AUTO_5686 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5682 ?AUTO_5684 ?AUTO_5686 )
      ( DELIVER-PKG ?AUTO_5682 ?AUTO_5683 )
      ( DELIVER-PKG-VERIFY ?AUTO_5682 ?AUTO_5683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5689 - OBJ
      ?AUTO_5690 - LOCATION
    )
    :vars
    (
      ?AUTO_5692 - LOCATION
      ?AUTO_5693 - CITY
      ?AUTO_5691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5692 ?AUTO_5693 ) ( IN-CITY ?AUTO_5690 ?AUTO_5693 ) ( not ( = ?AUTO_5690 ?AUTO_5692 ) ) ( OBJ-AT ?AUTO_5689 ?AUTO_5692 ) ( TRUCK-AT ?AUTO_5691 ?AUTO_5690 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5691 ?AUTO_5690 ?AUTO_5692 ?AUTO_5693 )
      ( DELIVER-PKG ?AUTO_5689 ?AUTO_5690 )
      ( DELIVER-PKG-VERIFY ?AUTO_5689 ?AUTO_5690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5714 - OBJ
      ?AUTO_5715 - LOCATION
    )
    :vars
    (
      ?AUTO_5716 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5716 ?AUTO_5715 ) ( IN-TRUCK ?AUTO_5714 ?AUTO_5716 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5714 ?AUTO_5716 ?AUTO_5715 )
      ( DELIVER-PKG-VERIFY ?AUTO_5714 ?AUTO_5715 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5717 - OBJ
      ?AUTO_5718 - LOCATION
    )
    :vars
    (
      ?AUTO_5719 - TRUCK
      ?AUTO_5720 - LOCATION
      ?AUTO_5721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5717 ?AUTO_5719 ) ( TRUCK-AT ?AUTO_5719 ?AUTO_5720 ) ( IN-CITY ?AUTO_5720 ?AUTO_5721 ) ( IN-CITY ?AUTO_5718 ?AUTO_5721 ) ( not ( = ?AUTO_5718 ?AUTO_5720 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5719 ?AUTO_5720 ?AUTO_5718 ?AUTO_5721 )
      ( DELIVER-PKG ?AUTO_5717 ?AUTO_5718 )
      ( DELIVER-PKG-VERIFY ?AUTO_5717 ?AUTO_5718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5732 - OBJ
      ?AUTO_5733 - LOCATION
    )
    :vars
    (
      ?AUTO_5735 - LOCATION
      ?AUTO_5736 - CITY
      ?AUTO_5734 - TRUCK
      ?AUTO_5737 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5735 ?AUTO_5736 ) ( IN-CITY ?AUTO_5733 ?AUTO_5736 ) ( not ( = ?AUTO_5733 ?AUTO_5735 ) ) ( OBJ-AT ?AUTO_5732 ?AUTO_5735 ) ( TRUCK-AT ?AUTO_5734 ?AUTO_5737 ) ( IN-CITY ?AUTO_5737 ?AUTO_5736 ) ( not ( = ?AUTO_5735 ?AUTO_5737 ) ) ( not ( = ?AUTO_5733 ?AUTO_5737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5734 ?AUTO_5737 ?AUTO_5735 ?AUTO_5736 )
      ( DELIVER-PKG ?AUTO_5732 ?AUTO_5733 )
      ( DELIVER-PKG-VERIFY ?AUTO_5732 ?AUTO_5733 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5758 - OBJ
      ?AUTO_5759 - LOCATION
    )
    :vars
    (
      ?AUTO_5760 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5758 ?AUTO_5760 ) ( AIRPLANE-AT ?AUTO_5760 ?AUTO_5759 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5758 ?AUTO_5760 ?AUTO_5759 )
      ( DELIVER-PKG-VERIFY ?AUTO_5758 ?AUTO_5759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5761 - OBJ
      ?AUTO_5762 - LOCATION
    )
    :vars
    (
      ?AUTO_5763 - AIRPLANE
      ?AUTO_5764 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5761 ?AUTO_5763 ) ( AIRPORT ?AUTO_5764 ) ( AIRPORT ?AUTO_5762 ) ( AIRPLANE-AT ?AUTO_5763 ?AUTO_5764 ) ( not ( = ?AUTO_5764 ?AUTO_5762 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5763 ?AUTO_5764 ?AUTO_5762 )
      ( DELIVER-PKG ?AUTO_5761 ?AUTO_5762 )
      ( DELIVER-PKG-VERIFY ?AUTO_5761 ?AUTO_5762 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5789 - OBJ
      ?AUTO_5790 - LOCATION
    )
    :vars
    (
      ?AUTO_5791 - LOCATION
      ?AUTO_5792 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5791 ) ( AIRPORT ?AUTO_5790 ) ( AIRPLANE-AT ?AUTO_5792 ?AUTO_5791 ) ( not ( = ?AUTO_5791 ?AUTO_5790 ) ) ( OBJ-AT ?AUTO_5789 ?AUTO_5791 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5789 ?AUTO_5792 ?AUTO_5791 )
      ( DELIVER-PKG ?AUTO_5789 ?AUTO_5790 )
      ( DELIVER-PKG-VERIFY ?AUTO_5789 ?AUTO_5790 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5801 - OBJ
      ?AUTO_5802 - LOCATION
    )
    :vars
    (
      ?AUTO_5803 - LOCATION
      ?AUTO_5805 - LOCATION
      ?AUTO_5804 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5803 ) ( AIRPORT ?AUTO_5802 ) ( not ( = ?AUTO_5803 ?AUTO_5802 ) ) ( OBJ-AT ?AUTO_5801 ?AUTO_5803 ) ( AIRPORT ?AUTO_5805 ) ( AIRPLANE-AT ?AUTO_5804 ?AUTO_5805 ) ( not ( = ?AUTO_5805 ?AUTO_5803 ) ) ( not ( = ?AUTO_5802 ?AUTO_5805 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5804 ?AUTO_5805 ?AUTO_5803 )
      ( DELIVER-PKG ?AUTO_5801 ?AUTO_5802 )
      ( DELIVER-PKG-VERIFY ?AUTO_5801 ?AUTO_5802 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5808 - OBJ
      ?AUTO_5809 - LOCATION
    )
    :vars
    (
      ?AUTO_5810 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5808 ?AUTO_5810 ) ( AIRPLANE-AT ?AUTO_5810 ?AUTO_5809 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5808 ?AUTO_5810 ?AUTO_5809 )
      ( DELIVER-PKG-VERIFY ?AUTO_5808 ?AUTO_5809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5815 - OBJ
      ?AUTO_5816 - LOCATION
    )
    :vars
    (
      ?AUTO_5817 - LOCATION
      ?AUTO_5818 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5817 ) ( AIRPORT ?AUTO_5816 ) ( AIRPLANE-AT ?AUTO_5818 ?AUTO_5817 ) ( not ( = ?AUTO_5817 ?AUTO_5816 ) ) ( OBJ-AT ?AUTO_5815 ?AUTO_5817 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5815 ?AUTO_5818 ?AUTO_5817 )
      ( DELIVER-PKG ?AUTO_5815 ?AUTO_5816 )
      ( DELIVER-PKG-VERIFY ?AUTO_5815 ?AUTO_5816 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5819 - OBJ
      ?AUTO_5820 - LOCATION
    )
    :vars
    (
      ?AUTO_5822 - LOCATION
      ?AUTO_5821 - AIRPLANE
      ?AUTO_5823 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5822 ) ( AIRPORT ?AUTO_5820 ) ( AIRPLANE-AT ?AUTO_5821 ?AUTO_5822 ) ( not ( = ?AUTO_5822 ?AUTO_5820 ) ) ( TRUCK-AT ?AUTO_5823 ?AUTO_5822 ) ( IN-TRUCK ?AUTO_5819 ?AUTO_5823 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5819 ?AUTO_5823 ?AUTO_5822 )
      ( DELIVER-PKG ?AUTO_5819 ?AUTO_5820 )
      ( DELIVER-PKG-VERIFY ?AUTO_5819 ?AUTO_5820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5824 - OBJ
      ?AUTO_5825 - LOCATION
    )
    :vars
    (
      ?AUTO_5826 - LOCATION
      ?AUTO_5827 - AIRPLANE
      ?AUTO_5828 - TRUCK
      ?AUTO_5829 - LOCATION
      ?AUTO_5830 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5826 ) ( AIRPORT ?AUTO_5825 ) ( AIRPLANE-AT ?AUTO_5827 ?AUTO_5826 ) ( not ( = ?AUTO_5826 ?AUTO_5825 ) ) ( IN-TRUCK ?AUTO_5824 ?AUTO_5828 ) ( TRUCK-AT ?AUTO_5828 ?AUTO_5829 ) ( IN-CITY ?AUTO_5829 ?AUTO_5830 ) ( IN-CITY ?AUTO_5826 ?AUTO_5830 ) ( not ( = ?AUTO_5826 ?AUTO_5829 ) ) ( not ( = ?AUTO_5825 ?AUTO_5829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5828 ?AUTO_5829 ?AUTO_5826 ?AUTO_5830 )
      ( DELIVER-PKG ?AUTO_5824 ?AUTO_5825 )
      ( DELIVER-PKG-VERIFY ?AUTO_5824 ?AUTO_5825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5839 - OBJ
      ?AUTO_5840 - LOCATION
    )
    :vars
    (
      ?AUTO_5844 - LOCATION
      ?AUTO_5842 - AIRPLANE
      ?AUTO_5843 - TRUCK
      ?AUTO_5845 - LOCATION
      ?AUTO_5841 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5844 ) ( AIRPORT ?AUTO_5840 ) ( AIRPLANE-AT ?AUTO_5842 ?AUTO_5844 ) ( not ( = ?AUTO_5844 ?AUTO_5840 ) ) ( TRUCK-AT ?AUTO_5843 ?AUTO_5845 ) ( IN-CITY ?AUTO_5845 ?AUTO_5841 ) ( IN-CITY ?AUTO_5844 ?AUTO_5841 ) ( not ( = ?AUTO_5844 ?AUTO_5845 ) ) ( not ( = ?AUTO_5840 ?AUTO_5845 ) ) ( OBJ-AT ?AUTO_5839 ?AUTO_5845 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5839 ?AUTO_5843 ?AUTO_5845 )
      ( DELIVER-PKG ?AUTO_5839 ?AUTO_5840 )
      ( DELIVER-PKG-VERIFY ?AUTO_5839 ?AUTO_5840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5846 - OBJ
      ?AUTO_5847 - LOCATION
    )
    :vars
    (
      ?AUTO_5851 - LOCATION
      ?AUTO_5849 - AIRPLANE
      ?AUTO_5848 - LOCATION
      ?AUTO_5850 - CITY
      ?AUTO_5852 - TRUCK
      ?AUTO_5853 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5851 ) ( AIRPORT ?AUTO_5847 ) ( AIRPLANE-AT ?AUTO_5849 ?AUTO_5851 ) ( not ( = ?AUTO_5851 ?AUTO_5847 ) ) ( IN-CITY ?AUTO_5848 ?AUTO_5850 ) ( IN-CITY ?AUTO_5851 ?AUTO_5850 ) ( not ( = ?AUTO_5851 ?AUTO_5848 ) ) ( not ( = ?AUTO_5847 ?AUTO_5848 ) ) ( OBJ-AT ?AUTO_5846 ?AUTO_5848 ) ( TRUCK-AT ?AUTO_5852 ?AUTO_5853 ) ( IN-CITY ?AUTO_5853 ?AUTO_5850 ) ( not ( = ?AUTO_5848 ?AUTO_5853 ) ) ( not ( = ?AUTO_5847 ?AUTO_5853 ) ) ( not ( = ?AUTO_5851 ?AUTO_5853 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5852 ?AUTO_5853 ?AUTO_5848 ?AUTO_5850 )
      ( DELIVER-PKG ?AUTO_5846 ?AUTO_5847 )
      ( DELIVER-PKG-VERIFY ?AUTO_5846 ?AUTO_5847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5856 - OBJ
      ?AUTO_5857 - LOCATION
    )
    :vars
    (
      ?AUTO_5861 - LOCATION
      ?AUTO_5858 - LOCATION
      ?AUTO_5862 - CITY
      ?AUTO_5860 - TRUCK
      ?AUTO_5859 - LOCATION
      ?AUTO_5864 - LOCATION
      ?AUTO_5863 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5861 ) ( AIRPORT ?AUTO_5857 ) ( not ( = ?AUTO_5861 ?AUTO_5857 ) ) ( IN-CITY ?AUTO_5858 ?AUTO_5862 ) ( IN-CITY ?AUTO_5861 ?AUTO_5862 ) ( not ( = ?AUTO_5861 ?AUTO_5858 ) ) ( not ( = ?AUTO_5857 ?AUTO_5858 ) ) ( OBJ-AT ?AUTO_5856 ?AUTO_5858 ) ( TRUCK-AT ?AUTO_5860 ?AUTO_5859 ) ( IN-CITY ?AUTO_5859 ?AUTO_5862 ) ( not ( = ?AUTO_5858 ?AUTO_5859 ) ) ( not ( = ?AUTO_5857 ?AUTO_5859 ) ) ( not ( = ?AUTO_5861 ?AUTO_5859 ) ) ( AIRPORT ?AUTO_5864 ) ( AIRPLANE-AT ?AUTO_5863 ?AUTO_5864 ) ( not ( = ?AUTO_5864 ?AUTO_5861 ) ) ( not ( = ?AUTO_5857 ?AUTO_5864 ) ) ( not ( = ?AUTO_5858 ?AUTO_5864 ) ) ( not ( = ?AUTO_5859 ?AUTO_5864 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5863 ?AUTO_5864 ?AUTO_5861 )
      ( DELIVER-PKG ?AUTO_5856 ?AUTO_5857 )
      ( DELIVER-PKG-VERIFY ?AUTO_5856 ?AUTO_5857 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5881 - OBJ
      ?AUTO_5882 - LOCATION
    )
    :vars
    (
      ?AUTO_5883 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5881 ?AUTO_5883 ) ( AIRPLANE-AT ?AUTO_5883 ?AUTO_5882 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5881 ?AUTO_5883 ?AUTO_5882 )
      ( DELIVER-PKG-VERIFY ?AUTO_5881 ?AUTO_5882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5928 - OBJ
      ?AUTO_5929 - LOCATION
    )
    :vars
    (
      ?AUTO_5930 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5930 ?AUTO_5929 ) ( IN-TRUCK ?AUTO_5928 ?AUTO_5930 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5928 ?AUTO_5930 ?AUTO_5929 )
      ( DELIVER-PKG-VERIFY ?AUTO_5928 ?AUTO_5929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5933 - OBJ
      ?AUTO_5934 - LOCATION
    )
    :vars
    (
      ?AUTO_5935 - TRUCK
      ?AUTO_5936 - LOCATION
      ?AUTO_5937 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5933 ?AUTO_5935 ) ( TRUCK-AT ?AUTO_5935 ?AUTO_5936 ) ( IN-CITY ?AUTO_5936 ?AUTO_5937 ) ( IN-CITY ?AUTO_5934 ?AUTO_5937 ) ( not ( = ?AUTO_5934 ?AUTO_5936 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5935 ?AUTO_5936 ?AUTO_5934 ?AUTO_5937 )
      ( DELIVER-PKG ?AUTO_5933 ?AUTO_5934 )
      ( DELIVER-PKG-VERIFY ?AUTO_5933 ?AUTO_5934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5942 - OBJ
      ?AUTO_5943 - LOCATION
    )
    :vars
    (
      ?AUTO_5946 - TRUCK
      ?AUTO_5944 - LOCATION
      ?AUTO_5945 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5946 ?AUTO_5944 ) ( IN-CITY ?AUTO_5944 ?AUTO_5945 ) ( IN-CITY ?AUTO_5943 ?AUTO_5945 ) ( not ( = ?AUTO_5943 ?AUTO_5944 ) ) ( OBJ-AT ?AUTO_5942 ?AUTO_5944 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5942 ?AUTO_5946 ?AUTO_5944 )
      ( DELIVER-PKG ?AUTO_5942 ?AUTO_5943 )
      ( DELIVER-PKG-VERIFY ?AUTO_5942 ?AUTO_5943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5951 - OBJ
      ?AUTO_5952 - LOCATION
    )
    :vars
    (
      ?AUTO_5955 - TRUCK
      ?AUTO_5953 - LOCATION
      ?AUTO_5954 - CITY
      ?AUTO_5956 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5955 ?AUTO_5953 ) ( IN-CITY ?AUTO_5953 ?AUTO_5954 ) ( IN-CITY ?AUTO_5952 ?AUTO_5954 ) ( not ( = ?AUTO_5952 ?AUTO_5953 ) ) ( IN-AIRPLANE ?AUTO_5951 ?AUTO_5956 ) ( AIRPLANE-AT ?AUTO_5956 ?AUTO_5953 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5951 ?AUTO_5956 ?AUTO_5953 )
      ( DELIVER-PKG ?AUTO_5951 ?AUTO_5952 )
      ( DELIVER-PKG-VERIFY ?AUTO_5951 ?AUTO_5952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5957 - OBJ
      ?AUTO_5958 - LOCATION
    )
    :vars
    (
      ?AUTO_5959 - TRUCK
      ?AUTO_5960 - LOCATION
      ?AUTO_5961 - CITY
      ?AUTO_5962 - AIRPLANE
      ?AUTO_5963 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5959 ?AUTO_5960 ) ( IN-CITY ?AUTO_5960 ?AUTO_5961 ) ( IN-CITY ?AUTO_5958 ?AUTO_5961 ) ( not ( = ?AUTO_5958 ?AUTO_5960 ) ) ( IN-AIRPLANE ?AUTO_5957 ?AUTO_5962 ) ( AIRPORT ?AUTO_5963 ) ( AIRPORT ?AUTO_5960 ) ( AIRPLANE-AT ?AUTO_5962 ?AUTO_5963 ) ( not ( = ?AUTO_5963 ?AUTO_5960 ) ) ( not ( = ?AUTO_5958 ?AUTO_5963 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5962 ?AUTO_5963 ?AUTO_5960 )
      ( DELIVER-PKG ?AUTO_5957 ?AUTO_5958 )
      ( DELIVER-PKG-VERIFY ?AUTO_5957 ?AUTO_5958 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5988 - OBJ
      ?AUTO_5989 - LOCATION
    )
    :vars
    (
      ?AUTO_5994 - TRUCK
      ?AUTO_5990 - LOCATION
      ?AUTO_5992 - CITY
      ?AUTO_5993 - LOCATION
      ?AUTO_5991 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5994 ?AUTO_5990 ) ( IN-CITY ?AUTO_5990 ?AUTO_5992 ) ( IN-CITY ?AUTO_5989 ?AUTO_5992 ) ( not ( = ?AUTO_5989 ?AUTO_5990 ) ) ( AIRPORT ?AUTO_5993 ) ( AIRPORT ?AUTO_5990 ) ( AIRPLANE-AT ?AUTO_5991 ?AUTO_5993 ) ( not ( = ?AUTO_5993 ?AUTO_5990 ) ) ( not ( = ?AUTO_5989 ?AUTO_5993 ) ) ( OBJ-AT ?AUTO_5988 ?AUTO_5993 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5988 ?AUTO_5991 ?AUTO_5993 )
      ( DELIVER-PKG ?AUTO_5988 ?AUTO_5989 )
      ( DELIVER-PKG-VERIFY ?AUTO_5988 ?AUTO_5989 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6003 - OBJ
      ?AUTO_6004 - LOCATION
    )
    :vars
    (
      ?AUTO_6009 - TRUCK
      ?AUTO_6006 - LOCATION
      ?AUTO_6008 - CITY
      ?AUTO_6007 - LOCATION
      ?AUTO_6010 - LOCATION
      ?AUTO_6005 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6009 ?AUTO_6006 ) ( IN-CITY ?AUTO_6006 ?AUTO_6008 ) ( IN-CITY ?AUTO_6004 ?AUTO_6008 ) ( not ( = ?AUTO_6004 ?AUTO_6006 ) ) ( AIRPORT ?AUTO_6007 ) ( AIRPORT ?AUTO_6006 ) ( not ( = ?AUTO_6007 ?AUTO_6006 ) ) ( not ( = ?AUTO_6004 ?AUTO_6007 ) ) ( OBJ-AT ?AUTO_6003 ?AUTO_6007 ) ( AIRPORT ?AUTO_6010 ) ( AIRPLANE-AT ?AUTO_6005 ?AUTO_6010 ) ( not ( = ?AUTO_6010 ?AUTO_6007 ) ) ( not ( = ?AUTO_6004 ?AUTO_6010 ) ) ( not ( = ?AUTO_6006 ?AUTO_6010 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6005 ?AUTO_6010 ?AUTO_6007 )
      ( DELIVER-PKG ?AUTO_6003 ?AUTO_6004 )
      ( DELIVER-PKG-VERIFY ?AUTO_6003 ?AUTO_6004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6013 - OBJ
      ?AUTO_6014 - LOCATION
    )
    :vars
    (
      ?AUTO_6015 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6013 ?AUTO_6015 ) ( AIRPLANE-AT ?AUTO_6015 ?AUTO_6014 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6013 ?AUTO_6015 ?AUTO_6014 )
      ( DELIVER-PKG-VERIFY ?AUTO_6013 ?AUTO_6014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6058 - OBJ
      ?AUTO_6059 - LOCATION
    )
    :vars
    (
      ?AUTO_6061 - LOCATION
      ?AUTO_6062 - LOCATION
      ?AUTO_6060 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6061 ) ( AIRPORT ?AUTO_6059 ) ( not ( = ?AUTO_6061 ?AUTO_6059 ) ) ( OBJ-AT ?AUTO_6058 ?AUTO_6061 ) ( AIRPORT ?AUTO_6062 ) ( AIRPLANE-AT ?AUTO_6060 ?AUTO_6062 ) ( not ( = ?AUTO_6062 ?AUTO_6061 ) ) ( not ( = ?AUTO_6059 ?AUTO_6062 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6060 ?AUTO_6062 ?AUTO_6061 )
      ( DELIVER-PKG ?AUTO_6058 ?AUTO_6059 )
      ( DELIVER-PKG-VERIFY ?AUTO_6058 ?AUTO_6059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6079 - OBJ
      ?AUTO_6080 - LOCATION
    )
    :vars
    (
      ?AUTO_6081 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6081 ?AUTO_6080 ) ( IN-TRUCK ?AUTO_6079 ?AUTO_6081 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6079 ?AUTO_6081 ?AUTO_6080 )
      ( DELIVER-PKG-VERIFY ?AUTO_6079 ?AUTO_6080 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6084 - OBJ
      ?AUTO_6085 - LOCATION
    )
    :vars
    (
      ?AUTO_6086 - TRUCK
      ?AUTO_6087 - LOCATION
      ?AUTO_6088 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6084 ?AUTO_6086 ) ( TRUCK-AT ?AUTO_6086 ?AUTO_6087 ) ( IN-CITY ?AUTO_6087 ?AUTO_6088 ) ( IN-CITY ?AUTO_6085 ?AUTO_6088 ) ( not ( = ?AUTO_6085 ?AUTO_6087 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6086 ?AUTO_6087 ?AUTO_6085 ?AUTO_6088 )
      ( DELIVER-PKG ?AUTO_6084 ?AUTO_6085 )
      ( DELIVER-PKG-VERIFY ?AUTO_6084 ?AUTO_6085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6097 - OBJ
      ?AUTO_6098 - LOCATION
    )
    :vars
    (
      ?AUTO_6100 - TRUCK
      ?AUTO_6101 - LOCATION
      ?AUTO_6099 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6100 ?AUTO_6101 ) ( IN-CITY ?AUTO_6101 ?AUTO_6099 ) ( IN-CITY ?AUTO_6098 ?AUTO_6099 ) ( not ( = ?AUTO_6098 ?AUTO_6101 ) ) ( OBJ-AT ?AUTO_6097 ?AUTO_6101 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6097 ?AUTO_6100 ?AUTO_6101 )
      ( DELIVER-PKG ?AUTO_6097 ?AUTO_6098 )
      ( DELIVER-PKG-VERIFY ?AUTO_6097 ?AUTO_6098 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6106 - OBJ
      ?AUTO_6107 - LOCATION
    )
    :vars
    (
      ?AUTO_6108 - TRUCK
      ?AUTO_6110 - LOCATION
      ?AUTO_6109 - CITY
      ?AUTO_6111 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6108 ?AUTO_6110 ) ( IN-CITY ?AUTO_6110 ?AUTO_6109 ) ( IN-CITY ?AUTO_6107 ?AUTO_6109 ) ( not ( = ?AUTO_6107 ?AUTO_6110 ) ) ( IN-AIRPLANE ?AUTO_6106 ?AUTO_6111 ) ( AIRPLANE-AT ?AUTO_6111 ?AUTO_6110 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6106 ?AUTO_6111 ?AUTO_6110 )
      ( DELIVER-PKG ?AUTO_6106 ?AUTO_6107 )
      ( DELIVER-PKG-VERIFY ?AUTO_6106 ?AUTO_6107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6116 - OBJ
      ?AUTO_6117 - LOCATION
    )
    :vars
    (
      ?AUTO_6120 - TRUCK
      ?AUTO_6121 - LOCATION
      ?AUTO_6118 - CITY
      ?AUTO_6122 - LOCATION
      ?AUTO_6119 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6120 ?AUTO_6121 ) ( IN-CITY ?AUTO_6121 ?AUTO_6118 ) ( IN-CITY ?AUTO_6117 ?AUTO_6118 ) ( not ( = ?AUTO_6117 ?AUTO_6121 ) ) ( AIRPORT ?AUTO_6122 ) ( AIRPORT ?AUTO_6121 ) ( AIRPLANE-AT ?AUTO_6119 ?AUTO_6122 ) ( not ( = ?AUTO_6122 ?AUTO_6121 ) ) ( not ( = ?AUTO_6117 ?AUTO_6122 ) ) ( OBJ-AT ?AUTO_6116 ?AUTO_6122 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6116 ?AUTO_6119 ?AUTO_6122 )
      ( DELIVER-PKG ?AUTO_6116 ?AUTO_6117 )
      ( DELIVER-PKG-VERIFY ?AUTO_6116 ?AUTO_6117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6123 - OBJ
      ?AUTO_6124 - LOCATION
    )
    :vars
    (
      ?AUTO_6128 - TRUCK
      ?AUTO_6127 - LOCATION
      ?AUTO_6125 - CITY
      ?AUTO_6129 - LOCATION
      ?AUTO_6126 - AIRPLANE
      ?AUTO_6130 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6128 ?AUTO_6127 ) ( IN-CITY ?AUTO_6127 ?AUTO_6125 ) ( IN-CITY ?AUTO_6124 ?AUTO_6125 ) ( not ( = ?AUTO_6124 ?AUTO_6127 ) ) ( AIRPORT ?AUTO_6129 ) ( AIRPORT ?AUTO_6127 ) ( AIRPLANE-AT ?AUTO_6126 ?AUTO_6129 ) ( not ( = ?AUTO_6129 ?AUTO_6127 ) ) ( not ( = ?AUTO_6124 ?AUTO_6129 ) ) ( TRUCK-AT ?AUTO_6130 ?AUTO_6129 ) ( IN-TRUCK ?AUTO_6123 ?AUTO_6130 ) ( not ( = ?AUTO_6128 ?AUTO_6130 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6123 ?AUTO_6130 ?AUTO_6129 )
      ( DELIVER-PKG ?AUTO_6123 ?AUTO_6124 )
      ( DELIVER-PKG-VERIFY ?AUTO_6123 ?AUTO_6124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6131 - OBJ
      ?AUTO_6132 - LOCATION
    )
    :vars
    (
      ?AUTO_6134 - TRUCK
      ?AUTO_6133 - LOCATION
      ?AUTO_6137 - CITY
      ?AUTO_6135 - LOCATION
      ?AUTO_6136 - AIRPLANE
      ?AUTO_6138 - TRUCK
      ?AUTO_6139 - LOCATION
      ?AUTO_6140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6134 ?AUTO_6133 ) ( IN-CITY ?AUTO_6133 ?AUTO_6137 ) ( IN-CITY ?AUTO_6132 ?AUTO_6137 ) ( not ( = ?AUTO_6132 ?AUTO_6133 ) ) ( AIRPORT ?AUTO_6135 ) ( AIRPORT ?AUTO_6133 ) ( AIRPLANE-AT ?AUTO_6136 ?AUTO_6135 ) ( not ( = ?AUTO_6135 ?AUTO_6133 ) ) ( not ( = ?AUTO_6132 ?AUTO_6135 ) ) ( IN-TRUCK ?AUTO_6131 ?AUTO_6138 ) ( not ( = ?AUTO_6134 ?AUTO_6138 ) ) ( TRUCK-AT ?AUTO_6138 ?AUTO_6139 ) ( IN-CITY ?AUTO_6139 ?AUTO_6140 ) ( IN-CITY ?AUTO_6135 ?AUTO_6140 ) ( not ( = ?AUTO_6135 ?AUTO_6139 ) ) ( not ( = ?AUTO_6132 ?AUTO_6139 ) ) ( not ( = ?AUTO_6133 ?AUTO_6139 ) ) ( not ( = ?AUTO_6137 ?AUTO_6140 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6138 ?AUTO_6139 ?AUTO_6135 ?AUTO_6140 )
      ( DELIVER-PKG ?AUTO_6131 ?AUTO_6132 )
      ( DELIVER-PKG-VERIFY ?AUTO_6131 ?AUTO_6132 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6149 - OBJ
      ?AUTO_6150 - LOCATION
    )
    :vars
    (
      ?AUTO_6157 - TRUCK
      ?AUTO_6158 - LOCATION
      ?AUTO_6154 - CITY
      ?AUTO_6151 - LOCATION
      ?AUTO_6156 - AIRPLANE
      ?AUTO_6153 - TRUCK
      ?AUTO_6155 - LOCATION
      ?AUTO_6152 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6157 ?AUTO_6158 ) ( IN-CITY ?AUTO_6158 ?AUTO_6154 ) ( IN-CITY ?AUTO_6150 ?AUTO_6154 ) ( not ( = ?AUTO_6150 ?AUTO_6158 ) ) ( AIRPORT ?AUTO_6151 ) ( AIRPORT ?AUTO_6158 ) ( AIRPLANE-AT ?AUTO_6156 ?AUTO_6151 ) ( not ( = ?AUTO_6151 ?AUTO_6158 ) ) ( not ( = ?AUTO_6150 ?AUTO_6151 ) ) ( not ( = ?AUTO_6157 ?AUTO_6153 ) ) ( TRUCK-AT ?AUTO_6153 ?AUTO_6155 ) ( IN-CITY ?AUTO_6155 ?AUTO_6152 ) ( IN-CITY ?AUTO_6151 ?AUTO_6152 ) ( not ( = ?AUTO_6151 ?AUTO_6155 ) ) ( not ( = ?AUTO_6150 ?AUTO_6155 ) ) ( not ( = ?AUTO_6158 ?AUTO_6155 ) ) ( not ( = ?AUTO_6154 ?AUTO_6152 ) ) ( OBJ-AT ?AUTO_6149 ?AUTO_6155 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6149 ?AUTO_6153 ?AUTO_6155 )
      ( DELIVER-PKG ?AUTO_6149 ?AUTO_6150 )
      ( DELIVER-PKG-VERIFY ?AUTO_6149 ?AUTO_6150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6159 - OBJ
      ?AUTO_6160 - LOCATION
    )
    :vars
    (
      ?AUTO_6163 - TRUCK
      ?AUTO_6168 - LOCATION
      ?AUTO_6166 - CITY
      ?AUTO_6167 - LOCATION
      ?AUTO_6165 - AIRPLANE
      ?AUTO_6162 - TRUCK
      ?AUTO_6164 - LOCATION
      ?AUTO_6161 - CITY
      ?AUTO_6169 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6163 ?AUTO_6168 ) ( IN-CITY ?AUTO_6168 ?AUTO_6166 ) ( IN-CITY ?AUTO_6160 ?AUTO_6166 ) ( not ( = ?AUTO_6160 ?AUTO_6168 ) ) ( AIRPORT ?AUTO_6167 ) ( AIRPORT ?AUTO_6168 ) ( AIRPLANE-AT ?AUTO_6165 ?AUTO_6167 ) ( not ( = ?AUTO_6167 ?AUTO_6168 ) ) ( not ( = ?AUTO_6160 ?AUTO_6167 ) ) ( not ( = ?AUTO_6163 ?AUTO_6162 ) ) ( IN-CITY ?AUTO_6164 ?AUTO_6161 ) ( IN-CITY ?AUTO_6167 ?AUTO_6161 ) ( not ( = ?AUTO_6167 ?AUTO_6164 ) ) ( not ( = ?AUTO_6160 ?AUTO_6164 ) ) ( not ( = ?AUTO_6168 ?AUTO_6164 ) ) ( not ( = ?AUTO_6166 ?AUTO_6161 ) ) ( OBJ-AT ?AUTO_6159 ?AUTO_6164 ) ( TRUCK-AT ?AUTO_6162 ?AUTO_6169 ) ( IN-CITY ?AUTO_6169 ?AUTO_6161 ) ( not ( = ?AUTO_6164 ?AUTO_6169 ) ) ( not ( = ?AUTO_6160 ?AUTO_6169 ) ) ( not ( = ?AUTO_6168 ?AUTO_6169 ) ) ( not ( = ?AUTO_6167 ?AUTO_6169 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6162 ?AUTO_6169 ?AUTO_6164 ?AUTO_6161 )
      ( DELIVER-PKG ?AUTO_6159 ?AUTO_6160 )
      ( DELIVER-PKG-VERIFY ?AUTO_6159 ?AUTO_6160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6172 - OBJ
      ?AUTO_6173 - LOCATION
    )
    :vars
    (
      ?AUTO_6178 - TRUCK
      ?AUTO_6181 - LOCATION
      ?AUTO_6180 - CITY
      ?AUTO_6179 - LOCATION
      ?AUTO_6175 - TRUCK
      ?AUTO_6177 - LOCATION
      ?AUTO_6182 - CITY
      ?AUTO_6176 - LOCATION
      ?AUTO_6183 - LOCATION
      ?AUTO_6174 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6178 ?AUTO_6181 ) ( IN-CITY ?AUTO_6181 ?AUTO_6180 ) ( IN-CITY ?AUTO_6173 ?AUTO_6180 ) ( not ( = ?AUTO_6173 ?AUTO_6181 ) ) ( AIRPORT ?AUTO_6179 ) ( AIRPORT ?AUTO_6181 ) ( not ( = ?AUTO_6179 ?AUTO_6181 ) ) ( not ( = ?AUTO_6173 ?AUTO_6179 ) ) ( not ( = ?AUTO_6178 ?AUTO_6175 ) ) ( IN-CITY ?AUTO_6177 ?AUTO_6182 ) ( IN-CITY ?AUTO_6179 ?AUTO_6182 ) ( not ( = ?AUTO_6179 ?AUTO_6177 ) ) ( not ( = ?AUTO_6173 ?AUTO_6177 ) ) ( not ( = ?AUTO_6181 ?AUTO_6177 ) ) ( not ( = ?AUTO_6180 ?AUTO_6182 ) ) ( OBJ-AT ?AUTO_6172 ?AUTO_6177 ) ( TRUCK-AT ?AUTO_6175 ?AUTO_6176 ) ( IN-CITY ?AUTO_6176 ?AUTO_6182 ) ( not ( = ?AUTO_6177 ?AUTO_6176 ) ) ( not ( = ?AUTO_6173 ?AUTO_6176 ) ) ( not ( = ?AUTO_6181 ?AUTO_6176 ) ) ( not ( = ?AUTO_6179 ?AUTO_6176 ) ) ( AIRPORT ?AUTO_6183 ) ( AIRPLANE-AT ?AUTO_6174 ?AUTO_6183 ) ( not ( = ?AUTO_6183 ?AUTO_6179 ) ) ( not ( = ?AUTO_6173 ?AUTO_6183 ) ) ( not ( = ?AUTO_6181 ?AUTO_6183 ) ) ( not ( = ?AUTO_6177 ?AUTO_6183 ) ) ( not ( = ?AUTO_6176 ?AUTO_6183 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6174 ?AUTO_6183 ?AUTO_6179 )
      ( DELIVER-PKG ?AUTO_6172 ?AUTO_6173 )
      ( DELIVER-PKG-VERIFY ?AUTO_6172 ?AUTO_6173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6200 - OBJ
      ?AUTO_6201 - LOCATION
    )
    :vars
    (
      ?AUTO_6202 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6202 ?AUTO_6201 ) ( IN-TRUCK ?AUTO_6200 ?AUTO_6202 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6200 ?AUTO_6202 ?AUTO_6201 )
      ( DELIVER-PKG-VERIFY ?AUTO_6200 ?AUTO_6201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6215 - OBJ
      ?AUTO_6216 - LOCATION
    )
    :vars
    (
      ?AUTO_6219 - TRUCK
      ?AUTO_6218 - LOCATION
      ?AUTO_6217 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6219 ?AUTO_6218 ) ( IN-CITY ?AUTO_6218 ?AUTO_6217 ) ( IN-CITY ?AUTO_6216 ?AUTO_6217 ) ( not ( = ?AUTO_6216 ?AUTO_6218 ) ) ( OBJ-AT ?AUTO_6215 ?AUTO_6218 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6215 ?AUTO_6219 ?AUTO_6218 )
      ( DELIVER-PKG ?AUTO_6215 ?AUTO_6216 )
      ( DELIVER-PKG-VERIFY ?AUTO_6215 ?AUTO_6216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6224 - OBJ
      ?AUTO_6225 - LOCATION
    )
    :vars
    (
      ?AUTO_6228 - TRUCK
      ?AUTO_6226 - LOCATION
      ?AUTO_6227 - CITY
      ?AUTO_6229 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6228 ?AUTO_6226 ) ( IN-CITY ?AUTO_6226 ?AUTO_6227 ) ( IN-CITY ?AUTO_6225 ?AUTO_6227 ) ( not ( = ?AUTO_6225 ?AUTO_6226 ) ) ( IN-AIRPLANE ?AUTO_6224 ?AUTO_6229 ) ( AIRPLANE-AT ?AUTO_6229 ?AUTO_6226 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6224 ?AUTO_6229 ?AUTO_6226 )
      ( DELIVER-PKG ?AUTO_6224 ?AUTO_6225 )
      ( DELIVER-PKG-VERIFY ?AUTO_6224 ?AUTO_6225 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6274 - OBJ
      ?AUTO_6275 - LOCATION
    )
    :vars
    (
      ?AUTO_6276 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6276 ?AUTO_6275 ) ( IN-TRUCK ?AUTO_6274 ?AUTO_6276 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6274 ?AUTO_6276 ?AUTO_6275 )
      ( DELIVER-PKG-VERIFY ?AUTO_6274 ?AUTO_6275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6343 - OBJ
      ?AUTO_6344 - LOCATION
    )
    :vars
    (
      ?AUTO_6345 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6345 ?AUTO_6344 ) ( IN-TRUCK ?AUTO_6343 ?AUTO_6345 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6343 ?AUTO_6345 ?AUTO_6344 )
      ( DELIVER-PKG-VERIFY ?AUTO_6343 ?AUTO_6344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6358 - OBJ
      ?AUTO_6359 - LOCATION
    )
    :vars
    (
      ?AUTO_6360 - TRUCK
      ?AUTO_6361 - LOCATION
      ?AUTO_6362 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6360 ?AUTO_6361 ) ( IN-CITY ?AUTO_6361 ?AUTO_6362 ) ( IN-CITY ?AUTO_6359 ?AUTO_6362 ) ( not ( = ?AUTO_6359 ?AUTO_6361 ) ) ( OBJ-AT ?AUTO_6358 ?AUTO_6361 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6358 ?AUTO_6360 ?AUTO_6361 )
      ( DELIVER-PKG ?AUTO_6358 ?AUTO_6359 )
      ( DELIVER-PKG-VERIFY ?AUTO_6358 ?AUTO_6359 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6363 - OBJ
      ?AUTO_6364 - LOCATION
    )
    :vars
    (
      ?AUTO_6365 - LOCATION
      ?AUTO_6366 - CITY
      ?AUTO_6367 - TRUCK
      ?AUTO_6368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6365 ?AUTO_6366 ) ( IN-CITY ?AUTO_6364 ?AUTO_6366 ) ( not ( = ?AUTO_6364 ?AUTO_6365 ) ) ( OBJ-AT ?AUTO_6363 ?AUTO_6365 ) ( TRUCK-AT ?AUTO_6367 ?AUTO_6368 ) ( IN-CITY ?AUTO_6368 ?AUTO_6366 ) ( not ( = ?AUTO_6365 ?AUTO_6368 ) ) ( not ( = ?AUTO_6364 ?AUTO_6368 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6367 ?AUTO_6368 ?AUTO_6365 ?AUTO_6366 )
      ( DELIVER-PKG ?AUTO_6363 ?AUTO_6364 )
      ( DELIVER-PKG-VERIFY ?AUTO_6363 ?AUTO_6364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6371 - OBJ
      ?AUTO_6372 - LOCATION
    )
    :vars
    (
      ?AUTO_6373 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6373 ?AUTO_6372 ) ( IN-TRUCK ?AUTO_6371 ?AUTO_6373 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6371 ?AUTO_6373 ?AUTO_6372 )
      ( DELIVER-PKG-VERIFY ?AUTO_6371 ?AUTO_6372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6374 - OBJ
      ?AUTO_6375 - LOCATION
    )
    :vars
    (
      ?AUTO_6376 - TRUCK
      ?AUTO_6377 - LOCATION
      ?AUTO_6378 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6374 ?AUTO_6376 ) ( TRUCK-AT ?AUTO_6376 ?AUTO_6377 ) ( IN-CITY ?AUTO_6377 ?AUTO_6378 ) ( IN-CITY ?AUTO_6375 ?AUTO_6378 ) ( not ( = ?AUTO_6375 ?AUTO_6377 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6376 ?AUTO_6377 ?AUTO_6375 ?AUTO_6378 )
      ( DELIVER-PKG ?AUTO_6374 ?AUTO_6375 )
      ( DELIVER-PKG-VERIFY ?AUTO_6374 ?AUTO_6375 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6381 - OBJ
      ?AUTO_6382 - LOCATION
    )
    :vars
    (
      ?AUTO_6383 - TRUCK
      ?AUTO_6385 - LOCATION
      ?AUTO_6384 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6383 ?AUTO_6385 ) ( IN-CITY ?AUTO_6385 ?AUTO_6384 ) ( IN-CITY ?AUTO_6382 ?AUTO_6384 ) ( not ( = ?AUTO_6382 ?AUTO_6385 ) ) ( OBJ-AT ?AUTO_6381 ?AUTO_6385 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6381 ?AUTO_6383 ?AUTO_6385 )
      ( DELIVER-PKG ?AUTO_6381 ?AUTO_6382 )
      ( DELIVER-PKG-VERIFY ?AUTO_6381 ?AUTO_6382 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6386 - OBJ
      ?AUTO_6387 - LOCATION
    )
    :vars
    (
      ?AUTO_6389 - LOCATION
      ?AUTO_6390 - CITY
      ?AUTO_6388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6389 ?AUTO_6390 ) ( IN-CITY ?AUTO_6387 ?AUTO_6390 ) ( not ( = ?AUTO_6387 ?AUTO_6389 ) ) ( OBJ-AT ?AUTO_6386 ?AUTO_6389 ) ( TRUCK-AT ?AUTO_6388 ?AUTO_6387 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6388 ?AUTO_6387 ?AUTO_6389 ?AUTO_6390 )
      ( DELIVER-PKG ?AUTO_6386 ?AUTO_6387 )
      ( DELIVER-PKG-VERIFY ?AUTO_6386 ?AUTO_6387 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6393 - OBJ
      ?AUTO_6394 - LOCATION
    )
    :vars
    (
      ?AUTO_6395 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6395 ?AUTO_6394 ) ( IN-TRUCK ?AUTO_6393 ?AUTO_6395 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6393 ?AUTO_6395 ?AUTO_6394 )
      ( DELIVER-PKG-VERIFY ?AUTO_6393 ?AUTO_6394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6400 - OBJ
      ?AUTO_6401 - LOCATION
    )
    :vars
    (
      ?AUTO_6403 - TRUCK
      ?AUTO_6402 - LOCATION
      ?AUTO_6404 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6403 ?AUTO_6402 ) ( IN-CITY ?AUTO_6402 ?AUTO_6404 ) ( IN-CITY ?AUTO_6401 ?AUTO_6404 ) ( not ( = ?AUTO_6401 ?AUTO_6402 ) ) ( OBJ-AT ?AUTO_6400 ?AUTO_6402 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6400 ?AUTO_6403 ?AUTO_6402 )
      ( DELIVER-PKG ?AUTO_6400 ?AUTO_6401 )
      ( DELIVER-PKG-VERIFY ?AUTO_6400 ?AUTO_6401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6411 - OBJ
      ?AUTO_6412 - LOCATION
    )
    :vars
    (
      ?AUTO_6413 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6411 ?AUTO_6413 ) ( AIRPLANE-AT ?AUTO_6413 ?AUTO_6412 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6411 ?AUTO_6413 ?AUTO_6412 )
      ( DELIVER-PKG-VERIFY ?AUTO_6411 ?AUTO_6412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6414 - OBJ
      ?AUTO_6415 - LOCATION
    )
    :vars
    (
      ?AUTO_6416 - AIRPLANE
      ?AUTO_6417 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6414 ?AUTO_6416 ) ( AIRPORT ?AUTO_6417 ) ( AIRPORT ?AUTO_6415 ) ( AIRPLANE-AT ?AUTO_6416 ?AUTO_6417 ) ( not ( = ?AUTO_6417 ?AUTO_6415 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6416 ?AUTO_6417 ?AUTO_6415 )
      ( DELIVER-PKG ?AUTO_6414 ?AUTO_6415 )
      ( DELIVER-PKG-VERIFY ?AUTO_6414 ?AUTO_6415 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6424 - OBJ
      ?AUTO_6425 - LOCATION
    )
    :vars
    (
      ?AUTO_6427 - LOCATION
      ?AUTO_6426 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6427 ) ( AIRPORT ?AUTO_6425 ) ( AIRPLANE-AT ?AUTO_6426 ?AUTO_6427 ) ( not ( = ?AUTO_6427 ?AUTO_6425 ) ) ( OBJ-AT ?AUTO_6424 ?AUTO_6427 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6424 ?AUTO_6426 ?AUTO_6427 )
      ( DELIVER-PKG ?AUTO_6424 ?AUTO_6425 )
      ( DELIVER-PKG-VERIFY ?AUTO_6424 ?AUTO_6425 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6430 - OBJ
      ?AUTO_6431 - LOCATION
    )
    :vars
    (
      ?AUTO_6432 - LOCATION
      ?AUTO_6433 - AIRPLANE
      ?AUTO_6434 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6432 ) ( AIRPORT ?AUTO_6431 ) ( AIRPLANE-AT ?AUTO_6433 ?AUTO_6432 ) ( not ( = ?AUTO_6432 ?AUTO_6431 ) ) ( TRUCK-AT ?AUTO_6434 ?AUTO_6432 ) ( IN-TRUCK ?AUTO_6430 ?AUTO_6434 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6430 ?AUTO_6434 ?AUTO_6432 )
      ( DELIVER-PKG ?AUTO_6430 ?AUTO_6431 )
      ( DELIVER-PKG-VERIFY ?AUTO_6430 ?AUTO_6431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6435 - OBJ
      ?AUTO_6436 - LOCATION
    )
    :vars
    (
      ?AUTO_6438 - LOCATION
      ?AUTO_6437 - AIRPLANE
      ?AUTO_6439 - TRUCK
      ?AUTO_6440 - LOCATION
      ?AUTO_6441 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6438 ) ( AIRPORT ?AUTO_6436 ) ( AIRPLANE-AT ?AUTO_6437 ?AUTO_6438 ) ( not ( = ?AUTO_6438 ?AUTO_6436 ) ) ( IN-TRUCK ?AUTO_6435 ?AUTO_6439 ) ( TRUCK-AT ?AUTO_6439 ?AUTO_6440 ) ( IN-CITY ?AUTO_6440 ?AUTO_6441 ) ( IN-CITY ?AUTO_6438 ?AUTO_6441 ) ( not ( = ?AUTO_6438 ?AUTO_6440 ) ) ( not ( = ?AUTO_6436 ?AUTO_6440 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6439 ?AUTO_6440 ?AUTO_6438 ?AUTO_6441 )
      ( DELIVER-PKG ?AUTO_6435 ?AUTO_6436 )
      ( DELIVER-PKG-VERIFY ?AUTO_6435 ?AUTO_6436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6444 - OBJ
      ?AUTO_6445 - LOCATION
    )
    :vars
    (
      ?AUTO_6450 - LOCATION
      ?AUTO_6449 - AIRPLANE
      ?AUTO_6447 - TRUCK
      ?AUTO_6446 - LOCATION
      ?AUTO_6448 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6450 ) ( AIRPORT ?AUTO_6445 ) ( AIRPLANE-AT ?AUTO_6449 ?AUTO_6450 ) ( not ( = ?AUTO_6450 ?AUTO_6445 ) ) ( TRUCK-AT ?AUTO_6447 ?AUTO_6446 ) ( IN-CITY ?AUTO_6446 ?AUTO_6448 ) ( IN-CITY ?AUTO_6450 ?AUTO_6448 ) ( not ( = ?AUTO_6450 ?AUTO_6446 ) ) ( not ( = ?AUTO_6445 ?AUTO_6446 ) ) ( OBJ-AT ?AUTO_6444 ?AUTO_6446 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6444 ?AUTO_6447 ?AUTO_6446 )
      ( DELIVER-PKG ?AUTO_6444 ?AUTO_6445 )
      ( DELIVER-PKG-VERIFY ?AUTO_6444 ?AUTO_6445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6451 - OBJ
      ?AUTO_6452 - LOCATION
    )
    :vars
    (
      ?AUTO_6456 - LOCATION
      ?AUTO_6455 - AIRPLANE
      ?AUTO_6453 - LOCATION
      ?AUTO_6457 - CITY
      ?AUTO_6454 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6456 ) ( AIRPORT ?AUTO_6452 ) ( AIRPLANE-AT ?AUTO_6455 ?AUTO_6456 ) ( not ( = ?AUTO_6456 ?AUTO_6452 ) ) ( IN-CITY ?AUTO_6453 ?AUTO_6457 ) ( IN-CITY ?AUTO_6456 ?AUTO_6457 ) ( not ( = ?AUTO_6456 ?AUTO_6453 ) ) ( not ( = ?AUTO_6452 ?AUTO_6453 ) ) ( OBJ-AT ?AUTO_6451 ?AUTO_6453 ) ( TRUCK-AT ?AUTO_6454 ?AUTO_6456 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6454 ?AUTO_6456 ?AUTO_6453 ?AUTO_6457 )
      ( DELIVER-PKG ?AUTO_6451 ?AUTO_6452 )
      ( DELIVER-PKG-VERIFY ?AUTO_6451 ?AUTO_6452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6460 - OBJ
      ?AUTO_6461 - LOCATION
    )
    :vars
    (
      ?AUTO_6462 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6460 ?AUTO_6462 ) ( AIRPLANE-AT ?AUTO_6462 ?AUTO_6461 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6460 ?AUTO_6462 ?AUTO_6461 )
      ( DELIVER-PKG-VERIFY ?AUTO_6460 ?AUTO_6461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6471 - OBJ
      ?AUTO_6472 - LOCATION
    )
    :vars
    (
      ?AUTO_6473 - LOCATION
      ?AUTO_6474 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6473 ) ( AIRPORT ?AUTO_6472 ) ( AIRPLANE-AT ?AUTO_6474 ?AUTO_6473 ) ( not ( = ?AUTO_6473 ?AUTO_6472 ) ) ( OBJ-AT ?AUTO_6471 ?AUTO_6473 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6471 ?AUTO_6474 ?AUTO_6473 )
      ( DELIVER-PKG ?AUTO_6471 ?AUTO_6472 )
      ( DELIVER-PKG-VERIFY ?AUTO_6471 ?AUTO_6472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6477 - OBJ
      ?AUTO_6478 - LOCATION
    )
    :vars
    (
      ?AUTO_6479 - LOCATION
      ?AUTO_6480 - AIRPLANE
      ?AUTO_6481 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6479 ) ( AIRPORT ?AUTO_6478 ) ( AIRPLANE-AT ?AUTO_6480 ?AUTO_6479 ) ( not ( = ?AUTO_6479 ?AUTO_6478 ) ) ( TRUCK-AT ?AUTO_6481 ?AUTO_6479 ) ( IN-TRUCK ?AUTO_6477 ?AUTO_6481 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6477 ?AUTO_6481 ?AUTO_6479 )
      ( DELIVER-PKG ?AUTO_6477 ?AUTO_6478 )
      ( DELIVER-PKG-VERIFY ?AUTO_6477 ?AUTO_6478 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6486 - OBJ
      ?AUTO_6487 - LOCATION
    )
    :vars
    (
      ?AUTO_6491 - LOCATION
      ?AUTO_6490 - AIRPLANE
      ?AUTO_6489 - TRUCK
      ?AUTO_6488 - LOCATION
      ?AUTO_6492 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6491 ) ( AIRPORT ?AUTO_6487 ) ( AIRPLANE-AT ?AUTO_6490 ?AUTO_6491 ) ( not ( = ?AUTO_6491 ?AUTO_6487 ) ) ( TRUCK-AT ?AUTO_6489 ?AUTO_6488 ) ( IN-CITY ?AUTO_6488 ?AUTO_6492 ) ( IN-CITY ?AUTO_6491 ?AUTO_6492 ) ( not ( = ?AUTO_6491 ?AUTO_6488 ) ) ( not ( = ?AUTO_6487 ?AUTO_6488 ) ) ( OBJ-AT ?AUTO_6486 ?AUTO_6488 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6486 ?AUTO_6489 ?AUTO_6488 )
      ( DELIVER-PKG ?AUTO_6486 ?AUTO_6487 )
      ( DELIVER-PKG-VERIFY ?AUTO_6486 ?AUTO_6487 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6499 - OBJ
      ?AUTO_6500 - LOCATION
    )
    :vars
    (
      ?AUTO_6501 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6499 ?AUTO_6501 ) ( AIRPLANE-AT ?AUTO_6501 ?AUTO_6500 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6499 ?AUTO_6501 ?AUTO_6500 )
      ( DELIVER-PKG-VERIFY ?AUTO_6499 ?AUTO_6500 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6508 - OBJ
      ?AUTO_6509 - LOCATION
    )
    :vars
    (
      ?AUTO_6511 - LOCATION
      ?AUTO_6510 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6511 ) ( AIRPORT ?AUTO_6509 ) ( AIRPLANE-AT ?AUTO_6510 ?AUTO_6511 ) ( not ( = ?AUTO_6511 ?AUTO_6509 ) ) ( OBJ-AT ?AUTO_6508 ?AUTO_6511 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6508 ?AUTO_6510 ?AUTO_6511 )
      ( DELIVER-PKG ?AUTO_6508 ?AUTO_6509 )
      ( DELIVER-PKG-VERIFY ?AUTO_6508 ?AUTO_6509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6512 - OBJ
      ?AUTO_6513 - LOCATION
    )
    :vars
    (
      ?AUTO_6514 - LOCATION
      ?AUTO_6516 - LOCATION
      ?AUTO_6515 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6514 ) ( AIRPORT ?AUTO_6513 ) ( not ( = ?AUTO_6514 ?AUTO_6513 ) ) ( OBJ-AT ?AUTO_6512 ?AUTO_6514 ) ( AIRPORT ?AUTO_6516 ) ( AIRPLANE-AT ?AUTO_6515 ?AUTO_6516 ) ( not ( = ?AUTO_6516 ?AUTO_6514 ) ) ( not ( = ?AUTO_6513 ?AUTO_6516 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6515 ?AUTO_6516 ?AUTO_6514 )
      ( DELIVER-PKG ?AUTO_6512 ?AUTO_6513 )
      ( DELIVER-PKG-VERIFY ?AUTO_6512 ?AUTO_6513 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6535 - OBJ
      ?AUTO_6536 - LOCATION
    )
    :vars
    (
      ?AUTO_6537 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6537 ?AUTO_6536 ) ( IN-TRUCK ?AUTO_6535 ?AUTO_6537 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6535 ?AUTO_6537 ?AUTO_6536 )
      ( DELIVER-PKG-VERIFY ?AUTO_6535 ?AUTO_6536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6538 - OBJ
      ?AUTO_6539 - LOCATION
    )
    :vars
    (
      ?AUTO_6540 - TRUCK
      ?AUTO_6541 - LOCATION
      ?AUTO_6542 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6538 ?AUTO_6540 ) ( TRUCK-AT ?AUTO_6540 ?AUTO_6541 ) ( IN-CITY ?AUTO_6541 ?AUTO_6542 ) ( IN-CITY ?AUTO_6539 ?AUTO_6542 ) ( not ( = ?AUTO_6539 ?AUTO_6541 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6540 ?AUTO_6541 ?AUTO_6539 ?AUTO_6542 )
      ( DELIVER-PKG ?AUTO_6538 ?AUTO_6539 )
      ( DELIVER-PKG-VERIFY ?AUTO_6538 ?AUTO_6539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6545 - OBJ
      ?AUTO_6546 - LOCATION
    )
    :vars
    (
      ?AUTO_6547 - TRUCK
      ?AUTO_6549 - LOCATION
      ?AUTO_6548 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6547 ?AUTO_6549 ) ( IN-CITY ?AUTO_6549 ?AUTO_6548 ) ( IN-CITY ?AUTO_6546 ?AUTO_6548 ) ( not ( = ?AUTO_6546 ?AUTO_6549 ) ) ( OBJ-AT ?AUTO_6545 ?AUTO_6549 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6545 ?AUTO_6547 ?AUTO_6549 )
      ( DELIVER-PKG ?AUTO_6545 ?AUTO_6546 )
      ( DELIVER-PKG-VERIFY ?AUTO_6545 ?AUTO_6546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6550 - OBJ
      ?AUTO_6551 - LOCATION
    )
    :vars
    (
      ?AUTO_6553 - LOCATION
      ?AUTO_6554 - CITY
      ?AUTO_6552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6553 ?AUTO_6554 ) ( IN-CITY ?AUTO_6551 ?AUTO_6554 ) ( not ( = ?AUTO_6551 ?AUTO_6553 ) ) ( OBJ-AT ?AUTO_6550 ?AUTO_6553 ) ( TRUCK-AT ?AUTO_6552 ?AUTO_6551 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6552 ?AUTO_6551 ?AUTO_6553 ?AUTO_6554 )
      ( DELIVER-PKG ?AUTO_6550 ?AUTO_6551 )
      ( DELIVER-PKG-VERIFY ?AUTO_6550 ?AUTO_6551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6559 - OBJ
      ?AUTO_6560 - LOCATION
    )
    :vars
    (
      ?AUTO_6562 - LOCATION
      ?AUTO_6563 - CITY
      ?AUTO_6561 - TRUCK
      ?AUTO_6564 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6562 ?AUTO_6563 ) ( IN-CITY ?AUTO_6560 ?AUTO_6563 ) ( not ( = ?AUTO_6560 ?AUTO_6562 ) ) ( TRUCK-AT ?AUTO_6561 ?AUTO_6560 ) ( IN-AIRPLANE ?AUTO_6559 ?AUTO_6564 ) ( AIRPLANE-AT ?AUTO_6564 ?AUTO_6562 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6559 ?AUTO_6564 ?AUTO_6562 )
      ( DELIVER-PKG ?AUTO_6559 ?AUTO_6560 )
      ( DELIVER-PKG-VERIFY ?AUTO_6559 ?AUTO_6560 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6565 - OBJ
      ?AUTO_6566 - LOCATION
    )
    :vars
    (
      ?AUTO_6567 - LOCATION
      ?AUTO_6568 - CITY
      ?AUTO_6569 - TRUCK
      ?AUTO_6570 - AIRPLANE
      ?AUTO_6571 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6567 ?AUTO_6568 ) ( IN-CITY ?AUTO_6566 ?AUTO_6568 ) ( not ( = ?AUTO_6566 ?AUTO_6567 ) ) ( TRUCK-AT ?AUTO_6569 ?AUTO_6566 ) ( IN-AIRPLANE ?AUTO_6565 ?AUTO_6570 ) ( AIRPORT ?AUTO_6571 ) ( AIRPORT ?AUTO_6567 ) ( AIRPLANE-AT ?AUTO_6570 ?AUTO_6571 ) ( not ( = ?AUTO_6571 ?AUTO_6567 ) ) ( not ( = ?AUTO_6566 ?AUTO_6571 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6570 ?AUTO_6571 ?AUTO_6567 )
      ( DELIVER-PKG ?AUTO_6565 ?AUTO_6566 )
      ( DELIVER-PKG-VERIFY ?AUTO_6565 ?AUTO_6566 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6578 - OBJ
      ?AUTO_6579 - LOCATION
    )
    :vars
    (
      ?AUTO_6584 - LOCATION
      ?AUTO_6582 - CITY
      ?AUTO_6583 - TRUCK
      ?AUTO_6580 - LOCATION
      ?AUTO_6581 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6584 ?AUTO_6582 ) ( IN-CITY ?AUTO_6579 ?AUTO_6582 ) ( not ( = ?AUTO_6579 ?AUTO_6584 ) ) ( TRUCK-AT ?AUTO_6583 ?AUTO_6579 ) ( AIRPORT ?AUTO_6580 ) ( AIRPORT ?AUTO_6584 ) ( AIRPLANE-AT ?AUTO_6581 ?AUTO_6580 ) ( not ( = ?AUTO_6580 ?AUTO_6584 ) ) ( not ( = ?AUTO_6579 ?AUTO_6580 ) ) ( OBJ-AT ?AUTO_6578 ?AUTO_6580 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6578 ?AUTO_6581 ?AUTO_6580 )
      ( DELIVER-PKG ?AUTO_6578 ?AUTO_6579 )
      ( DELIVER-PKG-VERIFY ?AUTO_6578 ?AUTO_6579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6587 - OBJ
      ?AUTO_6588 - LOCATION
    )
    :vars
    (
      ?AUTO_6589 - LOCATION
      ?AUTO_6593 - CITY
      ?AUTO_6592 - TRUCK
      ?AUTO_6591 - LOCATION
      ?AUTO_6590 - AIRPLANE
      ?AUTO_6594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6589 ?AUTO_6593 ) ( IN-CITY ?AUTO_6588 ?AUTO_6593 ) ( not ( = ?AUTO_6588 ?AUTO_6589 ) ) ( TRUCK-AT ?AUTO_6592 ?AUTO_6588 ) ( AIRPORT ?AUTO_6591 ) ( AIRPORT ?AUTO_6589 ) ( AIRPLANE-AT ?AUTO_6590 ?AUTO_6591 ) ( not ( = ?AUTO_6591 ?AUTO_6589 ) ) ( not ( = ?AUTO_6588 ?AUTO_6591 ) ) ( TRUCK-AT ?AUTO_6594 ?AUTO_6591 ) ( IN-TRUCK ?AUTO_6587 ?AUTO_6594 ) ( not ( = ?AUTO_6592 ?AUTO_6594 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6587 ?AUTO_6594 ?AUTO_6591 )
      ( DELIVER-PKG ?AUTO_6587 ?AUTO_6588 )
      ( DELIVER-PKG-VERIFY ?AUTO_6587 ?AUTO_6588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6595 - OBJ
      ?AUTO_6596 - LOCATION
    )
    :vars
    (
      ?AUTO_6598 - LOCATION
      ?AUTO_6600 - CITY
      ?AUTO_6599 - TRUCK
      ?AUTO_6601 - LOCATION
      ?AUTO_6597 - AIRPLANE
      ?AUTO_6602 - TRUCK
      ?AUTO_6603 - LOCATION
      ?AUTO_6604 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6598 ?AUTO_6600 ) ( IN-CITY ?AUTO_6596 ?AUTO_6600 ) ( not ( = ?AUTO_6596 ?AUTO_6598 ) ) ( TRUCK-AT ?AUTO_6599 ?AUTO_6596 ) ( AIRPORT ?AUTO_6601 ) ( AIRPORT ?AUTO_6598 ) ( AIRPLANE-AT ?AUTO_6597 ?AUTO_6601 ) ( not ( = ?AUTO_6601 ?AUTO_6598 ) ) ( not ( = ?AUTO_6596 ?AUTO_6601 ) ) ( IN-TRUCK ?AUTO_6595 ?AUTO_6602 ) ( not ( = ?AUTO_6599 ?AUTO_6602 ) ) ( TRUCK-AT ?AUTO_6602 ?AUTO_6603 ) ( IN-CITY ?AUTO_6603 ?AUTO_6604 ) ( IN-CITY ?AUTO_6601 ?AUTO_6604 ) ( not ( = ?AUTO_6601 ?AUTO_6603 ) ) ( not ( = ?AUTO_6596 ?AUTO_6603 ) ) ( not ( = ?AUTO_6598 ?AUTO_6603 ) ) ( not ( = ?AUTO_6600 ?AUTO_6604 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6602 ?AUTO_6603 ?AUTO_6601 ?AUTO_6604 )
      ( DELIVER-PKG ?AUTO_6595 ?AUTO_6596 )
      ( DELIVER-PKG-VERIFY ?AUTO_6595 ?AUTO_6596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6607 - OBJ
      ?AUTO_6608 - LOCATION
    )
    :vars
    (
      ?AUTO_6615 - LOCATION
      ?AUTO_6609 - CITY
      ?AUTO_6613 - TRUCK
      ?AUTO_6614 - LOCATION
      ?AUTO_6611 - AIRPLANE
      ?AUTO_6612 - TRUCK
      ?AUTO_6616 - LOCATION
      ?AUTO_6610 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6615 ?AUTO_6609 ) ( IN-CITY ?AUTO_6608 ?AUTO_6609 ) ( not ( = ?AUTO_6608 ?AUTO_6615 ) ) ( TRUCK-AT ?AUTO_6613 ?AUTO_6608 ) ( AIRPORT ?AUTO_6614 ) ( AIRPORT ?AUTO_6615 ) ( AIRPLANE-AT ?AUTO_6611 ?AUTO_6614 ) ( not ( = ?AUTO_6614 ?AUTO_6615 ) ) ( not ( = ?AUTO_6608 ?AUTO_6614 ) ) ( not ( = ?AUTO_6613 ?AUTO_6612 ) ) ( TRUCK-AT ?AUTO_6612 ?AUTO_6616 ) ( IN-CITY ?AUTO_6616 ?AUTO_6610 ) ( IN-CITY ?AUTO_6614 ?AUTO_6610 ) ( not ( = ?AUTO_6614 ?AUTO_6616 ) ) ( not ( = ?AUTO_6608 ?AUTO_6616 ) ) ( not ( = ?AUTO_6615 ?AUTO_6616 ) ) ( not ( = ?AUTO_6609 ?AUTO_6610 ) ) ( OBJ-AT ?AUTO_6607 ?AUTO_6616 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6607 ?AUTO_6612 ?AUTO_6616 )
      ( DELIVER-PKG ?AUTO_6607 ?AUTO_6608 )
      ( DELIVER-PKG-VERIFY ?AUTO_6607 ?AUTO_6608 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6617 - OBJ
      ?AUTO_6618 - LOCATION
    )
    :vars
    (
      ?AUTO_6624 - LOCATION
      ?AUTO_6620 - CITY
      ?AUTO_6619 - TRUCK
      ?AUTO_6625 - LOCATION
      ?AUTO_6622 - AIRPLANE
      ?AUTO_6621 - TRUCK
      ?AUTO_6623 - LOCATION
      ?AUTO_6626 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6624 ?AUTO_6620 ) ( IN-CITY ?AUTO_6618 ?AUTO_6620 ) ( not ( = ?AUTO_6618 ?AUTO_6624 ) ) ( TRUCK-AT ?AUTO_6619 ?AUTO_6618 ) ( AIRPORT ?AUTO_6625 ) ( AIRPORT ?AUTO_6624 ) ( AIRPLANE-AT ?AUTO_6622 ?AUTO_6625 ) ( not ( = ?AUTO_6625 ?AUTO_6624 ) ) ( not ( = ?AUTO_6618 ?AUTO_6625 ) ) ( not ( = ?AUTO_6619 ?AUTO_6621 ) ) ( IN-CITY ?AUTO_6623 ?AUTO_6626 ) ( IN-CITY ?AUTO_6625 ?AUTO_6626 ) ( not ( = ?AUTO_6625 ?AUTO_6623 ) ) ( not ( = ?AUTO_6618 ?AUTO_6623 ) ) ( not ( = ?AUTO_6624 ?AUTO_6623 ) ) ( not ( = ?AUTO_6620 ?AUTO_6626 ) ) ( OBJ-AT ?AUTO_6617 ?AUTO_6623 ) ( TRUCK-AT ?AUTO_6621 ?AUTO_6625 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6621 ?AUTO_6625 ?AUTO_6623 ?AUTO_6626 )
      ( DELIVER-PKG ?AUTO_6617 ?AUTO_6618 )
      ( DELIVER-PKG-VERIFY ?AUTO_6617 ?AUTO_6618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6629 - OBJ
      ?AUTO_6630 - LOCATION
    )
    :vars
    (
      ?AUTO_6631 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6631 ?AUTO_6630 ) ( IN-TRUCK ?AUTO_6629 ?AUTO_6631 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6629 ?AUTO_6631 ?AUTO_6630 )
      ( DELIVER-PKG-VERIFY ?AUTO_6629 ?AUTO_6630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6632 - OBJ
      ?AUTO_6633 - LOCATION
    )
    :vars
    (
      ?AUTO_6634 - TRUCK
      ?AUTO_6635 - LOCATION
      ?AUTO_6636 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6632 ?AUTO_6634 ) ( TRUCK-AT ?AUTO_6634 ?AUTO_6635 ) ( IN-CITY ?AUTO_6635 ?AUTO_6636 ) ( IN-CITY ?AUTO_6633 ?AUTO_6636 ) ( not ( = ?AUTO_6633 ?AUTO_6635 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6634 ?AUTO_6635 ?AUTO_6633 ?AUTO_6636 )
      ( DELIVER-PKG ?AUTO_6632 ?AUTO_6633 )
      ( DELIVER-PKG-VERIFY ?AUTO_6632 ?AUTO_6633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6641 - OBJ
      ?AUTO_6642 - LOCATION
    )
    :vars
    (
      ?AUTO_6645 - TRUCK
      ?AUTO_6643 - LOCATION
      ?AUTO_6644 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6645 ?AUTO_6643 ) ( IN-CITY ?AUTO_6643 ?AUTO_6644 ) ( IN-CITY ?AUTO_6642 ?AUTO_6644 ) ( not ( = ?AUTO_6642 ?AUTO_6643 ) ) ( OBJ-AT ?AUTO_6641 ?AUTO_6643 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6641 ?AUTO_6645 ?AUTO_6643 )
      ( DELIVER-PKG ?AUTO_6641 ?AUTO_6642 )
      ( DELIVER-PKG-VERIFY ?AUTO_6641 ?AUTO_6642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6648 - OBJ
      ?AUTO_6649 - LOCATION
    )
    :vars
    (
      ?AUTO_6650 - LOCATION
      ?AUTO_6651 - CITY
      ?AUTO_6652 - TRUCK
      ?AUTO_6653 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6650 ?AUTO_6651 ) ( IN-CITY ?AUTO_6649 ?AUTO_6651 ) ( not ( = ?AUTO_6649 ?AUTO_6650 ) ) ( OBJ-AT ?AUTO_6648 ?AUTO_6650 ) ( TRUCK-AT ?AUTO_6652 ?AUTO_6653 ) ( IN-CITY ?AUTO_6653 ?AUTO_6651 ) ( not ( = ?AUTO_6650 ?AUTO_6653 ) ) ( not ( = ?AUTO_6649 ?AUTO_6653 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6652 ?AUTO_6653 ?AUTO_6650 ?AUTO_6651 )
      ( DELIVER-PKG ?AUTO_6648 ?AUTO_6649 )
      ( DELIVER-PKG-VERIFY ?AUTO_6648 ?AUTO_6649 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6656 - OBJ
      ?AUTO_6657 - LOCATION
    )
    :vars
    (
      ?AUTO_6661 - LOCATION
      ?AUTO_6660 - CITY
      ?AUTO_6658 - TRUCK
      ?AUTO_6659 - LOCATION
      ?AUTO_6662 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6661 ?AUTO_6660 ) ( IN-CITY ?AUTO_6657 ?AUTO_6660 ) ( not ( = ?AUTO_6657 ?AUTO_6661 ) ) ( TRUCK-AT ?AUTO_6658 ?AUTO_6659 ) ( IN-CITY ?AUTO_6659 ?AUTO_6660 ) ( not ( = ?AUTO_6661 ?AUTO_6659 ) ) ( not ( = ?AUTO_6657 ?AUTO_6659 ) ) ( IN-AIRPLANE ?AUTO_6656 ?AUTO_6662 ) ( AIRPLANE-AT ?AUTO_6662 ?AUTO_6661 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6656 ?AUTO_6662 ?AUTO_6661 )
      ( DELIVER-PKG ?AUTO_6656 ?AUTO_6657 )
      ( DELIVER-PKG-VERIFY ?AUTO_6656 ?AUTO_6657 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6665 - OBJ
      ?AUTO_6666 - LOCATION
    )
    :vars
    (
      ?AUTO_6669 - LOCATION
      ?AUTO_6668 - CITY
      ?AUTO_6671 - TRUCK
      ?AUTO_6667 - LOCATION
      ?AUTO_6670 - AIRPLANE
      ?AUTO_6672 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6669 ?AUTO_6668 ) ( IN-CITY ?AUTO_6666 ?AUTO_6668 ) ( not ( = ?AUTO_6666 ?AUTO_6669 ) ) ( TRUCK-AT ?AUTO_6671 ?AUTO_6667 ) ( IN-CITY ?AUTO_6667 ?AUTO_6668 ) ( not ( = ?AUTO_6669 ?AUTO_6667 ) ) ( not ( = ?AUTO_6666 ?AUTO_6667 ) ) ( IN-AIRPLANE ?AUTO_6665 ?AUTO_6670 ) ( AIRPORT ?AUTO_6672 ) ( AIRPORT ?AUTO_6669 ) ( AIRPLANE-AT ?AUTO_6670 ?AUTO_6672 ) ( not ( = ?AUTO_6672 ?AUTO_6669 ) ) ( not ( = ?AUTO_6666 ?AUTO_6672 ) ) ( not ( = ?AUTO_6667 ?AUTO_6672 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6670 ?AUTO_6672 ?AUTO_6669 )
      ( DELIVER-PKG ?AUTO_6665 ?AUTO_6666 )
      ( DELIVER-PKG-VERIFY ?AUTO_6665 ?AUTO_6666 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6677 - OBJ
      ?AUTO_6678 - LOCATION
    )
    :vars
    (
      ?AUTO_6683 - LOCATION
      ?AUTO_6680 - CITY
      ?AUTO_6679 - TRUCK
      ?AUTO_6681 - LOCATION
      ?AUTO_6682 - LOCATION
      ?AUTO_6684 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6683 ?AUTO_6680 ) ( IN-CITY ?AUTO_6678 ?AUTO_6680 ) ( not ( = ?AUTO_6678 ?AUTO_6683 ) ) ( TRUCK-AT ?AUTO_6679 ?AUTO_6681 ) ( IN-CITY ?AUTO_6681 ?AUTO_6680 ) ( not ( = ?AUTO_6683 ?AUTO_6681 ) ) ( not ( = ?AUTO_6678 ?AUTO_6681 ) ) ( AIRPORT ?AUTO_6682 ) ( AIRPORT ?AUTO_6683 ) ( AIRPLANE-AT ?AUTO_6684 ?AUTO_6682 ) ( not ( = ?AUTO_6682 ?AUTO_6683 ) ) ( not ( = ?AUTO_6678 ?AUTO_6682 ) ) ( not ( = ?AUTO_6681 ?AUTO_6682 ) ) ( OBJ-AT ?AUTO_6677 ?AUTO_6682 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6677 ?AUTO_6684 ?AUTO_6682 )
      ( DELIVER-PKG ?AUTO_6677 ?AUTO_6678 )
      ( DELIVER-PKG-VERIFY ?AUTO_6677 ?AUTO_6678 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6687 - OBJ
      ?AUTO_6688 - LOCATION
    )
    :vars
    (
      ?AUTO_6689 - LOCATION
      ?AUTO_6694 - CITY
      ?AUTO_6691 - TRUCK
      ?AUTO_6690 - LOCATION
      ?AUTO_6693 - LOCATION
      ?AUTO_6692 - AIRPLANE
      ?AUTO_6695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6689 ?AUTO_6694 ) ( IN-CITY ?AUTO_6688 ?AUTO_6694 ) ( not ( = ?AUTO_6688 ?AUTO_6689 ) ) ( TRUCK-AT ?AUTO_6691 ?AUTO_6690 ) ( IN-CITY ?AUTO_6690 ?AUTO_6694 ) ( not ( = ?AUTO_6689 ?AUTO_6690 ) ) ( not ( = ?AUTO_6688 ?AUTO_6690 ) ) ( AIRPORT ?AUTO_6693 ) ( AIRPORT ?AUTO_6689 ) ( AIRPLANE-AT ?AUTO_6692 ?AUTO_6693 ) ( not ( = ?AUTO_6693 ?AUTO_6689 ) ) ( not ( = ?AUTO_6688 ?AUTO_6693 ) ) ( not ( = ?AUTO_6690 ?AUTO_6693 ) ) ( TRUCK-AT ?AUTO_6695 ?AUTO_6693 ) ( IN-TRUCK ?AUTO_6687 ?AUTO_6695 ) ( not ( = ?AUTO_6691 ?AUTO_6695 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6687 ?AUTO_6695 ?AUTO_6693 )
      ( DELIVER-PKG ?AUTO_6687 ?AUTO_6688 )
      ( DELIVER-PKG-VERIFY ?AUTO_6687 ?AUTO_6688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6698 - OBJ
      ?AUTO_6699 - LOCATION
    )
    :vars
    (
      ?AUTO_6701 - LOCATION
      ?AUTO_6700 - CITY
      ?AUTO_6702 - TRUCK
      ?AUTO_6706 - LOCATION
      ?AUTO_6704 - LOCATION
      ?AUTO_6703 - AIRPLANE
      ?AUTO_6705 - TRUCK
      ?AUTO_6707 - LOCATION
      ?AUTO_6708 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6701 ?AUTO_6700 ) ( IN-CITY ?AUTO_6699 ?AUTO_6700 ) ( not ( = ?AUTO_6699 ?AUTO_6701 ) ) ( TRUCK-AT ?AUTO_6702 ?AUTO_6706 ) ( IN-CITY ?AUTO_6706 ?AUTO_6700 ) ( not ( = ?AUTO_6701 ?AUTO_6706 ) ) ( not ( = ?AUTO_6699 ?AUTO_6706 ) ) ( AIRPORT ?AUTO_6704 ) ( AIRPORT ?AUTO_6701 ) ( AIRPLANE-AT ?AUTO_6703 ?AUTO_6704 ) ( not ( = ?AUTO_6704 ?AUTO_6701 ) ) ( not ( = ?AUTO_6699 ?AUTO_6704 ) ) ( not ( = ?AUTO_6706 ?AUTO_6704 ) ) ( IN-TRUCK ?AUTO_6698 ?AUTO_6705 ) ( not ( = ?AUTO_6702 ?AUTO_6705 ) ) ( TRUCK-AT ?AUTO_6705 ?AUTO_6707 ) ( IN-CITY ?AUTO_6707 ?AUTO_6708 ) ( IN-CITY ?AUTO_6704 ?AUTO_6708 ) ( not ( = ?AUTO_6704 ?AUTO_6707 ) ) ( not ( = ?AUTO_6699 ?AUTO_6707 ) ) ( not ( = ?AUTO_6701 ?AUTO_6707 ) ) ( not ( = ?AUTO_6700 ?AUTO_6708 ) ) ( not ( = ?AUTO_6706 ?AUTO_6707 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6705 ?AUTO_6707 ?AUTO_6704 ?AUTO_6708 )
      ( DELIVER-PKG ?AUTO_6698 ?AUTO_6699 )
      ( DELIVER-PKG-VERIFY ?AUTO_6698 ?AUTO_6699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6709 - OBJ
      ?AUTO_6710 - LOCATION
    )
    :vars
    (
      ?AUTO_6712 - LOCATION
      ?AUTO_6713 - CITY
      ?AUTO_6715 - TRUCK
      ?AUTO_6716 - LOCATION
      ?AUTO_6719 - LOCATION
      ?AUTO_6714 - AIRPLANE
      ?AUTO_6717 - TRUCK
      ?AUTO_6718 - LOCATION
      ?AUTO_6711 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6712 ?AUTO_6713 ) ( IN-CITY ?AUTO_6710 ?AUTO_6713 ) ( not ( = ?AUTO_6710 ?AUTO_6712 ) ) ( TRUCK-AT ?AUTO_6715 ?AUTO_6716 ) ( IN-CITY ?AUTO_6716 ?AUTO_6713 ) ( not ( = ?AUTO_6712 ?AUTO_6716 ) ) ( not ( = ?AUTO_6710 ?AUTO_6716 ) ) ( AIRPORT ?AUTO_6719 ) ( AIRPORT ?AUTO_6712 ) ( AIRPLANE-AT ?AUTO_6714 ?AUTO_6719 ) ( not ( = ?AUTO_6719 ?AUTO_6712 ) ) ( not ( = ?AUTO_6710 ?AUTO_6719 ) ) ( not ( = ?AUTO_6716 ?AUTO_6719 ) ) ( not ( = ?AUTO_6715 ?AUTO_6717 ) ) ( TRUCK-AT ?AUTO_6717 ?AUTO_6718 ) ( IN-CITY ?AUTO_6718 ?AUTO_6711 ) ( IN-CITY ?AUTO_6719 ?AUTO_6711 ) ( not ( = ?AUTO_6719 ?AUTO_6718 ) ) ( not ( = ?AUTO_6710 ?AUTO_6718 ) ) ( not ( = ?AUTO_6712 ?AUTO_6718 ) ) ( not ( = ?AUTO_6713 ?AUTO_6711 ) ) ( not ( = ?AUTO_6716 ?AUTO_6718 ) ) ( OBJ-AT ?AUTO_6709 ?AUTO_6718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6709 ?AUTO_6717 ?AUTO_6718 )
      ( DELIVER-PKG ?AUTO_6709 ?AUTO_6710 )
      ( DELIVER-PKG-VERIFY ?AUTO_6709 ?AUTO_6710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6722 - OBJ
      ?AUTO_6723 - LOCATION
    )
    :vars
    (
      ?AUTO_6724 - LOCATION
      ?AUTO_6728 - CITY
      ?AUTO_6725 - TRUCK
      ?AUTO_6726 - LOCATION
      ?AUTO_6732 - LOCATION
      ?AUTO_6727 - AIRPLANE
      ?AUTO_6731 - TRUCK
      ?AUTO_6729 - LOCATION
      ?AUTO_6730 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6724 ?AUTO_6728 ) ( IN-CITY ?AUTO_6723 ?AUTO_6728 ) ( not ( = ?AUTO_6723 ?AUTO_6724 ) ) ( TRUCK-AT ?AUTO_6725 ?AUTO_6726 ) ( IN-CITY ?AUTO_6726 ?AUTO_6728 ) ( not ( = ?AUTO_6724 ?AUTO_6726 ) ) ( not ( = ?AUTO_6723 ?AUTO_6726 ) ) ( AIRPORT ?AUTO_6732 ) ( AIRPORT ?AUTO_6724 ) ( AIRPLANE-AT ?AUTO_6727 ?AUTO_6732 ) ( not ( = ?AUTO_6732 ?AUTO_6724 ) ) ( not ( = ?AUTO_6723 ?AUTO_6732 ) ) ( not ( = ?AUTO_6726 ?AUTO_6732 ) ) ( not ( = ?AUTO_6725 ?AUTO_6731 ) ) ( IN-CITY ?AUTO_6729 ?AUTO_6730 ) ( IN-CITY ?AUTO_6732 ?AUTO_6730 ) ( not ( = ?AUTO_6732 ?AUTO_6729 ) ) ( not ( = ?AUTO_6723 ?AUTO_6729 ) ) ( not ( = ?AUTO_6724 ?AUTO_6729 ) ) ( not ( = ?AUTO_6728 ?AUTO_6730 ) ) ( not ( = ?AUTO_6726 ?AUTO_6729 ) ) ( OBJ-AT ?AUTO_6722 ?AUTO_6729 ) ( TRUCK-AT ?AUTO_6731 ?AUTO_6732 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6731 ?AUTO_6732 ?AUTO_6729 ?AUTO_6730 )
      ( DELIVER-PKG ?AUTO_6722 ?AUTO_6723 )
      ( DELIVER-PKG-VERIFY ?AUTO_6722 ?AUTO_6723 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6735 - OBJ
      ?AUTO_6736 - LOCATION
    )
    :vars
    (
      ?AUTO_6737 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6737 ?AUTO_6736 ) ( IN-TRUCK ?AUTO_6735 ?AUTO_6737 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6735 ?AUTO_6737 ?AUTO_6736 )
      ( DELIVER-PKG-VERIFY ?AUTO_6735 ?AUTO_6736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6738 - OBJ
      ?AUTO_6739 - LOCATION
    )
    :vars
    (
      ?AUTO_6740 - TRUCK
      ?AUTO_6741 - LOCATION
      ?AUTO_6742 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6738 ?AUTO_6740 ) ( TRUCK-AT ?AUTO_6740 ?AUTO_6741 ) ( IN-CITY ?AUTO_6741 ?AUTO_6742 ) ( IN-CITY ?AUTO_6739 ?AUTO_6742 ) ( not ( = ?AUTO_6739 ?AUTO_6741 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6740 ?AUTO_6741 ?AUTO_6739 ?AUTO_6742 )
      ( DELIVER-PKG ?AUTO_6738 ?AUTO_6739 )
      ( DELIVER-PKG-VERIFY ?AUTO_6738 ?AUTO_6739 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6749 - OBJ
      ?AUTO_6750 - LOCATION
    )
    :vars
    (
      ?AUTO_6752 - TRUCK
      ?AUTO_6753 - LOCATION
      ?AUTO_6751 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6752 ?AUTO_6753 ) ( IN-CITY ?AUTO_6753 ?AUTO_6751 ) ( IN-CITY ?AUTO_6750 ?AUTO_6751 ) ( not ( = ?AUTO_6750 ?AUTO_6753 ) ) ( OBJ-AT ?AUTO_6749 ?AUTO_6753 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6749 ?AUTO_6752 ?AUTO_6753 )
      ( DELIVER-PKG ?AUTO_6749 ?AUTO_6750 )
      ( DELIVER-PKG-VERIFY ?AUTO_6749 ?AUTO_6750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6754 - OBJ
      ?AUTO_6755 - LOCATION
    )
    :vars
    (
      ?AUTO_6757 - LOCATION
      ?AUTO_6756 - CITY
      ?AUTO_6758 - TRUCK
      ?AUTO_6759 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6757 ?AUTO_6756 ) ( IN-CITY ?AUTO_6755 ?AUTO_6756 ) ( not ( = ?AUTO_6755 ?AUTO_6757 ) ) ( OBJ-AT ?AUTO_6754 ?AUTO_6757 ) ( TRUCK-AT ?AUTO_6758 ?AUTO_6759 ) ( IN-CITY ?AUTO_6759 ?AUTO_6756 ) ( not ( = ?AUTO_6757 ?AUTO_6759 ) ) ( not ( = ?AUTO_6755 ?AUTO_6759 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6758 ?AUTO_6759 ?AUTO_6757 ?AUTO_6756 )
      ( DELIVER-PKG ?AUTO_6754 ?AUTO_6755 )
      ( DELIVER-PKG-VERIFY ?AUTO_6754 ?AUTO_6755 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6762 - OBJ
      ?AUTO_6763 - LOCATION
    )
    :vars
    (
      ?AUTO_6764 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6764 ?AUTO_6763 ) ( IN-TRUCK ?AUTO_6762 ?AUTO_6764 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6762 ?AUTO_6764 ?AUTO_6763 )
      ( DELIVER-PKG-VERIFY ?AUTO_6762 ?AUTO_6763 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6769 - OBJ
      ?AUTO_6770 - LOCATION
    )
    :vars
    (
      ?AUTO_6772 - TRUCK
      ?AUTO_6771 - LOCATION
      ?AUTO_6773 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6772 ?AUTO_6771 ) ( IN-CITY ?AUTO_6771 ?AUTO_6773 ) ( IN-CITY ?AUTO_6770 ?AUTO_6773 ) ( not ( = ?AUTO_6770 ?AUTO_6771 ) ) ( OBJ-AT ?AUTO_6769 ?AUTO_6771 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6769 ?AUTO_6772 ?AUTO_6771 )
      ( DELIVER-PKG ?AUTO_6769 ?AUTO_6770 )
      ( DELIVER-PKG-VERIFY ?AUTO_6769 ?AUTO_6770 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6774 - OBJ
      ?AUTO_6775 - LOCATION
    )
    :vars
    (
      ?AUTO_6777 - LOCATION
      ?AUTO_6778 - CITY
      ?AUTO_6776 - TRUCK
      ?AUTO_6779 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6777 ?AUTO_6778 ) ( IN-CITY ?AUTO_6775 ?AUTO_6778 ) ( not ( = ?AUTO_6775 ?AUTO_6777 ) ) ( OBJ-AT ?AUTO_6774 ?AUTO_6777 ) ( TRUCK-AT ?AUTO_6776 ?AUTO_6779 ) ( IN-CITY ?AUTO_6779 ?AUTO_6778 ) ( not ( = ?AUTO_6777 ?AUTO_6779 ) ) ( not ( = ?AUTO_6775 ?AUTO_6779 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6776 ?AUTO_6779 ?AUTO_6777 ?AUTO_6778 )
      ( DELIVER-PKG ?AUTO_6774 ?AUTO_6775 )
      ( DELIVER-PKG-VERIFY ?AUTO_6774 ?AUTO_6775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6788 - OBJ
      ?AUTO_6789 - LOCATION
    )
    :vars
    (
      ?AUTO_6790 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6788 ?AUTO_6790 ) ( AIRPLANE-AT ?AUTO_6790 ?AUTO_6789 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6788 ?AUTO_6790 ?AUTO_6789 )
      ( DELIVER-PKG-VERIFY ?AUTO_6788 ?AUTO_6789 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6793 - OBJ
      ?AUTO_6794 - LOCATION
    )
    :vars
    (
      ?AUTO_6795 - AIRPLANE
      ?AUTO_6796 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6793 ?AUTO_6795 ) ( AIRPORT ?AUTO_6796 ) ( AIRPORT ?AUTO_6794 ) ( AIRPLANE-AT ?AUTO_6795 ?AUTO_6796 ) ( not ( = ?AUTO_6796 ?AUTO_6794 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6795 ?AUTO_6796 ?AUTO_6794 )
      ( DELIVER-PKG ?AUTO_6793 ?AUTO_6794 )
      ( DELIVER-PKG-VERIFY ?AUTO_6793 ?AUTO_6794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6797 - OBJ
      ?AUTO_6798 - LOCATION
    )
    :vars
    (
      ?AUTO_6800 - LOCATION
      ?AUTO_6799 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6800 ) ( AIRPORT ?AUTO_6798 ) ( AIRPLANE-AT ?AUTO_6799 ?AUTO_6800 ) ( not ( = ?AUTO_6800 ?AUTO_6798 ) ) ( OBJ-AT ?AUTO_6797 ?AUTO_6800 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6797 ?AUTO_6799 ?AUTO_6800 )
      ( DELIVER-PKG ?AUTO_6797 ?AUTO_6798 )
      ( DELIVER-PKG-VERIFY ?AUTO_6797 ?AUTO_6798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6803 - OBJ
      ?AUTO_6804 - LOCATION
    )
    :vars
    (
      ?AUTO_6806 - LOCATION
      ?AUTO_6807 - LOCATION
      ?AUTO_6805 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6806 ) ( AIRPORT ?AUTO_6804 ) ( not ( = ?AUTO_6806 ?AUTO_6804 ) ) ( OBJ-AT ?AUTO_6803 ?AUTO_6806 ) ( AIRPORT ?AUTO_6807 ) ( AIRPLANE-AT ?AUTO_6805 ?AUTO_6807 ) ( not ( = ?AUTO_6807 ?AUTO_6806 ) ) ( not ( = ?AUTO_6804 ?AUTO_6807 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6805 ?AUTO_6807 ?AUTO_6806 )
      ( DELIVER-PKG ?AUTO_6803 ?AUTO_6804 )
      ( DELIVER-PKG-VERIFY ?AUTO_6803 ?AUTO_6804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6808 - OBJ
      ?AUTO_6809 - LOCATION
    )
    :vars
    (
      ?AUTO_6811 - LOCATION
      ?AUTO_6812 - LOCATION
      ?AUTO_6810 - AIRPLANE
      ?AUTO_6813 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6811 ) ( AIRPORT ?AUTO_6809 ) ( not ( = ?AUTO_6811 ?AUTO_6809 ) ) ( AIRPORT ?AUTO_6812 ) ( AIRPLANE-AT ?AUTO_6810 ?AUTO_6812 ) ( not ( = ?AUTO_6812 ?AUTO_6811 ) ) ( not ( = ?AUTO_6809 ?AUTO_6812 ) ) ( TRUCK-AT ?AUTO_6813 ?AUTO_6811 ) ( IN-TRUCK ?AUTO_6808 ?AUTO_6813 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6808 ?AUTO_6813 ?AUTO_6811 )
      ( DELIVER-PKG ?AUTO_6808 ?AUTO_6809 )
      ( DELIVER-PKG-VERIFY ?AUTO_6808 ?AUTO_6809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6816 - OBJ
      ?AUTO_6817 - LOCATION
    )
    :vars
    (
      ?AUTO_6821 - LOCATION
      ?AUTO_6820 - LOCATION
      ?AUTO_6819 - AIRPLANE
      ?AUTO_6818 - TRUCK
      ?AUTO_6822 - LOCATION
      ?AUTO_6823 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6821 ) ( AIRPORT ?AUTO_6817 ) ( not ( = ?AUTO_6821 ?AUTO_6817 ) ) ( AIRPORT ?AUTO_6820 ) ( AIRPLANE-AT ?AUTO_6819 ?AUTO_6820 ) ( not ( = ?AUTO_6820 ?AUTO_6821 ) ) ( not ( = ?AUTO_6817 ?AUTO_6820 ) ) ( IN-TRUCK ?AUTO_6816 ?AUTO_6818 ) ( TRUCK-AT ?AUTO_6818 ?AUTO_6822 ) ( IN-CITY ?AUTO_6822 ?AUTO_6823 ) ( IN-CITY ?AUTO_6821 ?AUTO_6823 ) ( not ( = ?AUTO_6821 ?AUTO_6822 ) ) ( not ( = ?AUTO_6817 ?AUTO_6822 ) ) ( not ( = ?AUTO_6820 ?AUTO_6822 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6818 ?AUTO_6822 ?AUTO_6821 ?AUTO_6823 )
      ( DELIVER-PKG ?AUTO_6816 ?AUTO_6817 )
      ( DELIVER-PKG-VERIFY ?AUTO_6816 ?AUTO_6817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6824 - OBJ
      ?AUTO_6825 - LOCATION
    )
    :vars
    (
      ?AUTO_6827 - LOCATION
      ?AUTO_6829 - LOCATION
      ?AUTO_6828 - AIRPLANE
      ?AUTO_6826 - TRUCK
      ?AUTO_6831 - LOCATION
      ?AUTO_6830 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6827 ) ( AIRPORT ?AUTO_6825 ) ( not ( = ?AUTO_6827 ?AUTO_6825 ) ) ( AIRPORT ?AUTO_6829 ) ( AIRPLANE-AT ?AUTO_6828 ?AUTO_6829 ) ( not ( = ?AUTO_6829 ?AUTO_6827 ) ) ( not ( = ?AUTO_6825 ?AUTO_6829 ) ) ( TRUCK-AT ?AUTO_6826 ?AUTO_6831 ) ( IN-CITY ?AUTO_6831 ?AUTO_6830 ) ( IN-CITY ?AUTO_6827 ?AUTO_6830 ) ( not ( = ?AUTO_6827 ?AUTO_6831 ) ) ( not ( = ?AUTO_6825 ?AUTO_6831 ) ) ( not ( = ?AUTO_6829 ?AUTO_6831 ) ) ( OBJ-AT ?AUTO_6824 ?AUTO_6831 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6824 ?AUTO_6826 ?AUTO_6831 )
      ( DELIVER-PKG ?AUTO_6824 ?AUTO_6825 )
      ( DELIVER-PKG-VERIFY ?AUTO_6824 ?AUTO_6825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6832 - OBJ
      ?AUTO_6833 - LOCATION
    )
    :vars
    (
      ?AUTO_6834 - LOCATION
      ?AUTO_6839 - LOCATION
      ?AUTO_6838 - AIRPLANE
      ?AUTO_6836 - LOCATION
      ?AUTO_6835 - CITY
      ?AUTO_6837 - TRUCK
      ?AUTO_6840 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6834 ) ( AIRPORT ?AUTO_6833 ) ( not ( = ?AUTO_6834 ?AUTO_6833 ) ) ( AIRPORT ?AUTO_6839 ) ( AIRPLANE-AT ?AUTO_6838 ?AUTO_6839 ) ( not ( = ?AUTO_6839 ?AUTO_6834 ) ) ( not ( = ?AUTO_6833 ?AUTO_6839 ) ) ( IN-CITY ?AUTO_6836 ?AUTO_6835 ) ( IN-CITY ?AUTO_6834 ?AUTO_6835 ) ( not ( = ?AUTO_6834 ?AUTO_6836 ) ) ( not ( = ?AUTO_6833 ?AUTO_6836 ) ) ( not ( = ?AUTO_6839 ?AUTO_6836 ) ) ( OBJ-AT ?AUTO_6832 ?AUTO_6836 ) ( TRUCK-AT ?AUTO_6837 ?AUTO_6840 ) ( IN-CITY ?AUTO_6840 ?AUTO_6835 ) ( not ( = ?AUTO_6836 ?AUTO_6840 ) ) ( not ( = ?AUTO_6833 ?AUTO_6840 ) ) ( not ( = ?AUTO_6834 ?AUTO_6840 ) ) ( not ( = ?AUTO_6839 ?AUTO_6840 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6837 ?AUTO_6840 ?AUTO_6836 ?AUTO_6835 )
      ( DELIVER-PKG ?AUTO_6832 ?AUTO_6833 )
      ( DELIVER-PKG-VERIFY ?AUTO_6832 ?AUTO_6833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6849 - OBJ
      ?AUTO_6850 - LOCATION
    )
    :vars
    (
      ?AUTO_6851 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6849 ?AUTO_6851 ) ( AIRPLANE-AT ?AUTO_6851 ?AUTO_6850 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6849 ?AUTO_6851 ?AUTO_6850 )
      ( DELIVER-PKG-VERIFY ?AUTO_6849 ?AUTO_6850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6852 - OBJ
      ?AUTO_6853 - LOCATION
    )
    :vars
    (
      ?AUTO_6854 - AIRPLANE
      ?AUTO_6855 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6852 ?AUTO_6854 ) ( AIRPORT ?AUTO_6855 ) ( AIRPORT ?AUTO_6853 ) ( AIRPLANE-AT ?AUTO_6854 ?AUTO_6855 ) ( not ( = ?AUTO_6855 ?AUTO_6853 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6854 ?AUTO_6855 ?AUTO_6853 )
      ( DELIVER-PKG ?AUTO_6852 ?AUTO_6853 )
      ( DELIVER-PKG-VERIFY ?AUTO_6852 ?AUTO_6853 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6886 - OBJ
      ?AUTO_6887 - LOCATION
    )
    :vars
    (
      ?AUTO_6888 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6886 ?AUTO_6888 ) ( AIRPLANE-AT ?AUTO_6888 ?AUTO_6887 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6886 ?AUTO_6888 ?AUTO_6887 )
      ( DELIVER-PKG-VERIFY ?AUTO_6886 ?AUTO_6887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6895 - OBJ
      ?AUTO_6896 - LOCATION
    )
    :vars
    (
      ?AUTO_6898 - LOCATION
      ?AUTO_6897 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6898 ) ( AIRPORT ?AUTO_6896 ) ( AIRPLANE-AT ?AUTO_6897 ?AUTO_6898 ) ( not ( = ?AUTO_6898 ?AUTO_6896 ) ) ( OBJ-AT ?AUTO_6895 ?AUTO_6898 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6895 ?AUTO_6897 ?AUTO_6898 )
      ( DELIVER-PKG ?AUTO_6895 ?AUTO_6896 )
      ( DELIVER-PKG-VERIFY ?AUTO_6895 ?AUTO_6896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6899 - OBJ
      ?AUTO_6900 - LOCATION
    )
    :vars
    (
      ?AUTO_6902 - LOCATION
      ?AUTO_6903 - LOCATION
      ?AUTO_6901 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6902 ) ( AIRPORT ?AUTO_6900 ) ( not ( = ?AUTO_6902 ?AUTO_6900 ) ) ( OBJ-AT ?AUTO_6899 ?AUTO_6902 ) ( AIRPORT ?AUTO_6903 ) ( AIRPLANE-AT ?AUTO_6901 ?AUTO_6903 ) ( not ( = ?AUTO_6903 ?AUTO_6902 ) ) ( not ( = ?AUTO_6900 ?AUTO_6903 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6901 ?AUTO_6903 ?AUTO_6902 )
      ( DELIVER-PKG ?AUTO_6899 ?AUTO_6900 )
      ( DELIVER-PKG-VERIFY ?AUTO_6899 ?AUTO_6900 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6928 - OBJ
      ?AUTO_6929 - LOCATION
    )
    :vars
    (
      ?AUTO_6930 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6930 ?AUTO_6929 ) ( IN-TRUCK ?AUTO_6928 ?AUTO_6930 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6928 ?AUTO_6930 ?AUTO_6929 )
      ( DELIVER-PKG-VERIFY ?AUTO_6928 ?AUTO_6929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6931 - OBJ
      ?AUTO_6932 - LOCATION
    )
    :vars
    (
      ?AUTO_6933 - TRUCK
      ?AUTO_6934 - LOCATION
      ?AUTO_6935 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6931 ?AUTO_6933 ) ( TRUCK-AT ?AUTO_6933 ?AUTO_6934 ) ( IN-CITY ?AUTO_6934 ?AUTO_6935 ) ( IN-CITY ?AUTO_6932 ?AUTO_6935 ) ( not ( = ?AUTO_6932 ?AUTO_6934 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6933 ?AUTO_6934 ?AUTO_6932 ?AUTO_6935 )
      ( DELIVER-PKG ?AUTO_6931 ?AUTO_6932 )
      ( DELIVER-PKG-VERIFY ?AUTO_6931 ?AUTO_6932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6936 - OBJ
      ?AUTO_6937 - LOCATION
    )
    :vars
    (
      ?AUTO_6938 - TRUCK
      ?AUTO_6939 - LOCATION
      ?AUTO_6940 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6938 ?AUTO_6939 ) ( IN-CITY ?AUTO_6939 ?AUTO_6940 ) ( IN-CITY ?AUTO_6937 ?AUTO_6940 ) ( not ( = ?AUTO_6937 ?AUTO_6939 ) ) ( OBJ-AT ?AUTO_6936 ?AUTO_6939 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6936 ?AUTO_6938 ?AUTO_6939 )
      ( DELIVER-PKG ?AUTO_6936 ?AUTO_6937 )
      ( DELIVER-PKG-VERIFY ?AUTO_6936 ?AUTO_6937 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6941 - OBJ
      ?AUTO_6942 - LOCATION
    )
    :vars
    (
      ?AUTO_6943 - LOCATION
      ?AUTO_6945 - CITY
      ?AUTO_6944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6943 ?AUTO_6945 ) ( IN-CITY ?AUTO_6942 ?AUTO_6945 ) ( not ( = ?AUTO_6942 ?AUTO_6943 ) ) ( OBJ-AT ?AUTO_6941 ?AUTO_6943 ) ( TRUCK-AT ?AUTO_6944 ?AUTO_6942 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6944 ?AUTO_6942 ?AUTO_6943 ?AUTO_6945 )
      ( DELIVER-PKG ?AUTO_6941 ?AUTO_6942 )
      ( DELIVER-PKG-VERIFY ?AUTO_6941 ?AUTO_6942 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6982 - OBJ
      ?AUTO_6983 - LOCATION
    )
    :vars
    (
      ?AUTO_6984 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6984 ?AUTO_6983 ) ( IN-TRUCK ?AUTO_6982 ?AUTO_6984 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6982 ?AUTO_6984 ?AUTO_6983 )
      ( DELIVER-PKG-VERIFY ?AUTO_6982 ?AUTO_6983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6985 - OBJ
      ?AUTO_6986 - LOCATION
    )
    :vars
    (
      ?AUTO_6987 - TRUCK
      ?AUTO_6988 - LOCATION
      ?AUTO_6989 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6985 ?AUTO_6987 ) ( TRUCK-AT ?AUTO_6987 ?AUTO_6988 ) ( IN-CITY ?AUTO_6988 ?AUTO_6989 ) ( IN-CITY ?AUTO_6986 ?AUTO_6989 ) ( not ( = ?AUTO_6986 ?AUTO_6988 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6987 ?AUTO_6988 ?AUTO_6986 ?AUTO_6989 )
      ( DELIVER-PKG ?AUTO_6985 ?AUTO_6986 )
      ( DELIVER-PKG-VERIFY ?AUTO_6985 ?AUTO_6986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6990 - OBJ
      ?AUTO_6991 - LOCATION
    )
    :vars
    (
      ?AUTO_6992 - TRUCK
      ?AUTO_6993 - LOCATION
      ?AUTO_6994 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6992 ?AUTO_6993 ) ( IN-CITY ?AUTO_6993 ?AUTO_6994 ) ( IN-CITY ?AUTO_6991 ?AUTO_6994 ) ( not ( = ?AUTO_6991 ?AUTO_6993 ) ) ( OBJ-AT ?AUTO_6990 ?AUTO_6993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6990 ?AUTO_6992 ?AUTO_6993 )
      ( DELIVER-PKG ?AUTO_6990 ?AUTO_6991 )
      ( DELIVER-PKG-VERIFY ?AUTO_6990 ?AUTO_6991 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6995 - OBJ
      ?AUTO_6996 - LOCATION
    )
    :vars
    (
      ?AUTO_6997 - LOCATION
      ?AUTO_6999 - CITY
      ?AUTO_6998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6997 ?AUTO_6999 ) ( IN-CITY ?AUTO_6996 ?AUTO_6999 ) ( not ( = ?AUTO_6996 ?AUTO_6997 ) ) ( OBJ-AT ?AUTO_6995 ?AUTO_6997 ) ( TRUCK-AT ?AUTO_6998 ?AUTO_6996 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6998 ?AUTO_6996 ?AUTO_6997 ?AUTO_6999 )
      ( DELIVER-PKG ?AUTO_6995 ?AUTO_6996 )
      ( DELIVER-PKG-VERIFY ?AUTO_6995 ?AUTO_6996 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7044 - OBJ
      ?AUTO_7045 - LOCATION
    )
    :vars
    (
      ?AUTO_7046 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7046 ?AUTO_7045 ) ( IN-TRUCK ?AUTO_7044 ?AUTO_7046 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7044 ?AUTO_7046 ?AUTO_7045 )
      ( DELIVER-PKG-VERIFY ?AUTO_7044 ?AUTO_7045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7047 - OBJ
      ?AUTO_7048 - LOCATION
    )
    :vars
    (
      ?AUTO_7049 - TRUCK
      ?AUTO_7050 - LOCATION
      ?AUTO_7051 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7047 ?AUTO_7049 ) ( TRUCK-AT ?AUTO_7049 ?AUTO_7050 ) ( IN-CITY ?AUTO_7050 ?AUTO_7051 ) ( IN-CITY ?AUTO_7048 ?AUTO_7051 ) ( not ( = ?AUTO_7048 ?AUTO_7050 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7049 ?AUTO_7050 ?AUTO_7048 ?AUTO_7051 )
      ( DELIVER-PKG ?AUTO_7047 ?AUTO_7048 )
      ( DELIVER-PKG-VERIFY ?AUTO_7047 ?AUTO_7048 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7112 - OBJ
      ?AUTO_7113 - LOCATION
    )
    :vars
    (
      ?AUTO_7114 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7112 ?AUTO_7114 ) ( AIRPLANE-AT ?AUTO_7114 ?AUTO_7113 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7112 ?AUTO_7114 ?AUTO_7113 )
      ( DELIVER-PKG-VERIFY ?AUTO_7112 ?AUTO_7113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7115 - OBJ
      ?AUTO_7116 - LOCATION
    )
    :vars
    (
      ?AUTO_7117 - AIRPLANE
      ?AUTO_7118 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7115 ?AUTO_7117 ) ( AIRPORT ?AUTO_7118 ) ( AIRPORT ?AUTO_7116 ) ( AIRPLANE-AT ?AUTO_7117 ?AUTO_7118 ) ( not ( = ?AUTO_7118 ?AUTO_7116 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7117 ?AUTO_7118 ?AUTO_7116 )
      ( DELIVER-PKG ?AUTO_7115 ?AUTO_7116 )
      ( DELIVER-PKG-VERIFY ?AUTO_7115 ?AUTO_7116 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7129 - OBJ
      ?AUTO_7130 - LOCATION
    )
    :vars
    (
      ?AUTO_7132 - LOCATION
      ?AUTO_7131 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7132 ) ( AIRPORT ?AUTO_7130 ) ( AIRPLANE-AT ?AUTO_7131 ?AUTO_7132 ) ( not ( = ?AUTO_7132 ?AUTO_7130 ) ) ( OBJ-AT ?AUTO_7129 ?AUTO_7132 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7129 ?AUTO_7131 ?AUTO_7132 )
      ( DELIVER-PKG ?AUTO_7129 ?AUTO_7130 )
      ( DELIVER-PKG-VERIFY ?AUTO_7129 ?AUTO_7130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7133 - OBJ
      ?AUTO_7134 - LOCATION
    )
    :vars
    (
      ?AUTO_7136 - LOCATION
      ?AUTO_7137 - LOCATION
      ?AUTO_7135 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7136 ) ( AIRPORT ?AUTO_7134 ) ( not ( = ?AUTO_7136 ?AUTO_7134 ) ) ( OBJ-AT ?AUTO_7133 ?AUTO_7136 ) ( AIRPORT ?AUTO_7137 ) ( AIRPLANE-AT ?AUTO_7135 ?AUTO_7137 ) ( not ( = ?AUTO_7137 ?AUTO_7136 ) ) ( not ( = ?AUTO_7134 ?AUTO_7137 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7135 ?AUTO_7137 ?AUTO_7136 )
      ( DELIVER-PKG ?AUTO_7133 ?AUTO_7134 )
      ( DELIVER-PKG-VERIFY ?AUTO_7133 ?AUTO_7134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7146 - OBJ
      ?AUTO_7147 - LOCATION
    )
    :vars
    (
      ?AUTO_7150 - LOCATION
      ?AUTO_7148 - LOCATION
      ?AUTO_7149 - AIRPLANE
      ?AUTO_7151 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7150 ) ( AIRPORT ?AUTO_7147 ) ( not ( = ?AUTO_7150 ?AUTO_7147 ) ) ( AIRPORT ?AUTO_7148 ) ( AIRPLANE-AT ?AUTO_7149 ?AUTO_7148 ) ( not ( = ?AUTO_7148 ?AUTO_7150 ) ) ( not ( = ?AUTO_7147 ?AUTO_7148 ) ) ( TRUCK-AT ?AUTO_7151 ?AUTO_7150 ) ( IN-TRUCK ?AUTO_7146 ?AUTO_7151 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7146 ?AUTO_7151 ?AUTO_7150 )
      ( DELIVER-PKG ?AUTO_7146 ?AUTO_7147 )
      ( DELIVER-PKG-VERIFY ?AUTO_7146 ?AUTO_7147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7152 - OBJ
      ?AUTO_7153 - LOCATION
    )
    :vars
    (
      ?AUTO_7156 - LOCATION
      ?AUTO_7155 - LOCATION
      ?AUTO_7154 - AIRPLANE
      ?AUTO_7157 - TRUCK
      ?AUTO_7158 - LOCATION
      ?AUTO_7159 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7156 ) ( AIRPORT ?AUTO_7153 ) ( not ( = ?AUTO_7156 ?AUTO_7153 ) ) ( AIRPORT ?AUTO_7155 ) ( AIRPLANE-AT ?AUTO_7154 ?AUTO_7155 ) ( not ( = ?AUTO_7155 ?AUTO_7156 ) ) ( not ( = ?AUTO_7153 ?AUTO_7155 ) ) ( IN-TRUCK ?AUTO_7152 ?AUTO_7157 ) ( TRUCK-AT ?AUTO_7157 ?AUTO_7158 ) ( IN-CITY ?AUTO_7158 ?AUTO_7159 ) ( IN-CITY ?AUTO_7156 ?AUTO_7159 ) ( not ( = ?AUTO_7156 ?AUTO_7158 ) ) ( not ( = ?AUTO_7153 ?AUTO_7158 ) ) ( not ( = ?AUTO_7155 ?AUTO_7158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7157 ?AUTO_7158 ?AUTO_7156 ?AUTO_7159 )
      ( DELIVER-PKG ?AUTO_7152 ?AUTO_7153 )
      ( DELIVER-PKG-VERIFY ?AUTO_7152 ?AUTO_7153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7160 - OBJ
      ?AUTO_7161 - LOCATION
    )
    :vars
    (
      ?AUTO_7166 - LOCATION
      ?AUTO_7164 - LOCATION
      ?AUTO_7163 - AIRPLANE
      ?AUTO_7162 - TRUCK
      ?AUTO_7165 - LOCATION
      ?AUTO_7167 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7166 ) ( AIRPORT ?AUTO_7161 ) ( not ( = ?AUTO_7166 ?AUTO_7161 ) ) ( AIRPORT ?AUTO_7164 ) ( AIRPLANE-AT ?AUTO_7163 ?AUTO_7164 ) ( not ( = ?AUTO_7164 ?AUTO_7166 ) ) ( not ( = ?AUTO_7161 ?AUTO_7164 ) ) ( TRUCK-AT ?AUTO_7162 ?AUTO_7165 ) ( IN-CITY ?AUTO_7165 ?AUTO_7167 ) ( IN-CITY ?AUTO_7166 ?AUTO_7167 ) ( not ( = ?AUTO_7166 ?AUTO_7165 ) ) ( not ( = ?AUTO_7161 ?AUTO_7165 ) ) ( not ( = ?AUTO_7164 ?AUTO_7165 ) ) ( OBJ-AT ?AUTO_7160 ?AUTO_7165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7160 ?AUTO_7162 ?AUTO_7165 )
      ( DELIVER-PKG ?AUTO_7160 ?AUTO_7161 )
      ( DELIVER-PKG-VERIFY ?AUTO_7160 ?AUTO_7161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7168 - OBJ
      ?AUTO_7169 - LOCATION
    )
    :vars
    (
      ?AUTO_7174 - LOCATION
      ?AUTO_7175 - LOCATION
      ?AUTO_7171 - AIRPLANE
      ?AUTO_7173 - LOCATION
      ?AUTO_7172 - CITY
      ?AUTO_7170 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7174 ) ( AIRPORT ?AUTO_7169 ) ( not ( = ?AUTO_7174 ?AUTO_7169 ) ) ( AIRPORT ?AUTO_7175 ) ( AIRPLANE-AT ?AUTO_7171 ?AUTO_7175 ) ( not ( = ?AUTO_7175 ?AUTO_7174 ) ) ( not ( = ?AUTO_7169 ?AUTO_7175 ) ) ( IN-CITY ?AUTO_7173 ?AUTO_7172 ) ( IN-CITY ?AUTO_7174 ?AUTO_7172 ) ( not ( = ?AUTO_7174 ?AUTO_7173 ) ) ( not ( = ?AUTO_7169 ?AUTO_7173 ) ) ( not ( = ?AUTO_7175 ?AUTO_7173 ) ) ( OBJ-AT ?AUTO_7168 ?AUTO_7173 ) ( TRUCK-AT ?AUTO_7170 ?AUTO_7174 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7170 ?AUTO_7174 ?AUTO_7173 ?AUTO_7172 )
      ( DELIVER-PKG ?AUTO_7168 ?AUTO_7169 )
      ( DELIVER-PKG-VERIFY ?AUTO_7168 ?AUTO_7169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7212 - OBJ
      ?AUTO_7213 - LOCATION
    )
    :vars
    (
      ?AUTO_7214 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7212 ?AUTO_7214 ) ( AIRPLANE-AT ?AUTO_7214 ?AUTO_7213 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7212 ?AUTO_7214 ?AUTO_7213 )
      ( DELIVER-PKG-VERIFY ?AUTO_7212 ?AUTO_7213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7219 - OBJ
      ?AUTO_7220 - LOCATION
    )
    :vars
    (
      ?AUTO_7221 - LOCATION
      ?AUTO_7222 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7221 ) ( AIRPORT ?AUTO_7220 ) ( AIRPLANE-AT ?AUTO_7222 ?AUTO_7221 ) ( not ( = ?AUTO_7221 ?AUTO_7220 ) ) ( OBJ-AT ?AUTO_7219 ?AUTO_7221 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7219 ?AUTO_7222 ?AUTO_7221 )
      ( DELIVER-PKG ?AUTO_7219 ?AUTO_7220 )
      ( DELIVER-PKG-VERIFY ?AUTO_7219 ?AUTO_7220 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7223 - OBJ
      ?AUTO_7224 - LOCATION
    )
    :vars
    (
      ?AUTO_7226 - LOCATION
      ?AUTO_7225 - AIRPLANE
      ?AUTO_7227 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7226 ) ( AIRPORT ?AUTO_7224 ) ( AIRPLANE-AT ?AUTO_7225 ?AUTO_7226 ) ( not ( = ?AUTO_7226 ?AUTO_7224 ) ) ( TRUCK-AT ?AUTO_7227 ?AUTO_7226 ) ( IN-TRUCK ?AUTO_7223 ?AUTO_7227 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7223 ?AUTO_7227 ?AUTO_7226 )
      ( DELIVER-PKG ?AUTO_7223 ?AUTO_7224 )
      ( DELIVER-PKG-VERIFY ?AUTO_7223 ?AUTO_7224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7228 - OBJ
      ?AUTO_7229 - LOCATION
    )
    :vars
    (
      ?AUTO_7230 - LOCATION
      ?AUTO_7231 - AIRPLANE
      ?AUTO_7232 - TRUCK
      ?AUTO_7233 - LOCATION
      ?AUTO_7234 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7230 ) ( AIRPORT ?AUTO_7229 ) ( AIRPLANE-AT ?AUTO_7231 ?AUTO_7230 ) ( not ( = ?AUTO_7230 ?AUTO_7229 ) ) ( IN-TRUCK ?AUTO_7228 ?AUTO_7232 ) ( TRUCK-AT ?AUTO_7232 ?AUTO_7233 ) ( IN-CITY ?AUTO_7233 ?AUTO_7234 ) ( IN-CITY ?AUTO_7230 ?AUTO_7234 ) ( not ( = ?AUTO_7230 ?AUTO_7233 ) ) ( not ( = ?AUTO_7229 ?AUTO_7233 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7232 ?AUTO_7233 ?AUTO_7230 ?AUTO_7234 )
      ( DELIVER-PKG ?AUTO_7228 ?AUTO_7229 )
      ( DELIVER-PKG-VERIFY ?AUTO_7228 ?AUTO_7229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7235 - OBJ
      ?AUTO_7236 - LOCATION
    )
    :vars
    (
      ?AUTO_7238 - LOCATION
      ?AUTO_7239 - TRUCK
      ?AUTO_7241 - LOCATION
      ?AUTO_7240 - CITY
      ?AUTO_7242 - LOCATION
      ?AUTO_7237 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7238 ) ( AIRPORT ?AUTO_7236 ) ( not ( = ?AUTO_7238 ?AUTO_7236 ) ) ( IN-TRUCK ?AUTO_7235 ?AUTO_7239 ) ( TRUCK-AT ?AUTO_7239 ?AUTO_7241 ) ( IN-CITY ?AUTO_7241 ?AUTO_7240 ) ( IN-CITY ?AUTO_7238 ?AUTO_7240 ) ( not ( = ?AUTO_7238 ?AUTO_7241 ) ) ( not ( = ?AUTO_7236 ?AUTO_7241 ) ) ( AIRPORT ?AUTO_7242 ) ( AIRPLANE-AT ?AUTO_7237 ?AUTO_7242 ) ( not ( = ?AUTO_7242 ?AUTO_7238 ) ) ( not ( = ?AUTO_7236 ?AUTO_7242 ) ) ( not ( = ?AUTO_7241 ?AUTO_7242 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7237 ?AUTO_7242 ?AUTO_7238 )
      ( DELIVER-PKG ?AUTO_7235 ?AUTO_7236 )
      ( DELIVER-PKG-VERIFY ?AUTO_7235 ?AUTO_7236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7301 - OBJ
      ?AUTO_7302 - LOCATION
    )
    :vars
    (
      ?AUTO_7303 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7301 ?AUTO_7303 ) ( AIRPLANE-AT ?AUTO_7303 ?AUTO_7302 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7301 ?AUTO_7303 ?AUTO_7302 )
      ( DELIVER-PKG-VERIFY ?AUTO_7301 ?AUTO_7302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7316 - OBJ
      ?AUTO_7317 - LOCATION
    )
    :vars
    (
      ?AUTO_7318 - AIRPLANE
      ?AUTO_7319 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7316 ?AUTO_7318 ) ( AIRPORT ?AUTO_7319 ) ( AIRPORT ?AUTO_7317 ) ( AIRPLANE-AT ?AUTO_7318 ?AUTO_7319 ) ( not ( = ?AUTO_7319 ?AUTO_7317 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7318 ?AUTO_7319 ?AUTO_7317 )
      ( DELIVER-PKG ?AUTO_7316 ?AUTO_7317 )
      ( DELIVER-PKG-VERIFY ?AUTO_7316 ?AUTO_7317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7344 - OBJ
      ?AUTO_7345 - LOCATION
    )
    :vars
    (
      ?AUTO_7347 - LOCATION
      ?AUTO_7349 - TRUCK
      ?AUTO_7351 - LOCATION
      ?AUTO_7350 - CITY
      ?AUTO_7348 - LOCATION
      ?AUTO_7346 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7347 ) ( AIRPORT ?AUTO_7345 ) ( not ( = ?AUTO_7347 ?AUTO_7345 ) ) ( TRUCK-AT ?AUTO_7349 ?AUTO_7351 ) ( IN-CITY ?AUTO_7351 ?AUTO_7350 ) ( IN-CITY ?AUTO_7347 ?AUTO_7350 ) ( not ( = ?AUTO_7347 ?AUTO_7351 ) ) ( not ( = ?AUTO_7345 ?AUTO_7351 ) ) ( AIRPORT ?AUTO_7348 ) ( AIRPLANE-AT ?AUTO_7346 ?AUTO_7348 ) ( not ( = ?AUTO_7348 ?AUTO_7347 ) ) ( not ( = ?AUTO_7345 ?AUTO_7348 ) ) ( not ( = ?AUTO_7351 ?AUTO_7348 ) ) ( OBJ-AT ?AUTO_7344 ?AUTO_7351 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7344 ?AUTO_7349 ?AUTO_7351 )
      ( DELIVER-PKG ?AUTO_7344 ?AUTO_7345 )
      ( DELIVER-PKG-VERIFY ?AUTO_7344 ?AUTO_7345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7352 - OBJ
      ?AUTO_7353 - LOCATION
    )
    :vars
    (
      ?AUTO_7355 - LOCATION
      ?AUTO_7356 - LOCATION
      ?AUTO_7359 - CITY
      ?AUTO_7357 - LOCATION
      ?AUTO_7354 - AIRPLANE
      ?AUTO_7358 - TRUCK
      ?AUTO_7360 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7355 ) ( AIRPORT ?AUTO_7353 ) ( not ( = ?AUTO_7355 ?AUTO_7353 ) ) ( IN-CITY ?AUTO_7356 ?AUTO_7359 ) ( IN-CITY ?AUTO_7355 ?AUTO_7359 ) ( not ( = ?AUTO_7355 ?AUTO_7356 ) ) ( not ( = ?AUTO_7353 ?AUTO_7356 ) ) ( AIRPORT ?AUTO_7357 ) ( AIRPLANE-AT ?AUTO_7354 ?AUTO_7357 ) ( not ( = ?AUTO_7357 ?AUTO_7355 ) ) ( not ( = ?AUTO_7353 ?AUTO_7357 ) ) ( not ( = ?AUTO_7356 ?AUTO_7357 ) ) ( OBJ-AT ?AUTO_7352 ?AUTO_7356 ) ( TRUCK-AT ?AUTO_7358 ?AUTO_7360 ) ( IN-CITY ?AUTO_7360 ?AUTO_7359 ) ( not ( = ?AUTO_7356 ?AUTO_7360 ) ) ( not ( = ?AUTO_7353 ?AUTO_7360 ) ) ( not ( = ?AUTO_7355 ?AUTO_7360 ) ) ( not ( = ?AUTO_7357 ?AUTO_7360 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7358 ?AUTO_7360 ?AUTO_7356 ?AUTO_7359 )
      ( DELIVER-PKG ?AUTO_7352 ?AUTO_7353 )
      ( DELIVER-PKG-VERIFY ?AUTO_7352 ?AUTO_7353 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7405 - OBJ
      ?AUTO_7406 - LOCATION
    )
    :vars
    (
      ?AUTO_7407 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7407 ?AUTO_7406 ) ( IN-TRUCK ?AUTO_7405 ?AUTO_7407 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7405 ?AUTO_7407 ?AUTO_7406 )
      ( DELIVER-PKG-VERIFY ?AUTO_7405 ?AUTO_7406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7410 - OBJ
      ?AUTO_7411 - LOCATION
    )
    :vars
    (
      ?AUTO_7412 - TRUCK
      ?AUTO_7413 - LOCATION
      ?AUTO_7414 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7410 ?AUTO_7412 ) ( TRUCK-AT ?AUTO_7412 ?AUTO_7413 ) ( IN-CITY ?AUTO_7413 ?AUTO_7414 ) ( IN-CITY ?AUTO_7411 ?AUTO_7414 ) ( not ( = ?AUTO_7411 ?AUTO_7413 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7412 ?AUTO_7413 ?AUTO_7411 ?AUTO_7414 )
      ( DELIVER-PKG ?AUTO_7410 ?AUTO_7411 )
      ( DELIVER-PKG-VERIFY ?AUTO_7410 ?AUTO_7411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7423 - OBJ
      ?AUTO_7424 - LOCATION
    )
    :vars
    (
      ?AUTO_7426 - TRUCK
      ?AUTO_7427 - LOCATION
      ?AUTO_7425 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7426 ?AUTO_7427 ) ( IN-CITY ?AUTO_7427 ?AUTO_7425 ) ( IN-CITY ?AUTO_7424 ?AUTO_7425 ) ( not ( = ?AUTO_7424 ?AUTO_7427 ) ) ( OBJ-AT ?AUTO_7423 ?AUTO_7427 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7423 ?AUTO_7426 ?AUTO_7427 )
      ( DELIVER-PKG ?AUTO_7423 ?AUTO_7424 )
      ( DELIVER-PKG-VERIFY ?AUTO_7423 ?AUTO_7424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7432 - OBJ
      ?AUTO_7433 - LOCATION
    )
    :vars
    (
      ?AUTO_7434 - TRUCK
      ?AUTO_7436 - LOCATION
      ?AUTO_7435 - CITY
      ?AUTO_7437 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7434 ?AUTO_7436 ) ( IN-CITY ?AUTO_7436 ?AUTO_7435 ) ( IN-CITY ?AUTO_7433 ?AUTO_7435 ) ( not ( = ?AUTO_7433 ?AUTO_7436 ) ) ( IN-AIRPLANE ?AUTO_7432 ?AUTO_7437 ) ( AIRPLANE-AT ?AUTO_7437 ?AUTO_7436 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7432 ?AUTO_7437 ?AUTO_7436 )
      ( DELIVER-PKG ?AUTO_7432 ?AUTO_7433 )
      ( DELIVER-PKG-VERIFY ?AUTO_7432 ?AUTO_7433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7438 - OBJ
      ?AUTO_7439 - LOCATION
    )
    :vars
    (
      ?AUTO_7442 - TRUCK
      ?AUTO_7440 - LOCATION
      ?AUTO_7441 - CITY
      ?AUTO_7443 - AIRPLANE
      ?AUTO_7444 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7442 ?AUTO_7440 ) ( IN-CITY ?AUTO_7440 ?AUTO_7441 ) ( IN-CITY ?AUTO_7439 ?AUTO_7441 ) ( not ( = ?AUTO_7439 ?AUTO_7440 ) ) ( IN-AIRPLANE ?AUTO_7438 ?AUTO_7443 ) ( AIRPORT ?AUTO_7444 ) ( AIRPORT ?AUTO_7440 ) ( AIRPLANE-AT ?AUTO_7443 ?AUTO_7444 ) ( not ( = ?AUTO_7444 ?AUTO_7440 ) ) ( not ( = ?AUTO_7439 ?AUTO_7444 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7443 ?AUTO_7444 ?AUTO_7440 )
      ( DELIVER-PKG ?AUTO_7438 ?AUTO_7439 )
      ( DELIVER-PKG-VERIFY ?AUTO_7438 ?AUTO_7439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7455 - OBJ
      ?AUTO_7456 - LOCATION
    )
    :vars
    (
      ?AUTO_7460 - TRUCK
      ?AUTO_7461 - LOCATION
      ?AUTO_7458 - CITY
      ?AUTO_7457 - LOCATION
      ?AUTO_7459 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7460 ?AUTO_7461 ) ( IN-CITY ?AUTO_7461 ?AUTO_7458 ) ( IN-CITY ?AUTO_7456 ?AUTO_7458 ) ( not ( = ?AUTO_7456 ?AUTO_7461 ) ) ( AIRPORT ?AUTO_7457 ) ( AIRPORT ?AUTO_7461 ) ( AIRPLANE-AT ?AUTO_7459 ?AUTO_7457 ) ( not ( = ?AUTO_7457 ?AUTO_7461 ) ) ( not ( = ?AUTO_7456 ?AUTO_7457 ) ) ( OBJ-AT ?AUTO_7455 ?AUTO_7457 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7455 ?AUTO_7459 ?AUTO_7457 )
      ( DELIVER-PKG ?AUTO_7455 ?AUTO_7456 )
      ( DELIVER-PKG-VERIFY ?AUTO_7455 ?AUTO_7456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7462 - OBJ
      ?AUTO_7463 - LOCATION
    )
    :vars
    (
      ?AUTO_7467 - TRUCK
      ?AUTO_7468 - LOCATION
      ?AUTO_7465 - CITY
      ?AUTO_7464 - LOCATION
      ?AUTO_7469 - LOCATION
      ?AUTO_7466 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7467 ?AUTO_7468 ) ( IN-CITY ?AUTO_7468 ?AUTO_7465 ) ( IN-CITY ?AUTO_7463 ?AUTO_7465 ) ( not ( = ?AUTO_7463 ?AUTO_7468 ) ) ( AIRPORT ?AUTO_7464 ) ( AIRPORT ?AUTO_7468 ) ( not ( = ?AUTO_7464 ?AUTO_7468 ) ) ( not ( = ?AUTO_7463 ?AUTO_7464 ) ) ( OBJ-AT ?AUTO_7462 ?AUTO_7464 ) ( AIRPORT ?AUTO_7469 ) ( AIRPLANE-AT ?AUTO_7466 ?AUTO_7469 ) ( not ( = ?AUTO_7469 ?AUTO_7464 ) ) ( not ( = ?AUTO_7463 ?AUTO_7469 ) ) ( not ( = ?AUTO_7468 ?AUTO_7469 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7466 ?AUTO_7469 ?AUTO_7464 )
      ( DELIVER-PKG ?AUTO_7462 ?AUTO_7463 )
      ( DELIVER-PKG-VERIFY ?AUTO_7462 ?AUTO_7463 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7478 - OBJ
      ?AUTO_7479 - LOCATION
    )
    :vars
    (
      ?AUTO_7481 - TRUCK
      ?AUTO_7480 - LOCATION
      ?AUTO_7485 - CITY
      ?AUTO_7482 - LOCATION
      ?AUTO_7484 - LOCATION
      ?AUTO_7483 - AIRPLANE
      ?AUTO_7486 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7481 ?AUTO_7480 ) ( IN-CITY ?AUTO_7480 ?AUTO_7485 ) ( IN-CITY ?AUTO_7479 ?AUTO_7485 ) ( not ( = ?AUTO_7479 ?AUTO_7480 ) ) ( AIRPORT ?AUTO_7482 ) ( AIRPORT ?AUTO_7480 ) ( not ( = ?AUTO_7482 ?AUTO_7480 ) ) ( not ( = ?AUTO_7479 ?AUTO_7482 ) ) ( AIRPORT ?AUTO_7484 ) ( AIRPLANE-AT ?AUTO_7483 ?AUTO_7484 ) ( not ( = ?AUTO_7484 ?AUTO_7482 ) ) ( not ( = ?AUTO_7479 ?AUTO_7484 ) ) ( not ( = ?AUTO_7480 ?AUTO_7484 ) ) ( TRUCK-AT ?AUTO_7486 ?AUTO_7482 ) ( IN-TRUCK ?AUTO_7478 ?AUTO_7486 ) ( not ( = ?AUTO_7481 ?AUTO_7486 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7478 ?AUTO_7486 ?AUTO_7482 )
      ( DELIVER-PKG ?AUTO_7478 ?AUTO_7479 )
      ( DELIVER-PKG-VERIFY ?AUTO_7478 ?AUTO_7479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7487 - OBJ
      ?AUTO_7488 - LOCATION
    )
    :vars
    (
      ?AUTO_7489 - TRUCK
      ?AUTO_7490 - LOCATION
      ?AUTO_7491 - CITY
      ?AUTO_7494 - LOCATION
      ?AUTO_7492 - LOCATION
      ?AUTO_7493 - AIRPLANE
      ?AUTO_7495 - TRUCK
      ?AUTO_7496 - LOCATION
      ?AUTO_7497 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7489 ?AUTO_7490 ) ( IN-CITY ?AUTO_7490 ?AUTO_7491 ) ( IN-CITY ?AUTO_7488 ?AUTO_7491 ) ( not ( = ?AUTO_7488 ?AUTO_7490 ) ) ( AIRPORT ?AUTO_7494 ) ( AIRPORT ?AUTO_7490 ) ( not ( = ?AUTO_7494 ?AUTO_7490 ) ) ( not ( = ?AUTO_7488 ?AUTO_7494 ) ) ( AIRPORT ?AUTO_7492 ) ( AIRPLANE-AT ?AUTO_7493 ?AUTO_7492 ) ( not ( = ?AUTO_7492 ?AUTO_7494 ) ) ( not ( = ?AUTO_7488 ?AUTO_7492 ) ) ( not ( = ?AUTO_7490 ?AUTO_7492 ) ) ( IN-TRUCK ?AUTO_7487 ?AUTO_7495 ) ( not ( = ?AUTO_7489 ?AUTO_7495 ) ) ( TRUCK-AT ?AUTO_7495 ?AUTO_7496 ) ( IN-CITY ?AUTO_7496 ?AUTO_7497 ) ( IN-CITY ?AUTO_7494 ?AUTO_7497 ) ( not ( = ?AUTO_7494 ?AUTO_7496 ) ) ( not ( = ?AUTO_7488 ?AUTO_7496 ) ) ( not ( = ?AUTO_7490 ?AUTO_7496 ) ) ( not ( = ?AUTO_7491 ?AUTO_7497 ) ) ( not ( = ?AUTO_7492 ?AUTO_7496 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7495 ?AUTO_7496 ?AUTO_7494 ?AUTO_7497 )
      ( DELIVER-PKG ?AUTO_7487 ?AUTO_7488 )
      ( DELIVER-PKG-VERIFY ?AUTO_7487 ?AUTO_7488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7498 - OBJ
      ?AUTO_7499 - LOCATION
    )
    :vars
    (
      ?AUTO_7506 - TRUCK
      ?AUTO_7500 - LOCATION
      ?AUTO_7504 - CITY
      ?AUTO_7505 - LOCATION
      ?AUTO_7503 - LOCATION
      ?AUTO_7501 - AIRPLANE
      ?AUTO_7502 - TRUCK
      ?AUTO_7507 - LOCATION
      ?AUTO_7508 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7506 ?AUTO_7500 ) ( IN-CITY ?AUTO_7500 ?AUTO_7504 ) ( IN-CITY ?AUTO_7499 ?AUTO_7504 ) ( not ( = ?AUTO_7499 ?AUTO_7500 ) ) ( AIRPORT ?AUTO_7505 ) ( AIRPORT ?AUTO_7500 ) ( not ( = ?AUTO_7505 ?AUTO_7500 ) ) ( not ( = ?AUTO_7499 ?AUTO_7505 ) ) ( AIRPORT ?AUTO_7503 ) ( AIRPLANE-AT ?AUTO_7501 ?AUTO_7503 ) ( not ( = ?AUTO_7503 ?AUTO_7505 ) ) ( not ( = ?AUTO_7499 ?AUTO_7503 ) ) ( not ( = ?AUTO_7500 ?AUTO_7503 ) ) ( not ( = ?AUTO_7506 ?AUTO_7502 ) ) ( TRUCK-AT ?AUTO_7502 ?AUTO_7507 ) ( IN-CITY ?AUTO_7507 ?AUTO_7508 ) ( IN-CITY ?AUTO_7505 ?AUTO_7508 ) ( not ( = ?AUTO_7505 ?AUTO_7507 ) ) ( not ( = ?AUTO_7499 ?AUTO_7507 ) ) ( not ( = ?AUTO_7500 ?AUTO_7507 ) ) ( not ( = ?AUTO_7504 ?AUTO_7508 ) ) ( not ( = ?AUTO_7503 ?AUTO_7507 ) ) ( OBJ-AT ?AUTO_7498 ?AUTO_7507 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7498 ?AUTO_7502 ?AUTO_7507 )
      ( DELIVER-PKG ?AUTO_7498 ?AUTO_7499 )
      ( DELIVER-PKG-VERIFY ?AUTO_7498 ?AUTO_7499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7509 - OBJ
      ?AUTO_7510 - LOCATION
    )
    :vars
    (
      ?AUTO_7514 - TRUCK
      ?AUTO_7511 - LOCATION
      ?AUTO_7515 - CITY
      ?AUTO_7512 - LOCATION
      ?AUTO_7518 - LOCATION
      ?AUTO_7513 - AIRPLANE
      ?AUTO_7517 - TRUCK
      ?AUTO_7516 - LOCATION
      ?AUTO_7519 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7514 ?AUTO_7511 ) ( IN-CITY ?AUTO_7511 ?AUTO_7515 ) ( IN-CITY ?AUTO_7510 ?AUTO_7515 ) ( not ( = ?AUTO_7510 ?AUTO_7511 ) ) ( AIRPORT ?AUTO_7512 ) ( AIRPORT ?AUTO_7511 ) ( not ( = ?AUTO_7512 ?AUTO_7511 ) ) ( not ( = ?AUTO_7510 ?AUTO_7512 ) ) ( AIRPORT ?AUTO_7518 ) ( AIRPLANE-AT ?AUTO_7513 ?AUTO_7518 ) ( not ( = ?AUTO_7518 ?AUTO_7512 ) ) ( not ( = ?AUTO_7510 ?AUTO_7518 ) ) ( not ( = ?AUTO_7511 ?AUTO_7518 ) ) ( not ( = ?AUTO_7514 ?AUTO_7517 ) ) ( IN-CITY ?AUTO_7516 ?AUTO_7519 ) ( IN-CITY ?AUTO_7512 ?AUTO_7519 ) ( not ( = ?AUTO_7512 ?AUTO_7516 ) ) ( not ( = ?AUTO_7510 ?AUTO_7516 ) ) ( not ( = ?AUTO_7511 ?AUTO_7516 ) ) ( not ( = ?AUTO_7515 ?AUTO_7519 ) ) ( not ( = ?AUTO_7518 ?AUTO_7516 ) ) ( OBJ-AT ?AUTO_7509 ?AUTO_7516 ) ( TRUCK-AT ?AUTO_7517 ?AUTO_7512 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7517 ?AUTO_7512 ?AUTO_7516 ?AUTO_7519 )
      ( DELIVER-PKG ?AUTO_7509 ?AUTO_7510 )
      ( DELIVER-PKG-VERIFY ?AUTO_7509 ?AUTO_7510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7556 - OBJ
      ?AUTO_7557 - LOCATION
    )
    :vars
    (
      ?AUTO_7558 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7558 ?AUTO_7557 ) ( IN-TRUCK ?AUTO_7556 ?AUTO_7558 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7556 ?AUTO_7558 ?AUTO_7557 )
      ( DELIVER-PKG-VERIFY ?AUTO_7556 ?AUTO_7557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7573 - OBJ
      ?AUTO_7574 - LOCATION
    )
    :vars
    (
      ?AUTO_7576 - TRUCK
      ?AUTO_7577 - LOCATION
      ?AUTO_7575 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7576 ?AUTO_7577 ) ( IN-CITY ?AUTO_7577 ?AUTO_7575 ) ( IN-CITY ?AUTO_7574 ?AUTO_7575 ) ( not ( = ?AUTO_7574 ?AUTO_7577 ) ) ( OBJ-AT ?AUTO_7573 ?AUTO_7577 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7573 ?AUTO_7576 ?AUTO_7577 )
      ( DELIVER-PKG ?AUTO_7573 ?AUTO_7574 )
      ( DELIVER-PKG-VERIFY ?AUTO_7573 ?AUTO_7574 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7592 - OBJ
      ?AUTO_7593 - LOCATION
    )
    :vars
    (
      ?AUTO_7595 - LOCATION
      ?AUTO_7596 - CITY
      ?AUTO_7594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7595 ?AUTO_7596 ) ( IN-CITY ?AUTO_7593 ?AUTO_7596 ) ( not ( = ?AUTO_7593 ?AUTO_7595 ) ) ( OBJ-AT ?AUTO_7592 ?AUTO_7595 ) ( TRUCK-AT ?AUTO_7594 ?AUTO_7593 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7594 ?AUTO_7593 ?AUTO_7595 ?AUTO_7596 )
      ( DELIVER-PKG ?AUTO_7592 ?AUTO_7593 )
      ( DELIVER-PKG-VERIFY ?AUTO_7592 ?AUTO_7593 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7623 - OBJ
      ?AUTO_7624 - LOCATION
    )
    :vars
    (
      ?AUTO_7627 - LOCATION
      ?AUTO_7626 - CITY
      ?AUTO_7625 - TRUCK
      ?AUTO_7628 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7627 ?AUTO_7626 ) ( IN-CITY ?AUTO_7624 ?AUTO_7626 ) ( not ( = ?AUTO_7624 ?AUTO_7627 ) ) ( TRUCK-AT ?AUTO_7625 ?AUTO_7624 ) ( IN-AIRPLANE ?AUTO_7623 ?AUTO_7628 ) ( AIRPLANE-AT ?AUTO_7628 ?AUTO_7627 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7623 ?AUTO_7628 ?AUTO_7627 )
      ( DELIVER-PKG ?AUTO_7623 ?AUTO_7624 )
      ( DELIVER-PKG-VERIFY ?AUTO_7623 ?AUTO_7624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7629 - OBJ
      ?AUTO_7630 - LOCATION
    )
    :vars
    (
      ?AUTO_7633 - LOCATION
      ?AUTO_7631 - CITY
      ?AUTO_7632 - TRUCK
      ?AUTO_7634 - AIRPLANE
      ?AUTO_7635 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7633 ?AUTO_7631 ) ( IN-CITY ?AUTO_7630 ?AUTO_7631 ) ( not ( = ?AUTO_7630 ?AUTO_7633 ) ) ( TRUCK-AT ?AUTO_7632 ?AUTO_7630 ) ( IN-AIRPLANE ?AUTO_7629 ?AUTO_7634 ) ( AIRPORT ?AUTO_7635 ) ( AIRPORT ?AUTO_7633 ) ( AIRPLANE-AT ?AUTO_7634 ?AUTO_7635 ) ( not ( = ?AUTO_7635 ?AUTO_7633 ) ) ( not ( = ?AUTO_7630 ?AUTO_7635 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7634 ?AUTO_7635 ?AUTO_7633 )
      ( DELIVER-PKG ?AUTO_7629 ?AUTO_7630 )
      ( DELIVER-PKG-VERIFY ?AUTO_7629 ?AUTO_7630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7644 - OBJ
      ?AUTO_7645 - LOCATION
    )
    :vars
    (
      ?AUTO_7650 - LOCATION
      ?AUTO_7649 - CITY
      ?AUTO_7646 - TRUCK
      ?AUTO_7648 - LOCATION
      ?AUTO_7647 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7650 ?AUTO_7649 ) ( IN-CITY ?AUTO_7645 ?AUTO_7649 ) ( not ( = ?AUTO_7645 ?AUTO_7650 ) ) ( TRUCK-AT ?AUTO_7646 ?AUTO_7645 ) ( AIRPORT ?AUTO_7648 ) ( AIRPORT ?AUTO_7650 ) ( AIRPLANE-AT ?AUTO_7647 ?AUTO_7648 ) ( not ( = ?AUTO_7648 ?AUTO_7650 ) ) ( not ( = ?AUTO_7645 ?AUTO_7648 ) ) ( OBJ-AT ?AUTO_7644 ?AUTO_7648 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7644 ?AUTO_7647 ?AUTO_7648 )
      ( DELIVER-PKG ?AUTO_7644 ?AUTO_7645 )
      ( DELIVER-PKG-VERIFY ?AUTO_7644 ?AUTO_7645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7651 - OBJ
      ?AUTO_7652 - LOCATION
    )
    :vars
    (
      ?AUTO_7653 - LOCATION
      ?AUTO_7655 - CITY
      ?AUTO_7657 - TRUCK
      ?AUTO_7656 - LOCATION
      ?AUTO_7658 - LOCATION
      ?AUTO_7654 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7653 ?AUTO_7655 ) ( IN-CITY ?AUTO_7652 ?AUTO_7655 ) ( not ( = ?AUTO_7652 ?AUTO_7653 ) ) ( TRUCK-AT ?AUTO_7657 ?AUTO_7652 ) ( AIRPORT ?AUTO_7656 ) ( AIRPORT ?AUTO_7653 ) ( not ( = ?AUTO_7656 ?AUTO_7653 ) ) ( not ( = ?AUTO_7652 ?AUTO_7656 ) ) ( OBJ-AT ?AUTO_7651 ?AUTO_7656 ) ( AIRPORT ?AUTO_7658 ) ( AIRPLANE-AT ?AUTO_7654 ?AUTO_7658 ) ( not ( = ?AUTO_7658 ?AUTO_7656 ) ) ( not ( = ?AUTO_7652 ?AUTO_7658 ) ) ( not ( = ?AUTO_7653 ?AUTO_7658 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7654 ?AUTO_7658 ?AUTO_7656 )
      ( DELIVER-PKG ?AUTO_7651 ?AUTO_7652 )
      ( DELIVER-PKG-VERIFY ?AUTO_7651 ?AUTO_7652 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7661 - OBJ
      ?AUTO_7662 - LOCATION
    )
    :vars
    (
      ?AUTO_7668 - LOCATION
      ?AUTO_7667 - CITY
      ?AUTO_7665 - TRUCK
      ?AUTO_7663 - LOCATION
      ?AUTO_7666 - LOCATION
      ?AUTO_7664 - AIRPLANE
      ?AUTO_7669 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7668 ?AUTO_7667 ) ( IN-CITY ?AUTO_7662 ?AUTO_7667 ) ( not ( = ?AUTO_7662 ?AUTO_7668 ) ) ( TRUCK-AT ?AUTO_7665 ?AUTO_7662 ) ( AIRPORT ?AUTO_7663 ) ( AIRPORT ?AUTO_7668 ) ( not ( = ?AUTO_7663 ?AUTO_7668 ) ) ( not ( = ?AUTO_7662 ?AUTO_7663 ) ) ( AIRPORT ?AUTO_7666 ) ( AIRPLANE-AT ?AUTO_7664 ?AUTO_7666 ) ( not ( = ?AUTO_7666 ?AUTO_7663 ) ) ( not ( = ?AUTO_7662 ?AUTO_7666 ) ) ( not ( = ?AUTO_7668 ?AUTO_7666 ) ) ( TRUCK-AT ?AUTO_7669 ?AUTO_7663 ) ( IN-TRUCK ?AUTO_7661 ?AUTO_7669 ) ( not ( = ?AUTO_7665 ?AUTO_7669 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7661 ?AUTO_7669 ?AUTO_7663 )
      ( DELIVER-PKG ?AUTO_7661 ?AUTO_7662 )
      ( DELIVER-PKG-VERIFY ?AUTO_7661 ?AUTO_7662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7670 - OBJ
      ?AUTO_7671 - LOCATION
    )
    :vars
    (
      ?AUTO_7676 - LOCATION
      ?AUTO_7678 - CITY
      ?AUTO_7675 - TRUCK
      ?AUTO_7673 - LOCATION
      ?AUTO_7677 - LOCATION
      ?AUTO_7674 - AIRPLANE
      ?AUTO_7672 - TRUCK
      ?AUTO_7679 - LOCATION
      ?AUTO_7680 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7676 ?AUTO_7678 ) ( IN-CITY ?AUTO_7671 ?AUTO_7678 ) ( not ( = ?AUTO_7671 ?AUTO_7676 ) ) ( TRUCK-AT ?AUTO_7675 ?AUTO_7671 ) ( AIRPORT ?AUTO_7673 ) ( AIRPORT ?AUTO_7676 ) ( not ( = ?AUTO_7673 ?AUTO_7676 ) ) ( not ( = ?AUTO_7671 ?AUTO_7673 ) ) ( AIRPORT ?AUTO_7677 ) ( AIRPLANE-AT ?AUTO_7674 ?AUTO_7677 ) ( not ( = ?AUTO_7677 ?AUTO_7673 ) ) ( not ( = ?AUTO_7671 ?AUTO_7677 ) ) ( not ( = ?AUTO_7676 ?AUTO_7677 ) ) ( IN-TRUCK ?AUTO_7670 ?AUTO_7672 ) ( not ( = ?AUTO_7675 ?AUTO_7672 ) ) ( TRUCK-AT ?AUTO_7672 ?AUTO_7679 ) ( IN-CITY ?AUTO_7679 ?AUTO_7680 ) ( IN-CITY ?AUTO_7673 ?AUTO_7680 ) ( not ( = ?AUTO_7673 ?AUTO_7679 ) ) ( not ( = ?AUTO_7671 ?AUTO_7679 ) ) ( not ( = ?AUTO_7676 ?AUTO_7679 ) ) ( not ( = ?AUTO_7678 ?AUTO_7680 ) ) ( not ( = ?AUTO_7677 ?AUTO_7679 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7672 ?AUTO_7679 ?AUTO_7673 ?AUTO_7680 )
      ( DELIVER-PKG ?AUTO_7670 ?AUTO_7671 )
      ( DELIVER-PKG-VERIFY ?AUTO_7670 ?AUTO_7671 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7687 - OBJ
      ?AUTO_7688 - LOCATION
    )
    :vars
    (
      ?AUTO_7697 - LOCATION
      ?AUTO_7695 - CITY
      ?AUTO_7694 - TRUCK
      ?AUTO_7693 - LOCATION
      ?AUTO_7692 - LOCATION
      ?AUTO_7689 - AIRPLANE
      ?AUTO_7691 - TRUCK
      ?AUTO_7696 - LOCATION
      ?AUTO_7690 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7697 ?AUTO_7695 ) ( IN-CITY ?AUTO_7688 ?AUTO_7695 ) ( not ( = ?AUTO_7688 ?AUTO_7697 ) ) ( TRUCK-AT ?AUTO_7694 ?AUTO_7688 ) ( AIRPORT ?AUTO_7693 ) ( AIRPORT ?AUTO_7697 ) ( not ( = ?AUTO_7693 ?AUTO_7697 ) ) ( not ( = ?AUTO_7688 ?AUTO_7693 ) ) ( AIRPORT ?AUTO_7692 ) ( AIRPLANE-AT ?AUTO_7689 ?AUTO_7692 ) ( not ( = ?AUTO_7692 ?AUTO_7693 ) ) ( not ( = ?AUTO_7688 ?AUTO_7692 ) ) ( not ( = ?AUTO_7697 ?AUTO_7692 ) ) ( not ( = ?AUTO_7694 ?AUTO_7691 ) ) ( TRUCK-AT ?AUTO_7691 ?AUTO_7696 ) ( IN-CITY ?AUTO_7696 ?AUTO_7690 ) ( IN-CITY ?AUTO_7693 ?AUTO_7690 ) ( not ( = ?AUTO_7693 ?AUTO_7696 ) ) ( not ( = ?AUTO_7688 ?AUTO_7696 ) ) ( not ( = ?AUTO_7697 ?AUTO_7696 ) ) ( not ( = ?AUTO_7695 ?AUTO_7690 ) ) ( not ( = ?AUTO_7692 ?AUTO_7696 ) ) ( OBJ-AT ?AUTO_7687 ?AUTO_7696 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7687 ?AUTO_7691 ?AUTO_7696 )
      ( DELIVER-PKG ?AUTO_7687 ?AUTO_7688 )
      ( DELIVER-PKG-VERIFY ?AUTO_7687 ?AUTO_7688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7698 - OBJ
      ?AUTO_7699 - LOCATION
    )
    :vars
    (
      ?AUTO_7707 - LOCATION
      ?AUTO_7706 - CITY
      ?AUTO_7708 - TRUCK
      ?AUTO_7704 - LOCATION
      ?AUTO_7705 - LOCATION
      ?AUTO_7702 - AIRPLANE
      ?AUTO_7703 - TRUCK
      ?AUTO_7701 - LOCATION
      ?AUTO_7700 - CITY
      ?AUTO_7709 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7707 ?AUTO_7706 ) ( IN-CITY ?AUTO_7699 ?AUTO_7706 ) ( not ( = ?AUTO_7699 ?AUTO_7707 ) ) ( TRUCK-AT ?AUTO_7708 ?AUTO_7699 ) ( AIRPORT ?AUTO_7704 ) ( AIRPORT ?AUTO_7707 ) ( not ( = ?AUTO_7704 ?AUTO_7707 ) ) ( not ( = ?AUTO_7699 ?AUTO_7704 ) ) ( AIRPORT ?AUTO_7705 ) ( AIRPLANE-AT ?AUTO_7702 ?AUTO_7705 ) ( not ( = ?AUTO_7705 ?AUTO_7704 ) ) ( not ( = ?AUTO_7699 ?AUTO_7705 ) ) ( not ( = ?AUTO_7707 ?AUTO_7705 ) ) ( not ( = ?AUTO_7708 ?AUTO_7703 ) ) ( IN-CITY ?AUTO_7701 ?AUTO_7700 ) ( IN-CITY ?AUTO_7704 ?AUTO_7700 ) ( not ( = ?AUTO_7704 ?AUTO_7701 ) ) ( not ( = ?AUTO_7699 ?AUTO_7701 ) ) ( not ( = ?AUTO_7707 ?AUTO_7701 ) ) ( not ( = ?AUTO_7706 ?AUTO_7700 ) ) ( not ( = ?AUTO_7705 ?AUTO_7701 ) ) ( OBJ-AT ?AUTO_7698 ?AUTO_7701 ) ( TRUCK-AT ?AUTO_7703 ?AUTO_7709 ) ( IN-CITY ?AUTO_7709 ?AUTO_7700 ) ( not ( = ?AUTO_7701 ?AUTO_7709 ) ) ( not ( = ?AUTO_7699 ?AUTO_7709 ) ) ( not ( = ?AUTO_7707 ?AUTO_7709 ) ) ( not ( = ?AUTO_7704 ?AUTO_7709 ) ) ( not ( = ?AUTO_7705 ?AUTO_7709 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7703 ?AUTO_7709 ?AUTO_7701 ?AUTO_7700 )
      ( DELIVER-PKG ?AUTO_7698 ?AUTO_7699 )
      ( DELIVER-PKG-VERIFY ?AUTO_7698 ?AUTO_7699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7712 - OBJ
      ?AUTO_7713 - LOCATION
    )
    :vars
    (
      ?AUTO_7714 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7714 ?AUTO_7713 ) ( IN-TRUCK ?AUTO_7712 ?AUTO_7714 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7712 ?AUTO_7714 ?AUTO_7713 )
      ( DELIVER-PKG-VERIFY ?AUTO_7712 ?AUTO_7713 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7715 - OBJ
      ?AUTO_7716 - LOCATION
    )
    :vars
    (
      ?AUTO_7717 - TRUCK
      ?AUTO_7718 - LOCATION
      ?AUTO_7719 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7715 ?AUTO_7717 ) ( TRUCK-AT ?AUTO_7717 ?AUTO_7718 ) ( IN-CITY ?AUTO_7718 ?AUTO_7719 ) ( IN-CITY ?AUTO_7716 ?AUTO_7719 ) ( not ( = ?AUTO_7716 ?AUTO_7718 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7717 ?AUTO_7718 ?AUTO_7716 ?AUTO_7719 )
      ( DELIVER-PKG ?AUTO_7715 ?AUTO_7716 )
      ( DELIVER-PKG-VERIFY ?AUTO_7715 ?AUTO_7716 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7734 - OBJ
      ?AUTO_7735 - LOCATION
    )
    :vars
    (
      ?AUTO_7738 - TRUCK
      ?AUTO_7736 - LOCATION
      ?AUTO_7737 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7738 ?AUTO_7736 ) ( IN-CITY ?AUTO_7736 ?AUTO_7737 ) ( IN-CITY ?AUTO_7735 ?AUTO_7737 ) ( not ( = ?AUTO_7735 ?AUTO_7736 ) ) ( OBJ-AT ?AUTO_7734 ?AUTO_7736 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7734 ?AUTO_7738 ?AUTO_7736 )
      ( DELIVER-PKG ?AUTO_7734 ?AUTO_7735 )
      ( DELIVER-PKG-VERIFY ?AUTO_7734 ?AUTO_7735 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7755 - OBJ
      ?AUTO_7756 - LOCATION
    )
    :vars
    (
      ?AUTO_7757 - LOCATION
      ?AUTO_7759 - CITY
      ?AUTO_7758 - TRUCK
      ?AUTO_7760 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7757 ?AUTO_7759 ) ( IN-CITY ?AUTO_7756 ?AUTO_7759 ) ( not ( = ?AUTO_7756 ?AUTO_7757 ) ) ( OBJ-AT ?AUTO_7755 ?AUTO_7757 ) ( TRUCK-AT ?AUTO_7758 ?AUTO_7760 ) ( IN-CITY ?AUTO_7760 ?AUTO_7759 ) ( not ( = ?AUTO_7757 ?AUTO_7760 ) ) ( not ( = ?AUTO_7756 ?AUTO_7760 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7758 ?AUTO_7760 ?AUTO_7757 ?AUTO_7759 )
      ( DELIVER-PKG ?AUTO_7755 ?AUTO_7756 )
      ( DELIVER-PKG-VERIFY ?AUTO_7755 ?AUTO_7756 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7785 - OBJ
      ?AUTO_7786 - LOCATION
    )
    :vars
    (
      ?AUTO_7787 - LOCATION
      ?AUTO_7788 - CITY
      ?AUTO_7789 - TRUCK
      ?AUTO_7790 - LOCATION
      ?AUTO_7791 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7787 ?AUTO_7788 ) ( IN-CITY ?AUTO_7786 ?AUTO_7788 ) ( not ( = ?AUTO_7786 ?AUTO_7787 ) ) ( TRUCK-AT ?AUTO_7789 ?AUTO_7790 ) ( IN-CITY ?AUTO_7790 ?AUTO_7788 ) ( not ( = ?AUTO_7787 ?AUTO_7790 ) ) ( not ( = ?AUTO_7786 ?AUTO_7790 ) ) ( IN-AIRPLANE ?AUTO_7785 ?AUTO_7791 ) ( AIRPLANE-AT ?AUTO_7791 ?AUTO_7787 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7785 ?AUTO_7791 ?AUTO_7787 )
      ( DELIVER-PKG ?AUTO_7785 ?AUTO_7786 )
      ( DELIVER-PKG-VERIFY ?AUTO_7785 ?AUTO_7786 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7794 - OBJ
      ?AUTO_7795 - LOCATION
    )
    :vars
    (
      ?AUTO_7798 - LOCATION
      ?AUTO_7800 - CITY
      ?AUTO_7796 - TRUCK
      ?AUTO_7797 - LOCATION
      ?AUTO_7799 - AIRPLANE
      ?AUTO_7801 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7798 ?AUTO_7800 ) ( IN-CITY ?AUTO_7795 ?AUTO_7800 ) ( not ( = ?AUTO_7795 ?AUTO_7798 ) ) ( TRUCK-AT ?AUTO_7796 ?AUTO_7797 ) ( IN-CITY ?AUTO_7797 ?AUTO_7800 ) ( not ( = ?AUTO_7798 ?AUTO_7797 ) ) ( not ( = ?AUTO_7795 ?AUTO_7797 ) ) ( IN-AIRPLANE ?AUTO_7794 ?AUTO_7799 ) ( AIRPORT ?AUTO_7801 ) ( AIRPORT ?AUTO_7798 ) ( AIRPLANE-AT ?AUTO_7799 ?AUTO_7801 ) ( not ( = ?AUTO_7801 ?AUTO_7798 ) ) ( not ( = ?AUTO_7795 ?AUTO_7801 ) ) ( not ( = ?AUTO_7797 ?AUTO_7801 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7799 ?AUTO_7801 ?AUTO_7798 )
      ( DELIVER-PKG ?AUTO_7794 ?AUTO_7795 )
      ( DELIVER-PKG-VERIFY ?AUTO_7794 ?AUTO_7795 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7804 - OBJ
      ?AUTO_7805 - LOCATION
    )
    :vars
    (
      ?AUTO_7806 - LOCATION
      ?AUTO_7808 - CITY
      ?AUTO_7811 - TRUCK
      ?AUTO_7809 - LOCATION
      ?AUTO_7810 - LOCATION
      ?AUTO_7807 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7806 ?AUTO_7808 ) ( IN-CITY ?AUTO_7805 ?AUTO_7808 ) ( not ( = ?AUTO_7805 ?AUTO_7806 ) ) ( TRUCK-AT ?AUTO_7811 ?AUTO_7809 ) ( IN-CITY ?AUTO_7809 ?AUTO_7808 ) ( not ( = ?AUTO_7806 ?AUTO_7809 ) ) ( not ( = ?AUTO_7805 ?AUTO_7809 ) ) ( AIRPORT ?AUTO_7810 ) ( AIRPORT ?AUTO_7806 ) ( AIRPLANE-AT ?AUTO_7807 ?AUTO_7810 ) ( not ( = ?AUTO_7810 ?AUTO_7806 ) ) ( not ( = ?AUTO_7805 ?AUTO_7810 ) ) ( not ( = ?AUTO_7809 ?AUTO_7810 ) ) ( OBJ-AT ?AUTO_7804 ?AUTO_7810 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7804 ?AUTO_7807 ?AUTO_7810 )
      ( DELIVER-PKG ?AUTO_7804 ?AUTO_7805 )
      ( DELIVER-PKG-VERIFY ?AUTO_7804 ?AUTO_7805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7812 - OBJ
      ?AUTO_7813 - LOCATION
    )
    :vars
    (
      ?AUTO_7814 - LOCATION
      ?AUTO_7818 - CITY
      ?AUTO_7817 - TRUCK
      ?AUTO_7815 - LOCATION
      ?AUTO_7819 - LOCATION
      ?AUTO_7820 - LOCATION
      ?AUTO_7816 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7814 ?AUTO_7818 ) ( IN-CITY ?AUTO_7813 ?AUTO_7818 ) ( not ( = ?AUTO_7813 ?AUTO_7814 ) ) ( TRUCK-AT ?AUTO_7817 ?AUTO_7815 ) ( IN-CITY ?AUTO_7815 ?AUTO_7818 ) ( not ( = ?AUTO_7814 ?AUTO_7815 ) ) ( not ( = ?AUTO_7813 ?AUTO_7815 ) ) ( AIRPORT ?AUTO_7819 ) ( AIRPORT ?AUTO_7814 ) ( not ( = ?AUTO_7819 ?AUTO_7814 ) ) ( not ( = ?AUTO_7813 ?AUTO_7819 ) ) ( not ( = ?AUTO_7815 ?AUTO_7819 ) ) ( OBJ-AT ?AUTO_7812 ?AUTO_7819 ) ( AIRPORT ?AUTO_7820 ) ( AIRPLANE-AT ?AUTO_7816 ?AUTO_7820 ) ( not ( = ?AUTO_7820 ?AUTO_7819 ) ) ( not ( = ?AUTO_7813 ?AUTO_7820 ) ) ( not ( = ?AUTO_7814 ?AUTO_7820 ) ) ( not ( = ?AUTO_7815 ?AUTO_7820 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7816 ?AUTO_7820 ?AUTO_7819 )
      ( DELIVER-PKG ?AUTO_7812 ?AUTO_7813 )
      ( DELIVER-PKG-VERIFY ?AUTO_7812 ?AUTO_7813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7845 - OBJ
      ?AUTO_7846 - LOCATION
    )
    :vars
    (
      ?AUTO_7847 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7847 ?AUTO_7846 ) ( IN-TRUCK ?AUTO_7845 ?AUTO_7847 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7845 ?AUTO_7847 ?AUTO_7846 )
      ( DELIVER-PKG-VERIFY ?AUTO_7845 ?AUTO_7846 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7862 - OBJ
      ?AUTO_7863 - LOCATION
    )
    :vars
    (
      ?AUTO_7864 - TRUCK
      ?AUTO_7866 - LOCATION
      ?AUTO_7865 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7864 ?AUTO_7866 ) ( IN-CITY ?AUTO_7866 ?AUTO_7865 ) ( IN-CITY ?AUTO_7863 ?AUTO_7865 ) ( not ( = ?AUTO_7863 ?AUTO_7866 ) ) ( OBJ-AT ?AUTO_7862 ?AUTO_7866 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7862 ?AUTO_7864 ?AUTO_7866 )
      ( DELIVER-PKG ?AUTO_7862 ?AUTO_7863 )
      ( DELIVER-PKG-VERIFY ?AUTO_7862 ?AUTO_7863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7877 - OBJ
      ?AUTO_7878 - LOCATION
    )
    :vars
    (
      ?AUTO_7881 - TRUCK
      ?AUTO_7880 - LOCATION
      ?AUTO_7879 - CITY
      ?AUTO_7882 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7881 ?AUTO_7880 ) ( IN-CITY ?AUTO_7880 ?AUTO_7879 ) ( IN-CITY ?AUTO_7878 ?AUTO_7879 ) ( not ( = ?AUTO_7878 ?AUTO_7880 ) ) ( IN-AIRPLANE ?AUTO_7877 ?AUTO_7882 ) ( AIRPLANE-AT ?AUTO_7882 ?AUTO_7880 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7877 ?AUTO_7882 ?AUTO_7880 )
      ( DELIVER-PKG ?AUTO_7877 ?AUTO_7878 )
      ( DELIVER-PKG-VERIFY ?AUTO_7877 ?AUTO_7878 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7887 - OBJ
      ?AUTO_7888 - LOCATION
    )
    :vars
    (
      ?AUTO_7889 - TRUCK
      ?AUTO_7893 - LOCATION
      ?AUTO_7891 - CITY
      ?AUTO_7892 - LOCATION
      ?AUTO_7890 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7889 ?AUTO_7893 ) ( IN-CITY ?AUTO_7893 ?AUTO_7891 ) ( IN-CITY ?AUTO_7888 ?AUTO_7891 ) ( not ( = ?AUTO_7888 ?AUTO_7893 ) ) ( AIRPORT ?AUTO_7892 ) ( AIRPORT ?AUTO_7893 ) ( AIRPLANE-AT ?AUTO_7890 ?AUTO_7892 ) ( not ( = ?AUTO_7892 ?AUTO_7893 ) ) ( not ( = ?AUTO_7888 ?AUTO_7892 ) ) ( OBJ-AT ?AUTO_7887 ?AUTO_7892 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7887 ?AUTO_7890 ?AUTO_7892 )
      ( DELIVER-PKG ?AUTO_7887 ?AUTO_7888 )
      ( DELIVER-PKG-VERIFY ?AUTO_7887 ?AUTO_7888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7894 - OBJ
      ?AUTO_7895 - LOCATION
    )
    :vars
    (
      ?AUTO_7896 - TRUCK
      ?AUTO_7900 - LOCATION
      ?AUTO_7898 - CITY
      ?AUTO_7899 - LOCATION
      ?AUTO_7897 - AIRPLANE
      ?AUTO_7901 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7896 ?AUTO_7900 ) ( IN-CITY ?AUTO_7900 ?AUTO_7898 ) ( IN-CITY ?AUTO_7895 ?AUTO_7898 ) ( not ( = ?AUTO_7895 ?AUTO_7900 ) ) ( AIRPORT ?AUTO_7899 ) ( AIRPORT ?AUTO_7900 ) ( AIRPLANE-AT ?AUTO_7897 ?AUTO_7899 ) ( not ( = ?AUTO_7899 ?AUTO_7900 ) ) ( not ( = ?AUTO_7895 ?AUTO_7899 ) ) ( TRUCK-AT ?AUTO_7901 ?AUTO_7899 ) ( IN-TRUCK ?AUTO_7894 ?AUTO_7901 ) ( not ( = ?AUTO_7896 ?AUTO_7901 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7894 ?AUTO_7901 ?AUTO_7899 )
      ( DELIVER-PKG ?AUTO_7894 ?AUTO_7895 )
      ( DELIVER-PKG-VERIFY ?AUTO_7894 ?AUTO_7895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7902 - OBJ
      ?AUTO_7903 - LOCATION
    )
    :vars
    (
      ?AUTO_7906 - TRUCK
      ?AUTO_7904 - LOCATION
      ?AUTO_7907 - CITY
      ?AUTO_7905 - LOCATION
      ?AUTO_7908 - AIRPLANE
      ?AUTO_7909 - TRUCK
      ?AUTO_7910 - LOCATION
      ?AUTO_7911 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7906 ?AUTO_7904 ) ( IN-CITY ?AUTO_7904 ?AUTO_7907 ) ( IN-CITY ?AUTO_7903 ?AUTO_7907 ) ( not ( = ?AUTO_7903 ?AUTO_7904 ) ) ( AIRPORT ?AUTO_7905 ) ( AIRPORT ?AUTO_7904 ) ( AIRPLANE-AT ?AUTO_7908 ?AUTO_7905 ) ( not ( = ?AUTO_7905 ?AUTO_7904 ) ) ( not ( = ?AUTO_7903 ?AUTO_7905 ) ) ( IN-TRUCK ?AUTO_7902 ?AUTO_7909 ) ( not ( = ?AUTO_7906 ?AUTO_7909 ) ) ( TRUCK-AT ?AUTO_7909 ?AUTO_7910 ) ( IN-CITY ?AUTO_7910 ?AUTO_7911 ) ( IN-CITY ?AUTO_7905 ?AUTO_7911 ) ( not ( = ?AUTO_7905 ?AUTO_7910 ) ) ( not ( = ?AUTO_7903 ?AUTO_7910 ) ) ( not ( = ?AUTO_7904 ?AUTO_7910 ) ) ( not ( = ?AUTO_7907 ?AUTO_7911 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7909 ?AUTO_7910 ?AUTO_7905 ?AUTO_7911 )
      ( DELIVER-PKG ?AUTO_7902 ?AUTO_7903 )
      ( DELIVER-PKG-VERIFY ?AUTO_7902 ?AUTO_7903 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7912 - OBJ
      ?AUTO_7913 - LOCATION
    )
    :vars
    (
      ?AUTO_7914 - TRUCK
      ?AUTO_7915 - LOCATION
      ?AUTO_7918 - CITY
      ?AUTO_7916 - LOCATION
      ?AUTO_7917 - TRUCK
      ?AUTO_7920 - LOCATION
      ?AUTO_7919 - CITY
      ?AUTO_7922 - LOCATION
      ?AUTO_7921 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7914 ?AUTO_7915 ) ( IN-CITY ?AUTO_7915 ?AUTO_7918 ) ( IN-CITY ?AUTO_7913 ?AUTO_7918 ) ( not ( = ?AUTO_7913 ?AUTO_7915 ) ) ( AIRPORT ?AUTO_7916 ) ( AIRPORT ?AUTO_7915 ) ( not ( = ?AUTO_7916 ?AUTO_7915 ) ) ( not ( = ?AUTO_7913 ?AUTO_7916 ) ) ( IN-TRUCK ?AUTO_7912 ?AUTO_7917 ) ( not ( = ?AUTO_7914 ?AUTO_7917 ) ) ( TRUCK-AT ?AUTO_7917 ?AUTO_7920 ) ( IN-CITY ?AUTO_7920 ?AUTO_7919 ) ( IN-CITY ?AUTO_7916 ?AUTO_7919 ) ( not ( = ?AUTO_7916 ?AUTO_7920 ) ) ( not ( = ?AUTO_7913 ?AUTO_7920 ) ) ( not ( = ?AUTO_7915 ?AUTO_7920 ) ) ( not ( = ?AUTO_7918 ?AUTO_7919 ) ) ( AIRPORT ?AUTO_7922 ) ( AIRPLANE-AT ?AUTO_7921 ?AUTO_7922 ) ( not ( = ?AUTO_7922 ?AUTO_7916 ) ) ( not ( = ?AUTO_7913 ?AUTO_7922 ) ) ( not ( = ?AUTO_7915 ?AUTO_7922 ) ) ( not ( = ?AUTO_7920 ?AUTO_7922 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7921 ?AUTO_7922 ?AUTO_7916 )
      ( DELIVER-PKG ?AUTO_7912 ?AUTO_7913 )
      ( DELIVER-PKG-VERIFY ?AUTO_7912 ?AUTO_7913 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7981 - OBJ
      ?AUTO_7982 - LOCATION
    )
    :vars
    (
      ?AUTO_7983 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7983 ?AUTO_7982 ) ( IN-TRUCK ?AUTO_7981 ?AUTO_7983 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7981 ?AUTO_7983 ?AUTO_7982 )
      ( DELIVER-PKG-VERIFY ?AUTO_7981 ?AUTO_7982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7984 - OBJ
      ?AUTO_7985 - LOCATION
    )
    :vars
    (
      ?AUTO_7986 - TRUCK
      ?AUTO_7987 - LOCATION
      ?AUTO_7988 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7984 ?AUTO_7986 ) ( TRUCK-AT ?AUTO_7986 ?AUTO_7987 ) ( IN-CITY ?AUTO_7987 ?AUTO_7988 ) ( IN-CITY ?AUTO_7985 ?AUTO_7988 ) ( not ( = ?AUTO_7985 ?AUTO_7987 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7986 ?AUTO_7987 ?AUTO_7985 ?AUTO_7988 )
      ( DELIVER-PKG ?AUTO_7984 ?AUTO_7985 )
      ( DELIVER-PKG-VERIFY ?AUTO_7984 ?AUTO_7985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7989 - OBJ
      ?AUTO_7990 - LOCATION
    )
    :vars
    (
      ?AUTO_7991 - TRUCK
      ?AUTO_7992 - LOCATION
      ?AUTO_7993 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7991 ?AUTO_7992 ) ( IN-CITY ?AUTO_7992 ?AUTO_7993 ) ( IN-CITY ?AUTO_7990 ?AUTO_7993 ) ( not ( = ?AUTO_7990 ?AUTO_7992 ) ) ( OBJ-AT ?AUTO_7989 ?AUTO_7992 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7989 ?AUTO_7991 ?AUTO_7992 )
      ( DELIVER-PKG ?AUTO_7989 ?AUTO_7990 )
      ( DELIVER-PKG-VERIFY ?AUTO_7989 ?AUTO_7990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7994 - OBJ
      ?AUTO_7995 - LOCATION
    )
    :vars
    (
      ?AUTO_7996 - LOCATION
      ?AUTO_7998 - CITY
      ?AUTO_7997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7996 ?AUTO_7998 ) ( IN-CITY ?AUTO_7995 ?AUTO_7998 ) ( not ( = ?AUTO_7995 ?AUTO_7996 ) ) ( OBJ-AT ?AUTO_7994 ?AUTO_7996 ) ( TRUCK-AT ?AUTO_7997 ?AUTO_7995 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7997 ?AUTO_7995 ?AUTO_7996 ?AUTO_7998 )
      ( DELIVER-PKG ?AUTO_7994 ?AUTO_7995 )
      ( DELIVER-PKG-VERIFY ?AUTO_7994 ?AUTO_7995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8001 - OBJ
      ?AUTO_8002 - LOCATION
    )
    :vars
    (
      ?AUTO_8003 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8003 ?AUTO_8002 ) ( IN-TRUCK ?AUTO_8001 ?AUTO_8003 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8001 ?AUTO_8003 ?AUTO_8002 )
      ( DELIVER-PKG-VERIFY ?AUTO_8001 ?AUTO_8002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8004 - OBJ
      ?AUTO_8005 - LOCATION
    )
    :vars
    (
      ?AUTO_8006 - TRUCK
      ?AUTO_8007 - LOCATION
      ?AUTO_8008 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8004 ?AUTO_8006 ) ( TRUCK-AT ?AUTO_8006 ?AUTO_8007 ) ( IN-CITY ?AUTO_8007 ?AUTO_8008 ) ( IN-CITY ?AUTO_8005 ?AUTO_8008 ) ( not ( = ?AUTO_8005 ?AUTO_8007 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8006 ?AUTO_8007 ?AUTO_8005 ?AUTO_8008 )
      ( DELIVER-PKG ?AUTO_8004 ?AUTO_8005 )
      ( DELIVER-PKG-VERIFY ?AUTO_8004 ?AUTO_8005 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8009 - OBJ
      ?AUTO_8010 - LOCATION
    )
    :vars
    (
      ?AUTO_8011 - TRUCK
      ?AUTO_8012 - LOCATION
      ?AUTO_8013 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8011 ?AUTO_8012 ) ( IN-CITY ?AUTO_8012 ?AUTO_8013 ) ( IN-CITY ?AUTO_8010 ?AUTO_8013 ) ( not ( = ?AUTO_8010 ?AUTO_8012 ) ) ( OBJ-AT ?AUTO_8009 ?AUTO_8012 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8009 ?AUTO_8011 ?AUTO_8012 )
      ( DELIVER-PKG ?AUTO_8009 ?AUTO_8010 )
      ( DELIVER-PKG-VERIFY ?AUTO_8009 ?AUTO_8010 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8014 - OBJ
      ?AUTO_8015 - LOCATION
    )
    :vars
    (
      ?AUTO_8016 - LOCATION
      ?AUTO_8018 - CITY
      ?AUTO_8017 - TRUCK
      ?AUTO_8019 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8016 ?AUTO_8018 ) ( IN-CITY ?AUTO_8015 ?AUTO_8018 ) ( not ( = ?AUTO_8015 ?AUTO_8016 ) ) ( OBJ-AT ?AUTO_8014 ?AUTO_8016 ) ( TRUCK-AT ?AUTO_8017 ?AUTO_8019 ) ( IN-CITY ?AUTO_8019 ?AUTO_8018 ) ( not ( = ?AUTO_8016 ?AUTO_8019 ) ) ( not ( = ?AUTO_8015 ?AUTO_8019 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8017 ?AUTO_8019 ?AUTO_8016 ?AUTO_8018 )
      ( DELIVER-PKG ?AUTO_8014 ?AUTO_8015 )
      ( DELIVER-PKG-VERIFY ?AUTO_8014 ?AUTO_8015 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8022 - OBJ
      ?AUTO_8023 - LOCATION
    )
    :vars
    (
      ?AUTO_8024 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8024 ?AUTO_8023 ) ( IN-TRUCK ?AUTO_8022 ?AUTO_8024 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8022 ?AUTO_8024 ?AUTO_8023 )
      ( DELIVER-PKG-VERIFY ?AUTO_8022 ?AUTO_8023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8031 - OBJ
      ?AUTO_8032 - LOCATION
    )
    :vars
    (
      ?AUTO_8033 - TRUCK
      ?AUTO_8034 - LOCATION
      ?AUTO_8035 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8031 ?AUTO_8033 ) ( TRUCK-AT ?AUTO_8033 ?AUTO_8034 ) ( IN-CITY ?AUTO_8034 ?AUTO_8035 ) ( IN-CITY ?AUTO_8032 ?AUTO_8035 ) ( not ( = ?AUTO_8032 ?AUTO_8034 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8033 ?AUTO_8034 ?AUTO_8032 ?AUTO_8035 )
      ( DELIVER-PKG ?AUTO_8031 ?AUTO_8032 )
      ( DELIVER-PKG-VERIFY ?AUTO_8031 ?AUTO_8032 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8036 - OBJ
      ?AUTO_8037 - LOCATION
    )
    :vars
    (
      ?AUTO_8038 - TRUCK
      ?AUTO_8039 - LOCATION
      ?AUTO_8040 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8038 ?AUTO_8039 ) ( IN-CITY ?AUTO_8039 ?AUTO_8040 ) ( IN-CITY ?AUTO_8037 ?AUTO_8040 ) ( not ( = ?AUTO_8037 ?AUTO_8039 ) ) ( OBJ-AT ?AUTO_8036 ?AUTO_8039 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8036 ?AUTO_8038 ?AUTO_8039 )
      ( DELIVER-PKG ?AUTO_8036 ?AUTO_8037 )
      ( DELIVER-PKG-VERIFY ?AUTO_8036 ?AUTO_8037 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8057 - OBJ
      ?AUTO_8058 - LOCATION
    )
    :vars
    (
      ?AUTO_8059 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8059 ?AUTO_8058 ) ( IN-TRUCK ?AUTO_8057 ?AUTO_8059 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8057 ?AUTO_8059 ?AUTO_8058 )
      ( DELIVER-PKG-VERIFY ?AUTO_8057 ?AUTO_8058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8060 - OBJ
      ?AUTO_8061 - LOCATION
    )
    :vars
    (
      ?AUTO_8062 - TRUCK
      ?AUTO_8063 - LOCATION
      ?AUTO_8064 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8060 ?AUTO_8062 ) ( TRUCK-AT ?AUTO_8062 ?AUTO_8063 ) ( IN-CITY ?AUTO_8063 ?AUTO_8064 ) ( IN-CITY ?AUTO_8061 ?AUTO_8064 ) ( not ( = ?AUTO_8061 ?AUTO_8063 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8062 ?AUTO_8063 ?AUTO_8061 ?AUTO_8064 )
      ( DELIVER-PKG ?AUTO_8060 ?AUTO_8061 )
      ( DELIVER-PKG-VERIFY ?AUTO_8060 ?AUTO_8061 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8065 - OBJ
      ?AUTO_8066 - LOCATION
    )
    :vars
    (
      ?AUTO_8067 - TRUCK
      ?AUTO_8068 - LOCATION
      ?AUTO_8069 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8067 ?AUTO_8068 ) ( IN-CITY ?AUTO_8068 ?AUTO_8069 ) ( IN-CITY ?AUTO_8066 ?AUTO_8069 ) ( not ( = ?AUTO_8066 ?AUTO_8068 ) ) ( OBJ-AT ?AUTO_8065 ?AUTO_8068 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8065 ?AUTO_8067 ?AUTO_8068 )
      ( DELIVER-PKG ?AUTO_8065 ?AUTO_8066 )
      ( DELIVER-PKG-VERIFY ?AUTO_8065 ?AUTO_8066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8070 - OBJ
      ?AUTO_8071 - LOCATION
    )
    :vars
    (
      ?AUTO_8072 - LOCATION
      ?AUTO_8074 - CITY
      ?AUTO_8073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8072 ?AUTO_8074 ) ( IN-CITY ?AUTO_8071 ?AUTO_8074 ) ( not ( = ?AUTO_8071 ?AUTO_8072 ) ) ( OBJ-AT ?AUTO_8070 ?AUTO_8072 ) ( TRUCK-AT ?AUTO_8073 ?AUTO_8071 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8073 ?AUTO_8071 ?AUTO_8072 ?AUTO_8074 )
      ( DELIVER-PKG ?AUTO_8070 ?AUTO_8071 )
      ( DELIVER-PKG-VERIFY ?AUTO_8070 ?AUTO_8071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8103 - OBJ
      ?AUTO_8104 - LOCATION
    )
    :vars
    (
      ?AUTO_8105 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8103 ?AUTO_8105 ) ( AIRPLANE-AT ?AUTO_8105 ?AUTO_8104 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8103 ?AUTO_8105 ?AUTO_8104 )
      ( DELIVER-PKG-VERIFY ?AUTO_8103 ?AUTO_8104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8106 - OBJ
      ?AUTO_8107 - LOCATION
    )
    :vars
    (
      ?AUTO_8108 - AIRPLANE
      ?AUTO_8109 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8106 ?AUTO_8108 ) ( AIRPORT ?AUTO_8109 ) ( AIRPORT ?AUTO_8107 ) ( AIRPLANE-AT ?AUTO_8108 ?AUTO_8109 ) ( not ( = ?AUTO_8109 ?AUTO_8107 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8108 ?AUTO_8109 ?AUTO_8107 )
      ( DELIVER-PKG ?AUTO_8106 ?AUTO_8107 )
      ( DELIVER-PKG-VERIFY ?AUTO_8106 ?AUTO_8107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8114 - OBJ
      ?AUTO_8115 - LOCATION
    )
    :vars
    (
      ?AUTO_8116 - LOCATION
      ?AUTO_8117 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8116 ) ( AIRPORT ?AUTO_8115 ) ( AIRPLANE-AT ?AUTO_8117 ?AUTO_8116 ) ( not ( = ?AUTO_8116 ?AUTO_8115 ) ) ( OBJ-AT ?AUTO_8114 ?AUTO_8116 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8114 ?AUTO_8117 ?AUTO_8116 )
      ( DELIVER-PKG ?AUTO_8114 ?AUTO_8115 )
      ( DELIVER-PKG-VERIFY ?AUTO_8114 ?AUTO_8115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8118 - OBJ
      ?AUTO_8119 - LOCATION
    )
    :vars
    (
      ?AUTO_8120 - LOCATION
      ?AUTO_8121 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8120 ) ( AIRPORT ?AUTO_8119 ) ( not ( = ?AUTO_8120 ?AUTO_8119 ) ) ( OBJ-AT ?AUTO_8118 ?AUTO_8120 ) ( AIRPLANE-AT ?AUTO_8121 ?AUTO_8119 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8121 ?AUTO_8119 ?AUTO_8120 )
      ( DELIVER-PKG ?AUTO_8118 ?AUTO_8119 )
      ( DELIVER-PKG-VERIFY ?AUTO_8118 ?AUTO_8119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8148 - OBJ
      ?AUTO_8149 - LOCATION
    )
    :vars
    (
      ?AUTO_8150 - LOCATION
      ?AUTO_8151 - AIRPLANE
      ?AUTO_8152 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8150 ) ( AIRPORT ?AUTO_8149 ) ( not ( = ?AUTO_8150 ?AUTO_8149 ) ) ( AIRPLANE-AT ?AUTO_8151 ?AUTO_8149 ) ( TRUCK-AT ?AUTO_8152 ?AUTO_8150 ) ( IN-TRUCK ?AUTO_8148 ?AUTO_8152 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8148 ?AUTO_8152 ?AUTO_8150 )
      ( DELIVER-PKG ?AUTO_8148 ?AUTO_8149 )
      ( DELIVER-PKG-VERIFY ?AUTO_8148 ?AUTO_8149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8153 - OBJ
      ?AUTO_8154 - LOCATION
    )
    :vars
    (
      ?AUTO_8155 - LOCATION
      ?AUTO_8156 - AIRPLANE
      ?AUTO_8157 - TRUCK
      ?AUTO_8158 - LOCATION
      ?AUTO_8159 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8155 ) ( AIRPORT ?AUTO_8154 ) ( not ( = ?AUTO_8155 ?AUTO_8154 ) ) ( AIRPLANE-AT ?AUTO_8156 ?AUTO_8154 ) ( IN-TRUCK ?AUTO_8153 ?AUTO_8157 ) ( TRUCK-AT ?AUTO_8157 ?AUTO_8158 ) ( IN-CITY ?AUTO_8158 ?AUTO_8159 ) ( IN-CITY ?AUTO_8155 ?AUTO_8159 ) ( not ( = ?AUTO_8155 ?AUTO_8158 ) ) ( not ( = ?AUTO_8154 ?AUTO_8158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8157 ?AUTO_8158 ?AUTO_8155 ?AUTO_8159 )
      ( DELIVER-PKG ?AUTO_8153 ?AUTO_8154 )
      ( DELIVER-PKG-VERIFY ?AUTO_8153 ?AUTO_8154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8160 - OBJ
      ?AUTO_8161 - LOCATION
    )
    :vars
    (
      ?AUTO_8163 - LOCATION
      ?AUTO_8162 - AIRPLANE
      ?AUTO_8164 - TRUCK
      ?AUTO_8166 - LOCATION
      ?AUTO_8165 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8163 ) ( AIRPORT ?AUTO_8161 ) ( not ( = ?AUTO_8163 ?AUTO_8161 ) ) ( AIRPLANE-AT ?AUTO_8162 ?AUTO_8161 ) ( TRUCK-AT ?AUTO_8164 ?AUTO_8166 ) ( IN-CITY ?AUTO_8166 ?AUTO_8165 ) ( IN-CITY ?AUTO_8163 ?AUTO_8165 ) ( not ( = ?AUTO_8163 ?AUTO_8166 ) ) ( not ( = ?AUTO_8161 ?AUTO_8166 ) ) ( OBJ-AT ?AUTO_8160 ?AUTO_8166 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8160 ?AUTO_8164 ?AUTO_8166 )
      ( DELIVER-PKG ?AUTO_8160 ?AUTO_8161 )
      ( DELIVER-PKG-VERIFY ?AUTO_8160 ?AUTO_8161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8167 - OBJ
      ?AUTO_8168 - LOCATION
    )
    :vars
    (
      ?AUTO_8171 - LOCATION
      ?AUTO_8170 - AIRPLANE
      ?AUTO_8169 - LOCATION
      ?AUTO_8172 - CITY
      ?AUTO_8173 - TRUCK
      ?AUTO_8174 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8171 ) ( AIRPORT ?AUTO_8168 ) ( not ( = ?AUTO_8171 ?AUTO_8168 ) ) ( AIRPLANE-AT ?AUTO_8170 ?AUTO_8168 ) ( IN-CITY ?AUTO_8169 ?AUTO_8172 ) ( IN-CITY ?AUTO_8171 ?AUTO_8172 ) ( not ( = ?AUTO_8171 ?AUTO_8169 ) ) ( not ( = ?AUTO_8168 ?AUTO_8169 ) ) ( OBJ-AT ?AUTO_8167 ?AUTO_8169 ) ( TRUCK-AT ?AUTO_8173 ?AUTO_8174 ) ( IN-CITY ?AUTO_8174 ?AUTO_8172 ) ( not ( = ?AUTO_8169 ?AUTO_8174 ) ) ( not ( = ?AUTO_8168 ?AUTO_8174 ) ) ( not ( = ?AUTO_8171 ?AUTO_8174 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8173 ?AUTO_8174 ?AUTO_8169 ?AUTO_8172 )
      ( DELIVER-PKG ?AUTO_8167 ?AUTO_8168 )
      ( DELIVER-PKG-VERIFY ?AUTO_8167 ?AUTO_8168 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8177 - OBJ
      ?AUTO_8178 - LOCATION
    )
    :vars
    (
      ?AUTO_8179 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8177 ?AUTO_8179 ) ( AIRPLANE-AT ?AUTO_8179 ?AUTO_8178 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8177 ?AUTO_8179 ?AUTO_8178 )
      ( DELIVER-PKG-VERIFY ?AUTO_8177 ?AUTO_8178 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8182 - OBJ
      ?AUTO_8183 - LOCATION
    )
    :vars
    (
      ?AUTO_8184 - AIRPLANE
      ?AUTO_8185 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8182 ?AUTO_8184 ) ( AIRPORT ?AUTO_8185 ) ( AIRPORT ?AUTO_8183 ) ( AIRPLANE-AT ?AUTO_8184 ?AUTO_8185 ) ( not ( = ?AUTO_8185 ?AUTO_8183 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8184 ?AUTO_8185 ?AUTO_8183 )
      ( DELIVER-PKG ?AUTO_8182 ?AUTO_8183 )
      ( DELIVER-PKG-VERIFY ?AUTO_8182 ?AUTO_8183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8190 - OBJ
      ?AUTO_8191 - LOCATION
    )
    :vars
    (
      ?AUTO_8192 - LOCATION
      ?AUTO_8193 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8192 ) ( AIRPORT ?AUTO_8191 ) ( AIRPLANE-AT ?AUTO_8193 ?AUTO_8192 ) ( not ( = ?AUTO_8192 ?AUTO_8191 ) ) ( OBJ-AT ?AUTO_8190 ?AUTO_8192 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8190 ?AUTO_8193 ?AUTO_8192 )
      ( DELIVER-PKG ?AUTO_8190 ?AUTO_8191 )
      ( DELIVER-PKG-VERIFY ?AUTO_8190 ?AUTO_8191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8194 - OBJ
      ?AUTO_8195 - LOCATION
    )
    :vars
    (
      ?AUTO_8197 - LOCATION
      ?AUTO_8198 - LOCATION
      ?AUTO_8196 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8197 ) ( AIRPORT ?AUTO_8195 ) ( not ( = ?AUTO_8197 ?AUTO_8195 ) ) ( OBJ-AT ?AUTO_8194 ?AUTO_8197 ) ( AIRPORT ?AUTO_8198 ) ( AIRPLANE-AT ?AUTO_8196 ?AUTO_8198 ) ( not ( = ?AUTO_8198 ?AUTO_8197 ) ) ( not ( = ?AUTO_8195 ?AUTO_8198 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8196 ?AUTO_8198 ?AUTO_8197 )
      ( DELIVER-PKG ?AUTO_8194 ?AUTO_8195 )
      ( DELIVER-PKG-VERIFY ?AUTO_8194 ?AUTO_8195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8239 - OBJ
      ?AUTO_8240 - LOCATION
    )
    :vars
    (
      ?AUTO_8241 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8241 ?AUTO_8240 ) ( IN-TRUCK ?AUTO_8239 ?AUTO_8241 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8239 ?AUTO_8241 ?AUTO_8240 )
      ( DELIVER-PKG-VERIFY ?AUTO_8239 ?AUTO_8240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8242 - OBJ
      ?AUTO_8243 - LOCATION
    )
    :vars
    (
      ?AUTO_8244 - TRUCK
      ?AUTO_8245 - LOCATION
      ?AUTO_8246 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8242 ?AUTO_8244 ) ( TRUCK-AT ?AUTO_8244 ?AUTO_8245 ) ( IN-CITY ?AUTO_8245 ?AUTO_8246 ) ( IN-CITY ?AUTO_8243 ?AUTO_8246 ) ( not ( = ?AUTO_8243 ?AUTO_8245 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8244 ?AUTO_8245 ?AUTO_8243 ?AUTO_8246 )
      ( DELIVER-PKG ?AUTO_8242 ?AUTO_8243 )
      ( DELIVER-PKG-VERIFY ?AUTO_8242 ?AUTO_8243 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8287 - OBJ
      ?AUTO_8288 - LOCATION
    )
    :vars
    (
      ?AUTO_8290 - LOCATION
      ?AUTO_8289 - CITY
      ?AUTO_8291 - TRUCK
      ?AUTO_8292 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8290 ?AUTO_8289 ) ( IN-CITY ?AUTO_8288 ?AUTO_8289 ) ( not ( = ?AUTO_8288 ?AUTO_8290 ) ) ( OBJ-AT ?AUTO_8287 ?AUTO_8290 ) ( TRUCK-AT ?AUTO_8291 ?AUTO_8292 ) ( IN-CITY ?AUTO_8292 ?AUTO_8289 ) ( not ( = ?AUTO_8290 ?AUTO_8292 ) ) ( not ( = ?AUTO_8288 ?AUTO_8292 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8291 ?AUTO_8292 ?AUTO_8290 ?AUTO_8289 )
      ( DELIVER-PKG ?AUTO_8287 ?AUTO_8288 )
      ( DELIVER-PKG-VERIFY ?AUTO_8287 ?AUTO_8288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8305 - OBJ
      ?AUTO_8306 - LOCATION
    )
    :vars
    (
      ?AUTO_8307 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8307 ?AUTO_8306 ) ( IN-TRUCK ?AUTO_8305 ?AUTO_8307 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8305 ?AUTO_8307 ?AUTO_8306 )
      ( DELIVER-PKG-VERIFY ?AUTO_8305 ?AUTO_8306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8344 - OBJ
      ?AUTO_8345 - LOCATION
    )
    :vars
    (
      ?AUTO_8348 - LOCATION
      ?AUTO_8347 - CITY
      ?AUTO_8346 - TRUCK
      ?AUTO_8349 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8348 ?AUTO_8347 ) ( IN-CITY ?AUTO_8345 ?AUTO_8347 ) ( not ( = ?AUTO_8345 ?AUTO_8348 ) ) ( OBJ-AT ?AUTO_8344 ?AUTO_8348 ) ( TRUCK-AT ?AUTO_8346 ?AUTO_8349 ) ( IN-CITY ?AUTO_8349 ?AUTO_8347 ) ( not ( = ?AUTO_8348 ?AUTO_8349 ) ) ( not ( = ?AUTO_8345 ?AUTO_8349 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8346 ?AUTO_8349 ?AUTO_8348 ?AUTO_8347 )
      ( DELIVER-PKG ?AUTO_8344 ?AUTO_8345 )
      ( DELIVER-PKG-VERIFY ?AUTO_8344 ?AUTO_8345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8370 - OBJ
      ?AUTO_8371 - LOCATION
    )
    :vars
    (
      ?AUTO_8372 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8372 ?AUTO_8371 ) ( IN-TRUCK ?AUTO_8370 ?AUTO_8372 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8370 ?AUTO_8372 ?AUTO_8371 )
      ( DELIVER-PKG-VERIFY ?AUTO_8370 ?AUTO_8371 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8433 - OBJ
      ?AUTO_8434 - LOCATION
    )
    :vars
    (
      ?AUTO_8435 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8435 ?AUTO_8434 ) ( IN-TRUCK ?AUTO_8433 ?AUTO_8435 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8433 ?AUTO_8435 ?AUTO_8434 )
      ( DELIVER-PKG-VERIFY ?AUTO_8433 ?AUTO_8434 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8436 - OBJ
      ?AUTO_8437 - LOCATION
    )
    :vars
    (
      ?AUTO_8438 - TRUCK
      ?AUTO_8439 - LOCATION
      ?AUTO_8440 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8436 ?AUTO_8438 ) ( TRUCK-AT ?AUTO_8438 ?AUTO_8439 ) ( IN-CITY ?AUTO_8439 ?AUTO_8440 ) ( IN-CITY ?AUTO_8437 ?AUTO_8440 ) ( not ( = ?AUTO_8437 ?AUTO_8439 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8438 ?AUTO_8439 ?AUTO_8437 ?AUTO_8440 )
      ( DELIVER-PKG ?AUTO_8436 ?AUTO_8437 )
      ( DELIVER-PKG-VERIFY ?AUTO_8436 ?AUTO_8437 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8441 - OBJ
      ?AUTO_8442 - LOCATION
    )
    :vars
    (
      ?AUTO_8443 - TRUCK
      ?AUTO_8444 - LOCATION
      ?AUTO_8445 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8443 ?AUTO_8444 ) ( IN-CITY ?AUTO_8444 ?AUTO_8445 ) ( IN-CITY ?AUTO_8442 ?AUTO_8445 ) ( not ( = ?AUTO_8442 ?AUTO_8444 ) ) ( OBJ-AT ?AUTO_8441 ?AUTO_8444 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8441 ?AUTO_8443 ?AUTO_8444 )
      ( DELIVER-PKG ?AUTO_8441 ?AUTO_8442 )
      ( DELIVER-PKG-VERIFY ?AUTO_8441 ?AUTO_8442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8452 - OBJ
      ?AUTO_8453 - LOCATION
    )
    :vars
    (
      ?AUTO_8456 - LOCATION
      ?AUTO_8455 - CITY
      ?AUTO_8454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8456 ?AUTO_8455 ) ( IN-CITY ?AUTO_8453 ?AUTO_8455 ) ( not ( = ?AUTO_8453 ?AUTO_8456 ) ) ( OBJ-AT ?AUTO_8452 ?AUTO_8456 ) ( TRUCK-AT ?AUTO_8454 ?AUTO_8453 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8454 ?AUTO_8453 ?AUTO_8456 ?AUTO_8455 )
      ( DELIVER-PKG ?AUTO_8452 ?AUTO_8453 )
      ( DELIVER-PKG-VERIFY ?AUTO_8452 ?AUTO_8453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8463 - OBJ
      ?AUTO_8464 - LOCATION
    )
    :vars
    (
      ?AUTO_8465 - LOCATION
      ?AUTO_8467 - CITY
      ?AUTO_8466 - TRUCK
      ?AUTO_8468 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8465 ?AUTO_8467 ) ( IN-CITY ?AUTO_8464 ?AUTO_8467 ) ( not ( = ?AUTO_8464 ?AUTO_8465 ) ) ( TRUCK-AT ?AUTO_8466 ?AUTO_8464 ) ( IN-AIRPLANE ?AUTO_8463 ?AUTO_8468 ) ( AIRPLANE-AT ?AUTO_8468 ?AUTO_8465 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8463 ?AUTO_8468 ?AUTO_8465 )
      ( DELIVER-PKG ?AUTO_8463 ?AUTO_8464 )
      ( DELIVER-PKG-VERIFY ?AUTO_8463 ?AUTO_8464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8469 - OBJ
      ?AUTO_8470 - LOCATION
    )
    :vars
    (
      ?AUTO_8472 - LOCATION
      ?AUTO_8473 - CITY
      ?AUTO_8471 - TRUCK
      ?AUTO_8474 - AIRPLANE
      ?AUTO_8475 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8472 ?AUTO_8473 ) ( IN-CITY ?AUTO_8470 ?AUTO_8473 ) ( not ( = ?AUTO_8470 ?AUTO_8472 ) ) ( TRUCK-AT ?AUTO_8471 ?AUTO_8470 ) ( IN-AIRPLANE ?AUTO_8469 ?AUTO_8474 ) ( AIRPORT ?AUTO_8475 ) ( AIRPORT ?AUTO_8472 ) ( AIRPLANE-AT ?AUTO_8474 ?AUTO_8475 ) ( not ( = ?AUTO_8475 ?AUTO_8472 ) ) ( not ( = ?AUTO_8470 ?AUTO_8475 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8474 ?AUTO_8475 ?AUTO_8472 )
      ( DELIVER-PKG ?AUTO_8469 ?AUTO_8470 )
      ( DELIVER-PKG-VERIFY ?AUTO_8469 ?AUTO_8470 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8480 - OBJ
      ?AUTO_8481 - LOCATION
    )
    :vars
    (
      ?AUTO_8483 - LOCATION
      ?AUTO_8486 - CITY
      ?AUTO_8482 - TRUCK
      ?AUTO_8485 - LOCATION
      ?AUTO_8484 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8483 ?AUTO_8486 ) ( IN-CITY ?AUTO_8481 ?AUTO_8486 ) ( not ( = ?AUTO_8481 ?AUTO_8483 ) ) ( TRUCK-AT ?AUTO_8482 ?AUTO_8481 ) ( AIRPORT ?AUTO_8485 ) ( AIRPORT ?AUTO_8483 ) ( AIRPLANE-AT ?AUTO_8484 ?AUTO_8485 ) ( not ( = ?AUTO_8485 ?AUTO_8483 ) ) ( not ( = ?AUTO_8481 ?AUTO_8485 ) ) ( OBJ-AT ?AUTO_8480 ?AUTO_8485 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8480 ?AUTO_8484 ?AUTO_8485 )
      ( DELIVER-PKG ?AUTO_8480 ?AUTO_8481 )
      ( DELIVER-PKG-VERIFY ?AUTO_8480 ?AUTO_8481 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8487 - OBJ
      ?AUTO_8488 - LOCATION
    )
    :vars
    (
      ?AUTO_8490 - LOCATION
      ?AUTO_8492 - CITY
      ?AUTO_8489 - TRUCK
      ?AUTO_8493 - LOCATION
      ?AUTO_8491 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8490 ?AUTO_8492 ) ( IN-CITY ?AUTO_8488 ?AUTO_8492 ) ( not ( = ?AUTO_8488 ?AUTO_8490 ) ) ( TRUCK-AT ?AUTO_8489 ?AUTO_8488 ) ( AIRPORT ?AUTO_8493 ) ( AIRPORT ?AUTO_8490 ) ( not ( = ?AUTO_8493 ?AUTO_8490 ) ) ( not ( = ?AUTO_8488 ?AUTO_8493 ) ) ( OBJ-AT ?AUTO_8487 ?AUTO_8493 ) ( AIRPLANE-AT ?AUTO_8491 ?AUTO_8490 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8491 ?AUTO_8490 ?AUTO_8493 )
      ( DELIVER-PKG ?AUTO_8487 ?AUTO_8488 )
      ( DELIVER-PKG-VERIFY ?AUTO_8487 ?AUTO_8488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8508 - OBJ
      ?AUTO_8509 - LOCATION
    )
    :vars
    (
      ?AUTO_8512 - LOCATION
      ?AUTO_8510 - CITY
      ?AUTO_8511 - LOCATION
      ?AUTO_8514 - AIRPLANE
      ?AUTO_8513 - TRUCK
      ?AUTO_8515 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8512 ?AUTO_8510 ) ( IN-CITY ?AUTO_8509 ?AUTO_8510 ) ( not ( = ?AUTO_8509 ?AUTO_8512 ) ) ( AIRPORT ?AUTO_8511 ) ( AIRPORT ?AUTO_8512 ) ( not ( = ?AUTO_8511 ?AUTO_8512 ) ) ( not ( = ?AUTO_8509 ?AUTO_8511 ) ) ( OBJ-AT ?AUTO_8508 ?AUTO_8511 ) ( AIRPLANE-AT ?AUTO_8514 ?AUTO_8512 ) ( TRUCK-AT ?AUTO_8513 ?AUTO_8515 ) ( IN-CITY ?AUTO_8515 ?AUTO_8510 ) ( not ( = ?AUTO_8509 ?AUTO_8515 ) ) ( not ( = ?AUTO_8512 ?AUTO_8515 ) ) ( not ( = ?AUTO_8511 ?AUTO_8515 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8513 ?AUTO_8515 ?AUTO_8509 ?AUTO_8510 )
      ( DELIVER-PKG ?AUTO_8508 ?AUTO_8509 )
      ( DELIVER-PKG-VERIFY ?AUTO_8508 ?AUTO_8509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8526 - OBJ
      ?AUTO_8527 - LOCATION
    )
    :vars
    (
      ?AUTO_8532 - LOCATION
      ?AUTO_8531 - CITY
      ?AUTO_8530 - LOCATION
      ?AUTO_8533 - AIRPLANE
      ?AUTO_8528 - TRUCK
      ?AUTO_8529 - LOCATION
      ?AUTO_8534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8532 ?AUTO_8531 ) ( IN-CITY ?AUTO_8527 ?AUTO_8531 ) ( not ( = ?AUTO_8527 ?AUTO_8532 ) ) ( AIRPORT ?AUTO_8530 ) ( AIRPORT ?AUTO_8532 ) ( not ( = ?AUTO_8530 ?AUTO_8532 ) ) ( not ( = ?AUTO_8527 ?AUTO_8530 ) ) ( AIRPLANE-AT ?AUTO_8533 ?AUTO_8532 ) ( TRUCK-AT ?AUTO_8528 ?AUTO_8529 ) ( IN-CITY ?AUTO_8529 ?AUTO_8531 ) ( not ( = ?AUTO_8527 ?AUTO_8529 ) ) ( not ( = ?AUTO_8532 ?AUTO_8529 ) ) ( not ( = ?AUTO_8530 ?AUTO_8529 ) ) ( TRUCK-AT ?AUTO_8534 ?AUTO_8530 ) ( IN-TRUCK ?AUTO_8526 ?AUTO_8534 ) ( not ( = ?AUTO_8528 ?AUTO_8534 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8526 ?AUTO_8534 ?AUTO_8530 )
      ( DELIVER-PKG ?AUTO_8526 ?AUTO_8527 )
      ( DELIVER-PKG-VERIFY ?AUTO_8526 ?AUTO_8527 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8535 - OBJ
      ?AUTO_8536 - LOCATION
    )
    :vars
    (
      ?AUTO_8541 - LOCATION
      ?AUTO_8540 - CITY
      ?AUTO_8539 - LOCATION
      ?AUTO_8542 - AIRPLANE
      ?AUTO_8538 - TRUCK
      ?AUTO_8537 - LOCATION
      ?AUTO_8543 - TRUCK
      ?AUTO_8544 - LOCATION
      ?AUTO_8545 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8541 ?AUTO_8540 ) ( IN-CITY ?AUTO_8536 ?AUTO_8540 ) ( not ( = ?AUTO_8536 ?AUTO_8541 ) ) ( AIRPORT ?AUTO_8539 ) ( AIRPORT ?AUTO_8541 ) ( not ( = ?AUTO_8539 ?AUTO_8541 ) ) ( not ( = ?AUTO_8536 ?AUTO_8539 ) ) ( AIRPLANE-AT ?AUTO_8542 ?AUTO_8541 ) ( TRUCK-AT ?AUTO_8538 ?AUTO_8537 ) ( IN-CITY ?AUTO_8537 ?AUTO_8540 ) ( not ( = ?AUTO_8536 ?AUTO_8537 ) ) ( not ( = ?AUTO_8541 ?AUTO_8537 ) ) ( not ( = ?AUTO_8539 ?AUTO_8537 ) ) ( IN-TRUCK ?AUTO_8535 ?AUTO_8543 ) ( not ( = ?AUTO_8538 ?AUTO_8543 ) ) ( TRUCK-AT ?AUTO_8543 ?AUTO_8544 ) ( IN-CITY ?AUTO_8544 ?AUTO_8545 ) ( IN-CITY ?AUTO_8539 ?AUTO_8545 ) ( not ( = ?AUTO_8539 ?AUTO_8544 ) ) ( not ( = ?AUTO_8536 ?AUTO_8544 ) ) ( not ( = ?AUTO_8541 ?AUTO_8544 ) ) ( not ( = ?AUTO_8540 ?AUTO_8545 ) ) ( not ( = ?AUTO_8537 ?AUTO_8544 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8543 ?AUTO_8544 ?AUTO_8539 ?AUTO_8545 )
      ( DELIVER-PKG ?AUTO_8535 ?AUTO_8536 )
      ( DELIVER-PKG-VERIFY ?AUTO_8535 ?AUTO_8536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8546 - OBJ
      ?AUTO_8547 - LOCATION
    )
    :vars
    (
      ?AUTO_8550 - LOCATION
      ?AUTO_8554 - CITY
      ?AUTO_8553 - LOCATION
      ?AUTO_8555 - AIRPLANE
      ?AUTO_8548 - TRUCK
      ?AUTO_8549 - LOCATION
      ?AUTO_8556 - TRUCK
      ?AUTO_8551 - LOCATION
      ?AUTO_8552 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8550 ?AUTO_8554 ) ( IN-CITY ?AUTO_8547 ?AUTO_8554 ) ( not ( = ?AUTO_8547 ?AUTO_8550 ) ) ( AIRPORT ?AUTO_8553 ) ( AIRPORT ?AUTO_8550 ) ( not ( = ?AUTO_8553 ?AUTO_8550 ) ) ( not ( = ?AUTO_8547 ?AUTO_8553 ) ) ( AIRPLANE-AT ?AUTO_8555 ?AUTO_8550 ) ( TRUCK-AT ?AUTO_8548 ?AUTO_8549 ) ( IN-CITY ?AUTO_8549 ?AUTO_8554 ) ( not ( = ?AUTO_8547 ?AUTO_8549 ) ) ( not ( = ?AUTO_8550 ?AUTO_8549 ) ) ( not ( = ?AUTO_8553 ?AUTO_8549 ) ) ( not ( = ?AUTO_8548 ?AUTO_8556 ) ) ( TRUCK-AT ?AUTO_8556 ?AUTO_8551 ) ( IN-CITY ?AUTO_8551 ?AUTO_8552 ) ( IN-CITY ?AUTO_8553 ?AUTO_8552 ) ( not ( = ?AUTO_8553 ?AUTO_8551 ) ) ( not ( = ?AUTO_8547 ?AUTO_8551 ) ) ( not ( = ?AUTO_8550 ?AUTO_8551 ) ) ( not ( = ?AUTO_8554 ?AUTO_8552 ) ) ( not ( = ?AUTO_8549 ?AUTO_8551 ) ) ( OBJ-AT ?AUTO_8546 ?AUTO_8551 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8546 ?AUTO_8556 ?AUTO_8551 )
      ( DELIVER-PKG ?AUTO_8546 ?AUTO_8547 )
      ( DELIVER-PKG-VERIFY ?AUTO_8546 ?AUTO_8547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8557 - OBJ
      ?AUTO_8558 - LOCATION
    )
    :vars
    (
      ?AUTO_8561 - LOCATION
      ?AUTO_8567 - CITY
      ?AUTO_8565 - LOCATION
      ?AUTO_8562 - AIRPLANE
      ?AUTO_8563 - TRUCK
      ?AUTO_8559 - LOCATION
      ?AUTO_8566 - TRUCK
      ?AUTO_8560 - LOCATION
      ?AUTO_8564 - CITY
      ?AUTO_8568 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8561 ?AUTO_8567 ) ( IN-CITY ?AUTO_8558 ?AUTO_8567 ) ( not ( = ?AUTO_8558 ?AUTO_8561 ) ) ( AIRPORT ?AUTO_8565 ) ( AIRPORT ?AUTO_8561 ) ( not ( = ?AUTO_8565 ?AUTO_8561 ) ) ( not ( = ?AUTO_8558 ?AUTO_8565 ) ) ( AIRPLANE-AT ?AUTO_8562 ?AUTO_8561 ) ( TRUCK-AT ?AUTO_8563 ?AUTO_8559 ) ( IN-CITY ?AUTO_8559 ?AUTO_8567 ) ( not ( = ?AUTO_8558 ?AUTO_8559 ) ) ( not ( = ?AUTO_8561 ?AUTO_8559 ) ) ( not ( = ?AUTO_8565 ?AUTO_8559 ) ) ( not ( = ?AUTO_8563 ?AUTO_8566 ) ) ( IN-CITY ?AUTO_8560 ?AUTO_8564 ) ( IN-CITY ?AUTO_8565 ?AUTO_8564 ) ( not ( = ?AUTO_8565 ?AUTO_8560 ) ) ( not ( = ?AUTO_8558 ?AUTO_8560 ) ) ( not ( = ?AUTO_8561 ?AUTO_8560 ) ) ( not ( = ?AUTO_8567 ?AUTO_8564 ) ) ( not ( = ?AUTO_8559 ?AUTO_8560 ) ) ( OBJ-AT ?AUTO_8557 ?AUTO_8560 ) ( TRUCK-AT ?AUTO_8566 ?AUTO_8568 ) ( IN-CITY ?AUTO_8568 ?AUTO_8564 ) ( not ( = ?AUTO_8560 ?AUTO_8568 ) ) ( not ( = ?AUTO_8558 ?AUTO_8568 ) ) ( not ( = ?AUTO_8561 ?AUTO_8568 ) ) ( not ( = ?AUTO_8565 ?AUTO_8568 ) ) ( not ( = ?AUTO_8559 ?AUTO_8568 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8566 ?AUTO_8568 ?AUTO_8560 ?AUTO_8564 )
      ( DELIVER-PKG ?AUTO_8557 ?AUTO_8558 )
      ( DELIVER-PKG-VERIFY ?AUTO_8557 ?AUTO_8558 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8571 - OBJ
      ?AUTO_8572 - LOCATION
    )
    :vars
    (
      ?AUTO_8573 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8571 ?AUTO_8573 ) ( AIRPLANE-AT ?AUTO_8573 ?AUTO_8572 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8571 ?AUTO_8573 ?AUTO_8572 )
      ( DELIVER-PKG-VERIFY ?AUTO_8571 ?AUTO_8572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8574 - OBJ
      ?AUTO_8575 - LOCATION
    )
    :vars
    (
      ?AUTO_8576 - AIRPLANE
      ?AUTO_8577 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8574 ?AUTO_8576 ) ( AIRPORT ?AUTO_8577 ) ( AIRPORT ?AUTO_8575 ) ( AIRPLANE-AT ?AUTO_8576 ?AUTO_8577 ) ( not ( = ?AUTO_8577 ?AUTO_8575 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8576 ?AUTO_8577 ?AUTO_8575 )
      ( DELIVER-PKG ?AUTO_8574 ?AUTO_8575 )
      ( DELIVER-PKG-VERIFY ?AUTO_8574 ?AUTO_8575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8578 - OBJ
      ?AUTO_8579 - LOCATION
    )
    :vars
    (
      ?AUTO_8581 - LOCATION
      ?AUTO_8580 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8581 ) ( AIRPORT ?AUTO_8579 ) ( AIRPLANE-AT ?AUTO_8580 ?AUTO_8581 ) ( not ( = ?AUTO_8581 ?AUTO_8579 ) ) ( OBJ-AT ?AUTO_8578 ?AUTO_8581 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8578 ?AUTO_8580 ?AUTO_8581 )
      ( DELIVER-PKG ?AUTO_8578 ?AUTO_8579 )
      ( DELIVER-PKG-VERIFY ?AUTO_8578 ?AUTO_8579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8582 - OBJ
      ?AUTO_8583 - LOCATION
    )
    :vars
    (
      ?AUTO_8585 - LOCATION
      ?AUTO_8584 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8585 ) ( AIRPORT ?AUTO_8583 ) ( not ( = ?AUTO_8585 ?AUTO_8583 ) ) ( OBJ-AT ?AUTO_8582 ?AUTO_8585 ) ( AIRPLANE-AT ?AUTO_8584 ?AUTO_8583 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8584 ?AUTO_8583 ?AUTO_8585 )
      ( DELIVER-PKG ?AUTO_8582 ?AUTO_8583 )
      ( DELIVER-PKG-VERIFY ?AUTO_8582 ?AUTO_8583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8598 - OBJ
      ?AUTO_8599 - LOCATION
    )
    :vars
    (
      ?AUTO_8601 - LOCATION
      ?AUTO_8600 - AIRPLANE
      ?AUTO_8602 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8601 ) ( AIRPORT ?AUTO_8599 ) ( not ( = ?AUTO_8601 ?AUTO_8599 ) ) ( AIRPLANE-AT ?AUTO_8600 ?AUTO_8599 ) ( TRUCK-AT ?AUTO_8602 ?AUTO_8601 ) ( IN-TRUCK ?AUTO_8598 ?AUTO_8602 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8598 ?AUTO_8602 ?AUTO_8601 )
      ( DELIVER-PKG ?AUTO_8598 ?AUTO_8599 )
      ( DELIVER-PKG-VERIFY ?AUTO_8598 ?AUTO_8599 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8603 - OBJ
      ?AUTO_8604 - LOCATION
    )
    :vars
    (
      ?AUTO_8606 - LOCATION
      ?AUTO_8605 - AIRPLANE
      ?AUTO_8607 - TRUCK
      ?AUTO_8608 - LOCATION
      ?AUTO_8609 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8606 ) ( AIRPORT ?AUTO_8604 ) ( not ( = ?AUTO_8606 ?AUTO_8604 ) ) ( AIRPLANE-AT ?AUTO_8605 ?AUTO_8604 ) ( IN-TRUCK ?AUTO_8603 ?AUTO_8607 ) ( TRUCK-AT ?AUTO_8607 ?AUTO_8608 ) ( IN-CITY ?AUTO_8608 ?AUTO_8609 ) ( IN-CITY ?AUTO_8606 ?AUTO_8609 ) ( not ( = ?AUTO_8606 ?AUTO_8608 ) ) ( not ( = ?AUTO_8604 ?AUTO_8608 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8607 ?AUTO_8608 ?AUTO_8606 ?AUTO_8609 )
      ( DELIVER-PKG ?AUTO_8603 ?AUTO_8604 )
      ( DELIVER-PKG-VERIFY ?AUTO_8603 ?AUTO_8604 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8614 - OBJ
      ?AUTO_8615 - LOCATION
    )
    :vars
    (
      ?AUTO_8620 - LOCATION
      ?AUTO_8617 - TRUCK
      ?AUTO_8616 - LOCATION
      ?AUTO_8619 - CITY
      ?AUTO_8618 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8620 ) ( AIRPORT ?AUTO_8615 ) ( not ( = ?AUTO_8620 ?AUTO_8615 ) ) ( IN-TRUCK ?AUTO_8614 ?AUTO_8617 ) ( TRUCK-AT ?AUTO_8617 ?AUTO_8616 ) ( IN-CITY ?AUTO_8616 ?AUTO_8619 ) ( IN-CITY ?AUTO_8620 ?AUTO_8619 ) ( not ( = ?AUTO_8620 ?AUTO_8616 ) ) ( not ( = ?AUTO_8615 ?AUTO_8616 ) ) ( AIRPLANE-AT ?AUTO_8618 ?AUTO_8620 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8618 ?AUTO_8620 ?AUTO_8615 )
      ( DELIVER-PKG ?AUTO_8614 ?AUTO_8615 )
      ( DELIVER-PKG-VERIFY ?AUTO_8614 ?AUTO_8615 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8623 - OBJ
      ?AUTO_8624 - LOCATION
    )
    :vars
    (
      ?AUTO_8628 - LOCATION
      ?AUTO_8626 - TRUCK
      ?AUTO_8627 - LOCATION
      ?AUTO_8625 - CITY
      ?AUTO_8630 - LOCATION
      ?AUTO_8629 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8628 ) ( AIRPORT ?AUTO_8624 ) ( not ( = ?AUTO_8628 ?AUTO_8624 ) ) ( IN-TRUCK ?AUTO_8623 ?AUTO_8626 ) ( TRUCK-AT ?AUTO_8626 ?AUTO_8627 ) ( IN-CITY ?AUTO_8627 ?AUTO_8625 ) ( IN-CITY ?AUTO_8628 ?AUTO_8625 ) ( not ( = ?AUTO_8628 ?AUTO_8627 ) ) ( not ( = ?AUTO_8624 ?AUTO_8627 ) ) ( AIRPORT ?AUTO_8630 ) ( AIRPLANE-AT ?AUTO_8629 ?AUTO_8630 ) ( not ( = ?AUTO_8630 ?AUTO_8628 ) ) ( not ( = ?AUTO_8624 ?AUTO_8630 ) ) ( not ( = ?AUTO_8627 ?AUTO_8630 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8629 ?AUTO_8630 ?AUTO_8628 )
      ( DELIVER-PKG ?AUTO_8623 ?AUTO_8624 )
      ( DELIVER-PKG-VERIFY ?AUTO_8623 ?AUTO_8624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8659 - OBJ
      ?AUTO_8660 - LOCATION
    )
    :vars
    (
      ?AUTO_8665 - LOCATION
      ?AUTO_8661 - TRUCK
      ?AUTO_8663 - LOCATION
      ?AUTO_8664 - CITY
      ?AUTO_8662 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8665 ) ( AIRPORT ?AUTO_8660 ) ( not ( = ?AUTO_8665 ?AUTO_8660 ) ) ( TRUCK-AT ?AUTO_8661 ?AUTO_8663 ) ( IN-CITY ?AUTO_8663 ?AUTO_8664 ) ( IN-CITY ?AUTO_8665 ?AUTO_8664 ) ( not ( = ?AUTO_8665 ?AUTO_8663 ) ) ( not ( = ?AUTO_8660 ?AUTO_8663 ) ) ( AIRPLANE-AT ?AUTO_8662 ?AUTO_8665 ) ( OBJ-AT ?AUTO_8659 ?AUTO_8663 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8659 ?AUTO_8661 ?AUTO_8663 )
      ( DELIVER-PKG ?AUTO_8659 ?AUTO_8660 )
      ( DELIVER-PKG-VERIFY ?AUTO_8659 ?AUTO_8660 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8666 - OBJ
      ?AUTO_8667 - LOCATION
    )
    :vars
    (
      ?AUTO_8669 - LOCATION
      ?AUTO_8668 - LOCATION
      ?AUTO_8670 - CITY
      ?AUTO_8671 - AIRPLANE
      ?AUTO_8672 - TRUCK
      ?AUTO_8673 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8669 ) ( AIRPORT ?AUTO_8667 ) ( not ( = ?AUTO_8669 ?AUTO_8667 ) ) ( IN-CITY ?AUTO_8668 ?AUTO_8670 ) ( IN-CITY ?AUTO_8669 ?AUTO_8670 ) ( not ( = ?AUTO_8669 ?AUTO_8668 ) ) ( not ( = ?AUTO_8667 ?AUTO_8668 ) ) ( AIRPLANE-AT ?AUTO_8671 ?AUTO_8669 ) ( OBJ-AT ?AUTO_8666 ?AUTO_8668 ) ( TRUCK-AT ?AUTO_8672 ?AUTO_8673 ) ( IN-CITY ?AUTO_8673 ?AUTO_8670 ) ( not ( = ?AUTO_8668 ?AUTO_8673 ) ) ( not ( = ?AUTO_8667 ?AUTO_8673 ) ) ( not ( = ?AUTO_8669 ?AUTO_8673 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8672 ?AUTO_8673 ?AUTO_8668 ?AUTO_8670 )
      ( DELIVER-PKG ?AUTO_8666 ?AUTO_8667 )
      ( DELIVER-PKG-VERIFY ?AUTO_8666 ?AUTO_8667 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8686 - OBJ
      ?AUTO_8687 - LOCATION
    )
    :vars
    (
      ?AUTO_8688 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8688 ?AUTO_8687 ) ( IN-TRUCK ?AUTO_8686 ?AUTO_8688 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8686 ?AUTO_8688 ?AUTO_8687 )
      ( DELIVER-PKG-VERIFY ?AUTO_8686 ?AUTO_8687 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8689 - OBJ
      ?AUTO_8690 - LOCATION
    )
    :vars
    (
      ?AUTO_8691 - TRUCK
      ?AUTO_8692 - LOCATION
      ?AUTO_8693 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8689 ?AUTO_8691 ) ( TRUCK-AT ?AUTO_8691 ?AUTO_8692 ) ( IN-CITY ?AUTO_8692 ?AUTO_8693 ) ( IN-CITY ?AUTO_8690 ?AUTO_8693 ) ( not ( = ?AUTO_8690 ?AUTO_8692 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8691 ?AUTO_8692 ?AUTO_8690 ?AUTO_8693 )
      ( DELIVER-PKG ?AUTO_8689 ?AUTO_8690 )
      ( DELIVER-PKG-VERIFY ?AUTO_8689 ?AUTO_8690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8694 - OBJ
      ?AUTO_8695 - LOCATION
    )
    :vars
    (
      ?AUTO_8696 - TRUCK
      ?AUTO_8697 - LOCATION
      ?AUTO_8698 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8696 ?AUTO_8697 ) ( IN-CITY ?AUTO_8697 ?AUTO_8698 ) ( IN-CITY ?AUTO_8695 ?AUTO_8698 ) ( not ( = ?AUTO_8695 ?AUTO_8697 ) ) ( OBJ-AT ?AUTO_8694 ?AUTO_8697 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8694 ?AUTO_8696 ?AUTO_8697 )
      ( DELIVER-PKG ?AUTO_8694 ?AUTO_8695 )
      ( DELIVER-PKG-VERIFY ?AUTO_8694 ?AUTO_8695 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8699 - OBJ
      ?AUTO_8700 - LOCATION
    )
    :vars
    (
      ?AUTO_8703 - LOCATION
      ?AUTO_8702 - CITY
      ?AUTO_8701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8703 ?AUTO_8702 ) ( IN-CITY ?AUTO_8700 ?AUTO_8702 ) ( not ( = ?AUTO_8700 ?AUTO_8703 ) ) ( OBJ-AT ?AUTO_8699 ?AUTO_8703 ) ( TRUCK-AT ?AUTO_8701 ?AUTO_8700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8701 ?AUTO_8700 ?AUTO_8703 ?AUTO_8702 )
      ( DELIVER-PKG ?AUTO_8699 ?AUTO_8700 )
      ( DELIVER-PKG-VERIFY ?AUTO_8699 ?AUTO_8700 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8732 - OBJ
      ?AUTO_8733 - LOCATION
    )
    :vars
    (
      ?AUTO_8736 - LOCATION
      ?AUTO_8735 - CITY
      ?AUTO_8734 - TRUCK
      ?AUTO_8737 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8736 ?AUTO_8735 ) ( IN-CITY ?AUTO_8733 ?AUTO_8735 ) ( not ( = ?AUTO_8733 ?AUTO_8736 ) ) ( OBJ-AT ?AUTO_8732 ?AUTO_8736 ) ( TRUCK-AT ?AUTO_8734 ?AUTO_8737 ) ( IN-CITY ?AUTO_8737 ?AUTO_8735 ) ( not ( = ?AUTO_8733 ?AUTO_8737 ) ) ( not ( = ?AUTO_8736 ?AUTO_8737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8734 ?AUTO_8737 ?AUTO_8733 ?AUTO_8735 )
      ( DELIVER-PKG ?AUTO_8732 ?AUTO_8733 )
      ( DELIVER-PKG-VERIFY ?AUTO_8732 ?AUTO_8733 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8788 - OBJ
      ?AUTO_8789 - LOCATION
    )
    :vars
    (
      ?AUTO_8790 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8788 ?AUTO_8790 ) ( AIRPLANE-AT ?AUTO_8790 ?AUTO_8789 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8788 ?AUTO_8790 ?AUTO_8789 )
      ( DELIVER-PKG-VERIFY ?AUTO_8788 ?AUTO_8789 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8791 - OBJ
      ?AUTO_8792 - LOCATION
    )
    :vars
    (
      ?AUTO_8793 - AIRPLANE
      ?AUTO_8794 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8791 ?AUTO_8793 ) ( AIRPORT ?AUTO_8794 ) ( AIRPORT ?AUTO_8792 ) ( AIRPLANE-AT ?AUTO_8793 ?AUTO_8794 ) ( not ( = ?AUTO_8794 ?AUTO_8792 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8793 ?AUTO_8794 ?AUTO_8792 )
      ( DELIVER-PKG ?AUTO_8791 ?AUTO_8792 )
      ( DELIVER-PKG-VERIFY ?AUTO_8791 ?AUTO_8792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8795 - OBJ
      ?AUTO_8796 - LOCATION
    )
    :vars
    (
      ?AUTO_8798 - LOCATION
      ?AUTO_8797 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8798 ) ( AIRPORT ?AUTO_8796 ) ( AIRPLANE-AT ?AUTO_8797 ?AUTO_8798 ) ( not ( = ?AUTO_8798 ?AUTO_8796 ) ) ( OBJ-AT ?AUTO_8795 ?AUTO_8798 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8795 ?AUTO_8797 ?AUTO_8798 )
      ( DELIVER-PKG ?AUTO_8795 ?AUTO_8796 )
      ( DELIVER-PKG-VERIFY ?AUTO_8795 ?AUTO_8796 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8799 - OBJ
      ?AUTO_8800 - LOCATION
    )
    :vars
    (
      ?AUTO_8802 - LOCATION
      ?AUTO_8801 - AIRPLANE
      ?AUTO_8803 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8802 ) ( AIRPORT ?AUTO_8800 ) ( AIRPLANE-AT ?AUTO_8801 ?AUTO_8802 ) ( not ( = ?AUTO_8802 ?AUTO_8800 ) ) ( TRUCK-AT ?AUTO_8803 ?AUTO_8802 ) ( IN-TRUCK ?AUTO_8799 ?AUTO_8803 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8799 ?AUTO_8803 ?AUTO_8802 )
      ( DELIVER-PKG ?AUTO_8799 ?AUTO_8800 )
      ( DELIVER-PKG-VERIFY ?AUTO_8799 ?AUTO_8800 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8804 - OBJ
      ?AUTO_8805 - LOCATION
    )
    :vars
    (
      ?AUTO_8807 - LOCATION
      ?AUTO_8806 - AIRPLANE
      ?AUTO_8808 - TRUCK
      ?AUTO_8809 - LOCATION
      ?AUTO_8810 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8807 ) ( AIRPORT ?AUTO_8805 ) ( AIRPLANE-AT ?AUTO_8806 ?AUTO_8807 ) ( not ( = ?AUTO_8807 ?AUTO_8805 ) ) ( IN-TRUCK ?AUTO_8804 ?AUTO_8808 ) ( TRUCK-AT ?AUTO_8808 ?AUTO_8809 ) ( IN-CITY ?AUTO_8809 ?AUTO_8810 ) ( IN-CITY ?AUTO_8807 ?AUTO_8810 ) ( not ( = ?AUTO_8807 ?AUTO_8809 ) ) ( not ( = ?AUTO_8805 ?AUTO_8809 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8808 ?AUTO_8809 ?AUTO_8807 ?AUTO_8810 )
      ( DELIVER-PKG ?AUTO_8804 ?AUTO_8805 )
      ( DELIVER-PKG-VERIFY ?AUTO_8804 ?AUTO_8805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8811 - OBJ
      ?AUTO_8812 - LOCATION
    )
    :vars
    (
      ?AUTO_8814 - LOCATION
      ?AUTO_8813 - AIRPLANE
      ?AUTO_8815 - TRUCK
      ?AUTO_8817 - LOCATION
      ?AUTO_8816 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8814 ) ( AIRPORT ?AUTO_8812 ) ( AIRPLANE-AT ?AUTO_8813 ?AUTO_8814 ) ( not ( = ?AUTO_8814 ?AUTO_8812 ) ) ( TRUCK-AT ?AUTO_8815 ?AUTO_8817 ) ( IN-CITY ?AUTO_8817 ?AUTO_8816 ) ( IN-CITY ?AUTO_8814 ?AUTO_8816 ) ( not ( = ?AUTO_8814 ?AUTO_8817 ) ) ( not ( = ?AUTO_8812 ?AUTO_8817 ) ) ( OBJ-AT ?AUTO_8811 ?AUTO_8817 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8811 ?AUTO_8815 ?AUTO_8817 )
      ( DELIVER-PKG ?AUTO_8811 ?AUTO_8812 )
      ( DELIVER-PKG-VERIFY ?AUTO_8811 ?AUTO_8812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8818 - OBJ
      ?AUTO_8819 - LOCATION
    )
    :vars
    (
      ?AUTO_8820 - LOCATION
      ?AUTO_8824 - AIRPLANE
      ?AUTO_8821 - LOCATION
      ?AUTO_8823 - CITY
      ?AUTO_8822 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8820 ) ( AIRPORT ?AUTO_8819 ) ( AIRPLANE-AT ?AUTO_8824 ?AUTO_8820 ) ( not ( = ?AUTO_8820 ?AUTO_8819 ) ) ( IN-CITY ?AUTO_8821 ?AUTO_8823 ) ( IN-CITY ?AUTO_8820 ?AUTO_8823 ) ( not ( = ?AUTO_8820 ?AUTO_8821 ) ) ( not ( = ?AUTO_8819 ?AUTO_8821 ) ) ( OBJ-AT ?AUTO_8818 ?AUTO_8821 ) ( TRUCK-AT ?AUTO_8822 ?AUTO_8820 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8822 ?AUTO_8820 ?AUTO_8821 ?AUTO_8823 )
      ( DELIVER-PKG ?AUTO_8818 ?AUTO_8819 )
      ( DELIVER-PKG-VERIFY ?AUTO_8818 ?AUTO_8819 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8829 - OBJ
      ?AUTO_8830 - LOCATION
    )
    :vars
    (
      ?AUTO_8835 - LOCATION
      ?AUTO_8833 - LOCATION
      ?AUTO_8832 - CITY
      ?AUTO_8831 - TRUCK
      ?AUTO_8836 - LOCATION
      ?AUTO_8834 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8835 ) ( AIRPORT ?AUTO_8830 ) ( not ( = ?AUTO_8835 ?AUTO_8830 ) ) ( IN-CITY ?AUTO_8833 ?AUTO_8832 ) ( IN-CITY ?AUTO_8835 ?AUTO_8832 ) ( not ( = ?AUTO_8835 ?AUTO_8833 ) ) ( not ( = ?AUTO_8830 ?AUTO_8833 ) ) ( OBJ-AT ?AUTO_8829 ?AUTO_8833 ) ( TRUCK-AT ?AUTO_8831 ?AUTO_8835 ) ( AIRPORT ?AUTO_8836 ) ( AIRPLANE-AT ?AUTO_8834 ?AUTO_8836 ) ( not ( = ?AUTO_8836 ?AUTO_8835 ) ) ( not ( = ?AUTO_8830 ?AUTO_8836 ) ) ( not ( = ?AUTO_8833 ?AUTO_8836 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8834 ?AUTO_8836 ?AUTO_8835 )
      ( DELIVER-PKG ?AUTO_8829 ?AUTO_8830 )
      ( DELIVER-PKG-VERIFY ?AUTO_8829 ?AUTO_8830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8885 - OBJ
      ?AUTO_8886 - LOCATION
    )
    :vars
    (
      ?AUTO_8892 - LOCATION
      ?AUTO_8890 - LOCATION
      ?AUTO_8888 - CITY
      ?AUTO_8887 - LOCATION
      ?AUTO_8891 - AIRPLANE
      ?AUTO_8889 - TRUCK
      ?AUTO_8893 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8892 ) ( AIRPORT ?AUTO_8886 ) ( not ( = ?AUTO_8892 ?AUTO_8886 ) ) ( IN-CITY ?AUTO_8890 ?AUTO_8888 ) ( IN-CITY ?AUTO_8892 ?AUTO_8888 ) ( not ( = ?AUTO_8892 ?AUTO_8890 ) ) ( not ( = ?AUTO_8886 ?AUTO_8890 ) ) ( OBJ-AT ?AUTO_8885 ?AUTO_8890 ) ( AIRPORT ?AUTO_8887 ) ( AIRPLANE-AT ?AUTO_8891 ?AUTO_8887 ) ( not ( = ?AUTO_8887 ?AUTO_8892 ) ) ( not ( = ?AUTO_8886 ?AUTO_8887 ) ) ( not ( = ?AUTO_8890 ?AUTO_8887 ) ) ( TRUCK-AT ?AUTO_8889 ?AUTO_8893 ) ( IN-CITY ?AUTO_8893 ?AUTO_8888 ) ( not ( = ?AUTO_8892 ?AUTO_8893 ) ) ( not ( = ?AUTO_8886 ?AUTO_8893 ) ) ( not ( = ?AUTO_8890 ?AUTO_8893 ) ) ( not ( = ?AUTO_8887 ?AUTO_8893 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8889 ?AUTO_8893 ?AUTO_8892 ?AUTO_8888 )
      ( DELIVER-PKG ?AUTO_8885 ?AUTO_8886 )
      ( DELIVER-PKG-VERIFY ?AUTO_8885 ?AUTO_8886 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8918 - OBJ
      ?AUTO_8919 - LOCATION
    )
    :vars
    (
      ?AUTO_8920 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8918 ?AUTO_8920 ) ( AIRPLANE-AT ?AUTO_8920 ?AUTO_8919 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8918 ?AUTO_8920 ?AUTO_8919 )
      ( DELIVER-PKG-VERIFY ?AUTO_8918 ?AUTO_8919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8921 - OBJ
      ?AUTO_8922 - LOCATION
    )
    :vars
    (
      ?AUTO_8923 - AIRPLANE
      ?AUTO_8924 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8921 ?AUTO_8923 ) ( AIRPORT ?AUTO_8924 ) ( AIRPORT ?AUTO_8922 ) ( AIRPLANE-AT ?AUTO_8923 ?AUTO_8924 ) ( not ( = ?AUTO_8924 ?AUTO_8922 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8923 ?AUTO_8924 ?AUTO_8922 )
      ( DELIVER-PKG ?AUTO_8921 ?AUTO_8922 )
      ( DELIVER-PKG-VERIFY ?AUTO_8921 ?AUTO_8922 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8927 - OBJ
      ?AUTO_8928 - LOCATION
    )
    :vars
    (
      ?AUTO_8930 - LOCATION
      ?AUTO_8929 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8930 ) ( AIRPORT ?AUTO_8928 ) ( AIRPLANE-AT ?AUTO_8929 ?AUTO_8930 ) ( not ( = ?AUTO_8930 ?AUTO_8928 ) ) ( OBJ-AT ?AUTO_8927 ?AUTO_8930 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8927 ?AUTO_8929 ?AUTO_8930 )
      ( DELIVER-PKG ?AUTO_8927 ?AUTO_8928 )
      ( DELIVER-PKG-VERIFY ?AUTO_8927 ?AUTO_8928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8931 - OBJ
      ?AUTO_8932 - LOCATION
    )
    :vars
    (
      ?AUTO_8934 - LOCATION
      ?AUTO_8935 - LOCATION
      ?AUTO_8933 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8934 ) ( AIRPORT ?AUTO_8932 ) ( not ( = ?AUTO_8934 ?AUTO_8932 ) ) ( OBJ-AT ?AUTO_8931 ?AUTO_8934 ) ( AIRPORT ?AUTO_8935 ) ( AIRPLANE-AT ?AUTO_8933 ?AUTO_8935 ) ( not ( = ?AUTO_8935 ?AUTO_8934 ) ) ( not ( = ?AUTO_8932 ?AUTO_8935 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8933 ?AUTO_8935 ?AUTO_8934 )
      ( DELIVER-PKG ?AUTO_8931 ?AUTO_8932 )
      ( DELIVER-PKG-VERIFY ?AUTO_8931 ?AUTO_8932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8938 - OBJ
      ?AUTO_8939 - LOCATION
    )
    :vars
    (
      ?AUTO_8942 - LOCATION
      ?AUTO_8940 - LOCATION
      ?AUTO_8941 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8942 ) ( AIRPORT ?AUTO_8939 ) ( not ( = ?AUTO_8942 ?AUTO_8939 ) ) ( OBJ-AT ?AUTO_8938 ?AUTO_8942 ) ( AIRPORT ?AUTO_8940 ) ( not ( = ?AUTO_8940 ?AUTO_8942 ) ) ( not ( = ?AUTO_8939 ?AUTO_8940 ) ) ( AIRPLANE-AT ?AUTO_8941 ?AUTO_8939 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8941 ?AUTO_8939 ?AUTO_8940 )
      ( DELIVER-PKG ?AUTO_8938 ?AUTO_8939 )
      ( DELIVER-PKG-VERIFY ?AUTO_8938 ?AUTO_8939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8973 - OBJ
      ?AUTO_8974 - LOCATION
    )
    :vars
    (
      ?AUTO_8975 - LOCATION
      ?AUTO_8977 - LOCATION
      ?AUTO_8976 - AIRPLANE
      ?AUTO_8978 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8975 ) ( AIRPORT ?AUTO_8974 ) ( not ( = ?AUTO_8975 ?AUTO_8974 ) ) ( AIRPORT ?AUTO_8977 ) ( not ( = ?AUTO_8977 ?AUTO_8975 ) ) ( not ( = ?AUTO_8974 ?AUTO_8977 ) ) ( AIRPLANE-AT ?AUTO_8976 ?AUTO_8974 ) ( TRUCK-AT ?AUTO_8978 ?AUTO_8975 ) ( IN-TRUCK ?AUTO_8973 ?AUTO_8978 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8973 ?AUTO_8978 ?AUTO_8975 )
      ( DELIVER-PKG ?AUTO_8973 ?AUTO_8974 )
      ( DELIVER-PKG-VERIFY ?AUTO_8973 ?AUTO_8974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9015 - OBJ
      ?AUTO_9016 - LOCATION
    )
    :vars
    (
      ?AUTO_9019 - LOCATION
      ?AUTO_9018 - AIRPLANE
      ?AUTO_9021 - LOCATION
      ?AUTO_9017 - CITY
      ?AUTO_9020 - TRUCK
      ?AUTO_9022 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9019 ) ( AIRPORT ?AUTO_9016 ) ( AIRPLANE-AT ?AUTO_9018 ?AUTO_9019 ) ( not ( = ?AUTO_9019 ?AUTO_9016 ) ) ( IN-CITY ?AUTO_9021 ?AUTO_9017 ) ( IN-CITY ?AUTO_9019 ?AUTO_9017 ) ( not ( = ?AUTO_9019 ?AUTO_9021 ) ) ( not ( = ?AUTO_9016 ?AUTO_9021 ) ) ( OBJ-AT ?AUTO_9015 ?AUTO_9021 ) ( TRUCK-AT ?AUTO_9020 ?AUTO_9022 ) ( IN-CITY ?AUTO_9022 ?AUTO_9017 ) ( not ( = ?AUTO_9021 ?AUTO_9022 ) ) ( not ( = ?AUTO_9016 ?AUTO_9022 ) ) ( not ( = ?AUTO_9019 ?AUTO_9022 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9020 ?AUTO_9022 ?AUTO_9021 ?AUTO_9017 )
      ( DELIVER-PKG ?AUTO_9015 ?AUTO_9016 )
      ( DELIVER-PKG-VERIFY ?AUTO_9015 ?AUTO_9016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9043 - OBJ
      ?AUTO_9044 - LOCATION
    )
    :vars
    (
      ?AUTO_9045 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9045 ?AUTO_9044 ) ( IN-TRUCK ?AUTO_9043 ?AUTO_9045 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9043 ?AUTO_9045 ?AUTO_9044 )
      ( DELIVER-PKG-VERIFY ?AUTO_9043 ?AUTO_9044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9050 - OBJ
      ?AUTO_9051 - LOCATION
    )
    :vars
    (
      ?AUTO_9052 - TRUCK
      ?AUTO_9053 - LOCATION
      ?AUTO_9054 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9050 ?AUTO_9052 ) ( TRUCK-AT ?AUTO_9052 ?AUTO_9053 ) ( IN-CITY ?AUTO_9053 ?AUTO_9054 ) ( IN-CITY ?AUTO_9051 ?AUTO_9054 ) ( not ( = ?AUTO_9051 ?AUTO_9053 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9052 ?AUTO_9053 ?AUTO_9051 ?AUTO_9054 )
      ( DELIVER-PKG ?AUTO_9050 ?AUTO_9051 )
      ( DELIVER-PKG-VERIFY ?AUTO_9050 ?AUTO_9051 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9083 - OBJ
      ?AUTO_9084 - LOCATION
    )
    :vars
    (
      ?AUTO_9087 - TRUCK
      ?AUTO_9086 - LOCATION
      ?AUTO_9085 - CITY
      ?AUTO_9088 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9087 ?AUTO_9086 ) ( IN-CITY ?AUTO_9086 ?AUTO_9085 ) ( IN-CITY ?AUTO_9084 ?AUTO_9085 ) ( not ( = ?AUTO_9084 ?AUTO_9086 ) ) ( IN-AIRPLANE ?AUTO_9083 ?AUTO_9088 ) ( AIRPLANE-AT ?AUTO_9088 ?AUTO_9086 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9083 ?AUTO_9088 ?AUTO_9086 )
      ( DELIVER-PKG ?AUTO_9083 ?AUTO_9084 )
      ( DELIVER-PKG-VERIFY ?AUTO_9083 ?AUTO_9084 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9089 - OBJ
      ?AUTO_9090 - LOCATION
    )
    :vars
    (
      ?AUTO_9093 - TRUCK
      ?AUTO_9091 - LOCATION
      ?AUTO_9092 - CITY
      ?AUTO_9094 - AIRPLANE
      ?AUTO_9095 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9093 ?AUTO_9091 ) ( IN-CITY ?AUTO_9091 ?AUTO_9092 ) ( IN-CITY ?AUTO_9090 ?AUTO_9092 ) ( not ( = ?AUTO_9090 ?AUTO_9091 ) ) ( IN-AIRPLANE ?AUTO_9089 ?AUTO_9094 ) ( AIRPORT ?AUTO_9095 ) ( AIRPORT ?AUTO_9091 ) ( AIRPLANE-AT ?AUTO_9094 ?AUTO_9095 ) ( not ( = ?AUTO_9095 ?AUTO_9091 ) ) ( not ( = ?AUTO_9090 ?AUTO_9095 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9094 ?AUTO_9095 ?AUTO_9091 )
      ( DELIVER-PKG ?AUTO_9089 ?AUTO_9090 )
      ( DELIVER-PKG-VERIFY ?AUTO_9089 ?AUTO_9090 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9096 - OBJ
      ?AUTO_9097 - LOCATION
    )
    :vars
    (
      ?AUTO_9101 - TRUCK
      ?AUTO_9098 - LOCATION
      ?AUTO_9100 - CITY
      ?AUTO_9102 - LOCATION
      ?AUTO_9099 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9101 ?AUTO_9098 ) ( IN-CITY ?AUTO_9098 ?AUTO_9100 ) ( IN-CITY ?AUTO_9097 ?AUTO_9100 ) ( not ( = ?AUTO_9097 ?AUTO_9098 ) ) ( AIRPORT ?AUTO_9102 ) ( AIRPORT ?AUTO_9098 ) ( AIRPLANE-AT ?AUTO_9099 ?AUTO_9102 ) ( not ( = ?AUTO_9102 ?AUTO_9098 ) ) ( not ( = ?AUTO_9097 ?AUTO_9102 ) ) ( OBJ-AT ?AUTO_9096 ?AUTO_9102 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9096 ?AUTO_9099 ?AUTO_9102 )
      ( DELIVER-PKG ?AUTO_9096 ?AUTO_9097 )
      ( DELIVER-PKG-VERIFY ?AUTO_9096 ?AUTO_9097 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9103 - OBJ
      ?AUTO_9104 - LOCATION
    )
    :vars
    (
      ?AUTO_9106 - TRUCK
      ?AUTO_9108 - LOCATION
      ?AUTO_9105 - CITY
      ?AUTO_9107 - LOCATION
      ?AUTO_9109 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9106 ?AUTO_9108 ) ( IN-CITY ?AUTO_9108 ?AUTO_9105 ) ( IN-CITY ?AUTO_9104 ?AUTO_9105 ) ( not ( = ?AUTO_9104 ?AUTO_9108 ) ) ( AIRPORT ?AUTO_9107 ) ( AIRPORT ?AUTO_9108 ) ( not ( = ?AUTO_9107 ?AUTO_9108 ) ) ( not ( = ?AUTO_9104 ?AUTO_9107 ) ) ( OBJ-AT ?AUTO_9103 ?AUTO_9107 ) ( AIRPLANE-AT ?AUTO_9109 ?AUTO_9108 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9109 ?AUTO_9108 ?AUTO_9107 )
      ( DELIVER-PKG ?AUTO_9103 ?AUTO_9104 )
      ( DELIVER-PKG-VERIFY ?AUTO_9103 ?AUTO_9104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9122 - OBJ
      ?AUTO_9123 - LOCATION
    )
    :vars
    (
      ?AUTO_9125 - TRUCK
      ?AUTO_9124 - LOCATION
      ?AUTO_9127 - CITY
      ?AUTO_9128 - LOCATION
      ?AUTO_9126 - AIRPLANE
      ?AUTO_9129 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9125 ?AUTO_9124 ) ( IN-CITY ?AUTO_9124 ?AUTO_9127 ) ( IN-CITY ?AUTO_9123 ?AUTO_9127 ) ( not ( = ?AUTO_9123 ?AUTO_9124 ) ) ( AIRPORT ?AUTO_9128 ) ( AIRPORT ?AUTO_9124 ) ( not ( = ?AUTO_9128 ?AUTO_9124 ) ) ( not ( = ?AUTO_9123 ?AUTO_9128 ) ) ( AIRPLANE-AT ?AUTO_9126 ?AUTO_9124 ) ( TRUCK-AT ?AUTO_9129 ?AUTO_9128 ) ( IN-TRUCK ?AUTO_9122 ?AUTO_9129 ) ( not ( = ?AUTO_9125 ?AUTO_9129 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9122 ?AUTO_9129 ?AUTO_9128 )
      ( DELIVER-PKG ?AUTO_9122 ?AUTO_9123 )
      ( DELIVER-PKG-VERIFY ?AUTO_9122 ?AUTO_9123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9130 - OBJ
      ?AUTO_9131 - LOCATION
    )
    :vars
    (
      ?AUTO_9132 - TRUCK
      ?AUTO_9133 - LOCATION
      ?AUTO_9136 - CITY
      ?AUTO_9137 - LOCATION
      ?AUTO_9135 - AIRPLANE
      ?AUTO_9134 - TRUCK
      ?AUTO_9138 - LOCATION
      ?AUTO_9139 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9132 ?AUTO_9133 ) ( IN-CITY ?AUTO_9133 ?AUTO_9136 ) ( IN-CITY ?AUTO_9131 ?AUTO_9136 ) ( not ( = ?AUTO_9131 ?AUTO_9133 ) ) ( AIRPORT ?AUTO_9137 ) ( AIRPORT ?AUTO_9133 ) ( not ( = ?AUTO_9137 ?AUTO_9133 ) ) ( not ( = ?AUTO_9131 ?AUTO_9137 ) ) ( AIRPLANE-AT ?AUTO_9135 ?AUTO_9133 ) ( IN-TRUCK ?AUTO_9130 ?AUTO_9134 ) ( not ( = ?AUTO_9132 ?AUTO_9134 ) ) ( TRUCK-AT ?AUTO_9134 ?AUTO_9138 ) ( IN-CITY ?AUTO_9138 ?AUTO_9139 ) ( IN-CITY ?AUTO_9137 ?AUTO_9139 ) ( not ( = ?AUTO_9137 ?AUTO_9138 ) ) ( not ( = ?AUTO_9131 ?AUTO_9138 ) ) ( not ( = ?AUTO_9133 ?AUTO_9138 ) ) ( not ( = ?AUTO_9136 ?AUTO_9139 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9134 ?AUTO_9138 ?AUTO_9137 ?AUTO_9139 )
      ( DELIVER-PKG ?AUTO_9130 ?AUTO_9131 )
      ( DELIVER-PKG-VERIFY ?AUTO_9130 ?AUTO_9131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9142 - OBJ
      ?AUTO_9143 - LOCATION
    )
    :vars
    (
      ?AUTO_9151 - LOCATION
      ?AUTO_9148 - CITY
      ?AUTO_9149 - LOCATION
      ?AUTO_9144 - AIRPLANE
      ?AUTO_9145 - TRUCK
      ?AUTO_9150 - TRUCK
      ?AUTO_9147 - LOCATION
      ?AUTO_9146 - CITY
      ?AUTO_9152 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9151 ?AUTO_9148 ) ( IN-CITY ?AUTO_9143 ?AUTO_9148 ) ( not ( = ?AUTO_9143 ?AUTO_9151 ) ) ( AIRPORT ?AUTO_9149 ) ( AIRPORT ?AUTO_9151 ) ( not ( = ?AUTO_9149 ?AUTO_9151 ) ) ( not ( = ?AUTO_9143 ?AUTO_9149 ) ) ( AIRPLANE-AT ?AUTO_9144 ?AUTO_9151 ) ( IN-TRUCK ?AUTO_9142 ?AUTO_9145 ) ( not ( = ?AUTO_9150 ?AUTO_9145 ) ) ( TRUCK-AT ?AUTO_9145 ?AUTO_9147 ) ( IN-CITY ?AUTO_9147 ?AUTO_9146 ) ( IN-CITY ?AUTO_9149 ?AUTO_9146 ) ( not ( = ?AUTO_9149 ?AUTO_9147 ) ) ( not ( = ?AUTO_9143 ?AUTO_9147 ) ) ( not ( = ?AUTO_9151 ?AUTO_9147 ) ) ( not ( = ?AUTO_9148 ?AUTO_9146 ) ) ( TRUCK-AT ?AUTO_9150 ?AUTO_9152 ) ( IN-CITY ?AUTO_9152 ?AUTO_9148 ) ( not ( = ?AUTO_9151 ?AUTO_9152 ) ) ( not ( = ?AUTO_9143 ?AUTO_9152 ) ) ( not ( = ?AUTO_9149 ?AUTO_9152 ) ) ( not ( = ?AUTO_9147 ?AUTO_9152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9150 ?AUTO_9152 ?AUTO_9151 ?AUTO_9148 )
      ( DELIVER-PKG ?AUTO_9142 ?AUTO_9143 )
      ( DELIVER-PKG-VERIFY ?AUTO_9142 ?AUTO_9143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9153 - OBJ
      ?AUTO_9154 - LOCATION
    )
    :vars
    (
      ?AUTO_9160 - LOCATION
      ?AUTO_9159 - CITY
      ?AUTO_9161 - LOCATION
      ?AUTO_9157 - TRUCK
      ?AUTO_9155 - TRUCK
      ?AUTO_9162 - LOCATION
      ?AUTO_9156 - CITY
      ?AUTO_9163 - LOCATION
      ?AUTO_9158 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9160 ?AUTO_9159 ) ( IN-CITY ?AUTO_9154 ?AUTO_9159 ) ( not ( = ?AUTO_9154 ?AUTO_9160 ) ) ( AIRPORT ?AUTO_9161 ) ( AIRPORT ?AUTO_9160 ) ( not ( = ?AUTO_9161 ?AUTO_9160 ) ) ( not ( = ?AUTO_9154 ?AUTO_9161 ) ) ( IN-TRUCK ?AUTO_9153 ?AUTO_9157 ) ( not ( = ?AUTO_9155 ?AUTO_9157 ) ) ( TRUCK-AT ?AUTO_9157 ?AUTO_9162 ) ( IN-CITY ?AUTO_9162 ?AUTO_9156 ) ( IN-CITY ?AUTO_9161 ?AUTO_9156 ) ( not ( = ?AUTO_9161 ?AUTO_9162 ) ) ( not ( = ?AUTO_9154 ?AUTO_9162 ) ) ( not ( = ?AUTO_9160 ?AUTO_9162 ) ) ( not ( = ?AUTO_9159 ?AUTO_9156 ) ) ( TRUCK-AT ?AUTO_9155 ?AUTO_9163 ) ( IN-CITY ?AUTO_9163 ?AUTO_9159 ) ( not ( = ?AUTO_9160 ?AUTO_9163 ) ) ( not ( = ?AUTO_9154 ?AUTO_9163 ) ) ( not ( = ?AUTO_9161 ?AUTO_9163 ) ) ( not ( = ?AUTO_9162 ?AUTO_9163 ) ) ( AIRPLANE-AT ?AUTO_9158 ?AUTO_9161 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9158 ?AUTO_9161 ?AUTO_9160 )
      ( DELIVER-PKG ?AUTO_9153 ?AUTO_9154 )
      ( DELIVER-PKG-VERIFY ?AUTO_9153 ?AUTO_9154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9166 - OBJ
      ?AUTO_9167 - LOCATION
    )
    :vars
    (
      ?AUTO_9175 - LOCATION
      ?AUTO_9168 - CITY
      ?AUTO_9170 - LOCATION
      ?AUTO_9173 - TRUCK
      ?AUTO_9176 - TRUCK
      ?AUTO_9174 - LOCATION
      ?AUTO_9171 - CITY
      ?AUTO_9169 - LOCATION
      ?AUTO_9177 - LOCATION
      ?AUTO_9172 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9175 ?AUTO_9168 ) ( IN-CITY ?AUTO_9167 ?AUTO_9168 ) ( not ( = ?AUTO_9167 ?AUTO_9175 ) ) ( AIRPORT ?AUTO_9170 ) ( AIRPORT ?AUTO_9175 ) ( not ( = ?AUTO_9170 ?AUTO_9175 ) ) ( not ( = ?AUTO_9167 ?AUTO_9170 ) ) ( IN-TRUCK ?AUTO_9166 ?AUTO_9173 ) ( not ( = ?AUTO_9176 ?AUTO_9173 ) ) ( TRUCK-AT ?AUTO_9173 ?AUTO_9174 ) ( IN-CITY ?AUTO_9174 ?AUTO_9171 ) ( IN-CITY ?AUTO_9170 ?AUTO_9171 ) ( not ( = ?AUTO_9170 ?AUTO_9174 ) ) ( not ( = ?AUTO_9167 ?AUTO_9174 ) ) ( not ( = ?AUTO_9175 ?AUTO_9174 ) ) ( not ( = ?AUTO_9168 ?AUTO_9171 ) ) ( TRUCK-AT ?AUTO_9176 ?AUTO_9169 ) ( IN-CITY ?AUTO_9169 ?AUTO_9168 ) ( not ( = ?AUTO_9175 ?AUTO_9169 ) ) ( not ( = ?AUTO_9167 ?AUTO_9169 ) ) ( not ( = ?AUTO_9170 ?AUTO_9169 ) ) ( not ( = ?AUTO_9174 ?AUTO_9169 ) ) ( AIRPORT ?AUTO_9177 ) ( AIRPLANE-AT ?AUTO_9172 ?AUTO_9177 ) ( not ( = ?AUTO_9177 ?AUTO_9170 ) ) ( not ( = ?AUTO_9167 ?AUTO_9177 ) ) ( not ( = ?AUTO_9175 ?AUTO_9177 ) ) ( not ( = ?AUTO_9174 ?AUTO_9177 ) ) ( not ( = ?AUTO_9169 ?AUTO_9177 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9172 ?AUTO_9177 ?AUTO_9170 )
      ( DELIVER-PKG ?AUTO_9166 ?AUTO_9167 )
      ( DELIVER-PKG-VERIFY ?AUTO_9166 ?AUTO_9167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9206 - OBJ
      ?AUTO_9207 - LOCATION
    )
    :vars
    (
      ?AUTO_9212 - LOCATION
      ?AUTO_9208 - CITY
      ?AUTO_9211 - LOCATION
      ?AUTO_9213 - TRUCK
      ?AUTO_9209 - TRUCK
      ?AUTO_9216 - LOCATION
      ?AUTO_9210 - CITY
      ?AUTO_9214 - LOCATION
      ?AUTO_9215 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9212 ?AUTO_9208 ) ( IN-CITY ?AUTO_9207 ?AUTO_9208 ) ( not ( = ?AUTO_9207 ?AUTO_9212 ) ) ( AIRPORT ?AUTO_9211 ) ( AIRPORT ?AUTO_9212 ) ( not ( = ?AUTO_9211 ?AUTO_9212 ) ) ( not ( = ?AUTO_9207 ?AUTO_9211 ) ) ( not ( = ?AUTO_9213 ?AUTO_9209 ) ) ( TRUCK-AT ?AUTO_9209 ?AUTO_9216 ) ( IN-CITY ?AUTO_9216 ?AUTO_9210 ) ( IN-CITY ?AUTO_9211 ?AUTO_9210 ) ( not ( = ?AUTO_9211 ?AUTO_9216 ) ) ( not ( = ?AUTO_9207 ?AUTO_9216 ) ) ( not ( = ?AUTO_9212 ?AUTO_9216 ) ) ( not ( = ?AUTO_9208 ?AUTO_9210 ) ) ( TRUCK-AT ?AUTO_9213 ?AUTO_9214 ) ( IN-CITY ?AUTO_9214 ?AUTO_9208 ) ( not ( = ?AUTO_9212 ?AUTO_9214 ) ) ( not ( = ?AUTO_9207 ?AUTO_9214 ) ) ( not ( = ?AUTO_9211 ?AUTO_9214 ) ) ( not ( = ?AUTO_9216 ?AUTO_9214 ) ) ( AIRPLANE-AT ?AUTO_9215 ?AUTO_9211 ) ( OBJ-AT ?AUTO_9206 ?AUTO_9216 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9206 ?AUTO_9209 ?AUTO_9216 )
      ( DELIVER-PKG ?AUTO_9206 ?AUTO_9207 )
      ( DELIVER-PKG-VERIFY ?AUTO_9206 ?AUTO_9207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9217 - OBJ
      ?AUTO_9218 - LOCATION
    )
    :vars
    (
      ?AUTO_9224 - LOCATION
      ?AUTO_9226 - CITY
      ?AUTO_9225 - LOCATION
      ?AUTO_9223 - TRUCK
      ?AUTO_9221 - TRUCK
      ?AUTO_9222 - LOCATION
      ?AUTO_9219 - CITY
      ?AUTO_9220 - LOCATION
      ?AUTO_9227 - AIRPLANE
      ?AUTO_9228 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9224 ?AUTO_9226 ) ( IN-CITY ?AUTO_9218 ?AUTO_9226 ) ( not ( = ?AUTO_9218 ?AUTO_9224 ) ) ( AIRPORT ?AUTO_9225 ) ( AIRPORT ?AUTO_9224 ) ( not ( = ?AUTO_9225 ?AUTO_9224 ) ) ( not ( = ?AUTO_9218 ?AUTO_9225 ) ) ( not ( = ?AUTO_9223 ?AUTO_9221 ) ) ( IN-CITY ?AUTO_9222 ?AUTO_9219 ) ( IN-CITY ?AUTO_9225 ?AUTO_9219 ) ( not ( = ?AUTO_9225 ?AUTO_9222 ) ) ( not ( = ?AUTO_9218 ?AUTO_9222 ) ) ( not ( = ?AUTO_9224 ?AUTO_9222 ) ) ( not ( = ?AUTO_9226 ?AUTO_9219 ) ) ( TRUCK-AT ?AUTO_9223 ?AUTO_9220 ) ( IN-CITY ?AUTO_9220 ?AUTO_9226 ) ( not ( = ?AUTO_9224 ?AUTO_9220 ) ) ( not ( = ?AUTO_9218 ?AUTO_9220 ) ) ( not ( = ?AUTO_9225 ?AUTO_9220 ) ) ( not ( = ?AUTO_9222 ?AUTO_9220 ) ) ( AIRPLANE-AT ?AUTO_9227 ?AUTO_9225 ) ( OBJ-AT ?AUTO_9217 ?AUTO_9222 ) ( TRUCK-AT ?AUTO_9221 ?AUTO_9228 ) ( IN-CITY ?AUTO_9228 ?AUTO_9219 ) ( not ( = ?AUTO_9222 ?AUTO_9228 ) ) ( not ( = ?AUTO_9218 ?AUTO_9228 ) ) ( not ( = ?AUTO_9224 ?AUTO_9228 ) ) ( not ( = ?AUTO_9225 ?AUTO_9228 ) ) ( not ( = ?AUTO_9220 ?AUTO_9228 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9221 ?AUTO_9228 ?AUTO_9222 ?AUTO_9219 )
      ( DELIVER-PKG ?AUTO_9217 ?AUTO_9218 )
      ( DELIVER-PKG-VERIFY ?AUTO_9217 ?AUTO_9218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9241 - OBJ
      ?AUTO_9242 - LOCATION
    )
    :vars
    (
      ?AUTO_9243 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9243 ?AUTO_9242 ) ( IN-TRUCK ?AUTO_9241 ?AUTO_9243 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9241 ?AUTO_9243 ?AUTO_9242 )
      ( DELIVER-PKG-VERIFY ?AUTO_9241 ?AUTO_9242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9244 - OBJ
      ?AUTO_9245 - LOCATION
    )
    :vars
    (
      ?AUTO_9246 - TRUCK
      ?AUTO_9247 - LOCATION
      ?AUTO_9248 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9244 ?AUTO_9246 ) ( TRUCK-AT ?AUTO_9246 ?AUTO_9247 ) ( IN-CITY ?AUTO_9247 ?AUTO_9248 ) ( IN-CITY ?AUTO_9245 ?AUTO_9248 ) ( not ( = ?AUTO_9245 ?AUTO_9247 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9246 ?AUTO_9247 ?AUTO_9245 ?AUTO_9248 )
      ( DELIVER-PKG ?AUTO_9244 ?AUTO_9245 )
      ( DELIVER-PKG-VERIFY ?AUTO_9244 ?AUTO_9245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9257 - OBJ
      ?AUTO_9258 - LOCATION
    )
    :vars
    (
      ?AUTO_9260 - TRUCK
      ?AUTO_9261 - LOCATION
      ?AUTO_9259 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9260 ?AUTO_9261 ) ( IN-CITY ?AUTO_9261 ?AUTO_9259 ) ( IN-CITY ?AUTO_9258 ?AUTO_9259 ) ( not ( = ?AUTO_9258 ?AUTO_9261 ) ) ( OBJ-AT ?AUTO_9257 ?AUTO_9261 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9257 ?AUTO_9260 ?AUTO_9261 )
      ( DELIVER-PKG ?AUTO_9257 ?AUTO_9258 )
      ( DELIVER-PKG-VERIFY ?AUTO_9257 ?AUTO_9258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9262 - OBJ
      ?AUTO_9263 - LOCATION
    )
    :vars
    (
      ?AUTO_9264 - TRUCK
      ?AUTO_9266 - LOCATION
      ?AUTO_9265 - CITY
      ?AUTO_9267 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9264 ?AUTO_9266 ) ( IN-CITY ?AUTO_9266 ?AUTO_9265 ) ( IN-CITY ?AUTO_9263 ?AUTO_9265 ) ( not ( = ?AUTO_9263 ?AUTO_9266 ) ) ( IN-AIRPLANE ?AUTO_9262 ?AUTO_9267 ) ( AIRPLANE-AT ?AUTO_9267 ?AUTO_9266 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9262 ?AUTO_9267 ?AUTO_9266 )
      ( DELIVER-PKG ?AUTO_9262 ?AUTO_9263 )
      ( DELIVER-PKG-VERIFY ?AUTO_9262 ?AUTO_9263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9268 - OBJ
      ?AUTO_9269 - LOCATION
    )
    :vars
    (
      ?AUTO_9270 - TRUCK
      ?AUTO_9271 - LOCATION
      ?AUTO_9272 - CITY
      ?AUTO_9273 - AIRPLANE
      ?AUTO_9274 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9270 ?AUTO_9271 ) ( IN-CITY ?AUTO_9271 ?AUTO_9272 ) ( IN-CITY ?AUTO_9269 ?AUTO_9272 ) ( not ( = ?AUTO_9269 ?AUTO_9271 ) ) ( IN-AIRPLANE ?AUTO_9268 ?AUTO_9273 ) ( AIRPORT ?AUTO_9274 ) ( AIRPORT ?AUTO_9271 ) ( AIRPLANE-AT ?AUTO_9273 ?AUTO_9274 ) ( not ( = ?AUTO_9274 ?AUTO_9271 ) ) ( not ( = ?AUTO_9269 ?AUTO_9274 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9273 ?AUTO_9274 ?AUTO_9271 )
      ( DELIVER-PKG ?AUTO_9268 ?AUTO_9269 )
      ( DELIVER-PKG-VERIFY ?AUTO_9268 ?AUTO_9269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9277 - OBJ
      ?AUTO_9278 - LOCATION
    )
    :vars
    (
      ?AUTO_9281 - TRUCK
      ?AUTO_9283 - LOCATION
      ?AUTO_9279 - CITY
      ?AUTO_9280 - LOCATION
      ?AUTO_9282 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9281 ?AUTO_9283 ) ( IN-CITY ?AUTO_9283 ?AUTO_9279 ) ( IN-CITY ?AUTO_9278 ?AUTO_9279 ) ( not ( = ?AUTO_9278 ?AUTO_9283 ) ) ( AIRPORT ?AUTO_9280 ) ( AIRPORT ?AUTO_9283 ) ( AIRPLANE-AT ?AUTO_9282 ?AUTO_9280 ) ( not ( = ?AUTO_9280 ?AUTO_9283 ) ) ( not ( = ?AUTO_9278 ?AUTO_9280 ) ) ( OBJ-AT ?AUTO_9277 ?AUTO_9280 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9277 ?AUTO_9282 ?AUTO_9280 )
      ( DELIVER-PKG ?AUTO_9277 ?AUTO_9278 )
      ( DELIVER-PKG-VERIFY ?AUTO_9277 ?AUTO_9278 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9284 - OBJ
      ?AUTO_9285 - LOCATION
    )
    :vars
    (
      ?AUTO_9287 - TRUCK
      ?AUTO_9289 - LOCATION
      ?AUTO_9288 - CITY
      ?AUTO_9286 - LOCATION
      ?AUTO_9291 - LOCATION
      ?AUTO_9290 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9287 ?AUTO_9289 ) ( IN-CITY ?AUTO_9289 ?AUTO_9288 ) ( IN-CITY ?AUTO_9285 ?AUTO_9288 ) ( not ( = ?AUTO_9285 ?AUTO_9289 ) ) ( AIRPORT ?AUTO_9286 ) ( AIRPORT ?AUTO_9289 ) ( not ( = ?AUTO_9286 ?AUTO_9289 ) ) ( not ( = ?AUTO_9285 ?AUTO_9286 ) ) ( OBJ-AT ?AUTO_9284 ?AUTO_9286 ) ( AIRPORT ?AUTO_9291 ) ( AIRPLANE-AT ?AUTO_9290 ?AUTO_9291 ) ( not ( = ?AUTO_9291 ?AUTO_9286 ) ) ( not ( = ?AUTO_9285 ?AUTO_9291 ) ) ( not ( = ?AUTO_9289 ?AUTO_9291 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9290 ?AUTO_9291 ?AUTO_9286 )
      ( DELIVER-PKG ?AUTO_9284 ?AUTO_9285 )
      ( DELIVER-PKG-VERIFY ?AUTO_9284 ?AUTO_9285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9294 - OBJ
      ?AUTO_9295 - LOCATION
    )
    :vars
    (
      ?AUTO_9298 - TRUCK
      ?AUTO_9301 - LOCATION
      ?AUTO_9299 - CITY
      ?AUTO_9297 - LOCATION
      ?AUTO_9300 - LOCATION
      ?AUTO_9296 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9298 ?AUTO_9301 ) ( IN-CITY ?AUTO_9301 ?AUTO_9299 ) ( IN-CITY ?AUTO_9295 ?AUTO_9299 ) ( not ( = ?AUTO_9295 ?AUTO_9301 ) ) ( AIRPORT ?AUTO_9297 ) ( AIRPORT ?AUTO_9301 ) ( not ( = ?AUTO_9297 ?AUTO_9301 ) ) ( not ( = ?AUTO_9295 ?AUTO_9297 ) ) ( OBJ-AT ?AUTO_9294 ?AUTO_9297 ) ( AIRPORT ?AUTO_9300 ) ( not ( = ?AUTO_9300 ?AUTO_9297 ) ) ( not ( = ?AUTO_9295 ?AUTO_9300 ) ) ( not ( = ?AUTO_9301 ?AUTO_9300 ) ) ( AIRPLANE-AT ?AUTO_9296 ?AUTO_9301 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9296 ?AUTO_9301 ?AUTO_9300 )
      ( DELIVER-PKG ?AUTO_9294 ?AUTO_9295 )
      ( DELIVER-PKG-VERIFY ?AUTO_9294 ?AUTO_9295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9306 - OBJ
      ?AUTO_9307 - LOCATION
    )
    :vars
    (
      ?AUTO_9309 - LOCATION
      ?AUTO_9310 - CITY
      ?AUTO_9308 - LOCATION
      ?AUTO_9311 - LOCATION
      ?AUTO_9312 - AIRPLANE
      ?AUTO_9313 - TRUCK
      ?AUTO_9314 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9309 ?AUTO_9310 ) ( IN-CITY ?AUTO_9307 ?AUTO_9310 ) ( not ( = ?AUTO_9307 ?AUTO_9309 ) ) ( AIRPORT ?AUTO_9308 ) ( AIRPORT ?AUTO_9309 ) ( not ( = ?AUTO_9308 ?AUTO_9309 ) ) ( not ( = ?AUTO_9307 ?AUTO_9308 ) ) ( OBJ-AT ?AUTO_9306 ?AUTO_9308 ) ( AIRPORT ?AUTO_9311 ) ( not ( = ?AUTO_9311 ?AUTO_9308 ) ) ( not ( = ?AUTO_9307 ?AUTO_9311 ) ) ( not ( = ?AUTO_9309 ?AUTO_9311 ) ) ( AIRPLANE-AT ?AUTO_9312 ?AUTO_9309 ) ( TRUCK-AT ?AUTO_9313 ?AUTO_9314 ) ( IN-CITY ?AUTO_9314 ?AUTO_9310 ) ( not ( = ?AUTO_9309 ?AUTO_9314 ) ) ( not ( = ?AUTO_9307 ?AUTO_9314 ) ) ( not ( = ?AUTO_9308 ?AUTO_9314 ) ) ( not ( = ?AUTO_9311 ?AUTO_9314 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9313 ?AUTO_9314 ?AUTO_9309 ?AUTO_9310 )
      ( DELIVER-PKG ?AUTO_9306 ?AUTO_9307 )
      ( DELIVER-PKG-VERIFY ?AUTO_9306 ?AUTO_9307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9339 - OBJ
      ?AUTO_9340 - LOCATION
    )
    :vars
    (
      ?AUTO_9345 - TRUCK
      ?AUTO_9346 - LOCATION
      ?AUTO_9343 - CITY
      ?AUTO_9342 - LOCATION
      ?AUTO_9341 - LOCATION
      ?AUTO_9344 - AIRPLANE
      ?AUTO_9347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9345 ?AUTO_9346 ) ( IN-CITY ?AUTO_9346 ?AUTO_9343 ) ( IN-CITY ?AUTO_9340 ?AUTO_9343 ) ( not ( = ?AUTO_9340 ?AUTO_9346 ) ) ( AIRPORT ?AUTO_9342 ) ( AIRPORT ?AUTO_9346 ) ( not ( = ?AUTO_9342 ?AUTO_9346 ) ) ( not ( = ?AUTO_9340 ?AUTO_9342 ) ) ( AIRPORT ?AUTO_9341 ) ( not ( = ?AUTO_9341 ?AUTO_9342 ) ) ( not ( = ?AUTO_9340 ?AUTO_9341 ) ) ( not ( = ?AUTO_9346 ?AUTO_9341 ) ) ( AIRPLANE-AT ?AUTO_9344 ?AUTO_9346 ) ( TRUCK-AT ?AUTO_9347 ?AUTO_9342 ) ( IN-TRUCK ?AUTO_9339 ?AUTO_9347 ) ( not ( = ?AUTO_9345 ?AUTO_9347 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9339 ?AUTO_9347 ?AUTO_9342 )
      ( DELIVER-PKG ?AUTO_9339 ?AUTO_9340 )
      ( DELIVER-PKG-VERIFY ?AUTO_9339 ?AUTO_9340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9382 - OBJ
      ?AUTO_9383 - LOCATION
    )
    :vars
    (
      ?AUTO_9391 - LOCATION
      ?AUTO_9388 - CITY
      ?AUTO_9386 - LOCATION
      ?AUTO_9387 - TRUCK
      ?AUTO_9392 - TRUCK
      ?AUTO_9385 - LOCATION
      ?AUTO_9389 - CITY
      ?AUTO_9384 - LOCATION
      ?AUTO_9390 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9391 ?AUTO_9388 ) ( IN-CITY ?AUTO_9383 ?AUTO_9388 ) ( not ( = ?AUTO_9383 ?AUTO_9391 ) ) ( AIRPORT ?AUTO_9386 ) ( AIRPORT ?AUTO_9391 ) ( not ( = ?AUTO_9386 ?AUTO_9391 ) ) ( not ( = ?AUTO_9383 ?AUTO_9386 ) ) ( not ( = ?AUTO_9387 ?AUTO_9392 ) ) ( TRUCK-AT ?AUTO_9392 ?AUTO_9385 ) ( IN-CITY ?AUTO_9385 ?AUTO_9389 ) ( IN-CITY ?AUTO_9386 ?AUTO_9389 ) ( not ( = ?AUTO_9386 ?AUTO_9385 ) ) ( not ( = ?AUTO_9383 ?AUTO_9385 ) ) ( not ( = ?AUTO_9391 ?AUTO_9385 ) ) ( not ( = ?AUTO_9388 ?AUTO_9389 ) ) ( TRUCK-AT ?AUTO_9387 ?AUTO_9384 ) ( IN-CITY ?AUTO_9384 ?AUTO_9388 ) ( not ( = ?AUTO_9391 ?AUTO_9384 ) ) ( not ( = ?AUTO_9383 ?AUTO_9384 ) ) ( not ( = ?AUTO_9386 ?AUTO_9384 ) ) ( not ( = ?AUTO_9385 ?AUTO_9384 ) ) ( AIRPLANE-AT ?AUTO_9390 ?AUTO_9386 ) ( OBJ-AT ?AUTO_9382 ?AUTO_9385 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9382 ?AUTO_9392 ?AUTO_9385 )
      ( DELIVER-PKG ?AUTO_9382 ?AUTO_9383 )
      ( DELIVER-PKG-VERIFY ?AUTO_9382 ?AUTO_9383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9393 - OBJ
      ?AUTO_9394 - LOCATION
    )
    :vars
    (
      ?AUTO_9399 - LOCATION
      ?AUTO_9395 - CITY
      ?AUTO_9397 - LOCATION
      ?AUTO_9398 - TRUCK
      ?AUTO_9402 - TRUCK
      ?AUTO_9396 - LOCATION
      ?AUTO_9400 - CITY
      ?AUTO_9401 - LOCATION
      ?AUTO_9403 - AIRPLANE
      ?AUTO_9404 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9399 ?AUTO_9395 ) ( IN-CITY ?AUTO_9394 ?AUTO_9395 ) ( not ( = ?AUTO_9394 ?AUTO_9399 ) ) ( AIRPORT ?AUTO_9397 ) ( AIRPORT ?AUTO_9399 ) ( not ( = ?AUTO_9397 ?AUTO_9399 ) ) ( not ( = ?AUTO_9394 ?AUTO_9397 ) ) ( not ( = ?AUTO_9398 ?AUTO_9402 ) ) ( IN-CITY ?AUTO_9396 ?AUTO_9400 ) ( IN-CITY ?AUTO_9397 ?AUTO_9400 ) ( not ( = ?AUTO_9397 ?AUTO_9396 ) ) ( not ( = ?AUTO_9394 ?AUTO_9396 ) ) ( not ( = ?AUTO_9399 ?AUTO_9396 ) ) ( not ( = ?AUTO_9395 ?AUTO_9400 ) ) ( TRUCK-AT ?AUTO_9398 ?AUTO_9401 ) ( IN-CITY ?AUTO_9401 ?AUTO_9395 ) ( not ( = ?AUTO_9399 ?AUTO_9401 ) ) ( not ( = ?AUTO_9394 ?AUTO_9401 ) ) ( not ( = ?AUTO_9397 ?AUTO_9401 ) ) ( not ( = ?AUTO_9396 ?AUTO_9401 ) ) ( AIRPLANE-AT ?AUTO_9403 ?AUTO_9397 ) ( OBJ-AT ?AUTO_9393 ?AUTO_9396 ) ( TRUCK-AT ?AUTO_9402 ?AUTO_9404 ) ( IN-CITY ?AUTO_9404 ?AUTO_9400 ) ( not ( = ?AUTO_9396 ?AUTO_9404 ) ) ( not ( = ?AUTO_9394 ?AUTO_9404 ) ) ( not ( = ?AUTO_9399 ?AUTO_9404 ) ) ( not ( = ?AUTO_9397 ?AUTO_9404 ) ) ( not ( = ?AUTO_9401 ?AUTO_9404 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9402 ?AUTO_9404 ?AUTO_9396 ?AUTO_9400 )
      ( DELIVER-PKG ?AUTO_9393 ?AUTO_9394 )
      ( DELIVER-PKG-VERIFY ?AUTO_9393 ?AUTO_9394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9425 - OBJ
      ?AUTO_9426 - LOCATION
    )
    :vars
    (
      ?AUTO_9427 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9425 ?AUTO_9427 ) ( AIRPLANE-AT ?AUTO_9427 ?AUTO_9426 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9425 ?AUTO_9427 ?AUTO_9426 )
      ( DELIVER-PKG-VERIFY ?AUTO_9425 ?AUTO_9426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9436 - OBJ
      ?AUTO_9437 - LOCATION
    )
    :vars
    (
      ?AUTO_9438 - AIRPLANE
      ?AUTO_9439 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9436 ?AUTO_9438 ) ( AIRPORT ?AUTO_9439 ) ( AIRPORT ?AUTO_9437 ) ( AIRPLANE-AT ?AUTO_9438 ?AUTO_9439 ) ( not ( = ?AUTO_9439 ?AUTO_9437 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9438 ?AUTO_9439 ?AUTO_9437 )
      ( DELIVER-PKG ?AUTO_9436 ?AUTO_9437 )
      ( DELIVER-PKG-VERIFY ?AUTO_9436 ?AUTO_9437 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9448 - OBJ
      ?AUTO_9449 - LOCATION
    )
    :vars
    (
      ?AUTO_9450 - LOCATION
      ?AUTO_9451 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9450 ) ( AIRPORT ?AUTO_9449 ) ( AIRPLANE-AT ?AUTO_9451 ?AUTO_9450 ) ( not ( = ?AUTO_9450 ?AUTO_9449 ) ) ( OBJ-AT ?AUTO_9448 ?AUTO_9450 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9448 ?AUTO_9451 ?AUTO_9450 )
      ( DELIVER-PKG ?AUTO_9448 ?AUTO_9449 )
      ( DELIVER-PKG-VERIFY ?AUTO_9448 ?AUTO_9449 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9488 - OBJ
      ?AUTO_9489 - LOCATION
    )
    :vars
    (
      ?AUTO_9492 - LOCATION
      ?AUTO_9490 - LOCATION
      ?AUTO_9491 - AIRPLANE
      ?AUTO_9493 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9492 ) ( AIRPORT ?AUTO_9489 ) ( not ( = ?AUTO_9492 ?AUTO_9489 ) ) ( AIRPORT ?AUTO_9490 ) ( AIRPLANE-AT ?AUTO_9491 ?AUTO_9490 ) ( not ( = ?AUTO_9490 ?AUTO_9492 ) ) ( not ( = ?AUTO_9489 ?AUTO_9490 ) ) ( TRUCK-AT ?AUTO_9493 ?AUTO_9492 ) ( IN-TRUCK ?AUTO_9488 ?AUTO_9493 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9488 ?AUTO_9493 ?AUTO_9492 )
      ( DELIVER-PKG ?AUTO_9488 ?AUTO_9489 )
      ( DELIVER-PKG-VERIFY ?AUTO_9488 ?AUTO_9489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9498 - OBJ
      ?AUTO_9499 - LOCATION
    )
    :vars
    (
      ?AUTO_9500 - LOCATION
      ?AUTO_9502 - LOCATION
      ?AUTO_9503 - AIRPLANE
      ?AUTO_9501 - TRUCK
      ?AUTO_9504 - LOCATION
      ?AUTO_9505 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9500 ) ( AIRPORT ?AUTO_9499 ) ( not ( = ?AUTO_9500 ?AUTO_9499 ) ) ( AIRPORT ?AUTO_9502 ) ( AIRPLANE-AT ?AUTO_9503 ?AUTO_9502 ) ( not ( = ?AUTO_9502 ?AUTO_9500 ) ) ( not ( = ?AUTO_9499 ?AUTO_9502 ) ) ( IN-TRUCK ?AUTO_9498 ?AUTO_9501 ) ( TRUCK-AT ?AUTO_9501 ?AUTO_9504 ) ( IN-CITY ?AUTO_9504 ?AUTO_9505 ) ( IN-CITY ?AUTO_9500 ?AUTO_9505 ) ( not ( = ?AUTO_9500 ?AUTO_9504 ) ) ( not ( = ?AUTO_9499 ?AUTO_9504 ) ) ( not ( = ?AUTO_9502 ?AUTO_9504 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9501 ?AUTO_9504 ?AUTO_9500 ?AUTO_9505 )
      ( DELIVER-PKG ?AUTO_9498 ?AUTO_9499 )
      ( DELIVER-PKG-VERIFY ?AUTO_9498 ?AUTO_9499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9560 - OBJ
      ?AUTO_9561 - LOCATION
    )
    :vars
    (
      ?AUTO_9562 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9560 ?AUTO_9562 ) ( AIRPLANE-AT ?AUTO_9562 ?AUTO_9561 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9560 ?AUTO_9562 ?AUTO_9561 )
      ( DELIVER-PKG-VERIFY ?AUTO_9560 ?AUTO_9561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9563 - OBJ
      ?AUTO_9564 - LOCATION
    )
    :vars
    (
      ?AUTO_9565 - AIRPLANE
      ?AUTO_9566 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9563 ?AUTO_9565 ) ( AIRPORT ?AUTO_9566 ) ( AIRPORT ?AUTO_9564 ) ( AIRPLANE-AT ?AUTO_9565 ?AUTO_9566 ) ( not ( = ?AUTO_9566 ?AUTO_9564 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9565 ?AUTO_9566 ?AUTO_9564 )
      ( DELIVER-PKG ?AUTO_9563 ?AUTO_9564 )
      ( DELIVER-PKG-VERIFY ?AUTO_9563 ?AUTO_9564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9575 - OBJ
      ?AUTO_9576 - LOCATION
    )
    :vars
    (
      ?AUTO_9577 - LOCATION
      ?AUTO_9578 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9577 ) ( AIRPORT ?AUTO_9576 ) ( AIRPLANE-AT ?AUTO_9578 ?AUTO_9577 ) ( not ( = ?AUTO_9577 ?AUTO_9576 ) ) ( OBJ-AT ?AUTO_9575 ?AUTO_9577 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9575 ?AUTO_9578 ?AUTO_9577 )
      ( DELIVER-PKG ?AUTO_9575 ?AUTO_9576 )
      ( DELIVER-PKG-VERIFY ?AUTO_9575 ?AUTO_9576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9579 - OBJ
      ?AUTO_9580 - LOCATION
    )
    :vars
    (
      ?AUTO_9581 - LOCATION
      ?AUTO_9583 - LOCATION
      ?AUTO_9582 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9581 ) ( AIRPORT ?AUTO_9580 ) ( not ( = ?AUTO_9581 ?AUTO_9580 ) ) ( OBJ-AT ?AUTO_9579 ?AUTO_9581 ) ( AIRPORT ?AUTO_9583 ) ( AIRPLANE-AT ?AUTO_9582 ?AUTO_9583 ) ( not ( = ?AUTO_9583 ?AUTO_9581 ) ) ( not ( = ?AUTO_9580 ?AUTO_9583 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9582 ?AUTO_9583 ?AUTO_9581 )
      ( DELIVER-PKG ?AUTO_9579 ?AUTO_9580 )
      ( DELIVER-PKG-VERIFY ?AUTO_9579 ?AUTO_9580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9590 - OBJ
      ?AUTO_9591 - LOCATION
    )
    :vars
    (
      ?AUTO_9592 - LOCATION
      ?AUTO_9594 - LOCATION
      ?AUTO_9593 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9592 ) ( AIRPORT ?AUTO_9591 ) ( not ( = ?AUTO_9592 ?AUTO_9591 ) ) ( OBJ-AT ?AUTO_9590 ?AUTO_9592 ) ( AIRPORT ?AUTO_9594 ) ( not ( = ?AUTO_9594 ?AUTO_9592 ) ) ( not ( = ?AUTO_9591 ?AUTO_9594 ) ) ( AIRPLANE-AT ?AUTO_9593 ?AUTO_9591 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9593 ?AUTO_9591 ?AUTO_9594 )
      ( DELIVER-PKG ?AUTO_9590 ?AUTO_9591 )
      ( DELIVER-PKG-VERIFY ?AUTO_9590 ?AUTO_9591 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9663 - OBJ
      ?AUTO_9664 - LOCATION
    )
    :vars
    (
      ?AUTO_9669 - LOCATION
      ?AUTO_9665 - AIRPLANE
      ?AUTO_9667 - TRUCK
      ?AUTO_9666 - LOCATION
      ?AUTO_9668 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9669 ) ( AIRPORT ?AUTO_9664 ) ( not ( = ?AUTO_9669 ?AUTO_9664 ) ) ( AIRPLANE-AT ?AUTO_9665 ?AUTO_9664 ) ( TRUCK-AT ?AUTO_9667 ?AUTO_9666 ) ( IN-CITY ?AUTO_9666 ?AUTO_9668 ) ( IN-CITY ?AUTO_9669 ?AUTO_9668 ) ( not ( = ?AUTO_9669 ?AUTO_9666 ) ) ( not ( = ?AUTO_9664 ?AUTO_9666 ) ) ( OBJ-AT ?AUTO_9663 ?AUTO_9666 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9663 ?AUTO_9667 ?AUTO_9666 )
      ( DELIVER-PKG ?AUTO_9663 ?AUTO_9664 )
      ( DELIVER-PKG-VERIFY ?AUTO_9663 ?AUTO_9664 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9670 - OBJ
      ?AUTO_9671 - LOCATION
    )
    :vars
    (
      ?AUTO_9675 - LOCATION
      ?AUTO_9674 - AIRPLANE
      ?AUTO_9672 - LOCATION
      ?AUTO_9673 - CITY
      ?AUTO_9676 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9675 ) ( AIRPORT ?AUTO_9671 ) ( not ( = ?AUTO_9675 ?AUTO_9671 ) ) ( AIRPLANE-AT ?AUTO_9674 ?AUTO_9671 ) ( IN-CITY ?AUTO_9672 ?AUTO_9673 ) ( IN-CITY ?AUTO_9675 ?AUTO_9673 ) ( not ( = ?AUTO_9675 ?AUTO_9672 ) ) ( not ( = ?AUTO_9671 ?AUTO_9672 ) ) ( OBJ-AT ?AUTO_9670 ?AUTO_9672 ) ( TRUCK-AT ?AUTO_9676 ?AUTO_9675 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9676 ?AUTO_9675 ?AUTO_9672 ?AUTO_9673 )
      ( DELIVER-PKG ?AUTO_9670 ?AUTO_9671 )
      ( DELIVER-PKG-VERIFY ?AUTO_9670 ?AUTO_9671 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9705 - OBJ
      ?AUTO_9706 - LOCATION
    )
    :vars
    (
      ?AUTO_9707 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9707 ?AUTO_9706 ) ( IN-TRUCK ?AUTO_9705 ?AUTO_9707 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9705 ?AUTO_9707 ?AUTO_9706 )
      ( DELIVER-PKG-VERIFY ?AUTO_9705 ?AUTO_9706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9708 - OBJ
      ?AUTO_9709 - LOCATION
    )
    :vars
    (
      ?AUTO_9710 - TRUCK
      ?AUTO_9711 - LOCATION
      ?AUTO_9712 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9708 ?AUTO_9710 ) ( TRUCK-AT ?AUTO_9710 ?AUTO_9711 ) ( IN-CITY ?AUTO_9711 ?AUTO_9712 ) ( IN-CITY ?AUTO_9709 ?AUTO_9712 ) ( not ( = ?AUTO_9709 ?AUTO_9711 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9710 ?AUTO_9711 ?AUTO_9709 ?AUTO_9712 )
      ( DELIVER-PKG ?AUTO_9708 ?AUTO_9709 )
      ( DELIVER-PKG-VERIFY ?AUTO_9708 ?AUTO_9709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9713 - OBJ
      ?AUTO_9714 - LOCATION
    )
    :vars
    (
      ?AUTO_9715 - TRUCK
      ?AUTO_9716 - LOCATION
      ?AUTO_9717 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9715 ?AUTO_9716 ) ( IN-CITY ?AUTO_9716 ?AUTO_9717 ) ( IN-CITY ?AUTO_9714 ?AUTO_9717 ) ( not ( = ?AUTO_9714 ?AUTO_9716 ) ) ( OBJ-AT ?AUTO_9713 ?AUTO_9716 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9713 ?AUTO_9715 ?AUTO_9716 )
      ( DELIVER-PKG ?AUTO_9713 ?AUTO_9714 )
      ( DELIVER-PKG-VERIFY ?AUTO_9713 ?AUTO_9714 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9718 - OBJ
      ?AUTO_9719 - LOCATION
    )
    :vars
    (
      ?AUTO_9721 - TRUCK
      ?AUTO_9720 - LOCATION
      ?AUTO_9722 - CITY
      ?AUTO_9723 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9721 ?AUTO_9720 ) ( IN-CITY ?AUTO_9720 ?AUTO_9722 ) ( IN-CITY ?AUTO_9719 ?AUTO_9722 ) ( not ( = ?AUTO_9719 ?AUTO_9720 ) ) ( IN-AIRPLANE ?AUTO_9718 ?AUTO_9723 ) ( AIRPLANE-AT ?AUTO_9723 ?AUTO_9720 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9718 ?AUTO_9723 ?AUTO_9720 )
      ( DELIVER-PKG ?AUTO_9718 ?AUTO_9719 )
      ( DELIVER-PKG-VERIFY ?AUTO_9718 ?AUTO_9719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9724 - OBJ
      ?AUTO_9725 - LOCATION
    )
    :vars
    (
      ?AUTO_9727 - TRUCK
      ?AUTO_9728 - LOCATION
      ?AUTO_9726 - CITY
      ?AUTO_9729 - AIRPLANE
      ?AUTO_9730 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9727 ?AUTO_9728 ) ( IN-CITY ?AUTO_9728 ?AUTO_9726 ) ( IN-CITY ?AUTO_9725 ?AUTO_9726 ) ( not ( = ?AUTO_9725 ?AUTO_9728 ) ) ( IN-AIRPLANE ?AUTO_9724 ?AUTO_9729 ) ( AIRPORT ?AUTO_9730 ) ( AIRPORT ?AUTO_9728 ) ( AIRPLANE-AT ?AUTO_9729 ?AUTO_9730 ) ( not ( = ?AUTO_9730 ?AUTO_9728 ) ) ( not ( = ?AUTO_9725 ?AUTO_9730 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9729 ?AUTO_9730 ?AUTO_9728 )
      ( DELIVER-PKG ?AUTO_9724 ?AUTO_9725 )
      ( DELIVER-PKG-VERIFY ?AUTO_9724 ?AUTO_9725 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9739 - OBJ
      ?AUTO_9740 - LOCATION
    )
    :vars
    (
      ?AUTO_9745 - TRUCK
      ?AUTO_9741 - LOCATION
      ?AUTO_9742 - CITY
      ?AUTO_9743 - LOCATION
      ?AUTO_9744 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9745 ?AUTO_9741 ) ( IN-CITY ?AUTO_9741 ?AUTO_9742 ) ( IN-CITY ?AUTO_9740 ?AUTO_9742 ) ( not ( = ?AUTO_9740 ?AUTO_9741 ) ) ( AIRPORT ?AUTO_9743 ) ( AIRPORT ?AUTO_9741 ) ( AIRPLANE-AT ?AUTO_9744 ?AUTO_9743 ) ( not ( = ?AUTO_9743 ?AUTO_9741 ) ) ( not ( = ?AUTO_9740 ?AUTO_9743 ) ) ( OBJ-AT ?AUTO_9739 ?AUTO_9743 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9739 ?AUTO_9744 ?AUTO_9743 )
      ( DELIVER-PKG ?AUTO_9739 ?AUTO_9740 )
      ( DELIVER-PKG-VERIFY ?AUTO_9739 ?AUTO_9740 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9746 - OBJ
      ?AUTO_9747 - LOCATION
    )
    :vars
    (
      ?AUTO_9752 - TRUCK
      ?AUTO_9748 - LOCATION
      ?AUTO_9749 - CITY
      ?AUTO_9750 - LOCATION
      ?AUTO_9753 - LOCATION
      ?AUTO_9751 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9752 ?AUTO_9748 ) ( IN-CITY ?AUTO_9748 ?AUTO_9749 ) ( IN-CITY ?AUTO_9747 ?AUTO_9749 ) ( not ( = ?AUTO_9747 ?AUTO_9748 ) ) ( AIRPORT ?AUTO_9750 ) ( AIRPORT ?AUTO_9748 ) ( not ( = ?AUTO_9750 ?AUTO_9748 ) ) ( not ( = ?AUTO_9747 ?AUTO_9750 ) ) ( OBJ-AT ?AUTO_9746 ?AUTO_9750 ) ( AIRPORT ?AUTO_9753 ) ( AIRPLANE-AT ?AUTO_9751 ?AUTO_9753 ) ( not ( = ?AUTO_9753 ?AUTO_9750 ) ) ( not ( = ?AUTO_9747 ?AUTO_9753 ) ) ( not ( = ?AUTO_9748 ?AUTO_9753 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9751 ?AUTO_9753 ?AUTO_9750 )
      ( DELIVER-PKG ?AUTO_9746 ?AUTO_9747 )
      ( DELIVER-PKG-VERIFY ?AUTO_9746 ?AUTO_9747 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9760 - OBJ
      ?AUTO_9761 - LOCATION
    )
    :vars
    (
      ?AUTO_9762 - TRUCK
      ?AUTO_9764 - LOCATION
      ?AUTO_9767 - CITY
      ?AUTO_9766 - LOCATION
      ?AUTO_9763 - LOCATION
      ?AUTO_9765 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9762 ?AUTO_9764 ) ( IN-CITY ?AUTO_9764 ?AUTO_9767 ) ( IN-CITY ?AUTO_9761 ?AUTO_9767 ) ( not ( = ?AUTO_9761 ?AUTO_9764 ) ) ( AIRPORT ?AUTO_9766 ) ( AIRPORT ?AUTO_9764 ) ( not ( = ?AUTO_9766 ?AUTO_9764 ) ) ( not ( = ?AUTO_9761 ?AUTO_9766 ) ) ( OBJ-AT ?AUTO_9760 ?AUTO_9766 ) ( AIRPORT ?AUTO_9763 ) ( not ( = ?AUTO_9763 ?AUTO_9766 ) ) ( not ( = ?AUTO_9761 ?AUTO_9763 ) ) ( not ( = ?AUTO_9764 ?AUTO_9763 ) ) ( AIRPLANE-AT ?AUTO_9765 ?AUTO_9764 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9765 ?AUTO_9764 ?AUTO_9763 )
      ( DELIVER-PKG ?AUTO_9760 ?AUTO_9761 )
      ( DELIVER-PKG-VERIFY ?AUTO_9760 ?AUTO_9761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9798 - OBJ
      ?AUTO_9799 - LOCATION
    )
    :vars
    (
      ?AUTO_9803 - LOCATION
      ?AUTO_9804 - CITY
      ?AUTO_9802 - LOCATION
      ?AUTO_9801 - LOCATION
      ?AUTO_9805 - AIRPLANE
      ?AUTO_9800 - TRUCK
      ?AUTO_9806 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9803 ?AUTO_9804 ) ( IN-CITY ?AUTO_9799 ?AUTO_9804 ) ( not ( = ?AUTO_9799 ?AUTO_9803 ) ) ( AIRPORT ?AUTO_9802 ) ( AIRPORT ?AUTO_9803 ) ( not ( = ?AUTO_9802 ?AUTO_9803 ) ) ( not ( = ?AUTO_9799 ?AUTO_9802 ) ) ( OBJ-AT ?AUTO_9798 ?AUTO_9802 ) ( AIRPORT ?AUTO_9801 ) ( AIRPLANE-AT ?AUTO_9805 ?AUTO_9801 ) ( not ( = ?AUTO_9801 ?AUTO_9802 ) ) ( not ( = ?AUTO_9799 ?AUTO_9801 ) ) ( not ( = ?AUTO_9803 ?AUTO_9801 ) ) ( TRUCK-AT ?AUTO_9800 ?AUTO_9806 ) ( IN-CITY ?AUTO_9806 ?AUTO_9804 ) ( not ( = ?AUTO_9803 ?AUTO_9806 ) ) ( not ( = ?AUTO_9799 ?AUTO_9806 ) ) ( not ( = ?AUTO_9802 ?AUTO_9806 ) ) ( not ( = ?AUTO_9801 ?AUTO_9806 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9800 ?AUTO_9806 ?AUTO_9803 ?AUTO_9804 )
      ( DELIVER-PKG ?AUTO_9798 ?AUTO_9799 )
      ( DELIVER-PKG-VERIFY ?AUTO_9798 ?AUTO_9799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9839 - OBJ
      ?AUTO_9840 - LOCATION
    )
    :vars
    (
      ?AUTO_9843 - LOCATION
      ?AUTO_9844 - CITY
      ?AUTO_9842 - LOCATION
      ?AUTO_9847 - LOCATION
      ?AUTO_9841 - AIRPLANE
      ?AUTO_9846 - TRUCK
      ?AUTO_9845 - LOCATION
      ?AUTO_9848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9843 ?AUTO_9844 ) ( IN-CITY ?AUTO_9840 ?AUTO_9844 ) ( not ( = ?AUTO_9840 ?AUTO_9843 ) ) ( AIRPORT ?AUTO_9842 ) ( AIRPORT ?AUTO_9843 ) ( not ( = ?AUTO_9842 ?AUTO_9843 ) ) ( not ( = ?AUTO_9840 ?AUTO_9842 ) ) ( AIRPORT ?AUTO_9847 ) ( not ( = ?AUTO_9847 ?AUTO_9842 ) ) ( not ( = ?AUTO_9840 ?AUTO_9847 ) ) ( not ( = ?AUTO_9843 ?AUTO_9847 ) ) ( AIRPLANE-AT ?AUTO_9841 ?AUTO_9843 ) ( TRUCK-AT ?AUTO_9846 ?AUTO_9845 ) ( IN-CITY ?AUTO_9845 ?AUTO_9844 ) ( not ( = ?AUTO_9843 ?AUTO_9845 ) ) ( not ( = ?AUTO_9840 ?AUTO_9845 ) ) ( not ( = ?AUTO_9842 ?AUTO_9845 ) ) ( not ( = ?AUTO_9847 ?AUTO_9845 ) ) ( TRUCK-AT ?AUTO_9848 ?AUTO_9842 ) ( IN-TRUCK ?AUTO_9839 ?AUTO_9848 ) ( not ( = ?AUTO_9846 ?AUTO_9848 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9839 ?AUTO_9848 ?AUTO_9842 )
      ( DELIVER-PKG ?AUTO_9839 ?AUTO_9840 )
      ( DELIVER-PKG-VERIFY ?AUTO_9839 ?AUTO_9840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9851 - OBJ
      ?AUTO_9852 - LOCATION
    )
    :vars
    (
      ?AUTO_9860 - LOCATION
      ?AUTO_9856 - CITY
      ?AUTO_9853 - LOCATION
      ?AUTO_9855 - AIRPLANE
      ?AUTO_9859 - TRUCK
      ?AUTO_9857 - TRUCK
      ?AUTO_9854 - LOCATION
      ?AUTO_9861 - CITY
      ?AUTO_9858 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9860 ?AUTO_9856 ) ( IN-CITY ?AUTO_9852 ?AUTO_9856 ) ( not ( = ?AUTO_9852 ?AUTO_9860 ) ) ( AIRPORT ?AUTO_9853 ) ( AIRPORT ?AUTO_9860 ) ( not ( = ?AUTO_9853 ?AUTO_9860 ) ) ( not ( = ?AUTO_9852 ?AUTO_9853 ) ) ( AIRPLANE-AT ?AUTO_9855 ?AUTO_9860 ) ( not ( = ?AUTO_9859 ?AUTO_9857 ) ) ( TRUCK-AT ?AUTO_9857 ?AUTO_9854 ) ( IN-CITY ?AUTO_9854 ?AUTO_9861 ) ( IN-CITY ?AUTO_9853 ?AUTO_9861 ) ( not ( = ?AUTO_9853 ?AUTO_9854 ) ) ( not ( = ?AUTO_9852 ?AUTO_9854 ) ) ( not ( = ?AUTO_9860 ?AUTO_9854 ) ) ( not ( = ?AUTO_9856 ?AUTO_9861 ) ) ( TRUCK-AT ?AUTO_9859 ?AUTO_9858 ) ( IN-CITY ?AUTO_9858 ?AUTO_9856 ) ( not ( = ?AUTO_9860 ?AUTO_9858 ) ) ( not ( = ?AUTO_9852 ?AUTO_9858 ) ) ( not ( = ?AUTO_9853 ?AUTO_9858 ) ) ( not ( = ?AUTO_9854 ?AUTO_9858 ) ) ( OBJ-AT ?AUTO_9851 ?AUTO_9854 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9851 ?AUTO_9857 ?AUTO_9854 )
      ( DELIVER-PKG ?AUTO_9851 ?AUTO_9852 )
      ( DELIVER-PKG-VERIFY ?AUTO_9851 ?AUTO_9852 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9862 - OBJ
      ?AUTO_9863 - LOCATION
    )
    :vars
    (
      ?AUTO_9868 - LOCATION
      ?AUTO_9871 - CITY
      ?AUTO_9872 - LOCATION
      ?AUTO_9867 - AIRPLANE
      ?AUTO_9866 - TRUCK
      ?AUTO_9864 - TRUCK
      ?AUTO_9870 - LOCATION
      ?AUTO_9869 - CITY
      ?AUTO_9865 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9868 ?AUTO_9871 ) ( IN-CITY ?AUTO_9863 ?AUTO_9871 ) ( not ( = ?AUTO_9863 ?AUTO_9868 ) ) ( AIRPORT ?AUTO_9872 ) ( AIRPORT ?AUTO_9868 ) ( not ( = ?AUTO_9872 ?AUTO_9868 ) ) ( not ( = ?AUTO_9863 ?AUTO_9872 ) ) ( AIRPLANE-AT ?AUTO_9867 ?AUTO_9868 ) ( not ( = ?AUTO_9866 ?AUTO_9864 ) ) ( IN-CITY ?AUTO_9870 ?AUTO_9869 ) ( IN-CITY ?AUTO_9872 ?AUTO_9869 ) ( not ( = ?AUTO_9872 ?AUTO_9870 ) ) ( not ( = ?AUTO_9863 ?AUTO_9870 ) ) ( not ( = ?AUTO_9868 ?AUTO_9870 ) ) ( not ( = ?AUTO_9871 ?AUTO_9869 ) ) ( TRUCK-AT ?AUTO_9866 ?AUTO_9865 ) ( IN-CITY ?AUTO_9865 ?AUTO_9871 ) ( not ( = ?AUTO_9868 ?AUTO_9865 ) ) ( not ( = ?AUTO_9863 ?AUTO_9865 ) ) ( not ( = ?AUTO_9872 ?AUTO_9865 ) ) ( not ( = ?AUTO_9870 ?AUTO_9865 ) ) ( OBJ-AT ?AUTO_9862 ?AUTO_9870 ) ( TRUCK-AT ?AUTO_9864 ?AUTO_9872 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9864 ?AUTO_9872 ?AUTO_9870 ?AUTO_9869 )
      ( DELIVER-PKG ?AUTO_9862 ?AUTO_9863 )
      ( DELIVER-PKG-VERIFY ?AUTO_9862 ?AUTO_9863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9875 - OBJ
      ?AUTO_9876 - LOCATION
    )
    :vars
    (
      ?AUTO_9877 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9877 ?AUTO_9876 ) ( IN-TRUCK ?AUTO_9875 ?AUTO_9877 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9875 ?AUTO_9877 ?AUTO_9876 )
      ( DELIVER-PKG-VERIFY ?AUTO_9875 ?AUTO_9876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9882 - OBJ
      ?AUTO_9883 - LOCATION
    )
    :vars
    (
      ?AUTO_9884 - TRUCK
      ?AUTO_9885 - LOCATION
      ?AUTO_9886 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9882 ?AUTO_9884 ) ( TRUCK-AT ?AUTO_9884 ?AUTO_9885 ) ( IN-CITY ?AUTO_9885 ?AUTO_9886 ) ( IN-CITY ?AUTO_9883 ?AUTO_9886 ) ( not ( = ?AUTO_9883 ?AUTO_9885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9884 ?AUTO_9885 ?AUTO_9883 ?AUTO_9886 )
      ( DELIVER-PKG ?AUTO_9882 ?AUTO_9883 )
      ( DELIVER-PKG-VERIFY ?AUTO_9882 ?AUTO_9883 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9891 - OBJ
      ?AUTO_9892 - LOCATION
    )
    :vars
    (
      ?AUTO_9895 - TRUCK
      ?AUTO_9893 - LOCATION
      ?AUTO_9894 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9895 ?AUTO_9893 ) ( IN-CITY ?AUTO_9893 ?AUTO_9894 ) ( IN-CITY ?AUTO_9892 ?AUTO_9894 ) ( not ( = ?AUTO_9892 ?AUTO_9893 ) ) ( OBJ-AT ?AUTO_9891 ?AUTO_9893 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9891 ?AUTO_9895 ?AUTO_9893 )
      ( DELIVER-PKG ?AUTO_9891 ?AUTO_9892 )
      ( DELIVER-PKG-VERIFY ?AUTO_9891 ?AUTO_9892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9898 - OBJ
      ?AUTO_9899 - LOCATION
    )
    :vars
    (
      ?AUTO_9900 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9900 ?AUTO_9899 ) ( IN-TRUCK ?AUTO_9898 ?AUTO_9900 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9898 ?AUTO_9900 ?AUTO_9899 )
      ( DELIVER-PKG-VERIFY ?AUTO_9898 ?AUTO_9899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9909 - OBJ
      ?AUTO_9910 - LOCATION
    )
    :vars
    (
      ?AUTO_9912 - TRUCK
      ?AUTO_9911 - LOCATION
      ?AUTO_9913 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9912 ?AUTO_9911 ) ( IN-CITY ?AUTO_9911 ?AUTO_9913 ) ( IN-CITY ?AUTO_9910 ?AUTO_9913 ) ( not ( = ?AUTO_9910 ?AUTO_9911 ) ) ( OBJ-AT ?AUTO_9909 ?AUTO_9911 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9909 ?AUTO_9912 ?AUTO_9911 )
      ( DELIVER-PKG ?AUTO_9909 ?AUTO_9910 )
      ( DELIVER-PKG-VERIFY ?AUTO_9909 ?AUTO_9910 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9914 - OBJ
      ?AUTO_9915 - LOCATION
    )
    :vars
    (
      ?AUTO_9917 - LOCATION
      ?AUTO_9918 - CITY
      ?AUTO_9916 - TRUCK
      ?AUTO_9919 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9917 ?AUTO_9918 ) ( IN-CITY ?AUTO_9915 ?AUTO_9918 ) ( not ( = ?AUTO_9915 ?AUTO_9917 ) ) ( OBJ-AT ?AUTO_9914 ?AUTO_9917 ) ( TRUCK-AT ?AUTO_9916 ?AUTO_9919 ) ( IN-CITY ?AUTO_9919 ?AUTO_9918 ) ( not ( = ?AUTO_9917 ?AUTO_9919 ) ) ( not ( = ?AUTO_9915 ?AUTO_9919 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9916 ?AUTO_9919 ?AUTO_9917 ?AUTO_9918 )
      ( DELIVER-PKG ?AUTO_9914 ?AUTO_9915 )
      ( DELIVER-PKG-VERIFY ?AUTO_9914 ?AUTO_9915 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9924 - OBJ
      ?AUTO_9925 - LOCATION
    )
    :vars
    (
      ?AUTO_9926 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9926 ?AUTO_9925 ) ( IN-TRUCK ?AUTO_9924 ?AUTO_9926 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9924 ?AUTO_9926 ?AUTO_9925 )
      ( DELIVER-PKG-VERIFY ?AUTO_9924 ?AUTO_9925 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9933 - OBJ
      ?AUTO_9934 - LOCATION
    )
    :vars
    (
      ?AUTO_9935 - TRUCK
      ?AUTO_9936 - LOCATION
      ?AUTO_9937 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9933 ?AUTO_9935 ) ( TRUCK-AT ?AUTO_9935 ?AUTO_9936 ) ( IN-CITY ?AUTO_9936 ?AUTO_9937 ) ( IN-CITY ?AUTO_9934 ?AUTO_9937 ) ( not ( = ?AUTO_9934 ?AUTO_9936 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9935 ?AUTO_9936 ?AUTO_9934 ?AUTO_9937 )
      ( DELIVER-PKG ?AUTO_9933 ?AUTO_9934 )
      ( DELIVER-PKG-VERIFY ?AUTO_9933 ?AUTO_9934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9938 - OBJ
      ?AUTO_9939 - LOCATION
    )
    :vars
    (
      ?AUTO_9940 - TRUCK
      ?AUTO_9941 - LOCATION
      ?AUTO_9942 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9940 ?AUTO_9941 ) ( IN-CITY ?AUTO_9941 ?AUTO_9942 ) ( IN-CITY ?AUTO_9939 ?AUTO_9942 ) ( not ( = ?AUTO_9939 ?AUTO_9941 ) ) ( OBJ-AT ?AUTO_9938 ?AUTO_9941 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9938 ?AUTO_9940 ?AUTO_9941 )
      ( DELIVER-PKG ?AUTO_9938 ?AUTO_9939 )
      ( DELIVER-PKG-VERIFY ?AUTO_9938 ?AUTO_9939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9949 - OBJ
      ?AUTO_9950 - LOCATION
    )
    :vars
    (
      ?AUTO_9953 - LOCATION
      ?AUTO_9952 - CITY
      ?AUTO_9951 - TRUCK
      ?AUTO_9954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9953 ?AUTO_9952 ) ( IN-CITY ?AUTO_9950 ?AUTO_9952 ) ( not ( = ?AUTO_9950 ?AUTO_9953 ) ) ( OBJ-AT ?AUTO_9949 ?AUTO_9953 ) ( TRUCK-AT ?AUTO_9951 ?AUTO_9954 ) ( IN-CITY ?AUTO_9954 ?AUTO_9952 ) ( not ( = ?AUTO_9953 ?AUTO_9954 ) ) ( not ( = ?AUTO_9950 ?AUTO_9954 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9951 ?AUTO_9954 ?AUTO_9953 ?AUTO_9952 )
      ( DELIVER-PKG ?AUTO_9949 ?AUTO_9950 )
      ( DELIVER-PKG-VERIFY ?AUTO_9949 ?AUTO_9950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9965 - OBJ
      ?AUTO_9966 - LOCATION
    )
    :vars
    (
      ?AUTO_9967 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9967 ?AUTO_9966 ) ( IN-TRUCK ?AUTO_9965 ?AUTO_9967 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9965 ?AUTO_9967 ?AUTO_9966 )
      ( DELIVER-PKG-VERIFY ?AUTO_9965 ?AUTO_9966 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9968 - OBJ
      ?AUTO_9969 - LOCATION
    )
    :vars
    (
      ?AUTO_9970 - TRUCK
      ?AUTO_9971 - LOCATION
      ?AUTO_9972 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9968 ?AUTO_9970 ) ( TRUCK-AT ?AUTO_9970 ?AUTO_9971 ) ( IN-CITY ?AUTO_9971 ?AUTO_9972 ) ( IN-CITY ?AUTO_9969 ?AUTO_9972 ) ( not ( = ?AUTO_9969 ?AUTO_9971 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9970 ?AUTO_9971 ?AUTO_9969 ?AUTO_9972 )
      ( DELIVER-PKG ?AUTO_9968 ?AUTO_9969 )
      ( DELIVER-PKG-VERIFY ?AUTO_9968 ?AUTO_9969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9975 - OBJ
      ?AUTO_9976 - LOCATION
    )
    :vars
    (
      ?AUTO_9977 - TRUCK
      ?AUTO_9979 - LOCATION
      ?AUTO_9978 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9977 ?AUTO_9979 ) ( IN-CITY ?AUTO_9979 ?AUTO_9978 ) ( IN-CITY ?AUTO_9976 ?AUTO_9978 ) ( not ( = ?AUTO_9976 ?AUTO_9979 ) ) ( OBJ-AT ?AUTO_9975 ?AUTO_9979 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9975 ?AUTO_9977 ?AUTO_9979 )
      ( DELIVER-PKG ?AUTO_9975 ?AUTO_9976 )
      ( DELIVER-PKG-VERIFY ?AUTO_9975 ?AUTO_9976 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9980 - OBJ
      ?AUTO_9981 - LOCATION
    )
    :vars
    (
      ?AUTO_9983 - LOCATION
      ?AUTO_9984 - CITY
      ?AUTO_9982 - TRUCK
      ?AUTO_9985 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9983 ?AUTO_9984 ) ( IN-CITY ?AUTO_9981 ?AUTO_9984 ) ( not ( = ?AUTO_9981 ?AUTO_9983 ) ) ( OBJ-AT ?AUTO_9980 ?AUTO_9983 ) ( TRUCK-AT ?AUTO_9982 ?AUTO_9985 ) ( IN-CITY ?AUTO_9985 ?AUTO_9984 ) ( not ( = ?AUTO_9983 ?AUTO_9985 ) ) ( not ( = ?AUTO_9981 ?AUTO_9985 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9982 ?AUTO_9985 ?AUTO_9983 ?AUTO_9984 )
      ( DELIVER-PKG ?AUTO_9980 ?AUTO_9981 )
      ( DELIVER-PKG-VERIFY ?AUTO_9980 ?AUTO_9981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10022 - OBJ
      ?AUTO_10023 - LOCATION
    )
    :vars
    (
      ?AUTO_10024 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10024 ?AUTO_10023 ) ( IN-TRUCK ?AUTO_10022 ?AUTO_10024 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10022 ?AUTO_10024 ?AUTO_10023 )
      ( DELIVER-PKG-VERIFY ?AUTO_10022 ?AUTO_10023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10031 - OBJ
      ?AUTO_10032 - LOCATION
    )
    :vars
    (
      ?AUTO_10034 - TRUCK
      ?AUTO_10033 - LOCATION
      ?AUTO_10035 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10034 ?AUTO_10033 ) ( IN-CITY ?AUTO_10033 ?AUTO_10035 ) ( IN-CITY ?AUTO_10032 ?AUTO_10035 ) ( not ( = ?AUTO_10032 ?AUTO_10033 ) ) ( OBJ-AT ?AUTO_10031 ?AUTO_10033 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10031 ?AUTO_10034 ?AUTO_10033 )
      ( DELIVER-PKG ?AUTO_10031 ?AUTO_10032 )
      ( DELIVER-PKG-VERIFY ?AUTO_10031 ?AUTO_10032 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10076 - OBJ
      ?AUTO_10077 - LOCATION
    )
    :vars
    (
      ?AUTO_10078 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10078 ?AUTO_10077 ) ( IN-TRUCK ?AUTO_10076 ?AUTO_10078 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10076 ?AUTO_10078 ?AUTO_10077 )
      ( DELIVER-PKG-VERIFY ?AUTO_10076 ?AUTO_10077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10079 - OBJ
      ?AUTO_10080 - LOCATION
    )
    :vars
    (
      ?AUTO_10081 - TRUCK
      ?AUTO_10082 - LOCATION
      ?AUTO_10083 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10079 ?AUTO_10081 ) ( TRUCK-AT ?AUTO_10081 ?AUTO_10082 ) ( IN-CITY ?AUTO_10082 ?AUTO_10083 ) ( IN-CITY ?AUTO_10080 ?AUTO_10083 ) ( not ( = ?AUTO_10080 ?AUTO_10082 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10081 ?AUTO_10082 ?AUTO_10080 ?AUTO_10083 )
      ( DELIVER-PKG ?AUTO_10079 ?AUTO_10080 )
      ( DELIVER-PKG-VERIFY ?AUTO_10079 ?AUTO_10080 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10084 - OBJ
      ?AUTO_10085 - LOCATION
    )
    :vars
    (
      ?AUTO_10086 - TRUCK
      ?AUTO_10087 - LOCATION
      ?AUTO_10088 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10086 ?AUTO_10087 ) ( IN-CITY ?AUTO_10087 ?AUTO_10088 ) ( IN-CITY ?AUTO_10085 ?AUTO_10088 ) ( not ( = ?AUTO_10085 ?AUTO_10087 ) ) ( OBJ-AT ?AUTO_10084 ?AUTO_10087 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10084 ?AUTO_10086 ?AUTO_10087 )
      ( DELIVER-PKG ?AUTO_10084 ?AUTO_10085 )
      ( DELIVER-PKG-VERIFY ?AUTO_10084 ?AUTO_10085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10089 - OBJ
      ?AUTO_10090 - LOCATION
    )
    :vars
    (
      ?AUTO_10091 - LOCATION
      ?AUTO_10093 - CITY
      ?AUTO_10092 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10091 ?AUTO_10093 ) ( IN-CITY ?AUTO_10090 ?AUTO_10093 ) ( not ( = ?AUTO_10090 ?AUTO_10091 ) ) ( OBJ-AT ?AUTO_10089 ?AUTO_10091 ) ( TRUCK-AT ?AUTO_10092 ?AUTO_10090 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10092 ?AUTO_10090 ?AUTO_10091 ?AUTO_10093 )
      ( DELIVER-PKG ?AUTO_10089 ?AUTO_10090 )
      ( DELIVER-PKG-VERIFY ?AUTO_10089 ?AUTO_10090 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10146 - OBJ
      ?AUTO_10147 - LOCATION
    )
    :vars
    (
      ?AUTO_10148 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10146 ?AUTO_10148 ) ( AIRPLANE-AT ?AUTO_10148 ?AUTO_10147 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10146 ?AUTO_10148 ?AUTO_10147 )
      ( DELIVER-PKG-VERIFY ?AUTO_10146 ?AUTO_10147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10153 - OBJ
      ?AUTO_10154 - LOCATION
    )
    :vars
    (
      ?AUTO_10155 - AIRPLANE
      ?AUTO_10156 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10153 ?AUTO_10155 ) ( AIRPORT ?AUTO_10156 ) ( AIRPORT ?AUTO_10154 ) ( AIRPLANE-AT ?AUTO_10155 ?AUTO_10156 ) ( not ( = ?AUTO_10156 ?AUTO_10154 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10155 ?AUTO_10156 ?AUTO_10154 )
      ( DELIVER-PKG ?AUTO_10153 ?AUTO_10154 )
      ( DELIVER-PKG-VERIFY ?AUTO_10153 ?AUTO_10154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10193 - OBJ
      ?AUTO_10194 - LOCATION
    )
    :vars
    (
      ?AUTO_10195 - LOCATION
      ?AUTO_10196 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10195 ) ( AIRPORT ?AUTO_10194 ) ( AIRPLANE-AT ?AUTO_10196 ?AUTO_10195 ) ( not ( = ?AUTO_10195 ?AUTO_10194 ) ) ( OBJ-AT ?AUTO_10193 ?AUTO_10195 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10193 ?AUTO_10196 ?AUTO_10195 )
      ( DELIVER-PKG ?AUTO_10193 ?AUTO_10194 )
      ( DELIVER-PKG-VERIFY ?AUTO_10193 ?AUTO_10194 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10205 - OBJ
      ?AUTO_10206 - LOCATION
    )
    :vars
    (
      ?AUTO_10208 - LOCATION
      ?AUTO_10209 - LOCATION
      ?AUTO_10207 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10208 ) ( AIRPORT ?AUTO_10206 ) ( not ( = ?AUTO_10208 ?AUTO_10206 ) ) ( OBJ-AT ?AUTO_10205 ?AUTO_10208 ) ( AIRPORT ?AUTO_10209 ) ( AIRPLANE-AT ?AUTO_10207 ?AUTO_10209 ) ( not ( = ?AUTO_10209 ?AUTO_10208 ) ) ( not ( = ?AUTO_10206 ?AUTO_10209 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10207 ?AUTO_10209 ?AUTO_10208 )
      ( DELIVER-PKG ?AUTO_10205 ?AUTO_10206 )
      ( DELIVER-PKG-VERIFY ?AUTO_10205 ?AUTO_10206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10222 - OBJ
      ?AUTO_10223 - LOCATION
    )
    :vars
    (
      ?AUTO_10224 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10222 ?AUTO_10224 ) ( AIRPLANE-AT ?AUTO_10224 ?AUTO_10223 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10222 ?AUTO_10224 ?AUTO_10223 )
      ( DELIVER-PKG-VERIFY ?AUTO_10222 ?AUTO_10223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10225 - OBJ
      ?AUTO_10226 - LOCATION
    )
    :vars
    (
      ?AUTO_10227 - AIRPLANE
      ?AUTO_10228 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10225 ?AUTO_10227 ) ( AIRPORT ?AUTO_10228 ) ( AIRPORT ?AUTO_10226 ) ( AIRPLANE-AT ?AUTO_10227 ?AUTO_10228 ) ( not ( = ?AUTO_10228 ?AUTO_10226 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10227 ?AUTO_10228 ?AUTO_10226 )
      ( DELIVER-PKG ?AUTO_10225 ?AUTO_10226 )
      ( DELIVER-PKG-VERIFY ?AUTO_10225 ?AUTO_10226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10269 - OBJ
      ?AUTO_10270 - LOCATION
    )
    :vars
    (
      ?AUTO_10271 - LOCATION
      ?AUTO_10272 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10271 ) ( AIRPORT ?AUTO_10270 ) ( AIRPLANE-AT ?AUTO_10272 ?AUTO_10271 ) ( not ( = ?AUTO_10271 ?AUTO_10270 ) ) ( OBJ-AT ?AUTO_10269 ?AUTO_10271 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10269 ?AUTO_10272 ?AUTO_10271 )
      ( DELIVER-PKG ?AUTO_10269 ?AUTO_10270 )
      ( DELIVER-PKG-VERIFY ?AUTO_10269 ?AUTO_10270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10273 - OBJ
      ?AUTO_10274 - LOCATION
    )
    :vars
    (
      ?AUTO_10276 - LOCATION
      ?AUTO_10277 - LOCATION
      ?AUTO_10275 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10276 ) ( AIRPORT ?AUTO_10274 ) ( not ( = ?AUTO_10276 ?AUTO_10274 ) ) ( OBJ-AT ?AUTO_10273 ?AUTO_10276 ) ( AIRPORT ?AUTO_10277 ) ( AIRPLANE-AT ?AUTO_10275 ?AUTO_10277 ) ( not ( = ?AUTO_10277 ?AUTO_10276 ) ) ( not ( = ?AUTO_10274 ?AUTO_10277 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10275 ?AUTO_10277 ?AUTO_10276 )
      ( DELIVER-PKG ?AUTO_10273 ?AUTO_10274 )
      ( DELIVER-PKG-VERIFY ?AUTO_10273 ?AUTO_10274 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10302 - OBJ
      ?AUTO_10303 - LOCATION
    )
    :vars
    (
      ?AUTO_10304 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10302 ?AUTO_10304 ) ( AIRPLANE-AT ?AUTO_10304 ?AUTO_10303 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10302 ?AUTO_10304 ?AUTO_10303 )
      ( DELIVER-PKG-VERIFY ?AUTO_10302 ?AUTO_10303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10313 - OBJ
      ?AUTO_10314 - LOCATION
    )
    :vars
    (
      ?AUTO_10315 - LOCATION
      ?AUTO_10316 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10315 ) ( AIRPORT ?AUTO_10314 ) ( AIRPLANE-AT ?AUTO_10316 ?AUTO_10315 ) ( not ( = ?AUTO_10315 ?AUTO_10314 ) ) ( OBJ-AT ?AUTO_10313 ?AUTO_10315 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10313 ?AUTO_10316 ?AUTO_10315 )
      ( DELIVER-PKG ?AUTO_10313 ?AUTO_10314 )
      ( DELIVER-PKG-VERIFY ?AUTO_10313 ?AUTO_10314 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10317 - OBJ
      ?AUTO_10318 - LOCATION
    )
    :vars
    (
      ?AUTO_10319 - LOCATION
      ?AUTO_10321 - LOCATION
      ?AUTO_10320 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10319 ) ( AIRPORT ?AUTO_10318 ) ( not ( = ?AUTO_10319 ?AUTO_10318 ) ) ( OBJ-AT ?AUTO_10317 ?AUTO_10319 ) ( AIRPORT ?AUTO_10321 ) ( AIRPLANE-AT ?AUTO_10320 ?AUTO_10321 ) ( not ( = ?AUTO_10321 ?AUTO_10319 ) ) ( not ( = ?AUTO_10318 ?AUTO_10321 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10320 ?AUTO_10321 ?AUTO_10319 )
      ( DELIVER-PKG ?AUTO_10317 ?AUTO_10318 )
      ( DELIVER-PKG-VERIFY ?AUTO_10317 ?AUTO_10318 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10366 - OBJ
      ?AUTO_10367 - LOCATION
    )
    :vars
    (
      ?AUTO_10370 - LOCATION
      ?AUTO_10368 - LOCATION
      ?AUTO_10369 - AIRPLANE
      ?AUTO_10371 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10370 ) ( AIRPORT ?AUTO_10367 ) ( not ( = ?AUTO_10370 ?AUTO_10367 ) ) ( AIRPORT ?AUTO_10368 ) ( AIRPLANE-AT ?AUTO_10369 ?AUTO_10368 ) ( not ( = ?AUTO_10368 ?AUTO_10370 ) ) ( not ( = ?AUTO_10367 ?AUTO_10368 ) ) ( TRUCK-AT ?AUTO_10371 ?AUTO_10370 ) ( IN-TRUCK ?AUTO_10366 ?AUTO_10371 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10366 ?AUTO_10371 ?AUTO_10370 )
      ( DELIVER-PKG ?AUTO_10366 ?AUTO_10367 )
      ( DELIVER-PKG-VERIFY ?AUTO_10366 ?AUTO_10367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10376 - OBJ
      ?AUTO_10377 - LOCATION
    )
    :vars
    (
      ?AUTO_10381 - LOCATION
      ?AUTO_10378 - LOCATION
      ?AUTO_10379 - AIRPLANE
      ?AUTO_10380 - TRUCK
      ?AUTO_10382 - LOCATION
      ?AUTO_10383 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10381 ) ( AIRPORT ?AUTO_10377 ) ( not ( = ?AUTO_10381 ?AUTO_10377 ) ) ( AIRPORT ?AUTO_10378 ) ( AIRPLANE-AT ?AUTO_10379 ?AUTO_10378 ) ( not ( = ?AUTO_10378 ?AUTO_10381 ) ) ( not ( = ?AUTO_10377 ?AUTO_10378 ) ) ( IN-TRUCK ?AUTO_10376 ?AUTO_10380 ) ( TRUCK-AT ?AUTO_10380 ?AUTO_10382 ) ( IN-CITY ?AUTO_10382 ?AUTO_10383 ) ( IN-CITY ?AUTO_10381 ?AUTO_10383 ) ( not ( = ?AUTO_10381 ?AUTO_10382 ) ) ( not ( = ?AUTO_10377 ?AUTO_10382 ) ) ( not ( = ?AUTO_10378 ?AUTO_10382 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10380 ?AUTO_10382 ?AUTO_10381 ?AUTO_10383 )
      ( DELIVER-PKG ?AUTO_10376 ?AUTO_10377 )
      ( DELIVER-PKG-VERIFY ?AUTO_10376 ?AUTO_10377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10388 - OBJ
      ?AUTO_10389 - LOCATION
    )
    :vars
    (
      ?AUTO_10391 - LOCATION
      ?AUTO_10390 - LOCATION
      ?AUTO_10394 - AIRPLANE
      ?AUTO_10393 - TRUCK
      ?AUTO_10395 - LOCATION
      ?AUTO_10392 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10391 ) ( AIRPORT ?AUTO_10389 ) ( not ( = ?AUTO_10391 ?AUTO_10389 ) ) ( AIRPORT ?AUTO_10390 ) ( AIRPLANE-AT ?AUTO_10394 ?AUTO_10390 ) ( not ( = ?AUTO_10390 ?AUTO_10391 ) ) ( not ( = ?AUTO_10389 ?AUTO_10390 ) ) ( TRUCK-AT ?AUTO_10393 ?AUTO_10395 ) ( IN-CITY ?AUTO_10395 ?AUTO_10392 ) ( IN-CITY ?AUTO_10391 ?AUTO_10392 ) ( not ( = ?AUTO_10391 ?AUTO_10395 ) ) ( not ( = ?AUTO_10389 ?AUTO_10395 ) ) ( not ( = ?AUTO_10390 ?AUTO_10395 ) ) ( OBJ-AT ?AUTO_10388 ?AUTO_10395 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10388 ?AUTO_10393 ?AUTO_10395 )
      ( DELIVER-PKG ?AUTO_10388 ?AUTO_10389 )
      ( DELIVER-PKG-VERIFY ?AUTO_10388 ?AUTO_10389 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10398 - OBJ
      ?AUTO_10399 - LOCATION
    )
    :vars
    (
      ?AUTO_10400 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10398 ?AUTO_10400 ) ( AIRPLANE-AT ?AUTO_10400 ?AUTO_10399 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10398 ?AUTO_10400 ?AUTO_10399 )
      ( DELIVER-PKG-VERIFY ?AUTO_10398 ?AUTO_10399 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10429 - OBJ
      ?AUTO_10430 - LOCATION
    )
    :vars
    (
      ?AUTO_10431 - LOCATION
      ?AUTO_10432 - AIRPLANE
      ?AUTO_10433 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10431 ) ( AIRPORT ?AUTO_10430 ) ( AIRPLANE-AT ?AUTO_10432 ?AUTO_10431 ) ( not ( = ?AUTO_10431 ?AUTO_10430 ) ) ( TRUCK-AT ?AUTO_10433 ?AUTO_10431 ) ( IN-TRUCK ?AUTO_10429 ?AUTO_10433 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10429 ?AUTO_10433 ?AUTO_10431 )
      ( DELIVER-PKG ?AUTO_10429 ?AUTO_10430 )
      ( DELIVER-PKG-VERIFY ?AUTO_10429 ?AUTO_10430 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10434 - OBJ
      ?AUTO_10435 - LOCATION
    )
    :vars
    (
      ?AUTO_10436 - LOCATION
      ?AUTO_10437 - AIRPLANE
      ?AUTO_10438 - TRUCK
      ?AUTO_10439 - LOCATION
      ?AUTO_10440 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10436 ) ( AIRPORT ?AUTO_10435 ) ( AIRPLANE-AT ?AUTO_10437 ?AUTO_10436 ) ( not ( = ?AUTO_10436 ?AUTO_10435 ) ) ( IN-TRUCK ?AUTO_10434 ?AUTO_10438 ) ( TRUCK-AT ?AUTO_10438 ?AUTO_10439 ) ( IN-CITY ?AUTO_10439 ?AUTO_10440 ) ( IN-CITY ?AUTO_10436 ?AUTO_10440 ) ( not ( = ?AUTO_10436 ?AUTO_10439 ) ) ( not ( = ?AUTO_10435 ?AUTO_10439 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10438 ?AUTO_10439 ?AUTO_10436 ?AUTO_10440 )
      ( DELIVER-PKG ?AUTO_10434 ?AUTO_10435 )
      ( DELIVER-PKG-VERIFY ?AUTO_10434 ?AUTO_10435 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10443 - OBJ
      ?AUTO_10444 - LOCATION
    )
    :vars
    (
      ?AUTO_10449 - LOCATION
      ?AUTO_10448 - AIRPLANE
      ?AUTO_10445 - TRUCK
      ?AUTO_10447 - LOCATION
      ?AUTO_10446 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10449 ) ( AIRPORT ?AUTO_10444 ) ( AIRPLANE-AT ?AUTO_10448 ?AUTO_10449 ) ( not ( = ?AUTO_10449 ?AUTO_10444 ) ) ( TRUCK-AT ?AUTO_10445 ?AUTO_10447 ) ( IN-CITY ?AUTO_10447 ?AUTO_10446 ) ( IN-CITY ?AUTO_10449 ?AUTO_10446 ) ( not ( = ?AUTO_10449 ?AUTO_10447 ) ) ( not ( = ?AUTO_10444 ?AUTO_10447 ) ) ( OBJ-AT ?AUTO_10443 ?AUTO_10447 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10443 ?AUTO_10445 ?AUTO_10447 )
      ( DELIVER-PKG ?AUTO_10443 ?AUTO_10444 )
      ( DELIVER-PKG-VERIFY ?AUTO_10443 ?AUTO_10444 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10450 - OBJ
      ?AUTO_10451 - LOCATION
    )
    :vars
    (
      ?AUTO_10453 - LOCATION
      ?AUTO_10452 - AIRPLANE
      ?AUTO_10455 - LOCATION
      ?AUTO_10456 - CITY
      ?AUTO_10454 - TRUCK
      ?AUTO_10457 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10453 ) ( AIRPORT ?AUTO_10451 ) ( AIRPLANE-AT ?AUTO_10452 ?AUTO_10453 ) ( not ( = ?AUTO_10453 ?AUTO_10451 ) ) ( IN-CITY ?AUTO_10455 ?AUTO_10456 ) ( IN-CITY ?AUTO_10453 ?AUTO_10456 ) ( not ( = ?AUTO_10453 ?AUTO_10455 ) ) ( not ( = ?AUTO_10451 ?AUTO_10455 ) ) ( OBJ-AT ?AUTO_10450 ?AUTO_10455 ) ( TRUCK-AT ?AUTO_10454 ?AUTO_10457 ) ( IN-CITY ?AUTO_10457 ?AUTO_10456 ) ( not ( = ?AUTO_10455 ?AUTO_10457 ) ) ( not ( = ?AUTO_10451 ?AUTO_10457 ) ) ( not ( = ?AUTO_10453 ?AUTO_10457 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10454 ?AUTO_10457 ?AUTO_10455 ?AUTO_10456 )
      ( DELIVER-PKG ?AUTO_10450 ?AUTO_10451 )
      ( DELIVER-PKG-VERIFY ?AUTO_10450 ?AUTO_10451 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10458 - OBJ
      ?AUTO_10459 - LOCATION
    )
    :vars
    (
      ?AUTO_10461 - LOCATION
      ?AUTO_10463 - LOCATION
      ?AUTO_10464 - CITY
      ?AUTO_10462 - TRUCK
      ?AUTO_10465 - LOCATION
      ?AUTO_10466 - LOCATION
      ?AUTO_10460 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10461 ) ( AIRPORT ?AUTO_10459 ) ( not ( = ?AUTO_10461 ?AUTO_10459 ) ) ( IN-CITY ?AUTO_10463 ?AUTO_10464 ) ( IN-CITY ?AUTO_10461 ?AUTO_10464 ) ( not ( = ?AUTO_10461 ?AUTO_10463 ) ) ( not ( = ?AUTO_10459 ?AUTO_10463 ) ) ( OBJ-AT ?AUTO_10458 ?AUTO_10463 ) ( TRUCK-AT ?AUTO_10462 ?AUTO_10465 ) ( IN-CITY ?AUTO_10465 ?AUTO_10464 ) ( not ( = ?AUTO_10463 ?AUTO_10465 ) ) ( not ( = ?AUTO_10459 ?AUTO_10465 ) ) ( not ( = ?AUTO_10461 ?AUTO_10465 ) ) ( AIRPORT ?AUTO_10466 ) ( AIRPLANE-AT ?AUTO_10460 ?AUTO_10466 ) ( not ( = ?AUTO_10466 ?AUTO_10461 ) ) ( not ( = ?AUTO_10459 ?AUTO_10466 ) ) ( not ( = ?AUTO_10463 ?AUTO_10466 ) ) ( not ( = ?AUTO_10465 ?AUTO_10466 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10460 ?AUTO_10466 ?AUTO_10461 )
      ( DELIVER-PKG ?AUTO_10458 ?AUTO_10459 )
      ( DELIVER-PKG-VERIFY ?AUTO_10458 ?AUTO_10459 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10501 - OBJ
      ?AUTO_10502 - LOCATION
    )
    :vars
    (
      ?AUTO_10503 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10501 ?AUTO_10503 ) ( AIRPLANE-AT ?AUTO_10503 ?AUTO_10502 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10501 ?AUTO_10503 ?AUTO_10502 )
      ( DELIVER-PKG-VERIFY ?AUTO_10501 ?AUTO_10502 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10554 - OBJ
      ?AUTO_10555 - LOCATION
    )
    :vars
    (
      ?AUTO_10556 - LOCATION
      ?AUTO_10557 - LOCATION
      ?AUTO_10558 - AIRPLANE
      ?AUTO_10559 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10556 ) ( AIRPORT ?AUTO_10555 ) ( not ( = ?AUTO_10556 ?AUTO_10555 ) ) ( AIRPORT ?AUTO_10557 ) ( AIRPLANE-AT ?AUTO_10558 ?AUTO_10557 ) ( not ( = ?AUTO_10557 ?AUTO_10556 ) ) ( not ( = ?AUTO_10555 ?AUTO_10557 ) ) ( TRUCK-AT ?AUTO_10559 ?AUTO_10556 ) ( IN-TRUCK ?AUTO_10554 ?AUTO_10559 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10554 ?AUTO_10559 ?AUTO_10556 )
      ( DELIVER-PKG ?AUTO_10554 ?AUTO_10555 )
      ( DELIVER-PKG-VERIFY ?AUTO_10554 ?AUTO_10555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10566 - OBJ
      ?AUTO_10567 - LOCATION
    )
    :vars
    (
      ?AUTO_10571 - LOCATION
      ?AUTO_10568 - LOCATION
      ?AUTO_10569 - AIRPLANE
      ?AUTO_10570 - TRUCK
      ?AUTO_10572 - LOCATION
      ?AUTO_10573 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10571 ) ( AIRPORT ?AUTO_10567 ) ( not ( = ?AUTO_10571 ?AUTO_10567 ) ) ( AIRPORT ?AUTO_10568 ) ( AIRPLANE-AT ?AUTO_10569 ?AUTO_10568 ) ( not ( = ?AUTO_10568 ?AUTO_10571 ) ) ( not ( = ?AUTO_10567 ?AUTO_10568 ) ) ( IN-TRUCK ?AUTO_10566 ?AUTO_10570 ) ( TRUCK-AT ?AUTO_10570 ?AUTO_10572 ) ( IN-CITY ?AUTO_10572 ?AUTO_10573 ) ( IN-CITY ?AUTO_10571 ?AUTO_10573 ) ( not ( = ?AUTO_10571 ?AUTO_10572 ) ) ( not ( = ?AUTO_10567 ?AUTO_10572 ) ) ( not ( = ?AUTO_10568 ?AUTO_10572 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10570 ?AUTO_10572 ?AUTO_10571 ?AUTO_10573 )
      ( DELIVER-PKG ?AUTO_10566 ?AUTO_10567 )
      ( DELIVER-PKG-VERIFY ?AUTO_10566 ?AUTO_10567 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10574 - OBJ
      ?AUTO_10575 - LOCATION
    )
    :vars
    (
      ?AUTO_10578 - LOCATION
      ?AUTO_10577 - LOCATION
      ?AUTO_10579 - AIRPLANE
      ?AUTO_10576 - TRUCK
      ?AUTO_10581 - LOCATION
      ?AUTO_10580 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10578 ) ( AIRPORT ?AUTO_10575 ) ( not ( = ?AUTO_10578 ?AUTO_10575 ) ) ( AIRPORT ?AUTO_10577 ) ( AIRPLANE-AT ?AUTO_10579 ?AUTO_10577 ) ( not ( = ?AUTO_10577 ?AUTO_10578 ) ) ( not ( = ?AUTO_10575 ?AUTO_10577 ) ) ( TRUCK-AT ?AUTO_10576 ?AUTO_10581 ) ( IN-CITY ?AUTO_10581 ?AUTO_10580 ) ( IN-CITY ?AUTO_10578 ?AUTO_10580 ) ( not ( = ?AUTO_10578 ?AUTO_10581 ) ) ( not ( = ?AUTO_10575 ?AUTO_10581 ) ) ( not ( = ?AUTO_10577 ?AUTO_10581 ) ) ( OBJ-AT ?AUTO_10574 ?AUTO_10581 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10574 ?AUTO_10576 ?AUTO_10581 )
      ( DELIVER-PKG ?AUTO_10574 ?AUTO_10575 )
      ( DELIVER-PKG-VERIFY ?AUTO_10574 ?AUTO_10575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10600 - OBJ
      ?AUTO_10601 - LOCATION
    )
    :vars
    (
      ?AUTO_10602 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10600 ?AUTO_10602 ) ( AIRPLANE-AT ?AUTO_10602 ?AUTO_10601 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10600 ?AUTO_10602 ?AUTO_10601 )
      ( DELIVER-PKG-VERIFY ?AUTO_10600 ?AUTO_10601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10603 - OBJ
      ?AUTO_10604 - LOCATION
    )
    :vars
    (
      ?AUTO_10605 - AIRPLANE
      ?AUTO_10606 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10603 ?AUTO_10605 ) ( AIRPORT ?AUTO_10606 ) ( AIRPORT ?AUTO_10604 ) ( AIRPLANE-AT ?AUTO_10605 ?AUTO_10606 ) ( not ( = ?AUTO_10606 ?AUTO_10604 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10605 ?AUTO_10606 ?AUTO_10604 )
      ( DELIVER-PKG ?AUTO_10603 ?AUTO_10604 )
      ( DELIVER-PKG-VERIFY ?AUTO_10603 ?AUTO_10604 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10623 - OBJ
      ?AUTO_10624 - LOCATION
    )
    :vars
    (
      ?AUTO_10625 - LOCATION
      ?AUTO_10626 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10625 ) ( AIRPORT ?AUTO_10624 ) ( AIRPLANE-AT ?AUTO_10626 ?AUTO_10625 ) ( not ( = ?AUTO_10625 ?AUTO_10624 ) ) ( OBJ-AT ?AUTO_10623 ?AUTO_10625 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10623 ?AUTO_10626 ?AUTO_10625 )
      ( DELIVER-PKG ?AUTO_10623 ?AUTO_10624 )
      ( DELIVER-PKG-VERIFY ?AUTO_10623 ?AUTO_10624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10629 - OBJ
      ?AUTO_10630 - LOCATION
    )
    :vars
    (
      ?AUTO_10632 - LOCATION
      ?AUTO_10631 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10632 ) ( AIRPORT ?AUTO_10630 ) ( not ( = ?AUTO_10632 ?AUTO_10630 ) ) ( OBJ-AT ?AUTO_10629 ?AUTO_10632 ) ( AIRPLANE-AT ?AUTO_10631 ?AUTO_10630 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10631 ?AUTO_10630 ?AUTO_10632 )
      ( DELIVER-PKG ?AUTO_10629 ?AUTO_10630 )
      ( DELIVER-PKG-VERIFY ?AUTO_10629 ?AUTO_10630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10693 - OBJ
      ?AUTO_10694 - LOCATION
    )
    :vars
    (
      ?AUTO_10695 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10693 ?AUTO_10695 ) ( AIRPLANE-AT ?AUTO_10695 ?AUTO_10694 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10693 ?AUTO_10695 ?AUTO_10694 )
      ( DELIVER-PKG-VERIFY ?AUTO_10693 ?AUTO_10694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10700 - OBJ
      ?AUTO_10701 - LOCATION
    )
    :vars
    (
      ?AUTO_10702 - AIRPLANE
      ?AUTO_10703 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10700 ?AUTO_10702 ) ( AIRPORT ?AUTO_10703 ) ( AIRPORT ?AUTO_10701 ) ( AIRPLANE-AT ?AUTO_10702 ?AUTO_10703 ) ( not ( = ?AUTO_10703 ?AUTO_10701 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10702 ?AUTO_10703 ?AUTO_10701 )
      ( DELIVER-PKG ?AUTO_10700 ?AUTO_10701 )
      ( DELIVER-PKG-VERIFY ?AUTO_10700 ?AUTO_10701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10740 - OBJ
      ?AUTO_10741 - LOCATION
    )
    :vars
    (
      ?AUTO_10743 - LOCATION
      ?AUTO_10742 - AIRPLANE
      ?AUTO_10744 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10743 ) ( AIRPORT ?AUTO_10741 ) ( AIRPLANE-AT ?AUTO_10742 ?AUTO_10743 ) ( not ( = ?AUTO_10743 ?AUTO_10741 ) ) ( TRUCK-AT ?AUTO_10744 ?AUTO_10743 ) ( IN-TRUCK ?AUTO_10740 ?AUTO_10744 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10740 ?AUTO_10744 ?AUTO_10743 )
      ( DELIVER-PKG ?AUTO_10740 ?AUTO_10741 )
      ( DELIVER-PKG-VERIFY ?AUTO_10740 ?AUTO_10741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10751 - OBJ
      ?AUTO_10752 - LOCATION
    )
    :vars
    (
      ?AUTO_10757 - LOCATION
      ?AUTO_10755 - AIRPLANE
      ?AUTO_10754 - TRUCK
      ?AUTO_10753 - LOCATION
      ?AUTO_10756 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10757 ) ( AIRPORT ?AUTO_10752 ) ( AIRPLANE-AT ?AUTO_10755 ?AUTO_10757 ) ( not ( = ?AUTO_10757 ?AUTO_10752 ) ) ( TRUCK-AT ?AUTO_10754 ?AUTO_10753 ) ( IN-CITY ?AUTO_10753 ?AUTO_10756 ) ( IN-CITY ?AUTO_10757 ?AUTO_10756 ) ( not ( = ?AUTO_10757 ?AUTO_10753 ) ) ( not ( = ?AUTO_10752 ?AUTO_10753 ) ) ( OBJ-AT ?AUTO_10751 ?AUTO_10753 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10751 ?AUTO_10754 ?AUTO_10753 )
      ( DELIVER-PKG ?AUTO_10751 ?AUTO_10752 )
      ( DELIVER-PKG-VERIFY ?AUTO_10751 ?AUTO_10752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10798 - OBJ
      ?AUTO_10799 - LOCATION
    )
    :vars
    (
      ?AUTO_10800 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10800 ?AUTO_10799 ) ( IN-TRUCK ?AUTO_10798 ?AUTO_10800 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10798 ?AUTO_10800 ?AUTO_10799 )
      ( DELIVER-PKG-VERIFY ?AUTO_10798 ?AUTO_10799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10815 - OBJ
      ?AUTO_10816 - LOCATION
    )
    :vars
    (
      ?AUTO_10817 - TRUCK
      ?AUTO_10818 - LOCATION
      ?AUTO_10819 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10815 ?AUTO_10817 ) ( TRUCK-AT ?AUTO_10817 ?AUTO_10818 ) ( IN-CITY ?AUTO_10818 ?AUTO_10819 ) ( IN-CITY ?AUTO_10816 ?AUTO_10819 ) ( not ( = ?AUTO_10816 ?AUTO_10818 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10817 ?AUTO_10818 ?AUTO_10816 ?AUTO_10819 )
      ( DELIVER-PKG ?AUTO_10815 ?AUTO_10816 )
      ( DELIVER-PKG-VERIFY ?AUTO_10815 ?AUTO_10816 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10820 - OBJ
      ?AUTO_10821 - LOCATION
    )
    :vars
    (
      ?AUTO_10822 - TRUCK
      ?AUTO_10823 - LOCATION
      ?AUTO_10824 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10822 ?AUTO_10823 ) ( IN-CITY ?AUTO_10823 ?AUTO_10824 ) ( IN-CITY ?AUTO_10821 ?AUTO_10824 ) ( not ( = ?AUTO_10821 ?AUTO_10823 ) ) ( OBJ-AT ?AUTO_10820 ?AUTO_10823 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10820 ?AUTO_10822 ?AUTO_10823 )
      ( DELIVER-PKG ?AUTO_10820 ?AUTO_10821 )
      ( DELIVER-PKG-VERIFY ?AUTO_10820 ?AUTO_10821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10833 - OBJ
      ?AUTO_10834 - LOCATION
    )
    :vars
    (
      ?AUTO_10837 - TRUCK
      ?AUTO_10836 - LOCATION
      ?AUTO_10835 - CITY
      ?AUTO_10838 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10837 ?AUTO_10836 ) ( IN-CITY ?AUTO_10836 ?AUTO_10835 ) ( IN-CITY ?AUTO_10834 ?AUTO_10835 ) ( not ( = ?AUTO_10834 ?AUTO_10836 ) ) ( IN-AIRPLANE ?AUTO_10833 ?AUTO_10838 ) ( AIRPLANE-AT ?AUTO_10838 ?AUTO_10836 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10833 ?AUTO_10838 ?AUTO_10836 )
      ( DELIVER-PKG ?AUTO_10833 ?AUTO_10834 )
      ( DELIVER-PKG-VERIFY ?AUTO_10833 ?AUTO_10834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10843 - OBJ
      ?AUTO_10844 - LOCATION
    )
    :vars
    (
      ?AUTO_10848 - TRUCK
      ?AUTO_10846 - LOCATION
      ?AUTO_10847 - CITY
      ?AUTO_10845 - AIRPLANE
      ?AUTO_10849 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10848 ?AUTO_10846 ) ( IN-CITY ?AUTO_10846 ?AUTO_10847 ) ( IN-CITY ?AUTO_10844 ?AUTO_10847 ) ( not ( = ?AUTO_10844 ?AUTO_10846 ) ) ( IN-AIRPLANE ?AUTO_10843 ?AUTO_10845 ) ( AIRPORT ?AUTO_10849 ) ( AIRPORT ?AUTO_10846 ) ( AIRPLANE-AT ?AUTO_10845 ?AUTO_10849 ) ( not ( = ?AUTO_10849 ?AUTO_10846 ) ) ( not ( = ?AUTO_10844 ?AUTO_10849 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10845 ?AUTO_10849 ?AUTO_10846 )
      ( DELIVER-PKG ?AUTO_10843 ?AUTO_10844 )
      ( DELIVER-PKG-VERIFY ?AUTO_10843 ?AUTO_10844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10886 - OBJ
      ?AUTO_10887 - LOCATION
    )
    :vars
    (
      ?AUTO_10888 - TRUCK
      ?AUTO_10889 - LOCATION
      ?AUTO_10892 - CITY
      ?AUTO_10891 - LOCATION
      ?AUTO_10890 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10888 ?AUTO_10889 ) ( IN-CITY ?AUTO_10889 ?AUTO_10892 ) ( IN-CITY ?AUTO_10887 ?AUTO_10892 ) ( not ( = ?AUTO_10887 ?AUTO_10889 ) ) ( AIRPORT ?AUTO_10891 ) ( AIRPORT ?AUTO_10889 ) ( AIRPLANE-AT ?AUTO_10890 ?AUTO_10891 ) ( not ( = ?AUTO_10891 ?AUTO_10889 ) ) ( not ( = ?AUTO_10887 ?AUTO_10891 ) ) ( OBJ-AT ?AUTO_10886 ?AUTO_10891 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10886 ?AUTO_10890 ?AUTO_10891 )
      ( DELIVER-PKG ?AUTO_10886 ?AUTO_10887 )
      ( DELIVER-PKG-VERIFY ?AUTO_10886 ?AUTO_10887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10901 - OBJ
      ?AUTO_10902 - LOCATION
    )
    :vars
    (
      ?AUTO_10905 - TRUCK
      ?AUTO_10906 - LOCATION
      ?AUTO_10904 - CITY
      ?AUTO_10907 - LOCATION
      ?AUTO_10908 - LOCATION
      ?AUTO_10903 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10905 ?AUTO_10906 ) ( IN-CITY ?AUTO_10906 ?AUTO_10904 ) ( IN-CITY ?AUTO_10902 ?AUTO_10904 ) ( not ( = ?AUTO_10902 ?AUTO_10906 ) ) ( AIRPORT ?AUTO_10907 ) ( AIRPORT ?AUTO_10906 ) ( not ( = ?AUTO_10907 ?AUTO_10906 ) ) ( not ( = ?AUTO_10902 ?AUTO_10907 ) ) ( OBJ-AT ?AUTO_10901 ?AUTO_10907 ) ( AIRPORT ?AUTO_10908 ) ( AIRPLANE-AT ?AUTO_10903 ?AUTO_10908 ) ( not ( = ?AUTO_10908 ?AUTO_10907 ) ) ( not ( = ?AUTO_10902 ?AUTO_10908 ) ) ( not ( = ?AUTO_10906 ?AUTO_10908 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10903 ?AUTO_10908 ?AUTO_10907 )
      ( DELIVER-PKG ?AUTO_10901 ?AUTO_10902 )
      ( DELIVER-PKG-VERIFY ?AUTO_10901 ?AUTO_10902 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10911 - OBJ
      ?AUTO_10912 - LOCATION
    )
    :vars
    (
      ?AUTO_10913 - LOCATION
      ?AUTO_10915 - CITY
      ?AUTO_10914 - LOCATION
      ?AUTO_10918 - LOCATION
      ?AUTO_10916 - AIRPLANE
      ?AUTO_10917 - TRUCK
      ?AUTO_10919 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10913 ?AUTO_10915 ) ( IN-CITY ?AUTO_10912 ?AUTO_10915 ) ( not ( = ?AUTO_10912 ?AUTO_10913 ) ) ( AIRPORT ?AUTO_10914 ) ( AIRPORT ?AUTO_10913 ) ( not ( = ?AUTO_10914 ?AUTO_10913 ) ) ( not ( = ?AUTO_10912 ?AUTO_10914 ) ) ( OBJ-AT ?AUTO_10911 ?AUTO_10914 ) ( AIRPORT ?AUTO_10918 ) ( AIRPLANE-AT ?AUTO_10916 ?AUTO_10918 ) ( not ( = ?AUTO_10918 ?AUTO_10914 ) ) ( not ( = ?AUTO_10912 ?AUTO_10918 ) ) ( not ( = ?AUTO_10913 ?AUTO_10918 ) ) ( TRUCK-AT ?AUTO_10917 ?AUTO_10919 ) ( IN-CITY ?AUTO_10919 ?AUTO_10915 ) ( not ( = ?AUTO_10913 ?AUTO_10919 ) ) ( not ( = ?AUTO_10912 ?AUTO_10919 ) ) ( not ( = ?AUTO_10914 ?AUTO_10919 ) ) ( not ( = ?AUTO_10918 ?AUTO_10919 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10917 ?AUTO_10919 ?AUTO_10913 ?AUTO_10915 )
      ( DELIVER-PKG ?AUTO_10911 ?AUTO_10912 )
      ( DELIVER-PKG-VERIFY ?AUTO_10911 ?AUTO_10912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10928 - OBJ
      ?AUTO_10929 - LOCATION
    )
    :vars
    (
      ?AUTO_10930 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10930 ?AUTO_10929 ) ( IN-TRUCK ?AUTO_10928 ?AUTO_10930 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10928 ?AUTO_10930 ?AUTO_10929 )
      ( DELIVER-PKG-VERIFY ?AUTO_10928 ?AUTO_10929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10935 - OBJ
      ?AUTO_10936 - LOCATION
    )
    :vars
    (
      ?AUTO_10937 - TRUCK
      ?AUTO_10938 - LOCATION
      ?AUTO_10939 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10935 ?AUTO_10937 ) ( TRUCK-AT ?AUTO_10937 ?AUTO_10938 ) ( IN-CITY ?AUTO_10938 ?AUTO_10939 ) ( IN-CITY ?AUTO_10936 ?AUTO_10939 ) ( not ( = ?AUTO_10936 ?AUTO_10938 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10937 ?AUTO_10938 ?AUTO_10936 ?AUTO_10939 )
      ( DELIVER-PKG ?AUTO_10935 ?AUTO_10936 )
      ( DELIVER-PKG-VERIFY ?AUTO_10935 ?AUTO_10936 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10940 - OBJ
      ?AUTO_10941 - LOCATION
    )
    :vars
    (
      ?AUTO_10942 - TRUCK
      ?AUTO_10943 - LOCATION
      ?AUTO_10944 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10942 ?AUTO_10943 ) ( IN-CITY ?AUTO_10943 ?AUTO_10944 ) ( IN-CITY ?AUTO_10941 ?AUTO_10944 ) ( not ( = ?AUTO_10941 ?AUTO_10943 ) ) ( OBJ-AT ?AUTO_10940 ?AUTO_10943 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10940 ?AUTO_10942 ?AUTO_10943 )
      ( DELIVER-PKG ?AUTO_10940 ?AUTO_10941 )
      ( DELIVER-PKG-VERIFY ?AUTO_10940 ?AUTO_10941 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10947 - OBJ
      ?AUTO_10948 - LOCATION
    )
    :vars
    (
      ?AUTO_10949 - TRUCK
      ?AUTO_10951 - LOCATION
      ?AUTO_10950 - CITY
      ?AUTO_10952 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10949 ?AUTO_10951 ) ( IN-CITY ?AUTO_10951 ?AUTO_10950 ) ( IN-CITY ?AUTO_10948 ?AUTO_10950 ) ( not ( = ?AUTO_10948 ?AUTO_10951 ) ) ( IN-AIRPLANE ?AUTO_10947 ?AUTO_10952 ) ( AIRPLANE-AT ?AUTO_10952 ?AUTO_10951 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10947 ?AUTO_10952 ?AUTO_10951 )
      ( DELIVER-PKG ?AUTO_10947 ?AUTO_10948 )
      ( DELIVER-PKG-VERIFY ?AUTO_10947 ?AUTO_10948 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10953 - OBJ
      ?AUTO_10954 - LOCATION
    )
    :vars
    (
      ?AUTO_10956 - TRUCK
      ?AUTO_10957 - LOCATION
      ?AUTO_10955 - CITY
      ?AUTO_10958 - AIRPLANE
      ?AUTO_10959 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10956 ?AUTO_10957 ) ( IN-CITY ?AUTO_10957 ?AUTO_10955 ) ( IN-CITY ?AUTO_10954 ?AUTO_10955 ) ( not ( = ?AUTO_10954 ?AUTO_10957 ) ) ( IN-AIRPLANE ?AUTO_10953 ?AUTO_10958 ) ( AIRPORT ?AUTO_10959 ) ( AIRPORT ?AUTO_10957 ) ( AIRPLANE-AT ?AUTO_10958 ?AUTO_10959 ) ( not ( = ?AUTO_10959 ?AUTO_10957 ) ) ( not ( = ?AUTO_10954 ?AUTO_10959 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10958 ?AUTO_10959 ?AUTO_10957 )
      ( DELIVER-PKG ?AUTO_10953 ?AUTO_10954 )
      ( DELIVER-PKG-VERIFY ?AUTO_10953 ?AUTO_10954 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10976 - OBJ
      ?AUTO_10977 - LOCATION
    )
    :vars
    (
      ?AUTO_10981 - TRUCK
      ?AUTO_10979 - LOCATION
      ?AUTO_10982 - CITY
      ?AUTO_10978 - LOCATION
      ?AUTO_10980 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10981 ?AUTO_10979 ) ( IN-CITY ?AUTO_10979 ?AUTO_10982 ) ( IN-CITY ?AUTO_10977 ?AUTO_10982 ) ( not ( = ?AUTO_10977 ?AUTO_10979 ) ) ( AIRPORT ?AUTO_10978 ) ( AIRPORT ?AUTO_10979 ) ( AIRPLANE-AT ?AUTO_10980 ?AUTO_10978 ) ( not ( = ?AUTO_10978 ?AUTO_10979 ) ) ( not ( = ?AUTO_10977 ?AUTO_10978 ) ) ( OBJ-AT ?AUTO_10976 ?AUTO_10978 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10976 ?AUTO_10980 ?AUTO_10978 )
      ( DELIVER-PKG ?AUTO_10976 ?AUTO_10977 )
      ( DELIVER-PKG-VERIFY ?AUTO_10976 ?AUTO_10977 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10985 - OBJ
      ?AUTO_10986 - LOCATION
    )
    :vars
    (
      ?AUTO_10988 - TRUCK
      ?AUTO_10990 - LOCATION
      ?AUTO_10987 - CITY
      ?AUTO_10991 - LOCATION
      ?AUTO_10989 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10988 ?AUTO_10990 ) ( IN-CITY ?AUTO_10990 ?AUTO_10987 ) ( IN-CITY ?AUTO_10986 ?AUTO_10987 ) ( not ( = ?AUTO_10986 ?AUTO_10990 ) ) ( AIRPORT ?AUTO_10991 ) ( AIRPORT ?AUTO_10990 ) ( not ( = ?AUTO_10991 ?AUTO_10990 ) ) ( not ( = ?AUTO_10986 ?AUTO_10991 ) ) ( OBJ-AT ?AUTO_10985 ?AUTO_10991 ) ( AIRPLANE-AT ?AUTO_10989 ?AUTO_10990 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10989 ?AUTO_10990 ?AUTO_10991 )
      ( DELIVER-PKG ?AUTO_10985 ?AUTO_10986 )
      ( DELIVER-PKG-VERIFY ?AUTO_10985 ?AUTO_10986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11008 - OBJ
      ?AUTO_11009 - LOCATION
    )
    :vars
    (
      ?AUTO_11012 - LOCATION
      ?AUTO_11010 - CITY
      ?AUTO_11011 - LOCATION
      ?AUTO_11014 - AIRPLANE
      ?AUTO_11013 - TRUCK
      ?AUTO_11015 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11012 ?AUTO_11010 ) ( IN-CITY ?AUTO_11009 ?AUTO_11010 ) ( not ( = ?AUTO_11009 ?AUTO_11012 ) ) ( AIRPORT ?AUTO_11011 ) ( AIRPORT ?AUTO_11012 ) ( not ( = ?AUTO_11011 ?AUTO_11012 ) ) ( not ( = ?AUTO_11009 ?AUTO_11011 ) ) ( OBJ-AT ?AUTO_11008 ?AUTO_11011 ) ( AIRPLANE-AT ?AUTO_11014 ?AUTO_11012 ) ( TRUCK-AT ?AUTO_11013 ?AUTO_11015 ) ( IN-CITY ?AUTO_11015 ?AUTO_11010 ) ( not ( = ?AUTO_11012 ?AUTO_11015 ) ) ( not ( = ?AUTO_11009 ?AUTO_11015 ) ) ( not ( = ?AUTO_11011 ?AUTO_11015 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11013 ?AUTO_11015 ?AUTO_11012 ?AUTO_11010 )
      ( DELIVER-PKG ?AUTO_11008 ?AUTO_11009 )
      ( DELIVER-PKG-VERIFY ?AUTO_11008 ?AUTO_11009 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11020 - OBJ
      ?AUTO_11021 - LOCATION
    )
    :vars
    (
      ?AUTO_11023 - LOCATION
      ?AUTO_11026 - CITY
      ?AUTO_11027 - LOCATION
      ?AUTO_11024 - AIRPLANE
      ?AUTO_11025 - LOCATION
      ?AUTO_11022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11023 ?AUTO_11026 ) ( IN-CITY ?AUTO_11021 ?AUTO_11026 ) ( not ( = ?AUTO_11021 ?AUTO_11023 ) ) ( AIRPORT ?AUTO_11027 ) ( AIRPORT ?AUTO_11023 ) ( not ( = ?AUTO_11027 ?AUTO_11023 ) ) ( not ( = ?AUTO_11021 ?AUTO_11027 ) ) ( OBJ-AT ?AUTO_11020 ?AUTO_11027 ) ( AIRPLANE-AT ?AUTO_11024 ?AUTO_11023 ) ( IN-CITY ?AUTO_11025 ?AUTO_11026 ) ( not ( = ?AUTO_11023 ?AUTO_11025 ) ) ( not ( = ?AUTO_11021 ?AUTO_11025 ) ) ( not ( = ?AUTO_11027 ?AUTO_11025 ) ) ( TRUCK-AT ?AUTO_11022 ?AUTO_11021 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11022 ?AUTO_11021 ?AUTO_11025 ?AUTO_11026 )
      ( DELIVER-PKG ?AUTO_11020 ?AUTO_11021 )
      ( DELIVER-PKG-VERIFY ?AUTO_11020 ?AUTO_11021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11028 - OBJ
      ?AUTO_11029 - LOCATION
    )
    :vars
    (
      ?AUTO_11032 - LOCATION
      ?AUTO_11031 - CITY
      ?AUTO_11033 - LOCATION
      ?AUTO_11035 - LOCATION
      ?AUTO_11030 - TRUCK
      ?AUTO_11036 - LOCATION
      ?AUTO_11034 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11032 ?AUTO_11031 ) ( IN-CITY ?AUTO_11029 ?AUTO_11031 ) ( not ( = ?AUTO_11029 ?AUTO_11032 ) ) ( AIRPORT ?AUTO_11033 ) ( AIRPORT ?AUTO_11032 ) ( not ( = ?AUTO_11033 ?AUTO_11032 ) ) ( not ( = ?AUTO_11029 ?AUTO_11033 ) ) ( OBJ-AT ?AUTO_11028 ?AUTO_11033 ) ( IN-CITY ?AUTO_11035 ?AUTO_11031 ) ( not ( = ?AUTO_11032 ?AUTO_11035 ) ) ( not ( = ?AUTO_11029 ?AUTO_11035 ) ) ( not ( = ?AUTO_11033 ?AUTO_11035 ) ) ( TRUCK-AT ?AUTO_11030 ?AUTO_11029 ) ( AIRPORT ?AUTO_11036 ) ( AIRPLANE-AT ?AUTO_11034 ?AUTO_11036 ) ( not ( = ?AUTO_11036 ?AUTO_11032 ) ) ( not ( = ?AUTO_11029 ?AUTO_11036 ) ) ( not ( = ?AUTO_11033 ?AUTO_11036 ) ) ( not ( = ?AUTO_11035 ?AUTO_11036 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11034 ?AUTO_11036 ?AUTO_11032 )
      ( DELIVER-PKG ?AUTO_11028 ?AUTO_11029 )
      ( DELIVER-PKG-VERIFY ?AUTO_11028 ?AUTO_11029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11053 - OBJ
      ?AUTO_11054 - LOCATION
    )
    :vars
    (
      ?AUTO_11060 - LOCATION
      ?AUTO_11059 - CITY
      ?AUTO_11056 - LOCATION
      ?AUTO_11055 - LOCATION
      ?AUTO_11061 - TRUCK
      ?AUTO_11057 - LOCATION
      ?AUTO_11058 - AIRPLANE
      ?AUTO_11062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11060 ?AUTO_11059 ) ( IN-CITY ?AUTO_11054 ?AUTO_11059 ) ( not ( = ?AUTO_11054 ?AUTO_11060 ) ) ( AIRPORT ?AUTO_11056 ) ( AIRPORT ?AUTO_11060 ) ( not ( = ?AUTO_11056 ?AUTO_11060 ) ) ( not ( = ?AUTO_11054 ?AUTO_11056 ) ) ( IN-CITY ?AUTO_11055 ?AUTO_11059 ) ( not ( = ?AUTO_11060 ?AUTO_11055 ) ) ( not ( = ?AUTO_11054 ?AUTO_11055 ) ) ( not ( = ?AUTO_11056 ?AUTO_11055 ) ) ( TRUCK-AT ?AUTO_11061 ?AUTO_11054 ) ( AIRPORT ?AUTO_11057 ) ( AIRPLANE-AT ?AUTO_11058 ?AUTO_11057 ) ( not ( = ?AUTO_11057 ?AUTO_11060 ) ) ( not ( = ?AUTO_11054 ?AUTO_11057 ) ) ( not ( = ?AUTO_11056 ?AUTO_11057 ) ) ( not ( = ?AUTO_11055 ?AUTO_11057 ) ) ( TRUCK-AT ?AUTO_11062 ?AUTO_11056 ) ( IN-TRUCK ?AUTO_11053 ?AUTO_11062 ) ( not ( = ?AUTO_11061 ?AUTO_11062 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11053 ?AUTO_11062 ?AUTO_11056 )
      ( DELIVER-PKG ?AUTO_11053 ?AUTO_11054 )
      ( DELIVER-PKG-VERIFY ?AUTO_11053 ?AUTO_11054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11069 - OBJ
      ?AUTO_11070 - LOCATION
    )
    :vars
    (
      ?AUTO_11077 - LOCATION
      ?AUTO_11073 - CITY
      ?AUTO_11075 - LOCATION
      ?AUTO_11071 - LOCATION
      ?AUTO_11072 - TRUCK
      ?AUTO_11078 - LOCATION
      ?AUTO_11076 - AIRPLANE
      ?AUTO_11074 - TRUCK
      ?AUTO_11079 - LOCATION
      ?AUTO_11080 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11077 ?AUTO_11073 ) ( IN-CITY ?AUTO_11070 ?AUTO_11073 ) ( not ( = ?AUTO_11070 ?AUTO_11077 ) ) ( AIRPORT ?AUTO_11075 ) ( AIRPORT ?AUTO_11077 ) ( not ( = ?AUTO_11075 ?AUTO_11077 ) ) ( not ( = ?AUTO_11070 ?AUTO_11075 ) ) ( IN-CITY ?AUTO_11071 ?AUTO_11073 ) ( not ( = ?AUTO_11077 ?AUTO_11071 ) ) ( not ( = ?AUTO_11070 ?AUTO_11071 ) ) ( not ( = ?AUTO_11075 ?AUTO_11071 ) ) ( TRUCK-AT ?AUTO_11072 ?AUTO_11070 ) ( AIRPORT ?AUTO_11078 ) ( AIRPLANE-AT ?AUTO_11076 ?AUTO_11078 ) ( not ( = ?AUTO_11078 ?AUTO_11077 ) ) ( not ( = ?AUTO_11070 ?AUTO_11078 ) ) ( not ( = ?AUTO_11075 ?AUTO_11078 ) ) ( not ( = ?AUTO_11071 ?AUTO_11078 ) ) ( IN-TRUCK ?AUTO_11069 ?AUTO_11074 ) ( not ( = ?AUTO_11072 ?AUTO_11074 ) ) ( TRUCK-AT ?AUTO_11074 ?AUTO_11079 ) ( IN-CITY ?AUTO_11079 ?AUTO_11080 ) ( IN-CITY ?AUTO_11075 ?AUTO_11080 ) ( not ( = ?AUTO_11075 ?AUTO_11079 ) ) ( not ( = ?AUTO_11070 ?AUTO_11079 ) ) ( not ( = ?AUTO_11077 ?AUTO_11079 ) ) ( not ( = ?AUTO_11073 ?AUTO_11080 ) ) ( not ( = ?AUTO_11071 ?AUTO_11079 ) ) ( not ( = ?AUTO_11078 ?AUTO_11079 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11074 ?AUTO_11079 ?AUTO_11075 ?AUTO_11080 )
      ( DELIVER-PKG ?AUTO_11069 ?AUTO_11070 )
      ( DELIVER-PKG-VERIFY ?AUTO_11069 ?AUTO_11070 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11081 - OBJ
      ?AUTO_11082 - LOCATION
    )
    :vars
    (
      ?AUTO_11092 - LOCATION
      ?AUTO_11090 - CITY
      ?AUTO_11083 - LOCATION
      ?AUTO_11084 - LOCATION
      ?AUTO_11091 - TRUCK
      ?AUTO_11089 - LOCATION
      ?AUTO_11088 - AIRPLANE
      ?AUTO_11085 - TRUCK
      ?AUTO_11086 - LOCATION
      ?AUTO_11087 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11092 ?AUTO_11090 ) ( IN-CITY ?AUTO_11082 ?AUTO_11090 ) ( not ( = ?AUTO_11082 ?AUTO_11092 ) ) ( AIRPORT ?AUTO_11083 ) ( AIRPORT ?AUTO_11092 ) ( not ( = ?AUTO_11083 ?AUTO_11092 ) ) ( not ( = ?AUTO_11082 ?AUTO_11083 ) ) ( IN-CITY ?AUTO_11084 ?AUTO_11090 ) ( not ( = ?AUTO_11092 ?AUTO_11084 ) ) ( not ( = ?AUTO_11082 ?AUTO_11084 ) ) ( not ( = ?AUTO_11083 ?AUTO_11084 ) ) ( TRUCK-AT ?AUTO_11091 ?AUTO_11082 ) ( AIRPORT ?AUTO_11089 ) ( AIRPLANE-AT ?AUTO_11088 ?AUTO_11089 ) ( not ( = ?AUTO_11089 ?AUTO_11092 ) ) ( not ( = ?AUTO_11082 ?AUTO_11089 ) ) ( not ( = ?AUTO_11083 ?AUTO_11089 ) ) ( not ( = ?AUTO_11084 ?AUTO_11089 ) ) ( not ( = ?AUTO_11091 ?AUTO_11085 ) ) ( TRUCK-AT ?AUTO_11085 ?AUTO_11086 ) ( IN-CITY ?AUTO_11086 ?AUTO_11087 ) ( IN-CITY ?AUTO_11083 ?AUTO_11087 ) ( not ( = ?AUTO_11083 ?AUTO_11086 ) ) ( not ( = ?AUTO_11082 ?AUTO_11086 ) ) ( not ( = ?AUTO_11092 ?AUTO_11086 ) ) ( not ( = ?AUTO_11090 ?AUTO_11087 ) ) ( not ( = ?AUTO_11084 ?AUTO_11086 ) ) ( not ( = ?AUTO_11089 ?AUTO_11086 ) ) ( OBJ-AT ?AUTO_11081 ?AUTO_11086 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11081 ?AUTO_11085 ?AUTO_11086 )
      ( DELIVER-PKG ?AUTO_11081 ?AUTO_11082 )
      ( DELIVER-PKG-VERIFY ?AUTO_11081 ?AUTO_11082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11093 - OBJ
      ?AUTO_11094 - LOCATION
    )
    :vars
    (
      ?AUTO_11103 - LOCATION
      ?AUTO_11096 - CITY
      ?AUTO_11104 - LOCATION
      ?AUTO_11099 - LOCATION
      ?AUTO_11097 - TRUCK
      ?AUTO_11098 - LOCATION
      ?AUTO_11102 - AIRPLANE
      ?AUTO_11095 - TRUCK
      ?AUTO_11101 - LOCATION
      ?AUTO_11100 - CITY
      ?AUTO_11105 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11103 ?AUTO_11096 ) ( IN-CITY ?AUTO_11094 ?AUTO_11096 ) ( not ( = ?AUTO_11094 ?AUTO_11103 ) ) ( AIRPORT ?AUTO_11104 ) ( AIRPORT ?AUTO_11103 ) ( not ( = ?AUTO_11104 ?AUTO_11103 ) ) ( not ( = ?AUTO_11094 ?AUTO_11104 ) ) ( IN-CITY ?AUTO_11099 ?AUTO_11096 ) ( not ( = ?AUTO_11103 ?AUTO_11099 ) ) ( not ( = ?AUTO_11094 ?AUTO_11099 ) ) ( not ( = ?AUTO_11104 ?AUTO_11099 ) ) ( TRUCK-AT ?AUTO_11097 ?AUTO_11094 ) ( AIRPORT ?AUTO_11098 ) ( AIRPLANE-AT ?AUTO_11102 ?AUTO_11098 ) ( not ( = ?AUTO_11098 ?AUTO_11103 ) ) ( not ( = ?AUTO_11094 ?AUTO_11098 ) ) ( not ( = ?AUTO_11104 ?AUTO_11098 ) ) ( not ( = ?AUTO_11099 ?AUTO_11098 ) ) ( not ( = ?AUTO_11097 ?AUTO_11095 ) ) ( IN-CITY ?AUTO_11101 ?AUTO_11100 ) ( IN-CITY ?AUTO_11104 ?AUTO_11100 ) ( not ( = ?AUTO_11104 ?AUTO_11101 ) ) ( not ( = ?AUTO_11094 ?AUTO_11101 ) ) ( not ( = ?AUTO_11103 ?AUTO_11101 ) ) ( not ( = ?AUTO_11096 ?AUTO_11100 ) ) ( not ( = ?AUTO_11099 ?AUTO_11101 ) ) ( not ( = ?AUTO_11098 ?AUTO_11101 ) ) ( OBJ-AT ?AUTO_11093 ?AUTO_11101 ) ( TRUCK-AT ?AUTO_11095 ?AUTO_11105 ) ( IN-CITY ?AUTO_11105 ?AUTO_11100 ) ( not ( = ?AUTO_11101 ?AUTO_11105 ) ) ( not ( = ?AUTO_11094 ?AUTO_11105 ) ) ( not ( = ?AUTO_11103 ?AUTO_11105 ) ) ( not ( = ?AUTO_11104 ?AUTO_11105 ) ) ( not ( = ?AUTO_11099 ?AUTO_11105 ) ) ( not ( = ?AUTO_11098 ?AUTO_11105 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11095 ?AUTO_11105 ?AUTO_11101 ?AUTO_11100 )
      ( DELIVER-PKG ?AUTO_11093 ?AUTO_11094 )
      ( DELIVER-PKG-VERIFY ?AUTO_11093 ?AUTO_11094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11110 - OBJ
      ?AUTO_11111 - LOCATION
    )
    :vars
    (
      ?AUTO_11112 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11112 ?AUTO_11111 ) ( IN-TRUCK ?AUTO_11110 ?AUTO_11112 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11110 ?AUTO_11112 ?AUTO_11111 )
      ( DELIVER-PKG-VERIFY ?AUTO_11110 ?AUTO_11111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11113 - OBJ
      ?AUTO_11114 - LOCATION
    )
    :vars
    (
      ?AUTO_11115 - TRUCK
      ?AUTO_11116 - LOCATION
      ?AUTO_11117 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11113 ?AUTO_11115 ) ( TRUCK-AT ?AUTO_11115 ?AUTO_11116 ) ( IN-CITY ?AUTO_11116 ?AUTO_11117 ) ( IN-CITY ?AUTO_11114 ?AUTO_11117 ) ( not ( = ?AUTO_11114 ?AUTO_11116 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11115 ?AUTO_11116 ?AUTO_11114 ?AUTO_11117 )
      ( DELIVER-PKG ?AUTO_11113 ?AUTO_11114 )
      ( DELIVER-PKG-VERIFY ?AUTO_11113 ?AUTO_11114 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11122 - OBJ
      ?AUTO_11123 - LOCATION
    )
    :vars
    (
      ?AUTO_11126 - TRUCK
      ?AUTO_11124 - LOCATION
      ?AUTO_11125 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11126 ?AUTO_11124 ) ( IN-CITY ?AUTO_11124 ?AUTO_11125 ) ( IN-CITY ?AUTO_11123 ?AUTO_11125 ) ( not ( = ?AUTO_11123 ?AUTO_11124 ) ) ( OBJ-AT ?AUTO_11122 ?AUTO_11124 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11122 ?AUTO_11126 ?AUTO_11124 )
      ( DELIVER-PKG ?AUTO_11122 ?AUTO_11123 )
      ( DELIVER-PKG-VERIFY ?AUTO_11122 ?AUTO_11123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11127 - OBJ
      ?AUTO_11128 - LOCATION
    )
    :vars
    (
      ?AUTO_11129 - LOCATION
      ?AUTO_11130 - CITY
      ?AUTO_11131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11129 ?AUTO_11130 ) ( IN-CITY ?AUTO_11128 ?AUTO_11130 ) ( not ( = ?AUTO_11128 ?AUTO_11129 ) ) ( OBJ-AT ?AUTO_11127 ?AUTO_11129 ) ( TRUCK-AT ?AUTO_11131 ?AUTO_11128 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11131 ?AUTO_11128 ?AUTO_11129 ?AUTO_11130 )
      ( DELIVER-PKG ?AUTO_11127 ?AUTO_11128 )
      ( DELIVER-PKG-VERIFY ?AUTO_11127 ?AUTO_11128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11158 - OBJ
      ?AUTO_11159 - LOCATION
    )
    :vars
    (
      ?AUTO_11161 - LOCATION
      ?AUTO_11160 - CITY
      ?AUTO_11162 - TRUCK
      ?AUTO_11163 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11161 ?AUTO_11160 ) ( IN-CITY ?AUTO_11159 ?AUTO_11160 ) ( not ( = ?AUTO_11159 ?AUTO_11161 ) ) ( TRUCK-AT ?AUTO_11162 ?AUTO_11159 ) ( IN-AIRPLANE ?AUTO_11158 ?AUTO_11163 ) ( AIRPLANE-AT ?AUTO_11163 ?AUTO_11161 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11158 ?AUTO_11163 ?AUTO_11161 )
      ( DELIVER-PKG ?AUTO_11158 ?AUTO_11159 )
      ( DELIVER-PKG-VERIFY ?AUTO_11158 ?AUTO_11159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11164 - OBJ
      ?AUTO_11165 - LOCATION
    )
    :vars
    (
      ?AUTO_11167 - LOCATION
      ?AUTO_11166 - CITY
      ?AUTO_11168 - TRUCK
      ?AUTO_11169 - AIRPLANE
      ?AUTO_11170 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11167 ?AUTO_11166 ) ( IN-CITY ?AUTO_11165 ?AUTO_11166 ) ( not ( = ?AUTO_11165 ?AUTO_11167 ) ) ( TRUCK-AT ?AUTO_11168 ?AUTO_11165 ) ( IN-AIRPLANE ?AUTO_11164 ?AUTO_11169 ) ( AIRPORT ?AUTO_11170 ) ( AIRPORT ?AUTO_11167 ) ( AIRPLANE-AT ?AUTO_11169 ?AUTO_11170 ) ( not ( = ?AUTO_11170 ?AUTO_11167 ) ) ( not ( = ?AUTO_11165 ?AUTO_11170 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11169 ?AUTO_11170 ?AUTO_11167 )
      ( DELIVER-PKG ?AUTO_11164 ?AUTO_11165 )
      ( DELIVER-PKG-VERIFY ?AUTO_11164 ?AUTO_11165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11211 - OBJ
      ?AUTO_11212 - LOCATION
    )
    :vars
    (
      ?AUTO_11216 - LOCATION
      ?AUTO_11213 - CITY
      ?AUTO_11215 - TRUCK
      ?AUTO_11217 - LOCATION
      ?AUTO_11214 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11216 ?AUTO_11213 ) ( IN-CITY ?AUTO_11212 ?AUTO_11213 ) ( not ( = ?AUTO_11212 ?AUTO_11216 ) ) ( TRUCK-AT ?AUTO_11215 ?AUTO_11212 ) ( AIRPORT ?AUTO_11217 ) ( AIRPORT ?AUTO_11216 ) ( AIRPLANE-AT ?AUTO_11214 ?AUTO_11217 ) ( not ( = ?AUTO_11217 ?AUTO_11216 ) ) ( not ( = ?AUTO_11212 ?AUTO_11217 ) ) ( OBJ-AT ?AUTO_11211 ?AUTO_11217 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11211 ?AUTO_11214 ?AUTO_11217 )
      ( DELIVER-PKG ?AUTO_11211 ?AUTO_11212 )
      ( DELIVER-PKG-VERIFY ?AUTO_11211 ?AUTO_11212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11244 - OBJ
      ?AUTO_11245 - LOCATION
    )
    :vars
    (
      ?AUTO_11246 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11246 ?AUTO_11245 ) ( IN-TRUCK ?AUTO_11244 ?AUTO_11246 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11244 ?AUTO_11246 ?AUTO_11245 )
      ( DELIVER-PKG-VERIFY ?AUTO_11244 ?AUTO_11245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11253 - OBJ
      ?AUTO_11254 - LOCATION
    )
    :vars
    (
      ?AUTO_11256 - TRUCK
      ?AUTO_11255 - LOCATION
      ?AUTO_11257 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11256 ?AUTO_11255 ) ( IN-CITY ?AUTO_11255 ?AUTO_11257 ) ( IN-CITY ?AUTO_11254 ?AUTO_11257 ) ( not ( = ?AUTO_11254 ?AUTO_11255 ) ) ( OBJ-AT ?AUTO_11253 ?AUTO_11255 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11253 ?AUTO_11256 ?AUTO_11255 )
      ( DELIVER-PKG ?AUTO_11253 ?AUTO_11254 )
      ( DELIVER-PKG-VERIFY ?AUTO_11253 ?AUTO_11254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11286 - OBJ
      ?AUTO_11287 - LOCATION
    )
    :vars
    (
      ?AUTO_11289 - LOCATION
      ?AUTO_11290 - CITY
      ?AUTO_11288 - TRUCK
      ?AUTO_11291 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11289 ?AUTO_11290 ) ( IN-CITY ?AUTO_11287 ?AUTO_11290 ) ( not ( = ?AUTO_11287 ?AUTO_11289 ) ) ( TRUCK-AT ?AUTO_11288 ?AUTO_11287 ) ( IN-AIRPLANE ?AUTO_11286 ?AUTO_11291 ) ( AIRPLANE-AT ?AUTO_11291 ?AUTO_11289 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11286 ?AUTO_11291 ?AUTO_11289 )
      ( DELIVER-PKG ?AUTO_11286 ?AUTO_11287 )
      ( DELIVER-PKG-VERIFY ?AUTO_11286 ?AUTO_11287 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11300 - OBJ
      ?AUTO_11301 - LOCATION
    )
    :vars
    (
      ?AUTO_11304 - LOCATION
      ?AUTO_11305 - CITY
      ?AUTO_11306 - TRUCK
      ?AUTO_11302 - LOCATION
      ?AUTO_11303 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11304 ?AUTO_11305 ) ( IN-CITY ?AUTO_11301 ?AUTO_11305 ) ( not ( = ?AUTO_11301 ?AUTO_11304 ) ) ( TRUCK-AT ?AUTO_11306 ?AUTO_11301 ) ( AIRPORT ?AUTO_11302 ) ( AIRPORT ?AUTO_11304 ) ( AIRPLANE-AT ?AUTO_11303 ?AUTO_11302 ) ( not ( = ?AUTO_11302 ?AUTO_11304 ) ) ( not ( = ?AUTO_11301 ?AUTO_11302 ) ) ( OBJ-AT ?AUTO_11300 ?AUTO_11302 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11300 ?AUTO_11303 ?AUTO_11302 )
      ( DELIVER-PKG ?AUTO_11300 ?AUTO_11301 )
      ( DELIVER-PKG-VERIFY ?AUTO_11300 ?AUTO_11301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11307 - OBJ
      ?AUTO_11308 - LOCATION
    )
    :vars
    (
      ?AUTO_11312 - LOCATION
      ?AUTO_11313 - CITY
      ?AUTO_11311 - TRUCK
      ?AUTO_11309 - LOCATION
      ?AUTO_11314 - LOCATION
      ?AUTO_11310 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11312 ?AUTO_11313 ) ( IN-CITY ?AUTO_11308 ?AUTO_11313 ) ( not ( = ?AUTO_11308 ?AUTO_11312 ) ) ( TRUCK-AT ?AUTO_11311 ?AUTO_11308 ) ( AIRPORT ?AUTO_11309 ) ( AIRPORT ?AUTO_11312 ) ( not ( = ?AUTO_11309 ?AUTO_11312 ) ) ( not ( = ?AUTO_11308 ?AUTO_11309 ) ) ( OBJ-AT ?AUTO_11307 ?AUTO_11309 ) ( AIRPORT ?AUTO_11314 ) ( AIRPLANE-AT ?AUTO_11310 ?AUTO_11314 ) ( not ( = ?AUTO_11314 ?AUTO_11309 ) ) ( not ( = ?AUTO_11308 ?AUTO_11314 ) ) ( not ( = ?AUTO_11312 ?AUTO_11314 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11310 ?AUTO_11314 ?AUTO_11309 )
      ( DELIVER-PKG ?AUTO_11307 ?AUTO_11308 )
      ( DELIVER-PKG-VERIFY ?AUTO_11307 ?AUTO_11308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11375 - OBJ
      ?AUTO_11376 - LOCATION
    )
    :vars
    (
      ?AUTO_11377 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11377 ?AUTO_11376 ) ( IN-TRUCK ?AUTO_11375 ?AUTO_11377 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11375 ?AUTO_11377 ?AUTO_11376 )
      ( DELIVER-PKG-VERIFY ?AUTO_11375 ?AUTO_11376 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11384 - OBJ
      ?AUTO_11385 - LOCATION
    )
    :vars
    (
      ?AUTO_11387 - TRUCK
      ?AUTO_11386 - LOCATION
      ?AUTO_11388 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11387 ?AUTO_11386 ) ( IN-CITY ?AUTO_11386 ?AUTO_11388 ) ( IN-CITY ?AUTO_11385 ?AUTO_11388 ) ( not ( = ?AUTO_11385 ?AUTO_11386 ) ) ( OBJ-AT ?AUTO_11384 ?AUTO_11386 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11384 ?AUTO_11387 ?AUTO_11386 )
      ( DELIVER-PKG ?AUTO_11384 ?AUTO_11385 )
      ( DELIVER-PKG-VERIFY ?AUTO_11384 ?AUTO_11385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11417 - OBJ
      ?AUTO_11418 - LOCATION
    )
    :vars
    (
      ?AUTO_11419 - LOCATION
      ?AUTO_11420 - CITY
      ?AUTO_11421 - TRUCK
      ?AUTO_11422 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11419 ?AUTO_11420 ) ( IN-CITY ?AUTO_11418 ?AUTO_11420 ) ( not ( = ?AUTO_11418 ?AUTO_11419 ) ) ( TRUCK-AT ?AUTO_11421 ?AUTO_11418 ) ( IN-AIRPLANE ?AUTO_11417 ?AUTO_11422 ) ( AIRPLANE-AT ?AUTO_11422 ?AUTO_11419 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11417 ?AUTO_11422 ?AUTO_11419 )
      ( DELIVER-PKG ?AUTO_11417 ?AUTO_11418 )
      ( DELIVER-PKG-VERIFY ?AUTO_11417 ?AUTO_11418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11451 - OBJ
      ?AUTO_11452 - LOCATION
    )
    :vars
    (
      ?AUTO_11457 - LOCATION
      ?AUTO_11454 - CITY
      ?AUTO_11455 - TRUCK
      ?AUTO_11453 - LOCATION
      ?AUTO_11456 - AIRPLANE
      ?AUTO_11458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11457 ?AUTO_11454 ) ( IN-CITY ?AUTO_11452 ?AUTO_11454 ) ( not ( = ?AUTO_11452 ?AUTO_11457 ) ) ( TRUCK-AT ?AUTO_11455 ?AUTO_11452 ) ( AIRPORT ?AUTO_11453 ) ( AIRPORT ?AUTO_11457 ) ( AIRPLANE-AT ?AUTO_11456 ?AUTO_11453 ) ( not ( = ?AUTO_11453 ?AUTO_11457 ) ) ( not ( = ?AUTO_11452 ?AUTO_11453 ) ) ( TRUCK-AT ?AUTO_11458 ?AUTO_11453 ) ( IN-TRUCK ?AUTO_11451 ?AUTO_11458 ) ( not ( = ?AUTO_11455 ?AUTO_11458 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11451 ?AUTO_11458 ?AUTO_11453 )
      ( DELIVER-PKG ?AUTO_11451 ?AUTO_11452 )
      ( DELIVER-PKG-VERIFY ?AUTO_11451 ?AUTO_11452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11459 - OBJ
      ?AUTO_11460 - LOCATION
    )
    :vars
    (
      ?AUTO_11466 - LOCATION
      ?AUTO_11463 - CITY
      ?AUTO_11462 - TRUCK
      ?AUTO_11461 - LOCATION
      ?AUTO_11464 - AIRPLANE
      ?AUTO_11465 - TRUCK
      ?AUTO_11467 - LOCATION
      ?AUTO_11468 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11466 ?AUTO_11463 ) ( IN-CITY ?AUTO_11460 ?AUTO_11463 ) ( not ( = ?AUTO_11460 ?AUTO_11466 ) ) ( TRUCK-AT ?AUTO_11462 ?AUTO_11460 ) ( AIRPORT ?AUTO_11461 ) ( AIRPORT ?AUTO_11466 ) ( AIRPLANE-AT ?AUTO_11464 ?AUTO_11461 ) ( not ( = ?AUTO_11461 ?AUTO_11466 ) ) ( not ( = ?AUTO_11460 ?AUTO_11461 ) ) ( IN-TRUCK ?AUTO_11459 ?AUTO_11465 ) ( not ( = ?AUTO_11462 ?AUTO_11465 ) ) ( TRUCK-AT ?AUTO_11465 ?AUTO_11467 ) ( IN-CITY ?AUTO_11467 ?AUTO_11468 ) ( IN-CITY ?AUTO_11461 ?AUTO_11468 ) ( not ( = ?AUTO_11461 ?AUTO_11467 ) ) ( not ( = ?AUTO_11460 ?AUTO_11467 ) ) ( not ( = ?AUTO_11466 ?AUTO_11467 ) ) ( not ( = ?AUTO_11463 ?AUTO_11468 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11465 ?AUTO_11467 ?AUTO_11461 ?AUTO_11468 )
      ( DELIVER-PKG ?AUTO_11459 ?AUTO_11460 )
      ( DELIVER-PKG-VERIFY ?AUTO_11459 ?AUTO_11460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11471 - OBJ
      ?AUTO_11472 - LOCATION
    )
    :vars
    (
      ?AUTO_11479 - LOCATION
      ?AUTO_11477 - CITY
      ?AUTO_11478 - TRUCK
      ?AUTO_11476 - LOCATION
      ?AUTO_11473 - AIRPLANE
      ?AUTO_11480 - TRUCK
      ?AUTO_11474 - LOCATION
      ?AUTO_11475 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11479 ?AUTO_11477 ) ( IN-CITY ?AUTO_11472 ?AUTO_11477 ) ( not ( = ?AUTO_11472 ?AUTO_11479 ) ) ( TRUCK-AT ?AUTO_11478 ?AUTO_11472 ) ( AIRPORT ?AUTO_11476 ) ( AIRPORT ?AUTO_11479 ) ( AIRPLANE-AT ?AUTO_11473 ?AUTO_11476 ) ( not ( = ?AUTO_11476 ?AUTO_11479 ) ) ( not ( = ?AUTO_11472 ?AUTO_11476 ) ) ( not ( = ?AUTO_11478 ?AUTO_11480 ) ) ( TRUCK-AT ?AUTO_11480 ?AUTO_11474 ) ( IN-CITY ?AUTO_11474 ?AUTO_11475 ) ( IN-CITY ?AUTO_11476 ?AUTO_11475 ) ( not ( = ?AUTO_11476 ?AUTO_11474 ) ) ( not ( = ?AUTO_11472 ?AUTO_11474 ) ) ( not ( = ?AUTO_11479 ?AUTO_11474 ) ) ( not ( = ?AUTO_11477 ?AUTO_11475 ) ) ( OBJ-AT ?AUTO_11471 ?AUTO_11474 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11471 ?AUTO_11480 ?AUTO_11474 )
      ( DELIVER-PKG ?AUTO_11471 ?AUTO_11472 )
      ( DELIVER-PKG-VERIFY ?AUTO_11471 ?AUTO_11472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11481 - OBJ
      ?AUTO_11482 - LOCATION
    )
    :vars
    (
      ?AUTO_11484 - LOCATION
      ?AUTO_11490 - CITY
      ?AUTO_11487 - TRUCK
      ?AUTO_11489 - LOCATION
      ?AUTO_11486 - AIRPLANE
      ?AUTO_11488 - TRUCK
      ?AUTO_11483 - LOCATION
      ?AUTO_11485 - CITY
      ?AUTO_11491 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11484 ?AUTO_11490 ) ( IN-CITY ?AUTO_11482 ?AUTO_11490 ) ( not ( = ?AUTO_11482 ?AUTO_11484 ) ) ( TRUCK-AT ?AUTO_11487 ?AUTO_11482 ) ( AIRPORT ?AUTO_11489 ) ( AIRPORT ?AUTO_11484 ) ( AIRPLANE-AT ?AUTO_11486 ?AUTO_11489 ) ( not ( = ?AUTO_11489 ?AUTO_11484 ) ) ( not ( = ?AUTO_11482 ?AUTO_11489 ) ) ( not ( = ?AUTO_11487 ?AUTO_11488 ) ) ( IN-CITY ?AUTO_11483 ?AUTO_11485 ) ( IN-CITY ?AUTO_11489 ?AUTO_11485 ) ( not ( = ?AUTO_11489 ?AUTO_11483 ) ) ( not ( = ?AUTO_11482 ?AUTO_11483 ) ) ( not ( = ?AUTO_11484 ?AUTO_11483 ) ) ( not ( = ?AUTO_11490 ?AUTO_11485 ) ) ( OBJ-AT ?AUTO_11481 ?AUTO_11483 ) ( TRUCK-AT ?AUTO_11488 ?AUTO_11491 ) ( IN-CITY ?AUTO_11491 ?AUTO_11485 ) ( not ( = ?AUTO_11483 ?AUTO_11491 ) ) ( not ( = ?AUTO_11482 ?AUTO_11491 ) ) ( not ( = ?AUTO_11484 ?AUTO_11491 ) ) ( not ( = ?AUTO_11489 ?AUTO_11491 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11488 ?AUTO_11491 ?AUTO_11483 ?AUTO_11485 )
      ( DELIVER-PKG ?AUTO_11481 ?AUTO_11482 )
      ( DELIVER-PKG-VERIFY ?AUTO_11481 ?AUTO_11482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11492 - OBJ
      ?AUTO_11493 - LOCATION
    )
    :vars
    (
      ?AUTO_11498 - LOCATION
      ?AUTO_11494 - CITY
      ?AUTO_11500 - TRUCK
      ?AUTO_11499 - LOCATION
      ?AUTO_11496 - TRUCK
      ?AUTO_11497 - LOCATION
      ?AUTO_11501 - CITY
      ?AUTO_11502 - LOCATION
      ?AUTO_11503 - LOCATION
      ?AUTO_11495 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11498 ?AUTO_11494 ) ( IN-CITY ?AUTO_11493 ?AUTO_11494 ) ( not ( = ?AUTO_11493 ?AUTO_11498 ) ) ( TRUCK-AT ?AUTO_11500 ?AUTO_11493 ) ( AIRPORT ?AUTO_11499 ) ( AIRPORT ?AUTO_11498 ) ( not ( = ?AUTO_11499 ?AUTO_11498 ) ) ( not ( = ?AUTO_11493 ?AUTO_11499 ) ) ( not ( = ?AUTO_11500 ?AUTO_11496 ) ) ( IN-CITY ?AUTO_11497 ?AUTO_11501 ) ( IN-CITY ?AUTO_11499 ?AUTO_11501 ) ( not ( = ?AUTO_11499 ?AUTO_11497 ) ) ( not ( = ?AUTO_11493 ?AUTO_11497 ) ) ( not ( = ?AUTO_11498 ?AUTO_11497 ) ) ( not ( = ?AUTO_11494 ?AUTO_11501 ) ) ( OBJ-AT ?AUTO_11492 ?AUTO_11497 ) ( TRUCK-AT ?AUTO_11496 ?AUTO_11502 ) ( IN-CITY ?AUTO_11502 ?AUTO_11501 ) ( not ( = ?AUTO_11497 ?AUTO_11502 ) ) ( not ( = ?AUTO_11493 ?AUTO_11502 ) ) ( not ( = ?AUTO_11498 ?AUTO_11502 ) ) ( not ( = ?AUTO_11499 ?AUTO_11502 ) ) ( AIRPORT ?AUTO_11503 ) ( AIRPLANE-AT ?AUTO_11495 ?AUTO_11503 ) ( not ( = ?AUTO_11503 ?AUTO_11499 ) ) ( not ( = ?AUTO_11493 ?AUTO_11503 ) ) ( not ( = ?AUTO_11498 ?AUTO_11503 ) ) ( not ( = ?AUTO_11497 ?AUTO_11503 ) ) ( not ( = ?AUTO_11502 ?AUTO_11503 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11495 ?AUTO_11503 ?AUTO_11499 )
      ( DELIVER-PKG ?AUTO_11492 ?AUTO_11493 )
      ( DELIVER-PKG-VERIFY ?AUTO_11492 ?AUTO_11493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11506 - OBJ
      ?AUTO_11507 - LOCATION
    )
    :vars
    (
      ?AUTO_11508 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11508 ?AUTO_11507 ) ( IN-TRUCK ?AUTO_11506 ?AUTO_11508 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11506 ?AUTO_11508 ?AUTO_11507 )
      ( DELIVER-PKG-VERIFY ?AUTO_11506 ?AUTO_11507 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11509 - OBJ
      ?AUTO_11510 - LOCATION
    )
    :vars
    (
      ?AUTO_11511 - TRUCK
      ?AUTO_11512 - LOCATION
      ?AUTO_11513 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11509 ?AUTO_11511 ) ( TRUCK-AT ?AUTO_11511 ?AUTO_11512 ) ( IN-CITY ?AUTO_11512 ?AUTO_11513 ) ( IN-CITY ?AUTO_11510 ?AUTO_11513 ) ( not ( = ?AUTO_11510 ?AUTO_11512 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11511 ?AUTO_11512 ?AUTO_11510 ?AUTO_11513 )
      ( DELIVER-PKG ?AUTO_11509 ?AUTO_11510 )
      ( DELIVER-PKG-VERIFY ?AUTO_11509 ?AUTO_11510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11514 - OBJ
      ?AUTO_11515 - LOCATION
    )
    :vars
    (
      ?AUTO_11516 - TRUCK
      ?AUTO_11517 - LOCATION
      ?AUTO_11518 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11516 ?AUTO_11517 ) ( IN-CITY ?AUTO_11517 ?AUTO_11518 ) ( IN-CITY ?AUTO_11515 ?AUTO_11518 ) ( not ( = ?AUTO_11515 ?AUTO_11517 ) ) ( OBJ-AT ?AUTO_11514 ?AUTO_11517 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11514 ?AUTO_11516 ?AUTO_11517 )
      ( DELIVER-PKG ?AUTO_11514 ?AUTO_11515 )
      ( DELIVER-PKG-VERIFY ?AUTO_11514 ?AUTO_11515 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11519 - OBJ
      ?AUTO_11520 - LOCATION
    )
    :vars
    (
      ?AUTO_11521 - LOCATION
      ?AUTO_11523 - CITY
      ?AUTO_11522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11521 ?AUTO_11523 ) ( IN-CITY ?AUTO_11520 ?AUTO_11523 ) ( not ( = ?AUTO_11520 ?AUTO_11521 ) ) ( OBJ-AT ?AUTO_11519 ?AUTO_11521 ) ( TRUCK-AT ?AUTO_11522 ?AUTO_11520 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11522 ?AUTO_11520 ?AUTO_11521 ?AUTO_11523 )
      ( DELIVER-PKG ?AUTO_11519 ?AUTO_11520 )
      ( DELIVER-PKG-VERIFY ?AUTO_11519 ?AUTO_11520 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11530 - OBJ
      ?AUTO_11531 - LOCATION
    )
    :vars
    (
      ?AUTO_11532 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11530 ?AUTO_11532 ) ( AIRPLANE-AT ?AUTO_11532 ?AUTO_11531 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11530 ?AUTO_11532 ?AUTO_11531 )
      ( DELIVER-PKG-VERIFY ?AUTO_11530 ?AUTO_11531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11533 - OBJ
      ?AUTO_11534 - LOCATION
    )
    :vars
    (
      ?AUTO_11535 - AIRPLANE
      ?AUTO_11536 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11533 ?AUTO_11535 ) ( AIRPORT ?AUTO_11536 ) ( AIRPORT ?AUTO_11534 ) ( AIRPLANE-AT ?AUTO_11535 ?AUTO_11536 ) ( not ( = ?AUTO_11536 ?AUTO_11534 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11535 ?AUTO_11536 ?AUTO_11534 )
      ( DELIVER-PKG ?AUTO_11533 ?AUTO_11534 )
      ( DELIVER-PKG-VERIFY ?AUTO_11533 ?AUTO_11534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11537 - OBJ
      ?AUTO_11538 - LOCATION
    )
    :vars
    (
      ?AUTO_11540 - LOCATION
      ?AUTO_11539 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11540 ) ( AIRPORT ?AUTO_11538 ) ( AIRPLANE-AT ?AUTO_11539 ?AUTO_11540 ) ( not ( = ?AUTO_11540 ?AUTO_11538 ) ) ( OBJ-AT ?AUTO_11537 ?AUTO_11540 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11537 ?AUTO_11539 ?AUTO_11540 )
      ( DELIVER-PKG ?AUTO_11537 ?AUTO_11538 )
      ( DELIVER-PKG-VERIFY ?AUTO_11537 ?AUTO_11538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11541 - OBJ
      ?AUTO_11542 - LOCATION
    )
    :vars
    (
      ?AUTO_11544 - LOCATION
      ?AUTO_11543 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11544 ) ( AIRPORT ?AUTO_11542 ) ( not ( = ?AUTO_11544 ?AUTO_11542 ) ) ( OBJ-AT ?AUTO_11541 ?AUTO_11544 ) ( AIRPLANE-AT ?AUTO_11543 ?AUTO_11542 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11543 ?AUTO_11542 ?AUTO_11544 )
      ( DELIVER-PKG ?AUTO_11541 ?AUTO_11542 )
      ( DELIVER-PKG-VERIFY ?AUTO_11541 ?AUTO_11542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11563 - OBJ
      ?AUTO_11564 - LOCATION
    )
    :vars
    (
      ?AUTO_11565 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11565 ?AUTO_11564 ) ( IN-TRUCK ?AUTO_11563 ?AUTO_11565 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11563 ?AUTO_11565 ?AUTO_11564 )
      ( DELIVER-PKG-VERIFY ?AUTO_11563 ?AUTO_11564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11566 - OBJ
      ?AUTO_11567 - LOCATION
    )
    :vars
    (
      ?AUTO_11568 - TRUCK
      ?AUTO_11569 - LOCATION
      ?AUTO_11570 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11566 ?AUTO_11568 ) ( TRUCK-AT ?AUTO_11568 ?AUTO_11569 ) ( IN-CITY ?AUTO_11569 ?AUTO_11570 ) ( IN-CITY ?AUTO_11567 ?AUTO_11570 ) ( not ( = ?AUTO_11567 ?AUTO_11569 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11568 ?AUTO_11569 ?AUTO_11567 ?AUTO_11570 )
      ( DELIVER-PKG ?AUTO_11566 ?AUTO_11567 )
      ( DELIVER-PKG-VERIFY ?AUTO_11566 ?AUTO_11567 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11571 - OBJ
      ?AUTO_11572 - LOCATION
    )
    :vars
    (
      ?AUTO_11573 - TRUCK
      ?AUTO_11574 - LOCATION
      ?AUTO_11575 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11573 ?AUTO_11574 ) ( IN-CITY ?AUTO_11574 ?AUTO_11575 ) ( IN-CITY ?AUTO_11572 ?AUTO_11575 ) ( not ( = ?AUTO_11572 ?AUTO_11574 ) ) ( OBJ-AT ?AUTO_11571 ?AUTO_11574 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11571 ?AUTO_11573 ?AUTO_11574 )
      ( DELIVER-PKG ?AUTO_11571 ?AUTO_11572 )
      ( DELIVER-PKG-VERIFY ?AUTO_11571 ?AUTO_11572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11576 - OBJ
      ?AUTO_11577 - LOCATION
    )
    :vars
    (
      ?AUTO_11579 - TRUCK
      ?AUTO_11578 - LOCATION
      ?AUTO_11580 - CITY
      ?AUTO_11581 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11579 ?AUTO_11578 ) ( IN-CITY ?AUTO_11578 ?AUTO_11580 ) ( IN-CITY ?AUTO_11577 ?AUTO_11580 ) ( not ( = ?AUTO_11577 ?AUTO_11578 ) ) ( IN-AIRPLANE ?AUTO_11576 ?AUTO_11581 ) ( AIRPLANE-AT ?AUTO_11581 ?AUTO_11578 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11576 ?AUTO_11581 ?AUTO_11578 )
      ( DELIVER-PKG ?AUTO_11576 ?AUTO_11577 )
      ( DELIVER-PKG-VERIFY ?AUTO_11576 ?AUTO_11577 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11582 - OBJ
      ?AUTO_11583 - LOCATION
    )
    :vars
    (
      ?AUTO_11585 - TRUCK
      ?AUTO_11586 - LOCATION
      ?AUTO_11584 - CITY
      ?AUTO_11587 - AIRPLANE
      ?AUTO_11588 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11585 ?AUTO_11586 ) ( IN-CITY ?AUTO_11586 ?AUTO_11584 ) ( IN-CITY ?AUTO_11583 ?AUTO_11584 ) ( not ( = ?AUTO_11583 ?AUTO_11586 ) ) ( IN-AIRPLANE ?AUTO_11582 ?AUTO_11587 ) ( AIRPORT ?AUTO_11588 ) ( AIRPORT ?AUTO_11586 ) ( AIRPLANE-AT ?AUTO_11587 ?AUTO_11588 ) ( not ( = ?AUTO_11588 ?AUTO_11586 ) ) ( not ( = ?AUTO_11583 ?AUTO_11588 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11587 ?AUTO_11588 ?AUTO_11586 )
      ( DELIVER-PKG ?AUTO_11582 ?AUTO_11583 )
      ( DELIVER-PKG-VERIFY ?AUTO_11582 ?AUTO_11583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11589 - OBJ
      ?AUTO_11590 - LOCATION
    )
    :vars
    (
      ?AUTO_11591 - TRUCK
      ?AUTO_11593 - LOCATION
      ?AUTO_11592 - CITY
      ?AUTO_11594 - LOCATION
      ?AUTO_11595 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11591 ?AUTO_11593 ) ( IN-CITY ?AUTO_11593 ?AUTO_11592 ) ( IN-CITY ?AUTO_11590 ?AUTO_11592 ) ( not ( = ?AUTO_11590 ?AUTO_11593 ) ) ( AIRPORT ?AUTO_11594 ) ( AIRPORT ?AUTO_11593 ) ( AIRPLANE-AT ?AUTO_11595 ?AUTO_11594 ) ( not ( = ?AUTO_11594 ?AUTO_11593 ) ) ( not ( = ?AUTO_11590 ?AUTO_11594 ) ) ( OBJ-AT ?AUTO_11589 ?AUTO_11594 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11589 ?AUTO_11595 ?AUTO_11594 )
      ( DELIVER-PKG ?AUTO_11589 ?AUTO_11590 )
      ( DELIVER-PKG-VERIFY ?AUTO_11589 ?AUTO_11590 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11596 - OBJ
      ?AUTO_11597 - LOCATION
    )
    :vars
    (
      ?AUTO_11602 - TRUCK
      ?AUTO_11598 - LOCATION
      ?AUTO_11601 - CITY
      ?AUTO_11599 - LOCATION
      ?AUTO_11600 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11602 ?AUTO_11598 ) ( IN-CITY ?AUTO_11598 ?AUTO_11601 ) ( IN-CITY ?AUTO_11597 ?AUTO_11601 ) ( not ( = ?AUTO_11597 ?AUTO_11598 ) ) ( AIRPORT ?AUTO_11599 ) ( AIRPORT ?AUTO_11598 ) ( not ( = ?AUTO_11599 ?AUTO_11598 ) ) ( not ( = ?AUTO_11597 ?AUTO_11599 ) ) ( OBJ-AT ?AUTO_11596 ?AUTO_11599 ) ( AIRPLANE-AT ?AUTO_11600 ?AUTO_11598 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11600 ?AUTO_11598 ?AUTO_11599 )
      ( DELIVER-PKG ?AUTO_11596 ?AUTO_11597 )
      ( DELIVER-PKG-VERIFY ?AUTO_11596 ?AUTO_11597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11617 - OBJ
      ?AUTO_11618 - LOCATION
    )
    :vars
    (
      ?AUTO_11622 - LOCATION
      ?AUTO_11619 - CITY
      ?AUTO_11621 - LOCATION
      ?AUTO_11623 - AIRPLANE
      ?AUTO_11620 - TRUCK
      ?AUTO_11624 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11622 ?AUTO_11619 ) ( IN-CITY ?AUTO_11618 ?AUTO_11619 ) ( not ( = ?AUTO_11618 ?AUTO_11622 ) ) ( AIRPORT ?AUTO_11621 ) ( AIRPORT ?AUTO_11622 ) ( not ( = ?AUTO_11621 ?AUTO_11622 ) ) ( not ( = ?AUTO_11618 ?AUTO_11621 ) ) ( OBJ-AT ?AUTO_11617 ?AUTO_11621 ) ( AIRPLANE-AT ?AUTO_11623 ?AUTO_11622 ) ( TRUCK-AT ?AUTO_11620 ?AUTO_11624 ) ( IN-CITY ?AUTO_11624 ?AUTO_11619 ) ( not ( = ?AUTO_11622 ?AUTO_11624 ) ) ( not ( = ?AUTO_11618 ?AUTO_11624 ) ) ( not ( = ?AUTO_11621 ?AUTO_11624 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11620 ?AUTO_11624 ?AUTO_11622 ?AUTO_11619 )
      ( DELIVER-PKG ?AUTO_11617 ?AUTO_11618 )
      ( DELIVER-PKG-VERIFY ?AUTO_11617 ?AUTO_11618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11627 - OBJ
      ?AUTO_11628 - LOCATION
    )
    :vars
    (
      ?AUTO_11629 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11629 ?AUTO_11628 ) ( IN-TRUCK ?AUTO_11627 ?AUTO_11629 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11627 ?AUTO_11629 ?AUTO_11628 )
      ( DELIVER-PKG-VERIFY ?AUTO_11627 ?AUTO_11628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11630 - OBJ
      ?AUTO_11631 - LOCATION
    )
    :vars
    (
      ?AUTO_11632 - TRUCK
      ?AUTO_11633 - LOCATION
      ?AUTO_11634 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11630 ?AUTO_11632 ) ( TRUCK-AT ?AUTO_11632 ?AUTO_11633 ) ( IN-CITY ?AUTO_11633 ?AUTO_11634 ) ( IN-CITY ?AUTO_11631 ?AUTO_11634 ) ( not ( = ?AUTO_11631 ?AUTO_11633 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11632 ?AUTO_11633 ?AUTO_11631 ?AUTO_11634 )
      ( DELIVER-PKG ?AUTO_11630 ?AUTO_11631 )
      ( DELIVER-PKG-VERIFY ?AUTO_11630 ?AUTO_11631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11635 - OBJ
      ?AUTO_11636 - LOCATION
    )
    :vars
    (
      ?AUTO_11637 - TRUCK
      ?AUTO_11638 - LOCATION
      ?AUTO_11639 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11637 ?AUTO_11638 ) ( IN-CITY ?AUTO_11638 ?AUTO_11639 ) ( IN-CITY ?AUTO_11636 ?AUTO_11639 ) ( not ( = ?AUTO_11636 ?AUTO_11638 ) ) ( OBJ-AT ?AUTO_11635 ?AUTO_11638 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11635 ?AUTO_11637 ?AUTO_11638 )
      ( DELIVER-PKG ?AUTO_11635 ?AUTO_11636 )
      ( DELIVER-PKG-VERIFY ?AUTO_11635 ?AUTO_11636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11640 - OBJ
      ?AUTO_11641 - LOCATION
    )
    :vars
    (
      ?AUTO_11642 - LOCATION
      ?AUTO_11644 - CITY
      ?AUTO_11643 - TRUCK
      ?AUTO_11645 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11642 ?AUTO_11644 ) ( IN-CITY ?AUTO_11641 ?AUTO_11644 ) ( not ( = ?AUTO_11641 ?AUTO_11642 ) ) ( OBJ-AT ?AUTO_11640 ?AUTO_11642 ) ( TRUCK-AT ?AUTO_11643 ?AUTO_11645 ) ( IN-CITY ?AUTO_11645 ?AUTO_11644 ) ( not ( = ?AUTO_11642 ?AUTO_11645 ) ) ( not ( = ?AUTO_11641 ?AUTO_11645 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11643 ?AUTO_11645 ?AUTO_11642 ?AUTO_11644 )
      ( DELIVER-PKG ?AUTO_11640 ?AUTO_11641 )
      ( DELIVER-PKG-VERIFY ?AUTO_11640 ?AUTO_11641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11678 - OBJ
      ?AUTO_11679 - LOCATION
    )
    :vars
    (
      ?AUTO_11680 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11678 ?AUTO_11680 ) ( AIRPLANE-AT ?AUTO_11680 ?AUTO_11679 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11678 ?AUTO_11680 ?AUTO_11679 )
      ( DELIVER-PKG-VERIFY ?AUTO_11678 ?AUTO_11679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11683 - OBJ
      ?AUTO_11684 - LOCATION
    )
    :vars
    (
      ?AUTO_11685 - AIRPLANE
      ?AUTO_11686 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11683 ?AUTO_11685 ) ( AIRPORT ?AUTO_11686 ) ( AIRPORT ?AUTO_11684 ) ( AIRPLANE-AT ?AUTO_11685 ?AUTO_11686 ) ( not ( = ?AUTO_11686 ?AUTO_11684 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11685 ?AUTO_11686 ?AUTO_11684 )
      ( DELIVER-PKG ?AUTO_11683 ?AUTO_11684 )
      ( DELIVER-PKG-VERIFY ?AUTO_11683 ?AUTO_11684 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11713 - OBJ
      ?AUTO_11714 - LOCATION
    )
    :vars
    (
      ?AUTO_11715 - LOCATION
      ?AUTO_11716 - AIRPLANE
      ?AUTO_11717 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11715 ) ( AIRPORT ?AUTO_11714 ) ( AIRPLANE-AT ?AUTO_11716 ?AUTO_11715 ) ( not ( = ?AUTO_11715 ?AUTO_11714 ) ) ( TRUCK-AT ?AUTO_11717 ?AUTO_11715 ) ( IN-TRUCK ?AUTO_11713 ?AUTO_11717 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11713 ?AUTO_11717 ?AUTO_11715 )
      ( DELIVER-PKG ?AUTO_11713 ?AUTO_11714 )
      ( DELIVER-PKG-VERIFY ?AUTO_11713 ?AUTO_11714 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11718 - OBJ
      ?AUTO_11719 - LOCATION
    )
    :vars
    (
      ?AUTO_11721 - LOCATION
      ?AUTO_11720 - AIRPLANE
      ?AUTO_11722 - TRUCK
      ?AUTO_11723 - LOCATION
      ?AUTO_11724 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11721 ) ( AIRPORT ?AUTO_11719 ) ( AIRPLANE-AT ?AUTO_11720 ?AUTO_11721 ) ( not ( = ?AUTO_11721 ?AUTO_11719 ) ) ( IN-TRUCK ?AUTO_11718 ?AUTO_11722 ) ( TRUCK-AT ?AUTO_11722 ?AUTO_11723 ) ( IN-CITY ?AUTO_11723 ?AUTO_11724 ) ( IN-CITY ?AUTO_11721 ?AUTO_11724 ) ( not ( = ?AUTO_11721 ?AUTO_11723 ) ) ( not ( = ?AUTO_11719 ?AUTO_11723 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11722 ?AUTO_11723 ?AUTO_11721 ?AUTO_11724 )
      ( DELIVER-PKG ?AUTO_11718 ?AUTO_11719 )
      ( DELIVER-PKG-VERIFY ?AUTO_11718 ?AUTO_11719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11725 - OBJ
      ?AUTO_11726 - LOCATION
    )
    :vars
    (
      ?AUTO_11729 - LOCATION
      ?AUTO_11728 - AIRPLANE
      ?AUTO_11730 - TRUCK
      ?AUTO_11727 - LOCATION
      ?AUTO_11731 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11729 ) ( AIRPORT ?AUTO_11726 ) ( AIRPLANE-AT ?AUTO_11728 ?AUTO_11729 ) ( not ( = ?AUTO_11729 ?AUTO_11726 ) ) ( TRUCK-AT ?AUTO_11730 ?AUTO_11727 ) ( IN-CITY ?AUTO_11727 ?AUTO_11731 ) ( IN-CITY ?AUTO_11729 ?AUTO_11731 ) ( not ( = ?AUTO_11729 ?AUTO_11727 ) ) ( not ( = ?AUTO_11726 ?AUTO_11727 ) ) ( OBJ-AT ?AUTO_11725 ?AUTO_11727 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11725 ?AUTO_11730 ?AUTO_11727 )
      ( DELIVER-PKG ?AUTO_11725 ?AUTO_11726 )
      ( DELIVER-PKG-VERIFY ?AUTO_11725 ?AUTO_11726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11732 - OBJ
      ?AUTO_11733 - LOCATION
    )
    :vars
    (
      ?AUTO_11738 - LOCATION
      ?AUTO_11734 - AIRPLANE
      ?AUTO_11735 - LOCATION
      ?AUTO_11736 - CITY
      ?AUTO_11737 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11738 ) ( AIRPORT ?AUTO_11733 ) ( AIRPLANE-AT ?AUTO_11734 ?AUTO_11738 ) ( not ( = ?AUTO_11738 ?AUTO_11733 ) ) ( IN-CITY ?AUTO_11735 ?AUTO_11736 ) ( IN-CITY ?AUTO_11738 ?AUTO_11736 ) ( not ( = ?AUTO_11738 ?AUTO_11735 ) ) ( not ( = ?AUTO_11733 ?AUTO_11735 ) ) ( OBJ-AT ?AUTO_11732 ?AUTO_11735 ) ( TRUCK-AT ?AUTO_11737 ?AUTO_11738 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11737 ?AUTO_11738 ?AUTO_11735 ?AUTO_11736 )
      ( DELIVER-PKG ?AUTO_11732 ?AUTO_11733 )
      ( DELIVER-PKG-VERIFY ?AUTO_11732 ?AUTO_11733 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11745 - OBJ
      ?AUTO_11746 - LOCATION
    )
    :vars
    (
      ?AUTO_11747 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11745 ?AUTO_11747 ) ( AIRPLANE-AT ?AUTO_11747 ?AUTO_11746 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11745 ?AUTO_11747 ?AUTO_11746 )
      ( DELIVER-PKG-VERIFY ?AUTO_11745 ?AUTO_11746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11748 - OBJ
      ?AUTO_11749 - LOCATION
    )
    :vars
    (
      ?AUTO_11750 - AIRPLANE
      ?AUTO_11751 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_11748 ?AUTO_11750 ) ( AIRPORT ?AUTO_11751 ) ( AIRPORT ?AUTO_11749 ) ( AIRPLANE-AT ?AUTO_11750 ?AUTO_11751 ) ( not ( = ?AUTO_11751 ?AUTO_11749 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11750 ?AUTO_11751 ?AUTO_11749 )
      ( DELIVER-PKG ?AUTO_11748 ?AUTO_11749 )
      ( DELIVER-PKG-VERIFY ?AUTO_11748 ?AUTO_11749 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11760 - OBJ
      ?AUTO_11761 - LOCATION
    )
    :vars
    (
      ?AUTO_11762 - LOCATION
      ?AUTO_11763 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11762 ) ( AIRPORT ?AUTO_11761 ) ( AIRPLANE-AT ?AUTO_11763 ?AUTO_11762 ) ( not ( = ?AUTO_11762 ?AUTO_11761 ) ) ( OBJ-AT ?AUTO_11760 ?AUTO_11762 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11760 ?AUTO_11763 ?AUTO_11762 )
      ( DELIVER-PKG ?AUTO_11760 ?AUTO_11761 )
      ( DELIVER-PKG-VERIFY ?AUTO_11760 ?AUTO_11761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11764 - OBJ
      ?AUTO_11765 - LOCATION
    )
    :vars
    (
      ?AUTO_11766 - LOCATION
      ?AUTO_11767 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11766 ) ( AIRPORT ?AUTO_11765 ) ( not ( = ?AUTO_11766 ?AUTO_11765 ) ) ( OBJ-AT ?AUTO_11764 ?AUTO_11766 ) ( AIRPLANE-AT ?AUTO_11767 ?AUTO_11765 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11767 ?AUTO_11765 ?AUTO_11766 )
      ( DELIVER-PKG ?AUTO_11764 ?AUTO_11765 )
      ( DELIVER-PKG-VERIFY ?AUTO_11764 ?AUTO_11765 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11790 - OBJ
      ?AUTO_11791 - LOCATION
    )
    :vars
    (
      ?AUTO_11793 - LOCATION
      ?AUTO_11794 - LOCATION
      ?AUTO_11792 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11793 ) ( AIRPORT ?AUTO_11791 ) ( not ( = ?AUTO_11793 ?AUTO_11791 ) ) ( OBJ-AT ?AUTO_11790 ?AUTO_11793 ) ( AIRPORT ?AUTO_11794 ) ( AIRPLANE-AT ?AUTO_11792 ?AUTO_11794 ) ( not ( = ?AUTO_11794 ?AUTO_11791 ) ) ( not ( = ?AUTO_11793 ?AUTO_11794 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11792 ?AUTO_11794 ?AUTO_11791 )
      ( DELIVER-PKG ?AUTO_11790 ?AUTO_11791 )
      ( DELIVER-PKG-VERIFY ?AUTO_11790 ?AUTO_11791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11811 - OBJ
      ?AUTO_11812 - LOCATION
    )
    :vars
    (
      ?AUTO_11813 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11813 ?AUTO_11812 ) ( IN-TRUCK ?AUTO_11811 ?AUTO_11813 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11811 ?AUTO_11813 ?AUTO_11812 )
      ( DELIVER-PKG-VERIFY ?AUTO_11811 ?AUTO_11812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11816 - OBJ
      ?AUTO_11817 - LOCATION
    )
    :vars
    (
      ?AUTO_11818 - TRUCK
      ?AUTO_11819 - LOCATION
      ?AUTO_11820 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_11816 ?AUTO_11818 ) ( TRUCK-AT ?AUTO_11818 ?AUTO_11819 ) ( IN-CITY ?AUTO_11819 ?AUTO_11820 ) ( IN-CITY ?AUTO_11817 ?AUTO_11820 ) ( not ( = ?AUTO_11817 ?AUTO_11819 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11818 ?AUTO_11819 ?AUTO_11817 ?AUTO_11820 )
      ( DELIVER-PKG ?AUTO_11816 ?AUTO_11817 )
      ( DELIVER-PKG-VERIFY ?AUTO_11816 ?AUTO_11817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11821 - OBJ
      ?AUTO_11822 - LOCATION
    )
    :vars
    (
      ?AUTO_11823 - TRUCK
      ?AUTO_11824 - LOCATION
      ?AUTO_11825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11823 ?AUTO_11824 ) ( IN-CITY ?AUTO_11824 ?AUTO_11825 ) ( IN-CITY ?AUTO_11822 ?AUTO_11825 ) ( not ( = ?AUTO_11822 ?AUTO_11824 ) ) ( OBJ-AT ?AUTO_11821 ?AUTO_11824 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11821 ?AUTO_11823 ?AUTO_11824 )
      ( DELIVER-PKG ?AUTO_11821 ?AUTO_11822 )
      ( DELIVER-PKG-VERIFY ?AUTO_11821 ?AUTO_11822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11826 - OBJ
      ?AUTO_11827 - LOCATION
    )
    :vars
    (
      ?AUTO_11829 - TRUCK
      ?AUTO_11828 - LOCATION
      ?AUTO_11830 - CITY
      ?AUTO_11831 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11829 ?AUTO_11828 ) ( IN-CITY ?AUTO_11828 ?AUTO_11830 ) ( IN-CITY ?AUTO_11827 ?AUTO_11830 ) ( not ( = ?AUTO_11827 ?AUTO_11828 ) ) ( IN-AIRPLANE ?AUTO_11826 ?AUTO_11831 ) ( AIRPLANE-AT ?AUTO_11831 ?AUTO_11828 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11826 ?AUTO_11831 ?AUTO_11828 )
      ( DELIVER-PKG ?AUTO_11826 ?AUTO_11827 )
      ( DELIVER-PKG-VERIFY ?AUTO_11826 ?AUTO_11827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11832 - OBJ
      ?AUTO_11833 - LOCATION
    )
    :vars
    (
      ?AUTO_11834 - TRUCK
      ?AUTO_11836 - LOCATION
      ?AUTO_11835 - CITY
      ?AUTO_11837 - AIRPLANE
      ?AUTO_11838 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11834 ?AUTO_11836 ) ( IN-CITY ?AUTO_11836 ?AUTO_11835 ) ( IN-CITY ?AUTO_11833 ?AUTO_11835 ) ( not ( = ?AUTO_11833 ?AUTO_11836 ) ) ( IN-AIRPLANE ?AUTO_11832 ?AUTO_11837 ) ( AIRPORT ?AUTO_11838 ) ( AIRPORT ?AUTO_11836 ) ( AIRPLANE-AT ?AUTO_11837 ?AUTO_11838 ) ( not ( = ?AUTO_11838 ?AUTO_11836 ) ) ( not ( = ?AUTO_11833 ?AUTO_11838 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11837 ?AUTO_11838 ?AUTO_11836 )
      ( DELIVER-PKG ?AUTO_11832 ?AUTO_11833 )
      ( DELIVER-PKG-VERIFY ?AUTO_11832 ?AUTO_11833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11847 - OBJ
      ?AUTO_11848 - LOCATION
    )
    :vars
    (
      ?AUTO_11850 - TRUCK
      ?AUTO_11851 - LOCATION
      ?AUTO_11852 - CITY
      ?AUTO_11849 - LOCATION
      ?AUTO_11853 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11850 ?AUTO_11851 ) ( IN-CITY ?AUTO_11851 ?AUTO_11852 ) ( IN-CITY ?AUTO_11848 ?AUTO_11852 ) ( not ( = ?AUTO_11848 ?AUTO_11851 ) ) ( AIRPORT ?AUTO_11849 ) ( AIRPORT ?AUTO_11851 ) ( AIRPLANE-AT ?AUTO_11853 ?AUTO_11849 ) ( not ( = ?AUTO_11849 ?AUTO_11851 ) ) ( not ( = ?AUTO_11848 ?AUTO_11849 ) ) ( OBJ-AT ?AUTO_11847 ?AUTO_11849 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11847 ?AUTO_11853 ?AUTO_11849 )
      ( DELIVER-PKG ?AUTO_11847 ?AUTO_11848 )
      ( DELIVER-PKG-VERIFY ?AUTO_11847 ?AUTO_11848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11854 - OBJ
      ?AUTO_11855 - LOCATION
    )
    :vars
    (
      ?AUTO_11857 - TRUCK
      ?AUTO_11858 - LOCATION
      ?AUTO_11859 - CITY
      ?AUTO_11856 - LOCATION
      ?AUTO_11861 - LOCATION
      ?AUTO_11860 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11857 ?AUTO_11858 ) ( IN-CITY ?AUTO_11858 ?AUTO_11859 ) ( IN-CITY ?AUTO_11855 ?AUTO_11859 ) ( not ( = ?AUTO_11855 ?AUTO_11858 ) ) ( AIRPORT ?AUTO_11856 ) ( AIRPORT ?AUTO_11858 ) ( not ( = ?AUTO_11856 ?AUTO_11858 ) ) ( not ( = ?AUTO_11855 ?AUTO_11856 ) ) ( OBJ-AT ?AUTO_11854 ?AUTO_11856 ) ( AIRPORT ?AUTO_11861 ) ( AIRPLANE-AT ?AUTO_11860 ?AUTO_11861 ) ( not ( = ?AUTO_11861 ?AUTO_11856 ) ) ( not ( = ?AUTO_11855 ?AUTO_11861 ) ) ( not ( = ?AUTO_11858 ?AUTO_11861 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11860 ?AUTO_11861 ?AUTO_11856 )
      ( DELIVER-PKG ?AUTO_11854 ?AUTO_11855 )
      ( DELIVER-PKG-VERIFY ?AUTO_11854 ?AUTO_11855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11902 - OBJ
      ?AUTO_11903 - LOCATION
    )
    :vars
    (
      ?AUTO_11904 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11904 ?AUTO_11903 ) ( IN-TRUCK ?AUTO_11902 ?AUTO_11904 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11902 ?AUTO_11904 ?AUTO_11903 )
      ( DELIVER-PKG-VERIFY ?AUTO_11902 ?AUTO_11903 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11931 - OBJ
      ?AUTO_11932 - LOCATION
    )
    :vars
    (
      ?AUTO_11936 - LOCATION
      ?AUTO_11935 - CITY
      ?AUTO_11934 - AIRPLANE
      ?AUTO_11937 - LOCATION
      ?AUTO_11933 - TRUCK
      ?AUTO_11938 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11936 ?AUTO_11935 ) ( IN-CITY ?AUTO_11932 ?AUTO_11935 ) ( not ( = ?AUTO_11932 ?AUTO_11936 ) ) ( IN-AIRPLANE ?AUTO_11931 ?AUTO_11934 ) ( AIRPORT ?AUTO_11937 ) ( AIRPORT ?AUTO_11936 ) ( AIRPLANE-AT ?AUTO_11934 ?AUTO_11937 ) ( not ( = ?AUTO_11937 ?AUTO_11936 ) ) ( not ( = ?AUTO_11932 ?AUTO_11937 ) ) ( TRUCK-AT ?AUTO_11933 ?AUTO_11938 ) ( IN-CITY ?AUTO_11938 ?AUTO_11935 ) ( not ( = ?AUTO_11936 ?AUTO_11938 ) ) ( not ( = ?AUTO_11932 ?AUTO_11938 ) ) ( not ( = ?AUTO_11937 ?AUTO_11938 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11933 ?AUTO_11938 ?AUTO_11936 ?AUTO_11935 )
      ( DELIVER-PKG ?AUTO_11931 ?AUTO_11932 )
      ( DELIVER-PKG-VERIFY ?AUTO_11931 ?AUTO_11932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11941 - OBJ
      ?AUTO_11942 - LOCATION
    )
    :vars
    (
      ?AUTO_11944 - LOCATION
      ?AUTO_11947 - CITY
      ?AUTO_11946 - AIRPLANE
      ?AUTO_11943 - LOCATION
      ?AUTO_11948 - LOCATION
      ?AUTO_11945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11944 ?AUTO_11947 ) ( IN-CITY ?AUTO_11942 ?AUTO_11947 ) ( not ( = ?AUTO_11942 ?AUTO_11944 ) ) ( IN-AIRPLANE ?AUTO_11941 ?AUTO_11946 ) ( AIRPORT ?AUTO_11943 ) ( AIRPORT ?AUTO_11944 ) ( AIRPLANE-AT ?AUTO_11946 ?AUTO_11943 ) ( not ( = ?AUTO_11943 ?AUTO_11944 ) ) ( not ( = ?AUTO_11942 ?AUTO_11943 ) ) ( IN-CITY ?AUTO_11948 ?AUTO_11947 ) ( not ( = ?AUTO_11944 ?AUTO_11948 ) ) ( not ( = ?AUTO_11942 ?AUTO_11948 ) ) ( not ( = ?AUTO_11943 ?AUTO_11948 ) ) ( TRUCK-AT ?AUTO_11945 ?AUTO_11942 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11945 ?AUTO_11942 ?AUTO_11948 ?AUTO_11947 )
      ( DELIVER-PKG ?AUTO_11941 ?AUTO_11942 )
      ( DELIVER-PKG-VERIFY ?AUTO_11941 ?AUTO_11942 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11965 - OBJ
      ?AUTO_11966 - LOCATION
    )
    :vars
    (
      ?AUTO_11970 - LOCATION
      ?AUTO_11969 - CITY
      ?AUTO_11968 - LOCATION
      ?AUTO_11967 - AIRPLANE
      ?AUTO_11971 - LOCATION
      ?AUTO_11972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11970 ?AUTO_11969 ) ( IN-CITY ?AUTO_11966 ?AUTO_11969 ) ( not ( = ?AUTO_11966 ?AUTO_11970 ) ) ( AIRPORT ?AUTO_11968 ) ( AIRPORT ?AUTO_11970 ) ( AIRPLANE-AT ?AUTO_11967 ?AUTO_11968 ) ( not ( = ?AUTO_11968 ?AUTO_11970 ) ) ( not ( = ?AUTO_11966 ?AUTO_11968 ) ) ( IN-CITY ?AUTO_11971 ?AUTO_11969 ) ( not ( = ?AUTO_11970 ?AUTO_11971 ) ) ( not ( = ?AUTO_11966 ?AUTO_11971 ) ) ( not ( = ?AUTO_11968 ?AUTO_11971 ) ) ( TRUCK-AT ?AUTO_11972 ?AUTO_11966 ) ( OBJ-AT ?AUTO_11965 ?AUTO_11968 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11965 ?AUTO_11967 ?AUTO_11968 )
      ( DELIVER-PKG ?AUTO_11965 ?AUTO_11966 )
      ( DELIVER-PKG-VERIFY ?AUTO_11965 ?AUTO_11966 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11973 - OBJ
      ?AUTO_11974 - LOCATION
    )
    :vars
    (
      ?AUTO_11976 - LOCATION
      ?AUTO_11975 - CITY
      ?AUTO_11978 - LOCATION
      ?AUTO_11980 - AIRPLANE
      ?AUTO_11979 - LOCATION
      ?AUTO_11977 - TRUCK
      ?AUTO_11981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11976 ?AUTO_11975 ) ( IN-CITY ?AUTO_11974 ?AUTO_11975 ) ( not ( = ?AUTO_11974 ?AUTO_11976 ) ) ( AIRPORT ?AUTO_11978 ) ( AIRPORT ?AUTO_11976 ) ( AIRPLANE-AT ?AUTO_11980 ?AUTO_11978 ) ( not ( = ?AUTO_11978 ?AUTO_11976 ) ) ( not ( = ?AUTO_11974 ?AUTO_11978 ) ) ( IN-CITY ?AUTO_11979 ?AUTO_11975 ) ( not ( = ?AUTO_11976 ?AUTO_11979 ) ) ( not ( = ?AUTO_11974 ?AUTO_11979 ) ) ( not ( = ?AUTO_11978 ?AUTO_11979 ) ) ( TRUCK-AT ?AUTO_11977 ?AUTO_11974 ) ( TRUCK-AT ?AUTO_11981 ?AUTO_11978 ) ( IN-TRUCK ?AUTO_11973 ?AUTO_11981 ) ( not ( = ?AUTO_11977 ?AUTO_11981 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11973 ?AUTO_11981 ?AUTO_11978 )
      ( DELIVER-PKG ?AUTO_11973 ?AUTO_11974 )
      ( DELIVER-PKG-VERIFY ?AUTO_11973 ?AUTO_11974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11982 - OBJ
      ?AUTO_11983 - LOCATION
    )
    :vars
    (
      ?AUTO_11984 - LOCATION
      ?AUTO_11986 - CITY
      ?AUTO_11989 - LOCATION
      ?AUTO_11985 - AIRPLANE
      ?AUTO_11987 - LOCATION
      ?AUTO_11988 - TRUCK
      ?AUTO_11990 - TRUCK
      ?AUTO_11991 - LOCATION
      ?AUTO_11992 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11984 ?AUTO_11986 ) ( IN-CITY ?AUTO_11983 ?AUTO_11986 ) ( not ( = ?AUTO_11983 ?AUTO_11984 ) ) ( AIRPORT ?AUTO_11989 ) ( AIRPORT ?AUTO_11984 ) ( AIRPLANE-AT ?AUTO_11985 ?AUTO_11989 ) ( not ( = ?AUTO_11989 ?AUTO_11984 ) ) ( not ( = ?AUTO_11983 ?AUTO_11989 ) ) ( IN-CITY ?AUTO_11987 ?AUTO_11986 ) ( not ( = ?AUTO_11984 ?AUTO_11987 ) ) ( not ( = ?AUTO_11983 ?AUTO_11987 ) ) ( not ( = ?AUTO_11989 ?AUTO_11987 ) ) ( TRUCK-AT ?AUTO_11988 ?AUTO_11983 ) ( IN-TRUCK ?AUTO_11982 ?AUTO_11990 ) ( not ( = ?AUTO_11988 ?AUTO_11990 ) ) ( TRUCK-AT ?AUTO_11990 ?AUTO_11991 ) ( IN-CITY ?AUTO_11991 ?AUTO_11992 ) ( IN-CITY ?AUTO_11989 ?AUTO_11992 ) ( not ( = ?AUTO_11989 ?AUTO_11991 ) ) ( not ( = ?AUTO_11983 ?AUTO_11991 ) ) ( not ( = ?AUTO_11984 ?AUTO_11991 ) ) ( not ( = ?AUTO_11986 ?AUTO_11992 ) ) ( not ( = ?AUTO_11987 ?AUTO_11991 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11990 ?AUTO_11991 ?AUTO_11989 ?AUTO_11992 )
      ( DELIVER-PKG ?AUTO_11982 ?AUTO_11983 )
      ( DELIVER-PKG-VERIFY ?AUTO_11982 ?AUTO_11983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11993 - OBJ
      ?AUTO_11994 - LOCATION
    )
    :vars
    (
      ?AUTO_11996 - LOCATION
      ?AUTO_11995 - CITY
      ?AUTO_12000 - LOCATION
      ?AUTO_11998 - AIRPLANE
      ?AUTO_11999 - LOCATION
      ?AUTO_11997 - TRUCK
      ?AUTO_12001 - TRUCK
      ?AUTO_12002 - LOCATION
      ?AUTO_12003 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11996 ?AUTO_11995 ) ( IN-CITY ?AUTO_11994 ?AUTO_11995 ) ( not ( = ?AUTO_11994 ?AUTO_11996 ) ) ( AIRPORT ?AUTO_12000 ) ( AIRPORT ?AUTO_11996 ) ( AIRPLANE-AT ?AUTO_11998 ?AUTO_12000 ) ( not ( = ?AUTO_12000 ?AUTO_11996 ) ) ( not ( = ?AUTO_11994 ?AUTO_12000 ) ) ( IN-CITY ?AUTO_11999 ?AUTO_11995 ) ( not ( = ?AUTO_11996 ?AUTO_11999 ) ) ( not ( = ?AUTO_11994 ?AUTO_11999 ) ) ( not ( = ?AUTO_12000 ?AUTO_11999 ) ) ( TRUCK-AT ?AUTO_11997 ?AUTO_11994 ) ( not ( = ?AUTO_11997 ?AUTO_12001 ) ) ( TRUCK-AT ?AUTO_12001 ?AUTO_12002 ) ( IN-CITY ?AUTO_12002 ?AUTO_12003 ) ( IN-CITY ?AUTO_12000 ?AUTO_12003 ) ( not ( = ?AUTO_12000 ?AUTO_12002 ) ) ( not ( = ?AUTO_11994 ?AUTO_12002 ) ) ( not ( = ?AUTO_11996 ?AUTO_12002 ) ) ( not ( = ?AUTO_11995 ?AUTO_12003 ) ) ( not ( = ?AUTO_11999 ?AUTO_12002 ) ) ( OBJ-AT ?AUTO_11993 ?AUTO_12002 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11993 ?AUTO_12001 ?AUTO_12002 )
      ( DELIVER-PKG ?AUTO_11993 ?AUTO_11994 )
      ( DELIVER-PKG-VERIFY ?AUTO_11993 ?AUTO_11994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12004 - OBJ
      ?AUTO_12005 - LOCATION
    )
    :vars
    (
      ?AUTO_12006 - LOCATION
      ?AUTO_12008 - CITY
      ?AUTO_12007 - LOCATION
      ?AUTO_12009 - AIRPLANE
      ?AUTO_12012 - LOCATION
      ?AUTO_12010 - TRUCK
      ?AUTO_12011 - TRUCK
      ?AUTO_12013 - LOCATION
      ?AUTO_12014 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12006 ?AUTO_12008 ) ( IN-CITY ?AUTO_12005 ?AUTO_12008 ) ( not ( = ?AUTO_12005 ?AUTO_12006 ) ) ( AIRPORT ?AUTO_12007 ) ( AIRPORT ?AUTO_12006 ) ( AIRPLANE-AT ?AUTO_12009 ?AUTO_12007 ) ( not ( = ?AUTO_12007 ?AUTO_12006 ) ) ( not ( = ?AUTO_12005 ?AUTO_12007 ) ) ( IN-CITY ?AUTO_12012 ?AUTO_12008 ) ( not ( = ?AUTO_12006 ?AUTO_12012 ) ) ( not ( = ?AUTO_12005 ?AUTO_12012 ) ) ( not ( = ?AUTO_12007 ?AUTO_12012 ) ) ( TRUCK-AT ?AUTO_12010 ?AUTO_12005 ) ( not ( = ?AUTO_12010 ?AUTO_12011 ) ) ( IN-CITY ?AUTO_12013 ?AUTO_12014 ) ( IN-CITY ?AUTO_12007 ?AUTO_12014 ) ( not ( = ?AUTO_12007 ?AUTO_12013 ) ) ( not ( = ?AUTO_12005 ?AUTO_12013 ) ) ( not ( = ?AUTO_12006 ?AUTO_12013 ) ) ( not ( = ?AUTO_12008 ?AUTO_12014 ) ) ( not ( = ?AUTO_12012 ?AUTO_12013 ) ) ( OBJ-AT ?AUTO_12004 ?AUTO_12013 ) ( TRUCK-AT ?AUTO_12011 ?AUTO_12007 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12011 ?AUTO_12007 ?AUTO_12013 ?AUTO_12014 )
      ( DELIVER-PKG ?AUTO_12004 ?AUTO_12005 )
      ( DELIVER-PKG-VERIFY ?AUTO_12004 ?AUTO_12005 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12021 - OBJ
      ?AUTO_12022 - LOCATION
    )
    :vars
    (
      ?AUTO_12023 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12021 ?AUTO_12023 ) ( AIRPLANE-AT ?AUTO_12023 ?AUTO_12022 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12021 ?AUTO_12023 ?AUTO_12022 )
      ( DELIVER-PKG-VERIFY ?AUTO_12021 ?AUTO_12022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12028 - OBJ
      ?AUTO_12029 - LOCATION
    )
    :vars
    (
      ?AUTO_12030 - AIRPLANE
      ?AUTO_12031 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12028 ?AUTO_12030 ) ( AIRPORT ?AUTO_12031 ) ( AIRPORT ?AUTO_12029 ) ( AIRPLANE-AT ?AUTO_12030 ?AUTO_12031 ) ( not ( = ?AUTO_12031 ?AUTO_12029 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12030 ?AUTO_12031 ?AUTO_12029 )
      ( DELIVER-PKG ?AUTO_12028 ?AUTO_12029 )
      ( DELIVER-PKG-VERIFY ?AUTO_12028 ?AUTO_12029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12040 - OBJ
      ?AUTO_12041 - LOCATION
    )
    :vars
    (
      ?AUTO_12042 - LOCATION
      ?AUTO_12043 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12042 ) ( AIRPORT ?AUTO_12041 ) ( AIRPLANE-AT ?AUTO_12043 ?AUTO_12042 ) ( not ( = ?AUTO_12042 ?AUTO_12041 ) ) ( OBJ-AT ?AUTO_12040 ?AUTO_12042 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12040 ?AUTO_12043 ?AUTO_12042 )
      ( DELIVER-PKG ?AUTO_12040 ?AUTO_12041 )
      ( DELIVER-PKG-VERIFY ?AUTO_12040 ?AUTO_12041 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12054 - OBJ
      ?AUTO_12055 - LOCATION
    )
    :vars
    (
      ?AUTO_12056 - TRUCK
      ?AUTO_12061 - LOCATION
      ?AUTO_12057 - CITY
      ?AUTO_12059 - LOCATION
      ?AUTO_12060 - LOCATION
      ?AUTO_12058 - AIRPLANE
      ?AUTO_12062 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12056 ?AUTO_12061 ) ( IN-CITY ?AUTO_12061 ?AUTO_12057 ) ( IN-CITY ?AUTO_12055 ?AUTO_12057 ) ( not ( = ?AUTO_12055 ?AUTO_12061 ) ) ( AIRPORT ?AUTO_12059 ) ( AIRPORT ?AUTO_12061 ) ( not ( = ?AUTO_12059 ?AUTO_12061 ) ) ( not ( = ?AUTO_12055 ?AUTO_12059 ) ) ( AIRPORT ?AUTO_12060 ) ( AIRPLANE-AT ?AUTO_12058 ?AUTO_12060 ) ( not ( = ?AUTO_12060 ?AUTO_12059 ) ) ( not ( = ?AUTO_12055 ?AUTO_12060 ) ) ( not ( = ?AUTO_12061 ?AUTO_12060 ) ) ( TRUCK-AT ?AUTO_12062 ?AUTO_12059 ) ( IN-TRUCK ?AUTO_12054 ?AUTO_12062 ) ( not ( = ?AUTO_12056 ?AUTO_12062 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12054 ?AUTO_12062 ?AUTO_12059 )
      ( DELIVER-PKG ?AUTO_12054 ?AUTO_12055 )
      ( DELIVER-PKG-VERIFY ?AUTO_12054 ?AUTO_12055 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12063 - OBJ
      ?AUTO_12064 - LOCATION
    )
    :vars
    (
      ?AUTO_12066 - TRUCK
      ?AUTO_12067 - LOCATION
      ?AUTO_12068 - CITY
      ?AUTO_12071 - LOCATION
      ?AUTO_12070 - LOCATION
      ?AUTO_12069 - AIRPLANE
      ?AUTO_12065 - TRUCK
      ?AUTO_12072 - LOCATION
      ?AUTO_12073 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12066 ?AUTO_12067 ) ( IN-CITY ?AUTO_12067 ?AUTO_12068 ) ( IN-CITY ?AUTO_12064 ?AUTO_12068 ) ( not ( = ?AUTO_12064 ?AUTO_12067 ) ) ( AIRPORT ?AUTO_12071 ) ( AIRPORT ?AUTO_12067 ) ( not ( = ?AUTO_12071 ?AUTO_12067 ) ) ( not ( = ?AUTO_12064 ?AUTO_12071 ) ) ( AIRPORT ?AUTO_12070 ) ( AIRPLANE-AT ?AUTO_12069 ?AUTO_12070 ) ( not ( = ?AUTO_12070 ?AUTO_12071 ) ) ( not ( = ?AUTO_12064 ?AUTO_12070 ) ) ( not ( = ?AUTO_12067 ?AUTO_12070 ) ) ( IN-TRUCK ?AUTO_12063 ?AUTO_12065 ) ( not ( = ?AUTO_12066 ?AUTO_12065 ) ) ( TRUCK-AT ?AUTO_12065 ?AUTO_12072 ) ( IN-CITY ?AUTO_12072 ?AUTO_12073 ) ( IN-CITY ?AUTO_12071 ?AUTO_12073 ) ( not ( = ?AUTO_12071 ?AUTO_12072 ) ) ( not ( = ?AUTO_12064 ?AUTO_12072 ) ) ( not ( = ?AUTO_12067 ?AUTO_12072 ) ) ( not ( = ?AUTO_12068 ?AUTO_12073 ) ) ( not ( = ?AUTO_12070 ?AUTO_12072 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12065 ?AUTO_12072 ?AUTO_12071 ?AUTO_12073 )
      ( DELIVER-PKG ?AUTO_12063 ?AUTO_12064 )
      ( DELIVER-PKG-VERIFY ?AUTO_12063 ?AUTO_12064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12074 - OBJ
      ?AUTO_12075 - LOCATION
    )
    :vars
    (
      ?AUTO_12076 - TRUCK
      ?AUTO_12082 - LOCATION
      ?AUTO_12083 - CITY
      ?AUTO_12077 - LOCATION
      ?AUTO_12078 - LOCATION
      ?AUTO_12084 - AIRPLANE
      ?AUTO_12079 - TRUCK
      ?AUTO_12081 - LOCATION
      ?AUTO_12080 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12076 ?AUTO_12082 ) ( IN-CITY ?AUTO_12082 ?AUTO_12083 ) ( IN-CITY ?AUTO_12075 ?AUTO_12083 ) ( not ( = ?AUTO_12075 ?AUTO_12082 ) ) ( AIRPORT ?AUTO_12077 ) ( AIRPORT ?AUTO_12082 ) ( not ( = ?AUTO_12077 ?AUTO_12082 ) ) ( not ( = ?AUTO_12075 ?AUTO_12077 ) ) ( AIRPORT ?AUTO_12078 ) ( AIRPLANE-AT ?AUTO_12084 ?AUTO_12078 ) ( not ( = ?AUTO_12078 ?AUTO_12077 ) ) ( not ( = ?AUTO_12075 ?AUTO_12078 ) ) ( not ( = ?AUTO_12082 ?AUTO_12078 ) ) ( not ( = ?AUTO_12076 ?AUTO_12079 ) ) ( TRUCK-AT ?AUTO_12079 ?AUTO_12081 ) ( IN-CITY ?AUTO_12081 ?AUTO_12080 ) ( IN-CITY ?AUTO_12077 ?AUTO_12080 ) ( not ( = ?AUTO_12077 ?AUTO_12081 ) ) ( not ( = ?AUTO_12075 ?AUTO_12081 ) ) ( not ( = ?AUTO_12082 ?AUTO_12081 ) ) ( not ( = ?AUTO_12083 ?AUTO_12080 ) ) ( not ( = ?AUTO_12078 ?AUTO_12081 ) ) ( OBJ-AT ?AUTO_12074 ?AUTO_12081 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12074 ?AUTO_12079 ?AUTO_12081 )
      ( DELIVER-PKG ?AUTO_12074 ?AUTO_12075 )
      ( DELIVER-PKG-VERIFY ?AUTO_12074 ?AUTO_12075 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12085 - OBJ
      ?AUTO_12086 - LOCATION
    )
    :vars
    (
      ?AUTO_12087 - TRUCK
      ?AUTO_12091 - LOCATION
      ?AUTO_12094 - CITY
      ?AUTO_12088 - LOCATION
      ?AUTO_12089 - LOCATION
      ?AUTO_12095 - AIRPLANE
      ?AUTO_12093 - TRUCK
      ?AUTO_12092 - LOCATION
      ?AUTO_12090 - CITY
      ?AUTO_12096 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12087 ?AUTO_12091 ) ( IN-CITY ?AUTO_12091 ?AUTO_12094 ) ( IN-CITY ?AUTO_12086 ?AUTO_12094 ) ( not ( = ?AUTO_12086 ?AUTO_12091 ) ) ( AIRPORT ?AUTO_12088 ) ( AIRPORT ?AUTO_12091 ) ( not ( = ?AUTO_12088 ?AUTO_12091 ) ) ( not ( = ?AUTO_12086 ?AUTO_12088 ) ) ( AIRPORT ?AUTO_12089 ) ( AIRPLANE-AT ?AUTO_12095 ?AUTO_12089 ) ( not ( = ?AUTO_12089 ?AUTO_12088 ) ) ( not ( = ?AUTO_12086 ?AUTO_12089 ) ) ( not ( = ?AUTO_12091 ?AUTO_12089 ) ) ( not ( = ?AUTO_12087 ?AUTO_12093 ) ) ( IN-CITY ?AUTO_12092 ?AUTO_12090 ) ( IN-CITY ?AUTO_12088 ?AUTO_12090 ) ( not ( = ?AUTO_12088 ?AUTO_12092 ) ) ( not ( = ?AUTO_12086 ?AUTO_12092 ) ) ( not ( = ?AUTO_12091 ?AUTO_12092 ) ) ( not ( = ?AUTO_12094 ?AUTO_12090 ) ) ( not ( = ?AUTO_12089 ?AUTO_12092 ) ) ( OBJ-AT ?AUTO_12085 ?AUTO_12092 ) ( TRUCK-AT ?AUTO_12093 ?AUTO_12096 ) ( IN-CITY ?AUTO_12096 ?AUTO_12090 ) ( not ( = ?AUTO_12092 ?AUTO_12096 ) ) ( not ( = ?AUTO_12086 ?AUTO_12096 ) ) ( not ( = ?AUTO_12091 ?AUTO_12096 ) ) ( not ( = ?AUTO_12088 ?AUTO_12096 ) ) ( not ( = ?AUTO_12089 ?AUTO_12096 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12093 ?AUTO_12096 ?AUTO_12092 ?AUTO_12090 )
      ( DELIVER-PKG ?AUTO_12085 ?AUTO_12086 )
      ( DELIVER-PKG-VERIFY ?AUTO_12085 ?AUTO_12086 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12099 - OBJ
      ?AUTO_12100 - LOCATION
    )
    :vars
    (
      ?AUTO_12101 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12101 ?AUTO_12100 ) ( IN-TRUCK ?AUTO_12099 ?AUTO_12101 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12099 ?AUTO_12101 ?AUTO_12100 )
      ( DELIVER-PKG-VERIFY ?AUTO_12099 ?AUTO_12100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12108 - OBJ
      ?AUTO_12109 - LOCATION
    )
    :vars
    (
      ?AUTO_12110 - TRUCK
      ?AUTO_12111 - LOCATION
      ?AUTO_12112 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_12108 ?AUTO_12110 ) ( TRUCK-AT ?AUTO_12110 ?AUTO_12111 ) ( IN-CITY ?AUTO_12111 ?AUTO_12112 ) ( IN-CITY ?AUTO_12109 ?AUTO_12112 ) ( not ( = ?AUTO_12109 ?AUTO_12111 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12110 ?AUTO_12111 ?AUTO_12109 ?AUTO_12112 )
      ( DELIVER-PKG ?AUTO_12108 ?AUTO_12109 )
      ( DELIVER-PKG-VERIFY ?AUTO_12108 ?AUTO_12109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12113 - OBJ
      ?AUTO_12114 - LOCATION
    )
    :vars
    (
      ?AUTO_12115 - TRUCK
      ?AUTO_12116 - LOCATION
      ?AUTO_12117 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12115 ?AUTO_12116 ) ( IN-CITY ?AUTO_12116 ?AUTO_12117 ) ( IN-CITY ?AUTO_12114 ?AUTO_12117 ) ( not ( = ?AUTO_12114 ?AUTO_12116 ) ) ( OBJ-AT ?AUTO_12113 ?AUTO_12116 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12113 ?AUTO_12115 ?AUTO_12116 )
      ( DELIVER-PKG ?AUTO_12113 ?AUTO_12114 )
      ( DELIVER-PKG-VERIFY ?AUTO_12113 ?AUTO_12114 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12122 - OBJ
      ?AUTO_12123 - LOCATION
    )
    :vars
    (
      ?AUTO_12124 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12124 ?AUTO_12123 ) ( IN-TRUCK ?AUTO_12122 ?AUTO_12124 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12122 ?AUTO_12124 ?AUTO_12123 )
      ( DELIVER-PKG-VERIFY ?AUTO_12122 ?AUTO_12123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12127 - OBJ
      ?AUTO_12128 - LOCATION
    )
    :vars
    (
      ?AUTO_12129 - TRUCK
      ?AUTO_12130 - LOCATION
      ?AUTO_12131 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_12127 ?AUTO_12129 ) ( TRUCK-AT ?AUTO_12129 ?AUTO_12130 ) ( IN-CITY ?AUTO_12130 ?AUTO_12131 ) ( IN-CITY ?AUTO_12128 ?AUTO_12131 ) ( not ( = ?AUTO_12128 ?AUTO_12130 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12129 ?AUTO_12130 ?AUTO_12128 ?AUTO_12131 )
      ( DELIVER-PKG ?AUTO_12127 ?AUTO_12128 )
      ( DELIVER-PKG-VERIFY ?AUTO_12127 ?AUTO_12128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12134 - OBJ
      ?AUTO_12135 - LOCATION
    )
    :vars
    (
      ?AUTO_12136 - TRUCK
      ?AUTO_12138 - LOCATION
      ?AUTO_12137 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12136 ?AUTO_12138 ) ( IN-CITY ?AUTO_12138 ?AUTO_12137 ) ( IN-CITY ?AUTO_12135 ?AUTO_12137 ) ( not ( = ?AUTO_12135 ?AUTO_12138 ) ) ( OBJ-AT ?AUTO_12134 ?AUTO_12138 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12134 ?AUTO_12136 ?AUTO_12138 )
      ( DELIVER-PKG ?AUTO_12134 ?AUTO_12135 )
      ( DELIVER-PKG-VERIFY ?AUTO_12134 ?AUTO_12135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12143 - OBJ
      ?AUTO_12144 - LOCATION
    )
    :vars
    (
      ?AUTO_12146 - LOCATION
      ?AUTO_12145 - CITY
      ?AUTO_12147 - TRUCK
      ?AUTO_12148 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12146 ?AUTO_12145 ) ( IN-CITY ?AUTO_12144 ?AUTO_12145 ) ( not ( = ?AUTO_12144 ?AUTO_12146 ) ) ( OBJ-AT ?AUTO_12143 ?AUTO_12146 ) ( TRUCK-AT ?AUTO_12147 ?AUTO_12148 ) ( IN-CITY ?AUTO_12148 ?AUTO_12145 ) ( not ( = ?AUTO_12146 ?AUTO_12148 ) ) ( not ( = ?AUTO_12144 ?AUTO_12148 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12147 ?AUTO_12148 ?AUTO_12146 ?AUTO_12145 )
      ( DELIVER-PKG ?AUTO_12143 ?AUTO_12144 )
      ( DELIVER-PKG-VERIFY ?AUTO_12143 ?AUTO_12144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12151 - OBJ
      ?AUTO_12152 - LOCATION
    )
    :vars
    (
      ?AUTO_12153 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12153 ?AUTO_12152 ) ( IN-TRUCK ?AUTO_12151 ?AUTO_12153 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12151 ?AUTO_12153 ?AUTO_12152 )
      ( DELIVER-PKG-VERIFY ?AUTO_12151 ?AUTO_12152 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12160 - OBJ
      ?AUTO_12161 - LOCATION
    )
    :vars
    (
      ?AUTO_12163 - TRUCK
      ?AUTO_12162 - LOCATION
      ?AUTO_12164 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12163 ?AUTO_12162 ) ( IN-CITY ?AUTO_12162 ?AUTO_12164 ) ( IN-CITY ?AUTO_12161 ?AUTO_12164 ) ( not ( = ?AUTO_12161 ?AUTO_12162 ) ) ( OBJ-AT ?AUTO_12160 ?AUTO_12162 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12160 ?AUTO_12163 ?AUTO_12162 )
      ( DELIVER-PKG ?AUTO_12160 ?AUTO_12161 )
      ( DELIVER-PKG-VERIFY ?AUTO_12160 ?AUTO_12161 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12175 - OBJ
      ?AUTO_12176 - LOCATION
    )
    :vars
    (
      ?AUTO_12177 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12175 ?AUTO_12177 ) ( AIRPLANE-AT ?AUTO_12177 ?AUTO_12176 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12175 ?AUTO_12177 ?AUTO_12176 )
      ( DELIVER-PKG-VERIFY ?AUTO_12175 ?AUTO_12176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12182 - OBJ
      ?AUTO_12183 - LOCATION
    )
    :vars
    (
      ?AUTO_12184 - AIRPLANE
      ?AUTO_12185 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12182 ?AUTO_12184 ) ( AIRPORT ?AUTO_12185 ) ( AIRPORT ?AUTO_12183 ) ( AIRPLANE-AT ?AUTO_12184 ?AUTO_12185 ) ( not ( = ?AUTO_12185 ?AUTO_12183 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12184 ?AUTO_12185 ?AUTO_12183 )
      ( DELIVER-PKG ?AUTO_12182 ?AUTO_12183 )
      ( DELIVER-PKG-VERIFY ?AUTO_12182 ?AUTO_12183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12188 - OBJ
      ?AUTO_12189 - LOCATION
    )
    :vars
    (
      ?AUTO_12191 - LOCATION
      ?AUTO_12190 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12191 ) ( AIRPORT ?AUTO_12189 ) ( AIRPLANE-AT ?AUTO_12190 ?AUTO_12191 ) ( not ( = ?AUTO_12191 ?AUTO_12189 ) ) ( OBJ-AT ?AUTO_12188 ?AUTO_12191 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12188 ?AUTO_12190 ?AUTO_12191 )
      ( DELIVER-PKG ?AUTO_12188 ?AUTO_12189 )
      ( DELIVER-PKG-VERIFY ?AUTO_12188 ?AUTO_12189 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12194 - OBJ
      ?AUTO_12195 - LOCATION
    )
    :vars
    (
      ?AUTO_12196 - LOCATION
      ?AUTO_12198 - LOCATION
      ?AUTO_12197 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12196 ) ( AIRPORT ?AUTO_12195 ) ( not ( = ?AUTO_12196 ?AUTO_12195 ) ) ( OBJ-AT ?AUTO_12194 ?AUTO_12196 ) ( AIRPORT ?AUTO_12198 ) ( AIRPLANE-AT ?AUTO_12197 ?AUTO_12198 ) ( not ( = ?AUTO_12198 ?AUTO_12196 ) ) ( not ( = ?AUTO_12195 ?AUTO_12198 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12197 ?AUTO_12198 ?AUTO_12196 )
      ( DELIVER-PKG ?AUTO_12194 ?AUTO_12195 )
      ( DELIVER-PKG-VERIFY ?AUTO_12194 ?AUTO_12195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12205 - OBJ
      ?AUTO_12206 - LOCATION
    )
    :vars
    (
      ?AUTO_12207 - LOCATION
      ?AUTO_12209 - LOCATION
      ?AUTO_12208 - AIRPLANE
      ?AUTO_12210 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12207 ) ( AIRPORT ?AUTO_12206 ) ( not ( = ?AUTO_12207 ?AUTO_12206 ) ) ( AIRPORT ?AUTO_12209 ) ( AIRPLANE-AT ?AUTO_12208 ?AUTO_12209 ) ( not ( = ?AUTO_12209 ?AUTO_12207 ) ) ( not ( = ?AUTO_12206 ?AUTO_12209 ) ) ( TRUCK-AT ?AUTO_12210 ?AUTO_12207 ) ( IN-TRUCK ?AUTO_12205 ?AUTO_12210 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12205 ?AUTO_12210 ?AUTO_12207 )
      ( DELIVER-PKG ?AUTO_12205 ?AUTO_12206 )
      ( DELIVER-PKG-VERIFY ?AUTO_12205 ?AUTO_12206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12213 - OBJ
      ?AUTO_12214 - LOCATION
    )
    :vars
    (
      ?AUTO_12216 - LOCATION
      ?AUTO_12215 - LOCATION
      ?AUTO_12217 - AIRPLANE
      ?AUTO_12218 - TRUCK
      ?AUTO_12219 - LOCATION
      ?AUTO_12220 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12216 ) ( AIRPORT ?AUTO_12214 ) ( not ( = ?AUTO_12216 ?AUTO_12214 ) ) ( AIRPORT ?AUTO_12215 ) ( AIRPLANE-AT ?AUTO_12217 ?AUTO_12215 ) ( not ( = ?AUTO_12215 ?AUTO_12216 ) ) ( not ( = ?AUTO_12214 ?AUTO_12215 ) ) ( IN-TRUCK ?AUTO_12213 ?AUTO_12218 ) ( TRUCK-AT ?AUTO_12218 ?AUTO_12219 ) ( IN-CITY ?AUTO_12219 ?AUTO_12220 ) ( IN-CITY ?AUTO_12216 ?AUTO_12220 ) ( not ( = ?AUTO_12216 ?AUTO_12219 ) ) ( not ( = ?AUTO_12214 ?AUTO_12219 ) ) ( not ( = ?AUTO_12215 ?AUTO_12219 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12218 ?AUTO_12219 ?AUTO_12216 ?AUTO_12220 )
      ( DELIVER-PKG ?AUTO_12213 ?AUTO_12214 )
      ( DELIVER-PKG-VERIFY ?AUTO_12213 ?AUTO_12214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12223 - OBJ
      ?AUTO_12224 - LOCATION
    )
    :vars
    (
      ?AUTO_12225 - LOCATION
      ?AUTO_12226 - LOCATION
      ?AUTO_12229 - AIRPLANE
      ?AUTO_12228 - TRUCK
      ?AUTO_12227 - LOCATION
      ?AUTO_12230 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12225 ) ( AIRPORT ?AUTO_12224 ) ( not ( = ?AUTO_12225 ?AUTO_12224 ) ) ( AIRPORT ?AUTO_12226 ) ( AIRPLANE-AT ?AUTO_12229 ?AUTO_12226 ) ( not ( = ?AUTO_12226 ?AUTO_12225 ) ) ( not ( = ?AUTO_12224 ?AUTO_12226 ) ) ( TRUCK-AT ?AUTO_12228 ?AUTO_12227 ) ( IN-CITY ?AUTO_12227 ?AUTO_12230 ) ( IN-CITY ?AUTO_12225 ?AUTO_12230 ) ( not ( = ?AUTO_12225 ?AUTO_12227 ) ) ( not ( = ?AUTO_12224 ?AUTO_12227 ) ) ( not ( = ?AUTO_12226 ?AUTO_12227 ) ) ( OBJ-AT ?AUTO_12223 ?AUTO_12227 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12223 ?AUTO_12228 ?AUTO_12227 )
      ( DELIVER-PKG ?AUTO_12223 ?AUTO_12224 )
      ( DELIVER-PKG-VERIFY ?AUTO_12223 ?AUTO_12224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12235 - OBJ
      ?AUTO_12236 - LOCATION
    )
    :vars
    (
      ?AUTO_12242 - LOCATION
      ?AUTO_12241 - LOCATION
      ?AUTO_12239 - AIRPLANE
      ?AUTO_12237 - LOCATION
      ?AUTO_12238 - CITY
      ?AUTO_12240 - TRUCK
      ?AUTO_12243 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12242 ) ( AIRPORT ?AUTO_12236 ) ( not ( = ?AUTO_12242 ?AUTO_12236 ) ) ( AIRPORT ?AUTO_12241 ) ( AIRPLANE-AT ?AUTO_12239 ?AUTO_12241 ) ( not ( = ?AUTO_12241 ?AUTO_12242 ) ) ( not ( = ?AUTO_12236 ?AUTO_12241 ) ) ( IN-CITY ?AUTO_12237 ?AUTO_12238 ) ( IN-CITY ?AUTO_12242 ?AUTO_12238 ) ( not ( = ?AUTO_12242 ?AUTO_12237 ) ) ( not ( = ?AUTO_12236 ?AUTO_12237 ) ) ( not ( = ?AUTO_12241 ?AUTO_12237 ) ) ( OBJ-AT ?AUTO_12235 ?AUTO_12237 ) ( TRUCK-AT ?AUTO_12240 ?AUTO_12243 ) ( IN-CITY ?AUTO_12243 ?AUTO_12238 ) ( not ( = ?AUTO_12237 ?AUTO_12243 ) ) ( not ( = ?AUTO_12236 ?AUTO_12243 ) ) ( not ( = ?AUTO_12242 ?AUTO_12243 ) ) ( not ( = ?AUTO_12241 ?AUTO_12243 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12240 ?AUTO_12243 ?AUTO_12237 ?AUTO_12238 )
      ( DELIVER-PKG ?AUTO_12235 ?AUTO_12236 )
      ( DELIVER-PKG-VERIFY ?AUTO_12235 ?AUTO_12236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12246 - OBJ
      ?AUTO_12247 - LOCATION
    )
    :vars
    (
      ?AUTO_12248 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12246 ?AUTO_12248 ) ( AIRPLANE-AT ?AUTO_12248 ?AUTO_12247 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12246 ?AUTO_12248 ?AUTO_12247 )
      ( DELIVER-PKG-VERIFY ?AUTO_12246 ?AUTO_12247 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12249 - OBJ
      ?AUTO_12250 - LOCATION
    )
    :vars
    (
      ?AUTO_12251 - AIRPLANE
      ?AUTO_12252 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12249 ?AUTO_12251 ) ( AIRPORT ?AUTO_12252 ) ( AIRPORT ?AUTO_12250 ) ( AIRPLANE-AT ?AUTO_12251 ?AUTO_12252 ) ( not ( = ?AUTO_12252 ?AUTO_12250 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12251 ?AUTO_12252 ?AUTO_12250 )
      ( DELIVER-PKG ?AUTO_12249 ?AUTO_12250 )
      ( DELIVER-PKG-VERIFY ?AUTO_12249 ?AUTO_12250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12257 - OBJ
      ?AUTO_12258 - LOCATION
    )
    :vars
    (
      ?AUTO_12260 - LOCATION
      ?AUTO_12259 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12260 ) ( AIRPORT ?AUTO_12258 ) ( AIRPLANE-AT ?AUTO_12259 ?AUTO_12260 ) ( not ( = ?AUTO_12260 ?AUTO_12258 ) ) ( OBJ-AT ?AUTO_12257 ?AUTO_12260 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12257 ?AUTO_12259 ?AUTO_12260 )
      ( DELIVER-PKG ?AUTO_12257 ?AUTO_12258 )
      ( DELIVER-PKG-VERIFY ?AUTO_12257 ?AUTO_12258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12261 - OBJ
      ?AUTO_12262 - LOCATION
    )
    :vars
    (
      ?AUTO_12263 - LOCATION
      ?AUTO_12265 - LOCATION
      ?AUTO_12264 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12263 ) ( AIRPORT ?AUTO_12262 ) ( not ( = ?AUTO_12263 ?AUTO_12262 ) ) ( OBJ-AT ?AUTO_12261 ?AUTO_12263 ) ( AIRPORT ?AUTO_12265 ) ( AIRPLANE-AT ?AUTO_12264 ?AUTO_12265 ) ( not ( = ?AUTO_12265 ?AUTO_12263 ) ) ( not ( = ?AUTO_12262 ?AUTO_12265 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12264 ?AUTO_12265 ?AUTO_12263 )
      ( DELIVER-PKG ?AUTO_12261 ?AUTO_12262 )
      ( DELIVER-PKG-VERIFY ?AUTO_12261 ?AUTO_12262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12298 - OBJ
      ?AUTO_12299 - LOCATION
    )
    :vars
    (
      ?AUTO_12300 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12298 ?AUTO_12300 ) ( AIRPLANE-AT ?AUTO_12300 ?AUTO_12299 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12298 ?AUTO_12300 ?AUTO_12299 )
      ( DELIVER-PKG-VERIFY ?AUTO_12298 ?AUTO_12299 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12325 - OBJ
      ?AUTO_12326 - LOCATION
    )
    :vars
    (
      ?AUTO_12328 - LOCATION
      ?AUTO_12327 - LOCATION
      ?AUTO_12329 - AIRPLANE
      ?AUTO_12330 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12328 ) ( AIRPORT ?AUTO_12326 ) ( not ( = ?AUTO_12328 ?AUTO_12326 ) ) ( AIRPORT ?AUTO_12327 ) ( AIRPLANE-AT ?AUTO_12329 ?AUTO_12327 ) ( not ( = ?AUTO_12327 ?AUTO_12328 ) ) ( not ( = ?AUTO_12326 ?AUTO_12327 ) ) ( TRUCK-AT ?AUTO_12330 ?AUTO_12328 ) ( IN-TRUCK ?AUTO_12325 ?AUTO_12330 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12325 ?AUTO_12330 ?AUTO_12328 )
      ( DELIVER-PKG ?AUTO_12325 ?AUTO_12326 )
      ( DELIVER-PKG-VERIFY ?AUTO_12325 ?AUTO_12326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12337 - OBJ
      ?AUTO_12338 - LOCATION
    )
    :vars
    (
      ?AUTO_12340 - LOCATION
      ?AUTO_12339 - LOCATION
      ?AUTO_12341 - AIRPLANE
      ?AUTO_12344 - TRUCK
      ?AUTO_12343 - LOCATION
      ?AUTO_12342 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12340 ) ( AIRPORT ?AUTO_12338 ) ( not ( = ?AUTO_12340 ?AUTO_12338 ) ) ( AIRPORT ?AUTO_12339 ) ( AIRPLANE-AT ?AUTO_12341 ?AUTO_12339 ) ( not ( = ?AUTO_12339 ?AUTO_12340 ) ) ( not ( = ?AUTO_12338 ?AUTO_12339 ) ) ( TRUCK-AT ?AUTO_12344 ?AUTO_12343 ) ( IN-CITY ?AUTO_12343 ?AUTO_12342 ) ( IN-CITY ?AUTO_12340 ?AUTO_12342 ) ( not ( = ?AUTO_12340 ?AUTO_12343 ) ) ( not ( = ?AUTO_12338 ?AUTO_12343 ) ) ( not ( = ?AUTO_12339 ?AUTO_12343 ) ) ( OBJ-AT ?AUTO_12337 ?AUTO_12343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12337 ?AUTO_12344 ?AUTO_12343 )
      ( DELIVER-PKG ?AUTO_12337 ?AUTO_12338 )
      ( DELIVER-PKG-VERIFY ?AUTO_12337 ?AUTO_12338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12355 - OBJ
      ?AUTO_12356 - LOCATION
    )
    :vars
    (
      ?AUTO_12357 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12355 ?AUTO_12357 ) ( AIRPLANE-AT ?AUTO_12357 ?AUTO_12356 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12355 ?AUTO_12357 ?AUTO_12356 )
      ( DELIVER-PKG-VERIFY ?AUTO_12355 ?AUTO_12356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12358 - OBJ
      ?AUTO_12359 - LOCATION
    )
    :vars
    (
      ?AUTO_12360 - AIRPLANE
      ?AUTO_12361 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12358 ?AUTO_12360 ) ( AIRPORT ?AUTO_12361 ) ( AIRPORT ?AUTO_12359 ) ( AIRPLANE-AT ?AUTO_12360 ?AUTO_12361 ) ( not ( = ?AUTO_12361 ?AUTO_12359 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12360 ?AUTO_12361 ?AUTO_12359 )
      ( DELIVER-PKG ?AUTO_12358 ?AUTO_12359 )
      ( DELIVER-PKG-VERIFY ?AUTO_12358 ?AUTO_12359 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12408 - OBJ
      ?AUTO_12409 - LOCATION
    )
    :vars
    (
      ?AUTO_12410 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12408 ?AUTO_12410 ) ( AIRPLANE-AT ?AUTO_12410 ?AUTO_12409 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12408 ?AUTO_12410 ?AUTO_12409 )
      ( DELIVER-PKG-VERIFY ?AUTO_12408 ?AUTO_12409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12461 - OBJ
      ?AUTO_12462 - LOCATION
    )
    :vars
    (
      ?AUTO_12463 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_12461 ?AUTO_12463 ) ( AIRPLANE-AT ?AUTO_12463 ?AUTO_12462 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12461 ?AUTO_12463 ?AUTO_12462 )
      ( DELIVER-PKG-VERIFY ?AUTO_12461 ?AUTO_12462 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12478 - OBJ
      ?AUTO_12479 - LOCATION
    )
    :vars
    (
      ?AUTO_12481 - LOCATION
      ?AUTO_12480 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_12481 ) ( AIRPORT ?AUTO_12479 ) ( AIRPLANE-AT ?AUTO_12480 ?AUTO_12481 ) ( not ( = ?AUTO_12481 ?AUTO_12479 ) ) ( OBJ-AT ?AUTO_12478 ?AUTO_12481 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12478 ?AUTO_12480 ?AUTO_12481 )
      ( DELIVER-PKG ?AUTO_12478 ?AUTO_12479 )
      ( DELIVER-PKG-VERIFY ?AUTO_12478 ?AUTO_12479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12518 - OBJ
      ?AUTO_12519 - LOCATION
    )
    :vars
    (
      ?AUTO_12520 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12520 ?AUTO_12519 ) ( IN-TRUCK ?AUTO_12518 ?AUTO_12520 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12518 ?AUTO_12520 ?AUTO_12519 )
      ( DELIVER-PKG-VERIFY ?AUTO_12518 ?AUTO_12519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12521 - OBJ
      ?AUTO_12522 - LOCATION
    )
    :vars
    (
      ?AUTO_12523 - TRUCK
      ?AUTO_12524 - LOCATION
      ?AUTO_12525 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_12521 ?AUTO_12523 ) ( TRUCK-AT ?AUTO_12523 ?AUTO_12524 ) ( IN-CITY ?AUTO_12524 ?AUTO_12525 ) ( IN-CITY ?AUTO_12522 ?AUTO_12525 ) ( not ( = ?AUTO_12522 ?AUTO_12524 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12523 ?AUTO_12524 ?AUTO_12522 ?AUTO_12525 )
      ( DELIVER-PKG ?AUTO_12521 ?AUTO_12522 )
      ( DELIVER-PKG-VERIFY ?AUTO_12521 ?AUTO_12522 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12532 - OBJ
      ?AUTO_12533 - LOCATION
    )
    :vars
    (
      ?AUTO_12535 - TRUCK
      ?AUTO_12536 - LOCATION
      ?AUTO_12534 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12535 ?AUTO_12536 ) ( IN-CITY ?AUTO_12536 ?AUTO_12534 ) ( IN-CITY ?AUTO_12533 ?AUTO_12534 ) ( not ( = ?AUTO_12533 ?AUTO_12536 ) ) ( OBJ-AT ?AUTO_12532 ?AUTO_12536 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12532 ?AUTO_12535 ?AUTO_12536 )
      ( DELIVER-PKG ?AUTO_12532 ?AUTO_12533 )
      ( DELIVER-PKG-VERIFY ?AUTO_12532 ?AUTO_12533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12547 - OBJ
      ?AUTO_12548 - LOCATION
    )
    :vars
    (
      ?AUTO_12551 - TRUCK
      ?AUTO_12550 - LOCATION
      ?AUTO_12549 - CITY
      ?AUTO_12552 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12551 ?AUTO_12550 ) ( IN-CITY ?AUTO_12550 ?AUTO_12549 ) ( IN-CITY ?AUTO_12548 ?AUTO_12549 ) ( not ( = ?AUTO_12548 ?AUTO_12550 ) ) ( IN-AIRPLANE ?AUTO_12547 ?AUTO_12552 ) ( AIRPLANE-AT ?AUTO_12552 ?AUTO_12550 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12547 ?AUTO_12552 ?AUTO_12550 )
      ( DELIVER-PKG ?AUTO_12547 ?AUTO_12548 )
      ( DELIVER-PKG-VERIFY ?AUTO_12547 ?AUTO_12548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12553 - OBJ
      ?AUTO_12554 - LOCATION
    )
    :vars
    (
      ?AUTO_12556 - TRUCK
      ?AUTO_12557 - LOCATION
      ?AUTO_12555 - CITY
      ?AUTO_12558 - AIRPLANE
      ?AUTO_12559 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12556 ?AUTO_12557 ) ( IN-CITY ?AUTO_12557 ?AUTO_12555 ) ( IN-CITY ?AUTO_12554 ?AUTO_12555 ) ( not ( = ?AUTO_12554 ?AUTO_12557 ) ) ( IN-AIRPLANE ?AUTO_12553 ?AUTO_12558 ) ( AIRPORT ?AUTO_12559 ) ( AIRPORT ?AUTO_12557 ) ( AIRPLANE-AT ?AUTO_12558 ?AUTO_12559 ) ( not ( = ?AUTO_12559 ?AUTO_12557 ) ) ( not ( = ?AUTO_12554 ?AUTO_12559 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12558 ?AUTO_12559 ?AUTO_12557 )
      ( DELIVER-PKG ?AUTO_12553 ?AUTO_12554 )
      ( DELIVER-PKG-VERIFY ?AUTO_12553 ?AUTO_12554 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12564 - OBJ
      ?AUTO_12565 - LOCATION
    )
    :vars
    (
      ?AUTO_12566 - TRUCK
      ?AUTO_12568 - LOCATION
      ?AUTO_12567 - CITY
      ?AUTO_12569 - LOCATION
      ?AUTO_12570 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12566 ?AUTO_12568 ) ( IN-CITY ?AUTO_12568 ?AUTO_12567 ) ( IN-CITY ?AUTO_12565 ?AUTO_12567 ) ( not ( = ?AUTO_12565 ?AUTO_12568 ) ) ( AIRPORT ?AUTO_12569 ) ( AIRPORT ?AUTO_12568 ) ( AIRPLANE-AT ?AUTO_12570 ?AUTO_12569 ) ( not ( = ?AUTO_12569 ?AUTO_12568 ) ) ( not ( = ?AUTO_12565 ?AUTO_12569 ) ) ( OBJ-AT ?AUTO_12564 ?AUTO_12569 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12564 ?AUTO_12570 ?AUTO_12569 )
      ( DELIVER-PKG ?AUTO_12564 ?AUTO_12565 )
      ( DELIVER-PKG-VERIFY ?AUTO_12564 ?AUTO_12565 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12571 - OBJ
      ?AUTO_12572 - LOCATION
    )
    :vars
    (
      ?AUTO_12573 - TRUCK
      ?AUTO_12576 - LOCATION
      ?AUTO_12574 - CITY
      ?AUTO_12575 - LOCATION
      ?AUTO_12578 - LOCATION
      ?AUTO_12577 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12573 ?AUTO_12576 ) ( IN-CITY ?AUTO_12576 ?AUTO_12574 ) ( IN-CITY ?AUTO_12572 ?AUTO_12574 ) ( not ( = ?AUTO_12572 ?AUTO_12576 ) ) ( AIRPORT ?AUTO_12575 ) ( AIRPORT ?AUTO_12576 ) ( not ( = ?AUTO_12575 ?AUTO_12576 ) ) ( not ( = ?AUTO_12572 ?AUTO_12575 ) ) ( OBJ-AT ?AUTO_12571 ?AUTO_12575 ) ( AIRPORT ?AUTO_12578 ) ( AIRPLANE-AT ?AUTO_12577 ?AUTO_12578 ) ( not ( = ?AUTO_12578 ?AUTO_12575 ) ) ( not ( = ?AUTO_12572 ?AUTO_12578 ) ) ( not ( = ?AUTO_12576 ?AUTO_12578 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12577 ?AUTO_12578 ?AUTO_12575 )
      ( DELIVER-PKG ?AUTO_12571 ?AUTO_12572 )
      ( DELIVER-PKG-VERIFY ?AUTO_12571 ?AUTO_12572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12595 - OBJ
      ?AUTO_12596 - LOCATION
    )
    :vars
    (
      ?AUTO_12599 - TRUCK
      ?AUTO_12597 - LOCATION
      ?AUTO_12598 - CITY
      ?AUTO_12601 - LOCATION
      ?AUTO_12600 - LOCATION
      ?AUTO_12602 - AIRPLANE
      ?AUTO_12603 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12599 ?AUTO_12597 ) ( IN-CITY ?AUTO_12597 ?AUTO_12598 ) ( IN-CITY ?AUTO_12596 ?AUTO_12598 ) ( not ( = ?AUTO_12596 ?AUTO_12597 ) ) ( AIRPORT ?AUTO_12601 ) ( AIRPORT ?AUTO_12597 ) ( not ( = ?AUTO_12601 ?AUTO_12597 ) ) ( not ( = ?AUTO_12596 ?AUTO_12601 ) ) ( AIRPORT ?AUTO_12600 ) ( AIRPLANE-AT ?AUTO_12602 ?AUTO_12600 ) ( not ( = ?AUTO_12600 ?AUTO_12601 ) ) ( not ( = ?AUTO_12596 ?AUTO_12600 ) ) ( not ( = ?AUTO_12597 ?AUTO_12600 ) ) ( TRUCK-AT ?AUTO_12603 ?AUTO_12601 ) ( IN-TRUCK ?AUTO_12595 ?AUTO_12603 ) ( not ( = ?AUTO_12599 ?AUTO_12603 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12595 ?AUTO_12603 ?AUTO_12601 )
      ( DELIVER-PKG ?AUTO_12595 ?AUTO_12596 )
      ( DELIVER-PKG-VERIFY ?AUTO_12595 ?AUTO_12596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12610 - OBJ
      ?AUTO_12611 - LOCATION
    )
    :vars
    (
      ?AUTO_12615 - TRUCK
      ?AUTO_12617 - LOCATION
      ?AUTO_12616 - CITY
      ?AUTO_12614 - LOCATION
      ?AUTO_12612 - LOCATION
      ?AUTO_12613 - AIRPLANE
      ?AUTO_12618 - TRUCK
      ?AUTO_12619 - LOCATION
      ?AUTO_12620 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12615 ?AUTO_12617 ) ( IN-CITY ?AUTO_12617 ?AUTO_12616 ) ( IN-CITY ?AUTO_12611 ?AUTO_12616 ) ( not ( = ?AUTO_12611 ?AUTO_12617 ) ) ( AIRPORT ?AUTO_12614 ) ( AIRPORT ?AUTO_12617 ) ( not ( = ?AUTO_12614 ?AUTO_12617 ) ) ( not ( = ?AUTO_12611 ?AUTO_12614 ) ) ( AIRPORT ?AUTO_12612 ) ( AIRPLANE-AT ?AUTO_12613 ?AUTO_12612 ) ( not ( = ?AUTO_12612 ?AUTO_12614 ) ) ( not ( = ?AUTO_12611 ?AUTO_12612 ) ) ( not ( = ?AUTO_12617 ?AUTO_12612 ) ) ( IN-TRUCK ?AUTO_12610 ?AUTO_12618 ) ( not ( = ?AUTO_12615 ?AUTO_12618 ) ) ( TRUCK-AT ?AUTO_12618 ?AUTO_12619 ) ( IN-CITY ?AUTO_12619 ?AUTO_12620 ) ( IN-CITY ?AUTO_12614 ?AUTO_12620 ) ( not ( = ?AUTO_12614 ?AUTO_12619 ) ) ( not ( = ?AUTO_12611 ?AUTO_12619 ) ) ( not ( = ?AUTO_12617 ?AUTO_12619 ) ) ( not ( = ?AUTO_12616 ?AUTO_12620 ) ) ( not ( = ?AUTO_12612 ?AUTO_12619 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12618 ?AUTO_12619 ?AUTO_12614 ?AUTO_12620 )
      ( DELIVER-PKG ?AUTO_12610 ?AUTO_12611 )
      ( DELIVER-PKG-VERIFY ?AUTO_12610 ?AUTO_12611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12621 - OBJ
      ?AUTO_12622 - LOCATION
    )
    :vars
    (
      ?AUTO_12628 - TRUCK
      ?AUTO_12625 - LOCATION
      ?AUTO_12629 - CITY
      ?AUTO_12630 - LOCATION
      ?AUTO_12623 - LOCATION
      ?AUTO_12624 - AIRPLANE
      ?AUTO_12626 - TRUCK
      ?AUTO_12627 - LOCATION
      ?AUTO_12631 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12628 ?AUTO_12625 ) ( IN-CITY ?AUTO_12625 ?AUTO_12629 ) ( IN-CITY ?AUTO_12622 ?AUTO_12629 ) ( not ( = ?AUTO_12622 ?AUTO_12625 ) ) ( AIRPORT ?AUTO_12630 ) ( AIRPORT ?AUTO_12625 ) ( not ( = ?AUTO_12630 ?AUTO_12625 ) ) ( not ( = ?AUTO_12622 ?AUTO_12630 ) ) ( AIRPORT ?AUTO_12623 ) ( AIRPLANE-AT ?AUTO_12624 ?AUTO_12623 ) ( not ( = ?AUTO_12623 ?AUTO_12630 ) ) ( not ( = ?AUTO_12622 ?AUTO_12623 ) ) ( not ( = ?AUTO_12625 ?AUTO_12623 ) ) ( not ( = ?AUTO_12628 ?AUTO_12626 ) ) ( TRUCK-AT ?AUTO_12626 ?AUTO_12627 ) ( IN-CITY ?AUTO_12627 ?AUTO_12631 ) ( IN-CITY ?AUTO_12630 ?AUTO_12631 ) ( not ( = ?AUTO_12630 ?AUTO_12627 ) ) ( not ( = ?AUTO_12622 ?AUTO_12627 ) ) ( not ( = ?AUTO_12625 ?AUTO_12627 ) ) ( not ( = ?AUTO_12629 ?AUTO_12631 ) ) ( not ( = ?AUTO_12623 ?AUTO_12627 ) ) ( OBJ-AT ?AUTO_12621 ?AUTO_12627 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12621 ?AUTO_12626 ?AUTO_12627 )
      ( DELIVER-PKG ?AUTO_12621 ?AUTO_12622 )
      ( DELIVER-PKG-VERIFY ?AUTO_12621 ?AUTO_12622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12636 - OBJ
      ?AUTO_12637 - LOCATION
    )
    :vars
    (
      ?AUTO_12638 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12638 ?AUTO_12637 ) ( IN-TRUCK ?AUTO_12636 ?AUTO_12638 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12636 ?AUTO_12638 ?AUTO_12637 )
      ( DELIVER-PKG-VERIFY ?AUTO_12636 ?AUTO_12637 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12649 - OBJ
      ?AUTO_12650 - LOCATION
    )
    :vars
    (
      ?AUTO_12652 - TRUCK
      ?AUTO_12653 - LOCATION
      ?AUTO_12651 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12652 ?AUTO_12653 ) ( IN-CITY ?AUTO_12653 ?AUTO_12651 ) ( IN-CITY ?AUTO_12650 ?AUTO_12651 ) ( not ( = ?AUTO_12650 ?AUTO_12653 ) ) ( OBJ-AT ?AUTO_12649 ?AUTO_12653 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12649 ?AUTO_12652 ?AUTO_12653 )
      ( DELIVER-PKG ?AUTO_12649 ?AUTO_12650 )
      ( DELIVER-PKG-VERIFY ?AUTO_12649 ?AUTO_12650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12692 - OBJ
      ?AUTO_12693 - LOCATION
    )
    :vars
    (
      ?AUTO_12699 - TRUCK
      ?AUTO_12696 - LOCATION
      ?AUTO_12695 - CITY
      ?AUTO_12697 - LOCATION
      ?AUTO_12698 - LOCATION
      ?AUTO_12694 - AIRPLANE
      ?AUTO_12700 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12699 ?AUTO_12696 ) ( IN-CITY ?AUTO_12696 ?AUTO_12695 ) ( IN-CITY ?AUTO_12693 ?AUTO_12695 ) ( not ( = ?AUTO_12693 ?AUTO_12696 ) ) ( AIRPORT ?AUTO_12697 ) ( AIRPORT ?AUTO_12696 ) ( not ( = ?AUTO_12697 ?AUTO_12696 ) ) ( not ( = ?AUTO_12693 ?AUTO_12697 ) ) ( AIRPORT ?AUTO_12698 ) ( AIRPLANE-AT ?AUTO_12694 ?AUTO_12698 ) ( not ( = ?AUTO_12698 ?AUTO_12697 ) ) ( not ( = ?AUTO_12693 ?AUTO_12698 ) ) ( not ( = ?AUTO_12696 ?AUTO_12698 ) ) ( TRUCK-AT ?AUTO_12700 ?AUTO_12697 ) ( IN-TRUCK ?AUTO_12692 ?AUTO_12700 ) ( not ( = ?AUTO_12699 ?AUTO_12700 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12692 ?AUTO_12700 ?AUTO_12697 )
      ( DELIVER-PKG ?AUTO_12692 ?AUTO_12693 )
      ( DELIVER-PKG-VERIFY ?AUTO_12692 ?AUTO_12693 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12703 - OBJ
      ?AUTO_12704 - LOCATION
    )
    :vars
    (
      ?AUTO_12707 - TRUCK
      ?AUTO_12711 - LOCATION
      ?AUTO_12708 - CITY
      ?AUTO_12709 - LOCATION
      ?AUTO_12710 - LOCATION
      ?AUTO_12705 - AIRPLANE
      ?AUTO_12706 - TRUCK
      ?AUTO_12712 - LOCATION
      ?AUTO_12713 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12707 ?AUTO_12711 ) ( IN-CITY ?AUTO_12711 ?AUTO_12708 ) ( IN-CITY ?AUTO_12704 ?AUTO_12708 ) ( not ( = ?AUTO_12704 ?AUTO_12711 ) ) ( AIRPORT ?AUTO_12709 ) ( AIRPORT ?AUTO_12711 ) ( not ( = ?AUTO_12709 ?AUTO_12711 ) ) ( not ( = ?AUTO_12704 ?AUTO_12709 ) ) ( AIRPORT ?AUTO_12710 ) ( AIRPLANE-AT ?AUTO_12705 ?AUTO_12710 ) ( not ( = ?AUTO_12710 ?AUTO_12709 ) ) ( not ( = ?AUTO_12704 ?AUTO_12710 ) ) ( not ( = ?AUTO_12711 ?AUTO_12710 ) ) ( IN-TRUCK ?AUTO_12703 ?AUTO_12706 ) ( not ( = ?AUTO_12707 ?AUTO_12706 ) ) ( TRUCK-AT ?AUTO_12706 ?AUTO_12712 ) ( IN-CITY ?AUTO_12712 ?AUTO_12713 ) ( IN-CITY ?AUTO_12709 ?AUTO_12713 ) ( not ( = ?AUTO_12709 ?AUTO_12712 ) ) ( not ( = ?AUTO_12704 ?AUTO_12712 ) ) ( not ( = ?AUTO_12711 ?AUTO_12712 ) ) ( not ( = ?AUTO_12708 ?AUTO_12713 ) ) ( not ( = ?AUTO_12710 ?AUTO_12712 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12706 ?AUTO_12712 ?AUTO_12709 ?AUTO_12713 )
      ( DELIVER-PKG ?AUTO_12703 ?AUTO_12704 )
      ( DELIVER-PKG-VERIFY ?AUTO_12703 ?AUTO_12704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12716 - OBJ
      ?AUTO_12717 - LOCATION
    )
    :vars
    (
      ?AUTO_12722 - TRUCK
      ?AUTO_12726 - LOCATION
      ?AUTO_12725 - CITY
      ?AUTO_12723 - LOCATION
      ?AUTO_12719 - LOCATION
      ?AUTO_12720 - AIRPLANE
      ?AUTO_12721 - TRUCK
      ?AUTO_12724 - LOCATION
      ?AUTO_12718 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12722 ?AUTO_12726 ) ( IN-CITY ?AUTO_12726 ?AUTO_12725 ) ( IN-CITY ?AUTO_12717 ?AUTO_12725 ) ( not ( = ?AUTO_12717 ?AUTO_12726 ) ) ( AIRPORT ?AUTO_12723 ) ( AIRPORT ?AUTO_12726 ) ( not ( = ?AUTO_12723 ?AUTO_12726 ) ) ( not ( = ?AUTO_12717 ?AUTO_12723 ) ) ( AIRPORT ?AUTO_12719 ) ( AIRPLANE-AT ?AUTO_12720 ?AUTO_12719 ) ( not ( = ?AUTO_12719 ?AUTO_12723 ) ) ( not ( = ?AUTO_12717 ?AUTO_12719 ) ) ( not ( = ?AUTO_12726 ?AUTO_12719 ) ) ( not ( = ?AUTO_12722 ?AUTO_12721 ) ) ( TRUCK-AT ?AUTO_12721 ?AUTO_12724 ) ( IN-CITY ?AUTO_12724 ?AUTO_12718 ) ( IN-CITY ?AUTO_12723 ?AUTO_12718 ) ( not ( = ?AUTO_12723 ?AUTO_12724 ) ) ( not ( = ?AUTO_12717 ?AUTO_12724 ) ) ( not ( = ?AUTO_12726 ?AUTO_12724 ) ) ( not ( = ?AUTO_12725 ?AUTO_12718 ) ) ( not ( = ?AUTO_12719 ?AUTO_12724 ) ) ( OBJ-AT ?AUTO_12716 ?AUTO_12724 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12716 ?AUTO_12721 ?AUTO_12724 )
      ( DELIVER-PKG ?AUTO_12716 ?AUTO_12717 )
      ( DELIVER-PKG-VERIFY ?AUTO_12716 ?AUTO_12717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12731 - OBJ
      ?AUTO_12732 - LOCATION
    )
    :vars
    (
      ?AUTO_12738 - TRUCK
      ?AUTO_12735 - LOCATION
      ?AUTO_12739 - CITY
      ?AUTO_12737 - LOCATION
      ?AUTO_12741 - LOCATION
      ?AUTO_12736 - AIRPLANE
      ?AUTO_12734 - TRUCK
      ?AUTO_12733 - LOCATION
      ?AUTO_12740 - CITY
      ?AUTO_12742 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12738 ?AUTO_12735 ) ( IN-CITY ?AUTO_12735 ?AUTO_12739 ) ( IN-CITY ?AUTO_12732 ?AUTO_12739 ) ( not ( = ?AUTO_12732 ?AUTO_12735 ) ) ( AIRPORT ?AUTO_12737 ) ( AIRPORT ?AUTO_12735 ) ( not ( = ?AUTO_12737 ?AUTO_12735 ) ) ( not ( = ?AUTO_12732 ?AUTO_12737 ) ) ( AIRPORT ?AUTO_12741 ) ( AIRPLANE-AT ?AUTO_12736 ?AUTO_12741 ) ( not ( = ?AUTO_12741 ?AUTO_12737 ) ) ( not ( = ?AUTO_12732 ?AUTO_12741 ) ) ( not ( = ?AUTO_12735 ?AUTO_12741 ) ) ( not ( = ?AUTO_12738 ?AUTO_12734 ) ) ( IN-CITY ?AUTO_12733 ?AUTO_12740 ) ( IN-CITY ?AUTO_12737 ?AUTO_12740 ) ( not ( = ?AUTO_12737 ?AUTO_12733 ) ) ( not ( = ?AUTO_12732 ?AUTO_12733 ) ) ( not ( = ?AUTO_12735 ?AUTO_12733 ) ) ( not ( = ?AUTO_12739 ?AUTO_12740 ) ) ( not ( = ?AUTO_12741 ?AUTO_12733 ) ) ( OBJ-AT ?AUTO_12731 ?AUTO_12733 ) ( TRUCK-AT ?AUTO_12734 ?AUTO_12742 ) ( IN-CITY ?AUTO_12742 ?AUTO_12740 ) ( not ( = ?AUTO_12733 ?AUTO_12742 ) ) ( not ( = ?AUTO_12732 ?AUTO_12742 ) ) ( not ( = ?AUTO_12735 ?AUTO_12742 ) ) ( not ( = ?AUTO_12737 ?AUTO_12742 ) ) ( not ( = ?AUTO_12741 ?AUTO_12742 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12734 ?AUTO_12742 ?AUTO_12733 ?AUTO_12740 )
      ( DELIVER-PKG ?AUTO_12731 ?AUTO_12732 )
      ( DELIVER-PKG-VERIFY ?AUTO_12731 ?AUTO_12732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12745 - OBJ
      ?AUTO_12746 - LOCATION
    )
    :vars
    (
      ?AUTO_12747 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12747 ?AUTO_12746 ) ( IN-TRUCK ?AUTO_12745 ?AUTO_12747 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12745 ?AUTO_12747 ?AUTO_12746 )
      ( DELIVER-PKG-VERIFY ?AUTO_12745 ?AUTO_12746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12750 - OBJ
      ?AUTO_12751 - LOCATION
    )
    :vars
    (
      ?AUTO_12752 - TRUCK
      ?AUTO_12753 - LOCATION
      ?AUTO_12754 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_12750 ?AUTO_12752 ) ( TRUCK-AT ?AUTO_12752 ?AUTO_12753 ) ( IN-CITY ?AUTO_12753 ?AUTO_12754 ) ( IN-CITY ?AUTO_12751 ?AUTO_12754 ) ( not ( = ?AUTO_12751 ?AUTO_12753 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12752 ?AUTO_12753 ?AUTO_12751 ?AUTO_12754 )
      ( DELIVER-PKG ?AUTO_12750 ?AUTO_12751 )
      ( DELIVER-PKG-VERIFY ?AUTO_12750 ?AUTO_12751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12759 - OBJ
      ?AUTO_12760 - LOCATION
    )
    :vars
    (
      ?AUTO_12763 - TRUCK
      ?AUTO_12761 - LOCATION
      ?AUTO_12762 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12763 ?AUTO_12761 ) ( IN-CITY ?AUTO_12761 ?AUTO_12762 ) ( IN-CITY ?AUTO_12760 ?AUTO_12762 ) ( not ( = ?AUTO_12760 ?AUTO_12761 ) ) ( OBJ-AT ?AUTO_12759 ?AUTO_12761 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12759 ?AUTO_12763 ?AUTO_12761 )
      ( DELIVER-PKG ?AUTO_12759 ?AUTO_12760 )
      ( DELIVER-PKG-VERIFY ?AUTO_12759 ?AUTO_12760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12778 - OBJ
      ?AUTO_12779 - LOCATION
    )
    :vars
    (
      ?AUTO_12782 - TRUCK
      ?AUTO_12781 - LOCATION
      ?AUTO_12780 - CITY
      ?AUTO_12783 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12782 ?AUTO_12781 ) ( IN-CITY ?AUTO_12781 ?AUTO_12780 ) ( IN-CITY ?AUTO_12779 ?AUTO_12780 ) ( not ( = ?AUTO_12779 ?AUTO_12781 ) ) ( IN-AIRPLANE ?AUTO_12778 ?AUTO_12783 ) ( AIRPLANE-AT ?AUTO_12783 ?AUTO_12781 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12778 ?AUTO_12783 ?AUTO_12781 )
      ( DELIVER-PKG ?AUTO_12778 ?AUTO_12779 )
      ( DELIVER-PKG-VERIFY ?AUTO_12778 ?AUTO_12779 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12808 - OBJ
      ?AUTO_12809 - LOCATION
    )
    :vars
    (
      ?AUTO_12814 - TRUCK
      ?AUTO_12812 - LOCATION
      ?AUTO_12813 - CITY
      ?AUTO_12815 - LOCATION
      ?AUTO_12811 - LOCATION
      ?AUTO_12810 - AIRPLANE
      ?AUTO_12816 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12814 ?AUTO_12812 ) ( IN-CITY ?AUTO_12812 ?AUTO_12813 ) ( IN-CITY ?AUTO_12809 ?AUTO_12813 ) ( not ( = ?AUTO_12809 ?AUTO_12812 ) ) ( AIRPORT ?AUTO_12815 ) ( AIRPORT ?AUTO_12812 ) ( not ( = ?AUTO_12815 ?AUTO_12812 ) ) ( not ( = ?AUTO_12809 ?AUTO_12815 ) ) ( AIRPORT ?AUTO_12811 ) ( AIRPLANE-AT ?AUTO_12810 ?AUTO_12811 ) ( not ( = ?AUTO_12811 ?AUTO_12815 ) ) ( not ( = ?AUTO_12809 ?AUTO_12811 ) ) ( not ( = ?AUTO_12812 ?AUTO_12811 ) ) ( TRUCK-AT ?AUTO_12816 ?AUTO_12815 ) ( IN-TRUCK ?AUTO_12808 ?AUTO_12816 ) ( not ( = ?AUTO_12814 ?AUTO_12816 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12808 ?AUTO_12816 ?AUTO_12815 )
      ( DELIVER-PKG ?AUTO_12808 ?AUTO_12809 )
      ( DELIVER-PKG-VERIFY ?AUTO_12808 ?AUTO_12809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12823 - OBJ
      ?AUTO_12824 - LOCATION
    )
    :vars
    (
      ?AUTO_12826 - TRUCK
      ?AUTO_12830 - LOCATION
      ?AUTO_12832 - CITY
      ?AUTO_12831 - LOCATION
      ?AUTO_12828 - LOCATION
      ?AUTO_12833 - AIRPLANE
      ?AUTO_12827 - TRUCK
      ?AUTO_12829 - LOCATION
      ?AUTO_12825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12826 ?AUTO_12830 ) ( IN-CITY ?AUTO_12830 ?AUTO_12832 ) ( IN-CITY ?AUTO_12824 ?AUTO_12832 ) ( not ( = ?AUTO_12824 ?AUTO_12830 ) ) ( AIRPORT ?AUTO_12831 ) ( AIRPORT ?AUTO_12830 ) ( not ( = ?AUTO_12831 ?AUTO_12830 ) ) ( not ( = ?AUTO_12824 ?AUTO_12831 ) ) ( AIRPORT ?AUTO_12828 ) ( AIRPLANE-AT ?AUTO_12833 ?AUTO_12828 ) ( not ( = ?AUTO_12828 ?AUTO_12831 ) ) ( not ( = ?AUTO_12824 ?AUTO_12828 ) ) ( not ( = ?AUTO_12830 ?AUTO_12828 ) ) ( not ( = ?AUTO_12826 ?AUTO_12827 ) ) ( TRUCK-AT ?AUTO_12827 ?AUTO_12829 ) ( IN-CITY ?AUTO_12829 ?AUTO_12825 ) ( IN-CITY ?AUTO_12831 ?AUTO_12825 ) ( not ( = ?AUTO_12831 ?AUTO_12829 ) ) ( not ( = ?AUTO_12824 ?AUTO_12829 ) ) ( not ( = ?AUTO_12830 ?AUTO_12829 ) ) ( not ( = ?AUTO_12832 ?AUTO_12825 ) ) ( not ( = ?AUTO_12828 ?AUTO_12829 ) ) ( OBJ-AT ?AUTO_12823 ?AUTO_12829 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12823 ?AUTO_12827 ?AUTO_12829 )
      ( DELIVER-PKG ?AUTO_12823 ?AUTO_12824 )
      ( DELIVER-PKG-VERIFY ?AUTO_12823 ?AUTO_12824 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12844 - OBJ
      ?AUTO_12845 - LOCATION
    )
    :vars
    (
      ?AUTO_12846 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12846 ?AUTO_12845 ) ( IN-TRUCK ?AUTO_12844 ?AUTO_12846 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12844 ?AUTO_12846 ?AUTO_12845 )
      ( DELIVER-PKG-VERIFY ?AUTO_12844 ?AUTO_12845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12847 - OBJ
      ?AUTO_12848 - LOCATION
    )
    :vars
    (
      ?AUTO_12849 - TRUCK
      ?AUTO_12850 - LOCATION
      ?AUTO_12851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_12847 ?AUTO_12849 ) ( TRUCK-AT ?AUTO_12849 ?AUTO_12850 ) ( IN-CITY ?AUTO_12850 ?AUTO_12851 ) ( IN-CITY ?AUTO_12848 ?AUTO_12851 ) ( not ( = ?AUTO_12848 ?AUTO_12850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12849 ?AUTO_12850 ?AUTO_12848 ?AUTO_12851 )
      ( DELIVER-PKG ?AUTO_12847 ?AUTO_12848 )
      ( DELIVER-PKG-VERIFY ?AUTO_12847 ?AUTO_12848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12854 - OBJ
      ?AUTO_12855 - LOCATION
    )
    :vars
    (
      ?AUTO_12856 - TRUCK
      ?AUTO_12858 - LOCATION
      ?AUTO_12857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12856 ?AUTO_12858 ) ( IN-CITY ?AUTO_12858 ?AUTO_12857 ) ( IN-CITY ?AUTO_12855 ?AUTO_12857 ) ( not ( = ?AUTO_12855 ?AUTO_12858 ) ) ( OBJ-AT ?AUTO_12854 ?AUTO_12858 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12854 ?AUTO_12856 ?AUTO_12858 )
      ( DELIVER-PKG ?AUTO_12854 ?AUTO_12855 )
      ( DELIVER-PKG-VERIFY ?AUTO_12854 ?AUTO_12855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12859 - OBJ
      ?AUTO_12860 - LOCATION
    )
    :vars
    (
      ?AUTO_12862 - LOCATION
      ?AUTO_12863 - CITY
      ?AUTO_12861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12862 ?AUTO_12863 ) ( IN-CITY ?AUTO_12860 ?AUTO_12863 ) ( not ( = ?AUTO_12860 ?AUTO_12862 ) ) ( OBJ-AT ?AUTO_12859 ?AUTO_12862 ) ( TRUCK-AT ?AUTO_12861 ?AUTO_12860 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_12861 ?AUTO_12860 ?AUTO_12862 ?AUTO_12863 )
      ( DELIVER-PKG ?AUTO_12859 ?AUTO_12860 )
      ( DELIVER-PKG-VERIFY ?AUTO_12859 ?AUTO_12860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12886 - OBJ
      ?AUTO_12887 - LOCATION
    )
    :vars
    (
      ?AUTO_12888 - LOCATION
      ?AUTO_12890 - CITY
      ?AUTO_12889 - TRUCK
      ?AUTO_12891 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12888 ?AUTO_12890 ) ( IN-CITY ?AUTO_12887 ?AUTO_12890 ) ( not ( = ?AUTO_12887 ?AUTO_12888 ) ) ( TRUCK-AT ?AUTO_12889 ?AUTO_12887 ) ( IN-AIRPLANE ?AUTO_12886 ?AUTO_12891 ) ( AIRPLANE-AT ?AUTO_12891 ?AUTO_12888 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12886 ?AUTO_12891 ?AUTO_12888 )
      ( DELIVER-PKG ?AUTO_12886 ?AUTO_12887 )
      ( DELIVER-PKG-VERIFY ?AUTO_12886 ?AUTO_12887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12892 - OBJ
      ?AUTO_12893 - LOCATION
    )
    :vars
    (
      ?AUTO_12895 - LOCATION
      ?AUTO_12896 - CITY
      ?AUTO_12894 - TRUCK
      ?AUTO_12897 - AIRPLANE
      ?AUTO_12898 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12895 ?AUTO_12896 ) ( IN-CITY ?AUTO_12893 ?AUTO_12896 ) ( not ( = ?AUTO_12893 ?AUTO_12895 ) ) ( TRUCK-AT ?AUTO_12894 ?AUTO_12893 ) ( IN-AIRPLANE ?AUTO_12892 ?AUTO_12897 ) ( AIRPORT ?AUTO_12898 ) ( AIRPORT ?AUTO_12895 ) ( AIRPLANE-AT ?AUTO_12897 ?AUTO_12898 ) ( not ( = ?AUTO_12898 ?AUTO_12895 ) ) ( not ( = ?AUTO_12893 ?AUTO_12898 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12897 ?AUTO_12898 ?AUTO_12895 )
      ( DELIVER-PKG ?AUTO_12892 ?AUTO_12893 )
      ( DELIVER-PKG-VERIFY ?AUTO_12892 ?AUTO_12893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12921 - OBJ
      ?AUTO_12922 - LOCATION
    )
    :vars
    (
      ?AUTO_12926 - LOCATION
      ?AUTO_12925 - CITY
      ?AUTO_12924 - TRUCK
      ?AUTO_12927 - LOCATION
      ?AUTO_12923 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12926 ?AUTO_12925 ) ( IN-CITY ?AUTO_12922 ?AUTO_12925 ) ( not ( = ?AUTO_12922 ?AUTO_12926 ) ) ( TRUCK-AT ?AUTO_12924 ?AUTO_12922 ) ( AIRPORT ?AUTO_12927 ) ( AIRPORT ?AUTO_12926 ) ( AIRPLANE-AT ?AUTO_12923 ?AUTO_12927 ) ( not ( = ?AUTO_12927 ?AUTO_12926 ) ) ( not ( = ?AUTO_12922 ?AUTO_12927 ) ) ( OBJ-AT ?AUTO_12921 ?AUTO_12927 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_12921 ?AUTO_12923 ?AUTO_12927 )
      ( DELIVER-PKG ?AUTO_12921 ?AUTO_12922 )
      ( DELIVER-PKG-VERIFY ?AUTO_12921 ?AUTO_12922 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12928 - OBJ
      ?AUTO_12929 - LOCATION
    )
    :vars
    (
      ?AUTO_12931 - LOCATION
      ?AUTO_12934 - CITY
      ?AUTO_12932 - TRUCK
      ?AUTO_12930 - LOCATION
      ?AUTO_12933 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12931 ?AUTO_12934 ) ( IN-CITY ?AUTO_12929 ?AUTO_12934 ) ( not ( = ?AUTO_12929 ?AUTO_12931 ) ) ( TRUCK-AT ?AUTO_12932 ?AUTO_12929 ) ( AIRPORT ?AUTO_12930 ) ( AIRPORT ?AUTO_12931 ) ( not ( = ?AUTO_12930 ?AUTO_12931 ) ) ( not ( = ?AUTO_12929 ?AUTO_12930 ) ) ( OBJ-AT ?AUTO_12928 ?AUTO_12930 ) ( AIRPLANE-AT ?AUTO_12933 ?AUTO_12931 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12933 ?AUTO_12931 ?AUTO_12930 )
      ( DELIVER-PKG ?AUTO_12928 ?AUTO_12929 )
      ( DELIVER-PKG-VERIFY ?AUTO_12928 ?AUTO_12929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12955 - OBJ
      ?AUTO_12956 - LOCATION
    )
    :vars
    (
      ?AUTO_12957 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12957 ?AUTO_12956 ) ( IN-TRUCK ?AUTO_12955 ?AUTO_12957 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_12955 ?AUTO_12957 ?AUTO_12956 )
      ( DELIVER-PKG-VERIFY ?AUTO_12955 ?AUTO_12956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12962 - OBJ
      ?AUTO_12963 - LOCATION
    )
    :vars
    (
      ?AUTO_12965 - TRUCK
      ?AUTO_12964 - LOCATION
      ?AUTO_12966 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_12965 ?AUTO_12964 ) ( IN-CITY ?AUTO_12964 ?AUTO_12966 ) ( IN-CITY ?AUTO_12963 ?AUTO_12966 ) ( not ( = ?AUTO_12963 ?AUTO_12964 ) ) ( OBJ-AT ?AUTO_12962 ?AUTO_12964 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_12962 ?AUTO_12965 ?AUTO_12964 )
      ( DELIVER-PKG ?AUTO_12962 ?AUTO_12963 )
      ( DELIVER-PKG-VERIFY ?AUTO_12962 ?AUTO_12963 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_12991 - OBJ
      ?AUTO_12992 - LOCATION
    )
    :vars
    (
      ?AUTO_12995 - LOCATION
      ?AUTO_12994 - CITY
      ?AUTO_12993 - TRUCK
      ?AUTO_12996 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_12995 ?AUTO_12994 ) ( IN-CITY ?AUTO_12992 ?AUTO_12994 ) ( not ( = ?AUTO_12992 ?AUTO_12995 ) ) ( TRUCK-AT ?AUTO_12993 ?AUTO_12992 ) ( IN-AIRPLANE ?AUTO_12991 ?AUTO_12996 ) ( AIRPLANE-AT ?AUTO_12996 ?AUTO_12995 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_12991 ?AUTO_12996 ?AUTO_12995 )
      ( DELIVER-PKG ?AUTO_12991 ?AUTO_12992 )
      ( DELIVER-PKG-VERIFY ?AUTO_12991 ?AUTO_12992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13019 - OBJ
      ?AUTO_13020 - LOCATION
    )
    :vars
    (
      ?AUTO_13021 - LOCATION
      ?AUTO_13025 - CITY
      ?AUTO_13023 - TRUCK
      ?AUTO_13022 - LOCATION
      ?AUTO_13024 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13021 ?AUTO_13025 ) ( IN-CITY ?AUTO_13020 ?AUTO_13025 ) ( not ( = ?AUTO_13020 ?AUTO_13021 ) ) ( TRUCK-AT ?AUTO_13023 ?AUTO_13020 ) ( AIRPORT ?AUTO_13022 ) ( AIRPORT ?AUTO_13021 ) ( AIRPLANE-AT ?AUTO_13024 ?AUTO_13022 ) ( not ( = ?AUTO_13022 ?AUTO_13021 ) ) ( not ( = ?AUTO_13020 ?AUTO_13022 ) ) ( OBJ-AT ?AUTO_13019 ?AUTO_13022 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13019 ?AUTO_13024 ?AUTO_13022 )
      ( DELIVER-PKG ?AUTO_13019 ?AUTO_13020 )
      ( DELIVER-PKG-VERIFY ?AUTO_13019 ?AUTO_13020 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13026 - OBJ
      ?AUTO_13027 - LOCATION
    )
    :vars
    (
      ?AUTO_13031 - LOCATION
      ?AUTO_13029 - CITY
      ?AUTO_13030 - TRUCK
      ?AUTO_13028 - LOCATION
      ?AUTO_13033 - LOCATION
      ?AUTO_13032 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13031 ?AUTO_13029 ) ( IN-CITY ?AUTO_13027 ?AUTO_13029 ) ( not ( = ?AUTO_13027 ?AUTO_13031 ) ) ( TRUCK-AT ?AUTO_13030 ?AUTO_13027 ) ( AIRPORT ?AUTO_13028 ) ( AIRPORT ?AUTO_13031 ) ( not ( = ?AUTO_13028 ?AUTO_13031 ) ) ( not ( = ?AUTO_13027 ?AUTO_13028 ) ) ( OBJ-AT ?AUTO_13026 ?AUTO_13028 ) ( AIRPORT ?AUTO_13033 ) ( AIRPLANE-AT ?AUTO_13032 ?AUTO_13033 ) ( not ( = ?AUTO_13033 ?AUTO_13028 ) ) ( not ( = ?AUTO_13027 ?AUTO_13033 ) ) ( not ( = ?AUTO_13031 ?AUTO_13033 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13032 ?AUTO_13033 ?AUTO_13028 )
      ( DELIVER-PKG ?AUTO_13026 ?AUTO_13027 )
      ( DELIVER-PKG-VERIFY ?AUTO_13026 ?AUTO_13027 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13058 - OBJ
      ?AUTO_13059 - LOCATION
    )
    :vars
    (
      ?AUTO_13060 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13060 ?AUTO_13059 ) ( IN-TRUCK ?AUTO_13058 ?AUTO_13060 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13058 ?AUTO_13060 ?AUTO_13059 )
      ( DELIVER-PKG-VERIFY ?AUTO_13058 ?AUTO_13059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13061 - OBJ
      ?AUTO_13062 - LOCATION
    )
    :vars
    (
      ?AUTO_13063 - TRUCK
      ?AUTO_13064 - LOCATION
      ?AUTO_13065 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13061 ?AUTO_13063 ) ( TRUCK-AT ?AUTO_13063 ?AUTO_13064 ) ( IN-CITY ?AUTO_13064 ?AUTO_13065 ) ( IN-CITY ?AUTO_13062 ?AUTO_13065 ) ( not ( = ?AUTO_13062 ?AUTO_13064 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13063 ?AUTO_13064 ?AUTO_13062 ?AUTO_13065 )
      ( DELIVER-PKG ?AUTO_13061 ?AUTO_13062 )
      ( DELIVER-PKG-VERIFY ?AUTO_13061 ?AUTO_13062 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13066 - OBJ
      ?AUTO_13067 - LOCATION
    )
    :vars
    (
      ?AUTO_13068 - TRUCK
      ?AUTO_13069 - LOCATION
      ?AUTO_13070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13068 ?AUTO_13069 ) ( IN-CITY ?AUTO_13069 ?AUTO_13070 ) ( IN-CITY ?AUTO_13067 ?AUTO_13070 ) ( not ( = ?AUTO_13067 ?AUTO_13069 ) ) ( OBJ-AT ?AUTO_13066 ?AUTO_13069 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13066 ?AUTO_13068 ?AUTO_13069 )
      ( DELIVER-PKG ?AUTO_13066 ?AUTO_13067 )
      ( DELIVER-PKG-VERIFY ?AUTO_13066 ?AUTO_13067 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13071 - OBJ
      ?AUTO_13072 - LOCATION
    )
    :vars
    (
      ?AUTO_13073 - LOCATION
      ?AUTO_13075 - CITY
      ?AUTO_13074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13073 ?AUTO_13075 ) ( IN-CITY ?AUTO_13072 ?AUTO_13075 ) ( not ( = ?AUTO_13072 ?AUTO_13073 ) ) ( OBJ-AT ?AUTO_13071 ?AUTO_13073 ) ( TRUCK-AT ?AUTO_13074 ?AUTO_13072 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13074 ?AUTO_13072 ?AUTO_13073 ?AUTO_13075 )
      ( DELIVER-PKG ?AUTO_13071 ?AUTO_13072 )
      ( DELIVER-PKG-VERIFY ?AUTO_13071 ?AUTO_13072 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13106 - OBJ
      ?AUTO_13107 - LOCATION
    )
    :vars
    (
      ?AUTO_13108 - LOCATION
      ?AUTO_13109 - CITY
      ?AUTO_13110 - TRUCK
      ?AUTO_13111 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13108 ?AUTO_13109 ) ( IN-CITY ?AUTO_13107 ?AUTO_13109 ) ( not ( = ?AUTO_13107 ?AUTO_13108 ) ) ( TRUCK-AT ?AUTO_13110 ?AUTO_13107 ) ( IN-AIRPLANE ?AUTO_13106 ?AUTO_13111 ) ( AIRPLANE-AT ?AUTO_13111 ?AUTO_13108 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13106 ?AUTO_13111 ?AUTO_13108 )
      ( DELIVER-PKG ?AUTO_13106 ?AUTO_13107 )
      ( DELIVER-PKG-VERIFY ?AUTO_13106 ?AUTO_13107 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13126 - OBJ
      ?AUTO_13127 - LOCATION
    )
    :vars
    (
      ?AUTO_13131 - LOCATION
      ?AUTO_13129 - CITY
      ?AUTO_13132 - TRUCK
      ?AUTO_13128 - LOCATION
      ?AUTO_13130 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13131 ?AUTO_13129 ) ( IN-CITY ?AUTO_13127 ?AUTO_13129 ) ( not ( = ?AUTO_13127 ?AUTO_13131 ) ) ( TRUCK-AT ?AUTO_13132 ?AUTO_13127 ) ( AIRPORT ?AUTO_13128 ) ( AIRPORT ?AUTO_13131 ) ( AIRPLANE-AT ?AUTO_13130 ?AUTO_13128 ) ( not ( = ?AUTO_13128 ?AUTO_13131 ) ) ( not ( = ?AUTO_13127 ?AUTO_13128 ) ) ( OBJ-AT ?AUTO_13126 ?AUTO_13128 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13126 ?AUTO_13130 ?AUTO_13128 )
      ( DELIVER-PKG ?AUTO_13126 ?AUTO_13127 )
      ( DELIVER-PKG-VERIFY ?AUTO_13126 ?AUTO_13127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13135 - OBJ
      ?AUTO_13136 - LOCATION
    )
    :vars
    (
      ?AUTO_13137 - LOCATION
      ?AUTO_13140 - CITY
      ?AUTO_13139 - TRUCK
      ?AUTO_13141 - LOCATION
      ?AUTO_13142 - LOCATION
      ?AUTO_13138 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13137 ?AUTO_13140 ) ( IN-CITY ?AUTO_13136 ?AUTO_13140 ) ( not ( = ?AUTO_13136 ?AUTO_13137 ) ) ( TRUCK-AT ?AUTO_13139 ?AUTO_13136 ) ( AIRPORT ?AUTO_13141 ) ( AIRPORT ?AUTO_13137 ) ( not ( = ?AUTO_13141 ?AUTO_13137 ) ) ( not ( = ?AUTO_13136 ?AUTO_13141 ) ) ( OBJ-AT ?AUTO_13135 ?AUTO_13141 ) ( AIRPORT ?AUTO_13142 ) ( AIRPLANE-AT ?AUTO_13138 ?AUTO_13142 ) ( not ( = ?AUTO_13142 ?AUTO_13141 ) ) ( not ( = ?AUTO_13136 ?AUTO_13142 ) ) ( not ( = ?AUTO_13137 ?AUTO_13142 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13138 ?AUTO_13142 ?AUTO_13141 )
      ( DELIVER-PKG ?AUTO_13135 ?AUTO_13136 )
      ( DELIVER-PKG-VERIFY ?AUTO_13135 ?AUTO_13136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13145 - OBJ
      ?AUTO_13146 - LOCATION
    )
    :vars
    (
      ?AUTO_13147 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13147 ?AUTO_13146 ) ( IN-TRUCK ?AUTO_13145 ?AUTO_13147 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13145 ?AUTO_13147 ?AUTO_13146 )
      ( DELIVER-PKG-VERIFY ?AUTO_13145 ?AUTO_13146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13152 - OBJ
      ?AUTO_13153 - LOCATION
    )
    :vars
    (
      ?AUTO_13154 - TRUCK
      ?AUTO_13155 - LOCATION
      ?AUTO_13156 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13152 ?AUTO_13154 ) ( TRUCK-AT ?AUTO_13154 ?AUTO_13155 ) ( IN-CITY ?AUTO_13155 ?AUTO_13156 ) ( IN-CITY ?AUTO_13153 ?AUTO_13156 ) ( not ( = ?AUTO_13153 ?AUTO_13155 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13154 ?AUTO_13155 ?AUTO_13153 ?AUTO_13156 )
      ( DELIVER-PKG ?AUTO_13152 ?AUTO_13153 )
      ( DELIVER-PKG-VERIFY ?AUTO_13152 ?AUTO_13153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13157 - OBJ
      ?AUTO_13158 - LOCATION
    )
    :vars
    (
      ?AUTO_13159 - TRUCK
      ?AUTO_13160 - LOCATION
      ?AUTO_13161 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13159 ?AUTO_13160 ) ( IN-CITY ?AUTO_13160 ?AUTO_13161 ) ( IN-CITY ?AUTO_13158 ?AUTO_13161 ) ( not ( = ?AUTO_13158 ?AUTO_13160 ) ) ( OBJ-AT ?AUTO_13157 ?AUTO_13160 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13157 ?AUTO_13159 ?AUTO_13160 )
      ( DELIVER-PKG ?AUTO_13157 ?AUTO_13158 )
      ( DELIVER-PKG-VERIFY ?AUTO_13157 ?AUTO_13158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13166 - OBJ
      ?AUTO_13167 - LOCATION
    )
    :vars
    (
      ?AUTO_13168 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13168 ?AUTO_13167 ) ( IN-TRUCK ?AUTO_13166 ?AUTO_13168 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13166 ?AUTO_13168 ?AUTO_13167 )
      ( DELIVER-PKG-VERIFY ?AUTO_13166 ?AUTO_13167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13171 - OBJ
      ?AUTO_13172 - LOCATION
    )
    :vars
    (
      ?AUTO_13173 - TRUCK
      ?AUTO_13174 - LOCATION
      ?AUTO_13175 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13171 ?AUTO_13173 ) ( TRUCK-AT ?AUTO_13173 ?AUTO_13174 ) ( IN-CITY ?AUTO_13174 ?AUTO_13175 ) ( IN-CITY ?AUTO_13172 ?AUTO_13175 ) ( not ( = ?AUTO_13172 ?AUTO_13174 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13173 ?AUTO_13174 ?AUTO_13172 ?AUTO_13175 )
      ( DELIVER-PKG ?AUTO_13171 ?AUTO_13172 )
      ( DELIVER-PKG-VERIFY ?AUTO_13171 ?AUTO_13172 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13176 - OBJ
      ?AUTO_13177 - LOCATION
    )
    :vars
    (
      ?AUTO_13178 - TRUCK
      ?AUTO_13179 - LOCATION
      ?AUTO_13180 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13178 ?AUTO_13179 ) ( IN-CITY ?AUTO_13179 ?AUTO_13180 ) ( IN-CITY ?AUTO_13177 ?AUTO_13180 ) ( not ( = ?AUTO_13177 ?AUTO_13179 ) ) ( OBJ-AT ?AUTO_13176 ?AUTO_13179 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13176 ?AUTO_13178 ?AUTO_13179 )
      ( DELIVER-PKG ?AUTO_13176 ?AUTO_13177 )
      ( DELIVER-PKG-VERIFY ?AUTO_13176 ?AUTO_13177 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13185 - OBJ
      ?AUTO_13186 - LOCATION
    )
    :vars
    (
      ?AUTO_13188 - LOCATION
      ?AUTO_13189 - CITY
      ?AUTO_13187 - TRUCK
      ?AUTO_13190 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13188 ?AUTO_13189 ) ( IN-CITY ?AUTO_13186 ?AUTO_13189 ) ( not ( = ?AUTO_13186 ?AUTO_13188 ) ) ( OBJ-AT ?AUTO_13185 ?AUTO_13188 ) ( TRUCK-AT ?AUTO_13187 ?AUTO_13190 ) ( IN-CITY ?AUTO_13190 ?AUTO_13189 ) ( not ( = ?AUTO_13188 ?AUTO_13190 ) ) ( not ( = ?AUTO_13186 ?AUTO_13190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13187 ?AUTO_13190 ?AUTO_13188 ?AUTO_13189 )
      ( DELIVER-PKG ?AUTO_13185 ?AUTO_13186 )
      ( DELIVER-PKG-VERIFY ?AUTO_13185 ?AUTO_13186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13193 - OBJ
      ?AUTO_13194 - LOCATION
    )
    :vars
    (
      ?AUTO_13195 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13193 ?AUTO_13195 ) ( AIRPLANE-AT ?AUTO_13195 ?AUTO_13194 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13193 ?AUTO_13195 ?AUTO_13194 )
      ( DELIVER-PKG-VERIFY ?AUTO_13193 ?AUTO_13194 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13200 - OBJ
      ?AUTO_13201 - LOCATION
    )
    :vars
    (
      ?AUTO_13202 - AIRPLANE
      ?AUTO_13203 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13200 ?AUTO_13202 ) ( AIRPORT ?AUTO_13203 ) ( AIRPORT ?AUTO_13201 ) ( AIRPLANE-AT ?AUTO_13202 ?AUTO_13203 ) ( not ( = ?AUTO_13203 ?AUTO_13201 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13202 ?AUTO_13203 ?AUTO_13201 )
      ( DELIVER-PKG ?AUTO_13200 ?AUTO_13201 )
      ( DELIVER-PKG-VERIFY ?AUTO_13200 ?AUTO_13201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13204 - OBJ
      ?AUTO_13205 - LOCATION
    )
    :vars
    (
      ?AUTO_13207 - LOCATION
      ?AUTO_13206 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13207 ) ( AIRPORT ?AUTO_13205 ) ( AIRPLANE-AT ?AUTO_13206 ?AUTO_13207 ) ( not ( = ?AUTO_13207 ?AUTO_13205 ) ) ( OBJ-AT ?AUTO_13204 ?AUTO_13207 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13204 ?AUTO_13206 ?AUTO_13207 )
      ( DELIVER-PKG ?AUTO_13204 ?AUTO_13205 )
      ( DELIVER-PKG-VERIFY ?AUTO_13204 ?AUTO_13205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13208 - OBJ
      ?AUTO_13209 - LOCATION
    )
    :vars
    (
      ?AUTO_13211 - LOCATION
      ?AUTO_13210 - AIRPLANE
      ?AUTO_13212 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13211 ) ( AIRPORT ?AUTO_13209 ) ( AIRPLANE-AT ?AUTO_13210 ?AUTO_13211 ) ( not ( = ?AUTO_13211 ?AUTO_13209 ) ) ( TRUCK-AT ?AUTO_13212 ?AUTO_13211 ) ( IN-TRUCK ?AUTO_13208 ?AUTO_13212 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13208 ?AUTO_13212 ?AUTO_13211 )
      ( DELIVER-PKG ?AUTO_13208 ?AUTO_13209 )
      ( DELIVER-PKG-VERIFY ?AUTO_13208 ?AUTO_13209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13215 - OBJ
      ?AUTO_13216 - LOCATION
    )
    :vars
    (
      ?AUTO_13218 - LOCATION
      ?AUTO_13219 - AIRPLANE
      ?AUTO_13217 - TRUCK
      ?AUTO_13220 - LOCATION
      ?AUTO_13221 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13218 ) ( AIRPORT ?AUTO_13216 ) ( AIRPLANE-AT ?AUTO_13219 ?AUTO_13218 ) ( not ( = ?AUTO_13218 ?AUTO_13216 ) ) ( IN-TRUCK ?AUTO_13215 ?AUTO_13217 ) ( TRUCK-AT ?AUTO_13217 ?AUTO_13220 ) ( IN-CITY ?AUTO_13220 ?AUTO_13221 ) ( IN-CITY ?AUTO_13218 ?AUTO_13221 ) ( not ( = ?AUTO_13218 ?AUTO_13220 ) ) ( not ( = ?AUTO_13216 ?AUTO_13220 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13217 ?AUTO_13220 ?AUTO_13218 ?AUTO_13221 )
      ( DELIVER-PKG ?AUTO_13215 ?AUTO_13216 )
      ( DELIVER-PKG-VERIFY ?AUTO_13215 ?AUTO_13216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13222 - OBJ
      ?AUTO_13223 - LOCATION
    )
    :vars
    (
      ?AUTO_13226 - LOCATION
      ?AUTO_13224 - AIRPLANE
      ?AUTO_13225 - TRUCK
      ?AUTO_13228 - LOCATION
      ?AUTO_13227 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13226 ) ( AIRPORT ?AUTO_13223 ) ( AIRPLANE-AT ?AUTO_13224 ?AUTO_13226 ) ( not ( = ?AUTO_13226 ?AUTO_13223 ) ) ( TRUCK-AT ?AUTO_13225 ?AUTO_13228 ) ( IN-CITY ?AUTO_13228 ?AUTO_13227 ) ( IN-CITY ?AUTO_13226 ?AUTO_13227 ) ( not ( = ?AUTO_13226 ?AUTO_13228 ) ) ( not ( = ?AUTO_13223 ?AUTO_13228 ) ) ( OBJ-AT ?AUTO_13222 ?AUTO_13228 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13222 ?AUTO_13225 ?AUTO_13228 )
      ( DELIVER-PKG ?AUTO_13222 ?AUTO_13223 )
      ( DELIVER-PKG-VERIFY ?AUTO_13222 ?AUTO_13223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13233 - OBJ
      ?AUTO_13234 - LOCATION
    )
    :vars
    (
      ?AUTO_13236 - LOCATION
      ?AUTO_13237 - AIRPLANE
      ?AUTO_13238 - LOCATION
      ?AUTO_13239 - CITY
      ?AUTO_13235 - TRUCK
      ?AUTO_13240 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13236 ) ( AIRPORT ?AUTO_13234 ) ( AIRPLANE-AT ?AUTO_13237 ?AUTO_13236 ) ( not ( = ?AUTO_13236 ?AUTO_13234 ) ) ( IN-CITY ?AUTO_13238 ?AUTO_13239 ) ( IN-CITY ?AUTO_13236 ?AUTO_13239 ) ( not ( = ?AUTO_13236 ?AUTO_13238 ) ) ( not ( = ?AUTO_13234 ?AUTO_13238 ) ) ( OBJ-AT ?AUTO_13233 ?AUTO_13238 ) ( TRUCK-AT ?AUTO_13235 ?AUTO_13240 ) ( IN-CITY ?AUTO_13240 ?AUTO_13239 ) ( not ( = ?AUTO_13238 ?AUTO_13240 ) ) ( not ( = ?AUTO_13234 ?AUTO_13240 ) ) ( not ( = ?AUTO_13236 ?AUTO_13240 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13235 ?AUTO_13240 ?AUTO_13238 ?AUTO_13239 )
      ( DELIVER-PKG ?AUTO_13233 ?AUTO_13234 )
      ( DELIVER-PKG-VERIFY ?AUTO_13233 ?AUTO_13234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13243 - OBJ
      ?AUTO_13244 - LOCATION
    )
    :vars
    (
      ?AUTO_13245 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13243 ?AUTO_13245 ) ( AIRPLANE-AT ?AUTO_13245 ?AUTO_13244 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13243 ?AUTO_13245 ?AUTO_13244 )
      ( DELIVER-PKG-VERIFY ?AUTO_13243 ?AUTO_13244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13248 - OBJ
      ?AUTO_13249 - LOCATION
    )
    :vars
    (
      ?AUTO_13250 - AIRPLANE
      ?AUTO_13251 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13248 ?AUTO_13250 ) ( AIRPORT ?AUTO_13251 ) ( AIRPORT ?AUTO_13249 ) ( AIRPLANE-AT ?AUTO_13250 ?AUTO_13251 ) ( not ( = ?AUTO_13251 ?AUTO_13249 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13250 ?AUTO_13251 ?AUTO_13249 )
      ( DELIVER-PKG ?AUTO_13248 ?AUTO_13249 )
      ( DELIVER-PKG-VERIFY ?AUTO_13248 ?AUTO_13249 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13252 - OBJ
      ?AUTO_13253 - LOCATION
    )
    :vars
    (
      ?AUTO_13255 - LOCATION
      ?AUTO_13254 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13255 ) ( AIRPORT ?AUTO_13253 ) ( AIRPLANE-AT ?AUTO_13254 ?AUTO_13255 ) ( not ( = ?AUTO_13255 ?AUTO_13253 ) ) ( OBJ-AT ?AUTO_13252 ?AUTO_13255 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13252 ?AUTO_13254 ?AUTO_13255 )
      ( DELIVER-PKG ?AUTO_13252 ?AUTO_13253 )
      ( DELIVER-PKG-VERIFY ?AUTO_13252 ?AUTO_13253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13276 - OBJ
      ?AUTO_13277 - LOCATION
    )
    :vars
    (
      ?AUTO_13278 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13278 ?AUTO_13277 ) ( IN-TRUCK ?AUTO_13276 ?AUTO_13278 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13276 ?AUTO_13278 ?AUTO_13277 )
      ( DELIVER-PKG-VERIFY ?AUTO_13276 ?AUTO_13277 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13279 - OBJ
      ?AUTO_13280 - LOCATION
    )
    :vars
    (
      ?AUTO_13281 - TRUCK
      ?AUTO_13282 - LOCATION
      ?AUTO_13283 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13279 ?AUTO_13281 ) ( TRUCK-AT ?AUTO_13281 ?AUTO_13282 ) ( IN-CITY ?AUTO_13282 ?AUTO_13283 ) ( IN-CITY ?AUTO_13280 ?AUTO_13283 ) ( not ( = ?AUTO_13280 ?AUTO_13282 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13281 ?AUTO_13282 ?AUTO_13280 ?AUTO_13283 )
      ( DELIVER-PKG ?AUTO_13279 ?AUTO_13280 )
      ( DELIVER-PKG-VERIFY ?AUTO_13279 ?AUTO_13280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13284 - OBJ
      ?AUTO_13285 - LOCATION
    )
    :vars
    (
      ?AUTO_13286 - TRUCK
      ?AUTO_13287 - LOCATION
      ?AUTO_13288 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13286 ?AUTO_13287 ) ( IN-CITY ?AUTO_13287 ?AUTO_13288 ) ( IN-CITY ?AUTO_13285 ?AUTO_13288 ) ( not ( = ?AUTO_13285 ?AUTO_13287 ) ) ( OBJ-AT ?AUTO_13284 ?AUTO_13287 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13284 ?AUTO_13286 ?AUTO_13287 )
      ( DELIVER-PKG ?AUTO_13284 ?AUTO_13285 )
      ( DELIVER-PKG-VERIFY ?AUTO_13284 ?AUTO_13285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13291 - OBJ
      ?AUTO_13292 - LOCATION
    )
    :vars
    (
      ?AUTO_13293 - TRUCK
      ?AUTO_13295 - LOCATION
      ?AUTO_13294 - CITY
      ?AUTO_13296 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13293 ?AUTO_13295 ) ( IN-CITY ?AUTO_13295 ?AUTO_13294 ) ( IN-CITY ?AUTO_13292 ?AUTO_13294 ) ( not ( = ?AUTO_13292 ?AUTO_13295 ) ) ( IN-AIRPLANE ?AUTO_13291 ?AUTO_13296 ) ( AIRPLANE-AT ?AUTO_13296 ?AUTO_13295 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13291 ?AUTO_13296 ?AUTO_13295 )
      ( DELIVER-PKG ?AUTO_13291 ?AUTO_13292 )
      ( DELIVER-PKG-VERIFY ?AUTO_13291 ?AUTO_13292 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13301 - OBJ
      ?AUTO_13302 - LOCATION
    )
    :vars
    (
      ?AUTO_13305 - TRUCK
      ?AUTO_13304 - LOCATION
      ?AUTO_13306 - CITY
      ?AUTO_13303 - AIRPLANE
      ?AUTO_13307 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13305 ?AUTO_13304 ) ( IN-CITY ?AUTO_13304 ?AUTO_13306 ) ( IN-CITY ?AUTO_13302 ?AUTO_13306 ) ( not ( = ?AUTO_13302 ?AUTO_13304 ) ) ( IN-AIRPLANE ?AUTO_13301 ?AUTO_13303 ) ( AIRPORT ?AUTO_13307 ) ( AIRPORT ?AUTO_13304 ) ( AIRPLANE-AT ?AUTO_13303 ?AUTO_13307 ) ( not ( = ?AUTO_13307 ?AUTO_13304 ) ) ( not ( = ?AUTO_13302 ?AUTO_13307 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13303 ?AUTO_13307 ?AUTO_13304 )
      ( DELIVER-PKG ?AUTO_13301 ?AUTO_13302 )
      ( DELIVER-PKG-VERIFY ?AUTO_13301 ?AUTO_13302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13308 - OBJ
      ?AUTO_13309 - LOCATION
    )
    :vars
    (
      ?AUTO_13313 - TRUCK
      ?AUTO_13311 - LOCATION
      ?AUTO_13310 - CITY
      ?AUTO_13314 - LOCATION
      ?AUTO_13312 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13313 ?AUTO_13311 ) ( IN-CITY ?AUTO_13311 ?AUTO_13310 ) ( IN-CITY ?AUTO_13309 ?AUTO_13310 ) ( not ( = ?AUTO_13309 ?AUTO_13311 ) ) ( AIRPORT ?AUTO_13314 ) ( AIRPORT ?AUTO_13311 ) ( AIRPLANE-AT ?AUTO_13312 ?AUTO_13314 ) ( not ( = ?AUTO_13314 ?AUTO_13311 ) ) ( not ( = ?AUTO_13309 ?AUTO_13314 ) ) ( OBJ-AT ?AUTO_13308 ?AUTO_13314 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13308 ?AUTO_13312 ?AUTO_13314 )
      ( DELIVER-PKG ?AUTO_13308 ?AUTO_13309 )
      ( DELIVER-PKG-VERIFY ?AUTO_13308 ?AUTO_13309 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13315 - OBJ
      ?AUTO_13316 - LOCATION
    )
    :vars
    (
      ?AUTO_13320 - TRUCK
      ?AUTO_13317 - LOCATION
      ?AUTO_13318 - CITY
      ?AUTO_13321 - LOCATION
      ?AUTO_13319 - AIRPLANE
      ?AUTO_13322 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13320 ?AUTO_13317 ) ( IN-CITY ?AUTO_13317 ?AUTO_13318 ) ( IN-CITY ?AUTO_13316 ?AUTO_13318 ) ( not ( = ?AUTO_13316 ?AUTO_13317 ) ) ( AIRPORT ?AUTO_13321 ) ( AIRPORT ?AUTO_13317 ) ( AIRPLANE-AT ?AUTO_13319 ?AUTO_13321 ) ( not ( = ?AUTO_13321 ?AUTO_13317 ) ) ( not ( = ?AUTO_13316 ?AUTO_13321 ) ) ( TRUCK-AT ?AUTO_13322 ?AUTO_13321 ) ( IN-TRUCK ?AUTO_13315 ?AUTO_13322 ) ( not ( = ?AUTO_13320 ?AUTO_13322 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13315 ?AUTO_13322 ?AUTO_13321 )
      ( DELIVER-PKG ?AUTO_13315 ?AUTO_13316 )
      ( DELIVER-PKG-VERIFY ?AUTO_13315 ?AUTO_13316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13325 - OBJ
      ?AUTO_13326 - LOCATION
    )
    :vars
    (
      ?AUTO_13331 - TRUCK
      ?AUTO_13329 - LOCATION
      ?AUTO_13330 - CITY
      ?AUTO_13327 - LOCATION
      ?AUTO_13332 - AIRPLANE
      ?AUTO_13328 - TRUCK
      ?AUTO_13333 - LOCATION
      ?AUTO_13334 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13331 ?AUTO_13329 ) ( IN-CITY ?AUTO_13329 ?AUTO_13330 ) ( IN-CITY ?AUTO_13326 ?AUTO_13330 ) ( not ( = ?AUTO_13326 ?AUTO_13329 ) ) ( AIRPORT ?AUTO_13327 ) ( AIRPORT ?AUTO_13329 ) ( AIRPLANE-AT ?AUTO_13332 ?AUTO_13327 ) ( not ( = ?AUTO_13327 ?AUTO_13329 ) ) ( not ( = ?AUTO_13326 ?AUTO_13327 ) ) ( IN-TRUCK ?AUTO_13325 ?AUTO_13328 ) ( not ( = ?AUTO_13331 ?AUTO_13328 ) ) ( TRUCK-AT ?AUTO_13328 ?AUTO_13333 ) ( IN-CITY ?AUTO_13333 ?AUTO_13334 ) ( IN-CITY ?AUTO_13327 ?AUTO_13334 ) ( not ( = ?AUTO_13327 ?AUTO_13333 ) ) ( not ( = ?AUTO_13326 ?AUTO_13333 ) ) ( not ( = ?AUTO_13329 ?AUTO_13333 ) ) ( not ( = ?AUTO_13330 ?AUTO_13334 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13328 ?AUTO_13333 ?AUTO_13327 ?AUTO_13334 )
      ( DELIVER-PKG ?AUTO_13325 ?AUTO_13326 )
      ( DELIVER-PKG-VERIFY ?AUTO_13325 ?AUTO_13326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13335 - OBJ
      ?AUTO_13336 - LOCATION
    )
    :vars
    (
      ?AUTO_13339 - TRUCK
      ?AUTO_13342 - LOCATION
      ?AUTO_13337 - CITY
      ?AUTO_13338 - LOCATION
      ?AUTO_13340 - AIRPLANE
      ?AUTO_13341 - TRUCK
      ?AUTO_13344 - LOCATION
      ?AUTO_13343 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13339 ?AUTO_13342 ) ( IN-CITY ?AUTO_13342 ?AUTO_13337 ) ( IN-CITY ?AUTO_13336 ?AUTO_13337 ) ( not ( = ?AUTO_13336 ?AUTO_13342 ) ) ( AIRPORT ?AUTO_13338 ) ( AIRPORT ?AUTO_13342 ) ( AIRPLANE-AT ?AUTO_13340 ?AUTO_13338 ) ( not ( = ?AUTO_13338 ?AUTO_13342 ) ) ( not ( = ?AUTO_13336 ?AUTO_13338 ) ) ( not ( = ?AUTO_13339 ?AUTO_13341 ) ) ( TRUCK-AT ?AUTO_13341 ?AUTO_13344 ) ( IN-CITY ?AUTO_13344 ?AUTO_13343 ) ( IN-CITY ?AUTO_13338 ?AUTO_13343 ) ( not ( = ?AUTO_13338 ?AUTO_13344 ) ) ( not ( = ?AUTO_13336 ?AUTO_13344 ) ) ( not ( = ?AUTO_13342 ?AUTO_13344 ) ) ( not ( = ?AUTO_13337 ?AUTO_13343 ) ) ( OBJ-AT ?AUTO_13335 ?AUTO_13344 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13335 ?AUTO_13341 ?AUTO_13344 )
      ( DELIVER-PKG ?AUTO_13335 ?AUTO_13336 )
      ( DELIVER-PKG-VERIFY ?AUTO_13335 ?AUTO_13336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13349 - OBJ
      ?AUTO_13350 - LOCATION
    )
    :vars
    (
      ?AUTO_13352 - TRUCK
      ?AUTO_13351 - LOCATION
      ?AUTO_13353 - CITY
      ?AUTO_13355 - LOCATION
      ?AUTO_13354 - AIRPLANE
      ?AUTO_13356 - TRUCK
      ?AUTO_13358 - LOCATION
      ?AUTO_13357 - CITY
      ?AUTO_13359 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13352 ?AUTO_13351 ) ( IN-CITY ?AUTO_13351 ?AUTO_13353 ) ( IN-CITY ?AUTO_13350 ?AUTO_13353 ) ( not ( = ?AUTO_13350 ?AUTO_13351 ) ) ( AIRPORT ?AUTO_13355 ) ( AIRPORT ?AUTO_13351 ) ( AIRPLANE-AT ?AUTO_13354 ?AUTO_13355 ) ( not ( = ?AUTO_13355 ?AUTO_13351 ) ) ( not ( = ?AUTO_13350 ?AUTO_13355 ) ) ( not ( = ?AUTO_13352 ?AUTO_13356 ) ) ( IN-CITY ?AUTO_13358 ?AUTO_13357 ) ( IN-CITY ?AUTO_13355 ?AUTO_13357 ) ( not ( = ?AUTO_13355 ?AUTO_13358 ) ) ( not ( = ?AUTO_13350 ?AUTO_13358 ) ) ( not ( = ?AUTO_13351 ?AUTO_13358 ) ) ( not ( = ?AUTO_13353 ?AUTO_13357 ) ) ( OBJ-AT ?AUTO_13349 ?AUTO_13358 ) ( TRUCK-AT ?AUTO_13356 ?AUTO_13359 ) ( IN-CITY ?AUTO_13359 ?AUTO_13357 ) ( not ( = ?AUTO_13358 ?AUTO_13359 ) ) ( not ( = ?AUTO_13350 ?AUTO_13359 ) ) ( not ( = ?AUTO_13351 ?AUTO_13359 ) ) ( not ( = ?AUTO_13355 ?AUTO_13359 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13356 ?AUTO_13359 ?AUTO_13358 ?AUTO_13357 )
      ( DELIVER-PKG ?AUTO_13349 ?AUTO_13350 )
      ( DELIVER-PKG-VERIFY ?AUTO_13349 ?AUTO_13350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13362 - OBJ
      ?AUTO_13363 - LOCATION
    )
    :vars
    (
      ?AUTO_13364 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13364 ?AUTO_13363 ) ( IN-TRUCK ?AUTO_13362 ?AUTO_13364 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13362 ?AUTO_13364 ?AUTO_13363 )
      ( DELIVER-PKG-VERIFY ?AUTO_13362 ?AUTO_13363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13365 - OBJ
      ?AUTO_13366 - LOCATION
    )
    :vars
    (
      ?AUTO_13367 - TRUCK
      ?AUTO_13368 - LOCATION
      ?AUTO_13369 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13365 ?AUTO_13367 ) ( TRUCK-AT ?AUTO_13367 ?AUTO_13368 ) ( IN-CITY ?AUTO_13368 ?AUTO_13369 ) ( IN-CITY ?AUTO_13366 ?AUTO_13369 ) ( not ( = ?AUTO_13366 ?AUTO_13368 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13367 ?AUTO_13368 ?AUTO_13366 ?AUTO_13369 )
      ( DELIVER-PKG ?AUTO_13365 ?AUTO_13366 )
      ( DELIVER-PKG-VERIFY ?AUTO_13365 ?AUTO_13366 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13370 - OBJ
      ?AUTO_13371 - LOCATION
    )
    :vars
    (
      ?AUTO_13372 - TRUCK
      ?AUTO_13373 - LOCATION
      ?AUTO_13374 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13372 ?AUTO_13373 ) ( IN-CITY ?AUTO_13373 ?AUTO_13374 ) ( IN-CITY ?AUTO_13371 ?AUTO_13374 ) ( not ( = ?AUTO_13371 ?AUTO_13373 ) ) ( OBJ-AT ?AUTO_13370 ?AUTO_13373 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13370 ?AUTO_13372 ?AUTO_13373 )
      ( DELIVER-PKG ?AUTO_13370 ?AUTO_13371 )
      ( DELIVER-PKG-VERIFY ?AUTO_13370 ?AUTO_13371 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13375 - OBJ
      ?AUTO_13376 - LOCATION
    )
    :vars
    (
      ?AUTO_13377 - LOCATION
      ?AUTO_13379 - CITY
      ?AUTO_13378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13377 ?AUTO_13379 ) ( IN-CITY ?AUTO_13376 ?AUTO_13379 ) ( not ( = ?AUTO_13376 ?AUTO_13377 ) ) ( OBJ-AT ?AUTO_13375 ?AUTO_13377 ) ( TRUCK-AT ?AUTO_13378 ?AUTO_13376 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13378 ?AUTO_13376 ?AUTO_13377 ?AUTO_13379 )
      ( DELIVER-PKG ?AUTO_13375 ?AUTO_13376 )
      ( DELIVER-PKG-VERIFY ?AUTO_13375 ?AUTO_13376 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13414 - OBJ
      ?AUTO_13415 - LOCATION
    )
    :vars
    (
      ?AUTO_13416 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13416 ?AUTO_13415 ) ( IN-TRUCK ?AUTO_13414 ?AUTO_13416 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13414 ?AUTO_13416 ?AUTO_13415 )
      ( DELIVER-PKG-VERIFY ?AUTO_13414 ?AUTO_13415 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13417 - OBJ
      ?AUTO_13418 - LOCATION
    )
    :vars
    (
      ?AUTO_13419 - TRUCK
      ?AUTO_13420 - LOCATION
      ?AUTO_13421 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13417 ?AUTO_13419 ) ( TRUCK-AT ?AUTO_13419 ?AUTO_13420 ) ( IN-CITY ?AUTO_13420 ?AUTO_13421 ) ( IN-CITY ?AUTO_13418 ?AUTO_13421 ) ( not ( = ?AUTO_13418 ?AUTO_13420 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13419 ?AUTO_13420 ?AUTO_13418 ?AUTO_13421 )
      ( DELIVER-PKG ?AUTO_13417 ?AUTO_13418 )
      ( DELIVER-PKG-VERIFY ?AUTO_13417 ?AUTO_13418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13422 - OBJ
      ?AUTO_13423 - LOCATION
    )
    :vars
    (
      ?AUTO_13424 - TRUCK
      ?AUTO_13425 - LOCATION
      ?AUTO_13426 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13424 ?AUTO_13425 ) ( IN-CITY ?AUTO_13425 ?AUTO_13426 ) ( IN-CITY ?AUTO_13423 ?AUTO_13426 ) ( not ( = ?AUTO_13423 ?AUTO_13425 ) ) ( OBJ-AT ?AUTO_13422 ?AUTO_13425 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13422 ?AUTO_13424 ?AUTO_13425 )
      ( DELIVER-PKG ?AUTO_13422 ?AUTO_13423 )
      ( DELIVER-PKG-VERIFY ?AUTO_13422 ?AUTO_13423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13427 - OBJ
      ?AUTO_13428 - LOCATION
    )
    :vars
    (
      ?AUTO_13429 - LOCATION
      ?AUTO_13431 - CITY
      ?AUTO_13430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13429 ?AUTO_13431 ) ( IN-CITY ?AUTO_13428 ?AUTO_13431 ) ( not ( = ?AUTO_13428 ?AUTO_13429 ) ) ( OBJ-AT ?AUTO_13427 ?AUTO_13429 ) ( TRUCK-AT ?AUTO_13430 ?AUTO_13428 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13430 ?AUTO_13428 ?AUTO_13429 ?AUTO_13431 )
      ( DELIVER-PKG ?AUTO_13427 ?AUTO_13428 )
      ( DELIVER-PKG-VERIFY ?AUTO_13427 ?AUTO_13428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13446 - OBJ
      ?AUTO_13447 - LOCATION
    )
    :vars
    (
      ?AUTO_13448 - LOCATION
      ?AUTO_13449 - CITY
      ?AUTO_13450 - TRUCK
      ?AUTO_13451 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13448 ?AUTO_13449 ) ( IN-CITY ?AUTO_13447 ?AUTO_13449 ) ( not ( = ?AUTO_13447 ?AUTO_13448 ) ) ( TRUCK-AT ?AUTO_13450 ?AUTO_13447 ) ( IN-AIRPLANE ?AUTO_13446 ?AUTO_13451 ) ( AIRPLANE-AT ?AUTO_13451 ?AUTO_13448 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13446 ?AUTO_13451 ?AUTO_13448 )
      ( DELIVER-PKG ?AUTO_13446 ?AUTO_13447 )
      ( DELIVER-PKG-VERIFY ?AUTO_13446 ?AUTO_13447 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13454 - OBJ
      ?AUTO_13455 - LOCATION
    )
    :vars
    (
      ?AUTO_13458 - LOCATION
      ?AUTO_13456 - CITY
      ?AUTO_13459 - TRUCK
      ?AUTO_13457 - AIRPLANE
      ?AUTO_13460 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13458 ?AUTO_13456 ) ( IN-CITY ?AUTO_13455 ?AUTO_13456 ) ( not ( = ?AUTO_13455 ?AUTO_13458 ) ) ( TRUCK-AT ?AUTO_13459 ?AUTO_13455 ) ( IN-AIRPLANE ?AUTO_13454 ?AUTO_13457 ) ( AIRPORT ?AUTO_13460 ) ( AIRPORT ?AUTO_13458 ) ( AIRPLANE-AT ?AUTO_13457 ?AUTO_13460 ) ( not ( = ?AUTO_13460 ?AUTO_13458 ) ) ( not ( = ?AUTO_13455 ?AUTO_13460 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13457 ?AUTO_13460 ?AUTO_13458 )
      ( DELIVER-PKG ?AUTO_13454 ?AUTO_13455 )
      ( DELIVER-PKG-VERIFY ?AUTO_13454 ?AUTO_13455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13461 - OBJ
      ?AUTO_13462 - LOCATION
    )
    :vars
    (
      ?AUTO_13466 - LOCATION
      ?AUTO_13463 - CITY
      ?AUTO_13465 - TRUCK
      ?AUTO_13467 - LOCATION
      ?AUTO_13464 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13466 ?AUTO_13463 ) ( IN-CITY ?AUTO_13462 ?AUTO_13463 ) ( not ( = ?AUTO_13462 ?AUTO_13466 ) ) ( TRUCK-AT ?AUTO_13465 ?AUTO_13462 ) ( AIRPORT ?AUTO_13467 ) ( AIRPORT ?AUTO_13466 ) ( AIRPLANE-AT ?AUTO_13464 ?AUTO_13467 ) ( not ( = ?AUTO_13467 ?AUTO_13466 ) ) ( not ( = ?AUTO_13462 ?AUTO_13467 ) ) ( OBJ-AT ?AUTO_13461 ?AUTO_13467 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13461 ?AUTO_13464 ?AUTO_13467 )
      ( DELIVER-PKG ?AUTO_13461 ?AUTO_13462 )
      ( DELIVER-PKG-VERIFY ?AUTO_13461 ?AUTO_13462 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13488 - OBJ
      ?AUTO_13489 - LOCATION
    )
    :vars
    (
      ?AUTO_13490 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13488 ?AUTO_13490 ) ( AIRPLANE-AT ?AUTO_13490 ?AUTO_13489 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13488 ?AUTO_13490 ?AUTO_13489 )
      ( DELIVER-PKG-VERIFY ?AUTO_13488 ?AUTO_13489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13495 - OBJ
      ?AUTO_13496 - LOCATION
    )
    :vars
    (
      ?AUTO_13497 - AIRPLANE
      ?AUTO_13498 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13495 ?AUTO_13497 ) ( AIRPORT ?AUTO_13498 ) ( AIRPORT ?AUTO_13496 ) ( AIRPLANE-AT ?AUTO_13497 ?AUTO_13498 ) ( not ( = ?AUTO_13498 ?AUTO_13496 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13497 ?AUTO_13498 ?AUTO_13496 )
      ( DELIVER-PKG ?AUTO_13495 ?AUTO_13496 )
      ( DELIVER-PKG-VERIFY ?AUTO_13495 ?AUTO_13496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13499 - OBJ
      ?AUTO_13500 - LOCATION
    )
    :vars
    (
      ?AUTO_13502 - LOCATION
      ?AUTO_13501 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13502 ) ( AIRPORT ?AUTO_13500 ) ( AIRPLANE-AT ?AUTO_13501 ?AUTO_13502 ) ( not ( = ?AUTO_13502 ?AUTO_13500 ) ) ( OBJ-AT ?AUTO_13499 ?AUTO_13502 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13499 ?AUTO_13501 ?AUTO_13502 )
      ( DELIVER-PKG ?AUTO_13499 ?AUTO_13500 )
      ( DELIVER-PKG-VERIFY ?AUTO_13499 ?AUTO_13500 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13505 - OBJ
      ?AUTO_13506 - LOCATION
    )
    :vars
    (
      ?AUTO_13507 - LOCATION
      ?AUTO_13508 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13507 ) ( AIRPORT ?AUTO_13506 ) ( not ( = ?AUTO_13507 ?AUTO_13506 ) ) ( OBJ-AT ?AUTO_13505 ?AUTO_13507 ) ( AIRPLANE-AT ?AUTO_13508 ?AUTO_13506 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13508 ?AUTO_13506 ?AUTO_13507 )
      ( DELIVER-PKG ?AUTO_13505 ?AUTO_13506 )
      ( DELIVER-PKG-VERIFY ?AUTO_13505 ?AUTO_13506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13545 - OBJ
      ?AUTO_13546 - LOCATION
    )
    :vars
    (
      ?AUTO_13547 - LOCATION
      ?AUTO_13548 - AIRPLANE
      ?AUTO_13549 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13547 ) ( AIRPORT ?AUTO_13546 ) ( not ( = ?AUTO_13547 ?AUTO_13546 ) ) ( AIRPLANE-AT ?AUTO_13548 ?AUTO_13546 ) ( TRUCK-AT ?AUTO_13549 ?AUTO_13547 ) ( IN-TRUCK ?AUTO_13545 ?AUTO_13549 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13545 ?AUTO_13549 ?AUTO_13547 )
      ( DELIVER-PKG ?AUTO_13545 ?AUTO_13546 )
      ( DELIVER-PKG-VERIFY ?AUTO_13545 ?AUTO_13546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13554 - OBJ
      ?AUTO_13555 - LOCATION
    )
    :vars
    (
      ?AUTO_13557 - LOCATION
      ?AUTO_13556 - AIRPLANE
      ?AUTO_13558 - TRUCK
      ?AUTO_13559 - LOCATION
      ?AUTO_13560 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13557 ) ( AIRPORT ?AUTO_13555 ) ( not ( = ?AUTO_13557 ?AUTO_13555 ) ) ( AIRPLANE-AT ?AUTO_13556 ?AUTO_13555 ) ( IN-TRUCK ?AUTO_13554 ?AUTO_13558 ) ( TRUCK-AT ?AUTO_13558 ?AUTO_13559 ) ( IN-CITY ?AUTO_13559 ?AUTO_13560 ) ( IN-CITY ?AUTO_13557 ?AUTO_13560 ) ( not ( = ?AUTO_13557 ?AUTO_13559 ) ) ( not ( = ?AUTO_13555 ?AUTO_13559 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13558 ?AUTO_13559 ?AUTO_13557 ?AUTO_13560 )
      ( DELIVER-PKG ?AUTO_13554 ?AUTO_13555 )
      ( DELIVER-PKG-VERIFY ?AUTO_13554 ?AUTO_13555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13561 - OBJ
      ?AUTO_13562 - LOCATION
    )
    :vars
    (
      ?AUTO_13564 - LOCATION
      ?AUTO_13563 - AIRPLANE
      ?AUTO_13565 - TRUCK
      ?AUTO_13567 - LOCATION
      ?AUTO_13566 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13564 ) ( AIRPORT ?AUTO_13562 ) ( not ( = ?AUTO_13564 ?AUTO_13562 ) ) ( AIRPLANE-AT ?AUTO_13563 ?AUTO_13562 ) ( TRUCK-AT ?AUTO_13565 ?AUTO_13567 ) ( IN-CITY ?AUTO_13567 ?AUTO_13566 ) ( IN-CITY ?AUTO_13564 ?AUTO_13566 ) ( not ( = ?AUTO_13564 ?AUTO_13567 ) ) ( not ( = ?AUTO_13562 ?AUTO_13567 ) ) ( OBJ-AT ?AUTO_13561 ?AUTO_13567 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13561 ?AUTO_13565 ?AUTO_13567 )
      ( DELIVER-PKG ?AUTO_13561 ?AUTO_13562 )
      ( DELIVER-PKG-VERIFY ?AUTO_13561 ?AUTO_13562 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13572 - OBJ
      ?AUTO_13573 - LOCATION
    )
    :vars
    (
      ?AUTO_13574 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13572 ?AUTO_13574 ) ( AIRPLANE-AT ?AUTO_13574 ?AUTO_13573 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13572 ?AUTO_13574 ?AUTO_13573 )
      ( DELIVER-PKG-VERIFY ?AUTO_13572 ?AUTO_13573 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13577 - OBJ
      ?AUTO_13578 - LOCATION
    )
    :vars
    (
      ?AUTO_13579 - AIRPLANE
      ?AUTO_13580 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_13577 ?AUTO_13579 ) ( AIRPORT ?AUTO_13580 ) ( AIRPORT ?AUTO_13578 ) ( AIRPLANE-AT ?AUTO_13579 ?AUTO_13580 ) ( not ( = ?AUTO_13580 ?AUTO_13578 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13579 ?AUTO_13580 ?AUTO_13578 )
      ( DELIVER-PKG ?AUTO_13577 ?AUTO_13578 )
      ( DELIVER-PKG-VERIFY ?AUTO_13577 ?AUTO_13578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13581 - OBJ
      ?AUTO_13582 - LOCATION
    )
    :vars
    (
      ?AUTO_13584 - LOCATION
      ?AUTO_13583 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13584 ) ( AIRPORT ?AUTO_13582 ) ( AIRPLANE-AT ?AUTO_13583 ?AUTO_13584 ) ( not ( = ?AUTO_13584 ?AUTO_13582 ) ) ( OBJ-AT ?AUTO_13581 ?AUTO_13584 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13581 ?AUTO_13583 ?AUTO_13584 )
      ( DELIVER-PKG ?AUTO_13581 ?AUTO_13582 )
      ( DELIVER-PKG-VERIFY ?AUTO_13581 ?AUTO_13582 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13589 - OBJ
      ?AUTO_13590 - LOCATION
    )
    :vars
    (
      ?AUTO_13591 - LOCATION
      ?AUTO_13593 - LOCATION
      ?AUTO_13592 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13591 ) ( AIRPORT ?AUTO_13590 ) ( not ( = ?AUTO_13591 ?AUTO_13590 ) ) ( OBJ-AT ?AUTO_13589 ?AUTO_13591 ) ( AIRPORT ?AUTO_13593 ) ( AIRPLANE-AT ?AUTO_13592 ?AUTO_13593 ) ( not ( = ?AUTO_13593 ?AUTO_13591 ) ) ( not ( = ?AUTO_13590 ?AUTO_13593 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13592 ?AUTO_13593 ?AUTO_13591 )
      ( DELIVER-PKG ?AUTO_13589 ?AUTO_13590 )
      ( DELIVER-PKG-VERIFY ?AUTO_13589 ?AUTO_13590 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13604 - OBJ
      ?AUTO_13605 - LOCATION
    )
    :vars
    (
      ?AUTO_13606 - LOCATION
      ?AUTO_13608 - LOCATION
      ?AUTO_13607 - AIRPLANE
      ?AUTO_13609 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13606 ) ( AIRPORT ?AUTO_13605 ) ( not ( = ?AUTO_13606 ?AUTO_13605 ) ) ( AIRPORT ?AUTO_13608 ) ( AIRPLANE-AT ?AUTO_13607 ?AUTO_13608 ) ( not ( = ?AUTO_13608 ?AUTO_13606 ) ) ( not ( = ?AUTO_13605 ?AUTO_13608 ) ) ( TRUCK-AT ?AUTO_13609 ?AUTO_13606 ) ( IN-TRUCK ?AUTO_13604 ?AUTO_13609 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13604 ?AUTO_13609 ?AUTO_13606 )
      ( DELIVER-PKG ?AUTO_13604 ?AUTO_13605 )
      ( DELIVER-PKG-VERIFY ?AUTO_13604 ?AUTO_13605 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13610 - OBJ
      ?AUTO_13611 - LOCATION
    )
    :vars
    (
      ?AUTO_13614 - LOCATION
      ?AUTO_13613 - LOCATION
      ?AUTO_13612 - AIRPLANE
      ?AUTO_13615 - TRUCK
      ?AUTO_13616 - LOCATION
      ?AUTO_13617 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13614 ) ( AIRPORT ?AUTO_13611 ) ( not ( = ?AUTO_13614 ?AUTO_13611 ) ) ( AIRPORT ?AUTO_13613 ) ( AIRPLANE-AT ?AUTO_13612 ?AUTO_13613 ) ( not ( = ?AUTO_13613 ?AUTO_13614 ) ) ( not ( = ?AUTO_13611 ?AUTO_13613 ) ) ( IN-TRUCK ?AUTO_13610 ?AUTO_13615 ) ( TRUCK-AT ?AUTO_13615 ?AUTO_13616 ) ( IN-CITY ?AUTO_13616 ?AUTO_13617 ) ( IN-CITY ?AUTO_13614 ?AUTO_13617 ) ( not ( = ?AUTO_13614 ?AUTO_13616 ) ) ( not ( = ?AUTO_13611 ?AUTO_13616 ) ) ( not ( = ?AUTO_13613 ?AUTO_13616 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13615 ?AUTO_13616 ?AUTO_13614 ?AUTO_13617 )
      ( DELIVER-PKG ?AUTO_13610 ?AUTO_13611 )
      ( DELIVER-PKG-VERIFY ?AUTO_13610 ?AUTO_13611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13618 - OBJ
      ?AUTO_13619 - LOCATION
    )
    :vars
    (
      ?AUTO_13625 - LOCATION
      ?AUTO_13620 - LOCATION
      ?AUTO_13621 - AIRPLANE
      ?AUTO_13624 - TRUCK
      ?AUTO_13622 - LOCATION
      ?AUTO_13623 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13625 ) ( AIRPORT ?AUTO_13619 ) ( not ( = ?AUTO_13625 ?AUTO_13619 ) ) ( AIRPORT ?AUTO_13620 ) ( AIRPLANE-AT ?AUTO_13621 ?AUTO_13620 ) ( not ( = ?AUTO_13620 ?AUTO_13625 ) ) ( not ( = ?AUTO_13619 ?AUTO_13620 ) ) ( TRUCK-AT ?AUTO_13624 ?AUTO_13622 ) ( IN-CITY ?AUTO_13622 ?AUTO_13623 ) ( IN-CITY ?AUTO_13625 ?AUTO_13623 ) ( not ( = ?AUTO_13625 ?AUTO_13622 ) ) ( not ( = ?AUTO_13619 ?AUTO_13622 ) ) ( not ( = ?AUTO_13620 ?AUTO_13622 ) ) ( OBJ-AT ?AUTO_13618 ?AUTO_13622 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13618 ?AUTO_13624 ?AUTO_13622 )
      ( DELIVER-PKG ?AUTO_13618 ?AUTO_13619 )
      ( DELIVER-PKG-VERIFY ?AUTO_13618 ?AUTO_13619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13626 - OBJ
      ?AUTO_13627 - LOCATION
    )
    :vars
    (
      ?AUTO_13629 - LOCATION
      ?AUTO_13628 - LOCATION
      ?AUTO_13632 - AIRPLANE
      ?AUTO_13633 - LOCATION
      ?AUTO_13630 - CITY
      ?AUTO_13631 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_13629 ) ( AIRPORT ?AUTO_13627 ) ( not ( = ?AUTO_13629 ?AUTO_13627 ) ) ( AIRPORT ?AUTO_13628 ) ( AIRPLANE-AT ?AUTO_13632 ?AUTO_13628 ) ( not ( = ?AUTO_13628 ?AUTO_13629 ) ) ( not ( = ?AUTO_13627 ?AUTO_13628 ) ) ( IN-CITY ?AUTO_13633 ?AUTO_13630 ) ( IN-CITY ?AUTO_13629 ?AUTO_13630 ) ( not ( = ?AUTO_13629 ?AUTO_13633 ) ) ( not ( = ?AUTO_13627 ?AUTO_13633 ) ) ( not ( = ?AUTO_13628 ?AUTO_13633 ) ) ( OBJ-AT ?AUTO_13626 ?AUTO_13633 ) ( TRUCK-AT ?AUTO_13631 ?AUTO_13629 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13631 ?AUTO_13629 ?AUTO_13633 ?AUTO_13630 )
      ( DELIVER-PKG ?AUTO_13626 ?AUTO_13627 )
      ( DELIVER-PKG-VERIFY ?AUTO_13626 ?AUTO_13627 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13668 - OBJ
      ?AUTO_13669 - LOCATION
    )
    :vars
    (
      ?AUTO_13670 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13670 ?AUTO_13669 ) ( IN-TRUCK ?AUTO_13668 ?AUTO_13670 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13668 ?AUTO_13670 ?AUTO_13669 )
      ( DELIVER-PKG-VERIFY ?AUTO_13668 ?AUTO_13669 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13671 - OBJ
      ?AUTO_13672 - LOCATION
    )
    :vars
    (
      ?AUTO_13673 - TRUCK
      ?AUTO_13674 - LOCATION
      ?AUTO_13675 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_13671 ?AUTO_13673 ) ( TRUCK-AT ?AUTO_13673 ?AUTO_13674 ) ( IN-CITY ?AUTO_13674 ?AUTO_13675 ) ( IN-CITY ?AUTO_13672 ?AUTO_13675 ) ( not ( = ?AUTO_13672 ?AUTO_13674 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13673 ?AUTO_13674 ?AUTO_13672 ?AUTO_13675 )
      ( DELIVER-PKG ?AUTO_13671 ?AUTO_13672 )
      ( DELIVER-PKG-VERIFY ?AUTO_13671 ?AUTO_13672 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13678 - OBJ
      ?AUTO_13679 - LOCATION
    )
    :vars
    (
      ?AUTO_13680 - TRUCK
      ?AUTO_13682 - LOCATION
      ?AUTO_13681 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13680 ?AUTO_13682 ) ( IN-CITY ?AUTO_13682 ?AUTO_13681 ) ( IN-CITY ?AUTO_13679 ?AUTO_13681 ) ( not ( = ?AUTO_13679 ?AUTO_13682 ) ) ( OBJ-AT ?AUTO_13678 ?AUTO_13682 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13678 ?AUTO_13680 ?AUTO_13682 )
      ( DELIVER-PKG ?AUTO_13678 ?AUTO_13679 )
      ( DELIVER-PKG-VERIFY ?AUTO_13678 ?AUTO_13679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13683 - OBJ
      ?AUTO_13684 - LOCATION
    )
    :vars
    (
      ?AUTO_13686 - LOCATION
      ?AUTO_13687 - CITY
      ?AUTO_13685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13686 ?AUTO_13687 ) ( IN-CITY ?AUTO_13684 ?AUTO_13687 ) ( not ( = ?AUTO_13684 ?AUTO_13686 ) ) ( OBJ-AT ?AUTO_13683 ?AUTO_13686 ) ( TRUCK-AT ?AUTO_13685 ?AUTO_13684 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13685 ?AUTO_13684 ?AUTO_13686 ?AUTO_13687 )
      ( DELIVER-PKG ?AUTO_13683 ?AUTO_13684 )
      ( DELIVER-PKG-VERIFY ?AUTO_13683 ?AUTO_13684 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13690 - OBJ
      ?AUTO_13691 - LOCATION
    )
    :vars
    (
      ?AUTO_13693 - LOCATION
      ?AUTO_13694 - CITY
      ?AUTO_13692 - TRUCK
      ?AUTO_13695 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13693 ?AUTO_13694 ) ( IN-CITY ?AUTO_13691 ?AUTO_13694 ) ( not ( = ?AUTO_13691 ?AUTO_13693 ) ) ( TRUCK-AT ?AUTO_13692 ?AUTO_13691 ) ( IN-AIRPLANE ?AUTO_13690 ?AUTO_13695 ) ( AIRPLANE-AT ?AUTO_13695 ?AUTO_13693 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13690 ?AUTO_13695 ?AUTO_13693 )
      ( DELIVER-PKG ?AUTO_13690 ?AUTO_13691 )
      ( DELIVER-PKG-VERIFY ?AUTO_13690 ?AUTO_13691 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13700 - OBJ
      ?AUTO_13701 - LOCATION
    )
    :vars
    (
      ?AUTO_13705 - LOCATION
      ?AUTO_13704 - CITY
      ?AUTO_13702 - TRUCK
      ?AUTO_13703 - AIRPLANE
      ?AUTO_13706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13705 ?AUTO_13704 ) ( IN-CITY ?AUTO_13701 ?AUTO_13704 ) ( not ( = ?AUTO_13701 ?AUTO_13705 ) ) ( TRUCK-AT ?AUTO_13702 ?AUTO_13701 ) ( IN-AIRPLANE ?AUTO_13700 ?AUTO_13703 ) ( AIRPORT ?AUTO_13706 ) ( AIRPORT ?AUTO_13705 ) ( AIRPLANE-AT ?AUTO_13703 ?AUTO_13706 ) ( not ( = ?AUTO_13706 ?AUTO_13705 ) ) ( not ( = ?AUTO_13701 ?AUTO_13706 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13703 ?AUTO_13706 ?AUTO_13705 )
      ( DELIVER-PKG ?AUTO_13700 ?AUTO_13701 )
      ( DELIVER-PKG-VERIFY ?AUTO_13700 ?AUTO_13701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13707 - OBJ
      ?AUTO_13708 - LOCATION
    )
    :vars
    (
      ?AUTO_13709 - LOCATION
      ?AUTO_13712 - CITY
      ?AUTO_13710 - TRUCK
      ?AUTO_13713 - LOCATION
      ?AUTO_13711 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13709 ?AUTO_13712 ) ( IN-CITY ?AUTO_13708 ?AUTO_13712 ) ( not ( = ?AUTO_13708 ?AUTO_13709 ) ) ( TRUCK-AT ?AUTO_13710 ?AUTO_13708 ) ( AIRPORT ?AUTO_13713 ) ( AIRPORT ?AUTO_13709 ) ( AIRPLANE-AT ?AUTO_13711 ?AUTO_13713 ) ( not ( = ?AUTO_13713 ?AUTO_13709 ) ) ( not ( = ?AUTO_13708 ?AUTO_13713 ) ) ( OBJ-AT ?AUTO_13707 ?AUTO_13713 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13707 ?AUTO_13711 ?AUTO_13713 )
      ( DELIVER-PKG ?AUTO_13707 ?AUTO_13708 )
      ( DELIVER-PKG-VERIFY ?AUTO_13707 ?AUTO_13708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13716 - OBJ
      ?AUTO_13717 - LOCATION
    )
    :vars
    (
      ?AUTO_13722 - LOCATION
      ?AUTO_13719 - CITY
      ?AUTO_13720 - TRUCK
      ?AUTO_13721 - LOCATION
      ?AUTO_13723 - LOCATION
      ?AUTO_13718 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13722 ?AUTO_13719 ) ( IN-CITY ?AUTO_13717 ?AUTO_13719 ) ( not ( = ?AUTO_13717 ?AUTO_13722 ) ) ( TRUCK-AT ?AUTO_13720 ?AUTO_13717 ) ( AIRPORT ?AUTO_13721 ) ( AIRPORT ?AUTO_13722 ) ( not ( = ?AUTO_13721 ?AUTO_13722 ) ) ( not ( = ?AUTO_13717 ?AUTO_13721 ) ) ( OBJ-AT ?AUTO_13716 ?AUTO_13721 ) ( AIRPORT ?AUTO_13723 ) ( AIRPLANE-AT ?AUTO_13718 ?AUTO_13723 ) ( not ( = ?AUTO_13723 ?AUTO_13721 ) ) ( not ( = ?AUTO_13717 ?AUTO_13723 ) ) ( not ( = ?AUTO_13722 ?AUTO_13723 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13718 ?AUTO_13723 ?AUTO_13721 )
      ( DELIVER-PKG ?AUTO_13716 ?AUTO_13717 )
      ( DELIVER-PKG-VERIFY ?AUTO_13716 ?AUTO_13717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13760 - OBJ
      ?AUTO_13761 - LOCATION
    )
    :vars
    (
      ?AUTO_13764 - LOCATION
      ?AUTO_13766 - CITY
      ?AUTO_13765 - TRUCK
      ?AUTO_13762 - LOCATION
      ?AUTO_13763 - LOCATION
      ?AUTO_13767 - AIRPLANE
      ?AUTO_13768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13764 ?AUTO_13766 ) ( IN-CITY ?AUTO_13761 ?AUTO_13766 ) ( not ( = ?AUTO_13761 ?AUTO_13764 ) ) ( TRUCK-AT ?AUTO_13765 ?AUTO_13761 ) ( AIRPORT ?AUTO_13762 ) ( AIRPORT ?AUTO_13764 ) ( not ( = ?AUTO_13762 ?AUTO_13764 ) ) ( not ( = ?AUTO_13761 ?AUTO_13762 ) ) ( AIRPORT ?AUTO_13763 ) ( AIRPLANE-AT ?AUTO_13767 ?AUTO_13763 ) ( not ( = ?AUTO_13763 ?AUTO_13762 ) ) ( not ( = ?AUTO_13761 ?AUTO_13763 ) ) ( not ( = ?AUTO_13764 ?AUTO_13763 ) ) ( TRUCK-AT ?AUTO_13768 ?AUTO_13762 ) ( IN-TRUCK ?AUTO_13760 ?AUTO_13768 ) ( not ( = ?AUTO_13765 ?AUTO_13768 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13760 ?AUTO_13768 ?AUTO_13762 )
      ( DELIVER-PKG ?AUTO_13760 ?AUTO_13761 )
      ( DELIVER-PKG-VERIFY ?AUTO_13760 ?AUTO_13761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13773 - OBJ
      ?AUTO_13774 - LOCATION
    )
    :vars
    (
      ?AUTO_13781 - LOCATION
      ?AUTO_13778 - CITY
      ?AUTO_13775 - TRUCK
      ?AUTO_13777 - LOCATION
      ?AUTO_13780 - LOCATION
      ?AUTO_13779 - AIRPLANE
      ?AUTO_13776 - TRUCK
      ?AUTO_13782 - LOCATION
      ?AUTO_13783 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13781 ?AUTO_13778 ) ( IN-CITY ?AUTO_13774 ?AUTO_13778 ) ( not ( = ?AUTO_13774 ?AUTO_13781 ) ) ( TRUCK-AT ?AUTO_13775 ?AUTO_13774 ) ( AIRPORT ?AUTO_13777 ) ( AIRPORT ?AUTO_13781 ) ( not ( = ?AUTO_13777 ?AUTO_13781 ) ) ( not ( = ?AUTO_13774 ?AUTO_13777 ) ) ( AIRPORT ?AUTO_13780 ) ( AIRPLANE-AT ?AUTO_13779 ?AUTO_13780 ) ( not ( = ?AUTO_13780 ?AUTO_13777 ) ) ( not ( = ?AUTO_13774 ?AUTO_13780 ) ) ( not ( = ?AUTO_13781 ?AUTO_13780 ) ) ( IN-TRUCK ?AUTO_13773 ?AUTO_13776 ) ( not ( = ?AUTO_13775 ?AUTO_13776 ) ) ( TRUCK-AT ?AUTO_13776 ?AUTO_13782 ) ( IN-CITY ?AUTO_13782 ?AUTO_13783 ) ( IN-CITY ?AUTO_13777 ?AUTO_13783 ) ( not ( = ?AUTO_13777 ?AUTO_13782 ) ) ( not ( = ?AUTO_13774 ?AUTO_13782 ) ) ( not ( = ?AUTO_13781 ?AUTO_13782 ) ) ( not ( = ?AUTO_13778 ?AUTO_13783 ) ) ( not ( = ?AUTO_13780 ?AUTO_13782 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13776 ?AUTO_13782 ?AUTO_13777 ?AUTO_13783 )
      ( DELIVER-PKG ?AUTO_13773 ?AUTO_13774 )
      ( DELIVER-PKG-VERIFY ?AUTO_13773 ?AUTO_13774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13784 - OBJ
      ?AUTO_13785 - LOCATION
    )
    :vars
    (
      ?AUTO_13787 - LOCATION
      ?AUTO_13791 - CITY
      ?AUTO_13789 - TRUCK
      ?AUTO_13790 - LOCATION
      ?AUTO_13786 - LOCATION
      ?AUTO_13788 - AIRPLANE
      ?AUTO_13792 - TRUCK
      ?AUTO_13794 - LOCATION
      ?AUTO_13793 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13787 ?AUTO_13791 ) ( IN-CITY ?AUTO_13785 ?AUTO_13791 ) ( not ( = ?AUTO_13785 ?AUTO_13787 ) ) ( TRUCK-AT ?AUTO_13789 ?AUTO_13785 ) ( AIRPORT ?AUTO_13790 ) ( AIRPORT ?AUTO_13787 ) ( not ( = ?AUTO_13790 ?AUTO_13787 ) ) ( not ( = ?AUTO_13785 ?AUTO_13790 ) ) ( AIRPORT ?AUTO_13786 ) ( AIRPLANE-AT ?AUTO_13788 ?AUTO_13786 ) ( not ( = ?AUTO_13786 ?AUTO_13790 ) ) ( not ( = ?AUTO_13785 ?AUTO_13786 ) ) ( not ( = ?AUTO_13787 ?AUTO_13786 ) ) ( not ( = ?AUTO_13789 ?AUTO_13792 ) ) ( TRUCK-AT ?AUTO_13792 ?AUTO_13794 ) ( IN-CITY ?AUTO_13794 ?AUTO_13793 ) ( IN-CITY ?AUTO_13790 ?AUTO_13793 ) ( not ( = ?AUTO_13790 ?AUTO_13794 ) ) ( not ( = ?AUTO_13785 ?AUTO_13794 ) ) ( not ( = ?AUTO_13787 ?AUTO_13794 ) ) ( not ( = ?AUTO_13791 ?AUTO_13793 ) ) ( not ( = ?AUTO_13786 ?AUTO_13794 ) ) ( OBJ-AT ?AUTO_13784 ?AUTO_13794 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13784 ?AUTO_13792 ?AUTO_13794 )
      ( DELIVER-PKG ?AUTO_13784 ?AUTO_13785 )
      ( DELIVER-PKG-VERIFY ?AUTO_13784 ?AUTO_13785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13799 - OBJ
      ?AUTO_13800 - LOCATION
    )
    :vars
    (
      ?AUTO_13801 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13801 ?AUTO_13800 ) ( IN-TRUCK ?AUTO_13799 ?AUTO_13801 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13799 ?AUTO_13801 ?AUTO_13800 )
      ( DELIVER-PKG-VERIFY ?AUTO_13799 ?AUTO_13800 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13806 - OBJ
      ?AUTO_13807 - LOCATION
    )
    :vars
    (
      ?AUTO_13809 - TRUCK
      ?AUTO_13808 - LOCATION
      ?AUTO_13810 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13809 ?AUTO_13808 ) ( IN-CITY ?AUTO_13808 ?AUTO_13810 ) ( IN-CITY ?AUTO_13807 ?AUTO_13810 ) ( not ( = ?AUTO_13807 ?AUTO_13808 ) ) ( OBJ-AT ?AUTO_13806 ?AUTO_13808 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13806 ?AUTO_13809 ?AUTO_13808 )
      ( DELIVER-PKG ?AUTO_13806 ?AUTO_13807 )
      ( DELIVER-PKG-VERIFY ?AUTO_13806 ?AUTO_13807 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13815 - OBJ
      ?AUTO_13816 - LOCATION
    )
    :vars
    (
      ?AUTO_13819 - LOCATION
      ?AUTO_13818 - CITY
      ?AUTO_13817 - TRUCK
      ?AUTO_13820 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13819 ?AUTO_13818 ) ( IN-CITY ?AUTO_13816 ?AUTO_13818 ) ( not ( = ?AUTO_13816 ?AUTO_13819 ) ) ( TRUCK-AT ?AUTO_13817 ?AUTO_13816 ) ( IN-AIRPLANE ?AUTO_13815 ?AUTO_13820 ) ( AIRPLANE-AT ?AUTO_13820 ?AUTO_13819 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_13815 ?AUTO_13820 ?AUTO_13819 )
      ( DELIVER-PKG ?AUTO_13815 ?AUTO_13816 )
      ( DELIVER-PKG-VERIFY ?AUTO_13815 ?AUTO_13816 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13823 - OBJ
      ?AUTO_13824 - LOCATION
    )
    :vars
    (
      ?AUTO_13825 - LOCATION
      ?AUTO_13828 - CITY
      ?AUTO_13827 - TRUCK
      ?AUTO_13826 - AIRPLANE
      ?AUTO_13829 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13825 ?AUTO_13828 ) ( IN-CITY ?AUTO_13824 ?AUTO_13828 ) ( not ( = ?AUTO_13824 ?AUTO_13825 ) ) ( TRUCK-AT ?AUTO_13827 ?AUTO_13824 ) ( IN-AIRPLANE ?AUTO_13823 ?AUTO_13826 ) ( AIRPORT ?AUTO_13829 ) ( AIRPORT ?AUTO_13825 ) ( AIRPLANE-AT ?AUTO_13826 ?AUTO_13829 ) ( not ( = ?AUTO_13829 ?AUTO_13825 ) ) ( not ( = ?AUTO_13824 ?AUTO_13829 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13826 ?AUTO_13829 ?AUTO_13825 )
      ( DELIVER-PKG ?AUTO_13823 ?AUTO_13824 )
      ( DELIVER-PKG-VERIFY ?AUTO_13823 ?AUTO_13824 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13830 - OBJ
      ?AUTO_13831 - LOCATION
    )
    :vars
    (
      ?AUTO_13834 - LOCATION
      ?AUTO_13832 - CITY
      ?AUTO_13833 - TRUCK
      ?AUTO_13836 - LOCATION
      ?AUTO_13835 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13834 ?AUTO_13832 ) ( IN-CITY ?AUTO_13831 ?AUTO_13832 ) ( not ( = ?AUTO_13831 ?AUTO_13834 ) ) ( TRUCK-AT ?AUTO_13833 ?AUTO_13831 ) ( AIRPORT ?AUTO_13836 ) ( AIRPORT ?AUTO_13834 ) ( AIRPLANE-AT ?AUTO_13835 ?AUTO_13836 ) ( not ( = ?AUTO_13836 ?AUTO_13834 ) ) ( not ( = ?AUTO_13831 ?AUTO_13836 ) ) ( OBJ-AT ?AUTO_13830 ?AUTO_13836 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_13830 ?AUTO_13835 ?AUTO_13836 )
      ( DELIVER-PKG ?AUTO_13830 ?AUTO_13831 )
      ( DELIVER-PKG-VERIFY ?AUTO_13830 ?AUTO_13831 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13841 - OBJ
      ?AUTO_13842 - LOCATION
    )
    :vars
    (
      ?AUTO_13843 - LOCATION
      ?AUTO_13844 - CITY
      ?AUTO_13847 - TRUCK
      ?AUTO_13845 - LOCATION
      ?AUTO_13848 - LOCATION
      ?AUTO_13846 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13843 ?AUTO_13844 ) ( IN-CITY ?AUTO_13842 ?AUTO_13844 ) ( not ( = ?AUTO_13842 ?AUTO_13843 ) ) ( TRUCK-AT ?AUTO_13847 ?AUTO_13842 ) ( AIRPORT ?AUTO_13845 ) ( AIRPORT ?AUTO_13843 ) ( not ( = ?AUTO_13845 ?AUTO_13843 ) ) ( not ( = ?AUTO_13842 ?AUTO_13845 ) ) ( OBJ-AT ?AUTO_13841 ?AUTO_13845 ) ( AIRPORT ?AUTO_13848 ) ( AIRPLANE-AT ?AUTO_13846 ?AUTO_13848 ) ( not ( = ?AUTO_13848 ?AUTO_13845 ) ) ( not ( = ?AUTO_13842 ?AUTO_13848 ) ) ( not ( = ?AUTO_13843 ?AUTO_13848 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_13846 ?AUTO_13848 ?AUTO_13845 )
      ( DELIVER-PKG ?AUTO_13841 ?AUTO_13842 )
      ( DELIVER-PKG-VERIFY ?AUTO_13841 ?AUTO_13842 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13859 - OBJ
      ?AUTO_13860 - LOCATION
    )
    :vars
    (
      ?AUTO_13862 - LOCATION
      ?AUTO_13866 - CITY
      ?AUTO_13865 - TRUCK
      ?AUTO_13864 - LOCATION
      ?AUTO_13861 - LOCATION
      ?AUTO_13863 - AIRPLANE
      ?AUTO_13867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13862 ?AUTO_13866 ) ( IN-CITY ?AUTO_13860 ?AUTO_13866 ) ( not ( = ?AUTO_13860 ?AUTO_13862 ) ) ( TRUCK-AT ?AUTO_13865 ?AUTO_13860 ) ( AIRPORT ?AUTO_13864 ) ( AIRPORT ?AUTO_13862 ) ( not ( = ?AUTO_13864 ?AUTO_13862 ) ) ( not ( = ?AUTO_13860 ?AUTO_13864 ) ) ( AIRPORT ?AUTO_13861 ) ( AIRPLANE-AT ?AUTO_13863 ?AUTO_13861 ) ( not ( = ?AUTO_13861 ?AUTO_13864 ) ) ( not ( = ?AUTO_13860 ?AUTO_13861 ) ) ( not ( = ?AUTO_13862 ?AUTO_13861 ) ) ( TRUCK-AT ?AUTO_13867 ?AUTO_13864 ) ( IN-TRUCK ?AUTO_13859 ?AUTO_13867 ) ( not ( = ?AUTO_13865 ?AUTO_13867 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_13859 ?AUTO_13867 ?AUTO_13864 )
      ( DELIVER-PKG ?AUTO_13859 ?AUTO_13860 )
      ( DELIVER-PKG-VERIFY ?AUTO_13859 ?AUTO_13860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13868 - OBJ
      ?AUTO_13869 - LOCATION
    )
    :vars
    (
      ?AUTO_13874 - LOCATION
      ?AUTO_13873 - CITY
      ?AUTO_13870 - TRUCK
      ?AUTO_13872 - LOCATION
      ?AUTO_13875 - LOCATION
      ?AUTO_13871 - AIRPLANE
      ?AUTO_13876 - TRUCK
      ?AUTO_13877 - LOCATION
      ?AUTO_13878 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13874 ?AUTO_13873 ) ( IN-CITY ?AUTO_13869 ?AUTO_13873 ) ( not ( = ?AUTO_13869 ?AUTO_13874 ) ) ( TRUCK-AT ?AUTO_13870 ?AUTO_13869 ) ( AIRPORT ?AUTO_13872 ) ( AIRPORT ?AUTO_13874 ) ( not ( = ?AUTO_13872 ?AUTO_13874 ) ) ( not ( = ?AUTO_13869 ?AUTO_13872 ) ) ( AIRPORT ?AUTO_13875 ) ( AIRPLANE-AT ?AUTO_13871 ?AUTO_13875 ) ( not ( = ?AUTO_13875 ?AUTO_13872 ) ) ( not ( = ?AUTO_13869 ?AUTO_13875 ) ) ( not ( = ?AUTO_13874 ?AUTO_13875 ) ) ( IN-TRUCK ?AUTO_13868 ?AUTO_13876 ) ( not ( = ?AUTO_13870 ?AUTO_13876 ) ) ( TRUCK-AT ?AUTO_13876 ?AUTO_13877 ) ( IN-CITY ?AUTO_13877 ?AUTO_13878 ) ( IN-CITY ?AUTO_13872 ?AUTO_13878 ) ( not ( = ?AUTO_13872 ?AUTO_13877 ) ) ( not ( = ?AUTO_13869 ?AUTO_13877 ) ) ( not ( = ?AUTO_13874 ?AUTO_13877 ) ) ( not ( = ?AUTO_13873 ?AUTO_13878 ) ) ( not ( = ?AUTO_13875 ?AUTO_13877 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13876 ?AUTO_13877 ?AUTO_13872 ?AUTO_13878 )
      ( DELIVER-PKG ?AUTO_13868 ?AUTO_13869 )
      ( DELIVER-PKG-VERIFY ?AUTO_13868 ?AUTO_13869 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13879 - OBJ
      ?AUTO_13880 - LOCATION
    )
    :vars
    (
      ?AUTO_13886 - LOCATION
      ?AUTO_13883 - CITY
      ?AUTO_13885 - TRUCK
      ?AUTO_13888 - LOCATION
      ?AUTO_13881 - LOCATION
      ?AUTO_13882 - AIRPLANE
      ?AUTO_13884 - TRUCK
      ?AUTO_13887 - LOCATION
      ?AUTO_13889 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13886 ?AUTO_13883 ) ( IN-CITY ?AUTO_13880 ?AUTO_13883 ) ( not ( = ?AUTO_13880 ?AUTO_13886 ) ) ( TRUCK-AT ?AUTO_13885 ?AUTO_13880 ) ( AIRPORT ?AUTO_13888 ) ( AIRPORT ?AUTO_13886 ) ( not ( = ?AUTO_13888 ?AUTO_13886 ) ) ( not ( = ?AUTO_13880 ?AUTO_13888 ) ) ( AIRPORT ?AUTO_13881 ) ( AIRPLANE-AT ?AUTO_13882 ?AUTO_13881 ) ( not ( = ?AUTO_13881 ?AUTO_13888 ) ) ( not ( = ?AUTO_13880 ?AUTO_13881 ) ) ( not ( = ?AUTO_13886 ?AUTO_13881 ) ) ( not ( = ?AUTO_13885 ?AUTO_13884 ) ) ( TRUCK-AT ?AUTO_13884 ?AUTO_13887 ) ( IN-CITY ?AUTO_13887 ?AUTO_13889 ) ( IN-CITY ?AUTO_13888 ?AUTO_13889 ) ( not ( = ?AUTO_13888 ?AUTO_13887 ) ) ( not ( = ?AUTO_13880 ?AUTO_13887 ) ) ( not ( = ?AUTO_13886 ?AUTO_13887 ) ) ( not ( = ?AUTO_13883 ?AUTO_13889 ) ) ( not ( = ?AUTO_13881 ?AUTO_13887 ) ) ( OBJ-AT ?AUTO_13879 ?AUTO_13887 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_13879 ?AUTO_13884 ?AUTO_13887 )
      ( DELIVER-PKG ?AUTO_13879 ?AUTO_13880 )
      ( DELIVER-PKG-VERIFY ?AUTO_13879 ?AUTO_13880 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13890 - OBJ
      ?AUTO_13891 - LOCATION
    )
    :vars
    (
      ?AUTO_13892 - LOCATION
      ?AUTO_13897 - CITY
      ?AUTO_13900 - TRUCK
      ?AUTO_13894 - LOCATION
      ?AUTO_13898 - LOCATION
      ?AUTO_13896 - AIRPLANE
      ?AUTO_13899 - TRUCK
      ?AUTO_13893 - LOCATION
      ?AUTO_13895 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_13892 ?AUTO_13897 ) ( IN-CITY ?AUTO_13891 ?AUTO_13897 ) ( not ( = ?AUTO_13891 ?AUTO_13892 ) ) ( TRUCK-AT ?AUTO_13900 ?AUTO_13891 ) ( AIRPORT ?AUTO_13894 ) ( AIRPORT ?AUTO_13892 ) ( not ( = ?AUTO_13894 ?AUTO_13892 ) ) ( not ( = ?AUTO_13891 ?AUTO_13894 ) ) ( AIRPORT ?AUTO_13898 ) ( AIRPLANE-AT ?AUTO_13896 ?AUTO_13898 ) ( not ( = ?AUTO_13898 ?AUTO_13894 ) ) ( not ( = ?AUTO_13891 ?AUTO_13898 ) ) ( not ( = ?AUTO_13892 ?AUTO_13898 ) ) ( not ( = ?AUTO_13900 ?AUTO_13899 ) ) ( IN-CITY ?AUTO_13893 ?AUTO_13895 ) ( IN-CITY ?AUTO_13894 ?AUTO_13895 ) ( not ( = ?AUTO_13894 ?AUTO_13893 ) ) ( not ( = ?AUTO_13891 ?AUTO_13893 ) ) ( not ( = ?AUTO_13892 ?AUTO_13893 ) ) ( not ( = ?AUTO_13897 ?AUTO_13895 ) ) ( not ( = ?AUTO_13898 ?AUTO_13893 ) ) ( OBJ-AT ?AUTO_13890 ?AUTO_13893 ) ( TRUCK-AT ?AUTO_13899 ?AUTO_13894 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_13899 ?AUTO_13894 ?AUTO_13893 ?AUTO_13895 )
      ( DELIVER-PKG ?AUTO_13890 ?AUTO_13891 )
      ( DELIVER-PKG-VERIFY ?AUTO_13890 ?AUTO_13891 ) )
  )

)

