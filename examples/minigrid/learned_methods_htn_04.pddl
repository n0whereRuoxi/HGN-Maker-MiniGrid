( define ( domain minigrid )
  ( :requirements :strips :typing :equality :htn )
  ( :types door obj robot room )
  ( :predicates
    ( ROBOT-IN ?a - ROBOT ?b - ROOM )
    ( OBJ-IN ?c - OBJ ?d - ROOM )
    ( ON-ROBOT ?e - OBJ ?f - ROBOT )
    ( DOOR-ON ?g - DOOR ?h - ROOM )
    ( OPEN ?j - DOOR )
    ( LOCKED ?k - DOOR )
    ( KEY ?l - OBJ )
    ( PARCEL ?m - OBJ )
  )
  ( :action !PICK-UP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( OBJ-IN ?obj ?room ) )
    :effect
    ( and ( not ( OBJ-IN ?obj ?room ) ) ( ON-ROBOT ?obj ?robot ) )
  )
  ( :action !MOVE-TO
    :parameters
    (
      ?robot - ROBOT
      ?c1 - ROOM
      ?c2 - ROOM
      ?door - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( DOOR-ON ?door ?c2 ) ( OPEN ?door ) )
    :effect
    ( and ( not ( ROBOT-IN ?robot ?c1 ) ) ( ROBOT-IN ?robot ?c2 ) )
  )
  ( :action !DROP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( ON-ROBOT ?obj ?robot ) )
    :effect
    ( and ( OBJ-IN ?obj ?room ) ( not ( ON-ROBOT ?obj ?robot ) ) )
  )
  ( :action !OPEN
    :parameters
    (
      ?robot - ROBOT
      ?door - DOOR
      ?c1 - ROOM
      ?key - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( LOCKED ?door ) ( ON-ROBOT ?key ?robot ) ( KEY ?key ) )
    :effect
    ( and ( not ( LOCKED ?door ) ) ( OPEN ?door ) )
  )
  ( :method DELIVER-PKG-VERIFY
    :parameters
    (
      ?parcel - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( OBJ-IN ?parcel ?room ) )
    :subtasks
    (  )
  )

  ( :method PICK-UP-OBJ-VERIFY
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
    )
    :precondition
    ( and ( ON-ROBOT ?obj ?robot ) )
    :subtasks
    (  )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_2 - ROBOT
      ?auto_3 - OBJ
    )
    :vars
    (
      ?auto_5 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_2 ?auto_5 ) ( OBJ-IN ?auto_3 ?auto_5 ) )
    :subtasks
    ( ( !PICK-UP ?auto_2 ?auto_3 ?auto_5 )
      ( PICK-UP-OBJ-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_199 - ROBOT
      ?auto_200 - OBJ
    )
    :vars
    (
      ?auto_201 - ROOM
      ?auto_203 - DOOR
      ?auto_204 - ROOM
      ?auto_207 - ROOM
      ?auto_208 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_200 ?auto_201 ) ( DOOR-ON ?auto_203 ?auto_204 ) ( DOOR-ON ?auto_203 ?auto_201 ) ( OPEN ?auto_203 ) ( ROBOT-IN ?auto_199 ?auto_207 ) ( DOOR-ON ?auto_208 ?auto_207 ) ( DOOR-ON ?auto_208 ?auto_204 ) ( OPEN ?auto_208 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_199 ?auto_207 ?auto_204 ?auto_208 )
      ( PICK-UP-OBJ ?auto_199 ?auto_200 )
      ( PICK-UP-OBJ-VERIFY ?auto_199 ?auto_200 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_32 - ROBOT
      ?auto_33 - OBJ
    )
    :vars
    (
      ?auto_35 - ROOM
      ?auto_38 - ROOM
      ?auto_34 - DOOR
      ?auto_39 - ROBOT
      ?auto_40 - ROOM
      ?auto_42 - OBJ
    )
    :precondition
    ( and ( OBJ-IN ?auto_33 ?auto_35 ) ( ROBOT-IN ?auto_32 ?auto_38 ) ( DOOR-ON ?auto_34 ?auto_38 ) ( DOOR-ON ?auto_34 ?auto_35 ) ( ROBOT-IN ?auto_39 ?auto_40 ) ( DOOR-ON ?auto_34 ?auto_40 ) ( LOCKED ?auto_34 ) ( ON-ROBOT ?auto_42 ?auto_39 ) ( KEY ?auto_42 ) )
    :subtasks
    ( ( !OPEN ?auto_39 ?auto_34 ?auto_40 ?auto_42 )
      ( PICK-UP-OBJ ?auto_32 ?auto_33 )
      ( PICK-UP-OBJ-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_46 - ROBOT
      ?auto_44 - OBJ
    )
    :vars
    (
      ?auto_48 - ROOM
      ?auto_49 - DOOR
      ?auto_45 - ROOM
      ?auto_47 - OBJ
      ?auto_54 - ROOM
      ?auto_55 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_44 ?auto_48 ) ( DOOR-ON ?auto_49 ?auto_45 ) ( DOOR-ON ?auto_49 ?auto_48 ) ( LOCKED ?auto_49 ) ( ON-ROBOT ?auto_47 ?auto_46 ) ( KEY ?auto_47 ) ( ROBOT-IN ?auto_46 ?auto_54 ) ( DOOR-ON ?auto_55 ?auto_54 ) ( DOOR-ON ?auto_55 ?auto_45 ) ( OPEN ?auto_55 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_46 ?auto_54 ?auto_45 ?auto_55 )
      ( PICK-UP-OBJ ?auto_46 ?auto_44 )
      ( PICK-UP-OBJ-VERIFY ?auto_46 ?auto_44 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_57 - ROBOT
      ?auto_58 - OBJ
    )
    :vars
    (
      ?auto_59 - ROOM
      ?auto_61 - DOOR
      ?auto_66 - ROOM
      ?auto_60 - OBJ
      ?auto_65 - ROOM
      ?auto_64 - DOOR
      ?auto_68 - ROOM
    )
    :precondition
    ( and ( OBJ-IN ?auto_58 ?auto_59 ) ( DOOR-ON ?auto_61 ?auto_66 ) ( DOOR-ON ?auto_61 ?auto_59 ) ( LOCKED ?auto_61 ) ( KEY ?auto_60 ) ( ROBOT-IN ?auto_57 ?auto_65 ) ( DOOR-ON ?auto_64 ?auto_65 ) ( DOOR-ON ?auto_64 ?auto_66 ) ( OPEN ?auto_64 ) ( ROBOT-IN ?auto_57 ?auto_68 ) ( OBJ-IN ?auto_60 ?auto_68 ) )
    :subtasks
    ( ( !PICK-UP ?auto_57 ?auto_60 ?auto_68 )
      ( PICK-UP-OBJ ?auto_57 ?auto_58 )
      ( PICK-UP-OBJ-VERIFY ?auto_57 ?auto_58 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_70 - ROBOT
      ?auto_71 - OBJ
    )
    :vars
    (
      ?auto_79 - ROOM
      ?auto_78 - DOOR
      ?auto_80 - ROOM
      ?auto_76 - OBJ
      ?auto_74 - DOOR
      ?auto_72 - ROOM
      ?auto_82 - ROOM
      ?auto_83 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_71 ?auto_79 ) ( DOOR-ON ?auto_78 ?auto_80 ) ( DOOR-ON ?auto_78 ?auto_79 ) ( LOCKED ?auto_78 ) ( KEY ?auto_76 ) ( DOOR-ON ?auto_74 ?auto_72 ) ( DOOR-ON ?auto_74 ?auto_80 ) ( OPEN ?auto_74 ) ( OBJ-IN ?auto_76 ?auto_72 ) ( ROBOT-IN ?auto_70 ?auto_82 ) ( DOOR-ON ?auto_83 ?auto_82 ) ( DOOR-ON ?auto_83 ?auto_72 ) ( OPEN ?auto_83 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_70 ?auto_82 ?auto_72 ?auto_83 )
      ( PICK-UP-OBJ ?auto_70 ?auto_71 )
      ( PICK-UP-OBJ-VERIFY ?auto_70 ?auto_71 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_88 - OBJ
      ?auto_87 - ROOM
    )
    :vars
    (
      ?auto_89 - ROBOT
    )
    :precondition
    ( and ( ROBOT-IN ?auto_89 ?auto_87 ) ( ON-ROBOT ?auto_88 ?auto_89 ) )
    :subtasks
    ( ( !DROP ?auto_89 ?auto_88 ?auto_87 )
      ( DELIVER-PKG-VERIFY ?auto_88 ?auto_87 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_93 - OBJ
      ?auto_92 - ROOM
    )
    :vars
    (
      ?auto_94 - ROBOT
      ?auto_98 - ROOM
      ?auto_99 - DOOR
    )
    :precondition
    ( and ( ON-ROBOT ?auto_93 ?auto_94 ) ( ROBOT-IN ?auto_94 ?auto_98 ) ( DOOR-ON ?auto_99 ?auto_98 ) ( DOOR-ON ?auto_99 ?auto_92 ) ( OPEN ?auto_99 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_94 ?auto_98 ?auto_92 ?auto_99 )
      ( DELIVER-PKG ?auto_93 ?auto_92 )
      ( DELIVER-PKG-VERIFY ?auto_93 ?auto_92 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_102 - OBJ
      ?auto_101 - ROOM
    )
    :vars
    (
      ?auto_105 - ROBOT
      ?auto_103 - ROOM
      ?auto_106 - DOOR
      ?auto_109 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_105 ?auto_103 ) ( DOOR-ON ?auto_106 ?auto_103 ) ( DOOR-ON ?auto_106 ?auto_101 ) ( OPEN ?auto_106 ) ( ROBOT-IN ?auto_105 ?auto_109 ) ( OBJ-IN ?auto_102 ?auto_109 ) )
    :subtasks
    ( ( !PICK-UP ?auto_105 ?auto_102 ?auto_109 )
      ( DELIVER-PKG ?auto_102 ?auto_101 )
      ( DELIVER-PKG-VERIFY ?auto_102 ?auto_101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_263 - OBJ
      ?auto_262 - ROOM
    )
    :vars
    (
      ?auto_264 - DOOR
      ?auto_265 - ROOM
      ?auto_266 - DOOR
      ?auto_267 - ROOM
      ?auto_270 - ROBOT
      ?auto_272 - ROOM
      ?auto_273 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_264 ?auto_265 ) ( DOOR-ON ?auto_264 ?auto_262 ) ( OPEN ?auto_264 ) ( OBJ-IN ?auto_263 ?auto_265 ) ( DOOR-ON ?auto_266 ?auto_267 ) ( DOOR-ON ?auto_266 ?auto_265 ) ( OPEN ?auto_266 ) ( ROBOT-IN ?auto_270 ?auto_272 ) ( DOOR-ON ?auto_273 ?auto_272 ) ( DOOR-ON ?auto_273 ?auto_267 ) ( OPEN ?auto_273 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_270 ?auto_272 ?auto_267 ?auto_273 )
      ( DELIVER-PKG ?auto_263 ?auto_262 )
      ( DELIVER-PKG-VERIFY ?auto_263 ?auto_262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_124 - OBJ
      ?auto_123 - ROOM
    )
    :vars
    (
      ?auto_129 - DOOR
      ?auto_127 - ROOM
      ?auto_125 - ROBOT
      ?auto_126 - ROOM
      ?auto_132 - ROBOT
      ?auto_133 - ROOM
      ?auto_135 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_129 ?auto_127 ) ( DOOR-ON ?auto_129 ?auto_123 ) ( OBJ-IN ?auto_124 ?auto_127 ) ( ROBOT-IN ?auto_125 ?auto_126 ) ( DOOR-ON ?auto_129 ?auto_126 ) ( ROBOT-IN ?auto_132 ?auto_133 ) ( DOOR-ON ?auto_129 ?auto_133 ) ( LOCKED ?auto_129 ) ( ON-ROBOT ?auto_135 ?auto_132 ) ( KEY ?auto_135 ) )
    :subtasks
    ( ( !OPEN ?auto_132 ?auto_129 ?auto_133 ?auto_135 )
      ( DELIVER-PKG ?auto_124 ?auto_123 )
      ( DELIVER-PKG-VERIFY ?auto_124 ?auto_123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_137 - OBJ
      ?auto_136 - ROOM
    )
    :vars
    (
      ?auto_146 - DOOR
      ?auto_140 - ROOM
      ?auto_139 - ROOM
      ?auto_138 - OBJ
      ?auto_145 - ROBOT
      ?auto_148 - ROOM
      ?auto_149 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_146 ?auto_140 ) ( DOOR-ON ?auto_146 ?auto_136 ) ( OBJ-IN ?auto_137 ?auto_140 ) ( DOOR-ON ?auto_146 ?auto_139 ) ( LOCKED ?auto_146 ) ( ON-ROBOT ?auto_138 ?auto_145 ) ( KEY ?auto_138 ) ( ROBOT-IN ?auto_145 ?auto_148 ) ( DOOR-ON ?auto_149 ?auto_148 ) ( DOOR-ON ?auto_149 ?auto_139 ) ( OPEN ?auto_149 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_145 ?auto_148 ?auto_139 ?auto_149 )
      ( DELIVER-PKG ?auto_137 ?auto_136 )
      ( DELIVER-PKG-VERIFY ?auto_137 ?auto_136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_152 - OBJ
      ?auto_151 - ROOM
    )
    :vars
    (
      ?auto_161 - DOOR
      ?auto_156 - ROOM
      ?auto_154 - ROOM
      ?auto_159 - OBJ
      ?auto_153 - ROBOT
      ?auto_155 - ROOM
      ?auto_157 - DOOR
      ?auto_163 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_161 ?auto_156 ) ( DOOR-ON ?auto_161 ?auto_151 ) ( OBJ-IN ?auto_152 ?auto_156 ) ( DOOR-ON ?auto_161 ?auto_154 ) ( LOCKED ?auto_161 ) ( KEY ?auto_159 ) ( ROBOT-IN ?auto_153 ?auto_155 ) ( DOOR-ON ?auto_157 ?auto_155 ) ( DOOR-ON ?auto_157 ?auto_154 ) ( OPEN ?auto_157 ) ( ROBOT-IN ?auto_153 ?auto_163 ) ( OBJ-IN ?auto_159 ?auto_163 ) )
    :subtasks
    ( ( !PICK-UP ?auto_153 ?auto_159 ?auto_163 )
      ( DELIVER-PKG ?auto_152 ?auto_151 )
      ( DELIVER-PKG-VERIFY ?auto_152 ?auto_151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_166 - OBJ
      ?auto_165 - ROOM
    )
    :vars
    (
      ?auto_173 - DOOR
      ?auto_167 - ROOM
      ?auto_175 - ROOM
      ?auto_170 - OBJ
      ?auto_172 - DOOR
      ?auto_168 - ROOM
      ?auto_171 - ROBOT
      ?auto_178 - ROOM
      ?auto_179 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_173 ?auto_167 ) ( DOOR-ON ?auto_173 ?auto_165 ) ( OBJ-IN ?auto_166 ?auto_167 ) ( DOOR-ON ?auto_173 ?auto_175 ) ( LOCKED ?auto_173 ) ( KEY ?auto_170 ) ( DOOR-ON ?auto_172 ?auto_168 ) ( DOOR-ON ?auto_172 ?auto_175 ) ( OPEN ?auto_172 ) ( OBJ-IN ?auto_170 ?auto_168 ) ( ROBOT-IN ?auto_171 ?auto_178 ) ( DOOR-ON ?auto_179 ?auto_178 ) ( DOOR-ON ?auto_179 ?auto_168 ) ( OPEN ?auto_179 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_171 ?auto_178 ?auto_168 ?auto_179 )
      ( DELIVER-PKG ?auto_166 ?auto_165 )
      ( DELIVER-PKG-VERIFY ?auto_166 ?auto_165 ) )
  )

)