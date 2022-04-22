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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143145 - BLOCK
      ?auto_143146 - BLOCK
      ?auto_143147 - BLOCK
      ?auto_143148 - BLOCK
      ?auto_143149 - BLOCK
      ?auto_143150 - BLOCK
      ?auto_143151 - BLOCK
      ?auto_143152 - BLOCK
    )
    :vars
    (
      ?auto_143153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143153 ?auto_143152 ) ( CLEAR ?auto_143153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143145 ) ( ON ?auto_143146 ?auto_143145 ) ( ON ?auto_143147 ?auto_143146 ) ( ON ?auto_143148 ?auto_143147 ) ( ON ?auto_143149 ?auto_143148 ) ( ON ?auto_143150 ?auto_143149 ) ( ON ?auto_143151 ?auto_143150 ) ( ON ?auto_143152 ?auto_143151 ) ( not ( = ?auto_143145 ?auto_143146 ) ) ( not ( = ?auto_143145 ?auto_143147 ) ) ( not ( = ?auto_143145 ?auto_143148 ) ) ( not ( = ?auto_143145 ?auto_143149 ) ) ( not ( = ?auto_143145 ?auto_143150 ) ) ( not ( = ?auto_143145 ?auto_143151 ) ) ( not ( = ?auto_143145 ?auto_143152 ) ) ( not ( = ?auto_143145 ?auto_143153 ) ) ( not ( = ?auto_143146 ?auto_143147 ) ) ( not ( = ?auto_143146 ?auto_143148 ) ) ( not ( = ?auto_143146 ?auto_143149 ) ) ( not ( = ?auto_143146 ?auto_143150 ) ) ( not ( = ?auto_143146 ?auto_143151 ) ) ( not ( = ?auto_143146 ?auto_143152 ) ) ( not ( = ?auto_143146 ?auto_143153 ) ) ( not ( = ?auto_143147 ?auto_143148 ) ) ( not ( = ?auto_143147 ?auto_143149 ) ) ( not ( = ?auto_143147 ?auto_143150 ) ) ( not ( = ?auto_143147 ?auto_143151 ) ) ( not ( = ?auto_143147 ?auto_143152 ) ) ( not ( = ?auto_143147 ?auto_143153 ) ) ( not ( = ?auto_143148 ?auto_143149 ) ) ( not ( = ?auto_143148 ?auto_143150 ) ) ( not ( = ?auto_143148 ?auto_143151 ) ) ( not ( = ?auto_143148 ?auto_143152 ) ) ( not ( = ?auto_143148 ?auto_143153 ) ) ( not ( = ?auto_143149 ?auto_143150 ) ) ( not ( = ?auto_143149 ?auto_143151 ) ) ( not ( = ?auto_143149 ?auto_143152 ) ) ( not ( = ?auto_143149 ?auto_143153 ) ) ( not ( = ?auto_143150 ?auto_143151 ) ) ( not ( = ?auto_143150 ?auto_143152 ) ) ( not ( = ?auto_143150 ?auto_143153 ) ) ( not ( = ?auto_143151 ?auto_143152 ) ) ( not ( = ?auto_143151 ?auto_143153 ) ) ( not ( = ?auto_143152 ?auto_143153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143153 ?auto_143152 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_143155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143155 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_143155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_143156 - BLOCK
    )
    :vars
    (
      ?auto_143157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143156 ?auto_143157 ) ( CLEAR ?auto_143156 ) ( HAND-EMPTY ) ( not ( = ?auto_143156 ?auto_143157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143156 ?auto_143157 )
      ( MAKE-1PILE ?auto_143156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143165 - BLOCK
      ?auto_143166 - BLOCK
      ?auto_143167 - BLOCK
      ?auto_143168 - BLOCK
      ?auto_143169 - BLOCK
      ?auto_143170 - BLOCK
      ?auto_143171 - BLOCK
    )
    :vars
    (
      ?auto_143172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143172 ?auto_143171 ) ( CLEAR ?auto_143172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143165 ) ( ON ?auto_143166 ?auto_143165 ) ( ON ?auto_143167 ?auto_143166 ) ( ON ?auto_143168 ?auto_143167 ) ( ON ?auto_143169 ?auto_143168 ) ( ON ?auto_143170 ?auto_143169 ) ( ON ?auto_143171 ?auto_143170 ) ( not ( = ?auto_143165 ?auto_143166 ) ) ( not ( = ?auto_143165 ?auto_143167 ) ) ( not ( = ?auto_143165 ?auto_143168 ) ) ( not ( = ?auto_143165 ?auto_143169 ) ) ( not ( = ?auto_143165 ?auto_143170 ) ) ( not ( = ?auto_143165 ?auto_143171 ) ) ( not ( = ?auto_143165 ?auto_143172 ) ) ( not ( = ?auto_143166 ?auto_143167 ) ) ( not ( = ?auto_143166 ?auto_143168 ) ) ( not ( = ?auto_143166 ?auto_143169 ) ) ( not ( = ?auto_143166 ?auto_143170 ) ) ( not ( = ?auto_143166 ?auto_143171 ) ) ( not ( = ?auto_143166 ?auto_143172 ) ) ( not ( = ?auto_143167 ?auto_143168 ) ) ( not ( = ?auto_143167 ?auto_143169 ) ) ( not ( = ?auto_143167 ?auto_143170 ) ) ( not ( = ?auto_143167 ?auto_143171 ) ) ( not ( = ?auto_143167 ?auto_143172 ) ) ( not ( = ?auto_143168 ?auto_143169 ) ) ( not ( = ?auto_143168 ?auto_143170 ) ) ( not ( = ?auto_143168 ?auto_143171 ) ) ( not ( = ?auto_143168 ?auto_143172 ) ) ( not ( = ?auto_143169 ?auto_143170 ) ) ( not ( = ?auto_143169 ?auto_143171 ) ) ( not ( = ?auto_143169 ?auto_143172 ) ) ( not ( = ?auto_143170 ?auto_143171 ) ) ( not ( = ?auto_143170 ?auto_143172 ) ) ( not ( = ?auto_143171 ?auto_143172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143172 ?auto_143171 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143173 - BLOCK
      ?auto_143174 - BLOCK
      ?auto_143175 - BLOCK
      ?auto_143176 - BLOCK
      ?auto_143177 - BLOCK
      ?auto_143178 - BLOCK
      ?auto_143179 - BLOCK
    )
    :vars
    (
      ?auto_143180 - BLOCK
      ?auto_143181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143180 ?auto_143179 ) ( CLEAR ?auto_143180 ) ( ON-TABLE ?auto_143173 ) ( ON ?auto_143174 ?auto_143173 ) ( ON ?auto_143175 ?auto_143174 ) ( ON ?auto_143176 ?auto_143175 ) ( ON ?auto_143177 ?auto_143176 ) ( ON ?auto_143178 ?auto_143177 ) ( ON ?auto_143179 ?auto_143178 ) ( not ( = ?auto_143173 ?auto_143174 ) ) ( not ( = ?auto_143173 ?auto_143175 ) ) ( not ( = ?auto_143173 ?auto_143176 ) ) ( not ( = ?auto_143173 ?auto_143177 ) ) ( not ( = ?auto_143173 ?auto_143178 ) ) ( not ( = ?auto_143173 ?auto_143179 ) ) ( not ( = ?auto_143173 ?auto_143180 ) ) ( not ( = ?auto_143174 ?auto_143175 ) ) ( not ( = ?auto_143174 ?auto_143176 ) ) ( not ( = ?auto_143174 ?auto_143177 ) ) ( not ( = ?auto_143174 ?auto_143178 ) ) ( not ( = ?auto_143174 ?auto_143179 ) ) ( not ( = ?auto_143174 ?auto_143180 ) ) ( not ( = ?auto_143175 ?auto_143176 ) ) ( not ( = ?auto_143175 ?auto_143177 ) ) ( not ( = ?auto_143175 ?auto_143178 ) ) ( not ( = ?auto_143175 ?auto_143179 ) ) ( not ( = ?auto_143175 ?auto_143180 ) ) ( not ( = ?auto_143176 ?auto_143177 ) ) ( not ( = ?auto_143176 ?auto_143178 ) ) ( not ( = ?auto_143176 ?auto_143179 ) ) ( not ( = ?auto_143176 ?auto_143180 ) ) ( not ( = ?auto_143177 ?auto_143178 ) ) ( not ( = ?auto_143177 ?auto_143179 ) ) ( not ( = ?auto_143177 ?auto_143180 ) ) ( not ( = ?auto_143178 ?auto_143179 ) ) ( not ( = ?auto_143178 ?auto_143180 ) ) ( not ( = ?auto_143179 ?auto_143180 ) ) ( HOLDING ?auto_143181 ) ( not ( = ?auto_143173 ?auto_143181 ) ) ( not ( = ?auto_143174 ?auto_143181 ) ) ( not ( = ?auto_143175 ?auto_143181 ) ) ( not ( = ?auto_143176 ?auto_143181 ) ) ( not ( = ?auto_143177 ?auto_143181 ) ) ( not ( = ?auto_143178 ?auto_143181 ) ) ( not ( = ?auto_143179 ?auto_143181 ) ) ( not ( = ?auto_143180 ?auto_143181 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_143181 )
      ( MAKE-7PILE ?auto_143173 ?auto_143174 ?auto_143175 ?auto_143176 ?auto_143177 ?auto_143178 ?auto_143179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143182 - BLOCK
      ?auto_143183 - BLOCK
      ?auto_143184 - BLOCK
      ?auto_143185 - BLOCK
      ?auto_143186 - BLOCK
      ?auto_143187 - BLOCK
      ?auto_143188 - BLOCK
    )
    :vars
    (
      ?auto_143190 - BLOCK
      ?auto_143189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143190 ?auto_143188 ) ( ON-TABLE ?auto_143182 ) ( ON ?auto_143183 ?auto_143182 ) ( ON ?auto_143184 ?auto_143183 ) ( ON ?auto_143185 ?auto_143184 ) ( ON ?auto_143186 ?auto_143185 ) ( ON ?auto_143187 ?auto_143186 ) ( ON ?auto_143188 ?auto_143187 ) ( not ( = ?auto_143182 ?auto_143183 ) ) ( not ( = ?auto_143182 ?auto_143184 ) ) ( not ( = ?auto_143182 ?auto_143185 ) ) ( not ( = ?auto_143182 ?auto_143186 ) ) ( not ( = ?auto_143182 ?auto_143187 ) ) ( not ( = ?auto_143182 ?auto_143188 ) ) ( not ( = ?auto_143182 ?auto_143190 ) ) ( not ( = ?auto_143183 ?auto_143184 ) ) ( not ( = ?auto_143183 ?auto_143185 ) ) ( not ( = ?auto_143183 ?auto_143186 ) ) ( not ( = ?auto_143183 ?auto_143187 ) ) ( not ( = ?auto_143183 ?auto_143188 ) ) ( not ( = ?auto_143183 ?auto_143190 ) ) ( not ( = ?auto_143184 ?auto_143185 ) ) ( not ( = ?auto_143184 ?auto_143186 ) ) ( not ( = ?auto_143184 ?auto_143187 ) ) ( not ( = ?auto_143184 ?auto_143188 ) ) ( not ( = ?auto_143184 ?auto_143190 ) ) ( not ( = ?auto_143185 ?auto_143186 ) ) ( not ( = ?auto_143185 ?auto_143187 ) ) ( not ( = ?auto_143185 ?auto_143188 ) ) ( not ( = ?auto_143185 ?auto_143190 ) ) ( not ( = ?auto_143186 ?auto_143187 ) ) ( not ( = ?auto_143186 ?auto_143188 ) ) ( not ( = ?auto_143186 ?auto_143190 ) ) ( not ( = ?auto_143187 ?auto_143188 ) ) ( not ( = ?auto_143187 ?auto_143190 ) ) ( not ( = ?auto_143188 ?auto_143190 ) ) ( not ( = ?auto_143182 ?auto_143189 ) ) ( not ( = ?auto_143183 ?auto_143189 ) ) ( not ( = ?auto_143184 ?auto_143189 ) ) ( not ( = ?auto_143185 ?auto_143189 ) ) ( not ( = ?auto_143186 ?auto_143189 ) ) ( not ( = ?auto_143187 ?auto_143189 ) ) ( not ( = ?auto_143188 ?auto_143189 ) ) ( not ( = ?auto_143190 ?auto_143189 ) ) ( ON ?auto_143189 ?auto_143190 ) ( CLEAR ?auto_143189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143182 ?auto_143183 ?auto_143184 ?auto_143185 ?auto_143186 ?auto_143187 ?auto_143188 ?auto_143190 )
      ( MAKE-7PILE ?auto_143182 ?auto_143183 ?auto_143184 ?auto_143185 ?auto_143186 ?auto_143187 ?auto_143188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143193 - BLOCK
      ?auto_143194 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143194 ) ( CLEAR ?auto_143193 ) ( ON-TABLE ?auto_143193 ) ( not ( = ?auto_143193 ?auto_143194 ) ) )
    :subtasks
    ( ( !STACK ?auto_143194 ?auto_143193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143195 - BLOCK
      ?auto_143196 - BLOCK
    )
    :vars
    (
      ?auto_143197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143195 ) ( ON-TABLE ?auto_143195 ) ( not ( = ?auto_143195 ?auto_143196 ) ) ( ON ?auto_143196 ?auto_143197 ) ( CLEAR ?auto_143196 ) ( HAND-EMPTY ) ( not ( = ?auto_143195 ?auto_143197 ) ) ( not ( = ?auto_143196 ?auto_143197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143196 ?auto_143197 )
      ( MAKE-2PILE ?auto_143195 ?auto_143196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143198 - BLOCK
      ?auto_143199 - BLOCK
    )
    :vars
    (
      ?auto_143200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143198 ?auto_143199 ) ) ( ON ?auto_143199 ?auto_143200 ) ( CLEAR ?auto_143199 ) ( not ( = ?auto_143198 ?auto_143200 ) ) ( not ( = ?auto_143199 ?auto_143200 ) ) ( HOLDING ?auto_143198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143198 )
      ( MAKE-2PILE ?auto_143198 ?auto_143199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143201 - BLOCK
      ?auto_143202 - BLOCK
    )
    :vars
    (
      ?auto_143203 - BLOCK
      ?auto_143209 - BLOCK
      ?auto_143208 - BLOCK
      ?auto_143207 - BLOCK
      ?auto_143204 - BLOCK
      ?auto_143206 - BLOCK
      ?auto_143205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143201 ?auto_143202 ) ) ( ON ?auto_143202 ?auto_143203 ) ( not ( = ?auto_143201 ?auto_143203 ) ) ( not ( = ?auto_143202 ?auto_143203 ) ) ( ON ?auto_143201 ?auto_143202 ) ( CLEAR ?auto_143201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143209 ) ( ON ?auto_143208 ?auto_143209 ) ( ON ?auto_143207 ?auto_143208 ) ( ON ?auto_143204 ?auto_143207 ) ( ON ?auto_143206 ?auto_143204 ) ( ON ?auto_143205 ?auto_143206 ) ( ON ?auto_143203 ?auto_143205 ) ( not ( = ?auto_143209 ?auto_143208 ) ) ( not ( = ?auto_143209 ?auto_143207 ) ) ( not ( = ?auto_143209 ?auto_143204 ) ) ( not ( = ?auto_143209 ?auto_143206 ) ) ( not ( = ?auto_143209 ?auto_143205 ) ) ( not ( = ?auto_143209 ?auto_143203 ) ) ( not ( = ?auto_143209 ?auto_143202 ) ) ( not ( = ?auto_143209 ?auto_143201 ) ) ( not ( = ?auto_143208 ?auto_143207 ) ) ( not ( = ?auto_143208 ?auto_143204 ) ) ( not ( = ?auto_143208 ?auto_143206 ) ) ( not ( = ?auto_143208 ?auto_143205 ) ) ( not ( = ?auto_143208 ?auto_143203 ) ) ( not ( = ?auto_143208 ?auto_143202 ) ) ( not ( = ?auto_143208 ?auto_143201 ) ) ( not ( = ?auto_143207 ?auto_143204 ) ) ( not ( = ?auto_143207 ?auto_143206 ) ) ( not ( = ?auto_143207 ?auto_143205 ) ) ( not ( = ?auto_143207 ?auto_143203 ) ) ( not ( = ?auto_143207 ?auto_143202 ) ) ( not ( = ?auto_143207 ?auto_143201 ) ) ( not ( = ?auto_143204 ?auto_143206 ) ) ( not ( = ?auto_143204 ?auto_143205 ) ) ( not ( = ?auto_143204 ?auto_143203 ) ) ( not ( = ?auto_143204 ?auto_143202 ) ) ( not ( = ?auto_143204 ?auto_143201 ) ) ( not ( = ?auto_143206 ?auto_143205 ) ) ( not ( = ?auto_143206 ?auto_143203 ) ) ( not ( = ?auto_143206 ?auto_143202 ) ) ( not ( = ?auto_143206 ?auto_143201 ) ) ( not ( = ?auto_143205 ?auto_143203 ) ) ( not ( = ?auto_143205 ?auto_143202 ) ) ( not ( = ?auto_143205 ?auto_143201 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143209 ?auto_143208 ?auto_143207 ?auto_143204 ?auto_143206 ?auto_143205 ?auto_143203 ?auto_143202 )
      ( MAKE-2PILE ?auto_143201 ?auto_143202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143216 - BLOCK
      ?auto_143217 - BLOCK
      ?auto_143218 - BLOCK
      ?auto_143219 - BLOCK
      ?auto_143220 - BLOCK
      ?auto_143221 - BLOCK
    )
    :vars
    (
      ?auto_143222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143222 ?auto_143221 ) ( CLEAR ?auto_143222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143216 ) ( ON ?auto_143217 ?auto_143216 ) ( ON ?auto_143218 ?auto_143217 ) ( ON ?auto_143219 ?auto_143218 ) ( ON ?auto_143220 ?auto_143219 ) ( ON ?auto_143221 ?auto_143220 ) ( not ( = ?auto_143216 ?auto_143217 ) ) ( not ( = ?auto_143216 ?auto_143218 ) ) ( not ( = ?auto_143216 ?auto_143219 ) ) ( not ( = ?auto_143216 ?auto_143220 ) ) ( not ( = ?auto_143216 ?auto_143221 ) ) ( not ( = ?auto_143216 ?auto_143222 ) ) ( not ( = ?auto_143217 ?auto_143218 ) ) ( not ( = ?auto_143217 ?auto_143219 ) ) ( not ( = ?auto_143217 ?auto_143220 ) ) ( not ( = ?auto_143217 ?auto_143221 ) ) ( not ( = ?auto_143217 ?auto_143222 ) ) ( not ( = ?auto_143218 ?auto_143219 ) ) ( not ( = ?auto_143218 ?auto_143220 ) ) ( not ( = ?auto_143218 ?auto_143221 ) ) ( not ( = ?auto_143218 ?auto_143222 ) ) ( not ( = ?auto_143219 ?auto_143220 ) ) ( not ( = ?auto_143219 ?auto_143221 ) ) ( not ( = ?auto_143219 ?auto_143222 ) ) ( not ( = ?auto_143220 ?auto_143221 ) ) ( not ( = ?auto_143220 ?auto_143222 ) ) ( not ( = ?auto_143221 ?auto_143222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143222 ?auto_143221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143223 - BLOCK
      ?auto_143224 - BLOCK
      ?auto_143225 - BLOCK
      ?auto_143226 - BLOCK
      ?auto_143227 - BLOCK
      ?auto_143228 - BLOCK
    )
    :vars
    (
      ?auto_143229 - BLOCK
      ?auto_143230 - BLOCK
      ?auto_143231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143229 ?auto_143228 ) ( CLEAR ?auto_143229 ) ( ON-TABLE ?auto_143223 ) ( ON ?auto_143224 ?auto_143223 ) ( ON ?auto_143225 ?auto_143224 ) ( ON ?auto_143226 ?auto_143225 ) ( ON ?auto_143227 ?auto_143226 ) ( ON ?auto_143228 ?auto_143227 ) ( not ( = ?auto_143223 ?auto_143224 ) ) ( not ( = ?auto_143223 ?auto_143225 ) ) ( not ( = ?auto_143223 ?auto_143226 ) ) ( not ( = ?auto_143223 ?auto_143227 ) ) ( not ( = ?auto_143223 ?auto_143228 ) ) ( not ( = ?auto_143223 ?auto_143229 ) ) ( not ( = ?auto_143224 ?auto_143225 ) ) ( not ( = ?auto_143224 ?auto_143226 ) ) ( not ( = ?auto_143224 ?auto_143227 ) ) ( not ( = ?auto_143224 ?auto_143228 ) ) ( not ( = ?auto_143224 ?auto_143229 ) ) ( not ( = ?auto_143225 ?auto_143226 ) ) ( not ( = ?auto_143225 ?auto_143227 ) ) ( not ( = ?auto_143225 ?auto_143228 ) ) ( not ( = ?auto_143225 ?auto_143229 ) ) ( not ( = ?auto_143226 ?auto_143227 ) ) ( not ( = ?auto_143226 ?auto_143228 ) ) ( not ( = ?auto_143226 ?auto_143229 ) ) ( not ( = ?auto_143227 ?auto_143228 ) ) ( not ( = ?auto_143227 ?auto_143229 ) ) ( not ( = ?auto_143228 ?auto_143229 ) ) ( HOLDING ?auto_143230 ) ( CLEAR ?auto_143231 ) ( not ( = ?auto_143223 ?auto_143230 ) ) ( not ( = ?auto_143223 ?auto_143231 ) ) ( not ( = ?auto_143224 ?auto_143230 ) ) ( not ( = ?auto_143224 ?auto_143231 ) ) ( not ( = ?auto_143225 ?auto_143230 ) ) ( not ( = ?auto_143225 ?auto_143231 ) ) ( not ( = ?auto_143226 ?auto_143230 ) ) ( not ( = ?auto_143226 ?auto_143231 ) ) ( not ( = ?auto_143227 ?auto_143230 ) ) ( not ( = ?auto_143227 ?auto_143231 ) ) ( not ( = ?auto_143228 ?auto_143230 ) ) ( not ( = ?auto_143228 ?auto_143231 ) ) ( not ( = ?auto_143229 ?auto_143230 ) ) ( not ( = ?auto_143229 ?auto_143231 ) ) ( not ( = ?auto_143230 ?auto_143231 ) ) )
    :subtasks
    ( ( !STACK ?auto_143230 ?auto_143231 )
      ( MAKE-6PILE ?auto_143223 ?auto_143224 ?auto_143225 ?auto_143226 ?auto_143227 ?auto_143228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144563 - BLOCK
      ?auto_144564 - BLOCK
      ?auto_144565 - BLOCK
      ?auto_144566 - BLOCK
      ?auto_144567 - BLOCK
      ?auto_144568 - BLOCK
    )
    :vars
    (
      ?auto_144570 - BLOCK
      ?auto_144569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144570 ?auto_144568 ) ( ON-TABLE ?auto_144563 ) ( ON ?auto_144564 ?auto_144563 ) ( ON ?auto_144565 ?auto_144564 ) ( ON ?auto_144566 ?auto_144565 ) ( ON ?auto_144567 ?auto_144566 ) ( ON ?auto_144568 ?auto_144567 ) ( not ( = ?auto_144563 ?auto_144564 ) ) ( not ( = ?auto_144563 ?auto_144565 ) ) ( not ( = ?auto_144563 ?auto_144566 ) ) ( not ( = ?auto_144563 ?auto_144567 ) ) ( not ( = ?auto_144563 ?auto_144568 ) ) ( not ( = ?auto_144563 ?auto_144570 ) ) ( not ( = ?auto_144564 ?auto_144565 ) ) ( not ( = ?auto_144564 ?auto_144566 ) ) ( not ( = ?auto_144564 ?auto_144567 ) ) ( not ( = ?auto_144564 ?auto_144568 ) ) ( not ( = ?auto_144564 ?auto_144570 ) ) ( not ( = ?auto_144565 ?auto_144566 ) ) ( not ( = ?auto_144565 ?auto_144567 ) ) ( not ( = ?auto_144565 ?auto_144568 ) ) ( not ( = ?auto_144565 ?auto_144570 ) ) ( not ( = ?auto_144566 ?auto_144567 ) ) ( not ( = ?auto_144566 ?auto_144568 ) ) ( not ( = ?auto_144566 ?auto_144570 ) ) ( not ( = ?auto_144567 ?auto_144568 ) ) ( not ( = ?auto_144567 ?auto_144570 ) ) ( not ( = ?auto_144568 ?auto_144570 ) ) ( not ( = ?auto_144563 ?auto_144569 ) ) ( not ( = ?auto_144564 ?auto_144569 ) ) ( not ( = ?auto_144565 ?auto_144569 ) ) ( not ( = ?auto_144566 ?auto_144569 ) ) ( not ( = ?auto_144567 ?auto_144569 ) ) ( not ( = ?auto_144568 ?auto_144569 ) ) ( not ( = ?auto_144570 ?auto_144569 ) ) ( ON ?auto_144569 ?auto_144570 ) ( CLEAR ?auto_144569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144563 ?auto_144564 ?auto_144565 ?auto_144566 ?auto_144567 ?auto_144568 ?auto_144570 )
      ( MAKE-6PILE ?auto_144563 ?auto_144564 ?auto_144565 ?auto_144566 ?auto_144567 ?auto_144568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143241 - BLOCK
      ?auto_143242 - BLOCK
      ?auto_143243 - BLOCK
      ?auto_143244 - BLOCK
      ?auto_143245 - BLOCK
      ?auto_143246 - BLOCK
    )
    :vars
    (
      ?auto_143249 - BLOCK
      ?auto_143247 - BLOCK
      ?auto_143248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143249 ?auto_143246 ) ( ON-TABLE ?auto_143241 ) ( ON ?auto_143242 ?auto_143241 ) ( ON ?auto_143243 ?auto_143242 ) ( ON ?auto_143244 ?auto_143243 ) ( ON ?auto_143245 ?auto_143244 ) ( ON ?auto_143246 ?auto_143245 ) ( not ( = ?auto_143241 ?auto_143242 ) ) ( not ( = ?auto_143241 ?auto_143243 ) ) ( not ( = ?auto_143241 ?auto_143244 ) ) ( not ( = ?auto_143241 ?auto_143245 ) ) ( not ( = ?auto_143241 ?auto_143246 ) ) ( not ( = ?auto_143241 ?auto_143249 ) ) ( not ( = ?auto_143242 ?auto_143243 ) ) ( not ( = ?auto_143242 ?auto_143244 ) ) ( not ( = ?auto_143242 ?auto_143245 ) ) ( not ( = ?auto_143242 ?auto_143246 ) ) ( not ( = ?auto_143242 ?auto_143249 ) ) ( not ( = ?auto_143243 ?auto_143244 ) ) ( not ( = ?auto_143243 ?auto_143245 ) ) ( not ( = ?auto_143243 ?auto_143246 ) ) ( not ( = ?auto_143243 ?auto_143249 ) ) ( not ( = ?auto_143244 ?auto_143245 ) ) ( not ( = ?auto_143244 ?auto_143246 ) ) ( not ( = ?auto_143244 ?auto_143249 ) ) ( not ( = ?auto_143245 ?auto_143246 ) ) ( not ( = ?auto_143245 ?auto_143249 ) ) ( not ( = ?auto_143246 ?auto_143249 ) ) ( not ( = ?auto_143241 ?auto_143247 ) ) ( not ( = ?auto_143241 ?auto_143248 ) ) ( not ( = ?auto_143242 ?auto_143247 ) ) ( not ( = ?auto_143242 ?auto_143248 ) ) ( not ( = ?auto_143243 ?auto_143247 ) ) ( not ( = ?auto_143243 ?auto_143248 ) ) ( not ( = ?auto_143244 ?auto_143247 ) ) ( not ( = ?auto_143244 ?auto_143248 ) ) ( not ( = ?auto_143245 ?auto_143247 ) ) ( not ( = ?auto_143245 ?auto_143248 ) ) ( not ( = ?auto_143246 ?auto_143247 ) ) ( not ( = ?auto_143246 ?auto_143248 ) ) ( not ( = ?auto_143249 ?auto_143247 ) ) ( not ( = ?auto_143249 ?auto_143248 ) ) ( not ( = ?auto_143247 ?auto_143248 ) ) ( ON ?auto_143247 ?auto_143249 ) ( CLEAR ?auto_143247 ) ( HOLDING ?auto_143248 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143248 )
      ( MAKE-6PILE ?auto_143241 ?auto_143242 ?auto_143243 ?auto_143244 ?auto_143245 ?auto_143246 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143250 - BLOCK
      ?auto_143251 - BLOCK
      ?auto_143252 - BLOCK
      ?auto_143253 - BLOCK
      ?auto_143254 - BLOCK
      ?auto_143255 - BLOCK
    )
    :vars
    (
      ?auto_143258 - BLOCK
      ?auto_143256 - BLOCK
      ?auto_143257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143258 ?auto_143255 ) ( ON-TABLE ?auto_143250 ) ( ON ?auto_143251 ?auto_143250 ) ( ON ?auto_143252 ?auto_143251 ) ( ON ?auto_143253 ?auto_143252 ) ( ON ?auto_143254 ?auto_143253 ) ( ON ?auto_143255 ?auto_143254 ) ( not ( = ?auto_143250 ?auto_143251 ) ) ( not ( = ?auto_143250 ?auto_143252 ) ) ( not ( = ?auto_143250 ?auto_143253 ) ) ( not ( = ?auto_143250 ?auto_143254 ) ) ( not ( = ?auto_143250 ?auto_143255 ) ) ( not ( = ?auto_143250 ?auto_143258 ) ) ( not ( = ?auto_143251 ?auto_143252 ) ) ( not ( = ?auto_143251 ?auto_143253 ) ) ( not ( = ?auto_143251 ?auto_143254 ) ) ( not ( = ?auto_143251 ?auto_143255 ) ) ( not ( = ?auto_143251 ?auto_143258 ) ) ( not ( = ?auto_143252 ?auto_143253 ) ) ( not ( = ?auto_143252 ?auto_143254 ) ) ( not ( = ?auto_143252 ?auto_143255 ) ) ( not ( = ?auto_143252 ?auto_143258 ) ) ( not ( = ?auto_143253 ?auto_143254 ) ) ( not ( = ?auto_143253 ?auto_143255 ) ) ( not ( = ?auto_143253 ?auto_143258 ) ) ( not ( = ?auto_143254 ?auto_143255 ) ) ( not ( = ?auto_143254 ?auto_143258 ) ) ( not ( = ?auto_143255 ?auto_143258 ) ) ( not ( = ?auto_143250 ?auto_143256 ) ) ( not ( = ?auto_143250 ?auto_143257 ) ) ( not ( = ?auto_143251 ?auto_143256 ) ) ( not ( = ?auto_143251 ?auto_143257 ) ) ( not ( = ?auto_143252 ?auto_143256 ) ) ( not ( = ?auto_143252 ?auto_143257 ) ) ( not ( = ?auto_143253 ?auto_143256 ) ) ( not ( = ?auto_143253 ?auto_143257 ) ) ( not ( = ?auto_143254 ?auto_143256 ) ) ( not ( = ?auto_143254 ?auto_143257 ) ) ( not ( = ?auto_143255 ?auto_143256 ) ) ( not ( = ?auto_143255 ?auto_143257 ) ) ( not ( = ?auto_143258 ?auto_143256 ) ) ( not ( = ?auto_143258 ?auto_143257 ) ) ( not ( = ?auto_143256 ?auto_143257 ) ) ( ON ?auto_143256 ?auto_143258 ) ( ON ?auto_143257 ?auto_143256 ) ( CLEAR ?auto_143257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143250 ?auto_143251 ?auto_143252 ?auto_143253 ?auto_143254 ?auto_143255 ?auto_143258 ?auto_143256 )
      ( MAKE-6PILE ?auto_143250 ?auto_143251 ?auto_143252 ?auto_143253 ?auto_143254 ?auto_143255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143262 - BLOCK
      ?auto_143263 - BLOCK
      ?auto_143264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143264 ) ( CLEAR ?auto_143263 ) ( ON-TABLE ?auto_143262 ) ( ON ?auto_143263 ?auto_143262 ) ( not ( = ?auto_143262 ?auto_143263 ) ) ( not ( = ?auto_143262 ?auto_143264 ) ) ( not ( = ?auto_143263 ?auto_143264 ) ) )
    :subtasks
    ( ( !STACK ?auto_143264 ?auto_143263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143265 - BLOCK
      ?auto_143266 - BLOCK
      ?auto_143267 - BLOCK
    )
    :vars
    (
      ?auto_143268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143266 ) ( ON-TABLE ?auto_143265 ) ( ON ?auto_143266 ?auto_143265 ) ( not ( = ?auto_143265 ?auto_143266 ) ) ( not ( = ?auto_143265 ?auto_143267 ) ) ( not ( = ?auto_143266 ?auto_143267 ) ) ( ON ?auto_143267 ?auto_143268 ) ( CLEAR ?auto_143267 ) ( HAND-EMPTY ) ( not ( = ?auto_143265 ?auto_143268 ) ) ( not ( = ?auto_143266 ?auto_143268 ) ) ( not ( = ?auto_143267 ?auto_143268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143267 ?auto_143268 )
      ( MAKE-3PILE ?auto_143265 ?auto_143266 ?auto_143267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143269 - BLOCK
      ?auto_143270 - BLOCK
      ?auto_143271 - BLOCK
    )
    :vars
    (
      ?auto_143272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143269 ) ( not ( = ?auto_143269 ?auto_143270 ) ) ( not ( = ?auto_143269 ?auto_143271 ) ) ( not ( = ?auto_143270 ?auto_143271 ) ) ( ON ?auto_143271 ?auto_143272 ) ( CLEAR ?auto_143271 ) ( not ( = ?auto_143269 ?auto_143272 ) ) ( not ( = ?auto_143270 ?auto_143272 ) ) ( not ( = ?auto_143271 ?auto_143272 ) ) ( HOLDING ?auto_143270 ) ( CLEAR ?auto_143269 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143269 ?auto_143270 )
      ( MAKE-3PILE ?auto_143269 ?auto_143270 ?auto_143271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143273 - BLOCK
      ?auto_143274 - BLOCK
      ?auto_143275 - BLOCK
    )
    :vars
    (
      ?auto_143276 - BLOCK
      ?auto_143279 - BLOCK
      ?auto_143278 - BLOCK
      ?auto_143277 - BLOCK
      ?auto_143280 - BLOCK
      ?auto_143281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143273 ) ( not ( = ?auto_143273 ?auto_143274 ) ) ( not ( = ?auto_143273 ?auto_143275 ) ) ( not ( = ?auto_143274 ?auto_143275 ) ) ( ON ?auto_143275 ?auto_143276 ) ( not ( = ?auto_143273 ?auto_143276 ) ) ( not ( = ?auto_143274 ?auto_143276 ) ) ( not ( = ?auto_143275 ?auto_143276 ) ) ( CLEAR ?auto_143273 ) ( ON ?auto_143274 ?auto_143275 ) ( CLEAR ?auto_143274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143279 ) ( ON ?auto_143278 ?auto_143279 ) ( ON ?auto_143277 ?auto_143278 ) ( ON ?auto_143280 ?auto_143277 ) ( ON ?auto_143281 ?auto_143280 ) ( ON ?auto_143276 ?auto_143281 ) ( not ( = ?auto_143279 ?auto_143278 ) ) ( not ( = ?auto_143279 ?auto_143277 ) ) ( not ( = ?auto_143279 ?auto_143280 ) ) ( not ( = ?auto_143279 ?auto_143281 ) ) ( not ( = ?auto_143279 ?auto_143276 ) ) ( not ( = ?auto_143279 ?auto_143275 ) ) ( not ( = ?auto_143279 ?auto_143274 ) ) ( not ( = ?auto_143278 ?auto_143277 ) ) ( not ( = ?auto_143278 ?auto_143280 ) ) ( not ( = ?auto_143278 ?auto_143281 ) ) ( not ( = ?auto_143278 ?auto_143276 ) ) ( not ( = ?auto_143278 ?auto_143275 ) ) ( not ( = ?auto_143278 ?auto_143274 ) ) ( not ( = ?auto_143277 ?auto_143280 ) ) ( not ( = ?auto_143277 ?auto_143281 ) ) ( not ( = ?auto_143277 ?auto_143276 ) ) ( not ( = ?auto_143277 ?auto_143275 ) ) ( not ( = ?auto_143277 ?auto_143274 ) ) ( not ( = ?auto_143280 ?auto_143281 ) ) ( not ( = ?auto_143280 ?auto_143276 ) ) ( not ( = ?auto_143280 ?auto_143275 ) ) ( not ( = ?auto_143280 ?auto_143274 ) ) ( not ( = ?auto_143281 ?auto_143276 ) ) ( not ( = ?auto_143281 ?auto_143275 ) ) ( not ( = ?auto_143281 ?auto_143274 ) ) ( not ( = ?auto_143273 ?auto_143279 ) ) ( not ( = ?auto_143273 ?auto_143278 ) ) ( not ( = ?auto_143273 ?auto_143277 ) ) ( not ( = ?auto_143273 ?auto_143280 ) ) ( not ( = ?auto_143273 ?auto_143281 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143279 ?auto_143278 ?auto_143277 ?auto_143280 ?auto_143281 ?auto_143276 ?auto_143275 )
      ( MAKE-3PILE ?auto_143273 ?auto_143274 ?auto_143275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143282 - BLOCK
      ?auto_143283 - BLOCK
      ?auto_143284 - BLOCK
    )
    :vars
    (
      ?auto_143287 - BLOCK
      ?auto_143290 - BLOCK
      ?auto_143289 - BLOCK
      ?auto_143288 - BLOCK
      ?auto_143286 - BLOCK
      ?auto_143285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143282 ?auto_143283 ) ) ( not ( = ?auto_143282 ?auto_143284 ) ) ( not ( = ?auto_143283 ?auto_143284 ) ) ( ON ?auto_143284 ?auto_143287 ) ( not ( = ?auto_143282 ?auto_143287 ) ) ( not ( = ?auto_143283 ?auto_143287 ) ) ( not ( = ?auto_143284 ?auto_143287 ) ) ( ON ?auto_143283 ?auto_143284 ) ( CLEAR ?auto_143283 ) ( ON-TABLE ?auto_143290 ) ( ON ?auto_143289 ?auto_143290 ) ( ON ?auto_143288 ?auto_143289 ) ( ON ?auto_143286 ?auto_143288 ) ( ON ?auto_143285 ?auto_143286 ) ( ON ?auto_143287 ?auto_143285 ) ( not ( = ?auto_143290 ?auto_143289 ) ) ( not ( = ?auto_143290 ?auto_143288 ) ) ( not ( = ?auto_143290 ?auto_143286 ) ) ( not ( = ?auto_143290 ?auto_143285 ) ) ( not ( = ?auto_143290 ?auto_143287 ) ) ( not ( = ?auto_143290 ?auto_143284 ) ) ( not ( = ?auto_143290 ?auto_143283 ) ) ( not ( = ?auto_143289 ?auto_143288 ) ) ( not ( = ?auto_143289 ?auto_143286 ) ) ( not ( = ?auto_143289 ?auto_143285 ) ) ( not ( = ?auto_143289 ?auto_143287 ) ) ( not ( = ?auto_143289 ?auto_143284 ) ) ( not ( = ?auto_143289 ?auto_143283 ) ) ( not ( = ?auto_143288 ?auto_143286 ) ) ( not ( = ?auto_143288 ?auto_143285 ) ) ( not ( = ?auto_143288 ?auto_143287 ) ) ( not ( = ?auto_143288 ?auto_143284 ) ) ( not ( = ?auto_143288 ?auto_143283 ) ) ( not ( = ?auto_143286 ?auto_143285 ) ) ( not ( = ?auto_143286 ?auto_143287 ) ) ( not ( = ?auto_143286 ?auto_143284 ) ) ( not ( = ?auto_143286 ?auto_143283 ) ) ( not ( = ?auto_143285 ?auto_143287 ) ) ( not ( = ?auto_143285 ?auto_143284 ) ) ( not ( = ?auto_143285 ?auto_143283 ) ) ( not ( = ?auto_143282 ?auto_143290 ) ) ( not ( = ?auto_143282 ?auto_143289 ) ) ( not ( = ?auto_143282 ?auto_143288 ) ) ( not ( = ?auto_143282 ?auto_143286 ) ) ( not ( = ?auto_143282 ?auto_143285 ) ) ( HOLDING ?auto_143282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143282 )
      ( MAKE-3PILE ?auto_143282 ?auto_143283 ?auto_143284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143291 - BLOCK
      ?auto_143292 - BLOCK
      ?auto_143293 - BLOCK
    )
    :vars
    (
      ?auto_143299 - BLOCK
      ?auto_143294 - BLOCK
      ?auto_143298 - BLOCK
      ?auto_143295 - BLOCK
      ?auto_143297 - BLOCK
      ?auto_143296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143291 ?auto_143292 ) ) ( not ( = ?auto_143291 ?auto_143293 ) ) ( not ( = ?auto_143292 ?auto_143293 ) ) ( ON ?auto_143293 ?auto_143299 ) ( not ( = ?auto_143291 ?auto_143299 ) ) ( not ( = ?auto_143292 ?auto_143299 ) ) ( not ( = ?auto_143293 ?auto_143299 ) ) ( ON ?auto_143292 ?auto_143293 ) ( ON-TABLE ?auto_143294 ) ( ON ?auto_143298 ?auto_143294 ) ( ON ?auto_143295 ?auto_143298 ) ( ON ?auto_143297 ?auto_143295 ) ( ON ?auto_143296 ?auto_143297 ) ( ON ?auto_143299 ?auto_143296 ) ( not ( = ?auto_143294 ?auto_143298 ) ) ( not ( = ?auto_143294 ?auto_143295 ) ) ( not ( = ?auto_143294 ?auto_143297 ) ) ( not ( = ?auto_143294 ?auto_143296 ) ) ( not ( = ?auto_143294 ?auto_143299 ) ) ( not ( = ?auto_143294 ?auto_143293 ) ) ( not ( = ?auto_143294 ?auto_143292 ) ) ( not ( = ?auto_143298 ?auto_143295 ) ) ( not ( = ?auto_143298 ?auto_143297 ) ) ( not ( = ?auto_143298 ?auto_143296 ) ) ( not ( = ?auto_143298 ?auto_143299 ) ) ( not ( = ?auto_143298 ?auto_143293 ) ) ( not ( = ?auto_143298 ?auto_143292 ) ) ( not ( = ?auto_143295 ?auto_143297 ) ) ( not ( = ?auto_143295 ?auto_143296 ) ) ( not ( = ?auto_143295 ?auto_143299 ) ) ( not ( = ?auto_143295 ?auto_143293 ) ) ( not ( = ?auto_143295 ?auto_143292 ) ) ( not ( = ?auto_143297 ?auto_143296 ) ) ( not ( = ?auto_143297 ?auto_143299 ) ) ( not ( = ?auto_143297 ?auto_143293 ) ) ( not ( = ?auto_143297 ?auto_143292 ) ) ( not ( = ?auto_143296 ?auto_143299 ) ) ( not ( = ?auto_143296 ?auto_143293 ) ) ( not ( = ?auto_143296 ?auto_143292 ) ) ( not ( = ?auto_143291 ?auto_143294 ) ) ( not ( = ?auto_143291 ?auto_143298 ) ) ( not ( = ?auto_143291 ?auto_143295 ) ) ( not ( = ?auto_143291 ?auto_143297 ) ) ( not ( = ?auto_143291 ?auto_143296 ) ) ( ON ?auto_143291 ?auto_143292 ) ( CLEAR ?auto_143291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143294 ?auto_143298 ?auto_143295 ?auto_143297 ?auto_143296 ?auto_143299 ?auto_143293 ?auto_143292 )
      ( MAKE-3PILE ?auto_143291 ?auto_143292 ?auto_143293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143305 - BLOCK
      ?auto_143306 - BLOCK
      ?auto_143307 - BLOCK
      ?auto_143308 - BLOCK
      ?auto_143309 - BLOCK
    )
    :vars
    (
      ?auto_143310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143310 ?auto_143309 ) ( CLEAR ?auto_143310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143305 ) ( ON ?auto_143306 ?auto_143305 ) ( ON ?auto_143307 ?auto_143306 ) ( ON ?auto_143308 ?auto_143307 ) ( ON ?auto_143309 ?auto_143308 ) ( not ( = ?auto_143305 ?auto_143306 ) ) ( not ( = ?auto_143305 ?auto_143307 ) ) ( not ( = ?auto_143305 ?auto_143308 ) ) ( not ( = ?auto_143305 ?auto_143309 ) ) ( not ( = ?auto_143305 ?auto_143310 ) ) ( not ( = ?auto_143306 ?auto_143307 ) ) ( not ( = ?auto_143306 ?auto_143308 ) ) ( not ( = ?auto_143306 ?auto_143309 ) ) ( not ( = ?auto_143306 ?auto_143310 ) ) ( not ( = ?auto_143307 ?auto_143308 ) ) ( not ( = ?auto_143307 ?auto_143309 ) ) ( not ( = ?auto_143307 ?auto_143310 ) ) ( not ( = ?auto_143308 ?auto_143309 ) ) ( not ( = ?auto_143308 ?auto_143310 ) ) ( not ( = ?auto_143309 ?auto_143310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143310 ?auto_143309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143311 - BLOCK
      ?auto_143312 - BLOCK
      ?auto_143313 - BLOCK
      ?auto_143314 - BLOCK
      ?auto_143315 - BLOCK
    )
    :vars
    (
      ?auto_143316 - BLOCK
      ?auto_143317 - BLOCK
      ?auto_143318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143316 ?auto_143315 ) ( CLEAR ?auto_143316 ) ( ON-TABLE ?auto_143311 ) ( ON ?auto_143312 ?auto_143311 ) ( ON ?auto_143313 ?auto_143312 ) ( ON ?auto_143314 ?auto_143313 ) ( ON ?auto_143315 ?auto_143314 ) ( not ( = ?auto_143311 ?auto_143312 ) ) ( not ( = ?auto_143311 ?auto_143313 ) ) ( not ( = ?auto_143311 ?auto_143314 ) ) ( not ( = ?auto_143311 ?auto_143315 ) ) ( not ( = ?auto_143311 ?auto_143316 ) ) ( not ( = ?auto_143312 ?auto_143313 ) ) ( not ( = ?auto_143312 ?auto_143314 ) ) ( not ( = ?auto_143312 ?auto_143315 ) ) ( not ( = ?auto_143312 ?auto_143316 ) ) ( not ( = ?auto_143313 ?auto_143314 ) ) ( not ( = ?auto_143313 ?auto_143315 ) ) ( not ( = ?auto_143313 ?auto_143316 ) ) ( not ( = ?auto_143314 ?auto_143315 ) ) ( not ( = ?auto_143314 ?auto_143316 ) ) ( not ( = ?auto_143315 ?auto_143316 ) ) ( HOLDING ?auto_143317 ) ( CLEAR ?auto_143318 ) ( not ( = ?auto_143311 ?auto_143317 ) ) ( not ( = ?auto_143311 ?auto_143318 ) ) ( not ( = ?auto_143312 ?auto_143317 ) ) ( not ( = ?auto_143312 ?auto_143318 ) ) ( not ( = ?auto_143313 ?auto_143317 ) ) ( not ( = ?auto_143313 ?auto_143318 ) ) ( not ( = ?auto_143314 ?auto_143317 ) ) ( not ( = ?auto_143314 ?auto_143318 ) ) ( not ( = ?auto_143315 ?auto_143317 ) ) ( not ( = ?auto_143315 ?auto_143318 ) ) ( not ( = ?auto_143316 ?auto_143317 ) ) ( not ( = ?auto_143316 ?auto_143318 ) ) ( not ( = ?auto_143317 ?auto_143318 ) ) )
    :subtasks
    ( ( !STACK ?auto_143317 ?auto_143318 )
      ( MAKE-5PILE ?auto_143311 ?auto_143312 ?auto_143313 ?auto_143314 ?auto_143315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143319 - BLOCK
      ?auto_143320 - BLOCK
      ?auto_143321 - BLOCK
      ?auto_143322 - BLOCK
      ?auto_143323 - BLOCK
    )
    :vars
    (
      ?auto_143326 - BLOCK
      ?auto_143325 - BLOCK
      ?auto_143324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143326 ?auto_143323 ) ( ON-TABLE ?auto_143319 ) ( ON ?auto_143320 ?auto_143319 ) ( ON ?auto_143321 ?auto_143320 ) ( ON ?auto_143322 ?auto_143321 ) ( ON ?auto_143323 ?auto_143322 ) ( not ( = ?auto_143319 ?auto_143320 ) ) ( not ( = ?auto_143319 ?auto_143321 ) ) ( not ( = ?auto_143319 ?auto_143322 ) ) ( not ( = ?auto_143319 ?auto_143323 ) ) ( not ( = ?auto_143319 ?auto_143326 ) ) ( not ( = ?auto_143320 ?auto_143321 ) ) ( not ( = ?auto_143320 ?auto_143322 ) ) ( not ( = ?auto_143320 ?auto_143323 ) ) ( not ( = ?auto_143320 ?auto_143326 ) ) ( not ( = ?auto_143321 ?auto_143322 ) ) ( not ( = ?auto_143321 ?auto_143323 ) ) ( not ( = ?auto_143321 ?auto_143326 ) ) ( not ( = ?auto_143322 ?auto_143323 ) ) ( not ( = ?auto_143322 ?auto_143326 ) ) ( not ( = ?auto_143323 ?auto_143326 ) ) ( CLEAR ?auto_143325 ) ( not ( = ?auto_143319 ?auto_143324 ) ) ( not ( = ?auto_143319 ?auto_143325 ) ) ( not ( = ?auto_143320 ?auto_143324 ) ) ( not ( = ?auto_143320 ?auto_143325 ) ) ( not ( = ?auto_143321 ?auto_143324 ) ) ( not ( = ?auto_143321 ?auto_143325 ) ) ( not ( = ?auto_143322 ?auto_143324 ) ) ( not ( = ?auto_143322 ?auto_143325 ) ) ( not ( = ?auto_143323 ?auto_143324 ) ) ( not ( = ?auto_143323 ?auto_143325 ) ) ( not ( = ?auto_143326 ?auto_143324 ) ) ( not ( = ?auto_143326 ?auto_143325 ) ) ( not ( = ?auto_143324 ?auto_143325 ) ) ( ON ?auto_143324 ?auto_143326 ) ( CLEAR ?auto_143324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143319 ?auto_143320 ?auto_143321 ?auto_143322 ?auto_143323 ?auto_143326 )
      ( MAKE-5PILE ?auto_143319 ?auto_143320 ?auto_143321 ?auto_143322 ?auto_143323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143327 - BLOCK
      ?auto_143328 - BLOCK
      ?auto_143329 - BLOCK
      ?auto_143330 - BLOCK
      ?auto_143331 - BLOCK
    )
    :vars
    (
      ?auto_143334 - BLOCK
      ?auto_143332 - BLOCK
      ?auto_143333 - BLOCK
      ?auto_143335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143334 ?auto_143331 ) ( ON-TABLE ?auto_143327 ) ( ON ?auto_143328 ?auto_143327 ) ( ON ?auto_143329 ?auto_143328 ) ( ON ?auto_143330 ?auto_143329 ) ( ON ?auto_143331 ?auto_143330 ) ( not ( = ?auto_143327 ?auto_143328 ) ) ( not ( = ?auto_143327 ?auto_143329 ) ) ( not ( = ?auto_143327 ?auto_143330 ) ) ( not ( = ?auto_143327 ?auto_143331 ) ) ( not ( = ?auto_143327 ?auto_143334 ) ) ( not ( = ?auto_143328 ?auto_143329 ) ) ( not ( = ?auto_143328 ?auto_143330 ) ) ( not ( = ?auto_143328 ?auto_143331 ) ) ( not ( = ?auto_143328 ?auto_143334 ) ) ( not ( = ?auto_143329 ?auto_143330 ) ) ( not ( = ?auto_143329 ?auto_143331 ) ) ( not ( = ?auto_143329 ?auto_143334 ) ) ( not ( = ?auto_143330 ?auto_143331 ) ) ( not ( = ?auto_143330 ?auto_143334 ) ) ( not ( = ?auto_143331 ?auto_143334 ) ) ( not ( = ?auto_143327 ?auto_143332 ) ) ( not ( = ?auto_143327 ?auto_143333 ) ) ( not ( = ?auto_143328 ?auto_143332 ) ) ( not ( = ?auto_143328 ?auto_143333 ) ) ( not ( = ?auto_143329 ?auto_143332 ) ) ( not ( = ?auto_143329 ?auto_143333 ) ) ( not ( = ?auto_143330 ?auto_143332 ) ) ( not ( = ?auto_143330 ?auto_143333 ) ) ( not ( = ?auto_143331 ?auto_143332 ) ) ( not ( = ?auto_143331 ?auto_143333 ) ) ( not ( = ?auto_143334 ?auto_143332 ) ) ( not ( = ?auto_143334 ?auto_143333 ) ) ( not ( = ?auto_143332 ?auto_143333 ) ) ( ON ?auto_143332 ?auto_143334 ) ( CLEAR ?auto_143332 ) ( HOLDING ?auto_143333 ) ( CLEAR ?auto_143335 ) ( ON-TABLE ?auto_143335 ) ( not ( = ?auto_143335 ?auto_143333 ) ) ( not ( = ?auto_143327 ?auto_143335 ) ) ( not ( = ?auto_143328 ?auto_143335 ) ) ( not ( = ?auto_143329 ?auto_143335 ) ) ( not ( = ?auto_143330 ?auto_143335 ) ) ( not ( = ?auto_143331 ?auto_143335 ) ) ( not ( = ?auto_143334 ?auto_143335 ) ) ( not ( = ?auto_143332 ?auto_143335 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143335 ?auto_143333 )
      ( MAKE-5PILE ?auto_143327 ?auto_143328 ?auto_143329 ?auto_143330 ?auto_143331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144855 - BLOCK
      ?auto_144856 - BLOCK
      ?auto_144857 - BLOCK
      ?auto_144858 - BLOCK
      ?auto_144859 - BLOCK
    )
    :vars
    (
      ?auto_144862 - BLOCK
      ?auto_144860 - BLOCK
      ?auto_144861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144862 ?auto_144859 ) ( ON-TABLE ?auto_144855 ) ( ON ?auto_144856 ?auto_144855 ) ( ON ?auto_144857 ?auto_144856 ) ( ON ?auto_144858 ?auto_144857 ) ( ON ?auto_144859 ?auto_144858 ) ( not ( = ?auto_144855 ?auto_144856 ) ) ( not ( = ?auto_144855 ?auto_144857 ) ) ( not ( = ?auto_144855 ?auto_144858 ) ) ( not ( = ?auto_144855 ?auto_144859 ) ) ( not ( = ?auto_144855 ?auto_144862 ) ) ( not ( = ?auto_144856 ?auto_144857 ) ) ( not ( = ?auto_144856 ?auto_144858 ) ) ( not ( = ?auto_144856 ?auto_144859 ) ) ( not ( = ?auto_144856 ?auto_144862 ) ) ( not ( = ?auto_144857 ?auto_144858 ) ) ( not ( = ?auto_144857 ?auto_144859 ) ) ( not ( = ?auto_144857 ?auto_144862 ) ) ( not ( = ?auto_144858 ?auto_144859 ) ) ( not ( = ?auto_144858 ?auto_144862 ) ) ( not ( = ?auto_144859 ?auto_144862 ) ) ( not ( = ?auto_144855 ?auto_144860 ) ) ( not ( = ?auto_144855 ?auto_144861 ) ) ( not ( = ?auto_144856 ?auto_144860 ) ) ( not ( = ?auto_144856 ?auto_144861 ) ) ( not ( = ?auto_144857 ?auto_144860 ) ) ( not ( = ?auto_144857 ?auto_144861 ) ) ( not ( = ?auto_144858 ?auto_144860 ) ) ( not ( = ?auto_144858 ?auto_144861 ) ) ( not ( = ?auto_144859 ?auto_144860 ) ) ( not ( = ?auto_144859 ?auto_144861 ) ) ( not ( = ?auto_144862 ?auto_144860 ) ) ( not ( = ?auto_144862 ?auto_144861 ) ) ( not ( = ?auto_144860 ?auto_144861 ) ) ( ON ?auto_144860 ?auto_144862 ) ( ON ?auto_144861 ?auto_144860 ) ( CLEAR ?auto_144861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144855 ?auto_144856 ?auto_144857 ?auto_144858 ?auto_144859 ?auto_144862 ?auto_144860 )
      ( MAKE-5PILE ?auto_144855 ?auto_144856 ?auto_144857 ?auto_144858 ?auto_144859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143345 - BLOCK
      ?auto_143346 - BLOCK
      ?auto_143347 - BLOCK
      ?auto_143348 - BLOCK
      ?auto_143349 - BLOCK
    )
    :vars
    (
      ?auto_143352 - BLOCK
      ?auto_143353 - BLOCK
      ?auto_143350 - BLOCK
      ?auto_143351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143352 ?auto_143349 ) ( ON-TABLE ?auto_143345 ) ( ON ?auto_143346 ?auto_143345 ) ( ON ?auto_143347 ?auto_143346 ) ( ON ?auto_143348 ?auto_143347 ) ( ON ?auto_143349 ?auto_143348 ) ( not ( = ?auto_143345 ?auto_143346 ) ) ( not ( = ?auto_143345 ?auto_143347 ) ) ( not ( = ?auto_143345 ?auto_143348 ) ) ( not ( = ?auto_143345 ?auto_143349 ) ) ( not ( = ?auto_143345 ?auto_143352 ) ) ( not ( = ?auto_143346 ?auto_143347 ) ) ( not ( = ?auto_143346 ?auto_143348 ) ) ( not ( = ?auto_143346 ?auto_143349 ) ) ( not ( = ?auto_143346 ?auto_143352 ) ) ( not ( = ?auto_143347 ?auto_143348 ) ) ( not ( = ?auto_143347 ?auto_143349 ) ) ( not ( = ?auto_143347 ?auto_143352 ) ) ( not ( = ?auto_143348 ?auto_143349 ) ) ( not ( = ?auto_143348 ?auto_143352 ) ) ( not ( = ?auto_143349 ?auto_143352 ) ) ( not ( = ?auto_143345 ?auto_143353 ) ) ( not ( = ?auto_143345 ?auto_143350 ) ) ( not ( = ?auto_143346 ?auto_143353 ) ) ( not ( = ?auto_143346 ?auto_143350 ) ) ( not ( = ?auto_143347 ?auto_143353 ) ) ( not ( = ?auto_143347 ?auto_143350 ) ) ( not ( = ?auto_143348 ?auto_143353 ) ) ( not ( = ?auto_143348 ?auto_143350 ) ) ( not ( = ?auto_143349 ?auto_143353 ) ) ( not ( = ?auto_143349 ?auto_143350 ) ) ( not ( = ?auto_143352 ?auto_143353 ) ) ( not ( = ?auto_143352 ?auto_143350 ) ) ( not ( = ?auto_143353 ?auto_143350 ) ) ( ON ?auto_143353 ?auto_143352 ) ( not ( = ?auto_143351 ?auto_143350 ) ) ( not ( = ?auto_143345 ?auto_143351 ) ) ( not ( = ?auto_143346 ?auto_143351 ) ) ( not ( = ?auto_143347 ?auto_143351 ) ) ( not ( = ?auto_143348 ?auto_143351 ) ) ( not ( = ?auto_143349 ?auto_143351 ) ) ( not ( = ?auto_143352 ?auto_143351 ) ) ( not ( = ?auto_143353 ?auto_143351 ) ) ( ON ?auto_143350 ?auto_143353 ) ( CLEAR ?auto_143350 ) ( HOLDING ?auto_143351 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143351 )
      ( MAKE-5PILE ?auto_143345 ?auto_143346 ?auto_143347 ?auto_143348 ?auto_143349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143354 - BLOCK
      ?auto_143355 - BLOCK
      ?auto_143356 - BLOCK
      ?auto_143357 - BLOCK
      ?auto_143358 - BLOCK
    )
    :vars
    (
      ?auto_143359 - BLOCK
      ?auto_143362 - BLOCK
      ?auto_143361 - BLOCK
      ?auto_143360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143359 ?auto_143358 ) ( ON-TABLE ?auto_143354 ) ( ON ?auto_143355 ?auto_143354 ) ( ON ?auto_143356 ?auto_143355 ) ( ON ?auto_143357 ?auto_143356 ) ( ON ?auto_143358 ?auto_143357 ) ( not ( = ?auto_143354 ?auto_143355 ) ) ( not ( = ?auto_143354 ?auto_143356 ) ) ( not ( = ?auto_143354 ?auto_143357 ) ) ( not ( = ?auto_143354 ?auto_143358 ) ) ( not ( = ?auto_143354 ?auto_143359 ) ) ( not ( = ?auto_143355 ?auto_143356 ) ) ( not ( = ?auto_143355 ?auto_143357 ) ) ( not ( = ?auto_143355 ?auto_143358 ) ) ( not ( = ?auto_143355 ?auto_143359 ) ) ( not ( = ?auto_143356 ?auto_143357 ) ) ( not ( = ?auto_143356 ?auto_143358 ) ) ( not ( = ?auto_143356 ?auto_143359 ) ) ( not ( = ?auto_143357 ?auto_143358 ) ) ( not ( = ?auto_143357 ?auto_143359 ) ) ( not ( = ?auto_143358 ?auto_143359 ) ) ( not ( = ?auto_143354 ?auto_143362 ) ) ( not ( = ?auto_143354 ?auto_143361 ) ) ( not ( = ?auto_143355 ?auto_143362 ) ) ( not ( = ?auto_143355 ?auto_143361 ) ) ( not ( = ?auto_143356 ?auto_143362 ) ) ( not ( = ?auto_143356 ?auto_143361 ) ) ( not ( = ?auto_143357 ?auto_143362 ) ) ( not ( = ?auto_143357 ?auto_143361 ) ) ( not ( = ?auto_143358 ?auto_143362 ) ) ( not ( = ?auto_143358 ?auto_143361 ) ) ( not ( = ?auto_143359 ?auto_143362 ) ) ( not ( = ?auto_143359 ?auto_143361 ) ) ( not ( = ?auto_143362 ?auto_143361 ) ) ( ON ?auto_143362 ?auto_143359 ) ( not ( = ?auto_143360 ?auto_143361 ) ) ( not ( = ?auto_143354 ?auto_143360 ) ) ( not ( = ?auto_143355 ?auto_143360 ) ) ( not ( = ?auto_143356 ?auto_143360 ) ) ( not ( = ?auto_143357 ?auto_143360 ) ) ( not ( = ?auto_143358 ?auto_143360 ) ) ( not ( = ?auto_143359 ?auto_143360 ) ) ( not ( = ?auto_143362 ?auto_143360 ) ) ( ON ?auto_143361 ?auto_143362 ) ( ON ?auto_143360 ?auto_143361 ) ( CLEAR ?auto_143360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143354 ?auto_143355 ?auto_143356 ?auto_143357 ?auto_143358 ?auto_143359 ?auto_143362 ?auto_143361 )
      ( MAKE-5PILE ?auto_143354 ?auto_143355 ?auto_143356 ?auto_143357 ?auto_143358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143367 - BLOCK
      ?auto_143368 - BLOCK
      ?auto_143369 - BLOCK
      ?auto_143370 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143370 ) ( CLEAR ?auto_143369 ) ( ON-TABLE ?auto_143367 ) ( ON ?auto_143368 ?auto_143367 ) ( ON ?auto_143369 ?auto_143368 ) ( not ( = ?auto_143367 ?auto_143368 ) ) ( not ( = ?auto_143367 ?auto_143369 ) ) ( not ( = ?auto_143367 ?auto_143370 ) ) ( not ( = ?auto_143368 ?auto_143369 ) ) ( not ( = ?auto_143368 ?auto_143370 ) ) ( not ( = ?auto_143369 ?auto_143370 ) ) )
    :subtasks
    ( ( !STACK ?auto_143370 ?auto_143369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143371 - BLOCK
      ?auto_143372 - BLOCK
      ?auto_143373 - BLOCK
      ?auto_143374 - BLOCK
    )
    :vars
    (
      ?auto_143375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143373 ) ( ON-TABLE ?auto_143371 ) ( ON ?auto_143372 ?auto_143371 ) ( ON ?auto_143373 ?auto_143372 ) ( not ( = ?auto_143371 ?auto_143372 ) ) ( not ( = ?auto_143371 ?auto_143373 ) ) ( not ( = ?auto_143371 ?auto_143374 ) ) ( not ( = ?auto_143372 ?auto_143373 ) ) ( not ( = ?auto_143372 ?auto_143374 ) ) ( not ( = ?auto_143373 ?auto_143374 ) ) ( ON ?auto_143374 ?auto_143375 ) ( CLEAR ?auto_143374 ) ( HAND-EMPTY ) ( not ( = ?auto_143371 ?auto_143375 ) ) ( not ( = ?auto_143372 ?auto_143375 ) ) ( not ( = ?auto_143373 ?auto_143375 ) ) ( not ( = ?auto_143374 ?auto_143375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143374 ?auto_143375 )
      ( MAKE-4PILE ?auto_143371 ?auto_143372 ?auto_143373 ?auto_143374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143376 - BLOCK
      ?auto_143377 - BLOCK
      ?auto_143378 - BLOCK
      ?auto_143379 - BLOCK
    )
    :vars
    (
      ?auto_143380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143376 ) ( ON ?auto_143377 ?auto_143376 ) ( not ( = ?auto_143376 ?auto_143377 ) ) ( not ( = ?auto_143376 ?auto_143378 ) ) ( not ( = ?auto_143376 ?auto_143379 ) ) ( not ( = ?auto_143377 ?auto_143378 ) ) ( not ( = ?auto_143377 ?auto_143379 ) ) ( not ( = ?auto_143378 ?auto_143379 ) ) ( ON ?auto_143379 ?auto_143380 ) ( CLEAR ?auto_143379 ) ( not ( = ?auto_143376 ?auto_143380 ) ) ( not ( = ?auto_143377 ?auto_143380 ) ) ( not ( = ?auto_143378 ?auto_143380 ) ) ( not ( = ?auto_143379 ?auto_143380 ) ) ( HOLDING ?auto_143378 ) ( CLEAR ?auto_143377 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143376 ?auto_143377 ?auto_143378 )
      ( MAKE-4PILE ?auto_143376 ?auto_143377 ?auto_143378 ?auto_143379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143381 - BLOCK
      ?auto_143382 - BLOCK
      ?auto_143383 - BLOCK
      ?auto_143384 - BLOCK
    )
    :vars
    (
      ?auto_143385 - BLOCK
      ?auto_143389 - BLOCK
      ?auto_143386 - BLOCK
      ?auto_143387 - BLOCK
      ?auto_143388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143381 ) ( ON ?auto_143382 ?auto_143381 ) ( not ( = ?auto_143381 ?auto_143382 ) ) ( not ( = ?auto_143381 ?auto_143383 ) ) ( not ( = ?auto_143381 ?auto_143384 ) ) ( not ( = ?auto_143382 ?auto_143383 ) ) ( not ( = ?auto_143382 ?auto_143384 ) ) ( not ( = ?auto_143383 ?auto_143384 ) ) ( ON ?auto_143384 ?auto_143385 ) ( not ( = ?auto_143381 ?auto_143385 ) ) ( not ( = ?auto_143382 ?auto_143385 ) ) ( not ( = ?auto_143383 ?auto_143385 ) ) ( not ( = ?auto_143384 ?auto_143385 ) ) ( CLEAR ?auto_143382 ) ( ON ?auto_143383 ?auto_143384 ) ( CLEAR ?auto_143383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143389 ) ( ON ?auto_143386 ?auto_143389 ) ( ON ?auto_143387 ?auto_143386 ) ( ON ?auto_143388 ?auto_143387 ) ( ON ?auto_143385 ?auto_143388 ) ( not ( = ?auto_143389 ?auto_143386 ) ) ( not ( = ?auto_143389 ?auto_143387 ) ) ( not ( = ?auto_143389 ?auto_143388 ) ) ( not ( = ?auto_143389 ?auto_143385 ) ) ( not ( = ?auto_143389 ?auto_143384 ) ) ( not ( = ?auto_143389 ?auto_143383 ) ) ( not ( = ?auto_143386 ?auto_143387 ) ) ( not ( = ?auto_143386 ?auto_143388 ) ) ( not ( = ?auto_143386 ?auto_143385 ) ) ( not ( = ?auto_143386 ?auto_143384 ) ) ( not ( = ?auto_143386 ?auto_143383 ) ) ( not ( = ?auto_143387 ?auto_143388 ) ) ( not ( = ?auto_143387 ?auto_143385 ) ) ( not ( = ?auto_143387 ?auto_143384 ) ) ( not ( = ?auto_143387 ?auto_143383 ) ) ( not ( = ?auto_143388 ?auto_143385 ) ) ( not ( = ?auto_143388 ?auto_143384 ) ) ( not ( = ?auto_143388 ?auto_143383 ) ) ( not ( = ?auto_143381 ?auto_143389 ) ) ( not ( = ?auto_143381 ?auto_143386 ) ) ( not ( = ?auto_143381 ?auto_143387 ) ) ( not ( = ?auto_143381 ?auto_143388 ) ) ( not ( = ?auto_143382 ?auto_143389 ) ) ( not ( = ?auto_143382 ?auto_143386 ) ) ( not ( = ?auto_143382 ?auto_143387 ) ) ( not ( = ?auto_143382 ?auto_143388 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143389 ?auto_143386 ?auto_143387 ?auto_143388 ?auto_143385 ?auto_143384 )
      ( MAKE-4PILE ?auto_143381 ?auto_143382 ?auto_143383 ?auto_143384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143390 - BLOCK
      ?auto_143391 - BLOCK
      ?auto_143392 - BLOCK
      ?auto_143393 - BLOCK
    )
    :vars
    (
      ?auto_143398 - BLOCK
      ?auto_143396 - BLOCK
      ?auto_143397 - BLOCK
      ?auto_143395 - BLOCK
      ?auto_143394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143390 ) ( not ( = ?auto_143390 ?auto_143391 ) ) ( not ( = ?auto_143390 ?auto_143392 ) ) ( not ( = ?auto_143390 ?auto_143393 ) ) ( not ( = ?auto_143391 ?auto_143392 ) ) ( not ( = ?auto_143391 ?auto_143393 ) ) ( not ( = ?auto_143392 ?auto_143393 ) ) ( ON ?auto_143393 ?auto_143398 ) ( not ( = ?auto_143390 ?auto_143398 ) ) ( not ( = ?auto_143391 ?auto_143398 ) ) ( not ( = ?auto_143392 ?auto_143398 ) ) ( not ( = ?auto_143393 ?auto_143398 ) ) ( ON ?auto_143392 ?auto_143393 ) ( CLEAR ?auto_143392 ) ( ON-TABLE ?auto_143396 ) ( ON ?auto_143397 ?auto_143396 ) ( ON ?auto_143395 ?auto_143397 ) ( ON ?auto_143394 ?auto_143395 ) ( ON ?auto_143398 ?auto_143394 ) ( not ( = ?auto_143396 ?auto_143397 ) ) ( not ( = ?auto_143396 ?auto_143395 ) ) ( not ( = ?auto_143396 ?auto_143394 ) ) ( not ( = ?auto_143396 ?auto_143398 ) ) ( not ( = ?auto_143396 ?auto_143393 ) ) ( not ( = ?auto_143396 ?auto_143392 ) ) ( not ( = ?auto_143397 ?auto_143395 ) ) ( not ( = ?auto_143397 ?auto_143394 ) ) ( not ( = ?auto_143397 ?auto_143398 ) ) ( not ( = ?auto_143397 ?auto_143393 ) ) ( not ( = ?auto_143397 ?auto_143392 ) ) ( not ( = ?auto_143395 ?auto_143394 ) ) ( not ( = ?auto_143395 ?auto_143398 ) ) ( not ( = ?auto_143395 ?auto_143393 ) ) ( not ( = ?auto_143395 ?auto_143392 ) ) ( not ( = ?auto_143394 ?auto_143398 ) ) ( not ( = ?auto_143394 ?auto_143393 ) ) ( not ( = ?auto_143394 ?auto_143392 ) ) ( not ( = ?auto_143390 ?auto_143396 ) ) ( not ( = ?auto_143390 ?auto_143397 ) ) ( not ( = ?auto_143390 ?auto_143395 ) ) ( not ( = ?auto_143390 ?auto_143394 ) ) ( not ( = ?auto_143391 ?auto_143396 ) ) ( not ( = ?auto_143391 ?auto_143397 ) ) ( not ( = ?auto_143391 ?auto_143395 ) ) ( not ( = ?auto_143391 ?auto_143394 ) ) ( HOLDING ?auto_143391 ) ( CLEAR ?auto_143390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143390 ?auto_143391 )
      ( MAKE-4PILE ?auto_143390 ?auto_143391 ?auto_143392 ?auto_143393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143399 - BLOCK
      ?auto_143400 - BLOCK
      ?auto_143401 - BLOCK
      ?auto_143402 - BLOCK
    )
    :vars
    (
      ?auto_143407 - BLOCK
      ?auto_143403 - BLOCK
      ?auto_143405 - BLOCK
      ?auto_143404 - BLOCK
      ?auto_143406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143399 ) ( not ( = ?auto_143399 ?auto_143400 ) ) ( not ( = ?auto_143399 ?auto_143401 ) ) ( not ( = ?auto_143399 ?auto_143402 ) ) ( not ( = ?auto_143400 ?auto_143401 ) ) ( not ( = ?auto_143400 ?auto_143402 ) ) ( not ( = ?auto_143401 ?auto_143402 ) ) ( ON ?auto_143402 ?auto_143407 ) ( not ( = ?auto_143399 ?auto_143407 ) ) ( not ( = ?auto_143400 ?auto_143407 ) ) ( not ( = ?auto_143401 ?auto_143407 ) ) ( not ( = ?auto_143402 ?auto_143407 ) ) ( ON ?auto_143401 ?auto_143402 ) ( ON-TABLE ?auto_143403 ) ( ON ?auto_143405 ?auto_143403 ) ( ON ?auto_143404 ?auto_143405 ) ( ON ?auto_143406 ?auto_143404 ) ( ON ?auto_143407 ?auto_143406 ) ( not ( = ?auto_143403 ?auto_143405 ) ) ( not ( = ?auto_143403 ?auto_143404 ) ) ( not ( = ?auto_143403 ?auto_143406 ) ) ( not ( = ?auto_143403 ?auto_143407 ) ) ( not ( = ?auto_143403 ?auto_143402 ) ) ( not ( = ?auto_143403 ?auto_143401 ) ) ( not ( = ?auto_143405 ?auto_143404 ) ) ( not ( = ?auto_143405 ?auto_143406 ) ) ( not ( = ?auto_143405 ?auto_143407 ) ) ( not ( = ?auto_143405 ?auto_143402 ) ) ( not ( = ?auto_143405 ?auto_143401 ) ) ( not ( = ?auto_143404 ?auto_143406 ) ) ( not ( = ?auto_143404 ?auto_143407 ) ) ( not ( = ?auto_143404 ?auto_143402 ) ) ( not ( = ?auto_143404 ?auto_143401 ) ) ( not ( = ?auto_143406 ?auto_143407 ) ) ( not ( = ?auto_143406 ?auto_143402 ) ) ( not ( = ?auto_143406 ?auto_143401 ) ) ( not ( = ?auto_143399 ?auto_143403 ) ) ( not ( = ?auto_143399 ?auto_143405 ) ) ( not ( = ?auto_143399 ?auto_143404 ) ) ( not ( = ?auto_143399 ?auto_143406 ) ) ( not ( = ?auto_143400 ?auto_143403 ) ) ( not ( = ?auto_143400 ?auto_143405 ) ) ( not ( = ?auto_143400 ?auto_143404 ) ) ( not ( = ?auto_143400 ?auto_143406 ) ) ( CLEAR ?auto_143399 ) ( ON ?auto_143400 ?auto_143401 ) ( CLEAR ?auto_143400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143403 ?auto_143405 ?auto_143404 ?auto_143406 ?auto_143407 ?auto_143402 ?auto_143401 )
      ( MAKE-4PILE ?auto_143399 ?auto_143400 ?auto_143401 ?auto_143402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143408 - BLOCK
      ?auto_143409 - BLOCK
      ?auto_143410 - BLOCK
      ?auto_143411 - BLOCK
    )
    :vars
    (
      ?auto_143415 - BLOCK
      ?auto_143412 - BLOCK
      ?auto_143416 - BLOCK
      ?auto_143413 - BLOCK
      ?auto_143414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143408 ?auto_143409 ) ) ( not ( = ?auto_143408 ?auto_143410 ) ) ( not ( = ?auto_143408 ?auto_143411 ) ) ( not ( = ?auto_143409 ?auto_143410 ) ) ( not ( = ?auto_143409 ?auto_143411 ) ) ( not ( = ?auto_143410 ?auto_143411 ) ) ( ON ?auto_143411 ?auto_143415 ) ( not ( = ?auto_143408 ?auto_143415 ) ) ( not ( = ?auto_143409 ?auto_143415 ) ) ( not ( = ?auto_143410 ?auto_143415 ) ) ( not ( = ?auto_143411 ?auto_143415 ) ) ( ON ?auto_143410 ?auto_143411 ) ( ON-TABLE ?auto_143412 ) ( ON ?auto_143416 ?auto_143412 ) ( ON ?auto_143413 ?auto_143416 ) ( ON ?auto_143414 ?auto_143413 ) ( ON ?auto_143415 ?auto_143414 ) ( not ( = ?auto_143412 ?auto_143416 ) ) ( not ( = ?auto_143412 ?auto_143413 ) ) ( not ( = ?auto_143412 ?auto_143414 ) ) ( not ( = ?auto_143412 ?auto_143415 ) ) ( not ( = ?auto_143412 ?auto_143411 ) ) ( not ( = ?auto_143412 ?auto_143410 ) ) ( not ( = ?auto_143416 ?auto_143413 ) ) ( not ( = ?auto_143416 ?auto_143414 ) ) ( not ( = ?auto_143416 ?auto_143415 ) ) ( not ( = ?auto_143416 ?auto_143411 ) ) ( not ( = ?auto_143416 ?auto_143410 ) ) ( not ( = ?auto_143413 ?auto_143414 ) ) ( not ( = ?auto_143413 ?auto_143415 ) ) ( not ( = ?auto_143413 ?auto_143411 ) ) ( not ( = ?auto_143413 ?auto_143410 ) ) ( not ( = ?auto_143414 ?auto_143415 ) ) ( not ( = ?auto_143414 ?auto_143411 ) ) ( not ( = ?auto_143414 ?auto_143410 ) ) ( not ( = ?auto_143408 ?auto_143412 ) ) ( not ( = ?auto_143408 ?auto_143416 ) ) ( not ( = ?auto_143408 ?auto_143413 ) ) ( not ( = ?auto_143408 ?auto_143414 ) ) ( not ( = ?auto_143409 ?auto_143412 ) ) ( not ( = ?auto_143409 ?auto_143416 ) ) ( not ( = ?auto_143409 ?auto_143413 ) ) ( not ( = ?auto_143409 ?auto_143414 ) ) ( ON ?auto_143409 ?auto_143410 ) ( CLEAR ?auto_143409 ) ( HOLDING ?auto_143408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143408 )
      ( MAKE-4PILE ?auto_143408 ?auto_143409 ?auto_143410 ?auto_143411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143417 - BLOCK
      ?auto_143418 - BLOCK
      ?auto_143419 - BLOCK
      ?auto_143420 - BLOCK
    )
    :vars
    (
      ?auto_143424 - BLOCK
      ?auto_143425 - BLOCK
      ?auto_143422 - BLOCK
      ?auto_143421 - BLOCK
      ?auto_143423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143417 ?auto_143418 ) ) ( not ( = ?auto_143417 ?auto_143419 ) ) ( not ( = ?auto_143417 ?auto_143420 ) ) ( not ( = ?auto_143418 ?auto_143419 ) ) ( not ( = ?auto_143418 ?auto_143420 ) ) ( not ( = ?auto_143419 ?auto_143420 ) ) ( ON ?auto_143420 ?auto_143424 ) ( not ( = ?auto_143417 ?auto_143424 ) ) ( not ( = ?auto_143418 ?auto_143424 ) ) ( not ( = ?auto_143419 ?auto_143424 ) ) ( not ( = ?auto_143420 ?auto_143424 ) ) ( ON ?auto_143419 ?auto_143420 ) ( ON-TABLE ?auto_143425 ) ( ON ?auto_143422 ?auto_143425 ) ( ON ?auto_143421 ?auto_143422 ) ( ON ?auto_143423 ?auto_143421 ) ( ON ?auto_143424 ?auto_143423 ) ( not ( = ?auto_143425 ?auto_143422 ) ) ( not ( = ?auto_143425 ?auto_143421 ) ) ( not ( = ?auto_143425 ?auto_143423 ) ) ( not ( = ?auto_143425 ?auto_143424 ) ) ( not ( = ?auto_143425 ?auto_143420 ) ) ( not ( = ?auto_143425 ?auto_143419 ) ) ( not ( = ?auto_143422 ?auto_143421 ) ) ( not ( = ?auto_143422 ?auto_143423 ) ) ( not ( = ?auto_143422 ?auto_143424 ) ) ( not ( = ?auto_143422 ?auto_143420 ) ) ( not ( = ?auto_143422 ?auto_143419 ) ) ( not ( = ?auto_143421 ?auto_143423 ) ) ( not ( = ?auto_143421 ?auto_143424 ) ) ( not ( = ?auto_143421 ?auto_143420 ) ) ( not ( = ?auto_143421 ?auto_143419 ) ) ( not ( = ?auto_143423 ?auto_143424 ) ) ( not ( = ?auto_143423 ?auto_143420 ) ) ( not ( = ?auto_143423 ?auto_143419 ) ) ( not ( = ?auto_143417 ?auto_143425 ) ) ( not ( = ?auto_143417 ?auto_143422 ) ) ( not ( = ?auto_143417 ?auto_143421 ) ) ( not ( = ?auto_143417 ?auto_143423 ) ) ( not ( = ?auto_143418 ?auto_143425 ) ) ( not ( = ?auto_143418 ?auto_143422 ) ) ( not ( = ?auto_143418 ?auto_143421 ) ) ( not ( = ?auto_143418 ?auto_143423 ) ) ( ON ?auto_143418 ?auto_143419 ) ( ON ?auto_143417 ?auto_143418 ) ( CLEAR ?auto_143417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143425 ?auto_143422 ?auto_143421 ?auto_143423 ?auto_143424 ?auto_143420 ?auto_143419 ?auto_143418 )
      ( MAKE-4PILE ?auto_143417 ?auto_143418 ?auto_143419 ?auto_143420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143430 - BLOCK
      ?auto_143431 - BLOCK
      ?auto_143432 - BLOCK
      ?auto_143433 - BLOCK
    )
    :vars
    (
      ?auto_143434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143434 ?auto_143433 ) ( CLEAR ?auto_143434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143430 ) ( ON ?auto_143431 ?auto_143430 ) ( ON ?auto_143432 ?auto_143431 ) ( ON ?auto_143433 ?auto_143432 ) ( not ( = ?auto_143430 ?auto_143431 ) ) ( not ( = ?auto_143430 ?auto_143432 ) ) ( not ( = ?auto_143430 ?auto_143433 ) ) ( not ( = ?auto_143430 ?auto_143434 ) ) ( not ( = ?auto_143431 ?auto_143432 ) ) ( not ( = ?auto_143431 ?auto_143433 ) ) ( not ( = ?auto_143431 ?auto_143434 ) ) ( not ( = ?auto_143432 ?auto_143433 ) ) ( not ( = ?auto_143432 ?auto_143434 ) ) ( not ( = ?auto_143433 ?auto_143434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143434 ?auto_143433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143435 - BLOCK
      ?auto_143436 - BLOCK
      ?auto_143437 - BLOCK
      ?auto_143438 - BLOCK
    )
    :vars
    (
      ?auto_143439 - BLOCK
      ?auto_143440 - BLOCK
      ?auto_143441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143439 ?auto_143438 ) ( CLEAR ?auto_143439 ) ( ON-TABLE ?auto_143435 ) ( ON ?auto_143436 ?auto_143435 ) ( ON ?auto_143437 ?auto_143436 ) ( ON ?auto_143438 ?auto_143437 ) ( not ( = ?auto_143435 ?auto_143436 ) ) ( not ( = ?auto_143435 ?auto_143437 ) ) ( not ( = ?auto_143435 ?auto_143438 ) ) ( not ( = ?auto_143435 ?auto_143439 ) ) ( not ( = ?auto_143436 ?auto_143437 ) ) ( not ( = ?auto_143436 ?auto_143438 ) ) ( not ( = ?auto_143436 ?auto_143439 ) ) ( not ( = ?auto_143437 ?auto_143438 ) ) ( not ( = ?auto_143437 ?auto_143439 ) ) ( not ( = ?auto_143438 ?auto_143439 ) ) ( HOLDING ?auto_143440 ) ( CLEAR ?auto_143441 ) ( not ( = ?auto_143435 ?auto_143440 ) ) ( not ( = ?auto_143435 ?auto_143441 ) ) ( not ( = ?auto_143436 ?auto_143440 ) ) ( not ( = ?auto_143436 ?auto_143441 ) ) ( not ( = ?auto_143437 ?auto_143440 ) ) ( not ( = ?auto_143437 ?auto_143441 ) ) ( not ( = ?auto_143438 ?auto_143440 ) ) ( not ( = ?auto_143438 ?auto_143441 ) ) ( not ( = ?auto_143439 ?auto_143440 ) ) ( not ( = ?auto_143439 ?auto_143441 ) ) ( not ( = ?auto_143440 ?auto_143441 ) ) )
    :subtasks
    ( ( !STACK ?auto_143440 ?auto_143441 )
      ( MAKE-4PILE ?auto_143435 ?auto_143436 ?auto_143437 ?auto_143438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143442 - BLOCK
      ?auto_143443 - BLOCK
      ?auto_143444 - BLOCK
      ?auto_143445 - BLOCK
    )
    :vars
    (
      ?auto_143447 - BLOCK
      ?auto_143448 - BLOCK
      ?auto_143446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143447 ?auto_143445 ) ( ON-TABLE ?auto_143442 ) ( ON ?auto_143443 ?auto_143442 ) ( ON ?auto_143444 ?auto_143443 ) ( ON ?auto_143445 ?auto_143444 ) ( not ( = ?auto_143442 ?auto_143443 ) ) ( not ( = ?auto_143442 ?auto_143444 ) ) ( not ( = ?auto_143442 ?auto_143445 ) ) ( not ( = ?auto_143442 ?auto_143447 ) ) ( not ( = ?auto_143443 ?auto_143444 ) ) ( not ( = ?auto_143443 ?auto_143445 ) ) ( not ( = ?auto_143443 ?auto_143447 ) ) ( not ( = ?auto_143444 ?auto_143445 ) ) ( not ( = ?auto_143444 ?auto_143447 ) ) ( not ( = ?auto_143445 ?auto_143447 ) ) ( CLEAR ?auto_143448 ) ( not ( = ?auto_143442 ?auto_143446 ) ) ( not ( = ?auto_143442 ?auto_143448 ) ) ( not ( = ?auto_143443 ?auto_143446 ) ) ( not ( = ?auto_143443 ?auto_143448 ) ) ( not ( = ?auto_143444 ?auto_143446 ) ) ( not ( = ?auto_143444 ?auto_143448 ) ) ( not ( = ?auto_143445 ?auto_143446 ) ) ( not ( = ?auto_143445 ?auto_143448 ) ) ( not ( = ?auto_143447 ?auto_143446 ) ) ( not ( = ?auto_143447 ?auto_143448 ) ) ( not ( = ?auto_143446 ?auto_143448 ) ) ( ON ?auto_143446 ?auto_143447 ) ( CLEAR ?auto_143446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143442 ?auto_143443 ?auto_143444 ?auto_143445 ?auto_143447 )
      ( MAKE-4PILE ?auto_143442 ?auto_143443 ?auto_143444 ?auto_143445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143449 - BLOCK
      ?auto_143450 - BLOCK
      ?auto_143451 - BLOCK
      ?auto_143452 - BLOCK
    )
    :vars
    (
      ?auto_143453 - BLOCK
      ?auto_143454 - BLOCK
      ?auto_143455 - BLOCK
      ?auto_143457 - BLOCK
      ?auto_143456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143453 ?auto_143452 ) ( ON-TABLE ?auto_143449 ) ( ON ?auto_143450 ?auto_143449 ) ( ON ?auto_143451 ?auto_143450 ) ( ON ?auto_143452 ?auto_143451 ) ( not ( = ?auto_143449 ?auto_143450 ) ) ( not ( = ?auto_143449 ?auto_143451 ) ) ( not ( = ?auto_143449 ?auto_143452 ) ) ( not ( = ?auto_143449 ?auto_143453 ) ) ( not ( = ?auto_143450 ?auto_143451 ) ) ( not ( = ?auto_143450 ?auto_143452 ) ) ( not ( = ?auto_143450 ?auto_143453 ) ) ( not ( = ?auto_143451 ?auto_143452 ) ) ( not ( = ?auto_143451 ?auto_143453 ) ) ( not ( = ?auto_143452 ?auto_143453 ) ) ( not ( = ?auto_143449 ?auto_143454 ) ) ( not ( = ?auto_143449 ?auto_143455 ) ) ( not ( = ?auto_143450 ?auto_143454 ) ) ( not ( = ?auto_143450 ?auto_143455 ) ) ( not ( = ?auto_143451 ?auto_143454 ) ) ( not ( = ?auto_143451 ?auto_143455 ) ) ( not ( = ?auto_143452 ?auto_143454 ) ) ( not ( = ?auto_143452 ?auto_143455 ) ) ( not ( = ?auto_143453 ?auto_143454 ) ) ( not ( = ?auto_143453 ?auto_143455 ) ) ( not ( = ?auto_143454 ?auto_143455 ) ) ( ON ?auto_143454 ?auto_143453 ) ( CLEAR ?auto_143454 ) ( HOLDING ?auto_143455 ) ( CLEAR ?auto_143457 ) ( ON-TABLE ?auto_143456 ) ( ON ?auto_143457 ?auto_143456 ) ( not ( = ?auto_143456 ?auto_143457 ) ) ( not ( = ?auto_143456 ?auto_143455 ) ) ( not ( = ?auto_143457 ?auto_143455 ) ) ( not ( = ?auto_143449 ?auto_143457 ) ) ( not ( = ?auto_143449 ?auto_143456 ) ) ( not ( = ?auto_143450 ?auto_143457 ) ) ( not ( = ?auto_143450 ?auto_143456 ) ) ( not ( = ?auto_143451 ?auto_143457 ) ) ( not ( = ?auto_143451 ?auto_143456 ) ) ( not ( = ?auto_143452 ?auto_143457 ) ) ( not ( = ?auto_143452 ?auto_143456 ) ) ( not ( = ?auto_143453 ?auto_143457 ) ) ( not ( = ?auto_143453 ?auto_143456 ) ) ( not ( = ?auto_143454 ?auto_143457 ) ) ( not ( = ?auto_143454 ?auto_143456 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143456 ?auto_143457 ?auto_143455 )
      ( MAKE-4PILE ?auto_143449 ?auto_143450 ?auto_143451 ?auto_143452 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143458 - BLOCK
      ?auto_143459 - BLOCK
      ?auto_143460 - BLOCK
      ?auto_143461 - BLOCK
    )
    :vars
    (
      ?auto_143464 - BLOCK
      ?auto_143466 - BLOCK
      ?auto_143463 - BLOCK
      ?auto_143462 - BLOCK
      ?auto_143465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143464 ?auto_143461 ) ( ON-TABLE ?auto_143458 ) ( ON ?auto_143459 ?auto_143458 ) ( ON ?auto_143460 ?auto_143459 ) ( ON ?auto_143461 ?auto_143460 ) ( not ( = ?auto_143458 ?auto_143459 ) ) ( not ( = ?auto_143458 ?auto_143460 ) ) ( not ( = ?auto_143458 ?auto_143461 ) ) ( not ( = ?auto_143458 ?auto_143464 ) ) ( not ( = ?auto_143459 ?auto_143460 ) ) ( not ( = ?auto_143459 ?auto_143461 ) ) ( not ( = ?auto_143459 ?auto_143464 ) ) ( not ( = ?auto_143460 ?auto_143461 ) ) ( not ( = ?auto_143460 ?auto_143464 ) ) ( not ( = ?auto_143461 ?auto_143464 ) ) ( not ( = ?auto_143458 ?auto_143466 ) ) ( not ( = ?auto_143458 ?auto_143463 ) ) ( not ( = ?auto_143459 ?auto_143466 ) ) ( not ( = ?auto_143459 ?auto_143463 ) ) ( not ( = ?auto_143460 ?auto_143466 ) ) ( not ( = ?auto_143460 ?auto_143463 ) ) ( not ( = ?auto_143461 ?auto_143466 ) ) ( not ( = ?auto_143461 ?auto_143463 ) ) ( not ( = ?auto_143464 ?auto_143466 ) ) ( not ( = ?auto_143464 ?auto_143463 ) ) ( not ( = ?auto_143466 ?auto_143463 ) ) ( ON ?auto_143466 ?auto_143464 ) ( CLEAR ?auto_143462 ) ( ON-TABLE ?auto_143465 ) ( ON ?auto_143462 ?auto_143465 ) ( not ( = ?auto_143465 ?auto_143462 ) ) ( not ( = ?auto_143465 ?auto_143463 ) ) ( not ( = ?auto_143462 ?auto_143463 ) ) ( not ( = ?auto_143458 ?auto_143462 ) ) ( not ( = ?auto_143458 ?auto_143465 ) ) ( not ( = ?auto_143459 ?auto_143462 ) ) ( not ( = ?auto_143459 ?auto_143465 ) ) ( not ( = ?auto_143460 ?auto_143462 ) ) ( not ( = ?auto_143460 ?auto_143465 ) ) ( not ( = ?auto_143461 ?auto_143462 ) ) ( not ( = ?auto_143461 ?auto_143465 ) ) ( not ( = ?auto_143464 ?auto_143462 ) ) ( not ( = ?auto_143464 ?auto_143465 ) ) ( not ( = ?auto_143466 ?auto_143462 ) ) ( not ( = ?auto_143466 ?auto_143465 ) ) ( ON ?auto_143463 ?auto_143466 ) ( CLEAR ?auto_143463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143458 ?auto_143459 ?auto_143460 ?auto_143461 ?auto_143464 ?auto_143466 )
      ( MAKE-4PILE ?auto_143458 ?auto_143459 ?auto_143460 ?auto_143461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143467 - BLOCK
      ?auto_143468 - BLOCK
      ?auto_143469 - BLOCK
      ?auto_143470 - BLOCK
    )
    :vars
    (
      ?auto_143471 - BLOCK
      ?auto_143472 - BLOCK
      ?auto_143473 - BLOCK
      ?auto_143474 - BLOCK
      ?auto_143475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143471 ?auto_143470 ) ( ON-TABLE ?auto_143467 ) ( ON ?auto_143468 ?auto_143467 ) ( ON ?auto_143469 ?auto_143468 ) ( ON ?auto_143470 ?auto_143469 ) ( not ( = ?auto_143467 ?auto_143468 ) ) ( not ( = ?auto_143467 ?auto_143469 ) ) ( not ( = ?auto_143467 ?auto_143470 ) ) ( not ( = ?auto_143467 ?auto_143471 ) ) ( not ( = ?auto_143468 ?auto_143469 ) ) ( not ( = ?auto_143468 ?auto_143470 ) ) ( not ( = ?auto_143468 ?auto_143471 ) ) ( not ( = ?auto_143469 ?auto_143470 ) ) ( not ( = ?auto_143469 ?auto_143471 ) ) ( not ( = ?auto_143470 ?auto_143471 ) ) ( not ( = ?auto_143467 ?auto_143472 ) ) ( not ( = ?auto_143467 ?auto_143473 ) ) ( not ( = ?auto_143468 ?auto_143472 ) ) ( not ( = ?auto_143468 ?auto_143473 ) ) ( not ( = ?auto_143469 ?auto_143472 ) ) ( not ( = ?auto_143469 ?auto_143473 ) ) ( not ( = ?auto_143470 ?auto_143472 ) ) ( not ( = ?auto_143470 ?auto_143473 ) ) ( not ( = ?auto_143471 ?auto_143472 ) ) ( not ( = ?auto_143471 ?auto_143473 ) ) ( not ( = ?auto_143472 ?auto_143473 ) ) ( ON ?auto_143472 ?auto_143471 ) ( ON-TABLE ?auto_143474 ) ( not ( = ?auto_143474 ?auto_143475 ) ) ( not ( = ?auto_143474 ?auto_143473 ) ) ( not ( = ?auto_143475 ?auto_143473 ) ) ( not ( = ?auto_143467 ?auto_143475 ) ) ( not ( = ?auto_143467 ?auto_143474 ) ) ( not ( = ?auto_143468 ?auto_143475 ) ) ( not ( = ?auto_143468 ?auto_143474 ) ) ( not ( = ?auto_143469 ?auto_143475 ) ) ( not ( = ?auto_143469 ?auto_143474 ) ) ( not ( = ?auto_143470 ?auto_143475 ) ) ( not ( = ?auto_143470 ?auto_143474 ) ) ( not ( = ?auto_143471 ?auto_143475 ) ) ( not ( = ?auto_143471 ?auto_143474 ) ) ( not ( = ?auto_143472 ?auto_143475 ) ) ( not ( = ?auto_143472 ?auto_143474 ) ) ( ON ?auto_143473 ?auto_143472 ) ( CLEAR ?auto_143473 ) ( HOLDING ?auto_143475 ) ( CLEAR ?auto_143474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143474 ?auto_143475 )
      ( MAKE-4PILE ?auto_143467 ?auto_143468 ?auto_143469 ?auto_143470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145169 - BLOCK
      ?auto_145170 - BLOCK
      ?auto_145171 - BLOCK
      ?auto_145172 - BLOCK
    )
    :vars
    (
      ?auto_145174 - BLOCK
      ?auto_145176 - BLOCK
      ?auto_145173 - BLOCK
      ?auto_145175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145174 ?auto_145172 ) ( ON-TABLE ?auto_145169 ) ( ON ?auto_145170 ?auto_145169 ) ( ON ?auto_145171 ?auto_145170 ) ( ON ?auto_145172 ?auto_145171 ) ( not ( = ?auto_145169 ?auto_145170 ) ) ( not ( = ?auto_145169 ?auto_145171 ) ) ( not ( = ?auto_145169 ?auto_145172 ) ) ( not ( = ?auto_145169 ?auto_145174 ) ) ( not ( = ?auto_145170 ?auto_145171 ) ) ( not ( = ?auto_145170 ?auto_145172 ) ) ( not ( = ?auto_145170 ?auto_145174 ) ) ( not ( = ?auto_145171 ?auto_145172 ) ) ( not ( = ?auto_145171 ?auto_145174 ) ) ( not ( = ?auto_145172 ?auto_145174 ) ) ( not ( = ?auto_145169 ?auto_145176 ) ) ( not ( = ?auto_145169 ?auto_145173 ) ) ( not ( = ?auto_145170 ?auto_145176 ) ) ( not ( = ?auto_145170 ?auto_145173 ) ) ( not ( = ?auto_145171 ?auto_145176 ) ) ( not ( = ?auto_145171 ?auto_145173 ) ) ( not ( = ?auto_145172 ?auto_145176 ) ) ( not ( = ?auto_145172 ?auto_145173 ) ) ( not ( = ?auto_145174 ?auto_145176 ) ) ( not ( = ?auto_145174 ?auto_145173 ) ) ( not ( = ?auto_145176 ?auto_145173 ) ) ( ON ?auto_145176 ?auto_145174 ) ( not ( = ?auto_145175 ?auto_145173 ) ) ( not ( = ?auto_145169 ?auto_145175 ) ) ( not ( = ?auto_145170 ?auto_145175 ) ) ( not ( = ?auto_145171 ?auto_145175 ) ) ( not ( = ?auto_145172 ?auto_145175 ) ) ( not ( = ?auto_145174 ?auto_145175 ) ) ( not ( = ?auto_145176 ?auto_145175 ) ) ( ON ?auto_145173 ?auto_145176 ) ( ON ?auto_145175 ?auto_145173 ) ( CLEAR ?auto_145175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145169 ?auto_145170 ?auto_145171 ?auto_145172 ?auto_145174 ?auto_145176 ?auto_145173 )
      ( MAKE-4PILE ?auto_145169 ?auto_145170 ?auto_145171 ?auto_145172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143485 - BLOCK
      ?auto_143486 - BLOCK
      ?auto_143487 - BLOCK
      ?auto_143488 - BLOCK
    )
    :vars
    (
      ?auto_143491 - BLOCK
      ?auto_143493 - BLOCK
      ?auto_143492 - BLOCK
      ?auto_143489 - BLOCK
      ?auto_143490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143491 ?auto_143488 ) ( ON-TABLE ?auto_143485 ) ( ON ?auto_143486 ?auto_143485 ) ( ON ?auto_143487 ?auto_143486 ) ( ON ?auto_143488 ?auto_143487 ) ( not ( = ?auto_143485 ?auto_143486 ) ) ( not ( = ?auto_143485 ?auto_143487 ) ) ( not ( = ?auto_143485 ?auto_143488 ) ) ( not ( = ?auto_143485 ?auto_143491 ) ) ( not ( = ?auto_143486 ?auto_143487 ) ) ( not ( = ?auto_143486 ?auto_143488 ) ) ( not ( = ?auto_143486 ?auto_143491 ) ) ( not ( = ?auto_143487 ?auto_143488 ) ) ( not ( = ?auto_143487 ?auto_143491 ) ) ( not ( = ?auto_143488 ?auto_143491 ) ) ( not ( = ?auto_143485 ?auto_143493 ) ) ( not ( = ?auto_143485 ?auto_143492 ) ) ( not ( = ?auto_143486 ?auto_143493 ) ) ( not ( = ?auto_143486 ?auto_143492 ) ) ( not ( = ?auto_143487 ?auto_143493 ) ) ( not ( = ?auto_143487 ?auto_143492 ) ) ( not ( = ?auto_143488 ?auto_143493 ) ) ( not ( = ?auto_143488 ?auto_143492 ) ) ( not ( = ?auto_143491 ?auto_143493 ) ) ( not ( = ?auto_143491 ?auto_143492 ) ) ( not ( = ?auto_143493 ?auto_143492 ) ) ( ON ?auto_143493 ?auto_143491 ) ( not ( = ?auto_143489 ?auto_143490 ) ) ( not ( = ?auto_143489 ?auto_143492 ) ) ( not ( = ?auto_143490 ?auto_143492 ) ) ( not ( = ?auto_143485 ?auto_143490 ) ) ( not ( = ?auto_143485 ?auto_143489 ) ) ( not ( = ?auto_143486 ?auto_143490 ) ) ( not ( = ?auto_143486 ?auto_143489 ) ) ( not ( = ?auto_143487 ?auto_143490 ) ) ( not ( = ?auto_143487 ?auto_143489 ) ) ( not ( = ?auto_143488 ?auto_143490 ) ) ( not ( = ?auto_143488 ?auto_143489 ) ) ( not ( = ?auto_143491 ?auto_143490 ) ) ( not ( = ?auto_143491 ?auto_143489 ) ) ( not ( = ?auto_143493 ?auto_143490 ) ) ( not ( = ?auto_143493 ?auto_143489 ) ) ( ON ?auto_143492 ?auto_143493 ) ( ON ?auto_143490 ?auto_143492 ) ( CLEAR ?auto_143490 ) ( HOLDING ?auto_143489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143489 )
      ( MAKE-4PILE ?auto_143485 ?auto_143486 ?auto_143487 ?auto_143488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143494 - BLOCK
      ?auto_143495 - BLOCK
      ?auto_143496 - BLOCK
      ?auto_143497 - BLOCK
    )
    :vars
    (
      ?auto_143502 - BLOCK
      ?auto_143499 - BLOCK
      ?auto_143498 - BLOCK
      ?auto_143500 - BLOCK
      ?auto_143501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143502 ?auto_143497 ) ( ON-TABLE ?auto_143494 ) ( ON ?auto_143495 ?auto_143494 ) ( ON ?auto_143496 ?auto_143495 ) ( ON ?auto_143497 ?auto_143496 ) ( not ( = ?auto_143494 ?auto_143495 ) ) ( not ( = ?auto_143494 ?auto_143496 ) ) ( not ( = ?auto_143494 ?auto_143497 ) ) ( not ( = ?auto_143494 ?auto_143502 ) ) ( not ( = ?auto_143495 ?auto_143496 ) ) ( not ( = ?auto_143495 ?auto_143497 ) ) ( not ( = ?auto_143495 ?auto_143502 ) ) ( not ( = ?auto_143496 ?auto_143497 ) ) ( not ( = ?auto_143496 ?auto_143502 ) ) ( not ( = ?auto_143497 ?auto_143502 ) ) ( not ( = ?auto_143494 ?auto_143499 ) ) ( not ( = ?auto_143494 ?auto_143498 ) ) ( not ( = ?auto_143495 ?auto_143499 ) ) ( not ( = ?auto_143495 ?auto_143498 ) ) ( not ( = ?auto_143496 ?auto_143499 ) ) ( not ( = ?auto_143496 ?auto_143498 ) ) ( not ( = ?auto_143497 ?auto_143499 ) ) ( not ( = ?auto_143497 ?auto_143498 ) ) ( not ( = ?auto_143502 ?auto_143499 ) ) ( not ( = ?auto_143502 ?auto_143498 ) ) ( not ( = ?auto_143499 ?auto_143498 ) ) ( ON ?auto_143499 ?auto_143502 ) ( not ( = ?auto_143500 ?auto_143501 ) ) ( not ( = ?auto_143500 ?auto_143498 ) ) ( not ( = ?auto_143501 ?auto_143498 ) ) ( not ( = ?auto_143494 ?auto_143501 ) ) ( not ( = ?auto_143494 ?auto_143500 ) ) ( not ( = ?auto_143495 ?auto_143501 ) ) ( not ( = ?auto_143495 ?auto_143500 ) ) ( not ( = ?auto_143496 ?auto_143501 ) ) ( not ( = ?auto_143496 ?auto_143500 ) ) ( not ( = ?auto_143497 ?auto_143501 ) ) ( not ( = ?auto_143497 ?auto_143500 ) ) ( not ( = ?auto_143502 ?auto_143501 ) ) ( not ( = ?auto_143502 ?auto_143500 ) ) ( not ( = ?auto_143499 ?auto_143501 ) ) ( not ( = ?auto_143499 ?auto_143500 ) ) ( ON ?auto_143498 ?auto_143499 ) ( ON ?auto_143501 ?auto_143498 ) ( ON ?auto_143500 ?auto_143501 ) ( CLEAR ?auto_143500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143494 ?auto_143495 ?auto_143496 ?auto_143497 ?auto_143502 ?auto_143499 ?auto_143498 ?auto_143501 )
      ( MAKE-4PILE ?auto_143494 ?auto_143495 ?auto_143496 ?auto_143497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143508 - BLOCK
      ?auto_143509 - BLOCK
      ?auto_143510 - BLOCK
      ?auto_143511 - BLOCK
      ?auto_143512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143512 ) ( CLEAR ?auto_143511 ) ( ON-TABLE ?auto_143508 ) ( ON ?auto_143509 ?auto_143508 ) ( ON ?auto_143510 ?auto_143509 ) ( ON ?auto_143511 ?auto_143510 ) ( not ( = ?auto_143508 ?auto_143509 ) ) ( not ( = ?auto_143508 ?auto_143510 ) ) ( not ( = ?auto_143508 ?auto_143511 ) ) ( not ( = ?auto_143508 ?auto_143512 ) ) ( not ( = ?auto_143509 ?auto_143510 ) ) ( not ( = ?auto_143509 ?auto_143511 ) ) ( not ( = ?auto_143509 ?auto_143512 ) ) ( not ( = ?auto_143510 ?auto_143511 ) ) ( not ( = ?auto_143510 ?auto_143512 ) ) ( not ( = ?auto_143511 ?auto_143512 ) ) )
    :subtasks
    ( ( !STACK ?auto_143512 ?auto_143511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143513 - BLOCK
      ?auto_143514 - BLOCK
      ?auto_143515 - BLOCK
      ?auto_143516 - BLOCK
      ?auto_143517 - BLOCK
    )
    :vars
    (
      ?auto_143518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143516 ) ( ON-TABLE ?auto_143513 ) ( ON ?auto_143514 ?auto_143513 ) ( ON ?auto_143515 ?auto_143514 ) ( ON ?auto_143516 ?auto_143515 ) ( not ( = ?auto_143513 ?auto_143514 ) ) ( not ( = ?auto_143513 ?auto_143515 ) ) ( not ( = ?auto_143513 ?auto_143516 ) ) ( not ( = ?auto_143513 ?auto_143517 ) ) ( not ( = ?auto_143514 ?auto_143515 ) ) ( not ( = ?auto_143514 ?auto_143516 ) ) ( not ( = ?auto_143514 ?auto_143517 ) ) ( not ( = ?auto_143515 ?auto_143516 ) ) ( not ( = ?auto_143515 ?auto_143517 ) ) ( not ( = ?auto_143516 ?auto_143517 ) ) ( ON ?auto_143517 ?auto_143518 ) ( CLEAR ?auto_143517 ) ( HAND-EMPTY ) ( not ( = ?auto_143513 ?auto_143518 ) ) ( not ( = ?auto_143514 ?auto_143518 ) ) ( not ( = ?auto_143515 ?auto_143518 ) ) ( not ( = ?auto_143516 ?auto_143518 ) ) ( not ( = ?auto_143517 ?auto_143518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143517 ?auto_143518 )
      ( MAKE-5PILE ?auto_143513 ?auto_143514 ?auto_143515 ?auto_143516 ?auto_143517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143519 - BLOCK
      ?auto_143520 - BLOCK
      ?auto_143521 - BLOCK
      ?auto_143522 - BLOCK
      ?auto_143523 - BLOCK
    )
    :vars
    (
      ?auto_143524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143519 ) ( ON ?auto_143520 ?auto_143519 ) ( ON ?auto_143521 ?auto_143520 ) ( not ( = ?auto_143519 ?auto_143520 ) ) ( not ( = ?auto_143519 ?auto_143521 ) ) ( not ( = ?auto_143519 ?auto_143522 ) ) ( not ( = ?auto_143519 ?auto_143523 ) ) ( not ( = ?auto_143520 ?auto_143521 ) ) ( not ( = ?auto_143520 ?auto_143522 ) ) ( not ( = ?auto_143520 ?auto_143523 ) ) ( not ( = ?auto_143521 ?auto_143522 ) ) ( not ( = ?auto_143521 ?auto_143523 ) ) ( not ( = ?auto_143522 ?auto_143523 ) ) ( ON ?auto_143523 ?auto_143524 ) ( CLEAR ?auto_143523 ) ( not ( = ?auto_143519 ?auto_143524 ) ) ( not ( = ?auto_143520 ?auto_143524 ) ) ( not ( = ?auto_143521 ?auto_143524 ) ) ( not ( = ?auto_143522 ?auto_143524 ) ) ( not ( = ?auto_143523 ?auto_143524 ) ) ( HOLDING ?auto_143522 ) ( CLEAR ?auto_143521 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143519 ?auto_143520 ?auto_143521 ?auto_143522 )
      ( MAKE-5PILE ?auto_143519 ?auto_143520 ?auto_143521 ?auto_143522 ?auto_143523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143525 - BLOCK
      ?auto_143526 - BLOCK
      ?auto_143527 - BLOCK
      ?auto_143528 - BLOCK
      ?auto_143529 - BLOCK
    )
    :vars
    (
      ?auto_143530 - BLOCK
      ?auto_143532 - BLOCK
      ?auto_143533 - BLOCK
      ?auto_143531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143525 ) ( ON ?auto_143526 ?auto_143525 ) ( ON ?auto_143527 ?auto_143526 ) ( not ( = ?auto_143525 ?auto_143526 ) ) ( not ( = ?auto_143525 ?auto_143527 ) ) ( not ( = ?auto_143525 ?auto_143528 ) ) ( not ( = ?auto_143525 ?auto_143529 ) ) ( not ( = ?auto_143526 ?auto_143527 ) ) ( not ( = ?auto_143526 ?auto_143528 ) ) ( not ( = ?auto_143526 ?auto_143529 ) ) ( not ( = ?auto_143527 ?auto_143528 ) ) ( not ( = ?auto_143527 ?auto_143529 ) ) ( not ( = ?auto_143528 ?auto_143529 ) ) ( ON ?auto_143529 ?auto_143530 ) ( not ( = ?auto_143525 ?auto_143530 ) ) ( not ( = ?auto_143526 ?auto_143530 ) ) ( not ( = ?auto_143527 ?auto_143530 ) ) ( not ( = ?auto_143528 ?auto_143530 ) ) ( not ( = ?auto_143529 ?auto_143530 ) ) ( CLEAR ?auto_143527 ) ( ON ?auto_143528 ?auto_143529 ) ( CLEAR ?auto_143528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143532 ) ( ON ?auto_143533 ?auto_143532 ) ( ON ?auto_143531 ?auto_143533 ) ( ON ?auto_143530 ?auto_143531 ) ( not ( = ?auto_143532 ?auto_143533 ) ) ( not ( = ?auto_143532 ?auto_143531 ) ) ( not ( = ?auto_143532 ?auto_143530 ) ) ( not ( = ?auto_143532 ?auto_143529 ) ) ( not ( = ?auto_143532 ?auto_143528 ) ) ( not ( = ?auto_143533 ?auto_143531 ) ) ( not ( = ?auto_143533 ?auto_143530 ) ) ( not ( = ?auto_143533 ?auto_143529 ) ) ( not ( = ?auto_143533 ?auto_143528 ) ) ( not ( = ?auto_143531 ?auto_143530 ) ) ( not ( = ?auto_143531 ?auto_143529 ) ) ( not ( = ?auto_143531 ?auto_143528 ) ) ( not ( = ?auto_143525 ?auto_143532 ) ) ( not ( = ?auto_143525 ?auto_143533 ) ) ( not ( = ?auto_143525 ?auto_143531 ) ) ( not ( = ?auto_143526 ?auto_143532 ) ) ( not ( = ?auto_143526 ?auto_143533 ) ) ( not ( = ?auto_143526 ?auto_143531 ) ) ( not ( = ?auto_143527 ?auto_143532 ) ) ( not ( = ?auto_143527 ?auto_143533 ) ) ( not ( = ?auto_143527 ?auto_143531 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143532 ?auto_143533 ?auto_143531 ?auto_143530 ?auto_143529 )
      ( MAKE-5PILE ?auto_143525 ?auto_143526 ?auto_143527 ?auto_143528 ?auto_143529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143534 - BLOCK
      ?auto_143535 - BLOCK
      ?auto_143536 - BLOCK
      ?auto_143537 - BLOCK
      ?auto_143538 - BLOCK
    )
    :vars
    (
      ?auto_143539 - BLOCK
      ?auto_143541 - BLOCK
      ?auto_143540 - BLOCK
      ?auto_143542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143534 ) ( ON ?auto_143535 ?auto_143534 ) ( not ( = ?auto_143534 ?auto_143535 ) ) ( not ( = ?auto_143534 ?auto_143536 ) ) ( not ( = ?auto_143534 ?auto_143537 ) ) ( not ( = ?auto_143534 ?auto_143538 ) ) ( not ( = ?auto_143535 ?auto_143536 ) ) ( not ( = ?auto_143535 ?auto_143537 ) ) ( not ( = ?auto_143535 ?auto_143538 ) ) ( not ( = ?auto_143536 ?auto_143537 ) ) ( not ( = ?auto_143536 ?auto_143538 ) ) ( not ( = ?auto_143537 ?auto_143538 ) ) ( ON ?auto_143538 ?auto_143539 ) ( not ( = ?auto_143534 ?auto_143539 ) ) ( not ( = ?auto_143535 ?auto_143539 ) ) ( not ( = ?auto_143536 ?auto_143539 ) ) ( not ( = ?auto_143537 ?auto_143539 ) ) ( not ( = ?auto_143538 ?auto_143539 ) ) ( ON ?auto_143537 ?auto_143538 ) ( CLEAR ?auto_143537 ) ( ON-TABLE ?auto_143541 ) ( ON ?auto_143540 ?auto_143541 ) ( ON ?auto_143542 ?auto_143540 ) ( ON ?auto_143539 ?auto_143542 ) ( not ( = ?auto_143541 ?auto_143540 ) ) ( not ( = ?auto_143541 ?auto_143542 ) ) ( not ( = ?auto_143541 ?auto_143539 ) ) ( not ( = ?auto_143541 ?auto_143538 ) ) ( not ( = ?auto_143541 ?auto_143537 ) ) ( not ( = ?auto_143540 ?auto_143542 ) ) ( not ( = ?auto_143540 ?auto_143539 ) ) ( not ( = ?auto_143540 ?auto_143538 ) ) ( not ( = ?auto_143540 ?auto_143537 ) ) ( not ( = ?auto_143542 ?auto_143539 ) ) ( not ( = ?auto_143542 ?auto_143538 ) ) ( not ( = ?auto_143542 ?auto_143537 ) ) ( not ( = ?auto_143534 ?auto_143541 ) ) ( not ( = ?auto_143534 ?auto_143540 ) ) ( not ( = ?auto_143534 ?auto_143542 ) ) ( not ( = ?auto_143535 ?auto_143541 ) ) ( not ( = ?auto_143535 ?auto_143540 ) ) ( not ( = ?auto_143535 ?auto_143542 ) ) ( not ( = ?auto_143536 ?auto_143541 ) ) ( not ( = ?auto_143536 ?auto_143540 ) ) ( not ( = ?auto_143536 ?auto_143542 ) ) ( HOLDING ?auto_143536 ) ( CLEAR ?auto_143535 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143534 ?auto_143535 ?auto_143536 )
      ( MAKE-5PILE ?auto_143534 ?auto_143535 ?auto_143536 ?auto_143537 ?auto_143538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143543 - BLOCK
      ?auto_143544 - BLOCK
      ?auto_143545 - BLOCK
      ?auto_143546 - BLOCK
      ?auto_143547 - BLOCK
    )
    :vars
    (
      ?auto_143551 - BLOCK
      ?auto_143550 - BLOCK
      ?auto_143549 - BLOCK
      ?auto_143548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143543 ) ( ON ?auto_143544 ?auto_143543 ) ( not ( = ?auto_143543 ?auto_143544 ) ) ( not ( = ?auto_143543 ?auto_143545 ) ) ( not ( = ?auto_143543 ?auto_143546 ) ) ( not ( = ?auto_143543 ?auto_143547 ) ) ( not ( = ?auto_143544 ?auto_143545 ) ) ( not ( = ?auto_143544 ?auto_143546 ) ) ( not ( = ?auto_143544 ?auto_143547 ) ) ( not ( = ?auto_143545 ?auto_143546 ) ) ( not ( = ?auto_143545 ?auto_143547 ) ) ( not ( = ?auto_143546 ?auto_143547 ) ) ( ON ?auto_143547 ?auto_143551 ) ( not ( = ?auto_143543 ?auto_143551 ) ) ( not ( = ?auto_143544 ?auto_143551 ) ) ( not ( = ?auto_143545 ?auto_143551 ) ) ( not ( = ?auto_143546 ?auto_143551 ) ) ( not ( = ?auto_143547 ?auto_143551 ) ) ( ON ?auto_143546 ?auto_143547 ) ( ON-TABLE ?auto_143550 ) ( ON ?auto_143549 ?auto_143550 ) ( ON ?auto_143548 ?auto_143549 ) ( ON ?auto_143551 ?auto_143548 ) ( not ( = ?auto_143550 ?auto_143549 ) ) ( not ( = ?auto_143550 ?auto_143548 ) ) ( not ( = ?auto_143550 ?auto_143551 ) ) ( not ( = ?auto_143550 ?auto_143547 ) ) ( not ( = ?auto_143550 ?auto_143546 ) ) ( not ( = ?auto_143549 ?auto_143548 ) ) ( not ( = ?auto_143549 ?auto_143551 ) ) ( not ( = ?auto_143549 ?auto_143547 ) ) ( not ( = ?auto_143549 ?auto_143546 ) ) ( not ( = ?auto_143548 ?auto_143551 ) ) ( not ( = ?auto_143548 ?auto_143547 ) ) ( not ( = ?auto_143548 ?auto_143546 ) ) ( not ( = ?auto_143543 ?auto_143550 ) ) ( not ( = ?auto_143543 ?auto_143549 ) ) ( not ( = ?auto_143543 ?auto_143548 ) ) ( not ( = ?auto_143544 ?auto_143550 ) ) ( not ( = ?auto_143544 ?auto_143549 ) ) ( not ( = ?auto_143544 ?auto_143548 ) ) ( not ( = ?auto_143545 ?auto_143550 ) ) ( not ( = ?auto_143545 ?auto_143549 ) ) ( not ( = ?auto_143545 ?auto_143548 ) ) ( CLEAR ?auto_143544 ) ( ON ?auto_143545 ?auto_143546 ) ( CLEAR ?auto_143545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143550 ?auto_143549 ?auto_143548 ?auto_143551 ?auto_143547 ?auto_143546 )
      ( MAKE-5PILE ?auto_143543 ?auto_143544 ?auto_143545 ?auto_143546 ?auto_143547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143552 - BLOCK
      ?auto_143553 - BLOCK
      ?auto_143554 - BLOCK
      ?auto_143555 - BLOCK
      ?auto_143556 - BLOCK
    )
    :vars
    (
      ?auto_143560 - BLOCK
      ?auto_143558 - BLOCK
      ?auto_143557 - BLOCK
      ?auto_143559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143552 ) ( not ( = ?auto_143552 ?auto_143553 ) ) ( not ( = ?auto_143552 ?auto_143554 ) ) ( not ( = ?auto_143552 ?auto_143555 ) ) ( not ( = ?auto_143552 ?auto_143556 ) ) ( not ( = ?auto_143553 ?auto_143554 ) ) ( not ( = ?auto_143553 ?auto_143555 ) ) ( not ( = ?auto_143553 ?auto_143556 ) ) ( not ( = ?auto_143554 ?auto_143555 ) ) ( not ( = ?auto_143554 ?auto_143556 ) ) ( not ( = ?auto_143555 ?auto_143556 ) ) ( ON ?auto_143556 ?auto_143560 ) ( not ( = ?auto_143552 ?auto_143560 ) ) ( not ( = ?auto_143553 ?auto_143560 ) ) ( not ( = ?auto_143554 ?auto_143560 ) ) ( not ( = ?auto_143555 ?auto_143560 ) ) ( not ( = ?auto_143556 ?auto_143560 ) ) ( ON ?auto_143555 ?auto_143556 ) ( ON-TABLE ?auto_143558 ) ( ON ?auto_143557 ?auto_143558 ) ( ON ?auto_143559 ?auto_143557 ) ( ON ?auto_143560 ?auto_143559 ) ( not ( = ?auto_143558 ?auto_143557 ) ) ( not ( = ?auto_143558 ?auto_143559 ) ) ( not ( = ?auto_143558 ?auto_143560 ) ) ( not ( = ?auto_143558 ?auto_143556 ) ) ( not ( = ?auto_143558 ?auto_143555 ) ) ( not ( = ?auto_143557 ?auto_143559 ) ) ( not ( = ?auto_143557 ?auto_143560 ) ) ( not ( = ?auto_143557 ?auto_143556 ) ) ( not ( = ?auto_143557 ?auto_143555 ) ) ( not ( = ?auto_143559 ?auto_143560 ) ) ( not ( = ?auto_143559 ?auto_143556 ) ) ( not ( = ?auto_143559 ?auto_143555 ) ) ( not ( = ?auto_143552 ?auto_143558 ) ) ( not ( = ?auto_143552 ?auto_143557 ) ) ( not ( = ?auto_143552 ?auto_143559 ) ) ( not ( = ?auto_143553 ?auto_143558 ) ) ( not ( = ?auto_143553 ?auto_143557 ) ) ( not ( = ?auto_143553 ?auto_143559 ) ) ( not ( = ?auto_143554 ?auto_143558 ) ) ( not ( = ?auto_143554 ?auto_143557 ) ) ( not ( = ?auto_143554 ?auto_143559 ) ) ( ON ?auto_143554 ?auto_143555 ) ( CLEAR ?auto_143554 ) ( HOLDING ?auto_143553 ) ( CLEAR ?auto_143552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143552 ?auto_143553 )
      ( MAKE-5PILE ?auto_143552 ?auto_143553 ?auto_143554 ?auto_143555 ?auto_143556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143561 - BLOCK
      ?auto_143562 - BLOCK
      ?auto_143563 - BLOCK
      ?auto_143564 - BLOCK
      ?auto_143565 - BLOCK
    )
    :vars
    (
      ?auto_143569 - BLOCK
      ?auto_143568 - BLOCK
      ?auto_143566 - BLOCK
      ?auto_143567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143561 ) ( not ( = ?auto_143561 ?auto_143562 ) ) ( not ( = ?auto_143561 ?auto_143563 ) ) ( not ( = ?auto_143561 ?auto_143564 ) ) ( not ( = ?auto_143561 ?auto_143565 ) ) ( not ( = ?auto_143562 ?auto_143563 ) ) ( not ( = ?auto_143562 ?auto_143564 ) ) ( not ( = ?auto_143562 ?auto_143565 ) ) ( not ( = ?auto_143563 ?auto_143564 ) ) ( not ( = ?auto_143563 ?auto_143565 ) ) ( not ( = ?auto_143564 ?auto_143565 ) ) ( ON ?auto_143565 ?auto_143569 ) ( not ( = ?auto_143561 ?auto_143569 ) ) ( not ( = ?auto_143562 ?auto_143569 ) ) ( not ( = ?auto_143563 ?auto_143569 ) ) ( not ( = ?auto_143564 ?auto_143569 ) ) ( not ( = ?auto_143565 ?auto_143569 ) ) ( ON ?auto_143564 ?auto_143565 ) ( ON-TABLE ?auto_143568 ) ( ON ?auto_143566 ?auto_143568 ) ( ON ?auto_143567 ?auto_143566 ) ( ON ?auto_143569 ?auto_143567 ) ( not ( = ?auto_143568 ?auto_143566 ) ) ( not ( = ?auto_143568 ?auto_143567 ) ) ( not ( = ?auto_143568 ?auto_143569 ) ) ( not ( = ?auto_143568 ?auto_143565 ) ) ( not ( = ?auto_143568 ?auto_143564 ) ) ( not ( = ?auto_143566 ?auto_143567 ) ) ( not ( = ?auto_143566 ?auto_143569 ) ) ( not ( = ?auto_143566 ?auto_143565 ) ) ( not ( = ?auto_143566 ?auto_143564 ) ) ( not ( = ?auto_143567 ?auto_143569 ) ) ( not ( = ?auto_143567 ?auto_143565 ) ) ( not ( = ?auto_143567 ?auto_143564 ) ) ( not ( = ?auto_143561 ?auto_143568 ) ) ( not ( = ?auto_143561 ?auto_143566 ) ) ( not ( = ?auto_143561 ?auto_143567 ) ) ( not ( = ?auto_143562 ?auto_143568 ) ) ( not ( = ?auto_143562 ?auto_143566 ) ) ( not ( = ?auto_143562 ?auto_143567 ) ) ( not ( = ?auto_143563 ?auto_143568 ) ) ( not ( = ?auto_143563 ?auto_143566 ) ) ( not ( = ?auto_143563 ?auto_143567 ) ) ( ON ?auto_143563 ?auto_143564 ) ( CLEAR ?auto_143561 ) ( ON ?auto_143562 ?auto_143563 ) ( CLEAR ?auto_143562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143568 ?auto_143566 ?auto_143567 ?auto_143569 ?auto_143565 ?auto_143564 ?auto_143563 )
      ( MAKE-5PILE ?auto_143561 ?auto_143562 ?auto_143563 ?auto_143564 ?auto_143565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143570 - BLOCK
      ?auto_143571 - BLOCK
      ?auto_143572 - BLOCK
      ?auto_143573 - BLOCK
      ?auto_143574 - BLOCK
    )
    :vars
    (
      ?auto_143577 - BLOCK
      ?auto_143575 - BLOCK
      ?auto_143578 - BLOCK
      ?auto_143576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143570 ?auto_143571 ) ) ( not ( = ?auto_143570 ?auto_143572 ) ) ( not ( = ?auto_143570 ?auto_143573 ) ) ( not ( = ?auto_143570 ?auto_143574 ) ) ( not ( = ?auto_143571 ?auto_143572 ) ) ( not ( = ?auto_143571 ?auto_143573 ) ) ( not ( = ?auto_143571 ?auto_143574 ) ) ( not ( = ?auto_143572 ?auto_143573 ) ) ( not ( = ?auto_143572 ?auto_143574 ) ) ( not ( = ?auto_143573 ?auto_143574 ) ) ( ON ?auto_143574 ?auto_143577 ) ( not ( = ?auto_143570 ?auto_143577 ) ) ( not ( = ?auto_143571 ?auto_143577 ) ) ( not ( = ?auto_143572 ?auto_143577 ) ) ( not ( = ?auto_143573 ?auto_143577 ) ) ( not ( = ?auto_143574 ?auto_143577 ) ) ( ON ?auto_143573 ?auto_143574 ) ( ON-TABLE ?auto_143575 ) ( ON ?auto_143578 ?auto_143575 ) ( ON ?auto_143576 ?auto_143578 ) ( ON ?auto_143577 ?auto_143576 ) ( not ( = ?auto_143575 ?auto_143578 ) ) ( not ( = ?auto_143575 ?auto_143576 ) ) ( not ( = ?auto_143575 ?auto_143577 ) ) ( not ( = ?auto_143575 ?auto_143574 ) ) ( not ( = ?auto_143575 ?auto_143573 ) ) ( not ( = ?auto_143578 ?auto_143576 ) ) ( not ( = ?auto_143578 ?auto_143577 ) ) ( not ( = ?auto_143578 ?auto_143574 ) ) ( not ( = ?auto_143578 ?auto_143573 ) ) ( not ( = ?auto_143576 ?auto_143577 ) ) ( not ( = ?auto_143576 ?auto_143574 ) ) ( not ( = ?auto_143576 ?auto_143573 ) ) ( not ( = ?auto_143570 ?auto_143575 ) ) ( not ( = ?auto_143570 ?auto_143578 ) ) ( not ( = ?auto_143570 ?auto_143576 ) ) ( not ( = ?auto_143571 ?auto_143575 ) ) ( not ( = ?auto_143571 ?auto_143578 ) ) ( not ( = ?auto_143571 ?auto_143576 ) ) ( not ( = ?auto_143572 ?auto_143575 ) ) ( not ( = ?auto_143572 ?auto_143578 ) ) ( not ( = ?auto_143572 ?auto_143576 ) ) ( ON ?auto_143572 ?auto_143573 ) ( ON ?auto_143571 ?auto_143572 ) ( CLEAR ?auto_143571 ) ( HOLDING ?auto_143570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143570 )
      ( MAKE-5PILE ?auto_143570 ?auto_143571 ?auto_143572 ?auto_143573 ?auto_143574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143579 - BLOCK
      ?auto_143580 - BLOCK
      ?auto_143581 - BLOCK
      ?auto_143582 - BLOCK
      ?auto_143583 - BLOCK
    )
    :vars
    (
      ?auto_143585 - BLOCK
      ?auto_143584 - BLOCK
      ?auto_143587 - BLOCK
      ?auto_143586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143579 ?auto_143580 ) ) ( not ( = ?auto_143579 ?auto_143581 ) ) ( not ( = ?auto_143579 ?auto_143582 ) ) ( not ( = ?auto_143579 ?auto_143583 ) ) ( not ( = ?auto_143580 ?auto_143581 ) ) ( not ( = ?auto_143580 ?auto_143582 ) ) ( not ( = ?auto_143580 ?auto_143583 ) ) ( not ( = ?auto_143581 ?auto_143582 ) ) ( not ( = ?auto_143581 ?auto_143583 ) ) ( not ( = ?auto_143582 ?auto_143583 ) ) ( ON ?auto_143583 ?auto_143585 ) ( not ( = ?auto_143579 ?auto_143585 ) ) ( not ( = ?auto_143580 ?auto_143585 ) ) ( not ( = ?auto_143581 ?auto_143585 ) ) ( not ( = ?auto_143582 ?auto_143585 ) ) ( not ( = ?auto_143583 ?auto_143585 ) ) ( ON ?auto_143582 ?auto_143583 ) ( ON-TABLE ?auto_143584 ) ( ON ?auto_143587 ?auto_143584 ) ( ON ?auto_143586 ?auto_143587 ) ( ON ?auto_143585 ?auto_143586 ) ( not ( = ?auto_143584 ?auto_143587 ) ) ( not ( = ?auto_143584 ?auto_143586 ) ) ( not ( = ?auto_143584 ?auto_143585 ) ) ( not ( = ?auto_143584 ?auto_143583 ) ) ( not ( = ?auto_143584 ?auto_143582 ) ) ( not ( = ?auto_143587 ?auto_143586 ) ) ( not ( = ?auto_143587 ?auto_143585 ) ) ( not ( = ?auto_143587 ?auto_143583 ) ) ( not ( = ?auto_143587 ?auto_143582 ) ) ( not ( = ?auto_143586 ?auto_143585 ) ) ( not ( = ?auto_143586 ?auto_143583 ) ) ( not ( = ?auto_143586 ?auto_143582 ) ) ( not ( = ?auto_143579 ?auto_143584 ) ) ( not ( = ?auto_143579 ?auto_143587 ) ) ( not ( = ?auto_143579 ?auto_143586 ) ) ( not ( = ?auto_143580 ?auto_143584 ) ) ( not ( = ?auto_143580 ?auto_143587 ) ) ( not ( = ?auto_143580 ?auto_143586 ) ) ( not ( = ?auto_143581 ?auto_143584 ) ) ( not ( = ?auto_143581 ?auto_143587 ) ) ( not ( = ?auto_143581 ?auto_143586 ) ) ( ON ?auto_143581 ?auto_143582 ) ( ON ?auto_143580 ?auto_143581 ) ( ON ?auto_143579 ?auto_143580 ) ( CLEAR ?auto_143579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143584 ?auto_143587 ?auto_143586 ?auto_143585 ?auto_143583 ?auto_143582 ?auto_143581 ?auto_143580 )
      ( MAKE-5PILE ?auto_143579 ?auto_143580 ?auto_143581 ?auto_143582 ?auto_143583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143591 - BLOCK
      ?auto_143592 - BLOCK
      ?auto_143593 - BLOCK
    )
    :vars
    (
      ?auto_143594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143594 ?auto_143593 ) ( CLEAR ?auto_143594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143591 ) ( ON ?auto_143592 ?auto_143591 ) ( ON ?auto_143593 ?auto_143592 ) ( not ( = ?auto_143591 ?auto_143592 ) ) ( not ( = ?auto_143591 ?auto_143593 ) ) ( not ( = ?auto_143591 ?auto_143594 ) ) ( not ( = ?auto_143592 ?auto_143593 ) ) ( not ( = ?auto_143592 ?auto_143594 ) ) ( not ( = ?auto_143593 ?auto_143594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143594 ?auto_143593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143595 - BLOCK
      ?auto_143596 - BLOCK
      ?auto_143597 - BLOCK
    )
    :vars
    (
      ?auto_143598 - BLOCK
      ?auto_143599 - BLOCK
      ?auto_143600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143598 ?auto_143597 ) ( CLEAR ?auto_143598 ) ( ON-TABLE ?auto_143595 ) ( ON ?auto_143596 ?auto_143595 ) ( ON ?auto_143597 ?auto_143596 ) ( not ( = ?auto_143595 ?auto_143596 ) ) ( not ( = ?auto_143595 ?auto_143597 ) ) ( not ( = ?auto_143595 ?auto_143598 ) ) ( not ( = ?auto_143596 ?auto_143597 ) ) ( not ( = ?auto_143596 ?auto_143598 ) ) ( not ( = ?auto_143597 ?auto_143598 ) ) ( HOLDING ?auto_143599 ) ( CLEAR ?auto_143600 ) ( not ( = ?auto_143595 ?auto_143599 ) ) ( not ( = ?auto_143595 ?auto_143600 ) ) ( not ( = ?auto_143596 ?auto_143599 ) ) ( not ( = ?auto_143596 ?auto_143600 ) ) ( not ( = ?auto_143597 ?auto_143599 ) ) ( not ( = ?auto_143597 ?auto_143600 ) ) ( not ( = ?auto_143598 ?auto_143599 ) ) ( not ( = ?auto_143598 ?auto_143600 ) ) ( not ( = ?auto_143599 ?auto_143600 ) ) )
    :subtasks
    ( ( !STACK ?auto_143599 ?auto_143600 )
      ( MAKE-3PILE ?auto_143595 ?auto_143596 ?auto_143597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143601 - BLOCK
      ?auto_143602 - BLOCK
      ?auto_143603 - BLOCK
    )
    :vars
    (
      ?auto_143605 - BLOCK
      ?auto_143604 - BLOCK
      ?auto_143606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143605 ?auto_143603 ) ( ON-TABLE ?auto_143601 ) ( ON ?auto_143602 ?auto_143601 ) ( ON ?auto_143603 ?auto_143602 ) ( not ( = ?auto_143601 ?auto_143602 ) ) ( not ( = ?auto_143601 ?auto_143603 ) ) ( not ( = ?auto_143601 ?auto_143605 ) ) ( not ( = ?auto_143602 ?auto_143603 ) ) ( not ( = ?auto_143602 ?auto_143605 ) ) ( not ( = ?auto_143603 ?auto_143605 ) ) ( CLEAR ?auto_143604 ) ( not ( = ?auto_143601 ?auto_143606 ) ) ( not ( = ?auto_143601 ?auto_143604 ) ) ( not ( = ?auto_143602 ?auto_143606 ) ) ( not ( = ?auto_143602 ?auto_143604 ) ) ( not ( = ?auto_143603 ?auto_143606 ) ) ( not ( = ?auto_143603 ?auto_143604 ) ) ( not ( = ?auto_143605 ?auto_143606 ) ) ( not ( = ?auto_143605 ?auto_143604 ) ) ( not ( = ?auto_143606 ?auto_143604 ) ) ( ON ?auto_143606 ?auto_143605 ) ( CLEAR ?auto_143606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143601 ?auto_143602 ?auto_143603 ?auto_143605 )
      ( MAKE-3PILE ?auto_143601 ?auto_143602 ?auto_143603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143607 - BLOCK
      ?auto_143608 - BLOCK
      ?auto_143609 - BLOCK
    )
    :vars
    (
      ?auto_143610 - BLOCK
      ?auto_143611 - BLOCK
      ?auto_143612 - BLOCK
      ?auto_143615 - BLOCK
      ?auto_143613 - BLOCK
      ?auto_143614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143610 ?auto_143609 ) ( ON-TABLE ?auto_143607 ) ( ON ?auto_143608 ?auto_143607 ) ( ON ?auto_143609 ?auto_143608 ) ( not ( = ?auto_143607 ?auto_143608 ) ) ( not ( = ?auto_143607 ?auto_143609 ) ) ( not ( = ?auto_143607 ?auto_143610 ) ) ( not ( = ?auto_143608 ?auto_143609 ) ) ( not ( = ?auto_143608 ?auto_143610 ) ) ( not ( = ?auto_143609 ?auto_143610 ) ) ( not ( = ?auto_143607 ?auto_143611 ) ) ( not ( = ?auto_143607 ?auto_143612 ) ) ( not ( = ?auto_143608 ?auto_143611 ) ) ( not ( = ?auto_143608 ?auto_143612 ) ) ( not ( = ?auto_143609 ?auto_143611 ) ) ( not ( = ?auto_143609 ?auto_143612 ) ) ( not ( = ?auto_143610 ?auto_143611 ) ) ( not ( = ?auto_143610 ?auto_143612 ) ) ( not ( = ?auto_143611 ?auto_143612 ) ) ( ON ?auto_143611 ?auto_143610 ) ( CLEAR ?auto_143611 ) ( HOLDING ?auto_143612 ) ( CLEAR ?auto_143615 ) ( ON-TABLE ?auto_143613 ) ( ON ?auto_143614 ?auto_143613 ) ( ON ?auto_143615 ?auto_143614 ) ( not ( = ?auto_143613 ?auto_143614 ) ) ( not ( = ?auto_143613 ?auto_143615 ) ) ( not ( = ?auto_143613 ?auto_143612 ) ) ( not ( = ?auto_143614 ?auto_143615 ) ) ( not ( = ?auto_143614 ?auto_143612 ) ) ( not ( = ?auto_143615 ?auto_143612 ) ) ( not ( = ?auto_143607 ?auto_143615 ) ) ( not ( = ?auto_143607 ?auto_143613 ) ) ( not ( = ?auto_143607 ?auto_143614 ) ) ( not ( = ?auto_143608 ?auto_143615 ) ) ( not ( = ?auto_143608 ?auto_143613 ) ) ( not ( = ?auto_143608 ?auto_143614 ) ) ( not ( = ?auto_143609 ?auto_143615 ) ) ( not ( = ?auto_143609 ?auto_143613 ) ) ( not ( = ?auto_143609 ?auto_143614 ) ) ( not ( = ?auto_143610 ?auto_143615 ) ) ( not ( = ?auto_143610 ?auto_143613 ) ) ( not ( = ?auto_143610 ?auto_143614 ) ) ( not ( = ?auto_143611 ?auto_143615 ) ) ( not ( = ?auto_143611 ?auto_143613 ) ) ( not ( = ?auto_143611 ?auto_143614 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143613 ?auto_143614 ?auto_143615 ?auto_143612 )
      ( MAKE-3PILE ?auto_143607 ?auto_143608 ?auto_143609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143616 - BLOCK
      ?auto_143617 - BLOCK
      ?auto_143618 - BLOCK
    )
    :vars
    (
      ?auto_143620 - BLOCK
      ?auto_143619 - BLOCK
      ?auto_143622 - BLOCK
      ?auto_143624 - BLOCK
      ?auto_143621 - BLOCK
      ?auto_143623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143620 ?auto_143618 ) ( ON-TABLE ?auto_143616 ) ( ON ?auto_143617 ?auto_143616 ) ( ON ?auto_143618 ?auto_143617 ) ( not ( = ?auto_143616 ?auto_143617 ) ) ( not ( = ?auto_143616 ?auto_143618 ) ) ( not ( = ?auto_143616 ?auto_143620 ) ) ( not ( = ?auto_143617 ?auto_143618 ) ) ( not ( = ?auto_143617 ?auto_143620 ) ) ( not ( = ?auto_143618 ?auto_143620 ) ) ( not ( = ?auto_143616 ?auto_143619 ) ) ( not ( = ?auto_143616 ?auto_143622 ) ) ( not ( = ?auto_143617 ?auto_143619 ) ) ( not ( = ?auto_143617 ?auto_143622 ) ) ( not ( = ?auto_143618 ?auto_143619 ) ) ( not ( = ?auto_143618 ?auto_143622 ) ) ( not ( = ?auto_143620 ?auto_143619 ) ) ( not ( = ?auto_143620 ?auto_143622 ) ) ( not ( = ?auto_143619 ?auto_143622 ) ) ( ON ?auto_143619 ?auto_143620 ) ( CLEAR ?auto_143624 ) ( ON-TABLE ?auto_143621 ) ( ON ?auto_143623 ?auto_143621 ) ( ON ?auto_143624 ?auto_143623 ) ( not ( = ?auto_143621 ?auto_143623 ) ) ( not ( = ?auto_143621 ?auto_143624 ) ) ( not ( = ?auto_143621 ?auto_143622 ) ) ( not ( = ?auto_143623 ?auto_143624 ) ) ( not ( = ?auto_143623 ?auto_143622 ) ) ( not ( = ?auto_143624 ?auto_143622 ) ) ( not ( = ?auto_143616 ?auto_143624 ) ) ( not ( = ?auto_143616 ?auto_143621 ) ) ( not ( = ?auto_143616 ?auto_143623 ) ) ( not ( = ?auto_143617 ?auto_143624 ) ) ( not ( = ?auto_143617 ?auto_143621 ) ) ( not ( = ?auto_143617 ?auto_143623 ) ) ( not ( = ?auto_143618 ?auto_143624 ) ) ( not ( = ?auto_143618 ?auto_143621 ) ) ( not ( = ?auto_143618 ?auto_143623 ) ) ( not ( = ?auto_143620 ?auto_143624 ) ) ( not ( = ?auto_143620 ?auto_143621 ) ) ( not ( = ?auto_143620 ?auto_143623 ) ) ( not ( = ?auto_143619 ?auto_143624 ) ) ( not ( = ?auto_143619 ?auto_143621 ) ) ( not ( = ?auto_143619 ?auto_143623 ) ) ( ON ?auto_143622 ?auto_143619 ) ( CLEAR ?auto_143622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143616 ?auto_143617 ?auto_143618 ?auto_143620 ?auto_143619 )
      ( MAKE-3PILE ?auto_143616 ?auto_143617 ?auto_143618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143625 - BLOCK
      ?auto_143626 - BLOCK
      ?auto_143627 - BLOCK
    )
    :vars
    (
      ?auto_143628 - BLOCK
      ?auto_143632 - BLOCK
      ?auto_143633 - BLOCK
      ?auto_143630 - BLOCK
      ?auto_143629 - BLOCK
      ?auto_143631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143628 ?auto_143627 ) ( ON-TABLE ?auto_143625 ) ( ON ?auto_143626 ?auto_143625 ) ( ON ?auto_143627 ?auto_143626 ) ( not ( = ?auto_143625 ?auto_143626 ) ) ( not ( = ?auto_143625 ?auto_143627 ) ) ( not ( = ?auto_143625 ?auto_143628 ) ) ( not ( = ?auto_143626 ?auto_143627 ) ) ( not ( = ?auto_143626 ?auto_143628 ) ) ( not ( = ?auto_143627 ?auto_143628 ) ) ( not ( = ?auto_143625 ?auto_143632 ) ) ( not ( = ?auto_143625 ?auto_143633 ) ) ( not ( = ?auto_143626 ?auto_143632 ) ) ( not ( = ?auto_143626 ?auto_143633 ) ) ( not ( = ?auto_143627 ?auto_143632 ) ) ( not ( = ?auto_143627 ?auto_143633 ) ) ( not ( = ?auto_143628 ?auto_143632 ) ) ( not ( = ?auto_143628 ?auto_143633 ) ) ( not ( = ?auto_143632 ?auto_143633 ) ) ( ON ?auto_143632 ?auto_143628 ) ( ON-TABLE ?auto_143630 ) ( ON ?auto_143629 ?auto_143630 ) ( not ( = ?auto_143630 ?auto_143629 ) ) ( not ( = ?auto_143630 ?auto_143631 ) ) ( not ( = ?auto_143630 ?auto_143633 ) ) ( not ( = ?auto_143629 ?auto_143631 ) ) ( not ( = ?auto_143629 ?auto_143633 ) ) ( not ( = ?auto_143631 ?auto_143633 ) ) ( not ( = ?auto_143625 ?auto_143631 ) ) ( not ( = ?auto_143625 ?auto_143630 ) ) ( not ( = ?auto_143625 ?auto_143629 ) ) ( not ( = ?auto_143626 ?auto_143631 ) ) ( not ( = ?auto_143626 ?auto_143630 ) ) ( not ( = ?auto_143626 ?auto_143629 ) ) ( not ( = ?auto_143627 ?auto_143631 ) ) ( not ( = ?auto_143627 ?auto_143630 ) ) ( not ( = ?auto_143627 ?auto_143629 ) ) ( not ( = ?auto_143628 ?auto_143631 ) ) ( not ( = ?auto_143628 ?auto_143630 ) ) ( not ( = ?auto_143628 ?auto_143629 ) ) ( not ( = ?auto_143632 ?auto_143631 ) ) ( not ( = ?auto_143632 ?auto_143630 ) ) ( not ( = ?auto_143632 ?auto_143629 ) ) ( ON ?auto_143633 ?auto_143632 ) ( CLEAR ?auto_143633 ) ( HOLDING ?auto_143631 ) ( CLEAR ?auto_143629 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143630 ?auto_143629 ?auto_143631 )
      ( MAKE-3PILE ?auto_143625 ?auto_143626 ?auto_143627 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143634 - BLOCK
      ?auto_143635 - BLOCK
      ?auto_143636 - BLOCK
    )
    :vars
    (
      ?auto_143642 - BLOCK
      ?auto_143638 - BLOCK
      ?auto_143639 - BLOCK
      ?auto_143641 - BLOCK
      ?auto_143640 - BLOCK
      ?auto_143637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143642 ?auto_143636 ) ( ON-TABLE ?auto_143634 ) ( ON ?auto_143635 ?auto_143634 ) ( ON ?auto_143636 ?auto_143635 ) ( not ( = ?auto_143634 ?auto_143635 ) ) ( not ( = ?auto_143634 ?auto_143636 ) ) ( not ( = ?auto_143634 ?auto_143642 ) ) ( not ( = ?auto_143635 ?auto_143636 ) ) ( not ( = ?auto_143635 ?auto_143642 ) ) ( not ( = ?auto_143636 ?auto_143642 ) ) ( not ( = ?auto_143634 ?auto_143638 ) ) ( not ( = ?auto_143634 ?auto_143639 ) ) ( not ( = ?auto_143635 ?auto_143638 ) ) ( not ( = ?auto_143635 ?auto_143639 ) ) ( not ( = ?auto_143636 ?auto_143638 ) ) ( not ( = ?auto_143636 ?auto_143639 ) ) ( not ( = ?auto_143642 ?auto_143638 ) ) ( not ( = ?auto_143642 ?auto_143639 ) ) ( not ( = ?auto_143638 ?auto_143639 ) ) ( ON ?auto_143638 ?auto_143642 ) ( ON-TABLE ?auto_143641 ) ( ON ?auto_143640 ?auto_143641 ) ( not ( = ?auto_143641 ?auto_143640 ) ) ( not ( = ?auto_143641 ?auto_143637 ) ) ( not ( = ?auto_143641 ?auto_143639 ) ) ( not ( = ?auto_143640 ?auto_143637 ) ) ( not ( = ?auto_143640 ?auto_143639 ) ) ( not ( = ?auto_143637 ?auto_143639 ) ) ( not ( = ?auto_143634 ?auto_143637 ) ) ( not ( = ?auto_143634 ?auto_143641 ) ) ( not ( = ?auto_143634 ?auto_143640 ) ) ( not ( = ?auto_143635 ?auto_143637 ) ) ( not ( = ?auto_143635 ?auto_143641 ) ) ( not ( = ?auto_143635 ?auto_143640 ) ) ( not ( = ?auto_143636 ?auto_143637 ) ) ( not ( = ?auto_143636 ?auto_143641 ) ) ( not ( = ?auto_143636 ?auto_143640 ) ) ( not ( = ?auto_143642 ?auto_143637 ) ) ( not ( = ?auto_143642 ?auto_143641 ) ) ( not ( = ?auto_143642 ?auto_143640 ) ) ( not ( = ?auto_143638 ?auto_143637 ) ) ( not ( = ?auto_143638 ?auto_143641 ) ) ( not ( = ?auto_143638 ?auto_143640 ) ) ( ON ?auto_143639 ?auto_143638 ) ( CLEAR ?auto_143640 ) ( ON ?auto_143637 ?auto_143639 ) ( CLEAR ?auto_143637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143634 ?auto_143635 ?auto_143636 ?auto_143642 ?auto_143638 ?auto_143639 )
      ( MAKE-3PILE ?auto_143634 ?auto_143635 ?auto_143636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143643 - BLOCK
      ?auto_143644 - BLOCK
      ?auto_143645 - BLOCK
    )
    :vars
    (
      ?auto_143651 - BLOCK
      ?auto_143650 - BLOCK
      ?auto_143646 - BLOCK
      ?auto_143647 - BLOCK
      ?auto_143648 - BLOCK
      ?auto_143649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143651 ?auto_143645 ) ( ON-TABLE ?auto_143643 ) ( ON ?auto_143644 ?auto_143643 ) ( ON ?auto_143645 ?auto_143644 ) ( not ( = ?auto_143643 ?auto_143644 ) ) ( not ( = ?auto_143643 ?auto_143645 ) ) ( not ( = ?auto_143643 ?auto_143651 ) ) ( not ( = ?auto_143644 ?auto_143645 ) ) ( not ( = ?auto_143644 ?auto_143651 ) ) ( not ( = ?auto_143645 ?auto_143651 ) ) ( not ( = ?auto_143643 ?auto_143650 ) ) ( not ( = ?auto_143643 ?auto_143646 ) ) ( not ( = ?auto_143644 ?auto_143650 ) ) ( not ( = ?auto_143644 ?auto_143646 ) ) ( not ( = ?auto_143645 ?auto_143650 ) ) ( not ( = ?auto_143645 ?auto_143646 ) ) ( not ( = ?auto_143651 ?auto_143650 ) ) ( not ( = ?auto_143651 ?auto_143646 ) ) ( not ( = ?auto_143650 ?auto_143646 ) ) ( ON ?auto_143650 ?auto_143651 ) ( ON-TABLE ?auto_143647 ) ( not ( = ?auto_143647 ?auto_143648 ) ) ( not ( = ?auto_143647 ?auto_143649 ) ) ( not ( = ?auto_143647 ?auto_143646 ) ) ( not ( = ?auto_143648 ?auto_143649 ) ) ( not ( = ?auto_143648 ?auto_143646 ) ) ( not ( = ?auto_143649 ?auto_143646 ) ) ( not ( = ?auto_143643 ?auto_143649 ) ) ( not ( = ?auto_143643 ?auto_143647 ) ) ( not ( = ?auto_143643 ?auto_143648 ) ) ( not ( = ?auto_143644 ?auto_143649 ) ) ( not ( = ?auto_143644 ?auto_143647 ) ) ( not ( = ?auto_143644 ?auto_143648 ) ) ( not ( = ?auto_143645 ?auto_143649 ) ) ( not ( = ?auto_143645 ?auto_143647 ) ) ( not ( = ?auto_143645 ?auto_143648 ) ) ( not ( = ?auto_143651 ?auto_143649 ) ) ( not ( = ?auto_143651 ?auto_143647 ) ) ( not ( = ?auto_143651 ?auto_143648 ) ) ( not ( = ?auto_143650 ?auto_143649 ) ) ( not ( = ?auto_143650 ?auto_143647 ) ) ( not ( = ?auto_143650 ?auto_143648 ) ) ( ON ?auto_143646 ?auto_143650 ) ( ON ?auto_143649 ?auto_143646 ) ( CLEAR ?auto_143649 ) ( HOLDING ?auto_143648 ) ( CLEAR ?auto_143647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143647 ?auto_143648 )
      ( MAKE-3PILE ?auto_143643 ?auto_143644 ?auto_143645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145510 - BLOCK
      ?auto_145511 - BLOCK
      ?auto_145512 - BLOCK
    )
    :vars
    (
      ?auto_145513 - BLOCK
      ?auto_145515 - BLOCK
      ?auto_145516 - BLOCK
      ?auto_145517 - BLOCK
      ?auto_145514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145513 ?auto_145512 ) ( ON-TABLE ?auto_145510 ) ( ON ?auto_145511 ?auto_145510 ) ( ON ?auto_145512 ?auto_145511 ) ( not ( = ?auto_145510 ?auto_145511 ) ) ( not ( = ?auto_145510 ?auto_145512 ) ) ( not ( = ?auto_145510 ?auto_145513 ) ) ( not ( = ?auto_145511 ?auto_145512 ) ) ( not ( = ?auto_145511 ?auto_145513 ) ) ( not ( = ?auto_145512 ?auto_145513 ) ) ( not ( = ?auto_145510 ?auto_145515 ) ) ( not ( = ?auto_145510 ?auto_145516 ) ) ( not ( = ?auto_145511 ?auto_145515 ) ) ( not ( = ?auto_145511 ?auto_145516 ) ) ( not ( = ?auto_145512 ?auto_145515 ) ) ( not ( = ?auto_145512 ?auto_145516 ) ) ( not ( = ?auto_145513 ?auto_145515 ) ) ( not ( = ?auto_145513 ?auto_145516 ) ) ( not ( = ?auto_145515 ?auto_145516 ) ) ( ON ?auto_145515 ?auto_145513 ) ( not ( = ?auto_145517 ?auto_145514 ) ) ( not ( = ?auto_145517 ?auto_145516 ) ) ( not ( = ?auto_145514 ?auto_145516 ) ) ( not ( = ?auto_145510 ?auto_145514 ) ) ( not ( = ?auto_145510 ?auto_145517 ) ) ( not ( = ?auto_145511 ?auto_145514 ) ) ( not ( = ?auto_145511 ?auto_145517 ) ) ( not ( = ?auto_145512 ?auto_145514 ) ) ( not ( = ?auto_145512 ?auto_145517 ) ) ( not ( = ?auto_145513 ?auto_145514 ) ) ( not ( = ?auto_145513 ?auto_145517 ) ) ( not ( = ?auto_145515 ?auto_145514 ) ) ( not ( = ?auto_145515 ?auto_145517 ) ) ( ON ?auto_145516 ?auto_145515 ) ( ON ?auto_145514 ?auto_145516 ) ( ON ?auto_145517 ?auto_145514 ) ( CLEAR ?auto_145517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145510 ?auto_145511 ?auto_145512 ?auto_145513 ?auto_145515 ?auto_145516 ?auto_145514 )
      ( MAKE-3PILE ?auto_145510 ?auto_145511 ?auto_145512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143661 - BLOCK
      ?auto_143662 - BLOCK
      ?auto_143663 - BLOCK
    )
    :vars
    (
      ?auto_143665 - BLOCK
      ?auto_143664 - BLOCK
      ?auto_143667 - BLOCK
      ?auto_143668 - BLOCK
      ?auto_143669 - BLOCK
      ?auto_143666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143665 ?auto_143663 ) ( ON-TABLE ?auto_143661 ) ( ON ?auto_143662 ?auto_143661 ) ( ON ?auto_143663 ?auto_143662 ) ( not ( = ?auto_143661 ?auto_143662 ) ) ( not ( = ?auto_143661 ?auto_143663 ) ) ( not ( = ?auto_143661 ?auto_143665 ) ) ( not ( = ?auto_143662 ?auto_143663 ) ) ( not ( = ?auto_143662 ?auto_143665 ) ) ( not ( = ?auto_143663 ?auto_143665 ) ) ( not ( = ?auto_143661 ?auto_143664 ) ) ( not ( = ?auto_143661 ?auto_143667 ) ) ( not ( = ?auto_143662 ?auto_143664 ) ) ( not ( = ?auto_143662 ?auto_143667 ) ) ( not ( = ?auto_143663 ?auto_143664 ) ) ( not ( = ?auto_143663 ?auto_143667 ) ) ( not ( = ?auto_143665 ?auto_143664 ) ) ( not ( = ?auto_143665 ?auto_143667 ) ) ( not ( = ?auto_143664 ?auto_143667 ) ) ( ON ?auto_143664 ?auto_143665 ) ( not ( = ?auto_143668 ?auto_143669 ) ) ( not ( = ?auto_143668 ?auto_143666 ) ) ( not ( = ?auto_143668 ?auto_143667 ) ) ( not ( = ?auto_143669 ?auto_143666 ) ) ( not ( = ?auto_143669 ?auto_143667 ) ) ( not ( = ?auto_143666 ?auto_143667 ) ) ( not ( = ?auto_143661 ?auto_143666 ) ) ( not ( = ?auto_143661 ?auto_143668 ) ) ( not ( = ?auto_143661 ?auto_143669 ) ) ( not ( = ?auto_143662 ?auto_143666 ) ) ( not ( = ?auto_143662 ?auto_143668 ) ) ( not ( = ?auto_143662 ?auto_143669 ) ) ( not ( = ?auto_143663 ?auto_143666 ) ) ( not ( = ?auto_143663 ?auto_143668 ) ) ( not ( = ?auto_143663 ?auto_143669 ) ) ( not ( = ?auto_143665 ?auto_143666 ) ) ( not ( = ?auto_143665 ?auto_143668 ) ) ( not ( = ?auto_143665 ?auto_143669 ) ) ( not ( = ?auto_143664 ?auto_143666 ) ) ( not ( = ?auto_143664 ?auto_143668 ) ) ( not ( = ?auto_143664 ?auto_143669 ) ) ( ON ?auto_143667 ?auto_143664 ) ( ON ?auto_143666 ?auto_143667 ) ( ON ?auto_143669 ?auto_143666 ) ( CLEAR ?auto_143669 ) ( HOLDING ?auto_143668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143668 )
      ( MAKE-3PILE ?auto_143661 ?auto_143662 ?auto_143663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143670 - BLOCK
      ?auto_143671 - BLOCK
      ?auto_143672 - BLOCK
    )
    :vars
    (
      ?auto_143674 - BLOCK
      ?auto_143677 - BLOCK
      ?auto_143673 - BLOCK
      ?auto_143675 - BLOCK
      ?auto_143678 - BLOCK
      ?auto_143676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143674 ?auto_143672 ) ( ON-TABLE ?auto_143670 ) ( ON ?auto_143671 ?auto_143670 ) ( ON ?auto_143672 ?auto_143671 ) ( not ( = ?auto_143670 ?auto_143671 ) ) ( not ( = ?auto_143670 ?auto_143672 ) ) ( not ( = ?auto_143670 ?auto_143674 ) ) ( not ( = ?auto_143671 ?auto_143672 ) ) ( not ( = ?auto_143671 ?auto_143674 ) ) ( not ( = ?auto_143672 ?auto_143674 ) ) ( not ( = ?auto_143670 ?auto_143677 ) ) ( not ( = ?auto_143670 ?auto_143673 ) ) ( not ( = ?auto_143671 ?auto_143677 ) ) ( not ( = ?auto_143671 ?auto_143673 ) ) ( not ( = ?auto_143672 ?auto_143677 ) ) ( not ( = ?auto_143672 ?auto_143673 ) ) ( not ( = ?auto_143674 ?auto_143677 ) ) ( not ( = ?auto_143674 ?auto_143673 ) ) ( not ( = ?auto_143677 ?auto_143673 ) ) ( ON ?auto_143677 ?auto_143674 ) ( not ( = ?auto_143675 ?auto_143678 ) ) ( not ( = ?auto_143675 ?auto_143676 ) ) ( not ( = ?auto_143675 ?auto_143673 ) ) ( not ( = ?auto_143678 ?auto_143676 ) ) ( not ( = ?auto_143678 ?auto_143673 ) ) ( not ( = ?auto_143676 ?auto_143673 ) ) ( not ( = ?auto_143670 ?auto_143676 ) ) ( not ( = ?auto_143670 ?auto_143675 ) ) ( not ( = ?auto_143670 ?auto_143678 ) ) ( not ( = ?auto_143671 ?auto_143676 ) ) ( not ( = ?auto_143671 ?auto_143675 ) ) ( not ( = ?auto_143671 ?auto_143678 ) ) ( not ( = ?auto_143672 ?auto_143676 ) ) ( not ( = ?auto_143672 ?auto_143675 ) ) ( not ( = ?auto_143672 ?auto_143678 ) ) ( not ( = ?auto_143674 ?auto_143676 ) ) ( not ( = ?auto_143674 ?auto_143675 ) ) ( not ( = ?auto_143674 ?auto_143678 ) ) ( not ( = ?auto_143677 ?auto_143676 ) ) ( not ( = ?auto_143677 ?auto_143675 ) ) ( not ( = ?auto_143677 ?auto_143678 ) ) ( ON ?auto_143673 ?auto_143677 ) ( ON ?auto_143676 ?auto_143673 ) ( ON ?auto_143678 ?auto_143676 ) ( ON ?auto_143675 ?auto_143678 ) ( CLEAR ?auto_143675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143670 ?auto_143671 ?auto_143672 ?auto_143674 ?auto_143677 ?auto_143673 ?auto_143676 ?auto_143678 )
      ( MAKE-3PILE ?auto_143670 ?auto_143671 ?auto_143672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143685 - BLOCK
      ?auto_143686 - BLOCK
      ?auto_143687 - BLOCK
      ?auto_143688 - BLOCK
      ?auto_143689 - BLOCK
      ?auto_143690 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143690 ) ( CLEAR ?auto_143689 ) ( ON-TABLE ?auto_143685 ) ( ON ?auto_143686 ?auto_143685 ) ( ON ?auto_143687 ?auto_143686 ) ( ON ?auto_143688 ?auto_143687 ) ( ON ?auto_143689 ?auto_143688 ) ( not ( = ?auto_143685 ?auto_143686 ) ) ( not ( = ?auto_143685 ?auto_143687 ) ) ( not ( = ?auto_143685 ?auto_143688 ) ) ( not ( = ?auto_143685 ?auto_143689 ) ) ( not ( = ?auto_143685 ?auto_143690 ) ) ( not ( = ?auto_143686 ?auto_143687 ) ) ( not ( = ?auto_143686 ?auto_143688 ) ) ( not ( = ?auto_143686 ?auto_143689 ) ) ( not ( = ?auto_143686 ?auto_143690 ) ) ( not ( = ?auto_143687 ?auto_143688 ) ) ( not ( = ?auto_143687 ?auto_143689 ) ) ( not ( = ?auto_143687 ?auto_143690 ) ) ( not ( = ?auto_143688 ?auto_143689 ) ) ( not ( = ?auto_143688 ?auto_143690 ) ) ( not ( = ?auto_143689 ?auto_143690 ) ) )
    :subtasks
    ( ( !STACK ?auto_143690 ?auto_143689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143691 - BLOCK
      ?auto_143692 - BLOCK
      ?auto_143693 - BLOCK
      ?auto_143694 - BLOCK
      ?auto_143695 - BLOCK
      ?auto_143696 - BLOCK
    )
    :vars
    (
      ?auto_143697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143695 ) ( ON-TABLE ?auto_143691 ) ( ON ?auto_143692 ?auto_143691 ) ( ON ?auto_143693 ?auto_143692 ) ( ON ?auto_143694 ?auto_143693 ) ( ON ?auto_143695 ?auto_143694 ) ( not ( = ?auto_143691 ?auto_143692 ) ) ( not ( = ?auto_143691 ?auto_143693 ) ) ( not ( = ?auto_143691 ?auto_143694 ) ) ( not ( = ?auto_143691 ?auto_143695 ) ) ( not ( = ?auto_143691 ?auto_143696 ) ) ( not ( = ?auto_143692 ?auto_143693 ) ) ( not ( = ?auto_143692 ?auto_143694 ) ) ( not ( = ?auto_143692 ?auto_143695 ) ) ( not ( = ?auto_143692 ?auto_143696 ) ) ( not ( = ?auto_143693 ?auto_143694 ) ) ( not ( = ?auto_143693 ?auto_143695 ) ) ( not ( = ?auto_143693 ?auto_143696 ) ) ( not ( = ?auto_143694 ?auto_143695 ) ) ( not ( = ?auto_143694 ?auto_143696 ) ) ( not ( = ?auto_143695 ?auto_143696 ) ) ( ON ?auto_143696 ?auto_143697 ) ( CLEAR ?auto_143696 ) ( HAND-EMPTY ) ( not ( = ?auto_143691 ?auto_143697 ) ) ( not ( = ?auto_143692 ?auto_143697 ) ) ( not ( = ?auto_143693 ?auto_143697 ) ) ( not ( = ?auto_143694 ?auto_143697 ) ) ( not ( = ?auto_143695 ?auto_143697 ) ) ( not ( = ?auto_143696 ?auto_143697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143696 ?auto_143697 )
      ( MAKE-6PILE ?auto_143691 ?auto_143692 ?auto_143693 ?auto_143694 ?auto_143695 ?auto_143696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143698 - BLOCK
      ?auto_143699 - BLOCK
      ?auto_143700 - BLOCK
      ?auto_143701 - BLOCK
      ?auto_143702 - BLOCK
      ?auto_143703 - BLOCK
    )
    :vars
    (
      ?auto_143704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143698 ) ( ON ?auto_143699 ?auto_143698 ) ( ON ?auto_143700 ?auto_143699 ) ( ON ?auto_143701 ?auto_143700 ) ( not ( = ?auto_143698 ?auto_143699 ) ) ( not ( = ?auto_143698 ?auto_143700 ) ) ( not ( = ?auto_143698 ?auto_143701 ) ) ( not ( = ?auto_143698 ?auto_143702 ) ) ( not ( = ?auto_143698 ?auto_143703 ) ) ( not ( = ?auto_143699 ?auto_143700 ) ) ( not ( = ?auto_143699 ?auto_143701 ) ) ( not ( = ?auto_143699 ?auto_143702 ) ) ( not ( = ?auto_143699 ?auto_143703 ) ) ( not ( = ?auto_143700 ?auto_143701 ) ) ( not ( = ?auto_143700 ?auto_143702 ) ) ( not ( = ?auto_143700 ?auto_143703 ) ) ( not ( = ?auto_143701 ?auto_143702 ) ) ( not ( = ?auto_143701 ?auto_143703 ) ) ( not ( = ?auto_143702 ?auto_143703 ) ) ( ON ?auto_143703 ?auto_143704 ) ( CLEAR ?auto_143703 ) ( not ( = ?auto_143698 ?auto_143704 ) ) ( not ( = ?auto_143699 ?auto_143704 ) ) ( not ( = ?auto_143700 ?auto_143704 ) ) ( not ( = ?auto_143701 ?auto_143704 ) ) ( not ( = ?auto_143702 ?auto_143704 ) ) ( not ( = ?auto_143703 ?auto_143704 ) ) ( HOLDING ?auto_143702 ) ( CLEAR ?auto_143701 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143698 ?auto_143699 ?auto_143700 ?auto_143701 ?auto_143702 )
      ( MAKE-6PILE ?auto_143698 ?auto_143699 ?auto_143700 ?auto_143701 ?auto_143702 ?auto_143703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143705 - BLOCK
      ?auto_143706 - BLOCK
      ?auto_143707 - BLOCK
      ?auto_143708 - BLOCK
      ?auto_143709 - BLOCK
      ?auto_143710 - BLOCK
    )
    :vars
    (
      ?auto_143711 - BLOCK
      ?auto_143712 - BLOCK
      ?auto_143713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143705 ) ( ON ?auto_143706 ?auto_143705 ) ( ON ?auto_143707 ?auto_143706 ) ( ON ?auto_143708 ?auto_143707 ) ( not ( = ?auto_143705 ?auto_143706 ) ) ( not ( = ?auto_143705 ?auto_143707 ) ) ( not ( = ?auto_143705 ?auto_143708 ) ) ( not ( = ?auto_143705 ?auto_143709 ) ) ( not ( = ?auto_143705 ?auto_143710 ) ) ( not ( = ?auto_143706 ?auto_143707 ) ) ( not ( = ?auto_143706 ?auto_143708 ) ) ( not ( = ?auto_143706 ?auto_143709 ) ) ( not ( = ?auto_143706 ?auto_143710 ) ) ( not ( = ?auto_143707 ?auto_143708 ) ) ( not ( = ?auto_143707 ?auto_143709 ) ) ( not ( = ?auto_143707 ?auto_143710 ) ) ( not ( = ?auto_143708 ?auto_143709 ) ) ( not ( = ?auto_143708 ?auto_143710 ) ) ( not ( = ?auto_143709 ?auto_143710 ) ) ( ON ?auto_143710 ?auto_143711 ) ( not ( = ?auto_143705 ?auto_143711 ) ) ( not ( = ?auto_143706 ?auto_143711 ) ) ( not ( = ?auto_143707 ?auto_143711 ) ) ( not ( = ?auto_143708 ?auto_143711 ) ) ( not ( = ?auto_143709 ?auto_143711 ) ) ( not ( = ?auto_143710 ?auto_143711 ) ) ( CLEAR ?auto_143708 ) ( ON ?auto_143709 ?auto_143710 ) ( CLEAR ?auto_143709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143712 ) ( ON ?auto_143713 ?auto_143712 ) ( ON ?auto_143711 ?auto_143713 ) ( not ( = ?auto_143712 ?auto_143713 ) ) ( not ( = ?auto_143712 ?auto_143711 ) ) ( not ( = ?auto_143712 ?auto_143710 ) ) ( not ( = ?auto_143712 ?auto_143709 ) ) ( not ( = ?auto_143713 ?auto_143711 ) ) ( not ( = ?auto_143713 ?auto_143710 ) ) ( not ( = ?auto_143713 ?auto_143709 ) ) ( not ( = ?auto_143705 ?auto_143712 ) ) ( not ( = ?auto_143705 ?auto_143713 ) ) ( not ( = ?auto_143706 ?auto_143712 ) ) ( not ( = ?auto_143706 ?auto_143713 ) ) ( not ( = ?auto_143707 ?auto_143712 ) ) ( not ( = ?auto_143707 ?auto_143713 ) ) ( not ( = ?auto_143708 ?auto_143712 ) ) ( not ( = ?auto_143708 ?auto_143713 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143712 ?auto_143713 ?auto_143711 ?auto_143710 )
      ( MAKE-6PILE ?auto_143705 ?auto_143706 ?auto_143707 ?auto_143708 ?auto_143709 ?auto_143710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143714 - BLOCK
      ?auto_143715 - BLOCK
      ?auto_143716 - BLOCK
      ?auto_143717 - BLOCK
      ?auto_143718 - BLOCK
      ?auto_143719 - BLOCK
    )
    :vars
    (
      ?auto_143720 - BLOCK
      ?auto_143722 - BLOCK
      ?auto_143721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143714 ) ( ON ?auto_143715 ?auto_143714 ) ( ON ?auto_143716 ?auto_143715 ) ( not ( = ?auto_143714 ?auto_143715 ) ) ( not ( = ?auto_143714 ?auto_143716 ) ) ( not ( = ?auto_143714 ?auto_143717 ) ) ( not ( = ?auto_143714 ?auto_143718 ) ) ( not ( = ?auto_143714 ?auto_143719 ) ) ( not ( = ?auto_143715 ?auto_143716 ) ) ( not ( = ?auto_143715 ?auto_143717 ) ) ( not ( = ?auto_143715 ?auto_143718 ) ) ( not ( = ?auto_143715 ?auto_143719 ) ) ( not ( = ?auto_143716 ?auto_143717 ) ) ( not ( = ?auto_143716 ?auto_143718 ) ) ( not ( = ?auto_143716 ?auto_143719 ) ) ( not ( = ?auto_143717 ?auto_143718 ) ) ( not ( = ?auto_143717 ?auto_143719 ) ) ( not ( = ?auto_143718 ?auto_143719 ) ) ( ON ?auto_143719 ?auto_143720 ) ( not ( = ?auto_143714 ?auto_143720 ) ) ( not ( = ?auto_143715 ?auto_143720 ) ) ( not ( = ?auto_143716 ?auto_143720 ) ) ( not ( = ?auto_143717 ?auto_143720 ) ) ( not ( = ?auto_143718 ?auto_143720 ) ) ( not ( = ?auto_143719 ?auto_143720 ) ) ( ON ?auto_143718 ?auto_143719 ) ( CLEAR ?auto_143718 ) ( ON-TABLE ?auto_143722 ) ( ON ?auto_143721 ?auto_143722 ) ( ON ?auto_143720 ?auto_143721 ) ( not ( = ?auto_143722 ?auto_143721 ) ) ( not ( = ?auto_143722 ?auto_143720 ) ) ( not ( = ?auto_143722 ?auto_143719 ) ) ( not ( = ?auto_143722 ?auto_143718 ) ) ( not ( = ?auto_143721 ?auto_143720 ) ) ( not ( = ?auto_143721 ?auto_143719 ) ) ( not ( = ?auto_143721 ?auto_143718 ) ) ( not ( = ?auto_143714 ?auto_143722 ) ) ( not ( = ?auto_143714 ?auto_143721 ) ) ( not ( = ?auto_143715 ?auto_143722 ) ) ( not ( = ?auto_143715 ?auto_143721 ) ) ( not ( = ?auto_143716 ?auto_143722 ) ) ( not ( = ?auto_143716 ?auto_143721 ) ) ( not ( = ?auto_143717 ?auto_143722 ) ) ( not ( = ?auto_143717 ?auto_143721 ) ) ( HOLDING ?auto_143717 ) ( CLEAR ?auto_143716 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143714 ?auto_143715 ?auto_143716 ?auto_143717 )
      ( MAKE-6PILE ?auto_143714 ?auto_143715 ?auto_143716 ?auto_143717 ?auto_143718 ?auto_143719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143723 - BLOCK
      ?auto_143724 - BLOCK
      ?auto_143725 - BLOCK
      ?auto_143726 - BLOCK
      ?auto_143727 - BLOCK
      ?auto_143728 - BLOCK
    )
    :vars
    (
      ?auto_143731 - BLOCK
      ?auto_143730 - BLOCK
      ?auto_143729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143723 ) ( ON ?auto_143724 ?auto_143723 ) ( ON ?auto_143725 ?auto_143724 ) ( not ( = ?auto_143723 ?auto_143724 ) ) ( not ( = ?auto_143723 ?auto_143725 ) ) ( not ( = ?auto_143723 ?auto_143726 ) ) ( not ( = ?auto_143723 ?auto_143727 ) ) ( not ( = ?auto_143723 ?auto_143728 ) ) ( not ( = ?auto_143724 ?auto_143725 ) ) ( not ( = ?auto_143724 ?auto_143726 ) ) ( not ( = ?auto_143724 ?auto_143727 ) ) ( not ( = ?auto_143724 ?auto_143728 ) ) ( not ( = ?auto_143725 ?auto_143726 ) ) ( not ( = ?auto_143725 ?auto_143727 ) ) ( not ( = ?auto_143725 ?auto_143728 ) ) ( not ( = ?auto_143726 ?auto_143727 ) ) ( not ( = ?auto_143726 ?auto_143728 ) ) ( not ( = ?auto_143727 ?auto_143728 ) ) ( ON ?auto_143728 ?auto_143731 ) ( not ( = ?auto_143723 ?auto_143731 ) ) ( not ( = ?auto_143724 ?auto_143731 ) ) ( not ( = ?auto_143725 ?auto_143731 ) ) ( not ( = ?auto_143726 ?auto_143731 ) ) ( not ( = ?auto_143727 ?auto_143731 ) ) ( not ( = ?auto_143728 ?auto_143731 ) ) ( ON ?auto_143727 ?auto_143728 ) ( ON-TABLE ?auto_143730 ) ( ON ?auto_143729 ?auto_143730 ) ( ON ?auto_143731 ?auto_143729 ) ( not ( = ?auto_143730 ?auto_143729 ) ) ( not ( = ?auto_143730 ?auto_143731 ) ) ( not ( = ?auto_143730 ?auto_143728 ) ) ( not ( = ?auto_143730 ?auto_143727 ) ) ( not ( = ?auto_143729 ?auto_143731 ) ) ( not ( = ?auto_143729 ?auto_143728 ) ) ( not ( = ?auto_143729 ?auto_143727 ) ) ( not ( = ?auto_143723 ?auto_143730 ) ) ( not ( = ?auto_143723 ?auto_143729 ) ) ( not ( = ?auto_143724 ?auto_143730 ) ) ( not ( = ?auto_143724 ?auto_143729 ) ) ( not ( = ?auto_143725 ?auto_143730 ) ) ( not ( = ?auto_143725 ?auto_143729 ) ) ( not ( = ?auto_143726 ?auto_143730 ) ) ( not ( = ?auto_143726 ?auto_143729 ) ) ( CLEAR ?auto_143725 ) ( ON ?auto_143726 ?auto_143727 ) ( CLEAR ?auto_143726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143730 ?auto_143729 ?auto_143731 ?auto_143728 ?auto_143727 )
      ( MAKE-6PILE ?auto_143723 ?auto_143724 ?auto_143725 ?auto_143726 ?auto_143727 ?auto_143728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143732 - BLOCK
      ?auto_143733 - BLOCK
      ?auto_143734 - BLOCK
      ?auto_143735 - BLOCK
      ?auto_143736 - BLOCK
      ?auto_143737 - BLOCK
    )
    :vars
    (
      ?auto_143738 - BLOCK
      ?auto_143739 - BLOCK
      ?auto_143740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143732 ) ( ON ?auto_143733 ?auto_143732 ) ( not ( = ?auto_143732 ?auto_143733 ) ) ( not ( = ?auto_143732 ?auto_143734 ) ) ( not ( = ?auto_143732 ?auto_143735 ) ) ( not ( = ?auto_143732 ?auto_143736 ) ) ( not ( = ?auto_143732 ?auto_143737 ) ) ( not ( = ?auto_143733 ?auto_143734 ) ) ( not ( = ?auto_143733 ?auto_143735 ) ) ( not ( = ?auto_143733 ?auto_143736 ) ) ( not ( = ?auto_143733 ?auto_143737 ) ) ( not ( = ?auto_143734 ?auto_143735 ) ) ( not ( = ?auto_143734 ?auto_143736 ) ) ( not ( = ?auto_143734 ?auto_143737 ) ) ( not ( = ?auto_143735 ?auto_143736 ) ) ( not ( = ?auto_143735 ?auto_143737 ) ) ( not ( = ?auto_143736 ?auto_143737 ) ) ( ON ?auto_143737 ?auto_143738 ) ( not ( = ?auto_143732 ?auto_143738 ) ) ( not ( = ?auto_143733 ?auto_143738 ) ) ( not ( = ?auto_143734 ?auto_143738 ) ) ( not ( = ?auto_143735 ?auto_143738 ) ) ( not ( = ?auto_143736 ?auto_143738 ) ) ( not ( = ?auto_143737 ?auto_143738 ) ) ( ON ?auto_143736 ?auto_143737 ) ( ON-TABLE ?auto_143739 ) ( ON ?auto_143740 ?auto_143739 ) ( ON ?auto_143738 ?auto_143740 ) ( not ( = ?auto_143739 ?auto_143740 ) ) ( not ( = ?auto_143739 ?auto_143738 ) ) ( not ( = ?auto_143739 ?auto_143737 ) ) ( not ( = ?auto_143739 ?auto_143736 ) ) ( not ( = ?auto_143740 ?auto_143738 ) ) ( not ( = ?auto_143740 ?auto_143737 ) ) ( not ( = ?auto_143740 ?auto_143736 ) ) ( not ( = ?auto_143732 ?auto_143739 ) ) ( not ( = ?auto_143732 ?auto_143740 ) ) ( not ( = ?auto_143733 ?auto_143739 ) ) ( not ( = ?auto_143733 ?auto_143740 ) ) ( not ( = ?auto_143734 ?auto_143739 ) ) ( not ( = ?auto_143734 ?auto_143740 ) ) ( not ( = ?auto_143735 ?auto_143739 ) ) ( not ( = ?auto_143735 ?auto_143740 ) ) ( ON ?auto_143735 ?auto_143736 ) ( CLEAR ?auto_143735 ) ( HOLDING ?auto_143734 ) ( CLEAR ?auto_143733 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143732 ?auto_143733 ?auto_143734 )
      ( MAKE-6PILE ?auto_143732 ?auto_143733 ?auto_143734 ?auto_143735 ?auto_143736 ?auto_143737 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143741 - BLOCK
      ?auto_143742 - BLOCK
      ?auto_143743 - BLOCK
      ?auto_143744 - BLOCK
      ?auto_143745 - BLOCK
      ?auto_143746 - BLOCK
    )
    :vars
    (
      ?auto_143749 - BLOCK
      ?auto_143747 - BLOCK
      ?auto_143748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143741 ) ( ON ?auto_143742 ?auto_143741 ) ( not ( = ?auto_143741 ?auto_143742 ) ) ( not ( = ?auto_143741 ?auto_143743 ) ) ( not ( = ?auto_143741 ?auto_143744 ) ) ( not ( = ?auto_143741 ?auto_143745 ) ) ( not ( = ?auto_143741 ?auto_143746 ) ) ( not ( = ?auto_143742 ?auto_143743 ) ) ( not ( = ?auto_143742 ?auto_143744 ) ) ( not ( = ?auto_143742 ?auto_143745 ) ) ( not ( = ?auto_143742 ?auto_143746 ) ) ( not ( = ?auto_143743 ?auto_143744 ) ) ( not ( = ?auto_143743 ?auto_143745 ) ) ( not ( = ?auto_143743 ?auto_143746 ) ) ( not ( = ?auto_143744 ?auto_143745 ) ) ( not ( = ?auto_143744 ?auto_143746 ) ) ( not ( = ?auto_143745 ?auto_143746 ) ) ( ON ?auto_143746 ?auto_143749 ) ( not ( = ?auto_143741 ?auto_143749 ) ) ( not ( = ?auto_143742 ?auto_143749 ) ) ( not ( = ?auto_143743 ?auto_143749 ) ) ( not ( = ?auto_143744 ?auto_143749 ) ) ( not ( = ?auto_143745 ?auto_143749 ) ) ( not ( = ?auto_143746 ?auto_143749 ) ) ( ON ?auto_143745 ?auto_143746 ) ( ON-TABLE ?auto_143747 ) ( ON ?auto_143748 ?auto_143747 ) ( ON ?auto_143749 ?auto_143748 ) ( not ( = ?auto_143747 ?auto_143748 ) ) ( not ( = ?auto_143747 ?auto_143749 ) ) ( not ( = ?auto_143747 ?auto_143746 ) ) ( not ( = ?auto_143747 ?auto_143745 ) ) ( not ( = ?auto_143748 ?auto_143749 ) ) ( not ( = ?auto_143748 ?auto_143746 ) ) ( not ( = ?auto_143748 ?auto_143745 ) ) ( not ( = ?auto_143741 ?auto_143747 ) ) ( not ( = ?auto_143741 ?auto_143748 ) ) ( not ( = ?auto_143742 ?auto_143747 ) ) ( not ( = ?auto_143742 ?auto_143748 ) ) ( not ( = ?auto_143743 ?auto_143747 ) ) ( not ( = ?auto_143743 ?auto_143748 ) ) ( not ( = ?auto_143744 ?auto_143747 ) ) ( not ( = ?auto_143744 ?auto_143748 ) ) ( ON ?auto_143744 ?auto_143745 ) ( CLEAR ?auto_143742 ) ( ON ?auto_143743 ?auto_143744 ) ( CLEAR ?auto_143743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143747 ?auto_143748 ?auto_143749 ?auto_143746 ?auto_143745 ?auto_143744 )
      ( MAKE-6PILE ?auto_143741 ?auto_143742 ?auto_143743 ?auto_143744 ?auto_143745 ?auto_143746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143750 - BLOCK
      ?auto_143751 - BLOCK
      ?auto_143752 - BLOCK
      ?auto_143753 - BLOCK
      ?auto_143754 - BLOCK
      ?auto_143755 - BLOCK
    )
    :vars
    (
      ?auto_143757 - BLOCK
      ?auto_143756 - BLOCK
      ?auto_143758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143750 ) ( not ( = ?auto_143750 ?auto_143751 ) ) ( not ( = ?auto_143750 ?auto_143752 ) ) ( not ( = ?auto_143750 ?auto_143753 ) ) ( not ( = ?auto_143750 ?auto_143754 ) ) ( not ( = ?auto_143750 ?auto_143755 ) ) ( not ( = ?auto_143751 ?auto_143752 ) ) ( not ( = ?auto_143751 ?auto_143753 ) ) ( not ( = ?auto_143751 ?auto_143754 ) ) ( not ( = ?auto_143751 ?auto_143755 ) ) ( not ( = ?auto_143752 ?auto_143753 ) ) ( not ( = ?auto_143752 ?auto_143754 ) ) ( not ( = ?auto_143752 ?auto_143755 ) ) ( not ( = ?auto_143753 ?auto_143754 ) ) ( not ( = ?auto_143753 ?auto_143755 ) ) ( not ( = ?auto_143754 ?auto_143755 ) ) ( ON ?auto_143755 ?auto_143757 ) ( not ( = ?auto_143750 ?auto_143757 ) ) ( not ( = ?auto_143751 ?auto_143757 ) ) ( not ( = ?auto_143752 ?auto_143757 ) ) ( not ( = ?auto_143753 ?auto_143757 ) ) ( not ( = ?auto_143754 ?auto_143757 ) ) ( not ( = ?auto_143755 ?auto_143757 ) ) ( ON ?auto_143754 ?auto_143755 ) ( ON-TABLE ?auto_143756 ) ( ON ?auto_143758 ?auto_143756 ) ( ON ?auto_143757 ?auto_143758 ) ( not ( = ?auto_143756 ?auto_143758 ) ) ( not ( = ?auto_143756 ?auto_143757 ) ) ( not ( = ?auto_143756 ?auto_143755 ) ) ( not ( = ?auto_143756 ?auto_143754 ) ) ( not ( = ?auto_143758 ?auto_143757 ) ) ( not ( = ?auto_143758 ?auto_143755 ) ) ( not ( = ?auto_143758 ?auto_143754 ) ) ( not ( = ?auto_143750 ?auto_143756 ) ) ( not ( = ?auto_143750 ?auto_143758 ) ) ( not ( = ?auto_143751 ?auto_143756 ) ) ( not ( = ?auto_143751 ?auto_143758 ) ) ( not ( = ?auto_143752 ?auto_143756 ) ) ( not ( = ?auto_143752 ?auto_143758 ) ) ( not ( = ?auto_143753 ?auto_143756 ) ) ( not ( = ?auto_143753 ?auto_143758 ) ) ( ON ?auto_143753 ?auto_143754 ) ( ON ?auto_143752 ?auto_143753 ) ( CLEAR ?auto_143752 ) ( HOLDING ?auto_143751 ) ( CLEAR ?auto_143750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143750 ?auto_143751 )
      ( MAKE-6PILE ?auto_143750 ?auto_143751 ?auto_143752 ?auto_143753 ?auto_143754 ?auto_143755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143759 - BLOCK
      ?auto_143760 - BLOCK
      ?auto_143761 - BLOCK
      ?auto_143762 - BLOCK
      ?auto_143763 - BLOCK
      ?auto_143764 - BLOCK
    )
    :vars
    (
      ?auto_143766 - BLOCK
      ?auto_143765 - BLOCK
      ?auto_143767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143759 ) ( not ( = ?auto_143759 ?auto_143760 ) ) ( not ( = ?auto_143759 ?auto_143761 ) ) ( not ( = ?auto_143759 ?auto_143762 ) ) ( not ( = ?auto_143759 ?auto_143763 ) ) ( not ( = ?auto_143759 ?auto_143764 ) ) ( not ( = ?auto_143760 ?auto_143761 ) ) ( not ( = ?auto_143760 ?auto_143762 ) ) ( not ( = ?auto_143760 ?auto_143763 ) ) ( not ( = ?auto_143760 ?auto_143764 ) ) ( not ( = ?auto_143761 ?auto_143762 ) ) ( not ( = ?auto_143761 ?auto_143763 ) ) ( not ( = ?auto_143761 ?auto_143764 ) ) ( not ( = ?auto_143762 ?auto_143763 ) ) ( not ( = ?auto_143762 ?auto_143764 ) ) ( not ( = ?auto_143763 ?auto_143764 ) ) ( ON ?auto_143764 ?auto_143766 ) ( not ( = ?auto_143759 ?auto_143766 ) ) ( not ( = ?auto_143760 ?auto_143766 ) ) ( not ( = ?auto_143761 ?auto_143766 ) ) ( not ( = ?auto_143762 ?auto_143766 ) ) ( not ( = ?auto_143763 ?auto_143766 ) ) ( not ( = ?auto_143764 ?auto_143766 ) ) ( ON ?auto_143763 ?auto_143764 ) ( ON-TABLE ?auto_143765 ) ( ON ?auto_143767 ?auto_143765 ) ( ON ?auto_143766 ?auto_143767 ) ( not ( = ?auto_143765 ?auto_143767 ) ) ( not ( = ?auto_143765 ?auto_143766 ) ) ( not ( = ?auto_143765 ?auto_143764 ) ) ( not ( = ?auto_143765 ?auto_143763 ) ) ( not ( = ?auto_143767 ?auto_143766 ) ) ( not ( = ?auto_143767 ?auto_143764 ) ) ( not ( = ?auto_143767 ?auto_143763 ) ) ( not ( = ?auto_143759 ?auto_143765 ) ) ( not ( = ?auto_143759 ?auto_143767 ) ) ( not ( = ?auto_143760 ?auto_143765 ) ) ( not ( = ?auto_143760 ?auto_143767 ) ) ( not ( = ?auto_143761 ?auto_143765 ) ) ( not ( = ?auto_143761 ?auto_143767 ) ) ( not ( = ?auto_143762 ?auto_143765 ) ) ( not ( = ?auto_143762 ?auto_143767 ) ) ( ON ?auto_143762 ?auto_143763 ) ( ON ?auto_143761 ?auto_143762 ) ( CLEAR ?auto_143759 ) ( ON ?auto_143760 ?auto_143761 ) ( CLEAR ?auto_143760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143765 ?auto_143767 ?auto_143766 ?auto_143764 ?auto_143763 ?auto_143762 ?auto_143761 )
      ( MAKE-6PILE ?auto_143759 ?auto_143760 ?auto_143761 ?auto_143762 ?auto_143763 ?auto_143764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143768 - BLOCK
      ?auto_143769 - BLOCK
      ?auto_143770 - BLOCK
      ?auto_143771 - BLOCK
      ?auto_143772 - BLOCK
      ?auto_143773 - BLOCK
    )
    :vars
    (
      ?auto_143775 - BLOCK
      ?auto_143774 - BLOCK
      ?auto_143776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143768 ?auto_143769 ) ) ( not ( = ?auto_143768 ?auto_143770 ) ) ( not ( = ?auto_143768 ?auto_143771 ) ) ( not ( = ?auto_143768 ?auto_143772 ) ) ( not ( = ?auto_143768 ?auto_143773 ) ) ( not ( = ?auto_143769 ?auto_143770 ) ) ( not ( = ?auto_143769 ?auto_143771 ) ) ( not ( = ?auto_143769 ?auto_143772 ) ) ( not ( = ?auto_143769 ?auto_143773 ) ) ( not ( = ?auto_143770 ?auto_143771 ) ) ( not ( = ?auto_143770 ?auto_143772 ) ) ( not ( = ?auto_143770 ?auto_143773 ) ) ( not ( = ?auto_143771 ?auto_143772 ) ) ( not ( = ?auto_143771 ?auto_143773 ) ) ( not ( = ?auto_143772 ?auto_143773 ) ) ( ON ?auto_143773 ?auto_143775 ) ( not ( = ?auto_143768 ?auto_143775 ) ) ( not ( = ?auto_143769 ?auto_143775 ) ) ( not ( = ?auto_143770 ?auto_143775 ) ) ( not ( = ?auto_143771 ?auto_143775 ) ) ( not ( = ?auto_143772 ?auto_143775 ) ) ( not ( = ?auto_143773 ?auto_143775 ) ) ( ON ?auto_143772 ?auto_143773 ) ( ON-TABLE ?auto_143774 ) ( ON ?auto_143776 ?auto_143774 ) ( ON ?auto_143775 ?auto_143776 ) ( not ( = ?auto_143774 ?auto_143776 ) ) ( not ( = ?auto_143774 ?auto_143775 ) ) ( not ( = ?auto_143774 ?auto_143773 ) ) ( not ( = ?auto_143774 ?auto_143772 ) ) ( not ( = ?auto_143776 ?auto_143775 ) ) ( not ( = ?auto_143776 ?auto_143773 ) ) ( not ( = ?auto_143776 ?auto_143772 ) ) ( not ( = ?auto_143768 ?auto_143774 ) ) ( not ( = ?auto_143768 ?auto_143776 ) ) ( not ( = ?auto_143769 ?auto_143774 ) ) ( not ( = ?auto_143769 ?auto_143776 ) ) ( not ( = ?auto_143770 ?auto_143774 ) ) ( not ( = ?auto_143770 ?auto_143776 ) ) ( not ( = ?auto_143771 ?auto_143774 ) ) ( not ( = ?auto_143771 ?auto_143776 ) ) ( ON ?auto_143771 ?auto_143772 ) ( ON ?auto_143770 ?auto_143771 ) ( ON ?auto_143769 ?auto_143770 ) ( CLEAR ?auto_143769 ) ( HOLDING ?auto_143768 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143768 )
      ( MAKE-6PILE ?auto_143768 ?auto_143769 ?auto_143770 ?auto_143771 ?auto_143772 ?auto_143773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143777 - BLOCK
      ?auto_143778 - BLOCK
      ?auto_143779 - BLOCK
      ?auto_143780 - BLOCK
      ?auto_143781 - BLOCK
      ?auto_143782 - BLOCK
    )
    :vars
    (
      ?auto_143783 - BLOCK
      ?auto_143784 - BLOCK
      ?auto_143785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143777 ?auto_143778 ) ) ( not ( = ?auto_143777 ?auto_143779 ) ) ( not ( = ?auto_143777 ?auto_143780 ) ) ( not ( = ?auto_143777 ?auto_143781 ) ) ( not ( = ?auto_143777 ?auto_143782 ) ) ( not ( = ?auto_143778 ?auto_143779 ) ) ( not ( = ?auto_143778 ?auto_143780 ) ) ( not ( = ?auto_143778 ?auto_143781 ) ) ( not ( = ?auto_143778 ?auto_143782 ) ) ( not ( = ?auto_143779 ?auto_143780 ) ) ( not ( = ?auto_143779 ?auto_143781 ) ) ( not ( = ?auto_143779 ?auto_143782 ) ) ( not ( = ?auto_143780 ?auto_143781 ) ) ( not ( = ?auto_143780 ?auto_143782 ) ) ( not ( = ?auto_143781 ?auto_143782 ) ) ( ON ?auto_143782 ?auto_143783 ) ( not ( = ?auto_143777 ?auto_143783 ) ) ( not ( = ?auto_143778 ?auto_143783 ) ) ( not ( = ?auto_143779 ?auto_143783 ) ) ( not ( = ?auto_143780 ?auto_143783 ) ) ( not ( = ?auto_143781 ?auto_143783 ) ) ( not ( = ?auto_143782 ?auto_143783 ) ) ( ON ?auto_143781 ?auto_143782 ) ( ON-TABLE ?auto_143784 ) ( ON ?auto_143785 ?auto_143784 ) ( ON ?auto_143783 ?auto_143785 ) ( not ( = ?auto_143784 ?auto_143785 ) ) ( not ( = ?auto_143784 ?auto_143783 ) ) ( not ( = ?auto_143784 ?auto_143782 ) ) ( not ( = ?auto_143784 ?auto_143781 ) ) ( not ( = ?auto_143785 ?auto_143783 ) ) ( not ( = ?auto_143785 ?auto_143782 ) ) ( not ( = ?auto_143785 ?auto_143781 ) ) ( not ( = ?auto_143777 ?auto_143784 ) ) ( not ( = ?auto_143777 ?auto_143785 ) ) ( not ( = ?auto_143778 ?auto_143784 ) ) ( not ( = ?auto_143778 ?auto_143785 ) ) ( not ( = ?auto_143779 ?auto_143784 ) ) ( not ( = ?auto_143779 ?auto_143785 ) ) ( not ( = ?auto_143780 ?auto_143784 ) ) ( not ( = ?auto_143780 ?auto_143785 ) ) ( ON ?auto_143780 ?auto_143781 ) ( ON ?auto_143779 ?auto_143780 ) ( ON ?auto_143778 ?auto_143779 ) ( ON ?auto_143777 ?auto_143778 ) ( CLEAR ?auto_143777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143784 ?auto_143785 ?auto_143783 ?auto_143782 ?auto_143781 ?auto_143780 ?auto_143779 ?auto_143778 )
      ( MAKE-6PILE ?auto_143777 ?auto_143778 ?auto_143779 ?auto_143780 ?auto_143781 ?auto_143782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143788 - BLOCK
      ?auto_143789 - BLOCK
    )
    :vars
    (
      ?auto_143790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143790 ?auto_143789 ) ( CLEAR ?auto_143790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143788 ) ( ON ?auto_143789 ?auto_143788 ) ( not ( = ?auto_143788 ?auto_143789 ) ) ( not ( = ?auto_143788 ?auto_143790 ) ) ( not ( = ?auto_143789 ?auto_143790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143790 ?auto_143789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143791 - BLOCK
      ?auto_143792 - BLOCK
    )
    :vars
    (
      ?auto_143793 - BLOCK
      ?auto_143794 - BLOCK
      ?auto_143795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143793 ?auto_143792 ) ( CLEAR ?auto_143793 ) ( ON-TABLE ?auto_143791 ) ( ON ?auto_143792 ?auto_143791 ) ( not ( = ?auto_143791 ?auto_143792 ) ) ( not ( = ?auto_143791 ?auto_143793 ) ) ( not ( = ?auto_143792 ?auto_143793 ) ) ( HOLDING ?auto_143794 ) ( CLEAR ?auto_143795 ) ( not ( = ?auto_143791 ?auto_143794 ) ) ( not ( = ?auto_143791 ?auto_143795 ) ) ( not ( = ?auto_143792 ?auto_143794 ) ) ( not ( = ?auto_143792 ?auto_143795 ) ) ( not ( = ?auto_143793 ?auto_143794 ) ) ( not ( = ?auto_143793 ?auto_143795 ) ) ( not ( = ?auto_143794 ?auto_143795 ) ) )
    :subtasks
    ( ( !STACK ?auto_143794 ?auto_143795 )
      ( MAKE-2PILE ?auto_143791 ?auto_143792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143796 - BLOCK
      ?auto_143797 - BLOCK
    )
    :vars
    (
      ?auto_143799 - BLOCK
      ?auto_143800 - BLOCK
      ?auto_143798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143799 ?auto_143797 ) ( ON-TABLE ?auto_143796 ) ( ON ?auto_143797 ?auto_143796 ) ( not ( = ?auto_143796 ?auto_143797 ) ) ( not ( = ?auto_143796 ?auto_143799 ) ) ( not ( = ?auto_143797 ?auto_143799 ) ) ( CLEAR ?auto_143800 ) ( not ( = ?auto_143796 ?auto_143798 ) ) ( not ( = ?auto_143796 ?auto_143800 ) ) ( not ( = ?auto_143797 ?auto_143798 ) ) ( not ( = ?auto_143797 ?auto_143800 ) ) ( not ( = ?auto_143799 ?auto_143798 ) ) ( not ( = ?auto_143799 ?auto_143800 ) ) ( not ( = ?auto_143798 ?auto_143800 ) ) ( ON ?auto_143798 ?auto_143799 ) ( CLEAR ?auto_143798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143796 ?auto_143797 ?auto_143799 )
      ( MAKE-2PILE ?auto_143796 ?auto_143797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143801 - BLOCK
      ?auto_143802 - BLOCK
    )
    :vars
    (
      ?auto_143803 - BLOCK
      ?auto_143805 - BLOCK
      ?auto_143804 - BLOCK
      ?auto_143808 - BLOCK
      ?auto_143806 - BLOCK
      ?auto_143809 - BLOCK
      ?auto_143807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143803 ?auto_143802 ) ( ON-TABLE ?auto_143801 ) ( ON ?auto_143802 ?auto_143801 ) ( not ( = ?auto_143801 ?auto_143802 ) ) ( not ( = ?auto_143801 ?auto_143803 ) ) ( not ( = ?auto_143802 ?auto_143803 ) ) ( not ( = ?auto_143801 ?auto_143805 ) ) ( not ( = ?auto_143801 ?auto_143804 ) ) ( not ( = ?auto_143802 ?auto_143805 ) ) ( not ( = ?auto_143802 ?auto_143804 ) ) ( not ( = ?auto_143803 ?auto_143805 ) ) ( not ( = ?auto_143803 ?auto_143804 ) ) ( not ( = ?auto_143805 ?auto_143804 ) ) ( ON ?auto_143805 ?auto_143803 ) ( CLEAR ?auto_143805 ) ( HOLDING ?auto_143804 ) ( CLEAR ?auto_143808 ) ( ON-TABLE ?auto_143806 ) ( ON ?auto_143809 ?auto_143806 ) ( ON ?auto_143807 ?auto_143809 ) ( ON ?auto_143808 ?auto_143807 ) ( not ( = ?auto_143806 ?auto_143809 ) ) ( not ( = ?auto_143806 ?auto_143807 ) ) ( not ( = ?auto_143806 ?auto_143808 ) ) ( not ( = ?auto_143806 ?auto_143804 ) ) ( not ( = ?auto_143809 ?auto_143807 ) ) ( not ( = ?auto_143809 ?auto_143808 ) ) ( not ( = ?auto_143809 ?auto_143804 ) ) ( not ( = ?auto_143807 ?auto_143808 ) ) ( not ( = ?auto_143807 ?auto_143804 ) ) ( not ( = ?auto_143808 ?auto_143804 ) ) ( not ( = ?auto_143801 ?auto_143808 ) ) ( not ( = ?auto_143801 ?auto_143806 ) ) ( not ( = ?auto_143801 ?auto_143809 ) ) ( not ( = ?auto_143801 ?auto_143807 ) ) ( not ( = ?auto_143802 ?auto_143808 ) ) ( not ( = ?auto_143802 ?auto_143806 ) ) ( not ( = ?auto_143802 ?auto_143809 ) ) ( not ( = ?auto_143802 ?auto_143807 ) ) ( not ( = ?auto_143803 ?auto_143808 ) ) ( not ( = ?auto_143803 ?auto_143806 ) ) ( not ( = ?auto_143803 ?auto_143809 ) ) ( not ( = ?auto_143803 ?auto_143807 ) ) ( not ( = ?auto_143805 ?auto_143808 ) ) ( not ( = ?auto_143805 ?auto_143806 ) ) ( not ( = ?auto_143805 ?auto_143809 ) ) ( not ( = ?auto_143805 ?auto_143807 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143806 ?auto_143809 ?auto_143807 ?auto_143808 ?auto_143804 )
      ( MAKE-2PILE ?auto_143801 ?auto_143802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143810 - BLOCK
      ?auto_143811 - BLOCK
    )
    :vars
    (
      ?auto_143818 - BLOCK
      ?auto_143817 - BLOCK
      ?auto_143812 - BLOCK
      ?auto_143816 - BLOCK
      ?auto_143813 - BLOCK
      ?auto_143814 - BLOCK
      ?auto_143815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143818 ?auto_143811 ) ( ON-TABLE ?auto_143810 ) ( ON ?auto_143811 ?auto_143810 ) ( not ( = ?auto_143810 ?auto_143811 ) ) ( not ( = ?auto_143810 ?auto_143818 ) ) ( not ( = ?auto_143811 ?auto_143818 ) ) ( not ( = ?auto_143810 ?auto_143817 ) ) ( not ( = ?auto_143810 ?auto_143812 ) ) ( not ( = ?auto_143811 ?auto_143817 ) ) ( not ( = ?auto_143811 ?auto_143812 ) ) ( not ( = ?auto_143818 ?auto_143817 ) ) ( not ( = ?auto_143818 ?auto_143812 ) ) ( not ( = ?auto_143817 ?auto_143812 ) ) ( ON ?auto_143817 ?auto_143818 ) ( CLEAR ?auto_143816 ) ( ON-TABLE ?auto_143813 ) ( ON ?auto_143814 ?auto_143813 ) ( ON ?auto_143815 ?auto_143814 ) ( ON ?auto_143816 ?auto_143815 ) ( not ( = ?auto_143813 ?auto_143814 ) ) ( not ( = ?auto_143813 ?auto_143815 ) ) ( not ( = ?auto_143813 ?auto_143816 ) ) ( not ( = ?auto_143813 ?auto_143812 ) ) ( not ( = ?auto_143814 ?auto_143815 ) ) ( not ( = ?auto_143814 ?auto_143816 ) ) ( not ( = ?auto_143814 ?auto_143812 ) ) ( not ( = ?auto_143815 ?auto_143816 ) ) ( not ( = ?auto_143815 ?auto_143812 ) ) ( not ( = ?auto_143816 ?auto_143812 ) ) ( not ( = ?auto_143810 ?auto_143816 ) ) ( not ( = ?auto_143810 ?auto_143813 ) ) ( not ( = ?auto_143810 ?auto_143814 ) ) ( not ( = ?auto_143810 ?auto_143815 ) ) ( not ( = ?auto_143811 ?auto_143816 ) ) ( not ( = ?auto_143811 ?auto_143813 ) ) ( not ( = ?auto_143811 ?auto_143814 ) ) ( not ( = ?auto_143811 ?auto_143815 ) ) ( not ( = ?auto_143818 ?auto_143816 ) ) ( not ( = ?auto_143818 ?auto_143813 ) ) ( not ( = ?auto_143818 ?auto_143814 ) ) ( not ( = ?auto_143818 ?auto_143815 ) ) ( not ( = ?auto_143817 ?auto_143816 ) ) ( not ( = ?auto_143817 ?auto_143813 ) ) ( not ( = ?auto_143817 ?auto_143814 ) ) ( not ( = ?auto_143817 ?auto_143815 ) ) ( ON ?auto_143812 ?auto_143817 ) ( CLEAR ?auto_143812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143810 ?auto_143811 ?auto_143818 ?auto_143817 )
      ( MAKE-2PILE ?auto_143810 ?auto_143811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143819 - BLOCK
      ?auto_143820 - BLOCK
    )
    :vars
    (
      ?auto_143822 - BLOCK
      ?auto_143825 - BLOCK
      ?auto_143826 - BLOCK
      ?auto_143824 - BLOCK
      ?auto_143823 - BLOCK
      ?auto_143821 - BLOCK
      ?auto_143827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143822 ?auto_143820 ) ( ON-TABLE ?auto_143819 ) ( ON ?auto_143820 ?auto_143819 ) ( not ( = ?auto_143819 ?auto_143820 ) ) ( not ( = ?auto_143819 ?auto_143822 ) ) ( not ( = ?auto_143820 ?auto_143822 ) ) ( not ( = ?auto_143819 ?auto_143825 ) ) ( not ( = ?auto_143819 ?auto_143826 ) ) ( not ( = ?auto_143820 ?auto_143825 ) ) ( not ( = ?auto_143820 ?auto_143826 ) ) ( not ( = ?auto_143822 ?auto_143825 ) ) ( not ( = ?auto_143822 ?auto_143826 ) ) ( not ( = ?auto_143825 ?auto_143826 ) ) ( ON ?auto_143825 ?auto_143822 ) ( ON-TABLE ?auto_143824 ) ( ON ?auto_143823 ?auto_143824 ) ( ON ?auto_143821 ?auto_143823 ) ( not ( = ?auto_143824 ?auto_143823 ) ) ( not ( = ?auto_143824 ?auto_143821 ) ) ( not ( = ?auto_143824 ?auto_143827 ) ) ( not ( = ?auto_143824 ?auto_143826 ) ) ( not ( = ?auto_143823 ?auto_143821 ) ) ( not ( = ?auto_143823 ?auto_143827 ) ) ( not ( = ?auto_143823 ?auto_143826 ) ) ( not ( = ?auto_143821 ?auto_143827 ) ) ( not ( = ?auto_143821 ?auto_143826 ) ) ( not ( = ?auto_143827 ?auto_143826 ) ) ( not ( = ?auto_143819 ?auto_143827 ) ) ( not ( = ?auto_143819 ?auto_143824 ) ) ( not ( = ?auto_143819 ?auto_143823 ) ) ( not ( = ?auto_143819 ?auto_143821 ) ) ( not ( = ?auto_143820 ?auto_143827 ) ) ( not ( = ?auto_143820 ?auto_143824 ) ) ( not ( = ?auto_143820 ?auto_143823 ) ) ( not ( = ?auto_143820 ?auto_143821 ) ) ( not ( = ?auto_143822 ?auto_143827 ) ) ( not ( = ?auto_143822 ?auto_143824 ) ) ( not ( = ?auto_143822 ?auto_143823 ) ) ( not ( = ?auto_143822 ?auto_143821 ) ) ( not ( = ?auto_143825 ?auto_143827 ) ) ( not ( = ?auto_143825 ?auto_143824 ) ) ( not ( = ?auto_143825 ?auto_143823 ) ) ( not ( = ?auto_143825 ?auto_143821 ) ) ( ON ?auto_143826 ?auto_143825 ) ( CLEAR ?auto_143826 ) ( HOLDING ?auto_143827 ) ( CLEAR ?auto_143821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143824 ?auto_143823 ?auto_143821 ?auto_143827 )
      ( MAKE-2PILE ?auto_143819 ?auto_143820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143828 - BLOCK
      ?auto_143829 - BLOCK
    )
    :vars
    (
      ?auto_143836 - BLOCK
      ?auto_143833 - BLOCK
      ?auto_143832 - BLOCK
      ?auto_143831 - BLOCK
      ?auto_143835 - BLOCK
      ?auto_143834 - BLOCK
      ?auto_143830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143836 ?auto_143829 ) ( ON-TABLE ?auto_143828 ) ( ON ?auto_143829 ?auto_143828 ) ( not ( = ?auto_143828 ?auto_143829 ) ) ( not ( = ?auto_143828 ?auto_143836 ) ) ( not ( = ?auto_143829 ?auto_143836 ) ) ( not ( = ?auto_143828 ?auto_143833 ) ) ( not ( = ?auto_143828 ?auto_143832 ) ) ( not ( = ?auto_143829 ?auto_143833 ) ) ( not ( = ?auto_143829 ?auto_143832 ) ) ( not ( = ?auto_143836 ?auto_143833 ) ) ( not ( = ?auto_143836 ?auto_143832 ) ) ( not ( = ?auto_143833 ?auto_143832 ) ) ( ON ?auto_143833 ?auto_143836 ) ( ON-TABLE ?auto_143831 ) ( ON ?auto_143835 ?auto_143831 ) ( ON ?auto_143834 ?auto_143835 ) ( not ( = ?auto_143831 ?auto_143835 ) ) ( not ( = ?auto_143831 ?auto_143834 ) ) ( not ( = ?auto_143831 ?auto_143830 ) ) ( not ( = ?auto_143831 ?auto_143832 ) ) ( not ( = ?auto_143835 ?auto_143834 ) ) ( not ( = ?auto_143835 ?auto_143830 ) ) ( not ( = ?auto_143835 ?auto_143832 ) ) ( not ( = ?auto_143834 ?auto_143830 ) ) ( not ( = ?auto_143834 ?auto_143832 ) ) ( not ( = ?auto_143830 ?auto_143832 ) ) ( not ( = ?auto_143828 ?auto_143830 ) ) ( not ( = ?auto_143828 ?auto_143831 ) ) ( not ( = ?auto_143828 ?auto_143835 ) ) ( not ( = ?auto_143828 ?auto_143834 ) ) ( not ( = ?auto_143829 ?auto_143830 ) ) ( not ( = ?auto_143829 ?auto_143831 ) ) ( not ( = ?auto_143829 ?auto_143835 ) ) ( not ( = ?auto_143829 ?auto_143834 ) ) ( not ( = ?auto_143836 ?auto_143830 ) ) ( not ( = ?auto_143836 ?auto_143831 ) ) ( not ( = ?auto_143836 ?auto_143835 ) ) ( not ( = ?auto_143836 ?auto_143834 ) ) ( not ( = ?auto_143833 ?auto_143830 ) ) ( not ( = ?auto_143833 ?auto_143831 ) ) ( not ( = ?auto_143833 ?auto_143835 ) ) ( not ( = ?auto_143833 ?auto_143834 ) ) ( ON ?auto_143832 ?auto_143833 ) ( CLEAR ?auto_143834 ) ( ON ?auto_143830 ?auto_143832 ) ( CLEAR ?auto_143830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143828 ?auto_143829 ?auto_143836 ?auto_143833 ?auto_143832 )
      ( MAKE-2PILE ?auto_143828 ?auto_143829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143837 - BLOCK
      ?auto_143838 - BLOCK
    )
    :vars
    (
      ?auto_143845 - BLOCK
      ?auto_143841 - BLOCK
      ?auto_143839 - BLOCK
      ?auto_143840 - BLOCK
      ?auto_143844 - BLOCK
      ?auto_143842 - BLOCK
      ?auto_143843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143845 ?auto_143838 ) ( ON-TABLE ?auto_143837 ) ( ON ?auto_143838 ?auto_143837 ) ( not ( = ?auto_143837 ?auto_143838 ) ) ( not ( = ?auto_143837 ?auto_143845 ) ) ( not ( = ?auto_143838 ?auto_143845 ) ) ( not ( = ?auto_143837 ?auto_143841 ) ) ( not ( = ?auto_143837 ?auto_143839 ) ) ( not ( = ?auto_143838 ?auto_143841 ) ) ( not ( = ?auto_143838 ?auto_143839 ) ) ( not ( = ?auto_143845 ?auto_143841 ) ) ( not ( = ?auto_143845 ?auto_143839 ) ) ( not ( = ?auto_143841 ?auto_143839 ) ) ( ON ?auto_143841 ?auto_143845 ) ( ON-TABLE ?auto_143840 ) ( ON ?auto_143844 ?auto_143840 ) ( not ( = ?auto_143840 ?auto_143844 ) ) ( not ( = ?auto_143840 ?auto_143842 ) ) ( not ( = ?auto_143840 ?auto_143843 ) ) ( not ( = ?auto_143840 ?auto_143839 ) ) ( not ( = ?auto_143844 ?auto_143842 ) ) ( not ( = ?auto_143844 ?auto_143843 ) ) ( not ( = ?auto_143844 ?auto_143839 ) ) ( not ( = ?auto_143842 ?auto_143843 ) ) ( not ( = ?auto_143842 ?auto_143839 ) ) ( not ( = ?auto_143843 ?auto_143839 ) ) ( not ( = ?auto_143837 ?auto_143843 ) ) ( not ( = ?auto_143837 ?auto_143840 ) ) ( not ( = ?auto_143837 ?auto_143844 ) ) ( not ( = ?auto_143837 ?auto_143842 ) ) ( not ( = ?auto_143838 ?auto_143843 ) ) ( not ( = ?auto_143838 ?auto_143840 ) ) ( not ( = ?auto_143838 ?auto_143844 ) ) ( not ( = ?auto_143838 ?auto_143842 ) ) ( not ( = ?auto_143845 ?auto_143843 ) ) ( not ( = ?auto_143845 ?auto_143840 ) ) ( not ( = ?auto_143845 ?auto_143844 ) ) ( not ( = ?auto_143845 ?auto_143842 ) ) ( not ( = ?auto_143841 ?auto_143843 ) ) ( not ( = ?auto_143841 ?auto_143840 ) ) ( not ( = ?auto_143841 ?auto_143844 ) ) ( not ( = ?auto_143841 ?auto_143842 ) ) ( ON ?auto_143839 ?auto_143841 ) ( ON ?auto_143843 ?auto_143839 ) ( CLEAR ?auto_143843 ) ( HOLDING ?auto_143842 ) ( CLEAR ?auto_143844 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143840 ?auto_143844 ?auto_143842 )
      ( MAKE-2PILE ?auto_143837 ?auto_143838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143846 - BLOCK
      ?auto_143847 - BLOCK
    )
    :vars
    (
      ?auto_143850 - BLOCK
      ?auto_143848 - BLOCK
      ?auto_143854 - BLOCK
      ?auto_143851 - BLOCK
      ?auto_143853 - BLOCK
      ?auto_143852 - BLOCK
      ?auto_143849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143850 ?auto_143847 ) ( ON-TABLE ?auto_143846 ) ( ON ?auto_143847 ?auto_143846 ) ( not ( = ?auto_143846 ?auto_143847 ) ) ( not ( = ?auto_143846 ?auto_143850 ) ) ( not ( = ?auto_143847 ?auto_143850 ) ) ( not ( = ?auto_143846 ?auto_143848 ) ) ( not ( = ?auto_143846 ?auto_143854 ) ) ( not ( = ?auto_143847 ?auto_143848 ) ) ( not ( = ?auto_143847 ?auto_143854 ) ) ( not ( = ?auto_143850 ?auto_143848 ) ) ( not ( = ?auto_143850 ?auto_143854 ) ) ( not ( = ?auto_143848 ?auto_143854 ) ) ( ON ?auto_143848 ?auto_143850 ) ( ON-TABLE ?auto_143851 ) ( ON ?auto_143853 ?auto_143851 ) ( not ( = ?auto_143851 ?auto_143853 ) ) ( not ( = ?auto_143851 ?auto_143852 ) ) ( not ( = ?auto_143851 ?auto_143849 ) ) ( not ( = ?auto_143851 ?auto_143854 ) ) ( not ( = ?auto_143853 ?auto_143852 ) ) ( not ( = ?auto_143853 ?auto_143849 ) ) ( not ( = ?auto_143853 ?auto_143854 ) ) ( not ( = ?auto_143852 ?auto_143849 ) ) ( not ( = ?auto_143852 ?auto_143854 ) ) ( not ( = ?auto_143849 ?auto_143854 ) ) ( not ( = ?auto_143846 ?auto_143849 ) ) ( not ( = ?auto_143846 ?auto_143851 ) ) ( not ( = ?auto_143846 ?auto_143853 ) ) ( not ( = ?auto_143846 ?auto_143852 ) ) ( not ( = ?auto_143847 ?auto_143849 ) ) ( not ( = ?auto_143847 ?auto_143851 ) ) ( not ( = ?auto_143847 ?auto_143853 ) ) ( not ( = ?auto_143847 ?auto_143852 ) ) ( not ( = ?auto_143850 ?auto_143849 ) ) ( not ( = ?auto_143850 ?auto_143851 ) ) ( not ( = ?auto_143850 ?auto_143853 ) ) ( not ( = ?auto_143850 ?auto_143852 ) ) ( not ( = ?auto_143848 ?auto_143849 ) ) ( not ( = ?auto_143848 ?auto_143851 ) ) ( not ( = ?auto_143848 ?auto_143853 ) ) ( not ( = ?auto_143848 ?auto_143852 ) ) ( ON ?auto_143854 ?auto_143848 ) ( ON ?auto_143849 ?auto_143854 ) ( CLEAR ?auto_143853 ) ( ON ?auto_143852 ?auto_143849 ) ( CLEAR ?auto_143852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143846 ?auto_143847 ?auto_143850 ?auto_143848 ?auto_143854 ?auto_143849 )
      ( MAKE-2PILE ?auto_143846 ?auto_143847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143855 - BLOCK
      ?auto_143856 - BLOCK
    )
    :vars
    (
      ?auto_143861 - BLOCK
      ?auto_143858 - BLOCK
      ?auto_143863 - BLOCK
      ?auto_143860 - BLOCK
      ?auto_143857 - BLOCK
      ?auto_143862 - BLOCK
      ?auto_143859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143861 ?auto_143856 ) ( ON-TABLE ?auto_143855 ) ( ON ?auto_143856 ?auto_143855 ) ( not ( = ?auto_143855 ?auto_143856 ) ) ( not ( = ?auto_143855 ?auto_143861 ) ) ( not ( = ?auto_143856 ?auto_143861 ) ) ( not ( = ?auto_143855 ?auto_143858 ) ) ( not ( = ?auto_143855 ?auto_143863 ) ) ( not ( = ?auto_143856 ?auto_143858 ) ) ( not ( = ?auto_143856 ?auto_143863 ) ) ( not ( = ?auto_143861 ?auto_143858 ) ) ( not ( = ?auto_143861 ?auto_143863 ) ) ( not ( = ?auto_143858 ?auto_143863 ) ) ( ON ?auto_143858 ?auto_143861 ) ( ON-TABLE ?auto_143860 ) ( not ( = ?auto_143860 ?auto_143857 ) ) ( not ( = ?auto_143860 ?auto_143862 ) ) ( not ( = ?auto_143860 ?auto_143859 ) ) ( not ( = ?auto_143860 ?auto_143863 ) ) ( not ( = ?auto_143857 ?auto_143862 ) ) ( not ( = ?auto_143857 ?auto_143859 ) ) ( not ( = ?auto_143857 ?auto_143863 ) ) ( not ( = ?auto_143862 ?auto_143859 ) ) ( not ( = ?auto_143862 ?auto_143863 ) ) ( not ( = ?auto_143859 ?auto_143863 ) ) ( not ( = ?auto_143855 ?auto_143859 ) ) ( not ( = ?auto_143855 ?auto_143860 ) ) ( not ( = ?auto_143855 ?auto_143857 ) ) ( not ( = ?auto_143855 ?auto_143862 ) ) ( not ( = ?auto_143856 ?auto_143859 ) ) ( not ( = ?auto_143856 ?auto_143860 ) ) ( not ( = ?auto_143856 ?auto_143857 ) ) ( not ( = ?auto_143856 ?auto_143862 ) ) ( not ( = ?auto_143861 ?auto_143859 ) ) ( not ( = ?auto_143861 ?auto_143860 ) ) ( not ( = ?auto_143861 ?auto_143857 ) ) ( not ( = ?auto_143861 ?auto_143862 ) ) ( not ( = ?auto_143858 ?auto_143859 ) ) ( not ( = ?auto_143858 ?auto_143860 ) ) ( not ( = ?auto_143858 ?auto_143857 ) ) ( not ( = ?auto_143858 ?auto_143862 ) ) ( ON ?auto_143863 ?auto_143858 ) ( ON ?auto_143859 ?auto_143863 ) ( ON ?auto_143862 ?auto_143859 ) ( CLEAR ?auto_143862 ) ( HOLDING ?auto_143857 ) ( CLEAR ?auto_143860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143860 ?auto_143857 )
      ( MAKE-2PILE ?auto_143855 ?auto_143856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145882 - BLOCK
      ?auto_145883 - BLOCK
    )
    :vars
    (
      ?auto_145887 - BLOCK
      ?auto_145888 - BLOCK
      ?auto_145889 - BLOCK
      ?auto_145885 - BLOCK
      ?auto_145884 - BLOCK
      ?auto_145886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145887 ?auto_145883 ) ( ON-TABLE ?auto_145882 ) ( ON ?auto_145883 ?auto_145882 ) ( not ( = ?auto_145882 ?auto_145883 ) ) ( not ( = ?auto_145882 ?auto_145887 ) ) ( not ( = ?auto_145883 ?auto_145887 ) ) ( not ( = ?auto_145882 ?auto_145888 ) ) ( not ( = ?auto_145882 ?auto_145889 ) ) ( not ( = ?auto_145883 ?auto_145888 ) ) ( not ( = ?auto_145883 ?auto_145889 ) ) ( not ( = ?auto_145887 ?auto_145888 ) ) ( not ( = ?auto_145887 ?auto_145889 ) ) ( not ( = ?auto_145888 ?auto_145889 ) ) ( ON ?auto_145888 ?auto_145887 ) ( not ( = ?auto_145885 ?auto_145884 ) ) ( not ( = ?auto_145885 ?auto_145886 ) ) ( not ( = ?auto_145885 ?auto_145889 ) ) ( not ( = ?auto_145884 ?auto_145886 ) ) ( not ( = ?auto_145884 ?auto_145889 ) ) ( not ( = ?auto_145886 ?auto_145889 ) ) ( not ( = ?auto_145882 ?auto_145886 ) ) ( not ( = ?auto_145882 ?auto_145885 ) ) ( not ( = ?auto_145882 ?auto_145884 ) ) ( not ( = ?auto_145883 ?auto_145886 ) ) ( not ( = ?auto_145883 ?auto_145885 ) ) ( not ( = ?auto_145883 ?auto_145884 ) ) ( not ( = ?auto_145887 ?auto_145886 ) ) ( not ( = ?auto_145887 ?auto_145885 ) ) ( not ( = ?auto_145887 ?auto_145884 ) ) ( not ( = ?auto_145888 ?auto_145886 ) ) ( not ( = ?auto_145888 ?auto_145885 ) ) ( not ( = ?auto_145888 ?auto_145884 ) ) ( ON ?auto_145889 ?auto_145888 ) ( ON ?auto_145886 ?auto_145889 ) ( ON ?auto_145884 ?auto_145886 ) ( ON ?auto_145885 ?auto_145884 ) ( CLEAR ?auto_145885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145882 ?auto_145883 ?auto_145887 ?auto_145888 ?auto_145889 ?auto_145886 ?auto_145884 )
      ( MAKE-2PILE ?auto_145882 ?auto_145883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143873 - BLOCK
      ?auto_143874 - BLOCK
    )
    :vars
    (
      ?auto_143875 - BLOCK
      ?auto_143879 - BLOCK
      ?auto_143880 - BLOCK
      ?auto_143876 - BLOCK
      ?auto_143878 - BLOCK
      ?auto_143877 - BLOCK
      ?auto_143881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143875 ?auto_143874 ) ( ON-TABLE ?auto_143873 ) ( ON ?auto_143874 ?auto_143873 ) ( not ( = ?auto_143873 ?auto_143874 ) ) ( not ( = ?auto_143873 ?auto_143875 ) ) ( not ( = ?auto_143874 ?auto_143875 ) ) ( not ( = ?auto_143873 ?auto_143879 ) ) ( not ( = ?auto_143873 ?auto_143880 ) ) ( not ( = ?auto_143874 ?auto_143879 ) ) ( not ( = ?auto_143874 ?auto_143880 ) ) ( not ( = ?auto_143875 ?auto_143879 ) ) ( not ( = ?auto_143875 ?auto_143880 ) ) ( not ( = ?auto_143879 ?auto_143880 ) ) ( ON ?auto_143879 ?auto_143875 ) ( not ( = ?auto_143876 ?auto_143878 ) ) ( not ( = ?auto_143876 ?auto_143877 ) ) ( not ( = ?auto_143876 ?auto_143881 ) ) ( not ( = ?auto_143876 ?auto_143880 ) ) ( not ( = ?auto_143878 ?auto_143877 ) ) ( not ( = ?auto_143878 ?auto_143881 ) ) ( not ( = ?auto_143878 ?auto_143880 ) ) ( not ( = ?auto_143877 ?auto_143881 ) ) ( not ( = ?auto_143877 ?auto_143880 ) ) ( not ( = ?auto_143881 ?auto_143880 ) ) ( not ( = ?auto_143873 ?auto_143881 ) ) ( not ( = ?auto_143873 ?auto_143876 ) ) ( not ( = ?auto_143873 ?auto_143878 ) ) ( not ( = ?auto_143873 ?auto_143877 ) ) ( not ( = ?auto_143874 ?auto_143881 ) ) ( not ( = ?auto_143874 ?auto_143876 ) ) ( not ( = ?auto_143874 ?auto_143878 ) ) ( not ( = ?auto_143874 ?auto_143877 ) ) ( not ( = ?auto_143875 ?auto_143881 ) ) ( not ( = ?auto_143875 ?auto_143876 ) ) ( not ( = ?auto_143875 ?auto_143878 ) ) ( not ( = ?auto_143875 ?auto_143877 ) ) ( not ( = ?auto_143879 ?auto_143881 ) ) ( not ( = ?auto_143879 ?auto_143876 ) ) ( not ( = ?auto_143879 ?auto_143878 ) ) ( not ( = ?auto_143879 ?auto_143877 ) ) ( ON ?auto_143880 ?auto_143879 ) ( ON ?auto_143881 ?auto_143880 ) ( ON ?auto_143877 ?auto_143881 ) ( ON ?auto_143878 ?auto_143877 ) ( CLEAR ?auto_143878 ) ( HOLDING ?auto_143876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143876 )
      ( MAKE-2PILE ?auto_143873 ?auto_143874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143882 - BLOCK
      ?auto_143883 - BLOCK
    )
    :vars
    (
      ?auto_143887 - BLOCK
      ?auto_143890 - BLOCK
      ?auto_143886 - BLOCK
      ?auto_143885 - BLOCK
      ?auto_143884 - BLOCK
      ?auto_143888 - BLOCK
      ?auto_143889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143887 ?auto_143883 ) ( ON-TABLE ?auto_143882 ) ( ON ?auto_143883 ?auto_143882 ) ( not ( = ?auto_143882 ?auto_143883 ) ) ( not ( = ?auto_143882 ?auto_143887 ) ) ( not ( = ?auto_143883 ?auto_143887 ) ) ( not ( = ?auto_143882 ?auto_143890 ) ) ( not ( = ?auto_143882 ?auto_143886 ) ) ( not ( = ?auto_143883 ?auto_143890 ) ) ( not ( = ?auto_143883 ?auto_143886 ) ) ( not ( = ?auto_143887 ?auto_143890 ) ) ( not ( = ?auto_143887 ?auto_143886 ) ) ( not ( = ?auto_143890 ?auto_143886 ) ) ( ON ?auto_143890 ?auto_143887 ) ( not ( = ?auto_143885 ?auto_143884 ) ) ( not ( = ?auto_143885 ?auto_143888 ) ) ( not ( = ?auto_143885 ?auto_143889 ) ) ( not ( = ?auto_143885 ?auto_143886 ) ) ( not ( = ?auto_143884 ?auto_143888 ) ) ( not ( = ?auto_143884 ?auto_143889 ) ) ( not ( = ?auto_143884 ?auto_143886 ) ) ( not ( = ?auto_143888 ?auto_143889 ) ) ( not ( = ?auto_143888 ?auto_143886 ) ) ( not ( = ?auto_143889 ?auto_143886 ) ) ( not ( = ?auto_143882 ?auto_143889 ) ) ( not ( = ?auto_143882 ?auto_143885 ) ) ( not ( = ?auto_143882 ?auto_143884 ) ) ( not ( = ?auto_143882 ?auto_143888 ) ) ( not ( = ?auto_143883 ?auto_143889 ) ) ( not ( = ?auto_143883 ?auto_143885 ) ) ( not ( = ?auto_143883 ?auto_143884 ) ) ( not ( = ?auto_143883 ?auto_143888 ) ) ( not ( = ?auto_143887 ?auto_143889 ) ) ( not ( = ?auto_143887 ?auto_143885 ) ) ( not ( = ?auto_143887 ?auto_143884 ) ) ( not ( = ?auto_143887 ?auto_143888 ) ) ( not ( = ?auto_143890 ?auto_143889 ) ) ( not ( = ?auto_143890 ?auto_143885 ) ) ( not ( = ?auto_143890 ?auto_143884 ) ) ( not ( = ?auto_143890 ?auto_143888 ) ) ( ON ?auto_143886 ?auto_143890 ) ( ON ?auto_143889 ?auto_143886 ) ( ON ?auto_143888 ?auto_143889 ) ( ON ?auto_143884 ?auto_143888 ) ( ON ?auto_143885 ?auto_143884 ) ( CLEAR ?auto_143885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143882 ?auto_143883 ?auto_143887 ?auto_143890 ?auto_143886 ?auto_143889 ?auto_143888 ?auto_143884 )
      ( MAKE-2PILE ?auto_143882 ?auto_143883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143898 - BLOCK
      ?auto_143899 - BLOCK
      ?auto_143900 - BLOCK
      ?auto_143901 - BLOCK
      ?auto_143902 - BLOCK
      ?auto_143903 - BLOCK
      ?auto_143904 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143904 ) ( CLEAR ?auto_143903 ) ( ON-TABLE ?auto_143898 ) ( ON ?auto_143899 ?auto_143898 ) ( ON ?auto_143900 ?auto_143899 ) ( ON ?auto_143901 ?auto_143900 ) ( ON ?auto_143902 ?auto_143901 ) ( ON ?auto_143903 ?auto_143902 ) ( not ( = ?auto_143898 ?auto_143899 ) ) ( not ( = ?auto_143898 ?auto_143900 ) ) ( not ( = ?auto_143898 ?auto_143901 ) ) ( not ( = ?auto_143898 ?auto_143902 ) ) ( not ( = ?auto_143898 ?auto_143903 ) ) ( not ( = ?auto_143898 ?auto_143904 ) ) ( not ( = ?auto_143899 ?auto_143900 ) ) ( not ( = ?auto_143899 ?auto_143901 ) ) ( not ( = ?auto_143899 ?auto_143902 ) ) ( not ( = ?auto_143899 ?auto_143903 ) ) ( not ( = ?auto_143899 ?auto_143904 ) ) ( not ( = ?auto_143900 ?auto_143901 ) ) ( not ( = ?auto_143900 ?auto_143902 ) ) ( not ( = ?auto_143900 ?auto_143903 ) ) ( not ( = ?auto_143900 ?auto_143904 ) ) ( not ( = ?auto_143901 ?auto_143902 ) ) ( not ( = ?auto_143901 ?auto_143903 ) ) ( not ( = ?auto_143901 ?auto_143904 ) ) ( not ( = ?auto_143902 ?auto_143903 ) ) ( not ( = ?auto_143902 ?auto_143904 ) ) ( not ( = ?auto_143903 ?auto_143904 ) ) )
    :subtasks
    ( ( !STACK ?auto_143904 ?auto_143903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143905 - BLOCK
      ?auto_143906 - BLOCK
      ?auto_143907 - BLOCK
      ?auto_143908 - BLOCK
      ?auto_143909 - BLOCK
      ?auto_143910 - BLOCK
      ?auto_143911 - BLOCK
    )
    :vars
    (
      ?auto_143912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143910 ) ( ON-TABLE ?auto_143905 ) ( ON ?auto_143906 ?auto_143905 ) ( ON ?auto_143907 ?auto_143906 ) ( ON ?auto_143908 ?auto_143907 ) ( ON ?auto_143909 ?auto_143908 ) ( ON ?auto_143910 ?auto_143909 ) ( not ( = ?auto_143905 ?auto_143906 ) ) ( not ( = ?auto_143905 ?auto_143907 ) ) ( not ( = ?auto_143905 ?auto_143908 ) ) ( not ( = ?auto_143905 ?auto_143909 ) ) ( not ( = ?auto_143905 ?auto_143910 ) ) ( not ( = ?auto_143905 ?auto_143911 ) ) ( not ( = ?auto_143906 ?auto_143907 ) ) ( not ( = ?auto_143906 ?auto_143908 ) ) ( not ( = ?auto_143906 ?auto_143909 ) ) ( not ( = ?auto_143906 ?auto_143910 ) ) ( not ( = ?auto_143906 ?auto_143911 ) ) ( not ( = ?auto_143907 ?auto_143908 ) ) ( not ( = ?auto_143907 ?auto_143909 ) ) ( not ( = ?auto_143907 ?auto_143910 ) ) ( not ( = ?auto_143907 ?auto_143911 ) ) ( not ( = ?auto_143908 ?auto_143909 ) ) ( not ( = ?auto_143908 ?auto_143910 ) ) ( not ( = ?auto_143908 ?auto_143911 ) ) ( not ( = ?auto_143909 ?auto_143910 ) ) ( not ( = ?auto_143909 ?auto_143911 ) ) ( not ( = ?auto_143910 ?auto_143911 ) ) ( ON ?auto_143911 ?auto_143912 ) ( CLEAR ?auto_143911 ) ( HAND-EMPTY ) ( not ( = ?auto_143905 ?auto_143912 ) ) ( not ( = ?auto_143906 ?auto_143912 ) ) ( not ( = ?auto_143907 ?auto_143912 ) ) ( not ( = ?auto_143908 ?auto_143912 ) ) ( not ( = ?auto_143909 ?auto_143912 ) ) ( not ( = ?auto_143910 ?auto_143912 ) ) ( not ( = ?auto_143911 ?auto_143912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143911 ?auto_143912 )
      ( MAKE-7PILE ?auto_143905 ?auto_143906 ?auto_143907 ?auto_143908 ?auto_143909 ?auto_143910 ?auto_143911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143913 - BLOCK
      ?auto_143914 - BLOCK
      ?auto_143915 - BLOCK
      ?auto_143916 - BLOCK
      ?auto_143917 - BLOCK
      ?auto_143918 - BLOCK
      ?auto_143919 - BLOCK
    )
    :vars
    (
      ?auto_143920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143913 ) ( ON ?auto_143914 ?auto_143913 ) ( ON ?auto_143915 ?auto_143914 ) ( ON ?auto_143916 ?auto_143915 ) ( ON ?auto_143917 ?auto_143916 ) ( not ( = ?auto_143913 ?auto_143914 ) ) ( not ( = ?auto_143913 ?auto_143915 ) ) ( not ( = ?auto_143913 ?auto_143916 ) ) ( not ( = ?auto_143913 ?auto_143917 ) ) ( not ( = ?auto_143913 ?auto_143918 ) ) ( not ( = ?auto_143913 ?auto_143919 ) ) ( not ( = ?auto_143914 ?auto_143915 ) ) ( not ( = ?auto_143914 ?auto_143916 ) ) ( not ( = ?auto_143914 ?auto_143917 ) ) ( not ( = ?auto_143914 ?auto_143918 ) ) ( not ( = ?auto_143914 ?auto_143919 ) ) ( not ( = ?auto_143915 ?auto_143916 ) ) ( not ( = ?auto_143915 ?auto_143917 ) ) ( not ( = ?auto_143915 ?auto_143918 ) ) ( not ( = ?auto_143915 ?auto_143919 ) ) ( not ( = ?auto_143916 ?auto_143917 ) ) ( not ( = ?auto_143916 ?auto_143918 ) ) ( not ( = ?auto_143916 ?auto_143919 ) ) ( not ( = ?auto_143917 ?auto_143918 ) ) ( not ( = ?auto_143917 ?auto_143919 ) ) ( not ( = ?auto_143918 ?auto_143919 ) ) ( ON ?auto_143919 ?auto_143920 ) ( CLEAR ?auto_143919 ) ( not ( = ?auto_143913 ?auto_143920 ) ) ( not ( = ?auto_143914 ?auto_143920 ) ) ( not ( = ?auto_143915 ?auto_143920 ) ) ( not ( = ?auto_143916 ?auto_143920 ) ) ( not ( = ?auto_143917 ?auto_143920 ) ) ( not ( = ?auto_143918 ?auto_143920 ) ) ( not ( = ?auto_143919 ?auto_143920 ) ) ( HOLDING ?auto_143918 ) ( CLEAR ?auto_143917 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143913 ?auto_143914 ?auto_143915 ?auto_143916 ?auto_143917 ?auto_143918 )
      ( MAKE-7PILE ?auto_143913 ?auto_143914 ?auto_143915 ?auto_143916 ?auto_143917 ?auto_143918 ?auto_143919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143921 - BLOCK
      ?auto_143922 - BLOCK
      ?auto_143923 - BLOCK
      ?auto_143924 - BLOCK
      ?auto_143925 - BLOCK
      ?auto_143926 - BLOCK
      ?auto_143927 - BLOCK
    )
    :vars
    (
      ?auto_143928 - BLOCK
      ?auto_143929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143921 ) ( ON ?auto_143922 ?auto_143921 ) ( ON ?auto_143923 ?auto_143922 ) ( ON ?auto_143924 ?auto_143923 ) ( ON ?auto_143925 ?auto_143924 ) ( not ( = ?auto_143921 ?auto_143922 ) ) ( not ( = ?auto_143921 ?auto_143923 ) ) ( not ( = ?auto_143921 ?auto_143924 ) ) ( not ( = ?auto_143921 ?auto_143925 ) ) ( not ( = ?auto_143921 ?auto_143926 ) ) ( not ( = ?auto_143921 ?auto_143927 ) ) ( not ( = ?auto_143922 ?auto_143923 ) ) ( not ( = ?auto_143922 ?auto_143924 ) ) ( not ( = ?auto_143922 ?auto_143925 ) ) ( not ( = ?auto_143922 ?auto_143926 ) ) ( not ( = ?auto_143922 ?auto_143927 ) ) ( not ( = ?auto_143923 ?auto_143924 ) ) ( not ( = ?auto_143923 ?auto_143925 ) ) ( not ( = ?auto_143923 ?auto_143926 ) ) ( not ( = ?auto_143923 ?auto_143927 ) ) ( not ( = ?auto_143924 ?auto_143925 ) ) ( not ( = ?auto_143924 ?auto_143926 ) ) ( not ( = ?auto_143924 ?auto_143927 ) ) ( not ( = ?auto_143925 ?auto_143926 ) ) ( not ( = ?auto_143925 ?auto_143927 ) ) ( not ( = ?auto_143926 ?auto_143927 ) ) ( ON ?auto_143927 ?auto_143928 ) ( not ( = ?auto_143921 ?auto_143928 ) ) ( not ( = ?auto_143922 ?auto_143928 ) ) ( not ( = ?auto_143923 ?auto_143928 ) ) ( not ( = ?auto_143924 ?auto_143928 ) ) ( not ( = ?auto_143925 ?auto_143928 ) ) ( not ( = ?auto_143926 ?auto_143928 ) ) ( not ( = ?auto_143927 ?auto_143928 ) ) ( CLEAR ?auto_143925 ) ( ON ?auto_143926 ?auto_143927 ) ( CLEAR ?auto_143926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143929 ) ( ON ?auto_143928 ?auto_143929 ) ( not ( = ?auto_143929 ?auto_143928 ) ) ( not ( = ?auto_143929 ?auto_143927 ) ) ( not ( = ?auto_143929 ?auto_143926 ) ) ( not ( = ?auto_143921 ?auto_143929 ) ) ( not ( = ?auto_143922 ?auto_143929 ) ) ( not ( = ?auto_143923 ?auto_143929 ) ) ( not ( = ?auto_143924 ?auto_143929 ) ) ( not ( = ?auto_143925 ?auto_143929 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143929 ?auto_143928 ?auto_143927 )
      ( MAKE-7PILE ?auto_143921 ?auto_143922 ?auto_143923 ?auto_143924 ?auto_143925 ?auto_143926 ?auto_143927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143930 - BLOCK
      ?auto_143931 - BLOCK
      ?auto_143932 - BLOCK
      ?auto_143933 - BLOCK
      ?auto_143934 - BLOCK
      ?auto_143935 - BLOCK
      ?auto_143936 - BLOCK
    )
    :vars
    (
      ?auto_143938 - BLOCK
      ?auto_143937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143930 ) ( ON ?auto_143931 ?auto_143930 ) ( ON ?auto_143932 ?auto_143931 ) ( ON ?auto_143933 ?auto_143932 ) ( not ( = ?auto_143930 ?auto_143931 ) ) ( not ( = ?auto_143930 ?auto_143932 ) ) ( not ( = ?auto_143930 ?auto_143933 ) ) ( not ( = ?auto_143930 ?auto_143934 ) ) ( not ( = ?auto_143930 ?auto_143935 ) ) ( not ( = ?auto_143930 ?auto_143936 ) ) ( not ( = ?auto_143931 ?auto_143932 ) ) ( not ( = ?auto_143931 ?auto_143933 ) ) ( not ( = ?auto_143931 ?auto_143934 ) ) ( not ( = ?auto_143931 ?auto_143935 ) ) ( not ( = ?auto_143931 ?auto_143936 ) ) ( not ( = ?auto_143932 ?auto_143933 ) ) ( not ( = ?auto_143932 ?auto_143934 ) ) ( not ( = ?auto_143932 ?auto_143935 ) ) ( not ( = ?auto_143932 ?auto_143936 ) ) ( not ( = ?auto_143933 ?auto_143934 ) ) ( not ( = ?auto_143933 ?auto_143935 ) ) ( not ( = ?auto_143933 ?auto_143936 ) ) ( not ( = ?auto_143934 ?auto_143935 ) ) ( not ( = ?auto_143934 ?auto_143936 ) ) ( not ( = ?auto_143935 ?auto_143936 ) ) ( ON ?auto_143936 ?auto_143938 ) ( not ( = ?auto_143930 ?auto_143938 ) ) ( not ( = ?auto_143931 ?auto_143938 ) ) ( not ( = ?auto_143932 ?auto_143938 ) ) ( not ( = ?auto_143933 ?auto_143938 ) ) ( not ( = ?auto_143934 ?auto_143938 ) ) ( not ( = ?auto_143935 ?auto_143938 ) ) ( not ( = ?auto_143936 ?auto_143938 ) ) ( ON ?auto_143935 ?auto_143936 ) ( CLEAR ?auto_143935 ) ( ON-TABLE ?auto_143937 ) ( ON ?auto_143938 ?auto_143937 ) ( not ( = ?auto_143937 ?auto_143938 ) ) ( not ( = ?auto_143937 ?auto_143936 ) ) ( not ( = ?auto_143937 ?auto_143935 ) ) ( not ( = ?auto_143930 ?auto_143937 ) ) ( not ( = ?auto_143931 ?auto_143937 ) ) ( not ( = ?auto_143932 ?auto_143937 ) ) ( not ( = ?auto_143933 ?auto_143937 ) ) ( not ( = ?auto_143934 ?auto_143937 ) ) ( HOLDING ?auto_143934 ) ( CLEAR ?auto_143933 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143930 ?auto_143931 ?auto_143932 ?auto_143933 ?auto_143934 )
      ( MAKE-7PILE ?auto_143930 ?auto_143931 ?auto_143932 ?auto_143933 ?auto_143934 ?auto_143935 ?auto_143936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143939 - BLOCK
      ?auto_143940 - BLOCK
      ?auto_143941 - BLOCK
      ?auto_143942 - BLOCK
      ?auto_143943 - BLOCK
      ?auto_143944 - BLOCK
      ?auto_143945 - BLOCK
    )
    :vars
    (
      ?auto_143946 - BLOCK
      ?auto_143947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143939 ) ( ON ?auto_143940 ?auto_143939 ) ( ON ?auto_143941 ?auto_143940 ) ( ON ?auto_143942 ?auto_143941 ) ( not ( = ?auto_143939 ?auto_143940 ) ) ( not ( = ?auto_143939 ?auto_143941 ) ) ( not ( = ?auto_143939 ?auto_143942 ) ) ( not ( = ?auto_143939 ?auto_143943 ) ) ( not ( = ?auto_143939 ?auto_143944 ) ) ( not ( = ?auto_143939 ?auto_143945 ) ) ( not ( = ?auto_143940 ?auto_143941 ) ) ( not ( = ?auto_143940 ?auto_143942 ) ) ( not ( = ?auto_143940 ?auto_143943 ) ) ( not ( = ?auto_143940 ?auto_143944 ) ) ( not ( = ?auto_143940 ?auto_143945 ) ) ( not ( = ?auto_143941 ?auto_143942 ) ) ( not ( = ?auto_143941 ?auto_143943 ) ) ( not ( = ?auto_143941 ?auto_143944 ) ) ( not ( = ?auto_143941 ?auto_143945 ) ) ( not ( = ?auto_143942 ?auto_143943 ) ) ( not ( = ?auto_143942 ?auto_143944 ) ) ( not ( = ?auto_143942 ?auto_143945 ) ) ( not ( = ?auto_143943 ?auto_143944 ) ) ( not ( = ?auto_143943 ?auto_143945 ) ) ( not ( = ?auto_143944 ?auto_143945 ) ) ( ON ?auto_143945 ?auto_143946 ) ( not ( = ?auto_143939 ?auto_143946 ) ) ( not ( = ?auto_143940 ?auto_143946 ) ) ( not ( = ?auto_143941 ?auto_143946 ) ) ( not ( = ?auto_143942 ?auto_143946 ) ) ( not ( = ?auto_143943 ?auto_143946 ) ) ( not ( = ?auto_143944 ?auto_143946 ) ) ( not ( = ?auto_143945 ?auto_143946 ) ) ( ON ?auto_143944 ?auto_143945 ) ( ON-TABLE ?auto_143947 ) ( ON ?auto_143946 ?auto_143947 ) ( not ( = ?auto_143947 ?auto_143946 ) ) ( not ( = ?auto_143947 ?auto_143945 ) ) ( not ( = ?auto_143947 ?auto_143944 ) ) ( not ( = ?auto_143939 ?auto_143947 ) ) ( not ( = ?auto_143940 ?auto_143947 ) ) ( not ( = ?auto_143941 ?auto_143947 ) ) ( not ( = ?auto_143942 ?auto_143947 ) ) ( not ( = ?auto_143943 ?auto_143947 ) ) ( CLEAR ?auto_143942 ) ( ON ?auto_143943 ?auto_143944 ) ( CLEAR ?auto_143943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143947 ?auto_143946 ?auto_143945 ?auto_143944 )
      ( MAKE-7PILE ?auto_143939 ?auto_143940 ?auto_143941 ?auto_143942 ?auto_143943 ?auto_143944 ?auto_143945 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143948 - BLOCK
      ?auto_143949 - BLOCK
      ?auto_143950 - BLOCK
      ?auto_143951 - BLOCK
      ?auto_143952 - BLOCK
      ?auto_143953 - BLOCK
      ?auto_143954 - BLOCK
    )
    :vars
    (
      ?auto_143955 - BLOCK
      ?auto_143956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143948 ) ( ON ?auto_143949 ?auto_143948 ) ( ON ?auto_143950 ?auto_143949 ) ( not ( = ?auto_143948 ?auto_143949 ) ) ( not ( = ?auto_143948 ?auto_143950 ) ) ( not ( = ?auto_143948 ?auto_143951 ) ) ( not ( = ?auto_143948 ?auto_143952 ) ) ( not ( = ?auto_143948 ?auto_143953 ) ) ( not ( = ?auto_143948 ?auto_143954 ) ) ( not ( = ?auto_143949 ?auto_143950 ) ) ( not ( = ?auto_143949 ?auto_143951 ) ) ( not ( = ?auto_143949 ?auto_143952 ) ) ( not ( = ?auto_143949 ?auto_143953 ) ) ( not ( = ?auto_143949 ?auto_143954 ) ) ( not ( = ?auto_143950 ?auto_143951 ) ) ( not ( = ?auto_143950 ?auto_143952 ) ) ( not ( = ?auto_143950 ?auto_143953 ) ) ( not ( = ?auto_143950 ?auto_143954 ) ) ( not ( = ?auto_143951 ?auto_143952 ) ) ( not ( = ?auto_143951 ?auto_143953 ) ) ( not ( = ?auto_143951 ?auto_143954 ) ) ( not ( = ?auto_143952 ?auto_143953 ) ) ( not ( = ?auto_143952 ?auto_143954 ) ) ( not ( = ?auto_143953 ?auto_143954 ) ) ( ON ?auto_143954 ?auto_143955 ) ( not ( = ?auto_143948 ?auto_143955 ) ) ( not ( = ?auto_143949 ?auto_143955 ) ) ( not ( = ?auto_143950 ?auto_143955 ) ) ( not ( = ?auto_143951 ?auto_143955 ) ) ( not ( = ?auto_143952 ?auto_143955 ) ) ( not ( = ?auto_143953 ?auto_143955 ) ) ( not ( = ?auto_143954 ?auto_143955 ) ) ( ON ?auto_143953 ?auto_143954 ) ( ON-TABLE ?auto_143956 ) ( ON ?auto_143955 ?auto_143956 ) ( not ( = ?auto_143956 ?auto_143955 ) ) ( not ( = ?auto_143956 ?auto_143954 ) ) ( not ( = ?auto_143956 ?auto_143953 ) ) ( not ( = ?auto_143948 ?auto_143956 ) ) ( not ( = ?auto_143949 ?auto_143956 ) ) ( not ( = ?auto_143950 ?auto_143956 ) ) ( not ( = ?auto_143951 ?auto_143956 ) ) ( not ( = ?auto_143952 ?auto_143956 ) ) ( ON ?auto_143952 ?auto_143953 ) ( CLEAR ?auto_143952 ) ( HOLDING ?auto_143951 ) ( CLEAR ?auto_143950 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143948 ?auto_143949 ?auto_143950 ?auto_143951 )
      ( MAKE-7PILE ?auto_143948 ?auto_143949 ?auto_143950 ?auto_143951 ?auto_143952 ?auto_143953 ?auto_143954 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143957 - BLOCK
      ?auto_143958 - BLOCK
      ?auto_143959 - BLOCK
      ?auto_143960 - BLOCK
      ?auto_143961 - BLOCK
      ?auto_143962 - BLOCK
      ?auto_143963 - BLOCK
    )
    :vars
    (
      ?auto_143964 - BLOCK
      ?auto_143965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143957 ) ( ON ?auto_143958 ?auto_143957 ) ( ON ?auto_143959 ?auto_143958 ) ( not ( = ?auto_143957 ?auto_143958 ) ) ( not ( = ?auto_143957 ?auto_143959 ) ) ( not ( = ?auto_143957 ?auto_143960 ) ) ( not ( = ?auto_143957 ?auto_143961 ) ) ( not ( = ?auto_143957 ?auto_143962 ) ) ( not ( = ?auto_143957 ?auto_143963 ) ) ( not ( = ?auto_143958 ?auto_143959 ) ) ( not ( = ?auto_143958 ?auto_143960 ) ) ( not ( = ?auto_143958 ?auto_143961 ) ) ( not ( = ?auto_143958 ?auto_143962 ) ) ( not ( = ?auto_143958 ?auto_143963 ) ) ( not ( = ?auto_143959 ?auto_143960 ) ) ( not ( = ?auto_143959 ?auto_143961 ) ) ( not ( = ?auto_143959 ?auto_143962 ) ) ( not ( = ?auto_143959 ?auto_143963 ) ) ( not ( = ?auto_143960 ?auto_143961 ) ) ( not ( = ?auto_143960 ?auto_143962 ) ) ( not ( = ?auto_143960 ?auto_143963 ) ) ( not ( = ?auto_143961 ?auto_143962 ) ) ( not ( = ?auto_143961 ?auto_143963 ) ) ( not ( = ?auto_143962 ?auto_143963 ) ) ( ON ?auto_143963 ?auto_143964 ) ( not ( = ?auto_143957 ?auto_143964 ) ) ( not ( = ?auto_143958 ?auto_143964 ) ) ( not ( = ?auto_143959 ?auto_143964 ) ) ( not ( = ?auto_143960 ?auto_143964 ) ) ( not ( = ?auto_143961 ?auto_143964 ) ) ( not ( = ?auto_143962 ?auto_143964 ) ) ( not ( = ?auto_143963 ?auto_143964 ) ) ( ON ?auto_143962 ?auto_143963 ) ( ON-TABLE ?auto_143965 ) ( ON ?auto_143964 ?auto_143965 ) ( not ( = ?auto_143965 ?auto_143964 ) ) ( not ( = ?auto_143965 ?auto_143963 ) ) ( not ( = ?auto_143965 ?auto_143962 ) ) ( not ( = ?auto_143957 ?auto_143965 ) ) ( not ( = ?auto_143958 ?auto_143965 ) ) ( not ( = ?auto_143959 ?auto_143965 ) ) ( not ( = ?auto_143960 ?auto_143965 ) ) ( not ( = ?auto_143961 ?auto_143965 ) ) ( ON ?auto_143961 ?auto_143962 ) ( CLEAR ?auto_143959 ) ( ON ?auto_143960 ?auto_143961 ) ( CLEAR ?auto_143960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143965 ?auto_143964 ?auto_143963 ?auto_143962 ?auto_143961 )
      ( MAKE-7PILE ?auto_143957 ?auto_143958 ?auto_143959 ?auto_143960 ?auto_143961 ?auto_143962 ?auto_143963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143966 - BLOCK
      ?auto_143967 - BLOCK
      ?auto_143968 - BLOCK
      ?auto_143969 - BLOCK
      ?auto_143970 - BLOCK
      ?auto_143971 - BLOCK
      ?auto_143972 - BLOCK
    )
    :vars
    (
      ?auto_143973 - BLOCK
      ?auto_143974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143966 ) ( ON ?auto_143967 ?auto_143966 ) ( not ( = ?auto_143966 ?auto_143967 ) ) ( not ( = ?auto_143966 ?auto_143968 ) ) ( not ( = ?auto_143966 ?auto_143969 ) ) ( not ( = ?auto_143966 ?auto_143970 ) ) ( not ( = ?auto_143966 ?auto_143971 ) ) ( not ( = ?auto_143966 ?auto_143972 ) ) ( not ( = ?auto_143967 ?auto_143968 ) ) ( not ( = ?auto_143967 ?auto_143969 ) ) ( not ( = ?auto_143967 ?auto_143970 ) ) ( not ( = ?auto_143967 ?auto_143971 ) ) ( not ( = ?auto_143967 ?auto_143972 ) ) ( not ( = ?auto_143968 ?auto_143969 ) ) ( not ( = ?auto_143968 ?auto_143970 ) ) ( not ( = ?auto_143968 ?auto_143971 ) ) ( not ( = ?auto_143968 ?auto_143972 ) ) ( not ( = ?auto_143969 ?auto_143970 ) ) ( not ( = ?auto_143969 ?auto_143971 ) ) ( not ( = ?auto_143969 ?auto_143972 ) ) ( not ( = ?auto_143970 ?auto_143971 ) ) ( not ( = ?auto_143970 ?auto_143972 ) ) ( not ( = ?auto_143971 ?auto_143972 ) ) ( ON ?auto_143972 ?auto_143973 ) ( not ( = ?auto_143966 ?auto_143973 ) ) ( not ( = ?auto_143967 ?auto_143973 ) ) ( not ( = ?auto_143968 ?auto_143973 ) ) ( not ( = ?auto_143969 ?auto_143973 ) ) ( not ( = ?auto_143970 ?auto_143973 ) ) ( not ( = ?auto_143971 ?auto_143973 ) ) ( not ( = ?auto_143972 ?auto_143973 ) ) ( ON ?auto_143971 ?auto_143972 ) ( ON-TABLE ?auto_143974 ) ( ON ?auto_143973 ?auto_143974 ) ( not ( = ?auto_143974 ?auto_143973 ) ) ( not ( = ?auto_143974 ?auto_143972 ) ) ( not ( = ?auto_143974 ?auto_143971 ) ) ( not ( = ?auto_143966 ?auto_143974 ) ) ( not ( = ?auto_143967 ?auto_143974 ) ) ( not ( = ?auto_143968 ?auto_143974 ) ) ( not ( = ?auto_143969 ?auto_143974 ) ) ( not ( = ?auto_143970 ?auto_143974 ) ) ( ON ?auto_143970 ?auto_143971 ) ( ON ?auto_143969 ?auto_143970 ) ( CLEAR ?auto_143969 ) ( HOLDING ?auto_143968 ) ( CLEAR ?auto_143967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143966 ?auto_143967 ?auto_143968 )
      ( MAKE-7PILE ?auto_143966 ?auto_143967 ?auto_143968 ?auto_143969 ?auto_143970 ?auto_143971 ?auto_143972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143975 - BLOCK
      ?auto_143976 - BLOCK
      ?auto_143977 - BLOCK
      ?auto_143978 - BLOCK
      ?auto_143979 - BLOCK
      ?auto_143980 - BLOCK
      ?auto_143981 - BLOCK
    )
    :vars
    (
      ?auto_143983 - BLOCK
      ?auto_143982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143975 ) ( ON ?auto_143976 ?auto_143975 ) ( not ( = ?auto_143975 ?auto_143976 ) ) ( not ( = ?auto_143975 ?auto_143977 ) ) ( not ( = ?auto_143975 ?auto_143978 ) ) ( not ( = ?auto_143975 ?auto_143979 ) ) ( not ( = ?auto_143975 ?auto_143980 ) ) ( not ( = ?auto_143975 ?auto_143981 ) ) ( not ( = ?auto_143976 ?auto_143977 ) ) ( not ( = ?auto_143976 ?auto_143978 ) ) ( not ( = ?auto_143976 ?auto_143979 ) ) ( not ( = ?auto_143976 ?auto_143980 ) ) ( not ( = ?auto_143976 ?auto_143981 ) ) ( not ( = ?auto_143977 ?auto_143978 ) ) ( not ( = ?auto_143977 ?auto_143979 ) ) ( not ( = ?auto_143977 ?auto_143980 ) ) ( not ( = ?auto_143977 ?auto_143981 ) ) ( not ( = ?auto_143978 ?auto_143979 ) ) ( not ( = ?auto_143978 ?auto_143980 ) ) ( not ( = ?auto_143978 ?auto_143981 ) ) ( not ( = ?auto_143979 ?auto_143980 ) ) ( not ( = ?auto_143979 ?auto_143981 ) ) ( not ( = ?auto_143980 ?auto_143981 ) ) ( ON ?auto_143981 ?auto_143983 ) ( not ( = ?auto_143975 ?auto_143983 ) ) ( not ( = ?auto_143976 ?auto_143983 ) ) ( not ( = ?auto_143977 ?auto_143983 ) ) ( not ( = ?auto_143978 ?auto_143983 ) ) ( not ( = ?auto_143979 ?auto_143983 ) ) ( not ( = ?auto_143980 ?auto_143983 ) ) ( not ( = ?auto_143981 ?auto_143983 ) ) ( ON ?auto_143980 ?auto_143981 ) ( ON-TABLE ?auto_143982 ) ( ON ?auto_143983 ?auto_143982 ) ( not ( = ?auto_143982 ?auto_143983 ) ) ( not ( = ?auto_143982 ?auto_143981 ) ) ( not ( = ?auto_143982 ?auto_143980 ) ) ( not ( = ?auto_143975 ?auto_143982 ) ) ( not ( = ?auto_143976 ?auto_143982 ) ) ( not ( = ?auto_143977 ?auto_143982 ) ) ( not ( = ?auto_143978 ?auto_143982 ) ) ( not ( = ?auto_143979 ?auto_143982 ) ) ( ON ?auto_143979 ?auto_143980 ) ( ON ?auto_143978 ?auto_143979 ) ( CLEAR ?auto_143976 ) ( ON ?auto_143977 ?auto_143978 ) ( CLEAR ?auto_143977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143982 ?auto_143983 ?auto_143981 ?auto_143980 ?auto_143979 ?auto_143978 )
      ( MAKE-7PILE ?auto_143975 ?auto_143976 ?auto_143977 ?auto_143978 ?auto_143979 ?auto_143980 ?auto_143981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143984 - BLOCK
      ?auto_143985 - BLOCK
      ?auto_143986 - BLOCK
      ?auto_143987 - BLOCK
      ?auto_143988 - BLOCK
      ?auto_143989 - BLOCK
      ?auto_143990 - BLOCK
    )
    :vars
    (
      ?auto_143992 - BLOCK
      ?auto_143991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143984 ) ( not ( = ?auto_143984 ?auto_143985 ) ) ( not ( = ?auto_143984 ?auto_143986 ) ) ( not ( = ?auto_143984 ?auto_143987 ) ) ( not ( = ?auto_143984 ?auto_143988 ) ) ( not ( = ?auto_143984 ?auto_143989 ) ) ( not ( = ?auto_143984 ?auto_143990 ) ) ( not ( = ?auto_143985 ?auto_143986 ) ) ( not ( = ?auto_143985 ?auto_143987 ) ) ( not ( = ?auto_143985 ?auto_143988 ) ) ( not ( = ?auto_143985 ?auto_143989 ) ) ( not ( = ?auto_143985 ?auto_143990 ) ) ( not ( = ?auto_143986 ?auto_143987 ) ) ( not ( = ?auto_143986 ?auto_143988 ) ) ( not ( = ?auto_143986 ?auto_143989 ) ) ( not ( = ?auto_143986 ?auto_143990 ) ) ( not ( = ?auto_143987 ?auto_143988 ) ) ( not ( = ?auto_143987 ?auto_143989 ) ) ( not ( = ?auto_143987 ?auto_143990 ) ) ( not ( = ?auto_143988 ?auto_143989 ) ) ( not ( = ?auto_143988 ?auto_143990 ) ) ( not ( = ?auto_143989 ?auto_143990 ) ) ( ON ?auto_143990 ?auto_143992 ) ( not ( = ?auto_143984 ?auto_143992 ) ) ( not ( = ?auto_143985 ?auto_143992 ) ) ( not ( = ?auto_143986 ?auto_143992 ) ) ( not ( = ?auto_143987 ?auto_143992 ) ) ( not ( = ?auto_143988 ?auto_143992 ) ) ( not ( = ?auto_143989 ?auto_143992 ) ) ( not ( = ?auto_143990 ?auto_143992 ) ) ( ON ?auto_143989 ?auto_143990 ) ( ON-TABLE ?auto_143991 ) ( ON ?auto_143992 ?auto_143991 ) ( not ( = ?auto_143991 ?auto_143992 ) ) ( not ( = ?auto_143991 ?auto_143990 ) ) ( not ( = ?auto_143991 ?auto_143989 ) ) ( not ( = ?auto_143984 ?auto_143991 ) ) ( not ( = ?auto_143985 ?auto_143991 ) ) ( not ( = ?auto_143986 ?auto_143991 ) ) ( not ( = ?auto_143987 ?auto_143991 ) ) ( not ( = ?auto_143988 ?auto_143991 ) ) ( ON ?auto_143988 ?auto_143989 ) ( ON ?auto_143987 ?auto_143988 ) ( ON ?auto_143986 ?auto_143987 ) ( CLEAR ?auto_143986 ) ( HOLDING ?auto_143985 ) ( CLEAR ?auto_143984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143984 ?auto_143985 )
      ( MAKE-7PILE ?auto_143984 ?auto_143985 ?auto_143986 ?auto_143987 ?auto_143988 ?auto_143989 ?auto_143990 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_143993 - BLOCK
      ?auto_143994 - BLOCK
      ?auto_143995 - BLOCK
      ?auto_143996 - BLOCK
      ?auto_143997 - BLOCK
      ?auto_143998 - BLOCK
      ?auto_143999 - BLOCK
    )
    :vars
    (
      ?auto_144001 - BLOCK
      ?auto_144000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143993 ) ( not ( = ?auto_143993 ?auto_143994 ) ) ( not ( = ?auto_143993 ?auto_143995 ) ) ( not ( = ?auto_143993 ?auto_143996 ) ) ( not ( = ?auto_143993 ?auto_143997 ) ) ( not ( = ?auto_143993 ?auto_143998 ) ) ( not ( = ?auto_143993 ?auto_143999 ) ) ( not ( = ?auto_143994 ?auto_143995 ) ) ( not ( = ?auto_143994 ?auto_143996 ) ) ( not ( = ?auto_143994 ?auto_143997 ) ) ( not ( = ?auto_143994 ?auto_143998 ) ) ( not ( = ?auto_143994 ?auto_143999 ) ) ( not ( = ?auto_143995 ?auto_143996 ) ) ( not ( = ?auto_143995 ?auto_143997 ) ) ( not ( = ?auto_143995 ?auto_143998 ) ) ( not ( = ?auto_143995 ?auto_143999 ) ) ( not ( = ?auto_143996 ?auto_143997 ) ) ( not ( = ?auto_143996 ?auto_143998 ) ) ( not ( = ?auto_143996 ?auto_143999 ) ) ( not ( = ?auto_143997 ?auto_143998 ) ) ( not ( = ?auto_143997 ?auto_143999 ) ) ( not ( = ?auto_143998 ?auto_143999 ) ) ( ON ?auto_143999 ?auto_144001 ) ( not ( = ?auto_143993 ?auto_144001 ) ) ( not ( = ?auto_143994 ?auto_144001 ) ) ( not ( = ?auto_143995 ?auto_144001 ) ) ( not ( = ?auto_143996 ?auto_144001 ) ) ( not ( = ?auto_143997 ?auto_144001 ) ) ( not ( = ?auto_143998 ?auto_144001 ) ) ( not ( = ?auto_143999 ?auto_144001 ) ) ( ON ?auto_143998 ?auto_143999 ) ( ON-TABLE ?auto_144000 ) ( ON ?auto_144001 ?auto_144000 ) ( not ( = ?auto_144000 ?auto_144001 ) ) ( not ( = ?auto_144000 ?auto_143999 ) ) ( not ( = ?auto_144000 ?auto_143998 ) ) ( not ( = ?auto_143993 ?auto_144000 ) ) ( not ( = ?auto_143994 ?auto_144000 ) ) ( not ( = ?auto_143995 ?auto_144000 ) ) ( not ( = ?auto_143996 ?auto_144000 ) ) ( not ( = ?auto_143997 ?auto_144000 ) ) ( ON ?auto_143997 ?auto_143998 ) ( ON ?auto_143996 ?auto_143997 ) ( ON ?auto_143995 ?auto_143996 ) ( CLEAR ?auto_143993 ) ( ON ?auto_143994 ?auto_143995 ) ( CLEAR ?auto_143994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144000 ?auto_144001 ?auto_143999 ?auto_143998 ?auto_143997 ?auto_143996 ?auto_143995 )
      ( MAKE-7PILE ?auto_143993 ?auto_143994 ?auto_143995 ?auto_143996 ?auto_143997 ?auto_143998 ?auto_143999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144002 - BLOCK
      ?auto_144003 - BLOCK
      ?auto_144004 - BLOCK
      ?auto_144005 - BLOCK
      ?auto_144006 - BLOCK
      ?auto_144007 - BLOCK
      ?auto_144008 - BLOCK
    )
    :vars
    (
      ?auto_144010 - BLOCK
      ?auto_144009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144002 ?auto_144003 ) ) ( not ( = ?auto_144002 ?auto_144004 ) ) ( not ( = ?auto_144002 ?auto_144005 ) ) ( not ( = ?auto_144002 ?auto_144006 ) ) ( not ( = ?auto_144002 ?auto_144007 ) ) ( not ( = ?auto_144002 ?auto_144008 ) ) ( not ( = ?auto_144003 ?auto_144004 ) ) ( not ( = ?auto_144003 ?auto_144005 ) ) ( not ( = ?auto_144003 ?auto_144006 ) ) ( not ( = ?auto_144003 ?auto_144007 ) ) ( not ( = ?auto_144003 ?auto_144008 ) ) ( not ( = ?auto_144004 ?auto_144005 ) ) ( not ( = ?auto_144004 ?auto_144006 ) ) ( not ( = ?auto_144004 ?auto_144007 ) ) ( not ( = ?auto_144004 ?auto_144008 ) ) ( not ( = ?auto_144005 ?auto_144006 ) ) ( not ( = ?auto_144005 ?auto_144007 ) ) ( not ( = ?auto_144005 ?auto_144008 ) ) ( not ( = ?auto_144006 ?auto_144007 ) ) ( not ( = ?auto_144006 ?auto_144008 ) ) ( not ( = ?auto_144007 ?auto_144008 ) ) ( ON ?auto_144008 ?auto_144010 ) ( not ( = ?auto_144002 ?auto_144010 ) ) ( not ( = ?auto_144003 ?auto_144010 ) ) ( not ( = ?auto_144004 ?auto_144010 ) ) ( not ( = ?auto_144005 ?auto_144010 ) ) ( not ( = ?auto_144006 ?auto_144010 ) ) ( not ( = ?auto_144007 ?auto_144010 ) ) ( not ( = ?auto_144008 ?auto_144010 ) ) ( ON ?auto_144007 ?auto_144008 ) ( ON-TABLE ?auto_144009 ) ( ON ?auto_144010 ?auto_144009 ) ( not ( = ?auto_144009 ?auto_144010 ) ) ( not ( = ?auto_144009 ?auto_144008 ) ) ( not ( = ?auto_144009 ?auto_144007 ) ) ( not ( = ?auto_144002 ?auto_144009 ) ) ( not ( = ?auto_144003 ?auto_144009 ) ) ( not ( = ?auto_144004 ?auto_144009 ) ) ( not ( = ?auto_144005 ?auto_144009 ) ) ( not ( = ?auto_144006 ?auto_144009 ) ) ( ON ?auto_144006 ?auto_144007 ) ( ON ?auto_144005 ?auto_144006 ) ( ON ?auto_144004 ?auto_144005 ) ( ON ?auto_144003 ?auto_144004 ) ( CLEAR ?auto_144003 ) ( HOLDING ?auto_144002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144002 )
      ( MAKE-7PILE ?auto_144002 ?auto_144003 ?auto_144004 ?auto_144005 ?auto_144006 ?auto_144007 ?auto_144008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144011 - BLOCK
      ?auto_144012 - BLOCK
      ?auto_144013 - BLOCK
      ?auto_144014 - BLOCK
      ?auto_144015 - BLOCK
      ?auto_144016 - BLOCK
      ?auto_144017 - BLOCK
    )
    :vars
    (
      ?auto_144018 - BLOCK
      ?auto_144019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144011 ?auto_144012 ) ) ( not ( = ?auto_144011 ?auto_144013 ) ) ( not ( = ?auto_144011 ?auto_144014 ) ) ( not ( = ?auto_144011 ?auto_144015 ) ) ( not ( = ?auto_144011 ?auto_144016 ) ) ( not ( = ?auto_144011 ?auto_144017 ) ) ( not ( = ?auto_144012 ?auto_144013 ) ) ( not ( = ?auto_144012 ?auto_144014 ) ) ( not ( = ?auto_144012 ?auto_144015 ) ) ( not ( = ?auto_144012 ?auto_144016 ) ) ( not ( = ?auto_144012 ?auto_144017 ) ) ( not ( = ?auto_144013 ?auto_144014 ) ) ( not ( = ?auto_144013 ?auto_144015 ) ) ( not ( = ?auto_144013 ?auto_144016 ) ) ( not ( = ?auto_144013 ?auto_144017 ) ) ( not ( = ?auto_144014 ?auto_144015 ) ) ( not ( = ?auto_144014 ?auto_144016 ) ) ( not ( = ?auto_144014 ?auto_144017 ) ) ( not ( = ?auto_144015 ?auto_144016 ) ) ( not ( = ?auto_144015 ?auto_144017 ) ) ( not ( = ?auto_144016 ?auto_144017 ) ) ( ON ?auto_144017 ?auto_144018 ) ( not ( = ?auto_144011 ?auto_144018 ) ) ( not ( = ?auto_144012 ?auto_144018 ) ) ( not ( = ?auto_144013 ?auto_144018 ) ) ( not ( = ?auto_144014 ?auto_144018 ) ) ( not ( = ?auto_144015 ?auto_144018 ) ) ( not ( = ?auto_144016 ?auto_144018 ) ) ( not ( = ?auto_144017 ?auto_144018 ) ) ( ON ?auto_144016 ?auto_144017 ) ( ON-TABLE ?auto_144019 ) ( ON ?auto_144018 ?auto_144019 ) ( not ( = ?auto_144019 ?auto_144018 ) ) ( not ( = ?auto_144019 ?auto_144017 ) ) ( not ( = ?auto_144019 ?auto_144016 ) ) ( not ( = ?auto_144011 ?auto_144019 ) ) ( not ( = ?auto_144012 ?auto_144019 ) ) ( not ( = ?auto_144013 ?auto_144019 ) ) ( not ( = ?auto_144014 ?auto_144019 ) ) ( not ( = ?auto_144015 ?auto_144019 ) ) ( ON ?auto_144015 ?auto_144016 ) ( ON ?auto_144014 ?auto_144015 ) ( ON ?auto_144013 ?auto_144014 ) ( ON ?auto_144012 ?auto_144013 ) ( ON ?auto_144011 ?auto_144012 ) ( CLEAR ?auto_144011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144019 ?auto_144018 ?auto_144017 ?auto_144016 ?auto_144015 ?auto_144014 ?auto_144013 ?auto_144012 )
      ( MAKE-7PILE ?auto_144011 ?auto_144012 ?auto_144013 ?auto_144014 ?auto_144015 ?auto_144016 ?auto_144017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144021 - BLOCK
    )
    :vars
    (
      ?auto_144022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144022 ?auto_144021 ) ( CLEAR ?auto_144022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144021 ) ( not ( = ?auto_144021 ?auto_144022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144022 ?auto_144021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144023 - BLOCK
    )
    :vars
    (
      ?auto_144024 - BLOCK
      ?auto_144025 - BLOCK
      ?auto_144026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144024 ?auto_144023 ) ( CLEAR ?auto_144024 ) ( ON-TABLE ?auto_144023 ) ( not ( = ?auto_144023 ?auto_144024 ) ) ( HOLDING ?auto_144025 ) ( CLEAR ?auto_144026 ) ( not ( = ?auto_144023 ?auto_144025 ) ) ( not ( = ?auto_144023 ?auto_144026 ) ) ( not ( = ?auto_144024 ?auto_144025 ) ) ( not ( = ?auto_144024 ?auto_144026 ) ) ( not ( = ?auto_144025 ?auto_144026 ) ) )
    :subtasks
    ( ( !STACK ?auto_144025 ?auto_144026 )
      ( MAKE-1PILE ?auto_144023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144027 - BLOCK
    )
    :vars
    (
      ?auto_144030 - BLOCK
      ?auto_144029 - BLOCK
      ?auto_144028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144030 ?auto_144027 ) ( ON-TABLE ?auto_144027 ) ( not ( = ?auto_144027 ?auto_144030 ) ) ( CLEAR ?auto_144029 ) ( not ( = ?auto_144027 ?auto_144028 ) ) ( not ( = ?auto_144027 ?auto_144029 ) ) ( not ( = ?auto_144030 ?auto_144028 ) ) ( not ( = ?auto_144030 ?auto_144029 ) ) ( not ( = ?auto_144028 ?auto_144029 ) ) ( ON ?auto_144028 ?auto_144030 ) ( CLEAR ?auto_144028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144027 ?auto_144030 )
      ( MAKE-1PILE ?auto_144027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144031 - BLOCK
    )
    :vars
    (
      ?auto_144034 - BLOCK
      ?auto_144033 - BLOCK
      ?auto_144032 - BLOCK
      ?auto_144038 - BLOCK
      ?auto_144037 - BLOCK
      ?auto_144039 - BLOCK
      ?auto_144036 - BLOCK
      ?auto_144035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144034 ?auto_144031 ) ( ON-TABLE ?auto_144031 ) ( not ( = ?auto_144031 ?auto_144034 ) ) ( not ( = ?auto_144031 ?auto_144033 ) ) ( not ( = ?auto_144031 ?auto_144032 ) ) ( not ( = ?auto_144034 ?auto_144033 ) ) ( not ( = ?auto_144034 ?auto_144032 ) ) ( not ( = ?auto_144033 ?auto_144032 ) ) ( ON ?auto_144033 ?auto_144034 ) ( CLEAR ?auto_144033 ) ( HOLDING ?auto_144032 ) ( CLEAR ?auto_144038 ) ( ON-TABLE ?auto_144037 ) ( ON ?auto_144039 ?auto_144037 ) ( ON ?auto_144036 ?auto_144039 ) ( ON ?auto_144035 ?auto_144036 ) ( ON ?auto_144038 ?auto_144035 ) ( not ( = ?auto_144037 ?auto_144039 ) ) ( not ( = ?auto_144037 ?auto_144036 ) ) ( not ( = ?auto_144037 ?auto_144035 ) ) ( not ( = ?auto_144037 ?auto_144038 ) ) ( not ( = ?auto_144037 ?auto_144032 ) ) ( not ( = ?auto_144039 ?auto_144036 ) ) ( not ( = ?auto_144039 ?auto_144035 ) ) ( not ( = ?auto_144039 ?auto_144038 ) ) ( not ( = ?auto_144039 ?auto_144032 ) ) ( not ( = ?auto_144036 ?auto_144035 ) ) ( not ( = ?auto_144036 ?auto_144038 ) ) ( not ( = ?auto_144036 ?auto_144032 ) ) ( not ( = ?auto_144035 ?auto_144038 ) ) ( not ( = ?auto_144035 ?auto_144032 ) ) ( not ( = ?auto_144038 ?auto_144032 ) ) ( not ( = ?auto_144031 ?auto_144038 ) ) ( not ( = ?auto_144031 ?auto_144037 ) ) ( not ( = ?auto_144031 ?auto_144039 ) ) ( not ( = ?auto_144031 ?auto_144036 ) ) ( not ( = ?auto_144031 ?auto_144035 ) ) ( not ( = ?auto_144034 ?auto_144038 ) ) ( not ( = ?auto_144034 ?auto_144037 ) ) ( not ( = ?auto_144034 ?auto_144039 ) ) ( not ( = ?auto_144034 ?auto_144036 ) ) ( not ( = ?auto_144034 ?auto_144035 ) ) ( not ( = ?auto_144033 ?auto_144038 ) ) ( not ( = ?auto_144033 ?auto_144037 ) ) ( not ( = ?auto_144033 ?auto_144039 ) ) ( not ( = ?auto_144033 ?auto_144036 ) ) ( not ( = ?auto_144033 ?auto_144035 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144037 ?auto_144039 ?auto_144036 ?auto_144035 ?auto_144038 ?auto_144032 )
      ( MAKE-1PILE ?auto_144031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144040 - BLOCK
    )
    :vars
    (
      ?auto_144043 - BLOCK
      ?auto_144044 - BLOCK
      ?auto_144048 - BLOCK
      ?auto_144046 - BLOCK
      ?auto_144042 - BLOCK
      ?auto_144045 - BLOCK
      ?auto_144047 - BLOCK
      ?auto_144041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144043 ?auto_144040 ) ( ON-TABLE ?auto_144040 ) ( not ( = ?auto_144040 ?auto_144043 ) ) ( not ( = ?auto_144040 ?auto_144044 ) ) ( not ( = ?auto_144040 ?auto_144048 ) ) ( not ( = ?auto_144043 ?auto_144044 ) ) ( not ( = ?auto_144043 ?auto_144048 ) ) ( not ( = ?auto_144044 ?auto_144048 ) ) ( ON ?auto_144044 ?auto_144043 ) ( CLEAR ?auto_144046 ) ( ON-TABLE ?auto_144042 ) ( ON ?auto_144045 ?auto_144042 ) ( ON ?auto_144047 ?auto_144045 ) ( ON ?auto_144041 ?auto_144047 ) ( ON ?auto_144046 ?auto_144041 ) ( not ( = ?auto_144042 ?auto_144045 ) ) ( not ( = ?auto_144042 ?auto_144047 ) ) ( not ( = ?auto_144042 ?auto_144041 ) ) ( not ( = ?auto_144042 ?auto_144046 ) ) ( not ( = ?auto_144042 ?auto_144048 ) ) ( not ( = ?auto_144045 ?auto_144047 ) ) ( not ( = ?auto_144045 ?auto_144041 ) ) ( not ( = ?auto_144045 ?auto_144046 ) ) ( not ( = ?auto_144045 ?auto_144048 ) ) ( not ( = ?auto_144047 ?auto_144041 ) ) ( not ( = ?auto_144047 ?auto_144046 ) ) ( not ( = ?auto_144047 ?auto_144048 ) ) ( not ( = ?auto_144041 ?auto_144046 ) ) ( not ( = ?auto_144041 ?auto_144048 ) ) ( not ( = ?auto_144046 ?auto_144048 ) ) ( not ( = ?auto_144040 ?auto_144046 ) ) ( not ( = ?auto_144040 ?auto_144042 ) ) ( not ( = ?auto_144040 ?auto_144045 ) ) ( not ( = ?auto_144040 ?auto_144047 ) ) ( not ( = ?auto_144040 ?auto_144041 ) ) ( not ( = ?auto_144043 ?auto_144046 ) ) ( not ( = ?auto_144043 ?auto_144042 ) ) ( not ( = ?auto_144043 ?auto_144045 ) ) ( not ( = ?auto_144043 ?auto_144047 ) ) ( not ( = ?auto_144043 ?auto_144041 ) ) ( not ( = ?auto_144044 ?auto_144046 ) ) ( not ( = ?auto_144044 ?auto_144042 ) ) ( not ( = ?auto_144044 ?auto_144045 ) ) ( not ( = ?auto_144044 ?auto_144047 ) ) ( not ( = ?auto_144044 ?auto_144041 ) ) ( ON ?auto_144048 ?auto_144044 ) ( CLEAR ?auto_144048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144040 ?auto_144043 ?auto_144044 )
      ( MAKE-1PILE ?auto_144040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144049 - BLOCK
    )
    :vars
    (
      ?auto_144050 - BLOCK
      ?auto_144057 - BLOCK
      ?auto_144051 - BLOCK
      ?auto_144056 - BLOCK
      ?auto_144054 - BLOCK
      ?auto_144055 - BLOCK
      ?auto_144052 - BLOCK
      ?auto_144053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144050 ?auto_144049 ) ( ON-TABLE ?auto_144049 ) ( not ( = ?auto_144049 ?auto_144050 ) ) ( not ( = ?auto_144049 ?auto_144057 ) ) ( not ( = ?auto_144049 ?auto_144051 ) ) ( not ( = ?auto_144050 ?auto_144057 ) ) ( not ( = ?auto_144050 ?auto_144051 ) ) ( not ( = ?auto_144057 ?auto_144051 ) ) ( ON ?auto_144057 ?auto_144050 ) ( ON-TABLE ?auto_144056 ) ( ON ?auto_144054 ?auto_144056 ) ( ON ?auto_144055 ?auto_144054 ) ( ON ?auto_144052 ?auto_144055 ) ( not ( = ?auto_144056 ?auto_144054 ) ) ( not ( = ?auto_144056 ?auto_144055 ) ) ( not ( = ?auto_144056 ?auto_144052 ) ) ( not ( = ?auto_144056 ?auto_144053 ) ) ( not ( = ?auto_144056 ?auto_144051 ) ) ( not ( = ?auto_144054 ?auto_144055 ) ) ( not ( = ?auto_144054 ?auto_144052 ) ) ( not ( = ?auto_144054 ?auto_144053 ) ) ( not ( = ?auto_144054 ?auto_144051 ) ) ( not ( = ?auto_144055 ?auto_144052 ) ) ( not ( = ?auto_144055 ?auto_144053 ) ) ( not ( = ?auto_144055 ?auto_144051 ) ) ( not ( = ?auto_144052 ?auto_144053 ) ) ( not ( = ?auto_144052 ?auto_144051 ) ) ( not ( = ?auto_144053 ?auto_144051 ) ) ( not ( = ?auto_144049 ?auto_144053 ) ) ( not ( = ?auto_144049 ?auto_144056 ) ) ( not ( = ?auto_144049 ?auto_144054 ) ) ( not ( = ?auto_144049 ?auto_144055 ) ) ( not ( = ?auto_144049 ?auto_144052 ) ) ( not ( = ?auto_144050 ?auto_144053 ) ) ( not ( = ?auto_144050 ?auto_144056 ) ) ( not ( = ?auto_144050 ?auto_144054 ) ) ( not ( = ?auto_144050 ?auto_144055 ) ) ( not ( = ?auto_144050 ?auto_144052 ) ) ( not ( = ?auto_144057 ?auto_144053 ) ) ( not ( = ?auto_144057 ?auto_144056 ) ) ( not ( = ?auto_144057 ?auto_144054 ) ) ( not ( = ?auto_144057 ?auto_144055 ) ) ( not ( = ?auto_144057 ?auto_144052 ) ) ( ON ?auto_144051 ?auto_144057 ) ( CLEAR ?auto_144051 ) ( HOLDING ?auto_144053 ) ( CLEAR ?auto_144052 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144056 ?auto_144054 ?auto_144055 ?auto_144052 ?auto_144053 )
      ( MAKE-1PILE ?auto_144049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144058 - BLOCK
    )
    :vars
    (
      ?auto_144065 - BLOCK
      ?auto_144061 - BLOCK
      ?auto_144059 - BLOCK
      ?auto_144062 - BLOCK
      ?auto_144060 - BLOCK
      ?auto_144066 - BLOCK
      ?auto_144064 - BLOCK
      ?auto_144063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144065 ?auto_144058 ) ( ON-TABLE ?auto_144058 ) ( not ( = ?auto_144058 ?auto_144065 ) ) ( not ( = ?auto_144058 ?auto_144061 ) ) ( not ( = ?auto_144058 ?auto_144059 ) ) ( not ( = ?auto_144065 ?auto_144061 ) ) ( not ( = ?auto_144065 ?auto_144059 ) ) ( not ( = ?auto_144061 ?auto_144059 ) ) ( ON ?auto_144061 ?auto_144065 ) ( ON-TABLE ?auto_144062 ) ( ON ?auto_144060 ?auto_144062 ) ( ON ?auto_144066 ?auto_144060 ) ( ON ?auto_144064 ?auto_144066 ) ( not ( = ?auto_144062 ?auto_144060 ) ) ( not ( = ?auto_144062 ?auto_144066 ) ) ( not ( = ?auto_144062 ?auto_144064 ) ) ( not ( = ?auto_144062 ?auto_144063 ) ) ( not ( = ?auto_144062 ?auto_144059 ) ) ( not ( = ?auto_144060 ?auto_144066 ) ) ( not ( = ?auto_144060 ?auto_144064 ) ) ( not ( = ?auto_144060 ?auto_144063 ) ) ( not ( = ?auto_144060 ?auto_144059 ) ) ( not ( = ?auto_144066 ?auto_144064 ) ) ( not ( = ?auto_144066 ?auto_144063 ) ) ( not ( = ?auto_144066 ?auto_144059 ) ) ( not ( = ?auto_144064 ?auto_144063 ) ) ( not ( = ?auto_144064 ?auto_144059 ) ) ( not ( = ?auto_144063 ?auto_144059 ) ) ( not ( = ?auto_144058 ?auto_144063 ) ) ( not ( = ?auto_144058 ?auto_144062 ) ) ( not ( = ?auto_144058 ?auto_144060 ) ) ( not ( = ?auto_144058 ?auto_144066 ) ) ( not ( = ?auto_144058 ?auto_144064 ) ) ( not ( = ?auto_144065 ?auto_144063 ) ) ( not ( = ?auto_144065 ?auto_144062 ) ) ( not ( = ?auto_144065 ?auto_144060 ) ) ( not ( = ?auto_144065 ?auto_144066 ) ) ( not ( = ?auto_144065 ?auto_144064 ) ) ( not ( = ?auto_144061 ?auto_144063 ) ) ( not ( = ?auto_144061 ?auto_144062 ) ) ( not ( = ?auto_144061 ?auto_144060 ) ) ( not ( = ?auto_144061 ?auto_144066 ) ) ( not ( = ?auto_144061 ?auto_144064 ) ) ( ON ?auto_144059 ?auto_144061 ) ( CLEAR ?auto_144064 ) ( ON ?auto_144063 ?auto_144059 ) ( CLEAR ?auto_144063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144058 ?auto_144065 ?auto_144061 ?auto_144059 )
      ( MAKE-1PILE ?auto_144058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144067 - BLOCK
    )
    :vars
    (
      ?auto_144069 - BLOCK
      ?auto_144073 - BLOCK
      ?auto_144072 - BLOCK
      ?auto_144070 - BLOCK
      ?auto_144074 - BLOCK
      ?auto_144068 - BLOCK
      ?auto_144075 - BLOCK
      ?auto_144071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144069 ?auto_144067 ) ( ON-TABLE ?auto_144067 ) ( not ( = ?auto_144067 ?auto_144069 ) ) ( not ( = ?auto_144067 ?auto_144073 ) ) ( not ( = ?auto_144067 ?auto_144072 ) ) ( not ( = ?auto_144069 ?auto_144073 ) ) ( not ( = ?auto_144069 ?auto_144072 ) ) ( not ( = ?auto_144073 ?auto_144072 ) ) ( ON ?auto_144073 ?auto_144069 ) ( ON-TABLE ?auto_144070 ) ( ON ?auto_144074 ?auto_144070 ) ( ON ?auto_144068 ?auto_144074 ) ( not ( = ?auto_144070 ?auto_144074 ) ) ( not ( = ?auto_144070 ?auto_144068 ) ) ( not ( = ?auto_144070 ?auto_144075 ) ) ( not ( = ?auto_144070 ?auto_144071 ) ) ( not ( = ?auto_144070 ?auto_144072 ) ) ( not ( = ?auto_144074 ?auto_144068 ) ) ( not ( = ?auto_144074 ?auto_144075 ) ) ( not ( = ?auto_144074 ?auto_144071 ) ) ( not ( = ?auto_144074 ?auto_144072 ) ) ( not ( = ?auto_144068 ?auto_144075 ) ) ( not ( = ?auto_144068 ?auto_144071 ) ) ( not ( = ?auto_144068 ?auto_144072 ) ) ( not ( = ?auto_144075 ?auto_144071 ) ) ( not ( = ?auto_144075 ?auto_144072 ) ) ( not ( = ?auto_144071 ?auto_144072 ) ) ( not ( = ?auto_144067 ?auto_144071 ) ) ( not ( = ?auto_144067 ?auto_144070 ) ) ( not ( = ?auto_144067 ?auto_144074 ) ) ( not ( = ?auto_144067 ?auto_144068 ) ) ( not ( = ?auto_144067 ?auto_144075 ) ) ( not ( = ?auto_144069 ?auto_144071 ) ) ( not ( = ?auto_144069 ?auto_144070 ) ) ( not ( = ?auto_144069 ?auto_144074 ) ) ( not ( = ?auto_144069 ?auto_144068 ) ) ( not ( = ?auto_144069 ?auto_144075 ) ) ( not ( = ?auto_144073 ?auto_144071 ) ) ( not ( = ?auto_144073 ?auto_144070 ) ) ( not ( = ?auto_144073 ?auto_144074 ) ) ( not ( = ?auto_144073 ?auto_144068 ) ) ( not ( = ?auto_144073 ?auto_144075 ) ) ( ON ?auto_144072 ?auto_144073 ) ( ON ?auto_144071 ?auto_144072 ) ( CLEAR ?auto_144071 ) ( HOLDING ?auto_144075 ) ( CLEAR ?auto_144068 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144070 ?auto_144074 ?auto_144068 ?auto_144075 )
      ( MAKE-1PILE ?auto_144067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144076 - BLOCK
    )
    :vars
    (
      ?auto_144079 - BLOCK
      ?auto_144080 - BLOCK
      ?auto_144077 - BLOCK
      ?auto_144078 - BLOCK
      ?auto_144082 - BLOCK
      ?auto_144084 - BLOCK
      ?auto_144083 - BLOCK
      ?auto_144081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144079 ?auto_144076 ) ( ON-TABLE ?auto_144076 ) ( not ( = ?auto_144076 ?auto_144079 ) ) ( not ( = ?auto_144076 ?auto_144080 ) ) ( not ( = ?auto_144076 ?auto_144077 ) ) ( not ( = ?auto_144079 ?auto_144080 ) ) ( not ( = ?auto_144079 ?auto_144077 ) ) ( not ( = ?auto_144080 ?auto_144077 ) ) ( ON ?auto_144080 ?auto_144079 ) ( ON-TABLE ?auto_144078 ) ( ON ?auto_144082 ?auto_144078 ) ( ON ?auto_144084 ?auto_144082 ) ( not ( = ?auto_144078 ?auto_144082 ) ) ( not ( = ?auto_144078 ?auto_144084 ) ) ( not ( = ?auto_144078 ?auto_144083 ) ) ( not ( = ?auto_144078 ?auto_144081 ) ) ( not ( = ?auto_144078 ?auto_144077 ) ) ( not ( = ?auto_144082 ?auto_144084 ) ) ( not ( = ?auto_144082 ?auto_144083 ) ) ( not ( = ?auto_144082 ?auto_144081 ) ) ( not ( = ?auto_144082 ?auto_144077 ) ) ( not ( = ?auto_144084 ?auto_144083 ) ) ( not ( = ?auto_144084 ?auto_144081 ) ) ( not ( = ?auto_144084 ?auto_144077 ) ) ( not ( = ?auto_144083 ?auto_144081 ) ) ( not ( = ?auto_144083 ?auto_144077 ) ) ( not ( = ?auto_144081 ?auto_144077 ) ) ( not ( = ?auto_144076 ?auto_144081 ) ) ( not ( = ?auto_144076 ?auto_144078 ) ) ( not ( = ?auto_144076 ?auto_144082 ) ) ( not ( = ?auto_144076 ?auto_144084 ) ) ( not ( = ?auto_144076 ?auto_144083 ) ) ( not ( = ?auto_144079 ?auto_144081 ) ) ( not ( = ?auto_144079 ?auto_144078 ) ) ( not ( = ?auto_144079 ?auto_144082 ) ) ( not ( = ?auto_144079 ?auto_144084 ) ) ( not ( = ?auto_144079 ?auto_144083 ) ) ( not ( = ?auto_144080 ?auto_144081 ) ) ( not ( = ?auto_144080 ?auto_144078 ) ) ( not ( = ?auto_144080 ?auto_144082 ) ) ( not ( = ?auto_144080 ?auto_144084 ) ) ( not ( = ?auto_144080 ?auto_144083 ) ) ( ON ?auto_144077 ?auto_144080 ) ( ON ?auto_144081 ?auto_144077 ) ( CLEAR ?auto_144084 ) ( ON ?auto_144083 ?auto_144081 ) ( CLEAR ?auto_144083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144076 ?auto_144079 ?auto_144080 ?auto_144077 ?auto_144081 )
      ( MAKE-1PILE ?auto_144076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144085 - BLOCK
    )
    :vars
    (
      ?auto_144093 - BLOCK
      ?auto_144089 - BLOCK
      ?auto_144090 - BLOCK
      ?auto_144086 - BLOCK
      ?auto_144092 - BLOCK
      ?auto_144088 - BLOCK
      ?auto_144091 - BLOCK
      ?auto_144087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144093 ?auto_144085 ) ( ON-TABLE ?auto_144085 ) ( not ( = ?auto_144085 ?auto_144093 ) ) ( not ( = ?auto_144085 ?auto_144089 ) ) ( not ( = ?auto_144085 ?auto_144090 ) ) ( not ( = ?auto_144093 ?auto_144089 ) ) ( not ( = ?auto_144093 ?auto_144090 ) ) ( not ( = ?auto_144089 ?auto_144090 ) ) ( ON ?auto_144089 ?auto_144093 ) ( ON-TABLE ?auto_144086 ) ( ON ?auto_144092 ?auto_144086 ) ( not ( = ?auto_144086 ?auto_144092 ) ) ( not ( = ?auto_144086 ?auto_144088 ) ) ( not ( = ?auto_144086 ?auto_144091 ) ) ( not ( = ?auto_144086 ?auto_144087 ) ) ( not ( = ?auto_144086 ?auto_144090 ) ) ( not ( = ?auto_144092 ?auto_144088 ) ) ( not ( = ?auto_144092 ?auto_144091 ) ) ( not ( = ?auto_144092 ?auto_144087 ) ) ( not ( = ?auto_144092 ?auto_144090 ) ) ( not ( = ?auto_144088 ?auto_144091 ) ) ( not ( = ?auto_144088 ?auto_144087 ) ) ( not ( = ?auto_144088 ?auto_144090 ) ) ( not ( = ?auto_144091 ?auto_144087 ) ) ( not ( = ?auto_144091 ?auto_144090 ) ) ( not ( = ?auto_144087 ?auto_144090 ) ) ( not ( = ?auto_144085 ?auto_144087 ) ) ( not ( = ?auto_144085 ?auto_144086 ) ) ( not ( = ?auto_144085 ?auto_144092 ) ) ( not ( = ?auto_144085 ?auto_144088 ) ) ( not ( = ?auto_144085 ?auto_144091 ) ) ( not ( = ?auto_144093 ?auto_144087 ) ) ( not ( = ?auto_144093 ?auto_144086 ) ) ( not ( = ?auto_144093 ?auto_144092 ) ) ( not ( = ?auto_144093 ?auto_144088 ) ) ( not ( = ?auto_144093 ?auto_144091 ) ) ( not ( = ?auto_144089 ?auto_144087 ) ) ( not ( = ?auto_144089 ?auto_144086 ) ) ( not ( = ?auto_144089 ?auto_144092 ) ) ( not ( = ?auto_144089 ?auto_144088 ) ) ( not ( = ?auto_144089 ?auto_144091 ) ) ( ON ?auto_144090 ?auto_144089 ) ( ON ?auto_144087 ?auto_144090 ) ( ON ?auto_144091 ?auto_144087 ) ( CLEAR ?auto_144091 ) ( HOLDING ?auto_144088 ) ( CLEAR ?auto_144092 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144086 ?auto_144092 ?auto_144088 )
      ( MAKE-1PILE ?auto_144085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144094 - BLOCK
    )
    :vars
    (
      ?auto_144100 - BLOCK
      ?auto_144099 - BLOCK
      ?auto_144101 - BLOCK
      ?auto_144102 - BLOCK
      ?auto_144096 - BLOCK
      ?auto_144098 - BLOCK
      ?auto_144097 - BLOCK
      ?auto_144095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144100 ?auto_144094 ) ( ON-TABLE ?auto_144094 ) ( not ( = ?auto_144094 ?auto_144100 ) ) ( not ( = ?auto_144094 ?auto_144099 ) ) ( not ( = ?auto_144094 ?auto_144101 ) ) ( not ( = ?auto_144100 ?auto_144099 ) ) ( not ( = ?auto_144100 ?auto_144101 ) ) ( not ( = ?auto_144099 ?auto_144101 ) ) ( ON ?auto_144099 ?auto_144100 ) ( ON-TABLE ?auto_144102 ) ( ON ?auto_144096 ?auto_144102 ) ( not ( = ?auto_144102 ?auto_144096 ) ) ( not ( = ?auto_144102 ?auto_144098 ) ) ( not ( = ?auto_144102 ?auto_144097 ) ) ( not ( = ?auto_144102 ?auto_144095 ) ) ( not ( = ?auto_144102 ?auto_144101 ) ) ( not ( = ?auto_144096 ?auto_144098 ) ) ( not ( = ?auto_144096 ?auto_144097 ) ) ( not ( = ?auto_144096 ?auto_144095 ) ) ( not ( = ?auto_144096 ?auto_144101 ) ) ( not ( = ?auto_144098 ?auto_144097 ) ) ( not ( = ?auto_144098 ?auto_144095 ) ) ( not ( = ?auto_144098 ?auto_144101 ) ) ( not ( = ?auto_144097 ?auto_144095 ) ) ( not ( = ?auto_144097 ?auto_144101 ) ) ( not ( = ?auto_144095 ?auto_144101 ) ) ( not ( = ?auto_144094 ?auto_144095 ) ) ( not ( = ?auto_144094 ?auto_144102 ) ) ( not ( = ?auto_144094 ?auto_144096 ) ) ( not ( = ?auto_144094 ?auto_144098 ) ) ( not ( = ?auto_144094 ?auto_144097 ) ) ( not ( = ?auto_144100 ?auto_144095 ) ) ( not ( = ?auto_144100 ?auto_144102 ) ) ( not ( = ?auto_144100 ?auto_144096 ) ) ( not ( = ?auto_144100 ?auto_144098 ) ) ( not ( = ?auto_144100 ?auto_144097 ) ) ( not ( = ?auto_144099 ?auto_144095 ) ) ( not ( = ?auto_144099 ?auto_144102 ) ) ( not ( = ?auto_144099 ?auto_144096 ) ) ( not ( = ?auto_144099 ?auto_144098 ) ) ( not ( = ?auto_144099 ?auto_144097 ) ) ( ON ?auto_144101 ?auto_144099 ) ( ON ?auto_144095 ?auto_144101 ) ( ON ?auto_144097 ?auto_144095 ) ( CLEAR ?auto_144096 ) ( ON ?auto_144098 ?auto_144097 ) ( CLEAR ?auto_144098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144094 ?auto_144100 ?auto_144099 ?auto_144101 ?auto_144095 ?auto_144097 )
      ( MAKE-1PILE ?auto_144094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144103 - BLOCK
    )
    :vars
    (
      ?auto_144111 - BLOCK
      ?auto_144108 - BLOCK
      ?auto_144106 - BLOCK
      ?auto_144107 - BLOCK
      ?auto_144109 - BLOCK
      ?auto_144105 - BLOCK
      ?auto_144104 - BLOCK
      ?auto_144110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144111 ?auto_144103 ) ( ON-TABLE ?auto_144103 ) ( not ( = ?auto_144103 ?auto_144111 ) ) ( not ( = ?auto_144103 ?auto_144108 ) ) ( not ( = ?auto_144103 ?auto_144106 ) ) ( not ( = ?auto_144111 ?auto_144108 ) ) ( not ( = ?auto_144111 ?auto_144106 ) ) ( not ( = ?auto_144108 ?auto_144106 ) ) ( ON ?auto_144108 ?auto_144111 ) ( ON-TABLE ?auto_144107 ) ( not ( = ?auto_144107 ?auto_144109 ) ) ( not ( = ?auto_144107 ?auto_144105 ) ) ( not ( = ?auto_144107 ?auto_144104 ) ) ( not ( = ?auto_144107 ?auto_144110 ) ) ( not ( = ?auto_144107 ?auto_144106 ) ) ( not ( = ?auto_144109 ?auto_144105 ) ) ( not ( = ?auto_144109 ?auto_144104 ) ) ( not ( = ?auto_144109 ?auto_144110 ) ) ( not ( = ?auto_144109 ?auto_144106 ) ) ( not ( = ?auto_144105 ?auto_144104 ) ) ( not ( = ?auto_144105 ?auto_144110 ) ) ( not ( = ?auto_144105 ?auto_144106 ) ) ( not ( = ?auto_144104 ?auto_144110 ) ) ( not ( = ?auto_144104 ?auto_144106 ) ) ( not ( = ?auto_144110 ?auto_144106 ) ) ( not ( = ?auto_144103 ?auto_144110 ) ) ( not ( = ?auto_144103 ?auto_144107 ) ) ( not ( = ?auto_144103 ?auto_144109 ) ) ( not ( = ?auto_144103 ?auto_144105 ) ) ( not ( = ?auto_144103 ?auto_144104 ) ) ( not ( = ?auto_144111 ?auto_144110 ) ) ( not ( = ?auto_144111 ?auto_144107 ) ) ( not ( = ?auto_144111 ?auto_144109 ) ) ( not ( = ?auto_144111 ?auto_144105 ) ) ( not ( = ?auto_144111 ?auto_144104 ) ) ( not ( = ?auto_144108 ?auto_144110 ) ) ( not ( = ?auto_144108 ?auto_144107 ) ) ( not ( = ?auto_144108 ?auto_144109 ) ) ( not ( = ?auto_144108 ?auto_144105 ) ) ( not ( = ?auto_144108 ?auto_144104 ) ) ( ON ?auto_144106 ?auto_144108 ) ( ON ?auto_144110 ?auto_144106 ) ( ON ?auto_144104 ?auto_144110 ) ( ON ?auto_144105 ?auto_144104 ) ( CLEAR ?auto_144105 ) ( HOLDING ?auto_144109 ) ( CLEAR ?auto_144107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144107 ?auto_144109 )
      ( MAKE-1PILE ?auto_144103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146282 - BLOCK
    )
    :vars
    (
      ?auto_146285 - BLOCK
      ?auto_146288 - BLOCK
      ?auto_146284 - BLOCK
      ?auto_146289 - BLOCK
      ?auto_146286 - BLOCK
      ?auto_146287 - BLOCK
      ?auto_146283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146285 ?auto_146282 ) ( ON-TABLE ?auto_146282 ) ( not ( = ?auto_146282 ?auto_146285 ) ) ( not ( = ?auto_146282 ?auto_146288 ) ) ( not ( = ?auto_146282 ?auto_146284 ) ) ( not ( = ?auto_146285 ?auto_146288 ) ) ( not ( = ?auto_146285 ?auto_146284 ) ) ( not ( = ?auto_146288 ?auto_146284 ) ) ( ON ?auto_146288 ?auto_146285 ) ( not ( = ?auto_146289 ?auto_146286 ) ) ( not ( = ?auto_146289 ?auto_146287 ) ) ( not ( = ?auto_146289 ?auto_146283 ) ) ( not ( = ?auto_146289 ?auto_146284 ) ) ( not ( = ?auto_146286 ?auto_146287 ) ) ( not ( = ?auto_146286 ?auto_146283 ) ) ( not ( = ?auto_146286 ?auto_146284 ) ) ( not ( = ?auto_146287 ?auto_146283 ) ) ( not ( = ?auto_146287 ?auto_146284 ) ) ( not ( = ?auto_146283 ?auto_146284 ) ) ( not ( = ?auto_146282 ?auto_146283 ) ) ( not ( = ?auto_146282 ?auto_146289 ) ) ( not ( = ?auto_146282 ?auto_146286 ) ) ( not ( = ?auto_146282 ?auto_146287 ) ) ( not ( = ?auto_146285 ?auto_146283 ) ) ( not ( = ?auto_146285 ?auto_146289 ) ) ( not ( = ?auto_146285 ?auto_146286 ) ) ( not ( = ?auto_146285 ?auto_146287 ) ) ( not ( = ?auto_146288 ?auto_146283 ) ) ( not ( = ?auto_146288 ?auto_146289 ) ) ( not ( = ?auto_146288 ?auto_146286 ) ) ( not ( = ?auto_146288 ?auto_146287 ) ) ( ON ?auto_146284 ?auto_146288 ) ( ON ?auto_146283 ?auto_146284 ) ( ON ?auto_146287 ?auto_146283 ) ( ON ?auto_146286 ?auto_146287 ) ( ON ?auto_146289 ?auto_146286 ) ( CLEAR ?auto_146289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146282 ?auto_146285 ?auto_146288 ?auto_146284 ?auto_146283 ?auto_146287 ?auto_146286 )
      ( MAKE-1PILE ?auto_146282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144121 - BLOCK
    )
    :vars
    (
      ?auto_144125 - BLOCK
      ?auto_144129 - BLOCK
      ?auto_144128 - BLOCK
      ?auto_144126 - BLOCK
      ?auto_144122 - BLOCK
      ?auto_144123 - BLOCK
      ?auto_144124 - BLOCK
      ?auto_144127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144125 ?auto_144121 ) ( ON-TABLE ?auto_144121 ) ( not ( = ?auto_144121 ?auto_144125 ) ) ( not ( = ?auto_144121 ?auto_144129 ) ) ( not ( = ?auto_144121 ?auto_144128 ) ) ( not ( = ?auto_144125 ?auto_144129 ) ) ( not ( = ?auto_144125 ?auto_144128 ) ) ( not ( = ?auto_144129 ?auto_144128 ) ) ( ON ?auto_144129 ?auto_144125 ) ( not ( = ?auto_144126 ?auto_144122 ) ) ( not ( = ?auto_144126 ?auto_144123 ) ) ( not ( = ?auto_144126 ?auto_144124 ) ) ( not ( = ?auto_144126 ?auto_144127 ) ) ( not ( = ?auto_144126 ?auto_144128 ) ) ( not ( = ?auto_144122 ?auto_144123 ) ) ( not ( = ?auto_144122 ?auto_144124 ) ) ( not ( = ?auto_144122 ?auto_144127 ) ) ( not ( = ?auto_144122 ?auto_144128 ) ) ( not ( = ?auto_144123 ?auto_144124 ) ) ( not ( = ?auto_144123 ?auto_144127 ) ) ( not ( = ?auto_144123 ?auto_144128 ) ) ( not ( = ?auto_144124 ?auto_144127 ) ) ( not ( = ?auto_144124 ?auto_144128 ) ) ( not ( = ?auto_144127 ?auto_144128 ) ) ( not ( = ?auto_144121 ?auto_144127 ) ) ( not ( = ?auto_144121 ?auto_144126 ) ) ( not ( = ?auto_144121 ?auto_144122 ) ) ( not ( = ?auto_144121 ?auto_144123 ) ) ( not ( = ?auto_144121 ?auto_144124 ) ) ( not ( = ?auto_144125 ?auto_144127 ) ) ( not ( = ?auto_144125 ?auto_144126 ) ) ( not ( = ?auto_144125 ?auto_144122 ) ) ( not ( = ?auto_144125 ?auto_144123 ) ) ( not ( = ?auto_144125 ?auto_144124 ) ) ( not ( = ?auto_144129 ?auto_144127 ) ) ( not ( = ?auto_144129 ?auto_144126 ) ) ( not ( = ?auto_144129 ?auto_144122 ) ) ( not ( = ?auto_144129 ?auto_144123 ) ) ( not ( = ?auto_144129 ?auto_144124 ) ) ( ON ?auto_144128 ?auto_144129 ) ( ON ?auto_144127 ?auto_144128 ) ( ON ?auto_144124 ?auto_144127 ) ( ON ?auto_144123 ?auto_144124 ) ( ON ?auto_144122 ?auto_144123 ) ( CLEAR ?auto_144122 ) ( HOLDING ?auto_144126 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144126 )
      ( MAKE-1PILE ?auto_144121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144130 - BLOCK
    )
    :vars
    (
      ?auto_144137 - BLOCK
      ?auto_144131 - BLOCK
      ?auto_144136 - BLOCK
      ?auto_144133 - BLOCK
      ?auto_144134 - BLOCK
      ?auto_144132 - BLOCK
      ?auto_144135 - BLOCK
      ?auto_144138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144137 ?auto_144130 ) ( ON-TABLE ?auto_144130 ) ( not ( = ?auto_144130 ?auto_144137 ) ) ( not ( = ?auto_144130 ?auto_144131 ) ) ( not ( = ?auto_144130 ?auto_144136 ) ) ( not ( = ?auto_144137 ?auto_144131 ) ) ( not ( = ?auto_144137 ?auto_144136 ) ) ( not ( = ?auto_144131 ?auto_144136 ) ) ( ON ?auto_144131 ?auto_144137 ) ( not ( = ?auto_144133 ?auto_144134 ) ) ( not ( = ?auto_144133 ?auto_144132 ) ) ( not ( = ?auto_144133 ?auto_144135 ) ) ( not ( = ?auto_144133 ?auto_144138 ) ) ( not ( = ?auto_144133 ?auto_144136 ) ) ( not ( = ?auto_144134 ?auto_144132 ) ) ( not ( = ?auto_144134 ?auto_144135 ) ) ( not ( = ?auto_144134 ?auto_144138 ) ) ( not ( = ?auto_144134 ?auto_144136 ) ) ( not ( = ?auto_144132 ?auto_144135 ) ) ( not ( = ?auto_144132 ?auto_144138 ) ) ( not ( = ?auto_144132 ?auto_144136 ) ) ( not ( = ?auto_144135 ?auto_144138 ) ) ( not ( = ?auto_144135 ?auto_144136 ) ) ( not ( = ?auto_144138 ?auto_144136 ) ) ( not ( = ?auto_144130 ?auto_144138 ) ) ( not ( = ?auto_144130 ?auto_144133 ) ) ( not ( = ?auto_144130 ?auto_144134 ) ) ( not ( = ?auto_144130 ?auto_144132 ) ) ( not ( = ?auto_144130 ?auto_144135 ) ) ( not ( = ?auto_144137 ?auto_144138 ) ) ( not ( = ?auto_144137 ?auto_144133 ) ) ( not ( = ?auto_144137 ?auto_144134 ) ) ( not ( = ?auto_144137 ?auto_144132 ) ) ( not ( = ?auto_144137 ?auto_144135 ) ) ( not ( = ?auto_144131 ?auto_144138 ) ) ( not ( = ?auto_144131 ?auto_144133 ) ) ( not ( = ?auto_144131 ?auto_144134 ) ) ( not ( = ?auto_144131 ?auto_144132 ) ) ( not ( = ?auto_144131 ?auto_144135 ) ) ( ON ?auto_144136 ?auto_144131 ) ( ON ?auto_144138 ?auto_144136 ) ( ON ?auto_144135 ?auto_144138 ) ( ON ?auto_144132 ?auto_144135 ) ( ON ?auto_144134 ?auto_144132 ) ( ON ?auto_144133 ?auto_144134 ) ( CLEAR ?auto_144133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144130 ?auto_144137 ?auto_144131 ?auto_144136 ?auto_144138 ?auto_144135 ?auto_144132 ?auto_144134 )
      ( MAKE-1PILE ?auto_144130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144147 - BLOCK
      ?auto_144148 - BLOCK
      ?auto_144149 - BLOCK
      ?auto_144150 - BLOCK
      ?auto_144151 - BLOCK
      ?auto_144152 - BLOCK
      ?auto_144153 - BLOCK
      ?auto_144154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_144154 ) ( CLEAR ?auto_144153 ) ( ON-TABLE ?auto_144147 ) ( ON ?auto_144148 ?auto_144147 ) ( ON ?auto_144149 ?auto_144148 ) ( ON ?auto_144150 ?auto_144149 ) ( ON ?auto_144151 ?auto_144150 ) ( ON ?auto_144152 ?auto_144151 ) ( ON ?auto_144153 ?auto_144152 ) ( not ( = ?auto_144147 ?auto_144148 ) ) ( not ( = ?auto_144147 ?auto_144149 ) ) ( not ( = ?auto_144147 ?auto_144150 ) ) ( not ( = ?auto_144147 ?auto_144151 ) ) ( not ( = ?auto_144147 ?auto_144152 ) ) ( not ( = ?auto_144147 ?auto_144153 ) ) ( not ( = ?auto_144147 ?auto_144154 ) ) ( not ( = ?auto_144148 ?auto_144149 ) ) ( not ( = ?auto_144148 ?auto_144150 ) ) ( not ( = ?auto_144148 ?auto_144151 ) ) ( not ( = ?auto_144148 ?auto_144152 ) ) ( not ( = ?auto_144148 ?auto_144153 ) ) ( not ( = ?auto_144148 ?auto_144154 ) ) ( not ( = ?auto_144149 ?auto_144150 ) ) ( not ( = ?auto_144149 ?auto_144151 ) ) ( not ( = ?auto_144149 ?auto_144152 ) ) ( not ( = ?auto_144149 ?auto_144153 ) ) ( not ( = ?auto_144149 ?auto_144154 ) ) ( not ( = ?auto_144150 ?auto_144151 ) ) ( not ( = ?auto_144150 ?auto_144152 ) ) ( not ( = ?auto_144150 ?auto_144153 ) ) ( not ( = ?auto_144150 ?auto_144154 ) ) ( not ( = ?auto_144151 ?auto_144152 ) ) ( not ( = ?auto_144151 ?auto_144153 ) ) ( not ( = ?auto_144151 ?auto_144154 ) ) ( not ( = ?auto_144152 ?auto_144153 ) ) ( not ( = ?auto_144152 ?auto_144154 ) ) ( not ( = ?auto_144153 ?auto_144154 ) ) )
    :subtasks
    ( ( !STACK ?auto_144154 ?auto_144153 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144155 - BLOCK
      ?auto_144156 - BLOCK
      ?auto_144157 - BLOCK
      ?auto_144158 - BLOCK
      ?auto_144159 - BLOCK
      ?auto_144160 - BLOCK
      ?auto_144161 - BLOCK
      ?auto_144162 - BLOCK
    )
    :vars
    (
      ?auto_144163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144161 ) ( ON-TABLE ?auto_144155 ) ( ON ?auto_144156 ?auto_144155 ) ( ON ?auto_144157 ?auto_144156 ) ( ON ?auto_144158 ?auto_144157 ) ( ON ?auto_144159 ?auto_144158 ) ( ON ?auto_144160 ?auto_144159 ) ( ON ?auto_144161 ?auto_144160 ) ( not ( = ?auto_144155 ?auto_144156 ) ) ( not ( = ?auto_144155 ?auto_144157 ) ) ( not ( = ?auto_144155 ?auto_144158 ) ) ( not ( = ?auto_144155 ?auto_144159 ) ) ( not ( = ?auto_144155 ?auto_144160 ) ) ( not ( = ?auto_144155 ?auto_144161 ) ) ( not ( = ?auto_144155 ?auto_144162 ) ) ( not ( = ?auto_144156 ?auto_144157 ) ) ( not ( = ?auto_144156 ?auto_144158 ) ) ( not ( = ?auto_144156 ?auto_144159 ) ) ( not ( = ?auto_144156 ?auto_144160 ) ) ( not ( = ?auto_144156 ?auto_144161 ) ) ( not ( = ?auto_144156 ?auto_144162 ) ) ( not ( = ?auto_144157 ?auto_144158 ) ) ( not ( = ?auto_144157 ?auto_144159 ) ) ( not ( = ?auto_144157 ?auto_144160 ) ) ( not ( = ?auto_144157 ?auto_144161 ) ) ( not ( = ?auto_144157 ?auto_144162 ) ) ( not ( = ?auto_144158 ?auto_144159 ) ) ( not ( = ?auto_144158 ?auto_144160 ) ) ( not ( = ?auto_144158 ?auto_144161 ) ) ( not ( = ?auto_144158 ?auto_144162 ) ) ( not ( = ?auto_144159 ?auto_144160 ) ) ( not ( = ?auto_144159 ?auto_144161 ) ) ( not ( = ?auto_144159 ?auto_144162 ) ) ( not ( = ?auto_144160 ?auto_144161 ) ) ( not ( = ?auto_144160 ?auto_144162 ) ) ( not ( = ?auto_144161 ?auto_144162 ) ) ( ON ?auto_144162 ?auto_144163 ) ( CLEAR ?auto_144162 ) ( HAND-EMPTY ) ( not ( = ?auto_144155 ?auto_144163 ) ) ( not ( = ?auto_144156 ?auto_144163 ) ) ( not ( = ?auto_144157 ?auto_144163 ) ) ( not ( = ?auto_144158 ?auto_144163 ) ) ( not ( = ?auto_144159 ?auto_144163 ) ) ( not ( = ?auto_144160 ?auto_144163 ) ) ( not ( = ?auto_144161 ?auto_144163 ) ) ( not ( = ?auto_144162 ?auto_144163 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144162 ?auto_144163 )
      ( MAKE-8PILE ?auto_144155 ?auto_144156 ?auto_144157 ?auto_144158 ?auto_144159 ?auto_144160 ?auto_144161 ?auto_144162 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144164 - BLOCK
      ?auto_144165 - BLOCK
      ?auto_144166 - BLOCK
      ?auto_144167 - BLOCK
      ?auto_144168 - BLOCK
      ?auto_144169 - BLOCK
      ?auto_144170 - BLOCK
      ?auto_144171 - BLOCK
    )
    :vars
    (
      ?auto_144172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144164 ) ( ON ?auto_144165 ?auto_144164 ) ( ON ?auto_144166 ?auto_144165 ) ( ON ?auto_144167 ?auto_144166 ) ( ON ?auto_144168 ?auto_144167 ) ( ON ?auto_144169 ?auto_144168 ) ( not ( = ?auto_144164 ?auto_144165 ) ) ( not ( = ?auto_144164 ?auto_144166 ) ) ( not ( = ?auto_144164 ?auto_144167 ) ) ( not ( = ?auto_144164 ?auto_144168 ) ) ( not ( = ?auto_144164 ?auto_144169 ) ) ( not ( = ?auto_144164 ?auto_144170 ) ) ( not ( = ?auto_144164 ?auto_144171 ) ) ( not ( = ?auto_144165 ?auto_144166 ) ) ( not ( = ?auto_144165 ?auto_144167 ) ) ( not ( = ?auto_144165 ?auto_144168 ) ) ( not ( = ?auto_144165 ?auto_144169 ) ) ( not ( = ?auto_144165 ?auto_144170 ) ) ( not ( = ?auto_144165 ?auto_144171 ) ) ( not ( = ?auto_144166 ?auto_144167 ) ) ( not ( = ?auto_144166 ?auto_144168 ) ) ( not ( = ?auto_144166 ?auto_144169 ) ) ( not ( = ?auto_144166 ?auto_144170 ) ) ( not ( = ?auto_144166 ?auto_144171 ) ) ( not ( = ?auto_144167 ?auto_144168 ) ) ( not ( = ?auto_144167 ?auto_144169 ) ) ( not ( = ?auto_144167 ?auto_144170 ) ) ( not ( = ?auto_144167 ?auto_144171 ) ) ( not ( = ?auto_144168 ?auto_144169 ) ) ( not ( = ?auto_144168 ?auto_144170 ) ) ( not ( = ?auto_144168 ?auto_144171 ) ) ( not ( = ?auto_144169 ?auto_144170 ) ) ( not ( = ?auto_144169 ?auto_144171 ) ) ( not ( = ?auto_144170 ?auto_144171 ) ) ( ON ?auto_144171 ?auto_144172 ) ( CLEAR ?auto_144171 ) ( not ( = ?auto_144164 ?auto_144172 ) ) ( not ( = ?auto_144165 ?auto_144172 ) ) ( not ( = ?auto_144166 ?auto_144172 ) ) ( not ( = ?auto_144167 ?auto_144172 ) ) ( not ( = ?auto_144168 ?auto_144172 ) ) ( not ( = ?auto_144169 ?auto_144172 ) ) ( not ( = ?auto_144170 ?auto_144172 ) ) ( not ( = ?auto_144171 ?auto_144172 ) ) ( HOLDING ?auto_144170 ) ( CLEAR ?auto_144169 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144164 ?auto_144165 ?auto_144166 ?auto_144167 ?auto_144168 ?auto_144169 ?auto_144170 )
      ( MAKE-8PILE ?auto_144164 ?auto_144165 ?auto_144166 ?auto_144167 ?auto_144168 ?auto_144169 ?auto_144170 ?auto_144171 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144173 - BLOCK
      ?auto_144174 - BLOCK
      ?auto_144175 - BLOCK
      ?auto_144176 - BLOCK
      ?auto_144177 - BLOCK
      ?auto_144178 - BLOCK
      ?auto_144179 - BLOCK
      ?auto_144180 - BLOCK
    )
    :vars
    (
      ?auto_144181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144173 ) ( ON ?auto_144174 ?auto_144173 ) ( ON ?auto_144175 ?auto_144174 ) ( ON ?auto_144176 ?auto_144175 ) ( ON ?auto_144177 ?auto_144176 ) ( ON ?auto_144178 ?auto_144177 ) ( not ( = ?auto_144173 ?auto_144174 ) ) ( not ( = ?auto_144173 ?auto_144175 ) ) ( not ( = ?auto_144173 ?auto_144176 ) ) ( not ( = ?auto_144173 ?auto_144177 ) ) ( not ( = ?auto_144173 ?auto_144178 ) ) ( not ( = ?auto_144173 ?auto_144179 ) ) ( not ( = ?auto_144173 ?auto_144180 ) ) ( not ( = ?auto_144174 ?auto_144175 ) ) ( not ( = ?auto_144174 ?auto_144176 ) ) ( not ( = ?auto_144174 ?auto_144177 ) ) ( not ( = ?auto_144174 ?auto_144178 ) ) ( not ( = ?auto_144174 ?auto_144179 ) ) ( not ( = ?auto_144174 ?auto_144180 ) ) ( not ( = ?auto_144175 ?auto_144176 ) ) ( not ( = ?auto_144175 ?auto_144177 ) ) ( not ( = ?auto_144175 ?auto_144178 ) ) ( not ( = ?auto_144175 ?auto_144179 ) ) ( not ( = ?auto_144175 ?auto_144180 ) ) ( not ( = ?auto_144176 ?auto_144177 ) ) ( not ( = ?auto_144176 ?auto_144178 ) ) ( not ( = ?auto_144176 ?auto_144179 ) ) ( not ( = ?auto_144176 ?auto_144180 ) ) ( not ( = ?auto_144177 ?auto_144178 ) ) ( not ( = ?auto_144177 ?auto_144179 ) ) ( not ( = ?auto_144177 ?auto_144180 ) ) ( not ( = ?auto_144178 ?auto_144179 ) ) ( not ( = ?auto_144178 ?auto_144180 ) ) ( not ( = ?auto_144179 ?auto_144180 ) ) ( ON ?auto_144180 ?auto_144181 ) ( not ( = ?auto_144173 ?auto_144181 ) ) ( not ( = ?auto_144174 ?auto_144181 ) ) ( not ( = ?auto_144175 ?auto_144181 ) ) ( not ( = ?auto_144176 ?auto_144181 ) ) ( not ( = ?auto_144177 ?auto_144181 ) ) ( not ( = ?auto_144178 ?auto_144181 ) ) ( not ( = ?auto_144179 ?auto_144181 ) ) ( not ( = ?auto_144180 ?auto_144181 ) ) ( CLEAR ?auto_144178 ) ( ON ?auto_144179 ?auto_144180 ) ( CLEAR ?auto_144179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144181 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144181 ?auto_144180 )
      ( MAKE-8PILE ?auto_144173 ?auto_144174 ?auto_144175 ?auto_144176 ?auto_144177 ?auto_144178 ?auto_144179 ?auto_144180 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144182 - BLOCK
      ?auto_144183 - BLOCK
      ?auto_144184 - BLOCK
      ?auto_144185 - BLOCK
      ?auto_144186 - BLOCK
      ?auto_144187 - BLOCK
      ?auto_144188 - BLOCK
      ?auto_144189 - BLOCK
    )
    :vars
    (
      ?auto_144190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144182 ) ( ON ?auto_144183 ?auto_144182 ) ( ON ?auto_144184 ?auto_144183 ) ( ON ?auto_144185 ?auto_144184 ) ( ON ?auto_144186 ?auto_144185 ) ( not ( = ?auto_144182 ?auto_144183 ) ) ( not ( = ?auto_144182 ?auto_144184 ) ) ( not ( = ?auto_144182 ?auto_144185 ) ) ( not ( = ?auto_144182 ?auto_144186 ) ) ( not ( = ?auto_144182 ?auto_144187 ) ) ( not ( = ?auto_144182 ?auto_144188 ) ) ( not ( = ?auto_144182 ?auto_144189 ) ) ( not ( = ?auto_144183 ?auto_144184 ) ) ( not ( = ?auto_144183 ?auto_144185 ) ) ( not ( = ?auto_144183 ?auto_144186 ) ) ( not ( = ?auto_144183 ?auto_144187 ) ) ( not ( = ?auto_144183 ?auto_144188 ) ) ( not ( = ?auto_144183 ?auto_144189 ) ) ( not ( = ?auto_144184 ?auto_144185 ) ) ( not ( = ?auto_144184 ?auto_144186 ) ) ( not ( = ?auto_144184 ?auto_144187 ) ) ( not ( = ?auto_144184 ?auto_144188 ) ) ( not ( = ?auto_144184 ?auto_144189 ) ) ( not ( = ?auto_144185 ?auto_144186 ) ) ( not ( = ?auto_144185 ?auto_144187 ) ) ( not ( = ?auto_144185 ?auto_144188 ) ) ( not ( = ?auto_144185 ?auto_144189 ) ) ( not ( = ?auto_144186 ?auto_144187 ) ) ( not ( = ?auto_144186 ?auto_144188 ) ) ( not ( = ?auto_144186 ?auto_144189 ) ) ( not ( = ?auto_144187 ?auto_144188 ) ) ( not ( = ?auto_144187 ?auto_144189 ) ) ( not ( = ?auto_144188 ?auto_144189 ) ) ( ON ?auto_144189 ?auto_144190 ) ( not ( = ?auto_144182 ?auto_144190 ) ) ( not ( = ?auto_144183 ?auto_144190 ) ) ( not ( = ?auto_144184 ?auto_144190 ) ) ( not ( = ?auto_144185 ?auto_144190 ) ) ( not ( = ?auto_144186 ?auto_144190 ) ) ( not ( = ?auto_144187 ?auto_144190 ) ) ( not ( = ?auto_144188 ?auto_144190 ) ) ( not ( = ?auto_144189 ?auto_144190 ) ) ( ON ?auto_144188 ?auto_144189 ) ( CLEAR ?auto_144188 ) ( ON-TABLE ?auto_144190 ) ( HOLDING ?auto_144187 ) ( CLEAR ?auto_144186 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144182 ?auto_144183 ?auto_144184 ?auto_144185 ?auto_144186 ?auto_144187 )
      ( MAKE-8PILE ?auto_144182 ?auto_144183 ?auto_144184 ?auto_144185 ?auto_144186 ?auto_144187 ?auto_144188 ?auto_144189 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144191 - BLOCK
      ?auto_144192 - BLOCK
      ?auto_144193 - BLOCK
      ?auto_144194 - BLOCK
      ?auto_144195 - BLOCK
      ?auto_144196 - BLOCK
      ?auto_144197 - BLOCK
      ?auto_144198 - BLOCK
    )
    :vars
    (
      ?auto_144199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144191 ) ( ON ?auto_144192 ?auto_144191 ) ( ON ?auto_144193 ?auto_144192 ) ( ON ?auto_144194 ?auto_144193 ) ( ON ?auto_144195 ?auto_144194 ) ( not ( = ?auto_144191 ?auto_144192 ) ) ( not ( = ?auto_144191 ?auto_144193 ) ) ( not ( = ?auto_144191 ?auto_144194 ) ) ( not ( = ?auto_144191 ?auto_144195 ) ) ( not ( = ?auto_144191 ?auto_144196 ) ) ( not ( = ?auto_144191 ?auto_144197 ) ) ( not ( = ?auto_144191 ?auto_144198 ) ) ( not ( = ?auto_144192 ?auto_144193 ) ) ( not ( = ?auto_144192 ?auto_144194 ) ) ( not ( = ?auto_144192 ?auto_144195 ) ) ( not ( = ?auto_144192 ?auto_144196 ) ) ( not ( = ?auto_144192 ?auto_144197 ) ) ( not ( = ?auto_144192 ?auto_144198 ) ) ( not ( = ?auto_144193 ?auto_144194 ) ) ( not ( = ?auto_144193 ?auto_144195 ) ) ( not ( = ?auto_144193 ?auto_144196 ) ) ( not ( = ?auto_144193 ?auto_144197 ) ) ( not ( = ?auto_144193 ?auto_144198 ) ) ( not ( = ?auto_144194 ?auto_144195 ) ) ( not ( = ?auto_144194 ?auto_144196 ) ) ( not ( = ?auto_144194 ?auto_144197 ) ) ( not ( = ?auto_144194 ?auto_144198 ) ) ( not ( = ?auto_144195 ?auto_144196 ) ) ( not ( = ?auto_144195 ?auto_144197 ) ) ( not ( = ?auto_144195 ?auto_144198 ) ) ( not ( = ?auto_144196 ?auto_144197 ) ) ( not ( = ?auto_144196 ?auto_144198 ) ) ( not ( = ?auto_144197 ?auto_144198 ) ) ( ON ?auto_144198 ?auto_144199 ) ( not ( = ?auto_144191 ?auto_144199 ) ) ( not ( = ?auto_144192 ?auto_144199 ) ) ( not ( = ?auto_144193 ?auto_144199 ) ) ( not ( = ?auto_144194 ?auto_144199 ) ) ( not ( = ?auto_144195 ?auto_144199 ) ) ( not ( = ?auto_144196 ?auto_144199 ) ) ( not ( = ?auto_144197 ?auto_144199 ) ) ( not ( = ?auto_144198 ?auto_144199 ) ) ( ON ?auto_144197 ?auto_144198 ) ( ON-TABLE ?auto_144199 ) ( CLEAR ?auto_144195 ) ( ON ?auto_144196 ?auto_144197 ) ( CLEAR ?auto_144196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144199 ?auto_144198 ?auto_144197 )
      ( MAKE-8PILE ?auto_144191 ?auto_144192 ?auto_144193 ?auto_144194 ?auto_144195 ?auto_144196 ?auto_144197 ?auto_144198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144200 - BLOCK
      ?auto_144201 - BLOCK
      ?auto_144202 - BLOCK
      ?auto_144203 - BLOCK
      ?auto_144204 - BLOCK
      ?auto_144205 - BLOCK
      ?auto_144206 - BLOCK
      ?auto_144207 - BLOCK
    )
    :vars
    (
      ?auto_144208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144200 ) ( ON ?auto_144201 ?auto_144200 ) ( ON ?auto_144202 ?auto_144201 ) ( ON ?auto_144203 ?auto_144202 ) ( not ( = ?auto_144200 ?auto_144201 ) ) ( not ( = ?auto_144200 ?auto_144202 ) ) ( not ( = ?auto_144200 ?auto_144203 ) ) ( not ( = ?auto_144200 ?auto_144204 ) ) ( not ( = ?auto_144200 ?auto_144205 ) ) ( not ( = ?auto_144200 ?auto_144206 ) ) ( not ( = ?auto_144200 ?auto_144207 ) ) ( not ( = ?auto_144201 ?auto_144202 ) ) ( not ( = ?auto_144201 ?auto_144203 ) ) ( not ( = ?auto_144201 ?auto_144204 ) ) ( not ( = ?auto_144201 ?auto_144205 ) ) ( not ( = ?auto_144201 ?auto_144206 ) ) ( not ( = ?auto_144201 ?auto_144207 ) ) ( not ( = ?auto_144202 ?auto_144203 ) ) ( not ( = ?auto_144202 ?auto_144204 ) ) ( not ( = ?auto_144202 ?auto_144205 ) ) ( not ( = ?auto_144202 ?auto_144206 ) ) ( not ( = ?auto_144202 ?auto_144207 ) ) ( not ( = ?auto_144203 ?auto_144204 ) ) ( not ( = ?auto_144203 ?auto_144205 ) ) ( not ( = ?auto_144203 ?auto_144206 ) ) ( not ( = ?auto_144203 ?auto_144207 ) ) ( not ( = ?auto_144204 ?auto_144205 ) ) ( not ( = ?auto_144204 ?auto_144206 ) ) ( not ( = ?auto_144204 ?auto_144207 ) ) ( not ( = ?auto_144205 ?auto_144206 ) ) ( not ( = ?auto_144205 ?auto_144207 ) ) ( not ( = ?auto_144206 ?auto_144207 ) ) ( ON ?auto_144207 ?auto_144208 ) ( not ( = ?auto_144200 ?auto_144208 ) ) ( not ( = ?auto_144201 ?auto_144208 ) ) ( not ( = ?auto_144202 ?auto_144208 ) ) ( not ( = ?auto_144203 ?auto_144208 ) ) ( not ( = ?auto_144204 ?auto_144208 ) ) ( not ( = ?auto_144205 ?auto_144208 ) ) ( not ( = ?auto_144206 ?auto_144208 ) ) ( not ( = ?auto_144207 ?auto_144208 ) ) ( ON ?auto_144206 ?auto_144207 ) ( ON-TABLE ?auto_144208 ) ( ON ?auto_144205 ?auto_144206 ) ( CLEAR ?auto_144205 ) ( HOLDING ?auto_144204 ) ( CLEAR ?auto_144203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144200 ?auto_144201 ?auto_144202 ?auto_144203 ?auto_144204 )
      ( MAKE-8PILE ?auto_144200 ?auto_144201 ?auto_144202 ?auto_144203 ?auto_144204 ?auto_144205 ?auto_144206 ?auto_144207 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144209 - BLOCK
      ?auto_144210 - BLOCK
      ?auto_144211 - BLOCK
      ?auto_144212 - BLOCK
      ?auto_144213 - BLOCK
      ?auto_144214 - BLOCK
      ?auto_144215 - BLOCK
      ?auto_144216 - BLOCK
    )
    :vars
    (
      ?auto_144217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144209 ) ( ON ?auto_144210 ?auto_144209 ) ( ON ?auto_144211 ?auto_144210 ) ( ON ?auto_144212 ?auto_144211 ) ( not ( = ?auto_144209 ?auto_144210 ) ) ( not ( = ?auto_144209 ?auto_144211 ) ) ( not ( = ?auto_144209 ?auto_144212 ) ) ( not ( = ?auto_144209 ?auto_144213 ) ) ( not ( = ?auto_144209 ?auto_144214 ) ) ( not ( = ?auto_144209 ?auto_144215 ) ) ( not ( = ?auto_144209 ?auto_144216 ) ) ( not ( = ?auto_144210 ?auto_144211 ) ) ( not ( = ?auto_144210 ?auto_144212 ) ) ( not ( = ?auto_144210 ?auto_144213 ) ) ( not ( = ?auto_144210 ?auto_144214 ) ) ( not ( = ?auto_144210 ?auto_144215 ) ) ( not ( = ?auto_144210 ?auto_144216 ) ) ( not ( = ?auto_144211 ?auto_144212 ) ) ( not ( = ?auto_144211 ?auto_144213 ) ) ( not ( = ?auto_144211 ?auto_144214 ) ) ( not ( = ?auto_144211 ?auto_144215 ) ) ( not ( = ?auto_144211 ?auto_144216 ) ) ( not ( = ?auto_144212 ?auto_144213 ) ) ( not ( = ?auto_144212 ?auto_144214 ) ) ( not ( = ?auto_144212 ?auto_144215 ) ) ( not ( = ?auto_144212 ?auto_144216 ) ) ( not ( = ?auto_144213 ?auto_144214 ) ) ( not ( = ?auto_144213 ?auto_144215 ) ) ( not ( = ?auto_144213 ?auto_144216 ) ) ( not ( = ?auto_144214 ?auto_144215 ) ) ( not ( = ?auto_144214 ?auto_144216 ) ) ( not ( = ?auto_144215 ?auto_144216 ) ) ( ON ?auto_144216 ?auto_144217 ) ( not ( = ?auto_144209 ?auto_144217 ) ) ( not ( = ?auto_144210 ?auto_144217 ) ) ( not ( = ?auto_144211 ?auto_144217 ) ) ( not ( = ?auto_144212 ?auto_144217 ) ) ( not ( = ?auto_144213 ?auto_144217 ) ) ( not ( = ?auto_144214 ?auto_144217 ) ) ( not ( = ?auto_144215 ?auto_144217 ) ) ( not ( = ?auto_144216 ?auto_144217 ) ) ( ON ?auto_144215 ?auto_144216 ) ( ON-TABLE ?auto_144217 ) ( ON ?auto_144214 ?auto_144215 ) ( CLEAR ?auto_144212 ) ( ON ?auto_144213 ?auto_144214 ) ( CLEAR ?auto_144213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144217 ?auto_144216 ?auto_144215 ?auto_144214 )
      ( MAKE-8PILE ?auto_144209 ?auto_144210 ?auto_144211 ?auto_144212 ?auto_144213 ?auto_144214 ?auto_144215 ?auto_144216 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144218 - BLOCK
      ?auto_144219 - BLOCK
      ?auto_144220 - BLOCK
      ?auto_144221 - BLOCK
      ?auto_144222 - BLOCK
      ?auto_144223 - BLOCK
      ?auto_144224 - BLOCK
      ?auto_144225 - BLOCK
    )
    :vars
    (
      ?auto_144226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144218 ) ( ON ?auto_144219 ?auto_144218 ) ( ON ?auto_144220 ?auto_144219 ) ( not ( = ?auto_144218 ?auto_144219 ) ) ( not ( = ?auto_144218 ?auto_144220 ) ) ( not ( = ?auto_144218 ?auto_144221 ) ) ( not ( = ?auto_144218 ?auto_144222 ) ) ( not ( = ?auto_144218 ?auto_144223 ) ) ( not ( = ?auto_144218 ?auto_144224 ) ) ( not ( = ?auto_144218 ?auto_144225 ) ) ( not ( = ?auto_144219 ?auto_144220 ) ) ( not ( = ?auto_144219 ?auto_144221 ) ) ( not ( = ?auto_144219 ?auto_144222 ) ) ( not ( = ?auto_144219 ?auto_144223 ) ) ( not ( = ?auto_144219 ?auto_144224 ) ) ( not ( = ?auto_144219 ?auto_144225 ) ) ( not ( = ?auto_144220 ?auto_144221 ) ) ( not ( = ?auto_144220 ?auto_144222 ) ) ( not ( = ?auto_144220 ?auto_144223 ) ) ( not ( = ?auto_144220 ?auto_144224 ) ) ( not ( = ?auto_144220 ?auto_144225 ) ) ( not ( = ?auto_144221 ?auto_144222 ) ) ( not ( = ?auto_144221 ?auto_144223 ) ) ( not ( = ?auto_144221 ?auto_144224 ) ) ( not ( = ?auto_144221 ?auto_144225 ) ) ( not ( = ?auto_144222 ?auto_144223 ) ) ( not ( = ?auto_144222 ?auto_144224 ) ) ( not ( = ?auto_144222 ?auto_144225 ) ) ( not ( = ?auto_144223 ?auto_144224 ) ) ( not ( = ?auto_144223 ?auto_144225 ) ) ( not ( = ?auto_144224 ?auto_144225 ) ) ( ON ?auto_144225 ?auto_144226 ) ( not ( = ?auto_144218 ?auto_144226 ) ) ( not ( = ?auto_144219 ?auto_144226 ) ) ( not ( = ?auto_144220 ?auto_144226 ) ) ( not ( = ?auto_144221 ?auto_144226 ) ) ( not ( = ?auto_144222 ?auto_144226 ) ) ( not ( = ?auto_144223 ?auto_144226 ) ) ( not ( = ?auto_144224 ?auto_144226 ) ) ( not ( = ?auto_144225 ?auto_144226 ) ) ( ON ?auto_144224 ?auto_144225 ) ( ON-TABLE ?auto_144226 ) ( ON ?auto_144223 ?auto_144224 ) ( ON ?auto_144222 ?auto_144223 ) ( CLEAR ?auto_144222 ) ( HOLDING ?auto_144221 ) ( CLEAR ?auto_144220 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144218 ?auto_144219 ?auto_144220 ?auto_144221 )
      ( MAKE-8PILE ?auto_144218 ?auto_144219 ?auto_144220 ?auto_144221 ?auto_144222 ?auto_144223 ?auto_144224 ?auto_144225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144227 - BLOCK
      ?auto_144228 - BLOCK
      ?auto_144229 - BLOCK
      ?auto_144230 - BLOCK
      ?auto_144231 - BLOCK
      ?auto_144232 - BLOCK
      ?auto_144233 - BLOCK
      ?auto_144234 - BLOCK
    )
    :vars
    (
      ?auto_144235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144227 ) ( ON ?auto_144228 ?auto_144227 ) ( ON ?auto_144229 ?auto_144228 ) ( not ( = ?auto_144227 ?auto_144228 ) ) ( not ( = ?auto_144227 ?auto_144229 ) ) ( not ( = ?auto_144227 ?auto_144230 ) ) ( not ( = ?auto_144227 ?auto_144231 ) ) ( not ( = ?auto_144227 ?auto_144232 ) ) ( not ( = ?auto_144227 ?auto_144233 ) ) ( not ( = ?auto_144227 ?auto_144234 ) ) ( not ( = ?auto_144228 ?auto_144229 ) ) ( not ( = ?auto_144228 ?auto_144230 ) ) ( not ( = ?auto_144228 ?auto_144231 ) ) ( not ( = ?auto_144228 ?auto_144232 ) ) ( not ( = ?auto_144228 ?auto_144233 ) ) ( not ( = ?auto_144228 ?auto_144234 ) ) ( not ( = ?auto_144229 ?auto_144230 ) ) ( not ( = ?auto_144229 ?auto_144231 ) ) ( not ( = ?auto_144229 ?auto_144232 ) ) ( not ( = ?auto_144229 ?auto_144233 ) ) ( not ( = ?auto_144229 ?auto_144234 ) ) ( not ( = ?auto_144230 ?auto_144231 ) ) ( not ( = ?auto_144230 ?auto_144232 ) ) ( not ( = ?auto_144230 ?auto_144233 ) ) ( not ( = ?auto_144230 ?auto_144234 ) ) ( not ( = ?auto_144231 ?auto_144232 ) ) ( not ( = ?auto_144231 ?auto_144233 ) ) ( not ( = ?auto_144231 ?auto_144234 ) ) ( not ( = ?auto_144232 ?auto_144233 ) ) ( not ( = ?auto_144232 ?auto_144234 ) ) ( not ( = ?auto_144233 ?auto_144234 ) ) ( ON ?auto_144234 ?auto_144235 ) ( not ( = ?auto_144227 ?auto_144235 ) ) ( not ( = ?auto_144228 ?auto_144235 ) ) ( not ( = ?auto_144229 ?auto_144235 ) ) ( not ( = ?auto_144230 ?auto_144235 ) ) ( not ( = ?auto_144231 ?auto_144235 ) ) ( not ( = ?auto_144232 ?auto_144235 ) ) ( not ( = ?auto_144233 ?auto_144235 ) ) ( not ( = ?auto_144234 ?auto_144235 ) ) ( ON ?auto_144233 ?auto_144234 ) ( ON-TABLE ?auto_144235 ) ( ON ?auto_144232 ?auto_144233 ) ( ON ?auto_144231 ?auto_144232 ) ( CLEAR ?auto_144229 ) ( ON ?auto_144230 ?auto_144231 ) ( CLEAR ?auto_144230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144235 ?auto_144234 ?auto_144233 ?auto_144232 ?auto_144231 )
      ( MAKE-8PILE ?auto_144227 ?auto_144228 ?auto_144229 ?auto_144230 ?auto_144231 ?auto_144232 ?auto_144233 ?auto_144234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144236 - BLOCK
      ?auto_144237 - BLOCK
      ?auto_144238 - BLOCK
      ?auto_144239 - BLOCK
      ?auto_144240 - BLOCK
      ?auto_144241 - BLOCK
      ?auto_144242 - BLOCK
      ?auto_144243 - BLOCK
    )
    :vars
    (
      ?auto_144244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144236 ) ( ON ?auto_144237 ?auto_144236 ) ( not ( = ?auto_144236 ?auto_144237 ) ) ( not ( = ?auto_144236 ?auto_144238 ) ) ( not ( = ?auto_144236 ?auto_144239 ) ) ( not ( = ?auto_144236 ?auto_144240 ) ) ( not ( = ?auto_144236 ?auto_144241 ) ) ( not ( = ?auto_144236 ?auto_144242 ) ) ( not ( = ?auto_144236 ?auto_144243 ) ) ( not ( = ?auto_144237 ?auto_144238 ) ) ( not ( = ?auto_144237 ?auto_144239 ) ) ( not ( = ?auto_144237 ?auto_144240 ) ) ( not ( = ?auto_144237 ?auto_144241 ) ) ( not ( = ?auto_144237 ?auto_144242 ) ) ( not ( = ?auto_144237 ?auto_144243 ) ) ( not ( = ?auto_144238 ?auto_144239 ) ) ( not ( = ?auto_144238 ?auto_144240 ) ) ( not ( = ?auto_144238 ?auto_144241 ) ) ( not ( = ?auto_144238 ?auto_144242 ) ) ( not ( = ?auto_144238 ?auto_144243 ) ) ( not ( = ?auto_144239 ?auto_144240 ) ) ( not ( = ?auto_144239 ?auto_144241 ) ) ( not ( = ?auto_144239 ?auto_144242 ) ) ( not ( = ?auto_144239 ?auto_144243 ) ) ( not ( = ?auto_144240 ?auto_144241 ) ) ( not ( = ?auto_144240 ?auto_144242 ) ) ( not ( = ?auto_144240 ?auto_144243 ) ) ( not ( = ?auto_144241 ?auto_144242 ) ) ( not ( = ?auto_144241 ?auto_144243 ) ) ( not ( = ?auto_144242 ?auto_144243 ) ) ( ON ?auto_144243 ?auto_144244 ) ( not ( = ?auto_144236 ?auto_144244 ) ) ( not ( = ?auto_144237 ?auto_144244 ) ) ( not ( = ?auto_144238 ?auto_144244 ) ) ( not ( = ?auto_144239 ?auto_144244 ) ) ( not ( = ?auto_144240 ?auto_144244 ) ) ( not ( = ?auto_144241 ?auto_144244 ) ) ( not ( = ?auto_144242 ?auto_144244 ) ) ( not ( = ?auto_144243 ?auto_144244 ) ) ( ON ?auto_144242 ?auto_144243 ) ( ON-TABLE ?auto_144244 ) ( ON ?auto_144241 ?auto_144242 ) ( ON ?auto_144240 ?auto_144241 ) ( ON ?auto_144239 ?auto_144240 ) ( CLEAR ?auto_144239 ) ( HOLDING ?auto_144238 ) ( CLEAR ?auto_144237 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144236 ?auto_144237 ?auto_144238 )
      ( MAKE-8PILE ?auto_144236 ?auto_144237 ?auto_144238 ?auto_144239 ?auto_144240 ?auto_144241 ?auto_144242 ?auto_144243 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144245 - BLOCK
      ?auto_144246 - BLOCK
      ?auto_144247 - BLOCK
      ?auto_144248 - BLOCK
      ?auto_144249 - BLOCK
      ?auto_144250 - BLOCK
      ?auto_144251 - BLOCK
      ?auto_144252 - BLOCK
    )
    :vars
    (
      ?auto_144253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144245 ) ( ON ?auto_144246 ?auto_144245 ) ( not ( = ?auto_144245 ?auto_144246 ) ) ( not ( = ?auto_144245 ?auto_144247 ) ) ( not ( = ?auto_144245 ?auto_144248 ) ) ( not ( = ?auto_144245 ?auto_144249 ) ) ( not ( = ?auto_144245 ?auto_144250 ) ) ( not ( = ?auto_144245 ?auto_144251 ) ) ( not ( = ?auto_144245 ?auto_144252 ) ) ( not ( = ?auto_144246 ?auto_144247 ) ) ( not ( = ?auto_144246 ?auto_144248 ) ) ( not ( = ?auto_144246 ?auto_144249 ) ) ( not ( = ?auto_144246 ?auto_144250 ) ) ( not ( = ?auto_144246 ?auto_144251 ) ) ( not ( = ?auto_144246 ?auto_144252 ) ) ( not ( = ?auto_144247 ?auto_144248 ) ) ( not ( = ?auto_144247 ?auto_144249 ) ) ( not ( = ?auto_144247 ?auto_144250 ) ) ( not ( = ?auto_144247 ?auto_144251 ) ) ( not ( = ?auto_144247 ?auto_144252 ) ) ( not ( = ?auto_144248 ?auto_144249 ) ) ( not ( = ?auto_144248 ?auto_144250 ) ) ( not ( = ?auto_144248 ?auto_144251 ) ) ( not ( = ?auto_144248 ?auto_144252 ) ) ( not ( = ?auto_144249 ?auto_144250 ) ) ( not ( = ?auto_144249 ?auto_144251 ) ) ( not ( = ?auto_144249 ?auto_144252 ) ) ( not ( = ?auto_144250 ?auto_144251 ) ) ( not ( = ?auto_144250 ?auto_144252 ) ) ( not ( = ?auto_144251 ?auto_144252 ) ) ( ON ?auto_144252 ?auto_144253 ) ( not ( = ?auto_144245 ?auto_144253 ) ) ( not ( = ?auto_144246 ?auto_144253 ) ) ( not ( = ?auto_144247 ?auto_144253 ) ) ( not ( = ?auto_144248 ?auto_144253 ) ) ( not ( = ?auto_144249 ?auto_144253 ) ) ( not ( = ?auto_144250 ?auto_144253 ) ) ( not ( = ?auto_144251 ?auto_144253 ) ) ( not ( = ?auto_144252 ?auto_144253 ) ) ( ON ?auto_144251 ?auto_144252 ) ( ON-TABLE ?auto_144253 ) ( ON ?auto_144250 ?auto_144251 ) ( ON ?auto_144249 ?auto_144250 ) ( ON ?auto_144248 ?auto_144249 ) ( CLEAR ?auto_144246 ) ( ON ?auto_144247 ?auto_144248 ) ( CLEAR ?auto_144247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144253 ?auto_144252 ?auto_144251 ?auto_144250 ?auto_144249 ?auto_144248 )
      ( MAKE-8PILE ?auto_144245 ?auto_144246 ?auto_144247 ?auto_144248 ?auto_144249 ?auto_144250 ?auto_144251 ?auto_144252 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144254 - BLOCK
      ?auto_144255 - BLOCK
      ?auto_144256 - BLOCK
      ?auto_144257 - BLOCK
      ?auto_144258 - BLOCK
      ?auto_144259 - BLOCK
      ?auto_144260 - BLOCK
      ?auto_144261 - BLOCK
    )
    :vars
    (
      ?auto_144262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144254 ) ( not ( = ?auto_144254 ?auto_144255 ) ) ( not ( = ?auto_144254 ?auto_144256 ) ) ( not ( = ?auto_144254 ?auto_144257 ) ) ( not ( = ?auto_144254 ?auto_144258 ) ) ( not ( = ?auto_144254 ?auto_144259 ) ) ( not ( = ?auto_144254 ?auto_144260 ) ) ( not ( = ?auto_144254 ?auto_144261 ) ) ( not ( = ?auto_144255 ?auto_144256 ) ) ( not ( = ?auto_144255 ?auto_144257 ) ) ( not ( = ?auto_144255 ?auto_144258 ) ) ( not ( = ?auto_144255 ?auto_144259 ) ) ( not ( = ?auto_144255 ?auto_144260 ) ) ( not ( = ?auto_144255 ?auto_144261 ) ) ( not ( = ?auto_144256 ?auto_144257 ) ) ( not ( = ?auto_144256 ?auto_144258 ) ) ( not ( = ?auto_144256 ?auto_144259 ) ) ( not ( = ?auto_144256 ?auto_144260 ) ) ( not ( = ?auto_144256 ?auto_144261 ) ) ( not ( = ?auto_144257 ?auto_144258 ) ) ( not ( = ?auto_144257 ?auto_144259 ) ) ( not ( = ?auto_144257 ?auto_144260 ) ) ( not ( = ?auto_144257 ?auto_144261 ) ) ( not ( = ?auto_144258 ?auto_144259 ) ) ( not ( = ?auto_144258 ?auto_144260 ) ) ( not ( = ?auto_144258 ?auto_144261 ) ) ( not ( = ?auto_144259 ?auto_144260 ) ) ( not ( = ?auto_144259 ?auto_144261 ) ) ( not ( = ?auto_144260 ?auto_144261 ) ) ( ON ?auto_144261 ?auto_144262 ) ( not ( = ?auto_144254 ?auto_144262 ) ) ( not ( = ?auto_144255 ?auto_144262 ) ) ( not ( = ?auto_144256 ?auto_144262 ) ) ( not ( = ?auto_144257 ?auto_144262 ) ) ( not ( = ?auto_144258 ?auto_144262 ) ) ( not ( = ?auto_144259 ?auto_144262 ) ) ( not ( = ?auto_144260 ?auto_144262 ) ) ( not ( = ?auto_144261 ?auto_144262 ) ) ( ON ?auto_144260 ?auto_144261 ) ( ON-TABLE ?auto_144262 ) ( ON ?auto_144259 ?auto_144260 ) ( ON ?auto_144258 ?auto_144259 ) ( ON ?auto_144257 ?auto_144258 ) ( ON ?auto_144256 ?auto_144257 ) ( CLEAR ?auto_144256 ) ( HOLDING ?auto_144255 ) ( CLEAR ?auto_144254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144254 ?auto_144255 )
      ( MAKE-8PILE ?auto_144254 ?auto_144255 ?auto_144256 ?auto_144257 ?auto_144258 ?auto_144259 ?auto_144260 ?auto_144261 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144263 - BLOCK
      ?auto_144264 - BLOCK
      ?auto_144265 - BLOCK
      ?auto_144266 - BLOCK
      ?auto_144267 - BLOCK
      ?auto_144268 - BLOCK
      ?auto_144269 - BLOCK
      ?auto_144270 - BLOCK
    )
    :vars
    (
      ?auto_144271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144263 ) ( not ( = ?auto_144263 ?auto_144264 ) ) ( not ( = ?auto_144263 ?auto_144265 ) ) ( not ( = ?auto_144263 ?auto_144266 ) ) ( not ( = ?auto_144263 ?auto_144267 ) ) ( not ( = ?auto_144263 ?auto_144268 ) ) ( not ( = ?auto_144263 ?auto_144269 ) ) ( not ( = ?auto_144263 ?auto_144270 ) ) ( not ( = ?auto_144264 ?auto_144265 ) ) ( not ( = ?auto_144264 ?auto_144266 ) ) ( not ( = ?auto_144264 ?auto_144267 ) ) ( not ( = ?auto_144264 ?auto_144268 ) ) ( not ( = ?auto_144264 ?auto_144269 ) ) ( not ( = ?auto_144264 ?auto_144270 ) ) ( not ( = ?auto_144265 ?auto_144266 ) ) ( not ( = ?auto_144265 ?auto_144267 ) ) ( not ( = ?auto_144265 ?auto_144268 ) ) ( not ( = ?auto_144265 ?auto_144269 ) ) ( not ( = ?auto_144265 ?auto_144270 ) ) ( not ( = ?auto_144266 ?auto_144267 ) ) ( not ( = ?auto_144266 ?auto_144268 ) ) ( not ( = ?auto_144266 ?auto_144269 ) ) ( not ( = ?auto_144266 ?auto_144270 ) ) ( not ( = ?auto_144267 ?auto_144268 ) ) ( not ( = ?auto_144267 ?auto_144269 ) ) ( not ( = ?auto_144267 ?auto_144270 ) ) ( not ( = ?auto_144268 ?auto_144269 ) ) ( not ( = ?auto_144268 ?auto_144270 ) ) ( not ( = ?auto_144269 ?auto_144270 ) ) ( ON ?auto_144270 ?auto_144271 ) ( not ( = ?auto_144263 ?auto_144271 ) ) ( not ( = ?auto_144264 ?auto_144271 ) ) ( not ( = ?auto_144265 ?auto_144271 ) ) ( not ( = ?auto_144266 ?auto_144271 ) ) ( not ( = ?auto_144267 ?auto_144271 ) ) ( not ( = ?auto_144268 ?auto_144271 ) ) ( not ( = ?auto_144269 ?auto_144271 ) ) ( not ( = ?auto_144270 ?auto_144271 ) ) ( ON ?auto_144269 ?auto_144270 ) ( ON-TABLE ?auto_144271 ) ( ON ?auto_144268 ?auto_144269 ) ( ON ?auto_144267 ?auto_144268 ) ( ON ?auto_144266 ?auto_144267 ) ( ON ?auto_144265 ?auto_144266 ) ( CLEAR ?auto_144263 ) ( ON ?auto_144264 ?auto_144265 ) ( CLEAR ?auto_144264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144271 ?auto_144270 ?auto_144269 ?auto_144268 ?auto_144267 ?auto_144266 ?auto_144265 )
      ( MAKE-8PILE ?auto_144263 ?auto_144264 ?auto_144265 ?auto_144266 ?auto_144267 ?auto_144268 ?auto_144269 ?auto_144270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144272 - BLOCK
      ?auto_144273 - BLOCK
      ?auto_144274 - BLOCK
      ?auto_144275 - BLOCK
      ?auto_144276 - BLOCK
      ?auto_144277 - BLOCK
      ?auto_144278 - BLOCK
      ?auto_144279 - BLOCK
    )
    :vars
    (
      ?auto_144280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144272 ?auto_144273 ) ) ( not ( = ?auto_144272 ?auto_144274 ) ) ( not ( = ?auto_144272 ?auto_144275 ) ) ( not ( = ?auto_144272 ?auto_144276 ) ) ( not ( = ?auto_144272 ?auto_144277 ) ) ( not ( = ?auto_144272 ?auto_144278 ) ) ( not ( = ?auto_144272 ?auto_144279 ) ) ( not ( = ?auto_144273 ?auto_144274 ) ) ( not ( = ?auto_144273 ?auto_144275 ) ) ( not ( = ?auto_144273 ?auto_144276 ) ) ( not ( = ?auto_144273 ?auto_144277 ) ) ( not ( = ?auto_144273 ?auto_144278 ) ) ( not ( = ?auto_144273 ?auto_144279 ) ) ( not ( = ?auto_144274 ?auto_144275 ) ) ( not ( = ?auto_144274 ?auto_144276 ) ) ( not ( = ?auto_144274 ?auto_144277 ) ) ( not ( = ?auto_144274 ?auto_144278 ) ) ( not ( = ?auto_144274 ?auto_144279 ) ) ( not ( = ?auto_144275 ?auto_144276 ) ) ( not ( = ?auto_144275 ?auto_144277 ) ) ( not ( = ?auto_144275 ?auto_144278 ) ) ( not ( = ?auto_144275 ?auto_144279 ) ) ( not ( = ?auto_144276 ?auto_144277 ) ) ( not ( = ?auto_144276 ?auto_144278 ) ) ( not ( = ?auto_144276 ?auto_144279 ) ) ( not ( = ?auto_144277 ?auto_144278 ) ) ( not ( = ?auto_144277 ?auto_144279 ) ) ( not ( = ?auto_144278 ?auto_144279 ) ) ( ON ?auto_144279 ?auto_144280 ) ( not ( = ?auto_144272 ?auto_144280 ) ) ( not ( = ?auto_144273 ?auto_144280 ) ) ( not ( = ?auto_144274 ?auto_144280 ) ) ( not ( = ?auto_144275 ?auto_144280 ) ) ( not ( = ?auto_144276 ?auto_144280 ) ) ( not ( = ?auto_144277 ?auto_144280 ) ) ( not ( = ?auto_144278 ?auto_144280 ) ) ( not ( = ?auto_144279 ?auto_144280 ) ) ( ON ?auto_144278 ?auto_144279 ) ( ON-TABLE ?auto_144280 ) ( ON ?auto_144277 ?auto_144278 ) ( ON ?auto_144276 ?auto_144277 ) ( ON ?auto_144275 ?auto_144276 ) ( ON ?auto_144274 ?auto_144275 ) ( ON ?auto_144273 ?auto_144274 ) ( CLEAR ?auto_144273 ) ( HOLDING ?auto_144272 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144272 )
      ( MAKE-8PILE ?auto_144272 ?auto_144273 ?auto_144274 ?auto_144275 ?auto_144276 ?auto_144277 ?auto_144278 ?auto_144279 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144281 - BLOCK
      ?auto_144282 - BLOCK
      ?auto_144283 - BLOCK
      ?auto_144284 - BLOCK
      ?auto_144285 - BLOCK
      ?auto_144286 - BLOCK
      ?auto_144287 - BLOCK
      ?auto_144288 - BLOCK
    )
    :vars
    (
      ?auto_144289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144281 ?auto_144282 ) ) ( not ( = ?auto_144281 ?auto_144283 ) ) ( not ( = ?auto_144281 ?auto_144284 ) ) ( not ( = ?auto_144281 ?auto_144285 ) ) ( not ( = ?auto_144281 ?auto_144286 ) ) ( not ( = ?auto_144281 ?auto_144287 ) ) ( not ( = ?auto_144281 ?auto_144288 ) ) ( not ( = ?auto_144282 ?auto_144283 ) ) ( not ( = ?auto_144282 ?auto_144284 ) ) ( not ( = ?auto_144282 ?auto_144285 ) ) ( not ( = ?auto_144282 ?auto_144286 ) ) ( not ( = ?auto_144282 ?auto_144287 ) ) ( not ( = ?auto_144282 ?auto_144288 ) ) ( not ( = ?auto_144283 ?auto_144284 ) ) ( not ( = ?auto_144283 ?auto_144285 ) ) ( not ( = ?auto_144283 ?auto_144286 ) ) ( not ( = ?auto_144283 ?auto_144287 ) ) ( not ( = ?auto_144283 ?auto_144288 ) ) ( not ( = ?auto_144284 ?auto_144285 ) ) ( not ( = ?auto_144284 ?auto_144286 ) ) ( not ( = ?auto_144284 ?auto_144287 ) ) ( not ( = ?auto_144284 ?auto_144288 ) ) ( not ( = ?auto_144285 ?auto_144286 ) ) ( not ( = ?auto_144285 ?auto_144287 ) ) ( not ( = ?auto_144285 ?auto_144288 ) ) ( not ( = ?auto_144286 ?auto_144287 ) ) ( not ( = ?auto_144286 ?auto_144288 ) ) ( not ( = ?auto_144287 ?auto_144288 ) ) ( ON ?auto_144288 ?auto_144289 ) ( not ( = ?auto_144281 ?auto_144289 ) ) ( not ( = ?auto_144282 ?auto_144289 ) ) ( not ( = ?auto_144283 ?auto_144289 ) ) ( not ( = ?auto_144284 ?auto_144289 ) ) ( not ( = ?auto_144285 ?auto_144289 ) ) ( not ( = ?auto_144286 ?auto_144289 ) ) ( not ( = ?auto_144287 ?auto_144289 ) ) ( not ( = ?auto_144288 ?auto_144289 ) ) ( ON ?auto_144287 ?auto_144288 ) ( ON-TABLE ?auto_144289 ) ( ON ?auto_144286 ?auto_144287 ) ( ON ?auto_144285 ?auto_144286 ) ( ON ?auto_144284 ?auto_144285 ) ( ON ?auto_144283 ?auto_144284 ) ( ON ?auto_144282 ?auto_144283 ) ( ON ?auto_144281 ?auto_144282 ) ( CLEAR ?auto_144281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144289 ?auto_144288 ?auto_144287 ?auto_144286 ?auto_144285 ?auto_144284 ?auto_144283 ?auto_144282 )
      ( MAKE-8PILE ?auto_144281 ?auto_144282 ?auto_144283 ?auto_144284 ?auto_144285 ?auto_144286 ?auto_144287 ?auto_144288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144426 - BLOCK
    )
    :vars
    (
      ?auto_144427 - BLOCK
      ?auto_144428 - BLOCK
      ?auto_144429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144426 ?auto_144427 ) ( CLEAR ?auto_144426 ) ( not ( = ?auto_144426 ?auto_144427 ) ) ( HOLDING ?auto_144428 ) ( CLEAR ?auto_144429 ) ( not ( = ?auto_144426 ?auto_144428 ) ) ( not ( = ?auto_144426 ?auto_144429 ) ) ( not ( = ?auto_144427 ?auto_144428 ) ) ( not ( = ?auto_144427 ?auto_144429 ) ) ( not ( = ?auto_144428 ?auto_144429 ) ) )
    :subtasks
    ( ( !STACK ?auto_144428 ?auto_144429 )
      ( MAKE-1PILE ?auto_144426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144430 - BLOCK
    )
    :vars
    (
      ?auto_144432 - BLOCK
      ?auto_144431 - BLOCK
      ?auto_144433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144430 ?auto_144432 ) ( not ( = ?auto_144430 ?auto_144432 ) ) ( CLEAR ?auto_144431 ) ( not ( = ?auto_144430 ?auto_144433 ) ) ( not ( = ?auto_144430 ?auto_144431 ) ) ( not ( = ?auto_144432 ?auto_144433 ) ) ( not ( = ?auto_144432 ?auto_144431 ) ) ( not ( = ?auto_144433 ?auto_144431 ) ) ( ON ?auto_144433 ?auto_144430 ) ( CLEAR ?auto_144433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144432 ?auto_144430 )
      ( MAKE-1PILE ?auto_144430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144434 - BLOCK
    )
    :vars
    (
      ?auto_144436 - BLOCK
      ?auto_144437 - BLOCK
      ?auto_144435 - BLOCK
      ?auto_144441 - BLOCK
      ?auto_144440 - BLOCK
      ?auto_144442 - BLOCK
      ?auto_144439 - BLOCK
      ?auto_144438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144434 ?auto_144436 ) ( not ( = ?auto_144434 ?auto_144436 ) ) ( not ( = ?auto_144434 ?auto_144437 ) ) ( not ( = ?auto_144434 ?auto_144435 ) ) ( not ( = ?auto_144436 ?auto_144437 ) ) ( not ( = ?auto_144436 ?auto_144435 ) ) ( not ( = ?auto_144437 ?auto_144435 ) ) ( ON ?auto_144437 ?auto_144434 ) ( CLEAR ?auto_144437 ) ( ON-TABLE ?auto_144436 ) ( HOLDING ?auto_144435 ) ( CLEAR ?auto_144441 ) ( ON-TABLE ?auto_144440 ) ( ON ?auto_144442 ?auto_144440 ) ( ON ?auto_144439 ?auto_144442 ) ( ON ?auto_144438 ?auto_144439 ) ( ON ?auto_144441 ?auto_144438 ) ( not ( = ?auto_144440 ?auto_144442 ) ) ( not ( = ?auto_144440 ?auto_144439 ) ) ( not ( = ?auto_144440 ?auto_144438 ) ) ( not ( = ?auto_144440 ?auto_144441 ) ) ( not ( = ?auto_144440 ?auto_144435 ) ) ( not ( = ?auto_144442 ?auto_144439 ) ) ( not ( = ?auto_144442 ?auto_144438 ) ) ( not ( = ?auto_144442 ?auto_144441 ) ) ( not ( = ?auto_144442 ?auto_144435 ) ) ( not ( = ?auto_144439 ?auto_144438 ) ) ( not ( = ?auto_144439 ?auto_144441 ) ) ( not ( = ?auto_144439 ?auto_144435 ) ) ( not ( = ?auto_144438 ?auto_144441 ) ) ( not ( = ?auto_144438 ?auto_144435 ) ) ( not ( = ?auto_144441 ?auto_144435 ) ) ( not ( = ?auto_144434 ?auto_144441 ) ) ( not ( = ?auto_144434 ?auto_144440 ) ) ( not ( = ?auto_144434 ?auto_144442 ) ) ( not ( = ?auto_144434 ?auto_144439 ) ) ( not ( = ?auto_144434 ?auto_144438 ) ) ( not ( = ?auto_144436 ?auto_144441 ) ) ( not ( = ?auto_144436 ?auto_144440 ) ) ( not ( = ?auto_144436 ?auto_144442 ) ) ( not ( = ?auto_144436 ?auto_144439 ) ) ( not ( = ?auto_144436 ?auto_144438 ) ) ( not ( = ?auto_144437 ?auto_144441 ) ) ( not ( = ?auto_144437 ?auto_144440 ) ) ( not ( = ?auto_144437 ?auto_144442 ) ) ( not ( = ?auto_144437 ?auto_144439 ) ) ( not ( = ?auto_144437 ?auto_144438 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144440 ?auto_144442 ?auto_144439 ?auto_144438 ?auto_144441 ?auto_144435 )
      ( MAKE-1PILE ?auto_144434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144443 - BLOCK
    )
    :vars
    (
      ?auto_144450 - BLOCK
      ?auto_144444 - BLOCK
      ?auto_144448 - BLOCK
      ?auto_144447 - BLOCK
      ?auto_144445 - BLOCK
      ?auto_144446 - BLOCK
      ?auto_144451 - BLOCK
      ?auto_144449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144443 ?auto_144450 ) ( not ( = ?auto_144443 ?auto_144450 ) ) ( not ( = ?auto_144443 ?auto_144444 ) ) ( not ( = ?auto_144443 ?auto_144448 ) ) ( not ( = ?auto_144450 ?auto_144444 ) ) ( not ( = ?auto_144450 ?auto_144448 ) ) ( not ( = ?auto_144444 ?auto_144448 ) ) ( ON ?auto_144444 ?auto_144443 ) ( ON-TABLE ?auto_144450 ) ( CLEAR ?auto_144447 ) ( ON-TABLE ?auto_144445 ) ( ON ?auto_144446 ?auto_144445 ) ( ON ?auto_144451 ?auto_144446 ) ( ON ?auto_144449 ?auto_144451 ) ( ON ?auto_144447 ?auto_144449 ) ( not ( = ?auto_144445 ?auto_144446 ) ) ( not ( = ?auto_144445 ?auto_144451 ) ) ( not ( = ?auto_144445 ?auto_144449 ) ) ( not ( = ?auto_144445 ?auto_144447 ) ) ( not ( = ?auto_144445 ?auto_144448 ) ) ( not ( = ?auto_144446 ?auto_144451 ) ) ( not ( = ?auto_144446 ?auto_144449 ) ) ( not ( = ?auto_144446 ?auto_144447 ) ) ( not ( = ?auto_144446 ?auto_144448 ) ) ( not ( = ?auto_144451 ?auto_144449 ) ) ( not ( = ?auto_144451 ?auto_144447 ) ) ( not ( = ?auto_144451 ?auto_144448 ) ) ( not ( = ?auto_144449 ?auto_144447 ) ) ( not ( = ?auto_144449 ?auto_144448 ) ) ( not ( = ?auto_144447 ?auto_144448 ) ) ( not ( = ?auto_144443 ?auto_144447 ) ) ( not ( = ?auto_144443 ?auto_144445 ) ) ( not ( = ?auto_144443 ?auto_144446 ) ) ( not ( = ?auto_144443 ?auto_144451 ) ) ( not ( = ?auto_144443 ?auto_144449 ) ) ( not ( = ?auto_144450 ?auto_144447 ) ) ( not ( = ?auto_144450 ?auto_144445 ) ) ( not ( = ?auto_144450 ?auto_144446 ) ) ( not ( = ?auto_144450 ?auto_144451 ) ) ( not ( = ?auto_144450 ?auto_144449 ) ) ( not ( = ?auto_144444 ?auto_144447 ) ) ( not ( = ?auto_144444 ?auto_144445 ) ) ( not ( = ?auto_144444 ?auto_144446 ) ) ( not ( = ?auto_144444 ?auto_144451 ) ) ( not ( = ?auto_144444 ?auto_144449 ) ) ( ON ?auto_144448 ?auto_144444 ) ( CLEAR ?auto_144448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144450 ?auto_144443 ?auto_144444 )
      ( MAKE-1PILE ?auto_144443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144452 - BLOCK
    )
    :vars
    (
      ?auto_144456 - BLOCK
      ?auto_144460 - BLOCK
      ?auto_144455 - BLOCK
      ?auto_144454 - BLOCK
      ?auto_144459 - BLOCK
      ?auto_144457 - BLOCK
      ?auto_144458 - BLOCK
      ?auto_144453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144452 ?auto_144456 ) ( not ( = ?auto_144452 ?auto_144456 ) ) ( not ( = ?auto_144452 ?auto_144460 ) ) ( not ( = ?auto_144452 ?auto_144455 ) ) ( not ( = ?auto_144456 ?auto_144460 ) ) ( not ( = ?auto_144456 ?auto_144455 ) ) ( not ( = ?auto_144460 ?auto_144455 ) ) ( ON ?auto_144460 ?auto_144452 ) ( ON-TABLE ?auto_144456 ) ( ON-TABLE ?auto_144454 ) ( ON ?auto_144459 ?auto_144454 ) ( ON ?auto_144457 ?auto_144459 ) ( ON ?auto_144458 ?auto_144457 ) ( not ( = ?auto_144454 ?auto_144459 ) ) ( not ( = ?auto_144454 ?auto_144457 ) ) ( not ( = ?auto_144454 ?auto_144458 ) ) ( not ( = ?auto_144454 ?auto_144453 ) ) ( not ( = ?auto_144454 ?auto_144455 ) ) ( not ( = ?auto_144459 ?auto_144457 ) ) ( not ( = ?auto_144459 ?auto_144458 ) ) ( not ( = ?auto_144459 ?auto_144453 ) ) ( not ( = ?auto_144459 ?auto_144455 ) ) ( not ( = ?auto_144457 ?auto_144458 ) ) ( not ( = ?auto_144457 ?auto_144453 ) ) ( not ( = ?auto_144457 ?auto_144455 ) ) ( not ( = ?auto_144458 ?auto_144453 ) ) ( not ( = ?auto_144458 ?auto_144455 ) ) ( not ( = ?auto_144453 ?auto_144455 ) ) ( not ( = ?auto_144452 ?auto_144453 ) ) ( not ( = ?auto_144452 ?auto_144454 ) ) ( not ( = ?auto_144452 ?auto_144459 ) ) ( not ( = ?auto_144452 ?auto_144457 ) ) ( not ( = ?auto_144452 ?auto_144458 ) ) ( not ( = ?auto_144456 ?auto_144453 ) ) ( not ( = ?auto_144456 ?auto_144454 ) ) ( not ( = ?auto_144456 ?auto_144459 ) ) ( not ( = ?auto_144456 ?auto_144457 ) ) ( not ( = ?auto_144456 ?auto_144458 ) ) ( not ( = ?auto_144460 ?auto_144453 ) ) ( not ( = ?auto_144460 ?auto_144454 ) ) ( not ( = ?auto_144460 ?auto_144459 ) ) ( not ( = ?auto_144460 ?auto_144457 ) ) ( not ( = ?auto_144460 ?auto_144458 ) ) ( ON ?auto_144455 ?auto_144460 ) ( CLEAR ?auto_144455 ) ( HOLDING ?auto_144453 ) ( CLEAR ?auto_144458 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144454 ?auto_144459 ?auto_144457 ?auto_144458 ?auto_144453 )
      ( MAKE-1PILE ?auto_144452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144461 - BLOCK
    )
    :vars
    (
      ?auto_144463 - BLOCK
      ?auto_144469 - BLOCK
      ?auto_144468 - BLOCK
      ?auto_144462 - BLOCK
      ?auto_144464 - BLOCK
      ?auto_144465 - BLOCK
      ?auto_144466 - BLOCK
      ?auto_144467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144461 ?auto_144463 ) ( not ( = ?auto_144461 ?auto_144463 ) ) ( not ( = ?auto_144461 ?auto_144469 ) ) ( not ( = ?auto_144461 ?auto_144468 ) ) ( not ( = ?auto_144463 ?auto_144469 ) ) ( not ( = ?auto_144463 ?auto_144468 ) ) ( not ( = ?auto_144469 ?auto_144468 ) ) ( ON ?auto_144469 ?auto_144461 ) ( ON-TABLE ?auto_144463 ) ( ON-TABLE ?auto_144462 ) ( ON ?auto_144464 ?auto_144462 ) ( ON ?auto_144465 ?auto_144464 ) ( ON ?auto_144466 ?auto_144465 ) ( not ( = ?auto_144462 ?auto_144464 ) ) ( not ( = ?auto_144462 ?auto_144465 ) ) ( not ( = ?auto_144462 ?auto_144466 ) ) ( not ( = ?auto_144462 ?auto_144467 ) ) ( not ( = ?auto_144462 ?auto_144468 ) ) ( not ( = ?auto_144464 ?auto_144465 ) ) ( not ( = ?auto_144464 ?auto_144466 ) ) ( not ( = ?auto_144464 ?auto_144467 ) ) ( not ( = ?auto_144464 ?auto_144468 ) ) ( not ( = ?auto_144465 ?auto_144466 ) ) ( not ( = ?auto_144465 ?auto_144467 ) ) ( not ( = ?auto_144465 ?auto_144468 ) ) ( not ( = ?auto_144466 ?auto_144467 ) ) ( not ( = ?auto_144466 ?auto_144468 ) ) ( not ( = ?auto_144467 ?auto_144468 ) ) ( not ( = ?auto_144461 ?auto_144467 ) ) ( not ( = ?auto_144461 ?auto_144462 ) ) ( not ( = ?auto_144461 ?auto_144464 ) ) ( not ( = ?auto_144461 ?auto_144465 ) ) ( not ( = ?auto_144461 ?auto_144466 ) ) ( not ( = ?auto_144463 ?auto_144467 ) ) ( not ( = ?auto_144463 ?auto_144462 ) ) ( not ( = ?auto_144463 ?auto_144464 ) ) ( not ( = ?auto_144463 ?auto_144465 ) ) ( not ( = ?auto_144463 ?auto_144466 ) ) ( not ( = ?auto_144469 ?auto_144467 ) ) ( not ( = ?auto_144469 ?auto_144462 ) ) ( not ( = ?auto_144469 ?auto_144464 ) ) ( not ( = ?auto_144469 ?auto_144465 ) ) ( not ( = ?auto_144469 ?auto_144466 ) ) ( ON ?auto_144468 ?auto_144469 ) ( CLEAR ?auto_144466 ) ( ON ?auto_144467 ?auto_144468 ) ( CLEAR ?auto_144467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144463 ?auto_144461 ?auto_144469 ?auto_144468 )
      ( MAKE-1PILE ?auto_144461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144470 - BLOCK
    )
    :vars
    (
      ?auto_144476 - BLOCK
      ?auto_144477 - BLOCK
      ?auto_144475 - BLOCK
      ?auto_144471 - BLOCK
      ?auto_144472 - BLOCK
      ?auto_144474 - BLOCK
      ?auto_144478 - BLOCK
      ?auto_144473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144470 ?auto_144476 ) ( not ( = ?auto_144470 ?auto_144476 ) ) ( not ( = ?auto_144470 ?auto_144477 ) ) ( not ( = ?auto_144470 ?auto_144475 ) ) ( not ( = ?auto_144476 ?auto_144477 ) ) ( not ( = ?auto_144476 ?auto_144475 ) ) ( not ( = ?auto_144477 ?auto_144475 ) ) ( ON ?auto_144477 ?auto_144470 ) ( ON-TABLE ?auto_144476 ) ( ON-TABLE ?auto_144471 ) ( ON ?auto_144472 ?auto_144471 ) ( ON ?auto_144474 ?auto_144472 ) ( not ( = ?auto_144471 ?auto_144472 ) ) ( not ( = ?auto_144471 ?auto_144474 ) ) ( not ( = ?auto_144471 ?auto_144478 ) ) ( not ( = ?auto_144471 ?auto_144473 ) ) ( not ( = ?auto_144471 ?auto_144475 ) ) ( not ( = ?auto_144472 ?auto_144474 ) ) ( not ( = ?auto_144472 ?auto_144478 ) ) ( not ( = ?auto_144472 ?auto_144473 ) ) ( not ( = ?auto_144472 ?auto_144475 ) ) ( not ( = ?auto_144474 ?auto_144478 ) ) ( not ( = ?auto_144474 ?auto_144473 ) ) ( not ( = ?auto_144474 ?auto_144475 ) ) ( not ( = ?auto_144478 ?auto_144473 ) ) ( not ( = ?auto_144478 ?auto_144475 ) ) ( not ( = ?auto_144473 ?auto_144475 ) ) ( not ( = ?auto_144470 ?auto_144473 ) ) ( not ( = ?auto_144470 ?auto_144471 ) ) ( not ( = ?auto_144470 ?auto_144472 ) ) ( not ( = ?auto_144470 ?auto_144474 ) ) ( not ( = ?auto_144470 ?auto_144478 ) ) ( not ( = ?auto_144476 ?auto_144473 ) ) ( not ( = ?auto_144476 ?auto_144471 ) ) ( not ( = ?auto_144476 ?auto_144472 ) ) ( not ( = ?auto_144476 ?auto_144474 ) ) ( not ( = ?auto_144476 ?auto_144478 ) ) ( not ( = ?auto_144477 ?auto_144473 ) ) ( not ( = ?auto_144477 ?auto_144471 ) ) ( not ( = ?auto_144477 ?auto_144472 ) ) ( not ( = ?auto_144477 ?auto_144474 ) ) ( not ( = ?auto_144477 ?auto_144478 ) ) ( ON ?auto_144475 ?auto_144477 ) ( ON ?auto_144473 ?auto_144475 ) ( CLEAR ?auto_144473 ) ( HOLDING ?auto_144478 ) ( CLEAR ?auto_144474 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144471 ?auto_144472 ?auto_144474 ?auto_144478 )
      ( MAKE-1PILE ?auto_144470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144479 - BLOCK
    )
    :vars
    (
      ?auto_144483 - BLOCK
      ?auto_144480 - BLOCK
      ?auto_144484 - BLOCK
      ?auto_144482 - BLOCK
      ?auto_144486 - BLOCK
      ?auto_144487 - BLOCK
      ?auto_144485 - BLOCK
      ?auto_144481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144479 ?auto_144483 ) ( not ( = ?auto_144479 ?auto_144483 ) ) ( not ( = ?auto_144479 ?auto_144480 ) ) ( not ( = ?auto_144479 ?auto_144484 ) ) ( not ( = ?auto_144483 ?auto_144480 ) ) ( not ( = ?auto_144483 ?auto_144484 ) ) ( not ( = ?auto_144480 ?auto_144484 ) ) ( ON ?auto_144480 ?auto_144479 ) ( ON-TABLE ?auto_144483 ) ( ON-TABLE ?auto_144482 ) ( ON ?auto_144486 ?auto_144482 ) ( ON ?auto_144487 ?auto_144486 ) ( not ( = ?auto_144482 ?auto_144486 ) ) ( not ( = ?auto_144482 ?auto_144487 ) ) ( not ( = ?auto_144482 ?auto_144485 ) ) ( not ( = ?auto_144482 ?auto_144481 ) ) ( not ( = ?auto_144482 ?auto_144484 ) ) ( not ( = ?auto_144486 ?auto_144487 ) ) ( not ( = ?auto_144486 ?auto_144485 ) ) ( not ( = ?auto_144486 ?auto_144481 ) ) ( not ( = ?auto_144486 ?auto_144484 ) ) ( not ( = ?auto_144487 ?auto_144485 ) ) ( not ( = ?auto_144487 ?auto_144481 ) ) ( not ( = ?auto_144487 ?auto_144484 ) ) ( not ( = ?auto_144485 ?auto_144481 ) ) ( not ( = ?auto_144485 ?auto_144484 ) ) ( not ( = ?auto_144481 ?auto_144484 ) ) ( not ( = ?auto_144479 ?auto_144481 ) ) ( not ( = ?auto_144479 ?auto_144482 ) ) ( not ( = ?auto_144479 ?auto_144486 ) ) ( not ( = ?auto_144479 ?auto_144487 ) ) ( not ( = ?auto_144479 ?auto_144485 ) ) ( not ( = ?auto_144483 ?auto_144481 ) ) ( not ( = ?auto_144483 ?auto_144482 ) ) ( not ( = ?auto_144483 ?auto_144486 ) ) ( not ( = ?auto_144483 ?auto_144487 ) ) ( not ( = ?auto_144483 ?auto_144485 ) ) ( not ( = ?auto_144480 ?auto_144481 ) ) ( not ( = ?auto_144480 ?auto_144482 ) ) ( not ( = ?auto_144480 ?auto_144486 ) ) ( not ( = ?auto_144480 ?auto_144487 ) ) ( not ( = ?auto_144480 ?auto_144485 ) ) ( ON ?auto_144484 ?auto_144480 ) ( ON ?auto_144481 ?auto_144484 ) ( CLEAR ?auto_144487 ) ( ON ?auto_144485 ?auto_144481 ) ( CLEAR ?auto_144485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144483 ?auto_144479 ?auto_144480 ?auto_144484 ?auto_144481 )
      ( MAKE-1PILE ?auto_144479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144488 - BLOCK
    )
    :vars
    (
      ?auto_144494 - BLOCK
      ?auto_144493 - BLOCK
      ?auto_144496 - BLOCK
      ?auto_144489 - BLOCK
      ?auto_144490 - BLOCK
      ?auto_144491 - BLOCK
      ?auto_144495 - BLOCK
      ?auto_144492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144488 ?auto_144494 ) ( not ( = ?auto_144488 ?auto_144494 ) ) ( not ( = ?auto_144488 ?auto_144493 ) ) ( not ( = ?auto_144488 ?auto_144496 ) ) ( not ( = ?auto_144494 ?auto_144493 ) ) ( not ( = ?auto_144494 ?auto_144496 ) ) ( not ( = ?auto_144493 ?auto_144496 ) ) ( ON ?auto_144493 ?auto_144488 ) ( ON-TABLE ?auto_144494 ) ( ON-TABLE ?auto_144489 ) ( ON ?auto_144490 ?auto_144489 ) ( not ( = ?auto_144489 ?auto_144490 ) ) ( not ( = ?auto_144489 ?auto_144491 ) ) ( not ( = ?auto_144489 ?auto_144495 ) ) ( not ( = ?auto_144489 ?auto_144492 ) ) ( not ( = ?auto_144489 ?auto_144496 ) ) ( not ( = ?auto_144490 ?auto_144491 ) ) ( not ( = ?auto_144490 ?auto_144495 ) ) ( not ( = ?auto_144490 ?auto_144492 ) ) ( not ( = ?auto_144490 ?auto_144496 ) ) ( not ( = ?auto_144491 ?auto_144495 ) ) ( not ( = ?auto_144491 ?auto_144492 ) ) ( not ( = ?auto_144491 ?auto_144496 ) ) ( not ( = ?auto_144495 ?auto_144492 ) ) ( not ( = ?auto_144495 ?auto_144496 ) ) ( not ( = ?auto_144492 ?auto_144496 ) ) ( not ( = ?auto_144488 ?auto_144492 ) ) ( not ( = ?auto_144488 ?auto_144489 ) ) ( not ( = ?auto_144488 ?auto_144490 ) ) ( not ( = ?auto_144488 ?auto_144491 ) ) ( not ( = ?auto_144488 ?auto_144495 ) ) ( not ( = ?auto_144494 ?auto_144492 ) ) ( not ( = ?auto_144494 ?auto_144489 ) ) ( not ( = ?auto_144494 ?auto_144490 ) ) ( not ( = ?auto_144494 ?auto_144491 ) ) ( not ( = ?auto_144494 ?auto_144495 ) ) ( not ( = ?auto_144493 ?auto_144492 ) ) ( not ( = ?auto_144493 ?auto_144489 ) ) ( not ( = ?auto_144493 ?auto_144490 ) ) ( not ( = ?auto_144493 ?auto_144491 ) ) ( not ( = ?auto_144493 ?auto_144495 ) ) ( ON ?auto_144496 ?auto_144493 ) ( ON ?auto_144492 ?auto_144496 ) ( ON ?auto_144495 ?auto_144492 ) ( CLEAR ?auto_144495 ) ( HOLDING ?auto_144491 ) ( CLEAR ?auto_144490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144489 ?auto_144490 ?auto_144491 )
      ( MAKE-1PILE ?auto_144488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144497 - BLOCK
    )
    :vars
    (
      ?auto_144500 - BLOCK
      ?auto_144504 - BLOCK
      ?auto_144499 - BLOCK
      ?auto_144505 - BLOCK
      ?auto_144498 - BLOCK
      ?auto_144503 - BLOCK
      ?auto_144502 - BLOCK
      ?auto_144501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144497 ?auto_144500 ) ( not ( = ?auto_144497 ?auto_144500 ) ) ( not ( = ?auto_144497 ?auto_144504 ) ) ( not ( = ?auto_144497 ?auto_144499 ) ) ( not ( = ?auto_144500 ?auto_144504 ) ) ( not ( = ?auto_144500 ?auto_144499 ) ) ( not ( = ?auto_144504 ?auto_144499 ) ) ( ON ?auto_144504 ?auto_144497 ) ( ON-TABLE ?auto_144500 ) ( ON-TABLE ?auto_144505 ) ( ON ?auto_144498 ?auto_144505 ) ( not ( = ?auto_144505 ?auto_144498 ) ) ( not ( = ?auto_144505 ?auto_144503 ) ) ( not ( = ?auto_144505 ?auto_144502 ) ) ( not ( = ?auto_144505 ?auto_144501 ) ) ( not ( = ?auto_144505 ?auto_144499 ) ) ( not ( = ?auto_144498 ?auto_144503 ) ) ( not ( = ?auto_144498 ?auto_144502 ) ) ( not ( = ?auto_144498 ?auto_144501 ) ) ( not ( = ?auto_144498 ?auto_144499 ) ) ( not ( = ?auto_144503 ?auto_144502 ) ) ( not ( = ?auto_144503 ?auto_144501 ) ) ( not ( = ?auto_144503 ?auto_144499 ) ) ( not ( = ?auto_144502 ?auto_144501 ) ) ( not ( = ?auto_144502 ?auto_144499 ) ) ( not ( = ?auto_144501 ?auto_144499 ) ) ( not ( = ?auto_144497 ?auto_144501 ) ) ( not ( = ?auto_144497 ?auto_144505 ) ) ( not ( = ?auto_144497 ?auto_144498 ) ) ( not ( = ?auto_144497 ?auto_144503 ) ) ( not ( = ?auto_144497 ?auto_144502 ) ) ( not ( = ?auto_144500 ?auto_144501 ) ) ( not ( = ?auto_144500 ?auto_144505 ) ) ( not ( = ?auto_144500 ?auto_144498 ) ) ( not ( = ?auto_144500 ?auto_144503 ) ) ( not ( = ?auto_144500 ?auto_144502 ) ) ( not ( = ?auto_144504 ?auto_144501 ) ) ( not ( = ?auto_144504 ?auto_144505 ) ) ( not ( = ?auto_144504 ?auto_144498 ) ) ( not ( = ?auto_144504 ?auto_144503 ) ) ( not ( = ?auto_144504 ?auto_144502 ) ) ( ON ?auto_144499 ?auto_144504 ) ( ON ?auto_144501 ?auto_144499 ) ( ON ?auto_144502 ?auto_144501 ) ( CLEAR ?auto_144498 ) ( ON ?auto_144503 ?auto_144502 ) ( CLEAR ?auto_144503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144500 ?auto_144497 ?auto_144504 ?auto_144499 ?auto_144501 ?auto_144502 )
      ( MAKE-1PILE ?auto_144497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144506 - BLOCK
    )
    :vars
    (
      ?auto_144510 - BLOCK
      ?auto_144512 - BLOCK
      ?auto_144507 - BLOCK
      ?auto_144508 - BLOCK
      ?auto_144513 - BLOCK
      ?auto_144511 - BLOCK
      ?auto_144509 - BLOCK
      ?auto_144514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144506 ?auto_144510 ) ( not ( = ?auto_144506 ?auto_144510 ) ) ( not ( = ?auto_144506 ?auto_144512 ) ) ( not ( = ?auto_144506 ?auto_144507 ) ) ( not ( = ?auto_144510 ?auto_144512 ) ) ( not ( = ?auto_144510 ?auto_144507 ) ) ( not ( = ?auto_144512 ?auto_144507 ) ) ( ON ?auto_144512 ?auto_144506 ) ( ON-TABLE ?auto_144510 ) ( ON-TABLE ?auto_144508 ) ( not ( = ?auto_144508 ?auto_144513 ) ) ( not ( = ?auto_144508 ?auto_144511 ) ) ( not ( = ?auto_144508 ?auto_144509 ) ) ( not ( = ?auto_144508 ?auto_144514 ) ) ( not ( = ?auto_144508 ?auto_144507 ) ) ( not ( = ?auto_144513 ?auto_144511 ) ) ( not ( = ?auto_144513 ?auto_144509 ) ) ( not ( = ?auto_144513 ?auto_144514 ) ) ( not ( = ?auto_144513 ?auto_144507 ) ) ( not ( = ?auto_144511 ?auto_144509 ) ) ( not ( = ?auto_144511 ?auto_144514 ) ) ( not ( = ?auto_144511 ?auto_144507 ) ) ( not ( = ?auto_144509 ?auto_144514 ) ) ( not ( = ?auto_144509 ?auto_144507 ) ) ( not ( = ?auto_144514 ?auto_144507 ) ) ( not ( = ?auto_144506 ?auto_144514 ) ) ( not ( = ?auto_144506 ?auto_144508 ) ) ( not ( = ?auto_144506 ?auto_144513 ) ) ( not ( = ?auto_144506 ?auto_144511 ) ) ( not ( = ?auto_144506 ?auto_144509 ) ) ( not ( = ?auto_144510 ?auto_144514 ) ) ( not ( = ?auto_144510 ?auto_144508 ) ) ( not ( = ?auto_144510 ?auto_144513 ) ) ( not ( = ?auto_144510 ?auto_144511 ) ) ( not ( = ?auto_144510 ?auto_144509 ) ) ( not ( = ?auto_144512 ?auto_144514 ) ) ( not ( = ?auto_144512 ?auto_144508 ) ) ( not ( = ?auto_144512 ?auto_144513 ) ) ( not ( = ?auto_144512 ?auto_144511 ) ) ( not ( = ?auto_144512 ?auto_144509 ) ) ( ON ?auto_144507 ?auto_144512 ) ( ON ?auto_144514 ?auto_144507 ) ( ON ?auto_144509 ?auto_144514 ) ( ON ?auto_144511 ?auto_144509 ) ( CLEAR ?auto_144511 ) ( HOLDING ?auto_144513 ) ( CLEAR ?auto_144508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144508 ?auto_144513 )
      ( MAKE-1PILE ?auto_144506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144515 - BLOCK
    )
    :vars
    (
      ?auto_144518 - BLOCK
      ?auto_144523 - BLOCK
      ?auto_144522 - BLOCK
      ?auto_144521 - BLOCK
      ?auto_144516 - BLOCK
      ?auto_144519 - BLOCK
      ?auto_144520 - BLOCK
      ?auto_144517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144515 ?auto_144518 ) ( not ( = ?auto_144515 ?auto_144518 ) ) ( not ( = ?auto_144515 ?auto_144523 ) ) ( not ( = ?auto_144515 ?auto_144522 ) ) ( not ( = ?auto_144518 ?auto_144523 ) ) ( not ( = ?auto_144518 ?auto_144522 ) ) ( not ( = ?auto_144523 ?auto_144522 ) ) ( ON ?auto_144523 ?auto_144515 ) ( ON-TABLE ?auto_144518 ) ( ON-TABLE ?auto_144521 ) ( not ( = ?auto_144521 ?auto_144516 ) ) ( not ( = ?auto_144521 ?auto_144519 ) ) ( not ( = ?auto_144521 ?auto_144520 ) ) ( not ( = ?auto_144521 ?auto_144517 ) ) ( not ( = ?auto_144521 ?auto_144522 ) ) ( not ( = ?auto_144516 ?auto_144519 ) ) ( not ( = ?auto_144516 ?auto_144520 ) ) ( not ( = ?auto_144516 ?auto_144517 ) ) ( not ( = ?auto_144516 ?auto_144522 ) ) ( not ( = ?auto_144519 ?auto_144520 ) ) ( not ( = ?auto_144519 ?auto_144517 ) ) ( not ( = ?auto_144519 ?auto_144522 ) ) ( not ( = ?auto_144520 ?auto_144517 ) ) ( not ( = ?auto_144520 ?auto_144522 ) ) ( not ( = ?auto_144517 ?auto_144522 ) ) ( not ( = ?auto_144515 ?auto_144517 ) ) ( not ( = ?auto_144515 ?auto_144521 ) ) ( not ( = ?auto_144515 ?auto_144516 ) ) ( not ( = ?auto_144515 ?auto_144519 ) ) ( not ( = ?auto_144515 ?auto_144520 ) ) ( not ( = ?auto_144518 ?auto_144517 ) ) ( not ( = ?auto_144518 ?auto_144521 ) ) ( not ( = ?auto_144518 ?auto_144516 ) ) ( not ( = ?auto_144518 ?auto_144519 ) ) ( not ( = ?auto_144518 ?auto_144520 ) ) ( not ( = ?auto_144523 ?auto_144517 ) ) ( not ( = ?auto_144523 ?auto_144521 ) ) ( not ( = ?auto_144523 ?auto_144516 ) ) ( not ( = ?auto_144523 ?auto_144519 ) ) ( not ( = ?auto_144523 ?auto_144520 ) ) ( ON ?auto_144522 ?auto_144523 ) ( ON ?auto_144517 ?auto_144522 ) ( ON ?auto_144520 ?auto_144517 ) ( ON ?auto_144519 ?auto_144520 ) ( CLEAR ?auto_144521 ) ( ON ?auto_144516 ?auto_144519 ) ( CLEAR ?auto_144516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144518 ?auto_144515 ?auto_144523 ?auto_144522 ?auto_144517 ?auto_144520 ?auto_144519 )
      ( MAKE-1PILE ?auto_144515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144524 - BLOCK
    )
    :vars
    (
      ?auto_144525 - BLOCK
      ?auto_144528 - BLOCK
      ?auto_144526 - BLOCK
      ?auto_144527 - BLOCK
      ?auto_144529 - BLOCK
      ?auto_144532 - BLOCK
      ?auto_144530 - BLOCK
      ?auto_144531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144524 ?auto_144525 ) ( not ( = ?auto_144524 ?auto_144525 ) ) ( not ( = ?auto_144524 ?auto_144528 ) ) ( not ( = ?auto_144524 ?auto_144526 ) ) ( not ( = ?auto_144525 ?auto_144528 ) ) ( not ( = ?auto_144525 ?auto_144526 ) ) ( not ( = ?auto_144528 ?auto_144526 ) ) ( ON ?auto_144528 ?auto_144524 ) ( ON-TABLE ?auto_144525 ) ( not ( = ?auto_144527 ?auto_144529 ) ) ( not ( = ?auto_144527 ?auto_144532 ) ) ( not ( = ?auto_144527 ?auto_144530 ) ) ( not ( = ?auto_144527 ?auto_144531 ) ) ( not ( = ?auto_144527 ?auto_144526 ) ) ( not ( = ?auto_144529 ?auto_144532 ) ) ( not ( = ?auto_144529 ?auto_144530 ) ) ( not ( = ?auto_144529 ?auto_144531 ) ) ( not ( = ?auto_144529 ?auto_144526 ) ) ( not ( = ?auto_144532 ?auto_144530 ) ) ( not ( = ?auto_144532 ?auto_144531 ) ) ( not ( = ?auto_144532 ?auto_144526 ) ) ( not ( = ?auto_144530 ?auto_144531 ) ) ( not ( = ?auto_144530 ?auto_144526 ) ) ( not ( = ?auto_144531 ?auto_144526 ) ) ( not ( = ?auto_144524 ?auto_144531 ) ) ( not ( = ?auto_144524 ?auto_144527 ) ) ( not ( = ?auto_144524 ?auto_144529 ) ) ( not ( = ?auto_144524 ?auto_144532 ) ) ( not ( = ?auto_144524 ?auto_144530 ) ) ( not ( = ?auto_144525 ?auto_144531 ) ) ( not ( = ?auto_144525 ?auto_144527 ) ) ( not ( = ?auto_144525 ?auto_144529 ) ) ( not ( = ?auto_144525 ?auto_144532 ) ) ( not ( = ?auto_144525 ?auto_144530 ) ) ( not ( = ?auto_144528 ?auto_144531 ) ) ( not ( = ?auto_144528 ?auto_144527 ) ) ( not ( = ?auto_144528 ?auto_144529 ) ) ( not ( = ?auto_144528 ?auto_144532 ) ) ( not ( = ?auto_144528 ?auto_144530 ) ) ( ON ?auto_144526 ?auto_144528 ) ( ON ?auto_144531 ?auto_144526 ) ( ON ?auto_144530 ?auto_144531 ) ( ON ?auto_144532 ?auto_144530 ) ( ON ?auto_144529 ?auto_144532 ) ( CLEAR ?auto_144529 ) ( HOLDING ?auto_144527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144527 )
      ( MAKE-1PILE ?auto_144524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144533 - BLOCK
    )
    :vars
    (
      ?auto_144537 - BLOCK
      ?auto_144538 - BLOCK
      ?auto_144539 - BLOCK
      ?auto_144535 - BLOCK
      ?auto_144534 - BLOCK
      ?auto_144540 - BLOCK
      ?auto_144536 - BLOCK
      ?auto_144541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144533 ?auto_144537 ) ( not ( = ?auto_144533 ?auto_144537 ) ) ( not ( = ?auto_144533 ?auto_144538 ) ) ( not ( = ?auto_144533 ?auto_144539 ) ) ( not ( = ?auto_144537 ?auto_144538 ) ) ( not ( = ?auto_144537 ?auto_144539 ) ) ( not ( = ?auto_144538 ?auto_144539 ) ) ( ON ?auto_144538 ?auto_144533 ) ( ON-TABLE ?auto_144537 ) ( not ( = ?auto_144535 ?auto_144534 ) ) ( not ( = ?auto_144535 ?auto_144540 ) ) ( not ( = ?auto_144535 ?auto_144536 ) ) ( not ( = ?auto_144535 ?auto_144541 ) ) ( not ( = ?auto_144535 ?auto_144539 ) ) ( not ( = ?auto_144534 ?auto_144540 ) ) ( not ( = ?auto_144534 ?auto_144536 ) ) ( not ( = ?auto_144534 ?auto_144541 ) ) ( not ( = ?auto_144534 ?auto_144539 ) ) ( not ( = ?auto_144540 ?auto_144536 ) ) ( not ( = ?auto_144540 ?auto_144541 ) ) ( not ( = ?auto_144540 ?auto_144539 ) ) ( not ( = ?auto_144536 ?auto_144541 ) ) ( not ( = ?auto_144536 ?auto_144539 ) ) ( not ( = ?auto_144541 ?auto_144539 ) ) ( not ( = ?auto_144533 ?auto_144541 ) ) ( not ( = ?auto_144533 ?auto_144535 ) ) ( not ( = ?auto_144533 ?auto_144534 ) ) ( not ( = ?auto_144533 ?auto_144540 ) ) ( not ( = ?auto_144533 ?auto_144536 ) ) ( not ( = ?auto_144537 ?auto_144541 ) ) ( not ( = ?auto_144537 ?auto_144535 ) ) ( not ( = ?auto_144537 ?auto_144534 ) ) ( not ( = ?auto_144537 ?auto_144540 ) ) ( not ( = ?auto_144537 ?auto_144536 ) ) ( not ( = ?auto_144538 ?auto_144541 ) ) ( not ( = ?auto_144538 ?auto_144535 ) ) ( not ( = ?auto_144538 ?auto_144534 ) ) ( not ( = ?auto_144538 ?auto_144540 ) ) ( not ( = ?auto_144538 ?auto_144536 ) ) ( ON ?auto_144539 ?auto_144538 ) ( ON ?auto_144541 ?auto_144539 ) ( ON ?auto_144536 ?auto_144541 ) ( ON ?auto_144540 ?auto_144536 ) ( ON ?auto_144534 ?auto_144540 ) ( ON ?auto_144535 ?auto_144534 ) ( CLEAR ?auto_144535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144537 ?auto_144533 ?auto_144538 ?auto_144539 ?auto_144541 ?auto_144536 ?auto_144540 ?auto_144534 )
      ( MAKE-1PILE ?auto_144533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144555 - BLOCK
      ?auto_144556 - BLOCK
      ?auto_144557 - BLOCK
      ?auto_144558 - BLOCK
      ?auto_144559 - BLOCK
      ?auto_144560 - BLOCK
    )
    :vars
    (
      ?auto_144561 - BLOCK
      ?auto_144562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144561 ?auto_144560 ) ( CLEAR ?auto_144561 ) ( ON-TABLE ?auto_144555 ) ( ON ?auto_144556 ?auto_144555 ) ( ON ?auto_144557 ?auto_144556 ) ( ON ?auto_144558 ?auto_144557 ) ( ON ?auto_144559 ?auto_144558 ) ( ON ?auto_144560 ?auto_144559 ) ( not ( = ?auto_144555 ?auto_144556 ) ) ( not ( = ?auto_144555 ?auto_144557 ) ) ( not ( = ?auto_144555 ?auto_144558 ) ) ( not ( = ?auto_144555 ?auto_144559 ) ) ( not ( = ?auto_144555 ?auto_144560 ) ) ( not ( = ?auto_144555 ?auto_144561 ) ) ( not ( = ?auto_144556 ?auto_144557 ) ) ( not ( = ?auto_144556 ?auto_144558 ) ) ( not ( = ?auto_144556 ?auto_144559 ) ) ( not ( = ?auto_144556 ?auto_144560 ) ) ( not ( = ?auto_144556 ?auto_144561 ) ) ( not ( = ?auto_144557 ?auto_144558 ) ) ( not ( = ?auto_144557 ?auto_144559 ) ) ( not ( = ?auto_144557 ?auto_144560 ) ) ( not ( = ?auto_144557 ?auto_144561 ) ) ( not ( = ?auto_144558 ?auto_144559 ) ) ( not ( = ?auto_144558 ?auto_144560 ) ) ( not ( = ?auto_144558 ?auto_144561 ) ) ( not ( = ?auto_144559 ?auto_144560 ) ) ( not ( = ?auto_144559 ?auto_144561 ) ) ( not ( = ?auto_144560 ?auto_144561 ) ) ( HOLDING ?auto_144562 ) ( not ( = ?auto_144555 ?auto_144562 ) ) ( not ( = ?auto_144556 ?auto_144562 ) ) ( not ( = ?auto_144557 ?auto_144562 ) ) ( not ( = ?auto_144558 ?auto_144562 ) ) ( not ( = ?auto_144559 ?auto_144562 ) ) ( not ( = ?auto_144560 ?auto_144562 ) ) ( not ( = ?auto_144561 ?auto_144562 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_144562 )
      ( MAKE-6PILE ?auto_144555 ?auto_144556 ?auto_144557 ?auto_144558 ?auto_144559 ?auto_144560 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144680 - BLOCK
      ?auto_144681 - BLOCK
    )
    :vars
    (
      ?auto_144682 - BLOCK
      ?auto_144686 - BLOCK
      ?auto_144684 - BLOCK
      ?auto_144683 - BLOCK
      ?auto_144685 - BLOCK
      ?auto_144687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144680 ?auto_144681 ) ) ( ON ?auto_144681 ?auto_144682 ) ( not ( = ?auto_144680 ?auto_144682 ) ) ( not ( = ?auto_144681 ?auto_144682 ) ) ( ON ?auto_144680 ?auto_144681 ) ( CLEAR ?auto_144680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144686 ) ( ON ?auto_144684 ?auto_144686 ) ( ON ?auto_144683 ?auto_144684 ) ( ON ?auto_144685 ?auto_144683 ) ( ON ?auto_144687 ?auto_144685 ) ( ON ?auto_144682 ?auto_144687 ) ( not ( = ?auto_144686 ?auto_144684 ) ) ( not ( = ?auto_144686 ?auto_144683 ) ) ( not ( = ?auto_144686 ?auto_144685 ) ) ( not ( = ?auto_144686 ?auto_144687 ) ) ( not ( = ?auto_144686 ?auto_144682 ) ) ( not ( = ?auto_144686 ?auto_144681 ) ) ( not ( = ?auto_144686 ?auto_144680 ) ) ( not ( = ?auto_144684 ?auto_144683 ) ) ( not ( = ?auto_144684 ?auto_144685 ) ) ( not ( = ?auto_144684 ?auto_144687 ) ) ( not ( = ?auto_144684 ?auto_144682 ) ) ( not ( = ?auto_144684 ?auto_144681 ) ) ( not ( = ?auto_144684 ?auto_144680 ) ) ( not ( = ?auto_144683 ?auto_144685 ) ) ( not ( = ?auto_144683 ?auto_144687 ) ) ( not ( = ?auto_144683 ?auto_144682 ) ) ( not ( = ?auto_144683 ?auto_144681 ) ) ( not ( = ?auto_144683 ?auto_144680 ) ) ( not ( = ?auto_144685 ?auto_144687 ) ) ( not ( = ?auto_144685 ?auto_144682 ) ) ( not ( = ?auto_144685 ?auto_144681 ) ) ( not ( = ?auto_144685 ?auto_144680 ) ) ( not ( = ?auto_144687 ?auto_144682 ) ) ( not ( = ?auto_144687 ?auto_144681 ) ) ( not ( = ?auto_144687 ?auto_144680 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144686 ?auto_144684 ?auto_144683 ?auto_144685 ?auto_144687 ?auto_144682 ?auto_144681 )
      ( MAKE-2PILE ?auto_144680 ?auto_144681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144690 - BLOCK
      ?auto_144691 - BLOCK
    )
    :vars
    (
      ?auto_144692 - BLOCK
      ?auto_144693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144690 ?auto_144691 ) ) ( ON ?auto_144691 ?auto_144692 ) ( CLEAR ?auto_144691 ) ( not ( = ?auto_144690 ?auto_144692 ) ) ( not ( = ?auto_144691 ?auto_144692 ) ) ( ON ?auto_144690 ?auto_144693 ) ( CLEAR ?auto_144690 ) ( HAND-EMPTY ) ( not ( = ?auto_144690 ?auto_144693 ) ) ( not ( = ?auto_144691 ?auto_144693 ) ) ( not ( = ?auto_144692 ?auto_144693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144690 ?auto_144693 )
      ( MAKE-2PILE ?auto_144690 ?auto_144691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144694 - BLOCK
      ?auto_144695 - BLOCK
    )
    :vars
    (
      ?auto_144697 - BLOCK
      ?auto_144696 - BLOCK
      ?auto_144701 - BLOCK
      ?auto_144700 - BLOCK
      ?auto_144699 - BLOCK
      ?auto_144702 - BLOCK
      ?auto_144698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144694 ?auto_144695 ) ) ( not ( = ?auto_144694 ?auto_144697 ) ) ( not ( = ?auto_144695 ?auto_144697 ) ) ( ON ?auto_144694 ?auto_144696 ) ( CLEAR ?auto_144694 ) ( not ( = ?auto_144694 ?auto_144696 ) ) ( not ( = ?auto_144695 ?auto_144696 ) ) ( not ( = ?auto_144697 ?auto_144696 ) ) ( HOLDING ?auto_144695 ) ( CLEAR ?auto_144697 ) ( ON-TABLE ?auto_144701 ) ( ON ?auto_144700 ?auto_144701 ) ( ON ?auto_144699 ?auto_144700 ) ( ON ?auto_144702 ?auto_144699 ) ( ON ?auto_144698 ?auto_144702 ) ( ON ?auto_144697 ?auto_144698 ) ( not ( = ?auto_144701 ?auto_144700 ) ) ( not ( = ?auto_144701 ?auto_144699 ) ) ( not ( = ?auto_144701 ?auto_144702 ) ) ( not ( = ?auto_144701 ?auto_144698 ) ) ( not ( = ?auto_144701 ?auto_144697 ) ) ( not ( = ?auto_144701 ?auto_144695 ) ) ( not ( = ?auto_144700 ?auto_144699 ) ) ( not ( = ?auto_144700 ?auto_144702 ) ) ( not ( = ?auto_144700 ?auto_144698 ) ) ( not ( = ?auto_144700 ?auto_144697 ) ) ( not ( = ?auto_144700 ?auto_144695 ) ) ( not ( = ?auto_144699 ?auto_144702 ) ) ( not ( = ?auto_144699 ?auto_144698 ) ) ( not ( = ?auto_144699 ?auto_144697 ) ) ( not ( = ?auto_144699 ?auto_144695 ) ) ( not ( = ?auto_144702 ?auto_144698 ) ) ( not ( = ?auto_144702 ?auto_144697 ) ) ( not ( = ?auto_144702 ?auto_144695 ) ) ( not ( = ?auto_144698 ?auto_144697 ) ) ( not ( = ?auto_144698 ?auto_144695 ) ) ( not ( = ?auto_144694 ?auto_144701 ) ) ( not ( = ?auto_144694 ?auto_144700 ) ) ( not ( = ?auto_144694 ?auto_144699 ) ) ( not ( = ?auto_144694 ?auto_144702 ) ) ( not ( = ?auto_144694 ?auto_144698 ) ) ( not ( = ?auto_144696 ?auto_144701 ) ) ( not ( = ?auto_144696 ?auto_144700 ) ) ( not ( = ?auto_144696 ?auto_144699 ) ) ( not ( = ?auto_144696 ?auto_144702 ) ) ( not ( = ?auto_144696 ?auto_144698 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144701 ?auto_144700 ?auto_144699 ?auto_144702 ?auto_144698 ?auto_144697 ?auto_144695 )
      ( MAKE-2PILE ?auto_144694 ?auto_144695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144703 - BLOCK
      ?auto_144704 - BLOCK
    )
    :vars
    (
      ?auto_144706 - BLOCK
      ?auto_144705 - BLOCK
      ?auto_144708 - BLOCK
      ?auto_144710 - BLOCK
      ?auto_144711 - BLOCK
      ?auto_144709 - BLOCK
      ?auto_144707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144703 ?auto_144704 ) ) ( not ( = ?auto_144703 ?auto_144706 ) ) ( not ( = ?auto_144704 ?auto_144706 ) ) ( ON ?auto_144703 ?auto_144705 ) ( not ( = ?auto_144703 ?auto_144705 ) ) ( not ( = ?auto_144704 ?auto_144705 ) ) ( not ( = ?auto_144706 ?auto_144705 ) ) ( CLEAR ?auto_144706 ) ( ON-TABLE ?auto_144708 ) ( ON ?auto_144710 ?auto_144708 ) ( ON ?auto_144711 ?auto_144710 ) ( ON ?auto_144709 ?auto_144711 ) ( ON ?auto_144707 ?auto_144709 ) ( ON ?auto_144706 ?auto_144707 ) ( not ( = ?auto_144708 ?auto_144710 ) ) ( not ( = ?auto_144708 ?auto_144711 ) ) ( not ( = ?auto_144708 ?auto_144709 ) ) ( not ( = ?auto_144708 ?auto_144707 ) ) ( not ( = ?auto_144708 ?auto_144706 ) ) ( not ( = ?auto_144708 ?auto_144704 ) ) ( not ( = ?auto_144710 ?auto_144711 ) ) ( not ( = ?auto_144710 ?auto_144709 ) ) ( not ( = ?auto_144710 ?auto_144707 ) ) ( not ( = ?auto_144710 ?auto_144706 ) ) ( not ( = ?auto_144710 ?auto_144704 ) ) ( not ( = ?auto_144711 ?auto_144709 ) ) ( not ( = ?auto_144711 ?auto_144707 ) ) ( not ( = ?auto_144711 ?auto_144706 ) ) ( not ( = ?auto_144711 ?auto_144704 ) ) ( not ( = ?auto_144709 ?auto_144707 ) ) ( not ( = ?auto_144709 ?auto_144706 ) ) ( not ( = ?auto_144709 ?auto_144704 ) ) ( not ( = ?auto_144707 ?auto_144706 ) ) ( not ( = ?auto_144707 ?auto_144704 ) ) ( not ( = ?auto_144703 ?auto_144708 ) ) ( not ( = ?auto_144703 ?auto_144710 ) ) ( not ( = ?auto_144703 ?auto_144711 ) ) ( not ( = ?auto_144703 ?auto_144709 ) ) ( not ( = ?auto_144703 ?auto_144707 ) ) ( not ( = ?auto_144705 ?auto_144708 ) ) ( not ( = ?auto_144705 ?auto_144710 ) ) ( not ( = ?auto_144705 ?auto_144711 ) ) ( not ( = ?auto_144705 ?auto_144709 ) ) ( not ( = ?auto_144705 ?auto_144707 ) ) ( ON ?auto_144704 ?auto_144703 ) ( CLEAR ?auto_144704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144705 ?auto_144703 )
      ( MAKE-2PILE ?auto_144703 ?auto_144704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144712 - BLOCK
      ?auto_144713 - BLOCK
    )
    :vars
    (
      ?auto_144717 - BLOCK
      ?auto_144716 - BLOCK
      ?auto_144719 - BLOCK
      ?auto_144720 - BLOCK
      ?auto_144715 - BLOCK
      ?auto_144714 - BLOCK
      ?auto_144718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144712 ?auto_144713 ) ) ( not ( = ?auto_144712 ?auto_144717 ) ) ( not ( = ?auto_144713 ?auto_144717 ) ) ( ON ?auto_144712 ?auto_144716 ) ( not ( = ?auto_144712 ?auto_144716 ) ) ( not ( = ?auto_144713 ?auto_144716 ) ) ( not ( = ?auto_144717 ?auto_144716 ) ) ( ON-TABLE ?auto_144719 ) ( ON ?auto_144720 ?auto_144719 ) ( ON ?auto_144715 ?auto_144720 ) ( ON ?auto_144714 ?auto_144715 ) ( ON ?auto_144718 ?auto_144714 ) ( not ( = ?auto_144719 ?auto_144720 ) ) ( not ( = ?auto_144719 ?auto_144715 ) ) ( not ( = ?auto_144719 ?auto_144714 ) ) ( not ( = ?auto_144719 ?auto_144718 ) ) ( not ( = ?auto_144719 ?auto_144717 ) ) ( not ( = ?auto_144719 ?auto_144713 ) ) ( not ( = ?auto_144720 ?auto_144715 ) ) ( not ( = ?auto_144720 ?auto_144714 ) ) ( not ( = ?auto_144720 ?auto_144718 ) ) ( not ( = ?auto_144720 ?auto_144717 ) ) ( not ( = ?auto_144720 ?auto_144713 ) ) ( not ( = ?auto_144715 ?auto_144714 ) ) ( not ( = ?auto_144715 ?auto_144718 ) ) ( not ( = ?auto_144715 ?auto_144717 ) ) ( not ( = ?auto_144715 ?auto_144713 ) ) ( not ( = ?auto_144714 ?auto_144718 ) ) ( not ( = ?auto_144714 ?auto_144717 ) ) ( not ( = ?auto_144714 ?auto_144713 ) ) ( not ( = ?auto_144718 ?auto_144717 ) ) ( not ( = ?auto_144718 ?auto_144713 ) ) ( not ( = ?auto_144712 ?auto_144719 ) ) ( not ( = ?auto_144712 ?auto_144720 ) ) ( not ( = ?auto_144712 ?auto_144715 ) ) ( not ( = ?auto_144712 ?auto_144714 ) ) ( not ( = ?auto_144712 ?auto_144718 ) ) ( not ( = ?auto_144716 ?auto_144719 ) ) ( not ( = ?auto_144716 ?auto_144720 ) ) ( not ( = ?auto_144716 ?auto_144715 ) ) ( not ( = ?auto_144716 ?auto_144714 ) ) ( not ( = ?auto_144716 ?auto_144718 ) ) ( ON ?auto_144713 ?auto_144712 ) ( CLEAR ?auto_144713 ) ( ON-TABLE ?auto_144716 ) ( HOLDING ?auto_144717 ) ( CLEAR ?auto_144718 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144719 ?auto_144720 ?auto_144715 ?auto_144714 ?auto_144718 ?auto_144717 )
      ( MAKE-2PILE ?auto_144712 ?auto_144713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144721 - BLOCK
      ?auto_144722 - BLOCK
    )
    :vars
    (
      ?auto_144728 - BLOCK
      ?auto_144726 - BLOCK
      ?auto_144725 - BLOCK
      ?auto_144724 - BLOCK
      ?auto_144723 - BLOCK
      ?auto_144727 - BLOCK
      ?auto_144729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144721 ?auto_144722 ) ) ( not ( = ?auto_144721 ?auto_144728 ) ) ( not ( = ?auto_144722 ?auto_144728 ) ) ( ON ?auto_144721 ?auto_144726 ) ( not ( = ?auto_144721 ?auto_144726 ) ) ( not ( = ?auto_144722 ?auto_144726 ) ) ( not ( = ?auto_144728 ?auto_144726 ) ) ( ON-TABLE ?auto_144725 ) ( ON ?auto_144724 ?auto_144725 ) ( ON ?auto_144723 ?auto_144724 ) ( ON ?auto_144727 ?auto_144723 ) ( ON ?auto_144729 ?auto_144727 ) ( not ( = ?auto_144725 ?auto_144724 ) ) ( not ( = ?auto_144725 ?auto_144723 ) ) ( not ( = ?auto_144725 ?auto_144727 ) ) ( not ( = ?auto_144725 ?auto_144729 ) ) ( not ( = ?auto_144725 ?auto_144728 ) ) ( not ( = ?auto_144725 ?auto_144722 ) ) ( not ( = ?auto_144724 ?auto_144723 ) ) ( not ( = ?auto_144724 ?auto_144727 ) ) ( not ( = ?auto_144724 ?auto_144729 ) ) ( not ( = ?auto_144724 ?auto_144728 ) ) ( not ( = ?auto_144724 ?auto_144722 ) ) ( not ( = ?auto_144723 ?auto_144727 ) ) ( not ( = ?auto_144723 ?auto_144729 ) ) ( not ( = ?auto_144723 ?auto_144728 ) ) ( not ( = ?auto_144723 ?auto_144722 ) ) ( not ( = ?auto_144727 ?auto_144729 ) ) ( not ( = ?auto_144727 ?auto_144728 ) ) ( not ( = ?auto_144727 ?auto_144722 ) ) ( not ( = ?auto_144729 ?auto_144728 ) ) ( not ( = ?auto_144729 ?auto_144722 ) ) ( not ( = ?auto_144721 ?auto_144725 ) ) ( not ( = ?auto_144721 ?auto_144724 ) ) ( not ( = ?auto_144721 ?auto_144723 ) ) ( not ( = ?auto_144721 ?auto_144727 ) ) ( not ( = ?auto_144721 ?auto_144729 ) ) ( not ( = ?auto_144726 ?auto_144725 ) ) ( not ( = ?auto_144726 ?auto_144724 ) ) ( not ( = ?auto_144726 ?auto_144723 ) ) ( not ( = ?auto_144726 ?auto_144727 ) ) ( not ( = ?auto_144726 ?auto_144729 ) ) ( ON ?auto_144722 ?auto_144721 ) ( ON-TABLE ?auto_144726 ) ( CLEAR ?auto_144729 ) ( ON ?auto_144728 ?auto_144722 ) ( CLEAR ?auto_144728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144726 ?auto_144721 ?auto_144722 )
      ( MAKE-2PILE ?auto_144721 ?auto_144722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144730 - BLOCK
      ?auto_144731 - BLOCK
    )
    :vars
    (
      ?auto_144735 - BLOCK
      ?auto_144736 - BLOCK
      ?auto_144737 - BLOCK
      ?auto_144732 - BLOCK
      ?auto_144733 - BLOCK
      ?auto_144738 - BLOCK
      ?auto_144734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144730 ?auto_144731 ) ) ( not ( = ?auto_144730 ?auto_144735 ) ) ( not ( = ?auto_144731 ?auto_144735 ) ) ( ON ?auto_144730 ?auto_144736 ) ( not ( = ?auto_144730 ?auto_144736 ) ) ( not ( = ?auto_144731 ?auto_144736 ) ) ( not ( = ?auto_144735 ?auto_144736 ) ) ( ON-TABLE ?auto_144737 ) ( ON ?auto_144732 ?auto_144737 ) ( ON ?auto_144733 ?auto_144732 ) ( ON ?auto_144738 ?auto_144733 ) ( not ( = ?auto_144737 ?auto_144732 ) ) ( not ( = ?auto_144737 ?auto_144733 ) ) ( not ( = ?auto_144737 ?auto_144738 ) ) ( not ( = ?auto_144737 ?auto_144734 ) ) ( not ( = ?auto_144737 ?auto_144735 ) ) ( not ( = ?auto_144737 ?auto_144731 ) ) ( not ( = ?auto_144732 ?auto_144733 ) ) ( not ( = ?auto_144732 ?auto_144738 ) ) ( not ( = ?auto_144732 ?auto_144734 ) ) ( not ( = ?auto_144732 ?auto_144735 ) ) ( not ( = ?auto_144732 ?auto_144731 ) ) ( not ( = ?auto_144733 ?auto_144738 ) ) ( not ( = ?auto_144733 ?auto_144734 ) ) ( not ( = ?auto_144733 ?auto_144735 ) ) ( not ( = ?auto_144733 ?auto_144731 ) ) ( not ( = ?auto_144738 ?auto_144734 ) ) ( not ( = ?auto_144738 ?auto_144735 ) ) ( not ( = ?auto_144738 ?auto_144731 ) ) ( not ( = ?auto_144734 ?auto_144735 ) ) ( not ( = ?auto_144734 ?auto_144731 ) ) ( not ( = ?auto_144730 ?auto_144737 ) ) ( not ( = ?auto_144730 ?auto_144732 ) ) ( not ( = ?auto_144730 ?auto_144733 ) ) ( not ( = ?auto_144730 ?auto_144738 ) ) ( not ( = ?auto_144730 ?auto_144734 ) ) ( not ( = ?auto_144736 ?auto_144737 ) ) ( not ( = ?auto_144736 ?auto_144732 ) ) ( not ( = ?auto_144736 ?auto_144733 ) ) ( not ( = ?auto_144736 ?auto_144738 ) ) ( not ( = ?auto_144736 ?auto_144734 ) ) ( ON ?auto_144731 ?auto_144730 ) ( ON-TABLE ?auto_144736 ) ( ON ?auto_144735 ?auto_144731 ) ( CLEAR ?auto_144735 ) ( HOLDING ?auto_144734 ) ( CLEAR ?auto_144738 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144737 ?auto_144732 ?auto_144733 ?auto_144738 ?auto_144734 )
      ( MAKE-2PILE ?auto_144730 ?auto_144731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144739 - BLOCK
      ?auto_144740 - BLOCK
    )
    :vars
    (
      ?auto_144741 - BLOCK
      ?auto_144743 - BLOCK
      ?auto_144744 - BLOCK
      ?auto_144747 - BLOCK
      ?auto_144745 - BLOCK
      ?auto_144746 - BLOCK
      ?auto_144742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144739 ?auto_144740 ) ) ( not ( = ?auto_144739 ?auto_144741 ) ) ( not ( = ?auto_144740 ?auto_144741 ) ) ( ON ?auto_144739 ?auto_144743 ) ( not ( = ?auto_144739 ?auto_144743 ) ) ( not ( = ?auto_144740 ?auto_144743 ) ) ( not ( = ?auto_144741 ?auto_144743 ) ) ( ON-TABLE ?auto_144744 ) ( ON ?auto_144747 ?auto_144744 ) ( ON ?auto_144745 ?auto_144747 ) ( ON ?auto_144746 ?auto_144745 ) ( not ( = ?auto_144744 ?auto_144747 ) ) ( not ( = ?auto_144744 ?auto_144745 ) ) ( not ( = ?auto_144744 ?auto_144746 ) ) ( not ( = ?auto_144744 ?auto_144742 ) ) ( not ( = ?auto_144744 ?auto_144741 ) ) ( not ( = ?auto_144744 ?auto_144740 ) ) ( not ( = ?auto_144747 ?auto_144745 ) ) ( not ( = ?auto_144747 ?auto_144746 ) ) ( not ( = ?auto_144747 ?auto_144742 ) ) ( not ( = ?auto_144747 ?auto_144741 ) ) ( not ( = ?auto_144747 ?auto_144740 ) ) ( not ( = ?auto_144745 ?auto_144746 ) ) ( not ( = ?auto_144745 ?auto_144742 ) ) ( not ( = ?auto_144745 ?auto_144741 ) ) ( not ( = ?auto_144745 ?auto_144740 ) ) ( not ( = ?auto_144746 ?auto_144742 ) ) ( not ( = ?auto_144746 ?auto_144741 ) ) ( not ( = ?auto_144746 ?auto_144740 ) ) ( not ( = ?auto_144742 ?auto_144741 ) ) ( not ( = ?auto_144742 ?auto_144740 ) ) ( not ( = ?auto_144739 ?auto_144744 ) ) ( not ( = ?auto_144739 ?auto_144747 ) ) ( not ( = ?auto_144739 ?auto_144745 ) ) ( not ( = ?auto_144739 ?auto_144746 ) ) ( not ( = ?auto_144739 ?auto_144742 ) ) ( not ( = ?auto_144743 ?auto_144744 ) ) ( not ( = ?auto_144743 ?auto_144747 ) ) ( not ( = ?auto_144743 ?auto_144745 ) ) ( not ( = ?auto_144743 ?auto_144746 ) ) ( not ( = ?auto_144743 ?auto_144742 ) ) ( ON ?auto_144740 ?auto_144739 ) ( ON-TABLE ?auto_144743 ) ( ON ?auto_144741 ?auto_144740 ) ( CLEAR ?auto_144746 ) ( ON ?auto_144742 ?auto_144741 ) ( CLEAR ?auto_144742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144743 ?auto_144739 ?auto_144740 ?auto_144741 )
      ( MAKE-2PILE ?auto_144739 ?auto_144740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144748 - BLOCK
      ?auto_144749 - BLOCK
    )
    :vars
    (
      ?auto_144754 - BLOCK
      ?auto_144750 - BLOCK
      ?auto_144751 - BLOCK
      ?auto_144752 - BLOCK
      ?auto_144755 - BLOCK
      ?auto_144756 - BLOCK
      ?auto_144753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144748 ?auto_144749 ) ) ( not ( = ?auto_144748 ?auto_144754 ) ) ( not ( = ?auto_144749 ?auto_144754 ) ) ( ON ?auto_144748 ?auto_144750 ) ( not ( = ?auto_144748 ?auto_144750 ) ) ( not ( = ?auto_144749 ?auto_144750 ) ) ( not ( = ?auto_144754 ?auto_144750 ) ) ( ON-TABLE ?auto_144751 ) ( ON ?auto_144752 ?auto_144751 ) ( ON ?auto_144755 ?auto_144752 ) ( not ( = ?auto_144751 ?auto_144752 ) ) ( not ( = ?auto_144751 ?auto_144755 ) ) ( not ( = ?auto_144751 ?auto_144756 ) ) ( not ( = ?auto_144751 ?auto_144753 ) ) ( not ( = ?auto_144751 ?auto_144754 ) ) ( not ( = ?auto_144751 ?auto_144749 ) ) ( not ( = ?auto_144752 ?auto_144755 ) ) ( not ( = ?auto_144752 ?auto_144756 ) ) ( not ( = ?auto_144752 ?auto_144753 ) ) ( not ( = ?auto_144752 ?auto_144754 ) ) ( not ( = ?auto_144752 ?auto_144749 ) ) ( not ( = ?auto_144755 ?auto_144756 ) ) ( not ( = ?auto_144755 ?auto_144753 ) ) ( not ( = ?auto_144755 ?auto_144754 ) ) ( not ( = ?auto_144755 ?auto_144749 ) ) ( not ( = ?auto_144756 ?auto_144753 ) ) ( not ( = ?auto_144756 ?auto_144754 ) ) ( not ( = ?auto_144756 ?auto_144749 ) ) ( not ( = ?auto_144753 ?auto_144754 ) ) ( not ( = ?auto_144753 ?auto_144749 ) ) ( not ( = ?auto_144748 ?auto_144751 ) ) ( not ( = ?auto_144748 ?auto_144752 ) ) ( not ( = ?auto_144748 ?auto_144755 ) ) ( not ( = ?auto_144748 ?auto_144756 ) ) ( not ( = ?auto_144748 ?auto_144753 ) ) ( not ( = ?auto_144750 ?auto_144751 ) ) ( not ( = ?auto_144750 ?auto_144752 ) ) ( not ( = ?auto_144750 ?auto_144755 ) ) ( not ( = ?auto_144750 ?auto_144756 ) ) ( not ( = ?auto_144750 ?auto_144753 ) ) ( ON ?auto_144749 ?auto_144748 ) ( ON-TABLE ?auto_144750 ) ( ON ?auto_144754 ?auto_144749 ) ( ON ?auto_144753 ?auto_144754 ) ( CLEAR ?auto_144753 ) ( HOLDING ?auto_144756 ) ( CLEAR ?auto_144755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144751 ?auto_144752 ?auto_144755 ?auto_144756 )
      ( MAKE-2PILE ?auto_144748 ?auto_144749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144757 - BLOCK
      ?auto_144758 - BLOCK
    )
    :vars
    (
      ?auto_144762 - BLOCK
      ?auto_144760 - BLOCK
      ?auto_144765 - BLOCK
      ?auto_144763 - BLOCK
      ?auto_144759 - BLOCK
      ?auto_144761 - BLOCK
      ?auto_144764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144757 ?auto_144758 ) ) ( not ( = ?auto_144757 ?auto_144762 ) ) ( not ( = ?auto_144758 ?auto_144762 ) ) ( ON ?auto_144757 ?auto_144760 ) ( not ( = ?auto_144757 ?auto_144760 ) ) ( not ( = ?auto_144758 ?auto_144760 ) ) ( not ( = ?auto_144762 ?auto_144760 ) ) ( ON-TABLE ?auto_144765 ) ( ON ?auto_144763 ?auto_144765 ) ( ON ?auto_144759 ?auto_144763 ) ( not ( = ?auto_144765 ?auto_144763 ) ) ( not ( = ?auto_144765 ?auto_144759 ) ) ( not ( = ?auto_144765 ?auto_144761 ) ) ( not ( = ?auto_144765 ?auto_144764 ) ) ( not ( = ?auto_144765 ?auto_144762 ) ) ( not ( = ?auto_144765 ?auto_144758 ) ) ( not ( = ?auto_144763 ?auto_144759 ) ) ( not ( = ?auto_144763 ?auto_144761 ) ) ( not ( = ?auto_144763 ?auto_144764 ) ) ( not ( = ?auto_144763 ?auto_144762 ) ) ( not ( = ?auto_144763 ?auto_144758 ) ) ( not ( = ?auto_144759 ?auto_144761 ) ) ( not ( = ?auto_144759 ?auto_144764 ) ) ( not ( = ?auto_144759 ?auto_144762 ) ) ( not ( = ?auto_144759 ?auto_144758 ) ) ( not ( = ?auto_144761 ?auto_144764 ) ) ( not ( = ?auto_144761 ?auto_144762 ) ) ( not ( = ?auto_144761 ?auto_144758 ) ) ( not ( = ?auto_144764 ?auto_144762 ) ) ( not ( = ?auto_144764 ?auto_144758 ) ) ( not ( = ?auto_144757 ?auto_144765 ) ) ( not ( = ?auto_144757 ?auto_144763 ) ) ( not ( = ?auto_144757 ?auto_144759 ) ) ( not ( = ?auto_144757 ?auto_144761 ) ) ( not ( = ?auto_144757 ?auto_144764 ) ) ( not ( = ?auto_144760 ?auto_144765 ) ) ( not ( = ?auto_144760 ?auto_144763 ) ) ( not ( = ?auto_144760 ?auto_144759 ) ) ( not ( = ?auto_144760 ?auto_144761 ) ) ( not ( = ?auto_144760 ?auto_144764 ) ) ( ON ?auto_144758 ?auto_144757 ) ( ON-TABLE ?auto_144760 ) ( ON ?auto_144762 ?auto_144758 ) ( ON ?auto_144764 ?auto_144762 ) ( CLEAR ?auto_144759 ) ( ON ?auto_144761 ?auto_144764 ) ( CLEAR ?auto_144761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144760 ?auto_144757 ?auto_144758 ?auto_144762 ?auto_144764 )
      ( MAKE-2PILE ?auto_144757 ?auto_144758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144766 - BLOCK
      ?auto_144767 - BLOCK
    )
    :vars
    (
      ?auto_144772 - BLOCK
      ?auto_144771 - BLOCK
      ?auto_144770 - BLOCK
      ?auto_144774 - BLOCK
      ?auto_144773 - BLOCK
      ?auto_144769 - BLOCK
      ?auto_144768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144766 ?auto_144767 ) ) ( not ( = ?auto_144766 ?auto_144772 ) ) ( not ( = ?auto_144767 ?auto_144772 ) ) ( ON ?auto_144766 ?auto_144771 ) ( not ( = ?auto_144766 ?auto_144771 ) ) ( not ( = ?auto_144767 ?auto_144771 ) ) ( not ( = ?auto_144772 ?auto_144771 ) ) ( ON-TABLE ?auto_144770 ) ( ON ?auto_144774 ?auto_144770 ) ( not ( = ?auto_144770 ?auto_144774 ) ) ( not ( = ?auto_144770 ?auto_144773 ) ) ( not ( = ?auto_144770 ?auto_144769 ) ) ( not ( = ?auto_144770 ?auto_144768 ) ) ( not ( = ?auto_144770 ?auto_144772 ) ) ( not ( = ?auto_144770 ?auto_144767 ) ) ( not ( = ?auto_144774 ?auto_144773 ) ) ( not ( = ?auto_144774 ?auto_144769 ) ) ( not ( = ?auto_144774 ?auto_144768 ) ) ( not ( = ?auto_144774 ?auto_144772 ) ) ( not ( = ?auto_144774 ?auto_144767 ) ) ( not ( = ?auto_144773 ?auto_144769 ) ) ( not ( = ?auto_144773 ?auto_144768 ) ) ( not ( = ?auto_144773 ?auto_144772 ) ) ( not ( = ?auto_144773 ?auto_144767 ) ) ( not ( = ?auto_144769 ?auto_144768 ) ) ( not ( = ?auto_144769 ?auto_144772 ) ) ( not ( = ?auto_144769 ?auto_144767 ) ) ( not ( = ?auto_144768 ?auto_144772 ) ) ( not ( = ?auto_144768 ?auto_144767 ) ) ( not ( = ?auto_144766 ?auto_144770 ) ) ( not ( = ?auto_144766 ?auto_144774 ) ) ( not ( = ?auto_144766 ?auto_144773 ) ) ( not ( = ?auto_144766 ?auto_144769 ) ) ( not ( = ?auto_144766 ?auto_144768 ) ) ( not ( = ?auto_144771 ?auto_144770 ) ) ( not ( = ?auto_144771 ?auto_144774 ) ) ( not ( = ?auto_144771 ?auto_144773 ) ) ( not ( = ?auto_144771 ?auto_144769 ) ) ( not ( = ?auto_144771 ?auto_144768 ) ) ( ON ?auto_144767 ?auto_144766 ) ( ON-TABLE ?auto_144771 ) ( ON ?auto_144772 ?auto_144767 ) ( ON ?auto_144768 ?auto_144772 ) ( ON ?auto_144769 ?auto_144768 ) ( CLEAR ?auto_144769 ) ( HOLDING ?auto_144773 ) ( CLEAR ?auto_144774 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144770 ?auto_144774 ?auto_144773 )
      ( MAKE-2PILE ?auto_144766 ?auto_144767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144775 - BLOCK
      ?auto_144776 - BLOCK
    )
    :vars
    (
      ?auto_144777 - BLOCK
      ?auto_144778 - BLOCK
      ?auto_144781 - BLOCK
      ?auto_144780 - BLOCK
      ?auto_144783 - BLOCK
      ?auto_144779 - BLOCK
      ?auto_144782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144775 ?auto_144776 ) ) ( not ( = ?auto_144775 ?auto_144777 ) ) ( not ( = ?auto_144776 ?auto_144777 ) ) ( ON ?auto_144775 ?auto_144778 ) ( not ( = ?auto_144775 ?auto_144778 ) ) ( not ( = ?auto_144776 ?auto_144778 ) ) ( not ( = ?auto_144777 ?auto_144778 ) ) ( ON-TABLE ?auto_144781 ) ( ON ?auto_144780 ?auto_144781 ) ( not ( = ?auto_144781 ?auto_144780 ) ) ( not ( = ?auto_144781 ?auto_144783 ) ) ( not ( = ?auto_144781 ?auto_144779 ) ) ( not ( = ?auto_144781 ?auto_144782 ) ) ( not ( = ?auto_144781 ?auto_144777 ) ) ( not ( = ?auto_144781 ?auto_144776 ) ) ( not ( = ?auto_144780 ?auto_144783 ) ) ( not ( = ?auto_144780 ?auto_144779 ) ) ( not ( = ?auto_144780 ?auto_144782 ) ) ( not ( = ?auto_144780 ?auto_144777 ) ) ( not ( = ?auto_144780 ?auto_144776 ) ) ( not ( = ?auto_144783 ?auto_144779 ) ) ( not ( = ?auto_144783 ?auto_144782 ) ) ( not ( = ?auto_144783 ?auto_144777 ) ) ( not ( = ?auto_144783 ?auto_144776 ) ) ( not ( = ?auto_144779 ?auto_144782 ) ) ( not ( = ?auto_144779 ?auto_144777 ) ) ( not ( = ?auto_144779 ?auto_144776 ) ) ( not ( = ?auto_144782 ?auto_144777 ) ) ( not ( = ?auto_144782 ?auto_144776 ) ) ( not ( = ?auto_144775 ?auto_144781 ) ) ( not ( = ?auto_144775 ?auto_144780 ) ) ( not ( = ?auto_144775 ?auto_144783 ) ) ( not ( = ?auto_144775 ?auto_144779 ) ) ( not ( = ?auto_144775 ?auto_144782 ) ) ( not ( = ?auto_144778 ?auto_144781 ) ) ( not ( = ?auto_144778 ?auto_144780 ) ) ( not ( = ?auto_144778 ?auto_144783 ) ) ( not ( = ?auto_144778 ?auto_144779 ) ) ( not ( = ?auto_144778 ?auto_144782 ) ) ( ON ?auto_144776 ?auto_144775 ) ( ON-TABLE ?auto_144778 ) ( ON ?auto_144777 ?auto_144776 ) ( ON ?auto_144782 ?auto_144777 ) ( ON ?auto_144779 ?auto_144782 ) ( CLEAR ?auto_144780 ) ( ON ?auto_144783 ?auto_144779 ) ( CLEAR ?auto_144783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144778 ?auto_144775 ?auto_144776 ?auto_144777 ?auto_144782 ?auto_144779 )
      ( MAKE-2PILE ?auto_144775 ?auto_144776 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144784 - BLOCK
      ?auto_144785 - BLOCK
    )
    :vars
    (
      ?auto_144789 - BLOCK
      ?auto_144790 - BLOCK
      ?auto_144787 - BLOCK
      ?auto_144788 - BLOCK
      ?auto_144792 - BLOCK
      ?auto_144791 - BLOCK
      ?auto_144786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144784 ?auto_144785 ) ) ( not ( = ?auto_144784 ?auto_144789 ) ) ( not ( = ?auto_144785 ?auto_144789 ) ) ( ON ?auto_144784 ?auto_144790 ) ( not ( = ?auto_144784 ?auto_144790 ) ) ( not ( = ?auto_144785 ?auto_144790 ) ) ( not ( = ?auto_144789 ?auto_144790 ) ) ( ON-TABLE ?auto_144787 ) ( not ( = ?auto_144787 ?auto_144788 ) ) ( not ( = ?auto_144787 ?auto_144792 ) ) ( not ( = ?auto_144787 ?auto_144791 ) ) ( not ( = ?auto_144787 ?auto_144786 ) ) ( not ( = ?auto_144787 ?auto_144789 ) ) ( not ( = ?auto_144787 ?auto_144785 ) ) ( not ( = ?auto_144788 ?auto_144792 ) ) ( not ( = ?auto_144788 ?auto_144791 ) ) ( not ( = ?auto_144788 ?auto_144786 ) ) ( not ( = ?auto_144788 ?auto_144789 ) ) ( not ( = ?auto_144788 ?auto_144785 ) ) ( not ( = ?auto_144792 ?auto_144791 ) ) ( not ( = ?auto_144792 ?auto_144786 ) ) ( not ( = ?auto_144792 ?auto_144789 ) ) ( not ( = ?auto_144792 ?auto_144785 ) ) ( not ( = ?auto_144791 ?auto_144786 ) ) ( not ( = ?auto_144791 ?auto_144789 ) ) ( not ( = ?auto_144791 ?auto_144785 ) ) ( not ( = ?auto_144786 ?auto_144789 ) ) ( not ( = ?auto_144786 ?auto_144785 ) ) ( not ( = ?auto_144784 ?auto_144787 ) ) ( not ( = ?auto_144784 ?auto_144788 ) ) ( not ( = ?auto_144784 ?auto_144792 ) ) ( not ( = ?auto_144784 ?auto_144791 ) ) ( not ( = ?auto_144784 ?auto_144786 ) ) ( not ( = ?auto_144790 ?auto_144787 ) ) ( not ( = ?auto_144790 ?auto_144788 ) ) ( not ( = ?auto_144790 ?auto_144792 ) ) ( not ( = ?auto_144790 ?auto_144791 ) ) ( not ( = ?auto_144790 ?auto_144786 ) ) ( ON ?auto_144785 ?auto_144784 ) ( ON-TABLE ?auto_144790 ) ( ON ?auto_144789 ?auto_144785 ) ( ON ?auto_144786 ?auto_144789 ) ( ON ?auto_144791 ?auto_144786 ) ( ON ?auto_144792 ?auto_144791 ) ( CLEAR ?auto_144792 ) ( HOLDING ?auto_144788 ) ( CLEAR ?auto_144787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144787 ?auto_144788 )
      ( MAKE-2PILE ?auto_144784 ?auto_144785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144793 - BLOCK
      ?auto_144794 - BLOCK
    )
    :vars
    (
      ?auto_144797 - BLOCK
      ?auto_144795 - BLOCK
      ?auto_144798 - BLOCK
      ?auto_144800 - BLOCK
      ?auto_144796 - BLOCK
      ?auto_144801 - BLOCK
      ?auto_144799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144793 ?auto_144794 ) ) ( not ( = ?auto_144793 ?auto_144797 ) ) ( not ( = ?auto_144794 ?auto_144797 ) ) ( ON ?auto_144793 ?auto_144795 ) ( not ( = ?auto_144793 ?auto_144795 ) ) ( not ( = ?auto_144794 ?auto_144795 ) ) ( not ( = ?auto_144797 ?auto_144795 ) ) ( ON-TABLE ?auto_144798 ) ( not ( = ?auto_144798 ?auto_144800 ) ) ( not ( = ?auto_144798 ?auto_144796 ) ) ( not ( = ?auto_144798 ?auto_144801 ) ) ( not ( = ?auto_144798 ?auto_144799 ) ) ( not ( = ?auto_144798 ?auto_144797 ) ) ( not ( = ?auto_144798 ?auto_144794 ) ) ( not ( = ?auto_144800 ?auto_144796 ) ) ( not ( = ?auto_144800 ?auto_144801 ) ) ( not ( = ?auto_144800 ?auto_144799 ) ) ( not ( = ?auto_144800 ?auto_144797 ) ) ( not ( = ?auto_144800 ?auto_144794 ) ) ( not ( = ?auto_144796 ?auto_144801 ) ) ( not ( = ?auto_144796 ?auto_144799 ) ) ( not ( = ?auto_144796 ?auto_144797 ) ) ( not ( = ?auto_144796 ?auto_144794 ) ) ( not ( = ?auto_144801 ?auto_144799 ) ) ( not ( = ?auto_144801 ?auto_144797 ) ) ( not ( = ?auto_144801 ?auto_144794 ) ) ( not ( = ?auto_144799 ?auto_144797 ) ) ( not ( = ?auto_144799 ?auto_144794 ) ) ( not ( = ?auto_144793 ?auto_144798 ) ) ( not ( = ?auto_144793 ?auto_144800 ) ) ( not ( = ?auto_144793 ?auto_144796 ) ) ( not ( = ?auto_144793 ?auto_144801 ) ) ( not ( = ?auto_144793 ?auto_144799 ) ) ( not ( = ?auto_144795 ?auto_144798 ) ) ( not ( = ?auto_144795 ?auto_144800 ) ) ( not ( = ?auto_144795 ?auto_144796 ) ) ( not ( = ?auto_144795 ?auto_144801 ) ) ( not ( = ?auto_144795 ?auto_144799 ) ) ( ON ?auto_144794 ?auto_144793 ) ( ON-TABLE ?auto_144795 ) ( ON ?auto_144797 ?auto_144794 ) ( ON ?auto_144799 ?auto_144797 ) ( ON ?auto_144801 ?auto_144799 ) ( ON ?auto_144796 ?auto_144801 ) ( CLEAR ?auto_144798 ) ( ON ?auto_144800 ?auto_144796 ) ( CLEAR ?auto_144800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144795 ?auto_144793 ?auto_144794 ?auto_144797 ?auto_144799 ?auto_144801 ?auto_144796 )
      ( MAKE-2PILE ?auto_144793 ?auto_144794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144802 - BLOCK
      ?auto_144803 - BLOCK
    )
    :vars
    (
      ?auto_144805 - BLOCK
      ?auto_144807 - BLOCK
      ?auto_144810 - BLOCK
      ?auto_144806 - BLOCK
      ?auto_144809 - BLOCK
      ?auto_144804 - BLOCK
      ?auto_144808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144802 ?auto_144803 ) ) ( not ( = ?auto_144802 ?auto_144805 ) ) ( not ( = ?auto_144803 ?auto_144805 ) ) ( ON ?auto_144802 ?auto_144807 ) ( not ( = ?auto_144802 ?auto_144807 ) ) ( not ( = ?auto_144803 ?auto_144807 ) ) ( not ( = ?auto_144805 ?auto_144807 ) ) ( not ( = ?auto_144810 ?auto_144806 ) ) ( not ( = ?auto_144810 ?auto_144809 ) ) ( not ( = ?auto_144810 ?auto_144804 ) ) ( not ( = ?auto_144810 ?auto_144808 ) ) ( not ( = ?auto_144810 ?auto_144805 ) ) ( not ( = ?auto_144810 ?auto_144803 ) ) ( not ( = ?auto_144806 ?auto_144809 ) ) ( not ( = ?auto_144806 ?auto_144804 ) ) ( not ( = ?auto_144806 ?auto_144808 ) ) ( not ( = ?auto_144806 ?auto_144805 ) ) ( not ( = ?auto_144806 ?auto_144803 ) ) ( not ( = ?auto_144809 ?auto_144804 ) ) ( not ( = ?auto_144809 ?auto_144808 ) ) ( not ( = ?auto_144809 ?auto_144805 ) ) ( not ( = ?auto_144809 ?auto_144803 ) ) ( not ( = ?auto_144804 ?auto_144808 ) ) ( not ( = ?auto_144804 ?auto_144805 ) ) ( not ( = ?auto_144804 ?auto_144803 ) ) ( not ( = ?auto_144808 ?auto_144805 ) ) ( not ( = ?auto_144808 ?auto_144803 ) ) ( not ( = ?auto_144802 ?auto_144810 ) ) ( not ( = ?auto_144802 ?auto_144806 ) ) ( not ( = ?auto_144802 ?auto_144809 ) ) ( not ( = ?auto_144802 ?auto_144804 ) ) ( not ( = ?auto_144802 ?auto_144808 ) ) ( not ( = ?auto_144807 ?auto_144810 ) ) ( not ( = ?auto_144807 ?auto_144806 ) ) ( not ( = ?auto_144807 ?auto_144809 ) ) ( not ( = ?auto_144807 ?auto_144804 ) ) ( not ( = ?auto_144807 ?auto_144808 ) ) ( ON ?auto_144803 ?auto_144802 ) ( ON-TABLE ?auto_144807 ) ( ON ?auto_144805 ?auto_144803 ) ( ON ?auto_144808 ?auto_144805 ) ( ON ?auto_144804 ?auto_144808 ) ( ON ?auto_144809 ?auto_144804 ) ( ON ?auto_144806 ?auto_144809 ) ( CLEAR ?auto_144806 ) ( HOLDING ?auto_144810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144810 )
      ( MAKE-2PILE ?auto_144802 ?auto_144803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144811 - BLOCK
      ?auto_144812 - BLOCK
    )
    :vars
    (
      ?auto_144815 - BLOCK
      ?auto_144814 - BLOCK
      ?auto_144817 - BLOCK
      ?auto_144819 - BLOCK
      ?auto_144816 - BLOCK
      ?auto_144813 - BLOCK
      ?auto_144818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144811 ?auto_144812 ) ) ( not ( = ?auto_144811 ?auto_144815 ) ) ( not ( = ?auto_144812 ?auto_144815 ) ) ( ON ?auto_144811 ?auto_144814 ) ( not ( = ?auto_144811 ?auto_144814 ) ) ( not ( = ?auto_144812 ?auto_144814 ) ) ( not ( = ?auto_144815 ?auto_144814 ) ) ( not ( = ?auto_144817 ?auto_144819 ) ) ( not ( = ?auto_144817 ?auto_144816 ) ) ( not ( = ?auto_144817 ?auto_144813 ) ) ( not ( = ?auto_144817 ?auto_144818 ) ) ( not ( = ?auto_144817 ?auto_144815 ) ) ( not ( = ?auto_144817 ?auto_144812 ) ) ( not ( = ?auto_144819 ?auto_144816 ) ) ( not ( = ?auto_144819 ?auto_144813 ) ) ( not ( = ?auto_144819 ?auto_144818 ) ) ( not ( = ?auto_144819 ?auto_144815 ) ) ( not ( = ?auto_144819 ?auto_144812 ) ) ( not ( = ?auto_144816 ?auto_144813 ) ) ( not ( = ?auto_144816 ?auto_144818 ) ) ( not ( = ?auto_144816 ?auto_144815 ) ) ( not ( = ?auto_144816 ?auto_144812 ) ) ( not ( = ?auto_144813 ?auto_144818 ) ) ( not ( = ?auto_144813 ?auto_144815 ) ) ( not ( = ?auto_144813 ?auto_144812 ) ) ( not ( = ?auto_144818 ?auto_144815 ) ) ( not ( = ?auto_144818 ?auto_144812 ) ) ( not ( = ?auto_144811 ?auto_144817 ) ) ( not ( = ?auto_144811 ?auto_144819 ) ) ( not ( = ?auto_144811 ?auto_144816 ) ) ( not ( = ?auto_144811 ?auto_144813 ) ) ( not ( = ?auto_144811 ?auto_144818 ) ) ( not ( = ?auto_144814 ?auto_144817 ) ) ( not ( = ?auto_144814 ?auto_144819 ) ) ( not ( = ?auto_144814 ?auto_144816 ) ) ( not ( = ?auto_144814 ?auto_144813 ) ) ( not ( = ?auto_144814 ?auto_144818 ) ) ( ON ?auto_144812 ?auto_144811 ) ( ON-TABLE ?auto_144814 ) ( ON ?auto_144815 ?auto_144812 ) ( ON ?auto_144818 ?auto_144815 ) ( ON ?auto_144813 ?auto_144818 ) ( ON ?auto_144816 ?auto_144813 ) ( ON ?auto_144819 ?auto_144816 ) ( ON ?auto_144817 ?auto_144819 ) ( CLEAR ?auto_144817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144814 ?auto_144811 ?auto_144812 ?auto_144815 ?auto_144818 ?auto_144813 ?auto_144816 ?auto_144819 )
      ( MAKE-2PILE ?auto_144811 ?auto_144812 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144847 - BLOCK
      ?auto_144848 - BLOCK
      ?auto_144849 - BLOCK
      ?auto_144850 - BLOCK
      ?auto_144851 - BLOCK
    )
    :vars
    (
      ?auto_144854 - BLOCK
      ?auto_144852 - BLOCK
      ?auto_144853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144854 ?auto_144851 ) ( ON-TABLE ?auto_144847 ) ( ON ?auto_144848 ?auto_144847 ) ( ON ?auto_144849 ?auto_144848 ) ( ON ?auto_144850 ?auto_144849 ) ( ON ?auto_144851 ?auto_144850 ) ( not ( = ?auto_144847 ?auto_144848 ) ) ( not ( = ?auto_144847 ?auto_144849 ) ) ( not ( = ?auto_144847 ?auto_144850 ) ) ( not ( = ?auto_144847 ?auto_144851 ) ) ( not ( = ?auto_144847 ?auto_144854 ) ) ( not ( = ?auto_144848 ?auto_144849 ) ) ( not ( = ?auto_144848 ?auto_144850 ) ) ( not ( = ?auto_144848 ?auto_144851 ) ) ( not ( = ?auto_144848 ?auto_144854 ) ) ( not ( = ?auto_144849 ?auto_144850 ) ) ( not ( = ?auto_144849 ?auto_144851 ) ) ( not ( = ?auto_144849 ?auto_144854 ) ) ( not ( = ?auto_144850 ?auto_144851 ) ) ( not ( = ?auto_144850 ?auto_144854 ) ) ( not ( = ?auto_144851 ?auto_144854 ) ) ( not ( = ?auto_144847 ?auto_144852 ) ) ( not ( = ?auto_144847 ?auto_144853 ) ) ( not ( = ?auto_144848 ?auto_144852 ) ) ( not ( = ?auto_144848 ?auto_144853 ) ) ( not ( = ?auto_144849 ?auto_144852 ) ) ( not ( = ?auto_144849 ?auto_144853 ) ) ( not ( = ?auto_144850 ?auto_144852 ) ) ( not ( = ?auto_144850 ?auto_144853 ) ) ( not ( = ?auto_144851 ?auto_144852 ) ) ( not ( = ?auto_144851 ?auto_144853 ) ) ( not ( = ?auto_144854 ?auto_144852 ) ) ( not ( = ?auto_144854 ?auto_144853 ) ) ( not ( = ?auto_144852 ?auto_144853 ) ) ( ON ?auto_144852 ?auto_144854 ) ( CLEAR ?auto_144852 ) ( HOLDING ?auto_144853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144853 )
      ( MAKE-5PILE ?auto_144847 ?auto_144848 ?auto_144849 ?auto_144850 ?auto_144851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144960 - BLOCK
      ?auto_144961 - BLOCK
      ?auto_144962 - BLOCK
    )
    :vars
    (
      ?auto_144963 - BLOCK
      ?auto_144965 - BLOCK
      ?auto_144966 - BLOCK
      ?auto_144967 - BLOCK
      ?auto_144964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144960 ) ( not ( = ?auto_144960 ?auto_144961 ) ) ( not ( = ?auto_144960 ?auto_144962 ) ) ( not ( = ?auto_144961 ?auto_144962 ) ) ( ON ?auto_144962 ?auto_144963 ) ( not ( = ?auto_144960 ?auto_144963 ) ) ( not ( = ?auto_144961 ?auto_144963 ) ) ( not ( = ?auto_144962 ?auto_144963 ) ) ( CLEAR ?auto_144960 ) ( ON ?auto_144961 ?auto_144962 ) ( CLEAR ?auto_144961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144965 ) ( ON ?auto_144966 ?auto_144965 ) ( ON ?auto_144967 ?auto_144966 ) ( ON ?auto_144964 ?auto_144967 ) ( ON ?auto_144963 ?auto_144964 ) ( not ( = ?auto_144965 ?auto_144966 ) ) ( not ( = ?auto_144965 ?auto_144967 ) ) ( not ( = ?auto_144965 ?auto_144964 ) ) ( not ( = ?auto_144965 ?auto_144963 ) ) ( not ( = ?auto_144965 ?auto_144962 ) ) ( not ( = ?auto_144965 ?auto_144961 ) ) ( not ( = ?auto_144966 ?auto_144967 ) ) ( not ( = ?auto_144966 ?auto_144964 ) ) ( not ( = ?auto_144966 ?auto_144963 ) ) ( not ( = ?auto_144966 ?auto_144962 ) ) ( not ( = ?auto_144966 ?auto_144961 ) ) ( not ( = ?auto_144967 ?auto_144964 ) ) ( not ( = ?auto_144967 ?auto_144963 ) ) ( not ( = ?auto_144967 ?auto_144962 ) ) ( not ( = ?auto_144967 ?auto_144961 ) ) ( not ( = ?auto_144964 ?auto_144963 ) ) ( not ( = ?auto_144964 ?auto_144962 ) ) ( not ( = ?auto_144964 ?auto_144961 ) ) ( not ( = ?auto_144960 ?auto_144965 ) ) ( not ( = ?auto_144960 ?auto_144966 ) ) ( not ( = ?auto_144960 ?auto_144967 ) ) ( not ( = ?auto_144960 ?auto_144964 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144965 ?auto_144966 ?auto_144967 ?auto_144964 ?auto_144963 ?auto_144962 )
      ( MAKE-3PILE ?auto_144960 ?auto_144961 ?auto_144962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144968 - BLOCK
      ?auto_144969 - BLOCK
      ?auto_144970 - BLOCK
    )
    :vars
    (
      ?auto_144971 - BLOCK
      ?auto_144975 - BLOCK
      ?auto_144973 - BLOCK
      ?auto_144974 - BLOCK
      ?auto_144972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144968 ?auto_144969 ) ) ( not ( = ?auto_144968 ?auto_144970 ) ) ( not ( = ?auto_144969 ?auto_144970 ) ) ( ON ?auto_144970 ?auto_144971 ) ( not ( = ?auto_144968 ?auto_144971 ) ) ( not ( = ?auto_144969 ?auto_144971 ) ) ( not ( = ?auto_144970 ?auto_144971 ) ) ( ON ?auto_144969 ?auto_144970 ) ( CLEAR ?auto_144969 ) ( ON-TABLE ?auto_144975 ) ( ON ?auto_144973 ?auto_144975 ) ( ON ?auto_144974 ?auto_144973 ) ( ON ?auto_144972 ?auto_144974 ) ( ON ?auto_144971 ?auto_144972 ) ( not ( = ?auto_144975 ?auto_144973 ) ) ( not ( = ?auto_144975 ?auto_144974 ) ) ( not ( = ?auto_144975 ?auto_144972 ) ) ( not ( = ?auto_144975 ?auto_144971 ) ) ( not ( = ?auto_144975 ?auto_144970 ) ) ( not ( = ?auto_144975 ?auto_144969 ) ) ( not ( = ?auto_144973 ?auto_144974 ) ) ( not ( = ?auto_144973 ?auto_144972 ) ) ( not ( = ?auto_144973 ?auto_144971 ) ) ( not ( = ?auto_144973 ?auto_144970 ) ) ( not ( = ?auto_144973 ?auto_144969 ) ) ( not ( = ?auto_144974 ?auto_144972 ) ) ( not ( = ?auto_144974 ?auto_144971 ) ) ( not ( = ?auto_144974 ?auto_144970 ) ) ( not ( = ?auto_144974 ?auto_144969 ) ) ( not ( = ?auto_144972 ?auto_144971 ) ) ( not ( = ?auto_144972 ?auto_144970 ) ) ( not ( = ?auto_144972 ?auto_144969 ) ) ( not ( = ?auto_144968 ?auto_144975 ) ) ( not ( = ?auto_144968 ?auto_144973 ) ) ( not ( = ?auto_144968 ?auto_144974 ) ) ( not ( = ?auto_144968 ?auto_144972 ) ) ( HOLDING ?auto_144968 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144968 )
      ( MAKE-3PILE ?auto_144968 ?auto_144969 ?auto_144970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144976 - BLOCK
      ?auto_144977 - BLOCK
      ?auto_144978 - BLOCK
    )
    :vars
    (
      ?auto_144979 - BLOCK
      ?auto_144983 - BLOCK
      ?auto_144980 - BLOCK
      ?auto_144981 - BLOCK
      ?auto_144982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144976 ?auto_144977 ) ) ( not ( = ?auto_144976 ?auto_144978 ) ) ( not ( = ?auto_144977 ?auto_144978 ) ) ( ON ?auto_144978 ?auto_144979 ) ( not ( = ?auto_144976 ?auto_144979 ) ) ( not ( = ?auto_144977 ?auto_144979 ) ) ( not ( = ?auto_144978 ?auto_144979 ) ) ( ON ?auto_144977 ?auto_144978 ) ( ON-TABLE ?auto_144983 ) ( ON ?auto_144980 ?auto_144983 ) ( ON ?auto_144981 ?auto_144980 ) ( ON ?auto_144982 ?auto_144981 ) ( ON ?auto_144979 ?auto_144982 ) ( not ( = ?auto_144983 ?auto_144980 ) ) ( not ( = ?auto_144983 ?auto_144981 ) ) ( not ( = ?auto_144983 ?auto_144982 ) ) ( not ( = ?auto_144983 ?auto_144979 ) ) ( not ( = ?auto_144983 ?auto_144978 ) ) ( not ( = ?auto_144983 ?auto_144977 ) ) ( not ( = ?auto_144980 ?auto_144981 ) ) ( not ( = ?auto_144980 ?auto_144982 ) ) ( not ( = ?auto_144980 ?auto_144979 ) ) ( not ( = ?auto_144980 ?auto_144978 ) ) ( not ( = ?auto_144980 ?auto_144977 ) ) ( not ( = ?auto_144981 ?auto_144982 ) ) ( not ( = ?auto_144981 ?auto_144979 ) ) ( not ( = ?auto_144981 ?auto_144978 ) ) ( not ( = ?auto_144981 ?auto_144977 ) ) ( not ( = ?auto_144982 ?auto_144979 ) ) ( not ( = ?auto_144982 ?auto_144978 ) ) ( not ( = ?auto_144982 ?auto_144977 ) ) ( not ( = ?auto_144976 ?auto_144983 ) ) ( not ( = ?auto_144976 ?auto_144980 ) ) ( not ( = ?auto_144976 ?auto_144981 ) ) ( not ( = ?auto_144976 ?auto_144982 ) ) ( ON ?auto_144976 ?auto_144977 ) ( CLEAR ?auto_144976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144983 ?auto_144980 ?auto_144981 ?auto_144982 ?auto_144979 ?auto_144978 ?auto_144977 )
      ( MAKE-3PILE ?auto_144976 ?auto_144977 ?auto_144978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144987 - BLOCK
      ?auto_144988 - BLOCK
      ?auto_144989 - BLOCK
    )
    :vars
    (
      ?auto_144993 - BLOCK
      ?auto_144990 - BLOCK
      ?auto_144994 - BLOCK
      ?auto_144992 - BLOCK
      ?auto_144991 - BLOCK
      ?auto_144995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144987 ?auto_144988 ) ) ( not ( = ?auto_144987 ?auto_144989 ) ) ( not ( = ?auto_144988 ?auto_144989 ) ) ( ON ?auto_144989 ?auto_144993 ) ( not ( = ?auto_144987 ?auto_144993 ) ) ( not ( = ?auto_144988 ?auto_144993 ) ) ( not ( = ?auto_144989 ?auto_144993 ) ) ( ON ?auto_144988 ?auto_144989 ) ( CLEAR ?auto_144988 ) ( ON-TABLE ?auto_144990 ) ( ON ?auto_144994 ?auto_144990 ) ( ON ?auto_144992 ?auto_144994 ) ( ON ?auto_144991 ?auto_144992 ) ( ON ?auto_144993 ?auto_144991 ) ( not ( = ?auto_144990 ?auto_144994 ) ) ( not ( = ?auto_144990 ?auto_144992 ) ) ( not ( = ?auto_144990 ?auto_144991 ) ) ( not ( = ?auto_144990 ?auto_144993 ) ) ( not ( = ?auto_144990 ?auto_144989 ) ) ( not ( = ?auto_144990 ?auto_144988 ) ) ( not ( = ?auto_144994 ?auto_144992 ) ) ( not ( = ?auto_144994 ?auto_144991 ) ) ( not ( = ?auto_144994 ?auto_144993 ) ) ( not ( = ?auto_144994 ?auto_144989 ) ) ( not ( = ?auto_144994 ?auto_144988 ) ) ( not ( = ?auto_144992 ?auto_144991 ) ) ( not ( = ?auto_144992 ?auto_144993 ) ) ( not ( = ?auto_144992 ?auto_144989 ) ) ( not ( = ?auto_144992 ?auto_144988 ) ) ( not ( = ?auto_144991 ?auto_144993 ) ) ( not ( = ?auto_144991 ?auto_144989 ) ) ( not ( = ?auto_144991 ?auto_144988 ) ) ( not ( = ?auto_144987 ?auto_144990 ) ) ( not ( = ?auto_144987 ?auto_144994 ) ) ( not ( = ?auto_144987 ?auto_144992 ) ) ( not ( = ?auto_144987 ?auto_144991 ) ) ( ON ?auto_144987 ?auto_144995 ) ( CLEAR ?auto_144987 ) ( HAND-EMPTY ) ( not ( = ?auto_144987 ?auto_144995 ) ) ( not ( = ?auto_144988 ?auto_144995 ) ) ( not ( = ?auto_144989 ?auto_144995 ) ) ( not ( = ?auto_144993 ?auto_144995 ) ) ( not ( = ?auto_144990 ?auto_144995 ) ) ( not ( = ?auto_144994 ?auto_144995 ) ) ( not ( = ?auto_144992 ?auto_144995 ) ) ( not ( = ?auto_144991 ?auto_144995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144987 ?auto_144995 )
      ( MAKE-3PILE ?auto_144987 ?auto_144988 ?auto_144989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144996 - BLOCK
      ?auto_144997 - BLOCK
      ?auto_144998 - BLOCK
    )
    :vars
    (
      ?auto_145000 - BLOCK
      ?auto_145002 - BLOCK
      ?auto_145001 - BLOCK
      ?auto_145004 - BLOCK
      ?auto_145003 - BLOCK
      ?auto_144999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144996 ?auto_144997 ) ) ( not ( = ?auto_144996 ?auto_144998 ) ) ( not ( = ?auto_144997 ?auto_144998 ) ) ( ON ?auto_144998 ?auto_145000 ) ( not ( = ?auto_144996 ?auto_145000 ) ) ( not ( = ?auto_144997 ?auto_145000 ) ) ( not ( = ?auto_144998 ?auto_145000 ) ) ( ON-TABLE ?auto_145002 ) ( ON ?auto_145001 ?auto_145002 ) ( ON ?auto_145004 ?auto_145001 ) ( ON ?auto_145003 ?auto_145004 ) ( ON ?auto_145000 ?auto_145003 ) ( not ( = ?auto_145002 ?auto_145001 ) ) ( not ( = ?auto_145002 ?auto_145004 ) ) ( not ( = ?auto_145002 ?auto_145003 ) ) ( not ( = ?auto_145002 ?auto_145000 ) ) ( not ( = ?auto_145002 ?auto_144998 ) ) ( not ( = ?auto_145002 ?auto_144997 ) ) ( not ( = ?auto_145001 ?auto_145004 ) ) ( not ( = ?auto_145001 ?auto_145003 ) ) ( not ( = ?auto_145001 ?auto_145000 ) ) ( not ( = ?auto_145001 ?auto_144998 ) ) ( not ( = ?auto_145001 ?auto_144997 ) ) ( not ( = ?auto_145004 ?auto_145003 ) ) ( not ( = ?auto_145004 ?auto_145000 ) ) ( not ( = ?auto_145004 ?auto_144998 ) ) ( not ( = ?auto_145004 ?auto_144997 ) ) ( not ( = ?auto_145003 ?auto_145000 ) ) ( not ( = ?auto_145003 ?auto_144998 ) ) ( not ( = ?auto_145003 ?auto_144997 ) ) ( not ( = ?auto_144996 ?auto_145002 ) ) ( not ( = ?auto_144996 ?auto_145001 ) ) ( not ( = ?auto_144996 ?auto_145004 ) ) ( not ( = ?auto_144996 ?auto_145003 ) ) ( ON ?auto_144996 ?auto_144999 ) ( CLEAR ?auto_144996 ) ( not ( = ?auto_144996 ?auto_144999 ) ) ( not ( = ?auto_144997 ?auto_144999 ) ) ( not ( = ?auto_144998 ?auto_144999 ) ) ( not ( = ?auto_145000 ?auto_144999 ) ) ( not ( = ?auto_145002 ?auto_144999 ) ) ( not ( = ?auto_145001 ?auto_144999 ) ) ( not ( = ?auto_145004 ?auto_144999 ) ) ( not ( = ?auto_145003 ?auto_144999 ) ) ( HOLDING ?auto_144997 ) ( CLEAR ?auto_144998 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145002 ?auto_145001 ?auto_145004 ?auto_145003 ?auto_145000 ?auto_144998 ?auto_144997 )
      ( MAKE-3PILE ?auto_144996 ?auto_144997 ?auto_144998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145005 - BLOCK
      ?auto_145006 - BLOCK
      ?auto_145007 - BLOCK
    )
    :vars
    (
      ?auto_145010 - BLOCK
      ?auto_145011 - BLOCK
      ?auto_145009 - BLOCK
      ?auto_145013 - BLOCK
      ?auto_145012 - BLOCK
      ?auto_145008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145005 ?auto_145006 ) ) ( not ( = ?auto_145005 ?auto_145007 ) ) ( not ( = ?auto_145006 ?auto_145007 ) ) ( ON ?auto_145007 ?auto_145010 ) ( not ( = ?auto_145005 ?auto_145010 ) ) ( not ( = ?auto_145006 ?auto_145010 ) ) ( not ( = ?auto_145007 ?auto_145010 ) ) ( ON-TABLE ?auto_145011 ) ( ON ?auto_145009 ?auto_145011 ) ( ON ?auto_145013 ?auto_145009 ) ( ON ?auto_145012 ?auto_145013 ) ( ON ?auto_145010 ?auto_145012 ) ( not ( = ?auto_145011 ?auto_145009 ) ) ( not ( = ?auto_145011 ?auto_145013 ) ) ( not ( = ?auto_145011 ?auto_145012 ) ) ( not ( = ?auto_145011 ?auto_145010 ) ) ( not ( = ?auto_145011 ?auto_145007 ) ) ( not ( = ?auto_145011 ?auto_145006 ) ) ( not ( = ?auto_145009 ?auto_145013 ) ) ( not ( = ?auto_145009 ?auto_145012 ) ) ( not ( = ?auto_145009 ?auto_145010 ) ) ( not ( = ?auto_145009 ?auto_145007 ) ) ( not ( = ?auto_145009 ?auto_145006 ) ) ( not ( = ?auto_145013 ?auto_145012 ) ) ( not ( = ?auto_145013 ?auto_145010 ) ) ( not ( = ?auto_145013 ?auto_145007 ) ) ( not ( = ?auto_145013 ?auto_145006 ) ) ( not ( = ?auto_145012 ?auto_145010 ) ) ( not ( = ?auto_145012 ?auto_145007 ) ) ( not ( = ?auto_145012 ?auto_145006 ) ) ( not ( = ?auto_145005 ?auto_145011 ) ) ( not ( = ?auto_145005 ?auto_145009 ) ) ( not ( = ?auto_145005 ?auto_145013 ) ) ( not ( = ?auto_145005 ?auto_145012 ) ) ( ON ?auto_145005 ?auto_145008 ) ( not ( = ?auto_145005 ?auto_145008 ) ) ( not ( = ?auto_145006 ?auto_145008 ) ) ( not ( = ?auto_145007 ?auto_145008 ) ) ( not ( = ?auto_145010 ?auto_145008 ) ) ( not ( = ?auto_145011 ?auto_145008 ) ) ( not ( = ?auto_145009 ?auto_145008 ) ) ( not ( = ?auto_145013 ?auto_145008 ) ) ( not ( = ?auto_145012 ?auto_145008 ) ) ( CLEAR ?auto_145007 ) ( ON ?auto_145006 ?auto_145005 ) ( CLEAR ?auto_145006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145008 ?auto_145005 )
      ( MAKE-3PILE ?auto_145005 ?auto_145006 ?auto_145007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145014 - BLOCK
      ?auto_145015 - BLOCK
      ?auto_145016 - BLOCK
    )
    :vars
    (
      ?auto_145020 - BLOCK
      ?auto_145022 - BLOCK
      ?auto_145018 - BLOCK
      ?auto_145017 - BLOCK
      ?auto_145019 - BLOCK
      ?auto_145021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145014 ?auto_145015 ) ) ( not ( = ?auto_145014 ?auto_145016 ) ) ( not ( = ?auto_145015 ?auto_145016 ) ) ( not ( = ?auto_145014 ?auto_145020 ) ) ( not ( = ?auto_145015 ?auto_145020 ) ) ( not ( = ?auto_145016 ?auto_145020 ) ) ( ON-TABLE ?auto_145022 ) ( ON ?auto_145018 ?auto_145022 ) ( ON ?auto_145017 ?auto_145018 ) ( ON ?auto_145019 ?auto_145017 ) ( ON ?auto_145020 ?auto_145019 ) ( not ( = ?auto_145022 ?auto_145018 ) ) ( not ( = ?auto_145022 ?auto_145017 ) ) ( not ( = ?auto_145022 ?auto_145019 ) ) ( not ( = ?auto_145022 ?auto_145020 ) ) ( not ( = ?auto_145022 ?auto_145016 ) ) ( not ( = ?auto_145022 ?auto_145015 ) ) ( not ( = ?auto_145018 ?auto_145017 ) ) ( not ( = ?auto_145018 ?auto_145019 ) ) ( not ( = ?auto_145018 ?auto_145020 ) ) ( not ( = ?auto_145018 ?auto_145016 ) ) ( not ( = ?auto_145018 ?auto_145015 ) ) ( not ( = ?auto_145017 ?auto_145019 ) ) ( not ( = ?auto_145017 ?auto_145020 ) ) ( not ( = ?auto_145017 ?auto_145016 ) ) ( not ( = ?auto_145017 ?auto_145015 ) ) ( not ( = ?auto_145019 ?auto_145020 ) ) ( not ( = ?auto_145019 ?auto_145016 ) ) ( not ( = ?auto_145019 ?auto_145015 ) ) ( not ( = ?auto_145014 ?auto_145022 ) ) ( not ( = ?auto_145014 ?auto_145018 ) ) ( not ( = ?auto_145014 ?auto_145017 ) ) ( not ( = ?auto_145014 ?auto_145019 ) ) ( ON ?auto_145014 ?auto_145021 ) ( not ( = ?auto_145014 ?auto_145021 ) ) ( not ( = ?auto_145015 ?auto_145021 ) ) ( not ( = ?auto_145016 ?auto_145021 ) ) ( not ( = ?auto_145020 ?auto_145021 ) ) ( not ( = ?auto_145022 ?auto_145021 ) ) ( not ( = ?auto_145018 ?auto_145021 ) ) ( not ( = ?auto_145017 ?auto_145021 ) ) ( not ( = ?auto_145019 ?auto_145021 ) ) ( ON ?auto_145015 ?auto_145014 ) ( CLEAR ?auto_145015 ) ( ON-TABLE ?auto_145021 ) ( HOLDING ?auto_145016 ) ( CLEAR ?auto_145020 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145022 ?auto_145018 ?auto_145017 ?auto_145019 ?auto_145020 ?auto_145016 )
      ( MAKE-3PILE ?auto_145014 ?auto_145015 ?auto_145016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145023 - BLOCK
      ?auto_145024 - BLOCK
      ?auto_145025 - BLOCK
    )
    :vars
    (
      ?auto_145027 - BLOCK
      ?auto_145030 - BLOCK
      ?auto_145029 - BLOCK
      ?auto_145031 - BLOCK
      ?auto_145026 - BLOCK
      ?auto_145028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145023 ?auto_145024 ) ) ( not ( = ?auto_145023 ?auto_145025 ) ) ( not ( = ?auto_145024 ?auto_145025 ) ) ( not ( = ?auto_145023 ?auto_145027 ) ) ( not ( = ?auto_145024 ?auto_145027 ) ) ( not ( = ?auto_145025 ?auto_145027 ) ) ( ON-TABLE ?auto_145030 ) ( ON ?auto_145029 ?auto_145030 ) ( ON ?auto_145031 ?auto_145029 ) ( ON ?auto_145026 ?auto_145031 ) ( ON ?auto_145027 ?auto_145026 ) ( not ( = ?auto_145030 ?auto_145029 ) ) ( not ( = ?auto_145030 ?auto_145031 ) ) ( not ( = ?auto_145030 ?auto_145026 ) ) ( not ( = ?auto_145030 ?auto_145027 ) ) ( not ( = ?auto_145030 ?auto_145025 ) ) ( not ( = ?auto_145030 ?auto_145024 ) ) ( not ( = ?auto_145029 ?auto_145031 ) ) ( not ( = ?auto_145029 ?auto_145026 ) ) ( not ( = ?auto_145029 ?auto_145027 ) ) ( not ( = ?auto_145029 ?auto_145025 ) ) ( not ( = ?auto_145029 ?auto_145024 ) ) ( not ( = ?auto_145031 ?auto_145026 ) ) ( not ( = ?auto_145031 ?auto_145027 ) ) ( not ( = ?auto_145031 ?auto_145025 ) ) ( not ( = ?auto_145031 ?auto_145024 ) ) ( not ( = ?auto_145026 ?auto_145027 ) ) ( not ( = ?auto_145026 ?auto_145025 ) ) ( not ( = ?auto_145026 ?auto_145024 ) ) ( not ( = ?auto_145023 ?auto_145030 ) ) ( not ( = ?auto_145023 ?auto_145029 ) ) ( not ( = ?auto_145023 ?auto_145031 ) ) ( not ( = ?auto_145023 ?auto_145026 ) ) ( ON ?auto_145023 ?auto_145028 ) ( not ( = ?auto_145023 ?auto_145028 ) ) ( not ( = ?auto_145024 ?auto_145028 ) ) ( not ( = ?auto_145025 ?auto_145028 ) ) ( not ( = ?auto_145027 ?auto_145028 ) ) ( not ( = ?auto_145030 ?auto_145028 ) ) ( not ( = ?auto_145029 ?auto_145028 ) ) ( not ( = ?auto_145031 ?auto_145028 ) ) ( not ( = ?auto_145026 ?auto_145028 ) ) ( ON ?auto_145024 ?auto_145023 ) ( ON-TABLE ?auto_145028 ) ( CLEAR ?auto_145027 ) ( ON ?auto_145025 ?auto_145024 ) ( CLEAR ?auto_145025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145028 ?auto_145023 ?auto_145024 )
      ( MAKE-3PILE ?auto_145023 ?auto_145024 ?auto_145025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145032 - BLOCK
      ?auto_145033 - BLOCK
      ?auto_145034 - BLOCK
    )
    :vars
    (
      ?auto_145039 - BLOCK
      ?auto_145040 - BLOCK
      ?auto_145035 - BLOCK
      ?auto_145036 - BLOCK
      ?auto_145038 - BLOCK
      ?auto_145037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145032 ?auto_145033 ) ) ( not ( = ?auto_145032 ?auto_145034 ) ) ( not ( = ?auto_145033 ?auto_145034 ) ) ( not ( = ?auto_145032 ?auto_145039 ) ) ( not ( = ?auto_145033 ?auto_145039 ) ) ( not ( = ?auto_145034 ?auto_145039 ) ) ( ON-TABLE ?auto_145040 ) ( ON ?auto_145035 ?auto_145040 ) ( ON ?auto_145036 ?auto_145035 ) ( ON ?auto_145038 ?auto_145036 ) ( not ( = ?auto_145040 ?auto_145035 ) ) ( not ( = ?auto_145040 ?auto_145036 ) ) ( not ( = ?auto_145040 ?auto_145038 ) ) ( not ( = ?auto_145040 ?auto_145039 ) ) ( not ( = ?auto_145040 ?auto_145034 ) ) ( not ( = ?auto_145040 ?auto_145033 ) ) ( not ( = ?auto_145035 ?auto_145036 ) ) ( not ( = ?auto_145035 ?auto_145038 ) ) ( not ( = ?auto_145035 ?auto_145039 ) ) ( not ( = ?auto_145035 ?auto_145034 ) ) ( not ( = ?auto_145035 ?auto_145033 ) ) ( not ( = ?auto_145036 ?auto_145038 ) ) ( not ( = ?auto_145036 ?auto_145039 ) ) ( not ( = ?auto_145036 ?auto_145034 ) ) ( not ( = ?auto_145036 ?auto_145033 ) ) ( not ( = ?auto_145038 ?auto_145039 ) ) ( not ( = ?auto_145038 ?auto_145034 ) ) ( not ( = ?auto_145038 ?auto_145033 ) ) ( not ( = ?auto_145032 ?auto_145040 ) ) ( not ( = ?auto_145032 ?auto_145035 ) ) ( not ( = ?auto_145032 ?auto_145036 ) ) ( not ( = ?auto_145032 ?auto_145038 ) ) ( ON ?auto_145032 ?auto_145037 ) ( not ( = ?auto_145032 ?auto_145037 ) ) ( not ( = ?auto_145033 ?auto_145037 ) ) ( not ( = ?auto_145034 ?auto_145037 ) ) ( not ( = ?auto_145039 ?auto_145037 ) ) ( not ( = ?auto_145040 ?auto_145037 ) ) ( not ( = ?auto_145035 ?auto_145037 ) ) ( not ( = ?auto_145036 ?auto_145037 ) ) ( not ( = ?auto_145038 ?auto_145037 ) ) ( ON ?auto_145033 ?auto_145032 ) ( ON-TABLE ?auto_145037 ) ( ON ?auto_145034 ?auto_145033 ) ( CLEAR ?auto_145034 ) ( HOLDING ?auto_145039 ) ( CLEAR ?auto_145038 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145040 ?auto_145035 ?auto_145036 ?auto_145038 ?auto_145039 )
      ( MAKE-3PILE ?auto_145032 ?auto_145033 ?auto_145034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145041 - BLOCK
      ?auto_145042 - BLOCK
      ?auto_145043 - BLOCK
    )
    :vars
    (
      ?auto_145045 - BLOCK
      ?auto_145047 - BLOCK
      ?auto_145048 - BLOCK
      ?auto_145044 - BLOCK
      ?auto_145049 - BLOCK
      ?auto_145046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145041 ?auto_145042 ) ) ( not ( = ?auto_145041 ?auto_145043 ) ) ( not ( = ?auto_145042 ?auto_145043 ) ) ( not ( = ?auto_145041 ?auto_145045 ) ) ( not ( = ?auto_145042 ?auto_145045 ) ) ( not ( = ?auto_145043 ?auto_145045 ) ) ( ON-TABLE ?auto_145047 ) ( ON ?auto_145048 ?auto_145047 ) ( ON ?auto_145044 ?auto_145048 ) ( ON ?auto_145049 ?auto_145044 ) ( not ( = ?auto_145047 ?auto_145048 ) ) ( not ( = ?auto_145047 ?auto_145044 ) ) ( not ( = ?auto_145047 ?auto_145049 ) ) ( not ( = ?auto_145047 ?auto_145045 ) ) ( not ( = ?auto_145047 ?auto_145043 ) ) ( not ( = ?auto_145047 ?auto_145042 ) ) ( not ( = ?auto_145048 ?auto_145044 ) ) ( not ( = ?auto_145048 ?auto_145049 ) ) ( not ( = ?auto_145048 ?auto_145045 ) ) ( not ( = ?auto_145048 ?auto_145043 ) ) ( not ( = ?auto_145048 ?auto_145042 ) ) ( not ( = ?auto_145044 ?auto_145049 ) ) ( not ( = ?auto_145044 ?auto_145045 ) ) ( not ( = ?auto_145044 ?auto_145043 ) ) ( not ( = ?auto_145044 ?auto_145042 ) ) ( not ( = ?auto_145049 ?auto_145045 ) ) ( not ( = ?auto_145049 ?auto_145043 ) ) ( not ( = ?auto_145049 ?auto_145042 ) ) ( not ( = ?auto_145041 ?auto_145047 ) ) ( not ( = ?auto_145041 ?auto_145048 ) ) ( not ( = ?auto_145041 ?auto_145044 ) ) ( not ( = ?auto_145041 ?auto_145049 ) ) ( ON ?auto_145041 ?auto_145046 ) ( not ( = ?auto_145041 ?auto_145046 ) ) ( not ( = ?auto_145042 ?auto_145046 ) ) ( not ( = ?auto_145043 ?auto_145046 ) ) ( not ( = ?auto_145045 ?auto_145046 ) ) ( not ( = ?auto_145047 ?auto_145046 ) ) ( not ( = ?auto_145048 ?auto_145046 ) ) ( not ( = ?auto_145044 ?auto_145046 ) ) ( not ( = ?auto_145049 ?auto_145046 ) ) ( ON ?auto_145042 ?auto_145041 ) ( ON-TABLE ?auto_145046 ) ( ON ?auto_145043 ?auto_145042 ) ( CLEAR ?auto_145049 ) ( ON ?auto_145045 ?auto_145043 ) ( CLEAR ?auto_145045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145046 ?auto_145041 ?auto_145042 ?auto_145043 )
      ( MAKE-3PILE ?auto_145041 ?auto_145042 ?auto_145043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145050 - BLOCK
      ?auto_145051 - BLOCK
      ?auto_145052 - BLOCK
    )
    :vars
    (
      ?auto_145054 - BLOCK
      ?auto_145053 - BLOCK
      ?auto_145056 - BLOCK
      ?auto_145055 - BLOCK
      ?auto_145058 - BLOCK
      ?auto_145057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145050 ?auto_145051 ) ) ( not ( = ?auto_145050 ?auto_145052 ) ) ( not ( = ?auto_145051 ?auto_145052 ) ) ( not ( = ?auto_145050 ?auto_145054 ) ) ( not ( = ?auto_145051 ?auto_145054 ) ) ( not ( = ?auto_145052 ?auto_145054 ) ) ( ON-TABLE ?auto_145053 ) ( ON ?auto_145056 ?auto_145053 ) ( ON ?auto_145055 ?auto_145056 ) ( not ( = ?auto_145053 ?auto_145056 ) ) ( not ( = ?auto_145053 ?auto_145055 ) ) ( not ( = ?auto_145053 ?auto_145058 ) ) ( not ( = ?auto_145053 ?auto_145054 ) ) ( not ( = ?auto_145053 ?auto_145052 ) ) ( not ( = ?auto_145053 ?auto_145051 ) ) ( not ( = ?auto_145056 ?auto_145055 ) ) ( not ( = ?auto_145056 ?auto_145058 ) ) ( not ( = ?auto_145056 ?auto_145054 ) ) ( not ( = ?auto_145056 ?auto_145052 ) ) ( not ( = ?auto_145056 ?auto_145051 ) ) ( not ( = ?auto_145055 ?auto_145058 ) ) ( not ( = ?auto_145055 ?auto_145054 ) ) ( not ( = ?auto_145055 ?auto_145052 ) ) ( not ( = ?auto_145055 ?auto_145051 ) ) ( not ( = ?auto_145058 ?auto_145054 ) ) ( not ( = ?auto_145058 ?auto_145052 ) ) ( not ( = ?auto_145058 ?auto_145051 ) ) ( not ( = ?auto_145050 ?auto_145053 ) ) ( not ( = ?auto_145050 ?auto_145056 ) ) ( not ( = ?auto_145050 ?auto_145055 ) ) ( not ( = ?auto_145050 ?auto_145058 ) ) ( ON ?auto_145050 ?auto_145057 ) ( not ( = ?auto_145050 ?auto_145057 ) ) ( not ( = ?auto_145051 ?auto_145057 ) ) ( not ( = ?auto_145052 ?auto_145057 ) ) ( not ( = ?auto_145054 ?auto_145057 ) ) ( not ( = ?auto_145053 ?auto_145057 ) ) ( not ( = ?auto_145056 ?auto_145057 ) ) ( not ( = ?auto_145055 ?auto_145057 ) ) ( not ( = ?auto_145058 ?auto_145057 ) ) ( ON ?auto_145051 ?auto_145050 ) ( ON-TABLE ?auto_145057 ) ( ON ?auto_145052 ?auto_145051 ) ( ON ?auto_145054 ?auto_145052 ) ( CLEAR ?auto_145054 ) ( HOLDING ?auto_145058 ) ( CLEAR ?auto_145055 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145053 ?auto_145056 ?auto_145055 ?auto_145058 )
      ( MAKE-3PILE ?auto_145050 ?auto_145051 ?auto_145052 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145059 - BLOCK
      ?auto_145060 - BLOCK
      ?auto_145061 - BLOCK
    )
    :vars
    (
      ?auto_145063 - BLOCK
      ?auto_145067 - BLOCK
      ?auto_145065 - BLOCK
      ?auto_145064 - BLOCK
      ?auto_145066 - BLOCK
      ?auto_145062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145059 ?auto_145060 ) ) ( not ( = ?auto_145059 ?auto_145061 ) ) ( not ( = ?auto_145060 ?auto_145061 ) ) ( not ( = ?auto_145059 ?auto_145063 ) ) ( not ( = ?auto_145060 ?auto_145063 ) ) ( not ( = ?auto_145061 ?auto_145063 ) ) ( ON-TABLE ?auto_145067 ) ( ON ?auto_145065 ?auto_145067 ) ( ON ?auto_145064 ?auto_145065 ) ( not ( = ?auto_145067 ?auto_145065 ) ) ( not ( = ?auto_145067 ?auto_145064 ) ) ( not ( = ?auto_145067 ?auto_145066 ) ) ( not ( = ?auto_145067 ?auto_145063 ) ) ( not ( = ?auto_145067 ?auto_145061 ) ) ( not ( = ?auto_145067 ?auto_145060 ) ) ( not ( = ?auto_145065 ?auto_145064 ) ) ( not ( = ?auto_145065 ?auto_145066 ) ) ( not ( = ?auto_145065 ?auto_145063 ) ) ( not ( = ?auto_145065 ?auto_145061 ) ) ( not ( = ?auto_145065 ?auto_145060 ) ) ( not ( = ?auto_145064 ?auto_145066 ) ) ( not ( = ?auto_145064 ?auto_145063 ) ) ( not ( = ?auto_145064 ?auto_145061 ) ) ( not ( = ?auto_145064 ?auto_145060 ) ) ( not ( = ?auto_145066 ?auto_145063 ) ) ( not ( = ?auto_145066 ?auto_145061 ) ) ( not ( = ?auto_145066 ?auto_145060 ) ) ( not ( = ?auto_145059 ?auto_145067 ) ) ( not ( = ?auto_145059 ?auto_145065 ) ) ( not ( = ?auto_145059 ?auto_145064 ) ) ( not ( = ?auto_145059 ?auto_145066 ) ) ( ON ?auto_145059 ?auto_145062 ) ( not ( = ?auto_145059 ?auto_145062 ) ) ( not ( = ?auto_145060 ?auto_145062 ) ) ( not ( = ?auto_145061 ?auto_145062 ) ) ( not ( = ?auto_145063 ?auto_145062 ) ) ( not ( = ?auto_145067 ?auto_145062 ) ) ( not ( = ?auto_145065 ?auto_145062 ) ) ( not ( = ?auto_145064 ?auto_145062 ) ) ( not ( = ?auto_145066 ?auto_145062 ) ) ( ON ?auto_145060 ?auto_145059 ) ( ON-TABLE ?auto_145062 ) ( ON ?auto_145061 ?auto_145060 ) ( ON ?auto_145063 ?auto_145061 ) ( CLEAR ?auto_145064 ) ( ON ?auto_145066 ?auto_145063 ) ( CLEAR ?auto_145066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145062 ?auto_145059 ?auto_145060 ?auto_145061 ?auto_145063 )
      ( MAKE-3PILE ?auto_145059 ?auto_145060 ?auto_145061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145068 - BLOCK
      ?auto_145069 - BLOCK
      ?auto_145070 - BLOCK
    )
    :vars
    (
      ?auto_145076 - BLOCK
      ?auto_145073 - BLOCK
      ?auto_145072 - BLOCK
      ?auto_145075 - BLOCK
      ?auto_145071 - BLOCK
      ?auto_145074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145068 ?auto_145069 ) ) ( not ( = ?auto_145068 ?auto_145070 ) ) ( not ( = ?auto_145069 ?auto_145070 ) ) ( not ( = ?auto_145068 ?auto_145076 ) ) ( not ( = ?auto_145069 ?auto_145076 ) ) ( not ( = ?auto_145070 ?auto_145076 ) ) ( ON-TABLE ?auto_145073 ) ( ON ?auto_145072 ?auto_145073 ) ( not ( = ?auto_145073 ?auto_145072 ) ) ( not ( = ?auto_145073 ?auto_145075 ) ) ( not ( = ?auto_145073 ?auto_145071 ) ) ( not ( = ?auto_145073 ?auto_145076 ) ) ( not ( = ?auto_145073 ?auto_145070 ) ) ( not ( = ?auto_145073 ?auto_145069 ) ) ( not ( = ?auto_145072 ?auto_145075 ) ) ( not ( = ?auto_145072 ?auto_145071 ) ) ( not ( = ?auto_145072 ?auto_145076 ) ) ( not ( = ?auto_145072 ?auto_145070 ) ) ( not ( = ?auto_145072 ?auto_145069 ) ) ( not ( = ?auto_145075 ?auto_145071 ) ) ( not ( = ?auto_145075 ?auto_145076 ) ) ( not ( = ?auto_145075 ?auto_145070 ) ) ( not ( = ?auto_145075 ?auto_145069 ) ) ( not ( = ?auto_145071 ?auto_145076 ) ) ( not ( = ?auto_145071 ?auto_145070 ) ) ( not ( = ?auto_145071 ?auto_145069 ) ) ( not ( = ?auto_145068 ?auto_145073 ) ) ( not ( = ?auto_145068 ?auto_145072 ) ) ( not ( = ?auto_145068 ?auto_145075 ) ) ( not ( = ?auto_145068 ?auto_145071 ) ) ( ON ?auto_145068 ?auto_145074 ) ( not ( = ?auto_145068 ?auto_145074 ) ) ( not ( = ?auto_145069 ?auto_145074 ) ) ( not ( = ?auto_145070 ?auto_145074 ) ) ( not ( = ?auto_145076 ?auto_145074 ) ) ( not ( = ?auto_145073 ?auto_145074 ) ) ( not ( = ?auto_145072 ?auto_145074 ) ) ( not ( = ?auto_145075 ?auto_145074 ) ) ( not ( = ?auto_145071 ?auto_145074 ) ) ( ON ?auto_145069 ?auto_145068 ) ( ON-TABLE ?auto_145074 ) ( ON ?auto_145070 ?auto_145069 ) ( ON ?auto_145076 ?auto_145070 ) ( ON ?auto_145071 ?auto_145076 ) ( CLEAR ?auto_145071 ) ( HOLDING ?auto_145075 ) ( CLEAR ?auto_145072 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145073 ?auto_145072 ?auto_145075 )
      ( MAKE-3PILE ?auto_145068 ?auto_145069 ?auto_145070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145077 - BLOCK
      ?auto_145078 - BLOCK
      ?auto_145079 - BLOCK
    )
    :vars
    (
      ?auto_145080 - BLOCK
      ?auto_145085 - BLOCK
      ?auto_145083 - BLOCK
      ?auto_145082 - BLOCK
      ?auto_145081 - BLOCK
      ?auto_145084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145077 ?auto_145078 ) ) ( not ( = ?auto_145077 ?auto_145079 ) ) ( not ( = ?auto_145078 ?auto_145079 ) ) ( not ( = ?auto_145077 ?auto_145080 ) ) ( not ( = ?auto_145078 ?auto_145080 ) ) ( not ( = ?auto_145079 ?auto_145080 ) ) ( ON-TABLE ?auto_145085 ) ( ON ?auto_145083 ?auto_145085 ) ( not ( = ?auto_145085 ?auto_145083 ) ) ( not ( = ?auto_145085 ?auto_145082 ) ) ( not ( = ?auto_145085 ?auto_145081 ) ) ( not ( = ?auto_145085 ?auto_145080 ) ) ( not ( = ?auto_145085 ?auto_145079 ) ) ( not ( = ?auto_145085 ?auto_145078 ) ) ( not ( = ?auto_145083 ?auto_145082 ) ) ( not ( = ?auto_145083 ?auto_145081 ) ) ( not ( = ?auto_145083 ?auto_145080 ) ) ( not ( = ?auto_145083 ?auto_145079 ) ) ( not ( = ?auto_145083 ?auto_145078 ) ) ( not ( = ?auto_145082 ?auto_145081 ) ) ( not ( = ?auto_145082 ?auto_145080 ) ) ( not ( = ?auto_145082 ?auto_145079 ) ) ( not ( = ?auto_145082 ?auto_145078 ) ) ( not ( = ?auto_145081 ?auto_145080 ) ) ( not ( = ?auto_145081 ?auto_145079 ) ) ( not ( = ?auto_145081 ?auto_145078 ) ) ( not ( = ?auto_145077 ?auto_145085 ) ) ( not ( = ?auto_145077 ?auto_145083 ) ) ( not ( = ?auto_145077 ?auto_145082 ) ) ( not ( = ?auto_145077 ?auto_145081 ) ) ( ON ?auto_145077 ?auto_145084 ) ( not ( = ?auto_145077 ?auto_145084 ) ) ( not ( = ?auto_145078 ?auto_145084 ) ) ( not ( = ?auto_145079 ?auto_145084 ) ) ( not ( = ?auto_145080 ?auto_145084 ) ) ( not ( = ?auto_145085 ?auto_145084 ) ) ( not ( = ?auto_145083 ?auto_145084 ) ) ( not ( = ?auto_145082 ?auto_145084 ) ) ( not ( = ?auto_145081 ?auto_145084 ) ) ( ON ?auto_145078 ?auto_145077 ) ( ON-TABLE ?auto_145084 ) ( ON ?auto_145079 ?auto_145078 ) ( ON ?auto_145080 ?auto_145079 ) ( ON ?auto_145081 ?auto_145080 ) ( CLEAR ?auto_145083 ) ( ON ?auto_145082 ?auto_145081 ) ( CLEAR ?auto_145082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145084 ?auto_145077 ?auto_145078 ?auto_145079 ?auto_145080 ?auto_145081 )
      ( MAKE-3PILE ?auto_145077 ?auto_145078 ?auto_145079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145086 - BLOCK
      ?auto_145087 - BLOCK
      ?auto_145088 - BLOCK
    )
    :vars
    (
      ?auto_145089 - BLOCK
      ?auto_145090 - BLOCK
      ?auto_145093 - BLOCK
      ?auto_145091 - BLOCK
      ?auto_145094 - BLOCK
      ?auto_145092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145086 ?auto_145087 ) ) ( not ( = ?auto_145086 ?auto_145088 ) ) ( not ( = ?auto_145087 ?auto_145088 ) ) ( not ( = ?auto_145086 ?auto_145089 ) ) ( not ( = ?auto_145087 ?auto_145089 ) ) ( not ( = ?auto_145088 ?auto_145089 ) ) ( ON-TABLE ?auto_145090 ) ( not ( = ?auto_145090 ?auto_145093 ) ) ( not ( = ?auto_145090 ?auto_145091 ) ) ( not ( = ?auto_145090 ?auto_145094 ) ) ( not ( = ?auto_145090 ?auto_145089 ) ) ( not ( = ?auto_145090 ?auto_145088 ) ) ( not ( = ?auto_145090 ?auto_145087 ) ) ( not ( = ?auto_145093 ?auto_145091 ) ) ( not ( = ?auto_145093 ?auto_145094 ) ) ( not ( = ?auto_145093 ?auto_145089 ) ) ( not ( = ?auto_145093 ?auto_145088 ) ) ( not ( = ?auto_145093 ?auto_145087 ) ) ( not ( = ?auto_145091 ?auto_145094 ) ) ( not ( = ?auto_145091 ?auto_145089 ) ) ( not ( = ?auto_145091 ?auto_145088 ) ) ( not ( = ?auto_145091 ?auto_145087 ) ) ( not ( = ?auto_145094 ?auto_145089 ) ) ( not ( = ?auto_145094 ?auto_145088 ) ) ( not ( = ?auto_145094 ?auto_145087 ) ) ( not ( = ?auto_145086 ?auto_145090 ) ) ( not ( = ?auto_145086 ?auto_145093 ) ) ( not ( = ?auto_145086 ?auto_145091 ) ) ( not ( = ?auto_145086 ?auto_145094 ) ) ( ON ?auto_145086 ?auto_145092 ) ( not ( = ?auto_145086 ?auto_145092 ) ) ( not ( = ?auto_145087 ?auto_145092 ) ) ( not ( = ?auto_145088 ?auto_145092 ) ) ( not ( = ?auto_145089 ?auto_145092 ) ) ( not ( = ?auto_145090 ?auto_145092 ) ) ( not ( = ?auto_145093 ?auto_145092 ) ) ( not ( = ?auto_145091 ?auto_145092 ) ) ( not ( = ?auto_145094 ?auto_145092 ) ) ( ON ?auto_145087 ?auto_145086 ) ( ON-TABLE ?auto_145092 ) ( ON ?auto_145088 ?auto_145087 ) ( ON ?auto_145089 ?auto_145088 ) ( ON ?auto_145094 ?auto_145089 ) ( ON ?auto_145091 ?auto_145094 ) ( CLEAR ?auto_145091 ) ( HOLDING ?auto_145093 ) ( CLEAR ?auto_145090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145090 ?auto_145093 )
      ( MAKE-3PILE ?auto_145086 ?auto_145087 ?auto_145088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145095 - BLOCK
      ?auto_145096 - BLOCK
      ?auto_145097 - BLOCK
    )
    :vars
    (
      ?auto_145098 - BLOCK
      ?auto_145103 - BLOCK
      ?auto_145100 - BLOCK
      ?auto_145101 - BLOCK
      ?auto_145099 - BLOCK
      ?auto_145102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145095 ?auto_145096 ) ) ( not ( = ?auto_145095 ?auto_145097 ) ) ( not ( = ?auto_145096 ?auto_145097 ) ) ( not ( = ?auto_145095 ?auto_145098 ) ) ( not ( = ?auto_145096 ?auto_145098 ) ) ( not ( = ?auto_145097 ?auto_145098 ) ) ( ON-TABLE ?auto_145103 ) ( not ( = ?auto_145103 ?auto_145100 ) ) ( not ( = ?auto_145103 ?auto_145101 ) ) ( not ( = ?auto_145103 ?auto_145099 ) ) ( not ( = ?auto_145103 ?auto_145098 ) ) ( not ( = ?auto_145103 ?auto_145097 ) ) ( not ( = ?auto_145103 ?auto_145096 ) ) ( not ( = ?auto_145100 ?auto_145101 ) ) ( not ( = ?auto_145100 ?auto_145099 ) ) ( not ( = ?auto_145100 ?auto_145098 ) ) ( not ( = ?auto_145100 ?auto_145097 ) ) ( not ( = ?auto_145100 ?auto_145096 ) ) ( not ( = ?auto_145101 ?auto_145099 ) ) ( not ( = ?auto_145101 ?auto_145098 ) ) ( not ( = ?auto_145101 ?auto_145097 ) ) ( not ( = ?auto_145101 ?auto_145096 ) ) ( not ( = ?auto_145099 ?auto_145098 ) ) ( not ( = ?auto_145099 ?auto_145097 ) ) ( not ( = ?auto_145099 ?auto_145096 ) ) ( not ( = ?auto_145095 ?auto_145103 ) ) ( not ( = ?auto_145095 ?auto_145100 ) ) ( not ( = ?auto_145095 ?auto_145101 ) ) ( not ( = ?auto_145095 ?auto_145099 ) ) ( ON ?auto_145095 ?auto_145102 ) ( not ( = ?auto_145095 ?auto_145102 ) ) ( not ( = ?auto_145096 ?auto_145102 ) ) ( not ( = ?auto_145097 ?auto_145102 ) ) ( not ( = ?auto_145098 ?auto_145102 ) ) ( not ( = ?auto_145103 ?auto_145102 ) ) ( not ( = ?auto_145100 ?auto_145102 ) ) ( not ( = ?auto_145101 ?auto_145102 ) ) ( not ( = ?auto_145099 ?auto_145102 ) ) ( ON ?auto_145096 ?auto_145095 ) ( ON-TABLE ?auto_145102 ) ( ON ?auto_145097 ?auto_145096 ) ( ON ?auto_145098 ?auto_145097 ) ( ON ?auto_145099 ?auto_145098 ) ( ON ?auto_145101 ?auto_145099 ) ( CLEAR ?auto_145103 ) ( ON ?auto_145100 ?auto_145101 ) ( CLEAR ?auto_145100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145102 ?auto_145095 ?auto_145096 ?auto_145097 ?auto_145098 ?auto_145099 ?auto_145101 )
      ( MAKE-3PILE ?auto_145095 ?auto_145096 ?auto_145097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145104 - BLOCK
      ?auto_145105 - BLOCK
      ?auto_145106 - BLOCK
    )
    :vars
    (
      ?auto_145108 - BLOCK
      ?auto_145107 - BLOCK
      ?auto_145111 - BLOCK
      ?auto_145109 - BLOCK
      ?auto_145112 - BLOCK
      ?auto_145110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145104 ?auto_145105 ) ) ( not ( = ?auto_145104 ?auto_145106 ) ) ( not ( = ?auto_145105 ?auto_145106 ) ) ( not ( = ?auto_145104 ?auto_145108 ) ) ( not ( = ?auto_145105 ?auto_145108 ) ) ( not ( = ?auto_145106 ?auto_145108 ) ) ( not ( = ?auto_145107 ?auto_145111 ) ) ( not ( = ?auto_145107 ?auto_145109 ) ) ( not ( = ?auto_145107 ?auto_145112 ) ) ( not ( = ?auto_145107 ?auto_145108 ) ) ( not ( = ?auto_145107 ?auto_145106 ) ) ( not ( = ?auto_145107 ?auto_145105 ) ) ( not ( = ?auto_145111 ?auto_145109 ) ) ( not ( = ?auto_145111 ?auto_145112 ) ) ( not ( = ?auto_145111 ?auto_145108 ) ) ( not ( = ?auto_145111 ?auto_145106 ) ) ( not ( = ?auto_145111 ?auto_145105 ) ) ( not ( = ?auto_145109 ?auto_145112 ) ) ( not ( = ?auto_145109 ?auto_145108 ) ) ( not ( = ?auto_145109 ?auto_145106 ) ) ( not ( = ?auto_145109 ?auto_145105 ) ) ( not ( = ?auto_145112 ?auto_145108 ) ) ( not ( = ?auto_145112 ?auto_145106 ) ) ( not ( = ?auto_145112 ?auto_145105 ) ) ( not ( = ?auto_145104 ?auto_145107 ) ) ( not ( = ?auto_145104 ?auto_145111 ) ) ( not ( = ?auto_145104 ?auto_145109 ) ) ( not ( = ?auto_145104 ?auto_145112 ) ) ( ON ?auto_145104 ?auto_145110 ) ( not ( = ?auto_145104 ?auto_145110 ) ) ( not ( = ?auto_145105 ?auto_145110 ) ) ( not ( = ?auto_145106 ?auto_145110 ) ) ( not ( = ?auto_145108 ?auto_145110 ) ) ( not ( = ?auto_145107 ?auto_145110 ) ) ( not ( = ?auto_145111 ?auto_145110 ) ) ( not ( = ?auto_145109 ?auto_145110 ) ) ( not ( = ?auto_145112 ?auto_145110 ) ) ( ON ?auto_145105 ?auto_145104 ) ( ON-TABLE ?auto_145110 ) ( ON ?auto_145106 ?auto_145105 ) ( ON ?auto_145108 ?auto_145106 ) ( ON ?auto_145112 ?auto_145108 ) ( ON ?auto_145109 ?auto_145112 ) ( ON ?auto_145111 ?auto_145109 ) ( CLEAR ?auto_145111 ) ( HOLDING ?auto_145107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145107 )
      ( MAKE-3PILE ?auto_145104 ?auto_145105 ?auto_145106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145113 - BLOCK
      ?auto_145114 - BLOCK
      ?auto_145115 - BLOCK
    )
    :vars
    (
      ?auto_145117 - BLOCK
      ?auto_145121 - BLOCK
      ?auto_145118 - BLOCK
      ?auto_145119 - BLOCK
      ?auto_145116 - BLOCK
      ?auto_145120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145113 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145115 ) ) ( not ( = ?auto_145114 ?auto_145115 ) ) ( not ( = ?auto_145113 ?auto_145117 ) ) ( not ( = ?auto_145114 ?auto_145117 ) ) ( not ( = ?auto_145115 ?auto_145117 ) ) ( not ( = ?auto_145121 ?auto_145118 ) ) ( not ( = ?auto_145121 ?auto_145119 ) ) ( not ( = ?auto_145121 ?auto_145116 ) ) ( not ( = ?auto_145121 ?auto_145117 ) ) ( not ( = ?auto_145121 ?auto_145115 ) ) ( not ( = ?auto_145121 ?auto_145114 ) ) ( not ( = ?auto_145118 ?auto_145119 ) ) ( not ( = ?auto_145118 ?auto_145116 ) ) ( not ( = ?auto_145118 ?auto_145117 ) ) ( not ( = ?auto_145118 ?auto_145115 ) ) ( not ( = ?auto_145118 ?auto_145114 ) ) ( not ( = ?auto_145119 ?auto_145116 ) ) ( not ( = ?auto_145119 ?auto_145117 ) ) ( not ( = ?auto_145119 ?auto_145115 ) ) ( not ( = ?auto_145119 ?auto_145114 ) ) ( not ( = ?auto_145116 ?auto_145117 ) ) ( not ( = ?auto_145116 ?auto_145115 ) ) ( not ( = ?auto_145116 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145121 ) ) ( not ( = ?auto_145113 ?auto_145118 ) ) ( not ( = ?auto_145113 ?auto_145119 ) ) ( not ( = ?auto_145113 ?auto_145116 ) ) ( ON ?auto_145113 ?auto_145120 ) ( not ( = ?auto_145113 ?auto_145120 ) ) ( not ( = ?auto_145114 ?auto_145120 ) ) ( not ( = ?auto_145115 ?auto_145120 ) ) ( not ( = ?auto_145117 ?auto_145120 ) ) ( not ( = ?auto_145121 ?auto_145120 ) ) ( not ( = ?auto_145118 ?auto_145120 ) ) ( not ( = ?auto_145119 ?auto_145120 ) ) ( not ( = ?auto_145116 ?auto_145120 ) ) ( ON ?auto_145114 ?auto_145113 ) ( ON-TABLE ?auto_145120 ) ( ON ?auto_145115 ?auto_145114 ) ( ON ?auto_145117 ?auto_145115 ) ( ON ?auto_145116 ?auto_145117 ) ( ON ?auto_145119 ?auto_145116 ) ( ON ?auto_145118 ?auto_145119 ) ( ON ?auto_145121 ?auto_145118 ) ( CLEAR ?auto_145121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145120 ?auto_145113 ?auto_145114 ?auto_145115 ?auto_145117 ?auto_145116 ?auto_145119 ?auto_145118 )
      ( MAKE-3PILE ?auto_145113 ?auto_145114 ?auto_145115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145145 - BLOCK
      ?auto_145146 - BLOCK
      ?auto_145147 - BLOCK
      ?auto_145148 - BLOCK
    )
    :vars
    (
      ?auto_145151 - BLOCK
      ?auto_145149 - BLOCK
      ?auto_145150 - BLOCK
      ?auto_145152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145151 ?auto_145148 ) ( ON-TABLE ?auto_145145 ) ( ON ?auto_145146 ?auto_145145 ) ( ON ?auto_145147 ?auto_145146 ) ( ON ?auto_145148 ?auto_145147 ) ( not ( = ?auto_145145 ?auto_145146 ) ) ( not ( = ?auto_145145 ?auto_145147 ) ) ( not ( = ?auto_145145 ?auto_145148 ) ) ( not ( = ?auto_145145 ?auto_145151 ) ) ( not ( = ?auto_145146 ?auto_145147 ) ) ( not ( = ?auto_145146 ?auto_145148 ) ) ( not ( = ?auto_145146 ?auto_145151 ) ) ( not ( = ?auto_145147 ?auto_145148 ) ) ( not ( = ?auto_145147 ?auto_145151 ) ) ( not ( = ?auto_145148 ?auto_145151 ) ) ( not ( = ?auto_145145 ?auto_145149 ) ) ( not ( = ?auto_145145 ?auto_145150 ) ) ( not ( = ?auto_145146 ?auto_145149 ) ) ( not ( = ?auto_145146 ?auto_145150 ) ) ( not ( = ?auto_145147 ?auto_145149 ) ) ( not ( = ?auto_145147 ?auto_145150 ) ) ( not ( = ?auto_145148 ?auto_145149 ) ) ( not ( = ?auto_145148 ?auto_145150 ) ) ( not ( = ?auto_145151 ?auto_145149 ) ) ( not ( = ?auto_145151 ?auto_145150 ) ) ( not ( = ?auto_145149 ?auto_145150 ) ) ( ON ?auto_145149 ?auto_145151 ) ( CLEAR ?auto_145149 ) ( HOLDING ?auto_145150 ) ( CLEAR ?auto_145152 ) ( ON-TABLE ?auto_145152 ) ( not ( = ?auto_145152 ?auto_145150 ) ) ( not ( = ?auto_145145 ?auto_145152 ) ) ( not ( = ?auto_145146 ?auto_145152 ) ) ( not ( = ?auto_145147 ?auto_145152 ) ) ( not ( = ?auto_145148 ?auto_145152 ) ) ( not ( = ?auto_145151 ?auto_145152 ) ) ( not ( = ?auto_145149 ?auto_145152 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145152 ?auto_145150 )
      ( MAKE-4PILE ?auto_145145 ?auto_145146 ?auto_145147 ?auto_145148 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145153 - BLOCK
      ?auto_145154 - BLOCK
      ?auto_145155 - BLOCK
      ?auto_145156 - BLOCK
    )
    :vars
    (
      ?auto_145160 - BLOCK
      ?auto_145157 - BLOCK
      ?auto_145159 - BLOCK
      ?auto_145158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145160 ?auto_145156 ) ( ON-TABLE ?auto_145153 ) ( ON ?auto_145154 ?auto_145153 ) ( ON ?auto_145155 ?auto_145154 ) ( ON ?auto_145156 ?auto_145155 ) ( not ( = ?auto_145153 ?auto_145154 ) ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145156 ) ) ( not ( = ?auto_145153 ?auto_145160 ) ) ( not ( = ?auto_145154 ?auto_145155 ) ) ( not ( = ?auto_145154 ?auto_145156 ) ) ( not ( = ?auto_145154 ?auto_145160 ) ) ( not ( = ?auto_145155 ?auto_145156 ) ) ( not ( = ?auto_145155 ?auto_145160 ) ) ( not ( = ?auto_145156 ?auto_145160 ) ) ( not ( = ?auto_145153 ?auto_145157 ) ) ( not ( = ?auto_145153 ?auto_145159 ) ) ( not ( = ?auto_145154 ?auto_145157 ) ) ( not ( = ?auto_145154 ?auto_145159 ) ) ( not ( = ?auto_145155 ?auto_145157 ) ) ( not ( = ?auto_145155 ?auto_145159 ) ) ( not ( = ?auto_145156 ?auto_145157 ) ) ( not ( = ?auto_145156 ?auto_145159 ) ) ( not ( = ?auto_145160 ?auto_145157 ) ) ( not ( = ?auto_145160 ?auto_145159 ) ) ( not ( = ?auto_145157 ?auto_145159 ) ) ( ON ?auto_145157 ?auto_145160 ) ( CLEAR ?auto_145158 ) ( ON-TABLE ?auto_145158 ) ( not ( = ?auto_145158 ?auto_145159 ) ) ( not ( = ?auto_145153 ?auto_145158 ) ) ( not ( = ?auto_145154 ?auto_145158 ) ) ( not ( = ?auto_145155 ?auto_145158 ) ) ( not ( = ?auto_145156 ?auto_145158 ) ) ( not ( = ?auto_145160 ?auto_145158 ) ) ( not ( = ?auto_145157 ?auto_145158 ) ) ( ON ?auto_145159 ?auto_145157 ) ( CLEAR ?auto_145159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145156 ?auto_145160 ?auto_145157 )
      ( MAKE-4PILE ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145161 - BLOCK
      ?auto_145162 - BLOCK
      ?auto_145163 - BLOCK
      ?auto_145164 - BLOCK
    )
    :vars
    (
      ?auto_145165 - BLOCK
      ?auto_145168 - BLOCK
      ?auto_145167 - BLOCK
      ?auto_145166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145165 ?auto_145164 ) ( ON-TABLE ?auto_145161 ) ( ON ?auto_145162 ?auto_145161 ) ( ON ?auto_145163 ?auto_145162 ) ( ON ?auto_145164 ?auto_145163 ) ( not ( = ?auto_145161 ?auto_145162 ) ) ( not ( = ?auto_145161 ?auto_145163 ) ) ( not ( = ?auto_145161 ?auto_145164 ) ) ( not ( = ?auto_145161 ?auto_145165 ) ) ( not ( = ?auto_145162 ?auto_145163 ) ) ( not ( = ?auto_145162 ?auto_145164 ) ) ( not ( = ?auto_145162 ?auto_145165 ) ) ( not ( = ?auto_145163 ?auto_145164 ) ) ( not ( = ?auto_145163 ?auto_145165 ) ) ( not ( = ?auto_145164 ?auto_145165 ) ) ( not ( = ?auto_145161 ?auto_145168 ) ) ( not ( = ?auto_145161 ?auto_145167 ) ) ( not ( = ?auto_145162 ?auto_145168 ) ) ( not ( = ?auto_145162 ?auto_145167 ) ) ( not ( = ?auto_145163 ?auto_145168 ) ) ( not ( = ?auto_145163 ?auto_145167 ) ) ( not ( = ?auto_145164 ?auto_145168 ) ) ( not ( = ?auto_145164 ?auto_145167 ) ) ( not ( = ?auto_145165 ?auto_145168 ) ) ( not ( = ?auto_145165 ?auto_145167 ) ) ( not ( = ?auto_145168 ?auto_145167 ) ) ( ON ?auto_145168 ?auto_145165 ) ( not ( = ?auto_145166 ?auto_145167 ) ) ( not ( = ?auto_145161 ?auto_145166 ) ) ( not ( = ?auto_145162 ?auto_145166 ) ) ( not ( = ?auto_145163 ?auto_145166 ) ) ( not ( = ?auto_145164 ?auto_145166 ) ) ( not ( = ?auto_145165 ?auto_145166 ) ) ( not ( = ?auto_145168 ?auto_145166 ) ) ( ON ?auto_145167 ?auto_145168 ) ( CLEAR ?auto_145167 ) ( HOLDING ?auto_145166 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145166 )
      ( MAKE-4PILE ?auto_145161 ?auto_145162 ?auto_145163 ?auto_145164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145181 - BLOCK
      ?auto_145182 - BLOCK
      ?auto_145183 - BLOCK
      ?auto_145184 - BLOCK
    )
    :vars
    (
      ?auto_145186 - BLOCK
      ?auto_145188 - BLOCK
      ?auto_145185 - BLOCK
      ?auto_145187 - BLOCK
      ?auto_145189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145186 ?auto_145184 ) ( ON-TABLE ?auto_145181 ) ( ON ?auto_145182 ?auto_145181 ) ( ON ?auto_145183 ?auto_145182 ) ( ON ?auto_145184 ?auto_145183 ) ( not ( = ?auto_145181 ?auto_145182 ) ) ( not ( = ?auto_145181 ?auto_145183 ) ) ( not ( = ?auto_145181 ?auto_145184 ) ) ( not ( = ?auto_145181 ?auto_145186 ) ) ( not ( = ?auto_145182 ?auto_145183 ) ) ( not ( = ?auto_145182 ?auto_145184 ) ) ( not ( = ?auto_145182 ?auto_145186 ) ) ( not ( = ?auto_145183 ?auto_145184 ) ) ( not ( = ?auto_145183 ?auto_145186 ) ) ( not ( = ?auto_145184 ?auto_145186 ) ) ( not ( = ?auto_145181 ?auto_145188 ) ) ( not ( = ?auto_145181 ?auto_145185 ) ) ( not ( = ?auto_145182 ?auto_145188 ) ) ( not ( = ?auto_145182 ?auto_145185 ) ) ( not ( = ?auto_145183 ?auto_145188 ) ) ( not ( = ?auto_145183 ?auto_145185 ) ) ( not ( = ?auto_145184 ?auto_145188 ) ) ( not ( = ?auto_145184 ?auto_145185 ) ) ( not ( = ?auto_145186 ?auto_145188 ) ) ( not ( = ?auto_145186 ?auto_145185 ) ) ( not ( = ?auto_145188 ?auto_145185 ) ) ( ON ?auto_145188 ?auto_145186 ) ( not ( = ?auto_145187 ?auto_145185 ) ) ( not ( = ?auto_145181 ?auto_145187 ) ) ( not ( = ?auto_145182 ?auto_145187 ) ) ( not ( = ?auto_145183 ?auto_145187 ) ) ( not ( = ?auto_145184 ?auto_145187 ) ) ( not ( = ?auto_145186 ?auto_145187 ) ) ( not ( = ?auto_145188 ?auto_145187 ) ) ( ON ?auto_145185 ?auto_145188 ) ( CLEAR ?auto_145185 ) ( ON ?auto_145187 ?auto_145189 ) ( CLEAR ?auto_145187 ) ( HAND-EMPTY ) ( not ( = ?auto_145181 ?auto_145189 ) ) ( not ( = ?auto_145182 ?auto_145189 ) ) ( not ( = ?auto_145183 ?auto_145189 ) ) ( not ( = ?auto_145184 ?auto_145189 ) ) ( not ( = ?auto_145186 ?auto_145189 ) ) ( not ( = ?auto_145188 ?auto_145189 ) ) ( not ( = ?auto_145185 ?auto_145189 ) ) ( not ( = ?auto_145187 ?auto_145189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145187 ?auto_145189 )
      ( MAKE-4PILE ?auto_145181 ?auto_145182 ?auto_145183 ?auto_145184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145190 - BLOCK
      ?auto_145191 - BLOCK
      ?auto_145192 - BLOCK
      ?auto_145193 - BLOCK
    )
    :vars
    (
      ?auto_145195 - BLOCK
      ?auto_145198 - BLOCK
      ?auto_145196 - BLOCK
      ?auto_145194 - BLOCK
      ?auto_145197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145195 ?auto_145193 ) ( ON-TABLE ?auto_145190 ) ( ON ?auto_145191 ?auto_145190 ) ( ON ?auto_145192 ?auto_145191 ) ( ON ?auto_145193 ?auto_145192 ) ( not ( = ?auto_145190 ?auto_145191 ) ) ( not ( = ?auto_145190 ?auto_145192 ) ) ( not ( = ?auto_145190 ?auto_145193 ) ) ( not ( = ?auto_145190 ?auto_145195 ) ) ( not ( = ?auto_145191 ?auto_145192 ) ) ( not ( = ?auto_145191 ?auto_145193 ) ) ( not ( = ?auto_145191 ?auto_145195 ) ) ( not ( = ?auto_145192 ?auto_145193 ) ) ( not ( = ?auto_145192 ?auto_145195 ) ) ( not ( = ?auto_145193 ?auto_145195 ) ) ( not ( = ?auto_145190 ?auto_145198 ) ) ( not ( = ?auto_145190 ?auto_145196 ) ) ( not ( = ?auto_145191 ?auto_145198 ) ) ( not ( = ?auto_145191 ?auto_145196 ) ) ( not ( = ?auto_145192 ?auto_145198 ) ) ( not ( = ?auto_145192 ?auto_145196 ) ) ( not ( = ?auto_145193 ?auto_145198 ) ) ( not ( = ?auto_145193 ?auto_145196 ) ) ( not ( = ?auto_145195 ?auto_145198 ) ) ( not ( = ?auto_145195 ?auto_145196 ) ) ( not ( = ?auto_145198 ?auto_145196 ) ) ( ON ?auto_145198 ?auto_145195 ) ( not ( = ?auto_145194 ?auto_145196 ) ) ( not ( = ?auto_145190 ?auto_145194 ) ) ( not ( = ?auto_145191 ?auto_145194 ) ) ( not ( = ?auto_145192 ?auto_145194 ) ) ( not ( = ?auto_145193 ?auto_145194 ) ) ( not ( = ?auto_145195 ?auto_145194 ) ) ( not ( = ?auto_145198 ?auto_145194 ) ) ( ON ?auto_145194 ?auto_145197 ) ( CLEAR ?auto_145194 ) ( not ( = ?auto_145190 ?auto_145197 ) ) ( not ( = ?auto_145191 ?auto_145197 ) ) ( not ( = ?auto_145192 ?auto_145197 ) ) ( not ( = ?auto_145193 ?auto_145197 ) ) ( not ( = ?auto_145195 ?auto_145197 ) ) ( not ( = ?auto_145198 ?auto_145197 ) ) ( not ( = ?auto_145196 ?auto_145197 ) ) ( not ( = ?auto_145194 ?auto_145197 ) ) ( HOLDING ?auto_145196 ) ( CLEAR ?auto_145198 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145190 ?auto_145191 ?auto_145192 ?auto_145193 ?auto_145195 ?auto_145198 ?auto_145196 )
      ( MAKE-4PILE ?auto_145190 ?auto_145191 ?auto_145192 ?auto_145193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145272 - BLOCK
      ?auto_145273 - BLOCK
      ?auto_145274 - BLOCK
      ?auto_145275 - BLOCK
    )
    :vars
    (
      ?auto_145276 - BLOCK
      ?auto_145279 - BLOCK
      ?auto_145277 - BLOCK
      ?auto_145278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145272 ) ( ON ?auto_145273 ?auto_145272 ) ( not ( = ?auto_145272 ?auto_145273 ) ) ( not ( = ?auto_145272 ?auto_145274 ) ) ( not ( = ?auto_145272 ?auto_145275 ) ) ( not ( = ?auto_145273 ?auto_145274 ) ) ( not ( = ?auto_145273 ?auto_145275 ) ) ( not ( = ?auto_145274 ?auto_145275 ) ) ( ON ?auto_145275 ?auto_145276 ) ( not ( = ?auto_145272 ?auto_145276 ) ) ( not ( = ?auto_145273 ?auto_145276 ) ) ( not ( = ?auto_145274 ?auto_145276 ) ) ( not ( = ?auto_145275 ?auto_145276 ) ) ( CLEAR ?auto_145273 ) ( ON ?auto_145274 ?auto_145275 ) ( CLEAR ?auto_145274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145279 ) ( ON ?auto_145277 ?auto_145279 ) ( ON ?auto_145278 ?auto_145277 ) ( ON ?auto_145276 ?auto_145278 ) ( not ( = ?auto_145279 ?auto_145277 ) ) ( not ( = ?auto_145279 ?auto_145278 ) ) ( not ( = ?auto_145279 ?auto_145276 ) ) ( not ( = ?auto_145279 ?auto_145275 ) ) ( not ( = ?auto_145279 ?auto_145274 ) ) ( not ( = ?auto_145277 ?auto_145278 ) ) ( not ( = ?auto_145277 ?auto_145276 ) ) ( not ( = ?auto_145277 ?auto_145275 ) ) ( not ( = ?auto_145277 ?auto_145274 ) ) ( not ( = ?auto_145278 ?auto_145276 ) ) ( not ( = ?auto_145278 ?auto_145275 ) ) ( not ( = ?auto_145278 ?auto_145274 ) ) ( not ( = ?auto_145272 ?auto_145279 ) ) ( not ( = ?auto_145272 ?auto_145277 ) ) ( not ( = ?auto_145272 ?auto_145278 ) ) ( not ( = ?auto_145273 ?auto_145279 ) ) ( not ( = ?auto_145273 ?auto_145277 ) ) ( not ( = ?auto_145273 ?auto_145278 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145279 ?auto_145277 ?auto_145278 ?auto_145276 ?auto_145275 )
      ( MAKE-4PILE ?auto_145272 ?auto_145273 ?auto_145274 ?auto_145275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145280 - BLOCK
      ?auto_145281 - BLOCK
      ?auto_145282 - BLOCK
      ?auto_145283 - BLOCK
    )
    :vars
    (
      ?auto_145284 - BLOCK
      ?auto_145285 - BLOCK
      ?auto_145286 - BLOCK
      ?auto_145287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145280 ) ( not ( = ?auto_145280 ?auto_145281 ) ) ( not ( = ?auto_145280 ?auto_145282 ) ) ( not ( = ?auto_145280 ?auto_145283 ) ) ( not ( = ?auto_145281 ?auto_145282 ) ) ( not ( = ?auto_145281 ?auto_145283 ) ) ( not ( = ?auto_145282 ?auto_145283 ) ) ( ON ?auto_145283 ?auto_145284 ) ( not ( = ?auto_145280 ?auto_145284 ) ) ( not ( = ?auto_145281 ?auto_145284 ) ) ( not ( = ?auto_145282 ?auto_145284 ) ) ( not ( = ?auto_145283 ?auto_145284 ) ) ( ON ?auto_145282 ?auto_145283 ) ( CLEAR ?auto_145282 ) ( ON-TABLE ?auto_145285 ) ( ON ?auto_145286 ?auto_145285 ) ( ON ?auto_145287 ?auto_145286 ) ( ON ?auto_145284 ?auto_145287 ) ( not ( = ?auto_145285 ?auto_145286 ) ) ( not ( = ?auto_145285 ?auto_145287 ) ) ( not ( = ?auto_145285 ?auto_145284 ) ) ( not ( = ?auto_145285 ?auto_145283 ) ) ( not ( = ?auto_145285 ?auto_145282 ) ) ( not ( = ?auto_145286 ?auto_145287 ) ) ( not ( = ?auto_145286 ?auto_145284 ) ) ( not ( = ?auto_145286 ?auto_145283 ) ) ( not ( = ?auto_145286 ?auto_145282 ) ) ( not ( = ?auto_145287 ?auto_145284 ) ) ( not ( = ?auto_145287 ?auto_145283 ) ) ( not ( = ?auto_145287 ?auto_145282 ) ) ( not ( = ?auto_145280 ?auto_145285 ) ) ( not ( = ?auto_145280 ?auto_145286 ) ) ( not ( = ?auto_145280 ?auto_145287 ) ) ( not ( = ?auto_145281 ?auto_145285 ) ) ( not ( = ?auto_145281 ?auto_145286 ) ) ( not ( = ?auto_145281 ?auto_145287 ) ) ( HOLDING ?auto_145281 ) ( CLEAR ?auto_145280 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145280 ?auto_145281 )
      ( MAKE-4PILE ?auto_145280 ?auto_145281 ?auto_145282 ?auto_145283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145288 - BLOCK
      ?auto_145289 - BLOCK
      ?auto_145290 - BLOCK
      ?auto_145291 - BLOCK
    )
    :vars
    (
      ?auto_145293 - BLOCK
      ?auto_145295 - BLOCK
      ?auto_145294 - BLOCK
      ?auto_145292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145288 ) ( not ( = ?auto_145288 ?auto_145289 ) ) ( not ( = ?auto_145288 ?auto_145290 ) ) ( not ( = ?auto_145288 ?auto_145291 ) ) ( not ( = ?auto_145289 ?auto_145290 ) ) ( not ( = ?auto_145289 ?auto_145291 ) ) ( not ( = ?auto_145290 ?auto_145291 ) ) ( ON ?auto_145291 ?auto_145293 ) ( not ( = ?auto_145288 ?auto_145293 ) ) ( not ( = ?auto_145289 ?auto_145293 ) ) ( not ( = ?auto_145290 ?auto_145293 ) ) ( not ( = ?auto_145291 ?auto_145293 ) ) ( ON ?auto_145290 ?auto_145291 ) ( ON-TABLE ?auto_145295 ) ( ON ?auto_145294 ?auto_145295 ) ( ON ?auto_145292 ?auto_145294 ) ( ON ?auto_145293 ?auto_145292 ) ( not ( = ?auto_145295 ?auto_145294 ) ) ( not ( = ?auto_145295 ?auto_145292 ) ) ( not ( = ?auto_145295 ?auto_145293 ) ) ( not ( = ?auto_145295 ?auto_145291 ) ) ( not ( = ?auto_145295 ?auto_145290 ) ) ( not ( = ?auto_145294 ?auto_145292 ) ) ( not ( = ?auto_145294 ?auto_145293 ) ) ( not ( = ?auto_145294 ?auto_145291 ) ) ( not ( = ?auto_145294 ?auto_145290 ) ) ( not ( = ?auto_145292 ?auto_145293 ) ) ( not ( = ?auto_145292 ?auto_145291 ) ) ( not ( = ?auto_145292 ?auto_145290 ) ) ( not ( = ?auto_145288 ?auto_145295 ) ) ( not ( = ?auto_145288 ?auto_145294 ) ) ( not ( = ?auto_145288 ?auto_145292 ) ) ( not ( = ?auto_145289 ?auto_145295 ) ) ( not ( = ?auto_145289 ?auto_145294 ) ) ( not ( = ?auto_145289 ?auto_145292 ) ) ( CLEAR ?auto_145288 ) ( ON ?auto_145289 ?auto_145290 ) ( CLEAR ?auto_145289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145295 ?auto_145294 ?auto_145292 ?auto_145293 ?auto_145291 ?auto_145290 )
      ( MAKE-4PILE ?auto_145288 ?auto_145289 ?auto_145290 ?auto_145291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145296 - BLOCK
      ?auto_145297 - BLOCK
      ?auto_145298 - BLOCK
      ?auto_145299 - BLOCK
    )
    :vars
    (
      ?auto_145302 - BLOCK
      ?auto_145300 - BLOCK
      ?auto_145303 - BLOCK
      ?auto_145301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145296 ?auto_145297 ) ) ( not ( = ?auto_145296 ?auto_145298 ) ) ( not ( = ?auto_145296 ?auto_145299 ) ) ( not ( = ?auto_145297 ?auto_145298 ) ) ( not ( = ?auto_145297 ?auto_145299 ) ) ( not ( = ?auto_145298 ?auto_145299 ) ) ( ON ?auto_145299 ?auto_145302 ) ( not ( = ?auto_145296 ?auto_145302 ) ) ( not ( = ?auto_145297 ?auto_145302 ) ) ( not ( = ?auto_145298 ?auto_145302 ) ) ( not ( = ?auto_145299 ?auto_145302 ) ) ( ON ?auto_145298 ?auto_145299 ) ( ON-TABLE ?auto_145300 ) ( ON ?auto_145303 ?auto_145300 ) ( ON ?auto_145301 ?auto_145303 ) ( ON ?auto_145302 ?auto_145301 ) ( not ( = ?auto_145300 ?auto_145303 ) ) ( not ( = ?auto_145300 ?auto_145301 ) ) ( not ( = ?auto_145300 ?auto_145302 ) ) ( not ( = ?auto_145300 ?auto_145299 ) ) ( not ( = ?auto_145300 ?auto_145298 ) ) ( not ( = ?auto_145303 ?auto_145301 ) ) ( not ( = ?auto_145303 ?auto_145302 ) ) ( not ( = ?auto_145303 ?auto_145299 ) ) ( not ( = ?auto_145303 ?auto_145298 ) ) ( not ( = ?auto_145301 ?auto_145302 ) ) ( not ( = ?auto_145301 ?auto_145299 ) ) ( not ( = ?auto_145301 ?auto_145298 ) ) ( not ( = ?auto_145296 ?auto_145300 ) ) ( not ( = ?auto_145296 ?auto_145303 ) ) ( not ( = ?auto_145296 ?auto_145301 ) ) ( not ( = ?auto_145297 ?auto_145300 ) ) ( not ( = ?auto_145297 ?auto_145303 ) ) ( not ( = ?auto_145297 ?auto_145301 ) ) ( ON ?auto_145297 ?auto_145298 ) ( CLEAR ?auto_145297 ) ( HOLDING ?auto_145296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145296 )
      ( MAKE-4PILE ?auto_145296 ?auto_145297 ?auto_145298 ?auto_145299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145304 - BLOCK
      ?auto_145305 - BLOCK
      ?auto_145306 - BLOCK
      ?auto_145307 - BLOCK
    )
    :vars
    (
      ?auto_145311 - BLOCK
      ?auto_145308 - BLOCK
      ?auto_145310 - BLOCK
      ?auto_145309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145304 ?auto_145305 ) ) ( not ( = ?auto_145304 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145307 ) ) ( not ( = ?auto_145305 ?auto_145306 ) ) ( not ( = ?auto_145305 ?auto_145307 ) ) ( not ( = ?auto_145306 ?auto_145307 ) ) ( ON ?auto_145307 ?auto_145311 ) ( not ( = ?auto_145304 ?auto_145311 ) ) ( not ( = ?auto_145305 ?auto_145311 ) ) ( not ( = ?auto_145306 ?auto_145311 ) ) ( not ( = ?auto_145307 ?auto_145311 ) ) ( ON ?auto_145306 ?auto_145307 ) ( ON-TABLE ?auto_145308 ) ( ON ?auto_145310 ?auto_145308 ) ( ON ?auto_145309 ?auto_145310 ) ( ON ?auto_145311 ?auto_145309 ) ( not ( = ?auto_145308 ?auto_145310 ) ) ( not ( = ?auto_145308 ?auto_145309 ) ) ( not ( = ?auto_145308 ?auto_145311 ) ) ( not ( = ?auto_145308 ?auto_145307 ) ) ( not ( = ?auto_145308 ?auto_145306 ) ) ( not ( = ?auto_145310 ?auto_145309 ) ) ( not ( = ?auto_145310 ?auto_145311 ) ) ( not ( = ?auto_145310 ?auto_145307 ) ) ( not ( = ?auto_145310 ?auto_145306 ) ) ( not ( = ?auto_145309 ?auto_145311 ) ) ( not ( = ?auto_145309 ?auto_145307 ) ) ( not ( = ?auto_145309 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145308 ) ) ( not ( = ?auto_145304 ?auto_145310 ) ) ( not ( = ?auto_145304 ?auto_145309 ) ) ( not ( = ?auto_145305 ?auto_145308 ) ) ( not ( = ?auto_145305 ?auto_145310 ) ) ( not ( = ?auto_145305 ?auto_145309 ) ) ( ON ?auto_145305 ?auto_145306 ) ( ON ?auto_145304 ?auto_145305 ) ( CLEAR ?auto_145304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145308 ?auto_145310 ?auto_145309 ?auto_145311 ?auto_145307 ?auto_145306 ?auto_145305 )
      ( MAKE-4PILE ?auto_145304 ?auto_145305 ?auto_145306 ?auto_145307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145316 - BLOCK
      ?auto_145317 - BLOCK
      ?auto_145318 - BLOCK
      ?auto_145319 - BLOCK
    )
    :vars
    (
      ?auto_145322 - BLOCK
      ?auto_145320 - BLOCK
      ?auto_145323 - BLOCK
      ?auto_145321 - BLOCK
      ?auto_145324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145316 ?auto_145317 ) ) ( not ( = ?auto_145316 ?auto_145318 ) ) ( not ( = ?auto_145316 ?auto_145319 ) ) ( not ( = ?auto_145317 ?auto_145318 ) ) ( not ( = ?auto_145317 ?auto_145319 ) ) ( not ( = ?auto_145318 ?auto_145319 ) ) ( ON ?auto_145319 ?auto_145322 ) ( not ( = ?auto_145316 ?auto_145322 ) ) ( not ( = ?auto_145317 ?auto_145322 ) ) ( not ( = ?auto_145318 ?auto_145322 ) ) ( not ( = ?auto_145319 ?auto_145322 ) ) ( ON ?auto_145318 ?auto_145319 ) ( ON-TABLE ?auto_145320 ) ( ON ?auto_145323 ?auto_145320 ) ( ON ?auto_145321 ?auto_145323 ) ( ON ?auto_145322 ?auto_145321 ) ( not ( = ?auto_145320 ?auto_145323 ) ) ( not ( = ?auto_145320 ?auto_145321 ) ) ( not ( = ?auto_145320 ?auto_145322 ) ) ( not ( = ?auto_145320 ?auto_145319 ) ) ( not ( = ?auto_145320 ?auto_145318 ) ) ( not ( = ?auto_145323 ?auto_145321 ) ) ( not ( = ?auto_145323 ?auto_145322 ) ) ( not ( = ?auto_145323 ?auto_145319 ) ) ( not ( = ?auto_145323 ?auto_145318 ) ) ( not ( = ?auto_145321 ?auto_145322 ) ) ( not ( = ?auto_145321 ?auto_145319 ) ) ( not ( = ?auto_145321 ?auto_145318 ) ) ( not ( = ?auto_145316 ?auto_145320 ) ) ( not ( = ?auto_145316 ?auto_145323 ) ) ( not ( = ?auto_145316 ?auto_145321 ) ) ( not ( = ?auto_145317 ?auto_145320 ) ) ( not ( = ?auto_145317 ?auto_145323 ) ) ( not ( = ?auto_145317 ?auto_145321 ) ) ( ON ?auto_145317 ?auto_145318 ) ( CLEAR ?auto_145317 ) ( ON ?auto_145316 ?auto_145324 ) ( CLEAR ?auto_145316 ) ( HAND-EMPTY ) ( not ( = ?auto_145316 ?auto_145324 ) ) ( not ( = ?auto_145317 ?auto_145324 ) ) ( not ( = ?auto_145318 ?auto_145324 ) ) ( not ( = ?auto_145319 ?auto_145324 ) ) ( not ( = ?auto_145322 ?auto_145324 ) ) ( not ( = ?auto_145320 ?auto_145324 ) ) ( not ( = ?auto_145323 ?auto_145324 ) ) ( not ( = ?auto_145321 ?auto_145324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145316 ?auto_145324 )
      ( MAKE-4PILE ?auto_145316 ?auto_145317 ?auto_145318 ?auto_145319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145325 - BLOCK
      ?auto_145326 - BLOCK
      ?auto_145327 - BLOCK
      ?auto_145328 - BLOCK
    )
    :vars
    (
      ?auto_145330 - BLOCK
      ?auto_145329 - BLOCK
      ?auto_145331 - BLOCK
      ?auto_145332 - BLOCK
      ?auto_145333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145325 ?auto_145326 ) ) ( not ( = ?auto_145325 ?auto_145327 ) ) ( not ( = ?auto_145325 ?auto_145328 ) ) ( not ( = ?auto_145326 ?auto_145327 ) ) ( not ( = ?auto_145326 ?auto_145328 ) ) ( not ( = ?auto_145327 ?auto_145328 ) ) ( ON ?auto_145328 ?auto_145330 ) ( not ( = ?auto_145325 ?auto_145330 ) ) ( not ( = ?auto_145326 ?auto_145330 ) ) ( not ( = ?auto_145327 ?auto_145330 ) ) ( not ( = ?auto_145328 ?auto_145330 ) ) ( ON ?auto_145327 ?auto_145328 ) ( ON-TABLE ?auto_145329 ) ( ON ?auto_145331 ?auto_145329 ) ( ON ?auto_145332 ?auto_145331 ) ( ON ?auto_145330 ?auto_145332 ) ( not ( = ?auto_145329 ?auto_145331 ) ) ( not ( = ?auto_145329 ?auto_145332 ) ) ( not ( = ?auto_145329 ?auto_145330 ) ) ( not ( = ?auto_145329 ?auto_145328 ) ) ( not ( = ?auto_145329 ?auto_145327 ) ) ( not ( = ?auto_145331 ?auto_145332 ) ) ( not ( = ?auto_145331 ?auto_145330 ) ) ( not ( = ?auto_145331 ?auto_145328 ) ) ( not ( = ?auto_145331 ?auto_145327 ) ) ( not ( = ?auto_145332 ?auto_145330 ) ) ( not ( = ?auto_145332 ?auto_145328 ) ) ( not ( = ?auto_145332 ?auto_145327 ) ) ( not ( = ?auto_145325 ?auto_145329 ) ) ( not ( = ?auto_145325 ?auto_145331 ) ) ( not ( = ?auto_145325 ?auto_145332 ) ) ( not ( = ?auto_145326 ?auto_145329 ) ) ( not ( = ?auto_145326 ?auto_145331 ) ) ( not ( = ?auto_145326 ?auto_145332 ) ) ( ON ?auto_145325 ?auto_145333 ) ( CLEAR ?auto_145325 ) ( not ( = ?auto_145325 ?auto_145333 ) ) ( not ( = ?auto_145326 ?auto_145333 ) ) ( not ( = ?auto_145327 ?auto_145333 ) ) ( not ( = ?auto_145328 ?auto_145333 ) ) ( not ( = ?auto_145330 ?auto_145333 ) ) ( not ( = ?auto_145329 ?auto_145333 ) ) ( not ( = ?auto_145331 ?auto_145333 ) ) ( not ( = ?auto_145332 ?auto_145333 ) ) ( HOLDING ?auto_145326 ) ( CLEAR ?auto_145327 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145329 ?auto_145331 ?auto_145332 ?auto_145330 ?auto_145328 ?auto_145327 ?auto_145326 )
      ( MAKE-4PILE ?auto_145325 ?auto_145326 ?auto_145327 ?auto_145328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145334 - BLOCK
      ?auto_145335 - BLOCK
      ?auto_145336 - BLOCK
      ?auto_145337 - BLOCK
    )
    :vars
    (
      ?auto_145339 - BLOCK
      ?auto_145340 - BLOCK
      ?auto_145341 - BLOCK
      ?auto_145342 - BLOCK
      ?auto_145338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145334 ?auto_145335 ) ) ( not ( = ?auto_145334 ?auto_145336 ) ) ( not ( = ?auto_145334 ?auto_145337 ) ) ( not ( = ?auto_145335 ?auto_145336 ) ) ( not ( = ?auto_145335 ?auto_145337 ) ) ( not ( = ?auto_145336 ?auto_145337 ) ) ( ON ?auto_145337 ?auto_145339 ) ( not ( = ?auto_145334 ?auto_145339 ) ) ( not ( = ?auto_145335 ?auto_145339 ) ) ( not ( = ?auto_145336 ?auto_145339 ) ) ( not ( = ?auto_145337 ?auto_145339 ) ) ( ON ?auto_145336 ?auto_145337 ) ( ON-TABLE ?auto_145340 ) ( ON ?auto_145341 ?auto_145340 ) ( ON ?auto_145342 ?auto_145341 ) ( ON ?auto_145339 ?auto_145342 ) ( not ( = ?auto_145340 ?auto_145341 ) ) ( not ( = ?auto_145340 ?auto_145342 ) ) ( not ( = ?auto_145340 ?auto_145339 ) ) ( not ( = ?auto_145340 ?auto_145337 ) ) ( not ( = ?auto_145340 ?auto_145336 ) ) ( not ( = ?auto_145341 ?auto_145342 ) ) ( not ( = ?auto_145341 ?auto_145339 ) ) ( not ( = ?auto_145341 ?auto_145337 ) ) ( not ( = ?auto_145341 ?auto_145336 ) ) ( not ( = ?auto_145342 ?auto_145339 ) ) ( not ( = ?auto_145342 ?auto_145337 ) ) ( not ( = ?auto_145342 ?auto_145336 ) ) ( not ( = ?auto_145334 ?auto_145340 ) ) ( not ( = ?auto_145334 ?auto_145341 ) ) ( not ( = ?auto_145334 ?auto_145342 ) ) ( not ( = ?auto_145335 ?auto_145340 ) ) ( not ( = ?auto_145335 ?auto_145341 ) ) ( not ( = ?auto_145335 ?auto_145342 ) ) ( ON ?auto_145334 ?auto_145338 ) ( not ( = ?auto_145334 ?auto_145338 ) ) ( not ( = ?auto_145335 ?auto_145338 ) ) ( not ( = ?auto_145336 ?auto_145338 ) ) ( not ( = ?auto_145337 ?auto_145338 ) ) ( not ( = ?auto_145339 ?auto_145338 ) ) ( not ( = ?auto_145340 ?auto_145338 ) ) ( not ( = ?auto_145341 ?auto_145338 ) ) ( not ( = ?auto_145342 ?auto_145338 ) ) ( CLEAR ?auto_145336 ) ( ON ?auto_145335 ?auto_145334 ) ( CLEAR ?auto_145335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145338 ?auto_145334 )
      ( MAKE-4PILE ?auto_145334 ?auto_145335 ?auto_145336 ?auto_145337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145343 - BLOCK
      ?auto_145344 - BLOCK
      ?auto_145345 - BLOCK
      ?auto_145346 - BLOCK
    )
    :vars
    (
      ?auto_145349 - BLOCK
      ?auto_145347 - BLOCK
      ?auto_145348 - BLOCK
      ?auto_145351 - BLOCK
      ?auto_145350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145343 ?auto_145344 ) ) ( not ( = ?auto_145343 ?auto_145345 ) ) ( not ( = ?auto_145343 ?auto_145346 ) ) ( not ( = ?auto_145344 ?auto_145345 ) ) ( not ( = ?auto_145344 ?auto_145346 ) ) ( not ( = ?auto_145345 ?auto_145346 ) ) ( ON ?auto_145346 ?auto_145349 ) ( not ( = ?auto_145343 ?auto_145349 ) ) ( not ( = ?auto_145344 ?auto_145349 ) ) ( not ( = ?auto_145345 ?auto_145349 ) ) ( not ( = ?auto_145346 ?auto_145349 ) ) ( ON-TABLE ?auto_145347 ) ( ON ?auto_145348 ?auto_145347 ) ( ON ?auto_145351 ?auto_145348 ) ( ON ?auto_145349 ?auto_145351 ) ( not ( = ?auto_145347 ?auto_145348 ) ) ( not ( = ?auto_145347 ?auto_145351 ) ) ( not ( = ?auto_145347 ?auto_145349 ) ) ( not ( = ?auto_145347 ?auto_145346 ) ) ( not ( = ?auto_145347 ?auto_145345 ) ) ( not ( = ?auto_145348 ?auto_145351 ) ) ( not ( = ?auto_145348 ?auto_145349 ) ) ( not ( = ?auto_145348 ?auto_145346 ) ) ( not ( = ?auto_145348 ?auto_145345 ) ) ( not ( = ?auto_145351 ?auto_145349 ) ) ( not ( = ?auto_145351 ?auto_145346 ) ) ( not ( = ?auto_145351 ?auto_145345 ) ) ( not ( = ?auto_145343 ?auto_145347 ) ) ( not ( = ?auto_145343 ?auto_145348 ) ) ( not ( = ?auto_145343 ?auto_145351 ) ) ( not ( = ?auto_145344 ?auto_145347 ) ) ( not ( = ?auto_145344 ?auto_145348 ) ) ( not ( = ?auto_145344 ?auto_145351 ) ) ( ON ?auto_145343 ?auto_145350 ) ( not ( = ?auto_145343 ?auto_145350 ) ) ( not ( = ?auto_145344 ?auto_145350 ) ) ( not ( = ?auto_145345 ?auto_145350 ) ) ( not ( = ?auto_145346 ?auto_145350 ) ) ( not ( = ?auto_145349 ?auto_145350 ) ) ( not ( = ?auto_145347 ?auto_145350 ) ) ( not ( = ?auto_145348 ?auto_145350 ) ) ( not ( = ?auto_145351 ?auto_145350 ) ) ( ON ?auto_145344 ?auto_145343 ) ( CLEAR ?auto_145344 ) ( ON-TABLE ?auto_145350 ) ( HOLDING ?auto_145345 ) ( CLEAR ?auto_145346 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145347 ?auto_145348 ?auto_145351 ?auto_145349 ?auto_145346 ?auto_145345 )
      ( MAKE-4PILE ?auto_145343 ?auto_145344 ?auto_145345 ?auto_145346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145352 - BLOCK
      ?auto_145353 - BLOCK
      ?auto_145354 - BLOCK
      ?auto_145355 - BLOCK
    )
    :vars
    (
      ?auto_145358 - BLOCK
      ?auto_145357 - BLOCK
      ?auto_145360 - BLOCK
      ?auto_145359 - BLOCK
      ?auto_145356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145352 ?auto_145353 ) ) ( not ( = ?auto_145352 ?auto_145354 ) ) ( not ( = ?auto_145352 ?auto_145355 ) ) ( not ( = ?auto_145353 ?auto_145354 ) ) ( not ( = ?auto_145353 ?auto_145355 ) ) ( not ( = ?auto_145354 ?auto_145355 ) ) ( ON ?auto_145355 ?auto_145358 ) ( not ( = ?auto_145352 ?auto_145358 ) ) ( not ( = ?auto_145353 ?auto_145358 ) ) ( not ( = ?auto_145354 ?auto_145358 ) ) ( not ( = ?auto_145355 ?auto_145358 ) ) ( ON-TABLE ?auto_145357 ) ( ON ?auto_145360 ?auto_145357 ) ( ON ?auto_145359 ?auto_145360 ) ( ON ?auto_145358 ?auto_145359 ) ( not ( = ?auto_145357 ?auto_145360 ) ) ( not ( = ?auto_145357 ?auto_145359 ) ) ( not ( = ?auto_145357 ?auto_145358 ) ) ( not ( = ?auto_145357 ?auto_145355 ) ) ( not ( = ?auto_145357 ?auto_145354 ) ) ( not ( = ?auto_145360 ?auto_145359 ) ) ( not ( = ?auto_145360 ?auto_145358 ) ) ( not ( = ?auto_145360 ?auto_145355 ) ) ( not ( = ?auto_145360 ?auto_145354 ) ) ( not ( = ?auto_145359 ?auto_145358 ) ) ( not ( = ?auto_145359 ?auto_145355 ) ) ( not ( = ?auto_145359 ?auto_145354 ) ) ( not ( = ?auto_145352 ?auto_145357 ) ) ( not ( = ?auto_145352 ?auto_145360 ) ) ( not ( = ?auto_145352 ?auto_145359 ) ) ( not ( = ?auto_145353 ?auto_145357 ) ) ( not ( = ?auto_145353 ?auto_145360 ) ) ( not ( = ?auto_145353 ?auto_145359 ) ) ( ON ?auto_145352 ?auto_145356 ) ( not ( = ?auto_145352 ?auto_145356 ) ) ( not ( = ?auto_145353 ?auto_145356 ) ) ( not ( = ?auto_145354 ?auto_145356 ) ) ( not ( = ?auto_145355 ?auto_145356 ) ) ( not ( = ?auto_145358 ?auto_145356 ) ) ( not ( = ?auto_145357 ?auto_145356 ) ) ( not ( = ?auto_145360 ?auto_145356 ) ) ( not ( = ?auto_145359 ?auto_145356 ) ) ( ON ?auto_145353 ?auto_145352 ) ( ON-TABLE ?auto_145356 ) ( CLEAR ?auto_145355 ) ( ON ?auto_145354 ?auto_145353 ) ( CLEAR ?auto_145354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145356 ?auto_145352 ?auto_145353 )
      ( MAKE-4PILE ?auto_145352 ?auto_145353 ?auto_145354 ?auto_145355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145361 - BLOCK
      ?auto_145362 - BLOCK
      ?auto_145363 - BLOCK
      ?auto_145364 - BLOCK
    )
    :vars
    (
      ?auto_145368 - BLOCK
      ?auto_145366 - BLOCK
      ?auto_145369 - BLOCK
      ?auto_145365 - BLOCK
      ?auto_145367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145361 ?auto_145362 ) ) ( not ( = ?auto_145361 ?auto_145363 ) ) ( not ( = ?auto_145361 ?auto_145364 ) ) ( not ( = ?auto_145362 ?auto_145363 ) ) ( not ( = ?auto_145362 ?auto_145364 ) ) ( not ( = ?auto_145363 ?auto_145364 ) ) ( not ( = ?auto_145361 ?auto_145368 ) ) ( not ( = ?auto_145362 ?auto_145368 ) ) ( not ( = ?auto_145363 ?auto_145368 ) ) ( not ( = ?auto_145364 ?auto_145368 ) ) ( ON-TABLE ?auto_145366 ) ( ON ?auto_145369 ?auto_145366 ) ( ON ?auto_145365 ?auto_145369 ) ( ON ?auto_145368 ?auto_145365 ) ( not ( = ?auto_145366 ?auto_145369 ) ) ( not ( = ?auto_145366 ?auto_145365 ) ) ( not ( = ?auto_145366 ?auto_145368 ) ) ( not ( = ?auto_145366 ?auto_145364 ) ) ( not ( = ?auto_145366 ?auto_145363 ) ) ( not ( = ?auto_145369 ?auto_145365 ) ) ( not ( = ?auto_145369 ?auto_145368 ) ) ( not ( = ?auto_145369 ?auto_145364 ) ) ( not ( = ?auto_145369 ?auto_145363 ) ) ( not ( = ?auto_145365 ?auto_145368 ) ) ( not ( = ?auto_145365 ?auto_145364 ) ) ( not ( = ?auto_145365 ?auto_145363 ) ) ( not ( = ?auto_145361 ?auto_145366 ) ) ( not ( = ?auto_145361 ?auto_145369 ) ) ( not ( = ?auto_145361 ?auto_145365 ) ) ( not ( = ?auto_145362 ?auto_145366 ) ) ( not ( = ?auto_145362 ?auto_145369 ) ) ( not ( = ?auto_145362 ?auto_145365 ) ) ( ON ?auto_145361 ?auto_145367 ) ( not ( = ?auto_145361 ?auto_145367 ) ) ( not ( = ?auto_145362 ?auto_145367 ) ) ( not ( = ?auto_145363 ?auto_145367 ) ) ( not ( = ?auto_145364 ?auto_145367 ) ) ( not ( = ?auto_145368 ?auto_145367 ) ) ( not ( = ?auto_145366 ?auto_145367 ) ) ( not ( = ?auto_145369 ?auto_145367 ) ) ( not ( = ?auto_145365 ?auto_145367 ) ) ( ON ?auto_145362 ?auto_145361 ) ( ON-TABLE ?auto_145367 ) ( ON ?auto_145363 ?auto_145362 ) ( CLEAR ?auto_145363 ) ( HOLDING ?auto_145364 ) ( CLEAR ?auto_145368 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145366 ?auto_145369 ?auto_145365 ?auto_145368 ?auto_145364 )
      ( MAKE-4PILE ?auto_145361 ?auto_145362 ?auto_145363 ?auto_145364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145370 - BLOCK
      ?auto_145371 - BLOCK
      ?auto_145372 - BLOCK
      ?auto_145373 - BLOCK
    )
    :vars
    (
      ?auto_145374 - BLOCK
      ?auto_145378 - BLOCK
      ?auto_145377 - BLOCK
      ?auto_145376 - BLOCK
      ?auto_145375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145370 ?auto_145371 ) ) ( not ( = ?auto_145370 ?auto_145372 ) ) ( not ( = ?auto_145370 ?auto_145373 ) ) ( not ( = ?auto_145371 ?auto_145372 ) ) ( not ( = ?auto_145371 ?auto_145373 ) ) ( not ( = ?auto_145372 ?auto_145373 ) ) ( not ( = ?auto_145370 ?auto_145374 ) ) ( not ( = ?auto_145371 ?auto_145374 ) ) ( not ( = ?auto_145372 ?auto_145374 ) ) ( not ( = ?auto_145373 ?auto_145374 ) ) ( ON-TABLE ?auto_145378 ) ( ON ?auto_145377 ?auto_145378 ) ( ON ?auto_145376 ?auto_145377 ) ( ON ?auto_145374 ?auto_145376 ) ( not ( = ?auto_145378 ?auto_145377 ) ) ( not ( = ?auto_145378 ?auto_145376 ) ) ( not ( = ?auto_145378 ?auto_145374 ) ) ( not ( = ?auto_145378 ?auto_145373 ) ) ( not ( = ?auto_145378 ?auto_145372 ) ) ( not ( = ?auto_145377 ?auto_145376 ) ) ( not ( = ?auto_145377 ?auto_145374 ) ) ( not ( = ?auto_145377 ?auto_145373 ) ) ( not ( = ?auto_145377 ?auto_145372 ) ) ( not ( = ?auto_145376 ?auto_145374 ) ) ( not ( = ?auto_145376 ?auto_145373 ) ) ( not ( = ?auto_145376 ?auto_145372 ) ) ( not ( = ?auto_145370 ?auto_145378 ) ) ( not ( = ?auto_145370 ?auto_145377 ) ) ( not ( = ?auto_145370 ?auto_145376 ) ) ( not ( = ?auto_145371 ?auto_145378 ) ) ( not ( = ?auto_145371 ?auto_145377 ) ) ( not ( = ?auto_145371 ?auto_145376 ) ) ( ON ?auto_145370 ?auto_145375 ) ( not ( = ?auto_145370 ?auto_145375 ) ) ( not ( = ?auto_145371 ?auto_145375 ) ) ( not ( = ?auto_145372 ?auto_145375 ) ) ( not ( = ?auto_145373 ?auto_145375 ) ) ( not ( = ?auto_145374 ?auto_145375 ) ) ( not ( = ?auto_145378 ?auto_145375 ) ) ( not ( = ?auto_145377 ?auto_145375 ) ) ( not ( = ?auto_145376 ?auto_145375 ) ) ( ON ?auto_145371 ?auto_145370 ) ( ON-TABLE ?auto_145375 ) ( ON ?auto_145372 ?auto_145371 ) ( CLEAR ?auto_145374 ) ( ON ?auto_145373 ?auto_145372 ) ( CLEAR ?auto_145373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145375 ?auto_145370 ?auto_145371 ?auto_145372 )
      ( MAKE-4PILE ?auto_145370 ?auto_145371 ?auto_145372 ?auto_145373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145379 - BLOCK
      ?auto_145380 - BLOCK
      ?auto_145381 - BLOCK
      ?auto_145382 - BLOCK
    )
    :vars
    (
      ?auto_145385 - BLOCK
      ?auto_145386 - BLOCK
      ?auto_145383 - BLOCK
      ?auto_145387 - BLOCK
      ?auto_145384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145379 ?auto_145380 ) ) ( not ( = ?auto_145379 ?auto_145381 ) ) ( not ( = ?auto_145379 ?auto_145382 ) ) ( not ( = ?auto_145380 ?auto_145381 ) ) ( not ( = ?auto_145380 ?auto_145382 ) ) ( not ( = ?auto_145381 ?auto_145382 ) ) ( not ( = ?auto_145379 ?auto_145385 ) ) ( not ( = ?auto_145380 ?auto_145385 ) ) ( not ( = ?auto_145381 ?auto_145385 ) ) ( not ( = ?auto_145382 ?auto_145385 ) ) ( ON-TABLE ?auto_145386 ) ( ON ?auto_145383 ?auto_145386 ) ( ON ?auto_145387 ?auto_145383 ) ( not ( = ?auto_145386 ?auto_145383 ) ) ( not ( = ?auto_145386 ?auto_145387 ) ) ( not ( = ?auto_145386 ?auto_145385 ) ) ( not ( = ?auto_145386 ?auto_145382 ) ) ( not ( = ?auto_145386 ?auto_145381 ) ) ( not ( = ?auto_145383 ?auto_145387 ) ) ( not ( = ?auto_145383 ?auto_145385 ) ) ( not ( = ?auto_145383 ?auto_145382 ) ) ( not ( = ?auto_145383 ?auto_145381 ) ) ( not ( = ?auto_145387 ?auto_145385 ) ) ( not ( = ?auto_145387 ?auto_145382 ) ) ( not ( = ?auto_145387 ?auto_145381 ) ) ( not ( = ?auto_145379 ?auto_145386 ) ) ( not ( = ?auto_145379 ?auto_145383 ) ) ( not ( = ?auto_145379 ?auto_145387 ) ) ( not ( = ?auto_145380 ?auto_145386 ) ) ( not ( = ?auto_145380 ?auto_145383 ) ) ( not ( = ?auto_145380 ?auto_145387 ) ) ( ON ?auto_145379 ?auto_145384 ) ( not ( = ?auto_145379 ?auto_145384 ) ) ( not ( = ?auto_145380 ?auto_145384 ) ) ( not ( = ?auto_145381 ?auto_145384 ) ) ( not ( = ?auto_145382 ?auto_145384 ) ) ( not ( = ?auto_145385 ?auto_145384 ) ) ( not ( = ?auto_145386 ?auto_145384 ) ) ( not ( = ?auto_145383 ?auto_145384 ) ) ( not ( = ?auto_145387 ?auto_145384 ) ) ( ON ?auto_145380 ?auto_145379 ) ( ON-TABLE ?auto_145384 ) ( ON ?auto_145381 ?auto_145380 ) ( ON ?auto_145382 ?auto_145381 ) ( CLEAR ?auto_145382 ) ( HOLDING ?auto_145385 ) ( CLEAR ?auto_145387 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145386 ?auto_145383 ?auto_145387 ?auto_145385 )
      ( MAKE-4PILE ?auto_145379 ?auto_145380 ?auto_145381 ?auto_145382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145388 - BLOCK
      ?auto_145389 - BLOCK
      ?auto_145390 - BLOCK
      ?auto_145391 - BLOCK
    )
    :vars
    (
      ?auto_145394 - BLOCK
      ?auto_145396 - BLOCK
      ?auto_145395 - BLOCK
      ?auto_145393 - BLOCK
      ?auto_145392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145388 ?auto_145389 ) ) ( not ( = ?auto_145388 ?auto_145390 ) ) ( not ( = ?auto_145388 ?auto_145391 ) ) ( not ( = ?auto_145389 ?auto_145390 ) ) ( not ( = ?auto_145389 ?auto_145391 ) ) ( not ( = ?auto_145390 ?auto_145391 ) ) ( not ( = ?auto_145388 ?auto_145394 ) ) ( not ( = ?auto_145389 ?auto_145394 ) ) ( not ( = ?auto_145390 ?auto_145394 ) ) ( not ( = ?auto_145391 ?auto_145394 ) ) ( ON-TABLE ?auto_145396 ) ( ON ?auto_145395 ?auto_145396 ) ( ON ?auto_145393 ?auto_145395 ) ( not ( = ?auto_145396 ?auto_145395 ) ) ( not ( = ?auto_145396 ?auto_145393 ) ) ( not ( = ?auto_145396 ?auto_145394 ) ) ( not ( = ?auto_145396 ?auto_145391 ) ) ( not ( = ?auto_145396 ?auto_145390 ) ) ( not ( = ?auto_145395 ?auto_145393 ) ) ( not ( = ?auto_145395 ?auto_145394 ) ) ( not ( = ?auto_145395 ?auto_145391 ) ) ( not ( = ?auto_145395 ?auto_145390 ) ) ( not ( = ?auto_145393 ?auto_145394 ) ) ( not ( = ?auto_145393 ?auto_145391 ) ) ( not ( = ?auto_145393 ?auto_145390 ) ) ( not ( = ?auto_145388 ?auto_145396 ) ) ( not ( = ?auto_145388 ?auto_145395 ) ) ( not ( = ?auto_145388 ?auto_145393 ) ) ( not ( = ?auto_145389 ?auto_145396 ) ) ( not ( = ?auto_145389 ?auto_145395 ) ) ( not ( = ?auto_145389 ?auto_145393 ) ) ( ON ?auto_145388 ?auto_145392 ) ( not ( = ?auto_145388 ?auto_145392 ) ) ( not ( = ?auto_145389 ?auto_145392 ) ) ( not ( = ?auto_145390 ?auto_145392 ) ) ( not ( = ?auto_145391 ?auto_145392 ) ) ( not ( = ?auto_145394 ?auto_145392 ) ) ( not ( = ?auto_145396 ?auto_145392 ) ) ( not ( = ?auto_145395 ?auto_145392 ) ) ( not ( = ?auto_145393 ?auto_145392 ) ) ( ON ?auto_145389 ?auto_145388 ) ( ON-TABLE ?auto_145392 ) ( ON ?auto_145390 ?auto_145389 ) ( ON ?auto_145391 ?auto_145390 ) ( CLEAR ?auto_145393 ) ( ON ?auto_145394 ?auto_145391 ) ( CLEAR ?auto_145394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145392 ?auto_145388 ?auto_145389 ?auto_145390 ?auto_145391 )
      ( MAKE-4PILE ?auto_145388 ?auto_145389 ?auto_145390 ?auto_145391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145397 - BLOCK
      ?auto_145398 - BLOCK
      ?auto_145399 - BLOCK
      ?auto_145400 - BLOCK
    )
    :vars
    (
      ?auto_145401 - BLOCK
      ?auto_145402 - BLOCK
      ?auto_145405 - BLOCK
      ?auto_145403 - BLOCK
      ?auto_145404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145397 ?auto_145398 ) ) ( not ( = ?auto_145397 ?auto_145399 ) ) ( not ( = ?auto_145397 ?auto_145400 ) ) ( not ( = ?auto_145398 ?auto_145399 ) ) ( not ( = ?auto_145398 ?auto_145400 ) ) ( not ( = ?auto_145399 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145401 ) ) ( not ( = ?auto_145398 ?auto_145401 ) ) ( not ( = ?auto_145399 ?auto_145401 ) ) ( not ( = ?auto_145400 ?auto_145401 ) ) ( ON-TABLE ?auto_145402 ) ( ON ?auto_145405 ?auto_145402 ) ( not ( = ?auto_145402 ?auto_145405 ) ) ( not ( = ?auto_145402 ?auto_145403 ) ) ( not ( = ?auto_145402 ?auto_145401 ) ) ( not ( = ?auto_145402 ?auto_145400 ) ) ( not ( = ?auto_145402 ?auto_145399 ) ) ( not ( = ?auto_145405 ?auto_145403 ) ) ( not ( = ?auto_145405 ?auto_145401 ) ) ( not ( = ?auto_145405 ?auto_145400 ) ) ( not ( = ?auto_145405 ?auto_145399 ) ) ( not ( = ?auto_145403 ?auto_145401 ) ) ( not ( = ?auto_145403 ?auto_145400 ) ) ( not ( = ?auto_145403 ?auto_145399 ) ) ( not ( = ?auto_145397 ?auto_145402 ) ) ( not ( = ?auto_145397 ?auto_145405 ) ) ( not ( = ?auto_145397 ?auto_145403 ) ) ( not ( = ?auto_145398 ?auto_145402 ) ) ( not ( = ?auto_145398 ?auto_145405 ) ) ( not ( = ?auto_145398 ?auto_145403 ) ) ( ON ?auto_145397 ?auto_145404 ) ( not ( = ?auto_145397 ?auto_145404 ) ) ( not ( = ?auto_145398 ?auto_145404 ) ) ( not ( = ?auto_145399 ?auto_145404 ) ) ( not ( = ?auto_145400 ?auto_145404 ) ) ( not ( = ?auto_145401 ?auto_145404 ) ) ( not ( = ?auto_145402 ?auto_145404 ) ) ( not ( = ?auto_145405 ?auto_145404 ) ) ( not ( = ?auto_145403 ?auto_145404 ) ) ( ON ?auto_145398 ?auto_145397 ) ( ON-TABLE ?auto_145404 ) ( ON ?auto_145399 ?auto_145398 ) ( ON ?auto_145400 ?auto_145399 ) ( ON ?auto_145401 ?auto_145400 ) ( CLEAR ?auto_145401 ) ( HOLDING ?auto_145403 ) ( CLEAR ?auto_145405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145402 ?auto_145405 ?auto_145403 )
      ( MAKE-4PILE ?auto_145397 ?auto_145398 ?auto_145399 ?auto_145400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145406 - BLOCK
      ?auto_145407 - BLOCK
      ?auto_145408 - BLOCK
      ?auto_145409 - BLOCK
    )
    :vars
    (
      ?auto_145414 - BLOCK
      ?auto_145411 - BLOCK
      ?auto_145410 - BLOCK
      ?auto_145412 - BLOCK
      ?auto_145413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145406 ?auto_145407 ) ) ( not ( = ?auto_145406 ?auto_145408 ) ) ( not ( = ?auto_145406 ?auto_145409 ) ) ( not ( = ?auto_145407 ?auto_145408 ) ) ( not ( = ?auto_145407 ?auto_145409 ) ) ( not ( = ?auto_145408 ?auto_145409 ) ) ( not ( = ?auto_145406 ?auto_145414 ) ) ( not ( = ?auto_145407 ?auto_145414 ) ) ( not ( = ?auto_145408 ?auto_145414 ) ) ( not ( = ?auto_145409 ?auto_145414 ) ) ( ON-TABLE ?auto_145411 ) ( ON ?auto_145410 ?auto_145411 ) ( not ( = ?auto_145411 ?auto_145410 ) ) ( not ( = ?auto_145411 ?auto_145412 ) ) ( not ( = ?auto_145411 ?auto_145414 ) ) ( not ( = ?auto_145411 ?auto_145409 ) ) ( not ( = ?auto_145411 ?auto_145408 ) ) ( not ( = ?auto_145410 ?auto_145412 ) ) ( not ( = ?auto_145410 ?auto_145414 ) ) ( not ( = ?auto_145410 ?auto_145409 ) ) ( not ( = ?auto_145410 ?auto_145408 ) ) ( not ( = ?auto_145412 ?auto_145414 ) ) ( not ( = ?auto_145412 ?auto_145409 ) ) ( not ( = ?auto_145412 ?auto_145408 ) ) ( not ( = ?auto_145406 ?auto_145411 ) ) ( not ( = ?auto_145406 ?auto_145410 ) ) ( not ( = ?auto_145406 ?auto_145412 ) ) ( not ( = ?auto_145407 ?auto_145411 ) ) ( not ( = ?auto_145407 ?auto_145410 ) ) ( not ( = ?auto_145407 ?auto_145412 ) ) ( ON ?auto_145406 ?auto_145413 ) ( not ( = ?auto_145406 ?auto_145413 ) ) ( not ( = ?auto_145407 ?auto_145413 ) ) ( not ( = ?auto_145408 ?auto_145413 ) ) ( not ( = ?auto_145409 ?auto_145413 ) ) ( not ( = ?auto_145414 ?auto_145413 ) ) ( not ( = ?auto_145411 ?auto_145413 ) ) ( not ( = ?auto_145410 ?auto_145413 ) ) ( not ( = ?auto_145412 ?auto_145413 ) ) ( ON ?auto_145407 ?auto_145406 ) ( ON-TABLE ?auto_145413 ) ( ON ?auto_145408 ?auto_145407 ) ( ON ?auto_145409 ?auto_145408 ) ( ON ?auto_145414 ?auto_145409 ) ( CLEAR ?auto_145410 ) ( ON ?auto_145412 ?auto_145414 ) ( CLEAR ?auto_145412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145413 ?auto_145406 ?auto_145407 ?auto_145408 ?auto_145409 ?auto_145414 )
      ( MAKE-4PILE ?auto_145406 ?auto_145407 ?auto_145408 ?auto_145409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145415 - BLOCK
      ?auto_145416 - BLOCK
      ?auto_145417 - BLOCK
      ?auto_145418 - BLOCK
    )
    :vars
    (
      ?auto_145419 - BLOCK
      ?auto_145421 - BLOCK
      ?auto_145420 - BLOCK
      ?auto_145423 - BLOCK
      ?auto_145422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145415 ?auto_145416 ) ) ( not ( = ?auto_145415 ?auto_145417 ) ) ( not ( = ?auto_145415 ?auto_145418 ) ) ( not ( = ?auto_145416 ?auto_145417 ) ) ( not ( = ?auto_145416 ?auto_145418 ) ) ( not ( = ?auto_145417 ?auto_145418 ) ) ( not ( = ?auto_145415 ?auto_145419 ) ) ( not ( = ?auto_145416 ?auto_145419 ) ) ( not ( = ?auto_145417 ?auto_145419 ) ) ( not ( = ?auto_145418 ?auto_145419 ) ) ( ON-TABLE ?auto_145421 ) ( not ( = ?auto_145421 ?auto_145420 ) ) ( not ( = ?auto_145421 ?auto_145423 ) ) ( not ( = ?auto_145421 ?auto_145419 ) ) ( not ( = ?auto_145421 ?auto_145418 ) ) ( not ( = ?auto_145421 ?auto_145417 ) ) ( not ( = ?auto_145420 ?auto_145423 ) ) ( not ( = ?auto_145420 ?auto_145419 ) ) ( not ( = ?auto_145420 ?auto_145418 ) ) ( not ( = ?auto_145420 ?auto_145417 ) ) ( not ( = ?auto_145423 ?auto_145419 ) ) ( not ( = ?auto_145423 ?auto_145418 ) ) ( not ( = ?auto_145423 ?auto_145417 ) ) ( not ( = ?auto_145415 ?auto_145421 ) ) ( not ( = ?auto_145415 ?auto_145420 ) ) ( not ( = ?auto_145415 ?auto_145423 ) ) ( not ( = ?auto_145416 ?auto_145421 ) ) ( not ( = ?auto_145416 ?auto_145420 ) ) ( not ( = ?auto_145416 ?auto_145423 ) ) ( ON ?auto_145415 ?auto_145422 ) ( not ( = ?auto_145415 ?auto_145422 ) ) ( not ( = ?auto_145416 ?auto_145422 ) ) ( not ( = ?auto_145417 ?auto_145422 ) ) ( not ( = ?auto_145418 ?auto_145422 ) ) ( not ( = ?auto_145419 ?auto_145422 ) ) ( not ( = ?auto_145421 ?auto_145422 ) ) ( not ( = ?auto_145420 ?auto_145422 ) ) ( not ( = ?auto_145423 ?auto_145422 ) ) ( ON ?auto_145416 ?auto_145415 ) ( ON-TABLE ?auto_145422 ) ( ON ?auto_145417 ?auto_145416 ) ( ON ?auto_145418 ?auto_145417 ) ( ON ?auto_145419 ?auto_145418 ) ( ON ?auto_145423 ?auto_145419 ) ( CLEAR ?auto_145423 ) ( HOLDING ?auto_145420 ) ( CLEAR ?auto_145421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145421 ?auto_145420 )
      ( MAKE-4PILE ?auto_145415 ?auto_145416 ?auto_145417 ?auto_145418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145424 - BLOCK
      ?auto_145425 - BLOCK
      ?auto_145426 - BLOCK
      ?auto_145427 - BLOCK
    )
    :vars
    (
      ?auto_145430 - BLOCK
      ?auto_145428 - BLOCK
      ?auto_145432 - BLOCK
      ?auto_145429 - BLOCK
      ?auto_145431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145424 ?auto_145425 ) ) ( not ( = ?auto_145424 ?auto_145426 ) ) ( not ( = ?auto_145424 ?auto_145427 ) ) ( not ( = ?auto_145425 ?auto_145426 ) ) ( not ( = ?auto_145425 ?auto_145427 ) ) ( not ( = ?auto_145426 ?auto_145427 ) ) ( not ( = ?auto_145424 ?auto_145430 ) ) ( not ( = ?auto_145425 ?auto_145430 ) ) ( not ( = ?auto_145426 ?auto_145430 ) ) ( not ( = ?auto_145427 ?auto_145430 ) ) ( ON-TABLE ?auto_145428 ) ( not ( = ?auto_145428 ?auto_145432 ) ) ( not ( = ?auto_145428 ?auto_145429 ) ) ( not ( = ?auto_145428 ?auto_145430 ) ) ( not ( = ?auto_145428 ?auto_145427 ) ) ( not ( = ?auto_145428 ?auto_145426 ) ) ( not ( = ?auto_145432 ?auto_145429 ) ) ( not ( = ?auto_145432 ?auto_145430 ) ) ( not ( = ?auto_145432 ?auto_145427 ) ) ( not ( = ?auto_145432 ?auto_145426 ) ) ( not ( = ?auto_145429 ?auto_145430 ) ) ( not ( = ?auto_145429 ?auto_145427 ) ) ( not ( = ?auto_145429 ?auto_145426 ) ) ( not ( = ?auto_145424 ?auto_145428 ) ) ( not ( = ?auto_145424 ?auto_145432 ) ) ( not ( = ?auto_145424 ?auto_145429 ) ) ( not ( = ?auto_145425 ?auto_145428 ) ) ( not ( = ?auto_145425 ?auto_145432 ) ) ( not ( = ?auto_145425 ?auto_145429 ) ) ( ON ?auto_145424 ?auto_145431 ) ( not ( = ?auto_145424 ?auto_145431 ) ) ( not ( = ?auto_145425 ?auto_145431 ) ) ( not ( = ?auto_145426 ?auto_145431 ) ) ( not ( = ?auto_145427 ?auto_145431 ) ) ( not ( = ?auto_145430 ?auto_145431 ) ) ( not ( = ?auto_145428 ?auto_145431 ) ) ( not ( = ?auto_145432 ?auto_145431 ) ) ( not ( = ?auto_145429 ?auto_145431 ) ) ( ON ?auto_145425 ?auto_145424 ) ( ON-TABLE ?auto_145431 ) ( ON ?auto_145426 ?auto_145425 ) ( ON ?auto_145427 ?auto_145426 ) ( ON ?auto_145430 ?auto_145427 ) ( ON ?auto_145429 ?auto_145430 ) ( CLEAR ?auto_145428 ) ( ON ?auto_145432 ?auto_145429 ) ( CLEAR ?auto_145432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145431 ?auto_145424 ?auto_145425 ?auto_145426 ?auto_145427 ?auto_145430 ?auto_145429 )
      ( MAKE-4PILE ?auto_145424 ?auto_145425 ?auto_145426 ?auto_145427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145433 - BLOCK
      ?auto_145434 - BLOCK
      ?auto_145435 - BLOCK
      ?auto_145436 - BLOCK
    )
    :vars
    (
      ?auto_145440 - BLOCK
      ?auto_145441 - BLOCK
      ?auto_145438 - BLOCK
      ?auto_145439 - BLOCK
      ?auto_145437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145433 ?auto_145434 ) ) ( not ( = ?auto_145433 ?auto_145435 ) ) ( not ( = ?auto_145433 ?auto_145436 ) ) ( not ( = ?auto_145434 ?auto_145435 ) ) ( not ( = ?auto_145434 ?auto_145436 ) ) ( not ( = ?auto_145435 ?auto_145436 ) ) ( not ( = ?auto_145433 ?auto_145440 ) ) ( not ( = ?auto_145434 ?auto_145440 ) ) ( not ( = ?auto_145435 ?auto_145440 ) ) ( not ( = ?auto_145436 ?auto_145440 ) ) ( not ( = ?auto_145441 ?auto_145438 ) ) ( not ( = ?auto_145441 ?auto_145439 ) ) ( not ( = ?auto_145441 ?auto_145440 ) ) ( not ( = ?auto_145441 ?auto_145436 ) ) ( not ( = ?auto_145441 ?auto_145435 ) ) ( not ( = ?auto_145438 ?auto_145439 ) ) ( not ( = ?auto_145438 ?auto_145440 ) ) ( not ( = ?auto_145438 ?auto_145436 ) ) ( not ( = ?auto_145438 ?auto_145435 ) ) ( not ( = ?auto_145439 ?auto_145440 ) ) ( not ( = ?auto_145439 ?auto_145436 ) ) ( not ( = ?auto_145439 ?auto_145435 ) ) ( not ( = ?auto_145433 ?auto_145441 ) ) ( not ( = ?auto_145433 ?auto_145438 ) ) ( not ( = ?auto_145433 ?auto_145439 ) ) ( not ( = ?auto_145434 ?auto_145441 ) ) ( not ( = ?auto_145434 ?auto_145438 ) ) ( not ( = ?auto_145434 ?auto_145439 ) ) ( ON ?auto_145433 ?auto_145437 ) ( not ( = ?auto_145433 ?auto_145437 ) ) ( not ( = ?auto_145434 ?auto_145437 ) ) ( not ( = ?auto_145435 ?auto_145437 ) ) ( not ( = ?auto_145436 ?auto_145437 ) ) ( not ( = ?auto_145440 ?auto_145437 ) ) ( not ( = ?auto_145441 ?auto_145437 ) ) ( not ( = ?auto_145438 ?auto_145437 ) ) ( not ( = ?auto_145439 ?auto_145437 ) ) ( ON ?auto_145434 ?auto_145433 ) ( ON-TABLE ?auto_145437 ) ( ON ?auto_145435 ?auto_145434 ) ( ON ?auto_145436 ?auto_145435 ) ( ON ?auto_145440 ?auto_145436 ) ( ON ?auto_145439 ?auto_145440 ) ( ON ?auto_145438 ?auto_145439 ) ( CLEAR ?auto_145438 ) ( HOLDING ?auto_145441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145441 )
      ( MAKE-4PILE ?auto_145433 ?auto_145434 ?auto_145435 ?auto_145436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145442 - BLOCK
      ?auto_145443 - BLOCK
      ?auto_145444 - BLOCK
      ?auto_145445 - BLOCK
    )
    :vars
    (
      ?auto_145449 - BLOCK
      ?auto_145450 - BLOCK
      ?auto_145447 - BLOCK
      ?auto_145448 - BLOCK
      ?auto_145446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145442 ?auto_145443 ) ) ( not ( = ?auto_145442 ?auto_145444 ) ) ( not ( = ?auto_145442 ?auto_145445 ) ) ( not ( = ?auto_145443 ?auto_145444 ) ) ( not ( = ?auto_145443 ?auto_145445 ) ) ( not ( = ?auto_145444 ?auto_145445 ) ) ( not ( = ?auto_145442 ?auto_145449 ) ) ( not ( = ?auto_145443 ?auto_145449 ) ) ( not ( = ?auto_145444 ?auto_145449 ) ) ( not ( = ?auto_145445 ?auto_145449 ) ) ( not ( = ?auto_145450 ?auto_145447 ) ) ( not ( = ?auto_145450 ?auto_145448 ) ) ( not ( = ?auto_145450 ?auto_145449 ) ) ( not ( = ?auto_145450 ?auto_145445 ) ) ( not ( = ?auto_145450 ?auto_145444 ) ) ( not ( = ?auto_145447 ?auto_145448 ) ) ( not ( = ?auto_145447 ?auto_145449 ) ) ( not ( = ?auto_145447 ?auto_145445 ) ) ( not ( = ?auto_145447 ?auto_145444 ) ) ( not ( = ?auto_145448 ?auto_145449 ) ) ( not ( = ?auto_145448 ?auto_145445 ) ) ( not ( = ?auto_145448 ?auto_145444 ) ) ( not ( = ?auto_145442 ?auto_145450 ) ) ( not ( = ?auto_145442 ?auto_145447 ) ) ( not ( = ?auto_145442 ?auto_145448 ) ) ( not ( = ?auto_145443 ?auto_145450 ) ) ( not ( = ?auto_145443 ?auto_145447 ) ) ( not ( = ?auto_145443 ?auto_145448 ) ) ( ON ?auto_145442 ?auto_145446 ) ( not ( = ?auto_145442 ?auto_145446 ) ) ( not ( = ?auto_145443 ?auto_145446 ) ) ( not ( = ?auto_145444 ?auto_145446 ) ) ( not ( = ?auto_145445 ?auto_145446 ) ) ( not ( = ?auto_145449 ?auto_145446 ) ) ( not ( = ?auto_145450 ?auto_145446 ) ) ( not ( = ?auto_145447 ?auto_145446 ) ) ( not ( = ?auto_145448 ?auto_145446 ) ) ( ON ?auto_145443 ?auto_145442 ) ( ON-TABLE ?auto_145446 ) ( ON ?auto_145444 ?auto_145443 ) ( ON ?auto_145445 ?auto_145444 ) ( ON ?auto_145449 ?auto_145445 ) ( ON ?auto_145448 ?auto_145449 ) ( ON ?auto_145447 ?auto_145448 ) ( ON ?auto_145450 ?auto_145447 ) ( CLEAR ?auto_145450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145446 ?auto_145442 ?auto_145443 ?auto_145444 ?auto_145445 ?auto_145449 ?auto_145448 ?auto_145447 )
      ( MAKE-4PILE ?auto_145442 ?auto_145443 ?auto_145444 ?auto_145445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145470 - BLOCK
      ?auto_145471 - BLOCK
      ?auto_145472 - BLOCK
    )
    :vars
    (
      ?auto_145474 - BLOCK
      ?auto_145473 - BLOCK
      ?auto_145475 - BLOCK
      ?auto_145477 - BLOCK
      ?auto_145476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145474 ?auto_145472 ) ( ON-TABLE ?auto_145470 ) ( ON ?auto_145471 ?auto_145470 ) ( ON ?auto_145472 ?auto_145471 ) ( not ( = ?auto_145470 ?auto_145471 ) ) ( not ( = ?auto_145470 ?auto_145472 ) ) ( not ( = ?auto_145470 ?auto_145474 ) ) ( not ( = ?auto_145471 ?auto_145472 ) ) ( not ( = ?auto_145471 ?auto_145474 ) ) ( not ( = ?auto_145472 ?auto_145474 ) ) ( not ( = ?auto_145470 ?auto_145473 ) ) ( not ( = ?auto_145470 ?auto_145475 ) ) ( not ( = ?auto_145471 ?auto_145473 ) ) ( not ( = ?auto_145471 ?auto_145475 ) ) ( not ( = ?auto_145472 ?auto_145473 ) ) ( not ( = ?auto_145472 ?auto_145475 ) ) ( not ( = ?auto_145474 ?auto_145473 ) ) ( not ( = ?auto_145474 ?auto_145475 ) ) ( not ( = ?auto_145473 ?auto_145475 ) ) ( ON ?auto_145473 ?auto_145474 ) ( CLEAR ?auto_145473 ) ( HOLDING ?auto_145475 ) ( CLEAR ?auto_145477 ) ( ON-TABLE ?auto_145476 ) ( ON ?auto_145477 ?auto_145476 ) ( not ( = ?auto_145476 ?auto_145477 ) ) ( not ( = ?auto_145476 ?auto_145475 ) ) ( not ( = ?auto_145477 ?auto_145475 ) ) ( not ( = ?auto_145470 ?auto_145477 ) ) ( not ( = ?auto_145470 ?auto_145476 ) ) ( not ( = ?auto_145471 ?auto_145477 ) ) ( not ( = ?auto_145471 ?auto_145476 ) ) ( not ( = ?auto_145472 ?auto_145477 ) ) ( not ( = ?auto_145472 ?auto_145476 ) ) ( not ( = ?auto_145474 ?auto_145477 ) ) ( not ( = ?auto_145474 ?auto_145476 ) ) ( not ( = ?auto_145473 ?auto_145477 ) ) ( not ( = ?auto_145473 ?auto_145476 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145476 ?auto_145477 ?auto_145475 )
      ( MAKE-3PILE ?auto_145470 ?auto_145471 ?auto_145472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145478 - BLOCK
      ?auto_145479 - BLOCK
      ?auto_145480 - BLOCK
    )
    :vars
    (
      ?auto_145484 - BLOCK
      ?auto_145483 - BLOCK
      ?auto_145481 - BLOCK
      ?auto_145482 - BLOCK
      ?auto_145485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145484 ?auto_145480 ) ( ON-TABLE ?auto_145478 ) ( ON ?auto_145479 ?auto_145478 ) ( ON ?auto_145480 ?auto_145479 ) ( not ( = ?auto_145478 ?auto_145479 ) ) ( not ( = ?auto_145478 ?auto_145480 ) ) ( not ( = ?auto_145478 ?auto_145484 ) ) ( not ( = ?auto_145479 ?auto_145480 ) ) ( not ( = ?auto_145479 ?auto_145484 ) ) ( not ( = ?auto_145480 ?auto_145484 ) ) ( not ( = ?auto_145478 ?auto_145483 ) ) ( not ( = ?auto_145478 ?auto_145481 ) ) ( not ( = ?auto_145479 ?auto_145483 ) ) ( not ( = ?auto_145479 ?auto_145481 ) ) ( not ( = ?auto_145480 ?auto_145483 ) ) ( not ( = ?auto_145480 ?auto_145481 ) ) ( not ( = ?auto_145484 ?auto_145483 ) ) ( not ( = ?auto_145484 ?auto_145481 ) ) ( not ( = ?auto_145483 ?auto_145481 ) ) ( ON ?auto_145483 ?auto_145484 ) ( CLEAR ?auto_145482 ) ( ON-TABLE ?auto_145485 ) ( ON ?auto_145482 ?auto_145485 ) ( not ( = ?auto_145485 ?auto_145482 ) ) ( not ( = ?auto_145485 ?auto_145481 ) ) ( not ( = ?auto_145482 ?auto_145481 ) ) ( not ( = ?auto_145478 ?auto_145482 ) ) ( not ( = ?auto_145478 ?auto_145485 ) ) ( not ( = ?auto_145479 ?auto_145482 ) ) ( not ( = ?auto_145479 ?auto_145485 ) ) ( not ( = ?auto_145480 ?auto_145482 ) ) ( not ( = ?auto_145480 ?auto_145485 ) ) ( not ( = ?auto_145484 ?auto_145482 ) ) ( not ( = ?auto_145484 ?auto_145485 ) ) ( not ( = ?auto_145483 ?auto_145482 ) ) ( not ( = ?auto_145483 ?auto_145485 ) ) ( ON ?auto_145481 ?auto_145483 ) ( CLEAR ?auto_145481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145478 ?auto_145479 ?auto_145480 ?auto_145484 ?auto_145483 )
      ( MAKE-3PILE ?auto_145478 ?auto_145479 ?auto_145480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145486 - BLOCK
      ?auto_145487 - BLOCK
      ?auto_145488 - BLOCK
    )
    :vars
    (
      ?auto_145489 - BLOCK
      ?auto_145492 - BLOCK
      ?auto_145490 - BLOCK
      ?auto_145493 - BLOCK
      ?auto_145491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145489 ?auto_145488 ) ( ON-TABLE ?auto_145486 ) ( ON ?auto_145487 ?auto_145486 ) ( ON ?auto_145488 ?auto_145487 ) ( not ( = ?auto_145486 ?auto_145487 ) ) ( not ( = ?auto_145486 ?auto_145488 ) ) ( not ( = ?auto_145486 ?auto_145489 ) ) ( not ( = ?auto_145487 ?auto_145488 ) ) ( not ( = ?auto_145487 ?auto_145489 ) ) ( not ( = ?auto_145488 ?auto_145489 ) ) ( not ( = ?auto_145486 ?auto_145492 ) ) ( not ( = ?auto_145486 ?auto_145490 ) ) ( not ( = ?auto_145487 ?auto_145492 ) ) ( not ( = ?auto_145487 ?auto_145490 ) ) ( not ( = ?auto_145488 ?auto_145492 ) ) ( not ( = ?auto_145488 ?auto_145490 ) ) ( not ( = ?auto_145489 ?auto_145492 ) ) ( not ( = ?auto_145489 ?auto_145490 ) ) ( not ( = ?auto_145492 ?auto_145490 ) ) ( ON ?auto_145492 ?auto_145489 ) ( ON-TABLE ?auto_145493 ) ( not ( = ?auto_145493 ?auto_145491 ) ) ( not ( = ?auto_145493 ?auto_145490 ) ) ( not ( = ?auto_145491 ?auto_145490 ) ) ( not ( = ?auto_145486 ?auto_145491 ) ) ( not ( = ?auto_145486 ?auto_145493 ) ) ( not ( = ?auto_145487 ?auto_145491 ) ) ( not ( = ?auto_145487 ?auto_145493 ) ) ( not ( = ?auto_145488 ?auto_145491 ) ) ( not ( = ?auto_145488 ?auto_145493 ) ) ( not ( = ?auto_145489 ?auto_145491 ) ) ( not ( = ?auto_145489 ?auto_145493 ) ) ( not ( = ?auto_145492 ?auto_145491 ) ) ( not ( = ?auto_145492 ?auto_145493 ) ) ( ON ?auto_145490 ?auto_145492 ) ( CLEAR ?auto_145490 ) ( HOLDING ?auto_145491 ) ( CLEAR ?auto_145493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145493 ?auto_145491 )
      ( MAKE-3PILE ?auto_145486 ?auto_145487 ?auto_145488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145494 - BLOCK
      ?auto_145495 - BLOCK
      ?auto_145496 - BLOCK
    )
    :vars
    (
      ?auto_145498 - BLOCK
      ?auto_145497 - BLOCK
      ?auto_145501 - BLOCK
      ?auto_145500 - BLOCK
      ?auto_145499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145498 ?auto_145496 ) ( ON-TABLE ?auto_145494 ) ( ON ?auto_145495 ?auto_145494 ) ( ON ?auto_145496 ?auto_145495 ) ( not ( = ?auto_145494 ?auto_145495 ) ) ( not ( = ?auto_145494 ?auto_145496 ) ) ( not ( = ?auto_145494 ?auto_145498 ) ) ( not ( = ?auto_145495 ?auto_145496 ) ) ( not ( = ?auto_145495 ?auto_145498 ) ) ( not ( = ?auto_145496 ?auto_145498 ) ) ( not ( = ?auto_145494 ?auto_145497 ) ) ( not ( = ?auto_145494 ?auto_145501 ) ) ( not ( = ?auto_145495 ?auto_145497 ) ) ( not ( = ?auto_145495 ?auto_145501 ) ) ( not ( = ?auto_145496 ?auto_145497 ) ) ( not ( = ?auto_145496 ?auto_145501 ) ) ( not ( = ?auto_145498 ?auto_145497 ) ) ( not ( = ?auto_145498 ?auto_145501 ) ) ( not ( = ?auto_145497 ?auto_145501 ) ) ( ON ?auto_145497 ?auto_145498 ) ( ON-TABLE ?auto_145500 ) ( not ( = ?auto_145500 ?auto_145499 ) ) ( not ( = ?auto_145500 ?auto_145501 ) ) ( not ( = ?auto_145499 ?auto_145501 ) ) ( not ( = ?auto_145494 ?auto_145499 ) ) ( not ( = ?auto_145494 ?auto_145500 ) ) ( not ( = ?auto_145495 ?auto_145499 ) ) ( not ( = ?auto_145495 ?auto_145500 ) ) ( not ( = ?auto_145496 ?auto_145499 ) ) ( not ( = ?auto_145496 ?auto_145500 ) ) ( not ( = ?auto_145498 ?auto_145499 ) ) ( not ( = ?auto_145498 ?auto_145500 ) ) ( not ( = ?auto_145497 ?auto_145499 ) ) ( not ( = ?auto_145497 ?auto_145500 ) ) ( ON ?auto_145501 ?auto_145497 ) ( CLEAR ?auto_145500 ) ( ON ?auto_145499 ?auto_145501 ) ( CLEAR ?auto_145499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145494 ?auto_145495 ?auto_145496 ?auto_145498 ?auto_145497 ?auto_145501 )
      ( MAKE-3PILE ?auto_145494 ?auto_145495 ?auto_145496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145502 - BLOCK
      ?auto_145503 - BLOCK
      ?auto_145504 - BLOCK
    )
    :vars
    (
      ?auto_145505 - BLOCK
      ?auto_145509 - BLOCK
      ?auto_145506 - BLOCK
      ?auto_145508 - BLOCK
      ?auto_145507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145505 ?auto_145504 ) ( ON-TABLE ?auto_145502 ) ( ON ?auto_145503 ?auto_145502 ) ( ON ?auto_145504 ?auto_145503 ) ( not ( = ?auto_145502 ?auto_145503 ) ) ( not ( = ?auto_145502 ?auto_145504 ) ) ( not ( = ?auto_145502 ?auto_145505 ) ) ( not ( = ?auto_145503 ?auto_145504 ) ) ( not ( = ?auto_145503 ?auto_145505 ) ) ( not ( = ?auto_145504 ?auto_145505 ) ) ( not ( = ?auto_145502 ?auto_145509 ) ) ( not ( = ?auto_145502 ?auto_145506 ) ) ( not ( = ?auto_145503 ?auto_145509 ) ) ( not ( = ?auto_145503 ?auto_145506 ) ) ( not ( = ?auto_145504 ?auto_145509 ) ) ( not ( = ?auto_145504 ?auto_145506 ) ) ( not ( = ?auto_145505 ?auto_145509 ) ) ( not ( = ?auto_145505 ?auto_145506 ) ) ( not ( = ?auto_145509 ?auto_145506 ) ) ( ON ?auto_145509 ?auto_145505 ) ( not ( = ?auto_145508 ?auto_145507 ) ) ( not ( = ?auto_145508 ?auto_145506 ) ) ( not ( = ?auto_145507 ?auto_145506 ) ) ( not ( = ?auto_145502 ?auto_145507 ) ) ( not ( = ?auto_145502 ?auto_145508 ) ) ( not ( = ?auto_145503 ?auto_145507 ) ) ( not ( = ?auto_145503 ?auto_145508 ) ) ( not ( = ?auto_145504 ?auto_145507 ) ) ( not ( = ?auto_145504 ?auto_145508 ) ) ( not ( = ?auto_145505 ?auto_145507 ) ) ( not ( = ?auto_145505 ?auto_145508 ) ) ( not ( = ?auto_145509 ?auto_145507 ) ) ( not ( = ?auto_145509 ?auto_145508 ) ) ( ON ?auto_145506 ?auto_145509 ) ( ON ?auto_145507 ?auto_145506 ) ( CLEAR ?auto_145507 ) ( HOLDING ?auto_145508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145508 )
      ( MAKE-3PILE ?auto_145502 ?auto_145503 ?auto_145504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145521 - BLOCK
      ?auto_145522 - BLOCK
      ?auto_145523 - BLOCK
    )
    :vars
    (
      ?auto_145527 - BLOCK
      ?auto_145524 - BLOCK
      ?auto_145525 - BLOCK
      ?auto_145526 - BLOCK
      ?auto_145528 - BLOCK
      ?auto_145529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145527 ?auto_145523 ) ( ON-TABLE ?auto_145521 ) ( ON ?auto_145522 ?auto_145521 ) ( ON ?auto_145523 ?auto_145522 ) ( not ( = ?auto_145521 ?auto_145522 ) ) ( not ( = ?auto_145521 ?auto_145523 ) ) ( not ( = ?auto_145521 ?auto_145527 ) ) ( not ( = ?auto_145522 ?auto_145523 ) ) ( not ( = ?auto_145522 ?auto_145527 ) ) ( not ( = ?auto_145523 ?auto_145527 ) ) ( not ( = ?auto_145521 ?auto_145524 ) ) ( not ( = ?auto_145521 ?auto_145525 ) ) ( not ( = ?auto_145522 ?auto_145524 ) ) ( not ( = ?auto_145522 ?auto_145525 ) ) ( not ( = ?auto_145523 ?auto_145524 ) ) ( not ( = ?auto_145523 ?auto_145525 ) ) ( not ( = ?auto_145527 ?auto_145524 ) ) ( not ( = ?auto_145527 ?auto_145525 ) ) ( not ( = ?auto_145524 ?auto_145525 ) ) ( ON ?auto_145524 ?auto_145527 ) ( not ( = ?auto_145526 ?auto_145528 ) ) ( not ( = ?auto_145526 ?auto_145525 ) ) ( not ( = ?auto_145528 ?auto_145525 ) ) ( not ( = ?auto_145521 ?auto_145528 ) ) ( not ( = ?auto_145521 ?auto_145526 ) ) ( not ( = ?auto_145522 ?auto_145528 ) ) ( not ( = ?auto_145522 ?auto_145526 ) ) ( not ( = ?auto_145523 ?auto_145528 ) ) ( not ( = ?auto_145523 ?auto_145526 ) ) ( not ( = ?auto_145527 ?auto_145528 ) ) ( not ( = ?auto_145527 ?auto_145526 ) ) ( not ( = ?auto_145524 ?auto_145528 ) ) ( not ( = ?auto_145524 ?auto_145526 ) ) ( ON ?auto_145525 ?auto_145524 ) ( ON ?auto_145528 ?auto_145525 ) ( CLEAR ?auto_145528 ) ( ON ?auto_145526 ?auto_145529 ) ( CLEAR ?auto_145526 ) ( HAND-EMPTY ) ( not ( = ?auto_145521 ?auto_145529 ) ) ( not ( = ?auto_145522 ?auto_145529 ) ) ( not ( = ?auto_145523 ?auto_145529 ) ) ( not ( = ?auto_145527 ?auto_145529 ) ) ( not ( = ?auto_145524 ?auto_145529 ) ) ( not ( = ?auto_145525 ?auto_145529 ) ) ( not ( = ?auto_145526 ?auto_145529 ) ) ( not ( = ?auto_145528 ?auto_145529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145526 ?auto_145529 )
      ( MAKE-3PILE ?auto_145521 ?auto_145522 ?auto_145523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145530 - BLOCK
      ?auto_145531 - BLOCK
      ?auto_145532 - BLOCK
    )
    :vars
    (
      ?auto_145533 - BLOCK
      ?auto_145538 - BLOCK
      ?auto_145534 - BLOCK
      ?auto_145536 - BLOCK
      ?auto_145535 - BLOCK
      ?auto_145537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145533 ?auto_145532 ) ( ON-TABLE ?auto_145530 ) ( ON ?auto_145531 ?auto_145530 ) ( ON ?auto_145532 ?auto_145531 ) ( not ( = ?auto_145530 ?auto_145531 ) ) ( not ( = ?auto_145530 ?auto_145532 ) ) ( not ( = ?auto_145530 ?auto_145533 ) ) ( not ( = ?auto_145531 ?auto_145532 ) ) ( not ( = ?auto_145531 ?auto_145533 ) ) ( not ( = ?auto_145532 ?auto_145533 ) ) ( not ( = ?auto_145530 ?auto_145538 ) ) ( not ( = ?auto_145530 ?auto_145534 ) ) ( not ( = ?auto_145531 ?auto_145538 ) ) ( not ( = ?auto_145531 ?auto_145534 ) ) ( not ( = ?auto_145532 ?auto_145538 ) ) ( not ( = ?auto_145532 ?auto_145534 ) ) ( not ( = ?auto_145533 ?auto_145538 ) ) ( not ( = ?auto_145533 ?auto_145534 ) ) ( not ( = ?auto_145538 ?auto_145534 ) ) ( ON ?auto_145538 ?auto_145533 ) ( not ( = ?auto_145536 ?auto_145535 ) ) ( not ( = ?auto_145536 ?auto_145534 ) ) ( not ( = ?auto_145535 ?auto_145534 ) ) ( not ( = ?auto_145530 ?auto_145535 ) ) ( not ( = ?auto_145530 ?auto_145536 ) ) ( not ( = ?auto_145531 ?auto_145535 ) ) ( not ( = ?auto_145531 ?auto_145536 ) ) ( not ( = ?auto_145532 ?auto_145535 ) ) ( not ( = ?auto_145532 ?auto_145536 ) ) ( not ( = ?auto_145533 ?auto_145535 ) ) ( not ( = ?auto_145533 ?auto_145536 ) ) ( not ( = ?auto_145538 ?auto_145535 ) ) ( not ( = ?auto_145538 ?auto_145536 ) ) ( ON ?auto_145534 ?auto_145538 ) ( ON ?auto_145536 ?auto_145537 ) ( CLEAR ?auto_145536 ) ( not ( = ?auto_145530 ?auto_145537 ) ) ( not ( = ?auto_145531 ?auto_145537 ) ) ( not ( = ?auto_145532 ?auto_145537 ) ) ( not ( = ?auto_145533 ?auto_145537 ) ) ( not ( = ?auto_145538 ?auto_145537 ) ) ( not ( = ?auto_145534 ?auto_145537 ) ) ( not ( = ?auto_145536 ?auto_145537 ) ) ( not ( = ?auto_145535 ?auto_145537 ) ) ( HOLDING ?auto_145535 ) ( CLEAR ?auto_145534 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145530 ?auto_145531 ?auto_145532 ?auto_145533 ?auto_145538 ?auto_145534 ?auto_145535 )
      ( MAKE-3PILE ?auto_145530 ?auto_145531 ?auto_145532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145539 - BLOCK
      ?auto_145540 - BLOCK
      ?auto_145541 - BLOCK
    )
    :vars
    (
      ?auto_145544 - BLOCK
      ?auto_145545 - BLOCK
      ?auto_145547 - BLOCK
      ?auto_145542 - BLOCK
      ?auto_145543 - BLOCK
      ?auto_145546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145544 ?auto_145541 ) ( ON-TABLE ?auto_145539 ) ( ON ?auto_145540 ?auto_145539 ) ( ON ?auto_145541 ?auto_145540 ) ( not ( = ?auto_145539 ?auto_145540 ) ) ( not ( = ?auto_145539 ?auto_145541 ) ) ( not ( = ?auto_145539 ?auto_145544 ) ) ( not ( = ?auto_145540 ?auto_145541 ) ) ( not ( = ?auto_145540 ?auto_145544 ) ) ( not ( = ?auto_145541 ?auto_145544 ) ) ( not ( = ?auto_145539 ?auto_145545 ) ) ( not ( = ?auto_145539 ?auto_145547 ) ) ( not ( = ?auto_145540 ?auto_145545 ) ) ( not ( = ?auto_145540 ?auto_145547 ) ) ( not ( = ?auto_145541 ?auto_145545 ) ) ( not ( = ?auto_145541 ?auto_145547 ) ) ( not ( = ?auto_145544 ?auto_145545 ) ) ( not ( = ?auto_145544 ?auto_145547 ) ) ( not ( = ?auto_145545 ?auto_145547 ) ) ( ON ?auto_145545 ?auto_145544 ) ( not ( = ?auto_145542 ?auto_145543 ) ) ( not ( = ?auto_145542 ?auto_145547 ) ) ( not ( = ?auto_145543 ?auto_145547 ) ) ( not ( = ?auto_145539 ?auto_145543 ) ) ( not ( = ?auto_145539 ?auto_145542 ) ) ( not ( = ?auto_145540 ?auto_145543 ) ) ( not ( = ?auto_145540 ?auto_145542 ) ) ( not ( = ?auto_145541 ?auto_145543 ) ) ( not ( = ?auto_145541 ?auto_145542 ) ) ( not ( = ?auto_145544 ?auto_145543 ) ) ( not ( = ?auto_145544 ?auto_145542 ) ) ( not ( = ?auto_145545 ?auto_145543 ) ) ( not ( = ?auto_145545 ?auto_145542 ) ) ( ON ?auto_145547 ?auto_145545 ) ( ON ?auto_145542 ?auto_145546 ) ( not ( = ?auto_145539 ?auto_145546 ) ) ( not ( = ?auto_145540 ?auto_145546 ) ) ( not ( = ?auto_145541 ?auto_145546 ) ) ( not ( = ?auto_145544 ?auto_145546 ) ) ( not ( = ?auto_145545 ?auto_145546 ) ) ( not ( = ?auto_145547 ?auto_145546 ) ) ( not ( = ?auto_145542 ?auto_145546 ) ) ( not ( = ?auto_145543 ?auto_145546 ) ) ( CLEAR ?auto_145547 ) ( ON ?auto_145543 ?auto_145542 ) ( CLEAR ?auto_145543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145546 ?auto_145542 )
      ( MAKE-3PILE ?auto_145539 ?auto_145540 ?auto_145541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145548 - BLOCK
      ?auto_145549 - BLOCK
      ?auto_145550 - BLOCK
    )
    :vars
    (
      ?auto_145554 - BLOCK
      ?auto_145552 - BLOCK
      ?auto_145553 - BLOCK
      ?auto_145556 - BLOCK
      ?auto_145551 - BLOCK
      ?auto_145555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145554 ?auto_145550 ) ( ON-TABLE ?auto_145548 ) ( ON ?auto_145549 ?auto_145548 ) ( ON ?auto_145550 ?auto_145549 ) ( not ( = ?auto_145548 ?auto_145549 ) ) ( not ( = ?auto_145548 ?auto_145550 ) ) ( not ( = ?auto_145548 ?auto_145554 ) ) ( not ( = ?auto_145549 ?auto_145550 ) ) ( not ( = ?auto_145549 ?auto_145554 ) ) ( not ( = ?auto_145550 ?auto_145554 ) ) ( not ( = ?auto_145548 ?auto_145552 ) ) ( not ( = ?auto_145548 ?auto_145553 ) ) ( not ( = ?auto_145549 ?auto_145552 ) ) ( not ( = ?auto_145549 ?auto_145553 ) ) ( not ( = ?auto_145550 ?auto_145552 ) ) ( not ( = ?auto_145550 ?auto_145553 ) ) ( not ( = ?auto_145554 ?auto_145552 ) ) ( not ( = ?auto_145554 ?auto_145553 ) ) ( not ( = ?auto_145552 ?auto_145553 ) ) ( ON ?auto_145552 ?auto_145554 ) ( not ( = ?auto_145556 ?auto_145551 ) ) ( not ( = ?auto_145556 ?auto_145553 ) ) ( not ( = ?auto_145551 ?auto_145553 ) ) ( not ( = ?auto_145548 ?auto_145551 ) ) ( not ( = ?auto_145548 ?auto_145556 ) ) ( not ( = ?auto_145549 ?auto_145551 ) ) ( not ( = ?auto_145549 ?auto_145556 ) ) ( not ( = ?auto_145550 ?auto_145551 ) ) ( not ( = ?auto_145550 ?auto_145556 ) ) ( not ( = ?auto_145554 ?auto_145551 ) ) ( not ( = ?auto_145554 ?auto_145556 ) ) ( not ( = ?auto_145552 ?auto_145551 ) ) ( not ( = ?auto_145552 ?auto_145556 ) ) ( ON ?auto_145556 ?auto_145555 ) ( not ( = ?auto_145548 ?auto_145555 ) ) ( not ( = ?auto_145549 ?auto_145555 ) ) ( not ( = ?auto_145550 ?auto_145555 ) ) ( not ( = ?auto_145554 ?auto_145555 ) ) ( not ( = ?auto_145552 ?auto_145555 ) ) ( not ( = ?auto_145553 ?auto_145555 ) ) ( not ( = ?auto_145556 ?auto_145555 ) ) ( not ( = ?auto_145551 ?auto_145555 ) ) ( ON ?auto_145551 ?auto_145556 ) ( CLEAR ?auto_145551 ) ( ON-TABLE ?auto_145555 ) ( HOLDING ?auto_145553 ) ( CLEAR ?auto_145552 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145548 ?auto_145549 ?auto_145550 ?auto_145554 ?auto_145552 ?auto_145553 )
      ( MAKE-3PILE ?auto_145548 ?auto_145549 ?auto_145550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145615 - BLOCK
      ?auto_145616 - BLOCK
      ?auto_145617 - BLOCK
      ?auto_145618 - BLOCK
      ?auto_145619 - BLOCK
    )
    :vars
    (
      ?auto_145620 - BLOCK
      ?auto_145621 - BLOCK
      ?auto_145622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145615 ) ( ON ?auto_145616 ?auto_145615 ) ( ON ?auto_145617 ?auto_145616 ) ( not ( = ?auto_145615 ?auto_145616 ) ) ( not ( = ?auto_145615 ?auto_145617 ) ) ( not ( = ?auto_145615 ?auto_145618 ) ) ( not ( = ?auto_145615 ?auto_145619 ) ) ( not ( = ?auto_145616 ?auto_145617 ) ) ( not ( = ?auto_145616 ?auto_145618 ) ) ( not ( = ?auto_145616 ?auto_145619 ) ) ( not ( = ?auto_145617 ?auto_145618 ) ) ( not ( = ?auto_145617 ?auto_145619 ) ) ( not ( = ?auto_145618 ?auto_145619 ) ) ( ON ?auto_145619 ?auto_145620 ) ( not ( = ?auto_145615 ?auto_145620 ) ) ( not ( = ?auto_145616 ?auto_145620 ) ) ( not ( = ?auto_145617 ?auto_145620 ) ) ( not ( = ?auto_145618 ?auto_145620 ) ) ( not ( = ?auto_145619 ?auto_145620 ) ) ( CLEAR ?auto_145617 ) ( ON ?auto_145618 ?auto_145619 ) ( CLEAR ?auto_145618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145621 ) ( ON ?auto_145622 ?auto_145621 ) ( ON ?auto_145620 ?auto_145622 ) ( not ( = ?auto_145621 ?auto_145622 ) ) ( not ( = ?auto_145621 ?auto_145620 ) ) ( not ( = ?auto_145621 ?auto_145619 ) ) ( not ( = ?auto_145621 ?auto_145618 ) ) ( not ( = ?auto_145622 ?auto_145620 ) ) ( not ( = ?auto_145622 ?auto_145619 ) ) ( not ( = ?auto_145622 ?auto_145618 ) ) ( not ( = ?auto_145615 ?auto_145621 ) ) ( not ( = ?auto_145615 ?auto_145622 ) ) ( not ( = ?auto_145616 ?auto_145621 ) ) ( not ( = ?auto_145616 ?auto_145622 ) ) ( not ( = ?auto_145617 ?auto_145621 ) ) ( not ( = ?auto_145617 ?auto_145622 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145621 ?auto_145622 ?auto_145620 ?auto_145619 )
      ( MAKE-5PILE ?auto_145615 ?auto_145616 ?auto_145617 ?auto_145618 ?auto_145619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145623 - BLOCK
      ?auto_145624 - BLOCK
      ?auto_145625 - BLOCK
      ?auto_145626 - BLOCK
      ?auto_145627 - BLOCK
    )
    :vars
    (
      ?auto_145628 - BLOCK
      ?auto_145630 - BLOCK
      ?auto_145629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145623 ) ( ON ?auto_145624 ?auto_145623 ) ( not ( = ?auto_145623 ?auto_145624 ) ) ( not ( = ?auto_145623 ?auto_145625 ) ) ( not ( = ?auto_145623 ?auto_145626 ) ) ( not ( = ?auto_145623 ?auto_145627 ) ) ( not ( = ?auto_145624 ?auto_145625 ) ) ( not ( = ?auto_145624 ?auto_145626 ) ) ( not ( = ?auto_145624 ?auto_145627 ) ) ( not ( = ?auto_145625 ?auto_145626 ) ) ( not ( = ?auto_145625 ?auto_145627 ) ) ( not ( = ?auto_145626 ?auto_145627 ) ) ( ON ?auto_145627 ?auto_145628 ) ( not ( = ?auto_145623 ?auto_145628 ) ) ( not ( = ?auto_145624 ?auto_145628 ) ) ( not ( = ?auto_145625 ?auto_145628 ) ) ( not ( = ?auto_145626 ?auto_145628 ) ) ( not ( = ?auto_145627 ?auto_145628 ) ) ( ON ?auto_145626 ?auto_145627 ) ( CLEAR ?auto_145626 ) ( ON-TABLE ?auto_145630 ) ( ON ?auto_145629 ?auto_145630 ) ( ON ?auto_145628 ?auto_145629 ) ( not ( = ?auto_145630 ?auto_145629 ) ) ( not ( = ?auto_145630 ?auto_145628 ) ) ( not ( = ?auto_145630 ?auto_145627 ) ) ( not ( = ?auto_145630 ?auto_145626 ) ) ( not ( = ?auto_145629 ?auto_145628 ) ) ( not ( = ?auto_145629 ?auto_145627 ) ) ( not ( = ?auto_145629 ?auto_145626 ) ) ( not ( = ?auto_145623 ?auto_145630 ) ) ( not ( = ?auto_145623 ?auto_145629 ) ) ( not ( = ?auto_145624 ?auto_145630 ) ) ( not ( = ?auto_145624 ?auto_145629 ) ) ( not ( = ?auto_145625 ?auto_145630 ) ) ( not ( = ?auto_145625 ?auto_145629 ) ) ( HOLDING ?auto_145625 ) ( CLEAR ?auto_145624 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145623 ?auto_145624 ?auto_145625 )
      ( MAKE-5PILE ?auto_145623 ?auto_145624 ?auto_145625 ?auto_145626 ?auto_145627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145631 - BLOCK
      ?auto_145632 - BLOCK
      ?auto_145633 - BLOCK
      ?auto_145634 - BLOCK
      ?auto_145635 - BLOCK
    )
    :vars
    (
      ?auto_145636 - BLOCK
      ?auto_145637 - BLOCK
      ?auto_145638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145631 ) ( ON ?auto_145632 ?auto_145631 ) ( not ( = ?auto_145631 ?auto_145632 ) ) ( not ( = ?auto_145631 ?auto_145633 ) ) ( not ( = ?auto_145631 ?auto_145634 ) ) ( not ( = ?auto_145631 ?auto_145635 ) ) ( not ( = ?auto_145632 ?auto_145633 ) ) ( not ( = ?auto_145632 ?auto_145634 ) ) ( not ( = ?auto_145632 ?auto_145635 ) ) ( not ( = ?auto_145633 ?auto_145634 ) ) ( not ( = ?auto_145633 ?auto_145635 ) ) ( not ( = ?auto_145634 ?auto_145635 ) ) ( ON ?auto_145635 ?auto_145636 ) ( not ( = ?auto_145631 ?auto_145636 ) ) ( not ( = ?auto_145632 ?auto_145636 ) ) ( not ( = ?auto_145633 ?auto_145636 ) ) ( not ( = ?auto_145634 ?auto_145636 ) ) ( not ( = ?auto_145635 ?auto_145636 ) ) ( ON ?auto_145634 ?auto_145635 ) ( ON-TABLE ?auto_145637 ) ( ON ?auto_145638 ?auto_145637 ) ( ON ?auto_145636 ?auto_145638 ) ( not ( = ?auto_145637 ?auto_145638 ) ) ( not ( = ?auto_145637 ?auto_145636 ) ) ( not ( = ?auto_145637 ?auto_145635 ) ) ( not ( = ?auto_145637 ?auto_145634 ) ) ( not ( = ?auto_145638 ?auto_145636 ) ) ( not ( = ?auto_145638 ?auto_145635 ) ) ( not ( = ?auto_145638 ?auto_145634 ) ) ( not ( = ?auto_145631 ?auto_145637 ) ) ( not ( = ?auto_145631 ?auto_145638 ) ) ( not ( = ?auto_145632 ?auto_145637 ) ) ( not ( = ?auto_145632 ?auto_145638 ) ) ( not ( = ?auto_145633 ?auto_145637 ) ) ( not ( = ?auto_145633 ?auto_145638 ) ) ( CLEAR ?auto_145632 ) ( ON ?auto_145633 ?auto_145634 ) ( CLEAR ?auto_145633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145637 ?auto_145638 ?auto_145636 ?auto_145635 ?auto_145634 )
      ( MAKE-5PILE ?auto_145631 ?auto_145632 ?auto_145633 ?auto_145634 ?auto_145635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145639 - BLOCK
      ?auto_145640 - BLOCK
      ?auto_145641 - BLOCK
      ?auto_145642 - BLOCK
      ?auto_145643 - BLOCK
    )
    :vars
    (
      ?auto_145644 - BLOCK
      ?auto_145645 - BLOCK
      ?auto_145646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145639 ) ( not ( = ?auto_145639 ?auto_145640 ) ) ( not ( = ?auto_145639 ?auto_145641 ) ) ( not ( = ?auto_145639 ?auto_145642 ) ) ( not ( = ?auto_145639 ?auto_145643 ) ) ( not ( = ?auto_145640 ?auto_145641 ) ) ( not ( = ?auto_145640 ?auto_145642 ) ) ( not ( = ?auto_145640 ?auto_145643 ) ) ( not ( = ?auto_145641 ?auto_145642 ) ) ( not ( = ?auto_145641 ?auto_145643 ) ) ( not ( = ?auto_145642 ?auto_145643 ) ) ( ON ?auto_145643 ?auto_145644 ) ( not ( = ?auto_145639 ?auto_145644 ) ) ( not ( = ?auto_145640 ?auto_145644 ) ) ( not ( = ?auto_145641 ?auto_145644 ) ) ( not ( = ?auto_145642 ?auto_145644 ) ) ( not ( = ?auto_145643 ?auto_145644 ) ) ( ON ?auto_145642 ?auto_145643 ) ( ON-TABLE ?auto_145645 ) ( ON ?auto_145646 ?auto_145645 ) ( ON ?auto_145644 ?auto_145646 ) ( not ( = ?auto_145645 ?auto_145646 ) ) ( not ( = ?auto_145645 ?auto_145644 ) ) ( not ( = ?auto_145645 ?auto_145643 ) ) ( not ( = ?auto_145645 ?auto_145642 ) ) ( not ( = ?auto_145646 ?auto_145644 ) ) ( not ( = ?auto_145646 ?auto_145643 ) ) ( not ( = ?auto_145646 ?auto_145642 ) ) ( not ( = ?auto_145639 ?auto_145645 ) ) ( not ( = ?auto_145639 ?auto_145646 ) ) ( not ( = ?auto_145640 ?auto_145645 ) ) ( not ( = ?auto_145640 ?auto_145646 ) ) ( not ( = ?auto_145641 ?auto_145645 ) ) ( not ( = ?auto_145641 ?auto_145646 ) ) ( ON ?auto_145641 ?auto_145642 ) ( CLEAR ?auto_145641 ) ( HOLDING ?auto_145640 ) ( CLEAR ?auto_145639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145639 ?auto_145640 )
      ( MAKE-5PILE ?auto_145639 ?auto_145640 ?auto_145641 ?auto_145642 ?auto_145643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145647 - BLOCK
      ?auto_145648 - BLOCK
      ?auto_145649 - BLOCK
      ?auto_145650 - BLOCK
      ?auto_145651 - BLOCK
    )
    :vars
    (
      ?auto_145653 - BLOCK
      ?auto_145654 - BLOCK
      ?auto_145652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145647 ) ( not ( = ?auto_145647 ?auto_145648 ) ) ( not ( = ?auto_145647 ?auto_145649 ) ) ( not ( = ?auto_145647 ?auto_145650 ) ) ( not ( = ?auto_145647 ?auto_145651 ) ) ( not ( = ?auto_145648 ?auto_145649 ) ) ( not ( = ?auto_145648 ?auto_145650 ) ) ( not ( = ?auto_145648 ?auto_145651 ) ) ( not ( = ?auto_145649 ?auto_145650 ) ) ( not ( = ?auto_145649 ?auto_145651 ) ) ( not ( = ?auto_145650 ?auto_145651 ) ) ( ON ?auto_145651 ?auto_145653 ) ( not ( = ?auto_145647 ?auto_145653 ) ) ( not ( = ?auto_145648 ?auto_145653 ) ) ( not ( = ?auto_145649 ?auto_145653 ) ) ( not ( = ?auto_145650 ?auto_145653 ) ) ( not ( = ?auto_145651 ?auto_145653 ) ) ( ON ?auto_145650 ?auto_145651 ) ( ON-TABLE ?auto_145654 ) ( ON ?auto_145652 ?auto_145654 ) ( ON ?auto_145653 ?auto_145652 ) ( not ( = ?auto_145654 ?auto_145652 ) ) ( not ( = ?auto_145654 ?auto_145653 ) ) ( not ( = ?auto_145654 ?auto_145651 ) ) ( not ( = ?auto_145654 ?auto_145650 ) ) ( not ( = ?auto_145652 ?auto_145653 ) ) ( not ( = ?auto_145652 ?auto_145651 ) ) ( not ( = ?auto_145652 ?auto_145650 ) ) ( not ( = ?auto_145647 ?auto_145654 ) ) ( not ( = ?auto_145647 ?auto_145652 ) ) ( not ( = ?auto_145648 ?auto_145654 ) ) ( not ( = ?auto_145648 ?auto_145652 ) ) ( not ( = ?auto_145649 ?auto_145654 ) ) ( not ( = ?auto_145649 ?auto_145652 ) ) ( ON ?auto_145649 ?auto_145650 ) ( CLEAR ?auto_145647 ) ( ON ?auto_145648 ?auto_145649 ) ( CLEAR ?auto_145648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145654 ?auto_145652 ?auto_145653 ?auto_145651 ?auto_145650 ?auto_145649 )
      ( MAKE-5PILE ?auto_145647 ?auto_145648 ?auto_145649 ?auto_145650 ?auto_145651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145655 - BLOCK
      ?auto_145656 - BLOCK
      ?auto_145657 - BLOCK
      ?auto_145658 - BLOCK
      ?auto_145659 - BLOCK
    )
    :vars
    (
      ?auto_145661 - BLOCK
      ?auto_145660 - BLOCK
      ?auto_145662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145655 ?auto_145656 ) ) ( not ( = ?auto_145655 ?auto_145657 ) ) ( not ( = ?auto_145655 ?auto_145658 ) ) ( not ( = ?auto_145655 ?auto_145659 ) ) ( not ( = ?auto_145656 ?auto_145657 ) ) ( not ( = ?auto_145656 ?auto_145658 ) ) ( not ( = ?auto_145656 ?auto_145659 ) ) ( not ( = ?auto_145657 ?auto_145658 ) ) ( not ( = ?auto_145657 ?auto_145659 ) ) ( not ( = ?auto_145658 ?auto_145659 ) ) ( ON ?auto_145659 ?auto_145661 ) ( not ( = ?auto_145655 ?auto_145661 ) ) ( not ( = ?auto_145656 ?auto_145661 ) ) ( not ( = ?auto_145657 ?auto_145661 ) ) ( not ( = ?auto_145658 ?auto_145661 ) ) ( not ( = ?auto_145659 ?auto_145661 ) ) ( ON ?auto_145658 ?auto_145659 ) ( ON-TABLE ?auto_145660 ) ( ON ?auto_145662 ?auto_145660 ) ( ON ?auto_145661 ?auto_145662 ) ( not ( = ?auto_145660 ?auto_145662 ) ) ( not ( = ?auto_145660 ?auto_145661 ) ) ( not ( = ?auto_145660 ?auto_145659 ) ) ( not ( = ?auto_145660 ?auto_145658 ) ) ( not ( = ?auto_145662 ?auto_145661 ) ) ( not ( = ?auto_145662 ?auto_145659 ) ) ( not ( = ?auto_145662 ?auto_145658 ) ) ( not ( = ?auto_145655 ?auto_145660 ) ) ( not ( = ?auto_145655 ?auto_145662 ) ) ( not ( = ?auto_145656 ?auto_145660 ) ) ( not ( = ?auto_145656 ?auto_145662 ) ) ( not ( = ?auto_145657 ?auto_145660 ) ) ( not ( = ?auto_145657 ?auto_145662 ) ) ( ON ?auto_145657 ?auto_145658 ) ( ON ?auto_145656 ?auto_145657 ) ( CLEAR ?auto_145656 ) ( HOLDING ?auto_145655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145655 )
      ( MAKE-5PILE ?auto_145655 ?auto_145656 ?auto_145657 ?auto_145658 ?auto_145659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145663 - BLOCK
      ?auto_145664 - BLOCK
      ?auto_145665 - BLOCK
      ?auto_145666 - BLOCK
      ?auto_145667 - BLOCK
    )
    :vars
    (
      ?auto_145669 - BLOCK
      ?auto_145668 - BLOCK
      ?auto_145670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145663 ?auto_145664 ) ) ( not ( = ?auto_145663 ?auto_145665 ) ) ( not ( = ?auto_145663 ?auto_145666 ) ) ( not ( = ?auto_145663 ?auto_145667 ) ) ( not ( = ?auto_145664 ?auto_145665 ) ) ( not ( = ?auto_145664 ?auto_145666 ) ) ( not ( = ?auto_145664 ?auto_145667 ) ) ( not ( = ?auto_145665 ?auto_145666 ) ) ( not ( = ?auto_145665 ?auto_145667 ) ) ( not ( = ?auto_145666 ?auto_145667 ) ) ( ON ?auto_145667 ?auto_145669 ) ( not ( = ?auto_145663 ?auto_145669 ) ) ( not ( = ?auto_145664 ?auto_145669 ) ) ( not ( = ?auto_145665 ?auto_145669 ) ) ( not ( = ?auto_145666 ?auto_145669 ) ) ( not ( = ?auto_145667 ?auto_145669 ) ) ( ON ?auto_145666 ?auto_145667 ) ( ON-TABLE ?auto_145668 ) ( ON ?auto_145670 ?auto_145668 ) ( ON ?auto_145669 ?auto_145670 ) ( not ( = ?auto_145668 ?auto_145670 ) ) ( not ( = ?auto_145668 ?auto_145669 ) ) ( not ( = ?auto_145668 ?auto_145667 ) ) ( not ( = ?auto_145668 ?auto_145666 ) ) ( not ( = ?auto_145670 ?auto_145669 ) ) ( not ( = ?auto_145670 ?auto_145667 ) ) ( not ( = ?auto_145670 ?auto_145666 ) ) ( not ( = ?auto_145663 ?auto_145668 ) ) ( not ( = ?auto_145663 ?auto_145670 ) ) ( not ( = ?auto_145664 ?auto_145668 ) ) ( not ( = ?auto_145664 ?auto_145670 ) ) ( not ( = ?auto_145665 ?auto_145668 ) ) ( not ( = ?auto_145665 ?auto_145670 ) ) ( ON ?auto_145665 ?auto_145666 ) ( ON ?auto_145664 ?auto_145665 ) ( ON ?auto_145663 ?auto_145664 ) ( CLEAR ?auto_145663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145668 ?auto_145670 ?auto_145669 ?auto_145667 ?auto_145666 ?auto_145665 ?auto_145664 )
      ( MAKE-5PILE ?auto_145663 ?auto_145664 ?auto_145665 ?auto_145666 ?auto_145667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145676 - BLOCK
      ?auto_145677 - BLOCK
      ?auto_145678 - BLOCK
      ?auto_145679 - BLOCK
      ?auto_145680 - BLOCK
    )
    :vars
    (
      ?auto_145682 - BLOCK
      ?auto_145683 - BLOCK
      ?auto_145681 - BLOCK
      ?auto_145684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145676 ?auto_145677 ) ) ( not ( = ?auto_145676 ?auto_145678 ) ) ( not ( = ?auto_145676 ?auto_145679 ) ) ( not ( = ?auto_145676 ?auto_145680 ) ) ( not ( = ?auto_145677 ?auto_145678 ) ) ( not ( = ?auto_145677 ?auto_145679 ) ) ( not ( = ?auto_145677 ?auto_145680 ) ) ( not ( = ?auto_145678 ?auto_145679 ) ) ( not ( = ?auto_145678 ?auto_145680 ) ) ( not ( = ?auto_145679 ?auto_145680 ) ) ( ON ?auto_145680 ?auto_145682 ) ( not ( = ?auto_145676 ?auto_145682 ) ) ( not ( = ?auto_145677 ?auto_145682 ) ) ( not ( = ?auto_145678 ?auto_145682 ) ) ( not ( = ?auto_145679 ?auto_145682 ) ) ( not ( = ?auto_145680 ?auto_145682 ) ) ( ON ?auto_145679 ?auto_145680 ) ( ON-TABLE ?auto_145683 ) ( ON ?auto_145681 ?auto_145683 ) ( ON ?auto_145682 ?auto_145681 ) ( not ( = ?auto_145683 ?auto_145681 ) ) ( not ( = ?auto_145683 ?auto_145682 ) ) ( not ( = ?auto_145683 ?auto_145680 ) ) ( not ( = ?auto_145683 ?auto_145679 ) ) ( not ( = ?auto_145681 ?auto_145682 ) ) ( not ( = ?auto_145681 ?auto_145680 ) ) ( not ( = ?auto_145681 ?auto_145679 ) ) ( not ( = ?auto_145676 ?auto_145683 ) ) ( not ( = ?auto_145676 ?auto_145681 ) ) ( not ( = ?auto_145677 ?auto_145683 ) ) ( not ( = ?auto_145677 ?auto_145681 ) ) ( not ( = ?auto_145678 ?auto_145683 ) ) ( not ( = ?auto_145678 ?auto_145681 ) ) ( ON ?auto_145678 ?auto_145679 ) ( ON ?auto_145677 ?auto_145678 ) ( CLEAR ?auto_145677 ) ( ON ?auto_145676 ?auto_145684 ) ( CLEAR ?auto_145676 ) ( HAND-EMPTY ) ( not ( = ?auto_145676 ?auto_145684 ) ) ( not ( = ?auto_145677 ?auto_145684 ) ) ( not ( = ?auto_145678 ?auto_145684 ) ) ( not ( = ?auto_145679 ?auto_145684 ) ) ( not ( = ?auto_145680 ?auto_145684 ) ) ( not ( = ?auto_145682 ?auto_145684 ) ) ( not ( = ?auto_145683 ?auto_145684 ) ) ( not ( = ?auto_145681 ?auto_145684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145676 ?auto_145684 )
      ( MAKE-5PILE ?auto_145676 ?auto_145677 ?auto_145678 ?auto_145679 ?auto_145680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145685 - BLOCK
      ?auto_145686 - BLOCK
      ?auto_145687 - BLOCK
      ?auto_145688 - BLOCK
      ?auto_145689 - BLOCK
    )
    :vars
    (
      ?auto_145690 - BLOCK
      ?auto_145691 - BLOCK
      ?auto_145692 - BLOCK
      ?auto_145693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145685 ?auto_145686 ) ) ( not ( = ?auto_145685 ?auto_145687 ) ) ( not ( = ?auto_145685 ?auto_145688 ) ) ( not ( = ?auto_145685 ?auto_145689 ) ) ( not ( = ?auto_145686 ?auto_145687 ) ) ( not ( = ?auto_145686 ?auto_145688 ) ) ( not ( = ?auto_145686 ?auto_145689 ) ) ( not ( = ?auto_145687 ?auto_145688 ) ) ( not ( = ?auto_145687 ?auto_145689 ) ) ( not ( = ?auto_145688 ?auto_145689 ) ) ( ON ?auto_145689 ?auto_145690 ) ( not ( = ?auto_145685 ?auto_145690 ) ) ( not ( = ?auto_145686 ?auto_145690 ) ) ( not ( = ?auto_145687 ?auto_145690 ) ) ( not ( = ?auto_145688 ?auto_145690 ) ) ( not ( = ?auto_145689 ?auto_145690 ) ) ( ON ?auto_145688 ?auto_145689 ) ( ON-TABLE ?auto_145691 ) ( ON ?auto_145692 ?auto_145691 ) ( ON ?auto_145690 ?auto_145692 ) ( not ( = ?auto_145691 ?auto_145692 ) ) ( not ( = ?auto_145691 ?auto_145690 ) ) ( not ( = ?auto_145691 ?auto_145689 ) ) ( not ( = ?auto_145691 ?auto_145688 ) ) ( not ( = ?auto_145692 ?auto_145690 ) ) ( not ( = ?auto_145692 ?auto_145689 ) ) ( not ( = ?auto_145692 ?auto_145688 ) ) ( not ( = ?auto_145685 ?auto_145691 ) ) ( not ( = ?auto_145685 ?auto_145692 ) ) ( not ( = ?auto_145686 ?auto_145691 ) ) ( not ( = ?auto_145686 ?auto_145692 ) ) ( not ( = ?auto_145687 ?auto_145691 ) ) ( not ( = ?auto_145687 ?auto_145692 ) ) ( ON ?auto_145687 ?auto_145688 ) ( ON ?auto_145685 ?auto_145693 ) ( CLEAR ?auto_145685 ) ( not ( = ?auto_145685 ?auto_145693 ) ) ( not ( = ?auto_145686 ?auto_145693 ) ) ( not ( = ?auto_145687 ?auto_145693 ) ) ( not ( = ?auto_145688 ?auto_145693 ) ) ( not ( = ?auto_145689 ?auto_145693 ) ) ( not ( = ?auto_145690 ?auto_145693 ) ) ( not ( = ?auto_145691 ?auto_145693 ) ) ( not ( = ?auto_145692 ?auto_145693 ) ) ( HOLDING ?auto_145686 ) ( CLEAR ?auto_145687 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145691 ?auto_145692 ?auto_145690 ?auto_145689 ?auto_145688 ?auto_145687 ?auto_145686 )
      ( MAKE-5PILE ?auto_145685 ?auto_145686 ?auto_145687 ?auto_145688 ?auto_145689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145694 - BLOCK
      ?auto_145695 - BLOCK
      ?auto_145696 - BLOCK
      ?auto_145697 - BLOCK
      ?auto_145698 - BLOCK
    )
    :vars
    (
      ?auto_145700 - BLOCK
      ?auto_145701 - BLOCK
      ?auto_145699 - BLOCK
      ?auto_145702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145694 ?auto_145695 ) ) ( not ( = ?auto_145694 ?auto_145696 ) ) ( not ( = ?auto_145694 ?auto_145697 ) ) ( not ( = ?auto_145694 ?auto_145698 ) ) ( not ( = ?auto_145695 ?auto_145696 ) ) ( not ( = ?auto_145695 ?auto_145697 ) ) ( not ( = ?auto_145695 ?auto_145698 ) ) ( not ( = ?auto_145696 ?auto_145697 ) ) ( not ( = ?auto_145696 ?auto_145698 ) ) ( not ( = ?auto_145697 ?auto_145698 ) ) ( ON ?auto_145698 ?auto_145700 ) ( not ( = ?auto_145694 ?auto_145700 ) ) ( not ( = ?auto_145695 ?auto_145700 ) ) ( not ( = ?auto_145696 ?auto_145700 ) ) ( not ( = ?auto_145697 ?auto_145700 ) ) ( not ( = ?auto_145698 ?auto_145700 ) ) ( ON ?auto_145697 ?auto_145698 ) ( ON-TABLE ?auto_145701 ) ( ON ?auto_145699 ?auto_145701 ) ( ON ?auto_145700 ?auto_145699 ) ( not ( = ?auto_145701 ?auto_145699 ) ) ( not ( = ?auto_145701 ?auto_145700 ) ) ( not ( = ?auto_145701 ?auto_145698 ) ) ( not ( = ?auto_145701 ?auto_145697 ) ) ( not ( = ?auto_145699 ?auto_145700 ) ) ( not ( = ?auto_145699 ?auto_145698 ) ) ( not ( = ?auto_145699 ?auto_145697 ) ) ( not ( = ?auto_145694 ?auto_145701 ) ) ( not ( = ?auto_145694 ?auto_145699 ) ) ( not ( = ?auto_145695 ?auto_145701 ) ) ( not ( = ?auto_145695 ?auto_145699 ) ) ( not ( = ?auto_145696 ?auto_145701 ) ) ( not ( = ?auto_145696 ?auto_145699 ) ) ( ON ?auto_145696 ?auto_145697 ) ( ON ?auto_145694 ?auto_145702 ) ( not ( = ?auto_145694 ?auto_145702 ) ) ( not ( = ?auto_145695 ?auto_145702 ) ) ( not ( = ?auto_145696 ?auto_145702 ) ) ( not ( = ?auto_145697 ?auto_145702 ) ) ( not ( = ?auto_145698 ?auto_145702 ) ) ( not ( = ?auto_145700 ?auto_145702 ) ) ( not ( = ?auto_145701 ?auto_145702 ) ) ( not ( = ?auto_145699 ?auto_145702 ) ) ( CLEAR ?auto_145696 ) ( ON ?auto_145695 ?auto_145694 ) ( CLEAR ?auto_145695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145702 ?auto_145694 )
      ( MAKE-5PILE ?auto_145694 ?auto_145695 ?auto_145696 ?auto_145697 ?auto_145698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145703 - BLOCK
      ?auto_145704 - BLOCK
      ?auto_145705 - BLOCK
      ?auto_145706 - BLOCK
      ?auto_145707 - BLOCK
    )
    :vars
    (
      ?auto_145711 - BLOCK
      ?auto_145709 - BLOCK
      ?auto_145708 - BLOCK
      ?auto_145710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145703 ?auto_145704 ) ) ( not ( = ?auto_145703 ?auto_145705 ) ) ( not ( = ?auto_145703 ?auto_145706 ) ) ( not ( = ?auto_145703 ?auto_145707 ) ) ( not ( = ?auto_145704 ?auto_145705 ) ) ( not ( = ?auto_145704 ?auto_145706 ) ) ( not ( = ?auto_145704 ?auto_145707 ) ) ( not ( = ?auto_145705 ?auto_145706 ) ) ( not ( = ?auto_145705 ?auto_145707 ) ) ( not ( = ?auto_145706 ?auto_145707 ) ) ( ON ?auto_145707 ?auto_145711 ) ( not ( = ?auto_145703 ?auto_145711 ) ) ( not ( = ?auto_145704 ?auto_145711 ) ) ( not ( = ?auto_145705 ?auto_145711 ) ) ( not ( = ?auto_145706 ?auto_145711 ) ) ( not ( = ?auto_145707 ?auto_145711 ) ) ( ON ?auto_145706 ?auto_145707 ) ( ON-TABLE ?auto_145709 ) ( ON ?auto_145708 ?auto_145709 ) ( ON ?auto_145711 ?auto_145708 ) ( not ( = ?auto_145709 ?auto_145708 ) ) ( not ( = ?auto_145709 ?auto_145711 ) ) ( not ( = ?auto_145709 ?auto_145707 ) ) ( not ( = ?auto_145709 ?auto_145706 ) ) ( not ( = ?auto_145708 ?auto_145711 ) ) ( not ( = ?auto_145708 ?auto_145707 ) ) ( not ( = ?auto_145708 ?auto_145706 ) ) ( not ( = ?auto_145703 ?auto_145709 ) ) ( not ( = ?auto_145703 ?auto_145708 ) ) ( not ( = ?auto_145704 ?auto_145709 ) ) ( not ( = ?auto_145704 ?auto_145708 ) ) ( not ( = ?auto_145705 ?auto_145709 ) ) ( not ( = ?auto_145705 ?auto_145708 ) ) ( ON ?auto_145703 ?auto_145710 ) ( not ( = ?auto_145703 ?auto_145710 ) ) ( not ( = ?auto_145704 ?auto_145710 ) ) ( not ( = ?auto_145705 ?auto_145710 ) ) ( not ( = ?auto_145706 ?auto_145710 ) ) ( not ( = ?auto_145707 ?auto_145710 ) ) ( not ( = ?auto_145711 ?auto_145710 ) ) ( not ( = ?auto_145709 ?auto_145710 ) ) ( not ( = ?auto_145708 ?auto_145710 ) ) ( ON ?auto_145704 ?auto_145703 ) ( CLEAR ?auto_145704 ) ( ON-TABLE ?auto_145710 ) ( HOLDING ?auto_145705 ) ( CLEAR ?auto_145706 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145709 ?auto_145708 ?auto_145711 ?auto_145707 ?auto_145706 ?auto_145705 )
      ( MAKE-5PILE ?auto_145703 ?auto_145704 ?auto_145705 ?auto_145706 ?auto_145707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145712 - BLOCK
      ?auto_145713 - BLOCK
      ?auto_145714 - BLOCK
      ?auto_145715 - BLOCK
      ?auto_145716 - BLOCK
    )
    :vars
    (
      ?auto_145717 - BLOCK
      ?auto_145719 - BLOCK
      ?auto_145718 - BLOCK
      ?auto_145720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145712 ?auto_145713 ) ) ( not ( = ?auto_145712 ?auto_145714 ) ) ( not ( = ?auto_145712 ?auto_145715 ) ) ( not ( = ?auto_145712 ?auto_145716 ) ) ( not ( = ?auto_145713 ?auto_145714 ) ) ( not ( = ?auto_145713 ?auto_145715 ) ) ( not ( = ?auto_145713 ?auto_145716 ) ) ( not ( = ?auto_145714 ?auto_145715 ) ) ( not ( = ?auto_145714 ?auto_145716 ) ) ( not ( = ?auto_145715 ?auto_145716 ) ) ( ON ?auto_145716 ?auto_145717 ) ( not ( = ?auto_145712 ?auto_145717 ) ) ( not ( = ?auto_145713 ?auto_145717 ) ) ( not ( = ?auto_145714 ?auto_145717 ) ) ( not ( = ?auto_145715 ?auto_145717 ) ) ( not ( = ?auto_145716 ?auto_145717 ) ) ( ON ?auto_145715 ?auto_145716 ) ( ON-TABLE ?auto_145719 ) ( ON ?auto_145718 ?auto_145719 ) ( ON ?auto_145717 ?auto_145718 ) ( not ( = ?auto_145719 ?auto_145718 ) ) ( not ( = ?auto_145719 ?auto_145717 ) ) ( not ( = ?auto_145719 ?auto_145716 ) ) ( not ( = ?auto_145719 ?auto_145715 ) ) ( not ( = ?auto_145718 ?auto_145717 ) ) ( not ( = ?auto_145718 ?auto_145716 ) ) ( not ( = ?auto_145718 ?auto_145715 ) ) ( not ( = ?auto_145712 ?auto_145719 ) ) ( not ( = ?auto_145712 ?auto_145718 ) ) ( not ( = ?auto_145713 ?auto_145719 ) ) ( not ( = ?auto_145713 ?auto_145718 ) ) ( not ( = ?auto_145714 ?auto_145719 ) ) ( not ( = ?auto_145714 ?auto_145718 ) ) ( ON ?auto_145712 ?auto_145720 ) ( not ( = ?auto_145712 ?auto_145720 ) ) ( not ( = ?auto_145713 ?auto_145720 ) ) ( not ( = ?auto_145714 ?auto_145720 ) ) ( not ( = ?auto_145715 ?auto_145720 ) ) ( not ( = ?auto_145716 ?auto_145720 ) ) ( not ( = ?auto_145717 ?auto_145720 ) ) ( not ( = ?auto_145719 ?auto_145720 ) ) ( not ( = ?auto_145718 ?auto_145720 ) ) ( ON ?auto_145713 ?auto_145712 ) ( ON-TABLE ?auto_145720 ) ( CLEAR ?auto_145715 ) ( ON ?auto_145714 ?auto_145713 ) ( CLEAR ?auto_145714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145720 ?auto_145712 ?auto_145713 )
      ( MAKE-5PILE ?auto_145712 ?auto_145713 ?auto_145714 ?auto_145715 ?auto_145716 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145721 - BLOCK
      ?auto_145722 - BLOCK
      ?auto_145723 - BLOCK
      ?auto_145724 - BLOCK
      ?auto_145725 - BLOCK
    )
    :vars
    (
      ?auto_145728 - BLOCK
      ?auto_145727 - BLOCK
      ?auto_145729 - BLOCK
      ?auto_145726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145721 ?auto_145722 ) ) ( not ( = ?auto_145721 ?auto_145723 ) ) ( not ( = ?auto_145721 ?auto_145724 ) ) ( not ( = ?auto_145721 ?auto_145725 ) ) ( not ( = ?auto_145722 ?auto_145723 ) ) ( not ( = ?auto_145722 ?auto_145724 ) ) ( not ( = ?auto_145722 ?auto_145725 ) ) ( not ( = ?auto_145723 ?auto_145724 ) ) ( not ( = ?auto_145723 ?auto_145725 ) ) ( not ( = ?auto_145724 ?auto_145725 ) ) ( ON ?auto_145725 ?auto_145728 ) ( not ( = ?auto_145721 ?auto_145728 ) ) ( not ( = ?auto_145722 ?auto_145728 ) ) ( not ( = ?auto_145723 ?auto_145728 ) ) ( not ( = ?auto_145724 ?auto_145728 ) ) ( not ( = ?auto_145725 ?auto_145728 ) ) ( ON-TABLE ?auto_145727 ) ( ON ?auto_145729 ?auto_145727 ) ( ON ?auto_145728 ?auto_145729 ) ( not ( = ?auto_145727 ?auto_145729 ) ) ( not ( = ?auto_145727 ?auto_145728 ) ) ( not ( = ?auto_145727 ?auto_145725 ) ) ( not ( = ?auto_145727 ?auto_145724 ) ) ( not ( = ?auto_145729 ?auto_145728 ) ) ( not ( = ?auto_145729 ?auto_145725 ) ) ( not ( = ?auto_145729 ?auto_145724 ) ) ( not ( = ?auto_145721 ?auto_145727 ) ) ( not ( = ?auto_145721 ?auto_145729 ) ) ( not ( = ?auto_145722 ?auto_145727 ) ) ( not ( = ?auto_145722 ?auto_145729 ) ) ( not ( = ?auto_145723 ?auto_145727 ) ) ( not ( = ?auto_145723 ?auto_145729 ) ) ( ON ?auto_145721 ?auto_145726 ) ( not ( = ?auto_145721 ?auto_145726 ) ) ( not ( = ?auto_145722 ?auto_145726 ) ) ( not ( = ?auto_145723 ?auto_145726 ) ) ( not ( = ?auto_145724 ?auto_145726 ) ) ( not ( = ?auto_145725 ?auto_145726 ) ) ( not ( = ?auto_145728 ?auto_145726 ) ) ( not ( = ?auto_145727 ?auto_145726 ) ) ( not ( = ?auto_145729 ?auto_145726 ) ) ( ON ?auto_145722 ?auto_145721 ) ( ON-TABLE ?auto_145726 ) ( ON ?auto_145723 ?auto_145722 ) ( CLEAR ?auto_145723 ) ( HOLDING ?auto_145724 ) ( CLEAR ?auto_145725 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145727 ?auto_145729 ?auto_145728 ?auto_145725 ?auto_145724 )
      ( MAKE-5PILE ?auto_145721 ?auto_145722 ?auto_145723 ?auto_145724 ?auto_145725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145730 - BLOCK
      ?auto_145731 - BLOCK
      ?auto_145732 - BLOCK
      ?auto_145733 - BLOCK
      ?auto_145734 - BLOCK
    )
    :vars
    (
      ?auto_145737 - BLOCK
      ?auto_145735 - BLOCK
      ?auto_145736 - BLOCK
      ?auto_145738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145730 ?auto_145731 ) ) ( not ( = ?auto_145730 ?auto_145732 ) ) ( not ( = ?auto_145730 ?auto_145733 ) ) ( not ( = ?auto_145730 ?auto_145734 ) ) ( not ( = ?auto_145731 ?auto_145732 ) ) ( not ( = ?auto_145731 ?auto_145733 ) ) ( not ( = ?auto_145731 ?auto_145734 ) ) ( not ( = ?auto_145732 ?auto_145733 ) ) ( not ( = ?auto_145732 ?auto_145734 ) ) ( not ( = ?auto_145733 ?auto_145734 ) ) ( ON ?auto_145734 ?auto_145737 ) ( not ( = ?auto_145730 ?auto_145737 ) ) ( not ( = ?auto_145731 ?auto_145737 ) ) ( not ( = ?auto_145732 ?auto_145737 ) ) ( not ( = ?auto_145733 ?auto_145737 ) ) ( not ( = ?auto_145734 ?auto_145737 ) ) ( ON-TABLE ?auto_145735 ) ( ON ?auto_145736 ?auto_145735 ) ( ON ?auto_145737 ?auto_145736 ) ( not ( = ?auto_145735 ?auto_145736 ) ) ( not ( = ?auto_145735 ?auto_145737 ) ) ( not ( = ?auto_145735 ?auto_145734 ) ) ( not ( = ?auto_145735 ?auto_145733 ) ) ( not ( = ?auto_145736 ?auto_145737 ) ) ( not ( = ?auto_145736 ?auto_145734 ) ) ( not ( = ?auto_145736 ?auto_145733 ) ) ( not ( = ?auto_145730 ?auto_145735 ) ) ( not ( = ?auto_145730 ?auto_145736 ) ) ( not ( = ?auto_145731 ?auto_145735 ) ) ( not ( = ?auto_145731 ?auto_145736 ) ) ( not ( = ?auto_145732 ?auto_145735 ) ) ( not ( = ?auto_145732 ?auto_145736 ) ) ( ON ?auto_145730 ?auto_145738 ) ( not ( = ?auto_145730 ?auto_145738 ) ) ( not ( = ?auto_145731 ?auto_145738 ) ) ( not ( = ?auto_145732 ?auto_145738 ) ) ( not ( = ?auto_145733 ?auto_145738 ) ) ( not ( = ?auto_145734 ?auto_145738 ) ) ( not ( = ?auto_145737 ?auto_145738 ) ) ( not ( = ?auto_145735 ?auto_145738 ) ) ( not ( = ?auto_145736 ?auto_145738 ) ) ( ON ?auto_145731 ?auto_145730 ) ( ON-TABLE ?auto_145738 ) ( ON ?auto_145732 ?auto_145731 ) ( CLEAR ?auto_145734 ) ( ON ?auto_145733 ?auto_145732 ) ( CLEAR ?auto_145733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145738 ?auto_145730 ?auto_145731 ?auto_145732 )
      ( MAKE-5PILE ?auto_145730 ?auto_145731 ?auto_145732 ?auto_145733 ?auto_145734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145739 - BLOCK
      ?auto_145740 - BLOCK
      ?auto_145741 - BLOCK
      ?auto_145742 - BLOCK
      ?auto_145743 - BLOCK
    )
    :vars
    (
      ?auto_145745 - BLOCK
      ?auto_145746 - BLOCK
      ?auto_145744 - BLOCK
      ?auto_145747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145739 ?auto_145740 ) ) ( not ( = ?auto_145739 ?auto_145741 ) ) ( not ( = ?auto_145739 ?auto_145742 ) ) ( not ( = ?auto_145739 ?auto_145743 ) ) ( not ( = ?auto_145740 ?auto_145741 ) ) ( not ( = ?auto_145740 ?auto_145742 ) ) ( not ( = ?auto_145740 ?auto_145743 ) ) ( not ( = ?auto_145741 ?auto_145742 ) ) ( not ( = ?auto_145741 ?auto_145743 ) ) ( not ( = ?auto_145742 ?auto_145743 ) ) ( not ( = ?auto_145739 ?auto_145745 ) ) ( not ( = ?auto_145740 ?auto_145745 ) ) ( not ( = ?auto_145741 ?auto_145745 ) ) ( not ( = ?auto_145742 ?auto_145745 ) ) ( not ( = ?auto_145743 ?auto_145745 ) ) ( ON-TABLE ?auto_145746 ) ( ON ?auto_145744 ?auto_145746 ) ( ON ?auto_145745 ?auto_145744 ) ( not ( = ?auto_145746 ?auto_145744 ) ) ( not ( = ?auto_145746 ?auto_145745 ) ) ( not ( = ?auto_145746 ?auto_145743 ) ) ( not ( = ?auto_145746 ?auto_145742 ) ) ( not ( = ?auto_145744 ?auto_145745 ) ) ( not ( = ?auto_145744 ?auto_145743 ) ) ( not ( = ?auto_145744 ?auto_145742 ) ) ( not ( = ?auto_145739 ?auto_145746 ) ) ( not ( = ?auto_145739 ?auto_145744 ) ) ( not ( = ?auto_145740 ?auto_145746 ) ) ( not ( = ?auto_145740 ?auto_145744 ) ) ( not ( = ?auto_145741 ?auto_145746 ) ) ( not ( = ?auto_145741 ?auto_145744 ) ) ( ON ?auto_145739 ?auto_145747 ) ( not ( = ?auto_145739 ?auto_145747 ) ) ( not ( = ?auto_145740 ?auto_145747 ) ) ( not ( = ?auto_145741 ?auto_145747 ) ) ( not ( = ?auto_145742 ?auto_145747 ) ) ( not ( = ?auto_145743 ?auto_145747 ) ) ( not ( = ?auto_145745 ?auto_145747 ) ) ( not ( = ?auto_145746 ?auto_145747 ) ) ( not ( = ?auto_145744 ?auto_145747 ) ) ( ON ?auto_145740 ?auto_145739 ) ( ON-TABLE ?auto_145747 ) ( ON ?auto_145741 ?auto_145740 ) ( ON ?auto_145742 ?auto_145741 ) ( CLEAR ?auto_145742 ) ( HOLDING ?auto_145743 ) ( CLEAR ?auto_145745 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145746 ?auto_145744 ?auto_145745 ?auto_145743 )
      ( MAKE-5PILE ?auto_145739 ?auto_145740 ?auto_145741 ?auto_145742 ?auto_145743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145748 - BLOCK
      ?auto_145749 - BLOCK
      ?auto_145750 - BLOCK
      ?auto_145751 - BLOCK
      ?auto_145752 - BLOCK
    )
    :vars
    (
      ?auto_145755 - BLOCK
      ?auto_145753 - BLOCK
      ?auto_145754 - BLOCK
      ?auto_145756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145748 ?auto_145749 ) ) ( not ( = ?auto_145748 ?auto_145750 ) ) ( not ( = ?auto_145748 ?auto_145751 ) ) ( not ( = ?auto_145748 ?auto_145752 ) ) ( not ( = ?auto_145749 ?auto_145750 ) ) ( not ( = ?auto_145749 ?auto_145751 ) ) ( not ( = ?auto_145749 ?auto_145752 ) ) ( not ( = ?auto_145750 ?auto_145751 ) ) ( not ( = ?auto_145750 ?auto_145752 ) ) ( not ( = ?auto_145751 ?auto_145752 ) ) ( not ( = ?auto_145748 ?auto_145755 ) ) ( not ( = ?auto_145749 ?auto_145755 ) ) ( not ( = ?auto_145750 ?auto_145755 ) ) ( not ( = ?auto_145751 ?auto_145755 ) ) ( not ( = ?auto_145752 ?auto_145755 ) ) ( ON-TABLE ?auto_145753 ) ( ON ?auto_145754 ?auto_145753 ) ( ON ?auto_145755 ?auto_145754 ) ( not ( = ?auto_145753 ?auto_145754 ) ) ( not ( = ?auto_145753 ?auto_145755 ) ) ( not ( = ?auto_145753 ?auto_145752 ) ) ( not ( = ?auto_145753 ?auto_145751 ) ) ( not ( = ?auto_145754 ?auto_145755 ) ) ( not ( = ?auto_145754 ?auto_145752 ) ) ( not ( = ?auto_145754 ?auto_145751 ) ) ( not ( = ?auto_145748 ?auto_145753 ) ) ( not ( = ?auto_145748 ?auto_145754 ) ) ( not ( = ?auto_145749 ?auto_145753 ) ) ( not ( = ?auto_145749 ?auto_145754 ) ) ( not ( = ?auto_145750 ?auto_145753 ) ) ( not ( = ?auto_145750 ?auto_145754 ) ) ( ON ?auto_145748 ?auto_145756 ) ( not ( = ?auto_145748 ?auto_145756 ) ) ( not ( = ?auto_145749 ?auto_145756 ) ) ( not ( = ?auto_145750 ?auto_145756 ) ) ( not ( = ?auto_145751 ?auto_145756 ) ) ( not ( = ?auto_145752 ?auto_145756 ) ) ( not ( = ?auto_145755 ?auto_145756 ) ) ( not ( = ?auto_145753 ?auto_145756 ) ) ( not ( = ?auto_145754 ?auto_145756 ) ) ( ON ?auto_145749 ?auto_145748 ) ( ON-TABLE ?auto_145756 ) ( ON ?auto_145750 ?auto_145749 ) ( ON ?auto_145751 ?auto_145750 ) ( CLEAR ?auto_145755 ) ( ON ?auto_145752 ?auto_145751 ) ( CLEAR ?auto_145752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145756 ?auto_145748 ?auto_145749 ?auto_145750 ?auto_145751 )
      ( MAKE-5PILE ?auto_145748 ?auto_145749 ?auto_145750 ?auto_145751 ?auto_145752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145757 - BLOCK
      ?auto_145758 - BLOCK
      ?auto_145759 - BLOCK
      ?auto_145760 - BLOCK
      ?auto_145761 - BLOCK
    )
    :vars
    (
      ?auto_145764 - BLOCK
      ?auto_145762 - BLOCK
      ?auto_145765 - BLOCK
      ?auto_145763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145757 ?auto_145758 ) ) ( not ( = ?auto_145757 ?auto_145759 ) ) ( not ( = ?auto_145757 ?auto_145760 ) ) ( not ( = ?auto_145757 ?auto_145761 ) ) ( not ( = ?auto_145758 ?auto_145759 ) ) ( not ( = ?auto_145758 ?auto_145760 ) ) ( not ( = ?auto_145758 ?auto_145761 ) ) ( not ( = ?auto_145759 ?auto_145760 ) ) ( not ( = ?auto_145759 ?auto_145761 ) ) ( not ( = ?auto_145760 ?auto_145761 ) ) ( not ( = ?auto_145757 ?auto_145764 ) ) ( not ( = ?auto_145758 ?auto_145764 ) ) ( not ( = ?auto_145759 ?auto_145764 ) ) ( not ( = ?auto_145760 ?auto_145764 ) ) ( not ( = ?auto_145761 ?auto_145764 ) ) ( ON-TABLE ?auto_145762 ) ( ON ?auto_145765 ?auto_145762 ) ( not ( = ?auto_145762 ?auto_145765 ) ) ( not ( = ?auto_145762 ?auto_145764 ) ) ( not ( = ?auto_145762 ?auto_145761 ) ) ( not ( = ?auto_145762 ?auto_145760 ) ) ( not ( = ?auto_145765 ?auto_145764 ) ) ( not ( = ?auto_145765 ?auto_145761 ) ) ( not ( = ?auto_145765 ?auto_145760 ) ) ( not ( = ?auto_145757 ?auto_145762 ) ) ( not ( = ?auto_145757 ?auto_145765 ) ) ( not ( = ?auto_145758 ?auto_145762 ) ) ( not ( = ?auto_145758 ?auto_145765 ) ) ( not ( = ?auto_145759 ?auto_145762 ) ) ( not ( = ?auto_145759 ?auto_145765 ) ) ( ON ?auto_145757 ?auto_145763 ) ( not ( = ?auto_145757 ?auto_145763 ) ) ( not ( = ?auto_145758 ?auto_145763 ) ) ( not ( = ?auto_145759 ?auto_145763 ) ) ( not ( = ?auto_145760 ?auto_145763 ) ) ( not ( = ?auto_145761 ?auto_145763 ) ) ( not ( = ?auto_145764 ?auto_145763 ) ) ( not ( = ?auto_145762 ?auto_145763 ) ) ( not ( = ?auto_145765 ?auto_145763 ) ) ( ON ?auto_145758 ?auto_145757 ) ( ON-TABLE ?auto_145763 ) ( ON ?auto_145759 ?auto_145758 ) ( ON ?auto_145760 ?auto_145759 ) ( ON ?auto_145761 ?auto_145760 ) ( CLEAR ?auto_145761 ) ( HOLDING ?auto_145764 ) ( CLEAR ?auto_145765 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145762 ?auto_145765 ?auto_145764 )
      ( MAKE-5PILE ?auto_145757 ?auto_145758 ?auto_145759 ?auto_145760 ?auto_145761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145766 - BLOCK
      ?auto_145767 - BLOCK
      ?auto_145768 - BLOCK
      ?auto_145769 - BLOCK
      ?auto_145770 - BLOCK
    )
    :vars
    (
      ?auto_145774 - BLOCK
      ?auto_145771 - BLOCK
      ?auto_145772 - BLOCK
      ?auto_145773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145766 ?auto_145767 ) ) ( not ( = ?auto_145766 ?auto_145768 ) ) ( not ( = ?auto_145766 ?auto_145769 ) ) ( not ( = ?auto_145766 ?auto_145770 ) ) ( not ( = ?auto_145767 ?auto_145768 ) ) ( not ( = ?auto_145767 ?auto_145769 ) ) ( not ( = ?auto_145767 ?auto_145770 ) ) ( not ( = ?auto_145768 ?auto_145769 ) ) ( not ( = ?auto_145768 ?auto_145770 ) ) ( not ( = ?auto_145769 ?auto_145770 ) ) ( not ( = ?auto_145766 ?auto_145774 ) ) ( not ( = ?auto_145767 ?auto_145774 ) ) ( not ( = ?auto_145768 ?auto_145774 ) ) ( not ( = ?auto_145769 ?auto_145774 ) ) ( not ( = ?auto_145770 ?auto_145774 ) ) ( ON-TABLE ?auto_145771 ) ( ON ?auto_145772 ?auto_145771 ) ( not ( = ?auto_145771 ?auto_145772 ) ) ( not ( = ?auto_145771 ?auto_145774 ) ) ( not ( = ?auto_145771 ?auto_145770 ) ) ( not ( = ?auto_145771 ?auto_145769 ) ) ( not ( = ?auto_145772 ?auto_145774 ) ) ( not ( = ?auto_145772 ?auto_145770 ) ) ( not ( = ?auto_145772 ?auto_145769 ) ) ( not ( = ?auto_145766 ?auto_145771 ) ) ( not ( = ?auto_145766 ?auto_145772 ) ) ( not ( = ?auto_145767 ?auto_145771 ) ) ( not ( = ?auto_145767 ?auto_145772 ) ) ( not ( = ?auto_145768 ?auto_145771 ) ) ( not ( = ?auto_145768 ?auto_145772 ) ) ( ON ?auto_145766 ?auto_145773 ) ( not ( = ?auto_145766 ?auto_145773 ) ) ( not ( = ?auto_145767 ?auto_145773 ) ) ( not ( = ?auto_145768 ?auto_145773 ) ) ( not ( = ?auto_145769 ?auto_145773 ) ) ( not ( = ?auto_145770 ?auto_145773 ) ) ( not ( = ?auto_145774 ?auto_145773 ) ) ( not ( = ?auto_145771 ?auto_145773 ) ) ( not ( = ?auto_145772 ?auto_145773 ) ) ( ON ?auto_145767 ?auto_145766 ) ( ON-TABLE ?auto_145773 ) ( ON ?auto_145768 ?auto_145767 ) ( ON ?auto_145769 ?auto_145768 ) ( ON ?auto_145770 ?auto_145769 ) ( CLEAR ?auto_145772 ) ( ON ?auto_145774 ?auto_145770 ) ( CLEAR ?auto_145774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145773 ?auto_145766 ?auto_145767 ?auto_145768 ?auto_145769 ?auto_145770 )
      ( MAKE-5PILE ?auto_145766 ?auto_145767 ?auto_145768 ?auto_145769 ?auto_145770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145775 - BLOCK
      ?auto_145776 - BLOCK
      ?auto_145777 - BLOCK
      ?auto_145778 - BLOCK
      ?auto_145779 - BLOCK
    )
    :vars
    (
      ?auto_145782 - BLOCK
      ?auto_145781 - BLOCK
      ?auto_145783 - BLOCK
      ?auto_145780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145775 ?auto_145776 ) ) ( not ( = ?auto_145775 ?auto_145777 ) ) ( not ( = ?auto_145775 ?auto_145778 ) ) ( not ( = ?auto_145775 ?auto_145779 ) ) ( not ( = ?auto_145776 ?auto_145777 ) ) ( not ( = ?auto_145776 ?auto_145778 ) ) ( not ( = ?auto_145776 ?auto_145779 ) ) ( not ( = ?auto_145777 ?auto_145778 ) ) ( not ( = ?auto_145777 ?auto_145779 ) ) ( not ( = ?auto_145778 ?auto_145779 ) ) ( not ( = ?auto_145775 ?auto_145782 ) ) ( not ( = ?auto_145776 ?auto_145782 ) ) ( not ( = ?auto_145777 ?auto_145782 ) ) ( not ( = ?auto_145778 ?auto_145782 ) ) ( not ( = ?auto_145779 ?auto_145782 ) ) ( ON-TABLE ?auto_145781 ) ( not ( = ?auto_145781 ?auto_145783 ) ) ( not ( = ?auto_145781 ?auto_145782 ) ) ( not ( = ?auto_145781 ?auto_145779 ) ) ( not ( = ?auto_145781 ?auto_145778 ) ) ( not ( = ?auto_145783 ?auto_145782 ) ) ( not ( = ?auto_145783 ?auto_145779 ) ) ( not ( = ?auto_145783 ?auto_145778 ) ) ( not ( = ?auto_145775 ?auto_145781 ) ) ( not ( = ?auto_145775 ?auto_145783 ) ) ( not ( = ?auto_145776 ?auto_145781 ) ) ( not ( = ?auto_145776 ?auto_145783 ) ) ( not ( = ?auto_145777 ?auto_145781 ) ) ( not ( = ?auto_145777 ?auto_145783 ) ) ( ON ?auto_145775 ?auto_145780 ) ( not ( = ?auto_145775 ?auto_145780 ) ) ( not ( = ?auto_145776 ?auto_145780 ) ) ( not ( = ?auto_145777 ?auto_145780 ) ) ( not ( = ?auto_145778 ?auto_145780 ) ) ( not ( = ?auto_145779 ?auto_145780 ) ) ( not ( = ?auto_145782 ?auto_145780 ) ) ( not ( = ?auto_145781 ?auto_145780 ) ) ( not ( = ?auto_145783 ?auto_145780 ) ) ( ON ?auto_145776 ?auto_145775 ) ( ON-TABLE ?auto_145780 ) ( ON ?auto_145777 ?auto_145776 ) ( ON ?auto_145778 ?auto_145777 ) ( ON ?auto_145779 ?auto_145778 ) ( ON ?auto_145782 ?auto_145779 ) ( CLEAR ?auto_145782 ) ( HOLDING ?auto_145783 ) ( CLEAR ?auto_145781 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145781 ?auto_145783 )
      ( MAKE-5PILE ?auto_145775 ?auto_145776 ?auto_145777 ?auto_145778 ?auto_145779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145784 - BLOCK
      ?auto_145785 - BLOCK
      ?auto_145786 - BLOCK
      ?auto_145787 - BLOCK
      ?auto_145788 - BLOCK
    )
    :vars
    (
      ?auto_145789 - BLOCK
      ?auto_145792 - BLOCK
      ?auto_145790 - BLOCK
      ?auto_145791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145784 ?auto_145785 ) ) ( not ( = ?auto_145784 ?auto_145786 ) ) ( not ( = ?auto_145784 ?auto_145787 ) ) ( not ( = ?auto_145784 ?auto_145788 ) ) ( not ( = ?auto_145785 ?auto_145786 ) ) ( not ( = ?auto_145785 ?auto_145787 ) ) ( not ( = ?auto_145785 ?auto_145788 ) ) ( not ( = ?auto_145786 ?auto_145787 ) ) ( not ( = ?auto_145786 ?auto_145788 ) ) ( not ( = ?auto_145787 ?auto_145788 ) ) ( not ( = ?auto_145784 ?auto_145789 ) ) ( not ( = ?auto_145785 ?auto_145789 ) ) ( not ( = ?auto_145786 ?auto_145789 ) ) ( not ( = ?auto_145787 ?auto_145789 ) ) ( not ( = ?auto_145788 ?auto_145789 ) ) ( ON-TABLE ?auto_145792 ) ( not ( = ?auto_145792 ?auto_145790 ) ) ( not ( = ?auto_145792 ?auto_145789 ) ) ( not ( = ?auto_145792 ?auto_145788 ) ) ( not ( = ?auto_145792 ?auto_145787 ) ) ( not ( = ?auto_145790 ?auto_145789 ) ) ( not ( = ?auto_145790 ?auto_145788 ) ) ( not ( = ?auto_145790 ?auto_145787 ) ) ( not ( = ?auto_145784 ?auto_145792 ) ) ( not ( = ?auto_145784 ?auto_145790 ) ) ( not ( = ?auto_145785 ?auto_145792 ) ) ( not ( = ?auto_145785 ?auto_145790 ) ) ( not ( = ?auto_145786 ?auto_145792 ) ) ( not ( = ?auto_145786 ?auto_145790 ) ) ( ON ?auto_145784 ?auto_145791 ) ( not ( = ?auto_145784 ?auto_145791 ) ) ( not ( = ?auto_145785 ?auto_145791 ) ) ( not ( = ?auto_145786 ?auto_145791 ) ) ( not ( = ?auto_145787 ?auto_145791 ) ) ( not ( = ?auto_145788 ?auto_145791 ) ) ( not ( = ?auto_145789 ?auto_145791 ) ) ( not ( = ?auto_145792 ?auto_145791 ) ) ( not ( = ?auto_145790 ?auto_145791 ) ) ( ON ?auto_145785 ?auto_145784 ) ( ON-TABLE ?auto_145791 ) ( ON ?auto_145786 ?auto_145785 ) ( ON ?auto_145787 ?auto_145786 ) ( ON ?auto_145788 ?auto_145787 ) ( ON ?auto_145789 ?auto_145788 ) ( CLEAR ?auto_145792 ) ( ON ?auto_145790 ?auto_145789 ) ( CLEAR ?auto_145790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145791 ?auto_145784 ?auto_145785 ?auto_145786 ?auto_145787 ?auto_145788 ?auto_145789 )
      ( MAKE-5PILE ?auto_145784 ?auto_145785 ?auto_145786 ?auto_145787 ?auto_145788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145793 - BLOCK
      ?auto_145794 - BLOCK
      ?auto_145795 - BLOCK
      ?auto_145796 - BLOCK
      ?auto_145797 - BLOCK
    )
    :vars
    (
      ?auto_145801 - BLOCK
      ?auto_145800 - BLOCK
      ?auto_145799 - BLOCK
      ?auto_145798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145793 ?auto_145794 ) ) ( not ( = ?auto_145793 ?auto_145795 ) ) ( not ( = ?auto_145793 ?auto_145796 ) ) ( not ( = ?auto_145793 ?auto_145797 ) ) ( not ( = ?auto_145794 ?auto_145795 ) ) ( not ( = ?auto_145794 ?auto_145796 ) ) ( not ( = ?auto_145794 ?auto_145797 ) ) ( not ( = ?auto_145795 ?auto_145796 ) ) ( not ( = ?auto_145795 ?auto_145797 ) ) ( not ( = ?auto_145796 ?auto_145797 ) ) ( not ( = ?auto_145793 ?auto_145801 ) ) ( not ( = ?auto_145794 ?auto_145801 ) ) ( not ( = ?auto_145795 ?auto_145801 ) ) ( not ( = ?auto_145796 ?auto_145801 ) ) ( not ( = ?auto_145797 ?auto_145801 ) ) ( not ( = ?auto_145800 ?auto_145799 ) ) ( not ( = ?auto_145800 ?auto_145801 ) ) ( not ( = ?auto_145800 ?auto_145797 ) ) ( not ( = ?auto_145800 ?auto_145796 ) ) ( not ( = ?auto_145799 ?auto_145801 ) ) ( not ( = ?auto_145799 ?auto_145797 ) ) ( not ( = ?auto_145799 ?auto_145796 ) ) ( not ( = ?auto_145793 ?auto_145800 ) ) ( not ( = ?auto_145793 ?auto_145799 ) ) ( not ( = ?auto_145794 ?auto_145800 ) ) ( not ( = ?auto_145794 ?auto_145799 ) ) ( not ( = ?auto_145795 ?auto_145800 ) ) ( not ( = ?auto_145795 ?auto_145799 ) ) ( ON ?auto_145793 ?auto_145798 ) ( not ( = ?auto_145793 ?auto_145798 ) ) ( not ( = ?auto_145794 ?auto_145798 ) ) ( not ( = ?auto_145795 ?auto_145798 ) ) ( not ( = ?auto_145796 ?auto_145798 ) ) ( not ( = ?auto_145797 ?auto_145798 ) ) ( not ( = ?auto_145801 ?auto_145798 ) ) ( not ( = ?auto_145800 ?auto_145798 ) ) ( not ( = ?auto_145799 ?auto_145798 ) ) ( ON ?auto_145794 ?auto_145793 ) ( ON-TABLE ?auto_145798 ) ( ON ?auto_145795 ?auto_145794 ) ( ON ?auto_145796 ?auto_145795 ) ( ON ?auto_145797 ?auto_145796 ) ( ON ?auto_145801 ?auto_145797 ) ( ON ?auto_145799 ?auto_145801 ) ( CLEAR ?auto_145799 ) ( HOLDING ?auto_145800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145800 )
      ( MAKE-5PILE ?auto_145793 ?auto_145794 ?auto_145795 ?auto_145796 ?auto_145797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145802 - BLOCK
      ?auto_145803 - BLOCK
      ?auto_145804 - BLOCK
      ?auto_145805 - BLOCK
      ?auto_145806 - BLOCK
    )
    :vars
    (
      ?auto_145810 - BLOCK
      ?auto_145809 - BLOCK
      ?auto_145808 - BLOCK
      ?auto_145807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145802 ?auto_145803 ) ) ( not ( = ?auto_145802 ?auto_145804 ) ) ( not ( = ?auto_145802 ?auto_145805 ) ) ( not ( = ?auto_145802 ?auto_145806 ) ) ( not ( = ?auto_145803 ?auto_145804 ) ) ( not ( = ?auto_145803 ?auto_145805 ) ) ( not ( = ?auto_145803 ?auto_145806 ) ) ( not ( = ?auto_145804 ?auto_145805 ) ) ( not ( = ?auto_145804 ?auto_145806 ) ) ( not ( = ?auto_145805 ?auto_145806 ) ) ( not ( = ?auto_145802 ?auto_145810 ) ) ( not ( = ?auto_145803 ?auto_145810 ) ) ( not ( = ?auto_145804 ?auto_145810 ) ) ( not ( = ?auto_145805 ?auto_145810 ) ) ( not ( = ?auto_145806 ?auto_145810 ) ) ( not ( = ?auto_145809 ?auto_145808 ) ) ( not ( = ?auto_145809 ?auto_145810 ) ) ( not ( = ?auto_145809 ?auto_145806 ) ) ( not ( = ?auto_145809 ?auto_145805 ) ) ( not ( = ?auto_145808 ?auto_145810 ) ) ( not ( = ?auto_145808 ?auto_145806 ) ) ( not ( = ?auto_145808 ?auto_145805 ) ) ( not ( = ?auto_145802 ?auto_145809 ) ) ( not ( = ?auto_145802 ?auto_145808 ) ) ( not ( = ?auto_145803 ?auto_145809 ) ) ( not ( = ?auto_145803 ?auto_145808 ) ) ( not ( = ?auto_145804 ?auto_145809 ) ) ( not ( = ?auto_145804 ?auto_145808 ) ) ( ON ?auto_145802 ?auto_145807 ) ( not ( = ?auto_145802 ?auto_145807 ) ) ( not ( = ?auto_145803 ?auto_145807 ) ) ( not ( = ?auto_145804 ?auto_145807 ) ) ( not ( = ?auto_145805 ?auto_145807 ) ) ( not ( = ?auto_145806 ?auto_145807 ) ) ( not ( = ?auto_145810 ?auto_145807 ) ) ( not ( = ?auto_145809 ?auto_145807 ) ) ( not ( = ?auto_145808 ?auto_145807 ) ) ( ON ?auto_145803 ?auto_145802 ) ( ON-TABLE ?auto_145807 ) ( ON ?auto_145804 ?auto_145803 ) ( ON ?auto_145805 ?auto_145804 ) ( ON ?auto_145806 ?auto_145805 ) ( ON ?auto_145810 ?auto_145806 ) ( ON ?auto_145808 ?auto_145810 ) ( ON ?auto_145809 ?auto_145808 ) ( CLEAR ?auto_145809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145807 ?auto_145802 ?auto_145803 ?auto_145804 ?auto_145805 ?auto_145806 ?auto_145810 ?auto_145808 )
      ( MAKE-5PILE ?auto_145802 ?auto_145803 ?auto_145804 ?auto_145805 ?auto_145806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145826 - BLOCK
      ?auto_145827 - BLOCK
    )
    :vars
    (
      ?auto_145830 - BLOCK
      ?auto_145828 - BLOCK
      ?auto_145829 - BLOCK
      ?auto_145831 - BLOCK
      ?auto_145832 - BLOCK
      ?auto_145833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145830 ?auto_145827 ) ( ON-TABLE ?auto_145826 ) ( ON ?auto_145827 ?auto_145826 ) ( not ( = ?auto_145826 ?auto_145827 ) ) ( not ( = ?auto_145826 ?auto_145830 ) ) ( not ( = ?auto_145827 ?auto_145830 ) ) ( not ( = ?auto_145826 ?auto_145828 ) ) ( not ( = ?auto_145826 ?auto_145829 ) ) ( not ( = ?auto_145827 ?auto_145828 ) ) ( not ( = ?auto_145827 ?auto_145829 ) ) ( not ( = ?auto_145830 ?auto_145828 ) ) ( not ( = ?auto_145830 ?auto_145829 ) ) ( not ( = ?auto_145828 ?auto_145829 ) ) ( ON ?auto_145828 ?auto_145830 ) ( CLEAR ?auto_145828 ) ( HOLDING ?auto_145829 ) ( CLEAR ?auto_145831 ) ( ON-TABLE ?auto_145832 ) ( ON ?auto_145833 ?auto_145832 ) ( ON ?auto_145831 ?auto_145833 ) ( not ( = ?auto_145832 ?auto_145833 ) ) ( not ( = ?auto_145832 ?auto_145831 ) ) ( not ( = ?auto_145832 ?auto_145829 ) ) ( not ( = ?auto_145833 ?auto_145831 ) ) ( not ( = ?auto_145833 ?auto_145829 ) ) ( not ( = ?auto_145831 ?auto_145829 ) ) ( not ( = ?auto_145826 ?auto_145831 ) ) ( not ( = ?auto_145826 ?auto_145832 ) ) ( not ( = ?auto_145826 ?auto_145833 ) ) ( not ( = ?auto_145827 ?auto_145831 ) ) ( not ( = ?auto_145827 ?auto_145832 ) ) ( not ( = ?auto_145827 ?auto_145833 ) ) ( not ( = ?auto_145830 ?auto_145831 ) ) ( not ( = ?auto_145830 ?auto_145832 ) ) ( not ( = ?auto_145830 ?auto_145833 ) ) ( not ( = ?auto_145828 ?auto_145831 ) ) ( not ( = ?auto_145828 ?auto_145832 ) ) ( not ( = ?auto_145828 ?auto_145833 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145832 ?auto_145833 ?auto_145831 ?auto_145829 )
      ( MAKE-2PILE ?auto_145826 ?auto_145827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145834 - BLOCK
      ?auto_145835 - BLOCK
    )
    :vars
    (
      ?auto_145840 - BLOCK
      ?auto_145841 - BLOCK
      ?auto_145839 - BLOCK
      ?auto_145838 - BLOCK
      ?auto_145837 - BLOCK
      ?auto_145836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145840 ?auto_145835 ) ( ON-TABLE ?auto_145834 ) ( ON ?auto_145835 ?auto_145834 ) ( not ( = ?auto_145834 ?auto_145835 ) ) ( not ( = ?auto_145834 ?auto_145840 ) ) ( not ( = ?auto_145835 ?auto_145840 ) ) ( not ( = ?auto_145834 ?auto_145841 ) ) ( not ( = ?auto_145834 ?auto_145839 ) ) ( not ( = ?auto_145835 ?auto_145841 ) ) ( not ( = ?auto_145835 ?auto_145839 ) ) ( not ( = ?auto_145840 ?auto_145841 ) ) ( not ( = ?auto_145840 ?auto_145839 ) ) ( not ( = ?auto_145841 ?auto_145839 ) ) ( ON ?auto_145841 ?auto_145840 ) ( CLEAR ?auto_145838 ) ( ON-TABLE ?auto_145837 ) ( ON ?auto_145836 ?auto_145837 ) ( ON ?auto_145838 ?auto_145836 ) ( not ( = ?auto_145837 ?auto_145836 ) ) ( not ( = ?auto_145837 ?auto_145838 ) ) ( not ( = ?auto_145837 ?auto_145839 ) ) ( not ( = ?auto_145836 ?auto_145838 ) ) ( not ( = ?auto_145836 ?auto_145839 ) ) ( not ( = ?auto_145838 ?auto_145839 ) ) ( not ( = ?auto_145834 ?auto_145838 ) ) ( not ( = ?auto_145834 ?auto_145837 ) ) ( not ( = ?auto_145834 ?auto_145836 ) ) ( not ( = ?auto_145835 ?auto_145838 ) ) ( not ( = ?auto_145835 ?auto_145837 ) ) ( not ( = ?auto_145835 ?auto_145836 ) ) ( not ( = ?auto_145840 ?auto_145838 ) ) ( not ( = ?auto_145840 ?auto_145837 ) ) ( not ( = ?auto_145840 ?auto_145836 ) ) ( not ( = ?auto_145841 ?auto_145838 ) ) ( not ( = ?auto_145841 ?auto_145837 ) ) ( not ( = ?auto_145841 ?auto_145836 ) ) ( ON ?auto_145839 ?auto_145841 ) ( CLEAR ?auto_145839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145834 ?auto_145835 ?auto_145840 ?auto_145841 )
      ( MAKE-2PILE ?auto_145834 ?auto_145835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145842 - BLOCK
      ?auto_145843 - BLOCK
    )
    :vars
    (
      ?auto_145848 - BLOCK
      ?auto_145844 - BLOCK
      ?auto_145846 - BLOCK
      ?auto_145847 - BLOCK
      ?auto_145845 - BLOCK
      ?auto_145849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145848 ?auto_145843 ) ( ON-TABLE ?auto_145842 ) ( ON ?auto_145843 ?auto_145842 ) ( not ( = ?auto_145842 ?auto_145843 ) ) ( not ( = ?auto_145842 ?auto_145848 ) ) ( not ( = ?auto_145843 ?auto_145848 ) ) ( not ( = ?auto_145842 ?auto_145844 ) ) ( not ( = ?auto_145842 ?auto_145846 ) ) ( not ( = ?auto_145843 ?auto_145844 ) ) ( not ( = ?auto_145843 ?auto_145846 ) ) ( not ( = ?auto_145848 ?auto_145844 ) ) ( not ( = ?auto_145848 ?auto_145846 ) ) ( not ( = ?auto_145844 ?auto_145846 ) ) ( ON ?auto_145844 ?auto_145848 ) ( ON-TABLE ?auto_145847 ) ( ON ?auto_145845 ?auto_145847 ) ( not ( = ?auto_145847 ?auto_145845 ) ) ( not ( = ?auto_145847 ?auto_145849 ) ) ( not ( = ?auto_145847 ?auto_145846 ) ) ( not ( = ?auto_145845 ?auto_145849 ) ) ( not ( = ?auto_145845 ?auto_145846 ) ) ( not ( = ?auto_145849 ?auto_145846 ) ) ( not ( = ?auto_145842 ?auto_145849 ) ) ( not ( = ?auto_145842 ?auto_145847 ) ) ( not ( = ?auto_145842 ?auto_145845 ) ) ( not ( = ?auto_145843 ?auto_145849 ) ) ( not ( = ?auto_145843 ?auto_145847 ) ) ( not ( = ?auto_145843 ?auto_145845 ) ) ( not ( = ?auto_145848 ?auto_145849 ) ) ( not ( = ?auto_145848 ?auto_145847 ) ) ( not ( = ?auto_145848 ?auto_145845 ) ) ( not ( = ?auto_145844 ?auto_145849 ) ) ( not ( = ?auto_145844 ?auto_145847 ) ) ( not ( = ?auto_145844 ?auto_145845 ) ) ( ON ?auto_145846 ?auto_145844 ) ( CLEAR ?auto_145846 ) ( HOLDING ?auto_145849 ) ( CLEAR ?auto_145845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145847 ?auto_145845 ?auto_145849 )
      ( MAKE-2PILE ?auto_145842 ?auto_145843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145850 - BLOCK
      ?auto_145851 - BLOCK
    )
    :vars
    (
      ?auto_145853 - BLOCK
      ?auto_145855 - BLOCK
      ?auto_145856 - BLOCK
      ?auto_145857 - BLOCK
      ?auto_145854 - BLOCK
      ?auto_145852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145853 ?auto_145851 ) ( ON-TABLE ?auto_145850 ) ( ON ?auto_145851 ?auto_145850 ) ( not ( = ?auto_145850 ?auto_145851 ) ) ( not ( = ?auto_145850 ?auto_145853 ) ) ( not ( = ?auto_145851 ?auto_145853 ) ) ( not ( = ?auto_145850 ?auto_145855 ) ) ( not ( = ?auto_145850 ?auto_145856 ) ) ( not ( = ?auto_145851 ?auto_145855 ) ) ( not ( = ?auto_145851 ?auto_145856 ) ) ( not ( = ?auto_145853 ?auto_145855 ) ) ( not ( = ?auto_145853 ?auto_145856 ) ) ( not ( = ?auto_145855 ?auto_145856 ) ) ( ON ?auto_145855 ?auto_145853 ) ( ON-TABLE ?auto_145857 ) ( ON ?auto_145854 ?auto_145857 ) ( not ( = ?auto_145857 ?auto_145854 ) ) ( not ( = ?auto_145857 ?auto_145852 ) ) ( not ( = ?auto_145857 ?auto_145856 ) ) ( not ( = ?auto_145854 ?auto_145852 ) ) ( not ( = ?auto_145854 ?auto_145856 ) ) ( not ( = ?auto_145852 ?auto_145856 ) ) ( not ( = ?auto_145850 ?auto_145852 ) ) ( not ( = ?auto_145850 ?auto_145857 ) ) ( not ( = ?auto_145850 ?auto_145854 ) ) ( not ( = ?auto_145851 ?auto_145852 ) ) ( not ( = ?auto_145851 ?auto_145857 ) ) ( not ( = ?auto_145851 ?auto_145854 ) ) ( not ( = ?auto_145853 ?auto_145852 ) ) ( not ( = ?auto_145853 ?auto_145857 ) ) ( not ( = ?auto_145853 ?auto_145854 ) ) ( not ( = ?auto_145855 ?auto_145852 ) ) ( not ( = ?auto_145855 ?auto_145857 ) ) ( not ( = ?auto_145855 ?auto_145854 ) ) ( ON ?auto_145856 ?auto_145855 ) ( CLEAR ?auto_145854 ) ( ON ?auto_145852 ?auto_145856 ) ( CLEAR ?auto_145852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145850 ?auto_145851 ?auto_145853 ?auto_145855 ?auto_145856 )
      ( MAKE-2PILE ?auto_145850 ?auto_145851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145858 - BLOCK
      ?auto_145859 - BLOCK
    )
    :vars
    (
      ?auto_145862 - BLOCK
      ?auto_145860 - BLOCK
      ?auto_145864 - BLOCK
      ?auto_145865 - BLOCK
      ?auto_145863 - BLOCK
      ?auto_145861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145862 ?auto_145859 ) ( ON-TABLE ?auto_145858 ) ( ON ?auto_145859 ?auto_145858 ) ( not ( = ?auto_145858 ?auto_145859 ) ) ( not ( = ?auto_145858 ?auto_145862 ) ) ( not ( = ?auto_145859 ?auto_145862 ) ) ( not ( = ?auto_145858 ?auto_145860 ) ) ( not ( = ?auto_145858 ?auto_145864 ) ) ( not ( = ?auto_145859 ?auto_145860 ) ) ( not ( = ?auto_145859 ?auto_145864 ) ) ( not ( = ?auto_145862 ?auto_145860 ) ) ( not ( = ?auto_145862 ?auto_145864 ) ) ( not ( = ?auto_145860 ?auto_145864 ) ) ( ON ?auto_145860 ?auto_145862 ) ( ON-TABLE ?auto_145865 ) ( not ( = ?auto_145865 ?auto_145863 ) ) ( not ( = ?auto_145865 ?auto_145861 ) ) ( not ( = ?auto_145865 ?auto_145864 ) ) ( not ( = ?auto_145863 ?auto_145861 ) ) ( not ( = ?auto_145863 ?auto_145864 ) ) ( not ( = ?auto_145861 ?auto_145864 ) ) ( not ( = ?auto_145858 ?auto_145861 ) ) ( not ( = ?auto_145858 ?auto_145865 ) ) ( not ( = ?auto_145858 ?auto_145863 ) ) ( not ( = ?auto_145859 ?auto_145861 ) ) ( not ( = ?auto_145859 ?auto_145865 ) ) ( not ( = ?auto_145859 ?auto_145863 ) ) ( not ( = ?auto_145862 ?auto_145861 ) ) ( not ( = ?auto_145862 ?auto_145865 ) ) ( not ( = ?auto_145862 ?auto_145863 ) ) ( not ( = ?auto_145860 ?auto_145861 ) ) ( not ( = ?auto_145860 ?auto_145865 ) ) ( not ( = ?auto_145860 ?auto_145863 ) ) ( ON ?auto_145864 ?auto_145860 ) ( ON ?auto_145861 ?auto_145864 ) ( CLEAR ?auto_145861 ) ( HOLDING ?auto_145863 ) ( CLEAR ?auto_145865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145865 ?auto_145863 )
      ( MAKE-2PILE ?auto_145858 ?auto_145859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145866 - BLOCK
      ?auto_145867 - BLOCK
    )
    :vars
    (
      ?auto_145869 - BLOCK
      ?auto_145872 - BLOCK
      ?auto_145870 - BLOCK
      ?auto_145873 - BLOCK
      ?auto_145868 - BLOCK
      ?auto_145871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145869 ?auto_145867 ) ( ON-TABLE ?auto_145866 ) ( ON ?auto_145867 ?auto_145866 ) ( not ( = ?auto_145866 ?auto_145867 ) ) ( not ( = ?auto_145866 ?auto_145869 ) ) ( not ( = ?auto_145867 ?auto_145869 ) ) ( not ( = ?auto_145866 ?auto_145872 ) ) ( not ( = ?auto_145866 ?auto_145870 ) ) ( not ( = ?auto_145867 ?auto_145872 ) ) ( not ( = ?auto_145867 ?auto_145870 ) ) ( not ( = ?auto_145869 ?auto_145872 ) ) ( not ( = ?auto_145869 ?auto_145870 ) ) ( not ( = ?auto_145872 ?auto_145870 ) ) ( ON ?auto_145872 ?auto_145869 ) ( ON-TABLE ?auto_145873 ) ( not ( = ?auto_145873 ?auto_145868 ) ) ( not ( = ?auto_145873 ?auto_145871 ) ) ( not ( = ?auto_145873 ?auto_145870 ) ) ( not ( = ?auto_145868 ?auto_145871 ) ) ( not ( = ?auto_145868 ?auto_145870 ) ) ( not ( = ?auto_145871 ?auto_145870 ) ) ( not ( = ?auto_145866 ?auto_145871 ) ) ( not ( = ?auto_145866 ?auto_145873 ) ) ( not ( = ?auto_145866 ?auto_145868 ) ) ( not ( = ?auto_145867 ?auto_145871 ) ) ( not ( = ?auto_145867 ?auto_145873 ) ) ( not ( = ?auto_145867 ?auto_145868 ) ) ( not ( = ?auto_145869 ?auto_145871 ) ) ( not ( = ?auto_145869 ?auto_145873 ) ) ( not ( = ?auto_145869 ?auto_145868 ) ) ( not ( = ?auto_145872 ?auto_145871 ) ) ( not ( = ?auto_145872 ?auto_145873 ) ) ( not ( = ?auto_145872 ?auto_145868 ) ) ( ON ?auto_145870 ?auto_145872 ) ( ON ?auto_145871 ?auto_145870 ) ( CLEAR ?auto_145873 ) ( ON ?auto_145868 ?auto_145871 ) ( CLEAR ?auto_145868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145866 ?auto_145867 ?auto_145869 ?auto_145872 ?auto_145870 ?auto_145871 )
      ( MAKE-2PILE ?auto_145866 ?auto_145867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145874 - BLOCK
      ?auto_145875 - BLOCK
    )
    :vars
    (
      ?auto_145879 - BLOCK
      ?auto_145876 - BLOCK
      ?auto_145880 - BLOCK
      ?auto_145881 - BLOCK
      ?auto_145878 - BLOCK
      ?auto_145877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145879 ?auto_145875 ) ( ON-TABLE ?auto_145874 ) ( ON ?auto_145875 ?auto_145874 ) ( not ( = ?auto_145874 ?auto_145875 ) ) ( not ( = ?auto_145874 ?auto_145879 ) ) ( not ( = ?auto_145875 ?auto_145879 ) ) ( not ( = ?auto_145874 ?auto_145876 ) ) ( not ( = ?auto_145874 ?auto_145880 ) ) ( not ( = ?auto_145875 ?auto_145876 ) ) ( not ( = ?auto_145875 ?auto_145880 ) ) ( not ( = ?auto_145879 ?auto_145876 ) ) ( not ( = ?auto_145879 ?auto_145880 ) ) ( not ( = ?auto_145876 ?auto_145880 ) ) ( ON ?auto_145876 ?auto_145879 ) ( not ( = ?auto_145881 ?auto_145878 ) ) ( not ( = ?auto_145881 ?auto_145877 ) ) ( not ( = ?auto_145881 ?auto_145880 ) ) ( not ( = ?auto_145878 ?auto_145877 ) ) ( not ( = ?auto_145878 ?auto_145880 ) ) ( not ( = ?auto_145877 ?auto_145880 ) ) ( not ( = ?auto_145874 ?auto_145877 ) ) ( not ( = ?auto_145874 ?auto_145881 ) ) ( not ( = ?auto_145874 ?auto_145878 ) ) ( not ( = ?auto_145875 ?auto_145877 ) ) ( not ( = ?auto_145875 ?auto_145881 ) ) ( not ( = ?auto_145875 ?auto_145878 ) ) ( not ( = ?auto_145879 ?auto_145877 ) ) ( not ( = ?auto_145879 ?auto_145881 ) ) ( not ( = ?auto_145879 ?auto_145878 ) ) ( not ( = ?auto_145876 ?auto_145877 ) ) ( not ( = ?auto_145876 ?auto_145881 ) ) ( not ( = ?auto_145876 ?auto_145878 ) ) ( ON ?auto_145880 ?auto_145876 ) ( ON ?auto_145877 ?auto_145880 ) ( ON ?auto_145878 ?auto_145877 ) ( CLEAR ?auto_145878 ) ( HOLDING ?auto_145881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145881 )
      ( MAKE-2PILE ?auto_145874 ?auto_145875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145892 - BLOCK
      ?auto_145893 - BLOCK
    )
    :vars
    (
      ?auto_145895 - BLOCK
      ?auto_145898 - BLOCK
      ?auto_145894 - BLOCK
      ?auto_145897 - BLOCK
      ?auto_145899 - BLOCK
      ?auto_145896 - BLOCK
      ?auto_145900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145895 ?auto_145893 ) ( ON-TABLE ?auto_145892 ) ( ON ?auto_145893 ?auto_145892 ) ( not ( = ?auto_145892 ?auto_145893 ) ) ( not ( = ?auto_145892 ?auto_145895 ) ) ( not ( = ?auto_145893 ?auto_145895 ) ) ( not ( = ?auto_145892 ?auto_145898 ) ) ( not ( = ?auto_145892 ?auto_145894 ) ) ( not ( = ?auto_145893 ?auto_145898 ) ) ( not ( = ?auto_145893 ?auto_145894 ) ) ( not ( = ?auto_145895 ?auto_145898 ) ) ( not ( = ?auto_145895 ?auto_145894 ) ) ( not ( = ?auto_145898 ?auto_145894 ) ) ( ON ?auto_145898 ?auto_145895 ) ( not ( = ?auto_145897 ?auto_145899 ) ) ( not ( = ?auto_145897 ?auto_145896 ) ) ( not ( = ?auto_145897 ?auto_145894 ) ) ( not ( = ?auto_145899 ?auto_145896 ) ) ( not ( = ?auto_145899 ?auto_145894 ) ) ( not ( = ?auto_145896 ?auto_145894 ) ) ( not ( = ?auto_145892 ?auto_145896 ) ) ( not ( = ?auto_145892 ?auto_145897 ) ) ( not ( = ?auto_145892 ?auto_145899 ) ) ( not ( = ?auto_145893 ?auto_145896 ) ) ( not ( = ?auto_145893 ?auto_145897 ) ) ( not ( = ?auto_145893 ?auto_145899 ) ) ( not ( = ?auto_145895 ?auto_145896 ) ) ( not ( = ?auto_145895 ?auto_145897 ) ) ( not ( = ?auto_145895 ?auto_145899 ) ) ( not ( = ?auto_145898 ?auto_145896 ) ) ( not ( = ?auto_145898 ?auto_145897 ) ) ( not ( = ?auto_145898 ?auto_145899 ) ) ( ON ?auto_145894 ?auto_145898 ) ( ON ?auto_145896 ?auto_145894 ) ( ON ?auto_145899 ?auto_145896 ) ( CLEAR ?auto_145899 ) ( ON ?auto_145897 ?auto_145900 ) ( CLEAR ?auto_145897 ) ( HAND-EMPTY ) ( not ( = ?auto_145892 ?auto_145900 ) ) ( not ( = ?auto_145893 ?auto_145900 ) ) ( not ( = ?auto_145895 ?auto_145900 ) ) ( not ( = ?auto_145898 ?auto_145900 ) ) ( not ( = ?auto_145894 ?auto_145900 ) ) ( not ( = ?auto_145897 ?auto_145900 ) ) ( not ( = ?auto_145899 ?auto_145900 ) ) ( not ( = ?auto_145896 ?auto_145900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145897 ?auto_145900 )
      ( MAKE-2PILE ?auto_145892 ?auto_145893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145901 - BLOCK
      ?auto_145902 - BLOCK
    )
    :vars
    (
      ?auto_145904 - BLOCK
      ?auto_145909 - BLOCK
      ?auto_145905 - BLOCK
      ?auto_145906 - BLOCK
      ?auto_145908 - BLOCK
      ?auto_145903 - BLOCK
      ?auto_145907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145904 ?auto_145902 ) ( ON-TABLE ?auto_145901 ) ( ON ?auto_145902 ?auto_145901 ) ( not ( = ?auto_145901 ?auto_145902 ) ) ( not ( = ?auto_145901 ?auto_145904 ) ) ( not ( = ?auto_145902 ?auto_145904 ) ) ( not ( = ?auto_145901 ?auto_145909 ) ) ( not ( = ?auto_145901 ?auto_145905 ) ) ( not ( = ?auto_145902 ?auto_145909 ) ) ( not ( = ?auto_145902 ?auto_145905 ) ) ( not ( = ?auto_145904 ?auto_145909 ) ) ( not ( = ?auto_145904 ?auto_145905 ) ) ( not ( = ?auto_145909 ?auto_145905 ) ) ( ON ?auto_145909 ?auto_145904 ) ( not ( = ?auto_145906 ?auto_145908 ) ) ( not ( = ?auto_145906 ?auto_145903 ) ) ( not ( = ?auto_145906 ?auto_145905 ) ) ( not ( = ?auto_145908 ?auto_145903 ) ) ( not ( = ?auto_145908 ?auto_145905 ) ) ( not ( = ?auto_145903 ?auto_145905 ) ) ( not ( = ?auto_145901 ?auto_145903 ) ) ( not ( = ?auto_145901 ?auto_145906 ) ) ( not ( = ?auto_145901 ?auto_145908 ) ) ( not ( = ?auto_145902 ?auto_145903 ) ) ( not ( = ?auto_145902 ?auto_145906 ) ) ( not ( = ?auto_145902 ?auto_145908 ) ) ( not ( = ?auto_145904 ?auto_145903 ) ) ( not ( = ?auto_145904 ?auto_145906 ) ) ( not ( = ?auto_145904 ?auto_145908 ) ) ( not ( = ?auto_145909 ?auto_145903 ) ) ( not ( = ?auto_145909 ?auto_145906 ) ) ( not ( = ?auto_145909 ?auto_145908 ) ) ( ON ?auto_145905 ?auto_145909 ) ( ON ?auto_145903 ?auto_145905 ) ( ON ?auto_145906 ?auto_145907 ) ( CLEAR ?auto_145906 ) ( not ( = ?auto_145901 ?auto_145907 ) ) ( not ( = ?auto_145902 ?auto_145907 ) ) ( not ( = ?auto_145904 ?auto_145907 ) ) ( not ( = ?auto_145909 ?auto_145907 ) ) ( not ( = ?auto_145905 ?auto_145907 ) ) ( not ( = ?auto_145906 ?auto_145907 ) ) ( not ( = ?auto_145908 ?auto_145907 ) ) ( not ( = ?auto_145903 ?auto_145907 ) ) ( HOLDING ?auto_145908 ) ( CLEAR ?auto_145903 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145901 ?auto_145902 ?auto_145904 ?auto_145909 ?auto_145905 ?auto_145903 ?auto_145908 )
      ( MAKE-2PILE ?auto_145901 ?auto_145902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145910 - BLOCK
      ?auto_145911 - BLOCK
    )
    :vars
    (
      ?auto_145915 - BLOCK
      ?auto_145912 - BLOCK
      ?auto_145916 - BLOCK
      ?auto_145917 - BLOCK
      ?auto_145913 - BLOCK
      ?auto_145914 - BLOCK
      ?auto_145918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145915 ?auto_145911 ) ( ON-TABLE ?auto_145910 ) ( ON ?auto_145911 ?auto_145910 ) ( not ( = ?auto_145910 ?auto_145911 ) ) ( not ( = ?auto_145910 ?auto_145915 ) ) ( not ( = ?auto_145911 ?auto_145915 ) ) ( not ( = ?auto_145910 ?auto_145912 ) ) ( not ( = ?auto_145910 ?auto_145916 ) ) ( not ( = ?auto_145911 ?auto_145912 ) ) ( not ( = ?auto_145911 ?auto_145916 ) ) ( not ( = ?auto_145915 ?auto_145912 ) ) ( not ( = ?auto_145915 ?auto_145916 ) ) ( not ( = ?auto_145912 ?auto_145916 ) ) ( ON ?auto_145912 ?auto_145915 ) ( not ( = ?auto_145917 ?auto_145913 ) ) ( not ( = ?auto_145917 ?auto_145914 ) ) ( not ( = ?auto_145917 ?auto_145916 ) ) ( not ( = ?auto_145913 ?auto_145914 ) ) ( not ( = ?auto_145913 ?auto_145916 ) ) ( not ( = ?auto_145914 ?auto_145916 ) ) ( not ( = ?auto_145910 ?auto_145914 ) ) ( not ( = ?auto_145910 ?auto_145917 ) ) ( not ( = ?auto_145910 ?auto_145913 ) ) ( not ( = ?auto_145911 ?auto_145914 ) ) ( not ( = ?auto_145911 ?auto_145917 ) ) ( not ( = ?auto_145911 ?auto_145913 ) ) ( not ( = ?auto_145915 ?auto_145914 ) ) ( not ( = ?auto_145915 ?auto_145917 ) ) ( not ( = ?auto_145915 ?auto_145913 ) ) ( not ( = ?auto_145912 ?auto_145914 ) ) ( not ( = ?auto_145912 ?auto_145917 ) ) ( not ( = ?auto_145912 ?auto_145913 ) ) ( ON ?auto_145916 ?auto_145912 ) ( ON ?auto_145914 ?auto_145916 ) ( ON ?auto_145917 ?auto_145918 ) ( not ( = ?auto_145910 ?auto_145918 ) ) ( not ( = ?auto_145911 ?auto_145918 ) ) ( not ( = ?auto_145915 ?auto_145918 ) ) ( not ( = ?auto_145912 ?auto_145918 ) ) ( not ( = ?auto_145916 ?auto_145918 ) ) ( not ( = ?auto_145917 ?auto_145918 ) ) ( not ( = ?auto_145913 ?auto_145918 ) ) ( not ( = ?auto_145914 ?auto_145918 ) ) ( CLEAR ?auto_145914 ) ( ON ?auto_145913 ?auto_145917 ) ( CLEAR ?auto_145913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145918 ?auto_145917 )
      ( MAKE-2PILE ?auto_145910 ?auto_145911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145919 - BLOCK
      ?auto_145920 - BLOCK
    )
    :vars
    (
      ?auto_145921 - BLOCK
      ?auto_145922 - BLOCK
      ?auto_145924 - BLOCK
      ?auto_145927 - BLOCK
      ?auto_145926 - BLOCK
      ?auto_145923 - BLOCK
      ?auto_145925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145921 ?auto_145920 ) ( ON-TABLE ?auto_145919 ) ( ON ?auto_145920 ?auto_145919 ) ( not ( = ?auto_145919 ?auto_145920 ) ) ( not ( = ?auto_145919 ?auto_145921 ) ) ( not ( = ?auto_145920 ?auto_145921 ) ) ( not ( = ?auto_145919 ?auto_145922 ) ) ( not ( = ?auto_145919 ?auto_145924 ) ) ( not ( = ?auto_145920 ?auto_145922 ) ) ( not ( = ?auto_145920 ?auto_145924 ) ) ( not ( = ?auto_145921 ?auto_145922 ) ) ( not ( = ?auto_145921 ?auto_145924 ) ) ( not ( = ?auto_145922 ?auto_145924 ) ) ( ON ?auto_145922 ?auto_145921 ) ( not ( = ?auto_145927 ?auto_145926 ) ) ( not ( = ?auto_145927 ?auto_145923 ) ) ( not ( = ?auto_145927 ?auto_145924 ) ) ( not ( = ?auto_145926 ?auto_145923 ) ) ( not ( = ?auto_145926 ?auto_145924 ) ) ( not ( = ?auto_145923 ?auto_145924 ) ) ( not ( = ?auto_145919 ?auto_145923 ) ) ( not ( = ?auto_145919 ?auto_145927 ) ) ( not ( = ?auto_145919 ?auto_145926 ) ) ( not ( = ?auto_145920 ?auto_145923 ) ) ( not ( = ?auto_145920 ?auto_145927 ) ) ( not ( = ?auto_145920 ?auto_145926 ) ) ( not ( = ?auto_145921 ?auto_145923 ) ) ( not ( = ?auto_145921 ?auto_145927 ) ) ( not ( = ?auto_145921 ?auto_145926 ) ) ( not ( = ?auto_145922 ?auto_145923 ) ) ( not ( = ?auto_145922 ?auto_145927 ) ) ( not ( = ?auto_145922 ?auto_145926 ) ) ( ON ?auto_145924 ?auto_145922 ) ( ON ?auto_145927 ?auto_145925 ) ( not ( = ?auto_145919 ?auto_145925 ) ) ( not ( = ?auto_145920 ?auto_145925 ) ) ( not ( = ?auto_145921 ?auto_145925 ) ) ( not ( = ?auto_145922 ?auto_145925 ) ) ( not ( = ?auto_145924 ?auto_145925 ) ) ( not ( = ?auto_145927 ?auto_145925 ) ) ( not ( = ?auto_145926 ?auto_145925 ) ) ( not ( = ?auto_145923 ?auto_145925 ) ) ( ON ?auto_145926 ?auto_145927 ) ( CLEAR ?auto_145926 ) ( ON-TABLE ?auto_145925 ) ( HOLDING ?auto_145923 ) ( CLEAR ?auto_145924 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145919 ?auto_145920 ?auto_145921 ?auto_145922 ?auto_145924 ?auto_145923 )
      ( MAKE-2PILE ?auto_145919 ?auto_145920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145928 - BLOCK
      ?auto_145929 - BLOCK
    )
    :vars
    (
      ?auto_145932 - BLOCK
      ?auto_145930 - BLOCK
      ?auto_145933 - BLOCK
      ?auto_145931 - BLOCK
      ?auto_145936 - BLOCK
      ?auto_145935 - BLOCK
      ?auto_145934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145932 ?auto_145929 ) ( ON-TABLE ?auto_145928 ) ( ON ?auto_145929 ?auto_145928 ) ( not ( = ?auto_145928 ?auto_145929 ) ) ( not ( = ?auto_145928 ?auto_145932 ) ) ( not ( = ?auto_145929 ?auto_145932 ) ) ( not ( = ?auto_145928 ?auto_145930 ) ) ( not ( = ?auto_145928 ?auto_145933 ) ) ( not ( = ?auto_145929 ?auto_145930 ) ) ( not ( = ?auto_145929 ?auto_145933 ) ) ( not ( = ?auto_145932 ?auto_145930 ) ) ( not ( = ?auto_145932 ?auto_145933 ) ) ( not ( = ?auto_145930 ?auto_145933 ) ) ( ON ?auto_145930 ?auto_145932 ) ( not ( = ?auto_145931 ?auto_145936 ) ) ( not ( = ?auto_145931 ?auto_145935 ) ) ( not ( = ?auto_145931 ?auto_145933 ) ) ( not ( = ?auto_145936 ?auto_145935 ) ) ( not ( = ?auto_145936 ?auto_145933 ) ) ( not ( = ?auto_145935 ?auto_145933 ) ) ( not ( = ?auto_145928 ?auto_145935 ) ) ( not ( = ?auto_145928 ?auto_145931 ) ) ( not ( = ?auto_145928 ?auto_145936 ) ) ( not ( = ?auto_145929 ?auto_145935 ) ) ( not ( = ?auto_145929 ?auto_145931 ) ) ( not ( = ?auto_145929 ?auto_145936 ) ) ( not ( = ?auto_145932 ?auto_145935 ) ) ( not ( = ?auto_145932 ?auto_145931 ) ) ( not ( = ?auto_145932 ?auto_145936 ) ) ( not ( = ?auto_145930 ?auto_145935 ) ) ( not ( = ?auto_145930 ?auto_145931 ) ) ( not ( = ?auto_145930 ?auto_145936 ) ) ( ON ?auto_145933 ?auto_145930 ) ( ON ?auto_145931 ?auto_145934 ) ( not ( = ?auto_145928 ?auto_145934 ) ) ( not ( = ?auto_145929 ?auto_145934 ) ) ( not ( = ?auto_145932 ?auto_145934 ) ) ( not ( = ?auto_145930 ?auto_145934 ) ) ( not ( = ?auto_145933 ?auto_145934 ) ) ( not ( = ?auto_145931 ?auto_145934 ) ) ( not ( = ?auto_145936 ?auto_145934 ) ) ( not ( = ?auto_145935 ?auto_145934 ) ) ( ON ?auto_145936 ?auto_145931 ) ( ON-TABLE ?auto_145934 ) ( CLEAR ?auto_145933 ) ( ON ?auto_145935 ?auto_145936 ) ( CLEAR ?auto_145935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145934 ?auto_145931 ?auto_145936 )
      ( MAKE-2PILE ?auto_145928 ?auto_145929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145986 - BLOCK
      ?auto_145987 - BLOCK
      ?auto_145988 - BLOCK
      ?auto_145989 - BLOCK
      ?auto_145990 - BLOCK
      ?auto_145991 - BLOCK
    )
    :vars
    (
      ?auto_145992 - BLOCK
      ?auto_145993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145986 ) ( ON ?auto_145987 ?auto_145986 ) ( ON ?auto_145988 ?auto_145987 ) ( ON ?auto_145989 ?auto_145988 ) ( not ( = ?auto_145986 ?auto_145987 ) ) ( not ( = ?auto_145986 ?auto_145988 ) ) ( not ( = ?auto_145986 ?auto_145989 ) ) ( not ( = ?auto_145986 ?auto_145990 ) ) ( not ( = ?auto_145986 ?auto_145991 ) ) ( not ( = ?auto_145987 ?auto_145988 ) ) ( not ( = ?auto_145987 ?auto_145989 ) ) ( not ( = ?auto_145987 ?auto_145990 ) ) ( not ( = ?auto_145987 ?auto_145991 ) ) ( not ( = ?auto_145988 ?auto_145989 ) ) ( not ( = ?auto_145988 ?auto_145990 ) ) ( not ( = ?auto_145988 ?auto_145991 ) ) ( not ( = ?auto_145989 ?auto_145990 ) ) ( not ( = ?auto_145989 ?auto_145991 ) ) ( not ( = ?auto_145990 ?auto_145991 ) ) ( ON ?auto_145991 ?auto_145992 ) ( not ( = ?auto_145986 ?auto_145992 ) ) ( not ( = ?auto_145987 ?auto_145992 ) ) ( not ( = ?auto_145988 ?auto_145992 ) ) ( not ( = ?auto_145989 ?auto_145992 ) ) ( not ( = ?auto_145990 ?auto_145992 ) ) ( not ( = ?auto_145991 ?auto_145992 ) ) ( CLEAR ?auto_145989 ) ( ON ?auto_145990 ?auto_145991 ) ( CLEAR ?auto_145990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145993 ) ( ON ?auto_145992 ?auto_145993 ) ( not ( = ?auto_145993 ?auto_145992 ) ) ( not ( = ?auto_145993 ?auto_145991 ) ) ( not ( = ?auto_145993 ?auto_145990 ) ) ( not ( = ?auto_145986 ?auto_145993 ) ) ( not ( = ?auto_145987 ?auto_145993 ) ) ( not ( = ?auto_145988 ?auto_145993 ) ) ( not ( = ?auto_145989 ?auto_145993 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145993 ?auto_145992 ?auto_145991 )
      ( MAKE-6PILE ?auto_145986 ?auto_145987 ?auto_145988 ?auto_145989 ?auto_145990 ?auto_145991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145994 - BLOCK
      ?auto_145995 - BLOCK
      ?auto_145996 - BLOCK
      ?auto_145997 - BLOCK
      ?auto_145998 - BLOCK
      ?auto_145999 - BLOCK
    )
    :vars
    (
      ?auto_146000 - BLOCK
      ?auto_146001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145994 ) ( ON ?auto_145995 ?auto_145994 ) ( ON ?auto_145996 ?auto_145995 ) ( not ( = ?auto_145994 ?auto_145995 ) ) ( not ( = ?auto_145994 ?auto_145996 ) ) ( not ( = ?auto_145994 ?auto_145997 ) ) ( not ( = ?auto_145994 ?auto_145998 ) ) ( not ( = ?auto_145994 ?auto_145999 ) ) ( not ( = ?auto_145995 ?auto_145996 ) ) ( not ( = ?auto_145995 ?auto_145997 ) ) ( not ( = ?auto_145995 ?auto_145998 ) ) ( not ( = ?auto_145995 ?auto_145999 ) ) ( not ( = ?auto_145996 ?auto_145997 ) ) ( not ( = ?auto_145996 ?auto_145998 ) ) ( not ( = ?auto_145996 ?auto_145999 ) ) ( not ( = ?auto_145997 ?auto_145998 ) ) ( not ( = ?auto_145997 ?auto_145999 ) ) ( not ( = ?auto_145998 ?auto_145999 ) ) ( ON ?auto_145999 ?auto_146000 ) ( not ( = ?auto_145994 ?auto_146000 ) ) ( not ( = ?auto_145995 ?auto_146000 ) ) ( not ( = ?auto_145996 ?auto_146000 ) ) ( not ( = ?auto_145997 ?auto_146000 ) ) ( not ( = ?auto_145998 ?auto_146000 ) ) ( not ( = ?auto_145999 ?auto_146000 ) ) ( ON ?auto_145998 ?auto_145999 ) ( CLEAR ?auto_145998 ) ( ON-TABLE ?auto_146001 ) ( ON ?auto_146000 ?auto_146001 ) ( not ( = ?auto_146001 ?auto_146000 ) ) ( not ( = ?auto_146001 ?auto_145999 ) ) ( not ( = ?auto_146001 ?auto_145998 ) ) ( not ( = ?auto_145994 ?auto_146001 ) ) ( not ( = ?auto_145995 ?auto_146001 ) ) ( not ( = ?auto_145996 ?auto_146001 ) ) ( not ( = ?auto_145997 ?auto_146001 ) ) ( HOLDING ?auto_145997 ) ( CLEAR ?auto_145996 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145994 ?auto_145995 ?auto_145996 ?auto_145997 )
      ( MAKE-6PILE ?auto_145994 ?auto_145995 ?auto_145996 ?auto_145997 ?auto_145998 ?auto_145999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146002 - BLOCK
      ?auto_146003 - BLOCK
      ?auto_146004 - BLOCK
      ?auto_146005 - BLOCK
      ?auto_146006 - BLOCK
      ?auto_146007 - BLOCK
    )
    :vars
    (
      ?auto_146008 - BLOCK
      ?auto_146009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146002 ) ( ON ?auto_146003 ?auto_146002 ) ( ON ?auto_146004 ?auto_146003 ) ( not ( = ?auto_146002 ?auto_146003 ) ) ( not ( = ?auto_146002 ?auto_146004 ) ) ( not ( = ?auto_146002 ?auto_146005 ) ) ( not ( = ?auto_146002 ?auto_146006 ) ) ( not ( = ?auto_146002 ?auto_146007 ) ) ( not ( = ?auto_146003 ?auto_146004 ) ) ( not ( = ?auto_146003 ?auto_146005 ) ) ( not ( = ?auto_146003 ?auto_146006 ) ) ( not ( = ?auto_146003 ?auto_146007 ) ) ( not ( = ?auto_146004 ?auto_146005 ) ) ( not ( = ?auto_146004 ?auto_146006 ) ) ( not ( = ?auto_146004 ?auto_146007 ) ) ( not ( = ?auto_146005 ?auto_146006 ) ) ( not ( = ?auto_146005 ?auto_146007 ) ) ( not ( = ?auto_146006 ?auto_146007 ) ) ( ON ?auto_146007 ?auto_146008 ) ( not ( = ?auto_146002 ?auto_146008 ) ) ( not ( = ?auto_146003 ?auto_146008 ) ) ( not ( = ?auto_146004 ?auto_146008 ) ) ( not ( = ?auto_146005 ?auto_146008 ) ) ( not ( = ?auto_146006 ?auto_146008 ) ) ( not ( = ?auto_146007 ?auto_146008 ) ) ( ON ?auto_146006 ?auto_146007 ) ( ON-TABLE ?auto_146009 ) ( ON ?auto_146008 ?auto_146009 ) ( not ( = ?auto_146009 ?auto_146008 ) ) ( not ( = ?auto_146009 ?auto_146007 ) ) ( not ( = ?auto_146009 ?auto_146006 ) ) ( not ( = ?auto_146002 ?auto_146009 ) ) ( not ( = ?auto_146003 ?auto_146009 ) ) ( not ( = ?auto_146004 ?auto_146009 ) ) ( not ( = ?auto_146005 ?auto_146009 ) ) ( CLEAR ?auto_146004 ) ( ON ?auto_146005 ?auto_146006 ) ( CLEAR ?auto_146005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146009 ?auto_146008 ?auto_146007 ?auto_146006 )
      ( MAKE-6PILE ?auto_146002 ?auto_146003 ?auto_146004 ?auto_146005 ?auto_146006 ?auto_146007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146010 - BLOCK
      ?auto_146011 - BLOCK
      ?auto_146012 - BLOCK
      ?auto_146013 - BLOCK
      ?auto_146014 - BLOCK
      ?auto_146015 - BLOCK
    )
    :vars
    (
      ?auto_146017 - BLOCK
      ?auto_146016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146010 ) ( ON ?auto_146011 ?auto_146010 ) ( not ( = ?auto_146010 ?auto_146011 ) ) ( not ( = ?auto_146010 ?auto_146012 ) ) ( not ( = ?auto_146010 ?auto_146013 ) ) ( not ( = ?auto_146010 ?auto_146014 ) ) ( not ( = ?auto_146010 ?auto_146015 ) ) ( not ( = ?auto_146011 ?auto_146012 ) ) ( not ( = ?auto_146011 ?auto_146013 ) ) ( not ( = ?auto_146011 ?auto_146014 ) ) ( not ( = ?auto_146011 ?auto_146015 ) ) ( not ( = ?auto_146012 ?auto_146013 ) ) ( not ( = ?auto_146012 ?auto_146014 ) ) ( not ( = ?auto_146012 ?auto_146015 ) ) ( not ( = ?auto_146013 ?auto_146014 ) ) ( not ( = ?auto_146013 ?auto_146015 ) ) ( not ( = ?auto_146014 ?auto_146015 ) ) ( ON ?auto_146015 ?auto_146017 ) ( not ( = ?auto_146010 ?auto_146017 ) ) ( not ( = ?auto_146011 ?auto_146017 ) ) ( not ( = ?auto_146012 ?auto_146017 ) ) ( not ( = ?auto_146013 ?auto_146017 ) ) ( not ( = ?auto_146014 ?auto_146017 ) ) ( not ( = ?auto_146015 ?auto_146017 ) ) ( ON ?auto_146014 ?auto_146015 ) ( ON-TABLE ?auto_146016 ) ( ON ?auto_146017 ?auto_146016 ) ( not ( = ?auto_146016 ?auto_146017 ) ) ( not ( = ?auto_146016 ?auto_146015 ) ) ( not ( = ?auto_146016 ?auto_146014 ) ) ( not ( = ?auto_146010 ?auto_146016 ) ) ( not ( = ?auto_146011 ?auto_146016 ) ) ( not ( = ?auto_146012 ?auto_146016 ) ) ( not ( = ?auto_146013 ?auto_146016 ) ) ( ON ?auto_146013 ?auto_146014 ) ( CLEAR ?auto_146013 ) ( HOLDING ?auto_146012 ) ( CLEAR ?auto_146011 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146010 ?auto_146011 ?auto_146012 )
      ( MAKE-6PILE ?auto_146010 ?auto_146011 ?auto_146012 ?auto_146013 ?auto_146014 ?auto_146015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146018 - BLOCK
      ?auto_146019 - BLOCK
      ?auto_146020 - BLOCK
      ?auto_146021 - BLOCK
      ?auto_146022 - BLOCK
      ?auto_146023 - BLOCK
    )
    :vars
    (
      ?auto_146025 - BLOCK
      ?auto_146024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146018 ) ( ON ?auto_146019 ?auto_146018 ) ( not ( = ?auto_146018 ?auto_146019 ) ) ( not ( = ?auto_146018 ?auto_146020 ) ) ( not ( = ?auto_146018 ?auto_146021 ) ) ( not ( = ?auto_146018 ?auto_146022 ) ) ( not ( = ?auto_146018 ?auto_146023 ) ) ( not ( = ?auto_146019 ?auto_146020 ) ) ( not ( = ?auto_146019 ?auto_146021 ) ) ( not ( = ?auto_146019 ?auto_146022 ) ) ( not ( = ?auto_146019 ?auto_146023 ) ) ( not ( = ?auto_146020 ?auto_146021 ) ) ( not ( = ?auto_146020 ?auto_146022 ) ) ( not ( = ?auto_146020 ?auto_146023 ) ) ( not ( = ?auto_146021 ?auto_146022 ) ) ( not ( = ?auto_146021 ?auto_146023 ) ) ( not ( = ?auto_146022 ?auto_146023 ) ) ( ON ?auto_146023 ?auto_146025 ) ( not ( = ?auto_146018 ?auto_146025 ) ) ( not ( = ?auto_146019 ?auto_146025 ) ) ( not ( = ?auto_146020 ?auto_146025 ) ) ( not ( = ?auto_146021 ?auto_146025 ) ) ( not ( = ?auto_146022 ?auto_146025 ) ) ( not ( = ?auto_146023 ?auto_146025 ) ) ( ON ?auto_146022 ?auto_146023 ) ( ON-TABLE ?auto_146024 ) ( ON ?auto_146025 ?auto_146024 ) ( not ( = ?auto_146024 ?auto_146025 ) ) ( not ( = ?auto_146024 ?auto_146023 ) ) ( not ( = ?auto_146024 ?auto_146022 ) ) ( not ( = ?auto_146018 ?auto_146024 ) ) ( not ( = ?auto_146019 ?auto_146024 ) ) ( not ( = ?auto_146020 ?auto_146024 ) ) ( not ( = ?auto_146021 ?auto_146024 ) ) ( ON ?auto_146021 ?auto_146022 ) ( CLEAR ?auto_146019 ) ( ON ?auto_146020 ?auto_146021 ) ( CLEAR ?auto_146020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146024 ?auto_146025 ?auto_146023 ?auto_146022 ?auto_146021 )
      ( MAKE-6PILE ?auto_146018 ?auto_146019 ?auto_146020 ?auto_146021 ?auto_146022 ?auto_146023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146026 - BLOCK
      ?auto_146027 - BLOCK
      ?auto_146028 - BLOCK
      ?auto_146029 - BLOCK
      ?auto_146030 - BLOCK
      ?auto_146031 - BLOCK
    )
    :vars
    (
      ?auto_146032 - BLOCK
      ?auto_146033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146026 ) ( not ( = ?auto_146026 ?auto_146027 ) ) ( not ( = ?auto_146026 ?auto_146028 ) ) ( not ( = ?auto_146026 ?auto_146029 ) ) ( not ( = ?auto_146026 ?auto_146030 ) ) ( not ( = ?auto_146026 ?auto_146031 ) ) ( not ( = ?auto_146027 ?auto_146028 ) ) ( not ( = ?auto_146027 ?auto_146029 ) ) ( not ( = ?auto_146027 ?auto_146030 ) ) ( not ( = ?auto_146027 ?auto_146031 ) ) ( not ( = ?auto_146028 ?auto_146029 ) ) ( not ( = ?auto_146028 ?auto_146030 ) ) ( not ( = ?auto_146028 ?auto_146031 ) ) ( not ( = ?auto_146029 ?auto_146030 ) ) ( not ( = ?auto_146029 ?auto_146031 ) ) ( not ( = ?auto_146030 ?auto_146031 ) ) ( ON ?auto_146031 ?auto_146032 ) ( not ( = ?auto_146026 ?auto_146032 ) ) ( not ( = ?auto_146027 ?auto_146032 ) ) ( not ( = ?auto_146028 ?auto_146032 ) ) ( not ( = ?auto_146029 ?auto_146032 ) ) ( not ( = ?auto_146030 ?auto_146032 ) ) ( not ( = ?auto_146031 ?auto_146032 ) ) ( ON ?auto_146030 ?auto_146031 ) ( ON-TABLE ?auto_146033 ) ( ON ?auto_146032 ?auto_146033 ) ( not ( = ?auto_146033 ?auto_146032 ) ) ( not ( = ?auto_146033 ?auto_146031 ) ) ( not ( = ?auto_146033 ?auto_146030 ) ) ( not ( = ?auto_146026 ?auto_146033 ) ) ( not ( = ?auto_146027 ?auto_146033 ) ) ( not ( = ?auto_146028 ?auto_146033 ) ) ( not ( = ?auto_146029 ?auto_146033 ) ) ( ON ?auto_146029 ?auto_146030 ) ( ON ?auto_146028 ?auto_146029 ) ( CLEAR ?auto_146028 ) ( HOLDING ?auto_146027 ) ( CLEAR ?auto_146026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146026 ?auto_146027 )
      ( MAKE-6PILE ?auto_146026 ?auto_146027 ?auto_146028 ?auto_146029 ?auto_146030 ?auto_146031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146034 - BLOCK
      ?auto_146035 - BLOCK
      ?auto_146036 - BLOCK
      ?auto_146037 - BLOCK
      ?auto_146038 - BLOCK
      ?auto_146039 - BLOCK
    )
    :vars
    (
      ?auto_146040 - BLOCK
      ?auto_146041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146034 ) ( not ( = ?auto_146034 ?auto_146035 ) ) ( not ( = ?auto_146034 ?auto_146036 ) ) ( not ( = ?auto_146034 ?auto_146037 ) ) ( not ( = ?auto_146034 ?auto_146038 ) ) ( not ( = ?auto_146034 ?auto_146039 ) ) ( not ( = ?auto_146035 ?auto_146036 ) ) ( not ( = ?auto_146035 ?auto_146037 ) ) ( not ( = ?auto_146035 ?auto_146038 ) ) ( not ( = ?auto_146035 ?auto_146039 ) ) ( not ( = ?auto_146036 ?auto_146037 ) ) ( not ( = ?auto_146036 ?auto_146038 ) ) ( not ( = ?auto_146036 ?auto_146039 ) ) ( not ( = ?auto_146037 ?auto_146038 ) ) ( not ( = ?auto_146037 ?auto_146039 ) ) ( not ( = ?auto_146038 ?auto_146039 ) ) ( ON ?auto_146039 ?auto_146040 ) ( not ( = ?auto_146034 ?auto_146040 ) ) ( not ( = ?auto_146035 ?auto_146040 ) ) ( not ( = ?auto_146036 ?auto_146040 ) ) ( not ( = ?auto_146037 ?auto_146040 ) ) ( not ( = ?auto_146038 ?auto_146040 ) ) ( not ( = ?auto_146039 ?auto_146040 ) ) ( ON ?auto_146038 ?auto_146039 ) ( ON-TABLE ?auto_146041 ) ( ON ?auto_146040 ?auto_146041 ) ( not ( = ?auto_146041 ?auto_146040 ) ) ( not ( = ?auto_146041 ?auto_146039 ) ) ( not ( = ?auto_146041 ?auto_146038 ) ) ( not ( = ?auto_146034 ?auto_146041 ) ) ( not ( = ?auto_146035 ?auto_146041 ) ) ( not ( = ?auto_146036 ?auto_146041 ) ) ( not ( = ?auto_146037 ?auto_146041 ) ) ( ON ?auto_146037 ?auto_146038 ) ( ON ?auto_146036 ?auto_146037 ) ( CLEAR ?auto_146034 ) ( ON ?auto_146035 ?auto_146036 ) ( CLEAR ?auto_146035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146041 ?auto_146040 ?auto_146039 ?auto_146038 ?auto_146037 ?auto_146036 )
      ( MAKE-6PILE ?auto_146034 ?auto_146035 ?auto_146036 ?auto_146037 ?auto_146038 ?auto_146039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146042 - BLOCK
      ?auto_146043 - BLOCK
      ?auto_146044 - BLOCK
      ?auto_146045 - BLOCK
      ?auto_146046 - BLOCK
      ?auto_146047 - BLOCK
    )
    :vars
    (
      ?auto_146048 - BLOCK
      ?auto_146049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146042 ?auto_146043 ) ) ( not ( = ?auto_146042 ?auto_146044 ) ) ( not ( = ?auto_146042 ?auto_146045 ) ) ( not ( = ?auto_146042 ?auto_146046 ) ) ( not ( = ?auto_146042 ?auto_146047 ) ) ( not ( = ?auto_146043 ?auto_146044 ) ) ( not ( = ?auto_146043 ?auto_146045 ) ) ( not ( = ?auto_146043 ?auto_146046 ) ) ( not ( = ?auto_146043 ?auto_146047 ) ) ( not ( = ?auto_146044 ?auto_146045 ) ) ( not ( = ?auto_146044 ?auto_146046 ) ) ( not ( = ?auto_146044 ?auto_146047 ) ) ( not ( = ?auto_146045 ?auto_146046 ) ) ( not ( = ?auto_146045 ?auto_146047 ) ) ( not ( = ?auto_146046 ?auto_146047 ) ) ( ON ?auto_146047 ?auto_146048 ) ( not ( = ?auto_146042 ?auto_146048 ) ) ( not ( = ?auto_146043 ?auto_146048 ) ) ( not ( = ?auto_146044 ?auto_146048 ) ) ( not ( = ?auto_146045 ?auto_146048 ) ) ( not ( = ?auto_146046 ?auto_146048 ) ) ( not ( = ?auto_146047 ?auto_146048 ) ) ( ON ?auto_146046 ?auto_146047 ) ( ON-TABLE ?auto_146049 ) ( ON ?auto_146048 ?auto_146049 ) ( not ( = ?auto_146049 ?auto_146048 ) ) ( not ( = ?auto_146049 ?auto_146047 ) ) ( not ( = ?auto_146049 ?auto_146046 ) ) ( not ( = ?auto_146042 ?auto_146049 ) ) ( not ( = ?auto_146043 ?auto_146049 ) ) ( not ( = ?auto_146044 ?auto_146049 ) ) ( not ( = ?auto_146045 ?auto_146049 ) ) ( ON ?auto_146045 ?auto_146046 ) ( ON ?auto_146044 ?auto_146045 ) ( ON ?auto_146043 ?auto_146044 ) ( CLEAR ?auto_146043 ) ( HOLDING ?auto_146042 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146042 )
      ( MAKE-6PILE ?auto_146042 ?auto_146043 ?auto_146044 ?auto_146045 ?auto_146046 ?auto_146047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146050 - BLOCK
      ?auto_146051 - BLOCK
      ?auto_146052 - BLOCK
      ?auto_146053 - BLOCK
      ?auto_146054 - BLOCK
      ?auto_146055 - BLOCK
    )
    :vars
    (
      ?auto_146056 - BLOCK
      ?auto_146057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146050 ?auto_146051 ) ) ( not ( = ?auto_146050 ?auto_146052 ) ) ( not ( = ?auto_146050 ?auto_146053 ) ) ( not ( = ?auto_146050 ?auto_146054 ) ) ( not ( = ?auto_146050 ?auto_146055 ) ) ( not ( = ?auto_146051 ?auto_146052 ) ) ( not ( = ?auto_146051 ?auto_146053 ) ) ( not ( = ?auto_146051 ?auto_146054 ) ) ( not ( = ?auto_146051 ?auto_146055 ) ) ( not ( = ?auto_146052 ?auto_146053 ) ) ( not ( = ?auto_146052 ?auto_146054 ) ) ( not ( = ?auto_146052 ?auto_146055 ) ) ( not ( = ?auto_146053 ?auto_146054 ) ) ( not ( = ?auto_146053 ?auto_146055 ) ) ( not ( = ?auto_146054 ?auto_146055 ) ) ( ON ?auto_146055 ?auto_146056 ) ( not ( = ?auto_146050 ?auto_146056 ) ) ( not ( = ?auto_146051 ?auto_146056 ) ) ( not ( = ?auto_146052 ?auto_146056 ) ) ( not ( = ?auto_146053 ?auto_146056 ) ) ( not ( = ?auto_146054 ?auto_146056 ) ) ( not ( = ?auto_146055 ?auto_146056 ) ) ( ON ?auto_146054 ?auto_146055 ) ( ON-TABLE ?auto_146057 ) ( ON ?auto_146056 ?auto_146057 ) ( not ( = ?auto_146057 ?auto_146056 ) ) ( not ( = ?auto_146057 ?auto_146055 ) ) ( not ( = ?auto_146057 ?auto_146054 ) ) ( not ( = ?auto_146050 ?auto_146057 ) ) ( not ( = ?auto_146051 ?auto_146057 ) ) ( not ( = ?auto_146052 ?auto_146057 ) ) ( not ( = ?auto_146053 ?auto_146057 ) ) ( ON ?auto_146053 ?auto_146054 ) ( ON ?auto_146052 ?auto_146053 ) ( ON ?auto_146051 ?auto_146052 ) ( ON ?auto_146050 ?auto_146051 ) ( CLEAR ?auto_146050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146057 ?auto_146056 ?auto_146055 ?auto_146054 ?auto_146053 ?auto_146052 ?auto_146051 )
      ( MAKE-6PILE ?auto_146050 ?auto_146051 ?auto_146052 ?auto_146053 ?auto_146054 ?auto_146055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146064 - BLOCK
      ?auto_146065 - BLOCK
      ?auto_146066 - BLOCK
      ?auto_146067 - BLOCK
      ?auto_146068 - BLOCK
      ?auto_146069 - BLOCK
    )
    :vars
    (
      ?auto_146070 - BLOCK
      ?auto_146071 - BLOCK
      ?auto_146072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146064 ?auto_146065 ) ) ( not ( = ?auto_146064 ?auto_146066 ) ) ( not ( = ?auto_146064 ?auto_146067 ) ) ( not ( = ?auto_146064 ?auto_146068 ) ) ( not ( = ?auto_146064 ?auto_146069 ) ) ( not ( = ?auto_146065 ?auto_146066 ) ) ( not ( = ?auto_146065 ?auto_146067 ) ) ( not ( = ?auto_146065 ?auto_146068 ) ) ( not ( = ?auto_146065 ?auto_146069 ) ) ( not ( = ?auto_146066 ?auto_146067 ) ) ( not ( = ?auto_146066 ?auto_146068 ) ) ( not ( = ?auto_146066 ?auto_146069 ) ) ( not ( = ?auto_146067 ?auto_146068 ) ) ( not ( = ?auto_146067 ?auto_146069 ) ) ( not ( = ?auto_146068 ?auto_146069 ) ) ( ON ?auto_146069 ?auto_146070 ) ( not ( = ?auto_146064 ?auto_146070 ) ) ( not ( = ?auto_146065 ?auto_146070 ) ) ( not ( = ?auto_146066 ?auto_146070 ) ) ( not ( = ?auto_146067 ?auto_146070 ) ) ( not ( = ?auto_146068 ?auto_146070 ) ) ( not ( = ?auto_146069 ?auto_146070 ) ) ( ON ?auto_146068 ?auto_146069 ) ( ON-TABLE ?auto_146071 ) ( ON ?auto_146070 ?auto_146071 ) ( not ( = ?auto_146071 ?auto_146070 ) ) ( not ( = ?auto_146071 ?auto_146069 ) ) ( not ( = ?auto_146071 ?auto_146068 ) ) ( not ( = ?auto_146064 ?auto_146071 ) ) ( not ( = ?auto_146065 ?auto_146071 ) ) ( not ( = ?auto_146066 ?auto_146071 ) ) ( not ( = ?auto_146067 ?auto_146071 ) ) ( ON ?auto_146067 ?auto_146068 ) ( ON ?auto_146066 ?auto_146067 ) ( ON ?auto_146065 ?auto_146066 ) ( CLEAR ?auto_146065 ) ( ON ?auto_146064 ?auto_146072 ) ( CLEAR ?auto_146064 ) ( HAND-EMPTY ) ( not ( = ?auto_146064 ?auto_146072 ) ) ( not ( = ?auto_146065 ?auto_146072 ) ) ( not ( = ?auto_146066 ?auto_146072 ) ) ( not ( = ?auto_146067 ?auto_146072 ) ) ( not ( = ?auto_146068 ?auto_146072 ) ) ( not ( = ?auto_146069 ?auto_146072 ) ) ( not ( = ?auto_146070 ?auto_146072 ) ) ( not ( = ?auto_146071 ?auto_146072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146064 ?auto_146072 )
      ( MAKE-6PILE ?auto_146064 ?auto_146065 ?auto_146066 ?auto_146067 ?auto_146068 ?auto_146069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146073 - BLOCK
      ?auto_146074 - BLOCK
      ?auto_146075 - BLOCK
      ?auto_146076 - BLOCK
      ?auto_146077 - BLOCK
      ?auto_146078 - BLOCK
    )
    :vars
    (
      ?auto_146079 - BLOCK
      ?auto_146080 - BLOCK
      ?auto_146081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146073 ?auto_146074 ) ) ( not ( = ?auto_146073 ?auto_146075 ) ) ( not ( = ?auto_146073 ?auto_146076 ) ) ( not ( = ?auto_146073 ?auto_146077 ) ) ( not ( = ?auto_146073 ?auto_146078 ) ) ( not ( = ?auto_146074 ?auto_146075 ) ) ( not ( = ?auto_146074 ?auto_146076 ) ) ( not ( = ?auto_146074 ?auto_146077 ) ) ( not ( = ?auto_146074 ?auto_146078 ) ) ( not ( = ?auto_146075 ?auto_146076 ) ) ( not ( = ?auto_146075 ?auto_146077 ) ) ( not ( = ?auto_146075 ?auto_146078 ) ) ( not ( = ?auto_146076 ?auto_146077 ) ) ( not ( = ?auto_146076 ?auto_146078 ) ) ( not ( = ?auto_146077 ?auto_146078 ) ) ( ON ?auto_146078 ?auto_146079 ) ( not ( = ?auto_146073 ?auto_146079 ) ) ( not ( = ?auto_146074 ?auto_146079 ) ) ( not ( = ?auto_146075 ?auto_146079 ) ) ( not ( = ?auto_146076 ?auto_146079 ) ) ( not ( = ?auto_146077 ?auto_146079 ) ) ( not ( = ?auto_146078 ?auto_146079 ) ) ( ON ?auto_146077 ?auto_146078 ) ( ON-TABLE ?auto_146080 ) ( ON ?auto_146079 ?auto_146080 ) ( not ( = ?auto_146080 ?auto_146079 ) ) ( not ( = ?auto_146080 ?auto_146078 ) ) ( not ( = ?auto_146080 ?auto_146077 ) ) ( not ( = ?auto_146073 ?auto_146080 ) ) ( not ( = ?auto_146074 ?auto_146080 ) ) ( not ( = ?auto_146075 ?auto_146080 ) ) ( not ( = ?auto_146076 ?auto_146080 ) ) ( ON ?auto_146076 ?auto_146077 ) ( ON ?auto_146075 ?auto_146076 ) ( ON ?auto_146073 ?auto_146081 ) ( CLEAR ?auto_146073 ) ( not ( = ?auto_146073 ?auto_146081 ) ) ( not ( = ?auto_146074 ?auto_146081 ) ) ( not ( = ?auto_146075 ?auto_146081 ) ) ( not ( = ?auto_146076 ?auto_146081 ) ) ( not ( = ?auto_146077 ?auto_146081 ) ) ( not ( = ?auto_146078 ?auto_146081 ) ) ( not ( = ?auto_146079 ?auto_146081 ) ) ( not ( = ?auto_146080 ?auto_146081 ) ) ( HOLDING ?auto_146074 ) ( CLEAR ?auto_146075 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146080 ?auto_146079 ?auto_146078 ?auto_146077 ?auto_146076 ?auto_146075 ?auto_146074 )
      ( MAKE-6PILE ?auto_146073 ?auto_146074 ?auto_146075 ?auto_146076 ?auto_146077 ?auto_146078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146082 - BLOCK
      ?auto_146083 - BLOCK
      ?auto_146084 - BLOCK
      ?auto_146085 - BLOCK
      ?auto_146086 - BLOCK
      ?auto_146087 - BLOCK
    )
    :vars
    (
      ?auto_146090 - BLOCK
      ?auto_146089 - BLOCK
      ?auto_146088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146082 ?auto_146083 ) ) ( not ( = ?auto_146082 ?auto_146084 ) ) ( not ( = ?auto_146082 ?auto_146085 ) ) ( not ( = ?auto_146082 ?auto_146086 ) ) ( not ( = ?auto_146082 ?auto_146087 ) ) ( not ( = ?auto_146083 ?auto_146084 ) ) ( not ( = ?auto_146083 ?auto_146085 ) ) ( not ( = ?auto_146083 ?auto_146086 ) ) ( not ( = ?auto_146083 ?auto_146087 ) ) ( not ( = ?auto_146084 ?auto_146085 ) ) ( not ( = ?auto_146084 ?auto_146086 ) ) ( not ( = ?auto_146084 ?auto_146087 ) ) ( not ( = ?auto_146085 ?auto_146086 ) ) ( not ( = ?auto_146085 ?auto_146087 ) ) ( not ( = ?auto_146086 ?auto_146087 ) ) ( ON ?auto_146087 ?auto_146090 ) ( not ( = ?auto_146082 ?auto_146090 ) ) ( not ( = ?auto_146083 ?auto_146090 ) ) ( not ( = ?auto_146084 ?auto_146090 ) ) ( not ( = ?auto_146085 ?auto_146090 ) ) ( not ( = ?auto_146086 ?auto_146090 ) ) ( not ( = ?auto_146087 ?auto_146090 ) ) ( ON ?auto_146086 ?auto_146087 ) ( ON-TABLE ?auto_146089 ) ( ON ?auto_146090 ?auto_146089 ) ( not ( = ?auto_146089 ?auto_146090 ) ) ( not ( = ?auto_146089 ?auto_146087 ) ) ( not ( = ?auto_146089 ?auto_146086 ) ) ( not ( = ?auto_146082 ?auto_146089 ) ) ( not ( = ?auto_146083 ?auto_146089 ) ) ( not ( = ?auto_146084 ?auto_146089 ) ) ( not ( = ?auto_146085 ?auto_146089 ) ) ( ON ?auto_146085 ?auto_146086 ) ( ON ?auto_146084 ?auto_146085 ) ( ON ?auto_146082 ?auto_146088 ) ( not ( = ?auto_146082 ?auto_146088 ) ) ( not ( = ?auto_146083 ?auto_146088 ) ) ( not ( = ?auto_146084 ?auto_146088 ) ) ( not ( = ?auto_146085 ?auto_146088 ) ) ( not ( = ?auto_146086 ?auto_146088 ) ) ( not ( = ?auto_146087 ?auto_146088 ) ) ( not ( = ?auto_146090 ?auto_146088 ) ) ( not ( = ?auto_146089 ?auto_146088 ) ) ( CLEAR ?auto_146084 ) ( ON ?auto_146083 ?auto_146082 ) ( CLEAR ?auto_146083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146088 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146088 ?auto_146082 )
      ( MAKE-6PILE ?auto_146082 ?auto_146083 ?auto_146084 ?auto_146085 ?auto_146086 ?auto_146087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146091 - BLOCK
      ?auto_146092 - BLOCK
      ?auto_146093 - BLOCK
      ?auto_146094 - BLOCK
      ?auto_146095 - BLOCK
      ?auto_146096 - BLOCK
    )
    :vars
    (
      ?auto_146099 - BLOCK
      ?auto_146098 - BLOCK
      ?auto_146097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146091 ?auto_146092 ) ) ( not ( = ?auto_146091 ?auto_146093 ) ) ( not ( = ?auto_146091 ?auto_146094 ) ) ( not ( = ?auto_146091 ?auto_146095 ) ) ( not ( = ?auto_146091 ?auto_146096 ) ) ( not ( = ?auto_146092 ?auto_146093 ) ) ( not ( = ?auto_146092 ?auto_146094 ) ) ( not ( = ?auto_146092 ?auto_146095 ) ) ( not ( = ?auto_146092 ?auto_146096 ) ) ( not ( = ?auto_146093 ?auto_146094 ) ) ( not ( = ?auto_146093 ?auto_146095 ) ) ( not ( = ?auto_146093 ?auto_146096 ) ) ( not ( = ?auto_146094 ?auto_146095 ) ) ( not ( = ?auto_146094 ?auto_146096 ) ) ( not ( = ?auto_146095 ?auto_146096 ) ) ( ON ?auto_146096 ?auto_146099 ) ( not ( = ?auto_146091 ?auto_146099 ) ) ( not ( = ?auto_146092 ?auto_146099 ) ) ( not ( = ?auto_146093 ?auto_146099 ) ) ( not ( = ?auto_146094 ?auto_146099 ) ) ( not ( = ?auto_146095 ?auto_146099 ) ) ( not ( = ?auto_146096 ?auto_146099 ) ) ( ON ?auto_146095 ?auto_146096 ) ( ON-TABLE ?auto_146098 ) ( ON ?auto_146099 ?auto_146098 ) ( not ( = ?auto_146098 ?auto_146099 ) ) ( not ( = ?auto_146098 ?auto_146096 ) ) ( not ( = ?auto_146098 ?auto_146095 ) ) ( not ( = ?auto_146091 ?auto_146098 ) ) ( not ( = ?auto_146092 ?auto_146098 ) ) ( not ( = ?auto_146093 ?auto_146098 ) ) ( not ( = ?auto_146094 ?auto_146098 ) ) ( ON ?auto_146094 ?auto_146095 ) ( ON ?auto_146091 ?auto_146097 ) ( not ( = ?auto_146091 ?auto_146097 ) ) ( not ( = ?auto_146092 ?auto_146097 ) ) ( not ( = ?auto_146093 ?auto_146097 ) ) ( not ( = ?auto_146094 ?auto_146097 ) ) ( not ( = ?auto_146095 ?auto_146097 ) ) ( not ( = ?auto_146096 ?auto_146097 ) ) ( not ( = ?auto_146099 ?auto_146097 ) ) ( not ( = ?auto_146098 ?auto_146097 ) ) ( ON ?auto_146092 ?auto_146091 ) ( CLEAR ?auto_146092 ) ( ON-TABLE ?auto_146097 ) ( HOLDING ?auto_146093 ) ( CLEAR ?auto_146094 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146098 ?auto_146099 ?auto_146096 ?auto_146095 ?auto_146094 ?auto_146093 )
      ( MAKE-6PILE ?auto_146091 ?auto_146092 ?auto_146093 ?auto_146094 ?auto_146095 ?auto_146096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146100 - BLOCK
      ?auto_146101 - BLOCK
      ?auto_146102 - BLOCK
      ?auto_146103 - BLOCK
      ?auto_146104 - BLOCK
      ?auto_146105 - BLOCK
    )
    :vars
    (
      ?auto_146106 - BLOCK
      ?auto_146107 - BLOCK
      ?auto_146108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146100 ?auto_146101 ) ) ( not ( = ?auto_146100 ?auto_146102 ) ) ( not ( = ?auto_146100 ?auto_146103 ) ) ( not ( = ?auto_146100 ?auto_146104 ) ) ( not ( = ?auto_146100 ?auto_146105 ) ) ( not ( = ?auto_146101 ?auto_146102 ) ) ( not ( = ?auto_146101 ?auto_146103 ) ) ( not ( = ?auto_146101 ?auto_146104 ) ) ( not ( = ?auto_146101 ?auto_146105 ) ) ( not ( = ?auto_146102 ?auto_146103 ) ) ( not ( = ?auto_146102 ?auto_146104 ) ) ( not ( = ?auto_146102 ?auto_146105 ) ) ( not ( = ?auto_146103 ?auto_146104 ) ) ( not ( = ?auto_146103 ?auto_146105 ) ) ( not ( = ?auto_146104 ?auto_146105 ) ) ( ON ?auto_146105 ?auto_146106 ) ( not ( = ?auto_146100 ?auto_146106 ) ) ( not ( = ?auto_146101 ?auto_146106 ) ) ( not ( = ?auto_146102 ?auto_146106 ) ) ( not ( = ?auto_146103 ?auto_146106 ) ) ( not ( = ?auto_146104 ?auto_146106 ) ) ( not ( = ?auto_146105 ?auto_146106 ) ) ( ON ?auto_146104 ?auto_146105 ) ( ON-TABLE ?auto_146107 ) ( ON ?auto_146106 ?auto_146107 ) ( not ( = ?auto_146107 ?auto_146106 ) ) ( not ( = ?auto_146107 ?auto_146105 ) ) ( not ( = ?auto_146107 ?auto_146104 ) ) ( not ( = ?auto_146100 ?auto_146107 ) ) ( not ( = ?auto_146101 ?auto_146107 ) ) ( not ( = ?auto_146102 ?auto_146107 ) ) ( not ( = ?auto_146103 ?auto_146107 ) ) ( ON ?auto_146103 ?auto_146104 ) ( ON ?auto_146100 ?auto_146108 ) ( not ( = ?auto_146100 ?auto_146108 ) ) ( not ( = ?auto_146101 ?auto_146108 ) ) ( not ( = ?auto_146102 ?auto_146108 ) ) ( not ( = ?auto_146103 ?auto_146108 ) ) ( not ( = ?auto_146104 ?auto_146108 ) ) ( not ( = ?auto_146105 ?auto_146108 ) ) ( not ( = ?auto_146106 ?auto_146108 ) ) ( not ( = ?auto_146107 ?auto_146108 ) ) ( ON ?auto_146101 ?auto_146100 ) ( ON-TABLE ?auto_146108 ) ( CLEAR ?auto_146103 ) ( ON ?auto_146102 ?auto_146101 ) ( CLEAR ?auto_146102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146108 ?auto_146100 ?auto_146101 )
      ( MAKE-6PILE ?auto_146100 ?auto_146101 ?auto_146102 ?auto_146103 ?auto_146104 ?auto_146105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146109 - BLOCK
      ?auto_146110 - BLOCK
      ?auto_146111 - BLOCK
      ?auto_146112 - BLOCK
      ?auto_146113 - BLOCK
      ?auto_146114 - BLOCK
    )
    :vars
    (
      ?auto_146117 - BLOCK
      ?auto_146115 - BLOCK
      ?auto_146116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146109 ?auto_146110 ) ) ( not ( = ?auto_146109 ?auto_146111 ) ) ( not ( = ?auto_146109 ?auto_146112 ) ) ( not ( = ?auto_146109 ?auto_146113 ) ) ( not ( = ?auto_146109 ?auto_146114 ) ) ( not ( = ?auto_146110 ?auto_146111 ) ) ( not ( = ?auto_146110 ?auto_146112 ) ) ( not ( = ?auto_146110 ?auto_146113 ) ) ( not ( = ?auto_146110 ?auto_146114 ) ) ( not ( = ?auto_146111 ?auto_146112 ) ) ( not ( = ?auto_146111 ?auto_146113 ) ) ( not ( = ?auto_146111 ?auto_146114 ) ) ( not ( = ?auto_146112 ?auto_146113 ) ) ( not ( = ?auto_146112 ?auto_146114 ) ) ( not ( = ?auto_146113 ?auto_146114 ) ) ( ON ?auto_146114 ?auto_146117 ) ( not ( = ?auto_146109 ?auto_146117 ) ) ( not ( = ?auto_146110 ?auto_146117 ) ) ( not ( = ?auto_146111 ?auto_146117 ) ) ( not ( = ?auto_146112 ?auto_146117 ) ) ( not ( = ?auto_146113 ?auto_146117 ) ) ( not ( = ?auto_146114 ?auto_146117 ) ) ( ON ?auto_146113 ?auto_146114 ) ( ON-TABLE ?auto_146115 ) ( ON ?auto_146117 ?auto_146115 ) ( not ( = ?auto_146115 ?auto_146117 ) ) ( not ( = ?auto_146115 ?auto_146114 ) ) ( not ( = ?auto_146115 ?auto_146113 ) ) ( not ( = ?auto_146109 ?auto_146115 ) ) ( not ( = ?auto_146110 ?auto_146115 ) ) ( not ( = ?auto_146111 ?auto_146115 ) ) ( not ( = ?auto_146112 ?auto_146115 ) ) ( ON ?auto_146109 ?auto_146116 ) ( not ( = ?auto_146109 ?auto_146116 ) ) ( not ( = ?auto_146110 ?auto_146116 ) ) ( not ( = ?auto_146111 ?auto_146116 ) ) ( not ( = ?auto_146112 ?auto_146116 ) ) ( not ( = ?auto_146113 ?auto_146116 ) ) ( not ( = ?auto_146114 ?auto_146116 ) ) ( not ( = ?auto_146117 ?auto_146116 ) ) ( not ( = ?auto_146115 ?auto_146116 ) ) ( ON ?auto_146110 ?auto_146109 ) ( ON-TABLE ?auto_146116 ) ( ON ?auto_146111 ?auto_146110 ) ( CLEAR ?auto_146111 ) ( HOLDING ?auto_146112 ) ( CLEAR ?auto_146113 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146115 ?auto_146117 ?auto_146114 ?auto_146113 ?auto_146112 )
      ( MAKE-6PILE ?auto_146109 ?auto_146110 ?auto_146111 ?auto_146112 ?auto_146113 ?auto_146114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146118 - BLOCK
      ?auto_146119 - BLOCK
      ?auto_146120 - BLOCK
      ?auto_146121 - BLOCK
      ?auto_146122 - BLOCK
      ?auto_146123 - BLOCK
    )
    :vars
    (
      ?auto_146125 - BLOCK
      ?auto_146124 - BLOCK
      ?auto_146126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146118 ?auto_146119 ) ) ( not ( = ?auto_146118 ?auto_146120 ) ) ( not ( = ?auto_146118 ?auto_146121 ) ) ( not ( = ?auto_146118 ?auto_146122 ) ) ( not ( = ?auto_146118 ?auto_146123 ) ) ( not ( = ?auto_146119 ?auto_146120 ) ) ( not ( = ?auto_146119 ?auto_146121 ) ) ( not ( = ?auto_146119 ?auto_146122 ) ) ( not ( = ?auto_146119 ?auto_146123 ) ) ( not ( = ?auto_146120 ?auto_146121 ) ) ( not ( = ?auto_146120 ?auto_146122 ) ) ( not ( = ?auto_146120 ?auto_146123 ) ) ( not ( = ?auto_146121 ?auto_146122 ) ) ( not ( = ?auto_146121 ?auto_146123 ) ) ( not ( = ?auto_146122 ?auto_146123 ) ) ( ON ?auto_146123 ?auto_146125 ) ( not ( = ?auto_146118 ?auto_146125 ) ) ( not ( = ?auto_146119 ?auto_146125 ) ) ( not ( = ?auto_146120 ?auto_146125 ) ) ( not ( = ?auto_146121 ?auto_146125 ) ) ( not ( = ?auto_146122 ?auto_146125 ) ) ( not ( = ?auto_146123 ?auto_146125 ) ) ( ON ?auto_146122 ?auto_146123 ) ( ON-TABLE ?auto_146124 ) ( ON ?auto_146125 ?auto_146124 ) ( not ( = ?auto_146124 ?auto_146125 ) ) ( not ( = ?auto_146124 ?auto_146123 ) ) ( not ( = ?auto_146124 ?auto_146122 ) ) ( not ( = ?auto_146118 ?auto_146124 ) ) ( not ( = ?auto_146119 ?auto_146124 ) ) ( not ( = ?auto_146120 ?auto_146124 ) ) ( not ( = ?auto_146121 ?auto_146124 ) ) ( ON ?auto_146118 ?auto_146126 ) ( not ( = ?auto_146118 ?auto_146126 ) ) ( not ( = ?auto_146119 ?auto_146126 ) ) ( not ( = ?auto_146120 ?auto_146126 ) ) ( not ( = ?auto_146121 ?auto_146126 ) ) ( not ( = ?auto_146122 ?auto_146126 ) ) ( not ( = ?auto_146123 ?auto_146126 ) ) ( not ( = ?auto_146125 ?auto_146126 ) ) ( not ( = ?auto_146124 ?auto_146126 ) ) ( ON ?auto_146119 ?auto_146118 ) ( ON-TABLE ?auto_146126 ) ( ON ?auto_146120 ?auto_146119 ) ( CLEAR ?auto_146122 ) ( ON ?auto_146121 ?auto_146120 ) ( CLEAR ?auto_146121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146126 ?auto_146118 ?auto_146119 ?auto_146120 )
      ( MAKE-6PILE ?auto_146118 ?auto_146119 ?auto_146120 ?auto_146121 ?auto_146122 ?auto_146123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146127 - BLOCK
      ?auto_146128 - BLOCK
      ?auto_146129 - BLOCK
      ?auto_146130 - BLOCK
      ?auto_146131 - BLOCK
      ?auto_146132 - BLOCK
    )
    :vars
    (
      ?auto_146135 - BLOCK
      ?auto_146134 - BLOCK
      ?auto_146133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146127 ?auto_146128 ) ) ( not ( = ?auto_146127 ?auto_146129 ) ) ( not ( = ?auto_146127 ?auto_146130 ) ) ( not ( = ?auto_146127 ?auto_146131 ) ) ( not ( = ?auto_146127 ?auto_146132 ) ) ( not ( = ?auto_146128 ?auto_146129 ) ) ( not ( = ?auto_146128 ?auto_146130 ) ) ( not ( = ?auto_146128 ?auto_146131 ) ) ( not ( = ?auto_146128 ?auto_146132 ) ) ( not ( = ?auto_146129 ?auto_146130 ) ) ( not ( = ?auto_146129 ?auto_146131 ) ) ( not ( = ?auto_146129 ?auto_146132 ) ) ( not ( = ?auto_146130 ?auto_146131 ) ) ( not ( = ?auto_146130 ?auto_146132 ) ) ( not ( = ?auto_146131 ?auto_146132 ) ) ( ON ?auto_146132 ?auto_146135 ) ( not ( = ?auto_146127 ?auto_146135 ) ) ( not ( = ?auto_146128 ?auto_146135 ) ) ( not ( = ?auto_146129 ?auto_146135 ) ) ( not ( = ?auto_146130 ?auto_146135 ) ) ( not ( = ?auto_146131 ?auto_146135 ) ) ( not ( = ?auto_146132 ?auto_146135 ) ) ( ON-TABLE ?auto_146134 ) ( ON ?auto_146135 ?auto_146134 ) ( not ( = ?auto_146134 ?auto_146135 ) ) ( not ( = ?auto_146134 ?auto_146132 ) ) ( not ( = ?auto_146134 ?auto_146131 ) ) ( not ( = ?auto_146127 ?auto_146134 ) ) ( not ( = ?auto_146128 ?auto_146134 ) ) ( not ( = ?auto_146129 ?auto_146134 ) ) ( not ( = ?auto_146130 ?auto_146134 ) ) ( ON ?auto_146127 ?auto_146133 ) ( not ( = ?auto_146127 ?auto_146133 ) ) ( not ( = ?auto_146128 ?auto_146133 ) ) ( not ( = ?auto_146129 ?auto_146133 ) ) ( not ( = ?auto_146130 ?auto_146133 ) ) ( not ( = ?auto_146131 ?auto_146133 ) ) ( not ( = ?auto_146132 ?auto_146133 ) ) ( not ( = ?auto_146135 ?auto_146133 ) ) ( not ( = ?auto_146134 ?auto_146133 ) ) ( ON ?auto_146128 ?auto_146127 ) ( ON-TABLE ?auto_146133 ) ( ON ?auto_146129 ?auto_146128 ) ( ON ?auto_146130 ?auto_146129 ) ( CLEAR ?auto_146130 ) ( HOLDING ?auto_146131 ) ( CLEAR ?auto_146132 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146134 ?auto_146135 ?auto_146132 ?auto_146131 )
      ( MAKE-6PILE ?auto_146127 ?auto_146128 ?auto_146129 ?auto_146130 ?auto_146131 ?auto_146132 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146136 - BLOCK
      ?auto_146137 - BLOCK
      ?auto_146138 - BLOCK
      ?auto_146139 - BLOCK
      ?auto_146140 - BLOCK
      ?auto_146141 - BLOCK
    )
    :vars
    (
      ?auto_146144 - BLOCK
      ?auto_146143 - BLOCK
      ?auto_146142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146136 ?auto_146137 ) ) ( not ( = ?auto_146136 ?auto_146138 ) ) ( not ( = ?auto_146136 ?auto_146139 ) ) ( not ( = ?auto_146136 ?auto_146140 ) ) ( not ( = ?auto_146136 ?auto_146141 ) ) ( not ( = ?auto_146137 ?auto_146138 ) ) ( not ( = ?auto_146137 ?auto_146139 ) ) ( not ( = ?auto_146137 ?auto_146140 ) ) ( not ( = ?auto_146137 ?auto_146141 ) ) ( not ( = ?auto_146138 ?auto_146139 ) ) ( not ( = ?auto_146138 ?auto_146140 ) ) ( not ( = ?auto_146138 ?auto_146141 ) ) ( not ( = ?auto_146139 ?auto_146140 ) ) ( not ( = ?auto_146139 ?auto_146141 ) ) ( not ( = ?auto_146140 ?auto_146141 ) ) ( ON ?auto_146141 ?auto_146144 ) ( not ( = ?auto_146136 ?auto_146144 ) ) ( not ( = ?auto_146137 ?auto_146144 ) ) ( not ( = ?auto_146138 ?auto_146144 ) ) ( not ( = ?auto_146139 ?auto_146144 ) ) ( not ( = ?auto_146140 ?auto_146144 ) ) ( not ( = ?auto_146141 ?auto_146144 ) ) ( ON-TABLE ?auto_146143 ) ( ON ?auto_146144 ?auto_146143 ) ( not ( = ?auto_146143 ?auto_146144 ) ) ( not ( = ?auto_146143 ?auto_146141 ) ) ( not ( = ?auto_146143 ?auto_146140 ) ) ( not ( = ?auto_146136 ?auto_146143 ) ) ( not ( = ?auto_146137 ?auto_146143 ) ) ( not ( = ?auto_146138 ?auto_146143 ) ) ( not ( = ?auto_146139 ?auto_146143 ) ) ( ON ?auto_146136 ?auto_146142 ) ( not ( = ?auto_146136 ?auto_146142 ) ) ( not ( = ?auto_146137 ?auto_146142 ) ) ( not ( = ?auto_146138 ?auto_146142 ) ) ( not ( = ?auto_146139 ?auto_146142 ) ) ( not ( = ?auto_146140 ?auto_146142 ) ) ( not ( = ?auto_146141 ?auto_146142 ) ) ( not ( = ?auto_146144 ?auto_146142 ) ) ( not ( = ?auto_146143 ?auto_146142 ) ) ( ON ?auto_146137 ?auto_146136 ) ( ON-TABLE ?auto_146142 ) ( ON ?auto_146138 ?auto_146137 ) ( ON ?auto_146139 ?auto_146138 ) ( CLEAR ?auto_146141 ) ( ON ?auto_146140 ?auto_146139 ) ( CLEAR ?auto_146140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146142 ?auto_146136 ?auto_146137 ?auto_146138 ?auto_146139 )
      ( MAKE-6PILE ?auto_146136 ?auto_146137 ?auto_146138 ?auto_146139 ?auto_146140 ?auto_146141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146145 - BLOCK
      ?auto_146146 - BLOCK
      ?auto_146147 - BLOCK
      ?auto_146148 - BLOCK
      ?auto_146149 - BLOCK
      ?auto_146150 - BLOCK
    )
    :vars
    (
      ?auto_146152 - BLOCK
      ?auto_146151 - BLOCK
      ?auto_146153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146145 ?auto_146146 ) ) ( not ( = ?auto_146145 ?auto_146147 ) ) ( not ( = ?auto_146145 ?auto_146148 ) ) ( not ( = ?auto_146145 ?auto_146149 ) ) ( not ( = ?auto_146145 ?auto_146150 ) ) ( not ( = ?auto_146146 ?auto_146147 ) ) ( not ( = ?auto_146146 ?auto_146148 ) ) ( not ( = ?auto_146146 ?auto_146149 ) ) ( not ( = ?auto_146146 ?auto_146150 ) ) ( not ( = ?auto_146147 ?auto_146148 ) ) ( not ( = ?auto_146147 ?auto_146149 ) ) ( not ( = ?auto_146147 ?auto_146150 ) ) ( not ( = ?auto_146148 ?auto_146149 ) ) ( not ( = ?auto_146148 ?auto_146150 ) ) ( not ( = ?auto_146149 ?auto_146150 ) ) ( not ( = ?auto_146145 ?auto_146152 ) ) ( not ( = ?auto_146146 ?auto_146152 ) ) ( not ( = ?auto_146147 ?auto_146152 ) ) ( not ( = ?auto_146148 ?auto_146152 ) ) ( not ( = ?auto_146149 ?auto_146152 ) ) ( not ( = ?auto_146150 ?auto_146152 ) ) ( ON-TABLE ?auto_146151 ) ( ON ?auto_146152 ?auto_146151 ) ( not ( = ?auto_146151 ?auto_146152 ) ) ( not ( = ?auto_146151 ?auto_146150 ) ) ( not ( = ?auto_146151 ?auto_146149 ) ) ( not ( = ?auto_146145 ?auto_146151 ) ) ( not ( = ?auto_146146 ?auto_146151 ) ) ( not ( = ?auto_146147 ?auto_146151 ) ) ( not ( = ?auto_146148 ?auto_146151 ) ) ( ON ?auto_146145 ?auto_146153 ) ( not ( = ?auto_146145 ?auto_146153 ) ) ( not ( = ?auto_146146 ?auto_146153 ) ) ( not ( = ?auto_146147 ?auto_146153 ) ) ( not ( = ?auto_146148 ?auto_146153 ) ) ( not ( = ?auto_146149 ?auto_146153 ) ) ( not ( = ?auto_146150 ?auto_146153 ) ) ( not ( = ?auto_146152 ?auto_146153 ) ) ( not ( = ?auto_146151 ?auto_146153 ) ) ( ON ?auto_146146 ?auto_146145 ) ( ON-TABLE ?auto_146153 ) ( ON ?auto_146147 ?auto_146146 ) ( ON ?auto_146148 ?auto_146147 ) ( ON ?auto_146149 ?auto_146148 ) ( CLEAR ?auto_146149 ) ( HOLDING ?auto_146150 ) ( CLEAR ?auto_146152 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146151 ?auto_146152 ?auto_146150 )
      ( MAKE-6PILE ?auto_146145 ?auto_146146 ?auto_146147 ?auto_146148 ?auto_146149 ?auto_146150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146154 - BLOCK
      ?auto_146155 - BLOCK
      ?auto_146156 - BLOCK
      ?auto_146157 - BLOCK
      ?auto_146158 - BLOCK
      ?auto_146159 - BLOCK
    )
    :vars
    (
      ?auto_146162 - BLOCK
      ?auto_146161 - BLOCK
      ?auto_146160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146154 ?auto_146155 ) ) ( not ( = ?auto_146154 ?auto_146156 ) ) ( not ( = ?auto_146154 ?auto_146157 ) ) ( not ( = ?auto_146154 ?auto_146158 ) ) ( not ( = ?auto_146154 ?auto_146159 ) ) ( not ( = ?auto_146155 ?auto_146156 ) ) ( not ( = ?auto_146155 ?auto_146157 ) ) ( not ( = ?auto_146155 ?auto_146158 ) ) ( not ( = ?auto_146155 ?auto_146159 ) ) ( not ( = ?auto_146156 ?auto_146157 ) ) ( not ( = ?auto_146156 ?auto_146158 ) ) ( not ( = ?auto_146156 ?auto_146159 ) ) ( not ( = ?auto_146157 ?auto_146158 ) ) ( not ( = ?auto_146157 ?auto_146159 ) ) ( not ( = ?auto_146158 ?auto_146159 ) ) ( not ( = ?auto_146154 ?auto_146162 ) ) ( not ( = ?auto_146155 ?auto_146162 ) ) ( not ( = ?auto_146156 ?auto_146162 ) ) ( not ( = ?auto_146157 ?auto_146162 ) ) ( not ( = ?auto_146158 ?auto_146162 ) ) ( not ( = ?auto_146159 ?auto_146162 ) ) ( ON-TABLE ?auto_146161 ) ( ON ?auto_146162 ?auto_146161 ) ( not ( = ?auto_146161 ?auto_146162 ) ) ( not ( = ?auto_146161 ?auto_146159 ) ) ( not ( = ?auto_146161 ?auto_146158 ) ) ( not ( = ?auto_146154 ?auto_146161 ) ) ( not ( = ?auto_146155 ?auto_146161 ) ) ( not ( = ?auto_146156 ?auto_146161 ) ) ( not ( = ?auto_146157 ?auto_146161 ) ) ( ON ?auto_146154 ?auto_146160 ) ( not ( = ?auto_146154 ?auto_146160 ) ) ( not ( = ?auto_146155 ?auto_146160 ) ) ( not ( = ?auto_146156 ?auto_146160 ) ) ( not ( = ?auto_146157 ?auto_146160 ) ) ( not ( = ?auto_146158 ?auto_146160 ) ) ( not ( = ?auto_146159 ?auto_146160 ) ) ( not ( = ?auto_146162 ?auto_146160 ) ) ( not ( = ?auto_146161 ?auto_146160 ) ) ( ON ?auto_146155 ?auto_146154 ) ( ON-TABLE ?auto_146160 ) ( ON ?auto_146156 ?auto_146155 ) ( ON ?auto_146157 ?auto_146156 ) ( ON ?auto_146158 ?auto_146157 ) ( CLEAR ?auto_146162 ) ( ON ?auto_146159 ?auto_146158 ) ( CLEAR ?auto_146159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146160 ?auto_146154 ?auto_146155 ?auto_146156 ?auto_146157 ?auto_146158 )
      ( MAKE-6PILE ?auto_146154 ?auto_146155 ?auto_146156 ?auto_146157 ?auto_146158 ?auto_146159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146163 - BLOCK
      ?auto_146164 - BLOCK
      ?auto_146165 - BLOCK
      ?auto_146166 - BLOCK
      ?auto_146167 - BLOCK
      ?auto_146168 - BLOCK
    )
    :vars
    (
      ?auto_146171 - BLOCK
      ?auto_146169 - BLOCK
      ?auto_146170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146163 ?auto_146164 ) ) ( not ( = ?auto_146163 ?auto_146165 ) ) ( not ( = ?auto_146163 ?auto_146166 ) ) ( not ( = ?auto_146163 ?auto_146167 ) ) ( not ( = ?auto_146163 ?auto_146168 ) ) ( not ( = ?auto_146164 ?auto_146165 ) ) ( not ( = ?auto_146164 ?auto_146166 ) ) ( not ( = ?auto_146164 ?auto_146167 ) ) ( not ( = ?auto_146164 ?auto_146168 ) ) ( not ( = ?auto_146165 ?auto_146166 ) ) ( not ( = ?auto_146165 ?auto_146167 ) ) ( not ( = ?auto_146165 ?auto_146168 ) ) ( not ( = ?auto_146166 ?auto_146167 ) ) ( not ( = ?auto_146166 ?auto_146168 ) ) ( not ( = ?auto_146167 ?auto_146168 ) ) ( not ( = ?auto_146163 ?auto_146171 ) ) ( not ( = ?auto_146164 ?auto_146171 ) ) ( not ( = ?auto_146165 ?auto_146171 ) ) ( not ( = ?auto_146166 ?auto_146171 ) ) ( not ( = ?auto_146167 ?auto_146171 ) ) ( not ( = ?auto_146168 ?auto_146171 ) ) ( ON-TABLE ?auto_146169 ) ( not ( = ?auto_146169 ?auto_146171 ) ) ( not ( = ?auto_146169 ?auto_146168 ) ) ( not ( = ?auto_146169 ?auto_146167 ) ) ( not ( = ?auto_146163 ?auto_146169 ) ) ( not ( = ?auto_146164 ?auto_146169 ) ) ( not ( = ?auto_146165 ?auto_146169 ) ) ( not ( = ?auto_146166 ?auto_146169 ) ) ( ON ?auto_146163 ?auto_146170 ) ( not ( = ?auto_146163 ?auto_146170 ) ) ( not ( = ?auto_146164 ?auto_146170 ) ) ( not ( = ?auto_146165 ?auto_146170 ) ) ( not ( = ?auto_146166 ?auto_146170 ) ) ( not ( = ?auto_146167 ?auto_146170 ) ) ( not ( = ?auto_146168 ?auto_146170 ) ) ( not ( = ?auto_146171 ?auto_146170 ) ) ( not ( = ?auto_146169 ?auto_146170 ) ) ( ON ?auto_146164 ?auto_146163 ) ( ON-TABLE ?auto_146170 ) ( ON ?auto_146165 ?auto_146164 ) ( ON ?auto_146166 ?auto_146165 ) ( ON ?auto_146167 ?auto_146166 ) ( ON ?auto_146168 ?auto_146167 ) ( CLEAR ?auto_146168 ) ( HOLDING ?auto_146171 ) ( CLEAR ?auto_146169 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146169 ?auto_146171 )
      ( MAKE-6PILE ?auto_146163 ?auto_146164 ?auto_146165 ?auto_146166 ?auto_146167 ?auto_146168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146172 - BLOCK
      ?auto_146173 - BLOCK
      ?auto_146174 - BLOCK
      ?auto_146175 - BLOCK
      ?auto_146176 - BLOCK
      ?auto_146177 - BLOCK
    )
    :vars
    (
      ?auto_146179 - BLOCK
      ?auto_146178 - BLOCK
      ?auto_146180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146172 ?auto_146173 ) ) ( not ( = ?auto_146172 ?auto_146174 ) ) ( not ( = ?auto_146172 ?auto_146175 ) ) ( not ( = ?auto_146172 ?auto_146176 ) ) ( not ( = ?auto_146172 ?auto_146177 ) ) ( not ( = ?auto_146173 ?auto_146174 ) ) ( not ( = ?auto_146173 ?auto_146175 ) ) ( not ( = ?auto_146173 ?auto_146176 ) ) ( not ( = ?auto_146173 ?auto_146177 ) ) ( not ( = ?auto_146174 ?auto_146175 ) ) ( not ( = ?auto_146174 ?auto_146176 ) ) ( not ( = ?auto_146174 ?auto_146177 ) ) ( not ( = ?auto_146175 ?auto_146176 ) ) ( not ( = ?auto_146175 ?auto_146177 ) ) ( not ( = ?auto_146176 ?auto_146177 ) ) ( not ( = ?auto_146172 ?auto_146179 ) ) ( not ( = ?auto_146173 ?auto_146179 ) ) ( not ( = ?auto_146174 ?auto_146179 ) ) ( not ( = ?auto_146175 ?auto_146179 ) ) ( not ( = ?auto_146176 ?auto_146179 ) ) ( not ( = ?auto_146177 ?auto_146179 ) ) ( ON-TABLE ?auto_146178 ) ( not ( = ?auto_146178 ?auto_146179 ) ) ( not ( = ?auto_146178 ?auto_146177 ) ) ( not ( = ?auto_146178 ?auto_146176 ) ) ( not ( = ?auto_146172 ?auto_146178 ) ) ( not ( = ?auto_146173 ?auto_146178 ) ) ( not ( = ?auto_146174 ?auto_146178 ) ) ( not ( = ?auto_146175 ?auto_146178 ) ) ( ON ?auto_146172 ?auto_146180 ) ( not ( = ?auto_146172 ?auto_146180 ) ) ( not ( = ?auto_146173 ?auto_146180 ) ) ( not ( = ?auto_146174 ?auto_146180 ) ) ( not ( = ?auto_146175 ?auto_146180 ) ) ( not ( = ?auto_146176 ?auto_146180 ) ) ( not ( = ?auto_146177 ?auto_146180 ) ) ( not ( = ?auto_146179 ?auto_146180 ) ) ( not ( = ?auto_146178 ?auto_146180 ) ) ( ON ?auto_146173 ?auto_146172 ) ( ON-TABLE ?auto_146180 ) ( ON ?auto_146174 ?auto_146173 ) ( ON ?auto_146175 ?auto_146174 ) ( ON ?auto_146176 ?auto_146175 ) ( ON ?auto_146177 ?auto_146176 ) ( CLEAR ?auto_146178 ) ( ON ?auto_146179 ?auto_146177 ) ( CLEAR ?auto_146179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146180 ?auto_146172 ?auto_146173 ?auto_146174 ?auto_146175 ?auto_146176 ?auto_146177 )
      ( MAKE-6PILE ?auto_146172 ?auto_146173 ?auto_146174 ?auto_146175 ?auto_146176 ?auto_146177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146181 - BLOCK
      ?auto_146182 - BLOCK
      ?auto_146183 - BLOCK
      ?auto_146184 - BLOCK
      ?auto_146185 - BLOCK
      ?auto_146186 - BLOCK
    )
    :vars
    (
      ?auto_146188 - BLOCK
      ?auto_146189 - BLOCK
      ?auto_146187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146181 ?auto_146182 ) ) ( not ( = ?auto_146181 ?auto_146183 ) ) ( not ( = ?auto_146181 ?auto_146184 ) ) ( not ( = ?auto_146181 ?auto_146185 ) ) ( not ( = ?auto_146181 ?auto_146186 ) ) ( not ( = ?auto_146182 ?auto_146183 ) ) ( not ( = ?auto_146182 ?auto_146184 ) ) ( not ( = ?auto_146182 ?auto_146185 ) ) ( not ( = ?auto_146182 ?auto_146186 ) ) ( not ( = ?auto_146183 ?auto_146184 ) ) ( not ( = ?auto_146183 ?auto_146185 ) ) ( not ( = ?auto_146183 ?auto_146186 ) ) ( not ( = ?auto_146184 ?auto_146185 ) ) ( not ( = ?auto_146184 ?auto_146186 ) ) ( not ( = ?auto_146185 ?auto_146186 ) ) ( not ( = ?auto_146181 ?auto_146188 ) ) ( not ( = ?auto_146182 ?auto_146188 ) ) ( not ( = ?auto_146183 ?auto_146188 ) ) ( not ( = ?auto_146184 ?auto_146188 ) ) ( not ( = ?auto_146185 ?auto_146188 ) ) ( not ( = ?auto_146186 ?auto_146188 ) ) ( not ( = ?auto_146189 ?auto_146188 ) ) ( not ( = ?auto_146189 ?auto_146186 ) ) ( not ( = ?auto_146189 ?auto_146185 ) ) ( not ( = ?auto_146181 ?auto_146189 ) ) ( not ( = ?auto_146182 ?auto_146189 ) ) ( not ( = ?auto_146183 ?auto_146189 ) ) ( not ( = ?auto_146184 ?auto_146189 ) ) ( ON ?auto_146181 ?auto_146187 ) ( not ( = ?auto_146181 ?auto_146187 ) ) ( not ( = ?auto_146182 ?auto_146187 ) ) ( not ( = ?auto_146183 ?auto_146187 ) ) ( not ( = ?auto_146184 ?auto_146187 ) ) ( not ( = ?auto_146185 ?auto_146187 ) ) ( not ( = ?auto_146186 ?auto_146187 ) ) ( not ( = ?auto_146188 ?auto_146187 ) ) ( not ( = ?auto_146189 ?auto_146187 ) ) ( ON ?auto_146182 ?auto_146181 ) ( ON-TABLE ?auto_146187 ) ( ON ?auto_146183 ?auto_146182 ) ( ON ?auto_146184 ?auto_146183 ) ( ON ?auto_146185 ?auto_146184 ) ( ON ?auto_146186 ?auto_146185 ) ( ON ?auto_146188 ?auto_146186 ) ( CLEAR ?auto_146188 ) ( HOLDING ?auto_146189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146189 )
      ( MAKE-6PILE ?auto_146181 ?auto_146182 ?auto_146183 ?auto_146184 ?auto_146185 ?auto_146186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146190 - BLOCK
      ?auto_146191 - BLOCK
      ?auto_146192 - BLOCK
      ?auto_146193 - BLOCK
      ?auto_146194 - BLOCK
      ?auto_146195 - BLOCK
    )
    :vars
    (
      ?auto_146198 - BLOCK
      ?auto_146197 - BLOCK
      ?auto_146196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146190 ?auto_146191 ) ) ( not ( = ?auto_146190 ?auto_146192 ) ) ( not ( = ?auto_146190 ?auto_146193 ) ) ( not ( = ?auto_146190 ?auto_146194 ) ) ( not ( = ?auto_146190 ?auto_146195 ) ) ( not ( = ?auto_146191 ?auto_146192 ) ) ( not ( = ?auto_146191 ?auto_146193 ) ) ( not ( = ?auto_146191 ?auto_146194 ) ) ( not ( = ?auto_146191 ?auto_146195 ) ) ( not ( = ?auto_146192 ?auto_146193 ) ) ( not ( = ?auto_146192 ?auto_146194 ) ) ( not ( = ?auto_146192 ?auto_146195 ) ) ( not ( = ?auto_146193 ?auto_146194 ) ) ( not ( = ?auto_146193 ?auto_146195 ) ) ( not ( = ?auto_146194 ?auto_146195 ) ) ( not ( = ?auto_146190 ?auto_146198 ) ) ( not ( = ?auto_146191 ?auto_146198 ) ) ( not ( = ?auto_146192 ?auto_146198 ) ) ( not ( = ?auto_146193 ?auto_146198 ) ) ( not ( = ?auto_146194 ?auto_146198 ) ) ( not ( = ?auto_146195 ?auto_146198 ) ) ( not ( = ?auto_146197 ?auto_146198 ) ) ( not ( = ?auto_146197 ?auto_146195 ) ) ( not ( = ?auto_146197 ?auto_146194 ) ) ( not ( = ?auto_146190 ?auto_146197 ) ) ( not ( = ?auto_146191 ?auto_146197 ) ) ( not ( = ?auto_146192 ?auto_146197 ) ) ( not ( = ?auto_146193 ?auto_146197 ) ) ( ON ?auto_146190 ?auto_146196 ) ( not ( = ?auto_146190 ?auto_146196 ) ) ( not ( = ?auto_146191 ?auto_146196 ) ) ( not ( = ?auto_146192 ?auto_146196 ) ) ( not ( = ?auto_146193 ?auto_146196 ) ) ( not ( = ?auto_146194 ?auto_146196 ) ) ( not ( = ?auto_146195 ?auto_146196 ) ) ( not ( = ?auto_146198 ?auto_146196 ) ) ( not ( = ?auto_146197 ?auto_146196 ) ) ( ON ?auto_146191 ?auto_146190 ) ( ON-TABLE ?auto_146196 ) ( ON ?auto_146192 ?auto_146191 ) ( ON ?auto_146193 ?auto_146192 ) ( ON ?auto_146194 ?auto_146193 ) ( ON ?auto_146195 ?auto_146194 ) ( ON ?auto_146198 ?auto_146195 ) ( ON ?auto_146197 ?auto_146198 ) ( CLEAR ?auto_146197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146196 ?auto_146190 ?auto_146191 ?auto_146192 ?auto_146193 ?auto_146194 ?auto_146195 ?auto_146198 )
      ( MAKE-6PILE ?auto_146190 ?auto_146191 ?auto_146192 ?auto_146193 ?auto_146194 ?auto_146195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146210 - BLOCK
    )
    :vars
    (
      ?auto_146211 - BLOCK
      ?auto_146213 - BLOCK
      ?auto_146212 - BLOCK
      ?auto_146216 - BLOCK
      ?auto_146217 - BLOCK
      ?auto_146215 - BLOCK
      ?auto_146214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146211 ?auto_146210 ) ( ON-TABLE ?auto_146210 ) ( not ( = ?auto_146210 ?auto_146211 ) ) ( not ( = ?auto_146210 ?auto_146213 ) ) ( not ( = ?auto_146210 ?auto_146212 ) ) ( not ( = ?auto_146211 ?auto_146213 ) ) ( not ( = ?auto_146211 ?auto_146212 ) ) ( not ( = ?auto_146213 ?auto_146212 ) ) ( ON ?auto_146213 ?auto_146211 ) ( CLEAR ?auto_146213 ) ( HOLDING ?auto_146212 ) ( CLEAR ?auto_146216 ) ( ON-TABLE ?auto_146217 ) ( ON ?auto_146215 ?auto_146217 ) ( ON ?auto_146214 ?auto_146215 ) ( ON ?auto_146216 ?auto_146214 ) ( not ( = ?auto_146217 ?auto_146215 ) ) ( not ( = ?auto_146217 ?auto_146214 ) ) ( not ( = ?auto_146217 ?auto_146216 ) ) ( not ( = ?auto_146217 ?auto_146212 ) ) ( not ( = ?auto_146215 ?auto_146214 ) ) ( not ( = ?auto_146215 ?auto_146216 ) ) ( not ( = ?auto_146215 ?auto_146212 ) ) ( not ( = ?auto_146214 ?auto_146216 ) ) ( not ( = ?auto_146214 ?auto_146212 ) ) ( not ( = ?auto_146216 ?auto_146212 ) ) ( not ( = ?auto_146210 ?auto_146216 ) ) ( not ( = ?auto_146210 ?auto_146217 ) ) ( not ( = ?auto_146210 ?auto_146215 ) ) ( not ( = ?auto_146210 ?auto_146214 ) ) ( not ( = ?auto_146211 ?auto_146216 ) ) ( not ( = ?auto_146211 ?auto_146217 ) ) ( not ( = ?auto_146211 ?auto_146215 ) ) ( not ( = ?auto_146211 ?auto_146214 ) ) ( not ( = ?auto_146213 ?auto_146216 ) ) ( not ( = ?auto_146213 ?auto_146217 ) ) ( not ( = ?auto_146213 ?auto_146215 ) ) ( not ( = ?auto_146213 ?auto_146214 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146217 ?auto_146215 ?auto_146214 ?auto_146216 ?auto_146212 )
      ( MAKE-1PILE ?auto_146210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146218 - BLOCK
    )
    :vars
    (
      ?auto_146220 - BLOCK
      ?auto_146221 - BLOCK
      ?auto_146223 - BLOCK
      ?auto_146219 - BLOCK
      ?auto_146222 - BLOCK
      ?auto_146225 - BLOCK
      ?auto_146224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146220 ?auto_146218 ) ( ON-TABLE ?auto_146218 ) ( not ( = ?auto_146218 ?auto_146220 ) ) ( not ( = ?auto_146218 ?auto_146221 ) ) ( not ( = ?auto_146218 ?auto_146223 ) ) ( not ( = ?auto_146220 ?auto_146221 ) ) ( not ( = ?auto_146220 ?auto_146223 ) ) ( not ( = ?auto_146221 ?auto_146223 ) ) ( ON ?auto_146221 ?auto_146220 ) ( CLEAR ?auto_146219 ) ( ON-TABLE ?auto_146222 ) ( ON ?auto_146225 ?auto_146222 ) ( ON ?auto_146224 ?auto_146225 ) ( ON ?auto_146219 ?auto_146224 ) ( not ( = ?auto_146222 ?auto_146225 ) ) ( not ( = ?auto_146222 ?auto_146224 ) ) ( not ( = ?auto_146222 ?auto_146219 ) ) ( not ( = ?auto_146222 ?auto_146223 ) ) ( not ( = ?auto_146225 ?auto_146224 ) ) ( not ( = ?auto_146225 ?auto_146219 ) ) ( not ( = ?auto_146225 ?auto_146223 ) ) ( not ( = ?auto_146224 ?auto_146219 ) ) ( not ( = ?auto_146224 ?auto_146223 ) ) ( not ( = ?auto_146219 ?auto_146223 ) ) ( not ( = ?auto_146218 ?auto_146219 ) ) ( not ( = ?auto_146218 ?auto_146222 ) ) ( not ( = ?auto_146218 ?auto_146225 ) ) ( not ( = ?auto_146218 ?auto_146224 ) ) ( not ( = ?auto_146220 ?auto_146219 ) ) ( not ( = ?auto_146220 ?auto_146222 ) ) ( not ( = ?auto_146220 ?auto_146225 ) ) ( not ( = ?auto_146220 ?auto_146224 ) ) ( not ( = ?auto_146221 ?auto_146219 ) ) ( not ( = ?auto_146221 ?auto_146222 ) ) ( not ( = ?auto_146221 ?auto_146225 ) ) ( not ( = ?auto_146221 ?auto_146224 ) ) ( ON ?auto_146223 ?auto_146221 ) ( CLEAR ?auto_146223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146218 ?auto_146220 ?auto_146221 )
      ( MAKE-1PILE ?auto_146218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146226 - BLOCK
    )
    :vars
    (
      ?auto_146233 - BLOCK
      ?auto_146228 - BLOCK
      ?auto_146230 - BLOCK
      ?auto_146227 - BLOCK
      ?auto_146229 - BLOCK
      ?auto_146232 - BLOCK
      ?auto_146231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146233 ?auto_146226 ) ( ON-TABLE ?auto_146226 ) ( not ( = ?auto_146226 ?auto_146233 ) ) ( not ( = ?auto_146226 ?auto_146228 ) ) ( not ( = ?auto_146226 ?auto_146230 ) ) ( not ( = ?auto_146233 ?auto_146228 ) ) ( not ( = ?auto_146233 ?auto_146230 ) ) ( not ( = ?auto_146228 ?auto_146230 ) ) ( ON ?auto_146228 ?auto_146233 ) ( ON-TABLE ?auto_146227 ) ( ON ?auto_146229 ?auto_146227 ) ( ON ?auto_146232 ?auto_146229 ) ( not ( = ?auto_146227 ?auto_146229 ) ) ( not ( = ?auto_146227 ?auto_146232 ) ) ( not ( = ?auto_146227 ?auto_146231 ) ) ( not ( = ?auto_146227 ?auto_146230 ) ) ( not ( = ?auto_146229 ?auto_146232 ) ) ( not ( = ?auto_146229 ?auto_146231 ) ) ( not ( = ?auto_146229 ?auto_146230 ) ) ( not ( = ?auto_146232 ?auto_146231 ) ) ( not ( = ?auto_146232 ?auto_146230 ) ) ( not ( = ?auto_146231 ?auto_146230 ) ) ( not ( = ?auto_146226 ?auto_146231 ) ) ( not ( = ?auto_146226 ?auto_146227 ) ) ( not ( = ?auto_146226 ?auto_146229 ) ) ( not ( = ?auto_146226 ?auto_146232 ) ) ( not ( = ?auto_146233 ?auto_146231 ) ) ( not ( = ?auto_146233 ?auto_146227 ) ) ( not ( = ?auto_146233 ?auto_146229 ) ) ( not ( = ?auto_146233 ?auto_146232 ) ) ( not ( = ?auto_146228 ?auto_146231 ) ) ( not ( = ?auto_146228 ?auto_146227 ) ) ( not ( = ?auto_146228 ?auto_146229 ) ) ( not ( = ?auto_146228 ?auto_146232 ) ) ( ON ?auto_146230 ?auto_146228 ) ( CLEAR ?auto_146230 ) ( HOLDING ?auto_146231 ) ( CLEAR ?auto_146232 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146227 ?auto_146229 ?auto_146232 ?auto_146231 )
      ( MAKE-1PILE ?auto_146226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146234 - BLOCK
    )
    :vars
    (
      ?auto_146238 - BLOCK
      ?auto_146236 - BLOCK
      ?auto_146239 - BLOCK
      ?auto_146237 - BLOCK
      ?auto_146235 - BLOCK
      ?auto_146240 - BLOCK
      ?auto_146241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146238 ?auto_146234 ) ( ON-TABLE ?auto_146234 ) ( not ( = ?auto_146234 ?auto_146238 ) ) ( not ( = ?auto_146234 ?auto_146236 ) ) ( not ( = ?auto_146234 ?auto_146239 ) ) ( not ( = ?auto_146238 ?auto_146236 ) ) ( not ( = ?auto_146238 ?auto_146239 ) ) ( not ( = ?auto_146236 ?auto_146239 ) ) ( ON ?auto_146236 ?auto_146238 ) ( ON-TABLE ?auto_146237 ) ( ON ?auto_146235 ?auto_146237 ) ( ON ?auto_146240 ?auto_146235 ) ( not ( = ?auto_146237 ?auto_146235 ) ) ( not ( = ?auto_146237 ?auto_146240 ) ) ( not ( = ?auto_146237 ?auto_146241 ) ) ( not ( = ?auto_146237 ?auto_146239 ) ) ( not ( = ?auto_146235 ?auto_146240 ) ) ( not ( = ?auto_146235 ?auto_146241 ) ) ( not ( = ?auto_146235 ?auto_146239 ) ) ( not ( = ?auto_146240 ?auto_146241 ) ) ( not ( = ?auto_146240 ?auto_146239 ) ) ( not ( = ?auto_146241 ?auto_146239 ) ) ( not ( = ?auto_146234 ?auto_146241 ) ) ( not ( = ?auto_146234 ?auto_146237 ) ) ( not ( = ?auto_146234 ?auto_146235 ) ) ( not ( = ?auto_146234 ?auto_146240 ) ) ( not ( = ?auto_146238 ?auto_146241 ) ) ( not ( = ?auto_146238 ?auto_146237 ) ) ( not ( = ?auto_146238 ?auto_146235 ) ) ( not ( = ?auto_146238 ?auto_146240 ) ) ( not ( = ?auto_146236 ?auto_146241 ) ) ( not ( = ?auto_146236 ?auto_146237 ) ) ( not ( = ?auto_146236 ?auto_146235 ) ) ( not ( = ?auto_146236 ?auto_146240 ) ) ( ON ?auto_146239 ?auto_146236 ) ( CLEAR ?auto_146240 ) ( ON ?auto_146241 ?auto_146239 ) ( CLEAR ?auto_146241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146234 ?auto_146238 ?auto_146236 ?auto_146239 )
      ( MAKE-1PILE ?auto_146234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146242 - BLOCK
    )
    :vars
    (
      ?auto_146248 - BLOCK
      ?auto_146245 - BLOCK
      ?auto_146249 - BLOCK
      ?auto_146247 - BLOCK
      ?auto_146246 - BLOCK
      ?auto_146244 - BLOCK
      ?auto_146243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146248 ?auto_146242 ) ( ON-TABLE ?auto_146242 ) ( not ( = ?auto_146242 ?auto_146248 ) ) ( not ( = ?auto_146242 ?auto_146245 ) ) ( not ( = ?auto_146242 ?auto_146249 ) ) ( not ( = ?auto_146248 ?auto_146245 ) ) ( not ( = ?auto_146248 ?auto_146249 ) ) ( not ( = ?auto_146245 ?auto_146249 ) ) ( ON ?auto_146245 ?auto_146248 ) ( ON-TABLE ?auto_146247 ) ( ON ?auto_146246 ?auto_146247 ) ( not ( = ?auto_146247 ?auto_146246 ) ) ( not ( = ?auto_146247 ?auto_146244 ) ) ( not ( = ?auto_146247 ?auto_146243 ) ) ( not ( = ?auto_146247 ?auto_146249 ) ) ( not ( = ?auto_146246 ?auto_146244 ) ) ( not ( = ?auto_146246 ?auto_146243 ) ) ( not ( = ?auto_146246 ?auto_146249 ) ) ( not ( = ?auto_146244 ?auto_146243 ) ) ( not ( = ?auto_146244 ?auto_146249 ) ) ( not ( = ?auto_146243 ?auto_146249 ) ) ( not ( = ?auto_146242 ?auto_146243 ) ) ( not ( = ?auto_146242 ?auto_146247 ) ) ( not ( = ?auto_146242 ?auto_146246 ) ) ( not ( = ?auto_146242 ?auto_146244 ) ) ( not ( = ?auto_146248 ?auto_146243 ) ) ( not ( = ?auto_146248 ?auto_146247 ) ) ( not ( = ?auto_146248 ?auto_146246 ) ) ( not ( = ?auto_146248 ?auto_146244 ) ) ( not ( = ?auto_146245 ?auto_146243 ) ) ( not ( = ?auto_146245 ?auto_146247 ) ) ( not ( = ?auto_146245 ?auto_146246 ) ) ( not ( = ?auto_146245 ?auto_146244 ) ) ( ON ?auto_146249 ?auto_146245 ) ( ON ?auto_146243 ?auto_146249 ) ( CLEAR ?auto_146243 ) ( HOLDING ?auto_146244 ) ( CLEAR ?auto_146246 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146247 ?auto_146246 ?auto_146244 )
      ( MAKE-1PILE ?auto_146242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146250 - BLOCK
    )
    :vars
    (
      ?auto_146257 - BLOCK
      ?auto_146253 - BLOCK
      ?auto_146252 - BLOCK
      ?auto_146254 - BLOCK
      ?auto_146256 - BLOCK
      ?auto_146251 - BLOCK
      ?auto_146255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146257 ?auto_146250 ) ( ON-TABLE ?auto_146250 ) ( not ( = ?auto_146250 ?auto_146257 ) ) ( not ( = ?auto_146250 ?auto_146253 ) ) ( not ( = ?auto_146250 ?auto_146252 ) ) ( not ( = ?auto_146257 ?auto_146253 ) ) ( not ( = ?auto_146257 ?auto_146252 ) ) ( not ( = ?auto_146253 ?auto_146252 ) ) ( ON ?auto_146253 ?auto_146257 ) ( ON-TABLE ?auto_146254 ) ( ON ?auto_146256 ?auto_146254 ) ( not ( = ?auto_146254 ?auto_146256 ) ) ( not ( = ?auto_146254 ?auto_146251 ) ) ( not ( = ?auto_146254 ?auto_146255 ) ) ( not ( = ?auto_146254 ?auto_146252 ) ) ( not ( = ?auto_146256 ?auto_146251 ) ) ( not ( = ?auto_146256 ?auto_146255 ) ) ( not ( = ?auto_146256 ?auto_146252 ) ) ( not ( = ?auto_146251 ?auto_146255 ) ) ( not ( = ?auto_146251 ?auto_146252 ) ) ( not ( = ?auto_146255 ?auto_146252 ) ) ( not ( = ?auto_146250 ?auto_146255 ) ) ( not ( = ?auto_146250 ?auto_146254 ) ) ( not ( = ?auto_146250 ?auto_146256 ) ) ( not ( = ?auto_146250 ?auto_146251 ) ) ( not ( = ?auto_146257 ?auto_146255 ) ) ( not ( = ?auto_146257 ?auto_146254 ) ) ( not ( = ?auto_146257 ?auto_146256 ) ) ( not ( = ?auto_146257 ?auto_146251 ) ) ( not ( = ?auto_146253 ?auto_146255 ) ) ( not ( = ?auto_146253 ?auto_146254 ) ) ( not ( = ?auto_146253 ?auto_146256 ) ) ( not ( = ?auto_146253 ?auto_146251 ) ) ( ON ?auto_146252 ?auto_146253 ) ( ON ?auto_146255 ?auto_146252 ) ( CLEAR ?auto_146256 ) ( ON ?auto_146251 ?auto_146255 ) ( CLEAR ?auto_146251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146250 ?auto_146257 ?auto_146253 ?auto_146252 ?auto_146255 )
      ( MAKE-1PILE ?auto_146250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146258 - BLOCK
    )
    :vars
    (
      ?auto_146262 - BLOCK
      ?auto_146259 - BLOCK
      ?auto_146265 - BLOCK
      ?auto_146260 - BLOCK
      ?auto_146263 - BLOCK
      ?auto_146264 - BLOCK
      ?auto_146261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146262 ?auto_146258 ) ( ON-TABLE ?auto_146258 ) ( not ( = ?auto_146258 ?auto_146262 ) ) ( not ( = ?auto_146258 ?auto_146259 ) ) ( not ( = ?auto_146258 ?auto_146265 ) ) ( not ( = ?auto_146262 ?auto_146259 ) ) ( not ( = ?auto_146262 ?auto_146265 ) ) ( not ( = ?auto_146259 ?auto_146265 ) ) ( ON ?auto_146259 ?auto_146262 ) ( ON-TABLE ?auto_146260 ) ( not ( = ?auto_146260 ?auto_146263 ) ) ( not ( = ?auto_146260 ?auto_146264 ) ) ( not ( = ?auto_146260 ?auto_146261 ) ) ( not ( = ?auto_146260 ?auto_146265 ) ) ( not ( = ?auto_146263 ?auto_146264 ) ) ( not ( = ?auto_146263 ?auto_146261 ) ) ( not ( = ?auto_146263 ?auto_146265 ) ) ( not ( = ?auto_146264 ?auto_146261 ) ) ( not ( = ?auto_146264 ?auto_146265 ) ) ( not ( = ?auto_146261 ?auto_146265 ) ) ( not ( = ?auto_146258 ?auto_146261 ) ) ( not ( = ?auto_146258 ?auto_146260 ) ) ( not ( = ?auto_146258 ?auto_146263 ) ) ( not ( = ?auto_146258 ?auto_146264 ) ) ( not ( = ?auto_146262 ?auto_146261 ) ) ( not ( = ?auto_146262 ?auto_146260 ) ) ( not ( = ?auto_146262 ?auto_146263 ) ) ( not ( = ?auto_146262 ?auto_146264 ) ) ( not ( = ?auto_146259 ?auto_146261 ) ) ( not ( = ?auto_146259 ?auto_146260 ) ) ( not ( = ?auto_146259 ?auto_146263 ) ) ( not ( = ?auto_146259 ?auto_146264 ) ) ( ON ?auto_146265 ?auto_146259 ) ( ON ?auto_146261 ?auto_146265 ) ( ON ?auto_146264 ?auto_146261 ) ( CLEAR ?auto_146264 ) ( HOLDING ?auto_146263 ) ( CLEAR ?auto_146260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146260 ?auto_146263 )
      ( MAKE-1PILE ?auto_146258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146266 - BLOCK
    )
    :vars
    (
      ?auto_146268 - BLOCK
      ?auto_146272 - BLOCK
      ?auto_146269 - BLOCK
      ?auto_146271 - BLOCK
      ?auto_146273 - BLOCK
      ?auto_146270 - BLOCK
      ?auto_146267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146268 ?auto_146266 ) ( ON-TABLE ?auto_146266 ) ( not ( = ?auto_146266 ?auto_146268 ) ) ( not ( = ?auto_146266 ?auto_146272 ) ) ( not ( = ?auto_146266 ?auto_146269 ) ) ( not ( = ?auto_146268 ?auto_146272 ) ) ( not ( = ?auto_146268 ?auto_146269 ) ) ( not ( = ?auto_146272 ?auto_146269 ) ) ( ON ?auto_146272 ?auto_146268 ) ( ON-TABLE ?auto_146271 ) ( not ( = ?auto_146271 ?auto_146273 ) ) ( not ( = ?auto_146271 ?auto_146270 ) ) ( not ( = ?auto_146271 ?auto_146267 ) ) ( not ( = ?auto_146271 ?auto_146269 ) ) ( not ( = ?auto_146273 ?auto_146270 ) ) ( not ( = ?auto_146273 ?auto_146267 ) ) ( not ( = ?auto_146273 ?auto_146269 ) ) ( not ( = ?auto_146270 ?auto_146267 ) ) ( not ( = ?auto_146270 ?auto_146269 ) ) ( not ( = ?auto_146267 ?auto_146269 ) ) ( not ( = ?auto_146266 ?auto_146267 ) ) ( not ( = ?auto_146266 ?auto_146271 ) ) ( not ( = ?auto_146266 ?auto_146273 ) ) ( not ( = ?auto_146266 ?auto_146270 ) ) ( not ( = ?auto_146268 ?auto_146267 ) ) ( not ( = ?auto_146268 ?auto_146271 ) ) ( not ( = ?auto_146268 ?auto_146273 ) ) ( not ( = ?auto_146268 ?auto_146270 ) ) ( not ( = ?auto_146272 ?auto_146267 ) ) ( not ( = ?auto_146272 ?auto_146271 ) ) ( not ( = ?auto_146272 ?auto_146273 ) ) ( not ( = ?auto_146272 ?auto_146270 ) ) ( ON ?auto_146269 ?auto_146272 ) ( ON ?auto_146267 ?auto_146269 ) ( ON ?auto_146270 ?auto_146267 ) ( CLEAR ?auto_146271 ) ( ON ?auto_146273 ?auto_146270 ) ( CLEAR ?auto_146273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146266 ?auto_146268 ?auto_146272 ?auto_146269 ?auto_146267 ?auto_146270 )
      ( MAKE-1PILE ?auto_146266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146274 - BLOCK
    )
    :vars
    (
      ?auto_146275 - BLOCK
      ?auto_146277 - BLOCK
      ?auto_146280 - BLOCK
      ?auto_146278 - BLOCK
      ?auto_146279 - BLOCK
      ?auto_146281 - BLOCK
      ?auto_146276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146275 ?auto_146274 ) ( ON-TABLE ?auto_146274 ) ( not ( = ?auto_146274 ?auto_146275 ) ) ( not ( = ?auto_146274 ?auto_146277 ) ) ( not ( = ?auto_146274 ?auto_146280 ) ) ( not ( = ?auto_146275 ?auto_146277 ) ) ( not ( = ?auto_146275 ?auto_146280 ) ) ( not ( = ?auto_146277 ?auto_146280 ) ) ( ON ?auto_146277 ?auto_146275 ) ( not ( = ?auto_146278 ?auto_146279 ) ) ( not ( = ?auto_146278 ?auto_146281 ) ) ( not ( = ?auto_146278 ?auto_146276 ) ) ( not ( = ?auto_146278 ?auto_146280 ) ) ( not ( = ?auto_146279 ?auto_146281 ) ) ( not ( = ?auto_146279 ?auto_146276 ) ) ( not ( = ?auto_146279 ?auto_146280 ) ) ( not ( = ?auto_146281 ?auto_146276 ) ) ( not ( = ?auto_146281 ?auto_146280 ) ) ( not ( = ?auto_146276 ?auto_146280 ) ) ( not ( = ?auto_146274 ?auto_146276 ) ) ( not ( = ?auto_146274 ?auto_146278 ) ) ( not ( = ?auto_146274 ?auto_146279 ) ) ( not ( = ?auto_146274 ?auto_146281 ) ) ( not ( = ?auto_146275 ?auto_146276 ) ) ( not ( = ?auto_146275 ?auto_146278 ) ) ( not ( = ?auto_146275 ?auto_146279 ) ) ( not ( = ?auto_146275 ?auto_146281 ) ) ( not ( = ?auto_146277 ?auto_146276 ) ) ( not ( = ?auto_146277 ?auto_146278 ) ) ( not ( = ?auto_146277 ?auto_146279 ) ) ( not ( = ?auto_146277 ?auto_146281 ) ) ( ON ?auto_146280 ?auto_146277 ) ( ON ?auto_146276 ?auto_146280 ) ( ON ?auto_146281 ?auto_146276 ) ( ON ?auto_146279 ?auto_146281 ) ( CLEAR ?auto_146279 ) ( HOLDING ?auto_146278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146278 )
      ( MAKE-1PILE ?auto_146274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146291 - BLOCK
    )
    :vars
    (
      ?auto_146295 - BLOCK
      ?auto_146294 - BLOCK
      ?auto_146293 - BLOCK
      ?auto_146292 - BLOCK
      ?auto_146296 - BLOCK
      ?auto_146297 - BLOCK
      ?auto_146298 - BLOCK
      ?auto_146299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146295 ?auto_146291 ) ( ON-TABLE ?auto_146291 ) ( not ( = ?auto_146291 ?auto_146295 ) ) ( not ( = ?auto_146291 ?auto_146294 ) ) ( not ( = ?auto_146291 ?auto_146293 ) ) ( not ( = ?auto_146295 ?auto_146294 ) ) ( not ( = ?auto_146295 ?auto_146293 ) ) ( not ( = ?auto_146294 ?auto_146293 ) ) ( ON ?auto_146294 ?auto_146295 ) ( not ( = ?auto_146292 ?auto_146296 ) ) ( not ( = ?auto_146292 ?auto_146297 ) ) ( not ( = ?auto_146292 ?auto_146298 ) ) ( not ( = ?auto_146292 ?auto_146293 ) ) ( not ( = ?auto_146296 ?auto_146297 ) ) ( not ( = ?auto_146296 ?auto_146298 ) ) ( not ( = ?auto_146296 ?auto_146293 ) ) ( not ( = ?auto_146297 ?auto_146298 ) ) ( not ( = ?auto_146297 ?auto_146293 ) ) ( not ( = ?auto_146298 ?auto_146293 ) ) ( not ( = ?auto_146291 ?auto_146298 ) ) ( not ( = ?auto_146291 ?auto_146292 ) ) ( not ( = ?auto_146291 ?auto_146296 ) ) ( not ( = ?auto_146291 ?auto_146297 ) ) ( not ( = ?auto_146295 ?auto_146298 ) ) ( not ( = ?auto_146295 ?auto_146292 ) ) ( not ( = ?auto_146295 ?auto_146296 ) ) ( not ( = ?auto_146295 ?auto_146297 ) ) ( not ( = ?auto_146294 ?auto_146298 ) ) ( not ( = ?auto_146294 ?auto_146292 ) ) ( not ( = ?auto_146294 ?auto_146296 ) ) ( not ( = ?auto_146294 ?auto_146297 ) ) ( ON ?auto_146293 ?auto_146294 ) ( ON ?auto_146298 ?auto_146293 ) ( ON ?auto_146297 ?auto_146298 ) ( ON ?auto_146296 ?auto_146297 ) ( CLEAR ?auto_146296 ) ( ON ?auto_146292 ?auto_146299 ) ( CLEAR ?auto_146292 ) ( HAND-EMPTY ) ( not ( = ?auto_146291 ?auto_146299 ) ) ( not ( = ?auto_146295 ?auto_146299 ) ) ( not ( = ?auto_146294 ?auto_146299 ) ) ( not ( = ?auto_146293 ?auto_146299 ) ) ( not ( = ?auto_146292 ?auto_146299 ) ) ( not ( = ?auto_146296 ?auto_146299 ) ) ( not ( = ?auto_146297 ?auto_146299 ) ) ( not ( = ?auto_146298 ?auto_146299 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146292 ?auto_146299 )
      ( MAKE-1PILE ?auto_146291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146300 - BLOCK
    )
    :vars
    (
      ?auto_146307 - BLOCK
      ?auto_146304 - BLOCK
      ?auto_146301 - BLOCK
      ?auto_146302 - BLOCK
      ?auto_146305 - BLOCK
      ?auto_146303 - BLOCK
      ?auto_146306 - BLOCK
      ?auto_146308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146307 ?auto_146300 ) ( ON-TABLE ?auto_146300 ) ( not ( = ?auto_146300 ?auto_146307 ) ) ( not ( = ?auto_146300 ?auto_146304 ) ) ( not ( = ?auto_146300 ?auto_146301 ) ) ( not ( = ?auto_146307 ?auto_146304 ) ) ( not ( = ?auto_146307 ?auto_146301 ) ) ( not ( = ?auto_146304 ?auto_146301 ) ) ( ON ?auto_146304 ?auto_146307 ) ( not ( = ?auto_146302 ?auto_146305 ) ) ( not ( = ?auto_146302 ?auto_146303 ) ) ( not ( = ?auto_146302 ?auto_146306 ) ) ( not ( = ?auto_146302 ?auto_146301 ) ) ( not ( = ?auto_146305 ?auto_146303 ) ) ( not ( = ?auto_146305 ?auto_146306 ) ) ( not ( = ?auto_146305 ?auto_146301 ) ) ( not ( = ?auto_146303 ?auto_146306 ) ) ( not ( = ?auto_146303 ?auto_146301 ) ) ( not ( = ?auto_146306 ?auto_146301 ) ) ( not ( = ?auto_146300 ?auto_146306 ) ) ( not ( = ?auto_146300 ?auto_146302 ) ) ( not ( = ?auto_146300 ?auto_146305 ) ) ( not ( = ?auto_146300 ?auto_146303 ) ) ( not ( = ?auto_146307 ?auto_146306 ) ) ( not ( = ?auto_146307 ?auto_146302 ) ) ( not ( = ?auto_146307 ?auto_146305 ) ) ( not ( = ?auto_146307 ?auto_146303 ) ) ( not ( = ?auto_146304 ?auto_146306 ) ) ( not ( = ?auto_146304 ?auto_146302 ) ) ( not ( = ?auto_146304 ?auto_146305 ) ) ( not ( = ?auto_146304 ?auto_146303 ) ) ( ON ?auto_146301 ?auto_146304 ) ( ON ?auto_146306 ?auto_146301 ) ( ON ?auto_146303 ?auto_146306 ) ( ON ?auto_146302 ?auto_146308 ) ( CLEAR ?auto_146302 ) ( not ( = ?auto_146300 ?auto_146308 ) ) ( not ( = ?auto_146307 ?auto_146308 ) ) ( not ( = ?auto_146304 ?auto_146308 ) ) ( not ( = ?auto_146301 ?auto_146308 ) ) ( not ( = ?auto_146302 ?auto_146308 ) ) ( not ( = ?auto_146305 ?auto_146308 ) ) ( not ( = ?auto_146303 ?auto_146308 ) ) ( not ( = ?auto_146306 ?auto_146308 ) ) ( HOLDING ?auto_146305 ) ( CLEAR ?auto_146303 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146300 ?auto_146307 ?auto_146304 ?auto_146301 ?auto_146306 ?auto_146303 ?auto_146305 )
      ( MAKE-1PILE ?auto_146300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146309 - BLOCK
    )
    :vars
    (
      ?auto_146311 - BLOCK
      ?auto_146316 - BLOCK
      ?auto_146310 - BLOCK
      ?auto_146314 - BLOCK
      ?auto_146312 - BLOCK
      ?auto_146317 - BLOCK
      ?auto_146315 - BLOCK
      ?auto_146313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146311 ?auto_146309 ) ( ON-TABLE ?auto_146309 ) ( not ( = ?auto_146309 ?auto_146311 ) ) ( not ( = ?auto_146309 ?auto_146316 ) ) ( not ( = ?auto_146309 ?auto_146310 ) ) ( not ( = ?auto_146311 ?auto_146316 ) ) ( not ( = ?auto_146311 ?auto_146310 ) ) ( not ( = ?auto_146316 ?auto_146310 ) ) ( ON ?auto_146316 ?auto_146311 ) ( not ( = ?auto_146314 ?auto_146312 ) ) ( not ( = ?auto_146314 ?auto_146317 ) ) ( not ( = ?auto_146314 ?auto_146315 ) ) ( not ( = ?auto_146314 ?auto_146310 ) ) ( not ( = ?auto_146312 ?auto_146317 ) ) ( not ( = ?auto_146312 ?auto_146315 ) ) ( not ( = ?auto_146312 ?auto_146310 ) ) ( not ( = ?auto_146317 ?auto_146315 ) ) ( not ( = ?auto_146317 ?auto_146310 ) ) ( not ( = ?auto_146315 ?auto_146310 ) ) ( not ( = ?auto_146309 ?auto_146315 ) ) ( not ( = ?auto_146309 ?auto_146314 ) ) ( not ( = ?auto_146309 ?auto_146312 ) ) ( not ( = ?auto_146309 ?auto_146317 ) ) ( not ( = ?auto_146311 ?auto_146315 ) ) ( not ( = ?auto_146311 ?auto_146314 ) ) ( not ( = ?auto_146311 ?auto_146312 ) ) ( not ( = ?auto_146311 ?auto_146317 ) ) ( not ( = ?auto_146316 ?auto_146315 ) ) ( not ( = ?auto_146316 ?auto_146314 ) ) ( not ( = ?auto_146316 ?auto_146312 ) ) ( not ( = ?auto_146316 ?auto_146317 ) ) ( ON ?auto_146310 ?auto_146316 ) ( ON ?auto_146315 ?auto_146310 ) ( ON ?auto_146317 ?auto_146315 ) ( ON ?auto_146314 ?auto_146313 ) ( not ( = ?auto_146309 ?auto_146313 ) ) ( not ( = ?auto_146311 ?auto_146313 ) ) ( not ( = ?auto_146316 ?auto_146313 ) ) ( not ( = ?auto_146310 ?auto_146313 ) ) ( not ( = ?auto_146314 ?auto_146313 ) ) ( not ( = ?auto_146312 ?auto_146313 ) ) ( not ( = ?auto_146317 ?auto_146313 ) ) ( not ( = ?auto_146315 ?auto_146313 ) ) ( CLEAR ?auto_146317 ) ( ON ?auto_146312 ?auto_146314 ) ( CLEAR ?auto_146312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146313 ?auto_146314 )
      ( MAKE-1PILE ?auto_146309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146318 - BLOCK
    )
    :vars
    (
      ?auto_146322 - BLOCK
      ?auto_146323 - BLOCK
      ?auto_146326 - BLOCK
      ?auto_146324 - BLOCK
      ?auto_146321 - BLOCK
      ?auto_146319 - BLOCK
      ?auto_146320 - BLOCK
      ?auto_146325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146322 ?auto_146318 ) ( ON-TABLE ?auto_146318 ) ( not ( = ?auto_146318 ?auto_146322 ) ) ( not ( = ?auto_146318 ?auto_146323 ) ) ( not ( = ?auto_146318 ?auto_146326 ) ) ( not ( = ?auto_146322 ?auto_146323 ) ) ( not ( = ?auto_146322 ?auto_146326 ) ) ( not ( = ?auto_146323 ?auto_146326 ) ) ( ON ?auto_146323 ?auto_146322 ) ( not ( = ?auto_146324 ?auto_146321 ) ) ( not ( = ?auto_146324 ?auto_146319 ) ) ( not ( = ?auto_146324 ?auto_146320 ) ) ( not ( = ?auto_146324 ?auto_146326 ) ) ( not ( = ?auto_146321 ?auto_146319 ) ) ( not ( = ?auto_146321 ?auto_146320 ) ) ( not ( = ?auto_146321 ?auto_146326 ) ) ( not ( = ?auto_146319 ?auto_146320 ) ) ( not ( = ?auto_146319 ?auto_146326 ) ) ( not ( = ?auto_146320 ?auto_146326 ) ) ( not ( = ?auto_146318 ?auto_146320 ) ) ( not ( = ?auto_146318 ?auto_146324 ) ) ( not ( = ?auto_146318 ?auto_146321 ) ) ( not ( = ?auto_146318 ?auto_146319 ) ) ( not ( = ?auto_146322 ?auto_146320 ) ) ( not ( = ?auto_146322 ?auto_146324 ) ) ( not ( = ?auto_146322 ?auto_146321 ) ) ( not ( = ?auto_146322 ?auto_146319 ) ) ( not ( = ?auto_146323 ?auto_146320 ) ) ( not ( = ?auto_146323 ?auto_146324 ) ) ( not ( = ?auto_146323 ?auto_146321 ) ) ( not ( = ?auto_146323 ?auto_146319 ) ) ( ON ?auto_146326 ?auto_146323 ) ( ON ?auto_146320 ?auto_146326 ) ( ON ?auto_146324 ?auto_146325 ) ( not ( = ?auto_146318 ?auto_146325 ) ) ( not ( = ?auto_146322 ?auto_146325 ) ) ( not ( = ?auto_146323 ?auto_146325 ) ) ( not ( = ?auto_146326 ?auto_146325 ) ) ( not ( = ?auto_146324 ?auto_146325 ) ) ( not ( = ?auto_146321 ?auto_146325 ) ) ( not ( = ?auto_146319 ?auto_146325 ) ) ( not ( = ?auto_146320 ?auto_146325 ) ) ( ON ?auto_146321 ?auto_146324 ) ( CLEAR ?auto_146321 ) ( ON-TABLE ?auto_146325 ) ( HOLDING ?auto_146319 ) ( CLEAR ?auto_146320 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146318 ?auto_146322 ?auto_146323 ?auto_146326 ?auto_146320 ?auto_146319 )
      ( MAKE-1PILE ?auto_146318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146327 - BLOCK
    )
    :vars
    (
      ?auto_146329 - BLOCK
      ?auto_146330 - BLOCK
      ?auto_146334 - BLOCK
      ?auto_146328 - BLOCK
      ?auto_146331 - BLOCK
      ?auto_146335 - BLOCK
      ?auto_146333 - BLOCK
      ?auto_146332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146329 ?auto_146327 ) ( ON-TABLE ?auto_146327 ) ( not ( = ?auto_146327 ?auto_146329 ) ) ( not ( = ?auto_146327 ?auto_146330 ) ) ( not ( = ?auto_146327 ?auto_146334 ) ) ( not ( = ?auto_146329 ?auto_146330 ) ) ( not ( = ?auto_146329 ?auto_146334 ) ) ( not ( = ?auto_146330 ?auto_146334 ) ) ( ON ?auto_146330 ?auto_146329 ) ( not ( = ?auto_146328 ?auto_146331 ) ) ( not ( = ?auto_146328 ?auto_146335 ) ) ( not ( = ?auto_146328 ?auto_146333 ) ) ( not ( = ?auto_146328 ?auto_146334 ) ) ( not ( = ?auto_146331 ?auto_146335 ) ) ( not ( = ?auto_146331 ?auto_146333 ) ) ( not ( = ?auto_146331 ?auto_146334 ) ) ( not ( = ?auto_146335 ?auto_146333 ) ) ( not ( = ?auto_146335 ?auto_146334 ) ) ( not ( = ?auto_146333 ?auto_146334 ) ) ( not ( = ?auto_146327 ?auto_146333 ) ) ( not ( = ?auto_146327 ?auto_146328 ) ) ( not ( = ?auto_146327 ?auto_146331 ) ) ( not ( = ?auto_146327 ?auto_146335 ) ) ( not ( = ?auto_146329 ?auto_146333 ) ) ( not ( = ?auto_146329 ?auto_146328 ) ) ( not ( = ?auto_146329 ?auto_146331 ) ) ( not ( = ?auto_146329 ?auto_146335 ) ) ( not ( = ?auto_146330 ?auto_146333 ) ) ( not ( = ?auto_146330 ?auto_146328 ) ) ( not ( = ?auto_146330 ?auto_146331 ) ) ( not ( = ?auto_146330 ?auto_146335 ) ) ( ON ?auto_146334 ?auto_146330 ) ( ON ?auto_146333 ?auto_146334 ) ( ON ?auto_146328 ?auto_146332 ) ( not ( = ?auto_146327 ?auto_146332 ) ) ( not ( = ?auto_146329 ?auto_146332 ) ) ( not ( = ?auto_146330 ?auto_146332 ) ) ( not ( = ?auto_146334 ?auto_146332 ) ) ( not ( = ?auto_146328 ?auto_146332 ) ) ( not ( = ?auto_146331 ?auto_146332 ) ) ( not ( = ?auto_146335 ?auto_146332 ) ) ( not ( = ?auto_146333 ?auto_146332 ) ) ( ON ?auto_146331 ?auto_146328 ) ( ON-TABLE ?auto_146332 ) ( CLEAR ?auto_146333 ) ( ON ?auto_146335 ?auto_146331 ) ( CLEAR ?auto_146335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146332 ?auto_146328 ?auto_146331 )
      ( MAKE-1PILE ?auto_146327 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146379 - BLOCK
      ?auto_146380 - BLOCK
      ?auto_146381 - BLOCK
      ?auto_146382 - BLOCK
      ?auto_146383 - BLOCK
      ?auto_146384 - BLOCK
      ?auto_146385 - BLOCK
    )
    :vars
    (
      ?auto_146386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146379 ) ( ON ?auto_146380 ?auto_146379 ) ( ON ?auto_146381 ?auto_146380 ) ( ON ?auto_146382 ?auto_146381 ) ( ON ?auto_146383 ?auto_146382 ) ( not ( = ?auto_146379 ?auto_146380 ) ) ( not ( = ?auto_146379 ?auto_146381 ) ) ( not ( = ?auto_146379 ?auto_146382 ) ) ( not ( = ?auto_146379 ?auto_146383 ) ) ( not ( = ?auto_146379 ?auto_146384 ) ) ( not ( = ?auto_146379 ?auto_146385 ) ) ( not ( = ?auto_146380 ?auto_146381 ) ) ( not ( = ?auto_146380 ?auto_146382 ) ) ( not ( = ?auto_146380 ?auto_146383 ) ) ( not ( = ?auto_146380 ?auto_146384 ) ) ( not ( = ?auto_146380 ?auto_146385 ) ) ( not ( = ?auto_146381 ?auto_146382 ) ) ( not ( = ?auto_146381 ?auto_146383 ) ) ( not ( = ?auto_146381 ?auto_146384 ) ) ( not ( = ?auto_146381 ?auto_146385 ) ) ( not ( = ?auto_146382 ?auto_146383 ) ) ( not ( = ?auto_146382 ?auto_146384 ) ) ( not ( = ?auto_146382 ?auto_146385 ) ) ( not ( = ?auto_146383 ?auto_146384 ) ) ( not ( = ?auto_146383 ?auto_146385 ) ) ( not ( = ?auto_146384 ?auto_146385 ) ) ( ON ?auto_146385 ?auto_146386 ) ( not ( = ?auto_146379 ?auto_146386 ) ) ( not ( = ?auto_146380 ?auto_146386 ) ) ( not ( = ?auto_146381 ?auto_146386 ) ) ( not ( = ?auto_146382 ?auto_146386 ) ) ( not ( = ?auto_146383 ?auto_146386 ) ) ( not ( = ?auto_146384 ?auto_146386 ) ) ( not ( = ?auto_146385 ?auto_146386 ) ) ( CLEAR ?auto_146383 ) ( ON ?auto_146384 ?auto_146385 ) ( CLEAR ?auto_146384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146386 ?auto_146385 )
      ( MAKE-7PILE ?auto_146379 ?auto_146380 ?auto_146381 ?auto_146382 ?auto_146383 ?auto_146384 ?auto_146385 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146387 - BLOCK
      ?auto_146388 - BLOCK
      ?auto_146389 - BLOCK
      ?auto_146390 - BLOCK
      ?auto_146391 - BLOCK
      ?auto_146392 - BLOCK
      ?auto_146393 - BLOCK
    )
    :vars
    (
      ?auto_146394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146387 ) ( ON ?auto_146388 ?auto_146387 ) ( ON ?auto_146389 ?auto_146388 ) ( ON ?auto_146390 ?auto_146389 ) ( not ( = ?auto_146387 ?auto_146388 ) ) ( not ( = ?auto_146387 ?auto_146389 ) ) ( not ( = ?auto_146387 ?auto_146390 ) ) ( not ( = ?auto_146387 ?auto_146391 ) ) ( not ( = ?auto_146387 ?auto_146392 ) ) ( not ( = ?auto_146387 ?auto_146393 ) ) ( not ( = ?auto_146388 ?auto_146389 ) ) ( not ( = ?auto_146388 ?auto_146390 ) ) ( not ( = ?auto_146388 ?auto_146391 ) ) ( not ( = ?auto_146388 ?auto_146392 ) ) ( not ( = ?auto_146388 ?auto_146393 ) ) ( not ( = ?auto_146389 ?auto_146390 ) ) ( not ( = ?auto_146389 ?auto_146391 ) ) ( not ( = ?auto_146389 ?auto_146392 ) ) ( not ( = ?auto_146389 ?auto_146393 ) ) ( not ( = ?auto_146390 ?auto_146391 ) ) ( not ( = ?auto_146390 ?auto_146392 ) ) ( not ( = ?auto_146390 ?auto_146393 ) ) ( not ( = ?auto_146391 ?auto_146392 ) ) ( not ( = ?auto_146391 ?auto_146393 ) ) ( not ( = ?auto_146392 ?auto_146393 ) ) ( ON ?auto_146393 ?auto_146394 ) ( not ( = ?auto_146387 ?auto_146394 ) ) ( not ( = ?auto_146388 ?auto_146394 ) ) ( not ( = ?auto_146389 ?auto_146394 ) ) ( not ( = ?auto_146390 ?auto_146394 ) ) ( not ( = ?auto_146391 ?auto_146394 ) ) ( not ( = ?auto_146392 ?auto_146394 ) ) ( not ( = ?auto_146393 ?auto_146394 ) ) ( ON ?auto_146392 ?auto_146393 ) ( CLEAR ?auto_146392 ) ( ON-TABLE ?auto_146394 ) ( HOLDING ?auto_146391 ) ( CLEAR ?auto_146390 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146387 ?auto_146388 ?auto_146389 ?auto_146390 ?auto_146391 )
      ( MAKE-7PILE ?auto_146387 ?auto_146388 ?auto_146389 ?auto_146390 ?auto_146391 ?auto_146392 ?auto_146393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146395 - BLOCK
      ?auto_146396 - BLOCK
      ?auto_146397 - BLOCK
      ?auto_146398 - BLOCK
      ?auto_146399 - BLOCK
      ?auto_146400 - BLOCK
      ?auto_146401 - BLOCK
    )
    :vars
    (
      ?auto_146402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146395 ) ( ON ?auto_146396 ?auto_146395 ) ( ON ?auto_146397 ?auto_146396 ) ( ON ?auto_146398 ?auto_146397 ) ( not ( = ?auto_146395 ?auto_146396 ) ) ( not ( = ?auto_146395 ?auto_146397 ) ) ( not ( = ?auto_146395 ?auto_146398 ) ) ( not ( = ?auto_146395 ?auto_146399 ) ) ( not ( = ?auto_146395 ?auto_146400 ) ) ( not ( = ?auto_146395 ?auto_146401 ) ) ( not ( = ?auto_146396 ?auto_146397 ) ) ( not ( = ?auto_146396 ?auto_146398 ) ) ( not ( = ?auto_146396 ?auto_146399 ) ) ( not ( = ?auto_146396 ?auto_146400 ) ) ( not ( = ?auto_146396 ?auto_146401 ) ) ( not ( = ?auto_146397 ?auto_146398 ) ) ( not ( = ?auto_146397 ?auto_146399 ) ) ( not ( = ?auto_146397 ?auto_146400 ) ) ( not ( = ?auto_146397 ?auto_146401 ) ) ( not ( = ?auto_146398 ?auto_146399 ) ) ( not ( = ?auto_146398 ?auto_146400 ) ) ( not ( = ?auto_146398 ?auto_146401 ) ) ( not ( = ?auto_146399 ?auto_146400 ) ) ( not ( = ?auto_146399 ?auto_146401 ) ) ( not ( = ?auto_146400 ?auto_146401 ) ) ( ON ?auto_146401 ?auto_146402 ) ( not ( = ?auto_146395 ?auto_146402 ) ) ( not ( = ?auto_146396 ?auto_146402 ) ) ( not ( = ?auto_146397 ?auto_146402 ) ) ( not ( = ?auto_146398 ?auto_146402 ) ) ( not ( = ?auto_146399 ?auto_146402 ) ) ( not ( = ?auto_146400 ?auto_146402 ) ) ( not ( = ?auto_146401 ?auto_146402 ) ) ( ON ?auto_146400 ?auto_146401 ) ( ON-TABLE ?auto_146402 ) ( CLEAR ?auto_146398 ) ( ON ?auto_146399 ?auto_146400 ) ( CLEAR ?auto_146399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146402 ?auto_146401 ?auto_146400 )
      ( MAKE-7PILE ?auto_146395 ?auto_146396 ?auto_146397 ?auto_146398 ?auto_146399 ?auto_146400 ?auto_146401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146403 - BLOCK
      ?auto_146404 - BLOCK
      ?auto_146405 - BLOCK
      ?auto_146406 - BLOCK
      ?auto_146407 - BLOCK
      ?auto_146408 - BLOCK
      ?auto_146409 - BLOCK
    )
    :vars
    (
      ?auto_146410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146403 ) ( ON ?auto_146404 ?auto_146403 ) ( ON ?auto_146405 ?auto_146404 ) ( not ( = ?auto_146403 ?auto_146404 ) ) ( not ( = ?auto_146403 ?auto_146405 ) ) ( not ( = ?auto_146403 ?auto_146406 ) ) ( not ( = ?auto_146403 ?auto_146407 ) ) ( not ( = ?auto_146403 ?auto_146408 ) ) ( not ( = ?auto_146403 ?auto_146409 ) ) ( not ( = ?auto_146404 ?auto_146405 ) ) ( not ( = ?auto_146404 ?auto_146406 ) ) ( not ( = ?auto_146404 ?auto_146407 ) ) ( not ( = ?auto_146404 ?auto_146408 ) ) ( not ( = ?auto_146404 ?auto_146409 ) ) ( not ( = ?auto_146405 ?auto_146406 ) ) ( not ( = ?auto_146405 ?auto_146407 ) ) ( not ( = ?auto_146405 ?auto_146408 ) ) ( not ( = ?auto_146405 ?auto_146409 ) ) ( not ( = ?auto_146406 ?auto_146407 ) ) ( not ( = ?auto_146406 ?auto_146408 ) ) ( not ( = ?auto_146406 ?auto_146409 ) ) ( not ( = ?auto_146407 ?auto_146408 ) ) ( not ( = ?auto_146407 ?auto_146409 ) ) ( not ( = ?auto_146408 ?auto_146409 ) ) ( ON ?auto_146409 ?auto_146410 ) ( not ( = ?auto_146403 ?auto_146410 ) ) ( not ( = ?auto_146404 ?auto_146410 ) ) ( not ( = ?auto_146405 ?auto_146410 ) ) ( not ( = ?auto_146406 ?auto_146410 ) ) ( not ( = ?auto_146407 ?auto_146410 ) ) ( not ( = ?auto_146408 ?auto_146410 ) ) ( not ( = ?auto_146409 ?auto_146410 ) ) ( ON ?auto_146408 ?auto_146409 ) ( ON-TABLE ?auto_146410 ) ( ON ?auto_146407 ?auto_146408 ) ( CLEAR ?auto_146407 ) ( HOLDING ?auto_146406 ) ( CLEAR ?auto_146405 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146403 ?auto_146404 ?auto_146405 ?auto_146406 )
      ( MAKE-7PILE ?auto_146403 ?auto_146404 ?auto_146405 ?auto_146406 ?auto_146407 ?auto_146408 ?auto_146409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146411 - BLOCK
      ?auto_146412 - BLOCK
      ?auto_146413 - BLOCK
      ?auto_146414 - BLOCK
      ?auto_146415 - BLOCK
      ?auto_146416 - BLOCK
      ?auto_146417 - BLOCK
    )
    :vars
    (
      ?auto_146418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146411 ) ( ON ?auto_146412 ?auto_146411 ) ( ON ?auto_146413 ?auto_146412 ) ( not ( = ?auto_146411 ?auto_146412 ) ) ( not ( = ?auto_146411 ?auto_146413 ) ) ( not ( = ?auto_146411 ?auto_146414 ) ) ( not ( = ?auto_146411 ?auto_146415 ) ) ( not ( = ?auto_146411 ?auto_146416 ) ) ( not ( = ?auto_146411 ?auto_146417 ) ) ( not ( = ?auto_146412 ?auto_146413 ) ) ( not ( = ?auto_146412 ?auto_146414 ) ) ( not ( = ?auto_146412 ?auto_146415 ) ) ( not ( = ?auto_146412 ?auto_146416 ) ) ( not ( = ?auto_146412 ?auto_146417 ) ) ( not ( = ?auto_146413 ?auto_146414 ) ) ( not ( = ?auto_146413 ?auto_146415 ) ) ( not ( = ?auto_146413 ?auto_146416 ) ) ( not ( = ?auto_146413 ?auto_146417 ) ) ( not ( = ?auto_146414 ?auto_146415 ) ) ( not ( = ?auto_146414 ?auto_146416 ) ) ( not ( = ?auto_146414 ?auto_146417 ) ) ( not ( = ?auto_146415 ?auto_146416 ) ) ( not ( = ?auto_146415 ?auto_146417 ) ) ( not ( = ?auto_146416 ?auto_146417 ) ) ( ON ?auto_146417 ?auto_146418 ) ( not ( = ?auto_146411 ?auto_146418 ) ) ( not ( = ?auto_146412 ?auto_146418 ) ) ( not ( = ?auto_146413 ?auto_146418 ) ) ( not ( = ?auto_146414 ?auto_146418 ) ) ( not ( = ?auto_146415 ?auto_146418 ) ) ( not ( = ?auto_146416 ?auto_146418 ) ) ( not ( = ?auto_146417 ?auto_146418 ) ) ( ON ?auto_146416 ?auto_146417 ) ( ON-TABLE ?auto_146418 ) ( ON ?auto_146415 ?auto_146416 ) ( CLEAR ?auto_146413 ) ( ON ?auto_146414 ?auto_146415 ) ( CLEAR ?auto_146414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146418 ?auto_146417 ?auto_146416 ?auto_146415 )
      ( MAKE-7PILE ?auto_146411 ?auto_146412 ?auto_146413 ?auto_146414 ?auto_146415 ?auto_146416 ?auto_146417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146419 - BLOCK
      ?auto_146420 - BLOCK
      ?auto_146421 - BLOCK
      ?auto_146422 - BLOCK
      ?auto_146423 - BLOCK
      ?auto_146424 - BLOCK
      ?auto_146425 - BLOCK
    )
    :vars
    (
      ?auto_146426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146419 ) ( ON ?auto_146420 ?auto_146419 ) ( not ( = ?auto_146419 ?auto_146420 ) ) ( not ( = ?auto_146419 ?auto_146421 ) ) ( not ( = ?auto_146419 ?auto_146422 ) ) ( not ( = ?auto_146419 ?auto_146423 ) ) ( not ( = ?auto_146419 ?auto_146424 ) ) ( not ( = ?auto_146419 ?auto_146425 ) ) ( not ( = ?auto_146420 ?auto_146421 ) ) ( not ( = ?auto_146420 ?auto_146422 ) ) ( not ( = ?auto_146420 ?auto_146423 ) ) ( not ( = ?auto_146420 ?auto_146424 ) ) ( not ( = ?auto_146420 ?auto_146425 ) ) ( not ( = ?auto_146421 ?auto_146422 ) ) ( not ( = ?auto_146421 ?auto_146423 ) ) ( not ( = ?auto_146421 ?auto_146424 ) ) ( not ( = ?auto_146421 ?auto_146425 ) ) ( not ( = ?auto_146422 ?auto_146423 ) ) ( not ( = ?auto_146422 ?auto_146424 ) ) ( not ( = ?auto_146422 ?auto_146425 ) ) ( not ( = ?auto_146423 ?auto_146424 ) ) ( not ( = ?auto_146423 ?auto_146425 ) ) ( not ( = ?auto_146424 ?auto_146425 ) ) ( ON ?auto_146425 ?auto_146426 ) ( not ( = ?auto_146419 ?auto_146426 ) ) ( not ( = ?auto_146420 ?auto_146426 ) ) ( not ( = ?auto_146421 ?auto_146426 ) ) ( not ( = ?auto_146422 ?auto_146426 ) ) ( not ( = ?auto_146423 ?auto_146426 ) ) ( not ( = ?auto_146424 ?auto_146426 ) ) ( not ( = ?auto_146425 ?auto_146426 ) ) ( ON ?auto_146424 ?auto_146425 ) ( ON-TABLE ?auto_146426 ) ( ON ?auto_146423 ?auto_146424 ) ( ON ?auto_146422 ?auto_146423 ) ( CLEAR ?auto_146422 ) ( HOLDING ?auto_146421 ) ( CLEAR ?auto_146420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146419 ?auto_146420 ?auto_146421 )
      ( MAKE-7PILE ?auto_146419 ?auto_146420 ?auto_146421 ?auto_146422 ?auto_146423 ?auto_146424 ?auto_146425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146427 - BLOCK
      ?auto_146428 - BLOCK
      ?auto_146429 - BLOCK
      ?auto_146430 - BLOCK
      ?auto_146431 - BLOCK
      ?auto_146432 - BLOCK
      ?auto_146433 - BLOCK
    )
    :vars
    (
      ?auto_146434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146427 ) ( ON ?auto_146428 ?auto_146427 ) ( not ( = ?auto_146427 ?auto_146428 ) ) ( not ( = ?auto_146427 ?auto_146429 ) ) ( not ( = ?auto_146427 ?auto_146430 ) ) ( not ( = ?auto_146427 ?auto_146431 ) ) ( not ( = ?auto_146427 ?auto_146432 ) ) ( not ( = ?auto_146427 ?auto_146433 ) ) ( not ( = ?auto_146428 ?auto_146429 ) ) ( not ( = ?auto_146428 ?auto_146430 ) ) ( not ( = ?auto_146428 ?auto_146431 ) ) ( not ( = ?auto_146428 ?auto_146432 ) ) ( not ( = ?auto_146428 ?auto_146433 ) ) ( not ( = ?auto_146429 ?auto_146430 ) ) ( not ( = ?auto_146429 ?auto_146431 ) ) ( not ( = ?auto_146429 ?auto_146432 ) ) ( not ( = ?auto_146429 ?auto_146433 ) ) ( not ( = ?auto_146430 ?auto_146431 ) ) ( not ( = ?auto_146430 ?auto_146432 ) ) ( not ( = ?auto_146430 ?auto_146433 ) ) ( not ( = ?auto_146431 ?auto_146432 ) ) ( not ( = ?auto_146431 ?auto_146433 ) ) ( not ( = ?auto_146432 ?auto_146433 ) ) ( ON ?auto_146433 ?auto_146434 ) ( not ( = ?auto_146427 ?auto_146434 ) ) ( not ( = ?auto_146428 ?auto_146434 ) ) ( not ( = ?auto_146429 ?auto_146434 ) ) ( not ( = ?auto_146430 ?auto_146434 ) ) ( not ( = ?auto_146431 ?auto_146434 ) ) ( not ( = ?auto_146432 ?auto_146434 ) ) ( not ( = ?auto_146433 ?auto_146434 ) ) ( ON ?auto_146432 ?auto_146433 ) ( ON-TABLE ?auto_146434 ) ( ON ?auto_146431 ?auto_146432 ) ( ON ?auto_146430 ?auto_146431 ) ( CLEAR ?auto_146428 ) ( ON ?auto_146429 ?auto_146430 ) ( CLEAR ?auto_146429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146434 ?auto_146433 ?auto_146432 ?auto_146431 ?auto_146430 )
      ( MAKE-7PILE ?auto_146427 ?auto_146428 ?auto_146429 ?auto_146430 ?auto_146431 ?auto_146432 ?auto_146433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146435 - BLOCK
      ?auto_146436 - BLOCK
      ?auto_146437 - BLOCK
      ?auto_146438 - BLOCK
      ?auto_146439 - BLOCK
      ?auto_146440 - BLOCK
      ?auto_146441 - BLOCK
    )
    :vars
    (
      ?auto_146442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146435 ) ( not ( = ?auto_146435 ?auto_146436 ) ) ( not ( = ?auto_146435 ?auto_146437 ) ) ( not ( = ?auto_146435 ?auto_146438 ) ) ( not ( = ?auto_146435 ?auto_146439 ) ) ( not ( = ?auto_146435 ?auto_146440 ) ) ( not ( = ?auto_146435 ?auto_146441 ) ) ( not ( = ?auto_146436 ?auto_146437 ) ) ( not ( = ?auto_146436 ?auto_146438 ) ) ( not ( = ?auto_146436 ?auto_146439 ) ) ( not ( = ?auto_146436 ?auto_146440 ) ) ( not ( = ?auto_146436 ?auto_146441 ) ) ( not ( = ?auto_146437 ?auto_146438 ) ) ( not ( = ?auto_146437 ?auto_146439 ) ) ( not ( = ?auto_146437 ?auto_146440 ) ) ( not ( = ?auto_146437 ?auto_146441 ) ) ( not ( = ?auto_146438 ?auto_146439 ) ) ( not ( = ?auto_146438 ?auto_146440 ) ) ( not ( = ?auto_146438 ?auto_146441 ) ) ( not ( = ?auto_146439 ?auto_146440 ) ) ( not ( = ?auto_146439 ?auto_146441 ) ) ( not ( = ?auto_146440 ?auto_146441 ) ) ( ON ?auto_146441 ?auto_146442 ) ( not ( = ?auto_146435 ?auto_146442 ) ) ( not ( = ?auto_146436 ?auto_146442 ) ) ( not ( = ?auto_146437 ?auto_146442 ) ) ( not ( = ?auto_146438 ?auto_146442 ) ) ( not ( = ?auto_146439 ?auto_146442 ) ) ( not ( = ?auto_146440 ?auto_146442 ) ) ( not ( = ?auto_146441 ?auto_146442 ) ) ( ON ?auto_146440 ?auto_146441 ) ( ON-TABLE ?auto_146442 ) ( ON ?auto_146439 ?auto_146440 ) ( ON ?auto_146438 ?auto_146439 ) ( ON ?auto_146437 ?auto_146438 ) ( CLEAR ?auto_146437 ) ( HOLDING ?auto_146436 ) ( CLEAR ?auto_146435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146435 ?auto_146436 )
      ( MAKE-7PILE ?auto_146435 ?auto_146436 ?auto_146437 ?auto_146438 ?auto_146439 ?auto_146440 ?auto_146441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146443 - BLOCK
      ?auto_146444 - BLOCK
      ?auto_146445 - BLOCK
      ?auto_146446 - BLOCK
      ?auto_146447 - BLOCK
      ?auto_146448 - BLOCK
      ?auto_146449 - BLOCK
    )
    :vars
    (
      ?auto_146450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146443 ) ( not ( = ?auto_146443 ?auto_146444 ) ) ( not ( = ?auto_146443 ?auto_146445 ) ) ( not ( = ?auto_146443 ?auto_146446 ) ) ( not ( = ?auto_146443 ?auto_146447 ) ) ( not ( = ?auto_146443 ?auto_146448 ) ) ( not ( = ?auto_146443 ?auto_146449 ) ) ( not ( = ?auto_146444 ?auto_146445 ) ) ( not ( = ?auto_146444 ?auto_146446 ) ) ( not ( = ?auto_146444 ?auto_146447 ) ) ( not ( = ?auto_146444 ?auto_146448 ) ) ( not ( = ?auto_146444 ?auto_146449 ) ) ( not ( = ?auto_146445 ?auto_146446 ) ) ( not ( = ?auto_146445 ?auto_146447 ) ) ( not ( = ?auto_146445 ?auto_146448 ) ) ( not ( = ?auto_146445 ?auto_146449 ) ) ( not ( = ?auto_146446 ?auto_146447 ) ) ( not ( = ?auto_146446 ?auto_146448 ) ) ( not ( = ?auto_146446 ?auto_146449 ) ) ( not ( = ?auto_146447 ?auto_146448 ) ) ( not ( = ?auto_146447 ?auto_146449 ) ) ( not ( = ?auto_146448 ?auto_146449 ) ) ( ON ?auto_146449 ?auto_146450 ) ( not ( = ?auto_146443 ?auto_146450 ) ) ( not ( = ?auto_146444 ?auto_146450 ) ) ( not ( = ?auto_146445 ?auto_146450 ) ) ( not ( = ?auto_146446 ?auto_146450 ) ) ( not ( = ?auto_146447 ?auto_146450 ) ) ( not ( = ?auto_146448 ?auto_146450 ) ) ( not ( = ?auto_146449 ?auto_146450 ) ) ( ON ?auto_146448 ?auto_146449 ) ( ON-TABLE ?auto_146450 ) ( ON ?auto_146447 ?auto_146448 ) ( ON ?auto_146446 ?auto_146447 ) ( ON ?auto_146445 ?auto_146446 ) ( CLEAR ?auto_146443 ) ( ON ?auto_146444 ?auto_146445 ) ( CLEAR ?auto_146444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146450 ?auto_146449 ?auto_146448 ?auto_146447 ?auto_146446 ?auto_146445 )
      ( MAKE-7PILE ?auto_146443 ?auto_146444 ?auto_146445 ?auto_146446 ?auto_146447 ?auto_146448 ?auto_146449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146451 - BLOCK
      ?auto_146452 - BLOCK
      ?auto_146453 - BLOCK
      ?auto_146454 - BLOCK
      ?auto_146455 - BLOCK
      ?auto_146456 - BLOCK
      ?auto_146457 - BLOCK
    )
    :vars
    (
      ?auto_146458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146451 ?auto_146452 ) ) ( not ( = ?auto_146451 ?auto_146453 ) ) ( not ( = ?auto_146451 ?auto_146454 ) ) ( not ( = ?auto_146451 ?auto_146455 ) ) ( not ( = ?auto_146451 ?auto_146456 ) ) ( not ( = ?auto_146451 ?auto_146457 ) ) ( not ( = ?auto_146452 ?auto_146453 ) ) ( not ( = ?auto_146452 ?auto_146454 ) ) ( not ( = ?auto_146452 ?auto_146455 ) ) ( not ( = ?auto_146452 ?auto_146456 ) ) ( not ( = ?auto_146452 ?auto_146457 ) ) ( not ( = ?auto_146453 ?auto_146454 ) ) ( not ( = ?auto_146453 ?auto_146455 ) ) ( not ( = ?auto_146453 ?auto_146456 ) ) ( not ( = ?auto_146453 ?auto_146457 ) ) ( not ( = ?auto_146454 ?auto_146455 ) ) ( not ( = ?auto_146454 ?auto_146456 ) ) ( not ( = ?auto_146454 ?auto_146457 ) ) ( not ( = ?auto_146455 ?auto_146456 ) ) ( not ( = ?auto_146455 ?auto_146457 ) ) ( not ( = ?auto_146456 ?auto_146457 ) ) ( ON ?auto_146457 ?auto_146458 ) ( not ( = ?auto_146451 ?auto_146458 ) ) ( not ( = ?auto_146452 ?auto_146458 ) ) ( not ( = ?auto_146453 ?auto_146458 ) ) ( not ( = ?auto_146454 ?auto_146458 ) ) ( not ( = ?auto_146455 ?auto_146458 ) ) ( not ( = ?auto_146456 ?auto_146458 ) ) ( not ( = ?auto_146457 ?auto_146458 ) ) ( ON ?auto_146456 ?auto_146457 ) ( ON-TABLE ?auto_146458 ) ( ON ?auto_146455 ?auto_146456 ) ( ON ?auto_146454 ?auto_146455 ) ( ON ?auto_146453 ?auto_146454 ) ( ON ?auto_146452 ?auto_146453 ) ( CLEAR ?auto_146452 ) ( HOLDING ?auto_146451 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146451 )
      ( MAKE-7PILE ?auto_146451 ?auto_146452 ?auto_146453 ?auto_146454 ?auto_146455 ?auto_146456 ?auto_146457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146459 - BLOCK
      ?auto_146460 - BLOCK
      ?auto_146461 - BLOCK
      ?auto_146462 - BLOCK
      ?auto_146463 - BLOCK
      ?auto_146464 - BLOCK
      ?auto_146465 - BLOCK
    )
    :vars
    (
      ?auto_146466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146459 ?auto_146460 ) ) ( not ( = ?auto_146459 ?auto_146461 ) ) ( not ( = ?auto_146459 ?auto_146462 ) ) ( not ( = ?auto_146459 ?auto_146463 ) ) ( not ( = ?auto_146459 ?auto_146464 ) ) ( not ( = ?auto_146459 ?auto_146465 ) ) ( not ( = ?auto_146460 ?auto_146461 ) ) ( not ( = ?auto_146460 ?auto_146462 ) ) ( not ( = ?auto_146460 ?auto_146463 ) ) ( not ( = ?auto_146460 ?auto_146464 ) ) ( not ( = ?auto_146460 ?auto_146465 ) ) ( not ( = ?auto_146461 ?auto_146462 ) ) ( not ( = ?auto_146461 ?auto_146463 ) ) ( not ( = ?auto_146461 ?auto_146464 ) ) ( not ( = ?auto_146461 ?auto_146465 ) ) ( not ( = ?auto_146462 ?auto_146463 ) ) ( not ( = ?auto_146462 ?auto_146464 ) ) ( not ( = ?auto_146462 ?auto_146465 ) ) ( not ( = ?auto_146463 ?auto_146464 ) ) ( not ( = ?auto_146463 ?auto_146465 ) ) ( not ( = ?auto_146464 ?auto_146465 ) ) ( ON ?auto_146465 ?auto_146466 ) ( not ( = ?auto_146459 ?auto_146466 ) ) ( not ( = ?auto_146460 ?auto_146466 ) ) ( not ( = ?auto_146461 ?auto_146466 ) ) ( not ( = ?auto_146462 ?auto_146466 ) ) ( not ( = ?auto_146463 ?auto_146466 ) ) ( not ( = ?auto_146464 ?auto_146466 ) ) ( not ( = ?auto_146465 ?auto_146466 ) ) ( ON ?auto_146464 ?auto_146465 ) ( ON-TABLE ?auto_146466 ) ( ON ?auto_146463 ?auto_146464 ) ( ON ?auto_146462 ?auto_146463 ) ( ON ?auto_146461 ?auto_146462 ) ( ON ?auto_146460 ?auto_146461 ) ( ON ?auto_146459 ?auto_146460 ) ( CLEAR ?auto_146459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146466 ?auto_146465 ?auto_146464 ?auto_146463 ?auto_146462 ?auto_146461 ?auto_146460 )
      ( MAKE-7PILE ?auto_146459 ?auto_146460 ?auto_146461 ?auto_146462 ?auto_146463 ?auto_146464 ?auto_146465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146474 - BLOCK
      ?auto_146475 - BLOCK
      ?auto_146476 - BLOCK
      ?auto_146477 - BLOCK
      ?auto_146478 - BLOCK
      ?auto_146479 - BLOCK
      ?auto_146480 - BLOCK
    )
    :vars
    (
      ?auto_146481 - BLOCK
      ?auto_146482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146474 ?auto_146475 ) ) ( not ( = ?auto_146474 ?auto_146476 ) ) ( not ( = ?auto_146474 ?auto_146477 ) ) ( not ( = ?auto_146474 ?auto_146478 ) ) ( not ( = ?auto_146474 ?auto_146479 ) ) ( not ( = ?auto_146474 ?auto_146480 ) ) ( not ( = ?auto_146475 ?auto_146476 ) ) ( not ( = ?auto_146475 ?auto_146477 ) ) ( not ( = ?auto_146475 ?auto_146478 ) ) ( not ( = ?auto_146475 ?auto_146479 ) ) ( not ( = ?auto_146475 ?auto_146480 ) ) ( not ( = ?auto_146476 ?auto_146477 ) ) ( not ( = ?auto_146476 ?auto_146478 ) ) ( not ( = ?auto_146476 ?auto_146479 ) ) ( not ( = ?auto_146476 ?auto_146480 ) ) ( not ( = ?auto_146477 ?auto_146478 ) ) ( not ( = ?auto_146477 ?auto_146479 ) ) ( not ( = ?auto_146477 ?auto_146480 ) ) ( not ( = ?auto_146478 ?auto_146479 ) ) ( not ( = ?auto_146478 ?auto_146480 ) ) ( not ( = ?auto_146479 ?auto_146480 ) ) ( ON ?auto_146480 ?auto_146481 ) ( not ( = ?auto_146474 ?auto_146481 ) ) ( not ( = ?auto_146475 ?auto_146481 ) ) ( not ( = ?auto_146476 ?auto_146481 ) ) ( not ( = ?auto_146477 ?auto_146481 ) ) ( not ( = ?auto_146478 ?auto_146481 ) ) ( not ( = ?auto_146479 ?auto_146481 ) ) ( not ( = ?auto_146480 ?auto_146481 ) ) ( ON ?auto_146479 ?auto_146480 ) ( ON-TABLE ?auto_146481 ) ( ON ?auto_146478 ?auto_146479 ) ( ON ?auto_146477 ?auto_146478 ) ( ON ?auto_146476 ?auto_146477 ) ( ON ?auto_146475 ?auto_146476 ) ( CLEAR ?auto_146475 ) ( ON ?auto_146474 ?auto_146482 ) ( CLEAR ?auto_146474 ) ( HAND-EMPTY ) ( not ( = ?auto_146474 ?auto_146482 ) ) ( not ( = ?auto_146475 ?auto_146482 ) ) ( not ( = ?auto_146476 ?auto_146482 ) ) ( not ( = ?auto_146477 ?auto_146482 ) ) ( not ( = ?auto_146478 ?auto_146482 ) ) ( not ( = ?auto_146479 ?auto_146482 ) ) ( not ( = ?auto_146480 ?auto_146482 ) ) ( not ( = ?auto_146481 ?auto_146482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146474 ?auto_146482 )
      ( MAKE-7PILE ?auto_146474 ?auto_146475 ?auto_146476 ?auto_146477 ?auto_146478 ?auto_146479 ?auto_146480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146483 - BLOCK
      ?auto_146484 - BLOCK
      ?auto_146485 - BLOCK
      ?auto_146486 - BLOCK
      ?auto_146487 - BLOCK
      ?auto_146488 - BLOCK
      ?auto_146489 - BLOCK
    )
    :vars
    (
      ?auto_146490 - BLOCK
      ?auto_146491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146483 ?auto_146484 ) ) ( not ( = ?auto_146483 ?auto_146485 ) ) ( not ( = ?auto_146483 ?auto_146486 ) ) ( not ( = ?auto_146483 ?auto_146487 ) ) ( not ( = ?auto_146483 ?auto_146488 ) ) ( not ( = ?auto_146483 ?auto_146489 ) ) ( not ( = ?auto_146484 ?auto_146485 ) ) ( not ( = ?auto_146484 ?auto_146486 ) ) ( not ( = ?auto_146484 ?auto_146487 ) ) ( not ( = ?auto_146484 ?auto_146488 ) ) ( not ( = ?auto_146484 ?auto_146489 ) ) ( not ( = ?auto_146485 ?auto_146486 ) ) ( not ( = ?auto_146485 ?auto_146487 ) ) ( not ( = ?auto_146485 ?auto_146488 ) ) ( not ( = ?auto_146485 ?auto_146489 ) ) ( not ( = ?auto_146486 ?auto_146487 ) ) ( not ( = ?auto_146486 ?auto_146488 ) ) ( not ( = ?auto_146486 ?auto_146489 ) ) ( not ( = ?auto_146487 ?auto_146488 ) ) ( not ( = ?auto_146487 ?auto_146489 ) ) ( not ( = ?auto_146488 ?auto_146489 ) ) ( ON ?auto_146489 ?auto_146490 ) ( not ( = ?auto_146483 ?auto_146490 ) ) ( not ( = ?auto_146484 ?auto_146490 ) ) ( not ( = ?auto_146485 ?auto_146490 ) ) ( not ( = ?auto_146486 ?auto_146490 ) ) ( not ( = ?auto_146487 ?auto_146490 ) ) ( not ( = ?auto_146488 ?auto_146490 ) ) ( not ( = ?auto_146489 ?auto_146490 ) ) ( ON ?auto_146488 ?auto_146489 ) ( ON-TABLE ?auto_146490 ) ( ON ?auto_146487 ?auto_146488 ) ( ON ?auto_146486 ?auto_146487 ) ( ON ?auto_146485 ?auto_146486 ) ( ON ?auto_146483 ?auto_146491 ) ( CLEAR ?auto_146483 ) ( not ( = ?auto_146483 ?auto_146491 ) ) ( not ( = ?auto_146484 ?auto_146491 ) ) ( not ( = ?auto_146485 ?auto_146491 ) ) ( not ( = ?auto_146486 ?auto_146491 ) ) ( not ( = ?auto_146487 ?auto_146491 ) ) ( not ( = ?auto_146488 ?auto_146491 ) ) ( not ( = ?auto_146489 ?auto_146491 ) ) ( not ( = ?auto_146490 ?auto_146491 ) ) ( HOLDING ?auto_146484 ) ( CLEAR ?auto_146485 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146490 ?auto_146489 ?auto_146488 ?auto_146487 ?auto_146486 ?auto_146485 ?auto_146484 )
      ( MAKE-7PILE ?auto_146483 ?auto_146484 ?auto_146485 ?auto_146486 ?auto_146487 ?auto_146488 ?auto_146489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146492 - BLOCK
      ?auto_146493 - BLOCK
      ?auto_146494 - BLOCK
      ?auto_146495 - BLOCK
      ?auto_146496 - BLOCK
      ?auto_146497 - BLOCK
      ?auto_146498 - BLOCK
    )
    :vars
    (
      ?auto_146499 - BLOCK
      ?auto_146500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146492 ?auto_146493 ) ) ( not ( = ?auto_146492 ?auto_146494 ) ) ( not ( = ?auto_146492 ?auto_146495 ) ) ( not ( = ?auto_146492 ?auto_146496 ) ) ( not ( = ?auto_146492 ?auto_146497 ) ) ( not ( = ?auto_146492 ?auto_146498 ) ) ( not ( = ?auto_146493 ?auto_146494 ) ) ( not ( = ?auto_146493 ?auto_146495 ) ) ( not ( = ?auto_146493 ?auto_146496 ) ) ( not ( = ?auto_146493 ?auto_146497 ) ) ( not ( = ?auto_146493 ?auto_146498 ) ) ( not ( = ?auto_146494 ?auto_146495 ) ) ( not ( = ?auto_146494 ?auto_146496 ) ) ( not ( = ?auto_146494 ?auto_146497 ) ) ( not ( = ?auto_146494 ?auto_146498 ) ) ( not ( = ?auto_146495 ?auto_146496 ) ) ( not ( = ?auto_146495 ?auto_146497 ) ) ( not ( = ?auto_146495 ?auto_146498 ) ) ( not ( = ?auto_146496 ?auto_146497 ) ) ( not ( = ?auto_146496 ?auto_146498 ) ) ( not ( = ?auto_146497 ?auto_146498 ) ) ( ON ?auto_146498 ?auto_146499 ) ( not ( = ?auto_146492 ?auto_146499 ) ) ( not ( = ?auto_146493 ?auto_146499 ) ) ( not ( = ?auto_146494 ?auto_146499 ) ) ( not ( = ?auto_146495 ?auto_146499 ) ) ( not ( = ?auto_146496 ?auto_146499 ) ) ( not ( = ?auto_146497 ?auto_146499 ) ) ( not ( = ?auto_146498 ?auto_146499 ) ) ( ON ?auto_146497 ?auto_146498 ) ( ON-TABLE ?auto_146499 ) ( ON ?auto_146496 ?auto_146497 ) ( ON ?auto_146495 ?auto_146496 ) ( ON ?auto_146494 ?auto_146495 ) ( ON ?auto_146492 ?auto_146500 ) ( not ( = ?auto_146492 ?auto_146500 ) ) ( not ( = ?auto_146493 ?auto_146500 ) ) ( not ( = ?auto_146494 ?auto_146500 ) ) ( not ( = ?auto_146495 ?auto_146500 ) ) ( not ( = ?auto_146496 ?auto_146500 ) ) ( not ( = ?auto_146497 ?auto_146500 ) ) ( not ( = ?auto_146498 ?auto_146500 ) ) ( not ( = ?auto_146499 ?auto_146500 ) ) ( CLEAR ?auto_146494 ) ( ON ?auto_146493 ?auto_146492 ) ( CLEAR ?auto_146493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146500 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146500 ?auto_146492 )
      ( MAKE-7PILE ?auto_146492 ?auto_146493 ?auto_146494 ?auto_146495 ?auto_146496 ?auto_146497 ?auto_146498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146501 - BLOCK
      ?auto_146502 - BLOCK
      ?auto_146503 - BLOCK
      ?auto_146504 - BLOCK
      ?auto_146505 - BLOCK
      ?auto_146506 - BLOCK
      ?auto_146507 - BLOCK
    )
    :vars
    (
      ?auto_146508 - BLOCK
      ?auto_146509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146501 ?auto_146502 ) ) ( not ( = ?auto_146501 ?auto_146503 ) ) ( not ( = ?auto_146501 ?auto_146504 ) ) ( not ( = ?auto_146501 ?auto_146505 ) ) ( not ( = ?auto_146501 ?auto_146506 ) ) ( not ( = ?auto_146501 ?auto_146507 ) ) ( not ( = ?auto_146502 ?auto_146503 ) ) ( not ( = ?auto_146502 ?auto_146504 ) ) ( not ( = ?auto_146502 ?auto_146505 ) ) ( not ( = ?auto_146502 ?auto_146506 ) ) ( not ( = ?auto_146502 ?auto_146507 ) ) ( not ( = ?auto_146503 ?auto_146504 ) ) ( not ( = ?auto_146503 ?auto_146505 ) ) ( not ( = ?auto_146503 ?auto_146506 ) ) ( not ( = ?auto_146503 ?auto_146507 ) ) ( not ( = ?auto_146504 ?auto_146505 ) ) ( not ( = ?auto_146504 ?auto_146506 ) ) ( not ( = ?auto_146504 ?auto_146507 ) ) ( not ( = ?auto_146505 ?auto_146506 ) ) ( not ( = ?auto_146505 ?auto_146507 ) ) ( not ( = ?auto_146506 ?auto_146507 ) ) ( ON ?auto_146507 ?auto_146508 ) ( not ( = ?auto_146501 ?auto_146508 ) ) ( not ( = ?auto_146502 ?auto_146508 ) ) ( not ( = ?auto_146503 ?auto_146508 ) ) ( not ( = ?auto_146504 ?auto_146508 ) ) ( not ( = ?auto_146505 ?auto_146508 ) ) ( not ( = ?auto_146506 ?auto_146508 ) ) ( not ( = ?auto_146507 ?auto_146508 ) ) ( ON ?auto_146506 ?auto_146507 ) ( ON-TABLE ?auto_146508 ) ( ON ?auto_146505 ?auto_146506 ) ( ON ?auto_146504 ?auto_146505 ) ( ON ?auto_146501 ?auto_146509 ) ( not ( = ?auto_146501 ?auto_146509 ) ) ( not ( = ?auto_146502 ?auto_146509 ) ) ( not ( = ?auto_146503 ?auto_146509 ) ) ( not ( = ?auto_146504 ?auto_146509 ) ) ( not ( = ?auto_146505 ?auto_146509 ) ) ( not ( = ?auto_146506 ?auto_146509 ) ) ( not ( = ?auto_146507 ?auto_146509 ) ) ( not ( = ?auto_146508 ?auto_146509 ) ) ( ON ?auto_146502 ?auto_146501 ) ( CLEAR ?auto_146502 ) ( ON-TABLE ?auto_146509 ) ( HOLDING ?auto_146503 ) ( CLEAR ?auto_146504 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146508 ?auto_146507 ?auto_146506 ?auto_146505 ?auto_146504 ?auto_146503 )
      ( MAKE-7PILE ?auto_146501 ?auto_146502 ?auto_146503 ?auto_146504 ?auto_146505 ?auto_146506 ?auto_146507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146510 - BLOCK
      ?auto_146511 - BLOCK
      ?auto_146512 - BLOCK
      ?auto_146513 - BLOCK
      ?auto_146514 - BLOCK
      ?auto_146515 - BLOCK
      ?auto_146516 - BLOCK
    )
    :vars
    (
      ?auto_146517 - BLOCK
      ?auto_146518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146510 ?auto_146511 ) ) ( not ( = ?auto_146510 ?auto_146512 ) ) ( not ( = ?auto_146510 ?auto_146513 ) ) ( not ( = ?auto_146510 ?auto_146514 ) ) ( not ( = ?auto_146510 ?auto_146515 ) ) ( not ( = ?auto_146510 ?auto_146516 ) ) ( not ( = ?auto_146511 ?auto_146512 ) ) ( not ( = ?auto_146511 ?auto_146513 ) ) ( not ( = ?auto_146511 ?auto_146514 ) ) ( not ( = ?auto_146511 ?auto_146515 ) ) ( not ( = ?auto_146511 ?auto_146516 ) ) ( not ( = ?auto_146512 ?auto_146513 ) ) ( not ( = ?auto_146512 ?auto_146514 ) ) ( not ( = ?auto_146512 ?auto_146515 ) ) ( not ( = ?auto_146512 ?auto_146516 ) ) ( not ( = ?auto_146513 ?auto_146514 ) ) ( not ( = ?auto_146513 ?auto_146515 ) ) ( not ( = ?auto_146513 ?auto_146516 ) ) ( not ( = ?auto_146514 ?auto_146515 ) ) ( not ( = ?auto_146514 ?auto_146516 ) ) ( not ( = ?auto_146515 ?auto_146516 ) ) ( ON ?auto_146516 ?auto_146517 ) ( not ( = ?auto_146510 ?auto_146517 ) ) ( not ( = ?auto_146511 ?auto_146517 ) ) ( not ( = ?auto_146512 ?auto_146517 ) ) ( not ( = ?auto_146513 ?auto_146517 ) ) ( not ( = ?auto_146514 ?auto_146517 ) ) ( not ( = ?auto_146515 ?auto_146517 ) ) ( not ( = ?auto_146516 ?auto_146517 ) ) ( ON ?auto_146515 ?auto_146516 ) ( ON-TABLE ?auto_146517 ) ( ON ?auto_146514 ?auto_146515 ) ( ON ?auto_146513 ?auto_146514 ) ( ON ?auto_146510 ?auto_146518 ) ( not ( = ?auto_146510 ?auto_146518 ) ) ( not ( = ?auto_146511 ?auto_146518 ) ) ( not ( = ?auto_146512 ?auto_146518 ) ) ( not ( = ?auto_146513 ?auto_146518 ) ) ( not ( = ?auto_146514 ?auto_146518 ) ) ( not ( = ?auto_146515 ?auto_146518 ) ) ( not ( = ?auto_146516 ?auto_146518 ) ) ( not ( = ?auto_146517 ?auto_146518 ) ) ( ON ?auto_146511 ?auto_146510 ) ( ON-TABLE ?auto_146518 ) ( CLEAR ?auto_146513 ) ( ON ?auto_146512 ?auto_146511 ) ( CLEAR ?auto_146512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146518 ?auto_146510 ?auto_146511 )
      ( MAKE-7PILE ?auto_146510 ?auto_146511 ?auto_146512 ?auto_146513 ?auto_146514 ?auto_146515 ?auto_146516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146519 - BLOCK
      ?auto_146520 - BLOCK
      ?auto_146521 - BLOCK
      ?auto_146522 - BLOCK
      ?auto_146523 - BLOCK
      ?auto_146524 - BLOCK
      ?auto_146525 - BLOCK
    )
    :vars
    (
      ?auto_146526 - BLOCK
      ?auto_146527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146519 ?auto_146520 ) ) ( not ( = ?auto_146519 ?auto_146521 ) ) ( not ( = ?auto_146519 ?auto_146522 ) ) ( not ( = ?auto_146519 ?auto_146523 ) ) ( not ( = ?auto_146519 ?auto_146524 ) ) ( not ( = ?auto_146519 ?auto_146525 ) ) ( not ( = ?auto_146520 ?auto_146521 ) ) ( not ( = ?auto_146520 ?auto_146522 ) ) ( not ( = ?auto_146520 ?auto_146523 ) ) ( not ( = ?auto_146520 ?auto_146524 ) ) ( not ( = ?auto_146520 ?auto_146525 ) ) ( not ( = ?auto_146521 ?auto_146522 ) ) ( not ( = ?auto_146521 ?auto_146523 ) ) ( not ( = ?auto_146521 ?auto_146524 ) ) ( not ( = ?auto_146521 ?auto_146525 ) ) ( not ( = ?auto_146522 ?auto_146523 ) ) ( not ( = ?auto_146522 ?auto_146524 ) ) ( not ( = ?auto_146522 ?auto_146525 ) ) ( not ( = ?auto_146523 ?auto_146524 ) ) ( not ( = ?auto_146523 ?auto_146525 ) ) ( not ( = ?auto_146524 ?auto_146525 ) ) ( ON ?auto_146525 ?auto_146526 ) ( not ( = ?auto_146519 ?auto_146526 ) ) ( not ( = ?auto_146520 ?auto_146526 ) ) ( not ( = ?auto_146521 ?auto_146526 ) ) ( not ( = ?auto_146522 ?auto_146526 ) ) ( not ( = ?auto_146523 ?auto_146526 ) ) ( not ( = ?auto_146524 ?auto_146526 ) ) ( not ( = ?auto_146525 ?auto_146526 ) ) ( ON ?auto_146524 ?auto_146525 ) ( ON-TABLE ?auto_146526 ) ( ON ?auto_146523 ?auto_146524 ) ( ON ?auto_146519 ?auto_146527 ) ( not ( = ?auto_146519 ?auto_146527 ) ) ( not ( = ?auto_146520 ?auto_146527 ) ) ( not ( = ?auto_146521 ?auto_146527 ) ) ( not ( = ?auto_146522 ?auto_146527 ) ) ( not ( = ?auto_146523 ?auto_146527 ) ) ( not ( = ?auto_146524 ?auto_146527 ) ) ( not ( = ?auto_146525 ?auto_146527 ) ) ( not ( = ?auto_146526 ?auto_146527 ) ) ( ON ?auto_146520 ?auto_146519 ) ( ON-TABLE ?auto_146527 ) ( ON ?auto_146521 ?auto_146520 ) ( CLEAR ?auto_146521 ) ( HOLDING ?auto_146522 ) ( CLEAR ?auto_146523 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146526 ?auto_146525 ?auto_146524 ?auto_146523 ?auto_146522 )
      ( MAKE-7PILE ?auto_146519 ?auto_146520 ?auto_146521 ?auto_146522 ?auto_146523 ?auto_146524 ?auto_146525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146528 - BLOCK
      ?auto_146529 - BLOCK
      ?auto_146530 - BLOCK
      ?auto_146531 - BLOCK
      ?auto_146532 - BLOCK
      ?auto_146533 - BLOCK
      ?auto_146534 - BLOCK
    )
    :vars
    (
      ?auto_146535 - BLOCK
      ?auto_146536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146528 ?auto_146529 ) ) ( not ( = ?auto_146528 ?auto_146530 ) ) ( not ( = ?auto_146528 ?auto_146531 ) ) ( not ( = ?auto_146528 ?auto_146532 ) ) ( not ( = ?auto_146528 ?auto_146533 ) ) ( not ( = ?auto_146528 ?auto_146534 ) ) ( not ( = ?auto_146529 ?auto_146530 ) ) ( not ( = ?auto_146529 ?auto_146531 ) ) ( not ( = ?auto_146529 ?auto_146532 ) ) ( not ( = ?auto_146529 ?auto_146533 ) ) ( not ( = ?auto_146529 ?auto_146534 ) ) ( not ( = ?auto_146530 ?auto_146531 ) ) ( not ( = ?auto_146530 ?auto_146532 ) ) ( not ( = ?auto_146530 ?auto_146533 ) ) ( not ( = ?auto_146530 ?auto_146534 ) ) ( not ( = ?auto_146531 ?auto_146532 ) ) ( not ( = ?auto_146531 ?auto_146533 ) ) ( not ( = ?auto_146531 ?auto_146534 ) ) ( not ( = ?auto_146532 ?auto_146533 ) ) ( not ( = ?auto_146532 ?auto_146534 ) ) ( not ( = ?auto_146533 ?auto_146534 ) ) ( ON ?auto_146534 ?auto_146535 ) ( not ( = ?auto_146528 ?auto_146535 ) ) ( not ( = ?auto_146529 ?auto_146535 ) ) ( not ( = ?auto_146530 ?auto_146535 ) ) ( not ( = ?auto_146531 ?auto_146535 ) ) ( not ( = ?auto_146532 ?auto_146535 ) ) ( not ( = ?auto_146533 ?auto_146535 ) ) ( not ( = ?auto_146534 ?auto_146535 ) ) ( ON ?auto_146533 ?auto_146534 ) ( ON-TABLE ?auto_146535 ) ( ON ?auto_146532 ?auto_146533 ) ( ON ?auto_146528 ?auto_146536 ) ( not ( = ?auto_146528 ?auto_146536 ) ) ( not ( = ?auto_146529 ?auto_146536 ) ) ( not ( = ?auto_146530 ?auto_146536 ) ) ( not ( = ?auto_146531 ?auto_146536 ) ) ( not ( = ?auto_146532 ?auto_146536 ) ) ( not ( = ?auto_146533 ?auto_146536 ) ) ( not ( = ?auto_146534 ?auto_146536 ) ) ( not ( = ?auto_146535 ?auto_146536 ) ) ( ON ?auto_146529 ?auto_146528 ) ( ON-TABLE ?auto_146536 ) ( ON ?auto_146530 ?auto_146529 ) ( CLEAR ?auto_146532 ) ( ON ?auto_146531 ?auto_146530 ) ( CLEAR ?auto_146531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146536 ?auto_146528 ?auto_146529 ?auto_146530 )
      ( MAKE-7PILE ?auto_146528 ?auto_146529 ?auto_146530 ?auto_146531 ?auto_146532 ?auto_146533 ?auto_146534 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146537 - BLOCK
      ?auto_146538 - BLOCK
      ?auto_146539 - BLOCK
      ?auto_146540 - BLOCK
      ?auto_146541 - BLOCK
      ?auto_146542 - BLOCK
      ?auto_146543 - BLOCK
    )
    :vars
    (
      ?auto_146545 - BLOCK
      ?auto_146544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146537 ?auto_146538 ) ) ( not ( = ?auto_146537 ?auto_146539 ) ) ( not ( = ?auto_146537 ?auto_146540 ) ) ( not ( = ?auto_146537 ?auto_146541 ) ) ( not ( = ?auto_146537 ?auto_146542 ) ) ( not ( = ?auto_146537 ?auto_146543 ) ) ( not ( = ?auto_146538 ?auto_146539 ) ) ( not ( = ?auto_146538 ?auto_146540 ) ) ( not ( = ?auto_146538 ?auto_146541 ) ) ( not ( = ?auto_146538 ?auto_146542 ) ) ( not ( = ?auto_146538 ?auto_146543 ) ) ( not ( = ?auto_146539 ?auto_146540 ) ) ( not ( = ?auto_146539 ?auto_146541 ) ) ( not ( = ?auto_146539 ?auto_146542 ) ) ( not ( = ?auto_146539 ?auto_146543 ) ) ( not ( = ?auto_146540 ?auto_146541 ) ) ( not ( = ?auto_146540 ?auto_146542 ) ) ( not ( = ?auto_146540 ?auto_146543 ) ) ( not ( = ?auto_146541 ?auto_146542 ) ) ( not ( = ?auto_146541 ?auto_146543 ) ) ( not ( = ?auto_146542 ?auto_146543 ) ) ( ON ?auto_146543 ?auto_146545 ) ( not ( = ?auto_146537 ?auto_146545 ) ) ( not ( = ?auto_146538 ?auto_146545 ) ) ( not ( = ?auto_146539 ?auto_146545 ) ) ( not ( = ?auto_146540 ?auto_146545 ) ) ( not ( = ?auto_146541 ?auto_146545 ) ) ( not ( = ?auto_146542 ?auto_146545 ) ) ( not ( = ?auto_146543 ?auto_146545 ) ) ( ON ?auto_146542 ?auto_146543 ) ( ON-TABLE ?auto_146545 ) ( ON ?auto_146537 ?auto_146544 ) ( not ( = ?auto_146537 ?auto_146544 ) ) ( not ( = ?auto_146538 ?auto_146544 ) ) ( not ( = ?auto_146539 ?auto_146544 ) ) ( not ( = ?auto_146540 ?auto_146544 ) ) ( not ( = ?auto_146541 ?auto_146544 ) ) ( not ( = ?auto_146542 ?auto_146544 ) ) ( not ( = ?auto_146543 ?auto_146544 ) ) ( not ( = ?auto_146545 ?auto_146544 ) ) ( ON ?auto_146538 ?auto_146537 ) ( ON-TABLE ?auto_146544 ) ( ON ?auto_146539 ?auto_146538 ) ( ON ?auto_146540 ?auto_146539 ) ( CLEAR ?auto_146540 ) ( HOLDING ?auto_146541 ) ( CLEAR ?auto_146542 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146545 ?auto_146543 ?auto_146542 ?auto_146541 )
      ( MAKE-7PILE ?auto_146537 ?auto_146538 ?auto_146539 ?auto_146540 ?auto_146541 ?auto_146542 ?auto_146543 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146546 - BLOCK
      ?auto_146547 - BLOCK
      ?auto_146548 - BLOCK
      ?auto_146549 - BLOCK
      ?auto_146550 - BLOCK
      ?auto_146551 - BLOCK
      ?auto_146552 - BLOCK
    )
    :vars
    (
      ?auto_146553 - BLOCK
      ?auto_146554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146546 ?auto_146547 ) ) ( not ( = ?auto_146546 ?auto_146548 ) ) ( not ( = ?auto_146546 ?auto_146549 ) ) ( not ( = ?auto_146546 ?auto_146550 ) ) ( not ( = ?auto_146546 ?auto_146551 ) ) ( not ( = ?auto_146546 ?auto_146552 ) ) ( not ( = ?auto_146547 ?auto_146548 ) ) ( not ( = ?auto_146547 ?auto_146549 ) ) ( not ( = ?auto_146547 ?auto_146550 ) ) ( not ( = ?auto_146547 ?auto_146551 ) ) ( not ( = ?auto_146547 ?auto_146552 ) ) ( not ( = ?auto_146548 ?auto_146549 ) ) ( not ( = ?auto_146548 ?auto_146550 ) ) ( not ( = ?auto_146548 ?auto_146551 ) ) ( not ( = ?auto_146548 ?auto_146552 ) ) ( not ( = ?auto_146549 ?auto_146550 ) ) ( not ( = ?auto_146549 ?auto_146551 ) ) ( not ( = ?auto_146549 ?auto_146552 ) ) ( not ( = ?auto_146550 ?auto_146551 ) ) ( not ( = ?auto_146550 ?auto_146552 ) ) ( not ( = ?auto_146551 ?auto_146552 ) ) ( ON ?auto_146552 ?auto_146553 ) ( not ( = ?auto_146546 ?auto_146553 ) ) ( not ( = ?auto_146547 ?auto_146553 ) ) ( not ( = ?auto_146548 ?auto_146553 ) ) ( not ( = ?auto_146549 ?auto_146553 ) ) ( not ( = ?auto_146550 ?auto_146553 ) ) ( not ( = ?auto_146551 ?auto_146553 ) ) ( not ( = ?auto_146552 ?auto_146553 ) ) ( ON ?auto_146551 ?auto_146552 ) ( ON-TABLE ?auto_146553 ) ( ON ?auto_146546 ?auto_146554 ) ( not ( = ?auto_146546 ?auto_146554 ) ) ( not ( = ?auto_146547 ?auto_146554 ) ) ( not ( = ?auto_146548 ?auto_146554 ) ) ( not ( = ?auto_146549 ?auto_146554 ) ) ( not ( = ?auto_146550 ?auto_146554 ) ) ( not ( = ?auto_146551 ?auto_146554 ) ) ( not ( = ?auto_146552 ?auto_146554 ) ) ( not ( = ?auto_146553 ?auto_146554 ) ) ( ON ?auto_146547 ?auto_146546 ) ( ON-TABLE ?auto_146554 ) ( ON ?auto_146548 ?auto_146547 ) ( ON ?auto_146549 ?auto_146548 ) ( CLEAR ?auto_146551 ) ( ON ?auto_146550 ?auto_146549 ) ( CLEAR ?auto_146550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146554 ?auto_146546 ?auto_146547 ?auto_146548 ?auto_146549 )
      ( MAKE-7PILE ?auto_146546 ?auto_146547 ?auto_146548 ?auto_146549 ?auto_146550 ?auto_146551 ?auto_146552 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146555 - BLOCK
      ?auto_146556 - BLOCK
      ?auto_146557 - BLOCK
      ?auto_146558 - BLOCK
      ?auto_146559 - BLOCK
      ?auto_146560 - BLOCK
      ?auto_146561 - BLOCK
    )
    :vars
    (
      ?auto_146563 - BLOCK
      ?auto_146562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146555 ?auto_146556 ) ) ( not ( = ?auto_146555 ?auto_146557 ) ) ( not ( = ?auto_146555 ?auto_146558 ) ) ( not ( = ?auto_146555 ?auto_146559 ) ) ( not ( = ?auto_146555 ?auto_146560 ) ) ( not ( = ?auto_146555 ?auto_146561 ) ) ( not ( = ?auto_146556 ?auto_146557 ) ) ( not ( = ?auto_146556 ?auto_146558 ) ) ( not ( = ?auto_146556 ?auto_146559 ) ) ( not ( = ?auto_146556 ?auto_146560 ) ) ( not ( = ?auto_146556 ?auto_146561 ) ) ( not ( = ?auto_146557 ?auto_146558 ) ) ( not ( = ?auto_146557 ?auto_146559 ) ) ( not ( = ?auto_146557 ?auto_146560 ) ) ( not ( = ?auto_146557 ?auto_146561 ) ) ( not ( = ?auto_146558 ?auto_146559 ) ) ( not ( = ?auto_146558 ?auto_146560 ) ) ( not ( = ?auto_146558 ?auto_146561 ) ) ( not ( = ?auto_146559 ?auto_146560 ) ) ( not ( = ?auto_146559 ?auto_146561 ) ) ( not ( = ?auto_146560 ?auto_146561 ) ) ( ON ?auto_146561 ?auto_146563 ) ( not ( = ?auto_146555 ?auto_146563 ) ) ( not ( = ?auto_146556 ?auto_146563 ) ) ( not ( = ?auto_146557 ?auto_146563 ) ) ( not ( = ?auto_146558 ?auto_146563 ) ) ( not ( = ?auto_146559 ?auto_146563 ) ) ( not ( = ?auto_146560 ?auto_146563 ) ) ( not ( = ?auto_146561 ?auto_146563 ) ) ( ON-TABLE ?auto_146563 ) ( ON ?auto_146555 ?auto_146562 ) ( not ( = ?auto_146555 ?auto_146562 ) ) ( not ( = ?auto_146556 ?auto_146562 ) ) ( not ( = ?auto_146557 ?auto_146562 ) ) ( not ( = ?auto_146558 ?auto_146562 ) ) ( not ( = ?auto_146559 ?auto_146562 ) ) ( not ( = ?auto_146560 ?auto_146562 ) ) ( not ( = ?auto_146561 ?auto_146562 ) ) ( not ( = ?auto_146563 ?auto_146562 ) ) ( ON ?auto_146556 ?auto_146555 ) ( ON-TABLE ?auto_146562 ) ( ON ?auto_146557 ?auto_146556 ) ( ON ?auto_146558 ?auto_146557 ) ( ON ?auto_146559 ?auto_146558 ) ( CLEAR ?auto_146559 ) ( HOLDING ?auto_146560 ) ( CLEAR ?auto_146561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146563 ?auto_146561 ?auto_146560 )
      ( MAKE-7PILE ?auto_146555 ?auto_146556 ?auto_146557 ?auto_146558 ?auto_146559 ?auto_146560 ?auto_146561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146564 - BLOCK
      ?auto_146565 - BLOCK
      ?auto_146566 - BLOCK
      ?auto_146567 - BLOCK
      ?auto_146568 - BLOCK
      ?auto_146569 - BLOCK
      ?auto_146570 - BLOCK
    )
    :vars
    (
      ?auto_146571 - BLOCK
      ?auto_146572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146564 ?auto_146565 ) ) ( not ( = ?auto_146564 ?auto_146566 ) ) ( not ( = ?auto_146564 ?auto_146567 ) ) ( not ( = ?auto_146564 ?auto_146568 ) ) ( not ( = ?auto_146564 ?auto_146569 ) ) ( not ( = ?auto_146564 ?auto_146570 ) ) ( not ( = ?auto_146565 ?auto_146566 ) ) ( not ( = ?auto_146565 ?auto_146567 ) ) ( not ( = ?auto_146565 ?auto_146568 ) ) ( not ( = ?auto_146565 ?auto_146569 ) ) ( not ( = ?auto_146565 ?auto_146570 ) ) ( not ( = ?auto_146566 ?auto_146567 ) ) ( not ( = ?auto_146566 ?auto_146568 ) ) ( not ( = ?auto_146566 ?auto_146569 ) ) ( not ( = ?auto_146566 ?auto_146570 ) ) ( not ( = ?auto_146567 ?auto_146568 ) ) ( not ( = ?auto_146567 ?auto_146569 ) ) ( not ( = ?auto_146567 ?auto_146570 ) ) ( not ( = ?auto_146568 ?auto_146569 ) ) ( not ( = ?auto_146568 ?auto_146570 ) ) ( not ( = ?auto_146569 ?auto_146570 ) ) ( ON ?auto_146570 ?auto_146571 ) ( not ( = ?auto_146564 ?auto_146571 ) ) ( not ( = ?auto_146565 ?auto_146571 ) ) ( not ( = ?auto_146566 ?auto_146571 ) ) ( not ( = ?auto_146567 ?auto_146571 ) ) ( not ( = ?auto_146568 ?auto_146571 ) ) ( not ( = ?auto_146569 ?auto_146571 ) ) ( not ( = ?auto_146570 ?auto_146571 ) ) ( ON-TABLE ?auto_146571 ) ( ON ?auto_146564 ?auto_146572 ) ( not ( = ?auto_146564 ?auto_146572 ) ) ( not ( = ?auto_146565 ?auto_146572 ) ) ( not ( = ?auto_146566 ?auto_146572 ) ) ( not ( = ?auto_146567 ?auto_146572 ) ) ( not ( = ?auto_146568 ?auto_146572 ) ) ( not ( = ?auto_146569 ?auto_146572 ) ) ( not ( = ?auto_146570 ?auto_146572 ) ) ( not ( = ?auto_146571 ?auto_146572 ) ) ( ON ?auto_146565 ?auto_146564 ) ( ON-TABLE ?auto_146572 ) ( ON ?auto_146566 ?auto_146565 ) ( ON ?auto_146567 ?auto_146566 ) ( ON ?auto_146568 ?auto_146567 ) ( CLEAR ?auto_146570 ) ( ON ?auto_146569 ?auto_146568 ) ( CLEAR ?auto_146569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146572 ?auto_146564 ?auto_146565 ?auto_146566 ?auto_146567 ?auto_146568 )
      ( MAKE-7PILE ?auto_146564 ?auto_146565 ?auto_146566 ?auto_146567 ?auto_146568 ?auto_146569 ?auto_146570 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146573 - BLOCK
      ?auto_146574 - BLOCK
      ?auto_146575 - BLOCK
      ?auto_146576 - BLOCK
      ?auto_146577 - BLOCK
      ?auto_146578 - BLOCK
      ?auto_146579 - BLOCK
    )
    :vars
    (
      ?auto_146580 - BLOCK
      ?auto_146581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146573 ?auto_146574 ) ) ( not ( = ?auto_146573 ?auto_146575 ) ) ( not ( = ?auto_146573 ?auto_146576 ) ) ( not ( = ?auto_146573 ?auto_146577 ) ) ( not ( = ?auto_146573 ?auto_146578 ) ) ( not ( = ?auto_146573 ?auto_146579 ) ) ( not ( = ?auto_146574 ?auto_146575 ) ) ( not ( = ?auto_146574 ?auto_146576 ) ) ( not ( = ?auto_146574 ?auto_146577 ) ) ( not ( = ?auto_146574 ?auto_146578 ) ) ( not ( = ?auto_146574 ?auto_146579 ) ) ( not ( = ?auto_146575 ?auto_146576 ) ) ( not ( = ?auto_146575 ?auto_146577 ) ) ( not ( = ?auto_146575 ?auto_146578 ) ) ( not ( = ?auto_146575 ?auto_146579 ) ) ( not ( = ?auto_146576 ?auto_146577 ) ) ( not ( = ?auto_146576 ?auto_146578 ) ) ( not ( = ?auto_146576 ?auto_146579 ) ) ( not ( = ?auto_146577 ?auto_146578 ) ) ( not ( = ?auto_146577 ?auto_146579 ) ) ( not ( = ?auto_146578 ?auto_146579 ) ) ( not ( = ?auto_146573 ?auto_146580 ) ) ( not ( = ?auto_146574 ?auto_146580 ) ) ( not ( = ?auto_146575 ?auto_146580 ) ) ( not ( = ?auto_146576 ?auto_146580 ) ) ( not ( = ?auto_146577 ?auto_146580 ) ) ( not ( = ?auto_146578 ?auto_146580 ) ) ( not ( = ?auto_146579 ?auto_146580 ) ) ( ON-TABLE ?auto_146580 ) ( ON ?auto_146573 ?auto_146581 ) ( not ( = ?auto_146573 ?auto_146581 ) ) ( not ( = ?auto_146574 ?auto_146581 ) ) ( not ( = ?auto_146575 ?auto_146581 ) ) ( not ( = ?auto_146576 ?auto_146581 ) ) ( not ( = ?auto_146577 ?auto_146581 ) ) ( not ( = ?auto_146578 ?auto_146581 ) ) ( not ( = ?auto_146579 ?auto_146581 ) ) ( not ( = ?auto_146580 ?auto_146581 ) ) ( ON ?auto_146574 ?auto_146573 ) ( ON-TABLE ?auto_146581 ) ( ON ?auto_146575 ?auto_146574 ) ( ON ?auto_146576 ?auto_146575 ) ( ON ?auto_146577 ?auto_146576 ) ( ON ?auto_146578 ?auto_146577 ) ( CLEAR ?auto_146578 ) ( HOLDING ?auto_146579 ) ( CLEAR ?auto_146580 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146580 ?auto_146579 )
      ( MAKE-7PILE ?auto_146573 ?auto_146574 ?auto_146575 ?auto_146576 ?auto_146577 ?auto_146578 ?auto_146579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146582 - BLOCK
      ?auto_146583 - BLOCK
      ?auto_146584 - BLOCK
      ?auto_146585 - BLOCK
      ?auto_146586 - BLOCK
      ?auto_146587 - BLOCK
      ?auto_146588 - BLOCK
    )
    :vars
    (
      ?auto_146589 - BLOCK
      ?auto_146590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146582 ?auto_146583 ) ) ( not ( = ?auto_146582 ?auto_146584 ) ) ( not ( = ?auto_146582 ?auto_146585 ) ) ( not ( = ?auto_146582 ?auto_146586 ) ) ( not ( = ?auto_146582 ?auto_146587 ) ) ( not ( = ?auto_146582 ?auto_146588 ) ) ( not ( = ?auto_146583 ?auto_146584 ) ) ( not ( = ?auto_146583 ?auto_146585 ) ) ( not ( = ?auto_146583 ?auto_146586 ) ) ( not ( = ?auto_146583 ?auto_146587 ) ) ( not ( = ?auto_146583 ?auto_146588 ) ) ( not ( = ?auto_146584 ?auto_146585 ) ) ( not ( = ?auto_146584 ?auto_146586 ) ) ( not ( = ?auto_146584 ?auto_146587 ) ) ( not ( = ?auto_146584 ?auto_146588 ) ) ( not ( = ?auto_146585 ?auto_146586 ) ) ( not ( = ?auto_146585 ?auto_146587 ) ) ( not ( = ?auto_146585 ?auto_146588 ) ) ( not ( = ?auto_146586 ?auto_146587 ) ) ( not ( = ?auto_146586 ?auto_146588 ) ) ( not ( = ?auto_146587 ?auto_146588 ) ) ( not ( = ?auto_146582 ?auto_146589 ) ) ( not ( = ?auto_146583 ?auto_146589 ) ) ( not ( = ?auto_146584 ?auto_146589 ) ) ( not ( = ?auto_146585 ?auto_146589 ) ) ( not ( = ?auto_146586 ?auto_146589 ) ) ( not ( = ?auto_146587 ?auto_146589 ) ) ( not ( = ?auto_146588 ?auto_146589 ) ) ( ON-TABLE ?auto_146589 ) ( ON ?auto_146582 ?auto_146590 ) ( not ( = ?auto_146582 ?auto_146590 ) ) ( not ( = ?auto_146583 ?auto_146590 ) ) ( not ( = ?auto_146584 ?auto_146590 ) ) ( not ( = ?auto_146585 ?auto_146590 ) ) ( not ( = ?auto_146586 ?auto_146590 ) ) ( not ( = ?auto_146587 ?auto_146590 ) ) ( not ( = ?auto_146588 ?auto_146590 ) ) ( not ( = ?auto_146589 ?auto_146590 ) ) ( ON ?auto_146583 ?auto_146582 ) ( ON-TABLE ?auto_146590 ) ( ON ?auto_146584 ?auto_146583 ) ( ON ?auto_146585 ?auto_146584 ) ( ON ?auto_146586 ?auto_146585 ) ( ON ?auto_146587 ?auto_146586 ) ( CLEAR ?auto_146589 ) ( ON ?auto_146588 ?auto_146587 ) ( CLEAR ?auto_146588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146590 ?auto_146582 ?auto_146583 ?auto_146584 ?auto_146585 ?auto_146586 ?auto_146587 )
      ( MAKE-7PILE ?auto_146582 ?auto_146583 ?auto_146584 ?auto_146585 ?auto_146586 ?auto_146587 ?auto_146588 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146591 - BLOCK
      ?auto_146592 - BLOCK
      ?auto_146593 - BLOCK
      ?auto_146594 - BLOCK
      ?auto_146595 - BLOCK
      ?auto_146596 - BLOCK
      ?auto_146597 - BLOCK
    )
    :vars
    (
      ?auto_146599 - BLOCK
      ?auto_146598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146591 ?auto_146592 ) ) ( not ( = ?auto_146591 ?auto_146593 ) ) ( not ( = ?auto_146591 ?auto_146594 ) ) ( not ( = ?auto_146591 ?auto_146595 ) ) ( not ( = ?auto_146591 ?auto_146596 ) ) ( not ( = ?auto_146591 ?auto_146597 ) ) ( not ( = ?auto_146592 ?auto_146593 ) ) ( not ( = ?auto_146592 ?auto_146594 ) ) ( not ( = ?auto_146592 ?auto_146595 ) ) ( not ( = ?auto_146592 ?auto_146596 ) ) ( not ( = ?auto_146592 ?auto_146597 ) ) ( not ( = ?auto_146593 ?auto_146594 ) ) ( not ( = ?auto_146593 ?auto_146595 ) ) ( not ( = ?auto_146593 ?auto_146596 ) ) ( not ( = ?auto_146593 ?auto_146597 ) ) ( not ( = ?auto_146594 ?auto_146595 ) ) ( not ( = ?auto_146594 ?auto_146596 ) ) ( not ( = ?auto_146594 ?auto_146597 ) ) ( not ( = ?auto_146595 ?auto_146596 ) ) ( not ( = ?auto_146595 ?auto_146597 ) ) ( not ( = ?auto_146596 ?auto_146597 ) ) ( not ( = ?auto_146591 ?auto_146599 ) ) ( not ( = ?auto_146592 ?auto_146599 ) ) ( not ( = ?auto_146593 ?auto_146599 ) ) ( not ( = ?auto_146594 ?auto_146599 ) ) ( not ( = ?auto_146595 ?auto_146599 ) ) ( not ( = ?auto_146596 ?auto_146599 ) ) ( not ( = ?auto_146597 ?auto_146599 ) ) ( ON ?auto_146591 ?auto_146598 ) ( not ( = ?auto_146591 ?auto_146598 ) ) ( not ( = ?auto_146592 ?auto_146598 ) ) ( not ( = ?auto_146593 ?auto_146598 ) ) ( not ( = ?auto_146594 ?auto_146598 ) ) ( not ( = ?auto_146595 ?auto_146598 ) ) ( not ( = ?auto_146596 ?auto_146598 ) ) ( not ( = ?auto_146597 ?auto_146598 ) ) ( not ( = ?auto_146599 ?auto_146598 ) ) ( ON ?auto_146592 ?auto_146591 ) ( ON-TABLE ?auto_146598 ) ( ON ?auto_146593 ?auto_146592 ) ( ON ?auto_146594 ?auto_146593 ) ( ON ?auto_146595 ?auto_146594 ) ( ON ?auto_146596 ?auto_146595 ) ( ON ?auto_146597 ?auto_146596 ) ( CLEAR ?auto_146597 ) ( HOLDING ?auto_146599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146599 )
      ( MAKE-7PILE ?auto_146591 ?auto_146592 ?auto_146593 ?auto_146594 ?auto_146595 ?auto_146596 ?auto_146597 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146600 - BLOCK
      ?auto_146601 - BLOCK
      ?auto_146602 - BLOCK
      ?auto_146603 - BLOCK
      ?auto_146604 - BLOCK
      ?auto_146605 - BLOCK
      ?auto_146606 - BLOCK
    )
    :vars
    (
      ?auto_146608 - BLOCK
      ?auto_146607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146600 ?auto_146601 ) ) ( not ( = ?auto_146600 ?auto_146602 ) ) ( not ( = ?auto_146600 ?auto_146603 ) ) ( not ( = ?auto_146600 ?auto_146604 ) ) ( not ( = ?auto_146600 ?auto_146605 ) ) ( not ( = ?auto_146600 ?auto_146606 ) ) ( not ( = ?auto_146601 ?auto_146602 ) ) ( not ( = ?auto_146601 ?auto_146603 ) ) ( not ( = ?auto_146601 ?auto_146604 ) ) ( not ( = ?auto_146601 ?auto_146605 ) ) ( not ( = ?auto_146601 ?auto_146606 ) ) ( not ( = ?auto_146602 ?auto_146603 ) ) ( not ( = ?auto_146602 ?auto_146604 ) ) ( not ( = ?auto_146602 ?auto_146605 ) ) ( not ( = ?auto_146602 ?auto_146606 ) ) ( not ( = ?auto_146603 ?auto_146604 ) ) ( not ( = ?auto_146603 ?auto_146605 ) ) ( not ( = ?auto_146603 ?auto_146606 ) ) ( not ( = ?auto_146604 ?auto_146605 ) ) ( not ( = ?auto_146604 ?auto_146606 ) ) ( not ( = ?auto_146605 ?auto_146606 ) ) ( not ( = ?auto_146600 ?auto_146608 ) ) ( not ( = ?auto_146601 ?auto_146608 ) ) ( not ( = ?auto_146602 ?auto_146608 ) ) ( not ( = ?auto_146603 ?auto_146608 ) ) ( not ( = ?auto_146604 ?auto_146608 ) ) ( not ( = ?auto_146605 ?auto_146608 ) ) ( not ( = ?auto_146606 ?auto_146608 ) ) ( ON ?auto_146600 ?auto_146607 ) ( not ( = ?auto_146600 ?auto_146607 ) ) ( not ( = ?auto_146601 ?auto_146607 ) ) ( not ( = ?auto_146602 ?auto_146607 ) ) ( not ( = ?auto_146603 ?auto_146607 ) ) ( not ( = ?auto_146604 ?auto_146607 ) ) ( not ( = ?auto_146605 ?auto_146607 ) ) ( not ( = ?auto_146606 ?auto_146607 ) ) ( not ( = ?auto_146608 ?auto_146607 ) ) ( ON ?auto_146601 ?auto_146600 ) ( ON-TABLE ?auto_146607 ) ( ON ?auto_146602 ?auto_146601 ) ( ON ?auto_146603 ?auto_146602 ) ( ON ?auto_146604 ?auto_146603 ) ( ON ?auto_146605 ?auto_146604 ) ( ON ?auto_146606 ?auto_146605 ) ( ON ?auto_146608 ?auto_146606 ) ( CLEAR ?auto_146608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146607 ?auto_146600 ?auto_146601 ?auto_146602 ?auto_146603 ?auto_146604 ?auto_146605 ?auto_146606 )
      ( MAKE-7PILE ?auto_146600 ?auto_146601 ?auto_146602 ?auto_146603 ?auto_146604 ?auto_146605 ?auto_146606 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146625 - BLOCK
      ?auto_146626 - BLOCK
      ?auto_146627 - BLOCK
      ?auto_146628 - BLOCK
      ?auto_146629 - BLOCK
      ?auto_146630 - BLOCK
      ?auto_146631 - BLOCK
      ?auto_146632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146631 ) ( ON-TABLE ?auto_146625 ) ( ON ?auto_146626 ?auto_146625 ) ( ON ?auto_146627 ?auto_146626 ) ( ON ?auto_146628 ?auto_146627 ) ( ON ?auto_146629 ?auto_146628 ) ( ON ?auto_146630 ?auto_146629 ) ( ON ?auto_146631 ?auto_146630 ) ( not ( = ?auto_146625 ?auto_146626 ) ) ( not ( = ?auto_146625 ?auto_146627 ) ) ( not ( = ?auto_146625 ?auto_146628 ) ) ( not ( = ?auto_146625 ?auto_146629 ) ) ( not ( = ?auto_146625 ?auto_146630 ) ) ( not ( = ?auto_146625 ?auto_146631 ) ) ( not ( = ?auto_146625 ?auto_146632 ) ) ( not ( = ?auto_146626 ?auto_146627 ) ) ( not ( = ?auto_146626 ?auto_146628 ) ) ( not ( = ?auto_146626 ?auto_146629 ) ) ( not ( = ?auto_146626 ?auto_146630 ) ) ( not ( = ?auto_146626 ?auto_146631 ) ) ( not ( = ?auto_146626 ?auto_146632 ) ) ( not ( = ?auto_146627 ?auto_146628 ) ) ( not ( = ?auto_146627 ?auto_146629 ) ) ( not ( = ?auto_146627 ?auto_146630 ) ) ( not ( = ?auto_146627 ?auto_146631 ) ) ( not ( = ?auto_146627 ?auto_146632 ) ) ( not ( = ?auto_146628 ?auto_146629 ) ) ( not ( = ?auto_146628 ?auto_146630 ) ) ( not ( = ?auto_146628 ?auto_146631 ) ) ( not ( = ?auto_146628 ?auto_146632 ) ) ( not ( = ?auto_146629 ?auto_146630 ) ) ( not ( = ?auto_146629 ?auto_146631 ) ) ( not ( = ?auto_146629 ?auto_146632 ) ) ( not ( = ?auto_146630 ?auto_146631 ) ) ( not ( = ?auto_146630 ?auto_146632 ) ) ( not ( = ?auto_146631 ?auto_146632 ) ) ( ON-TABLE ?auto_146632 ) ( CLEAR ?auto_146632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_146632 )
      ( MAKE-8PILE ?auto_146625 ?auto_146626 ?auto_146627 ?auto_146628 ?auto_146629 ?auto_146630 ?auto_146631 ?auto_146632 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146633 - BLOCK
      ?auto_146634 - BLOCK
      ?auto_146635 - BLOCK
      ?auto_146636 - BLOCK
      ?auto_146637 - BLOCK
      ?auto_146638 - BLOCK
      ?auto_146639 - BLOCK
      ?auto_146640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146633 ) ( ON ?auto_146634 ?auto_146633 ) ( ON ?auto_146635 ?auto_146634 ) ( ON ?auto_146636 ?auto_146635 ) ( ON ?auto_146637 ?auto_146636 ) ( ON ?auto_146638 ?auto_146637 ) ( not ( = ?auto_146633 ?auto_146634 ) ) ( not ( = ?auto_146633 ?auto_146635 ) ) ( not ( = ?auto_146633 ?auto_146636 ) ) ( not ( = ?auto_146633 ?auto_146637 ) ) ( not ( = ?auto_146633 ?auto_146638 ) ) ( not ( = ?auto_146633 ?auto_146639 ) ) ( not ( = ?auto_146633 ?auto_146640 ) ) ( not ( = ?auto_146634 ?auto_146635 ) ) ( not ( = ?auto_146634 ?auto_146636 ) ) ( not ( = ?auto_146634 ?auto_146637 ) ) ( not ( = ?auto_146634 ?auto_146638 ) ) ( not ( = ?auto_146634 ?auto_146639 ) ) ( not ( = ?auto_146634 ?auto_146640 ) ) ( not ( = ?auto_146635 ?auto_146636 ) ) ( not ( = ?auto_146635 ?auto_146637 ) ) ( not ( = ?auto_146635 ?auto_146638 ) ) ( not ( = ?auto_146635 ?auto_146639 ) ) ( not ( = ?auto_146635 ?auto_146640 ) ) ( not ( = ?auto_146636 ?auto_146637 ) ) ( not ( = ?auto_146636 ?auto_146638 ) ) ( not ( = ?auto_146636 ?auto_146639 ) ) ( not ( = ?auto_146636 ?auto_146640 ) ) ( not ( = ?auto_146637 ?auto_146638 ) ) ( not ( = ?auto_146637 ?auto_146639 ) ) ( not ( = ?auto_146637 ?auto_146640 ) ) ( not ( = ?auto_146638 ?auto_146639 ) ) ( not ( = ?auto_146638 ?auto_146640 ) ) ( not ( = ?auto_146639 ?auto_146640 ) ) ( ON-TABLE ?auto_146640 ) ( CLEAR ?auto_146640 ) ( HOLDING ?auto_146639 ) ( CLEAR ?auto_146638 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146633 ?auto_146634 ?auto_146635 ?auto_146636 ?auto_146637 ?auto_146638 ?auto_146639 )
      ( MAKE-8PILE ?auto_146633 ?auto_146634 ?auto_146635 ?auto_146636 ?auto_146637 ?auto_146638 ?auto_146639 ?auto_146640 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146641 - BLOCK
      ?auto_146642 - BLOCK
      ?auto_146643 - BLOCK
      ?auto_146644 - BLOCK
      ?auto_146645 - BLOCK
      ?auto_146646 - BLOCK
      ?auto_146647 - BLOCK
      ?auto_146648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146641 ) ( ON ?auto_146642 ?auto_146641 ) ( ON ?auto_146643 ?auto_146642 ) ( ON ?auto_146644 ?auto_146643 ) ( ON ?auto_146645 ?auto_146644 ) ( ON ?auto_146646 ?auto_146645 ) ( not ( = ?auto_146641 ?auto_146642 ) ) ( not ( = ?auto_146641 ?auto_146643 ) ) ( not ( = ?auto_146641 ?auto_146644 ) ) ( not ( = ?auto_146641 ?auto_146645 ) ) ( not ( = ?auto_146641 ?auto_146646 ) ) ( not ( = ?auto_146641 ?auto_146647 ) ) ( not ( = ?auto_146641 ?auto_146648 ) ) ( not ( = ?auto_146642 ?auto_146643 ) ) ( not ( = ?auto_146642 ?auto_146644 ) ) ( not ( = ?auto_146642 ?auto_146645 ) ) ( not ( = ?auto_146642 ?auto_146646 ) ) ( not ( = ?auto_146642 ?auto_146647 ) ) ( not ( = ?auto_146642 ?auto_146648 ) ) ( not ( = ?auto_146643 ?auto_146644 ) ) ( not ( = ?auto_146643 ?auto_146645 ) ) ( not ( = ?auto_146643 ?auto_146646 ) ) ( not ( = ?auto_146643 ?auto_146647 ) ) ( not ( = ?auto_146643 ?auto_146648 ) ) ( not ( = ?auto_146644 ?auto_146645 ) ) ( not ( = ?auto_146644 ?auto_146646 ) ) ( not ( = ?auto_146644 ?auto_146647 ) ) ( not ( = ?auto_146644 ?auto_146648 ) ) ( not ( = ?auto_146645 ?auto_146646 ) ) ( not ( = ?auto_146645 ?auto_146647 ) ) ( not ( = ?auto_146645 ?auto_146648 ) ) ( not ( = ?auto_146646 ?auto_146647 ) ) ( not ( = ?auto_146646 ?auto_146648 ) ) ( not ( = ?auto_146647 ?auto_146648 ) ) ( ON-TABLE ?auto_146648 ) ( CLEAR ?auto_146646 ) ( ON ?auto_146647 ?auto_146648 ) ( CLEAR ?auto_146647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146648 )
      ( MAKE-8PILE ?auto_146641 ?auto_146642 ?auto_146643 ?auto_146644 ?auto_146645 ?auto_146646 ?auto_146647 ?auto_146648 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146649 - BLOCK
      ?auto_146650 - BLOCK
      ?auto_146651 - BLOCK
      ?auto_146652 - BLOCK
      ?auto_146653 - BLOCK
      ?auto_146654 - BLOCK
      ?auto_146655 - BLOCK
      ?auto_146656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146649 ) ( ON ?auto_146650 ?auto_146649 ) ( ON ?auto_146651 ?auto_146650 ) ( ON ?auto_146652 ?auto_146651 ) ( ON ?auto_146653 ?auto_146652 ) ( not ( = ?auto_146649 ?auto_146650 ) ) ( not ( = ?auto_146649 ?auto_146651 ) ) ( not ( = ?auto_146649 ?auto_146652 ) ) ( not ( = ?auto_146649 ?auto_146653 ) ) ( not ( = ?auto_146649 ?auto_146654 ) ) ( not ( = ?auto_146649 ?auto_146655 ) ) ( not ( = ?auto_146649 ?auto_146656 ) ) ( not ( = ?auto_146650 ?auto_146651 ) ) ( not ( = ?auto_146650 ?auto_146652 ) ) ( not ( = ?auto_146650 ?auto_146653 ) ) ( not ( = ?auto_146650 ?auto_146654 ) ) ( not ( = ?auto_146650 ?auto_146655 ) ) ( not ( = ?auto_146650 ?auto_146656 ) ) ( not ( = ?auto_146651 ?auto_146652 ) ) ( not ( = ?auto_146651 ?auto_146653 ) ) ( not ( = ?auto_146651 ?auto_146654 ) ) ( not ( = ?auto_146651 ?auto_146655 ) ) ( not ( = ?auto_146651 ?auto_146656 ) ) ( not ( = ?auto_146652 ?auto_146653 ) ) ( not ( = ?auto_146652 ?auto_146654 ) ) ( not ( = ?auto_146652 ?auto_146655 ) ) ( not ( = ?auto_146652 ?auto_146656 ) ) ( not ( = ?auto_146653 ?auto_146654 ) ) ( not ( = ?auto_146653 ?auto_146655 ) ) ( not ( = ?auto_146653 ?auto_146656 ) ) ( not ( = ?auto_146654 ?auto_146655 ) ) ( not ( = ?auto_146654 ?auto_146656 ) ) ( not ( = ?auto_146655 ?auto_146656 ) ) ( ON-TABLE ?auto_146656 ) ( ON ?auto_146655 ?auto_146656 ) ( CLEAR ?auto_146655 ) ( HOLDING ?auto_146654 ) ( CLEAR ?auto_146653 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146649 ?auto_146650 ?auto_146651 ?auto_146652 ?auto_146653 ?auto_146654 )
      ( MAKE-8PILE ?auto_146649 ?auto_146650 ?auto_146651 ?auto_146652 ?auto_146653 ?auto_146654 ?auto_146655 ?auto_146656 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146657 - BLOCK
      ?auto_146658 - BLOCK
      ?auto_146659 - BLOCK
      ?auto_146660 - BLOCK
      ?auto_146661 - BLOCK
      ?auto_146662 - BLOCK
      ?auto_146663 - BLOCK
      ?auto_146664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146657 ) ( ON ?auto_146658 ?auto_146657 ) ( ON ?auto_146659 ?auto_146658 ) ( ON ?auto_146660 ?auto_146659 ) ( ON ?auto_146661 ?auto_146660 ) ( not ( = ?auto_146657 ?auto_146658 ) ) ( not ( = ?auto_146657 ?auto_146659 ) ) ( not ( = ?auto_146657 ?auto_146660 ) ) ( not ( = ?auto_146657 ?auto_146661 ) ) ( not ( = ?auto_146657 ?auto_146662 ) ) ( not ( = ?auto_146657 ?auto_146663 ) ) ( not ( = ?auto_146657 ?auto_146664 ) ) ( not ( = ?auto_146658 ?auto_146659 ) ) ( not ( = ?auto_146658 ?auto_146660 ) ) ( not ( = ?auto_146658 ?auto_146661 ) ) ( not ( = ?auto_146658 ?auto_146662 ) ) ( not ( = ?auto_146658 ?auto_146663 ) ) ( not ( = ?auto_146658 ?auto_146664 ) ) ( not ( = ?auto_146659 ?auto_146660 ) ) ( not ( = ?auto_146659 ?auto_146661 ) ) ( not ( = ?auto_146659 ?auto_146662 ) ) ( not ( = ?auto_146659 ?auto_146663 ) ) ( not ( = ?auto_146659 ?auto_146664 ) ) ( not ( = ?auto_146660 ?auto_146661 ) ) ( not ( = ?auto_146660 ?auto_146662 ) ) ( not ( = ?auto_146660 ?auto_146663 ) ) ( not ( = ?auto_146660 ?auto_146664 ) ) ( not ( = ?auto_146661 ?auto_146662 ) ) ( not ( = ?auto_146661 ?auto_146663 ) ) ( not ( = ?auto_146661 ?auto_146664 ) ) ( not ( = ?auto_146662 ?auto_146663 ) ) ( not ( = ?auto_146662 ?auto_146664 ) ) ( not ( = ?auto_146663 ?auto_146664 ) ) ( ON-TABLE ?auto_146664 ) ( ON ?auto_146663 ?auto_146664 ) ( CLEAR ?auto_146661 ) ( ON ?auto_146662 ?auto_146663 ) ( CLEAR ?auto_146662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146664 ?auto_146663 )
      ( MAKE-8PILE ?auto_146657 ?auto_146658 ?auto_146659 ?auto_146660 ?auto_146661 ?auto_146662 ?auto_146663 ?auto_146664 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146665 - BLOCK
      ?auto_146666 - BLOCK
      ?auto_146667 - BLOCK
      ?auto_146668 - BLOCK
      ?auto_146669 - BLOCK
      ?auto_146670 - BLOCK
      ?auto_146671 - BLOCK
      ?auto_146672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146665 ) ( ON ?auto_146666 ?auto_146665 ) ( ON ?auto_146667 ?auto_146666 ) ( ON ?auto_146668 ?auto_146667 ) ( not ( = ?auto_146665 ?auto_146666 ) ) ( not ( = ?auto_146665 ?auto_146667 ) ) ( not ( = ?auto_146665 ?auto_146668 ) ) ( not ( = ?auto_146665 ?auto_146669 ) ) ( not ( = ?auto_146665 ?auto_146670 ) ) ( not ( = ?auto_146665 ?auto_146671 ) ) ( not ( = ?auto_146665 ?auto_146672 ) ) ( not ( = ?auto_146666 ?auto_146667 ) ) ( not ( = ?auto_146666 ?auto_146668 ) ) ( not ( = ?auto_146666 ?auto_146669 ) ) ( not ( = ?auto_146666 ?auto_146670 ) ) ( not ( = ?auto_146666 ?auto_146671 ) ) ( not ( = ?auto_146666 ?auto_146672 ) ) ( not ( = ?auto_146667 ?auto_146668 ) ) ( not ( = ?auto_146667 ?auto_146669 ) ) ( not ( = ?auto_146667 ?auto_146670 ) ) ( not ( = ?auto_146667 ?auto_146671 ) ) ( not ( = ?auto_146667 ?auto_146672 ) ) ( not ( = ?auto_146668 ?auto_146669 ) ) ( not ( = ?auto_146668 ?auto_146670 ) ) ( not ( = ?auto_146668 ?auto_146671 ) ) ( not ( = ?auto_146668 ?auto_146672 ) ) ( not ( = ?auto_146669 ?auto_146670 ) ) ( not ( = ?auto_146669 ?auto_146671 ) ) ( not ( = ?auto_146669 ?auto_146672 ) ) ( not ( = ?auto_146670 ?auto_146671 ) ) ( not ( = ?auto_146670 ?auto_146672 ) ) ( not ( = ?auto_146671 ?auto_146672 ) ) ( ON-TABLE ?auto_146672 ) ( ON ?auto_146671 ?auto_146672 ) ( ON ?auto_146670 ?auto_146671 ) ( CLEAR ?auto_146670 ) ( HOLDING ?auto_146669 ) ( CLEAR ?auto_146668 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146665 ?auto_146666 ?auto_146667 ?auto_146668 ?auto_146669 )
      ( MAKE-8PILE ?auto_146665 ?auto_146666 ?auto_146667 ?auto_146668 ?auto_146669 ?auto_146670 ?auto_146671 ?auto_146672 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146673 - BLOCK
      ?auto_146674 - BLOCK
      ?auto_146675 - BLOCK
      ?auto_146676 - BLOCK
      ?auto_146677 - BLOCK
      ?auto_146678 - BLOCK
      ?auto_146679 - BLOCK
      ?auto_146680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146673 ) ( ON ?auto_146674 ?auto_146673 ) ( ON ?auto_146675 ?auto_146674 ) ( ON ?auto_146676 ?auto_146675 ) ( not ( = ?auto_146673 ?auto_146674 ) ) ( not ( = ?auto_146673 ?auto_146675 ) ) ( not ( = ?auto_146673 ?auto_146676 ) ) ( not ( = ?auto_146673 ?auto_146677 ) ) ( not ( = ?auto_146673 ?auto_146678 ) ) ( not ( = ?auto_146673 ?auto_146679 ) ) ( not ( = ?auto_146673 ?auto_146680 ) ) ( not ( = ?auto_146674 ?auto_146675 ) ) ( not ( = ?auto_146674 ?auto_146676 ) ) ( not ( = ?auto_146674 ?auto_146677 ) ) ( not ( = ?auto_146674 ?auto_146678 ) ) ( not ( = ?auto_146674 ?auto_146679 ) ) ( not ( = ?auto_146674 ?auto_146680 ) ) ( not ( = ?auto_146675 ?auto_146676 ) ) ( not ( = ?auto_146675 ?auto_146677 ) ) ( not ( = ?auto_146675 ?auto_146678 ) ) ( not ( = ?auto_146675 ?auto_146679 ) ) ( not ( = ?auto_146675 ?auto_146680 ) ) ( not ( = ?auto_146676 ?auto_146677 ) ) ( not ( = ?auto_146676 ?auto_146678 ) ) ( not ( = ?auto_146676 ?auto_146679 ) ) ( not ( = ?auto_146676 ?auto_146680 ) ) ( not ( = ?auto_146677 ?auto_146678 ) ) ( not ( = ?auto_146677 ?auto_146679 ) ) ( not ( = ?auto_146677 ?auto_146680 ) ) ( not ( = ?auto_146678 ?auto_146679 ) ) ( not ( = ?auto_146678 ?auto_146680 ) ) ( not ( = ?auto_146679 ?auto_146680 ) ) ( ON-TABLE ?auto_146680 ) ( ON ?auto_146679 ?auto_146680 ) ( ON ?auto_146678 ?auto_146679 ) ( CLEAR ?auto_146676 ) ( ON ?auto_146677 ?auto_146678 ) ( CLEAR ?auto_146677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146680 ?auto_146679 ?auto_146678 )
      ( MAKE-8PILE ?auto_146673 ?auto_146674 ?auto_146675 ?auto_146676 ?auto_146677 ?auto_146678 ?auto_146679 ?auto_146680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146681 - BLOCK
      ?auto_146682 - BLOCK
      ?auto_146683 - BLOCK
      ?auto_146684 - BLOCK
      ?auto_146685 - BLOCK
      ?auto_146686 - BLOCK
      ?auto_146687 - BLOCK
      ?auto_146688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146681 ) ( ON ?auto_146682 ?auto_146681 ) ( ON ?auto_146683 ?auto_146682 ) ( not ( = ?auto_146681 ?auto_146682 ) ) ( not ( = ?auto_146681 ?auto_146683 ) ) ( not ( = ?auto_146681 ?auto_146684 ) ) ( not ( = ?auto_146681 ?auto_146685 ) ) ( not ( = ?auto_146681 ?auto_146686 ) ) ( not ( = ?auto_146681 ?auto_146687 ) ) ( not ( = ?auto_146681 ?auto_146688 ) ) ( not ( = ?auto_146682 ?auto_146683 ) ) ( not ( = ?auto_146682 ?auto_146684 ) ) ( not ( = ?auto_146682 ?auto_146685 ) ) ( not ( = ?auto_146682 ?auto_146686 ) ) ( not ( = ?auto_146682 ?auto_146687 ) ) ( not ( = ?auto_146682 ?auto_146688 ) ) ( not ( = ?auto_146683 ?auto_146684 ) ) ( not ( = ?auto_146683 ?auto_146685 ) ) ( not ( = ?auto_146683 ?auto_146686 ) ) ( not ( = ?auto_146683 ?auto_146687 ) ) ( not ( = ?auto_146683 ?auto_146688 ) ) ( not ( = ?auto_146684 ?auto_146685 ) ) ( not ( = ?auto_146684 ?auto_146686 ) ) ( not ( = ?auto_146684 ?auto_146687 ) ) ( not ( = ?auto_146684 ?auto_146688 ) ) ( not ( = ?auto_146685 ?auto_146686 ) ) ( not ( = ?auto_146685 ?auto_146687 ) ) ( not ( = ?auto_146685 ?auto_146688 ) ) ( not ( = ?auto_146686 ?auto_146687 ) ) ( not ( = ?auto_146686 ?auto_146688 ) ) ( not ( = ?auto_146687 ?auto_146688 ) ) ( ON-TABLE ?auto_146688 ) ( ON ?auto_146687 ?auto_146688 ) ( ON ?auto_146686 ?auto_146687 ) ( ON ?auto_146685 ?auto_146686 ) ( CLEAR ?auto_146685 ) ( HOLDING ?auto_146684 ) ( CLEAR ?auto_146683 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146681 ?auto_146682 ?auto_146683 ?auto_146684 )
      ( MAKE-8PILE ?auto_146681 ?auto_146682 ?auto_146683 ?auto_146684 ?auto_146685 ?auto_146686 ?auto_146687 ?auto_146688 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146689 - BLOCK
      ?auto_146690 - BLOCK
      ?auto_146691 - BLOCK
      ?auto_146692 - BLOCK
      ?auto_146693 - BLOCK
      ?auto_146694 - BLOCK
      ?auto_146695 - BLOCK
      ?auto_146696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146689 ) ( ON ?auto_146690 ?auto_146689 ) ( ON ?auto_146691 ?auto_146690 ) ( not ( = ?auto_146689 ?auto_146690 ) ) ( not ( = ?auto_146689 ?auto_146691 ) ) ( not ( = ?auto_146689 ?auto_146692 ) ) ( not ( = ?auto_146689 ?auto_146693 ) ) ( not ( = ?auto_146689 ?auto_146694 ) ) ( not ( = ?auto_146689 ?auto_146695 ) ) ( not ( = ?auto_146689 ?auto_146696 ) ) ( not ( = ?auto_146690 ?auto_146691 ) ) ( not ( = ?auto_146690 ?auto_146692 ) ) ( not ( = ?auto_146690 ?auto_146693 ) ) ( not ( = ?auto_146690 ?auto_146694 ) ) ( not ( = ?auto_146690 ?auto_146695 ) ) ( not ( = ?auto_146690 ?auto_146696 ) ) ( not ( = ?auto_146691 ?auto_146692 ) ) ( not ( = ?auto_146691 ?auto_146693 ) ) ( not ( = ?auto_146691 ?auto_146694 ) ) ( not ( = ?auto_146691 ?auto_146695 ) ) ( not ( = ?auto_146691 ?auto_146696 ) ) ( not ( = ?auto_146692 ?auto_146693 ) ) ( not ( = ?auto_146692 ?auto_146694 ) ) ( not ( = ?auto_146692 ?auto_146695 ) ) ( not ( = ?auto_146692 ?auto_146696 ) ) ( not ( = ?auto_146693 ?auto_146694 ) ) ( not ( = ?auto_146693 ?auto_146695 ) ) ( not ( = ?auto_146693 ?auto_146696 ) ) ( not ( = ?auto_146694 ?auto_146695 ) ) ( not ( = ?auto_146694 ?auto_146696 ) ) ( not ( = ?auto_146695 ?auto_146696 ) ) ( ON-TABLE ?auto_146696 ) ( ON ?auto_146695 ?auto_146696 ) ( ON ?auto_146694 ?auto_146695 ) ( ON ?auto_146693 ?auto_146694 ) ( CLEAR ?auto_146691 ) ( ON ?auto_146692 ?auto_146693 ) ( CLEAR ?auto_146692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146696 ?auto_146695 ?auto_146694 ?auto_146693 )
      ( MAKE-8PILE ?auto_146689 ?auto_146690 ?auto_146691 ?auto_146692 ?auto_146693 ?auto_146694 ?auto_146695 ?auto_146696 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146697 - BLOCK
      ?auto_146698 - BLOCK
      ?auto_146699 - BLOCK
      ?auto_146700 - BLOCK
      ?auto_146701 - BLOCK
      ?auto_146702 - BLOCK
      ?auto_146703 - BLOCK
      ?auto_146704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146697 ) ( ON ?auto_146698 ?auto_146697 ) ( not ( = ?auto_146697 ?auto_146698 ) ) ( not ( = ?auto_146697 ?auto_146699 ) ) ( not ( = ?auto_146697 ?auto_146700 ) ) ( not ( = ?auto_146697 ?auto_146701 ) ) ( not ( = ?auto_146697 ?auto_146702 ) ) ( not ( = ?auto_146697 ?auto_146703 ) ) ( not ( = ?auto_146697 ?auto_146704 ) ) ( not ( = ?auto_146698 ?auto_146699 ) ) ( not ( = ?auto_146698 ?auto_146700 ) ) ( not ( = ?auto_146698 ?auto_146701 ) ) ( not ( = ?auto_146698 ?auto_146702 ) ) ( not ( = ?auto_146698 ?auto_146703 ) ) ( not ( = ?auto_146698 ?auto_146704 ) ) ( not ( = ?auto_146699 ?auto_146700 ) ) ( not ( = ?auto_146699 ?auto_146701 ) ) ( not ( = ?auto_146699 ?auto_146702 ) ) ( not ( = ?auto_146699 ?auto_146703 ) ) ( not ( = ?auto_146699 ?auto_146704 ) ) ( not ( = ?auto_146700 ?auto_146701 ) ) ( not ( = ?auto_146700 ?auto_146702 ) ) ( not ( = ?auto_146700 ?auto_146703 ) ) ( not ( = ?auto_146700 ?auto_146704 ) ) ( not ( = ?auto_146701 ?auto_146702 ) ) ( not ( = ?auto_146701 ?auto_146703 ) ) ( not ( = ?auto_146701 ?auto_146704 ) ) ( not ( = ?auto_146702 ?auto_146703 ) ) ( not ( = ?auto_146702 ?auto_146704 ) ) ( not ( = ?auto_146703 ?auto_146704 ) ) ( ON-TABLE ?auto_146704 ) ( ON ?auto_146703 ?auto_146704 ) ( ON ?auto_146702 ?auto_146703 ) ( ON ?auto_146701 ?auto_146702 ) ( ON ?auto_146700 ?auto_146701 ) ( CLEAR ?auto_146700 ) ( HOLDING ?auto_146699 ) ( CLEAR ?auto_146698 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146697 ?auto_146698 ?auto_146699 )
      ( MAKE-8PILE ?auto_146697 ?auto_146698 ?auto_146699 ?auto_146700 ?auto_146701 ?auto_146702 ?auto_146703 ?auto_146704 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146705 - BLOCK
      ?auto_146706 - BLOCK
      ?auto_146707 - BLOCK
      ?auto_146708 - BLOCK
      ?auto_146709 - BLOCK
      ?auto_146710 - BLOCK
      ?auto_146711 - BLOCK
      ?auto_146712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146705 ) ( ON ?auto_146706 ?auto_146705 ) ( not ( = ?auto_146705 ?auto_146706 ) ) ( not ( = ?auto_146705 ?auto_146707 ) ) ( not ( = ?auto_146705 ?auto_146708 ) ) ( not ( = ?auto_146705 ?auto_146709 ) ) ( not ( = ?auto_146705 ?auto_146710 ) ) ( not ( = ?auto_146705 ?auto_146711 ) ) ( not ( = ?auto_146705 ?auto_146712 ) ) ( not ( = ?auto_146706 ?auto_146707 ) ) ( not ( = ?auto_146706 ?auto_146708 ) ) ( not ( = ?auto_146706 ?auto_146709 ) ) ( not ( = ?auto_146706 ?auto_146710 ) ) ( not ( = ?auto_146706 ?auto_146711 ) ) ( not ( = ?auto_146706 ?auto_146712 ) ) ( not ( = ?auto_146707 ?auto_146708 ) ) ( not ( = ?auto_146707 ?auto_146709 ) ) ( not ( = ?auto_146707 ?auto_146710 ) ) ( not ( = ?auto_146707 ?auto_146711 ) ) ( not ( = ?auto_146707 ?auto_146712 ) ) ( not ( = ?auto_146708 ?auto_146709 ) ) ( not ( = ?auto_146708 ?auto_146710 ) ) ( not ( = ?auto_146708 ?auto_146711 ) ) ( not ( = ?auto_146708 ?auto_146712 ) ) ( not ( = ?auto_146709 ?auto_146710 ) ) ( not ( = ?auto_146709 ?auto_146711 ) ) ( not ( = ?auto_146709 ?auto_146712 ) ) ( not ( = ?auto_146710 ?auto_146711 ) ) ( not ( = ?auto_146710 ?auto_146712 ) ) ( not ( = ?auto_146711 ?auto_146712 ) ) ( ON-TABLE ?auto_146712 ) ( ON ?auto_146711 ?auto_146712 ) ( ON ?auto_146710 ?auto_146711 ) ( ON ?auto_146709 ?auto_146710 ) ( ON ?auto_146708 ?auto_146709 ) ( CLEAR ?auto_146706 ) ( ON ?auto_146707 ?auto_146708 ) ( CLEAR ?auto_146707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146712 ?auto_146711 ?auto_146710 ?auto_146709 ?auto_146708 )
      ( MAKE-8PILE ?auto_146705 ?auto_146706 ?auto_146707 ?auto_146708 ?auto_146709 ?auto_146710 ?auto_146711 ?auto_146712 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146713 - BLOCK
      ?auto_146714 - BLOCK
      ?auto_146715 - BLOCK
      ?auto_146716 - BLOCK
      ?auto_146717 - BLOCK
      ?auto_146718 - BLOCK
      ?auto_146719 - BLOCK
      ?auto_146720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146713 ) ( not ( = ?auto_146713 ?auto_146714 ) ) ( not ( = ?auto_146713 ?auto_146715 ) ) ( not ( = ?auto_146713 ?auto_146716 ) ) ( not ( = ?auto_146713 ?auto_146717 ) ) ( not ( = ?auto_146713 ?auto_146718 ) ) ( not ( = ?auto_146713 ?auto_146719 ) ) ( not ( = ?auto_146713 ?auto_146720 ) ) ( not ( = ?auto_146714 ?auto_146715 ) ) ( not ( = ?auto_146714 ?auto_146716 ) ) ( not ( = ?auto_146714 ?auto_146717 ) ) ( not ( = ?auto_146714 ?auto_146718 ) ) ( not ( = ?auto_146714 ?auto_146719 ) ) ( not ( = ?auto_146714 ?auto_146720 ) ) ( not ( = ?auto_146715 ?auto_146716 ) ) ( not ( = ?auto_146715 ?auto_146717 ) ) ( not ( = ?auto_146715 ?auto_146718 ) ) ( not ( = ?auto_146715 ?auto_146719 ) ) ( not ( = ?auto_146715 ?auto_146720 ) ) ( not ( = ?auto_146716 ?auto_146717 ) ) ( not ( = ?auto_146716 ?auto_146718 ) ) ( not ( = ?auto_146716 ?auto_146719 ) ) ( not ( = ?auto_146716 ?auto_146720 ) ) ( not ( = ?auto_146717 ?auto_146718 ) ) ( not ( = ?auto_146717 ?auto_146719 ) ) ( not ( = ?auto_146717 ?auto_146720 ) ) ( not ( = ?auto_146718 ?auto_146719 ) ) ( not ( = ?auto_146718 ?auto_146720 ) ) ( not ( = ?auto_146719 ?auto_146720 ) ) ( ON-TABLE ?auto_146720 ) ( ON ?auto_146719 ?auto_146720 ) ( ON ?auto_146718 ?auto_146719 ) ( ON ?auto_146717 ?auto_146718 ) ( ON ?auto_146716 ?auto_146717 ) ( ON ?auto_146715 ?auto_146716 ) ( CLEAR ?auto_146715 ) ( HOLDING ?auto_146714 ) ( CLEAR ?auto_146713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146713 ?auto_146714 )
      ( MAKE-8PILE ?auto_146713 ?auto_146714 ?auto_146715 ?auto_146716 ?auto_146717 ?auto_146718 ?auto_146719 ?auto_146720 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146721 - BLOCK
      ?auto_146722 - BLOCK
      ?auto_146723 - BLOCK
      ?auto_146724 - BLOCK
      ?auto_146725 - BLOCK
      ?auto_146726 - BLOCK
      ?auto_146727 - BLOCK
      ?auto_146728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146721 ) ( not ( = ?auto_146721 ?auto_146722 ) ) ( not ( = ?auto_146721 ?auto_146723 ) ) ( not ( = ?auto_146721 ?auto_146724 ) ) ( not ( = ?auto_146721 ?auto_146725 ) ) ( not ( = ?auto_146721 ?auto_146726 ) ) ( not ( = ?auto_146721 ?auto_146727 ) ) ( not ( = ?auto_146721 ?auto_146728 ) ) ( not ( = ?auto_146722 ?auto_146723 ) ) ( not ( = ?auto_146722 ?auto_146724 ) ) ( not ( = ?auto_146722 ?auto_146725 ) ) ( not ( = ?auto_146722 ?auto_146726 ) ) ( not ( = ?auto_146722 ?auto_146727 ) ) ( not ( = ?auto_146722 ?auto_146728 ) ) ( not ( = ?auto_146723 ?auto_146724 ) ) ( not ( = ?auto_146723 ?auto_146725 ) ) ( not ( = ?auto_146723 ?auto_146726 ) ) ( not ( = ?auto_146723 ?auto_146727 ) ) ( not ( = ?auto_146723 ?auto_146728 ) ) ( not ( = ?auto_146724 ?auto_146725 ) ) ( not ( = ?auto_146724 ?auto_146726 ) ) ( not ( = ?auto_146724 ?auto_146727 ) ) ( not ( = ?auto_146724 ?auto_146728 ) ) ( not ( = ?auto_146725 ?auto_146726 ) ) ( not ( = ?auto_146725 ?auto_146727 ) ) ( not ( = ?auto_146725 ?auto_146728 ) ) ( not ( = ?auto_146726 ?auto_146727 ) ) ( not ( = ?auto_146726 ?auto_146728 ) ) ( not ( = ?auto_146727 ?auto_146728 ) ) ( ON-TABLE ?auto_146728 ) ( ON ?auto_146727 ?auto_146728 ) ( ON ?auto_146726 ?auto_146727 ) ( ON ?auto_146725 ?auto_146726 ) ( ON ?auto_146724 ?auto_146725 ) ( ON ?auto_146723 ?auto_146724 ) ( CLEAR ?auto_146721 ) ( ON ?auto_146722 ?auto_146723 ) ( CLEAR ?auto_146722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146728 ?auto_146727 ?auto_146726 ?auto_146725 ?auto_146724 ?auto_146723 )
      ( MAKE-8PILE ?auto_146721 ?auto_146722 ?auto_146723 ?auto_146724 ?auto_146725 ?auto_146726 ?auto_146727 ?auto_146728 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146729 - BLOCK
      ?auto_146730 - BLOCK
      ?auto_146731 - BLOCK
      ?auto_146732 - BLOCK
      ?auto_146733 - BLOCK
      ?auto_146734 - BLOCK
      ?auto_146735 - BLOCK
      ?auto_146736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146729 ?auto_146730 ) ) ( not ( = ?auto_146729 ?auto_146731 ) ) ( not ( = ?auto_146729 ?auto_146732 ) ) ( not ( = ?auto_146729 ?auto_146733 ) ) ( not ( = ?auto_146729 ?auto_146734 ) ) ( not ( = ?auto_146729 ?auto_146735 ) ) ( not ( = ?auto_146729 ?auto_146736 ) ) ( not ( = ?auto_146730 ?auto_146731 ) ) ( not ( = ?auto_146730 ?auto_146732 ) ) ( not ( = ?auto_146730 ?auto_146733 ) ) ( not ( = ?auto_146730 ?auto_146734 ) ) ( not ( = ?auto_146730 ?auto_146735 ) ) ( not ( = ?auto_146730 ?auto_146736 ) ) ( not ( = ?auto_146731 ?auto_146732 ) ) ( not ( = ?auto_146731 ?auto_146733 ) ) ( not ( = ?auto_146731 ?auto_146734 ) ) ( not ( = ?auto_146731 ?auto_146735 ) ) ( not ( = ?auto_146731 ?auto_146736 ) ) ( not ( = ?auto_146732 ?auto_146733 ) ) ( not ( = ?auto_146732 ?auto_146734 ) ) ( not ( = ?auto_146732 ?auto_146735 ) ) ( not ( = ?auto_146732 ?auto_146736 ) ) ( not ( = ?auto_146733 ?auto_146734 ) ) ( not ( = ?auto_146733 ?auto_146735 ) ) ( not ( = ?auto_146733 ?auto_146736 ) ) ( not ( = ?auto_146734 ?auto_146735 ) ) ( not ( = ?auto_146734 ?auto_146736 ) ) ( not ( = ?auto_146735 ?auto_146736 ) ) ( ON-TABLE ?auto_146736 ) ( ON ?auto_146735 ?auto_146736 ) ( ON ?auto_146734 ?auto_146735 ) ( ON ?auto_146733 ?auto_146734 ) ( ON ?auto_146732 ?auto_146733 ) ( ON ?auto_146731 ?auto_146732 ) ( ON ?auto_146730 ?auto_146731 ) ( CLEAR ?auto_146730 ) ( HOLDING ?auto_146729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146729 )
      ( MAKE-8PILE ?auto_146729 ?auto_146730 ?auto_146731 ?auto_146732 ?auto_146733 ?auto_146734 ?auto_146735 ?auto_146736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146737 - BLOCK
      ?auto_146738 - BLOCK
      ?auto_146739 - BLOCK
      ?auto_146740 - BLOCK
      ?auto_146741 - BLOCK
      ?auto_146742 - BLOCK
      ?auto_146743 - BLOCK
      ?auto_146744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146737 ?auto_146738 ) ) ( not ( = ?auto_146737 ?auto_146739 ) ) ( not ( = ?auto_146737 ?auto_146740 ) ) ( not ( = ?auto_146737 ?auto_146741 ) ) ( not ( = ?auto_146737 ?auto_146742 ) ) ( not ( = ?auto_146737 ?auto_146743 ) ) ( not ( = ?auto_146737 ?auto_146744 ) ) ( not ( = ?auto_146738 ?auto_146739 ) ) ( not ( = ?auto_146738 ?auto_146740 ) ) ( not ( = ?auto_146738 ?auto_146741 ) ) ( not ( = ?auto_146738 ?auto_146742 ) ) ( not ( = ?auto_146738 ?auto_146743 ) ) ( not ( = ?auto_146738 ?auto_146744 ) ) ( not ( = ?auto_146739 ?auto_146740 ) ) ( not ( = ?auto_146739 ?auto_146741 ) ) ( not ( = ?auto_146739 ?auto_146742 ) ) ( not ( = ?auto_146739 ?auto_146743 ) ) ( not ( = ?auto_146739 ?auto_146744 ) ) ( not ( = ?auto_146740 ?auto_146741 ) ) ( not ( = ?auto_146740 ?auto_146742 ) ) ( not ( = ?auto_146740 ?auto_146743 ) ) ( not ( = ?auto_146740 ?auto_146744 ) ) ( not ( = ?auto_146741 ?auto_146742 ) ) ( not ( = ?auto_146741 ?auto_146743 ) ) ( not ( = ?auto_146741 ?auto_146744 ) ) ( not ( = ?auto_146742 ?auto_146743 ) ) ( not ( = ?auto_146742 ?auto_146744 ) ) ( not ( = ?auto_146743 ?auto_146744 ) ) ( ON-TABLE ?auto_146744 ) ( ON ?auto_146743 ?auto_146744 ) ( ON ?auto_146742 ?auto_146743 ) ( ON ?auto_146741 ?auto_146742 ) ( ON ?auto_146740 ?auto_146741 ) ( ON ?auto_146739 ?auto_146740 ) ( ON ?auto_146738 ?auto_146739 ) ( ON ?auto_146737 ?auto_146738 ) ( CLEAR ?auto_146737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146744 ?auto_146743 ?auto_146742 ?auto_146741 ?auto_146740 ?auto_146739 ?auto_146738 )
      ( MAKE-8PILE ?auto_146737 ?auto_146738 ?auto_146739 ?auto_146740 ?auto_146741 ?auto_146742 ?auto_146743 ?auto_146744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146753 - BLOCK
      ?auto_146754 - BLOCK
      ?auto_146755 - BLOCK
      ?auto_146756 - BLOCK
      ?auto_146757 - BLOCK
      ?auto_146758 - BLOCK
      ?auto_146759 - BLOCK
      ?auto_146760 - BLOCK
    )
    :vars
    (
      ?auto_146761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146753 ?auto_146754 ) ) ( not ( = ?auto_146753 ?auto_146755 ) ) ( not ( = ?auto_146753 ?auto_146756 ) ) ( not ( = ?auto_146753 ?auto_146757 ) ) ( not ( = ?auto_146753 ?auto_146758 ) ) ( not ( = ?auto_146753 ?auto_146759 ) ) ( not ( = ?auto_146753 ?auto_146760 ) ) ( not ( = ?auto_146754 ?auto_146755 ) ) ( not ( = ?auto_146754 ?auto_146756 ) ) ( not ( = ?auto_146754 ?auto_146757 ) ) ( not ( = ?auto_146754 ?auto_146758 ) ) ( not ( = ?auto_146754 ?auto_146759 ) ) ( not ( = ?auto_146754 ?auto_146760 ) ) ( not ( = ?auto_146755 ?auto_146756 ) ) ( not ( = ?auto_146755 ?auto_146757 ) ) ( not ( = ?auto_146755 ?auto_146758 ) ) ( not ( = ?auto_146755 ?auto_146759 ) ) ( not ( = ?auto_146755 ?auto_146760 ) ) ( not ( = ?auto_146756 ?auto_146757 ) ) ( not ( = ?auto_146756 ?auto_146758 ) ) ( not ( = ?auto_146756 ?auto_146759 ) ) ( not ( = ?auto_146756 ?auto_146760 ) ) ( not ( = ?auto_146757 ?auto_146758 ) ) ( not ( = ?auto_146757 ?auto_146759 ) ) ( not ( = ?auto_146757 ?auto_146760 ) ) ( not ( = ?auto_146758 ?auto_146759 ) ) ( not ( = ?auto_146758 ?auto_146760 ) ) ( not ( = ?auto_146759 ?auto_146760 ) ) ( ON-TABLE ?auto_146760 ) ( ON ?auto_146759 ?auto_146760 ) ( ON ?auto_146758 ?auto_146759 ) ( ON ?auto_146757 ?auto_146758 ) ( ON ?auto_146756 ?auto_146757 ) ( ON ?auto_146755 ?auto_146756 ) ( ON ?auto_146754 ?auto_146755 ) ( CLEAR ?auto_146754 ) ( ON ?auto_146753 ?auto_146761 ) ( CLEAR ?auto_146753 ) ( HAND-EMPTY ) ( not ( = ?auto_146753 ?auto_146761 ) ) ( not ( = ?auto_146754 ?auto_146761 ) ) ( not ( = ?auto_146755 ?auto_146761 ) ) ( not ( = ?auto_146756 ?auto_146761 ) ) ( not ( = ?auto_146757 ?auto_146761 ) ) ( not ( = ?auto_146758 ?auto_146761 ) ) ( not ( = ?auto_146759 ?auto_146761 ) ) ( not ( = ?auto_146760 ?auto_146761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146753 ?auto_146761 )
      ( MAKE-8PILE ?auto_146753 ?auto_146754 ?auto_146755 ?auto_146756 ?auto_146757 ?auto_146758 ?auto_146759 ?auto_146760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146762 - BLOCK
      ?auto_146763 - BLOCK
      ?auto_146764 - BLOCK
      ?auto_146765 - BLOCK
      ?auto_146766 - BLOCK
      ?auto_146767 - BLOCK
      ?auto_146768 - BLOCK
      ?auto_146769 - BLOCK
    )
    :vars
    (
      ?auto_146770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146762 ?auto_146763 ) ) ( not ( = ?auto_146762 ?auto_146764 ) ) ( not ( = ?auto_146762 ?auto_146765 ) ) ( not ( = ?auto_146762 ?auto_146766 ) ) ( not ( = ?auto_146762 ?auto_146767 ) ) ( not ( = ?auto_146762 ?auto_146768 ) ) ( not ( = ?auto_146762 ?auto_146769 ) ) ( not ( = ?auto_146763 ?auto_146764 ) ) ( not ( = ?auto_146763 ?auto_146765 ) ) ( not ( = ?auto_146763 ?auto_146766 ) ) ( not ( = ?auto_146763 ?auto_146767 ) ) ( not ( = ?auto_146763 ?auto_146768 ) ) ( not ( = ?auto_146763 ?auto_146769 ) ) ( not ( = ?auto_146764 ?auto_146765 ) ) ( not ( = ?auto_146764 ?auto_146766 ) ) ( not ( = ?auto_146764 ?auto_146767 ) ) ( not ( = ?auto_146764 ?auto_146768 ) ) ( not ( = ?auto_146764 ?auto_146769 ) ) ( not ( = ?auto_146765 ?auto_146766 ) ) ( not ( = ?auto_146765 ?auto_146767 ) ) ( not ( = ?auto_146765 ?auto_146768 ) ) ( not ( = ?auto_146765 ?auto_146769 ) ) ( not ( = ?auto_146766 ?auto_146767 ) ) ( not ( = ?auto_146766 ?auto_146768 ) ) ( not ( = ?auto_146766 ?auto_146769 ) ) ( not ( = ?auto_146767 ?auto_146768 ) ) ( not ( = ?auto_146767 ?auto_146769 ) ) ( not ( = ?auto_146768 ?auto_146769 ) ) ( ON-TABLE ?auto_146769 ) ( ON ?auto_146768 ?auto_146769 ) ( ON ?auto_146767 ?auto_146768 ) ( ON ?auto_146766 ?auto_146767 ) ( ON ?auto_146765 ?auto_146766 ) ( ON ?auto_146764 ?auto_146765 ) ( ON ?auto_146762 ?auto_146770 ) ( CLEAR ?auto_146762 ) ( not ( = ?auto_146762 ?auto_146770 ) ) ( not ( = ?auto_146763 ?auto_146770 ) ) ( not ( = ?auto_146764 ?auto_146770 ) ) ( not ( = ?auto_146765 ?auto_146770 ) ) ( not ( = ?auto_146766 ?auto_146770 ) ) ( not ( = ?auto_146767 ?auto_146770 ) ) ( not ( = ?auto_146768 ?auto_146770 ) ) ( not ( = ?auto_146769 ?auto_146770 ) ) ( HOLDING ?auto_146763 ) ( CLEAR ?auto_146764 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146769 ?auto_146768 ?auto_146767 ?auto_146766 ?auto_146765 ?auto_146764 ?auto_146763 )
      ( MAKE-8PILE ?auto_146762 ?auto_146763 ?auto_146764 ?auto_146765 ?auto_146766 ?auto_146767 ?auto_146768 ?auto_146769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146771 - BLOCK
      ?auto_146772 - BLOCK
      ?auto_146773 - BLOCK
      ?auto_146774 - BLOCK
      ?auto_146775 - BLOCK
      ?auto_146776 - BLOCK
      ?auto_146777 - BLOCK
      ?auto_146778 - BLOCK
    )
    :vars
    (
      ?auto_146779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146771 ?auto_146772 ) ) ( not ( = ?auto_146771 ?auto_146773 ) ) ( not ( = ?auto_146771 ?auto_146774 ) ) ( not ( = ?auto_146771 ?auto_146775 ) ) ( not ( = ?auto_146771 ?auto_146776 ) ) ( not ( = ?auto_146771 ?auto_146777 ) ) ( not ( = ?auto_146771 ?auto_146778 ) ) ( not ( = ?auto_146772 ?auto_146773 ) ) ( not ( = ?auto_146772 ?auto_146774 ) ) ( not ( = ?auto_146772 ?auto_146775 ) ) ( not ( = ?auto_146772 ?auto_146776 ) ) ( not ( = ?auto_146772 ?auto_146777 ) ) ( not ( = ?auto_146772 ?auto_146778 ) ) ( not ( = ?auto_146773 ?auto_146774 ) ) ( not ( = ?auto_146773 ?auto_146775 ) ) ( not ( = ?auto_146773 ?auto_146776 ) ) ( not ( = ?auto_146773 ?auto_146777 ) ) ( not ( = ?auto_146773 ?auto_146778 ) ) ( not ( = ?auto_146774 ?auto_146775 ) ) ( not ( = ?auto_146774 ?auto_146776 ) ) ( not ( = ?auto_146774 ?auto_146777 ) ) ( not ( = ?auto_146774 ?auto_146778 ) ) ( not ( = ?auto_146775 ?auto_146776 ) ) ( not ( = ?auto_146775 ?auto_146777 ) ) ( not ( = ?auto_146775 ?auto_146778 ) ) ( not ( = ?auto_146776 ?auto_146777 ) ) ( not ( = ?auto_146776 ?auto_146778 ) ) ( not ( = ?auto_146777 ?auto_146778 ) ) ( ON-TABLE ?auto_146778 ) ( ON ?auto_146777 ?auto_146778 ) ( ON ?auto_146776 ?auto_146777 ) ( ON ?auto_146775 ?auto_146776 ) ( ON ?auto_146774 ?auto_146775 ) ( ON ?auto_146773 ?auto_146774 ) ( ON ?auto_146771 ?auto_146779 ) ( not ( = ?auto_146771 ?auto_146779 ) ) ( not ( = ?auto_146772 ?auto_146779 ) ) ( not ( = ?auto_146773 ?auto_146779 ) ) ( not ( = ?auto_146774 ?auto_146779 ) ) ( not ( = ?auto_146775 ?auto_146779 ) ) ( not ( = ?auto_146776 ?auto_146779 ) ) ( not ( = ?auto_146777 ?auto_146779 ) ) ( not ( = ?auto_146778 ?auto_146779 ) ) ( CLEAR ?auto_146773 ) ( ON ?auto_146772 ?auto_146771 ) ( CLEAR ?auto_146772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146779 ?auto_146771 )
      ( MAKE-8PILE ?auto_146771 ?auto_146772 ?auto_146773 ?auto_146774 ?auto_146775 ?auto_146776 ?auto_146777 ?auto_146778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146780 - BLOCK
      ?auto_146781 - BLOCK
      ?auto_146782 - BLOCK
      ?auto_146783 - BLOCK
      ?auto_146784 - BLOCK
      ?auto_146785 - BLOCK
      ?auto_146786 - BLOCK
      ?auto_146787 - BLOCK
    )
    :vars
    (
      ?auto_146788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146780 ?auto_146781 ) ) ( not ( = ?auto_146780 ?auto_146782 ) ) ( not ( = ?auto_146780 ?auto_146783 ) ) ( not ( = ?auto_146780 ?auto_146784 ) ) ( not ( = ?auto_146780 ?auto_146785 ) ) ( not ( = ?auto_146780 ?auto_146786 ) ) ( not ( = ?auto_146780 ?auto_146787 ) ) ( not ( = ?auto_146781 ?auto_146782 ) ) ( not ( = ?auto_146781 ?auto_146783 ) ) ( not ( = ?auto_146781 ?auto_146784 ) ) ( not ( = ?auto_146781 ?auto_146785 ) ) ( not ( = ?auto_146781 ?auto_146786 ) ) ( not ( = ?auto_146781 ?auto_146787 ) ) ( not ( = ?auto_146782 ?auto_146783 ) ) ( not ( = ?auto_146782 ?auto_146784 ) ) ( not ( = ?auto_146782 ?auto_146785 ) ) ( not ( = ?auto_146782 ?auto_146786 ) ) ( not ( = ?auto_146782 ?auto_146787 ) ) ( not ( = ?auto_146783 ?auto_146784 ) ) ( not ( = ?auto_146783 ?auto_146785 ) ) ( not ( = ?auto_146783 ?auto_146786 ) ) ( not ( = ?auto_146783 ?auto_146787 ) ) ( not ( = ?auto_146784 ?auto_146785 ) ) ( not ( = ?auto_146784 ?auto_146786 ) ) ( not ( = ?auto_146784 ?auto_146787 ) ) ( not ( = ?auto_146785 ?auto_146786 ) ) ( not ( = ?auto_146785 ?auto_146787 ) ) ( not ( = ?auto_146786 ?auto_146787 ) ) ( ON-TABLE ?auto_146787 ) ( ON ?auto_146786 ?auto_146787 ) ( ON ?auto_146785 ?auto_146786 ) ( ON ?auto_146784 ?auto_146785 ) ( ON ?auto_146783 ?auto_146784 ) ( ON ?auto_146780 ?auto_146788 ) ( not ( = ?auto_146780 ?auto_146788 ) ) ( not ( = ?auto_146781 ?auto_146788 ) ) ( not ( = ?auto_146782 ?auto_146788 ) ) ( not ( = ?auto_146783 ?auto_146788 ) ) ( not ( = ?auto_146784 ?auto_146788 ) ) ( not ( = ?auto_146785 ?auto_146788 ) ) ( not ( = ?auto_146786 ?auto_146788 ) ) ( not ( = ?auto_146787 ?auto_146788 ) ) ( ON ?auto_146781 ?auto_146780 ) ( CLEAR ?auto_146781 ) ( ON-TABLE ?auto_146788 ) ( HOLDING ?auto_146782 ) ( CLEAR ?auto_146783 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146787 ?auto_146786 ?auto_146785 ?auto_146784 ?auto_146783 ?auto_146782 )
      ( MAKE-8PILE ?auto_146780 ?auto_146781 ?auto_146782 ?auto_146783 ?auto_146784 ?auto_146785 ?auto_146786 ?auto_146787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146789 - BLOCK
      ?auto_146790 - BLOCK
      ?auto_146791 - BLOCK
      ?auto_146792 - BLOCK
      ?auto_146793 - BLOCK
      ?auto_146794 - BLOCK
      ?auto_146795 - BLOCK
      ?auto_146796 - BLOCK
    )
    :vars
    (
      ?auto_146797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146789 ?auto_146790 ) ) ( not ( = ?auto_146789 ?auto_146791 ) ) ( not ( = ?auto_146789 ?auto_146792 ) ) ( not ( = ?auto_146789 ?auto_146793 ) ) ( not ( = ?auto_146789 ?auto_146794 ) ) ( not ( = ?auto_146789 ?auto_146795 ) ) ( not ( = ?auto_146789 ?auto_146796 ) ) ( not ( = ?auto_146790 ?auto_146791 ) ) ( not ( = ?auto_146790 ?auto_146792 ) ) ( not ( = ?auto_146790 ?auto_146793 ) ) ( not ( = ?auto_146790 ?auto_146794 ) ) ( not ( = ?auto_146790 ?auto_146795 ) ) ( not ( = ?auto_146790 ?auto_146796 ) ) ( not ( = ?auto_146791 ?auto_146792 ) ) ( not ( = ?auto_146791 ?auto_146793 ) ) ( not ( = ?auto_146791 ?auto_146794 ) ) ( not ( = ?auto_146791 ?auto_146795 ) ) ( not ( = ?auto_146791 ?auto_146796 ) ) ( not ( = ?auto_146792 ?auto_146793 ) ) ( not ( = ?auto_146792 ?auto_146794 ) ) ( not ( = ?auto_146792 ?auto_146795 ) ) ( not ( = ?auto_146792 ?auto_146796 ) ) ( not ( = ?auto_146793 ?auto_146794 ) ) ( not ( = ?auto_146793 ?auto_146795 ) ) ( not ( = ?auto_146793 ?auto_146796 ) ) ( not ( = ?auto_146794 ?auto_146795 ) ) ( not ( = ?auto_146794 ?auto_146796 ) ) ( not ( = ?auto_146795 ?auto_146796 ) ) ( ON-TABLE ?auto_146796 ) ( ON ?auto_146795 ?auto_146796 ) ( ON ?auto_146794 ?auto_146795 ) ( ON ?auto_146793 ?auto_146794 ) ( ON ?auto_146792 ?auto_146793 ) ( ON ?auto_146789 ?auto_146797 ) ( not ( = ?auto_146789 ?auto_146797 ) ) ( not ( = ?auto_146790 ?auto_146797 ) ) ( not ( = ?auto_146791 ?auto_146797 ) ) ( not ( = ?auto_146792 ?auto_146797 ) ) ( not ( = ?auto_146793 ?auto_146797 ) ) ( not ( = ?auto_146794 ?auto_146797 ) ) ( not ( = ?auto_146795 ?auto_146797 ) ) ( not ( = ?auto_146796 ?auto_146797 ) ) ( ON ?auto_146790 ?auto_146789 ) ( ON-TABLE ?auto_146797 ) ( CLEAR ?auto_146792 ) ( ON ?auto_146791 ?auto_146790 ) ( CLEAR ?auto_146791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146797 ?auto_146789 ?auto_146790 )
      ( MAKE-8PILE ?auto_146789 ?auto_146790 ?auto_146791 ?auto_146792 ?auto_146793 ?auto_146794 ?auto_146795 ?auto_146796 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146798 - BLOCK
      ?auto_146799 - BLOCK
      ?auto_146800 - BLOCK
      ?auto_146801 - BLOCK
      ?auto_146802 - BLOCK
      ?auto_146803 - BLOCK
      ?auto_146804 - BLOCK
      ?auto_146805 - BLOCK
    )
    :vars
    (
      ?auto_146806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146798 ?auto_146799 ) ) ( not ( = ?auto_146798 ?auto_146800 ) ) ( not ( = ?auto_146798 ?auto_146801 ) ) ( not ( = ?auto_146798 ?auto_146802 ) ) ( not ( = ?auto_146798 ?auto_146803 ) ) ( not ( = ?auto_146798 ?auto_146804 ) ) ( not ( = ?auto_146798 ?auto_146805 ) ) ( not ( = ?auto_146799 ?auto_146800 ) ) ( not ( = ?auto_146799 ?auto_146801 ) ) ( not ( = ?auto_146799 ?auto_146802 ) ) ( not ( = ?auto_146799 ?auto_146803 ) ) ( not ( = ?auto_146799 ?auto_146804 ) ) ( not ( = ?auto_146799 ?auto_146805 ) ) ( not ( = ?auto_146800 ?auto_146801 ) ) ( not ( = ?auto_146800 ?auto_146802 ) ) ( not ( = ?auto_146800 ?auto_146803 ) ) ( not ( = ?auto_146800 ?auto_146804 ) ) ( not ( = ?auto_146800 ?auto_146805 ) ) ( not ( = ?auto_146801 ?auto_146802 ) ) ( not ( = ?auto_146801 ?auto_146803 ) ) ( not ( = ?auto_146801 ?auto_146804 ) ) ( not ( = ?auto_146801 ?auto_146805 ) ) ( not ( = ?auto_146802 ?auto_146803 ) ) ( not ( = ?auto_146802 ?auto_146804 ) ) ( not ( = ?auto_146802 ?auto_146805 ) ) ( not ( = ?auto_146803 ?auto_146804 ) ) ( not ( = ?auto_146803 ?auto_146805 ) ) ( not ( = ?auto_146804 ?auto_146805 ) ) ( ON-TABLE ?auto_146805 ) ( ON ?auto_146804 ?auto_146805 ) ( ON ?auto_146803 ?auto_146804 ) ( ON ?auto_146802 ?auto_146803 ) ( ON ?auto_146798 ?auto_146806 ) ( not ( = ?auto_146798 ?auto_146806 ) ) ( not ( = ?auto_146799 ?auto_146806 ) ) ( not ( = ?auto_146800 ?auto_146806 ) ) ( not ( = ?auto_146801 ?auto_146806 ) ) ( not ( = ?auto_146802 ?auto_146806 ) ) ( not ( = ?auto_146803 ?auto_146806 ) ) ( not ( = ?auto_146804 ?auto_146806 ) ) ( not ( = ?auto_146805 ?auto_146806 ) ) ( ON ?auto_146799 ?auto_146798 ) ( ON-TABLE ?auto_146806 ) ( ON ?auto_146800 ?auto_146799 ) ( CLEAR ?auto_146800 ) ( HOLDING ?auto_146801 ) ( CLEAR ?auto_146802 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146805 ?auto_146804 ?auto_146803 ?auto_146802 ?auto_146801 )
      ( MAKE-8PILE ?auto_146798 ?auto_146799 ?auto_146800 ?auto_146801 ?auto_146802 ?auto_146803 ?auto_146804 ?auto_146805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146807 - BLOCK
      ?auto_146808 - BLOCK
      ?auto_146809 - BLOCK
      ?auto_146810 - BLOCK
      ?auto_146811 - BLOCK
      ?auto_146812 - BLOCK
      ?auto_146813 - BLOCK
      ?auto_146814 - BLOCK
    )
    :vars
    (
      ?auto_146815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146807 ?auto_146808 ) ) ( not ( = ?auto_146807 ?auto_146809 ) ) ( not ( = ?auto_146807 ?auto_146810 ) ) ( not ( = ?auto_146807 ?auto_146811 ) ) ( not ( = ?auto_146807 ?auto_146812 ) ) ( not ( = ?auto_146807 ?auto_146813 ) ) ( not ( = ?auto_146807 ?auto_146814 ) ) ( not ( = ?auto_146808 ?auto_146809 ) ) ( not ( = ?auto_146808 ?auto_146810 ) ) ( not ( = ?auto_146808 ?auto_146811 ) ) ( not ( = ?auto_146808 ?auto_146812 ) ) ( not ( = ?auto_146808 ?auto_146813 ) ) ( not ( = ?auto_146808 ?auto_146814 ) ) ( not ( = ?auto_146809 ?auto_146810 ) ) ( not ( = ?auto_146809 ?auto_146811 ) ) ( not ( = ?auto_146809 ?auto_146812 ) ) ( not ( = ?auto_146809 ?auto_146813 ) ) ( not ( = ?auto_146809 ?auto_146814 ) ) ( not ( = ?auto_146810 ?auto_146811 ) ) ( not ( = ?auto_146810 ?auto_146812 ) ) ( not ( = ?auto_146810 ?auto_146813 ) ) ( not ( = ?auto_146810 ?auto_146814 ) ) ( not ( = ?auto_146811 ?auto_146812 ) ) ( not ( = ?auto_146811 ?auto_146813 ) ) ( not ( = ?auto_146811 ?auto_146814 ) ) ( not ( = ?auto_146812 ?auto_146813 ) ) ( not ( = ?auto_146812 ?auto_146814 ) ) ( not ( = ?auto_146813 ?auto_146814 ) ) ( ON-TABLE ?auto_146814 ) ( ON ?auto_146813 ?auto_146814 ) ( ON ?auto_146812 ?auto_146813 ) ( ON ?auto_146811 ?auto_146812 ) ( ON ?auto_146807 ?auto_146815 ) ( not ( = ?auto_146807 ?auto_146815 ) ) ( not ( = ?auto_146808 ?auto_146815 ) ) ( not ( = ?auto_146809 ?auto_146815 ) ) ( not ( = ?auto_146810 ?auto_146815 ) ) ( not ( = ?auto_146811 ?auto_146815 ) ) ( not ( = ?auto_146812 ?auto_146815 ) ) ( not ( = ?auto_146813 ?auto_146815 ) ) ( not ( = ?auto_146814 ?auto_146815 ) ) ( ON ?auto_146808 ?auto_146807 ) ( ON-TABLE ?auto_146815 ) ( ON ?auto_146809 ?auto_146808 ) ( CLEAR ?auto_146811 ) ( ON ?auto_146810 ?auto_146809 ) ( CLEAR ?auto_146810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146815 ?auto_146807 ?auto_146808 ?auto_146809 )
      ( MAKE-8PILE ?auto_146807 ?auto_146808 ?auto_146809 ?auto_146810 ?auto_146811 ?auto_146812 ?auto_146813 ?auto_146814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146816 - BLOCK
      ?auto_146817 - BLOCK
      ?auto_146818 - BLOCK
      ?auto_146819 - BLOCK
      ?auto_146820 - BLOCK
      ?auto_146821 - BLOCK
      ?auto_146822 - BLOCK
      ?auto_146823 - BLOCK
    )
    :vars
    (
      ?auto_146824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146816 ?auto_146817 ) ) ( not ( = ?auto_146816 ?auto_146818 ) ) ( not ( = ?auto_146816 ?auto_146819 ) ) ( not ( = ?auto_146816 ?auto_146820 ) ) ( not ( = ?auto_146816 ?auto_146821 ) ) ( not ( = ?auto_146816 ?auto_146822 ) ) ( not ( = ?auto_146816 ?auto_146823 ) ) ( not ( = ?auto_146817 ?auto_146818 ) ) ( not ( = ?auto_146817 ?auto_146819 ) ) ( not ( = ?auto_146817 ?auto_146820 ) ) ( not ( = ?auto_146817 ?auto_146821 ) ) ( not ( = ?auto_146817 ?auto_146822 ) ) ( not ( = ?auto_146817 ?auto_146823 ) ) ( not ( = ?auto_146818 ?auto_146819 ) ) ( not ( = ?auto_146818 ?auto_146820 ) ) ( not ( = ?auto_146818 ?auto_146821 ) ) ( not ( = ?auto_146818 ?auto_146822 ) ) ( not ( = ?auto_146818 ?auto_146823 ) ) ( not ( = ?auto_146819 ?auto_146820 ) ) ( not ( = ?auto_146819 ?auto_146821 ) ) ( not ( = ?auto_146819 ?auto_146822 ) ) ( not ( = ?auto_146819 ?auto_146823 ) ) ( not ( = ?auto_146820 ?auto_146821 ) ) ( not ( = ?auto_146820 ?auto_146822 ) ) ( not ( = ?auto_146820 ?auto_146823 ) ) ( not ( = ?auto_146821 ?auto_146822 ) ) ( not ( = ?auto_146821 ?auto_146823 ) ) ( not ( = ?auto_146822 ?auto_146823 ) ) ( ON-TABLE ?auto_146823 ) ( ON ?auto_146822 ?auto_146823 ) ( ON ?auto_146821 ?auto_146822 ) ( ON ?auto_146816 ?auto_146824 ) ( not ( = ?auto_146816 ?auto_146824 ) ) ( not ( = ?auto_146817 ?auto_146824 ) ) ( not ( = ?auto_146818 ?auto_146824 ) ) ( not ( = ?auto_146819 ?auto_146824 ) ) ( not ( = ?auto_146820 ?auto_146824 ) ) ( not ( = ?auto_146821 ?auto_146824 ) ) ( not ( = ?auto_146822 ?auto_146824 ) ) ( not ( = ?auto_146823 ?auto_146824 ) ) ( ON ?auto_146817 ?auto_146816 ) ( ON-TABLE ?auto_146824 ) ( ON ?auto_146818 ?auto_146817 ) ( ON ?auto_146819 ?auto_146818 ) ( CLEAR ?auto_146819 ) ( HOLDING ?auto_146820 ) ( CLEAR ?auto_146821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146823 ?auto_146822 ?auto_146821 ?auto_146820 )
      ( MAKE-8PILE ?auto_146816 ?auto_146817 ?auto_146818 ?auto_146819 ?auto_146820 ?auto_146821 ?auto_146822 ?auto_146823 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146825 - BLOCK
      ?auto_146826 - BLOCK
      ?auto_146827 - BLOCK
      ?auto_146828 - BLOCK
      ?auto_146829 - BLOCK
      ?auto_146830 - BLOCK
      ?auto_146831 - BLOCK
      ?auto_146832 - BLOCK
    )
    :vars
    (
      ?auto_146833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146825 ?auto_146826 ) ) ( not ( = ?auto_146825 ?auto_146827 ) ) ( not ( = ?auto_146825 ?auto_146828 ) ) ( not ( = ?auto_146825 ?auto_146829 ) ) ( not ( = ?auto_146825 ?auto_146830 ) ) ( not ( = ?auto_146825 ?auto_146831 ) ) ( not ( = ?auto_146825 ?auto_146832 ) ) ( not ( = ?auto_146826 ?auto_146827 ) ) ( not ( = ?auto_146826 ?auto_146828 ) ) ( not ( = ?auto_146826 ?auto_146829 ) ) ( not ( = ?auto_146826 ?auto_146830 ) ) ( not ( = ?auto_146826 ?auto_146831 ) ) ( not ( = ?auto_146826 ?auto_146832 ) ) ( not ( = ?auto_146827 ?auto_146828 ) ) ( not ( = ?auto_146827 ?auto_146829 ) ) ( not ( = ?auto_146827 ?auto_146830 ) ) ( not ( = ?auto_146827 ?auto_146831 ) ) ( not ( = ?auto_146827 ?auto_146832 ) ) ( not ( = ?auto_146828 ?auto_146829 ) ) ( not ( = ?auto_146828 ?auto_146830 ) ) ( not ( = ?auto_146828 ?auto_146831 ) ) ( not ( = ?auto_146828 ?auto_146832 ) ) ( not ( = ?auto_146829 ?auto_146830 ) ) ( not ( = ?auto_146829 ?auto_146831 ) ) ( not ( = ?auto_146829 ?auto_146832 ) ) ( not ( = ?auto_146830 ?auto_146831 ) ) ( not ( = ?auto_146830 ?auto_146832 ) ) ( not ( = ?auto_146831 ?auto_146832 ) ) ( ON-TABLE ?auto_146832 ) ( ON ?auto_146831 ?auto_146832 ) ( ON ?auto_146830 ?auto_146831 ) ( ON ?auto_146825 ?auto_146833 ) ( not ( = ?auto_146825 ?auto_146833 ) ) ( not ( = ?auto_146826 ?auto_146833 ) ) ( not ( = ?auto_146827 ?auto_146833 ) ) ( not ( = ?auto_146828 ?auto_146833 ) ) ( not ( = ?auto_146829 ?auto_146833 ) ) ( not ( = ?auto_146830 ?auto_146833 ) ) ( not ( = ?auto_146831 ?auto_146833 ) ) ( not ( = ?auto_146832 ?auto_146833 ) ) ( ON ?auto_146826 ?auto_146825 ) ( ON-TABLE ?auto_146833 ) ( ON ?auto_146827 ?auto_146826 ) ( ON ?auto_146828 ?auto_146827 ) ( CLEAR ?auto_146830 ) ( ON ?auto_146829 ?auto_146828 ) ( CLEAR ?auto_146829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146833 ?auto_146825 ?auto_146826 ?auto_146827 ?auto_146828 )
      ( MAKE-8PILE ?auto_146825 ?auto_146826 ?auto_146827 ?auto_146828 ?auto_146829 ?auto_146830 ?auto_146831 ?auto_146832 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146834 - BLOCK
      ?auto_146835 - BLOCK
      ?auto_146836 - BLOCK
      ?auto_146837 - BLOCK
      ?auto_146838 - BLOCK
      ?auto_146839 - BLOCK
      ?auto_146840 - BLOCK
      ?auto_146841 - BLOCK
    )
    :vars
    (
      ?auto_146842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146834 ?auto_146835 ) ) ( not ( = ?auto_146834 ?auto_146836 ) ) ( not ( = ?auto_146834 ?auto_146837 ) ) ( not ( = ?auto_146834 ?auto_146838 ) ) ( not ( = ?auto_146834 ?auto_146839 ) ) ( not ( = ?auto_146834 ?auto_146840 ) ) ( not ( = ?auto_146834 ?auto_146841 ) ) ( not ( = ?auto_146835 ?auto_146836 ) ) ( not ( = ?auto_146835 ?auto_146837 ) ) ( not ( = ?auto_146835 ?auto_146838 ) ) ( not ( = ?auto_146835 ?auto_146839 ) ) ( not ( = ?auto_146835 ?auto_146840 ) ) ( not ( = ?auto_146835 ?auto_146841 ) ) ( not ( = ?auto_146836 ?auto_146837 ) ) ( not ( = ?auto_146836 ?auto_146838 ) ) ( not ( = ?auto_146836 ?auto_146839 ) ) ( not ( = ?auto_146836 ?auto_146840 ) ) ( not ( = ?auto_146836 ?auto_146841 ) ) ( not ( = ?auto_146837 ?auto_146838 ) ) ( not ( = ?auto_146837 ?auto_146839 ) ) ( not ( = ?auto_146837 ?auto_146840 ) ) ( not ( = ?auto_146837 ?auto_146841 ) ) ( not ( = ?auto_146838 ?auto_146839 ) ) ( not ( = ?auto_146838 ?auto_146840 ) ) ( not ( = ?auto_146838 ?auto_146841 ) ) ( not ( = ?auto_146839 ?auto_146840 ) ) ( not ( = ?auto_146839 ?auto_146841 ) ) ( not ( = ?auto_146840 ?auto_146841 ) ) ( ON-TABLE ?auto_146841 ) ( ON ?auto_146840 ?auto_146841 ) ( ON ?auto_146834 ?auto_146842 ) ( not ( = ?auto_146834 ?auto_146842 ) ) ( not ( = ?auto_146835 ?auto_146842 ) ) ( not ( = ?auto_146836 ?auto_146842 ) ) ( not ( = ?auto_146837 ?auto_146842 ) ) ( not ( = ?auto_146838 ?auto_146842 ) ) ( not ( = ?auto_146839 ?auto_146842 ) ) ( not ( = ?auto_146840 ?auto_146842 ) ) ( not ( = ?auto_146841 ?auto_146842 ) ) ( ON ?auto_146835 ?auto_146834 ) ( ON-TABLE ?auto_146842 ) ( ON ?auto_146836 ?auto_146835 ) ( ON ?auto_146837 ?auto_146836 ) ( ON ?auto_146838 ?auto_146837 ) ( CLEAR ?auto_146838 ) ( HOLDING ?auto_146839 ) ( CLEAR ?auto_146840 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146841 ?auto_146840 ?auto_146839 )
      ( MAKE-8PILE ?auto_146834 ?auto_146835 ?auto_146836 ?auto_146837 ?auto_146838 ?auto_146839 ?auto_146840 ?auto_146841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146843 - BLOCK
      ?auto_146844 - BLOCK
      ?auto_146845 - BLOCK
      ?auto_146846 - BLOCK
      ?auto_146847 - BLOCK
      ?auto_146848 - BLOCK
      ?auto_146849 - BLOCK
      ?auto_146850 - BLOCK
    )
    :vars
    (
      ?auto_146851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146843 ?auto_146844 ) ) ( not ( = ?auto_146843 ?auto_146845 ) ) ( not ( = ?auto_146843 ?auto_146846 ) ) ( not ( = ?auto_146843 ?auto_146847 ) ) ( not ( = ?auto_146843 ?auto_146848 ) ) ( not ( = ?auto_146843 ?auto_146849 ) ) ( not ( = ?auto_146843 ?auto_146850 ) ) ( not ( = ?auto_146844 ?auto_146845 ) ) ( not ( = ?auto_146844 ?auto_146846 ) ) ( not ( = ?auto_146844 ?auto_146847 ) ) ( not ( = ?auto_146844 ?auto_146848 ) ) ( not ( = ?auto_146844 ?auto_146849 ) ) ( not ( = ?auto_146844 ?auto_146850 ) ) ( not ( = ?auto_146845 ?auto_146846 ) ) ( not ( = ?auto_146845 ?auto_146847 ) ) ( not ( = ?auto_146845 ?auto_146848 ) ) ( not ( = ?auto_146845 ?auto_146849 ) ) ( not ( = ?auto_146845 ?auto_146850 ) ) ( not ( = ?auto_146846 ?auto_146847 ) ) ( not ( = ?auto_146846 ?auto_146848 ) ) ( not ( = ?auto_146846 ?auto_146849 ) ) ( not ( = ?auto_146846 ?auto_146850 ) ) ( not ( = ?auto_146847 ?auto_146848 ) ) ( not ( = ?auto_146847 ?auto_146849 ) ) ( not ( = ?auto_146847 ?auto_146850 ) ) ( not ( = ?auto_146848 ?auto_146849 ) ) ( not ( = ?auto_146848 ?auto_146850 ) ) ( not ( = ?auto_146849 ?auto_146850 ) ) ( ON-TABLE ?auto_146850 ) ( ON ?auto_146849 ?auto_146850 ) ( ON ?auto_146843 ?auto_146851 ) ( not ( = ?auto_146843 ?auto_146851 ) ) ( not ( = ?auto_146844 ?auto_146851 ) ) ( not ( = ?auto_146845 ?auto_146851 ) ) ( not ( = ?auto_146846 ?auto_146851 ) ) ( not ( = ?auto_146847 ?auto_146851 ) ) ( not ( = ?auto_146848 ?auto_146851 ) ) ( not ( = ?auto_146849 ?auto_146851 ) ) ( not ( = ?auto_146850 ?auto_146851 ) ) ( ON ?auto_146844 ?auto_146843 ) ( ON-TABLE ?auto_146851 ) ( ON ?auto_146845 ?auto_146844 ) ( ON ?auto_146846 ?auto_146845 ) ( ON ?auto_146847 ?auto_146846 ) ( CLEAR ?auto_146849 ) ( ON ?auto_146848 ?auto_146847 ) ( CLEAR ?auto_146848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146851 ?auto_146843 ?auto_146844 ?auto_146845 ?auto_146846 ?auto_146847 )
      ( MAKE-8PILE ?auto_146843 ?auto_146844 ?auto_146845 ?auto_146846 ?auto_146847 ?auto_146848 ?auto_146849 ?auto_146850 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146852 - BLOCK
      ?auto_146853 - BLOCK
      ?auto_146854 - BLOCK
      ?auto_146855 - BLOCK
      ?auto_146856 - BLOCK
      ?auto_146857 - BLOCK
      ?auto_146858 - BLOCK
      ?auto_146859 - BLOCK
    )
    :vars
    (
      ?auto_146860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146852 ?auto_146853 ) ) ( not ( = ?auto_146852 ?auto_146854 ) ) ( not ( = ?auto_146852 ?auto_146855 ) ) ( not ( = ?auto_146852 ?auto_146856 ) ) ( not ( = ?auto_146852 ?auto_146857 ) ) ( not ( = ?auto_146852 ?auto_146858 ) ) ( not ( = ?auto_146852 ?auto_146859 ) ) ( not ( = ?auto_146853 ?auto_146854 ) ) ( not ( = ?auto_146853 ?auto_146855 ) ) ( not ( = ?auto_146853 ?auto_146856 ) ) ( not ( = ?auto_146853 ?auto_146857 ) ) ( not ( = ?auto_146853 ?auto_146858 ) ) ( not ( = ?auto_146853 ?auto_146859 ) ) ( not ( = ?auto_146854 ?auto_146855 ) ) ( not ( = ?auto_146854 ?auto_146856 ) ) ( not ( = ?auto_146854 ?auto_146857 ) ) ( not ( = ?auto_146854 ?auto_146858 ) ) ( not ( = ?auto_146854 ?auto_146859 ) ) ( not ( = ?auto_146855 ?auto_146856 ) ) ( not ( = ?auto_146855 ?auto_146857 ) ) ( not ( = ?auto_146855 ?auto_146858 ) ) ( not ( = ?auto_146855 ?auto_146859 ) ) ( not ( = ?auto_146856 ?auto_146857 ) ) ( not ( = ?auto_146856 ?auto_146858 ) ) ( not ( = ?auto_146856 ?auto_146859 ) ) ( not ( = ?auto_146857 ?auto_146858 ) ) ( not ( = ?auto_146857 ?auto_146859 ) ) ( not ( = ?auto_146858 ?auto_146859 ) ) ( ON-TABLE ?auto_146859 ) ( ON ?auto_146852 ?auto_146860 ) ( not ( = ?auto_146852 ?auto_146860 ) ) ( not ( = ?auto_146853 ?auto_146860 ) ) ( not ( = ?auto_146854 ?auto_146860 ) ) ( not ( = ?auto_146855 ?auto_146860 ) ) ( not ( = ?auto_146856 ?auto_146860 ) ) ( not ( = ?auto_146857 ?auto_146860 ) ) ( not ( = ?auto_146858 ?auto_146860 ) ) ( not ( = ?auto_146859 ?auto_146860 ) ) ( ON ?auto_146853 ?auto_146852 ) ( ON-TABLE ?auto_146860 ) ( ON ?auto_146854 ?auto_146853 ) ( ON ?auto_146855 ?auto_146854 ) ( ON ?auto_146856 ?auto_146855 ) ( ON ?auto_146857 ?auto_146856 ) ( CLEAR ?auto_146857 ) ( HOLDING ?auto_146858 ) ( CLEAR ?auto_146859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146859 ?auto_146858 )
      ( MAKE-8PILE ?auto_146852 ?auto_146853 ?auto_146854 ?auto_146855 ?auto_146856 ?auto_146857 ?auto_146858 ?auto_146859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146861 - BLOCK
      ?auto_146862 - BLOCK
      ?auto_146863 - BLOCK
      ?auto_146864 - BLOCK
      ?auto_146865 - BLOCK
      ?auto_146866 - BLOCK
      ?auto_146867 - BLOCK
      ?auto_146868 - BLOCK
    )
    :vars
    (
      ?auto_146869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146861 ?auto_146862 ) ) ( not ( = ?auto_146861 ?auto_146863 ) ) ( not ( = ?auto_146861 ?auto_146864 ) ) ( not ( = ?auto_146861 ?auto_146865 ) ) ( not ( = ?auto_146861 ?auto_146866 ) ) ( not ( = ?auto_146861 ?auto_146867 ) ) ( not ( = ?auto_146861 ?auto_146868 ) ) ( not ( = ?auto_146862 ?auto_146863 ) ) ( not ( = ?auto_146862 ?auto_146864 ) ) ( not ( = ?auto_146862 ?auto_146865 ) ) ( not ( = ?auto_146862 ?auto_146866 ) ) ( not ( = ?auto_146862 ?auto_146867 ) ) ( not ( = ?auto_146862 ?auto_146868 ) ) ( not ( = ?auto_146863 ?auto_146864 ) ) ( not ( = ?auto_146863 ?auto_146865 ) ) ( not ( = ?auto_146863 ?auto_146866 ) ) ( not ( = ?auto_146863 ?auto_146867 ) ) ( not ( = ?auto_146863 ?auto_146868 ) ) ( not ( = ?auto_146864 ?auto_146865 ) ) ( not ( = ?auto_146864 ?auto_146866 ) ) ( not ( = ?auto_146864 ?auto_146867 ) ) ( not ( = ?auto_146864 ?auto_146868 ) ) ( not ( = ?auto_146865 ?auto_146866 ) ) ( not ( = ?auto_146865 ?auto_146867 ) ) ( not ( = ?auto_146865 ?auto_146868 ) ) ( not ( = ?auto_146866 ?auto_146867 ) ) ( not ( = ?auto_146866 ?auto_146868 ) ) ( not ( = ?auto_146867 ?auto_146868 ) ) ( ON-TABLE ?auto_146868 ) ( ON ?auto_146861 ?auto_146869 ) ( not ( = ?auto_146861 ?auto_146869 ) ) ( not ( = ?auto_146862 ?auto_146869 ) ) ( not ( = ?auto_146863 ?auto_146869 ) ) ( not ( = ?auto_146864 ?auto_146869 ) ) ( not ( = ?auto_146865 ?auto_146869 ) ) ( not ( = ?auto_146866 ?auto_146869 ) ) ( not ( = ?auto_146867 ?auto_146869 ) ) ( not ( = ?auto_146868 ?auto_146869 ) ) ( ON ?auto_146862 ?auto_146861 ) ( ON-TABLE ?auto_146869 ) ( ON ?auto_146863 ?auto_146862 ) ( ON ?auto_146864 ?auto_146863 ) ( ON ?auto_146865 ?auto_146864 ) ( ON ?auto_146866 ?auto_146865 ) ( CLEAR ?auto_146868 ) ( ON ?auto_146867 ?auto_146866 ) ( CLEAR ?auto_146867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146869 ?auto_146861 ?auto_146862 ?auto_146863 ?auto_146864 ?auto_146865 ?auto_146866 )
      ( MAKE-8PILE ?auto_146861 ?auto_146862 ?auto_146863 ?auto_146864 ?auto_146865 ?auto_146866 ?auto_146867 ?auto_146868 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146870 - BLOCK
      ?auto_146871 - BLOCK
      ?auto_146872 - BLOCK
      ?auto_146873 - BLOCK
      ?auto_146874 - BLOCK
      ?auto_146875 - BLOCK
      ?auto_146876 - BLOCK
      ?auto_146877 - BLOCK
    )
    :vars
    (
      ?auto_146878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146870 ?auto_146871 ) ) ( not ( = ?auto_146870 ?auto_146872 ) ) ( not ( = ?auto_146870 ?auto_146873 ) ) ( not ( = ?auto_146870 ?auto_146874 ) ) ( not ( = ?auto_146870 ?auto_146875 ) ) ( not ( = ?auto_146870 ?auto_146876 ) ) ( not ( = ?auto_146870 ?auto_146877 ) ) ( not ( = ?auto_146871 ?auto_146872 ) ) ( not ( = ?auto_146871 ?auto_146873 ) ) ( not ( = ?auto_146871 ?auto_146874 ) ) ( not ( = ?auto_146871 ?auto_146875 ) ) ( not ( = ?auto_146871 ?auto_146876 ) ) ( not ( = ?auto_146871 ?auto_146877 ) ) ( not ( = ?auto_146872 ?auto_146873 ) ) ( not ( = ?auto_146872 ?auto_146874 ) ) ( not ( = ?auto_146872 ?auto_146875 ) ) ( not ( = ?auto_146872 ?auto_146876 ) ) ( not ( = ?auto_146872 ?auto_146877 ) ) ( not ( = ?auto_146873 ?auto_146874 ) ) ( not ( = ?auto_146873 ?auto_146875 ) ) ( not ( = ?auto_146873 ?auto_146876 ) ) ( not ( = ?auto_146873 ?auto_146877 ) ) ( not ( = ?auto_146874 ?auto_146875 ) ) ( not ( = ?auto_146874 ?auto_146876 ) ) ( not ( = ?auto_146874 ?auto_146877 ) ) ( not ( = ?auto_146875 ?auto_146876 ) ) ( not ( = ?auto_146875 ?auto_146877 ) ) ( not ( = ?auto_146876 ?auto_146877 ) ) ( ON ?auto_146870 ?auto_146878 ) ( not ( = ?auto_146870 ?auto_146878 ) ) ( not ( = ?auto_146871 ?auto_146878 ) ) ( not ( = ?auto_146872 ?auto_146878 ) ) ( not ( = ?auto_146873 ?auto_146878 ) ) ( not ( = ?auto_146874 ?auto_146878 ) ) ( not ( = ?auto_146875 ?auto_146878 ) ) ( not ( = ?auto_146876 ?auto_146878 ) ) ( not ( = ?auto_146877 ?auto_146878 ) ) ( ON ?auto_146871 ?auto_146870 ) ( ON-TABLE ?auto_146878 ) ( ON ?auto_146872 ?auto_146871 ) ( ON ?auto_146873 ?auto_146872 ) ( ON ?auto_146874 ?auto_146873 ) ( ON ?auto_146875 ?auto_146874 ) ( ON ?auto_146876 ?auto_146875 ) ( CLEAR ?auto_146876 ) ( HOLDING ?auto_146877 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146877 )
      ( MAKE-8PILE ?auto_146870 ?auto_146871 ?auto_146872 ?auto_146873 ?auto_146874 ?auto_146875 ?auto_146876 ?auto_146877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146879 - BLOCK
      ?auto_146880 - BLOCK
      ?auto_146881 - BLOCK
      ?auto_146882 - BLOCK
      ?auto_146883 - BLOCK
      ?auto_146884 - BLOCK
      ?auto_146885 - BLOCK
      ?auto_146886 - BLOCK
    )
    :vars
    (
      ?auto_146887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146879 ?auto_146880 ) ) ( not ( = ?auto_146879 ?auto_146881 ) ) ( not ( = ?auto_146879 ?auto_146882 ) ) ( not ( = ?auto_146879 ?auto_146883 ) ) ( not ( = ?auto_146879 ?auto_146884 ) ) ( not ( = ?auto_146879 ?auto_146885 ) ) ( not ( = ?auto_146879 ?auto_146886 ) ) ( not ( = ?auto_146880 ?auto_146881 ) ) ( not ( = ?auto_146880 ?auto_146882 ) ) ( not ( = ?auto_146880 ?auto_146883 ) ) ( not ( = ?auto_146880 ?auto_146884 ) ) ( not ( = ?auto_146880 ?auto_146885 ) ) ( not ( = ?auto_146880 ?auto_146886 ) ) ( not ( = ?auto_146881 ?auto_146882 ) ) ( not ( = ?auto_146881 ?auto_146883 ) ) ( not ( = ?auto_146881 ?auto_146884 ) ) ( not ( = ?auto_146881 ?auto_146885 ) ) ( not ( = ?auto_146881 ?auto_146886 ) ) ( not ( = ?auto_146882 ?auto_146883 ) ) ( not ( = ?auto_146882 ?auto_146884 ) ) ( not ( = ?auto_146882 ?auto_146885 ) ) ( not ( = ?auto_146882 ?auto_146886 ) ) ( not ( = ?auto_146883 ?auto_146884 ) ) ( not ( = ?auto_146883 ?auto_146885 ) ) ( not ( = ?auto_146883 ?auto_146886 ) ) ( not ( = ?auto_146884 ?auto_146885 ) ) ( not ( = ?auto_146884 ?auto_146886 ) ) ( not ( = ?auto_146885 ?auto_146886 ) ) ( ON ?auto_146879 ?auto_146887 ) ( not ( = ?auto_146879 ?auto_146887 ) ) ( not ( = ?auto_146880 ?auto_146887 ) ) ( not ( = ?auto_146881 ?auto_146887 ) ) ( not ( = ?auto_146882 ?auto_146887 ) ) ( not ( = ?auto_146883 ?auto_146887 ) ) ( not ( = ?auto_146884 ?auto_146887 ) ) ( not ( = ?auto_146885 ?auto_146887 ) ) ( not ( = ?auto_146886 ?auto_146887 ) ) ( ON ?auto_146880 ?auto_146879 ) ( ON-TABLE ?auto_146887 ) ( ON ?auto_146881 ?auto_146880 ) ( ON ?auto_146882 ?auto_146881 ) ( ON ?auto_146883 ?auto_146882 ) ( ON ?auto_146884 ?auto_146883 ) ( ON ?auto_146885 ?auto_146884 ) ( ON ?auto_146886 ?auto_146885 ) ( CLEAR ?auto_146886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146887 ?auto_146879 ?auto_146880 ?auto_146881 ?auto_146882 ?auto_146883 ?auto_146884 ?auto_146885 )
      ( MAKE-8PILE ?auto_146879 ?auto_146880 ?auto_146881 ?auto_146882 ?auto_146883 ?auto_146884 ?auto_146885 ?auto_146886 ) )
  )

)

