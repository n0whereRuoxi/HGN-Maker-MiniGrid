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
      ?AUTO_7 - OBJ
      ?AUTO_8 - LOCATION
    )
    :vars
    (
      ?AUTO_9 - AIRPLANE
      ?AUTO_10 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7 ?AUTO_9 ) ( AIRPORT ?AUTO_10 ) ( AIRPORT ?AUTO_8 ) ( AIRPLANE-AT ?AUTO_9 ?AUTO_10 ) ( not ( = ?AUTO_10 ?AUTO_8 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9 ?AUTO_10 ?AUTO_8 )
      ( DELIVER-PKG ?AUTO_7 ?AUTO_8 )
      ( DELIVER-PKG-VERIFY ?AUTO_7 ?AUTO_8 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_15 - OBJ
      ?AUTO_16 - LOCATION
    )
    :vars
    (
      ?AUTO_17 - LOCATION
      ?AUTO_18 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_17 ) ( AIRPORT ?AUTO_16 ) ( AIRPLANE-AT ?AUTO_18 ?AUTO_17 ) ( not ( = ?AUTO_17 ?AUTO_16 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_17 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_15 ?AUTO_18 ?AUTO_17 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_19 - OBJ
      ?AUTO_20 - LOCATION
    )
    :vars
    (
      ?AUTO_21 - LOCATION
      ?AUTO_23 - LOCATION
      ?AUTO_22 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_21 ) ( AIRPORT ?AUTO_20 ) ( not ( = ?AUTO_21 ?AUTO_20 ) ) ( OBJ-AT ?AUTO_19 ?AUTO_21 ) ( AIRPORT ?AUTO_23 ) ( AIRPLANE-AT ?AUTO_22 ?AUTO_23 ) ( not ( = ?AUTO_23 ?AUTO_21 ) ) ( not ( = ?AUTO_20 ?AUTO_23 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_22 ?AUTO_23 ?AUTO_21 )
      ( DELIVER-PKG ?AUTO_19 ?AUTO_20 )
      ( DELIVER-PKG-VERIFY ?AUTO_19 ?AUTO_20 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_26 - OBJ
      ?AUTO_27 - LOCATION
    )
    :vars
    (
      ?AUTO_28 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_26 ?AUTO_28 ) ( AIRPLANE-AT ?AUTO_28 ?AUTO_27 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_26 ?AUTO_28 ?AUTO_27 )
      ( DELIVER-PKG-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_29 - OBJ
      ?AUTO_30 - LOCATION
    )
    :vars
    (
      ?AUTO_31 - AIRPLANE
      ?AUTO_32 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_29 ?AUTO_31 ) ( AIRPORT ?AUTO_32 ) ( AIRPORT ?AUTO_30 ) ( AIRPLANE-AT ?AUTO_31 ?AUTO_32 ) ( not ( = ?AUTO_32 ?AUTO_30 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_31 ?AUTO_32 ?AUTO_30 )
      ( DELIVER-PKG ?AUTO_29 ?AUTO_30 )
      ( DELIVER-PKG-VERIFY ?AUTO_29 ?AUTO_30 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_39 - OBJ
      ?AUTO_40 - LOCATION
    )
    :vars
    (
      ?AUTO_41 - LOCATION
      ?AUTO_42 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_41 ) ( AIRPORT ?AUTO_40 ) ( AIRPLANE-AT ?AUTO_42 ?AUTO_41 ) ( not ( = ?AUTO_41 ?AUTO_40 ) ) ( OBJ-AT ?AUTO_39 ?AUTO_41 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_39 ?AUTO_42 ?AUTO_41 )
      ( DELIVER-PKG ?AUTO_39 ?AUTO_40 )
      ( DELIVER-PKG-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_43 - OBJ
      ?AUTO_44 - LOCATION
    )
    :vars
    (
      ?AUTO_45 - LOCATION
      ?AUTO_47 - LOCATION
      ?AUTO_46 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_45 ) ( AIRPORT ?AUTO_44 ) ( not ( = ?AUTO_45 ?AUTO_44 ) ) ( OBJ-AT ?AUTO_43 ?AUTO_45 ) ( AIRPORT ?AUTO_47 ) ( AIRPLANE-AT ?AUTO_46 ?AUTO_47 ) ( not ( = ?AUTO_47 ?AUTO_45 ) ) ( not ( = ?AUTO_44 ?AUTO_47 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_46 ?AUTO_47 ?AUTO_45 )
      ( DELIVER-PKG ?AUTO_43 ?AUTO_44 )
      ( DELIVER-PKG-VERIFY ?AUTO_43 ?AUTO_44 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_54 - OBJ
      ?AUTO_55 - LOCATION
    )
    :vars
    (
      ?AUTO_56 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_56 ?AUTO_55 ) ( IN-TRUCK ?AUTO_54 ?AUTO_56 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_54 ?AUTO_56 ?AUTO_55 )
      ( DELIVER-PKG-VERIFY ?AUTO_54 ?AUTO_55 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_61 - OBJ
      ?AUTO_62 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - TRUCK
      ?AUTO_64 - LOCATION
      ?AUTO_65 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_61 ?AUTO_63 ) ( TRUCK-AT ?AUTO_63 ?AUTO_64 ) ( IN-CITY ?AUTO_64 ?AUTO_65 ) ( IN-CITY ?AUTO_62 ?AUTO_65 ) ( not ( = ?AUTO_62 ?AUTO_64 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_63 ?AUTO_64 ?AUTO_62 ?AUTO_65 )
      ( DELIVER-PKG ?AUTO_61 ?AUTO_62 )
      ( DELIVER-PKG-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_66 - OBJ
      ?AUTO_67 - LOCATION
    )
    :vars
    (
      ?AUTO_68 - TRUCK
      ?AUTO_69 - LOCATION
      ?AUTO_70 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_68 ?AUTO_69 ) ( IN-CITY ?AUTO_69 ?AUTO_70 ) ( IN-CITY ?AUTO_67 ?AUTO_70 ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) ( OBJ-AT ?AUTO_66 ?AUTO_69 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_66 ?AUTO_68 ?AUTO_69 )
      ( DELIVER-PKG ?AUTO_66 ?AUTO_67 )
      ( DELIVER-PKG-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_75 - OBJ
      ?AUTO_76 - LOCATION
    )
    :vars
    (
      ?AUTO_78 - TRUCK
      ?AUTO_77 - LOCATION
      ?AUTO_79 - CITY
      ?AUTO_80 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_78 ?AUTO_77 ) ( IN-CITY ?AUTO_77 ?AUTO_79 ) ( IN-CITY ?AUTO_76 ?AUTO_79 ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( IN-AIRPLANE ?AUTO_75 ?AUTO_80 ) ( AIRPLANE-AT ?AUTO_80 ?AUTO_77 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_75 ?AUTO_80 ?AUTO_77 )
      ( DELIVER-PKG ?AUTO_75 ?AUTO_76 )
      ( DELIVER-PKG-VERIFY ?AUTO_75 ?AUTO_76 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_81 - OBJ
      ?AUTO_82 - LOCATION
    )
    :vars
    (
      ?AUTO_85 - LOCATION
      ?AUTO_84 - CITY
      ?AUTO_86 - AIRPLANE
      ?AUTO_83 - TRUCK
      ?AUTO_87 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_85 ?AUTO_84 ) ( IN-CITY ?AUTO_82 ?AUTO_84 ) ( not ( = ?AUTO_82 ?AUTO_85 ) ) ( IN-AIRPLANE ?AUTO_81 ?AUTO_86 ) ( AIRPLANE-AT ?AUTO_86 ?AUTO_85 ) ( TRUCK-AT ?AUTO_83 ?AUTO_87 ) ( IN-CITY ?AUTO_87 ?AUTO_84 ) ( not ( = ?AUTO_85 ?AUTO_87 ) ) ( not ( = ?AUTO_82 ?AUTO_87 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_83 ?AUTO_87 ?AUTO_85 ?AUTO_84 )
      ( DELIVER-PKG ?AUTO_81 ?AUTO_82 )
      ( DELIVER-PKG-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_88 - OBJ
      ?AUTO_89 - LOCATION
    )
    :vars
    (
      ?AUTO_92 - LOCATION
      ?AUTO_91 - CITY
      ?AUTO_94 - AIRPLANE
      ?AUTO_90 - TRUCK
      ?AUTO_93 - LOCATION
      ?AUTO_95 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_92 ?AUTO_91 ) ( IN-CITY ?AUTO_89 ?AUTO_91 ) ( not ( = ?AUTO_89 ?AUTO_92 ) ) ( IN-AIRPLANE ?AUTO_88 ?AUTO_94 ) ( TRUCK-AT ?AUTO_90 ?AUTO_93 ) ( IN-CITY ?AUTO_93 ?AUTO_91 ) ( not ( = ?AUTO_92 ?AUTO_93 ) ) ( not ( = ?AUTO_89 ?AUTO_93 ) ) ( AIRPORT ?AUTO_95 ) ( AIRPORT ?AUTO_92 ) ( AIRPLANE-AT ?AUTO_94 ?AUTO_95 ) ( not ( = ?AUTO_95 ?AUTO_92 ) ) ( not ( = ?AUTO_89 ?AUTO_95 ) ) ( not ( = ?AUTO_93 ?AUTO_95 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_94 ?AUTO_95 ?AUTO_92 )
      ( DELIVER-PKG ?AUTO_88 ?AUTO_89 )
      ( DELIVER-PKG-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_100 - OBJ
      ?AUTO_101 - LOCATION
    )
    :vars
    (
      ?AUTO_103 - LOCATION
      ?AUTO_106 - CITY
      ?AUTO_107 - TRUCK
      ?AUTO_104 - LOCATION
      ?AUTO_105 - LOCATION
      ?AUTO_102 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_103 ?AUTO_106 ) ( IN-CITY ?AUTO_101 ?AUTO_106 ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( TRUCK-AT ?AUTO_107 ?AUTO_104 ) ( IN-CITY ?AUTO_104 ?AUTO_106 ) ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( not ( = ?AUTO_101 ?AUTO_104 ) ) ( AIRPORT ?AUTO_105 ) ( AIRPORT ?AUTO_103 ) ( AIRPLANE-AT ?AUTO_102 ?AUTO_105 ) ( not ( = ?AUTO_105 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_105 ) ) ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( OBJ-AT ?AUTO_100 ?AUTO_105 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_100 ?AUTO_102 ?AUTO_105 )
      ( DELIVER-PKG ?AUTO_100 ?AUTO_101 )
      ( DELIVER-PKG-VERIFY ?AUTO_100 ?AUTO_101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_108 - OBJ
      ?AUTO_109 - LOCATION
    )
    :vars
    (
      ?AUTO_112 - LOCATION
      ?AUTO_110 - CITY
      ?AUTO_113 - TRUCK
      ?AUTO_114 - LOCATION
      ?AUTO_111 - LOCATION
      ?AUTO_116 - LOCATION
      ?AUTO_115 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_112 ?AUTO_110 ) ( IN-CITY ?AUTO_109 ?AUTO_110 ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( TRUCK-AT ?AUTO_113 ?AUTO_114 ) ( IN-CITY ?AUTO_114 ?AUTO_110 ) ( not ( = ?AUTO_112 ?AUTO_114 ) ) ( not ( = ?AUTO_109 ?AUTO_114 ) ) ( AIRPORT ?AUTO_111 ) ( AIRPORT ?AUTO_112 ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( not ( = ?AUTO_114 ?AUTO_111 ) ) ( OBJ-AT ?AUTO_108 ?AUTO_111 ) ( AIRPORT ?AUTO_116 ) ( AIRPLANE-AT ?AUTO_115 ?AUTO_116 ) ( not ( = ?AUTO_116 ?AUTO_111 ) ) ( not ( = ?AUTO_109 ?AUTO_116 ) ) ( not ( = ?AUTO_112 ?AUTO_116 ) ) ( not ( = ?AUTO_114 ?AUTO_116 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_115 ?AUTO_116 ?AUTO_111 )
      ( DELIVER-PKG ?AUTO_108 ?AUTO_109 )
      ( DELIVER-PKG-VERIFY ?AUTO_108 ?AUTO_109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_119 - OBJ
      ?AUTO_120 - LOCATION
    )
    :vars
    (
      ?AUTO_121 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_121 ?AUTO_120 ) ( IN-TRUCK ?AUTO_119 ?AUTO_121 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_119 ?AUTO_121 ?AUTO_120 )
      ( DELIVER-PKG-VERIFY ?AUTO_119 ?AUTO_120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_124 - OBJ
      ?AUTO_125 - LOCATION
    )
    :vars
    (
      ?AUTO_126 - TRUCK
      ?AUTO_127 - LOCATION
      ?AUTO_128 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_124 ?AUTO_126 ) ( TRUCK-AT ?AUTO_126 ?AUTO_127 ) ( IN-CITY ?AUTO_127 ?AUTO_128 ) ( IN-CITY ?AUTO_125 ?AUTO_128 ) ( not ( = ?AUTO_125 ?AUTO_127 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_126 ?AUTO_127 ?AUTO_125 ?AUTO_128 )
      ( DELIVER-PKG ?AUTO_124 ?AUTO_125 )
      ( DELIVER-PKG-VERIFY ?AUTO_124 ?AUTO_125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_129 - OBJ
      ?AUTO_130 - LOCATION
    )
    :vars
    (
      ?AUTO_131 - TRUCK
      ?AUTO_132 - LOCATION
      ?AUTO_133 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_131 ?AUTO_132 ) ( IN-CITY ?AUTO_132 ?AUTO_133 ) ( IN-CITY ?AUTO_130 ?AUTO_133 ) ( not ( = ?AUTO_130 ?AUTO_132 ) ) ( OBJ-AT ?AUTO_129 ?AUTO_132 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_129 ?AUTO_131 ?AUTO_132 )
      ( DELIVER-PKG ?AUTO_129 ?AUTO_130 )
      ( DELIVER-PKG-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_138 - OBJ
      ?AUTO_139 - LOCATION
    )
    :vars
    (
      ?AUTO_140 - TRUCK
      ?AUTO_142 - LOCATION
      ?AUTO_141 - CITY
      ?AUTO_143 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_140 ?AUTO_142 ) ( IN-CITY ?AUTO_142 ?AUTO_141 ) ( IN-CITY ?AUTO_139 ?AUTO_141 ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( IN-AIRPLANE ?AUTO_138 ?AUTO_143 ) ( AIRPLANE-AT ?AUTO_143 ?AUTO_142 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_138 ?AUTO_143 ?AUTO_142 )
      ( DELIVER-PKG ?AUTO_138 ?AUTO_139 )
      ( DELIVER-PKG-VERIFY ?AUTO_138 ?AUTO_139 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_144 - OBJ
      ?AUTO_145 - LOCATION
    )
    :vars
    (
      ?AUTO_147 - TRUCK
      ?AUTO_148 - LOCATION
      ?AUTO_146 - CITY
      ?AUTO_149 - AIRPLANE
      ?AUTO_150 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_147 ?AUTO_148 ) ( IN-CITY ?AUTO_148 ?AUTO_146 ) ( IN-CITY ?AUTO_145 ?AUTO_146 ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( IN-AIRPLANE ?AUTO_144 ?AUTO_149 ) ( AIRPORT ?AUTO_150 ) ( AIRPORT ?AUTO_148 ) ( AIRPLANE-AT ?AUTO_149 ?AUTO_150 ) ( not ( = ?AUTO_150 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_149 ?AUTO_150 ?AUTO_148 )
      ( DELIVER-PKG ?AUTO_144 ?AUTO_145 )
      ( DELIVER-PKG-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_157 - OBJ
      ?AUTO_158 - LOCATION
    )
    :vars
    (
      ?AUTO_162 - TRUCK
      ?AUTO_159 - LOCATION
      ?AUTO_163 - CITY
      ?AUTO_160 - LOCATION
      ?AUTO_161 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_162 ?AUTO_159 ) ( IN-CITY ?AUTO_159 ?AUTO_163 ) ( IN-CITY ?AUTO_158 ?AUTO_163 ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( AIRPORT ?AUTO_160 ) ( AIRPORT ?AUTO_159 ) ( AIRPLANE-AT ?AUTO_161 ?AUTO_160 ) ( not ( = ?AUTO_160 ?AUTO_159 ) ) ( not ( = ?AUTO_158 ?AUTO_160 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_160 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_157 ?AUTO_161 ?AUTO_160 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_164 - OBJ
      ?AUTO_165 - LOCATION
    )
    :vars
    (
      ?AUTO_169 - TRUCK
      ?AUTO_170 - LOCATION
      ?AUTO_166 - CITY
      ?AUTO_167 - LOCATION
      ?AUTO_171 - LOCATION
      ?AUTO_168 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_169 ?AUTO_170 ) ( IN-CITY ?AUTO_170 ?AUTO_166 ) ( IN-CITY ?AUTO_165 ?AUTO_166 ) ( not ( = ?AUTO_165 ?AUTO_170 ) ) ( AIRPORT ?AUTO_167 ) ( AIRPORT ?AUTO_170 ) ( not ( = ?AUTO_167 ?AUTO_170 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( OBJ-AT ?AUTO_164 ?AUTO_167 ) ( AIRPORT ?AUTO_171 ) ( AIRPLANE-AT ?AUTO_168 ?AUTO_171 ) ( not ( = ?AUTO_171 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_171 ) ) ( not ( = ?AUTO_170 ?AUTO_171 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_168 ?AUTO_171 ?AUTO_167 )
      ( DELIVER-PKG ?AUTO_164 ?AUTO_165 )
      ( DELIVER-PKG-VERIFY ?AUTO_164 ?AUTO_165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_178 - OBJ
      ?AUTO_179 - LOCATION
    )
    :vars
    (
      ?AUTO_180 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_180 ?AUTO_179 ) ( IN-TRUCK ?AUTO_178 ?AUTO_180 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_178 ?AUTO_180 ?AUTO_179 )
      ( DELIVER-PKG-VERIFY ?AUTO_178 ?AUTO_179 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_181 - OBJ
      ?AUTO_182 - LOCATION
    )
    :vars
    (
      ?AUTO_183 - TRUCK
      ?AUTO_184 - LOCATION
      ?AUTO_185 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_181 ?AUTO_183 ) ( TRUCK-AT ?AUTO_183 ?AUTO_184 ) ( IN-CITY ?AUTO_184 ?AUTO_185 ) ( IN-CITY ?AUTO_182 ?AUTO_185 ) ( not ( = ?AUTO_182 ?AUTO_184 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_183 ?AUTO_184 ?AUTO_182 ?AUTO_185 )
      ( DELIVER-PKG ?AUTO_181 ?AUTO_182 )
      ( DELIVER-PKG-VERIFY ?AUTO_181 ?AUTO_182 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_186 - OBJ
      ?AUTO_187 - LOCATION
    )
    :vars
    (
      ?AUTO_189 - TRUCK
      ?AUTO_190 - LOCATION
      ?AUTO_188 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_189 ?AUTO_190 ) ( IN-CITY ?AUTO_190 ?AUTO_188 ) ( IN-CITY ?AUTO_187 ?AUTO_188 ) ( not ( = ?AUTO_187 ?AUTO_190 ) ) ( OBJ-AT ?AUTO_186 ?AUTO_190 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_186 ?AUTO_189 ?AUTO_190 )
      ( DELIVER-PKG ?AUTO_186 ?AUTO_187 )
      ( DELIVER-PKG-VERIFY ?AUTO_186 ?AUTO_187 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_191 - OBJ
      ?AUTO_192 - LOCATION
    )
    :vars
    (
      ?AUTO_194 - LOCATION
      ?AUTO_193 - CITY
      ?AUTO_195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_194 ?AUTO_193 ) ( IN-CITY ?AUTO_192 ?AUTO_193 ) ( not ( = ?AUTO_192 ?AUTO_194 ) ) ( OBJ-AT ?AUTO_191 ?AUTO_194 ) ( TRUCK-AT ?AUTO_195 ?AUTO_192 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_195 ?AUTO_192 ?AUTO_194 ?AUTO_193 )
      ( DELIVER-PKG ?AUTO_191 ?AUTO_192 )
      ( DELIVER-PKG-VERIFY ?AUTO_191 ?AUTO_192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_198 - OBJ
      ?AUTO_199 - LOCATION
    )
    :vars
    (
      ?AUTO_200 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_200 ?AUTO_199 ) ( IN-TRUCK ?AUTO_198 ?AUTO_200 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_198 ?AUTO_200 ?AUTO_199 )
      ( DELIVER-PKG-VERIFY ?AUTO_198 ?AUTO_199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_207 - OBJ
      ?AUTO_208 - LOCATION
    )
    :vars
    (
      ?AUTO_209 - TRUCK
      ?AUTO_210 - LOCATION
      ?AUTO_211 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_207 ?AUTO_209 ) ( TRUCK-AT ?AUTO_209 ?AUTO_210 ) ( IN-CITY ?AUTO_210 ?AUTO_211 ) ( IN-CITY ?AUTO_208 ?AUTO_211 ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_209 ?AUTO_210 ?AUTO_208 ?AUTO_211 )
      ( DELIVER-PKG ?AUTO_207 ?AUTO_208 )
      ( DELIVER-PKG-VERIFY ?AUTO_207 ?AUTO_208 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_212 - OBJ
      ?AUTO_213 - LOCATION
    )
    :vars
    (
      ?AUTO_216 - TRUCK
      ?AUTO_214 - LOCATION
      ?AUTO_215 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_216 ?AUTO_214 ) ( IN-CITY ?AUTO_214 ?AUTO_215 ) ( IN-CITY ?AUTO_213 ?AUTO_215 ) ( not ( = ?AUTO_213 ?AUTO_214 ) ) ( OBJ-AT ?AUTO_212 ?AUTO_214 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_212 ?AUTO_216 ?AUTO_214 )
      ( DELIVER-PKG ?AUTO_212 ?AUTO_213 )
      ( DELIVER-PKG-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_217 - OBJ
      ?AUTO_218 - LOCATION
    )
    :vars
    (
      ?AUTO_220 - LOCATION
      ?AUTO_219 - CITY
      ?AUTO_221 - TRUCK
      ?AUTO_222 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_220 ?AUTO_219 ) ( IN-CITY ?AUTO_218 ?AUTO_219 ) ( not ( = ?AUTO_218 ?AUTO_220 ) ) ( OBJ-AT ?AUTO_217 ?AUTO_220 ) ( TRUCK-AT ?AUTO_221 ?AUTO_222 ) ( IN-CITY ?AUTO_222 ?AUTO_219 ) ( not ( = ?AUTO_220 ?AUTO_222 ) ) ( not ( = ?AUTO_218 ?AUTO_222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_221 ?AUTO_222 ?AUTO_220 ?AUTO_219 )
      ( DELIVER-PKG ?AUTO_217 ?AUTO_218 )
      ( DELIVER-PKG-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_225 - OBJ
      ?AUTO_226 - LOCATION
    )
    :vars
    (
      ?AUTO_227 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_225 ?AUTO_227 ) ( AIRPLANE-AT ?AUTO_227 ?AUTO_226 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_225 ?AUTO_227 ?AUTO_226 )
      ( DELIVER-PKG-VERIFY ?AUTO_225 ?AUTO_226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_232 - OBJ
      ?AUTO_233 - LOCATION
    )
    :vars
    (
      ?AUTO_234 - AIRPLANE
      ?AUTO_235 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_232 ?AUTO_234 ) ( AIRPORT ?AUTO_235 ) ( AIRPORT ?AUTO_233 ) ( AIRPLANE-AT ?AUTO_234 ?AUTO_235 ) ( not ( = ?AUTO_235 ?AUTO_233 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_234 ?AUTO_235 ?AUTO_233 )
      ( DELIVER-PKG ?AUTO_232 ?AUTO_233 )
      ( DELIVER-PKG-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_236 - OBJ
      ?AUTO_237 - LOCATION
    )
    :vars
    (
      ?AUTO_239 - LOCATION
      ?AUTO_238 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_239 ) ( AIRPORT ?AUTO_237 ) ( AIRPLANE-AT ?AUTO_238 ?AUTO_239 ) ( not ( = ?AUTO_239 ?AUTO_237 ) ) ( OBJ-AT ?AUTO_236 ?AUTO_239 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_236 ?AUTO_238 ?AUTO_239 )
      ( DELIVER-PKG ?AUTO_236 ?AUTO_237 )
      ( DELIVER-PKG-VERIFY ?AUTO_236 ?AUTO_237 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_248 - OBJ
      ?AUTO_249 - LOCATION
    )
    :vars
    (
      ?AUTO_250 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_250 ?AUTO_249 ) ( IN-TRUCK ?AUTO_248 ?AUTO_250 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_248 ?AUTO_250 ?AUTO_249 )
      ( DELIVER-PKG-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_257 - OBJ
      ?AUTO_258 - LOCATION
    )
    :vars
    (
      ?AUTO_259 - TRUCK
      ?AUTO_260 - LOCATION
      ?AUTO_261 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_257 ?AUTO_259 ) ( TRUCK-AT ?AUTO_259 ?AUTO_260 ) ( IN-CITY ?AUTO_260 ?AUTO_261 ) ( IN-CITY ?AUTO_258 ?AUTO_261 ) ( not ( = ?AUTO_258 ?AUTO_260 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_259 ?AUTO_260 ?AUTO_258 ?AUTO_261 )
      ( DELIVER-PKG ?AUTO_257 ?AUTO_258 )
      ( DELIVER-PKG-VERIFY ?AUTO_257 ?AUTO_258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_262 - OBJ
      ?AUTO_263 - LOCATION
    )
    :vars
    (
      ?AUTO_264 - TRUCK
      ?AUTO_265 - LOCATION
      ?AUTO_266 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_264 ?AUTO_265 ) ( IN-CITY ?AUTO_265 ?AUTO_266 ) ( IN-CITY ?AUTO_263 ?AUTO_266 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( OBJ-AT ?AUTO_262 ?AUTO_265 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_262 ?AUTO_264 ?AUTO_265 )
      ( DELIVER-PKG ?AUTO_262 ?AUTO_263 )
      ( DELIVER-PKG-VERIFY ?AUTO_262 ?AUTO_263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_267 - OBJ
      ?AUTO_268 - LOCATION
    )
    :vars
    (
      ?AUTO_270 - TRUCK
      ?AUTO_269 - LOCATION
      ?AUTO_271 - CITY
      ?AUTO_272 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_270 ?AUTO_269 ) ( IN-CITY ?AUTO_269 ?AUTO_271 ) ( IN-CITY ?AUTO_268 ?AUTO_271 ) ( not ( = ?AUTO_268 ?AUTO_269 ) ) ( IN-AIRPLANE ?AUTO_267 ?AUTO_272 ) ( AIRPLANE-AT ?AUTO_272 ?AUTO_269 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_267 ?AUTO_272 ?AUTO_269 )
      ( DELIVER-PKG ?AUTO_267 ?AUTO_268 )
      ( DELIVER-PKG-VERIFY ?AUTO_267 ?AUTO_268 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_277 - OBJ
      ?AUTO_278 - LOCATION
    )
    :vars
    (
      ?AUTO_279 - TRUCK
      ?AUTO_282 - LOCATION
      ?AUTO_280 - CITY
      ?AUTO_281 - AIRPLANE
      ?AUTO_283 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_279 ?AUTO_282 ) ( IN-CITY ?AUTO_282 ?AUTO_280 ) ( IN-CITY ?AUTO_278 ?AUTO_280 ) ( not ( = ?AUTO_278 ?AUTO_282 ) ) ( IN-AIRPLANE ?AUTO_277 ?AUTO_281 ) ( AIRPORT ?AUTO_283 ) ( AIRPORT ?AUTO_282 ) ( AIRPLANE-AT ?AUTO_281 ?AUTO_283 ) ( not ( = ?AUTO_283 ?AUTO_282 ) ) ( not ( = ?AUTO_278 ?AUTO_283 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_281 ?AUTO_283 ?AUTO_282 )
      ( DELIVER-PKG ?AUTO_277 ?AUTO_278 )
      ( DELIVER-PKG-VERIFY ?AUTO_277 ?AUTO_278 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_284 - OBJ
      ?AUTO_285 - LOCATION
    )
    :vars
    (
      ?AUTO_289 - TRUCK
      ?AUTO_287 - LOCATION
      ?AUTO_288 - CITY
      ?AUTO_286 - LOCATION
      ?AUTO_290 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_289 ?AUTO_287 ) ( IN-CITY ?AUTO_287 ?AUTO_288 ) ( IN-CITY ?AUTO_285 ?AUTO_288 ) ( not ( = ?AUTO_285 ?AUTO_287 ) ) ( AIRPORT ?AUTO_286 ) ( AIRPORT ?AUTO_287 ) ( AIRPLANE-AT ?AUTO_290 ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( not ( = ?AUTO_285 ?AUTO_286 ) ) ( OBJ-AT ?AUTO_284 ?AUTO_286 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_284 ?AUTO_290 ?AUTO_286 )
      ( DELIVER-PKG ?AUTO_284 ?AUTO_285 )
      ( DELIVER-PKG-VERIFY ?AUTO_284 ?AUTO_285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_299 - OBJ
      ?AUTO_300 - LOCATION
    )
    :vars
    (
      ?AUTO_301 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_299 ?AUTO_301 ) ( AIRPLANE-AT ?AUTO_301 ?AUTO_300 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_299 ?AUTO_301 ?AUTO_300 )
      ( DELIVER-PKG-VERIFY ?AUTO_299 ?AUTO_300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_306 - OBJ
      ?AUTO_307 - LOCATION
    )
    :vars
    (
      ?AUTO_308 - AIRPLANE
      ?AUTO_309 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_306 ?AUTO_308 ) ( AIRPORT ?AUTO_309 ) ( AIRPORT ?AUTO_307 ) ( AIRPLANE-AT ?AUTO_308 ?AUTO_309 ) ( not ( = ?AUTO_309 ?AUTO_307 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_308 ?AUTO_309 ?AUTO_307 )
      ( DELIVER-PKG ?AUTO_306 ?AUTO_307 )
      ( DELIVER-PKG-VERIFY ?AUTO_306 ?AUTO_307 ) )
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
      ?AUTO_312 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_313 ) ( AIRPORT ?AUTO_311 ) ( AIRPLANE-AT ?AUTO_312 ?AUTO_313 ) ( not ( = ?AUTO_313 ?AUTO_311 ) ) ( OBJ-AT ?AUTO_310 ?AUTO_313 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_310 ?AUTO_312 ?AUTO_313 )
      ( DELIVER-PKG ?AUTO_310 ?AUTO_311 )
      ( DELIVER-PKG-VERIFY ?AUTO_310 ?AUTO_311 ) )
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
      ?AUTO_375 - OBJ
      ?AUTO_376 - LOCATION
    )
    :vars
    (
      ?AUTO_377 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_375 ?AUTO_377 ) ( AIRPLANE-AT ?AUTO_377 ?AUTO_376 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_375 ?AUTO_377 ?AUTO_376 )
      ( DELIVER-PKG-VERIFY ?AUTO_375 ?AUTO_376 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_382 - OBJ
      ?AUTO_383 - LOCATION
    )
    :vars
    (
      ?AUTO_384 - AIRPLANE
      ?AUTO_385 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_382 ?AUTO_384 ) ( AIRPORT ?AUTO_385 ) ( AIRPORT ?AUTO_383 ) ( AIRPLANE-AT ?AUTO_384 ?AUTO_385 ) ( not ( = ?AUTO_385 ?AUTO_383 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_384 ?AUTO_385 ?AUTO_383 )
      ( DELIVER-PKG ?AUTO_382 ?AUTO_383 )
      ( DELIVER-PKG-VERIFY ?AUTO_382 ?AUTO_383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_386 - OBJ
      ?AUTO_387 - LOCATION
    )
    :vars
    (
      ?AUTO_389 - LOCATION
      ?AUTO_388 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_389 ) ( AIRPORT ?AUTO_387 ) ( AIRPLANE-AT ?AUTO_388 ?AUTO_389 ) ( not ( = ?AUTO_389 ?AUTO_387 ) ) ( OBJ-AT ?AUTO_386 ?AUTO_389 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_386 ?AUTO_388 ?AUTO_389 )
      ( DELIVER-PKG ?AUTO_386 ?AUTO_387 )
      ( DELIVER-PKG-VERIFY ?AUTO_386 ?AUTO_387 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_390 - OBJ
      ?AUTO_391 - LOCATION
    )
    :vars
    (
      ?AUTO_393 - LOCATION
      ?AUTO_394 - LOCATION
      ?AUTO_392 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_393 ) ( AIRPORT ?AUTO_391 ) ( not ( = ?AUTO_393 ?AUTO_391 ) ) ( OBJ-AT ?AUTO_390 ?AUTO_393 ) ( AIRPORT ?AUTO_394 ) ( AIRPLANE-AT ?AUTO_392 ?AUTO_394 ) ( not ( = ?AUTO_394 ?AUTO_393 ) ) ( not ( = ?AUTO_391 ?AUTO_394 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_392 ?AUTO_394 ?AUTO_393 )
      ( DELIVER-PKG ?AUTO_390 ?AUTO_391 )
      ( DELIVER-PKG-VERIFY ?AUTO_390 ?AUTO_391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_415 - OBJ
      ?AUTO_416 - LOCATION
    )
    :vars
    (
      ?AUTO_418 - LOCATION
      ?AUTO_419 - LOCATION
      ?AUTO_417 - AIRPLANE
      ?AUTO_420 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_418 ) ( AIRPORT ?AUTO_416 ) ( not ( = ?AUTO_418 ?AUTO_416 ) ) ( AIRPORT ?AUTO_419 ) ( AIRPLANE-AT ?AUTO_417 ?AUTO_419 ) ( not ( = ?AUTO_419 ?AUTO_418 ) ) ( not ( = ?AUTO_416 ?AUTO_419 ) ) ( TRUCK-AT ?AUTO_420 ?AUTO_418 ) ( IN-TRUCK ?AUTO_415 ?AUTO_420 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_415 ?AUTO_420 ?AUTO_418 )
      ( DELIVER-PKG ?AUTO_415 ?AUTO_416 )
      ( DELIVER-PKG-VERIFY ?AUTO_415 ?AUTO_416 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_427 - OBJ
      ?AUTO_428 - LOCATION
    )
    :vars
    (
      ?AUTO_432 - LOCATION
      ?AUTO_430 - LOCATION
      ?AUTO_429 - AIRPLANE
      ?AUTO_431 - TRUCK
      ?AUTO_433 - LOCATION
      ?AUTO_434 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_432 ) ( AIRPORT ?AUTO_428 ) ( not ( = ?AUTO_432 ?AUTO_428 ) ) ( AIRPORT ?AUTO_430 ) ( AIRPLANE-AT ?AUTO_429 ?AUTO_430 ) ( not ( = ?AUTO_430 ?AUTO_432 ) ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( IN-TRUCK ?AUTO_427 ?AUTO_431 ) ( TRUCK-AT ?AUTO_431 ?AUTO_433 ) ( IN-CITY ?AUTO_433 ?AUTO_434 ) ( IN-CITY ?AUTO_432 ?AUTO_434 ) ( not ( = ?AUTO_432 ?AUTO_433 ) ) ( not ( = ?AUTO_428 ?AUTO_433 ) ) ( not ( = ?AUTO_430 ?AUTO_433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_431 ?AUTO_433 ?AUTO_432 ?AUTO_434 )
      ( DELIVER-PKG ?AUTO_427 ?AUTO_428 )
      ( DELIVER-PKG-VERIFY ?AUTO_427 ?AUTO_428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_435 - OBJ
      ?AUTO_436 - LOCATION
    )
    :vars
    (
      ?AUTO_437 - LOCATION
      ?AUTO_438 - LOCATION
      ?AUTO_439 - AIRPLANE
      ?AUTO_442 - TRUCK
      ?AUTO_440 - LOCATION
      ?AUTO_441 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_437 ) ( AIRPORT ?AUTO_436 ) ( not ( = ?AUTO_437 ?AUTO_436 ) ) ( AIRPORT ?AUTO_438 ) ( AIRPLANE-AT ?AUTO_439 ?AUTO_438 ) ( not ( = ?AUTO_438 ?AUTO_437 ) ) ( not ( = ?AUTO_436 ?AUTO_438 ) ) ( TRUCK-AT ?AUTO_442 ?AUTO_440 ) ( IN-CITY ?AUTO_440 ?AUTO_441 ) ( IN-CITY ?AUTO_437 ?AUTO_441 ) ( not ( = ?AUTO_437 ?AUTO_440 ) ) ( not ( = ?AUTO_436 ?AUTO_440 ) ) ( not ( = ?AUTO_438 ?AUTO_440 ) ) ( OBJ-AT ?AUTO_435 ?AUTO_440 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_435 ?AUTO_442 ?AUTO_440 )
      ( DELIVER-PKG ?AUTO_435 ?AUTO_436 )
      ( DELIVER-PKG-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_443 - OBJ
      ?AUTO_444 - LOCATION
    )
    :vars
    (
      ?AUTO_445 - LOCATION
      ?AUTO_448 - LOCATION
      ?AUTO_446 - AIRPLANE
      ?AUTO_449 - LOCATION
      ?AUTO_450 - CITY
      ?AUTO_447 - TRUCK
      ?AUTO_451 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_445 ) ( AIRPORT ?AUTO_444 ) ( not ( = ?AUTO_445 ?AUTO_444 ) ) ( AIRPORT ?AUTO_448 ) ( AIRPLANE-AT ?AUTO_446 ?AUTO_448 ) ( not ( = ?AUTO_448 ?AUTO_445 ) ) ( not ( = ?AUTO_444 ?AUTO_448 ) ) ( IN-CITY ?AUTO_449 ?AUTO_450 ) ( IN-CITY ?AUTO_445 ?AUTO_450 ) ( not ( = ?AUTO_445 ?AUTO_449 ) ) ( not ( = ?AUTO_444 ?AUTO_449 ) ) ( not ( = ?AUTO_448 ?AUTO_449 ) ) ( OBJ-AT ?AUTO_443 ?AUTO_449 ) ( TRUCK-AT ?AUTO_447 ?AUTO_451 ) ( IN-CITY ?AUTO_451 ?AUTO_450 ) ( not ( = ?AUTO_449 ?AUTO_451 ) ) ( not ( = ?AUTO_444 ?AUTO_451 ) ) ( not ( = ?AUTO_445 ?AUTO_451 ) ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_447 ?AUTO_451 ?AUTO_449 ?AUTO_450 )
      ( DELIVER-PKG ?AUTO_443 ?AUTO_444 )
      ( DELIVER-PKG-VERIFY ?AUTO_443 ?AUTO_444 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_454 - OBJ
      ?AUTO_455 - LOCATION
    )
    :vars
    (
      ?AUTO_456 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_456 ?AUTO_455 ) ( IN-TRUCK ?AUTO_454 ?AUTO_456 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_454 ?AUTO_456 ?AUTO_455 )
      ( DELIVER-PKG-VERIFY ?AUTO_454 ?AUTO_455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_459 - OBJ
      ?AUTO_460 - LOCATION
    )
    :vars
    (
      ?AUTO_461 - TRUCK
      ?AUTO_462 - LOCATION
      ?AUTO_463 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_459 ?AUTO_461 ) ( TRUCK-AT ?AUTO_461 ?AUTO_462 ) ( IN-CITY ?AUTO_462 ?AUTO_463 ) ( IN-CITY ?AUTO_460 ?AUTO_463 ) ( not ( = ?AUTO_460 ?AUTO_462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_461 ?AUTO_462 ?AUTO_460 ?AUTO_463 )
      ( DELIVER-PKG ?AUTO_459 ?AUTO_460 )
      ( DELIVER-PKG-VERIFY ?AUTO_459 ?AUTO_460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_464 - OBJ
      ?AUTO_465 - LOCATION
    )
    :vars
    (
      ?AUTO_466 - TRUCK
      ?AUTO_467 - LOCATION
      ?AUTO_468 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_466 ?AUTO_467 ) ( IN-CITY ?AUTO_467 ?AUTO_468 ) ( IN-CITY ?AUTO_465 ?AUTO_468 ) ( not ( = ?AUTO_465 ?AUTO_467 ) ) ( OBJ-AT ?AUTO_464 ?AUTO_467 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_464 ?AUTO_466 ?AUTO_467 )
      ( DELIVER-PKG ?AUTO_464 ?AUTO_465 )
      ( DELIVER-PKG-VERIFY ?AUTO_464 ?AUTO_465 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_475 - OBJ
      ?AUTO_476 - LOCATION
    )
    :vars
    (
      ?AUTO_479 - TRUCK
      ?AUTO_477 - LOCATION
      ?AUTO_478 - CITY
      ?AUTO_480 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_479 ?AUTO_477 ) ( IN-CITY ?AUTO_477 ?AUTO_478 ) ( IN-CITY ?AUTO_476 ?AUTO_478 ) ( not ( = ?AUTO_476 ?AUTO_477 ) ) ( IN-AIRPLANE ?AUTO_475 ?AUTO_480 ) ( AIRPLANE-AT ?AUTO_480 ?AUTO_477 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_475 ?AUTO_480 ?AUTO_477 )
      ( DELIVER-PKG ?AUTO_475 ?AUTO_476 )
      ( DELIVER-PKG-VERIFY ?AUTO_475 ?AUTO_476 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_481 - OBJ
      ?AUTO_482 - LOCATION
    )
    :vars
    (
      ?AUTO_485 - TRUCK
      ?AUTO_483 - LOCATION
      ?AUTO_484 - CITY
      ?AUTO_486 - AIRPLANE
      ?AUTO_487 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_485 ?AUTO_483 ) ( IN-CITY ?AUTO_483 ?AUTO_484 ) ( IN-CITY ?AUTO_482 ?AUTO_484 ) ( not ( = ?AUTO_482 ?AUTO_483 ) ) ( IN-AIRPLANE ?AUTO_481 ?AUTO_486 ) ( AIRPORT ?AUTO_487 ) ( AIRPORT ?AUTO_483 ) ( AIRPLANE-AT ?AUTO_486 ?AUTO_487 ) ( not ( = ?AUTO_487 ?AUTO_483 ) ) ( not ( = ?AUTO_482 ?AUTO_487 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_486 ?AUTO_487 ?AUTO_483 )
      ( DELIVER-PKG ?AUTO_481 ?AUTO_482 )
      ( DELIVER-PKG-VERIFY ?AUTO_481 ?AUTO_482 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_506 - OBJ
      ?AUTO_507 - LOCATION
    )
    :vars
    (
      ?AUTO_509 - TRUCK
      ?AUTO_511 - LOCATION
      ?AUTO_512 - CITY
      ?AUTO_510 - LOCATION
      ?AUTO_508 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_509 ?AUTO_511 ) ( IN-CITY ?AUTO_511 ?AUTO_512 ) ( IN-CITY ?AUTO_507 ?AUTO_512 ) ( not ( = ?AUTO_507 ?AUTO_511 ) ) ( AIRPORT ?AUTO_510 ) ( AIRPORT ?AUTO_511 ) ( AIRPLANE-AT ?AUTO_508 ?AUTO_510 ) ( not ( = ?AUTO_510 ?AUTO_511 ) ) ( not ( = ?AUTO_507 ?AUTO_510 ) ) ( OBJ-AT ?AUTO_506 ?AUTO_510 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_506 ?AUTO_508 ?AUTO_510 )
      ( DELIVER-PKG ?AUTO_506 ?AUTO_507 )
      ( DELIVER-PKG-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_515 - OBJ
      ?AUTO_516 - LOCATION
    )
    :vars
    (
      ?AUTO_517 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_517 ?AUTO_516 ) ( IN-TRUCK ?AUTO_515 ?AUTO_517 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_515 ?AUTO_517 ?AUTO_516 )
      ( DELIVER-PKG-VERIFY ?AUTO_515 ?AUTO_516 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_518 - OBJ
      ?AUTO_519 - LOCATION
    )
    :vars
    (
      ?AUTO_520 - TRUCK
      ?AUTO_521 - LOCATION
      ?AUTO_522 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_518 ?AUTO_520 ) ( TRUCK-AT ?AUTO_520 ?AUTO_521 ) ( IN-CITY ?AUTO_521 ?AUTO_522 ) ( IN-CITY ?AUTO_519 ?AUTO_522 ) ( not ( = ?AUTO_519 ?AUTO_521 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_520 ?AUTO_521 ?AUTO_519 ?AUTO_522 )
      ( DELIVER-PKG ?AUTO_518 ?AUTO_519 )
      ( DELIVER-PKG-VERIFY ?AUTO_518 ?AUTO_519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_523 - OBJ
      ?AUTO_524 - LOCATION
    )
    :vars
    (
      ?AUTO_527 - TRUCK
      ?AUTO_526 - LOCATION
      ?AUTO_525 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_527 ?AUTO_526 ) ( IN-CITY ?AUTO_526 ?AUTO_525 ) ( IN-CITY ?AUTO_524 ?AUTO_525 ) ( not ( = ?AUTO_524 ?AUTO_526 ) ) ( OBJ-AT ?AUTO_523 ?AUTO_526 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_523 ?AUTO_527 ?AUTO_526 )
      ( DELIVER-PKG ?AUTO_523 ?AUTO_524 )
      ( DELIVER-PKG-VERIFY ?AUTO_523 ?AUTO_524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_528 - OBJ
      ?AUTO_529 - LOCATION
    )
    :vars
    (
      ?AUTO_530 - LOCATION
      ?AUTO_531 - CITY
      ?AUTO_532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_530 ?AUTO_531 ) ( IN-CITY ?AUTO_529 ?AUTO_531 ) ( not ( = ?AUTO_529 ?AUTO_530 ) ) ( OBJ-AT ?AUTO_528 ?AUTO_530 ) ( TRUCK-AT ?AUTO_532 ?AUTO_529 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_532 ?AUTO_529 ?AUTO_530 ?AUTO_531 )
      ( DELIVER-PKG ?AUTO_528 ?AUTO_529 )
      ( DELIVER-PKG-VERIFY ?AUTO_528 ?AUTO_529 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_535 - OBJ
      ?AUTO_536 - LOCATION
    )
    :vars
    (
      ?AUTO_537 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_537 ?AUTO_536 ) ( IN-TRUCK ?AUTO_535 ?AUTO_537 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_535 ?AUTO_537 ?AUTO_536 )
      ( DELIVER-PKG-VERIFY ?AUTO_535 ?AUTO_536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_538 - OBJ
      ?AUTO_539 - LOCATION
    )
    :vars
    (
      ?AUTO_540 - TRUCK
      ?AUTO_541 - LOCATION
      ?AUTO_542 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_538 ?AUTO_540 ) ( TRUCK-AT ?AUTO_540 ?AUTO_541 ) ( IN-CITY ?AUTO_541 ?AUTO_542 ) ( IN-CITY ?AUTO_539 ?AUTO_542 ) ( not ( = ?AUTO_539 ?AUTO_541 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_540 ?AUTO_541 ?AUTO_539 ?AUTO_542 )
      ( DELIVER-PKG ?AUTO_538 ?AUTO_539 )
      ( DELIVER-PKG-VERIFY ?AUTO_538 ?AUTO_539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_543 - OBJ
      ?AUTO_544 - LOCATION
    )
    :vars
    (
      ?AUTO_545 - TRUCK
      ?AUTO_546 - LOCATION
      ?AUTO_547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_545 ?AUTO_546 ) ( IN-CITY ?AUTO_546 ?AUTO_547 ) ( IN-CITY ?AUTO_544 ?AUTO_547 ) ( not ( = ?AUTO_544 ?AUTO_546 ) ) ( OBJ-AT ?AUTO_543 ?AUTO_546 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_543 ?AUTO_545 ?AUTO_546 )
      ( DELIVER-PKG ?AUTO_543 ?AUTO_544 )
      ( DELIVER-PKG-VERIFY ?AUTO_543 ?AUTO_544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_548 - OBJ
      ?AUTO_549 - LOCATION
    )
    :vars
    (
      ?AUTO_550 - LOCATION
      ?AUTO_552 - CITY
      ?AUTO_551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_550 ?AUTO_552 ) ( IN-CITY ?AUTO_549 ?AUTO_552 ) ( not ( = ?AUTO_549 ?AUTO_550 ) ) ( OBJ-AT ?AUTO_548 ?AUTO_550 ) ( TRUCK-AT ?AUTO_551 ?AUTO_549 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_551 ?AUTO_549 ?AUTO_550 ?AUTO_552 )
      ( DELIVER-PKG ?AUTO_548 ?AUTO_549 )
      ( DELIVER-PKG-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_563 - OBJ
      ?AUTO_564 - LOCATION
    )
    :vars
    (
      ?AUTO_565 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_563 ?AUTO_565 ) ( AIRPLANE-AT ?AUTO_565 ?AUTO_564 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_563 ?AUTO_565 ?AUTO_564 )
      ( DELIVER-PKG-VERIFY ?AUTO_563 ?AUTO_564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_568 - OBJ
      ?AUTO_569 - LOCATION
    )
    :vars
    (
      ?AUTO_570 - AIRPLANE
      ?AUTO_571 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_568 ?AUTO_570 ) ( AIRPORT ?AUTO_571 ) ( AIRPORT ?AUTO_569 ) ( AIRPLANE-AT ?AUTO_570 ?AUTO_571 ) ( not ( = ?AUTO_571 ?AUTO_569 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_570 ?AUTO_571 ?AUTO_569 )
      ( DELIVER-PKG ?AUTO_568 ?AUTO_569 )
      ( DELIVER-PKG-VERIFY ?AUTO_568 ?AUTO_569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_572 - OBJ
      ?AUTO_573 - LOCATION
    )
    :vars
    (
      ?AUTO_575 - LOCATION
      ?AUTO_574 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_575 ) ( AIRPORT ?AUTO_573 ) ( AIRPLANE-AT ?AUTO_574 ?AUTO_575 ) ( not ( = ?AUTO_575 ?AUTO_573 ) ) ( OBJ-AT ?AUTO_572 ?AUTO_575 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_572 ?AUTO_574 ?AUTO_575 )
      ( DELIVER-PKG ?AUTO_572 ?AUTO_573 )
      ( DELIVER-PKG-VERIFY ?AUTO_572 ?AUTO_573 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_576 - OBJ
      ?AUTO_577 - LOCATION
    )
    :vars
    (
      ?AUTO_579 - LOCATION
      ?AUTO_580 - LOCATION
      ?AUTO_578 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_579 ) ( AIRPORT ?AUTO_577 ) ( not ( = ?AUTO_579 ?AUTO_577 ) ) ( OBJ-AT ?AUTO_576 ?AUTO_579 ) ( AIRPORT ?AUTO_580 ) ( AIRPLANE-AT ?AUTO_578 ?AUTO_580 ) ( not ( = ?AUTO_580 ?AUTO_579 ) ) ( not ( = ?AUTO_577 ?AUTO_580 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_578 ?AUTO_580 ?AUTO_579 )
      ( DELIVER-PKG ?AUTO_576 ?AUTO_577 )
      ( DELIVER-PKG-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_605 - OBJ
      ?AUTO_606 - LOCATION
    )
    :vars
    (
      ?AUTO_607 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_605 ?AUTO_607 ) ( AIRPLANE-AT ?AUTO_607 ?AUTO_606 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_605 ?AUTO_607 ?AUTO_606 )
      ( DELIVER-PKG-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_610 - OBJ
      ?AUTO_611 - LOCATION
    )
    :vars
    (
      ?AUTO_612 - AIRPLANE
      ?AUTO_613 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_610 ?AUTO_612 ) ( AIRPORT ?AUTO_613 ) ( AIRPORT ?AUTO_611 ) ( AIRPLANE-AT ?AUTO_612 ?AUTO_613 ) ( not ( = ?AUTO_613 ?AUTO_611 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_612 ?AUTO_613 ?AUTO_611 )
      ( DELIVER-PKG ?AUTO_610 ?AUTO_611 )
      ( DELIVER-PKG-VERIFY ?AUTO_610 ?AUTO_611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_616 - OBJ
      ?AUTO_617 - LOCATION
    )
    :vars
    (
      ?AUTO_619 - LOCATION
      ?AUTO_618 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_619 ) ( AIRPORT ?AUTO_617 ) ( AIRPLANE-AT ?AUTO_618 ?AUTO_619 ) ( not ( = ?AUTO_619 ?AUTO_617 ) ) ( OBJ-AT ?AUTO_616 ?AUTO_619 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_616 ?AUTO_618 ?AUTO_619 )
      ( DELIVER-PKG ?AUTO_616 ?AUTO_617 )
      ( DELIVER-PKG-VERIFY ?AUTO_616 ?AUTO_617 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_620 - OBJ
      ?AUTO_621 - LOCATION
    )
    :vars
    (
      ?AUTO_623 - LOCATION
      ?AUTO_624 - LOCATION
      ?AUTO_622 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_623 ) ( AIRPORT ?AUTO_621 ) ( not ( = ?AUTO_623 ?AUTO_621 ) ) ( OBJ-AT ?AUTO_620 ?AUTO_623 ) ( AIRPORT ?AUTO_624 ) ( AIRPLANE-AT ?AUTO_622 ?AUTO_624 ) ( not ( = ?AUTO_624 ?AUTO_623 ) ) ( not ( = ?AUTO_621 ?AUTO_624 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_622 ?AUTO_624 ?AUTO_623 )
      ( DELIVER-PKG ?AUTO_620 ?AUTO_621 )
      ( DELIVER-PKG-VERIFY ?AUTO_620 ?AUTO_621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_635 - OBJ
      ?AUTO_636 - LOCATION
    )
    :vars
    (
      ?AUTO_637 - LOCATION
      ?AUTO_639 - LOCATION
      ?AUTO_638 - AIRPLANE
      ?AUTO_640 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_637 ) ( AIRPORT ?AUTO_636 ) ( not ( = ?AUTO_637 ?AUTO_636 ) ) ( AIRPORT ?AUTO_639 ) ( AIRPLANE-AT ?AUTO_638 ?AUTO_639 ) ( not ( = ?AUTO_639 ?AUTO_637 ) ) ( not ( = ?AUTO_636 ?AUTO_639 ) ) ( TRUCK-AT ?AUTO_640 ?AUTO_637 ) ( IN-TRUCK ?AUTO_635 ?AUTO_640 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_635 ?AUTO_640 ?AUTO_637 )
      ( DELIVER-PKG ?AUTO_635 ?AUTO_636 )
      ( DELIVER-PKG-VERIFY ?AUTO_635 ?AUTO_636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_641 - OBJ
      ?AUTO_642 - LOCATION
    )
    :vars
    (
      ?AUTO_645 - LOCATION
      ?AUTO_643 - LOCATION
      ?AUTO_644 - AIRPLANE
      ?AUTO_646 - TRUCK
      ?AUTO_647 - LOCATION
      ?AUTO_648 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_645 ) ( AIRPORT ?AUTO_642 ) ( not ( = ?AUTO_645 ?AUTO_642 ) ) ( AIRPORT ?AUTO_643 ) ( AIRPLANE-AT ?AUTO_644 ?AUTO_643 ) ( not ( = ?AUTO_643 ?AUTO_645 ) ) ( not ( = ?AUTO_642 ?AUTO_643 ) ) ( IN-TRUCK ?AUTO_641 ?AUTO_646 ) ( TRUCK-AT ?AUTO_646 ?AUTO_647 ) ( IN-CITY ?AUTO_647 ?AUTO_648 ) ( IN-CITY ?AUTO_645 ?AUTO_648 ) ( not ( = ?AUTO_645 ?AUTO_647 ) ) ( not ( = ?AUTO_642 ?AUTO_647 ) ) ( not ( = ?AUTO_643 ?AUTO_647 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_646 ?AUTO_647 ?AUTO_645 ?AUTO_648 )
      ( DELIVER-PKG ?AUTO_641 ?AUTO_642 )
      ( DELIVER-PKG-VERIFY ?AUTO_641 ?AUTO_642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_649 - OBJ
      ?AUTO_650 - LOCATION
    )
    :vars
    (
      ?AUTO_656 - LOCATION
      ?AUTO_651 - LOCATION
      ?AUTO_652 - AIRPLANE
      ?AUTO_655 - TRUCK
      ?AUTO_654 - LOCATION
      ?AUTO_653 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_656 ) ( AIRPORT ?AUTO_650 ) ( not ( = ?AUTO_656 ?AUTO_650 ) ) ( AIRPORT ?AUTO_651 ) ( AIRPLANE-AT ?AUTO_652 ?AUTO_651 ) ( not ( = ?AUTO_651 ?AUTO_656 ) ) ( not ( = ?AUTO_650 ?AUTO_651 ) ) ( TRUCK-AT ?AUTO_655 ?AUTO_654 ) ( IN-CITY ?AUTO_654 ?AUTO_653 ) ( IN-CITY ?AUTO_656 ?AUTO_653 ) ( not ( = ?AUTO_656 ?AUTO_654 ) ) ( not ( = ?AUTO_650 ?AUTO_654 ) ) ( not ( = ?AUTO_651 ?AUTO_654 ) ) ( OBJ-AT ?AUTO_649 ?AUTO_654 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_649 ?AUTO_655 ?AUTO_654 )
      ( DELIVER-PKG ?AUTO_649 ?AUTO_650 )
      ( DELIVER-PKG-VERIFY ?AUTO_649 ?AUTO_650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_657 - OBJ
      ?AUTO_658 - LOCATION
    )
    :vars
    (
      ?AUTO_662 - LOCATION
      ?AUTO_659 - LOCATION
      ?AUTO_660 - AIRPLANE
      ?AUTO_664 - LOCATION
      ?AUTO_663 - CITY
      ?AUTO_661 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_662 ) ( AIRPORT ?AUTO_658 ) ( not ( = ?AUTO_662 ?AUTO_658 ) ) ( AIRPORT ?AUTO_659 ) ( AIRPLANE-AT ?AUTO_660 ?AUTO_659 ) ( not ( = ?AUTO_659 ?AUTO_662 ) ) ( not ( = ?AUTO_658 ?AUTO_659 ) ) ( IN-CITY ?AUTO_664 ?AUTO_663 ) ( IN-CITY ?AUTO_662 ?AUTO_663 ) ( not ( = ?AUTO_662 ?AUTO_664 ) ) ( not ( = ?AUTO_658 ?AUTO_664 ) ) ( not ( = ?AUTO_659 ?AUTO_664 ) ) ( OBJ-AT ?AUTO_657 ?AUTO_664 ) ( TRUCK-AT ?AUTO_661 ?AUTO_662 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_661 ?AUTO_662 ?AUTO_664 ?AUTO_663 )
      ( DELIVER-PKG ?AUTO_657 ?AUTO_658 )
      ( DELIVER-PKG-VERIFY ?AUTO_657 ?AUTO_658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_675 - OBJ
      ?AUTO_676 - LOCATION
    )
    :vars
    (
      ?AUTO_677 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_675 ?AUTO_677 ) ( AIRPLANE-AT ?AUTO_677 ?AUTO_676 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_675 ?AUTO_677 ?AUTO_676 )
      ( DELIVER-PKG-VERIFY ?AUTO_675 ?AUTO_676 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_718 - OBJ
      ?AUTO_719 - LOCATION
    )
    :vars
    (
      ?AUTO_720 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_718 ?AUTO_720 ) ( AIRPLANE-AT ?AUTO_720 ?AUTO_719 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_718 ?AUTO_720 ?AUTO_719 )
      ( DELIVER-PKG-VERIFY ?AUTO_718 ?AUTO_719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_721 - OBJ
      ?AUTO_722 - LOCATION
    )
    :vars
    (
      ?AUTO_723 - AIRPLANE
      ?AUTO_724 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_721 ?AUTO_723 ) ( AIRPORT ?AUTO_724 ) ( AIRPORT ?AUTO_722 ) ( AIRPLANE-AT ?AUTO_723 ?AUTO_724 ) ( not ( = ?AUTO_724 ?AUTO_722 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_723 ?AUTO_724 ?AUTO_722 )
      ( DELIVER-PKG ?AUTO_721 ?AUTO_722 )
      ( DELIVER-PKG-VERIFY ?AUTO_721 ?AUTO_722 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_729 - OBJ
      ?AUTO_730 - LOCATION
    )
    :vars
    (
      ?AUTO_731 - LOCATION
      ?AUTO_732 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_731 ) ( AIRPORT ?AUTO_730 ) ( AIRPLANE-AT ?AUTO_732 ?AUTO_731 ) ( not ( = ?AUTO_731 ?AUTO_730 ) ) ( OBJ-AT ?AUTO_729 ?AUTO_731 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_729 ?AUTO_732 ?AUTO_731 )
      ( DELIVER-PKG ?AUTO_729 ?AUTO_730 )
      ( DELIVER-PKG-VERIFY ?AUTO_729 ?AUTO_730 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_733 - OBJ
      ?AUTO_734 - LOCATION
    )
    :vars
    (
      ?AUTO_736 - LOCATION
      ?AUTO_737 - LOCATION
      ?AUTO_735 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_736 ) ( AIRPORT ?AUTO_734 ) ( not ( = ?AUTO_736 ?AUTO_734 ) ) ( OBJ-AT ?AUTO_733 ?AUTO_736 ) ( AIRPORT ?AUTO_737 ) ( AIRPLANE-AT ?AUTO_735 ?AUTO_737 ) ( not ( = ?AUTO_737 ?AUTO_736 ) ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_735 ?AUTO_737 ?AUTO_736 )
      ( DELIVER-PKG ?AUTO_733 ?AUTO_734 )
      ( DELIVER-PKG-VERIFY ?AUTO_733 ?AUTO_734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_772 - OBJ
      ?AUTO_773 - LOCATION
    )
    :vars
    (
      ?AUTO_774 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_772 ?AUTO_774 ) ( AIRPLANE-AT ?AUTO_774 ?AUTO_773 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_772 ?AUTO_774 ?AUTO_773 )
      ( DELIVER-PKG-VERIFY ?AUTO_772 ?AUTO_773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_821 - OBJ
      ?AUTO_822 - LOCATION
    )
    :vars
    (
      ?AUTO_823 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_823 ?AUTO_822 ) ( IN-TRUCK ?AUTO_821 ?AUTO_823 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_821 ?AUTO_823 ?AUTO_822 )
      ( DELIVER-PKG-VERIFY ?AUTO_821 ?AUTO_822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_826 - OBJ
      ?AUTO_827 - LOCATION
    )
    :vars
    (
      ?AUTO_828 - TRUCK
      ?AUTO_829 - LOCATION
      ?AUTO_830 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_826 ?AUTO_828 ) ( TRUCK-AT ?AUTO_828 ?AUTO_829 ) ( IN-CITY ?AUTO_829 ?AUTO_830 ) ( IN-CITY ?AUTO_827 ?AUTO_830 ) ( not ( = ?AUTO_827 ?AUTO_829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_828 ?AUTO_829 ?AUTO_827 ?AUTO_830 )
      ( DELIVER-PKG ?AUTO_826 ?AUTO_827 )
      ( DELIVER-PKG-VERIFY ?AUTO_826 ?AUTO_827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_833 - OBJ
      ?AUTO_834 - LOCATION
    )
    :vars
    (
      ?AUTO_837 - TRUCK
      ?AUTO_836 - LOCATION
      ?AUTO_835 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_837 ?AUTO_836 ) ( IN-CITY ?AUTO_836 ?AUTO_835 ) ( IN-CITY ?AUTO_834 ?AUTO_835 ) ( not ( = ?AUTO_834 ?AUTO_836 ) ) ( OBJ-AT ?AUTO_833 ?AUTO_836 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_833 ?AUTO_837 ?AUTO_836 )
      ( DELIVER-PKG ?AUTO_833 ?AUTO_834 )
      ( DELIVER-PKG-VERIFY ?AUTO_833 ?AUTO_834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_840 - OBJ
      ?AUTO_841 - LOCATION
    )
    :vars
    (
      ?AUTO_843 - TRUCK
      ?AUTO_844 - LOCATION
      ?AUTO_842 - CITY
      ?AUTO_845 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_843 ?AUTO_844 ) ( IN-CITY ?AUTO_844 ?AUTO_842 ) ( IN-CITY ?AUTO_841 ?AUTO_842 ) ( not ( = ?AUTO_841 ?AUTO_844 ) ) ( IN-AIRPLANE ?AUTO_840 ?AUTO_845 ) ( AIRPLANE-AT ?AUTO_845 ?AUTO_844 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_840 ?AUTO_845 ?AUTO_844 )
      ( DELIVER-PKG ?AUTO_840 ?AUTO_841 )
      ( DELIVER-PKG-VERIFY ?AUTO_840 ?AUTO_841 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_846 - OBJ
      ?AUTO_847 - LOCATION
    )
    :vars
    (
      ?AUTO_850 - TRUCK
      ?AUTO_848 - LOCATION
      ?AUTO_849 - CITY
      ?AUTO_851 - AIRPLANE
      ?AUTO_852 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_850 ?AUTO_848 ) ( IN-CITY ?AUTO_848 ?AUTO_849 ) ( IN-CITY ?AUTO_847 ?AUTO_849 ) ( not ( = ?AUTO_847 ?AUTO_848 ) ) ( IN-AIRPLANE ?AUTO_846 ?AUTO_851 ) ( AIRPORT ?AUTO_852 ) ( AIRPORT ?AUTO_848 ) ( AIRPLANE-AT ?AUTO_851 ?AUTO_852 ) ( not ( = ?AUTO_852 ?AUTO_848 ) ) ( not ( = ?AUTO_847 ?AUTO_852 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_851 ?AUTO_852 ?AUTO_848 )
      ( DELIVER-PKG ?AUTO_846 ?AUTO_847 )
      ( DELIVER-PKG-VERIFY ?AUTO_846 ?AUTO_847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_857 - OBJ
      ?AUTO_858 - LOCATION
    )
    :vars
    (
      ?AUTO_863 - TRUCK
      ?AUTO_859 - LOCATION
      ?AUTO_862 - CITY
      ?AUTO_860 - LOCATION
      ?AUTO_861 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_863 ?AUTO_859 ) ( IN-CITY ?AUTO_859 ?AUTO_862 ) ( IN-CITY ?AUTO_858 ?AUTO_862 ) ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( AIRPORT ?AUTO_860 ) ( AIRPORT ?AUTO_859 ) ( AIRPLANE-AT ?AUTO_861 ?AUTO_860 ) ( not ( = ?AUTO_860 ?AUTO_859 ) ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( OBJ-AT ?AUTO_857 ?AUTO_860 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_857 ?AUTO_861 ?AUTO_860 )
      ( DELIVER-PKG ?AUTO_857 ?AUTO_858 )
      ( DELIVER-PKG-VERIFY ?AUTO_857 ?AUTO_858 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_864 - OBJ
      ?AUTO_865 - LOCATION
    )
    :vars
    (
      ?AUTO_870 - TRUCK
      ?AUTO_867 - LOCATION
      ?AUTO_868 - CITY
      ?AUTO_866 - LOCATION
      ?AUTO_871 - LOCATION
      ?AUTO_869 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_870 ?AUTO_867 ) ( IN-CITY ?AUTO_867 ?AUTO_868 ) ( IN-CITY ?AUTO_865 ?AUTO_868 ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( AIRPORT ?AUTO_866 ) ( AIRPORT ?AUTO_867 ) ( not ( = ?AUTO_866 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( OBJ-AT ?AUTO_864 ?AUTO_866 ) ( AIRPORT ?AUTO_871 ) ( AIRPLANE-AT ?AUTO_869 ?AUTO_871 ) ( not ( = ?AUTO_871 ?AUTO_866 ) ) ( not ( = ?AUTO_865 ?AUTO_871 ) ) ( not ( = ?AUTO_867 ?AUTO_871 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_869 ?AUTO_871 ?AUTO_866 )
      ( DELIVER-PKG ?AUTO_864 ?AUTO_865 )
      ( DELIVER-PKG-VERIFY ?AUTO_864 ?AUTO_865 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_906 - OBJ
      ?AUTO_907 - LOCATION
    )
    :vars
    (
      ?AUTO_908 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_908 ?AUTO_907 ) ( IN-TRUCK ?AUTO_906 ?AUTO_908 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_906 ?AUTO_908 ?AUTO_907 )
      ( DELIVER-PKG-VERIFY ?AUTO_906 ?AUTO_907 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_915 - OBJ
      ?AUTO_916 - LOCATION
    )
    :vars
    (
      ?AUTO_919 - TRUCK
      ?AUTO_917 - LOCATION
      ?AUTO_918 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_919 ?AUTO_917 ) ( IN-CITY ?AUTO_917 ?AUTO_918 ) ( IN-CITY ?AUTO_916 ?AUTO_918 ) ( not ( = ?AUTO_916 ?AUTO_917 ) ) ( OBJ-AT ?AUTO_915 ?AUTO_917 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_915 ?AUTO_919 ?AUTO_917 )
      ( DELIVER-PKG ?AUTO_915 ?AUTO_916 )
      ( DELIVER-PKG-VERIFY ?AUTO_915 ?AUTO_916 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_922 - OBJ
      ?AUTO_923 - LOCATION
    )
    :vars
    (
      ?AUTO_926 - TRUCK
      ?AUTO_924 - LOCATION
      ?AUTO_925 - CITY
      ?AUTO_927 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_926 ?AUTO_924 ) ( IN-CITY ?AUTO_924 ?AUTO_925 ) ( IN-CITY ?AUTO_923 ?AUTO_925 ) ( not ( = ?AUTO_923 ?AUTO_924 ) ) ( IN-AIRPLANE ?AUTO_922 ?AUTO_927 ) ( AIRPLANE-AT ?AUTO_927 ?AUTO_924 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_922 ?AUTO_927 ?AUTO_924 )
      ( DELIVER-PKG ?AUTO_922 ?AUTO_923 )
      ( DELIVER-PKG-VERIFY ?AUTO_922 ?AUTO_923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_964 - OBJ
      ?AUTO_965 - LOCATION
    )
    :vars
    (
      ?AUTO_969 - TRUCK
      ?AUTO_966 - LOCATION
      ?AUTO_971 - CITY
      ?AUTO_970 - LOCATION
      ?AUTO_967 - LOCATION
      ?AUTO_968 - AIRPLANE
      ?AUTO_972 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_969 ?AUTO_966 ) ( IN-CITY ?AUTO_966 ?AUTO_971 ) ( IN-CITY ?AUTO_965 ?AUTO_971 ) ( not ( = ?AUTO_965 ?AUTO_966 ) ) ( AIRPORT ?AUTO_970 ) ( AIRPORT ?AUTO_966 ) ( not ( = ?AUTO_970 ?AUTO_966 ) ) ( not ( = ?AUTO_965 ?AUTO_970 ) ) ( AIRPORT ?AUTO_967 ) ( AIRPLANE-AT ?AUTO_968 ?AUTO_967 ) ( not ( = ?AUTO_967 ?AUTO_970 ) ) ( not ( = ?AUTO_965 ?AUTO_967 ) ) ( not ( = ?AUTO_966 ?AUTO_967 ) ) ( TRUCK-AT ?AUTO_972 ?AUTO_970 ) ( IN-TRUCK ?AUTO_964 ?AUTO_972 ) ( not ( = ?AUTO_969 ?AUTO_972 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_964 ?AUTO_972 ?AUTO_970 )
      ( DELIVER-PKG ?AUTO_964 ?AUTO_965 )
      ( DELIVER-PKG-VERIFY ?AUTO_964 ?AUTO_965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_973 - OBJ
      ?AUTO_974 - LOCATION
    )
    :vars
    (
      ?AUTO_976 - TRUCK
      ?AUTO_975 - LOCATION
      ?AUTO_978 - CITY
      ?AUTO_977 - LOCATION
      ?AUTO_980 - LOCATION
      ?AUTO_979 - AIRPLANE
      ?AUTO_981 - TRUCK
      ?AUTO_982 - LOCATION
      ?AUTO_983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_976 ?AUTO_975 ) ( IN-CITY ?AUTO_975 ?AUTO_978 ) ( IN-CITY ?AUTO_974 ?AUTO_978 ) ( not ( = ?AUTO_974 ?AUTO_975 ) ) ( AIRPORT ?AUTO_977 ) ( AIRPORT ?AUTO_975 ) ( not ( = ?AUTO_977 ?AUTO_975 ) ) ( not ( = ?AUTO_974 ?AUTO_977 ) ) ( AIRPORT ?AUTO_980 ) ( AIRPLANE-AT ?AUTO_979 ?AUTO_980 ) ( not ( = ?AUTO_980 ?AUTO_977 ) ) ( not ( = ?AUTO_974 ?AUTO_980 ) ) ( not ( = ?AUTO_975 ?AUTO_980 ) ) ( IN-TRUCK ?AUTO_973 ?AUTO_981 ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( TRUCK-AT ?AUTO_981 ?AUTO_982 ) ( IN-CITY ?AUTO_982 ?AUTO_983 ) ( IN-CITY ?AUTO_977 ?AUTO_983 ) ( not ( = ?AUTO_977 ?AUTO_982 ) ) ( not ( = ?AUTO_974 ?AUTO_982 ) ) ( not ( = ?AUTO_975 ?AUTO_982 ) ) ( not ( = ?AUTO_978 ?AUTO_983 ) ) ( not ( = ?AUTO_980 ?AUTO_982 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_981 ?AUTO_982 ?AUTO_977 ?AUTO_983 )
      ( DELIVER-PKG ?AUTO_973 ?AUTO_974 )
      ( DELIVER-PKG-VERIFY ?AUTO_973 ?AUTO_974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_984 - OBJ
      ?AUTO_985 - LOCATION
    )
    :vars
    (
      ?AUTO_987 - TRUCK
      ?AUTO_986 - LOCATION
      ?AUTO_989 - CITY
      ?AUTO_990 - LOCATION
      ?AUTO_994 - LOCATION
      ?AUTO_992 - AIRPLANE
      ?AUTO_988 - TRUCK
      ?AUTO_993 - LOCATION
      ?AUTO_991 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_987 ?AUTO_986 ) ( IN-CITY ?AUTO_986 ?AUTO_989 ) ( IN-CITY ?AUTO_985 ?AUTO_989 ) ( not ( = ?AUTO_985 ?AUTO_986 ) ) ( AIRPORT ?AUTO_990 ) ( AIRPORT ?AUTO_986 ) ( not ( = ?AUTO_990 ?AUTO_986 ) ) ( not ( = ?AUTO_985 ?AUTO_990 ) ) ( AIRPORT ?AUTO_994 ) ( AIRPLANE-AT ?AUTO_992 ?AUTO_994 ) ( not ( = ?AUTO_994 ?AUTO_990 ) ) ( not ( = ?AUTO_985 ?AUTO_994 ) ) ( not ( = ?AUTO_986 ?AUTO_994 ) ) ( not ( = ?AUTO_987 ?AUTO_988 ) ) ( TRUCK-AT ?AUTO_988 ?AUTO_993 ) ( IN-CITY ?AUTO_993 ?AUTO_991 ) ( IN-CITY ?AUTO_990 ?AUTO_991 ) ( not ( = ?AUTO_990 ?AUTO_993 ) ) ( not ( = ?AUTO_985 ?AUTO_993 ) ) ( not ( = ?AUTO_986 ?AUTO_993 ) ) ( not ( = ?AUTO_989 ?AUTO_991 ) ) ( not ( = ?AUTO_994 ?AUTO_993 ) ) ( OBJ-AT ?AUTO_984 ?AUTO_993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_984 ?AUTO_988 ?AUTO_993 )
      ( DELIVER-PKG ?AUTO_984 ?AUTO_985 )
      ( DELIVER-PKG-VERIFY ?AUTO_984 ?AUTO_985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_995 - OBJ
      ?AUTO_996 - LOCATION
    )
    :vars
    (
      ?AUTO_1003 - TRUCK
      ?AUTO_1001 - LOCATION
      ?AUTO_999 - CITY
      ?AUTO_998 - LOCATION
      ?AUTO_1004 - LOCATION
      ?AUTO_997 - AIRPLANE
      ?AUTO_1000 - TRUCK
      ?AUTO_1005 - LOCATION
      ?AUTO_1002 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1003 ?AUTO_1001 ) ( IN-CITY ?AUTO_1001 ?AUTO_999 ) ( IN-CITY ?AUTO_996 ?AUTO_999 ) ( not ( = ?AUTO_996 ?AUTO_1001 ) ) ( AIRPORT ?AUTO_998 ) ( AIRPORT ?AUTO_1001 ) ( not ( = ?AUTO_998 ?AUTO_1001 ) ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) ( AIRPORT ?AUTO_1004 ) ( AIRPLANE-AT ?AUTO_997 ?AUTO_1004 ) ( not ( = ?AUTO_1004 ?AUTO_998 ) ) ( not ( = ?AUTO_996 ?AUTO_1004 ) ) ( not ( = ?AUTO_1001 ?AUTO_1004 ) ) ( not ( = ?AUTO_1003 ?AUTO_1000 ) ) ( IN-CITY ?AUTO_1005 ?AUTO_1002 ) ( IN-CITY ?AUTO_998 ?AUTO_1002 ) ( not ( = ?AUTO_998 ?AUTO_1005 ) ) ( not ( = ?AUTO_996 ?AUTO_1005 ) ) ( not ( = ?AUTO_1001 ?AUTO_1005 ) ) ( not ( = ?AUTO_999 ?AUTO_1002 ) ) ( not ( = ?AUTO_1004 ?AUTO_1005 ) ) ( OBJ-AT ?AUTO_995 ?AUTO_1005 ) ( TRUCK-AT ?AUTO_1000 ?AUTO_998 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1000 ?AUTO_998 ?AUTO_1005 ?AUTO_1002 )
      ( DELIVER-PKG ?AUTO_995 ?AUTO_996 )
      ( DELIVER-PKG-VERIFY ?AUTO_995 ?AUTO_996 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1008 - OBJ
      ?AUTO_1009 - LOCATION
    )
    :vars
    (
      ?AUTO_1010 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1010 ?AUTO_1009 ) ( IN-TRUCK ?AUTO_1008 ?AUTO_1010 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1008 ?AUTO_1010 ?AUTO_1009 )
      ( DELIVER-PKG-VERIFY ?AUTO_1008 ?AUTO_1009 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1011 - OBJ
      ?AUTO_1012 - LOCATION
    )
    :vars
    (
      ?AUTO_1013 - TRUCK
      ?AUTO_1014 - LOCATION
      ?AUTO_1015 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1011 ?AUTO_1013 ) ( TRUCK-AT ?AUTO_1013 ?AUTO_1014 ) ( IN-CITY ?AUTO_1014 ?AUTO_1015 ) ( IN-CITY ?AUTO_1012 ?AUTO_1015 ) ( not ( = ?AUTO_1012 ?AUTO_1014 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1013 ?AUTO_1014 ?AUTO_1012 ?AUTO_1015 )
      ( DELIVER-PKG ?AUTO_1011 ?AUTO_1012 )
      ( DELIVER-PKG-VERIFY ?AUTO_1011 ?AUTO_1012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1020 - OBJ
      ?AUTO_1021 - LOCATION
    )
    :vars
    (
      ?AUTO_1022 - TRUCK
      ?AUTO_1024 - LOCATION
      ?AUTO_1023 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1022 ?AUTO_1024 ) ( IN-CITY ?AUTO_1024 ?AUTO_1023 ) ( IN-CITY ?AUTO_1021 ?AUTO_1023 ) ( not ( = ?AUTO_1021 ?AUTO_1024 ) ) ( OBJ-AT ?AUTO_1020 ?AUTO_1024 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1020 ?AUTO_1022 ?AUTO_1024 )
      ( DELIVER-PKG ?AUTO_1020 ?AUTO_1021 )
      ( DELIVER-PKG-VERIFY ?AUTO_1020 ?AUTO_1021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1025 - OBJ
      ?AUTO_1026 - LOCATION
    )
    :vars
    (
      ?AUTO_1029 - LOCATION
      ?AUTO_1027 - CITY
      ?AUTO_1028 - TRUCK
      ?AUTO_1030 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1029 ?AUTO_1027 ) ( IN-CITY ?AUTO_1026 ?AUTO_1027 ) ( not ( = ?AUTO_1026 ?AUTO_1029 ) ) ( OBJ-AT ?AUTO_1025 ?AUTO_1029 ) ( TRUCK-AT ?AUTO_1028 ?AUTO_1030 ) ( IN-CITY ?AUTO_1030 ?AUTO_1027 ) ( not ( = ?AUTO_1029 ?AUTO_1030 ) ) ( not ( = ?AUTO_1026 ?AUTO_1030 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1028 ?AUTO_1030 ?AUTO_1029 ?AUTO_1027 )
      ( DELIVER-PKG ?AUTO_1025 ?AUTO_1026 )
      ( DELIVER-PKG-VERIFY ?AUTO_1025 ?AUTO_1026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1033 - OBJ
      ?AUTO_1034 - LOCATION
    )
    :vars
    (
      ?AUTO_1035 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1035 ?AUTO_1034 ) ( IN-TRUCK ?AUTO_1033 ?AUTO_1035 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1033 ?AUTO_1035 ?AUTO_1034 )
      ( DELIVER-PKG-VERIFY ?AUTO_1033 ?AUTO_1034 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1036 - OBJ
      ?AUTO_1037 - LOCATION
    )
    :vars
    (
      ?AUTO_1038 - TRUCK
      ?AUTO_1039 - LOCATION
      ?AUTO_1040 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1036 ?AUTO_1038 ) ( TRUCK-AT ?AUTO_1038 ?AUTO_1039 ) ( IN-CITY ?AUTO_1039 ?AUTO_1040 ) ( IN-CITY ?AUTO_1037 ?AUTO_1040 ) ( not ( = ?AUTO_1037 ?AUTO_1039 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1038 ?AUTO_1039 ?AUTO_1037 ?AUTO_1040 )
      ( DELIVER-PKG ?AUTO_1036 ?AUTO_1037 )
      ( DELIVER-PKG-VERIFY ?AUTO_1036 ?AUTO_1037 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1041 - OBJ
      ?AUTO_1042 - LOCATION
    )
    :vars
    (
      ?AUTO_1043 - TRUCK
      ?AUTO_1044 - LOCATION
      ?AUTO_1045 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1043 ?AUTO_1044 ) ( IN-CITY ?AUTO_1044 ?AUTO_1045 ) ( IN-CITY ?AUTO_1042 ?AUTO_1045 ) ( not ( = ?AUTO_1042 ?AUTO_1044 ) ) ( OBJ-AT ?AUTO_1041 ?AUTO_1044 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1041 ?AUTO_1043 ?AUTO_1044 )
      ( DELIVER-PKG ?AUTO_1041 ?AUTO_1042 )
      ( DELIVER-PKG-VERIFY ?AUTO_1041 ?AUTO_1042 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1048 - OBJ
      ?AUTO_1049 - LOCATION
    )
    :vars
    (
      ?AUTO_1050 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1048 ?AUTO_1050 ) ( AIRPLANE-AT ?AUTO_1050 ?AUTO_1049 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1048 ?AUTO_1050 ?AUTO_1049 )
      ( DELIVER-PKG-VERIFY ?AUTO_1048 ?AUTO_1049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1051 - OBJ
      ?AUTO_1052 - LOCATION
    )
    :vars
    (
      ?AUTO_1053 - AIRPLANE
      ?AUTO_1054 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1051 ?AUTO_1053 ) ( AIRPORT ?AUTO_1054 ) ( AIRPORT ?AUTO_1052 ) ( AIRPLANE-AT ?AUTO_1053 ?AUTO_1054 ) ( not ( = ?AUTO_1054 ?AUTO_1052 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1053 ?AUTO_1054 ?AUTO_1052 )
      ( DELIVER-PKG ?AUTO_1051 ?AUTO_1052 )
      ( DELIVER-PKG-VERIFY ?AUTO_1051 ?AUTO_1052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1055 - OBJ
      ?AUTO_1056 - LOCATION
    )
    :vars
    (
      ?AUTO_1058 - LOCATION
      ?AUTO_1057 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1058 ) ( AIRPORT ?AUTO_1056 ) ( AIRPLANE-AT ?AUTO_1057 ?AUTO_1058 ) ( not ( = ?AUTO_1058 ?AUTO_1056 ) ) ( OBJ-AT ?AUTO_1055 ?AUTO_1058 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1055 ?AUTO_1057 ?AUTO_1058 )
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
      ?AUTO_1067 - LOCATION
      ?AUTO_1066 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1065 ) ( AIRPORT ?AUTO_1064 ) ( not ( = ?AUTO_1065 ?AUTO_1064 ) ) ( OBJ-AT ?AUTO_1063 ?AUTO_1065 ) ( AIRPORT ?AUTO_1067 ) ( AIRPLANE-AT ?AUTO_1066 ?AUTO_1067 ) ( not ( = ?AUTO_1067 ?AUTO_1065 ) ) ( not ( = ?AUTO_1064 ?AUTO_1067 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1066 ?AUTO_1067 ?AUTO_1065 )
      ( DELIVER-PKG ?AUTO_1063 ?AUTO_1064 )
      ( DELIVER-PKG-VERIFY ?AUTO_1063 ?AUTO_1064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1076 - OBJ
      ?AUTO_1077 - LOCATION
    )
    :vars
    (
      ?AUTO_1078 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1078 ?AUTO_1077 ) ( IN-TRUCK ?AUTO_1076 ?AUTO_1078 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1076 ?AUTO_1078 ?AUTO_1077 )
      ( DELIVER-PKG-VERIFY ?AUTO_1076 ?AUTO_1077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1081 - OBJ
      ?AUTO_1082 - LOCATION
    )
    :vars
    (
      ?AUTO_1083 - TRUCK
      ?AUTO_1084 - LOCATION
      ?AUTO_1085 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1081 ?AUTO_1083 ) ( TRUCK-AT ?AUTO_1083 ?AUTO_1084 ) ( IN-CITY ?AUTO_1084 ?AUTO_1085 ) ( IN-CITY ?AUTO_1082 ?AUTO_1085 ) ( not ( = ?AUTO_1082 ?AUTO_1084 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1083 ?AUTO_1084 ?AUTO_1082 ?AUTO_1085 )
      ( DELIVER-PKG ?AUTO_1081 ?AUTO_1082 )
      ( DELIVER-PKG-VERIFY ?AUTO_1081 ?AUTO_1082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1094 - OBJ
      ?AUTO_1095 - LOCATION
    )
    :vars
    (
      ?AUTO_1097 - TRUCK
      ?AUTO_1098 - LOCATION
      ?AUTO_1096 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1097 ?AUTO_1098 ) ( IN-CITY ?AUTO_1098 ?AUTO_1096 ) ( IN-CITY ?AUTO_1095 ?AUTO_1096 ) ( not ( = ?AUTO_1095 ?AUTO_1098 ) ) ( OBJ-AT ?AUTO_1094 ?AUTO_1098 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1094 ?AUTO_1097 ?AUTO_1098 )
      ( DELIVER-PKG ?AUTO_1094 ?AUTO_1095 )
      ( DELIVER-PKG-VERIFY ?AUTO_1094 ?AUTO_1095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1109 - OBJ
      ?AUTO_1110 - LOCATION
    )
    :vars
    (
      ?AUTO_1111 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1109 ?AUTO_1111 ) ( AIRPLANE-AT ?AUTO_1111 ?AUTO_1110 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1109 ?AUTO_1111 ?AUTO_1110 )
      ( DELIVER-PKG-VERIFY ?AUTO_1109 ?AUTO_1110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1112 - OBJ
      ?AUTO_1113 - LOCATION
    )
    :vars
    (
      ?AUTO_1114 - AIRPLANE
      ?AUTO_1115 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1112 ?AUTO_1114 ) ( AIRPORT ?AUTO_1115 ) ( AIRPORT ?AUTO_1113 ) ( AIRPLANE-AT ?AUTO_1114 ?AUTO_1115 ) ( not ( = ?AUTO_1115 ?AUTO_1113 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1114 ?AUTO_1115 ?AUTO_1113 )
      ( DELIVER-PKG ?AUTO_1112 ?AUTO_1113 )
      ( DELIVER-PKG-VERIFY ?AUTO_1112 ?AUTO_1113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1134 - OBJ
      ?AUTO_1135 - LOCATION
    )
    :vars
    (
      ?AUTO_1137 - LOCATION
      ?AUTO_1136 - AIRPLANE
      ?AUTO_1138 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1137 ) ( AIRPORT ?AUTO_1135 ) ( AIRPLANE-AT ?AUTO_1136 ?AUTO_1137 ) ( not ( = ?AUTO_1137 ?AUTO_1135 ) ) ( TRUCK-AT ?AUTO_1138 ?AUTO_1137 ) ( IN-TRUCK ?AUTO_1134 ?AUTO_1138 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1134 ?AUTO_1138 ?AUTO_1137 )
      ( DELIVER-PKG ?AUTO_1134 ?AUTO_1135 )
      ( DELIVER-PKG-VERIFY ?AUTO_1134 ?AUTO_1135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1139 - OBJ
      ?AUTO_1140 - LOCATION
    )
    :vars
    (
      ?AUTO_1142 - LOCATION
      ?AUTO_1141 - AIRPLANE
      ?AUTO_1143 - TRUCK
      ?AUTO_1144 - LOCATION
      ?AUTO_1145 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1142 ) ( AIRPORT ?AUTO_1140 ) ( AIRPLANE-AT ?AUTO_1141 ?AUTO_1142 ) ( not ( = ?AUTO_1142 ?AUTO_1140 ) ) ( IN-TRUCK ?AUTO_1139 ?AUTO_1143 ) ( TRUCK-AT ?AUTO_1143 ?AUTO_1144 ) ( IN-CITY ?AUTO_1144 ?AUTO_1145 ) ( IN-CITY ?AUTO_1142 ?AUTO_1145 ) ( not ( = ?AUTO_1142 ?AUTO_1144 ) ) ( not ( = ?AUTO_1140 ?AUTO_1144 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1143 ?AUTO_1144 ?AUTO_1142 ?AUTO_1145 )
      ( DELIVER-PKG ?AUTO_1139 ?AUTO_1140 )
      ( DELIVER-PKG-VERIFY ?AUTO_1139 ?AUTO_1140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1146 - OBJ
      ?AUTO_1147 - LOCATION
    )
    :vars
    (
      ?AUTO_1148 - LOCATION
      ?AUTO_1150 - AIRPLANE
      ?AUTO_1149 - TRUCK
      ?AUTO_1152 - LOCATION
      ?AUTO_1151 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1148 ) ( AIRPORT ?AUTO_1147 ) ( AIRPLANE-AT ?AUTO_1150 ?AUTO_1148 ) ( not ( = ?AUTO_1148 ?AUTO_1147 ) ) ( TRUCK-AT ?AUTO_1149 ?AUTO_1152 ) ( IN-CITY ?AUTO_1152 ?AUTO_1151 ) ( IN-CITY ?AUTO_1148 ?AUTO_1151 ) ( not ( = ?AUTO_1148 ?AUTO_1152 ) ) ( not ( = ?AUTO_1147 ?AUTO_1152 ) ) ( OBJ-AT ?AUTO_1146 ?AUTO_1152 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1146 ?AUTO_1149 ?AUTO_1152 )
      ( DELIVER-PKG ?AUTO_1146 ?AUTO_1147 )
      ( DELIVER-PKG-VERIFY ?AUTO_1146 ?AUTO_1147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1155 - OBJ
      ?AUTO_1156 - LOCATION
    )
    :vars
    (
      ?AUTO_1157 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1155 ?AUTO_1157 ) ( AIRPLANE-AT ?AUTO_1157 ?AUTO_1156 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1155 ?AUTO_1157 ?AUTO_1156 )
      ( DELIVER-PKG-VERIFY ?AUTO_1155 ?AUTO_1156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1162 - OBJ
      ?AUTO_1163 - LOCATION
    )
    :vars
    (
      ?AUTO_1164 - AIRPLANE
      ?AUTO_1165 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1162 ?AUTO_1164 ) ( AIRPORT ?AUTO_1165 ) ( AIRPORT ?AUTO_1163 ) ( AIRPLANE-AT ?AUTO_1164 ?AUTO_1165 ) ( not ( = ?AUTO_1165 ?AUTO_1163 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1164 ?AUTO_1165 ?AUTO_1163 )
      ( DELIVER-PKG ?AUTO_1162 ?AUTO_1163 )
      ( DELIVER-PKG-VERIFY ?AUTO_1162 ?AUTO_1163 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1166 - OBJ
      ?AUTO_1167 - LOCATION
    )
    :vars
    (
      ?AUTO_1169 - LOCATION
      ?AUTO_1168 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1169 ) ( AIRPORT ?AUTO_1167 ) ( AIRPLANE-AT ?AUTO_1168 ?AUTO_1169 ) ( not ( = ?AUTO_1169 ?AUTO_1167 ) ) ( OBJ-AT ?AUTO_1166 ?AUTO_1169 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1166 ?AUTO_1168 ?AUTO_1169 )
      ( DELIVER-PKG ?AUTO_1166 ?AUTO_1167 )
      ( DELIVER-PKG-VERIFY ?AUTO_1166 ?AUTO_1167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1174 - OBJ
      ?AUTO_1175 - LOCATION
    )
    :vars
    (
      ?AUTO_1176 - LOCATION
      ?AUTO_1177 - AIRPLANE
      ?AUTO_1178 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1176 ) ( AIRPORT ?AUTO_1175 ) ( AIRPLANE-AT ?AUTO_1177 ?AUTO_1176 ) ( not ( = ?AUTO_1176 ?AUTO_1175 ) ) ( TRUCK-AT ?AUTO_1178 ?AUTO_1176 ) ( IN-TRUCK ?AUTO_1174 ?AUTO_1178 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1174 ?AUTO_1178 ?AUTO_1176 )
      ( DELIVER-PKG ?AUTO_1174 ?AUTO_1175 )
      ( DELIVER-PKG-VERIFY ?AUTO_1174 ?AUTO_1175 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1181 - OBJ
      ?AUTO_1182 - LOCATION
    )
    :vars
    (
      ?AUTO_1184 - LOCATION
      ?AUTO_1185 - AIRPLANE
      ?AUTO_1183 - TRUCK
      ?AUTO_1186 - LOCATION
      ?AUTO_1187 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1184 ) ( AIRPORT ?AUTO_1182 ) ( AIRPLANE-AT ?AUTO_1185 ?AUTO_1184 ) ( not ( = ?AUTO_1184 ?AUTO_1182 ) ) ( IN-TRUCK ?AUTO_1181 ?AUTO_1183 ) ( TRUCK-AT ?AUTO_1183 ?AUTO_1186 ) ( IN-CITY ?AUTO_1186 ?AUTO_1187 ) ( IN-CITY ?AUTO_1184 ?AUTO_1187 ) ( not ( = ?AUTO_1184 ?AUTO_1186 ) ) ( not ( = ?AUTO_1182 ?AUTO_1186 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1183 ?AUTO_1186 ?AUTO_1184 ?AUTO_1187 )
      ( DELIVER-PKG ?AUTO_1181 ?AUTO_1182 )
      ( DELIVER-PKG-VERIFY ?AUTO_1181 ?AUTO_1182 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1190 - OBJ
      ?AUTO_1191 - LOCATION
    )
    :vars
    (
      ?AUTO_1193 - LOCATION
      ?AUTO_1196 - TRUCK
      ?AUTO_1192 - LOCATION
      ?AUTO_1194 - CITY
      ?AUTO_1197 - LOCATION
      ?AUTO_1195 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1193 ) ( AIRPORT ?AUTO_1191 ) ( not ( = ?AUTO_1193 ?AUTO_1191 ) ) ( IN-TRUCK ?AUTO_1190 ?AUTO_1196 ) ( TRUCK-AT ?AUTO_1196 ?AUTO_1192 ) ( IN-CITY ?AUTO_1192 ?AUTO_1194 ) ( IN-CITY ?AUTO_1193 ?AUTO_1194 ) ( not ( = ?AUTO_1193 ?AUTO_1192 ) ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( AIRPORT ?AUTO_1197 ) ( AIRPLANE-AT ?AUTO_1195 ?AUTO_1197 ) ( not ( = ?AUTO_1197 ?AUTO_1193 ) ) ( not ( = ?AUTO_1191 ?AUTO_1197 ) ) ( not ( = ?AUTO_1192 ?AUTO_1197 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1195 ?AUTO_1197 ?AUTO_1193 )
      ( DELIVER-PKG ?AUTO_1190 ?AUTO_1191 )
      ( DELIVER-PKG-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1202 - OBJ
      ?AUTO_1203 - LOCATION
    )
    :vars
    (
      ?AUTO_1204 - LOCATION
      ?AUTO_1209 - TRUCK
      ?AUTO_1205 - LOCATION
      ?AUTO_1207 - CITY
      ?AUTO_1206 - LOCATION
      ?AUTO_1208 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1204 ) ( AIRPORT ?AUTO_1203 ) ( not ( = ?AUTO_1204 ?AUTO_1203 ) ) ( TRUCK-AT ?AUTO_1209 ?AUTO_1205 ) ( IN-CITY ?AUTO_1205 ?AUTO_1207 ) ( IN-CITY ?AUTO_1204 ?AUTO_1207 ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( not ( = ?AUTO_1203 ?AUTO_1205 ) ) ( AIRPORT ?AUTO_1206 ) ( AIRPLANE-AT ?AUTO_1208 ?AUTO_1206 ) ( not ( = ?AUTO_1206 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1206 ) ) ( not ( = ?AUTO_1205 ?AUTO_1206 ) ) ( OBJ-AT ?AUTO_1202 ?AUTO_1205 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1202 ?AUTO_1209 ?AUTO_1205 )
      ( DELIVER-PKG ?AUTO_1202 ?AUTO_1203 )
      ( DELIVER-PKG-VERIFY ?AUTO_1202 ?AUTO_1203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1220 - OBJ
      ?AUTO_1221 - LOCATION
    )
    :vars
    (
      ?AUTO_1222 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1222 ?AUTO_1221 ) ( IN-TRUCK ?AUTO_1220 ?AUTO_1222 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1220 ?AUTO_1222 ?AUTO_1221 )
      ( DELIVER-PKG-VERIFY ?AUTO_1220 ?AUTO_1221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1225 - OBJ
      ?AUTO_1226 - LOCATION
    )
    :vars
    (
      ?AUTO_1227 - TRUCK
      ?AUTO_1228 - LOCATION
      ?AUTO_1229 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1225 ?AUTO_1227 ) ( TRUCK-AT ?AUTO_1227 ?AUTO_1228 ) ( IN-CITY ?AUTO_1228 ?AUTO_1229 ) ( IN-CITY ?AUTO_1226 ?AUTO_1229 ) ( not ( = ?AUTO_1226 ?AUTO_1228 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1227 ?AUTO_1228 ?AUTO_1226 ?AUTO_1229 )
      ( DELIVER-PKG ?AUTO_1225 ?AUTO_1226 )
      ( DELIVER-PKG-VERIFY ?AUTO_1225 ?AUTO_1226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1230 - OBJ
      ?AUTO_1231 - LOCATION
    )
    :vars
    (
      ?AUTO_1232 - TRUCK
      ?AUTO_1233 - LOCATION
      ?AUTO_1234 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1232 ?AUTO_1233 ) ( IN-CITY ?AUTO_1233 ?AUTO_1234 ) ( IN-CITY ?AUTO_1231 ?AUTO_1234 ) ( not ( = ?AUTO_1231 ?AUTO_1233 ) ) ( OBJ-AT ?AUTO_1230 ?AUTO_1233 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1230 ?AUTO_1232 ?AUTO_1233 )
      ( DELIVER-PKG ?AUTO_1230 ?AUTO_1231 )
      ( DELIVER-PKG-VERIFY ?AUTO_1230 ?AUTO_1231 ) )
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
      ?AUTO_1242 - LOCATION
      ?AUTO_1241 - CITY
      ?AUTO_1244 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1243 ?AUTO_1242 ) ( IN-CITY ?AUTO_1242 ?AUTO_1241 ) ( IN-CITY ?AUTO_1240 ?AUTO_1241 ) ( not ( = ?AUTO_1240 ?AUTO_1242 ) ) ( IN-AIRPLANE ?AUTO_1239 ?AUTO_1244 ) ( AIRPLANE-AT ?AUTO_1244 ?AUTO_1242 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1239 ?AUTO_1244 ?AUTO_1242 )
      ( DELIVER-PKG ?AUTO_1239 ?AUTO_1240 )
      ( DELIVER-PKG-VERIFY ?AUTO_1239 ?AUTO_1240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1245 - OBJ
      ?AUTO_1246 - LOCATION
    )
    :vars
    (
      ?AUTO_1247 - TRUCK
      ?AUTO_1249 - LOCATION
      ?AUTO_1248 - CITY
      ?AUTO_1250 - AIRPLANE
      ?AUTO_1251 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1247 ?AUTO_1249 ) ( IN-CITY ?AUTO_1249 ?AUTO_1248 ) ( IN-CITY ?AUTO_1246 ?AUTO_1248 ) ( not ( = ?AUTO_1246 ?AUTO_1249 ) ) ( IN-AIRPLANE ?AUTO_1245 ?AUTO_1250 ) ( AIRPORT ?AUTO_1251 ) ( AIRPORT ?AUTO_1249 ) ( AIRPLANE-AT ?AUTO_1250 ?AUTO_1251 ) ( not ( = ?AUTO_1251 ?AUTO_1249 ) ) ( not ( = ?AUTO_1246 ?AUTO_1251 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1250 ?AUTO_1251 ?AUTO_1249 )
      ( DELIVER-PKG ?AUTO_1245 ?AUTO_1246 )
      ( DELIVER-PKG-VERIFY ?AUTO_1245 ?AUTO_1246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1256 - OBJ
      ?AUTO_1257 - LOCATION
    )
    :vars
    (
      ?AUTO_1259 - LOCATION
      ?AUTO_1258 - CITY
      ?AUTO_1260 - AIRPLANE
      ?AUTO_1261 - LOCATION
      ?AUTO_1262 - TRUCK
      ?AUTO_1263 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1259 ?AUTO_1258 ) ( IN-CITY ?AUTO_1257 ?AUTO_1258 ) ( not ( = ?AUTO_1257 ?AUTO_1259 ) ) ( IN-AIRPLANE ?AUTO_1256 ?AUTO_1260 ) ( AIRPORT ?AUTO_1261 ) ( AIRPORT ?AUTO_1259 ) ( AIRPLANE-AT ?AUTO_1260 ?AUTO_1261 ) ( not ( = ?AUTO_1261 ?AUTO_1259 ) ) ( not ( = ?AUTO_1257 ?AUTO_1261 ) ) ( TRUCK-AT ?AUTO_1262 ?AUTO_1263 ) ( IN-CITY ?AUTO_1263 ?AUTO_1258 ) ( not ( = ?AUTO_1259 ?AUTO_1263 ) ) ( not ( = ?AUTO_1257 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1262 ?AUTO_1263 ?AUTO_1259 ?AUTO_1258 )
      ( DELIVER-PKG ?AUTO_1256 ?AUTO_1257 )
      ( DELIVER-PKG-VERIFY ?AUTO_1256 ?AUTO_1257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1270 - OBJ
      ?AUTO_1271 - LOCATION
    )
    :vars
    (
      ?AUTO_1277 - LOCATION
      ?AUTO_1273 - CITY
      ?AUTO_1274 - LOCATION
      ?AUTO_1275 - AIRPLANE
      ?AUTO_1272 - TRUCK
      ?AUTO_1276 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1277 ?AUTO_1273 ) ( IN-CITY ?AUTO_1271 ?AUTO_1273 ) ( not ( = ?AUTO_1271 ?AUTO_1277 ) ) ( AIRPORT ?AUTO_1274 ) ( AIRPORT ?AUTO_1277 ) ( AIRPLANE-AT ?AUTO_1275 ?AUTO_1274 ) ( not ( = ?AUTO_1274 ?AUTO_1277 ) ) ( not ( = ?AUTO_1271 ?AUTO_1274 ) ) ( TRUCK-AT ?AUTO_1272 ?AUTO_1276 ) ( IN-CITY ?AUTO_1276 ?AUTO_1273 ) ( not ( = ?AUTO_1277 ?AUTO_1276 ) ) ( not ( = ?AUTO_1271 ?AUTO_1276 ) ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( OBJ-AT ?AUTO_1270 ?AUTO_1274 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1270 ?AUTO_1275 ?AUTO_1274 )
      ( DELIVER-PKG ?AUTO_1270 ?AUTO_1271 )
      ( DELIVER-PKG-VERIFY ?AUTO_1270 ?AUTO_1271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1282 - OBJ
      ?AUTO_1283 - LOCATION
    )
    :vars
    (
      ?AUTO_1285 - LOCATION
      ?AUTO_1286 - CITY
      ?AUTO_1287 - LOCATION
      ?AUTO_1288 - AIRPLANE
      ?AUTO_1284 - TRUCK
      ?AUTO_1289 - LOCATION
      ?AUTO_1290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1285 ?AUTO_1286 ) ( IN-CITY ?AUTO_1283 ?AUTO_1286 ) ( not ( = ?AUTO_1283 ?AUTO_1285 ) ) ( AIRPORT ?AUTO_1287 ) ( AIRPORT ?AUTO_1285 ) ( AIRPLANE-AT ?AUTO_1288 ?AUTO_1287 ) ( not ( = ?AUTO_1287 ?AUTO_1285 ) ) ( not ( = ?AUTO_1283 ?AUTO_1287 ) ) ( TRUCK-AT ?AUTO_1284 ?AUTO_1289 ) ( IN-CITY ?AUTO_1289 ?AUTO_1286 ) ( not ( = ?AUTO_1285 ?AUTO_1289 ) ) ( not ( = ?AUTO_1283 ?AUTO_1289 ) ) ( not ( = ?AUTO_1287 ?AUTO_1289 ) ) ( TRUCK-AT ?AUTO_1290 ?AUTO_1287 ) ( IN-TRUCK ?AUTO_1282 ?AUTO_1290 ) ( not ( = ?AUTO_1284 ?AUTO_1290 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1282 ?AUTO_1290 ?AUTO_1287 )
      ( DELIVER-PKG ?AUTO_1282 ?AUTO_1283 )
      ( DELIVER-PKG-VERIFY ?AUTO_1282 ?AUTO_1283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1291 - OBJ
      ?AUTO_1292 - LOCATION
    )
    :vars
    (
      ?AUTO_1296 - LOCATION
      ?AUTO_1297 - CITY
      ?AUTO_1295 - LOCATION
      ?AUTO_1298 - AIRPLANE
      ?AUTO_1293 - TRUCK
      ?AUTO_1294 - LOCATION
      ?AUTO_1299 - TRUCK
      ?AUTO_1300 - LOCATION
      ?AUTO_1301 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1296 ?AUTO_1297 ) ( IN-CITY ?AUTO_1292 ?AUTO_1297 ) ( not ( = ?AUTO_1292 ?AUTO_1296 ) ) ( AIRPORT ?AUTO_1295 ) ( AIRPORT ?AUTO_1296 ) ( AIRPLANE-AT ?AUTO_1298 ?AUTO_1295 ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( not ( = ?AUTO_1292 ?AUTO_1295 ) ) ( TRUCK-AT ?AUTO_1293 ?AUTO_1294 ) ( IN-CITY ?AUTO_1294 ?AUTO_1297 ) ( not ( = ?AUTO_1296 ?AUTO_1294 ) ) ( not ( = ?AUTO_1292 ?AUTO_1294 ) ) ( not ( = ?AUTO_1295 ?AUTO_1294 ) ) ( IN-TRUCK ?AUTO_1291 ?AUTO_1299 ) ( not ( = ?AUTO_1293 ?AUTO_1299 ) ) ( TRUCK-AT ?AUTO_1299 ?AUTO_1300 ) ( IN-CITY ?AUTO_1300 ?AUTO_1301 ) ( IN-CITY ?AUTO_1295 ?AUTO_1301 ) ( not ( = ?AUTO_1295 ?AUTO_1300 ) ) ( not ( = ?AUTO_1292 ?AUTO_1300 ) ) ( not ( = ?AUTO_1296 ?AUTO_1300 ) ) ( not ( = ?AUTO_1297 ?AUTO_1301 ) ) ( not ( = ?AUTO_1294 ?AUTO_1300 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1299 ?AUTO_1300 ?AUTO_1295 ?AUTO_1301 )
      ( DELIVER-PKG ?AUTO_1291 ?AUTO_1292 )
      ( DELIVER-PKG-VERIFY ?AUTO_1291 ?AUTO_1292 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1302 - OBJ
      ?AUTO_1303 - LOCATION
    )
    :vars
    (
      ?AUTO_1307 - LOCATION
      ?AUTO_1306 - CITY
      ?AUTO_1309 - LOCATION
      ?AUTO_1310 - AIRPLANE
      ?AUTO_1304 - TRUCK
      ?AUTO_1305 - LOCATION
      ?AUTO_1308 - TRUCK
      ?AUTO_1311 - LOCATION
      ?AUTO_1312 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1307 ?AUTO_1306 ) ( IN-CITY ?AUTO_1303 ?AUTO_1306 ) ( not ( = ?AUTO_1303 ?AUTO_1307 ) ) ( AIRPORT ?AUTO_1309 ) ( AIRPORT ?AUTO_1307 ) ( AIRPLANE-AT ?AUTO_1310 ?AUTO_1309 ) ( not ( = ?AUTO_1309 ?AUTO_1307 ) ) ( not ( = ?AUTO_1303 ?AUTO_1309 ) ) ( TRUCK-AT ?AUTO_1304 ?AUTO_1305 ) ( IN-CITY ?AUTO_1305 ?AUTO_1306 ) ( not ( = ?AUTO_1307 ?AUTO_1305 ) ) ( not ( = ?AUTO_1303 ?AUTO_1305 ) ) ( not ( = ?AUTO_1309 ?AUTO_1305 ) ) ( not ( = ?AUTO_1304 ?AUTO_1308 ) ) ( TRUCK-AT ?AUTO_1308 ?AUTO_1311 ) ( IN-CITY ?AUTO_1311 ?AUTO_1312 ) ( IN-CITY ?AUTO_1309 ?AUTO_1312 ) ( not ( = ?AUTO_1309 ?AUTO_1311 ) ) ( not ( = ?AUTO_1303 ?AUTO_1311 ) ) ( not ( = ?AUTO_1307 ?AUTO_1311 ) ) ( not ( = ?AUTO_1306 ?AUTO_1312 ) ) ( not ( = ?AUTO_1305 ?AUTO_1311 ) ) ( OBJ-AT ?AUTO_1302 ?AUTO_1311 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1302 ?AUTO_1308 ?AUTO_1311 )
      ( DELIVER-PKG ?AUTO_1302 ?AUTO_1303 )
      ( DELIVER-PKG-VERIFY ?AUTO_1302 ?AUTO_1303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1315 - OBJ
      ?AUTO_1316 - LOCATION
    )
    :vars
    (
      ?AUTO_1317 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1317 ?AUTO_1316 ) ( IN-TRUCK ?AUTO_1315 ?AUTO_1317 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1315 ?AUTO_1317 ?AUTO_1316 )
      ( DELIVER-PKG-VERIFY ?AUTO_1315 ?AUTO_1316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1338 - OBJ
      ?AUTO_1339 - LOCATION
    )
    :vars
    (
      ?AUTO_1341 - LOCATION
      ?AUTO_1342 - CITY
      ?AUTO_1340 - TRUCK
      ?AUTO_1343 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1341 ?AUTO_1342 ) ( IN-CITY ?AUTO_1339 ?AUTO_1342 ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( OBJ-AT ?AUTO_1338 ?AUTO_1341 ) ( TRUCK-AT ?AUTO_1340 ?AUTO_1343 ) ( IN-CITY ?AUTO_1343 ?AUTO_1342 ) ( not ( = ?AUTO_1341 ?AUTO_1343 ) ) ( not ( = ?AUTO_1339 ?AUTO_1343 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1340 ?AUTO_1343 ?AUTO_1341 ?AUTO_1342 )
      ( DELIVER-PKG ?AUTO_1338 ?AUTO_1339 )
      ( DELIVER-PKG-VERIFY ?AUTO_1338 ?AUTO_1339 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1344 - OBJ
      ?AUTO_1345 - LOCATION
    )
    :vars
    (
      ?AUTO_1346 - LOCATION
      ?AUTO_1348 - CITY
      ?AUTO_1347 - TRUCK
      ?AUTO_1349 - LOCATION
      ?AUTO_1350 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1346 ?AUTO_1348 ) ( IN-CITY ?AUTO_1345 ?AUTO_1348 ) ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( TRUCK-AT ?AUTO_1347 ?AUTO_1349 ) ( IN-CITY ?AUTO_1349 ?AUTO_1348 ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( not ( = ?AUTO_1345 ?AUTO_1349 ) ) ( IN-AIRPLANE ?AUTO_1344 ?AUTO_1350 ) ( AIRPLANE-AT ?AUTO_1350 ?AUTO_1346 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1344 ?AUTO_1350 ?AUTO_1346 )
      ( DELIVER-PKG ?AUTO_1344 ?AUTO_1345 )
      ( DELIVER-PKG-VERIFY ?AUTO_1344 ?AUTO_1345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1353 - OBJ
      ?AUTO_1354 - LOCATION
    )
    :vars
    (
      ?AUTO_1357 - LOCATION
      ?AUTO_1359 - CITY
      ?AUTO_1358 - LOCATION
      ?AUTO_1360 - AIRPLANE
      ?AUTO_1355 - TRUCK
      ?AUTO_1356 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1357 ?AUTO_1359 ) ( IN-CITY ?AUTO_1354 ?AUTO_1359 ) ( not ( = ?AUTO_1354 ?AUTO_1357 ) ) ( AIRPORT ?AUTO_1358 ) ( AIRPORT ?AUTO_1357 ) ( AIRPLANE-AT ?AUTO_1360 ?AUTO_1358 ) ( not ( = ?AUTO_1358 ?AUTO_1357 ) ) ( not ( = ?AUTO_1354 ?AUTO_1358 ) ) ( TRUCK-AT ?AUTO_1355 ?AUTO_1356 ) ( IN-CITY ?AUTO_1356 ?AUTO_1359 ) ( not ( = ?AUTO_1357 ?AUTO_1356 ) ) ( not ( = ?AUTO_1354 ?AUTO_1356 ) ) ( not ( = ?AUTO_1358 ?AUTO_1356 ) ) ( OBJ-AT ?AUTO_1353 ?AUTO_1358 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1353 ?AUTO_1360 ?AUTO_1358 )
      ( DELIVER-PKG ?AUTO_1353 ?AUTO_1354 )
      ( DELIVER-PKG-VERIFY ?AUTO_1353 ?AUTO_1354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1365 - OBJ
      ?AUTO_1366 - LOCATION
    )
    :vars
    (
      ?AUTO_1369 - LOCATION
      ?AUTO_1371 - CITY
      ?AUTO_1370 - LOCATION
      ?AUTO_1368 - TRUCK
      ?AUTO_1372 - LOCATION
      ?AUTO_1373 - LOCATION
      ?AUTO_1367 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1369 ?AUTO_1371 ) ( IN-CITY ?AUTO_1366 ?AUTO_1371 ) ( not ( = ?AUTO_1366 ?AUTO_1369 ) ) ( AIRPORT ?AUTO_1370 ) ( AIRPORT ?AUTO_1369 ) ( not ( = ?AUTO_1370 ?AUTO_1369 ) ) ( not ( = ?AUTO_1366 ?AUTO_1370 ) ) ( TRUCK-AT ?AUTO_1368 ?AUTO_1372 ) ( IN-CITY ?AUTO_1372 ?AUTO_1371 ) ( not ( = ?AUTO_1369 ?AUTO_1372 ) ) ( not ( = ?AUTO_1366 ?AUTO_1372 ) ) ( not ( = ?AUTO_1370 ?AUTO_1372 ) ) ( OBJ-AT ?AUTO_1365 ?AUTO_1370 ) ( AIRPORT ?AUTO_1373 ) ( AIRPLANE-AT ?AUTO_1367 ?AUTO_1373 ) ( not ( = ?AUTO_1373 ?AUTO_1370 ) ) ( not ( = ?AUTO_1366 ?AUTO_1373 ) ) ( not ( = ?AUTO_1369 ?AUTO_1373 ) ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1367 ?AUTO_1373 ?AUTO_1370 )
      ( DELIVER-PKG ?AUTO_1365 ?AUTO_1366 )
      ( DELIVER-PKG-VERIFY ?AUTO_1365 ?AUTO_1366 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1376 - OBJ
      ?AUTO_1377 - LOCATION
    )
    :vars
    (
      ?AUTO_1378 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1378 ?AUTO_1377 ) ( IN-TRUCK ?AUTO_1376 ?AUTO_1378 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1376 ?AUTO_1378 ?AUTO_1377 )
      ( DELIVER-PKG-VERIFY ?AUTO_1376 ?AUTO_1377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1379 - OBJ
      ?AUTO_1380 - LOCATION
    )
    :vars
    (
      ?AUTO_1381 - TRUCK
      ?AUTO_1382 - LOCATION
      ?AUTO_1383 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1379 ?AUTO_1381 ) ( TRUCK-AT ?AUTO_1381 ?AUTO_1382 ) ( IN-CITY ?AUTO_1382 ?AUTO_1383 ) ( IN-CITY ?AUTO_1380 ?AUTO_1383 ) ( not ( = ?AUTO_1380 ?AUTO_1382 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1381 ?AUTO_1382 ?AUTO_1380 ?AUTO_1383 )
      ( DELIVER-PKG ?AUTO_1379 ?AUTO_1380 )
      ( DELIVER-PKG-VERIFY ?AUTO_1379 ?AUTO_1380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1394 - OBJ
      ?AUTO_1395 - LOCATION
    )
    :vars
    (
      ?AUTO_1398 - TRUCK
      ?AUTO_1396 - LOCATION
      ?AUTO_1397 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1398 ?AUTO_1396 ) ( IN-CITY ?AUTO_1396 ?AUTO_1397 ) ( IN-CITY ?AUTO_1395 ?AUTO_1397 ) ( not ( = ?AUTO_1395 ?AUTO_1396 ) ) ( OBJ-AT ?AUTO_1394 ?AUTO_1396 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1394 ?AUTO_1398 ?AUTO_1396 )
      ( DELIVER-PKG ?AUTO_1394 ?AUTO_1395 )
      ( DELIVER-PKG-VERIFY ?AUTO_1394 ?AUTO_1395 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1401 - OBJ
      ?AUTO_1402 - LOCATION
    )
    :vars
    (
      ?AUTO_1403 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1403 ?AUTO_1402 ) ( IN-TRUCK ?AUTO_1401 ?AUTO_1403 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1401 ?AUTO_1403 ?AUTO_1402 )
      ( DELIVER-PKG-VERIFY ?AUTO_1401 ?AUTO_1402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1416 - OBJ
      ?AUTO_1417 - LOCATION
    )
    :vars
    (
      ?AUTO_1418 - TRUCK
      ?AUTO_1419 - LOCATION
      ?AUTO_1420 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1418 ?AUTO_1419 ) ( IN-CITY ?AUTO_1419 ?AUTO_1420 ) ( IN-CITY ?AUTO_1417 ?AUTO_1420 ) ( not ( = ?AUTO_1417 ?AUTO_1419 ) ) ( OBJ-AT ?AUTO_1416 ?AUTO_1419 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1416 ?AUTO_1418 ?AUTO_1419 )
      ( DELIVER-PKG ?AUTO_1416 ?AUTO_1417 )
      ( DELIVER-PKG-VERIFY ?AUTO_1416 ?AUTO_1417 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1425 - OBJ
      ?AUTO_1426 - LOCATION
    )
    :vars
    (
      ?AUTO_1427 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1427 ?AUTO_1426 ) ( IN-TRUCK ?AUTO_1425 ?AUTO_1427 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1425 ?AUTO_1427 ?AUTO_1426 )
      ( DELIVER-PKG-VERIFY ?AUTO_1425 ?AUTO_1426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1438 - OBJ
      ?AUTO_1439 - LOCATION
    )
    :vars
    (
      ?AUTO_1442 - TRUCK
      ?AUTO_1441 - LOCATION
      ?AUTO_1440 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1442 ?AUTO_1441 ) ( IN-CITY ?AUTO_1441 ?AUTO_1440 ) ( IN-CITY ?AUTO_1439 ?AUTO_1440 ) ( not ( = ?AUTO_1439 ?AUTO_1441 ) ) ( OBJ-AT ?AUTO_1438 ?AUTO_1441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1438 ?AUTO_1442 ?AUTO_1441 )
      ( DELIVER-PKG ?AUTO_1438 ?AUTO_1439 )
      ( DELIVER-PKG-VERIFY ?AUTO_1438 ?AUTO_1439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1451 - OBJ
      ?AUTO_1452 - LOCATION
    )
    :vars
    (
      ?AUTO_1453 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1453 ?AUTO_1452 ) ( IN-TRUCK ?AUTO_1451 ?AUTO_1453 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1451 ?AUTO_1453 ?AUTO_1452 )
      ( DELIVER-PKG-VERIFY ?AUTO_1451 ?AUTO_1452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1464 - OBJ
      ?AUTO_1465 - LOCATION
    )
    :vars
    (
      ?AUTO_1467 - TRUCK
      ?AUTO_1468 - LOCATION
      ?AUTO_1466 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1467 ?AUTO_1468 ) ( IN-CITY ?AUTO_1468 ?AUTO_1466 ) ( IN-CITY ?AUTO_1465 ?AUTO_1466 ) ( not ( = ?AUTO_1465 ?AUTO_1468 ) ) ( OBJ-AT ?AUTO_1464 ?AUTO_1468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1464 ?AUTO_1467 ?AUTO_1468 )
      ( DELIVER-PKG ?AUTO_1464 ?AUTO_1465 )
      ( DELIVER-PKG-VERIFY ?AUTO_1464 ?AUTO_1465 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1473 - OBJ
      ?AUTO_1474 - LOCATION
    )
    :vars
    (
      ?AUTO_1477 - LOCATION
      ?AUTO_1475 - CITY
      ?AUTO_1476 - TRUCK
      ?AUTO_1478 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1477 ?AUTO_1475 ) ( IN-CITY ?AUTO_1474 ?AUTO_1475 ) ( not ( = ?AUTO_1474 ?AUTO_1477 ) ) ( OBJ-AT ?AUTO_1473 ?AUTO_1477 ) ( TRUCK-AT ?AUTO_1476 ?AUTO_1478 ) ( IN-CITY ?AUTO_1478 ?AUTO_1475 ) ( not ( = ?AUTO_1477 ?AUTO_1478 ) ) ( not ( = ?AUTO_1474 ?AUTO_1478 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1476 ?AUTO_1478 ?AUTO_1477 ?AUTO_1475 )
      ( DELIVER-PKG ?AUTO_1473 ?AUTO_1474 )
      ( DELIVER-PKG-VERIFY ?AUTO_1473 ?AUTO_1474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1485 - OBJ
      ?AUTO_1486 - LOCATION
    )
    :vars
    (
      ?AUTO_1487 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1485 ?AUTO_1487 ) ( AIRPLANE-AT ?AUTO_1487 ?AUTO_1486 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1485 ?AUTO_1487 ?AUTO_1486 )
      ( DELIVER-PKG-VERIFY ?AUTO_1485 ?AUTO_1486 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1488 - OBJ
      ?AUTO_1489 - LOCATION
    )
    :vars
    (
      ?AUTO_1490 - AIRPLANE
      ?AUTO_1491 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1488 ?AUTO_1490 ) ( AIRPORT ?AUTO_1491 ) ( AIRPORT ?AUTO_1489 ) ( AIRPLANE-AT ?AUTO_1490 ?AUTO_1491 ) ( not ( = ?AUTO_1491 ?AUTO_1489 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1490 ?AUTO_1491 ?AUTO_1489 )
      ( DELIVER-PKG ?AUTO_1488 ?AUTO_1489 )
      ( DELIVER-PKG-VERIFY ?AUTO_1488 ?AUTO_1489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1496 - OBJ
      ?AUTO_1497 - LOCATION
    )
    :vars
    (
      ?AUTO_1498 - LOCATION
      ?AUTO_1499 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1498 ) ( AIRPORT ?AUTO_1497 ) ( AIRPLANE-AT ?AUTO_1499 ?AUTO_1498 ) ( not ( = ?AUTO_1498 ?AUTO_1497 ) ) ( OBJ-AT ?AUTO_1496 ?AUTO_1498 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1496 ?AUTO_1499 ?AUTO_1498 )
      ( DELIVER-PKG ?AUTO_1496 ?AUTO_1497 )
      ( DELIVER-PKG-VERIFY ?AUTO_1496 ?AUTO_1497 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1500 - OBJ
      ?AUTO_1501 - LOCATION
    )
    :vars
    (
      ?AUTO_1502 - LOCATION
      ?AUTO_1504 - LOCATION
      ?AUTO_1503 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1502 ) ( AIRPORT ?AUTO_1501 ) ( not ( = ?AUTO_1502 ?AUTO_1501 ) ) ( OBJ-AT ?AUTO_1500 ?AUTO_1502 ) ( AIRPORT ?AUTO_1504 ) ( AIRPLANE-AT ?AUTO_1503 ?AUTO_1504 ) ( not ( = ?AUTO_1504 ?AUTO_1502 ) ) ( not ( = ?AUTO_1501 ?AUTO_1504 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1503 ?AUTO_1504 ?AUTO_1502 )
      ( DELIVER-PKG ?AUTO_1500 ?AUTO_1501 )
      ( DELIVER-PKG-VERIFY ?AUTO_1500 ?AUTO_1501 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1521 - OBJ
      ?AUTO_1522 - LOCATION
    )
    :vars
    (
      ?AUTO_1525 - LOCATION
      ?AUTO_1524 - LOCATION
      ?AUTO_1523 - AIRPLANE
      ?AUTO_1526 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1525 ) ( AIRPORT ?AUTO_1522 ) ( not ( = ?AUTO_1525 ?AUTO_1522 ) ) ( AIRPORT ?AUTO_1524 ) ( AIRPLANE-AT ?AUTO_1523 ?AUTO_1524 ) ( not ( = ?AUTO_1524 ?AUTO_1525 ) ) ( not ( = ?AUTO_1522 ?AUTO_1524 ) ) ( TRUCK-AT ?AUTO_1526 ?AUTO_1525 ) ( IN-TRUCK ?AUTO_1521 ?AUTO_1526 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1521 ?AUTO_1526 ?AUTO_1525 )
      ( DELIVER-PKG ?AUTO_1521 ?AUTO_1522 )
      ( DELIVER-PKG-VERIFY ?AUTO_1521 ?AUTO_1522 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1527 - OBJ
      ?AUTO_1528 - LOCATION
    )
    :vars
    (
      ?AUTO_1531 - LOCATION
      ?AUTO_1529 - LOCATION
      ?AUTO_1530 - AIRPLANE
      ?AUTO_1532 - TRUCK
      ?AUTO_1533 - LOCATION
      ?AUTO_1534 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1531 ) ( AIRPORT ?AUTO_1528 ) ( not ( = ?AUTO_1531 ?AUTO_1528 ) ) ( AIRPORT ?AUTO_1529 ) ( AIRPLANE-AT ?AUTO_1530 ?AUTO_1529 ) ( not ( = ?AUTO_1529 ?AUTO_1531 ) ) ( not ( = ?AUTO_1528 ?AUTO_1529 ) ) ( IN-TRUCK ?AUTO_1527 ?AUTO_1532 ) ( TRUCK-AT ?AUTO_1532 ?AUTO_1533 ) ( IN-CITY ?AUTO_1533 ?AUTO_1534 ) ( IN-CITY ?AUTO_1531 ?AUTO_1534 ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( not ( = ?AUTO_1528 ?AUTO_1533 ) ) ( not ( = ?AUTO_1529 ?AUTO_1533 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1532 ?AUTO_1533 ?AUTO_1531 ?AUTO_1534 )
      ( DELIVER-PKG ?AUTO_1527 ?AUTO_1528 )
      ( DELIVER-PKG-VERIFY ?AUTO_1527 ?AUTO_1528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1545 - OBJ
      ?AUTO_1546 - LOCATION
    )
    :vars
    (
      ?AUTO_1548 - LOCATION
      ?AUTO_1549 - LOCATION
      ?AUTO_1547 - AIRPLANE
      ?AUTO_1550 - TRUCK
      ?AUTO_1552 - LOCATION
      ?AUTO_1551 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1548 ) ( AIRPORT ?AUTO_1546 ) ( not ( = ?AUTO_1548 ?AUTO_1546 ) ) ( AIRPORT ?AUTO_1549 ) ( AIRPLANE-AT ?AUTO_1547 ?AUTO_1549 ) ( not ( = ?AUTO_1549 ?AUTO_1548 ) ) ( not ( = ?AUTO_1546 ?AUTO_1549 ) ) ( TRUCK-AT ?AUTO_1550 ?AUTO_1552 ) ( IN-CITY ?AUTO_1552 ?AUTO_1551 ) ( IN-CITY ?AUTO_1548 ?AUTO_1551 ) ( not ( = ?AUTO_1548 ?AUTO_1552 ) ) ( not ( = ?AUTO_1546 ?AUTO_1552 ) ) ( not ( = ?AUTO_1549 ?AUTO_1552 ) ) ( OBJ-AT ?AUTO_1545 ?AUTO_1552 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1545 ?AUTO_1550 ?AUTO_1552 )
      ( DELIVER-PKG ?AUTO_1545 ?AUTO_1546 )
      ( DELIVER-PKG-VERIFY ?AUTO_1545 ?AUTO_1546 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1555 - OBJ
      ?AUTO_1556 - LOCATION
    )
    :vars
    (
      ?AUTO_1557 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1555 ?AUTO_1557 ) ( AIRPLANE-AT ?AUTO_1557 ?AUTO_1556 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1555 ?AUTO_1557 ?AUTO_1556 )
      ( DELIVER-PKG-VERIFY ?AUTO_1555 ?AUTO_1556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1564 - OBJ
      ?AUTO_1565 - LOCATION
    )
    :vars
    (
      ?AUTO_1567 - LOCATION
      ?AUTO_1566 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1567 ) ( AIRPORT ?AUTO_1565 ) ( AIRPLANE-AT ?AUTO_1566 ?AUTO_1567 ) ( not ( = ?AUTO_1567 ?AUTO_1565 ) ) ( OBJ-AT ?AUTO_1564 ?AUTO_1567 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1564 ?AUTO_1566 ?AUTO_1567 )
      ( DELIVER-PKG ?AUTO_1564 ?AUTO_1565 )
      ( DELIVER-PKG-VERIFY ?AUTO_1564 ?AUTO_1565 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1586 - OBJ
      ?AUTO_1587 - LOCATION
    )
    :vars
    (
      ?AUTO_1590 - LOCATION
      ?AUTO_1589 - LOCATION
      ?AUTO_1588 - AIRPLANE
      ?AUTO_1591 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1590 ) ( AIRPORT ?AUTO_1587 ) ( not ( = ?AUTO_1590 ?AUTO_1587 ) ) ( AIRPORT ?AUTO_1589 ) ( AIRPLANE-AT ?AUTO_1588 ?AUTO_1589 ) ( not ( = ?AUTO_1589 ?AUTO_1590 ) ) ( not ( = ?AUTO_1587 ?AUTO_1589 ) ) ( TRUCK-AT ?AUTO_1591 ?AUTO_1590 ) ( IN-TRUCK ?AUTO_1586 ?AUTO_1591 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1586 ?AUTO_1591 ?AUTO_1590 )
      ( DELIVER-PKG ?AUTO_1586 ?AUTO_1587 )
      ( DELIVER-PKG-VERIFY ?AUTO_1586 ?AUTO_1587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1604 - OBJ
      ?AUTO_1605 - LOCATION
    )
    :vars
    (
      ?AUTO_1608 - LOCATION
      ?AUTO_1610 - LOCATION
      ?AUTO_1607 - AIRPLANE
      ?AUTO_1609 - TRUCK
      ?AUTO_1611 - LOCATION
      ?AUTO_1606 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1608 ) ( AIRPORT ?AUTO_1605 ) ( not ( = ?AUTO_1608 ?AUTO_1605 ) ) ( AIRPORT ?AUTO_1610 ) ( AIRPLANE-AT ?AUTO_1607 ?AUTO_1610 ) ( not ( = ?AUTO_1610 ?AUTO_1608 ) ) ( not ( = ?AUTO_1605 ?AUTO_1610 ) ) ( TRUCK-AT ?AUTO_1609 ?AUTO_1611 ) ( IN-CITY ?AUTO_1611 ?AUTO_1606 ) ( IN-CITY ?AUTO_1608 ?AUTO_1606 ) ( not ( = ?AUTO_1608 ?AUTO_1611 ) ) ( not ( = ?AUTO_1605 ?AUTO_1611 ) ) ( not ( = ?AUTO_1610 ?AUTO_1611 ) ) ( OBJ-AT ?AUTO_1604 ?AUTO_1611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1604 ?AUTO_1609 ?AUTO_1611 )
      ( DELIVER-PKG ?AUTO_1604 ?AUTO_1605 )
      ( DELIVER-PKG-VERIFY ?AUTO_1604 ?AUTO_1605 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1616 - OBJ
      ?AUTO_1617 - LOCATION
    )
    :vars
    (
      ?AUTO_1618 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1618 ?AUTO_1617 ) ( IN-TRUCK ?AUTO_1616 ?AUTO_1618 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1616 ?AUTO_1618 ?AUTO_1617 )
      ( DELIVER-PKG-VERIFY ?AUTO_1616 ?AUTO_1617 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1637 - OBJ
      ?AUTO_1638 - LOCATION
    )
    :vars
    (
      ?AUTO_1639 - TRUCK
      ?AUTO_1640 - LOCATION
      ?AUTO_1641 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1637 ?AUTO_1639 ) ( TRUCK-AT ?AUTO_1639 ?AUTO_1640 ) ( IN-CITY ?AUTO_1640 ?AUTO_1641 ) ( IN-CITY ?AUTO_1638 ?AUTO_1641 ) ( not ( = ?AUTO_1638 ?AUTO_1640 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1639 ?AUTO_1640 ?AUTO_1638 ?AUTO_1641 )
      ( DELIVER-PKG ?AUTO_1637 ?AUTO_1638 )
      ( DELIVER-PKG-VERIFY ?AUTO_1637 ?AUTO_1638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1642 - OBJ
      ?AUTO_1643 - LOCATION
    )
    :vars
    (
      ?AUTO_1644 - TRUCK
      ?AUTO_1645 - LOCATION
      ?AUTO_1646 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1644 ?AUTO_1645 ) ( IN-CITY ?AUTO_1645 ?AUTO_1646 ) ( IN-CITY ?AUTO_1643 ?AUTO_1646 ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( OBJ-AT ?AUTO_1642 ?AUTO_1645 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1642 ?AUTO_1644 ?AUTO_1645 )
      ( DELIVER-PKG ?AUTO_1642 ?AUTO_1643 )
      ( DELIVER-PKG-VERIFY ?AUTO_1642 ?AUTO_1643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1649 - OBJ
      ?AUTO_1650 - LOCATION
    )
    :vars
    (
      ?AUTO_1653 - LOCATION
      ?AUTO_1652 - CITY
      ?AUTO_1651 - TRUCK
      ?AUTO_1654 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1653 ?AUTO_1652 ) ( IN-CITY ?AUTO_1650 ?AUTO_1652 ) ( not ( = ?AUTO_1650 ?AUTO_1653 ) ) ( OBJ-AT ?AUTO_1649 ?AUTO_1653 ) ( TRUCK-AT ?AUTO_1651 ?AUTO_1654 ) ( IN-CITY ?AUTO_1654 ?AUTO_1652 ) ( not ( = ?AUTO_1653 ?AUTO_1654 ) ) ( not ( = ?AUTO_1650 ?AUTO_1654 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1651 ?AUTO_1654 ?AUTO_1653 ?AUTO_1652 )
      ( DELIVER-PKG ?AUTO_1649 ?AUTO_1650 )
      ( DELIVER-PKG-VERIFY ?AUTO_1649 ?AUTO_1650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1677 - OBJ
      ?AUTO_1678 - LOCATION
    )
    :vars
    (
      ?AUTO_1679 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1677 ?AUTO_1679 ) ( AIRPLANE-AT ?AUTO_1679 ?AUTO_1678 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1677 ?AUTO_1679 ?AUTO_1678 )
      ( DELIVER-PKG-VERIFY ?AUTO_1677 ?AUTO_1678 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1708 - OBJ
      ?AUTO_1709 - LOCATION
    )
    :vars
    (
      ?AUTO_1711 - LOCATION
      ?AUTO_1710 - AIRPLANE
      ?AUTO_1712 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1711 ) ( AIRPORT ?AUTO_1709 ) ( AIRPLANE-AT ?AUTO_1710 ?AUTO_1711 ) ( not ( = ?AUTO_1711 ?AUTO_1709 ) ) ( TRUCK-AT ?AUTO_1712 ?AUTO_1711 ) ( IN-TRUCK ?AUTO_1708 ?AUTO_1712 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1708 ?AUTO_1712 ?AUTO_1711 )
      ( DELIVER-PKG ?AUTO_1708 ?AUTO_1709 )
      ( DELIVER-PKG-VERIFY ?AUTO_1708 ?AUTO_1709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1723 - OBJ
      ?AUTO_1724 - LOCATION
    )
    :vars
    (
      ?AUTO_1730 - LOCATION
      ?AUTO_1727 - LOCATION
      ?AUTO_1729 - AIRPLANE
      ?AUTO_1726 - TRUCK
      ?AUTO_1725 - LOCATION
      ?AUTO_1728 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1730 ) ( AIRPORT ?AUTO_1724 ) ( not ( = ?AUTO_1730 ?AUTO_1724 ) ) ( AIRPORT ?AUTO_1727 ) ( AIRPLANE-AT ?AUTO_1729 ?AUTO_1727 ) ( not ( = ?AUTO_1727 ?AUTO_1730 ) ) ( not ( = ?AUTO_1724 ?AUTO_1727 ) ) ( TRUCK-AT ?AUTO_1726 ?AUTO_1725 ) ( IN-CITY ?AUTO_1725 ?AUTO_1728 ) ( IN-CITY ?AUTO_1730 ?AUTO_1728 ) ( not ( = ?AUTO_1730 ?AUTO_1725 ) ) ( not ( = ?AUTO_1724 ?AUTO_1725 ) ) ( not ( = ?AUTO_1727 ?AUTO_1725 ) ) ( OBJ-AT ?AUTO_1723 ?AUTO_1725 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1723 ?AUTO_1726 ?AUTO_1725 )
      ( DELIVER-PKG ?AUTO_1723 ?AUTO_1724 )
      ( DELIVER-PKG-VERIFY ?AUTO_1723 ?AUTO_1724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1739 - OBJ
      ?AUTO_1740 - LOCATION
    )
    :vars
    (
      ?AUTO_1741 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1739 ?AUTO_1741 ) ( AIRPLANE-AT ?AUTO_1741 ?AUTO_1740 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1739 ?AUTO_1741 ?AUTO_1740 )
      ( DELIVER-PKG-VERIFY ?AUTO_1739 ?AUTO_1740 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1742 - OBJ
      ?AUTO_1743 - LOCATION
    )
    :vars
    (
      ?AUTO_1744 - AIRPLANE
      ?AUTO_1745 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1742 ?AUTO_1744 ) ( AIRPORT ?AUTO_1745 ) ( AIRPORT ?AUTO_1743 ) ( AIRPLANE-AT ?AUTO_1744 ?AUTO_1745 ) ( not ( = ?AUTO_1745 ?AUTO_1743 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1744 ?AUTO_1745 ?AUTO_1743 )
      ( DELIVER-PKG ?AUTO_1742 ?AUTO_1743 )
      ( DELIVER-PKG-VERIFY ?AUTO_1742 ?AUTO_1743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1756 - OBJ
      ?AUTO_1757 - LOCATION
    )
    :vars
    (
      ?AUTO_1759 - LOCATION
      ?AUTO_1758 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1759 ) ( AIRPORT ?AUTO_1757 ) ( AIRPLANE-AT ?AUTO_1758 ?AUTO_1759 ) ( not ( = ?AUTO_1759 ?AUTO_1757 ) ) ( OBJ-AT ?AUTO_1756 ?AUTO_1759 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1756 ?AUTO_1758 ?AUTO_1759 )
      ( DELIVER-PKG ?AUTO_1756 ?AUTO_1757 )
      ( DELIVER-PKG-VERIFY ?AUTO_1756 ?AUTO_1757 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1774 - OBJ
      ?AUTO_1775 - LOCATION
    )
    :vars
    (
      ?AUTO_1776 - LOCATION
      ?AUTO_1777 - LOCATION
      ?AUTO_1778 - AIRPLANE
      ?AUTO_1779 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1776 ) ( AIRPORT ?AUTO_1775 ) ( not ( = ?AUTO_1776 ?AUTO_1775 ) ) ( AIRPORT ?AUTO_1777 ) ( AIRPLANE-AT ?AUTO_1778 ?AUTO_1777 ) ( not ( = ?AUTO_1777 ?AUTO_1776 ) ) ( not ( = ?AUTO_1775 ?AUTO_1777 ) ) ( TRUCK-AT ?AUTO_1779 ?AUTO_1776 ) ( IN-TRUCK ?AUTO_1774 ?AUTO_1779 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1774 ?AUTO_1779 ?AUTO_1776 )
      ( DELIVER-PKG ?AUTO_1774 ?AUTO_1775 )
      ( DELIVER-PKG-VERIFY ?AUTO_1774 ?AUTO_1775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1790 - OBJ
      ?AUTO_1791 - LOCATION
    )
    :vars
    (
      ?AUTO_1793 - LOCATION
      ?AUTO_1794 - LOCATION
      ?AUTO_1795 - AIRPLANE
      ?AUTO_1796 - TRUCK
      ?AUTO_1797 - LOCATION
      ?AUTO_1792 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1793 ) ( AIRPORT ?AUTO_1791 ) ( not ( = ?AUTO_1793 ?AUTO_1791 ) ) ( AIRPORT ?AUTO_1794 ) ( AIRPLANE-AT ?AUTO_1795 ?AUTO_1794 ) ( not ( = ?AUTO_1794 ?AUTO_1793 ) ) ( not ( = ?AUTO_1791 ?AUTO_1794 ) ) ( TRUCK-AT ?AUTO_1796 ?AUTO_1797 ) ( IN-CITY ?AUTO_1797 ?AUTO_1792 ) ( IN-CITY ?AUTO_1793 ?AUTO_1792 ) ( not ( = ?AUTO_1793 ?AUTO_1797 ) ) ( not ( = ?AUTO_1791 ?AUTO_1797 ) ) ( not ( = ?AUTO_1794 ?AUTO_1797 ) ) ( OBJ-AT ?AUTO_1790 ?AUTO_1797 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1790 ?AUTO_1796 ?AUTO_1797 )
      ( DELIVER-PKG ?AUTO_1790 ?AUTO_1791 )
      ( DELIVER-PKG-VERIFY ?AUTO_1790 ?AUTO_1791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1802 - OBJ
      ?AUTO_1803 - LOCATION
    )
    :vars
    (
      ?AUTO_1809 - LOCATION
      ?AUTO_1804 - LOCATION
      ?AUTO_1807 - AIRPLANE
      ?AUTO_1808 - LOCATION
      ?AUTO_1805 - CITY
      ?AUTO_1806 - TRUCK
      ?AUTO_1810 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1809 ) ( AIRPORT ?AUTO_1803 ) ( not ( = ?AUTO_1809 ?AUTO_1803 ) ) ( AIRPORT ?AUTO_1804 ) ( AIRPLANE-AT ?AUTO_1807 ?AUTO_1804 ) ( not ( = ?AUTO_1804 ?AUTO_1809 ) ) ( not ( = ?AUTO_1803 ?AUTO_1804 ) ) ( IN-CITY ?AUTO_1808 ?AUTO_1805 ) ( IN-CITY ?AUTO_1809 ?AUTO_1805 ) ( not ( = ?AUTO_1809 ?AUTO_1808 ) ) ( not ( = ?AUTO_1803 ?AUTO_1808 ) ) ( not ( = ?AUTO_1804 ?AUTO_1808 ) ) ( OBJ-AT ?AUTO_1802 ?AUTO_1808 ) ( TRUCK-AT ?AUTO_1806 ?AUTO_1810 ) ( IN-CITY ?AUTO_1810 ?AUTO_1805 ) ( not ( = ?AUTO_1808 ?AUTO_1810 ) ) ( not ( = ?AUTO_1803 ?AUTO_1810 ) ) ( not ( = ?AUTO_1809 ?AUTO_1810 ) ) ( not ( = ?AUTO_1804 ?AUTO_1810 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1806 ?AUTO_1810 ?AUTO_1808 ?AUTO_1805 )
      ( DELIVER-PKG ?AUTO_1802 ?AUTO_1803 )
      ( DELIVER-PKG-VERIFY ?AUTO_1802 ?AUTO_1803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1817 - OBJ
      ?AUTO_1818 - LOCATION
    )
    :vars
    (
      ?AUTO_1819 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1819 ?AUTO_1818 ) ( IN-TRUCK ?AUTO_1817 ?AUTO_1819 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1817 ?AUTO_1819 ?AUTO_1818 )
      ( DELIVER-PKG-VERIFY ?AUTO_1817 ?AUTO_1818 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1820 - OBJ
      ?AUTO_1821 - LOCATION
    )
    :vars
    (
      ?AUTO_1822 - TRUCK
      ?AUTO_1823 - LOCATION
      ?AUTO_1824 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1820 ?AUTO_1822 ) ( TRUCK-AT ?AUTO_1822 ?AUTO_1823 ) ( IN-CITY ?AUTO_1823 ?AUTO_1824 ) ( IN-CITY ?AUTO_1821 ?AUTO_1824 ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1822 ?AUTO_1823 ?AUTO_1821 ?AUTO_1824 )
      ( DELIVER-PKG ?AUTO_1820 ?AUTO_1821 )
      ( DELIVER-PKG-VERIFY ?AUTO_1820 ?AUTO_1821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1827 - OBJ
      ?AUTO_1828 - LOCATION
    )
    :vars
    (
      ?AUTO_1829 - TRUCK
      ?AUTO_1831 - LOCATION
      ?AUTO_1830 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1829 ?AUTO_1831 ) ( IN-CITY ?AUTO_1831 ?AUTO_1830 ) ( IN-CITY ?AUTO_1828 ?AUTO_1830 ) ( not ( = ?AUTO_1828 ?AUTO_1831 ) ) ( OBJ-AT ?AUTO_1827 ?AUTO_1831 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1827 ?AUTO_1829 ?AUTO_1831 )
      ( DELIVER-PKG ?AUTO_1827 ?AUTO_1828 )
      ( DELIVER-PKG-VERIFY ?AUTO_1827 ?AUTO_1828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1832 - OBJ
      ?AUTO_1833 - LOCATION
    )
    :vars
    (
      ?AUTO_1835 - LOCATION
      ?AUTO_1836 - CITY
      ?AUTO_1834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1835 ?AUTO_1836 ) ( IN-CITY ?AUTO_1833 ?AUTO_1836 ) ( not ( = ?AUTO_1833 ?AUTO_1835 ) ) ( OBJ-AT ?AUTO_1832 ?AUTO_1835 ) ( TRUCK-AT ?AUTO_1834 ?AUTO_1833 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1834 ?AUTO_1833 ?AUTO_1835 ?AUTO_1836 )
      ( DELIVER-PKG ?AUTO_1832 ?AUTO_1833 )
      ( DELIVER-PKG-VERIFY ?AUTO_1832 ?AUTO_1833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1893 - OBJ
      ?AUTO_1894 - LOCATION
    )
    :vars
    (
      ?AUTO_1895 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1895 ?AUTO_1894 ) ( IN-TRUCK ?AUTO_1893 ?AUTO_1895 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1893 ?AUTO_1895 ?AUTO_1894 )
      ( DELIVER-PKG-VERIFY ?AUTO_1893 ?AUTO_1894 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1900 - OBJ
      ?AUTO_1901 - LOCATION
    )
    :vars
    (
      ?AUTO_1903 - TRUCK
      ?AUTO_1902 - LOCATION
      ?AUTO_1904 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1903 ?AUTO_1902 ) ( IN-CITY ?AUTO_1902 ?AUTO_1904 ) ( IN-CITY ?AUTO_1901 ?AUTO_1904 ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) ( OBJ-AT ?AUTO_1900 ?AUTO_1902 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1900 ?AUTO_1903 ?AUTO_1902 )
      ( DELIVER-PKG ?AUTO_1900 ?AUTO_1901 )
      ( DELIVER-PKG-VERIFY ?AUTO_1900 ?AUTO_1901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1965 - OBJ
      ?AUTO_1966 - LOCATION
    )
    :vars
    (
      ?AUTO_1967 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1965 ?AUTO_1967 ) ( AIRPLANE-AT ?AUTO_1967 ?AUTO_1966 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1965 ?AUTO_1967 ?AUTO_1966 )
      ( DELIVER-PKG-VERIFY ?AUTO_1965 ?AUTO_1966 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1968 - OBJ
      ?AUTO_1969 - LOCATION
    )
    :vars
    (
      ?AUTO_1970 - AIRPLANE
      ?AUTO_1971 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1968 ?AUTO_1970 ) ( AIRPORT ?AUTO_1971 ) ( AIRPORT ?AUTO_1969 ) ( AIRPLANE-AT ?AUTO_1970 ?AUTO_1971 ) ( not ( = ?AUTO_1971 ?AUTO_1969 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1970 ?AUTO_1971 ?AUTO_1969 )
      ( DELIVER-PKG ?AUTO_1968 ?AUTO_1969 )
      ( DELIVER-PKG-VERIFY ?AUTO_1968 ?AUTO_1969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1974 - OBJ
      ?AUTO_1975 - LOCATION
    )
    :vars
    (
      ?AUTO_1977 - LOCATION
      ?AUTO_1976 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1977 ) ( AIRPORT ?AUTO_1975 ) ( AIRPLANE-AT ?AUTO_1976 ?AUTO_1977 ) ( not ( = ?AUTO_1977 ?AUTO_1975 ) ) ( OBJ-AT ?AUTO_1974 ?AUTO_1977 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1974 ?AUTO_1976 ?AUTO_1977 )
      ( DELIVER-PKG ?AUTO_1974 ?AUTO_1975 )
      ( DELIVER-PKG-VERIFY ?AUTO_1974 ?AUTO_1975 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1980 - OBJ
      ?AUTO_1981 - LOCATION
    )
    :vars
    (
      ?AUTO_1982 - LOCATION
      ?AUTO_1983 - AIRPLANE
      ?AUTO_1984 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1982 ) ( AIRPORT ?AUTO_1981 ) ( AIRPLANE-AT ?AUTO_1983 ?AUTO_1982 ) ( not ( = ?AUTO_1982 ?AUTO_1981 ) ) ( TRUCK-AT ?AUTO_1984 ?AUTO_1982 ) ( IN-TRUCK ?AUTO_1980 ?AUTO_1984 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1980 ?AUTO_1984 ?AUTO_1982 )
      ( DELIVER-PKG ?AUTO_1980 ?AUTO_1981 )
      ( DELIVER-PKG-VERIFY ?AUTO_1980 ?AUTO_1981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1985 - OBJ
      ?AUTO_1986 - LOCATION
    )
    :vars
    (
      ?AUTO_1988 - LOCATION
      ?AUTO_1987 - AIRPLANE
      ?AUTO_1989 - TRUCK
      ?AUTO_1990 - LOCATION
      ?AUTO_1991 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1988 ) ( AIRPORT ?AUTO_1986 ) ( AIRPLANE-AT ?AUTO_1987 ?AUTO_1988 ) ( not ( = ?AUTO_1988 ?AUTO_1986 ) ) ( IN-TRUCK ?AUTO_1985 ?AUTO_1989 ) ( TRUCK-AT ?AUTO_1989 ?AUTO_1990 ) ( IN-CITY ?AUTO_1990 ?AUTO_1991 ) ( IN-CITY ?AUTO_1988 ?AUTO_1991 ) ( not ( = ?AUTO_1988 ?AUTO_1990 ) ) ( not ( = ?AUTO_1986 ?AUTO_1990 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1989 ?AUTO_1990 ?AUTO_1988 ?AUTO_1991 )
      ( DELIVER-PKG ?AUTO_1985 ?AUTO_1986 )
      ( DELIVER-PKG-VERIFY ?AUTO_1985 ?AUTO_1986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1994 - OBJ
      ?AUTO_1995 - LOCATION
    )
    :vars
    (
      ?AUTO_2000 - LOCATION
      ?AUTO_1999 - AIRPLANE
      ?AUTO_1997 - TRUCK
      ?AUTO_1996 - LOCATION
      ?AUTO_1998 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2000 ) ( AIRPORT ?AUTO_1995 ) ( AIRPLANE-AT ?AUTO_1999 ?AUTO_2000 ) ( not ( = ?AUTO_2000 ?AUTO_1995 ) ) ( TRUCK-AT ?AUTO_1997 ?AUTO_1996 ) ( IN-CITY ?AUTO_1996 ?AUTO_1998 ) ( IN-CITY ?AUTO_2000 ?AUTO_1998 ) ( not ( = ?AUTO_2000 ?AUTO_1996 ) ) ( not ( = ?AUTO_1995 ?AUTO_1996 ) ) ( OBJ-AT ?AUTO_1994 ?AUTO_1996 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1994 ?AUTO_1997 ?AUTO_1996 )
      ( DELIVER-PKG ?AUTO_1994 ?AUTO_1995 )
      ( DELIVER-PKG-VERIFY ?AUTO_1994 ?AUTO_1995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2001 - OBJ
      ?AUTO_2002 - LOCATION
    )
    :vars
    (
      ?AUTO_2006 - LOCATION
      ?AUTO_2005 - AIRPLANE
      ?AUTO_2003 - LOCATION
      ?AUTO_2007 - CITY
      ?AUTO_2004 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2006 ) ( AIRPORT ?AUTO_2002 ) ( AIRPLANE-AT ?AUTO_2005 ?AUTO_2006 ) ( not ( = ?AUTO_2006 ?AUTO_2002 ) ) ( IN-CITY ?AUTO_2003 ?AUTO_2007 ) ( IN-CITY ?AUTO_2006 ?AUTO_2007 ) ( not ( = ?AUTO_2006 ?AUTO_2003 ) ) ( not ( = ?AUTO_2002 ?AUTO_2003 ) ) ( OBJ-AT ?AUTO_2001 ?AUTO_2003 ) ( TRUCK-AT ?AUTO_2004 ?AUTO_2006 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2004 ?AUTO_2006 ?AUTO_2003 ?AUTO_2007 )
      ( DELIVER-PKG ?AUTO_2001 ?AUTO_2002 )
      ( DELIVER-PKG-VERIFY ?AUTO_2001 ?AUTO_2002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2010 - OBJ
      ?AUTO_2011 - LOCATION
    )
    :vars
    (
      ?AUTO_2016 - LOCATION
      ?AUTO_2012 - LOCATION
      ?AUTO_2014 - CITY
      ?AUTO_2013 - TRUCK
      ?AUTO_2017 - LOCATION
      ?AUTO_2015 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2016 ) ( AIRPORT ?AUTO_2011 ) ( not ( = ?AUTO_2016 ?AUTO_2011 ) ) ( IN-CITY ?AUTO_2012 ?AUTO_2014 ) ( IN-CITY ?AUTO_2016 ?AUTO_2014 ) ( not ( = ?AUTO_2016 ?AUTO_2012 ) ) ( not ( = ?AUTO_2011 ?AUTO_2012 ) ) ( OBJ-AT ?AUTO_2010 ?AUTO_2012 ) ( TRUCK-AT ?AUTO_2013 ?AUTO_2016 ) ( AIRPORT ?AUTO_2017 ) ( AIRPLANE-AT ?AUTO_2015 ?AUTO_2017 ) ( not ( = ?AUTO_2017 ?AUTO_2016 ) ) ( not ( = ?AUTO_2011 ?AUTO_2017 ) ) ( not ( = ?AUTO_2012 ?AUTO_2017 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2015 ?AUTO_2017 ?AUTO_2016 )
      ( DELIVER-PKG ?AUTO_2010 ?AUTO_2011 )
      ( DELIVER-PKG-VERIFY ?AUTO_2010 ?AUTO_2011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2070 - OBJ
      ?AUTO_2071 - LOCATION
    )
    :vars
    (
      ?AUTO_2072 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2070 ?AUTO_2072 ) ( AIRPLANE-AT ?AUTO_2072 ?AUTO_2071 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2070 ?AUTO_2072 ?AUTO_2071 )
      ( DELIVER-PKG-VERIFY ?AUTO_2070 ?AUTO_2071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2077 - OBJ
      ?AUTO_2078 - LOCATION
    )
    :vars
    (
      ?AUTO_2079 - LOCATION
      ?AUTO_2080 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2079 ) ( AIRPORT ?AUTO_2078 ) ( AIRPLANE-AT ?AUTO_2080 ?AUTO_2079 ) ( not ( = ?AUTO_2079 ?AUTO_2078 ) ) ( OBJ-AT ?AUTO_2077 ?AUTO_2079 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2077 ?AUTO_2080 ?AUTO_2079 )
      ( DELIVER-PKG ?AUTO_2077 ?AUTO_2078 )
      ( DELIVER-PKG-VERIFY ?AUTO_2077 ?AUTO_2078 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2083 - OBJ
      ?AUTO_2084 - LOCATION
    )
    :vars
    (
      ?AUTO_2085 - LOCATION
      ?AUTO_2086 - AIRPLANE
      ?AUTO_2087 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2085 ) ( AIRPORT ?AUTO_2084 ) ( AIRPLANE-AT ?AUTO_2086 ?AUTO_2085 ) ( not ( = ?AUTO_2085 ?AUTO_2084 ) ) ( TRUCK-AT ?AUTO_2087 ?AUTO_2085 ) ( IN-TRUCK ?AUTO_2083 ?AUTO_2087 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2083 ?AUTO_2087 ?AUTO_2085 )
      ( DELIVER-PKG ?AUTO_2083 ?AUTO_2084 )
      ( DELIVER-PKG-VERIFY ?AUTO_2083 ?AUTO_2084 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2092 - OBJ
      ?AUTO_2093 - LOCATION
    )
    :vars
    (
      ?AUTO_2098 - LOCATION
      ?AUTO_2097 - AIRPLANE
      ?AUTO_2096 - TRUCK
      ?AUTO_2094 - LOCATION
      ?AUTO_2095 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2098 ) ( AIRPORT ?AUTO_2093 ) ( AIRPLANE-AT ?AUTO_2097 ?AUTO_2098 ) ( not ( = ?AUTO_2098 ?AUTO_2093 ) ) ( TRUCK-AT ?AUTO_2096 ?AUTO_2094 ) ( IN-CITY ?AUTO_2094 ?AUTO_2095 ) ( IN-CITY ?AUTO_2098 ?AUTO_2095 ) ( not ( = ?AUTO_2098 ?AUTO_2094 ) ) ( not ( = ?AUTO_2093 ?AUTO_2094 ) ) ( OBJ-AT ?AUTO_2092 ?AUTO_2094 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2092 ?AUTO_2096 ?AUTO_2094 )
      ( DELIVER-PKG ?AUTO_2092 ?AUTO_2093 )
      ( DELIVER-PKG-VERIFY ?AUTO_2092 ?AUTO_2093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2159 - OBJ
      ?AUTO_2160 - LOCATION
    )
    :vars
    (
      ?AUTO_2161 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2161 ?AUTO_2160 ) ( IN-TRUCK ?AUTO_2159 ?AUTO_2161 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2159 ?AUTO_2161 ?AUTO_2160 )
      ( DELIVER-PKG-VERIFY ?AUTO_2159 ?AUTO_2160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2162 - OBJ
      ?AUTO_2163 - LOCATION
    )
    :vars
    (
      ?AUTO_2164 - TRUCK
      ?AUTO_2165 - LOCATION
      ?AUTO_2166 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2162 ?AUTO_2164 ) ( TRUCK-AT ?AUTO_2164 ?AUTO_2165 ) ( IN-CITY ?AUTO_2165 ?AUTO_2166 ) ( IN-CITY ?AUTO_2163 ?AUTO_2166 ) ( not ( = ?AUTO_2163 ?AUTO_2165 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2164 ?AUTO_2165 ?AUTO_2163 ?AUTO_2166 )
      ( DELIVER-PKG ?AUTO_2162 ?AUTO_2163 )
      ( DELIVER-PKG-VERIFY ?AUTO_2162 ?AUTO_2163 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2169 - OBJ
      ?AUTO_2170 - LOCATION
    )
    :vars
    (
      ?AUTO_2173 - TRUCK
      ?AUTO_2172 - LOCATION
      ?AUTO_2171 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2173 ?AUTO_2172 ) ( IN-CITY ?AUTO_2172 ?AUTO_2171 ) ( IN-CITY ?AUTO_2170 ?AUTO_2171 ) ( not ( = ?AUTO_2170 ?AUTO_2172 ) ) ( OBJ-AT ?AUTO_2169 ?AUTO_2172 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2169 ?AUTO_2173 ?AUTO_2172 )
      ( DELIVER-PKG ?AUTO_2169 ?AUTO_2170 )
      ( DELIVER-PKG-VERIFY ?AUTO_2169 ?AUTO_2170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2174 - OBJ
      ?AUTO_2175 - LOCATION
    )
    :vars
    (
      ?AUTO_2178 - LOCATION
      ?AUTO_2176 - CITY
      ?AUTO_2177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2178 ?AUTO_2176 ) ( IN-CITY ?AUTO_2175 ?AUTO_2176 ) ( not ( = ?AUTO_2175 ?AUTO_2178 ) ) ( OBJ-AT ?AUTO_2174 ?AUTO_2178 ) ( TRUCK-AT ?AUTO_2177 ?AUTO_2175 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2177 ?AUTO_2175 ?AUTO_2178 ?AUTO_2176 )
      ( DELIVER-PKG ?AUTO_2174 ?AUTO_2175 )
      ( DELIVER-PKG-VERIFY ?AUTO_2174 ?AUTO_2175 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2211 - OBJ
      ?AUTO_2212 - LOCATION
    )
    :vars
    (
      ?AUTO_2213 - LOCATION
      ?AUTO_2215 - CITY
      ?AUTO_2214 - TRUCK
      ?AUTO_2216 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2213 ?AUTO_2215 ) ( IN-CITY ?AUTO_2212 ?AUTO_2215 ) ( not ( = ?AUTO_2212 ?AUTO_2213 ) ) ( TRUCK-AT ?AUTO_2214 ?AUTO_2212 ) ( IN-AIRPLANE ?AUTO_2211 ?AUTO_2216 ) ( AIRPLANE-AT ?AUTO_2216 ?AUTO_2213 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2211 ?AUTO_2216 ?AUTO_2213 )
      ( DELIVER-PKG ?AUTO_2211 ?AUTO_2212 )
      ( DELIVER-PKG-VERIFY ?AUTO_2211 ?AUTO_2212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2217 - OBJ
      ?AUTO_2218 - LOCATION
    )
    :vars
    (
      ?AUTO_2220 - LOCATION
      ?AUTO_2221 - CITY
      ?AUTO_2219 - TRUCK
      ?AUTO_2222 - AIRPLANE
      ?AUTO_2223 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2220 ?AUTO_2221 ) ( IN-CITY ?AUTO_2218 ?AUTO_2221 ) ( not ( = ?AUTO_2218 ?AUTO_2220 ) ) ( TRUCK-AT ?AUTO_2219 ?AUTO_2218 ) ( IN-AIRPLANE ?AUTO_2217 ?AUTO_2222 ) ( AIRPORT ?AUTO_2223 ) ( AIRPORT ?AUTO_2220 ) ( AIRPLANE-AT ?AUTO_2222 ?AUTO_2223 ) ( not ( = ?AUTO_2223 ?AUTO_2220 ) ) ( not ( = ?AUTO_2218 ?AUTO_2223 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2222 ?AUTO_2223 ?AUTO_2220 )
      ( DELIVER-PKG ?AUTO_2217 ?AUTO_2218 )
      ( DELIVER-PKG-VERIFY ?AUTO_2217 ?AUTO_2218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2228 - OBJ
      ?AUTO_2229 - LOCATION
    )
    :vars
    (
      ?AUTO_2230 - LOCATION
      ?AUTO_2234 - CITY
      ?AUTO_2232 - TRUCK
      ?AUTO_2233 - LOCATION
      ?AUTO_2231 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2230 ?AUTO_2234 ) ( IN-CITY ?AUTO_2229 ?AUTO_2234 ) ( not ( = ?AUTO_2229 ?AUTO_2230 ) ) ( TRUCK-AT ?AUTO_2232 ?AUTO_2229 ) ( AIRPORT ?AUTO_2233 ) ( AIRPORT ?AUTO_2230 ) ( AIRPLANE-AT ?AUTO_2231 ?AUTO_2233 ) ( not ( = ?AUTO_2233 ?AUTO_2230 ) ) ( not ( = ?AUTO_2229 ?AUTO_2233 ) ) ( OBJ-AT ?AUTO_2228 ?AUTO_2233 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2228 ?AUTO_2231 ?AUTO_2233 )
      ( DELIVER-PKG ?AUTO_2228 ?AUTO_2229 )
      ( DELIVER-PKG-VERIFY ?AUTO_2228 ?AUTO_2229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2235 - OBJ
      ?AUTO_2236 - LOCATION
    )
    :vars
    (
      ?AUTO_2238 - LOCATION
      ?AUTO_2240 - CITY
      ?AUTO_2239 - TRUCK
      ?AUTO_2241 - LOCATION
      ?AUTO_2242 - LOCATION
      ?AUTO_2237 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2238 ?AUTO_2240 ) ( IN-CITY ?AUTO_2236 ?AUTO_2240 ) ( not ( = ?AUTO_2236 ?AUTO_2238 ) ) ( TRUCK-AT ?AUTO_2239 ?AUTO_2236 ) ( AIRPORT ?AUTO_2241 ) ( AIRPORT ?AUTO_2238 ) ( not ( = ?AUTO_2241 ?AUTO_2238 ) ) ( not ( = ?AUTO_2236 ?AUTO_2241 ) ) ( OBJ-AT ?AUTO_2235 ?AUTO_2241 ) ( AIRPORT ?AUTO_2242 ) ( AIRPLANE-AT ?AUTO_2237 ?AUTO_2242 ) ( not ( = ?AUTO_2242 ?AUTO_2241 ) ) ( not ( = ?AUTO_2236 ?AUTO_2242 ) ) ( not ( = ?AUTO_2238 ?AUTO_2242 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2237 ?AUTO_2242 ?AUTO_2241 )
      ( DELIVER-PKG ?AUTO_2235 ?AUTO_2236 )
      ( DELIVER-PKG-VERIFY ?AUTO_2235 ?AUTO_2236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2259 - OBJ
      ?AUTO_2260 - LOCATION
    )
    :vars
    (
      ?AUTO_2265 - LOCATION
      ?AUTO_2261 - CITY
      ?AUTO_2262 - TRUCK
      ?AUTO_2263 - LOCATION
      ?AUTO_2264 - LOCATION
      ?AUTO_2266 - AIRPLANE
      ?AUTO_2267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2265 ?AUTO_2261 ) ( IN-CITY ?AUTO_2260 ?AUTO_2261 ) ( not ( = ?AUTO_2260 ?AUTO_2265 ) ) ( TRUCK-AT ?AUTO_2262 ?AUTO_2260 ) ( AIRPORT ?AUTO_2263 ) ( AIRPORT ?AUTO_2265 ) ( not ( = ?AUTO_2263 ?AUTO_2265 ) ) ( not ( = ?AUTO_2260 ?AUTO_2263 ) ) ( AIRPORT ?AUTO_2264 ) ( AIRPLANE-AT ?AUTO_2266 ?AUTO_2264 ) ( not ( = ?AUTO_2264 ?AUTO_2263 ) ) ( not ( = ?AUTO_2260 ?AUTO_2264 ) ) ( not ( = ?AUTO_2265 ?AUTO_2264 ) ) ( TRUCK-AT ?AUTO_2267 ?AUTO_2263 ) ( IN-TRUCK ?AUTO_2259 ?AUTO_2267 ) ( not ( = ?AUTO_2262 ?AUTO_2267 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2259 ?AUTO_2267 ?AUTO_2263 )
      ( DELIVER-PKG ?AUTO_2259 ?AUTO_2260 )
      ( DELIVER-PKG-VERIFY ?AUTO_2259 ?AUTO_2260 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2268 - OBJ
      ?AUTO_2269 - LOCATION
    )
    :vars
    (
      ?AUTO_2273 - LOCATION
      ?AUTO_2271 - CITY
      ?AUTO_2270 - TRUCK
      ?AUTO_2274 - LOCATION
      ?AUTO_2275 - LOCATION
      ?AUTO_2272 - AIRPLANE
      ?AUTO_2276 - TRUCK
      ?AUTO_2277 - LOCATION
      ?AUTO_2278 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2273 ?AUTO_2271 ) ( IN-CITY ?AUTO_2269 ?AUTO_2271 ) ( not ( = ?AUTO_2269 ?AUTO_2273 ) ) ( TRUCK-AT ?AUTO_2270 ?AUTO_2269 ) ( AIRPORT ?AUTO_2274 ) ( AIRPORT ?AUTO_2273 ) ( not ( = ?AUTO_2274 ?AUTO_2273 ) ) ( not ( = ?AUTO_2269 ?AUTO_2274 ) ) ( AIRPORT ?AUTO_2275 ) ( AIRPLANE-AT ?AUTO_2272 ?AUTO_2275 ) ( not ( = ?AUTO_2275 ?AUTO_2274 ) ) ( not ( = ?AUTO_2269 ?AUTO_2275 ) ) ( not ( = ?AUTO_2273 ?AUTO_2275 ) ) ( IN-TRUCK ?AUTO_2268 ?AUTO_2276 ) ( not ( = ?AUTO_2270 ?AUTO_2276 ) ) ( TRUCK-AT ?AUTO_2276 ?AUTO_2277 ) ( IN-CITY ?AUTO_2277 ?AUTO_2278 ) ( IN-CITY ?AUTO_2274 ?AUTO_2278 ) ( not ( = ?AUTO_2274 ?AUTO_2277 ) ) ( not ( = ?AUTO_2269 ?AUTO_2277 ) ) ( not ( = ?AUTO_2273 ?AUTO_2277 ) ) ( not ( = ?AUTO_2271 ?AUTO_2278 ) ) ( not ( = ?AUTO_2275 ?AUTO_2277 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2276 ?AUTO_2277 ?AUTO_2274 ?AUTO_2278 )
      ( DELIVER-PKG ?AUTO_2268 ?AUTO_2269 )
      ( DELIVER-PKG-VERIFY ?AUTO_2268 ?AUTO_2269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2289 - OBJ
      ?AUTO_2290 - LOCATION
    )
    :vars
    (
      ?AUTO_2297 - LOCATION
      ?AUTO_2296 - CITY
      ?AUTO_2298 - TRUCK
      ?AUTO_2295 - LOCATION
      ?AUTO_2299 - LOCATION
      ?AUTO_2294 - AIRPLANE
      ?AUTO_2293 - TRUCK
      ?AUTO_2292 - LOCATION
      ?AUTO_2291 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2297 ?AUTO_2296 ) ( IN-CITY ?AUTO_2290 ?AUTO_2296 ) ( not ( = ?AUTO_2290 ?AUTO_2297 ) ) ( TRUCK-AT ?AUTO_2298 ?AUTO_2290 ) ( AIRPORT ?AUTO_2295 ) ( AIRPORT ?AUTO_2297 ) ( not ( = ?AUTO_2295 ?AUTO_2297 ) ) ( not ( = ?AUTO_2290 ?AUTO_2295 ) ) ( AIRPORT ?AUTO_2299 ) ( AIRPLANE-AT ?AUTO_2294 ?AUTO_2299 ) ( not ( = ?AUTO_2299 ?AUTO_2295 ) ) ( not ( = ?AUTO_2290 ?AUTO_2299 ) ) ( not ( = ?AUTO_2297 ?AUTO_2299 ) ) ( not ( = ?AUTO_2298 ?AUTO_2293 ) ) ( TRUCK-AT ?AUTO_2293 ?AUTO_2292 ) ( IN-CITY ?AUTO_2292 ?AUTO_2291 ) ( IN-CITY ?AUTO_2295 ?AUTO_2291 ) ( not ( = ?AUTO_2295 ?AUTO_2292 ) ) ( not ( = ?AUTO_2290 ?AUTO_2292 ) ) ( not ( = ?AUTO_2297 ?AUTO_2292 ) ) ( not ( = ?AUTO_2296 ?AUTO_2291 ) ) ( not ( = ?AUTO_2299 ?AUTO_2292 ) ) ( OBJ-AT ?AUTO_2289 ?AUTO_2292 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2289 ?AUTO_2293 ?AUTO_2292 )
      ( DELIVER-PKG ?AUTO_2289 ?AUTO_2290 )
      ( DELIVER-PKG-VERIFY ?AUTO_2289 ?AUTO_2290 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2302 - OBJ
      ?AUTO_2303 - LOCATION
    )
    :vars
    (
      ?AUTO_2304 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2304 ?AUTO_2303 ) ( IN-TRUCK ?AUTO_2302 ?AUTO_2304 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2302 ?AUTO_2304 ?AUTO_2303 )
      ( DELIVER-PKG-VERIFY ?AUTO_2302 ?AUTO_2303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2309 - OBJ
      ?AUTO_2310 - LOCATION
    )
    :vars
    (
      ?AUTO_2313 - TRUCK
      ?AUTO_2311 - LOCATION
      ?AUTO_2312 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2313 ?AUTO_2311 ) ( IN-CITY ?AUTO_2311 ?AUTO_2312 ) ( IN-CITY ?AUTO_2310 ?AUTO_2312 ) ( not ( = ?AUTO_2310 ?AUTO_2311 ) ) ( OBJ-AT ?AUTO_2309 ?AUTO_2311 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2309 ?AUTO_2313 ?AUTO_2311 )
      ( DELIVER-PKG ?AUTO_2309 ?AUTO_2310 )
      ( DELIVER-PKG-VERIFY ?AUTO_2309 ?AUTO_2310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2348 - OBJ
      ?AUTO_2349 - LOCATION
    )
    :vars
    (
      ?AUTO_2352 - LOCATION
      ?AUTO_2350 - CITY
      ?AUTO_2351 - TRUCK
      ?AUTO_2353 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2352 ?AUTO_2350 ) ( IN-CITY ?AUTO_2349 ?AUTO_2350 ) ( not ( = ?AUTO_2349 ?AUTO_2352 ) ) ( TRUCK-AT ?AUTO_2351 ?AUTO_2349 ) ( IN-AIRPLANE ?AUTO_2348 ?AUTO_2353 ) ( AIRPLANE-AT ?AUTO_2353 ?AUTO_2352 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2348 ?AUTO_2353 ?AUTO_2352 )
      ( DELIVER-PKG ?AUTO_2348 ?AUTO_2349 )
      ( DELIVER-PKG-VERIFY ?AUTO_2348 ?AUTO_2349 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2360 - OBJ
      ?AUTO_2361 - LOCATION
    )
    :vars
    (
      ?AUTO_2366 - LOCATION
      ?AUTO_2363 - CITY
      ?AUTO_2362 - TRUCK
      ?AUTO_2365 - LOCATION
      ?AUTO_2364 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2366 ?AUTO_2363 ) ( IN-CITY ?AUTO_2361 ?AUTO_2363 ) ( not ( = ?AUTO_2361 ?AUTO_2366 ) ) ( TRUCK-AT ?AUTO_2362 ?AUTO_2361 ) ( AIRPORT ?AUTO_2365 ) ( AIRPORT ?AUTO_2366 ) ( AIRPLANE-AT ?AUTO_2364 ?AUTO_2365 ) ( not ( = ?AUTO_2365 ?AUTO_2366 ) ) ( not ( = ?AUTO_2361 ?AUTO_2365 ) ) ( OBJ-AT ?AUTO_2360 ?AUTO_2365 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2360 ?AUTO_2364 ?AUTO_2365 )
      ( DELIVER-PKG ?AUTO_2360 ?AUTO_2361 )
      ( DELIVER-PKG-VERIFY ?AUTO_2360 ?AUTO_2361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2385 - OBJ
      ?AUTO_2386 - LOCATION
    )
    :vars
    (
      ?AUTO_2391 - LOCATION
      ?AUTO_2390 - CITY
      ?AUTO_2388 - TRUCK
      ?AUTO_2389 - LOCATION
      ?AUTO_2387 - LOCATION
      ?AUTO_2392 - AIRPLANE
      ?AUTO_2393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2391 ?AUTO_2390 ) ( IN-CITY ?AUTO_2386 ?AUTO_2390 ) ( not ( = ?AUTO_2386 ?AUTO_2391 ) ) ( TRUCK-AT ?AUTO_2388 ?AUTO_2386 ) ( AIRPORT ?AUTO_2389 ) ( AIRPORT ?AUTO_2391 ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2386 ?AUTO_2389 ) ) ( AIRPORT ?AUTO_2387 ) ( AIRPLANE-AT ?AUTO_2392 ?AUTO_2387 ) ( not ( = ?AUTO_2387 ?AUTO_2389 ) ) ( not ( = ?AUTO_2386 ?AUTO_2387 ) ) ( not ( = ?AUTO_2391 ?AUTO_2387 ) ) ( TRUCK-AT ?AUTO_2393 ?AUTO_2389 ) ( IN-TRUCK ?AUTO_2385 ?AUTO_2393 ) ( not ( = ?AUTO_2388 ?AUTO_2393 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2385 ?AUTO_2393 ?AUTO_2389 )
      ( DELIVER-PKG ?AUTO_2385 ?AUTO_2386 )
      ( DELIVER-PKG-VERIFY ?AUTO_2385 ?AUTO_2386 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2406 - OBJ
      ?AUTO_2407 - LOCATION
    )
    :vars
    (
      ?AUTO_2414 - LOCATION
      ?AUTO_2408 - CITY
      ?AUTO_2410 - TRUCK
      ?AUTO_2413 - LOCATION
      ?AUTO_2412 - LOCATION
      ?AUTO_2411 - AIRPLANE
      ?AUTO_2415 - TRUCK
      ?AUTO_2416 - LOCATION
      ?AUTO_2409 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2414 ?AUTO_2408 ) ( IN-CITY ?AUTO_2407 ?AUTO_2408 ) ( not ( = ?AUTO_2407 ?AUTO_2414 ) ) ( TRUCK-AT ?AUTO_2410 ?AUTO_2407 ) ( AIRPORT ?AUTO_2413 ) ( AIRPORT ?AUTO_2414 ) ( not ( = ?AUTO_2413 ?AUTO_2414 ) ) ( not ( = ?AUTO_2407 ?AUTO_2413 ) ) ( AIRPORT ?AUTO_2412 ) ( AIRPLANE-AT ?AUTO_2411 ?AUTO_2412 ) ( not ( = ?AUTO_2412 ?AUTO_2413 ) ) ( not ( = ?AUTO_2407 ?AUTO_2412 ) ) ( not ( = ?AUTO_2414 ?AUTO_2412 ) ) ( not ( = ?AUTO_2410 ?AUTO_2415 ) ) ( TRUCK-AT ?AUTO_2415 ?AUTO_2416 ) ( IN-CITY ?AUTO_2416 ?AUTO_2409 ) ( IN-CITY ?AUTO_2413 ?AUTO_2409 ) ( not ( = ?AUTO_2413 ?AUTO_2416 ) ) ( not ( = ?AUTO_2407 ?AUTO_2416 ) ) ( not ( = ?AUTO_2414 ?AUTO_2416 ) ) ( not ( = ?AUTO_2408 ?AUTO_2409 ) ) ( not ( = ?AUTO_2412 ?AUTO_2416 ) ) ( OBJ-AT ?AUTO_2406 ?AUTO_2416 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2406 ?AUTO_2415 ?AUTO_2416 )
      ( DELIVER-PKG ?AUTO_2406 ?AUTO_2407 )
      ( DELIVER-PKG-VERIFY ?AUTO_2406 ?AUTO_2407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2421 - OBJ
      ?AUTO_2422 - LOCATION
    )
    :vars
    (
      ?AUTO_2423 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2423 ?AUTO_2422 ) ( IN-TRUCK ?AUTO_2421 ?AUTO_2423 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2421 ?AUTO_2423 ?AUTO_2422 )
      ( DELIVER-PKG-VERIFY ?AUTO_2421 ?AUTO_2422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2424 - OBJ
      ?AUTO_2425 - LOCATION
    )
    :vars
    (
      ?AUTO_2426 - TRUCK
      ?AUTO_2427 - LOCATION
      ?AUTO_2428 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2424 ?AUTO_2426 ) ( TRUCK-AT ?AUTO_2426 ?AUTO_2427 ) ( IN-CITY ?AUTO_2427 ?AUTO_2428 ) ( IN-CITY ?AUTO_2425 ?AUTO_2428 ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2426 ?AUTO_2427 ?AUTO_2425 ?AUTO_2428 )
      ( DELIVER-PKG ?AUTO_2424 ?AUTO_2425 )
      ( DELIVER-PKG-VERIFY ?AUTO_2424 ?AUTO_2425 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2431 - OBJ
      ?AUTO_2432 - LOCATION
    )
    :vars
    (
      ?AUTO_2435 - TRUCK
      ?AUTO_2434 - LOCATION
      ?AUTO_2433 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2435 ?AUTO_2434 ) ( IN-CITY ?AUTO_2434 ?AUTO_2433 ) ( IN-CITY ?AUTO_2432 ?AUTO_2433 ) ( not ( = ?AUTO_2432 ?AUTO_2434 ) ) ( OBJ-AT ?AUTO_2431 ?AUTO_2434 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2431 ?AUTO_2435 ?AUTO_2434 )
      ( DELIVER-PKG ?AUTO_2431 ?AUTO_2432 )
      ( DELIVER-PKG-VERIFY ?AUTO_2431 ?AUTO_2432 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2438 - OBJ
      ?AUTO_2439 - LOCATION
    )
    :vars
    (
      ?AUTO_2442 - LOCATION
      ?AUTO_2440 - CITY
      ?AUTO_2441 - TRUCK
      ?AUTO_2443 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2442 ?AUTO_2440 ) ( IN-CITY ?AUTO_2439 ?AUTO_2440 ) ( not ( = ?AUTO_2439 ?AUTO_2442 ) ) ( OBJ-AT ?AUTO_2438 ?AUTO_2442 ) ( TRUCK-AT ?AUTO_2441 ?AUTO_2443 ) ( IN-CITY ?AUTO_2443 ?AUTO_2440 ) ( not ( = ?AUTO_2442 ?AUTO_2443 ) ) ( not ( = ?AUTO_2439 ?AUTO_2443 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2441 ?AUTO_2443 ?AUTO_2442 ?AUTO_2440 )
      ( DELIVER-PKG ?AUTO_2438 ?AUTO_2439 )
      ( DELIVER-PKG-VERIFY ?AUTO_2438 ?AUTO_2439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2456 - OBJ
      ?AUTO_2457 - LOCATION
    )
    :vars
    (
      ?AUTO_2459 - LOCATION
      ?AUTO_2461 - CITY
      ?AUTO_2458 - TRUCK
      ?AUTO_2460 - LOCATION
      ?AUTO_2462 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2459 ?AUTO_2461 ) ( IN-CITY ?AUTO_2457 ?AUTO_2461 ) ( not ( = ?AUTO_2457 ?AUTO_2459 ) ) ( TRUCK-AT ?AUTO_2458 ?AUTO_2460 ) ( IN-CITY ?AUTO_2460 ?AUTO_2461 ) ( not ( = ?AUTO_2459 ?AUTO_2460 ) ) ( not ( = ?AUTO_2457 ?AUTO_2460 ) ) ( IN-AIRPLANE ?AUTO_2456 ?AUTO_2462 ) ( AIRPLANE-AT ?AUTO_2462 ?AUTO_2459 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2456 ?AUTO_2462 ?AUTO_2459 )
      ( DELIVER-PKG ?AUTO_2456 ?AUTO_2457 )
      ( DELIVER-PKG-VERIFY ?AUTO_2456 ?AUTO_2457 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2465 - OBJ
      ?AUTO_2466 - LOCATION
    )
    :vars
    (
      ?AUTO_2470 - LOCATION
      ?AUTO_2469 - CITY
      ?AUTO_2471 - TRUCK
      ?AUTO_2467 - LOCATION
      ?AUTO_2468 - AIRPLANE
      ?AUTO_2472 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2470 ?AUTO_2469 ) ( IN-CITY ?AUTO_2466 ?AUTO_2469 ) ( not ( = ?AUTO_2466 ?AUTO_2470 ) ) ( TRUCK-AT ?AUTO_2471 ?AUTO_2467 ) ( IN-CITY ?AUTO_2467 ?AUTO_2469 ) ( not ( = ?AUTO_2470 ?AUTO_2467 ) ) ( not ( = ?AUTO_2466 ?AUTO_2467 ) ) ( IN-AIRPLANE ?AUTO_2465 ?AUTO_2468 ) ( AIRPORT ?AUTO_2472 ) ( AIRPORT ?AUTO_2470 ) ( AIRPLANE-AT ?AUTO_2468 ?AUTO_2472 ) ( not ( = ?AUTO_2472 ?AUTO_2470 ) ) ( not ( = ?AUTO_2466 ?AUTO_2472 ) ) ( not ( = ?AUTO_2467 ?AUTO_2472 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2468 ?AUTO_2472 ?AUTO_2470 )
      ( DELIVER-PKG ?AUTO_2465 ?AUTO_2466 )
      ( DELIVER-PKG-VERIFY ?AUTO_2465 ?AUTO_2466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2473 - OBJ
      ?AUTO_2474 - LOCATION
    )
    :vars
    (
      ?AUTO_2480 - LOCATION
      ?AUTO_2478 - CITY
      ?AUTO_2479 - TRUCK
      ?AUTO_2475 - LOCATION
      ?AUTO_2477 - LOCATION
      ?AUTO_2476 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2480 ?AUTO_2478 ) ( IN-CITY ?AUTO_2474 ?AUTO_2478 ) ( not ( = ?AUTO_2474 ?AUTO_2480 ) ) ( TRUCK-AT ?AUTO_2479 ?AUTO_2475 ) ( IN-CITY ?AUTO_2475 ?AUTO_2478 ) ( not ( = ?AUTO_2480 ?AUTO_2475 ) ) ( not ( = ?AUTO_2474 ?AUTO_2475 ) ) ( AIRPORT ?AUTO_2477 ) ( AIRPORT ?AUTO_2480 ) ( AIRPLANE-AT ?AUTO_2476 ?AUTO_2477 ) ( not ( = ?AUTO_2477 ?AUTO_2480 ) ) ( not ( = ?AUTO_2474 ?AUTO_2477 ) ) ( not ( = ?AUTO_2475 ?AUTO_2477 ) ) ( OBJ-AT ?AUTO_2473 ?AUTO_2477 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2473 ?AUTO_2476 ?AUTO_2477 )
      ( DELIVER-PKG ?AUTO_2473 ?AUTO_2474 )
      ( DELIVER-PKG-VERIFY ?AUTO_2473 ?AUTO_2474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2483 - OBJ
      ?AUTO_2484 - LOCATION
    )
    :vars
    (
      ?AUTO_2490 - LOCATION
      ?AUTO_2489 - CITY
      ?AUTO_2485 - TRUCK
      ?AUTO_2487 - LOCATION
      ?AUTO_2486 - LOCATION
      ?AUTO_2488 - AIRPLANE
      ?AUTO_2491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2490 ?AUTO_2489 ) ( IN-CITY ?AUTO_2484 ?AUTO_2489 ) ( not ( = ?AUTO_2484 ?AUTO_2490 ) ) ( TRUCK-AT ?AUTO_2485 ?AUTO_2487 ) ( IN-CITY ?AUTO_2487 ?AUTO_2489 ) ( not ( = ?AUTO_2490 ?AUTO_2487 ) ) ( not ( = ?AUTO_2484 ?AUTO_2487 ) ) ( AIRPORT ?AUTO_2486 ) ( AIRPORT ?AUTO_2490 ) ( AIRPLANE-AT ?AUTO_2488 ?AUTO_2486 ) ( not ( = ?AUTO_2486 ?AUTO_2490 ) ) ( not ( = ?AUTO_2484 ?AUTO_2486 ) ) ( not ( = ?AUTO_2487 ?AUTO_2486 ) ) ( TRUCK-AT ?AUTO_2491 ?AUTO_2486 ) ( IN-TRUCK ?AUTO_2483 ?AUTO_2491 ) ( not ( = ?AUTO_2485 ?AUTO_2491 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2483 ?AUTO_2491 ?AUTO_2486 )
      ( DELIVER-PKG ?AUTO_2483 ?AUTO_2484 )
      ( DELIVER-PKG-VERIFY ?AUTO_2483 ?AUTO_2484 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2494 - OBJ
      ?AUTO_2495 - LOCATION
    )
    :vars
    (
      ?AUTO_2499 - LOCATION
      ?AUTO_2500 - CITY
      ?AUTO_2502 - TRUCK
      ?AUTO_2501 - LOCATION
      ?AUTO_2498 - LOCATION
      ?AUTO_2496 - AIRPLANE
      ?AUTO_2497 - TRUCK
      ?AUTO_2503 - LOCATION
      ?AUTO_2504 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2499 ?AUTO_2500 ) ( IN-CITY ?AUTO_2495 ?AUTO_2500 ) ( not ( = ?AUTO_2495 ?AUTO_2499 ) ) ( TRUCK-AT ?AUTO_2502 ?AUTO_2501 ) ( IN-CITY ?AUTO_2501 ?AUTO_2500 ) ( not ( = ?AUTO_2499 ?AUTO_2501 ) ) ( not ( = ?AUTO_2495 ?AUTO_2501 ) ) ( AIRPORT ?AUTO_2498 ) ( AIRPORT ?AUTO_2499 ) ( AIRPLANE-AT ?AUTO_2496 ?AUTO_2498 ) ( not ( = ?AUTO_2498 ?AUTO_2499 ) ) ( not ( = ?AUTO_2495 ?AUTO_2498 ) ) ( not ( = ?AUTO_2501 ?AUTO_2498 ) ) ( IN-TRUCK ?AUTO_2494 ?AUTO_2497 ) ( not ( = ?AUTO_2502 ?AUTO_2497 ) ) ( TRUCK-AT ?AUTO_2497 ?AUTO_2503 ) ( IN-CITY ?AUTO_2503 ?AUTO_2504 ) ( IN-CITY ?AUTO_2498 ?AUTO_2504 ) ( not ( = ?AUTO_2498 ?AUTO_2503 ) ) ( not ( = ?AUTO_2495 ?AUTO_2503 ) ) ( not ( = ?AUTO_2499 ?AUTO_2503 ) ) ( not ( = ?AUTO_2500 ?AUTO_2504 ) ) ( not ( = ?AUTO_2501 ?AUTO_2503 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2497 ?AUTO_2503 ?AUTO_2498 ?AUTO_2504 )
      ( DELIVER-PKG ?AUTO_2494 ?AUTO_2495 )
      ( DELIVER-PKG-VERIFY ?AUTO_2494 ?AUTO_2495 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2505 - OBJ
      ?AUTO_2506 - LOCATION
    )
    :vars
    (
      ?AUTO_2515 - LOCATION
      ?AUTO_2510 - CITY
      ?AUTO_2513 - TRUCK
      ?AUTO_2511 - LOCATION
      ?AUTO_2514 - LOCATION
      ?AUTO_2509 - AIRPLANE
      ?AUTO_2508 - TRUCK
      ?AUTO_2507 - LOCATION
      ?AUTO_2512 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2515 ?AUTO_2510 ) ( IN-CITY ?AUTO_2506 ?AUTO_2510 ) ( not ( = ?AUTO_2506 ?AUTO_2515 ) ) ( TRUCK-AT ?AUTO_2513 ?AUTO_2511 ) ( IN-CITY ?AUTO_2511 ?AUTO_2510 ) ( not ( = ?AUTO_2515 ?AUTO_2511 ) ) ( not ( = ?AUTO_2506 ?AUTO_2511 ) ) ( AIRPORT ?AUTO_2514 ) ( AIRPORT ?AUTO_2515 ) ( AIRPLANE-AT ?AUTO_2509 ?AUTO_2514 ) ( not ( = ?AUTO_2514 ?AUTO_2515 ) ) ( not ( = ?AUTO_2506 ?AUTO_2514 ) ) ( not ( = ?AUTO_2511 ?AUTO_2514 ) ) ( not ( = ?AUTO_2513 ?AUTO_2508 ) ) ( TRUCK-AT ?AUTO_2508 ?AUTO_2507 ) ( IN-CITY ?AUTO_2507 ?AUTO_2512 ) ( IN-CITY ?AUTO_2514 ?AUTO_2512 ) ( not ( = ?AUTO_2514 ?AUTO_2507 ) ) ( not ( = ?AUTO_2506 ?AUTO_2507 ) ) ( not ( = ?AUTO_2515 ?AUTO_2507 ) ) ( not ( = ?AUTO_2510 ?AUTO_2512 ) ) ( not ( = ?AUTO_2511 ?AUTO_2507 ) ) ( OBJ-AT ?AUTO_2505 ?AUTO_2507 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2505 ?AUTO_2508 ?AUTO_2507 )
      ( DELIVER-PKG ?AUTO_2505 ?AUTO_2506 )
      ( DELIVER-PKG-VERIFY ?AUTO_2505 ?AUTO_2506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2518 - OBJ
      ?AUTO_2519 - LOCATION
    )
    :vars
    (
      ?AUTO_2523 - LOCATION
      ?AUTO_2522 - CITY
      ?AUTO_2525 - TRUCK
      ?AUTO_2521 - LOCATION
      ?AUTO_2527 - LOCATION
      ?AUTO_2524 - AIRPLANE
      ?AUTO_2520 - TRUCK
      ?AUTO_2526 - LOCATION
      ?AUTO_2528 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2523 ?AUTO_2522 ) ( IN-CITY ?AUTO_2519 ?AUTO_2522 ) ( not ( = ?AUTO_2519 ?AUTO_2523 ) ) ( TRUCK-AT ?AUTO_2525 ?AUTO_2521 ) ( IN-CITY ?AUTO_2521 ?AUTO_2522 ) ( not ( = ?AUTO_2523 ?AUTO_2521 ) ) ( not ( = ?AUTO_2519 ?AUTO_2521 ) ) ( AIRPORT ?AUTO_2527 ) ( AIRPORT ?AUTO_2523 ) ( AIRPLANE-AT ?AUTO_2524 ?AUTO_2527 ) ( not ( = ?AUTO_2527 ?AUTO_2523 ) ) ( not ( = ?AUTO_2519 ?AUTO_2527 ) ) ( not ( = ?AUTO_2521 ?AUTO_2527 ) ) ( not ( = ?AUTO_2525 ?AUTO_2520 ) ) ( IN-CITY ?AUTO_2526 ?AUTO_2528 ) ( IN-CITY ?AUTO_2527 ?AUTO_2528 ) ( not ( = ?AUTO_2527 ?AUTO_2526 ) ) ( not ( = ?AUTO_2519 ?AUTO_2526 ) ) ( not ( = ?AUTO_2523 ?AUTO_2526 ) ) ( not ( = ?AUTO_2522 ?AUTO_2528 ) ) ( not ( = ?AUTO_2521 ?AUTO_2526 ) ) ( OBJ-AT ?AUTO_2518 ?AUTO_2526 ) ( TRUCK-AT ?AUTO_2520 ?AUTO_2527 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2520 ?AUTO_2527 ?AUTO_2526 ?AUTO_2528 )
      ( DELIVER-PKG ?AUTO_2518 ?AUTO_2519 )
      ( DELIVER-PKG-VERIFY ?AUTO_2518 ?AUTO_2519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2531 - OBJ
      ?AUTO_2532 - LOCATION
    )
    :vars
    (
      ?AUTO_2537 - LOCATION
      ?AUTO_2536 - CITY
      ?AUTO_2538 - TRUCK
      ?AUTO_2540 - LOCATION
      ?AUTO_2533 - LOCATION
      ?AUTO_2539 - TRUCK
      ?AUTO_2535 - LOCATION
      ?AUTO_2534 - CITY
      ?AUTO_2542 - LOCATION
      ?AUTO_2541 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2537 ?AUTO_2536 ) ( IN-CITY ?AUTO_2532 ?AUTO_2536 ) ( not ( = ?AUTO_2532 ?AUTO_2537 ) ) ( TRUCK-AT ?AUTO_2538 ?AUTO_2540 ) ( IN-CITY ?AUTO_2540 ?AUTO_2536 ) ( not ( = ?AUTO_2537 ?AUTO_2540 ) ) ( not ( = ?AUTO_2532 ?AUTO_2540 ) ) ( AIRPORT ?AUTO_2533 ) ( AIRPORT ?AUTO_2537 ) ( not ( = ?AUTO_2533 ?AUTO_2537 ) ) ( not ( = ?AUTO_2532 ?AUTO_2533 ) ) ( not ( = ?AUTO_2540 ?AUTO_2533 ) ) ( not ( = ?AUTO_2538 ?AUTO_2539 ) ) ( IN-CITY ?AUTO_2535 ?AUTO_2534 ) ( IN-CITY ?AUTO_2533 ?AUTO_2534 ) ( not ( = ?AUTO_2533 ?AUTO_2535 ) ) ( not ( = ?AUTO_2532 ?AUTO_2535 ) ) ( not ( = ?AUTO_2537 ?AUTO_2535 ) ) ( not ( = ?AUTO_2536 ?AUTO_2534 ) ) ( not ( = ?AUTO_2540 ?AUTO_2535 ) ) ( OBJ-AT ?AUTO_2531 ?AUTO_2535 ) ( TRUCK-AT ?AUTO_2539 ?AUTO_2533 ) ( AIRPORT ?AUTO_2542 ) ( AIRPLANE-AT ?AUTO_2541 ?AUTO_2542 ) ( not ( = ?AUTO_2542 ?AUTO_2533 ) ) ( not ( = ?AUTO_2532 ?AUTO_2542 ) ) ( not ( = ?AUTO_2537 ?AUTO_2542 ) ) ( not ( = ?AUTO_2540 ?AUTO_2542 ) ) ( not ( = ?AUTO_2535 ?AUTO_2542 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2541 ?AUTO_2542 ?AUTO_2533 )
      ( DELIVER-PKG ?AUTO_2531 ?AUTO_2532 )
      ( DELIVER-PKG-VERIFY ?AUTO_2531 ?AUTO_2532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2595 - OBJ
      ?AUTO_2596 - LOCATION
    )
    :vars
    (
      ?AUTO_2597 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2597 ?AUTO_2596 ) ( IN-TRUCK ?AUTO_2595 ?AUTO_2597 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2595 ?AUTO_2597 ?AUTO_2596 )
      ( DELIVER-PKG-VERIFY ?AUTO_2595 ?AUTO_2596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2598 - OBJ
      ?AUTO_2599 - LOCATION
    )
    :vars
    (
      ?AUTO_2600 - TRUCK
      ?AUTO_2601 - LOCATION
      ?AUTO_2602 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2598 ?AUTO_2600 ) ( TRUCK-AT ?AUTO_2600 ?AUTO_2601 ) ( IN-CITY ?AUTO_2601 ?AUTO_2602 ) ( IN-CITY ?AUTO_2599 ?AUTO_2602 ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2600 ?AUTO_2601 ?AUTO_2599 ?AUTO_2602 )
      ( DELIVER-PKG ?AUTO_2598 ?AUTO_2599 )
      ( DELIVER-PKG-VERIFY ?AUTO_2598 ?AUTO_2599 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2705 - OBJ
      ?AUTO_2706 - LOCATION
    )
    :vars
    (
      ?AUTO_2707 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2707 ?AUTO_2706 ) ( IN-TRUCK ?AUTO_2705 ?AUTO_2707 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2705 ?AUTO_2707 ?AUTO_2706 )
      ( DELIVER-PKG-VERIFY ?AUTO_2705 ?AUTO_2706 ) )
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
      ?AUTO_2719 - LOCATION
      ?AUTO_2720 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2718 ?AUTO_2719 ) ( IN-CITY ?AUTO_2719 ?AUTO_2720 ) ( IN-CITY ?AUTO_2717 ?AUTO_2720 ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) ( OBJ-AT ?AUTO_2716 ?AUTO_2719 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2716 ?AUTO_2718 ?AUTO_2719 )
      ( DELIVER-PKG ?AUTO_2716 ?AUTO_2717 )
      ( DELIVER-PKG-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2723 - OBJ
      ?AUTO_2724 - LOCATION
    )
    :vars
    (
      ?AUTO_2725 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2725 ?AUTO_2724 ) ( IN-TRUCK ?AUTO_2723 ?AUTO_2725 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2723 ?AUTO_2725 ?AUTO_2724 )
      ( DELIVER-PKG-VERIFY ?AUTO_2723 ?AUTO_2724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2726 - OBJ
      ?AUTO_2727 - LOCATION
    )
    :vars
    (
      ?AUTO_2728 - TRUCK
      ?AUTO_2729 - LOCATION
      ?AUTO_2730 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2726 ?AUTO_2728 ) ( TRUCK-AT ?AUTO_2728 ?AUTO_2729 ) ( IN-CITY ?AUTO_2729 ?AUTO_2730 ) ( IN-CITY ?AUTO_2727 ?AUTO_2730 ) ( not ( = ?AUTO_2727 ?AUTO_2729 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2728 ?AUTO_2729 ?AUTO_2727 ?AUTO_2730 )
      ( DELIVER-PKG ?AUTO_2726 ?AUTO_2727 )
      ( DELIVER-PKG-VERIFY ?AUTO_2726 ?AUTO_2727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2731 - OBJ
      ?AUTO_2732 - LOCATION
    )
    :vars
    (
      ?AUTO_2733 - TRUCK
      ?AUTO_2734 - LOCATION
      ?AUTO_2735 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2733 ?AUTO_2734 ) ( IN-CITY ?AUTO_2734 ?AUTO_2735 ) ( IN-CITY ?AUTO_2732 ?AUTO_2735 ) ( not ( = ?AUTO_2732 ?AUTO_2734 ) ) ( OBJ-AT ?AUTO_2731 ?AUTO_2734 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2731 ?AUTO_2733 ?AUTO_2734 )
      ( DELIVER-PKG ?AUTO_2731 ?AUTO_2732 )
      ( DELIVER-PKG-VERIFY ?AUTO_2731 ?AUTO_2732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2738 - OBJ
      ?AUTO_2739 - LOCATION
    )
    :vars
    (
      ?AUTO_2740 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2738 ?AUTO_2740 ) ( AIRPLANE-AT ?AUTO_2740 ?AUTO_2739 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2738 ?AUTO_2740 ?AUTO_2739 )
      ( DELIVER-PKG-VERIFY ?AUTO_2738 ?AUTO_2739 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2741 - OBJ
      ?AUTO_2742 - LOCATION
    )
    :vars
    (
      ?AUTO_2743 - AIRPLANE
      ?AUTO_2744 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2741 ?AUTO_2743 ) ( AIRPORT ?AUTO_2744 ) ( AIRPORT ?AUTO_2742 ) ( AIRPLANE-AT ?AUTO_2743 ?AUTO_2744 ) ( not ( = ?AUTO_2744 ?AUTO_2742 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2743 ?AUTO_2744 ?AUTO_2742 )
      ( DELIVER-PKG ?AUTO_2741 ?AUTO_2742 )
      ( DELIVER-PKG-VERIFY ?AUTO_2741 ?AUTO_2742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2745 - OBJ
      ?AUTO_2746 - LOCATION
    )
    :vars
    (
      ?AUTO_2748 - LOCATION
      ?AUTO_2747 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2748 ) ( AIRPORT ?AUTO_2746 ) ( AIRPLANE-AT ?AUTO_2747 ?AUTO_2748 ) ( not ( = ?AUTO_2748 ?AUTO_2746 ) ) ( OBJ-AT ?AUTO_2745 ?AUTO_2748 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2745 ?AUTO_2747 ?AUTO_2748 )
      ( DELIVER-PKG ?AUTO_2745 ?AUTO_2746 )
      ( DELIVER-PKG-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2749 - OBJ
      ?AUTO_2750 - LOCATION
    )
    :vars
    (
      ?AUTO_2752 - LOCATION
      ?AUTO_2751 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2752 ) ( AIRPORT ?AUTO_2750 ) ( not ( = ?AUTO_2752 ?AUTO_2750 ) ) ( OBJ-AT ?AUTO_2749 ?AUTO_2752 ) ( AIRPLANE-AT ?AUTO_2751 ?AUTO_2750 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2751 ?AUTO_2750 ?AUTO_2752 )
      ( DELIVER-PKG ?AUTO_2749 ?AUTO_2750 )
      ( DELIVER-PKG-VERIFY ?AUTO_2749 ?AUTO_2750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2753 - OBJ
      ?AUTO_2754 - LOCATION
    )
    :vars
    (
      ?AUTO_2755 - LOCATION
      ?AUTO_2756 - AIRPLANE
      ?AUTO_2757 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2755 ) ( AIRPORT ?AUTO_2754 ) ( not ( = ?AUTO_2755 ?AUTO_2754 ) ) ( AIRPLANE-AT ?AUTO_2756 ?AUTO_2754 ) ( TRUCK-AT ?AUTO_2757 ?AUTO_2755 ) ( IN-TRUCK ?AUTO_2753 ?AUTO_2757 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2753 ?AUTO_2757 ?AUTO_2755 )
      ( DELIVER-PKG ?AUTO_2753 ?AUTO_2754 )
      ( DELIVER-PKG-VERIFY ?AUTO_2753 ?AUTO_2754 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2758 - OBJ
      ?AUTO_2759 - LOCATION
    )
    :vars
    (
      ?AUTO_2761 - LOCATION
      ?AUTO_2760 - AIRPLANE
      ?AUTO_2762 - TRUCK
      ?AUTO_2763 - LOCATION
      ?AUTO_2764 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2761 ) ( AIRPORT ?AUTO_2759 ) ( not ( = ?AUTO_2761 ?AUTO_2759 ) ) ( AIRPLANE-AT ?AUTO_2760 ?AUTO_2759 ) ( IN-TRUCK ?AUTO_2758 ?AUTO_2762 ) ( TRUCK-AT ?AUTO_2762 ?AUTO_2763 ) ( IN-CITY ?AUTO_2763 ?AUTO_2764 ) ( IN-CITY ?AUTO_2761 ?AUTO_2764 ) ( not ( = ?AUTO_2761 ?AUTO_2763 ) ) ( not ( = ?AUTO_2759 ?AUTO_2763 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2762 ?AUTO_2763 ?AUTO_2761 ?AUTO_2764 )
      ( DELIVER-PKG ?AUTO_2758 ?AUTO_2759 )
      ( DELIVER-PKG-VERIFY ?AUTO_2758 ?AUTO_2759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2765 - OBJ
      ?AUTO_2766 - LOCATION
    )
    :vars
    (
      ?AUTO_2768 - LOCATION
      ?AUTO_2767 - AIRPLANE
      ?AUTO_2769 - TRUCK
      ?AUTO_2770 - LOCATION
      ?AUTO_2771 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2768 ) ( AIRPORT ?AUTO_2766 ) ( not ( = ?AUTO_2768 ?AUTO_2766 ) ) ( AIRPLANE-AT ?AUTO_2767 ?AUTO_2766 ) ( TRUCK-AT ?AUTO_2769 ?AUTO_2770 ) ( IN-CITY ?AUTO_2770 ?AUTO_2771 ) ( IN-CITY ?AUTO_2768 ?AUTO_2771 ) ( not ( = ?AUTO_2768 ?AUTO_2770 ) ) ( not ( = ?AUTO_2766 ?AUTO_2770 ) ) ( OBJ-AT ?AUTO_2765 ?AUTO_2770 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2765 ?AUTO_2769 ?AUTO_2770 )
      ( DELIVER-PKG ?AUTO_2765 ?AUTO_2766 )
      ( DELIVER-PKG-VERIFY ?AUTO_2765 ?AUTO_2766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2774 - OBJ
      ?AUTO_2775 - LOCATION
    )
    :vars
    (
      ?AUTO_2776 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2776 ?AUTO_2775 ) ( IN-TRUCK ?AUTO_2774 ?AUTO_2776 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2774 ?AUTO_2776 ?AUTO_2775 )
      ( DELIVER-PKG-VERIFY ?AUTO_2774 ?AUTO_2775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2777 - OBJ
      ?AUTO_2778 - LOCATION
    )
    :vars
    (
      ?AUTO_2779 - TRUCK
      ?AUTO_2780 - LOCATION
      ?AUTO_2781 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2777 ?AUTO_2779 ) ( TRUCK-AT ?AUTO_2779 ?AUTO_2780 ) ( IN-CITY ?AUTO_2780 ?AUTO_2781 ) ( IN-CITY ?AUTO_2778 ?AUTO_2781 ) ( not ( = ?AUTO_2778 ?AUTO_2780 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2779 ?AUTO_2780 ?AUTO_2778 ?AUTO_2781 )
      ( DELIVER-PKG ?AUTO_2777 ?AUTO_2778 )
      ( DELIVER-PKG-VERIFY ?AUTO_2777 ?AUTO_2778 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2782 - OBJ
      ?AUTO_2783 - LOCATION
    )
    :vars
    (
      ?AUTO_2785 - TRUCK
      ?AUTO_2786 - LOCATION
      ?AUTO_2784 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2785 ?AUTO_2786 ) ( IN-CITY ?AUTO_2786 ?AUTO_2784 ) ( IN-CITY ?AUTO_2783 ?AUTO_2784 ) ( not ( = ?AUTO_2783 ?AUTO_2786 ) ) ( OBJ-AT ?AUTO_2782 ?AUTO_2786 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2782 ?AUTO_2785 ?AUTO_2786 )
      ( DELIVER-PKG ?AUTO_2782 ?AUTO_2783 )
      ( DELIVER-PKG-VERIFY ?AUTO_2782 ?AUTO_2783 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2787 - OBJ
      ?AUTO_2788 - LOCATION
    )
    :vars
    (
      ?AUTO_2791 - LOCATION
      ?AUTO_2790 - CITY
      ?AUTO_2789 - TRUCK
      ?AUTO_2792 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2791 ?AUTO_2790 ) ( IN-CITY ?AUTO_2788 ?AUTO_2790 ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( OBJ-AT ?AUTO_2787 ?AUTO_2791 ) ( TRUCK-AT ?AUTO_2789 ?AUTO_2792 ) ( IN-CITY ?AUTO_2792 ?AUTO_2790 ) ( not ( = ?AUTO_2791 ?AUTO_2792 ) ) ( not ( = ?AUTO_2788 ?AUTO_2792 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2789 ?AUTO_2792 ?AUTO_2791 ?AUTO_2790 )
      ( DELIVER-PKG ?AUTO_2787 ?AUTO_2788 )
      ( DELIVER-PKG-VERIFY ?AUTO_2787 ?AUTO_2788 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2795 - OBJ
      ?AUTO_2796 - LOCATION
    )
    :vars
    (
      ?AUTO_2797 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2795 ?AUTO_2797 ) ( AIRPLANE-AT ?AUTO_2797 ?AUTO_2796 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2795 ?AUTO_2797 ?AUTO_2796 )
      ( DELIVER-PKG-VERIFY ?AUTO_2795 ?AUTO_2796 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2800 - OBJ
      ?AUTO_2801 - LOCATION
    )
    :vars
    (
      ?AUTO_2802 - AIRPLANE
      ?AUTO_2803 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2800 ?AUTO_2802 ) ( AIRPORT ?AUTO_2803 ) ( AIRPORT ?AUTO_2801 ) ( AIRPLANE-AT ?AUTO_2802 ?AUTO_2803 ) ( not ( = ?AUTO_2803 ?AUTO_2801 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2802 ?AUTO_2803 ?AUTO_2801 )
      ( DELIVER-PKG ?AUTO_2800 ?AUTO_2801 )
      ( DELIVER-PKG-VERIFY ?AUTO_2800 ?AUTO_2801 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2804 - OBJ
      ?AUTO_2805 - LOCATION
    )
    :vars
    (
      ?AUTO_2807 - LOCATION
      ?AUTO_2806 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2807 ) ( AIRPORT ?AUTO_2805 ) ( AIRPLANE-AT ?AUTO_2806 ?AUTO_2807 ) ( not ( = ?AUTO_2807 ?AUTO_2805 ) ) ( OBJ-AT ?AUTO_2804 ?AUTO_2807 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2804 ?AUTO_2806 ?AUTO_2807 )
      ( DELIVER-PKG ?AUTO_2804 ?AUTO_2805 )
      ( DELIVER-PKG-VERIFY ?AUTO_2804 ?AUTO_2805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2808 - OBJ
      ?AUTO_2809 - LOCATION
    )
    :vars
    (
      ?AUTO_2811 - LOCATION
      ?AUTO_2812 - LOCATION
      ?AUTO_2810 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2811 ) ( AIRPORT ?AUTO_2809 ) ( not ( = ?AUTO_2811 ?AUTO_2809 ) ) ( OBJ-AT ?AUTO_2808 ?AUTO_2811 ) ( AIRPORT ?AUTO_2812 ) ( AIRPLANE-AT ?AUTO_2810 ?AUTO_2812 ) ( not ( = ?AUTO_2812 ?AUTO_2811 ) ) ( not ( = ?AUTO_2809 ?AUTO_2812 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2810 ?AUTO_2812 ?AUTO_2811 )
      ( DELIVER-PKG ?AUTO_2808 ?AUTO_2809 )
      ( DELIVER-PKG-VERIFY ?AUTO_2808 ?AUTO_2809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2813 - OBJ
      ?AUTO_2814 - LOCATION
    )
    :vars
    (
      ?AUTO_2815 - LOCATION
      ?AUTO_2817 - LOCATION
      ?AUTO_2816 - AIRPLANE
      ?AUTO_2818 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2815 ) ( AIRPORT ?AUTO_2814 ) ( not ( = ?AUTO_2815 ?AUTO_2814 ) ) ( AIRPORT ?AUTO_2817 ) ( AIRPLANE-AT ?AUTO_2816 ?AUTO_2817 ) ( not ( = ?AUTO_2817 ?AUTO_2815 ) ) ( not ( = ?AUTO_2814 ?AUTO_2817 ) ) ( TRUCK-AT ?AUTO_2818 ?AUTO_2815 ) ( IN-TRUCK ?AUTO_2813 ?AUTO_2818 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2813 ?AUTO_2818 ?AUTO_2815 )
      ( DELIVER-PKG ?AUTO_2813 ?AUTO_2814 )
      ( DELIVER-PKG-VERIFY ?AUTO_2813 ?AUTO_2814 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2819 - OBJ
      ?AUTO_2820 - LOCATION
    )
    :vars
    (
      ?AUTO_2822 - LOCATION
      ?AUTO_2824 - LOCATION
      ?AUTO_2823 - AIRPLANE
      ?AUTO_2821 - TRUCK
      ?AUTO_2825 - LOCATION
      ?AUTO_2826 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2822 ) ( AIRPORT ?AUTO_2820 ) ( not ( = ?AUTO_2822 ?AUTO_2820 ) ) ( AIRPORT ?AUTO_2824 ) ( AIRPLANE-AT ?AUTO_2823 ?AUTO_2824 ) ( not ( = ?AUTO_2824 ?AUTO_2822 ) ) ( not ( = ?AUTO_2820 ?AUTO_2824 ) ) ( IN-TRUCK ?AUTO_2819 ?AUTO_2821 ) ( TRUCK-AT ?AUTO_2821 ?AUTO_2825 ) ( IN-CITY ?AUTO_2825 ?AUTO_2826 ) ( IN-CITY ?AUTO_2822 ?AUTO_2826 ) ( not ( = ?AUTO_2822 ?AUTO_2825 ) ) ( not ( = ?AUTO_2820 ?AUTO_2825 ) ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2821 ?AUTO_2825 ?AUTO_2822 ?AUTO_2826 )
      ( DELIVER-PKG ?AUTO_2819 ?AUTO_2820 )
      ( DELIVER-PKG-VERIFY ?AUTO_2819 ?AUTO_2820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2827 - OBJ
      ?AUTO_2828 - LOCATION
    )
    :vars
    (
      ?AUTO_2831 - LOCATION
      ?AUTO_2829 - LOCATION
      ?AUTO_2834 - AIRPLANE
      ?AUTO_2830 - TRUCK
      ?AUTO_2833 - LOCATION
      ?AUTO_2832 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2831 ) ( AIRPORT ?AUTO_2828 ) ( not ( = ?AUTO_2831 ?AUTO_2828 ) ) ( AIRPORT ?AUTO_2829 ) ( AIRPLANE-AT ?AUTO_2834 ?AUTO_2829 ) ( not ( = ?AUTO_2829 ?AUTO_2831 ) ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( TRUCK-AT ?AUTO_2830 ?AUTO_2833 ) ( IN-CITY ?AUTO_2833 ?AUTO_2832 ) ( IN-CITY ?AUTO_2831 ?AUTO_2832 ) ( not ( = ?AUTO_2831 ?AUTO_2833 ) ) ( not ( = ?AUTO_2828 ?AUTO_2833 ) ) ( not ( = ?AUTO_2829 ?AUTO_2833 ) ) ( OBJ-AT ?AUTO_2827 ?AUTO_2833 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2827 ?AUTO_2830 ?AUTO_2833 )
      ( DELIVER-PKG ?AUTO_2827 ?AUTO_2828 )
      ( DELIVER-PKG-VERIFY ?AUTO_2827 ?AUTO_2828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2835 - OBJ
      ?AUTO_2836 - LOCATION
    )
    :vars
    (
      ?AUTO_2841 - LOCATION
      ?AUTO_2837 - LOCATION
      ?AUTO_2840 - AIRPLANE
      ?AUTO_2839 - LOCATION
      ?AUTO_2842 - CITY
      ?AUTO_2838 - TRUCK
      ?AUTO_2843 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2841 ) ( AIRPORT ?AUTO_2836 ) ( not ( = ?AUTO_2841 ?AUTO_2836 ) ) ( AIRPORT ?AUTO_2837 ) ( AIRPLANE-AT ?AUTO_2840 ?AUTO_2837 ) ( not ( = ?AUTO_2837 ?AUTO_2841 ) ) ( not ( = ?AUTO_2836 ?AUTO_2837 ) ) ( IN-CITY ?AUTO_2839 ?AUTO_2842 ) ( IN-CITY ?AUTO_2841 ?AUTO_2842 ) ( not ( = ?AUTO_2841 ?AUTO_2839 ) ) ( not ( = ?AUTO_2836 ?AUTO_2839 ) ) ( not ( = ?AUTO_2837 ?AUTO_2839 ) ) ( OBJ-AT ?AUTO_2835 ?AUTO_2839 ) ( TRUCK-AT ?AUTO_2838 ?AUTO_2843 ) ( IN-CITY ?AUTO_2843 ?AUTO_2842 ) ( not ( = ?AUTO_2839 ?AUTO_2843 ) ) ( not ( = ?AUTO_2836 ?AUTO_2843 ) ) ( not ( = ?AUTO_2841 ?AUTO_2843 ) ) ( not ( = ?AUTO_2837 ?AUTO_2843 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2838 ?AUTO_2843 ?AUTO_2839 ?AUTO_2842 )
      ( DELIVER-PKG ?AUTO_2835 ?AUTO_2836 )
      ( DELIVER-PKG-VERIFY ?AUTO_2835 ?AUTO_2836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2846 - OBJ
      ?AUTO_2847 - LOCATION
    )
    :vars
    (
      ?AUTO_2848 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2848 ?AUTO_2847 ) ( IN-TRUCK ?AUTO_2846 ?AUTO_2848 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2846 ?AUTO_2848 ?AUTO_2847 )
      ( DELIVER-PKG-VERIFY ?AUTO_2846 ?AUTO_2847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2849 - OBJ
      ?AUTO_2850 - LOCATION
    )
    :vars
    (
      ?AUTO_2851 - TRUCK
      ?AUTO_2852 - LOCATION
      ?AUTO_2853 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2849 ?AUTO_2851 ) ( TRUCK-AT ?AUTO_2851 ?AUTO_2852 ) ( IN-CITY ?AUTO_2852 ?AUTO_2853 ) ( IN-CITY ?AUTO_2850 ?AUTO_2853 ) ( not ( = ?AUTO_2850 ?AUTO_2852 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2851 ?AUTO_2852 ?AUTO_2850 ?AUTO_2853 )
      ( DELIVER-PKG ?AUTO_2849 ?AUTO_2850 )
      ( DELIVER-PKG-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2854 - OBJ
      ?AUTO_2855 - LOCATION
    )
    :vars
    (
      ?AUTO_2856 - TRUCK
      ?AUTO_2857 - LOCATION
      ?AUTO_2858 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2856 ?AUTO_2857 ) ( IN-CITY ?AUTO_2857 ?AUTO_2858 ) ( IN-CITY ?AUTO_2855 ?AUTO_2858 ) ( not ( = ?AUTO_2855 ?AUTO_2857 ) ) ( OBJ-AT ?AUTO_2854 ?AUTO_2857 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2854 ?AUTO_2856 ?AUTO_2857 )
      ( DELIVER-PKG ?AUTO_2854 ?AUTO_2855 )
      ( DELIVER-PKG-VERIFY ?AUTO_2854 ?AUTO_2855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2859 - OBJ
      ?AUTO_2860 - LOCATION
    )
    :vars
    (
      ?AUTO_2862 - TRUCK
      ?AUTO_2861 - LOCATION
      ?AUTO_2863 - CITY
      ?AUTO_2864 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2862 ?AUTO_2861 ) ( IN-CITY ?AUTO_2861 ?AUTO_2863 ) ( IN-CITY ?AUTO_2860 ?AUTO_2863 ) ( not ( = ?AUTO_2860 ?AUTO_2861 ) ) ( IN-AIRPLANE ?AUTO_2859 ?AUTO_2864 ) ( AIRPLANE-AT ?AUTO_2864 ?AUTO_2861 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2859 ?AUTO_2864 ?AUTO_2861 )
      ( DELIVER-PKG ?AUTO_2859 ?AUTO_2860 )
      ( DELIVER-PKG-VERIFY ?AUTO_2859 ?AUTO_2860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2865 - OBJ
      ?AUTO_2866 - LOCATION
    )
    :vars
    (
      ?AUTO_2869 - LOCATION
      ?AUTO_2867 - CITY
      ?AUTO_2870 - AIRPLANE
      ?AUTO_2868 - TRUCK
      ?AUTO_2871 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2869 ?AUTO_2867 ) ( IN-CITY ?AUTO_2866 ?AUTO_2867 ) ( not ( = ?AUTO_2866 ?AUTO_2869 ) ) ( IN-AIRPLANE ?AUTO_2865 ?AUTO_2870 ) ( AIRPLANE-AT ?AUTO_2870 ?AUTO_2869 ) ( TRUCK-AT ?AUTO_2868 ?AUTO_2871 ) ( IN-CITY ?AUTO_2871 ?AUTO_2867 ) ( not ( = ?AUTO_2869 ?AUTO_2871 ) ) ( not ( = ?AUTO_2866 ?AUTO_2871 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2868 ?AUTO_2871 ?AUTO_2869 ?AUTO_2867 )
      ( DELIVER-PKG ?AUTO_2865 ?AUTO_2866 )
      ( DELIVER-PKG-VERIFY ?AUTO_2865 ?AUTO_2866 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2872 - OBJ
      ?AUTO_2873 - LOCATION
    )
    :vars
    (
      ?AUTO_2877 - LOCATION
      ?AUTO_2876 - CITY
      ?AUTO_2878 - AIRPLANE
      ?AUTO_2875 - TRUCK
      ?AUTO_2874 - LOCATION
      ?AUTO_2879 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2877 ?AUTO_2876 ) ( IN-CITY ?AUTO_2873 ?AUTO_2876 ) ( not ( = ?AUTO_2873 ?AUTO_2877 ) ) ( IN-AIRPLANE ?AUTO_2872 ?AUTO_2878 ) ( TRUCK-AT ?AUTO_2875 ?AUTO_2874 ) ( IN-CITY ?AUTO_2874 ?AUTO_2876 ) ( not ( = ?AUTO_2877 ?AUTO_2874 ) ) ( not ( = ?AUTO_2873 ?AUTO_2874 ) ) ( AIRPORT ?AUTO_2879 ) ( AIRPORT ?AUTO_2877 ) ( AIRPLANE-AT ?AUTO_2878 ?AUTO_2879 ) ( not ( = ?AUTO_2879 ?AUTO_2877 ) ) ( not ( = ?AUTO_2873 ?AUTO_2879 ) ) ( not ( = ?AUTO_2874 ?AUTO_2879 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2878 ?AUTO_2879 ?AUTO_2877 )
      ( DELIVER-PKG ?AUTO_2872 ?AUTO_2873 )
      ( DELIVER-PKG-VERIFY ?AUTO_2872 ?AUTO_2873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2880 - OBJ
      ?AUTO_2881 - LOCATION
    )
    :vars
    (
      ?AUTO_2886 - LOCATION
      ?AUTO_2882 - CITY
      ?AUTO_2883 - TRUCK
      ?AUTO_2885 - LOCATION
      ?AUTO_2884 - LOCATION
      ?AUTO_2887 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2886 ?AUTO_2882 ) ( IN-CITY ?AUTO_2881 ?AUTO_2882 ) ( not ( = ?AUTO_2881 ?AUTO_2886 ) ) ( TRUCK-AT ?AUTO_2883 ?AUTO_2885 ) ( IN-CITY ?AUTO_2885 ?AUTO_2882 ) ( not ( = ?AUTO_2886 ?AUTO_2885 ) ) ( not ( = ?AUTO_2881 ?AUTO_2885 ) ) ( AIRPORT ?AUTO_2884 ) ( AIRPORT ?AUTO_2886 ) ( AIRPLANE-AT ?AUTO_2887 ?AUTO_2884 ) ( not ( = ?AUTO_2884 ?AUTO_2886 ) ) ( not ( = ?AUTO_2881 ?AUTO_2884 ) ) ( not ( = ?AUTO_2885 ?AUTO_2884 ) ) ( OBJ-AT ?AUTO_2880 ?AUTO_2884 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2880 ?AUTO_2887 ?AUTO_2884 )
      ( DELIVER-PKG ?AUTO_2880 ?AUTO_2881 )
      ( DELIVER-PKG-VERIFY ?AUTO_2880 ?AUTO_2881 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2888 - OBJ
      ?AUTO_2889 - LOCATION
    )
    :vars
    (
      ?AUTO_2895 - LOCATION
      ?AUTO_2891 - CITY
      ?AUTO_2890 - TRUCK
      ?AUTO_2894 - LOCATION
      ?AUTO_2892 - LOCATION
      ?AUTO_2896 - LOCATION
      ?AUTO_2893 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2895 ?AUTO_2891 ) ( IN-CITY ?AUTO_2889 ?AUTO_2891 ) ( not ( = ?AUTO_2889 ?AUTO_2895 ) ) ( TRUCK-AT ?AUTO_2890 ?AUTO_2894 ) ( IN-CITY ?AUTO_2894 ?AUTO_2891 ) ( not ( = ?AUTO_2895 ?AUTO_2894 ) ) ( not ( = ?AUTO_2889 ?AUTO_2894 ) ) ( AIRPORT ?AUTO_2892 ) ( AIRPORT ?AUTO_2895 ) ( not ( = ?AUTO_2892 ?AUTO_2895 ) ) ( not ( = ?AUTO_2889 ?AUTO_2892 ) ) ( not ( = ?AUTO_2894 ?AUTO_2892 ) ) ( OBJ-AT ?AUTO_2888 ?AUTO_2892 ) ( AIRPORT ?AUTO_2896 ) ( AIRPLANE-AT ?AUTO_2893 ?AUTO_2896 ) ( not ( = ?AUTO_2896 ?AUTO_2892 ) ) ( not ( = ?AUTO_2889 ?AUTO_2896 ) ) ( not ( = ?AUTO_2895 ?AUTO_2896 ) ) ( not ( = ?AUTO_2894 ?AUTO_2896 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2893 ?AUTO_2896 ?AUTO_2892 )
      ( DELIVER-PKG ?AUTO_2888 ?AUTO_2889 )
      ( DELIVER-PKG-VERIFY ?AUTO_2888 ?AUTO_2889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2897 - OBJ
      ?AUTO_2898 - LOCATION
    )
    :vars
    (
      ?AUTO_2902 - LOCATION
      ?AUTO_2900 - CITY
      ?AUTO_2903 - TRUCK
      ?AUTO_2899 - LOCATION
      ?AUTO_2901 - LOCATION
      ?AUTO_2905 - LOCATION
      ?AUTO_2904 - AIRPLANE
      ?AUTO_2906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2902 ?AUTO_2900 ) ( IN-CITY ?AUTO_2898 ?AUTO_2900 ) ( not ( = ?AUTO_2898 ?AUTO_2902 ) ) ( TRUCK-AT ?AUTO_2903 ?AUTO_2899 ) ( IN-CITY ?AUTO_2899 ?AUTO_2900 ) ( not ( = ?AUTO_2902 ?AUTO_2899 ) ) ( not ( = ?AUTO_2898 ?AUTO_2899 ) ) ( AIRPORT ?AUTO_2901 ) ( AIRPORT ?AUTO_2902 ) ( not ( = ?AUTO_2901 ?AUTO_2902 ) ) ( not ( = ?AUTO_2898 ?AUTO_2901 ) ) ( not ( = ?AUTO_2899 ?AUTO_2901 ) ) ( AIRPORT ?AUTO_2905 ) ( AIRPLANE-AT ?AUTO_2904 ?AUTO_2905 ) ( not ( = ?AUTO_2905 ?AUTO_2901 ) ) ( not ( = ?AUTO_2898 ?AUTO_2905 ) ) ( not ( = ?AUTO_2902 ?AUTO_2905 ) ) ( not ( = ?AUTO_2899 ?AUTO_2905 ) ) ( TRUCK-AT ?AUTO_2906 ?AUTO_2901 ) ( IN-TRUCK ?AUTO_2897 ?AUTO_2906 ) ( not ( = ?AUTO_2903 ?AUTO_2906 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2897 ?AUTO_2906 ?AUTO_2901 )
      ( DELIVER-PKG ?AUTO_2897 ?AUTO_2898 )
      ( DELIVER-PKG-VERIFY ?AUTO_2897 ?AUTO_2898 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2907 - OBJ
      ?AUTO_2908 - LOCATION
    )
    :vars
    (
      ?AUTO_2915 - LOCATION
      ?AUTO_2914 - CITY
      ?AUTO_2916 - TRUCK
      ?AUTO_2910 - LOCATION
      ?AUTO_2913 - LOCATION
      ?AUTO_2911 - LOCATION
      ?AUTO_2912 - AIRPLANE
      ?AUTO_2909 - TRUCK
      ?AUTO_2917 - LOCATION
      ?AUTO_2918 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2915 ?AUTO_2914 ) ( IN-CITY ?AUTO_2908 ?AUTO_2914 ) ( not ( = ?AUTO_2908 ?AUTO_2915 ) ) ( TRUCK-AT ?AUTO_2916 ?AUTO_2910 ) ( IN-CITY ?AUTO_2910 ?AUTO_2914 ) ( not ( = ?AUTO_2915 ?AUTO_2910 ) ) ( not ( = ?AUTO_2908 ?AUTO_2910 ) ) ( AIRPORT ?AUTO_2913 ) ( AIRPORT ?AUTO_2915 ) ( not ( = ?AUTO_2913 ?AUTO_2915 ) ) ( not ( = ?AUTO_2908 ?AUTO_2913 ) ) ( not ( = ?AUTO_2910 ?AUTO_2913 ) ) ( AIRPORT ?AUTO_2911 ) ( AIRPLANE-AT ?AUTO_2912 ?AUTO_2911 ) ( not ( = ?AUTO_2911 ?AUTO_2913 ) ) ( not ( = ?AUTO_2908 ?AUTO_2911 ) ) ( not ( = ?AUTO_2915 ?AUTO_2911 ) ) ( not ( = ?AUTO_2910 ?AUTO_2911 ) ) ( IN-TRUCK ?AUTO_2907 ?AUTO_2909 ) ( not ( = ?AUTO_2916 ?AUTO_2909 ) ) ( TRUCK-AT ?AUTO_2909 ?AUTO_2917 ) ( IN-CITY ?AUTO_2917 ?AUTO_2918 ) ( IN-CITY ?AUTO_2913 ?AUTO_2918 ) ( not ( = ?AUTO_2913 ?AUTO_2917 ) ) ( not ( = ?AUTO_2908 ?AUTO_2917 ) ) ( not ( = ?AUTO_2915 ?AUTO_2917 ) ) ( not ( = ?AUTO_2914 ?AUTO_2918 ) ) ( not ( = ?AUTO_2910 ?AUTO_2917 ) ) ( not ( = ?AUTO_2911 ?AUTO_2917 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2909 ?AUTO_2917 ?AUTO_2913 ?AUTO_2918 )
      ( DELIVER-PKG ?AUTO_2907 ?AUTO_2908 )
      ( DELIVER-PKG-VERIFY ?AUTO_2907 ?AUTO_2908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2919 - OBJ
      ?AUTO_2920 - LOCATION
    )
    :vars
    (
      ?AUTO_2925 - LOCATION
      ?AUTO_2922 - CITY
      ?AUTO_2923 - TRUCK
      ?AUTO_2921 - LOCATION
      ?AUTO_2926 - LOCATION
      ?AUTO_2929 - LOCATION
      ?AUTO_2930 - AIRPLANE
      ?AUTO_2924 - TRUCK
      ?AUTO_2927 - LOCATION
      ?AUTO_2928 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2925 ?AUTO_2922 ) ( IN-CITY ?AUTO_2920 ?AUTO_2922 ) ( not ( = ?AUTO_2920 ?AUTO_2925 ) ) ( TRUCK-AT ?AUTO_2923 ?AUTO_2921 ) ( IN-CITY ?AUTO_2921 ?AUTO_2922 ) ( not ( = ?AUTO_2925 ?AUTO_2921 ) ) ( not ( = ?AUTO_2920 ?AUTO_2921 ) ) ( AIRPORT ?AUTO_2926 ) ( AIRPORT ?AUTO_2925 ) ( not ( = ?AUTO_2926 ?AUTO_2925 ) ) ( not ( = ?AUTO_2920 ?AUTO_2926 ) ) ( not ( = ?AUTO_2921 ?AUTO_2926 ) ) ( AIRPORT ?AUTO_2929 ) ( AIRPLANE-AT ?AUTO_2930 ?AUTO_2929 ) ( not ( = ?AUTO_2929 ?AUTO_2926 ) ) ( not ( = ?AUTO_2920 ?AUTO_2929 ) ) ( not ( = ?AUTO_2925 ?AUTO_2929 ) ) ( not ( = ?AUTO_2921 ?AUTO_2929 ) ) ( not ( = ?AUTO_2923 ?AUTO_2924 ) ) ( TRUCK-AT ?AUTO_2924 ?AUTO_2927 ) ( IN-CITY ?AUTO_2927 ?AUTO_2928 ) ( IN-CITY ?AUTO_2926 ?AUTO_2928 ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2920 ?AUTO_2927 ) ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2922 ?AUTO_2928 ) ) ( not ( = ?AUTO_2921 ?AUTO_2927 ) ) ( not ( = ?AUTO_2929 ?AUTO_2927 ) ) ( OBJ-AT ?AUTO_2919 ?AUTO_2927 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2919 ?AUTO_2924 ?AUTO_2927 )
      ( DELIVER-PKG ?AUTO_2919 ?AUTO_2920 )
      ( DELIVER-PKG-VERIFY ?AUTO_2919 ?AUTO_2920 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2931 - OBJ
      ?AUTO_2932 - LOCATION
    )
    :vars
    (
      ?AUTO_2939 - LOCATION
      ?AUTO_2933 - CITY
      ?AUTO_2941 - TRUCK
      ?AUTO_2934 - LOCATION
      ?AUTO_2940 - LOCATION
      ?AUTO_2935 - LOCATION
      ?AUTO_2936 - AIRPLANE
      ?AUTO_2942 - TRUCK
      ?AUTO_2937 - LOCATION
      ?AUTO_2938 - CITY
      ?AUTO_2943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2939 ?AUTO_2933 ) ( IN-CITY ?AUTO_2932 ?AUTO_2933 ) ( not ( = ?AUTO_2932 ?AUTO_2939 ) ) ( TRUCK-AT ?AUTO_2941 ?AUTO_2934 ) ( IN-CITY ?AUTO_2934 ?AUTO_2933 ) ( not ( = ?AUTO_2939 ?AUTO_2934 ) ) ( not ( = ?AUTO_2932 ?AUTO_2934 ) ) ( AIRPORT ?AUTO_2940 ) ( AIRPORT ?AUTO_2939 ) ( not ( = ?AUTO_2940 ?AUTO_2939 ) ) ( not ( = ?AUTO_2932 ?AUTO_2940 ) ) ( not ( = ?AUTO_2934 ?AUTO_2940 ) ) ( AIRPORT ?AUTO_2935 ) ( AIRPLANE-AT ?AUTO_2936 ?AUTO_2935 ) ( not ( = ?AUTO_2935 ?AUTO_2940 ) ) ( not ( = ?AUTO_2932 ?AUTO_2935 ) ) ( not ( = ?AUTO_2939 ?AUTO_2935 ) ) ( not ( = ?AUTO_2934 ?AUTO_2935 ) ) ( not ( = ?AUTO_2941 ?AUTO_2942 ) ) ( IN-CITY ?AUTO_2937 ?AUTO_2938 ) ( IN-CITY ?AUTO_2940 ?AUTO_2938 ) ( not ( = ?AUTO_2940 ?AUTO_2937 ) ) ( not ( = ?AUTO_2932 ?AUTO_2937 ) ) ( not ( = ?AUTO_2939 ?AUTO_2937 ) ) ( not ( = ?AUTO_2933 ?AUTO_2938 ) ) ( not ( = ?AUTO_2934 ?AUTO_2937 ) ) ( not ( = ?AUTO_2935 ?AUTO_2937 ) ) ( OBJ-AT ?AUTO_2931 ?AUTO_2937 ) ( TRUCK-AT ?AUTO_2942 ?AUTO_2943 ) ( IN-CITY ?AUTO_2943 ?AUTO_2938 ) ( not ( = ?AUTO_2937 ?AUTO_2943 ) ) ( not ( = ?AUTO_2932 ?AUTO_2943 ) ) ( not ( = ?AUTO_2939 ?AUTO_2943 ) ) ( not ( = ?AUTO_2934 ?AUTO_2943 ) ) ( not ( = ?AUTO_2940 ?AUTO_2943 ) ) ( not ( = ?AUTO_2935 ?AUTO_2943 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2942 ?AUTO_2943 ?AUTO_2937 ?AUTO_2938 )
      ( DELIVER-PKG ?AUTO_2931 ?AUTO_2932 )
      ( DELIVER-PKG-VERIFY ?AUTO_2931 ?AUTO_2932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2946 - OBJ
      ?AUTO_2947 - LOCATION
    )
    :vars
    (
      ?AUTO_2948 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2948 ?AUTO_2947 ) ( IN-TRUCK ?AUTO_2946 ?AUTO_2948 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2946 ?AUTO_2948 ?AUTO_2947 )
      ( DELIVER-PKG-VERIFY ?AUTO_2946 ?AUTO_2947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2949 - OBJ
      ?AUTO_2950 - LOCATION
    )
    :vars
    (
      ?AUTO_2951 - TRUCK
      ?AUTO_2952 - LOCATION
      ?AUTO_2953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2949 ?AUTO_2951 ) ( TRUCK-AT ?AUTO_2951 ?AUTO_2952 ) ( IN-CITY ?AUTO_2952 ?AUTO_2953 ) ( IN-CITY ?AUTO_2950 ?AUTO_2953 ) ( not ( = ?AUTO_2950 ?AUTO_2952 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2951 ?AUTO_2952 ?AUTO_2950 ?AUTO_2953 )
      ( DELIVER-PKG ?AUTO_2949 ?AUTO_2950 )
      ( DELIVER-PKG-VERIFY ?AUTO_2949 ?AUTO_2950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2964 - OBJ
      ?AUTO_2965 - LOCATION
    )
    :vars
    (
      ?AUTO_2968 - TRUCK
      ?AUTO_2967 - LOCATION
      ?AUTO_2966 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2968 ?AUTO_2967 ) ( IN-CITY ?AUTO_2967 ?AUTO_2966 ) ( IN-CITY ?AUTO_2965 ?AUTO_2966 ) ( not ( = ?AUTO_2965 ?AUTO_2967 ) ) ( OBJ-AT ?AUTO_2964 ?AUTO_2967 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2964 ?AUTO_2968 ?AUTO_2967 )
      ( DELIVER-PKG ?AUTO_2964 ?AUTO_2965 )
      ( DELIVER-PKG-VERIFY ?AUTO_2964 ?AUTO_2965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2971 - OBJ
      ?AUTO_2972 - LOCATION
    )
    :vars
    (
      ?AUTO_2973 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2973 ?AUTO_2972 ) ( IN-TRUCK ?AUTO_2971 ?AUTO_2973 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2971 ?AUTO_2973 ?AUTO_2972 )
      ( DELIVER-PKG-VERIFY ?AUTO_2971 ?AUTO_2972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2982 - OBJ
      ?AUTO_2983 - LOCATION
    )
    :vars
    (
      ?AUTO_2984 - TRUCK
      ?AUTO_2985 - LOCATION
      ?AUTO_2986 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2984 ?AUTO_2985 ) ( IN-CITY ?AUTO_2985 ?AUTO_2986 ) ( IN-CITY ?AUTO_2983 ?AUTO_2986 ) ( not ( = ?AUTO_2983 ?AUTO_2985 ) ) ( OBJ-AT ?AUTO_2982 ?AUTO_2985 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2982 ?AUTO_2984 ?AUTO_2985 )
      ( DELIVER-PKG ?AUTO_2982 ?AUTO_2983 )
      ( DELIVER-PKG-VERIFY ?AUTO_2982 ?AUTO_2983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2989 - OBJ
      ?AUTO_2990 - LOCATION
    )
    :vars
    (
      ?AUTO_2992 - LOCATION
      ?AUTO_2993 - CITY
      ?AUTO_2991 - TRUCK
      ?AUTO_2994 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2992 ?AUTO_2993 ) ( IN-CITY ?AUTO_2990 ?AUTO_2993 ) ( not ( = ?AUTO_2990 ?AUTO_2992 ) ) ( OBJ-AT ?AUTO_2989 ?AUTO_2992 ) ( TRUCK-AT ?AUTO_2991 ?AUTO_2994 ) ( IN-CITY ?AUTO_2994 ?AUTO_2993 ) ( not ( = ?AUTO_2992 ?AUTO_2994 ) ) ( not ( = ?AUTO_2990 ?AUTO_2994 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2991 ?AUTO_2994 ?AUTO_2992 ?AUTO_2993 )
      ( DELIVER-PKG ?AUTO_2989 ?AUTO_2990 )
      ( DELIVER-PKG-VERIFY ?AUTO_2989 ?AUTO_2990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2999 - OBJ
      ?AUTO_3000 - LOCATION
    )
    :vars
    (
      ?AUTO_3001 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3001 ?AUTO_3000 ) ( IN-TRUCK ?AUTO_2999 ?AUTO_3001 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2999 ?AUTO_3001 ?AUTO_3000 )
      ( DELIVER-PKG-VERIFY ?AUTO_2999 ?AUTO_3000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3010 - OBJ
      ?AUTO_3011 - LOCATION
    )
    :vars
    (
      ?AUTO_3012 - TRUCK
      ?AUTO_3013 - LOCATION
      ?AUTO_3014 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3012 ?AUTO_3013 ) ( IN-CITY ?AUTO_3013 ?AUTO_3014 ) ( IN-CITY ?AUTO_3011 ?AUTO_3014 ) ( not ( = ?AUTO_3011 ?AUTO_3013 ) ) ( OBJ-AT ?AUTO_3010 ?AUTO_3013 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3010 ?AUTO_3012 ?AUTO_3013 )
      ( DELIVER-PKG ?AUTO_3010 ?AUTO_3011 )
      ( DELIVER-PKG-VERIFY ?AUTO_3010 ?AUTO_3011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3017 - OBJ
      ?AUTO_3018 - LOCATION
    )
    :vars
    (
      ?AUTO_3020 - LOCATION
      ?AUTO_3021 - CITY
      ?AUTO_3019 - TRUCK
      ?AUTO_3022 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3020 ?AUTO_3021 ) ( IN-CITY ?AUTO_3018 ?AUTO_3021 ) ( not ( = ?AUTO_3018 ?AUTO_3020 ) ) ( OBJ-AT ?AUTO_3017 ?AUTO_3020 ) ( TRUCK-AT ?AUTO_3019 ?AUTO_3022 ) ( IN-CITY ?AUTO_3022 ?AUTO_3021 ) ( not ( = ?AUTO_3020 ?AUTO_3022 ) ) ( not ( = ?AUTO_3018 ?AUTO_3022 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3019 ?AUTO_3022 ?AUTO_3020 ?AUTO_3021 )
      ( DELIVER-PKG ?AUTO_3017 ?AUTO_3018 )
      ( DELIVER-PKG-VERIFY ?AUTO_3017 ?AUTO_3018 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3029 - OBJ
      ?AUTO_3030 - LOCATION
    )
    :vars
    (
      ?AUTO_3031 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3031 ?AUTO_3030 ) ( IN-TRUCK ?AUTO_3029 ?AUTO_3031 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3029 ?AUTO_3031 ?AUTO_3030 )
      ( DELIVER-PKG-VERIFY ?AUTO_3029 ?AUTO_3030 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3032 - OBJ
      ?AUTO_3033 - LOCATION
    )
    :vars
    (
      ?AUTO_3034 - TRUCK
      ?AUTO_3035 - LOCATION
      ?AUTO_3036 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3032 ?AUTO_3034 ) ( TRUCK-AT ?AUTO_3034 ?AUTO_3035 ) ( IN-CITY ?AUTO_3035 ?AUTO_3036 ) ( IN-CITY ?AUTO_3033 ?AUTO_3036 ) ( not ( = ?AUTO_3033 ?AUTO_3035 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3034 ?AUTO_3035 ?AUTO_3033 ?AUTO_3036 )
      ( DELIVER-PKG ?AUTO_3032 ?AUTO_3033 )
      ( DELIVER-PKG-VERIFY ?AUTO_3032 ?AUTO_3033 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3037 - OBJ
      ?AUTO_3038 - LOCATION
    )
    :vars
    (
      ?AUTO_3039 - TRUCK
      ?AUTO_3040 - LOCATION
      ?AUTO_3041 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3039 ?AUTO_3040 ) ( IN-CITY ?AUTO_3040 ?AUTO_3041 ) ( IN-CITY ?AUTO_3038 ?AUTO_3041 ) ( not ( = ?AUTO_3038 ?AUTO_3040 ) ) ( OBJ-AT ?AUTO_3037 ?AUTO_3040 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3037 ?AUTO_3039 ?AUTO_3040 )
      ( DELIVER-PKG ?AUTO_3037 ?AUTO_3038 )
      ( DELIVER-PKG-VERIFY ?AUTO_3037 ?AUTO_3038 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3042 - OBJ
      ?AUTO_3043 - LOCATION
    )
    :vars
    (
      ?AUTO_3044 - LOCATION
      ?AUTO_3046 - CITY
      ?AUTO_3045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3044 ?AUTO_3046 ) ( IN-CITY ?AUTO_3043 ?AUTO_3046 ) ( not ( = ?AUTO_3043 ?AUTO_3044 ) ) ( OBJ-AT ?AUTO_3042 ?AUTO_3044 ) ( TRUCK-AT ?AUTO_3045 ?AUTO_3043 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3045 ?AUTO_3043 ?AUTO_3044 ?AUTO_3046 )
      ( DELIVER-PKG ?AUTO_3042 ?AUTO_3043 )
      ( DELIVER-PKG-VERIFY ?AUTO_3042 ?AUTO_3043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3053 - OBJ
      ?AUTO_3054 - LOCATION
    )
    :vars
    (
      ?AUTO_3055 - LOCATION
      ?AUTO_3056 - CITY
      ?AUTO_3057 - TRUCK
      ?AUTO_3058 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3055 ?AUTO_3056 ) ( IN-CITY ?AUTO_3054 ?AUTO_3056 ) ( not ( = ?AUTO_3054 ?AUTO_3055 ) ) ( OBJ-AT ?AUTO_3053 ?AUTO_3055 ) ( TRUCK-AT ?AUTO_3057 ?AUTO_3058 ) ( IN-CITY ?AUTO_3058 ?AUTO_3056 ) ( not ( = ?AUTO_3054 ?AUTO_3058 ) ) ( not ( = ?AUTO_3055 ?AUTO_3058 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3057 ?AUTO_3058 ?AUTO_3054 ?AUTO_3056 )
      ( DELIVER-PKG ?AUTO_3053 ?AUTO_3054 )
      ( DELIVER-PKG-VERIFY ?AUTO_3053 ?AUTO_3054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3073 - OBJ
      ?AUTO_3074 - LOCATION
    )
    :vars
    (
      ?AUTO_3075 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3075 ?AUTO_3074 ) ( IN-TRUCK ?AUTO_3073 ?AUTO_3075 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3073 ?AUTO_3075 ?AUTO_3074 )
      ( DELIVER-PKG-VERIFY ?AUTO_3073 ?AUTO_3074 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3076 - OBJ
      ?AUTO_3077 - LOCATION
    )
    :vars
    (
      ?AUTO_3078 - TRUCK
      ?AUTO_3079 - LOCATION
      ?AUTO_3080 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3076 ?AUTO_3078 ) ( TRUCK-AT ?AUTO_3078 ?AUTO_3079 ) ( IN-CITY ?AUTO_3079 ?AUTO_3080 ) ( IN-CITY ?AUTO_3077 ?AUTO_3080 ) ( not ( = ?AUTO_3077 ?AUTO_3079 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3078 ?AUTO_3079 ?AUTO_3077 ?AUTO_3080 )
      ( DELIVER-PKG ?AUTO_3076 ?AUTO_3077 )
      ( DELIVER-PKG-VERIFY ?AUTO_3076 ?AUTO_3077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3081 - OBJ
      ?AUTO_3082 - LOCATION
    )
    :vars
    (
      ?AUTO_3084 - TRUCK
      ?AUTO_3085 - LOCATION
      ?AUTO_3083 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3084 ?AUTO_3085 ) ( IN-CITY ?AUTO_3085 ?AUTO_3083 ) ( IN-CITY ?AUTO_3082 ?AUTO_3083 ) ( not ( = ?AUTO_3082 ?AUTO_3085 ) ) ( OBJ-AT ?AUTO_3081 ?AUTO_3085 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3081 ?AUTO_3084 ?AUTO_3085 )
      ( DELIVER-PKG ?AUTO_3081 ?AUTO_3082 )
      ( DELIVER-PKG-VERIFY ?AUTO_3081 ?AUTO_3082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3086 - OBJ
      ?AUTO_3087 - LOCATION
    )
    :vars
    (
      ?AUTO_3090 - LOCATION
      ?AUTO_3089 - CITY
      ?AUTO_3088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3090 ?AUTO_3089 ) ( IN-CITY ?AUTO_3087 ?AUTO_3089 ) ( not ( = ?AUTO_3087 ?AUTO_3090 ) ) ( OBJ-AT ?AUTO_3086 ?AUTO_3090 ) ( TRUCK-AT ?AUTO_3088 ?AUTO_3087 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3088 ?AUTO_3087 ?AUTO_3090 ?AUTO_3089 )
      ( DELIVER-PKG ?AUTO_3086 ?AUTO_3087 )
      ( DELIVER-PKG-VERIFY ?AUTO_3086 ?AUTO_3087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3121 - OBJ
      ?AUTO_3122 - LOCATION
    )
    :vars
    (
      ?AUTO_3123 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3121 ?AUTO_3123 ) ( AIRPLANE-AT ?AUTO_3123 ?AUTO_3122 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3121 ?AUTO_3123 ?AUTO_3122 )
      ( DELIVER-PKG-VERIFY ?AUTO_3121 ?AUTO_3122 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3124 - OBJ
      ?AUTO_3125 - LOCATION
    )
    :vars
    (
      ?AUTO_3126 - AIRPLANE
      ?AUTO_3127 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3124 ?AUTO_3126 ) ( AIRPORT ?AUTO_3127 ) ( AIRPORT ?AUTO_3125 ) ( AIRPLANE-AT ?AUTO_3126 ?AUTO_3127 ) ( not ( = ?AUTO_3127 ?AUTO_3125 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3126 ?AUTO_3127 ?AUTO_3125 )
      ( DELIVER-PKG ?AUTO_3124 ?AUTO_3125 )
      ( DELIVER-PKG-VERIFY ?AUTO_3124 ?AUTO_3125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3128 - OBJ
      ?AUTO_3129 - LOCATION
    )
    :vars
    (
      ?AUTO_3131 - LOCATION
      ?AUTO_3130 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3131 ) ( AIRPORT ?AUTO_3129 ) ( AIRPLANE-AT ?AUTO_3130 ?AUTO_3131 ) ( not ( = ?AUTO_3131 ?AUTO_3129 ) ) ( OBJ-AT ?AUTO_3128 ?AUTO_3131 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3128 ?AUTO_3130 ?AUTO_3131 )
      ( DELIVER-PKG ?AUTO_3128 ?AUTO_3129 )
      ( DELIVER-PKG-VERIFY ?AUTO_3128 ?AUTO_3129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3132 - OBJ
      ?AUTO_3133 - LOCATION
    )
    :vars
    (
      ?AUTO_3135 - LOCATION
      ?AUTO_3134 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3135 ) ( AIRPORT ?AUTO_3133 ) ( not ( = ?AUTO_3135 ?AUTO_3133 ) ) ( OBJ-AT ?AUTO_3132 ?AUTO_3135 ) ( AIRPLANE-AT ?AUTO_3134 ?AUTO_3133 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3134 ?AUTO_3133 ?AUTO_3135 )
      ( DELIVER-PKG ?AUTO_3132 ?AUTO_3133 )
      ( DELIVER-PKG-VERIFY ?AUTO_3132 ?AUTO_3133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3176 - OBJ
      ?AUTO_3177 - LOCATION
    )
    :vars
    (
      ?AUTO_3178 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3178 ?AUTO_3177 ) ( IN-TRUCK ?AUTO_3176 ?AUTO_3178 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3176 ?AUTO_3178 ?AUTO_3177 )
      ( DELIVER-PKG-VERIFY ?AUTO_3176 ?AUTO_3177 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3185 - OBJ
      ?AUTO_3186 - LOCATION
    )
    :vars
    (
      ?AUTO_3187 - TRUCK
      ?AUTO_3188 - LOCATION
      ?AUTO_3189 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3185 ?AUTO_3187 ) ( TRUCK-AT ?AUTO_3187 ?AUTO_3188 ) ( IN-CITY ?AUTO_3188 ?AUTO_3189 ) ( IN-CITY ?AUTO_3186 ?AUTO_3189 ) ( not ( = ?AUTO_3186 ?AUTO_3188 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3187 ?AUTO_3188 ?AUTO_3186 ?AUTO_3189 )
      ( DELIVER-PKG ?AUTO_3185 ?AUTO_3186 )
      ( DELIVER-PKG-VERIFY ?AUTO_3185 ?AUTO_3186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3190 - OBJ
      ?AUTO_3191 - LOCATION
    )
    :vars
    (
      ?AUTO_3192 - TRUCK
      ?AUTO_3193 - LOCATION
      ?AUTO_3194 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3192 ?AUTO_3193 ) ( IN-CITY ?AUTO_3193 ?AUTO_3194 ) ( IN-CITY ?AUTO_3191 ?AUTO_3194 ) ( not ( = ?AUTO_3191 ?AUTO_3193 ) ) ( OBJ-AT ?AUTO_3190 ?AUTO_3193 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3190 ?AUTO_3192 ?AUTO_3193 )
      ( DELIVER-PKG ?AUTO_3190 ?AUTO_3191 )
      ( DELIVER-PKG-VERIFY ?AUTO_3190 ?AUTO_3191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3195 - OBJ
      ?AUTO_3196 - LOCATION
    )
    :vars
    (
      ?AUTO_3198 - TRUCK
      ?AUTO_3197 - LOCATION
      ?AUTO_3199 - CITY
      ?AUTO_3200 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3198 ?AUTO_3197 ) ( IN-CITY ?AUTO_3197 ?AUTO_3199 ) ( IN-CITY ?AUTO_3196 ?AUTO_3199 ) ( not ( = ?AUTO_3196 ?AUTO_3197 ) ) ( IN-AIRPLANE ?AUTO_3195 ?AUTO_3200 ) ( AIRPLANE-AT ?AUTO_3200 ?AUTO_3197 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3195 ?AUTO_3200 ?AUTO_3197 )
      ( DELIVER-PKG ?AUTO_3195 ?AUTO_3196 )
      ( DELIVER-PKG-VERIFY ?AUTO_3195 ?AUTO_3196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3201 - OBJ
      ?AUTO_3202 - LOCATION
    )
    :vars
    (
      ?AUTO_3203 - TRUCK
      ?AUTO_3205 - LOCATION
      ?AUTO_3204 - CITY
      ?AUTO_3206 - AIRPLANE
      ?AUTO_3207 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3203 ?AUTO_3205 ) ( IN-CITY ?AUTO_3205 ?AUTO_3204 ) ( IN-CITY ?AUTO_3202 ?AUTO_3204 ) ( not ( = ?AUTO_3202 ?AUTO_3205 ) ) ( IN-AIRPLANE ?AUTO_3201 ?AUTO_3206 ) ( AIRPORT ?AUTO_3207 ) ( AIRPORT ?AUTO_3205 ) ( AIRPLANE-AT ?AUTO_3206 ?AUTO_3207 ) ( not ( = ?AUTO_3207 ?AUTO_3205 ) ) ( not ( = ?AUTO_3202 ?AUTO_3207 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3206 ?AUTO_3207 ?AUTO_3205 )
      ( DELIVER-PKG ?AUTO_3201 ?AUTO_3202 )
      ( DELIVER-PKG-VERIFY ?AUTO_3201 ?AUTO_3202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3208 - OBJ
      ?AUTO_3209 - LOCATION
    )
    :vars
    (
      ?AUTO_3211 - TRUCK
      ?AUTO_3212 - LOCATION
      ?AUTO_3210 - CITY
      ?AUTO_3213 - LOCATION
      ?AUTO_3214 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3211 ?AUTO_3212 ) ( IN-CITY ?AUTO_3212 ?AUTO_3210 ) ( IN-CITY ?AUTO_3209 ?AUTO_3210 ) ( not ( = ?AUTO_3209 ?AUTO_3212 ) ) ( AIRPORT ?AUTO_3213 ) ( AIRPORT ?AUTO_3212 ) ( AIRPLANE-AT ?AUTO_3214 ?AUTO_3213 ) ( not ( = ?AUTO_3213 ?AUTO_3212 ) ) ( not ( = ?AUTO_3209 ?AUTO_3213 ) ) ( OBJ-AT ?AUTO_3208 ?AUTO_3213 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3208 ?AUTO_3214 ?AUTO_3213 )
      ( DELIVER-PKG ?AUTO_3208 ?AUTO_3209 )
      ( DELIVER-PKG-VERIFY ?AUTO_3208 ?AUTO_3209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3215 - OBJ
      ?AUTO_3216 - LOCATION
    )
    :vars
    (
      ?AUTO_3220 - TRUCK
      ?AUTO_3217 - LOCATION
      ?AUTO_3221 - CITY
      ?AUTO_3218 - LOCATION
      ?AUTO_3219 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3220 ?AUTO_3217 ) ( IN-CITY ?AUTO_3217 ?AUTO_3221 ) ( IN-CITY ?AUTO_3216 ?AUTO_3221 ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) ( AIRPORT ?AUTO_3218 ) ( AIRPORT ?AUTO_3217 ) ( not ( = ?AUTO_3218 ?AUTO_3217 ) ) ( not ( = ?AUTO_3216 ?AUTO_3218 ) ) ( OBJ-AT ?AUTO_3215 ?AUTO_3218 ) ( AIRPLANE-AT ?AUTO_3219 ?AUTO_3217 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3219 ?AUTO_3217 ?AUTO_3218 )
      ( DELIVER-PKG ?AUTO_3215 ?AUTO_3216 )
      ( DELIVER-PKG-VERIFY ?AUTO_3215 ?AUTO_3216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3226 - OBJ
      ?AUTO_3227 - LOCATION
    )
    :vars
    (
      ?AUTO_3230 - LOCATION
      ?AUTO_3232 - CITY
      ?AUTO_3229 - LOCATION
      ?AUTO_3231 - AIRPLANE
      ?AUTO_3228 - TRUCK
      ?AUTO_3233 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3230 ?AUTO_3232 ) ( IN-CITY ?AUTO_3227 ?AUTO_3232 ) ( not ( = ?AUTO_3227 ?AUTO_3230 ) ) ( AIRPORT ?AUTO_3229 ) ( AIRPORT ?AUTO_3230 ) ( not ( = ?AUTO_3229 ?AUTO_3230 ) ) ( not ( = ?AUTO_3227 ?AUTO_3229 ) ) ( OBJ-AT ?AUTO_3226 ?AUTO_3229 ) ( AIRPLANE-AT ?AUTO_3231 ?AUTO_3230 ) ( TRUCK-AT ?AUTO_3228 ?AUTO_3233 ) ( IN-CITY ?AUTO_3233 ?AUTO_3232 ) ( not ( = ?AUTO_3230 ?AUTO_3233 ) ) ( not ( = ?AUTO_3227 ?AUTO_3233 ) ) ( not ( = ?AUTO_3229 ?AUTO_3233 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3228 ?AUTO_3233 ?AUTO_3230 ?AUTO_3232 )
      ( DELIVER-PKG ?AUTO_3226 ?AUTO_3227 )
      ( DELIVER-PKG-VERIFY ?AUTO_3226 ?AUTO_3227 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3268 - OBJ
      ?AUTO_3269 - LOCATION
    )
    :vars
    (
      ?AUTO_3270 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3268 ?AUTO_3270 ) ( AIRPLANE-AT ?AUTO_3270 ?AUTO_3269 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3268 ?AUTO_3270 ?AUTO_3269 )
      ( DELIVER-PKG-VERIFY ?AUTO_3268 ?AUTO_3269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3271 - OBJ
      ?AUTO_3272 - LOCATION
    )
    :vars
    (
      ?AUTO_3273 - AIRPLANE
      ?AUTO_3274 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3271 ?AUTO_3273 ) ( AIRPORT ?AUTO_3274 ) ( AIRPORT ?AUTO_3272 ) ( AIRPLANE-AT ?AUTO_3273 ?AUTO_3274 ) ( not ( = ?AUTO_3274 ?AUTO_3272 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3273 ?AUTO_3274 ?AUTO_3272 )
      ( DELIVER-PKG ?AUTO_3271 ?AUTO_3272 )
      ( DELIVER-PKG-VERIFY ?AUTO_3271 ?AUTO_3272 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3297 - OBJ
      ?AUTO_3298 - LOCATION
    )
    :vars
    (
      ?AUTO_3300 - LOCATION
      ?AUTO_3299 - AIRPLANE
      ?AUTO_3301 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3300 ) ( AIRPORT ?AUTO_3298 ) ( AIRPLANE-AT ?AUTO_3299 ?AUTO_3300 ) ( not ( = ?AUTO_3300 ?AUTO_3298 ) ) ( TRUCK-AT ?AUTO_3301 ?AUTO_3300 ) ( IN-TRUCK ?AUTO_3297 ?AUTO_3301 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3297 ?AUTO_3301 ?AUTO_3300 )
      ( DELIVER-PKG ?AUTO_3297 ?AUTO_3298 )
      ( DELIVER-PKG-VERIFY ?AUTO_3297 ?AUTO_3298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3302 - OBJ
      ?AUTO_3303 - LOCATION
    )
    :vars
    (
      ?AUTO_3305 - LOCATION
      ?AUTO_3304 - AIRPLANE
      ?AUTO_3306 - TRUCK
      ?AUTO_3307 - LOCATION
      ?AUTO_3308 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3305 ) ( AIRPORT ?AUTO_3303 ) ( AIRPLANE-AT ?AUTO_3304 ?AUTO_3305 ) ( not ( = ?AUTO_3305 ?AUTO_3303 ) ) ( IN-TRUCK ?AUTO_3302 ?AUTO_3306 ) ( TRUCK-AT ?AUTO_3306 ?AUTO_3307 ) ( IN-CITY ?AUTO_3307 ?AUTO_3308 ) ( IN-CITY ?AUTO_3305 ?AUTO_3308 ) ( not ( = ?AUTO_3305 ?AUTO_3307 ) ) ( not ( = ?AUTO_3303 ?AUTO_3307 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3306 ?AUTO_3307 ?AUTO_3305 ?AUTO_3308 )
      ( DELIVER-PKG ?AUTO_3302 ?AUTO_3303 )
      ( DELIVER-PKG-VERIFY ?AUTO_3302 ?AUTO_3303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3309 - OBJ
      ?AUTO_3310 - LOCATION
    )
    :vars
    (
      ?AUTO_3315 - LOCATION
      ?AUTO_3311 - AIRPLANE
      ?AUTO_3314 - TRUCK
      ?AUTO_3313 - LOCATION
      ?AUTO_3312 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3315 ) ( AIRPORT ?AUTO_3310 ) ( AIRPLANE-AT ?AUTO_3311 ?AUTO_3315 ) ( not ( = ?AUTO_3315 ?AUTO_3310 ) ) ( TRUCK-AT ?AUTO_3314 ?AUTO_3313 ) ( IN-CITY ?AUTO_3313 ?AUTO_3312 ) ( IN-CITY ?AUTO_3315 ?AUTO_3312 ) ( not ( = ?AUTO_3315 ?AUTO_3313 ) ) ( not ( = ?AUTO_3310 ?AUTO_3313 ) ) ( OBJ-AT ?AUTO_3309 ?AUTO_3313 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3309 ?AUTO_3314 ?AUTO_3313 )
      ( DELIVER-PKG ?AUTO_3309 ?AUTO_3310 )
      ( DELIVER-PKG-VERIFY ?AUTO_3309 ?AUTO_3310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3316 - OBJ
      ?AUTO_3317 - LOCATION
    )
    :vars
    (
      ?AUTO_3319 - LOCATION
      ?AUTO_3321 - AIRPLANE
      ?AUTO_3322 - LOCATION
      ?AUTO_3318 - CITY
      ?AUTO_3320 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3319 ) ( AIRPORT ?AUTO_3317 ) ( AIRPLANE-AT ?AUTO_3321 ?AUTO_3319 ) ( not ( = ?AUTO_3319 ?AUTO_3317 ) ) ( IN-CITY ?AUTO_3322 ?AUTO_3318 ) ( IN-CITY ?AUTO_3319 ?AUTO_3318 ) ( not ( = ?AUTO_3319 ?AUTO_3322 ) ) ( not ( = ?AUTO_3317 ?AUTO_3322 ) ) ( OBJ-AT ?AUTO_3316 ?AUTO_3322 ) ( TRUCK-AT ?AUTO_3320 ?AUTO_3319 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3320 ?AUTO_3319 ?AUTO_3322 ?AUTO_3318 )
      ( DELIVER-PKG ?AUTO_3316 ?AUTO_3317 )
      ( DELIVER-PKG-VERIFY ?AUTO_3316 ?AUTO_3317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3353 - OBJ
      ?AUTO_3354 - LOCATION
    )
    :vars
    (
      ?AUTO_3355 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3353 ?AUTO_3355 ) ( AIRPLANE-AT ?AUTO_3355 ?AUTO_3354 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3353 ?AUTO_3355 ?AUTO_3354 )
      ( DELIVER-PKG-VERIFY ?AUTO_3353 ?AUTO_3354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3364 - OBJ
      ?AUTO_3365 - LOCATION
    )
    :vars
    (
      ?AUTO_3366 - LOCATION
      ?AUTO_3367 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3366 ) ( AIRPORT ?AUTO_3365 ) ( AIRPLANE-AT ?AUTO_3367 ?AUTO_3366 ) ( not ( = ?AUTO_3366 ?AUTO_3365 ) ) ( OBJ-AT ?AUTO_3364 ?AUTO_3366 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3364 ?AUTO_3367 ?AUTO_3366 )
      ( DELIVER-PKG ?AUTO_3364 ?AUTO_3365 )
      ( DELIVER-PKG-VERIFY ?AUTO_3364 ?AUTO_3365 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3368 - OBJ
      ?AUTO_3369 - LOCATION
    )
    :vars
    (
      ?AUTO_3370 - LOCATION
      ?AUTO_3372 - LOCATION
      ?AUTO_3371 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3370 ) ( AIRPORT ?AUTO_3369 ) ( not ( = ?AUTO_3370 ?AUTO_3369 ) ) ( OBJ-AT ?AUTO_3368 ?AUTO_3370 ) ( AIRPORT ?AUTO_3372 ) ( AIRPLANE-AT ?AUTO_3371 ?AUTO_3372 ) ( not ( = ?AUTO_3372 ?AUTO_3370 ) ) ( not ( = ?AUTO_3369 ?AUTO_3372 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3371 ?AUTO_3372 ?AUTO_3370 )
      ( DELIVER-PKG ?AUTO_3368 ?AUTO_3369 )
      ( DELIVER-PKG-VERIFY ?AUTO_3368 ?AUTO_3369 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3395 - OBJ
      ?AUTO_3396 - LOCATION
    )
    :vars
    (
      ?AUTO_3399 - LOCATION
      ?AUTO_3398 - LOCATION
      ?AUTO_3397 - AIRPLANE
      ?AUTO_3400 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3399 ) ( AIRPORT ?AUTO_3396 ) ( not ( = ?AUTO_3399 ?AUTO_3396 ) ) ( AIRPORT ?AUTO_3398 ) ( AIRPLANE-AT ?AUTO_3397 ?AUTO_3398 ) ( not ( = ?AUTO_3398 ?AUTO_3399 ) ) ( not ( = ?AUTO_3396 ?AUTO_3398 ) ) ( TRUCK-AT ?AUTO_3400 ?AUTO_3399 ) ( IN-TRUCK ?AUTO_3395 ?AUTO_3400 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3395 ?AUTO_3400 ?AUTO_3399 )
      ( DELIVER-PKG ?AUTO_3395 ?AUTO_3396 )
      ( DELIVER-PKG-VERIFY ?AUTO_3395 ?AUTO_3396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3401 - OBJ
      ?AUTO_3402 - LOCATION
    )
    :vars
    (
      ?AUTO_3403 - LOCATION
      ?AUTO_3404 - LOCATION
      ?AUTO_3405 - AIRPLANE
      ?AUTO_3406 - TRUCK
      ?AUTO_3407 - LOCATION
      ?AUTO_3408 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3403 ) ( AIRPORT ?AUTO_3402 ) ( not ( = ?AUTO_3403 ?AUTO_3402 ) ) ( AIRPORT ?AUTO_3404 ) ( AIRPLANE-AT ?AUTO_3405 ?AUTO_3404 ) ( not ( = ?AUTO_3404 ?AUTO_3403 ) ) ( not ( = ?AUTO_3402 ?AUTO_3404 ) ) ( IN-TRUCK ?AUTO_3401 ?AUTO_3406 ) ( TRUCK-AT ?AUTO_3406 ?AUTO_3407 ) ( IN-CITY ?AUTO_3407 ?AUTO_3408 ) ( IN-CITY ?AUTO_3403 ?AUTO_3408 ) ( not ( = ?AUTO_3403 ?AUTO_3407 ) ) ( not ( = ?AUTO_3402 ?AUTO_3407 ) ) ( not ( = ?AUTO_3404 ?AUTO_3407 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3406 ?AUTO_3407 ?AUTO_3403 ?AUTO_3408 )
      ( DELIVER-PKG ?AUTO_3401 ?AUTO_3402 )
      ( DELIVER-PKG-VERIFY ?AUTO_3401 ?AUTO_3402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3409 - OBJ
      ?AUTO_3410 - LOCATION
    )
    :vars
    (
      ?AUTO_3414 - LOCATION
      ?AUTO_3412 - LOCATION
      ?AUTO_3411 - AIRPLANE
      ?AUTO_3413 - TRUCK
      ?AUTO_3416 - LOCATION
      ?AUTO_3415 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3414 ) ( AIRPORT ?AUTO_3410 ) ( not ( = ?AUTO_3414 ?AUTO_3410 ) ) ( AIRPORT ?AUTO_3412 ) ( AIRPLANE-AT ?AUTO_3411 ?AUTO_3412 ) ( not ( = ?AUTO_3412 ?AUTO_3414 ) ) ( not ( = ?AUTO_3410 ?AUTO_3412 ) ) ( TRUCK-AT ?AUTO_3413 ?AUTO_3416 ) ( IN-CITY ?AUTO_3416 ?AUTO_3415 ) ( IN-CITY ?AUTO_3414 ?AUTO_3415 ) ( not ( = ?AUTO_3414 ?AUTO_3416 ) ) ( not ( = ?AUTO_3410 ?AUTO_3416 ) ) ( not ( = ?AUTO_3412 ?AUTO_3416 ) ) ( OBJ-AT ?AUTO_3409 ?AUTO_3416 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3409 ?AUTO_3413 ?AUTO_3416 )
      ( DELIVER-PKG ?AUTO_3409 ?AUTO_3410 )
      ( DELIVER-PKG-VERIFY ?AUTO_3409 ?AUTO_3410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3417 - OBJ
      ?AUTO_3418 - LOCATION
    )
    :vars
    (
      ?AUTO_3419 - LOCATION
      ?AUTO_3421 - LOCATION
      ?AUTO_3422 - AIRPLANE
      ?AUTO_3423 - LOCATION
      ?AUTO_3424 - CITY
      ?AUTO_3420 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3419 ) ( AIRPORT ?AUTO_3418 ) ( not ( = ?AUTO_3419 ?AUTO_3418 ) ) ( AIRPORT ?AUTO_3421 ) ( AIRPLANE-AT ?AUTO_3422 ?AUTO_3421 ) ( not ( = ?AUTO_3421 ?AUTO_3419 ) ) ( not ( = ?AUTO_3418 ?AUTO_3421 ) ) ( IN-CITY ?AUTO_3423 ?AUTO_3424 ) ( IN-CITY ?AUTO_3419 ?AUTO_3424 ) ( not ( = ?AUTO_3419 ?AUTO_3423 ) ) ( not ( = ?AUTO_3418 ?AUTO_3423 ) ) ( not ( = ?AUTO_3421 ?AUTO_3423 ) ) ( OBJ-AT ?AUTO_3417 ?AUTO_3423 ) ( TRUCK-AT ?AUTO_3420 ?AUTO_3419 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3420 ?AUTO_3419 ?AUTO_3423 ?AUTO_3424 )
      ( DELIVER-PKG ?AUTO_3417 ?AUTO_3418 )
      ( DELIVER-PKG-VERIFY ?AUTO_3417 ?AUTO_3418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3431 - OBJ
      ?AUTO_3432 - LOCATION
    )
    :vars
    (
      ?AUTO_3436 - LOCATION
      ?AUTO_3433 - LOCATION
      ?AUTO_3437 - AIRPLANE
      ?AUTO_3435 - LOCATION
      ?AUTO_3438 - CITY
      ?AUTO_3434 - TRUCK
      ?AUTO_3439 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3436 ) ( AIRPORT ?AUTO_3432 ) ( not ( = ?AUTO_3436 ?AUTO_3432 ) ) ( AIRPORT ?AUTO_3433 ) ( AIRPLANE-AT ?AUTO_3437 ?AUTO_3433 ) ( not ( = ?AUTO_3433 ?AUTO_3436 ) ) ( not ( = ?AUTO_3432 ?AUTO_3433 ) ) ( IN-CITY ?AUTO_3435 ?AUTO_3438 ) ( IN-CITY ?AUTO_3436 ?AUTO_3438 ) ( not ( = ?AUTO_3436 ?AUTO_3435 ) ) ( not ( = ?AUTO_3432 ?AUTO_3435 ) ) ( not ( = ?AUTO_3433 ?AUTO_3435 ) ) ( OBJ-AT ?AUTO_3431 ?AUTO_3435 ) ( TRUCK-AT ?AUTO_3434 ?AUTO_3439 ) ( IN-CITY ?AUTO_3439 ?AUTO_3438 ) ( not ( = ?AUTO_3436 ?AUTO_3439 ) ) ( not ( = ?AUTO_3432 ?AUTO_3439 ) ) ( not ( = ?AUTO_3433 ?AUTO_3439 ) ) ( not ( = ?AUTO_3435 ?AUTO_3439 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3434 ?AUTO_3439 ?AUTO_3436 ?AUTO_3438 )
      ( DELIVER-PKG ?AUTO_3431 ?AUTO_3432 )
      ( DELIVER-PKG-VERIFY ?AUTO_3431 ?AUTO_3432 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3454 - OBJ
      ?AUTO_3455 - LOCATION
    )
    :vars
    (
      ?AUTO_3456 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3454 ?AUTO_3456 ) ( AIRPLANE-AT ?AUTO_3456 ?AUTO_3455 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3454 ?AUTO_3456 ?AUTO_3455 )
      ( DELIVER-PKG-VERIFY ?AUTO_3454 ?AUTO_3455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3459 - OBJ
      ?AUTO_3460 - LOCATION
    )
    :vars
    (
      ?AUTO_3461 - AIRPLANE
      ?AUTO_3462 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3459 ?AUTO_3461 ) ( AIRPORT ?AUTO_3462 ) ( AIRPORT ?AUTO_3460 ) ( AIRPLANE-AT ?AUTO_3461 ?AUTO_3462 ) ( not ( = ?AUTO_3462 ?AUTO_3460 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3461 ?AUTO_3462 ?AUTO_3460 )
      ( DELIVER-PKG ?AUTO_3459 ?AUTO_3460 )
      ( DELIVER-PKG-VERIFY ?AUTO_3459 ?AUTO_3460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3471 - OBJ
      ?AUTO_3472 - LOCATION
    )
    :vars
    (
      ?AUTO_3473 - LOCATION
      ?AUTO_3474 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3473 ) ( AIRPORT ?AUTO_3472 ) ( AIRPLANE-AT ?AUTO_3474 ?AUTO_3473 ) ( not ( = ?AUTO_3473 ?AUTO_3472 ) ) ( OBJ-AT ?AUTO_3471 ?AUTO_3473 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3471 ?AUTO_3474 ?AUTO_3473 )
      ( DELIVER-PKG ?AUTO_3471 ?AUTO_3472 )
      ( DELIVER-PKG-VERIFY ?AUTO_3471 ?AUTO_3472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3531 - OBJ
      ?AUTO_3532 - LOCATION
    )
    :vars
    (
      ?AUTO_3533 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3531 ?AUTO_3533 ) ( AIRPLANE-AT ?AUTO_3533 ?AUTO_3532 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3531 ?AUTO_3533 ?AUTO_3532 )
      ( DELIVER-PKG-VERIFY ?AUTO_3531 ?AUTO_3532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3534 - OBJ
      ?AUTO_3535 - LOCATION
    )
    :vars
    (
      ?AUTO_3536 - AIRPLANE
      ?AUTO_3537 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3534 ?AUTO_3536 ) ( AIRPORT ?AUTO_3537 ) ( AIRPORT ?AUTO_3535 ) ( AIRPLANE-AT ?AUTO_3536 ?AUTO_3537 ) ( not ( = ?AUTO_3537 ?AUTO_3535 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3536 ?AUTO_3537 ?AUTO_3535 )
      ( DELIVER-PKG ?AUTO_3534 ?AUTO_3535 )
      ( DELIVER-PKG-VERIFY ?AUTO_3534 ?AUTO_3535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3540 - OBJ
      ?AUTO_3541 - LOCATION
    )
    :vars
    (
      ?AUTO_3543 - LOCATION
      ?AUTO_3542 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3543 ) ( AIRPORT ?AUTO_3541 ) ( AIRPLANE-AT ?AUTO_3542 ?AUTO_3543 ) ( not ( = ?AUTO_3543 ?AUTO_3541 ) ) ( OBJ-AT ?AUTO_3540 ?AUTO_3543 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3540 ?AUTO_3542 ?AUTO_3543 )
      ( DELIVER-PKG ?AUTO_3540 ?AUTO_3541 )
      ( DELIVER-PKG-VERIFY ?AUTO_3540 ?AUTO_3541 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3544 - OBJ
      ?AUTO_3545 - LOCATION
    )
    :vars
    (
      ?AUTO_3547 - LOCATION
      ?AUTO_3548 - LOCATION
      ?AUTO_3546 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3547 ) ( AIRPORT ?AUTO_3545 ) ( not ( = ?AUTO_3547 ?AUTO_3545 ) ) ( OBJ-AT ?AUTO_3544 ?AUTO_3547 ) ( AIRPORT ?AUTO_3548 ) ( AIRPLANE-AT ?AUTO_3546 ?AUTO_3548 ) ( not ( = ?AUTO_3548 ?AUTO_3547 ) ) ( not ( = ?AUTO_3545 ?AUTO_3548 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3546 ?AUTO_3548 ?AUTO_3547 )
      ( DELIVER-PKG ?AUTO_3544 ?AUTO_3545 )
      ( DELIVER-PKG-VERIFY ?AUTO_3544 ?AUTO_3545 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3553 - OBJ
      ?AUTO_3554 - LOCATION
    )
    :vars
    (
      ?AUTO_3557 - LOCATION
      ?AUTO_3555 - LOCATION
      ?AUTO_3556 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3557 ) ( AIRPORT ?AUTO_3554 ) ( not ( = ?AUTO_3557 ?AUTO_3554 ) ) ( OBJ-AT ?AUTO_3553 ?AUTO_3557 ) ( AIRPORT ?AUTO_3555 ) ( not ( = ?AUTO_3555 ?AUTO_3557 ) ) ( not ( = ?AUTO_3554 ?AUTO_3555 ) ) ( AIRPLANE-AT ?AUTO_3556 ?AUTO_3554 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3556 ?AUTO_3554 ?AUTO_3555 )
      ( DELIVER-PKG ?AUTO_3553 ?AUTO_3554 )
      ( DELIVER-PKG-VERIFY ?AUTO_3553 ?AUTO_3554 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3618 - OBJ
      ?AUTO_3619 - LOCATION
    )
    :vars
    (
      ?AUTO_3620 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3620 ?AUTO_3619 ) ( IN-TRUCK ?AUTO_3618 ?AUTO_3620 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3618 ?AUTO_3620 ?AUTO_3619 )
      ( DELIVER-PKG-VERIFY ?AUTO_3618 ?AUTO_3619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3621 - OBJ
      ?AUTO_3622 - LOCATION
    )
    :vars
    (
      ?AUTO_3623 - TRUCK
      ?AUTO_3624 - LOCATION
      ?AUTO_3625 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3621 ?AUTO_3623 ) ( TRUCK-AT ?AUTO_3623 ?AUTO_3624 ) ( IN-CITY ?AUTO_3624 ?AUTO_3625 ) ( IN-CITY ?AUTO_3622 ?AUTO_3625 ) ( not ( = ?AUTO_3622 ?AUTO_3624 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3623 ?AUTO_3624 ?AUTO_3622 ?AUTO_3625 )
      ( DELIVER-PKG ?AUTO_3621 ?AUTO_3622 )
      ( DELIVER-PKG-VERIFY ?AUTO_3621 ?AUTO_3622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3626 - OBJ
      ?AUTO_3627 - LOCATION
    )
    :vars
    (
      ?AUTO_3628 - TRUCK
      ?AUTO_3629 - LOCATION
      ?AUTO_3630 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3628 ?AUTO_3629 ) ( IN-CITY ?AUTO_3629 ?AUTO_3630 ) ( IN-CITY ?AUTO_3627 ?AUTO_3630 ) ( not ( = ?AUTO_3627 ?AUTO_3629 ) ) ( OBJ-AT ?AUTO_3626 ?AUTO_3629 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3626 ?AUTO_3628 ?AUTO_3629 )
      ( DELIVER-PKG ?AUTO_3626 ?AUTO_3627 )
      ( DELIVER-PKG-VERIFY ?AUTO_3626 ?AUTO_3627 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3631 - OBJ
      ?AUTO_3632 - LOCATION
    )
    :vars
    (
      ?AUTO_3634 - TRUCK
      ?AUTO_3633 - LOCATION
      ?AUTO_3635 - CITY
      ?AUTO_3636 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3634 ?AUTO_3633 ) ( IN-CITY ?AUTO_3633 ?AUTO_3635 ) ( IN-CITY ?AUTO_3632 ?AUTO_3635 ) ( not ( = ?AUTO_3632 ?AUTO_3633 ) ) ( IN-AIRPLANE ?AUTO_3631 ?AUTO_3636 ) ( AIRPLANE-AT ?AUTO_3636 ?AUTO_3633 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3631 ?AUTO_3636 ?AUTO_3633 )
      ( DELIVER-PKG ?AUTO_3631 ?AUTO_3632 )
      ( DELIVER-PKG-VERIFY ?AUTO_3631 ?AUTO_3632 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3637 - OBJ
      ?AUTO_3638 - LOCATION
    )
    :vars
    (
      ?AUTO_3640 - TRUCK
      ?AUTO_3641 - LOCATION
      ?AUTO_3639 - CITY
      ?AUTO_3642 - AIRPLANE
      ?AUTO_3643 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3640 ?AUTO_3641 ) ( IN-CITY ?AUTO_3641 ?AUTO_3639 ) ( IN-CITY ?AUTO_3638 ?AUTO_3639 ) ( not ( = ?AUTO_3638 ?AUTO_3641 ) ) ( IN-AIRPLANE ?AUTO_3637 ?AUTO_3642 ) ( AIRPORT ?AUTO_3643 ) ( AIRPORT ?AUTO_3641 ) ( AIRPLANE-AT ?AUTO_3642 ?AUTO_3643 ) ( not ( = ?AUTO_3643 ?AUTO_3641 ) ) ( not ( = ?AUTO_3638 ?AUTO_3643 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3642 ?AUTO_3643 ?AUTO_3641 )
      ( DELIVER-PKG ?AUTO_3637 ?AUTO_3638 )
      ( DELIVER-PKG-VERIFY ?AUTO_3637 ?AUTO_3638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3646 - OBJ
      ?AUTO_3647 - LOCATION
    )
    :vars
    (
      ?AUTO_3650 - TRUCK
      ?AUTO_3649 - LOCATION
      ?AUTO_3652 - CITY
      ?AUTO_3648 - LOCATION
      ?AUTO_3651 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3650 ?AUTO_3649 ) ( IN-CITY ?AUTO_3649 ?AUTO_3652 ) ( IN-CITY ?AUTO_3647 ?AUTO_3652 ) ( not ( = ?AUTO_3647 ?AUTO_3649 ) ) ( AIRPORT ?AUTO_3648 ) ( AIRPORT ?AUTO_3649 ) ( AIRPLANE-AT ?AUTO_3651 ?AUTO_3648 ) ( not ( = ?AUTO_3648 ?AUTO_3649 ) ) ( not ( = ?AUTO_3647 ?AUTO_3648 ) ) ( OBJ-AT ?AUTO_3646 ?AUTO_3648 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3646 ?AUTO_3651 ?AUTO_3648 )
      ( DELIVER-PKG ?AUTO_3646 ?AUTO_3647 )
      ( DELIVER-PKG-VERIFY ?AUTO_3646 ?AUTO_3647 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3653 - OBJ
      ?AUTO_3654 - LOCATION
    )
    :vars
    (
      ?AUTO_3656 - TRUCK
      ?AUTO_3658 - LOCATION
      ?AUTO_3657 - CITY
      ?AUTO_3655 - LOCATION
      ?AUTO_3660 - LOCATION
      ?AUTO_3659 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3656 ?AUTO_3658 ) ( IN-CITY ?AUTO_3658 ?AUTO_3657 ) ( IN-CITY ?AUTO_3654 ?AUTO_3657 ) ( not ( = ?AUTO_3654 ?AUTO_3658 ) ) ( AIRPORT ?AUTO_3655 ) ( AIRPORT ?AUTO_3658 ) ( not ( = ?AUTO_3655 ?AUTO_3658 ) ) ( not ( = ?AUTO_3654 ?AUTO_3655 ) ) ( OBJ-AT ?AUTO_3653 ?AUTO_3655 ) ( AIRPORT ?AUTO_3660 ) ( AIRPLANE-AT ?AUTO_3659 ?AUTO_3660 ) ( not ( = ?AUTO_3660 ?AUTO_3655 ) ) ( not ( = ?AUTO_3654 ?AUTO_3660 ) ) ( not ( = ?AUTO_3658 ?AUTO_3660 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3659 ?AUTO_3660 ?AUTO_3655 )
      ( DELIVER-PKG ?AUTO_3653 ?AUTO_3654 )
      ( DELIVER-PKG-VERIFY ?AUTO_3653 ?AUTO_3654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3665 - OBJ
      ?AUTO_3666 - LOCATION
    )
    :vars
    (
      ?AUTO_3672 - TRUCK
      ?AUTO_3667 - LOCATION
      ?AUTO_3671 - CITY
      ?AUTO_3670 - LOCATION
      ?AUTO_3669 - LOCATION
      ?AUTO_3668 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3672 ?AUTO_3667 ) ( IN-CITY ?AUTO_3667 ?AUTO_3671 ) ( IN-CITY ?AUTO_3666 ?AUTO_3671 ) ( not ( = ?AUTO_3666 ?AUTO_3667 ) ) ( AIRPORT ?AUTO_3670 ) ( AIRPORT ?AUTO_3667 ) ( not ( = ?AUTO_3670 ?AUTO_3667 ) ) ( not ( = ?AUTO_3666 ?AUTO_3670 ) ) ( OBJ-AT ?AUTO_3665 ?AUTO_3670 ) ( AIRPORT ?AUTO_3669 ) ( not ( = ?AUTO_3669 ?AUTO_3670 ) ) ( not ( = ?AUTO_3666 ?AUTO_3669 ) ) ( not ( = ?AUTO_3667 ?AUTO_3669 ) ) ( AIRPLANE-AT ?AUTO_3668 ?AUTO_3667 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3668 ?AUTO_3667 ?AUTO_3669 )
      ( DELIVER-PKG ?AUTO_3665 ?AUTO_3666 )
      ( DELIVER-PKG-VERIFY ?AUTO_3665 ?AUTO_3666 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3705 - OBJ
      ?AUTO_3706 - LOCATION
    )
    :vars
    (
      ?AUTO_3712 - LOCATION
      ?AUTO_3709 - CITY
      ?AUTO_3707 - LOCATION
      ?AUTO_3708 - LOCATION
      ?AUTO_3710 - AIRPLANE
      ?AUTO_3711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3712 ?AUTO_3709 ) ( IN-CITY ?AUTO_3706 ?AUTO_3709 ) ( not ( = ?AUTO_3706 ?AUTO_3712 ) ) ( AIRPORT ?AUTO_3707 ) ( AIRPORT ?AUTO_3712 ) ( not ( = ?AUTO_3707 ?AUTO_3712 ) ) ( not ( = ?AUTO_3706 ?AUTO_3707 ) ) ( OBJ-AT ?AUTO_3705 ?AUTO_3707 ) ( AIRPORT ?AUTO_3708 ) ( AIRPLANE-AT ?AUTO_3710 ?AUTO_3708 ) ( not ( = ?AUTO_3708 ?AUTO_3707 ) ) ( not ( = ?AUTO_3706 ?AUTO_3708 ) ) ( not ( = ?AUTO_3712 ?AUTO_3708 ) ) ( TRUCK-AT ?AUTO_3711 ?AUTO_3706 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3711 ?AUTO_3706 ?AUTO_3712 ?AUTO_3709 )
      ( DELIVER-PKG ?AUTO_3705 ?AUTO_3706 )
      ( DELIVER-PKG-VERIFY ?AUTO_3705 ?AUTO_3706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3723 - OBJ
      ?AUTO_3724 - LOCATION
    )
    :vars
    (
      ?AUTO_3729 - LOCATION
      ?AUTO_3730 - CITY
      ?AUTO_3728 - LOCATION
      ?AUTO_3725 - LOCATION
      ?AUTO_3727 - AIRPLANE
      ?AUTO_3726 - TRUCK
      ?AUTO_3731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3729 ?AUTO_3730 ) ( IN-CITY ?AUTO_3724 ?AUTO_3730 ) ( not ( = ?AUTO_3724 ?AUTO_3729 ) ) ( AIRPORT ?AUTO_3728 ) ( AIRPORT ?AUTO_3729 ) ( not ( = ?AUTO_3728 ?AUTO_3729 ) ) ( not ( = ?AUTO_3724 ?AUTO_3728 ) ) ( OBJ-AT ?AUTO_3723 ?AUTO_3728 ) ( AIRPORT ?AUTO_3725 ) ( AIRPLANE-AT ?AUTO_3727 ?AUTO_3725 ) ( not ( = ?AUTO_3725 ?AUTO_3728 ) ) ( not ( = ?AUTO_3724 ?AUTO_3725 ) ) ( not ( = ?AUTO_3729 ?AUTO_3725 ) ) ( TRUCK-AT ?AUTO_3726 ?AUTO_3731 ) ( IN-CITY ?AUTO_3731 ?AUTO_3730 ) ( not ( = ?AUTO_3729 ?AUTO_3731 ) ) ( not ( = ?AUTO_3724 ?AUTO_3731 ) ) ( not ( = ?AUTO_3728 ?AUTO_3731 ) ) ( not ( = ?AUTO_3725 ?AUTO_3731 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3726 ?AUTO_3731 ?AUTO_3729 ?AUTO_3730 )
      ( DELIVER-PKG ?AUTO_3723 ?AUTO_3724 )
      ( DELIVER-PKG-VERIFY ?AUTO_3723 ?AUTO_3724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3746 - OBJ
      ?AUTO_3747 - LOCATION
    )
    :vars
    (
      ?AUTO_3748 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3748 ?AUTO_3747 ) ( IN-TRUCK ?AUTO_3746 ?AUTO_3748 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3746 ?AUTO_3748 ?AUTO_3747 )
      ( DELIVER-PKG-VERIFY ?AUTO_3746 ?AUTO_3747 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3749 - OBJ
      ?AUTO_3750 - LOCATION
    )
    :vars
    (
      ?AUTO_3751 - TRUCK
      ?AUTO_3752 - LOCATION
      ?AUTO_3753 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3749 ?AUTO_3751 ) ( TRUCK-AT ?AUTO_3751 ?AUTO_3752 ) ( IN-CITY ?AUTO_3752 ?AUTO_3753 ) ( IN-CITY ?AUTO_3750 ?AUTO_3753 ) ( not ( = ?AUTO_3750 ?AUTO_3752 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3751 ?AUTO_3752 ?AUTO_3750 ?AUTO_3753 )
      ( DELIVER-PKG ?AUTO_3749 ?AUTO_3750 )
      ( DELIVER-PKG-VERIFY ?AUTO_3749 ?AUTO_3750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3756 - OBJ
      ?AUTO_3757 - LOCATION
    )
    :vars
    (
      ?AUTO_3758 - TRUCK
      ?AUTO_3760 - LOCATION
      ?AUTO_3759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3758 ?AUTO_3760 ) ( IN-CITY ?AUTO_3760 ?AUTO_3759 ) ( IN-CITY ?AUTO_3757 ?AUTO_3759 ) ( not ( = ?AUTO_3757 ?AUTO_3760 ) ) ( OBJ-AT ?AUTO_3756 ?AUTO_3760 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3756 ?AUTO_3758 ?AUTO_3760 )
      ( DELIVER-PKG ?AUTO_3756 ?AUTO_3757 )
      ( DELIVER-PKG-VERIFY ?AUTO_3756 ?AUTO_3757 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3761 - OBJ
      ?AUTO_3762 - LOCATION
    )
    :vars
    (
      ?AUTO_3764 - LOCATION
      ?AUTO_3765 - CITY
      ?AUTO_3763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3764 ?AUTO_3765 ) ( IN-CITY ?AUTO_3762 ?AUTO_3765 ) ( not ( = ?AUTO_3762 ?AUTO_3764 ) ) ( OBJ-AT ?AUTO_3761 ?AUTO_3764 ) ( TRUCK-AT ?AUTO_3763 ?AUTO_3762 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3763 ?AUTO_3762 ?AUTO_3764 ?AUTO_3765 )
      ( DELIVER-PKG ?AUTO_3761 ?AUTO_3762 )
      ( DELIVER-PKG-VERIFY ?AUTO_3761 ?AUTO_3762 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3784 - OBJ
      ?AUTO_3785 - LOCATION
    )
    :vars
    (
      ?AUTO_3788 - LOCATION
      ?AUTO_3786 - CITY
      ?AUTO_3787 - TRUCK
      ?AUTO_3789 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3788 ?AUTO_3786 ) ( IN-CITY ?AUTO_3785 ?AUTO_3786 ) ( not ( = ?AUTO_3785 ?AUTO_3788 ) ) ( TRUCK-AT ?AUTO_3787 ?AUTO_3785 ) ( IN-AIRPLANE ?AUTO_3784 ?AUTO_3789 ) ( AIRPLANE-AT ?AUTO_3789 ?AUTO_3788 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3784 ?AUTO_3789 ?AUTO_3788 )
      ( DELIVER-PKG ?AUTO_3784 ?AUTO_3785 )
      ( DELIVER-PKG-VERIFY ?AUTO_3784 ?AUTO_3785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3790 - OBJ
      ?AUTO_3791 - LOCATION
    )
    :vars
    (
      ?AUTO_3794 - LOCATION
      ?AUTO_3792 - CITY
      ?AUTO_3795 - TRUCK
      ?AUTO_3793 - AIRPLANE
      ?AUTO_3796 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3794 ?AUTO_3792 ) ( IN-CITY ?AUTO_3791 ?AUTO_3792 ) ( not ( = ?AUTO_3791 ?AUTO_3794 ) ) ( TRUCK-AT ?AUTO_3795 ?AUTO_3791 ) ( IN-AIRPLANE ?AUTO_3790 ?AUTO_3793 ) ( AIRPORT ?AUTO_3796 ) ( AIRPORT ?AUTO_3794 ) ( AIRPLANE-AT ?AUTO_3793 ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3794 ) ) ( not ( = ?AUTO_3791 ?AUTO_3796 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3793 ?AUTO_3796 ?AUTO_3794 )
      ( DELIVER-PKG ?AUTO_3790 ?AUTO_3791 )
      ( DELIVER-PKG-VERIFY ?AUTO_3790 ?AUTO_3791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3817 - OBJ
      ?AUTO_3818 - LOCATION
    )
    :vars
    (
      ?AUTO_3821 - LOCATION
      ?AUTO_3820 - CITY
      ?AUTO_3823 - TRUCK
      ?AUTO_3822 - LOCATION
      ?AUTO_3819 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3821 ?AUTO_3820 ) ( IN-CITY ?AUTO_3818 ?AUTO_3820 ) ( not ( = ?AUTO_3818 ?AUTO_3821 ) ) ( TRUCK-AT ?AUTO_3823 ?AUTO_3818 ) ( AIRPORT ?AUTO_3822 ) ( AIRPORT ?AUTO_3821 ) ( AIRPLANE-AT ?AUTO_3819 ?AUTO_3822 ) ( not ( = ?AUTO_3822 ?AUTO_3821 ) ) ( not ( = ?AUTO_3818 ?AUTO_3822 ) ) ( OBJ-AT ?AUTO_3817 ?AUTO_3822 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3817 ?AUTO_3819 ?AUTO_3822 )
      ( DELIVER-PKG ?AUTO_3817 ?AUTO_3818 )
      ( DELIVER-PKG-VERIFY ?AUTO_3817 ?AUTO_3818 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3824 - OBJ
      ?AUTO_3825 - LOCATION
    )
    :vars
    (
      ?AUTO_3829 - LOCATION
      ?AUTO_3827 - CITY
      ?AUTO_3828 - TRUCK
      ?AUTO_3830 - LOCATION
      ?AUTO_3826 - AIRPLANE
      ?AUTO_3831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3829 ?AUTO_3827 ) ( IN-CITY ?AUTO_3825 ?AUTO_3827 ) ( not ( = ?AUTO_3825 ?AUTO_3829 ) ) ( TRUCK-AT ?AUTO_3828 ?AUTO_3825 ) ( AIRPORT ?AUTO_3830 ) ( AIRPORT ?AUTO_3829 ) ( AIRPLANE-AT ?AUTO_3826 ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3829 ) ) ( not ( = ?AUTO_3825 ?AUTO_3830 ) ) ( TRUCK-AT ?AUTO_3831 ?AUTO_3830 ) ( IN-TRUCK ?AUTO_3824 ?AUTO_3831 ) ( not ( = ?AUTO_3828 ?AUTO_3831 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3824 ?AUTO_3831 ?AUTO_3830 )
      ( DELIVER-PKG ?AUTO_3824 ?AUTO_3825 )
      ( DELIVER-PKG-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3832 - OBJ
      ?AUTO_3833 - LOCATION
    )
    :vars
    (
      ?AUTO_3834 - LOCATION
      ?AUTO_3836 - CITY
      ?AUTO_3838 - TRUCK
      ?AUTO_3835 - LOCATION
      ?AUTO_3837 - AIRPLANE
      ?AUTO_3839 - TRUCK
      ?AUTO_3840 - LOCATION
      ?AUTO_3841 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3834 ?AUTO_3836 ) ( IN-CITY ?AUTO_3833 ?AUTO_3836 ) ( not ( = ?AUTO_3833 ?AUTO_3834 ) ) ( TRUCK-AT ?AUTO_3838 ?AUTO_3833 ) ( AIRPORT ?AUTO_3835 ) ( AIRPORT ?AUTO_3834 ) ( AIRPLANE-AT ?AUTO_3837 ?AUTO_3835 ) ( not ( = ?AUTO_3835 ?AUTO_3834 ) ) ( not ( = ?AUTO_3833 ?AUTO_3835 ) ) ( IN-TRUCK ?AUTO_3832 ?AUTO_3839 ) ( not ( = ?AUTO_3838 ?AUTO_3839 ) ) ( TRUCK-AT ?AUTO_3839 ?AUTO_3840 ) ( IN-CITY ?AUTO_3840 ?AUTO_3841 ) ( IN-CITY ?AUTO_3835 ?AUTO_3841 ) ( not ( = ?AUTO_3835 ?AUTO_3840 ) ) ( not ( = ?AUTO_3833 ?AUTO_3840 ) ) ( not ( = ?AUTO_3834 ?AUTO_3840 ) ) ( not ( = ?AUTO_3836 ?AUTO_3841 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3839 ?AUTO_3840 ?AUTO_3835 ?AUTO_3841 )
      ( DELIVER-PKG ?AUTO_3832 ?AUTO_3833 )
      ( DELIVER-PKG-VERIFY ?AUTO_3832 ?AUTO_3833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3842 - OBJ
      ?AUTO_3843 - LOCATION
    )
    :vars
    (
      ?AUTO_3844 - LOCATION
      ?AUTO_3846 - CITY
      ?AUTO_3849 - TRUCK
      ?AUTO_3851 - LOCATION
      ?AUTO_3848 - AIRPLANE
      ?AUTO_3845 - TRUCK
      ?AUTO_3850 - LOCATION
      ?AUTO_3847 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3844 ?AUTO_3846 ) ( IN-CITY ?AUTO_3843 ?AUTO_3846 ) ( not ( = ?AUTO_3843 ?AUTO_3844 ) ) ( TRUCK-AT ?AUTO_3849 ?AUTO_3843 ) ( AIRPORT ?AUTO_3851 ) ( AIRPORT ?AUTO_3844 ) ( AIRPLANE-AT ?AUTO_3848 ?AUTO_3851 ) ( not ( = ?AUTO_3851 ?AUTO_3844 ) ) ( not ( = ?AUTO_3843 ?AUTO_3851 ) ) ( not ( = ?AUTO_3849 ?AUTO_3845 ) ) ( TRUCK-AT ?AUTO_3845 ?AUTO_3850 ) ( IN-CITY ?AUTO_3850 ?AUTO_3847 ) ( IN-CITY ?AUTO_3851 ?AUTO_3847 ) ( not ( = ?AUTO_3851 ?AUTO_3850 ) ) ( not ( = ?AUTO_3843 ?AUTO_3850 ) ) ( not ( = ?AUTO_3844 ?AUTO_3850 ) ) ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) ( OBJ-AT ?AUTO_3842 ?AUTO_3850 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3842 ?AUTO_3845 ?AUTO_3850 )
      ( DELIVER-PKG ?AUTO_3842 ?AUTO_3843 )
      ( DELIVER-PKG-VERIFY ?AUTO_3842 ?AUTO_3843 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3852 - OBJ
      ?AUTO_3853 - LOCATION
    )
    :vars
    (
      ?AUTO_3857 - LOCATION
      ?AUTO_3859 - CITY
      ?AUTO_3861 - TRUCK
      ?AUTO_3860 - LOCATION
      ?AUTO_3854 - AIRPLANE
      ?AUTO_3858 - TRUCK
      ?AUTO_3855 - LOCATION
      ?AUTO_3856 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3857 ?AUTO_3859 ) ( IN-CITY ?AUTO_3853 ?AUTO_3859 ) ( not ( = ?AUTO_3853 ?AUTO_3857 ) ) ( TRUCK-AT ?AUTO_3861 ?AUTO_3853 ) ( AIRPORT ?AUTO_3860 ) ( AIRPORT ?AUTO_3857 ) ( AIRPLANE-AT ?AUTO_3854 ?AUTO_3860 ) ( not ( = ?AUTO_3860 ?AUTO_3857 ) ) ( not ( = ?AUTO_3853 ?AUTO_3860 ) ) ( not ( = ?AUTO_3861 ?AUTO_3858 ) ) ( IN-CITY ?AUTO_3855 ?AUTO_3856 ) ( IN-CITY ?AUTO_3860 ?AUTO_3856 ) ( not ( = ?AUTO_3860 ?AUTO_3855 ) ) ( not ( = ?AUTO_3853 ?AUTO_3855 ) ) ( not ( = ?AUTO_3857 ?AUTO_3855 ) ) ( not ( = ?AUTO_3859 ?AUTO_3856 ) ) ( OBJ-AT ?AUTO_3852 ?AUTO_3855 ) ( TRUCK-AT ?AUTO_3858 ?AUTO_3860 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3858 ?AUTO_3860 ?AUTO_3855 ?AUTO_3856 )
      ( DELIVER-PKG ?AUTO_3852 ?AUTO_3853 )
      ( DELIVER-PKG-VERIFY ?AUTO_3852 ?AUTO_3853 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3892 - OBJ
      ?AUTO_3893 - LOCATION
    )
    :vars
    (
      ?AUTO_3894 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3894 ?AUTO_3893 ) ( IN-TRUCK ?AUTO_3892 ?AUTO_3894 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3892 ?AUTO_3894 ?AUTO_3893 )
      ( DELIVER-PKG-VERIFY ?AUTO_3892 ?AUTO_3893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3895 - OBJ
      ?AUTO_3896 - LOCATION
    )
    :vars
    (
      ?AUTO_3897 - TRUCK
      ?AUTO_3898 - LOCATION
      ?AUTO_3899 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3895 ?AUTO_3897 ) ( TRUCK-AT ?AUTO_3897 ?AUTO_3898 ) ( IN-CITY ?AUTO_3898 ?AUTO_3899 ) ( IN-CITY ?AUTO_3896 ?AUTO_3899 ) ( not ( = ?AUTO_3896 ?AUTO_3898 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3897 ?AUTO_3898 ?AUTO_3896 ?AUTO_3899 )
      ( DELIVER-PKG ?AUTO_3895 ?AUTO_3896 )
      ( DELIVER-PKG-VERIFY ?AUTO_3895 ?AUTO_3896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3904 - OBJ
      ?AUTO_3905 - LOCATION
    )
    :vars
    (
      ?AUTO_3908 - TRUCK
      ?AUTO_3906 - LOCATION
      ?AUTO_3907 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3908 ?AUTO_3906 ) ( IN-CITY ?AUTO_3906 ?AUTO_3907 ) ( IN-CITY ?AUTO_3905 ?AUTO_3907 ) ( not ( = ?AUTO_3905 ?AUTO_3906 ) ) ( OBJ-AT ?AUTO_3904 ?AUTO_3906 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3904 ?AUTO_3908 ?AUTO_3906 )
      ( DELIVER-PKG ?AUTO_3904 ?AUTO_3905 )
      ( DELIVER-PKG-VERIFY ?AUTO_3904 ?AUTO_3905 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3911 - OBJ
      ?AUTO_3912 - LOCATION
    )
    :vars
    (
      ?AUTO_3913 - LOCATION
      ?AUTO_3914 - CITY
      ?AUTO_3915 - TRUCK
      ?AUTO_3916 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3913 ?AUTO_3914 ) ( IN-CITY ?AUTO_3912 ?AUTO_3914 ) ( not ( = ?AUTO_3912 ?AUTO_3913 ) ) ( OBJ-AT ?AUTO_3911 ?AUTO_3913 ) ( TRUCK-AT ?AUTO_3915 ?AUTO_3916 ) ( IN-CITY ?AUTO_3916 ?AUTO_3914 ) ( not ( = ?AUTO_3913 ?AUTO_3916 ) ) ( not ( = ?AUTO_3912 ?AUTO_3916 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3915 ?AUTO_3916 ?AUTO_3913 ?AUTO_3914 )
      ( DELIVER-PKG ?AUTO_3911 ?AUTO_3912 )
      ( DELIVER-PKG-VERIFY ?AUTO_3911 ?AUTO_3912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3933 - OBJ
      ?AUTO_3934 - LOCATION
    )
    :vars
    (
      ?AUTO_3935 - LOCATION
      ?AUTO_3936 - CITY
      ?AUTO_3938 - TRUCK
      ?AUTO_3937 - LOCATION
      ?AUTO_3939 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3935 ?AUTO_3936 ) ( IN-CITY ?AUTO_3934 ?AUTO_3936 ) ( not ( = ?AUTO_3934 ?AUTO_3935 ) ) ( TRUCK-AT ?AUTO_3938 ?AUTO_3937 ) ( IN-CITY ?AUTO_3937 ?AUTO_3936 ) ( not ( = ?AUTO_3935 ?AUTO_3937 ) ) ( not ( = ?AUTO_3934 ?AUTO_3937 ) ) ( IN-AIRPLANE ?AUTO_3933 ?AUTO_3939 ) ( AIRPLANE-AT ?AUTO_3939 ?AUTO_3935 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3933 ?AUTO_3939 ?AUTO_3935 )
      ( DELIVER-PKG ?AUTO_3933 ?AUTO_3934 )
      ( DELIVER-PKG-VERIFY ?AUTO_3933 ?AUTO_3934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3942 - OBJ
      ?AUTO_3943 - LOCATION
    )
    :vars
    (
      ?AUTO_3947 - LOCATION
      ?AUTO_3945 - CITY
      ?AUTO_3946 - TRUCK
      ?AUTO_3944 - LOCATION
      ?AUTO_3948 - AIRPLANE
      ?AUTO_3949 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3947 ?AUTO_3945 ) ( IN-CITY ?AUTO_3943 ?AUTO_3945 ) ( not ( = ?AUTO_3943 ?AUTO_3947 ) ) ( TRUCK-AT ?AUTO_3946 ?AUTO_3944 ) ( IN-CITY ?AUTO_3944 ?AUTO_3945 ) ( not ( = ?AUTO_3947 ?AUTO_3944 ) ) ( not ( = ?AUTO_3943 ?AUTO_3944 ) ) ( IN-AIRPLANE ?AUTO_3942 ?AUTO_3948 ) ( AIRPORT ?AUTO_3949 ) ( AIRPORT ?AUTO_3947 ) ( AIRPLANE-AT ?AUTO_3948 ?AUTO_3949 ) ( not ( = ?AUTO_3949 ?AUTO_3947 ) ) ( not ( = ?AUTO_3943 ?AUTO_3949 ) ) ( not ( = ?AUTO_3944 ?AUTO_3949 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3948 ?AUTO_3949 ?AUTO_3947 )
      ( DELIVER-PKG ?AUTO_3942 ?AUTO_3943 )
      ( DELIVER-PKG-VERIFY ?AUTO_3942 ?AUTO_3943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3954 - OBJ
      ?AUTO_3955 - LOCATION
    )
    :vars
    (
      ?AUTO_3960 - LOCATION
      ?AUTO_3957 - CITY
      ?AUTO_3959 - TRUCK
      ?AUTO_3961 - LOCATION
      ?AUTO_3956 - LOCATION
      ?AUTO_3958 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3960 ?AUTO_3957 ) ( IN-CITY ?AUTO_3955 ?AUTO_3957 ) ( not ( = ?AUTO_3955 ?AUTO_3960 ) ) ( TRUCK-AT ?AUTO_3959 ?AUTO_3961 ) ( IN-CITY ?AUTO_3961 ?AUTO_3957 ) ( not ( = ?AUTO_3960 ?AUTO_3961 ) ) ( not ( = ?AUTO_3955 ?AUTO_3961 ) ) ( AIRPORT ?AUTO_3956 ) ( AIRPORT ?AUTO_3960 ) ( AIRPLANE-AT ?AUTO_3958 ?AUTO_3956 ) ( not ( = ?AUTO_3956 ?AUTO_3960 ) ) ( not ( = ?AUTO_3955 ?AUTO_3956 ) ) ( not ( = ?AUTO_3961 ?AUTO_3956 ) ) ( OBJ-AT ?AUTO_3954 ?AUTO_3956 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3954 ?AUTO_3958 ?AUTO_3956 )
      ( DELIVER-PKG ?AUTO_3954 ?AUTO_3955 )
      ( DELIVER-PKG-VERIFY ?AUTO_3954 ?AUTO_3955 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3962 - OBJ
      ?AUTO_3963 - LOCATION
    )
    :vars
    (
      ?AUTO_3966 - LOCATION
      ?AUTO_3967 - CITY
      ?AUTO_3964 - TRUCK
      ?AUTO_3968 - LOCATION
      ?AUTO_3969 - LOCATION
      ?AUTO_3970 - LOCATION
      ?AUTO_3965 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3966 ?AUTO_3967 ) ( IN-CITY ?AUTO_3963 ?AUTO_3967 ) ( not ( = ?AUTO_3963 ?AUTO_3966 ) ) ( TRUCK-AT ?AUTO_3964 ?AUTO_3968 ) ( IN-CITY ?AUTO_3968 ?AUTO_3967 ) ( not ( = ?AUTO_3966 ?AUTO_3968 ) ) ( not ( = ?AUTO_3963 ?AUTO_3968 ) ) ( AIRPORT ?AUTO_3969 ) ( AIRPORT ?AUTO_3966 ) ( not ( = ?AUTO_3969 ?AUTO_3966 ) ) ( not ( = ?AUTO_3963 ?AUTO_3969 ) ) ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( OBJ-AT ?AUTO_3962 ?AUTO_3969 ) ( AIRPORT ?AUTO_3970 ) ( AIRPLANE-AT ?AUTO_3965 ?AUTO_3970 ) ( not ( = ?AUTO_3970 ?AUTO_3969 ) ) ( not ( = ?AUTO_3963 ?AUTO_3970 ) ) ( not ( = ?AUTO_3966 ?AUTO_3970 ) ) ( not ( = ?AUTO_3968 ?AUTO_3970 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3965 ?AUTO_3970 ?AUTO_3969 )
      ( DELIVER-PKG ?AUTO_3962 ?AUTO_3963 )
      ( DELIVER-PKG-VERIFY ?AUTO_3962 ?AUTO_3963 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3993 - OBJ
      ?AUTO_3994 - LOCATION
    )
    :vars
    (
      ?AUTO_3998 - LOCATION
      ?AUTO_4000 - CITY
      ?AUTO_4001 - TRUCK
      ?AUTO_3996 - LOCATION
      ?AUTO_3997 - LOCATION
      ?AUTO_3995 - LOCATION
      ?AUTO_3999 - AIRPLANE
      ?AUTO_4002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3998 ?AUTO_4000 ) ( IN-CITY ?AUTO_3994 ?AUTO_4000 ) ( not ( = ?AUTO_3994 ?AUTO_3998 ) ) ( TRUCK-AT ?AUTO_4001 ?AUTO_3996 ) ( IN-CITY ?AUTO_3996 ?AUTO_4000 ) ( not ( = ?AUTO_3998 ?AUTO_3996 ) ) ( not ( = ?AUTO_3994 ?AUTO_3996 ) ) ( AIRPORT ?AUTO_3997 ) ( AIRPORT ?AUTO_3998 ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( not ( = ?AUTO_3994 ?AUTO_3997 ) ) ( not ( = ?AUTO_3996 ?AUTO_3997 ) ) ( AIRPORT ?AUTO_3995 ) ( AIRPLANE-AT ?AUTO_3999 ?AUTO_3995 ) ( not ( = ?AUTO_3995 ?AUTO_3997 ) ) ( not ( = ?AUTO_3994 ?AUTO_3995 ) ) ( not ( = ?AUTO_3998 ?AUTO_3995 ) ) ( not ( = ?AUTO_3996 ?AUTO_3995 ) ) ( TRUCK-AT ?AUTO_4002 ?AUTO_3997 ) ( IN-TRUCK ?AUTO_3993 ?AUTO_4002 ) ( not ( = ?AUTO_4001 ?AUTO_4002 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3993 ?AUTO_4002 ?AUTO_3997 )
      ( DELIVER-PKG ?AUTO_3993 ?AUTO_3994 )
      ( DELIVER-PKG-VERIFY ?AUTO_3993 ?AUTO_3994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4003 - OBJ
      ?AUTO_4004 - LOCATION
    )
    :vars
    (
      ?AUTO_4005 - LOCATION
      ?AUTO_4007 - CITY
      ?AUTO_4009 - TRUCK
      ?AUTO_4010 - LOCATION
      ?AUTO_4008 - LOCATION
      ?AUTO_4006 - LOCATION
      ?AUTO_4011 - AIRPLANE
      ?AUTO_4012 - TRUCK
      ?AUTO_4013 - LOCATION
      ?AUTO_4014 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4005 ?AUTO_4007 ) ( IN-CITY ?AUTO_4004 ?AUTO_4007 ) ( not ( = ?AUTO_4004 ?AUTO_4005 ) ) ( TRUCK-AT ?AUTO_4009 ?AUTO_4010 ) ( IN-CITY ?AUTO_4010 ?AUTO_4007 ) ( not ( = ?AUTO_4005 ?AUTO_4010 ) ) ( not ( = ?AUTO_4004 ?AUTO_4010 ) ) ( AIRPORT ?AUTO_4008 ) ( AIRPORT ?AUTO_4005 ) ( not ( = ?AUTO_4008 ?AUTO_4005 ) ) ( not ( = ?AUTO_4004 ?AUTO_4008 ) ) ( not ( = ?AUTO_4010 ?AUTO_4008 ) ) ( AIRPORT ?AUTO_4006 ) ( AIRPLANE-AT ?AUTO_4011 ?AUTO_4006 ) ( not ( = ?AUTO_4006 ?AUTO_4008 ) ) ( not ( = ?AUTO_4004 ?AUTO_4006 ) ) ( not ( = ?AUTO_4005 ?AUTO_4006 ) ) ( not ( = ?AUTO_4010 ?AUTO_4006 ) ) ( IN-TRUCK ?AUTO_4003 ?AUTO_4012 ) ( not ( = ?AUTO_4009 ?AUTO_4012 ) ) ( TRUCK-AT ?AUTO_4012 ?AUTO_4013 ) ( IN-CITY ?AUTO_4013 ?AUTO_4014 ) ( IN-CITY ?AUTO_4008 ?AUTO_4014 ) ( not ( = ?AUTO_4008 ?AUTO_4013 ) ) ( not ( = ?AUTO_4004 ?AUTO_4013 ) ) ( not ( = ?AUTO_4005 ?AUTO_4013 ) ) ( not ( = ?AUTO_4007 ?AUTO_4014 ) ) ( not ( = ?AUTO_4010 ?AUTO_4013 ) ) ( not ( = ?AUTO_4006 ?AUTO_4013 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4012 ?AUTO_4013 ?AUTO_4008 ?AUTO_4014 )
      ( DELIVER-PKG ?AUTO_4003 ?AUTO_4004 )
      ( DELIVER-PKG-VERIFY ?AUTO_4003 ?AUTO_4004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4015 - OBJ
      ?AUTO_4016 - LOCATION
    )
    :vars
    (
      ?AUTO_4019 - LOCATION
      ?AUTO_4017 - CITY
      ?AUTO_4018 - TRUCK
      ?AUTO_4022 - LOCATION
      ?AUTO_4026 - LOCATION
      ?AUTO_4021 - LOCATION
      ?AUTO_4023 - AIRPLANE
      ?AUTO_4020 - TRUCK
      ?AUTO_4025 - LOCATION
      ?AUTO_4024 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4019 ?AUTO_4017 ) ( IN-CITY ?AUTO_4016 ?AUTO_4017 ) ( not ( = ?AUTO_4016 ?AUTO_4019 ) ) ( TRUCK-AT ?AUTO_4018 ?AUTO_4022 ) ( IN-CITY ?AUTO_4022 ?AUTO_4017 ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( not ( = ?AUTO_4016 ?AUTO_4022 ) ) ( AIRPORT ?AUTO_4026 ) ( AIRPORT ?AUTO_4019 ) ( not ( = ?AUTO_4026 ?AUTO_4019 ) ) ( not ( = ?AUTO_4016 ?AUTO_4026 ) ) ( not ( = ?AUTO_4022 ?AUTO_4026 ) ) ( AIRPORT ?AUTO_4021 ) ( AIRPLANE-AT ?AUTO_4023 ?AUTO_4021 ) ( not ( = ?AUTO_4021 ?AUTO_4026 ) ) ( not ( = ?AUTO_4016 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4022 ?AUTO_4021 ) ) ( not ( = ?AUTO_4018 ?AUTO_4020 ) ) ( TRUCK-AT ?AUTO_4020 ?AUTO_4025 ) ( IN-CITY ?AUTO_4025 ?AUTO_4024 ) ( IN-CITY ?AUTO_4026 ?AUTO_4024 ) ( not ( = ?AUTO_4026 ?AUTO_4025 ) ) ( not ( = ?AUTO_4016 ?AUTO_4025 ) ) ( not ( = ?AUTO_4019 ?AUTO_4025 ) ) ( not ( = ?AUTO_4017 ?AUTO_4024 ) ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4021 ?AUTO_4025 ) ) ( OBJ-AT ?AUTO_4015 ?AUTO_4025 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4015 ?AUTO_4020 ?AUTO_4025 )
      ( DELIVER-PKG ?AUTO_4015 ?AUTO_4016 )
      ( DELIVER-PKG-VERIFY ?AUTO_4015 ?AUTO_4016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4027 - OBJ
      ?AUTO_4028 - LOCATION
    )
    :vars
    (
      ?AUTO_4034 - LOCATION
      ?AUTO_4031 - CITY
      ?AUTO_4035 - TRUCK
      ?AUTO_4032 - LOCATION
      ?AUTO_4037 - LOCATION
      ?AUTO_4038 - LOCATION
      ?AUTO_4036 - AIRPLANE
      ?AUTO_4030 - TRUCK
      ?AUTO_4033 - LOCATION
      ?AUTO_4029 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4034 ?AUTO_4031 ) ( IN-CITY ?AUTO_4028 ?AUTO_4031 ) ( not ( = ?AUTO_4028 ?AUTO_4034 ) ) ( TRUCK-AT ?AUTO_4035 ?AUTO_4032 ) ( IN-CITY ?AUTO_4032 ?AUTO_4031 ) ( not ( = ?AUTO_4034 ?AUTO_4032 ) ) ( not ( = ?AUTO_4028 ?AUTO_4032 ) ) ( AIRPORT ?AUTO_4037 ) ( AIRPORT ?AUTO_4034 ) ( not ( = ?AUTO_4037 ?AUTO_4034 ) ) ( not ( = ?AUTO_4028 ?AUTO_4037 ) ) ( not ( = ?AUTO_4032 ?AUTO_4037 ) ) ( AIRPORT ?AUTO_4038 ) ( AIRPLANE-AT ?AUTO_4036 ?AUTO_4038 ) ( not ( = ?AUTO_4038 ?AUTO_4037 ) ) ( not ( = ?AUTO_4028 ?AUTO_4038 ) ) ( not ( = ?AUTO_4034 ?AUTO_4038 ) ) ( not ( = ?AUTO_4032 ?AUTO_4038 ) ) ( not ( = ?AUTO_4035 ?AUTO_4030 ) ) ( IN-CITY ?AUTO_4033 ?AUTO_4029 ) ( IN-CITY ?AUTO_4037 ?AUTO_4029 ) ( not ( = ?AUTO_4037 ?AUTO_4033 ) ) ( not ( = ?AUTO_4028 ?AUTO_4033 ) ) ( not ( = ?AUTO_4034 ?AUTO_4033 ) ) ( not ( = ?AUTO_4031 ?AUTO_4029 ) ) ( not ( = ?AUTO_4032 ?AUTO_4033 ) ) ( not ( = ?AUTO_4038 ?AUTO_4033 ) ) ( OBJ-AT ?AUTO_4027 ?AUTO_4033 ) ( TRUCK-AT ?AUTO_4030 ?AUTO_4037 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4030 ?AUTO_4037 ?AUTO_4033 ?AUTO_4029 )
      ( DELIVER-PKG ?AUTO_4027 ?AUTO_4028 )
      ( DELIVER-PKG-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4045 - OBJ
      ?AUTO_4046 - LOCATION
    )
    :vars
    (
      ?AUTO_4054 - LOCATION
      ?AUTO_4047 - CITY
      ?AUTO_4051 - TRUCK
      ?AUTO_4052 - LOCATION
      ?AUTO_4049 - LOCATION
      ?AUTO_4056 - LOCATION
      ?AUTO_4053 - AIRPLANE
      ?AUTO_4050 - TRUCK
      ?AUTO_4055 - LOCATION
      ?AUTO_4048 - CITY
      ?AUTO_4057 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4054 ?AUTO_4047 ) ( IN-CITY ?AUTO_4046 ?AUTO_4047 ) ( not ( = ?AUTO_4046 ?AUTO_4054 ) ) ( TRUCK-AT ?AUTO_4051 ?AUTO_4052 ) ( IN-CITY ?AUTO_4052 ?AUTO_4047 ) ( not ( = ?AUTO_4054 ?AUTO_4052 ) ) ( not ( = ?AUTO_4046 ?AUTO_4052 ) ) ( AIRPORT ?AUTO_4049 ) ( AIRPORT ?AUTO_4054 ) ( not ( = ?AUTO_4049 ?AUTO_4054 ) ) ( not ( = ?AUTO_4046 ?AUTO_4049 ) ) ( not ( = ?AUTO_4052 ?AUTO_4049 ) ) ( AIRPORT ?AUTO_4056 ) ( AIRPLANE-AT ?AUTO_4053 ?AUTO_4056 ) ( not ( = ?AUTO_4056 ?AUTO_4049 ) ) ( not ( = ?AUTO_4046 ?AUTO_4056 ) ) ( not ( = ?AUTO_4054 ?AUTO_4056 ) ) ( not ( = ?AUTO_4052 ?AUTO_4056 ) ) ( not ( = ?AUTO_4051 ?AUTO_4050 ) ) ( IN-CITY ?AUTO_4055 ?AUTO_4048 ) ( IN-CITY ?AUTO_4049 ?AUTO_4048 ) ( not ( = ?AUTO_4049 ?AUTO_4055 ) ) ( not ( = ?AUTO_4046 ?AUTO_4055 ) ) ( not ( = ?AUTO_4054 ?AUTO_4055 ) ) ( not ( = ?AUTO_4047 ?AUTO_4048 ) ) ( not ( = ?AUTO_4052 ?AUTO_4055 ) ) ( not ( = ?AUTO_4056 ?AUTO_4055 ) ) ( OBJ-AT ?AUTO_4045 ?AUTO_4055 ) ( TRUCK-AT ?AUTO_4050 ?AUTO_4057 ) ( IN-CITY ?AUTO_4057 ?AUTO_4048 ) ( not ( = ?AUTO_4049 ?AUTO_4057 ) ) ( not ( = ?AUTO_4046 ?AUTO_4057 ) ) ( not ( = ?AUTO_4054 ?AUTO_4057 ) ) ( not ( = ?AUTO_4052 ?AUTO_4057 ) ) ( not ( = ?AUTO_4056 ?AUTO_4057 ) ) ( not ( = ?AUTO_4055 ?AUTO_4057 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4050 ?AUTO_4057 ?AUTO_4049 ?AUTO_4048 )
      ( DELIVER-PKG ?AUTO_4045 ?AUTO_4046 )
      ( DELIVER-PKG-VERIFY ?AUTO_4045 ?AUTO_4046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4060 - OBJ
      ?AUTO_4061 - LOCATION
    )
    :vars
    (
      ?AUTO_4062 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4062 ?AUTO_4061 ) ( IN-TRUCK ?AUTO_4060 ?AUTO_4062 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4060 ?AUTO_4062 ?AUTO_4061 )
      ( DELIVER-PKG-VERIFY ?AUTO_4060 ?AUTO_4061 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4063 - OBJ
      ?AUTO_4064 - LOCATION
    )
    :vars
    (
      ?AUTO_4065 - TRUCK
      ?AUTO_4066 - LOCATION
      ?AUTO_4067 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4063 ?AUTO_4065 ) ( TRUCK-AT ?AUTO_4065 ?AUTO_4066 ) ( IN-CITY ?AUTO_4066 ?AUTO_4067 ) ( IN-CITY ?AUTO_4064 ?AUTO_4067 ) ( not ( = ?AUTO_4064 ?AUTO_4066 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4065 ?AUTO_4066 ?AUTO_4064 ?AUTO_4067 )
      ( DELIVER-PKG ?AUTO_4063 ?AUTO_4064 )
      ( DELIVER-PKG-VERIFY ?AUTO_4063 ?AUTO_4064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4068 - OBJ
      ?AUTO_4069 - LOCATION
    )
    :vars
    (
      ?AUTO_4070 - TRUCK
      ?AUTO_4071 - LOCATION
      ?AUTO_4072 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4070 ?AUTO_4071 ) ( IN-CITY ?AUTO_4071 ?AUTO_4072 ) ( IN-CITY ?AUTO_4069 ?AUTO_4072 ) ( not ( = ?AUTO_4069 ?AUTO_4071 ) ) ( OBJ-AT ?AUTO_4068 ?AUTO_4071 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4068 ?AUTO_4070 ?AUTO_4071 )
      ( DELIVER-PKG ?AUTO_4068 ?AUTO_4069 )
      ( DELIVER-PKG-VERIFY ?AUTO_4068 ?AUTO_4069 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4075 - OBJ
      ?AUTO_4076 - LOCATION
    )
    :vars
    (
      ?AUTO_4077 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4077 ?AUTO_4076 ) ( IN-TRUCK ?AUTO_4075 ?AUTO_4077 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4075 ?AUTO_4077 ?AUTO_4076 )
      ( DELIVER-PKG-VERIFY ?AUTO_4075 ?AUTO_4076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4078 - OBJ
      ?AUTO_4079 - LOCATION
    )
    :vars
    (
      ?AUTO_4080 - TRUCK
      ?AUTO_4081 - LOCATION
      ?AUTO_4082 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4078 ?AUTO_4080 ) ( TRUCK-AT ?AUTO_4080 ?AUTO_4081 ) ( IN-CITY ?AUTO_4081 ?AUTO_4082 ) ( IN-CITY ?AUTO_4079 ?AUTO_4082 ) ( not ( = ?AUTO_4079 ?AUTO_4081 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4080 ?AUTO_4081 ?AUTO_4079 ?AUTO_4082 )
      ( DELIVER-PKG ?AUTO_4078 ?AUTO_4079 )
      ( DELIVER-PKG-VERIFY ?AUTO_4078 ?AUTO_4079 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4093 - OBJ
      ?AUTO_4094 - LOCATION
    )
    :vars
    (
      ?AUTO_4096 - TRUCK
      ?AUTO_4095 - LOCATION
      ?AUTO_4097 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4096 ?AUTO_4095 ) ( IN-CITY ?AUTO_4095 ?AUTO_4097 ) ( IN-CITY ?AUTO_4094 ?AUTO_4097 ) ( not ( = ?AUTO_4094 ?AUTO_4095 ) ) ( OBJ-AT ?AUTO_4093 ?AUTO_4095 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4093 ?AUTO_4096 ?AUTO_4095 )
      ( DELIVER-PKG ?AUTO_4093 ?AUTO_4094 )
      ( DELIVER-PKG-VERIFY ?AUTO_4093 ?AUTO_4094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4100 - OBJ
      ?AUTO_4101 - LOCATION
    )
    :vars
    (
      ?AUTO_4102 - LOCATION
      ?AUTO_4104 - CITY
      ?AUTO_4103 - TRUCK
      ?AUTO_4105 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4102 ?AUTO_4104 ) ( IN-CITY ?AUTO_4101 ?AUTO_4104 ) ( not ( = ?AUTO_4101 ?AUTO_4102 ) ) ( OBJ-AT ?AUTO_4100 ?AUTO_4102 ) ( TRUCK-AT ?AUTO_4103 ?AUTO_4105 ) ( IN-CITY ?AUTO_4105 ?AUTO_4104 ) ( not ( = ?AUTO_4102 ?AUTO_4105 ) ) ( not ( = ?AUTO_4101 ?AUTO_4105 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4103 ?AUTO_4105 ?AUTO_4102 ?AUTO_4104 )
      ( DELIVER-PKG ?AUTO_4100 ?AUTO_4101 )
      ( DELIVER-PKG-VERIFY ?AUTO_4100 ?AUTO_4101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4116 - OBJ
      ?AUTO_4117 - LOCATION
    )
    :vars
    (
      ?AUTO_4118 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4118 ?AUTO_4117 ) ( IN-TRUCK ?AUTO_4116 ?AUTO_4118 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4116 ?AUTO_4118 ?AUTO_4117 )
      ( DELIVER-PKG-VERIFY ?AUTO_4116 ?AUTO_4117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4133 - OBJ
      ?AUTO_4134 - LOCATION
    )
    :vars
    (
      ?AUTO_4136 - TRUCK
      ?AUTO_4137 - LOCATION
      ?AUTO_4135 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4136 ?AUTO_4137 ) ( IN-CITY ?AUTO_4137 ?AUTO_4135 ) ( IN-CITY ?AUTO_4134 ?AUTO_4135 ) ( not ( = ?AUTO_4134 ?AUTO_4137 ) ) ( OBJ-AT ?AUTO_4133 ?AUTO_4137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4133 ?AUTO_4136 ?AUTO_4137 )
      ( DELIVER-PKG ?AUTO_4133 ?AUTO_4134 )
      ( DELIVER-PKG-VERIFY ?AUTO_4133 ?AUTO_4134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4156 - OBJ
      ?AUTO_4157 - LOCATION
    )
    :vars
    (
      ?AUTO_4158 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4158 ?AUTO_4157 ) ( IN-TRUCK ?AUTO_4156 ?AUTO_4158 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4156 ?AUTO_4158 ?AUTO_4157 )
      ( DELIVER-PKG-VERIFY ?AUTO_4156 ?AUTO_4157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4171 - OBJ
      ?AUTO_4172 - LOCATION
    )
    :vars
    (
      ?AUTO_4175 - TRUCK
      ?AUTO_4173 - LOCATION
      ?AUTO_4174 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4175 ?AUTO_4173 ) ( IN-CITY ?AUTO_4173 ?AUTO_4174 ) ( IN-CITY ?AUTO_4172 ?AUTO_4174 ) ( not ( = ?AUTO_4172 ?AUTO_4173 ) ) ( OBJ-AT ?AUTO_4171 ?AUTO_4173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4171 ?AUTO_4175 ?AUTO_4173 )
      ( DELIVER-PKG ?AUTO_4171 ?AUTO_4172 )
      ( DELIVER-PKG-VERIFY ?AUTO_4171 ?AUTO_4172 ) )
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
      ?AUTO_4183 - CITY
      ?AUTO_4184 - TRUCK
      ?AUTO_4185 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4182 ?AUTO_4183 ) ( IN-CITY ?AUTO_4181 ?AUTO_4183 ) ( not ( = ?AUTO_4181 ?AUTO_4182 ) ) ( OBJ-AT ?AUTO_4180 ?AUTO_4182 ) ( TRUCK-AT ?AUTO_4184 ?AUTO_4185 ) ( IN-CITY ?AUTO_4185 ?AUTO_4183 ) ( not ( = ?AUTO_4182 ?AUTO_4185 ) ) ( not ( = ?AUTO_4181 ?AUTO_4185 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4184 ?AUTO_4185 ?AUTO_4182 ?AUTO_4183 )
      ( DELIVER-PKG ?AUTO_4180 ?AUTO_4181 )
      ( DELIVER-PKG-VERIFY ?AUTO_4180 ?AUTO_4181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4202 - OBJ
      ?AUTO_4203 - LOCATION
    )
    :vars
    (
      ?AUTO_4204 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4202 ?AUTO_4204 ) ( AIRPLANE-AT ?AUTO_4204 ?AUTO_4203 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4202 ?AUTO_4204 ?AUTO_4203 )
      ( DELIVER-PKG-VERIFY ?AUTO_4202 ?AUTO_4203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4205 - OBJ
      ?AUTO_4206 - LOCATION
    )
    :vars
    (
      ?AUTO_4207 - AIRPLANE
      ?AUTO_4208 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4205 ?AUTO_4207 ) ( AIRPORT ?AUTO_4208 ) ( AIRPORT ?AUTO_4206 ) ( AIRPLANE-AT ?AUTO_4207 ?AUTO_4208 ) ( not ( = ?AUTO_4208 ?AUTO_4206 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4207 ?AUTO_4208 ?AUTO_4206 )
      ( DELIVER-PKG ?AUTO_4205 ?AUTO_4206 )
      ( DELIVER-PKG-VERIFY ?AUTO_4205 ?AUTO_4206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4233 - OBJ
      ?AUTO_4234 - LOCATION
    )
    :vars
    (
      ?AUTO_4235 - LOCATION
      ?AUTO_4236 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4235 ) ( AIRPORT ?AUTO_4234 ) ( AIRPLANE-AT ?AUTO_4236 ?AUTO_4235 ) ( not ( = ?AUTO_4235 ?AUTO_4234 ) ) ( OBJ-AT ?AUTO_4233 ?AUTO_4235 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4233 ?AUTO_4236 ?AUTO_4235 )
      ( DELIVER-PKG ?AUTO_4233 ?AUTO_4234 )
      ( DELIVER-PKG-VERIFY ?AUTO_4233 ?AUTO_4234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4239 - OBJ
      ?AUTO_4240 - LOCATION
    )
    :vars
    (
      ?AUTO_4242 - LOCATION
      ?AUTO_4243 - LOCATION
      ?AUTO_4241 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4242 ) ( AIRPORT ?AUTO_4240 ) ( not ( = ?AUTO_4242 ?AUTO_4240 ) ) ( OBJ-AT ?AUTO_4239 ?AUTO_4242 ) ( AIRPORT ?AUTO_4243 ) ( AIRPLANE-AT ?AUTO_4241 ?AUTO_4243 ) ( not ( = ?AUTO_4243 ?AUTO_4242 ) ) ( not ( = ?AUTO_4240 ?AUTO_4243 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4241 ?AUTO_4243 ?AUTO_4242 )
      ( DELIVER-PKG ?AUTO_4239 ?AUTO_4240 )
      ( DELIVER-PKG-VERIFY ?AUTO_4239 ?AUTO_4240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4244 - OBJ
      ?AUTO_4245 - LOCATION
    )
    :vars
    (
      ?AUTO_4247 - LOCATION
      ?AUTO_4248 - LOCATION
      ?AUTO_4246 - AIRPLANE
      ?AUTO_4249 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4247 ) ( AIRPORT ?AUTO_4245 ) ( not ( = ?AUTO_4247 ?AUTO_4245 ) ) ( AIRPORT ?AUTO_4248 ) ( AIRPLANE-AT ?AUTO_4246 ?AUTO_4248 ) ( not ( = ?AUTO_4248 ?AUTO_4247 ) ) ( not ( = ?AUTO_4245 ?AUTO_4248 ) ) ( TRUCK-AT ?AUTO_4249 ?AUTO_4247 ) ( IN-TRUCK ?AUTO_4244 ?AUTO_4249 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4244 ?AUTO_4249 ?AUTO_4247 )
      ( DELIVER-PKG ?AUTO_4244 ?AUTO_4245 )
      ( DELIVER-PKG-VERIFY ?AUTO_4244 ?AUTO_4245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4250 - OBJ
      ?AUTO_4251 - LOCATION
    )
    :vars
    (
      ?AUTO_4252 - LOCATION
      ?AUTO_4254 - LOCATION
      ?AUTO_4253 - AIRPLANE
      ?AUTO_4255 - TRUCK
      ?AUTO_4256 - LOCATION
      ?AUTO_4257 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4252 ) ( AIRPORT ?AUTO_4251 ) ( not ( = ?AUTO_4252 ?AUTO_4251 ) ) ( AIRPORT ?AUTO_4254 ) ( AIRPLANE-AT ?AUTO_4253 ?AUTO_4254 ) ( not ( = ?AUTO_4254 ?AUTO_4252 ) ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) ( IN-TRUCK ?AUTO_4250 ?AUTO_4255 ) ( TRUCK-AT ?AUTO_4255 ?AUTO_4256 ) ( IN-CITY ?AUTO_4256 ?AUTO_4257 ) ( IN-CITY ?AUTO_4252 ?AUTO_4257 ) ( not ( = ?AUTO_4252 ?AUTO_4256 ) ) ( not ( = ?AUTO_4251 ?AUTO_4256 ) ) ( not ( = ?AUTO_4254 ?AUTO_4256 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4255 ?AUTO_4256 ?AUTO_4252 ?AUTO_4257 )
      ( DELIVER-PKG ?AUTO_4250 ?AUTO_4251 )
      ( DELIVER-PKG-VERIFY ?AUTO_4250 ?AUTO_4251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4258 - OBJ
      ?AUTO_4259 - LOCATION
    )
    :vars
    (
      ?AUTO_4263 - LOCATION
      ?AUTO_4264 - LOCATION
      ?AUTO_4260 - AIRPLANE
      ?AUTO_4262 - TRUCK
      ?AUTO_4265 - LOCATION
      ?AUTO_4261 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4263 ) ( AIRPORT ?AUTO_4259 ) ( not ( = ?AUTO_4263 ?AUTO_4259 ) ) ( AIRPORT ?AUTO_4264 ) ( AIRPLANE-AT ?AUTO_4260 ?AUTO_4264 ) ( not ( = ?AUTO_4264 ?AUTO_4263 ) ) ( not ( = ?AUTO_4259 ?AUTO_4264 ) ) ( TRUCK-AT ?AUTO_4262 ?AUTO_4265 ) ( IN-CITY ?AUTO_4265 ?AUTO_4261 ) ( IN-CITY ?AUTO_4263 ?AUTO_4261 ) ( not ( = ?AUTO_4263 ?AUTO_4265 ) ) ( not ( = ?AUTO_4259 ?AUTO_4265 ) ) ( not ( = ?AUTO_4264 ?AUTO_4265 ) ) ( OBJ-AT ?AUTO_4258 ?AUTO_4265 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4258 ?AUTO_4262 ?AUTO_4265 )
      ( DELIVER-PKG ?AUTO_4258 ?AUTO_4259 )
      ( DELIVER-PKG-VERIFY ?AUTO_4258 ?AUTO_4259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4268 - OBJ
      ?AUTO_4269 - LOCATION
    )
    :vars
    (
      ?AUTO_4270 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4268 ?AUTO_4270 ) ( AIRPLANE-AT ?AUTO_4270 ?AUTO_4269 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4268 ?AUTO_4270 ?AUTO_4269 )
      ( DELIVER-PKG-VERIFY ?AUTO_4268 ?AUTO_4269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4279 - OBJ
      ?AUTO_4280 - LOCATION
    )
    :vars
    (
      ?AUTO_4281 - LOCATION
      ?AUTO_4282 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4281 ) ( AIRPORT ?AUTO_4280 ) ( AIRPLANE-AT ?AUTO_4282 ?AUTO_4281 ) ( not ( = ?AUTO_4281 ?AUTO_4280 ) ) ( OBJ-AT ?AUTO_4279 ?AUTO_4281 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4279 ?AUTO_4282 ?AUTO_4281 )
      ( DELIVER-PKG ?AUTO_4279 ?AUTO_4280 )
      ( DELIVER-PKG-VERIFY ?AUTO_4279 ?AUTO_4280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4283 - OBJ
      ?AUTO_4284 - LOCATION
    )
    :vars
    (
      ?AUTO_4285 - LOCATION
      ?AUTO_4287 - LOCATION
      ?AUTO_4286 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4285 ) ( AIRPORT ?AUTO_4284 ) ( not ( = ?AUTO_4285 ?AUTO_4284 ) ) ( OBJ-AT ?AUTO_4283 ?AUTO_4285 ) ( AIRPORT ?AUTO_4287 ) ( AIRPLANE-AT ?AUTO_4286 ?AUTO_4287 ) ( not ( = ?AUTO_4287 ?AUTO_4285 ) ) ( not ( = ?AUTO_4284 ?AUTO_4287 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4286 ?AUTO_4287 ?AUTO_4285 )
      ( DELIVER-PKG ?AUTO_4283 ?AUTO_4284 )
      ( DELIVER-PKG-VERIFY ?AUTO_4283 ?AUTO_4284 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4318 - OBJ
      ?AUTO_4319 - LOCATION
    )
    :vars
    (
      ?AUTO_4320 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4320 ?AUTO_4319 ) ( IN-TRUCK ?AUTO_4318 ?AUTO_4320 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4318 ?AUTO_4320 ?AUTO_4319 )
      ( DELIVER-PKG-VERIFY ?AUTO_4318 ?AUTO_4319 ) )
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
      ?AUTO_4326 - LOCATION
      ?AUTO_4327 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4323 ?AUTO_4325 ) ( TRUCK-AT ?AUTO_4325 ?AUTO_4326 ) ( IN-CITY ?AUTO_4326 ?AUTO_4327 ) ( IN-CITY ?AUTO_4324 ?AUTO_4327 ) ( not ( = ?AUTO_4324 ?AUTO_4326 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4325 ?AUTO_4326 ?AUTO_4324 ?AUTO_4327 )
      ( DELIVER-PKG ?AUTO_4323 ?AUTO_4324 )
      ( DELIVER-PKG-VERIFY ?AUTO_4323 ?AUTO_4324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4332 - OBJ
      ?AUTO_4333 - LOCATION
    )
    :vars
    (
      ?AUTO_4336 - TRUCK
      ?AUTO_4334 - LOCATION
      ?AUTO_4335 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4336 ?AUTO_4334 ) ( IN-CITY ?AUTO_4334 ?AUTO_4335 ) ( IN-CITY ?AUTO_4333 ?AUTO_4335 ) ( not ( = ?AUTO_4333 ?AUTO_4334 ) ) ( OBJ-AT ?AUTO_4332 ?AUTO_4334 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4332 ?AUTO_4336 ?AUTO_4334 )
      ( DELIVER-PKG ?AUTO_4332 ?AUTO_4333 )
      ( DELIVER-PKG-VERIFY ?AUTO_4332 ?AUTO_4333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4339 - OBJ
      ?AUTO_4340 - LOCATION
    )
    :vars
    (
      ?AUTO_4343 - TRUCK
      ?AUTO_4342 - LOCATION
      ?AUTO_4341 - CITY
      ?AUTO_4344 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4343 ?AUTO_4342 ) ( IN-CITY ?AUTO_4342 ?AUTO_4341 ) ( IN-CITY ?AUTO_4340 ?AUTO_4341 ) ( not ( = ?AUTO_4340 ?AUTO_4342 ) ) ( IN-AIRPLANE ?AUTO_4339 ?AUTO_4344 ) ( AIRPLANE-AT ?AUTO_4344 ?AUTO_4342 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4339 ?AUTO_4344 ?AUTO_4342 )
      ( DELIVER-PKG ?AUTO_4339 ?AUTO_4340 )
      ( DELIVER-PKG-VERIFY ?AUTO_4339 ?AUTO_4340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4345 - OBJ
      ?AUTO_4346 - LOCATION
    )
    :vars
    (
      ?AUTO_4349 - TRUCK
      ?AUTO_4347 - LOCATION
      ?AUTO_4348 - CITY
      ?AUTO_4350 - AIRPLANE
      ?AUTO_4351 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4349 ?AUTO_4347 ) ( IN-CITY ?AUTO_4347 ?AUTO_4348 ) ( IN-CITY ?AUTO_4346 ?AUTO_4348 ) ( not ( = ?AUTO_4346 ?AUTO_4347 ) ) ( IN-AIRPLANE ?AUTO_4345 ?AUTO_4350 ) ( AIRPORT ?AUTO_4351 ) ( AIRPORT ?AUTO_4347 ) ( AIRPLANE-AT ?AUTO_4350 ?AUTO_4351 ) ( not ( = ?AUTO_4351 ?AUTO_4347 ) ) ( not ( = ?AUTO_4346 ?AUTO_4351 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4350 ?AUTO_4351 ?AUTO_4347 )
      ( DELIVER-PKG ?AUTO_4345 ?AUTO_4346 )
      ( DELIVER-PKG-VERIFY ?AUTO_4345 ?AUTO_4346 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4362 - OBJ
      ?AUTO_4363 - LOCATION
    )
    :vars
    (
      ?AUTO_4366 - LOCATION
      ?AUTO_4364 - CITY
      ?AUTO_4368 - AIRPLANE
      ?AUTO_4365 - LOCATION
      ?AUTO_4367 - TRUCK
      ?AUTO_4369 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4366 ?AUTO_4364 ) ( IN-CITY ?AUTO_4363 ?AUTO_4364 ) ( not ( = ?AUTO_4363 ?AUTO_4366 ) ) ( IN-AIRPLANE ?AUTO_4362 ?AUTO_4368 ) ( AIRPORT ?AUTO_4365 ) ( AIRPORT ?AUTO_4366 ) ( AIRPLANE-AT ?AUTO_4368 ?AUTO_4365 ) ( not ( = ?AUTO_4365 ?AUTO_4366 ) ) ( not ( = ?AUTO_4363 ?AUTO_4365 ) ) ( TRUCK-AT ?AUTO_4367 ?AUTO_4369 ) ( IN-CITY ?AUTO_4369 ?AUTO_4364 ) ( not ( = ?AUTO_4366 ?AUTO_4369 ) ) ( not ( = ?AUTO_4363 ?AUTO_4369 ) ) ( not ( = ?AUTO_4365 ?AUTO_4369 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4367 ?AUTO_4369 ?AUTO_4366 ?AUTO_4364 )
      ( DELIVER-PKG ?AUTO_4362 ?AUTO_4363 )
      ( DELIVER-PKG-VERIFY ?AUTO_4362 ?AUTO_4363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4382 - OBJ
      ?AUTO_4383 - LOCATION
    )
    :vars
    (
      ?AUTO_4384 - LOCATION
      ?AUTO_4389 - CITY
      ?AUTO_4388 - LOCATION
      ?AUTO_4387 - AIRPLANE
      ?AUTO_4385 - TRUCK
      ?AUTO_4386 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4384 ?AUTO_4389 ) ( IN-CITY ?AUTO_4383 ?AUTO_4389 ) ( not ( = ?AUTO_4383 ?AUTO_4384 ) ) ( AIRPORT ?AUTO_4388 ) ( AIRPORT ?AUTO_4384 ) ( AIRPLANE-AT ?AUTO_4387 ?AUTO_4388 ) ( not ( = ?AUTO_4388 ?AUTO_4384 ) ) ( not ( = ?AUTO_4383 ?AUTO_4388 ) ) ( TRUCK-AT ?AUTO_4385 ?AUTO_4386 ) ( IN-CITY ?AUTO_4386 ?AUTO_4389 ) ( not ( = ?AUTO_4384 ?AUTO_4386 ) ) ( not ( = ?AUTO_4383 ?AUTO_4386 ) ) ( not ( = ?AUTO_4388 ?AUTO_4386 ) ) ( OBJ-AT ?AUTO_4382 ?AUTO_4388 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4382 ?AUTO_4387 ?AUTO_4388 )
      ( DELIVER-PKG ?AUTO_4382 ?AUTO_4383 )
      ( DELIVER-PKG-VERIFY ?AUTO_4382 ?AUTO_4383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4392 - OBJ
      ?AUTO_4393 - LOCATION
    )
    :vars
    (
      ?AUTO_4396 - LOCATION
      ?AUTO_4397 - CITY
      ?AUTO_4395 - LOCATION
      ?AUTO_4399 - TRUCK
      ?AUTO_4398 - LOCATION
      ?AUTO_4400 - LOCATION
      ?AUTO_4394 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4396 ?AUTO_4397 ) ( IN-CITY ?AUTO_4393 ?AUTO_4397 ) ( not ( = ?AUTO_4393 ?AUTO_4396 ) ) ( AIRPORT ?AUTO_4395 ) ( AIRPORT ?AUTO_4396 ) ( not ( = ?AUTO_4395 ?AUTO_4396 ) ) ( not ( = ?AUTO_4393 ?AUTO_4395 ) ) ( TRUCK-AT ?AUTO_4399 ?AUTO_4398 ) ( IN-CITY ?AUTO_4398 ?AUTO_4397 ) ( not ( = ?AUTO_4396 ?AUTO_4398 ) ) ( not ( = ?AUTO_4393 ?AUTO_4398 ) ) ( not ( = ?AUTO_4395 ?AUTO_4398 ) ) ( OBJ-AT ?AUTO_4392 ?AUTO_4395 ) ( AIRPORT ?AUTO_4400 ) ( AIRPLANE-AT ?AUTO_4394 ?AUTO_4400 ) ( not ( = ?AUTO_4400 ?AUTO_4395 ) ) ( not ( = ?AUTO_4393 ?AUTO_4400 ) ) ( not ( = ?AUTO_4396 ?AUTO_4400 ) ) ( not ( = ?AUTO_4398 ?AUTO_4400 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4394 ?AUTO_4400 ?AUTO_4395 )
      ( DELIVER-PKG ?AUTO_4392 ?AUTO_4393 )
      ( DELIVER-PKG-VERIFY ?AUTO_4392 ?AUTO_4393 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4401 - OBJ
      ?AUTO_4402 - LOCATION
    )
    :vars
    (
      ?AUTO_4408 - LOCATION
      ?AUTO_4409 - CITY
      ?AUTO_4403 - LOCATION
      ?AUTO_4404 - TRUCK
      ?AUTO_4405 - LOCATION
      ?AUTO_4407 - LOCATION
      ?AUTO_4406 - AIRPLANE
      ?AUTO_4410 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4408 ?AUTO_4409 ) ( IN-CITY ?AUTO_4402 ?AUTO_4409 ) ( not ( = ?AUTO_4402 ?AUTO_4408 ) ) ( AIRPORT ?AUTO_4403 ) ( AIRPORT ?AUTO_4408 ) ( not ( = ?AUTO_4403 ?AUTO_4408 ) ) ( not ( = ?AUTO_4402 ?AUTO_4403 ) ) ( TRUCK-AT ?AUTO_4404 ?AUTO_4405 ) ( IN-CITY ?AUTO_4405 ?AUTO_4409 ) ( not ( = ?AUTO_4408 ?AUTO_4405 ) ) ( not ( = ?AUTO_4402 ?AUTO_4405 ) ) ( not ( = ?AUTO_4403 ?AUTO_4405 ) ) ( AIRPORT ?AUTO_4407 ) ( AIRPLANE-AT ?AUTO_4406 ?AUTO_4407 ) ( not ( = ?AUTO_4407 ?AUTO_4403 ) ) ( not ( = ?AUTO_4402 ?AUTO_4407 ) ) ( not ( = ?AUTO_4408 ?AUTO_4407 ) ) ( not ( = ?AUTO_4405 ?AUTO_4407 ) ) ( TRUCK-AT ?AUTO_4410 ?AUTO_4403 ) ( IN-TRUCK ?AUTO_4401 ?AUTO_4410 ) ( not ( = ?AUTO_4404 ?AUTO_4410 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4401 ?AUTO_4410 ?AUTO_4403 )
      ( DELIVER-PKG ?AUTO_4401 ?AUTO_4402 )
      ( DELIVER-PKG-VERIFY ?AUTO_4401 ?AUTO_4402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4411 - OBJ
      ?AUTO_4412 - LOCATION
    )
    :vars
    (
      ?AUTO_4418 - LOCATION
      ?AUTO_4420 - CITY
      ?AUTO_4414 - LOCATION
      ?AUTO_4416 - TRUCK
      ?AUTO_4413 - LOCATION
      ?AUTO_4419 - LOCATION
      ?AUTO_4415 - AIRPLANE
      ?AUTO_4417 - TRUCK
      ?AUTO_4421 - LOCATION
      ?AUTO_4422 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4418 ?AUTO_4420 ) ( IN-CITY ?AUTO_4412 ?AUTO_4420 ) ( not ( = ?AUTO_4412 ?AUTO_4418 ) ) ( AIRPORT ?AUTO_4414 ) ( AIRPORT ?AUTO_4418 ) ( not ( = ?AUTO_4414 ?AUTO_4418 ) ) ( not ( = ?AUTO_4412 ?AUTO_4414 ) ) ( TRUCK-AT ?AUTO_4416 ?AUTO_4413 ) ( IN-CITY ?AUTO_4413 ?AUTO_4420 ) ( not ( = ?AUTO_4418 ?AUTO_4413 ) ) ( not ( = ?AUTO_4412 ?AUTO_4413 ) ) ( not ( = ?AUTO_4414 ?AUTO_4413 ) ) ( AIRPORT ?AUTO_4419 ) ( AIRPLANE-AT ?AUTO_4415 ?AUTO_4419 ) ( not ( = ?AUTO_4419 ?AUTO_4414 ) ) ( not ( = ?AUTO_4412 ?AUTO_4419 ) ) ( not ( = ?AUTO_4418 ?AUTO_4419 ) ) ( not ( = ?AUTO_4413 ?AUTO_4419 ) ) ( IN-TRUCK ?AUTO_4411 ?AUTO_4417 ) ( not ( = ?AUTO_4416 ?AUTO_4417 ) ) ( TRUCK-AT ?AUTO_4417 ?AUTO_4421 ) ( IN-CITY ?AUTO_4421 ?AUTO_4422 ) ( IN-CITY ?AUTO_4414 ?AUTO_4422 ) ( not ( = ?AUTO_4414 ?AUTO_4421 ) ) ( not ( = ?AUTO_4412 ?AUTO_4421 ) ) ( not ( = ?AUTO_4418 ?AUTO_4421 ) ) ( not ( = ?AUTO_4420 ?AUTO_4422 ) ) ( not ( = ?AUTO_4413 ?AUTO_4421 ) ) ( not ( = ?AUTO_4419 ?AUTO_4421 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4417 ?AUTO_4421 ?AUTO_4414 ?AUTO_4422 )
      ( DELIVER-PKG ?AUTO_4411 ?AUTO_4412 )
      ( DELIVER-PKG-VERIFY ?AUTO_4411 ?AUTO_4412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4423 - OBJ
      ?AUTO_4424 - LOCATION
    )
    :vars
    (
      ?AUTO_4434 - LOCATION
      ?AUTO_4425 - CITY
      ?AUTO_4428 - LOCATION
      ?AUTO_4427 - TRUCK
      ?AUTO_4429 - LOCATION
      ?AUTO_4431 - LOCATION
      ?AUTO_4426 - AIRPLANE
      ?AUTO_4430 - TRUCK
      ?AUTO_4433 - LOCATION
      ?AUTO_4432 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4434 ?AUTO_4425 ) ( IN-CITY ?AUTO_4424 ?AUTO_4425 ) ( not ( = ?AUTO_4424 ?AUTO_4434 ) ) ( AIRPORT ?AUTO_4428 ) ( AIRPORT ?AUTO_4434 ) ( not ( = ?AUTO_4428 ?AUTO_4434 ) ) ( not ( = ?AUTO_4424 ?AUTO_4428 ) ) ( TRUCK-AT ?AUTO_4427 ?AUTO_4429 ) ( IN-CITY ?AUTO_4429 ?AUTO_4425 ) ( not ( = ?AUTO_4434 ?AUTO_4429 ) ) ( not ( = ?AUTO_4424 ?AUTO_4429 ) ) ( not ( = ?AUTO_4428 ?AUTO_4429 ) ) ( AIRPORT ?AUTO_4431 ) ( AIRPLANE-AT ?AUTO_4426 ?AUTO_4431 ) ( not ( = ?AUTO_4431 ?AUTO_4428 ) ) ( not ( = ?AUTO_4424 ?AUTO_4431 ) ) ( not ( = ?AUTO_4434 ?AUTO_4431 ) ) ( not ( = ?AUTO_4429 ?AUTO_4431 ) ) ( not ( = ?AUTO_4427 ?AUTO_4430 ) ) ( TRUCK-AT ?AUTO_4430 ?AUTO_4433 ) ( IN-CITY ?AUTO_4433 ?AUTO_4432 ) ( IN-CITY ?AUTO_4428 ?AUTO_4432 ) ( not ( = ?AUTO_4428 ?AUTO_4433 ) ) ( not ( = ?AUTO_4424 ?AUTO_4433 ) ) ( not ( = ?AUTO_4434 ?AUTO_4433 ) ) ( not ( = ?AUTO_4425 ?AUTO_4432 ) ) ( not ( = ?AUTO_4429 ?AUTO_4433 ) ) ( not ( = ?AUTO_4431 ?AUTO_4433 ) ) ( OBJ-AT ?AUTO_4423 ?AUTO_4433 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4423 ?AUTO_4430 ?AUTO_4433 )
      ( DELIVER-PKG ?AUTO_4423 ?AUTO_4424 )
      ( DELIVER-PKG-VERIFY ?AUTO_4423 ?AUTO_4424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4437 - OBJ
      ?AUTO_4438 - LOCATION
    )
    :vars
    (
      ?AUTO_4439 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4439 ?AUTO_4438 ) ( IN-TRUCK ?AUTO_4437 ?AUTO_4439 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4437 ?AUTO_4439 ?AUTO_4438 )
      ( DELIVER-PKG-VERIFY ?AUTO_4437 ?AUTO_4438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4440 - OBJ
      ?AUTO_4441 - LOCATION
    )
    :vars
    (
      ?AUTO_4442 - TRUCK
      ?AUTO_4443 - LOCATION
      ?AUTO_4444 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4440 ?AUTO_4442 ) ( TRUCK-AT ?AUTO_4442 ?AUTO_4443 ) ( IN-CITY ?AUTO_4443 ?AUTO_4444 ) ( IN-CITY ?AUTO_4441 ?AUTO_4444 ) ( not ( = ?AUTO_4441 ?AUTO_4443 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4442 ?AUTO_4443 ?AUTO_4441 ?AUTO_4444 )
      ( DELIVER-PKG ?AUTO_4440 ?AUTO_4441 )
      ( DELIVER-PKG-VERIFY ?AUTO_4440 ?AUTO_4441 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4447 - OBJ
      ?AUTO_4448 - LOCATION
    )
    :vars
    (
      ?AUTO_4449 - TRUCK
      ?AUTO_4451 - LOCATION
      ?AUTO_4450 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4449 ?AUTO_4451 ) ( IN-CITY ?AUTO_4451 ?AUTO_4450 ) ( IN-CITY ?AUTO_4448 ?AUTO_4450 ) ( not ( = ?AUTO_4448 ?AUTO_4451 ) ) ( OBJ-AT ?AUTO_4447 ?AUTO_4451 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4447 ?AUTO_4449 ?AUTO_4451 )
      ( DELIVER-PKG ?AUTO_4447 ?AUTO_4448 )
      ( DELIVER-PKG-VERIFY ?AUTO_4447 ?AUTO_4448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4452 - OBJ
      ?AUTO_4453 - LOCATION
    )
    :vars
    (
      ?AUTO_4454 - LOCATION
      ?AUTO_4455 - CITY
      ?AUTO_4456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4454 ?AUTO_4455 ) ( IN-CITY ?AUTO_4453 ?AUTO_4455 ) ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( OBJ-AT ?AUTO_4452 ?AUTO_4454 ) ( TRUCK-AT ?AUTO_4456 ?AUTO_4453 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4456 ?AUTO_4453 ?AUTO_4454 ?AUTO_4455 )
      ( DELIVER-PKG ?AUTO_4452 ?AUTO_4453 )
      ( DELIVER-PKG-VERIFY ?AUTO_4452 ?AUTO_4453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4479 - OBJ
      ?AUTO_4480 - LOCATION
    )
    :vars
    (
      ?AUTO_4482 - LOCATION
      ?AUTO_4481 - CITY
      ?AUTO_4483 - TRUCK
      ?AUTO_4484 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4482 ?AUTO_4481 ) ( IN-CITY ?AUTO_4480 ?AUTO_4481 ) ( not ( = ?AUTO_4480 ?AUTO_4482 ) ) ( OBJ-AT ?AUTO_4479 ?AUTO_4482 ) ( TRUCK-AT ?AUTO_4483 ?AUTO_4484 ) ( IN-CITY ?AUTO_4484 ?AUTO_4481 ) ( not ( = ?AUTO_4480 ?AUTO_4484 ) ) ( not ( = ?AUTO_4482 ?AUTO_4484 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4483 ?AUTO_4484 ?AUTO_4480 ?AUTO_4481 )
      ( DELIVER-PKG ?AUTO_4479 ?AUTO_4480 )
      ( DELIVER-PKG-VERIFY ?AUTO_4479 ?AUTO_4480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4511 - OBJ
      ?AUTO_4512 - LOCATION
    )
    :vars
    (
      ?AUTO_4513 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4513 ?AUTO_4512 ) ( IN-TRUCK ?AUTO_4511 ?AUTO_4513 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4511 ?AUTO_4513 ?AUTO_4512 )
      ( DELIVER-PKG-VERIFY ?AUTO_4511 ?AUTO_4512 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4518 - OBJ
      ?AUTO_4519 - LOCATION
    )
    :vars
    (
      ?AUTO_4520 - TRUCK
      ?AUTO_4521 - LOCATION
      ?AUTO_4522 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4518 ?AUTO_4520 ) ( TRUCK-AT ?AUTO_4520 ?AUTO_4521 ) ( IN-CITY ?AUTO_4521 ?AUTO_4522 ) ( IN-CITY ?AUTO_4519 ?AUTO_4522 ) ( not ( = ?AUTO_4519 ?AUTO_4521 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4520 ?AUTO_4521 ?AUTO_4519 ?AUTO_4522 )
      ( DELIVER-PKG ?AUTO_4518 ?AUTO_4519 )
      ( DELIVER-PKG-VERIFY ?AUTO_4518 ?AUTO_4519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4539 - OBJ
      ?AUTO_4540 - LOCATION
    )
    :vars
    (
      ?AUTO_4541 - TRUCK
      ?AUTO_4542 - LOCATION
      ?AUTO_4543 - CITY
      ?AUTO_4544 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4541 ?AUTO_4542 ) ( IN-CITY ?AUTO_4542 ?AUTO_4543 ) ( IN-CITY ?AUTO_4540 ?AUTO_4543 ) ( not ( = ?AUTO_4540 ?AUTO_4542 ) ) ( IN-AIRPLANE ?AUTO_4539 ?AUTO_4544 ) ( AIRPLANE-AT ?AUTO_4544 ?AUTO_4542 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4539 ?AUTO_4544 ?AUTO_4542 )
      ( DELIVER-PKG ?AUTO_4539 ?AUTO_4540 )
      ( DELIVER-PKG-VERIFY ?AUTO_4539 ?AUTO_4540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4553 - OBJ
      ?AUTO_4554 - LOCATION
    )
    :vars
    (
      ?AUTO_4558 - TRUCK
      ?AUTO_4557 - LOCATION
      ?AUTO_4556 - CITY
      ?AUTO_4555 - LOCATION
      ?AUTO_4559 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4558 ?AUTO_4557 ) ( IN-CITY ?AUTO_4557 ?AUTO_4556 ) ( IN-CITY ?AUTO_4554 ?AUTO_4556 ) ( not ( = ?AUTO_4554 ?AUTO_4557 ) ) ( AIRPORT ?AUTO_4555 ) ( AIRPORT ?AUTO_4557 ) ( AIRPLANE-AT ?AUTO_4559 ?AUTO_4555 ) ( not ( = ?AUTO_4555 ?AUTO_4557 ) ) ( not ( = ?AUTO_4554 ?AUTO_4555 ) ) ( OBJ-AT ?AUTO_4553 ?AUTO_4555 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4553 ?AUTO_4559 ?AUTO_4555 )
      ( DELIVER-PKG ?AUTO_4553 ?AUTO_4554 )
      ( DELIVER-PKG-VERIFY ?AUTO_4553 ?AUTO_4554 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4560 - OBJ
      ?AUTO_4561 - LOCATION
    )
    :vars
    (
      ?AUTO_4565 - TRUCK
      ?AUTO_4564 - LOCATION
      ?AUTO_4562 - CITY
      ?AUTO_4563 - LOCATION
      ?AUTO_4567 - LOCATION
      ?AUTO_4566 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4565 ?AUTO_4564 ) ( IN-CITY ?AUTO_4564 ?AUTO_4562 ) ( IN-CITY ?AUTO_4561 ?AUTO_4562 ) ( not ( = ?AUTO_4561 ?AUTO_4564 ) ) ( AIRPORT ?AUTO_4563 ) ( AIRPORT ?AUTO_4564 ) ( not ( = ?AUTO_4563 ?AUTO_4564 ) ) ( not ( = ?AUTO_4561 ?AUTO_4563 ) ) ( OBJ-AT ?AUTO_4560 ?AUTO_4563 ) ( AIRPORT ?AUTO_4567 ) ( AIRPLANE-AT ?AUTO_4566 ?AUTO_4567 ) ( not ( = ?AUTO_4567 ?AUTO_4563 ) ) ( not ( = ?AUTO_4561 ?AUTO_4567 ) ) ( not ( = ?AUTO_4564 ?AUTO_4567 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4566 ?AUTO_4567 ?AUTO_4563 )
      ( DELIVER-PKG ?AUTO_4560 ?AUTO_4561 )
      ( DELIVER-PKG-VERIFY ?AUTO_4560 ?AUTO_4561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4570 - OBJ
      ?AUTO_4571 - LOCATION
    )
    :vars
    (
      ?AUTO_4577 - LOCATION
      ?AUTO_4574 - CITY
      ?AUTO_4576 - LOCATION
      ?AUTO_4572 - LOCATION
      ?AUTO_4573 - AIRPLANE
      ?AUTO_4575 - TRUCK
      ?AUTO_4578 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4577 ?AUTO_4574 ) ( IN-CITY ?AUTO_4571 ?AUTO_4574 ) ( not ( = ?AUTO_4571 ?AUTO_4577 ) ) ( AIRPORT ?AUTO_4576 ) ( AIRPORT ?AUTO_4577 ) ( not ( = ?AUTO_4576 ?AUTO_4577 ) ) ( not ( = ?AUTO_4571 ?AUTO_4576 ) ) ( OBJ-AT ?AUTO_4570 ?AUTO_4576 ) ( AIRPORT ?AUTO_4572 ) ( AIRPLANE-AT ?AUTO_4573 ?AUTO_4572 ) ( not ( = ?AUTO_4572 ?AUTO_4576 ) ) ( not ( = ?AUTO_4571 ?AUTO_4572 ) ) ( not ( = ?AUTO_4577 ?AUTO_4572 ) ) ( TRUCK-AT ?AUTO_4575 ?AUTO_4578 ) ( IN-CITY ?AUTO_4578 ?AUTO_4574 ) ( not ( = ?AUTO_4577 ?AUTO_4578 ) ) ( not ( = ?AUTO_4571 ?AUTO_4578 ) ) ( not ( = ?AUTO_4576 ?AUTO_4578 ) ) ( not ( = ?AUTO_4572 ?AUTO_4578 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4575 ?AUTO_4578 ?AUTO_4577 ?AUTO_4574 )
      ( DELIVER-PKG ?AUTO_4570 ?AUTO_4571 )
      ( DELIVER-PKG-VERIFY ?AUTO_4570 ?AUTO_4571 ) )
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
      ?AUTO_4610 - OBJ
      ?AUTO_4611 - LOCATION
    )
    :vars
    (
      ?AUTO_4612 - AIRPLANE
      ?AUTO_4613 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4610 ?AUTO_4612 ) ( AIRPORT ?AUTO_4613 ) ( AIRPORT ?AUTO_4611 ) ( AIRPLANE-AT ?AUTO_4612 ?AUTO_4613 ) ( not ( = ?AUTO_4613 ?AUTO_4611 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4612 ?AUTO_4613 ?AUTO_4611 )
      ( DELIVER-PKG ?AUTO_4610 ?AUTO_4611 )
      ( DELIVER-PKG-VERIFY ?AUTO_4610 ?AUTO_4611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4628 - OBJ
      ?AUTO_4629 - LOCATION
    )
    :vars
    (
      ?AUTO_4631 - LOCATION
      ?AUTO_4630 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4631 ) ( AIRPORT ?AUTO_4629 ) ( AIRPLANE-AT ?AUTO_4630 ?AUTO_4631 ) ( not ( = ?AUTO_4631 ?AUTO_4629 ) ) ( OBJ-AT ?AUTO_4628 ?AUTO_4631 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4628 ?AUTO_4630 ?AUTO_4631 )
      ( DELIVER-PKG ?AUTO_4628 ?AUTO_4629 )
      ( DELIVER-PKG-VERIFY ?AUTO_4628 ?AUTO_4629 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4640 - OBJ
      ?AUTO_4641 - LOCATION
    )
    :vars
    (
      ?AUTO_4643 - LOCATION
      ?AUTO_4642 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4643 ) ( AIRPORT ?AUTO_4641 ) ( not ( = ?AUTO_4643 ?AUTO_4641 ) ) ( OBJ-AT ?AUTO_4640 ?AUTO_4643 ) ( AIRPLANE-AT ?AUTO_4642 ?AUTO_4641 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4642 ?AUTO_4641 ?AUTO_4643 )
      ( DELIVER-PKG ?AUTO_4640 ?AUTO_4641 )
      ( DELIVER-PKG-VERIFY ?AUTO_4640 ?AUTO_4641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4652 - OBJ
      ?AUTO_4653 - LOCATION
    )
    :vars
    (
      ?AUTO_4657 - TRUCK
      ?AUTO_4658 - LOCATION
      ?AUTO_4656 - CITY
      ?AUTO_4659 - LOCATION
      ?AUTO_4655 - LOCATION
      ?AUTO_4654 - AIRPLANE
      ?AUTO_4660 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4657 ?AUTO_4658 ) ( IN-CITY ?AUTO_4658 ?AUTO_4656 ) ( IN-CITY ?AUTO_4653 ?AUTO_4656 ) ( not ( = ?AUTO_4653 ?AUTO_4658 ) ) ( AIRPORT ?AUTO_4659 ) ( AIRPORT ?AUTO_4658 ) ( not ( = ?AUTO_4659 ?AUTO_4658 ) ) ( not ( = ?AUTO_4653 ?AUTO_4659 ) ) ( AIRPORT ?AUTO_4655 ) ( AIRPLANE-AT ?AUTO_4654 ?AUTO_4655 ) ( not ( = ?AUTO_4655 ?AUTO_4659 ) ) ( not ( = ?AUTO_4653 ?AUTO_4655 ) ) ( not ( = ?AUTO_4658 ?AUTO_4655 ) ) ( TRUCK-AT ?AUTO_4660 ?AUTO_4659 ) ( IN-TRUCK ?AUTO_4652 ?AUTO_4660 ) ( not ( = ?AUTO_4657 ?AUTO_4660 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4652 ?AUTO_4660 ?AUTO_4659 )
      ( DELIVER-PKG ?AUTO_4652 ?AUTO_4653 )
      ( DELIVER-PKG-VERIFY ?AUTO_4652 ?AUTO_4653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4661 - OBJ
      ?AUTO_4662 - LOCATION
    )
    :vars
    (
      ?AUTO_4668 - TRUCK
      ?AUTO_4666 - LOCATION
      ?AUTO_4667 - CITY
      ?AUTO_4664 - LOCATION
      ?AUTO_4665 - LOCATION
      ?AUTO_4663 - AIRPLANE
      ?AUTO_4669 - TRUCK
      ?AUTO_4670 - LOCATION
      ?AUTO_4671 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4668 ?AUTO_4666 ) ( IN-CITY ?AUTO_4666 ?AUTO_4667 ) ( IN-CITY ?AUTO_4662 ?AUTO_4667 ) ( not ( = ?AUTO_4662 ?AUTO_4666 ) ) ( AIRPORT ?AUTO_4664 ) ( AIRPORT ?AUTO_4666 ) ( not ( = ?AUTO_4664 ?AUTO_4666 ) ) ( not ( = ?AUTO_4662 ?AUTO_4664 ) ) ( AIRPORT ?AUTO_4665 ) ( AIRPLANE-AT ?AUTO_4663 ?AUTO_4665 ) ( not ( = ?AUTO_4665 ?AUTO_4664 ) ) ( not ( = ?AUTO_4662 ?AUTO_4665 ) ) ( not ( = ?AUTO_4666 ?AUTO_4665 ) ) ( IN-TRUCK ?AUTO_4661 ?AUTO_4669 ) ( not ( = ?AUTO_4668 ?AUTO_4669 ) ) ( TRUCK-AT ?AUTO_4669 ?AUTO_4670 ) ( IN-CITY ?AUTO_4670 ?AUTO_4671 ) ( IN-CITY ?AUTO_4664 ?AUTO_4671 ) ( not ( = ?AUTO_4664 ?AUTO_4670 ) ) ( not ( = ?AUTO_4662 ?AUTO_4670 ) ) ( not ( = ?AUTO_4666 ?AUTO_4670 ) ) ( not ( = ?AUTO_4667 ?AUTO_4671 ) ) ( not ( = ?AUTO_4665 ?AUTO_4670 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4669 ?AUTO_4670 ?AUTO_4664 ?AUTO_4671 )
      ( DELIVER-PKG ?AUTO_4661 ?AUTO_4662 )
      ( DELIVER-PKG-VERIFY ?AUTO_4661 ?AUTO_4662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4682 - OBJ
      ?AUTO_4683 - LOCATION
    )
    :vars
    (
      ?AUTO_4687 - TRUCK
      ?AUTO_4690 - LOCATION
      ?AUTO_4692 - CITY
      ?AUTO_4684 - LOCATION
      ?AUTO_4685 - LOCATION
      ?AUTO_4691 - AIRPLANE
      ?AUTO_4689 - TRUCK
      ?AUTO_4686 - LOCATION
      ?AUTO_4688 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4687 ?AUTO_4690 ) ( IN-CITY ?AUTO_4690 ?AUTO_4692 ) ( IN-CITY ?AUTO_4683 ?AUTO_4692 ) ( not ( = ?AUTO_4683 ?AUTO_4690 ) ) ( AIRPORT ?AUTO_4684 ) ( AIRPORT ?AUTO_4690 ) ( not ( = ?AUTO_4684 ?AUTO_4690 ) ) ( not ( = ?AUTO_4683 ?AUTO_4684 ) ) ( AIRPORT ?AUTO_4685 ) ( AIRPLANE-AT ?AUTO_4691 ?AUTO_4685 ) ( not ( = ?AUTO_4685 ?AUTO_4684 ) ) ( not ( = ?AUTO_4683 ?AUTO_4685 ) ) ( not ( = ?AUTO_4690 ?AUTO_4685 ) ) ( not ( = ?AUTO_4687 ?AUTO_4689 ) ) ( TRUCK-AT ?AUTO_4689 ?AUTO_4686 ) ( IN-CITY ?AUTO_4686 ?AUTO_4688 ) ( IN-CITY ?AUTO_4684 ?AUTO_4688 ) ( not ( = ?AUTO_4684 ?AUTO_4686 ) ) ( not ( = ?AUTO_4683 ?AUTO_4686 ) ) ( not ( = ?AUTO_4690 ?AUTO_4686 ) ) ( not ( = ?AUTO_4692 ?AUTO_4688 ) ) ( not ( = ?AUTO_4685 ?AUTO_4686 ) ) ( OBJ-AT ?AUTO_4682 ?AUTO_4686 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4682 ?AUTO_4689 ?AUTO_4686 )
      ( DELIVER-PKG ?AUTO_4682 ?AUTO_4683 )
      ( DELIVER-PKG-VERIFY ?AUTO_4682 ?AUTO_4683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4695 - OBJ
      ?AUTO_4696 - LOCATION
    )
    :vars
    (
      ?AUTO_4704 - TRUCK
      ?AUTO_4702 - LOCATION
      ?AUTO_4700 - CITY
      ?AUTO_4705 - LOCATION
      ?AUTO_4699 - LOCATION
      ?AUTO_4701 - AIRPLANE
      ?AUTO_4703 - TRUCK
      ?AUTO_4698 - LOCATION
      ?AUTO_4697 - CITY
      ?AUTO_4706 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4704 ?AUTO_4702 ) ( IN-CITY ?AUTO_4702 ?AUTO_4700 ) ( IN-CITY ?AUTO_4696 ?AUTO_4700 ) ( not ( = ?AUTO_4696 ?AUTO_4702 ) ) ( AIRPORT ?AUTO_4705 ) ( AIRPORT ?AUTO_4702 ) ( not ( = ?AUTO_4705 ?AUTO_4702 ) ) ( not ( = ?AUTO_4696 ?AUTO_4705 ) ) ( AIRPORT ?AUTO_4699 ) ( AIRPLANE-AT ?AUTO_4701 ?AUTO_4699 ) ( not ( = ?AUTO_4699 ?AUTO_4705 ) ) ( not ( = ?AUTO_4696 ?AUTO_4699 ) ) ( not ( = ?AUTO_4702 ?AUTO_4699 ) ) ( not ( = ?AUTO_4704 ?AUTO_4703 ) ) ( IN-CITY ?AUTO_4698 ?AUTO_4697 ) ( IN-CITY ?AUTO_4705 ?AUTO_4697 ) ( not ( = ?AUTO_4705 ?AUTO_4698 ) ) ( not ( = ?AUTO_4696 ?AUTO_4698 ) ) ( not ( = ?AUTO_4702 ?AUTO_4698 ) ) ( not ( = ?AUTO_4700 ?AUTO_4697 ) ) ( not ( = ?AUTO_4699 ?AUTO_4698 ) ) ( OBJ-AT ?AUTO_4695 ?AUTO_4698 ) ( TRUCK-AT ?AUTO_4703 ?AUTO_4706 ) ( IN-CITY ?AUTO_4706 ?AUTO_4697 ) ( not ( = ?AUTO_4698 ?AUTO_4706 ) ) ( not ( = ?AUTO_4696 ?AUTO_4706 ) ) ( not ( = ?AUTO_4702 ?AUTO_4706 ) ) ( not ( = ?AUTO_4705 ?AUTO_4706 ) ) ( not ( = ?AUTO_4699 ?AUTO_4706 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4703 ?AUTO_4706 ?AUTO_4698 ?AUTO_4697 )
      ( DELIVER-PKG ?AUTO_4695 ?AUTO_4696 )
      ( DELIVER-PKG-VERIFY ?AUTO_4695 ?AUTO_4696 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4717 - OBJ
      ?AUTO_4718 - LOCATION
    )
    :vars
    (
      ?AUTO_4719 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4717 ?AUTO_4719 ) ( AIRPLANE-AT ?AUTO_4719 ?AUTO_4718 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4717 ?AUTO_4719 ?AUTO_4718 )
      ( DELIVER-PKG-VERIFY ?AUTO_4717 ?AUTO_4718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4720 - OBJ
      ?AUTO_4721 - LOCATION
    )
    :vars
    (
      ?AUTO_4722 - AIRPLANE
      ?AUTO_4723 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4720 ?AUTO_4722 ) ( AIRPORT ?AUTO_4723 ) ( AIRPORT ?AUTO_4721 ) ( AIRPLANE-AT ?AUTO_4722 ?AUTO_4723 ) ( not ( = ?AUTO_4723 ?AUTO_4721 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4722 ?AUTO_4723 ?AUTO_4721 )
      ( DELIVER-PKG ?AUTO_4720 ?AUTO_4721 )
      ( DELIVER-PKG-VERIFY ?AUTO_4720 ?AUTO_4721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4730 - OBJ
      ?AUTO_4731 - LOCATION
    )
    :vars
    (
      ?AUTO_4732 - LOCATION
      ?AUTO_4733 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4732 ) ( AIRPORT ?AUTO_4731 ) ( AIRPLANE-AT ?AUTO_4733 ?AUTO_4732 ) ( not ( = ?AUTO_4732 ?AUTO_4731 ) ) ( OBJ-AT ?AUTO_4730 ?AUTO_4732 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4730 ?AUTO_4733 ?AUTO_4732 )
      ( DELIVER-PKG ?AUTO_4730 ?AUTO_4731 )
      ( DELIVER-PKG-VERIFY ?AUTO_4730 ?AUTO_4731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4736 - OBJ
      ?AUTO_4737 - LOCATION
    )
    :vars
    (
      ?AUTO_4738 - LOCATION
      ?AUTO_4739 - AIRPLANE
      ?AUTO_4740 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4738 ) ( AIRPORT ?AUTO_4737 ) ( AIRPLANE-AT ?AUTO_4739 ?AUTO_4738 ) ( not ( = ?AUTO_4738 ?AUTO_4737 ) ) ( TRUCK-AT ?AUTO_4740 ?AUTO_4738 ) ( IN-TRUCK ?AUTO_4736 ?AUTO_4740 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4736 ?AUTO_4740 ?AUTO_4738 )
      ( DELIVER-PKG ?AUTO_4736 ?AUTO_4737 )
      ( DELIVER-PKG-VERIFY ?AUTO_4736 ?AUTO_4737 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4741 - OBJ
      ?AUTO_4742 - LOCATION
    )
    :vars
    (
      ?AUTO_4744 - LOCATION
      ?AUTO_4743 - AIRPLANE
      ?AUTO_4745 - TRUCK
      ?AUTO_4746 - LOCATION
      ?AUTO_4747 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4744 ) ( AIRPORT ?AUTO_4742 ) ( AIRPLANE-AT ?AUTO_4743 ?AUTO_4744 ) ( not ( = ?AUTO_4744 ?AUTO_4742 ) ) ( IN-TRUCK ?AUTO_4741 ?AUTO_4745 ) ( TRUCK-AT ?AUTO_4745 ?AUTO_4746 ) ( IN-CITY ?AUTO_4746 ?AUTO_4747 ) ( IN-CITY ?AUTO_4744 ?AUTO_4747 ) ( not ( = ?AUTO_4744 ?AUTO_4746 ) ) ( not ( = ?AUTO_4742 ?AUTO_4746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4745 ?AUTO_4746 ?AUTO_4744 ?AUTO_4747 )
      ( DELIVER-PKG ?AUTO_4741 ?AUTO_4742 )
      ( DELIVER-PKG-VERIFY ?AUTO_4741 ?AUTO_4742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4750 - OBJ
      ?AUTO_4751 - LOCATION
    )
    :vars
    (
      ?AUTO_4755 - LOCATION
      ?AUTO_4756 - AIRPLANE
      ?AUTO_4754 - TRUCK
      ?AUTO_4752 - LOCATION
      ?AUTO_4753 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4755 ) ( AIRPORT ?AUTO_4751 ) ( AIRPLANE-AT ?AUTO_4756 ?AUTO_4755 ) ( not ( = ?AUTO_4755 ?AUTO_4751 ) ) ( TRUCK-AT ?AUTO_4754 ?AUTO_4752 ) ( IN-CITY ?AUTO_4752 ?AUTO_4753 ) ( IN-CITY ?AUTO_4755 ?AUTO_4753 ) ( not ( = ?AUTO_4755 ?AUTO_4752 ) ) ( not ( = ?AUTO_4751 ?AUTO_4752 ) ) ( OBJ-AT ?AUTO_4750 ?AUTO_4752 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4750 ?AUTO_4754 ?AUTO_4752 )
      ( DELIVER-PKG ?AUTO_4750 ?AUTO_4751 )
      ( DELIVER-PKG-VERIFY ?AUTO_4750 ?AUTO_4751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4757 - OBJ
      ?AUTO_4758 - LOCATION
    )
    :vars
    (
      ?AUTO_4762 - LOCATION
      ?AUTO_4763 - AIRPLANE
      ?AUTO_4759 - LOCATION
      ?AUTO_4761 - CITY
      ?AUTO_4760 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4762 ) ( AIRPORT ?AUTO_4758 ) ( AIRPLANE-AT ?AUTO_4763 ?AUTO_4762 ) ( not ( = ?AUTO_4762 ?AUTO_4758 ) ) ( IN-CITY ?AUTO_4759 ?AUTO_4761 ) ( IN-CITY ?AUTO_4762 ?AUTO_4761 ) ( not ( = ?AUTO_4762 ?AUTO_4759 ) ) ( not ( = ?AUTO_4758 ?AUTO_4759 ) ) ( OBJ-AT ?AUTO_4757 ?AUTO_4759 ) ( TRUCK-AT ?AUTO_4760 ?AUTO_4762 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4760 ?AUTO_4762 ?AUTO_4759 ?AUTO_4761 )
      ( DELIVER-PKG ?AUTO_4757 ?AUTO_4758 )
      ( DELIVER-PKG-VERIFY ?AUTO_4757 ?AUTO_4758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4774 - OBJ
      ?AUTO_4775 - LOCATION
    )
    :vars
    (
      ?AUTO_4779 - LOCATION
      ?AUTO_4777 - LOCATION
      ?AUTO_4780 - CITY
      ?AUTO_4776 - TRUCK
      ?AUTO_4781 - LOCATION
      ?AUTO_4778 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4779 ) ( AIRPORT ?AUTO_4775 ) ( not ( = ?AUTO_4779 ?AUTO_4775 ) ) ( IN-CITY ?AUTO_4777 ?AUTO_4780 ) ( IN-CITY ?AUTO_4779 ?AUTO_4780 ) ( not ( = ?AUTO_4779 ?AUTO_4777 ) ) ( not ( = ?AUTO_4775 ?AUTO_4777 ) ) ( OBJ-AT ?AUTO_4774 ?AUTO_4777 ) ( TRUCK-AT ?AUTO_4776 ?AUTO_4779 ) ( AIRPORT ?AUTO_4781 ) ( AIRPLANE-AT ?AUTO_4778 ?AUTO_4781 ) ( not ( = ?AUTO_4781 ?AUTO_4779 ) ) ( not ( = ?AUTO_4775 ?AUTO_4781 ) ) ( not ( = ?AUTO_4777 ?AUTO_4781 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4778 ?AUTO_4781 ?AUTO_4779 )
      ( DELIVER-PKG ?AUTO_4774 ?AUTO_4775 )
      ( DELIVER-PKG-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4792 - OBJ
      ?AUTO_4793 - LOCATION
    )
    :vars
    (
      ?AUTO_4798 - LOCATION
      ?AUTO_4795 - LOCATION
      ?AUTO_4799 - CITY
      ?AUTO_4794 - LOCATION
      ?AUTO_4797 - AIRPLANE
      ?AUTO_4796 - TRUCK
      ?AUTO_4800 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4798 ) ( AIRPORT ?AUTO_4793 ) ( not ( = ?AUTO_4798 ?AUTO_4793 ) ) ( IN-CITY ?AUTO_4795 ?AUTO_4799 ) ( IN-CITY ?AUTO_4798 ?AUTO_4799 ) ( not ( = ?AUTO_4798 ?AUTO_4795 ) ) ( not ( = ?AUTO_4793 ?AUTO_4795 ) ) ( OBJ-AT ?AUTO_4792 ?AUTO_4795 ) ( AIRPORT ?AUTO_4794 ) ( AIRPLANE-AT ?AUTO_4797 ?AUTO_4794 ) ( not ( = ?AUTO_4794 ?AUTO_4798 ) ) ( not ( = ?AUTO_4793 ?AUTO_4794 ) ) ( not ( = ?AUTO_4795 ?AUTO_4794 ) ) ( TRUCK-AT ?AUTO_4796 ?AUTO_4800 ) ( IN-CITY ?AUTO_4800 ?AUTO_4799 ) ( not ( = ?AUTO_4798 ?AUTO_4800 ) ) ( not ( = ?AUTO_4793 ?AUTO_4800 ) ) ( not ( = ?AUTO_4795 ?AUTO_4800 ) ) ( not ( = ?AUTO_4794 ?AUTO_4800 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4796 ?AUTO_4800 ?AUTO_4798 ?AUTO_4799 )
      ( DELIVER-PKG ?AUTO_4792 ?AUTO_4793 )
      ( DELIVER-PKG-VERIFY ?AUTO_4792 ?AUTO_4793 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4803 - OBJ
      ?AUTO_4804 - LOCATION
    )
    :vars
    (
      ?AUTO_4805 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4805 ?AUTO_4804 ) ( IN-TRUCK ?AUTO_4803 ?AUTO_4805 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4803 ?AUTO_4805 ?AUTO_4804 )
      ( DELIVER-PKG-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4814 - OBJ
      ?AUTO_4815 - LOCATION
    )
    :vars
    (
      ?AUTO_4816 - TRUCK
      ?AUTO_4817 - LOCATION
      ?AUTO_4818 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4814 ?AUTO_4816 ) ( TRUCK-AT ?AUTO_4816 ?AUTO_4817 ) ( IN-CITY ?AUTO_4817 ?AUTO_4818 ) ( IN-CITY ?AUTO_4815 ?AUTO_4818 ) ( not ( = ?AUTO_4815 ?AUTO_4817 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4816 ?AUTO_4817 ?AUTO_4815 ?AUTO_4818 )
      ( DELIVER-PKG ?AUTO_4814 ?AUTO_4815 )
      ( DELIVER-PKG-VERIFY ?AUTO_4814 ?AUTO_4815 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4819 - OBJ
      ?AUTO_4820 - LOCATION
    )
    :vars
    (
      ?AUTO_4821 - TRUCK
      ?AUTO_4822 - LOCATION
      ?AUTO_4823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4821 ?AUTO_4822 ) ( IN-CITY ?AUTO_4822 ?AUTO_4823 ) ( IN-CITY ?AUTO_4820 ?AUTO_4823 ) ( not ( = ?AUTO_4820 ?AUTO_4822 ) ) ( OBJ-AT ?AUTO_4819 ?AUTO_4822 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4819 ?AUTO_4821 ?AUTO_4822 )
      ( DELIVER-PKG ?AUTO_4819 ?AUTO_4820 )
      ( DELIVER-PKG-VERIFY ?AUTO_4819 ?AUTO_4820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4828 - OBJ
      ?AUTO_4829 - LOCATION
    )
    :vars
    (
      ?AUTO_4830 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4830 ?AUTO_4829 ) ( IN-TRUCK ?AUTO_4828 ?AUTO_4830 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4828 ?AUTO_4830 ?AUTO_4829 )
      ( DELIVER-PKG-VERIFY ?AUTO_4828 ?AUTO_4829 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4837 - OBJ
      ?AUTO_4838 - LOCATION
    )
    :vars
    (
      ?AUTO_4839 - TRUCK
      ?AUTO_4840 - LOCATION
      ?AUTO_4841 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4837 ?AUTO_4839 ) ( TRUCK-AT ?AUTO_4839 ?AUTO_4840 ) ( IN-CITY ?AUTO_4840 ?AUTO_4841 ) ( IN-CITY ?AUTO_4838 ?AUTO_4841 ) ( not ( = ?AUTO_4838 ?AUTO_4840 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4839 ?AUTO_4840 ?AUTO_4838 ?AUTO_4841 )
      ( DELIVER-PKG ?AUTO_4837 ?AUTO_4838 )
      ( DELIVER-PKG-VERIFY ?AUTO_4837 ?AUTO_4838 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4842 - OBJ
      ?AUTO_4843 - LOCATION
    )
    :vars
    (
      ?AUTO_4844 - TRUCK
      ?AUTO_4845 - LOCATION
      ?AUTO_4846 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4844 ?AUTO_4845 ) ( IN-CITY ?AUTO_4845 ?AUTO_4846 ) ( IN-CITY ?AUTO_4843 ?AUTO_4846 ) ( not ( = ?AUTO_4843 ?AUTO_4845 ) ) ( OBJ-AT ?AUTO_4842 ?AUTO_4845 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4842 ?AUTO_4844 ?AUTO_4845 )
      ( DELIVER-PKG ?AUTO_4842 ?AUTO_4843 )
      ( DELIVER-PKG-VERIFY ?AUTO_4842 ?AUTO_4843 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4855 - OBJ
      ?AUTO_4856 - LOCATION
    )
    :vars
    (
      ?AUTO_4857 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4857 ?AUTO_4856 ) ( IN-TRUCK ?AUTO_4855 ?AUTO_4857 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4855 ?AUTO_4857 ?AUTO_4856 )
      ( DELIVER-PKG-VERIFY ?AUTO_4855 ?AUTO_4856 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4862 - OBJ
      ?AUTO_4863 - LOCATION
    )
    :vars
    (
      ?AUTO_4864 - TRUCK
      ?AUTO_4865 - LOCATION
      ?AUTO_4866 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4862 ?AUTO_4864 ) ( TRUCK-AT ?AUTO_4864 ?AUTO_4865 ) ( IN-CITY ?AUTO_4865 ?AUTO_4866 ) ( IN-CITY ?AUTO_4863 ?AUTO_4866 ) ( not ( = ?AUTO_4863 ?AUTO_4865 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4864 ?AUTO_4865 ?AUTO_4863 ?AUTO_4866 )
      ( DELIVER-PKG ?AUTO_4862 ?AUTO_4863 )
      ( DELIVER-PKG-VERIFY ?AUTO_4862 ?AUTO_4863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4867 - OBJ
      ?AUTO_4868 - LOCATION
    )
    :vars
    (
      ?AUTO_4869 - TRUCK
      ?AUTO_4870 - LOCATION
      ?AUTO_4871 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4869 ?AUTO_4870 ) ( IN-CITY ?AUTO_4870 ?AUTO_4871 ) ( IN-CITY ?AUTO_4868 ?AUTO_4871 ) ( not ( = ?AUTO_4868 ?AUTO_4870 ) ) ( OBJ-AT ?AUTO_4867 ?AUTO_4870 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4867 ?AUTO_4869 ?AUTO_4870 )
      ( DELIVER-PKG ?AUTO_4867 ?AUTO_4868 )
      ( DELIVER-PKG-VERIFY ?AUTO_4867 ?AUTO_4868 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4880 - OBJ
      ?AUTO_4881 - LOCATION
    )
    :vars
    (
      ?AUTO_4882 - LOCATION
      ?AUTO_4884 - CITY
      ?AUTO_4883 - TRUCK
      ?AUTO_4885 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4882 ?AUTO_4884 ) ( IN-CITY ?AUTO_4881 ?AUTO_4884 ) ( not ( = ?AUTO_4881 ?AUTO_4882 ) ) ( OBJ-AT ?AUTO_4880 ?AUTO_4882 ) ( TRUCK-AT ?AUTO_4883 ?AUTO_4885 ) ( IN-CITY ?AUTO_4885 ?AUTO_4884 ) ( not ( = ?AUTO_4882 ?AUTO_4885 ) ) ( not ( = ?AUTO_4881 ?AUTO_4885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4883 ?AUTO_4885 ?AUTO_4882 ?AUTO_4884 )
      ( DELIVER-PKG ?AUTO_4880 ?AUTO_4881 )
      ( DELIVER-PKG-VERIFY ?AUTO_4880 ?AUTO_4881 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4888 - OBJ
      ?AUTO_4889 - LOCATION
    )
    :vars
    (
      ?AUTO_4890 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4890 ?AUTO_4889 ) ( IN-TRUCK ?AUTO_4888 ?AUTO_4890 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4888 ?AUTO_4890 ?AUTO_4889 )
      ( DELIVER-PKG-VERIFY ?AUTO_4888 ?AUTO_4889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4891 - OBJ
      ?AUTO_4892 - LOCATION
    )
    :vars
    (
      ?AUTO_4893 - TRUCK
      ?AUTO_4894 - LOCATION
      ?AUTO_4895 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4891 ?AUTO_4893 ) ( TRUCK-AT ?AUTO_4893 ?AUTO_4894 ) ( IN-CITY ?AUTO_4894 ?AUTO_4895 ) ( IN-CITY ?AUTO_4892 ?AUTO_4895 ) ( not ( = ?AUTO_4892 ?AUTO_4894 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4893 ?AUTO_4894 ?AUTO_4892 ?AUTO_4895 )
      ( DELIVER-PKG ?AUTO_4891 ?AUTO_4892 )
      ( DELIVER-PKG-VERIFY ?AUTO_4891 ?AUTO_4892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4900 - OBJ
      ?AUTO_4901 - LOCATION
    )
    :vars
    (
      ?AUTO_4904 - TRUCK
      ?AUTO_4902 - LOCATION
      ?AUTO_4903 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4904 ?AUTO_4902 ) ( IN-CITY ?AUTO_4902 ?AUTO_4903 ) ( IN-CITY ?AUTO_4901 ?AUTO_4903 ) ( not ( = ?AUTO_4901 ?AUTO_4902 ) ) ( OBJ-AT ?AUTO_4900 ?AUTO_4902 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4900 ?AUTO_4904 ?AUTO_4902 )
      ( DELIVER-PKG ?AUTO_4900 ?AUTO_4901 )
      ( DELIVER-PKG-VERIFY ?AUTO_4900 ?AUTO_4901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4927 - OBJ
      ?AUTO_4928 - LOCATION
    )
    :vars
    (
      ?AUTO_4929 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4927 ?AUTO_4929 ) ( AIRPLANE-AT ?AUTO_4929 ?AUTO_4928 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4927 ?AUTO_4929 ?AUTO_4928 )
      ( DELIVER-PKG-VERIFY ?AUTO_4927 ?AUTO_4928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4930 - OBJ
      ?AUTO_4931 - LOCATION
    )
    :vars
    (
      ?AUTO_4932 - AIRPLANE
      ?AUTO_4933 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4930 ?AUTO_4932 ) ( AIRPORT ?AUTO_4933 ) ( AIRPORT ?AUTO_4931 ) ( AIRPLANE-AT ?AUTO_4932 ?AUTO_4933 ) ( not ( = ?AUTO_4933 ?AUTO_4931 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4932 ?AUTO_4933 ?AUTO_4931 )
      ( DELIVER-PKG ?AUTO_4930 ?AUTO_4931 )
      ( DELIVER-PKG-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4938 - OBJ
      ?AUTO_4939 - LOCATION
    )
    :vars
    (
      ?AUTO_4940 - LOCATION
      ?AUTO_4941 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4940 ) ( AIRPORT ?AUTO_4939 ) ( AIRPLANE-AT ?AUTO_4941 ?AUTO_4940 ) ( not ( = ?AUTO_4940 ?AUTO_4939 ) ) ( OBJ-AT ?AUTO_4938 ?AUTO_4940 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4938 ?AUTO_4941 ?AUTO_4940 )
      ( DELIVER-PKG ?AUTO_4938 ?AUTO_4939 )
      ( DELIVER-PKG-VERIFY ?AUTO_4938 ?AUTO_4939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4942 - OBJ
      ?AUTO_4943 - LOCATION
    )
    :vars
    (
      ?AUTO_4944 - LOCATION
      ?AUTO_4946 - LOCATION
      ?AUTO_4945 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4944 ) ( AIRPORT ?AUTO_4943 ) ( not ( = ?AUTO_4944 ?AUTO_4943 ) ) ( OBJ-AT ?AUTO_4942 ?AUTO_4944 ) ( AIRPORT ?AUTO_4946 ) ( AIRPLANE-AT ?AUTO_4945 ?AUTO_4946 ) ( not ( = ?AUTO_4946 ?AUTO_4944 ) ) ( not ( = ?AUTO_4943 ?AUTO_4946 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4945 ?AUTO_4946 ?AUTO_4944 )
      ( DELIVER-PKG ?AUTO_4942 ?AUTO_4943 )
      ( DELIVER-PKG-VERIFY ?AUTO_4942 ?AUTO_4943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4961 - OBJ
      ?AUTO_4962 - LOCATION
    )
    :vars
    (
      ?AUTO_4964 - LOCATION
      ?AUTO_4963 - LOCATION
      ?AUTO_4965 - AIRPLANE
      ?AUTO_4966 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4964 ) ( AIRPORT ?AUTO_4962 ) ( not ( = ?AUTO_4964 ?AUTO_4962 ) ) ( AIRPORT ?AUTO_4963 ) ( AIRPLANE-AT ?AUTO_4965 ?AUTO_4963 ) ( not ( = ?AUTO_4963 ?AUTO_4964 ) ) ( not ( = ?AUTO_4962 ?AUTO_4963 ) ) ( TRUCK-AT ?AUTO_4966 ?AUTO_4964 ) ( IN-TRUCK ?AUTO_4961 ?AUTO_4966 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4961 ?AUTO_4966 ?AUTO_4964 )
      ( DELIVER-PKG ?AUTO_4961 ?AUTO_4962 )
      ( DELIVER-PKG-VERIFY ?AUTO_4961 ?AUTO_4962 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4975 - OBJ
      ?AUTO_4976 - LOCATION
    )
    :vars
    (
      ?AUTO_4980 - LOCATION
      ?AUTO_4978 - LOCATION
      ?AUTO_4979 - AIRPLANE
      ?AUTO_4977 - TRUCK
      ?AUTO_4981 - LOCATION
      ?AUTO_4982 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4980 ) ( AIRPORT ?AUTO_4976 ) ( not ( = ?AUTO_4980 ?AUTO_4976 ) ) ( AIRPORT ?AUTO_4978 ) ( AIRPLANE-AT ?AUTO_4979 ?AUTO_4978 ) ( not ( = ?AUTO_4978 ?AUTO_4980 ) ) ( not ( = ?AUTO_4976 ?AUTO_4978 ) ) ( IN-TRUCK ?AUTO_4975 ?AUTO_4977 ) ( TRUCK-AT ?AUTO_4977 ?AUTO_4981 ) ( IN-CITY ?AUTO_4981 ?AUTO_4982 ) ( IN-CITY ?AUTO_4980 ?AUTO_4982 ) ( not ( = ?AUTO_4980 ?AUTO_4981 ) ) ( not ( = ?AUTO_4976 ?AUTO_4981 ) ) ( not ( = ?AUTO_4978 ?AUTO_4981 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4977 ?AUTO_4981 ?AUTO_4980 ?AUTO_4982 )
      ( DELIVER-PKG ?AUTO_4975 ?AUTO_4976 )
      ( DELIVER-PKG-VERIFY ?AUTO_4975 ?AUTO_4976 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4983 - OBJ
      ?AUTO_4984 - LOCATION
    )
    :vars
    (
      ?AUTO_4988 - LOCATION
      ?AUTO_4985 - LOCATION
      ?AUTO_4987 - AIRPLANE
      ?AUTO_4986 - TRUCK
      ?AUTO_4990 - LOCATION
      ?AUTO_4989 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4988 ) ( AIRPORT ?AUTO_4984 ) ( not ( = ?AUTO_4988 ?AUTO_4984 ) ) ( AIRPORT ?AUTO_4985 ) ( AIRPLANE-AT ?AUTO_4987 ?AUTO_4985 ) ( not ( = ?AUTO_4985 ?AUTO_4988 ) ) ( not ( = ?AUTO_4984 ?AUTO_4985 ) ) ( TRUCK-AT ?AUTO_4986 ?AUTO_4990 ) ( IN-CITY ?AUTO_4990 ?AUTO_4989 ) ( IN-CITY ?AUTO_4988 ?AUTO_4989 ) ( not ( = ?AUTO_4988 ?AUTO_4990 ) ) ( not ( = ?AUTO_4984 ?AUTO_4990 ) ) ( not ( = ?AUTO_4985 ?AUTO_4990 ) ) ( OBJ-AT ?AUTO_4983 ?AUTO_4990 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4983 ?AUTO_4986 ?AUTO_4990 )
      ( DELIVER-PKG ?AUTO_4983 ?AUTO_4984 )
      ( DELIVER-PKG-VERIFY ?AUTO_4983 ?AUTO_4984 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4995 - OBJ
      ?AUTO_4996 - LOCATION
    )
    :vars
    (
      ?AUTO_4997 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4995 ?AUTO_4997 ) ( AIRPLANE-AT ?AUTO_4997 ?AUTO_4996 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4995 ?AUTO_4997 ?AUTO_4996 )
      ( DELIVER-PKG-VERIFY ?AUTO_4995 ?AUTO_4996 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5022 - OBJ
      ?AUTO_5023 - LOCATION
    )
    :vars
    (
      ?AUTO_5025 - LOCATION
      ?AUTO_5024 - AIRPLANE
      ?AUTO_5026 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5025 ) ( AIRPORT ?AUTO_5023 ) ( AIRPLANE-AT ?AUTO_5024 ?AUTO_5025 ) ( not ( = ?AUTO_5025 ?AUTO_5023 ) ) ( TRUCK-AT ?AUTO_5026 ?AUTO_5025 ) ( IN-TRUCK ?AUTO_5022 ?AUTO_5026 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5022 ?AUTO_5026 ?AUTO_5025 )
      ( DELIVER-PKG ?AUTO_5022 ?AUTO_5023 )
      ( DELIVER-PKG-VERIFY ?AUTO_5022 ?AUTO_5023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5033 - OBJ
      ?AUTO_5034 - LOCATION
    )
    :vars
    (
      ?AUTO_5037 - LOCATION
      ?AUTO_5036 - AIRPLANE
      ?AUTO_5035 - TRUCK
      ?AUTO_5038 - LOCATION
      ?AUTO_5039 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5037 ) ( AIRPORT ?AUTO_5034 ) ( AIRPLANE-AT ?AUTO_5036 ?AUTO_5037 ) ( not ( = ?AUTO_5037 ?AUTO_5034 ) ) ( IN-TRUCK ?AUTO_5033 ?AUTO_5035 ) ( TRUCK-AT ?AUTO_5035 ?AUTO_5038 ) ( IN-CITY ?AUTO_5038 ?AUTO_5039 ) ( IN-CITY ?AUTO_5037 ?AUTO_5039 ) ( not ( = ?AUTO_5037 ?AUTO_5038 ) ) ( not ( = ?AUTO_5034 ?AUTO_5038 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5035 ?AUTO_5038 ?AUTO_5037 ?AUTO_5039 )
      ( DELIVER-PKG ?AUTO_5033 ?AUTO_5034 )
      ( DELIVER-PKG-VERIFY ?AUTO_5033 ?AUTO_5034 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5040 - OBJ
      ?AUTO_5041 - LOCATION
    )
    :vars
    (
      ?AUTO_5044 - LOCATION
      ?AUTO_5042 - AIRPLANE
      ?AUTO_5043 - TRUCK
      ?AUTO_5046 - LOCATION
      ?AUTO_5045 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5044 ) ( AIRPORT ?AUTO_5041 ) ( AIRPLANE-AT ?AUTO_5042 ?AUTO_5044 ) ( not ( = ?AUTO_5044 ?AUTO_5041 ) ) ( TRUCK-AT ?AUTO_5043 ?AUTO_5046 ) ( IN-CITY ?AUTO_5046 ?AUTO_5045 ) ( IN-CITY ?AUTO_5044 ?AUTO_5045 ) ( not ( = ?AUTO_5044 ?AUTO_5046 ) ) ( not ( = ?AUTO_5041 ?AUTO_5046 ) ) ( OBJ-AT ?AUTO_5040 ?AUTO_5046 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5040 ?AUTO_5043 ?AUTO_5046 )
      ( DELIVER-PKG ?AUTO_5040 ?AUTO_5041 )
      ( DELIVER-PKG-VERIFY ?AUTO_5040 ?AUTO_5041 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5055 - OBJ
      ?AUTO_5056 - LOCATION
    )
    :vars
    (
      ?AUTO_5057 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5055 ?AUTO_5057 ) ( AIRPLANE-AT ?AUTO_5057 ?AUTO_5056 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5055 ?AUTO_5057 ?AUTO_5056 )
      ( DELIVER-PKG-VERIFY ?AUTO_5055 ?AUTO_5056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5058 - OBJ
      ?AUTO_5059 - LOCATION
    )
    :vars
    (
      ?AUTO_5060 - AIRPLANE
      ?AUTO_5061 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5058 ?AUTO_5060 ) ( AIRPORT ?AUTO_5061 ) ( AIRPORT ?AUTO_5059 ) ( AIRPLANE-AT ?AUTO_5060 ?AUTO_5061 ) ( not ( = ?AUTO_5061 ?AUTO_5059 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5060 ?AUTO_5061 ?AUTO_5059 )
      ( DELIVER-PKG ?AUTO_5058 ?AUTO_5059 )
      ( DELIVER-PKG-VERIFY ?AUTO_5058 ?AUTO_5059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5072 - OBJ
      ?AUTO_5073 - LOCATION
    )
    :vars
    (
      ?AUTO_5075 - LOCATION
      ?AUTO_5074 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5075 ) ( AIRPORT ?AUTO_5073 ) ( AIRPLANE-AT ?AUTO_5074 ?AUTO_5075 ) ( not ( = ?AUTO_5075 ?AUTO_5073 ) ) ( OBJ-AT ?AUTO_5072 ?AUTO_5075 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5072 ?AUTO_5074 ?AUTO_5075 )
      ( DELIVER-PKG ?AUTO_5072 ?AUTO_5073 )
      ( DELIVER-PKG-VERIFY ?AUTO_5072 ?AUTO_5073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5076 - OBJ
      ?AUTO_5077 - LOCATION
    )
    :vars
    (
      ?AUTO_5078 - LOCATION
      ?AUTO_5080 - LOCATION
      ?AUTO_5079 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5078 ) ( AIRPORT ?AUTO_5077 ) ( not ( = ?AUTO_5078 ?AUTO_5077 ) ) ( OBJ-AT ?AUTO_5076 ?AUTO_5078 ) ( AIRPORT ?AUTO_5080 ) ( AIRPLANE-AT ?AUTO_5079 ?AUTO_5080 ) ( not ( = ?AUTO_5080 ?AUTO_5078 ) ) ( not ( = ?AUTO_5077 ?AUTO_5080 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5079 ?AUTO_5080 ?AUTO_5078 )
      ( DELIVER-PKG ?AUTO_5076 ?AUTO_5077 )
      ( DELIVER-PKG-VERIFY ?AUTO_5076 ?AUTO_5077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5095 - OBJ
      ?AUTO_5096 - LOCATION
    )
    :vars
    (
      ?AUTO_5098 - LOCATION
      ?AUTO_5097 - LOCATION
      ?AUTO_5099 - AIRPLANE
      ?AUTO_5100 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5098 ) ( AIRPORT ?AUTO_5096 ) ( not ( = ?AUTO_5098 ?AUTO_5096 ) ) ( AIRPORT ?AUTO_5097 ) ( AIRPLANE-AT ?AUTO_5099 ?AUTO_5097 ) ( not ( = ?AUTO_5097 ?AUTO_5098 ) ) ( not ( = ?AUTO_5096 ?AUTO_5097 ) ) ( TRUCK-AT ?AUTO_5100 ?AUTO_5098 ) ( IN-TRUCK ?AUTO_5095 ?AUTO_5100 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5095 ?AUTO_5100 ?AUTO_5098 )
      ( DELIVER-PKG ?AUTO_5095 ?AUTO_5096 )
      ( DELIVER-PKG-VERIFY ?AUTO_5095 ?AUTO_5096 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5105 - OBJ
      ?AUTO_5106 - LOCATION
    )
    :vars
    (
      ?AUTO_5108 - LOCATION
      ?AUTO_5110 - LOCATION
      ?AUTO_5109 - AIRPLANE
      ?AUTO_5107 - TRUCK
      ?AUTO_5111 - LOCATION
      ?AUTO_5112 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5108 ) ( AIRPORT ?AUTO_5106 ) ( not ( = ?AUTO_5108 ?AUTO_5106 ) ) ( AIRPORT ?AUTO_5110 ) ( AIRPLANE-AT ?AUTO_5109 ?AUTO_5110 ) ( not ( = ?AUTO_5110 ?AUTO_5108 ) ) ( not ( = ?AUTO_5106 ?AUTO_5110 ) ) ( IN-TRUCK ?AUTO_5105 ?AUTO_5107 ) ( TRUCK-AT ?AUTO_5107 ?AUTO_5111 ) ( IN-CITY ?AUTO_5111 ?AUTO_5112 ) ( IN-CITY ?AUTO_5108 ?AUTO_5112 ) ( not ( = ?AUTO_5108 ?AUTO_5111 ) ) ( not ( = ?AUTO_5106 ?AUTO_5111 ) ) ( not ( = ?AUTO_5110 ?AUTO_5111 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5107 ?AUTO_5111 ?AUTO_5108 ?AUTO_5112 )
      ( DELIVER-PKG ?AUTO_5105 ?AUTO_5106 )
      ( DELIVER-PKG-VERIFY ?AUTO_5105 ?AUTO_5106 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5113 - OBJ
      ?AUTO_5114 - LOCATION
    )
    :vars
    (
      ?AUTO_5116 - LOCATION
      ?AUTO_5115 - LOCATION
      ?AUTO_5118 - AIRPLANE
      ?AUTO_5117 - TRUCK
      ?AUTO_5120 - LOCATION
      ?AUTO_5119 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5116 ) ( AIRPORT ?AUTO_5114 ) ( not ( = ?AUTO_5116 ?AUTO_5114 ) ) ( AIRPORT ?AUTO_5115 ) ( AIRPLANE-AT ?AUTO_5118 ?AUTO_5115 ) ( not ( = ?AUTO_5115 ?AUTO_5116 ) ) ( not ( = ?AUTO_5114 ?AUTO_5115 ) ) ( TRUCK-AT ?AUTO_5117 ?AUTO_5120 ) ( IN-CITY ?AUTO_5120 ?AUTO_5119 ) ( IN-CITY ?AUTO_5116 ?AUTO_5119 ) ( not ( = ?AUTO_5116 ?AUTO_5120 ) ) ( not ( = ?AUTO_5114 ?AUTO_5120 ) ) ( not ( = ?AUTO_5115 ?AUTO_5120 ) ) ( OBJ-AT ?AUTO_5113 ?AUTO_5120 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5113 ?AUTO_5117 ?AUTO_5120 )
      ( DELIVER-PKG ?AUTO_5113 ?AUTO_5114 )
      ( DELIVER-PKG-VERIFY ?AUTO_5113 ?AUTO_5114 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5129 - OBJ
      ?AUTO_5130 - LOCATION
    )
    :vars
    (
      ?AUTO_5134 - LOCATION
      ?AUTO_5131 - LOCATION
      ?AUTO_5132 - AIRPLANE
      ?AUTO_5133 - LOCATION
      ?AUTO_5136 - CITY
      ?AUTO_5135 - TRUCK
      ?AUTO_5137 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5134 ) ( AIRPORT ?AUTO_5130 ) ( not ( = ?AUTO_5134 ?AUTO_5130 ) ) ( AIRPORT ?AUTO_5131 ) ( AIRPLANE-AT ?AUTO_5132 ?AUTO_5131 ) ( not ( = ?AUTO_5131 ?AUTO_5134 ) ) ( not ( = ?AUTO_5130 ?AUTO_5131 ) ) ( IN-CITY ?AUTO_5133 ?AUTO_5136 ) ( IN-CITY ?AUTO_5134 ?AUTO_5136 ) ( not ( = ?AUTO_5134 ?AUTO_5133 ) ) ( not ( = ?AUTO_5130 ?AUTO_5133 ) ) ( not ( = ?AUTO_5131 ?AUTO_5133 ) ) ( OBJ-AT ?AUTO_5129 ?AUTO_5133 ) ( TRUCK-AT ?AUTO_5135 ?AUTO_5137 ) ( IN-CITY ?AUTO_5137 ?AUTO_5136 ) ( not ( = ?AUTO_5133 ?AUTO_5137 ) ) ( not ( = ?AUTO_5130 ?AUTO_5137 ) ) ( not ( = ?AUTO_5134 ?AUTO_5137 ) ) ( not ( = ?AUTO_5131 ?AUTO_5137 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5135 ?AUTO_5137 ?AUTO_5133 ?AUTO_5136 )
      ( DELIVER-PKG ?AUTO_5129 ?AUTO_5130 )
      ( DELIVER-PKG-VERIFY ?AUTO_5129 ?AUTO_5130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5140 - OBJ
      ?AUTO_5141 - LOCATION
    )
    :vars
    (
      ?AUTO_5142 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5140 ?AUTO_5142 ) ( AIRPLANE-AT ?AUTO_5142 ?AUTO_5141 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5140 ?AUTO_5142 ?AUTO_5141 )
      ( DELIVER-PKG-VERIFY ?AUTO_5140 ?AUTO_5141 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5153 - OBJ
      ?AUTO_5154 - LOCATION
    )
    :vars
    (
      ?AUTO_5155 - AIRPLANE
      ?AUTO_5156 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5153 ?AUTO_5155 ) ( AIRPORT ?AUTO_5156 ) ( AIRPORT ?AUTO_5154 ) ( AIRPLANE-AT ?AUTO_5155 ?AUTO_5156 ) ( not ( = ?AUTO_5156 ?AUTO_5154 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5155 ?AUTO_5156 ?AUTO_5154 )
      ( DELIVER-PKG ?AUTO_5153 ?AUTO_5154 )
      ( DELIVER-PKG-VERIFY ?AUTO_5153 ?AUTO_5154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5165 - OBJ
      ?AUTO_5166 - LOCATION
    )
    :vars
    (
      ?AUTO_5167 - LOCATION
      ?AUTO_5168 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5167 ) ( AIRPORT ?AUTO_5166 ) ( AIRPLANE-AT ?AUTO_5168 ?AUTO_5167 ) ( not ( = ?AUTO_5167 ?AUTO_5166 ) ) ( OBJ-AT ?AUTO_5165 ?AUTO_5167 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5165 ?AUTO_5168 ?AUTO_5167 )
      ( DELIVER-PKG ?AUTO_5165 ?AUTO_5166 )
      ( DELIVER-PKG-VERIFY ?AUTO_5165 ?AUTO_5166 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5169 - OBJ
      ?AUTO_5170 - LOCATION
    )
    :vars
    (
      ?AUTO_5172 - LOCATION
      ?AUTO_5173 - LOCATION
      ?AUTO_5171 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5172 ) ( AIRPORT ?AUTO_5170 ) ( not ( = ?AUTO_5172 ?AUTO_5170 ) ) ( OBJ-AT ?AUTO_5169 ?AUTO_5172 ) ( AIRPORT ?AUTO_5173 ) ( AIRPLANE-AT ?AUTO_5171 ?AUTO_5173 ) ( not ( = ?AUTO_5173 ?AUTO_5172 ) ) ( not ( = ?AUTO_5170 ?AUTO_5173 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5171 ?AUTO_5173 ?AUTO_5172 )
      ( DELIVER-PKG ?AUTO_5169 ?AUTO_5170 )
      ( DELIVER-PKG-VERIFY ?AUTO_5169 ?AUTO_5170 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5220 - OBJ
      ?AUTO_5221 - LOCATION
    )
    :vars
    (
      ?AUTO_5222 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5220 ?AUTO_5222 ) ( AIRPLANE-AT ?AUTO_5222 ?AUTO_5221 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5220 ?AUTO_5222 ?AUTO_5221 )
      ( DELIVER-PKG-VERIFY ?AUTO_5220 ?AUTO_5221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5223 - OBJ
      ?AUTO_5224 - LOCATION
    )
    :vars
    (
      ?AUTO_5225 - AIRPLANE
      ?AUTO_5226 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5223 ?AUTO_5225 ) ( AIRPORT ?AUTO_5226 ) ( AIRPORT ?AUTO_5224 ) ( AIRPLANE-AT ?AUTO_5225 ?AUTO_5226 ) ( not ( = ?AUTO_5226 ?AUTO_5224 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5225 ?AUTO_5226 ?AUTO_5224 )
      ( DELIVER-PKG ?AUTO_5223 ?AUTO_5224 )
      ( DELIVER-PKG-VERIFY ?AUTO_5223 ?AUTO_5224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5237 - OBJ
      ?AUTO_5238 - LOCATION
    )
    :vars
    (
      ?AUTO_5240 - LOCATION
      ?AUTO_5239 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5240 ) ( AIRPORT ?AUTO_5238 ) ( AIRPLANE-AT ?AUTO_5239 ?AUTO_5240 ) ( not ( = ?AUTO_5240 ?AUTO_5238 ) ) ( OBJ-AT ?AUTO_5237 ?AUTO_5240 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5237 ?AUTO_5239 ?AUTO_5240 )
      ( DELIVER-PKG ?AUTO_5237 ?AUTO_5238 )
      ( DELIVER-PKG-VERIFY ?AUTO_5237 ?AUTO_5238 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5241 - OBJ
      ?AUTO_5242 - LOCATION
    )
    :vars
    (
      ?AUTO_5244 - LOCATION
      ?AUTO_5245 - LOCATION
      ?AUTO_5243 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5244 ) ( AIRPORT ?AUTO_5242 ) ( not ( = ?AUTO_5244 ?AUTO_5242 ) ) ( OBJ-AT ?AUTO_5241 ?AUTO_5244 ) ( AIRPORT ?AUTO_5245 ) ( AIRPLANE-AT ?AUTO_5243 ?AUTO_5245 ) ( not ( = ?AUTO_5245 ?AUTO_5244 ) ) ( not ( = ?AUTO_5242 ?AUTO_5245 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5243 ?AUTO_5245 ?AUTO_5244 )
      ( DELIVER-PKG ?AUTO_5241 ?AUTO_5242 )
      ( DELIVER-PKG-VERIFY ?AUTO_5241 ?AUTO_5242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5270 - OBJ
      ?AUTO_5271 - LOCATION
    )
    :vars
    (
      ?AUTO_5273 - LOCATION
      ?AUTO_5274 - LOCATION
      ?AUTO_5272 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5273 ) ( AIRPORT ?AUTO_5271 ) ( not ( = ?AUTO_5273 ?AUTO_5271 ) ) ( OBJ-AT ?AUTO_5270 ?AUTO_5273 ) ( AIRPORT ?AUTO_5274 ) ( not ( = ?AUTO_5274 ?AUTO_5273 ) ) ( not ( = ?AUTO_5271 ?AUTO_5274 ) ) ( AIRPLANE-AT ?AUTO_5272 ?AUTO_5271 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5272 ?AUTO_5271 ?AUTO_5274 )
      ( DELIVER-PKG ?AUTO_5270 ?AUTO_5271 )
      ( DELIVER-PKG-VERIFY ?AUTO_5270 ?AUTO_5271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5307 - OBJ
      ?AUTO_5308 - LOCATION
    )
    :vars
    (
      ?AUTO_5309 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5309 ?AUTO_5308 ) ( IN-TRUCK ?AUTO_5307 ?AUTO_5309 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5307 ?AUTO_5309 ?AUTO_5308 )
      ( DELIVER-PKG-VERIFY ?AUTO_5307 ?AUTO_5308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5326 - OBJ
      ?AUTO_5327 - LOCATION
    )
    :vars
    (
      ?AUTO_5328 - TRUCK
      ?AUTO_5329 - LOCATION
      ?AUTO_5330 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5326 ?AUTO_5328 ) ( TRUCK-AT ?AUTO_5328 ?AUTO_5329 ) ( IN-CITY ?AUTO_5329 ?AUTO_5330 ) ( IN-CITY ?AUTO_5327 ?AUTO_5330 ) ( not ( = ?AUTO_5327 ?AUTO_5329 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5328 ?AUTO_5329 ?AUTO_5327 ?AUTO_5330 )
      ( DELIVER-PKG ?AUTO_5326 ?AUTO_5327 )
      ( DELIVER-PKG-VERIFY ?AUTO_5326 ?AUTO_5327 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5339 - OBJ
      ?AUTO_5340 - LOCATION
    )
    :vars
    (
      ?AUTO_5342 - TRUCK
      ?AUTO_5343 - LOCATION
      ?AUTO_5341 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5342 ?AUTO_5343 ) ( IN-CITY ?AUTO_5343 ?AUTO_5341 ) ( IN-CITY ?AUTO_5340 ?AUTO_5341 ) ( not ( = ?AUTO_5340 ?AUTO_5343 ) ) ( OBJ-AT ?AUTO_5339 ?AUTO_5343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5339 ?AUTO_5342 ?AUTO_5343 )
      ( DELIVER-PKG ?AUTO_5339 ?AUTO_5340 )
      ( DELIVER-PKG-VERIFY ?AUTO_5339 ?AUTO_5340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5354 - OBJ
      ?AUTO_5355 - LOCATION
    )
    :vars
    (
      ?AUTO_5356 - TRUCK
      ?AUTO_5358 - LOCATION
      ?AUTO_5357 - CITY
      ?AUTO_5359 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5356 ?AUTO_5358 ) ( IN-CITY ?AUTO_5358 ?AUTO_5357 ) ( IN-CITY ?AUTO_5355 ?AUTO_5357 ) ( not ( = ?AUTO_5355 ?AUTO_5358 ) ) ( IN-AIRPLANE ?AUTO_5354 ?AUTO_5359 ) ( AIRPLANE-AT ?AUTO_5359 ?AUTO_5358 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5354 ?AUTO_5359 ?AUTO_5358 )
      ( DELIVER-PKG ?AUTO_5354 ?AUTO_5355 )
      ( DELIVER-PKG-VERIFY ?AUTO_5354 ?AUTO_5355 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5360 - OBJ
      ?AUTO_5361 - LOCATION
    )
    :vars
    (
      ?AUTO_5363 - TRUCK
      ?AUTO_5364 - LOCATION
      ?AUTO_5362 - CITY
      ?AUTO_5365 - AIRPLANE
      ?AUTO_5366 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5363 ?AUTO_5364 ) ( IN-CITY ?AUTO_5364 ?AUTO_5362 ) ( IN-CITY ?AUTO_5361 ?AUTO_5362 ) ( not ( = ?AUTO_5361 ?AUTO_5364 ) ) ( IN-AIRPLANE ?AUTO_5360 ?AUTO_5365 ) ( AIRPORT ?AUTO_5366 ) ( AIRPORT ?AUTO_5364 ) ( AIRPLANE-AT ?AUTO_5365 ?AUTO_5366 ) ( not ( = ?AUTO_5366 ?AUTO_5364 ) ) ( not ( = ?AUTO_5361 ?AUTO_5366 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5365 ?AUTO_5366 ?AUTO_5364 )
      ( DELIVER-PKG ?AUTO_5360 ?AUTO_5361 )
      ( DELIVER-PKG-VERIFY ?AUTO_5360 ?AUTO_5361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5371 - OBJ
      ?AUTO_5372 - LOCATION
    )
    :vars
    (
      ?AUTO_5374 - TRUCK
      ?AUTO_5376 - LOCATION
      ?AUTO_5375 - CITY
      ?AUTO_5377 - LOCATION
      ?AUTO_5373 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5374 ?AUTO_5376 ) ( IN-CITY ?AUTO_5376 ?AUTO_5375 ) ( IN-CITY ?AUTO_5372 ?AUTO_5375 ) ( not ( = ?AUTO_5372 ?AUTO_5376 ) ) ( AIRPORT ?AUTO_5377 ) ( AIRPORT ?AUTO_5376 ) ( AIRPLANE-AT ?AUTO_5373 ?AUTO_5377 ) ( not ( = ?AUTO_5377 ?AUTO_5376 ) ) ( not ( = ?AUTO_5372 ?AUTO_5377 ) ) ( OBJ-AT ?AUTO_5371 ?AUTO_5377 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5371 ?AUTO_5373 ?AUTO_5377 )
      ( DELIVER-PKG ?AUTO_5371 ?AUTO_5372 )
      ( DELIVER-PKG-VERIFY ?AUTO_5371 ?AUTO_5372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5378 - OBJ
      ?AUTO_5379 - LOCATION
    )
    :vars
    (
      ?AUTO_5380 - TRUCK
      ?AUTO_5382 - LOCATION
      ?AUTO_5383 - CITY
      ?AUTO_5384 - LOCATION
      ?AUTO_5385 - LOCATION
      ?AUTO_5381 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5380 ?AUTO_5382 ) ( IN-CITY ?AUTO_5382 ?AUTO_5383 ) ( IN-CITY ?AUTO_5379 ?AUTO_5383 ) ( not ( = ?AUTO_5379 ?AUTO_5382 ) ) ( AIRPORT ?AUTO_5384 ) ( AIRPORT ?AUTO_5382 ) ( not ( = ?AUTO_5384 ?AUTO_5382 ) ) ( not ( = ?AUTO_5379 ?AUTO_5384 ) ) ( OBJ-AT ?AUTO_5378 ?AUTO_5384 ) ( AIRPORT ?AUTO_5385 ) ( AIRPLANE-AT ?AUTO_5381 ?AUTO_5385 ) ( not ( = ?AUTO_5385 ?AUTO_5384 ) ) ( not ( = ?AUTO_5379 ?AUTO_5385 ) ) ( not ( = ?AUTO_5382 ?AUTO_5385 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5381 ?AUTO_5385 ?AUTO_5384 )
      ( DELIVER-PKG ?AUTO_5378 ?AUTO_5379 )
      ( DELIVER-PKG-VERIFY ?AUTO_5378 ?AUTO_5379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5390 - OBJ
      ?AUTO_5391 - LOCATION
    )
    :vars
    (
      ?AUTO_5393 - LOCATION
      ?AUTO_5397 - CITY
      ?AUTO_5395 - LOCATION
      ?AUTO_5392 - LOCATION
      ?AUTO_5396 - AIRPLANE
      ?AUTO_5394 - TRUCK
      ?AUTO_5398 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5393 ?AUTO_5397 ) ( IN-CITY ?AUTO_5391 ?AUTO_5397 ) ( not ( = ?AUTO_5391 ?AUTO_5393 ) ) ( AIRPORT ?AUTO_5395 ) ( AIRPORT ?AUTO_5393 ) ( not ( = ?AUTO_5395 ?AUTO_5393 ) ) ( not ( = ?AUTO_5391 ?AUTO_5395 ) ) ( OBJ-AT ?AUTO_5390 ?AUTO_5395 ) ( AIRPORT ?AUTO_5392 ) ( AIRPLANE-AT ?AUTO_5396 ?AUTO_5392 ) ( not ( = ?AUTO_5392 ?AUTO_5395 ) ) ( not ( = ?AUTO_5391 ?AUTO_5392 ) ) ( not ( = ?AUTO_5393 ?AUTO_5392 ) ) ( TRUCK-AT ?AUTO_5394 ?AUTO_5398 ) ( IN-CITY ?AUTO_5398 ?AUTO_5397 ) ( not ( = ?AUTO_5393 ?AUTO_5398 ) ) ( not ( = ?AUTO_5391 ?AUTO_5398 ) ) ( not ( = ?AUTO_5395 ?AUTO_5398 ) ) ( not ( = ?AUTO_5392 ?AUTO_5398 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5394 ?AUTO_5398 ?AUTO_5393 ?AUTO_5397 )
      ( DELIVER-PKG ?AUTO_5390 ?AUTO_5391 )
      ( DELIVER-PKG-VERIFY ?AUTO_5390 ?AUTO_5391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5407 - OBJ
      ?AUTO_5408 - LOCATION
    )
    :vars
    (
      ?AUTO_5411 - LOCATION
      ?AUTO_5415 - CITY
      ?AUTO_5410 - LOCATION
      ?AUTO_5413 - LOCATION
      ?AUTO_5409 - AIRPLANE
      ?AUTO_5412 - TRUCK
      ?AUTO_5414 - LOCATION
      ?AUTO_5416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5411 ?AUTO_5415 ) ( IN-CITY ?AUTO_5408 ?AUTO_5415 ) ( not ( = ?AUTO_5408 ?AUTO_5411 ) ) ( AIRPORT ?AUTO_5410 ) ( AIRPORT ?AUTO_5411 ) ( not ( = ?AUTO_5410 ?AUTO_5411 ) ) ( not ( = ?AUTO_5408 ?AUTO_5410 ) ) ( AIRPORT ?AUTO_5413 ) ( AIRPLANE-AT ?AUTO_5409 ?AUTO_5413 ) ( not ( = ?AUTO_5413 ?AUTO_5410 ) ) ( not ( = ?AUTO_5408 ?AUTO_5413 ) ) ( not ( = ?AUTO_5411 ?AUTO_5413 ) ) ( TRUCK-AT ?AUTO_5412 ?AUTO_5414 ) ( IN-CITY ?AUTO_5414 ?AUTO_5415 ) ( not ( = ?AUTO_5411 ?AUTO_5414 ) ) ( not ( = ?AUTO_5408 ?AUTO_5414 ) ) ( not ( = ?AUTO_5410 ?AUTO_5414 ) ) ( not ( = ?AUTO_5413 ?AUTO_5414 ) ) ( TRUCK-AT ?AUTO_5416 ?AUTO_5410 ) ( IN-TRUCK ?AUTO_5407 ?AUTO_5416 ) ( not ( = ?AUTO_5412 ?AUTO_5416 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5407 ?AUTO_5416 ?AUTO_5410 )
      ( DELIVER-PKG ?AUTO_5407 ?AUTO_5408 )
      ( DELIVER-PKG-VERIFY ?AUTO_5407 ?AUTO_5408 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5425 - OBJ
      ?AUTO_5426 - LOCATION
    )
    :vars
    (
      ?AUTO_5433 - LOCATION
      ?AUTO_5429 - CITY
      ?AUTO_5434 - LOCATION
      ?AUTO_5427 - LOCATION
      ?AUTO_5431 - AIRPLANE
      ?AUTO_5432 - TRUCK
      ?AUTO_5430 - LOCATION
      ?AUTO_5428 - TRUCK
      ?AUTO_5435 - LOCATION
      ?AUTO_5436 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5433 ?AUTO_5429 ) ( IN-CITY ?AUTO_5426 ?AUTO_5429 ) ( not ( = ?AUTO_5426 ?AUTO_5433 ) ) ( AIRPORT ?AUTO_5434 ) ( AIRPORT ?AUTO_5433 ) ( not ( = ?AUTO_5434 ?AUTO_5433 ) ) ( not ( = ?AUTO_5426 ?AUTO_5434 ) ) ( AIRPORT ?AUTO_5427 ) ( AIRPLANE-AT ?AUTO_5431 ?AUTO_5427 ) ( not ( = ?AUTO_5427 ?AUTO_5434 ) ) ( not ( = ?AUTO_5426 ?AUTO_5427 ) ) ( not ( = ?AUTO_5433 ?AUTO_5427 ) ) ( TRUCK-AT ?AUTO_5432 ?AUTO_5430 ) ( IN-CITY ?AUTO_5430 ?AUTO_5429 ) ( not ( = ?AUTO_5433 ?AUTO_5430 ) ) ( not ( = ?AUTO_5426 ?AUTO_5430 ) ) ( not ( = ?AUTO_5434 ?AUTO_5430 ) ) ( not ( = ?AUTO_5427 ?AUTO_5430 ) ) ( IN-TRUCK ?AUTO_5425 ?AUTO_5428 ) ( not ( = ?AUTO_5432 ?AUTO_5428 ) ) ( TRUCK-AT ?AUTO_5428 ?AUTO_5435 ) ( IN-CITY ?AUTO_5435 ?AUTO_5436 ) ( IN-CITY ?AUTO_5434 ?AUTO_5436 ) ( not ( = ?AUTO_5434 ?AUTO_5435 ) ) ( not ( = ?AUTO_5426 ?AUTO_5435 ) ) ( not ( = ?AUTO_5433 ?AUTO_5435 ) ) ( not ( = ?AUTO_5429 ?AUTO_5436 ) ) ( not ( = ?AUTO_5427 ?AUTO_5435 ) ) ( not ( = ?AUTO_5430 ?AUTO_5435 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5428 ?AUTO_5435 ?AUTO_5434 ?AUTO_5436 )
      ( DELIVER-PKG ?AUTO_5425 ?AUTO_5426 )
      ( DELIVER-PKG-VERIFY ?AUTO_5425 ?AUTO_5426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5437 - OBJ
      ?AUTO_5438 - LOCATION
    )
    :vars
    (
      ?AUTO_5439 - LOCATION
      ?AUTO_5447 - CITY
      ?AUTO_5440 - LOCATION
      ?AUTO_5446 - LOCATION
      ?AUTO_5444 - AIRPLANE
      ?AUTO_5443 - TRUCK
      ?AUTO_5445 - LOCATION
      ?AUTO_5448 - TRUCK
      ?AUTO_5441 - LOCATION
      ?AUTO_5442 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5439 ?AUTO_5447 ) ( IN-CITY ?AUTO_5438 ?AUTO_5447 ) ( not ( = ?AUTO_5438 ?AUTO_5439 ) ) ( AIRPORT ?AUTO_5440 ) ( AIRPORT ?AUTO_5439 ) ( not ( = ?AUTO_5440 ?AUTO_5439 ) ) ( not ( = ?AUTO_5438 ?AUTO_5440 ) ) ( AIRPORT ?AUTO_5446 ) ( AIRPLANE-AT ?AUTO_5444 ?AUTO_5446 ) ( not ( = ?AUTO_5446 ?AUTO_5440 ) ) ( not ( = ?AUTO_5438 ?AUTO_5446 ) ) ( not ( = ?AUTO_5439 ?AUTO_5446 ) ) ( TRUCK-AT ?AUTO_5443 ?AUTO_5445 ) ( IN-CITY ?AUTO_5445 ?AUTO_5447 ) ( not ( = ?AUTO_5439 ?AUTO_5445 ) ) ( not ( = ?AUTO_5438 ?AUTO_5445 ) ) ( not ( = ?AUTO_5440 ?AUTO_5445 ) ) ( not ( = ?AUTO_5446 ?AUTO_5445 ) ) ( not ( = ?AUTO_5443 ?AUTO_5448 ) ) ( TRUCK-AT ?AUTO_5448 ?AUTO_5441 ) ( IN-CITY ?AUTO_5441 ?AUTO_5442 ) ( IN-CITY ?AUTO_5440 ?AUTO_5442 ) ( not ( = ?AUTO_5440 ?AUTO_5441 ) ) ( not ( = ?AUTO_5438 ?AUTO_5441 ) ) ( not ( = ?AUTO_5439 ?AUTO_5441 ) ) ( not ( = ?AUTO_5447 ?AUTO_5442 ) ) ( not ( = ?AUTO_5446 ?AUTO_5441 ) ) ( not ( = ?AUTO_5445 ?AUTO_5441 ) ) ( OBJ-AT ?AUTO_5437 ?AUTO_5441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5437 ?AUTO_5448 ?AUTO_5441 )
      ( DELIVER-PKG ?AUTO_5437 ?AUTO_5438 )
      ( DELIVER-PKG-VERIFY ?AUTO_5437 ?AUTO_5438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5453 - OBJ
      ?AUTO_5454 - LOCATION
    )
    :vars
    (
      ?AUTO_5455 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5455 ?AUTO_5454 ) ( IN-TRUCK ?AUTO_5453 ?AUTO_5455 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5453 ?AUTO_5455 ?AUTO_5454 )
      ( DELIVER-PKG-VERIFY ?AUTO_5453 ?AUTO_5454 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5460 - OBJ
      ?AUTO_5461 - LOCATION
    )
    :vars
    (
      ?AUTO_5462 - TRUCK
      ?AUTO_5463 - LOCATION
      ?AUTO_5464 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5460 ?AUTO_5462 ) ( TRUCK-AT ?AUTO_5462 ?AUTO_5463 ) ( IN-CITY ?AUTO_5463 ?AUTO_5464 ) ( IN-CITY ?AUTO_5461 ?AUTO_5464 ) ( not ( = ?AUTO_5461 ?AUTO_5463 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5462 ?AUTO_5463 ?AUTO_5461 ?AUTO_5464 )
      ( DELIVER-PKG ?AUTO_5460 ?AUTO_5461 )
      ( DELIVER-PKG-VERIFY ?AUTO_5460 ?AUTO_5461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5465 - OBJ
      ?AUTO_5466 - LOCATION
    )
    :vars
    (
      ?AUTO_5467 - TRUCK
      ?AUTO_5468 - LOCATION
      ?AUTO_5469 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5467 ?AUTO_5468 ) ( IN-CITY ?AUTO_5468 ?AUTO_5469 ) ( IN-CITY ?AUTO_5466 ?AUTO_5469 ) ( not ( = ?AUTO_5466 ?AUTO_5468 ) ) ( OBJ-AT ?AUTO_5465 ?AUTO_5468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5465 ?AUTO_5467 ?AUTO_5468 )
      ( DELIVER-PKG ?AUTO_5465 ?AUTO_5466 )
      ( DELIVER-PKG-VERIFY ?AUTO_5465 ?AUTO_5466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5470 - OBJ
      ?AUTO_5471 - LOCATION
    )
    :vars
    (
      ?AUTO_5472 - TRUCK
      ?AUTO_5473 - LOCATION
      ?AUTO_5474 - CITY
      ?AUTO_5475 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5472 ?AUTO_5473 ) ( IN-CITY ?AUTO_5473 ?AUTO_5474 ) ( IN-CITY ?AUTO_5471 ?AUTO_5474 ) ( not ( = ?AUTO_5471 ?AUTO_5473 ) ) ( IN-AIRPLANE ?AUTO_5470 ?AUTO_5475 ) ( AIRPLANE-AT ?AUTO_5475 ?AUTO_5473 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5470 ?AUTO_5475 ?AUTO_5473 )
      ( DELIVER-PKG ?AUTO_5470 ?AUTO_5471 )
      ( DELIVER-PKG-VERIFY ?AUTO_5470 ?AUTO_5471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5476 - OBJ
      ?AUTO_5477 - LOCATION
    )
    :vars
    (
      ?AUTO_5479 - TRUCK
      ?AUTO_5480 - LOCATION
      ?AUTO_5478 - CITY
      ?AUTO_5481 - AIRPLANE
      ?AUTO_5482 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5479 ?AUTO_5480 ) ( IN-CITY ?AUTO_5480 ?AUTO_5478 ) ( IN-CITY ?AUTO_5477 ?AUTO_5478 ) ( not ( = ?AUTO_5477 ?AUTO_5480 ) ) ( IN-AIRPLANE ?AUTO_5476 ?AUTO_5481 ) ( AIRPORT ?AUTO_5482 ) ( AIRPORT ?AUTO_5480 ) ( AIRPLANE-AT ?AUTO_5481 ?AUTO_5482 ) ( not ( = ?AUTO_5482 ?AUTO_5480 ) ) ( not ( = ?AUTO_5477 ?AUTO_5482 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5481 ?AUTO_5482 ?AUTO_5480 )
      ( DELIVER-PKG ?AUTO_5476 ?AUTO_5477 )
      ( DELIVER-PKG-VERIFY ?AUTO_5476 ?AUTO_5477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5493 - OBJ
      ?AUTO_5494 - LOCATION
    )
    :vars
    (
      ?AUTO_5496 - TRUCK
      ?AUTO_5497 - LOCATION
      ?AUTO_5499 - CITY
      ?AUTO_5498 - LOCATION
      ?AUTO_5495 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5496 ?AUTO_5497 ) ( IN-CITY ?AUTO_5497 ?AUTO_5499 ) ( IN-CITY ?AUTO_5494 ?AUTO_5499 ) ( not ( = ?AUTO_5494 ?AUTO_5497 ) ) ( AIRPORT ?AUTO_5498 ) ( AIRPORT ?AUTO_5497 ) ( AIRPLANE-AT ?AUTO_5495 ?AUTO_5498 ) ( not ( = ?AUTO_5498 ?AUTO_5497 ) ) ( not ( = ?AUTO_5494 ?AUTO_5498 ) ) ( OBJ-AT ?AUTO_5493 ?AUTO_5498 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5493 ?AUTO_5495 ?AUTO_5498 )
      ( DELIVER-PKG ?AUTO_5493 ?AUTO_5494 )
      ( DELIVER-PKG-VERIFY ?AUTO_5493 ?AUTO_5494 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5500 - OBJ
      ?AUTO_5501 - LOCATION
    )
    :vars
    (
      ?AUTO_5502 - TRUCK
      ?AUTO_5505 - LOCATION
      ?AUTO_5504 - CITY
      ?AUTO_5506 - LOCATION
      ?AUTO_5507 - LOCATION
      ?AUTO_5503 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5502 ?AUTO_5505 ) ( IN-CITY ?AUTO_5505 ?AUTO_5504 ) ( IN-CITY ?AUTO_5501 ?AUTO_5504 ) ( not ( = ?AUTO_5501 ?AUTO_5505 ) ) ( AIRPORT ?AUTO_5506 ) ( AIRPORT ?AUTO_5505 ) ( not ( = ?AUTO_5506 ?AUTO_5505 ) ) ( not ( = ?AUTO_5501 ?AUTO_5506 ) ) ( OBJ-AT ?AUTO_5500 ?AUTO_5506 ) ( AIRPORT ?AUTO_5507 ) ( AIRPLANE-AT ?AUTO_5503 ?AUTO_5507 ) ( not ( = ?AUTO_5507 ?AUTO_5506 ) ) ( not ( = ?AUTO_5501 ?AUTO_5507 ) ) ( not ( = ?AUTO_5505 ?AUTO_5507 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5503 ?AUTO_5507 ?AUTO_5506 )
      ( DELIVER-PKG ?AUTO_5500 ?AUTO_5501 )
      ( DELIVER-PKG-VERIFY ?AUTO_5500 ?AUTO_5501 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5532 - OBJ
      ?AUTO_5533 - LOCATION
    )
    :vars
    (
      ?AUTO_5539 - TRUCK
      ?AUTO_5534 - LOCATION
      ?AUTO_5536 - CITY
      ?AUTO_5538 - LOCATION
      ?AUTO_5537 - LOCATION
      ?AUTO_5535 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5539 ?AUTO_5534 ) ( IN-CITY ?AUTO_5534 ?AUTO_5536 ) ( IN-CITY ?AUTO_5533 ?AUTO_5536 ) ( not ( = ?AUTO_5533 ?AUTO_5534 ) ) ( AIRPORT ?AUTO_5538 ) ( AIRPORT ?AUTO_5534 ) ( not ( = ?AUTO_5538 ?AUTO_5534 ) ) ( not ( = ?AUTO_5533 ?AUTO_5538 ) ) ( OBJ-AT ?AUTO_5532 ?AUTO_5538 ) ( AIRPORT ?AUTO_5537 ) ( not ( = ?AUTO_5537 ?AUTO_5538 ) ) ( not ( = ?AUTO_5533 ?AUTO_5537 ) ) ( not ( = ?AUTO_5534 ?AUTO_5537 ) ) ( AIRPLANE-AT ?AUTO_5535 ?AUTO_5534 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5535 ?AUTO_5534 ?AUTO_5537 )
      ( DELIVER-PKG ?AUTO_5532 ?AUTO_5533 )
      ( DELIVER-PKG-VERIFY ?AUTO_5532 ?AUTO_5533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5572 - OBJ
      ?AUTO_5573 - LOCATION
    )
    :vars
    (
      ?AUTO_5574 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5572 ?AUTO_5574 ) ( AIRPLANE-AT ?AUTO_5574 ?AUTO_5573 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5572 ?AUTO_5574 ?AUTO_5573 )
      ( DELIVER-PKG-VERIFY ?AUTO_5572 ?AUTO_5573 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5579 - OBJ
      ?AUTO_5580 - LOCATION
    )
    :vars
    (
      ?AUTO_5581 - AIRPLANE
      ?AUTO_5582 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5579 ?AUTO_5581 ) ( AIRPORT ?AUTO_5582 ) ( AIRPORT ?AUTO_5580 ) ( AIRPLANE-AT ?AUTO_5581 ?AUTO_5582 ) ( not ( = ?AUTO_5582 ?AUTO_5580 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5581 ?AUTO_5582 ?AUTO_5580 )
      ( DELIVER-PKG ?AUTO_5579 ?AUTO_5580 )
      ( DELIVER-PKG-VERIFY ?AUTO_5579 ?AUTO_5580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5631 - OBJ
      ?AUTO_5632 - LOCATION
    )
    :vars
    (
      ?AUTO_5638 - TRUCK
      ?AUTO_5635 - LOCATION
      ?AUTO_5634 - CITY
      ?AUTO_5637 - LOCATION
      ?AUTO_5633 - LOCATION
      ?AUTO_5636 - AIRPLANE
      ?AUTO_5639 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5638 ?AUTO_5635 ) ( IN-CITY ?AUTO_5635 ?AUTO_5634 ) ( IN-CITY ?AUTO_5632 ?AUTO_5634 ) ( not ( = ?AUTO_5632 ?AUTO_5635 ) ) ( AIRPORT ?AUTO_5637 ) ( AIRPORT ?AUTO_5635 ) ( not ( = ?AUTO_5637 ?AUTO_5635 ) ) ( not ( = ?AUTO_5632 ?AUTO_5637 ) ) ( AIRPORT ?AUTO_5633 ) ( not ( = ?AUTO_5633 ?AUTO_5637 ) ) ( not ( = ?AUTO_5632 ?AUTO_5633 ) ) ( not ( = ?AUTO_5635 ?AUTO_5633 ) ) ( AIRPLANE-AT ?AUTO_5636 ?AUTO_5635 ) ( TRUCK-AT ?AUTO_5639 ?AUTO_5637 ) ( IN-TRUCK ?AUTO_5631 ?AUTO_5639 ) ( not ( = ?AUTO_5638 ?AUTO_5639 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5631 ?AUTO_5639 ?AUTO_5637 )
      ( DELIVER-PKG ?AUTO_5631 ?AUTO_5632 )
      ( DELIVER-PKG-VERIFY ?AUTO_5631 ?AUTO_5632 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5640 - OBJ
      ?AUTO_5641 - LOCATION
    )
    :vars
    (
      ?AUTO_5642 - TRUCK
      ?AUTO_5644 - LOCATION
      ?AUTO_5646 - CITY
      ?AUTO_5647 - LOCATION
      ?AUTO_5648 - LOCATION
      ?AUTO_5645 - AIRPLANE
      ?AUTO_5643 - TRUCK
      ?AUTO_5649 - LOCATION
      ?AUTO_5650 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5642 ?AUTO_5644 ) ( IN-CITY ?AUTO_5644 ?AUTO_5646 ) ( IN-CITY ?AUTO_5641 ?AUTO_5646 ) ( not ( = ?AUTO_5641 ?AUTO_5644 ) ) ( AIRPORT ?AUTO_5647 ) ( AIRPORT ?AUTO_5644 ) ( not ( = ?AUTO_5647 ?AUTO_5644 ) ) ( not ( = ?AUTO_5641 ?AUTO_5647 ) ) ( AIRPORT ?AUTO_5648 ) ( not ( = ?AUTO_5648 ?AUTO_5647 ) ) ( not ( = ?AUTO_5641 ?AUTO_5648 ) ) ( not ( = ?AUTO_5644 ?AUTO_5648 ) ) ( AIRPLANE-AT ?AUTO_5645 ?AUTO_5644 ) ( IN-TRUCK ?AUTO_5640 ?AUTO_5643 ) ( not ( = ?AUTO_5642 ?AUTO_5643 ) ) ( TRUCK-AT ?AUTO_5643 ?AUTO_5649 ) ( IN-CITY ?AUTO_5649 ?AUTO_5650 ) ( IN-CITY ?AUTO_5647 ?AUTO_5650 ) ( not ( = ?AUTO_5647 ?AUTO_5649 ) ) ( not ( = ?AUTO_5641 ?AUTO_5649 ) ) ( not ( = ?AUTO_5644 ?AUTO_5649 ) ) ( not ( = ?AUTO_5646 ?AUTO_5650 ) ) ( not ( = ?AUTO_5648 ?AUTO_5649 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5643 ?AUTO_5649 ?AUTO_5647 ?AUTO_5650 )
      ( DELIVER-PKG ?AUTO_5640 ?AUTO_5641 )
      ( DELIVER-PKG-VERIFY ?AUTO_5640 ?AUTO_5641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5655 - OBJ
      ?AUTO_5656 - LOCATION
    )
    :vars
    (
      ?AUTO_5662 - TRUCK
      ?AUTO_5657 - LOCATION
      ?AUTO_5661 - CITY
      ?AUTO_5659 - LOCATION
      ?AUTO_5660 - LOCATION
      ?AUTO_5658 - AIRPLANE
      ?AUTO_5665 - TRUCK
      ?AUTO_5663 - LOCATION
      ?AUTO_5664 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5662 ?AUTO_5657 ) ( IN-CITY ?AUTO_5657 ?AUTO_5661 ) ( IN-CITY ?AUTO_5656 ?AUTO_5661 ) ( not ( = ?AUTO_5656 ?AUTO_5657 ) ) ( AIRPORT ?AUTO_5659 ) ( AIRPORT ?AUTO_5657 ) ( not ( = ?AUTO_5659 ?AUTO_5657 ) ) ( not ( = ?AUTO_5656 ?AUTO_5659 ) ) ( AIRPORT ?AUTO_5660 ) ( not ( = ?AUTO_5660 ?AUTO_5659 ) ) ( not ( = ?AUTO_5656 ?AUTO_5660 ) ) ( not ( = ?AUTO_5657 ?AUTO_5660 ) ) ( AIRPLANE-AT ?AUTO_5658 ?AUTO_5657 ) ( not ( = ?AUTO_5662 ?AUTO_5665 ) ) ( TRUCK-AT ?AUTO_5665 ?AUTO_5663 ) ( IN-CITY ?AUTO_5663 ?AUTO_5664 ) ( IN-CITY ?AUTO_5659 ?AUTO_5664 ) ( not ( = ?AUTO_5659 ?AUTO_5663 ) ) ( not ( = ?AUTO_5656 ?AUTO_5663 ) ) ( not ( = ?AUTO_5657 ?AUTO_5663 ) ) ( not ( = ?AUTO_5661 ?AUTO_5664 ) ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( OBJ-AT ?AUTO_5655 ?AUTO_5663 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5655 ?AUTO_5665 ?AUTO_5663 )
      ( DELIVER-PKG ?AUTO_5655 ?AUTO_5656 )
      ( DELIVER-PKG-VERIFY ?AUTO_5655 ?AUTO_5656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5688 - OBJ
      ?AUTO_5689 - LOCATION
    )
    :vars
    (
      ?AUTO_5690 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5690 ?AUTO_5689 ) ( IN-TRUCK ?AUTO_5688 ?AUTO_5690 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5688 ?AUTO_5690 ?AUTO_5689 )
      ( DELIVER-PKG-VERIFY ?AUTO_5688 ?AUTO_5689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5751 - OBJ
      ?AUTO_5752 - LOCATION
    )
    :vars
    (
      ?AUTO_5754 - LOCATION
      ?AUTO_5753 - CITY
      ?AUTO_5757 - AIRPLANE
      ?AUTO_5755 - LOCATION
      ?AUTO_5756 - TRUCK
      ?AUTO_5758 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5754 ?AUTO_5753 ) ( IN-CITY ?AUTO_5752 ?AUTO_5753 ) ( not ( = ?AUTO_5752 ?AUTO_5754 ) ) ( IN-AIRPLANE ?AUTO_5751 ?AUTO_5757 ) ( AIRPORT ?AUTO_5755 ) ( AIRPORT ?AUTO_5754 ) ( AIRPLANE-AT ?AUTO_5757 ?AUTO_5755 ) ( not ( = ?AUTO_5755 ?AUTO_5754 ) ) ( not ( = ?AUTO_5752 ?AUTO_5755 ) ) ( TRUCK-AT ?AUTO_5756 ?AUTO_5758 ) ( IN-CITY ?AUTO_5758 ?AUTO_5753 ) ( not ( = ?AUTO_5754 ?AUTO_5758 ) ) ( not ( = ?AUTO_5752 ?AUTO_5758 ) ) ( not ( = ?AUTO_5755 ?AUTO_5758 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5756 ?AUTO_5758 ?AUTO_5754 ?AUTO_5753 )
      ( DELIVER-PKG ?AUTO_5751 ?AUTO_5752 )
      ( DELIVER-PKG-VERIFY ?AUTO_5751 ?AUTO_5752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5759 - OBJ
      ?AUTO_5760 - LOCATION
    )
    :vars
    (
      ?AUTO_5763 - LOCATION
      ?AUTO_5761 - CITY
      ?AUTO_5764 - LOCATION
      ?AUTO_5765 - AIRPLANE
      ?AUTO_5766 - TRUCK
      ?AUTO_5762 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5763 ?AUTO_5761 ) ( IN-CITY ?AUTO_5760 ?AUTO_5761 ) ( not ( = ?AUTO_5760 ?AUTO_5763 ) ) ( AIRPORT ?AUTO_5764 ) ( AIRPORT ?AUTO_5763 ) ( AIRPLANE-AT ?AUTO_5765 ?AUTO_5764 ) ( not ( = ?AUTO_5764 ?AUTO_5763 ) ) ( not ( = ?AUTO_5760 ?AUTO_5764 ) ) ( TRUCK-AT ?AUTO_5766 ?AUTO_5762 ) ( IN-CITY ?AUTO_5762 ?AUTO_5761 ) ( not ( = ?AUTO_5763 ?AUTO_5762 ) ) ( not ( = ?AUTO_5760 ?AUTO_5762 ) ) ( not ( = ?AUTO_5764 ?AUTO_5762 ) ) ( OBJ-AT ?AUTO_5759 ?AUTO_5764 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5759 ?AUTO_5765 ?AUTO_5764 )
      ( DELIVER-PKG ?AUTO_5759 ?AUTO_5760 )
      ( DELIVER-PKG-VERIFY ?AUTO_5759 ?AUTO_5760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5771 - OBJ
      ?AUTO_5772 - LOCATION
    )
    :vars
    (
      ?AUTO_5775 - LOCATION
      ?AUTO_5773 - CITY
      ?AUTO_5778 - LOCATION
      ?AUTO_5774 - AIRPLANE
      ?AUTO_5776 - TRUCK
      ?AUTO_5777 - LOCATION
      ?AUTO_5779 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5775 ?AUTO_5773 ) ( IN-CITY ?AUTO_5772 ?AUTO_5773 ) ( not ( = ?AUTO_5772 ?AUTO_5775 ) ) ( AIRPORT ?AUTO_5778 ) ( AIRPORT ?AUTO_5775 ) ( AIRPLANE-AT ?AUTO_5774 ?AUTO_5778 ) ( not ( = ?AUTO_5778 ?AUTO_5775 ) ) ( not ( = ?AUTO_5772 ?AUTO_5778 ) ) ( TRUCK-AT ?AUTO_5776 ?AUTO_5777 ) ( IN-CITY ?AUTO_5777 ?AUTO_5773 ) ( not ( = ?AUTO_5775 ?AUTO_5777 ) ) ( not ( = ?AUTO_5772 ?AUTO_5777 ) ) ( not ( = ?AUTO_5778 ?AUTO_5777 ) ) ( TRUCK-AT ?AUTO_5779 ?AUTO_5778 ) ( IN-TRUCK ?AUTO_5771 ?AUTO_5779 ) ( not ( = ?AUTO_5776 ?AUTO_5779 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5771 ?AUTO_5779 ?AUTO_5778 )
      ( DELIVER-PKG ?AUTO_5771 ?AUTO_5772 )
      ( DELIVER-PKG-VERIFY ?AUTO_5771 ?AUTO_5772 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5786 - OBJ
      ?AUTO_5787 - LOCATION
    )
    :vars
    (
      ?AUTO_5792 - LOCATION
      ?AUTO_5793 - CITY
      ?AUTO_5794 - LOCATION
      ?AUTO_5789 - AIRPLANE
      ?AUTO_5790 - TRUCK
      ?AUTO_5791 - LOCATION
      ?AUTO_5788 - TRUCK
      ?AUTO_5795 - LOCATION
      ?AUTO_5796 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5792 ?AUTO_5793 ) ( IN-CITY ?AUTO_5787 ?AUTO_5793 ) ( not ( = ?AUTO_5787 ?AUTO_5792 ) ) ( AIRPORT ?AUTO_5794 ) ( AIRPORT ?AUTO_5792 ) ( AIRPLANE-AT ?AUTO_5789 ?AUTO_5794 ) ( not ( = ?AUTO_5794 ?AUTO_5792 ) ) ( not ( = ?AUTO_5787 ?AUTO_5794 ) ) ( TRUCK-AT ?AUTO_5790 ?AUTO_5791 ) ( IN-CITY ?AUTO_5791 ?AUTO_5793 ) ( not ( = ?AUTO_5792 ?AUTO_5791 ) ) ( not ( = ?AUTO_5787 ?AUTO_5791 ) ) ( not ( = ?AUTO_5794 ?AUTO_5791 ) ) ( IN-TRUCK ?AUTO_5786 ?AUTO_5788 ) ( not ( = ?AUTO_5790 ?AUTO_5788 ) ) ( TRUCK-AT ?AUTO_5788 ?AUTO_5795 ) ( IN-CITY ?AUTO_5795 ?AUTO_5796 ) ( IN-CITY ?AUTO_5794 ?AUTO_5796 ) ( not ( = ?AUTO_5794 ?AUTO_5795 ) ) ( not ( = ?AUTO_5787 ?AUTO_5795 ) ) ( not ( = ?AUTO_5792 ?AUTO_5795 ) ) ( not ( = ?AUTO_5793 ?AUTO_5796 ) ) ( not ( = ?AUTO_5791 ?AUTO_5795 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5788 ?AUTO_5795 ?AUTO_5794 ?AUTO_5796 )
      ( DELIVER-PKG ?AUTO_5786 ?AUTO_5787 )
      ( DELIVER-PKG-VERIFY ?AUTO_5786 ?AUTO_5787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5797 - OBJ
      ?AUTO_5798 - LOCATION
    )
    :vars
    (
      ?AUTO_5801 - LOCATION
      ?AUTO_5799 - CITY
      ?AUTO_5800 - LOCATION
      ?AUTO_5806 - AIRPLANE
      ?AUTO_5802 - TRUCK
      ?AUTO_5807 - LOCATION
      ?AUTO_5804 - TRUCK
      ?AUTO_5805 - LOCATION
      ?AUTO_5803 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5801 ?AUTO_5799 ) ( IN-CITY ?AUTO_5798 ?AUTO_5799 ) ( not ( = ?AUTO_5798 ?AUTO_5801 ) ) ( AIRPORT ?AUTO_5800 ) ( AIRPORT ?AUTO_5801 ) ( AIRPLANE-AT ?AUTO_5806 ?AUTO_5800 ) ( not ( = ?AUTO_5800 ?AUTO_5801 ) ) ( not ( = ?AUTO_5798 ?AUTO_5800 ) ) ( TRUCK-AT ?AUTO_5802 ?AUTO_5807 ) ( IN-CITY ?AUTO_5807 ?AUTO_5799 ) ( not ( = ?AUTO_5801 ?AUTO_5807 ) ) ( not ( = ?AUTO_5798 ?AUTO_5807 ) ) ( not ( = ?AUTO_5800 ?AUTO_5807 ) ) ( not ( = ?AUTO_5802 ?AUTO_5804 ) ) ( TRUCK-AT ?AUTO_5804 ?AUTO_5805 ) ( IN-CITY ?AUTO_5805 ?AUTO_5803 ) ( IN-CITY ?AUTO_5800 ?AUTO_5803 ) ( not ( = ?AUTO_5800 ?AUTO_5805 ) ) ( not ( = ?AUTO_5798 ?AUTO_5805 ) ) ( not ( = ?AUTO_5801 ?AUTO_5805 ) ) ( not ( = ?AUTO_5799 ?AUTO_5803 ) ) ( not ( = ?AUTO_5807 ?AUTO_5805 ) ) ( OBJ-AT ?AUTO_5797 ?AUTO_5805 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5797 ?AUTO_5804 ?AUTO_5805 )
      ( DELIVER-PKG ?AUTO_5797 ?AUTO_5798 )
      ( DELIVER-PKG-VERIFY ?AUTO_5797 ?AUTO_5798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5816 - OBJ
      ?AUTO_5817 - LOCATION
    )
    :vars
    (
      ?AUTO_5818 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5818 ?AUTO_5817 ) ( IN-TRUCK ?AUTO_5816 ?AUTO_5818 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5816 ?AUTO_5818 ?AUTO_5817 )
      ( DELIVER-PKG-VERIFY ?AUTO_5816 ?AUTO_5817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5879 - OBJ
      ?AUTO_5880 - LOCATION
    )
    :vars
    (
      ?AUTO_5885 - LOCATION
      ?AUTO_5881 - CITY
      ?AUTO_5883 - LOCATION
      ?AUTO_5886 - LOCATION
      ?AUTO_5884 - AIRPLANE
      ?AUTO_5882 - TRUCK
      ?AUTO_5887 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5885 ?AUTO_5881 ) ( IN-CITY ?AUTO_5880 ?AUTO_5881 ) ( not ( = ?AUTO_5880 ?AUTO_5885 ) ) ( AIRPORT ?AUTO_5883 ) ( AIRPORT ?AUTO_5885 ) ( not ( = ?AUTO_5883 ?AUTO_5885 ) ) ( not ( = ?AUTO_5880 ?AUTO_5883 ) ) ( OBJ-AT ?AUTO_5879 ?AUTO_5883 ) ( AIRPORT ?AUTO_5886 ) ( AIRPLANE-AT ?AUTO_5884 ?AUTO_5886 ) ( not ( = ?AUTO_5886 ?AUTO_5883 ) ) ( not ( = ?AUTO_5880 ?AUTO_5886 ) ) ( not ( = ?AUTO_5885 ?AUTO_5886 ) ) ( TRUCK-AT ?AUTO_5882 ?AUTO_5887 ) ( IN-CITY ?AUTO_5887 ?AUTO_5881 ) ( not ( = ?AUTO_5885 ?AUTO_5887 ) ) ( not ( = ?AUTO_5880 ?AUTO_5887 ) ) ( not ( = ?AUTO_5883 ?AUTO_5887 ) ) ( not ( = ?AUTO_5886 ?AUTO_5887 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5882 ?AUTO_5887 ?AUTO_5885 ?AUTO_5881 )
      ( DELIVER-PKG ?AUTO_5879 ?AUTO_5880 )
      ( DELIVER-PKG-VERIFY ?AUTO_5879 ?AUTO_5880 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5894 - OBJ
      ?AUTO_5895 - LOCATION
    )
    :vars
    (
      ?AUTO_5901 - LOCATION
      ?AUTO_5900 - CITY
      ?AUTO_5902 - LOCATION
      ?AUTO_5898 - LOCATION
      ?AUTO_5899 - AIRPLANE
      ?AUTO_5896 - TRUCK
      ?AUTO_5897 - LOCATION
      ?AUTO_5903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5901 ?AUTO_5900 ) ( IN-CITY ?AUTO_5895 ?AUTO_5900 ) ( not ( = ?AUTO_5895 ?AUTO_5901 ) ) ( AIRPORT ?AUTO_5902 ) ( AIRPORT ?AUTO_5901 ) ( not ( = ?AUTO_5902 ?AUTO_5901 ) ) ( not ( = ?AUTO_5895 ?AUTO_5902 ) ) ( AIRPORT ?AUTO_5898 ) ( AIRPLANE-AT ?AUTO_5899 ?AUTO_5898 ) ( not ( = ?AUTO_5898 ?AUTO_5902 ) ) ( not ( = ?AUTO_5895 ?AUTO_5898 ) ) ( not ( = ?AUTO_5901 ?AUTO_5898 ) ) ( TRUCK-AT ?AUTO_5896 ?AUTO_5897 ) ( IN-CITY ?AUTO_5897 ?AUTO_5900 ) ( not ( = ?AUTO_5901 ?AUTO_5897 ) ) ( not ( = ?AUTO_5895 ?AUTO_5897 ) ) ( not ( = ?AUTO_5902 ?AUTO_5897 ) ) ( not ( = ?AUTO_5898 ?AUTO_5897 ) ) ( TRUCK-AT ?AUTO_5903 ?AUTO_5902 ) ( IN-TRUCK ?AUTO_5894 ?AUTO_5903 ) ( not ( = ?AUTO_5896 ?AUTO_5903 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5894 ?AUTO_5903 ?AUTO_5902 )
      ( DELIVER-PKG ?AUTO_5894 ?AUTO_5895 )
      ( DELIVER-PKG-VERIFY ?AUTO_5894 ?AUTO_5895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5908 - OBJ
      ?AUTO_5909 - LOCATION
    )
    :vars
    (
      ?AUTO_5912 - LOCATION
      ?AUTO_5910 - CITY
      ?AUTO_5915 - LOCATION
      ?AUTO_5917 - LOCATION
      ?AUTO_5916 - AIRPLANE
      ?AUTO_5914 - TRUCK
      ?AUTO_5911 - LOCATION
      ?AUTO_5913 - TRUCK
      ?AUTO_5918 - LOCATION
      ?AUTO_5919 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5912 ?AUTO_5910 ) ( IN-CITY ?AUTO_5909 ?AUTO_5910 ) ( not ( = ?AUTO_5909 ?AUTO_5912 ) ) ( AIRPORT ?AUTO_5915 ) ( AIRPORT ?AUTO_5912 ) ( not ( = ?AUTO_5915 ?AUTO_5912 ) ) ( not ( = ?AUTO_5909 ?AUTO_5915 ) ) ( AIRPORT ?AUTO_5917 ) ( AIRPLANE-AT ?AUTO_5916 ?AUTO_5917 ) ( not ( = ?AUTO_5917 ?AUTO_5915 ) ) ( not ( = ?AUTO_5909 ?AUTO_5917 ) ) ( not ( = ?AUTO_5912 ?AUTO_5917 ) ) ( TRUCK-AT ?AUTO_5914 ?AUTO_5911 ) ( IN-CITY ?AUTO_5911 ?AUTO_5910 ) ( not ( = ?AUTO_5912 ?AUTO_5911 ) ) ( not ( = ?AUTO_5909 ?AUTO_5911 ) ) ( not ( = ?AUTO_5915 ?AUTO_5911 ) ) ( not ( = ?AUTO_5917 ?AUTO_5911 ) ) ( IN-TRUCK ?AUTO_5908 ?AUTO_5913 ) ( not ( = ?AUTO_5914 ?AUTO_5913 ) ) ( TRUCK-AT ?AUTO_5913 ?AUTO_5918 ) ( IN-CITY ?AUTO_5918 ?AUTO_5919 ) ( IN-CITY ?AUTO_5915 ?AUTO_5919 ) ( not ( = ?AUTO_5915 ?AUTO_5918 ) ) ( not ( = ?AUTO_5909 ?AUTO_5918 ) ) ( not ( = ?AUTO_5912 ?AUTO_5918 ) ) ( not ( = ?AUTO_5910 ?AUTO_5919 ) ) ( not ( = ?AUTO_5917 ?AUTO_5918 ) ) ( not ( = ?AUTO_5911 ?AUTO_5918 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5913 ?AUTO_5918 ?AUTO_5915 ?AUTO_5919 )
      ( DELIVER-PKG ?AUTO_5908 ?AUTO_5909 )
      ( DELIVER-PKG-VERIFY ?AUTO_5908 ?AUTO_5909 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5920 - OBJ
      ?AUTO_5921 - LOCATION
    )
    :vars
    (
      ?AUTO_5930 - LOCATION
      ?AUTO_5926 - CITY
      ?AUTO_5928 - LOCATION
      ?AUTO_5922 - LOCATION
      ?AUTO_5923 - AIRPLANE
      ?AUTO_5924 - TRUCK
      ?AUTO_5927 - LOCATION
      ?AUTO_5929 - TRUCK
      ?AUTO_5925 - LOCATION
      ?AUTO_5931 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5930 ?AUTO_5926 ) ( IN-CITY ?AUTO_5921 ?AUTO_5926 ) ( not ( = ?AUTO_5921 ?AUTO_5930 ) ) ( AIRPORT ?AUTO_5928 ) ( AIRPORT ?AUTO_5930 ) ( not ( = ?AUTO_5928 ?AUTO_5930 ) ) ( not ( = ?AUTO_5921 ?AUTO_5928 ) ) ( AIRPORT ?AUTO_5922 ) ( AIRPLANE-AT ?AUTO_5923 ?AUTO_5922 ) ( not ( = ?AUTO_5922 ?AUTO_5928 ) ) ( not ( = ?AUTO_5921 ?AUTO_5922 ) ) ( not ( = ?AUTO_5930 ?AUTO_5922 ) ) ( TRUCK-AT ?AUTO_5924 ?AUTO_5927 ) ( IN-CITY ?AUTO_5927 ?AUTO_5926 ) ( not ( = ?AUTO_5930 ?AUTO_5927 ) ) ( not ( = ?AUTO_5921 ?AUTO_5927 ) ) ( not ( = ?AUTO_5928 ?AUTO_5927 ) ) ( not ( = ?AUTO_5922 ?AUTO_5927 ) ) ( not ( = ?AUTO_5924 ?AUTO_5929 ) ) ( TRUCK-AT ?AUTO_5929 ?AUTO_5925 ) ( IN-CITY ?AUTO_5925 ?AUTO_5931 ) ( IN-CITY ?AUTO_5928 ?AUTO_5931 ) ( not ( = ?AUTO_5928 ?AUTO_5925 ) ) ( not ( = ?AUTO_5921 ?AUTO_5925 ) ) ( not ( = ?AUTO_5930 ?AUTO_5925 ) ) ( not ( = ?AUTO_5926 ?AUTO_5931 ) ) ( not ( = ?AUTO_5922 ?AUTO_5925 ) ) ( not ( = ?AUTO_5927 ?AUTO_5925 ) ) ( OBJ-AT ?AUTO_5920 ?AUTO_5925 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5920 ?AUTO_5929 ?AUTO_5925 )
      ( DELIVER-PKG ?AUTO_5920 ?AUTO_5921 )
      ( DELIVER-PKG-VERIFY ?AUTO_5920 ?AUTO_5921 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5940 - OBJ
      ?AUTO_5941 - LOCATION
    )
    :vars
    (
      ?AUTO_5948 - LOCATION
      ?AUTO_5946 - CITY
      ?AUTO_5949 - LOCATION
      ?AUTO_5942 - LOCATION
      ?AUTO_5950 - AIRPLANE
      ?AUTO_5951 - TRUCK
      ?AUTO_5947 - LOCATION
      ?AUTO_5944 - TRUCK
      ?AUTO_5945 - LOCATION
      ?AUTO_5943 - CITY
      ?AUTO_5952 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5948 ?AUTO_5946 ) ( IN-CITY ?AUTO_5941 ?AUTO_5946 ) ( not ( = ?AUTO_5941 ?AUTO_5948 ) ) ( AIRPORT ?AUTO_5949 ) ( AIRPORT ?AUTO_5948 ) ( not ( = ?AUTO_5949 ?AUTO_5948 ) ) ( not ( = ?AUTO_5941 ?AUTO_5949 ) ) ( AIRPORT ?AUTO_5942 ) ( AIRPLANE-AT ?AUTO_5950 ?AUTO_5942 ) ( not ( = ?AUTO_5942 ?AUTO_5949 ) ) ( not ( = ?AUTO_5941 ?AUTO_5942 ) ) ( not ( = ?AUTO_5948 ?AUTO_5942 ) ) ( TRUCK-AT ?AUTO_5951 ?AUTO_5947 ) ( IN-CITY ?AUTO_5947 ?AUTO_5946 ) ( not ( = ?AUTO_5948 ?AUTO_5947 ) ) ( not ( = ?AUTO_5941 ?AUTO_5947 ) ) ( not ( = ?AUTO_5949 ?AUTO_5947 ) ) ( not ( = ?AUTO_5942 ?AUTO_5947 ) ) ( not ( = ?AUTO_5951 ?AUTO_5944 ) ) ( IN-CITY ?AUTO_5945 ?AUTO_5943 ) ( IN-CITY ?AUTO_5949 ?AUTO_5943 ) ( not ( = ?AUTO_5949 ?AUTO_5945 ) ) ( not ( = ?AUTO_5941 ?AUTO_5945 ) ) ( not ( = ?AUTO_5948 ?AUTO_5945 ) ) ( not ( = ?AUTO_5946 ?AUTO_5943 ) ) ( not ( = ?AUTO_5942 ?AUTO_5945 ) ) ( not ( = ?AUTO_5947 ?AUTO_5945 ) ) ( OBJ-AT ?AUTO_5940 ?AUTO_5945 ) ( TRUCK-AT ?AUTO_5944 ?AUTO_5952 ) ( IN-CITY ?AUTO_5952 ?AUTO_5943 ) ( not ( = ?AUTO_5945 ?AUTO_5952 ) ) ( not ( = ?AUTO_5941 ?AUTO_5952 ) ) ( not ( = ?AUTO_5948 ?AUTO_5952 ) ) ( not ( = ?AUTO_5949 ?AUTO_5952 ) ) ( not ( = ?AUTO_5942 ?AUTO_5952 ) ) ( not ( = ?AUTO_5947 ?AUTO_5952 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5944 ?AUTO_5952 ?AUTO_5945 ?AUTO_5943 )
      ( DELIVER-PKG ?AUTO_5940 ?AUTO_5941 )
      ( DELIVER-PKG-VERIFY ?AUTO_5940 ?AUTO_5941 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5955 - OBJ
      ?AUTO_5956 - LOCATION
    )
    :vars
    (
      ?AUTO_5957 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5957 ?AUTO_5956 ) ( IN-TRUCK ?AUTO_5955 ?AUTO_5957 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5955 ?AUTO_5957 ?AUTO_5956 )
      ( DELIVER-PKG-VERIFY ?AUTO_5955 ?AUTO_5956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5958 - OBJ
      ?AUTO_5959 - LOCATION
    )
    :vars
    (
      ?AUTO_5960 - TRUCK
      ?AUTO_5961 - LOCATION
      ?AUTO_5962 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5958 ?AUTO_5960 ) ( TRUCK-AT ?AUTO_5960 ?AUTO_5961 ) ( IN-CITY ?AUTO_5961 ?AUTO_5962 ) ( IN-CITY ?AUTO_5959 ?AUTO_5962 ) ( not ( = ?AUTO_5959 ?AUTO_5961 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5960 ?AUTO_5961 ?AUTO_5959 ?AUTO_5962 )
      ( DELIVER-PKG ?AUTO_5958 ?AUTO_5959 )
      ( DELIVER-PKG-VERIFY ?AUTO_5958 ?AUTO_5959 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5963 - OBJ
      ?AUTO_5964 - LOCATION
    )
    :vars
    (
      ?AUTO_5965 - TRUCK
      ?AUTO_5966 - LOCATION
      ?AUTO_5967 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5965 ?AUTO_5966 ) ( IN-CITY ?AUTO_5966 ?AUTO_5967 ) ( IN-CITY ?AUTO_5964 ?AUTO_5967 ) ( not ( = ?AUTO_5964 ?AUTO_5966 ) ) ( OBJ-AT ?AUTO_5963 ?AUTO_5966 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5963 ?AUTO_5965 ?AUTO_5966 )
      ( DELIVER-PKG ?AUTO_5963 ?AUTO_5964 )
      ( DELIVER-PKG-VERIFY ?AUTO_5963 ?AUTO_5964 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5970 - OBJ
      ?AUTO_5971 - LOCATION
    )
    :vars
    (
      ?AUTO_5974 - LOCATION
      ?AUTO_5973 - CITY
      ?AUTO_5972 - TRUCK
      ?AUTO_5975 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5974 ?AUTO_5973 ) ( IN-CITY ?AUTO_5971 ?AUTO_5973 ) ( not ( = ?AUTO_5971 ?AUTO_5974 ) ) ( OBJ-AT ?AUTO_5970 ?AUTO_5974 ) ( TRUCK-AT ?AUTO_5972 ?AUTO_5975 ) ( IN-CITY ?AUTO_5975 ?AUTO_5973 ) ( not ( = ?AUTO_5974 ?AUTO_5975 ) ) ( not ( = ?AUTO_5971 ?AUTO_5975 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5972 ?AUTO_5975 ?AUTO_5974 ?AUTO_5973 )
      ( DELIVER-PKG ?AUTO_5970 ?AUTO_5971 )
      ( DELIVER-PKG-VERIFY ?AUTO_5970 ?AUTO_5971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5978 - OBJ
      ?AUTO_5979 - LOCATION
    )
    :vars
    (
      ?AUTO_5980 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5978 ?AUTO_5980 ) ( AIRPLANE-AT ?AUTO_5980 ?AUTO_5979 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5978 ?AUTO_5980 ?AUTO_5979 )
      ( DELIVER-PKG-VERIFY ?AUTO_5978 ?AUTO_5979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5981 - OBJ
      ?AUTO_5982 - LOCATION
    )
    :vars
    (
      ?AUTO_5983 - AIRPLANE
      ?AUTO_5984 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5981 ?AUTO_5983 ) ( AIRPORT ?AUTO_5984 ) ( AIRPORT ?AUTO_5982 ) ( AIRPLANE-AT ?AUTO_5983 ?AUTO_5984 ) ( not ( = ?AUTO_5984 ?AUTO_5982 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5983 ?AUTO_5984 ?AUTO_5982 )
      ( DELIVER-PKG ?AUTO_5981 ?AUTO_5982 )
      ( DELIVER-PKG-VERIFY ?AUTO_5981 ?AUTO_5982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5985 - OBJ
      ?AUTO_5986 - LOCATION
    )
    :vars
    (
      ?AUTO_5988 - LOCATION
      ?AUTO_5987 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5988 ) ( AIRPORT ?AUTO_5986 ) ( AIRPLANE-AT ?AUTO_5987 ?AUTO_5988 ) ( not ( = ?AUTO_5988 ?AUTO_5986 ) ) ( OBJ-AT ?AUTO_5985 ?AUTO_5988 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5985 ?AUTO_5987 ?AUTO_5988 )
      ( DELIVER-PKG ?AUTO_5985 ?AUTO_5986 )
      ( DELIVER-PKG-VERIFY ?AUTO_5985 ?AUTO_5986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5989 - OBJ
      ?AUTO_5990 - LOCATION
    )
    :vars
    (
      ?AUTO_5992 - LOCATION
      ?AUTO_5991 - AIRPLANE
      ?AUTO_5993 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5992 ) ( AIRPORT ?AUTO_5990 ) ( AIRPLANE-AT ?AUTO_5991 ?AUTO_5992 ) ( not ( = ?AUTO_5992 ?AUTO_5990 ) ) ( TRUCK-AT ?AUTO_5993 ?AUTO_5992 ) ( IN-TRUCK ?AUTO_5989 ?AUTO_5993 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5989 ?AUTO_5993 ?AUTO_5992 )
      ( DELIVER-PKG ?AUTO_5989 ?AUTO_5990 )
      ( DELIVER-PKG-VERIFY ?AUTO_5989 ?AUTO_5990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5994 - OBJ
      ?AUTO_5995 - LOCATION
    )
    :vars
    (
      ?AUTO_5997 - LOCATION
      ?AUTO_5996 - AIRPLANE
      ?AUTO_5998 - TRUCK
      ?AUTO_5999 - LOCATION
      ?AUTO_6000 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5997 ) ( AIRPORT ?AUTO_5995 ) ( AIRPLANE-AT ?AUTO_5996 ?AUTO_5997 ) ( not ( = ?AUTO_5997 ?AUTO_5995 ) ) ( IN-TRUCK ?AUTO_5994 ?AUTO_5998 ) ( TRUCK-AT ?AUTO_5998 ?AUTO_5999 ) ( IN-CITY ?AUTO_5999 ?AUTO_6000 ) ( IN-CITY ?AUTO_5997 ?AUTO_6000 ) ( not ( = ?AUTO_5997 ?AUTO_5999 ) ) ( not ( = ?AUTO_5995 ?AUTO_5999 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5998 ?AUTO_5999 ?AUTO_5997 ?AUTO_6000 )
      ( DELIVER-PKG ?AUTO_5994 ?AUTO_5995 )
      ( DELIVER-PKG-VERIFY ?AUTO_5994 ?AUTO_5995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6001 - OBJ
      ?AUTO_6002 - LOCATION
    )
    :vars
    (
      ?AUTO_6005 - LOCATION
      ?AUTO_6004 - AIRPLANE
      ?AUTO_6006 - TRUCK
      ?AUTO_6003 - LOCATION
      ?AUTO_6007 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6005 ) ( AIRPORT ?AUTO_6002 ) ( AIRPLANE-AT ?AUTO_6004 ?AUTO_6005 ) ( not ( = ?AUTO_6005 ?AUTO_6002 ) ) ( TRUCK-AT ?AUTO_6006 ?AUTO_6003 ) ( IN-CITY ?AUTO_6003 ?AUTO_6007 ) ( IN-CITY ?AUTO_6005 ?AUTO_6007 ) ( not ( = ?AUTO_6005 ?AUTO_6003 ) ) ( not ( = ?AUTO_6002 ?AUTO_6003 ) ) ( OBJ-AT ?AUTO_6001 ?AUTO_6003 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6001 ?AUTO_6006 ?AUTO_6003 )
      ( DELIVER-PKG ?AUTO_6001 ?AUTO_6002 )
      ( DELIVER-PKG-VERIFY ?AUTO_6001 ?AUTO_6002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6010 - OBJ
      ?AUTO_6011 - LOCATION
    )
    :vars
    (
      ?AUTO_6014 - LOCATION
      ?AUTO_6015 - AIRPLANE
      ?AUTO_6013 - LOCATION
      ?AUTO_6016 - CITY
      ?AUTO_6012 - TRUCK
      ?AUTO_6017 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6014 ) ( AIRPORT ?AUTO_6011 ) ( AIRPLANE-AT ?AUTO_6015 ?AUTO_6014 ) ( not ( = ?AUTO_6014 ?AUTO_6011 ) ) ( IN-CITY ?AUTO_6013 ?AUTO_6016 ) ( IN-CITY ?AUTO_6014 ?AUTO_6016 ) ( not ( = ?AUTO_6014 ?AUTO_6013 ) ) ( not ( = ?AUTO_6011 ?AUTO_6013 ) ) ( OBJ-AT ?AUTO_6010 ?AUTO_6013 ) ( TRUCK-AT ?AUTO_6012 ?AUTO_6017 ) ( IN-CITY ?AUTO_6017 ?AUTO_6016 ) ( not ( = ?AUTO_6013 ?AUTO_6017 ) ) ( not ( = ?AUTO_6011 ?AUTO_6017 ) ) ( not ( = ?AUTO_6014 ?AUTO_6017 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6012 ?AUTO_6017 ?AUTO_6013 ?AUTO_6016 )
      ( DELIVER-PKG ?AUTO_6010 ?AUTO_6011 )
      ( DELIVER-PKG-VERIFY ?AUTO_6010 ?AUTO_6011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6020 - OBJ
      ?AUTO_6021 - LOCATION
    )
    :vars
    (
      ?AUTO_6022 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6022 ?AUTO_6021 ) ( IN-TRUCK ?AUTO_6020 ?AUTO_6022 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6020 ?AUTO_6022 ?AUTO_6021 )
      ( DELIVER-PKG-VERIFY ?AUTO_6020 ?AUTO_6021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6025 - OBJ
      ?AUTO_6026 - LOCATION
    )
    :vars
    (
      ?AUTO_6027 - TRUCK
      ?AUTO_6028 - LOCATION
      ?AUTO_6029 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6025 ?AUTO_6027 ) ( TRUCK-AT ?AUTO_6027 ?AUTO_6028 ) ( IN-CITY ?AUTO_6028 ?AUTO_6029 ) ( IN-CITY ?AUTO_6026 ?AUTO_6029 ) ( not ( = ?AUTO_6026 ?AUTO_6028 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6027 ?AUTO_6028 ?AUTO_6026 ?AUTO_6029 )
      ( DELIVER-PKG ?AUTO_6025 ?AUTO_6026 )
      ( DELIVER-PKG-VERIFY ?AUTO_6025 ?AUTO_6026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6030 - OBJ
      ?AUTO_6031 - LOCATION
    )
    :vars
    (
      ?AUTO_6032 - TRUCK
      ?AUTO_6033 - LOCATION
      ?AUTO_6034 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6032 ?AUTO_6033 ) ( IN-CITY ?AUTO_6033 ?AUTO_6034 ) ( IN-CITY ?AUTO_6031 ?AUTO_6034 ) ( not ( = ?AUTO_6031 ?AUTO_6033 ) ) ( OBJ-AT ?AUTO_6030 ?AUTO_6033 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6030 ?AUTO_6032 ?AUTO_6033 )
      ( DELIVER-PKG ?AUTO_6030 ?AUTO_6031 )
      ( DELIVER-PKG-VERIFY ?AUTO_6030 ?AUTO_6031 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6053 - OBJ
      ?AUTO_6054 - LOCATION
    )
    :vars
    (
      ?AUTO_6055 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6055 ?AUTO_6054 ) ( IN-TRUCK ?AUTO_6053 ?AUTO_6055 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6053 ?AUTO_6055 ?AUTO_6054 )
      ( DELIVER-PKG-VERIFY ?AUTO_6053 ?AUTO_6054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6056 - OBJ
      ?AUTO_6057 - LOCATION
    )
    :vars
    (
      ?AUTO_6058 - TRUCK
      ?AUTO_6059 - LOCATION
      ?AUTO_6060 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6056 ?AUTO_6058 ) ( TRUCK-AT ?AUTO_6058 ?AUTO_6059 ) ( IN-CITY ?AUTO_6059 ?AUTO_6060 ) ( IN-CITY ?AUTO_6057 ?AUTO_6060 ) ( not ( = ?AUTO_6057 ?AUTO_6059 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6058 ?AUTO_6059 ?AUTO_6057 ?AUTO_6060 )
      ( DELIVER-PKG ?AUTO_6056 ?AUTO_6057 )
      ( DELIVER-PKG-VERIFY ?AUTO_6056 ?AUTO_6057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6063 - OBJ
      ?AUTO_6064 - LOCATION
    )
    :vars
    (
      ?AUTO_6065 - TRUCK
      ?AUTO_6067 - LOCATION
      ?AUTO_6066 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6065 ?AUTO_6067 ) ( IN-CITY ?AUTO_6067 ?AUTO_6066 ) ( IN-CITY ?AUTO_6064 ?AUTO_6066 ) ( not ( = ?AUTO_6064 ?AUTO_6067 ) ) ( OBJ-AT ?AUTO_6063 ?AUTO_6067 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6063 ?AUTO_6065 ?AUTO_6067 )
      ( DELIVER-PKG ?AUTO_6063 ?AUTO_6064 )
      ( DELIVER-PKG-VERIFY ?AUTO_6063 ?AUTO_6064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6068 - OBJ
      ?AUTO_6069 - LOCATION
    )
    :vars
    (
      ?AUTO_6071 - LOCATION
      ?AUTO_6072 - CITY
      ?AUTO_6070 - TRUCK
      ?AUTO_6073 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6071 ?AUTO_6072 ) ( IN-CITY ?AUTO_6069 ?AUTO_6072 ) ( not ( = ?AUTO_6069 ?AUTO_6071 ) ) ( OBJ-AT ?AUTO_6068 ?AUTO_6071 ) ( TRUCK-AT ?AUTO_6070 ?AUTO_6073 ) ( IN-CITY ?AUTO_6073 ?AUTO_6072 ) ( not ( = ?AUTO_6071 ?AUTO_6073 ) ) ( not ( = ?AUTO_6069 ?AUTO_6073 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6070 ?AUTO_6073 ?AUTO_6071 ?AUTO_6072 )
      ( DELIVER-PKG ?AUTO_6068 ?AUTO_6069 )
      ( DELIVER-PKG-VERIFY ?AUTO_6068 ?AUTO_6069 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6094 - OBJ
      ?AUTO_6095 - LOCATION
    )
    :vars
    (
      ?AUTO_6096 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6094 ?AUTO_6096 ) ( AIRPLANE-AT ?AUTO_6096 ?AUTO_6095 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6094 ?AUTO_6096 ?AUTO_6095 )
      ( DELIVER-PKG-VERIFY ?AUTO_6094 ?AUTO_6095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6099 - OBJ
      ?AUTO_6100 - LOCATION
    )
    :vars
    (
      ?AUTO_6101 - AIRPLANE
      ?AUTO_6102 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6099 ?AUTO_6101 ) ( AIRPORT ?AUTO_6102 ) ( AIRPORT ?AUTO_6100 ) ( AIRPLANE-AT ?AUTO_6101 ?AUTO_6102 ) ( not ( = ?AUTO_6102 ?AUTO_6100 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6101 ?AUTO_6102 ?AUTO_6100 )
      ( DELIVER-PKG ?AUTO_6099 ?AUTO_6100 )
      ( DELIVER-PKG-VERIFY ?AUTO_6099 ?AUTO_6100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6105 - OBJ
      ?AUTO_6106 - LOCATION
    )
    :vars
    (
      ?AUTO_6108 - LOCATION
      ?AUTO_6107 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6108 ) ( AIRPORT ?AUTO_6106 ) ( AIRPLANE-AT ?AUTO_6107 ?AUTO_6108 ) ( not ( = ?AUTO_6108 ?AUTO_6106 ) ) ( OBJ-AT ?AUTO_6105 ?AUTO_6108 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6105 ?AUTO_6107 ?AUTO_6108 )
      ( DELIVER-PKG ?AUTO_6105 ?AUTO_6106 )
      ( DELIVER-PKG-VERIFY ?AUTO_6105 ?AUTO_6106 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6109 - OBJ
      ?AUTO_6110 - LOCATION
    )
    :vars
    (
      ?AUTO_6112 - LOCATION
      ?AUTO_6113 - LOCATION
      ?AUTO_6111 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6112 ) ( AIRPORT ?AUTO_6110 ) ( not ( = ?AUTO_6112 ?AUTO_6110 ) ) ( OBJ-AT ?AUTO_6109 ?AUTO_6112 ) ( AIRPORT ?AUTO_6113 ) ( AIRPLANE-AT ?AUTO_6111 ?AUTO_6113 ) ( not ( = ?AUTO_6113 ?AUTO_6112 ) ) ( not ( = ?AUTO_6110 ?AUTO_6113 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6111 ?AUTO_6113 ?AUTO_6112 )
      ( DELIVER-PKG ?AUTO_6109 ?AUTO_6110 )
      ( DELIVER-PKG-VERIFY ?AUTO_6109 ?AUTO_6110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6148 - OBJ
      ?AUTO_6149 - LOCATION
    )
    :vars
    (
      ?AUTO_6150 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6148 ?AUTO_6150 ) ( AIRPLANE-AT ?AUTO_6150 ?AUTO_6149 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6148 ?AUTO_6150 ?AUTO_6149 )
      ( DELIVER-PKG-VERIFY ?AUTO_6148 ?AUTO_6149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6157 - OBJ
      ?AUTO_6158 - LOCATION
    )
    :vars
    (
      ?AUTO_6159 - LOCATION
      ?AUTO_6160 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6159 ) ( AIRPORT ?AUTO_6158 ) ( AIRPLANE-AT ?AUTO_6160 ?AUTO_6159 ) ( not ( = ?AUTO_6159 ?AUTO_6158 ) ) ( OBJ-AT ?AUTO_6157 ?AUTO_6159 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6157 ?AUTO_6160 ?AUTO_6159 )
      ( DELIVER-PKG ?AUTO_6157 ?AUTO_6158 )
      ( DELIVER-PKG-VERIFY ?AUTO_6157 ?AUTO_6158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6199 - OBJ
      ?AUTO_6200 - LOCATION
    )
    :vars
    (
      ?AUTO_6201 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6199 ?AUTO_6201 ) ( AIRPLANE-AT ?AUTO_6201 ?AUTO_6200 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6199 ?AUTO_6201 ?AUTO_6200 )
      ( DELIVER-PKG-VERIFY ?AUTO_6199 ?AUTO_6200 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6202 - OBJ
      ?AUTO_6203 - LOCATION
    )
    :vars
    (
      ?AUTO_6204 - AIRPLANE
      ?AUTO_6205 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6202 ?AUTO_6204 ) ( AIRPORT ?AUTO_6205 ) ( AIRPORT ?AUTO_6203 ) ( AIRPLANE-AT ?AUTO_6204 ?AUTO_6205 ) ( not ( = ?AUTO_6205 ?AUTO_6203 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6204 ?AUTO_6205 ?AUTO_6203 )
      ( DELIVER-PKG ?AUTO_6202 ?AUTO_6203 )
      ( DELIVER-PKG-VERIFY ?AUTO_6202 ?AUTO_6203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6210 - OBJ
      ?AUTO_6211 - LOCATION
    )
    :vars
    (
      ?AUTO_6212 - LOCATION
      ?AUTO_6213 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6212 ) ( AIRPORT ?AUTO_6211 ) ( AIRPLANE-AT ?AUTO_6213 ?AUTO_6212 ) ( not ( = ?AUTO_6212 ?AUTO_6211 ) ) ( OBJ-AT ?AUTO_6210 ?AUTO_6212 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6210 ?AUTO_6213 ?AUTO_6212 )
      ( DELIVER-PKG ?AUTO_6210 ?AUTO_6211 )
      ( DELIVER-PKG-VERIFY ?AUTO_6210 ?AUTO_6211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6214 - OBJ
      ?AUTO_6215 - LOCATION
    )
    :vars
    (
      ?AUTO_6217 - LOCATION
      ?AUTO_6218 - LOCATION
      ?AUTO_6216 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6217 ) ( AIRPORT ?AUTO_6215 ) ( not ( = ?AUTO_6217 ?AUTO_6215 ) ) ( OBJ-AT ?AUTO_6214 ?AUTO_6217 ) ( AIRPORT ?AUTO_6218 ) ( AIRPLANE-AT ?AUTO_6216 ?AUTO_6218 ) ( not ( = ?AUTO_6218 ?AUTO_6217 ) ) ( not ( = ?AUTO_6215 ?AUTO_6218 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6216 ?AUTO_6218 ?AUTO_6217 )
      ( DELIVER-PKG ?AUTO_6214 ?AUTO_6215 )
      ( DELIVER-PKG-VERIFY ?AUTO_6214 ?AUTO_6215 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6259 - OBJ
      ?AUTO_6260 - LOCATION
    )
    :vars
    (
      ?AUTO_6261 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6259 ?AUTO_6261 ) ( AIRPLANE-AT ?AUTO_6261 ?AUTO_6260 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6259 ?AUTO_6261 ?AUTO_6260 )
      ( DELIVER-PKG-VERIFY ?AUTO_6259 ?AUTO_6260 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6284 - OBJ
      ?AUTO_6285 - LOCATION
    )
    :vars
    (
      ?AUTO_6287 - LOCATION
      ?AUTO_6286 - AIRPLANE
      ?AUTO_6288 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6287 ) ( AIRPORT ?AUTO_6285 ) ( AIRPLANE-AT ?AUTO_6286 ?AUTO_6287 ) ( not ( = ?AUTO_6287 ?AUTO_6285 ) ) ( TRUCK-AT ?AUTO_6288 ?AUTO_6287 ) ( IN-TRUCK ?AUTO_6284 ?AUTO_6288 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6284 ?AUTO_6288 ?AUTO_6287 )
      ( DELIVER-PKG ?AUTO_6284 ?AUTO_6285 )
      ( DELIVER-PKG-VERIFY ?AUTO_6284 ?AUTO_6285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6289 - OBJ
      ?AUTO_6290 - LOCATION
    )
    :vars
    (
      ?AUTO_6292 - LOCATION
      ?AUTO_6291 - AIRPLANE
      ?AUTO_6293 - TRUCK
      ?AUTO_6294 - LOCATION
      ?AUTO_6295 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6292 ) ( AIRPORT ?AUTO_6290 ) ( AIRPLANE-AT ?AUTO_6291 ?AUTO_6292 ) ( not ( = ?AUTO_6292 ?AUTO_6290 ) ) ( IN-TRUCK ?AUTO_6289 ?AUTO_6293 ) ( TRUCK-AT ?AUTO_6293 ?AUTO_6294 ) ( IN-CITY ?AUTO_6294 ?AUTO_6295 ) ( IN-CITY ?AUTO_6292 ?AUTO_6295 ) ( not ( = ?AUTO_6292 ?AUTO_6294 ) ) ( not ( = ?AUTO_6290 ?AUTO_6294 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6293 ?AUTO_6294 ?AUTO_6292 ?AUTO_6295 )
      ( DELIVER-PKG ?AUTO_6289 ?AUTO_6290 )
      ( DELIVER-PKG-VERIFY ?AUTO_6289 ?AUTO_6290 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6298 - OBJ
      ?AUTO_6299 - LOCATION
    )
    :vars
    (
      ?AUTO_6302 - LOCATION
      ?AUTO_6303 - AIRPLANE
      ?AUTO_6304 - TRUCK
      ?AUTO_6300 - LOCATION
      ?AUTO_6301 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6302 ) ( AIRPORT ?AUTO_6299 ) ( AIRPLANE-AT ?AUTO_6303 ?AUTO_6302 ) ( not ( = ?AUTO_6302 ?AUTO_6299 ) ) ( TRUCK-AT ?AUTO_6304 ?AUTO_6300 ) ( IN-CITY ?AUTO_6300 ?AUTO_6301 ) ( IN-CITY ?AUTO_6302 ?AUTO_6301 ) ( not ( = ?AUTO_6302 ?AUTO_6300 ) ) ( not ( = ?AUTO_6299 ?AUTO_6300 ) ) ( OBJ-AT ?AUTO_6298 ?AUTO_6300 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6298 ?AUTO_6304 ?AUTO_6300 )
      ( DELIVER-PKG ?AUTO_6298 ?AUTO_6299 )
      ( DELIVER-PKG-VERIFY ?AUTO_6298 ?AUTO_6299 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6305 - OBJ
      ?AUTO_6306 - LOCATION
    )
    :vars
    (
      ?AUTO_6309 - LOCATION
      ?AUTO_6310 - AIRPLANE
      ?AUTO_6308 - LOCATION
      ?AUTO_6311 - CITY
      ?AUTO_6307 - TRUCK
      ?AUTO_6312 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6309 ) ( AIRPORT ?AUTO_6306 ) ( AIRPLANE-AT ?AUTO_6310 ?AUTO_6309 ) ( not ( = ?AUTO_6309 ?AUTO_6306 ) ) ( IN-CITY ?AUTO_6308 ?AUTO_6311 ) ( IN-CITY ?AUTO_6309 ?AUTO_6311 ) ( not ( = ?AUTO_6309 ?AUTO_6308 ) ) ( not ( = ?AUTO_6306 ?AUTO_6308 ) ) ( OBJ-AT ?AUTO_6305 ?AUTO_6308 ) ( TRUCK-AT ?AUTO_6307 ?AUTO_6312 ) ( IN-CITY ?AUTO_6312 ?AUTO_6311 ) ( not ( = ?AUTO_6308 ?AUTO_6312 ) ) ( not ( = ?AUTO_6306 ?AUTO_6312 ) ) ( not ( = ?AUTO_6309 ?AUTO_6312 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6307 ?AUTO_6312 ?AUTO_6308 ?AUTO_6311 )
      ( DELIVER-PKG ?AUTO_6305 ?AUTO_6306 )
      ( DELIVER-PKG-VERIFY ?AUTO_6305 ?AUTO_6306 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6333 - OBJ
      ?AUTO_6334 - LOCATION
    )
    :vars
    (
      ?AUTO_6335 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6335 ?AUTO_6334 ) ( IN-TRUCK ?AUTO_6333 ?AUTO_6335 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6333 ?AUTO_6335 ?AUTO_6334 )
      ( DELIVER-PKG-VERIFY ?AUTO_6333 ?AUTO_6334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6336 - OBJ
      ?AUTO_6337 - LOCATION
    )
    :vars
    (
      ?AUTO_6338 - TRUCK
      ?AUTO_6339 - LOCATION
      ?AUTO_6340 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6336 ?AUTO_6338 ) ( TRUCK-AT ?AUTO_6338 ?AUTO_6339 ) ( IN-CITY ?AUTO_6339 ?AUTO_6340 ) ( IN-CITY ?AUTO_6337 ?AUTO_6340 ) ( not ( = ?AUTO_6337 ?AUTO_6339 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6338 ?AUTO_6339 ?AUTO_6337 ?AUTO_6340 )
      ( DELIVER-PKG ?AUTO_6336 ?AUTO_6337 )
      ( DELIVER-PKG-VERIFY ?AUTO_6336 ?AUTO_6337 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6395 - OBJ
      ?AUTO_6396 - LOCATION
    )
    :vars
    (
      ?AUTO_6397 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6395 ?AUTO_6397 ) ( AIRPLANE-AT ?AUTO_6397 ?AUTO_6396 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6395 ?AUTO_6397 ?AUTO_6396 )
      ( DELIVER-PKG-VERIFY ?AUTO_6395 ?AUTO_6396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6398 - OBJ
      ?AUTO_6399 - LOCATION
    )
    :vars
    (
      ?AUTO_6400 - AIRPLANE
      ?AUTO_6401 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6398 ?AUTO_6400 ) ( AIRPORT ?AUTO_6401 ) ( AIRPORT ?AUTO_6399 ) ( AIRPLANE-AT ?AUTO_6400 ?AUTO_6401 ) ( not ( = ?AUTO_6401 ?AUTO_6399 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6400 ?AUTO_6401 ?AUTO_6399 )
      ( DELIVER-PKG ?AUTO_6398 ?AUTO_6399 )
      ( DELIVER-PKG-VERIFY ?AUTO_6398 ?AUTO_6399 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6402 - OBJ
      ?AUTO_6403 - LOCATION
    )
    :vars
    (
      ?AUTO_6405 - LOCATION
      ?AUTO_6404 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6405 ) ( AIRPORT ?AUTO_6403 ) ( AIRPLANE-AT ?AUTO_6404 ?AUTO_6405 ) ( not ( = ?AUTO_6405 ?AUTO_6403 ) ) ( OBJ-AT ?AUTO_6402 ?AUTO_6405 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6402 ?AUTO_6404 ?AUTO_6405 )
      ( DELIVER-PKG ?AUTO_6402 ?AUTO_6403 )
      ( DELIVER-PKG-VERIFY ?AUTO_6402 ?AUTO_6403 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6406 - OBJ
      ?AUTO_6407 - LOCATION
    )
    :vars
    (
      ?AUTO_6409 - LOCATION
      ?AUTO_6408 - AIRPLANE
      ?AUTO_6410 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6409 ) ( AIRPORT ?AUTO_6407 ) ( AIRPLANE-AT ?AUTO_6408 ?AUTO_6409 ) ( not ( = ?AUTO_6409 ?AUTO_6407 ) ) ( TRUCK-AT ?AUTO_6410 ?AUTO_6409 ) ( IN-TRUCK ?AUTO_6406 ?AUTO_6410 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6406 ?AUTO_6410 ?AUTO_6409 )
      ( DELIVER-PKG ?AUTO_6406 ?AUTO_6407 )
      ( DELIVER-PKG-VERIFY ?AUTO_6406 ?AUTO_6407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6411 - OBJ
      ?AUTO_6412 - LOCATION
    )
    :vars
    (
      ?AUTO_6414 - LOCATION
      ?AUTO_6413 - AIRPLANE
      ?AUTO_6415 - TRUCK
      ?AUTO_6416 - LOCATION
      ?AUTO_6417 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6414 ) ( AIRPORT ?AUTO_6412 ) ( AIRPLANE-AT ?AUTO_6413 ?AUTO_6414 ) ( not ( = ?AUTO_6414 ?AUTO_6412 ) ) ( IN-TRUCK ?AUTO_6411 ?AUTO_6415 ) ( TRUCK-AT ?AUTO_6415 ?AUTO_6416 ) ( IN-CITY ?AUTO_6416 ?AUTO_6417 ) ( IN-CITY ?AUTO_6414 ?AUTO_6417 ) ( not ( = ?AUTO_6414 ?AUTO_6416 ) ) ( not ( = ?AUTO_6412 ?AUTO_6416 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6415 ?AUTO_6416 ?AUTO_6414 ?AUTO_6417 )
      ( DELIVER-PKG ?AUTO_6411 ?AUTO_6412 )
      ( DELIVER-PKG-VERIFY ?AUTO_6411 ?AUTO_6412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6422 - OBJ
      ?AUTO_6423 - LOCATION
    )
    :vars
    (
      ?AUTO_6425 - LOCATION
      ?AUTO_6427 - TRUCK
      ?AUTO_6428 - LOCATION
      ?AUTO_6426 - CITY
      ?AUTO_6429 - LOCATION
      ?AUTO_6424 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6425 ) ( AIRPORT ?AUTO_6423 ) ( not ( = ?AUTO_6425 ?AUTO_6423 ) ) ( IN-TRUCK ?AUTO_6422 ?AUTO_6427 ) ( TRUCK-AT ?AUTO_6427 ?AUTO_6428 ) ( IN-CITY ?AUTO_6428 ?AUTO_6426 ) ( IN-CITY ?AUTO_6425 ?AUTO_6426 ) ( not ( = ?AUTO_6425 ?AUTO_6428 ) ) ( not ( = ?AUTO_6423 ?AUTO_6428 ) ) ( AIRPORT ?AUTO_6429 ) ( AIRPLANE-AT ?AUTO_6424 ?AUTO_6429 ) ( not ( = ?AUTO_6429 ?AUTO_6425 ) ) ( not ( = ?AUTO_6423 ?AUTO_6429 ) ) ( not ( = ?AUTO_6428 ?AUTO_6429 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6424 ?AUTO_6429 ?AUTO_6425 )
      ( DELIVER-PKG ?AUTO_6422 ?AUTO_6423 )
      ( DELIVER-PKG-VERIFY ?AUTO_6422 ?AUTO_6423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6442 - OBJ
      ?AUTO_6443 - LOCATION
    )
    :vars
    (
      ?AUTO_6447 - LOCATION
      ?AUTO_6445 - TRUCK
      ?AUTO_6448 - LOCATION
      ?AUTO_6446 - CITY
      ?AUTO_6444 - LOCATION
      ?AUTO_6449 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6447 ) ( AIRPORT ?AUTO_6443 ) ( not ( = ?AUTO_6447 ?AUTO_6443 ) ) ( IN-TRUCK ?AUTO_6442 ?AUTO_6445 ) ( TRUCK-AT ?AUTO_6445 ?AUTO_6448 ) ( IN-CITY ?AUTO_6448 ?AUTO_6446 ) ( IN-CITY ?AUTO_6447 ?AUTO_6446 ) ( not ( = ?AUTO_6447 ?AUTO_6448 ) ) ( not ( = ?AUTO_6443 ?AUTO_6448 ) ) ( AIRPORT ?AUTO_6444 ) ( not ( = ?AUTO_6444 ?AUTO_6447 ) ) ( not ( = ?AUTO_6443 ?AUTO_6444 ) ) ( not ( = ?AUTO_6448 ?AUTO_6444 ) ) ( AIRPLANE-AT ?AUTO_6449 ?AUTO_6443 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6449 ?AUTO_6443 ?AUTO_6444 )
      ( DELIVER-PKG ?AUTO_6442 ?AUTO_6443 )
      ( DELIVER-PKG-VERIFY ?AUTO_6442 ?AUTO_6443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6478 - OBJ
      ?AUTO_6479 - LOCATION
    )
    :vars
    (
      ?AUTO_6481 - LOCATION
      ?AUTO_6483 - TRUCK
      ?AUTO_6484 - LOCATION
      ?AUTO_6480 - CITY
      ?AUTO_6485 - LOCATION
      ?AUTO_6482 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6481 ) ( AIRPORT ?AUTO_6479 ) ( not ( = ?AUTO_6481 ?AUTO_6479 ) ) ( TRUCK-AT ?AUTO_6483 ?AUTO_6484 ) ( IN-CITY ?AUTO_6484 ?AUTO_6480 ) ( IN-CITY ?AUTO_6481 ?AUTO_6480 ) ( not ( = ?AUTO_6481 ?AUTO_6484 ) ) ( not ( = ?AUTO_6479 ?AUTO_6484 ) ) ( AIRPORT ?AUTO_6485 ) ( not ( = ?AUTO_6485 ?AUTO_6481 ) ) ( not ( = ?AUTO_6479 ?AUTO_6485 ) ) ( not ( = ?AUTO_6484 ?AUTO_6485 ) ) ( AIRPLANE-AT ?AUTO_6482 ?AUTO_6479 ) ( OBJ-AT ?AUTO_6478 ?AUTO_6484 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6478 ?AUTO_6483 ?AUTO_6484 )
      ( DELIVER-PKG ?AUTO_6478 ?AUTO_6479 )
      ( DELIVER-PKG-VERIFY ?AUTO_6478 ?AUTO_6479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6490 - OBJ
      ?AUTO_6491 - LOCATION
    )
    :vars
    (
      ?AUTO_6492 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6492 ?AUTO_6491 ) ( IN-TRUCK ?AUTO_6490 ?AUTO_6492 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6490 ?AUTO_6492 ?AUTO_6491 )
      ( DELIVER-PKG-VERIFY ?AUTO_6490 ?AUTO_6491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6497 - OBJ
      ?AUTO_6498 - LOCATION
    )
    :vars
    (
      ?AUTO_6499 - TRUCK
      ?AUTO_6500 - LOCATION
      ?AUTO_6501 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6497 ?AUTO_6499 ) ( TRUCK-AT ?AUTO_6499 ?AUTO_6500 ) ( IN-CITY ?AUTO_6500 ?AUTO_6501 ) ( IN-CITY ?AUTO_6498 ?AUTO_6501 ) ( not ( = ?AUTO_6498 ?AUTO_6500 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6499 ?AUTO_6500 ?AUTO_6498 ?AUTO_6501 )
      ( DELIVER-PKG ?AUTO_6497 ?AUTO_6498 )
      ( DELIVER-PKG-VERIFY ?AUTO_6497 ?AUTO_6498 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6502 - OBJ
      ?AUTO_6503 - LOCATION
    )
    :vars
    (
      ?AUTO_6504 - TRUCK
      ?AUTO_6505 - LOCATION
      ?AUTO_6506 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6504 ?AUTO_6505 ) ( IN-CITY ?AUTO_6505 ?AUTO_6506 ) ( IN-CITY ?AUTO_6503 ?AUTO_6506 ) ( not ( = ?AUTO_6503 ?AUTO_6505 ) ) ( OBJ-AT ?AUTO_6502 ?AUTO_6505 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6502 ?AUTO_6504 ?AUTO_6505 )
      ( DELIVER-PKG ?AUTO_6502 ?AUTO_6503 )
      ( DELIVER-PKG-VERIFY ?AUTO_6502 ?AUTO_6503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6515 - OBJ
      ?AUTO_6516 - LOCATION
    )
    :vars
    (
      ?AUTO_6518 - LOCATION
      ?AUTO_6519 - CITY
      ?AUTO_6517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6518 ?AUTO_6519 ) ( IN-CITY ?AUTO_6516 ?AUTO_6519 ) ( not ( = ?AUTO_6516 ?AUTO_6518 ) ) ( OBJ-AT ?AUTO_6515 ?AUTO_6518 ) ( TRUCK-AT ?AUTO_6517 ?AUTO_6516 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6517 ?AUTO_6516 ?AUTO_6518 ?AUTO_6519 )
      ( DELIVER-PKG ?AUTO_6515 ?AUTO_6516 )
      ( DELIVER-PKG-VERIFY ?AUTO_6515 ?AUTO_6516 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6522 - OBJ
      ?AUTO_6523 - LOCATION
    )
    :vars
    (
      ?AUTO_6524 - LOCATION
      ?AUTO_6526 - CITY
      ?AUTO_6525 - TRUCK
      ?AUTO_6527 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6524 ?AUTO_6526 ) ( IN-CITY ?AUTO_6523 ?AUTO_6526 ) ( not ( = ?AUTO_6523 ?AUTO_6524 ) ) ( TRUCK-AT ?AUTO_6525 ?AUTO_6523 ) ( IN-AIRPLANE ?AUTO_6522 ?AUTO_6527 ) ( AIRPLANE-AT ?AUTO_6527 ?AUTO_6524 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6522 ?AUTO_6527 ?AUTO_6524 )
      ( DELIVER-PKG ?AUTO_6522 ?AUTO_6523 )
      ( DELIVER-PKG-VERIFY ?AUTO_6522 ?AUTO_6523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6528 - OBJ
      ?AUTO_6529 - LOCATION
    )
    :vars
    (
      ?AUTO_6530 - LOCATION
      ?AUTO_6532 - CITY
      ?AUTO_6531 - TRUCK
      ?AUTO_6533 - AIRPLANE
      ?AUTO_6534 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6530 ?AUTO_6532 ) ( IN-CITY ?AUTO_6529 ?AUTO_6532 ) ( not ( = ?AUTO_6529 ?AUTO_6530 ) ) ( TRUCK-AT ?AUTO_6531 ?AUTO_6529 ) ( IN-AIRPLANE ?AUTO_6528 ?AUTO_6533 ) ( AIRPORT ?AUTO_6534 ) ( AIRPORT ?AUTO_6530 ) ( AIRPLANE-AT ?AUTO_6533 ?AUTO_6534 ) ( not ( = ?AUTO_6534 ?AUTO_6530 ) ) ( not ( = ?AUTO_6529 ?AUTO_6534 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6533 ?AUTO_6534 ?AUTO_6530 )
      ( DELIVER-PKG ?AUTO_6528 ?AUTO_6529 )
      ( DELIVER-PKG-VERIFY ?AUTO_6528 ?AUTO_6529 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6539 - OBJ
      ?AUTO_6540 - LOCATION
    )
    :vars
    (
      ?AUTO_6541 - LOCATION
      ?AUTO_6544 - CITY
      ?AUTO_6542 - TRUCK
      ?AUTO_6543 - LOCATION
      ?AUTO_6545 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6541 ?AUTO_6544 ) ( IN-CITY ?AUTO_6540 ?AUTO_6544 ) ( not ( = ?AUTO_6540 ?AUTO_6541 ) ) ( TRUCK-AT ?AUTO_6542 ?AUTO_6540 ) ( AIRPORT ?AUTO_6543 ) ( AIRPORT ?AUTO_6541 ) ( AIRPLANE-AT ?AUTO_6545 ?AUTO_6543 ) ( not ( = ?AUTO_6543 ?AUTO_6541 ) ) ( not ( = ?AUTO_6540 ?AUTO_6543 ) ) ( OBJ-AT ?AUTO_6539 ?AUTO_6543 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6539 ?AUTO_6545 ?AUTO_6543 )
      ( DELIVER-PKG ?AUTO_6539 ?AUTO_6540 )
      ( DELIVER-PKG-VERIFY ?AUTO_6539 ?AUTO_6540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6546 - OBJ
      ?AUTO_6547 - LOCATION
    )
    :vars
    (
      ?AUTO_6548 - LOCATION
      ?AUTO_6552 - CITY
      ?AUTO_6549 - TRUCK
      ?AUTO_6550 - LOCATION
      ?AUTO_6553 - LOCATION
      ?AUTO_6551 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6548 ?AUTO_6552 ) ( IN-CITY ?AUTO_6547 ?AUTO_6552 ) ( not ( = ?AUTO_6547 ?AUTO_6548 ) ) ( TRUCK-AT ?AUTO_6549 ?AUTO_6547 ) ( AIRPORT ?AUTO_6550 ) ( AIRPORT ?AUTO_6548 ) ( not ( = ?AUTO_6550 ?AUTO_6548 ) ) ( not ( = ?AUTO_6547 ?AUTO_6550 ) ) ( OBJ-AT ?AUTO_6546 ?AUTO_6550 ) ( AIRPORT ?AUTO_6553 ) ( AIRPLANE-AT ?AUTO_6551 ?AUTO_6553 ) ( not ( = ?AUTO_6553 ?AUTO_6550 ) ) ( not ( = ?AUTO_6547 ?AUTO_6553 ) ) ( not ( = ?AUTO_6548 ?AUTO_6553 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6551 ?AUTO_6553 ?AUTO_6550 )
      ( DELIVER-PKG ?AUTO_6546 ?AUTO_6547 )
      ( DELIVER-PKG-VERIFY ?AUTO_6546 ?AUTO_6547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6594 - OBJ
      ?AUTO_6595 - LOCATION
    )
    :vars
    (
      ?AUTO_6596 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6596 ?AUTO_6595 ) ( IN-TRUCK ?AUTO_6594 ?AUTO_6596 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6594 ?AUTO_6596 ?AUTO_6595 )
      ( DELIVER-PKG-VERIFY ?AUTO_6594 ?AUTO_6595 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6599 - OBJ
      ?AUTO_6600 - LOCATION
    )
    :vars
    (
      ?AUTO_6601 - TRUCK
      ?AUTO_6602 - LOCATION
      ?AUTO_6603 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6599 ?AUTO_6601 ) ( TRUCK-AT ?AUTO_6601 ?AUTO_6602 ) ( IN-CITY ?AUTO_6602 ?AUTO_6603 ) ( IN-CITY ?AUTO_6600 ?AUTO_6603 ) ( not ( = ?AUTO_6600 ?AUTO_6602 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6601 ?AUTO_6602 ?AUTO_6600 ?AUTO_6603 )
      ( DELIVER-PKG ?AUTO_6599 ?AUTO_6600 )
      ( DELIVER-PKG-VERIFY ?AUTO_6599 ?AUTO_6600 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6604 - OBJ
      ?AUTO_6605 - LOCATION
    )
    :vars
    (
      ?AUTO_6606 - TRUCK
      ?AUTO_6607 - LOCATION
      ?AUTO_6608 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6606 ?AUTO_6607 ) ( IN-CITY ?AUTO_6607 ?AUTO_6608 ) ( IN-CITY ?AUTO_6605 ?AUTO_6608 ) ( not ( = ?AUTO_6605 ?AUTO_6607 ) ) ( OBJ-AT ?AUTO_6604 ?AUTO_6607 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6604 ?AUTO_6606 ?AUTO_6607 )
      ( DELIVER-PKG ?AUTO_6604 ?AUTO_6605 )
      ( DELIVER-PKG-VERIFY ?AUTO_6604 ?AUTO_6605 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6613 - OBJ
      ?AUTO_6614 - LOCATION
    )
    :vars
    (
      ?AUTO_6617 - TRUCK
      ?AUTO_6616 - LOCATION
      ?AUTO_6615 - CITY
      ?AUTO_6618 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6617 ?AUTO_6616 ) ( IN-CITY ?AUTO_6616 ?AUTO_6615 ) ( IN-CITY ?AUTO_6614 ?AUTO_6615 ) ( not ( = ?AUTO_6614 ?AUTO_6616 ) ) ( IN-AIRPLANE ?AUTO_6613 ?AUTO_6618 ) ( AIRPLANE-AT ?AUTO_6618 ?AUTO_6616 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6613 ?AUTO_6618 ?AUTO_6616 )
      ( DELIVER-PKG ?AUTO_6613 ?AUTO_6614 )
      ( DELIVER-PKG-VERIFY ?AUTO_6613 ?AUTO_6614 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6619 - OBJ
      ?AUTO_6620 - LOCATION
    )
    :vars
    (
      ?AUTO_6623 - TRUCK
      ?AUTO_6621 - LOCATION
      ?AUTO_6622 - CITY
      ?AUTO_6624 - AIRPLANE
      ?AUTO_6625 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6623 ?AUTO_6621 ) ( IN-CITY ?AUTO_6621 ?AUTO_6622 ) ( IN-CITY ?AUTO_6620 ?AUTO_6622 ) ( not ( = ?AUTO_6620 ?AUTO_6621 ) ) ( IN-AIRPLANE ?AUTO_6619 ?AUTO_6624 ) ( AIRPORT ?AUTO_6625 ) ( AIRPORT ?AUTO_6621 ) ( AIRPLANE-AT ?AUTO_6624 ?AUTO_6625 ) ( not ( = ?AUTO_6625 ?AUTO_6621 ) ) ( not ( = ?AUTO_6620 ?AUTO_6625 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6624 ?AUTO_6625 ?AUTO_6621 )
      ( DELIVER-PKG ?AUTO_6619 ?AUTO_6620 )
      ( DELIVER-PKG-VERIFY ?AUTO_6619 ?AUTO_6620 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6626 - OBJ
      ?AUTO_6627 - LOCATION
    )
    :vars
    (
      ?AUTO_6631 - TRUCK
      ?AUTO_6628 - LOCATION
      ?AUTO_6629 - CITY
      ?AUTO_6632 - LOCATION
      ?AUTO_6630 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6631 ?AUTO_6628 ) ( IN-CITY ?AUTO_6628 ?AUTO_6629 ) ( IN-CITY ?AUTO_6627 ?AUTO_6629 ) ( not ( = ?AUTO_6627 ?AUTO_6628 ) ) ( AIRPORT ?AUTO_6632 ) ( AIRPORT ?AUTO_6628 ) ( AIRPLANE-AT ?AUTO_6630 ?AUTO_6632 ) ( not ( = ?AUTO_6632 ?AUTO_6628 ) ) ( not ( = ?AUTO_6627 ?AUTO_6632 ) ) ( OBJ-AT ?AUTO_6626 ?AUTO_6632 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6626 ?AUTO_6630 ?AUTO_6632 )
      ( DELIVER-PKG ?AUTO_6626 ?AUTO_6627 )
      ( DELIVER-PKG-VERIFY ?AUTO_6626 ?AUTO_6627 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6633 - OBJ
      ?AUTO_6634 - LOCATION
    )
    :vars
    (
      ?AUTO_6636 - TRUCK
      ?AUTO_6638 - LOCATION
      ?AUTO_6639 - CITY
      ?AUTO_6637 - LOCATION
      ?AUTO_6635 - AIRPLANE
      ?AUTO_6640 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6636 ?AUTO_6638 ) ( IN-CITY ?AUTO_6638 ?AUTO_6639 ) ( IN-CITY ?AUTO_6634 ?AUTO_6639 ) ( not ( = ?AUTO_6634 ?AUTO_6638 ) ) ( AIRPORT ?AUTO_6637 ) ( AIRPORT ?AUTO_6638 ) ( AIRPLANE-AT ?AUTO_6635 ?AUTO_6637 ) ( not ( = ?AUTO_6637 ?AUTO_6638 ) ) ( not ( = ?AUTO_6634 ?AUTO_6637 ) ) ( TRUCK-AT ?AUTO_6640 ?AUTO_6637 ) ( IN-TRUCK ?AUTO_6633 ?AUTO_6640 ) ( not ( = ?AUTO_6636 ?AUTO_6640 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6633 ?AUTO_6640 ?AUTO_6637 )
      ( DELIVER-PKG ?AUTO_6633 ?AUTO_6634 )
      ( DELIVER-PKG-VERIFY ?AUTO_6633 ?AUTO_6634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6641 - OBJ
      ?AUTO_6642 - LOCATION
    )
    :vars
    (
      ?AUTO_6646 - TRUCK
      ?AUTO_6647 - LOCATION
      ?AUTO_6643 - CITY
      ?AUTO_6645 - LOCATION
      ?AUTO_6644 - AIRPLANE
      ?AUTO_6648 - TRUCK
      ?AUTO_6649 - LOCATION
      ?AUTO_6650 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6646 ?AUTO_6647 ) ( IN-CITY ?AUTO_6647 ?AUTO_6643 ) ( IN-CITY ?AUTO_6642 ?AUTO_6643 ) ( not ( = ?AUTO_6642 ?AUTO_6647 ) ) ( AIRPORT ?AUTO_6645 ) ( AIRPORT ?AUTO_6647 ) ( AIRPLANE-AT ?AUTO_6644 ?AUTO_6645 ) ( not ( = ?AUTO_6645 ?AUTO_6647 ) ) ( not ( = ?AUTO_6642 ?AUTO_6645 ) ) ( IN-TRUCK ?AUTO_6641 ?AUTO_6648 ) ( not ( = ?AUTO_6646 ?AUTO_6648 ) ) ( TRUCK-AT ?AUTO_6648 ?AUTO_6649 ) ( IN-CITY ?AUTO_6649 ?AUTO_6650 ) ( IN-CITY ?AUTO_6645 ?AUTO_6650 ) ( not ( = ?AUTO_6645 ?AUTO_6649 ) ) ( not ( = ?AUTO_6642 ?AUTO_6649 ) ) ( not ( = ?AUTO_6647 ?AUTO_6649 ) ) ( not ( = ?AUTO_6643 ?AUTO_6650 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6648 ?AUTO_6649 ?AUTO_6645 ?AUTO_6650 )
      ( DELIVER-PKG ?AUTO_6641 ?AUTO_6642 )
      ( DELIVER-PKG-VERIFY ?AUTO_6641 ?AUTO_6642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6655 - OBJ
      ?AUTO_6656 - LOCATION
    )
    :vars
    (
      ?AUTO_6661 - TRUCK
      ?AUTO_6660 - LOCATION
      ?AUTO_6664 - CITY
      ?AUTO_6658 - LOCATION
      ?AUTO_6663 - TRUCK
      ?AUTO_6662 - LOCATION
      ?AUTO_6659 - CITY
      ?AUTO_6665 - LOCATION
      ?AUTO_6657 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6661 ?AUTO_6660 ) ( IN-CITY ?AUTO_6660 ?AUTO_6664 ) ( IN-CITY ?AUTO_6656 ?AUTO_6664 ) ( not ( = ?AUTO_6656 ?AUTO_6660 ) ) ( AIRPORT ?AUTO_6658 ) ( AIRPORT ?AUTO_6660 ) ( not ( = ?AUTO_6658 ?AUTO_6660 ) ) ( not ( = ?AUTO_6656 ?AUTO_6658 ) ) ( IN-TRUCK ?AUTO_6655 ?AUTO_6663 ) ( not ( = ?AUTO_6661 ?AUTO_6663 ) ) ( TRUCK-AT ?AUTO_6663 ?AUTO_6662 ) ( IN-CITY ?AUTO_6662 ?AUTO_6659 ) ( IN-CITY ?AUTO_6658 ?AUTO_6659 ) ( not ( = ?AUTO_6658 ?AUTO_6662 ) ) ( not ( = ?AUTO_6656 ?AUTO_6662 ) ) ( not ( = ?AUTO_6660 ?AUTO_6662 ) ) ( not ( = ?AUTO_6664 ?AUTO_6659 ) ) ( AIRPORT ?AUTO_6665 ) ( AIRPLANE-AT ?AUTO_6657 ?AUTO_6665 ) ( not ( = ?AUTO_6665 ?AUTO_6658 ) ) ( not ( = ?AUTO_6656 ?AUTO_6665 ) ) ( not ( = ?AUTO_6660 ?AUTO_6665 ) ) ( not ( = ?AUTO_6662 ?AUTO_6665 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6657 ?AUTO_6665 ?AUTO_6658 )
      ( DELIVER-PKG ?AUTO_6655 ?AUTO_6656 )
      ( DELIVER-PKG-VERIFY ?AUTO_6655 ?AUTO_6656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6678 - OBJ
      ?AUTO_6679 - LOCATION
    )
    :vars
    (
      ?AUTO_6686 - TRUCK
      ?AUTO_6681 - LOCATION
      ?AUTO_6688 - CITY
      ?AUTO_6685 - LOCATION
      ?AUTO_6682 - TRUCK
      ?AUTO_6683 - LOCATION
      ?AUTO_6680 - CITY
      ?AUTO_6687 - LOCATION
      ?AUTO_6684 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6686 ?AUTO_6681 ) ( IN-CITY ?AUTO_6681 ?AUTO_6688 ) ( IN-CITY ?AUTO_6679 ?AUTO_6688 ) ( not ( = ?AUTO_6679 ?AUTO_6681 ) ) ( AIRPORT ?AUTO_6685 ) ( AIRPORT ?AUTO_6681 ) ( not ( = ?AUTO_6685 ?AUTO_6681 ) ) ( not ( = ?AUTO_6679 ?AUTO_6685 ) ) ( IN-TRUCK ?AUTO_6678 ?AUTO_6682 ) ( not ( = ?AUTO_6686 ?AUTO_6682 ) ) ( TRUCK-AT ?AUTO_6682 ?AUTO_6683 ) ( IN-CITY ?AUTO_6683 ?AUTO_6680 ) ( IN-CITY ?AUTO_6685 ?AUTO_6680 ) ( not ( = ?AUTO_6685 ?AUTO_6683 ) ) ( not ( = ?AUTO_6679 ?AUTO_6683 ) ) ( not ( = ?AUTO_6681 ?AUTO_6683 ) ) ( not ( = ?AUTO_6688 ?AUTO_6680 ) ) ( AIRPORT ?AUTO_6687 ) ( not ( = ?AUTO_6687 ?AUTO_6685 ) ) ( not ( = ?AUTO_6679 ?AUTO_6687 ) ) ( not ( = ?AUTO_6681 ?AUTO_6687 ) ) ( not ( = ?AUTO_6683 ?AUTO_6687 ) ) ( AIRPLANE-AT ?AUTO_6684 ?AUTO_6681 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6684 ?AUTO_6681 ?AUTO_6687 )
      ( DELIVER-PKG ?AUTO_6678 ?AUTO_6679 )
      ( DELIVER-PKG-VERIFY ?AUTO_6678 ?AUTO_6679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6695 - OBJ
      ?AUTO_6696 - LOCATION
    )
    :vars
    (
      ?AUTO_6702 - LOCATION
      ?AUTO_6705 - CITY
      ?AUTO_6701 - LOCATION
      ?AUTO_6698 - TRUCK
      ?AUTO_6703 - TRUCK
      ?AUTO_6699 - LOCATION
      ?AUTO_6704 - CITY
      ?AUTO_6697 - LOCATION
      ?AUTO_6700 - AIRPLANE
      ?AUTO_6706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6702 ?AUTO_6705 ) ( IN-CITY ?AUTO_6696 ?AUTO_6705 ) ( not ( = ?AUTO_6696 ?AUTO_6702 ) ) ( AIRPORT ?AUTO_6701 ) ( AIRPORT ?AUTO_6702 ) ( not ( = ?AUTO_6701 ?AUTO_6702 ) ) ( not ( = ?AUTO_6696 ?AUTO_6701 ) ) ( IN-TRUCK ?AUTO_6695 ?AUTO_6698 ) ( not ( = ?AUTO_6703 ?AUTO_6698 ) ) ( TRUCK-AT ?AUTO_6698 ?AUTO_6699 ) ( IN-CITY ?AUTO_6699 ?AUTO_6704 ) ( IN-CITY ?AUTO_6701 ?AUTO_6704 ) ( not ( = ?AUTO_6701 ?AUTO_6699 ) ) ( not ( = ?AUTO_6696 ?AUTO_6699 ) ) ( not ( = ?AUTO_6702 ?AUTO_6699 ) ) ( not ( = ?AUTO_6705 ?AUTO_6704 ) ) ( AIRPORT ?AUTO_6697 ) ( not ( = ?AUTO_6697 ?AUTO_6701 ) ) ( not ( = ?AUTO_6696 ?AUTO_6697 ) ) ( not ( = ?AUTO_6702 ?AUTO_6697 ) ) ( not ( = ?AUTO_6699 ?AUTO_6697 ) ) ( AIRPLANE-AT ?AUTO_6700 ?AUTO_6702 ) ( TRUCK-AT ?AUTO_6703 ?AUTO_6706 ) ( IN-CITY ?AUTO_6706 ?AUTO_6705 ) ( not ( = ?AUTO_6702 ?AUTO_6706 ) ) ( not ( = ?AUTO_6696 ?AUTO_6706 ) ) ( not ( = ?AUTO_6701 ?AUTO_6706 ) ) ( not ( = ?AUTO_6699 ?AUTO_6706 ) ) ( not ( = ?AUTO_6697 ?AUTO_6706 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6703 ?AUTO_6706 ?AUTO_6702 ?AUTO_6705 )
      ( DELIVER-PKG ?AUTO_6695 ?AUTO_6696 )
      ( DELIVER-PKG-VERIFY ?AUTO_6695 ?AUTO_6696 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6711 - OBJ
      ?AUTO_6712 - LOCATION
    )
    :vars
    (
      ?AUTO_6714 - LOCATION
      ?AUTO_6722 - CITY
      ?AUTO_6713 - LOCATION
      ?AUTO_6716 - TRUCK
      ?AUTO_6719 - TRUCK
      ?AUTO_6717 - LOCATION
      ?AUTO_6718 - CITY
      ?AUTO_6721 - LOCATION
      ?AUTO_6720 - AIRPLANE
      ?AUTO_6715 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6714 ?AUTO_6722 ) ( IN-CITY ?AUTO_6712 ?AUTO_6722 ) ( not ( = ?AUTO_6712 ?AUTO_6714 ) ) ( AIRPORT ?AUTO_6713 ) ( AIRPORT ?AUTO_6714 ) ( not ( = ?AUTO_6713 ?AUTO_6714 ) ) ( not ( = ?AUTO_6712 ?AUTO_6713 ) ) ( IN-TRUCK ?AUTO_6711 ?AUTO_6716 ) ( not ( = ?AUTO_6719 ?AUTO_6716 ) ) ( TRUCK-AT ?AUTO_6716 ?AUTO_6717 ) ( IN-CITY ?AUTO_6717 ?AUTO_6718 ) ( IN-CITY ?AUTO_6713 ?AUTO_6718 ) ( not ( = ?AUTO_6713 ?AUTO_6717 ) ) ( not ( = ?AUTO_6712 ?AUTO_6717 ) ) ( not ( = ?AUTO_6714 ?AUTO_6717 ) ) ( not ( = ?AUTO_6722 ?AUTO_6718 ) ) ( AIRPORT ?AUTO_6721 ) ( not ( = ?AUTO_6721 ?AUTO_6713 ) ) ( not ( = ?AUTO_6712 ?AUTO_6721 ) ) ( not ( = ?AUTO_6714 ?AUTO_6721 ) ) ( not ( = ?AUTO_6717 ?AUTO_6721 ) ) ( AIRPLANE-AT ?AUTO_6720 ?AUTO_6714 ) ( IN-CITY ?AUTO_6715 ?AUTO_6722 ) ( not ( = ?AUTO_6714 ?AUTO_6715 ) ) ( not ( = ?AUTO_6712 ?AUTO_6715 ) ) ( not ( = ?AUTO_6713 ?AUTO_6715 ) ) ( not ( = ?AUTO_6717 ?AUTO_6715 ) ) ( not ( = ?AUTO_6721 ?AUTO_6715 ) ) ( TRUCK-AT ?AUTO_6719 ?AUTO_6712 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6719 ?AUTO_6712 ?AUTO_6715 ?AUTO_6722 )
      ( DELIVER-PKG ?AUTO_6711 ?AUTO_6712 )
      ( DELIVER-PKG-VERIFY ?AUTO_6711 ?AUTO_6712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6737 - OBJ
      ?AUTO_6738 - LOCATION
    )
    :vars
    (
      ?AUTO_6739 - LOCATION
      ?AUTO_6741 - CITY
      ?AUTO_6747 - LOCATION
      ?AUTO_6740 - TRUCK
      ?AUTO_6744 - TRUCK
      ?AUTO_6743 - LOCATION
      ?AUTO_6742 - CITY
      ?AUTO_6748 - LOCATION
      ?AUTO_6745 - AIRPLANE
      ?AUTO_6746 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6739 ?AUTO_6741 ) ( IN-CITY ?AUTO_6738 ?AUTO_6741 ) ( not ( = ?AUTO_6738 ?AUTO_6739 ) ) ( AIRPORT ?AUTO_6747 ) ( AIRPORT ?AUTO_6739 ) ( not ( = ?AUTO_6747 ?AUTO_6739 ) ) ( not ( = ?AUTO_6738 ?AUTO_6747 ) ) ( not ( = ?AUTO_6740 ?AUTO_6744 ) ) ( TRUCK-AT ?AUTO_6744 ?AUTO_6743 ) ( IN-CITY ?AUTO_6743 ?AUTO_6742 ) ( IN-CITY ?AUTO_6747 ?AUTO_6742 ) ( not ( = ?AUTO_6747 ?AUTO_6743 ) ) ( not ( = ?AUTO_6738 ?AUTO_6743 ) ) ( not ( = ?AUTO_6739 ?AUTO_6743 ) ) ( not ( = ?AUTO_6741 ?AUTO_6742 ) ) ( AIRPORT ?AUTO_6748 ) ( not ( = ?AUTO_6748 ?AUTO_6747 ) ) ( not ( = ?AUTO_6738 ?AUTO_6748 ) ) ( not ( = ?AUTO_6739 ?AUTO_6748 ) ) ( not ( = ?AUTO_6743 ?AUTO_6748 ) ) ( AIRPLANE-AT ?AUTO_6745 ?AUTO_6739 ) ( IN-CITY ?AUTO_6746 ?AUTO_6741 ) ( not ( = ?AUTO_6739 ?AUTO_6746 ) ) ( not ( = ?AUTO_6738 ?AUTO_6746 ) ) ( not ( = ?AUTO_6747 ?AUTO_6746 ) ) ( not ( = ?AUTO_6743 ?AUTO_6746 ) ) ( not ( = ?AUTO_6748 ?AUTO_6746 ) ) ( TRUCK-AT ?AUTO_6740 ?AUTO_6738 ) ( OBJ-AT ?AUTO_6737 ?AUTO_6743 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6737 ?AUTO_6744 ?AUTO_6743 )
      ( DELIVER-PKG ?AUTO_6737 ?AUTO_6738 )
      ( DELIVER-PKG-VERIFY ?AUTO_6737 ?AUTO_6738 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6753 - OBJ
      ?AUTO_6754 - LOCATION
    )
    :vars
    (
      ?AUTO_6755 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6755 ?AUTO_6754 ) ( IN-TRUCK ?AUTO_6753 ?AUTO_6755 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6753 ?AUTO_6755 ?AUTO_6754 )
      ( DELIVER-PKG-VERIFY ?AUTO_6753 ?AUTO_6754 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6804 - OBJ
      ?AUTO_6805 - LOCATION
    )
    :vars
    (
      ?AUTO_6806 - LOCATION
      ?AUTO_6808 - CITY
      ?AUTO_6807 - TRUCK
      ?AUTO_6809 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6806 ?AUTO_6808 ) ( IN-CITY ?AUTO_6805 ?AUTO_6808 ) ( not ( = ?AUTO_6805 ?AUTO_6806 ) ) ( OBJ-AT ?AUTO_6804 ?AUTO_6806 ) ( TRUCK-AT ?AUTO_6807 ?AUTO_6809 ) ( IN-CITY ?AUTO_6809 ?AUTO_6808 ) ( not ( = ?AUTO_6806 ?AUTO_6809 ) ) ( not ( = ?AUTO_6805 ?AUTO_6809 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6807 ?AUTO_6809 ?AUTO_6806 ?AUTO_6808 )
      ( DELIVER-PKG ?AUTO_6804 ?AUTO_6805 )
      ( DELIVER-PKG-VERIFY ?AUTO_6804 ?AUTO_6805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6824 - OBJ
      ?AUTO_6825 - LOCATION
    )
    :vars
    (
      ?AUTO_6829 - LOCATION
      ?AUTO_6830 - CITY
      ?AUTO_6826 - TRUCK
      ?AUTO_6828 - LOCATION
      ?AUTO_6827 - AIRPLANE
      ?AUTO_6831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6829 ?AUTO_6830 ) ( IN-CITY ?AUTO_6825 ?AUTO_6830 ) ( not ( = ?AUTO_6825 ?AUTO_6829 ) ) ( TRUCK-AT ?AUTO_6826 ?AUTO_6825 ) ( AIRPORT ?AUTO_6828 ) ( AIRPORT ?AUTO_6829 ) ( AIRPLANE-AT ?AUTO_6827 ?AUTO_6828 ) ( not ( = ?AUTO_6828 ?AUTO_6829 ) ) ( not ( = ?AUTO_6825 ?AUTO_6828 ) ) ( TRUCK-AT ?AUTO_6831 ?AUTO_6828 ) ( IN-TRUCK ?AUTO_6824 ?AUTO_6831 ) ( not ( = ?AUTO_6826 ?AUTO_6831 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6824 ?AUTO_6831 ?AUTO_6828 )
      ( DELIVER-PKG ?AUTO_6824 ?AUTO_6825 )
      ( DELIVER-PKG-VERIFY ?AUTO_6824 ?AUTO_6825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6834 - OBJ
      ?AUTO_6835 - LOCATION
    )
    :vars
    (
      ?AUTO_6843 - LOCATION
      ?AUTO_6837 - CITY
      ?AUTO_6840 - LOCATION
      ?AUTO_6845 - TRUCK
      ?AUTO_6838 - TRUCK
      ?AUTO_6844 - LOCATION
      ?AUTO_6841 - CITY
      ?AUTO_6836 - LOCATION
      ?AUTO_6839 - AIRPLANE
      ?AUTO_6842 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6843 ?AUTO_6837 ) ( IN-CITY ?AUTO_6835 ?AUTO_6837 ) ( not ( = ?AUTO_6835 ?AUTO_6843 ) ) ( AIRPORT ?AUTO_6840 ) ( AIRPORT ?AUTO_6843 ) ( not ( = ?AUTO_6840 ?AUTO_6843 ) ) ( not ( = ?AUTO_6835 ?AUTO_6840 ) ) ( not ( = ?AUTO_6845 ?AUTO_6838 ) ) ( TRUCK-AT ?AUTO_6838 ?AUTO_6844 ) ( IN-CITY ?AUTO_6844 ?AUTO_6841 ) ( IN-CITY ?AUTO_6840 ?AUTO_6841 ) ( not ( = ?AUTO_6840 ?AUTO_6844 ) ) ( not ( = ?AUTO_6835 ?AUTO_6844 ) ) ( not ( = ?AUTO_6843 ?AUTO_6844 ) ) ( not ( = ?AUTO_6837 ?AUTO_6841 ) ) ( AIRPORT ?AUTO_6836 ) ( not ( = ?AUTO_6836 ?AUTO_6840 ) ) ( not ( = ?AUTO_6835 ?AUTO_6836 ) ) ( not ( = ?AUTO_6843 ?AUTO_6836 ) ) ( not ( = ?AUTO_6844 ?AUTO_6836 ) ) ( AIRPLANE-AT ?AUTO_6839 ?AUTO_6843 ) ( IN-CITY ?AUTO_6842 ?AUTO_6837 ) ( not ( = ?AUTO_6843 ?AUTO_6842 ) ) ( not ( = ?AUTO_6835 ?AUTO_6842 ) ) ( not ( = ?AUTO_6840 ?AUTO_6842 ) ) ( not ( = ?AUTO_6844 ?AUTO_6842 ) ) ( not ( = ?AUTO_6836 ?AUTO_6842 ) ) ( TRUCK-AT ?AUTO_6845 ?AUTO_6835 ) ( OBJ-AT ?AUTO_6834 ?AUTO_6844 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6834 ?AUTO_6838 ?AUTO_6844 )
      ( DELIVER-PKG ?AUTO_6834 ?AUTO_6835 )
      ( DELIVER-PKG-VERIFY ?AUTO_6834 ?AUTO_6835 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6848 - OBJ
      ?AUTO_6849 - LOCATION
    )
    :vars
    (
      ?AUTO_6856 - LOCATION
      ?AUTO_6859 - CITY
      ?AUTO_6850 - LOCATION
      ?AUTO_6851 - TRUCK
      ?AUTO_6855 - TRUCK
      ?AUTO_6858 - LOCATION
      ?AUTO_6852 - CITY
      ?AUTO_6853 - LOCATION
      ?AUTO_6854 - AIRPLANE
      ?AUTO_6857 - LOCATION
      ?AUTO_6860 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6856 ?AUTO_6859 ) ( IN-CITY ?AUTO_6849 ?AUTO_6859 ) ( not ( = ?AUTO_6849 ?AUTO_6856 ) ) ( AIRPORT ?AUTO_6850 ) ( AIRPORT ?AUTO_6856 ) ( not ( = ?AUTO_6850 ?AUTO_6856 ) ) ( not ( = ?AUTO_6849 ?AUTO_6850 ) ) ( not ( = ?AUTO_6851 ?AUTO_6855 ) ) ( IN-CITY ?AUTO_6858 ?AUTO_6852 ) ( IN-CITY ?AUTO_6850 ?AUTO_6852 ) ( not ( = ?AUTO_6850 ?AUTO_6858 ) ) ( not ( = ?AUTO_6849 ?AUTO_6858 ) ) ( not ( = ?AUTO_6856 ?AUTO_6858 ) ) ( not ( = ?AUTO_6859 ?AUTO_6852 ) ) ( AIRPORT ?AUTO_6853 ) ( not ( = ?AUTO_6853 ?AUTO_6850 ) ) ( not ( = ?AUTO_6849 ?AUTO_6853 ) ) ( not ( = ?AUTO_6856 ?AUTO_6853 ) ) ( not ( = ?AUTO_6858 ?AUTO_6853 ) ) ( AIRPLANE-AT ?AUTO_6854 ?AUTO_6856 ) ( IN-CITY ?AUTO_6857 ?AUTO_6859 ) ( not ( = ?AUTO_6856 ?AUTO_6857 ) ) ( not ( = ?AUTO_6849 ?AUTO_6857 ) ) ( not ( = ?AUTO_6850 ?AUTO_6857 ) ) ( not ( = ?AUTO_6858 ?AUTO_6857 ) ) ( not ( = ?AUTO_6853 ?AUTO_6857 ) ) ( TRUCK-AT ?AUTO_6851 ?AUTO_6849 ) ( OBJ-AT ?AUTO_6848 ?AUTO_6858 ) ( TRUCK-AT ?AUTO_6855 ?AUTO_6860 ) ( IN-CITY ?AUTO_6860 ?AUTO_6852 ) ( not ( = ?AUTO_6858 ?AUTO_6860 ) ) ( not ( = ?AUTO_6849 ?AUTO_6860 ) ) ( not ( = ?AUTO_6856 ?AUTO_6860 ) ) ( not ( = ?AUTO_6850 ?AUTO_6860 ) ) ( not ( = ?AUTO_6853 ?AUTO_6860 ) ) ( not ( = ?AUTO_6857 ?AUTO_6860 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6855 ?AUTO_6860 ?AUTO_6858 ?AUTO_6852 )
      ( DELIVER-PKG ?AUTO_6848 ?AUTO_6849 )
      ( DELIVER-PKG-VERIFY ?AUTO_6848 ?AUTO_6849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6863 - OBJ
      ?AUTO_6864 - LOCATION
    )
    :vars
    (
      ?AUTO_6865 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6865 ?AUTO_6864 ) ( IN-TRUCK ?AUTO_6863 ?AUTO_6865 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6863 ?AUTO_6865 ?AUTO_6864 )
      ( DELIVER-PKG-VERIFY ?AUTO_6863 ?AUTO_6864 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6870 - OBJ
      ?AUTO_6871 - LOCATION
    )
    :vars
    (
      ?AUTO_6872 - TRUCK
      ?AUTO_6873 - LOCATION
      ?AUTO_6874 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6870 ?AUTO_6872 ) ( TRUCK-AT ?AUTO_6872 ?AUTO_6873 ) ( IN-CITY ?AUTO_6873 ?AUTO_6874 ) ( IN-CITY ?AUTO_6871 ?AUTO_6874 ) ( not ( = ?AUTO_6871 ?AUTO_6873 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6872 ?AUTO_6873 ?AUTO_6871 ?AUTO_6874 )
      ( DELIVER-PKG ?AUTO_6870 ?AUTO_6871 )
      ( DELIVER-PKG-VERIFY ?AUTO_6870 ?AUTO_6871 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6875 - OBJ
      ?AUTO_6876 - LOCATION
    )
    :vars
    (
      ?AUTO_6877 - TRUCK
      ?AUTO_6878 - LOCATION
      ?AUTO_6879 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6877 ?AUTO_6878 ) ( IN-CITY ?AUTO_6878 ?AUTO_6879 ) ( IN-CITY ?AUTO_6876 ?AUTO_6879 ) ( not ( = ?AUTO_6876 ?AUTO_6878 ) ) ( OBJ-AT ?AUTO_6875 ?AUTO_6878 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6875 ?AUTO_6877 ?AUTO_6878 )
      ( DELIVER-PKG ?AUTO_6875 ?AUTO_6876 )
      ( DELIVER-PKG-VERIFY ?AUTO_6875 ?AUTO_6876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6884 - OBJ
      ?AUTO_6885 - LOCATION
    )
    :vars
    (
      ?AUTO_6886 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6886 ?AUTO_6885 ) ( IN-TRUCK ?AUTO_6884 ?AUTO_6886 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6884 ?AUTO_6886 ?AUTO_6885 )
      ( DELIVER-PKG-VERIFY ?AUTO_6884 ?AUTO_6885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6889 - OBJ
      ?AUTO_6890 - LOCATION
    )
    :vars
    (
      ?AUTO_6891 - TRUCK
      ?AUTO_6892 - LOCATION
      ?AUTO_6893 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6889 ?AUTO_6891 ) ( TRUCK-AT ?AUTO_6891 ?AUTO_6892 ) ( IN-CITY ?AUTO_6892 ?AUTO_6893 ) ( IN-CITY ?AUTO_6890 ?AUTO_6893 ) ( not ( = ?AUTO_6890 ?AUTO_6892 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6891 ?AUTO_6892 ?AUTO_6890 ?AUTO_6893 )
      ( DELIVER-PKG ?AUTO_6889 ?AUTO_6890 )
      ( DELIVER-PKG-VERIFY ?AUTO_6889 ?AUTO_6890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6894 - OBJ
      ?AUTO_6895 - LOCATION
    )
    :vars
    (
      ?AUTO_6896 - TRUCK
      ?AUTO_6897 - LOCATION
      ?AUTO_6898 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6896 ?AUTO_6897 ) ( IN-CITY ?AUTO_6897 ?AUTO_6898 ) ( IN-CITY ?AUTO_6895 ?AUTO_6898 ) ( not ( = ?AUTO_6895 ?AUTO_6897 ) ) ( OBJ-AT ?AUTO_6894 ?AUTO_6897 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6894 ?AUTO_6896 ?AUTO_6897 )
      ( DELIVER-PKG ?AUTO_6894 ?AUTO_6895 )
      ( DELIVER-PKG-VERIFY ?AUTO_6894 ?AUTO_6895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6903 - OBJ
      ?AUTO_6904 - LOCATION
    )
    :vars
    (
      ?AUTO_6906 - LOCATION
      ?AUTO_6905 - CITY
      ?AUTO_6907 - TRUCK
      ?AUTO_6908 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6906 ?AUTO_6905 ) ( IN-CITY ?AUTO_6904 ?AUTO_6905 ) ( not ( = ?AUTO_6904 ?AUTO_6906 ) ) ( OBJ-AT ?AUTO_6903 ?AUTO_6906 ) ( TRUCK-AT ?AUTO_6907 ?AUTO_6908 ) ( IN-CITY ?AUTO_6908 ?AUTO_6905 ) ( not ( = ?AUTO_6906 ?AUTO_6908 ) ) ( not ( = ?AUTO_6904 ?AUTO_6908 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6907 ?AUTO_6908 ?AUTO_6906 ?AUTO_6905 )
      ( DELIVER-PKG ?AUTO_6903 ?AUTO_6904 )
      ( DELIVER-PKG-VERIFY ?AUTO_6903 ?AUTO_6904 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6911 - OBJ
      ?AUTO_6912 - LOCATION
    )
    :vars
    (
      ?AUTO_6913 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6911 ?AUTO_6913 ) ( AIRPLANE-AT ?AUTO_6913 ?AUTO_6912 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6911 ?AUTO_6913 ?AUTO_6912 )
      ( DELIVER-PKG-VERIFY ?AUTO_6911 ?AUTO_6912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6918 - OBJ
      ?AUTO_6919 - LOCATION
    )
    :vars
    (
      ?AUTO_6920 - AIRPLANE
      ?AUTO_6921 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6918 ?AUTO_6920 ) ( AIRPORT ?AUTO_6921 ) ( AIRPORT ?AUTO_6919 ) ( AIRPLANE-AT ?AUTO_6920 ?AUTO_6921 ) ( not ( = ?AUTO_6921 ?AUTO_6919 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6920 ?AUTO_6921 ?AUTO_6919 )
      ( DELIVER-PKG ?AUTO_6918 ?AUTO_6919 )
      ( DELIVER-PKG-VERIFY ?AUTO_6918 ?AUTO_6919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6922 - OBJ
      ?AUTO_6923 - LOCATION
    )
    :vars
    (
      ?AUTO_6925 - LOCATION
      ?AUTO_6924 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6925 ) ( AIRPORT ?AUTO_6923 ) ( AIRPLANE-AT ?AUTO_6924 ?AUTO_6925 ) ( not ( = ?AUTO_6925 ?AUTO_6923 ) ) ( OBJ-AT ?AUTO_6922 ?AUTO_6925 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6922 ?AUTO_6924 ?AUTO_6925 )
      ( DELIVER-PKG ?AUTO_6922 ?AUTO_6923 )
      ( DELIVER-PKG-VERIFY ?AUTO_6922 ?AUTO_6923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6926 - OBJ
      ?AUTO_6927 - LOCATION
    )
    :vars
    (
      ?AUTO_6929 - LOCATION
      ?AUTO_6928 - AIRPLANE
      ?AUTO_6930 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6929 ) ( AIRPORT ?AUTO_6927 ) ( AIRPLANE-AT ?AUTO_6928 ?AUTO_6929 ) ( not ( = ?AUTO_6929 ?AUTO_6927 ) ) ( TRUCK-AT ?AUTO_6930 ?AUTO_6929 ) ( IN-TRUCK ?AUTO_6926 ?AUTO_6930 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6926 ?AUTO_6930 ?AUTO_6929 )
      ( DELIVER-PKG ?AUTO_6926 ?AUTO_6927 )
      ( DELIVER-PKG-VERIFY ?AUTO_6926 ?AUTO_6927 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6933 - OBJ
      ?AUTO_6934 - LOCATION
    )
    :vars
    (
      ?AUTO_6937 - LOCATION
      ?AUTO_6935 - AIRPLANE
      ?AUTO_6936 - TRUCK
      ?AUTO_6938 - LOCATION
      ?AUTO_6939 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6937 ) ( AIRPORT ?AUTO_6934 ) ( AIRPLANE-AT ?AUTO_6935 ?AUTO_6937 ) ( not ( = ?AUTO_6937 ?AUTO_6934 ) ) ( IN-TRUCK ?AUTO_6933 ?AUTO_6936 ) ( TRUCK-AT ?AUTO_6936 ?AUTO_6938 ) ( IN-CITY ?AUTO_6938 ?AUTO_6939 ) ( IN-CITY ?AUTO_6937 ?AUTO_6939 ) ( not ( = ?AUTO_6937 ?AUTO_6938 ) ) ( not ( = ?AUTO_6934 ?AUTO_6938 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6936 ?AUTO_6938 ?AUTO_6937 ?AUTO_6939 )
      ( DELIVER-PKG ?AUTO_6933 ?AUTO_6934 )
      ( DELIVER-PKG-VERIFY ?AUTO_6933 ?AUTO_6934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6940 - OBJ
      ?AUTO_6941 - LOCATION
    )
    :vars
    (
      ?AUTO_6942 - LOCATION
      ?AUTO_6943 - AIRPLANE
      ?AUTO_6944 - TRUCK
      ?AUTO_6946 - LOCATION
      ?AUTO_6945 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6942 ) ( AIRPORT ?AUTO_6941 ) ( AIRPLANE-AT ?AUTO_6943 ?AUTO_6942 ) ( not ( = ?AUTO_6942 ?AUTO_6941 ) ) ( TRUCK-AT ?AUTO_6944 ?AUTO_6946 ) ( IN-CITY ?AUTO_6946 ?AUTO_6945 ) ( IN-CITY ?AUTO_6942 ?AUTO_6945 ) ( not ( = ?AUTO_6942 ?AUTO_6946 ) ) ( not ( = ?AUTO_6941 ?AUTO_6946 ) ) ( OBJ-AT ?AUTO_6940 ?AUTO_6946 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6940 ?AUTO_6944 ?AUTO_6946 )
      ( DELIVER-PKG ?AUTO_6940 ?AUTO_6941 )
      ( DELIVER-PKG-VERIFY ?AUTO_6940 ?AUTO_6941 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6951 - OBJ
      ?AUTO_6952 - LOCATION
    )
    :vars
    (
      ?AUTO_6955 - LOCATION
      ?AUTO_6953 - AIRPLANE
      ?AUTO_6956 - LOCATION
      ?AUTO_6957 - CITY
      ?AUTO_6954 - TRUCK
      ?AUTO_6958 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6955 ) ( AIRPORT ?AUTO_6952 ) ( AIRPLANE-AT ?AUTO_6953 ?AUTO_6955 ) ( not ( = ?AUTO_6955 ?AUTO_6952 ) ) ( IN-CITY ?AUTO_6956 ?AUTO_6957 ) ( IN-CITY ?AUTO_6955 ?AUTO_6957 ) ( not ( = ?AUTO_6955 ?AUTO_6956 ) ) ( not ( = ?AUTO_6952 ?AUTO_6956 ) ) ( OBJ-AT ?AUTO_6951 ?AUTO_6956 ) ( TRUCK-AT ?AUTO_6954 ?AUTO_6958 ) ( IN-CITY ?AUTO_6958 ?AUTO_6957 ) ( not ( = ?AUTO_6956 ?AUTO_6958 ) ) ( not ( = ?AUTO_6952 ?AUTO_6958 ) ) ( not ( = ?AUTO_6955 ?AUTO_6958 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6954 ?AUTO_6958 ?AUTO_6956 ?AUTO_6957 )
      ( DELIVER-PKG ?AUTO_6951 ?AUTO_6952 )
      ( DELIVER-PKG-VERIFY ?AUTO_6951 ?AUTO_6952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6961 - OBJ
      ?AUTO_6962 - LOCATION
    )
    :vars
    (
      ?AUTO_6963 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6961 ?AUTO_6963 ) ( AIRPLANE-AT ?AUTO_6963 ?AUTO_6962 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6961 ?AUTO_6963 ?AUTO_6962 )
      ( DELIVER-PKG-VERIFY ?AUTO_6961 ?AUTO_6962 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6966 - OBJ
      ?AUTO_6967 - LOCATION
    )
    :vars
    (
      ?AUTO_6968 - AIRPLANE
      ?AUTO_6969 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6966 ?AUTO_6968 ) ( AIRPORT ?AUTO_6969 ) ( AIRPORT ?AUTO_6967 ) ( AIRPLANE-AT ?AUTO_6968 ?AUTO_6969 ) ( not ( = ?AUTO_6969 ?AUTO_6967 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6968 ?AUTO_6969 ?AUTO_6967 )
      ( DELIVER-PKG ?AUTO_6966 ?AUTO_6967 )
      ( DELIVER-PKG-VERIFY ?AUTO_6966 ?AUTO_6967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6970 - OBJ
      ?AUTO_6971 - LOCATION
    )
    :vars
    (
      ?AUTO_6973 - LOCATION
      ?AUTO_6972 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6973 ) ( AIRPORT ?AUTO_6971 ) ( AIRPLANE-AT ?AUTO_6972 ?AUTO_6973 ) ( not ( = ?AUTO_6973 ?AUTO_6971 ) ) ( OBJ-AT ?AUTO_6970 ?AUTO_6973 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6970 ?AUTO_6972 ?AUTO_6973 )
      ( DELIVER-PKG ?AUTO_6970 ?AUTO_6971 )
      ( DELIVER-PKG-VERIFY ?AUTO_6970 ?AUTO_6971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6994 - OBJ
      ?AUTO_6995 - LOCATION
    )
    :vars
    (
      ?AUTO_6996 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6996 ?AUTO_6995 ) ( IN-TRUCK ?AUTO_6994 ?AUTO_6996 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6994 ?AUTO_6996 ?AUTO_6995 )
      ( DELIVER-PKG-VERIFY ?AUTO_6994 ?AUTO_6995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6997 - OBJ
      ?AUTO_6998 - LOCATION
    )
    :vars
    (
      ?AUTO_6999 - TRUCK
      ?AUTO_7000 - LOCATION
      ?AUTO_7001 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6997 ?AUTO_6999 ) ( TRUCK-AT ?AUTO_6999 ?AUTO_7000 ) ( IN-CITY ?AUTO_7000 ?AUTO_7001 ) ( IN-CITY ?AUTO_6998 ?AUTO_7001 ) ( not ( = ?AUTO_6998 ?AUTO_7000 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6999 ?AUTO_7000 ?AUTO_6998 ?AUTO_7001 )
      ( DELIVER-PKG ?AUTO_6997 ?AUTO_6998 )
      ( DELIVER-PKG-VERIFY ?AUTO_6997 ?AUTO_6998 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7002 - OBJ
      ?AUTO_7003 - LOCATION
    )
    :vars
    (
      ?AUTO_7004 - TRUCK
      ?AUTO_7005 - LOCATION
      ?AUTO_7006 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7004 ?AUTO_7005 ) ( IN-CITY ?AUTO_7005 ?AUTO_7006 ) ( IN-CITY ?AUTO_7003 ?AUTO_7006 ) ( not ( = ?AUTO_7003 ?AUTO_7005 ) ) ( OBJ-AT ?AUTO_7002 ?AUTO_7005 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7002 ?AUTO_7004 ?AUTO_7005 )
      ( DELIVER-PKG ?AUTO_7002 ?AUTO_7003 )
      ( DELIVER-PKG-VERIFY ?AUTO_7002 ?AUTO_7003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7009 - OBJ
      ?AUTO_7010 - LOCATION
    )
    :vars
    (
      ?AUTO_7011 - TRUCK
      ?AUTO_7013 - LOCATION
      ?AUTO_7012 - CITY
      ?AUTO_7014 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7011 ?AUTO_7013 ) ( IN-CITY ?AUTO_7013 ?AUTO_7012 ) ( IN-CITY ?AUTO_7010 ?AUTO_7012 ) ( not ( = ?AUTO_7010 ?AUTO_7013 ) ) ( IN-AIRPLANE ?AUTO_7009 ?AUTO_7014 ) ( AIRPLANE-AT ?AUTO_7014 ?AUTO_7013 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7009 ?AUTO_7014 ?AUTO_7013 )
      ( DELIVER-PKG ?AUTO_7009 ?AUTO_7010 )
      ( DELIVER-PKG-VERIFY ?AUTO_7009 ?AUTO_7010 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7019 - OBJ
      ?AUTO_7020 - LOCATION
    )
    :vars
    (
      ?AUTO_7023 - TRUCK
      ?AUTO_7022 - LOCATION
      ?AUTO_7024 - CITY
      ?AUTO_7021 - AIRPLANE
      ?AUTO_7025 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7023 ?AUTO_7022 ) ( IN-CITY ?AUTO_7022 ?AUTO_7024 ) ( IN-CITY ?AUTO_7020 ?AUTO_7024 ) ( not ( = ?AUTO_7020 ?AUTO_7022 ) ) ( IN-AIRPLANE ?AUTO_7019 ?AUTO_7021 ) ( AIRPORT ?AUTO_7025 ) ( AIRPORT ?AUTO_7022 ) ( AIRPLANE-AT ?AUTO_7021 ?AUTO_7025 ) ( not ( = ?AUTO_7025 ?AUTO_7022 ) ) ( not ( = ?AUTO_7020 ?AUTO_7025 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7021 ?AUTO_7025 ?AUTO_7022 )
      ( DELIVER-PKG ?AUTO_7019 ?AUTO_7020 )
      ( DELIVER-PKG-VERIFY ?AUTO_7019 ?AUTO_7020 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7026 - OBJ
      ?AUTO_7027 - LOCATION
    )
    :vars
    (
      ?AUTO_7031 - TRUCK
      ?AUTO_7029 - LOCATION
      ?AUTO_7028 - CITY
      ?AUTO_7032 - LOCATION
      ?AUTO_7030 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7031 ?AUTO_7029 ) ( IN-CITY ?AUTO_7029 ?AUTO_7028 ) ( IN-CITY ?AUTO_7027 ?AUTO_7028 ) ( not ( = ?AUTO_7027 ?AUTO_7029 ) ) ( AIRPORT ?AUTO_7032 ) ( AIRPORT ?AUTO_7029 ) ( AIRPLANE-AT ?AUTO_7030 ?AUTO_7032 ) ( not ( = ?AUTO_7032 ?AUTO_7029 ) ) ( not ( = ?AUTO_7027 ?AUTO_7032 ) ) ( OBJ-AT ?AUTO_7026 ?AUTO_7032 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7026 ?AUTO_7030 ?AUTO_7032 )
      ( DELIVER-PKG ?AUTO_7026 ?AUTO_7027 )
      ( DELIVER-PKG-VERIFY ?AUTO_7026 ?AUTO_7027 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7033 - OBJ
      ?AUTO_7034 - LOCATION
    )
    :vars
    (
      ?AUTO_7038 - TRUCK
      ?AUTO_7035 - LOCATION
      ?AUTO_7036 - CITY
      ?AUTO_7039 - LOCATION
      ?AUTO_7037 - AIRPLANE
      ?AUTO_7040 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7038 ?AUTO_7035 ) ( IN-CITY ?AUTO_7035 ?AUTO_7036 ) ( IN-CITY ?AUTO_7034 ?AUTO_7036 ) ( not ( = ?AUTO_7034 ?AUTO_7035 ) ) ( AIRPORT ?AUTO_7039 ) ( AIRPORT ?AUTO_7035 ) ( AIRPLANE-AT ?AUTO_7037 ?AUTO_7039 ) ( not ( = ?AUTO_7039 ?AUTO_7035 ) ) ( not ( = ?AUTO_7034 ?AUTO_7039 ) ) ( TRUCK-AT ?AUTO_7040 ?AUTO_7039 ) ( IN-TRUCK ?AUTO_7033 ?AUTO_7040 ) ( not ( = ?AUTO_7038 ?AUTO_7040 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7033 ?AUTO_7040 ?AUTO_7039 )
      ( DELIVER-PKG ?AUTO_7033 ?AUTO_7034 )
      ( DELIVER-PKG-VERIFY ?AUTO_7033 ?AUTO_7034 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7043 - OBJ
      ?AUTO_7044 - LOCATION
    )
    :vars
    (
      ?AUTO_7049 - TRUCK
      ?AUTO_7047 - LOCATION
      ?AUTO_7048 - CITY
      ?AUTO_7045 - LOCATION
      ?AUTO_7050 - AIRPLANE
      ?AUTO_7046 - TRUCK
      ?AUTO_7051 - LOCATION
      ?AUTO_7052 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7049 ?AUTO_7047 ) ( IN-CITY ?AUTO_7047 ?AUTO_7048 ) ( IN-CITY ?AUTO_7044 ?AUTO_7048 ) ( not ( = ?AUTO_7044 ?AUTO_7047 ) ) ( AIRPORT ?AUTO_7045 ) ( AIRPORT ?AUTO_7047 ) ( AIRPLANE-AT ?AUTO_7050 ?AUTO_7045 ) ( not ( = ?AUTO_7045 ?AUTO_7047 ) ) ( not ( = ?AUTO_7044 ?AUTO_7045 ) ) ( IN-TRUCK ?AUTO_7043 ?AUTO_7046 ) ( not ( = ?AUTO_7049 ?AUTO_7046 ) ) ( TRUCK-AT ?AUTO_7046 ?AUTO_7051 ) ( IN-CITY ?AUTO_7051 ?AUTO_7052 ) ( IN-CITY ?AUTO_7045 ?AUTO_7052 ) ( not ( = ?AUTO_7045 ?AUTO_7051 ) ) ( not ( = ?AUTO_7044 ?AUTO_7051 ) ) ( not ( = ?AUTO_7047 ?AUTO_7051 ) ) ( not ( = ?AUTO_7048 ?AUTO_7052 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7046 ?AUTO_7051 ?AUTO_7045 ?AUTO_7052 )
      ( DELIVER-PKG ?AUTO_7043 ?AUTO_7044 )
      ( DELIVER-PKG-VERIFY ?AUTO_7043 ?AUTO_7044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7053 - OBJ
      ?AUTO_7054 - LOCATION
    )
    :vars
    (
      ?AUTO_7057 - TRUCK
      ?AUTO_7060 - LOCATION
      ?AUTO_7055 - CITY
      ?AUTO_7056 - LOCATION
      ?AUTO_7058 - AIRPLANE
      ?AUTO_7059 - TRUCK
      ?AUTO_7062 - LOCATION
      ?AUTO_7061 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7057 ?AUTO_7060 ) ( IN-CITY ?AUTO_7060 ?AUTO_7055 ) ( IN-CITY ?AUTO_7054 ?AUTO_7055 ) ( not ( = ?AUTO_7054 ?AUTO_7060 ) ) ( AIRPORT ?AUTO_7056 ) ( AIRPORT ?AUTO_7060 ) ( AIRPLANE-AT ?AUTO_7058 ?AUTO_7056 ) ( not ( = ?AUTO_7056 ?AUTO_7060 ) ) ( not ( = ?AUTO_7054 ?AUTO_7056 ) ) ( not ( = ?AUTO_7057 ?AUTO_7059 ) ) ( TRUCK-AT ?AUTO_7059 ?AUTO_7062 ) ( IN-CITY ?AUTO_7062 ?AUTO_7061 ) ( IN-CITY ?AUTO_7056 ?AUTO_7061 ) ( not ( = ?AUTO_7056 ?AUTO_7062 ) ) ( not ( = ?AUTO_7054 ?AUTO_7062 ) ) ( not ( = ?AUTO_7060 ?AUTO_7062 ) ) ( not ( = ?AUTO_7055 ?AUTO_7061 ) ) ( OBJ-AT ?AUTO_7053 ?AUTO_7062 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7053 ?AUTO_7059 ?AUTO_7062 )
      ( DELIVER-PKG ?AUTO_7053 ?AUTO_7054 )
      ( DELIVER-PKG-VERIFY ?AUTO_7053 ?AUTO_7054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7067 - OBJ
      ?AUTO_7068 - LOCATION
    )
    :vars
    (
      ?AUTO_7070 - TRUCK
      ?AUTO_7069 - LOCATION
      ?AUTO_7071 - CITY
      ?AUTO_7073 - LOCATION
      ?AUTO_7072 - AIRPLANE
      ?AUTO_7074 - TRUCK
      ?AUTO_7076 - LOCATION
      ?AUTO_7075 - CITY
      ?AUTO_7077 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7070 ?AUTO_7069 ) ( IN-CITY ?AUTO_7069 ?AUTO_7071 ) ( IN-CITY ?AUTO_7068 ?AUTO_7071 ) ( not ( = ?AUTO_7068 ?AUTO_7069 ) ) ( AIRPORT ?AUTO_7073 ) ( AIRPORT ?AUTO_7069 ) ( AIRPLANE-AT ?AUTO_7072 ?AUTO_7073 ) ( not ( = ?AUTO_7073 ?AUTO_7069 ) ) ( not ( = ?AUTO_7068 ?AUTO_7073 ) ) ( not ( = ?AUTO_7070 ?AUTO_7074 ) ) ( IN-CITY ?AUTO_7076 ?AUTO_7075 ) ( IN-CITY ?AUTO_7073 ?AUTO_7075 ) ( not ( = ?AUTO_7073 ?AUTO_7076 ) ) ( not ( = ?AUTO_7068 ?AUTO_7076 ) ) ( not ( = ?AUTO_7069 ?AUTO_7076 ) ) ( not ( = ?AUTO_7071 ?AUTO_7075 ) ) ( OBJ-AT ?AUTO_7067 ?AUTO_7076 ) ( TRUCK-AT ?AUTO_7074 ?AUTO_7077 ) ( IN-CITY ?AUTO_7077 ?AUTO_7075 ) ( not ( = ?AUTO_7076 ?AUTO_7077 ) ) ( not ( = ?AUTO_7068 ?AUTO_7077 ) ) ( not ( = ?AUTO_7069 ?AUTO_7077 ) ) ( not ( = ?AUTO_7073 ?AUTO_7077 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7074 ?AUTO_7077 ?AUTO_7076 ?AUTO_7075 )
      ( DELIVER-PKG ?AUTO_7067 ?AUTO_7068 )
      ( DELIVER-PKG-VERIFY ?AUTO_7067 ?AUTO_7068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7080 - OBJ
      ?AUTO_7081 - LOCATION
    )
    :vars
    (
      ?AUTO_7082 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7082 ?AUTO_7081 ) ( IN-TRUCK ?AUTO_7080 ?AUTO_7082 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7080 ?AUTO_7082 ?AUTO_7081 )
      ( DELIVER-PKG-VERIFY ?AUTO_7080 ?AUTO_7081 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7083 - OBJ
      ?AUTO_7084 - LOCATION
    )
    :vars
    (
      ?AUTO_7085 - TRUCK
      ?AUTO_7086 - LOCATION
      ?AUTO_7087 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7083 ?AUTO_7085 ) ( TRUCK-AT ?AUTO_7085 ?AUTO_7086 ) ( IN-CITY ?AUTO_7086 ?AUTO_7087 ) ( IN-CITY ?AUTO_7084 ?AUTO_7087 ) ( not ( = ?AUTO_7084 ?AUTO_7086 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7085 ?AUTO_7086 ?AUTO_7084 ?AUTO_7087 )
      ( DELIVER-PKG ?AUTO_7083 ?AUTO_7084 )
      ( DELIVER-PKG-VERIFY ?AUTO_7083 ?AUTO_7084 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7088 - OBJ
      ?AUTO_7089 - LOCATION
    )
    :vars
    (
      ?AUTO_7090 - TRUCK
      ?AUTO_7091 - LOCATION
      ?AUTO_7092 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7090 ?AUTO_7091 ) ( IN-CITY ?AUTO_7091 ?AUTO_7092 ) ( IN-CITY ?AUTO_7089 ?AUTO_7092 ) ( not ( = ?AUTO_7089 ?AUTO_7091 ) ) ( OBJ-AT ?AUTO_7088 ?AUTO_7091 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7088 ?AUTO_7090 ?AUTO_7091 )
      ( DELIVER-PKG ?AUTO_7088 ?AUTO_7089 )
      ( DELIVER-PKG-VERIFY ?AUTO_7088 ?AUTO_7089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7093 - OBJ
      ?AUTO_7094 - LOCATION
    )
    :vars
    (
      ?AUTO_7095 - LOCATION
      ?AUTO_7097 - CITY
      ?AUTO_7096 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7095 ?AUTO_7097 ) ( IN-CITY ?AUTO_7094 ?AUTO_7097 ) ( not ( = ?AUTO_7094 ?AUTO_7095 ) ) ( OBJ-AT ?AUTO_7093 ?AUTO_7095 ) ( TRUCK-AT ?AUTO_7096 ?AUTO_7094 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7096 ?AUTO_7094 ?AUTO_7095 ?AUTO_7097 )
      ( DELIVER-PKG ?AUTO_7093 ?AUTO_7094 )
      ( DELIVER-PKG-VERIFY ?AUTO_7093 ?AUTO_7094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7132 - OBJ
      ?AUTO_7133 - LOCATION
    )
    :vars
    (
      ?AUTO_7134 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7134 ?AUTO_7133 ) ( IN-TRUCK ?AUTO_7132 ?AUTO_7134 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7132 ?AUTO_7134 ?AUTO_7133 )
      ( DELIVER-PKG-VERIFY ?AUTO_7132 ?AUTO_7133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7135 - OBJ
      ?AUTO_7136 - LOCATION
    )
    :vars
    (
      ?AUTO_7137 - TRUCK
      ?AUTO_7138 - LOCATION
      ?AUTO_7139 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7135 ?AUTO_7137 ) ( TRUCK-AT ?AUTO_7137 ?AUTO_7138 ) ( IN-CITY ?AUTO_7138 ?AUTO_7139 ) ( IN-CITY ?AUTO_7136 ?AUTO_7139 ) ( not ( = ?AUTO_7136 ?AUTO_7138 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7137 ?AUTO_7138 ?AUTO_7136 ?AUTO_7139 )
      ( DELIVER-PKG ?AUTO_7135 ?AUTO_7136 )
      ( DELIVER-PKG-VERIFY ?AUTO_7135 ?AUTO_7136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7140 - OBJ
      ?AUTO_7141 - LOCATION
    )
    :vars
    (
      ?AUTO_7142 - TRUCK
      ?AUTO_7143 - LOCATION
      ?AUTO_7144 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7142 ?AUTO_7143 ) ( IN-CITY ?AUTO_7143 ?AUTO_7144 ) ( IN-CITY ?AUTO_7141 ?AUTO_7144 ) ( not ( = ?AUTO_7141 ?AUTO_7143 ) ) ( OBJ-AT ?AUTO_7140 ?AUTO_7143 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7140 ?AUTO_7142 ?AUTO_7143 )
      ( DELIVER-PKG ?AUTO_7140 ?AUTO_7141 )
      ( DELIVER-PKG-VERIFY ?AUTO_7140 ?AUTO_7141 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7145 - OBJ
      ?AUTO_7146 - LOCATION
    )
    :vars
    (
      ?AUTO_7147 - LOCATION
      ?AUTO_7149 - CITY
      ?AUTO_7148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7147 ?AUTO_7149 ) ( IN-CITY ?AUTO_7146 ?AUTO_7149 ) ( not ( = ?AUTO_7146 ?AUTO_7147 ) ) ( OBJ-AT ?AUTO_7145 ?AUTO_7147 ) ( TRUCK-AT ?AUTO_7148 ?AUTO_7146 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7148 ?AUTO_7146 ?AUTO_7147 ?AUTO_7149 )
      ( DELIVER-PKG ?AUTO_7145 ?AUTO_7146 )
      ( DELIVER-PKG-VERIFY ?AUTO_7145 ?AUTO_7146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7164 - OBJ
      ?AUTO_7165 - LOCATION
    )
    :vars
    (
      ?AUTO_7166 - LOCATION
      ?AUTO_7168 - CITY
      ?AUTO_7167 - TRUCK
      ?AUTO_7169 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7166 ?AUTO_7168 ) ( IN-CITY ?AUTO_7165 ?AUTO_7168 ) ( not ( = ?AUTO_7165 ?AUTO_7166 ) ) ( TRUCK-AT ?AUTO_7167 ?AUTO_7165 ) ( IN-AIRPLANE ?AUTO_7164 ?AUTO_7169 ) ( AIRPLANE-AT ?AUTO_7169 ?AUTO_7166 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7164 ?AUTO_7169 ?AUTO_7166 )
      ( DELIVER-PKG ?AUTO_7164 ?AUTO_7165 )
      ( DELIVER-PKG-VERIFY ?AUTO_7164 ?AUTO_7165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7172 - OBJ
      ?AUTO_7173 - LOCATION
    )
    :vars
    (
      ?AUTO_7176 - LOCATION
      ?AUTO_7177 - CITY
      ?AUTO_7174 - TRUCK
      ?AUTO_7175 - AIRPLANE
      ?AUTO_7178 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7176 ?AUTO_7177 ) ( IN-CITY ?AUTO_7173 ?AUTO_7177 ) ( not ( = ?AUTO_7173 ?AUTO_7176 ) ) ( TRUCK-AT ?AUTO_7174 ?AUTO_7173 ) ( IN-AIRPLANE ?AUTO_7172 ?AUTO_7175 ) ( AIRPORT ?AUTO_7178 ) ( AIRPORT ?AUTO_7176 ) ( AIRPLANE-AT ?AUTO_7175 ?AUTO_7178 ) ( not ( = ?AUTO_7178 ?AUTO_7176 ) ) ( not ( = ?AUTO_7173 ?AUTO_7178 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7175 ?AUTO_7178 ?AUTO_7176 )
      ( DELIVER-PKG ?AUTO_7172 ?AUTO_7173 )
      ( DELIVER-PKG-VERIFY ?AUTO_7172 ?AUTO_7173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7179 - OBJ
      ?AUTO_7180 - LOCATION
    )
    :vars
    (
      ?AUTO_7185 - LOCATION
      ?AUTO_7184 - CITY
      ?AUTO_7182 - TRUCK
      ?AUTO_7181 - LOCATION
      ?AUTO_7183 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7185 ?AUTO_7184 ) ( IN-CITY ?AUTO_7180 ?AUTO_7184 ) ( not ( = ?AUTO_7180 ?AUTO_7185 ) ) ( TRUCK-AT ?AUTO_7182 ?AUTO_7180 ) ( AIRPORT ?AUTO_7181 ) ( AIRPORT ?AUTO_7185 ) ( AIRPLANE-AT ?AUTO_7183 ?AUTO_7181 ) ( not ( = ?AUTO_7181 ?AUTO_7185 ) ) ( not ( = ?AUTO_7180 ?AUTO_7181 ) ) ( OBJ-AT ?AUTO_7179 ?AUTO_7181 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7179 ?AUTO_7183 ?AUTO_7181 )
      ( DELIVER-PKG ?AUTO_7179 ?AUTO_7180 )
      ( DELIVER-PKG-VERIFY ?AUTO_7179 ?AUTO_7180 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7206 - OBJ
      ?AUTO_7207 - LOCATION
    )
    :vars
    (
      ?AUTO_7208 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7206 ?AUTO_7208 ) ( AIRPLANE-AT ?AUTO_7208 ?AUTO_7207 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7206 ?AUTO_7208 ?AUTO_7207 )
      ( DELIVER-PKG-VERIFY ?AUTO_7206 ?AUTO_7207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7213 - OBJ
      ?AUTO_7214 - LOCATION
    )
    :vars
    (
      ?AUTO_7215 - AIRPLANE
      ?AUTO_7216 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7213 ?AUTO_7215 ) ( AIRPORT ?AUTO_7216 ) ( AIRPORT ?AUTO_7214 ) ( AIRPLANE-AT ?AUTO_7215 ?AUTO_7216 ) ( not ( = ?AUTO_7216 ?AUTO_7214 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7215 ?AUTO_7216 ?AUTO_7214 )
      ( DELIVER-PKG ?AUTO_7213 ?AUTO_7214 )
      ( DELIVER-PKG-VERIFY ?AUTO_7213 ?AUTO_7214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7217 - OBJ
      ?AUTO_7218 - LOCATION
    )
    :vars
    (
      ?AUTO_7220 - LOCATION
      ?AUTO_7219 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7220 ) ( AIRPORT ?AUTO_7218 ) ( AIRPLANE-AT ?AUTO_7219 ?AUTO_7220 ) ( not ( = ?AUTO_7220 ?AUTO_7218 ) ) ( OBJ-AT ?AUTO_7217 ?AUTO_7220 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7217 ?AUTO_7219 ?AUTO_7220 )
      ( DELIVER-PKG ?AUTO_7217 ?AUTO_7218 )
      ( DELIVER-PKG-VERIFY ?AUTO_7217 ?AUTO_7218 ) )
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
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7226 ) ( AIRPORT ?AUTO_7224 ) ( not ( = ?AUTO_7226 ?AUTO_7224 ) ) ( OBJ-AT ?AUTO_7223 ?AUTO_7226 ) ( AIRPLANE-AT ?AUTO_7225 ?AUTO_7224 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7225 ?AUTO_7224 ?AUTO_7226 )
      ( DELIVER-PKG ?AUTO_7223 ?AUTO_7224 )
      ( DELIVER-PKG-VERIFY ?AUTO_7223 ?AUTO_7224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7263 - OBJ
      ?AUTO_7264 - LOCATION
    )
    :vars
    (
      ?AUTO_7266 - LOCATION
      ?AUTO_7265 - AIRPLANE
      ?AUTO_7267 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7266 ) ( AIRPORT ?AUTO_7264 ) ( not ( = ?AUTO_7266 ?AUTO_7264 ) ) ( AIRPLANE-AT ?AUTO_7265 ?AUTO_7264 ) ( TRUCK-AT ?AUTO_7267 ?AUTO_7266 ) ( IN-TRUCK ?AUTO_7263 ?AUTO_7267 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7263 ?AUTO_7267 ?AUTO_7266 )
      ( DELIVER-PKG ?AUTO_7263 ?AUTO_7264 )
      ( DELIVER-PKG-VERIFY ?AUTO_7263 ?AUTO_7264 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7272 - OBJ
      ?AUTO_7273 - LOCATION
    )
    :vars
    (
      ?AUTO_7274 - LOCATION
      ?AUTO_7275 - AIRPLANE
      ?AUTO_7276 - TRUCK
      ?AUTO_7277 - LOCATION
      ?AUTO_7278 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7274 ) ( AIRPORT ?AUTO_7273 ) ( not ( = ?AUTO_7274 ?AUTO_7273 ) ) ( AIRPLANE-AT ?AUTO_7275 ?AUTO_7273 ) ( IN-TRUCK ?AUTO_7272 ?AUTO_7276 ) ( TRUCK-AT ?AUTO_7276 ?AUTO_7277 ) ( IN-CITY ?AUTO_7277 ?AUTO_7278 ) ( IN-CITY ?AUTO_7274 ?AUTO_7278 ) ( not ( = ?AUTO_7274 ?AUTO_7277 ) ) ( not ( = ?AUTO_7273 ?AUTO_7277 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7276 ?AUTO_7277 ?AUTO_7274 ?AUTO_7278 )
      ( DELIVER-PKG ?AUTO_7272 ?AUTO_7273 )
      ( DELIVER-PKG-VERIFY ?AUTO_7272 ?AUTO_7273 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7279 - OBJ
      ?AUTO_7280 - LOCATION
    )
    :vars
    (
      ?AUTO_7281 - LOCATION
      ?AUTO_7282 - AIRPLANE
      ?AUTO_7285 - TRUCK
      ?AUTO_7284 - LOCATION
      ?AUTO_7283 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7281 ) ( AIRPORT ?AUTO_7280 ) ( not ( = ?AUTO_7281 ?AUTO_7280 ) ) ( AIRPLANE-AT ?AUTO_7282 ?AUTO_7280 ) ( TRUCK-AT ?AUTO_7285 ?AUTO_7284 ) ( IN-CITY ?AUTO_7284 ?AUTO_7283 ) ( IN-CITY ?AUTO_7281 ?AUTO_7283 ) ( not ( = ?AUTO_7281 ?AUTO_7284 ) ) ( not ( = ?AUTO_7280 ?AUTO_7284 ) ) ( OBJ-AT ?AUTO_7279 ?AUTO_7284 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7279 ?AUTO_7285 ?AUTO_7284 )
      ( DELIVER-PKG ?AUTO_7279 ?AUTO_7280 )
      ( DELIVER-PKG-VERIFY ?AUTO_7279 ?AUTO_7280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7290 - OBJ
      ?AUTO_7291 - LOCATION
    )
    :vars
    (
      ?AUTO_7292 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7290 ?AUTO_7292 ) ( AIRPLANE-AT ?AUTO_7292 ?AUTO_7291 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7290 ?AUTO_7292 ?AUTO_7291 )
      ( DELIVER-PKG-VERIFY ?AUTO_7290 ?AUTO_7291 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7295 - OBJ
      ?AUTO_7296 - LOCATION
    )
    :vars
    (
      ?AUTO_7297 - AIRPLANE
      ?AUTO_7298 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7295 ?AUTO_7297 ) ( AIRPORT ?AUTO_7298 ) ( AIRPORT ?AUTO_7296 ) ( AIRPLANE-AT ?AUTO_7297 ?AUTO_7298 ) ( not ( = ?AUTO_7298 ?AUTO_7296 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7297 ?AUTO_7298 ?AUTO_7296 )
      ( DELIVER-PKG ?AUTO_7295 ?AUTO_7296 )
      ( DELIVER-PKG-VERIFY ?AUTO_7295 ?AUTO_7296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7299 - OBJ
      ?AUTO_7300 - LOCATION
    )
    :vars
    (
      ?AUTO_7302 - LOCATION
      ?AUTO_7301 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7302 ) ( AIRPORT ?AUTO_7300 ) ( AIRPLANE-AT ?AUTO_7301 ?AUTO_7302 ) ( not ( = ?AUTO_7302 ?AUTO_7300 ) ) ( OBJ-AT ?AUTO_7299 ?AUTO_7302 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7299 ?AUTO_7301 ?AUTO_7302 )
      ( DELIVER-PKG ?AUTO_7299 ?AUTO_7300 )
      ( DELIVER-PKG-VERIFY ?AUTO_7299 ?AUTO_7300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7307 - OBJ
      ?AUTO_7308 - LOCATION
    )
    :vars
    (
      ?AUTO_7310 - LOCATION
      ?AUTO_7311 - LOCATION
      ?AUTO_7309 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7310 ) ( AIRPORT ?AUTO_7308 ) ( not ( = ?AUTO_7310 ?AUTO_7308 ) ) ( OBJ-AT ?AUTO_7307 ?AUTO_7310 ) ( AIRPORT ?AUTO_7311 ) ( AIRPLANE-AT ?AUTO_7309 ?AUTO_7311 ) ( not ( = ?AUTO_7311 ?AUTO_7310 ) ) ( not ( = ?AUTO_7308 ?AUTO_7311 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7309 ?AUTO_7311 ?AUTO_7310 )
      ( DELIVER-PKG ?AUTO_7307 ?AUTO_7308 )
      ( DELIVER-PKG-VERIFY ?AUTO_7307 ?AUTO_7308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7322 - OBJ
      ?AUTO_7323 - LOCATION
    )
    :vars
    (
      ?AUTO_7325 - LOCATION
      ?AUTO_7326 - LOCATION
      ?AUTO_7324 - AIRPLANE
      ?AUTO_7327 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7325 ) ( AIRPORT ?AUTO_7323 ) ( not ( = ?AUTO_7325 ?AUTO_7323 ) ) ( AIRPORT ?AUTO_7326 ) ( AIRPLANE-AT ?AUTO_7324 ?AUTO_7326 ) ( not ( = ?AUTO_7326 ?AUTO_7325 ) ) ( not ( = ?AUTO_7323 ?AUTO_7326 ) ) ( TRUCK-AT ?AUTO_7327 ?AUTO_7325 ) ( IN-TRUCK ?AUTO_7322 ?AUTO_7327 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7322 ?AUTO_7327 ?AUTO_7325 )
      ( DELIVER-PKG ?AUTO_7322 ?AUTO_7323 )
      ( DELIVER-PKG-VERIFY ?AUTO_7322 ?AUTO_7323 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7328 - OBJ
      ?AUTO_7329 - LOCATION
    )
    :vars
    (
      ?AUTO_7330 - LOCATION
      ?AUTO_7331 - LOCATION
      ?AUTO_7332 - AIRPLANE
      ?AUTO_7333 - TRUCK
      ?AUTO_7334 - LOCATION
      ?AUTO_7335 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7330 ) ( AIRPORT ?AUTO_7329 ) ( not ( = ?AUTO_7330 ?AUTO_7329 ) ) ( AIRPORT ?AUTO_7331 ) ( AIRPLANE-AT ?AUTO_7332 ?AUTO_7331 ) ( not ( = ?AUTO_7331 ?AUTO_7330 ) ) ( not ( = ?AUTO_7329 ?AUTO_7331 ) ) ( IN-TRUCK ?AUTO_7328 ?AUTO_7333 ) ( TRUCK-AT ?AUTO_7333 ?AUTO_7334 ) ( IN-CITY ?AUTO_7334 ?AUTO_7335 ) ( IN-CITY ?AUTO_7330 ?AUTO_7335 ) ( not ( = ?AUTO_7330 ?AUTO_7334 ) ) ( not ( = ?AUTO_7329 ?AUTO_7334 ) ) ( not ( = ?AUTO_7331 ?AUTO_7334 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7333 ?AUTO_7334 ?AUTO_7330 ?AUTO_7335 )
      ( DELIVER-PKG ?AUTO_7328 ?AUTO_7329 )
      ( DELIVER-PKG-VERIFY ?AUTO_7328 ?AUTO_7329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7336 - OBJ
      ?AUTO_7337 - LOCATION
    )
    :vars
    (
      ?AUTO_7339 - LOCATION
      ?AUTO_7338 - LOCATION
      ?AUTO_7343 - AIRPLANE
      ?AUTO_7342 - TRUCK
      ?AUTO_7340 - LOCATION
      ?AUTO_7341 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7339 ) ( AIRPORT ?AUTO_7337 ) ( not ( = ?AUTO_7339 ?AUTO_7337 ) ) ( AIRPORT ?AUTO_7338 ) ( AIRPLANE-AT ?AUTO_7343 ?AUTO_7338 ) ( not ( = ?AUTO_7338 ?AUTO_7339 ) ) ( not ( = ?AUTO_7337 ?AUTO_7338 ) ) ( TRUCK-AT ?AUTO_7342 ?AUTO_7340 ) ( IN-CITY ?AUTO_7340 ?AUTO_7341 ) ( IN-CITY ?AUTO_7339 ?AUTO_7341 ) ( not ( = ?AUTO_7339 ?AUTO_7340 ) ) ( not ( = ?AUTO_7337 ?AUTO_7340 ) ) ( not ( = ?AUTO_7338 ?AUTO_7340 ) ) ( OBJ-AT ?AUTO_7336 ?AUTO_7340 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7336 ?AUTO_7342 ?AUTO_7340 )
      ( DELIVER-PKG ?AUTO_7336 ?AUTO_7337 )
      ( DELIVER-PKG-VERIFY ?AUTO_7336 ?AUTO_7337 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7344 - OBJ
      ?AUTO_7345 - LOCATION
    )
    :vars
    (
      ?AUTO_7350 - LOCATION
      ?AUTO_7346 - LOCATION
      ?AUTO_7347 - AIRPLANE
      ?AUTO_7351 - LOCATION
      ?AUTO_7348 - CITY
      ?AUTO_7349 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7350 ) ( AIRPORT ?AUTO_7345 ) ( not ( = ?AUTO_7350 ?AUTO_7345 ) ) ( AIRPORT ?AUTO_7346 ) ( AIRPLANE-AT ?AUTO_7347 ?AUTO_7346 ) ( not ( = ?AUTO_7346 ?AUTO_7350 ) ) ( not ( = ?AUTO_7345 ?AUTO_7346 ) ) ( IN-CITY ?AUTO_7351 ?AUTO_7348 ) ( IN-CITY ?AUTO_7350 ?AUTO_7348 ) ( not ( = ?AUTO_7350 ?AUTO_7351 ) ) ( not ( = ?AUTO_7345 ?AUTO_7351 ) ) ( not ( = ?AUTO_7346 ?AUTO_7351 ) ) ( OBJ-AT ?AUTO_7344 ?AUTO_7351 ) ( TRUCK-AT ?AUTO_7349 ?AUTO_7350 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7349 ?AUTO_7350 ?AUTO_7351 ?AUTO_7348 )
      ( DELIVER-PKG ?AUTO_7344 ?AUTO_7345 )
      ( DELIVER-PKG-VERIFY ?AUTO_7344 ?AUTO_7345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7386 - OBJ
      ?AUTO_7387 - LOCATION
    )
    :vars
    (
      ?AUTO_7388 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7388 ?AUTO_7387 ) ( IN-TRUCK ?AUTO_7386 ?AUTO_7388 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7386 ?AUTO_7388 ?AUTO_7387 )
      ( DELIVER-PKG-VERIFY ?AUTO_7386 ?AUTO_7387 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7389 - OBJ
      ?AUTO_7390 - LOCATION
    )
    :vars
    (
      ?AUTO_7391 - TRUCK
      ?AUTO_7392 - LOCATION
      ?AUTO_7393 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7389 ?AUTO_7391 ) ( TRUCK-AT ?AUTO_7391 ?AUTO_7392 ) ( IN-CITY ?AUTO_7392 ?AUTO_7393 ) ( IN-CITY ?AUTO_7390 ?AUTO_7393 ) ( not ( = ?AUTO_7390 ?AUTO_7392 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7391 ?AUTO_7392 ?AUTO_7390 ?AUTO_7393 )
      ( DELIVER-PKG ?AUTO_7389 ?AUTO_7390 )
      ( DELIVER-PKG-VERIFY ?AUTO_7389 ?AUTO_7390 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7396 - OBJ
      ?AUTO_7397 - LOCATION
    )
    :vars
    (
      ?AUTO_7398 - TRUCK
      ?AUTO_7400 - LOCATION
      ?AUTO_7399 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7398 ?AUTO_7400 ) ( IN-CITY ?AUTO_7400 ?AUTO_7399 ) ( IN-CITY ?AUTO_7397 ?AUTO_7399 ) ( not ( = ?AUTO_7397 ?AUTO_7400 ) ) ( OBJ-AT ?AUTO_7396 ?AUTO_7400 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7396 ?AUTO_7398 ?AUTO_7400 )
      ( DELIVER-PKG ?AUTO_7396 ?AUTO_7397 )
      ( DELIVER-PKG-VERIFY ?AUTO_7396 ?AUTO_7397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7401 - OBJ
      ?AUTO_7402 - LOCATION
    )
    :vars
    (
      ?AUTO_7404 - LOCATION
      ?AUTO_7405 - CITY
      ?AUTO_7403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7404 ?AUTO_7405 ) ( IN-CITY ?AUTO_7402 ?AUTO_7405 ) ( not ( = ?AUTO_7402 ?AUTO_7404 ) ) ( OBJ-AT ?AUTO_7401 ?AUTO_7404 ) ( TRUCK-AT ?AUTO_7403 ?AUTO_7402 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7403 ?AUTO_7402 ?AUTO_7404 ?AUTO_7405 )
      ( DELIVER-PKG ?AUTO_7401 ?AUTO_7402 )
      ( DELIVER-PKG-VERIFY ?AUTO_7401 ?AUTO_7402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7408 - OBJ
      ?AUTO_7409 - LOCATION
    )
    :vars
    (
      ?AUTO_7411 - LOCATION
      ?AUTO_7412 - CITY
      ?AUTO_7410 - TRUCK
      ?AUTO_7413 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7411 ?AUTO_7412 ) ( IN-CITY ?AUTO_7409 ?AUTO_7412 ) ( not ( = ?AUTO_7409 ?AUTO_7411 ) ) ( TRUCK-AT ?AUTO_7410 ?AUTO_7409 ) ( IN-AIRPLANE ?AUTO_7408 ?AUTO_7413 ) ( AIRPLANE-AT ?AUTO_7413 ?AUTO_7411 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7408 ?AUTO_7413 ?AUTO_7411 )
      ( DELIVER-PKG ?AUTO_7408 ?AUTO_7409 )
      ( DELIVER-PKG-VERIFY ?AUTO_7408 ?AUTO_7409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7418 - OBJ
      ?AUTO_7419 - LOCATION
    )
    :vars
    (
      ?AUTO_7423 - LOCATION
      ?AUTO_7422 - CITY
      ?AUTO_7420 - TRUCK
      ?AUTO_7421 - AIRPLANE
      ?AUTO_7424 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7423 ?AUTO_7422 ) ( IN-CITY ?AUTO_7419 ?AUTO_7422 ) ( not ( = ?AUTO_7419 ?AUTO_7423 ) ) ( TRUCK-AT ?AUTO_7420 ?AUTO_7419 ) ( IN-AIRPLANE ?AUTO_7418 ?AUTO_7421 ) ( AIRPORT ?AUTO_7424 ) ( AIRPORT ?AUTO_7423 ) ( AIRPLANE-AT ?AUTO_7421 ?AUTO_7424 ) ( not ( = ?AUTO_7424 ?AUTO_7423 ) ) ( not ( = ?AUTO_7419 ?AUTO_7424 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7421 ?AUTO_7424 ?AUTO_7423 )
      ( DELIVER-PKG ?AUTO_7418 ?AUTO_7419 )
      ( DELIVER-PKG-VERIFY ?AUTO_7418 ?AUTO_7419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7425 - OBJ
      ?AUTO_7426 - LOCATION
    )
    :vars
    (
      ?AUTO_7427 - LOCATION
      ?AUTO_7430 - CITY
      ?AUTO_7428 - TRUCK
      ?AUTO_7431 - LOCATION
      ?AUTO_7429 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7427 ?AUTO_7430 ) ( IN-CITY ?AUTO_7426 ?AUTO_7430 ) ( not ( = ?AUTO_7426 ?AUTO_7427 ) ) ( TRUCK-AT ?AUTO_7428 ?AUTO_7426 ) ( AIRPORT ?AUTO_7431 ) ( AIRPORT ?AUTO_7427 ) ( AIRPLANE-AT ?AUTO_7429 ?AUTO_7431 ) ( not ( = ?AUTO_7431 ?AUTO_7427 ) ) ( not ( = ?AUTO_7426 ?AUTO_7431 ) ) ( OBJ-AT ?AUTO_7425 ?AUTO_7431 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7425 ?AUTO_7429 ?AUTO_7431 )
      ( DELIVER-PKG ?AUTO_7425 ?AUTO_7426 )
      ( DELIVER-PKG-VERIFY ?AUTO_7425 ?AUTO_7426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7434 - OBJ
      ?AUTO_7435 - LOCATION
    )
    :vars
    (
      ?AUTO_7440 - LOCATION
      ?AUTO_7437 - CITY
      ?AUTO_7438 - TRUCK
      ?AUTO_7439 - LOCATION
      ?AUTO_7441 - LOCATION
      ?AUTO_7436 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7440 ?AUTO_7437 ) ( IN-CITY ?AUTO_7435 ?AUTO_7437 ) ( not ( = ?AUTO_7435 ?AUTO_7440 ) ) ( TRUCK-AT ?AUTO_7438 ?AUTO_7435 ) ( AIRPORT ?AUTO_7439 ) ( AIRPORT ?AUTO_7440 ) ( not ( = ?AUTO_7439 ?AUTO_7440 ) ) ( not ( = ?AUTO_7435 ?AUTO_7439 ) ) ( OBJ-AT ?AUTO_7434 ?AUTO_7439 ) ( AIRPORT ?AUTO_7441 ) ( AIRPLANE-AT ?AUTO_7436 ?AUTO_7441 ) ( not ( = ?AUTO_7441 ?AUTO_7439 ) ) ( not ( = ?AUTO_7435 ?AUTO_7441 ) ) ( not ( = ?AUTO_7440 ?AUTO_7441 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7436 ?AUTO_7441 ?AUTO_7439 )
      ( DELIVER-PKG ?AUTO_7434 ?AUTO_7435 )
      ( DELIVER-PKG-VERIFY ?AUTO_7434 ?AUTO_7435 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7478 - OBJ
      ?AUTO_7479 - LOCATION
    )
    :vars
    (
      ?AUTO_7482 - LOCATION
      ?AUTO_7484 - CITY
      ?AUTO_7483 - TRUCK
      ?AUTO_7480 - LOCATION
      ?AUTO_7481 - LOCATION
      ?AUTO_7485 - AIRPLANE
      ?AUTO_7486 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7482 ?AUTO_7484 ) ( IN-CITY ?AUTO_7479 ?AUTO_7484 ) ( not ( = ?AUTO_7479 ?AUTO_7482 ) ) ( TRUCK-AT ?AUTO_7483 ?AUTO_7479 ) ( AIRPORT ?AUTO_7480 ) ( AIRPORT ?AUTO_7482 ) ( not ( = ?AUTO_7480 ?AUTO_7482 ) ) ( not ( = ?AUTO_7479 ?AUTO_7480 ) ) ( AIRPORT ?AUTO_7481 ) ( AIRPLANE-AT ?AUTO_7485 ?AUTO_7481 ) ( not ( = ?AUTO_7481 ?AUTO_7480 ) ) ( not ( = ?AUTO_7479 ?AUTO_7481 ) ) ( not ( = ?AUTO_7482 ?AUTO_7481 ) ) ( TRUCK-AT ?AUTO_7486 ?AUTO_7480 ) ( IN-TRUCK ?AUTO_7478 ?AUTO_7486 ) ( not ( = ?AUTO_7483 ?AUTO_7486 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7478 ?AUTO_7486 ?AUTO_7480 )
      ( DELIVER-PKG ?AUTO_7478 ?AUTO_7479 )
      ( DELIVER-PKG-VERIFY ?AUTO_7478 ?AUTO_7479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7491 - OBJ
      ?AUTO_7492 - LOCATION
    )
    :vars
    (
      ?AUTO_7494 - LOCATION
      ?AUTO_7495 - CITY
      ?AUTO_7498 - TRUCK
      ?AUTO_7496 - LOCATION
      ?AUTO_7499 - LOCATION
      ?AUTO_7493 - AIRPLANE
      ?AUTO_7497 - TRUCK
      ?AUTO_7500 - LOCATION
      ?AUTO_7501 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7494 ?AUTO_7495 ) ( IN-CITY ?AUTO_7492 ?AUTO_7495 ) ( not ( = ?AUTO_7492 ?AUTO_7494 ) ) ( TRUCK-AT ?AUTO_7498 ?AUTO_7492 ) ( AIRPORT ?AUTO_7496 ) ( AIRPORT ?AUTO_7494 ) ( not ( = ?AUTO_7496 ?AUTO_7494 ) ) ( not ( = ?AUTO_7492 ?AUTO_7496 ) ) ( AIRPORT ?AUTO_7499 ) ( AIRPLANE-AT ?AUTO_7493 ?AUTO_7499 ) ( not ( = ?AUTO_7499 ?AUTO_7496 ) ) ( not ( = ?AUTO_7492 ?AUTO_7499 ) ) ( not ( = ?AUTO_7494 ?AUTO_7499 ) ) ( IN-TRUCK ?AUTO_7491 ?AUTO_7497 ) ( not ( = ?AUTO_7498 ?AUTO_7497 ) ) ( TRUCK-AT ?AUTO_7497 ?AUTO_7500 ) ( IN-CITY ?AUTO_7500 ?AUTO_7501 ) ( IN-CITY ?AUTO_7496 ?AUTO_7501 ) ( not ( = ?AUTO_7496 ?AUTO_7500 ) ) ( not ( = ?AUTO_7492 ?AUTO_7500 ) ) ( not ( = ?AUTO_7494 ?AUTO_7500 ) ) ( not ( = ?AUTO_7495 ?AUTO_7501 ) ) ( not ( = ?AUTO_7499 ?AUTO_7500 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7497 ?AUTO_7500 ?AUTO_7496 ?AUTO_7501 )
      ( DELIVER-PKG ?AUTO_7491 ?AUTO_7492 )
      ( DELIVER-PKG-VERIFY ?AUTO_7491 ?AUTO_7492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7502 - OBJ
      ?AUTO_7503 - LOCATION
    )
    :vars
    (
      ?AUTO_7510 - LOCATION
      ?AUTO_7508 - CITY
      ?AUTO_7504 - TRUCK
      ?AUTO_7509 - LOCATION
      ?AUTO_7505 - LOCATION
      ?AUTO_7507 - AIRPLANE
      ?AUTO_7506 - TRUCK
      ?AUTO_7511 - LOCATION
      ?AUTO_7512 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7510 ?AUTO_7508 ) ( IN-CITY ?AUTO_7503 ?AUTO_7508 ) ( not ( = ?AUTO_7503 ?AUTO_7510 ) ) ( TRUCK-AT ?AUTO_7504 ?AUTO_7503 ) ( AIRPORT ?AUTO_7509 ) ( AIRPORT ?AUTO_7510 ) ( not ( = ?AUTO_7509 ?AUTO_7510 ) ) ( not ( = ?AUTO_7503 ?AUTO_7509 ) ) ( AIRPORT ?AUTO_7505 ) ( AIRPLANE-AT ?AUTO_7507 ?AUTO_7505 ) ( not ( = ?AUTO_7505 ?AUTO_7509 ) ) ( not ( = ?AUTO_7503 ?AUTO_7505 ) ) ( not ( = ?AUTO_7510 ?AUTO_7505 ) ) ( not ( = ?AUTO_7504 ?AUTO_7506 ) ) ( TRUCK-AT ?AUTO_7506 ?AUTO_7511 ) ( IN-CITY ?AUTO_7511 ?AUTO_7512 ) ( IN-CITY ?AUTO_7509 ?AUTO_7512 ) ( not ( = ?AUTO_7509 ?AUTO_7511 ) ) ( not ( = ?AUTO_7503 ?AUTO_7511 ) ) ( not ( = ?AUTO_7510 ?AUTO_7511 ) ) ( not ( = ?AUTO_7508 ?AUTO_7512 ) ) ( not ( = ?AUTO_7505 ?AUTO_7511 ) ) ( OBJ-AT ?AUTO_7502 ?AUTO_7511 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7502 ?AUTO_7506 ?AUTO_7511 )
      ( DELIVER-PKG ?AUTO_7502 ?AUTO_7503 )
      ( DELIVER-PKG-VERIFY ?AUTO_7502 ?AUTO_7503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7517 - OBJ
      ?AUTO_7518 - LOCATION
    )
    :vars
    (
      ?AUTO_7519 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7519 ?AUTO_7518 ) ( IN-TRUCK ?AUTO_7517 ?AUTO_7519 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7517 ?AUTO_7519 ?AUTO_7518 )
      ( DELIVER-PKG-VERIFY ?AUTO_7517 ?AUTO_7518 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7524 - OBJ
      ?AUTO_7525 - LOCATION
    )
    :vars
    (
      ?AUTO_7527 - TRUCK
      ?AUTO_7526 - LOCATION
      ?AUTO_7528 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7527 ?AUTO_7526 ) ( IN-CITY ?AUTO_7526 ?AUTO_7528 ) ( IN-CITY ?AUTO_7525 ?AUTO_7528 ) ( not ( = ?AUTO_7525 ?AUTO_7526 ) ) ( OBJ-AT ?AUTO_7524 ?AUTO_7526 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7524 ?AUTO_7527 ?AUTO_7526 )
      ( DELIVER-PKG ?AUTO_7524 ?AUTO_7525 )
      ( DELIVER-PKG-VERIFY ?AUTO_7524 ?AUTO_7525 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7533 - OBJ
      ?AUTO_7534 - LOCATION
    )
    :vars
    (
      ?AUTO_7537 - LOCATION
      ?AUTO_7536 - CITY
      ?AUTO_7535 - TRUCK
      ?AUTO_7538 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7537 ?AUTO_7536 ) ( IN-CITY ?AUTO_7534 ?AUTO_7536 ) ( not ( = ?AUTO_7534 ?AUTO_7537 ) ) ( TRUCK-AT ?AUTO_7535 ?AUTO_7534 ) ( IN-AIRPLANE ?AUTO_7533 ?AUTO_7538 ) ( AIRPLANE-AT ?AUTO_7538 ?AUTO_7537 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7533 ?AUTO_7538 ?AUTO_7537 )
      ( DELIVER-PKG ?AUTO_7533 ?AUTO_7534 )
      ( DELIVER-PKG-VERIFY ?AUTO_7533 ?AUTO_7534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7541 - OBJ
      ?AUTO_7542 - LOCATION
    )
    :vars
    (
      ?AUTO_7543 - LOCATION
      ?AUTO_7546 - CITY
      ?AUTO_7545 - TRUCK
      ?AUTO_7544 - AIRPLANE
      ?AUTO_7547 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7543 ?AUTO_7546 ) ( IN-CITY ?AUTO_7542 ?AUTO_7546 ) ( not ( = ?AUTO_7542 ?AUTO_7543 ) ) ( TRUCK-AT ?AUTO_7545 ?AUTO_7542 ) ( IN-AIRPLANE ?AUTO_7541 ?AUTO_7544 ) ( AIRPORT ?AUTO_7547 ) ( AIRPORT ?AUTO_7543 ) ( AIRPLANE-AT ?AUTO_7544 ?AUTO_7547 ) ( not ( = ?AUTO_7547 ?AUTO_7543 ) ) ( not ( = ?AUTO_7542 ?AUTO_7547 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7544 ?AUTO_7547 ?AUTO_7543 )
      ( DELIVER-PKG ?AUTO_7541 ?AUTO_7542 )
      ( DELIVER-PKG-VERIFY ?AUTO_7541 ?AUTO_7542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7548 - OBJ
      ?AUTO_7549 - LOCATION
    )
    :vars
    (
      ?AUTO_7552 - LOCATION
      ?AUTO_7550 - CITY
      ?AUTO_7551 - TRUCK
      ?AUTO_7554 - LOCATION
      ?AUTO_7553 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7552 ?AUTO_7550 ) ( IN-CITY ?AUTO_7549 ?AUTO_7550 ) ( not ( = ?AUTO_7549 ?AUTO_7552 ) ) ( TRUCK-AT ?AUTO_7551 ?AUTO_7549 ) ( AIRPORT ?AUTO_7554 ) ( AIRPORT ?AUTO_7552 ) ( AIRPLANE-AT ?AUTO_7553 ?AUTO_7554 ) ( not ( = ?AUTO_7554 ?AUTO_7552 ) ) ( not ( = ?AUTO_7549 ?AUTO_7554 ) ) ( OBJ-AT ?AUTO_7548 ?AUTO_7554 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7548 ?AUTO_7553 ?AUTO_7554 )
      ( DELIVER-PKG ?AUTO_7548 ?AUTO_7549 )
      ( DELIVER-PKG-VERIFY ?AUTO_7548 ?AUTO_7549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7559 - OBJ
      ?AUTO_7560 - LOCATION
    )
    :vars
    (
      ?AUTO_7561 - LOCATION
      ?AUTO_7562 - CITY
      ?AUTO_7565 - TRUCK
      ?AUTO_7563 - LOCATION
      ?AUTO_7566 - LOCATION
      ?AUTO_7564 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7561 ?AUTO_7562 ) ( IN-CITY ?AUTO_7560 ?AUTO_7562 ) ( not ( = ?AUTO_7560 ?AUTO_7561 ) ) ( TRUCK-AT ?AUTO_7565 ?AUTO_7560 ) ( AIRPORT ?AUTO_7563 ) ( AIRPORT ?AUTO_7561 ) ( not ( = ?AUTO_7563 ?AUTO_7561 ) ) ( not ( = ?AUTO_7560 ?AUTO_7563 ) ) ( OBJ-AT ?AUTO_7559 ?AUTO_7563 ) ( AIRPORT ?AUTO_7566 ) ( AIRPLANE-AT ?AUTO_7564 ?AUTO_7566 ) ( not ( = ?AUTO_7566 ?AUTO_7563 ) ) ( not ( = ?AUTO_7560 ?AUTO_7566 ) ) ( not ( = ?AUTO_7561 ?AUTO_7566 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7564 ?AUTO_7566 ?AUTO_7563 )
      ( DELIVER-PKG ?AUTO_7559 ?AUTO_7560 )
      ( DELIVER-PKG-VERIFY ?AUTO_7559 ?AUTO_7560 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7577 - OBJ
      ?AUTO_7578 - LOCATION
    )
    :vars
    (
      ?AUTO_7580 - LOCATION
      ?AUTO_7584 - CITY
      ?AUTO_7583 - TRUCK
      ?AUTO_7582 - LOCATION
      ?AUTO_7579 - LOCATION
      ?AUTO_7581 - AIRPLANE
      ?AUTO_7585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7580 ?AUTO_7584 ) ( IN-CITY ?AUTO_7578 ?AUTO_7584 ) ( not ( = ?AUTO_7578 ?AUTO_7580 ) ) ( TRUCK-AT ?AUTO_7583 ?AUTO_7578 ) ( AIRPORT ?AUTO_7582 ) ( AIRPORT ?AUTO_7580 ) ( not ( = ?AUTO_7582 ?AUTO_7580 ) ) ( not ( = ?AUTO_7578 ?AUTO_7582 ) ) ( AIRPORT ?AUTO_7579 ) ( AIRPLANE-AT ?AUTO_7581 ?AUTO_7579 ) ( not ( = ?AUTO_7579 ?AUTO_7582 ) ) ( not ( = ?AUTO_7578 ?AUTO_7579 ) ) ( not ( = ?AUTO_7580 ?AUTO_7579 ) ) ( TRUCK-AT ?AUTO_7585 ?AUTO_7582 ) ( IN-TRUCK ?AUTO_7577 ?AUTO_7585 ) ( not ( = ?AUTO_7583 ?AUTO_7585 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7577 ?AUTO_7585 ?AUTO_7582 )
      ( DELIVER-PKG ?AUTO_7577 ?AUTO_7578 )
      ( DELIVER-PKG-VERIFY ?AUTO_7577 ?AUTO_7578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7586 - OBJ
      ?AUTO_7587 - LOCATION
    )
    :vars
    (
      ?AUTO_7592 - LOCATION
      ?AUTO_7591 - CITY
      ?AUTO_7588 - TRUCK
      ?AUTO_7590 - LOCATION
      ?AUTO_7593 - LOCATION
      ?AUTO_7589 - AIRPLANE
      ?AUTO_7594 - TRUCK
      ?AUTO_7595 - LOCATION
      ?AUTO_7596 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7592 ?AUTO_7591 ) ( IN-CITY ?AUTO_7587 ?AUTO_7591 ) ( not ( = ?AUTO_7587 ?AUTO_7592 ) ) ( TRUCK-AT ?AUTO_7588 ?AUTO_7587 ) ( AIRPORT ?AUTO_7590 ) ( AIRPORT ?AUTO_7592 ) ( not ( = ?AUTO_7590 ?AUTO_7592 ) ) ( not ( = ?AUTO_7587 ?AUTO_7590 ) ) ( AIRPORT ?AUTO_7593 ) ( AIRPLANE-AT ?AUTO_7589 ?AUTO_7593 ) ( not ( = ?AUTO_7593 ?AUTO_7590 ) ) ( not ( = ?AUTO_7587 ?AUTO_7593 ) ) ( not ( = ?AUTO_7592 ?AUTO_7593 ) ) ( IN-TRUCK ?AUTO_7586 ?AUTO_7594 ) ( not ( = ?AUTO_7588 ?AUTO_7594 ) ) ( TRUCK-AT ?AUTO_7594 ?AUTO_7595 ) ( IN-CITY ?AUTO_7595 ?AUTO_7596 ) ( IN-CITY ?AUTO_7590 ?AUTO_7596 ) ( not ( = ?AUTO_7590 ?AUTO_7595 ) ) ( not ( = ?AUTO_7587 ?AUTO_7595 ) ) ( not ( = ?AUTO_7592 ?AUTO_7595 ) ) ( not ( = ?AUTO_7591 ?AUTO_7596 ) ) ( not ( = ?AUTO_7593 ?AUTO_7595 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7594 ?AUTO_7595 ?AUTO_7590 ?AUTO_7596 )
      ( DELIVER-PKG ?AUTO_7586 ?AUTO_7587 )
      ( DELIVER-PKG-VERIFY ?AUTO_7586 ?AUTO_7587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7597 - OBJ
      ?AUTO_7598 - LOCATION
    )
    :vars
    (
      ?AUTO_7604 - LOCATION
      ?AUTO_7600 - CITY
      ?AUTO_7603 - TRUCK
      ?AUTO_7606 - LOCATION
      ?AUTO_7601 - LOCATION
      ?AUTO_7599 - AIRPLANE
      ?AUTO_7602 - TRUCK
      ?AUTO_7605 - LOCATION
      ?AUTO_7607 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7604 ?AUTO_7600 ) ( IN-CITY ?AUTO_7598 ?AUTO_7600 ) ( not ( = ?AUTO_7598 ?AUTO_7604 ) ) ( TRUCK-AT ?AUTO_7603 ?AUTO_7598 ) ( AIRPORT ?AUTO_7606 ) ( AIRPORT ?AUTO_7604 ) ( not ( = ?AUTO_7606 ?AUTO_7604 ) ) ( not ( = ?AUTO_7598 ?AUTO_7606 ) ) ( AIRPORT ?AUTO_7601 ) ( AIRPLANE-AT ?AUTO_7599 ?AUTO_7601 ) ( not ( = ?AUTO_7601 ?AUTO_7606 ) ) ( not ( = ?AUTO_7598 ?AUTO_7601 ) ) ( not ( = ?AUTO_7604 ?AUTO_7601 ) ) ( not ( = ?AUTO_7603 ?AUTO_7602 ) ) ( TRUCK-AT ?AUTO_7602 ?AUTO_7605 ) ( IN-CITY ?AUTO_7605 ?AUTO_7607 ) ( IN-CITY ?AUTO_7606 ?AUTO_7607 ) ( not ( = ?AUTO_7606 ?AUTO_7605 ) ) ( not ( = ?AUTO_7598 ?AUTO_7605 ) ) ( not ( = ?AUTO_7604 ?AUTO_7605 ) ) ( not ( = ?AUTO_7600 ?AUTO_7607 ) ) ( not ( = ?AUTO_7601 ?AUTO_7605 ) ) ( OBJ-AT ?AUTO_7597 ?AUTO_7605 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7597 ?AUTO_7602 ?AUTO_7605 )
      ( DELIVER-PKG ?AUTO_7597 ?AUTO_7598 )
      ( DELIVER-PKG-VERIFY ?AUTO_7597 ?AUTO_7598 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7608 - OBJ
      ?AUTO_7609 - LOCATION
    )
    :vars
    (
      ?AUTO_7615 - LOCATION
      ?AUTO_7610 - CITY
      ?AUTO_7614 - TRUCK
      ?AUTO_7617 - LOCATION
      ?AUTO_7611 - LOCATION
      ?AUTO_7612 - AIRPLANE
      ?AUTO_7613 - TRUCK
      ?AUTO_7616 - LOCATION
      ?AUTO_7618 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7615 ?AUTO_7610 ) ( IN-CITY ?AUTO_7609 ?AUTO_7610 ) ( not ( = ?AUTO_7609 ?AUTO_7615 ) ) ( TRUCK-AT ?AUTO_7614 ?AUTO_7609 ) ( AIRPORT ?AUTO_7617 ) ( AIRPORT ?AUTO_7615 ) ( not ( = ?AUTO_7617 ?AUTO_7615 ) ) ( not ( = ?AUTO_7609 ?AUTO_7617 ) ) ( AIRPORT ?AUTO_7611 ) ( AIRPLANE-AT ?AUTO_7612 ?AUTO_7611 ) ( not ( = ?AUTO_7611 ?AUTO_7617 ) ) ( not ( = ?AUTO_7609 ?AUTO_7611 ) ) ( not ( = ?AUTO_7615 ?AUTO_7611 ) ) ( not ( = ?AUTO_7614 ?AUTO_7613 ) ) ( IN-CITY ?AUTO_7616 ?AUTO_7618 ) ( IN-CITY ?AUTO_7617 ?AUTO_7618 ) ( not ( = ?AUTO_7617 ?AUTO_7616 ) ) ( not ( = ?AUTO_7609 ?AUTO_7616 ) ) ( not ( = ?AUTO_7615 ?AUTO_7616 ) ) ( not ( = ?AUTO_7610 ?AUTO_7618 ) ) ( not ( = ?AUTO_7611 ?AUTO_7616 ) ) ( OBJ-AT ?AUTO_7608 ?AUTO_7616 ) ( TRUCK-AT ?AUTO_7613 ?AUTO_7617 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7613 ?AUTO_7617 ?AUTO_7616 ?AUTO_7618 )
      ( DELIVER-PKG ?AUTO_7608 ?AUTO_7609 )
      ( DELIVER-PKG-VERIFY ?AUTO_7608 ?AUTO_7609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7621 - OBJ
      ?AUTO_7622 - LOCATION
    )
    :vars
    (
      ?AUTO_7623 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7623 ?AUTO_7622 ) ( IN-TRUCK ?AUTO_7621 ?AUTO_7623 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7621 ?AUTO_7623 ?AUTO_7622 )
      ( DELIVER-PKG-VERIFY ?AUTO_7621 ?AUTO_7622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7624 - OBJ
      ?AUTO_7625 - LOCATION
    )
    :vars
    (
      ?AUTO_7626 - TRUCK
      ?AUTO_7627 - LOCATION
      ?AUTO_7628 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7624 ?AUTO_7626 ) ( TRUCK-AT ?AUTO_7626 ?AUTO_7627 ) ( IN-CITY ?AUTO_7627 ?AUTO_7628 ) ( IN-CITY ?AUTO_7625 ?AUTO_7628 ) ( not ( = ?AUTO_7625 ?AUTO_7627 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7626 ?AUTO_7627 ?AUTO_7625 ?AUTO_7628 )
      ( DELIVER-PKG ?AUTO_7624 ?AUTO_7625 )
      ( DELIVER-PKG-VERIFY ?AUTO_7624 ?AUTO_7625 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7629 - OBJ
      ?AUTO_7630 - LOCATION
    )
    :vars
    (
      ?AUTO_7631 - TRUCK
      ?AUTO_7632 - LOCATION
      ?AUTO_7633 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7631 ?AUTO_7632 ) ( IN-CITY ?AUTO_7632 ?AUTO_7633 ) ( IN-CITY ?AUTO_7630 ?AUTO_7633 ) ( not ( = ?AUTO_7630 ?AUTO_7632 ) ) ( OBJ-AT ?AUTO_7629 ?AUTO_7632 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7629 ?AUTO_7631 ?AUTO_7632 )
      ( DELIVER-PKG ?AUTO_7629 ?AUTO_7630 )
      ( DELIVER-PKG-VERIFY ?AUTO_7629 ?AUTO_7630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7634 - OBJ
      ?AUTO_7635 - LOCATION
    )
    :vars
    (
      ?AUTO_7636 - LOCATION
      ?AUTO_7638 - CITY
      ?AUTO_7637 - TRUCK
      ?AUTO_7639 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7636 ?AUTO_7638 ) ( IN-CITY ?AUTO_7635 ?AUTO_7638 ) ( not ( = ?AUTO_7635 ?AUTO_7636 ) ) ( OBJ-AT ?AUTO_7634 ?AUTO_7636 ) ( TRUCK-AT ?AUTO_7637 ?AUTO_7639 ) ( IN-CITY ?AUTO_7639 ?AUTO_7638 ) ( not ( = ?AUTO_7636 ?AUTO_7639 ) ) ( not ( = ?AUTO_7635 ?AUTO_7639 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7637 ?AUTO_7639 ?AUTO_7636 ?AUTO_7638 )
      ( DELIVER-PKG ?AUTO_7634 ?AUTO_7635 )
      ( DELIVER-PKG-VERIFY ?AUTO_7634 ?AUTO_7635 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7642 - OBJ
      ?AUTO_7643 - LOCATION
    )
    :vars
    (
      ?AUTO_7644 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7644 ?AUTO_7643 ) ( IN-TRUCK ?AUTO_7642 ?AUTO_7644 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7642 ?AUTO_7644 ?AUTO_7643 )
      ( DELIVER-PKG-VERIFY ?AUTO_7642 ?AUTO_7643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7651 - OBJ
      ?AUTO_7652 - LOCATION
    )
    :vars
    (
      ?AUTO_7653 - TRUCK
      ?AUTO_7654 - LOCATION
      ?AUTO_7655 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7651 ?AUTO_7653 ) ( TRUCK-AT ?AUTO_7653 ?AUTO_7654 ) ( IN-CITY ?AUTO_7654 ?AUTO_7655 ) ( IN-CITY ?AUTO_7652 ?AUTO_7655 ) ( not ( = ?AUTO_7652 ?AUTO_7654 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7653 ?AUTO_7654 ?AUTO_7652 ?AUTO_7655 )
      ( DELIVER-PKG ?AUTO_7651 ?AUTO_7652 )
      ( DELIVER-PKG-VERIFY ?AUTO_7651 ?AUTO_7652 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7656 - OBJ
      ?AUTO_7657 - LOCATION
    )
    :vars
    (
      ?AUTO_7658 - TRUCK
      ?AUTO_7659 - LOCATION
      ?AUTO_7660 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7658 ?AUTO_7659 ) ( IN-CITY ?AUTO_7659 ?AUTO_7660 ) ( IN-CITY ?AUTO_7657 ?AUTO_7660 ) ( not ( = ?AUTO_7657 ?AUTO_7659 ) ) ( OBJ-AT ?AUTO_7656 ?AUTO_7659 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7656 ?AUTO_7658 ?AUTO_7659 )
      ( DELIVER-PKG ?AUTO_7656 ?AUTO_7657 )
      ( DELIVER-PKG-VERIFY ?AUTO_7656 ?AUTO_7657 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7677 - OBJ
      ?AUTO_7678 - LOCATION
    )
    :vars
    (
      ?AUTO_7679 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7679 ?AUTO_7678 ) ( IN-TRUCK ?AUTO_7677 ?AUTO_7679 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7677 ?AUTO_7679 ?AUTO_7678 )
      ( DELIVER-PKG-VERIFY ?AUTO_7677 ?AUTO_7678 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7680 - OBJ
      ?AUTO_7681 - LOCATION
    )
    :vars
    (
      ?AUTO_7682 - TRUCK
      ?AUTO_7683 - LOCATION
      ?AUTO_7684 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7680 ?AUTO_7682 ) ( TRUCK-AT ?AUTO_7682 ?AUTO_7683 ) ( IN-CITY ?AUTO_7683 ?AUTO_7684 ) ( IN-CITY ?AUTO_7681 ?AUTO_7684 ) ( not ( = ?AUTO_7681 ?AUTO_7683 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7682 ?AUTO_7683 ?AUTO_7681 ?AUTO_7684 )
      ( DELIVER-PKG ?AUTO_7680 ?AUTO_7681 )
      ( DELIVER-PKG-VERIFY ?AUTO_7680 ?AUTO_7681 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7685 - OBJ
      ?AUTO_7686 - LOCATION
    )
    :vars
    (
      ?AUTO_7687 - TRUCK
      ?AUTO_7688 - LOCATION
      ?AUTO_7689 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7687 ?AUTO_7688 ) ( IN-CITY ?AUTO_7688 ?AUTO_7689 ) ( IN-CITY ?AUTO_7686 ?AUTO_7689 ) ( not ( = ?AUTO_7686 ?AUTO_7688 ) ) ( OBJ-AT ?AUTO_7685 ?AUTO_7688 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7685 ?AUTO_7687 ?AUTO_7688 )
      ( DELIVER-PKG ?AUTO_7685 ?AUTO_7686 )
      ( DELIVER-PKG-VERIFY ?AUTO_7685 ?AUTO_7686 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7690 - OBJ
      ?AUTO_7691 - LOCATION
    )
    :vars
    (
      ?AUTO_7692 - LOCATION
      ?AUTO_7694 - CITY
      ?AUTO_7693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7692 ?AUTO_7694 ) ( IN-CITY ?AUTO_7691 ?AUTO_7694 ) ( not ( = ?AUTO_7691 ?AUTO_7692 ) ) ( OBJ-AT ?AUTO_7690 ?AUTO_7692 ) ( TRUCK-AT ?AUTO_7693 ?AUTO_7691 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7693 ?AUTO_7691 ?AUTO_7692 ?AUTO_7694 )
      ( DELIVER-PKG ?AUTO_7690 ?AUTO_7691 )
      ( DELIVER-PKG-VERIFY ?AUTO_7690 ?AUTO_7691 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7723 - OBJ
      ?AUTO_7724 - LOCATION
    )
    :vars
    (
      ?AUTO_7725 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7723 ?AUTO_7725 ) ( AIRPLANE-AT ?AUTO_7725 ?AUTO_7724 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7723 ?AUTO_7725 ?AUTO_7724 )
      ( DELIVER-PKG-VERIFY ?AUTO_7723 ?AUTO_7724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7726 - OBJ
      ?AUTO_7727 - LOCATION
    )
    :vars
    (
      ?AUTO_7728 - AIRPLANE
      ?AUTO_7729 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7726 ?AUTO_7728 ) ( AIRPORT ?AUTO_7729 ) ( AIRPORT ?AUTO_7727 ) ( AIRPLANE-AT ?AUTO_7728 ?AUTO_7729 ) ( not ( = ?AUTO_7729 ?AUTO_7727 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7728 ?AUTO_7729 ?AUTO_7727 )
      ( DELIVER-PKG ?AUTO_7726 ?AUTO_7727 )
      ( DELIVER-PKG-VERIFY ?AUTO_7726 ?AUTO_7727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7734 - OBJ
      ?AUTO_7735 - LOCATION
    )
    :vars
    (
      ?AUTO_7736 - LOCATION
      ?AUTO_7737 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7736 ) ( AIRPORT ?AUTO_7735 ) ( AIRPLANE-AT ?AUTO_7737 ?AUTO_7736 ) ( not ( = ?AUTO_7736 ?AUTO_7735 ) ) ( OBJ-AT ?AUTO_7734 ?AUTO_7736 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7734 ?AUTO_7737 ?AUTO_7736 )
      ( DELIVER-PKG ?AUTO_7734 ?AUTO_7735 )
      ( DELIVER-PKG-VERIFY ?AUTO_7734 ?AUTO_7735 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7738 - OBJ
      ?AUTO_7739 - LOCATION
    )
    :vars
    (
      ?AUTO_7740 - LOCATION
      ?AUTO_7741 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7740 ) ( AIRPORT ?AUTO_7739 ) ( not ( = ?AUTO_7740 ?AUTO_7739 ) ) ( OBJ-AT ?AUTO_7738 ?AUTO_7740 ) ( AIRPLANE-AT ?AUTO_7741 ?AUTO_7739 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7741 ?AUTO_7739 ?AUTO_7740 )
      ( DELIVER-PKG ?AUTO_7738 ?AUTO_7739 )
      ( DELIVER-PKG-VERIFY ?AUTO_7738 ?AUTO_7739 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7768 - OBJ
      ?AUTO_7769 - LOCATION
    )
    :vars
    (
      ?AUTO_7771 - LOCATION
      ?AUTO_7770 - AIRPLANE
      ?AUTO_7772 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7771 ) ( AIRPORT ?AUTO_7769 ) ( not ( = ?AUTO_7771 ?AUTO_7769 ) ) ( AIRPLANE-AT ?AUTO_7770 ?AUTO_7769 ) ( TRUCK-AT ?AUTO_7772 ?AUTO_7771 ) ( IN-TRUCK ?AUTO_7768 ?AUTO_7772 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7768 ?AUTO_7772 ?AUTO_7771 )
      ( DELIVER-PKG ?AUTO_7768 ?AUTO_7769 )
      ( DELIVER-PKG-VERIFY ?AUTO_7768 ?AUTO_7769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7773 - OBJ
      ?AUTO_7774 - LOCATION
    )
    :vars
    (
      ?AUTO_7776 - LOCATION
      ?AUTO_7775 - AIRPLANE
      ?AUTO_7777 - TRUCK
      ?AUTO_7778 - LOCATION
      ?AUTO_7779 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7776 ) ( AIRPORT ?AUTO_7774 ) ( not ( = ?AUTO_7776 ?AUTO_7774 ) ) ( AIRPLANE-AT ?AUTO_7775 ?AUTO_7774 ) ( IN-TRUCK ?AUTO_7773 ?AUTO_7777 ) ( TRUCK-AT ?AUTO_7777 ?AUTO_7778 ) ( IN-CITY ?AUTO_7778 ?AUTO_7779 ) ( IN-CITY ?AUTO_7776 ?AUTO_7779 ) ( not ( = ?AUTO_7776 ?AUTO_7778 ) ) ( not ( = ?AUTO_7774 ?AUTO_7778 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7777 ?AUTO_7778 ?AUTO_7776 ?AUTO_7779 )
      ( DELIVER-PKG ?AUTO_7773 ?AUTO_7774 )
      ( DELIVER-PKG-VERIFY ?AUTO_7773 ?AUTO_7774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7780 - OBJ
      ?AUTO_7781 - LOCATION
    )
    :vars
    (
      ?AUTO_7782 - LOCATION
      ?AUTO_7783 - AIRPLANE
      ?AUTO_7784 - TRUCK
      ?AUTO_7786 - LOCATION
      ?AUTO_7785 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7782 ) ( AIRPORT ?AUTO_7781 ) ( not ( = ?AUTO_7782 ?AUTO_7781 ) ) ( AIRPLANE-AT ?AUTO_7783 ?AUTO_7781 ) ( TRUCK-AT ?AUTO_7784 ?AUTO_7786 ) ( IN-CITY ?AUTO_7786 ?AUTO_7785 ) ( IN-CITY ?AUTO_7782 ?AUTO_7785 ) ( not ( = ?AUTO_7782 ?AUTO_7786 ) ) ( not ( = ?AUTO_7781 ?AUTO_7786 ) ) ( OBJ-AT ?AUTO_7780 ?AUTO_7786 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7780 ?AUTO_7784 ?AUTO_7786 )
      ( DELIVER-PKG ?AUTO_7780 ?AUTO_7781 )
      ( DELIVER-PKG-VERIFY ?AUTO_7780 ?AUTO_7781 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7787 - OBJ
      ?AUTO_7788 - LOCATION
    )
    :vars
    (
      ?AUTO_7790 - LOCATION
      ?AUTO_7791 - AIRPLANE
      ?AUTO_7789 - LOCATION
      ?AUTO_7792 - CITY
      ?AUTO_7793 - TRUCK
      ?AUTO_7794 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7790 ) ( AIRPORT ?AUTO_7788 ) ( not ( = ?AUTO_7790 ?AUTO_7788 ) ) ( AIRPLANE-AT ?AUTO_7791 ?AUTO_7788 ) ( IN-CITY ?AUTO_7789 ?AUTO_7792 ) ( IN-CITY ?AUTO_7790 ?AUTO_7792 ) ( not ( = ?AUTO_7790 ?AUTO_7789 ) ) ( not ( = ?AUTO_7788 ?AUTO_7789 ) ) ( OBJ-AT ?AUTO_7787 ?AUTO_7789 ) ( TRUCK-AT ?AUTO_7793 ?AUTO_7794 ) ( IN-CITY ?AUTO_7794 ?AUTO_7792 ) ( not ( = ?AUTO_7789 ?AUTO_7794 ) ) ( not ( = ?AUTO_7788 ?AUTO_7794 ) ) ( not ( = ?AUTO_7790 ?AUTO_7794 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7793 ?AUTO_7794 ?AUTO_7789 ?AUTO_7792 )
      ( DELIVER-PKG ?AUTO_7787 ?AUTO_7788 )
      ( DELIVER-PKG-VERIFY ?AUTO_7787 ?AUTO_7788 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7797 - OBJ
      ?AUTO_7798 - LOCATION
    )
    :vars
    (
      ?AUTO_7799 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7797 ?AUTO_7799 ) ( AIRPLANE-AT ?AUTO_7799 ?AUTO_7798 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7797 ?AUTO_7799 ?AUTO_7798 )
      ( DELIVER-PKG-VERIFY ?AUTO_7797 ?AUTO_7798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7802 - OBJ
      ?AUTO_7803 - LOCATION
    )
    :vars
    (
      ?AUTO_7804 - AIRPLANE
      ?AUTO_7805 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7802 ?AUTO_7804 ) ( AIRPORT ?AUTO_7805 ) ( AIRPORT ?AUTO_7803 ) ( AIRPLANE-AT ?AUTO_7804 ?AUTO_7805 ) ( not ( = ?AUTO_7805 ?AUTO_7803 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7804 ?AUTO_7805 ?AUTO_7803 )
      ( DELIVER-PKG ?AUTO_7802 ?AUTO_7803 )
      ( DELIVER-PKG-VERIFY ?AUTO_7802 ?AUTO_7803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7810 - OBJ
      ?AUTO_7811 - LOCATION
    )
    :vars
    (
      ?AUTO_7812 - LOCATION
      ?AUTO_7813 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7812 ) ( AIRPORT ?AUTO_7811 ) ( AIRPLANE-AT ?AUTO_7813 ?AUTO_7812 ) ( not ( = ?AUTO_7812 ?AUTO_7811 ) ) ( OBJ-AT ?AUTO_7810 ?AUTO_7812 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7810 ?AUTO_7813 ?AUTO_7812 )
      ( DELIVER-PKG ?AUTO_7810 ?AUTO_7811 )
      ( DELIVER-PKG-VERIFY ?AUTO_7810 ?AUTO_7811 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7814 - OBJ
      ?AUTO_7815 - LOCATION
    )
    :vars
    (
      ?AUTO_7817 - LOCATION
      ?AUTO_7818 - LOCATION
      ?AUTO_7816 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7817 ) ( AIRPORT ?AUTO_7815 ) ( not ( = ?AUTO_7817 ?AUTO_7815 ) ) ( OBJ-AT ?AUTO_7814 ?AUTO_7817 ) ( AIRPORT ?AUTO_7818 ) ( AIRPLANE-AT ?AUTO_7816 ?AUTO_7818 ) ( not ( = ?AUTO_7818 ?AUTO_7817 ) ) ( not ( = ?AUTO_7815 ?AUTO_7818 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7816 ?AUTO_7818 ?AUTO_7817 )
      ( DELIVER-PKG ?AUTO_7814 ?AUTO_7815 )
      ( DELIVER-PKG-VERIFY ?AUTO_7814 ?AUTO_7815 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7859 - OBJ
      ?AUTO_7860 - LOCATION
    )
    :vars
    (
      ?AUTO_7861 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7861 ?AUTO_7860 ) ( IN-TRUCK ?AUTO_7859 ?AUTO_7861 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7859 ?AUTO_7861 ?AUTO_7860 )
      ( DELIVER-PKG-VERIFY ?AUTO_7859 ?AUTO_7860 ) )
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
      ?AUTO_7865 - LOCATION
      ?AUTO_7866 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7862 ?AUTO_7864 ) ( TRUCK-AT ?AUTO_7864 ?AUTO_7865 ) ( IN-CITY ?AUTO_7865 ?AUTO_7866 ) ( IN-CITY ?AUTO_7863 ?AUTO_7866 ) ( not ( = ?AUTO_7863 ?AUTO_7865 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7864 ?AUTO_7865 ?AUTO_7863 ?AUTO_7866 )
      ( DELIVER-PKG ?AUTO_7862 ?AUTO_7863 )
      ( DELIVER-PKG-VERIFY ?AUTO_7862 ?AUTO_7863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7907 - OBJ
      ?AUTO_7908 - LOCATION
    )
    :vars
    (
      ?AUTO_7910 - LOCATION
      ?AUTO_7909 - CITY
      ?AUTO_7911 - TRUCK
      ?AUTO_7912 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7910 ?AUTO_7909 ) ( IN-CITY ?AUTO_7908 ?AUTO_7909 ) ( not ( = ?AUTO_7908 ?AUTO_7910 ) ) ( OBJ-AT ?AUTO_7907 ?AUTO_7910 ) ( TRUCK-AT ?AUTO_7911 ?AUTO_7912 ) ( IN-CITY ?AUTO_7912 ?AUTO_7909 ) ( not ( = ?AUTO_7910 ?AUTO_7912 ) ) ( not ( = ?AUTO_7908 ?AUTO_7912 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7911 ?AUTO_7912 ?AUTO_7910 ?AUTO_7909 )
      ( DELIVER-PKG ?AUTO_7907 ?AUTO_7908 )
      ( DELIVER-PKG-VERIFY ?AUTO_7907 ?AUTO_7908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7925 - OBJ
      ?AUTO_7926 - LOCATION
    )
    :vars
    (
      ?AUTO_7927 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7927 ?AUTO_7926 ) ( IN-TRUCK ?AUTO_7925 ?AUTO_7927 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7925 ?AUTO_7927 ?AUTO_7926 )
      ( DELIVER-PKG-VERIFY ?AUTO_7925 ?AUTO_7926 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7964 - OBJ
      ?AUTO_7965 - LOCATION
    )
    :vars
    (
      ?AUTO_7968 - LOCATION
      ?AUTO_7967 - CITY
      ?AUTO_7966 - TRUCK
      ?AUTO_7969 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7968 ?AUTO_7967 ) ( IN-CITY ?AUTO_7965 ?AUTO_7967 ) ( not ( = ?AUTO_7965 ?AUTO_7968 ) ) ( OBJ-AT ?AUTO_7964 ?AUTO_7968 ) ( TRUCK-AT ?AUTO_7966 ?AUTO_7969 ) ( IN-CITY ?AUTO_7969 ?AUTO_7967 ) ( not ( = ?AUTO_7968 ?AUTO_7969 ) ) ( not ( = ?AUTO_7965 ?AUTO_7969 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7966 ?AUTO_7969 ?AUTO_7968 ?AUTO_7967 )
      ( DELIVER-PKG ?AUTO_7964 ?AUTO_7965 )
      ( DELIVER-PKG-VERIFY ?AUTO_7964 ?AUTO_7965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7990 - OBJ
      ?AUTO_7991 - LOCATION
    )
    :vars
    (
      ?AUTO_7992 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7992 ?AUTO_7991 ) ( IN-TRUCK ?AUTO_7990 ?AUTO_7992 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7990 ?AUTO_7992 ?AUTO_7991 )
      ( DELIVER-PKG-VERIFY ?AUTO_7990 ?AUTO_7991 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8053 - OBJ
      ?AUTO_8054 - LOCATION
    )
    :vars
    (
      ?AUTO_8055 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8055 ?AUTO_8054 ) ( IN-TRUCK ?AUTO_8053 ?AUTO_8055 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8053 ?AUTO_8055 ?AUTO_8054 )
      ( DELIVER-PKG-VERIFY ?AUTO_8053 ?AUTO_8054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8056 - OBJ
      ?AUTO_8057 - LOCATION
    )
    :vars
    (
      ?AUTO_8058 - TRUCK
      ?AUTO_8059 - LOCATION
      ?AUTO_8060 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8056 ?AUTO_8058 ) ( TRUCK-AT ?AUTO_8058 ?AUTO_8059 ) ( IN-CITY ?AUTO_8059 ?AUTO_8060 ) ( IN-CITY ?AUTO_8057 ?AUTO_8060 ) ( not ( = ?AUTO_8057 ?AUTO_8059 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8058 ?AUTO_8059 ?AUTO_8057 ?AUTO_8060 )
      ( DELIVER-PKG ?AUTO_8056 ?AUTO_8057 )
      ( DELIVER-PKG-VERIFY ?AUTO_8056 ?AUTO_8057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8061 - OBJ
      ?AUTO_8062 - LOCATION
    )
    :vars
    (
      ?AUTO_8063 - TRUCK
      ?AUTO_8064 - LOCATION
      ?AUTO_8065 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8063 ?AUTO_8064 ) ( IN-CITY ?AUTO_8064 ?AUTO_8065 ) ( IN-CITY ?AUTO_8062 ?AUTO_8065 ) ( not ( = ?AUTO_8062 ?AUTO_8064 ) ) ( OBJ-AT ?AUTO_8061 ?AUTO_8064 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8061 ?AUTO_8063 ?AUTO_8064 )
      ( DELIVER-PKG ?AUTO_8061 ?AUTO_8062 )
      ( DELIVER-PKG-VERIFY ?AUTO_8061 ?AUTO_8062 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8072 - OBJ
      ?AUTO_8073 - LOCATION
    )
    :vars
    (
      ?AUTO_8076 - LOCATION
      ?AUTO_8075 - CITY
      ?AUTO_8074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8076 ?AUTO_8075 ) ( IN-CITY ?AUTO_8073 ?AUTO_8075 ) ( not ( = ?AUTO_8073 ?AUTO_8076 ) ) ( OBJ-AT ?AUTO_8072 ?AUTO_8076 ) ( TRUCK-AT ?AUTO_8074 ?AUTO_8073 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8074 ?AUTO_8073 ?AUTO_8076 ?AUTO_8075 )
      ( DELIVER-PKG ?AUTO_8072 ?AUTO_8073 )
      ( DELIVER-PKG-VERIFY ?AUTO_8072 ?AUTO_8073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8083 - OBJ
      ?AUTO_8084 - LOCATION
    )
    :vars
    (
      ?AUTO_8085 - LOCATION
      ?AUTO_8087 - CITY
      ?AUTO_8086 - TRUCK
      ?AUTO_8088 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8085 ?AUTO_8087 ) ( IN-CITY ?AUTO_8084 ?AUTO_8087 ) ( not ( = ?AUTO_8084 ?AUTO_8085 ) ) ( TRUCK-AT ?AUTO_8086 ?AUTO_8084 ) ( IN-AIRPLANE ?AUTO_8083 ?AUTO_8088 ) ( AIRPLANE-AT ?AUTO_8088 ?AUTO_8085 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8083 ?AUTO_8088 ?AUTO_8085 )
      ( DELIVER-PKG ?AUTO_8083 ?AUTO_8084 )
      ( DELIVER-PKG-VERIFY ?AUTO_8083 ?AUTO_8084 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8089 - OBJ
      ?AUTO_8090 - LOCATION
    )
    :vars
    (
      ?AUTO_8092 - LOCATION
      ?AUTO_8093 - CITY
      ?AUTO_8091 - TRUCK
      ?AUTO_8094 - AIRPLANE
      ?AUTO_8095 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8092 ?AUTO_8093 ) ( IN-CITY ?AUTO_8090 ?AUTO_8093 ) ( not ( = ?AUTO_8090 ?AUTO_8092 ) ) ( TRUCK-AT ?AUTO_8091 ?AUTO_8090 ) ( IN-AIRPLANE ?AUTO_8089 ?AUTO_8094 ) ( AIRPORT ?AUTO_8095 ) ( AIRPORT ?AUTO_8092 ) ( AIRPLANE-AT ?AUTO_8094 ?AUTO_8095 ) ( not ( = ?AUTO_8095 ?AUTO_8092 ) ) ( not ( = ?AUTO_8090 ?AUTO_8095 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8094 ?AUTO_8095 ?AUTO_8092 )
      ( DELIVER-PKG ?AUTO_8089 ?AUTO_8090 )
      ( DELIVER-PKG-VERIFY ?AUTO_8089 ?AUTO_8090 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8100 - OBJ
      ?AUTO_8101 - LOCATION
    )
    :vars
    (
      ?AUTO_8103 - LOCATION
      ?AUTO_8106 - CITY
      ?AUTO_8102 - TRUCK
      ?AUTO_8105 - LOCATION
      ?AUTO_8104 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8103 ?AUTO_8106 ) ( IN-CITY ?AUTO_8101 ?AUTO_8106 ) ( not ( = ?AUTO_8101 ?AUTO_8103 ) ) ( TRUCK-AT ?AUTO_8102 ?AUTO_8101 ) ( AIRPORT ?AUTO_8105 ) ( AIRPORT ?AUTO_8103 ) ( AIRPLANE-AT ?AUTO_8104 ?AUTO_8105 ) ( not ( = ?AUTO_8105 ?AUTO_8103 ) ) ( not ( = ?AUTO_8101 ?AUTO_8105 ) ) ( OBJ-AT ?AUTO_8100 ?AUTO_8105 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8100 ?AUTO_8104 ?AUTO_8105 )
      ( DELIVER-PKG ?AUTO_8100 ?AUTO_8101 )
      ( DELIVER-PKG-VERIFY ?AUTO_8100 ?AUTO_8101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8107 - OBJ
      ?AUTO_8108 - LOCATION
    )
    :vars
    (
      ?AUTO_8110 - LOCATION
      ?AUTO_8112 - CITY
      ?AUTO_8109 - TRUCK
      ?AUTO_8113 - LOCATION
      ?AUTO_8111 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8110 ?AUTO_8112 ) ( IN-CITY ?AUTO_8108 ?AUTO_8112 ) ( not ( = ?AUTO_8108 ?AUTO_8110 ) ) ( TRUCK-AT ?AUTO_8109 ?AUTO_8108 ) ( AIRPORT ?AUTO_8113 ) ( AIRPORT ?AUTO_8110 ) ( not ( = ?AUTO_8113 ?AUTO_8110 ) ) ( not ( = ?AUTO_8108 ?AUTO_8113 ) ) ( OBJ-AT ?AUTO_8107 ?AUTO_8113 ) ( AIRPLANE-AT ?AUTO_8111 ?AUTO_8110 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8111 ?AUTO_8110 ?AUTO_8113 )
      ( DELIVER-PKG ?AUTO_8107 ?AUTO_8108 )
      ( DELIVER-PKG-VERIFY ?AUTO_8107 ?AUTO_8108 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8128 - OBJ
      ?AUTO_8129 - LOCATION
    )
    :vars
    (
      ?AUTO_8132 - LOCATION
      ?AUTO_8130 - CITY
      ?AUTO_8131 - LOCATION
      ?AUTO_8134 - AIRPLANE
      ?AUTO_8133 - TRUCK
      ?AUTO_8135 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8132 ?AUTO_8130 ) ( IN-CITY ?AUTO_8129 ?AUTO_8130 ) ( not ( = ?AUTO_8129 ?AUTO_8132 ) ) ( AIRPORT ?AUTO_8131 ) ( AIRPORT ?AUTO_8132 ) ( not ( = ?AUTO_8131 ?AUTO_8132 ) ) ( not ( = ?AUTO_8129 ?AUTO_8131 ) ) ( OBJ-AT ?AUTO_8128 ?AUTO_8131 ) ( AIRPLANE-AT ?AUTO_8134 ?AUTO_8132 ) ( TRUCK-AT ?AUTO_8133 ?AUTO_8135 ) ( IN-CITY ?AUTO_8135 ?AUTO_8130 ) ( not ( = ?AUTO_8129 ?AUTO_8135 ) ) ( not ( = ?AUTO_8132 ?AUTO_8135 ) ) ( not ( = ?AUTO_8131 ?AUTO_8135 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8133 ?AUTO_8135 ?AUTO_8129 ?AUTO_8130 )
      ( DELIVER-PKG ?AUTO_8128 ?AUTO_8129 )
      ( DELIVER-PKG-VERIFY ?AUTO_8128 ?AUTO_8129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8146 - OBJ
      ?AUTO_8147 - LOCATION
    )
    :vars
    (
      ?AUTO_8152 - LOCATION
      ?AUTO_8151 - CITY
      ?AUTO_8150 - LOCATION
      ?AUTO_8153 - AIRPLANE
      ?AUTO_8148 - TRUCK
      ?AUTO_8149 - LOCATION
      ?AUTO_8154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8152 ?AUTO_8151 ) ( IN-CITY ?AUTO_8147 ?AUTO_8151 ) ( not ( = ?AUTO_8147 ?AUTO_8152 ) ) ( AIRPORT ?AUTO_8150 ) ( AIRPORT ?AUTO_8152 ) ( not ( = ?AUTO_8150 ?AUTO_8152 ) ) ( not ( = ?AUTO_8147 ?AUTO_8150 ) ) ( AIRPLANE-AT ?AUTO_8153 ?AUTO_8152 ) ( TRUCK-AT ?AUTO_8148 ?AUTO_8149 ) ( IN-CITY ?AUTO_8149 ?AUTO_8151 ) ( not ( = ?AUTO_8147 ?AUTO_8149 ) ) ( not ( = ?AUTO_8152 ?AUTO_8149 ) ) ( not ( = ?AUTO_8150 ?AUTO_8149 ) ) ( TRUCK-AT ?AUTO_8154 ?AUTO_8150 ) ( IN-TRUCK ?AUTO_8146 ?AUTO_8154 ) ( not ( = ?AUTO_8148 ?AUTO_8154 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8146 ?AUTO_8154 ?AUTO_8150 )
      ( DELIVER-PKG ?AUTO_8146 ?AUTO_8147 )
      ( DELIVER-PKG-VERIFY ?AUTO_8146 ?AUTO_8147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8155 - OBJ
      ?AUTO_8156 - LOCATION
    )
    :vars
    (
      ?AUTO_8161 - LOCATION
      ?AUTO_8160 - CITY
      ?AUTO_8159 - LOCATION
      ?AUTO_8162 - AIRPLANE
      ?AUTO_8158 - TRUCK
      ?AUTO_8157 - LOCATION
      ?AUTO_8163 - TRUCK
      ?AUTO_8164 - LOCATION
      ?AUTO_8165 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8161 ?AUTO_8160 ) ( IN-CITY ?AUTO_8156 ?AUTO_8160 ) ( not ( = ?AUTO_8156 ?AUTO_8161 ) ) ( AIRPORT ?AUTO_8159 ) ( AIRPORT ?AUTO_8161 ) ( not ( = ?AUTO_8159 ?AUTO_8161 ) ) ( not ( = ?AUTO_8156 ?AUTO_8159 ) ) ( AIRPLANE-AT ?AUTO_8162 ?AUTO_8161 ) ( TRUCK-AT ?AUTO_8158 ?AUTO_8157 ) ( IN-CITY ?AUTO_8157 ?AUTO_8160 ) ( not ( = ?AUTO_8156 ?AUTO_8157 ) ) ( not ( = ?AUTO_8161 ?AUTO_8157 ) ) ( not ( = ?AUTO_8159 ?AUTO_8157 ) ) ( IN-TRUCK ?AUTO_8155 ?AUTO_8163 ) ( not ( = ?AUTO_8158 ?AUTO_8163 ) ) ( TRUCK-AT ?AUTO_8163 ?AUTO_8164 ) ( IN-CITY ?AUTO_8164 ?AUTO_8165 ) ( IN-CITY ?AUTO_8159 ?AUTO_8165 ) ( not ( = ?AUTO_8159 ?AUTO_8164 ) ) ( not ( = ?AUTO_8156 ?AUTO_8164 ) ) ( not ( = ?AUTO_8161 ?AUTO_8164 ) ) ( not ( = ?AUTO_8160 ?AUTO_8165 ) ) ( not ( = ?AUTO_8157 ?AUTO_8164 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8163 ?AUTO_8164 ?AUTO_8159 ?AUTO_8165 )
      ( DELIVER-PKG ?AUTO_8155 ?AUTO_8156 )
      ( DELIVER-PKG-VERIFY ?AUTO_8155 ?AUTO_8156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8166 - OBJ
      ?AUTO_8167 - LOCATION
    )
    :vars
    (
      ?AUTO_8170 - LOCATION
      ?AUTO_8174 - CITY
      ?AUTO_8173 - LOCATION
      ?AUTO_8175 - AIRPLANE
      ?AUTO_8168 - TRUCK
      ?AUTO_8169 - LOCATION
      ?AUTO_8176 - TRUCK
      ?AUTO_8172 - LOCATION
      ?AUTO_8171 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8170 ?AUTO_8174 ) ( IN-CITY ?AUTO_8167 ?AUTO_8174 ) ( not ( = ?AUTO_8167 ?AUTO_8170 ) ) ( AIRPORT ?AUTO_8173 ) ( AIRPORT ?AUTO_8170 ) ( not ( = ?AUTO_8173 ?AUTO_8170 ) ) ( not ( = ?AUTO_8167 ?AUTO_8173 ) ) ( AIRPLANE-AT ?AUTO_8175 ?AUTO_8170 ) ( TRUCK-AT ?AUTO_8168 ?AUTO_8169 ) ( IN-CITY ?AUTO_8169 ?AUTO_8174 ) ( not ( = ?AUTO_8167 ?AUTO_8169 ) ) ( not ( = ?AUTO_8170 ?AUTO_8169 ) ) ( not ( = ?AUTO_8173 ?AUTO_8169 ) ) ( not ( = ?AUTO_8168 ?AUTO_8176 ) ) ( TRUCK-AT ?AUTO_8176 ?AUTO_8172 ) ( IN-CITY ?AUTO_8172 ?AUTO_8171 ) ( IN-CITY ?AUTO_8173 ?AUTO_8171 ) ( not ( = ?AUTO_8173 ?AUTO_8172 ) ) ( not ( = ?AUTO_8167 ?AUTO_8172 ) ) ( not ( = ?AUTO_8170 ?AUTO_8172 ) ) ( not ( = ?AUTO_8174 ?AUTO_8171 ) ) ( not ( = ?AUTO_8169 ?AUTO_8172 ) ) ( OBJ-AT ?AUTO_8166 ?AUTO_8172 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8166 ?AUTO_8176 ?AUTO_8172 )
      ( DELIVER-PKG ?AUTO_8166 ?AUTO_8167 )
      ( DELIVER-PKG-VERIFY ?AUTO_8166 ?AUTO_8167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8177 - OBJ
      ?AUTO_8178 - LOCATION
    )
    :vars
    (
      ?AUTO_8181 - LOCATION
      ?AUTO_8187 - CITY
      ?AUTO_8183 - LOCATION
      ?AUTO_8182 - AIRPLANE
      ?AUTO_8185 - TRUCK
      ?AUTO_8179 - LOCATION
      ?AUTO_8186 - TRUCK
      ?AUTO_8184 - LOCATION
      ?AUTO_8180 - CITY
      ?AUTO_8188 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8181 ?AUTO_8187 ) ( IN-CITY ?AUTO_8178 ?AUTO_8187 ) ( not ( = ?AUTO_8178 ?AUTO_8181 ) ) ( AIRPORT ?AUTO_8183 ) ( AIRPORT ?AUTO_8181 ) ( not ( = ?AUTO_8183 ?AUTO_8181 ) ) ( not ( = ?AUTO_8178 ?AUTO_8183 ) ) ( AIRPLANE-AT ?AUTO_8182 ?AUTO_8181 ) ( TRUCK-AT ?AUTO_8185 ?AUTO_8179 ) ( IN-CITY ?AUTO_8179 ?AUTO_8187 ) ( not ( = ?AUTO_8178 ?AUTO_8179 ) ) ( not ( = ?AUTO_8181 ?AUTO_8179 ) ) ( not ( = ?AUTO_8183 ?AUTO_8179 ) ) ( not ( = ?AUTO_8185 ?AUTO_8186 ) ) ( IN-CITY ?AUTO_8184 ?AUTO_8180 ) ( IN-CITY ?AUTO_8183 ?AUTO_8180 ) ( not ( = ?AUTO_8183 ?AUTO_8184 ) ) ( not ( = ?AUTO_8178 ?AUTO_8184 ) ) ( not ( = ?AUTO_8181 ?AUTO_8184 ) ) ( not ( = ?AUTO_8187 ?AUTO_8180 ) ) ( not ( = ?AUTO_8179 ?AUTO_8184 ) ) ( OBJ-AT ?AUTO_8177 ?AUTO_8184 ) ( TRUCK-AT ?AUTO_8186 ?AUTO_8188 ) ( IN-CITY ?AUTO_8188 ?AUTO_8180 ) ( not ( = ?AUTO_8184 ?AUTO_8188 ) ) ( not ( = ?AUTO_8178 ?AUTO_8188 ) ) ( not ( = ?AUTO_8181 ?AUTO_8188 ) ) ( not ( = ?AUTO_8183 ?AUTO_8188 ) ) ( not ( = ?AUTO_8179 ?AUTO_8188 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8186 ?AUTO_8188 ?AUTO_8184 ?AUTO_8180 )
      ( DELIVER-PKG ?AUTO_8177 ?AUTO_8178 )
      ( DELIVER-PKG-VERIFY ?AUTO_8177 ?AUTO_8178 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8191 - OBJ
      ?AUTO_8192 - LOCATION
    )
    :vars
    (
      ?AUTO_8193 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8191 ?AUTO_8193 ) ( AIRPLANE-AT ?AUTO_8193 ?AUTO_8192 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8191 ?AUTO_8193 ?AUTO_8192 )
      ( DELIVER-PKG-VERIFY ?AUTO_8191 ?AUTO_8192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8194 - OBJ
      ?AUTO_8195 - LOCATION
    )
    :vars
    (
      ?AUTO_8196 - AIRPLANE
      ?AUTO_8197 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8194 ?AUTO_8196 ) ( AIRPORT ?AUTO_8197 ) ( AIRPORT ?AUTO_8195 ) ( AIRPLANE-AT ?AUTO_8196 ?AUTO_8197 ) ( not ( = ?AUTO_8197 ?AUTO_8195 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8196 ?AUTO_8197 ?AUTO_8195 )
      ( DELIVER-PKG ?AUTO_8194 ?AUTO_8195 )
      ( DELIVER-PKG-VERIFY ?AUTO_8194 ?AUTO_8195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8198 - OBJ
      ?AUTO_8199 - LOCATION
    )
    :vars
    (
      ?AUTO_8201 - LOCATION
      ?AUTO_8200 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8201 ) ( AIRPORT ?AUTO_8199 ) ( AIRPLANE-AT ?AUTO_8200 ?AUTO_8201 ) ( not ( = ?AUTO_8201 ?AUTO_8199 ) ) ( OBJ-AT ?AUTO_8198 ?AUTO_8201 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8198 ?AUTO_8200 ?AUTO_8201 )
      ( DELIVER-PKG ?AUTO_8198 ?AUTO_8199 )
      ( DELIVER-PKG-VERIFY ?AUTO_8198 ?AUTO_8199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8202 - OBJ
      ?AUTO_8203 - LOCATION
    )
    :vars
    (
      ?AUTO_8205 - LOCATION
      ?AUTO_8204 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8205 ) ( AIRPORT ?AUTO_8203 ) ( not ( = ?AUTO_8205 ?AUTO_8203 ) ) ( OBJ-AT ?AUTO_8202 ?AUTO_8205 ) ( AIRPLANE-AT ?AUTO_8204 ?AUTO_8203 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8204 ?AUTO_8203 ?AUTO_8205 )
      ( DELIVER-PKG ?AUTO_8202 ?AUTO_8203 )
      ( DELIVER-PKG-VERIFY ?AUTO_8202 ?AUTO_8203 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8218 - OBJ
      ?AUTO_8219 - LOCATION
    )
    :vars
    (
      ?AUTO_8221 - LOCATION
      ?AUTO_8220 - AIRPLANE
      ?AUTO_8222 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8221 ) ( AIRPORT ?AUTO_8219 ) ( not ( = ?AUTO_8221 ?AUTO_8219 ) ) ( AIRPLANE-AT ?AUTO_8220 ?AUTO_8219 ) ( TRUCK-AT ?AUTO_8222 ?AUTO_8221 ) ( IN-TRUCK ?AUTO_8218 ?AUTO_8222 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8218 ?AUTO_8222 ?AUTO_8221 )
      ( DELIVER-PKG ?AUTO_8218 ?AUTO_8219 )
      ( DELIVER-PKG-VERIFY ?AUTO_8218 ?AUTO_8219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8223 - OBJ
      ?AUTO_8224 - LOCATION
    )
    :vars
    (
      ?AUTO_8226 - LOCATION
      ?AUTO_8225 - AIRPLANE
      ?AUTO_8227 - TRUCK
      ?AUTO_8228 - LOCATION
      ?AUTO_8229 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8226 ) ( AIRPORT ?AUTO_8224 ) ( not ( = ?AUTO_8226 ?AUTO_8224 ) ) ( AIRPLANE-AT ?AUTO_8225 ?AUTO_8224 ) ( IN-TRUCK ?AUTO_8223 ?AUTO_8227 ) ( TRUCK-AT ?AUTO_8227 ?AUTO_8228 ) ( IN-CITY ?AUTO_8228 ?AUTO_8229 ) ( IN-CITY ?AUTO_8226 ?AUTO_8229 ) ( not ( = ?AUTO_8226 ?AUTO_8228 ) ) ( not ( = ?AUTO_8224 ?AUTO_8228 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8227 ?AUTO_8228 ?AUTO_8226 ?AUTO_8229 )
      ( DELIVER-PKG ?AUTO_8223 ?AUTO_8224 )
      ( DELIVER-PKG-VERIFY ?AUTO_8223 ?AUTO_8224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8234 - OBJ
      ?AUTO_8235 - LOCATION
    )
    :vars
    (
      ?AUTO_8240 - LOCATION
      ?AUTO_8237 - TRUCK
      ?AUTO_8236 - LOCATION
      ?AUTO_8239 - CITY
      ?AUTO_8238 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8240 ) ( AIRPORT ?AUTO_8235 ) ( not ( = ?AUTO_8240 ?AUTO_8235 ) ) ( IN-TRUCK ?AUTO_8234 ?AUTO_8237 ) ( TRUCK-AT ?AUTO_8237 ?AUTO_8236 ) ( IN-CITY ?AUTO_8236 ?AUTO_8239 ) ( IN-CITY ?AUTO_8240 ?AUTO_8239 ) ( not ( = ?AUTO_8240 ?AUTO_8236 ) ) ( not ( = ?AUTO_8235 ?AUTO_8236 ) ) ( AIRPLANE-AT ?AUTO_8238 ?AUTO_8240 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8238 ?AUTO_8240 ?AUTO_8235 )
      ( DELIVER-PKG ?AUTO_8234 ?AUTO_8235 )
      ( DELIVER-PKG-VERIFY ?AUTO_8234 ?AUTO_8235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8243 - OBJ
      ?AUTO_8244 - LOCATION
    )
    :vars
    (
      ?AUTO_8248 - LOCATION
      ?AUTO_8246 - TRUCK
      ?AUTO_8247 - LOCATION
      ?AUTO_8245 - CITY
      ?AUTO_8250 - LOCATION
      ?AUTO_8249 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8248 ) ( AIRPORT ?AUTO_8244 ) ( not ( = ?AUTO_8248 ?AUTO_8244 ) ) ( IN-TRUCK ?AUTO_8243 ?AUTO_8246 ) ( TRUCK-AT ?AUTO_8246 ?AUTO_8247 ) ( IN-CITY ?AUTO_8247 ?AUTO_8245 ) ( IN-CITY ?AUTO_8248 ?AUTO_8245 ) ( not ( = ?AUTO_8248 ?AUTO_8247 ) ) ( not ( = ?AUTO_8244 ?AUTO_8247 ) ) ( AIRPORT ?AUTO_8250 ) ( AIRPLANE-AT ?AUTO_8249 ?AUTO_8250 ) ( not ( = ?AUTO_8250 ?AUTO_8248 ) ) ( not ( = ?AUTO_8244 ?AUTO_8250 ) ) ( not ( = ?AUTO_8247 ?AUTO_8250 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8249 ?AUTO_8250 ?AUTO_8248 )
      ( DELIVER-PKG ?AUTO_8243 ?AUTO_8244 )
      ( DELIVER-PKG-VERIFY ?AUTO_8243 ?AUTO_8244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8279 - OBJ
      ?AUTO_8280 - LOCATION
    )
    :vars
    (
      ?AUTO_8285 - LOCATION
      ?AUTO_8281 - TRUCK
      ?AUTO_8283 - LOCATION
      ?AUTO_8284 - CITY
      ?AUTO_8282 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8285 ) ( AIRPORT ?AUTO_8280 ) ( not ( = ?AUTO_8285 ?AUTO_8280 ) ) ( TRUCK-AT ?AUTO_8281 ?AUTO_8283 ) ( IN-CITY ?AUTO_8283 ?AUTO_8284 ) ( IN-CITY ?AUTO_8285 ?AUTO_8284 ) ( not ( = ?AUTO_8285 ?AUTO_8283 ) ) ( not ( = ?AUTO_8280 ?AUTO_8283 ) ) ( AIRPLANE-AT ?AUTO_8282 ?AUTO_8285 ) ( OBJ-AT ?AUTO_8279 ?AUTO_8283 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8279 ?AUTO_8281 ?AUTO_8283 )
      ( DELIVER-PKG ?AUTO_8279 ?AUTO_8280 )
      ( DELIVER-PKG-VERIFY ?AUTO_8279 ?AUTO_8280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8286 - OBJ
      ?AUTO_8287 - LOCATION
    )
    :vars
    (
      ?AUTO_8289 - LOCATION
      ?AUTO_8288 - LOCATION
      ?AUTO_8290 - CITY
      ?AUTO_8291 - AIRPLANE
      ?AUTO_8292 - TRUCK
      ?AUTO_8293 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8289 ) ( AIRPORT ?AUTO_8287 ) ( not ( = ?AUTO_8289 ?AUTO_8287 ) ) ( IN-CITY ?AUTO_8288 ?AUTO_8290 ) ( IN-CITY ?AUTO_8289 ?AUTO_8290 ) ( not ( = ?AUTO_8289 ?AUTO_8288 ) ) ( not ( = ?AUTO_8287 ?AUTO_8288 ) ) ( AIRPLANE-AT ?AUTO_8291 ?AUTO_8289 ) ( OBJ-AT ?AUTO_8286 ?AUTO_8288 ) ( TRUCK-AT ?AUTO_8292 ?AUTO_8293 ) ( IN-CITY ?AUTO_8293 ?AUTO_8290 ) ( not ( = ?AUTO_8288 ?AUTO_8293 ) ) ( not ( = ?AUTO_8287 ?AUTO_8293 ) ) ( not ( = ?AUTO_8289 ?AUTO_8293 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8292 ?AUTO_8293 ?AUTO_8288 ?AUTO_8290 )
      ( DELIVER-PKG ?AUTO_8286 ?AUTO_8287 )
      ( DELIVER-PKG-VERIFY ?AUTO_8286 ?AUTO_8287 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8306 - OBJ
      ?AUTO_8307 - LOCATION
    )
    :vars
    (
      ?AUTO_8308 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8308 ?AUTO_8307 ) ( IN-TRUCK ?AUTO_8306 ?AUTO_8308 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8306 ?AUTO_8308 ?AUTO_8307 )
      ( DELIVER-PKG-VERIFY ?AUTO_8306 ?AUTO_8307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8309 - OBJ
      ?AUTO_8310 - LOCATION
    )
    :vars
    (
      ?AUTO_8311 - TRUCK
      ?AUTO_8312 - LOCATION
      ?AUTO_8313 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8309 ?AUTO_8311 ) ( TRUCK-AT ?AUTO_8311 ?AUTO_8312 ) ( IN-CITY ?AUTO_8312 ?AUTO_8313 ) ( IN-CITY ?AUTO_8310 ?AUTO_8313 ) ( not ( = ?AUTO_8310 ?AUTO_8312 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8311 ?AUTO_8312 ?AUTO_8310 ?AUTO_8313 )
      ( DELIVER-PKG ?AUTO_8309 ?AUTO_8310 )
      ( DELIVER-PKG-VERIFY ?AUTO_8309 ?AUTO_8310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8314 - OBJ
      ?AUTO_8315 - LOCATION
    )
    :vars
    (
      ?AUTO_8316 - TRUCK
      ?AUTO_8317 - LOCATION
      ?AUTO_8318 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8316 ?AUTO_8317 ) ( IN-CITY ?AUTO_8317 ?AUTO_8318 ) ( IN-CITY ?AUTO_8315 ?AUTO_8318 ) ( not ( = ?AUTO_8315 ?AUTO_8317 ) ) ( OBJ-AT ?AUTO_8314 ?AUTO_8317 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8314 ?AUTO_8316 ?AUTO_8317 )
      ( DELIVER-PKG ?AUTO_8314 ?AUTO_8315 )
      ( DELIVER-PKG-VERIFY ?AUTO_8314 ?AUTO_8315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8319 - OBJ
      ?AUTO_8320 - LOCATION
    )
    :vars
    (
      ?AUTO_8321 - LOCATION
      ?AUTO_8323 - CITY
      ?AUTO_8322 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8321 ?AUTO_8323 ) ( IN-CITY ?AUTO_8320 ?AUTO_8323 ) ( not ( = ?AUTO_8320 ?AUTO_8321 ) ) ( OBJ-AT ?AUTO_8319 ?AUTO_8321 ) ( TRUCK-AT ?AUTO_8322 ?AUTO_8320 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8322 ?AUTO_8320 ?AUTO_8321 ?AUTO_8323 )
      ( DELIVER-PKG ?AUTO_8319 ?AUTO_8320 )
      ( DELIVER-PKG-VERIFY ?AUTO_8319 ?AUTO_8320 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8352 - OBJ
      ?AUTO_8353 - LOCATION
    )
    :vars
    (
      ?AUTO_8356 - LOCATION
      ?AUTO_8355 - CITY
      ?AUTO_8354 - TRUCK
      ?AUTO_8357 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8356 ?AUTO_8355 ) ( IN-CITY ?AUTO_8353 ?AUTO_8355 ) ( not ( = ?AUTO_8353 ?AUTO_8356 ) ) ( OBJ-AT ?AUTO_8352 ?AUTO_8356 ) ( TRUCK-AT ?AUTO_8354 ?AUTO_8357 ) ( IN-CITY ?AUTO_8357 ?AUTO_8355 ) ( not ( = ?AUTO_8353 ?AUTO_8357 ) ) ( not ( = ?AUTO_8356 ?AUTO_8357 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8354 ?AUTO_8357 ?AUTO_8353 ?AUTO_8355 )
      ( DELIVER-PKG ?AUTO_8352 ?AUTO_8353 )
      ( DELIVER-PKG-VERIFY ?AUTO_8352 ?AUTO_8353 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8408 - OBJ
      ?AUTO_8409 - LOCATION
    )
    :vars
    (
      ?AUTO_8410 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8408 ?AUTO_8410 ) ( AIRPLANE-AT ?AUTO_8410 ?AUTO_8409 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8408 ?AUTO_8410 ?AUTO_8409 )
      ( DELIVER-PKG-VERIFY ?AUTO_8408 ?AUTO_8409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8411 - OBJ
      ?AUTO_8412 - LOCATION
    )
    :vars
    (
      ?AUTO_8413 - AIRPLANE
      ?AUTO_8414 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8411 ?AUTO_8413 ) ( AIRPORT ?AUTO_8414 ) ( AIRPORT ?AUTO_8412 ) ( AIRPLANE-AT ?AUTO_8413 ?AUTO_8414 ) ( not ( = ?AUTO_8414 ?AUTO_8412 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8413 ?AUTO_8414 ?AUTO_8412 )
      ( DELIVER-PKG ?AUTO_8411 ?AUTO_8412 )
      ( DELIVER-PKG-VERIFY ?AUTO_8411 ?AUTO_8412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8415 - OBJ
      ?AUTO_8416 - LOCATION
    )
    :vars
    (
      ?AUTO_8418 - LOCATION
      ?AUTO_8417 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8418 ) ( AIRPORT ?AUTO_8416 ) ( AIRPLANE-AT ?AUTO_8417 ?AUTO_8418 ) ( not ( = ?AUTO_8418 ?AUTO_8416 ) ) ( OBJ-AT ?AUTO_8415 ?AUTO_8418 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8415 ?AUTO_8417 ?AUTO_8418 )
      ( DELIVER-PKG ?AUTO_8415 ?AUTO_8416 )
      ( DELIVER-PKG-VERIFY ?AUTO_8415 ?AUTO_8416 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8419 - OBJ
      ?AUTO_8420 - LOCATION
    )
    :vars
    (
      ?AUTO_8422 - LOCATION
      ?AUTO_8421 - AIRPLANE
      ?AUTO_8423 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8422 ) ( AIRPORT ?AUTO_8420 ) ( AIRPLANE-AT ?AUTO_8421 ?AUTO_8422 ) ( not ( = ?AUTO_8422 ?AUTO_8420 ) ) ( TRUCK-AT ?AUTO_8423 ?AUTO_8422 ) ( IN-TRUCK ?AUTO_8419 ?AUTO_8423 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8419 ?AUTO_8423 ?AUTO_8422 )
      ( DELIVER-PKG ?AUTO_8419 ?AUTO_8420 )
      ( DELIVER-PKG-VERIFY ?AUTO_8419 ?AUTO_8420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8424 - OBJ
      ?AUTO_8425 - LOCATION
    )
    :vars
    (
      ?AUTO_8427 - LOCATION
      ?AUTO_8426 - AIRPLANE
      ?AUTO_8428 - TRUCK
      ?AUTO_8429 - LOCATION
      ?AUTO_8430 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8427 ) ( AIRPORT ?AUTO_8425 ) ( AIRPLANE-AT ?AUTO_8426 ?AUTO_8427 ) ( not ( = ?AUTO_8427 ?AUTO_8425 ) ) ( IN-TRUCK ?AUTO_8424 ?AUTO_8428 ) ( TRUCK-AT ?AUTO_8428 ?AUTO_8429 ) ( IN-CITY ?AUTO_8429 ?AUTO_8430 ) ( IN-CITY ?AUTO_8427 ?AUTO_8430 ) ( not ( = ?AUTO_8427 ?AUTO_8429 ) ) ( not ( = ?AUTO_8425 ?AUTO_8429 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8428 ?AUTO_8429 ?AUTO_8427 ?AUTO_8430 )
      ( DELIVER-PKG ?AUTO_8424 ?AUTO_8425 )
      ( DELIVER-PKG-VERIFY ?AUTO_8424 ?AUTO_8425 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8431 - OBJ
      ?AUTO_8432 - LOCATION
    )
    :vars
    (
      ?AUTO_8434 - LOCATION
      ?AUTO_8433 - AIRPLANE
      ?AUTO_8435 - TRUCK
      ?AUTO_8437 - LOCATION
      ?AUTO_8436 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8434 ) ( AIRPORT ?AUTO_8432 ) ( AIRPLANE-AT ?AUTO_8433 ?AUTO_8434 ) ( not ( = ?AUTO_8434 ?AUTO_8432 ) ) ( TRUCK-AT ?AUTO_8435 ?AUTO_8437 ) ( IN-CITY ?AUTO_8437 ?AUTO_8436 ) ( IN-CITY ?AUTO_8434 ?AUTO_8436 ) ( not ( = ?AUTO_8434 ?AUTO_8437 ) ) ( not ( = ?AUTO_8432 ?AUTO_8437 ) ) ( OBJ-AT ?AUTO_8431 ?AUTO_8437 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8431 ?AUTO_8435 ?AUTO_8437 )
      ( DELIVER-PKG ?AUTO_8431 ?AUTO_8432 )
      ( DELIVER-PKG-VERIFY ?AUTO_8431 ?AUTO_8432 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8438 - OBJ
      ?AUTO_8439 - LOCATION
    )
    :vars
    (
      ?AUTO_8440 - LOCATION
      ?AUTO_8444 - AIRPLANE
      ?AUTO_8441 - LOCATION
      ?AUTO_8443 - CITY
      ?AUTO_8442 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8440 ) ( AIRPORT ?AUTO_8439 ) ( AIRPLANE-AT ?AUTO_8444 ?AUTO_8440 ) ( not ( = ?AUTO_8440 ?AUTO_8439 ) ) ( IN-CITY ?AUTO_8441 ?AUTO_8443 ) ( IN-CITY ?AUTO_8440 ?AUTO_8443 ) ( not ( = ?AUTO_8440 ?AUTO_8441 ) ) ( not ( = ?AUTO_8439 ?AUTO_8441 ) ) ( OBJ-AT ?AUTO_8438 ?AUTO_8441 ) ( TRUCK-AT ?AUTO_8442 ?AUTO_8440 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8442 ?AUTO_8440 ?AUTO_8441 ?AUTO_8443 )
      ( DELIVER-PKG ?AUTO_8438 ?AUTO_8439 )
      ( DELIVER-PKG-VERIFY ?AUTO_8438 ?AUTO_8439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8449 - OBJ
      ?AUTO_8450 - LOCATION
    )
    :vars
    (
      ?AUTO_8454 - LOCATION
      ?AUTO_8451 - LOCATION
      ?AUTO_8453 - CITY
      ?AUTO_8452 - TRUCK
      ?AUTO_8456 - LOCATION
      ?AUTO_8455 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8454 ) ( AIRPORT ?AUTO_8450 ) ( not ( = ?AUTO_8454 ?AUTO_8450 ) ) ( IN-CITY ?AUTO_8451 ?AUTO_8453 ) ( IN-CITY ?AUTO_8454 ?AUTO_8453 ) ( not ( = ?AUTO_8454 ?AUTO_8451 ) ) ( not ( = ?AUTO_8450 ?AUTO_8451 ) ) ( OBJ-AT ?AUTO_8449 ?AUTO_8451 ) ( TRUCK-AT ?AUTO_8452 ?AUTO_8454 ) ( AIRPORT ?AUTO_8456 ) ( AIRPLANE-AT ?AUTO_8455 ?AUTO_8456 ) ( not ( = ?AUTO_8456 ?AUTO_8454 ) ) ( not ( = ?AUTO_8450 ?AUTO_8456 ) ) ( not ( = ?AUTO_8451 ?AUTO_8456 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8455 ?AUTO_8456 ?AUTO_8454 )
      ( DELIVER-PKG ?AUTO_8449 ?AUTO_8450 )
      ( DELIVER-PKG-VERIFY ?AUTO_8449 ?AUTO_8450 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8505 - OBJ
      ?AUTO_8506 - LOCATION
    )
    :vars
    (
      ?AUTO_8512 - LOCATION
      ?AUTO_8507 - LOCATION
      ?AUTO_8510 - CITY
      ?AUTO_8509 - LOCATION
      ?AUTO_8511 - AIRPLANE
      ?AUTO_8508 - TRUCK
      ?AUTO_8513 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8512 ) ( AIRPORT ?AUTO_8506 ) ( not ( = ?AUTO_8512 ?AUTO_8506 ) ) ( IN-CITY ?AUTO_8507 ?AUTO_8510 ) ( IN-CITY ?AUTO_8512 ?AUTO_8510 ) ( not ( = ?AUTO_8512 ?AUTO_8507 ) ) ( not ( = ?AUTO_8506 ?AUTO_8507 ) ) ( OBJ-AT ?AUTO_8505 ?AUTO_8507 ) ( AIRPORT ?AUTO_8509 ) ( AIRPLANE-AT ?AUTO_8511 ?AUTO_8509 ) ( not ( = ?AUTO_8509 ?AUTO_8512 ) ) ( not ( = ?AUTO_8506 ?AUTO_8509 ) ) ( not ( = ?AUTO_8507 ?AUTO_8509 ) ) ( TRUCK-AT ?AUTO_8508 ?AUTO_8513 ) ( IN-CITY ?AUTO_8513 ?AUTO_8510 ) ( not ( = ?AUTO_8512 ?AUTO_8513 ) ) ( not ( = ?AUTO_8506 ?AUTO_8513 ) ) ( not ( = ?AUTO_8507 ?AUTO_8513 ) ) ( not ( = ?AUTO_8509 ?AUTO_8513 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8508 ?AUTO_8513 ?AUTO_8512 ?AUTO_8510 )
      ( DELIVER-PKG ?AUTO_8505 ?AUTO_8506 )
      ( DELIVER-PKG-VERIFY ?AUTO_8505 ?AUTO_8506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8538 - OBJ
      ?AUTO_8539 - LOCATION
    )
    :vars
    (
      ?AUTO_8540 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8538 ?AUTO_8540 ) ( AIRPLANE-AT ?AUTO_8540 ?AUTO_8539 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8538 ?AUTO_8540 ?AUTO_8539 )
      ( DELIVER-PKG-VERIFY ?AUTO_8538 ?AUTO_8539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8541 - OBJ
      ?AUTO_8542 - LOCATION
    )
    :vars
    (
      ?AUTO_8543 - AIRPLANE
      ?AUTO_8544 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8541 ?AUTO_8543 ) ( AIRPORT ?AUTO_8544 ) ( AIRPORT ?AUTO_8542 ) ( AIRPLANE-AT ?AUTO_8543 ?AUTO_8544 ) ( not ( = ?AUTO_8544 ?AUTO_8542 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8543 ?AUTO_8544 ?AUTO_8542 )
      ( DELIVER-PKG ?AUTO_8541 ?AUTO_8542 )
      ( DELIVER-PKG-VERIFY ?AUTO_8541 ?AUTO_8542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8547 - OBJ
      ?AUTO_8548 - LOCATION
    )
    :vars
    (
      ?AUTO_8550 - LOCATION
      ?AUTO_8549 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8550 ) ( AIRPORT ?AUTO_8548 ) ( AIRPLANE-AT ?AUTO_8549 ?AUTO_8550 ) ( not ( = ?AUTO_8550 ?AUTO_8548 ) ) ( OBJ-AT ?AUTO_8547 ?AUTO_8550 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8547 ?AUTO_8549 ?AUTO_8550 )
      ( DELIVER-PKG ?AUTO_8547 ?AUTO_8548 )
      ( DELIVER-PKG-VERIFY ?AUTO_8547 ?AUTO_8548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8551 - OBJ
      ?AUTO_8552 - LOCATION
    )
    :vars
    (
      ?AUTO_8554 - LOCATION
      ?AUTO_8555 - LOCATION
      ?AUTO_8553 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8554 ) ( AIRPORT ?AUTO_8552 ) ( not ( = ?AUTO_8554 ?AUTO_8552 ) ) ( OBJ-AT ?AUTO_8551 ?AUTO_8554 ) ( AIRPORT ?AUTO_8555 ) ( AIRPLANE-AT ?AUTO_8553 ?AUTO_8555 ) ( not ( = ?AUTO_8555 ?AUTO_8554 ) ) ( not ( = ?AUTO_8552 ?AUTO_8555 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8553 ?AUTO_8555 ?AUTO_8554 )
      ( DELIVER-PKG ?AUTO_8551 ?AUTO_8552 )
      ( DELIVER-PKG-VERIFY ?AUTO_8551 ?AUTO_8552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8558 - OBJ
      ?AUTO_8559 - LOCATION
    )
    :vars
    (
      ?AUTO_8562 - LOCATION
      ?AUTO_8560 - LOCATION
      ?AUTO_8561 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8562 ) ( AIRPORT ?AUTO_8559 ) ( not ( = ?AUTO_8562 ?AUTO_8559 ) ) ( OBJ-AT ?AUTO_8558 ?AUTO_8562 ) ( AIRPORT ?AUTO_8560 ) ( not ( = ?AUTO_8560 ?AUTO_8562 ) ) ( not ( = ?AUTO_8559 ?AUTO_8560 ) ) ( AIRPLANE-AT ?AUTO_8561 ?AUTO_8559 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8561 ?AUTO_8559 ?AUTO_8560 )
      ( DELIVER-PKG ?AUTO_8558 ?AUTO_8559 )
      ( DELIVER-PKG-VERIFY ?AUTO_8558 ?AUTO_8559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8593 - OBJ
      ?AUTO_8594 - LOCATION
    )
    :vars
    (
      ?AUTO_8596 - LOCATION
      ?AUTO_8597 - LOCATION
      ?AUTO_8595 - AIRPLANE
      ?AUTO_8598 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8596 ) ( AIRPORT ?AUTO_8594 ) ( not ( = ?AUTO_8596 ?AUTO_8594 ) ) ( AIRPORT ?AUTO_8597 ) ( not ( = ?AUTO_8597 ?AUTO_8596 ) ) ( not ( = ?AUTO_8594 ?AUTO_8597 ) ) ( AIRPLANE-AT ?AUTO_8595 ?AUTO_8594 ) ( TRUCK-AT ?AUTO_8598 ?AUTO_8596 ) ( IN-TRUCK ?AUTO_8593 ?AUTO_8598 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8593 ?AUTO_8598 ?AUTO_8596 )
      ( DELIVER-PKG ?AUTO_8593 ?AUTO_8594 )
      ( DELIVER-PKG-VERIFY ?AUTO_8593 ?AUTO_8594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8635 - OBJ
      ?AUTO_8636 - LOCATION
    )
    :vars
    (
      ?AUTO_8639 - LOCATION
      ?AUTO_8638 - AIRPLANE
      ?AUTO_8641 - LOCATION
      ?AUTO_8637 - CITY
      ?AUTO_8640 - TRUCK
      ?AUTO_8642 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8639 ) ( AIRPORT ?AUTO_8636 ) ( AIRPLANE-AT ?AUTO_8638 ?AUTO_8639 ) ( not ( = ?AUTO_8639 ?AUTO_8636 ) ) ( IN-CITY ?AUTO_8641 ?AUTO_8637 ) ( IN-CITY ?AUTO_8639 ?AUTO_8637 ) ( not ( = ?AUTO_8639 ?AUTO_8641 ) ) ( not ( = ?AUTO_8636 ?AUTO_8641 ) ) ( OBJ-AT ?AUTO_8635 ?AUTO_8641 ) ( TRUCK-AT ?AUTO_8640 ?AUTO_8642 ) ( IN-CITY ?AUTO_8642 ?AUTO_8637 ) ( not ( = ?AUTO_8641 ?AUTO_8642 ) ) ( not ( = ?AUTO_8636 ?AUTO_8642 ) ) ( not ( = ?AUTO_8639 ?AUTO_8642 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8640 ?AUTO_8642 ?AUTO_8641 ?AUTO_8637 )
      ( DELIVER-PKG ?AUTO_8635 ?AUTO_8636 )
      ( DELIVER-PKG-VERIFY ?AUTO_8635 ?AUTO_8636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8663 - OBJ
      ?AUTO_8664 - LOCATION
    )
    :vars
    (
      ?AUTO_8665 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8665 ?AUTO_8664 ) ( IN-TRUCK ?AUTO_8663 ?AUTO_8665 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8663 ?AUTO_8665 ?AUTO_8664 )
      ( DELIVER-PKG-VERIFY ?AUTO_8663 ?AUTO_8664 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8670 - OBJ
      ?AUTO_8671 - LOCATION
    )
    :vars
    (
      ?AUTO_8672 - TRUCK
      ?AUTO_8673 - LOCATION
      ?AUTO_8674 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8670 ?AUTO_8672 ) ( TRUCK-AT ?AUTO_8672 ?AUTO_8673 ) ( IN-CITY ?AUTO_8673 ?AUTO_8674 ) ( IN-CITY ?AUTO_8671 ?AUTO_8674 ) ( not ( = ?AUTO_8671 ?AUTO_8673 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8672 ?AUTO_8673 ?AUTO_8671 ?AUTO_8674 )
      ( DELIVER-PKG ?AUTO_8670 ?AUTO_8671 )
      ( DELIVER-PKG-VERIFY ?AUTO_8670 ?AUTO_8671 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8703 - OBJ
      ?AUTO_8704 - LOCATION
    )
    :vars
    (
      ?AUTO_8707 - TRUCK
      ?AUTO_8706 - LOCATION
      ?AUTO_8705 - CITY
      ?AUTO_8708 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8707 ?AUTO_8706 ) ( IN-CITY ?AUTO_8706 ?AUTO_8705 ) ( IN-CITY ?AUTO_8704 ?AUTO_8705 ) ( not ( = ?AUTO_8704 ?AUTO_8706 ) ) ( IN-AIRPLANE ?AUTO_8703 ?AUTO_8708 ) ( AIRPLANE-AT ?AUTO_8708 ?AUTO_8706 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8703 ?AUTO_8708 ?AUTO_8706 )
      ( DELIVER-PKG ?AUTO_8703 ?AUTO_8704 )
      ( DELIVER-PKG-VERIFY ?AUTO_8703 ?AUTO_8704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8709 - OBJ
      ?AUTO_8710 - LOCATION
    )
    :vars
    (
      ?AUTO_8713 - TRUCK
      ?AUTO_8712 - LOCATION
      ?AUTO_8711 - CITY
      ?AUTO_8714 - AIRPLANE
      ?AUTO_8715 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8713 ?AUTO_8712 ) ( IN-CITY ?AUTO_8712 ?AUTO_8711 ) ( IN-CITY ?AUTO_8710 ?AUTO_8711 ) ( not ( = ?AUTO_8710 ?AUTO_8712 ) ) ( IN-AIRPLANE ?AUTO_8709 ?AUTO_8714 ) ( AIRPORT ?AUTO_8715 ) ( AIRPORT ?AUTO_8712 ) ( AIRPLANE-AT ?AUTO_8714 ?AUTO_8715 ) ( not ( = ?AUTO_8715 ?AUTO_8712 ) ) ( not ( = ?AUTO_8710 ?AUTO_8715 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8714 ?AUTO_8715 ?AUTO_8712 )
      ( DELIVER-PKG ?AUTO_8709 ?AUTO_8710 )
      ( DELIVER-PKG-VERIFY ?AUTO_8709 ?AUTO_8710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8716 - OBJ
      ?AUTO_8717 - LOCATION
    )
    :vars
    (
      ?AUTO_8721 - TRUCK
      ?AUTO_8718 - LOCATION
      ?AUTO_8720 - CITY
      ?AUTO_8722 - LOCATION
      ?AUTO_8719 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8721 ?AUTO_8718 ) ( IN-CITY ?AUTO_8718 ?AUTO_8720 ) ( IN-CITY ?AUTO_8717 ?AUTO_8720 ) ( not ( = ?AUTO_8717 ?AUTO_8718 ) ) ( AIRPORT ?AUTO_8722 ) ( AIRPORT ?AUTO_8718 ) ( AIRPLANE-AT ?AUTO_8719 ?AUTO_8722 ) ( not ( = ?AUTO_8722 ?AUTO_8718 ) ) ( not ( = ?AUTO_8717 ?AUTO_8722 ) ) ( OBJ-AT ?AUTO_8716 ?AUTO_8722 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8716 ?AUTO_8719 ?AUTO_8722 )
      ( DELIVER-PKG ?AUTO_8716 ?AUTO_8717 )
      ( DELIVER-PKG-VERIFY ?AUTO_8716 ?AUTO_8717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8723 - OBJ
      ?AUTO_8724 - LOCATION
    )
    :vars
    (
      ?AUTO_8726 - TRUCK
      ?AUTO_8728 - LOCATION
      ?AUTO_8725 - CITY
      ?AUTO_8727 - LOCATION
      ?AUTO_8729 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8726 ?AUTO_8728 ) ( IN-CITY ?AUTO_8728 ?AUTO_8725 ) ( IN-CITY ?AUTO_8724 ?AUTO_8725 ) ( not ( = ?AUTO_8724 ?AUTO_8728 ) ) ( AIRPORT ?AUTO_8727 ) ( AIRPORT ?AUTO_8728 ) ( not ( = ?AUTO_8727 ?AUTO_8728 ) ) ( not ( = ?AUTO_8724 ?AUTO_8727 ) ) ( OBJ-AT ?AUTO_8723 ?AUTO_8727 ) ( AIRPLANE-AT ?AUTO_8729 ?AUTO_8728 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8729 ?AUTO_8728 ?AUTO_8727 )
      ( DELIVER-PKG ?AUTO_8723 ?AUTO_8724 )
      ( DELIVER-PKG-VERIFY ?AUTO_8723 ?AUTO_8724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8742 - OBJ
      ?AUTO_8743 - LOCATION
    )
    :vars
    (
      ?AUTO_8747 - TRUCK
      ?AUTO_8744 - LOCATION
      ?AUTO_8746 - CITY
      ?AUTO_8748 - LOCATION
      ?AUTO_8745 - AIRPLANE
      ?AUTO_8749 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8747 ?AUTO_8744 ) ( IN-CITY ?AUTO_8744 ?AUTO_8746 ) ( IN-CITY ?AUTO_8743 ?AUTO_8746 ) ( not ( = ?AUTO_8743 ?AUTO_8744 ) ) ( AIRPORT ?AUTO_8748 ) ( AIRPORT ?AUTO_8744 ) ( not ( = ?AUTO_8748 ?AUTO_8744 ) ) ( not ( = ?AUTO_8743 ?AUTO_8748 ) ) ( AIRPLANE-AT ?AUTO_8745 ?AUTO_8744 ) ( TRUCK-AT ?AUTO_8749 ?AUTO_8748 ) ( IN-TRUCK ?AUTO_8742 ?AUTO_8749 ) ( not ( = ?AUTO_8747 ?AUTO_8749 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8742 ?AUTO_8749 ?AUTO_8748 )
      ( DELIVER-PKG ?AUTO_8742 ?AUTO_8743 )
      ( DELIVER-PKG-VERIFY ?AUTO_8742 ?AUTO_8743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8750 - OBJ
      ?AUTO_8751 - LOCATION
    )
    :vars
    (
      ?AUTO_8756 - TRUCK
      ?AUTO_8753 - LOCATION
      ?AUTO_8755 - CITY
      ?AUTO_8757 - LOCATION
      ?AUTO_8752 - AIRPLANE
      ?AUTO_8754 - TRUCK
      ?AUTO_8758 - LOCATION
      ?AUTO_8759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8756 ?AUTO_8753 ) ( IN-CITY ?AUTO_8753 ?AUTO_8755 ) ( IN-CITY ?AUTO_8751 ?AUTO_8755 ) ( not ( = ?AUTO_8751 ?AUTO_8753 ) ) ( AIRPORT ?AUTO_8757 ) ( AIRPORT ?AUTO_8753 ) ( not ( = ?AUTO_8757 ?AUTO_8753 ) ) ( not ( = ?AUTO_8751 ?AUTO_8757 ) ) ( AIRPLANE-AT ?AUTO_8752 ?AUTO_8753 ) ( IN-TRUCK ?AUTO_8750 ?AUTO_8754 ) ( not ( = ?AUTO_8756 ?AUTO_8754 ) ) ( TRUCK-AT ?AUTO_8754 ?AUTO_8758 ) ( IN-CITY ?AUTO_8758 ?AUTO_8759 ) ( IN-CITY ?AUTO_8757 ?AUTO_8759 ) ( not ( = ?AUTO_8757 ?AUTO_8758 ) ) ( not ( = ?AUTO_8751 ?AUTO_8758 ) ) ( not ( = ?AUTO_8753 ?AUTO_8758 ) ) ( not ( = ?AUTO_8755 ?AUTO_8759 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8754 ?AUTO_8758 ?AUTO_8757 ?AUTO_8759 )
      ( DELIVER-PKG ?AUTO_8750 ?AUTO_8751 )
      ( DELIVER-PKG-VERIFY ?AUTO_8750 ?AUTO_8751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8762 - OBJ
      ?AUTO_8763 - LOCATION
    )
    :vars
    (
      ?AUTO_8771 - LOCATION
      ?AUTO_8764 - CITY
      ?AUTO_8769 - LOCATION
      ?AUTO_8770 - AIRPLANE
      ?AUTO_8765 - TRUCK
      ?AUTO_8768 - TRUCK
      ?AUTO_8767 - LOCATION
      ?AUTO_8766 - CITY
      ?AUTO_8772 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8771 ?AUTO_8764 ) ( IN-CITY ?AUTO_8763 ?AUTO_8764 ) ( not ( = ?AUTO_8763 ?AUTO_8771 ) ) ( AIRPORT ?AUTO_8769 ) ( AIRPORT ?AUTO_8771 ) ( not ( = ?AUTO_8769 ?AUTO_8771 ) ) ( not ( = ?AUTO_8763 ?AUTO_8769 ) ) ( AIRPLANE-AT ?AUTO_8770 ?AUTO_8771 ) ( IN-TRUCK ?AUTO_8762 ?AUTO_8765 ) ( not ( = ?AUTO_8768 ?AUTO_8765 ) ) ( TRUCK-AT ?AUTO_8765 ?AUTO_8767 ) ( IN-CITY ?AUTO_8767 ?AUTO_8766 ) ( IN-CITY ?AUTO_8769 ?AUTO_8766 ) ( not ( = ?AUTO_8769 ?AUTO_8767 ) ) ( not ( = ?AUTO_8763 ?AUTO_8767 ) ) ( not ( = ?AUTO_8771 ?AUTO_8767 ) ) ( not ( = ?AUTO_8764 ?AUTO_8766 ) ) ( TRUCK-AT ?AUTO_8768 ?AUTO_8772 ) ( IN-CITY ?AUTO_8772 ?AUTO_8764 ) ( not ( = ?AUTO_8771 ?AUTO_8772 ) ) ( not ( = ?AUTO_8763 ?AUTO_8772 ) ) ( not ( = ?AUTO_8769 ?AUTO_8772 ) ) ( not ( = ?AUTO_8767 ?AUTO_8772 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8768 ?AUTO_8772 ?AUTO_8771 ?AUTO_8764 )
      ( DELIVER-PKG ?AUTO_8762 ?AUTO_8763 )
      ( DELIVER-PKG-VERIFY ?AUTO_8762 ?AUTO_8763 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8773 - OBJ
      ?AUTO_8774 - LOCATION
    )
    :vars
    (
      ?AUTO_8780 - LOCATION
      ?AUTO_8778 - CITY
      ?AUTO_8781 - LOCATION
      ?AUTO_8777 - TRUCK
      ?AUTO_8779 - TRUCK
      ?AUTO_8782 - LOCATION
      ?AUTO_8776 - CITY
      ?AUTO_8783 - LOCATION
      ?AUTO_8775 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8780 ?AUTO_8778 ) ( IN-CITY ?AUTO_8774 ?AUTO_8778 ) ( not ( = ?AUTO_8774 ?AUTO_8780 ) ) ( AIRPORT ?AUTO_8781 ) ( AIRPORT ?AUTO_8780 ) ( not ( = ?AUTO_8781 ?AUTO_8780 ) ) ( not ( = ?AUTO_8774 ?AUTO_8781 ) ) ( IN-TRUCK ?AUTO_8773 ?AUTO_8777 ) ( not ( = ?AUTO_8779 ?AUTO_8777 ) ) ( TRUCK-AT ?AUTO_8777 ?AUTO_8782 ) ( IN-CITY ?AUTO_8782 ?AUTO_8776 ) ( IN-CITY ?AUTO_8781 ?AUTO_8776 ) ( not ( = ?AUTO_8781 ?AUTO_8782 ) ) ( not ( = ?AUTO_8774 ?AUTO_8782 ) ) ( not ( = ?AUTO_8780 ?AUTO_8782 ) ) ( not ( = ?AUTO_8778 ?AUTO_8776 ) ) ( TRUCK-AT ?AUTO_8779 ?AUTO_8783 ) ( IN-CITY ?AUTO_8783 ?AUTO_8778 ) ( not ( = ?AUTO_8780 ?AUTO_8783 ) ) ( not ( = ?AUTO_8774 ?AUTO_8783 ) ) ( not ( = ?AUTO_8781 ?AUTO_8783 ) ) ( not ( = ?AUTO_8782 ?AUTO_8783 ) ) ( AIRPLANE-AT ?AUTO_8775 ?AUTO_8781 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8775 ?AUTO_8781 ?AUTO_8780 )
      ( DELIVER-PKG ?AUTO_8773 ?AUTO_8774 )
      ( DELIVER-PKG-VERIFY ?AUTO_8773 ?AUTO_8774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8786 - OBJ
      ?AUTO_8787 - LOCATION
    )
    :vars
    (
      ?AUTO_8795 - LOCATION
      ?AUTO_8792 - CITY
      ?AUTO_8790 - LOCATION
      ?AUTO_8793 - TRUCK
      ?AUTO_8788 - TRUCK
      ?AUTO_8794 - LOCATION
      ?AUTO_8791 - CITY
      ?AUTO_8789 - LOCATION
      ?AUTO_8797 - LOCATION
      ?AUTO_8796 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8795 ?AUTO_8792 ) ( IN-CITY ?AUTO_8787 ?AUTO_8792 ) ( not ( = ?AUTO_8787 ?AUTO_8795 ) ) ( AIRPORT ?AUTO_8790 ) ( AIRPORT ?AUTO_8795 ) ( not ( = ?AUTO_8790 ?AUTO_8795 ) ) ( not ( = ?AUTO_8787 ?AUTO_8790 ) ) ( IN-TRUCK ?AUTO_8786 ?AUTO_8793 ) ( not ( = ?AUTO_8788 ?AUTO_8793 ) ) ( TRUCK-AT ?AUTO_8793 ?AUTO_8794 ) ( IN-CITY ?AUTO_8794 ?AUTO_8791 ) ( IN-CITY ?AUTO_8790 ?AUTO_8791 ) ( not ( = ?AUTO_8790 ?AUTO_8794 ) ) ( not ( = ?AUTO_8787 ?AUTO_8794 ) ) ( not ( = ?AUTO_8795 ?AUTO_8794 ) ) ( not ( = ?AUTO_8792 ?AUTO_8791 ) ) ( TRUCK-AT ?AUTO_8788 ?AUTO_8789 ) ( IN-CITY ?AUTO_8789 ?AUTO_8792 ) ( not ( = ?AUTO_8795 ?AUTO_8789 ) ) ( not ( = ?AUTO_8787 ?AUTO_8789 ) ) ( not ( = ?AUTO_8790 ?AUTO_8789 ) ) ( not ( = ?AUTO_8794 ?AUTO_8789 ) ) ( AIRPORT ?AUTO_8797 ) ( AIRPLANE-AT ?AUTO_8796 ?AUTO_8797 ) ( not ( = ?AUTO_8797 ?AUTO_8790 ) ) ( not ( = ?AUTO_8787 ?AUTO_8797 ) ) ( not ( = ?AUTO_8795 ?AUTO_8797 ) ) ( not ( = ?AUTO_8794 ?AUTO_8797 ) ) ( not ( = ?AUTO_8789 ?AUTO_8797 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8796 ?AUTO_8797 ?AUTO_8790 )
      ( DELIVER-PKG ?AUTO_8786 ?AUTO_8787 )
      ( DELIVER-PKG-VERIFY ?AUTO_8786 ?AUTO_8787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8826 - OBJ
      ?AUTO_8827 - LOCATION
    )
    :vars
    (
      ?AUTO_8831 - LOCATION
      ?AUTO_8834 - CITY
      ?AUTO_8835 - LOCATION
      ?AUTO_8828 - TRUCK
      ?AUTO_8832 - TRUCK
      ?AUTO_8836 - LOCATION
      ?AUTO_8829 - CITY
      ?AUTO_8830 - LOCATION
      ?AUTO_8833 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8831 ?AUTO_8834 ) ( IN-CITY ?AUTO_8827 ?AUTO_8834 ) ( not ( = ?AUTO_8827 ?AUTO_8831 ) ) ( AIRPORT ?AUTO_8835 ) ( AIRPORT ?AUTO_8831 ) ( not ( = ?AUTO_8835 ?AUTO_8831 ) ) ( not ( = ?AUTO_8827 ?AUTO_8835 ) ) ( not ( = ?AUTO_8828 ?AUTO_8832 ) ) ( TRUCK-AT ?AUTO_8832 ?AUTO_8836 ) ( IN-CITY ?AUTO_8836 ?AUTO_8829 ) ( IN-CITY ?AUTO_8835 ?AUTO_8829 ) ( not ( = ?AUTO_8835 ?AUTO_8836 ) ) ( not ( = ?AUTO_8827 ?AUTO_8836 ) ) ( not ( = ?AUTO_8831 ?AUTO_8836 ) ) ( not ( = ?AUTO_8834 ?AUTO_8829 ) ) ( TRUCK-AT ?AUTO_8828 ?AUTO_8830 ) ( IN-CITY ?AUTO_8830 ?AUTO_8834 ) ( not ( = ?AUTO_8831 ?AUTO_8830 ) ) ( not ( = ?AUTO_8827 ?AUTO_8830 ) ) ( not ( = ?AUTO_8835 ?AUTO_8830 ) ) ( not ( = ?AUTO_8836 ?AUTO_8830 ) ) ( AIRPLANE-AT ?AUTO_8833 ?AUTO_8835 ) ( OBJ-AT ?AUTO_8826 ?AUTO_8836 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8826 ?AUTO_8832 ?AUTO_8836 )
      ( DELIVER-PKG ?AUTO_8826 ?AUTO_8827 )
      ( DELIVER-PKG-VERIFY ?AUTO_8826 ?AUTO_8827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8837 - OBJ
      ?AUTO_8838 - LOCATION
    )
    :vars
    (
      ?AUTO_8844 - LOCATION
      ?AUTO_8839 - CITY
      ?AUTO_8846 - LOCATION
      ?AUTO_8845 - TRUCK
      ?AUTO_8843 - TRUCK
      ?AUTO_8841 - LOCATION
      ?AUTO_8840 - CITY
      ?AUTO_8847 - LOCATION
      ?AUTO_8842 - AIRPLANE
      ?AUTO_8848 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8844 ?AUTO_8839 ) ( IN-CITY ?AUTO_8838 ?AUTO_8839 ) ( not ( = ?AUTO_8838 ?AUTO_8844 ) ) ( AIRPORT ?AUTO_8846 ) ( AIRPORT ?AUTO_8844 ) ( not ( = ?AUTO_8846 ?AUTO_8844 ) ) ( not ( = ?AUTO_8838 ?AUTO_8846 ) ) ( not ( = ?AUTO_8845 ?AUTO_8843 ) ) ( IN-CITY ?AUTO_8841 ?AUTO_8840 ) ( IN-CITY ?AUTO_8846 ?AUTO_8840 ) ( not ( = ?AUTO_8846 ?AUTO_8841 ) ) ( not ( = ?AUTO_8838 ?AUTO_8841 ) ) ( not ( = ?AUTO_8844 ?AUTO_8841 ) ) ( not ( = ?AUTO_8839 ?AUTO_8840 ) ) ( TRUCK-AT ?AUTO_8845 ?AUTO_8847 ) ( IN-CITY ?AUTO_8847 ?AUTO_8839 ) ( not ( = ?AUTO_8844 ?AUTO_8847 ) ) ( not ( = ?AUTO_8838 ?AUTO_8847 ) ) ( not ( = ?AUTO_8846 ?AUTO_8847 ) ) ( not ( = ?AUTO_8841 ?AUTO_8847 ) ) ( AIRPLANE-AT ?AUTO_8842 ?AUTO_8846 ) ( OBJ-AT ?AUTO_8837 ?AUTO_8841 ) ( TRUCK-AT ?AUTO_8843 ?AUTO_8848 ) ( IN-CITY ?AUTO_8848 ?AUTO_8840 ) ( not ( = ?AUTO_8841 ?AUTO_8848 ) ) ( not ( = ?AUTO_8838 ?AUTO_8848 ) ) ( not ( = ?AUTO_8844 ?AUTO_8848 ) ) ( not ( = ?AUTO_8846 ?AUTO_8848 ) ) ( not ( = ?AUTO_8847 ?AUTO_8848 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8843 ?AUTO_8848 ?AUTO_8841 ?AUTO_8840 )
      ( DELIVER-PKG ?AUTO_8837 ?AUTO_8838 )
      ( DELIVER-PKG-VERIFY ?AUTO_8837 ?AUTO_8838 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8861 - OBJ
      ?AUTO_8862 - LOCATION
    )
    :vars
    (
      ?AUTO_8863 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8863 ?AUTO_8862 ) ( IN-TRUCK ?AUTO_8861 ?AUTO_8863 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8861 ?AUTO_8863 ?AUTO_8862 )
      ( DELIVER-PKG-VERIFY ?AUTO_8861 ?AUTO_8862 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8864 - OBJ
      ?AUTO_8865 - LOCATION
    )
    :vars
    (
      ?AUTO_8866 - TRUCK
      ?AUTO_8867 - LOCATION
      ?AUTO_8868 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8864 ?AUTO_8866 ) ( TRUCK-AT ?AUTO_8866 ?AUTO_8867 ) ( IN-CITY ?AUTO_8867 ?AUTO_8868 ) ( IN-CITY ?AUTO_8865 ?AUTO_8868 ) ( not ( = ?AUTO_8865 ?AUTO_8867 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8866 ?AUTO_8867 ?AUTO_8865 ?AUTO_8868 )
      ( DELIVER-PKG ?AUTO_8864 ?AUTO_8865 )
      ( DELIVER-PKG-VERIFY ?AUTO_8864 ?AUTO_8865 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8877 - OBJ
      ?AUTO_8878 - LOCATION
    )
    :vars
    (
      ?AUTO_8879 - TRUCK
      ?AUTO_8880 - LOCATION
      ?AUTO_8881 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8879 ?AUTO_8880 ) ( IN-CITY ?AUTO_8880 ?AUTO_8881 ) ( IN-CITY ?AUTO_8878 ?AUTO_8881 ) ( not ( = ?AUTO_8878 ?AUTO_8880 ) ) ( OBJ-AT ?AUTO_8877 ?AUTO_8880 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8877 ?AUTO_8879 ?AUTO_8880 )
      ( DELIVER-PKG ?AUTO_8877 ?AUTO_8878 )
      ( DELIVER-PKG-VERIFY ?AUTO_8877 ?AUTO_8878 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8882 - OBJ
      ?AUTO_8883 - LOCATION
    )
    :vars
    (
      ?AUTO_8885 - TRUCK
      ?AUTO_8884 - LOCATION
      ?AUTO_8886 - CITY
      ?AUTO_8887 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8885 ?AUTO_8884 ) ( IN-CITY ?AUTO_8884 ?AUTO_8886 ) ( IN-CITY ?AUTO_8883 ?AUTO_8886 ) ( not ( = ?AUTO_8883 ?AUTO_8884 ) ) ( IN-AIRPLANE ?AUTO_8882 ?AUTO_8887 ) ( AIRPLANE-AT ?AUTO_8887 ?AUTO_8884 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8882 ?AUTO_8887 ?AUTO_8884 )
      ( DELIVER-PKG ?AUTO_8882 ?AUTO_8883 )
      ( DELIVER-PKG-VERIFY ?AUTO_8882 ?AUTO_8883 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8888 - OBJ
      ?AUTO_8889 - LOCATION
    )
    :vars
    (
      ?AUTO_8892 - TRUCK
      ?AUTO_8890 - LOCATION
      ?AUTO_8891 - CITY
      ?AUTO_8893 - AIRPLANE
      ?AUTO_8894 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8892 ?AUTO_8890 ) ( IN-CITY ?AUTO_8890 ?AUTO_8891 ) ( IN-CITY ?AUTO_8889 ?AUTO_8891 ) ( not ( = ?AUTO_8889 ?AUTO_8890 ) ) ( IN-AIRPLANE ?AUTO_8888 ?AUTO_8893 ) ( AIRPORT ?AUTO_8894 ) ( AIRPORT ?AUTO_8890 ) ( AIRPLANE-AT ?AUTO_8893 ?AUTO_8894 ) ( not ( = ?AUTO_8894 ?AUTO_8890 ) ) ( not ( = ?AUTO_8889 ?AUTO_8894 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8893 ?AUTO_8894 ?AUTO_8890 )
      ( DELIVER-PKG ?AUTO_8888 ?AUTO_8889 )
      ( DELIVER-PKG-VERIFY ?AUTO_8888 ?AUTO_8889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8897 - OBJ
      ?AUTO_8898 - LOCATION
    )
    :vars
    (
      ?AUTO_8899 - TRUCK
      ?AUTO_8901 - LOCATION
      ?AUTO_8903 - CITY
      ?AUTO_8900 - LOCATION
      ?AUTO_8902 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8899 ?AUTO_8901 ) ( IN-CITY ?AUTO_8901 ?AUTO_8903 ) ( IN-CITY ?AUTO_8898 ?AUTO_8903 ) ( not ( = ?AUTO_8898 ?AUTO_8901 ) ) ( AIRPORT ?AUTO_8900 ) ( AIRPORT ?AUTO_8901 ) ( AIRPLANE-AT ?AUTO_8902 ?AUTO_8900 ) ( not ( = ?AUTO_8900 ?AUTO_8901 ) ) ( not ( = ?AUTO_8898 ?AUTO_8900 ) ) ( OBJ-AT ?AUTO_8897 ?AUTO_8900 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8897 ?AUTO_8902 ?AUTO_8900 )
      ( DELIVER-PKG ?AUTO_8897 ?AUTO_8898 )
      ( DELIVER-PKG-VERIFY ?AUTO_8897 ?AUTO_8898 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8904 - OBJ
      ?AUTO_8905 - LOCATION
    )
    :vars
    (
      ?AUTO_8910 - TRUCK
      ?AUTO_8909 - LOCATION
      ?AUTO_8906 - CITY
      ?AUTO_8908 - LOCATION
      ?AUTO_8911 - LOCATION
      ?AUTO_8907 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8910 ?AUTO_8909 ) ( IN-CITY ?AUTO_8909 ?AUTO_8906 ) ( IN-CITY ?AUTO_8905 ?AUTO_8906 ) ( not ( = ?AUTO_8905 ?AUTO_8909 ) ) ( AIRPORT ?AUTO_8908 ) ( AIRPORT ?AUTO_8909 ) ( not ( = ?AUTO_8908 ?AUTO_8909 ) ) ( not ( = ?AUTO_8905 ?AUTO_8908 ) ) ( OBJ-AT ?AUTO_8904 ?AUTO_8908 ) ( AIRPORT ?AUTO_8911 ) ( AIRPLANE-AT ?AUTO_8907 ?AUTO_8911 ) ( not ( = ?AUTO_8911 ?AUTO_8908 ) ) ( not ( = ?AUTO_8905 ?AUTO_8911 ) ) ( not ( = ?AUTO_8909 ?AUTO_8911 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8907 ?AUTO_8911 ?AUTO_8908 )
      ( DELIVER-PKG ?AUTO_8904 ?AUTO_8905 )
      ( DELIVER-PKG-VERIFY ?AUTO_8904 ?AUTO_8905 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8914 - OBJ
      ?AUTO_8915 - LOCATION
    )
    :vars
    (
      ?AUTO_8918 - TRUCK
      ?AUTO_8919 - LOCATION
      ?AUTO_8917 - CITY
      ?AUTO_8916 - LOCATION
      ?AUTO_8921 - LOCATION
      ?AUTO_8920 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8918 ?AUTO_8919 ) ( IN-CITY ?AUTO_8919 ?AUTO_8917 ) ( IN-CITY ?AUTO_8915 ?AUTO_8917 ) ( not ( = ?AUTO_8915 ?AUTO_8919 ) ) ( AIRPORT ?AUTO_8916 ) ( AIRPORT ?AUTO_8919 ) ( not ( = ?AUTO_8916 ?AUTO_8919 ) ) ( not ( = ?AUTO_8915 ?AUTO_8916 ) ) ( OBJ-AT ?AUTO_8914 ?AUTO_8916 ) ( AIRPORT ?AUTO_8921 ) ( not ( = ?AUTO_8921 ?AUTO_8916 ) ) ( not ( = ?AUTO_8915 ?AUTO_8921 ) ) ( not ( = ?AUTO_8919 ?AUTO_8921 ) ) ( AIRPLANE-AT ?AUTO_8920 ?AUTO_8919 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8920 ?AUTO_8919 ?AUTO_8921 )
      ( DELIVER-PKG ?AUTO_8914 ?AUTO_8915 )
      ( DELIVER-PKG-VERIFY ?AUTO_8914 ?AUTO_8915 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8926 - OBJ
      ?AUTO_8927 - LOCATION
    )
    :vars
    (
      ?AUTO_8933 - LOCATION
      ?AUTO_8928 - CITY
      ?AUTO_8932 - LOCATION
      ?AUTO_8931 - LOCATION
      ?AUTO_8930 - AIRPLANE
      ?AUTO_8929 - TRUCK
      ?AUTO_8934 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8933 ?AUTO_8928 ) ( IN-CITY ?AUTO_8927 ?AUTO_8928 ) ( not ( = ?AUTO_8927 ?AUTO_8933 ) ) ( AIRPORT ?AUTO_8932 ) ( AIRPORT ?AUTO_8933 ) ( not ( = ?AUTO_8932 ?AUTO_8933 ) ) ( not ( = ?AUTO_8927 ?AUTO_8932 ) ) ( OBJ-AT ?AUTO_8926 ?AUTO_8932 ) ( AIRPORT ?AUTO_8931 ) ( not ( = ?AUTO_8931 ?AUTO_8932 ) ) ( not ( = ?AUTO_8927 ?AUTO_8931 ) ) ( not ( = ?AUTO_8933 ?AUTO_8931 ) ) ( AIRPLANE-AT ?AUTO_8930 ?AUTO_8933 ) ( TRUCK-AT ?AUTO_8929 ?AUTO_8934 ) ( IN-CITY ?AUTO_8934 ?AUTO_8928 ) ( not ( = ?AUTO_8933 ?AUTO_8934 ) ) ( not ( = ?AUTO_8927 ?AUTO_8934 ) ) ( not ( = ?AUTO_8932 ?AUTO_8934 ) ) ( not ( = ?AUTO_8931 ?AUTO_8934 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8929 ?AUTO_8934 ?AUTO_8933 ?AUTO_8928 )
      ( DELIVER-PKG ?AUTO_8926 ?AUTO_8927 )
      ( DELIVER-PKG-VERIFY ?AUTO_8926 ?AUTO_8927 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8959 - OBJ
      ?AUTO_8960 - LOCATION
    )
    :vars
    (
      ?AUTO_8961 - TRUCK
      ?AUTO_8965 - LOCATION
      ?AUTO_8966 - CITY
      ?AUTO_8963 - LOCATION
      ?AUTO_8962 - LOCATION
      ?AUTO_8964 - AIRPLANE
      ?AUTO_8967 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8961 ?AUTO_8965 ) ( IN-CITY ?AUTO_8965 ?AUTO_8966 ) ( IN-CITY ?AUTO_8960 ?AUTO_8966 ) ( not ( = ?AUTO_8960 ?AUTO_8965 ) ) ( AIRPORT ?AUTO_8963 ) ( AIRPORT ?AUTO_8965 ) ( not ( = ?AUTO_8963 ?AUTO_8965 ) ) ( not ( = ?AUTO_8960 ?AUTO_8963 ) ) ( AIRPORT ?AUTO_8962 ) ( not ( = ?AUTO_8962 ?AUTO_8963 ) ) ( not ( = ?AUTO_8960 ?AUTO_8962 ) ) ( not ( = ?AUTO_8965 ?AUTO_8962 ) ) ( AIRPLANE-AT ?AUTO_8964 ?AUTO_8965 ) ( TRUCK-AT ?AUTO_8967 ?AUTO_8963 ) ( IN-TRUCK ?AUTO_8959 ?AUTO_8967 ) ( not ( = ?AUTO_8961 ?AUTO_8967 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8959 ?AUTO_8967 ?AUTO_8963 )
      ( DELIVER-PKG ?AUTO_8959 ?AUTO_8960 )
      ( DELIVER-PKG-VERIFY ?AUTO_8959 ?AUTO_8960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9002 - OBJ
      ?AUTO_9003 - LOCATION
    )
    :vars
    (
      ?AUTO_9010 - LOCATION
      ?AUTO_9005 - CITY
      ?AUTO_9004 - LOCATION
      ?AUTO_9007 - TRUCK
      ?AUTO_9011 - TRUCK
      ?AUTO_9012 - LOCATION
      ?AUTO_9006 - CITY
      ?AUTO_9008 - LOCATION
      ?AUTO_9009 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9010 ?AUTO_9005 ) ( IN-CITY ?AUTO_9003 ?AUTO_9005 ) ( not ( = ?AUTO_9003 ?AUTO_9010 ) ) ( AIRPORT ?AUTO_9004 ) ( AIRPORT ?AUTO_9010 ) ( not ( = ?AUTO_9004 ?AUTO_9010 ) ) ( not ( = ?AUTO_9003 ?AUTO_9004 ) ) ( not ( = ?AUTO_9007 ?AUTO_9011 ) ) ( TRUCK-AT ?AUTO_9011 ?AUTO_9012 ) ( IN-CITY ?AUTO_9012 ?AUTO_9006 ) ( IN-CITY ?AUTO_9004 ?AUTO_9006 ) ( not ( = ?AUTO_9004 ?AUTO_9012 ) ) ( not ( = ?AUTO_9003 ?AUTO_9012 ) ) ( not ( = ?AUTO_9010 ?AUTO_9012 ) ) ( not ( = ?AUTO_9005 ?AUTO_9006 ) ) ( TRUCK-AT ?AUTO_9007 ?AUTO_9008 ) ( IN-CITY ?AUTO_9008 ?AUTO_9005 ) ( not ( = ?AUTO_9010 ?AUTO_9008 ) ) ( not ( = ?AUTO_9003 ?AUTO_9008 ) ) ( not ( = ?AUTO_9004 ?AUTO_9008 ) ) ( not ( = ?AUTO_9012 ?AUTO_9008 ) ) ( AIRPLANE-AT ?AUTO_9009 ?AUTO_9004 ) ( OBJ-AT ?AUTO_9002 ?AUTO_9012 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9002 ?AUTO_9011 ?AUTO_9012 )
      ( DELIVER-PKG ?AUTO_9002 ?AUTO_9003 )
      ( DELIVER-PKG-VERIFY ?AUTO_9002 ?AUTO_9003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9013 - OBJ
      ?AUTO_9014 - LOCATION
    )
    :vars
    (
      ?AUTO_9020 - LOCATION
      ?AUTO_9016 - CITY
      ?AUTO_9022 - LOCATION
      ?AUTO_9018 - TRUCK
      ?AUTO_9021 - TRUCK
      ?AUTO_9019 - LOCATION
      ?AUTO_9017 - CITY
      ?AUTO_9015 - LOCATION
      ?AUTO_9023 - AIRPLANE
      ?AUTO_9024 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9020 ?AUTO_9016 ) ( IN-CITY ?AUTO_9014 ?AUTO_9016 ) ( not ( = ?AUTO_9014 ?AUTO_9020 ) ) ( AIRPORT ?AUTO_9022 ) ( AIRPORT ?AUTO_9020 ) ( not ( = ?AUTO_9022 ?AUTO_9020 ) ) ( not ( = ?AUTO_9014 ?AUTO_9022 ) ) ( not ( = ?AUTO_9018 ?AUTO_9021 ) ) ( IN-CITY ?AUTO_9019 ?AUTO_9017 ) ( IN-CITY ?AUTO_9022 ?AUTO_9017 ) ( not ( = ?AUTO_9022 ?AUTO_9019 ) ) ( not ( = ?AUTO_9014 ?AUTO_9019 ) ) ( not ( = ?AUTO_9020 ?AUTO_9019 ) ) ( not ( = ?AUTO_9016 ?AUTO_9017 ) ) ( TRUCK-AT ?AUTO_9018 ?AUTO_9015 ) ( IN-CITY ?AUTO_9015 ?AUTO_9016 ) ( not ( = ?AUTO_9020 ?AUTO_9015 ) ) ( not ( = ?AUTO_9014 ?AUTO_9015 ) ) ( not ( = ?AUTO_9022 ?AUTO_9015 ) ) ( not ( = ?AUTO_9019 ?AUTO_9015 ) ) ( AIRPLANE-AT ?AUTO_9023 ?AUTO_9022 ) ( OBJ-AT ?AUTO_9013 ?AUTO_9019 ) ( TRUCK-AT ?AUTO_9021 ?AUTO_9024 ) ( IN-CITY ?AUTO_9024 ?AUTO_9017 ) ( not ( = ?AUTO_9019 ?AUTO_9024 ) ) ( not ( = ?AUTO_9014 ?AUTO_9024 ) ) ( not ( = ?AUTO_9020 ?AUTO_9024 ) ) ( not ( = ?AUTO_9022 ?AUTO_9024 ) ) ( not ( = ?AUTO_9015 ?AUTO_9024 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9021 ?AUTO_9024 ?AUTO_9019 ?AUTO_9017 )
      ( DELIVER-PKG ?AUTO_9013 ?AUTO_9014 )
      ( DELIVER-PKG-VERIFY ?AUTO_9013 ?AUTO_9014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9045 - OBJ
      ?AUTO_9046 - LOCATION
    )
    :vars
    (
      ?AUTO_9047 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9045 ?AUTO_9047 ) ( AIRPLANE-AT ?AUTO_9047 ?AUTO_9046 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9045 ?AUTO_9047 ?AUTO_9046 )
      ( DELIVER-PKG-VERIFY ?AUTO_9045 ?AUTO_9046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9056 - OBJ
      ?AUTO_9057 - LOCATION
    )
    :vars
    (
      ?AUTO_9058 - AIRPLANE
      ?AUTO_9059 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9056 ?AUTO_9058 ) ( AIRPORT ?AUTO_9059 ) ( AIRPORT ?AUTO_9057 ) ( AIRPLANE-AT ?AUTO_9058 ?AUTO_9059 ) ( not ( = ?AUTO_9059 ?AUTO_9057 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9058 ?AUTO_9059 ?AUTO_9057 )
      ( DELIVER-PKG ?AUTO_9056 ?AUTO_9057 )
      ( DELIVER-PKG-VERIFY ?AUTO_9056 ?AUTO_9057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9068 - OBJ
      ?AUTO_9069 - LOCATION
    )
    :vars
    (
      ?AUTO_9070 - LOCATION
      ?AUTO_9071 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9070 ) ( AIRPORT ?AUTO_9069 ) ( AIRPLANE-AT ?AUTO_9071 ?AUTO_9070 ) ( not ( = ?AUTO_9070 ?AUTO_9069 ) ) ( OBJ-AT ?AUTO_9068 ?AUTO_9070 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9068 ?AUTO_9071 ?AUTO_9070 )
      ( DELIVER-PKG ?AUTO_9068 ?AUTO_9069 )
      ( DELIVER-PKG-VERIFY ?AUTO_9068 ?AUTO_9069 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9108 - OBJ
      ?AUTO_9109 - LOCATION
    )
    :vars
    (
      ?AUTO_9112 - LOCATION
      ?AUTO_9110 - LOCATION
      ?AUTO_9111 - AIRPLANE
      ?AUTO_9113 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9112 ) ( AIRPORT ?AUTO_9109 ) ( not ( = ?AUTO_9112 ?AUTO_9109 ) ) ( AIRPORT ?AUTO_9110 ) ( AIRPLANE-AT ?AUTO_9111 ?AUTO_9110 ) ( not ( = ?AUTO_9110 ?AUTO_9112 ) ) ( not ( = ?AUTO_9109 ?AUTO_9110 ) ) ( TRUCK-AT ?AUTO_9113 ?AUTO_9112 ) ( IN-TRUCK ?AUTO_9108 ?AUTO_9113 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9108 ?AUTO_9113 ?AUTO_9112 )
      ( DELIVER-PKG ?AUTO_9108 ?AUTO_9109 )
      ( DELIVER-PKG-VERIFY ?AUTO_9108 ?AUTO_9109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9118 - OBJ
      ?AUTO_9119 - LOCATION
    )
    :vars
    (
      ?AUTO_9123 - LOCATION
      ?AUTO_9120 - LOCATION
      ?AUTO_9122 - AIRPLANE
      ?AUTO_9121 - TRUCK
      ?AUTO_9124 - LOCATION
      ?AUTO_9125 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9123 ) ( AIRPORT ?AUTO_9119 ) ( not ( = ?AUTO_9123 ?AUTO_9119 ) ) ( AIRPORT ?AUTO_9120 ) ( AIRPLANE-AT ?AUTO_9122 ?AUTO_9120 ) ( not ( = ?AUTO_9120 ?AUTO_9123 ) ) ( not ( = ?AUTO_9119 ?AUTO_9120 ) ) ( IN-TRUCK ?AUTO_9118 ?AUTO_9121 ) ( TRUCK-AT ?AUTO_9121 ?AUTO_9124 ) ( IN-CITY ?AUTO_9124 ?AUTO_9125 ) ( IN-CITY ?AUTO_9123 ?AUTO_9125 ) ( not ( = ?AUTO_9123 ?AUTO_9124 ) ) ( not ( = ?AUTO_9119 ?AUTO_9124 ) ) ( not ( = ?AUTO_9120 ?AUTO_9124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9121 ?AUTO_9124 ?AUTO_9123 ?AUTO_9125 )
      ( DELIVER-PKG ?AUTO_9118 ?AUTO_9119 )
      ( DELIVER-PKG-VERIFY ?AUTO_9118 ?AUTO_9119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9180 - OBJ
      ?AUTO_9181 - LOCATION
    )
    :vars
    (
      ?AUTO_9182 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9180 ?AUTO_9182 ) ( AIRPLANE-AT ?AUTO_9182 ?AUTO_9181 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9180 ?AUTO_9182 ?AUTO_9181 )
      ( DELIVER-PKG-VERIFY ?AUTO_9180 ?AUTO_9181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9183 - OBJ
      ?AUTO_9184 - LOCATION
    )
    :vars
    (
      ?AUTO_9185 - AIRPLANE
      ?AUTO_9186 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9183 ?AUTO_9185 ) ( AIRPORT ?AUTO_9186 ) ( AIRPORT ?AUTO_9184 ) ( AIRPLANE-AT ?AUTO_9185 ?AUTO_9186 ) ( not ( = ?AUTO_9186 ?AUTO_9184 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9185 ?AUTO_9186 ?AUTO_9184 )
      ( DELIVER-PKG ?AUTO_9183 ?AUTO_9184 )
      ( DELIVER-PKG-VERIFY ?AUTO_9183 ?AUTO_9184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9195 - OBJ
      ?AUTO_9196 - LOCATION
    )
    :vars
    (
      ?AUTO_9197 - LOCATION
      ?AUTO_9198 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9197 ) ( AIRPORT ?AUTO_9196 ) ( AIRPLANE-AT ?AUTO_9198 ?AUTO_9197 ) ( not ( = ?AUTO_9197 ?AUTO_9196 ) ) ( OBJ-AT ?AUTO_9195 ?AUTO_9197 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9195 ?AUTO_9198 ?AUTO_9197 )
      ( DELIVER-PKG ?AUTO_9195 ?AUTO_9196 )
      ( DELIVER-PKG-VERIFY ?AUTO_9195 ?AUTO_9196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9199 - OBJ
      ?AUTO_9200 - LOCATION
    )
    :vars
    (
      ?AUTO_9201 - LOCATION
      ?AUTO_9203 - LOCATION
      ?AUTO_9202 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9201 ) ( AIRPORT ?AUTO_9200 ) ( not ( = ?AUTO_9201 ?AUTO_9200 ) ) ( OBJ-AT ?AUTO_9199 ?AUTO_9201 ) ( AIRPORT ?AUTO_9203 ) ( AIRPLANE-AT ?AUTO_9202 ?AUTO_9203 ) ( not ( = ?AUTO_9203 ?AUTO_9201 ) ) ( not ( = ?AUTO_9200 ?AUTO_9203 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9202 ?AUTO_9203 ?AUTO_9201 )
      ( DELIVER-PKG ?AUTO_9199 ?AUTO_9200 )
      ( DELIVER-PKG-VERIFY ?AUTO_9199 ?AUTO_9200 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9210 - OBJ
      ?AUTO_9211 - LOCATION
    )
    :vars
    (
      ?AUTO_9212 - LOCATION
      ?AUTO_9214 - LOCATION
      ?AUTO_9213 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9212 ) ( AIRPORT ?AUTO_9211 ) ( not ( = ?AUTO_9212 ?AUTO_9211 ) ) ( OBJ-AT ?AUTO_9210 ?AUTO_9212 ) ( AIRPORT ?AUTO_9214 ) ( not ( = ?AUTO_9214 ?AUTO_9212 ) ) ( not ( = ?AUTO_9211 ?AUTO_9214 ) ) ( AIRPLANE-AT ?AUTO_9213 ?AUTO_9211 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9213 ?AUTO_9211 ?AUTO_9214 )
      ( DELIVER-PKG ?AUTO_9210 ?AUTO_9211 )
      ( DELIVER-PKG-VERIFY ?AUTO_9210 ?AUTO_9211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9283 - OBJ
      ?AUTO_9284 - LOCATION
    )
    :vars
    (
      ?AUTO_9289 - LOCATION
      ?AUTO_9285 - AIRPLANE
      ?AUTO_9287 - TRUCK
      ?AUTO_9286 - LOCATION
      ?AUTO_9288 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9289 ) ( AIRPORT ?AUTO_9284 ) ( not ( = ?AUTO_9289 ?AUTO_9284 ) ) ( AIRPLANE-AT ?AUTO_9285 ?AUTO_9284 ) ( TRUCK-AT ?AUTO_9287 ?AUTO_9286 ) ( IN-CITY ?AUTO_9286 ?AUTO_9288 ) ( IN-CITY ?AUTO_9289 ?AUTO_9288 ) ( not ( = ?AUTO_9289 ?AUTO_9286 ) ) ( not ( = ?AUTO_9284 ?AUTO_9286 ) ) ( OBJ-AT ?AUTO_9283 ?AUTO_9286 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9283 ?AUTO_9287 ?AUTO_9286 )
      ( DELIVER-PKG ?AUTO_9283 ?AUTO_9284 )
      ( DELIVER-PKG-VERIFY ?AUTO_9283 ?AUTO_9284 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9290 - OBJ
      ?AUTO_9291 - LOCATION
    )
    :vars
    (
      ?AUTO_9295 - LOCATION
      ?AUTO_9294 - AIRPLANE
      ?AUTO_9292 - LOCATION
      ?AUTO_9293 - CITY
      ?AUTO_9296 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9295 ) ( AIRPORT ?AUTO_9291 ) ( not ( = ?AUTO_9295 ?AUTO_9291 ) ) ( AIRPLANE-AT ?AUTO_9294 ?AUTO_9291 ) ( IN-CITY ?AUTO_9292 ?AUTO_9293 ) ( IN-CITY ?AUTO_9295 ?AUTO_9293 ) ( not ( = ?AUTO_9295 ?AUTO_9292 ) ) ( not ( = ?AUTO_9291 ?AUTO_9292 ) ) ( OBJ-AT ?AUTO_9290 ?AUTO_9292 ) ( TRUCK-AT ?AUTO_9296 ?AUTO_9295 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9296 ?AUTO_9295 ?AUTO_9292 ?AUTO_9293 )
      ( DELIVER-PKG ?AUTO_9290 ?AUTO_9291 )
      ( DELIVER-PKG-VERIFY ?AUTO_9290 ?AUTO_9291 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9325 - OBJ
      ?AUTO_9326 - LOCATION
    )
    :vars
    (
      ?AUTO_9327 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9327 ?AUTO_9326 ) ( IN-TRUCK ?AUTO_9325 ?AUTO_9327 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9325 ?AUTO_9327 ?AUTO_9326 )
      ( DELIVER-PKG-VERIFY ?AUTO_9325 ?AUTO_9326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9328 - OBJ
      ?AUTO_9329 - LOCATION
    )
    :vars
    (
      ?AUTO_9330 - TRUCK
      ?AUTO_9331 - LOCATION
      ?AUTO_9332 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9328 ?AUTO_9330 ) ( TRUCK-AT ?AUTO_9330 ?AUTO_9331 ) ( IN-CITY ?AUTO_9331 ?AUTO_9332 ) ( IN-CITY ?AUTO_9329 ?AUTO_9332 ) ( not ( = ?AUTO_9329 ?AUTO_9331 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9330 ?AUTO_9331 ?AUTO_9329 ?AUTO_9332 )
      ( DELIVER-PKG ?AUTO_9328 ?AUTO_9329 )
      ( DELIVER-PKG-VERIFY ?AUTO_9328 ?AUTO_9329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9333 - OBJ
      ?AUTO_9334 - LOCATION
    )
    :vars
    (
      ?AUTO_9335 - TRUCK
      ?AUTO_9336 - LOCATION
      ?AUTO_9337 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9335 ?AUTO_9336 ) ( IN-CITY ?AUTO_9336 ?AUTO_9337 ) ( IN-CITY ?AUTO_9334 ?AUTO_9337 ) ( not ( = ?AUTO_9334 ?AUTO_9336 ) ) ( OBJ-AT ?AUTO_9333 ?AUTO_9336 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9333 ?AUTO_9335 ?AUTO_9336 )
      ( DELIVER-PKG ?AUTO_9333 ?AUTO_9334 )
      ( DELIVER-PKG-VERIFY ?AUTO_9333 ?AUTO_9334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9338 - OBJ
      ?AUTO_9339 - LOCATION
    )
    :vars
    (
      ?AUTO_9341 - TRUCK
      ?AUTO_9340 - LOCATION
      ?AUTO_9342 - CITY
      ?AUTO_9343 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9341 ?AUTO_9340 ) ( IN-CITY ?AUTO_9340 ?AUTO_9342 ) ( IN-CITY ?AUTO_9339 ?AUTO_9342 ) ( not ( = ?AUTO_9339 ?AUTO_9340 ) ) ( IN-AIRPLANE ?AUTO_9338 ?AUTO_9343 ) ( AIRPLANE-AT ?AUTO_9343 ?AUTO_9340 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9338 ?AUTO_9343 ?AUTO_9340 )
      ( DELIVER-PKG ?AUTO_9338 ?AUTO_9339 )
      ( DELIVER-PKG-VERIFY ?AUTO_9338 ?AUTO_9339 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9344 - OBJ
      ?AUTO_9345 - LOCATION
    )
    :vars
    (
      ?AUTO_9347 - TRUCK
      ?AUTO_9348 - LOCATION
      ?AUTO_9346 - CITY
      ?AUTO_9349 - AIRPLANE
      ?AUTO_9350 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9347 ?AUTO_9348 ) ( IN-CITY ?AUTO_9348 ?AUTO_9346 ) ( IN-CITY ?AUTO_9345 ?AUTO_9346 ) ( not ( = ?AUTO_9345 ?AUTO_9348 ) ) ( IN-AIRPLANE ?AUTO_9344 ?AUTO_9349 ) ( AIRPORT ?AUTO_9350 ) ( AIRPORT ?AUTO_9348 ) ( AIRPLANE-AT ?AUTO_9349 ?AUTO_9350 ) ( not ( = ?AUTO_9350 ?AUTO_9348 ) ) ( not ( = ?AUTO_9345 ?AUTO_9350 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9349 ?AUTO_9350 ?AUTO_9348 )
      ( DELIVER-PKG ?AUTO_9344 ?AUTO_9345 )
      ( DELIVER-PKG-VERIFY ?AUTO_9344 ?AUTO_9345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9359 - OBJ
      ?AUTO_9360 - LOCATION
    )
    :vars
    (
      ?AUTO_9365 - TRUCK
      ?AUTO_9361 - LOCATION
      ?AUTO_9362 - CITY
      ?AUTO_9363 - LOCATION
      ?AUTO_9364 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9365 ?AUTO_9361 ) ( IN-CITY ?AUTO_9361 ?AUTO_9362 ) ( IN-CITY ?AUTO_9360 ?AUTO_9362 ) ( not ( = ?AUTO_9360 ?AUTO_9361 ) ) ( AIRPORT ?AUTO_9363 ) ( AIRPORT ?AUTO_9361 ) ( AIRPLANE-AT ?AUTO_9364 ?AUTO_9363 ) ( not ( = ?AUTO_9363 ?AUTO_9361 ) ) ( not ( = ?AUTO_9360 ?AUTO_9363 ) ) ( OBJ-AT ?AUTO_9359 ?AUTO_9363 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9359 ?AUTO_9364 ?AUTO_9363 )
      ( DELIVER-PKG ?AUTO_9359 ?AUTO_9360 )
      ( DELIVER-PKG-VERIFY ?AUTO_9359 ?AUTO_9360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9366 - OBJ
      ?AUTO_9367 - LOCATION
    )
    :vars
    (
      ?AUTO_9372 - TRUCK
      ?AUTO_9368 - LOCATION
      ?AUTO_9369 - CITY
      ?AUTO_9370 - LOCATION
      ?AUTO_9373 - LOCATION
      ?AUTO_9371 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9372 ?AUTO_9368 ) ( IN-CITY ?AUTO_9368 ?AUTO_9369 ) ( IN-CITY ?AUTO_9367 ?AUTO_9369 ) ( not ( = ?AUTO_9367 ?AUTO_9368 ) ) ( AIRPORT ?AUTO_9370 ) ( AIRPORT ?AUTO_9368 ) ( not ( = ?AUTO_9370 ?AUTO_9368 ) ) ( not ( = ?AUTO_9367 ?AUTO_9370 ) ) ( OBJ-AT ?AUTO_9366 ?AUTO_9370 ) ( AIRPORT ?AUTO_9373 ) ( AIRPLANE-AT ?AUTO_9371 ?AUTO_9373 ) ( not ( = ?AUTO_9373 ?AUTO_9370 ) ) ( not ( = ?AUTO_9367 ?AUTO_9373 ) ) ( not ( = ?AUTO_9368 ?AUTO_9373 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9371 ?AUTO_9373 ?AUTO_9370 )
      ( DELIVER-PKG ?AUTO_9366 ?AUTO_9367 )
      ( DELIVER-PKG-VERIFY ?AUTO_9366 ?AUTO_9367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9380 - OBJ
      ?AUTO_9381 - LOCATION
    )
    :vars
    (
      ?AUTO_9382 - TRUCK
      ?AUTO_9384 - LOCATION
      ?AUTO_9387 - CITY
      ?AUTO_9386 - LOCATION
      ?AUTO_9383 - LOCATION
      ?AUTO_9385 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9382 ?AUTO_9384 ) ( IN-CITY ?AUTO_9384 ?AUTO_9387 ) ( IN-CITY ?AUTO_9381 ?AUTO_9387 ) ( not ( = ?AUTO_9381 ?AUTO_9384 ) ) ( AIRPORT ?AUTO_9386 ) ( AIRPORT ?AUTO_9384 ) ( not ( = ?AUTO_9386 ?AUTO_9384 ) ) ( not ( = ?AUTO_9381 ?AUTO_9386 ) ) ( OBJ-AT ?AUTO_9380 ?AUTO_9386 ) ( AIRPORT ?AUTO_9383 ) ( not ( = ?AUTO_9383 ?AUTO_9386 ) ) ( not ( = ?AUTO_9381 ?AUTO_9383 ) ) ( not ( = ?AUTO_9384 ?AUTO_9383 ) ) ( AIRPLANE-AT ?AUTO_9385 ?AUTO_9384 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9385 ?AUTO_9384 ?AUTO_9383 )
      ( DELIVER-PKG ?AUTO_9380 ?AUTO_9381 )
      ( DELIVER-PKG-VERIFY ?AUTO_9380 ?AUTO_9381 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9418 - OBJ
      ?AUTO_9419 - LOCATION
    )
    :vars
    (
      ?AUTO_9423 - LOCATION
      ?AUTO_9424 - CITY
      ?AUTO_9422 - LOCATION
      ?AUTO_9421 - LOCATION
      ?AUTO_9425 - AIRPLANE
      ?AUTO_9420 - TRUCK
      ?AUTO_9426 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9423 ?AUTO_9424 ) ( IN-CITY ?AUTO_9419 ?AUTO_9424 ) ( not ( = ?AUTO_9419 ?AUTO_9423 ) ) ( AIRPORT ?AUTO_9422 ) ( AIRPORT ?AUTO_9423 ) ( not ( = ?AUTO_9422 ?AUTO_9423 ) ) ( not ( = ?AUTO_9419 ?AUTO_9422 ) ) ( OBJ-AT ?AUTO_9418 ?AUTO_9422 ) ( AIRPORT ?AUTO_9421 ) ( AIRPLANE-AT ?AUTO_9425 ?AUTO_9421 ) ( not ( = ?AUTO_9421 ?AUTO_9422 ) ) ( not ( = ?AUTO_9419 ?AUTO_9421 ) ) ( not ( = ?AUTO_9423 ?AUTO_9421 ) ) ( TRUCK-AT ?AUTO_9420 ?AUTO_9426 ) ( IN-CITY ?AUTO_9426 ?AUTO_9424 ) ( not ( = ?AUTO_9423 ?AUTO_9426 ) ) ( not ( = ?AUTO_9419 ?AUTO_9426 ) ) ( not ( = ?AUTO_9422 ?AUTO_9426 ) ) ( not ( = ?AUTO_9421 ?AUTO_9426 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9420 ?AUTO_9426 ?AUTO_9423 ?AUTO_9424 )
      ( DELIVER-PKG ?AUTO_9418 ?AUTO_9419 )
      ( DELIVER-PKG-VERIFY ?AUTO_9418 ?AUTO_9419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9459 - OBJ
      ?AUTO_9460 - LOCATION
    )
    :vars
    (
      ?AUTO_9466 - LOCATION
      ?AUTO_9465 - CITY
      ?AUTO_9463 - LOCATION
      ?AUTO_9462 - LOCATION
      ?AUTO_9464 - AIRPLANE
      ?AUTO_9461 - TRUCK
      ?AUTO_9467 - LOCATION
      ?AUTO_9468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9466 ?AUTO_9465 ) ( IN-CITY ?AUTO_9460 ?AUTO_9465 ) ( not ( = ?AUTO_9460 ?AUTO_9466 ) ) ( AIRPORT ?AUTO_9463 ) ( AIRPORT ?AUTO_9466 ) ( not ( = ?AUTO_9463 ?AUTO_9466 ) ) ( not ( = ?AUTO_9460 ?AUTO_9463 ) ) ( AIRPORT ?AUTO_9462 ) ( not ( = ?AUTO_9462 ?AUTO_9463 ) ) ( not ( = ?AUTO_9460 ?AUTO_9462 ) ) ( not ( = ?AUTO_9466 ?AUTO_9462 ) ) ( AIRPLANE-AT ?AUTO_9464 ?AUTO_9466 ) ( TRUCK-AT ?AUTO_9461 ?AUTO_9467 ) ( IN-CITY ?AUTO_9467 ?AUTO_9465 ) ( not ( = ?AUTO_9466 ?AUTO_9467 ) ) ( not ( = ?AUTO_9460 ?AUTO_9467 ) ) ( not ( = ?AUTO_9463 ?AUTO_9467 ) ) ( not ( = ?AUTO_9462 ?AUTO_9467 ) ) ( TRUCK-AT ?AUTO_9468 ?AUTO_9463 ) ( IN-TRUCK ?AUTO_9459 ?AUTO_9468 ) ( not ( = ?AUTO_9461 ?AUTO_9468 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9459 ?AUTO_9468 ?AUTO_9463 )
      ( DELIVER-PKG ?AUTO_9459 ?AUTO_9460 )
      ( DELIVER-PKG-VERIFY ?AUTO_9459 ?AUTO_9460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9471 - OBJ
      ?AUTO_9472 - LOCATION
    )
    :vars
    (
      ?AUTO_9479 - LOCATION
      ?AUTO_9474 - CITY
      ?AUTO_9473 - LOCATION
      ?AUTO_9477 - AIRPLANE
      ?AUTO_9476 - TRUCK
      ?AUTO_9478 - TRUCK
      ?AUTO_9480 - LOCATION
      ?AUTO_9481 - CITY
      ?AUTO_9475 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9479 ?AUTO_9474 ) ( IN-CITY ?AUTO_9472 ?AUTO_9474 ) ( not ( = ?AUTO_9472 ?AUTO_9479 ) ) ( AIRPORT ?AUTO_9473 ) ( AIRPORT ?AUTO_9479 ) ( not ( = ?AUTO_9473 ?AUTO_9479 ) ) ( not ( = ?AUTO_9472 ?AUTO_9473 ) ) ( AIRPLANE-AT ?AUTO_9477 ?AUTO_9479 ) ( not ( = ?AUTO_9476 ?AUTO_9478 ) ) ( TRUCK-AT ?AUTO_9478 ?AUTO_9480 ) ( IN-CITY ?AUTO_9480 ?AUTO_9481 ) ( IN-CITY ?AUTO_9473 ?AUTO_9481 ) ( not ( = ?AUTO_9473 ?AUTO_9480 ) ) ( not ( = ?AUTO_9472 ?AUTO_9480 ) ) ( not ( = ?AUTO_9479 ?AUTO_9480 ) ) ( not ( = ?AUTO_9474 ?AUTO_9481 ) ) ( TRUCK-AT ?AUTO_9476 ?AUTO_9475 ) ( IN-CITY ?AUTO_9475 ?AUTO_9474 ) ( not ( = ?AUTO_9479 ?AUTO_9475 ) ) ( not ( = ?AUTO_9472 ?AUTO_9475 ) ) ( not ( = ?AUTO_9473 ?AUTO_9475 ) ) ( not ( = ?AUTO_9480 ?AUTO_9475 ) ) ( OBJ-AT ?AUTO_9471 ?AUTO_9480 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9471 ?AUTO_9478 ?AUTO_9480 )
      ( DELIVER-PKG ?AUTO_9471 ?AUTO_9472 )
      ( DELIVER-PKG-VERIFY ?AUTO_9471 ?AUTO_9472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9482 - OBJ
      ?AUTO_9483 - LOCATION
    )
    :vars
    (
      ?AUTO_9489 - LOCATION
      ?AUTO_9485 - CITY
      ?AUTO_9484 - LOCATION
      ?AUTO_9487 - AIRPLANE
      ?AUTO_9486 - TRUCK
      ?AUTO_9488 - TRUCK
      ?AUTO_9492 - LOCATION
      ?AUTO_9491 - CITY
      ?AUTO_9490 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9489 ?AUTO_9485 ) ( IN-CITY ?AUTO_9483 ?AUTO_9485 ) ( not ( = ?AUTO_9483 ?AUTO_9489 ) ) ( AIRPORT ?AUTO_9484 ) ( AIRPORT ?AUTO_9489 ) ( not ( = ?AUTO_9484 ?AUTO_9489 ) ) ( not ( = ?AUTO_9483 ?AUTO_9484 ) ) ( AIRPLANE-AT ?AUTO_9487 ?AUTO_9489 ) ( not ( = ?AUTO_9486 ?AUTO_9488 ) ) ( IN-CITY ?AUTO_9492 ?AUTO_9491 ) ( IN-CITY ?AUTO_9484 ?AUTO_9491 ) ( not ( = ?AUTO_9484 ?AUTO_9492 ) ) ( not ( = ?AUTO_9483 ?AUTO_9492 ) ) ( not ( = ?AUTO_9489 ?AUTO_9492 ) ) ( not ( = ?AUTO_9485 ?AUTO_9491 ) ) ( TRUCK-AT ?AUTO_9486 ?AUTO_9490 ) ( IN-CITY ?AUTO_9490 ?AUTO_9485 ) ( not ( = ?AUTO_9489 ?AUTO_9490 ) ) ( not ( = ?AUTO_9483 ?AUTO_9490 ) ) ( not ( = ?AUTO_9484 ?AUTO_9490 ) ) ( not ( = ?AUTO_9492 ?AUTO_9490 ) ) ( OBJ-AT ?AUTO_9482 ?AUTO_9492 ) ( TRUCK-AT ?AUTO_9488 ?AUTO_9484 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9488 ?AUTO_9484 ?AUTO_9492 ?AUTO_9491 )
      ( DELIVER-PKG ?AUTO_9482 ?AUTO_9483 )
      ( DELIVER-PKG-VERIFY ?AUTO_9482 ?AUTO_9483 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9495 - OBJ
      ?AUTO_9496 - LOCATION
    )
    :vars
    (
      ?AUTO_9497 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9497 ?AUTO_9496 ) ( IN-TRUCK ?AUTO_9495 ?AUTO_9497 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9495 ?AUTO_9497 ?AUTO_9496 )
      ( DELIVER-PKG-VERIFY ?AUTO_9495 ?AUTO_9496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9498 - OBJ
      ?AUTO_9499 - LOCATION
    )
    :vars
    (
      ?AUTO_9500 - TRUCK
      ?AUTO_9501 - LOCATION
      ?AUTO_9502 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9498 ?AUTO_9500 ) ( TRUCK-AT ?AUTO_9500 ?AUTO_9501 ) ( IN-CITY ?AUTO_9501 ?AUTO_9502 ) ( IN-CITY ?AUTO_9499 ?AUTO_9502 ) ( not ( = ?AUTO_9499 ?AUTO_9501 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9500 ?AUTO_9501 ?AUTO_9499 ?AUTO_9502 )
      ( DELIVER-PKG ?AUTO_9498 ?AUTO_9499 )
      ( DELIVER-PKG-VERIFY ?AUTO_9498 ?AUTO_9499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9503 - OBJ
      ?AUTO_9504 - LOCATION
    )
    :vars
    (
      ?AUTO_9505 - TRUCK
      ?AUTO_9506 - LOCATION
      ?AUTO_9507 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9505 ?AUTO_9506 ) ( IN-CITY ?AUTO_9506 ?AUTO_9507 ) ( IN-CITY ?AUTO_9504 ?AUTO_9507 ) ( not ( = ?AUTO_9504 ?AUTO_9506 ) ) ( OBJ-AT ?AUTO_9503 ?AUTO_9506 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9503 ?AUTO_9505 ?AUTO_9506 )
      ( DELIVER-PKG ?AUTO_9503 ?AUTO_9504 )
      ( DELIVER-PKG-VERIFY ?AUTO_9503 ?AUTO_9504 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9508 - OBJ
      ?AUTO_9509 - LOCATION
    )
    :vars
    (
      ?AUTO_9510 - LOCATION
      ?AUTO_9512 - CITY
      ?AUTO_9511 - TRUCK
      ?AUTO_9513 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9510 ?AUTO_9512 ) ( IN-CITY ?AUTO_9509 ?AUTO_9512 ) ( not ( = ?AUTO_9509 ?AUTO_9510 ) ) ( OBJ-AT ?AUTO_9508 ?AUTO_9510 ) ( TRUCK-AT ?AUTO_9511 ?AUTO_9513 ) ( IN-CITY ?AUTO_9513 ?AUTO_9512 ) ( not ( = ?AUTO_9510 ?AUTO_9513 ) ) ( not ( = ?AUTO_9509 ?AUTO_9513 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9511 ?AUTO_9513 ?AUTO_9510 ?AUTO_9512 )
      ( DELIVER-PKG ?AUTO_9508 ?AUTO_9509 )
      ( DELIVER-PKG-VERIFY ?AUTO_9508 ?AUTO_9509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9516 - OBJ
      ?AUTO_9517 - LOCATION
    )
    :vars
    (
      ?AUTO_9518 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9516 ?AUTO_9518 ) ( AIRPLANE-AT ?AUTO_9518 ?AUTO_9517 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9516 ?AUTO_9518 ?AUTO_9517 )
      ( DELIVER-PKG-VERIFY ?AUTO_9516 ?AUTO_9517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9519 - OBJ
      ?AUTO_9520 - LOCATION
    )
    :vars
    (
      ?AUTO_9521 - AIRPLANE
      ?AUTO_9522 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9519 ?AUTO_9521 ) ( AIRPORT ?AUTO_9522 ) ( AIRPORT ?AUTO_9520 ) ( AIRPLANE-AT ?AUTO_9521 ?AUTO_9522 ) ( not ( = ?AUTO_9522 ?AUTO_9520 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9521 ?AUTO_9522 ?AUTO_9520 )
      ( DELIVER-PKG ?AUTO_9519 ?AUTO_9520 )
      ( DELIVER-PKG-VERIFY ?AUTO_9519 ?AUTO_9520 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9523 - OBJ
      ?AUTO_9524 - LOCATION
    )
    :vars
    (
      ?AUTO_9526 - LOCATION
      ?AUTO_9525 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9526 ) ( AIRPORT ?AUTO_9524 ) ( AIRPLANE-AT ?AUTO_9525 ?AUTO_9526 ) ( not ( = ?AUTO_9526 ?AUTO_9524 ) ) ( OBJ-AT ?AUTO_9523 ?AUTO_9526 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9523 ?AUTO_9525 ?AUTO_9526 )
      ( DELIVER-PKG ?AUTO_9523 ?AUTO_9524 )
      ( DELIVER-PKG-VERIFY ?AUTO_9523 ?AUTO_9524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9527 - OBJ
      ?AUTO_9528 - LOCATION
    )
    :vars
    (
      ?AUTO_9530 - LOCATION
      ?AUTO_9531 - LOCATION
      ?AUTO_9529 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9530 ) ( AIRPORT ?AUTO_9528 ) ( not ( = ?AUTO_9530 ?AUTO_9528 ) ) ( OBJ-AT ?AUTO_9527 ?AUTO_9530 ) ( AIRPORT ?AUTO_9531 ) ( AIRPLANE-AT ?AUTO_9529 ?AUTO_9531 ) ( not ( = ?AUTO_9531 ?AUTO_9530 ) ) ( not ( = ?AUTO_9528 ?AUTO_9531 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9529 ?AUTO_9531 ?AUTO_9530 )
      ( DELIVER-PKG ?AUTO_9527 ?AUTO_9528 )
      ( DELIVER-PKG-VERIFY ?AUTO_9527 ?AUTO_9528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9532 - OBJ
      ?AUTO_9533 - LOCATION
    )
    :vars
    (
      ?AUTO_9534 - LOCATION
      ?AUTO_9536 - LOCATION
      ?AUTO_9535 - AIRPLANE
      ?AUTO_9537 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9534 ) ( AIRPORT ?AUTO_9533 ) ( not ( = ?AUTO_9534 ?AUTO_9533 ) ) ( AIRPORT ?AUTO_9536 ) ( AIRPLANE-AT ?AUTO_9535 ?AUTO_9536 ) ( not ( = ?AUTO_9536 ?AUTO_9534 ) ) ( not ( = ?AUTO_9533 ?AUTO_9536 ) ) ( TRUCK-AT ?AUTO_9537 ?AUTO_9534 ) ( IN-TRUCK ?AUTO_9532 ?AUTO_9537 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9532 ?AUTO_9537 ?AUTO_9534 )
      ( DELIVER-PKG ?AUTO_9532 ?AUTO_9533 )
      ( DELIVER-PKG-VERIFY ?AUTO_9532 ?AUTO_9533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9538 - OBJ
      ?AUTO_9539 - LOCATION
    )
    :vars
    (
      ?AUTO_9540 - LOCATION
      ?AUTO_9542 - LOCATION
      ?AUTO_9541 - AIRPLANE
      ?AUTO_9543 - TRUCK
      ?AUTO_9544 - LOCATION
      ?AUTO_9545 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9540 ) ( AIRPORT ?AUTO_9539 ) ( not ( = ?AUTO_9540 ?AUTO_9539 ) ) ( AIRPORT ?AUTO_9542 ) ( AIRPLANE-AT ?AUTO_9541 ?AUTO_9542 ) ( not ( = ?AUTO_9542 ?AUTO_9540 ) ) ( not ( = ?AUTO_9539 ?AUTO_9542 ) ) ( IN-TRUCK ?AUTO_9538 ?AUTO_9543 ) ( TRUCK-AT ?AUTO_9543 ?AUTO_9544 ) ( IN-CITY ?AUTO_9544 ?AUTO_9545 ) ( IN-CITY ?AUTO_9540 ?AUTO_9545 ) ( not ( = ?AUTO_9540 ?AUTO_9544 ) ) ( not ( = ?AUTO_9539 ?AUTO_9544 ) ) ( not ( = ?AUTO_9542 ?AUTO_9544 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9543 ?AUTO_9544 ?AUTO_9540 ?AUTO_9545 )
      ( DELIVER-PKG ?AUTO_9538 ?AUTO_9539 )
      ( DELIVER-PKG-VERIFY ?AUTO_9538 ?AUTO_9539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9546 - OBJ
      ?AUTO_9547 - LOCATION
    )
    :vars
    (
      ?AUTO_9552 - LOCATION
      ?AUTO_9553 - LOCATION
      ?AUTO_9548 - AIRPLANE
      ?AUTO_9551 - TRUCK
      ?AUTO_9549 - LOCATION
      ?AUTO_9550 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9552 ) ( AIRPORT ?AUTO_9547 ) ( not ( = ?AUTO_9552 ?AUTO_9547 ) ) ( AIRPORT ?AUTO_9553 ) ( AIRPLANE-AT ?AUTO_9548 ?AUTO_9553 ) ( not ( = ?AUTO_9553 ?AUTO_9552 ) ) ( not ( = ?AUTO_9547 ?AUTO_9553 ) ) ( TRUCK-AT ?AUTO_9551 ?AUTO_9549 ) ( IN-CITY ?AUTO_9549 ?AUTO_9550 ) ( IN-CITY ?AUTO_9552 ?AUTO_9550 ) ( not ( = ?AUTO_9552 ?AUTO_9549 ) ) ( not ( = ?AUTO_9547 ?AUTO_9549 ) ) ( not ( = ?AUTO_9553 ?AUTO_9549 ) ) ( OBJ-AT ?AUTO_9546 ?AUTO_9549 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9546 ?AUTO_9551 ?AUTO_9549 )
      ( DELIVER-PKG ?AUTO_9546 ?AUTO_9547 )
      ( DELIVER-PKG-VERIFY ?AUTO_9546 ?AUTO_9547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9554 - OBJ
      ?AUTO_9555 - LOCATION
    )
    :vars
    (
      ?AUTO_9558 - LOCATION
      ?AUTO_9559 - LOCATION
      ?AUTO_9556 - AIRPLANE
      ?AUTO_9557 - LOCATION
      ?AUTO_9560 - CITY
      ?AUTO_9561 - TRUCK
      ?AUTO_9562 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9558 ) ( AIRPORT ?AUTO_9555 ) ( not ( = ?AUTO_9558 ?AUTO_9555 ) ) ( AIRPORT ?AUTO_9559 ) ( AIRPLANE-AT ?AUTO_9556 ?AUTO_9559 ) ( not ( = ?AUTO_9559 ?AUTO_9558 ) ) ( not ( = ?AUTO_9555 ?AUTO_9559 ) ) ( IN-CITY ?AUTO_9557 ?AUTO_9560 ) ( IN-CITY ?AUTO_9558 ?AUTO_9560 ) ( not ( = ?AUTO_9558 ?AUTO_9557 ) ) ( not ( = ?AUTO_9555 ?AUTO_9557 ) ) ( not ( = ?AUTO_9559 ?AUTO_9557 ) ) ( OBJ-AT ?AUTO_9554 ?AUTO_9557 ) ( TRUCK-AT ?AUTO_9561 ?AUTO_9562 ) ( IN-CITY ?AUTO_9562 ?AUTO_9560 ) ( not ( = ?AUTO_9557 ?AUTO_9562 ) ) ( not ( = ?AUTO_9555 ?AUTO_9562 ) ) ( not ( = ?AUTO_9558 ?AUTO_9562 ) ) ( not ( = ?AUTO_9559 ?AUTO_9562 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9561 ?AUTO_9562 ?AUTO_9557 ?AUTO_9560 )
      ( DELIVER-PKG ?AUTO_9554 ?AUTO_9555 )
      ( DELIVER-PKG-VERIFY ?AUTO_9554 ?AUTO_9555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9565 - OBJ
      ?AUTO_9566 - LOCATION
    )
    :vars
    (
      ?AUTO_9567 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9567 ?AUTO_9566 ) ( IN-TRUCK ?AUTO_9565 ?AUTO_9567 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9565 ?AUTO_9567 ?AUTO_9566 )
      ( DELIVER-PKG-VERIFY ?AUTO_9565 ?AUTO_9566 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9568 - OBJ
      ?AUTO_9569 - LOCATION
    )
    :vars
    (
      ?AUTO_9570 - TRUCK
      ?AUTO_9571 - LOCATION
      ?AUTO_9572 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9568 ?AUTO_9570 ) ( TRUCK-AT ?AUTO_9570 ?AUTO_9571 ) ( IN-CITY ?AUTO_9571 ?AUTO_9572 ) ( IN-CITY ?AUTO_9569 ?AUTO_9572 ) ( not ( = ?AUTO_9569 ?AUTO_9571 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9570 ?AUTO_9571 ?AUTO_9569 ?AUTO_9572 )
      ( DELIVER-PKG ?AUTO_9568 ?AUTO_9569 )
      ( DELIVER-PKG-VERIFY ?AUTO_9568 ?AUTO_9569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9577 - OBJ
      ?AUTO_9578 - LOCATION
    )
    :vars
    (
      ?AUTO_9581 - TRUCK
      ?AUTO_9579 - LOCATION
      ?AUTO_9580 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9581 ?AUTO_9579 ) ( IN-CITY ?AUTO_9579 ?AUTO_9580 ) ( IN-CITY ?AUTO_9578 ?AUTO_9580 ) ( not ( = ?AUTO_9578 ?AUTO_9579 ) ) ( OBJ-AT ?AUTO_9577 ?AUTO_9579 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9577 ?AUTO_9581 ?AUTO_9579 )
      ( DELIVER-PKG ?AUTO_9577 ?AUTO_9578 )
      ( DELIVER-PKG-VERIFY ?AUTO_9577 ?AUTO_9578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9600 - OBJ
      ?AUTO_9601 - LOCATION
    )
    :vars
    (
      ?AUTO_9602 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9602 ?AUTO_9601 ) ( IN-TRUCK ?AUTO_9600 ?AUTO_9602 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9600 ?AUTO_9602 ?AUTO_9601 )
      ( DELIVER-PKG-VERIFY ?AUTO_9600 ?AUTO_9601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9603 - OBJ
      ?AUTO_9604 - LOCATION
    )
    :vars
    (
      ?AUTO_9605 - TRUCK
      ?AUTO_9606 - LOCATION
      ?AUTO_9607 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9603 ?AUTO_9605 ) ( TRUCK-AT ?AUTO_9605 ?AUTO_9606 ) ( IN-CITY ?AUTO_9606 ?AUTO_9607 ) ( IN-CITY ?AUTO_9604 ?AUTO_9607 ) ( not ( = ?AUTO_9604 ?AUTO_9606 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9605 ?AUTO_9606 ?AUTO_9604 ?AUTO_9607 )
      ( DELIVER-PKG ?AUTO_9603 ?AUTO_9604 )
      ( DELIVER-PKG-VERIFY ?AUTO_9603 ?AUTO_9604 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9612 - OBJ
      ?AUTO_9613 - LOCATION
    )
    :vars
    (
      ?AUTO_9616 - TRUCK
      ?AUTO_9614 - LOCATION
      ?AUTO_9615 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9616 ?AUTO_9614 ) ( IN-CITY ?AUTO_9614 ?AUTO_9615 ) ( IN-CITY ?AUTO_9613 ?AUTO_9615 ) ( not ( = ?AUTO_9613 ?AUTO_9614 ) ) ( OBJ-AT ?AUTO_9612 ?AUTO_9614 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9612 ?AUTO_9616 ?AUTO_9614 )
      ( DELIVER-PKG ?AUTO_9612 ?AUTO_9613 )
      ( DELIVER-PKG-VERIFY ?AUTO_9612 ?AUTO_9613 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9617 - OBJ
      ?AUTO_9618 - LOCATION
    )
    :vars
    (
      ?AUTO_9620 - LOCATION
      ?AUTO_9619 - CITY
      ?AUTO_9621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9620 ?AUTO_9619 ) ( IN-CITY ?AUTO_9618 ?AUTO_9619 ) ( not ( = ?AUTO_9618 ?AUTO_9620 ) ) ( OBJ-AT ?AUTO_9617 ?AUTO_9620 ) ( TRUCK-AT ?AUTO_9621 ?AUTO_9618 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9621 ?AUTO_9618 ?AUTO_9620 ?AUTO_9619 )
      ( DELIVER-PKG ?AUTO_9617 ?AUTO_9618 )
      ( DELIVER-PKG-VERIFY ?AUTO_9617 ?AUTO_9618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9624 - OBJ
      ?AUTO_9625 - LOCATION
    )
    :vars
    (
      ?AUTO_9627 - LOCATION
      ?AUTO_9628 - CITY
      ?AUTO_9626 - TRUCK
      ?AUTO_9629 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9627 ?AUTO_9628 ) ( IN-CITY ?AUTO_9625 ?AUTO_9628 ) ( not ( = ?AUTO_9625 ?AUTO_9627 ) ) ( TRUCK-AT ?AUTO_9626 ?AUTO_9625 ) ( IN-AIRPLANE ?AUTO_9624 ?AUTO_9629 ) ( AIRPLANE-AT ?AUTO_9629 ?AUTO_9627 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9624 ?AUTO_9629 ?AUTO_9627 )
      ( DELIVER-PKG ?AUTO_9624 ?AUTO_9625 )
      ( DELIVER-PKG-VERIFY ?AUTO_9624 ?AUTO_9625 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9630 - OBJ
      ?AUTO_9631 - LOCATION
    )
    :vars
    (
      ?AUTO_9634 - LOCATION
      ?AUTO_9632 - CITY
      ?AUTO_9633 - TRUCK
      ?AUTO_9635 - AIRPLANE
      ?AUTO_9636 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9634 ?AUTO_9632 ) ( IN-CITY ?AUTO_9631 ?AUTO_9632 ) ( not ( = ?AUTO_9631 ?AUTO_9634 ) ) ( TRUCK-AT ?AUTO_9633 ?AUTO_9631 ) ( IN-AIRPLANE ?AUTO_9630 ?AUTO_9635 ) ( AIRPORT ?AUTO_9636 ) ( AIRPORT ?AUTO_9634 ) ( AIRPLANE-AT ?AUTO_9635 ?AUTO_9636 ) ( not ( = ?AUTO_9636 ?AUTO_9634 ) ) ( not ( = ?AUTO_9631 ?AUTO_9636 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9635 ?AUTO_9636 ?AUTO_9634 )
      ( DELIVER-PKG ?AUTO_9630 ?AUTO_9631 )
      ( DELIVER-PKG-VERIFY ?AUTO_9630 ?AUTO_9631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9637 - OBJ
      ?AUTO_9638 - LOCATION
    )
    :vars
    (
      ?AUTO_9641 - LOCATION
      ?AUTO_9639 - CITY
      ?AUTO_9640 - TRUCK
      ?AUTO_9642 - LOCATION
      ?AUTO_9643 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9641 ?AUTO_9639 ) ( IN-CITY ?AUTO_9638 ?AUTO_9639 ) ( not ( = ?AUTO_9638 ?AUTO_9641 ) ) ( TRUCK-AT ?AUTO_9640 ?AUTO_9638 ) ( AIRPORT ?AUTO_9642 ) ( AIRPORT ?AUTO_9641 ) ( AIRPLANE-AT ?AUTO_9643 ?AUTO_9642 ) ( not ( = ?AUTO_9642 ?AUTO_9641 ) ) ( not ( = ?AUTO_9638 ?AUTO_9642 ) ) ( OBJ-AT ?AUTO_9637 ?AUTO_9642 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9637 ?AUTO_9643 ?AUTO_9642 )
      ( DELIVER-PKG ?AUTO_9637 ?AUTO_9638 )
      ( DELIVER-PKG-VERIFY ?AUTO_9637 ?AUTO_9638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9644 - OBJ
      ?AUTO_9645 - LOCATION
    )
    :vars
    (
      ?AUTO_9647 - LOCATION
      ?AUTO_9649 - CITY
      ?AUTO_9648 - TRUCK
      ?AUTO_9646 - LOCATION
      ?AUTO_9651 - LOCATION
      ?AUTO_9650 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9647 ?AUTO_9649 ) ( IN-CITY ?AUTO_9645 ?AUTO_9649 ) ( not ( = ?AUTO_9645 ?AUTO_9647 ) ) ( TRUCK-AT ?AUTO_9648 ?AUTO_9645 ) ( AIRPORT ?AUTO_9646 ) ( AIRPORT ?AUTO_9647 ) ( not ( = ?AUTO_9646 ?AUTO_9647 ) ) ( not ( = ?AUTO_9645 ?AUTO_9646 ) ) ( OBJ-AT ?AUTO_9644 ?AUTO_9646 ) ( AIRPORT ?AUTO_9651 ) ( AIRPLANE-AT ?AUTO_9650 ?AUTO_9651 ) ( not ( = ?AUTO_9651 ?AUTO_9646 ) ) ( not ( = ?AUTO_9645 ?AUTO_9651 ) ) ( not ( = ?AUTO_9647 ?AUTO_9651 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9650 ?AUTO_9651 ?AUTO_9646 )
      ( DELIVER-PKG ?AUTO_9644 ?AUTO_9645 )
      ( DELIVER-PKG-VERIFY ?AUTO_9644 ?AUTO_9645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9652 - OBJ
      ?AUTO_9653 - LOCATION
    )
    :vars
    (
      ?AUTO_9658 - LOCATION
      ?AUTO_9655 - CITY
      ?AUTO_9654 - TRUCK
      ?AUTO_9656 - LOCATION
      ?AUTO_9659 - LOCATION
      ?AUTO_9657 - AIRPLANE
      ?AUTO_9660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9658 ?AUTO_9655 ) ( IN-CITY ?AUTO_9653 ?AUTO_9655 ) ( not ( = ?AUTO_9653 ?AUTO_9658 ) ) ( TRUCK-AT ?AUTO_9654 ?AUTO_9653 ) ( AIRPORT ?AUTO_9656 ) ( AIRPORT ?AUTO_9658 ) ( not ( = ?AUTO_9656 ?AUTO_9658 ) ) ( not ( = ?AUTO_9653 ?AUTO_9656 ) ) ( AIRPORT ?AUTO_9659 ) ( AIRPLANE-AT ?AUTO_9657 ?AUTO_9659 ) ( not ( = ?AUTO_9659 ?AUTO_9656 ) ) ( not ( = ?AUTO_9653 ?AUTO_9659 ) ) ( not ( = ?AUTO_9658 ?AUTO_9659 ) ) ( TRUCK-AT ?AUTO_9660 ?AUTO_9656 ) ( IN-TRUCK ?AUTO_9652 ?AUTO_9660 ) ( not ( = ?AUTO_9654 ?AUTO_9660 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9652 ?AUTO_9660 ?AUTO_9656 )
      ( DELIVER-PKG ?AUTO_9652 ?AUTO_9653 )
      ( DELIVER-PKG-VERIFY ?AUTO_9652 ?AUTO_9653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9661 - OBJ
      ?AUTO_9662 - LOCATION
    )
    :vars
    (
      ?AUTO_9668 - LOCATION
      ?AUTO_9664 - CITY
      ?AUTO_9663 - TRUCK
      ?AUTO_9669 - LOCATION
      ?AUTO_9665 - LOCATION
      ?AUTO_9667 - AIRPLANE
      ?AUTO_9666 - TRUCK
      ?AUTO_9670 - LOCATION
      ?AUTO_9671 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9668 ?AUTO_9664 ) ( IN-CITY ?AUTO_9662 ?AUTO_9664 ) ( not ( = ?AUTO_9662 ?AUTO_9668 ) ) ( TRUCK-AT ?AUTO_9663 ?AUTO_9662 ) ( AIRPORT ?AUTO_9669 ) ( AIRPORT ?AUTO_9668 ) ( not ( = ?AUTO_9669 ?AUTO_9668 ) ) ( not ( = ?AUTO_9662 ?AUTO_9669 ) ) ( AIRPORT ?AUTO_9665 ) ( AIRPLANE-AT ?AUTO_9667 ?AUTO_9665 ) ( not ( = ?AUTO_9665 ?AUTO_9669 ) ) ( not ( = ?AUTO_9662 ?AUTO_9665 ) ) ( not ( = ?AUTO_9668 ?AUTO_9665 ) ) ( IN-TRUCK ?AUTO_9661 ?AUTO_9666 ) ( not ( = ?AUTO_9663 ?AUTO_9666 ) ) ( TRUCK-AT ?AUTO_9666 ?AUTO_9670 ) ( IN-CITY ?AUTO_9670 ?AUTO_9671 ) ( IN-CITY ?AUTO_9669 ?AUTO_9671 ) ( not ( = ?AUTO_9669 ?AUTO_9670 ) ) ( not ( = ?AUTO_9662 ?AUTO_9670 ) ) ( not ( = ?AUTO_9668 ?AUTO_9670 ) ) ( not ( = ?AUTO_9664 ?AUTO_9671 ) ) ( not ( = ?AUTO_9665 ?AUTO_9670 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9666 ?AUTO_9670 ?AUTO_9669 ?AUTO_9671 )
      ( DELIVER-PKG ?AUTO_9661 ?AUTO_9662 )
      ( DELIVER-PKG-VERIFY ?AUTO_9661 ?AUTO_9662 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9672 - OBJ
      ?AUTO_9673 - LOCATION
    )
    :vars
    (
      ?AUTO_9675 - LOCATION
      ?AUTO_9674 - CITY
      ?AUTO_9677 - TRUCK
      ?AUTO_9676 - LOCATION
      ?AUTO_9680 - LOCATION
      ?AUTO_9678 - AIRPLANE
      ?AUTO_9679 - TRUCK
      ?AUTO_9681 - LOCATION
      ?AUTO_9682 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9675 ?AUTO_9674 ) ( IN-CITY ?AUTO_9673 ?AUTO_9674 ) ( not ( = ?AUTO_9673 ?AUTO_9675 ) ) ( TRUCK-AT ?AUTO_9677 ?AUTO_9673 ) ( AIRPORT ?AUTO_9676 ) ( AIRPORT ?AUTO_9675 ) ( not ( = ?AUTO_9676 ?AUTO_9675 ) ) ( not ( = ?AUTO_9673 ?AUTO_9676 ) ) ( AIRPORT ?AUTO_9680 ) ( AIRPLANE-AT ?AUTO_9678 ?AUTO_9680 ) ( not ( = ?AUTO_9680 ?AUTO_9676 ) ) ( not ( = ?AUTO_9673 ?AUTO_9680 ) ) ( not ( = ?AUTO_9675 ?AUTO_9680 ) ) ( not ( = ?AUTO_9677 ?AUTO_9679 ) ) ( TRUCK-AT ?AUTO_9679 ?AUTO_9681 ) ( IN-CITY ?AUTO_9681 ?AUTO_9682 ) ( IN-CITY ?AUTO_9676 ?AUTO_9682 ) ( not ( = ?AUTO_9676 ?AUTO_9681 ) ) ( not ( = ?AUTO_9673 ?AUTO_9681 ) ) ( not ( = ?AUTO_9675 ?AUTO_9681 ) ) ( not ( = ?AUTO_9674 ?AUTO_9682 ) ) ( not ( = ?AUTO_9680 ?AUTO_9681 ) ) ( OBJ-AT ?AUTO_9672 ?AUTO_9681 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9672 ?AUTO_9679 ?AUTO_9681 )
      ( DELIVER-PKG ?AUTO_9672 ?AUTO_9673 )
      ( DELIVER-PKG-VERIFY ?AUTO_9672 ?AUTO_9673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9683 - OBJ
      ?AUTO_9684 - LOCATION
    )
    :vars
    (
      ?AUTO_9685 - LOCATION
      ?AUTO_9686 - CITY
      ?AUTO_9689 - TRUCK
      ?AUTO_9687 - LOCATION
      ?AUTO_9692 - LOCATION
      ?AUTO_9688 - AIRPLANE
      ?AUTO_9691 - TRUCK
      ?AUTO_9690 - LOCATION
      ?AUTO_9693 - CITY
      ?AUTO_9694 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9685 ?AUTO_9686 ) ( IN-CITY ?AUTO_9684 ?AUTO_9686 ) ( not ( = ?AUTO_9684 ?AUTO_9685 ) ) ( TRUCK-AT ?AUTO_9689 ?AUTO_9684 ) ( AIRPORT ?AUTO_9687 ) ( AIRPORT ?AUTO_9685 ) ( not ( = ?AUTO_9687 ?AUTO_9685 ) ) ( not ( = ?AUTO_9684 ?AUTO_9687 ) ) ( AIRPORT ?AUTO_9692 ) ( AIRPLANE-AT ?AUTO_9688 ?AUTO_9692 ) ( not ( = ?AUTO_9692 ?AUTO_9687 ) ) ( not ( = ?AUTO_9684 ?AUTO_9692 ) ) ( not ( = ?AUTO_9685 ?AUTO_9692 ) ) ( not ( = ?AUTO_9689 ?AUTO_9691 ) ) ( IN-CITY ?AUTO_9690 ?AUTO_9693 ) ( IN-CITY ?AUTO_9687 ?AUTO_9693 ) ( not ( = ?AUTO_9687 ?AUTO_9690 ) ) ( not ( = ?AUTO_9684 ?AUTO_9690 ) ) ( not ( = ?AUTO_9685 ?AUTO_9690 ) ) ( not ( = ?AUTO_9686 ?AUTO_9693 ) ) ( not ( = ?AUTO_9692 ?AUTO_9690 ) ) ( OBJ-AT ?AUTO_9683 ?AUTO_9690 ) ( TRUCK-AT ?AUTO_9691 ?AUTO_9694 ) ( IN-CITY ?AUTO_9694 ?AUTO_9693 ) ( not ( = ?AUTO_9690 ?AUTO_9694 ) ) ( not ( = ?AUTO_9684 ?AUTO_9694 ) ) ( not ( = ?AUTO_9685 ?AUTO_9694 ) ) ( not ( = ?AUTO_9687 ?AUTO_9694 ) ) ( not ( = ?AUTO_9692 ?AUTO_9694 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9691 ?AUTO_9694 ?AUTO_9690 ?AUTO_9693 )
      ( DELIVER-PKG ?AUTO_9683 ?AUTO_9684 )
      ( DELIVER-PKG-VERIFY ?AUTO_9683 ?AUTO_9684 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9697 - OBJ
      ?AUTO_9698 - LOCATION
    )
    :vars
    (
      ?AUTO_9699 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9699 ?AUTO_9698 ) ( IN-TRUCK ?AUTO_9697 ?AUTO_9699 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9697 ?AUTO_9699 ?AUTO_9698 )
      ( DELIVER-PKG-VERIFY ?AUTO_9697 ?AUTO_9698 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9704 - OBJ
      ?AUTO_9705 - LOCATION
    )
    :vars
    (
      ?AUTO_9706 - TRUCK
      ?AUTO_9707 - LOCATION
      ?AUTO_9708 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9704 ?AUTO_9706 ) ( TRUCK-AT ?AUTO_9706 ?AUTO_9707 ) ( IN-CITY ?AUTO_9707 ?AUTO_9708 ) ( IN-CITY ?AUTO_9705 ?AUTO_9708 ) ( not ( = ?AUTO_9705 ?AUTO_9707 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9706 ?AUTO_9707 ?AUTO_9705 ?AUTO_9708 )
      ( DELIVER-PKG ?AUTO_9704 ?AUTO_9705 )
      ( DELIVER-PKG-VERIFY ?AUTO_9704 ?AUTO_9705 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9713 - OBJ
      ?AUTO_9714 - LOCATION
    )
    :vars
    (
      ?AUTO_9717 - TRUCK
      ?AUTO_9715 - LOCATION
      ?AUTO_9716 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9717 ?AUTO_9715 ) ( IN-CITY ?AUTO_9715 ?AUTO_9716 ) ( IN-CITY ?AUTO_9714 ?AUTO_9716 ) ( not ( = ?AUTO_9714 ?AUTO_9715 ) ) ( OBJ-AT ?AUTO_9713 ?AUTO_9715 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9713 ?AUTO_9717 ?AUTO_9715 )
      ( DELIVER-PKG ?AUTO_9713 ?AUTO_9714 )
      ( DELIVER-PKG-VERIFY ?AUTO_9713 ?AUTO_9714 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9720 - OBJ
      ?AUTO_9721 - LOCATION
    )
    :vars
    (
      ?AUTO_9722 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9722 ?AUTO_9721 ) ( IN-TRUCK ?AUTO_9720 ?AUTO_9722 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9720 ?AUTO_9722 ?AUTO_9721 )
      ( DELIVER-PKG-VERIFY ?AUTO_9720 ?AUTO_9721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9731 - OBJ
      ?AUTO_9732 - LOCATION
    )
    :vars
    (
      ?AUTO_9734 - TRUCK
      ?AUTO_9733 - LOCATION
      ?AUTO_9735 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9734 ?AUTO_9733 ) ( IN-CITY ?AUTO_9733 ?AUTO_9735 ) ( IN-CITY ?AUTO_9732 ?AUTO_9735 ) ( not ( = ?AUTO_9732 ?AUTO_9733 ) ) ( OBJ-AT ?AUTO_9731 ?AUTO_9733 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9731 ?AUTO_9734 ?AUTO_9733 )
      ( DELIVER-PKG ?AUTO_9731 ?AUTO_9732 )
      ( DELIVER-PKG-VERIFY ?AUTO_9731 ?AUTO_9732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9736 - OBJ
      ?AUTO_9737 - LOCATION
    )
    :vars
    (
      ?AUTO_9739 - LOCATION
      ?AUTO_9740 - CITY
      ?AUTO_9738 - TRUCK
      ?AUTO_9741 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9739 ?AUTO_9740 ) ( IN-CITY ?AUTO_9737 ?AUTO_9740 ) ( not ( = ?AUTO_9737 ?AUTO_9739 ) ) ( OBJ-AT ?AUTO_9736 ?AUTO_9739 ) ( TRUCK-AT ?AUTO_9738 ?AUTO_9741 ) ( IN-CITY ?AUTO_9741 ?AUTO_9740 ) ( not ( = ?AUTO_9739 ?AUTO_9741 ) ) ( not ( = ?AUTO_9737 ?AUTO_9741 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9738 ?AUTO_9741 ?AUTO_9739 ?AUTO_9740 )
      ( DELIVER-PKG ?AUTO_9736 ?AUTO_9737 )
      ( DELIVER-PKG-VERIFY ?AUTO_9736 ?AUTO_9737 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9746 - OBJ
      ?AUTO_9747 - LOCATION
    )
    :vars
    (
      ?AUTO_9748 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9748 ?AUTO_9747 ) ( IN-TRUCK ?AUTO_9746 ?AUTO_9748 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9746 ?AUTO_9748 ?AUTO_9747 )
      ( DELIVER-PKG-VERIFY ?AUTO_9746 ?AUTO_9747 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9755 - OBJ
      ?AUTO_9756 - LOCATION
    )
    :vars
    (
      ?AUTO_9757 - TRUCK
      ?AUTO_9758 - LOCATION
      ?AUTO_9759 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9755 ?AUTO_9757 ) ( TRUCK-AT ?AUTO_9757 ?AUTO_9758 ) ( IN-CITY ?AUTO_9758 ?AUTO_9759 ) ( IN-CITY ?AUTO_9756 ?AUTO_9759 ) ( not ( = ?AUTO_9756 ?AUTO_9758 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9757 ?AUTO_9758 ?AUTO_9756 ?AUTO_9759 )
      ( DELIVER-PKG ?AUTO_9755 ?AUTO_9756 )
      ( DELIVER-PKG-VERIFY ?AUTO_9755 ?AUTO_9756 ) )
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
      ?AUTO_9763 - LOCATION
      ?AUTO_9764 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9762 ?AUTO_9763 ) ( IN-CITY ?AUTO_9763 ?AUTO_9764 ) ( IN-CITY ?AUTO_9761 ?AUTO_9764 ) ( not ( = ?AUTO_9761 ?AUTO_9763 ) ) ( OBJ-AT ?AUTO_9760 ?AUTO_9763 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9760 ?AUTO_9762 ?AUTO_9763 )
      ( DELIVER-PKG ?AUTO_9760 ?AUTO_9761 )
      ( DELIVER-PKG-VERIFY ?AUTO_9760 ?AUTO_9761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9771 - OBJ
      ?AUTO_9772 - LOCATION
    )
    :vars
    (
      ?AUTO_9775 - LOCATION
      ?AUTO_9774 - CITY
      ?AUTO_9773 - TRUCK
      ?AUTO_9776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9775 ?AUTO_9774 ) ( IN-CITY ?AUTO_9772 ?AUTO_9774 ) ( not ( = ?AUTO_9772 ?AUTO_9775 ) ) ( OBJ-AT ?AUTO_9771 ?AUTO_9775 ) ( TRUCK-AT ?AUTO_9773 ?AUTO_9776 ) ( IN-CITY ?AUTO_9776 ?AUTO_9774 ) ( not ( = ?AUTO_9775 ?AUTO_9776 ) ) ( not ( = ?AUTO_9772 ?AUTO_9776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9773 ?AUTO_9776 ?AUTO_9775 ?AUTO_9774 )
      ( DELIVER-PKG ?AUTO_9771 ?AUTO_9772 )
      ( DELIVER-PKG-VERIFY ?AUTO_9771 ?AUTO_9772 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9787 - OBJ
      ?AUTO_9788 - LOCATION
    )
    :vars
    (
      ?AUTO_9789 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9789 ?AUTO_9788 ) ( IN-TRUCK ?AUTO_9787 ?AUTO_9789 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9787 ?AUTO_9789 ?AUTO_9788 )
      ( DELIVER-PKG-VERIFY ?AUTO_9787 ?AUTO_9788 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9790 - OBJ
      ?AUTO_9791 - LOCATION
    )
    :vars
    (
      ?AUTO_9792 - TRUCK
      ?AUTO_9793 - LOCATION
      ?AUTO_9794 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9790 ?AUTO_9792 ) ( TRUCK-AT ?AUTO_9792 ?AUTO_9793 ) ( IN-CITY ?AUTO_9793 ?AUTO_9794 ) ( IN-CITY ?AUTO_9791 ?AUTO_9794 ) ( not ( = ?AUTO_9791 ?AUTO_9793 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9792 ?AUTO_9793 ?AUTO_9791 ?AUTO_9794 )
      ( DELIVER-PKG ?AUTO_9790 ?AUTO_9791 )
      ( DELIVER-PKG-VERIFY ?AUTO_9790 ?AUTO_9791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9797 - OBJ
      ?AUTO_9798 - LOCATION
    )
    :vars
    (
      ?AUTO_9799 - TRUCK
      ?AUTO_9801 - LOCATION
      ?AUTO_9800 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9799 ?AUTO_9801 ) ( IN-CITY ?AUTO_9801 ?AUTO_9800 ) ( IN-CITY ?AUTO_9798 ?AUTO_9800 ) ( not ( = ?AUTO_9798 ?AUTO_9801 ) ) ( OBJ-AT ?AUTO_9797 ?AUTO_9801 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9797 ?AUTO_9799 ?AUTO_9801 )
      ( DELIVER-PKG ?AUTO_9797 ?AUTO_9798 )
      ( DELIVER-PKG-VERIFY ?AUTO_9797 ?AUTO_9798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9802 - OBJ
      ?AUTO_9803 - LOCATION
    )
    :vars
    (
      ?AUTO_9805 - LOCATION
      ?AUTO_9806 - CITY
      ?AUTO_9804 - TRUCK
      ?AUTO_9807 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9805 ?AUTO_9806 ) ( IN-CITY ?AUTO_9803 ?AUTO_9806 ) ( not ( = ?AUTO_9803 ?AUTO_9805 ) ) ( OBJ-AT ?AUTO_9802 ?AUTO_9805 ) ( TRUCK-AT ?AUTO_9804 ?AUTO_9807 ) ( IN-CITY ?AUTO_9807 ?AUTO_9806 ) ( not ( = ?AUTO_9805 ?AUTO_9807 ) ) ( not ( = ?AUTO_9803 ?AUTO_9807 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9804 ?AUTO_9807 ?AUTO_9805 ?AUTO_9806 )
      ( DELIVER-PKG ?AUTO_9802 ?AUTO_9803 )
      ( DELIVER-PKG-VERIFY ?AUTO_9802 ?AUTO_9803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9844 - OBJ
      ?AUTO_9845 - LOCATION
    )
    :vars
    (
      ?AUTO_9846 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9846 ?AUTO_9845 ) ( IN-TRUCK ?AUTO_9844 ?AUTO_9846 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9844 ?AUTO_9846 ?AUTO_9845 )
      ( DELIVER-PKG-VERIFY ?AUTO_9844 ?AUTO_9845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9853 - OBJ
      ?AUTO_9854 - LOCATION
    )
    :vars
    (
      ?AUTO_9856 - TRUCK
      ?AUTO_9855 - LOCATION
      ?AUTO_9857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9856 ?AUTO_9855 ) ( IN-CITY ?AUTO_9855 ?AUTO_9857 ) ( IN-CITY ?AUTO_9854 ?AUTO_9857 ) ( not ( = ?AUTO_9854 ?AUTO_9855 ) ) ( OBJ-AT ?AUTO_9853 ?AUTO_9855 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9853 ?AUTO_9856 ?AUTO_9855 )
      ( DELIVER-PKG ?AUTO_9853 ?AUTO_9854 )
      ( DELIVER-PKG-VERIFY ?AUTO_9853 ?AUTO_9854 ) )
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
      ?AUTO_9901 - OBJ
      ?AUTO_9902 - LOCATION
    )
    :vars
    (
      ?AUTO_9903 - TRUCK
      ?AUTO_9904 - LOCATION
      ?AUTO_9905 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9901 ?AUTO_9903 ) ( TRUCK-AT ?AUTO_9903 ?AUTO_9904 ) ( IN-CITY ?AUTO_9904 ?AUTO_9905 ) ( IN-CITY ?AUTO_9902 ?AUTO_9905 ) ( not ( = ?AUTO_9902 ?AUTO_9904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9903 ?AUTO_9904 ?AUTO_9902 ?AUTO_9905 )
      ( DELIVER-PKG ?AUTO_9901 ?AUTO_9902 )
      ( DELIVER-PKG-VERIFY ?AUTO_9901 ?AUTO_9902 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9906 - OBJ
      ?AUTO_9907 - LOCATION
    )
    :vars
    (
      ?AUTO_9908 - TRUCK
      ?AUTO_9909 - LOCATION
      ?AUTO_9910 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9908 ?AUTO_9909 ) ( IN-CITY ?AUTO_9909 ?AUTO_9910 ) ( IN-CITY ?AUTO_9907 ?AUTO_9910 ) ( not ( = ?AUTO_9907 ?AUTO_9909 ) ) ( OBJ-AT ?AUTO_9906 ?AUTO_9909 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9906 ?AUTO_9908 ?AUTO_9909 )
      ( DELIVER-PKG ?AUTO_9906 ?AUTO_9907 )
      ( DELIVER-PKG-VERIFY ?AUTO_9906 ?AUTO_9907 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9911 - OBJ
      ?AUTO_9912 - LOCATION
    )
    :vars
    (
      ?AUTO_9913 - LOCATION
      ?AUTO_9915 - CITY
      ?AUTO_9914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9913 ?AUTO_9915 ) ( IN-CITY ?AUTO_9912 ?AUTO_9915 ) ( not ( = ?AUTO_9912 ?AUTO_9913 ) ) ( OBJ-AT ?AUTO_9911 ?AUTO_9913 ) ( TRUCK-AT ?AUTO_9914 ?AUTO_9912 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9914 ?AUTO_9912 ?AUTO_9913 ?AUTO_9915 )
      ( DELIVER-PKG ?AUTO_9911 ?AUTO_9912 )
      ( DELIVER-PKG-VERIFY ?AUTO_9911 ?AUTO_9912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9968 - OBJ
      ?AUTO_9969 - LOCATION
    )
    :vars
    (
      ?AUTO_9970 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9968 ?AUTO_9970 ) ( AIRPLANE-AT ?AUTO_9970 ?AUTO_9969 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9968 ?AUTO_9970 ?AUTO_9969 )
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
      ?AUTO_9977 - AIRPLANE
      ?AUTO_9978 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9975 ?AUTO_9977 ) ( AIRPORT ?AUTO_9978 ) ( AIRPORT ?AUTO_9976 ) ( AIRPLANE-AT ?AUTO_9977 ?AUTO_9978 ) ( not ( = ?AUTO_9978 ?AUTO_9976 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9977 ?AUTO_9978 ?AUTO_9976 )
      ( DELIVER-PKG ?AUTO_9975 ?AUTO_9976 )
      ( DELIVER-PKG-VERIFY ?AUTO_9975 ?AUTO_9976 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10015 - OBJ
      ?AUTO_10016 - LOCATION
    )
    :vars
    (
      ?AUTO_10017 - LOCATION
      ?AUTO_10018 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10017 ) ( AIRPORT ?AUTO_10016 ) ( AIRPLANE-AT ?AUTO_10018 ?AUTO_10017 ) ( not ( = ?AUTO_10017 ?AUTO_10016 ) ) ( OBJ-AT ?AUTO_10015 ?AUTO_10017 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10015 ?AUTO_10018 ?AUTO_10017 )
      ( DELIVER-PKG ?AUTO_10015 ?AUTO_10016 )
      ( DELIVER-PKG-VERIFY ?AUTO_10015 ?AUTO_10016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10027 - OBJ
      ?AUTO_10028 - LOCATION
    )
    :vars
    (
      ?AUTO_10030 - LOCATION
      ?AUTO_10031 - LOCATION
      ?AUTO_10029 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10030 ) ( AIRPORT ?AUTO_10028 ) ( not ( = ?AUTO_10030 ?AUTO_10028 ) ) ( OBJ-AT ?AUTO_10027 ?AUTO_10030 ) ( AIRPORT ?AUTO_10031 ) ( AIRPLANE-AT ?AUTO_10029 ?AUTO_10031 ) ( not ( = ?AUTO_10031 ?AUTO_10030 ) ) ( not ( = ?AUTO_10028 ?AUTO_10031 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10029 ?AUTO_10031 ?AUTO_10030 )
      ( DELIVER-PKG ?AUTO_10027 ?AUTO_10028 )
      ( DELIVER-PKG-VERIFY ?AUTO_10027 ?AUTO_10028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10044 - OBJ
      ?AUTO_10045 - LOCATION
    )
    :vars
    (
      ?AUTO_10046 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10044 ?AUTO_10046 ) ( AIRPLANE-AT ?AUTO_10046 ?AUTO_10045 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10044 ?AUTO_10046 ?AUTO_10045 )
      ( DELIVER-PKG-VERIFY ?AUTO_10044 ?AUTO_10045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10047 - OBJ
      ?AUTO_10048 - LOCATION
    )
    :vars
    (
      ?AUTO_10049 - AIRPLANE
      ?AUTO_10050 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10047 ?AUTO_10049 ) ( AIRPORT ?AUTO_10050 ) ( AIRPORT ?AUTO_10048 ) ( AIRPLANE-AT ?AUTO_10049 ?AUTO_10050 ) ( not ( = ?AUTO_10050 ?AUTO_10048 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10049 ?AUTO_10050 ?AUTO_10048 )
      ( DELIVER-PKG ?AUTO_10047 ?AUTO_10048 )
      ( DELIVER-PKG-VERIFY ?AUTO_10047 ?AUTO_10048 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10091 - OBJ
      ?AUTO_10092 - LOCATION
    )
    :vars
    (
      ?AUTO_10093 - LOCATION
      ?AUTO_10094 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10093 ) ( AIRPORT ?AUTO_10092 ) ( AIRPLANE-AT ?AUTO_10094 ?AUTO_10093 ) ( not ( = ?AUTO_10093 ?AUTO_10092 ) ) ( OBJ-AT ?AUTO_10091 ?AUTO_10093 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10091 ?AUTO_10094 ?AUTO_10093 )
      ( DELIVER-PKG ?AUTO_10091 ?AUTO_10092 )
      ( DELIVER-PKG-VERIFY ?AUTO_10091 ?AUTO_10092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10095 - OBJ
      ?AUTO_10096 - LOCATION
    )
    :vars
    (
      ?AUTO_10098 - LOCATION
      ?AUTO_10099 - LOCATION
      ?AUTO_10097 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10098 ) ( AIRPORT ?AUTO_10096 ) ( not ( = ?AUTO_10098 ?AUTO_10096 ) ) ( OBJ-AT ?AUTO_10095 ?AUTO_10098 ) ( AIRPORT ?AUTO_10099 ) ( AIRPLANE-AT ?AUTO_10097 ?AUTO_10099 ) ( not ( = ?AUTO_10099 ?AUTO_10098 ) ) ( not ( = ?AUTO_10096 ?AUTO_10099 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10097 ?AUTO_10099 ?AUTO_10098 )
      ( DELIVER-PKG ?AUTO_10095 ?AUTO_10096 )
      ( DELIVER-PKG-VERIFY ?AUTO_10095 ?AUTO_10096 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10124 - OBJ
      ?AUTO_10125 - LOCATION
    )
    :vars
    (
      ?AUTO_10126 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10124 ?AUTO_10126 ) ( AIRPLANE-AT ?AUTO_10126 ?AUTO_10125 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10124 ?AUTO_10126 ?AUTO_10125 )
      ( DELIVER-PKG-VERIFY ?AUTO_10124 ?AUTO_10125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10135 - OBJ
      ?AUTO_10136 - LOCATION
    )
    :vars
    (
      ?AUTO_10137 - LOCATION
      ?AUTO_10138 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10137 ) ( AIRPORT ?AUTO_10136 ) ( AIRPLANE-AT ?AUTO_10138 ?AUTO_10137 ) ( not ( = ?AUTO_10137 ?AUTO_10136 ) ) ( OBJ-AT ?AUTO_10135 ?AUTO_10137 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10135 ?AUTO_10138 ?AUTO_10137 )
      ( DELIVER-PKG ?AUTO_10135 ?AUTO_10136 )
      ( DELIVER-PKG-VERIFY ?AUTO_10135 ?AUTO_10136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10139 - OBJ
      ?AUTO_10140 - LOCATION
    )
    :vars
    (
      ?AUTO_10141 - LOCATION
      ?AUTO_10143 - LOCATION
      ?AUTO_10142 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10141 ) ( AIRPORT ?AUTO_10140 ) ( not ( = ?AUTO_10141 ?AUTO_10140 ) ) ( OBJ-AT ?AUTO_10139 ?AUTO_10141 ) ( AIRPORT ?AUTO_10143 ) ( AIRPLANE-AT ?AUTO_10142 ?AUTO_10143 ) ( not ( = ?AUTO_10143 ?AUTO_10141 ) ) ( not ( = ?AUTO_10140 ?AUTO_10143 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10142 ?AUTO_10143 ?AUTO_10141 )
      ( DELIVER-PKG ?AUTO_10139 ?AUTO_10140 )
      ( DELIVER-PKG-VERIFY ?AUTO_10139 ?AUTO_10140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10188 - OBJ
      ?AUTO_10189 - LOCATION
    )
    :vars
    (
      ?AUTO_10192 - LOCATION
      ?AUTO_10190 - LOCATION
      ?AUTO_10191 - AIRPLANE
      ?AUTO_10193 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10192 ) ( AIRPORT ?AUTO_10189 ) ( not ( = ?AUTO_10192 ?AUTO_10189 ) ) ( AIRPORT ?AUTO_10190 ) ( AIRPLANE-AT ?AUTO_10191 ?AUTO_10190 ) ( not ( = ?AUTO_10190 ?AUTO_10192 ) ) ( not ( = ?AUTO_10189 ?AUTO_10190 ) ) ( TRUCK-AT ?AUTO_10193 ?AUTO_10192 ) ( IN-TRUCK ?AUTO_10188 ?AUTO_10193 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10188 ?AUTO_10193 ?AUTO_10192 )
      ( DELIVER-PKG ?AUTO_10188 ?AUTO_10189 )
      ( DELIVER-PKG-VERIFY ?AUTO_10188 ?AUTO_10189 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10198 - OBJ
      ?AUTO_10199 - LOCATION
    )
    :vars
    (
      ?AUTO_10203 - LOCATION
      ?AUTO_10202 - LOCATION
      ?AUTO_10200 - AIRPLANE
      ?AUTO_10201 - TRUCK
      ?AUTO_10204 - LOCATION
      ?AUTO_10205 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10203 ) ( AIRPORT ?AUTO_10199 ) ( not ( = ?AUTO_10203 ?AUTO_10199 ) ) ( AIRPORT ?AUTO_10202 ) ( AIRPLANE-AT ?AUTO_10200 ?AUTO_10202 ) ( not ( = ?AUTO_10202 ?AUTO_10203 ) ) ( not ( = ?AUTO_10199 ?AUTO_10202 ) ) ( IN-TRUCK ?AUTO_10198 ?AUTO_10201 ) ( TRUCK-AT ?AUTO_10201 ?AUTO_10204 ) ( IN-CITY ?AUTO_10204 ?AUTO_10205 ) ( IN-CITY ?AUTO_10203 ?AUTO_10205 ) ( not ( = ?AUTO_10203 ?AUTO_10204 ) ) ( not ( = ?AUTO_10199 ?AUTO_10204 ) ) ( not ( = ?AUTO_10202 ?AUTO_10204 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10201 ?AUTO_10204 ?AUTO_10203 ?AUTO_10205 )
      ( DELIVER-PKG ?AUTO_10198 ?AUTO_10199 )
      ( DELIVER-PKG-VERIFY ?AUTO_10198 ?AUTO_10199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10210 - OBJ
      ?AUTO_10211 - LOCATION
    )
    :vars
    (
      ?AUTO_10215 - LOCATION
      ?AUTO_10216 - LOCATION
      ?AUTO_10212 - AIRPLANE
      ?AUTO_10213 - TRUCK
      ?AUTO_10214 - LOCATION
      ?AUTO_10217 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10215 ) ( AIRPORT ?AUTO_10211 ) ( not ( = ?AUTO_10215 ?AUTO_10211 ) ) ( AIRPORT ?AUTO_10216 ) ( AIRPLANE-AT ?AUTO_10212 ?AUTO_10216 ) ( not ( = ?AUTO_10216 ?AUTO_10215 ) ) ( not ( = ?AUTO_10211 ?AUTO_10216 ) ) ( TRUCK-AT ?AUTO_10213 ?AUTO_10214 ) ( IN-CITY ?AUTO_10214 ?AUTO_10217 ) ( IN-CITY ?AUTO_10215 ?AUTO_10217 ) ( not ( = ?AUTO_10215 ?AUTO_10214 ) ) ( not ( = ?AUTO_10211 ?AUTO_10214 ) ) ( not ( = ?AUTO_10216 ?AUTO_10214 ) ) ( OBJ-AT ?AUTO_10210 ?AUTO_10214 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10210 ?AUTO_10213 ?AUTO_10214 )
      ( DELIVER-PKG ?AUTO_10210 ?AUTO_10211 )
      ( DELIVER-PKG-VERIFY ?AUTO_10210 ?AUTO_10211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10220 - OBJ
      ?AUTO_10221 - LOCATION
    )
    :vars
    (
      ?AUTO_10222 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10220 ?AUTO_10222 ) ( AIRPLANE-AT ?AUTO_10222 ?AUTO_10221 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10220 ?AUTO_10222 ?AUTO_10221 )
      ( DELIVER-PKG-VERIFY ?AUTO_10220 ?AUTO_10221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10251 - OBJ
      ?AUTO_10252 - LOCATION
    )
    :vars
    (
      ?AUTO_10253 - LOCATION
      ?AUTO_10254 - AIRPLANE
      ?AUTO_10255 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10253 ) ( AIRPORT ?AUTO_10252 ) ( AIRPLANE-AT ?AUTO_10254 ?AUTO_10253 ) ( not ( = ?AUTO_10253 ?AUTO_10252 ) ) ( TRUCK-AT ?AUTO_10255 ?AUTO_10253 ) ( IN-TRUCK ?AUTO_10251 ?AUTO_10255 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10251 ?AUTO_10255 ?AUTO_10253 )
      ( DELIVER-PKG ?AUTO_10251 ?AUTO_10252 )
      ( DELIVER-PKG-VERIFY ?AUTO_10251 ?AUTO_10252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10256 - OBJ
      ?AUTO_10257 - LOCATION
    )
    :vars
    (
      ?AUTO_10258 - LOCATION
      ?AUTO_10259 - AIRPLANE
      ?AUTO_10260 - TRUCK
      ?AUTO_10261 - LOCATION
      ?AUTO_10262 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10258 ) ( AIRPORT ?AUTO_10257 ) ( AIRPLANE-AT ?AUTO_10259 ?AUTO_10258 ) ( not ( = ?AUTO_10258 ?AUTO_10257 ) ) ( IN-TRUCK ?AUTO_10256 ?AUTO_10260 ) ( TRUCK-AT ?AUTO_10260 ?AUTO_10261 ) ( IN-CITY ?AUTO_10261 ?AUTO_10262 ) ( IN-CITY ?AUTO_10258 ?AUTO_10262 ) ( not ( = ?AUTO_10258 ?AUTO_10261 ) ) ( not ( = ?AUTO_10257 ?AUTO_10261 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10260 ?AUTO_10261 ?AUTO_10258 ?AUTO_10262 )
      ( DELIVER-PKG ?AUTO_10256 ?AUTO_10257 )
      ( DELIVER-PKG-VERIFY ?AUTO_10256 ?AUTO_10257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10265 - OBJ
      ?AUTO_10266 - LOCATION
    )
    :vars
    (
      ?AUTO_10271 - LOCATION
      ?AUTO_10270 - AIRPLANE
      ?AUTO_10267 - TRUCK
      ?AUTO_10269 - LOCATION
      ?AUTO_10268 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10271 ) ( AIRPORT ?AUTO_10266 ) ( AIRPLANE-AT ?AUTO_10270 ?AUTO_10271 ) ( not ( = ?AUTO_10271 ?AUTO_10266 ) ) ( TRUCK-AT ?AUTO_10267 ?AUTO_10269 ) ( IN-CITY ?AUTO_10269 ?AUTO_10268 ) ( IN-CITY ?AUTO_10271 ?AUTO_10268 ) ( not ( = ?AUTO_10271 ?AUTO_10269 ) ) ( not ( = ?AUTO_10266 ?AUTO_10269 ) ) ( OBJ-AT ?AUTO_10265 ?AUTO_10269 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10265 ?AUTO_10267 ?AUTO_10269 )
      ( DELIVER-PKG ?AUTO_10265 ?AUTO_10266 )
      ( DELIVER-PKG-VERIFY ?AUTO_10265 ?AUTO_10266 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10272 - OBJ
      ?AUTO_10273 - LOCATION
    )
    :vars
    (
      ?AUTO_10275 - LOCATION
      ?AUTO_10274 - AIRPLANE
      ?AUTO_10277 - LOCATION
      ?AUTO_10278 - CITY
      ?AUTO_10276 - TRUCK
      ?AUTO_10279 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10275 ) ( AIRPORT ?AUTO_10273 ) ( AIRPLANE-AT ?AUTO_10274 ?AUTO_10275 ) ( not ( = ?AUTO_10275 ?AUTO_10273 ) ) ( IN-CITY ?AUTO_10277 ?AUTO_10278 ) ( IN-CITY ?AUTO_10275 ?AUTO_10278 ) ( not ( = ?AUTO_10275 ?AUTO_10277 ) ) ( not ( = ?AUTO_10273 ?AUTO_10277 ) ) ( OBJ-AT ?AUTO_10272 ?AUTO_10277 ) ( TRUCK-AT ?AUTO_10276 ?AUTO_10279 ) ( IN-CITY ?AUTO_10279 ?AUTO_10278 ) ( not ( = ?AUTO_10277 ?AUTO_10279 ) ) ( not ( = ?AUTO_10273 ?AUTO_10279 ) ) ( not ( = ?AUTO_10275 ?AUTO_10279 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10276 ?AUTO_10279 ?AUTO_10277 ?AUTO_10278 )
      ( DELIVER-PKG ?AUTO_10272 ?AUTO_10273 )
      ( DELIVER-PKG-VERIFY ?AUTO_10272 ?AUTO_10273 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10280 - OBJ
      ?AUTO_10281 - LOCATION
    )
    :vars
    (
      ?AUTO_10283 - LOCATION
      ?AUTO_10285 - LOCATION
      ?AUTO_10286 - CITY
      ?AUTO_10284 - TRUCK
      ?AUTO_10287 - LOCATION
      ?AUTO_10288 - LOCATION
      ?AUTO_10282 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10283 ) ( AIRPORT ?AUTO_10281 ) ( not ( = ?AUTO_10283 ?AUTO_10281 ) ) ( IN-CITY ?AUTO_10285 ?AUTO_10286 ) ( IN-CITY ?AUTO_10283 ?AUTO_10286 ) ( not ( = ?AUTO_10283 ?AUTO_10285 ) ) ( not ( = ?AUTO_10281 ?AUTO_10285 ) ) ( OBJ-AT ?AUTO_10280 ?AUTO_10285 ) ( TRUCK-AT ?AUTO_10284 ?AUTO_10287 ) ( IN-CITY ?AUTO_10287 ?AUTO_10286 ) ( not ( = ?AUTO_10285 ?AUTO_10287 ) ) ( not ( = ?AUTO_10281 ?AUTO_10287 ) ) ( not ( = ?AUTO_10283 ?AUTO_10287 ) ) ( AIRPORT ?AUTO_10288 ) ( AIRPLANE-AT ?AUTO_10282 ?AUTO_10288 ) ( not ( = ?AUTO_10288 ?AUTO_10283 ) ) ( not ( = ?AUTO_10281 ?AUTO_10288 ) ) ( not ( = ?AUTO_10285 ?AUTO_10288 ) ) ( not ( = ?AUTO_10287 ?AUTO_10288 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10282 ?AUTO_10288 ?AUTO_10283 )
      ( DELIVER-PKG ?AUTO_10280 ?AUTO_10281 )
      ( DELIVER-PKG-VERIFY ?AUTO_10280 ?AUTO_10281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10323 - OBJ
      ?AUTO_10324 - LOCATION
    )
    :vars
    (
      ?AUTO_10325 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10323 ?AUTO_10325 ) ( AIRPLANE-AT ?AUTO_10325 ?AUTO_10324 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10323 ?AUTO_10325 ?AUTO_10324 )
      ( DELIVER-PKG-VERIFY ?AUTO_10323 ?AUTO_10324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10376 - OBJ
      ?AUTO_10377 - LOCATION
    )
    :vars
    (
      ?AUTO_10378 - LOCATION
      ?AUTO_10379 - LOCATION
      ?AUTO_10380 - AIRPLANE
      ?AUTO_10381 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10378 ) ( AIRPORT ?AUTO_10377 ) ( not ( = ?AUTO_10378 ?AUTO_10377 ) ) ( AIRPORT ?AUTO_10379 ) ( AIRPLANE-AT ?AUTO_10380 ?AUTO_10379 ) ( not ( = ?AUTO_10379 ?AUTO_10378 ) ) ( not ( = ?AUTO_10377 ?AUTO_10379 ) ) ( TRUCK-AT ?AUTO_10381 ?AUTO_10378 ) ( IN-TRUCK ?AUTO_10376 ?AUTO_10381 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10376 ?AUTO_10381 ?AUTO_10378 )
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
      ?AUTO_10393 - LOCATION
      ?AUTO_10390 - LOCATION
      ?AUTO_10391 - AIRPLANE
      ?AUTO_10392 - TRUCK
      ?AUTO_10394 - LOCATION
      ?AUTO_10395 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10393 ) ( AIRPORT ?AUTO_10389 ) ( not ( = ?AUTO_10393 ?AUTO_10389 ) ) ( AIRPORT ?AUTO_10390 ) ( AIRPLANE-AT ?AUTO_10391 ?AUTO_10390 ) ( not ( = ?AUTO_10390 ?AUTO_10393 ) ) ( not ( = ?AUTO_10389 ?AUTO_10390 ) ) ( IN-TRUCK ?AUTO_10388 ?AUTO_10392 ) ( TRUCK-AT ?AUTO_10392 ?AUTO_10394 ) ( IN-CITY ?AUTO_10394 ?AUTO_10395 ) ( IN-CITY ?AUTO_10393 ?AUTO_10395 ) ( not ( = ?AUTO_10393 ?AUTO_10394 ) ) ( not ( = ?AUTO_10389 ?AUTO_10394 ) ) ( not ( = ?AUTO_10390 ?AUTO_10394 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10392 ?AUTO_10394 ?AUTO_10393 ?AUTO_10395 )
      ( DELIVER-PKG ?AUTO_10388 ?AUTO_10389 )
      ( DELIVER-PKG-VERIFY ?AUTO_10388 ?AUTO_10389 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10396 - OBJ
      ?AUTO_10397 - LOCATION
    )
    :vars
    (
      ?AUTO_10398 - LOCATION
      ?AUTO_10401 - LOCATION
      ?AUTO_10400 - AIRPLANE
      ?AUTO_10399 - TRUCK
      ?AUTO_10403 - LOCATION
      ?AUTO_10402 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10398 ) ( AIRPORT ?AUTO_10397 ) ( not ( = ?AUTO_10398 ?AUTO_10397 ) ) ( AIRPORT ?AUTO_10401 ) ( AIRPLANE-AT ?AUTO_10400 ?AUTO_10401 ) ( not ( = ?AUTO_10401 ?AUTO_10398 ) ) ( not ( = ?AUTO_10397 ?AUTO_10401 ) ) ( TRUCK-AT ?AUTO_10399 ?AUTO_10403 ) ( IN-CITY ?AUTO_10403 ?AUTO_10402 ) ( IN-CITY ?AUTO_10398 ?AUTO_10402 ) ( not ( = ?AUTO_10398 ?AUTO_10403 ) ) ( not ( = ?AUTO_10397 ?AUTO_10403 ) ) ( not ( = ?AUTO_10401 ?AUTO_10403 ) ) ( OBJ-AT ?AUTO_10396 ?AUTO_10403 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10396 ?AUTO_10399 ?AUTO_10403 )
      ( DELIVER-PKG ?AUTO_10396 ?AUTO_10397 )
      ( DELIVER-PKG-VERIFY ?AUTO_10396 ?AUTO_10397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10422 - OBJ
      ?AUTO_10423 - LOCATION
    )
    :vars
    (
      ?AUTO_10424 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10422 ?AUTO_10424 ) ( AIRPLANE-AT ?AUTO_10424 ?AUTO_10423 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10422 ?AUTO_10424 ?AUTO_10423 )
      ( DELIVER-PKG-VERIFY ?AUTO_10422 ?AUTO_10423 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10425 - OBJ
      ?AUTO_10426 - LOCATION
    )
    :vars
    (
      ?AUTO_10427 - AIRPLANE
      ?AUTO_10428 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10425 ?AUTO_10427 ) ( AIRPORT ?AUTO_10428 ) ( AIRPORT ?AUTO_10426 ) ( AIRPLANE-AT ?AUTO_10427 ?AUTO_10428 ) ( not ( = ?AUTO_10428 ?AUTO_10426 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10427 ?AUTO_10428 ?AUTO_10426 )
      ( DELIVER-PKG ?AUTO_10425 ?AUTO_10426 )
      ( DELIVER-PKG-VERIFY ?AUTO_10425 ?AUTO_10426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10445 - OBJ
      ?AUTO_10446 - LOCATION
    )
    :vars
    (
      ?AUTO_10447 - LOCATION
      ?AUTO_10448 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10447 ) ( AIRPORT ?AUTO_10446 ) ( AIRPLANE-AT ?AUTO_10448 ?AUTO_10447 ) ( not ( = ?AUTO_10447 ?AUTO_10446 ) ) ( OBJ-AT ?AUTO_10445 ?AUTO_10447 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10445 ?AUTO_10448 ?AUTO_10447 )
      ( DELIVER-PKG ?AUTO_10445 ?AUTO_10446 )
      ( DELIVER-PKG-VERIFY ?AUTO_10445 ?AUTO_10446 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10451 - OBJ
      ?AUTO_10452 - LOCATION
    )
    :vars
    (
      ?AUTO_10454 - LOCATION
      ?AUTO_10453 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10454 ) ( AIRPORT ?AUTO_10452 ) ( not ( = ?AUTO_10454 ?AUTO_10452 ) ) ( OBJ-AT ?AUTO_10451 ?AUTO_10454 ) ( AIRPLANE-AT ?AUTO_10453 ?AUTO_10452 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10453 ?AUTO_10452 ?AUTO_10454 )
      ( DELIVER-PKG ?AUTO_10451 ?AUTO_10452 )
      ( DELIVER-PKG-VERIFY ?AUTO_10451 ?AUTO_10452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10515 - OBJ
      ?AUTO_10516 - LOCATION
    )
    :vars
    (
      ?AUTO_10517 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10515 ?AUTO_10517 ) ( AIRPLANE-AT ?AUTO_10517 ?AUTO_10516 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10515 ?AUTO_10517 ?AUTO_10516 )
      ( DELIVER-PKG-VERIFY ?AUTO_10515 ?AUTO_10516 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10522 - OBJ
      ?AUTO_10523 - LOCATION
    )
    :vars
    (
      ?AUTO_10524 - AIRPLANE
      ?AUTO_10525 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_10522 ?AUTO_10524 ) ( AIRPORT ?AUTO_10525 ) ( AIRPORT ?AUTO_10523 ) ( AIRPLANE-AT ?AUTO_10524 ?AUTO_10525 ) ( not ( = ?AUTO_10525 ?AUTO_10523 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10524 ?AUTO_10525 ?AUTO_10523 )
      ( DELIVER-PKG ?AUTO_10522 ?AUTO_10523 )
      ( DELIVER-PKG-VERIFY ?AUTO_10522 ?AUTO_10523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10562 - OBJ
      ?AUTO_10563 - LOCATION
    )
    :vars
    (
      ?AUTO_10565 - LOCATION
      ?AUTO_10564 - AIRPLANE
      ?AUTO_10566 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10565 ) ( AIRPORT ?AUTO_10563 ) ( AIRPLANE-AT ?AUTO_10564 ?AUTO_10565 ) ( not ( = ?AUTO_10565 ?AUTO_10563 ) ) ( TRUCK-AT ?AUTO_10566 ?AUTO_10565 ) ( IN-TRUCK ?AUTO_10562 ?AUTO_10566 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10562 ?AUTO_10566 ?AUTO_10565 )
      ( DELIVER-PKG ?AUTO_10562 ?AUTO_10563 )
      ( DELIVER-PKG-VERIFY ?AUTO_10562 ?AUTO_10563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10573 - OBJ
      ?AUTO_10574 - LOCATION
    )
    :vars
    (
      ?AUTO_10579 - LOCATION
      ?AUTO_10577 - AIRPLANE
      ?AUTO_10576 - TRUCK
      ?AUTO_10575 - LOCATION
      ?AUTO_10578 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10579 ) ( AIRPORT ?AUTO_10574 ) ( AIRPLANE-AT ?AUTO_10577 ?AUTO_10579 ) ( not ( = ?AUTO_10579 ?AUTO_10574 ) ) ( TRUCK-AT ?AUTO_10576 ?AUTO_10575 ) ( IN-CITY ?AUTO_10575 ?AUTO_10578 ) ( IN-CITY ?AUTO_10579 ?AUTO_10578 ) ( not ( = ?AUTO_10579 ?AUTO_10575 ) ) ( not ( = ?AUTO_10574 ?AUTO_10575 ) ) ( OBJ-AT ?AUTO_10573 ?AUTO_10575 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10573 ?AUTO_10576 ?AUTO_10575 )
      ( DELIVER-PKG ?AUTO_10573 ?AUTO_10574 )
      ( DELIVER-PKG-VERIFY ?AUTO_10573 ?AUTO_10574 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10620 - OBJ
      ?AUTO_10621 - LOCATION
    )
    :vars
    (
      ?AUTO_10622 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10622 ?AUTO_10621 ) ( IN-TRUCK ?AUTO_10620 ?AUTO_10622 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10620 ?AUTO_10622 ?AUTO_10621 )
      ( DELIVER-PKG-VERIFY ?AUTO_10620 ?AUTO_10621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10637 - OBJ
      ?AUTO_10638 - LOCATION
    )
    :vars
    (
      ?AUTO_10639 - TRUCK
      ?AUTO_10640 - LOCATION
      ?AUTO_10641 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10637 ?AUTO_10639 ) ( TRUCK-AT ?AUTO_10639 ?AUTO_10640 ) ( IN-CITY ?AUTO_10640 ?AUTO_10641 ) ( IN-CITY ?AUTO_10638 ?AUTO_10641 ) ( not ( = ?AUTO_10638 ?AUTO_10640 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10639 ?AUTO_10640 ?AUTO_10638 ?AUTO_10641 )
      ( DELIVER-PKG ?AUTO_10637 ?AUTO_10638 )
      ( DELIVER-PKG-VERIFY ?AUTO_10637 ?AUTO_10638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10642 - OBJ
      ?AUTO_10643 - LOCATION
    )
    :vars
    (
      ?AUTO_10644 - TRUCK
      ?AUTO_10645 - LOCATION
      ?AUTO_10646 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10644 ?AUTO_10645 ) ( IN-CITY ?AUTO_10645 ?AUTO_10646 ) ( IN-CITY ?AUTO_10643 ?AUTO_10646 ) ( not ( = ?AUTO_10643 ?AUTO_10645 ) ) ( OBJ-AT ?AUTO_10642 ?AUTO_10645 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10642 ?AUTO_10644 ?AUTO_10645 )
      ( DELIVER-PKG ?AUTO_10642 ?AUTO_10643 )
      ( DELIVER-PKG-VERIFY ?AUTO_10642 ?AUTO_10643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10655 - OBJ
      ?AUTO_10656 - LOCATION
    )
    :vars
    (
      ?AUTO_10659 - TRUCK
      ?AUTO_10658 - LOCATION
      ?AUTO_10657 - CITY
      ?AUTO_10660 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10659 ?AUTO_10658 ) ( IN-CITY ?AUTO_10658 ?AUTO_10657 ) ( IN-CITY ?AUTO_10656 ?AUTO_10657 ) ( not ( = ?AUTO_10656 ?AUTO_10658 ) ) ( IN-AIRPLANE ?AUTO_10655 ?AUTO_10660 ) ( AIRPLANE-AT ?AUTO_10660 ?AUTO_10658 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10655 ?AUTO_10660 ?AUTO_10658 )
      ( DELIVER-PKG ?AUTO_10655 ?AUTO_10656 )
      ( DELIVER-PKG-VERIFY ?AUTO_10655 ?AUTO_10656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10665 - OBJ
      ?AUTO_10666 - LOCATION
    )
    :vars
    (
      ?AUTO_10670 - TRUCK
      ?AUTO_10668 - LOCATION
      ?AUTO_10669 - CITY
      ?AUTO_10667 - AIRPLANE
      ?AUTO_10671 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10670 ?AUTO_10668 ) ( IN-CITY ?AUTO_10668 ?AUTO_10669 ) ( IN-CITY ?AUTO_10666 ?AUTO_10669 ) ( not ( = ?AUTO_10666 ?AUTO_10668 ) ) ( IN-AIRPLANE ?AUTO_10665 ?AUTO_10667 ) ( AIRPORT ?AUTO_10671 ) ( AIRPORT ?AUTO_10668 ) ( AIRPLANE-AT ?AUTO_10667 ?AUTO_10671 ) ( not ( = ?AUTO_10671 ?AUTO_10668 ) ) ( not ( = ?AUTO_10666 ?AUTO_10671 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10667 ?AUTO_10671 ?AUTO_10668 )
      ( DELIVER-PKG ?AUTO_10665 ?AUTO_10666 )
      ( DELIVER-PKG-VERIFY ?AUTO_10665 ?AUTO_10666 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10708 - OBJ
      ?AUTO_10709 - LOCATION
    )
    :vars
    (
      ?AUTO_10710 - TRUCK
      ?AUTO_10711 - LOCATION
      ?AUTO_10714 - CITY
      ?AUTO_10713 - LOCATION
      ?AUTO_10712 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10710 ?AUTO_10711 ) ( IN-CITY ?AUTO_10711 ?AUTO_10714 ) ( IN-CITY ?AUTO_10709 ?AUTO_10714 ) ( not ( = ?AUTO_10709 ?AUTO_10711 ) ) ( AIRPORT ?AUTO_10713 ) ( AIRPORT ?AUTO_10711 ) ( AIRPLANE-AT ?AUTO_10712 ?AUTO_10713 ) ( not ( = ?AUTO_10713 ?AUTO_10711 ) ) ( not ( = ?AUTO_10709 ?AUTO_10713 ) ) ( OBJ-AT ?AUTO_10708 ?AUTO_10713 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10708 ?AUTO_10712 ?AUTO_10713 )
      ( DELIVER-PKG ?AUTO_10708 ?AUTO_10709 )
      ( DELIVER-PKG-VERIFY ?AUTO_10708 ?AUTO_10709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10723 - OBJ
      ?AUTO_10724 - LOCATION
    )
    :vars
    (
      ?AUTO_10727 - TRUCK
      ?AUTO_10726 - LOCATION
      ?AUTO_10729 - CITY
      ?AUTO_10728 - LOCATION
      ?AUTO_10730 - LOCATION
      ?AUTO_10725 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10727 ?AUTO_10726 ) ( IN-CITY ?AUTO_10726 ?AUTO_10729 ) ( IN-CITY ?AUTO_10724 ?AUTO_10729 ) ( not ( = ?AUTO_10724 ?AUTO_10726 ) ) ( AIRPORT ?AUTO_10728 ) ( AIRPORT ?AUTO_10726 ) ( not ( = ?AUTO_10728 ?AUTO_10726 ) ) ( not ( = ?AUTO_10724 ?AUTO_10728 ) ) ( OBJ-AT ?AUTO_10723 ?AUTO_10728 ) ( AIRPORT ?AUTO_10730 ) ( AIRPLANE-AT ?AUTO_10725 ?AUTO_10730 ) ( not ( = ?AUTO_10730 ?AUTO_10728 ) ) ( not ( = ?AUTO_10724 ?AUTO_10730 ) ) ( not ( = ?AUTO_10726 ?AUTO_10730 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10725 ?AUTO_10730 ?AUTO_10728 )
      ( DELIVER-PKG ?AUTO_10723 ?AUTO_10724 )
      ( DELIVER-PKG-VERIFY ?AUTO_10723 ?AUTO_10724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10733 - OBJ
      ?AUTO_10734 - LOCATION
    )
    :vars
    (
      ?AUTO_10736 - LOCATION
      ?AUTO_10740 - CITY
      ?AUTO_10739 - LOCATION
      ?AUTO_10737 - LOCATION
      ?AUTO_10735 - AIRPLANE
      ?AUTO_10738 - TRUCK
      ?AUTO_10741 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10736 ?AUTO_10740 ) ( IN-CITY ?AUTO_10734 ?AUTO_10740 ) ( not ( = ?AUTO_10734 ?AUTO_10736 ) ) ( AIRPORT ?AUTO_10739 ) ( AIRPORT ?AUTO_10736 ) ( not ( = ?AUTO_10739 ?AUTO_10736 ) ) ( not ( = ?AUTO_10734 ?AUTO_10739 ) ) ( OBJ-AT ?AUTO_10733 ?AUTO_10739 ) ( AIRPORT ?AUTO_10737 ) ( AIRPLANE-AT ?AUTO_10735 ?AUTO_10737 ) ( not ( = ?AUTO_10737 ?AUTO_10739 ) ) ( not ( = ?AUTO_10734 ?AUTO_10737 ) ) ( not ( = ?AUTO_10736 ?AUTO_10737 ) ) ( TRUCK-AT ?AUTO_10738 ?AUTO_10741 ) ( IN-CITY ?AUTO_10741 ?AUTO_10740 ) ( not ( = ?AUTO_10736 ?AUTO_10741 ) ) ( not ( = ?AUTO_10734 ?AUTO_10741 ) ) ( not ( = ?AUTO_10739 ?AUTO_10741 ) ) ( not ( = ?AUTO_10737 ?AUTO_10741 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10738 ?AUTO_10741 ?AUTO_10736 ?AUTO_10740 )
      ( DELIVER-PKG ?AUTO_10733 ?AUTO_10734 )
      ( DELIVER-PKG-VERIFY ?AUTO_10733 ?AUTO_10734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10750 - OBJ
      ?AUTO_10751 - LOCATION
    )
    :vars
    (
      ?AUTO_10752 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10752 ?AUTO_10751 ) ( IN-TRUCK ?AUTO_10750 ?AUTO_10752 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10750 ?AUTO_10752 ?AUTO_10751 )
      ( DELIVER-PKG-VERIFY ?AUTO_10750 ?AUTO_10751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10757 - OBJ
      ?AUTO_10758 - LOCATION
    )
    :vars
    (
      ?AUTO_10759 - TRUCK
      ?AUTO_10760 - LOCATION
      ?AUTO_10761 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_10757 ?AUTO_10759 ) ( TRUCK-AT ?AUTO_10759 ?AUTO_10760 ) ( IN-CITY ?AUTO_10760 ?AUTO_10761 ) ( IN-CITY ?AUTO_10758 ?AUTO_10761 ) ( not ( = ?AUTO_10758 ?AUTO_10760 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10759 ?AUTO_10760 ?AUTO_10758 ?AUTO_10761 )
      ( DELIVER-PKG ?AUTO_10757 ?AUTO_10758 )
      ( DELIVER-PKG-VERIFY ?AUTO_10757 ?AUTO_10758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10762 - OBJ
      ?AUTO_10763 - LOCATION
    )
    :vars
    (
      ?AUTO_10764 - TRUCK
      ?AUTO_10765 - LOCATION
      ?AUTO_10766 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10764 ?AUTO_10765 ) ( IN-CITY ?AUTO_10765 ?AUTO_10766 ) ( IN-CITY ?AUTO_10763 ?AUTO_10766 ) ( not ( = ?AUTO_10763 ?AUTO_10765 ) ) ( OBJ-AT ?AUTO_10762 ?AUTO_10765 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10762 ?AUTO_10764 ?AUTO_10765 )
      ( DELIVER-PKG ?AUTO_10762 ?AUTO_10763 )
      ( DELIVER-PKG-VERIFY ?AUTO_10762 ?AUTO_10763 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10769 - OBJ
      ?AUTO_10770 - LOCATION
    )
    :vars
    (
      ?AUTO_10771 - TRUCK
      ?AUTO_10773 - LOCATION
      ?AUTO_10772 - CITY
      ?AUTO_10774 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10771 ?AUTO_10773 ) ( IN-CITY ?AUTO_10773 ?AUTO_10772 ) ( IN-CITY ?AUTO_10770 ?AUTO_10772 ) ( not ( = ?AUTO_10770 ?AUTO_10773 ) ) ( IN-AIRPLANE ?AUTO_10769 ?AUTO_10774 ) ( AIRPLANE-AT ?AUTO_10774 ?AUTO_10773 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10769 ?AUTO_10774 ?AUTO_10773 )
      ( DELIVER-PKG ?AUTO_10769 ?AUTO_10770 )
      ( DELIVER-PKG-VERIFY ?AUTO_10769 ?AUTO_10770 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10775 - OBJ
      ?AUTO_10776 - LOCATION
    )
    :vars
    (
      ?AUTO_10778 - TRUCK
      ?AUTO_10779 - LOCATION
      ?AUTO_10777 - CITY
      ?AUTO_10780 - AIRPLANE
      ?AUTO_10781 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10778 ?AUTO_10779 ) ( IN-CITY ?AUTO_10779 ?AUTO_10777 ) ( IN-CITY ?AUTO_10776 ?AUTO_10777 ) ( not ( = ?AUTO_10776 ?AUTO_10779 ) ) ( IN-AIRPLANE ?AUTO_10775 ?AUTO_10780 ) ( AIRPORT ?AUTO_10781 ) ( AIRPORT ?AUTO_10779 ) ( AIRPLANE-AT ?AUTO_10780 ?AUTO_10781 ) ( not ( = ?AUTO_10781 ?AUTO_10779 ) ) ( not ( = ?AUTO_10776 ?AUTO_10781 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10780 ?AUTO_10781 ?AUTO_10779 )
      ( DELIVER-PKG ?AUTO_10775 ?AUTO_10776 )
      ( DELIVER-PKG-VERIFY ?AUTO_10775 ?AUTO_10776 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10798 - OBJ
      ?AUTO_10799 - LOCATION
    )
    :vars
    (
      ?AUTO_10803 - TRUCK
      ?AUTO_10801 - LOCATION
      ?AUTO_10804 - CITY
      ?AUTO_10800 - LOCATION
      ?AUTO_10802 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10803 ?AUTO_10801 ) ( IN-CITY ?AUTO_10801 ?AUTO_10804 ) ( IN-CITY ?AUTO_10799 ?AUTO_10804 ) ( not ( = ?AUTO_10799 ?AUTO_10801 ) ) ( AIRPORT ?AUTO_10800 ) ( AIRPORT ?AUTO_10801 ) ( AIRPLANE-AT ?AUTO_10802 ?AUTO_10800 ) ( not ( = ?AUTO_10800 ?AUTO_10801 ) ) ( not ( = ?AUTO_10799 ?AUTO_10800 ) ) ( OBJ-AT ?AUTO_10798 ?AUTO_10800 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_10798 ?AUTO_10802 ?AUTO_10800 )
      ( DELIVER-PKG ?AUTO_10798 ?AUTO_10799 )
      ( DELIVER-PKG-VERIFY ?AUTO_10798 ?AUTO_10799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10807 - OBJ
      ?AUTO_10808 - LOCATION
    )
    :vars
    (
      ?AUTO_10810 - TRUCK
      ?AUTO_10812 - LOCATION
      ?AUTO_10809 - CITY
      ?AUTO_10813 - LOCATION
      ?AUTO_10811 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10810 ?AUTO_10812 ) ( IN-CITY ?AUTO_10812 ?AUTO_10809 ) ( IN-CITY ?AUTO_10808 ?AUTO_10809 ) ( not ( = ?AUTO_10808 ?AUTO_10812 ) ) ( AIRPORT ?AUTO_10813 ) ( AIRPORT ?AUTO_10812 ) ( not ( = ?AUTO_10813 ?AUTO_10812 ) ) ( not ( = ?AUTO_10808 ?AUTO_10813 ) ) ( OBJ-AT ?AUTO_10807 ?AUTO_10813 ) ( AIRPLANE-AT ?AUTO_10811 ?AUTO_10812 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10811 ?AUTO_10812 ?AUTO_10813 )
      ( DELIVER-PKG ?AUTO_10807 ?AUTO_10808 )
      ( DELIVER-PKG-VERIFY ?AUTO_10807 ?AUTO_10808 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10830 - OBJ
      ?AUTO_10831 - LOCATION
    )
    :vars
    (
      ?AUTO_10832 - LOCATION
      ?AUTO_10836 - CITY
      ?AUTO_10834 - LOCATION
      ?AUTO_10833 - AIRPLANE
      ?AUTO_10835 - TRUCK
      ?AUTO_10837 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10832 ?AUTO_10836 ) ( IN-CITY ?AUTO_10831 ?AUTO_10836 ) ( not ( = ?AUTO_10831 ?AUTO_10832 ) ) ( AIRPORT ?AUTO_10834 ) ( AIRPORT ?AUTO_10832 ) ( not ( = ?AUTO_10834 ?AUTO_10832 ) ) ( not ( = ?AUTO_10831 ?AUTO_10834 ) ) ( OBJ-AT ?AUTO_10830 ?AUTO_10834 ) ( AIRPLANE-AT ?AUTO_10833 ?AUTO_10832 ) ( TRUCK-AT ?AUTO_10835 ?AUTO_10837 ) ( IN-CITY ?AUTO_10837 ?AUTO_10836 ) ( not ( = ?AUTO_10832 ?AUTO_10837 ) ) ( not ( = ?AUTO_10831 ?AUTO_10837 ) ) ( not ( = ?AUTO_10834 ?AUTO_10837 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10835 ?AUTO_10837 ?AUTO_10832 ?AUTO_10836 )
      ( DELIVER-PKG ?AUTO_10830 ?AUTO_10831 )
      ( DELIVER-PKG-VERIFY ?AUTO_10830 ?AUTO_10831 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10842 - OBJ
      ?AUTO_10843 - LOCATION
    )
    :vars
    (
      ?AUTO_10848 - LOCATION
      ?AUTO_10846 - CITY
      ?AUTO_10845 - LOCATION
      ?AUTO_10849 - AIRPLANE
      ?AUTO_10847 - LOCATION
      ?AUTO_10844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10848 ?AUTO_10846 ) ( IN-CITY ?AUTO_10843 ?AUTO_10846 ) ( not ( = ?AUTO_10843 ?AUTO_10848 ) ) ( AIRPORT ?AUTO_10845 ) ( AIRPORT ?AUTO_10848 ) ( not ( = ?AUTO_10845 ?AUTO_10848 ) ) ( not ( = ?AUTO_10843 ?AUTO_10845 ) ) ( OBJ-AT ?AUTO_10842 ?AUTO_10845 ) ( AIRPLANE-AT ?AUTO_10849 ?AUTO_10848 ) ( IN-CITY ?AUTO_10847 ?AUTO_10846 ) ( not ( = ?AUTO_10848 ?AUTO_10847 ) ) ( not ( = ?AUTO_10843 ?AUTO_10847 ) ) ( not ( = ?AUTO_10845 ?AUTO_10847 ) ) ( TRUCK-AT ?AUTO_10844 ?AUTO_10843 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10844 ?AUTO_10843 ?AUTO_10847 ?AUTO_10846 )
      ( DELIVER-PKG ?AUTO_10842 ?AUTO_10843 )
      ( DELIVER-PKG-VERIFY ?AUTO_10842 ?AUTO_10843 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10850 - OBJ
      ?AUTO_10851 - LOCATION
    )
    :vars
    (
      ?AUTO_10857 - LOCATION
      ?AUTO_10856 - CITY
      ?AUTO_10854 - LOCATION
      ?AUTO_10852 - LOCATION
      ?AUTO_10853 - TRUCK
      ?AUTO_10858 - LOCATION
      ?AUTO_10855 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10857 ?AUTO_10856 ) ( IN-CITY ?AUTO_10851 ?AUTO_10856 ) ( not ( = ?AUTO_10851 ?AUTO_10857 ) ) ( AIRPORT ?AUTO_10854 ) ( AIRPORT ?AUTO_10857 ) ( not ( = ?AUTO_10854 ?AUTO_10857 ) ) ( not ( = ?AUTO_10851 ?AUTO_10854 ) ) ( OBJ-AT ?AUTO_10850 ?AUTO_10854 ) ( IN-CITY ?AUTO_10852 ?AUTO_10856 ) ( not ( = ?AUTO_10857 ?AUTO_10852 ) ) ( not ( = ?AUTO_10851 ?AUTO_10852 ) ) ( not ( = ?AUTO_10854 ?AUTO_10852 ) ) ( TRUCK-AT ?AUTO_10853 ?AUTO_10851 ) ( AIRPORT ?AUTO_10858 ) ( AIRPLANE-AT ?AUTO_10855 ?AUTO_10858 ) ( not ( = ?AUTO_10858 ?AUTO_10857 ) ) ( not ( = ?AUTO_10851 ?AUTO_10858 ) ) ( not ( = ?AUTO_10854 ?AUTO_10858 ) ) ( not ( = ?AUTO_10852 ?AUTO_10858 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10855 ?AUTO_10858 ?AUTO_10857 )
      ( DELIVER-PKG ?AUTO_10850 ?AUTO_10851 )
      ( DELIVER-PKG-VERIFY ?AUTO_10850 ?AUTO_10851 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10875 - OBJ
      ?AUTO_10876 - LOCATION
    )
    :vars
    (
      ?AUTO_10879 - LOCATION
      ?AUTO_10878 - CITY
      ?AUTO_10877 - LOCATION
      ?AUTO_10881 - LOCATION
      ?AUTO_10883 - TRUCK
      ?AUTO_10882 - LOCATION
      ?AUTO_10880 - AIRPLANE
      ?AUTO_10884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10879 ?AUTO_10878 ) ( IN-CITY ?AUTO_10876 ?AUTO_10878 ) ( not ( = ?AUTO_10876 ?AUTO_10879 ) ) ( AIRPORT ?AUTO_10877 ) ( AIRPORT ?AUTO_10879 ) ( not ( = ?AUTO_10877 ?AUTO_10879 ) ) ( not ( = ?AUTO_10876 ?AUTO_10877 ) ) ( IN-CITY ?AUTO_10881 ?AUTO_10878 ) ( not ( = ?AUTO_10879 ?AUTO_10881 ) ) ( not ( = ?AUTO_10876 ?AUTO_10881 ) ) ( not ( = ?AUTO_10877 ?AUTO_10881 ) ) ( TRUCK-AT ?AUTO_10883 ?AUTO_10876 ) ( AIRPORT ?AUTO_10882 ) ( AIRPLANE-AT ?AUTO_10880 ?AUTO_10882 ) ( not ( = ?AUTO_10882 ?AUTO_10879 ) ) ( not ( = ?AUTO_10876 ?AUTO_10882 ) ) ( not ( = ?AUTO_10877 ?AUTO_10882 ) ) ( not ( = ?AUTO_10881 ?AUTO_10882 ) ) ( TRUCK-AT ?AUTO_10884 ?AUTO_10877 ) ( IN-TRUCK ?AUTO_10875 ?AUTO_10884 ) ( not ( = ?AUTO_10883 ?AUTO_10884 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10875 ?AUTO_10884 ?AUTO_10877 )
      ( DELIVER-PKG ?AUTO_10875 ?AUTO_10876 )
      ( DELIVER-PKG-VERIFY ?AUTO_10875 ?AUTO_10876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10891 - OBJ
      ?AUTO_10892 - LOCATION
    )
    :vars
    (
      ?AUTO_10894 - LOCATION
      ?AUTO_10897 - CITY
      ?AUTO_10893 - LOCATION
      ?AUTO_10898 - LOCATION
      ?AUTO_10895 - TRUCK
      ?AUTO_10899 - LOCATION
      ?AUTO_10900 - AIRPLANE
      ?AUTO_10896 - TRUCK
      ?AUTO_10901 - LOCATION
      ?AUTO_10902 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10894 ?AUTO_10897 ) ( IN-CITY ?AUTO_10892 ?AUTO_10897 ) ( not ( = ?AUTO_10892 ?AUTO_10894 ) ) ( AIRPORT ?AUTO_10893 ) ( AIRPORT ?AUTO_10894 ) ( not ( = ?AUTO_10893 ?AUTO_10894 ) ) ( not ( = ?AUTO_10892 ?AUTO_10893 ) ) ( IN-CITY ?AUTO_10898 ?AUTO_10897 ) ( not ( = ?AUTO_10894 ?AUTO_10898 ) ) ( not ( = ?AUTO_10892 ?AUTO_10898 ) ) ( not ( = ?AUTO_10893 ?AUTO_10898 ) ) ( TRUCK-AT ?AUTO_10895 ?AUTO_10892 ) ( AIRPORT ?AUTO_10899 ) ( AIRPLANE-AT ?AUTO_10900 ?AUTO_10899 ) ( not ( = ?AUTO_10899 ?AUTO_10894 ) ) ( not ( = ?AUTO_10892 ?AUTO_10899 ) ) ( not ( = ?AUTO_10893 ?AUTO_10899 ) ) ( not ( = ?AUTO_10898 ?AUTO_10899 ) ) ( IN-TRUCK ?AUTO_10891 ?AUTO_10896 ) ( not ( = ?AUTO_10895 ?AUTO_10896 ) ) ( TRUCK-AT ?AUTO_10896 ?AUTO_10901 ) ( IN-CITY ?AUTO_10901 ?AUTO_10902 ) ( IN-CITY ?AUTO_10893 ?AUTO_10902 ) ( not ( = ?AUTO_10893 ?AUTO_10901 ) ) ( not ( = ?AUTO_10892 ?AUTO_10901 ) ) ( not ( = ?AUTO_10894 ?AUTO_10901 ) ) ( not ( = ?AUTO_10897 ?AUTO_10902 ) ) ( not ( = ?AUTO_10898 ?AUTO_10901 ) ) ( not ( = ?AUTO_10899 ?AUTO_10901 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10896 ?AUTO_10901 ?AUTO_10893 ?AUTO_10902 )
      ( DELIVER-PKG ?AUTO_10891 ?AUTO_10892 )
      ( DELIVER-PKG-VERIFY ?AUTO_10891 ?AUTO_10892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10903 - OBJ
      ?AUTO_10904 - LOCATION
    )
    :vars
    (
      ?AUTO_10910 - LOCATION
      ?AUTO_10905 - CITY
      ?AUTO_10906 - LOCATION
      ?AUTO_10907 - LOCATION
      ?AUTO_10909 - TRUCK
      ?AUTO_10911 - LOCATION
      ?AUTO_10908 - AIRPLANE
      ?AUTO_10912 - TRUCK
      ?AUTO_10913 - LOCATION
      ?AUTO_10914 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10910 ?AUTO_10905 ) ( IN-CITY ?AUTO_10904 ?AUTO_10905 ) ( not ( = ?AUTO_10904 ?AUTO_10910 ) ) ( AIRPORT ?AUTO_10906 ) ( AIRPORT ?AUTO_10910 ) ( not ( = ?AUTO_10906 ?AUTO_10910 ) ) ( not ( = ?AUTO_10904 ?AUTO_10906 ) ) ( IN-CITY ?AUTO_10907 ?AUTO_10905 ) ( not ( = ?AUTO_10910 ?AUTO_10907 ) ) ( not ( = ?AUTO_10904 ?AUTO_10907 ) ) ( not ( = ?AUTO_10906 ?AUTO_10907 ) ) ( TRUCK-AT ?AUTO_10909 ?AUTO_10904 ) ( AIRPORT ?AUTO_10911 ) ( AIRPLANE-AT ?AUTO_10908 ?AUTO_10911 ) ( not ( = ?AUTO_10911 ?AUTO_10910 ) ) ( not ( = ?AUTO_10904 ?AUTO_10911 ) ) ( not ( = ?AUTO_10906 ?AUTO_10911 ) ) ( not ( = ?AUTO_10907 ?AUTO_10911 ) ) ( not ( = ?AUTO_10909 ?AUTO_10912 ) ) ( TRUCK-AT ?AUTO_10912 ?AUTO_10913 ) ( IN-CITY ?AUTO_10913 ?AUTO_10914 ) ( IN-CITY ?AUTO_10906 ?AUTO_10914 ) ( not ( = ?AUTO_10906 ?AUTO_10913 ) ) ( not ( = ?AUTO_10904 ?AUTO_10913 ) ) ( not ( = ?AUTO_10910 ?AUTO_10913 ) ) ( not ( = ?AUTO_10905 ?AUTO_10914 ) ) ( not ( = ?AUTO_10907 ?AUTO_10913 ) ) ( not ( = ?AUTO_10911 ?AUTO_10913 ) ) ( OBJ-AT ?AUTO_10903 ?AUTO_10913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10903 ?AUTO_10912 ?AUTO_10913 )
      ( DELIVER-PKG ?AUTO_10903 ?AUTO_10904 )
      ( DELIVER-PKG-VERIFY ?AUTO_10903 ?AUTO_10904 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10915 - OBJ
      ?AUTO_10916 - LOCATION
    )
    :vars
    (
      ?AUTO_10920 - LOCATION
      ?AUTO_10924 - CITY
      ?AUTO_10925 - LOCATION
      ?AUTO_10926 - LOCATION
      ?AUTO_10919 - TRUCK
      ?AUTO_10921 - LOCATION
      ?AUTO_10917 - AIRPLANE
      ?AUTO_10923 - TRUCK
      ?AUTO_10922 - LOCATION
      ?AUTO_10918 - CITY
      ?AUTO_10927 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10920 ?AUTO_10924 ) ( IN-CITY ?AUTO_10916 ?AUTO_10924 ) ( not ( = ?AUTO_10916 ?AUTO_10920 ) ) ( AIRPORT ?AUTO_10925 ) ( AIRPORT ?AUTO_10920 ) ( not ( = ?AUTO_10925 ?AUTO_10920 ) ) ( not ( = ?AUTO_10916 ?AUTO_10925 ) ) ( IN-CITY ?AUTO_10926 ?AUTO_10924 ) ( not ( = ?AUTO_10920 ?AUTO_10926 ) ) ( not ( = ?AUTO_10916 ?AUTO_10926 ) ) ( not ( = ?AUTO_10925 ?AUTO_10926 ) ) ( TRUCK-AT ?AUTO_10919 ?AUTO_10916 ) ( AIRPORT ?AUTO_10921 ) ( AIRPLANE-AT ?AUTO_10917 ?AUTO_10921 ) ( not ( = ?AUTO_10921 ?AUTO_10920 ) ) ( not ( = ?AUTO_10916 ?AUTO_10921 ) ) ( not ( = ?AUTO_10925 ?AUTO_10921 ) ) ( not ( = ?AUTO_10926 ?AUTO_10921 ) ) ( not ( = ?AUTO_10919 ?AUTO_10923 ) ) ( IN-CITY ?AUTO_10922 ?AUTO_10918 ) ( IN-CITY ?AUTO_10925 ?AUTO_10918 ) ( not ( = ?AUTO_10925 ?AUTO_10922 ) ) ( not ( = ?AUTO_10916 ?AUTO_10922 ) ) ( not ( = ?AUTO_10920 ?AUTO_10922 ) ) ( not ( = ?AUTO_10924 ?AUTO_10918 ) ) ( not ( = ?AUTO_10926 ?AUTO_10922 ) ) ( not ( = ?AUTO_10921 ?AUTO_10922 ) ) ( OBJ-AT ?AUTO_10915 ?AUTO_10922 ) ( TRUCK-AT ?AUTO_10923 ?AUTO_10927 ) ( IN-CITY ?AUTO_10927 ?AUTO_10918 ) ( not ( = ?AUTO_10922 ?AUTO_10927 ) ) ( not ( = ?AUTO_10916 ?AUTO_10927 ) ) ( not ( = ?AUTO_10920 ?AUTO_10927 ) ) ( not ( = ?AUTO_10925 ?AUTO_10927 ) ) ( not ( = ?AUTO_10926 ?AUTO_10927 ) ) ( not ( = ?AUTO_10921 ?AUTO_10927 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10923 ?AUTO_10927 ?AUTO_10922 ?AUTO_10918 )
      ( DELIVER-PKG ?AUTO_10915 ?AUTO_10916 )
      ( DELIVER-PKG-VERIFY ?AUTO_10915 ?AUTO_10916 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10932 - OBJ
      ?AUTO_10933 - LOCATION
    )
    :vars
    (
      ?AUTO_10934 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10934 ?AUTO_10933 ) ( IN-TRUCK ?AUTO_10932 ?AUTO_10934 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_10932 ?AUTO_10934 ?AUTO_10933 )
      ( DELIVER-PKG-VERIFY ?AUTO_10932 ?AUTO_10933 ) )
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
      ?AUTO_10944 - OBJ
      ?AUTO_10945 - LOCATION
    )
    :vars
    (
      ?AUTO_10948 - TRUCK
      ?AUTO_10946 - LOCATION
      ?AUTO_10947 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_10948 ?AUTO_10946 ) ( IN-CITY ?AUTO_10946 ?AUTO_10947 ) ( IN-CITY ?AUTO_10945 ?AUTO_10947 ) ( not ( = ?AUTO_10945 ?AUTO_10946 ) ) ( OBJ-AT ?AUTO_10944 ?AUTO_10946 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10944 ?AUTO_10948 ?AUTO_10946 )
      ( DELIVER-PKG ?AUTO_10944 ?AUTO_10945 )
      ( DELIVER-PKG-VERIFY ?AUTO_10944 ?AUTO_10945 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10949 - OBJ
      ?AUTO_10950 - LOCATION
    )
    :vars
    (
      ?AUTO_10951 - LOCATION
      ?AUTO_10952 - CITY
      ?AUTO_10953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10951 ?AUTO_10952 ) ( IN-CITY ?AUTO_10950 ?AUTO_10952 ) ( not ( = ?AUTO_10950 ?AUTO_10951 ) ) ( OBJ-AT ?AUTO_10949 ?AUTO_10951 ) ( TRUCK-AT ?AUTO_10953 ?AUTO_10950 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10953 ?AUTO_10950 ?AUTO_10951 ?AUTO_10952 )
      ( DELIVER-PKG ?AUTO_10949 ?AUTO_10950 )
      ( DELIVER-PKG-VERIFY ?AUTO_10949 ?AUTO_10950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10980 - OBJ
      ?AUTO_10981 - LOCATION
    )
    :vars
    (
      ?AUTO_10983 - LOCATION
      ?AUTO_10982 - CITY
      ?AUTO_10984 - TRUCK
      ?AUTO_10985 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10983 ?AUTO_10982 ) ( IN-CITY ?AUTO_10981 ?AUTO_10982 ) ( not ( = ?AUTO_10981 ?AUTO_10983 ) ) ( TRUCK-AT ?AUTO_10984 ?AUTO_10981 ) ( IN-AIRPLANE ?AUTO_10980 ?AUTO_10985 ) ( AIRPLANE-AT ?AUTO_10985 ?AUTO_10983 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_10980 ?AUTO_10985 ?AUTO_10983 )
      ( DELIVER-PKG ?AUTO_10980 ?AUTO_10981 )
      ( DELIVER-PKG-VERIFY ?AUTO_10980 ?AUTO_10981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10986 - OBJ
      ?AUTO_10987 - LOCATION
    )
    :vars
    (
      ?AUTO_10989 - LOCATION
      ?AUTO_10988 - CITY
      ?AUTO_10990 - TRUCK
      ?AUTO_10991 - AIRPLANE
      ?AUTO_10992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10989 ?AUTO_10988 ) ( IN-CITY ?AUTO_10987 ?AUTO_10988 ) ( not ( = ?AUTO_10987 ?AUTO_10989 ) ) ( TRUCK-AT ?AUTO_10990 ?AUTO_10987 ) ( IN-AIRPLANE ?AUTO_10986 ?AUTO_10991 ) ( AIRPORT ?AUTO_10992 ) ( AIRPORT ?AUTO_10989 ) ( AIRPLANE-AT ?AUTO_10991 ?AUTO_10992 ) ( not ( = ?AUTO_10992 ?AUTO_10989 ) ) ( not ( = ?AUTO_10987 ?AUTO_10992 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10991 ?AUTO_10992 ?AUTO_10989 )
      ( DELIVER-PKG ?AUTO_10986 ?AUTO_10987 )
      ( DELIVER-PKG-VERIFY ?AUTO_10986 ?AUTO_10987 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11033 - OBJ
      ?AUTO_11034 - LOCATION
    )
    :vars
    (
      ?AUTO_11039 - LOCATION
      ?AUTO_11037 - CITY
      ?AUTO_11038 - TRUCK
      ?AUTO_11036 - LOCATION
      ?AUTO_11035 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11039 ?AUTO_11037 ) ( IN-CITY ?AUTO_11034 ?AUTO_11037 ) ( not ( = ?AUTO_11034 ?AUTO_11039 ) ) ( TRUCK-AT ?AUTO_11038 ?AUTO_11034 ) ( AIRPORT ?AUTO_11036 ) ( AIRPORT ?AUTO_11039 ) ( AIRPLANE-AT ?AUTO_11035 ?AUTO_11036 ) ( not ( = ?AUTO_11036 ?AUTO_11039 ) ) ( not ( = ?AUTO_11034 ?AUTO_11036 ) ) ( OBJ-AT ?AUTO_11033 ?AUTO_11036 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11033 ?AUTO_11035 ?AUTO_11036 )
      ( DELIVER-PKG ?AUTO_11033 ?AUTO_11034 )
      ( DELIVER-PKG-VERIFY ?AUTO_11033 ?AUTO_11034 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11066 - OBJ
      ?AUTO_11067 - LOCATION
    )
    :vars
    (
      ?AUTO_11068 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11068 ?AUTO_11067 ) ( IN-TRUCK ?AUTO_11066 ?AUTO_11068 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11066 ?AUTO_11068 ?AUTO_11067 )
      ( DELIVER-PKG-VERIFY ?AUTO_11066 ?AUTO_11067 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11075 - OBJ
      ?AUTO_11076 - LOCATION
    )
    :vars
    (
      ?AUTO_11078 - TRUCK
      ?AUTO_11077 - LOCATION
      ?AUTO_11079 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11078 ?AUTO_11077 ) ( IN-CITY ?AUTO_11077 ?AUTO_11079 ) ( IN-CITY ?AUTO_11076 ?AUTO_11079 ) ( not ( = ?AUTO_11076 ?AUTO_11077 ) ) ( OBJ-AT ?AUTO_11075 ?AUTO_11077 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11075 ?AUTO_11078 ?AUTO_11077 )
      ( DELIVER-PKG ?AUTO_11075 ?AUTO_11076 )
      ( DELIVER-PKG-VERIFY ?AUTO_11075 ?AUTO_11076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11108 - OBJ
      ?AUTO_11109 - LOCATION
    )
    :vars
    (
      ?AUTO_11111 - LOCATION
      ?AUTO_11112 - CITY
      ?AUTO_11110 - TRUCK
      ?AUTO_11113 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11111 ?AUTO_11112 ) ( IN-CITY ?AUTO_11109 ?AUTO_11112 ) ( not ( = ?AUTO_11109 ?AUTO_11111 ) ) ( TRUCK-AT ?AUTO_11110 ?AUTO_11109 ) ( IN-AIRPLANE ?AUTO_11108 ?AUTO_11113 ) ( AIRPLANE-AT ?AUTO_11113 ?AUTO_11111 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11108 ?AUTO_11113 ?AUTO_11111 )
      ( DELIVER-PKG ?AUTO_11108 ?AUTO_11109 )
      ( DELIVER-PKG-VERIFY ?AUTO_11108 ?AUTO_11109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11122 - OBJ
      ?AUTO_11123 - LOCATION
    )
    :vars
    (
      ?AUTO_11126 - LOCATION
      ?AUTO_11127 - CITY
      ?AUTO_11128 - TRUCK
      ?AUTO_11124 - LOCATION
      ?AUTO_11125 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11126 ?AUTO_11127 ) ( IN-CITY ?AUTO_11123 ?AUTO_11127 ) ( not ( = ?AUTO_11123 ?AUTO_11126 ) ) ( TRUCK-AT ?AUTO_11128 ?AUTO_11123 ) ( AIRPORT ?AUTO_11124 ) ( AIRPORT ?AUTO_11126 ) ( AIRPLANE-AT ?AUTO_11125 ?AUTO_11124 ) ( not ( = ?AUTO_11124 ?AUTO_11126 ) ) ( not ( = ?AUTO_11123 ?AUTO_11124 ) ) ( OBJ-AT ?AUTO_11122 ?AUTO_11124 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_11122 ?AUTO_11125 ?AUTO_11124 )
      ( DELIVER-PKG ?AUTO_11122 ?AUTO_11123 )
      ( DELIVER-PKG-VERIFY ?AUTO_11122 ?AUTO_11123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11129 - OBJ
      ?AUTO_11130 - LOCATION
    )
    :vars
    (
      ?AUTO_11134 - LOCATION
      ?AUTO_11135 - CITY
      ?AUTO_11133 - TRUCK
      ?AUTO_11131 - LOCATION
      ?AUTO_11136 - LOCATION
      ?AUTO_11132 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11134 ?AUTO_11135 ) ( IN-CITY ?AUTO_11130 ?AUTO_11135 ) ( not ( = ?AUTO_11130 ?AUTO_11134 ) ) ( TRUCK-AT ?AUTO_11133 ?AUTO_11130 ) ( AIRPORT ?AUTO_11131 ) ( AIRPORT ?AUTO_11134 ) ( not ( = ?AUTO_11131 ?AUTO_11134 ) ) ( not ( = ?AUTO_11130 ?AUTO_11131 ) ) ( OBJ-AT ?AUTO_11129 ?AUTO_11131 ) ( AIRPORT ?AUTO_11136 ) ( AIRPLANE-AT ?AUTO_11132 ?AUTO_11136 ) ( not ( = ?AUTO_11136 ?AUTO_11131 ) ) ( not ( = ?AUTO_11130 ?AUTO_11136 ) ) ( not ( = ?AUTO_11134 ?AUTO_11136 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11132 ?AUTO_11136 ?AUTO_11131 )
      ( DELIVER-PKG ?AUTO_11129 ?AUTO_11130 )
      ( DELIVER-PKG-VERIFY ?AUTO_11129 ?AUTO_11130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11197 - OBJ
      ?AUTO_11198 - LOCATION
    )
    :vars
    (
      ?AUTO_11199 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11199 ?AUTO_11198 ) ( IN-TRUCK ?AUTO_11197 ?AUTO_11199 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11197 ?AUTO_11199 ?AUTO_11198 )
      ( DELIVER-PKG-VERIFY ?AUTO_11197 ?AUTO_11198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11206 - OBJ
      ?AUTO_11207 - LOCATION
    )
    :vars
    (
      ?AUTO_11209 - TRUCK
      ?AUTO_11210 - LOCATION
      ?AUTO_11208 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_11209 ?AUTO_11210 ) ( IN-CITY ?AUTO_11210 ?AUTO_11208 ) ( IN-CITY ?AUTO_11207 ?AUTO_11208 ) ( not ( = ?AUTO_11207 ?AUTO_11210 ) ) ( OBJ-AT ?AUTO_11206 ?AUTO_11210 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11206 ?AUTO_11209 ?AUTO_11210 )
      ( DELIVER-PKG ?AUTO_11206 ?AUTO_11207 )
      ( DELIVER-PKG-VERIFY ?AUTO_11206 ?AUTO_11207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11239 - OBJ
      ?AUTO_11240 - LOCATION
    )
    :vars
    (
      ?AUTO_11241 - LOCATION
      ?AUTO_11242 - CITY
      ?AUTO_11243 - TRUCK
      ?AUTO_11244 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11241 ?AUTO_11242 ) ( IN-CITY ?AUTO_11240 ?AUTO_11242 ) ( not ( = ?AUTO_11240 ?AUTO_11241 ) ) ( TRUCK-AT ?AUTO_11243 ?AUTO_11240 ) ( IN-AIRPLANE ?AUTO_11239 ?AUTO_11244 ) ( AIRPLANE-AT ?AUTO_11244 ?AUTO_11241 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_11239 ?AUTO_11244 ?AUTO_11241 )
      ( DELIVER-PKG ?AUTO_11239 ?AUTO_11240 )
      ( DELIVER-PKG-VERIFY ?AUTO_11239 ?AUTO_11240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11273 - OBJ
      ?AUTO_11274 - LOCATION
    )
    :vars
    (
      ?AUTO_11279 - LOCATION
      ?AUTO_11276 - CITY
      ?AUTO_11277 - TRUCK
      ?AUTO_11275 - LOCATION
      ?AUTO_11278 - AIRPLANE
      ?AUTO_11280 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11279 ?AUTO_11276 ) ( IN-CITY ?AUTO_11274 ?AUTO_11276 ) ( not ( = ?AUTO_11274 ?AUTO_11279 ) ) ( TRUCK-AT ?AUTO_11277 ?AUTO_11274 ) ( AIRPORT ?AUTO_11275 ) ( AIRPORT ?AUTO_11279 ) ( AIRPLANE-AT ?AUTO_11278 ?AUTO_11275 ) ( not ( = ?AUTO_11275 ?AUTO_11279 ) ) ( not ( = ?AUTO_11274 ?AUTO_11275 ) ) ( TRUCK-AT ?AUTO_11280 ?AUTO_11275 ) ( IN-TRUCK ?AUTO_11273 ?AUTO_11280 ) ( not ( = ?AUTO_11277 ?AUTO_11280 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_11273 ?AUTO_11280 ?AUTO_11275 )
      ( DELIVER-PKG ?AUTO_11273 ?AUTO_11274 )
      ( DELIVER-PKG-VERIFY ?AUTO_11273 ?AUTO_11274 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11281 - OBJ
      ?AUTO_11282 - LOCATION
    )
    :vars
    (
      ?AUTO_11288 - LOCATION
      ?AUTO_11285 - CITY
      ?AUTO_11284 - TRUCK
      ?AUTO_11283 - LOCATION
      ?AUTO_11286 - AIRPLANE
      ?AUTO_11287 - TRUCK
      ?AUTO_11289 - LOCATION
      ?AUTO_11290 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11288 ?AUTO_11285 ) ( IN-CITY ?AUTO_11282 ?AUTO_11285 ) ( not ( = ?AUTO_11282 ?AUTO_11288 ) ) ( TRUCK-AT ?AUTO_11284 ?AUTO_11282 ) ( AIRPORT ?AUTO_11283 ) ( AIRPORT ?AUTO_11288 ) ( AIRPLANE-AT ?AUTO_11286 ?AUTO_11283 ) ( not ( = ?AUTO_11283 ?AUTO_11288 ) ) ( not ( = ?AUTO_11282 ?AUTO_11283 ) ) ( IN-TRUCK ?AUTO_11281 ?AUTO_11287 ) ( not ( = ?AUTO_11284 ?AUTO_11287 ) ) ( TRUCK-AT ?AUTO_11287 ?AUTO_11289 ) ( IN-CITY ?AUTO_11289 ?AUTO_11290 ) ( IN-CITY ?AUTO_11283 ?AUTO_11290 ) ( not ( = ?AUTO_11283 ?AUTO_11289 ) ) ( not ( = ?AUTO_11282 ?AUTO_11289 ) ) ( not ( = ?AUTO_11288 ?AUTO_11289 ) ) ( not ( = ?AUTO_11285 ?AUTO_11290 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11287 ?AUTO_11289 ?AUTO_11283 ?AUTO_11290 )
      ( DELIVER-PKG ?AUTO_11281 ?AUTO_11282 )
      ( DELIVER-PKG-VERIFY ?AUTO_11281 ?AUTO_11282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11293 - OBJ
      ?AUTO_11294 - LOCATION
    )
    :vars
    (
      ?AUTO_11301 - LOCATION
      ?AUTO_11299 - CITY
      ?AUTO_11300 - TRUCK
      ?AUTO_11298 - LOCATION
      ?AUTO_11295 - AIRPLANE
      ?AUTO_11302 - TRUCK
      ?AUTO_11296 - LOCATION
      ?AUTO_11297 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11301 ?AUTO_11299 ) ( IN-CITY ?AUTO_11294 ?AUTO_11299 ) ( not ( = ?AUTO_11294 ?AUTO_11301 ) ) ( TRUCK-AT ?AUTO_11300 ?AUTO_11294 ) ( AIRPORT ?AUTO_11298 ) ( AIRPORT ?AUTO_11301 ) ( AIRPLANE-AT ?AUTO_11295 ?AUTO_11298 ) ( not ( = ?AUTO_11298 ?AUTO_11301 ) ) ( not ( = ?AUTO_11294 ?AUTO_11298 ) ) ( not ( = ?AUTO_11300 ?AUTO_11302 ) ) ( TRUCK-AT ?AUTO_11302 ?AUTO_11296 ) ( IN-CITY ?AUTO_11296 ?AUTO_11297 ) ( IN-CITY ?AUTO_11298 ?AUTO_11297 ) ( not ( = ?AUTO_11298 ?AUTO_11296 ) ) ( not ( = ?AUTO_11294 ?AUTO_11296 ) ) ( not ( = ?AUTO_11301 ?AUTO_11296 ) ) ( not ( = ?AUTO_11299 ?AUTO_11297 ) ) ( OBJ-AT ?AUTO_11293 ?AUTO_11296 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_11293 ?AUTO_11302 ?AUTO_11296 )
      ( DELIVER-PKG ?AUTO_11293 ?AUTO_11294 )
      ( DELIVER-PKG-VERIFY ?AUTO_11293 ?AUTO_11294 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11303 - OBJ
      ?AUTO_11304 - LOCATION
    )
    :vars
    (
      ?AUTO_11306 - LOCATION
      ?AUTO_11312 - CITY
      ?AUTO_11309 - TRUCK
      ?AUTO_11311 - LOCATION
      ?AUTO_11308 - AIRPLANE
      ?AUTO_11310 - TRUCK
      ?AUTO_11305 - LOCATION
      ?AUTO_11307 - CITY
      ?AUTO_11313 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11306 ?AUTO_11312 ) ( IN-CITY ?AUTO_11304 ?AUTO_11312 ) ( not ( = ?AUTO_11304 ?AUTO_11306 ) ) ( TRUCK-AT ?AUTO_11309 ?AUTO_11304 ) ( AIRPORT ?AUTO_11311 ) ( AIRPORT ?AUTO_11306 ) ( AIRPLANE-AT ?AUTO_11308 ?AUTO_11311 ) ( not ( = ?AUTO_11311 ?AUTO_11306 ) ) ( not ( = ?AUTO_11304 ?AUTO_11311 ) ) ( not ( = ?AUTO_11309 ?AUTO_11310 ) ) ( IN-CITY ?AUTO_11305 ?AUTO_11307 ) ( IN-CITY ?AUTO_11311 ?AUTO_11307 ) ( not ( = ?AUTO_11311 ?AUTO_11305 ) ) ( not ( = ?AUTO_11304 ?AUTO_11305 ) ) ( not ( = ?AUTO_11306 ?AUTO_11305 ) ) ( not ( = ?AUTO_11312 ?AUTO_11307 ) ) ( OBJ-AT ?AUTO_11303 ?AUTO_11305 ) ( TRUCK-AT ?AUTO_11310 ?AUTO_11313 ) ( IN-CITY ?AUTO_11313 ?AUTO_11307 ) ( not ( = ?AUTO_11305 ?AUTO_11313 ) ) ( not ( = ?AUTO_11304 ?AUTO_11313 ) ) ( not ( = ?AUTO_11306 ?AUTO_11313 ) ) ( not ( = ?AUTO_11311 ?AUTO_11313 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11310 ?AUTO_11313 ?AUTO_11305 ?AUTO_11307 )
      ( DELIVER-PKG ?AUTO_11303 ?AUTO_11304 )
      ( DELIVER-PKG-VERIFY ?AUTO_11303 ?AUTO_11304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11314 - OBJ
      ?AUTO_11315 - LOCATION
    )
    :vars
    (
      ?AUTO_11322 - LOCATION
      ?AUTO_11318 - CITY
      ?AUTO_11324 - TRUCK
      ?AUTO_11323 - LOCATION
      ?AUTO_11320 - TRUCK
      ?AUTO_11321 - LOCATION
      ?AUTO_11316 - CITY
      ?AUTO_11317 - LOCATION
      ?AUTO_11325 - LOCATION
      ?AUTO_11319 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11322 ?AUTO_11318 ) ( IN-CITY ?AUTO_11315 ?AUTO_11318 ) ( not ( = ?AUTO_11315 ?AUTO_11322 ) ) ( TRUCK-AT ?AUTO_11324 ?AUTO_11315 ) ( AIRPORT ?AUTO_11323 ) ( AIRPORT ?AUTO_11322 ) ( not ( = ?AUTO_11323 ?AUTO_11322 ) ) ( not ( = ?AUTO_11315 ?AUTO_11323 ) ) ( not ( = ?AUTO_11324 ?AUTO_11320 ) ) ( IN-CITY ?AUTO_11321 ?AUTO_11316 ) ( IN-CITY ?AUTO_11323 ?AUTO_11316 ) ( not ( = ?AUTO_11323 ?AUTO_11321 ) ) ( not ( = ?AUTO_11315 ?AUTO_11321 ) ) ( not ( = ?AUTO_11322 ?AUTO_11321 ) ) ( not ( = ?AUTO_11318 ?AUTO_11316 ) ) ( OBJ-AT ?AUTO_11314 ?AUTO_11321 ) ( TRUCK-AT ?AUTO_11320 ?AUTO_11317 ) ( IN-CITY ?AUTO_11317 ?AUTO_11316 ) ( not ( = ?AUTO_11321 ?AUTO_11317 ) ) ( not ( = ?AUTO_11315 ?AUTO_11317 ) ) ( not ( = ?AUTO_11322 ?AUTO_11317 ) ) ( not ( = ?AUTO_11323 ?AUTO_11317 ) ) ( AIRPORT ?AUTO_11325 ) ( AIRPLANE-AT ?AUTO_11319 ?AUTO_11325 ) ( not ( = ?AUTO_11325 ?AUTO_11323 ) ) ( not ( = ?AUTO_11315 ?AUTO_11325 ) ) ( not ( = ?AUTO_11322 ?AUTO_11325 ) ) ( not ( = ?AUTO_11321 ?AUTO_11325 ) ) ( not ( = ?AUTO_11317 ?AUTO_11325 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11319 ?AUTO_11325 ?AUTO_11323 )
      ( DELIVER-PKG ?AUTO_11314 ?AUTO_11315 )
      ( DELIVER-PKG-VERIFY ?AUTO_11314 ?AUTO_11315 ) )
  )

)

