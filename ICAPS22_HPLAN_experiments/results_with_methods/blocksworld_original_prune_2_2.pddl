( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150 - BLOCK
      ?auto_151 - BLOCK
    )
    :vars
    (
      ?auto_152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152 ?auto_151 ) ( CLEAR ?auto_152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150 ) ( ON ?auto_151 ?auto_150 ) ( not ( = ?auto_150 ?auto_151 ) ) ( not ( = ?auto_150 ?auto_152 ) ) ( not ( = ?auto_151 ?auto_152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152 ?auto_151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155 - BLOCK
    )
    :vars
    (
      ?auto_156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155 ?auto_156 ) ( CLEAR ?auto_155 ) ( HAND-EMPTY ) ( not ( = ?auto_155 ?auto_156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155 ?auto_156 )
      ( MAKE-1PILE ?auto_155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_158 - BLOCK
    )
    :vars
    (
      ?auto_159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159 ?auto_158 ) ( CLEAR ?auto_159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158 ) ( not ( = ?auto_158 ?auto_159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159 ?auto_158 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_160 - BLOCK
    )
    :vars
    (
      ?auto_161 - BLOCK
      ?auto_162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161 ?auto_160 ) ( CLEAR ?auto_161 ) ( ON-TABLE ?auto_160 ) ( not ( = ?auto_160 ?auto_161 ) ) ( HOLDING ?auto_162 ) ( not ( = ?auto_160 ?auto_162 ) ) ( not ( = ?auto_161 ?auto_162 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_162 )
      ( MAKE-1PILE ?auto_160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163 - BLOCK
    )
    :vars
    (
      ?auto_165 - BLOCK
      ?auto_164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165 ?auto_163 ) ( ON-TABLE ?auto_163 ) ( not ( = ?auto_163 ?auto_165 ) ) ( not ( = ?auto_163 ?auto_164 ) ) ( not ( = ?auto_165 ?auto_164 ) ) ( ON ?auto_164 ?auto_165 ) ( CLEAR ?auto_164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163 ?auto_165 )
      ( MAKE-1PILE ?auto_163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168 - BLOCK
      ?auto_169 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169 ) ( CLEAR ?auto_168 ) ( ON-TABLE ?auto_168 ) ( not ( = ?auto_168 ?auto_169 ) ) )
    :subtasks
    ( ( !STACK ?auto_169 ?auto_168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170 - BLOCK
      ?auto_171 - BLOCK
    )
    :vars
    (
      ?auto_172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170 ) ( ON-TABLE ?auto_170 ) ( not ( = ?auto_170 ?auto_171 ) ) ( ON ?auto_171 ?auto_172 ) ( CLEAR ?auto_171 ) ( HAND-EMPTY ) ( not ( = ?auto_170 ?auto_172 ) ) ( not ( = ?auto_171 ?auto_172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171 ?auto_172 )
      ( MAKE-2PILE ?auto_170 ?auto_171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173 - BLOCK
      ?auto_174 - BLOCK
    )
    :vars
    (
      ?auto_175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173 ?auto_174 ) ) ( ON ?auto_174 ?auto_175 ) ( CLEAR ?auto_174 ) ( not ( = ?auto_173 ?auto_175 ) ) ( not ( = ?auto_174 ?auto_175 ) ) ( HOLDING ?auto_173 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173 )
      ( MAKE-2PILE ?auto_173 ?auto_174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176 - BLOCK
      ?auto_177 - BLOCK
    )
    :vars
    (
      ?auto_178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176 ?auto_177 ) ) ( ON ?auto_177 ?auto_178 ) ( not ( = ?auto_176 ?auto_178 ) ) ( not ( = ?auto_177 ?auto_178 ) ) ( ON ?auto_176 ?auto_177 ) ( CLEAR ?auto_176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178 ?auto_177 )
      ( MAKE-2PILE ?auto_176 ?auto_177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195 - BLOCK
    )
    :vars
    (
      ?auto_196 - BLOCK
      ?auto_197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195 ?auto_196 ) ( CLEAR ?auto_195 ) ( not ( = ?auto_195 ?auto_196 ) ) ( HOLDING ?auto_197 ) ( not ( = ?auto_195 ?auto_197 ) ) ( not ( = ?auto_196 ?auto_197 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_197 )
      ( MAKE-1PILE ?auto_195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_198 - BLOCK
    )
    :vars
    (
      ?auto_200 - BLOCK
      ?auto_199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198 ?auto_200 ) ( not ( = ?auto_198 ?auto_200 ) ) ( not ( = ?auto_198 ?auto_199 ) ) ( not ( = ?auto_200 ?auto_199 ) ) ( ON ?auto_199 ?auto_198 ) ( CLEAR ?auto_199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200 ?auto_198 )
      ( MAKE-1PILE ?auto_198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205 - BLOCK
      ?auto_206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205 ) ( ON-TABLE ?auto_205 ) ( not ( = ?auto_205 ?auto_206 ) ) ( ON-TABLE ?auto_206 ) ( CLEAR ?auto_206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_206 )
      ( MAKE-2PILE ?auto_205 ?auto_206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207 - BLOCK
      ?auto_208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207 ?auto_208 ) ) ( ON-TABLE ?auto_208 ) ( CLEAR ?auto_208 ) ( HOLDING ?auto_207 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207 )
      ( MAKE-2PILE ?auto_207 ?auto_208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209 - BLOCK
      ?auto_210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209 ?auto_210 ) ) ( ON-TABLE ?auto_210 ) ( ON ?auto_209 ?auto_210 ) ( CLEAR ?auto_209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210 )
      ( MAKE-2PILE ?auto_209 ?auto_210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213 - BLOCK
      ?auto_214 - BLOCK
    )
    :vars
    (
      ?auto_215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213 ?auto_214 ) ) ( ON-TABLE ?auto_214 ) ( CLEAR ?auto_214 ) ( ON ?auto_213 ?auto_215 ) ( CLEAR ?auto_213 ) ( HAND-EMPTY ) ( not ( = ?auto_213 ?auto_215 ) ) ( not ( = ?auto_214 ?auto_215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213 ?auto_215 )
      ( MAKE-2PILE ?auto_213 ?auto_214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216 - BLOCK
      ?auto_217 - BLOCK
    )
    :vars
    (
      ?auto_218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216 ?auto_217 ) ) ( ON ?auto_216 ?auto_218 ) ( CLEAR ?auto_216 ) ( not ( = ?auto_216 ?auto_218 ) ) ( not ( = ?auto_217 ?auto_218 ) ) ( HOLDING ?auto_217 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217 )
      ( MAKE-2PILE ?auto_216 ?auto_217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_219 - BLOCK
      ?auto_220 - BLOCK
    )
    :vars
    (
      ?auto_221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_219 ?auto_220 ) ) ( ON ?auto_219 ?auto_221 ) ( not ( = ?auto_219 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_221 ) ) ( ON ?auto_220 ?auto_219 ) ( CLEAR ?auto_220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_221 ?auto_219 )
      ( MAKE-2PILE ?auto_219 ?auto_220 ) )
  )

)

