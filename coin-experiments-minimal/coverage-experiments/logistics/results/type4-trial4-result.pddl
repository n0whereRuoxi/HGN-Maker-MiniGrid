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
      ?AUTO_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4 ?AUTO_3 ) ( IN-TRUCK ?AUTO_2 ?AUTO_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2 ?AUTO_4 ?AUTO_3 )
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
      ?AUTO_7 - TRUCK
      ?AUTO_8 - LOCATION
      ?AUTO_9 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5 ?AUTO_7 ) ( TRUCK-AT ?AUTO_7 ?AUTO_8 ) ( IN-CITY ?AUTO_8 ?AUTO_9 ) ( IN-CITY ?AUTO_6 ?AUTO_9 ) ( not ( = ?AUTO_6 ?AUTO_8 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7 ?AUTO_8 ?AUTO_6 ?AUTO_9 )
      ( DELIVER-PKG ?AUTO_5 ?AUTO_6 )
      ( DELIVER-PKG-VERIFY ?AUTO_5 ?AUTO_6 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10 - OBJ
      ?AUTO_11 - LOCATION
    )
    :vars
    (
      ?AUTO_14 - TRUCK
      ?AUTO_13 - LOCATION
      ?AUTO_12 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_14 ?AUTO_13 ) ( IN-CITY ?AUTO_13 ?AUTO_12 ) ( IN-CITY ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( OBJ-AT ?AUTO_10 ?AUTO_13 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10 ?AUTO_14 ?AUTO_13 )
      ( DELIVER-PKG ?AUTO_10 ?AUTO_11 )
      ( DELIVER-PKG-VERIFY ?AUTO_10 ?AUTO_11 ) )
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
      ?AUTO_19 - CITY
      ?AUTO_18 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_17 ?AUTO_19 ) ( IN-CITY ?AUTO_16 ?AUTO_19 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_17 ) ( TRUCK-AT ?AUTO_18 ?AUTO_16 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_18 ?AUTO_16 ?AUTO_17 ?AUTO_19 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
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
      ?AUTO_35 - OBJ
      ?AUTO_36 - LOCATION
    )
    :vars
    (
      ?AUTO_38 - LOCATION
      ?AUTO_37 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_38 ) ( AIRPORT ?AUTO_36 ) ( AIRPLANE-AT ?AUTO_37 ?AUTO_38 ) ( not ( = ?AUTO_38 ?AUTO_36 ) ) ( OBJ-AT ?AUTO_35 ?AUTO_38 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_35 ?AUTO_37 ?AUTO_38 )
      ( DELIVER-PKG ?AUTO_35 ?AUTO_36 )
      ( DELIVER-PKG-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_39 - OBJ
      ?AUTO_40 - LOCATION
    )
    :vars
    (
      ?AUTO_42 - LOCATION
      ?AUTO_41 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_42 ) ( AIRPORT ?AUTO_40 ) ( not ( = ?AUTO_42 ?AUTO_40 ) ) ( OBJ-AT ?AUTO_39 ?AUTO_42 ) ( AIRPLANE-AT ?AUTO_41 ?AUTO_40 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_41 ?AUTO_40 ?AUTO_42 )
      ( DELIVER-PKG ?AUTO_39 ?AUTO_40 )
      ( DELIVER-PKG-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_53 - OBJ
      ?AUTO_54 - LOCATION
    )
    :vars
    (
      ?AUTO_56 - LOCATION
      ?AUTO_57 - LOCATION
      ?AUTO_55 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_56 ) ( AIRPORT ?AUTO_54 ) ( not ( = ?AUTO_56 ?AUTO_54 ) ) ( OBJ-AT ?AUTO_53 ?AUTO_56 ) ( AIRPORT ?AUTO_57 ) ( AIRPLANE-AT ?AUTO_55 ?AUTO_57 ) ( not ( = ?AUTO_57 ?AUTO_54 ) ) ( not ( = ?AUTO_56 ?AUTO_57 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_55 ?AUTO_57 ?AUTO_54 )
      ( DELIVER-PKG ?AUTO_53 ?AUTO_54 )
      ( DELIVER-PKG-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_62 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_60 ?AUTO_62 ) ( AIRPLANE-AT ?AUTO_62 ?AUTO_61 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_60 ?AUTO_62 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_63 - OBJ
      ?AUTO_64 - LOCATION
    )
    :vars
    (
      ?AUTO_65 - AIRPLANE
      ?AUTO_66 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_63 ?AUTO_65 ) ( AIRPORT ?AUTO_66 ) ( AIRPORT ?AUTO_64 ) ( AIRPLANE-AT ?AUTO_65 ?AUTO_66 ) ( not ( = ?AUTO_66 ?AUTO_64 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_65 ?AUTO_66 ?AUTO_64 )
      ( DELIVER-PKG ?AUTO_63 ?AUTO_64 )
      ( DELIVER-PKG-VERIFY ?AUTO_63 ?AUTO_64 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_71 - OBJ
      ?AUTO_72 - LOCATION
    )
    :vars
    (
      ?AUTO_73 - LOCATION
      ?AUTO_74 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_73 ) ( AIRPORT ?AUTO_72 ) ( AIRPLANE-AT ?AUTO_74 ?AUTO_73 ) ( not ( = ?AUTO_73 ?AUTO_72 ) ) ( OBJ-AT ?AUTO_71 ?AUTO_73 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_71 ?AUTO_74 ?AUTO_73 )
      ( DELIVER-PKG ?AUTO_71 ?AUTO_72 )
      ( DELIVER-PKG-VERIFY ?AUTO_71 ?AUTO_72 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_77 - OBJ
      ?AUTO_78 - LOCATION
    )
    :vars
    (
      ?AUTO_79 - LOCATION
      ?AUTO_81 - LOCATION
      ?AUTO_80 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_79 ) ( AIRPORT ?AUTO_78 ) ( not ( = ?AUTO_79 ?AUTO_78 ) ) ( OBJ-AT ?AUTO_77 ?AUTO_79 ) ( AIRPORT ?AUTO_81 ) ( AIRPLANE-AT ?AUTO_80 ?AUTO_81 ) ( not ( = ?AUTO_81 ?AUTO_79 ) ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_80 ?AUTO_81 ?AUTO_79 )
      ( DELIVER-PKG ?AUTO_77 ?AUTO_78 )
      ( DELIVER-PKG-VERIFY ?AUTO_77 ?AUTO_78 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_82 - OBJ
      ?AUTO_83 - LOCATION
    )
    :vars
    (
      ?AUTO_85 - LOCATION
      ?AUTO_86 - LOCATION
      ?AUTO_84 - AIRPLANE
      ?AUTO_87 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_85 ) ( AIRPORT ?AUTO_83 ) ( not ( = ?AUTO_85 ?AUTO_83 ) ) ( AIRPORT ?AUTO_86 ) ( AIRPLANE-AT ?AUTO_84 ?AUTO_86 ) ( not ( = ?AUTO_86 ?AUTO_85 ) ) ( not ( = ?AUTO_83 ?AUTO_86 ) ) ( TRUCK-AT ?AUTO_87 ?AUTO_85 ) ( IN-TRUCK ?AUTO_82 ?AUTO_87 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_82 ?AUTO_87 ?AUTO_85 )
      ( DELIVER-PKG ?AUTO_82 ?AUTO_83 )
      ( DELIVER-PKG-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_88 - OBJ
      ?AUTO_89 - LOCATION
    )
    :vars
    (
      ?AUTO_90 - LOCATION
      ?AUTO_93 - LOCATION
      ?AUTO_92 - AIRPLANE
      ?AUTO_91 - TRUCK
      ?AUTO_94 - LOCATION
      ?AUTO_95 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_90 ) ( AIRPORT ?AUTO_89 ) ( not ( = ?AUTO_90 ?AUTO_89 ) ) ( AIRPORT ?AUTO_93 ) ( AIRPLANE-AT ?AUTO_92 ?AUTO_93 ) ( not ( = ?AUTO_93 ?AUTO_90 ) ) ( not ( = ?AUTO_89 ?AUTO_93 ) ) ( IN-TRUCK ?AUTO_88 ?AUTO_91 ) ( TRUCK-AT ?AUTO_91 ?AUTO_94 ) ( IN-CITY ?AUTO_94 ?AUTO_95 ) ( IN-CITY ?AUTO_90 ?AUTO_95 ) ( not ( = ?AUTO_90 ?AUTO_94 ) ) ( not ( = ?AUTO_89 ?AUTO_94 ) ) ( not ( = ?AUTO_93 ?AUTO_94 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_91 ?AUTO_94 ?AUTO_90 ?AUTO_95 )
      ( DELIVER-PKG ?AUTO_88 ?AUTO_89 )
      ( DELIVER-PKG-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_96 - OBJ
      ?AUTO_97 - LOCATION
    )
    :vars
    (
      ?AUTO_98 - LOCATION
      ?AUTO_99 - LOCATION
      ?AUTO_102 - AIRPLANE
      ?AUTO_100 - TRUCK
      ?AUTO_103 - LOCATION
      ?AUTO_101 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_98 ) ( AIRPORT ?AUTO_97 ) ( not ( = ?AUTO_98 ?AUTO_97 ) ) ( AIRPORT ?AUTO_99 ) ( AIRPLANE-AT ?AUTO_102 ?AUTO_99 ) ( not ( = ?AUTO_99 ?AUTO_98 ) ) ( not ( = ?AUTO_97 ?AUTO_99 ) ) ( TRUCK-AT ?AUTO_100 ?AUTO_103 ) ( IN-CITY ?AUTO_103 ?AUTO_101 ) ( IN-CITY ?AUTO_98 ?AUTO_101 ) ( not ( = ?AUTO_98 ?AUTO_103 ) ) ( not ( = ?AUTO_97 ?AUTO_103 ) ) ( not ( = ?AUTO_99 ?AUTO_103 ) ) ( OBJ-AT ?AUTO_96 ?AUTO_103 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_96 ?AUTO_100 ?AUTO_103 )
      ( DELIVER-PKG ?AUTO_96 ?AUTO_97 )
      ( DELIVER-PKG-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_107 - LOCATION
      ?AUTO_106 - LOCATION
      ?AUTO_110 - AIRPLANE
      ?AUTO_108 - LOCATION
      ?AUTO_109 - CITY
      ?AUTO_111 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_107 ) ( AIRPORT ?AUTO_105 ) ( not ( = ?AUTO_107 ?AUTO_105 ) ) ( AIRPORT ?AUTO_106 ) ( AIRPLANE-AT ?AUTO_110 ?AUTO_106 ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( IN-CITY ?AUTO_108 ?AUTO_109 ) ( IN-CITY ?AUTO_107 ?AUTO_109 ) ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( not ( = ?AUTO_105 ?AUTO_108 ) ) ( not ( = ?AUTO_106 ?AUTO_108 ) ) ( OBJ-AT ?AUTO_104 ?AUTO_108 ) ( TRUCK-AT ?AUTO_111 ?AUTO_107 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_111 ?AUTO_107 ?AUTO_108 ?AUTO_109 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_118 - OBJ
      ?AUTO_119 - LOCATION
    )
    :vars
    (
      ?AUTO_120 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_120 ?AUTO_119 ) ( IN-TRUCK ?AUTO_118 ?AUTO_120 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_118 ?AUTO_120 ?AUTO_119 )
      ( DELIVER-PKG-VERIFY ?AUTO_118 ?AUTO_119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_121 - OBJ
      ?AUTO_122 - LOCATION
    )
    :vars
    (
      ?AUTO_123 - TRUCK
      ?AUTO_124 - LOCATION
      ?AUTO_125 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_121 ?AUTO_123 ) ( TRUCK-AT ?AUTO_123 ?AUTO_124 ) ( IN-CITY ?AUTO_124 ?AUTO_125 ) ( IN-CITY ?AUTO_122 ?AUTO_125 ) ( not ( = ?AUTO_122 ?AUTO_124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_123 ?AUTO_124 ?AUTO_122 ?AUTO_125 )
      ( DELIVER-PKG ?AUTO_121 ?AUTO_122 )
      ( DELIVER-PKG-VERIFY ?AUTO_121 ?AUTO_122 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_126 - OBJ
      ?AUTO_127 - LOCATION
    )
    :vars
    (
      ?AUTO_128 - TRUCK
      ?AUTO_129 - LOCATION
      ?AUTO_130 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_128 ?AUTO_129 ) ( IN-CITY ?AUTO_129 ?AUTO_130 ) ( IN-CITY ?AUTO_127 ?AUTO_130 ) ( not ( = ?AUTO_127 ?AUTO_129 ) ) ( OBJ-AT ?AUTO_126 ?AUTO_129 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_126 ?AUTO_128 ?AUTO_129 )
      ( DELIVER-PKG ?AUTO_126 ?AUTO_127 )
      ( DELIVER-PKG-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_135 - OBJ
      ?AUTO_136 - LOCATION
    )
    :vars
    (
      ?AUTO_138 - TRUCK
      ?AUTO_139 - LOCATION
      ?AUTO_137 - CITY
      ?AUTO_140 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_138 ?AUTO_139 ) ( IN-CITY ?AUTO_139 ?AUTO_137 ) ( IN-CITY ?AUTO_136 ?AUTO_137 ) ( not ( = ?AUTO_136 ?AUTO_139 ) ) ( IN-AIRPLANE ?AUTO_135 ?AUTO_140 ) ( AIRPLANE-AT ?AUTO_140 ?AUTO_139 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_135 ?AUTO_140 ?AUTO_139 )
      ( DELIVER-PKG ?AUTO_135 ?AUTO_136 )
      ( DELIVER-PKG-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_141 - OBJ
      ?AUTO_142 - LOCATION
    )
    :vars
    (
      ?AUTO_143 - TRUCK
      ?AUTO_145 - LOCATION
      ?AUTO_144 - CITY
      ?AUTO_146 - AIRPLANE
      ?AUTO_147 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_143 ?AUTO_145 ) ( IN-CITY ?AUTO_145 ?AUTO_144 ) ( IN-CITY ?AUTO_142 ?AUTO_144 ) ( not ( = ?AUTO_142 ?AUTO_145 ) ) ( IN-AIRPLANE ?AUTO_141 ?AUTO_146 ) ( AIRPORT ?AUTO_147 ) ( AIRPORT ?AUTO_145 ) ( AIRPLANE-AT ?AUTO_146 ?AUTO_147 ) ( not ( = ?AUTO_147 ?AUTO_145 ) ) ( not ( = ?AUTO_142 ?AUTO_147 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_146 ?AUTO_147 ?AUTO_145 )
      ( DELIVER-PKG ?AUTO_141 ?AUTO_142 )
      ( DELIVER-PKG-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_150 - OBJ
      ?AUTO_151 - LOCATION
    )
    :vars
    (
      ?AUTO_152 - TRUCK
      ?AUTO_154 - LOCATION
      ?AUTO_155 - CITY
      ?AUTO_156 - LOCATION
      ?AUTO_153 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_152 ?AUTO_154 ) ( IN-CITY ?AUTO_154 ?AUTO_155 ) ( IN-CITY ?AUTO_151 ?AUTO_155 ) ( not ( = ?AUTO_151 ?AUTO_154 ) ) ( AIRPORT ?AUTO_156 ) ( AIRPORT ?AUTO_154 ) ( AIRPLANE-AT ?AUTO_153 ?AUTO_156 ) ( not ( = ?AUTO_156 ?AUTO_154 ) ) ( not ( = ?AUTO_151 ?AUTO_156 ) ) ( OBJ-AT ?AUTO_150 ?AUTO_156 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_150 ?AUTO_153 ?AUTO_156 )
      ( DELIVER-PKG ?AUTO_150 ?AUTO_151 )
      ( DELIVER-PKG-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_157 - OBJ
      ?AUTO_158 - LOCATION
    )
    :vars
    (
      ?AUTO_161 - TRUCK
      ?AUTO_162 - LOCATION
      ?AUTO_159 - CITY
      ?AUTO_163 - LOCATION
      ?AUTO_160 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_161 ?AUTO_162 ) ( IN-CITY ?AUTO_162 ?AUTO_159 ) ( IN-CITY ?AUTO_158 ?AUTO_159 ) ( not ( = ?AUTO_158 ?AUTO_162 ) ) ( AIRPORT ?AUTO_163 ) ( AIRPORT ?AUTO_162 ) ( not ( = ?AUTO_163 ?AUTO_162 ) ) ( not ( = ?AUTO_158 ?AUTO_163 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_163 ) ( AIRPLANE-AT ?AUTO_160 ?AUTO_162 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_160 ?AUTO_162 ?AUTO_163 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_172 - OBJ
      ?AUTO_173 - LOCATION
    )
    :vars
    (
      ?AUTO_177 - LOCATION
      ?AUTO_178 - CITY
      ?AUTO_176 - LOCATION
      ?AUTO_175 - AIRPLANE
      ?AUTO_174 - TRUCK
      ?AUTO_179 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_177 ?AUTO_178 ) ( IN-CITY ?AUTO_173 ?AUTO_178 ) ( not ( = ?AUTO_173 ?AUTO_177 ) ) ( AIRPORT ?AUTO_176 ) ( AIRPORT ?AUTO_177 ) ( not ( = ?AUTO_176 ?AUTO_177 ) ) ( not ( = ?AUTO_173 ?AUTO_176 ) ) ( OBJ-AT ?AUTO_172 ?AUTO_176 ) ( AIRPLANE-AT ?AUTO_175 ?AUTO_177 ) ( TRUCK-AT ?AUTO_174 ?AUTO_179 ) ( IN-CITY ?AUTO_179 ?AUTO_178 ) ( not ( = ?AUTO_177 ?AUTO_179 ) ) ( not ( = ?AUTO_173 ?AUTO_179 ) ) ( not ( = ?AUTO_176 ?AUTO_179 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_174 ?AUTO_179 ?AUTO_177 ?AUTO_178 )
      ( DELIVER-PKG ?AUTO_172 ?AUTO_173 )
      ( DELIVER-PKG-VERIFY ?AUTO_172 ?AUTO_173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_180 - OBJ
      ?AUTO_181 - LOCATION
    )
    :vars
    (
      ?AUTO_184 - LOCATION
      ?AUTO_185 - CITY
      ?AUTO_186 - LOCATION
      ?AUTO_183 - TRUCK
      ?AUTO_187 - LOCATION
      ?AUTO_188 - LOCATION
      ?AUTO_182 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_184 ?AUTO_185 ) ( IN-CITY ?AUTO_181 ?AUTO_185 ) ( not ( = ?AUTO_181 ?AUTO_184 ) ) ( AIRPORT ?AUTO_186 ) ( AIRPORT ?AUTO_184 ) ( not ( = ?AUTO_186 ?AUTO_184 ) ) ( not ( = ?AUTO_181 ?AUTO_186 ) ) ( OBJ-AT ?AUTO_180 ?AUTO_186 ) ( TRUCK-AT ?AUTO_183 ?AUTO_187 ) ( IN-CITY ?AUTO_187 ?AUTO_185 ) ( not ( = ?AUTO_184 ?AUTO_187 ) ) ( not ( = ?AUTO_181 ?AUTO_187 ) ) ( not ( = ?AUTO_186 ?AUTO_187 ) ) ( AIRPORT ?AUTO_188 ) ( AIRPLANE-AT ?AUTO_182 ?AUTO_188 ) ( not ( = ?AUTO_188 ?AUTO_184 ) ) ( not ( = ?AUTO_181 ?AUTO_188 ) ) ( not ( = ?AUTO_186 ?AUTO_188 ) ) ( not ( = ?AUTO_187 ?AUTO_188 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_182 ?AUTO_188 ?AUTO_184 )
      ( DELIVER-PKG ?AUTO_180 ?AUTO_181 )
      ( DELIVER-PKG-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_191 - OBJ
      ?AUTO_192 - LOCATION
    )
    :vars
    (
      ?AUTO_193 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_193 ?AUTO_192 ) ( IN-TRUCK ?AUTO_191 ?AUTO_193 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_191 ?AUTO_193 ?AUTO_192 )
      ( DELIVER-PKG-VERIFY ?AUTO_191 ?AUTO_192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_194 - OBJ
      ?AUTO_195 - LOCATION
    )
    :vars
    (
      ?AUTO_196 - TRUCK
      ?AUTO_197 - LOCATION
      ?AUTO_198 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_194 ?AUTO_196 ) ( TRUCK-AT ?AUTO_196 ?AUTO_197 ) ( IN-CITY ?AUTO_197 ?AUTO_198 ) ( IN-CITY ?AUTO_195 ?AUTO_198 ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_196 ?AUTO_197 ?AUTO_195 ?AUTO_198 )
      ( DELIVER-PKG ?AUTO_194 ?AUTO_195 )
      ( DELIVER-PKG-VERIFY ?AUTO_194 ?AUTO_195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_199 - OBJ
      ?AUTO_200 - LOCATION
    )
    :vars
    (
      ?AUTO_201 - TRUCK
      ?AUTO_202 - LOCATION
      ?AUTO_203 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_201 ?AUTO_202 ) ( IN-CITY ?AUTO_202 ?AUTO_203 ) ( IN-CITY ?AUTO_200 ?AUTO_203 ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( OBJ-AT ?AUTO_199 ?AUTO_202 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_199 ?AUTO_201 ?AUTO_202 )
      ( DELIVER-PKG ?AUTO_199 ?AUTO_200 )
      ( DELIVER-PKG-VERIFY ?AUTO_199 ?AUTO_200 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_204 - OBJ
      ?AUTO_205 - LOCATION
    )
    :vars
    (
      ?AUTO_206 - LOCATION
      ?AUTO_208 - CITY
      ?AUTO_207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_206 ?AUTO_208 ) ( IN-CITY ?AUTO_205 ?AUTO_208 ) ( not ( = ?AUTO_205 ?AUTO_206 ) ) ( OBJ-AT ?AUTO_204 ?AUTO_206 ) ( TRUCK-AT ?AUTO_207 ?AUTO_205 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_207 ?AUTO_205 ?AUTO_206 ?AUTO_208 )
      ( DELIVER-PKG ?AUTO_204 ?AUTO_205 )
      ( DELIVER-PKG-VERIFY ?AUTO_204 ?AUTO_205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_217 - LOCATION
      ?AUTO_218 - CITY
      ?AUTO_219 - TRUCK
      ?AUTO_220 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_217 ?AUTO_218 ) ( IN-CITY ?AUTO_216 ?AUTO_218 ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( TRUCK-AT ?AUTO_219 ?AUTO_216 ) ( IN-AIRPLANE ?AUTO_215 ?AUTO_220 ) ( AIRPLANE-AT ?AUTO_220 ?AUTO_217 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_215 ?AUTO_220 ?AUTO_217 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_221 - OBJ
      ?AUTO_222 - LOCATION
    )
    :vars
    (
      ?AUTO_225 - LOCATION
      ?AUTO_223 - CITY
      ?AUTO_224 - TRUCK
      ?AUTO_226 - AIRPLANE
      ?AUTO_227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_225 ?AUTO_223 ) ( IN-CITY ?AUTO_222 ?AUTO_223 ) ( not ( = ?AUTO_222 ?AUTO_225 ) ) ( TRUCK-AT ?AUTO_224 ?AUTO_222 ) ( IN-AIRPLANE ?AUTO_221 ?AUTO_226 ) ( AIRPORT ?AUTO_227 ) ( AIRPORT ?AUTO_225 ) ( AIRPLANE-AT ?AUTO_226 ?AUTO_227 ) ( not ( = ?AUTO_227 ?AUTO_225 ) ) ( not ( = ?AUTO_222 ?AUTO_227 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_226 ?AUTO_227 ?AUTO_225 )
      ( DELIVER-PKG ?AUTO_221 ?AUTO_222 )
      ( DELIVER-PKG-VERIFY ?AUTO_221 ?AUTO_222 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_232 - OBJ
      ?AUTO_233 - LOCATION
    )
    :vars
    (
      ?AUTO_236 - LOCATION
      ?AUTO_237 - CITY
      ?AUTO_234 - TRUCK
      ?AUTO_238 - LOCATION
      ?AUTO_235 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_236 ?AUTO_237 ) ( IN-CITY ?AUTO_233 ?AUTO_237 ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) ( TRUCK-AT ?AUTO_234 ?AUTO_233 ) ( AIRPORT ?AUTO_238 ) ( AIRPORT ?AUTO_236 ) ( AIRPLANE-AT ?AUTO_235 ?AUTO_238 ) ( not ( = ?AUTO_238 ?AUTO_236 ) ) ( not ( = ?AUTO_233 ?AUTO_238 ) ) ( OBJ-AT ?AUTO_232 ?AUTO_238 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_232 ?AUTO_235 ?AUTO_238 )
      ( DELIVER-PKG ?AUTO_232 ?AUTO_233 )
      ( DELIVER-PKG-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_241 - OBJ
      ?AUTO_242 - LOCATION
    )
    :vars
    (
      ?AUTO_244 - LOCATION
      ?AUTO_245 - CITY
      ?AUTO_246 - TRUCK
      ?AUTO_243 - LOCATION
      ?AUTO_248 - LOCATION
      ?AUTO_247 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_244 ?AUTO_245 ) ( IN-CITY ?AUTO_242 ?AUTO_245 ) ( not ( = ?AUTO_242 ?AUTO_244 ) ) ( TRUCK-AT ?AUTO_246 ?AUTO_242 ) ( AIRPORT ?AUTO_243 ) ( AIRPORT ?AUTO_244 ) ( not ( = ?AUTO_243 ?AUTO_244 ) ) ( not ( = ?AUTO_242 ?AUTO_243 ) ) ( OBJ-AT ?AUTO_241 ?AUTO_243 ) ( AIRPORT ?AUTO_248 ) ( AIRPLANE-AT ?AUTO_247 ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_243 ) ) ( not ( = ?AUTO_242 ?AUTO_248 ) ) ( not ( = ?AUTO_244 ?AUTO_248 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_247 ?AUTO_248 ?AUTO_243 )
      ( DELIVER-PKG ?AUTO_241 ?AUTO_242 )
      ( DELIVER-PKG-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_249 - OBJ
      ?AUTO_250 - LOCATION
    )
    :vars
    (
      ?AUTO_252 - LOCATION
      ?AUTO_255 - CITY
      ?AUTO_254 - TRUCK
      ?AUTO_251 - LOCATION
      ?AUTO_256 - LOCATION
      ?AUTO_253 - AIRPLANE
      ?AUTO_257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_252 ?AUTO_255 ) ( IN-CITY ?AUTO_250 ?AUTO_255 ) ( not ( = ?AUTO_250 ?AUTO_252 ) ) ( TRUCK-AT ?AUTO_254 ?AUTO_250 ) ( AIRPORT ?AUTO_251 ) ( AIRPORT ?AUTO_252 ) ( not ( = ?AUTO_251 ?AUTO_252 ) ) ( not ( = ?AUTO_250 ?AUTO_251 ) ) ( AIRPORT ?AUTO_256 ) ( AIRPLANE-AT ?AUTO_253 ?AUTO_256 ) ( not ( = ?AUTO_256 ?AUTO_251 ) ) ( not ( = ?AUTO_250 ?AUTO_256 ) ) ( not ( = ?AUTO_252 ?AUTO_256 ) ) ( TRUCK-AT ?AUTO_257 ?AUTO_251 ) ( IN-TRUCK ?AUTO_249 ?AUTO_257 ) ( not ( = ?AUTO_254 ?AUTO_257 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_249 ?AUTO_257 ?AUTO_251 )
      ( DELIVER-PKG ?AUTO_249 ?AUTO_250 )
      ( DELIVER-PKG-VERIFY ?AUTO_249 ?AUTO_250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_258 - OBJ
      ?AUTO_259 - LOCATION
    )
    :vars
    (
      ?AUTO_261 - LOCATION
      ?AUTO_263 - CITY
      ?AUTO_265 - TRUCK
      ?AUTO_262 - LOCATION
      ?AUTO_260 - LOCATION
      ?AUTO_266 - AIRPLANE
      ?AUTO_264 - TRUCK
      ?AUTO_267 - LOCATION
      ?AUTO_268 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_261 ?AUTO_263 ) ( IN-CITY ?AUTO_259 ?AUTO_263 ) ( not ( = ?AUTO_259 ?AUTO_261 ) ) ( TRUCK-AT ?AUTO_265 ?AUTO_259 ) ( AIRPORT ?AUTO_262 ) ( AIRPORT ?AUTO_261 ) ( not ( = ?AUTO_262 ?AUTO_261 ) ) ( not ( = ?AUTO_259 ?AUTO_262 ) ) ( AIRPORT ?AUTO_260 ) ( AIRPLANE-AT ?AUTO_266 ?AUTO_260 ) ( not ( = ?AUTO_260 ?AUTO_262 ) ) ( not ( = ?AUTO_259 ?AUTO_260 ) ) ( not ( = ?AUTO_261 ?AUTO_260 ) ) ( IN-TRUCK ?AUTO_258 ?AUTO_264 ) ( not ( = ?AUTO_265 ?AUTO_264 ) ) ( TRUCK-AT ?AUTO_264 ?AUTO_267 ) ( IN-CITY ?AUTO_267 ?AUTO_268 ) ( IN-CITY ?AUTO_262 ?AUTO_268 ) ( not ( = ?AUTO_262 ?AUTO_267 ) ) ( not ( = ?AUTO_259 ?AUTO_267 ) ) ( not ( = ?AUTO_261 ?AUTO_267 ) ) ( not ( = ?AUTO_263 ?AUTO_268 ) ) ( not ( = ?AUTO_260 ?AUTO_267 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_264 ?AUTO_267 ?AUTO_262 ?AUTO_268 )
      ( DELIVER-PKG ?AUTO_258 ?AUTO_259 )
      ( DELIVER-PKG-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_269 - OBJ
      ?AUTO_270 - LOCATION
    )
    :vars
    (
      ?AUTO_274 - LOCATION
      ?AUTO_276 - CITY
      ?AUTO_275 - TRUCK
      ?AUTO_271 - LOCATION
      ?AUTO_273 - LOCATION
      ?AUTO_277 - AIRPLANE
      ?AUTO_272 - TRUCK
      ?AUTO_278 - LOCATION
      ?AUTO_279 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_274 ?AUTO_276 ) ( IN-CITY ?AUTO_270 ?AUTO_276 ) ( not ( = ?AUTO_270 ?AUTO_274 ) ) ( TRUCK-AT ?AUTO_275 ?AUTO_270 ) ( AIRPORT ?AUTO_271 ) ( AIRPORT ?AUTO_274 ) ( not ( = ?AUTO_271 ?AUTO_274 ) ) ( not ( = ?AUTO_270 ?AUTO_271 ) ) ( AIRPORT ?AUTO_273 ) ( AIRPLANE-AT ?AUTO_277 ?AUTO_273 ) ( not ( = ?AUTO_273 ?AUTO_271 ) ) ( not ( = ?AUTO_270 ?AUTO_273 ) ) ( not ( = ?AUTO_274 ?AUTO_273 ) ) ( not ( = ?AUTO_275 ?AUTO_272 ) ) ( TRUCK-AT ?AUTO_272 ?AUTO_278 ) ( IN-CITY ?AUTO_278 ?AUTO_279 ) ( IN-CITY ?AUTO_271 ?AUTO_279 ) ( not ( = ?AUTO_271 ?AUTO_278 ) ) ( not ( = ?AUTO_270 ?AUTO_278 ) ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( not ( = ?AUTO_273 ?AUTO_278 ) ) ( OBJ-AT ?AUTO_269 ?AUTO_278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_269 ?AUTO_272 ?AUTO_278 )
      ( DELIVER-PKG ?AUTO_269 ?AUTO_270 )
      ( DELIVER-PKG-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_280 - OBJ
      ?AUTO_281 - LOCATION
    )
    :vars
    (
      ?AUTO_286 - LOCATION
      ?AUTO_290 - CITY
      ?AUTO_282 - TRUCK
      ?AUTO_285 - LOCATION
      ?AUTO_284 - LOCATION
      ?AUTO_289 - AIRPLANE
      ?AUTO_283 - TRUCK
      ?AUTO_288 - LOCATION
      ?AUTO_287 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_286 ?AUTO_290 ) ( IN-CITY ?AUTO_281 ?AUTO_290 ) ( not ( = ?AUTO_281 ?AUTO_286 ) ) ( TRUCK-AT ?AUTO_282 ?AUTO_281 ) ( AIRPORT ?AUTO_285 ) ( AIRPORT ?AUTO_286 ) ( not ( = ?AUTO_285 ?AUTO_286 ) ) ( not ( = ?AUTO_281 ?AUTO_285 ) ) ( AIRPORT ?AUTO_284 ) ( AIRPLANE-AT ?AUTO_289 ?AUTO_284 ) ( not ( = ?AUTO_284 ?AUTO_285 ) ) ( not ( = ?AUTO_281 ?AUTO_284 ) ) ( not ( = ?AUTO_286 ?AUTO_284 ) ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( IN-CITY ?AUTO_288 ?AUTO_287 ) ( IN-CITY ?AUTO_285 ?AUTO_287 ) ( not ( = ?AUTO_285 ?AUTO_288 ) ) ( not ( = ?AUTO_281 ?AUTO_288 ) ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_290 ?AUTO_287 ) ) ( not ( = ?AUTO_284 ?AUTO_288 ) ) ( OBJ-AT ?AUTO_280 ?AUTO_288 ) ( TRUCK-AT ?AUTO_283 ?AUTO_285 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_283 ?AUTO_285 ?AUTO_288 ?AUTO_287 )
      ( DELIVER-PKG ?AUTO_280 ?AUTO_281 )
      ( DELIVER-PKG-VERIFY ?AUTO_280 ?AUTO_281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_293 - OBJ
      ?AUTO_294 - LOCATION
    )
    :vars
    (
      ?AUTO_295 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_295 ?AUTO_294 ) ( IN-TRUCK ?AUTO_293 ?AUTO_295 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_293 ?AUTO_295 ?AUTO_294 )
      ( DELIVER-PKG-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_296 - OBJ
      ?AUTO_297 - LOCATION
    )
    :vars
    (
      ?AUTO_298 - TRUCK
      ?AUTO_299 - LOCATION
      ?AUTO_300 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_296 ?AUTO_298 ) ( TRUCK-AT ?AUTO_298 ?AUTO_299 ) ( IN-CITY ?AUTO_299 ?AUTO_300 ) ( IN-CITY ?AUTO_297 ?AUTO_300 ) ( not ( = ?AUTO_297 ?AUTO_299 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_298 ?AUTO_299 ?AUTO_297 ?AUTO_300 )
      ( DELIVER-PKG ?AUTO_296 ?AUTO_297 )
      ( DELIVER-PKG-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_301 - OBJ
      ?AUTO_302 - LOCATION
    )
    :vars
    (
      ?AUTO_303 - TRUCK
      ?AUTO_304 - LOCATION
      ?AUTO_305 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_303 ?AUTO_304 ) ( IN-CITY ?AUTO_304 ?AUTO_305 ) ( IN-CITY ?AUTO_302 ?AUTO_305 ) ( not ( = ?AUTO_302 ?AUTO_304 ) ) ( OBJ-AT ?AUTO_301 ?AUTO_304 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_301 ?AUTO_303 ?AUTO_304 )
      ( DELIVER-PKG ?AUTO_301 ?AUTO_302 )
      ( DELIVER-PKG-VERIFY ?AUTO_301 ?AUTO_302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_306 - OBJ
      ?AUTO_307 - LOCATION
    )
    :vars
    (
      ?AUTO_308 - LOCATION
      ?AUTO_310 - CITY
      ?AUTO_309 - TRUCK
      ?AUTO_311 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_308 ?AUTO_310 ) ( IN-CITY ?AUTO_307 ?AUTO_310 ) ( not ( = ?AUTO_307 ?AUTO_308 ) ) ( OBJ-AT ?AUTO_306 ?AUTO_308 ) ( TRUCK-AT ?AUTO_309 ?AUTO_311 ) ( IN-CITY ?AUTO_311 ?AUTO_310 ) ( not ( = ?AUTO_308 ?AUTO_311 ) ) ( not ( = ?AUTO_307 ?AUTO_311 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_309 ?AUTO_311 ?AUTO_308 ?AUTO_310 )
      ( DELIVER-PKG ?AUTO_306 ?AUTO_307 )
      ( DELIVER-PKG-VERIFY ?AUTO_306 ?AUTO_307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_314 - OBJ
      ?AUTO_315 - LOCATION
    )
    :vars
    (
      ?AUTO_316 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_314 ?AUTO_316 ) ( AIRPLANE-AT ?AUTO_316 ?AUTO_315 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_314 ?AUTO_316 ?AUTO_315 )
      ( DELIVER-PKG-VERIFY ?AUTO_314 ?AUTO_315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_317 - OBJ
      ?AUTO_318 - LOCATION
    )
    :vars
    (
      ?AUTO_319 - AIRPLANE
      ?AUTO_320 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_317 ?AUTO_319 ) ( AIRPORT ?AUTO_320 ) ( AIRPORT ?AUTO_318 ) ( AIRPLANE-AT ?AUTO_319 ?AUTO_320 ) ( not ( = ?AUTO_320 ?AUTO_318 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_319 ?AUTO_320 ?AUTO_318 )
      ( DELIVER-PKG ?AUTO_317 ?AUTO_318 )
      ( DELIVER-PKG-VERIFY ?AUTO_317 ?AUTO_318 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_323 - OBJ
      ?AUTO_324 - LOCATION
    )
    :vars
    (
      ?AUTO_326 - LOCATION
      ?AUTO_325 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_326 ) ( AIRPORT ?AUTO_324 ) ( AIRPLANE-AT ?AUTO_325 ?AUTO_326 ) ( not ( = ?AUTO_326 ?AUTO_324 ) ) ( OBJ-AT ?AUTO_323 ?AUTO_326 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_323 ?AUTO_325 ?AUTO_326 )
      ( DELIVER-PKG ?AUTO_323 ?AUTO_324 )
      ( DELIVER-PKG-VERIFY ?AUTO_323 ?AUTO_324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_327 - OBJ
      ?AUTO_328 - LOCATION
    )
    :vars
    (
      ?AUTO_330 - LOCATION
      ?AUTO_331 - LOCATION
      ?AUTO_329 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_330 ) ( AIRPORT ?AUTO_328 ) ( not ( = ?AUTO_330 ?AUTO_328 ) ) ( OBJ-AT ?AUTO_327 ?AUTO_330 ) ( AIRPORT ?AUTO_331 ) ( AIRPLANE-AT ?AUTO_329 ?AUTO_331 ) ( not ( = ?AUTO_331 ?AUTO_330 ) ) ( not ( = ?AUTO_328 ?AUTO_331 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_329 ?AUTO_331 ?AUTO_330 )
      ( DELIVER-PKG ?AUTO_327 ?AUTO_328 )
      ( DELIVER-PKG-VERIFY ?AUTO_327 ?AUTO_328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_354 - OBJ
      ?AUTO_355 - LOCATION
    )
    :vars
    (
      ?AUTO_356 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_354 ?AUTO_356 ) ( AIRPLANE-AT ?AUTO_356 ?AUTO_355 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_354 ?AUTO_356 ?AUTO_355 )
      ( DELIVER-PKG-VERIFY ?AUTO_354 ?AUTO_355 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_357 - OBJ
      ?AUTO_358 - LOCATION
    )
    :vars
    (
      ?AUTO_359 - AIRPLANE
      ?AUTO_360 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_357 ?AUTO_359 ) ( AIRPORT ?AUTO_360 ) ( AIRPORT ?AUTO_358 ) ( AIRPLANE-AT ?AUTO_359 ?AUTO_360 ) ( not ( = ?AUTO_360 ?AUTO_358 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_359 ?AUTO_360 ?AUTO_358 )
      ( DELIVER-PKG ?AUTO_357 ?AUTO_358 )
      ( DELIVER-PKG-VERIFY ?AUTO_357 ?AUTO_358 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_387 - OBJ
      ?AUTO_388 - LOCATION
    )
    :vars
    (
      ?AUTO_391 - LOCATION
      ?AUTO_389 - LOCATION
      ?AUTO_390 - AIRPLANE
      ?AUTO_392 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_391 ) ( AIRPORT ?AUTO_388 ) ( not ( = ?AUTO_391 ?AUTO_388 ) ) ( AIRPORT ?AUTO_389 ) ( AIRPLANE-AT ?AUTO_390 ?AUTO_389 ) ( not ( = ?AUTO_389 ?AUTO_391 ) ) ( not ( = ?AUTO_388 ?AUTO_389 ) ) ( TRUCK-AT ?AUTO_392 ?AUTO_391 ) ( IN-TRUCK ?AUTO_387 ?AUTO_392 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_387 ?AUTO_392 ?AUTO_391 )
      ( DELIVER-PKG ?AUTO_387 ?AUTO_388 )
      ( DELIVER-PKG-VERIFY ?AUTO_387 ?AUTO_388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_393 - OBJ
      ?AUTO_394 - LOCATION
    )
    :vars
    (
      ?AUTO_397 - LOCATION
      ?AUTO_396 - LOCATION
      ?AUTO_395 - AIRPLANE
      ?AUTO_398 - TRUCK
      ?AUTO_399 - LOCATION
      ?AUTO_400 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_397 ) ( AIRPORT ?AUTO_394 ) ( not ( = ?AUTO_397 ?AUTO_394 ) ) ( AIRPORT ?AUTO_396 ) ( AIRPLANE-AT ?AUTO_395 ?AUTO_396 ) ( not ( = ?AUTO_396 ?AUTO_397 ) ) ( not ( = ?AUTO_394 ?AUTO_396 ) ) ( IN-TRUCK ?AUTO_393 ?AUTO_398 ) ( TRUCK-AT ?AUTO_398 ?AUTO_399 ) ( IN-CITY ?AUTO_399 ?AUTO_400 ) ( IN-CITY ?AUTO_397 ?AUTO_400 ) ( not ( = ?AUTO_397 ?AUTO_399 ) ) ( not ( = ?AUTO_394 ?AUTO_399 ) ) ( not ( = ?AUTO_396 ?AUTO_399 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_398 ?AUTO_399 ?AUTO_397 ?AUTO_400 )
      ( DELIVER-PKG ?AUTO_393 ?AUTO_394 )
      ( DELIVER-PKG-VERIFY ?AUTO_393 ?AUTO_394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_401 - OBJ
      ?AUTO_402 - LOCATION
    )
    :vars
    (
      ?AUTO_408 - LOCATION
      ?AUTO_405 - LOCATION
      ?AUTO_403 - AIRPLANE
      ?AUTO_404 - TRUCK
      ?AUTO_407 - LOCATION
      ?AUTO_406 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_408 ) ( AIRPORT ?AUTO_402 ) ( not ( = ?AUTO_408 ?AUTO_402 ) ) ( AIRPORT ?AUTO_405 ) ( AIRPLANE-AT ?AUTO_403 ?AUTO_405 ) ( not ( = ?AUTO_405 ?AUTO_408 ) ) ( not ( = ?AUTO_402 ?AUTO_405 ) ) ( TRUCK-AT ?AUTO_404 ?AUTO_407 ) ( IN-CITY ?AUTO_407 ?AUTO_406 ) ( IN-CITY ?AUTO_408 ?AUTO_406 ) ( not ( = ?AUTO_408 ?AUTO_407 ) ) ( not ( = ?AUTO_402 ?AUTO_407 ) ) ( not ( = ?AUTO_405 ?AUTO_407 ) ) ( OBJ-AT ?AUTO_401 ?AUTO_407 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_401 ?AUTO_404 ?AUTO_407 )
      ( DELIVER-PKG ?AUTO_401 ?AUTO_402 )
      ( DELIVER-PKG-VERIFY ?AUTO_401 ?AUTO_402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_409 - OBJ
      ?AUTO_410 - LOCATION
    )
    :vars
    (
      ?AUTO_414 - LOCATION
      ?AUTO_415 - LOCATION
      ?AUTO_412 - AIRPLANE
      ?AUTO_413 - LOCATION
      ?AUTO_416 - CITY
      ?AUTO_411 - TRUCK
      ?AUTO_417 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_414 ) ( AIRPORT ?AUTO_410 ) ( not ( = ?AUTO_414 ?AUTO_410 ) ) ( AIRPORT ?AUTO_415 ) ( AIRPLANE-AT ?AUTO_412 ?AUTO_415 ) ( not ( = ?AUTO_415 ?AUTO_414 ) ) ( not ( = ?AUTO_410 ?AUTO_415 ) ) ( IN-CITY ?AUTO_413 ?AUTO_416 ) ( IN-CITY ?AUTO_414 ?AUTO_416 ) ( not ( = ?AUTO_414 ?AUTO_413 ) ) ( not ( = ?AUTO_410 ?AUTO_413 ) ) ( not ( = ?AUTO_415 ?AUTO_413 ) ) ( OBJ-AT ?AUTO_409 ?AUTO_413 ) ( TRUCK-AT ?AUTO_411 ?AUTO_417 ) ( IN-CITY ?AUTO_417 ?AUTO_416 ) ( not ( = ?AUTO_413 ?AUTO_417 ) ) ( not ( = ?AUTO_410 ?AUTO_417 ) ) ( not ( = ?AUTO_414 ?AUTO_417 ) ) ( not ( = ?AUTO_415 ?AUTO_417 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_411 ?AUTO_417 ?AUTO_413 ?AUTO_416 )
      ( DELIVER-PKG ?AUTO_409 ?AUTO_410 )
      ( DELIVER-PKG-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_420 - OBJ
      ?AUTO_421 - LOCATION
    )
    :vars
    (
      ?AUTO_422 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_420 ?AUTO_422 ) ( AIRPLANE-AT ?AUTO_422 ?AUTO_421 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_420 ?AUTO_422 ?AUTO_421 )
      ( DELIVER-PKG-VERIFY ?AUTO_420 ?AUTO_421 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_463 - OBJ
      ?AUTO_464 - LOCATION
    )
    :vars
    (
      ?AUTO_465 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_463 ?AUTO_465 ) ( AIRPLANE-AT ?AUTO_465 ?AUTO_464 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_463 ?AUTO_465 ?AUTO_464 )
      ( DELIVER-PKG-VERIFY ?AUTO_463 ?AUTO_464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_508 - OBJ
      ?AUTO_509 - LOCATION
    )
    :vars
    (
      ?AUTO_510 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_508 ?AUTO_510 ) ( AIRPLANE-AT ?AUTO_510 ?AUTO_509 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_508 ?AUTO_510 ?AUTO_509 )
      ( DELIVER-PKG-VERIFY ?AUTO_508 ?AUTO_509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_555 - OBJ
      ?AUTO_556 - LOCATION
    )
    :vars
    (
      ?AUTO_557 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_555 ?AUTO_557 ) ( AIRPLANE-AT ?AUTO_557 ?AUTO_556 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_555 ?AUTO_557 ?AUTO_556 )
      ( DELIVER-PKG-VERIFY ?AUTO_555 ?AUTO_556 ) )
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
      ?AUTO_578 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_579 ) ( AIRPORT ?AUTO_577 ) ( AIRPLANE-AT ?AUTO_578 ?AUTO_579 ) ( not ( = ?AUTO_579 ?AUTO_577 ) ) ( OBJ-AT ?AUTO_576 ?AUTO_579 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_576 ?AUTO_578 ?AUTO_579 )
      ( DELIVER-PKG ?AUTO_576 ?AUTO_577 )
      ( DELIVER-PKG-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_606 - OBJ
      ?AUTO_607 - LOCATION
    )
    :vars
    (
      ?AUTO_608 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_608 ?AUTO_607 ) ( IN-TRUCK ?AUTO_606 ?AUTO_608 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_606 ?AUTO_608 ?AUTO_607 )
      ( DELIVER-PKG-VERIFY ?AUTO_606 ?AUTO_607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_623 - OBJ
      ?AUTO_624 - LOCATION
    )
    :vars
    (
      ?AUTO_625 - TRUCK
      ?AUTO_626 - LOCATION
      ?AUTO_627 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_623 ?AUTO_625 ) ( TRUCK-AT ?AUTO_625 ?AUTO_626 ) ( IN-CITY ?AUTO_626 ?AUTO_627 ) ( IN-CITY ?AUTO_624 ?AUTO_627 ) ( not ( = ?AUTO_624 ?AUTO_626 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_625 ?AUTO_626 ?AUTO_624 ?AUTO_627 )
      ( DELIVER-PKG ?AUTO_623 ?AUTO_624 )
      ( DELIVER-PKG-VERIFY ?AUTO_623 ?AUTO_624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_628 - OBJ
      ?AUTO_629 - LOCATION
    )
    :vars
    (
      ?AUTO_630 - TRUCK
      ?AUTO_631 - LOCATION
      ?AUTO_632 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_630 ?AUTO_631 ) ( IN-CITY ?AUTO_631 ?AUTO_632 ) ( IN-CITY ?AUTO_629 ?AUTO_632 ) ( not ( = ?AUTO_629 ?AUTO_631 ) ) ( OBJ-AT ?AUTO_628 ?AUTO_631 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_628 ?AUTO_630 ?AUTO_631 )
      ( DELIVER-PKG ?AUTO_628 ?AUTO_629 )
      ( DELIVER-PKG-VERIFY ?AUTO_628 ?AUTO_629 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_633 - OBJ
      ?AUTO_634 - LOCATION
    )
    :vars
    (
      ?AUTO_636 - TRUCK
      ?AUTO_635 - LOCATION
      ?AUTO_637 - CITY
      ?AUTO_638 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_636 ?AUTO_635 ) ( IN-CITY ?AUTO_635 ?AUTO_637 ) ( IN-CITY ?AUTO_634 ?AUTO_637 ) ( not ( = ?AUTO_634 ?AUTO_635 ) ) ( IN-AIRPLANE ?AUTO_633 ?AUTO_638 ) ( AIRPLANE-AT ?AUTO_638 ?AUTO_635 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_633 ?AUTO_638 ?AUTO_635 )
      ( DELIVER-PKG ?AUTO_633 ?AUTO_634 )
      ( DELIVER-PKG-VERIFY ?AUTO_633 ?AUTO_634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_639 - OBJ
      ?AUTO_640 - LOCATION
    )
    :vars
    (
      ?AUTO_643 - TRUCK
      ?AUTO_641 - LOCATION
      ?AUTO_642 - CITY
      ?AUTO_644 - AIRPLANE
      ?AUTO_645 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_643 ?AUTO_641 ) ( IN-CITY ?AUTO_641 ?AUTO_642 ) ( IN-CITY ?AUTO_640 ?AUTO_642 ) ( not ( = ?AUTO_640 ?AUTO_641 ) ) ( IN-AIRPLANE ?AUTO_639 ?AUTO_644 ) ( AIRPORT ?AUTO_645 ) ( AIRPORT ?AUTO_641 ) ( AIRPLANE-AT ?AUTO_644 ?AUTO_645 ) ( not ( = ?AUTO_645 ?AUTO_641 ) ) ( not ( = ?AUTO_640 ?AUTO_645 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_644 ?AUTO_645 ?AUTO_641 )
      ( DELIVER-PKG ?AUTO_639 ?AUTO_640 )
      ( DELIVER-PKG-VERIFY ?AUTO_639 ?AUTO_640 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_648 - OBJ
      ?AUTO_649 - LOCATION
    )
    :vars
    (
      ?AUTO_650 - TRUCK
      ?AUTO_654 - LOCATION
      ?AUTO_653 - CITY
      ?AUTO_651 - LOCATION
      ?AUTO_652 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_650 ?AUTO_654 ) ( IN-CITY ?AUTO_654 ?AUTO_653 ) ( IN-CITY ?AUTO_649 ?AUTO_653 ) ( not ( = ?AUTO_649 ?AUTO_654 ) ) ( AIRPORT ?AUTO_651 ) ( AIRPORT ?AUTO_654 ) ( AIRPLANE-AT ?AUTO_652 ?AUTO_651 ) ( not ( = ?AUTO_651 ?AUTO_654 ) ) ( not ( = ?AUTO_649 ?AUTO_651 ) ) ( OBJ-AT ?AUTO_648 ?AUTO_651 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_648 ?AUTO_652 ?AUTO_651 )
      ( DELIVER-PKG ?AUTO_648 ?AUTO_649 )
      ( DELIVER-PKG-VERIFY ?AUTO_648 ?AUTO_649 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_655 - OBJ
      ?AUTO_656 - LOCATION
    )
    :vars
    (
      ?AUTO_657 - TRUCK
      ?AUTO_659 - LOCATION
      ?AUTO_661 - CITY
      ?AUTO_660 - LOCATION
      ?AUTO_662 - LOCATION
      ?AUTO_658 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_657 ?AUTO_659 ) ( IN-CITY ?AUTO_659 ?AUTO_661 ) ( IN-CITY ?AUTO_656 ?AUTO_661 ) ( not ( = ?AUTO_656 ?AUTO_659 ) ) ( AIRPORT ?AUTO_660 ) ( AIRPORT ?AUTO_659 ) ( not ( = ?AUTO_660 ?AUTO_659 ) ) ( not ( = ?AUTO_656 ?AUTO_660 ) ) ( OBJ-AT ?AUTO_655 ?AUTO_660 ) ( AIRPORT ?AUTO_662 ) ( AIRPLANE-AT ?AUTO_658 ?AUTO_662 ) ( not ( = ?AUTO_662 ?AUTO_660 ) ) ( not ( = ?AUTO_656 ?AUTO_662 ) ) ( not ( = ?AUTO_659 ?AUTO_662 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_658 ?AUTO_662 ?AUTO_660 )
      ( DELIVER-PKG ?AUTO_655 ?AUTO_656 )
      ( DELIVER-PKG-VERIFY ?AUTO_655 ?AUTO_656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_685 - OBJ
      ?AUTO_686 - LOCATION
    )
    :vars
    (
      ?AUTO_687 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_685 ?AUTO_687 ) ( AIRPLANE-AT ?AUTO_687 ?AUTO_686 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_685 ?AUTO_687 ?AUTO_686 )
      ( DELIVER-PKG-VERIFY ?AUTO_685 ?AUTO_686 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_740 - OBJ
      ?AUTO_741 - LOCATION
    )
    :vars
    (
      ?AUTO_742 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_740 ?AUTO_742 ) ( AIRPLANE-AT ?AUTO_742 ?AUTO_741 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_740 ?AUTO_742 ?AUTO_741 )
      ( DELIVER-PKG-VERIFY ?AUTO_740 ?AUTO_741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_743 - OBJ
      ?AUTO_744 - LOCATION
    )
    :vars
    (
      ?AUTO_745 - AIRPLANE
      ?AUTO_746 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_743 ?AUTO_745 ) ( AIRPORT ?AUTO_746 ) ( AIRPORT ?AUTO_744 ) ( AIRPLANE-AT ?AUTO_745 ?AUTO_746 ) ( not ( = ?AUTO_746 ?AUTO_744 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_745 ?AUTO_746 ?AUTO_744 )
      ( DELIVER-PKG ?AUTO_743 ?AUTO_744 )
      ( DELIVER-PKG-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_751 - OBJ
      ?AUTO_752 - LOCATION
    )
    :vars
    (
      ?AUTO_753 - LOCATION
      ?AUTO_754 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_753 ) ( AIRPORT ?AUTO_752 ) ( AIRPLANE-AT ?AUTO_754 ?AUTO_753 ) ( not ( = ?AUTO_753 ?AUTO_752 ) ) ( OBJ-AT ?AUTO_751 ?AUTO_753 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_751 ?AUTO_754 ?AUTO_753 )
      ( DELIVER-PKG ?AUTO_751 ?AUTO_752 )
      ( DELIVER-PKG-VERIFY ?AUTO_751 ?AUTO_752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_765 - OBJ
      ?AUTO_766 - LOCATION
    )
    :vars
    (
      ?AUTO_767 - LOCATION
      ?AUTO_769 - LOCATION
      ?AUTO_768 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_767 ) ( AIRPORT ?AUTO_766 ) ( not ( = ?AUTO_767 ?AUTO_766 ) ) ( OBJ-AT ?AUTO_765 ?AUTO_767 ) ( AIRPORT ?AUTO_769 ) ( AIRPLANE-AT ?AUTO_768 ?AUTO_769 ) ( not ( = ?AUTO_769 ?AUTO_767 ) ) ( not ( = ?AUTO_766 ?AUTO_769 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_768 ?AUTO_769 ?AUTO_767 )
      ( DELIVER-PKG ?AUTO_765 ?AUTO_766 )
      ( DELIVER-PKG-VERIFY ?AUTO_765 ?AUTO_766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_806 - OBJ
      ?AUTO_807 - LOCATION
    )
    :vars
    (
      ?AUTO_808 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_808 ?AUTO_807 ) ( IN-TRUCK ?AUTO_806 ?AUTO_808 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_806 ?AUTO_808 ?AUTO_807 )
      ( DELIVER-PKG-VERIFY ?AUTO_806 ?AUTO_807 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_809 - OBJ
      ?AUTO_810 - LOCATION
    )
    :vars
    (
      ?AUTO_811 - TRUCK
      ?AUTO_812 - LOCATION
      ?AUTO_813 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_809 ?AUTO_811 ) ( TRUCK-AT ?AUTO_811 ?AUTO_812 ) ( IN-CITY ?AUTO_812 ?AUTO_813 ) ( IN-CITY ?AUTO_810 ?AUTO_813 ) ( not ( = ?AUTO_810 ?AUTO_812 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_811 ?AUTO_812 ?AUTO_810 ?AUTO_813 )
      ( DELIVER-PKG ?AUTO_809 ?AUTO_810 )
      ( DELIVER-PKG-VERIFY ?AUTO_809 ?AUTO_810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_822 - OBJ
      ?AUTO_823 - LOCATION
    )
    :vars
    (
      ?AUTO_824 - TRUCK
      ?AUTO_825 - LOCATION
      ?AUTO_826 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_824 ?AUTO_825 ) ( IN-CITY ?AUTO_825 ?AUTO_826 ) ( IN-CITY ?AUTO_823 ?AUTO_826 ) ( not ( = ?AUTO_823 ?AUTO_825 ) ) ( OBJ-AT ?AUTO_822 ?AUTO_825 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_822 ?AUTO_824 ?AUTO_825 )
      ( DELIVER-PKG ?AUTO_822 ?AUTO_823 )
      ( DELIVER-PKG-VERIFY ?AUTO_822 ?AUTO_823 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_827 - OBJ
      ?AUTO_828 - LOCATION
    )
    :vars
    (
      ?AUTO_830 - LOCATION
      ?AUTO_831 - CITY
      ?AUTO_829 - TRUCK
      ?AUTO_832 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_830 ?AUTO_831 ) ( IN-CITY ?AUTO_828 ?AUTO_831 ) ( not ( = ?AUTO_828 ?AUTO_830 ) ) ( OBJ-AT ?AUTO_827 ?AUTO_830 ) ( TRUCK-AT ?AUTO_829 ?AUTO_832 ) ( IN-CITY ?AUTO_832 ?AUTO_831 ) ( not ( = ?AUTO_830 ?AUTO_832 ) ) ( not ( = ?AUTO_828 ?AUTO_832 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_829 ?AUTO_832 ?AUTO_830 ?AUTO_831 )
      ( DELIVER-PKG ?AUTO_827 ?AUTO_828 )
      ( DELIVER-PKG-VERIFY ?AUTO_827 ?AUTO_828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_851 - OBJ
      ?AUTO_852 - LOCATION
    )
    :vars
    (
      ?AUTO_854 - LOCATION
      ?AUTO_855 - CITY
      ?AUTO_856 - TRUCK
      ?AUTO_853 - LOCATION
      ?AUTO_857 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_854 ?AUTO_855 ) ( IN-CITY ?AUTO_852 ?AUTO_855 ) ( not ( = ?AUTO_852 ?AUTO_854 ) ) ( TRUCK-AT ?AUTO_856 ?AUTO_853 ) ( IN-CITY ?AUTO_853 ?AUTO_855 ) ( not ( = ?AUTO_854 ?AUTO_853 ) ) ( not ( = ?AUTO_852 ?AUTO_853 ) ) ( IN-AIRPLANE ?AUTO_851 ?AUTO_857 ) ( AIRPLANE-AT ?AUTO_857 ?AUTO_854 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_851 ?AUTO_857 ?AUTO_854 )
      ( DELIVER-PKG ?AUTO_851 ?AUTO_852 )
      ( DELIVER-PKG-VERIFY ?AUTO_851 ?AUTO_852 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_858 - OBJ
      ?AUTO_859 - LOCATION
    )
    :vars
    (
      ?AUTO_860 - LOCATION
      ?AUTO_863 - CITY
      ?AUTO_862 - TRUCK
      ?AUTO_861 - LOCATION
      ?AUTO_864 - AIRPLANE
      ?AUTO_865 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_860 ?AUTO_863 ) ( IN-CITY ?AUTO_859 ?AUTO_863 ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( TRUCK-AT ?AUTO_862 ?AUTO_861 ) ( IN-CITY ?AUTO_861 ?AUTO_863 ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( IN-AIRPLANE ?AUTO_858 ?AUTO_864 ) ( AIRPORT ?AUTO_865 ) ( AIRPORT ?AUTO_860 ) ( AIRPLANE-AT ?AUTO_864 ?AUTO_865 ) ( not ( = ?AUTO_865 ?AUTO_860 ) ) ( not ( = ?AUTO_859 ?AUTO_865 ) ) ( not ( = ?AUTO_861 ?AUTO_865 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_864 ?AUTO_865 ?AUTO_860 )
      ( DELIVER-PKG ?AUTO_858 ?AUTO_859 )
      ( DELIVER-PKG-VERIFY ?AUTO_858 ?AUTO_859 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_890 - OBJ
      ?AUTO_891 - LOCATION
    )
    :vars
    (
      ?AUTO_897 - LOCATION
      ?AUTO_893 - CITY
      ?AUTO_894 - TRUCK
      ?AUTO_896 - LOCATION
      ?AUTO_895 - LOCATION
      ?AUTO_892 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_897 ?AUTO_893 ) ( IN-CITY ?AUTO_891 ?AUTO_893 ) ( not ( = ?AUTO_891 ?AUTO_897 ) ) ( TRUCK-AT ?AUTO_894 ?AUTO_896 ) ( IN-CITY ?AUTO_896 ?AUTO_893 ) ( not ( = ?AUTO_897 ?AUTO_896 ) ) ( not ( = ?AUTO_891 ?AUTO_896 ) ) ( AIRPORT ?AUTO_895 ) ( AIRPORT ?AUTO_897 ) ( AIRPLANE-AT ?AUTO_892 ?AUTO_895 ) ( not ( = ?AUTO_895 ?AUTO_897 ) ) ( not ( = ?AUTO_891 ?AUTO_895 ) ) ( not ( = ?AUTO_896 ?AUTO_895 ) ) ( OBJ-AT ?AUTO_890 ?AUTO_895 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_890 ?AUTO_892 ?AUTO_895 )
      ( DELIVER-PKG ?AUTO_890 ?AUTO_891 )
      ( DELIVER-PKG-VERIFY ?AUTO_890 ?AUTO_891 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_898 - OBJ
      ?AUTO_899 - LOCATION
    )
    :vars
    (
      ?AUTO_901 - LOCATION
      ?AUTO_903 - CITY
      ?AUTO_902 - TRUCK
      ?AUTO_905 - LOCATION
      ?AUTO_904 - LOCATION
      ?AUTO_900 - AIRPLANE
      ?AUTO_906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_901 ?AUTO_903 ) ( IN-CITY ?AUTO_899 ?AUTO_903 ) ( not ( = ?AUTO_899 ?AUTO_901 ) ) ( TRUCK-AT ?AUTO_902 ?AUTO_905 ) ( IN-CITY ?AUTO_905 ?AUTO_903 ) ( not ( = ?AUTO_901 ?AUTO_905 ) ) ( not ( = ?AUTO_899 ?AUTO_905 ) ) ( AIRPORT ?AUTO_904 ) ( AIRPORT ?AUTO_901 ) ( AIRPLANE-AT ?AUTO_900 ?AUTO_904 ) ( not ( = ?AUTO_904 ?AUTO_901 ) ) ( not ( = ?AUTO_899 ?AUTO_904 ) ) ( not ( = ?AUTO_905 ?AUTO_904 ) ) ( TRUCK-AT ?AUTO_906 ?AUTO_904 ) ( IN-TRUCK ?AUTO_898 ?AUTO_906 ) ( not ( = ?AUTO_902 ?AUTO_906 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_898 ?AUTO_906 ?AUTO_904 )
      ( DELIVER-PKG ?AUTO_898 ?AUTO_899 )
      ( DELIVER-PKG-VERIFY ?AUTO_898 ?AUTO_899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_907 - OBJ
      ?AUTO_908 - LOCATION
    )
    :vars
    (
      ?AUTO_911 - LOCATION
      ?AUTO_912 - CITY
      ?AUTO_910 - TRUCK
      ?AUTO_914 - LOCATION
      ?AUTO_913 - LOCATION
      ?AUTO_909 - AIRPLANE
      ?AUTO_915 - TRUCK
      ?AUTO_916 - LOCATION
      ?AUTO_917 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_911 ?AUTO_912 ) ( IN-CITY ?AUTO_908 ?AUTO_912 ) ( not ( = ?AUTO_908 ?AUTO_911 ) ) ( TRUCK-AT ?AUTO_910 ?AUTO_914 ) ( IN-CITY ?AUTO_914 ?AUTO_912 ) ( not ( = ?AUTO_911 ?AUTO_914 ) ) ( not ( = ?AUTO_908 ?AUTO_914 ) ) ( AIRPORT ?AUTO_913 ) ( AIRPORT ?AUTO_911 ) ( AIRPLANE-AT ?AUTO_909 ?AUTO_913 ) ( not ( = ?AUTO_913 ?AUTO_911 ) ) ( not ( = ?AUTO_908 ?AUTO_913 ) ) ( not ( = ?AUTO_914 ?AUTO_913 ) ) ( IN-TRUCK ?AUTO_907 ?AUTO_915 ) ( not ( = ?AUTO_910 ?AUTO_915 ) ) ( TRUCK-AT ?AUTO_915 ?AUTO_916 ) ( IN-CITY ?AUTO_916 ?AUTO_917 ) ( IN-CITY ?AUTO_913 ?AUTO_917 ) ( not ( = ?AUTO_913 ?AUTO_916 ) ) ( not ( = ?AUTO_908 ?AUTO_916 ) ) ( not ( = ?AUTO_911 ?AUTO_916 ) ) ( not ( = ?AUTO_912 ?AUTO_917 ) ) ( not ( = ?AUTO_914 ?AUTO_916 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_915 ?AUTO_916 ?AUTO_913 ?AUTO_917 )
      ( DELIVER-PKG ?AUTO_907 ?AUTO_908 )
      ( DELIVER-PKG-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_918 - OBJ
      ?AUTO_919 - LOCATION
    )
    :vars
    (
      ?AUTO_926 - LOCATION
      ?AUTO_920 - CITY
      ?AUTO_923 - TRUCK
      ?AUTO_924 - LOCATION
      ?AUTO_921 - LOCATION
      ?AUTO_922 - AIRPLANE
      ?AUTO_928 - TRUCK
      ?AUTO_927 - LOCATION
      ?AUTO_925 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_926 ?AUTO_920 ) ( IN-CITY ?AUTO_919 ?AUTO_920 ) ( not ( = ?AUTO_919 ?AUTO_926 ) ) ( TRUCK-AT ?AUTO_923 ?AUTO_924 ) ( IN-CITY ?AUTO_924 ?AUTO_920 ) ( not ( = ?AUTO_926 ?AUTO_924 ) ) ( not ( = ?AUTO_919 ?AUTO_924 ) ) ( AIRPORT ?AUTO_921 ) ( AIRPORT ?AUTO_926 ) ( AIRPLANE-AT ?AUTO_922 ?AUTO_921 ) ( not ( = ?AUTO_921 ?AUTO_926 ) ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_924 ?AUTO_921 ) ) ( not ( = ?AUTO_923 ?AUTO_928 ) ) ( TRUCK-AT ?AUTO_928 ?AUTO_927 ) ( IN-CITY ?AUTO_927 ?AUTO_925 ) ( IN-CITY ?AUTO_921 ?AUTO_925 ) ( not ( = ?AUTO_921 ?AUTO_927 ) ) ( not ( = ?AUTO_919 ?AUTO_927 ) ) ( not ( = ?AUTO_926 ?AUTO_927 ) ) ( not ( = ?AUTO_920 ?AUTO_925 ) ) ( not ( = ?AUTO_924 ?AUTO_927 ) ) ( OBJ-AT ?AUTO_918 ?AUTO_927 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_918 ?AUTO_928 ?AUTO_927 )
      ( DELIVER-PKG ?AUTO_918 ?AUTO_919 )
      ( DELIVER-PKG-VERIFY ?AUTO_918 ?AUTO_919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_929 - OBJ
      ?AUTO_930 - LOCATION
    )
    :vars
    (
      ?AUTO_936 - LOCATION
      ?AUTO_937 - CITY
      ?AUTO_934 - TRUCK
      ?AUTO_935 - LOCATION
      ?AUTO_933 - LOCATION
      ?AUTO_932 - AIRPLANE
      ?AUTO_938 - TRUCK
      ?AUTO_939 - LOCATION
      ?AUTO_931 - CITY
      ?AUTO_940 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_936 ?AUTO_937 ) ( IN-CITY ?AUTO_930 ?AUTO_937 ) ( not ( = ?AUTO_930 ?AUTO_936 ) ) ( TRUCK-AT ?AUTO_934 ?AUTO_935 ) ( IN-CITY ?AUTO_935 ?AUTO_937 ) ( not ( = ?AUTO_936 ?AUTO_935 ) ) ( not ( = ?AUTO_930 ?AUTO_935 ) ) ( AIRPORT ?AUTO_933 ) ( AIRPORT ?AUTO_936 ) ( AIRPLANE-AT ?AUTO_932 ?AUTO_933 ) ( not ( = ?AUTO_933 ?AUTO_936 ) ) ( not ( = ?AUTO_930 ?AUTO_933 ) ) ( not ( = ?AUTO_935 ?AUTO_933 ) ) ( not ( = ?AUTO_934 ?AUTO_938 ) ) ( IN-CITY ?AUTO_939 ?AUTO_931 ) ( IN-CITY ?AUTO_933 ?AUTO_931 ) ( not ( = ?AUTO_933 ?AUTO_939 ) ) ( not ( = ?AUTO_930 ?AUTO_939 ) ) ( not ( = ?AUTO_936 ?AUTO_939 ) ) ( not ( = ?AUTO_937 ?AUTO_931 ) ) ( not ( = ?AUTO_935 ?AUTO_939 ) ) ( OBJ-AT ?AUTO_929 ?AUTO_939 ) ( TRUCK-AT ?AUTO_938 ?AUTO_940 ) ( IN-CITY ?AUTO_940 ?AUTO_931 ) ( not ( = ?AUTO_939 ?AUTO_940 ) ) ( not ( = ?AUTO_930 ?AUTO_940 ) ) ( not ( = ?AUTO_936 ?AUTO_940 ) ) ( not ( = ?AUTO_935 ?AUTO_940 ) ) ( not ( = ?AUTO_933 ?AUTO_940 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_938 ?AUTO_940 ?AUTO_939 ?AUTO_931 )
      ( DELIVER-PKG ?AUTO_929 ?AUTO_930 )
      ( DELIVER-PKG-VERIFY ?AUTO_929 ?AUTO_930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_943 - OBJ
      ?AUTO_944 - LOCATION
    )
    :vars
    (
      ?AUTO_945 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_945 ?AUTO_944 ) ( IN-TRUCK ?AUTO_943 ?AUTO_945 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_943 ?AUTO_945 ?AUTO_944 )
      ( DELIVER-PKG-VERIFY ?AUTO_943 ?AUTO_944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_946 - OBJ
      ?AUTO_947 - LOCATION
    )
    :vars
    (
      ?AUTO_948 - TRUCK
      ?AUTO_949 - LOCATION
      ?AUTO_950 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_946 ?AUTO_948 ) ( TRUCK-AT ?AUTO_948 ?AUTO_949 ) ( IN-CITY ?AUTO_949 ?AUTO_950 ) ( IN-CITY ?AUTO_947 ?AUTO_950 ) ( not ( = ?AUTO_947 ?AUTO_949 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_948 ?AUTO_949 ?AUTO_947 ?AUTO_950 )
      ( DELIVER-PKG ?AUTO_946 ?AUTO_947 )
      ( DELIVER-PKG-VERIFY ?AUTO_946 ?AUTO_947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_959 - OBJ
      ?AUTO_960 - LOCATION
    )
    :vars
    (
      ?AUTO_963 - TRUCK
      ?AUTO_961 - LOCATION
      ?AUTO_962 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_963 ?AUTO_961 ) ( IN-CITY ?AUTO_961 ?AUTO_962 ) ( IN-CITY ?AUTO_960 ?AUTO_962 ) ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( OBJ-AT ?AUTO_959 ?AUTO_961 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_959 ?AUTO_963 ?AUTO_961 )
      ( DELIVER-PKG ?AUTO_959 ?AUTO_960 )
      ( DELIVER-PKG-VERIFY ?AUTO_959 ?AUTO_960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_984 - OBJ
      ?AUTO_985 - LOCATION
    )
    :vars
    (
      ?AUTO_988 - LOCATION
      ?AUTO_989 - CITY
      ?AUTO_986 - TRUCK
      ?AUTO_987 - LOCATION
      ?AUTO_990 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_988 ?AUTO_989 ) ( IN-CITY ?AUTO_985 ?AUTO_989 ) ( not ( = ?AUTO_985 ?AUTO_988 ) ) ( TRUCK-AT ?AUTO_986 ?AUTO_987 ) ( IN-CITY ?AUTO_987 ?AUTO_989 ) ( not ( = ?AUTO_988 ?AUTO_987 ) ) ( not ( = ?AUTO_985 ?AUTO_987 ) ) ( IN-AIRPLANE ?AUTO_984 ?AUTO_990 ) ( AIRPLANE-AT ?AUTO_990 ?AUTO_988 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_984 ?AUTO_990 ?AUTO_988 )
      ( DELIVER-PKG ?AUTO_984 ?AUTO_985 )
      ( DELIVER-PKG-VERIFY ?AUTO_984 ?AUTO_985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1013 - OBJ
      ?AUTO_1014 - LOCATION
    )
    :vars
    (
      ?AUTO_1017 - LOCATION
      ?AUTO_1019 - CITY
      ?AUTO_1015 - TRUCK
      ?AUTO_1020 - LOCATION
      ?AUTO_1016 - LOCATION
      ?AUTO_1018 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1017 ?AUTO_1019 ) ( IN-CITY ?AUTO_1014 ?AUTO_1019 ) ( not ( = ?AUTO_1014 ?AUTO_1017 ) ) ( TRUCK-AT ?AUTO_1015 ?AUTO_1020 ) ( IN-CITY ?AUTO_1020 ?AUTO_1019 ) ( not ( = ?AUTO_1017 ?AUTO_1020 ) ) ( not ( = ?AUTO_1014 ?AUTO_1020 ) ) ( AIRPORT ?AUTO_1016 ) ( AIRPORT ?AUTO_1017 ) ( AIRPLANE-AT ?AUTO_1018 ?AUTO_1016 ) ( not ( = ?AUTO_1016 ?AUTO_1017 ) ) ( not ( = ?AUTO_1014 ?AUTO_1016 ) ) ( not ( = ?AUTO_1020 ?AUTO_1016 ) ) ( OBJ-AT ?AUTO_1013 ?AUTO_1016 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1013 ?AUTO_1018 ?AUTO_1016 )
      ( DELIVER-PKG ?AUTO_1013 ?AUTO_1014 )
      ( DELIVER-PKG-VERIFY ?AUTO_1013 ?AUTO_1014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1023 - OBJ
      ?AUTO_1024 - LOCATION
    )
    :vars
    (
      ?AUTO_1026 - LOCATION
      ?AUTO_1027 - CITY
      ?AUTO_1029 - TRUCK
      ?AUTO_1030 - LOCATION
      ?AUTO_1025 - LOCATION
      ?AUTO_1031 - LOCATION
      ?AUTO_1028 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1026 ?AUTO_1027 ) ( IN-CITY ?AUTO_1024 ?AUTO_1027 ) ( not ( = ?AUTO_1024 ?AUTO_1026 ) ) ( TRUCK-AT ?AUTO_1029 ?AUTO_1030 ) ( IN-CITY ?AUTO_1030 ?AUTO_1027 ) ( not ( = ?AUTO_1026 ?AUTO_1030 ) ) ( not ( = ?AUTO_1024 ?AUTO_1030 ) ) ( AIRPORT ?AUTO_1025 ) ( AIRPORT ?AUTO_1026 ) ( not ( = ?AUTO_1025 ?AUTO_1026 ) ) ( not ( = ?AUTO_1024 ?AUTO_1025 ) ) ( not ( = ?AUTO_1030 ?AUTO_1025 ) ) ( OBJ-AT ?AUTO_1023 ?AUTO_1025 ) ( AIRPORT ?AUTO_1031 ) ( AIRPLANE-AT ?AUTO_1028 ?AUTO_1031 ) ( not ( = ?AUTO_1031 ?AUTO_1025 ) ) ( not ( = ?AUTO_1024 ?AUTO_1031 ) ) ( not ( = ?AUTO_1026 ?AUTO_1031 ) ) ( not ( = ?AUTO_1030 ?AUTO_1031 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1028 ?AUTO_1031 ?AUTO_1025 )
      ( DELIVER-PKG ?AUTO_1023 ?AUTO_1024 )
      ( DELIVER-PKG-VERIFY ?AUTO_1023 ?AUTO_1024 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1046 - OBJ
      ?AUTO_1047 - LOCATION
    )
    :vars
    (
      ?AUTO_1048 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1048 ?AUTO_1047 ) ( IN-TRUCK ?AUTO_1046 ?AUTO_1048 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1046 ?AUTO_1048 ?AUTO_1047 )
      ( DELIVER-PKG-VERIFY ?AUTO_1046 ?AUTO_1047 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1049 - OBJ
      ?AUTO_1050 - LOCATION
    )
    :vars
    (
      ?AUTO_1051 - TRUCK
      ?AUTO_1052 - LOCATION
      ?AUTO_1053 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1049 ?AUTO_1051 ) ( TRUCK-AT ?AUTO_1051 ?AUTO_1052 ) ( IN-CITY ?AUTO_1052 ?AUTO_1053 ) ( IN-CITY ?AUTO_1050 ?AUTO_1053 ) ( not ( = ?AUTO_1050 ?AUTO_1052 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1051 ?AUTO_1052 ?AUTO_1050 ?AUTO_1053 )
      ( DELIVER-PKG ?AUTO_1049 ?AUTO_1050 )
      ( DELIVER-PKG-VERIFY ?AUTO_1049 ?AUTO_1050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1132 - OBJ
      ?AUTO_1133 - LOCATION
    )
    :vars
    (
      ?AUTO_1134 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1134 ?AUTO_1133 ) ( IN-TRUCK ?AUTO_1132 ?AUTO_1134 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1132 ?AUTO_1134 ?AUTO_1133 )
      ( DELIVER-PKG-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1149 - OBJ
      ?AUTO_1150 - LOCATION
    )
    :vars
    (
      ?AUTO_1152 - TRUCK
      ?AUTO_1151 - LOCATION
      ?AUTO_1153 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1152 ?AUTO_1151 ) ( IN-CITY ?AUTO_1151 ?AUTO_1153 ) ( IN-CITY ?AUTO_1150 ?AUTO_1153 ) ( not ( = ?AUTO_1150 ?AUTO_1151 ) ) ( OBJ-AT ?AUTO_1149 ?AUTO_1151 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1149 ?AUTO_1152 ?AUTO_1151 )
      ( DELIVER-PKG ?AUTO_1149 ?AUTO_1150 )
      ( DELIVER-PKG-VERIFY ?AUTO_1149 ?AUTO_1150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1174 - OBJ
      ?AUTO_1175 - LOCATION
    )
    :vars
    (
      ?AUTO_1179 - LOCATION
      ?AUTO_1177 - CITY
      ?AUTO_1178 - TRUCK
      ?AUTO_1176 - LOCATION
      ?AUTO_1180 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1179 ?AUTO_1177 ) ( IN-CITY ?AUTO_1175 ?AUTO_1177 ) ( not ( = ?AUTO_1175 ?AUTO_1179 ) ) ( TRUCK-AT ?AUTO_1178 ?AUTO_1176 ) ( IN-CITY ?AUTO_1176 ?AUTO_1177 ) ( not ( = ?AUTO_1179 ?AUTO_1176 ) ) ( not ( = ?AUTO_1175 ?AUTO_1176 ) ) ( IN-AIRPLANE ?AUTO_1174 ?AUTO_1180 ) ( AIRPLANE-AT ?AUTO_1180 ?AUTO_1179 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1174 ?AUTO_1180 ?AUTO_1179 )
      ( DELIVER-PKG ?AUTO_1174 ?AUTO_1175 )
      ( DELIVER-PKG-VERIFY ?AUTO_1174 ?AUTO_1175 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1203 - OBJ
      ?AUTO_1204 - LOCATION
    )
    :vars
    (
      ?AUTO_1210 - LOCATION
      ?AUTO_1206 - CITY
      ?AUTO_1209 - TRUCK
      ?AUTO_1207 - LOCATION
      ?AUTO_1205 - LOCATION
      ?AUTO_1208 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1210 ?AUTO_1206 ) ( IN-CITY ?AUTO_1204 ?AUTO_1206 ) ( not ( = ?AUTO_1204 ?AUTO_1210 ) ) ( TRUCK-AT ?AUTO_1209 ?AUTO_1207 ) ( IN-CITY ?AUTO_1207 ?AUTO_1206 ) ( not ( = ?AUTO_1210 ?AUTO_1207 ) ) ( not ( = ?AUTO_1204 ?AUTO_1207 ) ) ( AIRPORT ?AUTO_1205 ) ( AIRPORT ?AUTO_1210 ) ( AIRPLANE-AT ?AUTO_1208 ?AUTO_1205 ) ( not ( = ?AUTO_1205 ?AUTO_1210 ) ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( not ( = ?AUTO_1207 ?AUTO_1205 ) ) ( OBJ-AT ?AUTO_1203 ?AUTO_1205 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1203 ?AUTO_1208 ?AUTO_1205 )
      ( DELIVER-PKG ?AUTO_1203 ?AUTO_1204 )
      ( DELIVER-PKG-VERIFY ?AUTO_1203 ?AUTO_1204 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1231 - OBJ
      ?AUTO_1232 - LOCATION
    )
    :vars
    (
      ?AUTO_1233 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1233 ?AUTO_1232 ) ( IN-TRUCK ?AUTO_1231 ?AUTO_1233 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1231 ?AUTO_1233 ?AUTO_1232 )
      ( DELIVER-PKG-VERIFY ?AUTO_1231 ?AUTO_1232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1234 - OBJ
      ?AUTO_1235 - LOCATION
    )
    :vars
    (
      ?AUTO_1236 - TRUCK
      ?AUTO_1237 - LOCATION
      ?AUTO_1238 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1234 ?AUTO_1236 ) ( TRUCK-AT ?AUTO_1236 ?AUTO_1237 ) ( IN-CITY ?AUTO_1237 ?AUTO_1238 ) ( IN-CITY ?AUTO_1235 ?AUTO_1238 ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1236 ?AUTO_1237 ?AUTO_1235 ?AUTO_1238 )
      ( DELIVER-PKG ?AUTO_1234 ?AUTO_1235 )
      ( DELIVER-PKG-VERIFY ?AUTO_1234 ?AUTO_1235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1253 - OBJ
      ?AUTO_1254 - LOCATION
    )
    :vars
    (
      ?AUTO_1257 - TRUCK
      ?AUTO_1255 - LOCATION
      ?AUTO_1256 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1257 ?AUTO_1255 ) ( IN-CITY ?AUTO_1255 ?AUTO_1256 ) ( IN-CITY ?AUTO_1254 ?AUTO_1256 ) ( not ( = ?AUTO_1254 ?AUTO_1255 ) ) ( OBJ-AT ?AUTO_1253 ?AUTO_1255 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1253 ?AUTO_1257 ?AUTO_1255 )
      ( DELIVER-PKG ?AUTO_1253 ?AUTO_1254 )
      ( DELIVER-PKG-VERIFY ?AUTO_1253 ?AUTO_1254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1266 - OBJ
      ?AUTO_1267 - LOCATION
    )
    :vars
    (
      ?AUTO_1269 - LOCATION
      ?AUTO_1268 - CITY
      ?AUTO_1270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1269 ?AUTO_1268 ) ( IN-CITY ?AUTO_1267 ?AUTO_1268 ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( OBJ-AT ?AUTO_1266 ?AUTO_1269 ) ( TRUCK-AT ?AUTO_1270 ?AUTO_1267 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1270 ?AUTO_1267 ?AUTO_1269 ?AUTO_1268 )
      ( DELIVER-PKG ?AUTO_1266 ?AUTO_1267 )
      ( DELIVER-PKG-VERIFY ?AUTO_1266 ?AUTO_1267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1281 - OBJ
      ?AUTO_1282 - LOCATION
    )
    :vars
    (
      ?AUTO_1284 - LOCATION
      ?AUTO_1285 - CITY
      ?AUTO_1283 - TRUCK
      ?AUTO_1286 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1284 ?AUTO_1285 ) ( IN-CITY ?AUTO_1282 ?AUTO_1285 ) ( not ( = ?AUTO_1282 ?AUTO_1284 ) ) ( TRUCK-AT ?AUTO_1283 ?AUTO_1282 ) ( IN-AIRPLANE ?AUTO_1281 ?AUTO_1286 ) ( AIRPLANE-AT ?AUTO_1286 ?AUTO_1284 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1281 ?AUTO_1286 ?AUTO_1284 )
      ( DELIVER-PKG ?AUTO_1281 ?AUTO_1282 )
      ( DELIVER-PKG-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1295 - OBJ
      ?AUTO_1296 - LOCATION
    )
    :vars
    (
      ?AUTO_1297 - LOCATION
      ?AUTO_1298 - CITY
      ?AUTO_1299 - TRUCK
      ?AUTO_1300 - AIRPLANE
      ?AUTO_1301 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1297 ?AUTO_1298 ) ( IN-CITY ?AUTO_1296 ?AUTO_1298 ) ( not ( = ?AUTO_1296 ?AUTO_1297 ) ) ( TRUCK-AT ?AUTO_1299 ?AUTO_1296 ) ( IN-AIRPLANE ?AUTO_1295 ?AUTO_1300 ) ( AIRPORT ?AUTO_1301 ) ( AIRPORT ?AUTO_1297 ) ( AIRPLANE-AT ?AUTO_1300 ?AUTO_1301 ) ( not ( = ?AUTO_1301 ?AUTO_1297 ) ) ( not ( = ?AUTO_1296 ?AUTO_1301 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1300 ?AUTO_1301 ?AUTO_1297 )
      ( DELIVER-PKG ?AUTO_1295 ?AUTO_1296 )
      ( DELIVER-PKG-VERIFY ?AUTO_1295 ?AUTO_1296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1310 - OBJ
      ?AUTO_1311 - LOCATION
    )
    :vars
    (
      ?AUTO_1316 - LOCATION
      ?AUTO_1313 - CITY
      ?AUTO_1314 - TRUCK
      ?AUTO_1312 - LOCATION
      ?AUTO_1315 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1316 ?AUTO_1313 ) ( IN-CITY ?AUTO_1311 ?AUTO_1313 ) ( not ( = ?AUTO_1311 ?AUTO_1316 ) ) ( TRUCK-AT ?AUTO_1314 ?AUTO_1311 ) ( AIRPORT ?AUTO_1312 ) ( AIRPORT ?AUTO_1316 ) ( AIRPLANE-AT ?AUTO_1315 ?AUTO_1312 ) ( not ( = ?AUTO_1312 ?AUTO_1316 ) ) ( not ( = ?AUTO_1311 ?AUTO_1312 ) ) ( OBJ-AT ?AUTO_1310 ?AUTO_1312 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1310 ?AUTO_1315 ?AUTO_1312 )
      ( DELIVER-PKG ?AUTO_1310 ?AUTO_1311 )
      ( DELIVER-PKG-VERIFY ?AUTO_1310 ?AUTO_1311 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1319 - OBJ
      ?AUTO_1320 - LOCATION
    )
    :vars
    (
      ?AUTO_1325 - LOCATION
      ?AUTO_1321 - CITY
      ?AUTO_1323 - TRUCK
      ?AUTO_1324 - LOCATION
      ?AUTO_1326 - LOCATION
      ?AUTO_1322 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1325 ?AUTO_1321 ) ( IN-CITY ?AUTO_1320 ?AUTO_1321 ) ( not ( = ?AUTO_1320 ?AUTO_1325 ) ) ( TRUCK-AT ?AUTO_1323 ?AUTO_1320 ) ( AIRPORT ?AUTO_1324 ) ( AIRPORT ?AUTO_1325 ) ( not ( = ?AUTO_1324 ?AUTO_1325 ) ) ( not ( = ?AUTO_1320 ?AUTO_1324 ) ) ( OBJ-AT ?AUTO_1319 ?AUTO_1324 ) ( AIRPORT ?AUTO_1326 ) ( AIRPLANE-AT ?AUTO_1322 ?AUTO_1326 ) ( not ( = ?AUTO_1326 ?AUTO_1324 ) ) ( not ( = ?AUTO_1320 ?AUTO_1326 ) ) ( not ( = ?AUTO_1325 ?AUTO_1326 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1322 ?AUTO_1326 ?AUTO_1324 )
      ( DELIVER-PKG ?AUTO_1319 ?AUTO_1320 )
      ( DELIVER-PKG-VERIFY ?AUTO_1319 ?AUTO_1320 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1329 - OBJ
      ?AUTO_1330 - LOCATION
    )
    :vars
    (
      ?AUTO_1331 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1331 ?AUTO_1330 ) ( IN-TRUCK ?AUTO_1329 ?AUTO_1331 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1329 ?AUTO_1331 ?AUTO_1330 )
      ( DELIVER-PKG-VERIFY ?AUTO_1329 ?AUTO_1330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1332 - OBJ
      ?AUTO_1333 - LOCATION
    )
    :vars
    (
      ?AUTO_1334 - TRUCK
      ?AUTO_1335 - LOCATION
      ?AUTO_1336 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1332 ?AUTO_1334 ) ( TRUCK-AT ?AUTO_1334 ?AUTO_1335 ) ( IN-CITY ?AUTO_1335 ?AUTO_1336 ) ( IN-CITY ?AUTO_1333 ?AUTO_1336 ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1334 ?AUTO_1335 ?AUTO_1333 ?AUTO_1336 )
      ( DELIVER-PKG ?AUTO_1332 ?AUTO_1333 )
      ( DELIVER-PKG-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1345 - OBJ
      ?AUTO_1346 - LOCATION
    )
    :vars
    (
      ?AUTO_1348 - TRUCK
      ?AUTO_1349 - LOCATION
      ?AUTO_1347 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1348 ?AUTO_1349 ) ( IN-CITY ?AUTO_1349 ?AUTO_1347 ) ( IN-CITY ?AUTO_1346 ?AUTO_1347 ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( OBJ-AT ?AUTO_1345 ?AUTO_1349 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1345 ?AUTO_1348 ?AUTO_1349 )
      ( DELIVER-PKG ?AUTO_1345 ?AUTO_1346 )
      ( DELIVER-PKG-VERIFY ?AUTO_1345 ?AUTO_1346 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1350 - OBJ
      ?AUTO_1351 - LOCATION
    )
    :vars
    (
      ?AUTO_1354 - LOCATION
      ?AUTO_1352 - CITY
      ?AUTO_1353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1354 ?AUTO_1352 ) ( IN-CITY ?AUTO_1351 ?AUTO_1352 ) ( not ( = ?AUTO_1351 ?AUTO_1354 ) ) ( OBJ-AT ?AUTO_1350 ?AUTO_1354 ) ( TRUCK-AT ?AUTO_1353 ?AUTO_1351 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1353 ?AUTO_1351 ?AUTO_1354 ?AUTO_1352 )
      ( DELIVER-PKG ?AUTO_1350 ?AUTO_1351 )
      ( DELIVER-PKG-VERIFY ?AUTO_1350 ?AUTO_1351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1367 - OBJ
      ?AUTO_1368 - LOCATION
    )
    :vars
    (
      ?AUTO_1369 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1369 ?AUTO_1368 ) ( IN-TRUCK ?AUTO_1367 ?AUTO_1369 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1367 ?AUTO_1369 ?AUTO_1368 )
      ( DELIVER-PKG-VERIFY ?AUTO_1367 ?AUTO_1368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1378 - OBJ
      ?AUTO_1379 - LOCATION
    )
    :vars
    (
      ?AUTO_1380 - TRUCK
      ?AUTO_1382 - LOCATION
      ?AUTO_1381 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1380 ?AUTO_1382 ) ( IN-CITY ?AUTO_1382 ?AUTO_1381 ) ( IN-CITY ?AUTO_1379 ?AUTO_1381 ) ( not ( = ?AUTO_1379 ?AUTO_1382 ) ) ( OBJ-AT ?AUTO_1378 ?AUTO_1382 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1378 ?AUTO_1380 ?AUTO_1382 )
      ( DELIVER-PKG ?AUTO_1378 ?AUTO_1379 )
      ( DELIVER-PKG-VERIFY ?AUTO_1378 ?AUTO_1379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1383 - OBJ
      ?AUTO_1384 - LOCATION
    )
    :vars
    (
      ?AUTO_1386 - LOCATION
      ?AUTO_1387 - CITY
      ?AUTO_1385 - TRUCK
      ?AUTO_1388 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1386 ?AUTO_1387 ) ( IN-CITY ?AUTO_1384 ?AUTO_1387 ) ( not ( = ?AUTO_1384 ?AUTO_1386 ) ) ( OBJ-AT ?AUTO_1383 ?AUTO_1386 ) ( TRUCK-AT ?AUTO_1385 ?AUTO_1388 ) ( IN-CITY ?AUTO_1388 ?AUTO_1387 ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) ( not ( = ?AUTO_1384 ?AUTO_1388 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1385 ?AUTO_1388 ?AUTO_1386 ?AUTO_1387 )
      ( DELIVER-PKG ?AUTO_1383 ?AUTO_1384 )
      ( DELIVER-PKG-VERIFY ?AUTO_1383 ?AUTO_1384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1405 - OBJ
      ?AUTO_1406 - LOCATION
    )
    :vars
    (
      ?AUTO_1407 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1407 ?AUTO_1406 ) ( IN-TRUCK ?AUTO_1405 ?AUTO_1407 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1405 ?AUTO_1407 ?AUTO_1406 )
      ( DELIVER-PKG-VERIFY ?AUTO_1405 ?AUTO_1406 ) )
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
      ?AUTO_1420 - LOCATION
      ?AUTO_1419 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1418 ?AUTO_1420 ) ( IN-CITY ?AUTO_1420 ?AUTO_1419 ) ( IN-CITY ?AUTO_1417 ?AUTO_1419 ) ( not ( = ?AUTO_1417 ?AUTO_1420 ) ) ( OBJ-AT ?AUTO_1416 ?AUTO_1420 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1416 ?AUTO_1418 ?AUTO_1420 )
      ( DELIVER-PKG ?AUTO_1416 ?AUTO_1417 )
      ( DELIVER-PKG-VERIFY ?AUTO_1416 ?AUTO_1417 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1441 - OBJ
      ?AUTO_1442 - LOCATION
    )
    :vars
    (
      ?AUTO_1443 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1441 ?AUTO_1443 ) ( AIRPLANE-AT ?AUTO_1443 ?AUTO_1442 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1441 ?AUTO_1443 ?AUTO_1442 )
      ( DELIVER-PKG-VERIFY ?AUTO_1441 ?AUTO_1442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1446 - OBJ
      ?AUTO_1447 - LOCATION
    )
    :vars
    (
      ?AUTO_1448 - AIRPLANE
      ?AUTO_1449 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1446 ?AUTO_1448 ) ( AIRPORT ?AUTO_1449 ) ( AIRPORT ?AUTO_1447 ) ( AIRPLANE-AT ?AUTO_1448 ?AUTO_1449 ) ( not ( = ?AUTO_1449 ?AUTO_1447 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1448 ?AUTO_1449 ?AUTO_1447 )
      ( DELIVER-PKG ?AUTO_1446 ?AUTO_1447 )
      ( DELIVER-PKG-VERIFY ?AUTO_1446 ?AUTO_1447 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1474 - OBJ
      ?AUTO_1475 - LOCATION
    )
    :vars
    (
      ?AUTO_1476 - LOCATION
      ?AUTO_1477 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1476 ) ( AIRPORT ?AUTO_1475 ) ( AIRPLANE-AT ?AUTO_1477 ?AUTO_1476 ) ( not ( = ?AUTO_1476 ?AUTO_1475 ) ) ( OBJ-AT ?AUTO_1474 ?AUTO_1476 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1474 ?AUTO_1477 ?AUTO_1476 )
      ( DELIVER-PKG ?AUTO_1474 ?AUTO_1475 )
      ( DELIVER-PKG-VERIFY ?AUTO_1474 ?AUTO_1475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1484 - OBJ
      ?AUTO_1485 - LOCATION
    )
    :vars
    (
      ?AUTO_1486 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1486 ?AUTO_1485 ) ( IN-TRUCK ?AUTO_1484 ?AUTO_1486 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1484 ?AUTO_1486 ?AUTO_1485 )
      ( DELIVER-PKG-VERIFY ?AUTO_1484 ?AUTO_1485 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1489 - OBJ
      ?AUTO_1490 - LOCATION
    )
    :vars
    (
      ?AUTO_1491 - TRUCK
      ?AUTO_1492 - LOCATION
      ?AUTO_1493 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1489 ?AUTO_1491 ) ( TRUCK-AT ?AUTO_1491 ?AUTO_1492 ) ( IN-CITY ?AUTO_1492 ?AUTO_1493 ) ( IN-CITY ?AUTO_1490 ?AUTO_1493 ) ( not ( = ?AUTO_1490 ?AUTO_1492 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1491 ?AUTO_1492 ?AUTO_1490 ?AUTO_1493 )
      ( DELIVER-PKG ?AUTO_1489 ?AUTO_1490 )
      ( DELIVER-PKG-VERIFY ?AUTO_1489 ?AUTO_1490 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1534 - OBJ
      ?AUTO_1535 - LOCATION
    )
    :vars
    (
      ?AUTO_1536 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1536 ?AUTO_1535 ) ( IN-TRUCK ?AUTO_1534 ?AUTO_1536 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1534 ?AUTO_1536 ?AUTO_1535 )
      ( DELIVER-PKG-VERIFY ?AUTO_1534 ?AUTO_1535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1543 - OBJ
      ?AUTO_1544 - LOCATION
    )
    :vars
    (
      ?AUTO_1546 - TRUCK
      ?AUTO_1545 - LOCATION
      ?AUTO_1547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1546 ?AUTO_1545 ) ( IN-CITY ?AUTO_1545 ?AUTO_1547 ) ( IN-CITY ?AUTO_1544 ?AUTO_1547 ) ( not ( = ?AUTO_1544 ?AUTO_1545 ) ) ( OBJ-AT ?AUTO_1543 ?AUTO_1545 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1543 ?AUTO_1546 ?AUTO_1545 )
      ( DELIVER-PKG ?AUTO_1543 ?AUTO_1544 )
      ( DELIVER-PKG-VERIFY ?AUTO_1543 ?AUTO_1544 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1548 - OBJ
      ?AUTO_1549 - LOCATION
    )
    :vars
    (
      ?AUTO_1550 - TRUCK
      ?AUTO_1551 - LOCATION
      ?AUTO_1552 - CITY
      ?AUTO_1553 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1550 ?AUTO_1551 ) ( IN-CITY ?AUTO_1551 ?AUTO_1552 ) ( IN-CITY ?AUTO_1549 ?AUTO_1552 ) ( not ( = ?AUTO_1549 ?AUTO_1551 ) ) ( IN-AIRPLANE ?AUTO_1548 ?AUTO_1553 ) ( AIRPLANE-AT ?AUTO_1553 ?AUTO_1551 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1548 ?AUTO_1553 ?AUTO_1551 )
      ( DELIVER-PKG ?AUTO_1548 ?AUTO_1549 )
      ( DELIVER-PKG-VERIFY ?AUTO_1548 ?AUTO_1549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1556 - OBJ
      ?AUTO_1557 - LOCATION
    )
    :vars
    (
      ?AUTO_1558 - TRUCK
      ?AUTO_1560 - LOCATION
      ?AUTO_1559 - CITY
      ?AUTO_1561 - AIRPLANE
      ?AUTO_1562 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1558 ?AUTO_1560 ) ( IN-CITY ?AUTO_1560 ?AUTO_1559 ) ( IN-CITY ?AUTO_1557 ?AUTO_1559 ) ( not ( = ?AUTO_1557 ?AUTO_1560 ) ) ( IN-AIRPLANE ?AUTO_1556 ?AUTO_1561 ) ( AIRPORT ?AUTO_1562 ) ( AIRPORT ?AUTO_1560 ) ( AIRPLANE-AT ?AUTO_1561 ?AUTO_1562 ) ( not ( = ?AUTO_1562 ?AUTO_1560 ) ) ( not ( = ?AUTO_1557 ?AUTO_1562 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1561 ?AUTO_1562 ?AUTO_1560 )
      ( DELIVER-PKG ?AUTO_1556 ?AUTO_1557 )
      ( DELIVER-PKG-VERIFY ?AUTO_1556 ?AUTO_1557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1587 - OBJ
      ?AUTO_1588 - LOCATION
    )
    :vars
    (
      ?AUTO_1590 - TRUCK
      ?AUTO_1592 - LOCATION
      ?AUTO_1593 - CITY
      ?AUTO_1591 - LOCATION
      ?AUTO_1589 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1590 ?AUTO_1592 ) ( IN-CITY ?AUTO_1592 ?AUTO_1593 ) ( IN-CITY ?AUTO_1588 ?AUTO_1593 ) ( not ( = ?AUTO_1588 ?AUTO_1592 ) ) ( AIRPORT ?AUTO_1591 ) ( AIRPORT ?AUTO_1592 ) ( AIRPLANE-AT ?AUTO_1589 ?AUTO_1591 ) ( not ( = ?AUTO_1591 ?AUTO_1592 ) ) ( not ( = ?AUTO_1588 ?AUTO_1591 ) ) ( OBJ-AT ?AUTO_1587 ?AUTO_1591 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1587 ?AUTO_1589 ?AUTO_1591 )
      ( DELIVER-PKG ?AUTO_1587 ?AUTO_1588 )
      ( DELIVER-PKG-VERIFY ?AUTO_1587 ?AUTO_1588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1600 - OBJ
      ?AUTO_1601 - LOCATION
    )
    :vars
    (
      ?AUTO_1602 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1600 ?AUTO_1602 ) ( AIRPLANE-AT ?AUTO_1602 ?AUTO_1601 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1600 ?AUTO_1602 ?AUTO_1601 )
      ( DELIVER-PKG-VERIFY ?AUTO_1600 ?AUTO_1601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1609 - OBJ
      ?AUTO_1610 - LOCATION
    )
    :vars
    (
      ?AUTO_1611 - AIRPLANE
      ?AUTO_1612 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1609 ?AUTO_1611 ) ( AIRPORT ?AUTO_1612 ) ( AIRPORT ?AUTO_1610 ) ( AIRPLANE-AT ?AUTO_1611 ?AUTO_1612 ) ( not ( = ?AUTO_1612 ?AUTO_1610 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1611 ?AUTO_1612 ?AUTO_1610 )
      ( DELIVER-PKG ?AUTO_1609 ?AUTO_1610 )
      ( DELIVER-PKG-VERIFY ?AUTO_1609 ?AUTO_1610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1625 - OBJ
      ?AUTO_1626 - LOCATION
    )
    :vars
    (
      ?AUTO_1627 - LOCATION
      ?AUTO_1628 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1627 ) ( AIRPORT ?AUTO_1626 ) ( AIRPLANE-AT ?AUTO_1628 ?AUTO_1627 ) ( not ( = ?AUTO_1627 ?AUTO_1626 ) ) ( OBJ-AT ?AUTO_1625 ?AUTO_1627 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1625 ?AUTO_1628 ?AUTO_1627 )
      ( DELIVER-PKG ?AUTO_1625 ?AUTO_1626 )
      ( DELIVER-PKG-VERIFY ?AUTO_1625 ?AUTO_1626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1629 - OBJ
      ?AUTO_1630 - LOCATION
    )
    :vars
    (
      ?AUTO_1631 - LOCATION
      ?AUTO_1633 - LOCATION
      ?AUTO_1632 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1631 ) ( AIRPORT ?AUTO_1630 ) ( not ( = ?AUTO_1631 ?AUTO_1630 ) ) ( OBJ-AT ?AUTO_1629 ?AUTO_1631 ) ( AIRPORT ?AUTO_1633 ) ( AIRPLANE-AT ?AUTO_1632 ?AUTO_1633 ) ( not ( = ?AUTO_1633 ?AUTO_1631 ) ) ( not ( = ?AUTO_1630 ?AUTO_1633 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1632 ?AUTO_1633 ?AUTO_1631 )
      ( DELIVER-PKG ?AUTO_1629 ?AUTO_1630 )
      ( DELIVER-PKG-VERIFY ?AUTO_1629 ?AUTO_1630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1666 - OBJ
      ?AUTO_1667 - LOCATION
    )
    :vars
    (
      ?AUTO_1668 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1666 ?AUTO_1668 ) ( AIRPLANE-AT ?AUTO_1668 ?AUTO_1667 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1666 ?AUTO_1668 ?AUTO_1667 )
      ( DELIVER-PKG-VERIFY ?AUTO_1666 ?AUTO_1667 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1669 - OBJ
      ?AUTO_1670 - LOCATION
    )
    :vars
    (
      ?AUTO_1671 - AIRPLANE
      ?AUTO_1672 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1669 ?AUTO_1671 ) ( AIRPORT ?AUTO_1672 ) ( AIRPORT ?AUTO_1670 ) ( AIRPLANE-AT ?AUTO_1671 ?AUTO_1672 ) ( not ( = ?AUTO_1672 ?AUTO_1670 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1671 ?AUTO_1672 ?AUTO_1670 )
      ( DELIVER-PKG ?AUTO_1669 ?AUTO_1670 )
      ( DELIVER-PKG-VERIFY ?AUTO_1669 ?AUTO_1670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1679 - OBJ
      ?AUTO_1680 - LOCATION
    )
    :vars
    (
      ?AUTO_1682 - LOCATION
      ?AUTO_1681 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1682 ) ( AIRPORT ?AUTO_1680 ) ( AIRPLANE-AT ?AUTO_1681 ?AUTO_1682 ) ( not ( = ?AUTO_1682 ?AUTO_1680 ) ) ( OBJ-AT ?AUTO_1679 ?AUTO_1682 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1679 ?AUTO_1681 ?AUTO_1682 )
      ( DELIVER-PKG ?AUTO_1679 ?AUTO_1680 )
      ( DELIVER-PKG-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1685 - OBJ
      ?AUTO_1686 - LOCATION
    )
    :vars
    (
      ?AUTO_1688 - LOCATION
      ?AUTO_1687 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1688 ) ( AIRPORT ?AUTO_1686 ) ( not ( = ?AUTO_1688 ?AUTO_1686 ) ) ( OBJ-AT ?AUTO_1685 ?AUTO_1688 ) ( AIRPLANE-AT ?AUTO_1687 ?AUTO_1686 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1687 ?AUTO_1686 ?AUTO_1688 )
      ( DELIVER-PKG ?AUTO_1685 ?AUTO_1686 )
      ( DELIVER-PKG-VERIFY ?AUTO_1685 ?AUTO_1686 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1693 - OBJ
      ?AUTO_1694 - LOCATION
    )
    :vars
    (
      ?AUTO_1696 - LOCATION
      ?AUTO_1697 - LOCATION
      ?AUTO_1695 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1696 ) ( AIRPORT ?AUTO_1694 ) ( not ( = ?AUTO_1696 ?AUTO_1694 ) ) ( OBJ-AT ?AUTO_1693 ?AUTO_1696 ) ( AIRPORT ?AUTO_1697 ) ( AIRPLANE-AT ?AUTO_1695 ?AUTO_1697 ) ( not ( = ?AUTO_1697 ?AUTO_1694 ) ) ( not ( = ?AUTO_1696 ?AUTO_1697 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1695 ?AUTO_1697 ?AUTO_1694 )
      ( DELIVER-PKG ?AUTO_1693 ?AUTO_1694 )
      ( DELIVER-PKG-VERIFY ?AUTO_1693 ?AUTO_1694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1710 - OBJ
      ?AUTO_1711 - LOCATION
    )
    :vars
    (
      ?AUTO_1712 - LOCATION
      ?AUTO_1713 - LOCATION
      ?AUTO_1714 - AIRPLANE
      ?AUTO_1715 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1712 ) ( AIRPORT ?AUTO_1711 ) ( not ( = ?AUTO_1712 ?AUTO_1711 ) ) ( AIRPORT ?AUTO_1713 ) ( AIRPLANE-AT ?AUTO_1714 ?AUTO_1713 ) ( not ( = ?AUTO_1713 ?AUTO_1711 ) ) ( not ( = ?AUTO_1712 ?AUTO_1713 ) ) ( TRUCK-AT ?AUTO_1715 ?AUTO_1712 ) ( IN-TRUCK ?AUTO_1710 ?AUTO_1715 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1710 ?AUTO_1715 ?AUTO_1712 )
      ( DELIVER-PKG ?AUTO_1710 ?AUTO_1711 )
      ( DELIVER-PKG-VERIFY ?AUTO_1710 ?AUTO_1711 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1718 - OBJ
      ?AUTO_1719 - LOCATION
    )
    :vars
    (
      ?AUTO_1721 - LOCATION
      ?AUTO_1723 - LOCATION
      ?AUTO_1722 - AIRPLANE
      ?AUTO_1720 - TRUCK
      ?AUTO_1724 - LOCATION
      ?AUTO_1725 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1721 ) ( AIRPORT ?AUTO_1719 ) ( not ( = ?AUTO_1721 ?AUTO_1719 ) ) ( AIRPORT ?AUTO_1723 ) ( AIRPLANE-AT ?AUTO_1722 ?AUTO_1723 ) ( not ( = ?AUTO_1723 ?AUTO_1719 ) ) ( not ( = ?AUTO_1721 ?AUTO_1723 ) ) ( IN-TRUCK ?AUTO_1718 ?AUTO_1720 ) ( TRUCK-AT ?AUTO_1720 ?AUTO_1724 ) ( IN-CITY ?AUTO_1724 ?AUTO_1725 ) ( IN-CITY ?AUTO_1721 ?AUTO_1725 ) ( not ( = ?AUTO_1721 ?AUTO_1724 ) ) ( not ( = ?AUTO_1719 ?AUTO_1724 ) ) ( not ( = ?AUTO_1723 ?AUTO_1724 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1720 ?AUTO_1724 ?AUTO_1721 ?AUTO_1725 )
      ( DELIVER-PKG ?AUTO_1718 ?AUTO_1719 )
      ( DELIVER-PKG-VERIFY ?AUTO_1718 ?AUTO_1719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1730 - OBJ
      ?AUTO_1731 - LOCATION
    )
    :vars
    (
      ?AUTO_1732 - LOCATION
      ?AUTO_1737 - LOCATION
      ?AUTO_1734 - AIRPLANE
      ?AUTO_1733 - TRUCK
      ?AUTO_1736 - LOCATION
      ?AUTO_1735 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1732 ) ( AIRPORT ?AUTO_1731 ) ( not ( = ?AUTO_1732 ?AUTO_1731 ) ) ( AIRPORT ?AUTO_1737 ) ( AIRPLANE-AT ?AUTO_1734 ?AUTO_1737 ) ( not ( = ?AUTO_1737 ?AUTO_1731 ) ) ( not ( = ?AUTO_1732 ?AUTO_1737 ) ) ( TRUCK-AT ?AUTO_1733 ?AUTO_1736 ) ( IN-CITY ?AUTO_1736 ?AUTO_1735 ) ( IN-CITY ?AUTO_1732 ?AUTO_1735 ) ( not ( = ?AUTO_1732 ?AUTO_1736 ) ) ( not ( = ?AUTO_1731 ?AUTO_1736 ) ) ( not ( = ?AUTO_1737 ?AUTO_1736 ) ) ( OBJ-AT ?AUTO_1730 ?AUTO_1736 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1730 ?AUTO_1733 ?AUTO_1736 )
      ( DELIVER-PKG ?AUTO_1730 ?AUTO_1731 )
      ( DELIVER-PKG-VERIFY ?AUTO_1730 ?AUTO_1731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1738 - OBJ
      ?AUTO_1739 - LOCATION
    )
    :vars
    (
      ?AUTO_1743 - LOCATION
      ?AUTO_1740 - LOCATION
      ?AUTO_1745 - AIRPLANE
      ?AUTO_1741 - LOCATION
      ?AUTO_1744 - CITY
      ?AUTO_1742 - TRUCK
      ?AUTO_1746 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1743 ) ( AIRPORT ?AUTO_1739 ) ( not ( = ?AUTO_1743 ?AUTO_1739 ) ) ( AIRPORT ?AUTO_1740 ) ( AIRPLANE-AT ?AUTO_1745 ?AUTO_1740 ) ( not ( = ?AUTO_1740 ?AUTO_1739 ) ) ( not ( = ?AUTO_1743 ?AUTO_1740 ) ) ( IN-CITY ?AUTO_1741 ?AUTO_1744 ) ( IN-CITY ?AUTO_1743 ?AUTO_1744 ) ( not ( = ?AUTO_1743 ?AUTO_1741 ) ) ( not ( = ?AUTO_1739 ?AUTO_1741 ) ) ( not ( = ?AUTO_1740 ?AUTO_1741 ) ) ( OBJ-AT ?AUTO_1738 ?AUTO_1741 ) ( TRUCK-AT ?AUTO_1742 ?AUTO_1746 ) ( IN-CITY ?AUTO_1746 ?AUTO_1744 ) ( not ( = ?AUTO_1741 ?AUTO_1746 ) ) ( not ( = ?AUTO_1739 ?AUTO_1746 ) ) ( not ( = ?AUTO_1743 ?AUTO_1746 ) ) ( not ( = ?AUTO_1740 ?AUTO_1746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1742 ?AUTO_1746 ?AUTO_1741 ?AUTO_1744 )
      ( DELIVER-PKG ?AUTO_1738 ?AUTO_1739 )
      ( DELIVER-PKG-VERIFY ?AUTO_1738 ?AUTO_1739 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1749 - OBJ
      ?AUTO_1750 - LOCATION
    )
    :vars
    (
      ?AUTO_1755 - LOCATION
      ?AUTO_1754 - LOCATION
      ?AUTO_1751 - AIRPLANE
      ?AUTO_1753 - LOCATION
      ?AUTO_1757 - CITY
      ?AUTO_1752 - LOCATION
      ?AUTO_1756 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1755 ) ( AIRPORT ?AUTO_1750 ) ( not ( = ?AUTO_1755 ?AUTO_1750 ) ) ( AIRPORT ?AUTO_1754 ) ( AIRPLANE-AT ?AUTO_1751 ?AUTO_1754 ) ( not ( = ?AUTO_1754 ?AUTO_1750 ) ) ( not ( = ?AUTO_1755 ?AUTO_1754 ) ) ( IN-CITY ?AUTO_1753 ?AUTO_1757 ) ( IN-CITY ?AUTO_1755 ?AUTO_1757 ) ( not ( = ?AUTO_1755 ?AUTO_1753 ) ) ( not ( = ?AUTO_1750 ?AUTO_1753 ) ) ( not ( = ?AUTO_1754 ?AUTO_1753 ) ) ( OBJ-AT ?AUTO_1749 ?AUTO_1753 ) ( IN-CITY ?AUTO_1752 ?AUTO_1757 ) ( not ( = ?AUTO_1753 ?AUTO_1752 ) ) ( not ( = ?AUTO_1750 ?AUTO_1752 ) ) ( not ( = ?AUTO_1755 ?AUTO_1752 ) ) ( not ( = ?AUTO_1754 ?AUTO_1752 ) ) ( TRUCK-AT ?AUTO_1756 ?AUTO_1755 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1756 ?AUTO_1755 ?AUTO_1752 ?AUTO_1757 )
      ( DELIVER-PKG ?AUTO_1749 ?AUTO_1750 )
      ( DELIVER-PKG-VERIFY ?AUTO_1749 ?AUTO_1750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1770 - OBJ
      ?AUTO_1771 - LOCATION
    )
    :vars
    (
      ?AUTO_1772 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1770 ?AUTO_1772 ) ( AIRPLANE-AT ?AUTO_1772 ?AUTO_1771 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1770 ?AUTO_1772 ?AUTO_1771 )
      ( DELIVER-PKG-VERIFY ?AUTO_1770 ?AUTO_1771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1781 - OBJ
      ?AUTO_1782 - LOCATION
    )
    :vars
    (
      ?AUTO_1783 - LOCATION
      ?AUTO_1784 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1783 ) ( AIRPORT ?AUTO_1782 ) ( AIRPLANE-AT ?AUTO_1784 ?AUTO_1783 ) ( not ( = ?AUTO_1783 ?AUTO_1782 ) ) ( OBJ-AT ?AUTO_1781 ?AUTO_1783 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1781 ?AUTO_1784 ?AUTO_1783 )
      ( DELIVER-PKG ?AUTO_1781 ?AUTO_1782 )
      ( DELIVER-PKG-VERIFY ?AUTO_1781 ?AUTO_1782 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1807 - OBJ
      ?AUTO_1808 - LOCATION
    )
    :vars
    (
      ?AUTO_1809 - LOCATION
      ?AUTO_1811 - LOCATION
      ?AUTO_1810 - AIRPLANE
      ?AUTO_1812 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1809 ) ( AIRPORT ?AUTO_1808 ) ( not ( = ?AUTO_1809 ?AUTO_1808 ) ) ( AIRPORT ?AUTO_1811 ) ( AIRPLANE-AT ?AUTO_1810 ?AUTO_1811 ) ( not ( = ?AUTO_1811 ?AUTO_1808 ) ) ( not ( = ?AUTO_1809 ?AUTO_1811 ) ) ( TRUCK-AT ?AUTO_1812 ?AUTO_1809 ) ( IN-TRUCK ?AUTO_1807 ?AUTO_1812 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1807 ?AUTO_1812 ?AUTO_1809 )
      ( DELIVER-PKG ?AUTO_1807 ?AUTO_1808 )
      ( DELIVER-PKG-VERIFY ?AUTO_1807 ?AUTO_1808 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1821 - OBJ
      ?AUTO_1822 - LOCATION
    )
    :vars
    (
      ?AUTO_1826 - LOCATION
      ?AUTO_1823 - LOCATION
      ?AUTO_1828 - AIRPLANE
      ?AUTO_1825 - TRUCK
      ?AUTO_1827 - LOCATION
      ?AUTO_1824 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1826 ) ( AIRPORT ?AUTO_1822 ) ( not ( = ?AUTO_1826 ?AUTO_1822 ) ) ( AIRPORT ?AUTO_1823 ) ( AIRPLANE-AT ?AUTO_1828 ?AUTO_1823 ) ( not ( = ?AUTO_1823 ?AUTO_1822 ) ) ( not ( = ?AUTO_1826 ?AUTO_1823 ) ) ( TRUCK-AT ?AUTO_1825 ?AUTO_1827 ) ( IN-CITY ?AUTO_1827 ?AUTO_1824 ) ( IN-CITY ?AUTO_1826 ?AUTO_1824 ) ( not ( = ?AUTO_1826 ?AUTO_1827 ) ) ( not ( = ?AUTO_1822 ?AUTO_1827 ) ) ( not ( = ?AUTO_1823 ?AUTO_1827 ) ) ( OBJ-AT ?AUTO_1821 ?AUTO_1827 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1821 ?AUTO_1825 ?AUTO_1827 )
      ( DELIVER-PKG ?AUTO_1821 ?AUTO_1822 )
      ( DELIVER-PKG-VERIFY ?AUTO_1821 ?AUTO_1822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1849 - OBJ
      ?AUTO_1850 - LOCATION
    )
    :vars
    (
      ?AUTO_1851 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1849 ?AUTO_1851 ) ( AIRPLANE-AT ?AUTO_1851 ?AUTO_1850 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1849 ?AUTO_1851 ?AUTO_1850 )
      ( DELIVER-PKG-VERIFY ?AUTO_1849 ?AUTO_1850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1924 - OBJ
      ?AUTO_1925 - LOCATION
    )
    :vars
    (
      ?AUTO_1926 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1926 ?AUTO_1925 ) ( IN-TRUCK ?AUTO_1924 ?AUTO_1926 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1924 ?AUTO_1926 ?AUTO_1925 )
      ( DELIVER-PKG-VERIFY ?AUTO_1924 ?AUTO_1925 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1929 - OBJ
      ?AUTO_1930 - LOCATION
    )
    :vars
    (
      ?AUTO_1931 - TRUCK
      ?AUTO_1932 - LOCATION
      ?AUTO_1933 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1929 ?AUTO_1931 ) ( TRUCK-AT ?AUTO_1931 ?AUTO_1932 ) ( IN-CITY ?AUTO_1932 ?AUTO_1933 ) ( IN-CITY ?AUTO_1930 ?AUTO_1933 ) ( not ( = ?AUTO_1930 ?AUTO_1932 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1931 ?AUTO_1932 ?AUTO_1930 ?AUTO_1933 )
      ( DELIVER-PKG ?AUTO_1929 ?AUTO_1930 )
      ( DELIVER-PKG-VERIFY ?AUTO_1929 ?AUTO_1930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1936 - OBJ
      ?AUTO_1937 - LOCATION
    )
    :vars
    (
      ?AUTO_1938 - TRUCK
      ?AUTO_1940 - LOCATION
      ?AUTO_1939 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1938 ?AUTO_1940 ) ( IN-CITY ?AUTO_1940 ?AUTO_1939 ) ( IN-CITY ?AUTO_1937 ?AUTO_1939 ) ( not ( = ?AUTO_1937 ?AUTO_1940 ) ) ( OBJ-AT ?AUTO_1936 ?AUTO_1940 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1936 ?AUTO_1938 ?AUTO_1940 )
      ( DELIVER-PKG ?AUTO_1936 ?AUTO_1937 )
      ( DELIVER-PKG-VERIFY ?AUTO_1936 ?AUTO_1937 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1943 - OBJ
      ?AUTO_1944 - LOCATION
    )
    :vars
    (
      ?AUTO_1945 - TRUCK
      ?AUTO_1946 - LOCATION
      ?AUTO_1947 - CITY
      ?AUTO_1948 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1945 ?AUTO_1946 ) ( IN-CITY ?AUTO_1946 ?AUTO_1947 ) ( IN-CITY ?AUTO_1944 ?AUTO_1947 ) ( not ( = ?AUTO_1944 ?AUTO_1946 ) ) ( IN-AIRPLANE ?AUTO_1943 ?AUTO_1948 ) ( AIRPLANE-AT ?AUTO_1948 ?AUTO_1946 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1943 ?AUTO_1948 ?AUTO_1946 )
      ( DELIVER-PKG ?AUTO_1943 ?AUTO_1944 )
      ( DELIVER-PKG-VERIFY ?AUTO_1943 ?AUTO_1944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1949 - OBJ
      ?AUTO_1950 - LOCATION
    )
    :vars
    (
      ?AUTO_1952 - TRUCK
      ?AUTO_1953 - LOCATION
      ?AUTO_1951 - CITY
      ?AUTO_1954 - AIRPLANE
      ?AUTO_1955 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1952 ?AUTO_1953 ) ( IN-CITY ?AUTO_1953 ?AUTO_1951 ) ( IN-CITY ?AUTO_1950 ?AUTO_1951 ) ( not ( = ?AUTO_1950 ?AUTO_1953 ) ) ( IN-AIRPLANE ?AUTO_1949 ?AUTO_1954 ) ( AIRPORT ?AUTO_1955 ) ( AIRPORT ?AUTO_1953 ) ( AIRPLANE-AT ?AUTO_1954 ?AUTO_1955 ) ( not ( = ?AUTO_1955 ?AUTO_1953 ) ) ( not ( = ?AUTO_1950 ?AUTO_1955 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1954 ?AUTO_1955 ?AUTO_1953 )
      ( DELIVER-PKG ?AUTO_1949 ?AUTO_1950 )
      ( DELIVER-PKG-VERIFY ?AUTO_1949 ?AUTO_1950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1962 - OBJ
      ?AUTO_1963 - LOCATION
    )
    :vars
    (
      ?AUTO_1968 - TRUCK
      ?AUTO_1966 - LOCATION
      ?AUTO_1964 - CITY
      ?AUTO_1967 - LOCATION
      ?AUTO_1965 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1968 ?AUTO_1966 ) ( IN-CITY ?AUTO_1966 ?AUTO_1964 ) ( IN-CITY ?AUTO_1963 ?AUTO_1964 ) ( not ( = ?AUTO_1963 ?AUTO_1966 ) ) ( AIRPORT ?AUTO_1967 ) ( AIRPORT ?AUTO_1966 ) ( AIRPLANE-AT ?AUTO_1965 ?AUTO_1967 ) ( not ( = ?AUTO_1967 ?AUTO_1966 ) ) ( not ( = ?AUTO_1963 ?AUTO_1967 ) ) ( OBJ-AT ?AUTO_1962 ?AUTO_1967 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1962 ?AUTO_1965 ?AUTO_1967 )
      ( DELIVER-PKG ?AUTO_1962 ?AUTO_1963 )
      ( DELIVER-PKG-VERIFY ?AUTO_1962 ?AUTO_1963 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1971 - OBJ
      ?AUTO_1972 - LOCATION
    )
    :vars
    (
      ?AUTO_1974 - TRUCK
      ?AUTO_1975 - LOCATION
      ?AUTO_1977 - CITY
      ?AUTO_1973 - LOCATION
      ?AUTO_1976 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1974 ?AUTO_1975 ) ( IN-CITY ?AUTO_1975 ?AUTO_1977 ) ( IN-CITY ?AUTO_1972 ?AUTO_1977 ) ( not ( = ?AUTO_1972 ?AUTO_1975 ) ) ( AIRPORT ?AUTO_1973 ) ( AIRPORT ?AUTO_1975 ) ( not ( = ?AUTO_1973 ?AUTO_1975 ) ) ( not ( = ?AUTO_1972 ?AUTO_1973 ) ) ( OBJ-AT ?AUTO_1971 ?AUTO_1973 ) ( AIRPLANE-AT ?AUTO_1976 ?AUTO_1975 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1976 ?AUTO_1975 ?AUTO_1973 )
      ( DELIVER-PKG ?AUTO_1971 ?AUTO_1972 )
      ( DELIVER-PKG-VERIFY ?AUTO_1971 ?AUTO_1972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1982 - OBJ
      ?AUTO_1983 - LOCATION
    )
    :vars
    (
      ?AUTO_1985 - TRUCK
      ?AUTO_1984 - LOCATION
      ?AUTO_1986 - CITY
      ?AUTO_1987 - LOCATION
      ?AUTO_1989 - LOCATION
      ?AUTO_1988 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1985 ?AUTO_1984 ) ( IN-CITY ?AUTO_1984 ?AUTO_1986 ) ( IN-CITY ?AUTO_1983 ?AUTO_1986 ) ( not ( = ?AUTO_1983 ?AUTO_1984 ) ) ( AIRPORT ?AUTO_1987 ) ( AIRPORT ?AUTO_1984 ) ( not ( = ?AUTO_1987 ?AUTO_1984 ) ) ( not ( = ?AUTO_1983 ?AUTO_1987 ) ) ( OBJ-AT ?AUTO_1982 ?AUTO_1987 ) ( AIRPORT ?AUTO_1989 ) ( AIRPLANE-AT ?AUTO_1988 ?AUTO_1989 ) ( not ( = ?AUTO_1989 ?AUTO_1984 ) ) ( not ( = ?AUTO_1983 ?AUTO_1989 ) ) ( not ( = ?AUTO_1987 ?AUTO_1989 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1988 ?AUTO_1989 ?AUTO_1984 )
      ( DELIVER-PKG ?AUTO_1982 ?AUTO_1983 )
      ( DELIVER-PKG-VERIFY ?AUTO_1982 ?AUTO_1983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2002 - OBJ
      ?AUTO_2003 - LOCATION
    )
    :vars
    (
      ?AUTO_2005 - TRUCK
      ?AUTO_2006 - LOCATION
      ?AUTO_2007 - CITY
      ?AUTO_2009 - LOCATION
      ?AUTO_2008 - LOCATION
      ?AUTO_2004 - AIRPLANE
      ?AUTO_2010 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2005 ?AUTO_2006 ) ( IN-CITY ?AUTO_2006 ?AUTO_2007 ) ( IN-CITY ?AUTO_2003 ?AUTO_2007 ) ( not ( = ?AUTO_2003 ?AUTO_2006 ) ) ( AIRPORT ?AUTO_2009 ) ( AIRPORT ?AUTO_2006 ) ( not ( = ?AUTO_2009 ?AUTO_2006 ) ) ( not ( = ?AUTO_2003 ?AUTO_2009 ) ) ( AIRPORT ?AUTO_2008 ) ( AIRPLANE-AT ?AUTO_2004 ?AUTO_2008 ) ( not ( = ?AUTO_2008 ?AUTO_2006 ) ) ( not ( = ?AUTO_2003 ?AUTO_2008 ) ) ( not ( = ?AUTO_2009 ?AUTO_2008 ) ) ( TRUCK-AT ?AUTO_2010 ?AUTO_2009 ) ( IN-TRUCK ?AUTO_2002 ?AUTO_2010 ) ( not ( = ?AUTO_2005 ?AUTO_2010 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2002 ?AUTO_2010 ?AUTO_2009 )
      ( DELIVER-PKG ?AUTO_2002 ?AUTO_2003 )
      ( DELIVER-PKG-VERIFY ?AUTO_2002 ?AUTO_2003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2013 - OBJ
      ?AUTO_2014 - LOCATION
    )
    :vars
    (
      ?AUTO_2016 - TRUCK
      ?AUTO_2015 - LOCATION
      ?AUTO_2017 - CITY
      ?AUTO_2020 - LOCATION
      ?AUTO_2019 - LOCATION
      ?AUTO_2021 - AIRPLANE
      ?AUTO_2018 - TRUCK
      ?AUTO_2022 - LOCATION
      ?AUTO_2023 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2016 ?AUTO_2015 ) ( IN-CITY ?AUTO_2015 ?AUTO_2017 ) ( IN-CITY ?AUTO_2014 ?AUTO_2017 ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) ( AIRPORT ?AUTO_2020 ) ( AIRPORT ?AUTO_2015 ) ( not ( = ?AUTO_2020 ?AUTO_2015 ) ) ( not ( = ?AUTO_2014 ?AUTO_2020 ) ) ( AIRPORT ?AUTO_2019 ) ( AIRPLANE-AT ?AUTO_2021 ?AUTO_2019 ) ( not ( = ?AUTO_2019 ?AUTO_2015 ) ) ( not ( = ?AUTO_2014 ?AUTO_2019 ) ) ( not ( = ?AUTO_2020 ?AUTO_2019 ) ) ( IN-TRUCK ?AUTO_2013 ?AUTO_2018 ) ( not ( = ?AUTO_2016 ?AUTO_2018 ) ) ( TRUCK-AT ?AUTO_2018 ?AUTO_2022 ) ( IN-CITY ?AUTO_2022 ?AUTO_2023 ) ( IN-CITY ?AUTO_2020 ?AUTO_2023 ) ( not ( = ?AUTO_2020 ?AUTO_2022 ) ) ( not ( = ?AUTO_2014 ?AUTO_2022 ) ) ( not ( = ?AUTO_2015 ?AUTO_2022 ) ) ( not ( = ?AUTO_2017 ?AUTO_2023 ) ) ( not ( = ?AUTO_2019 ?AUTO_2022 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2018 ?AUTO_2022 ?AUTO_2020 ?AUTO_2023 )
      ( DELIVER-PKG ?AUTO_2013 ?AUTO_2014 )
      ( DELIVER-PKG-VERIFY ?AUTO_2013 ?AUTO_2014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2028 - OBJ
      ?AUTO_2029 - LOCATION
    )
    :vars
    (
      ?AUTO_2036 - TRUCK
      ?AUTO_2037 - LOCATION
      ?AUTO_2038 - CITY
      ?AUTO_2032 - LOCATION
      ?AUTO_2033 - LOCATION
      ?AUTO_2034 - AIRPLANE
      ?AUTO_2031 - TRUCK
      ?AUTO_2035 - LOCATION
      ?AUTO_2030 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2036 ?AUTO_2037 ) ( IN-CITY ?AUTO_2037 ?AUTO_2038 ) ( IN-CITY ?AUTO_2029 ?AUTO_2038 ) ( not ( = ?AUTO_2029 ?AUTO_2037 ) ) ( AIRPORT ?AUTO_2032 ) ( AIRPORT ?AUTO_2037 ) ( not ( = ?AUTO_2032 ?AUTO_2037 ) ) ( not ( = ?AUTO_2029 ?AUTO_2032 ) ) ( AIRPORT ?AUTO_2033 ) ( AIRPLANE-AT ?AUTO_2034 ?AUTO_2033 ) ( not ( = ?AUTO_2033 ?AUTO_2037 ) ) ( not ( = ?AUTO_2029 ?AUTO_2033 ) ) ( not ( = ?AUTO_2032 ?AUTO_2033 ) ) ( not ( = ?AUTO_2036 ?AUTO_2031 ) ) ( TRUCK-AT ?AUTO_2031 ?AUTO_2035 ) ( IN-CITY ?AUTO_2035 ?AUTO_2030 ) ( IN-CITY ?AUTO_2032 ?AUTO_2030 ) ( not ( = ?AUTO_2032 ?AUTO_2035 ) ) ( not ( = ?AUTO_2029 ?AUTO_2035 ) ) ( not ( = ?AUTO_2037 ?AUTO_2035 ) ) ( not ( = ?AUTO_2038 ?AUTO_2030 ) ) ( not ( = ?AUTO_2033 ?AUTO_2035 ) ) ( OBJ-AT ?AUTO_2028 ?AUTO_2035 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2028 ?AUTO_2031 ?AUTO_2035 )
      ( DELIVER-PKG ?AUTO_2028 ?AUTO_2029 )
      ( DELIVER-PKG-VERIFY ?AUTO_2028 ?AUTO_2029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2039 - OBJ
      ?AUTO_2040 - LOCATION
    )
    :vars
    (
      ?AUTO_2042 - TRUCK
      ?AUTO_2046 - LOCATION
      ?AUTO_2045 - CITY
      ?AUTO_2048 - LOCATION
      ?AUTO_2041 - LOCATION
      ?AUTO_2049 - AIRPLANE
      ?AUTO_2044 - TRUCK
      ?AUTO_2043 - LOCATION
      ?AUTO_2047 - CITY
      ?AUTO_2050 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2042 ?AUTO_2046 ) ( IN-CITY ?AUTO_2046 ?AUTO_2045 ) ( IN-CITY ?AUTO_2040 ?AUTO_2045 ) ( not ( = ?AUTO_2040 ?AUTO_2046 ) ) ( AIRPORT ?AUTO_2048 ) ( AIRPORT ?AUTO_2046 ) ( not ( = ?AUTO_2048 ?AUTO_2046 ) ) ( not ( = ?AUTO_2040 ?AUTO_2048 ) ) ( AIRPORT ?AUTO_2041 ) ( AIRPLANE-AT ?AUTO_2049 ?AUTO_2041 ) ( not ( = ?AUTO_2041 ?AUTO_2046 ) ) ( not ( = ?AUTO_2040 ?AUTO_2041 ) ) ( not ( = ?AUTO_2048 ?AUTO_2041 ) ) ( not ( = ?AUTO_2042 ?AUTO_2044 ) ) ( IN-CITY ?AUTO_2043 ?AUTO_2047 ) ( IN-CITY ?AUTO_2048 ?AUTO_2047 ) ( not ( = ?AUTO_2048 ?AUTO_2043 ) ) ( not ( = ?AUTO_2040 ?AUTO_2043 ) ) ( not ( = ?AUTO_2046 ?AUTO_2043 ) ) ( not ( = ?AUTO_2045 ?AUTO_2047 ) ) ( not ( = ?AUTO_2041 ?AUTO_2043 ) ) ( OBJ-AT ?AUTO_2039 ?AUTO_2043 ) ( TRUCK-AT ?AUTO_2044 ?AUTO_2050 ) ( IN-CITY ?AUTO_2050 ?AUTO_2047 ) ( not ( = ?AUTO_2043 ?AUTO_2050 ) ) ( not ( = ?AUTO_2040 ?AUTO_2050 ) ) ( not ( = ?AUTO_2046 ?AUTO_2050 ) ) ( not ( = ?AUTO_2048 ?AUTO_2050 ) ) ( not ( = ?AUTO_2041 ?AUTO_2050 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2044 ?AUTO_2050 ?AUTO_2043 ?AUTO_2047 )
      ( DELIVER-PKG ?AUTO_2039 ?AUTO_2040 )
      ( DELIVER-PKG-VERIFY ?AUTO_2039 ?AUTO_2040 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2053 - OBJ
      ?AUTO_2054 - LOCATION
    )
    :vars
    (
      ?AUTO_2061 - TRUCK
      ?AUTO_2060 - LOCATION
      ?AUTO_2056 - CITY
      ?AUTO_2055 - LOCATION
      ?AUTO_2059 - LOCATION
      ?AUTO_2057 - AIRPLANE
      ?AUTO_2062 - TRUCK
      ?AUTO_2064 - LOCATION
      ?AUTO_2058 - CITY
      ?AUTO_2063 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2061 ?AUTO_2060 ) ( IN-CITY ?AUTO_2060 ?AUTO_2056 ) ( IN-CITY ?AUTO_2054 ?AUTO_2056 ) ( not ( = ?AUTO_2054 ?AUTO_2060 ) ) ( AIRPORT ?AUTO_2055 ) ( AIRPORT ?AUTO_2060 ) ( not ( = ?AUTO_2055 ?AUTO_2060 ) ) ( not ( = ?AUTO_2054 ?AUTO_2055 ) ) ( AIRPORT ?AUTO_2059 ) ( AIRPLANE-AT ?AUTO_2057 ?AUTO_2059 ) ( not ( = ?AUTO_2059 ?AUTO_2060 ) ) ( not ( = ?AUTO_2054 ?AUTO_2059 ) ) ( not ( = ?AUTO_2055 ?AUTO_2059 ) ) ( not ( = ?AUTO_2061 ?AUTO_2062 ) ) ( IN-CITY ?AUTO_2064 ?AUTO_2058 ) ( IN-CITY ?AUTO_2055 ?AUTO_2058 ) ( not ( = ?AUTO_2055 ?AUTO_2064 ) ) ( not ( = ?AUTO_2054 ?AUTO_2064 ) ) ( not ( = ?AUTO_2060 ?AUTO_2064 ) ) ( not ( = ?AUTO_2056 ?AUTO_2058 ) ) ( not ( = ?AUTO_2059 ?AUTO_2064 ) ) ( OBJ-AT ?AUTO_2053 ?AUTO_2064 ) ( IN-CITY ?AUTO_2063 ?AUTO_2058 ) ( not ( = ?AUTO_2064 ?AUTO_2063 ) ) ( not ( = ?AUTO_2054 ?AUTO_2063 ) ) ( not ( = ?AUTO_2060 ?AUTO_2063 ) ) ( not ( = ?AUTO_2055 ?AUTO_2063 ) ) ( not ( = ?AUTO_2059 ?AUTO_2063 ) ) ( TRUCK-AT ?AUTO_2062 ?AUTO_2055 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2062 ?AUTO_2055 ?AUTO_2063 ?AUTO_2058 )
      ( DELIVER-PKG ?AUTO_2053 ?AUTO_2054 )
      ( DELIVER-PKG-VERIFY ?AUTO_2053 ?AUTO_2054 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2065 - OBJ
      ?AUTO_2066 - LOCATION
    )
    :vars
    (
      ?AUTO_2071 - LOCATION
      ?AUTO_2068 - CITY
      ?AUTO_2073 - LOCATION
      ?AUTO_2074 - LOCATION
      ?AUTO_2075 - AIRPLANE
      ?AUTO_2069 - TRUCK
      ?AUTO_2076 - TRUCK
      ?AUTO_2072 - LOCATION
      ?AUTO_2070 - CITY
      ?AUTO_2067 - LOCATION
      ?AUTO_2077 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2071 ?AUTO_2068 ) ( IN-CITY ?AUTO_2066 ?AUTO_2068 ) ( not ( = ?AUTO_2066 ?AUTO_2071 ) ) ( AIRPORT ?AUTO_2073 ) ( AIRPORT ?AUTO_2071 ) ( not ( = ?AUTO_2073 ?AUTO_2071 ) ) ( not ( = ?AUTO_2066 ?AUTO_2073 ) ) ( AIRPORT ?AUTO_2074 ) ( AIRPLANE-AT ?AUTO_2075 ?AUTO_2074 ) ( not ( = ?AUTO_2074 ?AUTO_2071 ) ) ( not ( = ?AUTO_2066 ?AUTO_2074 ) ) ( not ( = ?AUTO_2073 ?AUTO_2074 ) ) ( not ( = ?AUTO_2069 ?AUTO_2076 ) ) ( IN-CITY ?AUTO_2072 ?AUTO_2070 ) ( IN-CITY ?AUTO_2073 ?AUTO_2070 ) ( not ( = ?AUTO_2073 ?AUTO_2072 ) ) ( not ( = ?AUTO_2066 ?AUTO_2072 ) ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) ( not ( = ?AUTO_2068 ?AUTO_2070 ) ) ( not ( = ?AUTO_2074 ?AUTO_2072 ) ) ( OBJ-AT ?AUTO_2065 ?AUTO_2072 ) ( IN-CITY ?AUTO_2067 ?AUTO_2070 ) ( not ( = ?AUTO_2072 ?AUTO_2067 ) ) ( not ( = ?AUTO_2066 ?AUTO_2067 ) ) ( not ( = ?AUTO_2071 ?AUTO_2067 ) ) ( not ( = ?AUTO_2073 ?AUTO_2067 ) ) ( not ( = ?AUTO_2074 ?AUTO_2067 ) ) ( TRUCK-AT ?AUTO_2076 ?AUTO_2073 ) ( TRUCK-AT ?AUTO_2069 ?AUTO_2077 ) ( IN-CITY ?AUTO_2077 ?AUTO_2068 ) ( not ( = ?AUTO_2071 ?AUTO_2077 ) ) ( not ( = ?AUTO_2066 ?AUTO_2077 ) ) ( not ( = ?AUTO_2073 ?AUTO_2077 ) ) ( not ( = ?AUTO_2074 ?AUTO_2077 ) ) ( not ( = ?AUTO_2072 ?AUTO_2077 ) ) ( not ( = ?AUTO_2067 ?AUTO_2077 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2069 ?AUTO_2077 ?AUTO_2071 ?AUTO_2068 )
      ( DELIVER-PKG ?AUTO_2065 ?AUTO_2066 )
      ( DELIVER-PKG-VERIFY ?AUTO_2065 ?AUTO_2066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2088 - OBJ
      ?AUTO_2089 - LOCATION
    )
    :vars
    (
      ?AUTO_2090 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2090 ?AUTO_2089 ) ( IN-TRUCK ?AUTO_2088 ?AUTO_2090 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2088 ?AUTO_2090 ?AUTO_2089 )
      ( DELIVER-PKG-VERIFY ?AUTO_2088 ?AUTO_2089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2097 - OBJ
      ?AUTO_2098 - LOCATION
    )
    :vars
    (
      ?AUTO_2100 - TRUCK
      ?AUTO_2099 - LOCATION
      ?AUTO_2101 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2100 ?AUTO_2099 ) ( IN-CITY ?AUTO_2099 ?AUTO_2101 ) ( IN-CITY ?AUTO_2098 ?AUTO_2101 ) ( not ( = ?AUTO_2098 ?AUTO_2099 ) ) ( OBJ-AT ?AUTO_2097 ?AUTO_2099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2097 ?AUTO_2100 ?AUTO_2099 )
      ( DELIVER-PKG ?AUTO_2097 ?AUTO_2098 )
      ( DELIVER-PKG-VERIFY ?AUTO_2097 ?AUTO_2098 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2104 - OBJ
      ?AUTO_2105 - LOCATION
    )
    :vars
    (
      ?AUTO_2106 - TRUCK
      ?AUTO_2107 - LOCATION
      ?AUTO_2108 - CITY
      ?AUTO_2109 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2106 ?AUTO_2107 ) ( IN-CITY ?AUTO_2107 ?AUTO_2108 ) ( IN-CITY ?AUTO_2105 ?AUTO_2108 ) ( not ( = ?AUTO_2105 ?AUTO_2107 ) ) ( IN-AIRPLANE ?AUTO_2104 ?AUTO_2109 ) ( AIRPLANE-AT ?AUTO_2109 ?AUTO_2107 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2104 ?AUTO_2109 ?AUTO_2107 )
      ( DELIVER-PKG ?AUTO_2104 ?AUTO_2105 )
      ( DELIVER-PKG-VERIFY ?AUTO_2104 ?AUTO_2105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2118 - OBJ
      ?AUTO_2119 - LOCATION
    )
    :vars
    (
      ?AUTO_2122 - TRUCK
      ?AUTO_2120 - LOCATION
      ?AUTO_2123 - CITY
      ?AUTO_2121 - LOCATION
      ?AUTO_2124 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2122 ?AUTO_2120 ) ( IN-CITY ?AUTO_2120 ?AUTO_2123 ) ( IN-CITY ?AUTO_2119 ?AUTO_2123 ) ( not ( = ?AUTO_2119 ?AUTO_2120 ) ) ( AIRPORT ?AUTO_2121 ) ( AIRPORT ?AUTO_2120 ) ( AIRPLANE-AT ?AUTO_2124 ?AUTO_2121 ) ( not ( = ?AUTO_2121 ?AUTO_2120 ) ) ( not ( = ?AUTO_2119 ?AUTO_2121 ) ) ( OBJ-AT ?AUTO_2118 ?AUTO_2121 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2118 ?AUTO_2124 ?AUTO_2121 )
      ( DELIVER-PKG ?AUTO_2118 ?AUTO_2119 )
      ( DELIVER-PKG-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2147 - OBJ
      ?AUTO_2148 - LOCATION
    )
    :vars
    (
      ?AUTO_2151 - TRUCK
      ?AUTO_2149 - LOCATION
      ?AUTO_2152 - CITY
      ?AUTO_2154 - LOCATION
      ?AUTO_2153 - LOCATION
      ?AUTO_2150 - AIRPLANE
      ?AUTO_2155 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2151 ?AUTO_2149 ) ( IN-CITY ?AUTO_2149 ?AUTO_2152 ) ( IN-CITY ?AUTO_2148 ?AUTO_2152 ) ( not ( = ?AUTO_2148 ?AUTO_2149 ) ) ( AIRPORT ?AUTO_2154 ) ( AIRPORT ?AUTO_2149 ) ( not ( = ?AUTO_2154 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2154 ) ) ( AIRPORT ?AUTO_2153 ) ( AIRPLANE-AT ?AUTO_2150 ?AUTO_2153 ) ( not ( = ?AUTO_2153 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2153 ) ) ( not ( = ?AUTO_2154 ?AUTO_2153 ) ) ( TRUCK-AT ?AUTO_2155 ?AUTO_2154 ) ( IN-TRUCK ?AUTO_2147 ?AUTO_2155 ) ( not ( = ?AUTO_2151 ?AUTO_2155 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2147 ?AUTO_2155 ?AUTO_2154 )
      ( DELIVER-PKG ?AUTO_2147 ?AUTO_2148 )
      ( DELIVER-PKG-VERIFY ?AUTO_2147 ?AUTO_2148 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2164 - OBJ
      ?AUTO_2165 - LOCATION
    )
    :vars
    (
      ?AUTO_2171 - TRUCK
      ?AUTO_2172 - LOCATION
      ?AUTO_2168 - CITY
      ?AUTO_2174 - LOCATION
      ?AUTO_2169 - LOCATION
      ?AUTO_2170 - AIRPLANE
      ?AUTO_2167 - TRUCK
      ?AUTO_2173 - LOCATION
      ?AUTO_2166 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2171 ?AUTO_2172 ) ( IN-CITY ?AUTO_2172 ?AUTO_2168 ) ( IN-CITY ?AUTO_2165 ?AUTO_2168 ) ( not ( = ?AUTO_2165 ?AUTO_2172 ) ) ( AIRPORT ?AUTO_2174 ) ( AIRPORT ?AUTO_2172 ) ( not ( = ?AUTO_2174 ?AUTO_2172 ) ) ( not ( = ?AUTO_2165 ?AUTO_2174 ) ) ( AIRPORT ?AUTO_2169 ) ( AIRPLANE-AT ?AUTO_2170 ?AUTO_2169 ) ( not ( = ?AUTO_2169 ?AUTO_2172 ) ) ( not ( = ?AUTO_2165 ?AUTO_2169 ) ) ( not ( = ?AUTO_2174 ?AUTO_2169 ) ) ( not ( = ?AUTO_2171 ?AUTO_2167 ) ) ( TRUCK-AT ?AUTO_2167 ?AUTO_2173 ) ( IN-CITY ?AUTO_2173 ?AUTO_2166 ) ( IN-CITY ?AUTO_2174 ?AUTO_2166 ) ( not ( = ?AUTO_2174 ?AUTO_2173 ) ) ( not ( = ?AUTO_2165 ?AUTO_2173 ) ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) ( not ( = ?AUTO_2168 ?AUTO_2166 ) ) ( not ( = ?AUTO_2169 ?AUTO_2173 ) ) ( OBJ-AT ?AUTO_2164 ?AUTO_2173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2164 ?AUTO_2167 ?AUTO_2173 )
      ( DELIVER-PKG ?AUTO_2164 ?AUTO_2165 )
      ( DELIVER-PKG-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2195 - OBJ
      ?AUTO_2196 - LOCATION
    )
    :vars
    (
      ?AUTO_2197 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2197 ?AUTO_2196 ) ( IN-TRUCK ?AUTO_2195 ?AUTO_2197 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2195 ?AUTO_2197 ?AUTO_2196 )
      ( DELIVER-PKG-VERIFY ?AUTO_2195 ?AUTO_2196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2198 - OBJ
      ?AUTO_2199 - LOCATION
    )
    :vars
    (
      ?AUTO_2200 - TRUCK
      ?AUTO_2201 - LOCATION
      ?AUTO_2202 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2198 ?AUTO_2200 ) ( TRUCK-AT ?AUTO_2200 ?AUTO_2201 ) ( IN-CITY ?AUTO_2201 ?AUTO_2202 ) ( IN-CITY ?AUTO_2199 ?AUTO_2202 ) ( not ( = ?AUTO_2199 ?AUTO_2201 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2200 ?AUTO_2201 ?AUTO_2199 ?AUTO_2202 )
      ( DELIVER-PKG ?AUTO_2198 ?AUTO_2199 )
      ( DELIVER-PKG-VERIFY ?AUTO_2198 ?AUTO_2199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2281 - OBJ
      ?AUTO_2282 - LOCATION
    )
    :vars
    (
      ?AUTO_2283 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2281 ?AUTO_2283 ) ( AIRPLANE-AT ?AUTO_2283 ?AUTO_2282 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2281 ?AUTO_2283 ?AUTO_2282 )
      ( DELIVER-PKG-VERIFY ?AUTO_2281 ?AUTO_2282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2284 - OBJ
      ?AUTO_2285 - LOCATION
    )
    :vars
    (
      ?AUTO_2286 - AIRPLANE
      ?AUTO_2287 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2284 ?AUTO_2286 ) ( AIRPORT ?AUTO_2287 ) ( AIRPORT ?AUTO_2285 ) ( AIRPLANE-AT ?AUTO_2286 ?AUTO_2287 ) ( not ( = ?AUTO_2287 ?AUTO_2285 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2286 ?AUTO_2287 ?AUTO_2285 )
      ( DELIVER-PKG ?AUTO_2284 ?AUTO_2285 )
      ( DELIVER-PKG-VERIFY ?AUTO_2284 ?AUTO_2285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2288 - OBJ
      ?AUTO_2289 - LOCATION
    )
    :vars
    (
      ?AUTO_2291 - LOCATION
      ?AUTO_2290 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2291 ) ( AIRPORT ?AUTO_2289 ) ( AIRPLANE-AT ?AUTO_2290 ?AUTO_2291 ) ( not ( = ?AUTO_2291 ?AUTO_2289 ) ) ( OBJ-AT ?AUTO_2288 ?AUTO_2291 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2288 ?AUTO_2290 ?AUTO_2291 )
      ( DELIVER-PKG ?AUTO_2288 ?AUTO_2289 )
      ( DELIVER-PKG-VERIFY ?AUTO_2288 ?AUTO_2289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2292 - OBJ
      ?AUTO_2293 - LOCATION
    )
    :vars
    (
      ?AUTO_2294 - LOCATION
      ?AUTO_2295 - AIRPLANE
      ?AUTO_2296 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2294 ) ( AIRPORT ?AUTO_2293 ) ( AIRPLANE-AT ?AUTO_2295 ?AUTO_2294 ) ( not ( = ?AUTO_2294 ?AUTO_2293 ) ) ( TRUCK-AT ?AUTO_2296 ?AUTO_2294 ) ( IN-TRUCK ?AUTO_2292 ?AUTO_2296 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2292 ?AUTO_2296 ?AUTO_2294 )
      ( DELIVER-PKG ?AUTO_2292 ?AUTO_2293 )
      ( DELIVER-PKG-VERIFY ?AUTO_2292 ?AUTO_2293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2297 - OBJ
      ?AUTO_2298 - LOCATION
    )
    :vars
    (
      ?AUTO_2299 - LOCATION
      ?AUTO_2300 - AIRPLANE
      ?AUTO_2301 - TRUCK
      ?AUTO_2302 - LOCATION
      ?AUTO_2303 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2299 ) ( AIRPORT ?AUTO_2298 ) ( AIRPLANE-AT ?AUTO_2300 ?AUTO_2299 ) ( not ( = ?AUTO_2299 ?AUTO_2298 ) ) ( IN-TRUCK ?AUTO_2297 ?AUTO_2301 ) ( TRUCK-AT ?AUTO_2301 ?AUTO_2302 ) ( IN-CITY ?AUTO_2302 ?AUTO_2303 ) ( IN-CITY ?AUTO_2299 ?AUTO_2303 ) ( not ( = ?AUTO_2299 ?AUTO_2302 ) ) ( not ( = ?AUTO_2298 ?AUTO_2302 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2301 ?AUTO_2302 ?AUTO_2299 ?AUTO_2303 )
      ( DELIVER-PKG ?AUTO_2297 ?AUTO_2298 )
      ( DELIVER-PKG-VERIFY ?AUTO_2297 ?AUTO_2298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2320 - OBJ
      ?AUTO_2321 - LOCATION
    )
    :vars
    (
      ?AUTO_2324 - LOCATION
      ?AUTO_2325 - TRUCK
      ?AUTO_2326 - LOCATION
      ?AUTO_2323 - CITY
      ?AUTO_2322 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2324 ) ( AIRPORT ?AUTO_2321 ) ( not ( = ?AUTO_2324 ?AUTO_2321 ) ) ( IN-TRUCK ?AUTO_2320 ?AUTO_2325 ) ( TRUCK-AT ?AUTO_2325 ?AUTO_2326 ) ( IN-CITY ?AUTO_2326 ?AUTO_2323 ) ( IN-CITY ?AUTO_2324 ?AUTO_2323 ) ( not ( = ?AUTO_2324 ?AUTO_2326 ) ) ( not ( = ?AUTO_2321 ?AUTO_2326 ) ) ( AIRPLANE-AT ?AUTO_2322 ?AUTO_2321 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2322 ?AUTO_2321 ?AUTO_2324 )
      ( DELIVER-PKG ?AUTO_2320 ?AUTO_2321 )
      ( DELIVER-PKG-VERIFY ?AUTO_2320 ?AUTO_2321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2343 - OBJ
      ?AUTO_2344 - LOCATION
    )
    :vars
    (
      ?AUTO_2348 - LOCATION
      ?AUTO_2345 - TRUCK
      ?AUTO_2346 - LOCATION
      ?AUTO_2347 - CITY
      ?AUTO_2350 - LOCATION
      ?AUTO_2349 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2348 ) ( AIRPORT ?AUTO_2344 ) ( not ( = ?AUTO_2348 ?AUTO_2344 ) ) ( IN-TRUCK ?AUTO_2343 ?AUTO_2345 ) ( TRUCK-AT ?AUTO_2345 ?AUTO_2346 ) ( IN-CITY ?AUTO_2346 ?AUTO_2347 ) ( IN-CITY ?AUTO_2348 ?AUTO_2347 ) ( not ( = ?AUTO_2348 ?AUTO_2346 ) ) ( not ( = ?AUTO_2344 ?AUTO_2346 ) ) ( AIRPORT ?AUTO_2350 ) ( AIRPLANE-AT ?AUTO_2349 ?AUTO_2350 ) ( not ( = ?AUTO_2350 ?AUTO_2348 ) ) ( not ( = ?AUTO_2344 ?AUTO_2350 ) ) ( not ( = ?AUTO_2346 ?AUTO_2350 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2349 ?AUTO_2350 ?AUTO_2348 )
      ( DELIVER-PKG ?AUTO_2343 ?AUTO_2344 )
      ( DELIVER-PKG-VERIFY ?AUTO_2343 ?AUTO_2344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2393 - OBJ
      ?AUTO_2394 - LOCATION
    )
    :vars
    (
      ?AUTO_2395 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2395 ?AUTO_2394 ) ( IN-TRUCK ?AUTO_2393 ?AUTO_2395 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2393 ?AUTO_2395 ?AUTO_2394 )
      ( DELIVER-PKG-VERIFY ?AUTO_2393 ?AUTO_2394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2400 - OBJ
      ?AUTO_2401 - LOCATION
    )
    :vars
    (
      ?AUTO_2402 - TRUCK
      ?AUTO_2403 - LOCATION
      ?AUTO_2404 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2400 ?AUTO_2402 ) ( TRUCK-AT ?AUTO_2402 ?AUTO_2403 ) ( IN-CITY ?AUTO_2403 ?AUTO_2404 ) ( IN-CITY ?AUTO_2401 ?AUTO_2404 ) ( not ( = ?AUTO_2401 ?AUTO_2403 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2402 ?AUTO_2403 ?AUTO_2401 ?AUTO_2404 )
      ( DELIVER-PKG ?AUTO_2400 ?AUTO_2401 )
      ( DELIVER-PKG-VERIFY ?AUTO_2400 ?AUTO_2401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2405 - OBJ
      ?AUTO_2406 - LOCATION
    )
    :vars
    (
      ?AUTO_2407 - TRUCK
      ?AUTO_2408 - LOCATION
      ?AUTO_2409 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2407 ?AUTO_2408 ) ( IN-CITY ?AUTO_2408 ?AUTO_2409 ) ( IN-CITY ?AUTO_2406 ?AUTO_2409 ) ( not ( = ?AUTO_2406 ?AUTO_2408 ) ) ( OBJ-AT ?AUTO_2405 ?AUTO_2408 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2405 ?AUTO_2407 ?AUTO_2408 )
      ( DELIVER-PKG ?AUTO_2405 ?AUTO_2406 )
      ( DELIVER-PKG-VERIFY ?AUTO_2405 ?AUTO_2406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2418 - OBJ
      ?AUTO_2419 - LOCATION
    )
    :vars
    (
      ?AUTO_2421 - LOCATION
      ?AUTO_2422 - CITY
      ?AUTO_2420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2421 ?AUTO_2422 ) ( IN-CITY ?AUTO_2419 ?AUTO_2422 ) ( not ( = ?AUTO_2419 ?AUTO_2421 ) ) ( OBJ-AT ?AUTO_2418 ?AUTO_2421 ) ( TRUCK-AT ?AUTO_2420 ?AUTO_2419 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2420 ?AUTO_2419 ?AUTO_2421 ?AUTO_2422 )
      ( DELIVER-PKG ?AUTO_2418 ?AUTO_2419 )
      ( DELIVER-PKG-VERIFY ?AUTO_2418 ?AUTO_2419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2427 - OBJ
      ?AUTO_2428 - LOCATION
    )
    :vars
    (
      ?AUTO_2430 - LOCATION
      ?AUTO_2429 - CITY
      ?AUTO_2431 - TRUCK
      ?AUTO_2432 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2430 ?AUTO_2429 ) ( IN-CITY ?AUTO_2428 ?AUTO_2429 ) ( not ( = ?AUTO_2428 ?AUTO_2430 ) ) ( TRUCK-AT ?AUTO_2431 ?AUTO_2428 ) ( IN-AIRPLANE ?AUTO_2427 ?AUTO_2432 ) ( AIRPLANE-AT ?AUTO_2432 ?AUTO_2430 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2427 ?AUTO_2432 ?AUTO_2430 )
      ( DELIVER-PKG ?AUTO_2427 ?AUTO_2428 )
      ( DELIVER-PKG-VERIFY ?AUTO_2427 ?AUTO_2428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2505 - OBJ
      ?AUTO_2506 - LOCATION
    )
    :vars
    (
      ?AUTO_2507 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2507 ?AUTO_2506 ) ( IN-TRUCK ?AUTO_2505 ?AUTO_2507 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2505 ?AUTO_2507 ?AUTO_2506 )
      ( DELIVER-PKG-VERIFY ?AUTO_2505 ?AUTO_2506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2510 - OBJ
      ?AUTO_2511 - LOCATION
    )
    :vars
    (
      ?AUTO_2512 - TRUCK
      ?AUTO_2513 - LOCATION
      ?AUTO_2514 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2510 ?AUTO_2512 ) ( TRUCK-AT ?AUTO_2512 ?AUTO_2513 ) ( IN-CITY ?AUTO_2513 ?AUTO_2514 ) ( IN-CITY ?AUTO_2511 ?AUTO_2514 ) ( not ( = ?AUTO_2511 ?AUTO_2513 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2512 ?AUTO_2513 ?AUTO_2511 ?AUTO_2514 )
      ( DELIVER-PKG ?AUTO_2510 ?AUTO_2511 )
      ( DELIVER-PKG-VERIFY ?AUTO_2510 ?AUTO_2511 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2609 - OBJ
      ?AUTO_2610 - LOCATION
    )
    :vars
    (
      ?AUTO_2611 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2611 ?AUTO_2610 ) ( IN-TRUCK ?AUTO_2609 ?AUTO_2611 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2609 ?AUTO_2611 ?AUTO_2610 )
      ( DELIVER-PKG-VERIFY ?AUTO_2609 ?AUTO_2610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2686 - OBJ
      ?AUTO_2687 - LOCATION
    )
    :vars
    (
      ?AUTO_2690 - LOCATION
      ?AUTO_2692 - CITY
      ?AUTO_2688 - LOCATION
      ?AUTO_2689 - LOCATION
      ?AUTO_2693 - AIRPLANE
      ?AUTO_2691 - TRUCK
      ?AUTO_2694 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2690 ?AUTO_2692 ) ( IN-CITY ?AUTO_2687 ?AUTO_2692 ) ( not ( = ?AUTO_2687 ?AUTO_2690 ) ) ( AIRPORT ?AUTO_2688 ) ( AIRPORT ?AUTO_2690 ) ( not ( = ?AUTO_2688 ?AUTO_2690 ) ) ( not ( = ?AUTO_2687 ?AUTO_2688 ) ) ( OBJ-AT ?AUTO_2686 ?AUTO_2688 ) ( AIRPORT ?AUTO_2689 ) ( AIRPLANE-AT ?AUTO_2693 ?AUTO_2689 ) ( not ( = ?AUTO_2689 ?AUTO_2690 ) ) ( not ( = ?AUTO_2687 ?AUTO_2689 ) ) ( not ( = ?AUTO_2688 ?AUTO_2689 ) ) ( TRUCK-AT ?AUTO_2691 ?AUTO_2694 ) ( IN-CITY ?AUTO_2694 ?AUTO_2692 ) ( not ( = ?AUTO_2690 ?AUTO_2694 ) ) ( not ( = ?AUTO_2687 ?AUTO_2694 ) ) ( not ( = ?AUTO_2688 ?AUTO_2694 ) ) ( not ( = ?AUTO_2689 ?AUTO_2694 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2691 ?AUTO_2694 ?AUTO_2690 ?AUTO_2692 )
      ( DELIVER-PKG ?AUTO_2686 ?AUTO_2687 )
      ( DELIVER-PKG-VERIFY ?AUTO_2686 ?AUTO_2687 ) )
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
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2721 ?AUTO_2720 ) ( IN-TRUCK ?AUTO_2719 ?AUTO_2721 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2719 ?AUTO_2721 ?AUTO_2720 )
      ( DELIVER-PKG-VERIFY ?AUTO_2719 ?AUTO_2720 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2730 - OBJ
      ?AUTO_2731 - LOCATION
    )
    :vars
    (
      ?AUTO_2733 - TRUCK
      ?AUTO_2734 - LOCATION
      ?AUTO_2732 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2733 ?AUTO_2734 ) ( IN-CITY ?AUTO_2734 ?AUTO_2732 ) ( IN-CITY ?AUTO_2731 ?AUTO_2732 ) ( not ( = ?AUTO_2731 ?AUTO_2734 ) ) ( OBJ-AT ?AUTO_2730 ?AUTO_2734 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2730 ?AUTO_2733 ?AUTO_2734 )
      ( DELIVER-PKG ?AUTO_2730 ?AUTO_2731 )
      ( DELIVER-PKG-VERIFY ?AUTO_2730 ?AUTO_2731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2739 - OBJ
      ?AUTO_2740 - LOCATION
    )
    :vars
    (
      ?AUTO_2742 - TRUCK
      ?AUTO_2743 - LOCATION
      ?AUTO_2741 - CITY
      ?AUTO_2744 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2742 ?AUTO_2743 ) ( IN-CITY ?AUTO_2743 ?AUTO_2741 ) ( IN-CITY ?AUTO_2740 ?AUTO_2741 ) ( not ( = ?AUTO_2740 ?AUTO_2743 ) ) ( IN-AIRPLANE ?AUTO_2739 ?AUTO_2744 ) ( AIRPLANE-AT ?AUTO_2744 ?AUTO_2743 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2739 ?AUTO_2744 ?AUTO_2743 )
      ( DELIVER-PKG ?AUTO_2739 ?AUTO_2740 )
      ( DELIVER-PKG-VERIFY ?AUTO_2739 ?AUTO_2740 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2745 - OBJ
      ?AUTO_2746 - LOCATION
    )
    :vars
    (
      ?AUTO_2747 - TRUCK
      ?AUTO_2748 - LOCATION
      ?AUTO_2749 - CITY
      ?AUTO_2750 - AIRPLANE
      ?AUTO_2751 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2747 ?AUTO_2748 ) ( IN-CITY ?AUTO_2748 ?AUTO_2749 ) ( IN-CITY ?AUTO_2746 ?AUTO_2749 ) ( not ( = ?AUTO_2746 ?AUTO_2748 ) ) ( IN-AIRPLANE ?AUTO_2745 ?AUTO_2750 ) ( AIRPORT ?AUTO_2751 ) ( AIRPORT ?AUTO_2748 ) ( AIRPLANE-AT ?AUTO_2750 ?AUTO_2751 ) ( not ( = ?AUTO_2751 ?AUTO_2748 ) ) ( not ( = ?AUTO_2746 ?AUTO_2751 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2750 ?AUTO_2751 ?AUTO_2748 )
      ( DELIVER-PKG ?AUTO_2745 ?AUTO_2746 )
      ( DELIVER-PKG-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2752 - OBJ
      ?AUTO_2753 - LOCATION
    )
    :vars
    (
      ?AUTO_2755 - TRUCK
      ?AUTO_2754 - LOCATION
      ?AUTO_2757 - CITY
      ?AUTO_2758 - LOCATION
      ?AUTO_2756 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2755 ?AUTO_2754 ) ( IN-CITY ?AUTO_2754 ?AUTO_2757 ) ( IN-CITY ?AUTO_2753 ?AUTO_2757 ) ( not ( = ?AUTO_2753 ?AUTO_2754 ) ) ( AIRPORT ?AUTO_2758 ) ( AIRPORT ?AUTO_2754 ) ( AIRPLANE-AT ?AUTO_2756 ?AUTO_2758 ) ( not ( = ?AUTO_2758 ?AUTO_2754 ) ) ( not ( = ?AUTO_2753 ?AUTO_2758 ) ) ( OBJ-AT ?AUTO_2752 ?AUTO_2758 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2752 ?AUTO_2756 ?AUTO_2758 )
      ( DELIVER-PKG ?AUTO_2752 ?AUTO_2753 )
      ( DELIVER-PKG-VERIFY ?AUTO_2752 ?AUTO_2753 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2759 - OBJ
      ?AUTO_2760 - LOCATION
    )
    :vars
    (
      ?AUTO_2765 - TRUCK
      ?AUTO_2764 - LOCATION
      ?AUTO_2762 - CITY
      ?AUTO_2763 - LOCATION
      ?AUTO_2761 - AIRPLANE
      ?AUTO_2766 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2765 ?AUTO_2764 ) ( IN-CITY ?AUTO_2764 ?AUTO_2762 ) ( IN-CITY ?AUTO_2760 ?AUTO_2762 ) ( not ( = ?AUTO_2760 ?AUTO_2764 ) ) ( AIRPORT ?AUTO_2763 ) ( AIRPORT ?AUTO_2764 ) ( AIRPLANE-AT ?AUTO_2761 ?AUTO_2763 ) ( not ( = ?AUTO_2763 ?AUTO_2764 ) ) ( not ( = ?AUTO_2760 ?AUTO_2763 ) ) ( TRUCK-AT ?AUTO_2766 ?AUTO_2763 ) ( IN-TRUCK ?AUTO_2759 ?AUTO_2766 ) ( not ( = ?AUTO_2765 ?AUTO_2766 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2759 ?AUTO_2766 ?AUTO_2763 )
      ( DELIVER-PKG ?AUTO_2759 ?AUTO_2760 )
      ( DELIVER-PKG-VERIFY ?AUTO_2759 ?AUTO_2760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2767 - OBJ
      ?AUTO_2768 - LOCATION
    )
    :vars
    (
      ?AUTO_2770 - TRUCK
      ?AUTO_2773 - LOCATION
      ?AUTO_2771 - CITY
      ?AUTO_2769 - LOCATION
      ?AUTO_2772 - AIRPLANE
      ?AUTO_2774 - TRUCK
      ?AUTO_2775 - LOCATION
      ?AUTO_2776 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2770 ?AUTO_2773 ) ( IN-CITY ?AUTO_2773 ?AUTO_2771 ) ( IN-CITY ?AUTO_2768 ?AUTO_2771 ) ( not ( = ?AUTO_2768 ?AUTO_2773 ) ) ( AIRPORT ?AUTO_2769 ) ( AIRPORT ?AUTO_2773 ) ( AIRPLANE-AT ?AUTO_2772 ?AUTO_2769 ) ( not ( = ?AUTO_2769 ?AUTO_2773 ) ) ( not ( = ?AUTO_2768 ?AUTO_2769 ) ) ( IN-TRUCK ?AUTO_2767 ?AUTO_2774 ) ( not ( = ?AUTO_2770 ?AUTO_2774 ) ) ( TRUCK-AT ?AUTO_2774 ?AUTO_2775 ) ( IN-CITY ?AUTO_2775 ?AUTO_2776 ) ( IN-CITY ?AUTO_2769 ?AUTO_2776 ) ( not ( = ?AUTO_2769 ?AUTO_2775 ) ) ( not ( = ?AUTO_2768 ?AUTO_2775 ) ) ( not ( = ?AUTO_2773 ?AUTO_2775 ) ) ( not ( = ?AUTO_2771 ?AUTO_2776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2774 ?AUTO_2775 ?AUTO_2769 ?AUTO_2776 )
      ( DELIVER-PKG ?AUTO_2767 ?AUTO_2768 )
      ( DELIVER-PKG-VERIFY ?AUTO_2767 ?AUTO_2768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2793 - OBJ
      ?AUTO_2794 - LOCATION
    )
    :vars
    (
      ?AUTO_2802 - TRUCK
      ?AUTO_2797 - LOCATION
      ?AUTO_2800 - CITY
      ?AUTO_2801 - LOCATION
      ?AUTO_2795 - TRUCK
      ?AUTO_2796 - LOCATION
      ?AUTO_2799 - CITY
      ?AUTO_2798 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2802 ?AUTO_2797 ) ( IN-CITY ?AUTO_2797 ?AUTO_2800 ) ( IN-CITY ?AUTO_2794 ?AUTO_2800 ) ( not ( = ?AUTO_2794 ?AUTO_2797 ) ) ( AIRPORT ?AUTO_2801 ) ( AIRPORT ?AUTO_2797 ) ( not ( = ?AUTO_2801 ?AUTO_2797 ) ) ( not ( = ?AUTO_2794 ?AUTO_2801 ) ) ( IN-TRUCK ?AUTO_2793 ?AUTO_2795 ) ( not ( = ?AUTO_2802 ?AUTO_2795 ) ) ( TRUCK-AT ?AUTO_2795 ?AUTO_2796 ) ( IN-CITY ?AUTO_2796 ?AUTO_2799 ) ( IN-CITY ?AUTO_2801 ?AUTO_2799 ) ( not ( = ?AUTO_2801 ?AUTO_2796 ) ) ( not ( = ?AUTO_2794 ?AUTO_2796 ) ) ( not ( = ?AUTO_2797 ?AUTO_2796 ) ) ( not ( = ?AUTO_2800 ?AUTO_2799 ) ) ( AIRPLANE-AT ?AUTO_2798 ?AUTO_2797 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2798 ?AUTO_2797 ?AUTO_2801 )
      ( DELIVER-PKG ?AUTO_2793 ?AUTO_2794 )
      ( DELIVER-PKG-VERIFY ?AUTO_2793 ?AUTO_2794 ) )
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
      ?AUTO_2827 - LOCATION
      ?AUTO_2823 - CITY
      ?AUTO_2828 - LOCATION
      ?AUTO_2826 - TRUCK
      ?AUTO_2824 - LOCATION
      ?AUTO_2822 - CITY
      ?AUTO_2829 - LOCATION
      ?AUTO_2825 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2821 ?AUTO_2827 ) ( IN-CITY ?AUTO_2827 ?AUTO_2823 ) ( IN-CITY ?AUTO_2820 ?AUTO_2823 ) ( not ( = ?AUTO_2820 ?AUTO_2827 ) ) ( AIRPORT ?AUTO_2828 ) ( AIRPORT ?AUTO_2827 ) ( not ( = ?AUTO_2828 ?AUTO_2827 ) ) ( not ( = ?AUTO_2820 ?AUTO_2828 ) ) ( IN-TRUCK ?AUTO_2819 ?AUTO_2826 ) ( not ( = ?AUTO_2821 ?AUTO_2826 ) ) ( TRUCK-AT ?AUTO_2826 ?AUTO_2824 ) ( IN-CITY ?AUTO_2824 ?AUTO_2822 ) ( IN-CITY ?AUTO_2828 ?AUTO_2822 ) ( not ( = ?AUTO_2828 ?AUTO_2824 ) ) ( not ( = ?AUTO_2820 ?AUTO_2824 ) ) ( not ( = ?AUTO_2827 ?AUTO_2824 ) ) ( not ( = ?AUTO_2823 ?AUTO_2822 ) ) ( AIRPORT ?AUTO_2829 ) ( AIRPLANE-AT ?AUTO_2825 ?AUTO_2829 ) ( not ( = ?AUTO_2829 ?AUTO_2828 ) ) ( not ( = ?AUTO_2820 ?AUTO_2829 ) ) ( not ( = ?AUTO_2827 ?AUTO_2829 ) ) ( not ( = ?AUTO_2824 ?AUTO_2829 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2825 ?AUTO_2829 ?AUTO_2828 )
      ( DELIVER-PKG ?AUTO_2819 ?AUTO_2820 )
      ( DELIVER-PKG-VERIFY ?AUTO_2819 ?AUTO_2820 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2846 - OBJ
      ?AUTO_2847 - LOCATION
    )
    :vars
    (
      ?AUTO_2856 - LOCATION
      ?AUTO_2854 - CITY
      ?AUTO_2852 - LOCATION
      ?AUTO_2855 - TRUCK
      ?AUTO_2849 - TRUCK
      ?AUTO_2851 - LOCATION
      ?AUTO_2848 - CITY
      ?AUTO_2853 - LOCATION
      ?AUTO_2850 - AIRPLANE
      ?AUTO_2857 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2856 ?AUTO_2854 ) ( IN-CITY ?AUTO_2847 ?AUTO_2854 ) ( not ( = ?AUTO_2847 ?AUTO_2856 ) ) ( AIRPORT ?AUTO_2852 ) ( AIRPORT ?AUTO_2856 ) ( not ( = ?AUTO_2852 ?AUTO_2856 ) ) ( not ( = ?AUTO_2847 ?AUTO_2852 ) ) ( IN-TRUCK ?AUTO_2846 ?AUTO_2855 ) ( not ( = ?AUTO_2849 ?AUTO_2855 ) ) ( TRUCK-AT ?AUTO_2855 ?AUTO_2851 ) ( IN-CITY ?AUTO_2851 ?AUTO_2848 ) ( IN-CITY ?AUTO_2852 ?AUTO_2848 ) ( not ( = ?AUTO_2852 ?AUTO_2851 ) ) ( not ( = ?AUTO_2847 ?AUTO_2851 ) ) ( not ( = ?AUTO_2856 ?AUTO_2851 ) ) ( not ( = ?AUTO_2854 ?AUTO_2848 ) ) ( AIRPORT ?AUTO_2853 ) ( AIRPLANE-AT ?AUTO_2850 ?AUTO_2853 ) ( not ( = ?AUTO_2853 ?AUTO_2852 ) ) ( not ( = ?AUTO_2847 ?AUTO_2853 ) ) ( not ( = ?AUTO_2856 ?AUTO_2853 ) ) ( not ( = ?AUTO_2851 ?AUTO_2853 ) ) ( TRUCK-AT ?AUTO_2849 ?AUTO_2857 ) ( IN-CITY ?AUTO_2857 ?AUTO_2854 ) ( not ( = ?AUTO_2856 ?AUTO_2857 ) ) ( not ( = ?AUTO_2847 ?AUTO_2857 ) ) ( not ( = ?AUTO_2852 ?AUTO_2857 ) ) ( not ( = ?AUTO_2851 ?AUTO_2857 ) ) ( not ( = ?AUTO_2853 ?AUTO_2857 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2849 ?AUTO_2857 ?AUTO_2856 ?AUTO_2854 )
      ( DELIVER-PKG ?AUTO_2846 ?AUTO_2847 )
      ( DELIVER-PKG-VERIFY ?AUTO_2846 ?AUTO_2847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2860 - OBJ
      ?AUTO_2861 - LOCATION
    )
    :vars
    (
      ?AUTO_2862 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2860 ?AUTO_2862 ) ( AIRPLANE-AT ?AUTO_2862 ?AUTO_2861 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2860 ?AUTO_2862 ?AUTO_2861 )
      ( DELIVER-PKG-VERIFY ?AUTO_2860 ?AUTO_2861 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2863 - OBJ
      ?AUTO_2864 - LOCATION
    )
    :vars
    (
      ?AUTO_2865 - AIRPLANE
      ?AUTO_2866 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2863 ?AUTO_2865 ) ( AIRPORT ?AUTO_2866 ) ( AIRPORT ?AUTO_2864 ) ( AIRPLANE-AT ?AUTO_2865 ?AUTO_2866 ) ( not ( = ?AUTO_2866 ?AUTO_2864 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2865 ?AUTO_2866 ?AUTO_2864 )
      ( DELIVER-PKG ?AUTO_2863 ?AUTO_2864 )
      ( DELIVER-PKG-VERIFY ?AUTO_2863 ?AUTO_2864 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2867 - OBJ
      ?AUTO_2868 - LOCATION
    )
    :vars
    (
      ?AUTO_2870 - LOCATION
      ?AUTO_2869 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2870 ) ( AIRPORT ?AUTO_2868 ) ( AIRPLANE-AT ?AUTO_2869 ?AUTO_2870 ) ( not ( = ?AUTO_2870 ?AUTO_2868 ) ) ( OBJ-AT ?AUTO_2867 ?AUTO_2870 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2867 ?AUTO_2869 ?AUTO_2870 )
      ( DELIVER-PKG ?AUTO_2867 ?AUTO_2868 )
      ( DELIVER-PKG-VERIFY ?AUTO_2867 ?AUTO_2868 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2871 - OBJ
      ?AUTO_2872 - LOCATION
    )
    :vars
    (
      ?AUTO_2874 - LOCATION
      ?AUTO_2873 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2874 ) ( AIRPORT ?AUTO_2872 ) ( not ( = ?AUTO_2874 ?AUTO_2872 ) ) ( OBJ-AT ?AUTO_2871 ?AUTO_2874 ) ( AIRPLANE-AT ?AUTO_2873 ?AUTO_2872 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2873 ?AUTO_2872 ?AUTO_2874 )
      ( DELIVER-PKG ?AUTO_2871 ?AUTO_2872 )
      ( DELIVER-PKG-VERIFY ?AUTO_2871 ?AUTO_2872 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2879 - OBJ
      ?AUTO_2880 - LOCATION
    )
    :vars
    (
      ?AUTO_2881 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2881 ?AUTO_2880 ) ( IN-TRUCK ?AUTO_2879 ?AUTO_2881 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2879 ?AUTO_2881 ?AUTO_2880 )
      ( DELIVER-PKG-VERIFY ?AUTO_2879 ?AUTO_2880 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2882 - OBJ
      ?AUTO_2883 - LOCATION
    )
    :vars
    (
      ?AUTO_2884 - TRUCK
      ?AUTO_2885 - LOCATION
      ?AUTO_2886 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2882 ?AUTO_2884 ) ( TRUCK-AT ?AUTO_2884 ?AUTO_2885 ) ( IN-CITY ?AUTO_2885 ?AUTO_2886 ) ( IN-CITY ?AUTO_2883 ?AUTO_2886 ) ( not ( = ?AUTO_2883 ?AUTO_2885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2884 ?AUTO_2885 ?AUTO_2883 ?AUTO_2886 )
      ( DELIVER-PKG ?AUTO_2882 ?AUTO_2883 )
      ( DELIVER-PKG-VERIFY ?AUTO_2882 ?AUTO_2883 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2889 - OBJ
      ?AUTO_2890 - LOCATION
    )
    :vars
    (
      ?AUTO_2891 - TRUCK
      ?AUTO_2893 - LOCATION
      ?AUTO_2892 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2891 ?AUTO_2893 ) ( IN-CITY ?AUTO_2893 ?AUTO_2892 ) ( IN-CITY ?AUTO_2890 ?AUTO_2892 ) ( not ( = ?AUTO_2890 ?AUTO_2893 ) ) ( OBJ-AT ?AUTO_2889 ?AUTO_2893 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2889 ?AUTO_2891 ?AUTO_2893 )
      ( DELIVER-PKG ?AUTO_2889 ?AUTO_2890 )
      ( DELIVER-PKG-VERIFY ?AUTO_2889 ?AUTO_2890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2894 - OBJ
      ?AUTO_2895 - LOCATION
    )
    :vars
    (
      ?AUTO_2897 - LOCATION
      ?AUTO_2898 - CITY
      ?AUTO_2896 - TRUCK
      ?AUTO_2899 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2897 ?AUTO_2898 ) ( IN-CITY ?AUTO_2895 ?AUTO_2898 ) ( not ( = ?AUTO_2895 ?AUTO_2897 ) ) ( OBJ-AT ?AUTO_2894 ?AUTO_2897 ) ( TRUCK-AT ?AUTO_2896 ?AUTO_2899 ) ( IN-CITY ?AUTO_2899 ?AUTO_2898 ) ( not ( = ?AUTO_2897 ?AUTO_2899 ) ) ( not ( = ?AUTO_2895 ?AUTO_2899 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2896 ?AUTO_2899 ?AUTO_2897 ?AUTO_2898 )
      ( DELIVER-PKG ?AUTO_2894 ?AUTO_2895 )
      ( DELIVER-PKG-VERIFY ?AUTO_2894 ?AUTO_2895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2912 - OBJ
      ?AUTO_2913 - LOCATION
    )
    :vars
    (
      ?AUTO_2914 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2914 ?AUTO_2913 ) ( IN-TRUCK ?AUTO_2912 ?AUTO_2914 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2912 ?AUTO_2914 ?AUTO_2913 )
      ( DELIVER-PKG-VERIFY ?AUTO_2912 ?AUTO_2913 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2921 - OBJ
      ?AUTO_2922 - LOCATION
    )
    :vars
    (
      ?AUTO_2924 - TRUCK
      ?AUTO_2923 - LOCATION
      ?AUTO_2925 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2924 ?AUTO_2923 ) ( IN-CITY ?AUTO_2923 ?AUTO_2925 ) ( IN-CITY ?AUTO_2922 ?AUTO_2925 ) ( not ( = ?AUTO_2922 ?AUTO_2923 ) ) ( OBJ-AT ?AUTO_2921 ?AUTO_2923 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2921 ?AUTO_2924 ?AUTO_2923 )
      ( DELIVER-PKG ?AUTO_2921 ?AUTO_2922 )
      ( DELIVER-PKG-VERIFY ?AUTO_2921 ?AUTO_2922 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2942 - OBJ
      ?AUTO_2943 - LOCATION
    )
    :vars
    (
      ?AUTO_2944 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2944 ?AUTO_2943 ) ( IN-TRUCK ?AUTO_2942 ?AUTO_2944 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2942 ?AUTO_2944 ?AUTO_2943 )
      ( DELIVER-PKG-VERIFY ?AUTO_2942 ?AUTO_2943 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2945 - OBJ
      ?AUTO_2946 - LOCATION
    )
    :vars
    (
      ?AUTO_2947 - TRUCK
      ?AUTO_2948 - LOCATION
      ?AUTO_2949 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2945 ?AUTO_2947 ) ( TRUCK-AT ?AUTO_2947 ?AUTO_2948 ) ( IN-CITY ?AUTO_2948 ?AUTO_2949 ) ( IN-CITY ?AUTO_2946 ?AUTO_2949 ) ( not ( = ?AUTO_2946 ?AUTO_2948 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2947 ?AUTO_2948 ?AUTO_2946 ?AUTO_2949 )
      ( DELIVER-PKG ?AUTO_2945 ?AUTO_2946 )
      ( DELIVER-PKG-VERIFY ?AUTO_2945 ?AUTO_2946 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2952 - OBJ
      ?AUTO_2953 - LOCATION
    )
    :vars
    (
      ?AUTO_2954 - TRUCK
      ?AUTO_2956 - LOCATION
      ?AUTO_2955 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2954 ?AUTO_2956 ) ( IN-CITY ?AUTO_2956 ?AUTO_2955 ) ( IN-CITY ?AUTO_2953 ?AUTO_2955 ) ( not ( = ?AUTO_2953 ?AUTO_2956 ) ) ( OBJ-AT ?AUTO_2952 ?AUTO_2956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2952 ?AUTO_2954 ?AUTO_2956 )
      ( DELIVER-PKG ?AUTO_2952 ?AUTO_2953 )
      ( DELIVER-PKG-VERIFY ?AUTO_2952 ?AUTO_2953 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2959 - OBJ
      ?AUTO_2960 - LOCATION
    )
    :vars
    (
      ?AUTO_2962 - LOCATION
      ?AUTO_2963 - CITY
      ?AUTO_2961 - TRUCK
      ?AUTO_2964 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2962 ?AUTO_2963 ) ( IN-CITY ?AUTO_2960 ?AUTO_2963 ) ( not ( = ?AUTO_2960 ?AUTO_2962 ) ) ( OBJ-AT ?AUTO_2959 ?AUTO_2962 ) ( TRUCK-AT ?AUTO_2961 ?AUTO_2964 ) ( IN-CITY ?AUTO_2964 ?AUTO_2963 ) ( not ( = ?AUTO_2962 ?AUTO_2964 ) ) ( not ( = ?AUTO_2960 ?AUTO_2964 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2961 ?AUTO_2964 ?AUTO_2962 ?AUTO_2963 )
      ( DELIVER-PKG ?AUTO_2959 ?AUTO_2960 )
      ( DELIVER-PKG-VERIFY ?AUTO_2959 ?AUTO_2960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2969 - OBJ
      ?AUTO_2970 - LOCATION
    )
    :vars
    (
      ?AUTO_2972 - LOCATION
      ?AUTO_2974 - CITY
      ?AUTO_2973 - LOCATION
      ?AUTO_2971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2972 ?AUTO_2974 ) ( IN-CITY ?AUTO_2970 ?AUTO_2974 ) ( not ( = ?AUTO_2970 ?AUTO_2972 ) ) ( OBJ-AT ?AUTO_2969 ?AUTO_2972 ) ( IN-CITY ?AUTO_2973 ?AUTO_2974 ) ( not ( = ?AUTO_2972 ?AUTO_2973 ) ) ( not ( = ?AUTO_2970 ?AUTO_2973 ) ) ( TRUCK-AT ?AUTO_2971 ?AUTO_2970 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2971 ?AUTO_2970 ?AUTO_2973 ?AUTO_2974 )
      ( DELIVER-PKG ?AUTO_2969 ?AUTO_2970 )
      ( DELIVER-PKG-VERIFY ?AUTO_2969 ?AUTO_2970 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2987 - OBJ
      ?AUTO_2988 - LOCATION
    )
    :vars
    (
      ?AUTO_2989 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2987 ?AUTO_2989 ) ( AIRPLANE-AT ?AUTO_2989 ?AUTO_2988 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2987 ?AUTO_2989 ?AUTO_2988 )
      ( DELIVER-PKG-VERIFY ?AUTO_2987 ?AUTO_2988 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2994 - OBJ
      ?AUTO_2995 - LOCATION
    )
    :vars
    (
      ?AUTO_2996 - AIRPLANE
      ?AUTO_2997 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2994 ?AUTO_2996 ) ( AIRPORT ?AUTO_2997 ) ( AIRPORT ?AUTO_2995 ) ( AIRPLANE-AT ?AUTO_2996 ?AUTO_2997 ) ( not ( = ?AUTO_2997 ?AUTO_2995 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2996 ?AUTO_2997 ?AUTO_2995 )
      ( DELIVER-PKG ?AUTO_2994 ?AUTO_2995 )
      ( DELIVER-PKG-VERIFY ?AUTO_2994 ?AUTO_2995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2998 - OBJ
      ?AUTO_2999 - LOCATION
    )
    :vars
    (
      ?AUTO_3001 - LOCATION
      ?AUTO_3000 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3001 ) ( AIRPORT ?AUTO_2999 ) ( AIRPLANE-AT ?AUTO_3000 ?AUTO_3001 ) ( not ( = ?AUTO_3001 ?AUTO_2999 ) ) ( OBJ-AT ?AUTO_2998 ?AUTO_3001 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2998 ?AUTO_3000 ?AUTO_3001 )
      ( DELIVER-PKG ?AUTO_2998 ?AUTO_2999 )
      ( DELIVER-PKG-VERIFY ?AUTO_2998 ?AUTO_2999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3004 - OBJ
      ?AUTO_3005 - LOCATION
    )
    :vars
    (
      ?AUTO_3006 - LOCATION
      ?AUTO_3007 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3006 ) ( AIRPORT ?AUTO_3005 ) ( not ( = ?AUTO_3006 ?AUTO_3005 ) ) ( OBJ-AT ?AUTO_3004 ?AUTO_3006 ) ( AIRPLANE-AT ?AUTO_3007 ?AUTO_3005 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3007 ?AUTO_3005 ?AUTO_3006 )
      ( DELIVER-PKG ?AUTO_3004 ?AUTO_3005 )
      ( DELIVER-PKG-VERIFY ?AUTO_3004 ?AUTO_3005 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3038 - OBJ
      ?AUTO_3039 - LOCATION
    )
    :vars
    (
      ?AUTO_3040 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3038 ?AUTO_3040 ) ( AIRPLANE-AT ?AUTO_3040 ?AUTO_3039 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3038 ?AUTO_3040 ?AUTO_3039 )
      ( DELIVER-PKG-VERIFY ?AUTO_3038 ?AUTO_3039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3043 - OBJ
      ?AUTO_3044 - LOCATION
    )
    :vars
    (
      ?AUTO_3045 - AIRPLANE
      ?AUTO_3046 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3043 ?AUTO_3045 ) ( AIRPORT ?AUTO_3046 ) ( AIRPORT ?AUTO_3044 ) ( AIRPLANE-AT ?AUTO_3045 ?AUTO_3046 ) ( not ( = ?AUTO_3046 ?AUTO_3044 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3045 ?AUTO_3046 ?AUTO_3044 )
      ( DELIVER-PKG ?AUTO_3043 ?AUTO_3044 )
      ( DELIVER-PKG-VERIFY ?AUTO_3043 ?AUTO_3044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3047 - OBJ
      ?AUTO_3048 - LOCATION
    )
    :vars
    (
      ?AUTO_3050 - LOCATION
      ?AUTO_3049 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3050 ) ( AIRPORT ?AUTO_3048 ) ( AIRPLANE-AT ?AUTO_3049 ?AUTO_3050 ) ( not ( = ?AUTO_3050 ?AUTO_3048 ) ) ( OBJ-AT ?AUTO_3047 ?AUTO_3050 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3047 ?AUTO_3049 ?AUTO_3050 )
      ( DELIVER-PKG ?AUTO_3047 ?AUTO_3048 )
      ( DELIVER-PKG-VERIFY ?AUTO_3047 ?AUTO_3048 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3055 - OBJ
      ?AUTO_3056 - LOCATION
    )
    :vars
    (
      ?AUTO_3057 - LOCATION
      ?AUTO_3059 - LOCATION
      ?AUTO_3058 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3057 ) ( AIRPORT ?AUTO_3056 ) ( not ( = ?AUTO_3057 ?AUTO_3056 ) ) ( OBJ-AT ?AUTO_3055 ?AUTO_3057 ) ( AIRPORT ?AUTO_3059 ) ( AIRPLANE-AT ?AUTO_3058 ?AUTO_3059 ) ( not ( = ?AUTO_3059 ?AUTO_3057 ) ) ( not ( = ?AUTO_3056 ?AUTO_3059 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3058 ?AUTO_3059 ?AUTO_3057 )
      ( DELIVER-PKG ?AUTO_3055 ?AUTO_3056 )
      ( DELIVER-PKG-VERIFY ?AUTO_3055 ?AUTO_3056 ) )
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
      ?AUTO_3074 - LOCATION
      ?AUTO_3073 - AIRPLANE
      ?AUTO_3075 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3072 ) ( AIRPORT ?AUTO_3071 ) ( not ( = ?AUTO_3072 ?AUTO_3071 ) ) ( AIRPORT ?AUTO_3074 ) ( AIRPLANE-AT ?AUTO_3073 ?AUTO_3074 ) ( not ( = ?AUTO_3074 ?AUTO_3072 ) ) ( not ( = ?AUTO_3071 ?AUTO_3074 ) ) ( TRUCK-AT ?AUTO_3075 ?AUTO_3072 ) ( IN-TRUCK ?AUTO_3070 ?AUTO_3075 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3070 ?AUTO_3075 ?AUTO_3072 )
      ( DELIVER-PKG ?AUTO_3070 ?AUTO_3071 )
      ( DELIVER-PKG-VERIFY ?AUTO_3070 ?AUTO_3071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3076 - OBJ
      ?AUTO_3077 - LOCATION
    )
    :vars
    (
      ?AUTO_3079 - LOCATION
      ?AUTO_3080 - LOCATION
      ?AUTO_3078 - AIRPLANE
      ?AUTO_3081 - TRUCK
      ?AUTO_3082 - LOCATION
      ?AUTO_3083 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3079 ) ( AIRPORT ?AUTO_3077 ) ( not ( = ?AUTO_3079 ?AUTO_3077 ) ) ( AIRPORT ?AUTO_3080 ) ( AIRPLANE-AT ?AUTO_3078 ?AUTO_3080 ) ( not ( = ?AUTO_3080 ?AUTO_3079 ) ) ( not ( = ?AUTO_3077 ?AUTO_3080 ) ) ( IN-TRUCK ?AUTO_3076 ?AUTO_3081 ) ( TRUCK-AT ?AUTO_3081 ?AUTO_3082 ) ( IN-CITY ?AUTO_3082 ?AUTO_3083 ) ( IN-CITY ?AUTO_3079 ?AUTO_3083 ) ( not ( = ?AUTO_3079 ?AUTO_3082 ) ) ( not ( = ?AUTO_3077 ?AUTO_3082 ) ) ( not ( = ?AUTO_3080 ?AUTO_3082 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3081 ?AUTO_3082 ?AUTO_3079 ?AUTO_3083 )
      ( DELIVER-PKG ?AUTO_3076 ?AUTO_3077 )
      ( DELIVER-PKG-VERIFY ?AUTO_3076 ?AUTO_3077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3086 - OBJ
      ?AUTO_3087 - LOCATION
    )
    :vars
    (
      ?AUTO_3089 - LOCATION
      ?AUTO_3093 - LOCATION
      ?AUTO_3092 - AIRPLANE
      ?AUTO_3090 - TRUCK
      ?AUTO_3088 - LOCATION
      ?AUTO_3091 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3089 ) ( AIRPORT ?AUTO_3087 ) ( not ( = ?AUTO_3089 ?AUTO_3087 ) ) ( AIRPORT ?AUTO_3093 ) ( AIRPLANE-AT ?AUTO_3092 ?AUTO_3093 ) ( not ( = ?AUTO_3093 ?AUTO_3089 ) ) ( not ( = ?AUTO_3087 ?AUTO_3093 ) ) ( TRUCK-AT ?AUTO_3090 ?AUTO_3088 ) ( IN-CITY ?AUTO_3088 ?AUTO_3091 ) ( IN-CITY ?AUTO_3089 ?AUTO_3091 ) ( not ( = ?AUTO_3089 ?AUTO_3088 ) ) ( not ( = ?AUTO_3087 ?AUTO_3088 ) ) ( not ( = ?AUTO_3093 ?AUTO_3088 ) ) ( OBJ-AT ?AUTO_3086 ?AUTO_3088 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3086 ?AUTO_3090 ?AUTO_3088 )
      ( DELIVER-PKG ?AUTO_3086 ?AUTO_3087 )
      ( DELIVER-PKG-VERIFY ?AUTO_3086 ?AUTO_3087 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3094 - OBJ
      ?AUTO_3095 - LOCATION
    )
    :vars
    (
      ?AUTO_3098 - LOCATION
      ?AUTO_3101 - LOCATION
      ?AUTO_3100 - AIRPLANE
      ?AUTO_3096 - LOCATION
      ?AUTO_3099 - CITY
      ?AUTO_3097 - TRUCK
      ?AUTO_3102 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3098 ) ( AIRPORT ?AUTO_3095 ) ( not ( = ?AUTO_3098 ?AUTO_3095 ) ) ( AIRPORT ?AUTO_3101 ) ( AIRPLANE-AT ?AUTO_3100 ?AUTO_3101 ) ( not ( = ?AUTO_3101 ?AUTO_3098 ) ) ( not ( = ?AUTO_3095 ?AUTO_3101 ) ) ( IN-CITY ?AUTO_3096 ?AUTO_3099 ) ( IN-CITY ?AUTO_3098 ?AUTO_3099 ) ( not ( = ?AUTO_3098 ?AUTO_3096 ) ) ( not ( = ?AUTO_3095 ?AUTO_3096 ) ) ( not ( = ?AUTO_3101 ?AUTO_3096 ) ) ( OBJ-AT ?AUTO_3094 ?AUTO_3096 ) ( TRUCK-AT ?AUTO_3097 ?AUTO_3102 ) ( IN-CITY ?AUTO_3102 ?AUTO_3099 ) ( not ( = ?AUTO_3096 ?AUTO_3102 ) ) ( not ( = ?AUTO_3095 ?AUTO_3102 ) ) ( not ( = ?AUTO_3098 ?AUTO_3102 ) ) ( not ( = ?AUTO_3101 ?AUTO_3102 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3097 ?AUTO_3102 ?AUTO_3096 ?AUTO_3099 )
      ( DELIVER-PKG ?AUTO_3094 ?AUTO_3095 )
      ( DELIVER-PKG-VERIFY ?AUTO_3094 ?AUTO_3095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3115 - OBJ
      ?AUTO_3116 - LOCATION
    )
    :vars
    (
      ?AUTO_3117 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3117 ?AUTO_3116 ) ( IN-TRUCK ?AUTO_3115 ?AUTO_3117 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3115 ?AUTO_3117 ?AUTO_3116 )
      ( DELIVER-PKG-VERIFY ?AUTO_3115 ?AUTO_3116 ) )
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
      ?AUTO_3122 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3118 ?AUTO_3120 ) ( TRUCK-AT ?AUTO_3120 ?AUTO_3121 ) ( IN-CITY ?AUTO_3121 ?AUTO_3122 ) ( IN-CITY ?AUTO_3119 ?AUTO_3122 ) ( not ( = ?AUTO_3119 ?AUTO_3121 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3120 ?AUTO_3121 ?AUTO_3119 ?AUTO_3122 )
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
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3127 ?AUTO_3129 ) ( IN-CITY ?AUTO_3129 ?AUTO_3128 ) ( IN-CITY ?AUTO_3126 ?AUTO_3128 ) ( not ( = ?AUTO_3126 ?AUTO_3129 ) ) ( OBJ-AT ?AUTO_3125 ?AUTO_3129 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3125 ?AUTO_3127 ?AUTO_3129 )
      ( DELIVER-PKG ?AUTO_3125 ?AUTO_3126 )
      ( DELIVER-PKG-VERIFY ?AUTO_3125 ?AUTO_3126 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3132 - OBJ
      ?AUTO_3133 - LOCATION
    )
    :vars
    (
      ?AUTO_3134 - TRUCK
      ?AUTO_3135 - LOCATION
      ?AUTO_3136 - CITY
      ?AUTO_3137 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3134 ?AUTO_3135 ) ( IN-CITY ?AUTO_3135 ?AUTO_3136 ) ( IN-CITY ?AUTO_3133 ?AUTO_3136 ) ( not ( = ?AUTO_3133 ?AUTO_3135 ) ) ( IN-AIRPLANE ?AUTO_3132 ?AUTO_3137 ) ( AIRPLANE-AT ?AUTO_3137 ?AUTO_3135 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3132 ?AUTO_3137 ?AUTO_3135 )
      ( DELIVER-PKG ?AUTO_3132 ?AUTO_3133 )
      ( DELIVER-PKG-VERIFY ?AUTO_3132 ?AUTO_3133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3142 - OBJ
      ?AUTO_3143 - LOCATION
    )
    :vars
    (
      ?AUTO_3147 - TRUCK
      ?AUTO_3145 - LOCATION
      ?AUTO_3144 - CITY
      ?AUTO_3146 - AIRPLANE
      ?AUTO_3148 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3147 ?AUTO_3145 ) ( IN-CITY ?AUTO_3145 ?AUTO_3144 ) ( IN-CITY ?AUTO_3143 ?AUTO_3144 ) ( not ( = ?AUTO_3143 ?AUTO_3145 ) ) ( IN-AIRPLANE ?AUTO_3142 ?AUTO_3146 ) ( AIRPORT ?AUTO_3148 ) ( AIRPORT ?AUTO_3145 ) ( AIRPLANE-AT ?AUTO_3146 ?AUTO_3148 ) ( not ( = ?AUTO_3148 ?AUTO_3145 ) ) ( not ( = ?AUTO_3143 ?AUTO_3148 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3146 ?AUTO_3148 ?AUTO_3145 )
      ( DELIVER-PKG ?AUTO_3142 ?AUTO_3143 )
      ( DELIVER-PKG-VERIFY ?AUTO_3142 ?AUTO_3143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3149 - OBJ
      ?AUTO_3150 - LOCATION
    )
    :vars
    (
      ?AUTO_3153 - TRUCK
      ?AUTO_3151 - LOCATION
      ?AUTO_3152 - CITY
      ?AUTO_3155 - LOCATION
      ?AUTO_3154 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3153 ?AUTO_3151 ) ( IN-CITY ?AUTO_3151 ?AUTO_3152 ) ( IN-CITY ?AUTO_3150 ?AUTO_3152 ) ( not ( = ?AUTO_3150 ?AUTO_3151 ) ) ( AIRPORT ?AUTO_3155 ) ( AIRPORT ?AUTO_3151 ) ( AIRPLANE-AT ?AUTO_3154 ?AUTO_3155 ) ( not ( = ?AUTO_3155 ?AUTO_3151 ) ) ( not ( = ?AUTO_3150 ?AUTO_3155 ) ) ( OBJ-AT ?AUTO_3149 ?AUTO_3155 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3149 ?AUTO_3154 ?AUTO_3155 )
      ( DELIVER-PKG ?AUTO_3149 ?AUTO_3150 )
      ( DELIVER-PKG-VERIFY ?AUTO_3149 ?AUTO_3150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3158 - OBJ
      ?AUTO_3159 - LOCATION
    )
    :vars
    (
      ?AUTO_3162 - TRUCK
      ?AUTO_3160 - LOCATION
      ?AUTO_3161 - CITY
      ?AUTO_3163 - LOCATION
      ?AUTO_3164 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3162 ?AUTO_3160 ) ( IN-CITY ?AUTO_3160 ?AUTO_3161 ) ( IN-CITY ?AUTO_3159 ?AUTO_3161 ) ( not ( = ?AUTO_3159 ?AUTO_3160 ) ) ( AIRPORT ?AUTO_3163 ) ( AIRPORT ?AUTO_3160 ) ( not ( = ?AUTO_3163 ?AUTO_3160 ) ) ( not ( = ?AUTO_3159 ?AUTO_3163 ) ) ( OBJ-AT ?AUTO_3158 ?AUTO_3163 ) ( AIRPLANE-AT ?AUTO_3164 ?AUTO_3160 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3164 ?AUTO_3160 ?AUTO_3163 )
      ( DELIVER-PKG ?AUTO_3158 ?AUTO_3159 )
      ( DELIVER-PKG-VERIFY ?AUTO_3158 ?AUTO_3159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3191 - OBJ
      ?AUTO_3192 - LOCATION
    )
    :vars
    (
      ?AUTO_3197 - LOCATION
      ?AUTO_3195 - CITY
      ?AUTO_3194 - LOCATION
      ?AUTO_3193 - AIRPLANE
      ?AUTO_3196 - TRUCK
      ?AUTO_3198 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3197 ?AUTO_3195 ) ( IN-CITY ?AUTO_3192 ?AUTO_3195 ) ( not ( = ?AUTO_3192 ?AUTO_3197 ) ) ( AIRPORT ?AUTO_3194 ) ( AIRPORT ?AUTO_3197 ) ( not ( = ?AUTO_3194 ?AUTO_3197 ) ) ( not ( = ?AUTO_3192 ?AUTO_3194 ) ) ( OBJ-AT ?AUTO_3191 ?AUTO_3194 ) ( AIRPLANE-AT ?AUTO_3193 ?AUTO_3197 ) ( TRUCK-AT ?AUTO_3196 ?AUTO_3198 ) ( IN-CITY ?AUTO_3198 ?AUTO_3195 ) ( not ( = ?AUTO_3197 ?AUTO_3198 ) ) ( not ( = ?AUTO_3192 ?AUTO_3198 ) ) ( not ( = ?AUTO_3194 ?AUTO_3198 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3196 ?AUTO_3198 ?AUTO_3197 ?AUTO_3195 )
      ( DELIVER-PKG ?AUTO_3191 ?AUTO_3192 )
      ( DELIVER-PKG-VERIFY ?AUTO_3191 ?AUTO_3192 ) )
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
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3203 ?AUTO_3202 ) ( IN-TRUCK ?AUTO_3201 ?AUTO_3203 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3201 ?AUTO_3203 ?AUTO_3202 )
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
      ?AUTO_3210 - LOCATION
      ?AUTO_3212 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3211 ?AUTO_3210 ) ( IN-CITY ?AUTO_3210 ?AUTO_3212 ) ( IN-CITY ?AUTO_3209 ?AUTO_3212 ) ( not ( = ?AUTO_3209 ?AUTO_3210 ) ) ( OBJ-AT ?AUTO_3208 ?AUTO_3210 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3208 ?AUTO_3211 ?AUTO_3210 )
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
      ?AUTO_3218 - TRUCK
      ?AUTO_3217 - LOCATION
      ?AUTO_3219 - CITY
      ?AUTO_3220 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3218 ?AUTO_3217 ) ( IN-CITY ?AUTO_3217 ?AUTO_3219 ) ( IN-CITY ?AUTO_3216 ?AUTO_3219 ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) ( IN-AIRPLANE ?AUTO_3215 ?AUTO_3220 ) ( AIRPLANE-AT ?AUTO_3220 ?AUTO_3217 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3215 ?AUTO_3220 ?AUTO_3217 )
      ( DELIVER-PKG ?AUTO_3215 ?AUTO_3216 )
      ( DELIVER-PKG-VERIFY ?AUTO_3215 ?AUTO_3216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3223 - OBJ
      ?AUTO_3224 - LOCATION
    )
    :vars
    (
      ?AUTO_3226 - TRUCK
      ?AUTO_3228 - LOCATION
      ?AUTO_3225 - CITY
      ?AUTO_3227 - AIRPLANE
      ?AUTO_3229 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3226 ?AUTO_3228 ) ( IN-CITY ?AUTO_3228 ?AUTO_3225 ) ( IN-CITY ?AUTO_3224 ?AUTO_3225 ) ( not ( = ?AUTO_3224 ?AUTO_3228 ) ) ( IN-AIRPLANE ?AUTO_3223 ?AUTO_3227 ) ( AIRPORT ?AUTO_3229 ) ( AIRPORT ?AUTO_3228 ) ( AIRPLANE-AT ?AUTO_3227 ?AUTO_3229 ) ( not ( = ?AUTO_3229 ?AUTO_3228 ) ) ( not ( = ?AUTO_3224 ?AUTO_3229 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3227 ?AUTO_3229 ?AUTO_3228 )
      ( DELIVER-PKG ?AUTO_3223 ?AUTO_3224 )
      ( DELIVER-PKG-VERIFY ?AUTO_3223 ?AUTO_3224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3230 - OBJ
      ?AUTO_3231 - LOCATION
    )
    :vars
    (
      ?AUTO_3233 - TRUCK
      ?AUTO_3234 - LOCATION
      ?AUTO_3232 - CITY
      ?AUTO_3236 - LOCATION
      ?AUTO_3235 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3233 ?AUTO_3234 ) ( IN-CITY ?AUTO_3234 ?AUTO_3232 ) ( IN-CITY ?AUTO_3231 ?AUTO_3232 ) ( not ( = ?AUTO_3231 ?AUTO_3234 ) ) ( AIRPORT ?AUTO_3236 ) ( AIRPORT ?AUTO_3234 ) ( AIRPLANE-AT ?AUTO_3235 ?AUTO_3236 ) ( not ( = ?AUTO_3236 ?AUTO_3234 ) ) ( not ( = ?AUTO_3231 ?AUTO_3236 ) ) ( OBJ-AT ?AUTO_3230 ?AUTO_3236 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3230 ?AUTO_3235 ?AUTO_3236 )
      ( DELIVER-PKG ?AUTO_3230 ?AUTO_3231 )
      ( DELIVER-PKG-VERIFY ?AUTO_3230 ?AUTO_3231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3241 - OBJ
      ?AUTO_3242 - LOCATION
    )
    :vars
    (
      ?AUTO_3246 - TRUCK
      ?AUTO_3245 - LOCATION
      ?AUTO_3244 - CITY
      ?AUTO_3247 - LOCATION
      ?AUTO_3248 - LOCATION
      ?AUTO_3243 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3246 ?AUTO_3245 ) ( IN-CITY ?AUTO_3245 ?AUTO_3244 ) ( IN-CITY ?AUTO_3242 ?AUTO_3244 ) ( not ( = ?AUTO_3242 ?AUTO_3245 ) ) ( AIRPORT ?AUTO_3247 ) ( AIRPORT ?AUTO_3245 ) ( not ( = ?AUTO_3247 ?AUTO_3245 ) ) ( not ( = ?AUTO_3242 ?AUTO_3247 ) ) ( OBJ-AT ?AUTO_3241 ?AUTO_3247 ) ( AIRPORT ?AUTO_3248 ) ( AIRPLANE-AT ?AUTO_3243 ?AUTO_3248 ) ( not ( = ?AUTO_3248 ?AUTO_3247 ) ) ( not ( = ?AUTO_3242 ?AUTO_3248 ) ) ( not ( = ?AUTO_3245 ?AUTO_3248 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3243 ?AUTO_3248 ?AUTO_3247 )
      ( DELIVER-PKG ?AUTO_3241 ?AUTO_3242 )
      ( DELIVER-PKG-VERIFY ?AUTO_3241 ?AUTO_3242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3259 - OBJ
      ?AUTO_3260 - LOCATION
    )
    :vars
    (
      ?AUTO_3262 - TRUCK
      ?AUTO_3261 - LOCATION
      ?AUTO_3266 - CITY
      ?AUTO_3264 - LOCATION
      ?AUTO_3265 - LOCATION
      ?AUTO_3263 - AIRPLANE
      ?AUTO_3267 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3262 ?AUTO_3261 ) ( IN-CITY ?AUTO_3261 ?AUTO_3266 ) ( IN-CITY ?AUTO_3260 ?AUTO_3266 ) ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( AIRPORT ?AUTO_3264 ) ( AIRPORT ?AUTO_3261 ) ( not ( = ?AUTO_3264 ?AUTO_3261 ) ) ( not ( = ?AUTO_3260 ?AUTO_3264 ) ) ( AIRPORT ?AUTO_3265 ) ( AIRPLANE-AT ?AUTO_3263 ?AUTO_3265 ) ( not ( = ?AUTO_3265 ?AUTO_3264 ) ) ( not ( = ?AUTO_3260 ?AUTO_3265 ) ) ( not ( = ?AUTO_3261 ?AUTO_3265 ) ) ( TRUCK-AT ?AUTO_3267 ?AUTO_3264 ) ( IN-TRUCK ?AUTO_3259 ?AUTO_3267 ) ( not ( = ?AUTO_3262 ?AUTO_3267 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3259 ?AUTO_3267 ?AUTO_3264 )
      ( DELIVER-PKG ?AUTO_3259 ?AUTO_3260 )
      ( DELIVER-PKG-VERIFY ?AUTO_3259 ?AUTO_3260 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3268 - OBJ
      ?AUTO_3269 - LOCATION
    )
    :vars
    (
      ?AUTO_3274 - TRUCK
      ?AUTO_3275 - LOCATION
      ?AUTO_3270 - CITY
      ?AUTO_3272 - LOCATION
      ?AUTO_3271 - LOCATION
      ?AUTO_3273 - AIRPLANE
      ?AUTO_3276 - TRUCK
      ?AUTO_3277 - LOCATION
      ?AUTO_3278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3274 ?AUTO_3275 ) ( IN-CITY ?AUTO_3275 ?AUTO_3270 ) ( IN-CITY ?AUTO_3269 ?AUTO_3270 ) ( not ( = ?AUTO_3269 ?AUTO_3275 ) ) ( AIRPORT ?AUTO_3272 ) ( AIRPORT ?AUTO_3275 ) ( not ( = ?AUTO_3272 ?AUTO_3275 ) ) ( not ( = ?AUTO_3269 ?AUTO_3272 ) ) ( AIRPORT ?AUTO_3271 ) ( AIRPLANE-AT ?AUTO_3273 ?AUTO_3271 ) ( not ( = ?AUTO_3271 ?AUTO_3272 ) ) ( not ( = ?AUTO_3269 ?AUTO_3271 ) ) ( not ( = ?AUTO_3275 ?AUTO_3271 ) ) ( IN-TRUCK ?AUTO_3268 ?AUTO_3276 ) ( not ( = ?AUTO_3274 ?AUTO_3276 ) ) ( TRUCK-AT ?AUTO_3276 ?AUTO_3277 ) ( IN-CITY ?AUTO_3277 ?AUTO_3278 ) ( IN-CITY ?AUTO_3272 ?AUTO_3278 ) ( not ( = ?AUTO_3272 ?AUTO_3277 ) ) ( not ( = ?AUTO_3269 ?AUTO_3277 ) ) ( not ( = ?AUTO_3275 ?AUTO_3277 ) ) ( not ( = ?AUTO_3270 ?AUTO_3278 ) ) ( not ( = ?AUTO_3271 ?AUTO_3277 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3276 ?AUTO_3277 ?AUTO_3272 ?AUTO_3278 )
      ( DELIVER-PKG ?AUTO_3268 ?AUTO_3269 )
      ( DELIVER-PKG-VERIFY ?AUTO_3268 ?AUTO_3269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3281 - OBJ
      ?AUTO_3282 - LOCATION
    )
    :vars
    (
      ?AUTO_3284 - TRUCK
      ?AUTO_3283 - LOCATION
      ?AUTO_3290 - CITY
      ?AUTO_3286 - LOCATION
      ?AUTO_3288 - LOCATION
      ?AUTO_3289 - AIRPLANE
      ?AUTO_3291 - TRUCK
      ?AUTO_3285 - LOCATION
      ?AUTO_3287 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3284 ?AUTO_3283 ) ( IN-CITY ?AUTO_3283 ?AUTO_3290 ) ( IN-CITY ?AUTO_3282 ?AUTO_3290 ) ( not ( = ?AUTO_3282 ?AUTO_3283 ) ) ( AIRPORT ?AUTO_3286 ) ( AIRPORT ?AUTO_3283 ) ( not ( = ?AUTO_3286 ?AUTO_3283 ) ) ( not ( = ?AUTO_3282 ?AUTO_3286 ) ) ( AIRPORT ?AUTO_3288 ) ( AIRPLANE-AT ?AUTO_3289 ?AUTO_3288 ) ( not ( = ?AUTO_3288 ?AUTO_3286 ) ) ( not ( = ?AUTO_3282 ?AUTO_3288 ) ) ( not ( = ?AUTO_3283 ?AUTO_3288 ) ) ( not ( = ?AUTO_3284 ?AUTO_3291 ) ) ( TRUCK-AT ?AUTO_3291 ?AUTO_3285 ) ( IN-CITY ?AUTO_3285 ?AUTO_3287 ) ( IN-CITY ?AUTO_3286 ?AUTO_3287 ) ( not ( = ?AUTO_3286 ?AUTO_3285 ) ) ( not ( = ?AUTO_3282 ?AUTO_3285 ) ) ( not ( = ?AUTO_3283 ?AUTO_3285 ) ) ( not ( = ?AUTO_3290 ?AUTO_3287 ) ) ( not ( = ?AUTO_3288 ?AUTO_3285 ) ) ( OBJ-AT ?AUTO_3281 ?AUTO_3285 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3281 ?AUTO_3291 ?AUTO_3285 )
      ( DELIVER-PKG ?AUTO_3281 ?AUTO_3282 )
      ( DELIVER-PKG-VERIFY ?AUTO_3281 ?AUTO_3282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3292 - OBJ
      ?AUTO_3293 - LOCATION
    )
    :vars
    (
      ?AUTO_3300 - TRUCK
      ?AUTO_3296 - LOCATION
      ?AUTO_3302 - CITY
      ?AUTO_3295 - LOCATION
      ?AUTO_3299 - LOCATION
      ?AUTO_3297 - AIRPLANE
      ?AUTO_3294 - TRUCK
      ?AUTO_3301 - LOCATION
      ?AUTO_3298 - CITY
      ?AUTO_3303 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3300 ?AUTO_3296 ) ( IN-CITY ?AUTO_3296 ?AUTO_3302 ) ( IN-CITY ?AUTO_3293 ?AUTO_3302 ) ( not ( = ?AUTO_3293 ?AUTO_3296 ) ) ( AIRPORT ?AUTO_3295 ) ( AIRPORT ?AUTO_3296 ) ( not ( = ?AUTO_3295 ?AUTO_3296 ) ) ( not ( = ?AUTO_3293 ?AUTO_3295 ) ) ( AIRPORT ?AUTO_3299 ) ( AIRPLANE-AT ?AUTO_3297 ?AUTO_3299 ) ( not ( = ?AUTO_3299 ?AUTO_3295 ) ) ( not ( = ?AUTO_3293 ?AUTO_3299 ) ) ( not ( = ?AUTO_3296 ?AUTO_3299 ) ) ( not ( = ?AUTO_3300 ?AUTO_3294 ) ) ( IN-CITY ?AUTO_3301 ?AUTO_3298 ) ( IN-CITY ?AUTO_3295 ?AUTO_3298 ) ( not ( = ?AUTO_3295 ?AUTO_3301 ) ) ( not ( = ?AUTO_3293 ?AUTO_3301 ) ) ( not ( = ?AUTO_3296 ?AUTO_3301 ) ) ( not ( = ?AUTO_3302 ?AUTO_3298 ) ) ( not ( = ?AUTO_3299 ?AUTO_3301 ) ) ( OBJ-AT ?AUTO_3292 ?AUTO_3301 ) ( TRUCK-AT ?AUTO_3294 ?AUTO_3303 ) ( IN-CITY ?AUTO_3303 ?AUTO_3298 ) ( not ( = ?AUTO_3301 ?AUTO_3303 ) ) ( not ( = ?AUTO_3293 ?AUTO_3303 ) ) ( not ( = ?AUTO_3296 ?AUTO_3303 ) ) ( not ( = ?AUTO_3295 ?AUTO_3303 ) ) ( not ( = ?AUTO_3299 ?AUTO_3303 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3294 ?AUTO_3303 ?AUTO_3301 ?AUTO_3298 )
      ( DELIVER-PKG ?AUTO_3292 ?AUTO_3293 )
      ( DELIVER-PKG-VERIFY ?AUTO_3292 ?AUTO_3293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3312 - OBJ
      ?AUTO_3313 - LOCATION
    )
    :vars
    (
      ?AUTO_3323 - LOCATION
      ?AUTO_3317 - CITY
      ?AUTO_3322 - LOCATION
      ?AUTO_3318 - LOCATION
      ?AUTO_3320 - AIRPLANE
      ?AUTO_3319 - TRUCK
      ?AUTO_3321 - TRUCK
      ?AUTO_3316 - LOCATION
      ?AUTO_3315 - CITY
      ?AUTO_3314 - LOCATION
      ?AUTO_3324 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3323 ?AUTO_3317 ) ( IN-CITY ?AUTO_3313 ?AUTO_3317 ) ( not ( = ?AUTO_3313 ?AUTO_3323 ) ) ( AIRPORT ?AUTO_3322 ) ( AIRPORT ?AUTO_3323 ) ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) ( not ( = ?AUTO_3313 ?AUTO_3322 ) ) ( AIRPORT ?AUTO_3318 ) ( AIRPLANE-AT ?AUTO_3320 ?AUTO_3318 ) ( not ( = ?AUTO_3318 ?AUTO_3322 ) ) ( not ( = ?AUTO_3313 ?AUTO_3318 ) ) ( not ( = ?AUTO_3323 ?AUTO_3318 ) ) ( not ( = ?AUTO_3319 ?AUTO_3321 ) ) ( IN-CITY ?AUTO_3316 ?AUTO_3315 ) ( IN-CITY ?AUTO_3322 ?AUTO_3315 ) ( not ( = ?AUTO_3322 ?AUTO_3316 ) ) ( not ( = ?AUTO_3313 ?AUTO_3316 ) ) ( not ( = ?AUTO_3323 ?AUTO_3316 ) ) ( not ( = ?AUTO_3317 ?AUTO_3315 ) ) ( not ( = ?AUTO_3318 ?AUTO_3316 ) ) ( OBJ-AT ?AUTO_3312 ?AUTO_3316 ) ( TRUCK-AT ?AUTO_3321 ?AUTO_3314 ) ( IN-CITY ?AUTO_3314 ?AUTO_3315 ) ( not ( = ?AUTO_3316 ?AUTO_3314 ) ) ( not ( = ?AUTO_3313 ?AUTO_3314 ) ) ( not ( = ?AUTO_3323 ?AUTO_3314 ) ) ( not ( = ?AUTO_3322 ?AUTO_3314 ) ) ( not ( = ?AUTO_3318 ?AUTO_3314 ) ) ( TRUCK-AT ?AUTO_3319 ?AUTO_3324 ) ( IN-CITY ?AUTO_3324 ?AUTO_3317 ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) ( not ( = ?AUTO_3313 ?AUTO_3324 ) ) ( not ( = ?AUTO_3322 ?AUTO_3324 ) ) ( not ( = ?AUTO_3318 ?AUTO_3324 ) ) ( not ( = ?AUTO_3316 ?AUTO_3324 ) ) ( not ( = ?AUTO_3314 ?AUTO_3324 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3319 ?AUTO_3324 ?AUTO_3323 ?AUTO_3317 )
      ( DELIVER-PKG ?AUTO_3312 ?AUTO_3313 )
      ( DELIVER-PKG-VERIFY ?AUTO_3312 ?AUTO_3313 ) )
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
      ?AUTO_3330 - OBJ
      ?AUTO_3331 - LOCATION
    )
    :vars
    (
      ?AUTO_3332 - TRUCK
      ?AUTO_3333 - LOCATION
      ?AUTO_3334 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3330 ?AUTO_3332 ) ( TRUCK-AT ?AUTO_3332 ?AUTO_3333 ) ( IN-CITY ?AUTO_3333 ?AUTO_3334 ) ( IN-CITY ?AUTO_3331 ?AUTO_3334 ) ( not ( = ?AUTO_3331 ?AUTO_3333 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3332 ?AUTO_3333 ?AUTO_3331 ?AUTO_3334 )
      ( DELIVER-PKG ?AUTO_3330 ?AUTO_3331 )
      ( DELIVER-PKG-VERIFY ?AUTO_3330 ?AUTO_3331 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3335 - OBJ
      ?AUTO_3336 - LOCATION
    )
    :vars
    (
      ?AUTO_3337 - TRUCK
      ?AUTO_3338 - LOCATION
      ?AUTO_3339 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3337 ?AUTO_3338 ) ( IN-CITY ?AUTO_3338 ?AUTO_3339 ) ( IN-CITY ?AUTO_3336 ?AUTO_3339 ) ( not ( = ?AUTO_3336 ?AUTO_3338 ) ) ( OBJ-AT ?AUTO_3335 ?AUTO_3338 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3335 ?AUTO_3337 ?AUTO_3338 )
      ( DELIVER-PKG ?AUTO_3335 ?AUTO_3336 )
      ( DELIVER-PKG-VERIFY ?AUTO_3335 ?AUTO_3336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3342 - OBJ
      ?AUTO_3343 - LOCATION
    )
    :vars
    (
      ?AUTO_3344 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3344 ?AUTO_3343 ) ( IN-TRUCK ?AUTO_3342 ?AUTO_3344 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3342 ?AUTO_3344 ?AUTO_3343 )
      ( DELIVER-PKG-VERIFY ?AUTO_3342 ?AUTO_3343 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3345 - OBJ
      ?AUTO_3346 - LOCATION
    )
    :vars
    (
      ?AUTO_3347 - TRUCK
      ?AUTO_3348 - LOCATION
      ?AUTO_3349 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3345 ?AUTO_3347 ) ( TRUCK-AT ?AUTO_3347 ?AUTO_3348 ) ( IN-CITY ?AUTO_3348 ?AUTO_3349 ) ( IN-CITY ?AUTO_3346 ?AUTO_3349 ) ( not ( = ?AUTO_3346 ?AUTO_3348 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3347 ?AUTO_3348 ?AUTO_3346 ?AUTO_3349 )
      ( DELIVER-PKG ?AUTO_3345 ?AUTO_3346 )
      ( DELIVER-PKG-VERIFY ?AUTO_3345 ?AUTO_3346 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3350 - OBJ
      ?AUTO_3351 - LOCATION
    )
    :vars
    (
      ?AUTO_3352 - TRUCK
      ?AUTO_3353 - LOCATION
      ?AUTO_3354 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3352 ?AUTO_3353 ) ( IN-CITY ?AUTO_3353 ?AUTO_3354 ) ( IN-CITY ?AUTO_3351 ?AUTO_3354 ) ( not ( = ?AUTO_3351 ?AUTO_3353 ) ) ( OBJ-AT ?AUTO_3350 ?AUTO_3353 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3350 ?AUTO_3352 ?AUTO_3353 )
      ( DELIVER-PKG ?AUTO_3350 ?AUTO_3351 )
      ( DELIVER-PKG-VERIFY ?AUTO_3350 ?AUTO_3351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3355 - OBJ
      ?AUTO_3356 - LOCATION
    )
    :vars
    (
      ?AUTO_3357 - LOCATION
      ?AUTO_3359 - CITY
      ?AUTO_3358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3357 ?AUTO_3359 ) ( IN-CITY ?AUTO_3356 ?AUTO_3359 ) ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( OBJ-AT ?AUTO_3355 ?AUTO_3357 ) ( TRUCK-AT ?AUTO_3358 ?AUTO_3356 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3358 ?AUTO_3356 ?AUTO_3357 ?AUTO_3359 )
      ( DELIVER-PKG ?AUTO_3355 ?AUTO_3356 )
      ( DELIVER-PKG-VERIFY ?AUTO_3355 ?AUTO_3356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3366 - OBJ
      ?AUTO_3367 - LOCATION
    )
    :vars
    (
      ?AUTO_3368 - LOCATION
      ?AUTO_3369 - CITY
      ?AUTO_3370 - TRUCK
      ?AUTO_3371 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3368 ?AUTO_3369 ) ( IN-CITY ?AUTO_3367 ?AUTO_3369 ) ( not ( = ?AUTO_3367 ?AUTO_3368 ) ) ( OBJ-AT ?AUTO_3366 ?AUTO_3368 ) ( TRUCK-AT ?AUTO_3370 ?AUTO_3371 ) ( IN-CITY ?AUTO_3371 ?AUTO_3369 ) ( not ( = ?AUTO_3367 ?AUTO_3371 ) ) ( not ( = ?AUTO_3368 ?AUTO_3371 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3370 ?AUTO_3371 ?AUTO_3367 ?AUTO_3369 )
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
      ?AUTO_3378 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3378 ?AUTO_3377 ) ( IN-TRUCK ?AUTO_3376 ?AUTO_3378 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3376 ?AUTO_3378 ?AUTO_3377 )
      ( DELIVER-PKG-VERIFY ?AUTO_3376 ?AUTO_3377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3379 - OBJ
      ?AUTO_3380 - LOCATION
    )
    :vars
    (
      ?AUTO_3381 - TRUCK
      ?AUTO_3382 - LOCATION
      ?AUTO_3383 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3379 ?AUTO_3381 ) ( TRUCK-AT ?AUTO_3381 ?AUTO_3382 ) ( IN-CITY ?AUTO_3382 ?AUTO_3383 ) ( IN-CITY ?AUTO_3380 ?AUTO_3383 ) ( not ( = ?AUTO_3380 ?AUTO_3382 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3381 ?AUTO_3382 ?AUTO_3380 ?AUTO_3383 )
      ( DELIVER-PKG ?AUTO_3379 ?AUTO_3380 )
      ( DELIVER-PKG-VERIFY ?AUTO_3379 ?AUTO_3380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3404 - OBJ
      ?AUTO_3405 - LOCATION
    )
    :vars
    (
      ?AUTO_3406 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3404 ?AUTO_3406 ) ( AIRPLANE-AT ?AUTO_3406 ?AUTO_3405 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3404 ?AUTO_3406 ?AUTO_3405 )
      ( DELIVER-PKG-VERIFY ?AUTO_3404 ?AUTO_3405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3407 - OBJ
      ?AUTO_3408 - LOCATION
    )
    :vars
    (
      ?AUTO_3409 - AIRPLANE
      ?AUTO_3410 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3407 ?AUTO_3409 ) ( AIRPORT ?AUTO_3410 ) ( AIRPORT ?AUTO_3408 ) ( AIRPLANE-AT ?AUTO_3409 ?AUTO_3410 ) ( not ( = ?AUTO_3410 ?AUTO_3408 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3409 ?AUTO_3410 ?AUTO_3408 )
      ( DELIVER-PKG ?AUTO_3407 ?AUTO_3408 )
      ( DELIVER-PKG-VERIFY ?AUTO_3407 ?AUTO_3408 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3413 - OBJ
      ?AUTO_3414 - LOCATION
    )
    :vars
    (
      ?AUTO_3416 - LOCATION
      ?AUTO_3415 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3416 ) ( AIRPORT ?AUTO_3414 ) ( AIRPLANE-AT ?AUTO_3415 ?AUTO_3416 ) ( not ( = ?AUTO_3416 ?AUTO_3414 ) ) ( OBJ-AT ?AUTO_3413 ?AUTO_3416 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3413 ?AUTO_3415 ?AUTO_3416 )
      ( DELIVER-PKG ?AUTO_3413 ?AUTO_3414 )
      ( DELIVER-PKG-VERIFY ?AUTO_3413 ?AUTO_3414 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3417 - OBJ
      ?AUTO_3418 - LOCATION
    )
    :vars
    (
      ?AUTO_3420 - LOCATION
      ?AUTO_3419 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3420 ) ( AIRPORT ?AUTO_3418 ) ( not ( = ?AUTO_3420 ?AUTO_3418 ) ) ( OBJ-AT ?AUTO_3417 ?AUTO_3420 ) ( AIRPLANE-AT ?AUTO_3419 ?AUTO_3418 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3419 ?AUTO_3418 ?AUTO_3420 )
      ( DELIVER-PKG ?AUTO_3417 ?AUTO_3418 )
      ( DELIVER-PKG-VERIFY ?AUTO_3417 ?AUTO_3418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3425 - OBJ
      ?AUTO_3426 - LOCATION
    )
    :vars
    (
      ?AUTO_3427 - LOCATION
      ?AUTO_3428 - AIRPLANE
      ?AUTO_3429 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3427 ) ( AIRPORT ?AUTO_3426 ) ( not ( = ?AUTO_3427 ?AUTO_3426 ) ) ( AIRPLANE-AT ?AUTO_3428 ?AUTO_3426 ) ( TRUCK-AT ?AUTO_3429 ?AUTO_3427 ) ( IN-TRUCK ?AUTO_3425 ?AUTO_3429 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3425 ?AUTO_3429 ?AUTO_3427 )
      ( DELIVER-PKG ?AUTO_3425 ?AUTO_3426 )
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
      ?AUTO_3433 - LOCATION
      ?AUTO_3432 - AIRPLANE
      ?AUTO_3434 - TRUCK
      ?AUTO_3435 - LOCATION
      ?AUTO_3436 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3433 ) ( AIRPORT ?AUTO_3431 ) ( not ( = ?AUTO_3433 ?AUTO_3431 ) ) ( AIRPLANE-AT ?AUTO_3432 ?AUTO_3431 ) ( IN-TRUCK ?AUTO_3430 ?AUTO_3434 ) ( TRUCK-AT ?AUTO_3434 ?AUTO_3435 ) ( IN-CITY ?AUTO_3435 ?AUTO_3436 ) ( IN-CITY ?AUTO_3433 ?AUTO_3436 ) ( not ( = ?AUTO_3433 ?AUTO_3435 ) ) ( not ( = ?AUTO_3431 ?AUTO_3435 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3434 ?AUTO_3435 ?AUTO_3433 ?AUTO_3436 )
      ( DELIVER-PKG ?AUTO_3430 ?AUTO_3431 )
      ( DELIVER-PKG-VERIFY ?AUTO_3430 ?AUTO_3431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3437 - OBJ
      ?AUTO_3438 - LOCATION
    )
    :vars
    (
      ?AUTO_3439 - LOCATION
      ?AUTO_3440 - AIRPLANE
      ?AUTO_3441 - TRUCK
      ?AUTO_3443 - LOCATION
      ?AUTO_3442 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3439 ) ( AIRPORT ?AUTO_3438 ) ( not ( = ?AUTO_3439 ?AUTO_3438 ) ) ( AIRPLANE-AT ?AUTO_3440 ?AUTO_3438 ) ( TRUCK-AT ?AUTO_3441 ?AUTO_3443 ) ( IN-CITY ?AUTO_3443 ?AUTO_3442 ) ( IN-CITY ?AUTO_3439 ?AUTO_3442 ) ( not ( = ?AUTO_3439 ?AUTO_3443 ) ) ( not ( = ?AUTO_3438 ?AUTO_3443 ) ) ( OBJ-AT ?AUTO_3437 ?AUTO_3443 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3437 ?AUTO_3441 ?AUTO_3443 )
      ( DELIVER-PKG ?AUTO_3437 ?AUTO_3438 )
      ( DELIVER-PKG-VERIFY ?AUTO_3437 ?AUTO_3438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3444 - OBJ
      ?AUTO_3445 - LOCATION
    )
    :vars
    (
      ?AUTO_3448 - LOCATION
      ?AUTO_3446 - AIRPLANE
      ?AUTO_3447 - LOCATION
      ?AUTO_3449 - CITY
      ?AUTO_3450 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3448 ) ( AIRPORT ?AUTO_3445 ) ( not ( = ?AUTO_3448 ?AUTO_3445 ) ) ( AIRPLANE-AT ?AUTO_3446 ?AUTO_3445 ) ( IN-CITY ?AUTO_3447 ?AUTO_3449 ) ( IN-CITY ?AUTO_3448 ?AUTO_3449 ) ( not ( = ?AUTO_3448 ?AUTO_3447 ) ) ( not ( = ?AUTO_3445 ?AUTO_3447 ) ) ( OBJ-AT ?AUTO_3444 ?AUTO_3447 ) ( TRUCK-AT ?AUTO_3450 ?AUTO_3448 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3450 ?AUTO_3448 ?AUTO_3447 ?AUTO_3449 )
      ( DELIVER-PKG ?AUTO_3444 ?AUTO_3445 )
      ( DELIVER-PKG-VERIFY ?AUTO_3444 ?AUTO_3445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3463 - OBJ
      ?AUTO_3464 - LOCATION
    )
    :vars
    (
      ?AUTO_3465 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3463 ?AUTO_3465 ) ( AIRPLANE-AT ?AUTO_3465 ?AUTO_3464 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3463 ?AUTO_3465 ?AUTO_3464 )
      ( DELIVER-PKG-VERIFY ?AUTO_3463 ?AUTO_3464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3470 - OBJ
      ?AUTO_3471 - LOCATION
    )
    :vars
    (
      ?AUTO_3472 - LOCATION
      ?AUTO_3473 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3472 ) ( AIRPORT ?AUTO_3471 ) ( AIRPLANE-AT ?AUTO_3473 ?AUTO_3472 ) ( not ( = ?AUTO_3472 ?AUTO_3471 ) ) ( OBJ-AT ?AUTO_3470 ?AUTO_3472 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3470 ?AUTO_3473 ?AUTO_3472 )
      ( DELIVER-PKG ?AUTO_3470 ?AUTO_3471 )
      ( DELIVER-PKG-VERIFY ?AUTO_3470 ?AUTO_3471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3502 - OBJ
      ?AUTO_3503 - LOCATION
    )
    :vars
    (
      ?AUTO_3504 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3504 ?AUTO_3503 ) ( IN-TRUCK ?AUTO_3502 ?AUTO_3504 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3502 ?AUTO_3504 ?AUTO_3503 )
      ( DELIVER-PKG-VERIFY ?AUTO_3502 ?AUTO_3503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3505 - OBJ
      ?AUTO_3506 - LOCATION
    )
    :vars
    (
      ?AUTO_3507 - TRUCK
      ?AUTO_3508 - LOCATION
      ?AUTO_3509 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3505 ?AUTO_3507 ) ( TRUCK-AT ?AUTO_3507 ?AUTO_3508 ) ( IN-CITY ?AUTO_3508 ?AUTO_3509 ) ( IN-CITY ?AUTO_3506 ?AUTO_3509 ) ( not ( = ?AUTO_3506 ?AUTO_3508 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3507 ?AUTO_3508 ?AUTO_3506 ?AUTO_3509 )
      ( DELIVER-PKG ?AUTO_3505 ?AUTO_3506 )
      ( DELIVER-PKG-VERIFY ?AUTO_3505 ?AUTO_3506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3512 - OBJ
      ?AUTO_3513 - LOCATION
    )
    :vars
    (
      ?AUTO_3514 - TRUCK
      ?AUTO_3516 - LOCATION
      ?AUTO_3515 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3514 ?AUTO_3516 ) ( IN-CITY ?AUTO_3516 ?AUTO_3515 ) ( IN-CITY ?AUTO_3513 ?AUTO_3515 ) ( not ( = ?AUTO_3513 ?AUTO_3516 ) ) ( OBJ-AT ?AUTO_3512 ?AUTO_3516 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3512 ?AUTO_3514 ?AUTO_3516 )
      ( DELIVER-PKG ?AUTO_3512 ?AUTO_3513 )
      ( DELIVER-PKG-VERIFY ?AUTO_3512 ?AUTO_3513 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3519 - OBJ
      ?AUTO_3520 - LOCATION
    )
    :vars
    (
      ?AUTO_3521 - TRUCK
      ?AUTO_3522 - LOCATION
      ?AUTO_3523 - CITY
      ?AUTO_3524 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3521 ?AUTO_3522 ) ( IN-CITY ?AUTO_3522 ?AUTO_3523 ) ( IN-CITY ?AUTO_3520 ?AUTO_3523 ) ( not ( = ?AUTO_3520 ?AUTO_3522 ) ) ( IN-AIRPLANE ?AUTO_3519 ?AUTO_3524 ) ( AIRPLANE-AT ?AUTO_3524 ?AUTO_3522 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3519 ?AUTO_3524 ?AUTO_3522 )
      ( DELIVER-PKG ?AUTO_3519 ?AUTO_3520 )
      ( DELIVER-PKG-VERIFY ?AUTO_3519 ?AUTO_3520 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3525 - OBJ
      ?AUTO_3526 - LOCATION
    )
    :vars
    (
      ?AUTO_3528 - TRUCK
      ?AUTO_3529 - LOCATION
      ?AUTO_3527 - CITY
      ?AUTO_3530 - AIRPLANE
      ?AUTO_3531 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3528 ?AUTO_3529 ) ( IN-CITY ?AUTO_3529 ?AUTO_3527 ) ( IN-CITY ?AUTO_3526 ?AUTO_3527 ) ( not ( = ?AUTO_3526 ?AUTO_3529 ) ) ( IN-AIRPLANE ?AUTO_3525 ?AUTO_3530 ) ( AIRPORT ?AUTO_3531 ) ( AIRPORT ?AUTO_3529 ) ( AIRPLANE-AT ?AUTO_3530 ?AUTO_3531 ) ( not ( = ?AUTO_3531 ?AUTO_3529 ) ) ( not ( = ?AUTO_3526 ?AUTO_3531 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3530 ?AUTO_3531 ?AUTO_3529 )
      ( DELIVER-PKG ?AUTO_3525 ?AUTO_3526 )
      ( DELIVER-PKG-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3534 - OBJ
      ?AUTO_3535 - LOCATION
    )
    :vars
    (
      ?AUTO_3538 - TRUCK
      ?AUTO_3539 - LOCATION
      ?AUTO_3540 - CITY
      ?AUTO_3537 - LOCATION
      ?AUTO_3536 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3538 ?AUTO_3539 ) ( IN-CITY ?AUTO_3539 ?AUTO_3540 ) ( IN-CITY ?AUTO_3535 ?AUTO_3540 ) ( not ( = ?AUTO_3535 ?AUTO_3539 ) ) ( AIRPORT ?AUTO_3537 ) ( AIRPORT ?AUTO_3539 ) ( AIRPLANE-AT ?AUTO_3536 ?AUTO_3537 ) ( not ( = ?AUTO_3537 ?AUTO_3539 ) ) ( not ( = ?AUTO_3535 ?AUTO_3537 ) ) ( OBJ-AT ?AUTO_3534 ?AUTO_3537 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3534 ?AUTO_3536 ?AUTO_3537 )
      ( DELIVER-PKG ?AUTO_3534 ?AUTO_3535 )
      ( DELIVER-PKG-VERIFY ?AUTO_3534 ?AUTO_3535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3541 - OBJ
      ?AUTO_3542 - LOCATION
    )
    :vars
    (
      ?AUTO_3547 - TRUCK
      ?AUTO_3545 - LOCATION
      ?AUTO_3543 - CITY
      ?AUTO_3546 - LOCATION
      ?AUTO_3544 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3547 ?AUTO_3545 ) ( IN-CITY ?AUTO_3545 ?AUTO_3543 ) ( IN-CITY ?AUTO_3542 ?AUTO_3543 ) ( not ( = ?AUTO_3542 ?AUTO_3545 ) ) ( AIRPORT ?AUTO_3546 ) ( AIRPORT ?AUTO_3545 ) ( not ( = ?AUTO_3546 ?AUTO_3545 ) ) ( not ( = ?AUTO_3542 ?AUTO_3546 ) ) ( OBJ-AT ?AUTO_3541 ?AUTO_3546 ) ( AIRPLANE-AT ?AUTO_3544 ?AUTO_3545 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3544 ?AUTO_3545 ?AUTO_3546 )
      ( DELIVER-PKG ?AUTO_3541 ?AUTO_3542 )
      ( DELIVER-PKG-VERIFY ?AUTO_3541 ?AUTO_3542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3552 - OBJ
      ?AUTO_3553 - LOCATION
    )
    :vars
    (
      ?AUTO_3554 - TRUCK
      ?AUTO_3555 - LOCATION
      ?AUTO_3557 - CITY
      ?AUTO_3558 - LOCATION
      ?AUTO_3556 - AIRPLANE
      ?AUTO_3559 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3554 ?AUTO_3555 ) ( IN-CITY ?AUTO_3555 ?AUTO_3557 ) ( IN-CITY ?AUTO_3553 ?AUTO_3557 ) ( not ( = ?AUTO_3553 ?AUTO_3555 ) ) ( AIRPORT ?AUTO_3558 ) ( AIRPORT ?AUTO_3555 ) ( not ( = ?AUTO_3558 ?AUTO_3555 ) ) ( not ( = ?AUTO_3553 ?AUTO_3558 ) ) ( AIRPLANE-AT ?AUTO_3556 ?AUTO_3555 ) ( TRUCK-AT ?AUTO_3559 ?AUTO_3558 ) ( IN-TRUCK ?AUTO_3552 ?AUTO_3559 ) ( not ( = ?AUTO_3554 ?AUTO_3559 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3552 ?AUTO_3559 ?AUTO_3558 )
      ( DELIVER-PKG ?AUTO_3552 ?AUTO_3553 )
      ( DELIVER-PKG-VERIFY ?AUTO_3552 ?AUTO_3553 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3560 - OBJ
      ?AUTO_3561 - LOCATION
    )
    :vars
    (
      ?AUTO_3562 - TRUCK
      ?AUTO_3563 - LOCATION
      ?AUTO_3565 - CITY
      ?AUTO_3566 - LOCATION
      ?AUTO_3564 - AIRPLANE
      ?AUTO_3567 - TRUCK
      ?AUTO_3568 - LOCATION
      ?AUTO_3569 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3562 ?AUTO_3563 ) ( IN-CITY ?AUTO_3563 ?AUTO_3565 ) ( IN-CITY ?AUTO_3561 ?AUTO_3565 ) ( not ( = ?AUTO_3561 ?AUTO_3563 ) ) ( AIRPORT ?AUTO_3566 ) ( AIRPORT ?AUTO_3563 ) ( not ( = ?AUTO_3566 ?AUTO_3563 ) ) ( not ( = ?AUTO_3561 ?AUTO_3566 ) ) ( AIRPLANE-AT ?AUTO_3564 ?AUTO_3563 ) ( IN-TRUCK ?AUTO_3560 ?AUTO_3567 ) ( not ( = ?AUTO_3562 ?AUTO_3567 ) ) ( TRUCK-AT ?AUTO_3567 ?AUTO_3568 ) ( IN-CITY ?AUTO_3568 ?AUTO_3569 ) ( IN-CITY ?AUTO_3566 ?AUTO_3569 ) ( not ( = ?AUTO_3566 ?AUTO_3568 ) ) ( not ( = ?AUTO_3561 ?AUTO_3568 ) ) ( not ( = ?AUTO_3563 ?AUTO_3568 ) ) ( not ( = ?AUTO_3565 ?AUTO_3569 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3567 ?AUTO_3568 ?AUTO_3566 ?AUTO_3569 )
      ( DELIVER-PKG ?AUTO_3560 ?AUTO_3561 )
      ( DELIVER-PKG-VERIFY ?AUTO_3560 ?AUTO_3561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3570 - OBJ
      ?AUTO_3571 - LOCATION
    )
    :vars
    (
      ?AUTO_3579 - TRUCK
      ?AUTO_3572 - LOCATION
      ?AUTO_3573 - CITY
      ?AUTO_3575 - LOCATION
      ?AUTO_3574 - AIRPLANE
      ?AUTO_3576 - TRUCK
      ?AUTO_3578 - LOCATION
      ?AUTO_3577 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3579 ?AUTO_3572 ) ( IN-CITY ?AUTO_3572 ?AUTO_3573 ) ( IN-CITY ?AUTO_3571 ?AUTO_3573 ) ( not ( = ?AUTO_3571 ?AUTO_3572 ) ) ( AIRPORT ?AUTO_3575 ) ( AIRPORT ?AUTO_3572 ) ( not ( = ?AUTO_3575 ?AUTO_3572 ) ) ( not ( = ?AUTO_3571 ?AUTO_3575 ) ) ( AIRPLANE-AT ?AUTO_3574 ?AUTO_3572 ) ( not ( = ?AUTO_3579 ?AUTO_3576 ) ) ( TRUCK-AT ?AUTO_3576 ?AUTO_3578 ) ( IN-CITY ?AUTO_3578 ?AUTO_3577 ) ( IN-CITY ?AUTO_3575 ?AUTO_3577 ) ( not ( = ?AUTO_3575 ?AUTO_3578 ) ) ( not ( = ?AUTO_3571 ?AUTO_3578 ) ) ( not ( = ?AUTO_3572 ?AUTO_3578 ) ) ( not ( = ?AUTO_3573 ?AUTO_3577 ) ) ( OBJ-AT ?AUTO_3570 ?AUTO_3578 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3570 ?AUTO_3576 ?AUTO_3578 )
      ( DELIVER-PKG ?AUTO_3570 ?AUTO_3571 )
      ( DELIVER-PKG-VERIFY ?AUTO_3570 ?AUTO_3571 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3580 - OBJ
      ?AUTO_3581 - LOCATION
    )
    :vars
    (
      ?AUTO_3584 - TRUCK
      ?AUTO_3585 - LOCATION
      ?AUTO_3589 - CITY
      ?AUTO_3587 - LOCATION
      ?AUTO_3588 - AIRPLANE
      ?AUTO_3583 - TRUCK
      ?AUTO_3586 - LOCATION
      ?AUTO_3582 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3584 ?AUTO_3585 ) ( IN-CITY ?AUTO_3585 ?AUTO_3589 ) ( IN-CITY ?AUTO_3581 ?AUTO_3589 ) ( not ( = ?AUTO_3581 ?AUTO_3585 ) ) ( AIRPORT ?AUTO_3587 ) ( AIRPORT ?AUTO_3585 ) ( not ( = ?AUTO_3587 ?AUTO_3585 ) ) ( not ( = ?AUTO_3581 ?AUTO_3587 ) ) ( AIRPLANE-AT ?AUTO_3588 ?AUTO_3585 ) ( not ( = ?AUTO_3584 ?AUTO_3583 ) ) ( IN-CITY ?AUTO_3586 ?AUTO_3582 ) ( IN-CITY ?AUTO_3587 ?AUTO_3582 ) ( not ( = ?AUTO_3587 ?AUTO_3586 ) ) ( not ( = ?AUTO_3581 ?AUTO_3586 ) ) ( not ( = ?AUTO_3585 ?AUTO_3586 ) ) ( not ( = ?AUTO_3589 ?AUTO_3582 ) ) ( OBJ-AT ?AUTO_3580 ?AUTO_3586 ) ( TRUCK-AT ?AUTO_3583 ?AUTO_3587 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3583 ?AUTO_3587 ?AUTO_3586 ?AUTO_3582 )
      ( DELIVER-PKG ?AUTO_3580 ?AUTO_3581 )
      ( DELIVER-PKG-VERIFY ?AUTO_3580 ?AUTO_3581 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3590 - OBJ
      ?AUTO_3591 - LOCATION
    )
    :vars
    (
      ?AUTO_3596 - LOCATION
      ?AUTO_3595 - CITY
      ?AUTO_3597 - LOCATION
      ?AUTO_3599 - AIRPLANE
      ?AUTO_3592 - TRUCK
      ?AUTO_3598 - TRUCK
      ?AUTO_3593 - LOCATION
      ?AUTO_3594 - CITY
      ?AUTO_3600 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3596 ?AUTO_3595 ) ( IN-CITY ?AUTO_3591 ?AUTO_3595 ) ( not ( = ?AUTO_3591 ?AUTO_3596 ) ) ( AIRPORT ?AUTO_3597 ) ( AIRPORT ?AUTO_3596 ) ( not ( = ?AUTO_3597 ?AUTO_3596 ) ) ( not ( = ?AUTO_3591 ?AUTO_3597 ) ) ( AIRPLANE-AT ?AUTO_3599 ?AUTO_3596 ) ( not ( = ?AUTO_3592 ?AUTO_3598 ) ) ( IN-CITY ?AUTO_3593 ?AUTO_3594 ) ( IN-CITY ?AUTO_3597 ?AUTO_3594 ) ( not ( = ?AUTO_3597 ?AUTO_3593 ) ) ( not ( = ?AUTO_3591 ?AUTO_3593 ) ) ( not ( = ?AUTO_3596 ?AUTO_3593 ) ) ( not ( = ?AUTO_3595 ?AUTO_3594 ) ) ( OBJ-AT ?AUTO_3590 ?AUTO_3593 ) ( TRUCK-AT ?AUTO_3598 ?AUTO_3597 ) ( TRUCK-AT ?AUTO_3592 ?AUTO_3600 ) ( IN-CITY ?AUTO_3600 ?AUTO_3595 ) ( not ( = ?AUTO_3596 ?AUTO_3600 ) ) ( not ( = ?AUTO_3591 ?AUTO_3600 ) ) ( not ( = ?AUTO_3597 ?AUTO_3600 ) ) ( not ( = ?AUTO_3593 ?AUTO_3600 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3592 ?AUTO_3600 ?AUTO_3596 ?AUTO_3595 )
      ( DELIVER-PKG ?AUTO_3590 ?AUTO_3591 )
      ( DELIVER-PKG-VERIFY ?AUTO_3590 ?AUTO_3591 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3611 - OBJ
      ?AUTO_3612 - LOCATION
    )
    :vars
    (
      ?AUTO_3613 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3613 ?AUTO_3612 ) ( IN-TRUCK ?AUTO_3611 ?AUTO_3613 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3611 ?AUTO_3613 ?AUTO_3612 )
      ( DELIVER-PKG-VERIFY ?AUTO_3611 ?AUTO_3612 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3618 - OBJ
      ?AUTO_3619 - LOCATION
    )
    :vars
    (
      ?AUTO_3621 - TRUCK
      ?AUTO_3620 - LOCATION
      ?AUTO_3622 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3621 ?AUTO_3620 ) ( IN-CITY ?AUTO_3620 ?AUTO_3622 ) ( IN-CITY ?AUTO_3619 ?AUTO_3622 ) ( not ( = ?AUTO_3619 ?AUTO_3620 ) ) ( OBJ-AT ?AUTO_3618 ?AUTO_3620 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3618 ?AUTO_3621 ?AUTO_3620 )
      ( DELIVER-PKG ?AUTO_3618 ?AUTO_3619 )
      ( DELIVER-PKG-VERIFY ?AUTO_3618 ?AUTO_3619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3625 - OBJ
      ?AUTO_3626 - LOCATION
    )
    :vars
    (
      ?AUTO_3628 - TRUCK
      ?AUTO_3627 - LOCATION
      ?AUTO_3629 - CITY
      ?AUTO_3630 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3628 ?AUTO_3627 ) ( IN-CITY ?AUTO_3627 ?AUTO_3629 ) ( IN-CITY ?AUTO_3626 ?AUTO_3629 ) ( not ( = ?AUTO_3626 ?AUTO_3627 ) ) ( IN-AIRPLANE ?AUTO_3625 ?AUTO_3630 ) ( AIRPLANE-AT ?AUTO_3630 ?AUTO_3627 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3625 ?AUTO_3630 ?AUTO_3627 )
      ( DELIVER-PKG ?AUTO_3625 ?AUTO_3626 )
      ( DELIVER-PKG-VERIFY ?AUTO_3625 ?AUTO_3626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3635 - OBJ
      ?AUTO_3636 - LOCATION
    )
    :vars
    (
      ?AUTO_3641 - TRUCK
      ?AUTO_3639 - LOCATION
      ?AUTO_3640 - CITY
      ?AUTO_3637 - LOCATION
      ?AUTO_3638 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3641 ?AUTO_3639 ) ( IN-CITY ?AUTO_3639 ?AUTO_3640 ) ( IN-CITY ?AUTO_3636 ?AUTO_3640 ) ( not ( = ?AUTO_3636 ?AUTO_3639 ) ) ( AIRPORT ?AUTO_3637 ) ( AIRPORT ?AUTO_3639 ) ( AIRPLANE-AT ?AUTO_3638 ?AUTO_3637 ) ( not ( = ?AUTO_3637 ?AUTO_3639 ) ) ( not ( = ?AUTO_3636 ?AUTO_3637 ) ) ( OBJ-AT ?AUTO_3635 ?AUTO_3637 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3635 ?AUTO_3638 ?AUTO_3637 )
      ( DELIVER-PKG ?AUTO_3635 ?AUTO_3636 )
      ( DELIVER-PKG-VERIFY ?AUTO_3635 ?AUTO_3636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3662 - OBJ
      ?AUTO_3663 - LOCATION
    )
    :vars
    (
      ?AUTO_3668 - LOCATION
      ?AUTO_3667 - CITY
      ?AUTO_3669 - LOCATION
      ?AUTO_3665 - AIRPLANE
      ?AUTO_3666 - TRUCK
      ?AUTO_3671 - TRUCK
      ?AUTO_3664 - LOCATION
      ?AUTO_3670 - CITY
      ?AUTO_3672 - LOCATION
      ?AUTO_3673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3668 ?AUTO_3667 ) ( IN-CITY ?AUTO_3663 ?AUTO_3667 ) ( not ( = ?AUTO_3663 ?AUTO_3668 ) ) ( AIRPORT ?AUTO_3669 ) ( AIRPORT ?AUTO_3668 ) ( not ( = ?AUTO_3669 ?AUTO_3668 ) ) ( not ( = ?AUTO_3663 ?AUTO_3669 ) ) ( AIRPLANE-AT ?AUTO_3665 ?AUTO_3668 ) ( not ( = ?AUTO_3666 ?AUTO_3671 ) ) ( IN-CITY ?AUTO_3664 ?AUTO_3670 ) ( IN-CITY ?AUTO_3669 ?AUTO_3670 ) ( not ( = ?AUTO_3669 ?AUTO_3664 ) ) ( not ( = ?AUTO_3663 ?AUTO_3664 ) ) ( not ( = ?AUTO_3668 ?AUTO_3664 ) ) ( not ( = ?AUTO_3667 ?AUTO_3670 ) ) ( TRUCK-AT ?AUTO_3671 ?AUTO_3669 ) ( TRUCK-AT ?AUTO_3666 ?AUTO_3672 ) ( IN-CITY ?AUTO_3672 ?AUTO_3667 ) ( not ( = ?AUTO_3668 ?AUTO_3672 ) ) ( not ( = ?AUTO_3663 ?AUTO_3672 ) ) ( not ( = ?AUTO_3669 ?AUTO_3672 ) ) ( not ( = ?AUTO_3664 ?AUTO_3672 ) ) ( TRUCK-AT ?AUTO_3673 ?AUTO_3664 ) ( IN-TRUCK ?AUTO_3662 ?AUTO_3673 ) ( not ( = ?AUTO_3666 ?AUTO_3673 ) ) ( not ( = ?AUTO_3671 ?AUTO_3673 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3662 ?AUTO_3673 ?AUTO_3664 )
      ( DELIVER-PKG ?AUTO_3662 ?AUTO_3663 )
      ( DELIVER-PKG-VERIFY ?AUTO_3662 ?AUTO_3663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3680 - OBJ
      ?AUTO_3681 - LOCATION
    )
    :vars
    (
      ?AUTO_3682 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3682 ?AUTO_3681 ) ( IN-TRUCK ?AUTO_3680 ?AUTO_3682 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3680 ?AUTO_3682 ?AUTO_3681 )
      ( DELIVER-PKG-VERIFY ?AUTO_3680 ?AUTO_3681 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3683 - OBJ
      ?AUTO_3684 - LOCATION
    )
    :vars
    (
      ?AUTO_3685 - TRUCK
      ?AUTO_3686 - LOCATION
      ?AUTO_3687 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3683 ?AUTO_3685 ) ( TRUCK-AT ?AUTO_3685 ?AUTO_3686 ) ( IN-CITY ?AUTO_3686 ?AUTO_3687 ) ( IN-CITY ?AUTO_3684 ?AUTO_3687 ) ( not ( = ?AUTO_3684 ?AUTO_3686 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3685 ?AUTO_3686 ?AUTO_3684 ?AUTO_3687 )
      ( DELIVER-PKG ?AUTO_3683 ?AUTO_3684 )
      ( DELIVER-PKG-VERIFY ?AUTO_3683 ?AUTO_3684 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3688 - OBJ
      ?AUTO_3689 - LOCATION
    )
    :vars
    (
      ?AUTO_3690 - TRUCK
      ?AUTO_3691 - LOCATION
      ?AUTO_3692 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3690 ?AUTO_3691 ) ( IN-CITY ?AUTO_3691 ?AUTO_3692 ) ( IN-CITY ?AUTO_3689 ?AUTO_3692 ) ( not ( = ?AUTO_3689 ?AUTO_3691 ) ) ( OBJ-AT ?AUTO_3688 ?AUTO_3691 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3688 ?AUTO_3690 ?AUTO_3691 )
      ( DELIVER-PKG ?AUTO_3688 ?AUTO_3689 )
      ( DELIVER-PKG-VERIFY ?AUTO_3688 ?AUTO_3689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3693 - OBJ
      ?AUTO_3694 - LOCATION
    )
    :vars
    (
      ?AUTO_3695 - LOCATION
      ?AUTO_3697 - CITY
      ?AUTO_3696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3695 ?AUTO_3697 ) ( IN-CITY ?AUTO_3694 ?AUTO_3697 ) ( not ( = ?AUTO_3694 ?AUTO_3695 ) ) ( OBJ-AT ?AUTO_3693 ?AUTO_3695 ) ( TRUCK-AT ?AUTO_3696 ?AUTO_3694 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3696 ?AUTO_3694 ?AUTO_3695 ?AUTO_3697 )
      ( DELIVER-PKG ?AUTO_3693 ?AUTO_3694 )
      ( DELIVER-PKG-VERIFY ?AUTO_3693 ?AUTO_3694 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3700 - OBJ
      ?AUTO_3701 - LOCATION
    )
    :vars
    (
      ?AUTO_3702 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3702 ?AUTO_3701 ) ( IN-TRUCK ?AUTO_3700 ?AUTO_3702 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3700 ?AUTO_3702 ?AUTO_3701 )
      ( DELIVER-PKG-VERIFY ?AUTO_3700 ?AUTO_3701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3705 - OBJ
      ?AUTO_3706 - LOCATION
    )
    :vars
    (
      ?AUTO_3707 - TRUCK
      ?AUTO_3708 - LOCATION
      ?AUTO_3709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3705 ?AUTO_3707 ) ( TRUCK-AT ?AUTO_3707 ?AUTO_3708 ) ( IN-CITY ?AUTO_3708 ?AUTO_3709 ) ( IN-CITY ?AUTO_3706 ?AUTO_3709 ) ( not ( = ?AUTO_3706 ?AUTO_3708 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3707 ?AUTO_3708 ?AUTO_3706 ?AUTO_3709 )
      ( DELIVER-PKG ?AUTO_3705 ?AUTO_3706 )
      ( DELIVER-PKG-VERIFY ?AUTO_3705 ?AUTO_3706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3710 - OBJ
      ?AUTO_3711 - LOCATION
    )
    :vars
    (
      ?AUTO_3712 - TRUCK
      ?AUTO_3713 - LOCATION
      ?AUTO_3714 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3712 ?AUTO_3713 ) ( IN-CITY ?AUTO_3713 ?AUTO_3714 ) ( IN-CITY ?AUTO_3711 ?AUTO_3714 ) ( not ( = ?AUTO_3711 ?AUTO_3713 ) ) ( OBJ-AT ?AUTO_3710 ?AUTO_3713 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3710 ?AUTO_3712 ?AUTO_3713 )
      ( DELIVER-PKG ?AUTO_3710 ?AUTO_3711 )
      ( DELIVER-PKG-VERIFY ?AUTO_3710 ?AUTO_3711 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3717 - OBJ
      ?AUTO_3718 - LOCATION
    )
    :vars
    (
      ?AUTO_3719 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3719 ?AUTO_3718 ) ( IN-TRUCK ?AUTO_3717 ?AUTO_3719 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3717 ?AUTO_3719 ?AUTO_3718 )
      ( DELIVER-PKG-VERIFY ?AUTO_3717 ?AUTO_3718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3720 - OBJ
      ?AUTO_3721 - LOCATION
    )
    :vars
    (
      ?AUTO_3722 - TRUCK
      ?AUTO_3723 - LOCATION
      ?AUTO_3724 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3720 ?AUTO_3722 ) ( TRUCK-AT ?AUTO_3722 ?AUTO_3723 ) ( IN-CITY ?AUTO_3723 ?AUTO_3724 ) ( IN-CITY ?AUTO_3721 ?AUTO_3724 ) ( not ( = ?AUTO_3721 ?AUTO_3723 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3722 ?AUTO_3723 ?AUTO_3721 ?AUTO_3724 )
      ( DELIVER-PKG ?AUTO_3720 ?AUTO_3721 )
      ( DELIVER-PKG-VERIFY ?AUTO_3720 ?AUTO_3721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3731 - OBJ
      ?AUTO_3732 - LOCATION
    )
    :vars
    (
      ?AUTO_3734 - TRUCK
      ?AUTO_3735 - LOCATION
      ?AUTO_3733 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3734 ?AUTO_3735 ) ( IN-CITY ?AUTO_3735 ?AUTO_3733 ) ( IN-CITY ?AUTO_3732 ?AUTO_3733 ) ( not ( = ?AUTO_3732 ?AUTO_3735 ) ) ( OBJ-AT ?AUTO_3731 ?AUTO_3735 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3731 ?AUTO_3734 ?AUTO_3735 )
      ( DELIVER-PKG ?AUTO_3731 ?AUTO_3732 )
      ( DELIVER-PKG-VERIFY ?AUTO_3731 ?AUTO_3732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3742 - OBJ
      ?AUTO_3743 - LOCATION
    )
    :vars
    (
      ?AUTO_3744 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3744 ?AUTO_3743 ) ( IN-TRUCK ?AUTO_3742 ?AUTO_3744 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3742 ?AUTO_3744 ?AUTO_3743 )
      ( DELIVER-PKG-VERIFY ?AUTO_3742 ?AUTO_3743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3749 - OBJ
      ?AUTO_3750 - LOCATION
    )
    :vars
    (
      ?AUTO_3752 - TRUCK
      ?AUTO_3751 - LOCATION
      ?AUTO_3753 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3752 ?AUTO_3751 ) ( IN-CITY ?AUTO_3751 ?AUTO_3753 ) ( IN-CITY ?AUTO_3750 ?AUTO_3753 ) ( not ( = ?AUTO_3750 ?AUTO_3751 ) ) ( OBJ-AT ?AUTO_3749 ?AUTO_3751 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3749 ?AUTO_3752 ?AUTO_3751 )
      ( DELIVER-PKG ?AUTO_3749 ?AUTO_3750 )
      ( DELIVER-PKG-VERIFY ?AUTO_3749 ?AUTO_3750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3766 - OBJ
      ?AUTO_3767 - LOCATION
    )
    :vars
    (
      ?AUTO_3768 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3766 ?AUTO_3768 ) ( AIRPLANE-AT ?AUTO_3768 ?AUTO_3767 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3766 ?AUTO_3768 ?AUTO_3767 )
      ( DELIVER-PKG-VERIFY ?AUTO_3766 ?AUTO_3767 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3773 - OBJ
      ?AUTO_3774 - LOCATION
    )
    :vars
    (
      ?AUTO_3775 - AIRPLANE
      ?AUTO_3776 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3773 ?AUTO_3775 ) ( AIRPORT ?AUTO_3776 ) ( AIRPORT ?AUTO_3774 ) ( AIRPLANE-AT ?AUTO_3775 ?AUTO_3776 ) ( not ( = ?AUTO_3776 ?AUTO_3774 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3775 ?AUTO_3776 ?AUTO_3774 )
      ( DELIVER-PKG ?AUTO_3773 ?AUTO_3774 )
      ( DELIVER-PKG-VERIFY ?AUTO_3773 ?AUTO_3774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3791 - OBJ
      ?AUTO_3792 - LOCATION
    )
    :vars
    (
      ?AUTO_3793 - LOCATION
      ?AUTO_3794 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3793 ) ( AIRPORT ?AUTO_3792 ) ( AIRPLANE-AT ?AUTO_3794 ?AUTO_3793 ) ( not ( = ?AUTO_3793 ?AUTO_3792 ) ) ( OBJ-AT ?AUTO_3791 ?AUTO_3793 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3791 ?AUTO_3794 ?AUTO_3793 )
      ( DELIVER-PKG ?AUTO_3791 ?AUTO_3792 )
      ( DELIVER-PKG-VERIFY ?AUTO_3791 ?AUTO_3792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3805 - OBJ
      ?AUTO_3806 - LOCATION
    )
    :vars
    (
      ?AUTO_3807 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3805 ?AUTO_3807 ) ( AIRPLANE-AT ?AUTO_3807 ?AUTO_3806 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3805 ?AUTO_3807 ?AUTO_3806 )
      ( DELIVER-PKG-VERIFY ?AUTO_3805 ?AUTO_3806 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3808 - OBJ
      ?AUTO_3809 - LOCATION
    )
    :vars
    (
      ?AUTO_3810 - AIRPLANE
      ?AUTO_3811 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3808 ?AUTO_3810 ) ( AIRPORT ?AUTO_3811 ) ( AIRPORT ?AUTO_3809 ) ( AIRPLANE-AT ?AUTO_3810 ?AUTO_3811 ) ( not ( = ?AUTO_3811 ?AUTO_3809 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3810 ?AUTO_3811 ?AUTO_3809 )
      ( DELIVER-PKG ?AUTO_3808 ?AUTO_3809 )
      ( DELIVER-PKG-VERIFY ?AUTO_3808 ?AUTO_3809 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3820 - OBJ
      ?AUTO_3821 - LOCATION
    )
    :vars
    (
      ?AUTO_3822 - LOCATION
      ?AUTO_3823 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3822 ) ( AIRPORT ?AUTO_3821 ) ( AIRPLANE-AT ?AUTO_3823 ?AUTO_3822 ) ( not ( = ?AUTO_3822 ?AUTO_3821 ) ) ( OBJ-AT ?AUTO_3820 ?AUTO_3822 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3820 ?AUTO_3823 ?AUTO_3822 )
      ( DELIVER-PKG ?AUTO_3820 ?AUTO_3821 )
      ( DELIVER-PKG-VERIFY ?AUTO_3820 ?AUTO_3821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3824 - OBJ
      ?AUTO_3825 - LOCATION
    )
    :vars
    (
      ?AUTO_3827 - LOCATION
      ?AUTO_3826 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3827 ) ( AIRPORT ?AUTO_3825 ) ( not ( = ?AUTO_3827 ?AUTO_3825 ) ) ( OBJ-AT ?AUTO_3824 ?AUTO_3827 ) ( AIRPLANE-AT ?AUTO_3826 ?AUTO_3825 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3826 ?AUTO_3825 ?AUTO_3827 )
      ( DELIVER-PKG ?AUTO_3824 ?AUTO_3825 )
      ( DELIVER-PKG-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3854 - OBJ
      ?AUTO_3855 - LOCATION
    )
    :vars
    (
      ?AUTO_3856 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3854 ?AUTO_3856 ) ( AIRPLANE-AT ?AUTO_3856 ?AUTO_3855 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3854 ?AUTO_3856 ?AUTO_3855 )
      ( DELIVER-PKG-VERIFY ?AUTO_3854 ?AUTO_3855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3867 - OBJ
      ?AUTO_3868 - LOCATION
    )
    :vars
    (
      ?AUTO_3870 - LOCATION
      ?AUTO_3869 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3870 ) ( AIRPORT ?AUTO_3868 ) ( AIRPLANE-AT ?AUTO_3869 ?AUTO_3870 ) ( not ( = ?AUTO_3870 ?AUTO_3868 ) ) ( OBJ-AT ?AUTO_3867 ?AUTO_3870 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3867 ?AUTO_3869 ?AUTO_3870 )
      ( DELIVER-PKG ?AUTO_3867 ?AUTO_3868 )
      ( DELIVER-PKG-VERIFY ?AUTO_3867 ?AUTO_3868 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3883 - OBJ
      ?AUTO_3884 - LOCATION
    )
    :vars
    (
      ?AUTO_3886 - LOCATION
      ?AUTO_3885 - AIRPLANE
      ?AUTO_3887 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3886 ) ( AIRPORT ?AUTO_3884 ) ( not ( = ?AUTO_3886 ?AUTO_3884 ) ) ( AIRPLANE-AT ?AUTO_3885 ?AUTO_3884 ) ( TRUCK-AT ?AUTO_3887 ?AUTO_3886 ) ( IN-TRUCK ?AUTO_3883 ?AUTO_3887 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3883 ?AUTO_3887 ?AUTO_3886 )
      ( DELIVER-PKG ?AUTO_3883 ?AUTO_3884 )
      ( DELIVER-PKG-VERIFY ?AUTO_3883 ?AUTO_3884 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3888 - OBJ
      ?AUTO_3889 - LOCATION
    )
    :vars
    (
      ?AUTO_3890 - LOCATION
      ?AUTO_3891 - AIRPLANE
      ?AUTO_3892 - TRUCK
      ?AUTO_3893 - LOCATION
      ?AUTO_3894 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3890 ) ( AIRPORT ?AUTO_3889 ) ( not ( = ?AUTO_3890 ?AUTO_3889 ) ) ( AIRPLANE-AT ?AUTO_3891 ?AUTO_3889 ) ( IN-TRUCK ?AUTO_3888 ?AUTO_3892 ) ( TRUCK-AT ?AUTO_3892 ?AUTO_3893 ) ( IN-CITY ?AUTO_3893 ?AUTO_3894 ) ( IN-CITY ?AUTO_3890 ?AUTO_3894 ) ( not ( = ?AUTO_3890 ?AUTO_3893 ) ) ( not ( = ?AUTO_3889 ?AUTO_3893 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3892 ?AUTO_3893 ?AUTO_3890 ?AUTO_3894 )
      ( DELIVER-PKG ?AUTO_3888 ?AUTO_3889 )
      ( DELIVER-PKG-VERIFY ?AUTO_3888 ?AUTO_3889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3901 - OBJ
      ?AUTO_3902 - LOCATION
    )
    :vars
    (
      ?AUTO_3906 - LOCATION
      ?AUTO_3903 - AIRPLANE
      ?AUTO_3907 - TRUCK
      ?AUTO_3904 - LOCATION
      ?AUTO_3905 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3906 ) ( AIRPORT ?AUTO_3902 ) ( not ( = ?AUTO_3906 ?AUTO_3902 ) ) ( AIRPLANE-AT ?AUTO_3903 ?AUTO_3902 ) ( TRUCK-AT ?AUTO_3907 ?AUTO_3904 ) ( IN-CITY ?AUTO_3904 ?AUTO_3905 ) ( IN-CITY ?AUTO_3906 ?AUTO_3905 ) ( not ( = ?AUTO_3906 ?AUTO_3904 ) ) ( not ( = ?AUTO_3902 ?AUTO_3904 ) ) ( OBJ-AT ?AUTO_3901 ?AUTO_3904 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3901 ?AUTO_3907 ?AUTO_3904 )
      ( DELIVER-PKG ?AUTO_3901 ?AUTO_3902 )
      ( DELIVER-PKG-VERIFY ?AUTO_3901 ?AUTO_3902 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3914 - OBJ
      ?AUTO_3915 - LOCATION
    )
    :vars
    (
      ?AUTO_3916 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3916 ?AUTO_3915 ) ( IN-TRUCK ?AUTO_3914 ?AUTO_3916 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3914 ?AUTO_3916 ?AUTO_3915 )
      ( DELIVER-PKG-VERIFY ?AUTO_3914 ?AUTO_3915 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3923 - OBJ
      ?AUTO_3924 - LOCATION
    )
    :vars
    (
      ?AUTO_3925 - TRUCK
      ?AUTO_3926 - LOCATION
      ?AUTO_3927 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3923 ?AUTO_3925 ) ( TRUCK-AT ?AUTO_3925 ?AUTO_3926 ) ( IN-CITY ?AUTO_3926 ?AUTO_3927 ) ( IN-CITY ?AUTO_3924 ?AUTO_3927 ) ( not ( = ?AUTO_3924 ?AUTO_3926 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3925 ?AUTO_3926 ?AUTO_3924 ?AUTO_3927 )
      ( DELIVER-PKG ?AUTO_3923 ?AUTO_3924 )
      ( DELIVER-PKG-VERIFY ?AUTO_3923 ?AUTO_3924 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3928 - OBJ
      ?AUTO_3929 - LOCATION
    )
    :vars
    (
      ?AUTO_3930 - TRUCK
      ?AUTO_3931 - LOCATION
      ?AUTO_3932 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3930 ?AUTO_3931 ) ( IN-CITY ?AUTO_3931 ?AUTO_3932 ) ( IN-CITY ?AUTO_3929 ?AUTO_3932 ) ( not ( = ?AUTO_3929 ?AUTO_3931 ) ) ( OBJ-AT ?AUTO_3928 ?AUTO_3931 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3928 ?AUTO_3930 ?AUTO_3931 )
      ( DELIVER-PKG ?AUTO_3928 ?AUTO_3929 )
      ( DELIVER-PKG-VERIFY ?AUTO_3928 ?AUTO_3929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3933 - OBJ
      ?AUTO_3934 - LOCATION
    )
    :vars
    (
      ?AUTO_3935 - TRUCK
      ?AUTO_3936 - LOCATION
      ?AUTO_3937 - CITY
      ?AUTO_3938 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3935 ?AUTO_3936 ) ( IN-CITY ?AUTO_3936 ?AUTO_3937 ) ( IN-CITY ?AUTO_3934 ?AUTO_3937 ) ( not ( = ?AUTO_3934 ?AUTO_3936 ) ) ( IN-AIRPLANE ?AUTO_3933 ?AUTO_3938 ) ( AIRPLANE-AT ?AUTO_3938 ?AUTO_3936 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3933 ?AUTO_3938 ?AUTO_3936 )
      ( DELIVER-PKG ?AUTO_3933 ?AUTO_3934 )
      ( DELIVER-PKG-VERIFY ?AUTO_3933 ?AUTO_3934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3943 - OBJ
      ?AUTO_3944 - LOCATION
    )
    :vars
    (
      ?AUTO_3945 - TRUCK
      ?AUTO_3948 - LOCATION
      ?AUTO_3946 - CITY
      ?AUTO_3947 - AIRPLANE
      ?AUTO_3949 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3945 ?AUTO_3948 ) ( IN-CITY ?AUTO_3948 ?AUTO_3946 ) ( IN-CITY ?AUTO_3944 ?AUTO_3946 ) ( not ( = ?AUTO_3944 ?AUTO_3948 ) ) ( IN-AIRPLANE ?AUTO_3943 ?AUTO_3947 ) ( AIRPORT ?AUTO_3949 ) ( AIRPORT ?AUTO_3948 ) ( AIRPLANE-AT ?AUTO_3947 ?AUTO_3949 ) ( not ( = ?AUTO_3949 ?AUTO_3948 ) ) ( not ( = ?AUTO_3944 ?AUTO_3949 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3947 ?AUTO_3949 ?AUTO_3948 )
      ( DELIVER-PKG ?AUTO_3943 ?AUTO_3944 )
      ( DELIVER-PKG-VERIFY ?AUTO_3943 ?AUTO_3944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3960 - OBJ
      ?AUTO_3961 - LOCATION
    )
    :vars
    (
      ?AUTO_3963 - LOCATION
      ?AUTO_3966 - CITY
      ?AUTO_3965 - AIRPLANE
      ?AUTO_3964 - LOCATION
      ?AUTO_3962 - TRUCK
      ?AUTO_3967 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3963 ?AUTO_3966 ) ( IN-CITY ?AUTO_3961 ?AUTO_3966 ) ( not ( = ?AUTO_3961 ?AUTO_3963 ) ) ( IN-AIRPLANE ?AUTO_3960 ?AUTO_3965 ) ( AIRPORT ?AUTO_3964 ) ( AIRPORT ?AUTO_3963 ) ( AIRPLANE-AT ?AUTO_3965 ?AUTO_3964 ) ( not ( = ?AUTO_3964 ?AUTO_3963 ) ) ( not ( = ?AUTO_3961 ?AUTO_3964 ) ) ( TRUCK-AT ?AUTO_3962 ?AUTO_3967 ) ( IN-CITY ?AUTO_3967 ?AUTO_3966 ) ( not ( = ?AUTO_3963 ?AUTO_3967 ) ) ( not ( = ?AUTO_3961 ?AUTO_3967 ) ) ( not ( = ?AUTO_3964 ?AUTO_3967 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3962 ?AUTO_3967 ?AUTO_3963 ?AUTO_3966 )
      ( DELIVER-PKG ?AUTO_3960 ?AUTO_3961 )
      ( DELIVER-PKG-VERIFY ?AUTO_3960 ?AUTO_3961 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3970 - OBJ
      ?AUTO_3971 - LOCATION
    )
    :vars
    (
      ?AUTO_3974 - LOCATION
      ?AUTO_3972 - CITY
      ?AUTO_3973 - LOCATION
      ?AUTO_3975 - AIRPLANE
      ?AUTO_3976 - TRUCK
      ?AUTO_3977 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3974 ?AUTO_3972 ) ( IN-CITY ?AUTO_3971 ?AUTO_3972 ) ( not ( = ?AUTO_3971 ?AUTO_3974 ) ) ( AIRPORT ?AUTO_3973 ) ( AIRPORT ?AUTO_3974 ) ( AIRPLANE-AT ?AUTO_3975 ?AUTO_3973 ) ( not ( = ?AUTO_3973 ?AUTO_3974 ) ) ( not ( = ?AUTO_3971 ?AUTO_3973 ) ) ( TRUCK-AT ?AUTO_3976 ?AUTO_3977 ) ( IN-CITY ?AUTO_3977 ?AUTO_3972 ) ( not ( = ?AUTO_3974 ?AUTO_3977 ) ) ( not ( = ?AUTO_3971 ?AUTO_3977 ) ) ( not ( = ?AUTO_3973 ?AUTO_3977 ) ) ( OBJ-AT ?AUTO_3970 ?AUTO_3973 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3970 ?AUTO_3975 ?AUTO_3973 )
      ( DELIVER-PKG ?AUTO_3970 ?AUTO_3971 )
      ( DELIVER-PKG-VERIFY ?AUTO_3970 ?AUTO_3971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3988 - OBJ
      ?AUTO_3989 - LOCATION
    )
    :vars
    (
      ?AUTO_3990 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3990 ?AUTO_3989 ) ( IN-TRUCK ?AUTO_3988 ?AUTO_3990 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3988 ?AUTO_3990 ?AUTO_3989 )
      ( DELIVER-PKG-VERIFY ?AUTO_3988 ?AUTO_3989 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3991 - OBJ
      ?AUTO_3992 - LOCATION
    )
    :vars
    (
      ?AUTO_3993 - TRUCK
      ?AUTO_3994 - LOCATION
      ?AUTO_3995 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3991 ?AUTO_3993 ) ( TRUCK-AT ?AUTO_3993 ?AUTO_3994 ) ( IN-CITY ?AUTO_3994 ?AUTO_3995 ) ( IN-CITY ?AUTO_3992 ?AUTO_3995 ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3993 ?AUTO_3994 ?AUTO_3992 ?AUTO_3995 )
      ( DELIVER-PKG ?AUTO_3991 ?AUTO_3992 )
      ( DELIVER-PKG-VERIFY ?AUTO_3991 ?AUTO_3992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4020 - OBJ
      ?AUTO_4021 - LOCATION
    )
    :vars
    (
      ?AUTO_4022 - LOCATION
      ?AUTO_4023 - CITY
      ?AUTO_4024 - TRUCK
      ?AUTO_4025 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4022 ?AUTO_4023 ) ( IN-CITY ?AUTO_4021 ?AUTO_4023 ) ( not ( = ?AUTO_4021 ?AUTO_4022 ) ) ( OBJ-AT ?AUTO_4020 ?AUTO_4022 ) ( TRUCK-AT ?AUTO_4024 ?AUTO_4025 ) ( IN-CITY ?AUTO_4025 ?AUTO_4023 ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4021 ?AUTO_4025 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4024 ?AUTO_4025 ?AUTO_4022 ?AUTO_4023 )
      ( DELIVER-PKG ?AUTO_4020 ?AUTO_4021 )
      ( DELIVER-PKG-VERIFY ?AUTO_4020 ?AUTO_4021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4046 - OBJ
      ?AUTO_4047 - LOCATION
    )
    :vars
    (
      ?AUTO_4048 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4048 ?AUTO_4047 ) ( IN-TRUCK ?AUTO_4046 ?AUTO_4048 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4046 ?AUTO_4048 ?AUTO_4047 )
      ( DELIVER-PKG-VERIFY ?AUTO_4046 ?AUTO_4047 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4049 - OBJ
      ?AUTO_4050 - LOCATION
    )
    :vars
    (
      ?AUTO_4051 - TRUCK
      ?AUTO_4052 - LOCATION
      ?AUTO_4053 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4049 ?AUTO_4051 ) ( TRUCK-AT ?AUTO_4051 ?AUTO_4052 ) ( IN-CITY ?AUTO_4052 ?AUTO_4053 ) ( IN-CITY ?AUTO_4050 ?AUTO_4053 ) ( not ( = ?AUTO_4050 ?AUTO_4052 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4051 ?AUTO_4052 ?AUTO_4050 ?AUTO_4053 )
      ( DELIVER-PKG ?AUTO_4049 ?AUTO_4050 )
      ( DELIVER-PKG-VERIFY ?AUTO_4049 ?AUTO_4050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4058 - OBJ
      ?AUTO_4059 - LOCATION
    )
    :vars
    (
      ?AUTO_4062 - TRUCK
      ?AUTO_4060 - LOCATION
      ?AUTO_4061 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4062 ?AUTO_4060 ) ( IN-CITY ?AUTO_4060 ?AUTO_4061 ) ( IN-CITY ?AUTO_4059 ?AUTO_4061 ) ( not ( = ?AUTO_4059 ?AUTO_4060 ) ) ( OBJ-AT ?AUTO_4058 ?AUTO_4060 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4058 ?AUTO_4062 ?AUTO_4060 )
      ( DELIVER-PKG ?AUTO_4058 ?AUTO_4059 )
      ( DELIVER-PKG-VERIFY ?AUTO_4058 ?AUTO_4059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4067 - OBJ
      ?AUTO_4068 - LOCATION
    )
    :vars
    (
      ?AUTO_4069 - LOCATION
      ?AUTO_4070 - CITY
      ?AUTO_4071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4069 ?AUTO_4070 ) ( IN-CITY ?AUTO_4068 ?AUTO_4070 ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( OBJ-AT ?AUTO_4067 ?AUTO_4069 ) ( TRUCK-AT ?AUTO_4071 ?AUTO_4068 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4071 ?AUTO_4068 ?AUTO_4069 ?AUTO_4070 )
      ( DELIVER-PKG ?AUTO_4067 ?AUTO_4068 )
      ( DELIVER-PKG-VERIFY ?AUTO_4067 ?AUTO_4068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4092 - OBJ
      ?AUTO_4093 - LOCATION
    )
    :vars
    (
      ?AUTO_4094 - LOCATION
      ?AUTO_4095 - CITY
      ?AUTO_4096 - TRUCK
      ?AUTO_4097 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4094 ?AUTO_4095 ) ( IN-CITY ?AUTO_4093 ?AUTO_4095 ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) ( OBJ-AT ?AUTO_4092 ?AUTO_4094 ) ( TRUCK-AT ?AUTO_4096 ?AUTO_4097 ) ( IN-CITY ?AUTO_4097 ?AUTO_4095 ) ( not ( = ?AUTO_4093 ?AUTO_4097 ) ) ( not ( = ?AUTO_4094 ?AUTO_4097 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4096 ?AUTO_4097 ?AUTO_4093 ?AUTO_4095 )
      ( DELIVER-PKG ?AUTO_4092 ?AUTO_4093 )
      ( DELIVER-PKG-VERIFY ?AUTO_4092 ?AUTO_4093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4122 - OBJ
      ?AUTO_4123 - LOCATION
    )
    :vars
    (
      ?AUTO_4124 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4124 ?AUTO_4123 ) ( IN-TRUCK ?AUTO_4122 ?AUTO_4124 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4122 ?AUTO_4124 ?AUTO_4123 )
      ( DELIVER-PKG-VERIFY ?AUTO_4122 ?AUTO_4123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4125 - OBJ
      ?AUTO_4126 - LOCATION
    )
    :vars
    (
      ?AUTO_4127 - TRUCK
      ?AUTO_4128 - LOCATION
      ?AUTO_4129 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4125 ?AUTO_4127 ) ( TRUCK-AT ?AUTO_4127 ?AUTO_4128 ) ( IN-CITY ?AUTO_4128 ?AUTO_4129 ) ( IN-CITY ?AUTO_4126 ?AUTO_4129 ) ( not ( = ?AUTO_4126 ?AUTO_4128 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4127 ?AUTO_4128 ?AUTO_4126 ?AUTO_4129 )
      ( DELIVER-PKG ?AUTO_4125 ?AUTO_4126 )
      ( DELIVER-PKG-VERIFY ?AUTO_4125 ?AUTO_4126 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4136 - OBJ
      ?AUTO_4137 - LOCATION
    )
    :vars
    (
      ?AUTO_4139 - TRUCK
      ?AUTO_4140 - LOCATION
      ?AUTO_4138 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4139 ?AUTO_4140 ) ( IN-CITY ?AUTO_4140 ?AUTO_4138 ) ( IN-CITY ?AUTO_4137 ?AUTO_4138 ) ( not ( = ?AUTO_4137 ?AUTO_4140 ) ) ( OBJ-AT ?AUTO_4136 ?AUTO_4140 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4136 ?AUTO_4139 ?AUTO_4140 )
      ( DELIVER-PKG ?AUTO_4136 ?AUTO_4137 )
      ( DELIVER-PKG-VERIFY ?AUTO_4136 ?AUTO_4137 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4147 - OBJ
      ?AUTO_4148 - LOCATION
    )
    :vars
    (
      ?AUTO_4150 - LOCATION
      ?AUTO_4151 - CITY
      ?AUTO_4149 - TRUCK
      ?AUTO_4152 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4150 ?AUTO_4151 ) ( IN-CITY ?AUTO_4148 ?AUTO_4151 ) ( not ( = ?AUTO_4148 ?AUTO_4150 ) ) ( OBJ-AT ?AUTO_4147 ?AUTO_4150 ) ( TRUCK-AT ?AUTO_4149 ?AUTO_4152 ) ( IN-CITY ?AUTO_4152 ?AUTO_4151 ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) ( not ( = ?AUTO_4148 ?AUTO_4152 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4149 ?AUTO_4152 ?AUTO_4150 ?AUTO_4151 )
      ( DELIVER-PKG ?AUTO_4147 ?AUTO_4148 )
      ( DELIVER-PKG-VERIFY ?AUTO_4147 ?AUTO_4148 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4157 - OBJ
      ?AUTO_4158 - LOCATION
    )
    :vars
    (
      ?AUTO_4162 - LOCATION
      ?AUTO_4160 - CITY
      ?AUTO_4159 - TRUCK
      ?AUTO_4161 - LOCATION
      ?AUTO_4163 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4162 ?AUTO_4160 ) ( IN-CITY ?AUTO_4158 ?AUTO_4160 ) ( not ( = ?AUTO_4158 ?AUTO_4162 ) ) ( TRUCK-AT ?AUTO_4159 ?AUTO_4161 ) ( IN-CITY ?AUTO_4161 ?AUTO_4160 ) ( not ( = ?AUTO_4162 ?AUTO_4161 ) ) ( not ( = ?AUTO_4158 ?AUTO_4161 ) ) ( IN-AIRPLANE ?AUTO_4157 ?AUTO_4163 ) ( AIRPLANE-AT ?AUTO_4163 ?AUTO_4162 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4157 ?AUTO_4163 ?AUTO_4162 )
      ( DELIVER-PKG ?AUTO_4157 ?AUTO_4158 )
      ( DELIVER-PKG-VERIFY ?AUTO_4157 ?AUTO_4158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4164 - OBJ
      ?AUTO_4165 - LOCATION
    )
    :vars
    (
      ?AUTO_4169 - LOCATION
      ?AUTO_4166 - CITY
      ?AUTO_4167 - TRUCK
      ?AUTO_4168 - LOCATION
      ?AUTO_4170 - AIRPLANE
      ?AUTO_4171 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4169 ?AUTO_4166 ) ( IN-CITY ?AUTO_4165 ?AUTO_4166 ) ( not ( = ?AUTO_4165 ?AUTO_4169 ) ) ( TRUCK-AT ?AUTO_4167 ?AUTO_4168 ) ( IN-CITY ?AUTO_4168 ?AUTO_4166 ) ( not ( = ?AUTO_4169 ?AUTO_4168 ) ) ( not ( = ?AUTO_4165 ?AUTO_4168 ) ) ( IN-AIRPLANE ?AUTO_4164 ?AUTO_4170 ) ( AIRPORT ?AUTO_4171 ) ( AIRPORT ?AUTO_4169 ) ( AIRPLANE-AT ?AUTO_4170 ?AUTO_4171 ) ( not ( = ?AUTO_4171 ?AUTO_4169 ) ) ( not ( = ?AUTO_4165 ?AUTO_4171 ) ) ( not ( = ?AUTO_4168 ?AUTO_4171 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4170 ?AUTO_4171 ?AUTO_4169 )
      ( DELIVER-PKG ?AUTO_4164 ?AUTO_4165 )
      ( DELIVER-PKG-VERIFY ?AUTO_4164 ?AUTO_4165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4180 - OBJ
      ?AUTO_4181 - LOCATION
    )
    :vars
    (
      ?AUTO_4183 - LOCATION
      ?AUTO_4185 - CITY
      ?AUTO_4187 - TRUCK
      ?AUTO_4184 - LOCATION
      ?AUTO_4186 - LOCATION
      ?AUTO_4182 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4183 ?AUTO_4185 ) ( IN-CITY ?AUTO_4181 ?AUTO_4185 ) ( not ( = ?AUTO_4181 ?AUTO_4183 ) ) ( TRUCK-AT ?AUTO_4187 ?AUTO_4184 ) ( IN-CITY ?AUTO_4184 ?AUTO_4185 ) ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( not ( = ?AUTO_4181 ?AUTO_4184 ) ) ( AIRPORT ?AUTO_4186 ) ( AIRPORT ?AUTO_4183 ) ( AIRPLANE-AT ?AUTO_4182 ?AUTO_4186 ) ( not ( = ?AUTO_4186 ?AUTO_4183 ) ) ( not ( = ?AUTO_4181 ?AUTO_4186 ) ) ( not ( = ?AUTO_4184 ?AUTO_4186 ) ) ( OBJ-AT ?AUTO_4180 ?AUTO_4186 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4180 ?AUTO_4182 ?AUTO_4186 )
      ( DELIVER-PKG ?AUTO_4180 ?AUTO_4181 )
      ( DELIVER-PKG-VERIFY ?AUTO_4180 ?AUTO_4181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4188 - OBJ
      ?AUTO_4189 - LOCATION
    )
    :vars
    (
      ?AUTO_4194 - LOCATION
      ?AUTO_4190 - CITY
      ?AUTO_4195 - TRUCK
      ?AUTO_4192 - LOCATION
      ?AUTO_4191 - LOCATION
      ?AUTO_4193 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4194 ?AUTO_4190 ) ( IN-CITY ?AUTO_4189 ?AUTO_4190 ) ( not ( = ?AUTO_4189 ?AUTO_4194 ) ) ( TRUCK-AT ?AUTO_4195 ?AUTO_4192 ) ( IN-CITY ?AUTO_4192 ?AUTO_4190 ) ( not ( = ?AUTO_4194 ?AUTO_4192 ) ) ( not ( = ?AUTO_4189 ?AUTO_4192 ) ) ( AIRPORT ?AUTO_4191 ) ( AIRPORT ?AUTO_4194 ) ( not ( = ?AUTO_4191 ?AUTO_4194 ) ) ( not ( = ?AUTO_4189 ?AUTO_4191 ) ) ( not ( = ?AUTO_4192 ?AUTO_4191 ) ) ( OBJ-AT ?AUTO_4188 ?AUTO_4191 ) ( AIRPLANE-AT ?AUTO_4193 ?AUTO_4194 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4193 ?AUTO_4194 ?AUTO_4191 )
      ( DELIVER-PKG ?AUTO_4188 ?AUTO_4189 )
      ( DELIVER-PKG-VERIFY ?AUTO_4188 ?AUTO_4189 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4200 - OBJ
      ?AUTO_4201 - LOCATION
    )
    :vars
    (
      ?AUTO_4205 - LOCATION
      ?AUTO_4204 - CITY
      ?AUTO_4202 - LOCATION
      ?AUTO_4203 - LOCATION
      ?AUTO_4207 - AIRPLANE
      ?AUTO_4206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4205 ?AUTO_4204 ) ( IN-CITY ?AUTO_4201 ?AUTO_4204 ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( IN-CITY ?AUTO_4202 ?AUTO_4204 ) ( not ( = ?AUTO_4205 ?AUTO_4202 ) ) ( not ( = ?AUTO_4201 ?AUTO_4202 ) ) ( AIRPORT ?AUTO_4203 ) ( AIRPORT ?AUTO_4205 ) ( not ( = ?AUTO_4203 ?AUTO_4205 ) ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( OBJ-AT ?AUTO_4200 ?AUTO_4203 ) ( AIRPLANE-AT ?AUTO_4207 ?AUTO_4205 ) ( TRUCK-AT ?AUTO_4206 ?AUTO_4201 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4206 ?AUTO_4201 ?AUTO_4202 ?AUTO_4204 )
      ( DELIVER-PKG ?AUTO_4200 ?AUTO_4201 )
      ( DELIVER-PKG-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4228 - OBJ
      ?AUTO_4229 - LOCATION
    )
    :vars
    (
      ?AUTO_4230 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4228 ?AUTO_4230 ) ( AIRPLANE-AT ?AUTO_4230 ?AUTO_4229 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4228 ?AUTO_4230 ?AUTO_4229 )
      ( DELIVER-PKG-VERIFY ?AUTO_4228 ?AUTO_4229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4233 - OBJ
      ?AUTO_4234 - LOCATION
    )
    :vars
    (
      ?AUTO_4235 - AIRPLANE
      ?AUTO_4236 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4233 ?AUTO_4235 ) ( AIRPORT ?AUTO_4236 ) ( AIRPORT ?AUTO_4234 ) ( AIRPLANE-AT ?AUTO_4235 ?AUTO_4236 ) ( not ( = ?AUTO_4236 ?AUTO_4234 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4235 ?AUTO_4236 ?AUTO_4234 )
      ( DELIVER-PKG ?AUTO_4233 ?AUTO_4234 )
      ( DELIVER-PKG-VERIFY ?AUTO_4233 ?AUTO_4234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4253 - OBJ
      ?AUTO_4254 - LOCATION
    )
    :vars
    (
      ?AUTO_4255 - LOCATION
      ?AUTO_4256 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4255 ) ( AIRPORT ?AUTO_4254 ) ( AIRPLANE-AT ?AUTO_4256 ?AUTO_4255 ) ( not ( = ?AUTO_4255 ?AUTO_4254 ) ) ( OBJ-AT ?AUTO_4253 ?AUTO_4255 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4253 ?AUTO_4256 ?AUTO_4255 )
      ( DELIVER-PKG ?AUTO_4253 ?AUTO_4254 )
      ( DELIVER-PKG-VERIFY ?AUTO_4253 ?AUTO_4254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4257 - OBJ
      ?AUTO_4258 - LOCATION
    )
    :vars
    (
      ?AUTO_4259 - LOCATION
      ?AUTO_4260 - AIRPLANE
      ?AUTO_4261 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4259 ) ( AIRPORT ?AUTO_4258 ) ( AIRPLANE-AT ?AUTO_4260 ?AUTO_4259 ) ( not ( = ?AUTO_4259 ?AUTO_4258 ) ) ( TRUCK-AT ?AUTO_4261 ?AUTO_4259 ) ( IN-TRUCK ?AUTO_4257 ?AUTO_4261 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4257 ?AUTO_4261 ?AUTO_4259 )
      ( DELIVER-PKG ?AUTO_4257 ?AUTO_4258 )
      ( DELIVER-PKG-VERIFY ?AUTO_4257 ?AUTO_4258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4262 - OBJ
      ?AUTO_4263 - LOCATION
    )
    :vars
    (
      ?AUTO_4265 - LOCATION
      ?AUTO_4264 - AIRPLANE
      ?AUTO_4266 - TRUCK
      ?AUTO_4267 - LOCATION
      ?AUTO_4268 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4265 ) ( AIRPORT ?AUTO_4263 ) ( AIRPLANE-AT ?AUTO_4264 ?AUTO_4265 ) ( not ( = ?AUTO_4265 ?AUTO_4263 ) ) ( IN-TRUCK ?AUTO_4262 ?AUTO_4266 ) ( TRUCK-AT ?AUTO_4266 ?AUTO_4267 ) ( IN-CITY ?AUTO_4267 ?AUTO_4268 ) ( IN-CITY ?AUTO_4265 ?AUTO_4268 ) ( not ( = ?AUTO_4265 ?AUTO_4267 ) ) ( not ( = ?AUTO_4263 ?AUTO_4267 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4266 ?AUTO_4267 ?AUTO_4265 ?AUTO_4268 )
      ( DELIVER-PKG ?AUTO_4262 ?AUTO_4263 )
      ( DELIVER-PKG-VERIFY ?AUTO_4262 ?AUTO_4263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4275 - OBJ
      ?AUTO_4276 - LOCATION
    )
    :vars
    (
      ?AUTO_4279 - LOCATION
      ?AUTO_4281 - TRUCK
      ?AUTO_4277 - LOCATION
      ?AUTO_4278 - CITY
      ?AUTO_4282 - LOCATION
      ?AUTO_4280 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4279 ) ( AIRPORT ?AUTO_4276 ) ( not ( = ?AUTO_4279 ?AUTO_4276 ) ) ( IN-TRUCK ?AUTO_4275 ?AUTO_4281 ) ( TRUCK-AT ?AUTO_4281 ?AUTO_4277 ) ( IN-CITY ?AUTO_4277 ?AUTO_4278 ) ( IN-CITY ?AUTO_4279 ?AUTO_4278 ) ( not ( = ?AUTO_4279 ?AUTO_4277 ) ) ( not ( = ?AUTO_4276 ?AUTO_4277 ) ) ( AIRPORT ?AUTO_4282 ) ( AIRPLANE-AT ?AUTO_4280 ?AUTO_4282 ) ( not ( = ?AUTO_4282 ?AUTO_4279 ) ) ( not ( = ?AUTO_4276 ?AUTO_4282 ) ) ( not ( = ?AUTO_4277 ?AUTO_4282 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4280 ?AUTO_4282 ?AUTO_4279 )
      ( DELIVER-PKG ?AUTO_4275 ?AUTO_4276 )
      ( DELIVER-PKG-VERIFY ?AUTO_4275 ?AUTO_4276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4297 - OBJ
      ?AUTO_4298 - LOCATION
    )
    :vars
    (
      ?AUTO_4301 - LOCATION
      ?AUTO_4302 - AIRPLANE
      ?AUTO_4300 - TRUCK
      ?AUTO_4303 - LOCATION
      ?AUTO_4299 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4301 ) ( AIRPORT ?AUTO_4298 ) ( AIRPLANE-AT ?AUTO_4302 ?AUTO_4301 ) ( not ( = ?AUTO_4301 ?AUTO_4298 ) ) ( TRUCK-AT ?AUTO_4300 ?AUTO_4303 ) ( IN-CITY ?AUTO_4303 ?AUTO_4299 ) ( IN-CITY ?AUTO_4301 ?AUTO_4299 ) ( not ( = ?AUTO_4301 ?AUTO_4303 ) ) ( not ( = ?AUTO_4298 ?AUTO_4303 ) ) ( OBJ-AT ?AUTO_4297 ?AUTO_4303 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4297 ?AUTO_4300 ?AUTO_4303 )
      ( DELIVER-PKG ?AUTO_4297 ?AUTO_4298 )
      ( DELIVER-PKG-VERIFY ?AUTO_4297 ?AUTO_4298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4304 - OBJ
      ?AUTO_4305 - LOCATION
    )
    :vars
    (
      ?AUTO_4308 - LOCATION
      ?AUTO_4310 - AIRPLANE
      ?AUTO_4307 - LOCATION
      ?AUTO_4306 - CITY
      ?AUTO_4309 - TRUCK
      ?AUTO_4311 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4308 ) ( AIRPORT ?AUTO_4305 ) ( AIRPLANE-AT ?AUTO_4310 ?AUTO_4308 ) ( not ( = ?AUTO_4308 ?AUTO_4305 ) ) ( IN-CITY ?AUTO_4307 ?AUTO_4306 ) ( IN-CITY ?AUTO_4308 ?AUTO_4306 ) ( not ( = ?AUTO_4308 ?AUTO_4307 ) ) ( not ( = ?AUTO_4305 ?AUTO_4307 ) ) ( OBJ-AT ?AUTO_4304 ?AUTO_4307 ) ( TRUCK-AT ?AUTO_4309 ?AUTO_4311 ) ( IN-CITY ?AUTO_4311 ?AUTO_4306 ) ( not ( = ?AUTO_4307 ?AUTO_4311 ) ) ( not ( = ?AUTO_4305 ?AUTO_4311 ) ) ( not ( = ?AUTO_4308 ?AUTO_4311 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4309 ?AUTO_4311 ?AUTO_4307 ?AUTO_4306 )
      ( DELIVER-PKG ?AUTO_4304 ?AUTO_4305 )
      ( DELIVER-PKG-VERIFY ?AUTO_4304 ?AUTO_4305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4332 - OBJ
      ?AUTO_4333 - LOCATION
    )
    :vars
    (
      ?AUTO_4334 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4334 ?AUTO_4333 ) ( IN-TRUCK ?AUTO_4332 ?AUTO_4334 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4332 ?AUTO_4334 ?AUTO_4333 )
      ( DELIVER-PKG-VERIFY ?AUTO_4332 ?AUTO_4333 ) )
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
    ( and ( IN-TRUCK ?AUTO_4335 ?AUTO_4337 ) ( TRUCK-AT ?AUTO_4337 ?AUTO_4338 ) ( IN-CITY ?AUTO_4338 ?AUTO_4339 ) ( IN-CITY ?AUTO_4336 ?AUTO_4339 ) ( not ( = ?AUTO_4336 ?AUTO_4338 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4337 ?AUTO_4338 ?AUTO_4336 ?AUTO_4339 )
      ( DELIVER-PKG ?AUTO_4335 ?AUTO_4336 )
      ( DELIVER-PKG-VERIFY ?AUTO_4335 ?AUTO_4336 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4340 - OBJ
      ?AUTO_4341 - LOCATION
    )
    :vars
    (
      ?AUTO_4342 - TRUCK
      ?AUTO_4343 - LOCATION
      ?AUTO_4344 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4342 ?AUTO_4343 ) ( IN-CITY ?AUTO_4343 ?AUTO_4344 ) ( IN-CITY ?AUTO_4341 ?AUTO_4344 ) ( not ( = ?AUTO_4341 ?AUTO_4343 ) ) ( OBJ-AT ?AUTO_4340 ?AUTO_4343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4340 ?AUTO_4342 ?AUTO_4343 )
      ( DELIVER-PKG ?AUTO_4340 ?AUTO_4341 )
      ( DELIVER-PKG-VERIFY ?AUTO_4340 ?AUTO_4341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4345 - OBJ
      ?AUTO_4346 - LOCATION
    )
    :vars
    (
      ?AUTO_4348 - TRUCK
      ?AUTO_4347 - LOCATION
      ?AUTO_4349 - CITY
      ?AUTO_4350 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4348 ?AUTO_4347 ) ( IN-CITY ?AUTO_4347 ?AUTO_4349 ) ( IN-CITY ?AUTO_4346 ?AUTO_4349 ) ( not ( = ?AUTO_4346 ?AUTO_4347 ) ) ( IN-AIRPLANE ?AUTO_4345 ?AUTO_4350 ) ( AIRPLANE-AT ?AUTO_4350 ?AUTO_4347 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4345 ?AUTO_4350 ?AUTO_4347 )
      ( DELIVER-PKG ?AUTO_4345 ?AUTO_4346 )
      ( DELIVER-PKG-VERIFY ?AUTO_4345 ?AUTO_4346 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4353 - OBJ
      ?AUTO_4354 - LOCATION
    )
    :vars
    (
      ?AUTO_4356 - TRUCK
      ?AUTO_4355 - LOCATION
      ?AUTO_4357 - CITY
      ?AUTO_4358 - AIRPLANE
      ?AUTO_4359 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4356 ?AUTO_4355 ) ( IN-CITY ?AUTO_4355 ?AUTO_4357 ) ( IN-CITY ?AUTO_4354 ?AUTO_4357 ) ( not ( = ?AUTO_4354 ?AUTO_4355 ) ) ( IN-AIRPLANE ?AUTO_4353 ?AUTO_4358 ) ( AIRPORT ?AUTO_4359 ) ( AIRPORT ?AUTO_4355 ) ( AIRPLANE-AT ?AUTO_4358 ?AUTO_4359 ) ( not ( = ?AUTO_4359 ?AUTO_4355 ) ) ( not ( = ?AUTO_4354 ?AUTO_4359 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4358 ?AUTO_4359 ?AUTO_4355 )
      ( DELIVER-PKG ?AUTO_4353 ?AUTO_4354 )
      ( DELIVER-PKG-VERIFY ?AUTO_4353 ?AUTO_4354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4376 - OBJ
      ?AUTO_4377 - LOCATION
    )
    :vars
    (
      ?AUTO_4378 - TRUCK
      ?AUTO_4381 - LOCATION
      ?AUTO_4380 - CITY
      ?AUTO_4379 - LOCATION
      ?AUTO_4382 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4378 ?AUTO_4381 ) ( IN-CITY ?AUTO_4381 ?AUTO_4380 ) ( IN-CITY ?AUTO_4377 ?AUTO_4380 ) ( not ( = ?AUTO_4377 ?AUTO_4381 ) ) ( AIRPORT ?AUTO_4379 ) ( AIRPORT ?AUTO_4381 ) ( AIRPLANE-AT ?AUTO_4382 ?AUTO_4379 ) ( not ( = ?AUTO_4379 ?AUTO_4381 ) ) ( not ( = ?AUTO_4377 ?AUTO_4379 ) ) ( OBJ-AT ?AUTO_4376 ?AUTO_4379 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4376 ?AUTO_4382 ?AUTO_4379 )
      ( DELIVER-PKG ?AUTO_4376 ?AUTO_4377 )
      ( DELIVER-PKG-VERIFY ?AUTO_4376 ?AUTO_4377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4383 - OBJ
      ?AUTO_4384 - LOCATION
    )
    :vars
    (
      ?AUTO_4386 - TRUCK
      ?AUTO_4388 - LOCATION
      ?AUTO_4387 - CITY
      ?AUTO_4385 - LOCATION
      ?AUTO_4389 - AIRPLANE
      ?AUTO_4390 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4386 ?AUTO_4388 ) ( IN-CITY ?AUTO_4388 ?AUTO_4387 ) ( IN-CITY ?AUTO_4384 ?AUTO_4387 ) ( not ( = ?AUTO_4384 ?AUTO_4388 ) ) ( AIRPORT ?AUTO_4385 ) ( AIRPORT ?AUTO_4388 ) ( AIRPLANE-AT ?AUTO_4389 ?AUTO_4385 ) ( not ( = ?AUTO_4385 ?AUTO_4388 ) ) ( not ( = ?AUTO_4384 ?AUTO_4385 ) ) ( TRUCK-AT ?AUTO_4390 ?AUTO_4385 ) ( IN-TRUCK ?AUTO_4383 ?AUTO_4390 ) ( not ( = ?AUTO_4386 ?AUTO_4390 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4383 ?AUTO_4390 ?AUTO_4385 )
      ( DELIVER-PKG ?AUTO_4383 ?AUTO_4384 )
      ( DELIVER-PKG-VERIFY ?AUTO_4383 ?AUTO_4384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4391 - OBJ
      ?AUTO_4392 - LOCATION
    )
    :vars
    (
      ?AUTO_4395 - TRUCK
      ?AUTO_4394 - LOCATION
      ?AUTO_4396 - CITY
      ?AUTO_4393 - LOCATION
      ?AUTO_4397 - AIRPLANE
      ?AUTO_4398 - TRUCK
      ?AUTO_4399 - LOCATION
      ?AUTO_4400 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4395 ?AUTO_4394 ) ( IN-CITY ?AUTO_4394 ?AUTO_4396 ) ( IN-CITY ?AUTO_4392 ?AUTO_4396 ) ( not ( = ?AUTO_4392 ?AUTO_4394 ) ) ( AIRPORT ?AUTO_4393 ) ( AIRPORT ?AUTO_4394 ) ( AIRPLANE-AT ?AUTO_4397 ?AUTO_4393 ) ( not ( = ?AUTO_4393 ?AUTO_4394 ) ) ( not ( = ?AUTO_4392 ?AUTO_4393 ) ) ( IN-TRUCK ?AUTO_4391 ?AUTO_4398 ) ( not ( = ?AUTO_4395 ?AUTO_4398 ) ) ( TRUCK-AT ?AUTO_4398 ?AUTO_4399 ) ( IN-CITY ?AUTO_4399 ?AUTO_4400 ) ( IN-CITY ?AUTO_4393 ?AUTO_4400 ) ( not ( = ?AUTO_4393 ?AUTO_4399 ) ) ( not ( = ?AUTO_4392 ?AUTO_4399 ) ) ( not ( = ?AUTO_4394 ?AUTO_4399 ) ) ( not ( = ?AUTO_4396 ?AUTO_4400 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4398 ?AUTO_4399 ?AUTO_4393 ?AUTO_4400 )
      ( DELIVER-PKG ?AUTO_4391 ?AUTO_4392 )
      ( DELIVER-PKG-VERIFY ?AUTO_4391 ?AUTO_4392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4407 - OBJ
      ?AUTO_4408 - LOCATION
    )
    :vars
    (
      ?AUTO_4410 - TRUCK
      ?AUTO_4412 - LOCATION
      ?AUTO_4413 - CITY
      ?AUTO_4411 - LOCATION
      ?AUTO_4409 - TRUCK
      ?AUTO_4415 - LOCATION
      ?AUTO_4416 - CITY
      ?AUTO_4417 - LOCATION
      ?AUTO_4414 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4410 ?AUTO_4412 ) ( IN-CITY ?AUTO_4412 ?AUTO_4413 ) ( IN-CITY ?AUTO_4408 ?AUTO_4413 ) ( not ( = ?AUTO_4408 ?AUTO_4412 ) ) ( AIRPORT ?AUTO_4411 ) ( AIRPORT ?AUTO_4412 ) ( not ( = ?AUTO_4411 ?AUTO_4412 ) ) ( not ( = ?AUTO_4408 ?AUTO_4411 ) ) ( IN-TRUCK ?AUTO_4407 ?AUTO_4409 ) ( not ( = ?AUTO_4410 ?AUTO_4409 ) ) ( TRUCK-AT ?AUTO_4409 ?AUTO_4415 ) ( IN-CITY ?AUTO_4415 ?AUTO_4416 ) ( IN-CITY ?AUTO_4411 ?AUTO_4416 ) ( not ( = ?AUTO_4411 ?AUTO_4415 ) ) ( not ( = ?AUTO_4408 ?AUTO_4415 ) ) ( not ( = ?AUTO_4412 ?AUTO_4415 ) ) ( not ( = ?AUTO_4413 ?AUTO_4416 ) ) ( AIRPORT ?AUTO_4417 ) ( AIRPLANE-AT ?AUTO_4414 ?AUTO_4417 ) ( not ( = ?AUTO_4417 ?AUTO_4411 ) ) ( not ( = ?AUTO_4408 ?AUTO_4417 ) ) ( not ( = ?AUTO_4412 ?AUTO_4417 ) ) ( not ( = ?AUTO_4415 ?AUTO_4417 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4414 ?AUTO_4417 ?AUTO_4411 )
      ( DELIVER-PKG ?AUTO_4407 ?AUTO_4408 )
      ( DELIVER-PKG-VERIFY ?AUTO_4407 ?AUTO_4408 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4432 - OBJ
      ?AUTO_4433 - LOCATION
    )
    :vars
    (
      ?AUTO_4437 - TRUCK
      ?AUTO_4434 - LOCATION
      ?AUTO_4435 - CITY
      ?AUTO_4441 - LOCATION
      ?AUTO_4438 - AIRPLANE
      ?AUTO_4440 - TRUCK
      ?AUTO_4436 - LOCATION
      ?AUTO_4439 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4437 ?AUTO_4434 ) ( IN-CITY ?AUTO_4434 ?AUTO_4435 ) ( IN-CITY ?AUTO_4433 ?AUTO_4435 ) ( not ( = ?AUTO_4433 ?AUTO_4434 ) ) ( AIRPORT ?AUTO_4441 ) ( AIRPORT ?AUTO_4434 ) ( AIRPLANE-AT ?AUTO_4438 ?AUTO_4441 ) ( not ( = ?AUTO_4441 ?AUTO_4434 ) ) ( not ( = ?AUTO_4433 ?AUTO_4441 ) ) ( not ( = ?AUTO_4437 ?AUTO_4440 ) ) ( TRUCK-AT ?AUTO_4440 ?AUTO_4436 ) ( IN-CITY ?AUTO_4436 ?AUTO_4439 ) ( IN-CITY ?AUTO_4441 ?AUTO_4439 ) ( not ( = ?AUTO_4441 ?AUTO_4436 ) ) ( not ( = ?AUTO_4433 ?AUTO_4436 ) ) ( not ( = ?AUTO_4434 ?AUTO_4436 ) ) ( not ( = ?AUTO_4435 ?AUTO_4439 ) ) ( OBJ-AT ?AUTO_4432 ?AUTO_4436 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4432 ?AUTO_4440 ?AUTO_4436 )
      ( DELIVER-PKG ?AUTO_4432 ?AUTO_4433 )
      ( DELIVER-PKG-VERIFY ?AUTO_4432 ?AUTO_4433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4442 - OBJ
      ?AUTO_4443 - LOCATION
    )
    :vars
    (
      ?AUTO_4445 - TRUCK
      ?AUTO_4446 - LOCATION
      ?AUTO_4450 - CITY
      ?AUTO_4449 - LOCATION
      ?AUTO_4444 - AIRPLANE
      ?AUTO_4448 - TRUCK
      ?AUTO_4447 - LOCATION
      ?AUTO_4451 - CITY
      ?AUTO_4452 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4445 ?AUTO_4446 ) ( IN-CITY ?AUTO_4446 ?AUTO_4450 ) ( IN-CITY ?AUTO_4443 ?AUTO_4450 ) ( not ( = ?AUTO_4443 ?AUTO_4446 ) ) ( AIRPORT ?AUTO_4449 ) ( AIRPORT ?AUTO_4446 ) ( AIRPLANE-AT ?AUTO_4444 ?AUTO_4449 ) ( not ( = ?AUTO_4449 ?AUTO_4446 ) ) ( not ( = ?AUTO_4443 ?AUTO_4449 ) ) ( not ( = ?AUTO_4445 ?AUTO_4448 ) ) ( IN-CITY ?AUTO_4447 ?AUTO_4451 ) ( IN-CITY ?AUTO_4449 ?AUTO_4451 ) ( not ( = ?AUTO_4449 ?AUTO_4447 ) ) ( not ( = ?AUTO_4443 ?AUTO_4447 ) ) ( not ( = ?AUTO_4446 ?AUTO_4447 ) ) ( not ( = ?AUTO_4450 ?AUTO_4451 ) ) ( OBJ-AT ?AUTO_4442 ?AUTO_4447 ) ( TRUCK-AT ?AUTO_4448 ?AUTO_4452 ) ( IN-CITY ?AUTO_4452 ?AUTO_4451 ) ( not ( = ?AUTO_4447 ?AUTO_4452 ) ) ( not ( = ?AUTO_4443 ?AUTO_4452 ) ) ( not ( = ?AUTO_4446 ?AUTO_4452 ) ) ( not ( = ?AUTO_4449 ?AUTO_4452 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4448 ?AUTO_4452 ?AUTO_4447 ?AUTO_4451 )
      ( DELIVER-PKG ?AUTO_4442 ?AUTO_4443 )
      ( DELIVER-PKG-VERIFY ?AUTO_4442 ?AUTO_4443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4473 - OBJ
      ?AUTO_4474 - LOCATION
    )
    :vars
    (
      ?AUTO_4475 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4473 ?AUTO_4475 ) ( AIRPLANE-AT ?AUTO_4475 ?AUTO_4474 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4473 ?AUTO_4475 ?AUTO_4474 )
      ( DELIVER-PKG-VERIFY ?AUTO_4473 ?AUTO_4474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4476 - OBJ
      ?AUTO_4477 - LOCATION
    )
    :vars
    (
      ?AUTO_4478 - AIRPLANE
      ?AUTO_4479 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4476 ?AUTO_4478 ) ( AIRPORT ?AUTO_4479 ) ( AIRPORT ?AUTO_4477 ) ( AIRPLANE-AT ?AUTO_4478 ?AUTO_4479 ) ( not ( = ?AUTO_4479 ?AUTO_4477 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4478 ?AUTO_4479 ?AUTO_4477 )
      ( DELIVER-PKG ?AUTO_4476 ?AUTO_4477 )
      ( DELIVER-PKG-VERIFY ?AUTO_4476 ?AUTO_4477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4488 - OBJ
      ?AUTO_4489 - LOCATION
    )
    :vars
    (
      ?AUTO_4490 - LOCATION
      ?AUTO_4491 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4490 ) ( AIRPORT ?AUTO_4489 ) ( AIRPLANE-AT ?AUTO_4491 ?AUTO_4490 ) ( not ( = ?AUTO_4490 ?AUTO_4489 ) ) ( OBJ-AT ?AUTO_4488 ?AUTO_4490 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4488 ?AUTO_4491 ?AUTO_4490 )
      ( DELIVER-PKG ?AUTO_4488 ?AUTO_4489 )
      ( DELIVER-PKG-VERIFY ?AUTO_4488 ?AUTO_4489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4492 - OBJ
      ?AUTO_4493 - LOCATION
    )
    :vars
    (
      ?AUTO_4495 - LOCATION
      ?AUTO_4494 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4495 ) ( AIRPORT ?AUTO_4493 ) ( not ( = ?AUTO_4495 ?AUTO_4493 ) ) ( OBJ-AT ?AUTO_4492 ?AUTO_4495 ) ( AIRPLANE-AT ?AUTO_4494 ?AUTO_4493 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4494 ?AUTO_4493 ?AUTO_4495 )
      ( DELIVER-PKG ?AUTO_4492 ?AUTO_4493 )
      ( DELIVER-PKG-VERIFY ?AUTO_4492 ?AUTO_4493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4524 - OBJ
      ?AUTO_4525 - LOCATION
    )
    :vars
    (
      ?AUTO_4526 - LOCATION
      ?AUTO_4528 - LOCATION
      ?AUTO_4527 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4526 ) ( AIRPORT ?AUTO_4525 ) ( not ( = ?AUTO_4526 ?AUTO_4525 ) ) ( OBJ-AT ?AUTO_4524 ?AUTO_4526 ) ( AIRPORT ?AUTO_4528 ) ( AIRPLANE-AT ?AUTO_4527 ?AUTO_4528 ) ( not ( = ?AUTO_4528 ?AUTO_4525 ) ) ( not ( = ?AUTO_4526 ?AUTO_4528 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4527 ?AUTO_4528 ?AUTO_4525 )
      ( DELIVER-PKG ?AUTO_4524 ?AUTO_4525 )
      ( DELIVER-PKG-VERIFY ?AUTO_4524 ?AUTO_4525 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4567 - OBJ
      ?AUTO_4568 - LOCATION
    )
    :vars
    (
      ?AUTO_4569 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4569 ?AUTO_4568 ) ( IN-TRUCK ?AUTO_4567 ?AUTO_4569 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4567 ?AUTO_4569 ?AUTO_4568 )
      ( DELIVER-PKG-VERIFY ?AUTO_4567 ?AUTO_4568 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4572 - OBJ
      ?AUTO_4573 - LOCATION
    )
    :vars
    (
      ?AUTO_4574 - TRUCK
      ?AUTO_4575 - LOCATION
      ?AUTO_4576 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4572 ?AUTO_4574 ) ( TRUCK-AT ?AUTO_4574 ?AUTO_4575 ) ( IN-CITY ?AUTO_4575 ?AUTO_4576 ) ( IN-CITY ?AUTO_4573 ?AUTO_4576 ) ( not ( = ?AUTO_4573 ?AUTO_4575 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4574 ?AUTO_4575 ?AUTO_4573 ?AUTO_4576 )
      ( DELIVER-PKG ?AUTO_4572 ?AUTO_4573 )
      ( DELIVER-PKG-VERIFY ?AUTO_4572 ?AUTO_4573 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4577 - OBJ
      ?AUTO_4578 - LOCATION
    )
    :vars
    (
      ?AUTO_4579 - TRUCK
      ?AUTO_4580 - LOCATION
      ?AUTO_4581 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4579 ?AUTO_4580 ) ( IN-CITY ?AUTO_4580 ?AUTO_4581 ) ( IN-CITY ?AUTO_4578 ?AUTO_4581 ) ( not ( = ?AUTO_4578 ?AUTO_4580 ) ) ( OBJ-AT ?AUTO_4577 ?AUTO_4580 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4577 ?AUTO_4579 ?AUTO_4580 )
      ( DELIVER-PKG ?AUTO_4577 ?AUTO_4578 )
      ( DELIVER-PKG-VERIFY ?AUTO_4577 ?AUTO_4578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4582 - OBJ
      ?AUTO_4583 - LOCATION
    )
    :vars
    (
      ?AUTO_4585 - TRUCK
      ?AUTO_4584 - LOCATION
      ?AUTO_4586 - CITY
      ?AUTO_4587 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4585 ?AUTO_4584 ) ( IN-CITY ?AUTO_4584 ?AUTO_4586 ) ( IN-CITY ?AUTO_4583 ?AUTO_4586 ) ( not ( = ?AUTO_4583 ?AUTO_4584 ) ) ( IN-AIRPLANE ?AUTO_4582 ?AUTO_4587 ) ( AIRPLANE-AT ?AUTO_4587 ?AUTO_4584 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4582 ?AUTO_4587 ?AUTO_4584 )
      ( DELIVER-PKG ?AUTO_4582 ?AUTO_4583 )
      ( DELIVER-PKG-VERIFY ?AUTO_4582 ?AUTO_4583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4588 - OBJ
      ?AUTO_4589 - LOCATION
    )
    :vars
    (
      ?AUTO_4590 - TRUCK
      ?AUTO_4593 - LOCATION
      ?AUTO_4591 - CITY
      ?AUTO_4592 - AIRPLANE
      ?AUTO_4594 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4590 ?AUTO_4593 ) ( IN-CITY ?AUTO_4593 ?AUTO_4591 ) ( IN-CITY ?AUTO_4589 ?AUTO_4591 ) ( not ( = ?AUTO_4589 ?AUTO_4593 ) ) ( IN-AIRPLANE ?AUTO_4588 ?AUTO_4592 ) ( AIRPORT ?AUTO_4594 ) ( AIRPORT ?AUTO_4593 ) ( AIRPLANE-AT ?AUTO_4592 ?AUTO_4594 ) ( not ( = ?AUTO_4594 ?AUTO_4593 ) ) ( not ( = ?AUTO_4589 ?AUTO_4594 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4592 ?AUTO_4594 ?AUTO_4593 )
      ( DELIVER-PKG ?AUTO_4588 ?AUTO_4589 )
      ( DELIVER-PKG-VERIFY ?AUTO_4588 ?AUTO_4589 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4603 - OBJ
      ?AUTO_4604 - LOCATION
    )
    :vars
    (
      ?AUTO_4606 - TRUCK
      ?AUTO_4608 - LOCATION
      ?AUTO_4609 - CITY
      ?AUTO_4605 - LOCATION
      ?AUTO_4607 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4606 ?AUTO_4608 ) ( IN-CITY ?AUTO_4608 ?AUTO_4609 ) ( IN-CITY ?AUTO_4604 ?AUTO_4609 ) ( not ( = ?AUTO_4604 ?AUTO_4608 ) ) ( AIRPORT ?AUTO_4605 ) ( AIRPORT ?AUTO_4608 ) ( AIRPLANE-AT ?AUTO_4607 ?AUTO_4605 ) ( not ( = ?AUTO_4605 ?AUTO_4608 ) ) ( not ( = ?AUTO_4604 ?AUTO_4605 ) ) ( OBJ-AT ?AUTO_4603 ?AUTO_4605 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4603 ?AUTO_4607 ?AUTO_4605 )
      ( DELIVER-PKG ?AUTO_4603 ?AUTO_4604 )
      ( DELIVER-PKG-VERIFY ?AUTO_4603 ?AUTO_4604 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4610 - OBJ
      ?AUTO_4611 - LOCATION
    )
    :vars
    (
      ?AUTO_4612 - TRUCK
      ?AUTO_4615 - LOCATION
      ?AUTO_4616 - CITY
      ?AUTO_4613 - LOCATION
      ?AUTO_4614 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4612 ?AUTO_4615 ) ( IN-CITY ?AUTO_4615 ?AUTO_4616 ) ( IN-CITY ?AUTO_4611 ?AUTO_4616 ) ( not ( = ?AUTO_4611 ?AUTO_4615 ) ) ( AIRPORT ?AUTO_4613 ) ( AIRPORT ?AUTO_4615 ) ( not ( = ?AUTO_4613 ?AUTO_4615 ) ) ( not ( = ?AUTO_4611 ?AUTO_4613 ) ) ( OBJ-AT ?AUTO_4610 ?AUTO_4613 ) ( AIRPLANE-AT ?AUTO_4614 ?AUTO_4615 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4614 ?AUTO_4615 ?AUTO_4613 )
      ( DELIVER-PKG ?AUTO_4610 ?AUTO_4611 )
      ( DELIVER-PKG-VERIFY ?AUTO_4610 ?AUTO_4611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4617 - OBJ
      ?AUTO_4618 - LOCATION
    )
    :vars
    (
      ?AUTO_4623 - LOCATION
      ?AUTO_4619 - CITY
      ?AUTO_4621 - LOCATION
      ?AUTO_4620 - AIRPLANE
      ?AUTO_4622 - TRUCK
      ?AUTO_4624 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4623 ?AUTO_4619 ) ( IN-CITY ?AUTO_4618 ?AUTO_4619 ) ( not ( = ?AUTO_4618 ?AUTO_4623 ) ) ( AIRPORT ?AUTO_4621 ) ( AIRPORT ?AUTO_4623 ) ( not ( = ?AUTO_4621 ?AUTO_4623 ) ) ( not ( = ?AUTO_4618 ?AUTO_4621 ) ) ( OBJ-AT ?AUTO_4617 ?AUTO_4621 ) ( AIRPLANE-AT ?AUTO_4620 ?AUTO_4623 ) ( TRUCK-AT ?AUTO_4622 ?AUTO_4624 ) ( IN-CITY ?AUTO_4624 ?AUTO_4619 ) ( not ( = ?AUTO_4623 ?AUTO_4624 ) ) ( not ( = ?AUTO_4618 ?AUTO_4624 ) ) ( not ( = ?AUTO_4621 ?AUTO_4624 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4622 ?AUTO_4624 ?AUTO_4623 ?AUTO_4619 )
      ( DELIVER-PKG ?AUTO_4617 ?AUTO_4618 )
      ( DELIVER-PKG-VERIFY ?AUTO_4617 ?AUTO_4618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4651 - OBJ
      ?AUTO_4652 - LOCATION
    )
    :vars
    (
      ?AUTO_4657 - LOCATION
      ?AUTO_4656 - CITY
      ?AUTO_4653 - LOCATION
      ?AUTO_4654 - TRUCK
      ?AUTO_4655 - LOCATION
      ?AUTO_4659 - LOCATION
      ?AUTO_4658 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4657 ?AUTO_4656 ) ( IN-CITY ?AUTO_4652 ?AUTO_4656 ) ( not ( = ?AUTO_4652 ?AUTO_4657 ) ) ( AIRPORT ?AUTO_4653 ) ( AIRPORT ?AUTO_4657 ) ( not ( = ?AUTO_4653 ?AUTO_4657 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) ( OBJ-AT ?AUTO_4651 ?AUTO_4653 ) ( TRUCK-AT ?AUTO_4654 ?AUTO_4655 ) ( IN-CITY ?AUTO_4655 ?AUTO_4656 ) ( not ( = ?AUTO_4657 ?AUTO_4655 ) ) ( not ( = ?AUTO_4652 ?AUTO_4655 ) ) ( not ( = ?AUTO_4653 ?AUTO_4655 ) ) ( AIRPORT ?AUTO_4659 ) ( AIRPLANE-AT ?AUTO_4658 ?AUTO_4659 ) ( not ( = ?AUTO_4659 ?AUTO_4657 ) ) ( not ( = ?AUTO_4652 ?AUTO_4659 ) ) ( not ( = ?AUTO_4653 ?AUTO_4659 ) ) ( not ( = ?AUTO_4655 ?AUTO_4659 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4658 ?AUTO_4659 ?AUTO_4657 )
      ( DELIVER-PKG ?AUTO_4651 ?AUTO_4652 )
      ( DELIVER-PKG-VERIFY ?AUTO_4651 ?AUTO_4652 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4688 - OBJ
      ?AUTO_4689 - LOCATION
    )
    :vars
    (
      ?AUTO_4694 - LOCATION
      ?AUTO_4693 - CITY
      ?AUTO_4692 - LOCATION
      ?AUTO_4695 - AIRPLANE
      ?AUTO_4691 - TRUCK
      ?AUTO_4690 - LOCATION
      ?AUTO_4696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4694 ?AUTO_4693 ) ( IN-CITY ?AUTO_4689 ?AUTO_4693 ) ( not ( = ?AUTO_4689 ?AUTO_4694 ) ) ( AIRPORT ?AUTO_4692 ) ( AIRPORT ?AUTO_4694 ) ( not ( = ?AUTO_4692 ?AUTO_4694 ) ) ( not ( = ?AUTO_4689 ?AUTO_4692 ) ) ( AIRPLANE-AT ?AUTO_4695 ?AUTO_4694 ) ( TRUCK-AT ?AUTO_4691 ?AUTO_4690 ) ( IN-CITY ?AUTO_4690 ?AUTO_4693 ) ( not ( = ?AUTO_4694 ?AUTO_4690 ) ) ( not ( = ?AUTO_4689 ?AUTO_4690 ) ) ( not ( = ?AUTO_4692 ?AUTO_4690 ) ) ( TRUCK-AT ?AUTO_4696 ?AUTO_4692 ) ( IN-TRUCK ?AUTO_4688 ?AUTO_4696 ) ( not ( = ?AUTO_4691 ?AUTO_4696 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4688 ?AUTO_4696 ?AUTO_4692 )
      ( DELIVER-PKG ?AUTO_4688 ?AUTO_4689 )
      ( DELIVER-PKG-VERIFY ?AUTO_4688 ?AUTO_4689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4699 - OBJ
      ?AUTO_4700 - LOCATION
    )
    :vars
    (
      ?AUTO_4701 - LOCATION
      ?AUTO_4705 - CITY
      ?AUTO_4707 - LOCATION
      ?AUTO_4706 - AIRPLANE
      ?AUTO_4703 - TRUCK
      ?AUTO_4704 - LOCATION
      ?AUTO_4702 - TRUCK
      ?AUTO_4708 - LOCATION
      ?AUTO_4709 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4701 ?AUTO_4705 ) ( IN-CITY ?AUTO_4700 ?AUTO_4705 ) ( not ( = ?AUTO_4700 ?AUTO_4701 ) ) ( AIRPORT ?AUTO_4707 ) ( AIRPORT ?AUTO_4701 ) ( not ( = ?AUTO_4707 ?AUTO_4701 ) ) ( not ( = ?AUTO_4700 ?AUTO_4707 ) ) ( AIRPLANE-AT ?AUTO_4706 ?AUTO_4701 ) ( TRUCK-AT ?AUTO_4703 ?AUTO_4704 ) ( IN-CITY ?AUTO_4704 ?AUTO_4705 ) ( not ( = ?AUTO_4701 ?AUTO_4704 ) ) ( not ( = ?AUTO_4700 ?AUTO_4704 ) ) ( not ( = ?AUTO_4707 ?AUTO_4704 ) ) ( IN-TRUCK ?AUTO_4699 ?AUTO_4702 ) ( not ( = ?AUTO_4703 ?AUTO_4702 ) ) ( TRUCK-AT ?AUTO_4702 ?AUTO_4708 ) ( IN-CITY ?AUTO_4708 ?AUTO_4709 ) ( IN-CITY ?AUTO_4707 ?AUTO_4709 ) ( not ( = ?AUTO_4707 ?AUTO_4708 ) ) ( not ( = ?AUTO_4700 ?AUTO_4708 ) ) ( not ( = ?AUTO_4701 ?AUTO_4708 ) ) ( not ( = ?AUTO_4705 ?AUTO_4709 ) ) ( not ( = ?AUTO_4704 ?AUTO_4708 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4702 ?AUTO_4708 ?AUTO_4707 ?AUTO_4709 )
      ( DELIVER-PKG ?AUTO_4699 ?AUTO_4700 )
      ( DELIVER-PKG-VERIFY ?AUTO_4699 ?AUTO_4700 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4710 - OBJ
      ?AUTO_4711 - LOCATION
    )
    :vars
    (
      ?AUTO_4720 - LOCATION
      ?AUTO_4718 - CITY
      ?AUTO_4714 - LOCATION
      ?AUTO_4716 - AIRPLANE
      ?AUTO_4712 - TRUCK
      ?AUTO_4715 - LOCATION
      ?AUTO_4713 - TRUCK
      ?AUTO_4719 - LOCATION
      ?AUTO_4717 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4720 ?AUTO_4718 ) ( IN-CITY ?AUTO_4711 ?AUTO_4718 ) ( not ( = ?AUTO_4711 ?AUTO_4720 ) ) ( AIRPORT ?AUTO_4714 ) ( AIRPORT ?AUTO_4720 ) ( not ( = ?AUTO_4714 ?AUTO_4720 ) ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( AIRPLANE-AT ?AUTO_4716 ?AUTO_4720 ) ( TRUCK-AT ?AUTO_4712 ?AUTO_4715 ) ( IN-CITY ?AUTO_4715 ?AUTO_4718 ) ( not ( = ?AUTO_4720 ?AUTO_4715 ) ) ( not ( = ?AUTO_4711 ?AUTO_4715 ) ) ( not ( = ?AUTO_4714 ?AUTO_4715 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( TRUCK-AT ?AUTO_4713 ?AUTO_4719 ) ( IN-CITY ?AUTO_4719 ?AUTO_4717 ) ( IN-CITY ?AUTO_4714 ?AUTO_4717 ) ( not ( = ?AUTO_4714 ?AUTO_4719 ) ) ( not ( = ?AUTO_4711 ?AUTO_4719 ) ) ( not ( = ?AUTO_4720 ?AUTO_4719 ) ) ( not ( = ?AUTO_4718 ?AUTO_4717 ) ) ( not ( = ?AUTO_4715 ?AUTO_4719 ) ) ( OBJ-AT ?AUTO_4710 ?AUTO_4719 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4710 ?AUTO_4713 ?AUTO_4719 )
      ( DELIVER-PKG ?AUTO_4710 ?AUTO_4711 )
      ( DELIVER-PKG-VERIFY ?AUTO_4710 ?AUTO_4711 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4723 - OBJ
      ?AUTO_4724 - LOCATION
    )
    :vars
    (
      ?AUTO_4725 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4725 ?AUTO_4724 ) ( IN-TRUCK ?AUTO_4723 ?AUTO_4725 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4723 ?AUTO_4725 ?AUTO_4724 )
      ( DELIVER-PKG-VERIFY ?AUTO_4723 ?AUTO_4724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4774 - OBJ
      ?AUTO_4775 - LOCATION
    )
    :vars
    (
      ?AUTO_4778 - LOCATION
      ?AUTO_4776 - CITY
      ?AUTO_4777 - TRUCK
      ?AUTO_4779 - LOCATION
      ?AUTO_4780 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4778 ?AUTO_4776 ) ( IN-CITY ?AUTO_4775 ?AUTO_4776 ) ( not ( = ?AUTO_4775 ?AUTO_4778 ) ) ( TRUCK-AT ?AUTO_4777 ?AUTO_4779 ) ( IN-CITY ?AUTO_4779 ?AUTO_4776 ) ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) ( not ( = ?AUTO_4775 ?AUTO_4779 ) ) ( IN-AIRPLANE ?AUTO_4774 ?AUTO_4780 ) ( AIRPLANE-AT ?AUTO_4780 ?AUTO_4778 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4774 ?AUTO_4780 ?AUTO_4778 )
      ( DELIVER-PKG ?AUTO_4774 ?AUTO_4775 )
      ( DELIVER-PKG-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4791 - OBJ
      ?AUTO_4792 - LOCATION
    )
    :vars
    (
      ?AUTO_4798 - LOCATION
      ?AUTO_4794 - CITY
      ?AUTO_4797 - TRUCK
      ?AUTO_4796 - LOCATION
      ?AUTO_4795 - LOCATION
      ?AUTO_4793 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4798 ?AUTO_4794 ) ( IN-CITY ?AUTO_4792 ?AUTO_4794 ) ( not ( = ?AUTO_4792 ?AUTO_4798 ) ) ( TRUCK-AT ?AUTO_4797 ?AUTO_4796 ) ( IN-CITY ?AUTO_4796 ?AUTO_4794 ) ( not ( = ?AUTO_4798 ?AUTO_4796 ) ) ( not ( = ?AUTO_4792 ?AUTO_4796 ) ) ( AIRPORT ?AUTO_4795 ) ( AIRPORT ?AUTO_4798 ) ( AIRPLANE-AT ?AUTO_4793 ?AUTO_4795 ) ( not ( = ?AUTO_4795 ?AUTO_4798 ) ) ( not ( = ?AUTO_4792 ?AUTO_4795 ) ) ( not ( = ?AUTO_4796 ?AUTO_4795 ) ) ( OBJ-AT ?AUTO_4791 ?AUTO_4795 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4791 ?AUTO_4793 ?AUTO_4795 )
      ( DELIVER-PKG ?AUTO_4791 ?AUTO_4792 )
      ( DELIVER-PKG-VERIFY ?AUTO_4791 ?AUTO_4792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4811 - OBJ
      ?AUTO_4812 - LOCATION
    )
    :vars
    (
      ?AUTO_4813 - LOCATION
      ?AUTO_4817 - CITY
      ?AUTO_4815 - LOCATION
      ?AUTO_4818 - AIRPLANE
      ?AUTO_4816 - TRUCK
      ?AUTO_4814 - LOCATION
      ?AUTO_4819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4813 ?AUTO_4817 ) ( IN-CITY ?AUTO_4812 ?AUTO_4817 ) ( not ( = ?AUTO_4812 ?AUTO_4813 ) ) ( AIRPORT ?AUTO_4815 ) ( AIRPORT ?AUTO_4813 ) ( not ( = ?AUTO_4815 ?AUTO_4813 ) ) ( not ( = ?AUTO_4812 ?AUTO_4815 ) ) ( AIRPLANE-AT ?AUTO_4818 ?AUTO_4813 ) ( TRUCK-AT ?AUTO_4816 ?AUTO_4814 ) ( IN-CITY ?AUTO_4814 ?AUTO_4817 ) ( not ( = ?AUTO_4813 ?AUTO_4814 ) ) ( not ( = ?AUTO_4812 ?AUTO_4814 ) ) ( not ( = ?AUTO_4815 ?AUTO_4814 ) ) ( TRUCK-AT ?AUTO_4819 ?AUTO_4815 ) ( IN-TRUCK ?AUTO_4811 ?AUTO_4819 ) ( not ( = ?AUTO_4816 ?AUTO_4819 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4811 ?AUTO_4819 ?AUTO_4815 )
      ( DELIVER-PKG ?AUTO_4811 ?AUTO_4812 )
      ( DELIVER-PKG-VERIFY ?AUTO_4811 ?AUTO_4812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4820 - OBJ
      ?AUTO_4821 - LOCATION
    )
    :vars
    (
      ?AUTO_4828 - LOCATION
      ?AUTO_4827 - CITY
      ?AUTO_4826 - LOCATION
      ?AUTO_4825 - AIRPLANE
      ?AUTO_4822 - TRUCK
      ?AUTO_4824 - LOCATION
      ?AUTO_4823 - TRUCK
      ?AUTO_4829 - LOCATION
      ?AUTO_4830 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4828 ?AUTO_4827 ) ( IN-CITY ?AUTO_4821 ?AUTO_4827 ) ( not ( = ?AUTO_4821 ?AUTO_4828 ) ) ( AIRPORT ?AUTO_4826 ) ( AIRPORT ?AUTO_4828 ) ( not ( = ?AUTO_4826 ?AUTO_4828 ) ) ( not ( = ?AUTO_4821 ?AUTO_4826 ) ) ( AIRPLANE-AT ?AUTO_4825 ?AUTO_4828 ) ( TRUCK-AT ?AUTO_4822 ?AUTO_4824 ) ( IN-CITY ?AUTO_4824 ?AUTO_4827 ) ( not ( = ?AUTO_4828 ?AUTO_4824 ) ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4826 ?AUTO_4824 ) ) ( IN-TRUCK ?AUTO_4820 ?AUTO_4823 ) ( not ( = ?AUTO_4822 ?AUTO_4823 ) ) ( TRUCK-AT ?AUTO_4823 ?AUTO_4829 ) ( IN-CITY ?AUTO_4829 ?AUTO_4830 ) ( IN-CITY ?AUTO_4826 ?AUTO_4830 ) ( not ( = ?AUTO_4826 ?AUTO_4829 ) ) ( not ( = ?AUTO_4821 ?AUTO_4829 ) ) ( not ( = ?AUTO_4828 ?AUTO_4829 ) ) ( not ( = ?AUTO_4827 ?AUTO_4830 ) ) ( not ( = ?AUTO_4824 ?AUTO_4829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4823 ?AUTO_4829 ?AUTO_4826 ?AUTO_4830 )
      ( DELIVER-PKG ?AUTO_4820 ?AUTO_4821 )
      ( DELIVER-PKG-VERIFY ?AUTO_4820 ?AUTO_4821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4837 - OBJ
      ?AUTO_4838 - LOCATION
    )
    :vars
    (
      ?AUTO_4842 - LOCATION
      ?AUTO_4847 - CITY
      ?AUTO_4844 - LOCATION
      ?AUTO_4839 - AIRPLANE
      ?AUTO_4846 - TRUCK
      ?AUTO_4843 - LOCATION
      ?AUTO_4841 - TRUCK
      ?AUTO_4845 - LOCATION
      ?AUTO_4840 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4842 ?AUTO_4847 ) ( IN-CITY ?AUTO_4838 ?AUTO_4847 ) ( not ( = ?AUTO_4838 ?AUTO_4842 ) ) ( AIRPORT ?AUTO_4844 ) ( AIRPORT ?AUTO_4842 ) ( not ( = ?AUTO_4844 ?AUTO_4842 ) ) ( not ( = ?AUTO_4838 ?AUTO_4844 ) ) ( AIRPLANE-AT ?AUTO_4839 ?AUTO_4842 ) ( TRUCK-AT ?AUTO_4846 ?AUTO_4843 ) ( IN-CITY ?AUTO_4843 ?AUTO_4847 ) ( not ( = ?AUTO_4842 ?AUTO_4843 ) ) ( not ( = ?AUTO_4838 ?AUTO_4843 ) ) ( not ( = ?AUTO_4844 ?AUTO_4843 ) ) ( not ( = ?AUTO_4846 ?AUTO_4841 ) ) ( TRUCK-AT ?AUTO_4841 ?AUTO_4845 ) ( IN-CITY ?AUTO_4845 ?AUTO_4840 ) ( IN-CITY ?AUTO_4844 ?AUTO_4840 ) ( not ( = ?AUTO_4844 ?AUTO_4845 ) ) ( not ( = ?AUTO_4838 ?AUTO_4845 ) ) ( not ( = ?AUTO_4842 ?AUTO_4845 ) ) ( not ( = ?AUTO_4847 ?AUTO_4840 ) ) ( not ( = ?AUTO_4843 ?AUTO_4845 ) ) ( OBJ-AT ?AUTO_4837 ?AUTO_4845 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4837 ?AUTO_4841 ?AUTO_4845 )
      ( DELIVER-PKG ?AUTO_4837 ?AUTO_4838 )
      ( DELIVER-PKG-VERIFY ?AUTO_4837 ?AUTO_4838 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4854 - OBJ
      ?AUTO_4855 - LOCATION
    )
    :vars
    (
      ?AUTO_4856 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4856 ?AUTO_4855 ) ( IN-TRUCK ?AUTO_4854 ?AUTO_4856 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4854 ?AUTO_4856 ?AUTO_4855 )
      ( DELIVER-PKG-VERIFY ?AUTO_4854 ?AUTO_4855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4857 - OBJ
      ?AUTO_4858 - LOCATION
    )
    :vars
    (
      ?AUTO_4859 - TRUCK
      ?AUTO_4860 - LOCATION
      ?AUTO_4861 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4857 ?AUTO_4859 ) ( TRUCK-AT ?AUTO_4859 ?AUTO_4860 ) ( IN-CITY ?AUTO_4860 ?AUTO_4861 ) ( IN-CITY ?AUTO_4858 ?AUTO_4861 ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4859 ?AUTO_4860 ?AUTO_4858 ?AUTO_4861 )
      ( DELIVER-PKG ?AUTO_4857 ?AUTO_4858 )
      ( DELIVER-PKG-VERIFY ?AUTO_4857 ?AUTO_4858 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4866 - OBJ
      ?AUTO_4867 - LOCATION
    )
    :vars
    (
      ?AUTO_4868 - TRUCK
      ?AUTO_4869 - LOCATION
      ?AUTO_4870 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4868 ?AUTO_4869 ) ( IN-CITY ?AUTO_4869 ?AUTO_4870 ) ( IN-CITY ?AUTO_4867 ?AUTO_4870 ) ( not ( = ?AUTO_4867 ?AUTO_4869 ) ) ( OBJ-AT ?AUTO_4866 ?AUTO_4869 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4866 ?AUTO_4868 ?AUTO_4869 )
      ( DELIVER-PKG ?AUTO_4866 ?AUTO_4867 )
      ( DELIVER-PKG-VERIFY ?AUTO_4866 ?AUTO_4867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4871 - OBJ
      ?AUTO_4872 - LOCATION
    )
    :vars
    (
      ?AUTO_4873 - LOCATION
      ?AUTO_4875 - CITY
      ?AUTO_4874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4873 ?AUTO_4875 ) ( IN-CITY ?AUTO_4872 ?AUTO_4875 ) ( not ( = ?AUTO_4872 ?AUTO_4873 ) ) ( OBJ-AT ?AUTO_4871 ?AUTO_4873 ) ( TRUCK-AT ?AUTO_4874 ?AUTO_4872 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4874 ?AUTO_4872 ?AUTO_4873 ?AUTO_4875 )
      ( DELIVER-PKG ?AUTO_4871 ?AUTO_4872 )
      ( DELIVER-PKG-VERIFY ?AUTO_4871 ?AUTO_4872 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4894 - OBJ
      ?AUTO_4895 - LOCATION
    )
    :vars
    (
      ?AUTO_4896 - LOCATION
      ?AUTO_4898 - CITY
      ?AUTO_4897 - TRUCK
      ?AUTO_4899 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4896 ?AUTO_4898 ) ( IN-CITY ?AUTO_4895 ?AUTO_4898 ) ( not ( = ?AUTO_4895 ?AUTO_4896 ) ) ( OBJ-AT ?AUTO_4894 ?AUTO_4896 ) ( TRUCK-AT ?AUTO_4897 ?AUTO_4899 ) ( IN-CITY ?AUTO_4899 ?AUTO_4898 ) ( not ( = ?AUTO_4895 ?AUTO_4899 ) ) ( not ( = ?AUTO_4896 ?AUTO_4899 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4897 ?AUTO_4899 ?AUTO_4895 ?AUTO_4898 )
      ( DELIVER-PKG ?AUTO_4894 ?AUTO_4895 )
      ( DELIVER-PKG-VERIFY ?AUTO_4894 ?AUTO_4895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4966 - OBJ
      ?AUTO_4967 - LOCATION
    )
    :vars
    (
      ?AUTO_4968 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4966 ?AUTO_4968 ) ( AIRPLANE-AT ?AUTO_4968 ?AUTO_4967 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4966 ?AUTO_4968 ?AUTO_4967 )
      ( DELIVER-PKG-VERIFY ?AUTO_4966 ?AUTO_4967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4969 - OBJ
      ?AUTO_4970 - LOCATION
    )
    :vars
    (
      ?AUTO_4971 - AIRPLANE
      ?AUTO_4972 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4969 ?AUTO_4971 ) ( AIRPORT ?AUTO_4972 ) ( AIRPORT ?AUTO_4970 ) ( AIRPLANE-AT ?AUTO_4971 ?AUTO_4972 ) ( not ( = ?AUTO_4972 ?AUTO_4970 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4971 ?AUTO_4972 ?AUTO_4970 )
      ( DELIVER-PKG ?AUTO_4969 ?AUTO_4970 )
      ( DELIVER-PKG-VERIFY ?AUTO_4969 ?AUTO_4970 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4973 - OBJ
      ?AUTO_4974 - LOCATION
    )
    :vars
    (
      ?AUTO_4976 - LOCATION
      ?AUTO_4975 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4976 ) ( AIRPORT ?AUTO_4974 ) ( AIRPLANE-AT ?AUTO_4975 ?AUTO_4976 ) ( not ( = ?AUTO_4976 ?AUTO_4974 ) ) ( OBJ-AT ?AUTO_4973 ?AUTO_4976 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4973 ?AUTO_4975 ?AUTO_4976 )
      ( DELIVER-PKG ?AUTO_4973 ?AUTO_4974 )
      ( DELIVER-PKG-VERIFY ?AUTO_4973 ?AUTO_4974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4977 - OBJ
      ?AUTO_4978 - LOCATION
    )
    :vars
    (
      ?AUTO_4980 - LOCATION
      ?AUTO_4979 - AIRPLANE
      ?AUTO_4981 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4980 ) ( AIRPORT ?AUTO_4978 ) ( AIRPLANE-AT ?AUTO_4979 ?AUTO_4980 ) ( not ( = ?AUTO_4980 ?AUTO_4978 ) ) ( TRUCK-AT ?AUTO_4981 ?AUTO_4980 ) ( IN-TRUCK ?AUTO_4977 ?AUTO_4981 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4977 ?AUTO_4981 ?AUTO_4980 )
      ( DELIVER-PKG ?AUTO_4977 ?AUTO_4978 )
      ( DELIVER-PKG-VERIFY ?AUTO_4977 ?AUTO_4978 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4982 - OBJ
      ?AUTO_4983 - LOCATION
    )
    :vars
    (
      ?AUTO_4985 - LOCATION
      ?AUTO_4984 - AIRPLANE
      ?AUTO_4986 - TRUCK
      ?AUTO_4987 - LOCATION
      ?AUTO_4988 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4985 ) ( AIRPORT ?AUTO_4983 ) ( AIRPLANE-AT ?AUTO_4984 ?AUTO_4985 ) ( not ( = ?AUTO_4985 ?AUTO_4983 ) ) ( IN-TRUCK ?AUTO_4982 ?AUTO_4986 ) ( TRUCK-AT ?AUTO_4986 ?AUTO_4987 ) ( IN-CITY ?AUTO_4987 ?AUTO_4988 ) ( IN-CITY ?AUTO_4985 ?AUTO_4988 ) ( not ( = ?AUTO_4985 ?AUTO_4987 ) ) ( not ( = ?AUTO_4983 ?AUTO_4987 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4986 ?AUTO_4987 ?AUTO_4985 ?AUTO_4988 )
      ( DELIVER-PKG ?AUTO_4982 ?AUTO_4983 )
      ( DELIVER-PKG-VERIFY ?AUTO_4982 ?AUTO_4983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4993 - OBJ
      ?AUTO_4994 - LOCATION
    )
    :vars
    (
      ?AUTO_4998 - LOCATION
      ?AUTO_4995 - AIRPLANE
      ?AUTO_4997 - TRUCK
      ?AUTO_4999 - LOCATION
      ?AUTO_4996 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4998 ) ( AIRPORT ?AUTO_4994 ) ( AIRPLANE-AT ?AUTO_4995 ?AUTO_4998 ) ( not ( = ?AUTO_4998 ?AUTO_4994 ) ) ( TRUCK-AT ?AUTO_4997 ?AUTO_4999 ) ( IN-CITY ?AUTO_4999 ?AUTO_4996 ) ( IN-CITY ?AUTO_4998 ?AUTO_4996 ) ( not ( = ?AUTO_4998 ?AUTO_4999 ) ) ( not ( = ?AUTO_4994 ?AUTO_4999 ) ) ( OBJ-AT ?AUTO_4993 ?AUTO_4999 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4993 ?AUTO_4997 ?AUTO_4999 )
      ( DELIVER-PKG ?AUTO_4993 ?AUTO_4994 )
      ( DELIVER-PKG-VERIFY ?AUTO_4993 ?AUTO_4994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5000 - OBJ
      ?AUTO_5001 - LOCATION
    )
    :vars
    (
      ?AUTO_5005 - LOCATION
      ?AUTO_5003 - AIRPLANE
      ?AUTO_5002 - LOCATION
      ?AUTO_5004 - CITY
      ?AUTO_5006 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5005 ) ( AIRPORT ?AUTO_5001 ) ( AIRPLANE-AT ?AUTO_5003 ?AUTO_5005 ) ( not ( = ?AUTO_5005 ?AUTO_5001 ) ) ( IN-CITY ?AUTO_5002 ?AUTO_5004 ) ( IN-CITY ?AUTO_5005 ?AUTO_5004 ) ( not ( = ?AUTO_5005 ?AUTO_5002 ) ) ( not ( = ?AUTO_5001 ?AUTO_5002 ) ) ( OBJ-AT ?AUTO_5000 ?AUTO_5002 ) ( TRUCK-AT ?AUTO_5006 ?AUTO_5005 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5006 ?AUTO_5005 ?AUTO_5002 ?AUTO_5004 )
      ( DELIVER-PKG ?AUTO_5000 ?AUTO_5001 )
      ( DELIVER-PKG-VERIFY ?AUTO_5000 ?AUTO_5001 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5011 - OBJ
      ?AUTO_5012 - LOCATION
    )
    :vars
    (
      ?AUTO_5016 - LOCATION
      ?AUTO_5015 - LOCATION
      ?AUTO_5013 - CITY
      ?AUTO_5014 - TRUCK
      ?AUTO_5017 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5016 ) ( AIRPORT ?AUTO_5012 ) ( not ( = ?AUTO_5016 ?AUTO_5012 ) ) ( IN-CITY ?AUTO_5015 ?AUTO_5013 ) ( IN-CITY ?AUTO_5016 ?AUTO_5013 ) ( not ( = ?AUTO_5016 ?AUTO_5015 ) ) ( not ( = ?AUTO_5012 ?AUTO_5015 ) ) ( OBJ-AT ?AUTO_5011 ?AUTO_5015 ) ( TRUCK-AT ?AUTO_5014 ?AUTO_5016 ) ( AIRPLANE-AT ?AUTO_5017 ?AUTO_5012 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5017 ?AUTO_5012 ?AUTO_5016 )
      ( DELIVER-PKG ?AUTO_5011 ?AUTO_5012 )
      ( DELIVER-PKG-VERIFY ?AUTO_5011 ?AUTO_5012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5030 - OBJ
      ?AUTO_5031 - LOCATION
    )
    :vars
    (
      ?AUTO_5033 - LOCATION
      ?AUTO_5035 - AIRPLANE
      ?AUTO_5032 - LOCATION
      ?AUTO_5034 - CITY
      ?AUTO_5036 - TRUCK
      ?AUTO_5037 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5033 ) ( AIRPORT ?AUTO_5031 ) ( AIRPLANE-AT ?AUTO_5035 ?AUTO_5033 ) ( not ( = ?AUTO_5033 ?AUTO_5031 ) ) ( IN-CITY ?AUTO_5032 ?AUTO_5034 ) ( IN-CITY ?AUTO_5033 ?AUTO_5034 ) ( not ( = ?AUTO_5033 ?AUTO_5032 ) ) ( not ( = ?AUTO_5031 ?AUTO_5032 ) ) ( OBJ-AT ?AUTO_5030 ?AUTO_5032 ) ( TRUCK-AT ?AUTO_5036 ?AUTO_5037 ) ( IN-CITY ?AUTO_5037 ?AUTO_5034 ) ( not ( = ?AUTO_5033 ?AUTO_5037 ) ) ( not ( = ?AUTO_5031 ?AUTO_5037 ) ) ( not ( = ?AUTO_5032 ?AUTO_5037 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5036 ?AUTO_5037 ?AUTO_5033 ?AUTO_5034 )
      ( DELIVER-PKG ?AUTO_5030 ?AUTO_5031 )
      ( DELIVER-PKG-VERIFY ?AUTO_5030 ?AUTO_5031 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5064 - OBJ
      ?AUTO_5065 - LOCATION
    )
    :vars
    (
      ?AUTO_5067 - LOCATION
      ?AUTO_5068 - LOCATION
      ?AUTO_5071 - CITY
      ?AUTO_5070 - TRUCK
      ?AUTO_5066 - LOCATION
      ?AUTO_5072 - LOCATION
      ?AUTO_5069 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5067 ) ( AIRPORT ?AUTO_5065 ) ( not ( = ?AUTO_5067 ?AUTO_5065 ) ) ( IN-CITY ?AUTO_5068 ?AUTO_5071 ) ( IN-CITY ?AUTO_5067 ?AUTO_5071 ) ( not ( = ?AUTO_5067 ?AUTO_5068 ) ) ( not ( = ?AUTO_5065 ?AUTO_5068 ) ) ( OBJ-AT ?AUTO_5064 ?AUTO_5068 ) ( TRUCK-AT ?AUTO_5070 ?AUTO_5066 ) ( IN-CITY ?AUTO_5066 ?AUTO_5071 ) ( not ( = ?AUTO_5067 ?AUTO_5066 ) ) ( not ( = ?AUTO_5065 ?AUTO_5066 ) ) ( not ( = ?AUTO_5068 ?AUTO_5066 ) ) ( AIRPORT ?AUTO_5072 ) ( AIRPLANE-AT ?AUTO_5069 ?AUTO_5072 ) ( not ( = ?AUTO_5072 ?AUTO_5067 ) ) ( not ( = ?AUTO_5065 ?AUTO_5072 ) ) ( not ( = ?AUTO_5068 ?AUTO_5072 ) ) ( not ( = ?AUTO_5066 ?AUTO_5072 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5069 ?AUTO_5072 ?AUTO_5067 )
      ( DELIVER-PKG ?AUTO_5064 ?AUTO_5065 )
      ( DELIVER-PKG-VERIFY ?AUTO_5064 ?AUTO_5065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5111 - OBJ
      ?AUTO_5112 - LOCATION
    )
    :vars
    (
      ?AUTO_5113 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5113 ?AUTO_5112 ) ( IN-TRUCK ?AUTO_5111 ?AUTO_5113 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5111 ?AUTO_5113 ?AUTO_5112 )
      ( DELIVER-PKG-VERIFY ?AUTO_5111 ?AUTO_5112 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5114 - OBJ
      ?AUTO_5115 - LOCATION
    )
    :vars
    (
      ?AUTO_5116 - TRUCK
      ?AUTO_5117 - LOCATION
      ?AUTO_5118 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5114 ?AUTO_5116 ) ( TRUCK-AT ?AUTO_5116 ?AUTO_5117 ) ( IN-CITY ?AUTO_5117 ?AUTO_5118 ) ( IN-CITY ?AUTO_5115 ?AUTO_5118 ) ( not ( = ?AUTO_5115 ?AUTO_5117 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5116 ?AUTO_5117 ?AUTO_5115 ?AUTO_5118 )
      ( DELIVER-PKG ?AUTO_5114 ?AUTO_5115 )
      ( DELIVER-PKG-VERIFY ?AUTO_5114 ?AUTO_5115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5119 - OBJ
      ?AUTO_5120 - LOCATION
    )
    :vars
    (
      ?AUTO_5121 - TRUCK
      ?AUTO_5122 - LOCATION
      ?AUTO_5123 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5121 ?AUTO_5122 ) ( IN-CITY ?AUTO_5122 ?AUTO_5123 ) ( IN-CITY ?AUTO_5120 ?AUTO_5123 ) ( not ( = ?AUTO_5120 ?AUTO_5122 ) ) ( OBJ-AT ?AUTO_5119 ?AUTO_5122 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5119 ?AUTO_5121 ?AUTO_5122 )
      ( DELIVER-PKG ?AUTO_5119 ?AUTO_5120 )
      ( DELIVER-PKG-VERIFY ?AUTO_5119 ?AUTO_5120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5124 - OBJ
      ?AUTO_5125 - LOCATION
    )
    :vars
    (
      ?AUTO_5127 - TRUCK
      ?AUTO_5126 - LOCATION
      ?AUTO_5128 - CITY
      ?AUTO_5129 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5127 ?AUTO_5126 ) ( IN-CITY ?AUTO_5126 ?AUTO_5128 ) ( IN-CITY ?AUTO_5125 ?AUTO_5128 ) ( not ( = ?AUTO_5125 ?AUTO_5126 ) ) ( IN-AIRPLANE ?AUTO_5124 ?AUTO_5129 ) ( AIRPLANE-AT ?AUTO_5129 ?AUTO_5126 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5124 ?AUTO_5129 ?AUTO_5126 )
      ( DELIVER-PKG ?AUTO_5124 ?AUTO_5125 )
      ( DELIVER-PKG-VERIFY ?AUTO_5124 ?AUTO_5125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5130 - OBJ
      ?AUTO_5131 - LOCATION
    )
    :vars
    (
      ?AUTO_5135 - TRUCK
      ?AUTO_5133 - LOCATION
      ?AUTO_5132 - CITY
      ?AUTO_5134 - AIRPLANE
      ?AUTO_5136 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5135 ?AUTO_5133 ) ( IN-CITY ?AUTO_5133 ?AUTO_5132 ) ( IN-CITY ?AUTO_5131 ?AUTO_5132 ) ( not ( = ?AUTO_5131 ?AUTO_5133 ) ) ( IN-AIRPLANE ?AUTO_5130 ?AUTO_5134 ) ( AIRPORT ?AUTO_5136 ) ( AIRPORT ?AUTO_5133 ) ( AIRPLANE-AT ?AUTO_5134 ?AUTO_5136 ) ( not ( = ?AUTO_5136 ?AUTO_5133 ) ) ( not ( = ?AUTO_5131 ?AUTO_5136 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5134 ?AUTO_5136 ?AUTO_5133 )
      ( DELIVER-PKG ?AUTO_5130 ?AUTO_5131 )
      ( DELIVER-PKG-VERIFY ?AUTO_5130 ?AUTO_5131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5137 - OBJ
      ?AUTO_5138 - LOCATION
    )
    :vars
    (
      ?AUTO_5143 - TRUCK
      ?AUTO_5139 - LOCATION
      ?AUTO_5140 - CITY
      ?AUTO_5142 - LOCATION
      ?AUTO_5141 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5143 ?AUTO_5139 ) ( IN-CITY ?AUTO_5139 ?AUTO_5140 ) ( IN-CITY ?AUTO_5138 ?AUTO_5140 ) ( not ( = ?AUTO_5138 ?AUTO_5139 ) ) ( AIRPORT ?AUTO_5142 ) ( AIRPORT ?AUTO_5139 ) ( AIRPLANE-AT ?AUTO_5141 ?AUTO_5142 ) ( not ( = ?AUTO_5142 ?AUTO_5139 ) ) ( not ( = ?AUTO_5138 ?AUTO_5142 ) ) ( OBJ-AT ?AUTO_5137 ?AUTO_5142 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5137 ?AUTO_5141 ?AUTO_5142 )
      ( DELIVER-PKG ?AUTO_5137 ?AUTO_5138 )
      ( DELIVER-PKG-VERIFY ?AUTO_5137 ?AUTO_5138 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5144 - OBJ
      ?AUTO_5145 - LOCATION
    )
    :vars
    (
      ?AUTO_5146 - TRUCK
      ?AUTO_5150 - LOCATION
      ?AUTO_5147 - CITY
      ?AUTO_5148 - LOCATION
      ?AUTO_5149 - AIRPLANE
      ?AUTO_5151 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5146 ?AUTO_5150 ) ( IN-CITY ?AUTO_5150 ?AUTO_5147 ) ( IN-CITY ?AUTO_5145 ?AUTO_5147 ) ( not ( = ?AUTO_5145 ?AUTO_5150 ) ) ( AIRPORT ?AUTO_5148 ) ( AIRPORT ?AUTO_5150 ) ( AIRPLANE-AT ?AUTO_5149 ?AUTO_5148 ) ( not ( = ?AUTO_5148 ?AUTO_5150 ) ) ( not ( = ?AUTO_5145 ?AUTO_5148 ) ) ( TRUCK-AT ?AUTO_5151 ?AUTO_5148 ) ( IN-TRUCK ?AUTO_5144 ?AUTO_5151 ) ( not ( = ?AUTO_5146 ?AUTO_5151 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5144 ?AUTO_5151 ?AUTO_5148 )
      ( DELIVER-PKG ?AUTO_5144 ?AUTO_5145 )
      ( DELIVER-PKG-VERIFY ?AUTO_5144 ?AUTO_5145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5152 - OBJ
      ?AUTO_5153 - LOCATION
    )
    :vars
    (
      ?AUTO_5156 - TRUCK
      ?AUTO_5154 - LOCATION
      ?AUTO_5157 - CITY
      ?AUTO_5158 - LOCATION
      ?AUTO_5159 - AIRPLANE
      ?AUTO_5155 - TRUCK
      ?AUTO_5160 - LOCATION
      ?AUTO_5161 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5156 ?AUTO_5154 ) ( IN-CITY ?AUTO_5154 ?AUTO_5157 ) ( IN-CITY ?AUTO_5153 ?AUTO_5157 ) ( not ( = ?AUTO_5153 ?AUTO_5154 ) ) ( AIRPORT ?AUTO_5158 ) ( AIRPORT ?AUTO_5154 ) ( AIRPLANE-AT ?AUTO_5159 ?AUTO_5158 ) ( not ( = ?AUTO_5158 ?AUTO_5154 ) ) ( not ( = ?AUTO_5153 ?AUTO_5158 ) ) ( IN-TRUCK ?AUTO_5152 ?AUTO_5155 ) ( not ( = ?AUTO_5156 ?AUTO_5155 ) ) ( TRUCK-AT ?AUTO_5155 ?AUTO_5160 ) ( IN-CITY ?AUTO_5160 ?AUTO_5161 ) ( IN-CITY ?AUTO_5158 ?AUTO_5161 ) ( not ( = ?AUTO_5158 ?AUTO_5160 ) ) ( not ( = ?AUTO_5153 ?AUTO_5160 ) ) ( not ( = ?AUTO_5154 ?AUTO_5160 ) ) ( not ( = ?AUTO_5157 ?AUTO_5161 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5155 ?AUTO_5160 ?AUTO_5158 ?AUTO_5161 )
      ( DELIVER-PKG ?AUTO_5152 ?AUTO_5153 )
      ( DELIVER-PKG-VERIFY ?AUTO_5152 ?AUTO_5153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5166 - OBJ
      ?AUTO_5167 - LOCATION
    )
    :vars
    (
      ?AUTO_5168 - TRUCK
      ?AUTO_5175 - LOCATION
      ?AUTO_5173 - CITY
      ?AUTO_5174 - LOCATION
      ?AUTO_5171 - AIRPLANE
      ?AUTO_5169 - TRUCK
      ?AUTO_5172 - LOCATION
      ?AUTO_5170 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5168 ?AUTO_5175 ) ( IN-CITY ?AUTO_5175 ?AUTO_5173 ) ( IN-CITY ?AUTO_5167 ?AUTO_5173 ) ( not ( = ?AUTO_5167 ?AUTO_5175 ) ) ( AIRPORT ?AUTO_5174 ) ( AIRPORT ?AUTO_5175 ) ( AIRPLANE-AT ?AUTO_5171 ?AUTO_5174 ) ( not ( = ?AUTO_5174 ?AUTO_5175 ) ) ( not ( = ?AUTO_5167 ?AUTO_5174 ) ) ( not ( = ?AUTO_5168 ?AUTO_5169 ) ) ( TRUCK-AT ?AUTO_5169 ?AUTO_5172 ) ( IN-CITY ?AUTO_5172 ?AUTO_5170 ) ( IN-CITY ?AUTO_5174 ?AUTO_5170 ) ( not ( = ?AUTO_5174 ?AUTO_5172 ) ) ( not ( = ?AUTO_5167 ?AUTO_5172 ) ) ( not ( = ?AUTO_5175 ?AUTO_5172 ) ) ( not ( = ?AUTO_5173 ?AUTO_5170 ) ) ( OBJ-AT ?AUTO_5166 ?AUTO_5172 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5166 ?AUTO_5169 ?AUTO_5172 )
      ( DELIVER-PKG ?AUTO_5166 ?AUTO_5167 )
      ( DELIVER-PKG-VERIFY ?AUTO_5166 ?AUTO_5167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5176 - OBJ
      ?AUTO_5177 - LOCATION
    )
    :vars
    (
      ?AUTO_5181 - TRUCK
      ?AUTO_5185 - LOCATION
      ?AUTO_5180 - CITY
      ?AUTO_5179 - LOCATION
      ?AUTO_5184 - AIRPLANE
      ?AUTO_5178 - TRUCK
      ?AUTO_5182 - LOCATION
      ?AUTO_5183 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5181 ?AUTO_5185 ) ( IN-CITY ?AUTO_5185 ?AUTO_5180 ) ( IN-CITY ?AUTO_5177 ?AUTO_5180 ) ( not ( = ?AUTO_5177 ?AUTO_5185 ) ) ( AIRPORT ?AUTO_5179 ) ( AIRPORT ?AUTO_5185 ) ( AIRPLANE-AT ?AUTO_5184 ?AUTO_5179 ) ( not ( = ?AUTO_5179 ?AUTO_5185 ) ) ( not ( = ?AUTO_5177 ?AUTO_5179 ) ) ( not ( = ?AUTO_5181 ?AUTO_5178 ) ) ( IN-CITY ?AUTO_5182 ?AUTO_5183 ) ( IN-CITY ?AUTO_5179 ?AUTO_5183 ) ( not ( = ?AUTO_5179 ?AUTO_5182 ) ) ( not ( = ?AUTO_5177 ?AUTO_5182 ) ) ( not ( = ?AUTO_5185 ?AUTO_5182 ) ) ( not ( = ?AUTO_5180 ?AUTO_5183 ) ) ( OBJ-AT ?AUTO_5176 ?AUTO_5182 ) ( TRUCK-AT ?AUTO_5178 ?AUTO_5179 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5178 ?AUTO_5179 ?AUTO_5182 ?AUTO_5183 )
      ( DELIVER-PKG ?AUTO_5176 ?AUTO_5177 )
      ( DELIVER-PKG-VERIFY ?AUTO_5176 ?AUTO_5177 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5190 - OBJ
      ?AUTO_5191 - LOCATION
    )
    :vars
    (
      ?AUTO_5192 - TRUCK
      ?AUTO_5199 - LOCATION
      ?AUTO_5198 - CITY
      ?AUTO_5196 - LOCATION
      ?AUTO_5195 - TRUCK
      ?AUTO_5193 - LOCATION
      ?AUTO_5197 - CITY
      ?AUTO_5194 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5192 ?AUTO_5199 ) ( IN-CITY ?AUTO_5199 ?AUTO_5198 ) ( IN-CITY ?AUTO_5191 ?AUTO_5198 ) ( not ( = ?AUTO_5191 ?AUTO_5199 ) ) ( AIRPORT ?AUTO_5196 ) ( AIRPORT ?AUTO_5199 ) ( not ( = ?AUTO_5196 ?AUTO_5199 ) ) ( not ( = ?AUTO_5191 ?AUTO_5196 ) ) ( not ( = ?AUTO_5192 ?AUTO_5195 ) ) ( IN-CITY ?AUTO_5193 ?AUTO_5197 ) ( IN-CITY ?AUTO_5196 ?AUTO_5197 ) ( not ( = ?AUTO_5196 ?AUTO_5193 ) ) ( not ( = ?AUTO_5191 ?AUTO_5193 ) ) ( not ( = ?AUTO_5199 ?AUTO_5193 ) ) ( not ( = ?AUTO_5198 ?AUTO_5197 ) ) ( OBJ-AT ?AUTO_5190 ?AUTO_5193 ) ( TRUCK-AT ?AUTO_5195 ?AUTO_5196 ) ( AIRPLANE-AT ?AUTO_5194 ?AUTO_5199 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5194 ?AUTO_5199 ?AUTO_5196 )
      ( DELIVER-PKG ?AUTO_5190 ?AUTO_5191 )
      ( DELIVER-PKG-VERIFY ?AUTO_5190 ?AUTO_5191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5212 - OBJ
      ?AUTO_5213 - LOCATION
    )
    :vars
    (
      ?AUTO_5217 - TRUCK
      ?AUTO_5220 - LOCATION
      ?AUTO_5215 - CITY
      ?AUTO_5216 - LOCATION
      ?AUTO_5214 - AIRPLANE
      ?AUTO_5219 - TRUCK
      ?AUTO_5221 - LOCATION
      ?AUTO_5218 - CITY
      ?AUTO_5222 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5217 ?AUTO_5220 ) ( IN-CITY ?AUTO_5220 ?AUTO_5215 ) ( IN-CITY ?AUTO_5213 ?AUTO_5215 ) ( not ( = ?AUTO_5213 ?AUTO_5220 ) ) ( AIRPORT ?AUTO_5216 ) ( AIRPORT ?AUTO_5220 ) ( AIRPLANE-AT ?AUTO_5214 ?AUTO_5216 ) ( not ( = ?AUTO_5216 ?AUTO_5220 ) ) ( not ( = ?AUTO_5213 ?AUTO_5216 ) ) ( not ( = ?AUTO_5217 ?AUTO_5219 ) ) ( IN-CITY ?AUTO_5221 ?AUTO_5218 ) ( IN-CITY ?AUTO_5216 ?AUTO_5218 ) ( not ( = ?AUTO_5216 ?AUTO_5221 ) ) ( not ( = ?AUTO_5213 ?AUTO_5221 ) ) ( not ( = ?AUTO_5220 ?AUTO_5221 ) ) ( not ( = ?AUTO_5215 ?AUTO_5218 ) ) ( OBJ-AT ?AUTO_5212 ?AUTO_5221 ) ( TRUCK-AT ?AUTO_5219 ?AUTO_5222 ) ( IN-CITY ?AUTO_5222 ?AUTO_5218 ) ( not ( = ?AUTO_5216 ?AUTO_5222 ) ) ( not ( = ?AUTO_5213 ?AUTO_5222 ) ) ( not ( = ?AUTO_5220 ?AUTO_5222 ) ) ( not ( = ?AUTO_5221 ?AUTO_5222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5219 ?AUTO_5222 ?AUTO_5216 ?AUTO_5218 )
      ( DELIVER-PKG ?AUTO_5212 ?AUTO_5213 )
      ( DELIVER-PKG-VERIFY ?AUTO_5212 ?AUTO_5213 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5249 - OBJ
      ?AUTO_5250 - LOCATION
    )
    :vars
    (
      ?AUTO_5258 - TRUCK
      ?AUTO_5255 - LOCATION
      ?AUTO_5253 - CITY
      ?AUTO_5257 - LOCATION
      ?AUTO_5254 - TRUCK
      ?AUTO_5251 - LOCATION
      ?AUTO_5256 - CITY
      ?AUTO_5259 - LOCATION
      ?AUTO_5260 - LOCATION
      ?AUTO_5252 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5258 ?AUTO_5255 ) ( IN-CITY ?AUTO_5255 ?AUTO_5253 ) ( IN-CITY ?AUTO_5250 ?AUTO_5253 ) ( not ( = ?AUTO_5250 ?AUTO_5255 ) ) ( AIRPORT ?AUTO_5257 ) ( AIRPORT ?AUTO_5255 ) ( not ( = ?AUTO_5257 ?AUTO_5255 ) ) ( not ( = ?AUTO_5250 ?AUTO_5257 ) ) ( not ( = ?AUTO_5258 ?AUTO_5254 ) ) ( IN-CITY ?AUTO_5251 ?AUTO_5256 ) ( IN-CITY ?AUTO_5257 ?AUTO_5256 ) ( not ( = ?AUTO_5257 ?AUTO_5251 ) ) ( not ( = ?AUTO_5250 ?AUTO_5251 ) ) ( not ( = ?AUTO_5255 ?AUTO_5251 ) ) ( not ( = ?AUTO_5253 ?AUTO_5256 ) ) ( OBJ-AT ?AUTO_5249 ?AUTO_5251 ) ( TRUCK-AT ?AUTO_5254 ?AUTO_5259 ) ( IN-CITY ?AUTO_5259 ?AUTO_5256 ) ( not ( = ?AUTO_5257 ?AUTO_5259 ) ) ( not ( = ?AUTO_5250 ?AUTO_5259 ) ) ( not ( = ?AUTO_5255 ?AUTO_5259 ) ) ( not ( = ?AUTO_5251 ?AUTO_5259 ) ) ( AIRPORT ?AUTO_5260 ) ( AIRPLANE-AT ?AUTO_5252 ?AUTO_5260 ) ( not ( = ?AUTO_5260 ?AUTO_5257 ) ) ( not ( = ?AUTO_5250 ?AUTO_5260 ) ) ( not ( = ?AUTO_5255 ?AUTO_5260 ) ) ( not ( = ?AUTO_5251 ?AUTO_5260 ) ) ( not ( = ?AUTO_5259 ?AUTO_5260 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5252 ?AUTO_5260 ?AUTO_5257 )
      ( DELIVER-PKG ?AUTO_5249 ?AUTO_5250 )
      ( DELIVER-PKG-VERIFY ?AUTO_5249 ?AUTO_5250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5263 - OBJ
      ?AUTO_5264 - LOCATION
    )
    :vars
    (
      ?AUTO_5265 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5265 ?AUTO_5264 ) ( IN-TRUCK ?AUTO_5263 ?AUTO_5265 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5263 ?AUTO_5265 ?AUTO_5264 )
      ( DELIVER-PKG-VERIFY ?AUTO_5263 ?AUTO_5264 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5266 - OBJ
      ?AUTO_5267 - LOCATION
    )
    :vars
    (
      ?AUTO_5268 - TRUCK
      ?AUTO_5269 - LOCATION
      ?AUTO_5270 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5266 ?AUTO_5268 ) ( TRUCK-AT ?AUTO_5268 ?AUTO_5269 ) ( IN-CITY ?AUTO_5269 ?AUTO_5270 ) ( IN-CITY ?AUTO_5267 ?AUTO_5270 ) ( not ( = ?AUTO_5267 ?AUTO_5269 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5268 ?AUTO_5269 ?AUTO_5267 ?AUTO_5270 )
      ( DELIVER-PKG ?AUTO_5266 ?AUTO_5267 )
      ( DELIVER-PKG-VERIFY ?AUTO_5266 ?AUTO_5267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5275 - OBJ
      ?AUTO_5276 - LOCATION
    )
    :vars
    (
      ?AUTO_5279 - TRUCK
      ?AUTO_5277 - LOCATION
      ?AUTO_5278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5279 ?AUTO_5277 ) ( IN-CITY ?AUTO_5277 ?AUTO_5278 ) ( IN-CITY ?AUTO_5276 ?AUTO_5278 ) ( not ( = ?AUTO_5276 ?AUTO_5277 ) ) ( OBJ-AT ?AUTO_5275 ?AUTO_5277 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5275 ?AUTO_5279 ?AUTO_5277 )
      ( DELIVER-PKG ?AUTO_5275 ?AUTO_5276 )
      ( DELIVER-PKG-VERIFY ?AUTO_5275 ?AUTO_5276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5280 - OBJ
      ?AUTO_5281 - LOCATION
    )
    :vars
    (
      ?AUTO_5282 - LOCATION
      ?AUTO_5283 - CITY
      ?AUTO_5284 - TRUCK
      ?AUTO_5285 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5282 ?AUTO_5283 ) ( IN-CITY ?AUTO_5281 ?AUTO_5283 ) ( not ( = ?AUTO_5281 ?AUTO_5282 ) ) ( OBJ-AT ?AUTO_5280 ?AUTO_5282 ) ( TRUCK-AT ?AUTO_5284 ?AUTO_5285 ) ( IN-CITY ?AUTO_5285 ?AUTO_5283 ) ( not ( = ?AUTO_5282 ?AUTO_5285 ) ) ( not ( = ?AUTO_5281 ?AUTO_5285 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5284 ?AUTO_5285 ?AUTO_5282 ?AUTO_5283 )
      ( DELIVER-PKG ?AUTO_5280 ?AUTO_5281 )
      ( DELIVER-PKG-VERIFY ?AUTO_5280 ?AUTO_5281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5288 - OBJ
      ?AUTO_5289 - LOCATION
    )
    :vars
    (
      ?AUTO_5290 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5290 ?AUTO_5289 ) ( IN-TRUCK ?AUTO_5288 ?AUTO_5290 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5288 ?AUTO_5290 ?AUTO_5289 )
      ( DELIVER-PKG-VERIFY ?AUTO_5288 ?AUTO_5289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5295 - OBJ
      ?AUTO_5296 - LOCATION
    )
    :vars
    (
      ?AUTO_5298 - TRUCK
      ?AUTO_5297 - LOCATION
      ?AUTO_5299 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5298 ?AUTO_5297 ) ( IN-CITY ?AUTO_5297 ?AUTO_5299 ) ( IN-CITY ?AUTO_5296 ?AUTO_5299 ) ( not ( = ?AUTO_5296 ?AUTO_5297 ) ) ( OBJ-AT ?AUTO_5295 ?AUTO_5297 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5295 ?AUTO_5298 ?AUTO_5297 )
      ( DELIVER-PKG ?AUTO_5295 ?AUTO_5296 )
      ( DELIVER-PKG-VERIFY ?AUTO_5295 ?AUTO_5296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5300 - OBJ
      ?AUTO_5301 - LOCATION
    )
    :vars
    (
      ?AUTO_5303 - LOCATION
      ?AUTO_5304 - CITY
      ?AUTO_5302 - TRUCK
      ?AUTO_5305 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5303 ?AUTO_5304 ) ( IN-CITY ?AUTO_5301 ?AUTO_5304 ) ( not ( = ?AUTO_5301 ?AUTO_5303 ) ) ( OBJ-AT ?AUTO_5300 ?AUTO_5303 ) ( TRUCK-AT ?AUTO_5302 ?AUTO_5305 ) ( IN-CITY ?AUTO_5305 ?AUTO_5304 ) ( not ( = ?AUTO_5303 ?AUTO_5305 ) ) ( not ( = ?AUTO_5301 ?AUTO_5305 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5302 ?AUTO_5305 ?AUTO_5303 ?AUTO_5304 )
      ( DELIVER-PKG ?AUTO_5300 ?AUTO_5301 )
      ( DELIVER-PKG-VERIFY ?AUTO_5300 ?AUTO_5301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5312 - OBJ
      ?AUTO_5313 - LOCATION
    )
    :vars
    (
      ?AUTO_5314 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5314 ?AUTO_5313 ) ( IN-TRUCK ?AUTO_5312 ?AUTO_5314 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5312 ?AUTO_5314 ?AUTO_5313 )
      ( DELIVER-PKG-VERIFY ?AUTO_5312 ?AUTO_5313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5315 - OBJ
      ?AUTO_5316 - LOCATION
    )
    :vars
    (
      ?AUTO_5317 - TRUCK
      ?AUTO_5318 - LOCATION
      ?AUTO_5319 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5315 ?AUTO_5317 ) ( TRUCK-AT ?AUTO_5317 ?AUTO_5318 ) ( IN-CITY ?AUTO_5318 ?AUTO_5319 ) ( IN-CITY ?AUTO_5316 ?AUTO_5319 ) ( not ( = ?AUTO_5316 ?AUTO_5318 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5317 ?AUTO_5318 ?AUTO_5316 ?AUTO_5319 )
      ( DELIVER-PKG ?AUTO_5315 ?AUTO_5316 )
      ( DELIVER-PKG-VERIFY ?AUTO_5315 ?AUTO_5316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5320 - OBJ
      ?AUTO_5321 - LOCATION
    )
    :vars
    (
      ?AUTO_5322 - TRUCK
      ?AUTO_5323 - LOCATION
      ?AUTO_5324 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5322 ?AUTO_5323 ) ( IN-CITY ?AUTO_5323 ?AUTO_5324 ) ( IN-CITY ?AUTO_5321 ?AUTO_5324 ) ( not ( = ?AUTO_5321 ?AUTO_5323 ) ) ( OBJ-AT ?AUTO_5320 ?AUTO_5323 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5320 ?AUTO_5322 ?AUTO_5323 )
      ( DELIVER-PKG ?AUTO_5320 ?AUTO_5321 )
      ( DELIVER-PKG-VERIFY ?AUTO_5320 ?AUTO_5321 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5325 - OBJ
      ?AUTO_5326 - LOCATION
    )
    :vars
    (
      ?AUTO_5327 - LOCATION
      ?AUTO_5329 - CITY
      ?AUTO_5328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5327 ?AUTO_5329 ) ( IN-CITY ?AUTO_5326 ?AUTO_5329 ) ( not ( = ?AUTO_5326 ?AUTO_5327 ) ) ( OBJ-AT ?AUTO_5325 ?AUTO_5327 ) ( TRUCK-AT ?AUTO_5328 ?AUTO_5326 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5328 ?AUTO_5326 ?AUTO_5327 ?AUTO_5329 )
      ( DELIVER-PKG ?AUTO_5325 ?AUTO_5326 )
      ( DELIVER-PKG-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5348 - OBJ
      ?AUTO_5349 - LOCATION
    )
    :vars
    (
      ?AUTO_5350 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5350 ?AUTO_5349 ) ( IN-TRUCK ?AUTO_5348 ?AUTO_5350 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5348 ?AUTO_5350 ?AUTO_5349 )
      ( DELIVER-PKG-VERIFY ?AUTO_5348 ?AUTO_5349 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5351 - OBJ
      ?AUTO_5352 - LOCATION
    )
    :vars
    (
      ?AUTO_5353 - TRUCK
      ?AUTO_5354 - LOCATION
      ?AUTO_5355 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5351 ?AUTO_5353 ) ( TRUCK-AT ?AUTO_5353 ?AUTO_5354 ) ( IN-CITY ?AUTO_5354 ?AUTO_5355 ) ( IN-CITY ?AUTO_5352 ?AUTO_5355 ) ( not ( = ?AUTO_5352 ?AUTO_5354 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5353 ?AUTO_5354 ?AUTO_5352 ?AUTO_5355 )
      ( DELIVER-PKG ?AUTO_5351 ?AUTO_5352 )
      ( DELIVER-PKG-VERIFY ?AUTO_5351 ?AUTO_5352 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5382 - OBJ
      ?AUTO_5383 - LOCATION
    )
    :vars
    (
      ?AUTO_5384 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5382 ?AUTO_5384 ) ( AIRPLANE-AT ?AUTO_5384 ?AUTO_5383 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5382 ?AUTO_5384 ?AUTO_5383 )
      ( DELIVER-PKG-VERIFY ?AUTO_5382 ?AUTO_5383 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5387 - OBJ
      ?AUTO_5388 - LOCATION
    )
    :vars
    (
      ?AUTO_5389 - AIRPLANE
      ?AUTO_5390 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5387 ?AUTO_5389 ) ( AIRPORT ?AUTO_5390 ) ( AIRPORT ?AUTO_5388 ) ( AIRPLANE-AT ?AUTO_5389 ?AUTO_5390 ) ( not ( = ?AUTO_5390 ?AUTO_5388 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5389 ?AUTO_5390 ?AUTO_5388 )
      ( DELIVER-PKG ?AUTO_5387 ?AUTO_5388 )
      ( DELIVER-PKG-VERIFY ?AUTO_5387 ?AUTO_5388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5391 - OBJ
      ?AUTO_5392 - LOCATION
    )
    :vars
    (
      ?AUTO_5394 - LOCATION
      ?AUTO_5393 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5394 ) ( AIRPORT ?AUTO_5392 ) ( AIRPLANE-AT ?AUTO_5393 ?AUTO_5394 ) ( not ( = ?AUTO_5394 ?AUTO_5392 ) ) ( OBJ-AT ?AUTO_5391 ?AUTO_5394 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5391 ?AUTO_5393 ?AUTO_5394 )
      ( DELIVER-PKG ?AUTO_5391 ?AUTO_5392 )
      ( DELIVER-PKG-VERIFY ?AUTO_5391 ?AUTO_5392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5395 - OBJ
      ?AUTO_5396 - LOCATION
    )
    :vars
    (
      ?AUTO_5398 - LOCATION
      ?AUTO_5397 - AIRPLANE
      ?AUTO_5399 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5398 ) ( AIRPORT ?AUTO_5396 ) ( AIRPLANE-AT ?AUTO_5397 ?AUTO_5398 ) ( not ( = ?AUTO_5398 ?AUTO_5396 ) ) ( TRUCK-AT ?AUTO_5399 ?AUTO_5398 ) ( IN-TRUCK ?AUTO_5395 ?AUTO_5399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5395 ?AUTO_5399 ?AUTO_5398 )
      ( DELIVER-PKG ?AUTO_5395 ?AUTO_5396 )
      ( DELIVER-PKG-VERIFY ?AUTO_5395 ?AUTO_5396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5400 - OBJ
      ?AUTO_5401 - LOCATION
    )
    :vars
    (
      ?AUTO_5403 - LOCATION
      ?AUTO_5402 - AIRPLANE
      ?AUTO_5404 - TRUCK
      ?AUTO_5405 - LOCATION
      ?AUTO_5406 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5403 ) ( AIRPORT ?AUTO_5401 ) ( AIRPLANE-AT ?AUTO_5402 ?AUTO_5403 ) ( not ( = ?AUTO_5403 ?AUTO_5401 ) ) ( IN-TRUCK ?AUTO_5400 ?AUTO_5404 ) ( TRUCK-AT ?AUTO_5404 ?AUTO_5405 ) ( IN-CITY ?AUTO_5405 ?AUTO_5406 ) ( IN-CITY ?AUTO_5403 ?AUTO_5406 ) ( not ( = ?AUTO_5403 ?AUTO_5405 ) ) ( not ( = ?AUTO_5401 ?AUTO_5405 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5404 ?AUTO_5405 ?AUTO_5403 ?AUTO_5406 )
      ( DELIVER-PKG ?AUTO_5400 ?AUTO_5401 )
      ( DELIVER-PKG-VERIFY ?AUTO_5400 ?AUTO_5401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5415 - OBJ
      ?AUTO_5416 - LOCATION
    )
    :vars
    (
      ?AUTO_5418 - LOCATION
      ?AUTO_5420 - AIRPLANE
      ?AUTO_5417 - TRUCK
      ?AUTO_5421 - LOCATION
      ?AUTO_5419 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5418 ) ( AIRPORT ?AUTO_5416 ) ( AIRPLANE-AT ?AUTO_5420 ?AUTO_5418 ) ( not ( = ?AUTO_5418 ?AUTO_5416 ) ) ( TRUCK-AT ?AUTO_5417 ?AUTO_5421 ) ( IN-CITY ?AUTO_5421 ?AUTO_5419 ) ( IN-CITY ?AUTO_5418 ?AUTO_5419 ) ( not ( = ?AUTO_5418 ?AUTO_5421 ) ) ( not ( = ?AUTO_5416 ?AUTO_5421 ) ) ( OBJ-AT ?AUTO_5415 ?AUTO_5421 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5415 ?AUTO_5417 ?AUTO_5421 )
      ( DELIVER-PKG ?AUTO_5415 ?AUTO_5416 )
      ( DELIVER-PKG-VERIFY ?AUTO_5415 ?AUTO_5416 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5438 - OBJ
      ?AUTO_5439 - LOCATION
    )
    :vars
    (
      ?AUTO_5440 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5438 ?AUTO_5440 ) ( AIRPLANE-AT ?AUTO_5440 ?AUTO_5439 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5438 ?AUTO_5440 ?AUTO_5439 )
      ( DELIVER-PKG-VERIFY ?AUTO_5438 ?AUTO_5439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5441 - OBJ
      ?AUTO_5442 - LOCATION
    )
    :vars
    (
      ?AUTO_5443 - AIRPLANE
      ?AUTO_5444 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5441 ?AUTO_5443 ) ( AIRPORT ?AUTO_5444 ) ( AIRPORT ?AUTO_5442 ) ( AIRPLANE-AT ?AUTO_5443 ?AUTO_5444 ) ( not ( = ?AUTO_5444 ?AUTO_5442 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5443 ?AUTO_5444 ?AUTO_5442 )
      ( DELIVER-PKG ?AUTO_5441 ?AUTO_5442 )
      ( DELIVER-PKG-VERIFY ?AUTO_5441 ?AUTO_5442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5447 - OBJ
      ?AUTO_5448 - LOCATION
    )
    :vars
    (
      ?AUTO_5450 - LOCATION
      ?AUTO_5449 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5450 ) ( AIRPORT ?AUTO_5448 ) ( AIRPLANE-AT ?AUTO_5449 ?AUTO_5450 ) ( not ( = ?AUTO_5450 ?AUTO_5448 ) ) ( OBJ-AT ?AUTO_5447 ?AUTO_5450 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5447 ?AUTO_5449 ?AUTO_5450 )
      ( DELIVER-PKG ?AUTO_5447 ?AUTO_5448 )
      ( DELIVER-PKG-VERIFY ?AUTO_5447 ?AUTO_5448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5451 - OBJ
      ?AUTO_5452 - LOCATION
    )
    :vars
    (
      ?AUTO_5454 - LOCATION
      ?AUTO_5453 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5454 ) ( AIRPORT ?AUTO_5452 ) ( not ( = ?AUTO_5454 ?AUTO_5452 ) ) ( OBJ-AT ?AUTO_5451 ?AUTO_5454 ) ( AIRPLANE-AT ?AUTO_5453 ?AUTO_5452 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5453 ?AUTO_5452 ?AUTO_5454 )
      ( DELIVER-PKG ?AUTO_5451 ?AUTO_5452 )
      ( DELIVER-PKG-VERIFY ?AUTO_5451 ?AUTO_5452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5461 - OBJ
      ?AUTO_5462 - LOCATION
    )
    :vars
    (
      ?AUTO_5463 - LOCATION
      ?AUTO_5464 - AIRPLANE
      ?AUTO_5465 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5463 ) ( AIRPORT ?AUTO_5462 ) ( not ( = ?AUTO_5463 ?AUTO_5462 ) ) ( AIRPLANE-AT ?AUTO_5464 ?AUTO_5462 ) ( TRUCK-AT ?AUTO_5465 ?AUTO_5463 ) ( IN-TRUCK ?AUTO_5461 ?AUTO_5465 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5461 ?AUTO_5465 ?AUTO_5463 )
      ( DELIVER-PKG ?AUTO_5461 ?AUTO_5462 )
      ( DELIVER-PKG-VERIFY ?AUTO_5461 ?AUTO_5462 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5466 - OBJ
      ?AUTO_5467 - LOCATION
    )
    :vars
    (
      ?AUTO_5468 - LOCATION
      ?AUTO_5470 - AIRPLANE
      ?AUTO_5469 - TRUCK
      ?AUTO_5471 - LOCATION
      ?AUTO_5472 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5468 ) ( AIRPORT ?AUTO_5467 ) ( not ( = ?AUTO_5468 ?AUTO_5467 ) ) ( AIRPLANE-AT ?AUTO_5470 ?AUTO_5467 ) ( IN-TRUCK ?AUTO_5466 ?AUTO_5469 ) ( TRUCK-AT ?AUTO_5469 ?AUTO_5471 ) ( IN-CITY ?AUTO_5471 ?AUTO_5472 ) ( IN-CITY ?AUTO_5468 ?AUTO_5472 ) ( not ( = ?AUTO_5468 ?AUTO_5471 ) ) ( not ( = ?AUTO_5467 ?AUTO_5471 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5469 ?AUTO_5471 ?AUTO_5468 ?AUTO_5472 )
      ( DELIVER-PKG ?AUTO_5466 ?AUTO_5467 )
      ( DELIVER-PKG-VERIFY ?AUTO_5466 ?AUTO_5467 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5473 - OBJ
      ?AUTO_5474 - LOCATION
    )
    :vars
    (
      ?AUTO_5478 - LOCATION
      ?AUTO_5479 - AIRPLANE
      ?AUTO_5476 - TRUCK
      ?AUTO_5477 - LOCATION
      ?AUTO_5475 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5478 ) ( AIRPORT ?AUTO_5474 ) ( not ( = ?AUTO_5478 ?AUTO_5474 ) ) ( AIRPLANE-AT ?AUTO_5479 ?AUTO_5474 ) ( TRUCK-AT ?AUTO_5476 ?AUTO_5477 ) ( IN-CITY ?AUTO_5477 ?AUTO_5475 ) ( IN-CITY ?AUTO_5478 ?AUTO_5475 ) ( not ( = ?AUTO_5478 ?AUTO_5477 ) ) ( not ( = ?AUTO_5474 ?AUTO_5477 ) ) ( OBJ-AT ?AUTO_5473 ?AUTO_5477 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5473 ?AUTO_5476 ?AUTO_5477 )
      ( DELIVER-PKG ?AUTO_5473 ?AUTO_5474 )
      ( DELIVER-PKG-VERIFY ?AUTO_5473 ?AUTO_5474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5480 - OBJ
      ?AUTO_5481 - LOCATION
    )
    :vars
    (
      ?AUTO_5484 - LOCATION
      ?AUTO_5485 - AIRPLANE
      ?AUTO_5486 - LOCATION
      ?AUTO_5483 - CITY
      ?AUTO_5482 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5484 ) ( AIRPORT ?AUTO_5481 ) ( not ( = ?AUTO_5484 ?AUTO_5481 ) ) ( AIRPLANE-AT ?AUTO_5485 ?AUTO_5481 ) ( IN-CITY ?AUTO_5486 ?AUTO_5483 ) ( IN-CITY ?AUTO_5484 ?AUTO_5483 ) ( not ( = ?AUTO_5484 ?AUTO_5486 ) ) ( not ( = ?AUTO_5481 ?AUTO_5486 ) ) ( OBJ-AT ?AUTO_5480 ?AUTO_5486 ) ( TRUCK-AT ?AUTO_5482 ?AUTO_5484 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5482 ?AUTO_5484 ?AUTO_5486 ?AUTO_5483 )
      ( DELIVER-PKG ?AUTO_5480 ?AUTO_5481 )
      ( DELIVER-PKG-VERIFY ?AUTO_5480 ?AUTO_5481 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5505 - OBJ
      ?AUTO_5506 - LOCATION
    )
    :vars
    (
      ?AUTO_5507 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5505 ?AUTO_5507 ) ( AIRPLANE-AT ?AUTO_5507 ?AUTO_5506 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5505 ?AUTO_5507 ?AUTO_5506 )
      ( DELIVER-PKG-VERIFY ?AUTO_5505 ?AUTO_5506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5508 - OBJ
      ?AUTO_5509 - LOCATION
    )
    :vars
    (
      ?AUTO_5510 - AIRPLANE
      ?AUTO_5511 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5508 ?AUTO_5510 ) ( AIRPORT ?AUTO_5511 ) ( AIRPORT ?AUTO_5509 ) ( AIRPLANE-AT ?AUTO_5510 ?AUTO_5511 ) ( not ( = ?AUTO_5511 ?AUTO_5509 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5510 ?AUTO_5511 ?AUTO_5509 )
      ( DELIVER-PKG ?AUTO_5508 ?AUTO_5509 )
      ( DELIVER-PKG-VERIFY ?AUTO_5508 ?AUTO_5509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5514 - OBJ
      ?AUTO_5515 - LOCATION
    )
    :vars
    (
      ?AUTO_5517 - LOCATION
      ?AUTO_5516 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5517 ) ( AIRPORT ?AUTO_5515 ) ( AIRPLANE-AT ?AUTO_5516 ?AUTO_5517 ) ( not ( = ?AUTO_5517 ?AUTO_5515 ) ) ( OBJ-AT ?AUTO_5514 ?AUTO_5517 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5514 ?AUTO_5516 ?AUTO_5517 )
      ( DELIVER-PKG ?AUTO_5514 ?AUTO_5515 )
      ( DELIVER-PKG-VERIFY ?AUTO_5514 ?AUTO_5515 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5518 - OBJ
      ?AUTO_5519 - LOCATION
    )
    :vars
    (
      ?AUTO_5521 - LOCATION
      ?AUTO_5520 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5521 ) ( AIRPORT ?AUTO_5519 ) ( not ( = ?AUTO_5521 ?AUTO_5519 ) ) ( OBJ-AT ?AUTO_5518 ?AUTO_5521 ) ( AIRPLANE-AT ?AUTO_5520 ?AUTO_5519 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5520 ?AUTO_5519 ?AUTO_5521 )
      ( DELIVER-PKG ?AUTO_5518 ?AUTO_5519 )
      ( DELIVER-PKG-VERIFY ?AUTO_5518 ?AUTO_5519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5562 - OBJ
      ?AUTO_5563 - LOCATION
    )
    :vars
    (
      ?AUTO_5568 - LOCATION
      ?AUTO_5564 - AIRPLANE
      ?AUTO_5565 - LOCATION
      ?AUTO_5567 - CITY
      ?AUTO_5566 - TRUCK
      ?AUTO_5569 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5568 ) ( AIRPORT ?AUTO_5563 ) ( not ( = ?AUTO_5568 ?AUTO_5563 ) ) ( AIRPLANE-AT ?AUTO_5564 ?AUTO_5563 ) ( IN-CITY ?AUTO_5565 ?AUTO_5567 ) ( IN-CITY ?AUTO_5568 ?AUTO_5567 ) ( not ( = ?AUTO_5568 ?AUTO_5565 ) ) ( not ( = ?AUTO_5563 ?AUTO_5565 ) ) ( OBJ-AT ?AUTO_5562 ?AUTO_5565 ) ( TRUCK-AT ?AUTO_5566 ?AUTO_5569 ) ( IN-CITY ?AUTO_5569 ?AUTO_5567 ) ( not ( = ?AUTO_5565 ?AUTO_5569 ) ) ( not ( = ?AUTO_5563 ?AUTO_5569 ) ) ( not ( = ?AUTO_5568 ?AUTO_5569 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5566 ?AUTO_5569 ?AUTO_5565 ?AUTO_5567 )
      ( DELIVER-PKG ?AUTO_5562 ?AUTO_5563 )
      ( DELIVER-PKG-VERIFY ?AUTO_5562 ?AUTO_5563 ) )
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
      ?AUTO_5581 - LOCATION
      ?AUTO_5582 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5581 ) ( AIRPORT ?AUTO_5580 ) ( AIRPLANE-AT ?AUTO_5582 ?AUTO_5581 ) ( not ( = ?AUTO_5581 ?AUTO_5580 ) ) ( OBJ-AT ?AUTO_5579 ?AUTO_5581 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5579 ?AUTO_5582 ?AUTO_5581 )
      ( DELIVER-PKG ?AUTO_5579 ?AUTO_5580 )
      ( DELIVER-PKG-VERIFY ?AUTO_5579 ?AUTO_5580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5623 - OBJ
      ?AUTO_5624 - LOCATION
    )
    :vars
    (
      ?AUTO_5627 - LOCATION
      ?AUTO_5628 - AIRPLANE
      ?AUTO_5625 - LOCATION
      ?AUTO_5629 - CITY
      ?AUTO_5626 - TRUCK
      ?AUTO_5630 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5627 ) ( AIRPORT ?AUTO_5624 ) ( not ( = ?AUTO_5627 ?AUTO_5624 ) ) ( AIRPLANE-AT ?AUTO_5628 ?AUTO_5624 ) ( IN-CITY ?AUTO_5625 ?AUTO_5629 ) ( IN-CITY ?AUTO_5627 ?AUTO_5629 ) ( not ( = ?AUTO_5627 ?AUTO_5625 ) ) ( not ( = ?AUTO_5624 ?AUTO_5625 ) ) ( OBJ-AT ?AUTO_5623 ?AUTO_5625 ) ( TRUCK-AT ?AUTO_5626 ?AUTO_5630 ) ( IN-CITY ?AUTO_5630 ?AUTO_5629 ) ( not ( = ?AUTO_5625 ?AUTO_5630 ) ) ( not ( = ?AUTO_5624 ?AUTO_5630 ) ) ( not ( = ?AUTO_5627 ?AUTO_5630 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5626 ?AUTO_5630 ?AUTO_5625 ?AUTO_5629 )
      ( DELIVER-PKG ?AUTO_5623 ?AUTO_5624 )
      ( DELIVER-PKG-VERIFY ?AUTO_5623 ?AUTO_5624 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5637 - OBJ
      ?AUTO_5638 - LOCATION
    )
    :vars
    (
      ?AUTO_5639 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5639 ?AUTO_5638 ) ( IN-TRUCK ?AUTO_5637 ?AUTO_5639 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5637 ?AUTO_5639 ?AUTO_5638 )
      ( DELIVER-PKG-VERIFY ?AUTO_5637 ?AUTO_5638 ) )
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
      ?AUTO_5643 - LOCATION
      ?AUTO_5644 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5640 ?AUTO_5642 ) ( TRUCK-AT ?AUTO_5642 ?AUTO_5643 ) ( IN-CITY ?AUTO_5643 ?AUTO_5644 ) ( IN-CITY ?AUTO_5641 ?AUTO_5644 ) ( not ( = ?AUTO_5641 ?AUTO_5643 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5642 ?AUTO_5643 ?AUTO_5641 ?AUTO_5644 )
      ( DELIVER-PKG ?AUTO_5640 ?AUTO_5641 )
      ( DELIVER-PKG-VERIFY ?AUTO_5640 ?AUTO_5641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5647 - OBJ
      ?AUTO_5648 - LOCATION
    )
    :vars
    (
      ?AUTO_5649 - TRUCK
      ?AUTO_5651 - LOCATION
      ?AUTO_5650 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5649 ?AUTO_5651 ) ( IN-CITY ?AUTO_5651 ?AUTO_5650 ) ( IN-CITY ?AUTO_5648 ?AUTO_5650 ) ( not ( = ?AUTO_5648 ?AUTO_5651 ) ) ( OBJ-AT ?AUTO_5647 ?AUTO_5651 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5647 ?AUTO_5649 ?AUTO_5651 )
      ( DELIVER-PKG ?AUTO_5647 ?AUTO_5648 )
      ( DELIVER-PKG-VERIFY ?AUTO_5647 ?AUTO_5648 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5654 - OBJ
      ?AUTO_5655 - LOCATION
    )
    :vars
    (
      ?AUTO_5656 - TRUCK
      ?AUTO_5657 - LOCATION
      ?AUTO_5658 - CITY
      ?AUTO_5659 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5656 ?AUTO_5657 ) ( IN-CITY ?AUTO_5657 ?AUTO_5658 ) ( IN-CITY ?AUTO_5655 ?AUTO_5658 ) ( not ( = ?AUTO_5655 ?AUTO_5657 ) ) ( IN-AIRPLANE ?AUTO_5654 ?AUTO_5659 ) ( AIRPLANE-AT ?AUTO_5659 ?AUTO_5657 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5654 ?AUTO_5659 ?AUTO_5657 )
      ( DELIVER-PKG ?AUTO_5654 ?AUTO_5655 )
      ( DELIVER-PKG-VERIFY ?AUTO_5654 ?AUTO_5655 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5660 - OBJ
      ?AUTO_5661 - LOCATION
    )
    :vars
    (
      ?AUTO_5663 - TRUCK
      ?AUTO_5664 - LOCATION
      ?AUTO_5662 - CITY
      ?AUTO_5665 - AIRPLANE
      ?AUTO_5666 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5663 ?AUTO_5664 ) ( IN-CITY ?AUTO_5664 ?AUTO_5662 ) ( IN-CITY ?AUTO_5661 ?AUTO_5662 ) ( not ( = ?AUTO_5661 ?AUTO_5664 ) ) ( IN-AIRPLANE ?AUTO_5660 ?AUTO_5665 ) ( AIRPORT ?AUTO_5666 ) ( AIRPORT ?AUTO_5664 ) ( AIRPLANE-AT ?AUTO_5665 ?AUTO_5666 ) ( not ( = ?AUTO_5666 ?AUTO_5664 ) ) ( not ( = ?AUTO_5661 ?AUTO_5666 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5665 ?AUTO_5666 ?AUTO_5664 )
      ( DELIVER-PKG ?AUTO_5660 ?AUTO_5661 )
      ( DELIVER-PKG-VERIFY ?AUTO_5660 ?AUTO_5661 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5669 - OBJ
      ?AUTO_5670 - LOCATION
    )
    :vars
    (
      ?AUTO_5674 - TRUCK
      ?AUTO_5673 - LOCATION
      ?AUTO_5675 - CITY
      ?AUTO_5672 - LOCATION
      ?AUTO_5671 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5674 ?AUTO_5673 ) ( IN-CITY ?AUTO_5673 ?AUTO_5675 ) ( IN-CITY ?AUTO_5670 ?AUTO_5675 ) ( not ( = ?AUTO_5670 ?AUTO_5673 ) ) ( AIRPORT ?AUTO_5672 ) ( AIRPORT ?AUTO_5673 ) ( AIRPLANE-AT ?AUTO_5671 ?AUTO_5672 ) ( not ( = ?AUTO_5672 ?AUTO_5673 ) ) ( not ( = ?AUTO_5670 ?AUTO_5672 ) ) ( OBJ-AT ?AUTO_5669 ?AUTO_5672 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5669 ?AUTO_5671 ?AUTO_5672 )
      ( DELIVER-PKG ?AUTO_5669 ?AUTO_5670 )
      ( DELIVER-PKG-VERIFY ?AUTO_5669 ?AUTO_5670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5676 - OBJ
      ?AUTO_5677 - LOCATION
    )
    :vars
    (
      ?AUTO_5680 - TRUCK
      ?AUTO_5682 - LOCATION
      ?AUTO_5678 - CITY
      ?AUTO_5681 - LOCATION
      ?AUTO_5679 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5680 ?AUTO_5682 ) ( IN-CITY ?AUTO_5682 ?AUTO_5678 ) ( IN-CITY ?AUTO_5677 ?AUTO_5678 ) ( not ( = ?AUTO_5677 ?AUTO_5682 ) ) ( AIRPORT ?AUTO_5681 ) ( AIRPORT ?AUTO_5682 ) ( not ( = ?AUTO_5681 ?AUTO_5682 ) ) ( not ( = ?AUTO_5677 ?AUTO_5681 ) ) ( OBJ-AT ?AUTO_5676 ?AUTO_5681 ) ( AIRPLANE-AT ?AUTO_5679 ?AUTO_5682 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5679 ?AUTO_5682 ?AUTO_5681 )
      ( DELIVER-PKG ?AUTO_5676 ?AUTO_5677 )
      ( DELIVER-PKG-VERIFY ?AUTO_5676 ?AUTO_5677 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5699 - OBJ
      ?AUTO_5700 - LOCATION
    )
    :vars
    (
      ?AUTO_5705 - LOCATION
      ?AUTO_5703 - CITY
      ?AUTO_5701 - LOCATION
      ?AUTO_5702 - AIRPLANE
      ?AUTO_5704 - TRUCK
      ?AUTO_5706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5705 ?AUTO_5703 ) ( IN-CITY ?AUTO_5700 ?AUTO_5703 ) ( not ( = ?AUTO_5700 ?AUTO_5705 ) ) ( AIRPORT ?AUTO_5701 ) ( AIRPORT ?AUTO_5705 ) ( not ( = ?AUTO_5701 ?AUTO_5705 ) ) ( not ( = ?AUTO_5700 ?AUTO_5701 ) ) ( OBJ-AT ?AUTO_5699 ?AUTO_5701 ) ( AIRPLANE-AT ?AUTO_5702 ?AUTO_5705 ) ( TRUCK-AT ?AUTO_5704 ?AUTO_5706 ) ( IN-CITY ?AUTO_5706 ?AUTO_5703 ) ( not ( = ?AUTO_5705 ?AUTO_5706 ) ) ( not ( = ?AUTO_5700 ?AUTO_5706 ) ) ( not ( = ?AUTO_5701 ?AUTO_5706 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5704 ?AUTO_5706 ?AUTO_5705 ?AUTO_5703 )
      ( DELIVER-PKG ?AUTO_5699 ?AUTO_5700 )
      ( DELIVER-PKG-VERIFY ?AUTO_5699 ?AUTO_5700 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5719 - OBJ
      ?AUTO_5720 - LOCATION
    )
    :vars
    (
      ?AUTO_5722 - LOCATION
      ?AUTO_5724 - CITY
      ?AUTO_5723 - LOCATION
      ?AUTO_5725 - AIRPLANE
      ?AUTO_5721 - TRUCK
      ?AUTO_5726 - LOCATION
      ?AUTO_5727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5722 ?AUTO_5724 ) ( IN-CITY ?AUTO_5720 ?AUTO_5724 ) ( not ( = ?AUTO_5720 ?AUTO_5722 ) ) ( AIRPORT ?AUTO_5723 ) ( AIRPORT ?AUTO_5722 ) ( not ( = ?AUTO_5723 ?AUTO_5722 ) ) ( not ( = ?AUTO_5720 ?AUTO_5723 ) ) ( AIRPLANE-AT ?AUTO_5725 ?AUTO_5722 ) ( TRUCK-AT ?AUTO_5721 ?AUTO_5726 ) ( IN-CITY ?AUTO_5726 ?AUTO_5724 ) ( not ( = ?AUTO_5722 ?AUTO_5726 ) ) ( not ( = ?AUTO_5720 ?AUTO_5726 ) ) ( not ( = ?AUTO_5723 ?AUTO_5726 ) ) ( TRUCK-AT ?AUTO_5727 ?AUTO_5723 ) ( IN-TRUCK ?AUTO_5719 ?AUTO_5727 ) ( not ( = ?AUTO_5721 ?AUTO_5727 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5719 ?AUTO_5727 ?AUTO_5723 )
      ( DELIVER-PKG ?AUTO_5719 ?AUTO_5720 )
      ( DELIVER-PKG-VERIFY ?AUTO_5719 ?AUTO_5720 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5728 - OBJ
      ?AUTO_5729 - LOCATION
    )
    :vars
    (
      ?AUTO_5731 - LOCATION
      ?AUTO_5735 - CITY
      ?AUTO_5736 - LOCATION
      ?AUTO_5734 - AIRPLANE
      ?AUTO_5732 - TRUCK
      ?AUTO_5730 - LOCATION
      ?AUTO_5733 - TRUCK
      ?AUTO_5737 - LOCATION
      ?AUTO_5738 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5731 ?AUTO_5735 ) ( IN-CITY ?AUTO_5729 ?AUTO_5735 ) ( not ( = ?AUTO_5729 ?AUTO_5731 ) ) ( AIRPORT ?AUTO_5736 ) ( AIRPORT ?AUTO_5731 ) ( not ( = ?AUTO_5736 ?AUTO_5731 ) ) ( not ( = ?AUTO_5729 ?AUTO_5736 ) ) ( AIRPLANE-AT ?AUTO_5734 ?AUTO_5731 ) ( TRUCK-AT ?AUTO_5732 ?AUTO_5730 ) ( IN-CITY ?AUTO_5730 ?AUTO_5735 ) ( not ( = ?AUTO_5731 ?AUTO_5730 ) ) ( not ( = ?AUTO_5729 ?AUTO_5730 ) ) ( not ( = ?AUTO_5736 ?AUTO_5730 ) ) ( IN-TRUCK ?AUTO_5728 ?AUTO_5733 ) ( not ( = ?AUTO_5732 ?AUTO_5733 ) ) ( TRUCK-AT ?AUTO_5733 ?AUTO_5737 ) ( IN-CITY ?AUTO_5737 ?AUTO_5738 ) ( IN-CITY ?AUTO_5736 ?AUTO_5738 ) ( not ( = ?AUTO_5736 ?AUTO_5737 ) ) ( not ( = ?AUTO_5729 ?AUTO_5737 ) ) ( not ( = ?AUTO_5731 ?AUTO_5737 ) ) ( not ( = ?AUTO_5735 ?AUTO_5738 ) ) ( not ( = ?AUTO_5730 ?AUTO_5737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5733 ?AUTO_5737 ?AUTO_5736 ?AUTO_5738 )
      ( DELIVER-PKG ?AUTO_5728 ?AUTO_5729 )
      ( DELIVER-PKG-VERIFY ?AUTO_5728 ?AUTO_5729 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5743 - OBJ
      ?AUTO_5744 - LOCATION
    )
    :vars
    (
      ?AUTO_5747 - LOCATION
      ?AUTO_5746 - CITY
      ?AUTO_5745 - LOCATION
      ?AUTO_5750 - AIRPLANE
      ?AUTO_5751 - TRUCK
      ?AUTO_5748 - LOCATION
      ?AUTO_5753 - TRUCK
      ?AUTO_5749 - LOCATION
      ?AUTO_5752 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5747 ?AUTO_5746 ) ( IN-CITY ?AUTO_5744 ?AUTO_5746 ) ( not ( = ?AUTO_5744 ?AUTO_5747 ) ) ( AIRPORT ?AUTO_5745 ) ( AIRPORT ?AUTO_5747 ) ( not ( = ?AUTO_5745 ?AUTO_5747 ) ) ( not ( = ?AUTO_5744 ?AUTO_5745 ) ) ( AIRPLANE-AT ?AUTO_5750 ?AUTO_5747 ) ( TRUCK-AT ?AUTO_5751 ?AUTO_5748 ) ( IN-CITY ?AUTO_5748 ?AUTO_5746 ) ( not ( = ?AUTO_5747 ?AUTO_5748 ) ) ( not ( = ?AUTO_5744 ?AUTO_5748 ) ) ( not ( = ?AUTO_5745 ?AUTO_5748 ) ) ( not ( = ?AUTO_5751 ?AUTO_5753 ) ) ( TRUCK-AT ?AUTO_5753 ?AUTO_5749 ) ( IN-CITY ?AUTO_5749 ?AUTO_5752 ) ( IN-CITY ?AUTO_5745 ?AUTO_5752 ) ( not ( = ?AUTO_5745 ?AUTO_5749 ) ) ( not ( = ?AUTO_5744 ?AUTO_5749 ) ) ( not ( = ?AUTO_5747 ?AUTO_5749 ) ) ( not ( = ?AUTO_5746 ?AUTO_5752 ) ) ( not ( = ?AUTO_5748 ?AUTO_5749 ) ) ( OBJ-AT ?AUTO_5743 ?AUTO_5749 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5743 ?AUTO_5753 ?AUTO_5749 )
      ( DELIVER-PKG ?AUTO_5743 ?AUTO_5744 )
      ( DELIVER-PKG-VERIFY ?AUTO_5743 ?AUTO_5744 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5754 - OBJ
      ?AUTO_5755 - LOCATION
    )
    :vars
    (
      ?AUTO_5762 - LOCATION
      ?AUTO_5760 - CITY
      ?AUTO_5761 - LOCATION
      ?AUTO_5763 - AIRPLANE
      ?AUTO_5759 - TRUCK
      ?AUTO_5764 - LOCATION
      ?AUTO_5758 - TRUCK
      ?AUTO_5756 - LOCATION
      ?AUTO_5757 - CITY
      ?AUTO_5765 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5762 ?AUTO_5760 ) ( IN-CITY ?AUTO_5755 ?AUTO_5760 ) ( not ( = ?AUTO_5755 ?AUTO_5762 ) ) ( AIRPORT ?AUTO_5761 ) ( AIRPORT ?AUTO_5762 ) ( not ( = ?AUTO_5761 ?AUTO_5762 ) ) ( not ( = ?AUTO_5755 ?AUTO_5761 ) ) ( AIRPLANE-AT ?AUTO_5763 ?AUTO_5762 ) ( TRUCK-AT ?AUTO_5759 ?AUTO_5764 ) ( IN-CITY ?AUTO_5764 ?AUTO_5760 ) ( not ( = ?AUTO_5762 ?AUTO_5764 ) ) ( not ( = ?AUTO_5755 ?AUTO_5764 ) ) ( not ( = ?AUTO_5761 ?AUTO_5764 ) ) ( not ( = ?AUTO_5759 ?AUTO_5758 ) ) ( IN-CITY ?AUTO_5756 ?AUTO_5757 ) ( IN-CITY ?AUTO_5761 ?AUTO_5757 ) ( not ( = ?AUTO_5761 ?AUTO_5756 ) ) ( not ( = ?AUTO_5755 ?AUTO_5756 ) ) ( not ( = ?AUTO_5762 ?AUTO_5756 ) ) ( not ( = ?AUTO_5760 ?AUTO_5757 ) ) ( not ( = ?AUTO_5764 ?AUTO_5756 ) ) ( OBJ-AT ?AUTO_5754 ?AUTO_5756 ) ( TRUCK-AT ?AUTO_5758 ?AUTO_5765 ) ( IN-CITY ?AUTO_5765 ?AUTO_5757 ) ( not ( = ?AUTO_5756 ?AUTO_5765 ) ) ( not ( = ?AUTO_5755 ?AUTO_5765 ) ) ( not ( = ?AUTO_5762 ?AUTO_5765 ) ) ( not ( = ?AUTO_5761 ?AUTO_5765 ) ) ( not ( = ?AUTO_5764 ?AUTO_5765 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5758 ?AUTO_5765 ?AUTO_5756 ?AUTO_5757 )
      ( DELIVER-PKG ?AUTO_5754 ?AUTO_5755 )
      ( DELIVER-PKG-VERIFY ?AUTO_5754 ?AUTO_5755 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5768 - OBJ
      ?AUTO_5769 - LOCATION
    )
    :vars
    (
      ?AUTO_5770 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5770 ?AUTO_5769 ) ( IN-TRUCK ?AUTO_5768 ?AUTO_5770 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5768 ?AUTO_5770 ?AUTO_5769 )
      ( DELIVER-PKG-VERIFY ?AUTO_5768 ?AUTO_5769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5809 - OBJ
      ?AUTO_5810 - LOCATION
    )
    :vars
    (
      ?AUTO_5814 - LOCATION
      ?AUTO_5812 - CITY
      ?AUTO_5811 - LOCATION
      ?AUTO_5813 - AIRPLANE
      ?AUTO_5815 - TRUCK
      ?AUTO_5816 - LOCATION
      ?AUTO_5817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5814 ?AUTO_5812 ) ( IN-CITY ?AUTO_5810 ?AUTO_5812 ) ( not ( = ?AUTO_5810 ?AUTO_5814 ) ) ( AIRPORT ?AUTO_5811 ) ( AIRPORT ?AUTO_5814 ) ( not ( = ?AUTO_5811 ?AUTO_5814 ) ) ( not ( = ?AUTO_5810 ?AUTO_5811 ) ) ( AIRPLANE-AT ?AUTO_5813 ?AUTO_5814 ) ( TRUCK-AT ?AUTO_5815 ?AUTO_5816 ) ( IN-CITY ?AUTO_5816 ?AUTO_5812 ) ( not ( = ?AUTO_5814 ?AUTO_5816 ) ) ( not ( = ?AUTO_5810 ?AUTO_5816 ) ) ( not ( = ?AUTO_5811 ?AUTO_5816 ) ) ( TRUCK-AT ?AUTO_5817 ?AUTO_5811 ) ( IN-TRUCK ?AUTO_5809 ?AUTO_5817 ) ( not ( = ?AUTO_5815 ?AUTO_5817 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5809 ?AUTO_5817 ?AUTO_5811 )
      ( DELIVER-PKG ?AUTO_5809 ?AUTO_5810 )
      ( DELIVER-PKG-VERIFY ?AUTO_5809 ?AUTO_5810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5818 - OBJ
      ?AUTO_5819 - LOCATION
    )
    :vars
    (
      ?AUTO_5823 - LOCATION
      ?AUTO_5825 - CITY
      ?AUTO_5820 - LOCATION
      ?AUTO_5824 - AIRPLANE
      ?AUTO_5822 - TRUCK
      ?AUTO_5821 - LOCATION
      ?AUTO_5826 - TRUCK
      ?AUTO_5827 - LOCATION
      ?AUTO_5828 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5823 ?AUTO_5825 ) ( IN-CITY ?AUTO_5819 ?AUTO_5825 ) ( not ( = ?AUTO_5819 ?AUTO_5823 ) ) ( AIRPORT ?AUTO_5820 ) ( AIRPORT ?AUTO_5823 ) ( not ( = ?AUTO_5820 ?AUTO_5823 ) ) ( not ( = ?AUTO_5819 ?AUTO_5820 ) ) ( AIRPLANE-AT ?AUTO_5824 ?AUTO_5823 ) ( TRUCK-AT ?AUTO_5822 ?AUTO_5821 ) ( IN-CITY ?AUTO_5821 ?AUTO_5825 ) ( not ( = ?AUTO_5823 ?AUTO_5821 ) ) ( not ( = ?AUTO_5819 ?AUTO_5821 ) ) ( not ( = ?AUTO_5820 ?AUTO_5821 ) ) ( IN-TRUCK ?AUTO_5818 ?AUTO_5826 ) ( not ( = ?AUTO_5822 ?AUTO_5826 ) ) ( TRUCK-AT ?AUTO_5826 ?AUTO_5827 ) ( IN-CITY ?AUTO_5827 ?AUTO_5828 ) ( IN-CITY ?AUTO_5820 ?AUTO_5828 ) ( not ( = ?AUTO_5820 ?AUTO_5827 ) ) ( not ( = ?AUTO_5819 ?AUTO_5827 ) ) ( not ( = ?AUTO_5823 ?AUTO_5827 ) ) ( not ( = ?AUTO_5825 ?AUTO_5828 ) ) ( not ( = ?AUTO_5821 ?AUTO_5827 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5826 ?AUTO_5827 ?AUTO_5820 ?AUTO_5828 )
      ( DELIVER-PKG ?AUTO_5818 ?AUTO_5819 )
      ( DELIVER-PKG-VERIFY ?AUTO_5818 ?AUTO_5819 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5829 - OBJ
      ?AUTO_5830 - LOCATION
    )
    :vars
    (
      ?AUTO_5839 - LOCATION
      ?AUTO_5836 - CITY
      ?AUTO_5834 - LOCATION
      ?AUTO_5835 - AIRPLANE
      ?AUTO_5831 - TRUCK
      ?AUTO_5833 - LOCATION
      ?AUTO_5832 - TRUCK
      ?AUTO_5837 - LOCATION
      ?AUTO_5838 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5839 ?AUTO_5836 ) ( IN-CITY ?AUTO_5830 ?AUTO_5836 ) ( not ( = ?AUTO_5830 ?AUTO_5839 ) ) ( AIRPORT ?AUTO_5834 ) ( AIRPORT ?AUTO_5839 ) ( not ( = ?AUTO_5834 ?AUTO_5839 ) ) ( not ( = ?AUTO_5830 ?AUTO_5834 ) ) ( AIRPLANE-AT ?AUTO_5835 ?AUTO_5839 ) ( TRUCK-AT ?AUTO_5831 ?AUTO_5833 ) ( IN-CITY ?AUTO_5833 ?AUTO_5836 ) ( not ( = ?AUTO_5839 ?AUTO_5833 ) ) ( not ( = ?AUTO_5830 ?AUTO_5833 ) ) ( not ( = ?AUTO_5834 ?AUTO_5833 ) ) ( not ( = ?AUTO_5831 ?AUTO_5832 ) ) ( TRUCK-AT ?AUTO_5832 ?AUTO_5837 ) ( IN-CITY ?AUTO_5837 ?AUTO_5838 ) ( IN-CITY ?AUTO_5834 ?AUTO_5838 ) ( not ( = ?AUTO_5834 ?AUTO_5837 ) ) ( not ( = ?AUTO_5830 ?AUTO_5837 ) ) ( not ( = ?AUTO_5839 ?AUTO_5837 ) ) ( not ( = ?AUTO_5836 ?AUTO_5838 ) ) ( not ( = ?AUTO_5833 ?AUTO_5837 ) ) ( OBJ-AT ?AUTO_5829 ?AUTO_5837 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5829 ?AUTO_5832 ?AUTO_5837 )
      ( DELIVER-PKG ?AUTO_5829 ?AUTO_5830 )
      ( DELIVER-PKG-VERIFY ?AUTO_5829 ?AUTO_5830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5840 - OBJ
      ?AUTO_5841 - LOCATION
    )
    :vars
    (
      ?AUTO_5850 - LOCATION
      ?AUTO_5846 - CITY
      ?AUTO_5849 - LOCATION
      ?AUTO_5844 - AIRPLANE
      ?AUTO_5843 - TRUCK
      ?AUTO_5848 - LOCATION
      ?AUTO_5842 - TRUCK
      ?AUTO_5847 - LOCATION
      ?AUTO_5845 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5850 ?AUTO_5846 ) ( IN-CITY ?AUTO_5841 ?AUTO_5846 ) ( not ( = ?AUTO_5841 ?AUTO_5850 ) ) ( AIRPORT ?AUTO_5849 ) ( AIRPORT ?AUTO_5850 ) ( not ( = ?AUTO_5849 ?AUTO_5850 ) ) ( not ( = ?AUTO_5841 ?AUTO_5849 ) ) ( AIRPLANE-AT ?AUTO_5844 ?AUTO_5850 ) ( TRUCK-AT ?AUTO_5843 ?AUTO_5848 ) ( IN-CITY ?AUTO_5848 ?AUTO_5846 ) ( not ( = ?AUTO_5850 ?AUTO_5848 ) ) ( not ( = ?AUTO_5841 ?AUTO_5848 ) ) ( not ( = ?AUTO_5849 ?AUTO_5848 ) ) ( not ( = ?AUTO_5843 ?AUTO_5842 ) ) ( IN-CITY ?AUTO_5847 ?AUTO_5845 ) ( IN-CITY ?AUTO_5849 ?AUTO_5845 ) ( not ( = ?AUTO_5849 ?AUTO_5847 ) ) ( not ( = ?AUTO_5841 ?AUTO_5847 ) ) ( not ( = ?AUTO_5850 ?AUTO_5847 ) ) ( not ( = ?AUTO_5846 ?AUTO_5845 ) ) ( not ( = ?AUTO_5848 ?AUTO_5847 ) ) ( OBJ-AT ?AUTO_5840 ?AUTO_5847 ) ( TRUCK-AT ?AUTO_5842 ?AUTO_5849 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5842 ?AUTO_5849 ?AUTO_5847 ?AUTO_5845 )
      ( DELIVER-PKG ?AUTO_5840 ?AUTO_5841 )
      ( DELIVER-PKG-VERIFY ?AUTO_5840 ?AUTO_5841 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5869 - OBJ
      ?AUTO_5870 - LOCATION
    )
    :vars
    (
      ?AUTO_5871 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5871 ?AUTO_5870 ) ( IN-TRUCK ?AUTO_5869 ?AUTO_5871 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5869 ?AUTO_5871 ?AUTO_5870 )
      ( DELIVER-PKG-VERIFY ?AUTO_5869 ?AUTO_5870 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5872 - OBJ
      ?AUTO_5873 - LOCATION
    )
    :vars
    (
      ?AUTO_5874 - TRUCK
      ?AUTO_5875 - LOCATION
      ?AUTO_5876 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5872 ?AUTO_5874 ) ( TRUCK-AT ?AUTO_5874 ?AUTO_5875 ) ( IN-CITY ?AUTO_5875 ?AUTO_5876 ) ( IN-CITY ?AUTO_5873 ?AUTO_5876 ) ( not ( = ?AUTO_5873 ?AUTO_5875 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5874 ?AUTO_5875 ?AUTO_5873 ?AUTO_5876 )
      ( DELIVER-PKG ?AUTO_5872 ?AUTO_5873 )
      ( DELIVER-PKG-VERIFY ?AUTO_5872 ?AUTO_5873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5883 - OBJ
      ?AUTO_5884 - LOCATION
    )
    :vars
    (
      ?AUTO_5886 - TRUCK
      ?AUTO_5887 - LOCATION
      ?AUTO_5885 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5886 ?AUTO_5887 ) ( IN-CITY ?AUTO_5887 ?AUTO_5885 ) ( IN-CITY ?AUTO_5884 ?AUTO_5885 ) ( not ( = ?AUTO_5884 ?AUTO_5887 ) ) ( OBJ-AT ?AUTO_5883 ?AUTO_5887 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5883 ?AUTO_5886 ?AUTO_5887 )
      ( DELIVER-PKG ?AUTO_5883 ?AUTO_5884 )
      ( DELIVER-PKG-VERIFY ?AUTO_5883 ?AUTO_5884 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5890 - OBJ
      ?AUTO_5891 - LOCATION
    )
    :vars
    (
      ?AUTO_5893 - TRUCK
      ?AUTO_5892 - LOCATION
      ?AUTO_5894 - CITY
      ?AUTO_5895 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5893 ?AUTO_5892 ) ( IN-CITY ?AUTO_5892 ?AUTO_5894 ) ( IN-CITY ?AUTO_5891 ?AUTO_5894 ) ( not ( = ?AUTO_5891 ?AUTO_5892 ) ) ( IN-AIRPLANE ?AUTO_5890 ?AUTO_5895 ) ( AIRPLANE-AT ?AUTO_5895 ?AUTO_5892 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5890 ?AUTO_5895 ?AUTO_5892 )
      ( DELIVER-PKG ?AUTO_5890 ?AUTO_5891 )
      ( DELIVER-PKG-VERIFY ?AUTO_5890 ?AUTO_5891 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5900 - OBJ
      ?AUTO_5901 - LOCATION
    )
    :vars
    (
      ?AUTO_5906 - TRUCK
      ?AUTO_5904 - LOCATION
      ?AUTO_5905 - CITY
      ?AUTO_5902 - LOCATION
      ?AUTO_5903 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5906 ?AUTO_5904 ) ( IN-CITY ?AUTO_5904 ?AUTO_5905 ) ( IN-CITY ?AUTO_5901 ?AUTO_5905 ) ( not ( = ?AUTO_5901 ?AUTO_5904 ) ) ( AIRPORT ?AUTO_5902 ) ( AIRPORT ?AUTO_5904 ) ( AIRPLANE-AT ?AUTO_5903 ?AUTO_5902 ) ( not ( = ?AUTO_5902 ?AUTO_5904 ) ) ( not ( = ?AUTO_5901 ?AUTO_5902 ) ) ( OBJ-AT ?AUTO_5900 ?AUTO_5902 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5900 ?AUTO_5903 ?AUTO_5902 )
      ( DELIVER-PKG ?AUTO_5900 ?AUTO_5901 )
      ( DELIVER-PKG-VERIFY ?AUTO_5900 ?AUTO_5901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5927 - OBJ
      ?AUTO_5928 - LOCATION
    )
    :vars
    (
      ?AUTO_5931 - LOCATION
      ?AUTO_5929 - CITY
      ?AUTO_5933 - LOCATION
      ?AUTO_5930 - AIRPLANE
      ?AUTO_5932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5931 ?AUTO_5929 ) ( IN-CITY ?AUTO_5928 ?AUTO_5929 ) ( not ( = ?AUTO_5928 ?AUTO_5931 ) ) ( AIRPORT ?AUTO_5933 ) ( AIRPORT ?AUTO_5931 ) ( not ( = ?AUTO_5933 ?AUTO_5931 ) ) ( not ( = ?AUTO_5928 ?AUTO_5933 ) ) ( OBJ-AT ?AUTO_5927 ?AUTO_5933 ) ( AIRPLANE-AT ?AUTO_5930 ?AUTO_5931 ) ( TRUCK-AT ?AUTO_5932 ?AUTO_5928 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5932 ?AUTO_5928 ?AUTO_5931 ?AUTO_5929 )
      ( DELIVER-PKG ?AUTO_5927 ?AUTO_5928 )
      ( DELIVER-PKG-VERIFY ?AUTO_5927 ?AUTO_5928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5944 - OBJ
      ?AUTO_5945 - LOCATION
    )
    :vars
    (
      ?AUTO_5949 - LOCATION
      ?AUTO_5948 - CITY
      ?AUTO_5947 - LOCATION
      ?AUTO_5950 - AIRPLANE
      ?AUTO_5946 - TRUCK
      ?AUTO_5951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5949 ?AUTO_5948 ) ( IN-CITY ?AUTO_5945 ?AUTO_5948 ) ( not ( = ?AUTO_5945 ?AUTO_5949 ) ) ( AIRPORT ?AUTO_5947 ) ( AIRPORT ?AUTO_5949 ) ( not ( = ?AUTO_5947 ?AUTO_5949 ) ) ( not ( = ?AUTO_5945 ?AUTO_5947 ) ) ( AIRPLANE-AT ?AUTO_5950 ?AUTO_5949 ) ( TRUCK-AT ?AUTO_5946 ?AUTO_5945 ) ( TRUCK-AT ?AUTO_5951 ?AUTO_5947 ) ( IN-TRUCK ?AUTO_5944 ?AUTO_5951 ) ( not ( = ?AUTO_5946 ?AUTO_5951 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5944 ?AUTO_5951 ?AUTO_5947 )
      ( DELIVER-PKG ?AUTO_5944 ?AUTO_5945 )
      ( DELIVER-PKG-VERIFY ?AUTO_5944 ?AUTO_5945 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5954 - OBJ
      ?AUTO_5955 - LOCATION
    )
    :vars
    (
      ?AUTO_5960 - LOCATION
      ?AUTO_5961 - CITY
      ?AUTO_5956 - LOCATION
      ?AUTO_5959 - AIRPLANE
      ?AUTO_5957 - TRUCK
      ?AUTO_5958 - TRUCK
      ?AUTO_5962 - LOCATION
      ?AUTO_5963 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5960 ?AUTO_5961 ) ( IN-CITY ?AUTO_5955 ?AUTO_5961 ) ( not ( = ?AUTO_5955 ?AUTO_5960 ) ) ( AIRPORT ?AUTO_5956 ) ( AIRPORT ?AUTO_5960 ) ( not ( = ?AUTO_5956 ?AUTO_5960 ) ) ( not ( = ?AUTO_5955 ?AUTO_5956 ) ) ( AIRPLANE-AT ?AUTO_5959 ?AUTO_5960 ) ( TRUCK-AT ?AUTO_5957 ?AUTO_5955 ) ( IN-TRUCK ?AUTO_5954 ?AUTO_5958 ) ( not ( = ?AUTO_5957 ?AUTO_5958 ) ) ( TRUCK-AT ?AUTO_5958 ?AUTO_5962 ) ( IN-CITY ?AUTO_5962 ?AUTO_5963 ) ( IN-CITY ?AUTO_5956 ?AUTO_5963 ) ( not ( = ?AUTO_5956 ?AUTO_5962 ) ) ( not ( = ?AUTO_5955 ?AUTO_5962 ) ) ( not ( = ?AUTO_5960 ?AUTO_5962 ) ) ( not ( = ?AUTO_5961 ?AUTO_5963 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5958 ?AUTO_5962 ?AUTO_5956 ?AUTO_5963 )
      ( DELIVER-PKG ?AUTO_5954 ?AUTO_5955 )
      ( DELIVER-PKG-VERIFY ?AUTO_5954 ?AUTO_5955 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5964 - OBJ
      ?AUTO_5965 - LOCATION
    )
    :vars
    (
      ?AUTO_5972 - LOCATION
      ?AUTO_5971 - CITY
      ?AUTO_5968 - LOCATION
      ?AUTO_5970 - AIRPLANE
      ?AUTO_5967 - TRUCK
      ?AUTO_5969 - TRUCK
      ?AUTO_5966 - LOCATION
      ?AUTO_5973 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5972 ?AUTO_5971 ) ( IN-CITY ?AUTO_5965 ?AUTO_5971 ) ( not ( = ?AUTO_5965 ?AUTO_5972 ) ) ( AIRPORT ?AUTO_5968 ) ( AIRPORT ?AUTO_5972 ) ( not ( = ?AUTO_5968 ?AUTO_5972 ) ) ( not ( = ?AUTO_5965 ?AUTO_5968 ) ) ( AIRPLANE-AT ?AUTO_5970 ?AUTO_5972 ) ( TRUCK-AT ?AUTO_5967 ?AUTO_5965 ) ( not ( = ?AUTO_5967 ?AUTO_5969 ) ) ( TRUCK-AT ?AUTO_5969 ?AUTO_5966 ) ( IN-CITY ?AUTO_5966 ?AUTO_5973 ) ( IN-CITY ?AUTO_5968 ?AUTO_5973 ) ( not ( = ?AUTO_5968 ?AUTO_5966 ) ) ( not ( = ?AUTO_5965 ?AUTO_5966 ) ) ( not ( = ?AUTO_5972 ?AUTO_5966 ) ) ( not ( = ?AUTO_5971 ?AUTO_5973 ) ) ( OBJ-AT ?AUTO_5964 ?AUTO_5966 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5964 ?AUTO_5969 ?AUTO_5966 )
      ( DELIVER-PKG ?AUTO_5964 ?AUTO_5965 )
      ( DELIVER-PKG-VERIFY ?AUTO_5964 ?AUTO_5965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5974 - OBJ
      ?AUTO_5975 - LOCATION
    )
    :vars
    (
      ?AUTO_5977 - LOCATION
      ?AUTO_5979 - CITY
      ?AUTO_5980 - LOCATION
      ?AUTO_5981 - AIRPLANE
      ?AUTO_5978 - TRUCK
      ?AUTO_5976 - TRUCK
      ?AUTO_5983 - LOCATION
      ?AUTO_5982 - CITY
      ?AUTO_5984 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5977 ?AUTO_5979 ) ( IN-CITY ?AUTO_5975 ?AUTO_5979 ) ( not ( = ?AUTO_5975 ?AUTO_5977 ) ) ( AIRPORT ?AUTO_5980 ) ( AIRPORT ?AUTO_5977 ) ( not ( = ?AUTO_5980 ?AUTO_5977 ) ) ( not ( = ?AUTO_5975 ?AUTO_5980 ) ) ( AIRPLANE-AT ?AUTO_5981 ?AUTO_5977 ) ( TRUCK-AT ?AUTO_5978 ?AUTO_5975 ) ( not ( = ?AUTO_5978 ?AUTO_5976 ) ) ( IN-CITY ?AUTO_5983 ?AUTO_5982 ) ( IN-CITY ?AUTO_5980 ?AUTO_5982 ) ( not ( = ?AUTO_5980 ?AUTO_5983 ) ) ( not ( = ?AUTO_5975 ?AUTO_5983 ) ) ( not ( = ?AUTO_5977 ?AUTO_5983 ) ) ( not ( = ?AUTO_5979 ?AUTO_5982 ) ) ( OBJ-AT ?AUTO_5974 ?AUTO_5983 ) ( TRUCK-AT ?AUTO_5976 ?AUTO_5984 ) ( IN-CITY ?AUTO_5984 ?AUTO_5982 ) ( not ( = ?AUTO_5983 ?AUTO_5984 ) ) ( not ( = ?AUTO_5975 ?AUTO_5984 ) ) ( not ( = ?AUTO_5977 ?AUTO_5984 ) ) ( not ( = ?AUTO_5980 ?AUTO_5984 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5976 ?AUTO_5984 ?AUTO_5983 ?AUTO_5982 )
      ( DELIVER-PKG ?AUTO_5974 ?AUTO_5975 )
      ( DELIVER-PKG-VERIFY ?AUTO_5974 ?AUTO_5975 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5987 - OBJ
      ?AUTO_5988 - LOCATION
    )
    :vars
    (
      ?AUTO_5989 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5989 ?AUTO_5988 ) ( IN-TRUCK ?AUTO_5987 ?AUTO_5989 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5987 ?AUTO_5989 ?AUTO_5988 )
      ( DELIVER-PKG-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5998 - OBJ
      ?AUTO_5999 - LOCATION
    )
    :vars
    (
      ?AUTO_6000 - TRUCK
      ?AUTO_6001 - LOCATION
      ?AUTO_6002 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5998 ?AUTO_6000 ) ( TRUCK-AT ?AUTO_6000 ?AUTO_6001 ) ( IN-CITY ?AUTO_6001 ?AUTO_6002 ) ( IN-CITY ?AUTO_5999 ?AUTO_6002 ) ( not ( = ?AUTO_5999 ?AUTO_6001 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6000 ?AUTO_6001 ?AUTO_5999 ?AUTO_6002 )
      ( DELIVER-PKG ?AUTO_5998 ?AUTO_5999 )
      ( DELIVER-PKG-VERIFY ?AUTO_5998 ?AUTO_5999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6003 - OBJ
      ?AUTO_6004 - LOCATION
    )
    :vars
    (
      ?AUTO_6005 - TRUCK
      ?AUTO_6006 - LOCATION
      ?AUTO_6007 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6005 ?AUTO_6006 ) ( IN-CITY ?AUTO_6006 ?AUTO_6007 ) ( IN-CITY ?AUTO_6004 ?AUTO_6007 ) ( not ( = ?AUTO_6004 ?AUTO_6006 ) ) ( OBJ-AT ?AUTO_6003 ?AUTO_6006 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6003 ?AUTO_6005 ?AUTO_6006 )
      ( DELIVER-PKG ?AUTO_6003 ?AUTO_6004 )
      ( DELIVER-PKG-VERIFY ?AUTO_6003 ?AUTO_6004 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6012 - OBJ
      ?AUTO_6013 - LOCATION
    )
    :vars
    (
      ?AUTO_6014 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6014 ?AUTO_6013 ) ( IN-TRUCK ?AUTO_6012 ?AUTO_6014 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6012 ?AUTO_6014 ?AUTO_6013 )
      ( DELIVER-PKG-VERIFY ?AUTO_6012 ?AUTO_6013 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6021 - OBJ
      ?AUTO_6022 - LOCATION
    )
    :vars
    (
      ?AUTO_6023 - TRUCK
      ?AUTO_6024 - LOCATION
      ?AUTO_6025 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6021 ?AUTO_6023 ) ( TRUCK-AT ?AUTO_6023 ?AUTO_6024 ) ( IN-CITY ?AUTO_6024 ?AUTO_6025 ) ( IN-CITY ?AUTO_6022 ?AUTO_6025 ) ( not ( = ?AUTO_6022 ?AUTO_6024 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6023 ?AUTO_6024 ?AUTO_6022 ?AUTO_6025 )
      ( DELIVER-PKG ?AUTO_6021 ?AUTO_6022 )
      ( DELIVER-PKG-VERIFY ?AUTO_6021 ?AUTO_6022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6026 - OBJ
      ?AUTO_6027 - LOCATION
    )
    :vars
    (
      ?AUTO_6028 - TRUCK
      ?AUTO_6029 - LOCATION
      ?AUTO_6030 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6028 ?AUTO_6029 ) ( IN-CITY ?AUTO_6029 ?AUTO_6030 ) ( IN-CITY ?AUTO_6027 ?AUTO_6030 ) ( not ( = ?AUTO_6027 ?AUTO_6029 ) ) ( OBJ-AT ?AUTO_6026 ?AUTO_6029 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6026 ?AUTO_6028 ?AUTO_6029 )
      ( DELIVER-PKG ?AUTO_6026 ?AUTO_6027 )
      ( DELIVER-PKG-VERIFY ?AUTO_6026 ?AUTO_6027 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6039 - OBJ
      ?AUTO_6040 - LOCATION
    )
    :vars
    (
      ?AUTO_6041 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6041 ?AUTO_6040 ) ( IN-TRUCK ?AUTO_6039 ?AUTO_6041 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6039 ?AUTO_6041 ?AUTO_6040 )
      ( DELIVER-PKG-VERIFY ?AUTO_6039 ?AUTO_6040 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6046 - OBJ
      ?AUTO_6047 - LOCATION
    )
    :vars
    (
      ?AUTO_6048 - TRUCK
      ?AUTO_6049 - LOCATION
      ?AUTO_6050 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6046 ?AUTO_6048 ) ( TRUCK-AT ?AUTO_6048 ?AUTO_6049 ) ( IN-CITY ?AUTO_6049 ?AUTO_6050 ) ( IN-CITY ?AUTO_6047 ?AUTO_6050 ) ( not ( = ?AUTO_6047 ?AUTO_6049 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6048 ?AUTO_6049 ?AUTO_6047 ?AUTO_6050 )
      ( DELIVER-PKG ?AUTO_6046 ?AUTO_6047 )
      ( DELIVER-PKG-VERIFY ?AUTO_6046 ?AUTO_6047 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6051 - OBJ
      ?AUTO_6052 - LOCATION
    )
    :vars
    (
      ?AUTO_6053 - TRUCK
      ?AUTO_6054 - LOCATION
      ?AUTO_6055 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6053 ?AUTO_6054 ) ( IN-CITY ?AUTO_6054 ?AUTO_6055 ) ( IN-CITY ?AUTO_6052 ?AUTO_6055 ) ( not ( = ?AUTO_6052 ?AUTO_6054 ) ) ( OBJ-AT ?AUTO_6051 ?AUTO_6054 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6051 ?AUTO_6053 ?AUTO_6054 )
      ( DELIVER-PKG ?AUTO_6051 ?AUTO_6052 )
      ( DELIVER-PKG-VERIFY ?AUTO_6051 ?AUTO_6052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6064 - OBJ
      ?AUTO_6065 - LOCATION
    )
    :vars
    (
      ?AUTO_6066 - LOCATION
      ?AUTO_6068 - CITY
      ?AUTO_6067 - TRUCK
      ?AUTO_6069 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6066 ?AUTO_6068 ) ( IN-CITY ?AUTO_6065 ?AUTO_6068 ) ( not ( = ?AUTO_6065 ?AUTO_6066 ) ) ( OBJ-AT ?AUTO_6064 ?AUTO_6066 ) ( TRUCK-AT ?AUTO_6067 ?AUTO_6069 ) ( IN-CITY ?AUTO_6069 ?AUTO_6068 ) ( not ( = ?AUTO_6066 ?AUTO_6069 ) ) ( not ( = ?AUTO_6065 ?AUTO_6069 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6067 ?AUTO_6069 ?AUTO_6066 ?AUTO_6068 )
      ( DELIVER-PKG ?AUTO_6064 ?AUTO_6065 )
      ( DELIVER-PKG-VERIFY ?AUTO_6064 ?AUTO_6065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6072 - OBJ
      ?AUTO_6073 - LOCATION
    )
    :vars
    (
      ?AUTO_6074 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6074 ?AUTO_6073 ) ( IN-TRUCK ?AUTO_6072 ?AUTO_6074 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6072 ?AUTO_6074 ?AUTO_6073 )
      ( DELIVER-PKG-VERIFY ?AUTO_6072 ?AUTO_6073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6075 - OBJ
      ?AUTO_6076 - LOCATION
    )
    :vars
    (
      ?AUTO_6077 - TRUCK
      ?AUTO_6078 - LOCATION
      ?AUTO_6079 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6075 ?AUTO_6077 ) ( TRUCK-AT ?AUTO_6077 ?AUTO_6078 ) ( IN-CITY ?AUTO_6078 ?AUTO_6079 ) ( IN-CITY ?AUTO_6076 ?AUTO_6079 ) ( not ( = ?AUTO_6076 ?AUTO_6078 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6077 ?AUTO_6078 ?AUTO_6076 ?AUTO_6079 )
      ( DELIVER-PKG ?AUTO_6075 ?AUTO_6076 )
      ( DELIVER-PKG-VERIFY ?AUTO_6075 ?AUTO_6076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6084 - OBJ
      ?AUTO_6085 - LOCATION
    )
    :vars
    (
      ?AUTO_6088 - TRUCK
      ?AUTO_6086 - LOCATION
      ?AUTO_6087 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6088 ?AUTO_6086 ) ( IN-CITY ?AUTO_6086 ?AUTO_6087 ) ( IN-CITY ?AUTO_6085 ?AUTO_6087 ) ( not ( = ?AUTO_6085 ?AUTO_6086 ) ) ( OBJ-AT ?AUTO_6084 ?AUTO_6086 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6084 ?AUTO_6088 ?AUTO_6086 )
      ( DELIVER-PKG ?AUTO_6084 ?AUTO_6085 )
      ( DELIVER-PKG-VERIFY ?AUTO_6084 ?AUTO_6085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6111 - OBJ
      ?AUTO_6112 - LOCATION
    )
    :vars
    (
      ?AUTO_6113 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6111 ?AUTO_6113 ) ( AIRPLANE-AT ?AUTO_6113 ?AUTO_6112 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6111 ?AUTO_6113 ?AUTO_6112 )
      ( DELIVER-PKG-VERIFY ?AUTO_6111 ?AUTO_6112 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6114 - OBJ
      ?AUTO_6115 - LOCATION
    )
    :vars
    (
      ?AUTO_6116 - AIRPLANE
      ?AUTO_6117 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6114 ?AUTO_6116 ) ( AIRPORT ?AUTO_6117 ) ( AIRPORT ?AUTO_6115 ) ( AIRPLANE-AT ?AUTO_6116 ?AUTO_6117 ) ( not ( = ?AUTO_6117 ?AUTO_6115 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6116 ?AUTO_6117 ?AUTO_6115 )
      ( DELIVER-PKG ?AUTO_6114 ?AUTO_6115 )
      ( DELIVER-PKG-VERIFY ?AUTO_6114 ?AUTO_6115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6122 - OBJ
      ?AUTO_6123 - LOCATION
    )
    :vars
    (
      ?AUTO_6124 - LOCATION
      ?AUTO_6125 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6124 ) ( AIRPORT ?AUTO_6123 ) ( AIRPLANE-AT ?AUTO_6125 ?AUTO_6124 ) ( not ( = ?AUTO_6124 ?AUTO_6123 ) ) ( OBJ-AT ?AUTO_6122 ?AUTO_6124 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6122 ?AUTO_6125 ?AUTO_6124 )
      ( DELIVER-PKG ?AUTO_6122 ?AUTO_6123 )
      ( DELIVER-PKG-VERIFY ?AUTO_6122 ?AUTO_6123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6126 - OBJ
      ?AUTO_6127 - LOCATION
    )
    :vars
    (
      ?AUTO_6129 - LOCATION
      ?AUTO_6130 - LOCATION
      ?AUTO_6128 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6129 ) ( AIRPORT ?AUTO_6127 ) ( not ( = ?AUTO_6129 ?AUTO_6127 ) ) ( OBJ-AT ?AUTO_6126 ?AUTO_6129 ) ( AIRPORT ?AUTO_6130 ) ( AIRPLANE-AT ?AUTO_6128 ?AUTO_6130 ) ( not ( = ?AUTO_6130 ?AUTO_6129 ) ) ( not ( = ?AUTO_6127 ?AUTO_6130 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6128 ?AUTO_6130 ?AUTO_6129 )
      ( DELIVER-PKG ?AUTO_6126 ?AUTO_6127 )
      ( DELIVER-PKG-VERIFY ?AUTO_6126 ?AUTO_6127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6145 - OBJ
      ?AUTO_6146 - LOCATION
    )
    :vars
    (
      ?AUTO_6149 - LOCATION
      ?AUTO_6147 - LOCATION
      ?AUTO_6148 - AIRPLANE
      ?AUTO_6150 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6149 ) ( AIRPORT ?AUTO_6146 ) ( not ( = ?AUTO_6149 ?AUTO_6146 ) ) ( AIRPORT ?AUTO_6147 ) ( AIRPLANE-AT ?AUTO_6148 ?AUTO_6147 ) ( not ( = ?AUTO_6147 ?AUTO_6149 ) ) ( not ( = ?AUTO_6146 ?AUTO_6147 ) ) ( TRUCK-AT ?AUTO_6150 ?AUTO_6149 ) ( IN-TRUCK ?AUTO_6145 ?AUTO_6150 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6145 ?AUTO_6150 ?AUTO_6149 )
      ( DELIVER-PKG ?AUTO_6145 ?AUTO_6146 )
      ( DELIVER-PKG-VERIFY ?AUTO_6145 ?AUTO_6146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6159 - OBJ
      ?AUTO_6160 - LOCATION
    )
    :vars
    (
      ?AUTO_6163 - LOCATION
      ?AUTO_6162 - LOCATION
      ?AUTO_6164 - AIRPLANE
      ?AUTO_6161 - TRUCK
      ?AUTO_6165 - LOCATION
      ?AUTO_6166 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6163 ) ( AIRPORT ?AUTO_6160 ) ( not ( = ?AUTO_6163 ?AUTO_6160 ) ) ( AIRPORT ?AUTO_6162 ) ( AIRPLANE-AT ?AUTO_6164 ?AUTO_6162 ) ( not ( = ?AUTO_6162 ?AUTO_6163 ) ) ( not ( = ?AUTO_6160 ?AUTO_6162 ) ) ( IN-TRUCK ?AUTO_6159 ?AUTO_6161 ) ( TRUCK-AT ?AUTO_6161 ?AUTO_6165 ) ( IN-CITY ?AUTO_6165 ?AUTO_6166 ) ( IN-CITY ?AUTO_6163 ?AUTO_6166 ) ( not ( = ?AUTO_6163 ?AUTO_6165 ) ) ( not ( = ?AUTO_6160 ?AUTO_6165 ) ) ( not ( = ?AUTO_6162 ?AUTO_6165 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6161 ?AUTO_6165 ?AUTO_6163 ?AUTO_6166 )
      ( DELIVER-PKG ?AUTO_6159 ?AUTO_6160 )
      ( DELIVER-PKG-VERIFY ?AUTO_6159 ?AUTO_6160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6167 - OBJ
      ?AUTO_6168 - LOCATION
    )
    :vars
    (
      ?AUTO_6171 - LOCATION
      ?AUTO_6169 - LOCATION
      ?AUTO_6172 - AIRPLANE
      ?AUTO_6170 - TRUCK
      ?AUTO_6174 - LOCATION
      ?AUTO_6173 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6171 ) ( AIRPORT ?AUTO_6168 ) ( not ( = ?AUTO_6171 ?AUTO_6168 ) ) ( AIRPORT ?AUTO_6169 ) ( AIRPLANE-AT ?AUTO_6172 ?AUTO_6169 ) ( not ( = ?AUTO_6169 ?AUTO_6171 ) ) ( not ( = ?AUTO_6168 ?AUTO_6169 ) ) ( TRUCK-AT ?AUTO_6170 ?AUTO_6174 ) ( IN-CITY ?AUTO_6174 ?AUTO_6173 ) ( IN-CITY ?AUTO_6171 ?AUTO_6173 ) ( not ( = ?AUTO_6171 ?AUTO_6174 ) ) ( not ( = ?AUTO_6168 ?AUTO_6174 ) ) ( not ( = ?AUTO_6169 ?AUTO_6174 ) ) ( OBJ-AT ?AUTO_6167 ?AUTO_6174 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6167 ?AUTO_6170 ?AUTO_6174 )
      ( DELIVER-PKG ?AUTO_6167 ?AUTO_6168 )
      ( DELIVER-PKG-VERIFY ?AUTO_6167 ?AUTO_6168 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6179 - OBJ
      ?AUTO_6180 - LOCATION
    )
    :vars
    (
      ?AUTO_6181 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6179 ?AUTO_6181 ) ( AIRPLANE-AT ?AUTO_6181 ?AUTO_6180 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6179 ?AUTO_6181 ?AUTO_6180 )
      ( DELIVER-PKG-VERIFY ?AUTO_6179 ?AUTO_6180 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6206 - OBJ
      ?AUTO_6207 - LOCATION
    )
    :vars
    (
      ?AUTO_6208 - LOCATION
      ?AUTO_6209 - AIRPLANE
      ?AUTO_6210 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6208 ) ( AIRPORT ?AUTO_6207 ) ( AIRPLANE-AT ?AUTO_6209 ?AUTO_6208 ) ( not ( = ?AUTO_6208 ?AUTO_6207 ) ) ( TRUCK-AT ?AUTO_6210 ?AUTO_6208 ) ( IN-TRUCK ?AUTO_6206 ?AUTO_6210 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6206 ?AUTO_6210 ?AUTO_6208 )
      ( DELIVER-PKG ?AUTO_6206 ?AUTO_6207 )
      ( DELIVER-PKG-VERIFY ?AUTO_6206 ?AUTO_6207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6217 - OBJ
      ?AUTO_6218 - LOCATION
    )
    :vars
    (
      ?AUTO_6220 - LOCATION
      ?AUTO_6219 - AIRPLANE
      ?AUTO_6221 - TRUCK
      ?AUTO_6222 - LOCATION
      ?AUTO_6223 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6220 ) ( AIRPORT ?AUTO_6218 ) ( AIRPLANE-AT ?AUTO_6219 ?AUTO_6220 ) ( not ( = ?AUTO_6220 ?AUTO_6218 ) ) ( IN-TRUCK ?AUTO_6217 ?AUTO_6221 ) ( TRUCK-AT ?AUTO_6221 ?AUTO_6222 ) ( IN-CITY ?AUTO_6222 ?AUTO_6223 ) ( IN-CITY ?AUTO_6220 ?AUTO_6223 ) ( not ( = ?AUTO_6220 ?AUTO_6222 ) ) ( not ( = ?AUTO_6218 ?AUTO_6222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6221 ?AUTO_6222 ?AUTO_6220 ?AUTO_6223 )
      ( DELIVER-PKG ?AUTO_6217 ?AUTO_6218 )
      ( DELIVER-PKG-VERIFY ?AUTO_6217 ?AUTO_6218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6224 - OBJ
      ?AUTO_6225 - LOCATION
    )
    :vars
    (
      ?AUTO_6226 - LOCATION
      ?AUTO_6227 - AIRPLANE
      ?AUTO_6228 - TRUCK
      ?AUTO_6230 - LOCATION
      ?AUTO_6229 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6226 ) ( AIRPORT ?AUTO_6225 ) ( AIRPLANE-AT ?AUTO_6227 ?AUTO_6226 ) ( not ( = ?AUTO_6226 ?AUTO_6225 ) ) ( TRUCK-AT ?AUTO_6228 ?AUTO_6230 ) ( IN-CITY ?AUTO_6230 ?AUTO_6229 ) ( IN-CITY ?AUTO_6226 ?AUTO_6229 ) ( not ( = ?AUTO_6226 ?AUTO_6230 ) ) ( not ( = ?AUTO_6225 ?AUTO_6230 ) ) ( OBJ-AT ?AUTO_6224 ?AUTO_6230 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6224 ?AUTO_6228 ?AUTO_6230 )
      ( DELIVER-PKG ?AUTO_6224 ?AUTO_6225 )
      ( DELIVER-PKG-VERIFY ?AUTO_6224 ?AUTO_6225 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6239 - OBJ
      ?AUTO_6240 - LOCATION
    )
    :vars
    (
      ?AUTO_6241 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6239 ?AUTO_6241 ) ( AIRPLANE-AT ?AUTO_6241 ?AUTO_6240 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6239 ?AUTO_6241 ?AUTO_6240 )
      ( DELIVER-PKG-VERIFY ?AUTO_6239 ?AUTO_6240 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6242 - OBJ
      ?AUTO_6243 - LOCATION
    )
    :vars
    (
      ?AUTO_6244 - AIRPLANE
      ?AUTO_6245 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6242 ?AUTO_6244 ) ( AIRPORT ?AUTO_6245 ) ( AIRPORT ?AUTO_6243 ) ( AIRPLANE-AT ?AUTO_6244 ?AUTO_6245 ) ( not ( = ?AUTO_6245 ?AUTO_6243 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6244 ?AUTO_6245 ?AUTO_6243 )
      ( DELIVER-PKG ?AUTO_6242 ?AUTO_6243 )
      ( DELIVER-PKG-VERIFY ?AUTO_6242 ?AUTO_6243 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6256 - OBJ
      ?AUTO_6257 - LOCATION
    )
    :vars
    (
      ?AUTO_6259 - LOCATION
      ?AUTO_6258 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6259 ) ( AIRPORT ?AUTO_6257 ) ( AIRPLANE-AT ?AUTO_6258 ?AUTO_6259 ) ( not ( = ?AUTO_6259 ?AUTO_6257 ) ) ( OBJ-AT ?AUTO_6256 ?AUTO_6259 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6256 ?AUTO_6258 ?AUTO_6259 )
      ( DELIVER-PKG ?AUTO_6256 ?AUTO_6257 )
      ( DELIVER-PKG-VERIFY ?AUTO_6256 ?AUTO_6257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6260 - OBJ
      ?AUTO_6261 - LOCATION
    )
    :vars
    (
      ?AUTO_6262 - LOCATION
      ?AUTO_6264 - LOCATION
      ?AUTO_6263 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6262 ) ( AIRPORT ?AUTO_6261 ) ( not ( = ?AUTO_6262 ?AUTO_6261 ) ) ( OBJ-AT ?AUTO_6260 ?AUTO_6262 ) ( AIRPORT ?AUTO_6264 ) ( AIRPLANE-AT ?AUTO_6263 ?AUTO_6264 ) ( not ( = ?AUTO_6264 ?AUTO_6262 ) ) ( not ( = ?AUTO_6261 ?AUTO_6264 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6263 ?AUTO_6264 ?AUTO_6262 )
      ( DELIVER-PKG ?AUTO_6260 ?AUTO_6261 )
      ( DELIVER-PKG-VERIFY ?AUTO_6260 ?AUTO_6261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6279 - OBJ
      ?AUTO_6280 - LOCATION
    )
    :vars
    (
      ?AUTO_6281 - LOCATION
      ?AUTO_6283 - LOCATION
      ?AUTO_6282 - AIRPLANE
      ?AUTO_6284 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6281 ) ( AIRPORT ?AUTO_6280 ) ( not ( = ?AUTO_6281 ?AUTO_6280 ) ) ( AIRPORT ?AUTO_6283 ) ( AIRPLANE-AT ?AUTO_6282 ?AUTO_6283 ) ( not ( = ?AUTO_6283 ?AUTO_6281 ) ) ( not ( = ?AUTO_6280 ?AUTO_6283 ) ) ( TRUCK-AT ?AUTO_6284 ?AUTO_6281 ) ( IN-TRUCK ?AUTO_6279 ?AUTO_6284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6279 ?AUTO_6284 ?AUTO_6281 )
      ( DELIVER-PKG ?AUTO_6279 ?AUTO_6280 )
      ( DELIVER-PKG-VERIFY ?AUTO_6279 ?AUTO_6280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6289 - OBJ
      ?AUTO_6290 - LOCATION
    )
    :vars
    (
      ?AUTO_6294 - LOCATION
      ?AUTO_6293 - LOCATION
      ?AUTO_6292 - AIRPLANE
      ?AUTO_6291 - TRUCK
      ?AUTO_6295 - LOCATION
      ?AUTO_6296 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6294 ) ( AIRPORT ?AUTO_6290 ) ( not ( = ?AUTO_6294 ?AUTO_6290 ) ) ( AIRPORT ?AUTO_6293 ) ( AIRPLANE-AT ?AUTO_6292 ?AUTO_6293 ) ( not ( = ?AUTO_6293 ?AUTO_6294 ) ) ( not ( = ?AUTO_6290 ?AUTO_6293 ) ) ( IN-TRUCK ?AUTO_6289 ?AUTO_6291 ) ( TRUCK-AT ?AUTO_6291 ?AUTO_6295 ) ( IN-CITY ?AUTO_6295 ?AUTO_6296 ) ( IN-CITY ?AUTO_6294 ?AUTO_6296 ) ( not ( = ?AUTO_6294 ?AUTO_6295 ) ) ( not ( = ?AUTO_6290 ?AUTO_6295 ) ) ( not ( = ?AUTO_6293 ?AUTO_6295 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6291 ?AUTO_6295 ?AUTO_6294 ?AUTO_6296 )
      ( DELIVER-PKG ?AUTO_6289 ?AUTO_6290 )
      ( DELIVER-PKG-VERIFY ?AUTO_6289 ?AUTO_6290 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6297 - OBJ
      ?AUTO_6298 - LOCATION
    )
    :vars
    (
      ?AUTO_6299 - LOCATION
      ?AUTO_6302 - LOCATION
      ?AUTO_6300 - AIRPLANE
      ?AUTO_6301 - TRUCK
      ?AUTO_6304 - LOCATION
      ?AUTO_6303 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6299 ) ( AIRPORT ?AUTO_6298 ) ( not ( = ?AUTO_6299 ?AUTO_6298 ) ) ( AIRPORT ?AUTO_6302 ) ( AIRPLANE-AT ?AUTO_6300 ?AUTO_6302 ) ( not ( = ?AUTO_6302 ?AUTO_6299 ) ) ( not ( = ?AUTO_6298 ?AUTO_6302 ) ) ( TRUCK-AT ?AUTO_6301 ?AUTO_6304 ) ( IN-CITY ?AUTO_6304 ?AUTO_6303 ) ( IN-CITY ?AUTO_6299 ?AUTO_6303 ) ( not ( = ?AUTO_6299 ?AUTO_6304 ) ) ( not ( = ?AUTO_6298 ?AUTO_6304 ) ) ( not ( = ?AUTO_6302 ?AUTO_6304 ) ) ( OBJ-AT ?AUTO_6297 ?AUTO_6304 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6297 ?AUTO_6301 ?AUTO_6304 )
      ( DELIVER-PKG ?AUTO_6297 ?AUTO_6298 )
      ( DELIVER-PKG-VERIFY ?AUTO_6297 ?AUTO_6298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6313 - OBJ
      ?AUTO_6314 - LOCATION
    )
    :vars
    (
      ?AUTO_6315 - LOCATION
      ?AUTO_6317 - LOCATION
      ?AUTO_6316 - AIRPLANE
      ?AUTO_6320 - LOCATION
      ?AUTO_6319 - CITY
      ?AUTO_6318 - TRUCK
      ?AUTO_6321 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6315 ) ( AIRPORT ?AUTO_6314 ) ( not ( = ?AUTO_6315 ?AUTO_6314 ) ) ( AIRPORT ?AUTO_6317 ) ( AIRPLANE-AT ?AUTO_6316 ?AUTO_6317 ) ( not ( = ?AUTO_6317 ?AUTO_6315 ) ) ( not ( = ?AUTO_6314 ?AUTO_6317 ) ) ( IN-CITY ?AUTO_6320 ?AUTO_6319 ) ( IN-CITY ?AUTO_6315 ?AUTO_6319 ) ( not ( = ?AUTO_6315 ?AUTO_6320 ) ) ( not ( = ?AUTO_6314 ?AUTO_6320 ) ) ( not ( = ?AUTO_6317 ?AUTO_6320 ) ) ( OBJ-AT ?AUTO_6313 ?AUTO_6320 ) ( TRUCK-AT ?AUTO_6318 ?AUTO_6321 ) ( IN-CITY ?AUTO_6321 ?AUTO_6319 ) ( not ( = ?AUTO_6320 ?AUTO_6321 ) ) ( not ( = ?AUTO_6314 ?AUTO_6321 ) ) ( not ( = ?AUTO_6315 ?AUTO_6321 ) ) ( not ( = ?AUTO_6317 ?AUTO_6321 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6318 ?AUTO_6321 ?AUTO_6320 ?AUTO_6319 )
      ( DELIVER-PKG ?AUTO_6313 ?AUTO_6314 )
      ( DELIVER-PKG-VERIFY ?AUTO_6313 ?AUTO_6314 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6324 - OBJ
      ?AUTO_6325 - LOCATION
    )
    :vars
    (
      ?AUTO_6326 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6324 ?AUTO_6326 ) ( AIRPLANE-AT ?AUTO_6326 ?AUTO_6325 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6324 ?AUTO_6326 ?AUTO_6325 )
      ( DELIVER-PKG-VERIFY ?AUTO_6324 ?AUTO_6325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6337 - OBJ
      ?AUTO_6338 - LOCATION
    )
    :vars
    (
      ?AUTO_6339 - AIRPLANE
      ?AUTO_6340 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6337 ?AUTO_6339 ) ( AIRPORT ?AUTO_6340 ) ( AIRPORT ?AUTO_6338 ) ( AIRPLANE-AT ?AUTO_6339 ?AUTO_6340 ) ( not ( = ?AUTO_6340 ?AUTO_6338 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6339 ?AUTO_6340 ?AUTO_6338 )
      ( DELIVER-PKG ?AUTO_6337 ?AUTO_6338 )
      ( DELIVER-PKG-VERIFY ?AUTO_6337 ?AUTO_6338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6349 - OBJ
      ?AUTO_6350 - LOCATION
    )
    :vars
    (
      ?AUTO_6351 - LOCATION
      ?AUTO_6352 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6351 ) ( AIRPORT ?AUTO_6350 ) ( AIRPLANE-AT ?AUTO_6352 ?AUTO_6351 ) ( not ( = ?AUTO_6351 ?AUTO_6350 ) ) ( OBJ-AT ?AUTO_6349 ?AUTO_6351 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6349 ?AUTO_6352 ?AUTO_6351 )
      ( DELIVER-PKG ?AUTO_6349 ?AUTO_6350 )
      ( DELIVER-PKG-VERIFY ?AUTO_6349 ?AUTO_6350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6353 - OBJ
      ?AUTO_6354 - LOCATION
    )
    :vars
    (
      ?AUTO_6356 - LOCATION
      ?AUTO_6357 - LOCATION
      ?AUTO_6355 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6356 ) ( AIRPORT ?AUTO_6354 ) ( not ( = ?AUTO_6356 ?AUTO_6354 ) ) ( OBJ-AT ?AUTO_6353 ?AUTO_6356 ) ( AIRPORT ?AUTO_6357 ) ( AIRPLANE-AT ?AUTO_6355 ?AUTO_6357 ) ( not ( = ?AUTO_6357 ?AUTO_6356 ) ) ( not ( = ?AUTO_6354 ?AUTO_6357 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6355 ?AUTO_6357 ?AUTO_6356 )
      ( DELIVER-PKG ?AUTO_6353 ?AUTO_6354 )
      ( DELIVER-PKG-VERIFY ?AUTO_6353 ?AUTO_6354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6404 - OBJ
      ?AUTO_6405 - LOCATION
    )
    :vars
    (
      ?AUTO_6406 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6404 ?AUTO_6406 ) ( AIRPLANE-AT ?AUTO_6406 ?AUTO_6405 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6404 ?AUTO_6406 ?AUTO_6405 )
      ( DELIVER-PKG-VERIFY ?AUTO_6404 ?AUTO_6405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6407 - OBJ
      ?AUTO_6408 - LOCATION
    )
    :vars
    (
      ?AUTO_6409 - AIRPLANE
      ?AUTO_6410 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6407 ?AUTO_6409 ) ( AIRPORT ?AUTO_6410 ) ( AIRPORT ?AUTO_6408 ) ( AIRPLANE-AT ?AUTO_6409 ?AUTO_6410 ) ( not ( = ?AUTO_6410 ?AUTO_6408 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6409 ?AUTO_6410 ?AUTO_6408 )
      ( DELIVER-PKG ?AUTO_6407 ?AUTO_6408 )
      ( DELIVER-PKG-VERIFY ?AUTO_6407 ?AUTO_6408 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6421 - OBJ
      ?AUTO_6422 - LOCATION
    )
    :vars
    (
      ?AUTO_6424 - LOCATION
      ?AUTO_6423 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6424 ) ( AIRPORT ?AUTO_6422 ) ( AIRPLANE-AT ?AUTO_6423 ?AUTO_6424 ) ( not ( = ?AUTO_6424 ?AUTO_6422 ) ) ( OBJ-AT ?AUTO_6421 ?AUTO_6424 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6421 ?AUTO_6423 ?AUTO_6424 )
      ( DELIVER-PKG ?AUTO_6421 ?AUTO_6422 )
      ( DELIVER-PKG-VERIFY ?AUTO_6421 ?AUTO_6422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6425 - OBJ
      ?AUTO_6426 - LOCATION
    )
    :vars
    (
      ?AUTO_6428 - LOCATION
      ?AUTO_6429 - LOCATION
      ?AUTO_6427 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6428 ) ( AIRPORT ?AUTO_6426 ) ( not ( = ?AUTO_6428 ?AUTO_6426 ) ) ( OBJ-AT ?AUTO_6425 ?AUTO_6428 ) ( AIRPORT ?AUTO_6429 ) ( AIRPLANE-AT ?AUTO_6427 ?AUTO_6429 ) ( not ( = ?AUTO_6429 ?AUTO_6428 ) ) ( not ( = ?AUTO_6426 ?AUTO_6429 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6427 ?AUTO_6429 ?AUTO_6428 )
      ( DELIVER-PKG ?AUTO_6425 ?AUTO_6426 )
      ( DELIVER-PKG-VERIFY ?AUTO_6425 ?AUTO_6426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6454 - OBJ
      ?AUTO_6455 - LOCATION
    )
    :vars
    (
      ?AUTO_6457 - LOCATION
      ?AUTO_6458 - LOCATION
      ?AUTO_6456 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6457 ) ( AIRPORT ?AUTO_6455 ) ( not ( = ?AUTO_6457 ?AUTO_6455 ) ) ( OBJ-AT ?AUTO_6454 ?AUTO_6457 ) ( AIRPORT ?AUTO_6458 ) ( not ( = ?AUTO_6458 ?AUTO_6457 ) ) ( not ( = ?AUTO_6455 ?AUTO_6458 ) ) ( AIRPLANE-AT ?AUTO_6456 ?AUTO_6455 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6456 ?AUTO_6455 ?AUTO_6458 )
      ( DELIVER-PKG ?AUTO_6454 ?AUTO_6455 )
      ( DELIVER-PKG-VERIFY ?AUTO_6454 ?AUTO_6455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6491 - OBJ
      ?AUTO_6492 - LOCATION
    )
    :vars
    (
      ?AUTO_6493 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6493 ?AUTO_6492 ) ( IN-TRUCK ?AUTO_6491 ?AUTO_6493 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6491 ?AUTO_6493 ?AUTO_6492 )
      ( DELIVER-PKG-VERIFY ?AUTO_6491 ?AUTO_6492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6510 - OBJ
      ?AUTO_6511 - LOCATION
    )
    :vars
    (
      ?AUTO_6512 - TRUCK
      ?AUTO_6513 - LOCATION
      ?AUTO_6514 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6510 ?AUTO_6512 ) ( TRUCK-AT ?AUTO_6512 ?AUTO_6513 ) ( IN-CITY ?AUTO_6513 ?AUTO_6514 ) ( IN-CITY ?AUTO_6511 ?AUTO_6514 ) ( not ( = ?AUTO_6511 ?AUTO_6513 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6512 ?AUTO_6513 ?AUTO_6511 ?AUTO_6514 )
      ( DELIVER-PKG ?AUTO_6510 ?AUTO_6511 )
      ( DELIVER-PKG-VERIFY ?AUTO_6510 ?AUTO_6511 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6523 - OBJ
      ?AUTO_6524 - LOCATION
    )
    :vars
    (
      ?AUTO_6526 - TRUCK
      ?AUTO_6527 - LOCATION
      ?AUTO_6525 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6526 ?AUTO_6527 ) ( IN-CITY ?AUTO_6527 ?AUTO_6525 ) ( IN-CITY ?AUTO_6524 ?AUTO_6525 ) ( not ( = ?AUTO_6524 ?AUTO_6527 ) ) ( OBJ-AT ?AUTO_6523 ?AUTO_6527 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6523 ?AUTO_6526 ?AUTO_6527 )
      ( DELIVER-PKG ?AUTO_6523 ?AUTO_6524 )
      ( DELIVER-PKG-VERIFY ?AUTO_6523 ?AUTO_6524 ) )
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
      ?AUTO_6542 - LOCATION
      ?AUTO_6541 - CITY
      ?AUTO_6543 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6540 ?AUTO_6542 ) ( IN-CITY ?AUTO_6542 ?AUTO_6541 ) ( IN-CITY ?AUTO_6539 ?AUTO_6541 ) ( not ( = ?AUTO_6539 ?AUTO_6542 ) ) ( IN-AIRPLANE ?AUTO_6538 ?AUTO_6543 ) ( AIRPLANE-AT ?AUTO_6543 ?AUTO_6542 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6538 ?AUTO_6543 ?AUTO_6542 )
      ( DELIVER-PKG ?AUTO_6538 ?AUTO_6539 )
      ( DELIVER-PKG-VERIFY ?AUTO_6538 ?AUTO_6539 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6544 - OBJ
      ?AUTO_6545 - LOCATION
    )
    :vars
    (
      ?AUTO_6547 - TRUCK
      ?AUTO_6548 - LOCATION
      ?AUTO_6546 - CITY
      ?AUTO_6549 - AIRPLANE
      ?AUTO_6550 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6547 ?AUTO_6548 ) ( IN-CITY ?AUTO_6548 ?AUTO_6546 ) ( IN-CITY ?AUTO_6545 ?AUTO_6546 ) ( not ( = ?AUTO_6545 ?AUTO_6548 ) ) ( IN-AIRPLANE ?AUTO_6544 ?AUTO_6549 ) ( AIRPORT ?AUTO_6550 ) ( AIRPORT ?AUTO_6548 ) ( AIRPLANE-AT ?AUTO_6549 ?AUTO_6550 ) ( not ( = ?AUTO_6550 ?AUTO_6548 ) ) ( not ( = ?AUTO_6545 ?AUTO_6550 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6549 ?AUTO_6550 ?AUTO_6548 )
      ( DELIVER-PKG ?AUTO_6544 ?AUTO_6545 )
      ( DELIVER-PKG-VERIFY ?AUTO_6544 ?AUTO_6545 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6555 - OBJ
      ?AUTO_6556 - LOCATION
    )
    :vars
    (
      ?AUTO_6558 - TRUCK
      ?AUTO_6560 - LOCATION
      ?AUTO_6559 - CITY
      ?AUTO_6561 - LOCATION
      ?AUTO_6557 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6558 ?AUTO_6560 ) ( IN-CITY ?AUTO_6560 ?AUTO_6559 ) ( IN-CITY ?AUTO_6556 ?AUTO_6559 ) ( not ( = ?AUTO_6556 ?AUTO_6560 ) ) ( AIRPORT ?AUTO_6561 ) ( AIRPORT ?AUTO_6560 ) ( AIRPLANE-AT ?AUTO_6557 ?AUTO_6561 ) ( not ( = ?AUTO_6561 ?AUTO_6560 ) ) ( not ( = ?AUTO_6556 ?AUTO_6561 ) ) ( OBJ-AT ?AUTO_6555 ?AUTO_6561 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6555 ?AUTO_6557 ?AUTO_6561 )
      ( DELIVER-PKG ?AUTO_6555 ?AUTO_6556 )
      ( DELIVER-PKG-VERIFY ?AUTO_6555 ?AUTO_6556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6562 - OBJ
      ?AUTO_6563 - LOCATION
    )
    :vars
    (
      ?AUTO_6564 - TRUCK
      ?AUTO_6566 - LOCATION
      ?AUTO_6567 - CITY
      ?AUTO_6568 - LOCATION
      ?AUTO_6569 - LOCATION
      ?AUTO_6565 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6564 ?AUTO_6566 ) ( IN-CITY ?AUTO_6566 ?AUTO_6567 ) ( IN-CITY ?AUTO_6563 ?AUTO_6567 ) ( not ( = ?AUTO_6563 ?AUTO_6566 ) ) ( AIRPORT ?AUTO_6568 ) ( AIRPORT ?AUTO_6566 ) ( not ( = ?AUTO_6568 ?AUTO_6566 ) ) ( not ( = ?AUTO_6563 ?AUTO_6568 ) ) ( OBJ-AT ?AUTO_6562 ?AUTO_6568 ) ( AIRPORT ?AUTO_6569 ) ( AIRPLANE-AT ?AUTO_6565 ?AUTO_6569 ) ( not ( = ?AUTO_6569 ?AUTO_6568 ) ) ( not ( = ?AUTO_6563 ?AUTO_6569 ) ) ( not ( = ?AUTO_6566 ?AUTO_6569 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6565 ?AUTO_6569 ?AUTO_6568 )
      ( DELIVER-PKG ?AUTO_6562 ?AUTO_6563 )
      ( DELIVER-PKG-VERIFY ?AUTO_6562 ?AUTO_6563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6574 - OBJ
      ?AUTO_6575 - LOCATION
    )
    :vars
    (
      ?AUTO_6577 - LOCATION
      ?AUTO_6581 - CITY
      ?AUTO_6579 - LOCATION
      ?AUTO_6576 - LOCATION
      ?AUTO_6580 - AIRPLANE
      ?AUTO_6578 - TRUCK
      ?AUTO_6582 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6577 ?AUTO_6581 ) ( IN-CITY ?AUTO_6575 ?AUTO_6581 ) ( not ( = ?AUTO_6575 ?AUTO_6577 ) ) ( AIRPORT ?AUTO_6579 ) ( AIRPORT ?AUTO_6577 ) ( not ( = ?AUTO_6579 ?AUTO_6577 ) ) ( not ( = ?AUTO_6575 ?AUTO_6579 ) ) ( OBJ-AT ?AUTO_6574 ?AUTO_6579 ) ( AIRPORT ?AUTO_6576 ) ( AIRPLANE-AT ?AUTO_6580 ?AUTO_6576 ) ( not ( = ?AUTO_6576 ?AUTO_6579 ) ) ( not ( = ?AUTO_6575 ?AUTO_6576 ) ) ( not ( = ?AUTO_6577 ?AUTO_6576 ) ) ( TRUCK-AT ?AUTO_6578 ?AUTO_6582 ) ( IN-CITY ?AUTO_6582 ?AUTO_6581 ) ( not ( = ?AUTO_6577 ?AUTO_6582 ) ) ( not ( = ?AUTO_6575 ?AUTO_6582 ) ) ( not ( = ?AUTO_6579 ?AUTO_6582 ) ) ( not ( = ?AUTO_6576 ?AUTO_6582 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6578 ?AUTO_6582 ?AUTO_6577 ?AUTO_6581 )
      ( DELIVER-PKG ?AUTO_6574 ?AUTO_6575 )
      ( DELIVER-PKG-VERIFY ?AUTO_6574 ?AUTO_6575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6591 - OBJ
      ?AUTO_6592 - LOCATION
    )
    :vars
    (
      ?AUTO_6595 - LOCATION
      ?AUTO_6599 - CITY
      ?AUTO_6594 - LOCATION
      ?AUTO_6597 - LOCATION
      ?AUTO_6593 - AIRPLANE
      ?AUTO_6596 - TRUCK
      ?AUTO_6598 - LOCATION
      ?AUTO_6600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6595 ?AUTO_6599 ) ( IN-CITY ?AUTO_6592 ?AUTO_6599 ) ( not ( = ?AUTO_6592 ?AUTO_6595 ) ) ( AIRPORT ?AUTO_6594 ) ( AIRPORT ?AUTO_6595 ) ( not ( = ?AUTO_6594 ?AUTO_6595 ) ) ( not ( = ?AUTO_6592 ?AUTO_6594 ) ) ( AIRPORT ?AUTO_6597 ) ( AIRPLANE-AT ?AUTO_6593 ?AUTO_6597 ) ( not ( = ?AUTO_6597 ?AUTO_6594 ) ) ( not ( = ?AUTO_6592 ?AUTO_6597 ) ) ( not ( = ?AUTO_6595 ?AUTO_6597 ) ) ( TRUCK-AT ?AUTO_6596 ?AUTO_6598 ) ( IN-CITY ?AUTO_6598 ?AUTO_6599 ) ( not ( = ?AUTO_6595 ?AUTO_6598 ) ) ( not ( = ?AUTO_6592 ?AUTO_6598 ) ) ( not ( = ?AUTO_6594 ?AUTO_6598 ) ) ( not ( = ?AUTO_6597 ?AUTO_6598 ) ) ( TRUCK-AT ?AUTO_6600 ?AUTO_6594 ) ( IN-TRUCK ?AUTO_6591 ?AUTO_6600 ) ( not ( = ?AUTO_6596 ?AUTO_6600 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6591 ?AUTO_6600 ?AUTO_6594 )
      ( DELIVER-PKG ?AUTO_6591 ?AUTO_6592 )
      ( DELIVER-PKG-VERIFY ?AUTO_6591 ?AUTO_6592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6609 - OBJ
      ?AUTO_6610 - LOCATION
    )
    :vars
    (
      ?AUTO_6617 - LOCATION
      ?AUTO_6615 - CITY
      ?AUTO_6618 - LOCATION
      ?AUTO_6613 - LOCATION
      ?AUTO_6616 - AIRPLANE
      ?AUTO_6612 - TRUCK
      ?AUTO_6611 - LOCATION
      ?AUTO_6614 - TRUCK
      ?AUTO_6619 - LOCATION
      ?AUTO_6620 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6617 ?AUTO_6615 ) ( IN-CITY ?AUTO_6610 ?AUTO_6615 ) ( not ( = ?AUTO_6610 ?AUTO_6617 ) ) ( AIRPORT ?AUTO_6618 ) ( AIRPORT ?AUTO_6617 ) ( not ( = ?AUTO_6618 ?AUTO_6617 ) ) ( not ( = ?AUTO_6610 ?AUTO_6618 ) ) ( AIRPORT ?AUTO_6613 ) ( AIRPLANE-AT ?AUTO_6616 ?AUTO_6613 ) ( not ( = ?AUTO_6613 ?AUTO_6618 ) ) ( not ( = ?AUTO_6610 ?AUTO_6613 ) ) ( not ( = ?AUTO_6617 ?AUTO_6613 ) ) ( TRUCK-AT ?AUTO_6612 ?AUTO_6611 ) ( IN-CITY ?AUTO_6611 ?AUTO_6615 ) ( not ( = ?AUTO_6617 ?AUTO_6611 ) ) ( not ( = ?AUTO_6610 ?AUTO_6611 ) ) ( not ( = ?AUTO_6618 ?AUTO_6611 ) ) ( not ( = ?AUTO_6613 ?AUTO_6611 ) ) ( IN-TRUCK ?AUTO_6609 ?AUTO_6614 ) ( not ( = ?AUTO_6612 ?AUTO_6614 ) ) ( TRUCK-AT ?AUTO_6614 ?AUTO_6619 ) ( IN-CITY ?AUTO_6619 ?AUTO_6620 ) ( IN-CITY ?AUTO_6618 ?AUTO_6620 ) ( not ( = ?AUTO_6618 ?AUTO_6619 ) ) ( not ( = ?AUTO_6610 ?AUTO_6619 ) ) ( not ( = ?AUTO_6617 ?AUTO_6619 ) ) ( not ( = ?AUTO_6615 ?AUTO_6620 ) ) ( not ( = ?AUTO_6613 ?AUTO_6619 ) ) ( not ( = ?AUTO_6611 ?AUTO_6619 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6614 ?AUTO_6619 ?AUTO_6618 ?AUTO_6620 )
      ( DELIVER-PKG ?AUTO_6609 ?AUTO_6610 )
      ( DELIVER-PKG-VERIFY ?AUTO_6609 ?AUTO_6610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6621 - OBJ
      ?AUTO_6622 - LOCATION
    )
    :vars
    (
      ?AUTO_6631 - LOCATION
      ?AUTO_6623 - CITY
      ?AUTO_6630 - LOCATION
      ?AUTO_6625 - LOCATION
      ?AUTO_6627 - AIRPLANE
      ?AUTO_6629 - TRUCK
      ?AUTO_6624 - LOCATION
      ?AUTO_6628 - TRUCK
      ?AUTO_6632 - LOCATION
      ?AUTO_6626 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6631 ?AUTO_6623 ) ( IN-CITY ?AUTO_6622 ?AUTO_6623 ) ( not ( = ?AUTO_6622 ?AUTO_6631 ) ) ( AIRPORT ?AUTO_6630 ) ( AIRPORT ?AUTO_6631 ) ( not ( = ?AUTO_6630 ?AUTO_6631 ) ) ( not ( = ?AUTO_6622 ?AUTO_6630 ) ) ( AIRPORT ?AUTO_6625 ) ( AIRPLANE-AT ?AUTO_6627 ?AUTO_6625 ) ( not ( = ?AUTO_6625 ?AUTO_6630 ) ) ( not ( = ?AUTO_6622 ?AUTO_6625 ) ) ( not ( = ?AUTO_6631 ?AUTO_6625 ) ) ( TRUCK-AT ?AUTO_6629 ?AUTO_6624 ) ( IN-CITY ?AUTO_6624 ?AUTO_6623 ) ( not ( = ?AUTO_6631 ?AUTO_6624 ) ) ( not ( = ?AUTO_6622 ?AUTO_6624 ) ) ( not ( = ?AUTO_6630 ?AUTO_6624 ) ) ( not ( = ?AUTO_6625 ?AUTO_6624 ) ) ( not ( = ?AUTO_6629 ?AUTO_6628 ) ) ( TRUCK-AT ?AUTO_6628 ?AUTO_6632 ) ( IN-CITY ?AUTO_6632 ?AUTO_6626 ) ( IN-CITY ?AUTO_6630 ?AUTO_6626 ) ( not ( = ?AUTO_6630 ?AUTO_6632 ) ) ( not ( = ?AUTO_6622 ?AUTO_6632 ) ) ( not ( = ?AUTO_6631 ?AUTO_6632 ) ) ( not ( = ?AUTO_6623 ?AUTO_6626 ) ) ( not ( = ?AUTO_6625 ?AUTO_6632 ) ) ( not ( = ?AUTO_6624 ?AUTO_6632 ) ) ( OBJ-AT ?AUTO_6621 ?AUTO_6632 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6621 ?AUTO_6628 ?AUTO_6632 )
      ( DELIVER-PKG ?AUTO_6621 ?AUTO_6622 )
      ( DELIVER-PKG-VERIFY ?AUTO_6621 ?AUTO_6622 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6637 - OBJ
      ?AUTO_6638 - LOCATION
    )
    :vars
    (
      ?AUTO_6639 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6639 ?AUTO_6638 ) ( IN-TRUCK ?AUTO_6637 ?AUTO_6639 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6637 ?AUTO_6639 ?AUTO_6638 )
      ( DELIVER-PKG-VERIFY ?AUTO_6637 ?AUTO_6638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6644 - OBJ
      ?AUTO_6645 - LOCATION
    )
    :vars
    (
      ?AUTO_6646 - TRUCK
      ?AUTO_6647 - LOCATION
      ?AUTO_6648 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6644 ?AUTO_6646 ) ( TRUCK-AT ?AUTO_6646 ?AUTO_6647 ) ( IN-CITY ?AUTO_6647 ?AUTO_6648 ) ( IN-CITY ?AUTO_6645 ?AUTO_6648 ) ( not ( = ?AUTO_6645 ?AUTO_6647 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6646 ?AUTO_6647 ?AUTO_6645 ?AUTO_6648 )
      ( DELIVER-PKG ?AUTO_6644 ?AUTO_6645 )
      ( DELIVER-PKG-VERIFY ?AUTO_6644 ?AUTO_6645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6649 - OBJ
      ?AUTO_6650 - LOCATION
    )
    :vars
    (
      ?AUTO_6651 - TRUCK
      ?AUTO_6652 - LOCATION
      ?AUTO_6653 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6651 ?AUTO_6652 ) ( IN-CITY ?AUTO_6652 ?AUTO_6653 ) ( IN-CITY ?AUTO_6650 ?AUTO_6653 ) ( not ( = ?AUTO_6650 ?AUTO_6652 ) ) ( OBJ-AT ?AUTO_6649 ?AUTO_6652 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6649 ?AUTO_6651 ?AUTO_6652 )
      ( DELIVER-PKG ?AUTO_6649 ?AUTO_6650 )
      ( DELIVER-PKG-VERIFY ?AUTO_6649 ?AUTO_6650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6654 - OBJ
      ?AUTO_6655 - LOCATION
    )
    :vars
    (
      ?AUTO_6656 - TRUCK
      ?AUTO_6657 - LOCATION
      ?AUTO_6658 - CITY
      ?AUTO_6659 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6656 ?AUTO_6657 ) ( IN-CITY ?AUTO_6657 ?AUTO_6658 ) ( IN-CITY ?AUTO_6655 ?AUTO_6658 ) ( not ( = ?AUTO_6655 ?AUTO_6657 ) ) ( IN-AIRPLANE ?AUTO_6654 ?AUTO_6659 ) ( AIRPLANE-AT ?AUTO_6659 ?AUTO_6657 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6654 ?AUTO_6659 ?AUTO_6657 )
      ( DELIVER-PKG ?AUTO_6654 ?AUTO_6655 )
      ( DELIVER-PKG-VERIFY ?AUTO_6654 ?AUTO_6655 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6660 - OBJ
      ?AUTO_6661 - LOCATION
    )
    :vars
    (
      ?AUTO_6663 - TRUCK
      ?AUTO_6664 - LOCATION
      ?AUTO_6662 - CITY
      ?AUTO_6665 - AIRPLANE
      ?AUTO_6666 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6663 ?AUTO_6664 ) ( IN-CITY ?AUTO_6664 ?AUTO_6662 ) ( IN-CITY ?AUTO_6661 ?AUTO_6662 ) ( not ( = ?AUTO_6661 ?AUTO_6664 ) ) ( IN-AIRPLANE ?AUTO_6660 ?AUTO_6665 ) ( AIRPORT ?AUTO_6666 ) ( AIRPORT ?AUTO_6664 ) ( AIRPLANE-AT ?AUTO_6665 ?AUTO_6666 ) ( not ( = ?AUTO_6666 ?AUTO_6664 ) ) ( not ( = ?AUTO_6661 ?AUTO_6666 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6665 ?AUTO_6666 ?AUTO_6664 )
      ( DELIVER-PKG ?AUTO_6660 ?AUTO_6661 )
      ( DELIVER-PKG-VERIFY ?AUTO_6660 ?AUTO_6661 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6677 - OBJ
      ?AUTO_6678 - LOCATION
    )
    :vars
    (
      ?AUTO_6680 - TRUCK
      ?AUTO_6681 - LOCATION
      ?AUTO_6683 - CITY
      ?AUTO_6682 - LOCATION
      ?AUTO_6679 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6680 ?AUTO_6681 ) ( IN-CITY ?AUTO_6681 ?AUTO_6683 ) ( IN-CITY ?AUTO_6678 ?AUTO_6683 ) ( not ( = ?AUTO_6678 ?AUTO_6681 ) ) ( AIRPORT ?AUTO_6682 ) ( AIRPORT ?AUTO_6681 ) ( AIRPLANE-AT ?AUTO_6679 ?AUTO_6682 ) ( not ( = ?AUTO_6682 ?AUTO_6681 ) ) ( not ( = ?AUTO_6678 ?AUTO_6682 ) ) ( OBJ-AT ?AUTO_6677 ?AUTO_6682 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6677 ?AUTO_6679 ?AUTO_6682 )
      ( DELIVER-PKG ?AUTO_6677 ?AUTO_6678 )
      ( DELIVER-PKG-VERIFY ?AUTO_6677 ?AUTO_6678 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6684 - OBJ
      ?AUTO_6685 - LOCATION
    )
    :vars
    (
      ?AUTO_6686 - TRUCK
      ?AUTO_6689 - LOCATION
      ?AUTO_6688 - CITY
      ?AUTO_6690 - LOCATION
      ?AUTO_6691 - LOCATION
      ?AUTO_6687 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6686 ?AUTO_6689 ) ( IN-CITY ?AUTO_6689 ?AUTO_6688 ) ( IN-CITY ?AUTO_6685 ?AUTO_6688 ) ( not ( = ?AUTO_6685 ?AUTO_6689 ) ) ( AIRPORT ?AUTO_6690 ) ( AIRPORT ?AUTO_6689 ) ( not ( = ?AUTO_6690 ?AUTO_6689 ) ) ( not ( = ?AUTO_6685 ?AUTO_6690 ) ) ( OBJ-AT ?AUTO_6684 ?AUTO_6690 ) ( AIRPORT ?AUTO_6691 ) ( AIRPLANE-AT ?AUTO_6687 ?AUTO_6691 ) ( not ( = ?AUTO_6691 ?AUTO_6690 ) ) ( not ( = ?AUTO_6685 ?AUTO_6691 ) ) ( not ( = ?AUTO_6689 ?AUTO_6691 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6687 ?AUTO_6691 ?AUTO_6690 )
      ( DELIVER-PKG ?AUTO_6684 ?AUTO_6685 )
      ( DELIVER-PKG-VERIFY ?AUTO_6684 ?AUTO_6685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6716 - OBJ
      ?AUTO_6717 - LOCATION
    )
    :vars
    (
      ?AUTO_6723 - TRUCK
      ?AUTO_6718 - LOCATION
      ?AUTO_6720 - CITY
      ?AUTO_6722 - LOCATION
      ?AUTO_6721 - LOCATION
      ?AUTO_6719 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6723 ?AUTO_6718 ) ( IN-CITY ?AUTO_6718 ?AUTO_6720 ) ( IN-CITY ?AUTO_6717 ?AUTO_6720 ) ( not ( = ?AUTO_6717 ?AUTO_6718 ) ) ( AIRPORT ?AUTO_6722 ) ( AIRPORT ?AUTO_6718 ) ( not ( = ?AUTO_6722 ?AUTO_6718 ) ) ( not ( = ?AUTO_6717 ?AUTO_6722 ) ) ( OBJ-AT ?AUTO_6716 ?AUTO_6722 ) ( AIRPORT ?AUTO_6721 ) ( not ( = ?AUTO_6721 ?AUTO_6722 ) ) ( not ( = ?AUTO_6717 ?AUTO_6721 ) ) ( not ( = ?AUTO_6718 ?AUTO_6721 ) ) ( AIRPLANE-AT ?AUTO_6719 ?AUTO_6718 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6719 ?AUTO_6718 ?AUTO_6721 )
      ( DELIVER-PKG ?AUTO_6716 ?AUTO_6717 )
      ( DELIVER-PKG-VERIFY ?AUTO_6716 ?AUTO_6717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6756 - OBJ
      ?AUTO_6757 - LOCATION
    )
    :vars
    (
      ?AUTO_6758 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6756 ?AUTO_6758 ) ( AIRPLANE-AT ?AUTO_6758 ?AUTO_6757 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6756 ?AUTO_6758 ?AUTO_6757 )
      ( DELIVER-PKG-VERIFY ?AUTO_6756 ?AUTO_6757 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6763 - OBJ
      ?AUTO_6764 - LOCATION
    )
    :vars
    (
      ?AUTO_6765 - AIRPLANE
      ?AUTO_6766 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6763 ?AUTO_6765 ) ( AIRPORT ?AUTO_6766 ) ( AIRPORT ?AUTO_6764 ) ( AIRPLANE-AT ?AUTO_6765 ?AUTO_6766 ) ( not ( = ?AUTO_6766 ?AUTO_6764 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6765 ?AUTO_6766 ?AUTO_6764 )
      ( DELIVER-PKG ?AUTO_6763 ?AUTO_6764 )
      ( DELIVER-PKG-VERIFY ?AUTO_6763 ?AUTO_6764 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6815 - OBJ
      ?AUTO_6816 - LOCATION
    )
    :vars
    (
      ?AUTO_6822 - TRUCK
      ?AUTO_6819 - LOCATION
      ?AUTO_6818 - CITY
      ?AUTO_6821 - LOCATION
      ?AUTO_6817 - LOCATION
      ?AUTO_6820 - AIRPLANE
      ?AUTO_6823 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6822 ?AUTO_6819 ) ( IN-CITY ?AUTO_6819 ?AUTO_6818 ) ( IN-CITY ?AUTO_6816 ?AUTO_6818 ) ( not ( = ?AUTO_6816 ?AUTO_6819 ) ) ( AIRPORT ?AUTO_6821 ) ( AIRPORT ?AUTO_6819 ) ( not ( = ?AUTO_6821 ?AUTO_6819 ) ) ( not ( = ?AUTO_6816 ?AUTO_6821 ) ) ( AIRPORT ?AUTO_6817 ) ( not ( = ?AUTO_6817 ?AUTO_6821 ) ) ( not ( = ?AUTO_6816 ?AUTO_6817 ) ) ( not ( = ?AUTO_6819 ?AUTO_6817 ) ) ( AIRPLANE-AT ?AUTO_6820 ?AUTO_6819 ) ( TRUCK-AT ?AUTO_6823 ?AUTO_6821 ) ( IN-TRUCK ?AUTO_6815 ?AUTO_6823 ) ( not ( = ?AUTO_6822 ?AUTO_6823 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6815 ?AUTO_6823 ?AUTO_6821 )
      ( DELIVER-PKG ?AUTO_6815 ?AUTO_6816 )
      ( DELIVER-PKG-VERIFY ?AUTO_6815 ?AUTO_6816 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6824 - OBJ
      ?AUTO_6825 - LOCATION
    )
    :vars
    (
      ?AUTO_6826 - TRUCK
      ?AUTO_6828 - LOCATION
      ?AUTO_6830 - CITY
      ?AUTO_6831 - LOCATION
      ?AUTO_6832 - LOCATION
      ?AUTO_6829 - AIRPLANE
      ?AUTO_6827 - TRUCK
      ?AUTO_6833 - LOCATION
      ?AUTO_6834 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6826 ?AUTO_6828 ) ( IN-CITY ?AUTO_6828 ?AUTO_6830 ) ( IN-CITY ?AUTO_6825 ?AUTO_6830 ) ( not ( = ?AUTO_6825 ?AUTO_6828 ) ) ( AIRPORT ?AUTO_6831 ) ( AIRPORT ?AUTO_6828 ) ( not ( = ?AUTO_6831 ?AUTO_6828 ) ) ( not ( = ?AUTO_6825 ?AUTO_6831 ) ) ( AIRPORT ?AUTO_6832 ) ( not ( = ?AUTO_6832 ?AUTO_6831 ) ) ( not ( = ?AUTO_6825 ?AUTO_6832 ) ) ( not ( = ?AUTO_6828 ?AUTO_6832 ) ) ( AIRPLANE-AT ?AUTO_6829 ?AUTO_6828 ) ( IN-TRUCK ?AUTO_6824 ?AUTO_6827 ) ( not ( = ?AUTO_6826 ?AUTO_6827 ) ) ( TRUCK-AT ?AUTO_6827 ?AUTO_6833 ) ( IN-CITY ?AUTO_6833 ?AUTO_6834 ) ( IN-CITY ?AUTO_6831 ?AUTO_6834 ) ( not ( = ?AUTO_6831 ?AUTO_6833 ) ) ( not ( = ?AUTO_6825 ?AUTO_6833 ) ) ( not ( = ?AUTO_6828 ?AUTO_6833 ) ) ( not ( = ?AUTO_6830 ?AUTO_6834 ) ) ( not ( = ?AUTO_6832 ?AUTO_6833 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6827 ?AUTO_6833 ?AUTO_6831 ?AUTO_6834 )
      ( DELIVER-PKG ?AUTO_6824 ?AUTO_6825 )
      ( DELIVER-PKG-VERIFY ?AUTO_6824 ?AUTO_6825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6839 - OBJ
      ?AUTO_6840 - LOCATION
    )
    :vars
    (
      ?AUTO_6847 - TRUCK
      ?AUTO_6844 - LOCATION
      ?AUTO_6841 - CITY
      ?AUTO_6845 - LOCATION
      ?AUTO_6843 - LOCATION
      ?AUTO_6849 - AIRPLANE
      ?AUTO_6842 - TRUCK
      ?AUTO_6848 - LOCATION
      ?AUTO_6846 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6847 ?AUTO_6844 ) ( IN-CITY ?AUTO_6844 ?AUTO_6841 ) ( IN-CITY ?AUTO_6840 ?AUTO_6841 ) ( not ( = ?AUTO_6840 ?AUTO_6844 ) ) ( AIRPORT ?AUTO_6845 ) ( AIRPORT ?AUTO_6844 ) ( not ( = ?AUTO_6845 ?AUTO_6844 ) ) ( not ( = ?AUTO_6840 ?AUTO_6845 ) ) ( AIRPORT ?AUTO_6843 ) ( not ( = ?AUTO_6843 ?AUTO_6845 ) ) ( not ( = ?AUTO_6840 ?AUTO_6843 ) ) ( not ( = ?AUTO_6844 ?AUTO_6843 ) ) ( AIRPLANE-AT ?AUTO_6849 ?AUTO_6844 ) ( not ( = ?AUTO_6847 ?AUTO_6842 ) ) ( TRUCK-AT ?AUTO_6842 ?AUTO_6848 ) ( IN-CITY ?AUTO_6848 ?AUTO_6846 ) ( IN-CITY ?AUTO_6845 ?AUTO_6846 ) ( not ( = ?AUTO_6845 ?AUTO_6848 ) ) ( not ( = ?AUTO_6840 ?AUTO_6848 ) ) ( not ( = ?AUTO_6844 ?AUTO_6848 ) ) ( not ( = ?AUTO_6841 ?AUTO_6846 ) ) ( not ( = ?AUTO_6843 ?AUTO_6848 ) ) ( OBJ-AT ?AUTO_6839 ?AUTO_6848 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6839 ?AUTO_6842 ?AUTO_6848 )
      ( DELIVER-PKG ?AUTO_6839 ?AUTO_6840 )
      ( DELIVER-PKG-VERIFY ?AUTO_6839 ?AUTO_6840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6872 - OBJ
      ?AUTO_6873 - LOCATION
    )
    :vars
    (
      ?AUTO_6874 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6874 ?AUTO_6873 ) ( IN-TRUCK ?AUTO_6872 ?AUTO_6874 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6872 ?AUTO_6874 ?AUTO_6873 )
      ( DELIVER-PKG-VERIFY ?AUTO_6872 ?AUTO_6873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6935 - OBJ
      ?AUTO_6936 - LOCATION
    )
    :vars
    (
      ?AUTO_6938 - LOCATION
      ?AUTO_6937 - CITY
      ?AUTO_6941 - AIRPLANE
      ?AUTO_6939 - LOCATION
      ?AUTO_6940 - TRUCK
      ?AUTO_6942 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6938 ?AUTO_6937 ) ( IN-CITY ?AUTO_6936 ?AUTO_6937 ) ( not ( = ?AUTO_6936 ?AUTO_6938 ) ) ( IN-AIRPLANE ?AUTO_6935 ?AUTO_6941 ) ( AIRPORT ?AUTO_6939 ) ( AIRPORT ?AUTO_6938 ) ( AIRPLANE-AT ?AUTO_6941 ?AUTO_6939 ) ( not ( = ?AUTO_6939 ?AUTO_6938 ) ) ( not ( = ?AUTO_6936 ?AUTO_6939 ) ) ( TRUCK-AT ?AUTO_6940 ?AUTO_6942 ) ( IN-CITY ?AUTO_6942 ?AUTO_6937 ) ( not ( = ?AUTO_6938 ?AUTO_6942 ) ) ( not ( = ?AUTO_6936 ?AUTO_6942 ) ) ( not ( = ?AUTO_6939 ?AUTO_6942 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6940 ?AUTO_6942 ?AUTO_6938 ?AUTO_6937 )
      ( DELIVER-PKG ?AUTO_6935 ?AUTO_6936 )
      ( DELIVER-PKG-VERIFY ?AUTO_6935 ?AUTO_6936 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6943 - OBJ
      ?AUTO_6944 - LOCATION
    )
    :vars
    (
      ?AUTO_6947 - LOCATION
      ?AUTO_6945 - CITY
      ?AUTO_6948 - LOCATION
      ?AUTO_6949 - AIRPLANE
      ?AUTO_6950 - TRUCK
      ?AUTO_6946 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6947 ?AUTO_6945 ) ( IN-CITY ?AUTO_6944 ?AUTO_6945 ) ( not ( = ?AUTO_6944 ?AUTO_6947 ) ) ( AIRPORT ?AUTO_6948 ) ( AIRPORT ?AUTO_6947 ) ( AIRPLANE-AT ?AUTO_6949 ?AUTO_6948 ) ( not ( = ?AUTO_6948 ?AUTO_6947 ) ) ( not ( = ?AUTO_6944 ?AUTO_6948 ) ) ( TRUCK-AT ?AUTO_6950 ?AUTO_6946 ) ( IN-CITY ?AUTO_6946 ?AUTO_6945 ) ( not ( = ?AUTO_6947 ?AUTO_6946 ) ) ( not ( = ?AUTO_6944 ?AUTO_6946 ) ) ( not ( = ?AUTO_6948 ?AUTO_6946 ) ) ( OBJ-AT ?AUTO_6943 ?AUTO_6948 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6943 ?AUTO_6949 ?AUTO_6948 )
      ( DELIVER-PKG ?AUTO_6943 ?AUTO_6944 )
      ( DELIVER-PKG-VERIFY ?AUTO_6943 ?AUTO_6944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6955 - OBJ
      ?AUTO_6956 - LOCATION
    )
    :vars
    (
      ?AUTO_6960 - LOCATION
      ?AUTO_6962 - CITY
      ?AUTO_6961 - LOCATION
      ?AUTO_6959 - AIRPLANE
      ?AUTO_6958 - TRUCK
      ?AUTO_6957 - LOCATION
      ?AUTO_6963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6960 ?AUTO_6962 ) ( IN-CITY ?AUTO_6956 ?AUTO_6962 ) ( not ( = ?AUTO_6956 ?AUTO_6960 ) ) ( AIRPORT ?AUTO_6961 ) ( AIRPORT ?AUTO_6960 ) ( AIRPLANE-AT ?AUTO_6959 ?AUTO_6961 ) ( not ( = ?AUTO_6961 ?AUTO_6960 ) ) ( not ( = ?AUTO_6956 ?AUTO_6961 ) ) ( TRUCK-AT ?AUTO_6958 ?AUTO_6957 ) ( IN-CITY ?AUTO_6957 ?AUTO_6962 ) ( not ( = ?AUTO_6960 ?AUTO_6957 ) ) ( not ( = ?AUTO_6956 ?AUTO_6957 ) ) ( not ( = ?AUTO_6961 ?AUTO_6957 ) ) ( TRUCK-AT ?AUTO_6963 ?AUTO_6961 ) ( IN-TRUCK ?AUTO_6955 ?AUTO_6963 ) ( not ( = ?AUTO_6958 ?AUTO_6963 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6955 ?AUTO_6963 ?AUTO_6961 )
      ( DELIVER-PKG ?AUTO_6955 ?AUTO_6956 )
      ( DELIVER-PKG-VERIFY ?AUTO_6955 ?AUTO_6956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6970 - OBJ
      ?AUTO_6971 - LOCATION
    )
    :vars
    (
      ?AUTO_6976 - LOCATION
      ?AUTO_6972 - CITY
      ?AUTO_6975 - LOCATION
      ?AUTO_6974 - AIRPLANE
      ?AUTO_6978 - TRUCK
      ?AUTO_6973 - LOCATION
      ?AUTO_6977 - TRUCK
      ?AUTO_6979 - LOCATION
      ?AUTO_6980 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6976 ?AUTO_6972 ) ( IN-CITY ?AUTO_6971 ?AUTO_6972 ) ( not ( = ?AUTO_6971 ?AUTO_6976 ) ) ( AIRPORT ?AUTO_6975 ) ( AIRPORT ?AUTO_6976 ) ( AIRPLANE-AT ?AUTO_6974 ?AUTO_6975 ) ( not ( = ?AUTO_6975 ?AUTO_6976 ) ) ( not ( = ?AUTO_6971 ?AUTO_6975 ) ) ( TRUCK-AT ?AUTO_6978 ?AUTO_6973 ) ( IN-CITY ?AUTO_6973 ?AUTO_6972 ) ( not ( = ?AUTO_6976 ?AUTO_6973 ) ) ( not ( = ?AUTO_6971 ?AUTO_6973 ) ) ( not ( = ?AUTO_6975 ?AUTO_6973 ) ) ( IN-TRUCK ?AUTO_6970 ?AUTO_6977 ) ( not ( = ?AUTO_6978 ?AUTO_6977 ) ) ( TRUCK-AT ?AUTO_6977 ?AUTO_6979 ) ( IN-CITY ?AUTO_6979 ?AUTO_6980 ) ( IN-CITY ?AUTO_6975 ?AUTO_6980 ) ( not ( = ?AUTO_6975 ?AUTO_6979 ) ) ( not ( = ?AUTO_6971 ?AUTO_6979 ) ) ( not ( = ?AUTO_6976 ?AUTO_6979 ) ) ( not ( = ?AUTO_6972 ?AUTO_6980 ) ) ( not ( = ?AUTO_6973 ?AUTO_6979 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6977 ?AUTO_6979 ?AUTO_6975 ?AUTO_6980 )
      ( DELIVER-PKG ?AUTO_6970 ?AUTO_6971 )
      ( DELIVER-PKG-VERIFY ?AUTO_6970 ?AUTO_6971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6981 - OBJ
      ?AUTO_6982 - LOCATION
    )
    :vars
    (
      ?AUTO_6986 - LOCATION
      ?AUTO_6989 - CITY
      ?AUTO_6991 - LOCATION
      ?AUTO_6987 - AIRPLANE
      ?AUTO_6985 - TRUCK
      ?AUTO_6990 - LOCATION
      ?AUTO_6984 - TRUCK
      ?AUTO_6988 - LOCATION
      ?AUTO_6983 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6986 ?AUTO_6989 ) ( IN-CITY ?AUTO_6982 ?AUTO_6989 ) ( not ( = ?AUTO_6982 ?AUTO_6986 ) ) ( AIRPORT ?AUTO_6991 ) ( AIRPORT ?AUTO_6986 ) ( AIRPLANE-AT ?AUTO_6987 ?AUTO_6991 ) ( not ( = ?AUTO_6991 ?AUTO_6986 ) ) ( not ( = ?AUTO_6982 ?AUTO_6991 ) ) ( TRUCK-AT ?AUTO_6985 ?AUTO_6990 ) ( IN-CITY ?AUTO_6990 ?AUTO_6989 ) ( not ( = ?AUTO_6986 ?AUTO_6990 ) ) ( not ( = ?AUTO_6982 ?AUTO_6990 ) ) ( not ( = ?AUTO_6991 ?AUTO_6990 ) ) ( not ( = ?AUTO_6985 ?AUTO_6984 ) ) ( TRUCK-AT ?AUTO_6984 ?AUTO_6988 ) ( IN-CITY ?AUTO_6988 ?AUTO_6983 ) ( IN-CITY ?AUTO_6991 ?AUTO_6983 ) ( not ( = ?AUTO_6991 ?AUTO_6988 ) ) ( not ( = ?AUTO_6982 ?AUTO_6988 ) ) ( not ( = ?AUTO_6986 ?AUTO_6988 ) ) ( not ( = ?AUTO_6989 ?AUTO_6983 ) ) ( not ( = ?AUTO_6990 ?AUTO_6988 ) ) ( OBJ-AT ?AUTO_6981 ?AUTO_6988 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6981 ?AUTO_6984 ?AUTO_6988 )
      ( DELIVER-PKG ?AUTO_6981 ?AUTO_6982 )
      ( DELIVER-PKG-VERIFY ?AUTO_6981 ?AUTO_6982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7000 - OBJ
      ?AUTO_7001 - LOCATION
    )
    :vars
    (
      ?AUTO_7002 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7002 ?AUTO_7001 ) ( IN-TRUCK ?AUTO_7000 ?AUTO_7002 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7000 ?AUTO_7002 ?AUTO_7001 )
      ( DELIVER-PKG-VERIFY ?AUTO_7000 ?AUTO_7001 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7063 - OBJ
      ?AUTO_7064 - LOCATION
    )
    :vars
    (
      ?AUTO_7069 - LOCATION
      ?AUTO_7065 - CITY
      ?AUTO_7067 - LOCATION
      ?AUTO_7070 - LOCATION
      ?AUTO_7068 - AIRPLANE
      ?AUTO_7066 - TRUCK
      ?AUTO_7071 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7069 ?AUTO_7065 ) ( IN-CITY ?AUTO_7064 ?AUTO_7065 ) ( not ( = ?AUTO_7064 ?AUTO_7069 ) ) ( AIRPORT ?AUTO_7067 ) ( AIRPORT ?AUTO_7069 ) ( not ( = ?AUTO_7067 ?AUTO_7069 ) ) ( not ( = ?AUTO_7064 ?AUTO_7067 ) ) ( OBJ-AT ?AUTO_7063 ?AUTO_7067 ) ( AIRPORT ?AUTO_7070 ) ( AIRPLANE-AT ?AUTO_7068 ?AUTO_7070 ) ( not ( = ?AUTO_7070 ?AUTO_7067 ) ) ( not ( = ?AUTO_7064 ?AUTO_7070 ) ) ( not ( = ?AUTO_7069 ?AUTO_7070 ) ) ( TRUCK-AT ?AUTO_7066 ?AUTO_7071 ) ( IN-CITY ?AUTO_7071 ?AUTO_7065 ) ( not ( = ?AUTO_7069 ?AUTO_7071 ) ) ( not ( = ?AUTO_7064 ?AUTO_7071 ) ) ( not ( = ?AUTO_7067 ?AUTO_7071 ) ) ( not ( = ?AUTO_7070 ?AUTO_7071 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7066 ?AUTO_7071 ?AUTO_7069 ?AUTO_7065 )
      ( DELIVER-PKG ?AUTO_7063 ?AUTO_7064 )
      ( DELIVER-PKG-VERIFY ?AUTO_7063 ?AUTO_7064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7078 - OBJ
      ?AUTO_7079 - LOCATION
    )
    :vars
    (
      ?AUTO_7085 - LOCATION
      ?AUTO_7084 - CITY
      ?AUTO_7086 - LOCATION
      ?AUTO_7082 - LOCATION
      ?AUTO_7083 - AIRPLANE
      ?AUTO_7080 - TRUCK
      ?AUTO_7081 - LOCATION
      ?AUTO_7087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7085 ?AUTO_7084 ) ( IN-CITY ?AUTO_7079 ?AUTO_7084 ) ( not ( = ?AUTO_7079 ?AUTO_7085 ) ) ( AIRPORT ?AUTO_7086 ) ( AIRPORT ?AUTO_7085 ) ( not ( = ?AUTO_7086 ?AUTO_7085 ) ) ( not ( = ?AUTO_7079 ?AUTO_7086 ) ) ( AIRPORT ?AUTO_7082 ) ( AIRPLANE-AT ?AUTO_7083 ?AUTO_7082 ) ( not ( = ?AUTO_7082 ?AUTO_7086 ) ) ( not ( = ?AUTO_7079 ?AUTO_7082 ) ) ( not ( = ?AUTO_7085 ?AUTO_7082 ) ) ( TRUCK-AT ?AUTO_7080 ?AUTO_7081 ) ( IN-CITY ?AUTO_7081 ?AUTO_7084 ) ( not ( = ?AUTO_7085 ?AUTO_7081 ) ) ( not ( = ?AUTO_7079 ?AUTO_7081 ) ) ( not ( = ?AUTO_7086 ?AUTO_7081 ) ) ( not ( = ?AUTO_7082 ?AUTO_7081 ) ) ( TRUCK-AT ?AUTO_7087 ?AUTO_7086 ) ( IN-TRUCK ?AUTO_7078 ?AUTO_7087 ) ( not ( = ?AUTO_7080 ?AUTO_7087 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7078 ?AUTO_7087 ?AUTO_7086 )
      ( DELIVER-PKG ?AUTO_7078 ?AUTO_7079 )
      ( DELIVER-PKG-VERIFY ?AUTO_7078 ?AUTO_7079 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7092 - OBJ
      ?AUTO_7093 - LOCATION
    )
    :vars
    (
      ?AUTO_7095 - LOCATION
      ?AUTO_7094 - CITY
      ?AUTO_7097 - LOCATION
      ?AUTO_7098 - LOCATION
      ?AUTO_7099 - AIRPLANE
      ?AUTO_7096 - TRUCK
      ?AUTO_7100 - LOCATION
      ?AUTO_7101 - TRUCK
      ?AUTO_7102 - LOCATION
      ?AUTO_7103 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7095 ?AUTO_7094 ) ( IN-CITY ?AUTO_7093 ?AUTO_7094 ) ( not ( = ?AUTO_7093 ?AUTO_7095 ) ) ( AIRPORT ?AUTO_7097 ) ( AIRPORT ?AUTO_7095 ) ( not ( = ?AUTO_7097 ?AUTO_7095 ) ) ( not ( = ?AUTO_7093 ?AUTO_7097 ) ) ( AIRPORT ?AUTO_7098 ) ( AIRPLANE-AT ?AUTO_7099 ?AUTO_7098 ) ( not ( = ?AUTO_7098 ?AUTO_7097 ) ) ( not ( = ?AUTO_7093 ?AUTO_7098 ) ) ( not ( = ?AUTO_7095 ?AUTO_7098 ) ) ( TRUCK-AT ?AUTO_7096 ?AUTO_7100 ) ( IN-CITY ?AUTO_7100 ?AUTO_7094 ) ( not ( = ?AUTO_7095 ?AUTO_7100 ) ) ( not ( = ?AUTO_7093 ?AUTO_7100 ) ) ( not ( = ?AUTO_7097 ?AUTO_7100 ) ) ( not ( = ?AUTO_7098 ?AUTO_7100 ) ) ( IN-TRUCK ?AUTO_7092 ?AUTO_7101 ) ( not ( = ?AUTO_7096 ?AUTO_7101 ) ) ( TRUCK-AT ?AUTO_7101 ?AUTO_7102 ) ( IN-CITY ?AUTO_7102 ?AUTO_7103 ) ( IN-CITY ?AUTO_7097 ?AUTO_7103 ) ( not ( = ?AUTO_7097 ?AUTO_7102 ) ) ( not ( = ?AUTO_7093 ?AUTO_7102 ) ) ( not ( = ?AUTO_7095 ?AUTO_7102 ) ) ( not ( = ?AUTO_7094 ?AUTO_7103 ) ) ( not ( = ?AUTO_7098 ?AUTO_7102 ) ) ( not ( = ?AUTO_7100 ?AUTO_7102 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7101 ?AUTO_7102 ?AUTO_7097 ?AUTO_7103 )
      ( DELIVER-PKG ?AUTO_7092 ?AUTO_7093 )
      ( DELIVER-PKG-VERIFY ?AUTO_7092 ?AUTO_7093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7104 - OBJ
      ?AUTO_7105 - LOCATION
    )
    :vars
    (
      ?AUTO_7115 - LOCATION
      ?AUTO_7110 - CITY
      ?AUTO_7108 - LOCATION
      ?AUTO_7112 - LOCATION
      ?AUTO_7111 - AIRPLANE
      ?AUTO_7114 - TRUCK
      ?AUTO_7109 - LOCATION
      ?AUTO_7113 - TRUCK
      ?AUTO_7106 - LOCATION
      ?AUTO_7107 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7115 ?AUTO_7110 ) ( IN-CITY ?AUTO_7105 ?AUTO_7110 ) ( not ( = ?AUTO_7105 ?AUTO_7115 ) ) ( AIRPORT ?AUTO_7108 ) ( AIRPORT ?AUTO_7115 ) ( not ( = ?AUTO_7108 ?AUTO_7115 ) ) ( not ( = ?AUTO_7105 ?AUTO_7108 ) ) ( AIRPORT ?AUTO_7112 ) ( AIRPLANE-AT ?AUTO_7111 ?AUTO_7112 ) ( not ( = ?AUTO_7112 ?AUTO_7108 ) ) ( not ( = ?AUTO_7105 ?AUTO_7112 ) ) ( not ( = ?AUTO_7115 ?AUTO_7112 ) ) ( TRUCK-AT ?AUTO_7114 ?AUTO_7109 ) ( IN-CITY ?AUTO_7109 ?AUTO_7110 ) ( not ( = ?AUTO_7115 ?AUTO_7109 ) ) ( not ( = ?AUTO_7105 ?AUTO_7109 ) ) ( not ( = ?AUTO_7108 ?AUTO_7109 ) ) ( not ( = ?AUTO_7112 ?AUTO_7109 ) ) ( not ( = ?AUTO_7114 ?AUTO_7113 ) ) ( TRUCK-AT ?AUTO_7113 ?AUTO_7106 ) ( IN-CITY ?AUTO_7106 ?AUTO_7107 ) ( IN-CITY ?AUTO_7108 ?AUTO_7107 ) ( not ( = ?AUTO_7108 ?AUTO_7106 ) ) ( not ( = ?AUTO_7105 ?AUTO_7106 ) ) ( not ( = ?AUTO_7115 ?AUTO_7106 ) ) ( not ( = ?AUTO_7110 ?AUTO_7107 ) ) ( not ( = ?AUTO_7112 ?AUTO_7106 ) ) ( not ( = ?AUTO_7109 ?AUTO_7106 ) ) ( OBJ-AT ?AUTO_7104 ?AUTO_7106 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7104 ?AUTO_7113 ?AUTO_7106 )
      ( DELIVER-PKG ?AUTO_7104 ?AUTO_7105 )
      ( DELIVER-PKG-VERIFY ?AUTO_7104 ?AUTO_7105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7124 - OBJ
      ?AUTO_7125 - LOCATION
    )
    :vars
    (
      ?AUTO_7131 - LOCATION
      ?AUTO_7132 - CITY
      ?AUTO_7126 - LOCATION
      ?AUTO_7130 - LOCATION
      ?AUTO_7127 - AIRPLANE
      ?AUTO_7134 - TRUCK
      ?AUTO_7133 - LOCATION
      ?AUTO_7129 - TRUCK
      ?AUTO_7128 - LOCATION
      ?AUTO_7135 - CITY
      ?AUTO_7136 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7131 ?AUTO_7132 ) ( IN-CITY ?AUTO_7125 ?AUTO_7132 ) ( not ( = ?AUTO_7125 ?AUTO_7131 ) ) ( AIRPORT ?AUTO_7126 ) ( AIRPORT ?AUTO_7131 ) ( not ( = ?AUTO_7126 ?AUTO_7131 ) ) ( not ( = ?AUTO_7125 ?AUTO_7126 ) ) ( AIRPORT ?AUTO_7130 ) ( AIRPLANE-AT ?AUTO_7127 ?AUTO_7130 ) ( not ( = ?AUTO_7130 ?AUTO_7126 ) ) ( not ( = ?AUTO_7125 ?AUTO_7130 ) ) ( not ( = ?AUTO_7131 ?AUTO_7130 ) ) ( TRUCK-AT ?AUTO_7134 ?AUTO_7133 ) ( IN-CITY ?AUTO_7133 ?AUTO_7132 ) ( not ( = ?AUTO_7131 ?AUTO_7133 ) ) ( not ( = ?AUTO_7125 ?AUTO_7133 ) ) ( not ( = ?AUTO_7126 ?AUTO_7133 ) ) ( not ( = ?AUTO_7130 ?AUTO_7133 ) ) ( not ( = ?AUTO_7134 ?AUTO_7129 ) ) ( IN-CITY ?AUTO_7128 ?AUTO_7135 ) ( IN-CITY ?AUTO_7126 ?AUTO_7135 ) ( not ( = ?AUTO_7126 ?AUTO_7128 ) ) ( not ( = ?AUTO_7125 ?AUTO_7128 ) ) ( not ( = ?AUTO_7131 ?AUTO_7128 ) ) ( not ( = ?AUTO_7132 ?AUTO_7135 ) ) ( not ( = ?AUTO_7130 ?AUTO_7128 ) ) ( not ( = ?AUTO_7133 ?AUTO_7128 ) ) ( OBJ-AT ?AUTO_7124 ?AUTO_7128 ) ( TRUCK-AT ?AUTO_7129 ?AUTO_7136 ) ( IN-CITY ?AUTO_7136 ?AUTO_7135 ) ( not ( = ?AUTO_7128 ?AUTO_7136 ) ) ( not ( = ?AUTO_7125 ?AUTO_7136 ) ) ( not ( = ?AUTO_7131 ?AUTO_7136 ) ) ( not ( = ?AUTO_7126 ?AUTO_7136 ) ) ( not ( = ?AUTO_7130 ?AUTO_7136 ) ) ( not ( = ?AUTO_7133 ?AUTO_7136 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7129 ?AUTO_7136 ?AUTO_7128 ?AUTO_7135 )
      ( DELIVER-PKG ?AUTO_7124 ?AUTO_7125 )
      ( DELIVER-PKG-VERIFY ?AUTO_7124 ?AUTO_7125 ) )
  )

)

