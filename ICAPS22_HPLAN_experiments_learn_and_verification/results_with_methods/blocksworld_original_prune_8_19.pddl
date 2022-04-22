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
      ?auto_188157 - BLOCK
      ?auto_188158 - BLOCK
      ?auto_188159 - BLOCK
      ?auto_188160 - BLOCK
      ?auto_188161 - BLOCK
      ?auto_188162 - BLOCK
      ?auto_188163 - BLOCK
      ?auto_188164 - BLOCK
    )
    :vars
    (
      ?auto_188165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188165 ?auto_188164 ) ( CLEAR ?auto_188165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188157 ) ( ON ?auto_188158 ?auto_188157 ) ( ON ?auto_188159 ?auto_188158 ) ( ON ?auto_188160 ?auto_188159 ) ( ON ?auto_188161 ?auto_188160 ) ( ON ?auto_188162 ?auto_188161 ) ( ON ?auto_188163 ?auto_188162 ) ( ON ?auto_188164 ?auto_188163 ) ( not ( = ?auto_188157 ?auto_188158 ) ) ( not ( = ?auto_188157 ?auto_188159 ) ) ( not ( = ?auto_188157 ?auto_188160 ) ) ( not ( = ?auto_188157 ?auto_188161 ) ) ( not ( = ?auto_188157 ?auto_188162 ) ) ( not ( = ?auto_188157 ?auto_188163 ) ) ( not ( = ?auto_188157 ?auto_188164 ) ) ( not ( = ?auto_188157 ?auto_188165 ) ) ( not ( = ?auto_188158 ?auto_188159 ) ) ( not ( = ?auto_188158 ?auto_188160 ) ) ( not ( = ?auto_188158 ?auto_188161 ) ) ( not ( = ?auto_188158 ?auto_188162 ) ) ( not ( = ?auto_188158 ?auto_188163 ) ) ( not ( = ?auto_188158 ?auto_188164 ) ) ( not ( = ?auto_188158 ?auto_188165 ) ) ( not ( = ?auto_188159 ?auto_188160 ) ) ( not ( = ?auto_188159 ?auto_188161 ) ) ( not ( = ?auto_188159 ?auto_188162 ) ) ( not ( = ?auto_188159 ?auto_188163 ) ) ( not ( = ?auto_188159 ?auto_188164 ) ) ( not ( = ?auto_188159 ?auto_188165 ) ) ( not ( = ?auto_188160 ?auto_188161 ) ) ( not ( = ?auto_188160 ?auto_188162 ) ) ( not ( = ?auto_188160 ?auto_188163 ) ) ( not ( = ?auto_188160 ?auto_188164 ) ) ( not ( = ?auto_188160 ?auto_188165 ) ) ( not ( = ?auto_188161 ?auto_188162 ) ) ( not ( = ?auto_188161 ?auto_188163 ) ) ( not ( = ?auto_188161 ?auto_188164 ) ) ( not ( = ?auto_188161 ?auto_188165 ) ) ( not ( = ?auto_188162 ?auto_188163 ) ) ( not ( = ?auto_188162 ?auto_188164 ) ) ( not ( = ?auto_188162 ?auto_188165 ) ) ( not ( = ?auto_188163 ?auto_188164 ) ) ( not ( = ?auto_188163 ?auto_188165 ) ) ( not ( = ?auto_188164 ?auto_188165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188165 ?auto_188164 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188167 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188167 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_188167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188168 - BLOCK
    )
    :vars
    (
      ?auto_188169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188168 ?auto_188169 ) ( CLEAR ?auto_188168 ) ( HAND-EMPTY ) ( not ( = ?auto_188168 ?auto_188169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188168 ?auto_188169 )
      ( MAKE-1PILE ?auto_188168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188177 - BLOCK
      ?auto_188178 - BLOCK
      ?auto_188179 - BLOCK
      ?auto_188180 - BLOCK
      ?auto_188181 - BLOCK
      ?auto_188182 - BLOCK
      ?auto_188183 - BLOCK
    )
    :vars
    (
      ?auto_188184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188184 ?auto_188183 ) ( CLEAR ?auto_188184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188177 ) ( ON ?auto_188178 ?auto_188177 ) ( ON ?auto_188179 ?auto_188178 ) ( ON ?auto_188180 ?auto_188179 ) ( ON ?auto_188181 ?auto_188180 ) ( ON ?auto_188182 ?auto_188181 ) ( ON ?auto_188183 ?auto_188182 ) ( not ( = ?auto_188177 ?auto_188178 ) ) ( not ( = ?auto_188177 ?auto_188179 ) ) ( not ( = ?auto_188177 ?auto_188180 ) ) ( not ( = ?auto_188177 ?auto_188181 ) ) ( not ( = ?auto_188177 ?auto_188182 ) ) ( not ( = ?auto_188177 ?auto_188183 ) ) ( not ( = ?auto_188177 ?auto_188184 ) ) ( not ( = ?auto_188178 ?auto_188179 ) ) ( not ( = ?auto_188178 ?auto_188180 ) ) ( not ( = ?auto_188178 ?auto_188181 ) ) ( not ( = ?auto_188178 ?auto_188182 ) ) ( not ( = ?auto_188178 ?auto_188183 ) ) ( not ( = ?auto_188178 ?auto_188184 ) ) ( not ( = ?auto_188179 ?auto_188180 ) ) ( not ( = ?auto_188179 ?auto_188181 ) ) ( not ( = ?auto_188179 ?auto_188182 ) ) ( not ( = ?auto_188179 ?auto_188183 ) ) ( not ( = ?auto_188179 ?auto_188184 ) ) ( not ( = ?auto_188180 ?auto_188181 ) ) ( not ( = ?auto_188180 ?auto_188182 ) ) ( not ( = ?auto_188180 ?auto_188183 ) ) ( not ( = ?auto_188180 ?auto_188184 ) ) ( not ( = ?auto_188181 ?auto_188182 ) ) ( not ( = ?auto_188181 ?auto_188183 ) ) ( not ( = ?auto_188181 ?auto_188184 ) ) ( not ( = ?auto_188182 ?auto_188183 ) ) ( not ( = ?auto_188182 ?auto_188184 ) ) ( not ( = ?auto_188183 ?auto_188184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188184 ?auto_188183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188185 - BLOCK
      ?auto_188186 - BLOCK
      ?auto_188187 - BLOCK
      ?auto_188188 - BLOCK
      ?auto_188189 - BLOCK
      ?auto_188190 - BLOCK
      ?auto_188191 - BLOCK
    )
    :vars
    (
      ?auto_188192 - BLOCK
      ?auto_188193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188192 ?auto_188191 ) ( CLEAR ?auto_188192 ) ( ON-TABLE ?auto_188185 ) ( ON ?auto_188186 ?auto_188185 ) ( ON ?auto_188187 ?auto_188186 ) ( ON ?auto_188188 ?auto_188187 ) ( ON ?auto_188189 ?auto_188188 ) ( ON ?auto_188190 ?auto_188189 ) ( ON ?auto_188191 ?auto_188190 ) ( not ( = ?auto_188185 ?auto_188186 ) ) ( not ( = ?auto_188185 ?auto_188187 ) ) ( not ( = ?auto_188185 ?auto_188188 ) ) ( not ( = ?auto_188185 ?auto_188189 ) ) ( not ( = ?auto_188185 ?auto_188190 ) ) ( not ( = ?auto_188185 ?auto_188191 ) ) ( not ( = ?auto_188185 ?auto_188192 ) ) ( not ( = ?auto_188186 ?auto_188187 ) ) ( not ( = ?auto_188186 ?auto_188188 ) ) ( not ( = ?auto_188186 ?auto_188189 ) ) ( not ( = ?auto_188186 ?auto_188190 ) ) ( not ( = ?auto_188186 ?auto_188191 ) ) ( not ( = ?auto_188186 ?auto_188192 ) ) ( not ( = ?auto_188187 ?auto_188188 ) ) ( not ( = ?auto_188187 ?auto_188189 ) ) ( not ( = ?auto_188187 ?auto_188190 ) ) ( not ( = ?auto_188187 ?auto_188191 ) ) ( not ( = ?auto_188187 ?auto_188192 ) ) ( not ( = ?auto_188188 ?auto_188189 ) ) ( not ( = ?auto_188188 ?auto_188190 ) ) ( not ( = ?auto_188188 ?auto_188191 ) ) ( not ( = ?auto_188188 ?auto_188192 ) ) ( not ( = ?auto_188189 ?auto_188190 ) ) ( not ( = ?auto_188189 ?auto_188191 ) ) ( not ( = ?auto_188189 ?auto_188192 ) ) ( not ( = ?auto_188190 ?auto_188191 ) ) ( not ( = ?auto_188190 ?auto_188192 ) ) ( not ( = ?auto_188191 ?auto_188192 ) ) ( HOLDING ?auto_188193 ) ( not ( = ?auto_188185 ?auto_188193 ) ) ( not ( = ?auto_188186 ?auto_188193 ) ) ( not ( = ?auto_188187 ?auto_188193 ) ) ( not ( = ?auto_188188 ?auto_188193 ) ) ( not ( = ?auto_188189 ?auto_188193 ) ) ( not ( = ?auto_188190 ?auto_188193 ) ) ( not ( = ?auto_188191 ?auto_188193 ) ) ( not ( = ?auto_188192 ?auto_188193 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_188193 )
      ( MAKE-7PILE ?auto_188185 ?auto_188186 ?auto_188187 ?auto_188188 ?auto_188189 ?auto_188190 ?auto_188191 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188194 - BLOCK
      ?auto_188195 - BLOCK
      ?auto_188196 - BLOCK
      ?auto_188197 - BLOCK
      ?auto_188198 - BLOCK
      ?auto_188199 - BLOCK
      ?auto_188200 - BLOCK
    )
    :vars
    (
      ?auto_188201 - BLOCK
      ?auto_188202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188201 ?auto_188200 ) ( ON-TABLE ?auto_188194 ) ( ON ?auto_188195 ?auto_188194 ) ( ON ?auto_188196 ?auto_188195 ) ( ON ?auto_188197 ?auto_188196 ) ( ON ?auto_188198 ?auto_188197 ) ( ON ?auto_188199 ?auto_188198 ) ( ON ?auto_188200 ?auto_188199 ) ( not ( = ?auto_188194 ?auto_188195 ) ) ( not ( = ?auto_188194 ?auto_188196 ) ) ( not ( = ?auto_188194 ?auto_188197 ) ) ( not ( = ?auto_188194 ?auto_188198 ) ) ( not ( = ?auto_188194 ?auto_188199 ) ) ( not ( = ?auto_188194 ?auto_188200 ) ) ( not ( = ?auto_188194 ?auto_188201 ) ) ( not ( = ?auto_188195 ?auto_188196 ) ) ( not ( = ?auto_188195 ?auto_188197 ) ) ( not ( = ?auto_188195 ?auto_188198 ) ) ( not ( = ?auto_188195 ?auto_188199 ) ) ( not ( = ?auto_188195 ?auto_188200 ) ) ( not ( = ?auto_188195 ?auto_188201 ) ) ( not ( = ?auto_188196 ?auto_188197 ) ) ( not ( = ?auto_188196 ?auto_188198 ) ) ( not ( = ?auto_188196 ?auto_188199 ) ) ( not ( = ?auto_188196 ?auto_188200 ) ) ( not ( = ?auto_188196 ?auto_188201 ) ) ( not ( = ?auto_188197 ?auto_188198 ) ) ( not ( = ?auto_188197 ?auto_188199 ) ) ( not ( = ?auto_188197 ?auto_188200 ) ) ( not ( = ?auto_188197 ?auto_188201 ) ) ( not ( = ?auto_188198 ?auto_188199 ) ) ( not ( = ?auto_188198 ?auto_188200 ) ) ( not ( = ?auto_188198 ?auto_188201 ) ) ( not ( = ?auto_188199 ?auto_188200 ) ) ( not ( = ?auto_188199 ?auto_188201 ) ) ( not ( = ?auto_188200 ?auto_188201 ) ) ( not ( = ?auto_188194 ?auto_188202 ) ) ( not ( = ?auto_188195 ?auto_188202 ) ) ( not ( = ?auto_188196 ?auto_188202 ) ) ( not ( = ?auto_188197 ?auto_188202 ) ) ( not ( = ?auto_188198 ?auto_188202 ) ) ( not ( = ?auto_188199 ?auto_188202 ) ) ( not ( = ?auto_188200 ?auto_188202 ) ) ( not ( = ?auto_188201 ?auto_188202 ) ) ( ON ?auto_188202 ?auto_188201 ) ( CLEAR ?auto_188202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188194 ?auto_188195 ?auto_188196 ?auto_188197 ?auto_188198 ?auto_188199 ?auto_188200 ?auto_188201 )
      ( MAKE-7PILE ?auto_188194 ?auto_188195 ?auto_188196 ?auto_188197 ?auto_188198 ?auto_188199 ?auto_188200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188205 - BLOCK
      ?auto_188206 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188206 ) ( CLEAR ?auto_188205 ) ( ON-TABLE ?auto_188205 ) ( not ( = ?auto_188205 ?auto_188206 ) ) )
    :subtasks
    ( ( !STACK ?auto_188206 ?auto_188205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188207 - BLOCK
      ?auto_188208 - BLOCK
    )
    :vars
    (
      ?auto_188209 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188207 ) ( ON-TABLE ?auto_188207 ) ( not ( = ?auto_188207 ?auto_188208 ) ) ( ON ?auto_188208 ?auto_188209 ) ( CLEAR ?auto_188208 ) ( HAND-EMPTY ) ( not ( = ?auto_188207 ?auto_188209 ) ) ( not ( = ?auto_188208 ?auto_188209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188208 ?auto_188209 )
      ( MAKE-2PILE ?auto_188207 ?auto_188208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188210 - BLOCK
      ?auto_188211 - BLOCK
    )
    :vars
    (
      ?auto_188212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188210 ?auto_188211 ) ) ( ON ?auto_188211 ?auto_188212 ) ( CLEAR ?auto_188211 ) ( not ( = ?auto_188210 ?auto_188212 ) ) ( not ( = ?auto_188211 ?auto_188212 ) ) ( HOLDING ?auto_188210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188210 )
      ( MAKE-2PILE ?auto_188210 ?auto_188211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188213 - BLOCK
      ?auto_188214 - BLOCK
    )
    :vars
    (
      ?auto_188215 - BLOCK
      ?auto_188221 - BLOCK
      ?auto_188218 - BLOCK
      ?auto_188217 - BLOCK
      ?auto_188216 - BLOCK
      ?auto_188219 - BLOCK
      ?auto_188220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188213 ?auto_188214 ) ) ( ON ?auto_188214 ?auto_188215 ) ( not ( = ?auto_188213 ?auto_188215 ) ) ( not ( = ?auto_188214 ?auto_188215 ) ) ( ON ?auto_188213 ?auto_188214 ) ( CLEAR ?auto_188213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188221 ) ( ON ?auto_188218 ?auto_188221 ) ( ON ?auto_188217 ?auto_188218 ) ( ON ?auto_188216 ?auto_188217 ) ( ON ?auto_188219 ?auto_188216 ) ( ON ?auto_188220 ?auto_188219 ) ( ON ?auto_188215 ?auto_188220 ) ( not ( = ?auto_188221 ?auto_188218 ) ) ( not ( = ?auto_188221 ?auto_188217 ) ) ( not ( = ?auto_188221 ?auto_188216 ) ) ( not ( = ?auto_188221 ?auto_188219 ) ) ( not ( = ?auto_188221 ?auto_188220 ) ) ( not ( = ?auto_188221 ?auto_188215 ) ) ( not ( = ?auto_188221 ?auto_188214 ) ) ( not ( = ?auto_188221 ?auto_188213 ) ) ( not ( = ?auto_188218 ?auto_188217 ) ) ( not ( = ?auto_188218 ?auto_188216 ) ) ( not ( = ?auto_188218 ?auto_188219 ) ) ( not ( = ?auto_188218 ?auto_188220 ) ) ( not ( = ?auto_188218 ?auto_188215 ) ) ( not ( = ?auto_188218 ?auto_188214 ) ) ( not ( = ?auto_188218 ?auto_188213 ) ) ( not ( = ?auto_188217 ?auto_188216 ) ) ( not ( = ?auto_188217 ?auto_188219 ) ) ( not ( = ?auto_188217 ?auto_188220 ) ) ( not ( = ?auto_188217 ?auto_188215 ) ) ( not ( = ?auto_188217 ?auto_188214 ) ) ( not ( = ?auto_188217 ?auto_188213 ) ) ( not ( = ?auto_188216 ?auto_188219 ) ) ( not ( = ?auto_188216 ?auto_188220 ) ) ( not ( = ?auto_188216 ?auto_188215 ) ) ( not ( = ?auto_188216 ?auto_188214 ) ) ( not ( = ?auto_188216 ?auto_188213 ) ) ( not ( = ?auto_188219 ?auto_188220 ) ) ( not ( = ?auto_188219 ?auto_188215 ) ) ( not ( = ?auto_188219 ?auto_188214 ) ) ( not ( = ?auto_188219 ?auto_188213 ) ) ( not ( = ?auto_188220 ?auto_188215 ) ) ( not ( = ?auto_188220 ?auto_188214 ) ) ( not ( = ?auto_188220 ?auto_188213 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188221 ?auto_188218 ?auto_188217 ?auto_188216 ?auto_188219 ?auto_188220 ?auto_188215 ?auto_188214 )
      ( MAKE-2PILE ?auto_188213 ?auto_188214 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188228 - BLOCK
      ?auto_188229 - BLOCK
      ?auto_188230 - BLOCK
      ?auto_188231 - BLOCK
      ?auto_188232 - BLOCK
      ?auto_188233 - BLOCK
    )
    :vars
    (
      ?auto_188234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188234 ?auto_188233 ) ( CLEAR ?auto_188234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188228 ) ( ON ?auto_188229 ?auto_188228 ) ( ON ?auto_188230 ?auto_188229 ) ( ON ?auto_188231 ?auto_188230 ) ( ON ?auto_188232 ?auto_188231 ) ( ON ?auto_188233 ?auto_188232 ) ( not ( = ?auto_188228 ?auto_188229 ) ) ( not ( = ?auto_188228 ?auto_188230 ) ) ( not ( = ?auto_188228 ?auto_188231 ) ) ( not ( = ?auto_188228 ?auto_188232 ) ) ( not ( = ?auto_188228 ?auto_188233 ) ) ( not ( = ?auto_188228 ?auto_188234 ) ) ( not ( = ?auto_188229 ?auto_188230 ) ) ( not ( = ?auto_188229 ?auto_188231 ) ) ( not ( = ?auto_188229 ?auto_188232 ) ) ( not ( = ?auto_188229 ?auto_188233 ) ) ( not ( = ?auto_188229 ?auto_188234 ) ) ( not ( = ?auto_188230 ?auto_188231 ) ) ( not ( = ?auto_188230 ?auto_188232 ) ) ( not ( = ?auto_188230 ?auto_188233 ) ) ( not ( = ?auto_188230 ?auto_188234 ) ) ( not ( = ?auto_188231 ?auto_188232 ) ) ( not ( = ?auto_188231 ?auto_188233 ) ) ( not ( = ?auto_188231 ?auto_188234 ) ) ( not ( = ?auto_188232 ?auto_188233 ) ) ( not ( = ?auto_188232 ?auto_188234 ) ) ( not ( = ?auto_188233 ?auto_188234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188234 ?auto_188233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188235 - BLOCK
      ?auto_188236 - BLOCK
      ?auto_188237 - BLOCK
      ?auto_188238 - BLOCK
      ?auto_188239 - BLOCK
      ?auto_188240 - BLOCK
    )
    :vars
    (
      ?auto_188241 - BLOCK
      ?auto_188242 - BLOCK
      ?auto_188243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188241 ?auto_188240 ) ( CLEAR ?auto_188241 ) ( ON-TABLE ?auto_188235 ) ( ON ?auto_188236 ?auto_188235 ) ( ON ?auto_188237 ?auto_188236 ) ( ON ?auto_188238 ?auto_188237 ) ( ON ?auto_188239 ?auto_188238 ) ( ON ?auto_188240 ?auto_188239 ) ( not ( = ?auto_188235 ?auto_188236 ) ) ( not ( = ?auto_188235 ?auto_188237 ) ) ( not ( = ?auto_188235 ?auto_188238 ) ) ( not ( = ?auto_188235 ?auto_188239 ) ) ( not ( = ?auto_188235 ?auto_188240 ) ) ( not ( = ?auto_188235 ?auto_188241 ) ) ( not ( = ?auto_188236 ?auto_188237 ) ) ( not ( = ?auto_188236 ?auto_188238 ) ) ( not ( = ?auto_188236 ?auto_188239 ) ) ( not ( = ?auto_188236 ?auto_188240 ) ) ( not ( = ?auto_188236 ?auto_188241 ) ) ( not ( = ?auto_188237 ?auto_188238 ) ) ( not ( = ?auto_188237 ?auto_188239 ) ) ( not ( = ?auto_188237 ?auto_188240 ) ) ( not ( = ?auto_188237 ?auto_188241 ) ) ( not ( = ?auto_188238 ?auto_188239 ) ) ( not ( = ?auto_188238 ?auto_188240 ) ) ( not ( = ?auto_188238 ?auto_188241 ) ) ( not ( = ?auto_188239 ?auto_188240 ) ) ( not ( = ?auto_188239 ?auto_188241 ) ) ( not ( = ?auto_188240 ?auto_188241 ) ) ( HOLDING ?auto_188242 ) ( CLEAR ?auto_188243 ) ( not ( = ?auto_188235 ?auto_188242 ) ) ( not ( = ?auto_188235 ?auto_188243 ) ) ( not ( = ?auto_188236 ?auto_188242 ) ) ( not ( = ?auto_188236 ?auto_188243 ) ) ( not ( = ?auto_188237 ?auto_188242 ) ) ( not ( = ?auto_188237 ?auto_188243 ) ) ( not ( = ?auto_188238 ?auto_188242 ) ) ( not ( = ?auto_188238 ?auto_188243 ) ) ( not ( = ?auto_188239 ?auto_188242 ) ) ( not ( = ?auto_188239 ?auto_188243 ) ) ( not ( = ?auto_188240 ?auto_188242 ) ) ( not ( = ?auto_188240 ?auto_188243 ) ) ( not ( = ?auto_188241 ?auto_188242 ) ) ( not ( = ?auto_188241 ?auto_188243 ) ) ( not ( = ?auto_188242 ?auto_188243 ) ) )
    :subtasks
    ( ( !STACK ?auto_188242 ?auto_188243 )
      ( MAKE-6PILE ?auto_188235 ?auto_188236 ?auto_188237 ?auto_188238 ?auto_188239 ?auto_188240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189575 - BLOCK
      ?auto_189576 - BLOCK
      ?auto_189577 - BLOCK
      ?auto_189578 - BLOCK
      ?auto_189579 - BLOCK
      ?auto_189580 - BLOCK
    )
    :vars
    (
      ?auto_189581 - BLOCK
      ?auto_189582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189581 ?auto_189580 ) ( ON-TABLE ?auto_189575 ) ( ON ?auto_189576 ?auto_189575 ) ( ON ?auto_189577 ?auto_189576 ) ( ON ?auto_189578 ?auto_189577 ) ( ON ?auto_189579 ?auto_189578 ) ( ON ?auto_189580 ?auto_189579 ) ( not ( = ?auto_189575 ?auto_189576 ) ) ( not ( = ?auto_189575 ?auto_189577 ) ) ( not ( = ?auto_189575 ?auto_189578 ) ) ( not ( = ?auto_189575 ?auto_189579 ) ) ( not ( = ?auto_189575 ?auto_189580 ) ) ( not ( = ?auto_189575 ?auto_189581 ) ) ( not ( = ?auto_189576 ?auto_189577 ) ) ( not ( = ?auto_189576 ?auto_189578 ) ) ( not ( = ?auto_189576 ?auto_189579 ) ) ( not ( = ?auto_189576 ?auto_189580 ) ) ( not ( = ?auto_189576 ?auto_189581 ) ) ( not ( = ?auto_189577 ?auto_189578 ) ) ( not ( = ?auto_189577 ?auto_189579 ) ) ( not ( = ?auto_189577 ?auto_189580 ) ) ( not ( = ?auto_189577 ?auto_189581 ) ) ( not ( = ?auto_189578 ?auto_189579 ) ) ( not ( = ?auto_189578 ?auto_189580 ) ) ( not ( = ?auto_189578 ?auto_189581 ) ) ( not ( = ?auto_189579 ?auto_189580 ) ) ( not ( = ?auto_189579 ?auto_189581 ) ) ( not ( = ?auto_189580 ?auto_189581 ) ) ( not ( = ?auto_189575 ?auto_189582 ) ) ( not ( = ?auto_189576 ?auto_189582 ) ) ( not ( = ?auto_189577 ?auto_189582 ) ) ( not ( = ?auto_189578 ?auto_189582 ) ) ( not ( = ?auto_189579 ?auto_189582 ) ) ( not ( = ?auto_189580 ?auto_189582 ) ) ( not ( = ?auto_189581 ?auto_189582 ) ) ( ON ?auto_189582 ?auto_189581 ) ( CLEAR ?auto_189582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189575 ?auto_189576 ?auto_189577 ?auto_189578 ?auto_189579 ?auto_189580 ?auto_189581 )
      ( MAKE-6PILE ?auto_189575 ?auto_189576 ?auto_189577 ?auto_189578 ?auto_189579 ?auto_189580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188253 - BLOCK
      ?auto_188254 - BLOCK
      ?auto_188255 - BLOCK
      ?auto_188256 - BLOCK
      ?auto_188257 - BLOCK
      ?auto_188258 - BLOCK
    )
    :vars
    (
      ?auto_188260 - BLOCK
      ?auto_188261 - BLOCK
      ?auto_188259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188260 ?auto_188258 ) ( ON-TABLE ?auto_188253 ) ( ON ?auto_188254 ?auto_188253 ) ( ON ?auto_188255 ?auto_188254 ) ( ON ?auto_188256 ?auto_188255 ) ( ON ?auto_188257 ?auto_188256 ) ( ON ?auto_188258 ?auto_188257 ) ( not ( = ?auto_188253 ?auto_188254 ) ) ( not ( = ?auto_188253 ?auto_188255 ) ) ( not ( = ?auto_188253 ?auto_188256 ) ) ( not ( = ?auto_188253 ?auto_188257 ) ) ( not ( = ?auto_188253 ?auto_188258 ) ) ( not ( = ?auto_188253 ?auto_188260 ) ) ( not ( = ?auto_188254 ?auto_188255 ) ) ( not ( = ?auto_188254 ?auto_188256 ) ) ( not ( = ?auto_188254 ?auto_188257 ) ) ( not ( = ?auto_188254 ?auto_188258 ) ) ( not ( = ?auto_188254 ?auto_188260 ) ) ( not ( = ?auto_188255 ?auto_188256 ) ) ( not ( = ?auto_188255 ?auto_188257 ) ) ( not ( = ?auto_188255 ?auto_188258 ) ) ( not ( = ?auto_188255 ?auto_188260 ) ) ( not ( = ?auto_188256 ?auto_188257 ) ) ( not ( = ?auto_188256 ?auto_188258 ) ) ( not ( = ?auto_188256 ?auto_188260 ) ) ( not ( = ?auto_188257 ?auto_188258 ) ) ( not ( = ?auto_188257 ?auto_188260 ) ) ( not ( = ?auto_188258 ?auto_188260 ) ) ( not ( = ?auto_188253 ?auto_188261 ) ) ( not ( = ?auto_188253 ?auto_188259 ) ) ( not ( = ?auto_188254 ?auto_188261 ) ) ( not ( = ?auto_188254 ?auto_188259 ) ) ( not ( = ?auto_188255 ?auto_188261 ) ) ( not ( = ?auto_188255 ?auto_188259 ) ) ( not ( = ?auto_188256 ?auto_188261 ) ) ( not ( = ?auto_188256 ?auto_188259 ) ) ( not ( = ?auto_188257 ?auto_188261 ) ) ( not ( = ?auto_188257 ?auto_188259 ) ) ( not ( = ?auto_188258 ?auto_188261 ) ) ( not ( = ?auto_188258 ?auto_188259 ) ) ( not ( = ?auto_188260 ?auto_188261 ) ) ( not ( = ?auto_188260 ?auto_188259 ) ) ( not ( = ?auto_188261 ?auto_188259 ) ) ( ON ?auto_188261 ?auto_188260 ) ( CLEAR ?auto_188261 ) ( HOLDING ?auto_188259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188259 )
      ( MAKE-6PILE ?auto_188253 ?auto_188254 ?auto_188255 ?auto_188256 ?auto_188257 ?auto_188258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188262 - BLOCK
      ?auto_188263 - BLOCK
      ?auto_188264 - BLOCK
      ?auto_188265 - BLOCK
      ?auto_188266 - BLOCK
      ?auto_188267 - BLOCK
    )
    :vars
    (
      ?auto_188270 - BLOCK
      ?auto_188269 - BLOCK
      ?auto_188268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188270 ?auto_188267 ) ( ON-TABLE ?auto_188262 ) ( ON ?auto_188263 ?auto_188262 ) ( ON ?auto_188264 ?auto_188263 ) ( ON ?auto_188265 ?auto_188264 ) ( ON ?auto_188266 ?auto_188265 ) ( ON ?auto_188267 ?auto_188266 ) ( not ( = ?auto_188262 ?auto_188263 ) ) ( not ( = ?auto_188262 ?auto_188264 ) ) ( not ( = ?auto_188262 ?auto_188265 ) ) ( not ( = ?auto_188262 ?auto_188266 ) ) ( not ( = ?auto_188262 ?auto_188267 ) ) ( not ( = ?auto_188262 ?auto_188270 ) ) ( not ( = ?auto_188263 ?auto_188264 ) ) ( not ( = ?auto_188263 ?auto_188265 ) ) ( not ( = ?auto_188263 ?auto_188266 ) ) ( not ( = ?auto_188263 ?auto_188267 ) ) ( not ( = ?auto_188263 ?auto_188270 ) ) ( not ( = ?auto_188264 ?auto_188265 ) ) ( not ( = ?auto_188264 ?auto_188266 ) ) ( not ( = ?auto_188264 ?auto_188267 ) ) ( not ( = ?auto_188264 ?auto_188270 ) ) ( not ( = ?auto_188265 ?auto_188266 ) ) ( not ( = ?auto_188265 ?auto_188267 ) ) ( not ( = ?auto_188265 ?auto_188270 ) ) ( not ( = ?auto_188266 ?auto_188267 ) ) ( not ( = ?auto_188266 ?auto_188270 ) ) ( not ( = ?auto_188267 ?auto_188270 ) ) ( not ( = ?auto_188262 ?auto_188269 ) ) ( not ( = ?auto_188262 ?auto_188268 ) ) ( not ( = ?auto_188263 ?auto_188269 ) ) ( not ( = ?auto_188263 ?auto_188268 ) ) ( not ( = ?auto_188264 ?auto_188269 ) ) ( not ( = ?auto_188264 ?auto_188268 ) ) ( not ( = ?auto_188265 ?auto_188269 ) ) ( not ( = ?auto_188265 ?auto_188268 ) ) ( not ( = ?auto_188266 ?auto_188269 ) ) ( not ( = ?auto_188266 ?auto_188268 ) ) ( not ( = ?auto_188267 ?auto_188269 ) ) ( not ( = ?auto_188267 ?auto_188268 ) ) ( not ( = ?auto_188270 ?auto_188269 ) ) ( not ( = ?auto_188270 ?auto_188268 ) ) ( not ( = ?auto_188269 ?auto_188268 ) ) ( ON ?auto_188269 ?auto_188270 ) ( ON ?auto_188268 ?auto_188269 ) ( CLEAR ?auto_188268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188262 ?auto_188263 ?auto_188264 ?auto_188265 ?auto_188266 ?auto_188267 ?auto_188270 ?auto_188269 )
      ( MAKE-6PILE ?auto_188262 ?auto_188263 ?auto_188264 ?auto_188265 ?auto_188266 ?auto_188267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188274 - BLOCK
      ?auto_188275 - BLOCK
      ?auto_188276 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188276 ) ( CLEAR ?auto_188275 ) ( ON-TABLE ?auto_188274 ) ( ON ?auto_188275 ?auto_188274 ) ( not ( = ?auto_188274 ?auto_188275 ) ) ( not ( = ?auto_188274 ?auto_188276 ) ) ( not ( = ?auto_188275 ?auto_188276 ) ) )
    :subtasks
    ( ( !STACK ?auto_188276 ?auto_188275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188277 - BLOCK
      ?auto_188278 - BLOCK
      ?auto_188279 - BLOCK
    )
    :vars
    (
      ?auto_188280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188278 ) ( ON-TABLE ?auto_188277 ) ( ON ?auto_188278 ?auto_188277 ) ( not ( = ?auto_188277 ?auto_188278 ) ) ( not ( = ?auto_188277 ?auto_188279 ) ) ( not ( = ?auto_188278 ?auto_188279 ) ) ( ON ?auto_188279 ?auto_188280 ) ( CLEAR ?auto_188279 ) ( HAND-EMPTY ) ( not ( = ?auto_188277 ?auto_188280 ) ) ( not ( = ?auto_188278 ?auto_188280 ) ) ( not ( = ?auto_188279 ?auto_188280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188279 ?auto_188280 )
      ( MAKE-3PILE ?auto_188277 ?auto_188278 ?auto_188279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188281 - BLOCK
      ?auto_188282 - BLOCK
      ?auto_188283 - BLOCK
    )
    :vars
    (
      ?auto_188284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188281 ) ( not ( = ?auto_188281 ?auto_188282 ) ) ( not ( = ?auto_188281 ?auto_188283 ) ) ( not ( = ?auto_188282 ?auto_188283 ) ) ( ON ?auto_188283 ?auto_188284 ) ( CLEAR ?auto_188283 ) ( not ( = ?auto_188281 ?auto_188284 ) ) ( not ( = ?auto_188282 ?auto_188284 ) ) ( not ( = ?auto_188283 ?auto_188284 ) ) ( HOLDING ?auto_188282 ) ( CLEAR ?auto_188281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188281 ?auto_188282 )
      ( MAKE-3PILE ?auto_188281 ?auto_188282 ?auto_188283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188285 - BLOCK
      ?auto_188286 - BLOCK
      ?auto_188287 - BLOCK
    )
    :vars
    (
      ?auto_188288 - BLOCK
      ?auto_188290 - BLOCK
      ?auto_188289 - BLOCK
      ?auto_188291 - BLOCK
      ?auto_188292 - BLOCK
      ?auto_188293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188285 ) ( not ( = ?auto_188285 ?auto_188286 ) ) ( not ( = ?auto_188285 ?auto_188287 ) ) ( not ( = ?auto_188286 ?auto_188287 ) ) ( ON ?auto_188287 ?auto_188288 ) ( not ( = ?auto_188285 ?auto_188288 ) ) ( not ( = ?auto_188286 ?auto_188288 ) ) ( not ( = ?auto_188287 ?auto_188288 ) ) ( CLEAR ?auto_188285 ) ( ON ?auto_188286 ?auto_188287 ) ( CLEAR ?auto_188286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188290 ) ( ON ?auto_188289 ?auto_188290 ) ( ON ?auto_188291 ?auto_188289 ) ( ON ?auto_188292 ?auto_188291 ) ( ON ?auto_188293 ?auto_188292 ) ( ON ?auto_188288 ?auto_188293 ) ( not ( = ?auto_188290 ?auto_188289 ) ) ( not ( = ?auto_188290 ?auto_188291 ) ) ( not ( = ?auto_188290 ?auto_188292 ) ) ( not ( = ?auto_188290 ?auto_188293 ) ) ( not ( = ?auto_188290 ?auto_188288 ) ) ( not ( = ?auto_188290 ?auto_188287 ) ) ( not ( = ?auto_188290 ?auto_188286 ) ) ( not ( = ?auto_188289 ?auto_188291 ) ) ( not ( = ?auto_188289 ?auto_188292 ) ) ( not ( = ?auto_188289 ?auto_188293 ) ) ( not ( = ?auto_188289 ?auto_188288 ) ) ( not ( = ?auto_188289 ?auto_188287 ) ) ( not ( = ?auto_188289 ?auto_188286 ) ) ( not ( = ?auto_188291 ?auto_188292 ) ) ( not ( = ?auto_188291 ?auto_188293 ) ) ( not ( = ?auto_188291 ?auto_188288 ) ) ( not ( = ?auto_188291 ?auto_188287 ) ) ( not ( = ?auto_188291 ?auto_188286 ) ) ( not ( = ?auto_188292 ?auto_188293 ) ) ( not ( = ?auto_188292 ?auto_188288 ) ) ( not ( = ?auto_188292 ?auto_188287 ) ) ( not ( = ?auto_188292 ?auto_188286 ) ) ( not ( = ?auto_188293 ?auto_188288 ) ) ( not ( = ?auto_188293 ?auto_188287 ) ) ( not ( = ?auto_188293 ?auto_188286 ) ) ( not ( = ?auto_188285 ?auto_188290 ) ) ( not ( = ?auto_188285 ?auto_188289 ) ) ( not ( = ?auto_188285 ?auto_188291 ) ) ( not ( = ?auto_188285 ?auto_188292 ) ) ( not ( = ?auto_188285 ?auto_188293 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188290 ?auto_188289 ?auto_188291 ?auto_188292 ?auto_188293 ?auto_188288 ?auto_188287 )
      ( MAKE-3PILE ?auto_188285 ?auto_188286 ?auto_188287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188294 - BLOCK
      ?auto_188295 - BLOCK
      ?auto_188296 - BLOCK
    )
    :vars
    (
      ?auto_188299 - BLOCK
      ?auto_188302 - BLOCK
      ?auto_188301 - BLOCK
      ?auto_188297 - BLOCK
      ?auto_188300 - BLOCK
      ?auto_188298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188294 ?auto_188295 ) ) ( not ( = ?auto_188294 ?auto_188296 ) ) ( not ( = ?auto_188295 ?auto_188296 ) ) ( ON ?auto_188296 ?auto_188299 ) ( not ( = ?auto_188294 ?auto_188299 ) ) ( not ( = ?auto_188295 ?auto_188299 ) ) ( not ( = ?auto_188296 ?auto_188299 ) ) ( ON ?auto_188295 ?auto_188296 ) ( CLEAR ?auto_188295 ) ( ON-TABLE ?auto_188302 ) ( ON ?auto_188301 ?auto_188302 ) ( ON ?auto_188297 ?auto_188301 ) ( ON ?auto_188300 ?auto_188297 ) ( ON ?auto_188298 ?auto_188300 ) ( ON ?auto_188299 ?auto_188298 ) ( not ( = ?auto_188302 ?auto_188301 ) ) ( not ( = ?auto_188302 ?auto_188297 ) ) ( not ( = ?auto_188302 ?auto_188300 ) ) ( not ( = ?auto_188302 ?auto_188298 ) ) ( not ( = ?auto_188302 ?auto_188299 ) ) ( not ( = ?auto_188302 ?auto_188296 ) ) ( not ( = ?auto_188302 ?auto_188295 ) ) ( not ( = ?auto_188301 ?auto_188297 ) ) ( not ( = ?auto_188301 ?auto_188300 ) ) ( not ( = ?auto_188301 ?auto_188298 ) ) ( not ( = ?auto_188301 ?auto_188299 ) ) ( not ( = ?auto_188301 ?auto_188296 ) ) ( not ( = ?auto_188301 ?auto_188295 ) ) ( not ( = ?auto_188297 ?auto_188300 ) ) ( not ( = ?auto_188297 ?auto_188298 ) ) ( not ( = ?auto_188297 ?auto_188299 ) ) ( not ( = ?auto_188297 ?auto_188296 ) ) ( not ( = ?auto_188297 ?auto_188295 ) ) ( not ( = ?auto_188300 ?auto_188298 ) ) ( not ( = ?auto_188300 ?auto_188299 ) ) ( not ( = ?auto_188300 ?auto_188296 ) ) ( not ( = ?auto_188300 ?auto_188295 ) ) ( not ( = ?auto_188298 ?auto_188299 ) ) ( not ( = ?auto_188298 ?auto_188296 ) ) ( not ( = ?auto_188298 ?auto_188295 ) ) ( not ( = ?auto_188294 ?auto_188302 ) ) ( not ( = ?auto_188294 ?auto_188301 ) ) ( not ( = ?auto_188294 ?auto_188297 ) ) ( not ( = ?auto_188294 ?auto_188300 ) ) ( not ( = ?auto_188294 ?auto_188298 ) ) ( HOLDING ?auto_188294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188294 )
      ( MAKE-3PILE ?auto_188294 ?auto_188295 ?auto_188296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188303 - BLOCK
      ?auto_188304 - BLOCK
      ?auto_188305 - BLOCK
    )
    :vars
    (
      ?auto_188306 - BLOCK
      ?auto_188308 - BLOCK
      ?auto_188307 - BLOCK
      ?auto_188311 - BLOCK
      ?auto_188309 - BLOCK
      ?auto_188310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188303 ?auto_188304 ) ) ( not ( = ?auto_188303 ?auto_188305 ) ) ( not ( = ?auto_188304 ?auto_188305 ) ) ( ON ?auto_188305 ?auto_188306 ) ( not ( = ?auto_188303 ?auto_188306 ) ) ( not ( = ?auto_188304 ?auto_188306 ) ) ( not ( = ?auto_188305 ?auto_188306 ) ) ( ON ?auto_188304 ?auto_188305 ) ( ON-TABLE ?auto_188308 ) ( ON ?auto_188307 ?auto_188308 ) ( ON ?auto_188311 ?auto_188307 ) ( ON ?auto_188309 ?auto_188311 ) ( ON ?auto_188310 ?auto_188309 ) ( ON ?auto_188306 ?auto_188310 ) ( not ( = ?auto_188308 ?auto_188307 ) ) ( not ( = ?auto_188308 ?auto_188311 ) ) ( not ( = ?auto_188308 ?auto_188309 ) ) ( not ( = ?auto_188308 ?auto_188310 ) ) ( not ( = ?auto_188308 ?auto_188306 ) ) ( not ( = ?auto_188308 ?auto_188305 ) ) ( not ( = ?auto_188308 ?auto_188304 ) ) ( not ( = ?auto_188307 ?auto_188311 ) ) ( not ( = ?auto_188307 ?auto_188309 ) ) ( not ( = ?auto_188307 ?auto_188310 ) ) ( not ( = ?auto_188307 ?auto_188306 ) ) ( not ( = ?auto_188307 ?auto_188305 ) ) ( not ( = ?auto_188307 ?auto_188304 ) ) ( not ( = ?auto_188311 ?auto_188309 ) ) ( not ( = ?auto_188311 ?auto_188310 ) ) ( not ( = ?auto_188311 ?auto_188306 ) ) ( not ( = ?auto_188311 ?auto_188305 ) ) ( not ( = ?auto_188311 ?auto_188304 ) ) ( not ( = ?auto_188309 ?auto_188310 ) ) ( not ( = ?auto_188309 ?auto_188306 ) ) ( not ( = ?auto_188309 ?auto_188305 ) ) ( not ( = ?auto_188309 ?auto_188304 ) ) ( not ( = ?auto_188310 ?auto_188306 ) ) ( not ( = ?auto_188310 ?auto_188305 ) ) ( not ( = ?auto_188310 ?auto_188304 ) ) ( not ( = ?auto_188303 ?auto_188308 ) ) ( not ( = ?auto_188303 ?auto_188307 ) ) ( not ( = ?auto_188303 ?auto_188311 ) ) ( not ( = ?auto_188303 ?auto_188309 ) ) ( not ( = ?auto_188303 ?auto_188310 ) ) ( ON ?auto_188303 ?auto_188304 ) ( CLEAR ?auto_188303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188308 ?auto_188307 ?auto_188311 ?auto_188309 ?auto_188310 ?auto_188306 ?auto_188305 ?auto_188304 )
      ( MAKE-3PILE ?auto_188303 ?auto_188304 ?auto_188305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188317 - BLOCK
      ?auto_188318 - BLOCK
      ?auto_188319 - BLOCK
      ?auto_188320 - BLOCK
      ?auto_188321 - BLOCK
    )
    :vars
    (
      ?auto_188322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188322 ?auto_188321 ) ( CLEAR ?auto_188322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188317 ) ( ON ?auto_188318 ?auto_188317 ) ( ON ?auto_188319 ?auto_188318 ) ( ON ?auto_188320 ?auto_188319 ) ( ON ?auto_188321 ?auto_188320 ) ( not ( = ?auto_188317 ?auto_188318 ) ) ( not ( = ?auto_188317 ?auto_188319 ) ) ( not ( = ?auto_188317 ?auto_188320 ) ) ( not ( = ?auto_188317 ?auto_188321 ) ) ( not ( = ?auto_188317 ?auto_188322 ) ) ( not ( = ?auto_188318 ?auto_188319 ) ) ( not ( = ?auto_188318 ?auto_188320 ) ) ( not ( = ?auto_188318 ?auto_188321 ) ) ( not ( = ?auto_188318 ?auto_188322 ) ) ( not ( = ?auto_188319 ?auto_188320 ) ) ( not ( = ?auto_188319 ?auto_188321 ) ) ( not ( = ?auto_188319 ?auto_188322 ) ) ( not ( = ?auto_188320 ?auto_188321 ) ) ( not ( = ?auto_188320 ?auto_188322 ) ) ( not ( = ?auto_188321 ?auto_188322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188322 ?auto_188321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188323 - BLOCK
      ?auto_188324 - BLOCK
      ?auto_188325 - BLOCK
      ?auto_188326 - BLOCK
      ?auto_188327 - BLOCK
    )
    :vars
    (
      ?auto_188328 - BLOCK
      ?auto_188329 - BLOCK
      ?auto_188330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188328 ?auto_188327 ) ( CLEAR ?auto_188328 ) ( ON-TABLE ?auto_188323 ) ( ON ?auto_188324 ?auto_188323 ) ( ON ?auto_188325 ?auto_188324 ) ( ON ?auto_188326 ?auto_188325 ) ( ON ?auto_188327 ?auto_188326 ) ( not ( = ?auto_188323 ?auto_188324 ) ) ( not ( = ?auto_188323 ?auto_188325 ) ) ( not ( = ?auto_188323 ?auto_188326 ) ) ( not ( = ?auto_188323 ?auto_188327 ) ) ( not ( = ?auto_188323 ?auto_188328 ) ) ( not ( = ?auto_188324 ?auto_188325 ) ) ( not ( = ?auto_188324 ?auto_188326 ) ) ( not ( = ?auto_188324 ?auto_188327 ) ) ( not ( = ?auto_188324 ?auto_188328 ) ) ( not ( = ?auto_188325 ?auto_188326 ) ) ( not ( = ?auto_188325 ?auto_188327 ) ) ( not ( = ?auto_188325 ?auto_188328 ) ) ( not ( = ?auto_188326 ?auto_188327 ) ) ( not ( = ?auto_188326 ?auto_188328 ) ) ( not ( = ?auto_188327 ?auto_188328 ) ) ( HOLDING ?auto_188329 ) ( CLEAR ?auto_188330 ) ( not ( = ?auto_188323 ?auto_188329 ) ) ( not ( = ?auto_188323 ?auto_188330 ) ) ( not ( = ?auto_188324 ?auto_188329 ) ) ( not ( = ?auto_188324 ?auto_188330 ) ) ( not ( = ?auto_188325 ?auto_188329 ) ) ( not ( = ?auto_188325 ?auto_188330 ) ) ( not ( = ?auto_188326 ?auto_188329 ) ) ( not ( = ?auto_188326 ?auto_188330 ) ) ( not ( = ?auto_188327 ?auto_188329 ) ) ( not ( = ?auto_188327 ?auto_188330 ) ) ( not ( = ?auto_188328 ?auto_188329 ) ) ( not ( = ?auto_188328 ?auto_188330 ) ) ( not ( = ?auto_188329 ?auto_188330 ) ) )
    :subtasks
    ( ( !STACK ?auto_188329 ?auto_188330 )
      ( MAKE-5PILE ?auto_188323 ?auto_188324 ?auto_188325 ?auto_188326 ?auto_188327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188331 - BLOCK
      ?auto_188332 - BLOCK
      ?auto_188333 - BLOCK
      ?auto_188334 - BLOCK
      ?auto_188335 - BLOCK
    )
    :vars
    (
      ?auto_188337 - BLOCK
      ?auto_188336 - BLOCK
      ?auto_188338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188337 ?auto_188335 ) ( ON-TABLE ?auto_188331 ) ( ON ?auto_188332 ?auto_188331 ) ( ON ?auto_188333 ?auto_188332 ) ( ON ?auto_188334 ?auto_188333 ) ( ON ?auto_188335 ?auto_188334 ) ( not ( = ?auto_188331 ?auto_188332 ) ) ( not ( = ?auto_188331 ?auto_188333 ) ) ( not ( = ?auto_188331 ?auto_188334 ) ) ( not ( = ?auto_188331 ?auto_188335 ) ) ( not ( = ?auto_188331 ?auto_188337 ) ) ( not ( = ?auto_188332 ?auto_188333 ) ) ( not ( = ?auto_188332 ?auto_188334 ) ) ( not ( = ?auto_188332 ?auto_188335 ) ) ( not ( = ?auto_188332 ?auto_188337 ) ) ( not ( = ?auto_188333 ?auto_188334 ) ) ( not ( = ?auto_188333 ?auto_188335 ) ) ( not ( = ?auto_188333 ?auto_188337 ) ) ( not ( = ?auto_188334 ?auto_188335 ) ) ( not ( = ?auto_188334 ?auto_188337 ) ) ( not ( = ?auto_188335 ?auto_188337 ) ) ( CLEAR ?auto_188336 ) ( not ( = ?auto_188331 ?auto_188338 ) ) ( not ( = ?auto_188331 ?auto_188336 ) ) ( not ( = ?auto_188332 ?auto_188338 ) ) ( not ( = ?auto_188332 ?auto_188336 ) ) ( not ( = ?auto_188333 ?auto_188338 ) ) ( not ( = ?auto_188333 ?auto_188336 ) ) ( not ( = ?auto_188334 ?auto_188338 ) ) ( not ( = ?auto_188334 ?auto_188336 ) ) ( not ( = ?auto_188335 ?auto_188338 ) ) ( not ( = ?auto_188335 ?auto_188336 ) ) ( not ( = ?auto_188337 ?auto_188338 ) ) ( not ( = ?auto_188337 ?auto_188336 ) ) ( not ( = ?auto_188338 ?auto_188336 ) ) ( ON ?auto_188338 ?auto_188337 ) ( CLEAR ?auto_188338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188331 ?auto_188332 ?auto_188333 ?auto_188334 ?auto_188335 ?auto_188337 )
      ( MAKE-5PILE ?auto_188331 ?auto_188332 ?auto_188333 ?auto_188334 ?auto_188335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188339 - BLOCK
      ?auto_188340 - BLOCK
      ?auto_188341 - BLOCK
      ?auto_188342 - BLOCK
      ?auto_188343 - BLOCK
    )
    :vars
    (
      ?auto_188346 - BLOCK
      ?auto_188345 - BLOCK
      ?auto_188344 - BLOCK
      ?auto_188347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188346 ?auto_188343 ) ( ON-TABLE ?auto_188339 ) ( ON ?auto_188340 ?auto_188339 ) ( ON ?auto_188341 ?auto_188340 ) ( ON ?auto_188342 ?auto_188341 ) ( ON ?auto_188343 ?auto_188342 ) ( not ( = ?auto_188339 ?auto_188340 ) ) ( not ( = ?auto_188339 ?auto_188341 ) ) ( not ( = ?auto_188339 ?auto_188342 ) ) ( not ( = ?auto_188339 ?auto_188343 ) ) ( not ( = ?auto_188339 ?auto_188346 ) ) ( not ( = ?auto_188340 ?auto_188341 ) ) ( not ( = ?auto_188340 ?auto_188342 ) ) ( not ( = ?auto_188340 ?auto_188343 ) ) ( not ( = ?auto_188340 ?auto_188346 ) ) ( not ( = ?auto_188341 ?auto_188342 ) ) ( not ( = ?auto_188341 ?auto_188343 ) ) ( not ( = ?auto_188341 ?auto_188346 ) ) ( not ( = ?auto_188342 ?auto_188343 ) ) ( not ( = ?auto_188342 ?auto_188346 ) ) ( not ( = ?auto_188343 ?auto_188346 ) ) ( not ( = ?auto_188339 ?auto_188345 ) ) ( not ( = ?auto_188339 ?auto_188344 ) ) ( not ( = ?auto_188340 ?auto_188345 ) ) ( not ( = ?auto_188340 ?auto_188344 ) ) ( not ( = ?auto_188341 ?auto_188345 ) ) ( not ( = ?auto_188341 ?auto_188344 ) ) ( not ( = ?auto_188342 ?auto_188345 ) ) ( not ( = ?auto_188342 ?auto_188344 ) ) ( not ( = ?auto_188343 ?auto_188345 ) ) ( not ( = ?auto_188343 ?auto_188344 ) ) ( not ( = ?auto_188346 ?auto_188345 ) ) ( not ( = ?auto_188346 ?auto_188344 ) ) ( not ( = ?auto_188345 ?auto_188344 ) ) ( ON ?auto_188345 ?auto_188346 ) ( CLEAR ?auto_188345 ) ( HOLDING ?auto_188344 ) ( CLEAR ?auto_188347 ) ( ON-TABLE ?auto_188347 ) ( not ( = ?auto_188347 ?auto_188344 ) ) ( not ( = ?auto_188339 ?auto_188347 ) ) ( not ( = ?auto_188340 ?auto_188347 ) ) ( not ( = ?auto_188341 ?auto_188347 ) ) ( not ( = ?auto_188342 ?auto_188347 ) ) ( not ( = ?auto_188343 ?auto_188347 ) ) ( not ( = ?auto_188346 ?auto_188347 ) ) ( not ( = ?auto_188345 ?auto_188347 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188347 ?auto_188344 )
      ( MAKE-5PILE ?auto_188339 ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189867 - BLOCK
      ?auto_189868 - BLOCK
      ?auto_189869 - BLOCK
      ?auto_189870 - BLOCK
      ?auto_189871 - BLOCK
    )
    :vars
    (
      ?auto_189874 - BLOCK
      ?auto_189873 - BLOCK
      ?auto_189872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189874 ?auto_189871 ) ( ON-TABLE ?auto_189867 ) ( ON ?auto_189868 ?auto_189867 ) ( ON ?auto_189869 ?auto_189868 ) ( ON ?auto_189870 ?auto_189869 ) ( ON ?auto_189871 ?auto_189870 ) ( not ( = ?auto_189867 ?auto_189868 ) ) ( not ( = ?auto_189867 ?auto_189869 ) ) ( not ( = ?auto_189867 ?auto_189870 ) ) ( not ( = ?auto_189867 ?auto_189871 ) ) ( not ( = ?auto_189867 ?auto_189874 ) ) ( not ( = ?auto_189868 ?auto_189869 ) ) ( not ( = ?auto_189868 ?auto_189870 ) ) ( not ( = ?auto_189868 ?auto_189871 ) ) ( not ( = ?auto_189868 ?auto_189874 ) ) ( not ( = ?auto_189869 ?auto_189870 ) ) ( not ( = ?auto_189869 ?auto_189871 ) ) ( not ( = ?auto_189869 ?auto_189874 ) ) ( not ( = ?auto_189870 ?auto_189871 ) ) ( not ( = ?auto_189870 ?auto_189874 ) ) ( not ( = ?auto_189871 ?auto_189874 ) ) ( not ( = ?auto_189867 ?auto_189873 ) ) ( not ( = ?auto_189867 ?auto_189872 ) ) ( not ( = ?auto_189868 ?auto_189873 ) ) ( not ( = ?auto_189868 ?auto_189872 ) ) ( not ( = ?auto_189869 ?auto_189873 ) ) ( not ( = ?auto_189869 ?auto_189872 ) ) ( not ( = ?auto_189870 ?auto_189873 ) ) ( not ( = ?auto_189870 ?auto_189872 ) ) ( not ( = ?auto_189871 ?auto_189873 ) ) ( not ( = ?auto_189871 ?auto_189872 ) ) ( not ( = ?auto_189874 ?auto_189873 ) ) ( not ( = ?auto_189874 ?auto_189872 ) ) ( not ( = ?auto_189873 ?auto_189872 ) ) ( ON ?auto_189873 ?auto_189874 ) ( ON ?auto_189872 ?auto_189873 ) ( CLEAR ?auto_189872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189867 ?auto_189868 ?auto_189869 ?auto_189870 ?auto_189871 ?auto_189874 ?auto_189873 )
      ( MAKE-5PILE ?auto_189867 ?auto_189868 ?auto_189869 ?auto_189870 ?auto_189871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188357 - BLOCK
      ?auto_188358 - BLOCK
      ?auto_188359 - BLOCK
      ?auto_188360 - BLOCK
      ?auto_188361 - BLOCK
    )
    :vars
    (
      ?auto_188365 - BLOCK
      ?auto_188364 - BLOCK
      ?auto_188362 - BLOCK
      ?auto_188363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188365 ?auto_188361 ) ( ON-TABLE ?auto_188357 ) ( ON ?auto_188358 ?auto_188357 ) ( ON ?auto_188359 ?auto_188358 ) ( ON ?auto_188360 ?auto_188359 ) ( ON ?auto_188361 ?auto_188360 ) ( not ( = ?auto_188357 ?auto_188358 ) ) ( not ( = ?auto_188357 ?auto_188359 ) ) ( not ( = ?auto_188357 ?auto_188360 ) ) ( not ( = ?auto_188357 ?auto_188361 ) ) ( not ( = ?auto_188357 ?auto_188365 ) ) ( not ( = ?auto_188358 ?auto_188359 ) ) ( not ( = ?auto_188358 ?auto_188360 ) ) ( not ( = ?auto_188358 ?auto_188361 ) ) ( not ( = ?auto_188358 ?auto_188365 ) ) ( not ( = ?auto_188359 ?auto_188360 ) ) ( not ( = ?auto_188359 ?auto_188361 ) ) ( not ( = ?auto_188359 ?auto_188365 ) ) ( not ( = ?auto_188360 ?auto_188361 ) ) ( not ( = ?auto_188360 ?auto_188365 ) ) ( not ( = ?auto_188361 ?auto_188365 ) ) ( not ( = ?auto_188357 ?auto_188364 ) ) ( not ( = ?auto_188357 ?auto_188362 ) ) ( not ( = ?auto_188358 ?auto_188364 ) ) ( not ( = ?auto_188358 ?auto_188362 ) ) ( not ( = ?auto_188359 ?auto_188364 ) ) ( not ( = ?auto_188359 ?auto_188362 ) ) ( not ( = ?auto_188360 ?auto_188364 ) ) ( not ( = ?auto_188360 ?auto_188362 ) ) ( not ( = ?auto_188361 ?auto_188364 ) ) ( not ( = ?auto_188361 ?auto_188362 ) ) ( not ( = ?auto_188365 ?auto_188364 ) ) ( not ( = ?auto_188365 ?auto_188362 ) ) ( not ( = ?auto_188364 ?auto_188362 ) ) ( ON ?auto_188364 ?auto_188365 ) ( not ( = ?auto_188363 ?auto_188362 ) ) ( not ( = ?auto_188357 ?auto_188363 ) ) ( not ( = ?auto_188358 ?auto_188363 ) ) ( not ( = ?auto_188359 ?auto_188363 ) ) ( not ( = ?auto_188360 ?auto_188363 ) ) ( not ( = ?auto_188361 ?auto_188363 ) ) ( not ( = ?auto_188365 ?auto_188363 ) ) ( not ( = ?auto_188364 ?auto_188363 ) ) ( ON ?auto_188362 ?auto_188364 ) ( CLEAR ?auto_188362 ) ( HOLDING ?auto_188363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188363 )
      ( MAKE-5PILE ?auto_188357 ?auto_188358 ?auto_188359 ?auto_188360 ?auto_188361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188366 - BLOCK
      ?auto_188367 - BLOCK
      ?auto_188368 - BLOCK
      ?auto_188369 - BLOCK
      ?auto_188370 - BLOCK
    )
    :vars
    (
      ?auto_188372 - BLOCK
      ?auto_188374 - BLOCK
      ?auto_188373 - BLOCK
      ?auto_188371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188372 ?auto_188370 ) ( ON-TABLE ?auto_188366 ) ( ON ?auto_188367 ?auto_188366 ) ( ON ?auto_188368 ?auto_188367 ) ( ON ?auto_188369 ?auto_188368 ) ( ON ?auto_188370 ?auto_188369 ) ( not ( = ?auto_188366 ?auto_188367 ) ) ( not ( = ?auto_188366 ?auto_188368 ) ) ( not ( = ?auto_188366 ?auto_188369 ) ) ( not ( = ?auto_188366 ?auto_188370 ) ) ( not ( = ?auto_188366 ?auto_188372 ) ) ( not ( = ?auto_188367 ?auto_188368 ) ) ( not ( = ?auto_188367 ?auto_188369 ) ) ( not ( = ?auto_188367 ?auto_188370 ) ) ( not ( = ?auto_188367 ?auto_188372 ) ) ( not ( = ?auto_188368 ?auto_188369 ) ) ( not ( = ?auto_188368 ?auto_188370 ) ) ( not ( = ?auto_188368 ?auto_188372 ) ) ( not ( = ?auto_188369 ?auto_188370 ) ) ( not ( = ?auto_188369 ?auto_188372 ) ) ( not ( = ?auto_188370 ?auto_188372 ) ) ( not ( = ?auto_188366 ?auto_188374 ) ) ( not ( = ?auto_188366 ?auto_188373 ) ) ( not ( = ?auto_188367 ?auto_188374 ) ) ( not ( = ?auto_188367 ?auto_188373 ) ) ( not ( = ?auto_188368 ?auto_188374 ) ) ( not ( = ?auto_188368 ?auto_188373 ) ) ( not ( = ?auto_188369 ?auto_188374 ) ) ( not ( = ?auto_188369 ?auto_188373 ) ) ( not ( = ?auto_188370 ?auto_188374 ) ) ( not ( = ?auto_188370 ?auto_188373 ) ) ( not ( = ?auto_188372 ?auto_188374 ) ) ( not ( = ?auto_188372 ?auto_188373 ) ) ( not ( = ?auto_188374 ?auto_188373 ) ) ( ON ?auto_188374 ?auto_188372 ) ( not ( = ?auto_188371 ?auto_188373 ) ) ( not ( = ?auto_188366 ?auto_188371 ) ) ( not ( = ?auto_188367 ?auto_188371 ) ) ( not ( = ?auto_188368 ?auto_188371 ) ) ( not ( = ?auto_188369 ?auto_188371 ) ) ( not ( = ?auto_188370 ?auto_188371 ) ) ( not ( = ?auto_188372 ?auto_188371 ) ) ( not ( = ?auto_188374 ?auto_188371 ) ) ( ON ?auto_188373 ?auto_188374 ) ( ON ?auto_188371 ?auto_188373 ) ( CLEAR ?auto_188371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188372 ?auto_188374 ?auto_188373 )
      ( MAKE-5PILE ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188379 - BLOCK
      ?auto_188380 - BLOCK
      ?auto_188381 - BLOCK
      ?auto_188382 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188382 ) ( CLEAR ?auto_188381 ) ( ON-TABLE ?auto_188379 ) ( ON ?auto_188380 ?auto_188379 ) ( ON ?auto_188381 ?auto_188380 ) ( not ( = ?auto_188379 ?auto_188380 ) ) ( not ( = ?auto_188379 ?auto_188381 ) ) ( not ( = ?auto_188379 ?auto_188382 ) ) ( not ( = ?auto_188380 ?auto_188381 ) ) ( not ( = ?auto_188380 ?auto_188382 ) ) ( not ( = ?auto_188381 ?auto_188382 ) ) )
    :subtasks
    ( ( !STACK ?auto_188382 ?auto_188381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188383 - BLOCK
      ?auto_188384 - BLOCK
      ?auto_188385 - BLOCK
      ?auto_188386 - BLOCK
    )
    :vars
    (
      ?auto_188387 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188385 ) ( ON-TABLE ?auto_188383 ) ( ON ?auto_188384 ?auto_188383 ) ( ON ?auto_188385 ?auto_188384 ) ( not ( = ?auto_188383 ?auto_188384 ) ) ( not ( = ?auto_188383 ?auto_188385 ) ) ( not ( = ?auto_188383 ?auto_188386 ) ) ( not ( = ?auto_188384 ?auto_188385 ) ) ( not ( = ?auto_188384 ?auto_188386 ) ) ( not ( = ?auto_188385 ?auto_188386 ) ) ( ON ?auto_188386 ?auto_188387 ) ( CLEAR ?auto_188386 ) ( HAND-EMPTY ) ( not ( = ?auto_188383 ?auto_188387 ) ) ( not ( = ?auto_188384 ?auto_188387 ) ) ( not ( = ?auto_188385 ?auto_188387 ) ) ( not ( = ?auto_188386 ?auto_188387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188386 ?auto_188387 )
      ( MAKE-4PILE ?auto_188383 ?auto_188384 ?auto_188385 ?auto_188386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188388 - BLOCK
      ?auto_188389 - BLOCK
      ?auto_188390 - BLOCK
      ?auto_188391 - BLOCK
    )
    :vars
    (
      ?auto_188392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188388 ) ( ON ?auto_188389 ?auto_188388 ) ( not ( = ?auto_188388 ?auto_188389 ) ) ( not ( = ?auto_188388 ?auto_188390 ) ) ( not ( = ?auto_188388 ?auto_188391 ) ) ( not ( = ?auto_188389 ?auto_188390 ) ) ( not ( = ?auto_188389 ?auto_188391 ) ) ( not ( = ?auto_188390 ?auto_188391 ) ) ( ON ?auto_188391 ?auto_188392 ) ( CLEAR ?auto_188391 ) ( not ( = ?auto_188388 ?auto_188392 ) ) ( not ( = ?auto_188389 ?auto_188392 ) ) ( not ( = ?auto_188390 ?auto_188392 ) ) ( not ( = ?auto_188391 ?auto_188392 ) ) ( HOLDING ?auto_188390 ) ( CLEAR ?auto_188389 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188388 ?auto_188389 ?auto_188390 )
      ( MAKE-4PILE ?auto_188388 ?auto_188389 ?auto_188390 ?auto_188391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188393 - BLOCK
      ?auto_188394 - BLOCK
      ?auto_188395 - BLOCK
      ?auto_188396 - BLOCK
    )
    :vars
    (
      ?auto_188397 - BLOCK
      ?auto_188401 - BLOCK
      ?auto_188400 - BLOCK
      ?auto_188399 - BLOCK
      ?auto_188398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188393 ) ( ON ?auto_188394 ?auto_188393 ) ( not ( = ?auto_188393 ?auto_188394 ) ) ( not ( = ?auto_188393 ?auto_188395 ) ) ( not ( = ?auto_188393 ?auto_188396 ) ) ( not ( = ?auto_188394 ?auto_188395 ) ) ( not ( = ?auto_188394 ?auto_188396 ) ) ( not ( = ?auto_188395 ?auto_188396 ) ) ( ON ?auto_188396 ?auto_188397 ) ( not ( = ?auto_188393 ?auto_188397 ) ) ( not ( = ?auto_188394 ?auto_188397 ) ) ( not ( = ?auto_188395 ?auto_188397 ) ) ( not ( = ?auto_188396 ?auto_188397 ) ) ( CLEAR ?auto_188394 ) ( ON ?auto_188395 ?auto_188396 ) ( CLEAR ?auto_188395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188401 ) ( ON ?auto_188400 ?auto_188401 ) ( ON ?auto_188399 ?auto_188400 ) ( ON ?auto_188398 ?auto_188399 ) ( ON ?auto_188397 ?auto_188398 ) ( not ( = ?auto_188401 ?auto_188400 ) ) ( not ( = ?auto_188401 ?auto_188399 ) ) ( not ( = ?auto_188401 ?auto_188398 ) ) ( not ( = ?auto_188401 ?auto_188397 ) ) ( not ( = ?auto_188401 ?auto_188396 ) ) ( not ( = ?auto_188401 ?auto_188395 ) ) ( not ( = ?auto_188400 ?auto_188399 ) ) ( not ( = ?auto_188400 ?auto_188398 ) ) ( not ( = ?auto_188400 ?auto_188397 ) ) ( not ( = ?auto_188400 ?auto_188396 ) ) ( not ( = ?auto_188400 ?auto_188395 ) ) ( not ( = ?auto_188399 ?auto_188398 ) ) ( not ( = ?auto_188399 ?auto_188397 ) ) ( not ( = ?auto_188399 ?auto_188396 ) ) ( not ( = ?auto_188399 ?auto_188395 ) ) ( not ( = ?auto_188398 ?auto_188397 ) ) ( not ( = ?auto_188398 ?auto_188396 ) ) ( not ( = ?auto_188398 ?auto_188395 ) ) ( not ( = ?auto_188393 ?auto_188401 ) ) ( not ( = ?auto_188393 ?auto_188400 ) ) ( not ( = ?auto_188393 ?auto_188399 ) ) ( not ( = ?auto_188393 ?auto_188398 ) ) ( not ( = ?auto_188394 ?auto_188401 ) ) ( not ( = ?auto_188394 ?auto_188400 ) ) ( not ( = ?auto_188394 ?auto_188399 ) ) ( not ( = ?auto_188394 ?auto_188398 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188401 ?auto_188400 ?auto_188399 ?auto_188398 ?auto_188397 ?auto_188396 )
      ( MAKE-4PILE ?auto_188393 ?auto_188394 ?auto_188395 ?auto_188396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188402 - BLOCK
      ?auto_188403 - BLOCK
      ?auto_188404 - BLOCK
      ?auto_188405 - BLOCK
    )
    :vars
    (
      ?auto_188410 - BLOCK
      ?auto_188407 - BLOCK
      ?auto_188406 - BLOCK
      ?auto_188409 - BLOCK
      ?auto_188408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188402 ) ( not ( = ?auto_188402 ?auto_188403 ) ) ( not ( = ?auto_188402 ?auto_188404 ) ) ( not ( = ?auto_188402 ?auto_188405 ) ) ( not ( = ?auto_188403 ?auto_188404 ) ) ( not ( = ?auto_188403 ?auto_188405 ) ) ( not ( = ?auto_188404 ?auto_188405 ) ) ( ON ?auto_188405 ?auto_188410 ) ( not ( = ?auto_188402 ?auto_188410 ) ) ( not ( = ?auto_188403 ?auto_188410 ) ) ( not ( = ?auto_188404 ?auto_188410 ) ) ( not ( = ?auto_188405 ?auto_188410 ) ) ( ON ?auto_188404 ?auto_188405 ) ( CLEAR ?auto_188404 ) ( ON-TABLE ?auto_188407 ) ( ON ?auto_188406 ?auto_188407 ) ( ON ?auto_188409 ?auto_188406 ) ( ON ?auto_188408 ?auto_188409 ) ( ON ?auto_188410 ?auto_188408 ) ( not ( = ?auto_188407 ?auto_188406 ) ) ( not ( = ?auto_188407 ?auto_188409 ) ) ( not ( = ?auto_188407 ?auto_188408 ) ) ( not ( = ?auto_188407 ?auto_188410 ) ) ( not ( = ?auto_188407 ?auto_188405 ) ) ( not ( = ?auto_188407 ?auto_188404 ) ) ( not ( = ?auto_188406 ?auto_188409 ) ) ( not ( = ?auto_188406 ?auto_188408 ) ) ( not ( = ?auto_188406 ?auto_188410 ) ) ( not ( = ?auto_188406 ?auto_188405 ) ) ( not ( = ?auto_188406 ?auto_188404 ) ) ( not ( = ?auto_188409 ?auto_188408 ) ) ( not ( = ?auto_188409 ?auto_188410 ) ) ( not ( = ?auto_188409 ?auto_188405 ) ) ( not ( = ?auto_188409 ?auto_188404 ) ) ( not ( = ?auto_188408 ?auto_188410 ) ) ( not ( = ?auto_188408 ?auto_188405 ) ) ( not ( = ?auto_188408 ?auto_188404 ) ) ( not ( = ?auto_188402 ?auto_188407 ) ) ( not ( = ?auto_188402 ?auto_188406 ) ) ( not ( = ?auto_188402 ?auto_188409 ) ) ( not ( = ?auto_188402 ?auto_188408 ) ) ( not ( = ?auto_188403 ?auto_188407 ) ) ( not ( = ?auto_188403 ?auto_188406 ) ) ( not ( = ?auto_188403 ?auto_188409 ) ) ( not ( = ?auto_188403 ?auto_188408 ) ) ( HOLDING ?auto_188403 ) ( CLEAR ?auto_188402 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188402 ?auto_188403 )
      ( MAKE-4PILE ?auto_188402 ?auto_188403 ?auto_188404 ?auto_188405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188411 - BLOCK
      ?auto_188412 - BLOCK
      ?auto_188413 - BLOCK
      ?auto_188414 - BLOCK
    )
    :vars
    (
      ?auto_188416 - BLOCK
      ?auto_188417 - BLOCK
      ?auto_188415 - BLOCK
      ?auto_188418 - BLOCK
      ?auto_188419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188411 ) ( not ( = ?auto_188411 ?auto_188412 ) ) ( not ( = ?auto_188411 ?auto_188413 ) ) ( not ( = ?auto_188411 ?auto_188414 ) ) ( not ( = ?auto_188412 ?auto_188413 ) ) ( not ( = ?auto_188412 ?auto_188414 ) ) ( not ( = ?auto_188413 ?auto_188414 ) ) ( ON ?auto_188414 ?auto_188416 ) ( not ( = ?auto_188411 ?auto_188416 ) ) ( not ( = ?auto_188412 ?auto_188416 ) ) ( not ( = ?auto_188413 ?auto_188416 ) ) ( not ( = ?auto_188414 ?auto_188416 ) ) ( ON ?auto_188413 ?auto_188414 ) ( ON-TABLE ?auto_188417 ) ( ON ?auto_188415 ?auto_188417 ) ( ON ?auto_188418 ?auto_188415 ) ( ON ?auto_188419 ?auto_188418 ) ( ON ?auto_188416 ?auto_188419 ) ( not ( = ?auto_188417 ?auto_188415 ) ) ( not ( = ?auto_188417 ?auto_188418 ) ) ( not ( = ?auto_188417 ?auto_188419 ) ) ( not ( = ?auto_188417 ?auto_188416 ) ) ( not ( = ?auto_188417 ?auto_188414 ) ) ( not ( = ?auto_188417 ?auto_188413 ) ) ( not ( = ?auto_188415 ?auto_188418 ) ) ( not ( = ?auto_188415 ?auto_188419 ) ) ( not ( = ?auto_188415 ?auto_188416 ) ) ( not ( = ?auto_188415 ?auto_188414 ) ) ( not ( = ?auto_188415 ?auto_188413 ) ) ( not ( = ?auto_188418 ?auto_188419 ) ) ( not ( = ?auto_188418 ?auto_188416 ) ) ( not ( = ?auto_188418 ?auto_188414 ) ) ( not ( = ?auto_188418 ?auto_188413 ) ) ( not ( = ?auto_188419 ?auto_188416 ) ) ( not ( = ?auto_188419 ?auto_188414 ) ) ( not ( = ?auto_188419 ?auto_188413 ) ) ( not ( = ?auto_188411 ?auto_188417 ) ) ( not ( = ?auto_188411 ?auto_188415 ) ) ( not ( = ?auto_188411 ?auto_188418 ) ) ( not ( = ?auto_188411 ?auto_188419 ) ) ( not ( = ?auto_188412 ?auto_188417 ) ) ( not ( = ?auto_188412 ?auto_188415 ) ) ( not ( = ?auto_188412 ?auto_188418 ) ) ( not ( = ?auto_188412 ?auto_188419 ) ) ( CLEAR ?auto_188411 ) ( ON ?auto_188412 ?auto_188413 ) ( CLEAR ?auto_188412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188417 ?auto_188415 ?auto_188418 ?auto_188419 ?auto_188416 ?auto_188414 ?auto_188413 )
      ( MAKE-4PILE ?auto_188411 ?auto_188412 ?auto_188413 ?auto_188414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188420 - BLOCK
      ?auto_188421 - BLOCK
      ?auto_188422 - BLOCK
      ?auto_188423 - BLOCK
    )
    :vars
    (
      ?auto_188424 - BLOCK
      ?auto_188428 - BLOCK
      ?auto_188427 - BLOCK
      ?auto_188426 - BLOCK
      ?auto_188425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188420 ?auto_188421 ) ) ( not ( = ?auto_188420 ?auto_188422 ) ) ( not ( = ?auto_188420 ?auto_188423 ) ) ( not ( = ?auto_188421 ?auto_188422 ) ) ( not ( = ?auto_188421 ?auto_188423 ) ) ( not ( = ?auto_188422 ?auto_188423 ) ) ( ON ?auto_188423 ?auto_188424 ) ( not ( = ?auto_188420 ?auto_188424 ) ) ( not ( = ?auto_188421 ?auto_188424 ) ) ( not ( = ?auto_188422 ?auto_188424 ) ) ( not ( = ?auto_188423 ?auto_188424 ) ) ( ON ?auto_188422 ?auto_188423 ) ( ON-TABLE ?auto_188428 ) ( ON ?auto_188427 ?auto_188428 ) ( ON ?auto_188426 ?auto_188427 ) ( ON ?auto_188425 ?auto_188426 ) ( ON ?auto_188424 ?auto_188425 ) ( not ( = ?auto_188428 ?auto_188427 ) ) ( not ( = ?auto_188428 ?auto_188426 ) ) ( not ( = ?auto_188428 ?auto_188425 ) ) ( not ( = ?auto_188428 ?auto_188424 ) ) ( not ( = ?auto_188428 ?auto_188423 ) ) ( not ( = ?auto_188428 ?auto_188422 ) ) ( not ( = ?auto_188427 ?auto_188426 ) ) ( not ( = ?auto_188427 ?auto_188425 ) ) ( not ( = ?auto_188427 ?auto_188424 ) ) ( not ( = ?auto_188427 ?auto_188423 ) ) ( not ( = ?auto_188427 ?auto_188422 ) ) ( not ( = ?auto_188426 ?auto_188425 ) ) ( not ( = ?auto_188426 ?auto_188424 ) ) ( not ( = ?auto_188426 ?auto_188423 ) ) ( not ( = ?auto_188426 ?auto_188422 ) ) ( not ( = ?auto_188425 ?auto_188424 ) ) ( not ( = ?auto_188425 ?auto_188423 ) ) ( not ( = ?auto_188425 ?auto_188422 ) ) ( not ( = ?auto_188420 ?auto_188428 ) ) ( not ( = ?auto_188420 ?auto_188427 ) ) ( not ( = ?auto_188420 ?auto_188426 ) ) ( not ( = ?auto_188420 ?auto_188425 ) ) ( not ( = ?auto_188421 ?auto_188428 ) ) ( not ( = ?auto_188421 ?auto_188427 ) ) ( not ( = ?auto_188421 ?auto_188426 ) ) ( not ( = ?auto_188421 ?auto_188425 ) ) ( ON ?auto_188421 ?auto_188422 ) ( CLEAR ?auto_188421 ) ( HOLDING ?auto_188420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188420 )
      ( MAKE-4PILE ?auto_188420 ?auto_188421 ?auto_188422 ?auto_188423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188429 - BLOCK
      ?auto_188430 - BLOCK
      ?auto_188431 - BLOCK
      ?auto_188432 - BLOCK
    )
    :vars
    (
      ?auto_188435 - BLOCK
      ?auto_188434 - BLOCK
      ?auto_188436 - BLOCK
      ?auto_188433 - BLOCK
      ?auto_188437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188429 ?auto_188430 ) ) ( not ( = ?auto_188429 ?auto_188431 ) ) ( not ( = ?auto_188429 ?auto_188432 ) ) ( not ( = ?auto_188430 ?auto_188431 ) ) ( not ( = ?auto_188430 ?auto_188432 ) ) ( not ( = ?auto_188431 ?auto_188432 ) ) ( ON ?auto_188432 ?auto_188435 ) ( not ( = ?auto_188429 ?auto_188435 ) ) ( not ( = ?auto_188430 ?auto_188435 ) ) ( not ( = ?auto_188431 ?auto_188435 ) ) ( not ( = ?auto_188432 ?auto_188435 ) ) ( ON ?auto_188431 ?auto_188432 ) ( ON-TABLE ?auto_188434 ) ( ON ?auto_188436 ?auto_188434 ) ( ON ?auto_188433 ?auto_188436 ) ( ON ?auto_188437 ?auto_188433 ) ( ON ?auto_188435 ?auto_188437 ) ( not ( = ?auto_188434 ?auto_188436 ) ) ( not ( = ?auto_188434 ?auto_188433 ) ) ( not ( = ?auto_188434 ?auto_188437 ) ) ( not ( = ?auto_188434 ?auto_188435 ) ) ( not ( = ?auto_188434 ?auto_188432 ) ) ( not ( = ?auto_188434 ?auto_188431 ) ) ( not ( = ?auto_188436 ?auto_188433 ) ) ( not ( = ?auto_188436 ?auto_188437 ) ) ( not ( = ?auto_188436 ?auto_188435 ) ) ( not ( = ?auto_188436 ?auto_188432 ) ) ( not ( = ?auto_188436 ?auto_188431 ) ) ( not ( = ?auto_188433 ?auto_188437 ) ) ( not ( = ?auto_188433 ?auto_188435 ) ) ( not ( = ?auto_188433 ?auto_188432 ) ) ( not ( = ?auto_188433 ?auto_188431 ) ) ( not ( = ?auto_188437 ?auto_188435 ) ) ( not ( = ?auto_188437 ?auto_188432 ) ) ( not ( = ?auto_188437 ?auto_188431 ) ) ( not ( = ?auto_188429 ?auto_188434 ) ) ( not ( = ?auto_188429 ?auto_188436 ) ) ( not ( = ?auto_188429 ?auto_188433 ) ) ( not ( = ?auto_188429 ?auto_188437 ) ) ( not ( = ?auto_188430 ?auto_188434 ) ) ( not ( = ?auto_188430 ?auto_188436 ) ) ( not ( = ?auto_188430 ?auto_188433 ) ) ( not ( = ?auto_188430 ?auto_188437 ) ) ( ON ?auto_188430 ?auto_188431 ) ( ON ?auto_188429 ?auto_188430 ) ( CLEAR ?auto_188429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188434 ?auto_188436 ?auto_188433 ?auto_188437 ?auto_188435 ?auto_188432 ?auto_188431 ?auto_188430 )
      ( MAKE-4PILE ?auto_188429 ?auto_188430 ?auto_188431 ?auto_188432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188442 - BLOCK
      ?auto_188443 - BLOCK
      ?auto_188444 - BLOCK
      ?auto_188445 - BLOCK
    )
    :vars
    (
      ?auto_188446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188446 ?auto_188445 ) ( CLEAR ?auto_188446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188442 ) ( ON ?auto_188443 ?auto_188442 ) ( ON ?auto_188444 ?auto_188443 ) ( ON ?auto_188445 ?auto_188444 ) ( not ( = ?auto_188442 ?auto_188443 ) ) ( not ( = ?auto_188442 ?auto_188444 ) ) ( not ( = ?auto_188442 ?auto_188445 ) ) ( not ( = ?auto_188442 ?auto_188446 ) ) ( not ( = ?auto_188443 ?auto_188444 ) ) ( not ( = ?auto_188443 ?auto_188445 ) ) ( not ( = ?auto_188443 ?auto_188446 ) ) ( not ( = ?auto_188444 ?auto_188445 ) ) ( not ( = ?auto_188444 ?auto_188446 ) ) ( not ( = ?auto_188445 ?auto_188446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188446 ?auto_188445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188447 - BLOCK
      ?auto_188448 - BLOCK
      ?auto_188449 - BLOCK
      ?auto_188450 - BLOCK
    )
    :vars
    (
      ?auto_188451 - BLOCK
      ?auto_188452 - BLOCK
      ?auto_188453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188451 ?auto_188450 ) ( CLEAR ?auto_188451 ) ( ON-TABLE ?auto_188447 ) ( ON ?auto_188448 ?auto_188447 ) ( ON ?auto_188449 ?auto_188448 ) ( ON ?auto_188450 ?auto_188449 ) ( not ( = ?auto_188447 ?auto_188448 ) ) ( not ( = ?auto_188447 ?auto_188449 ) ) ( not ( = ?auto_188447 ?auto_188450 ) ) ( not ( = ?auto_188447 ?auto_188451 ) ) ( not ( = ?auto_188448 ?auto_188449 ) ) ( not ( = ?auto_188448 ?auto_188450 ) ) ( not ( = ?auto_188448 ?auto_188451 ) ) ( not ( = ?auto_188449 ?auto_188450 ) ) ( not ( = ?auto_188449 ?auto_188451 ) ) ( not ( = ?auto_188450 ?auto_188451 ) ) ( HOLDING ?auto_188452 ) ( CLEAR ?auto_188453 ) ( not ( = ?auto_188447 ?auto_188452 ) ) ( not ( = ?auto_188447 ?auto_188453 ) ) ( not ( = ?auto_188448 ?auto_188452 ) ) ( not ( = ?auto_188448 ?auto_188453 ) ) ( not ( = ?auto_188449 ?auto_188452 ) ) ( not ( = ?auto_188449 ?auto_188453 ) ) ( not ( = ?auto_188450 ?auto_188452 ) ) ( not ( = ?auto_188450 ?auto_188453 ) ) ( not ( = ?auto_188451 ?auto_188452 ) ) ( not ( = ?auto_188451 ?auto_188453 ) ) ( not ( = ?auto_188452 ?auto_188453 ) ) )
    :subtasks
    ( ( !STACK ?auto_188452 ?auto_188453 )
      ( MAKE-4PILE ?auto_188447 ?auto_188448 ?auto_188449 ?auto_188450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188454 - BLOCK
      ?auto_188455 - BLOCK
      ?auto_188456 - BLOCK
      ?auto_188457 - BLOCK
    )
    :vars
    (
      ?auto_188459 - BLOCK
      ?auto_188460 - BLOCK
      ?auto_188458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188459 ?auto_188457 ) ( ON-TABLE ?auto_188454 ) ( ON ?auto_188455 ?auto_188454 ) ( ON ?auto_188456 ?auto_188455 ) ( ON ?auto_188457 ?auto_188456 ) ( not ( = ?auto_188454 ?auto_188455 ) ) ( not ( = ?auto_188454 ?auto_188456 ) ) ( not ( = ?auto_188454 ?auto_188457 ) ) ( not ( = ?auto_188454 ?auto_188459 ) ) ( not ( = ?auto_188455 ?auto_188456 ) ) ( not ( = ?auto_188455 ?auto_188457 ) ) ( not ( = ?auto_188455 ?auto_188459 ) ) ( not ( = ?auto_188456 ?auto_188457 ) ) ( not ( = ?auto_188456 ?auto_188459 ) ) ( not ( = ?auto_188457 ?auto_188459 ) ) ( CLEAR ?auto_188460 ) ( not ( = ?auto_188454 ?auto_188458 ) ) ( not ( = ?auto_188454 ?auto_188460 ) ) ( not ( = ?auto_188455 ?auto_188458 ) ) ( not ( = ?auto_188455 ?auto_188460 ) ) ( not ( = ?auto_188456 ?auto_188458 ) ) ( not ( = ?auto_188456 ?auto_188460 ) ) ( not ( = ?auto_188457 ?auto_188458 ) ) ( not ( = ?auto_188457 ?auto_188460 ) ) ( not ( = ?auto_188459 ?auto_188458 ) ) ( not ( = ?auto_188459 ?auto_188460 ) ) ( not ( = ?auto_188458 ?auto_188460 ) ) ( ON ?auto_188458 ?auto_188459 ) ( CLEAR ?auto_188458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188454 ?auto_188455 ?auto_188456 ?auto_188457 ?auto_188459 )
      ( MAKE-4PILE ?auto_188454 ?auto_188455 ?auto_188456 ?auto_188457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188461 - BLOCK
      ?auto_188462 - BLOCK
      ?auto_188463 - BLOCK
      ?auto_188464 - BLOCK
    )
    :vars
    (
      ?auto_188466 - BLOCK
      ?auto_188467 - BLOCK
      ?auto_188465 - BLOCK
      ?auto_188469 - BLOCK
      ?auto_188468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188466 ?auto_188464 ) ( ON-TABLE ?auto_188461 ) ( ON ?auto_188462 ?auto_188461 ) ( ON ?auto_188463 ?auto_188462 ) ( ON ?auto_188464 ?auto_188463 ) ( not ( = ?auto_188461 ?auto_188462 ) ) ( not ( = ?auto_188461 ?auto_188463 ) ) ( not ( = ?auto_188461 ?auto_188464 ) ) ( not ( = ?auto_188461 ?auto_188466 ) ) ( not ( = ?auto_188462 ?auto_188463 ) ) ( not ( = ?auto_188462 ?auto_188464 ) ) ( not ( = ?auto_188462 ?auto_188466 ) ) ( not ( = ?auto_188463 ?auto_188464 ) ) ( not ( = ?auto_188463 ?auto_188466 ) ) ( not ( = ?auto_188464 ?auto_188466 ) ) ( not ( = ?auto_188461 ?auto_188467 ) ) ( not ( = ?auto_188461 ?auto_188465 ) ) ( not ( = ?auto_188462 ?auto_188467 ) ) ( not ( = ?auto_188462 ?auto_188465 ) ) ( not ( = ?auto_188463 ?auto_188467 ) ) ( not ( = ?auto_188463 ?auto_188465 ) ) ( not ( = ?auto_188464 ?auto_188467 ) ) ( not ( = ?auto_188464 ?auto_188465 ) ) ( not ( = ?auto_188466 ?auto_188467 ) ) ( not ( = ?auto_188466 ?auto_188465 ) ) ( not ( = ?auto_188467 ?auto_188465 ) ) ( ON ?auto_188467 ?auto_188466 ) ( CLEAR ?auto_188467 ) ( HOLDING ?auto_188465 ) ( CLEAR ?auto_188469 ) ( ON-TABLE ?auto_188468 ) ( ON ?auto_188469 ?auto_188468 ) ( not ( = ?auto_188468 ?auto_188469 ) ) ( not ( = ?auto_188468 ?auto_188465 ) ) ( not ( = ?auto_188469 ?auto_188465 ) ) ( not ( = ?auto_188461 ?auto_188469 ) ) ( not ( = ?auto_188461 ?auto_188468 ) ) ( not ( = ?auto_188462 ?auto_188469 ) ) ( not ( = ?auto_188462 ?auto_188468 ) ) ( not ( = ?auto_188463 ?auto_188469 ) ) ( not ( = ?auto_188463 ?auto_188468 ) ) ( not ( = ?auto_188464 ?auto_188469 ) ) ( not ( = ?auto_188464 ?auto_188468 ) ) ( not ( = ?auto_188466 ?auto_188469 ) ) ( not ( = ?auto_188466 ?auto_188468 ) ) ( not ( = ?auto_188467 ?auto_188469 ) ) ( not ( = ?auto_188467 ?auto_188468 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188468 ?auto_188469 ?auto_188465 )
      ( MAKE-4PILE ?auto_188461 ?auto_188462 ?auto_188463 ?auto_188464 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188470 - BLOCK
      ?auto_188471 - BLOCK
      ?auto_188472 - BLOCK
      ?auto_188473 - BLOCK
    )
    :vars
    (
      ?auto_188478 - BLOCK
      ?auto_188477 - BLOCK
      ?auto_188474 - BLOCK
      ?auto_188476 - BLOCK
      ?auto_188475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188478 ?auto_188473 ) ( ON-TABLE ?auto_188470 ) ( ON ?auto_188471 ?auto_188470 ) ( ON ?auto_188472 ?auto_188471 ) ( ON ?auto_188473 ?auto_188472 ) ( not ( = ?auto_188470 ?auto_188471 ) ) ( not ( = ?auto_188470 ?auto_188472 ) ) ( not ( = ?auto_188470 ?auto_188473 ) ) ( not ( = ?auto_188470 ?auto_188478 ) ) ( not ( = ?auto_188471 ?auto_188472 ) ) ( not ( = ?auto_188471 ?auto_188473 ) ) ( not ( = ?auto_188471 ?auto_188478 ) ) ( not ( = ?auto_188472 ?auto_188473 ) ) ( not ( = ?auto_188472 ?auto_188478 ) ) ( not ( = ?auto_188473 ?auto_188478 ) ) ( not ( = ?auto_188470 ?auto_188477 ) ) ( not ( = ?auto_188470 ?auto_188474 ) ) ( not ( = ?auto_188471 ?auto_188477 ) ) ( not ( = ?auto_188471 ?auto_188474 ) ) ( not ( = ?auto_188472 ?auto_188477 ) ) ( not ( = ?auto_188472 ?auto_188474 ) ) ( not ( = ?auto_188473 ?auto_188477 ) ) ( not ( = ?auto_188473 ?auto_188474 ) ) ( not ( = ?auto_188478 ?auto_188477 ) ) ( not ( = ?auto_188478 ?auto_188474 ) ) ( not ( = ?auto_188477 ?auto_188474 ) ) ( ON ?auto_188477 ?auto_188478 ) ( CLEAR ?auto_188476 ) ( ON-TABLE ?auto_188475 ) ( ON ?auto_188476 ?auto_188475 ) ( not ( = ?auto_188475 ?auto_188476 ) ) ( not ( = ?auto_188475 ?auto_188474 ) ) ( not ( = ?auto_188476 ?auto_188474 ) ) ( not ( = ?auto_188470 ?auto_188476 ) ) ( not ( = ?auto_188470 ?auto_188475 ) ) ( not ( = ?auto_188471 ?auto_188476 ) ) ( not ( = ?auto_188471 ?auto_188475 ) ) ( not ( = ?auto_188472 ?auto_188476 ) ) ( not ( = ?auto_188472 ?auto_188475 ) ) ( not ( = ?auto_188473 ?auto_188476 ) ) ( not ( = ?auto_188473 ?auto_188475 ) ) ( not ( = ?auto_188478 ?auto_188476 ) ) ( not ( = ?auto_188478 ?auto_188475 ) ) ( not ( = ?auto_188477 ?auto_188476 ) ) ( not ( = ?auto_188477 ?auto_188475 ) ) ( ON ?auto_188474 ?auto_188477 ) ( CLEAR ?auto_188474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188470 ?auto_188471 ?auto_188472 ?auto_188473 ?auto_188478 ?auto_188477 )
      ( MAKE-4PILE ?auto_188470 ?auto_188471 ?auto_188472 ?auto_188473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188479 - BLOCK
      ?auto_188480 - BLOCK
      ?auto_188481 - BLOCK
      ?auto_188482 - BLOCK
    )
    :vars
    (
      ?auto_188486 - BLOCK
      ?auto_188483 - BLOCK
      ?auto_188485 - BLOCK
      ?auto_188484 - BLOCK
      ?auto_188487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188486 ?auto_188482 ) ( ON-TABLE ?auto_188479 ) ( ON ?auto_188480 ?auto_188479 ) ( ON ?auto_188481 ?auto_188480 ) ( ON ?auto_188482 ?auto_188481 ) ( not ( = ?auto_188479 ?auto_188480 ) ) ( not ( = ?auto_188479 ?auto_188481 ) ) ( not ( = ?auto_188479 ?auto_188482 ) ) ( not ( = ?auto_188479 ?auto_188486 ) ) ( not ( = ?auto_188480 ?auto_188481 ) ) ( not ( = ?auto_188480 ?auto_188482 ) ) ( not ( = ?auto_188480 ?auto_188486 ) ) ( not ( = ?auto_188481 ?auto_188482 ) ) ( not ( = ?auto_188481 ?auto_188486 ) ) ( not ( = ?auto_188482 ?auto_188486 ) ) ( not ( = ?auto_188479 ?auto_188483 ) ) ( not ( = ?auto_188479 ?auto_188485 ) ) ( not ( = ?auto_188480 ?auto_188483 ) ) ( not ( = ?auto_188480 ?auto_188485 ) ) ( not ( = ?auto_188481 ?auto_188483 ) ) ( not ( = ?auto_188481 ?auto_188485 ) ) ( not ( = ?auto_188482 ?auto_188483 ) ) ( not ( = ?auto_188482 ?auto_188485 ) ) ( not ( = ?auto_188486 ?auto_188483 ) ) ( not ( = ?auto_188486 ?auto_188485 ) ) ( not ( = ?auto_188483 ?auto_188485 ) ) ( ON ?auto_188483 ?auto_188486 ) ( ON-TABLE ?auto_188484 ) ( not ( = ?auto_188484 ?auto_188487 ) ) ( not ( = ?auto_188484 ?auto_188485 ) ) ( not ( = ?auto_188487 ?auto_188485 ) ) ( not ( = ?auto_188479 ?auto_188487 ) ) ( not ( = ?auto_188479 ?auto_188484 ) ) ( not ( = ?auto_188480 ?auto_188487 ) ) ( not ( = ?auto_188480 ?auto_188484 ) ) ( not ( = ?auto_188481 ?auto_188487 ) ) ( not ( = ?auto_188481 ?auto_188484 ) ) ( not ( = ?auto_188482 ?auto_188487 ) ) ( not ( = ?auto_188482 ?auto_188484 ) ) ( not ( = ?auto_188486 ?auto_188487 ) ) ( not ( = ?auto_188486 ?auto_188484 ) ) ( not ( = ?auto_188483 ?auto_188487 ) ) ( not ( = ?auto_188483 ?auto_188484 ) ) ( ON ?auto_188485 ?auto_188483 ) ( CLEAR ?auto_188485 ) ( HOLDING ?auto_188487 ) ( CLEAR ?auto_188484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188484 ?auto_188487 )
      ( MAKE-4PILE ?auto_188479 ?auto_188480 ?auto_188481 ?auto_188482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190181 - BLOCK
      ?auto_190182 - BLOCK
      ?auto_190183 - BLOCK
      ?auto_190184 - BLOCK
    )
    :vars
    (
      ?auto_190186 - BLOCK
      ?auto_190185 - BLOCK
      ?auto_190188 - BLOCK
      ?auto_190187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190186 ?auto_190184 ) ( ON-TABLE ?auto_190181 ) ( ON ?auto_190182 ?auto_190181 ) ( ON ?auto_190183 ?auto_190182 ) ( ON ?auto_190184 ?auto_190183 ) ( not ( = ?auto_190181 ?auto_190182 ) ) ( not ( = ?auto_190181 ?auto_190183 ) ) ( not ( = ?auto_190181 ?auto_190184 ) ) ( not ( = ?auto_190181 ?auto_190186 ) ) ( not ( = ?auto_190182 ?auto_190183 ) ) ( not ( = ?auto_190182 ?auto_190184 ) ) ( not ( = ?auto_190182 ?auto_190186 ) ) ( not ( = ?auto_190183 ?auto_190184 ) ) ( not ( = ?auto_190183 ?auto_190186 ) ) ( not ( = ?auto_190184 ?auto_190186 ) ) ( not ( = ?auto_190181 ?auto_190185 ) ) ( not ( = ?auto_190181 ?auto_190188 ) ) ( not ( = ?auto_190182 ?auto_190185 ) ) ( not ( = ?auto_190182 ?auto_190188 ) ) ( not ( = ?auto_190183 ?auto_190185 ) ) ( not ( = ?auto_190183 ?auto_190188 ) ) ( not ( = ?auto_190184 ?auto_190185 ) ) ( not ( = ?auto_190184 ?auto_190188 ) ) ( not ( = ?auto_190186 ?auto_190185 ) ) ( not ( = ?auto_190186 ?auto_190188 ) ) ( not ( = ?auto_190185 ?auto_190188 ) ) ( ON ?auto_190185 ?auto_190186 ) ( not ( = ?auto_190187 ?auto_190188 ) ) ( not ( = ?auto_190181 ?auto_190187 ) ) ( not ( = ?auto_190182 ?auto_190187 ) ) ( not ( = ?auto_190183 ?auto_190187 ) ) ( not ( = ?auto_190184 ?auto_190187 ) ) ( not ( = ?auto_190186 ?auto_190187 ) ) ( not ( = ?auto_190185 ?auto_190187 ) ) ( ON ?auto_190188 ?auto_190185 ) ( ON ?auto_190187 ?auto_190188 ) ( CLEAR ?auto_190187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190181 ?auto_190182 ?auto_190183 ?auto_190184 ?auto_190186 ?auto_190185 ?auto_190188 )
      ( MAKE-4PILE ?auto_190181 ?auto_190182 ?auto_190183 ?auto_190184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188497 - BLOCK
      ?auto_188498 - BLOCK
      ?auto_188499 - BLOCK
      ?auto_188500 - BLOCK
    )
    :vars
    (
      ?auto_188502 - BLOCK
      ?auto_188503 - BLOCK
      ?auto_188505 - BLOCK
      ?auto_188504 - BLOCK
      ?auto_188501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188502 ?auto_188500 ) ( ON-TABLE ?auto_188497 ) ( ON ?auto_188498 ?auto_188497 ) ( ON ?auto_188499 ?auto_188498 ) ( ON ?auto_188500 ?auto_188499 ) ( not ( = ?auto_188497 ?auto_188498 ) ) ( not ( = ?auto_188497 ?auto_188499 ) ) ( not ( = ?auto_188497 ?auto_188500 ) ) ( not ( = ?auto_188497 ?auto_188502 ) ) ( not ( = ?auto_188498 ?auto_188499 ) ) ( not ( = ?auto_188498 ?auto_188500 ) ) ( not ( = ?auto_188498 ?auto_188502 ) ) ( not ( = ?auto_188499 ?auto_188500 ) ) ( not ( = ?auto_188499 ?auto_188502 ) ) ( not ( = ?auto_188500 ?auto_188502 ) ) ( not ( = ?auto_188497 ?auto_188503 ) ) ( not ( = ?auto_188497 ?auto_188505 ) ) ( not ( = ?auto_188498 ?auto_188503 ) ) ( not ( = ?auto_188498 ?auto_188505 ) ) ( not ( = ?auto_188499 ?auto_188503 ) ) ( not ( = ?auto_188499 ?auto_188505 ) ) ( not ( = ?auto_188500 ?auto_188503 ) ) ( not ( = ?auto_188500 ?auto_188505 ) ) ( not ( = ?auto_188502 ?auto_188503 ) ) ( not ( = ?auto_188502 ?auto_188505 ) ) ( not ( = ?auto_188503 ?auto_188505 ) ) ( ON ?auto_188503 ?auto_188502 ) ( not ( = ?auto_188504 ?auto_188501 ) ) ( not ( = ?auto_188504 ?auto_188505 ) ) ( not ( = ?auto_188501 ?auto_188505 ) ) ( not ( = ?auto_188497 ?auto_188501 ) ) ( not ( = ?auto_188497 ?auto_188504 ) ) ( not ( = ?auto_188498 ?auto_188501 ) ) ( not ( = ?auto_188498 ?auto_188504 ) ) ( not ( = ?auto_188499 ?auto_188501 ) ) ( not ( = ?auto_188499 ?auto_188504 ) ) ( not ( = ?auto_188500 ?auto_188501 ) ) ( not ( = ?auto_188500 ?auto_188504 ) ) ( not ( = ?auto_188502 ?auto_188501 ) ) ( not ( = ?auto_188502 ?auto_188504 ) ) ( not ( = ?auto_188503 ?auto_188501 ) ) ( not ( = ?auto_188503 ?auto_188504 ) ) ( ON ?auto_188505 ?auto_188503 ) ( ON ?auto_188501 ?auto_188505 ) ( CLEAR ?auto_188501 ) ( HOLDING ?auto_188504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188504 )
      ( MAKE-4PILE ?auto_188497 ?auto_188498 ?auto_188499 ?auto_188500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188506 - BLOCK
      ?auto_188507 - BLOCK
      ?auto_188508 - BLOCK
      ?auto_188509 - BLOCK
    )
    :vars
    (
      ?auto_188510 - BLOCK
      ?auto_188511 - BLOCK
      ?auto_188514 - BLOCK
      ?auto_188512 - BLOCK
      ?auto_188513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188510 ?auto_188509 ) ( ON-TABLE ?auto_188506 ) ( ON ?auto_188507 ?auto_188506 ) ( ON ?auto_188508 ?auto_188507 ) ( ON ?auto_188509 ?auto_188508 ) ( not ( = ?auto_188506 ?auto_188507 ) ) ( not ( = ?auto_188506 ?auto_188508 ) ) ( not ( = ?auto_188506 ?auto_188509 ) ) ( not ( = ?auto_188506 ?auto_188510 ) ) ( not ( = ?auto_188507 ?auto_188508 ) ) ( not ( = ?auto_188507 ?auto_188509 ) ) ( not ( = ?auto_188507 ?auto_188510 ) ) ( not ( = ?auto_188508 ?auto_188509 ) ) ( not ( = ?auto_188508 ?auto_188510 ) ) ( not ( = ?auto_188509 ?auto_188510 ) ) ( not ( = ?auto_188506 ?auto_188511 ) ) ( not ( = ?auto_188506 ?auto_188514 ) ) ( not ( = ?auto_188507 ?auto_188511 ) ) ( not ( = ?auto_188507 ?auto_188514 ) ) ( not ( = ?auto_188508 ?auto_188511 ) ) ( not ( = ?auto_188508 ?auto_188514 ) ) ( not ( = ?auto_188509 ?auto_188511 ) ) ( not ( = ?auto_188509 ?auto_188514 ) ) ( not ( = ?auto_188510 ?auto_188511 ) ) ( not ( = ?auto_188510 ?auto_188514 ) ) ( not ( = ?auto_188511 ?auto_188514 ) ) ( ON ?auto_188511 ?auto_188510 ) ( not ( = ?auto_188512 ?auto_188513 ) ) ( not ( = ?auto_188512 ?auto_188514 ) ) ( not ( = ?auto_188513 ?auto_188514 ) ) ( not ( = ?auto_188506 ?auto_188513 ) ) ( not ( = ?auto_188506 ?auto_188512 ) ) ( not ( = ?auto_188507 ?auto_188513 ) ) ( not ( = ?auto_188507 ?auto_188512 ) ) ( not ( = ?auto_188508 ?auto_188513 ) ) ( not ( = ?auto_188508 ?auto_188512 ) ) ( not ( = ?auto_188509 ?auto_188513 ) ) ( not ( = ?auto_188509 ?auto_188512 ) ) ( not ( = ?auto_188510 ?auto_188513 ) ) ( not ( = ?auto_188510 ?auto_188512 ) ) ( not ( = ?auto_188511 ?auto_188513 ) ) ( not ( = ?auto_188511 ?auto_188512 ) ) ( ON ?auto_188514 ?auto_188511 ) ( ON ?auto_188513 ?auto_188514 ) ( ON ?auto_188512 ?auto_188513 ) ( CLEAR ?auto_188512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188506 ?auto_188507 ?auto_188508 ?auto_188509 ?auto_188510 ?auto_188511 ?auto_188514 ?auto_188513 )
      ( MAKE-4PILE ?auto_188506 ?auto_188507 ?auto_188508 ?auto_188509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188520 - BLOCK
      ?auto_188521 - BLOCK
      ?auto_188522 - BLOCK
      ?auto_188523 - BLOCK
      ?auto_188524 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188524 ) ( CLEAR ?auto_188523 ) ( ON-TABLE ?auto_188520 ) ( ON ?auto_188521 ?auto_188520 ) ( ON ?auto_188522 ?auto_188521 ) ( ON ?auto_188523 ?auto_188522 ) ( not ( = ?auto_188520 ?auto_188521 ) ) ( not ( = ?auto_188520 ?auto_188522 ) ) ( not ( = ?auto_188520 ?auto_188523 ) ) ( not ( = ?auto_188520 ?auto_188524 ) ) ( not ( = ?auto_188521 ?auto_188522 ) ) ( not ( = ?auto_188521 ?auto_188523 ) ) ( not ( = ?auto_188521 ?auto_188524 ) ) ( not ( = ?auto_188522 ?auto_188523 ) ) ( not ( = ?auto_188522 ?auto_188524 ) ) ( not ( = ?auto_188523 ?auto_188524 ) ) )
    :subtasks
    ( ( !STACK ?auto_188524 ?auto_188523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188525 - BLOCK
      ?auto_188526 - BLOCK
      ?auto_188527 - BLOCK
      ?auto_188528 - BLOCK
      ?auto_188529 - BLOCK
    )
    :vars
    (
      ?auto_188530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188528 ) ( ON-TABLE ?auto_188525 ) ( ON ?auto_188526 ?auto_188525 ) ( ON ?auto_188527 ?auto_188526 ) ( ON ?auto_188528 ?auto_188527 ) ( not ( = ?auto_188525 ?auto_188526 ) ) ( not ( = ?auto_188525 ?auto_188527 ) ) ( not ( = ?auto_188525 ?auto_188528 ) ) ( not ( = ?auto_188525 ?auto_188529 ) ) ( not ( = ?auto_188526 ?auto_188527 ) ) ( not ( = ?auto_188526 ?auto_188528 ) ) ( not ( = ?auto_188526 ?auto_188529 ) ) ( not ( = ?auto_188527 ?auto_188528 ) ) ( not ( = ?auto_188527 ?auto_188529 ) ) ( not ( = ?auto_188528 ?auto_188529 ) ) ( ON ?auto_188529 ?auto_188530 ) ( CLEAR ?auto_188529 ) ( HAND-EMPTY ) ( not ( = ?auto_188525 ?auto_188530 ) ) ( not ( = ?auto_188526 ?auto_188530 ) ) ( not ( = ?auto_188527 ?auto_188530 ) ) ( not ( = ?auto_188528 ?auto_188530 ) ) ( not ( = ?auto_188529 ?auto_188530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188529 ?auto_188530 )
      ( MAKE-5PILE ?auto_188525 ?auto_188526 ?auto_188527 ?auto_188528 ?auto_188529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188531 - BLOCK
      ?auto_188532 - BLOCK
      ?auto_188533 - BLOCK
      ?auto_188534 - BLOCK
      ?auto_188535 - BLOCK
    )
    :vars
    (
      ?auto_188536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188531 ) ( ON ?auto_188532 ?auto_188531 ) ( ON ?auto_188533 ?auto_188532 ) ( not ( = ?auto_188531 ?auto_188532 ) ) ( not ( = ?auto_188531 ?auto_188533 ) ) ( not ( = ?auto_188531 ?auto_188534 ) ) ( not ( = ?auto_188531 ?auto_188535 ) ) ( not ( = ?auto_188532 ?auto_188533 ) ) ( not ( = ?auto_188532 ?auto_188534 ) ) ( not ( = ?auto_188532 ?auto_188535 ) ) ( not ( = ?auto_188533 ?auto_188534 ) ) ( not ( = ?auto_188533 ?auto_188535 ) ) ( not ( = ?auto_188534 ?auto_188535 ) ) ( ON ?auto_188535 ?auto_188536 ) ( CLEAR ?auto_188535 ) ( not ( = ?auto_188531 ?auto_188536 ) ) ( not ( = ?auto_188532 ?auto_188536 ) ) ( not ( = ?auto_188533 ?auto_188536 ) ) ( not ( = ?auto_188534 ?auto_188536 ) ) ( not ( = ?auto_188535 ?auto_188536 ) ) ( HOLDING ?auto_188534 ) ( CLEAR ?auto_188533 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188531 ?auto_188532 ?auto_188533 ?auto_188534 )
      ( MAKE-5PILE ?auto_188531 ?auto_188532 ?auto_188533 ?auto_188534 ?auto_188535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188537 - BLOCK
      ?auto_188538 - BLOCK
      ?auto_188539 - BLOCK
      ?auto_188540 - BLOCK
      ?auto_188541 - BLOCK
    )
    :vars
    (
      ?auto_188542 - BLOCK
      ?auto_188544 - BLOCK
      ?auto_188545 - BLOCK
      ?auto_188543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188537 ) ( ON ?auto_188538 ?auto_188537 ) ( ON ?auto_188539 ?auto_188538 ) ( not ( = ?auto_188537 ?auto_188538 ) ) ( not ( = ?auto_188537 ?auto_188539 ) ) ( not ( = ?auto_188537 ?auto_188540 ) ) ( not ( = ?auto_188537 ?auto_188541 ) ) ( not ( = ?auto_188538 ?auto_188539 ) ) ( not ( = ?auto_188538 ?auto_188540 ) ) ( not ( = ?auto_188538 ?auto_188541 ) ) ( not ( = ?auto_188539 ?auto_188540 ) ) ( not ( = ?auto_188539 ?auto_188541 ) ) ( not ( = ?auto_188540 ?auto_188541 ) ) ( ON ?auto_188541 ?auto_188542 ) ( not ( = ?auto_188537 ?auto_188542 ) ) ( not ( = ?auto_188538 ?auto_188542 ) ) ( not ( = ?auto_188539 ?auto_188542 ) ) ( not ( = ?auto_188540 ?auto_188542 ) ) ( not ( = ?auto_188541 ?auto_188542 ) ) ( CLEAR ?auto_188539 ) ( ON ?auto_188540 ?auto_188541 ) ( CLEAR ?auto_188540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188544 ) ( ON ?auto_188545 ?auto_188544 ) ( ON ?auto_188543 ?auto_188545 ) ( ON ?auto_188542 ?auto_188543 ) ( not ( = ?auto_188544 ?auto_188545 ) ) ( not ( = ?auto_188544 ?auto_188543 ) ) ( not ( = ?auto_188544 ?auto_188542 ) ) ( not ( = ?auto_188544 ?auto_188541 ) ) ( not ( = ?auto_188544 ?auto_188540 ) ) ( not ( = ?auto_188545 ?auto_188543 ) ) ( not ( = ?auto_188545 ?auto_188542 ) ) ( not ( = ?auto_188545 ?auto_188541 ) ) ( not ( = ?auto_188545 ?auto_188540 ) ) ( not ( = ?auto_188543 ?auto_188542 ) ) ( not ( = ?auto_188543 ?auto_188541 ) ) ( not ( = ?auto_188543 ?auto_188540 ) ) ( not ( = ?auto_188537 ?auto_188544 ) ) ( not ( = ?auto_188537 ?auto_188545 ) ) ( not ( = ?auto_188537 ?auto_188543 ) ) ( not ( = ?auto_188538 ?auto_188544 ) ) ( not ( = ?auto_188538 ?auto_188545 ) ) ( not ( = ?auto_188538 ?auto_188543 ) ) ( not ( = ?auto_188539 ?auto_188544 ) ) ( not ( = ?auto_188539 ?auto_188545 ) ) ( not ( = ?auto_188539 ?auto_188543 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188544 ?auto_188545 ?auto_188543 ?auto_188542 ?auto_188541 )
      ( MAKE-5PILE ?auto_188537 ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188546 - BLOCK
      ?auto_188547 - BLOCK
      ?auto_188548 - BLOCK
      ?auto_188549 - BLOCK
      ?auto_188550 - BLOCK
    )
    :vars
    (
      ?auto_188552 - BLOCK
      ?auto_188554 - BLOCK
      ?auto_188551 - BLOCK
      ?auto_188553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188546 ) ( ON ?auto_188547 ?auto_188546 ) ( not ( = ?auto_188546 ?auto_188547 ) ) ( not ( = ?auto_188546 ?auto_188548 ) ) ( not ( = ?auto_188546 ?auto_188549 ) ) ( not ( = ?auto_188546 ?auto_188550 ) ) ( not ( = ?auto_188547 ?auto_188548 ) ) ( not ( = ?auto_188547 ?auto_188549 ) ) ( not ( = ?auto_188547 ?auto_188550 ) ) ( not ( = ?auto_188548 ?auto_188549 ) ) ( not ( = ?auto_188548 ?auto_188550 ) ) ( not ( = ?auto_188549 ?auto_188550 ) ) ( ON ?auto_188550 ?auto_188552 ) ( not ( = ?auto_188546 ?auto_188552 ) ) ( not ( = ?auto_188547 ?auto_188552 ) ) ( not ( = ?auto_188548 ?auto_188552 ) ) ( not ( = ?auto_188549 ?auto_188552 ) ) ( not ( = ?auto_188550 ?auto_188552 ) ) ( ON ?auto_188549 ?auto_188550 ) ( CLEAR ?auto_188549 ) ( ON-TABLE ?auto_188554 ) ( ON ?auto_188551 ?auto_188554 ) ( ON ?auto_188553 ?auto_188551 ) ( ON ?auto_188552 ?auto_188553 ) ( not ( = ?auto_188554 ?auto_188551 ) ) ( not ( = ?auto_188554 ?auto_188553 ) ) ( not ( = ?auto_188554 ?auto_188552 ) ) ( not ( = ?auto_188554 ?auto_188550 ) ) ( not ( = ?auto_188554 ?auto_188549 ) ) ( not ( = ?auto_188551 ?auto_188553 ) ) ( not ( = ?auto_188551 ?auto_188552 ) ) ( not ( = ?auto_188551 ?auto_188550 ) ) ( not ( = ?auto_188551 ?auto_188549 ) ) ( not ( = ?auto_188553 ?auto_188552 ) ) ( not ( = ?auto_188553 ?auto_188550 ) ) ( not ( = ?auto_188553 ?auto_188549 ) ) ( not ( = ?auto_188546 ?auto_188554 ) ) ( not ( = ?auto_188546 ?auto_188551 ) ) ( not ( = ?auto_188546 ?auto_188553 ) ) ( not ( = ?auto_188547 ?auto_188554 ) ) ( not ( = ?auto_188547 ?auto_188551 ) ) ( not ( = ?auto_188547 ?auto_188553 ) ) ( not ( = ?auto_188548 ?auto_188554 ) ) ( not ( = ?auto_188548 ?auto_188551 ) ) ( not ( = ?auto_188548 ?auto_188553 ) ) ( HOLDING ?auto_188548 ) ( CLEAR ?auto_188547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188546 ?auto_188547 ?auto_188548 )
      ( MAKE-5PILE ?auto_188546 ?auto_188547 ?auto_188548 ?auto_188549 ?auto_188550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188555 - BLOCK
      ?auto_188556 - BLOCK
      ?auto_188557 - BLOCK
      ?auto_188558 - BLOCK
      ?auto_188559 - BLOCK
    )
    :vars
    (
      ?auto_188561 - BLOCK
      ?auto_188560 - BLOCK
      ?auto_188563 - BLOCK
      ?auto_188562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188555 ) ( ON ?auto_188556 ?auto_188555 ) ( not ( = ?auto_188555 ?auto_188556 ) ) ( not ( = ?auto_188555 ?auto_188557 ) ) ( not ( = ?auto_188555 ?auto_188558 ) ) ( not ( = ?auto_188555 ?auto_188559 ) ) ( not ( = ?auto_188556 ?auto_188557 ) ) ( not ( = ?auto_188556 ?auto_188558 ) ) ( not ( = ?auto_188556 ?auto_188559 ) ) ( not ( = ?auto_188557 ?auto_188558 ) ) ( not ( = ?auto_188557 ?auto_188559 ) ) ( not ( = ?auto_188558 ?auto_188559 ) ) ( ON ?auto_188559 ?auto_188561 ) ( not ( = ?auto_188555 ?auto_188561 ) ) ( not ( = ?auto_188556 ?auto_188561 ) ) ( not ( = ?auto_188557 ?auto_188561 ) ) ( not ( = ?auto_188558 ?auto_188561 ) ) ( not ( = ?auto_188559 ?auto_188561 ) ) ( ON ?auto_188558 ?auto_188559 ) ( ON-TABLE ?auto_188560 ) ( ON ?auto_188563 ?auto_188560 ) ( ON ?auto_188562 ?auto_188563 ) ( ON ?auto_188561 ?auto_188562 ) ( not ( = ?auto_188560 ?auto_188563 ) ) ( not ( = ?auto_188560 ?auto_188562 ) ) ( not ( = ?auto_188560 ?auto_188561 ) ) ( not ( = ?auto_188560 ?auto_188559 ) ) ( not ( = ?auto_188560 ?auto_188558 ) ) ( not ( = ?auto_188563 ?auto_188562 ) ) ( not ( = ?auto_188563 ?auto_188561 ) ) ( not ( = ?auto_188563 ?auto_188559 ) ) ( not ( = ?auto_188563 ?auto_188558 ) ) ( not ( = ?auto_188562 ?auto_188561 ) ) ( not ( = ?auto_188562 ?auto_188559 ) ) ( not ( = ?auto_188562 ?auto_188558 ) ) ( not ( = ?auto_188555 ?auto_188560 ) ) ( not ( = ?auto_188555 ?auto_188563 ) ) ( not ( = ?auto_188555 ?auto_188562 ) ) ( not ( = ?auto_188556 ?auto_188560 ) ) ( not ( = ?auto_188556 ?auto_188563 ) ) ( not ( = ?auto_188556 ?auto_188562 ) ) ( not ( = ?auto_188557 ?auto_188560 ) ) ( not ( = ?auto_188557 ?auto_188563 ) ) ( not ( = ?auto_188557 ?auto_188562 ) ) ( CLEAR ?auto_188556 ) ( ON ?auto_188557 ?auto_188558 ) ( CLEAR ?auto_188557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188560 ?auto_188563 ?auto_188562 ?auto_188561 ?auto_188559 ?auto_188558 )
      ( MAKE-5PILE ?auto_188555 ?auto_188556 ?auto_188557 ?auto_188558 ?auto_188559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188564 - BLOCK
      ?auto_188565 - BLOCK
      ?auto_188566 - BLOCK
      ?auto_188567 - BLOCK
      ?auto_188568 - BLOCK
    )
    :vars
    (
      ?auto_188572 - BLOCK
      ?auto_188569 - BLOCK
      ?auto_188571 - BLOCK
      ?auto_188570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188564 ) ( not ( = ?auto_188564 ?auto_188565 ) ) ( not ( = ?auto_188564 ?auto_188566 ) ) ( not ( = ?auto_188564 ?auto_188567 ) ) ( not ( = ?auto_188564 ?auto_188568 ) ) ( not ( = ?auto_188565 ?auto_188566 ) ) ( not ( = ?auto_188565 ?auto_188567 ) ) ( not ( = ?auto_188565 ?auto_188568 ) ) ( not ( = ?auto_188566 ?auto_188567 ) ) ( not ( = ?auto_188566 ?auto_188568 ) ) ( not ( = ?auto_188567 ?auto_188568 ) ) ( ON ?auto_188568 ?auto_188572 ) ( not ( = ?auto_188564 ?auto_188572 ) ) ( not ( = ?auto_188565 ?auto_188572 ) ) ( not ( = ?auto_188566 ?auto_188572 ) ) ( not ( = ?auto_188567 ?auto_188572 ) ) ( not ( = ?auto_188568 ?auto_188572 ) ) ( ON ?auto_188567 ?auto_188568 ) ( ON-TABLE ?auto_188569 ) ( ON ?auto_188571 ?auto_188569 ) ( ON ?auto_188570 ?auto_188571 ) ( ON ?auto_188572 ?auto_188570 ) ( not ( = ?auto_188569 ?auto_188571 ) ) ( not ( = ?auto_188569 ?auto_188570 ) ) ( not ( = ?auto_188569 ?auto_188572 ) ) ( not ( = ?auto_188569 ?auto_188568 ) ) ( not ( = ?auto_188569 ?auto_188567 ) ) ( not ( = ?auto_188571 ?auto_188570 ) ) ( not ( = ?auto_188571 ?auto_188572 ) ) ( not ( = ?auto_188571 ?auto_188568 ) ) ( not ( = ?auto_188571 ?auto_188567 ) ) ( not ( = ?auto_188570 ?auto_188572 ) ) ( not ( = ?auto_188570 ?auto_188568 ) ) ( not ( = ?auto_188570 ?auto_188567 ) ) ( not ( = ?auto_188564 ?auto_188569 ) ) ( not ( = ?auto_188564 ?auto_188571 ) ) ( not ( = ?auto_188564 ?auto_188570 ) ) ( not ( = ?auto_188565 ?auto_188569 ) ) ( not ( = ?auto_188565 ?auto_188571 ) ) ( not ( = ?auto_188565 ?auto_188570 ) ) ( not ( = ?auto_188566 ?auto_188569 ) ) ( not ( = ?auto_188566 ?auto_188571 ) ) ( not ( = ?auto_188566 ?auto_188570 ) ) ( ON ?auto_188566 ?auto_188567 ) ( CLEAR ?auto_188566 ) ( HOLDING ?auto_188565 ) ( CLEAR ?auto_188564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188564 ?auto_188565 )
      ( MAKE-5PILE ?auto_188564 ?auto_188565 ?auto_188566 ?auto_188567 ?auto_188568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188573 - BLOCK
      ?auto_188574 - BLOCK
      ?auto_188575 - BLOCK
      ?auto_188576 - BLOCK
      ?auto_188577 - BLOCK
    )
    :vars
    (
      ?auto_188578 - BLOCK
      ?auto_188580 - BLOCK
      ?auto_188581 - BLOCK
      ?auto_188579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188573 ) ( not ( = ?auto_188573 ?auto_188574 ) ) ( not ( = ?auto_188573 ?auto_188575 ) ) ( not ( = ?auto_188573 ?auto_188576 ) ) ( not ( = ?auto_188573 ?auto_188577 ) ) ( not ( = ?auto_188574 ?auto_188575 ) ) ( not ( = ?auto_188574 ?auto_188576 ) ) ( not ( = ?auto_188574 ?auto_188577 ) ) ( not ( = ?auto_188575 ?auto_188576 ) ) ( not ( = ?auto_188575 ?auto_188577 ) ) ( not ( = ?auto_188576 ?auto_188577 ) ) ( ON ?auto_188577 ?auto_188578 ) ( not ( = ?auto_188573 ?auto_188578 ) ) ( not ( = ?auto_188574 ?auto_188578 ) ) ( not ( = ?auto_188575 ?auto_188578 ) ) ( not ( = ?auto_188576 ?auto_188578 ) ) ( not ( = ?auto_188577 ?auto_188578 ) ) ( ON ?auto_188576 ?auto_188577 ) ( ON-TABLE ?auto_188580 ) ( ON ?auto_188581 ?auto_188580 ) ( ON ?auto_188579 ?auto_188581 ) ( ON ?auto_188578 ?auto_188579 ) ( not ( = ?auto_188580 ?auto_188581 ) ) ( not ( = ?auto_188580 ?auto_188579 ) ) ( not ( = ?auto_188580 ?auto_188578 ) ) ( not ( = ?auto_188580 ?auto_188577 ) ) ( not ( = ?auto_188580 ?auto_188576 ) ) ( not ( = ?auto_188581 ?auto_188579 ) ) ( not ( = ?auto_188581 ?auto_188578 ) ) ( not ( = ?auto_188581 ?auto_188577 ) ) ( not ( = ?auto_188581 ?auto_188576 ) ) ( not ( = ?auto_188579 ?auto_188578 ) ) ( not ( = ?auto_188579 ?auto_188577 ) ) ( not ( = ?auto_188579 ?auto_188576 ) ) ( not ( = ?auto_188573 ?auto_188580 ) ) ( not ( = ?auto_188573 ?auto_188581 ) ) ( not ( = ?auto_188573 ?auto_188579 ) ) ( not ( = ?auto_188574 ?auto_188580 ) ) ( not ( = ?auto_188574 ?auto_188581 ) ) ( not ( = ?auto_188574 ?auto_188579 ) ) ( not ( = ?auto_188575 ?auto_188580 ) ) ( not ( = ?auto_188575 ?auto_188581 ) ) ( not ( = ?auto_188575 ?auto_188579 ) ) ( ON ?auto_188575 ?auto_188576 ) ( CLEAR ?auto_188573 ) ( ON ?auto_188574 ?auto_188575 ) ( CLEAR ?auto_188574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188580 ?auto_188581 ?auto_188579 ?auto_188578 ?auto_188577 ?auto_188576 ?auto_188575 )
      ( MAKE-5PILE ?auto_188573 ?auto_188574 ?auto_188575 ?auto_188576 ?auto_188577 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188582 - BLOCK
      ?auto_188583 - BLOCK
      ?auto_188584 - BLOCK
      ?auto_188585 - BLOCK
      ?auto_188586 - BLOCK
    )
    :vars
    (
      ?auto_188589 - BLOCK
      ?auto_188588 - BLOCK
      ?auto_188587 - BLOCK
      ?auto_188590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188582 ?auto_188583 ) ) ( not ( = ?auto_188582 ?auto_188584 ) ) ( not ( = ?auto_188582 ?auto_188585 ) ) ( not ( = ?auto_188582 ?auto_188586 ) ) ( not ( = ?auto_188583 ?auto_188584 ) ) ( not ( = ?auto_188583 ?auto_188585 ) ) ( not ( = ?auto_188583 ?auto_188586 ) ) ( not ( = ?auto_188584 ?auto_188585 ) ) ( not ( = ?auto_188584 ?auto_188586 ) ) ( not ( = ?auto_188585 ?auto_188586 ) ) ( ON ?auto_188586 ?auto_188589 ) ( not ( = ?auto_188582 ?auto_188589 ) ) ( not ( = ?auto_188583 ?auto_188589 ) ) ( not ( = ?auto_188584 ?auto_188589 ) ) ( not ( = ?auto_188585 ?auto_188589 ) ) ( not ( = ?auto_188586 ?auto_188589 ) ) ( ON ?auto_188585 ?auto_188586 ) ( ON-TABLE ?auto_188588 ) ( ON ?auto_188587 ?auto_188588 ) ( ON ?auto_188590 ?auto_188587 ) ( ON ?auto_188589 ?auto_188590 ) ( not ( = ?auto_188588 ?auto_188587 ) ) ( not ( = ?auto_188588 ?auto_188590 ) ) ( not ( = ?auto_188588 ?auto_188589 ) ) ( not ( = ?auto_188588 ?auto_188586 ) ) ( not ( = ?auto_188588 ?auto_188585 ) ) ( not ( = ?auto_188587 ?auto_188590 ) ) ( not ( = ?auto_188587 ?auto_188589 ) ) ( not ( = ?auto_188587 ?auto_188586 ) ) ( not ( = ?auto_188587 ?auto_188585 ) ) ( not ( = ?auto_188590 ?auto_188589 ) ) ( not ( = ?auto_188590 ?auto_188586 ) ) ( not ( = ?auto_188590 ?auto_188585 ) ) ( not ( = ?auto_188582 ?auto_188588 ) ) ( not ( = ?auto_188582 ?auto_188587 ) ) ( not ( = ?auto_188582 ?auto_188590 ) ) ( not ( = ?auto_188583 ?auto_188588 ) ) ( not ( = ?auto_188583 ?auto_188587 ) ) ( not ( = ?auto_188583 ?auto_188590 ) ) ( not ( = ?auto_188584 ?auto_188588 ) ) ( not ( = ?auto_188584 ?auto_188587 ) ) ( not ( = ?auto_188584 ?auto_188590 ) ) ( ON ?auto_188584 ?auto_188585 ) ( ON ?auto_188583 ?auto_188584 ) ( CLEAR ?auto_188583 ) ( HOLDING ?auto_188582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188582 )
      ( MAKE-5PILE ?auto_188582 ?auto_188583 ?auto_188584 ?auto_188585 ?auto_188586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188591 - BLOCK
      ?auto_188592 - BLOCK
      ?auto_188593 - BLOCK
      ?auto_188594 - BLOCK
      ?auto_188595 - BLOCK
    )
    :vars
    (
      ?auto_188599 - BLOCK
      ?auto_188598 - BLOCK
      ?auto_188597 - BLOCK
      ?auto_188596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188591 ?auto_188592 ) ) ( not ( = ?auto_188591 ?auto_188593 ) ) ( not ( = ?auto_188591 ?auto_188594 ) ) ( not ( = ?auto_188591 ?auto_188595 ) ) ( not ( = ?auto_188592 ?auto_188593 ) ) ( not ( = ?auto_188592 ?auto_188594 ) ) ( not ( = ?auto_188592 ?auto_188595 ) ) ( not ( = ?auto_188593 ?auto_188594 ) ) ( not ( = ?auto_188593 ?auto_188595 ) ) ( not ( = ?auto_188594 ?auto_188595 ) ) ( ON ?auto_188595 ?auto_188599 ) ( not ( = ?auto_188591 ?auto_188599 ) ) ( not ( = ?auto_188592 ?auto_188599 ) ) ( not ( = ?auto_188593 ?auto_188599 ) ) ( not ( = ?auto_188594 ?auto_188599 ) ) ( not ( = ?auto_188595 ?auto_188599 ) ) ( ON ?auto_188594 ?auto_188595 ) ( ON-TABLE ?auto_188598 ) ( ON ?auto_188597 ?auto_188598 ) ( ON ?auto_188596 ?auto_188597 ) ( ON ?auto_188599 ?auto_188596 ) ( not ( = ?auto_188598 ?auto_188597 ) ) ( not ( = ?auto_188598 ?auto_188596 ) ) ( not ( = ?auto_188598 ?auto_188599 ) ) ( not ( = ?auto_188598 ?auto_188595 ) ) ( not ( = ?auto_188598 ?auto_188594 ) ) ( not ( = ?auto_188597 ?auto_188596 ) ) ( not ( = ?auto_188597 ?auto_188599 ) ) ( not ( = ?auto_188597 ?auto_188595 ) ) ( not ( = ?auto_188597 ?auto_188594 ) ) ( not ( = ?auto_188596 ?auto_188599 ) ) ( not ( = ?auto_188596 ?auto_188595 ) ) ( not ( = ?auto_188596 ?auto_188594 ) ) ( not ( = ?auto_188591 ?auto_188598 ) ) ( not ( = ?auto_188591 ?auto_188597 ) ) ( not ( = ?auto_188591 ?auto_188596 ) ) ( not ( = ?auto_188592 ?auto_188598 ) ) ( not ( = ?auto_188592 ?auto_188597 ) ) ( not ( = ?auto_188592 ?auto_188596 ) ) ( not ( = ?auto_188593 ?auto_188598 ) ) ( not ( = ?auto_188593 ?auto_188597 ) ) ( not ( = ?auto_188593 ?auto_188596 ) ) ( ON ?auto_188593 ?auto_188594 ) ( ON ?auto_188592 ?auto_188593 ) ( ON ?auto_188591 ?auto_188592 ) ( CLEAR ?auto_188591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188598 ?auto_188597 ?auto_188596 ?auto_188599 ?auto_188595 ?auto_188594 ?auto_188593 ?auto_188592 )
      ( MAKE-5PILE ?auto_188591 ?auto_188592 ?auto_188593 ?auto_188594 ?auto_188595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188603 - BLOCK
      ?auto_188604 - BLOCK
      ?auto_188605 - BLOCK
    )
    :vars
    (
      ?auto_188606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188606 ?auto_188605 ) ( CLEAR ?auto_188606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188603 ) ( ON ?auto_188604 ?auto_188603 ) ( ON ?auto_188605 ?auto_188604 ) ( not ( = ?auto_188603 ?auto_188604 ) ) ( not ( = ?auto_188603 ?auto_188605 ) ) ( not ( = ?auto_188603 ?auto_188606 ) ) ( not ( = ?auto_188604 ?auto_188605 ) ) ( not ( = ?auto_188604 ?auto_188606 ) ) ( not ( = ?auto_188605 ?auto_188606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188606 ?auto_188605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188607 - BLOCK
      ?auto_188608 - BLOCK
      ?auto_188609 - BLOCK
    )
    :vars
    (
      ?auto_188610 - BLOCK
      ?auto_188611 - BLOCK
      ?auto_188612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188610 ?auto_188609 ) ( CLEAR ?auto_188610 ) ( ON-TABLE ?auto_188607 ) ( ON ?auto_188608 ?auto_188607 ) ( ON ?auto_188609 ?auto_188608 ) ( not ( = ?auto_188607 ?auto_188608 ) ) ( not ( = ?auto_188607 ?auto_188609 ) ) ( not ( = ?auto_188607 ?auto_188610 ) ) ( not ( = ?auto_188608 ?auto_188609 ) ) ( not ( = ?auto_188608 ?auto_188610 ) ) ( not ( = ?auto_188609 ?auto_188610 ) ) ( HOLDING ?auto_188611 ) ( CLEAR ?auto_188612 ) ( not ( = ?auto_188607 ?auto_188611 ) ) ( not ( = ?auto_188607 ?auto_188612 ) ) ( not ( = ?auto_188608 ?auto_188611 ) ) ( not ( = ?auto_188608 ?auto_188612 ) ) ( not ( = ?auto_188609 ?auto_188611 ) ) ( not ( = ?auto_188609 ?auto_188612 ) ) ( not ( = ?auto_188610 ?auto_188611 ) ) ( not ( = ?auto_188610 ?auto_188612 ) ) ( not ( = ?auto_188611 ?auto_188612 ) ) )
    :subtasks
    ( ( !STACK ?auto_188611 ?auto_188612 )
      ( MAKE-3PILE ?auto_188607 ?auto_188608 ?auto_188609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188613 - BLOCK
      ?auto_188614 - BLOCK
      ?auto_188615 - BLOCK
    )
    :vars
    (
      ?auto_188618 - BLOCK
      ?auto_188617 - BLOCK
      ?auto_188616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188618 ?auto_188615 ) ( ON-TABLE ?auto_188613 ) ( ON ?auto_188614 ?auto_188613 ) ( ON ?auto_188615 ?auto_188614 ) ( not ( = ?auto_188613 ?auto_188614 ) ) ( not ( = ?auto_188613 ?auto_188615 ) ) ( not ( = ?auto_188613 ?auto_188618 ) ) ( not ( = ?auto_188614 ?auto_188615 ) ) ( not ( = ?auto_188614 ?auto_188618 ) ) ( not ( = ?auto_188615 ?auto_188618 ) ) ( CLEAR ?auto_188617 ) ( not ( = ?auto_188613 ?auto_188616 ) ) ( not ( = ?auto_188613 ?auto_188617 ) ) ( not ( = ?auto_188614 ?auto_188616 ) ) ( not ( = ?auto_188614 ?auto_188617 ) ) ( not ( = ?auto_188615 ?auto_188616 ) ) ( not ( = ?auto_188615 ?auto_188617 ) ) ( not ( = ?auto_188618 ?auto_188616 ) ) ( not ( = ?auto_188618 ?auto_188617 ) ) ( not ( = ?auto_188616 ?auto_188617 ) ) ( ON ?auto_188616 ?auto_188618 ) ( CLEAR ?auto_188616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188613 ?auto_188614 ?auto_188615 ?auto_188618 )
      ( MAKE-3PILE ?auto_188613 ?auto_188614 ?auto_188615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188619 - BLOCK
      ?auto_188620 - BLOCK
      ?auto_188621 - BLOCK
    )
    :vars
    (
      ?auto_188622 - BLOCK
      ?auto_188623 - BLOCK
      ?auto_188624 - BLOCK
      ?auto_188626 - BLOCK
      ?auto_188625 - BLOCK
      ?auto_188627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188622 ?auto_188621 ) ( ON-TABLE ?auto_188619 ) ( ON ?auto_188620 ?auto_188619 ) ( ON ?auto_188621 ?auto_188620 ) ( not ( = ?auto_188619 ?auto_188620 ) ) ( not ( = ?auto_188619 ?auto_188621 ) ) ( not ( = ?auto_188619 ?auto_188622 ) ) ( not ( = ?auto_188620 ?auto_188621 ) ) ( not ( = ?auto_188620 ?auto_188622 ) ) ( not ( = ?auto_188621 ?auto_188622 ) ) ( not ( = ?auto_188619 ?auto_188623 ) ) ( not ( = ?auto_188619 ?auto_188624 ) ) ( not ( = ?auto_188620 ?auto_188623 ) ) ( not ( = ?auto_188620 ?auto_188624 ) ) ( not ( = ?auto_188621 ?auto_188623 ) ) ( not ( = ?auto_188621 ?auto_188624 ) ) ( not ( = ?auto_188622 ?auto_188623 ) ) ( not ( = ?auto_188622 ?auto_188624 ) ) ( not ( = ?auto_188623 ?auto_188624 ) ) ( ON ?auto_188623 ?auto_188622 ) ( CLEAR ?auto_188623 ) ( HOLDING ?auto_188624 ) ( CLEAR ?auto_188626 ) ( ON-TABLE ?auto_188625 ) ( ON ?auto_188627 ?auto_188625 ) ( ON ?auto_188626 ?auto_188627 ) ( not ( = ?auto_188625 ?auto_188627 ) ) ( not ( = ?auto_188625 ?auto_188626 ) ) ( not ( = ?auto_188625 ?auto_188624 ) ) ( not ( = ?auto_188627 ?auto_188626 ) ) ( not ( = ?auto_188627 ?auto_188624 ) ) ( not ( = ?auto_188626 ?auto_188624 ) ) ( not ( = ?auto_188619 ?auto_188626 ) ) ( not ( = ?auto_188619 ?auto_188625 ) ) ( not ( = ?auto_188619 ?auto_188627 ) ) ( not ( = ?auto_188620 ?auto_188626 ) ) ( not ( = ?auto_188620 ?auto_188625 ) ) ( not ( = ?auto_188620 ?auto_188627 ) ) ( not ( = ?auto_188621 ?auto_188626 ) ) ( not ( = ?auto_188621 ?auto_188625 ) ) ( not ( = ?auto_188621 ?auto_188627 ) ) ( not ( = ?auto_188622 ?auto_188626 ) ) ( not ( = ?auto_188622 ?auto_188625 ) ) ( not ( = ?auto_188622 ?auto_188627 ) ) ( not ( = ?auto_188623 ?auto_188626 ) ) ( not ( = ?auto_188623 ?auto_188625 ) ) ( not ( = ?auto_188623 ?auto_188627 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188625 ?auto_188627 ?auto_188626 ?auto_188624 )
      ( MAKE-3PILE ?auto_188619 ?auto_188620 ?auto_188621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188628 - BLOCK
      ?auto_188629 - BLOCK
      ?auto_188630 - BLOCK
    )
    :vars
    (
      ?auto_188632 - BLOCK
      ?auto_188636 - BLOCK
      ?auto_188633 - BLOCK
      ?auto_188635 - BLOCK
      ?auto_188631 - BLOCK
      ?auto_188634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188632 ?auto_188630 ) ( ON-TABLE ?auto_188628 ) ( ON ?auto_188629 ?auto_188628 ) ( ON ?auto_188630 ?auto_188629 ) ( not ( = ?auto_188628 ?auto_188629 ) ) ( not ( = ?auto_188628 ?auto_188630 ) ) ( not ( = ?auto_188628 ?auto_188632 ) ) ( not ( = ?auto_188629 ?auto_188630 ) ) ( not ( = ?auto_188629 ?auto_188632 ) ) ( not ( = ?auto_188630 ?auto_188632 ) ) ( not ( = ?auto_188628 ?auto_188636 ) ) ( not ( = ?auto_188628 ?auto_188633 ) ) ( not ( = ?auto_188629 ?auto_188636 ) ) ( not ( = ?auto_188629 ?auto_188633 ) ) ( not ( = ?auto_188630 ?auto_188636 ) ) ( not ( = ?auto_188630 ?auto_188633 ) ) ( not ( = ?auto_188632 ?auto_188636 ) ) ( not ( = ?auto_188632 ?auto_188633 ) ) ( not ( = ?auto_188636 ?auto_188633 ) ) ( ON ?auto_188636 ?auto_188632 ) ( CLEAR ?auto_188635 ) ( ON-TABLE ?auto_188631 ) ( ON ?auto_188634 ?auto_188631 ) ( ON ?auto_188635 ?auto_188634 ) ( not ( = ?auto_188631 ?auto_188634 ) ) ( not ( = ?auto_188631 ?auto_188635 ) ) ( not ( = ?auto_188631 ?auto_188633 ) ) ( not ( = ?auto_188634 ?auto_188635 ) ) ( not ( = ?auto_188634 ?auto_188633 ) ) ( not ( = ?auto_188635 ?auto_188633 ) ) ( not ( = ?auto_188628 ?auto_188635 ) ) ( not ( = ?auto_188628 ?auto_188631 ) ) ( not ( = ?auto_188628 ?auto_188634 ) ) ( not ( = ?auto_188629 ?auto_188635 ) ) ( not ( = ?auto_188629 ?auto_188631 ) ) ( not ( = ?auto_188629 ?auto_188634 ) ) ( not ( = ?auto_188630 ?auto_188635 ) ) ( not ( = ?auto_188630 ?auto_188631 ) ) ( not ( = ?auto_188630 ?auto_188634 ) ) ( not ( = ?auto_188632 ?auto_188635 ) ) ( not ( = ?auto_188632 ?auto_188631 ) ) ( not ( = ?auto_188632 ?auto_188634 ) ) ( not ( = ?auto_188636 ?auto_188635 ) ) ( not ( = ?auto_188636 ?auto_188631 ) ) ( not ( = ?auto_188636 ?auto_188634 ) ) ( ON ?auto_188633 ?auto_188636 ) ( CLEAR ?auto_188633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188628 ?auto_188629 ?auto_188630 ?auto_188632 ?auto_188636 )
      ( MAKE-3PILE ?auto_188628 ?auto_188629 ?auto_188630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188637 - BLOCK
      ?auto_188638 - BLOCK
      ?auto_188639 - BLOCK
    )
    :vars
    (
      ?auto_188641 - BLOCK
      ?auto_188643 - BLOCK
      ?auto_188640 - BLOCK
      ?auto_188644 - BLOCK
      ?auto_188645 - BLOCK
      ?auto_188642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188641 ?auto_188639 ) ( ON-TABLE ?auto_188637 ) ( ON ?auto_188638 ?auto_188637 ) ( ON ?auto_188639 ?auto_188638 ) ( not ( = ?auto_188637 ?auto_188638 ) ) ( not ( = ?auto_188637 ?auto_188639 ) ) ( not ( = ?auto_188637 ?auto_188641 ) ) ( not ( = ?auto_188638 ?auto_188639 ) ) ( not ( = ?auto_188638 ?auto_188641 ) ) ( not ( = ?auto_188639 ?auto_188641 ) ) ( not ( = ?auto_188637 ?auto_188643 ) ) ( not ( = ?auto_188637 ?auto_188640 ) ) ( not ( = ?auto_188638 ?auto_188643 ) ) ( not ( = ?auto_188638 ?auto_188640 ) ) ( not ( = ?auto_188639 ?auto_188643 ) ) ( not ( = ?auto_188639 ?auto_188640 ) ) ( not ( = ?auto_188641 ?auto_188643 ) ) ( not ( = ?auto_188641 ?auto_188640 ) ) ( not ( = ?auto_188643 ?auto_188640 ) ) ( ON ?auto_188643 ?auto_188641 ) ( ON-TABLE ?auto_188644 ) ( ON ?auto_188645 ?auto_188644 ) ( not ( = ?auto_188644 ?auto_188645 ) ) ( not ( = ?auto_188644 ?auto_188642 ) ) ( not ( = ?auto_188644 ?auto_188640 ) ) ( not ( = ?auto_188645 ?auto_188642 ) ) ( not ( = ?auto_188645 ?auto_188640 ) ) ( not ( = ?auto_188642 ?auto_188640 ) ) ( not ( = ?auto_188637 ?auto_188642 ) ) ( not ( = ?auto_188637 ?auto_188644 ) ) ( not ( = ?auto_188637 ?auto_188645 ) ) ( not ( = ?auto_188638 ?auto_188642 ) ) ( not ( = ?auto_188638 ?auto_188644 ) ) ( not ( = ?auto_188638 ?auto_188645 ) ) ( not ( = ?auto_188639 ?auto_188642 ) ) ( not ( = ?auto_188639 ?auto_188644 ) ) ( not ( = ?auto_188639 ?auto_188645 ) ) ( not ( = ?auto_188641 ?auto_188642 ) ) ( not ( = ?auto_188641 ?auto_188644 ) ) ( not ( = ?auto_188641 ?auto_188645 ) ) ( not ( = ?auto_188643 ?auto_188642 ) ) ( not ( = ?auto_188643 ?auto_188644 ) ) ( not ( = ?auto_188643 ?auto_188645 ) ) ( ON ?auto_188640 ?auto_188643 ) ( CLEAR ?auto_188640 ) ( HOLDING ?auto_188642 ) ( CLEAR ?auto_188645 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188644 ?auto_188645 ?auto_188642 )
      ( MAKE-3PILE ?auto_188637 ?auto_188638 ?auto_188639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188646 - BLOCK
      ?auto_188647 - BLOCK
      ?auto_188648 - BLOCK
    )
    :vars
    (
      ?auto_188649 - BLOCK
      ?auto_188650 - BLOCK
      ?auto_188653 - BLOCK
      ?auto_188651 - BLOCK
      ?auto_188654 - BLOCK
      ?auto_188652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188649 ?auto_188648 ) ( ON-TABLE ?auto_188646 ) ( ON ?auto_188647 ?auto_188646 ) ( ON ?auto_188648 ?auto_188647 ) ( not ( = ?auto_188646 ?auto_188647 ) ) ( not ( = ?auto_188646 ?auto_188648 ) ) ( not ( = ?auto_188646 ?auto_188649 ) ) ( not ( = ?auto_188647 ?auto_188648 ) ) ( not ( = ?auto_188647 ?auto_188649 ) ) ( not ( = ?auto_188648 ?auto_188649 ) ) ( not ( = ?auto_188646 ?auto_188650 ) ) ( not ( = ?auto_188646 ?auto_188653 ) ) ( not ( = ?auto_188647 ?auto_188650 ) ) ( not ( = ?auto_188647 ?auto_188653 ) ) ( not ( = ?auto_188648 ?auto_188650 ) ) ( not ( = ?auto_188648 ?auto_188653 ) ) ( not ( = ?auto_188649 ?auto_188650 ) ) ( not ( = ?auto_188649 ?auto_188653 ) ) ( not ( = ?auto_188650 ?auto_188653 ) ) ( ON ?auto_188650 ?auto_188649 ) ( ON-TABLE ?auto_188651 ) ( ON ?auto_188654 ?auto_188651 ) ( not ( = ?auto_188651 ?auto_188654 ) ) ( not ( = ?auto_188651 ?auto_188652 ) ) ( not ( = ?auto_188651 ?auto_188653 ) ) ( not ( = ?auto_188654 ?auto_188652 ) ) ( not ( = ?auto_188654 ?auto_188653 ) ) ( not ( = ?auto_188652 ?auto_188653 ) ) ( not ( = ?auto_188646 ?auto_188652 ) ) ( not ( = ?auto_188646 ?auto_188651 ) ) ( not ( = ?auto_188646 ?auto_188654 ) ) ( not ( = ?auto_188647 ?auto_188652 ) ) ( not ( = ?auto_188647 ?auto_188651 ) ) ( not ( = ?auto_188647 ?auto_188654 ) ) ( not ( = ?auto_188648 ?auto_188652 ) ) ( not ( = ?auto_188648 ?auto_188651 ) ) ( not ( = ?auto_188648 ?auto_188654 ) ) ( not ( = ?auto_188649 ?auto_188652 ) ) ( not ( = ?auto_188649 ?auto_188651 ) ) ( not ( = ?auto_188649 ?auto_188654 ) ) ( not ( = ?auto_188650 ?auto_188652 ) ) ( not ( = ?auto_188650 ?auto_188651 ) ) ( not ( = ?auto_188650 ?auto_188654 ) ) ( ON ?auto_188653 ?auto_188650 ) ( CLEAR ?auto_188654 ) ( ON ?auto_188652 ?auto_188653 ) ( CLEAR ?auto_188652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188646 ?auto_188647 ?auto_188648 ?auto_188649 ?auto_188650 ?auto_188653 )
      ( MAKE-3PILE ?auto_188646 ?auto_188647 ?auto_188648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188655 - BLOCK
      ?auto_188656 - BLOCK
      ?auto_188657 - BLOCK
    )
    :vars
    (
      ?auto_188658 - BLOCK
      ?auto_188660 - BLOCK
      ?auto_188662 - BLOCK
      ?auto_188663 - BLOCK
      ?auto_188661 - BLOCK
      ?auto_188659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188658 ?auto_188657 ) ( ON-TABLE ?auto_188655 ) ( ON ?auto_188656 ?auto_188655 ) ( ON ?auto_188657 ?auto_188656 ) ( not ( = ?auto_188655 ?auto_188656 ) ) ( not ( = ?auto_188655 ?auto_188657 ) ) ( not ( = ?auto_188655 ?auto_188658 ) ) ( not ( = ?auto_188656 ?auto_188657 ) ) ( not ( = ?auto_188656 ?auto_188658 ) ) ( not ( = ?auto_188657 ?auto_188658 ) ) ( not ( = ?auto_188655 ?auto_188660 ) ) ( not ( = ?auto_188655 ?auto_188662 ) ) ( not ( = ?auto_188656 ?auto_188660 ) ) ( not ( = ?auto_188656 ?auto_188662 ) ) ( not ( = ?auto_188657 ?auto_188660 ) ) ( not ( = ?auto_188657 ?auto_188662 ) ) ( not ( = ?auto_188658 ?auto_188660 ) ) ( not ( = ?auto_188658 ?auto_188662 ) ) ( not ( = ?auto_188660 ?auto_188662 ) ) ( ON ?auto_188660 ?auto_188658 ) ( ON-TABLE ?auto_188663 ) ( not ( = ?auto_188663 ?auto_188661 ) ) ( not ( = ?auto_188663 ?auto_188659 ) ) ( not ( = ?auto_188663 ?auto_188662 ) ) ( not ( = ?auto_188661 ?auto_188659 ) ) ( not ( = ?auto_188661 ?auto_188662 ) ) ( not ( = ?auto_188659 ?auto_188662 ) ) ( not ( = ?auto_188655 ?auto_188659 ) ) ( not ( = ?auto_188655 ?auto_188663 ) ) ( not ( = ?auto_188655 ?auto_188661 ) ) ( not ( = ?auto_188656 ?auto_188659 ) ) ( not ( = ?auto_188656 ?auto_188663 ) ) ( not ( = ?auto_188656 ?auto_188661 ) ) ( not ( = ?auto_188657 ?auto_188659 ) ) ( not ( = ?auto_188657 ?auto_188663 ) ) ( not ( = ?auto_188657 ?auto_188661 ) ) ( not ( = ?auto_188658 ?auto_188659 ) ) ( not ( = ?auto_188658 ?auto_188663 ) ) ( not ( = ?auto_188658 ?auto_188661 ) ) ( not ( = ?auto_188660 ?auto_188659 ) ) ( not ( = ?auto_188660 ?auto_188663 ) ) ( not ( = ?auto_188660 ?auto_188661 ) ) ( ON ?auto_188662 ?auto_188660 ) ( ON ?auto_188659 ?auto_188662 ) ( CLEAR ?auto_188659 ) ( HOLDING ?auto_188661 ) ( CLEAR ?auto_188663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188663 ?auto_188661 )
      ( MAKE-3PILE ?auto_188655 ?auto_188656 ?auto_188657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190522 - BLOCK
      ?auto_190523 - BLOCK
      ?auto_190524 - BLOCK
    )
    :vars
    (
      ?auto_190527 - BLOCK
      ?auto_190525 - BLOCK
      ?auto_190529 - BLOCK
      ?auto_190528 - BLOCK
      ?auto_190526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190527 ?auto_190524 ) ( ON-TABLE ?auto_190522 ) ( ON ?auto_190523 ?auto_190522 ) ( ON ?auto_190524 ?auto_190523 ) ( not ( = ?auto_190522 ?auto_190523 ) ) ( not ( = ?auto_190522 ?auto_190524 ) ) ( not ( = ?auto_190522 ?auto_190527 ) ) ( not ( = ?auto_190523 ?auto_190524 ) ) ( not ( = ?auto_190523 ?auto_190527 ) ) ( not ( = ?auto_190524 ?auto_190527 ) ) ( not ( = ?auto_190522 ?auto_190525 ) ) ( not ( = ?auto_190522 ?auto_190529 ) ) ( not ( = ?auto_190523 ?auto_190525 ) ) ( not ( = ?auto_190523 ?auto_190529 ) ) ( not ( = ?auto_190524 ?auto_190525 ) ) ( not ( = ?auto_190524 ?auto_190529 ) ) ( not ( = ?auto_190527 ?auto_190525 ) ) ( not ( = ?auto_190527 ?auto_190529 ) ) ( not ( = ?auto_190525 ?auto_190529 ) ) ( ON ?auto_190525 ?auto_190527 ) ( not ( = ?auto_190528 ?auto_190526 ) ) ( not ( = ?auto_190528 ?auto_190529 ) ) ( not ( = ?auto_190526 ?auto_190529 ) ) ( not ( = ?auto_190522 ?auto_190526 ) ) ( not ( = ?auto_190522 ?auto_190528 ) ) ( not ( = ?auto_190523 ?auto_190526 ) ) ( not ( = ?auto_190523 ?auto_190528 ) ) ( not ( = ?auto_190524 ?auto_190526 ) ) ( not ( = ?auto_190524 ?auto_190528 ) ) ( not ( = ?auto_190527 ?auto_190526 ) ) ( not ( = ?auto_190527 ?auto_190528 ) ) ( not ( = ?auto_190525 ?auto_190526 ) ) ( not ( = ?auto_190525 ?auto_190528 ) ) ( ON ?auto_190529 ?auto_190525 ) ( ON ?auto_190526 ?auto_190529 ) ( ON ?auto_190528 ?auto_190526 ) ( CLEAR ?auto_190528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190522 ?auto_190523 ?auto_190524 ?auto_190527 ?auto_190525 ?auto_190529 ?auto_190526 )
      ( MAKE-3PILE ?auto_190522 ?auto_190523 ?auto_190524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188673 - BLOCK
      ?auto_188674 - BLOCK
      ?auto_188675 - BLOCK
    )
    :vars
    (
      ?auto_188677 - BLOCK
      ?auto_188680 - BLOCK
      ?auto_188681 - BLOCK
      ?auto_188679 - BLOCK
      ?auto_188678 - BLOCK
      ?auto_188676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188677 ?auto_188675 ) ( ON-TABLE ?auto_188673 ) ( ON ?auto_188674 ?auto_188673 ) ( ON ?auto_188675 ?auto_188674 ) ( not ( = ?auto_188673 ?auto_188674 ) ) ( not ( = ?auto_188673 ?auto_188675 ) ) ( not ( = ?auto_188673 ?auto_188677 ) ) ( not ( = ?auto_188674 ?auto_188675 ) ) ( not ( = ?auto_188674 ?auto_188677 ) ) ( not ( = ?auto_188675 ?auto_188677 ) ) ( not ( = ?auto_188673 ?auto_188680 ) ) ( not ( = ?auto_188673 ?auto_188681 ) ) ( not ( = ?auto_188674 ?auto_188680 ) ) ( not ( = ?auto_188674 ?auto_188681 ) ) ( not ( = ?auto_188675 ?auto_188680 ) ) ( not ( = ?auto_188675 ?auto_188681 ) ) ( not ( = ?auto_188677 ?auto_188680 ) ) ( not ( = ?auto_188677 ?auto_188681 ) ) ( not ( = ?auto_188680 ?auto_188681 ) ) ( ON ?auto_188680 ?auto_188677 ) ( not ( = ?auto_188679 ?auto_188678 ) ) ( not ( = ?auto_188679 ?auto_188676 ) ) ( not ( = ?auto_188679 ?auto_188681 ) ) ( not ( = ?auto_188678 ?auto_188676 ) ) ( not ( = ?auto_188678 ?auto_188681 ) ) ( not ( = ?auto_188676 ?auto_188681 ) ) ( not ( = ?auto_188673 ?auto_188676 ) ) ( not ( = ?auto_188673 ?auto_188679 ) ) ( not ( = ?auto_188673 ?auto_188678 ) ) ( not ( = ?auto_188674 ?auto_188676 ) ) ( not ( = ?auto_188674 ?auto_188679 ) ) ( not ( = ?auto_188674 ?auto_188678 ) ) ( not ( = ?auto_188675 ?auto_188676 ) ) ( not ( = ?auto_188675 ?auto_188679 ) ) ( not ( = ?auto_188675 ?auto_188678 ) ) ( not ( = ?auto_188677 ?auto_188676 ) ) ( not ( = ?auto_188677 ?auto_188679 ) ) ( not ( = ?auto_188677 ?auto_188678 ) ) ( not ( = ?auto_188680 ?auto_188676 ) ) ( not ( = ?auto_188680 ?auto_188679 ) ) ( not ( = ?auto_188680 ?auto_188678 ) ) ( ON ?auto_188681 ?auto_188680 ) ( ON ?auto_188676 ?auto_188681 ) ( ON ?auto_188678 ?auto_188676 ) ( CLEAR ?auto_188678 ) ( HOLDING ?auto_188679 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188679 )
      ( MAKE-3PILE ?auto_188673 ?auto_188674 ?auto_188675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188682 - BLOCK
      ?auto_188683 - BLOCK
      ?auto_188684 - BLOCK
    )
    :vars
    (
      ?auto_188690 - BLOCK
      ?auto_188686 - BLOCK
      ?auto_188689 - BLOCK
      ?auto_188687 - BLOCK
      ?auto_188688 - BLOCK
      ?auto_188685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188690 ?auto_188684 ) ( ON-TABLE ?auto_188682 ) ( ON ?auto_188683 ?auto_188682 ) ( ON ?auto_188684 ?auto_188683 ) ( not ( = ?auto_188682 ?auto_188683 ) ) ( not ( = ?auto_188682 ?auto_188684 ) ) ( not ( = ?auto_188682 ?auto_188690 ) ) ( not ( = ?auto_188683 ?auto_188684 ) ) ( not ( = ?auto_188683 ?auto_188690 ) ) ( not ( = ?auto_188684 ?auto_188690 ) ) ( not ( = ?auto_188682 ?auto_188686 ) ) ( not ( = ?auto_188682 ?auto_188689 ) ) ( not ( = ?auto_188683 ?auto_188686 ) ) ( not ( = ?auto_188683 ?auto_188689 ) ) ( not ( = ?auto_188684 ?auto_188686 ) ) ( not ( = ?auto_188684 ?auto_188689 ) ) ( not ( = ?auto_188690 ?auto_188686 ) ) ( not ( = ?auto_188690 ?auto_188689 ) ) ( not ( = ?auto_188686 ?auto_188689 ) ) ( ON ?auto_188686 ?auto_188690 ) ( not ( = ?auto_188687 ?auto_188688 ) ) ( not ( = ?auto_188687 ?auto_188685 ) ) ( not ( = ?auto_188687 ?auto_188689 ) ) ( not ( = ?auto_188688 ?auto_188685 ) ) ( not ( = ?auto_188688 ?auto_188689 ) ) ( not ( = ?auto_188685 ?auto_188689 ) ) ( not ( = ?auto_188682 ?auto_188685 ) ) ( not ( = ?auto_188682 ?auto_188687 ) ) ( not ( = ?auto_188682 ?auto_188688 ) ) ( not ( = ?auto_188683 ?auto_188685 ) ) ( not ( = ?auto_188683 ?auto_188687 ) ) ( not ( = ?auto_188683 ?auto_188688 ) ) ( not ( = ?auto_188684 ?auto_188685 ) ) ( not ( = ?auto_188684 ?auto_188687 ) ) ( not ( = ?auto_188684 ?auto_188688 ) ) ( not ( = ?auto_188690 ?auto_188685 ) ) ( not ( = ?auto_188690 ?auto_188687 ) ) ( not ( = ?auto_188690 ?auto_188688 ) ) ( not ( = ?auto_188686 ?auto_188685 ) ) ( not ( = ?auto_188686 ?auto_188687 ) ) ( not ( = ?auto_188686 ?auto_188688 ) ) ( ON ?auto_188689 ?auto_188686 ) ( ON ?auto_188685 ?auto_188689 ) ( ON ?auto_188688 ?auto_188685 ) ( ON ?auto_188687 ?auto_188688 ) ( CLEAR ?auto_188687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188682 ?auto_188683 ?auto_188684 ?auto_188690 ?auto_188686 ?auto_188689 ?auto_188685 ?auto_188688 )
      ( MAKE-3PILE ?auto_188682 ?auto_188683 ?auto_188684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188697 - BLOCK
      ?auto_188698 - BLOCK
      ?auto_188699 - BLOCK
      ?auto_188700 - BLOCK
      ?auto_188701 - BLOCK
      ?auto_188702 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188702 ) ( CLEAR ?auto_188701 ) ( ON-TABLE ?auto_188697 ) ( ON ?auto_188698 ?auto_188697 ) ( ON ?auto_188699 ?auto_188698 ) ( ON ?auto_188700 ?auto_188699 ) ( ON ?auto_188701 ?auto_188700 ) ( not ( = ?auto_188697 ?auto_188698 ) ) ( not ( = ?auto_188697 ?auto_188699 ) ) ( not ( = ?auto_188697 ?auto_188700 ) ) ( not ( = ?auto_188697 ?auto_188701 ) ) ( not ( = ?auto_188697 ?auto_188702 ) ) ( not ( = ?auto_188698 ?auto_188699 ) ) ( not ( = ?auto_188698 ?auto_188700 ) ) ( not ( = ?auto_188698 ?auto_188701 ) ) ( not ( = ?auto_188698 ?auto_188702 ) ) ( not ( = ?auto_188699 ?auto_188700 ) ) ( not ( = ?auto_188699 ?auto_188701 ) ) ( not ( = ?auto_188699 ?auto_188702 ) ) ( not ( = ?auto_188700 ?auto_188701 ) ) ( not ( = ?auto_188700 ?auto_188702 ) ) ( not ( = ?auto_188701 ?auto_188702 ) ) )
    :subtasks
    ( ( !STACK ?auto_188702 ?auto_188701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188703 - BLOCK
      ?auto_188704 - BLOCK
      ?auto_188705 - BLOCK
      ?auto_188706 - BLOCK
      ?auto_188707 - BLOCK
      ?auto_188708 - BLOCK
    )
    :vars
    (
      ?auto_188709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188707 ) ( ON-TABLE ?auto_188703 ) ( ON ?auto_188704 ?auto_188703 ) ( ON ?auto_188705 ?auto_188704 ) ( ON ?auto_188706 ?auto_188705 ) ( ON ?auto_188707 ?auto_188706 ) ( not ( = ?auto_188703 ?auto_188704 ) ) ( not ( = ?auto_188703 ?auto_188705 ) ) ( not ( = ?auto_188703 ?auto_188706 ) ) ( not ( = ?auto_188703 ?auto_188707 ) ) ( not ( = ?auto_188703 ?auto_188708 ) ) ( not ( = ?auto_188704 ?auto_188705 ) ) ( not ( = ?auto_188704 ?auto_188706 ) ) ( not ( = ?auto_188704 ?auto_188707 ) ) ( not ( = ?auto_188704 ?auto_188708 ) ) ( not ( = ?auto_188705 ?auto_188706 ) ) ( not ( = ?auto_188705 ?auto_188707 ) ) ( not ( = ?auto_188705 ?auto_188708 ) ) ( not ( = ?auto_188706 ?auto_188707 ) ) ( not ( = ?auto_188706 ?auto_188708 ) ) ( not ( = ?auto_188707 ?auto_188708 ) ) ( ON ?auto_188708 ?auto_188709 ) ( CLEAR ?auto_188708 ) ( HAND-EMPTY ) ( not ( = ?auto_188703 ?auto_188709 ) ) ( not ( = ?auto_188704 ?auto_188709 ) ) ( not ( = ?auto_188705 ?auto_188709 ) ) ( not ( = ?auto_188706 ?auto_188709 ) ) ( not ( = ?auto_188707 ?auto_188709 ) ) ( not ( = ?auto_188708 ?auto_188709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188708 ?auto_188709 )
      ( MAKE-6PILE ?auto_188703 ?auto_188704 ?auto_188705 ?auto_188706 ?auto_188707 ?auto_188708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188710 - BLOCK
      ?auto_188711 - BLOCK
      ?auto_188712 - BLOCK
      ?auto_188713 - BLOCK
      ?auto_188714 - BLOCK
      ?auto_188715 - BLOCK
    )
    :vars
    (
      ?auto_188716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188710 ) ( ON ?auto_188711 ?auto_188710 ) ( ON ?auto_188712 ?auto_188711 ) ( ON ?auto_188713 ?auto_188712 ) ( not ( = ?auto_188710 ?auto_188711 ) ) ( not ( = ?auto_188710 ?auto_188712 ) ) ( not ( = ?auto_188710 ?auto_188713 ) ) ( not ( = ?auto_188710 ?auto_188714 ) ) ( not ( = ?auto_188710 ?auto_188715 ) ) ( not ( = ?auto_188711 ?auto_188712 ) ) ( not ( = ?auto_188711 ?auto_188713 ) ) ( not ( = ?auto_188711 ?auto_188714 ) ) ( not ( = ?auto_188711 ?auto_188715 ) ) ( not ( = ?auto_188712 ?auto_188713 ) ) ( not ( = ?auto_188712 ?auto_188714 ) ) ( not ( = ?auto_188712 ?auto_188715 ) ) ( not ( = ?auto_188713 ?auto_188714 ) ) ( not ( = ?auto_188713 ?auto_188715 ) ) ( not ( = ?auto_188714 ?auto_188715 ) ) ( ON ?auto_188715 ?auto_188716 ) ( CLEAR ?auto_188715 ) ( not ( = ?auto_188710 ?auto_188716 ) ) ( not ( = ?auto_188711 ?auto_188716 ) ) ( not ( = ?auto_188712 ?auto_188716 ) ) ( not ( = ?auto_188713 ?auto_188716 ) ) ( not ( = ?auto_188714 ?auto_188716 ) ) ( not ( = ?auto_188715 ?auto_188716 ) ) ( HOLDING ?auto_188714 ) ( CLEAR ?auto_188713 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188710 ?auto_188711 ?auto_188712 ?auto_188713 ?auto_188714 )
      ( MAKE-6PILE ?auto_188710 ?auto_188711 ?auto_188712 ?auto_188713 ?auto_188714 ?auto_188715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188717 - BLOCK
      ?auto_188718 - BLOCK
      ?auto_188719 - BLOCK
      ?auto_188720 - BLOCK
      ?auto_188721 - BLOCK
      ?auto_188722 - BLOCK
    )
    :vars
    (
      ?auto_188723 - BLOCK
      ?auto_188725 - BLOCK
      ?auto_188724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188717 ) ( ON ?auto_188718 ?auto_188717 ) ( ON ?auto_188719 ?auto_188718 ) ( ON ?auto_188720 ?auto_188719 ) ( not ( = ?auto_188717 ?auto_188718 ) ) ( not ( = ?auto_188717 ?auto_188719 ) ) ( not ( = ?auto_188717 ?auto_188720 ) ) ( not ( = ?auto_188717 ?auto_188721 ) ) ( not ( = ?auto_188717 ?auto_188722 ) ) ( not ( = ?auto_188718 ?auto_188719 ) ) ( not ( = ?auto_188718 ?auto_188720 ) ) ( not ( = ?auto_188718 ?auto_188721 ) ) ( not ( = ?auto_188718 ?auto_188722 ) ) ( not ( = ?auto_188719 ?auto_188720 ) ) ( not ( = ?auto_188719 ?auto_188721 ) ) ( not ( = ?auto_188719 ?auto_188722 ) ) ( not ( = ?auto_188720 ?auto_188721 ) ) ( not ( = ?auto_188720 ?auto_188722 ) ) ( not ( = ?auto_188721 ?auto_188722 ) ) ( ON ?auto_188722 ?auto_188723 ) ( not ( = ?auto_188717 ?auto_188723 ) ) ( not ( = ?auto_188718 ?auto_188723 ) ) ( not ( = ?auto_188719 ?auto_188723 ) ) ( not ( = ?auto_188720 ?auto_188723 ) ) ( not ( = ?auto_188721 ?auto_188723 ) ) ( not ( = ?auto_188722 ?auto_188723 ) ) ( CLEAR ?auto_188720 ) ( ON ?auto_188721 ?auto_188722 ) ( CLEAR ?auto_188721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188725 ) ( ON ?auto_188724 ?auto_188725 ) ( ON ?auto_188723 ?auto_188724 ) ( not ( = ?auto_188725 ?auto_188724 ) ) ( not ( = ?auto_188725 ?auto_188723 ) ) ( not ( = ?auto_188725 ?auto_188722 ) ) ( not ( = ?auto_188725 ?auto_188721 ) ) ( not ( = ?auto_188724 ?auto_188723 ) ) ( not ( = ?auto_188724 ?auto_188722 ) ) ( not ( = ?auto_188724 ?auto_188721 ) ) ( not ( = ?auto_188717 ?auto_188725 ) ) ( not ( = ?auto_188717 ?auto_188724 ) ) ( not ( = ?auto_188718 ?auto_188725 ) ) ( not ( = ?auto_188718 ?auto_188724 ) ) ( not ( = ?auto_188719 ?auto_188725 ) ) ( not ( = ?auto_188719 ?auto_188724 ) ) ( not ( = ?auto_188720 ?auto_188725 ) ) ( not ( = ?auto_188720 ?auto_188724 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188725 ?auto_188724 ?auto_188723 ?auto_188722 )
      ( MAKE-6PILE ?auto_188717 ?auto_188718 ?auto_188719 ?auto_188720 ?auto_188721 ?auto_188722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188726 - BLOCK
      ?auto_188727 - BLOCK
      ?auto_188728 - BLOCK
      ?auto_188729 - BLOCK
      ?auto_188730 - BLOCK
      ?auto_188731 - BLOCK
    )
    :vars
    (
      ?auto_188734 - BLOCK
      ?auto_188732 - BLOCK
      ?auto_188733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188726 ) ( ON ?auto_188727 ?auto_188726 ) ( ON ?auto_188728 ?auto_188727 ) ( not ( = ?auto_188726 ?auto_188727 ) ) ( not ( = ?auto_188726 ?auto_188728 ) ) ( not ( = ?auto_188726 ?auto_188729 ) ) ( not ( = ?auto_188726 ?auto_188730 ) ) ( not ( = ?auto_188726 ?auto_188731 ) ) ( not ( = ?auto_188727 ?auto_188728 ) ) ( not ( = ?auto_188727 ?auto_188729 ) ) ( not ( = ?auto_188727 ?auto_188730 ) ) ( not ( = ?auto_188727 ?auto_188731 ) ) ( not ( = ?auto_188728 ?auto_188729 ) ) ( not ( = ?auto_188728 ?auto_188730 ) ) ( not ( = ?auto_188728 ?auto_188731 ) ) ( not ( = ?auto_188729 ?auto_188730 ) ) ( not ( = ?auto_188729 ?auto_188731 ) ) ( not ( = ?auto_188730 ?auto_188731 ) ) ( ON ?auto_188731 ?auto_188734 ) ( not ( = ?auto_188726 ?auto_188734 ) ) ( not ( = ?auto_188727 ?auto_188734 ) ) ( not ( = ?auto_188728 ?auto_188734 ) ) ( not ( = ?auto_188729 ?auto_188734 ) ) ( not ( = ?auto_188730 ?auto_188734 ) ) ( not ( = ?auto_188731 ?auto_188734 ) ) ( ON ?auto_188730 ?auto_188731 ) ( CLEAR ?auto_188730 ) ( ON-TABLE ?auto_188732 ) ( ON ?auto_188733 ?auto_188732 ) ( ON ?auto_188734 ?auto_188733 ) ( not ( = ?auto_188732 ?auto_188733 ) ) ( not ( = ?auto_188732 ?auto_188734 ) ) ( not ( = ?auto_188732 ?auto_188731 ) ) ( not ( = ?auto_188732 ?auto_188730 ) ) ( not ( = ?auto_188733 ?auto_188734 ) ) ( not ( = ?auto_188733 ?auto_188731 ) ) ( not ( = ?auto_188733 ?auto_188730 ) ) ( not ( = ?auto_188726 ?auto_188732 ) ) ( not ( = ?auto_188726 ?auto_188733 ) ) ( not ( = ?auto_188727 ?auto_188732 ) ) ( not ( = ?auto_188727 ?auto_188733 ) ) ( not ( = ?auto_188728 ?auto_188732 ) ) ( not ( = ?auto_188728 ?auto_188733 ) ) ( not ( = ?auto_188729 ?auto_188732 ) ) ( not ( = ?auto_188729 ?auto_188733 ) ) ( HOLDING ?auto_188729 ) ( CLEAR ?auto_188728 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188726 ?auto_188727 ?auto_188728 ?auto_188729 )
      ( MAKE-6PILE ?auto_188726 ?auto_188727 ?auto_188728 ?auto_188729 ?auto_188730 ?auto_188731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188735 - BLOCK
      ?auto_188736 - BLOCK
      ?auto_188737 - BLOCK
      ?auto_188738 - BLOCK
      ?auto_188739 - BLOCK
      ?auto_188740 - BLOCK
    )
    :vars
    (
      ?auto_188741 - BLOCK
      ?auto_188743 - BLOCK
      ?auto_188742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188735 ) ( ON ?auto_188736 ?auto_188735 ) ( ON ?auto_188737 ?auto_188736 ) ( not ( = ?auto_188735 ?auto_188736 ) ) ( not ( = ?auto_188735 ?auto_188737 ) ) ( not ( = ?auto_188735 ?auto_188738 ) ) ( not ( = ?auto_188735 ?auto_188739 ) ) ( not ( = ?auto_188735 ?auto_188740 ) ) ( not ( = ?auto_188736 ?auto_188737 ) ) ( not ( = ?auto_188736 ?auto_188738 ) ) ( not ( = ?auto_188736 ?auto_188739 ) ) ( not ( = ?auto_188736 ?auto_188740 ) ) ( not ( = ?auto_188737 ?auto_188738 ) ) ( not ( = ?auto_188737 ?auto_188739 ) ) ( not ( = ?auto_188737 ?auto_188740 ) ) ( not ( = ?auto_188738 ?auto_188739 ) ) ( not ( = ?auto_188738 ?auto_188740 ) ) ( not ( = ?auto_188739 ?auto_188740 ) ) ( ON ?auto_188740 ?auto_188741 ) ( not ( = ?auto_188735 ?auto_188741 ) ) ( not ( = ?auto_188736 ?auto_188741 ) ) ( not ( = ?auto_188737 ?auto_188741 ) ) ( not ( = ?auto_188738 ?auto_188741 ) ) ( not ( = ?auto_188739 ?auto_188741 ) ) ( not ( = ?auto_188740 ?auto_188741 ) ) ( ON ?auto_188739 ?auto_188740 ) ( ON-TABLE ?auto_188743 ) ( ON ?auto_188742 ?auto_188743 ) ( ON ?auto_188741 ?auto_188742 ) ( not ( = ?auto_188743 ?auto_188742 ) ) ( not ( = ?auto_188743 ?auto_188741 ) ) ( not ( = ?auto_188743 ?auto_188740 ) ) ( not ( = ?auto_188743 ?auto_188739 ) ) ( not ( = ?auto_188742 ?auto_188741 ) ) ( not ( = ?auto_188742 ?auto_188740 ) ) ( not ( = ?auto_188742 ?auto_188739 ) ) ( not ( = ?auto_188735 ?auto_188743 ) ) ( not ( = ?auto_188735 ?auto_188742 ) ) ( not ( = ?auto_188736 ?auto_188743 ) ) ( not ( = ?auto_188736 ?auto_188742 ) ) ( not ( = ?auto_188737 ?auto_188743 ) ) ( not ( = ?auto_188737 ?auto_188742 ) ) ( not ( = ?auto_188738 ?auto_188743 ) ) ( not ( = ?auto_188738 ?auto_188742 ) ) ( CLEAR ?auto_188737 ) ( ON ?auto_188738 ?auto_188739 ) ( CLEAR ?auto_188738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188743 ?auto_188742 ?auto_188741 ?auto_188740 ?auto_188739 )
      ( MAKE-6PILE ?auto_188735 ?auto_188736 ?auto_188737 ?auto_188738 ?auto_188739 ?auto_188740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188744 - BLOCK
      ?auto_188745 - BLOCK
      ?auto_188746 - BLOCK
      ?auto_188747 - BLOCK
      ?auto_188748 - BLOCK
      ?auto_188749 - BLOCK
    )
    :vars
    (
      ?auto_188751 - BLOCK
      ?auto_188750 - BLOCK
      ?auto_188752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188744 ) ( ON ?auto_188745 ?auto_188744 ) ( not ( = ?auto_188744 ?auto_188745 ) ) ( not ( = ?auto_188744 ?auto_188746 ) ) ( not ( = ?auto_188744 ?auto_188747 ) ) ( not ( = ?auto_188744 ?auto_188748 ) ) ( not ( = ?auto_188744 ?auto_188749 ) ) ( not ( = ?auto_188745 ?auto_188746 ) ) ( not ( = ?auto_188745 ?auto_188747 ) ) ( not ( = ?auto_188745 ?auto_188748 ) ) ( not ( = ?auto_188745 ?auto_188749 ) ) ( not ( = ?auto_188746 ?auto_188747 ) ) ( not ( = ?auto_188746 ?auto_188748 ) ) ( not ( = ?auto_188746 ?auto_188749 ) ) ( not ( = ?auto_188747 ?auto_188748 ) ) ( not ( = ?auto_188747 ?auto_188749 ) ) ( not ( = ?auto_188748 ?auto_188749 ) ) ( ON ?auto_188749 ?auto_188751 ) ( not ( = ?auto_188744 ?auto_188751 ) ) ( not ( = ?auto_188745 ?auto_188751 ) ) ( not ( = ?auto_188746 ?auto_188751 ) ) ( not ( = ?auto_188747 ?auto_188751 ) ) ( not ( = ?auto_188748 ?auto_188751 ) ) ( not ( = ?auto_188749 ?auto_188751 ) ) ( ON ?auto_188748 ?auto_188749 ) ( ON-TABLE ?auto_188750 ) ( ON ?auto_188752 ?auto_188750 ) ( ON ?auto_188751 ?auto_188752 ) ( not ( = ?auto_188750 ?auto_188752 ) ) ( not ( = ?auto_188750 ?auto_188751 ) ) ( not ( = ?auto_188750 ?auto_188749 ) ) ( not ( = ?auto_188750 ?auto_188748 ) ) ( not ( = ?auto_188752 ?auto_188751 ) ) ( not ( = ?auto_188752 ?auto_188749 ) ) ( not ( = ?auto_188752 ?auto_188748 ) ) ( not ( = ?auto_188744 ?auto_188750 ) ) ( not ( = ?auto_188744 ?auto_188752 ) ) ( not ( = ?auto_188745 ?auto_188750 ) ) ( not ( = ?auto_188745 ?auto_188752 ) ) ( not ( = ?auto_188746 ?auto_188750 ) ) ( not ( = ?auto_188746 ?auto_188752 ) ) ( not ( = ?auto_188747 ?auto_188750 ) ) ( not ( = ?auto_188747 ?auto_188752 ) ) ( ON ?auto_188747 ?auto_188748 ) ( CLEAR ?auto_188747 ) ( HOLDING ?auto_188746 ) ( CLEAR ?auto_188745 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188744 ?auto_188745 ?auto_188746 )
      ( MAKE-6PILE ?auto_188744 ?auto_188745 ?auto_188746 ?auto_188747 ?auto_188748 ?auto_188749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188753 - BLOCK
      ?auto_188754 - BLOCK
      ?auto_188755 - BLOCK
      ?auto_188756 - BLOCK
      ?auto_188757 - BLOCK
      ?auto_188758 - BLOCK
    )
    :vars
    (
      ?auto_188761 - BLOCK
      ?auto_188759 - BLOCK
      ?auto_188760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188753 ) ( ON ?auto_188754 ?auto_188753 ) ( not ( = ?auto_188753 ?auto_188754 ) ) ( not ( = ?auto_188753 ?auto_188755 ) ) ( not ( = ?auto_188753 ?auto_188756 ) ) ( not ( = ?auto_188753 ?auto_188757 ) ) ( not ( = ?auto_188753 ?auto_188758 ) ) ( not ( = ?auto_188754 ?auto_188755 ) ) ( not ( = ?auto_188754 ?auto_188756 ) ) ( not ( = ?auto_188754 ?auto_188757 ) ) ( not ( = ?auto_188754 ?auto_188758 ) ) ( not ( = ?auto_188755 ?auto_188756 ) ) ( not ( = ?auto_188755 ?auto_188757 ) ) ( not ( = ?auto_188755 ?auto_188758 ) ) ( not ( = ?auto_188756 ?auto_188757 ) ) ( not ( = ?auto_188756 ?auto_188758 ) ) ( not ( = ?auto_188757 ?auto_188758 ) ) ( ON ?auto_188758 ?auto_188761 ) ( not ( = ?auto_188753 ?auto_188761 ) ) ( not ( = ?auto_188754 ?auto_188761 ) ) ( not ( = ?auto_188755 ?auto_188761 ) ) ( not ( = ?auto_188756 ?auto_188761 ) ) ( not ( = ?auto_188757 ?auto_188761 ) ) ( not ( = ?auto_188758 ?auto_188761 ) ) ( ON ?auto_188757 ?auto_188758 ) ( ON-TABLE ?auto_188759 ) ( ON ?auto_188760 ?auto_188759 ) ( ON ?auto_188761 ?auto_188760 ) ( not ( = ?auto_188759 ?auto_188760 ) ) ( not ( = ?auto_188759 ?auto_188761 ) ) ( not ( = ?auto_188759 ?auto_188758 ) ) ( not ( = ?auto_188759 ?auto_188757 ) ) ( not ( = ?auto_188760 ?auto_188761 ) ) ( not ( = ?auto_188760 ?auto_188758 ) ) ( not ( = ?auto_188760 ?auto_188757 ) ) ( not ( = ?auto_188753 ?auto_188759 ) ) ( not ( = ?auto_188753 ?auto_188760 ) ) ( not ( = ?auto_188754 ?auto_188759 ) ) ( not ( = ?auto_188754 ?auto_188760 ) ) ( not ( = ?auto_188755 ?auto_188759 ) ) ( not ( = ?auto_188755 ?auto_188760 ) ) ( not ( = ?auto_188756 ?auto_188759 ) ) ( not ( = ?auto_188756 ?auto_188760 ) ) ( ON ?auto_188756 ?auto_188757 ) ( CLEAR ?auto_188754 ) ( ON ?auto_188755 ?auto_188756 ) ( CLEAR ?auto_188755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188759 ?auto_188760 ?auto_188761 ?auto_188758 ?auto_188757 ?auto_188756 )
      ( MAKE-6PILE ?auto_188753 ?auto_188754 ?auto_188755 ?auto_188756 ?auto_188757 ?auto_188758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188762 - BLOCK
      ?auto_188763 - BLOCK
      ?auto_188764 - BLOCK
      ?auto_188765 - BLOCK
      ?auto_188766 - BLOCK
      ?auto_188767 - BLOCK
    )
    :vars
    (
      ?auto_188770 - BLOCK
      ?auto_188768 - BLOCK
      ?auto_188769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188762 ) ( not ( = ?auto_188762 ?auto_188763 ) ) ( not ( = ?auto_188762 ?auto_188764 ) ) ( not ( = ?auto_188762 ?auto_188765 ) ) ( not ( = ?auto_188762 ?auto_188766 ) ) ( not ( = ?auto_188762 ?auto_188767 ) ) ( not ( = ?auto_188763 ?auto_188764 ) ) ( not ( = ?auto_188763 ?auto_188765 ) ) ( not ( = ?auto_188763 ?auto_188766 ) ) ( not ( = ?auto_188763 ?auto_188767 ) ) ( not ( = ?auto_188764 ?auto_188765 ) ) ( not ( = ?auto_188764 ?auto_188766 ) ) ( not ( = ?auto_188764 ?auto_188767 ) ) ( not ( = ?auto_188765 ?auto_188766 ) ) ( not ( = ?auto_188765 ?auto_188767 ) ) ( not ( = ?auto_188766 ?auto_188767 ) ) ( ON ?auto_188767 ?auto_188770 ) ( not ( = ?auto_188762 ?auto_188770 ) ) ( not ( = ?auto_188763 ?auto_188770 ) ) ( not ( = ?auto_188764 ?auto_188770 ) ) ( not ( = ?auto_188765 ?auto_188770 ) ) ( not ( = ?auto_188766 ?auto_188770 ) ) ( not ( = ?auto_188767 ?auto_188770 ) ) ( ON ?auto_188766 ?auto_188767 ) ( ON-TABLE ?auto_188768 ) ( ON ?auto_188769 ?auto_188768 ) ( ON ?auto_188770 ?auto_188769 ) ( not ( = ?auto_188768 ?auto_188769 ) ) ( not ( = ?auto_188768 ?auto_188770 ) ) ( not ( = ?auto_188768 ?auto_188767 ) ) ( not ( = ?auto_188768 ?auto_188766 ) ) ( not ( = ?auto_188769 ?auto_188770 ) ) ( not ( = ?auto_188769 ?auto_188767 ) ) ( not ( = ?auto_188769 ?auto_188766 ) ) ( not ( = ?auto_188762 ?auto_188768 ) ) ( not ( = ?auto_188762 ?auto_188769 ) ) ( not ( = ?auto_188763 ?auto_188768 ) ) ( not ( = ?auto_188763 ?auto_188769 ) ) ( not ( = ?auto_188764 ?auto_188768 ) ) ( not ( = ?auto_188764 ?auto_188769 ) ) ( not ( = ?auto_188765 ?auto_188768 ) ) ( not ( = ?auto_188765 ?auto_188769 ) ) ( ON ?auto_188765 ?auto_188766 ) ( ON ?auto_188764 ?auto_188765 ) ( CLEAR ?auto_188764 ) ( HOLDING ?auto_188763 ) ( CLEAR ?auto_188762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188762 ?auto_188763 )
      ( MAKE-6PILE ?auto_188762 ?auto_188763 ?auto_188764 ?auto_188765 ?auto_188766 ?auto_188767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188771 - BLOCK
      ?auto_188772 - BLOCK
      ?auto_188773 - BLOCK
      ?auto_188774 - BLOCK
      ?auto_188775 - BLOCK
      ?auto_188776 - BLOCK
    )
    :vars
    (
      ?auto_188777 - BLOCK
      ?auto_188778 - BLOCK
      ?auto_188779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188771 ) ( not ( = ?auto_188771 ?auto_188772 ) ) ( not ( = ?auto_188771 ?auto_188773 ) ) ( not ( = ?auto_188771 ?auto_188774 ) ) ( not ( = ?auto_188771 ?auto_188775 ) ) ( not ( = ?auto_188771 ?auto_188776 ) ) ( not ( = ?auto_188772 ?auto_188773 ) ) ( not ( = ?auto_188772 ?auto_188774 ) ) ( not ( = ?auto_188772 ?auto_188775 ) ) ( not ( = ?auto_188772 ?auto_188776 ) ) ( not ( = ?auto_188773 ?auto_188774 ) ) ( not ( = ?auto_188773 ?auto_188775 ) ) ( not ( = ?auto_188773 ?auto_188776 ) ) ( not ( = ?auto_188774 ?auto_188775 ) ) ( not ( = ?auto_188774 ?auto_188776 ) ) ( not ( = ?auto_188775 ?auto_188776 ) ) ( ON ?auto_188776 ?auto_188777 ) ( not ( = ?auto_188771 ?auto_188777 ) ) ( not ( = ?auto_188772 ?auto_188777 ) ) ( not ( = ?auto_188773 ?auto_188777 ) ) ( not ( = ?auto_188774 ?auto_188777 ) ) ( not ( = ?auto_188775 ?auto_188777 ) ) ( not ( = ?auto_188776 ?auto_188777 ) ) ( ON ?auto_188775 ?auto_188776 ) ( ON-TABLE ?auto_188778 ) ( ON ?auto_188779 ?auto_188778 ) ( ON ?auto_188777 ?auto_188779 ) ( not ( = ?auto_188778 ?auto_188779 ) ) ( not ( = ?auto_188778 ?auto_188777 ) ) ( not ( = ?auto_188778 ?auto_188776 ) ) ( not ( = ?auto_188778 ?auto_188775 ) ) ( not ( = ?auto_188779 ?auto_188777 ) ) ( not ( = ?auto_188779 ?auto_188776 ) ) ( not ( = ?auto_188779 ?auto_188775 ) ) ( not ( = ?auto_188771 ?auto_188778 ) ) ( not ( = ?auto_188771 ?auto_188779 ) ) ( not ( = ?auto_188772 ?auto_188778 ) ) ( not ( = ?auto_188772 ?auto_188779 ) ) ( not ( = ?auto_188773 ?auto_188778 ) ) ( not ( = ?auto_188773 ?auto_188779 ) ) ( not ( = ?auto_188774 ?auto_188778 ) ) ( not ( = ?auto_188774 ?auto_188779 ) ) ( ON ?auto_188774 ?auto_188775 ) ( ON ?auto_188773 ?auto_188774 ) ( CLEAR ?auto_188771 ) ( ON ?auto_188772 ?auto_188773 ) ( CLEAR ?auto_188772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188778 ?auto_188779 ?auto_188777 ?auto_188776 ?auto_188775 ?auto_188774 ?auto_188773 )
      ( MAKE-6PILE ?auto_188771 ?auto_188772 ?auto_188773 ?auto_188774 ?auto_188775 ?auto_188776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188780 - BLOCK
      ?auto_188781 - BLOCK
      ?auto_188782 - BLOCK
      ?auto_188783 - BLOCK
      ?auto_188784 - BLOCK
      ?auto_188785 - BLOCK
    )
    :vars
    (
      ?auto_188787 - BLOCK
      ?auto_188786 - BLOCK
      ?auto_188788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188780 ?auto_188781 ) ) ( not ( = ?auto_188780 ?auto_188782 ) ) ( not ( = ?auto_188780 ?auto_188783 ) ) ( not ( = ?auto_188780 ?auto_188784 ) ) ( not ( = ?auto_188780 ?auto_188785 ) ) ( not ( = ?auto_188781 ?auto_188782 ) ) ( not ( = ?auto_188781 ?auto_188783 ) ) ( not ( = ?auto_188781 ?auto_188784 ) ) ( not ( = ?auto_188781 ?auto_188785 ) ) ( not ( = ?auto_188782 ?auto_188783 ) ) ( not ( = ?auto_188782 ?auto_188784 ) ) ( not ( = ?auto_188782 ?auto_188785 ) ) ( not ( = ?auto_188783 ?auto_188784 ) ) ( not ( = ?auto_188783 ?auto_188785 ) ) ( not ( = ?auto_188784 ?auto_188785 ) ) ( ON ?auto_188785 ?auto_188787 ) ( not ( = ?auto_188780 ?auto_188787 ) ) ( not ( = ?auto_188781 ?auto_188787 ) ) ( not ( = ?auto_188782 ?auto_188787 ) ) ( not ( = ?auto_188783 ?auto_188787 ) ) ( not ( = ?auto_188784 ?auto_188787 ) ) ( not ( = ?auto_188785 ?auto_188787 ) ) ( ON ?auto_188784 ?auto_188785 ) ( ON-TABLE ?auto_188786 ) ( ON ?auto_188788 ?auto_188786 ) ( ON ?auto_188787 ?auto_188788 ) ( not ( = ?auto_188786 ?auto_188788 ) ) ( not ( = ?auto_188786 ?auto_188787 ) ) ( not ( = ?auto_188786 ?auto_188785 ) ) ( not ( = ?auto_188786 ?auto_188784 ) ) ( not ( = ?auto_188788 ?auto_188787 ) ) ( not ( = ?auto_188788 ?auto_188785 ) ) ( not ( = ?auto_188788 ?auto_188784 ) ) ( not ( = ?auto_188780 ?auto_188786 ) ) ( not ( = ?auto_188780 ?auto_188788 ) ) ( not ( = ?auto_188781 ?auto_188786 ) ) ( not ( = ?auto_188781 ?auto_188788 ) ) ( not ( = ?auto_188782 ?auto_188786 ) ) ( not ( = ?auto_188782 ?auto_188788 ) ) ( not ( = ?auto_188783 ?auto_188786 ) ) ( not ( = ?auto_188783 ?auto_188788 ) ) ( ON ?auto_188783 ?auto_188784 ) ( ON ?auto_188782 ?auto_188783 ) ( ON ?auto_188781 ?auto_188782 ) ( CLEAR ?auto_188781 ) ( HOLDING ?auto_188780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188780 )
      ( MAKE-6PILE ?auto_188780 ?auto_188781 ?auto_188782 ?auto_188783 ?auto_188784 ?auto_188785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188789 - BLOCK
      ?auto_188790 - BLOCK
      ?auto_188791 - BLOCK
      ?auto_188792 - BLOCK
      ?auto_188793 - BLOCK
      ?auto_188794 - BLOCK
    )
    :vars
    (
      ?auto_188796 - BLOCK
      ?auto_188797 - BLOCK
      ?auto_188795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188789 ?auto_188790 ) ) ( not ( = ?auto_188789 ?auto_188791 ) ) ( not ( = ?auto_188789 ?auto_188792 ) ) ( not ( = ?auto_188789 ?auto_188793 ) ) ( not ( = ?auto_188789 ?auto_188794 ) ) ( not ( = ?auto_188790 ?auto_188791 ) ) ( not ( = ?auto_188790 ?auto_188792 ) ) ( not ( = ?auto_188790 ?auto_188793 ) ) ( not ( = ?auto_188790 ?auto_188794 ) ) ( not ( = ?auto_188791 ?auto_188792 ) ) ( not ( = ?auto_188791 ?auto_188793 ) ) ( not ( = ?auto_188791 ?auto_188794 ) ) ( not ( = ?auto_188792 ?auto_188793 ) ) ( not ( = ?auto_188792 ?auto_188794 ) ) ( not ( = ?auto_188793 ?auto_188794 ) ) ( ON ?auto_188794 ?auto_188796 ) ( not ( = ?auto_188789 ?auto_188796 ) ) ( not ( = ?auto_188790 ?auto_188796 ) ) ( not ( = ?auto_188791 ?auto_188796 ) ) ( not ( = ?auto_188792 ?auto_188796 ) ) ( not ( = ?auto_188793 ?auto_188796 ) ) ( not ( = ?auto_188794 ?auto_188796 ) ) ( ON ?auto_188793 ?auto_188794 ) ( ON-TABLE ?auto_188797 ) ( ON ?auto_188795 ?auto_188797 ) ( ON ?auto_188796 ?auto_188795 ) ( not ( = ?auto_188797 ?auto_188795 ) ) ( not ( = ?auto_188797 ?auto_188796 ) ) ( not ( = ?auto_188797 ?auto_188794 ) ) ( not ( = ?auto_188797 ?auto_188793 ) ) ( not ( = ?auto_188795 ?auto_188796 ) ) ( not ( = ?auto_188795 ?auto_188794 ) ) ( not ( = ?auto_188795 ?auto_188793 ) ) ( not ( = ?auto_188789 ?auto_188797 ) ) ( not ( = ?auto_188789 ?auto_188795 ) ) ( not ( = ?auto_188790 ?auto_188797 ) ) ( not ( = ?auto_188790 ?auto_188795 ) ) ( not ( = ?auto_188791 ?auto_188797 ) ) ( not ( = ?auto_188791 ?auto_188795 ) ) ( not ( = ?auto_188792 ?auto_188797 ) ) ( not ( = ?auto_188792 ?auto_188795 ) ) ( ON ?auto_188792 ?auto_188793 ) ( ON ?auto_188791 ?auto_188792 ) ( ON ?auto_188790 ?auto_188791 ) ( ON ?auto_188789 ?auto_188790 ) ( CLEAR ?auto_188789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188797 ?auto_188795 ?auto_188796 ?auto_188794 ?auto_188793 ?auto_188792 ?auto_188791 ?auto_188790 )
      ( MAKE-6PILE ?auto_188789 ?auto_188790 ?auto_188791 ?auto_188792 ?auto_188793 ?auto_188794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188800 - BLOCK
      ?auto_188801 - BLOCK
    )
    :vars
    (
      ?auto_188802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188802 ?auto_188801 ) ( CLEAR ?auto_188802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188800 ) ( ON ?auto_188801 ?auto_188800 ) ( not ( = ?auto_188800 ?auto_188801 ) ) ( not ( = ?auto_188800 ?auto_188802 ) ) ( not ( = ?auto_188801 ?auto_188802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188802 ?auto_188801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188803 - BLOCK
      ?auto_188804 - BLOCK
    )
    :vars
    (
      ?auto_188805 - BLOCK
      ?auto_188806 - BLOCK
      ?auto_188807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188805 ?auto_188804 ) ( CLEAR ?auto_188805 ) ( ON-TABLE ?auto_188803 ) ( ON ?auto_188804 ?auto_188803 ) ( not ( = ?auto_188803 ?auto_188804 ) ) ( not ( = ?auto_188803 ?auto_188805 ) ) ( not ( = ?auto_188804 ?auto_188805 ) ) ( HOLDING ?auto_188806 ) ( CLEAR ?auto_188807 ) ( not ( = ?auto_188803 ?auto_188806 ) ) ( not ( = ?auto_188803 ?auto_188807 ) ) ( not ( = ?auto_188804 ?auto_188806 ) ) ( not ( = ?auto_188804 ?auto_188807 ) ) ( not ( = ?auto_188805 ?auto_188806 ) ) ( not ( = ?auto_188805 ?auto_188807 ) ) ( not ( = ?auto_188806 ?auto_188807 ) ) )
    :subtasks
    ( ( !STACK ?auto_188806 ?auto_188807 )
      ( MAKE-2PILE ?auto_188803 ?auto_188804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188808 - BLOCK
      ?auto_188809 - BLOCK
    )
    :vars
    (
      ?auto_188812 - BLOCK
      ?auto_188810 - BLOCK
      ?auto_188811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188812 ?auto_188809 ) ( ON-TABLE ?auto_188808 ) ( ON ?auto_188809 ?auto_188808 ) ( not ( = ?auto_188808 ?auto_188809 ) ) ( not ( = ?auto_188808 ?auto_188812 ) ) ( not ( = ?auto_188809 ?auto_188812 ) ) ( CLEAR ?auto_188810 ) ( not ( = ?auto_188808 ?auto_188811 ) ) ( not ( = ?auto_188808 ?auto_188810 ) ) ( not ( = ?auto_188809 ?auto_188811 ) ) ( not ( = ?auto_188809 ?auto_188810 ) ) ( not ( = ?auto_188812 ?auto_188811 ) ) ( not ( = ?auto_188812 ?auto_188810 ) ) ( not ( = ?auto_188811 ?auto_188810 ) ) ( ON ?auto_188811 ?auto_188812 ) ( CLEAR ?auto_188811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188808 ?auto_188809 ?auto_188812 )
      ( MAKE-2PILE ?auto_188808 ?auto_188809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188813 - BLOCK
      ?auto_188814 - BLOCK
    )
    :vars
    (
      ?auto_188816 - BLOCK
      ?auto_188817 - BLOCK
      ?auto_188815 - BLOCK
      ?auto_188818 - BLOCK
      ?auto_188820 - BLOCK
      ?auto_188821 - BLOCK
      ?auto_188819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188816 ?auto_188814 ) ( ON-TABLE ?auto_188813 ) ( ON ?auto_188814 ?auto_188813 ) ( not ( = ?auto_188813 ?auto_188814 ) ) ( not ( = ?auto_188813 ?auto_188816 ) ) ( not ( = ?auto_188814 ?auto_188816 ) ) ( not ( = ?auto_188813 ?auto_188817 ) ) ( not ( = ?auto_188813 ?auto_188815 ) ) ( not ( = ?auto_188814 ?auto_188817 ) ) ( not ( = ?auto_188814 ?auto_188815 ) ) ( not ( = ?auto_188816 ?auto_188817 ) ) ( not ( = ?auto_188816 ?auto_188815 ) ) ( not ( = ?auto_188817 ?auto_188815 ) ) ( ON ?auto_188817 ?auto_188816 ) ( CLEAR ?auto_188817 ) ( HOLDING ?auto_188815 ) ( CLEAR ?auto_188818 ) ( ON-TABLE ?auto_188820 ) ( ON ?auto_188821 ?auto_188820 ) ( ON ?auto_188819 ?auto_188821 ) ( ON ?auto_188818 ?auto_188819 ) ( not ( = ?auto_188820 ?auto_188821 ) ) ( not ( = ?auto_188820 ?auto_188819 ) ) ( not ( = ?auto_188820 ?auto_188818 ) ) ( not ( = ?auto_188820 ?auto_188815 ) ) ( not ( = ?auto_188821 ?auto_188819 ) ) ( not ( = ?auto_188821 ?auto_188818 ) ) ( not ( = ?auto_188821 ?auto_188815 ) ) ( not ( = ?auto_188819 ?auto_188818 ) ) ( not ( = ?auto_188819 ?auto_188815 ) ) ( not ( = ?auto_188818 ?auto_188815 ) ) ( not ( = ?auto_188813 ?auto_188818 ) ) ( not ( = ?auto_188813 ?auto_188820 ) ) ( not ( = ?auto_188813 ?auto_188821 ) ) ( not ( = ?auto_188813 ?auto_188819 ) ) ( not ( = ?auto_188814 ?auto_188818 ) ) ( not ( = ?auto_188814 ?auto_188820 ) ) ( not ( = ?auto_188814 ?auto_188821 ) ) ( not ( = ?auto_188814 ?auto_188819 ) ) ( not ( = ?auto_188816 ?auto_188818 ) ) ( not ( = ?auto_188816 ?auto_188820 ) ) ( not ( = ?auto_188816 ?auto_188821 ) ) ( not ( = ?auto_188816 ?auto_188819 ) ) ( not ( = ?auto_188817 ?auto_188818 ) ) ( not ( = ?auto_188817 ?auto_188820 ) ) ( not ( = ?auto_188817 ?auto_188821 ) ) ( not ( = ?auto_188817 ?auto_188819 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188820 ?auto_188821 ?auto_188819 ?auto_188818 ?auto_188815 )
      ( MAKE-2PILE ?auto_188813 ?auto_188814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188822 - BLOCK
      ?auto_188823 - BLOCK
    )
    :vars
    (
      ?auto_188828 - BLOCK
      ?auto_188829 - BLOCK
      ?auto_188827 - BLOCK
      ?auto_188824 - BLOCK
      ?auto_188825 - BLOCK
      ?auto_188830 - BLOCK
      ?auto_188826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188828 ?auto_188823 ) ( ON-TABLE ?auto_188822 ) ( ON ?auto_188823 ?auto_188822 ) ( not ( = ?auto_188822 ?auto_188823 ) ) ( not ( = ?auto_188822 ?auto_188828 ) ) ( not ( = ?auto_188823 ?auto_188828 ) ) ( not ( = ?auto_188822 ?auto_188829 ) ) ( not ( = ?auto_188822 ?auto_188827 ) ) ( not ( = ?auto_188823 ?auto_188829 ) ) ( not ( = ?auto_188823 ?auto_188827 ) ) ( not ( = ?auto_188828 ?auto_188829 ) ) ( not ( = ?auto_188828 ?auto_188827 ) ) ( not ( = ?auto_188829 ?auto_188827 ) ) ( ON ?auto_188829 ?auto_188828 ) ( CLEAR ?auto_188824 ) ( ON-TABLE ?auto_188825 ) ( ON ?auto_188830 ?auto_188825 ) ( ON ?auto_188826 ?auto_188830 ) ( ON ?auto_188824 ?auto_188826 ) ( not ( = ?auto_188825 ?auto_188830 ) ) ( not ( = ?auto_188825 ?auto_188826 ) ) ( not ( = ?auto_188825 ?auto_188824 ) ) ( not ( = ?auto_188825 ?auto_188827 ) ) ( not ( = ?auto_188830 ?auto_188826 ) ) ( not ( = ?auto_188830 ?auto_188824 ) ) ( not ( = ?auto_188830 ?auto_188827 ) ) ( not ( = ?auto_188826 ?auto_188824 ) ) ( not ( = ?auto_188826 ?auto_188827 ) ) ( not ( = ?auto_188824 ?auto_188827 ) ) ( not ( = ?auto_188822 ?auto_188824 ) ) ( not ( = ?auto_188822 ?auto_188825 ) ) ( not ( = ?auto_188822 ?auto_188830 ) ) ( not ( = ?auto_188822 ?auto_188826 ) ) ( not ( = ?auto_188823 ?auto_188824 ) ) ( not ( = ?auto_188823 ?auto_188825 ) ) ( not ( = ?auto_188823 ?auto_188830 ) ) ( not ( = ?auto_188823 ?auto_188826 ) ) ( not ( = ?auto_188828 ?auto_188824 ) ) ( not ( = ?auto_188828 ?auto_188825 ) ) ( not ( = ?auto_188828 ?auto_188830 ) ) ( not ( = ?auto_188828 ?auto_188826 ) ) ( not ( = ?auto_188829 ?auto_188824 ) ) ( not ( = ?auto_188829 ?auto_188825 ) ) ( not ( = ?auto_188829 ?auto_188830 ) ) ( not ( = ?auto_188829 ?auto_188826 ) ) ( ON ?auto_188827 ?auto_188829 ) ( CLEAR ?auto_188827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188822 ?auto_188823 ?auto_188828 ?auto_188829 )
      ( MAKE-2PILE ?auto_188822 ?auto_188823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188831 - BLOCK
      ?auto_188832 - BLOCK
    )
    :vars
    (
      ?auto_188833 - BLOCK
      ?auto_188839 - BLOCK
      ?auto_188836 - BLOCK
      ?auto_188835 - BLOCK
      ?auto_188838 - BLOCK
      ?auto_188834 - BLOCK
      ?auto_188837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188833 ?auto_188832 ) ( ON-TABLE ?auto_188831 ) ( ON ?auto_188832 ?auto_188831 ) ( not ( = ?auto_188831 ?auto_188832 ) ) ( not ( = ?auto_188831 ?auto_188833 ) ) ( not ( = ?auto_188832 ?auto_188833 ) ) ( not ( = ?auto_188831 ?auto_188839 ) ) ( not ( = ?auto_188831 ?auto_188836 ) ) ( not ( = ?auto_188832 ?auto_188839 ) ) ( not ( = ?auto_188832 ?auto_188836 ) ) ( not ( = ?auto_188833 ?auto_188839 ) ) ( not ( = ?auto_188833 ?auto_188836 ) ) ( not ( = ?auto_188839 ?auto_188836 ) ) ( ON ?auto_188839 ?auto_188833 ) ( ON-TABLE ?auto_188835 ) ( ON ?auto_188838 ?auto_188835 ) ( ON ?auto_188834 ?auto_188838 ) ( not ( = ?auto_188835 ?auto_188838 ) ) ( not ( = ?auto_188835 ?auto_188834 ) ) ( not ( = ?auto_188835 ?auto_188837 ) ) ( not ( = ?auto_188835 ?auto_188836 ) ) ( not ( = ?auto_188838 ?auto_188834 ) ) ( not ( = ?auto_188838 ?auto_188837 ) ) ( not ( = ?auto_188838 ?auto_188836 ) ) ( not ( = ?auto_188834 ?auto_188837 ) ) ( not ( = ?auto_188834 ?auto_188836 ) ) ( not ( = ?auto_188837 ?auto_188836 ) ) ( not ( = ?auto_188831 ?auto_188837 ) ) ( not ( = ?auto_188831 ?auto_188835 ) ) ( not ( = ?auto_188831 ?auto_188838 ) ) ( not ( = ?auto_188831 ?auto_188834 ) ) ( not ( = ?auto_188832 ?auto_188837 ) ) ( not ( = ?auto_188832 ?auto_188835 ) ) ( not ( = ?auto_188832 ?auto_188838 ) ) ( not ( = ?auto_188832 ?auto_188834 ) ) ( not ( = ?auto_188833 ?auto_188837 ) ) ( not ( = ?auto_188833 ?auto_188835 ) ) ( not ( = ?auto_188833 ?auto_188838 ) ) ( not ( = ?auto_188833 ?auto_188834 ) ) ( not ( = ?auto_188839 ?auto_188837 ) ) ( not ( = ?auto_188839 ?auto_188835 ) ) ( not ( = ?auto_188839 ?auto_188838 ) ) ( not ( = ?auto_188839 ?auto_188834 ) ) ( ON ?auto_188836 ?auto_188839 ) ( CLEAR ?auto_188836 ) ( HOLDING ?auto_188837 ) ( CLEAR ?auto_188834 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188835 ?auto_188838 ?auto_188834 ?auto_188837 )
      ( MAKE-2PILE ?auto_188831 ?auto_188832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188840 - BLOCK
      ?auto_188841 - BLOCK
    )
    :vars
    (
      ?auto_188846 - BLOCK
      ?auto_188848 - BLOCK
      ?auto_188843 - BLOCK
      ?auto_188844 - BLOCK
      ?auto_188842 - BLOCK
      ?auto_188845 - BLOCK
      ?auto_188847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188846 ?auto_188841 ) ( ON-TABLE ?auto_188840 ) ( ON ?auto_188841 ?auto_188840 ) ( not ( = ?auto_188840 ?auto_188841 ) ) ( not ( = ?auto_188840 ?auto_188846 ) ) ( not ( = ?auto_188841 ?auto_188846 ) ) ( not ( = ?auto_188840 ?auto_188848 ) ) ( not ( = ?auto_188840 ?auto_188843 ) ) ( not ( = ?auto_188841 ?auto_188848 ) ) ( not ( = ?auto_188841 ?auto_188843 ) ) ( not ( = ?auto_188846 ?auto_188848 ) ) ( not ( = ?auto_188846 ?auto_188843 ) ) ( not ( = ?auto_188848 ?auto_188843 ) ) ( ON ?auto_188848 ?auto_188846 ) ( ON-TABLE ?auto_188844 ) ( ON ?auto_188842 ?auto_188844 ) ( ON ?auto_188845 ?auto_188842 ) ( not ( = ?auto_188844 ?auto_188842 ) ) ( not ( = ?auto_188844 ?auto_188845 ) ) ( not ( = ?auto_188844 ?auto_188847 ) ) ( not ( = ?auto_188844 ?auto_188843 ) ) ( not ( = ?auto_188842 ?auto_188845 ) ) ( not ( = ?auto_188842 ?auto_188847 ) ) ( not ( = ?auto_188842 ?auto_188843 ) ) ( not ( = ?auto_188845 ?auto_188847 ) ) ( not ( = ?auto_188845 ?auto_188843 ) ) ( not ( = ?auto_188847 ?auto_188843 ) ) ( not ( = ?auto_188840 ?auto_188847 ) ) ( not ( = ?auto_188840 ?auto_188844 ) ) ( not ( = ?auto_188840 ?auto_188842 ) ) ( not ( = ?auto_188840 ?auto_188845 ) ) ( not ( = ?auto_188841 ?auto_188847 ) ) ( not ( = ?auto_188841 ?auto_188844 ) ) ( not ( = ?auto_188841 ?auto_188842 ) ) ( not ( = ?auto_188841 ?auto_188845 ) ) ( not ( = ?auto_188846 ?auto_188847 ) ) ( not ( = ?auto_188846 ?auto_188844 ) ) ( not ( = ?auto_188846 ?auto_188842 ) ) ( not ( = ?auto_188846 ?auto_188845 ) ) ( not ( = ?auto_188848 ?auto_188847 ) ) ( not ( = ?auto_188848 ?auto_188844 ) ) ( not ( = ?auto_188848 ?auto_188842 ) ) ( not ( = ?auto_188848 ?auto_188845 ) ) ( ON ?auto_188843 ?auto_188848 ) ( CLEAR ?auto_188845 ) ( ON ?auto_188847 ?auto_188843 ) ( CLEAR ?auto_188847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188840 ?auto_188841 ?auto_188846 ?auto_188848 ?auto_188843 )
      ( MAKE-2PILE ?auto_188840 ?auto_188841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188849 - BLOCK
      ?auto_188850 - BLOCK
    )
    :vars
    (
      ?auto_188856 - BLOCK
      ?auto_188852 - BLOCK
      ?auto_188855 - BLOCK
      ?auto_188851 - BLOCK
      ?auto_188853 - BLOCK
      ?auto_188854 - BLOCK
      ?auto_188857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188856 ?auto_188850 ) ( ON-TABLE ?auto_188849 ) ( ON ?auto_188850 ?auto_188849 ) ( not ( = ?auto_188849 ?auto_188850 ) ) ( not ( = ?auto_188849 ?auto_188856 ) ) ( not ( = ?auto_188850 ?auto_188856 ) ) ( not ( = ?auto_188849 ?auto_188852 ) ) ( not ( = ?auto_188849 ?auto_188855 ) ) ( not ( = ?auto_188850 ?auto_188852 ) ) ( not ( = ?auto_188850 ?auto_188855 ) ) ( not ( = ?auto_188856 ?auto_188852 ) ) ( not ( = ?auto_188856 ?auto_188855 ) ) ( not ( = ?auto_188852 ?auto_188855 ) ) ( ON ?auto_188852 ?auto_188856 ) ( ON-TABLE ?auto_188851 ) ( ON ?auto_188853 ?auto_188851 ) ( not ( = ?auto_188851 ?auto_188853 ) ) ( not ( = ?auto_188851 ?auto_188854 ) ) ( not ( = ?auto_188851 ?auto_188857 ) ) ( not ( = ?auto_188851 ?auto_188855 ) ) ( not ( = ?auto_188853 ?auto_188854 ) ) ( not ( = ?auto_188853 ?auto_188857 ) ) ( not ( = ?auto_188853 ?auto_188855 ) ) ( not ( = ?auto_188854 ?auto_188857 ) ) ( not ( = ?auto_188854 ?auto_188855 ) ) ( not ( = ?auto_188857 ?auto_188855 ) ) ( not ( = ?auto_188849 ?auto_188857 ) ) ( not ( = ?auto_188849 ?auto_188851 ) ) ( not ( = ?auto_188849 ?auto_188853 ) ) ( not ( = ?auto_188849 ?auto_188854 ) ) ( not ( = ?auto_188850 ?auto_188857 ) ) ( not ( = ?auto_188850 ?auto_188851 ) ) ( not ( = ?auto_188850 ?auto_188853 ) ) ( not ( = ?auto_188850 ?auto_188854 ) ) ( not ( = ?auto_188856 ?auto_188857 ) ) ( not ( = ?auto_188856 ?auto_188851 ) ) ( not ( = ?auto_188856 ?auto_188853 ) ) ( not ( = ?auto_188856 ?auto_188854 ) ) ( not ( = ?auto_188852 ?auto_188857 ) ) ( not ( = ?auto_188852 ?auto_188851 ) ) ( not ( = ?auto_188852 ?auto_188853 ) ) ( not ( = ?auto_188852 ?auto_188854 ) ) ( ON ?auto_188855 ?auto_188852 ) ( ON ?auto_188857 ?auto_188855 ) ( CLEAR ?auto_188857 ) ( HOLDING ?auto_188854 ) ( CLEAR ?auto_188853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188851 ?auto_188853 ?auto_188854 )
      ( MAKE-2PILE ?auto_188849 ?auto_188850 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188858 - BLOCK
      ?auto_188859 - BLOCK
    )
    :vars
    (
      ?auto_188860 - BLOCK
      ?auto_188862 - BLOCK
      ?auto_188864 - BLOCK
      ?auto_188866 - BLOCK
      ?auto_188861 - BLOCK
      ?auto_188863 - BLOCK
      ?auto_188865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188860 ?auto_188859 ) ( ON-TABLE ?auto_188858 ) ( ON ?auto_188859 ?auto_188858 ) ( not ( = ?auto_188858 ?auto_188859 ) ) ( not ( = ?auto_188858 ?auto_188860 ) ) ( not ( = ?auto_188859 ?auto_188860 ) ) ( not ( = ?auto_188858 ?auto_188862 ) ) ( not ( = ?auto_188858 ?auto_188864 ) ) ( not ( = ?auto_188859 ?auto_188862 ) ) ( not ( = ?auto_188859 ?auto_188864 ) ) ( not ( = ?auto_188860 ?auto_188862 ) ) ( not ( = ?auto_188860 ?auto_188864 ) ) ( not ( = ?auto_188862 ?auto_188864 ) ) ( ON ?auto_188862 ?auto_188860 ) ( ON-TABLE ?auto_188866 ) ( ON ?auto_188861 ?auto_188866 ) ( not ( = ?auto_188866 ?auto_188861 ) ) ( not ( = ?auto_188866 ?auto_188863 ) ) ( not ( = ?auto_188866 ?auto_188865 ) ) ( not ( = ?auto_188866 ?auto_188864 ) ) ( not ( = ?auto_188861 ?auto_188863 ) ) ( not ( = ?auto_188861 ?auto_188865 ) ) ( not ( = ?auto_188861 ?auto_188864 ) ) ( not ( = ?auto_188863 ?auto_188865 ) ) ( not ( = ?auto_188863 ?auto_188864 ) ) ( not ( = ?auto_188865 ?auto_188864 ) ) ( not ( = ?auto_188858 ?auto_188865 ) ) ( not ( = ?auto_188858 ?auto_188866 ) ) ( not ( = ?auto_188858 ?auto_188861 ) ) ( not ( = ?auto_188858 ?auto_188863 ) ) ( not ( = ?auto_188859 ?auto_188865 ) ) ( not ( = ?auto_188859 ?auto_188866 ) ) ( not ( = ?auto_188859 ?auto_188861 ) ) ( not ( = ?auto_188859 ?auto_188863 ) ) ( not ( = ?auto_188860 ?auto_188865 ) ) ( not ( = ?auto_188860 ?auto_188866 ) ) ( not ( = ?auto_188860 ?auto_188861 ) ) ( not ( = ?auto_188860 ?auto_188863 ) ) ( not ( = ?auto_188862 ?auto_188865 ) ) ( not ( = ?auto_188862 ?auto_188866 ) ) ( not ( = ?auto_188862 ?auto_188861 ) ) ( not ( = ?auto_188862 ?auto_188863 ) ) ( ON ?auto_188864 ?auto_188862 ) ( ON ?auto_188865 ?auto_188864 ) ( CLEAR ?auto_188861 ) ( ON ?auto_188863 ?auto_188865 ) ( CLEAR ?auto_188863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188858 ?auto_188859 ?auto_188860 ?auto_188862 ?auto_188864 ?auto_188865 )
      ( MAKE-2PILE ?auto_188858 ?auto_188859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188867 - BLOCK
      ?auto_188868 - BLOCK
    )
    :vars
    (
      ?auto_188873 - BLOCK
      ?auto_188869 - BLOCK
      ?auto_188875 - BLOCK
      ?auto_188870 - BLOCK
      ?auto_188872 - BLOCK
      ?auto_188874 - BLOCK
      ?auto_188871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188873 ?auto_188868 ) ( ON-TABLE ?auto_188867 ) ( ON ?auto_188868 ?auto_188867 ) ( not ( = ?auto_188867 ?auto_188868 ) ) ( not ( = ?auto_188867 ?auto_188873 ) ) ( not ( = ?auto_188868 ?auto_188873 ) ) ( not ( = ?auto_188867 ?auto_188869 ) ) ( not ( = ?auto_188867 ?auto_188875 ) ) ( not ( = ?auto_188868 ?auto_188869 ) ) ( not ( = ?auto_188868 ?auto_188875 ) ) ( not ( = ?auto_188873 ?auto_188869 ) ) ( not ( = ?auto_188873 ?auto_188875 ) ) ( not ( = ?auto_188869 ?auto_188875 ) ) ( ON ?auto_188869 ?auto_188873 ) ( ON-TABLE ?auto_188870 ) ( not ( = ?auto_188870 ?auto_188872 ) ) ( not ( = ?auto_188870 ?auto_188874 ) ) ( not ( = ?auto_188870 ?auto_188871 ) ) ( not ( = ?auto_188870 ?auto_188875 ) ) ( not ( = ?auto_188872 ?auto_188874 ) ) ( not ( = ?auto_188872 ?auto_188871 ) ) ( not ( = ?auto_188872 ?auto_188875 ) ) ( not ( = ?auto_188874 ?auto_188871 ) ) ( not ( = ?auto_188874 ?auto_188875 ) ) ( not ( = ?auto_188871 ?auto_188875 ) ) ( not ( = ?auto_188867 ?auto_188871 ) ) ( not ( = ?auto_188867 ?auto_188870 ) ) ( not ( = ?auto_188867 ?auto_188872 ) ) ( not ( = ?auto_188867 ?auto_188874 ) ) ( not ( = ?auto_188868 ?auto_188871 ) ) ( not ( = ?auto_188868 ?auto_188870 ) ) ( not ( = ?auto_188868 ?auto_188872 ) ) ( not ( = ?auto_188868 ?auto_188874 ) ) ( not ( = ?auto_188873 ?auto_188871 ) ) ( not ( = ?auto_188873 ?auto_188870 ) ) ( not ( = ?auto_188873 ?auto_188872 ) ) ( not ( = ?auto_188873 ?auto_188874 ) ) ( not ( = ?auto_188869 ?auto_188871 ) ) ( not ( = ?auto_188869 ?auto_188870 ) ) ( not ( = ?auto_188869 ?auto_188872 ) ) ( not ( = ?auto_188869 ?auto_188874 ) ) ( ON ?auto_188875 ?auto_188869 ) ( ON ?auto_188871 ?auto_188875 ) ( ON ?auto_188874 ?auto_188871 ) ( CLEAR ?auto_188874 ) ( HOLDING ?auto_188872 ) ( CLEAR ?auto_188870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188870 ?auto_188872 )
      ( MAKE-2PILE ?auto_188867 ?auto_188868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190894 - BLOCK
      ?auto_190895 - BLOCK
    )
    :vars
    (
      ?auto_190897 - BLOCK
      ?auto_190896 - BLOCK
      ?auto_190900 - BLOCK
      ?auto_190899 - BLOCK
      ?auto_190901 - BLOCK
      ?auto_190898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190897 ?auto_190895 ) ( ON-TABLE ?auto_190894 ) ( ON ?auto_190895 ?auto_190894 ) ( not ( = ?auto_190894 ?auto_190895 ) ) ( not ( = ?auto_190894 ?auto_190897 ) ) ( not ( = ?auto_190895 ?auto_190897 ) ) ( not ( = ?auto_190894 ?auto_190896 ) ) ( not ( = ?auto_190894 ?auto_190900 ) ) ( not ( = ?auto_190895 ?auto_190896 ) ) ( not ( = ?auto_190895 ?auto_190900 ) ) ( not ( = ?auto_190897 ?auto_190896 ) ) ( not ( = ?auto_190897 ?auto_190900 ) ) ( not ( = ?auto_190896 ?auto_190900 ) ) ( ON ?auto_190896 ?auto_190897 ) ( not ( = ?auto_190899 ?auto_190901 ) ) ( not ( = ?auto_190899 ?auto_190898 ) ) ( not ( = ?auto_190899 ?auto_190900 ) ) ( not ( = ?auto_190901 ?auto_190898 ) ) ( not ( = ?auto_190901 ?auto_190900 ) ) ( not ( = ?auto_190898 ?auto_190900 ) ) ( not ( = ?auto_190894 ?auto_190898 ) ) ( not ( = ?auto_190894 ?auto_190899 ) ) ( not ( = ?auto_190894 ?auto_190901 ) ) ( not ( = ?auto_190895 ?auto_190898 ) ) ( not ( = ?auto_190895 ?auto_190899 ) ) ( not ( = ?auto_190895 ?auto_190901 ) ) ( not ( = ?auto_190897 ?auto_190898 ) ) ( not ( = ?auto_190897 ?auto_190899 ) ) ( not ( = ?auto_190897 ?auto_190901 ) ) ( not ( = ?auto_190896 ?auto_190898 ) ) ( not ( = ?auto_190896 ?auto_190899 ) ) ( not ( = ?auto_190896 ?auto_190901 ) ) ( ON ?auto_190900 ?auto_190896 ) ( ON ?auto_190898 ?auto_190900 ) ( ON ?auto_190901 ?auto_190898 ) ( ON ?auto_190899 ?auto_190901 ) ( CLEAR ?auto_190899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190894 ?auto_190895 ?auto_190897 ?auto_190896 ?auto_190900 ?auto_190898 ?auto_190901 )
      ( MAKE-2PILE ?auto_190894 ?auto_190895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188885 - BLOCK
      ?auto_188886 - BLOCK
    )
    :vars
    (
      ?auto_188888 - BLOCK
      ?auto_188890 - BLOCK
      ?auto_188892 - BLOCK
      ?auto_188889 - BLOCK
      ?auto_188893 - BLOCK
      ?auto_188887 - BLOCK
      ?auto_188891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188888 ?auto_188886 ) ( ON-TABLE ?auto_188885 ) ( ON ?auto_188886 ?auto_188885 ) ( not ( = ?auto_188885 ?auto_188886 ) ) ( not ( = ?auto_188885 ?auto_188888 ) ) ( not ( = ?auto_188886 ?auto_188888 ) ) ( not ( = ?auto_188885 ?auto_188890 ) ) ( not ( = ?auto_188885 ?auto_188892 ) ) ( not ( = ?auto_188886 ?auto_188890 ) ) ( not ( = ?auto_188886 ?auto_188892 ) ) ( not ( = ?auto_188888 ?auto_188890 ) ) ( not ( = ?auto_188888 ?auto_188892 ) ) ( not ( = ?auto_188890 ?auto_188892 ) ) ( ON ?auto_188890 ?auto_188888 ) ( not ( = ?auto_188889 ?auto_188893 ) ) ( not ( = ?auto_188889 ?auto_188887 ) ) ( not ( = ?auto_188889 ?auto_188891 ) ) ( not ( = ?auto_188889 ?auto_188892 ) ) ( not ( = ?auto_188893 ?auto_188887 ) ) ( not ( = ?auto_188893 ?auto_188891 ) ) ( not ( = ?auto_188893 ?auto_188892 ) ) ( not ( = ?auto_188887 ?auto_188891 ) ) ( not ( = ?auto_188887 ?auto_188892 ) ) ( not ( = ?auto_188891 ?auto_188892 ) ) ( not ( = ?auto_188885 ?auto_188891 ) ) ( not ( = ?auto_188885 ?auto_188889 ) ) ( not ( = ?auto_188885 ?auto_188893 ) ) ( not ( = ?auto_188885 ?auto_188887 ) ) ( not ( = ?auto_188886 ?auto_188891 ) ) ( not ( = ?auto_188886 ?auto_188889 ) ) ( not ( = ?auto_188886 ?auto_188893 ) ) ( not ( = ?auto_188886 ?auto_188887 ) ) ( not ( = ?auto_188888 ?auto_188891 ) ) ( not ( = ?auto_188888 ?auto_188889 ) ) ( not ( = ?auto_188888 ?auto_188893 ) ) ( not ( = ?auto_188888 ?auto_188887 ) ) ( not ( = ?auto_188890 ?auto_188891 ) ) ( not ( = ?auto_188890 ?auto_188889 ) ) ( not ( = ?auto_188890 ?auto_188893 ) ) ( not ( = ?auto_188890 ?auto_188887 ) ) ( ON ?auto_188892 ?auto_188890 ) ( ON ?auto_188891 ?auto_188892 ) ( ON ?auto_188887 ?auto_188891 ) ( ON ?auto_188893 ?auto_188887 ) ( CLEAR ?auto_188893 ) ( HOLDING ?auto_188889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188889 )
      ( MAKE-2PILE ?auto_188885 ?auto_188886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188894 - BLOCK
      ?auto_188895 - BLOCK
    )
    :vars
    (
      ?auto_188896 - BLOCK
      ?auto_188898 - BLOCK
      ?auto_188899 - BLOCK
      ?auto_188897 - BLOCK
      ?auto_188902 - BLOCK
      ?auto_188901 - BLOCK
      ?auto_188900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188896 ?auto_188895 ) ( ON-TABLE ?auto_188894 ) ( ON ?auto_188895 ?auto_188894 ) ( not ( = ?auto_188894 ?auto_188895 ) ) ( not ( = ?auto_188894 ?auto_188896 ) ) ( not ( = ?auto_188895 ?auto_188896 ) ) ( not ( = ?auto_188894 ?auto_188898 ) ) ( not ( = ?auto_188894 ?auto_188899 ) ) ( not ( = ?auto_188895 ?auto_188898 ) ) ( not ( = ?auto_188895 ?auto_188899 ) ) ( not ( = ?auto_188896 ?auto_188898 ) ) ( not ( = ?auto_188896 ?auto_188899 ) ) ( not ( = ?auto_188898 ?auto_188899 ) ) ( ON ?auto_188898 ?auto_188896 ) ( not ( = ?auto_188897 ?auto_188902 ) ) ( not ( = ?auto_188897 ?auto_188901 ) ) ( not ( = ?auto_188897 ?auto_188900 ) ) ( not ( = ?auto_188897 ?auto_188899 ) ) ( not ( = ?auto_188902 ?auto_188901 ) ) ( not ( = ?auto_188902 ?auto_188900 ) ) ( not ( = ?auto_188902 ?auto_188899 ) ) ( not ( = ?auto_188901 ?auto_188900 ) ) ( not ( = ?auto_188901 ?auto_188899 ) ) ( not ( = ?auto_188900 ?auto_188899 ) ) ( not ( = ?auto_188894 ?auto_188900 ) ) ( not ( = ?auto_188894 ?auto_188897 ) ) ( not ( = ?auto_188894 ?auto_188902 ) ) ( not ( = ?auto_188894 ?auto_188901 ) ) ( not ( = ?auto_188895 ?auto_188900 ) ) ( not ( = ?auto_188895 ?auto_188897 ) ) ( not ( = ?auto_188895 ?auto_188902 ) ) ( not ( = ?auto_188895 ?auto_188901 ) ) ( not ( = ?auto_188896 ?auto_188900 ) ) ( not ( = ?auto_188896 ?auto_188897 ) ) ( not ( = ?auto_188896 ?auto_188902 ) ) ( not ( = ?auto_188896 ?auto_188901 ) ) ( not ( = ?auto_188898 ?auto_188900 ) ) ( not ( = ?auto_188898 ?auto_188897 ) ) ( not ( = ?auto_188898 ?auto_188902 ) ) ( not ( = ?auto_188898 ?auto_188901 ) ) ( ON ?auto_188899 ?auto_188898 ) ( ON ?auto_188900 ?auto_188899 ) ( ON ?auto_188901 ?auto_188900 ) ( ON ?auto_188902 ?auto_188901 ) ( ON ?auto_188897 ?auto_188902 ) ( CLEAR ?auto_188897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188894 ?auto_188895 ?auto_188896 ?auto_188898 ?auto_188899 ?auto_188900 ?auto_188901 ?auto_188902 )
      ( MAKE-2PILE ?auto_188894 ?auto_188895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188910 - BLOCK
      ?auto_188911 - BLOCK
      ?auto_188912 - BLOCK
      ?auto_188913 - BLOCK
      ?auto_188914 - BLOCK
      ?auto_188915 - BLOCK
      ?auto_188916 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188916 ) ( CLEAR ?auto_188915 ) ( ON-TABLE ?auto_188910 ) ( ON ?auto_188911 ?auto_188910 ) ( ON ?auto_188912 ?auto_188911 ) ( ON ?auto_188913 ?auto_188912 ) ( ON ?auto_188914 ?auto_188913 ) ( ON ?auto_188915 ?auto_188914 ) ( not ( = ?auto_188910 ?auto_188911 ) ) ( not ( = ?auto_188910 ?auto_188912 ) ) ( not ( = ?auto_188910 ?auto_188913 ) ) ( not ( = ?auto_188910 ?auto_188914 ) ) ( not ( = ?auto_188910 ?auto_188915 ) ) ( not ( = ?auto_188910 ?auto_188916 ) ) ( not ( = ?auto_188911 ?auto_188912 ) ) ( not ( = ?auto_188911 ?auto_188913 ) ) ( not ( = ?auto_188911 ?auto_188914 ) ) ( not ( = ?auto_188911 ?auto_188915 ) ) ( not ( = ?auto_188911 ?auto_188916 ) ) ( not ( = ?auto_188912 ?auto_188913 ) ) ( not ( = ?auto_188912 ?auto_188914 ) ) ( not ( = ?auto_188912 ?auto_188915 ) ) ( not ( = ?auto_188912 ?auto_188916 ) ) ( not ( = ?auto_188913 ?auto_188914 ) ) ( not ( = ?auto_188913 ?auto_188915 ) ) ( not ( = ?auto_188913 ?auto_188916 ) ) ( not ( = ?auto_188914 ?auto_188915 ) ) ( not ( = ?auto_188914 ?auto_188916 ) ) ( not ( = ?auto_188915 ?auto_188916 ) ) )
    :subtasks
    ( ( !STACK ?auto_188916 ?auto_188915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188917 - BLOCK
      ?auto_188918 - BLOCK
      ?auto_188919 - BLOCK
      ?auto_188920 - BLOCK
      ?auto_188921 - BLOCK
      ?auto_188922 - BLOCK
      ?auto_188923 - BLOCK
    )
    :vars
    (
      ?auto_188924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188922 ) ( ON-TABLE ?auto_188917 ) ( ON ?auto_188918 ?auto_188917 ) ( ON ?auto_188919 ?auto_188918 ) ( ON ?auto_188920 ?auto_188919 ) ( ON ?auto_188921 ?auto_188920 ) ( ON ?auto_188922 ?auto_188921 ) ( not ( = ?auto_188917 ?auto_188918 ) ) ( not ( = ?auto_188917 ?auto_188919 ) ) ( not ( = ?auto_188917 ?auto_188920 ) ) ( not ( = ?auto_188917 ?auto_188921 ) ) ( not ( = ?auto_188917 ?auto_188922 ) ) ( not ( = ?auto_188917 ?auto_188923 ) ) ( not ( = ?auto_188918 ?auto_188919 ) ) ( not ( = ?auto_188918 ?auto_188920 ) ) ( not ( = ?auto_188918 ?auto_188921 ) ) ( not ( = ?auto_188918 ?auto_188922 ) ) ( not ( = ?auto_188918 ?auto_188923 ) ) ( not ( = ?auto_188919 ?auto_188920 ) ) ( not ( = ?auto_188919 ?auto_188921 ) ) ( not ( = ?auto_188919 ?auto_188922 ) ) ( not ( = ?auto_188919 ?auto_188923 ) ) ( not ( = ?auto_188920 ?auto_188921 ) ) ( not ( = ?auto_188920 ?auto_188922 ) ) ( not ( = ?auto_188920 ?auto_188923 ) ) ( not ( = ?auto_188921 ?auto_188922 ) ) ( not ( = ?auto_188921 ?auto_188923 ) ) ( not ( = ?auto_188922 ?auto_188923 ) ) ( ON ?auto_188923 ?auto_188924 ) ( CLEAR ?auto_188923 ) ( HAND-EMPTY ) ( not ( = ?auto_188917 ?auto_188924 ) ) ( not ( = ?auto_188918 ?auto_188924 ) ) ( not ( = ?auto_188919 ?auto_188924 ) ) ( not ( = ?auto_188920 ?auto_188924 ) ) ( not ( = ?auto_188921 ?auto_188924 ) ) ( not ( = ?auto_188922 ?auto_188924 ) ) ( not ( = ?auto_188923 ?auto_188924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188923 ?auto_188924 )
      ( MAKE-7PILE ?auto_188917 ?auto_188918 ?auto_188919 ?auto_188920 ?auto_188921 ?auto_188922 ?auto_188923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188925 - BLOCK
      ?auto_188926 - BLOCK
      ?auto_188927 - BLOCK
      ?auto_188928 - BLOCK
      ?auto_188929 - BLOCK
      ?auto_188930 - BLOCK
      ?auto_188931 - BLOCK
    )
    :vars
    (
      ?auto_188932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188925 ) ( ON ?auto_188926 ?auto_188925 ) ( ON ?auto_188927 ?auto_188926 ) ( ON ?auto_188928 ?auto_188927 ) ( ON ?auto_188929 ?auto_188928 ) ( not ( = ?auto_188925 ?auto_188926 ) ) ( not ( = ?auto_188925 ?auto_188927 ) ) ( not ( = ?auto_188925 ?auto_188928 ) ) ( not ( = ?auto_188925 ?auto_188929 ) ) ( not ( = ?auto_188925 ?auto_188930 ) ) ( not ( = ?auto_188925 ?auto_188931 ) ) ( not ( = ?auto_188926 ?auto_188927 ) ) ( not ( = ?auto_188926 ?auto_188928 ) ) ( not ( = ?auto_188926 ?auto_188929 ) ) ( not ( = ?auto_188926 ?auto_188930 ) ) ( not ( = ?auto_188926 ?auto_188931 ) ) ( not ( = ?auto_188927 ?auto_188928 ) ) ( not ( = ?auto_188927 ?auto_188929 ) ) ( not ( = ?auto_188927 ?auto_188930 ) ) ( not ( = ?auto_188927 ?auto_188931 ) ) ( not ( = ?auto_188928 ?auto_188929 ) ) ( not ( = ?auto_188928 ?auto_188930 ) ) ( not ( = ?auto_188928 ?auto_188931 ) ) ( not ( = ?auto_188929 ?auto_188930 ) ) ( not ( = ?auto_188929 ?auto_188931 ) ) ( not ( = ?auto_188930 ?auto_188931 ) ) ( ON ?auto_188931 ?auto_188932 ) ( CLEAR ?auto_188931 ) ( not ( = ?auto_188925 ?auto_188932 ) ) ( not ( = ?auto_188926 ?auto_188932 ) ) ( not ( = ?auto_188927 ?auto_188932 ) ) ( not ( = ?auto_188928 ?auto_188932 ) ) ( not ( = ?auto_188929 ?auto_188932 ) ) ( not ( = ?auto_188930 ?auto_188932 ) ) ( not ( = ?auto_188931 ?auto_188932 ) ) ( HOLDING ?auto_188930 ) ( CLEAR ?auto_188929 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188925 ?auto_188926 ?auto_188927 ?auto_188928 ?auto_188929 ?auto_188930 )
      ( MAKE-7PILE ?auto_188925 ?auto_188926 ?auto_188927 ?auto_188928 ?auto_188929 ?auto_188930 ?auto_188931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188933 - BLOCK
      ?auto_188934 - BLOCK
      ?auto_188935 - BLOCK
      ?auto_188936 - BLOCK
      ?auto_188937 - BLOCK
      ?auto_188938 - BLOCK
      ?auto_188939 - BLOCK
    )
    :vars
    (
      ?auto_188940 - BLOCK
      ?auto_188941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188933 ) ( ON ?auto_188934 ?auto_188933 ) ( ON ?auto_188935 ?auto_188934 ) ( ON ?auto_188936 ?auto_188935 ) ( ON ?auto_188937 ?auto_188936 ) ( not ( = ?auto_188933 ?auto_188934 ) ) ( not ( = ?auto_188933 ?auto_188935 ) ) ( not ( = ?auto_188933 ?auto_188936 ) ) ( not ( = ?auto_188933 ?auto_188937 ) ) ( not ( = ?auto_188933 ?auto_188938 ) ) ( not ( = ?auto_188933 ?auto_188939 ) ) ( not ( = ?auto_188934 ?auto_188935 ) ) ( not ( = ?auto_188934 ?auto_188936 ) ) ( not ( = ?auto_188934 ?auto_188937 ) ) ( not ( = ?auto_188934 ?auto_188938 ) ) ( not ( = ?auto_188934 ?auto_188939 ) ) ( not ( = ?auto_188935 ?auto_188936 ) ) ( not ( = ?auto_188935 ?auto_188937 ) ) ( not ( = ?auto_188935 ?auto_188938 ) ) ( not ( = ?auto_188935 ?auto_188939 ) ) ( not ( = ?auto_188936 ?auto_188937 ) ) ( not ( = ?auto_188936 ?auto_188938 ) ) ( not ( = ?auto_188936 ?auto_188939 ) ) ( not ( = ?auto_188937 ?auto_188938 ) ) ( not ( = ?auto_188937 ?auto_188939 ) ) ( not ( = ?auto_188938 ?auto_188939 ) ) ( ON ?auto_188939 ?auto_188940 ) ( not ( = ?auto_188933 ?auto_188940 ) ) ( not ( = ?auto_188934 ?auto_188940 ) ) ( not ( = ?auto_188935 ?auto_188940 ) ) ( not ( = ?auto_188936 ?auto_188940 ) ) ( not ( = ?auto_188937 ?auto_188940 ) ) ( not ( = ?auto_188938 ?auto_188940 ) ) ( not ( = ?auto_188939 ?auto_188940 ) ) ( CLEAR ?auto_188937 ) ( ON ?auto_188938 ?auto_188939 ) ( CLEAR ?auto_188938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188941 ) ( ON ?auto_188940 ?auto_188941 ) ( not ( = ?auto_188941 ?auto_188940 ) ) ( not ( = ?auto_188941 ?auto_188939 ) ) ( not ( = ?auto_188941 ?auto_188938 ) ) ( not ( = ?auto_188933 ?auto_188941 ) ) ( not ( = ?auto_188934 ?auto_188941 ) ) ( not ( = ?auto_188935 ?auto_188941 ) ) ( not ( = ?auto_188936 ?auto_188941 ) ) ( not ( = ?auto_188937 ?auto_188941 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188941 ?auto_188940 ?auto_188939 )
      ( MAKE-7PILE ?auto_188933 ?auto_188934 ?auto_188935 ?auto_188936 ?auto_188937 ?auto_188938 ?auto_188939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188942 - BLOCK
      ?auto_188943 - BLOCK
      ?auto_188944 - BLOCK
      ?auto_188945 - BLOCK
      ?auto_188946 - BLOCK
      ?auto_188947 - BLOCK
      ?auto_188948 - BLOCK
    )
    :vars
    (
      ?auto_188950 - BLOCK
      ?auto_188949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188942 ) ( ON ?auto_188943 ?auto_188942 ) ( ON ?auto_188944 ?auto_188943 ) ( ON ?auto_188945 ?auto_188944 ) ( not ( = ?auto_188942 ?auto_188943 ) ) ( not ( = ?auto_188942 ?auto_188944 ) ) ( not ( = ?auto_188942 ?auto_188945 ) ) ( not ( = ?auto_188942 ?auto_188946 ) ) ( not ( = ?auto_188942 ?auto_188947 ) ) ( not ( = ?auto_188942 ?auto_188948 ) ) ( not ( = ?auto_188943 ?auto_188944 ) ) ( not ( = ?auto_188943 ?auto_188945 ) ) ( not ( = ?auto_188943 ?auto_188946 ) ) ( not ( = ?auto_188943 ?auto_188947 ) ) ( not ( = ?auto_188943 ?auto_188948 ) ) ( not ( = ?auto_188944 ?auto_188945 ) ) ( not ( = ?auto_188944 ?auto_188946 ) ) ( not ( = ?auto_188944 ?auto_188947 ) ) ( not ( = ?auto_188944 ?auto_188948 ) ) ( not ( = ?auto_188945 ?auto_188946 ) ) ( not ( = ?auto_188945 ?auto_188947 ) ) ( not ( = ?auto_188945 ?auto_188948 ) ) ( not ( = ?auto_188946 ?auto_188947 ) ) ( not ( = ?auto_188946 ?auto_188948 ) ) ( not ( = ?auto_188947 ?auto_188948 ) ) ( ON ?auto_188948 ?auto_188950 ) ( not ( = ?auto_188942 ?auto_188950 ) ) ( not ( = ?auto_188943 ?auto_188950 ) ) ( not ( = ?auto_188944 ?auto_188950 ) ) ( not ( = ?auto_188945 ?auto_188950 ) ) ( not ( = ?auto_188946 ?auto_188950 ) ) ( not ( = ?auto_188947 ?auto_188950 ) ) ( not ( = ?auto_188948 ?auto_188950 ) ) ( ON ?auto_188947 ?auto_188948 ) ( CLEAR ?auto_188947 ) ( ON-TABLE ?auto_188949 ) ( ON ?auto_188950 ?auto_188949 ) ( not ( = ?auto_188949 ?auto_188950 ) ) ( not ( = ?auto_188949 ?auto_188948 ) ) ( not ( = ?auto_188949 ?auto_188947 ) ) ( not ( = ?auto_188942 ?auto_188949 ) ) ( not ( = ?auto_188943 ?auto_188949 ) ) ( not ( = ?auto_188944 ?auto_188949 ) ) ( not ( = ?auto_188945 ?auto_188949 ) ) ( not ( = ?auto_188946 ?auto_188949 ) ) ( HOLDING ?auto_188946 ) ( CLEAR ?auto_188945 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188942 ?auto_188943 ?auto_188944 ?auto_188945 ?auto_188946 )
      ( MAKE-7PILE ?auto_188942 ?auto_188943 ?auto_188944 ?auto_188945 ?auto_188946 ?auto_188947 ?auto_188948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188951 - BLOCK
      ?auto_188952 - BLOCK
      ?auto_188953 - BLOCK
      ?auto_188954 - BLOCK
      ?auto_188955 - BLOCK
      ?auto_188956 - BLOCK
      ?auto_188957 - BLOCK
    )
    :vars
    (
      ?auto_188958 - BLOCK
      ?auto_188959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188951 ) ( ON ?auto_188952 ?auto_188951 ) ( ON ?auto_188953 ?auto_188952 ) ( ON ?auto_188954 ?auto_188953 ) ( not ( = ?auto_188951 ?auto_188952 ) ) ( not ( = ?auto_188951 ?auto_188953 ) ) ( not ( = ?auto_188951 ?auto_188954 ) ) ( not ( = ?auto_188951 ?auto_188955 ) ) ( not ( = ?auto_188951 ?auto_188956 ) ) ( not ( = ?auto_188951 ?auto_188957 ) ) ( not ( = ?auto_188952 ?auto_188953 ) ) ( not ( = ?auto_188952 ?auto_188954 ) ) ( not ( = ?auto_188952 ?auto_188955 ) ) ( not ( = ?auto_188952 ?auto_188956 ) ) ( not ( = ?auto_188952 ?auto_188957 ) ) ( not ( = ?auto_188953 ?auto_188954 ) ) ( not ( = ?auto_188953 ?auto_188955 ) ) ( not ( = ?auto_188953 ?auto_188956 ) ) ( not ( = ?auto_188953 ?auto_188957 ) ) ( not ( = ?auto_188954 ?auto_188955 ) ) ( not ( = ?auto_188954 ?auto_188956 ) ) ( not ( = ?auto_188954 ?auto_188957 ) ) ( not ( = ?auto_188955 ?auto_188956 ) ) ( not ( = ?auto_188955 ?auto_188957 ) ) ( not ( = ?auto_188956 ?auto_188957 ) ) ( ON ?auto_188957 ?auto_188958 ) ( not ( = ?auto_188951 ?auto_188958 ) ) ( not ( = ?auto_188952 ?auto_188958 ) ) ( not ( = ?auto_188953 ?auto_188958 ) ) ( not ( = ?auto_188954 ?auto_188958 ) ) ( not ( = ?auto_188955 ?auto_188958 ) ) ( not ( = ?auto_188956 ?auto_188958 ) ) ( not ( = ?auto_188957 ?auto_188958 ) ) ( ON ?auto_188956 ?auto_188957 ) ( ON-TABLE ?auto_188959 ) ( ON ?auto_188958 ?auto_188959 ) ( not ( = ?auto_188959 ?auto_188958 ) ) ( not ( = ?auto_188959 ?auto_188957 ) ) ( not ( = ?auto_188959 ?auto_188956 ) ) ( not ( = ?auto_188951 ?auto_188959 ) ) ( not ( = ?auto_188952 ?auto_188959 ) ) ( not ( = ?auto_188953 ?auto_188959 ) ) ( not ( = ?auto_188954 ?auto_188959 ) ) ( not ( = ?auto_188955 ?auto_188959 ) ) ( CLEAR ?auto_188954 ) ( ON ?auto_188955 ?auto_188956 ) ( CLEAR ?auto_188955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188959 ?auto_188958 ?auto_188957 ?auto_188956 )
      ( MAKE-7PILE ?auto_188951 ?auto_188952 ?auto_188953 ?auto_188954 ?auto_188955 ?auto_188956 ?auto_188957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188960 - BLOCK
      ?auto_188961 - BLOCK
      ?auto_188962 - BLOCK
      ?auto_188963 - BLOCK
      ?auto_188964 - BLOCK
      ?auto_188965 - BLOCK
      ?auto_188966 - BLOCK
    )
    :vars
    (
      ?auto_188967 - BLOCK
      ?auto_188968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188960 ) ( ON ?auto_188961 ?auto_188960 ) ( ON ?auto_188962 ?auto_188961 ) ( not ( = ?auto_188960 ?auto_188961 ) ) ( not ( = ?auto_188960 ?auto_188962 ) ) ( not ( = ?auto_188960 ?auto_188963 ) ) ( not ( = ?auto_188960 ?auto_188964 ) ) ( not ( = ?auto_188960 ?auto_188965 ) ) ( not ( = ?auto_188960 ?auto_188966 ) ) ( not ( = ?auto_188961 ?auto_188962 ) ) ( not ( = ?auto_188961 ?auto_188963 ) ) ( not ( = ?auto_188961 ?auto_188964 ) ) ( not ( = ?auto_188961 ?auto_188965 ) ) ( not ( = ?auto_188961 ?auto_188966 ) ) ( not ( = ?auto_188962 ?auto_188963 ) ) ( not ( = ?auto_188962 ?auto_188964 ) ) ( not ( = ?auto_188962 ?auto_188965 ) ) ( not ( = ?auto_188962 ?auto_188966 ) ) ( not ( = ?auto_188963 ?auto_188964 ) ) ( not ( = ?auto_188963 ?auto_188965 ) ) ( not ( = ?auto_188963 ?auto_188966 ) ) ( not ( = ?auto_188964 ?auto_188965 ) ) ( not ( = ?auto_188964 ?auto_188966 ) ) ( not ( = ?auto_188965 ?auto_188966 ) ) ( ON ?auto_188966 ?auto_188967 ) ( not ( = ?auto_188960 ?auto_188967 ) ) ( not ( = ?auto_188961 ?auto_188967 ) ) ( not ( = ?auto_188962 ?auto_188967 ) ) ( not ( = ?auto_188963 ?auto_188967 ) ) ( not ( = ?auto_188964 ?auto_188967 ) ) ( not ( = ?auto_188965 ?auto_188967 ) ) ( not ( = ?auto_188966 ?auto_188967 ) ) ( ON ?auto_188965 ?auto_188966 ) ( ON-TABLE ?auto_188968 ) ( ON ?auto_188967 ?auto_188968 ) ( not ( = ?auto_188968 ?auto_188967 ) ) ( not ( = ?auto_188968 ?auto_188966 ) ) ( not ( = ?auto_188968 ?auto_188965 ) ) ( not ( = ?auto_188960 ?auto_188968 ) ) ( not ( = ?auto_188961 ?auto_188968 ) ) ( not ( = ?auto_188962 ?auto_188968 ) ) ( not ( = ?auto_188963 ?auto_188968 ) ) ( not ( = ?auto_188964 ?auto_188968 ) ) ( ON ?auto_188964 ?auto_188965 ) ( CLEAR ?auto_188964 ) ( HOLDING ?auto_188963 ) ( CLEAR ?auto_188962 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188960 ?auto_188961 ?auto_188962 ?auto_188963 )
      ( MAKE-7PILE ?auto_188960 ?auto_188961 ?auto_188962 ?auto_188963 ?auto_188964 ?auto_188965 ?auto_188966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188969 - BLOCK
      ?auto_188970 - BLOCK
      ?auto_188971 - BLOCK
      ?auto_188972 - BLOCK
      ?auto_188973 - BLOCK
      ?auto_188974 - BLOCK
      ?auto_188975 - BLOCK
    )
    :vars
    (
      ?auto_188977 - BLOCK
      ?auto_188976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188969 ) ( ON ?auto_188970 ?auto_188969 ) ( ON ?auto_188971 ?auto_188970 ) ( not ( = ?auto_188969 ?auto_188970 ) ) ( not ( = ?auto_188969 ?auto_188971 ) ) ( not ( = ?auto_188969 ?auto_188972 ) ) ( not ( = ?auto_188969 ?auto_188973 ) ) ( not ( = ?auto_188969 ?auto_188974 ) ) ( not ( = ?auto_188969 ?auto_188975 ) ) ( not ( = ?auto_188970 ?auto_188971 ) ) ( not ( = ?auto_188970 ?auto_188972 ) ) ( not ( = ?auto_188970 ?auto_188973 ) ) ( not ( = ?auto_188970 ?auto_188974 ) ) ( not ( = ?auto_188970 ?auto_188975 ) ) ( not ( = ?auto_188971 ?auto_188972 ) ) ( not ( = ?auto_188971 ?auto_188973 ) ) ( not ( = ?auto_188971 ?auto_188974 ) ) ( not ( = ?auto_188971 ?auto_188975 ) ) ( not ( = ?auto_188972 ?auto_188973 ) ) ( not ( = ?auto_188972 ?auto_188974 ) ) ( not ( = ?auto_188972 ?auto_188975 ) ) ( not ( = ?auto_188973 ?auto_188974 ) ) ( not ( = ?auto_188973 ?auto_188975 ) ) ( not ( = ?auto_188974 ?auto_188975 ) ) ( ON ?auto_188975 ?auto_188977 ) ( not ( = ?auto_188969 ?auto_188977 ) ) ( not ( = ?auto_188970 ?auto_188977 ) ) ( not ( = ?auto_188971 ?auto_188977 ) ) ( not ( = ?auto_188972 ?auto_188977 ) ) ( not ( = ?auto_188973 ?auto_188977 ) ) ( not ( = ?auto_188974 ?auto_188977 ) ) ( not ( = ?auto_188975 ?auto_188977 ) ) ( ON ?auto_188974 ?auto_188975 ) ( ON-TABLE ?auto_188976 ) ( ON ?auto_188977 ?auto_188976 ) ( not ( = ?auto_188976 ?auto_188977 ) ) ( not ( = ?auto_188976 ?auto_188975 ) ) ( not ( = ?auto_188976 ?auto_188974 ) ) ( not ( = ?auto_188969 ?auto_188976 ) ) ( not ( = ?auto_188970 ?auto_188976 ) ) ( not ( = ?auto_188971 ?auto_188976 ) ) ( not ( = ?auto_188972 ?auto_188976 ) ) ( not ( = ?auto_188973 ?auto_188976 ) ) ( ON ?auto_188973 ?auto_188974 ) ( CLEAR ?auto_188971 ) ( ON ?auto_188972 ?auto_188973 ) ( CLEAR ?auto_188972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188976 ?auto_188977 ?auto_188975 ?auto_188974 ?auto_188973 )
      ( MAKE-7PILE ?auto_188969 ?auto_188970 ?auto_188971 ?auto_188972 ?auto_188973 ?auto_188974 ?auto_188975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188978 - BLOCK
      ?auto_188979 - BLOCK
      ?auto_188980 - BLOCK
      ?auto_188981 - BLOCK
      ?auto_188982 - BLOCK
      ?auto_188983 - BLOCK
      ?auto_188984 - BLOCK
    )
    :vars
    (
      ?auto_188986 - BLOCK
      ?auto_188985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188978 ) ( ON ?auto_188979 ?auto_188978 ) ( not ( = ?auto_188978 ?auto_188979 ) ) ( not ( = ?auto_188978 ?auto_188980 ) ) ( not ( = ?auto_188978 ?auto_188981 ) ) ( not ( = ?auto_188978 ?auto_188982 ) ) ( not ( = ?auto_188978 ?auto_188983 ) ) ( not ( = ?auto_188978 ?auto_188984 ) ) ( not ( = ?auto_188979 ?auto_188980 ) ) ( not ( = ?auto_188979 ?auto_188981 ) ) ( not ( = ?auto_188979 ?auto_188982 ) ) ( not ( = ?auto_188979 ?auto_188983 ) ) ( not ( = ?auto_188979 ?auto_188984 ) ) ( not ( = ?auto_188980 ?auto_188981 ) ) ( not ( = ?auto_188980 ?auto_188982 ) ) ( not ( = ?auto_188980 ?auto_188983 ) ) ( not ( = ?auto_188980 ?auto_188984 ) ) ( not ( = ?auto_188981 ?auto_188982 ) ) ( not ( = ?auto_188981 ?auto_188983 ) ) ( not ( = ?auto_188981 ?auto_188984 ) ) ( not ( = ?auto_188982 ?auto_188983 ) ) ( not ( = ?auto_188982 ?auto_188984 ) ) ( not ( = ?auto_188983 ?auto_188984 ) ) ( ON ?auto_188984 ?auto_188986 ) ( not ( = ?auto_188978 ?auto_188986 ) ) ( not ( = ?auto_188979 ?auto_188986 ) ) ( not ( = ?auto_188980 ?auto_188986 ) ) ( not ( = ?auto_188981 ?auto_188986 ) ) ( not ( = ?auto_188982 ?auto_188986 ) ) ( not ( = ?auto_188983 ?auto_188986 ) ) ( not ( = ?auto_188984 ?auto_188986 ) ) ( ON ?auto_188983 ?auto_188984 ) ( ON-TABLE ?auto_188985 ) ( ON ?auto_188986 ?auto_188985 ) ( not ( = ?auto_188985 ?auto_188986 ) ) ( not ( = ?auto_188985 ?auto_188984 ) ) ( not ( = ?auto_188985 ?auto_188983 ) ) ( not ( = ?auto_188978 ?auto_188985 ) ) ( not ( = ?auto_188979 ?auto_188985 ) ) ( not ( = ?auto_188980 ?auto_188985 ) ) ( not ( = ?auto_188981 ?auto_188985 ) ) ( not ( = ?auto_188982 ?auto_188985 ) ) ( ON ?auto_188982 ?auto_188983 ) ( ON ?auto_188981 ?auto_188982 ) ( CLEAR ?auto_188981 ) ( HOLDING ?auto_188980 ) ( CLEAR ?auto_188979 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188978 ?auto_188979 ?auto_188980 )
      ( MAKE-7PILE ?auto_188978 ?auto_188979 ?auto_188980 ?auto_188981 ?auto_188982 ?auto_188983 ?auto_188984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188987 - BLOCK
      ?auto_188988 - BLOCK
      ?auto_188989 - BLOCK
      ?auto_188990 - BLOCK
      ?auto_188991 - BLOCK
      ?auto_188992 - BLOCK
      ?auto_188993 - BLOCK
    )
    :vars
    (
      ?auto_188995 - BLOCK
      ?auto_188994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188987 ) ( ON ?auto_188988 ?auto_188987 ) ( not ( = ?auto_188987 ?auto_188988 ) ) ( not ( = ?auto_188987 ?auto_188989 ) ) ( not ( = ?auto_188987 ?auto_188990 ) ) ( not ( = ?auto_188987 ?auto_188991 ) ) ( not ( = ?auto_188987 ?auto_188992 ) ) ( not ( = ?auto_188987 ?auto_188993 ) ) ( not ( = ?auto_188988 ?auto_188989 ) ) ( not ( = ?auto_188988 ?auto_188990 ) ) ( not ( = ?auto_188988 ?auto_188991 ) ) ( not ( = ?auto_188988 ?auto_188992 ) ) ( not ( = ?auto_188988 ?auto_188993 ) ) ( not ( = ?auto_188989 ?auto_188990 ) ) ( not ( = ?auto_188989 ?auto_188991 ) ) ( not ( = ?auto_188989 ?auto_188992 ) ) ( not ( = ?auto_188989 ?auto_188993 ) ) ( not ( = ?auto_188990 ?auto_188991 ) ) ( not ( = ?auto_188990 ?auto_188992 ) ) ( not ( = ?auto_188990 ?auto_188993 ) ) ( not ( = ?auto_188991 ?auto_188992 ) ) ( not ( = ?auto_188991 ?auto_188993 ) ) ( not ( = ?auto_188992 ?auto_188993 ) ) ( ON ?auto_188993 ?auto_188995 ) ( not ( = ?auto_188987 ?auto_188995 ) ) ( not ( = ?auto_188988 ?auto_188995 ) ) ( not ( = ?auto_188989 ?auto_188995 ) ) ( not ( = ?auto_188990 ?auto_188995 ) ) ( not ( = ?auto_188991 ?auto_188995 ) ) ( not ( = ?auto_188992 ?auto_188995 ) ) ( not ( = ?auto_188993 ?auto_188995 ) ) ( ON ?auto_188992 ?auto_188993 ) ( ON-TABLE ?auto_188994 ) ( ON ?auto_188995 ?auto_188994 ) ( not ( = ?auto_188994 ?auto_188995 ) ) ( not ( = ?auto_188994 ?auto_188993 ) ) ( not ( = ?auto_188994 ?auto_188992 ) ) ( not ( = ?auto_188987 ?auto_188994 ) ) ( not ( = ?auto_188988 ?auto_188994 ) ) ( not ( = ?auto_188989 ?auto_188994 ) ) ( not ( = ?auto_188990 ?auto_188994 ) ) ( not ( = ?auto_188991 ?auto_188994 ) ) ( ON ?auto_188991 ?auto_188992 ) ( ON ?auto_188990 ?auto_188991 ) ( CLEAR ?auto_188988 ) ( ON ?auto_188989 ?auto_188990 ) ( CLEAR ?auto_188989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188994 ?auto_188995 ?auto_188993 ?auto_188992 ?auto_188991 ?auto_188990 )
      ( MAKE-7PILE ?auto_188987 ?auto_188988 ?auto_188989 ?auto_188990 ?auto_188991 ?auto_188992 ?auto_188993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188996 - BLOCK
      ?auto_188997 - BLOCK
      ?auto_188998 - BLOCK
      ?auto_188999 - BLOCK
      ?auto_189000 - BLOCK
      ?auto_189001 - BLOCK
      ?auto_189002 - BLOCK
    )
    :vars
    (
      ?auto_189003 - BLOCK
      ?auto_189004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188996 ) ( not ( = ?auto_188996 ?auto_188997 ) ) ( not ( = ?auto_188996 ?auto_188998 ) ) ( not ( = ?auto_188996 ?auto_188999 ) ) ( not ( = ?auto_188996 ?auto_189000 ) ) ( not ( = ?auto_188996 ?auto_189001 ) ) ( not ( = ?auto_188996 ?auto_189002 ) ) ( not ( = ?auto_188997 ?auto_188998 ) ) ( not ( = ?auto_188997 ?auto_188999 ) ) ( not ( = ?auto_188997 ?auto_189000 ) ) ( not ( = ?auto_188997 ?auto_189001 ) ) ( not ( = ?auto_188997 ?auto_189002 ) ) ( not ( = ?auto_188998 ?auto_188999 ) ) ( not ( = ?auto_188998 ?auto_189000 ) ) ( not ( = ?auto_188998 ?auto_189001 ) ) ( not ( = ?auto_188998 ?auto_189002 ) ) ( not ( = ?auto_188999 ?auto_189000 ) ) ( not ( = ?auto_188999 ?auto_189001 ) ) ( not ( = ?auto_188999 ?auto_189002 ) ) ( not ( = ?auto_189000 ?auto_189001 ) ) ( not ( = ?auto_189000 ?auto_189002 ) ) ( not ( = ?auto_189001 ?auto_189002 ) ) ( ON ?auto_189002 ?auto_189003 ) ( not ( = ?auto_188996 ?auto_189003 ) ) ( not ( = ?auto_188997 ?auto_189003 ) ) ( not ( = ?auto_188998 ?auto_189003 ) ) ( not ( = ?auto_188999 ?auto_189003 ) ) ( not ( = ?auto_189000 ?auto_189003 ) ) ( not ( = ?auto_189001 ?auto_189003 ) ) ( not ( = ?auto_189002 ?auto_189003 ) ) ( ON ?auto_189001 ?auto_189002 ) ( ON-TABLE ?auto_189004 ) ( ON ?auto_189003 ?auto_189004 ) ( not ( = ?auto_189004 ?auto_189003 ) ) ( not ( = ?auto_189004 ?auto_189002 ) ) ( not ( = ?auto_189004 ?auto_189001 ) ) ( not ( = ?auto_188996 ?auto_189004 ) ) ( not ( = ?auto_188997 ?auto_189004 ) ) ( not ( = ?auto_188998 ?auto_189004 ) ) ( not ( = ?auto_188999 ?auto_189004 ) ) ( not ( = ?auto_189000 ?auto_189004 ) ) ( ON ?auto_189000 ?auto_189001 ) ( ON ?auto_188999 ?auto_189000 ) ( ON ?auto_188998 ?auto_188999 ) ( CLEAR ?auto_188998 ) ( HOLDING ?auto_188997 ) ( CLEAR ?auto_188996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188996 ?auto_188997 )
      ( MAKE-7PILE ?auto_188996 ?auto_188997 ?auto_188998 ?auto_188999 ?auto_189000 ?auto_189001 ?auto_189002 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189005 - BLOCK
      ?auto_189006 - BLOCK
      ?auto_189007 - BLOCK
      ?auto_189008 - BLOCK
      ?auto_189009 - BLOCK
      ?auto_189010 - BLOCK
      ?auto_189011 - BLOCK
    )
    :vars
    (
      ?auto_189012 - BLOCK
      ?auto_189013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189005 ) ( not ( = ?auto_189005 ?auto_189006 ) ) ( not ( = ?auto_189005 ?auto_189007 ) ) ( not ( = ?auto_189005 ?auto_189008 ) ) ( not ( = ?auto_189005 ?auto_189009 ) ) ( not ( = ?auto_189005 ?auto_189010 ) ) ( not ( = ?auto_189005 ?auto_189011 ) ) ( not ( = ?auto_189006 ?auto_189007 ) ) ( not ( = ?auto_189006 ?auto_189008 ) ) ( not ( = ?auto_189006 ?auto_189009 ) ) ( not ( = ?auto_189006 ?auto_189010 ) ) ( not ( = ?auto_189006 ?auto_189011 ) ) ( not ( = ?auto_189007 ?auto_189008 ) ) ( not ( = ?auto_189007 ?auto_189009 ) ) ( not ( = ?auto_189007 ?auto_189010 ) ) ( not ( = ?auto_189007 ?auto_189011 ) ) ( not ( = ?auto_189008 ?auto_189009 ) ) ( not ( = ?auto_189008 ?auto_189010 ) ) ( not ( = ?auto_189008 ?auto_189011 ) ) ( not ( = ?auto_189009 ?auto_189010 ) ) ( not ( = ?auto_189009 ?auto_189011 ) ) ( not ( = ?auto_189010 ?auto_189011 ) ) ( ON ?auto_189011 ?auto_189012 ) ( not ( = ?auto_189005 ?auto_189012 ) ) ( not ( = ?auto_189006 ?auto_189012 ) ) ( not ( = ?auto_189007 ?auto_189012 ) ) ( not ( = ?auto_189008 ?auto_189012 ) ) ( not ( = ?auto_189009 ?auto_189012 ) ) ( not ( = ?auto_189010 ?auto_189012 ) ) ( not ( = ?auto_189011 ?auto_189012 ) ) ( ON ?auto_189010 ?auto_189011 ) ( ON-TABLE ?auto_189013 ) ( ON ?auto_189012 ?auto_189013 ) ( not ( = ?auto_189013 ?auto_189012 ) ) ( not ( = ?auto_189013 ?auto_189011 ) ) ( not ( = ?auto_189013 ?auto_189010 ) ) ( not ( = ?auto_189005 ?auto_189013 ) ) ( not ( = ?auto_189006 ?auto_189013 ) ) ( not ( = ?auto_189007 ?auto_189013 ) ) ( not ( = ?auto_189008 ?auto_189013 ) ) ( not ( = ?auto_189009 ?auto_189013 ) ) ( ON ?auto_189009 ?auto_189010 ) ( ON ?auto_189008 ?auto_189009 ) ( ON ?auto_189007 ?auto_189008 ) ( CLEAR ?auto_189005 ) ( ON ?auto_189006 ?auto_189007 ) ( CLEAR ?auto_189006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189013 ?auto_189012 ?auto_189011 ?auto_189010 ?auto_189009 ?auto_189008 ?auto_189007 )
      ( MAKE-7PILE ?auto_189005 ?auto_189006 ?auto_189007 ?auto_189008 ?auto_189009 ?auto_189010 ?auto_189011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189014 - BLOCK
      ?auto_189015 - BLOCK
      ?auto_189016 - BLOCK
      ?auto_189017 - BLOCK
      ?auto_189018 - BLOCK
      ?auto_189019 - BLOCK
      ?auto_189020 - BLOCK
    )
    :vars
    (
      ?auto_189022 - BLOCK
      ?auto_189021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189014 ?auto_189015 ) ) ( not ( = ?auto_189014 ?auto_189016 ) ) ( not ( = ?auto_189014 ?auto_189017 ) ) ( not ( = ?auto_189014 ?auto_189018 ) ) ( not ( = ?auto_189014 ?auto_189019 ) ) ( not ( = ?auto_189014 ?auto_189020 ) ) ( not ( = ?auto_189015 ?auto_189016 ) ) ( not ( = ?auto_189015 ?auto_189017 ) ) ( not ( = ?auto_189015 ?auto_189018 ) ) ( not ( = ?auto_189015 ?auto_189019 ) ) ( not ( = ?auto_189015 ?auto_189020 ) ) ( not ( = ?auto_189016 ?auto_189017 ) ) ( not ( = ?auto_189016 ?auto_189018 ) ) ( not ( = ?auto_189016 ?auto_189019 ) ) ( not ( = ?auto_189016 ?auto_189020 ) ) ( not ( = ?auto_189017 ?auto_189018 ) ) ( not ( = ?auto_189017 ?auto_189019 ) ) ( not ( = ?auto_189017 ?auto_189020 ) ) ( not ( = ?auto_189018 ?auto_189019 ) ) ( not ( = ?auto_189018 ?auto_189020 ) ) ( not ( = ?auto_189019 ?auto_189020 ) ) ( ON ?auto_189020 ?auto_189022 ) ( not ( = ?auto_189014 ?auto_189022 ) ) ( not ( = ?auto_189015 ?auto_189022 ) ) ( not ( = ?auto_189016 ?auto_189022 ) ) ( not ( = ?auto_189017 ?auto_189022 ) ) ( not ( = ?auto_189018 ?auto_189022 ) ) ( not ( = ?auto_189019 ?auto_189022 ) ) ( not ( = ?auto_189020 ?auto_189022 ) ) ( ON ?auto_189019 ?auto_189020 ) ( ON-TABLE ?auto_189021 ) ( ON ?auto_189022 ?auto_189021 ) ( not ( = ?auto_189021 ?auto_189022 ) ) ( not ( = ?auto_189021 ?auto_189020 ) ) ( not ( = ?auto_189021 ?auto_189019 ) ) ( not ( = ?auto_189014 ?auto_189021 ) ) ( not ( = ?auto_189015 ?auto_189021 ) ) ( not ( = ?auto_189016 ?auto_189021 ) ) ( not ( = ?auto_189017 ?auto_189021 ) ) ( not ( = ?auto_189018 ?auto_189021 ) ) ( ON ?auto_189018 ?auto_189019 ) ( ON ?auto_189017 ?auto_189018 ) ( ON ?auto_189016 ?auto_189017 ) ( ON ?auto_189015 ?auto_189016 ) ( CLEAR ?auto_189015 ) ( HOLDING ?auto_189014 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189014 )
      ( MAKE-7PILE ?auto_189014 ?auto_189015 ?auto_189016 ?auto_189017 ?auto_189018 ?auto_189019 ?auto_189020 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189023 - BLOCK
      ?auto_189024 - BLOCK
      ?auto_189025 - BLOCK
      ?auto_189026 - BLOCK
      ?auto_189027 - BLOCK
      ?auto_189028 - BLOCK
      ?auto_189029 - BLOCK
    )
    :vars
    (
      ?auto_189030 - BLOCK
      ?auto_189031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189023 ?auto_189024 ) ) ( not ( = ?auto_189023 ?auto_189025 ) ) ( not ( = ?auto_189023 ?auto_189026 ) ) ( not ( = ?auto_189023 ?auto_189027 ) ) ( not ( = ?auto_189023 ?auto_189028 ) ) ( not ( = ?auto_189023 ?auto_189029 ) ) ( not ( = ?auto_189024 ?auto_189025 ) ) ( not ( = ?auto_189024 ?auto_189026 ) ) ( not ( = ?auto_189024 ?auto_189027 ) ) ( not ( = ?auto_189024 ?auto_189028 ) ) ( not ( = ?auto_189024 ?auto_189029 ) ) ( not ( = ?auto_189025 ?auto_189026 ) ) ( not ( = ?auto_189025 ?auto_189027 ) ) ( not ( = ?auto_189025 ?auto_189028 ) ) ( not ( = ?auto_189025 ?auto_189029 ) ) ( not ( = ?auto_189026 ?auto_189027 ) ) ( not ( = ?auto_189026 ?auto_189028 ) ) ( not ( = ?auto_189026 ?auto_189029 ) ) ( not ( = ?auto_189027 ?auto_189028 ) ) ( not ( = ?auto_189027 ?auto_189029 ) ) ( not ( = ?auto_189028 ?auto_189029 ) ) ( ON ?auto_189029 ?auto_189030 ) ( not ( = ?auto_189023 ?auto_189030 ) ) ( not ( = ?auto_189024 ?auto_189030 ) ) ( not ( = ?auto_189025 ?auto_189030 ) ) ( not ( = ?auto_189026 ?auto_189030 ) ) ( not ( = ?auto_189027 ?auto_189030 ) ) ( not ( = ?auto_189028 ?auto_189030 ) ) ( not ( = ?auto_189029 ?auto_189030 ) ) ( ON ?auto_189028 ?auto_189029 ) ( ON-TABLE ?auto_189031 ) ( ON ?auto_189030 ?auto_189031 ) ( not ( = ?auto_189031 ?auto_189030 ) ) ( not ( = ?auto_189031 ?auto_189029 ) ) ( not ( = ?auto_189031 ?auto_189028 ) ) ( not ( = ?auto_189023 ?auto_189031 ) ) ( not ( = ?auto_189024 ?auto_189031 ) ) ( not ( = ?auto_189025 ?auto_189031 ) ) ( not ( = ?auto_189026 ?auto_189031 ) ) ( not ( = ?auto_189027 ?auto_189031 ) ) ( ON ?auto_189027 ?auto_189028 ) ( ON ?auto_189026 ?auto_189027 ) ( ON ?auto_189025 ?auto_189026 ) ( ON ?auto_189024 ?auto_189025 ) ( ON ?auto_189023 ?auto_189024 ) ( CLEAR ?auto_189023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189031 ?auto_189030 ?auto_189029 ?auto_189028 ?auto_189027 ?auto_189026 ?auto_189025 ?auto_189024 )
      ( MAKE-7PILE ?auto_189023 ?auto_189024 ?auto_189025 ?auto_189026 ?auto_189027 ?auto_189028 ?auto_189029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189033 - BLOCK
    )
    :vars
    (
      ?auto_189034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189034 ?auto_189033 ) ( CLEAR ?auto_189034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189033 ) ( not ( = ?auto_189033 ?auto_189034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189034 ?auto_189033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189035 - BLOCK
    )
    :vars
    (
      ?auto_189036 - BLOCK
      ?auto_189037 - BLOCK
      ?auto_189038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189036 ?auto_189035 ) ( CLEAR ?auto_189036 ) ( ON-TABLE ?auto_189035 ) ( not ( = ?auto_189035 ?auto_189036 ) ) ( HOLDING ?auto_189037 ) ( CLEAR ?auto_189038 ) ( not ( = ?auto_189035 ?auto_189037 ) ) ( not ( = ?auto_189035 ?auto_189038 ) ) ( not ( = ?auto_189036 ?auto_189037 ) ) ( not ( = ?auto_189036 ?auto_189038 ) ) ( not ( = ?auto_189037 ?auto_189038 ) ) )
    :subtasks
    ( ( !STACK ?auto_189037 ?auto_189038 )
      ( MAKE-1PILE ?auto_189035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189039 - BLOCK
    )
    :vars
    (
      ?auto_189041 - BLOCK
      ?auto_189042 - BLOCK
      ?auto_189040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189041 ?auto_189039 ) ( ON-TABLE ?auto_189039 ) ( not ( = ?auto_189039 ?auto_189041 ) ) ( CLEAR ?auto_189042 ) ( not ( = ?auto_189039 ?auto_189040 ) ) ( not ( = ?auto_189039 ?auto_189042 ) ) ( not ( = ?auto_189041 ?auto_189040 ) ) ( not ( = ?auto_189041 ?auto_189042 ) ) ( not ( = ?auto_189040 ?auto_189042 ) ) ( ON ?auto_189040 ?auto_189041 ) ( CLEAR ?auto_189040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189039 ?auto_189041 )
      ( MAKE-1PILE ?auto_189039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189043 - BLOCK
    )
    :vars
    (
      ?auto_189044 - BLOCK
      ?auto_189046 - BLOCK
      ?auto_189045 - BLOCK
      ?auto_189048 - BLOCK
      ?auto_189051 - BLOCK
      ?auto_189047 - BLOCK
      ?auto_189049 - BLOCK
      ?auto_189050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189044 ?auto_189043 ) ( ON-TABLE ?auto_189043 ) ( not ( = ?auto_189043 ?auto_189044 ) ) ( not ( = ?auto_189043 ?auto_189046 ) ) ( not ( = ?auto_189043 ?auto_189045 ) ) ( not ( = ?auto_189044 ?auto_189046 ) ) ( not ( = ?auto_189044 ?auto_189045 ) ) ( not ( = ?auto_189046 ?auto_189045 ) ) ( ON ?auto_189046 ?auto_189044 ) ( CLEAR ?auto_189046 ) ( HOLDING ?auto_189045 ) ( CLEAR ?auto_189048 ) ( ON-TABLE ?auto_189051 ) ( ON ?auto_189047 ?auto_189051 ) ( ON ?auto_189049 ?auto_189047 ) ( ON ?auto_189050 ?auto_189049 ) ( ON ?auto_189048 ?auto_189050 ) ( not ( = ?auto_189051 ?auto_189047 ) ) ( not ( = ?auto_189051 ?auto_189049 ) ) ( not ( = ?auto_189051 ?auto_189050 ) ) ( not ( = ?auto_189051 ?auto_189048 ) ) ( not ( = ?auto_189051 ?auto_189045 ) ) ( not ( = ?auto_189047 ?auto_189049 ) ) ( not ( = ?auto_189047 ?auto_189050 ) ) ( not ( = ?auto_189047 ?auto_189048 ) ) ( not ( = ?auto_189047 ?auto_189045 ) ) ( not ( = ?auto_189049 ?auto_189050 ) ) ( not ( = ?auto_189049 ?auto_189048 ) ) ( not ( = ?auto_189049 ?auto_189045 ) ) ( not ( = ?auto_189050 ?auto_189048 ) ) ( not ( = ?auto_189050 ?auto_189045 ) ) ( not ( = ?auto_189048 ?auto_189045 ) ) ( not ( = ?auto_189043 ?auto_189048 ) ) ( not ( = ?auto_189043 ?auto_189051 ) ) ( not ( = ?auto_189043 ?auto_189047 ) ) ( not ( = ?auto_189043 ?auto_189049 ) ) ( not ( = ?auto_189043 ?auto_189050 ) ) ( not ( = ?auto_189044 ?auto_189048 ) ) ( not ( = ?auto_189044 ?auto_189051 ) ) ( not ( = ?auto_189044 ?auto_189047 ) ) ( not ( = ?auto_189044 ?auto_189049 ) ) ( not ( = ?auto_189044 ?auto_189050 ) ) ( not ( = ?auto_189046 ?auto_189048 ) ) ( not ( = ?auto_189046 ?auto_189051 ) ) ( not ( = ?auto_189046 ?auto_189047 ) ) ( not ( = ?auto_189046 ?auto_189049 ) ) ( not ( = ?auto_189046 ?auto_189050 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189051 ?auto_189047 ?auto_189049 ?auto_189050 ?auto_189048 ?auto_189045 )
      ( MAKE-1PILE ?auto_189043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189052 - BLOCK
    )
    :vars
    (
      ?auto_189054 - BLOCK
      ?auto_189057 - BLOCK
      ?auto_189053 - BLOCK
      ?auto_189056 - BLOCK
      ?auto_189055 - BLOCK
      ?auto_189060 - BLOCK
      ?auto_189059 - BLOCK
      ?auto_189058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189054 ?auto_189052 ) ( ON-TABLE ?auto_189052 ) ( not ( = ?auto_189052 ?auto_189054 ) ) ( not ( = ?auto_189052 ?auto_189057 ) ) ( not ( = ?auto_189052 ?auto_189053 ) ) ( not ( = ?auto_189054 ?auto_189057 ) ) ( not ( = ?auto_189054 ?auto_189053 ) ) ( not ( = ?auto_189057 ?auto_189053 ) ) ( ON ?auto_189057 ?auto_189054 ) ( CLEAR ?auto_189056 ) ( ON-TABLE ?auto_189055 ) ( ON ?auto_189060 ?auto_189055 ) ( ON ?auto_189059 ?auto_189060 ) ( ON ?auto_189058 ?auto_189059 ) ( ON ?auto_189056 ?auto_189058 ) ( not ( = ?auto_189055 ?auto_189060 ) ) ( not ( = ?auto_189055 ?auto_189059 ) ) ( not ( = ?auto_189055 ?auto_189058 ) ) ( not ( = ?auto_189055 ?auto_189056 ) ) ( not ( = ?auto_189055 ?auto_189053 ) ) ( not ( = ?auto_189060 ?auto_189059 ) ) ( not ( = ?auto_189060 ?auto_189058 ) ) ( not ( = ?auto_189060 ?auto_189056 ) ) ( not ( = ?auto_189060 ?auto_189053 ) ) ( not ( = ?auto_189059 ?auto_189058 ) ) ( not ( = ?auto_189059 ?auto_189056 ) ) ( not ( = ?auto_189059 ?auto_189053 ) ) ( not ( = ?auto_189058 ?auto_189056 ) ) ( not ( = ?auto_189058 ?auto_189053 ) ) ( not ( = ?auto_189056 ?auto_189053 ) ) ( not ( = ?auto_189052 ?auto_189056 ) ) ( not ( = ?auto_189052 ?auto_189055 ) ) ( not ( = ?auto_189052 ?auto_189060 ) ) ( not ( = ?auto_189052 ?auto_189059 ) ) ( not ( = ?auto_189052 ?auto_189058 ) ) ( not ( = ?auto_189054 ?auto_189056 ) ) ( not ( = ?auto_189054 ?auto_189055 ) ) ( not ( = ?auto_189054 ?auto_189060 ) ) ( not ( = ?auto_189054 ?auto_189059 ) ) ( not ( = ?auto_189054 ?auto_189058 ) ) ( not ( = ?auto_189057 ?auto_189056 ) ) ( not ( = ?auto_189057 ?auto_189055 ) ) ( not ( = ?auto_189057 ?auto_189060 ) ) ( not ( = ?auto_189057 ?auto_189059 ) ) ( not ( = ?auto_189057 ?auto_189058 ) ) ( ON ?auto_189053 ?auto_189057 ) ( CLEAR ?auto_189053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189052 ?auto_189054 ?auto_189057 )
      ( MAKE-1PILE ?auto_189052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189061 - BLOCK
    )
    :vars
    (
      ?auto_189066 - BLOCK
      ?auto_189067 - BLOCK
      ?auto_189065 - BLOCK
      ?auto_189063 - BLOCK
      ?auto_189062 - BLOCK
      ?auto_189069 - BLOCK
      ?auto_189064 - BLOCK
      ?auto_189068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189066 ?auto_189061 ) ( ON-TABLE ?auto_189061 ) ( not ( = ?auto_189061 ?auto_189066 ) ) ( not ( = ?auto_189061 ?auto_189067 ) ) ( not ( = ?auto_189061 ?auto_189065 ) ) ( not ( = ?auto_189066 ?auto_189067 ) ) ( not ( = ?auto_189066 ?auto_189065 ) ) ( not ( = ?auto_189067 ?auto_189065 ) ) ( ON ?auto_189067 ?auto_189066 ) ( ON-TABLE ?auto_189063 ) ( ON ?auto_189062 ?auto_189063 ) ( ON ?auto_189069 ?auto_189062 ) ( ON ?auto_189064 ?auto_189069 ) ( not ( = ?auto_189063 ?auto_189062 ) ) ( not ( = ?auto_189063 ?auto_189069 ) ) ( not ( = ?auto_189063 ?auto_189064 ) ) ( not ( = ?auto_189063 ?auto_189068 ) ) ( not ( = ?auto_189063 ?auto_189065 ) ) ( not ( = ?auto_189062 ?auto_189069 ) ) ( not ( = ?auto_189062 ?auto_189064 ) ) ( not ( = ?auto_189062 ?auto_189068 ) ) ( not ( = ?auto_189062 ?auto_189065 ) ) ( not ( = ?auto_189069 ?auto_189064 ) ) ( not ( = ?auto_189069 ?auto_189068 ) ) ( not ( = ?auto_189069 ?auto_189065 ) ) ( not ( = ?auto_189064 ?auto_189068 ) ) ( not ( = ?auto_189064 ?auto_189065 ) ) ( not ( = ?auto_189068 ?auto_189065 ) ) ( not ( = ?auto_189061 ?auto_189068 ) ) ( not ( = ?auto_189061 ?auto_189063 ) ) ( not ( = ?auto_189061 ?auto_189062 ) ) ( not ( = ?auto_189061 ?auto_189069 ) ) ( not ( = ?auto_189061 ?auto_189064 ) ) ( not ( = ?auto_189066 ?auto_189068 ) ) ( not ( = ?auto_189066 ?auto_189063 ) ) ( not ( = ?auto_189066 ?auto_189062 ) ) ( not ( = ?auto_189066 ?auto_189069 ) ) ( not ( = ?auto_189066 ?auto_189064 ) ) ( not ( = ?auto_189067 ?auto_189068 ) ) ( not ( = ?auto_189067 ?auto_189063 ) ) ( not ( = ?auto_189067 ?auto_189062 ) ) ( not ( = ?auto_189067 ?auto_189069 ) ) ( not ( = ?auto_189067 ?auto_189064 ) ) ( ON ?auto_189065 ?auto_189067 ) ( CLEAR ?auto_189065 ) ( HOLDING ?auto_189068 ) ( CLEAR ?auto_189064 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189063 ?auto_189062 ?auto_189069 ?auto_189064 ?auto_189068 )
      ( MAKE-1PILE ?auto_189061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189070 - BLOCK
    )
    :vars
    (
      ?auto_189077 - BLOCK
      ?auto_189078 - BLOCK
      ?auto_189073 - BLOCK
      ?auto_189072 - BLOCK
      ?auto_189075 - BLOCK
      ?auto_189071 - BLOCK
      ?auto_189076 - BLOCK
      ?auto_189074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189077 ?auto_189070 ) ( ON-TABLE ?auto_189070 ) ( not ( = ?auto_189070 ?auto_189077 ) ) ( not ( = ?auto_189070 ?auto_189078 ) ) ( not ( = ?auto_189070 ?auto_189073 ) ) ( not ( = ?auto_189077 ?auto_189078 ) ) ( not ( = ?auto_189077 ?auto_189073 ) ) ( not ( = ?auto_189078 ?auto_189073 ) ) ( ON ?auto_189078 ?auto_189077 ) ( ON-TABLE ?auto_189072 ) ( ON ?auto_189075 ?auto_189072 ) ( ON ?auto_189071 ?auto_189075 ) ( ON ?auto_189076 ?auto_189071 ) ( not ( = ?auto_189072 ?auto_189075 ) ) ( not ( = ?auto_189072 ?auto_189071 ) ) ( not ( = ?auto_189072 ?auto_189076 ) ) ( not ( = ?auto_189072 ?auto_189074 ) ) ( not ( = ?auto_189072 ?auto_189073 ) ) ( not ( = ?auto_189075 ?auto_189071 ) ) ( not ( = ?auto_189075 ?auto_189076 ) ) ( not ( = ?auto_189075 ?auto_189074 ) ) ( not ( = ?auto_189075 ?auto_189073 ) ) ( not ( = ?auto_189071 ?auto_189076 ) ) ( not ( = ?auto_189071 ?auto_189074 ) ) ( not ( = ?auto_189071 ?auto_189073 ) ) ( not ( = ?auto_189076 ?auto_189074 ) ) ( not ( = ?auto_189076 ?auto_189073 ) ) ( not ( = ?auto_189074 ?auto_189073 ) ) ( not ( = ?auto_189070 ?auto_189074 ) ) ( not ( = ?auto_189070 ?auto_189072 ) ) ( not ( = ?auto_189070 ?auto_189075 ) ) ( not ( = ?auto_189070 ?auto_189071 ) ) ( not ( = ?auto_189070 ?auto_189076 ) ) ( not ( = ?auto_189077 ?auto_189074 ) ) ( not ( = ?auto_189077 ?auto_189072 ) ) ( not ( = ?auto_189077 ?auto_189075 ) ) ( not ( = ?auto_189077 ?auto_189071 ) ) ( not ( = ?auto_189077 ?auto_189076 ) ) ( not ( = ?auto_189078 ?auto_189074 ) ) ( not ( = ?auto_189078 ?auto_189072 ) ) ( not ( = ?auto_189078 ?auto_189075 ) ) ( not ( = ?auto_189078 ?auto_189071 ) ) ( not ( = ?auto_189078 ?auto_189076 ) ) ( ON ?auto_189073 ?auto_189078 ) ( CLEAR ?auto_189076 ) ( ON ?auto_189074 ?auto_189073 ) ( CLEAR ?auto_189074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189070 ?auto_189077 ?auto_189078 ?auto_189073 )
      ( MAKE-1PILE ?auto_189070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189079 - BLOCK
    )
    :vars
    (
      ?auto_189080 - BLOCK
      ?auto_189084 - BLOCK
      ?auto_189087 - BLOCK
      ?auto_189085 - BLOCK
      ?auto_189083 - BLOCK
      ?auto_189081 - BLOCK
      ?auto_189082 - BLOCK
      ?auto_189086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189080 ?auto_189079 ) ( ON-TABLE ?auto_189079 ) ( not ( = ?auto_189079 ?auto_189080 ) ) ( not ( = ?auto_189079 ?auto_189084 ) ) ( not ( = ?auto_189079 ?auto_189087 ) ) ( not ( = ?auto_189080 ?auto_189084 ) ) ( not ( = ?auto_189080 ?auto_189087 ) ) ( not ( = ?auto_189084 ?auto_189087 ) ) ( ON ?auto_189084 ?auto_189080 ) ( ON-TABLE ?auto_189085 ) ( ON ?auto_189083 ?auto_189085 ) ( ON ?auto_189081 ?auto_189083 ) ( not ( = ?auto_189085 ?auto_189083 ) ) ( not ( = ?auto_189085 ?auto_189081 ) ) ( not ( = ?auto_189085 ?auto_189082 ) ) ( not ( = ?auto_189085 ?auto_189086 ) ) ( not ( = ?auto_189085 ?auto_189087 ) ) ( not ( = ?auto_189083 ?auto_189081 ) ) ( not ( = ?auto_189083 ?auto_189082 ) ) ( not ( = ?auto_189083 ?auto_189086 ) ) ( not ( = ?auto_189083 ?auto_189087 ) ) ( not ( = ?auto_189081 ?auto_189082 ) ) ( not ( = ?auto_189081 ?auto_189086 ) ) ( not ( = ?auto_189081 ?auto_189087 ) ) ( not ( = ?auto_189082 ?auto_189086 ) ) ( not ( = ?auto_189082 ?auto_189087 ) ) ( not ( = ?auto_189086 ?auto_189087 ) ) ( not ( = ?auto_189079 ?auto_189086 ) ) ( not ( = ?auto_189079 ?auto_189085 ) ) ( not ( = ?auto_189079 ?auto_189083 ) ) ( not ( = ?auto_189079 ?auto_189081 ) ) ( not ( = ?auto_189079 ?auto_189082 ) ) ( not ( = ?auto_189080 ?auto_189086 ) ) ( not ( = ?auto_189080 ?auto_189085 ) ) ( not ( = ?auto_189080 ?auto_189083 ) ) ( not ( = ?auto_189080 ?auto_189081 ) ) ( not ( = ?auto_189080 ?auto_189082 ) ) ( not ( = ?auto_189084 ?auto_189086 ) ) ( not ( = ?auto_189084 ?auto_189085 ) ) ( not ( = ?auto_189084 ?auto_189083 ) ) ( not ( = ?auto_189084 ?auto_189081 ) ) ( not ( = ?auto_189084 ?auto_189082 ) ) ( ON ?auto_189087 ?auto_189084 ) ( ON ?auto_189086 ?auto_189087 ) ( CLEAR ?auto_189086 ) ( HOLDING ?auto_189082 ) ( CLEAR ?auto_189081 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189085 ?auto_189083 ?auto_189081 ?auto_189082 )
      ( MAKE-1PILE ?auto_189079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189088 - BLOCK
    )
    :vars
    (
      ?auto_189094 - BLOCK
      ?auto_189090 - BLOCK
      ?auto_189089 - BLOCK
      ?auto_189091 - BLOCK
      ?auto_189092 - BLOCK
      ?auto_189093 - BLOCK
      ?auto_189095 - BLOCK
      ?auto_189096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189094 ?auto_189088 ) ( ON-TABLE ?auto_189088 ) ( not ( = ?auto_189088 ?auto_189094 ) ) ( not ( = ?auto_189088 ?auto_189090 ) ) ( not ( = ?auto_189088 ?auto_189089 ) ) ( not ( = ?auto_189094 ?auto_189090 ) ) ( not ( = ?auto_189094 ?auto_189089 ) ) ( not ( = ?auto_189090 ?auto_189089 ) ) ( ON ?auto_189090 ?auto_189094 ) ( ON-TABLE ?auto_189091 ) ( ON ?auto_189092 ?auto_189091 ) ( ON ?auto_189093 ?auto_189092 ) ( not ( = ?auto_189091 ?auto_189092 ) ) ( not ( = ?auto_189091 ?auto_189093 ) ) ( not ( = ?auto_189091 ?auto_189095 ) ) ( not ( = ?auto_189091 ?auto_189096 ) ) ( not ( = ?auto_189091 ?auto_189089 ) ) ( not ( = ?auto_189092 ?auto_189093 ) ) ( not ( = ?auto_189092 ?auto_189095 ) ) ( not ( = ?auto_189092 ?auto_189096 ) ) ( not ( = ?auto_189092 ?auto_189089 ) ) ( not ( = ?auto_189093 ?auto_189095 ) ) ( not ( = ?auto_189093 ?auto_189096 ) ) ( not ( = ?auto_189093 ?auto_189089 ) ) ( not ( = ?auto_189095 ?auto_189096 ) ) ( not ( = ?auto_189095 ?auto_189089 ) ) ( not ( = ?auto_189096 ?auto_189089 ) ) ( not ( = ?auto_189088 ?auto_189096 ) ) ( not ( = ?auto_189088 ?auto_189091 ) ) ( not ( = ?auto_189088 ?auto_189092 ) ) ( not ( = ?auto_189088 ?auto_189093 ) ) ( not ( = ?auto_189088 ?auto_189095 ) ) ( not ( = ?auto_189094 ?auto_189096 ) ) ( not ( = ?auto_189094 ?auto_189091 ) ) ( not ( = ?auto_189094 ?auto_189092 ) ) ( not ( = ?auto_189094 ?auto_189093 ) ) ( not ( = ?auto_189094 ?auto_189095 ) ) ( not ( = ?auto_189090 ?auto_189096 ) ) ( not ( = ?auto_189090 ?auto_189091 ) ) ( not ( = ?auto_189090 ?auto_189092 ) ) ( not ( = ?auto_189090 ?auto_189093 ) ) ( not ( = ?auto_189090 ?auto_189095 ) ) ( ON ?auto_189089 ?auto_189090 ) ( ON ?auto_189096 ?auto_189089 ) ( CLEAR ?auto_189093 ) ( ON ?auto_189095 ?auto_189096 ) ( CLEAR ?auto_189095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189088 ?auto_189094 ?auto_189090 ?auto_189089 ?auto_189096 )
      ( MAKE-1PILE ?auto_189088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189097 - BLOCK
    )
    :vars
    (
      ?auto_189100 - BLOCK
      ?auto_189104 - BLOCK
      ?auto_189098 - BLOCK
      ?auto_189102 - BLOCK
      ?auto_189105 - BLOCK
      ?auto_189101 - BLOCK
      ?auto_189103 - BLOCK
      ?auto_189099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189100 ?auto_189097 ) ( ON-TABLE ?auto_189097 ) ( not ( = ?auto_189097 ?auto_189100 ) ) ( not ( = ?auto_189097 ?auto_189104 ) ) ( not ( = ?auto_189097 ?auto_189098 ) ) ( not ( = ?auto_189100 ?auto_189104 ) ) ( not ( = ?auto_189100 ?auto_189098 ) ) ( not ( = ?auto_189104 ?auto_189098 ) ) ( ON ?auto_189104 ?auto_189100 ) ( ON-TABLE ?auto_189102 ) ( ON ?auto_189105 ?auto_189102 ) ( not ( = ?auto_189102 ?auto_189105 ) ) ( not ( = ?auto_189102 ?auto_189101 ) ) ( not ( = ?auto_189102 ?auto_189103 ) ) ( not ( = ?auto_189102 ?auto_189099 ) ) ( not ( = ?auto_189102 ?auto_189098 ) ) ( not ( = ?auto_189105 ?auto_189101 ) ) ( not ( = ?auto_189105 ?auto_189103 ) ) ( not ( = ?auto_189105 ?auto_189099 ) ) ( not ( = ?auto_189105 ?auto_189098 ) ) ( not ( = ?auto_189101 ?auto_189103 ) ) ( not ( = ?auto_189101 ?auto_189099 ) ) ( not ( = ?auto_189101 ?auto_189098 ) ) ( not ( = ?auto_189103 ?auto_189099 ) ) ( not ( = ?auto_189103 ?auto_189098 ) ) ( not ( = ?auto_189099 ?auto_189098 ) ) ( not ( = ?auto_189097 ?auto_189099 ) ) ( not ( = ?auto_189097 ?auto_189102 ) ) ( not ( = ?auto_189097 ?auto_189105 ) ) ( not ( = ?auto_189097 ?auto_189101 ) ) ( not ( = ?auto_189097 ?auto_189103 ) ) ( not ( = ?auto_189100 ?auto_189099 ) ) ( not ( = ?auto_189100 ?auto_189102 ) ) ( not ( = ?auto_189100 ?auto_189105 ) ) ( not ( = ?auto_189100 ?auto_189101 ) ) ( not ( = ?auto_189100 ?auto_189103 ) ) ( not ( = ?auto_189104 ?auto_189099 ) ) ( not ( = ?auto_189104 ?auto_189102 ) ) ( not ( = ?auto_189104 ?auto_189105 ) ) ( not ( = ?auto_189104 ?auto_189101 ) ) ( not ( = ?auto_189104 ?auto_189103 ) ) ( ON ?auto_189098 ?auto_189104 ) ( ON ?auto_189099 ?auto_189098 ) ( ON ?auto_189103 ?auto_189099 ) ( CLEAR ?auto_189103 ) ( HOLDING ?auto_189101 ) ( CLEAR ?auto_189105 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189102 ?auto_189105 ?auto_189101 )
      ( MAKE-1PILE ?auto_189097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189106 - BLOCK
    )
    :vars
    (
      ?auto_189114 - BLOCK
      ?auto_189107 - BLOCK
      ?auto_189111 - BLOCK
      ?auto_189109 - BLOCK
      ?auto_189113 - BLOCK
      ?auto_189108 - BLOCK
      ?auto_189112 - BLOCK
      ?auto_189110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189114 ?auto_189106 ) ( ON-TABLE ?auto_189106 ) ( not ( = ?auto_189106 ?auto_189114 ) ) ( not ( = ?auto_189106 ?auto_189107 ) ) ( not ( = ?auto_189106 ?auto_189111 ) ) ( not ( = ?auto_189114 ?auto_189107 ) ) ( not ( = ?auto_189114 ?auto_189111 ) ) ( not ( = ?auto_189107 ?auto_189111 ) ) ( ON ?auto_189107 ?auto_189114 ) ( ON-TABLE ?auto_189109 ) ( ON ?auto_189113 ?auto_189109 ) ( not ( = ?auto_189109 ?auto_189113 ) ) ( not ( = ?auto_189109 ?auto_189108 ) ) ( not ( = ?auto_189109 ?auto_189112 ) ) ( not ( = ?auto_189109 ?auto_189110 ) ) ( not ( = ?auto_189109 ?auto_189111 ) ) ( not ( = ?auto_189113 ?auto_189108 ) ) ( not ( = ?auto_189113 ?auto_189112 ) ) ( not ( = ?auto_189113 ?auto_189110 ) ) ( not ( = ?auto_189113 ?auto_189111 ) ) ( not ( = ?auto_189108 ?auto_189112 ) ) ( not ( = ?auto_189108 ?auto_189110 ) ) ( not ( = ?auto_189108 ?auto_189111 ) ) ( not ( = ?auto_189112 ?auto_189110 ) ) ( not ( = ?auto_189112 ?auto_189111 ) ) ( not ( = ?auto_189110 ?auto_189111 ) ) ( not ( = ?auto_189106 ?auto_189110 ) ) ( not ( = ?auto_189106 ?auto_189109 ) ) ( not ( = ?auto_189106 ?auto_189113 ) ) ( not ( = ?auto_189106 ?auto_189108 ) ) ( not ( = ?auto_189106 ?auto_189112 ) ) ( not ( = ?auto_189114 ?auto_189110 ) ) ( not ( = ?auto_189114 ?auto_189109 ) ) ( not ( = ?auto_189114 ?auto_189113 ) ) ( not ( = ?auto_189114 ?auto_189108 ) ) ( not ( = ?auto_189114 ?auto_189112 ) ) ( not ( = ?auto_189107 ?auto_189110 ) ) ( not ( = ?auto_189107 ?auto_189109 ) ) ( not ( = ?auto_189107 ?auto_189113 ) ) ( not ( = ?auto_189107 ?auto_189108 ) ) ( not ( = ?auto_189107 ?auto_189112 ) ) ( ON ?auto_189111 ?auto_189107 ) ( ON ?auto_189110 ?auto_189111 ) ( ON ?auto_189112 ?auto_189110 ) ( CLEAR ?auto_189113 ) ( ON ?auto_189108 ?auto_189112 ) ( CLEAR ?auto_189108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189106 ?auto_189114 ?auto_189107 ?auto_189111 ?auto_189110 ?auto_189112 )
      ( MAKE-1PILE ?auto_189106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189115 - BLOCK
    )
    :vars
    (
      ?auto_189120 - BLOCK
      ?auto_189116 - BLOCK
      ?auto_189117 - BLOCK
      ?auto_189118 - BLOCK
      ?auto_189121 - BLOCK
      ?auto_189122 - BLOCK
      ?auto_189123 - BLOCK
      ?auto_189119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189120 ?auto_189115 ) ( ON-TABLE ?auto_189115 ) ( not ( = ?auto_189115 ?auto_189120 ) ) ( not ( = ?auto_189115 ?auto_189116 ) ) ( not ( = ?auto_189115 ?auto_189117 ) ) ( not ( = ?auto_189120 ?auto_189116 ) ) ( not ( = ?auto_189120 ?auto_189117 ) ) ( not ( = ?auto_189116 ?auto_189117 ) ) ( ON ?auto_189116 ?auto_189120 ) ( ON-TABLE ?auto_189118 ) ( not ( = ?auto_189118 ?auto_189121 ) ) ( not ( = ?auto_189118 ?auto_189122 ) ) ( not ( = ?auto_189118 ?auto_189123 ) ) ( not ( = ?auto_189118 ?auto_189119 ) ) ( not ( = ?auto_189118 ?auto_189117 ) ) ( not ( = ?auto_189121 ?auto_189122 ) ) ( not ( = ?auto_189121 ?auto_189123 ) ) ( not ( = ?auto_189121 ?auto_189119 ) ) ( not ( = ?auto_189121 ?auto_189117 ) ) ( not ( = ?auto_189122 ?auto_189123 ) ) ( not ( = ?auto_189122 ?auto_189119 ) ) ( not ( = ?auto_189122 ?auto_189117 ) ) ( not ( = ?auto_189123 ?auto_189119 ) ) ( not ( = ?auto_189123 ?auto_189117 ) ) ( not ( = ?auto_189119 ?auto_189117 ) ) ( not ( = ?auto_189115 ?auto_189119 ) ) ( not ( = ?auto_189115 ?auto_189118 ) ) ( not ( = ?auto_189115 ?auto_189121 ) ) ( not ( = ?auto_189115 ?auto_189122 ) ) ( not ( = ?auto_189115 ?auto_189123 ) ) ( not ( = ?auto_189120 ?auto_189119 ) ) ( not ( = ?auto_189120 ?auto_189118 ) ) ( not ( = ?auto_189120 ?auto_189121 ) ) ( not ( = ?auto_189120 ?auto_189122 ) ) ( not ( = ?auto_189120 ?auto_189123 ) ) ( not ( = ?auto_189116 ?auto_189119 ) ) ( not ( = ?auto_189116 ?auto_189118 ) ) ( not ( = ?auto_189116 ?auto_189121 ) ) ( not ( = ?auto_189116 ?auto_189122 ) ) ( not ( = ?auto_189116 ?auto_189123 ) ) ( ON ?auto_189117 ?auto_189116 ) ( ON ?auto_189119 ?auto_189117 ) ( ON ?auto_189123 ?auto_189119 ) ( ON ?auto_189122 ?auto_189123 ) ( CLEAR ?auto_189122 ) ( HOLDING ?auto_189121 ) ( CLEAR ?auto_189118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189118 ?auto_189121 )
      ( MAKE-1PILE ?auto_189115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191294 - BLOCK
    )
    :vars
    (
      ?auto_191299 - BLOCK
      ?auto_191296 - BLOCK
      ?auto_191301 - BLOCK
      ?auto_191295 - BLOCK
      ?auto_191297 - BLOCK
      ?auto_191298 - BLOCK
      ?auto_191300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191299 ?auto_191294 ) ( ON-TABLE ?auto_191294 ) ( not ( = ?auto_191294 ?auto_191299 ) ) ( not ( = ?auto_191294 ?auto_191296 ) ) ( not ( = ?auto_191294 ?auto_191301 ) ) ( not ( = ?auto_191299 ?auto_191296 ) ) ( not ( = ?auto_191299 ?auto_191301 ) ) ( not ( = ?auto_191296 ?auto_191301 ) ) ( ON ?auto_191296 ?auto_191299 ) ( not ( = ?auto_191295 ?auto_191297 ) ) ( not ( = ?auto_191295 ?auto_191298 ) ) ( not ( = ?auto_191295 ?auto_191300 ) ) ( not ( = ?auto_191295 ?auto_191301 ) ) ( not ( = ?auto_191297 ?auto_191298 ) ) ( not ( = ?auto_191297 ?auto_191300 ) ) ( not ( = ?auto_191297 ?auto_191301 ) ) ( not ( = ?auto_191298 ?auto_191300 ) ) ( not ( = ?auto_191298 ?auto_191301 ) ) ( not ( = ?auto_191300 ?auto_191301 ) ) ( not ( = ?auto_191294 ?auto_191300 ) ) ( not ( = ?auto_191294 ?auto_191295 ) ) ( not ( = ?auto_191294 ?auto_191297 ) ) ( not ( = ?auto_191294 ?auto_191298 ) ) ( not ( = ?auto_191299 ?auto_191300 ) ) ( not ( = ?auto_191299 ?auto_191295 ) ) ( not ( = ?auto_191299 ?auto_191297 ) ) ( not ( = ?auto_191299 ?auto_191298 ) ) ( not ( = ?auto_191296 ?auto_191300 ) ) ( not ( = ?auto_191296 ?auto_191295 ) ) ( not ( = ?auto_191296 ?auto_191297 ) ) ( not ( = ?auto_191296 ?auto_191298 ) ) ( ON ?auto_191301 ?auto_191296 ) ( ON ?auto_191300 ?auto_191301 ) ( ON ?auto_191298 ?auto_191300 ) ( ON ?auto_191297 ?auto_191298 ) ( ON ?auto_191295 ?auto_191297 ) ( CLEAR ?auto_191295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191294 ?auto_191299 ?auto_191296 ?auto_191301 ?auto_191300 ?auto_191298 ?auto_191297 )
      ( MAKE-1PILE ?auto_191294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189133 - BLOCK
    )
    :vars
    (
      ?auto_189135 - BLOCK
      ?auto_189141 - BLOCK
      ?auto_189134 - BLOCK
      ?auto_189137 - BLOCK
      ?auto_189140 - BLOCK
      ?auto_189136 - BLOCK
      ?auto_189138 - BLOCK
      ?auto_189139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189135 ?auto_189133 ) ( ON-TABLE ?auto_189133 ) ( not ( = ?auto_189133 ?auto_189135 ) ) ( not ( = ?auto_189133 ?auto_189141 ) ) ( not ( = ?auto_189133 ?auto_189134 ) ) ( not ( = ?auto_189135 ?auto_189141 ) ) ( not ( = ?auto_189135 ?auto_189134 ) ) ( not ( = ?auto_189141 ?auto_189134 ) ) ( ON ?auto_189141 ?auto_189135 ) ( not ( = ?auto_189137 ?auto_189140 ) ) ( not ( = ?auto_189137 ?auto_189136 ) ) ( not ( = ?auto_189137 ?auto_189138 ) ) ( not ( = ?auto_189137 ?auto_189139 ) ) ( not ( = ?auto_189137 ?auto_189134 ) ) ( not ( = ?auto_189140 ?auto_189136 ) ) ( not ( = ?auto_189140 ?auto_189138 ) ) ( not ( = ?auto_189140 ?auto_189139 ) ) ( not ( = ?auto_189140 ?auto_189134 ) ) ( not ( = ?auto_189136 ?auto_189138 ) ) ( not ( = ?auto_189136 ?auto_189139 ) ) ( not ( = ?auto_189136 ?auto_189134 ) ) ( not ( = ?auto_189138 ?auto_189139 ) ) ( not ( = ?auto_189138 ?auto_189134 ) ) ( not ( = ?auto_189139 ?auto_189134 ) ) ( not ( = ?auto_189133 ?auto_189139 ) ) ( not ( = ?auto_189133 ?auto_189137 ) ) ( not ( = ?auto_189133 ?auto_189140 ) ) ( not ( = ?auto_189133 ?auto_189136 ) ) ( not ( = ?auto_189133 ?auto_189138 ) ) ( not ( = ?auto_189135 ?auto_189139 ) ) ( not ( = ?auto_189135 ?auto_189137 ) ) ( not ( = ?auto_189135 ?auto_189140 ) ) ( not ( = ?auto_189135 ?auto_189136 ) ) ( not ( = ?auto_189135 ?auto_189138 ) ) ( not ( = ?auto_189141 ?auto_189139 ) ) ( not ( = ?auto_189141 ?auto_189137 ) ) ( not ( = ?auto_189141 ?auto_189140 ) ) ( not ( = ?auto_189141 ?auto_189136 ) ) ( not ( = ?auto_189141 ?auto_189138 ) ) ( ON ?auto_189134 ?auto_189141 ) ( ON ?auto_189139 ?auto_189134 ) ( ON ?auto_189138 ?auto_189139 ) ( ON ?auto_189136 ?auto_189138 ) ( ON ?auto_189140 ?auto_189136 ) ( CLEAR ?auto_189140 ) ( HOLDING ?auto_189137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189137 )
      ( MAKE-1PILE ?auto_189133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189142 - BLOCK
    )
    :vars
    (
      ?auto_189148 - BLOCK
      ?auto_189143 - BLOCK
      ?auto_189144 - BLOCK
      ?auto_189150 - BLOCK
      ?auto_189149 - BLOCK
      ?auto_189147 - BLOCK
      ?auto_189146 - BLOCK
      ?auto_189145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189148 ?auto_189142 ) ( ON-TABLE ?auto_189142 ) ( not ( = ?auto_189142 ?auto_189148 ) ) ( not ( = ?auto_189142 ?auto_189143 ) ) ( not ( = ?auto_189142 ?auto_189144 ) ) ( not ( = ?auto_189148 ?auto_189143 ) ) ( not ( = ?auto_189148 ?auto_189144 ) ) ( not ( = ?auto_189143 ?auto_189144 ) ) ( ON ?auto_189143 ?auto_189148 ) ( not ( = ?auto_189150 ?auto_189149 ) ) ( not ( = ?auto_189150 ?auto_189147 ) ) ( not ( = ?auto_189150 ?auto_189146 ) ) ( not ( = ?auto_189150 ?auto_189145 ) ) ( not ( = ?auto_189150 ?auto_189144 ) ) ( not ( = ?auto_189149 ?auto_189147 ) ) ( not ( = ?auto_189149 ?auto_189146 ) ) ( not ( = ?auto_189149 ?auto_189145 ) ) ( not ( = ?auto_189149 ?auto_189144 ) ) ( not ( = ?auto_189147 ?auto_189146 ) ) ( not ( = ?auto_189147 ?auto_189145 ) ) ( not ( = ?auto_189147 ?auto_189144 ) ) ( not ( = ?auto_189146 ?auto_189145 ) ) ( not ( = ?auto_189146 ?auto_189144 ) ) ( not ( = ?auto_189145 ?auto_189144 ) ) ( not ( = ?auto_189142 ?auto_189145 ) ) ( not ( = ?auto_189142 ?auto_189150 ) ) ( not ( = ?auto_189142 ?auto_189149 ) ) ( not ( = ?auto_189142 ?auto_189147 ) ) ( not ( = ?auto_189142 ?auto_189146 ) ) ( not ( = ?auto_189148 ?auto_189145 ) ) ( not ( = ?auto_189148 ?auto_189150 ) ) ( not ( = ?auto_189148 ?auto_189149 ) ) ( not ( = ?auto_189148 ?auto_189147 ) ) ( not ( = ?auto_189148 ?auto_189146 ) ) ( not ( = ?auto_189143 ?auto_189145 ) ) ( not ( = ?auto_189143 ?auto_189150 ) ) ( not ( = ?auto_189143 ?auto_189149 ) ) ( not ( = ?auto_189143 ?auto_189147 ) ) ( not ( = ?auto_189143 ?auto_189146 ) ) ( ON ?auto_189144 ?auto_189143 ) ( ON ?auto_189145 ?auto_189144 ) ( ON ?auto_189146 ?auto_189145 ) ( ON ?auto_189147 ?auto_189146 ) ( ON ?auto_189149 ?auto_189147 ) ( ON ?auto_189150 ?auto_189149 ) ( CLEAR ?auto_189150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189142 ?auto_189148 ?auto_189143 ?auto_189144 ?auto_189145 ?auto_189146 ?auto_189147 ?auto_189149 )
      ( MAKE-1PILE ?auto_189142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189159 - BLOCK
      ?auto_189160 - BLOCK
      ?auto_189161 - BLOCK
      ?auto_189162 - BLOCK
      ?auto_189163 - BLOCK
      ?auto_189164 - BLOCK
      ?auto_189165 - BLOCK
      ?auto_189166 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_189166 ) ( CLEAR ?auto_189165 ) ( ON-TABLE ?auto_189159 ) ( ON ?auto_189160 ?auto_189159 ) ( ON ?auto_189161 ?auto_189160 ) ( ON ?auto_189162 ?auto_189161 ) ( ON ?auto_189163 ?auto_189162 ) ( ON ?auto_189164 ?auto_189163 ) ( ON ?auto_189165 ?auto_189164 ) ( not ( = ?auto_189159 ?auto_189160 ) ) ( not ( = ?auto_189159 ?auto_189161 ) ) ( not ( = ?auto_189159 ?auto_189162 ) ) ( not ( = ?auto_189159 ?auto_189163 ) ) ( not ( = ?auto_189159 ?auto_189164 ) ) ( not ( = ?auto_189159 ?auto_189165 ) ) ( not ( = ?auto_189159 ?auto_189166 ) ) ( not ( = ?auto_189160 ?auto_189161 ) ) ( not ( = ?auto_189160 ?auto_189162 ) ) ( not ( = ?auto_189160 ?auto_189163 ) ) ( not ( = ?auto_189160 ?auto_189164 ) ) ( not ( = ?auto_189160 ?auto_189165 ) ) ( not ( = ?auto_189160 ?auto_189166 ) ) ( not ( = ?auto_189161 ?auto_189162 ) ) ( not ( = ?auto_189161 ?auto_189163 ) ) ( not ( = ?auto_189161 ?auto_189164 ) ) ( not ( = ?auto_189161 ?auto_189165 ) ) ( not ( = ?auto_189161 ?auto_189166 ) ) ( not ( = ?auto_189162 ?auto_189163 ) ) ( not ( = ?auto_189162 ?auto_189164 ) ) ( not ( = ?auto_189162 ?auto_189165 ) ) ( not ( = ?auto_189162 ?auto_189166 ) ) ( not ( = ?auto_189163 ?auto_189164 ) ) ( not ( = ?auto_189163 ?auto_189165 ) ) ( not ( = ?auto_189163 ?auto_189166 ) ) ( not ( = ?auto_189164 ?auto_189165 ) ) ( not ( = ?auto_189164 ?auto_189166 ) ) ( not ( = ?auto_189165 ?auto_189166 ) ) )
    :subtasks
    ( ( !STACK ?auto_189166 ?auto_189165 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189167 - BLOCK
      ?auto_189168 - BLOCK
      ?auto_189169 - BLOCK
      ?auto_189170 - BLOCK
      ?auto_189171 - BLOCK
      ?auto_189172 - BLOCK
      ?auto_189173 - BLOCK
      ?auto_189174 - BLOCK
    )
    :vars
    (
      ?auto_189175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189173 ) ( ON-TABLE ?auto_189167 ) ( ON ?auto_189168 ?auto_189167 ) ( ON ?auto_189169 ?auto_189168 ) ( ON ?auto_189170 ?auto_189169 ) ( ON ?auto_189171 ?auto_189170 ) ( ON ?auto_189172 ?auto_189171 ) ( ON ?auto_189173 ?auto_189172 ) ( not ( = ?auto_189167 ?auto_189168 ) ) ( not ( = ?auto_189167 ?auto_189169 ) ) ( not ( = ?auto_189167 ?auto_189170 ) ) ( not ( = ?auto_189167 ?auto_189171 ) ) ( not ( = ?auto_189167 ?auto_189172 ) ) ( not ( = ?auto_189167 ?auto_189173 ) ) ( not ( = ?auto_189167 ?auto_189174 ) ) ( not ( = ?auto_189168 ?auto_189169 ) ) ( not ( = ?auto_189168 ?auto_189170 ) ) ( not ( = ?auto_189168 ?auto_189171 ) ) ( not ( = ?auto_189168 ?auto_189172 ) ) ( not ( = ?auto_189168 ?auto_189173 ) ) ( not ( = ?auto_189168 ?auto_189174 ) ) ( not ( = ?auto_189169 ?auto_189170 ) ) ( not ( = ?auto_189169 ?auto_189171 ) ) ( not ( = ?auto_189169 ?auto_189172 ) ) ( not ( = ?auto_189169 ?auto_189173 ) ) ( not ( = ?auto_189169 ?auto_189174 ) ) ( not ( = ?auto_189170 ?auto_189171 ) ) ( not ( = ?auto_189170 ?auto_189172 ) ) ( not ( = ?auto_189170 ?auto_189173 ) ) ( not ( = ?auto_189170 ?auto_189174 ) ) ( not ( = ?auto_189171 ?auto_189172 ) ) ( not ( = ?auto_189171 ?auto_189173 ) ) ( not ( = ?auto_189171 ?auto_189174 ) ) ( not ( = ?auto_189172 ?auto_189173 ) ) ( not ( = ?auto_189172 ?auto_189174 ) ) ( not ( = ?auto_189173 ?auto_189174 ) ) ( ON ?auto_189174 ?auto_189175 ) ( CLEAR ?auto_189174 ) ( HAND-EMPTY ) ( not ( = ?auto_189167 ?auto_189175 ) ) ( not ( = ?auto_189168 ?auto_189175 ) ) ( not ( = ?auto_189169 ?auto_189175 ) ) ( not ( = ?auto_189170 ?auto_189175 ) ) ( not ( = ?auto_189171 ?auto_189175 ) ) ( not ( = ?auto_189172 ?auto_189175 ) ) ( not ( = ?auto_189173 ?auto_189175 ) ) ( not ( = ?auto_189174 ?auto_189175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189174 ?auto_189175 )
      ( MAKE-8PILE ?auto_189167 ?auto_189168 ?auto_189169 ?auto_189170 ?auto_189171 ?auto_189172 ?auto_189173 ?auto_189174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189176 - BLOCK
      ?auto_189177 - BLOCK
      ?auto_189178 - BLOCK
      ?auto_189179 - BLOCK
      ?auto_189180 - BLOCK
      ?auto_189181 - BLOCK
      ?auto_189182 - BLOCK
      ?auto_189183 - BLOCK
    )
    :vars
    (
      ?auto_189184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189176 ) ( ON ?auto_189177 ?auto_189176 ) ( ON ?auto_189178 ?auto_189177 ) ( ON ?auto_189179 ?auto_189178 ) ( ON ?auto_189180 ?auto_189179 ) ( ON ?auto_189181 ?auto_189180 ) ( not ( = ?auto_189176 ?auto_189177 ) ) ( not ( = ?auto_189176 ?auto_189178 ) ) ( not ( = ?auto_189176 ?auto_189179 ) ) ( not ( = ?auto_189176 ?auto_189180 ) ) ( not ( = ?auto_189176 ?auto_189181 ) ) ( not ( = ?auto_189176 ?auto_189182 ) ) ( not ( = ?auto_189176 ?auto_189183 ) ) ( not ( = ?auto_189177 ?auto_189178 ) ) ( not ( = ?auto_189177 ?auto_189179 ) ) ( not ( = ?auto_189177 ?auto_189180 ) ) ( not ( = ?auto_189177 ?auto_189181 ) ) ( not ( = ?auto_189177 ?auto_189182 ) ) ( not ( = ?auto_189177 ?auto_189183 ) ) ( not ( = ?auto_189178 ?auto_189179 ) ) ( not ( = ?auto_189178 ?auto_189180 ) ) ( not ( = ?auto_189178 ?auto_189181 ) ) ( not ( = ?auto_189178 ?auto_189182 ) ) ( not ( = ?auto_189178 ?auto_189183 ) ) ( not ( = ?auto_189179 ?auto_189180 ) ) ( not ( = ?auto_189179 ?auto_189181 ) ) ( not ( = ?auto_189179 ?auto_189182 ) ) ( not ( = ?auto_189179 ?auto_189183 ) ) ( not ( = ?auto_189180 ?auto_189181 ) ) ( not ( = ?auto_189180 ?auto_189182 ) ) ( not ( = ?auto_189180 ?auto_189183 ) ) ( not ( = ?auto_189181 ?auto_189182 ) ) ( not ( = ?auto_189181 ?auto_189183 ) ) ( not ( = ?auto_189182 ?auto_189183 ) ) ( ON ?auto_189183 ?auto_189184 ) ( CLEAR ?auto_189183 ) ( not ( = ?auto_189176 ?auto_189184 ) ) ( not ( = ?auto_189177 ?auto_189184 ) ) ( not ( = ?auto_189178 ?auto_189184 ) ) ( not ( = ?auto_189179 ?auto_189184 ) ) ( not ( = ?auto_189180 ?auto_189184 ) ) ( not ( = ?auto_189181 ?auto_189184 ) ) ( not ( = ?auto_189182 ?auto_189184 ) ) ( not ( = ?auto_189183 ?auto_189184 ) ) ( HOLDING ?auto_189182 ) ( CLEAR ?auto_189181 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189176 ?auto_189177 ?auto_189178 ?auto_189179 ?auto_189180 ?auto_189181 ?auto_189182 )
      ( MAKE-8PILE ?auto_189176 ?auto_189177 ?auto_189178 ?auto_189179 ?auto_189180 ?auto_189181 ?auto_189182 ?auto_189183 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189185 - BLOCK
      ?auto_189186 - BLOCK
      ?auto_189187 - BLOCK
      ?auto_189188 - BLOCK
      ?auto_189189 - BLOCK
      ?auto_189190 - BLOCK
      ?auto_189191 - BLOCK
      ?auto_189192 - BLOCK
    )
    :vars
    (
      ?auto_189193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189185 ) ( ON ?auto_189186 ?auto_189185 ) ( ON ?auto_189187 ?auto_189186 ) ( ON ?auto_189188 ?auto_189187 ) ( ON ?auto_189189 ?auto_189188 ) ( ON ?auto_189190 ?auto_189189 ) ( not ( = ?auto_189185 ?auto_189186 ) ) ( not ( = ?auto_189185 ?auto_189187 ) ) ( not ( = ?auto_189185 ?auto_189188 ) ) ( not ( = ?auto_189185 ?auto_189189 ) ) ( not ( = ?auto_189185 ?auto_189190 ) ) ( not ( = ?auto_189185 ?auto_189191 ) ) ( not ( = ?auto_189185 ?auto_189192 ) ) ( not ( = ?auto_189186 ?auto_189187 ) ) ( not ( = ?auto_189186 ?auto_189188 ) ) ( not ( = ?auto_189186 ?auto_189189 ) ) ( not ( = ?auto_189186 ?auto_189190 ) ) ( not ( = ?auto_189186 ?auto_189191 ) ) ( not ( = ?auto_189186 ?auto_189192 ) ) ( not ( = ?auto_189187 ?auto_189188 ) ) ( not ( = ?auto_189187 ?auto_189189 ) ) ( not ( = ?auto_189187 ?auto_189190 ) ) ( not ( = ?auto_189187 ?auto_189191 ) ) ( not ( = ?auto_189187 ?auto_189192 ) ) ( not ( = ?auto_189188 ?auto_189189 ) ) ( not ( = ?auto_189188 ?auto_189190 ) ) ( not ( = ?auto_189188 ?auto_189191 ) ) ( not ( = ?auto_189188 ?auto_189192 ) ) ( not ( = ?auto_189189 ?auto_189190 ) ) ( not ( = ?auto_189189 ?auto_189191 ) ) ( not ( = ?auto_189189 ?auto_189192 ) ) ( not ( = ?auto_189190 ?auto_189191 ) ) ( not ( = ?auto_189190 ?auto_189192 ) ) ( not ( = ?auto_189191 ?auto_189192 ) ) ( ON ?auto_189192 ?auto_189193 ) ( not ( = ?auto_189185 ?auto_189193 ) ) ( not ( = ?auto_189186 ?auto_189193 ) ) ( not ( = ?auto_189187 ?auto_189193 ) ) ( not ( = ?auto_189188 ?auto_189193 ) ) ( not ( = ?auto_189189 ?auto_189193 ) ) ( not ( = ?auto_189190 ?auto_189193 ) ) ( not ( = ?auto_189191 ?auto_189193 ) ) ( not ( = ?auto_189192 ?auto_189193 ) ) ( CLEAR ?auto_189190 ) ( ON ?auto_189191 ?auto_189192 ) ( CLEAR ?auto_189191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189193 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189193 ?auto_189192 )
      ( MAKE-8PILE ?auto_189185 ?auto_189186 ?auto_189187 ?auto_189188 ?auto_189189 ?auto_189190 ?auto_189191 ?auto_189192 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189194 - BLOCK
      ?auto_189195 - BLOCK
      ?auto_189196 - BLOCK
      ?auto_189197 - BLOCK
      ?auto_189198 - BLOCK
      ?auto_189199 - BLOCK
      ?auto_189200 - BLOCK
      ?auto_189201 - BLOCK
    )
    :vars
    (
      ?auto_189202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189194 ) ( ON ?auto_189195 ?auto_189194 ) ( ON ?auto_189196 ?auto_189195 ) ( ON ?auto_189197 ?auto_189196 ) ( ON ?auto_189198 ?auto_189197 ) ( not ( = ?auto_189194 ?auto_189195 ) ) ( not ( = ?auto_189194 ?auto_189196 ) ) ( not ( = ?auto_189194 ?auto_189197 ) ) ( not ( = ?auto_189194 ?auto_189198 ) ) ( not ( = ?auto_189194 ?auto_189199 ) ) ( not ( = ?auto_189194 ?auto_189200 ) ) ( not ( = ?auto_189194 ?auto_189201 ) ) ( not ( = ?auto_189195 ?auto_189196 ) ) ( not ( = ?auto_189195 ?auto_189197 ) ) ( not ( = ?auto_189195 ?auto_189198 ) ) ( not ( = ?auto_189195 ?auto_189199 ) ) ( not ( = ?auto_189195 ?auto_189200 ) ) ( not ( = ?auto_189195 ?auto_189201 ) ) ( not ( = ?auto_189196 ?auto_189197 ) ) ( not ( = ?auto_189196 ?auto_189198 ) ) ( not ( = ?auto_189196 ?auto_189199 ) ) ( not ( = ?auto_189196 ?auto_189200 ) ) ( not ( = ?auto_189196 ?auto_189201 ) ) ( not ( = ?auto_189197 ?auto_189198 ) ) ( not ( = ?auto_189197 ?auto_189199 ) ) ( not ( = ?auto_189197 ?auto_189200 ) ) ( not ( = ?auto_189197 ?auto_189201 ) ) ( not ( = ?auto_189198 ?auto_189199 ) ) ( not ( = ?auto_189198 ?auto_189200 ) ) ( not ( = ?auto_189198 ?auto_189201 ) ) ( not ( = ?auto_189199 ?auto_189200 ) ) ( not ( = ?auto_189199 ?auto_189201 ) ) ( not ( = ?auto_189200 ?auto_189201 ) ) ( ON ?auto_189201 ?auto_189202 ) ( not ( = ?auto_189194 ?auto_189202 ) ) ( not ( = ?auto_189195 ?auto_189202 ) ) ( not ( = ?auto_189196 ?auto_189202 ) ) ( not ( = ?auto_189197 ?auto_189202 ) ) ( not ( = ?auto_189198 ?auto_189202 ) ) ( not ( = ?auto_189199 ?auto_189202 ) ) ( not ( = ?auto_189200 ?auto_189202 ) ) ( not ( = ?auto_189201 ?auto_189202 ) ) ( ON ?auto_189200 ?auto_189201 ) ( CLEAR ?auto_189200 ) ( ON-TABLE ?auto_189202 ) ( HOLDING ?auto_189199 ) ( CLEAR ?auto_189198 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189194 ?auto_189195 ?auto_189196 ?auto_189197 ?auto_189198 ?auto_189199 )
      ( MAKE-8PILE ?auto_189194 ?auto_189195 ?auto_189196 ?auto_189197 ?auto_189198 ?auto_189199 ?auto_189200 ?auto_189201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189203 - BLOCK
      ?auto_189204 - BLOCK
      ?auto_189205 - BLOCK
      ?auto_189206 - BLOCK
      ?auto_189207 - BLOCK
      ?auto_189208 - BLOCK
      ?auto_189209 - BLOCK
      ?auto_189210 - BLOCK
    )
    :vars
    (
      ?auto_189211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189203 ) ( ON ?auto_189204 ?auto_189203 ) ( ON ?auto_189205 ?auto_189204 ) ( ON ?auto_189206 ?auto_189205 ) ( ON ?auto_189207 ?auto_189206 ) ( not ( = ?auto_189203 ?auto_189204 ) ) ( not ( = ?auto_189203 ?auto_189205 ) ) ( not ( = ?auto_189203 ?auto_189206 ) ) ( not ( = ?auto_189203 ?auto_189207 ) ) ( not ( = ?auto_189203 ?auto_189208 ) ) ( not ( = ?auto_189203 ?auto_189209 ) ) ( not ( = ?auto_189203 ?auto_189210 ) ) ( not ( = ?auto_189204 ?auto_189205 ) ) ( not ( = ?auto_189204 ?auto_189206 ) ) ( not ( = ?auto_189204 ?auto_189207 ) ) ( not ( = ?auto_189204 ?auto_189208 ) ) ( not ( = ?auto_189204 ?auto_189209 ) ) ( not ( = ?auto_189204 ?auto_189210 ) ) ( not ( = ?auto_189205 ?auto_189206 ) ) ( not ( = ?auto_189205 ?auto_189207 ) ) ( not ( = ?auto_189205 ?auto_189208 ) ) ( not ( = ?auto_189205 ?auto_189209 ) ) ( not ( = ?auto_189205 ?auto_189210 ) ) ( not ( = ?auto_189206 ?auto_189207 ) ) ( not ( = ?auto_189206 ?auto_189208 ) ) ( not ( = ?auto_189206 ?auto_189209 ) ) ( not ( = ?auto_189206 ?auto_189210 ) ) ( not ( = ?auto_189207 ?auto_189208 ) ) ( not ( = ?auto_189207 ?auto_189209 ) ) ( not ( = ?auto_189207 ?auto_189210 ) ) ( not ( = ?auto_189208 ?auto_189209 ) ) ( not ( = ?auto_189208 ?auto_189210 ) ) ( not ( = ?auto_189209 ?auto_189210 ) ) ( ON ?auto_189210 ?auto_189211 ) ( not ( = ?auto_189203 ?auto_189211 ) ) ( not ( = ?auto_189204 ?auto_189211 ) ) ( not ( = ?auto_189205 ?auto_189211 ) ) ( not ( = ?auto_189206 ?auto_189211 ) ) ( not ( = ?auto_189207 ?auto_189211 ) ) ( not ( = ?auto_189208 ?auto_189211 ) ) ( not ( = ?auto_189209 ?auto_189211 ) ) ( not ( = ?auto_189210 ?auto_189211 ) ) ( ON ?auto_189209 ?auto_189210 ) ( ON-TABLE ?auto_189211 ) ( CLEAR ?auto_189207 ) ( ON ?auto_189208 ?auto_189209 ) ( CLEAR ?auto_189208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189211 ?auto_189210 ?auto_189209 )
      ( MAKE-8PILE ?auto_189203 ?auto_189204 ?auto_189205 ?auto_189206 ?auto_189207 ?auto_189208 ?auto_189209 ?auto_189210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189212 - BLOCK
      ?auto_189213 - BLOCK
      ?auto_189214 - BLOCK
      ?auto_189215 - BLOCK
      ?auto_189216 - BLOCK
      ?auto_189217 - BLOCK
      ?auto_189218 - BLOCK
      ?auto_189219 - BLOCK
    )
    :vars
    (
      ?auto_189220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189212 ) ( ON ?auto_189213 ?auto_189212 ) ( ON ?auto_189214 ?auto_189213 ) ( ON ?auto_189215 ?auto_189214 ) ( not ( = ?auto_189212 ?auto_189213 ) ) ( not ( = ?auto_189212 ?auto_189214 ) ) ( not ( = ?auto_189212 ?auto_189215 ) ) ( not ( = ?auto_189212 ?auto_189216 ) ) ( not ( = ?auto_189212 ?auto_189217 ) ) ( not ( = ?auto_189212 ?auto_189218 ) ) ( not ( = ?auto_189212 ?auto_189219 ) ) ( not ( = ?auto_189213 ?auto_189214 ) ) ( not ( = ?auto_189213 ?auto_189215 ) ) ( not ( = ?auto_189213 ?auto_189216 ) ) ( not ( = ?auto_189213 ?auto_189217 ) ) ( not ( = ?auto_189213 ?auto_189218 ) ) ( not ( = ?auto_189213 ?auto_189219 ) ) ( not ( = ?auto_189214 ?auto_189215 ) ) ( not ( = ?auto_189214 ?auto_189216 ) ) ( not ( = ?auto_189214 ?auto_189217 ) ) ( not ( = ?auto_189214 ?auto_189218 ) ) ( not ( = ?auto_189214 ?auto_189219 ) ) ( not ( = ?auto_189215 ?auto_189216 ) ) ( not ( = ?auto_189215 ?auto_189217 ) ) ( not ( = ?auto_189215 ?auto_189218 ) ) ( not ( = ?auto_189215 ?auto_189219 ) ) ( not ( = ?auto_189216 ?auto_189217 ) ) ( not ( = ?auto_189216 ?auto_189218 ) ) ( not ( = ?auto_189216 ?auto_189219 ) ) ( not ( = ?auto_189217 ?auto_189218 ) ) ( not ( = ?auto_189217 ?auto_189219 ) ) ( not ( = ?auto_189218 ?auto_189219 ) ) ( ON ?auto_189219 ?auto_189220 ) ( not ( = ?auto_189212 ?auto_189220 ) ) ( not ( = ?auto_189213 ?auto_189220 ) ) ( not ( = ?auto_189214 ?auto_189220 ) ) ( not ( = ?auto_189215 ?auto_189220 ) ) ( not ( = ?auto_189216 ?auto_189220 ) ) ( not ( = ?auto_189217 ?auto_189220 ) ) ( not ( = ?auto_189218 ?auto_189220 ) ) ( not ( = ?auto_189219 ?auto_189220 ) ) ( ON ?auto_189218 ?auto_189219 ) ( ON-TABLE ?auto_189220 ) ( ON ?auto_189217 ?auto_189218 ) ( CLEAR ?auto_189217 ) ( HOLDING ?auto_189216 ) ( CLEAR ?auto_189215 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189212 ?auto_189213 ?auto_189214 ?auto_189215 ?auto_189216 )
      ( MAKE-8PILE ?auto_189212 ?auto_189213 ?auto_189214 ?auto_189215 ?auto_189216 ?auto_189217 ?auto_189218 ?auto_189219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189221 - BLOCK
      ?auto_189222 - BLOCK
      ?auto_189223 - BLOCK
      ?auto_189224 - BLOCK
      ?auto_189225 - BLOCK
      ?auto_189226 - BLOCK
      ?auto_189227 - BLOCK
      ?auto_189228 - BLOCK
    )
    :vars
    (
      ?auto_189229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189221 ) ( ON ?auto_189222 ?auto_189221 ) ( ON ?auto_189223 ?auto_189222 ) ( ON ?auto_189224 ?auto_189223 ) ( not ( = ?auto_189221 ?auto_189222 ) ) ( not ( = ?auto_189221 ?auto_189223 ) ) ( not ( = ?auto_189221 ?auto_189224 ) ) ( not ( = ?auto_189221 ?auto_189225 ) ) ( not ( = ?auto_189221 ?auto_189226 ) ) ( not ( = ?auto_189221 ?auto_189227 ) ) ( not ( = ?auto_189221 ?auto_189228 ) ) ( not ( = ?auto_189222 ?auto_189223 ) ) ( not ( = ?auto_189222 ?auto_189224 ) ) ( not ( = ?auto_189222 ?auto_189225 ) ) ( not ( = ?auto_189222 ?auto_189226 ) ) ( not ( = ?auto_189222 ?auto_189227 ) ) ( not ( = ?auto_189222 ?auto_189228 ) ) ( not ( = ?auto_189223 ?auto_189224 ) ) ( not ( = ?auto_189223 ?auto_189225 ) ) ( not ( = ?auto_189223 ?auto_189226 ) ) ( not ( = ?auto_189223 ?auto_189227 ) ) ( not ( = ?auto_189223 ?auto_189228 ) ) ( not ( = ?auto_189224 ?auto_189225 ) ) ( not ( = ?auto_189224 ?auto_189226 ) ) ( not ( = ?auto_189224 ?auto_189227 ) ) ( not ( = ?auto_189224 ?auto_189228 ) ) ( not ( = ?auto_189225 ?auto_189226 ) ) ( not ( = ?auto_189225 ?auto_189227 ) ) ( not ( = ?auto_189225 ?auto_189228 ) ) ( not ( = ?auto_189226 ?auto_189227 ) ) ( not ( = ?auto_189226 ?auto_189228 ) ) ( not ( = ?auto_189227 ?auto_189228 ) ) ( ON ?auto_189228 ?auto_189229 ) ( not ( = ?auto_189221 ?auto_189229 ) ) ( not ( = ?auto_189222 ?auto_189229 ) ) ( not ( = ?auto_189223 ?auto_189229 ) ) ( not ( = ?auto_189224 ?auto_189229 ) ) ( not ( = ?auto_189225 ?auto_189229 ) ) ( not ( = ?auto_189226 ?auto_189229 ) ) ( not ( = ?auto_189227 ?auto_189229 ) ) ( not ( = ?auto_189228 ?auto_189229 ) ) ( ON ?auto_189227 ?auto_189228 ) ( ON-TABLE ?auto_189229 ) ( ON ?auto_189226 ?auto_189227 ) ( CLEAR ?auto_189224 ) ( ON ?auto_189225 ?auto_189226 ) ( CLEAR ?auto_189225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189229 ?auto_189228 ?auto_189227 ?auto_189226 )
      ( MAKE-8PILE ?auto_189221 ?auto_189222 ?auto_189223 ?auto_189224 ?auto_189225 ?auto_189226 ?auto_189227 ?auto_189228 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189230 - BLOCK
      ?auto_189231 - BLOCK
      ?auto_189232 - BLOCK
      ?auto_189233 - BLOCK
      ?auto_189234 - BLOCK
      ?auto_189235 - BLOCK
      ?auto_189236 - BLOCK
      ?auto_189237 - BLOCK
    )
    :vars
    (
      ?auto_189238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189230 ) ( ON ?auto_189231 ?auto_189230 ) ( ON ?auto_189232 ?auto_189231 ) ( not ( = ?auto_189230 ?auto_189231 ) ) ( not ( = ?auto_189230 ?auto_189232 ) ) ( not ( = ?auto_189230 ?auto_189233 ) ) ( not ( = ?auto_189230 ?auto_189234 ) ) ( not ( = ?auto_189230 ?auto_189235 ) ) ( not ( = ?auto_189230 ?auto_189236 ) ) ( not ( = ?auto_189230 ?auto_189237 ) ) ( not ( = ?auto_189231 ?auto_189232 ) ) ( not ( = ?auto_189231 ?auto_189233 ) ) ( not ( = ?auto_189231 ?auto_189234 ) ) ( not ( = ?auto_189231 ?auto_189235 ) ) ( not ( = ?auto_189231 ?auto_189236 ) ) ( not ( = ?auto_189231 ?auto_189237 ) ) ( not ( = ?auto_189232 ?auto_189233 ) ) ( not ( = ?auto_189232 ?auto_189234 ) ) ( not ( = ?auto_189232 ?auto_189235 ) ) ( not ( = ?auto_189232 ?auto_189236 ) ) ( not ( = ?auto_189232 ?auto_189237 ) ) ( not ( = ?auto_189233 ?auto_189234 ) ) ( not ( = ?auto_189233 ?auto_189235 ) ) ( not ( = ?auto_189233 ?auto_189236 ) ) ( not ( = ?auto_189233 ?auto_189237 ) ) ( not ( = ?auto_189234 ?auto_189235 ) ) ( not ( = ?auto_189234 ?auto_189236 ) ) ( not ( = ?auto_189234 ?auto_189237 ) ) ( not ( = ?auto_189235 ?auto_189236 ) ) ( not ( = ?auto_189235 ?auto_189237 ) ) ( not ( = ?auto_189236 ?auto_189237 ) ) ( ON ?auto_189237 ?auto_189238 ) ( not ( = ?auto_189230 ?auto_189238 ) ) ( not ( = ?auto_189231 ?auto_189238 ) ) ( not ( = ?auto_189232 ?auto_189238 ) ) ( not ( = ?auto_189233 ?auto_189238 ) ) ( not ( = ?auto_189234 ?auto_189238 ) ) ( not ( = ?auto_189235 ?auto_189238 ) ) ( not ( = ?auto_189236 ?auto_189238 ) ) ( not ( = ?auto_189237 ?auto_189238 ) ) ( ON ?auto_189236 ?auto_189237 ) ( ON-TABLE ?auto_189238 ) ( ON ?auto_189235 ?auto_189236 ) ( ON ?auto_189234 ?auto_189235 ) ( CLEAR ?auto_189234 ) ( HOLDING ?auto_189233 ) ( CLEAR ?auto_189232 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189230 ?auto_189231 ?auto_189232 ?auto_189233 )
      ( MAKE-8PILE ?auto_189230 ?auto_189231 ?auto_189232 ?auto_189233 ?auto_189234 ?auto_189235 ?auto_189236 ?auto_189237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189239 - BLOCK
      ?auto_189240 - BLOCK
      ?auto_189241 - BLOCK
      ?auto_189242 - BLOCK
      ?auto_189243 - BLOCK
      ?auto_189244 - BLOCK
      ?auto_189245 - BLOCK
      ?auto_189246 - BLOCK
    )
    :vars
    (
      ?auto_189247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189239 ) ( ON ?auto_189240 ?auto_189239 ) ( ON ?auto_189241 ?auto_189240 ) ( not ( = ?auto_189239 ?auto_189240 ) ) ( not ( = ?auto_189239 ?auto_189241 ) ) ( not ( = ?auto_189239 ?auto_189242 ) ) ( not ( = ?auto_189239 ?auto_189243 ) ) ( not ( = ?auto_189239 ?auto_189244 ) ) ( not ( = ?auto_189239 ?auto_189245 ) ) ( not ( = ?auto_189239 ?auto_189246 ) ) ( not ( = ?auto_189240 ?auto_189241 ) ) ( not ( = ?auto_189240 ?auto_189242 ) ) ( not ( = ?auto_189240 ?auto_189243 ) ) ( not ( = ?auto_189240 ?auto_189244 ) ) ( not ( = ?auto_189240 ?auto_189245 ) ) ( not ( = ?auto_189240 ?auto_189246 ) ) ( not ( = ?auto_189241 ?auto_189242 ) ) ( not ( = ?auto_189241 ?auto_189243 ) ) ( not ( = ?auto_189241 ?auto_189244 ) ) ( not ( = ?auto_189241 ?auto_189245 ) ) ( not ( = ?auto_189241 ?auto_189246 ) ) ( not ( = ?auto_189242 ?auto_189243 ) ) ( not ( = ?auto_189242 ?auto_189244 ) ) ( not ( = ?auto_189242 ?auto_189245 ) ) ( not ( = ?auto_189242 ?auto_189246 ) ) ( not ( = ?auto_189243 ?auto_189244 ) ) ( not ( = ?auto_189243 ?auto_189245 ) ) ( not ( = ?auto_189243 ?auto_189246 ) ) ( not ( = ?auto_189244 ?auto_189245 ) ) ( not ( = ?auto_189244 ?auto_189246 ) ) ( not ( = ?auto_189245 ?auto_189246 ) ) ( ON ?auto_189246 ?auto_189247 ) ( not ( = ?auto_189239 ?auto_189247 ) ) ( not ( = ?auto_189240 ?auto_189247 ) ) ( not ( = ?auto_189241 ?auto_189247 ) ) ( not ( = ?auto_189242 ?auto_189247 ) ) ( not ( = ?auto_189243 ?auto_189247 ) ) ( not ( = ?auto_189244 ?auto_189247 ) ) ( not ( = ?auto_189245 ?auto_189247 ) ) ( not ( = ?auto_189246 ?auto_189247 ) ) ( ON ?auto_189245 ?auto_189246 ) ( ON-TABLE ?auto_189247 ) ( ON ?auto_189244 ?auto_189245 ) ( ON ?auto_189243 ?auto_189244 ) ( CLEAR ?auto_189241 ) ( ON ?auto_189242 ?auto_189243 ) ( CLEAR ?auto_189242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189247 ?auto_189246 ?auto_189245 ?auto_189244 ?auto_189243 )
      ( MAKE-8PILE ?auto_189239 ?auto_189240 ?auto_189241 ?auto_189242 ?auto_189243 ?auto_189244 ?auto_189245 ?auto_189246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189248 - BLOCK
      ?auto_189249 - BLOCK
      ?auto_189250 - BLOCK
      ?auto_189251 - BLOCK
      ?auto_189252 - BLOCK
      ?auto_189253 - BLOCK
      ?auto_189254 - BLOCK
      ?auto_189255 - BLOCK
    )
    :vars
    (
      ?auto_189256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189248 ) ( ON ?auto_189249 ?auto_189248 ) ( not ( = ?auto_189248 ?auto_189249 ) ) ( not ( = ?auto_189248 ?auto_189250 ) ) ( not ( = ?auto_189248 ?auto_189251 ) ) ( not ( = ?auto_189248 ?auto_189252 ) ) ( not ( = ?auto_189248 ?auto_189253 ) ) ( not ( = ?auto_189248 ?auto_189254 ) ) ( not ( = ?auto_189248 ?auto_189255 ) ) ( not ( = ?auto_189249 ?auto_189250 ) ) ( not ( = ?auto_189249 ?auto_189251 ) ) ( not ( = ?auto_189249 ?auto_189252 ) ) ( not ( = ?auto_189249 ?auto_189253 ) ) ( not ( = ?auto_189249 ?auto_189254 ) ) ( not ( = ?auto_189249 ?auto_189255 ) ) ( not ( = ?auto_189250 ?auto_189251 ) ) ( not ( = ?auto_189250 ?auto_189252 ) ) ( not ( = ?auto_189250 ?auto_189253 ) ) ( not ( = ?auto_189250 ?auto_189254 ) ) ( not ( = ?auto_189250 ?auto_189255 ) ) ( not ( = ?auto_189251 ?auto_189252 ) ) ( not ( = ?auto_189251 ?auto_189253 ) ) ( not ( = ?auto_189251 ?auto_189254 ) ) ( not ( = ?auto_189251 ?auto_189255 ) ) ( not ( = ?auto_189252 ?auto_189253 ) ) ( not ( = ?auto_189252 ?auto_189254 ) ) ( not ( = ?auto_189252 ?auto_189255 ) ) ( not ( = ?auto_189253 ?auto_189254 ) ) ( not ( = ?auto_189253 ?auto_189255 ) ) ( not ( = ?auto_189254 ?auto_189255 ) ) ( ON ?auto_189255 ?auto_189256 ) ( not ( = ?auto_189248 ?auto_189256 ) ) ( not ( = ?auto_189249 ?auto_189256 ) ) ( not ( = ?auto_189250 ?auto_189256 ) ) ( not ( = ?auto_189251 ?auto_189256 ) ) ( not ( = ?auto_189252 ?auto_189256 ) ) ( not ( = ?auto_189253 ?auto_189256 ) ) ( not ( = ?auto_189254 ?auto_189256 ) ) ( not ( = ?auto_189255 ?auto_189256 ) ) ( ON ?auto_189254 ?auto_189255 ) ( ON-TABLE ?auto_189256 ) ( ON ?auto_189253 ?auto_189254 ) ( ON ?auto_189252 ?auto_189253 ) ( ON ?auto_189251 ?auto_189252 ) ( CLEAR ?auto_189251 ) ( HOLDING ?auto_189250 ) ( CLEAR ?auto_189249 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189248 ?auto_189249 ?auto_189250 )
      ( MAKE-8PILE ?auto_189248 ?auto_189249 ?auto_189250 ?auto_189251 ?auto_189252 ?auto_189253 ?auto_189254 ?auto_189255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189257 - BLOCK
      ?auto_189258 - BLOCK
      ?auto_189259 - BLOCK
      ?auto_189260 - BLOCK
      ?auto_189261 - BLOCK
      ?auto_189262 - BLOCK
      ?auto_189263 - BLOCK
      ?auto_189264 - BLOCK
    )
    :vars
    (
      ?auto_189265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189257 ) ( ON ?auto_189258 ?auto_189257 ) ( not ( = ?auto_189257 ?auto_189258 ) ) ( not ( = ?auto_189257 ?auto_189259 ) ) ( not ( = ?auto_189257 ?auto_189260 ) ) ( not ( = ?auto_189257 ?auto_189261 ) ) ( not ( = ?auto_189257 ?auto_189262 ) ) ( not ( = ?auto_189257 ?auto_189263 ) ) ( not ( = ?auto_189257 ?auto_189264 ) ) ( not ( = ?auto_189258 ?auto_189259 ) ) ( not ( = ?auto_189258 ?auto_189260 ) ) ( not ( = ?auto_189258 ?auto_189261 ) ) ( not ( = ?auto_189258 ?auto_189262 ) ) ( not ( = ?auto_189258 ?auto_189263 ) ) ( not ( = ?auto_189258 ?auto_189264 ) ) ( not ( = ?auto_189259 ?auto_189260 ) ) ( not ( = ?auto_189259 ?auto_189261 ) ) ( not ( = ?auto_189259 ?auto_189262 ) ) ( not ( = ?auto_189259 ?auto_189263 ) ) ( not ( = ?auto_189259 ?auto_189264 ) ) ( not ( = ?auto_189260 ?auto_189261 ) ) ( not ( = ?auto_189260 ?auto_189262 ) ) ( not ( = ?auto_189260 ?auto_189263 ) ) ( not ( = ?auto_189260 ?auto_189264 ) ) ( not ( = ?auto_189261 ?auto_189262 ) ) ( not ( = ?auto_189261 ?auto_189263 ) ) ( not ( = ?auto_189261 ?auto_189264 ) ) ( not ( = ?auto_189262 ?auto_189263 ) ) ( not ( = ?auto_189262 ?auto_189264 ) ) ( not ( = ?auto_189263 ?auto_189264 ) ) ( ON ?auto_189264 ?auto_189265 ) ( not ( = ?auto_189257 ?auto_189265 ) ) ( not ( = ?auto_189258 ?auto_189265 ) ) ( not ( = ?auto_189259 ?auto_189265 ) ) ( not ( = ?auto_189260 ?auto_189265 ) ) ( not ( = ?auto_189261 ?auto_189265 ) ) ( not ( = ?auto_189262 ?auto_189265 ) ) ( not ( = ?auto_189263 ?auto_189265 ) ) ( not ( = ?auto_189264 ?auto_189265 ) ) ( ON ?auto_189263 ?auto_189264 ) ( ON-TABLE ?auto_189265 ) ( ON ?auto_189262 ?auto_189263 ) ( ON ?auto_189261 ?auto_189262 ) ( ON ?auto_189260 ?auto_189261 ) ( CLEAR ?auto_189258 ) ( ON ?auto_189259 ?auto_189260 ) ( CLEAR ?auto_189259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189265 ?auto_189264 ?auto_189263 ?auto_189262 ?auto_189261 ?auto_189260 )
      ( MAKE-8PILE ?auto_189257 ?auto_189258 ?auto_189259 ?auto_189260 ?auto_189261 ?auto_189262 ?auto_189263 ?auto_189264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189266 - BLOCK
      ?auto_189267 - BLOCK
      ?auto_189268 - BLOCK
      ?auto_189269 - BLOCK
      ?auto_189270 - BLOCK
      ?auto_189271 - BLOCK
      ?auto_189272 - BLOCK
      ?auto_189273 - BLOCK
    )
    :vars
    (
      ?auto_189274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189266 ) ( not ( = ?auto_189266 ?auto_189267 ) ) ( not ( = ?auto_189266 ?auto_189268 ) ) ( not ( = ?auto_189266 ?auto_189269 ) ) ( not ( = ?auto_189266 ?auto_189270 ) ) ( not ( = ?auto_189266 ?auto_189271 ) ) ( not ( = ?auto_189266 ?auto_189272 ) ) ( not ( = ?auto_189266 ?auto_189273 ) ) ( not ( = ?auto_189267 ?auto_189268 ) ) ( not ( = ?auto_189267 ?auto_189269 ) ) ( not ( = ?auto_189267 ?auto_189270 ) ) ( not ( = ?auto_189267 ?auto_189271 ) ) ( not ( = ?auto_189267 ?auto_189272 ) ) ( not ( = ?auto_189267 ?auto_189273 ) ) ( not ( = ?auto_189268 ?auto_189269 ) ) ( not ( = ?auto_189268 ?auto_189270 ) ) ( not ( = ?auto_189268 ?auto_189271 ) ) ( not ( = ?auto_189268 ?auto_189272 ) ) ( not ( = ?auto_189268 ?auto_189273 ) ) ( not ( = ?auto_189269 ?auto_189270 ) ) ( not ( = ?auto_189269 ?auto_189271 ) ) ( not ( = ?auto_189269 ?auto_189272 ) ) ( not ( = ?auto_189269 ?auto_189273 ) ) ( not ( = ?auto_189270 ?auto_189271 ) ) ( not ( = ?auto_189270 ?auto_189272 ) ) ( not ( = ?auto_189270 ?auto_189273 ) ) ( not ( = ?auto_189271 ?auto_189272 ) ) ( not ( = ?auto_189271 ?auto_189273 ) ) ( not ( = ?auto_189272 ?auto_189273 ) ) ( ON ?auto_189273 ?auto_189274 ) ( not ( = ?auto_189266 ?auto_189274 ) ) ( not ( = ?auto_189267 ?auto_189274 ) ) ( not ( = ?auto_189268 ?auto_189274 ) ) ( not ( = ?auto_189269 ?auto_189274 ) ) ( not ( = ?auto_189270 ?auto_189274 ) ) ( not ( = ?auto_189271 ?auto_189274 ) ) ( not ( = ?auto_189272 ?auto_189274 ) ) ( not ( = ?auto_189273 ?auto_189274 ) ) ( ON ?auto_189272 ?auto_189273 ) ( ON-TABLE ?auto_189274 ) ( ON ?auto_189271 ?auto_189272 ) ( ON ?auto_189270 ?auto_189271 ) ( ON ?auto_189269 ?auto_189270 ) ( ON ?auto_189268 ?auto_189269 ) ( CLEAR ?auto_189268 ) ( HOLDING ?auto_189267 ) ( CLEAR ?auto_189266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189266 ?auto_189267 )
      ( MAKE-8PILE ?auto_189266 ?auto_189267 ?auto_189268 ?auto_189269 ?auto_189270 ?auto_189271 ?auto_189272 ?auto_189273 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189275 - BLOCK
      ?auto_189276 - BLOCK
      ?auto_189277 - BLOCK
      ?auto_189278 - BLOCK
      ?auto_189279 - BLOCK
      ?auto_189280 - BLOCK
      ?auto_189281 - BLOCK
      ?auto_189282 - BLOCK
    )
    :vars
    (
      ?auto_189283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189275 ) ( not ( = ?auto_189275 ?auto_189276 ) ) ( not ( = ?auto_189275 ?auto_189277 ) ) ( not ( = ?auto_189275 ?auto_189278 ) ) ( not ( = ?auto_189275 ?auto_189279 ) ) ( not ( = ?auto_189275 ?auto_189280 ) ) ( not ( = ?auto_189275 ?auto_189281 ) ) ( not ( = ?auto_189275 ?auto_189282 ) ) ( not ( = ?auto_189276 ?auto_189277 ) ) ( not ( = ?auto_189276 ?auto_189278 ) ) ( not ( = ?auto_189276 ?auto_189279 ) ) ( not ( = ?auto_189276 ?auto_189280 ) ) ( not ( = ?auto_189276 ?auto_189281 ) ) ( not ( = ?auto_189276 ?auto_189282 ) ) ( not ( = ?auto_189277 ?auto_189278 ) ) ( not ( = ?auto_189277 ?auto_189279 ) ) ( not ( = ?auto_189277 ?auto_189280 ) ) ( not ( = ?auto_189277 ?auto_189281 ) ) ( not ( = ?auto_189277 ?auto_189282 ) ) ( not ( = ?auto_189278 ?auto_189279 ) ) ( not ( = ?auto_189278 ?auto_189280 ) ) ( not ( = ?auto_189278 ?auto_189281 ) ) ( not ( = ?auto_189278 ?auto_189282 ) ) ( not ( = ?auto_189279 ?auto_189280 ) ) ( not ( = ?auto_189279 ?auto_189281 ) ) ( not ( = ?auto_189279 ?auto_189282 ) ) ( not ( = ?auto_189280 ?auto_189281 ) ) ( not ( = ?auto_189280 ?auto_189282 ) ) ( not ( = ?auto_189281 ?auto_189282 ) ) ( ON ?auto_189282 ?auto_189283 ) ( not ( = ?auto_189275 ?auto_189283 ) ) ( not ( = ?auto_189276 ?auto_189283 ) ) ( not ( = ?auto_189277 ?auto_189283 ) ) ( not ( = ?auto_189278 ?auto_189283 ) ) ( not ( = ?auto_189279 ?auto_189283 ) ) ( not ( = ?auto_189280 ?auto_189283 ) ) ( not ( = ?auto_189281 ?auto_189283 ) ) ( not ( = ?auto_189282 ?auto_189283 ) ) ( ON ?auto_189281 ?auto_189282 ) ( ON-TABLE ?auto_189283 ) ( ON ?auto_189280 ?auto_189281 ) ( ON ?auto_189279 ?auto_189280 ) ( ON ?auto_189278 ?auto_189279 ) ( ON ?auto_189277 ?auto_189278 ) ( CLEAR ?auto_189275 ) ( ON ?auto_189276 ?auto_189277 ) ( CLEAR ?auto_189276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189283 ?auto_189282 ?auto_189281 ?auto_189280 ?auto_189279 ?auto_189278 ?auto_189277 )
      ( MAKE-8PILE ?auto_189275 ?auto_189276 ?auto_189277 ?auto_189278 ?auto_189279 ?auto_189280 ?auto_189281 ?auto_189282 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189284 - BLOCK
      ?auto_189285 - BLOCK
      ?auto_189286 - BLOCK
      ?auto_189287 - BLOCK
      ?auto_189288 - BLOCK
      ?auto_189289 - BLOCK
      ?auto_189290 - BLOCK
      ?auto_189291 - BLOCK
    )
    :vars
    (
      ?auto_189292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189284 ?auto_189285 ) ) ( not ( = ?auto_189284 ?auto_189286 ) ) ( not ( = ?auto_189284 ?auto_189287 ) ) ( not ( = ?auto_189284 ?auto_189288 ) ) ( not ( = ?auto_189284 ?auto_189289 ) ) ( not ( = ?auto_189284 ?auto_189290 ) ) ( not ( = ?auto_189284 ?auto_189291 ) ) ( not ( = ?auto_189285 ?auto_189286 ) ) ( not ( = ?auto_189285 ?auto_189287 ) ) ( not ( = ?auto_189285 ?auto_189288 ) ) ( not ( = ?auto_189285 ?auto_189289 ) ) ( not ( = ?auto_189285 ?auto_189290 ) ) ( not ( = ?auto_189285 ?auto_189291 ) ) ( not ( = ?auto_189286 ?auto_189287 ) ) ( not ( = ?auto_189286 ?auto_189288 ) ) ( not ( = ?auto_189286 ?auto_189289 ) ) ( not ( = ?auto_189286 ?auto_189290 ) ) ( not ( = ?auto_189286 ?auto_189291 ) ) ( not ( = ?auto_189287 ?auto_189288 ) ) ( not ( = ?auto_189287 ?auto_189289 ) ) ( not ( = ?auto_189287 ?auto_189290 ) ) ( not ( = ?auto_189287 ?auto_189291 ) ) ( not ( = ?auto_189288 ?auto_189289 ) ) ( not ( = ?auto_189288 ?auto_189290 ) ) ( not ( = ?auto_189288 ?auto_189291 ) ) ( not ( = ?auto_189289 ?auto_189290 ) ) ( not ( = ?auto_189289 ?auto_189291 ) ) ( not ( = ?auto_189290 ?auto_189291 ) ) ( ON ?auto_189291 ?auto_189292 ) ( not ( = ?auto_189284 ?auto_189292 ) ) ( not ( = ?auto_189285 ?auto_189292 ) ) ( not ( = ?auto_189286 ?auto_189292 ) ) ( not ( = ?auto_189287 ?auto_189292 ) ) ( not ( = ?auto_189288 ?auto_189292 ) ) ( not ( = ?auto_189289 ?auto_189292 ) ) ( not ( = ?auto_189290 ?auto_189292 ) ) ( not ( = ?auto_189291 ?auto_189292 ) ) ( ON ?auto_189290 ?auto_189291 ) ( ON-TABLE ?auto_189292 ) ( ON ?auto_189289 ?auto_189290 ) ( ON ?auto_189288 ?auto_189289 ) ( ON ?auto_189287 ?auto_189288 ) ( ON ?auto_189286 ?auto_189287 ) ( ON ?auto_189285 ?auto_189286 ) ( CLEAR ?auto_189285 ) ( HOLDING ?auto_189284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189284 )
      ( MAKE-8PILE ?auto_189284 ?auto_189285 ?auto_189286 ?auto_189287 ?auto_189288 ?auto_189289 ?auto_189290 ?auto_189291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189293 - BLOCK
      ?auto_189294 - BLOCK
      ?auto_189295 - BLOCK
      ?auto_189296 - BLOCK
      ?auto_189297 - BLOCK
      ?auto_189298 - BLOCK
      ?auto_189299 - BLOCK
      ?auto_189300 - BLOCK
    )
    :vars
    (
      ?auto_189301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189293 ?auto_189294 ) ) ( not ( = ?auto_189293 ?auto_189295 ) ) ( not ( = ?auto_189293 ?auto_189296 ) ) ( not ( = ?auto_189293 ?auto_189297 ) ) ( not ( = ?auto_189293 ?auto_189298 ) ) ( not ( = ?auto_189293 ?auto_189299 ) ) ( not ( = ?auto_189293 ?auto_189300 ) ) ( not ( = ?auto_189294 ?auto_189295 ) ) ( not ( = ?auto_189294 ?auto_189296 ) ) ( not ( = ?auto_189294 ?auto_189297 ) ) ( not ( = ?auto_189294 ?auto_189298 ) ) ( not ( = ?auto_189294 ?auto_189299 ) ) ( not ( = ?auto_189294 ?auto_189300 ) ) ( not ( = ?auto_189295 ?auto_189296 ) ) ( not ( = ?auto_189295 ?auto_189297 ) ) ( not ( = ?auto_189295 ?auto_189298 ) ) ( not ( = ?auto_189295 ?auto_189299 ) ) ( not ( = ?auto_189295 ?auto_189300 ) ) ( not ( = ?auto_189296 ?auto_189297 ) ) ( not ( = ?auto_189296 ?auto_189298 ) ) ( not ( = ?auto_189296 ?auto_189299 ) ) ( not ( = ?auto_189296 ?auto_189300 ) ) ( not ( = ?auto_189297 ?auto_189298 ) ) ( not ( = ?auto_189297 ?auto_189299 ) ) ( not ( = ?auto_189297 ?auto_189300 ) ) ( not ( = ?auto_189298 ?auto_189299 ) ) ( not ( = ?auto_189298 ?auto_189300 ) ) ( not ( = ?auto_189299 ?auto_189300 ) ) ( ON ?auto_189300 ?auto_189301 ) ( not ( = ?auto_189293 ?auto_189301 ) ) ( not ( = ?auto_189294 ?auto_189301 ) ) ( not ( = ?auto_189295 ?auto_189301 ) ) ( not ( = ?auto_189296 ?auto_189301 ) ) ( not ( = ?auto_189297 ?auto_189301 ) ) ( not ( = ?auto_189298 ?auto_189301 ) ) ( not ( = ?auto_189299 ?auto_189301 ) ) ( not ( = ?auto_189300 ?auto_189301 ) ) ( ON ?auto_189299 ?auto_189300 ) ( ON-TABLE ?auto_189301 ) ( ON ?auto_189298 ?auto_189299 ) ( ON ?auto_189297 ?auto_189298 ) ( ON ?auto_189296 ?auto_189297 ) ( ON ?auto_189295 ?auto_189296 ) ( ON ?auto_189294 ?auto_189295 ) ( ON ?auto_189293 ?auto_189294 ) ( CLEAR ?auto_189293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189301 ?auto_189300 ?auto_189299 ?auto_189298 ?auto_189297 ?auto_189296 ?auto_189295 ?auto_189294 )
      ( MAKE-8PILE ?auto_189293 ?auto_189294 ?auto_189295 ?auto_189296 ?auto_189297 ?auto_189298 ?auto_189299 ?auto_189300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189438 - BLOCK
    )
    :vars
    (
      ?auto_189439 - BLOCK
      ?auto_189440 - BLOCK
      ?auto_189441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189438 ?auto_189439 ) ( CLEAR ?auto_189438 ) ( not ( = ?auto_189438 ?auto_189439 ) ) ( HOLDING ?auto_189440 ) ( CLEAR ?auto_189441 ) ( not ( = ?auto_189438 ?auto_189440 ) ) ( not ( = ?auto_189438 ?auto_189441 ) ) ( not ( = ?auto_189439 ?auto_189440 ) ) ( not ( = ?auto_189439 ?auto_189441 ) ) ( not ( = ?auto_189440 ?auto_189441 ) ) )
    :subtasks
    ( ( !STACK ?auto_189440 ?auto_189441 )
      ( MAKE-1PILE ?auto_189438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189442 - BLOCK
    )
    :vars
    (
      ?auto_189443 - BLOCK
      ?auto_189444 - BLOCK
      ?auto_189445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189442 ?auto_189443 ) ( not ( = ?auto_189442 ?auto_189443 ) ) ( CLEAR ?auto_189444 ) ( not ( = ?auto_189442 ?auto_189445 ) ) ( not ( = ?auto_189442 ?auto_189444 ) ) ( not ( = ?auto_189443 ?auto_189445 ) ) ( not ( = ?auto_189443 ?auto_189444 ) ) ( not ( = ?auto_189445 ?auto_189444 ) ) ( ON ?auto_189445 ?auto_189442 ) ( CLEAR ?auto_189445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189443 ?auto_189442 )
      ( MAKE-1PILE ?auto_189442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189446 - BLOCK
    )
    :vars
    (
      ?auto_189448 - BLOCK
      ?auto_189447 - BLOCK
      ?auto_189449 - BLOCK
      ?auto_189451 - BLOCK
      ?auto_189454 - BLOCK
      ?auto_189450 - BLOCK
      ?auto_189452 - BLOCK
      ?auto_189453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189446 ?auto_189448 ) ( not ( = ?auto_189446 ?auto_189448 ) ) ( not ( = ?auto_189446 ?auto_189447 ) ) ( not ( = ?auto_189446 ?auto_189449 ) ) ( not ( = ?auto_189448 ?auto_189447 ) ) ( not ( = ?auto_189448 ?auto_189449 ) ) ( not ( = ?auto_189447 ?auto_189449 ) ) ( ON ?auto_189447 ?auto_189446 ) ( CLEAR ?auto_189447 ) ( ON-TABLE ?auto_189448 ) ( HOLDING ?auto_189449 ) ( CLEAR ?auto_189451 ) ( ON-TABLE ?auto_189454 ) ( ON ?auto_189450 ?auto_189454 ) ( ON ?auto_189452 ?auto_189450 ) ( ON ?auto_189453 ?auto_189452 ) ( ON ?auto_189451 ?auto_189453 ) ( not ( = ?auto_189454 ?auto_189450 ) ) ( not ( = ?auto_189454 ?auto_189452 ) ) ( not ( = ?auto_189454 ?auto_189453 ) ) ( not ( = ?auto_189454 ?auto_189451 ) ) ( not ( = ?auto_189454 ?auto_189449 ) ) ( not ( = ?auto_189450 ?auto_189452 ) ) ( not ( = ?auto_189450 ?auto_189453 ) ) ( not ( = ?auto_189450 ?auto_189451 ) ) ( not ( = ?auto_189450 ?auto_189449 ) ) ( not ( = ?auto_189452 ?auto_189453 ) ) ( not ( = ?auto_189452 ?auto_189451 ) ) ( not ( = ?auto_189452 ?auto_189449 ) ) ( not ( = ?auto_189453 ?auto_189451 ) ) ( not ( = ?auto_189453 ?auto_189449 ) ) ( not ( = ?auto_189451 ?auto_189449 ) ) ( not ( = ?auto_189446 ?auto_189451 ) ) ( not ( = ?auto_189446 ?auto_189454 ) ) ( not ( = ?auto_189446 ?auto_189450 ) ) ( not ( = ?auto_189446 ?auto_189452 ) ) ( not ( = ?auto_189446 ?auto_189453 ) ) ( not ( = ?auto_189448 ?auto_189451 ) ) ( not ( = ?auto_189448 ?auto_189454 ) ) ( not ( = ?auto_189448 ?auto_189450 ) ) ( not ( = ?auto_189448 ?auto_189452 ) ) ( not ( = ?auto_189448 ?auto_189453 ) ) ( not ( = ?auto_189447 ?auto_189451 ) ) ( not ( = ?auto_189447 ?auto_189454 ) ) ( not ( = ?auto_189447 ?auto_189450 ) ) ( not ( = ?auto_189447 ?auto_189452 ) ) ( not ( = ?auto_189447 ?auto_189453 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189454 ?auto_189450 ?auto_189452 ?auto_189453 ?auto_189451 ?auto_189449 )
      ( MAKE-1PILE ?auto_189446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189455 - BLOCK
    )
    :vars
    (
      ?auto_189459 - BLOCK
      ?auto_189462 - BLOCK
      ?auto_189456 - BLOCK
      ?auto_189458 - BLOCK
      ?auto_189457 - BLOCK
      ?auto_189461 - BLOCK
      ?auto_189463 - BLOCK
      ?auto_189460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189455 ?auto_189459 ) ( not ( = ?auto_189455 ?auto_189459 ) ) ( not ( = ?auto_189455 ?auto_189462 ) ) ( not ( = ?auto_189455 ?auto_189456 ) ) ( not ( = ?auto_189459 ?auto_189462 ) ) ( not ( = ?auto_189459 ?auto_189456 ) ) ( not ( = ?auto_189462 ?auto_189456 ) ) ( ON ?auto_189462 ?auto_189455 ) ( ON-TABLE ?auto_189459 ) ( CLEAR ?auto_189458 ) ( ON-TABLE ?auto_189457 ) ( ON ?auto_189461 ?auto_189457 ) ( ON ?auto_189463 ?auto_189461 ) ( ON ?auto_189460 ?auto_189463 ) ( ON ?auto_189458 ?auto_189460 ) ( not ( = ?auto_189457 ?auto_189461 ) ) ( not ( = ?auto_189457 ?auto_189463 ) ) ( not ( = ?auto_189457 ?auto_189460 ) ) ( not ( = ?auto_189457 ?auto_189458 ) ) ( not ( = ?auto_189457 ?auto_189456 ) ) ( not ( = ?auto_189461 ?auto_189463 ) ) ( not ( = ?auto_189461 ?auto_189460 ) ) ( not ( = ?auto_189461 ?auto_189458 ) ) ( not ( = ?auto_189461 ?auto_189456 ) ) ( not ( = ?auto_189463 ?auto_189460 ) ) ( not ( = ?auto_189463 ?auto_189458 ) ) ( not ( = ?auto_189463 ?auto_189456 ) ) ( not ( = ?auto_189460 ?auto_189458 ) ) ( not ( = ?auto_189460 ?auto_189456 ) ) ( not ( = ?auto_189458 ?auto_189456 ) ) ( not ( = ?auto_189455 ?auto_189458 ) ) ( not ( = ?auto_189455 ?auto_189457 ) ) ( not ( = ?auto_189455 ?auto_189461 ) ) ( not ( = ?auto_189455 ?auto_189463 ) ) ( not ( = ?auto_189455 ?auto_189460 ) ) ( not ( = ?auto_189459 ?auto_189458 ) ) ( not ( = ?auto_189459 ?auto_189457 ) ) ( not ( = ?auto_189459 ?auto_189461 ) ) ( not ( = ?auto_189459 ?auto_189463 ) ) ( not ( = ?auto_189459 ?auto_189460 ) ) ( not ( = ?auto_189462 ?auto_189458 ) ) ( not ( = ?auto_189462 ?auto_189457 ) ) ( not ( = ?auto_189462 ?auto_189461 ) ) ( not ( = ?auto_189462 ?auto_189463 ) ) ( not ( = ?auto_189462 ?auto_189460 ) ) ( ON ?auto_189456 ?auto_189462 ) ( CLEAR ?auto_189456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189459 ?auto_189455 ?auto_189462 )
      ( MAKE-1PILE ?auto_189455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189464 - BLOCK
    )
    :vars
    (
      ?auto_189471 - BLOCK
      ?auto_189466 - BLOCK
      ?auto_189467 - BLOCK
      ?auto_189470 - BLOCK
      ?auto_189472 - BLOCK
      ?auto_189469 - BLOCK
      ?auto_189468 - BLOCK
      ?auto_189465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189464 ?auto_189471 ) ( not ( = ?auto_189464 ?auto_189471 ) ) ( not ( = ?auto_189464 ?auto_189466 ) ) ( not ( = ?auto_189464 ?auto_189467 ) ) ( not ( = ?auto_189471 ?auto_189466 ) ) ( not ( = ?auto_189471 ?auto_189467 ) ) ( not ( = ?auto_189466 ?auto_189467 ) ) ( ON ?auto_189466 ?auto_189464 ) ( ON-TABLE ?auto_189471 ) ( ON-TABLE ?auto_189470 ) ( ON ?auto_189472 ?auto_189470 ) ( ON ?auto_189469 ?auto_189472 ) ( ON ?auto_189468 ?auto_189469 ) ( not ( = ?auto_189470 ?auto_189472 ) ) ( not ( = ?auto_189470 ?auto_189469 ) ) ( not ( = ?auto_189470 ?auto_189468 ) ) ( not ( = ?auto_189470 ?auto_189465 ) ) ( not ( = ?auto_189470 ?auto_189467 ) ) ( not ( = ?auto_189472 ?auto_189469 ) ) ( not ( = ?auto_189472 ?auto_189468 ) ) ( not ( = ?auto_189472 ?auto_189465 ) ) ( not ( = ?auto_189472 ?auto_189467 ) ) ( not ( = ?auto_189469 ?auto_189468 ) ) ( not ( = ?auto_189469 ?auto_189465 ) ) ( not ( = ?auto_189469 ?auto_189467 ) ) ( not ( = ?auto_189468 ?auto_189465 ) ) ( not ( = ?auto_189468 ?auto_189467 ) ) ( not ( = ?auto_189465 ?auto_189467 ) ) ( not ( = ?auto_189464 ?auto_189465 ) ) ( not ( = ?auto_189464 ?auto_189470 ) ) ( not ( = ?auto_189464 ?auto_189472 ) ) ( not ( = ?auto_189464 ?auto_189469 ) ) ( not ( = ?auto_189464 ?auto_189468 ) ) ( not ( = ?auto_189471 ?auto_189465 ) ) ( not ( = ?auto_189471 ?auto_189470 ) ) ( not ( = ?auto_189471 ?auto_189472 ) ) ( not ( = ?auto_189471 ?auto_189469 ) ) ( not ( = ?auto_189471 ?auto_189468 ) ) ( not ( = ?auto_189466 ?auto_189465 ) ) ( not ( = ?auto_189466 ?auto_189470 ) ) ( not ( = ?auto_189466 ?auto_189472 ) ) ( not ( = ?auto_189466 ?auto_189469 ) ) ( not ( = ?auto_189466 ?auto_189468 ) ) ( ON ?auto_189467 ?auto_189466 ) ( CLEAR ?auto_189467 ) ( HOLDING ?auto_189465 ) ( CLEAR ?auto_189468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189470 ?auto_189472 ?auto_189469 ?auto_189468 ?auto_189465 )
      ( MAKE-1PILE ?auto_189464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189473 - BLOCK
    )
    :vars
    (
      ?auto_189481 - BLOCK
      ?auto_189475 - BLOCK
      ?auto_189476 - BLOCK
      ?auto_189477 - BLOCK
      ?auto_189480 - BLOCK
      ?auto_189478 - BLOCK
      ?auto_189479 - BLOCK
      ?auto_189474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189473 ?auto_189481 ) ( not ( = ?auto_189473 ?auto_189481 ) ) ( not ( = ?auto_189473 ?auto_189475 ) ) ( not ( = ?auto_189473 ?auto_189476 ) ) ( not ( = ?auto_189481 ?auto_189475 ) ) ( not ( = ?auto_189481 ?auto_189476 ) ) ( not ( = ?auto_189475 ?auto_189476 ) ) ( ON ?auto_189475 ?auto_189473 ) ( ON-TABLE ?auto_189481 ) ( ON-TABLE ?auto_189477 ) ( ON ?auto_189480 ?auto_189477 ) ( ON ?auto_189478 ?auto_189480 ) ( ON ?auto_189479 ?auto_189478 ) ( not ( = ?auto_189477 ?auto_189480 ) ) ( not ( = ?auto_189477 ?auto_189478 ) ) ( not ( = ?auto_189477 ?auto_189479 ) ) ( not ( = ?auto_189477 ?auto_189474 ) ) ( not ( = ?auto_189477 ?auto_189476 ) ) ( not ( = ?auto_189480 ?auto_189478 ) ) ( not ( = ?auto_189480 ?auto_189479 ) ) ( not ( = ?auto_189480 ?auto_189474 ) ) ( not ( = ?auto_189480 ?auto_189476 ) ) ( not ( = ?auto_189478 ?auto_189479 ) ) ( not ( = ?auto_189478 ?auto_189474 ) ) ( not ( = ?auto_189478 ?auto_189476 ) ) ( not ( = ?auto_189479 ?auto_189474 ) ) ( not ( = ?auto_189479 ?auto_189476 ) ) ( not ( = ?auto_189474 ?auto_189476 ) ) ( not ( = ?auto_189473 ?auto_189474 ) ) ( not ( = ?auto_189473 ?auto_189477 ) ) ( not ( = ?auto_189473 ?auto_189480 ) ) ( not ( = ?auto_189473 ?auto_189478 ) ) ( not ( = ?auto_189473 ?auto_189479 ) ) ( not ( = ?auto_189481 ?auto_189474 ) ) ( not ( = ?auto_189481 ?auto_189477 ) ) ( not ( = ?auto_189481 ?auto_189480 ) ) ( not ( = ?auto_189481 ?auto_189478 ) ) ( not ( = ?auto_189481 ?auto_189479 ) ) ( not ( = ?auto_189475 ?auto_189474 ) ) ( not ( = ?auto_189475 ?auto_189477 ) ) ( not ( = ?auto_189475 ?auto_189480 ) ) ( not ( = ?auto_189475 ?auto_189478 ) ) ( not ( = ?auto_189475 ?auto_189479 ) ) ( ON ?auto_189476 ?auto_189475 ) ( CLEAR ?auto_189479 ) ( ON ?auto_189474 ?auto_189476 ) ( CLEAR ?auto_189474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189481 ?auto_189473 ?auto_189475 ?auto_189476 )
      ( MAKE-1PILE ?auto_189473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189482 - BLOCK
    )
    :vars
    (
      ?auto_189486 - BLOCK
      ?auto_189483 - BLOCK
      ?auto_189488 - BLOCK
      ?auto_189489 - BLOCK
      ?auto_189487 - BLOCK
      ?auto_189484 - BLOCK
      ?auto_189485 - BLOCK
      ?auto_189490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189482 ?auto_189486 ) ( not ( = ?auto_189482 ?auto_189486 ) ) ( not ( = ?auto_189482 ?auto_189483 ) ) ( not ( = ?auto_189482 ?auto_189488 ) ) ( not ( = ?auto_189486 ?auto_189483 ) ) ( not ( = ?auto_189486 ?auto_189488 ) ) ( not ( = ?auto_189483 ?auto_189488 ) ) ( ON ?auto_189483 ?auto_189482 ) ( ON-TABLE ?auto_189486 ) ( ON-TABLE ?auto_189489 ) ( ON ?auto_189487 ?auto_189489 ) ( ON ?auto_189484 ?auto_189487 ) ( not ( = ?auto_189489 ?auto_189487 ) ) ( not ( = ?auto_189489 ?auto_189484 ) ) ( not ( = ?auto_189489 ?auto_189485 ) ) ( not ( = ?auto_189489 ?auto_189490 ) ) ( not ( = ?auto_189489 ?auto_189488 ) ) ( not ( = ?auto_189487 ?auto_189484 ) ) ( not ( = ?auto_189487 ?auto_189485 ) ) ( not ( = ?auto_189487 ?auto_189490 ) ) ( not ( = ?auto_189487 ?auto_189488 ) ) ( not ( = ?auto_189484 ?auto_189485 ) ) ( not ( = ?auto_189484 ?auto_189490 ) ) ( not ( = ?auto_189484 ?auto_189488 ) ) ( not ( = ?auto_189485 ?auto_189490 ) ) ( not ( = ?auto_189485 ?auto_189488 ) ) ( not ( = ?auto_189490 ?auto_189488 ) ) ( not ( = ?auto_189482 ?auto_189490 ) ) ( not ( = ?auto_189482 ?auto_189489 ) ) ( not ( = ?auto_189482 ?auto_189487 ) ) ( not ( = ?auto_189482 ?auto_189484 ) ) ( not ( = ?auto_189482 ?auto_189485 ) ) ( not ( = ?auto_189486 ?auto_189490 ) ) ( not ( = ?auto_189486 ?auto_189489 ) ) ( not ( = ?auto_189486 ?auto_189487 ) ) ( not ( = ?auto_189486 ?auto_189484 ) ) ( not ( = ?auto_189486 ?auto_189485 ) ) ( not ( = ?auto_189483 ?auto_189490 ) ) ( not ( = ?auto_189483 ?auto_189489 ) ) ( not ( = ?auto_189483 ?auto_189487 ) ) ( not ( = ?auto_189483 ?auto_189484 ) ) ( not ( = ?auto_189483 ?auto_189485 ) ) ( ON ?auto_189488 ?auto_189483 ) ( ON ?auto_189490 ?auto_189488 ) ( CLEAR ?auto_189490 ) ( HOLDING ?auto_189485 ) ( CLEAR ?auto_189484 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189489 ?auto_189487 ?auto_189484 ?auto_189485 )
      ( MAKE-1PILE ?auto_189482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189491 - BLOCK
    )
    :vars
    (
      ?auto_189499 - BLOCK
      ?auto_189495 - BLOCK
      ?auto_189492 - BLOCK
      ?auto_189497 - BLOCK
      ?auto_189494 - BLOCK
      ?auto_189496 - BLOCK
      ?auto_189493 - BLOCK
      ?auto_189498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189491 ?auto_189499 ) ( not ( = ?auto_189491 ?auto_189499 ) ) ( not ( = ?auto_189491 ?auto_189495 ) ) ( not ( = ?auto_189491 ?auto_189492 ) ) ( not ( = ?auto_189499 ?auto_189495 ) ) ( not ( = ?auto_189499 ?auto_189492 ) ) ( not ( = ?auto_189495 ?auto_189492 ) ) ( ON ?auto_189495 ?auto_189491 ) ( ON-TABLE ?auto_189499 ) ( ON-TABLE ?auto_189497 ) ( ON ?auto_189494 ?auto_189497 ) ( ON ?auto_189496 ?auto_189494 ) ( not ( = ?auto_189497 ?auto_189494 ) ) ( not ( = ?auto_189497 ?auto_189496 ) ) ( not ( = ?auto_189497 ?auto_189493 ) ) ( not ( = ?auto_189497 ?auto_189498 ) ) ( not ( = ?auto_189497 ?auto_189492 ) ) ( not ( = ?auto_189494 ?auto_189496 ) ) ( not ( = ?auto_189494 ?auto_189493 ) ) ( not ( = ?auto_189494 ?auto_189498 ) ) ( not ( = ?auto_189494 ?auto_189492 ) ) ( not ( = ?auto_189496 ?auto_189493 ) ) ( not ( = ?auto_189496 ?auto_189498 ) ) ( not ( = ?auto_189496 ?auto_189492 ) ) ( not ( = ?auto_189493 ?auto_189498 ) ) ( not ( = ?auto_189493 ?auto_189492 ) ) ( not ( = ?auto_189498 ?auto_189492 ) ) ( not ( = ?auto_189491 ?auto_189498 ) ) ( not ( = ?auto_189491 ?auto_189497 ) ) ( not ( = ?auto_189491 ?auto_189494 ) ) ( not ( = ?auto_189491 ?auto_189496 ) ) ( not ( = ?auto_189491 ?auto_189493 ) ) ( not ( = ?auto_189499 ?auto_189498 ) ) ( not ( = ?auto_189499 ?auto_189497 ) ) ( not ( = ?auto_189499 ?auto_189494 ) ) ( not ( = ?auto_189499 ?auto_189496 ) ) ( not ( = ?auto_189499 ?auto_189493 ) ) ( not ( = ?auto_189495 ?auto_189498 ) ) ( not ( = ?auto_189495 ?auto_189497 ) ) ( not ( = ?auto_189495 ?auto_189494 ) ) ( not ( = ?auto_189495 ?auto_189496 ) ) ( not ( = ?auto_189495 ?auto_189493 ) ) ( ON ?auto_189492 ?auto_189495 ) ( ON ?auto_189498 ?auto_189492 ) ( CLEAR ?auto_189496 ) ( ON ?auto_189493 ?auto_189498 ) ( CLEAR ?auto_189493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189499 ?auto_189491 ?auto_189495 ?auto_189492 ?auto_189498 )
      ( MAKE-1PILE ?auto_189491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189500 - BLOCK
    )
    :vars
    (
      ?auto_189504 - BLOCK
      ?auto_189503 - BLOCK
      ?auto_189505 - BLOCK
      ?auto_189502 - BLOCK
      ?auto_189508 - BLOCK
      ?auto_189506 - BLOCK
      ?auto_189501 - BLOCK
      ?auto_189507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189500 ?auto_189504 ) ( not ( = ?auto_189500 ?auto_189504 ) ) ( not ( = ?auto_189500 ?auto_189503 ) ) ( not ( = ?auto_189500 ?auto_189505 ) ) ( not ( = ?auto_189504 ?auto_189503 ) ) ( not ( = ?auto_189504 ?auto_189505 ) ) ( not ( = ?auto_189503 ?auto_189505 ) ) ( ON ?auto_189503 ?auto_189500 ) ( ON-TABLE ?auto_189504 ) ( ON-TABLE ?auto_189502 ) ( ON ?auto_189508 ?auto_189502 ) ( not ( = ?auto_189502 ?auto_189508 ) ) ( not ( = ?auto_189502 ?auto_189506 ) ) ( not ( = ?auto_189502 ?auto_189501 ) ) ( not ( = ?auto_189502 ?auto_189507 ) ) ( not ( = ?auto_189502 ?auto_189505 ) ) ( not ( = ?auto_189508 ?auto_189506 ) ) ( not ( = ?auto_189508 ?auto_189501 ) ) ( not ( = ?auto_189508 ?auto_189507 ) ) ( not ( = ?auto_189508 ?auto_189505 ) ) ( not ( = ?auto_189506 ?auto_189501 ) ) ( not ( = ?auto_189506 ?auto_189507 ) ) ( not ( = ?auto_189506 ?auto_189505 ) ) ( not ( = ?auto_189501 ?auto_189507 ) ) ( not ( = ?auto_189501 ?auto_189505 ) ) ( not ( = ?auto_189507 ?auto_189505 ) ) ( not ( = ?auto_189500 ?auto_189507 ) ) ( not ( = ?auto_189500 ?auto_189502 ) ) ( not ( = ?auto_189500 ?auto_189508 ) ) ( not ( = ?auto_189500 ?auto_189506 ) ) ( not ( = ?auto_189500 ?auto_189501 ) ) ( not ( = ?auto_189504 ?auto_189507 ) ) ( not ( = ?auto_189504 ?auto_189502 ) ) ( not ( = ?auto_189504 ?auto_189508 ) ) ( not ( = ?auto_189504 ?auto_189506 ) ) ( not ( = ?auto_189504 ?auto_189501 ) ) ( not ( = ?auto_189503 ?auto_189507 ) ) ( not ( = ?auto_189503 ?auto_189502 ) ) ( not ( = ?auto_189503 ?auto_189508 ) ) ( not ( = ?auto_189503 ?auto_189506 ) ) ( not ( = ?auto_189503 ?auto_189501 ) ) ( ON ?auto_189505 ?auto_189503 ) ( ON ?auto_189507 ?auto_189505 ) ( ON ?auto_189501 ?auto_189507 ) ( CLEAR ?auto_189501 ) ( HOLDING ?auto_189506 ) ( CLEAR ?auto_189508 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189502 ?auto_189508 ?auto_189506 )
      ( MAKE-1PILE ?auto_189500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189509 - BLOCK
    )
    :vars
    (
      ?auto_189515 - BLOCK
      ?auto_189517 - BLOCK
      ?auto_189513 - BLOCK
      ?auto_189511 - BLOCK
      ?auto_189514 - BLOCK
      ?auto_189512 - BLOCK
      ?auto_189510 - BLOCK
      ?auto_189516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189509 ?auto_189515 ) ( not ( = ?auto_189509 ?auto_189515 ) ) ( not ( = ?auto_189509 ?auto_189517 ) ) ( not ( = ?auto_189509 ?auto_189513 ) ) ( not ( = ?auto_189515 ?auto_189517 ) ) ( not ( = ?auto_189515 ?auto_189513 ) ) ( not ( = ?auto_189517 ?auto_189513 ) ) ( ON ?auto_189517 ?auto_189509 ) ( ON-TABLE ?auto_189515 ) ( ON-TABLE ?auto_189511 ) ( ON ?auto_189514 ?auto_189511 ) ( not ( = ?auto_189511 ?auto_189514 ) ) ( not ( = ?auto_189511 ?auto_189512 ) ) ( not ( = ?auto_189511 ?auto_189510 ) ) ( not ( = ?auto_189511 ?auto_189516 ) ) ( not ( = ?auto_189511 ?auto_189513 ) ) ( not ( = ?auto_189514 ?auto_189512 ) ) ( not ( = ?auto_189514 ?auto_189510 ) ) ( not ( = ?auto_189514 ?auto_189516 ) ) ( not ( = ?auto_189514 ?auto_189513 ) ) ( not ( = ?auto_189512 ?auto_189510 ) ) ( not ( = ?auto_189512 ?auto_189516 ) ) ( not ( = ?auto_189512 ?auto_189513 ) ) ( not ( = ?auto_189510 ?auto_189516 ) ) ( not ( = ?auto_189510 ?auto_189513 ) ) ( not ( = ?auto_189516 ?auto_189513 ) ) ( not ( = ?auto_189509 ?auto_189516 ) ) ( not ( = ?auto_189509 ?auto_189511 ) ) ( not ( = ?auto_189509 ?auto_189514 ) ) ( not ( = ?auto_189509 ?auto_189512 ) ) ( not ( = ?auto_189509 ?auto_189510 ) ) ( not ( = ?auto_189515 ?auto_189516 ) ) ( not ( = ?auto_189515 ?auto_189511 ) ) ( not ( = ?auto_189515 ?auto_189514 ) ) ( not ( = ?auto_189515 ?auto_189512 ) ) ( not ( = ?auto_189515 ?auto_189510 ) ) ( not ( = ?auto_189517 ?auto_189516 ) ) ( not ( = ?auto_189517 ?auto_189511 ) ) ( not ( = ?auto_189517 ?auto_189514 ) ) ( not ( = ?auto_189517 ?auto_189512 ) ) ( not ( = ?auto_189517 ?auto_189510 ) ) ( ON ?auto_189513 ?auto_189517 ) ( ON ?auto_189516 ?auto_189513 ) ( ON ?auto_189510 ?auto_189516 ) ( CLEAR ?auto_189514 ) ( ON ?auto_189512 ?auto_189510 ) ( CLEAR ?auto_189512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189515 ?auto_189509 ?auto_189517 ?auto_189513 ?auto_189516 ?auto_189510 )
      ( MAKE-1PILE ?auto_189509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189518 - BLOCK
    )
    :vars
    (
      ?auto_189520 - BLOCK
      ?auto_189521 - BLOCK
      ?auto_189522 - BLOCK
      ?auto_189519 - BLOCK
      ?auto_189525 - BLOCK
      ?auto_189524 - BLOCK
      ?auto_189523 - BLOCK
      ?auto_189526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189518 ?auto_189520 ) ( not ( = ?auto_189518 ?auto_189520 ) ) ( not ( = ?auto_189518 ?auto_189521 ) ) ( not ( = ?auto_189518 ?auto_189522 ) ) ( not ( = ?auto_189520 ?auto_189521 ) ) ( not ( = ?auto_189520 ?auto_189522 ) ) ( not ( = ?auto_189521 ?auto_189522 ) ) ( ON ?auto_189521 ?auto_189518 ) ( ON-TABLE ?auto_189520 ) ( ON-TABLE ?auto_189519 ) ( not ( = ?auto_189519 ?auto_189525 ) ) ( not ( = ?auto_189519 ?auto_189524 ) ) ( not ( = ?auto_189519 ?auto_189523 ) ) ( not ( = ?auto_189519 ?auto_189526 ) ) ( not ( = ?auto_189519 ?auto_189522 ) ) ( not ( = ?auto_189525 ?auto_189524 ) ) ( not ( = ?auto_189525 ?auto_189523 ) ) ( not ( = ?auto_189525 ?auto_189526 ) ) ( not ( = ?auto_189525 ?auto_189522 ) ) ( not ( = ?auto_189524 ?auto_189523 ) ) ( not ( = ?auto_189524 ?auto_189526 ) ) ( not ( = ?auto_189524 ?auto_189522 ) ) ( not ( = ?auto_189523 ?auto_189526 ) ) ( not ( = ?auto_189523 ?auto_189522 ) ) ( not ( = ?auto_189526 ?auto_189522 ) ) ( not ( = ?auto_189518 ?auto_189526 ) ) ( not ( = ?auto_189518 ?auto_189519 ) ) ( not ( = ?auto_189518 ?auto_189525 ) ) ( not ( = ?auto_189518 ?auto_189524 ) ) ( not ( = ?auto_189518 ?auto_189523 ) ) ( not ( = ?auto_189520 ?auto_189526 ) ) ( not ( = ?auto_189520 ?auto_189519 ) ) ( not ( = ?auto_189520 ?auto_189525 ) ) ( not ( = ?auto_189520 ?auto_189524 ) ) ( not ( = ?auto_189520 ?auto_189523 ) ) ( not ( = ?auto_189521 ?auto_189526 ) ) ( not ( = ?auto_189521 ?auto_189519 ) ) ( not ( = ?auto_189521 ?auto_189525 ) ) ( not ( = ?auto_189521 ?auto_189524 ) ) ( not ( = ?auto_189521 ?auto_189523 ) ) ( ON ?auto_189522 ?auto_189521 ) ( ON ?auto_189526 ?auto_189522 ) ( ON ?auto_189523 ?auto_189526 ) ( ON ?auto_189524 ?auto_189523 ) ( CLEAR ?auto_189524 ) ( HOLDING ?auto_189525 ) ( CLEAR ?auto_189519 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189519 ?auto_189525 )
      ( MAKE-1PILE ?auto_189518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189527 - BLOCK
    )
    :vars
    (
      ?auto_189529 - BLOCK
      ?auto_189530 - BLOCK
      ?auto_189533 - BLOCK
      ?auto_189528 - BLOCK
      ?auto_189534 - BLOCK
      ?auto_189532 - BLOCK
      ?auto_189535 - BLOCK
      ?auto_189531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189527 ?auto_189529 ) ( not ( = ?auto_189527 ?auto_189529 ) ) ( not ( = ?auto_189527 ?auto_189530 ) ) ( not ( = ?auto_189527 ?auto_189533 ) ) ( not ( = ?auto_189529 ?auto_189530 ) ) ( not ( = ?auto_189529 ?auto_189533 ) ) ( not ( = ?auto_189530 ?auto_189533 ) ) ( ON ?auto_189530 ?auto_189527 ) ( ON-TABLE ?auto_189529 ) ( ON-TABLE ?auto_189528 ) ( not ( = ?auto_189528 ?auto_189534 ) ) ( not ( = ?auto_189528 ?auto_189532 ) ) ( not ( = ?auto_189528 ?auto_189535 ) ) ( not ( = ?auto_189528 ?auto_189531 ) ) ( not ( = ?auto_189528 ?auto_189533 ) ) ( not ( = ?auto_189534 ?auto_189532 ) ) ( not ( = ?auto_189534 ?auto_189535 ) ) ( not ( = ?auto_189534 ?auto_189531 ) ) ( not ( = ?auto_189534 ?auto_189533 ) ) ( not ( = ?auto_189532 ?auto_189535 ) ) ( not ( = ?auto_189532 ?auto_189531 ) ) ( not ( = ?auto_189532 ?auto_189533 ) ) ( not ( = ?auto_189535 ?auto_189531 ) ) ( not ( = ?auto_189535 ?auto_189533 ) ) ( not ( = ?auto_189531 ?auto_189533 ) ) ( not ( = ?auto_189527 ?auto_189531 ) ) ( not ( = ?auto_189527 ?auto_189528 ) ) ( not ( = ?auto_189527 ?auto_189534 ) ) ( not ( = ?auto_189527 ?auto_189532 ) ) ( not ( = ?auto_189527 ?auto_189535 ) ) ( not ( = ?auto_189529 ?auto_189531 ) ) ( not ( = ?auto_189529 ?auto_189528 ) ) ( not ( = ?auto_189529 ?auto_189534 ) ) ( not ( = ?auto_189529 ?auto_189532 ) ) ( not ( = ?auto_189529 ?auto_189535 ) ) ( not ( = ?auto_189530 ?auto_189531 ) ) ( not ( = ?auto_189530 ?auto_189528 ) ) ( not ( = ?auto_189530 ?auto_189534 ) ) ( not ( = ?auto_189530 ?auto_189532 ) ) ( not ( = ?auto_189530 ?auto_189535 ) ) ( ON ?auto_189533 ?auto_189530 ) ( ON ?auto_189531 ?auto_189533 ) ( ON ?auto_189535 ?auto_189531 ) ( ON ?auto_189532 ?auto_189535 ) ( CLEAR ?auto_189528 ) ( ON ?auto_189534 ?auto_189532 ) ( CLEAR ?auto_189534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189529 ?auto_189527 ?auto_189530 ?auto_189533 ?auto_189531 ?auto_189535 ?auto_189532 )
      ( MAKE-1PILE ?auto_189527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189536 - BLOCK
    )
    :vars
    (
      ?auto_189538 - BLOCK
      ?auto_189544 - BLOCK
      ?auto_189539 - BLOCK
      ?auto_189541 - BLOCK
      ?auto_189543 - BLOCK
      ?auto_189537 - BLOCK
      ?auto_189540 - BLOCK
      ?auto_189542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189536 ?auto_189538 ) ( not ( = ?auto_189536 ?auto_189538 ) ) ( not ( = ?auto_189536 ?auto_189544 ) ) ( not ( = ?auto_189536 ?auto_189539 ) ) ( not ( = ?auto_189538 ?auto_189544 ) ) ( not ( = ?auto_189538 ?auto_189539 ) ) ( not ( = ?auto_189544 ?auto_189539 ) ) ( ON ?auto_189544 ?auto_189536 ) ( ON-TABLE ?auto_189538 ) ( not ( = ?auto_189541 ?auto_189543 ) ) ( not ( = ?auto_189541 ?auto_189537 ) ) ( not ( = ?auto_189541 ?auto_189540 ) ) ( not ( = ?auto_189541 ?auto_189542 ) ) ( not ( = ?auto_189541 ?auto_189539 ) ) ( not ( = ?auto_189543 ?auto_189537 ) ) ( not ( = ?auto_189543 ?auto_189540 ) ) ( not ( = ?auto_189543 ?auto_189542 ) ) ( not ( = ?auto_189543 ?auto_189539 ) ) ( not ( = ?auto_189537 ?auto_189540 ) ) ( not ( = ?auto_189537 ?auto_189542 ) ) ( not ( = ?auto_189537 ?auto_189539 ) ) ( not ( = ?auto_189540 ?auto_189542 ) ) ( not ( = ?auto_189540 ?auto_189539 ) ) ( not ( = ?auto_189542 ?auto_189539 ) ) ( not ( = ?auto_189536 ?auto_189542 ) ) ( not ( = ?auto_189536 ?auto_189541 ) ) ( not ( = ?auto_189536 ?auto_189543 ) ) ( not ( = ?auto_189536 ?auto_189537 ) ) ( not ( = ?auto_189536 ?auto_189540 ) ) ( not ( = ?auto_189538 ?auto_189542 ) ) ( not ( = ?auto_189538 ?auto_189541 ) ) ( not ( = ?auto_189538 ?auto_189543 ) ) ( not ( = ?auto_189538 ?auto_189537 ) ) ( not ( = ?auto_189538 ?auto_189540 ) ) ( not ( = ?auto_189544 ?auto_189542 ) ) ( not ( = ?auto_189544 ?auto_189541 ) ) ( not ( = ?auto_189544 ?auto_189543 ) ) ( not ( = ?auto_189544 ?auto_189537 ) ) ( not ( = ?auto_189544 ?auto_189540 ) ) ( ON ?auto_189539 ?auto_189544 ) ( ON ?auto_189542 ?auto_189539 ) ( ON ?auto_189540 ?auto_189542 ) ( ON ?auto_189537 ?auto_189540 ) ( ON ?auto_189543 ?auto_189537 ) ( CLEAR ?auto_189543 ) ( HOLDING ?auto_189541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189541 )
      ( MAKE-1PILE ?auto_189536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189545 - BLOCK
    )
    :vars
    (
      ?auto_189552 - BLOCK
      ?auto_189550 - BLOCK
      ?auto_189549 - BLOCK
      ?auto_189546 - BLOCK
      ?auto_189551 - BLOCK
      ?auto_189548 - BLOCK
      ?auto_189547 - BLOCK
      ?auto_189553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189545 ?auto_189552 ) ( not ( = ?auto_189545 ?auto_189552 ) ) ( not ( = ?auto_189545 ?auto_189550 ) ) ( not ( = ?auto_189545 ?auto_189549 ) ) ( not ( = ?auto_189552 ?auto_189550 ) ) ( not ( = ?auto_189552 ?auto_189549 ) ) ( not ( = ?auto_189550 ?auto_189549 ) ) ( ON ?auto_189550 ?auto_189545 ) ( ON-TABLE ?auto_189552 ) ( not ( = ?auto_189546 ?auto_189551 ) ) ( not ( = ?auto_189546 ?auto_189548 ) ) ( not ( = ?auto_189546 ?auto_189547 ) ) ( not ( = ?auto_189546 ?auto_189553 ) ) ( not ( = ?auto_189546 ?auto_189549 ) ) ( not ( = ?auto_189551 ?auto_189548 ) ) ( not ( = ?auto_189551 ?auto_189547 ) ) ( not ( = ?auto_189551 ?auto_189553 ) ) ( not ( = ?auto_189551 ?auto_189549 ) ) ( not ( = ?auto_189548 ?auto_189547 ) ) ( not ( = ?auto_189548 ?auto_189553 ) ) ( not ( = ?auto_189548 ?auto_189549 ) ) ( not ( = ?auto_189547 ?auto_189553 ) ) ( not ( = ?auto_189547 ?auto_189549 ) ) ( not ( = ?auto_189553 ?auto_189549 ) ) ( not ( = ?auto_189545 ?auto_189553 ) ) ( not ( = ?auto_189545 ?auto_189546 ) ) ( not ( = ?auto_189545 ?auto_189551 ) ) ( not ( = ?auto_189545 ?auto_189548 ) ) ( not ( = ?auto_189545 ?auto_189547 ) ) ( not ( = ?auto_189552 ?auto_189553 ) ) ( not ( = ?auto_189552 ?auto_189546 ) ) ( not ( = ?auto_189552 ?auto_189551 ) ) ( not ( = ?auto_189552 ?auto_189548 ) ) ( not ( = ?auto_189552 ?auto_189547 ) ) ( not ( = ?auto_189550 ?auto_189553 ) ) ( not ( = ?auto_189550 ?auto_189546 ) ) ( not ( = ?auto_189550 ?auto_189551 ) ) ( not ( = ?auto_189550 ?auto_189548 ) ) ( not ( = ?auto_189550 ?auto_189547 ) ) ( ON ?auto_189549 ?auto_189550 ) ( ON ?auto_189553 ?auto_189549 ) ( ON ?auto_189547 ?auto_189553 ) ( ON ?auto_189548 ?auto_189547 ) ( ON ?auto_189551 ?auto_189548 ) ( ON ?auto_189546 ?auto_189551 ) ( CLEAR ?auto_189546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189552 ?auto_189545 ?auto_189550 ?auto_189549 ?auto_189553 ?auto_189547 ?auto_189548 ?auto_189551 )
      ( MAKE-1PILE ?auto_189545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189567 - BLOCK
      ?auto_189568 - BLOCK
      ?auto_189569 - BLOCK
      ?auto_189570 - BLOCK
      ?auto_189571 - BLOCK
      ?auto_189572 - BLOCK
    )
    :vars
    (
      ?auto_189573 - BLOCK
      ?auto_189574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189573 ?auto_189572 ) ( CLEAR ?auto_189573 ) ( ON-TABLE ?auto_189567 ) ( ON ?auto_189568 ?auto_189567 ) ( ON ?auto_189569 ?auto_189568 ) ( ON ?auto_189570 ?auto_189569 ) ( ON ?auto_189571 ?auto_189570 ) ( ON ?auto_189572 ?auto_189571 ) ( not ( = ?auto_189567 ?auto_189568 ) ) ( not ( = ?auto_189567 ?auto_189569 ) ) ( not ( = ?auto_189567 ?auto_189570 ) ) ( not ( = ?auto_189567 ?auto_189571 ) ) ( not ( = ?auto_189567 ?auto_189572 ) ) ( not ( = ?auto_189567 ?auto_189573 ) ) ( not ( = ?auto_189568 ?auto_189569 ) ) ( not ( = ?auto_189568 ?auto_189570 ) ) ( not ( = ?auto_189568 ?auto_189571 ) ) ( not ( = ?auto_189568 ?auto_189572 ) ) ( not ( = ?auto_189568 ?auto_189573 ) ) ( not ( = ?auto_189569 ?auto_189570 ) ) ( not ( = ?auto_189569 ?auto_189571 ) ) ( not ( = ?auto_189569 ?auto_189572 ) ) ( not ( = ?auto_189569 ?auto_189573 ) ) ( not ( = ?auto_189570 ?auto_189571 ) ) ( not ( = ?auto_189570 ?auto_189572 ) ) ( not ( = ?auto_189570 ?auto_189573 ) ) ( not ( = ?auto_189571 ?auto_189572 ) ) ( not ( = ?auto_189571 ?auto_189573 ) ) ( not ( = ?auto_189572 ?auto_189573 ) ) ( HOLDING ?auto_189574 ) ( not ( = ?auto_189567 ?auto_189574 ) ) ( not ( = ?auto_189568 ?auto_189574 ) ) ( not ( = ?auto_189569 ?auto_189574 ) ) ( not ( = ?auto_189570 ?auto_189574 ) ) ( not ( = ?auto_189571 ?auto_189574 ) ) ( not ( = ?auto_189572 ?auto_189574 ) ) ( not ( = ?auto_189573 ?auto_189574 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_189574 )
      ( MAKE-6PILE ?auto_189567 ?auto_189568 ?auto_189569 ?auto_189570 ?auto_189571 ?auto_189572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189692 - BLOCK
      ?auto_189693 - BLOCK
    )
    :vars
    (
      ?auto_189694 - BLOCK
      ?auto_189698 - BLOCK
      ?auto_189697 - BLOCK
      ?auto_189695 - BLOCK
      ?auto_189699 - BLOCK
      ?auto_189696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189692 ?auto_189693 ) ) ( ON ?auto_189693 ?auto_189694 ) ( not ( = ?auto_189692 ?auto_189694 ) ) ( not ( = ?auto_189693 ?auto_189694 ) ) ( ON ?auto_189692 ?auto_189693 ) ( CLEAR ?auto_189692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189698 ) ( ON ?auto_189697 ?auto_189698 ) ( ON ?auto_189695 ?auto_189697 ) ( ON ?auto_189699 ?auto_189695 ) ( ON ?auto_189696 ?auto_189699 ) ( ON ?auto_189694 ?auto_189696 ) ( not ( = ?auto_189698 ?auto_189697 ) ) ( not ( = ?auto_189698 ?auto_189695 ) ) ( not ( = ?auto_189698 ?auto_189699 ) ) ( not ( = ?auto_189698 ?auto_189696 ) ) ( not ( = ?auto_189698 ?auto_189694 ) ) ( not ( = ?auto_189698 ?auto_189693 ) ) ( not ( = ?auto_189698 ?auto_189692 ) ) ( not ( = ?auto_189697 ?auto_189695 ) ) ( not ( = ?auto_189697 ?auto_189699 ) ) ( not ( = ?auto_189697 ?auto_189696 ) ) ( not ( = ?auto_189697 ?auto_189694 ) ) ( not ( = ?auto_189697 ?auto_189693 ) ) ( not ( = ?auto_189697 ?auto_189692 ) ) ( not ( = ?auto_189695 ?auto_189699 ) ) ( not ( = ?auto_189695 ?auto_189696 ) ) ( not ( = ?auto_189695 ?auto_189694 ) ) ( not ( = ?auto_189695 ?auto_189693 ) ) ( not ( = ?auto_189695 ?auto_189692 ) ) ( not ( = ?auto_189699 ?auto_189696 ) ) ( not ( = ?auto_189699 ?auto_189694 ) ) ( not ( = ?auto_189699 ?auto_189693 ) ) ( not ( = ?auto_189699 ?auto_189692 ) ) ( not ( = ?auto_189696 ?auto_189694 ) ) ( not ( = ?auto_189696 ?auto_189693 ) ) ( not ( = ?auto_189696 ?auto_189692 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189698 ?auto_189697 ?auto_189695 ?auto_189699 ?auto_189696 ?auto_189694 ?auto_189693 )
      ( MAKE-2PILE ?auto_189692 ?auto_189693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189702 - BLOCK
      ?auto_189703 - BLOCK
    )
    :vars
    (
      ?auto_189704 - BLOCK
      ?auto_189705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189702 ?auto_189703 ) ) ( ON ?auto_189703 ?auto_189704 ) ( CLEAR ?auto_189703 ) ( not ( = ?auto_189702 ?auto_189704 ) ) ( not ( = ?auto_189703 ?auto_189704 ) ) ( ON ?auto_189702 ?auto_189705 ) ( CLEAR ?auto_189702 ) ( HAND-EMPTY ) ( not ( = ?auto_189702 ?auto_189705 ) ) ( not ( = ?auto_189703 ?auto_189705 ) ) ( not ( = ?auto_189704 ?auto_189705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189702 ?auto_189705 )
      ( MAKE-2PILE ?auto_189702 ?auto_189703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189706 - BLOCK
      ?auto_189707 - BLOCK
    )
    :vars
    (
      ?auto_189709 - BLOCK
      ?auto_189708 - BLOCK
      ?auto_189710 - BLOCK
      ?auto_189713 - BLOCK
      ?auto_189711 - BLOCK
      ?auto_189712 - BLOCK
      ?auto_189714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189706 ?auto_189707 ) ) ( not ( = ?auto_189706 ?auto_189709 ) ) ( not ( = ?auto_189707 ?auto_189709 ) ) ( ON ?auto_189706 ?auto_189708 ) ( CLEAR ?auto_189706 ) ( not ( = ?auto_189706 ?auto_189708 ) ) ( not ( = ?auto_189707 ?auto_189708 ) ) ( not ( = ?auto_189709 ?auto_189708 ) ) ( HOLDING ?auto_189707 ) ( CLEAR ?auto_189709 ) ( ON-TABLE ?auto_189710 ) ( ON ?auto_189713 ?auto_189710 ) ( ON ?auto_189711 ?auto_189713 ) ( ON ?auto_189712 ?auto_189711 ) ( ON ?auto_189714 ?auto_189712 ) ( ON ?auto_189709 ?auto_189714 ) ( not ( = ?auto_189710 ?auto_189713 ) ) ( not ( = ?auto_189710 ?auto_189711 ) ) ( not ( = ?auto_189710 ?auto_189712 ) ) ( not ( = ?auto_189710 ?auto_189714 ) ) ( not ( = ?auto_189710 ?auto_189709 ) ) ( not ( = ?auto_189710 ?auto_189707 ) ) ( not ( = ?auto_189713 ?auto_189711 ) ) ( not ( = ?auto_189713 ?auto_189712 ) ) ( not ( = ?auto_189713 ?auto_189714 ) ) ( not ( = ?auto_189713 ?auto_189709 ) ) ( not ( = ?auto_189713 ?auto_189707 ) ) ( not ( = ?auto_189711 ?auto_189712 ) ) ( not ( = ?auto_189711 ?auto_189714 ) ) ( not ( = ?auto_189711 ?auto_189709 ) ) ( not ( = ?auto_189711 ?auto_189707 ) ) ( not ( = ?auto_189712 ?auto_189714 ) ) ( not ( = ?auto_189712 ?auto_189709 ) ) ( not ( = ?auto_189712 ?auto_189707 ) ) ( not ( = ?auto_189714 ?auto_189709 ) ) ( not ( = ?auto_189714 ?auto_189707 ) ) ( not ( = ?auto_189706 ?auto_189710 ) ) ( not ( = ?auto_189706 ?auto_189713 ) ) ( not ( = ?auto_189706 ?auto_189711 ) ) ( not ( = ?auto_189706 ?auto_189712 ) ) ( not ( = ?auto_189706 ?auto_189714 ) ) ( not ( = ?auto_189708 ?auto_189710 ) ) ( not ( = ?auto_189708 ?auto_189713 ) ) ( not ( = ?auto_189708 ?auto_189711 ) ) ( not ( = ?auto_189708 ?auto_189712 ) ) ( not ( = ?auto_189708 ?auto_189714 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189710 ?auto_189713 ?auto_189711 ?auto_189712 ?auto_189714 ?auto_189709 ?auto_189707 )
      ( MAKE-2PILE ?auto_189706 ?auto_189707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189715 - BLOCK
      ?auto_189716 - BLOCK
    )
    :vars
    (
      ?auto_189720 - BLOCK
      ?auto_189719 - BLOCK
      ?auto_189717 - BLOCK
      ?auto_189721 - BLOCK
      ?auto_189723 - BLOCK
      ?auto_189722 - BLOCK
      ?auto_189718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189715 ?auto_189716 ) ) ( not ( = ?auto_189715 ?auto_189720 ) ) ( not ( = ?auto_189716 ?auto_189720 ) ) ( ON ?auto_189715 ?auto_189719 ) ( not ( = ?auto_189715 ?auto_189719 ) ) ( not ( = ?auto_189716 ?auto_189719 ) ) ( not ( = ?auto_189720 ?auto_189719 ) ) ( CLEAR ?auto_189720 ) ( ON-TABLE ?auto_189717 ) ( ON ?auto_189721 ?auto_189717 ) ( ON ?auto_189723 ?auto_189721 ) ( ON ?auto_189722 ?auto_189723 ) ( ON ?auto_189718 ?auto_189722 ) ( ON ?auto_189720 ?auto_189718 ) ( not ( = ?auto_189717 ?auto_189721 ) ) ( not ( = ?auto_189717 ?auto_189723 ) ) ( not ( = ?auto_189717 ?auto_189722 ) ) ( not ( = ?auto_189717 ?auto_189718 ) ) ( not ( = ?auto_189717 ?auto_189720 ) ) ( not ( = ?auto_189717 ?auto_189716 ) ) ( not ( = ?auto_189721 ?auto_189723 ) ) ( not ( = ?auto_189721 ?auto_189722 ) ) ( not ( = ?auto_189721 ?auto_189718 ) ) ( not ( = ?auto_189721 ?auto_189720 ) ) ( not ( = ?auto_189721 ?auto_189716 ) ) ( not ( = ?auto_189723 ?auto_189722 ) ) ( not ( = ?auto_189723 ?auto_189718 ) ) ( not ( = ?auto_189723 ?auto_189720 ) ) ( not ( = ?auto_189723 ?auto_189716 ) ) ( not ( = ?auto_189722 ?auto_189718 ) ) ( not ( = ?auto_189722 ?auto_189720 ) ) ( not ( = ?auto_189722 ?auto_189716 ) ) ( not ( = ?auto_189718 ?auto_189720 ) ) ( not ( = ?auto_189718 ?auto_189716 ) ) ( not ( = ?auto_189715 ?auto_189717 ) ) ( not ( = ?auto_189715 ?auto_189721 ) ) ( not ( = ?auto_189715 ?auto_189723 ) ) ( not ( = ?auto_189715 ?auto_189722 ) ) ( not ( = ?auto_189715 ?auto_189718 ) ) ( not ( = ?auto_189719 ?auto_189717 ) ) ( not ( = ?auto_189719 ?auto_189721 ) ) ( not ( = ?auto_189719 ?auto_189723 ) ) ( not ( = ?auto_189719 ?auto_189722 ) ) ( not ( = ?auto_189719 ?auto_189718 ) ) ( ON ?auto_189716 ?auto_189715 ) ( CLEAR ?auto_189716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189719 ?auto_189715 )
      ( MAKE-2PILE ?auto_189715 ?auto_189716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189724 - BLOCK
      ?auto_189725 - BLOCK
    )
    :vars
    (
      ?auto_189728 - BLOCK
      ?auto_189729 - BLOCK
      ?auto_189731 - BLOCK
      ?auto_189726 - BLOCK
      ?auto_189730 - BLOCK
      ?auto_189732 - BLOCK
      ?auto_189727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189724 ?auto_189725 ) ) ( not ( = ?auto_189724 ?auto_189728 ) ) ( not ( = ?auto_189725 ?auto_189728 ) ) ( ON ?auto_189724 ?auto_189729 ) ( not ( = ?auto_189724 ?auto_189729 ) ) ( not ( = ?auto_189725 ?auto_189729 ) ) ( not ( = ?auto_189728 ?auto_189729 ) ) ( ON-TABLE ?auto_189731 ) ( ON ?auto_189726 ?auto_189731 ) ( ON ?auto_189730 ?auto_189726 ) ( ON ?auto_189732 ?auto_189730 ) ( ON ?auto_189727 ?auto_189732 ) ( not ( = ?auto_189731 ?auto_189726 ) ) ( not ( = ?auto_189731 ?auto_189730 ) ) ( not ( = ?auto_189731 ?auto_189732 ) ) ( not ( = ?auto_189731 ?auto_189727 ) ) ( not ( = ?auto_189731 ?auto_189728 ) ) ( not ( = ?auto_189731 ?auto_189725 ) ) ( not ( = ?auto_189726 ?auto_189730 ) ) ( not ( = ?auto_189726 ?auto_189732 ) ) ( not ( = ?auto_189726 ?auto_189727 ) ) ( not ( = ?auto_189726 ?auto_189728 ) ) ( not ( = ?auto_189726 ?auto_189725 ) ) ( not ( = ?auto_189730 ?auto_189732 ) ) ( not ( = ?auto_189730 ?auto_189727 ) ) ( not ( = ?auto_189730 ?auto_189728 ) ) ( not ( = ?auto_189730 ?auto_189725 ) ) ( not ( = ?auto_189732 ?auto_189727 ) ) ( not ( = ?auto_189732 ?auto_189728 ) ) ( not ( = ?auto_189732 ?auto_189725 ) ) ( not ( = ?auto_189727 ?auto_189728 ) ) ( not ( = ?auto_189727 ?auto_189725 ) ) ( not ( = ?auto_189724 ?auto_189731 ) ) ( not ( = ?auto_189724 ?auto_189726 ) ) ( not ( = ?auto_189724 ?auto_189730 ) ) ( not ( = ?auto_189724 ?auto_189732 ) ) ( not ( = ?auto_189724 ?auto_189727 ) ) ( not ( = ?auto_189729 ?auto_189731 ) ) ( not ( = ?auto_189729 ?auto_189726 ) ) ( not ( = ?auto_189729 ?auto_189730 ) ) ( not ( = ?auto_189729 ?auto_189732 ) ) ( not ( = ?auto_189729 ?auto_189727 ) ) ( ON ?auto_189725 ?auto_189724 ) ( CLEAR ?auto_189725 ) ( ON-TABLE ?auto_189729 ) ( HOLDING ?auto_189728 ) ( CLEAR ?auto_189727 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189731 ?auto_189726 ?auto_189730 ?auto_189732 ?auto_189727 ?auto_189728 )
      ( MAKE-2PILE ?auto_189724 ?auto_189725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189733 - BLOCK
      ?auto_189734 - BLOCK
    )
    :vars
    (
      ?auto_189740 - BLOCK
      ?auto_189735 - BLOCK
      ?auto_189737 - BLOCK
      ?auto_189736 - BLOCK
      ?auto_189739 - BLOCK
      ?auto_189741 - BLOCK
      ?auto_189738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189733 ?auto_189734 ) ) ( not ( = ?auto_189733 ?auto_189740 ) ) ( not ( = ?auto_189734 ?auto_189740 ) ) ( ON ?auto_189733 ?auto_189735 ) ( not ( = ?auto_189733 ?auto_189735 ) ) ( not ( = ?auto_189734 ?auto_189735 ) ) ( not ( = ?auto_189740 ?auto_189735 ) ) ( ON-TABLE ?auto_189737 ) ( ON ?auto_189736 ?auto_189737 ) ( ON ?auto_189739 ?auto_189736 ) ( ON ?auto_189741 ?auto_189739 ) ( ON ?auto_189738 ?auto_189741 ) ( not ( = ?auto_189737 ?auto_189736 ) ) ( not ( = ?auto_189737 ?auto_189739 ) ) ( not ( = ?auto_189737 ?auto_189741 ) ) ( not ( = ?auto_189737 ?auto_189738 ) ) ( not ( = ?auto_189737 ?auto_189740 ) ) ( not ( = ?auto_189737 ?auto_189734 ) ) ( not ( = ?auto_189736 ?auto_189739 ) ) ( not ( = ?auto_189736 ?auto_189741 ) ) ( not ( = ?auto_189736 ?auto_189738 ) ) ( not ( = ?auto_189736 ?auto_189740 ) ) ( not ( = ?auto_189736 ?auto_189734 ) ) ( not ( = ?auto_189739 ?auto_189741 ) ) ( not ( = ?auto_189739 ?auto_189738 ) ) ( not ( = ?auto_189739 ?auto_189740 ) ) ( not ( = ?auto_189739 ?auto_189734 ) ) ( not ( = ?auto_189741 ?auto_189738 ) ) ( not ( = ?auto_189741 ?auto_189740 ) ) ( not ( = ?auto_189741 ?auto_189734 ) ) ( not ( = ?auto_189738 ?auto_189740 ) ) ( not ( = ?auto_189738 ?auto_189734 ) ) ( not ( = ?auto_189733 ?auto_189737 ) ) ( not ( = ?auto_189733 ?auto_189736 ) ) ( not ( = ?auto_189733 ?auto_189739 ) ) ( not ( = ?auto_189733 ?auto_189741 ) ) ( not ( = ?auto_189733 ?auto_189738 ) ) ( not ( = ?auto_189735 ?auto_189737 ) ) ( not ( = ?auto_189735 ?auto_189736 ) ) ( not ( = ?auto_189735 ?auto_189739 ) ) ( not ( = ?auto_189735 ?auto_189741 ) ) ( not ( = ?auto_189735 ?auto_189738 ) ) ( ON ?auto_189734 ?auto_189733 ) ( ON-TABLE ?auto_189735 ) ( CLEAR ?auto_189738 ) ( ON ?auto_189740 ?auto_189734 ) ( CLEAR ?auto_189740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189735 ?auto_189733 ?auto_189734 )
      ( MAKE-2PILE ?auto_189733 ?auto_189734 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189742 - BLOCK
      ?auto_189743 - BLOCK
    )
    :vars
    (
      ?auto_189744 - BLOCK
      ?auto_189748 - BLOCK
      ?auto_189750 - BLOCK
      ?auto_189749 - BLOCK
      ?auto_189747 - BLOCK
      ?auto_189745 - BLOCK
      ?auto_189746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189742 ?auto_189743 ) ) ( not ( = ?auto_189742 ?auto_189744 ) ) ( not ( = ?auto_189743 ?auto_189744 ) ) ( ON ?auto_189742 ?auto_189748 ) ( not ( = ?auto_189742 ?auto_189748 ) ) ( not ( = ?auto_189743 ?auto_189748 ) ) ( not ( = ?auto_189744 ?auto_189748 ) ) ( ON-TABLE ?auto_189750 ) ( ON ?auto_189749 ?auto_189750 ) ( ON ?auto_189747 ?auto_189749 ) ( ON ?auto_189745 ?auto_189747 ) ( not ( = ?auto_189750 ?auto_189749 ) ) ( not ( = ?auto_189750 ?auto_189747 ) ) ( not ( = ?auto_189750 ?auto_189745 ) ) ( not ( = ?auto_189750 ?auto_189746 ) ) ( not ( = ?auto_189750 ?auto_189744 ) ) ( not ( = ?auto_189750 ?auto_189743 ) ) ( not ( = ?auto_189749 ?auto_189747 ) ) ( not ( = ?auto_189749 ?auto_189745 ) ) ( not ( = ?auto_189749 ?auto_189746 ) ) ( not ( = ?auto_189749 ?auto_189744 ) ) ( not ( = ?auto_189749 ?auto_189743 ) ) ( not ( = ?auto_189747 ?auto_189745 ) ) ( not ( = ?auto_189747 ?auto_189746 ) ) ( not ( = ?auto_189747 ?auto_189744 ) ) ( not ( = ?auto_189747 ?auto_189743 ) ) ( not ( = ?auto_189745 ?auto_189746 ) ) ( not ( = ?auto_189745 ?auto_189744 ) ) ( not ( = ?auto_189745 ?auto_189743 ) ) ( not ( = ?auto_189746 ?auto_189744 ) ) ( not ( = ?auto_189746 ?auto_189743 ) ) ( not ( = ?auto_189742 ?auto_189750 ) ) ( not ( = ?auto_189742 ?auto_189749 ) ) ( not ( = ?auto_189742 ?auto_189747 ) ) ( not ( = ?auto_189742 ?auto_189745 ) ) ( not ( = ?auto_189742 ?auto_189746 ) ) ( not ( = ?auto_189748 ?auto_189750 ) ) ( not ( = ?auto_189748 ?auto_189749 ) ) ( not ( = ?auto_189748 ?auto_189747 ) ) ( not ( = ?auto_189748 ?auto_189745 ) ) ( not ( = ?auto_189748 ?auto_189746 ) ) ( ON ?auto_189743 ?auto_189742 ) ( ON-TABLE ?auto_189748 ) ( ON ?auto_189744 ?auto_189743 ) ( CLEAR ?auto_189744 ) ( HOLDING ?auto_189746 ) ( CLEAR ?auto_189745 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189750 ?auto_189749 ?auto_189747 ?auto_189745 ?auto_189746 )
      ( MAKE-2PILE ?auto_189742 ?auto_189743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189751 - BLOCK
      ?auto_189752 - BLOCK
    )
    :vars
    (
      ?auto_189757 - BLOCK
      ?auto_189759 - BLOCK
      ?auto_189753 - BLOCK
      ?auto_189756 - BLOCK
      ?auto_189755 - BLOCK
      ?auto_189754 - BLOCK
      ?auto_189758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189751 ?auto_189752 ) ) ( not ( = ?auto_189751 ?auto_189757 ) ) ( not ( = ?auto_189752 ?auto_189757 ) ) ( ON ?auto_189751 ?auto_189759 ) ( not ( = ?auto_189751 ?auto_189759 ) ) ( not ( = ?auto_189752 ?auto_189759 ) ) ( not ( = ?auto_189757 ?auto_189759 ) ) ( ON-TABLE ?auto_189753 ) ( ON ?auto_189756 ?auto_189753 ) ( ON ?auto_189755 ?auto_189756 ) ( ON ?auto_189754 ?auto_189755 ) ( not ( = ?auto_189753 ?auto_189756 ) ) ( not ( = ?auto_189753 ?auto_189755 ) ) ( not ( = ?auto_189753 ?auto_189754 ) ) ( not ( = ?auto_189753 ?auto_189758 ) ) ( not ( = ?auto_189753 ?auto_189757 ) ) ( not ( = ?auto_189753 ?auto_189752 ) ) ( not ( = ?auto_189756 ?auto_189755 ) ) ( not ( = ?auto_189756 ?auto_189754 ) ) ( not ( = ?auto_189756 ?auto_189758 ) ) ( not ( = ?auto_189756 ?auto_189757 ) ) ( not ( = ?auto_189756 ?auto_189752 ) ) ( not ( = ?auto_189755 ?auto_189754 ) ) ( not ( = ?auto_189755 ?auto_189758 ) ) ( not ( = ?auto_189755 ?auto_189757 ) ) ( not ( = ?auto_189755 ?auto_189752 ) ) ( not ( = ?auto_189754 ?auto_189758 ) ) ( not ( = ?auto_189754 ?auto_189757 ) ) ( not ( = ?auto_189754 ?auto_189752 ) ) ( not ( = ?auto_189758 ?auto_189757 ) ) ( not ( = ?auto_189758 ?auto_189752 ) ) ( not ( = ?auto_189751 ?auto_189753 ) ) ( not ( = ?auto_189751 ?auto_189756 ) ) ( not ( = ?auto_189751 ?auto_189755 ) ) ( not ( = ?auto_189751 ?auto_189754 ) ) ( not ( = ?auto_189751 ?auto_189758 ) ) ( not ( = ?auto_189759 ?auto_189753 ) ) ( not ( = ?auto_189759 ?auto_189756 ) ) ( not ( = ?auto_189759 ?auto_189755 ) ) ( not ( = ?auto_189759 ?auto_189754 ) ) ( not ( = ?auto_189759 ?auto_189758 ) ) ( ON ?auto_189752 ?auto_189751 ) ( ON-TABLE ?auto_189759 ) ( ON ?auto_189757 ?auto_189752 ) ( CLEAR ?auto_189754 ) ( ON ?auto_189758 ?auto_189757 ) ( CLEAR ?auto_189758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189759 ?auto_189751 ?auto_189752 ?auto_189757 )
      ( MAKE-2PILE ?auto_189751 ?auto_189752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189760 - BLOCK
      ?auto_189761 - BLOCK
    )
    :vars
    (
      ?auto_189762 - BLOCK
      ?auto_189766 - BLOCK
      ?auto_189767 - BLOCK
      ?auto_189768 - BLOCK
      ?auto_189763 - BLOCK
      ?auto_189764 - BLOCK
      ?auto_189765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189760 ?auto_189761 ) ) ( not ( = ?auto_189760 ?auto_189762 ) ) ( not ( = ?auto_189761 ?auto_189762 ) ) ( ON ?auto_189760 ?auto_189766 ) ( not ( = ?auto_189760 ?auto_189766 ) ) ( not ( = ?auto_189761 ?auto_189766 ) ) ( not ( = ?auto_189762 ?auto_189766 ) ) ( ON-TABLE ?auto_189767 ) ( ON ?auto_189768 ?auto_189767 ) ( ON ?auto_189763 ?auto_189768 ) ( not ( = ?auto_189767 ?auto_189768 ) ) ( not ( = ?auto_189767 ?auto_189763 ) ) ( not ( = ?auto_189767 ?auto_189764 ) ) ( not ( = ?auto_189767 ?auto_189765 ) ) ( not ( = ?auto_189767 ?auto_189762 ) ) ( not ( = ?auto_189767 ?auto_189761 ) ) ( not ( = ?auto_189768 ?auto_189763 ) ) ( not ( = ?auto_189768 ?auto_189764 ) ) ( not ( = ?auto_189768 ?auto_189765 ) ) ( not ( = ?auto_189768 ?auto_189762 ) ) ( not ( = ?auto_189768 ?auto_189761 ) ) ( not ( = ?auto_189763 ?auto_189764 ) ) ( not ( = ?auto_189763 ?auto_189765 ) ) ( not ( = ?auto_189763 ?auto_189762 ) ) ( not ( = ?auto_189763 ?auto_189761 ) ) ( not ( = ?auto_189764 ?auto_189765 ) ) ( not ( = ?auto_189764 ?auto_189762 ) ) ( not ( = ?auto_189764 ?auto_189761 ) ) ( not ( = ?auto_189765 ?auto_189762 ) ) ( not ( = ?auto_189765 ?auto_189761 ) ) ( not ( = ?auto_189760 ?auto_189767 ) ) ( not ( = ?auto_189760 ?auto_189768 ) ) ( not ( = ?auto_189760 ?auto_189763 ) ) ( not ( = ?auto_189760 ?auto_189764 ) ) ( not ( = ?auto_189760 ?auto_189765 ) ) ( not ( = ?auto_189766 ?auto_189767 ) ) ( not ( = ?auto_189766 ?auto_189768 ) ) ( not ( = ?auto_189766 ?auto_189763 ) ) ( not ( = ?auto_189766 ?auto_189764 ) ) ( not ( = ?auto_189766 ?auto_189765 ) ) ( ON ?auto_189761 ?auto_189760 ) ( ON-TABLE ?auto_189766 ) ( ON ?auto_189762 ?auto_189761 ) ( ON ?auto_189765 ?auto_189762 ) ( CLEAR ?auto_189765 ) ( HOLDING ?auto_189764 ) ( CLEAR ?auto_189763 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189767 ?auto_189768 ?auto_189763 ?auto_189764 )
      ( MAKE-2PILE ?auto_189760 ?auto_189761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189769 - BLOCK
      ?auto_189770 - BLOCK
    )
    :vars
    (
      ?auto_189771 - BLOCK
      ?auto_189774 - BLOCK
      ?auto_189775 - BLOCK
      ?auto_189773 - BLOCK
      ?auto_189772 - BLOCK
      ?auto_189776 - BLOCK
      ?auto_189777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189769 ?auto_189770 ) ) ( not ( = ?auto_189769 ?auto_189771 ) ) ( not ( = ?auto_189770 ?auto_189771 ) ) ( ON ?auto_189769 ?auto_189774 ) ( not ( = ?auto_189769 ?auto_189774 ) ) ( not ( = ?auto_189770 ?auto_189774 ) ) ( not ( = ?auto_189771 ?auto_189774 ) ) ( ON-TABLE ?auto_189775 ) ( ON ?auto_189773 ?auto_189775 ) ( ON ?auto_189772 ?auto_189773 ) ( not ( = ?auto_189775 ?auto_189773 ) ) ( not ( = ?auto_189775 ?auto_189772 ) ) ( not ( = ?auto_189775 ?auto_189776 ) ) ( not ( = ?auto_189775 ?auto_189777 ) ) ( not ( = ?auto_189775 ?auto_189771 ) ) ( not ( = ?auto_189775 ?auto_189770 ) ) ( not ( = ?auto_189773 ?auto_189772 ) ) ( not ( = ?auto_189773 ?auto_189776 ) ) ( not ( = ?auto_189773 ?auto_189777 ) ) ( not ( = ?auto_189773 ?auto_189771 ) ) ( not ( = ?auto_189773 ?auto_189770 ) ) ( not ( = ?auto_189772 ?auto_189776 ) ) ( not ( = ?auto_189772 ?auto_189777 ) ) ( not ( = ?auto_189772 ?auto_189771 ) ) ( not ( = ?auto_189772 ?auto_189770 ) ) ( not ( = ?auto_189776 ?auto_189777 ) ) ( not ( = ?auto_189776 ?auto_189771 ) ) ( not ( = ?auto_189776 ?auto_189770 ) ) ( not ( = ?auto_189777 ?auto_189771 ) ) ( not ( = ?auto_189777 ?auto_189770 ) ) ( not ( = ?auto_189769 ?auto_189775 ) ) ( not ( = ?auto_189769 ?auto_189773 ) ) ( not ( = ?auto_189769 ?auto_189772 ) ) ( not ( = ?auto_189769 ?auto_189776 ) ) ( not ( = ?auto_189769 ?auto_189777 ) ) ( not ( = ?auto_189774 ?auto_189775 ) ) ( not ( = ?auto_189774 ?auto_189773 ) ) ( not ( = ?auto_189774 ?auto_189772 ) ) ( not ( = ?auto_189774 ?auto_189776 ) ) ( not ( = ?auto_189774 ?auto_189777 ) ) ( ON ?auto_189770 ?auto_189769 ) ( ON-TABLE ?auto_189774 ) ( ON ?auto_189771 ?auto_189770 ) ( ON ?auto_189777 ?auto_189771 ) ( CLEAR ?auto_189772 ) ( ON ?auto_189776 ?auto_189777 ) ( CLEAR ?auto_189776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189774 ?auto_189769 ?auto_189770 ?auto_189771 ?auto_189777 )
      ( MAKE-2PILE ?auto_189769 ?auto_189770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189778 - BLOCK
      ?auto_189779 - BLOCK
    )
    :vars
    (
      ?auto_189781 - BLOCK
      ?auto_189780 - BLOCK
      ?auto_189783 - BLOCK
      ?auto_189786 - BLOCK
      ?auto_189782 - BLOCK
      ?auto_189785 - BLOCK
      ?auto_189784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189778 ?auto_189779 ) ) ( not ( = ?auto_189778 ?auto_189781 ) ) ( not ( = ?auto_189779 ?auto_189781 ) ) ( ON ?auto_189778 ?auto_189780 ) ( not ( = ?auto_189778 ?auto_189780 ) ) ( not ( = ?auto_189779 ?auto_189780 ) ) ( not ( = ?auto_189781 ?auto_189780 ) ) ( ON-TABLE ?auto_189783 ) ( ON ?auto_189786 ?auto_189783 ) ( not ( = ?auto_189783 ?auto_189786 ) ) ( not ( = ?auto_189783 ?auto_189782 ) ) ( not ( = ?auto_189783 ?auto_189785 ) ) ( not ( = ?auto_189783 ?auto_189784 ) ) ( not ( = ?auto_189783 ?auto_189781 ) ) ( not ( = ?auto_189783 ?auto_189779 ) ) ( not ( = ?auto_189786 ?auto_189782 ) ) ( not ( = ?auto_189786 ?auto_189785 ) ) ( not ( = ?auto_189786 ?auto_189784 ) ) ( not ( = ?auto_189786 ?auto_189781 ) ) ( not ( = ?auto_189786 ?auto_189779 ) ) ( not ( = ?auto_189782 ?auto_189785 ) ) ( not ( = ?auto_189782 ?auto_189784 ) ) ( not ( = ?auto_189782 ?auto_189781 ) ) ( not ( = ?auto_189782 ?auto_189779 ) ) ( not ( = ?auto_189785 ?auto_189784 ) ) ( not ( = ?auto_189785 ?auto_189781 ) ) ( not ( = ?auto_189785 ?auto_189779 ) ) ( not ( = ?auto_189784 ?auto_189781 ) ) ( not ( = ?auto_189784 ?auto_189779 ) ) ( not ( = ?auto_189778 ?auto_189783 ) ) ( not ( = ?auto_189778 ?auto_189786 ) ) ( not ( = ?auto_189778 ?auto_189782 ) ) ( not ( = ?auto_189778 ?auto_189785 ) ) ( not ( = ?auto_189778 ?auto_189784 ) ) ( not ( = ?auto_189780 ?auto_189783 ) ) ( not ( = ?auto_189780 ?auto_189786 ) ) ( not ( = ?auto_189780 ?auto_189782 ) ) ( not ( = ?auto_189780 ?auto_189785 ) ) ( not ( = ?auto_189780 ?auto_189784 ) ) ( ON ?auto_189779 ?auto_189778 ) ( ON-TABLE ?auto_189780 ) ( ON ?auto_189781 ?auto_189779 ) ( ON ?auto_189784 ?auto_189781 ) ( ON ?auto_189785 ?auto_189784 ) ( CLEAR ?auto_189785 ) ( HOLDING ?auto_189782 ) ( CLEAR ?auto_189786 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189783 ?auto_189786 ?auto_189782 )
      ( MAKE-2PILE ?auto_189778 ?auto_189779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189787 - BLOCK
      ?auto_189788 - BLOCK
    )
    :vars
    (
      ?auto_189795 - BLOCK
      ?auto_189792 - BLOCK
      ?auto_189793 - BLOCK
      ?auto_189794 - BLOCK
      ?auto_189791 - BLOCK
      ?auto_189789 - BLOCK
      ?auto_189790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189787 ?auto_189788 ) ) ( not ( = ?auto_189787 ?auto_189795 ) ) ( not ( = ?auto_189788 ?auto_189795 ) ) ( ON ?auto_189787 ?auto_189792 ) ( not ( = ?auto_189787 ?auto_189792 ) ) ( not ( = ?auto_189788 ?auto_189792 ) ) ( not ( = ?auto_189795 ?auto_189792 ) ) ( ON-TABLE ?auto_189793 ) ( ON ?auto_189794 ?auto_189793 ) ( not ( = ?auto_189793 ?auto_189794 ) ) ( not ( = ?auto_189793 ?auto_189791 ) ) ( not ( = ?auto_189793 ?auto_189789 ) ) ( not ( = ?auto_189793 ?auto_189790 ) ) ( not ( = ?auto_189793 ?auto_189795 ) ) ( not ( = ?auto_189793 ?auto_189788 ) ) ( not ( = ?auto_189794 ?auto_189791 ) ) ( not ( = ?auto_189794 ?auto_189789 ) ) ( not ( = ?auto_189794 ?auto_189790 ) ) ( not ( = ?auto_189794 ?auto_189795 ) ) ( not ( = ?auto_189794 ?auto_189788 ) ) ( not ( = ?auto_189791 ?auto_189789 ) ) ( not ( = ?auto_189791 ?auto_189790 ) ) ( not ( = ?auto_189791 ?auto_189795 ) ) ( not ( = ?auto_189791 ?auto_189788 ) ) ( not ( = ?auto_189789 ?auto_189790 ) ) ( not ( = ?auto_189789 ?auto_189795 ) ) ( not ( = ?auto_189789 ?auto_189788 ) ) ( not ( = ?auto_189790 ?auto_189795 ) ) ( not ( = ?auto_189790 ?auto_189788 ) ) ( not ( = ?auto_189787 ?auto_189793 ) ) ( not ( = ?auto_189787 ?auto_189794 ) ) ( not ( = ?auto_189787 ?auto_189791 ) ) ( not ( = ?auto_189787 ?auto_189789 ) ) ( not ( = ?auto_189787 ?auto_189790 ) ) ( not ( = ?auto_189792 ?auto_189793 ) ) ( not ( = ?auto_189792 ?auto_189794 ) ) ( not ( = ?auto_189792 ?auto_189791 ) ) ( not ( = ?auto_189792 ?auto_189789 ) ) ( not ( = ?auto_189792 ?auto_189790 ) ) ( ON ?auto_189788 ?auto_189787 ) ( ON-TABLE ?auto_189792 ) ( ON ?auto_189795 ?auto_189788 ) ( ON ?auto_189790 ?auto_189795 ) ( ON ?auto_189789 ?auto_189790 ) ( CLEAR ?auto_189794 ) ( ON ?auto_189791 ?auto_189789 ) ( CLEAR ?auto_189791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189792 ?auto_189787 ?auto_189788 ?auto_189795 ?auto_189790 ?auto_189789 )
      ( MAKE-2PILE ?auto_189787 ?auto_189788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189796 - BLOCK
      ?auto_189797 - BLOCK
    )
    :vars
    (
      ?auto_189798 - BLOCK
      ?auto_189802 - BLOCK
      ?auto_189803 - BLOCK
      ?auto_189800 - BLOCK
      ?auto_189804 - BLOCK
      ?auto_189801 - BLOCK
      ?auto_189799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189796 ?auto_189797 ) ) ( not ( = ?auto_189796 ?auto_189798 ) ) ( not ( = ?auto_189797 ?auto_189798 ) ) ( ON ?auto_189796 ?auto_189802 ) ( not ( = ?auto_189796 ?auto_189802 ) ) ( not ( = ?auto_189797 ?auto_189802 ) ) ( not ( = ?auto_189798 ?auto_189802 ) ) ( ON-TABLE ?auto_189803 ) ( not ( = ?auto_189803 ?auto_189800 ) ) ( not ( = ?auto_189803 ?auto_189804 ) ) ( not ( = ?auto_189803 ?auto_189801 ) ) ( not ( = ?auto_189803 ?auto_189799 ) ) ( not ( = ?auto_189803 ?auto_189798 ) ) ( not ( = ?auto_189803 ?auto_189797 ) ) ( not ( = ?auto_189800 ?auto_189804 ) ) ( not ( = ?auto_189800 ?auto_189801 ) ) ( not ( = ?auto_189800 ?auto_189799 ) ) ( not ( = ?auto_189800 ?auto_189798 ) ) ( not ( = ?auto_189800 ?auto_189797 ) ) ( not ( = ?auto_189804 ?auto_189801 ) ) ( not ( = ?auto_189804 ?auto_189799 ) ) ( not ( = ?auto_189804 ?auto_189798 ) ) ( not ( = ?auto_189804 ?auto_189797 ) ) ( not ( = ?auto_189801 ?auto_189799 ) ) ( not ( = ?auto_189801 ?auto_189798 ) ) ( not ( = ?auto_189801 ?auto_189797 ) ) ( not ( = ?auto_189799 ?auto_189798 ) ) ( not ( = ?auto_189799 ?auto_189797 ) ) ( not ( = ?auto_189796 ?auto_189803 ) ) ( not ( = ?auto_189796 ?auto_189800 ) ) ( not ( = ?auto_189796 ?auto_189804 ) ) ( not ( = ?auto_189796 ?auto_189801 ) ) ( not ( = ?auto_189796 ?auto_189799 ) ) ( not ( = ?auto_189802 ?auto_189803 ) ) ( not ( = ?auto_189802 ?auto_189800 ) ) ( not ( = ?auto_189802 ?auto_189804 ) ) ( not ( = ?auto_189802 ?auto_189801 ) ) ( not ( = ?auto_189802 ?auto_189799 ) ) ( ON ?auto_189797 ?auto_189796 ) ( ON-TABLE ?auto_189802 ) ( ON ?auto_189798 ?auto_189797 ) ( ON ?auto_189799 ?auto_189798 ) ( ON ?auto_189801 ?auto_189799 ) ( ON ?auto_189804 ?auto_189801 ) ( CLEAR ?auto_189804 ) ( HOLDING ?auto_189800 ) ( CLEAR ?auto_189803 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189803 ?auto_189800 )
      ( MAKE-2PILE ?auto_189796 ?auto_189797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189805 - BLOCK
      ?auto_189806 - BLOCK
    )
    :vars
    (
      ?auto_189813 - BLOCK
      ?auto_189808 - BLOCK
      ?auto_189810 - BLOCK
      ?auto_189809 - BLOCK
      ?auto_189812 - BLOCK
      ?auto_189807 - BLOCK
      ?auto_189811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189805 ?auto_189806 ) ) ( not ( = ?auto_189805 ?auto_189813 ) ) ( not ( = ?auto_189806 ?auto_189813 ) ) ( ON ?auto_189805 ?auto_189808 ) ( not ( = ?auto_189805 ?auto_189808 ) ) ( not ( = ?auto_189806 ?auto_189808 ) ) ( not ( = ?auto_189813 ?auto_189808 ) ) ( ON-TABLE ?auto_189810 ) ( not ( = ?auto_189810 ?auto_189809 ) ) ( not ( = ?auto_189810 ?auto_189812 ) ) ( not ( = ?auto_189810 ?auto_189807 ) ) ( not ( = ?auto_189810 ?auto_189811 ) ) ( not ( = ?auto_189810 ?auto_189813 ) ) ( not ( = ?auto_189810 ?auto_189806 ) ) ( not ( = ?auto_189809 ?auto_189812 ) ) ( not ( = ?auto_189809 ?auto_189807 ) ) ( not ( = ?auto_189809 ?auto_189811 ) ) ( not ( = ?auto_189809 ?auto_189813 ) ) ( not ( = ?auto_189809 ?auto_189806 ) ) ( not ( = ?auto_189812 ?auto_189807 ) ) ( not ( = ?auto_189812 ?auto_189811 ) ) ( not ( = ?auto_189812 ?auto_189813 ) ) ( not ( = ?auto_189812 ?auto_189806 ) ) ( not ( = ?auto_189807 ?auto_189811 ) ) ( not ( = ?auto_189807 ?auto_189813 ) ) ( not ( = ?auto_189807 ?auto_189806 ) ) ( not ( = ?auto_189811 ?auto_189813 ) ) ( not ( = ?auto_189811 ?auto_189806 ) ) ( not ( = ?auto_189805 ?auto_189810 ) ) ( not ( = ?auto_189805 ?auto_189809 ) ) ( not ( = ?auto_189805 ?auto_189812 ) ) ( not ( = ?auto_189805 ?auto_189807 ) ) ( not ( = ?auto_189805 ?auto_189811 ) ) ( not ( = ?auto_189808 ?auto_189810 ) ) ( not ( = ?auto_189808 ?auto_189809 ) ) ( not ( = ?auto_189808 ?auto_189812 ) ) ( not ( = ?auto_189808 ?auto_189807 ) ) ( not ( = ?auto_189808 ?auto_189811 ) ) ( ON ?auto_189806 ?auto_189805 ) ( ON-TABLE ?auto_189808 ) ( ON ?auto_189813 ?auto_189806 ) ( ON ?auto_189811 ?auto_189813 ) ( ON ?auto_189807 ?auto_189811 ) ( ON ?auto_189812 ?auto_189807 ) ( CLEAR ?auto_189810 ) ( ON ?auto_189809 ?auto_189812 ) ( CLEAR ?auto_189809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189808 ?auto_189805 ?auto_189806 ?auto_189813 ?auto_189811 ?auto_189807 ?auto_189812 )
      ( MAKE-2PILE ?auto_189805 ?auto_189806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189814 - BLOCK
      ?auto_189815 - BLOCK
    )
    :vars
    (
      ?auto_189817 - BLOCK
      ?auto_189819 - BLOCK
      ?auto_189822 - BLOCK
      ?auto_189818 - BLOCK
      ?auto_189816 - BLOCK
      ?auto_189820 - BLOCK
      ?auto_189821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189814 ?auto_189815 ) ) ( not ( = ?auto_189814 ?auto_189817 ) ) ( not ( = ?auto_189815 ?auto_189817 ) ) ( ON ?auto_189814 ?auto_189819 ) ( not ( = ?auto_189814 ?auto_189819 ) ) ( not ( = ?auto_189815 ?auto_189819 ) ) ( not ( = ?auto_189817 ?auto_189819 ) ) ( not ( = ?auto_189822 ?auto_189818 ) ) ( not ( = ?auto_189822 ?auto_189816 ) ) ( not ( = ?auto_189822 ?auto_189820 ) ) ( not ( = ?auto_189822 ?auto_189821 ) ) ( not ( = ?auto_189822 ?auto_189817 ) ) ( not ( = ?auto_189822 ?auto_189815 ) ) ( not ( = ?auto_189818 ?auto_189816 ) ) ( not ( = ?auto_189818 ?auto_189820 ) ) ( not ( = ?auto_189818 ?auto_189821 ) ) ( not ( = ?auto_189818 ?auto_189817 ) ) ( not ( = ?auto_189818 ?auto_189815 ) ) ( not ( = ?auto_189816 ?auto_189820 ) ) ( not ( = ?auto_189816 ?auto_189821 ) ) ( not ( = ?auto_189816 ?auto_189817 ) ) ( not ( = ?auto_189816 ?auto_189815 ) ) ( not ( = ?auto_189820 ?auto_189821 ) ) ( not ( = ?auto_189820 ?auto_189817 ) ) ( not ( = ?auto_189820 ?auto_189815 ) ) ( not ( = ?auto_189821 ?auto_189817 ) ) ( not ( = ?auto_189821 ?auto_189815 ) ) ( not ( = ?auto_189814 ?auto_189822 ) ) ( not ( = ?auto_189814 ?auto_189818 ) ) ( not ( = ?auto_189814 ?auto_189816 ) ) ( not ( = ?auto_189814 ?auto_189820 ) ) ( not ( = ?auto_189814 ?auto_189821 ) ) ( not ( = ?auto_189819 ?auto_189822 ) ) ( not ( = ?auto_189819 ?auto_189818 ) ) ( not ( = ?auto_189819 ?auto_189816 ) ) ( not ( = ?auto_189819 ?auto_189820 ) ) ( not ( = ?auto_189819 ?auto_189821 ) ) ( ON ?auto_189815 ?auto_189814 ) ( ON-TABLE ?auto_189819 ) ( ON ?auto_189817 ?auto_189815 ) ( ON ?auto_189821 ?auto_189817 ) ( ON ?auto_189820 ?auto_189821 ) ( ON ?auto_189816 ?auto_189820 ) ( ON ?auto_189818 ?auto_189816 ) ( CLEAR ?auto_189818 ) ( HOLDING ?auto_189822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189822 )
      ( MAKE-2PILE ?auto_189814 ?auto_189815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189823 - BLOCK
      ?auto_189824 - BLOCK
    )
    :vars
    (
      ?auto_189827 - BLOCK
      ?auto_189830 - BLOCK
      ?auto_189825 - BLOCK
      ?auto_189829 - BLOCK
      ?auto_189828 - BLOCK
      ?auto_189831 - BLOCK
      ?auto_189826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189823 ?auto_189824 ) ) ( not ( = ?auto_189823 ?auto_189827 ) ) ( not ( = ?auto_189824 ?auto_189827 ) ) ( ON ?auto_189823 ?auto_189830 ) ( not ( = ?auto_189823 ?auto_189830 ) ) ( not ( = ?auto_189824 ?auto_189830 ) ) ( not ( = ?auto_189827 ?auto_189830 ) ) ( not ( = ?auto_189825 ?auto_189829 ) ) ( not ( = ?auto_189825 ?auto_189828 ) ) ( not ( = ?auto_189825 ?auto_189831 ) ) ( not ( = ?auto_189825 ?auto_189826 ) ) ( not ( = ?auto_189825 ?auto_189827 ) ) ( not ( = ?auto_189825 ?auto_189824 ) ) ( not ( = ?auto_189829 ?auto_189828 ) ) ( not ( = ?auto_189829 ?auto_189831 ) ) ( not ( = ?auto_189829 ?auto_189826 ) ) ( not ( = ?auto_189829 ?auto_189827 ) ) ( not ( = ?auto_189829 ?auto_189824 ) ) ( not ( = ?auto_189828 ?auto_189831 ) ) ( not ( = ?auto_189828 ?auto_189826 ) ) ( not ( = ?auto_189828 ?auto_189827 ) ) ( not ( = ?auto_189828 ?auto_189824 ) ) ( not ( = ?auto_189831 ?auto_189826 ) ) ( not ( = ?auto_189831 ?auto_189827 ) ) ( not ( = ?auto_189831 ?auto_189824 ) ) ( not ( = ?auto_189826 ?auto_189827 ) ) ( not ( = ?auto_189826 ?auto_189824 ) ) ( not ( = ?auto_189823 ?auto_189825 ) ) ( not ( = ?auto_189823 ?auto_189829 ) ) ( not ( = ?auto_189823 ?auto_189828 ) ) ( not ( = ?auto_189823 ?auto_189831 ) ) ( not ( = ?auto_189823 ?auto_189826 ) ) ( not ( = ?auto_189830 ?auto_189825 ) ) ( not ( = ?auto_189830 ?auto_189829 ) ) ( not ( = ?auto_189830 ?auto_189828 ) ) ( not ( = ?auto_189830 ?auto_189831 ) ) ( not ( = ?auto_189830 ?auto_189826 ) ) ( ON ?auto_189824 ?auto_189823 ) ( ON-TABLE ?auto_189830 ) ( ON ?auto_189827 ?auto_189824 ) ( ON ?auto_189826 ?auto_189827 ) ( ON ?auto_189831 ?auto_189826 ) ( ON ?auto_189828 ?auto_189831 ) ( ON ?auto_189829 ?auto_189828 ) ( ON ?auto_189825 ?auto_189829 ) ( CLEAR ?auto_189825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189830 ?auto_189823 ?auto_189824 ?auto_189827 ?auto_189826 ?auto_189831 ?auto_189828 ?auto_189829 )
      ( MAKE-2PILE ?auto_189823 ?auto_189824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189859 - BLOCK
      ?auto_189860 - BLOCK
      ?auto_189861 - BLOCK
      ?auto_189862 - BLOCK
      ?auto_189863 - BLOCK
    )
    :vars
    (
      ?auto_189865 - BLOCK
      ?auto_189866 - BLOCK
      ?auto_189864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189865 ?auto_189863 ) ( ON-TABLE ?auto_189859 ) ( ON ?auto_189860 ?auto_189859 ) ( ON ?auto_189861 ?auto_189860 ) ( ON ?auto_189862 ?auto_189861 ) ( ON ?auto_189863 ?auto_189862 ) ( not ( = ?auto_189859 ?auto_189860 ) ) ( not ( = ?auto_189859 ?auto_189861 ) ) ( not ( = ?auto_189859 ?auto_189862 ) ) ( not ( = ?auto_189859 ?auto_189863 ) ) ( not ( = ?auto_189859 ?auto_189865 ) ) ( not ( = ?auto_189860 ?auto_189861 ) ) ( not ( = ?auto_189860 ?auto_189862 ) ) ( not ( = ?auto_189860 ?auto_189863 ) ) ( not ( = ?auto_189860 ?auto_189865 ) ) ( not ( = ?auto_189861 ?auto_189862 ) ) ( not ( = ?auto_189861 ?auto_189863 ) ) ( not ( = ?auto_189861 ?auto_189865 ) ) ( not ( = ?auto_189862 ?auto_189863 ) ) ( not ( = ?auto_189862 ?auto_189865 ) ) ( not ( = ?auto_189863 ?auto_189865 ) ) ( not ( = ?auto_189859 ?auto_189866 ) ) ( not ( = ?auto_189859 ?auto_189864 ) ) ( not ( = ?auto_189860 ?auto_189866 ) ) ( not ( = ?auto_189860 ?auto_189864 ) ) ( not ( = ?auto_189861 ?auto_189866 ) ) ( not ( = ?auto_189861 ?auto_189864 ) ) ( not ( = ?auto_189862 ?auto_189866 ) ) ( not ( = ?auto_189862 ?auto_189864 ) ) ( not ( = ?auto_189863 ?auto_189866 ) ) ( not ( = ?auto_189863 ?auto_189864 ) ) ( not ( = ?auto_189865 ?auto_189866 ) ) ( not ( = ?auto_189865 ?auto_189864 ) ) ( not ( = ?auto_189866 ?auto_189864 ) ) ( ON ?auto_189866 ?auto_189865 ) ( CLEAR ?auto_189866 ) ( HOLDING ?auto_189864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189864 )
      ( MAKE-5PILE ?auto_189859 ?auto_189860 ?auto_189861 ?auto_189862 ?auto_189863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189972 - BLOCK
      ?auto_189973 - BLOCK
      ?auto_189974 - BLOCK
    )
    :vars
    (
      ?auto_189975 - BLOCK
      ?auto_189979 - BLOCK
      ?auto_189977 - BLOCK
      ?auto_189978 - BLOCK
      ?auto_189976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189972 ) ( not ( = ?auto_189972 ?auto_189973 ) ) ( not ( = ?auto_189972 ?auto_189974 ) ) ( not ( = ?auto_189973 ?auto_189974 ) ) ( ON ?auto_189974 ?auto_189975 ) ( not ( = ?auto_189972 ?auto_189975 ) ) ( not ( = ?auto_189973 ?auto_189975 ) ) ( not ( = ?auto_189974 ?auto_189975 ) ) ( CLEAR ?auto_189972 ) ( ON ?auto_189973 ?auto_189974 ) ( CLEAR ?auto_189973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189979 ) ( ON ?auto_189977 ?auto_189979 ) ( ON ?auto_189978 ?auto_189977 ) ( ON ?auto_189976 ?auto_189978 ) ( ON ?auto_189975 ?auto_189976 ) ( not ( = ?auto_189979 ?auto_189977 ) ) ( not ( = ?auto_189979 ?auto_189978 ) ) ( not ( = ?auto_189979 ?auto_189976 ) ) ( not ( = ?auto_189979 ?auto_189975 ) ) ( not ( = ?auto_189979 ?auto_189974 ) ) ( not ( = ?auto_189979 ?auto_189973 ) ) ( not ( = ?auto_189977 ?auto_189978 ) ) ( not ( = ?auto_189977 ?auto_189976 ) ) ( not ( = ?auto_189977 ?auto_189975 ) ) ( not ( = ?auto_189977 ?auto_189974 ) ) ( not ( = ?auto_189977 ?auto_189973 ) ) ( not ( = ?auto_189978 ?auto_189976 ) ) ( not ( = ?auto_189978 ?auto_189975 ) ) ( not ( = ?auto_189978 ?auto_189974 ) ) ( not ( = ?auto_189978 ?auto_189973 ) ) ( not ( = ?auto_189976 ?auto_189975 ) ) ( not ( = ?auto_189976 ?auto_189974 ) ) ( not ( = ?auto_189976 ?auto_189973 ) ) ( not ( = ?auto_189972 ?auto_189979 ) ) ( not ( = ?auto_189972 ?auto_189977 ) ) ( not ( = ?auto_189972 ?auto_189978 ) ) ( not ( = ?auto_189972 ?auto_189976 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189979 ?auto_189977 ?auto_189978 ?auto_189976 ?auto_189975 ?auto_189974 )
      ( MAKE-3PILE ?auto_189972 ?auto_189973 ?auto_189974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189980 - BLOCK
      ?auto_189981 - BLOCK
      ?auto_189982 - BLOCK
    )
    :vars
    (
      ?auto_189983 - BLOCK
      ?auto_189987 - BLOCK
      ?auto_189984 - BLOCK
      ?auto_189986 - BLOCK
      ?auto_189985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189980 ?auto_189981 ) ) ( not ( = ?auto_189980 ?auto_189982 ) ) ( not ( = ?auto_189981 ?auto_189982 ) ) ( ON ?auto_189982 ?auto_189983 ) ( not ( = ?auto_189980 ?auto_189983 ) ) ( not ( = ?auto_189981 ?auto_189983 ) ) ( not ( = ?auto_189982 ?auto_189983 ) ) ( ON ?auto_189981 ?auto_189982 ) ( CLEAR ?auto_189981 ) ( ON-TABLE ?auto_189987 ) ( ON ?auto_189984 ?auto_189987 ) ( ON ?auto_189986 ?auto_189984 ) ( ON ?auto_189985 ?auto_189986 ) ( ON ?auto_189983 ?auto_189985 ) ( not ( = ?auto_189987 ?auto_189984 ) ) ( not ( = ?auto_189987 ?auto_189986 ) ) ( not ( = ?auto_189987 ?auto_189985 ) ) ( not ( = ?auto_189987 ?auto_189983 ) ) ( not ( = ?auto_189987 ?auto_189982 ) ) ( not ( = ?auto_189987 ?auto_189981 ) ) ( not ( = ?auto_189984 ?auto_189986 ) ) ( not ( = ?auto_189984 ?auto_189985 ) ) ( not ( = ?auto_189984 ?auto_189983 ) ) ( not ( = ?auto_189984 ?auto_189982 ) ) ( not ( = ?auto_189984 ?auto_189981 ) ) ( not ( = ?auto_189986 ?auto_189985 ) ) ( not ( = ?auto_189986 ?auto_189983 ) ) ( not ( = ?auto_189986 ?auto_189982 ) ) ( not ( = ?auto_189986 ?auto_189981 ) ) ( not ( = ?auto_189985 ?auto_189983 ) ) ( not ( = ?auto_189985 ?auto_189982 ) ) ( not ( = ?auto_189985 ?auto_189981 ) ) ( not ( = ?auto_189980 ?auto_189987 ) ) ( not ( = ?auto_189980 ?auto_189984 ) ) ( not ( = ?auto_189980 ?auto_189986 ) ) ( not ( = ?auto_189980 ?auto_189985 ) ) ( HOLDING ?auto_189980 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189980 )
      ( MAKE-3PILE ?auto_189980 ?auto_189981 ?auto_189982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189988 - BLOCK
      ?auto_189989 - BLOCK
      ?auto_189990 - BLOCK
    )
    :vars
    (
      ?auto_189994 - BLOCK
      ?auto_189993 - BLOCK
      ?auto_189991 - BLOCK
      ?auto_189992 - BLOCK
      ?auto_189995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189988 ?auto_189989 ) ) ( not ( = ?auto_189988 ?auto_189990 ) ) ( not ( = ?auto_189989 ?auto_189990 ) ) ( ON ?auto_189990 ?auto_189994 ) ( not ( = ?auto_189988 ?auto_189994 ) ) ( not ( = ?auto_189989 ?auto_189994 ) ) ( not ( = ?auto_189990 ?auto_189994 ) ) ( ON ?auto_189989 ?auto_189990 ) ( ON-TABLE ?auto_189993 ) ( ON ?auto_189991 ?auto_189993 ) ( ON ?auto_189992 ?auto_189991 ) ( ON ?auto_189995 ?auto_189992 ) ( ON ?auto_189994 ?auto_189995 ) ( not ( = ?auto_189993 ?auto_189991 ) ) ( not ( = ?auto_189993 ?auto_189992 ) ) ( not ( = ?auto_189993 ?auto_189995 ) ) ( not ( = ?auto_189993 ?auto_189994 ) ) ( not ( = ?auto_189993 ?auto_189990 ) ) ( not ( = ?auto_189993 ?auto_189989 ) ) ( not ( = ?auto_189991 ?auto_189992 ) ) ( not ( = ?auto_189991 ?auto_189995 ) ) ( not ( = ?auto_189991 ?auto_189994 ) ) ( not ( = ?auto_189991 ?auto_189990 ) ) ( not ( = ?auto_189991 ?auto_189989 ) ) ( not ( = ?auto_189992 ?auto_189995 ) ) ( not ( = ?auto_189992 ?auto_189994 ) ) ( not ( = ?auto_189992 ?auto_189990 ) ) ( not ( = ?auto_189992 ?auto_189989 ) ) ( not ( = ?auto_189995 ?auto_189994 ) ) ( not ( = ?auto_189995 ?auto_189990 ) ) ( not ( = ?auto_189995 ?auto_189989 ) ) ( not ( = ?auto_189988 ?auto_189993 ) ) ( not ( = ?auto_189988 ?auto_189991 ) ) ( not ( = ?auto_189988 ?auto_189992 ) ) ( not ( = ?auto_189988 ?auto_189995 ) ) ( ON ?auto_189988 ?auto_189989 ) ( CLEAR ?auto_189988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189993 ?auto_189991 ?auto_189992 ?auto_189995 ?auto_189994 ?auto_189990 ?auto_189989 )
      ( MAKE-3PILE ?auto_189988 ?auto_189989 ?auto_189990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189999 - BLOCK
      ?auto_190000 - BLOCK
      ?auto_190001 - BLOCK
    )
    :vars
    (
      ?auto_190002 - BLOCK
      ?auto_190004 - BLOCK
      ?auto_190005 - BLOCK
      ?auto_190003 - BLOCK
      ?auto_190006 - BLOCK
      ?auto_190007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189999 ?auto_190000 ) ) ( not ( = ?auto_189999 ?auto_190001 ) ) ( not ( = ?auto_190000 ?auto_190001 ) ) ( ON ?auto_190001 ?auto_190002 ) ( not ( = ?auto_189999 ?auto_190002 ) ) ( not ( = ?auto_190000 ?auto_190002 ) ) ( not ( = ?auto_190001 ?auto_190002 ) ) ( ON ?auto_190000 ?auto_190001 ) ( CLEAR ?auto_190000 ) ( ON-TABLE ?auto_190004 ) ( ON ?auto_190005 ?auto_190004 ) ( ON ?auto_190003 ?auto_190005 ) ( ON ?auto_190006 ?auto_190003 ) ( ON ?auto_190002 ?auto_190006 ) ( not ( = ?auto_190004 ?auto_190005 ) ) ( not ( = ?auto_190004 ?auto_190003 ) ) ( not ( = ?auto_190004 ?auto_190006 ) ) ( not ( = ?auto_190004 ?auto_190002 ) ) ( not ( = ?auto_190004 ?auto_190001 ) ) ( not ( = ?auto_190004 ?auto_190000 ) ) ( not ( = ?auto_190005 ?auto_190003 ) ) ( not ( = ?auto_190005 ?auto_190006 ) ) ( not ( = ?auto_190005 ?auto_190002 ) ) ( not ( = ?auto_190005 ?auto_190001 ) ) ( not ( = ?auto_190005 ?auto_190000 ) ) ( not ( = ?auto_190003 ?auto_190006 ) ) ( not ( = ?auto_190003 ?auto_190002 ) ) ( not ( = ?auto_190003 ?auto_190001 ) ) ( not ( = ?auto_190003 ?auto_190000 ) ) ( not ( = ?auto_190006 ?auto_190002 ) ) ( not ( = ?auto_190006 ?auto_190001 ) ) ( not ( = ?auto_190006 ?auto_190000 ) ) ( not ( = ?auto_189999 ?auto_190004 ) ) ( not ( = ?auto_189999 ?auto_190005 ) ) ( not ( = ?auto_189999 ?auto_190003 ) ) ( not ( = ?auto_189999 ?auto_190006 ) ) ( ON ?auto_189999 ?auto_190007 ) ( CLEAR ?auto_189999 ) ( HAND-EMPTY ) ( not ( = ?auto_189999 ?auto_190007 ) ) ( not ( = ?auto_190000 ?auto_190007 ) ) ( not ( = ?auto_190001 ?auto_190007 ) ) ( not ( = ?auto_190002 ?auto_190007 ) ) ( not ( = ?auto_190004 ?auto_190007 ) ) ( not ( = ?auto_190005 ?auto_190007 ) ) ( not ( = ?auto_190003 ?auto_190007 ) ) ( not ( = ?auto_190006 ?auto_190007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189999 ?auto_190007 )
      ( MAKE-3PILE ?auto_189999 ?auto_190000 ?auto_190001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190008 - BLOCK
      ?auto_190009 - BLOCK
      ?auto_190010 - BLOCK
    )
    :vars
    (
      ?auto_190012 - BLOCK
      ?auto_190011 - BLOCK
      ?auto_190014 - BLOCK
      ?auto_190015 - BLOCK
      ?auto_190016 - BLOCK
      ?auto_190013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190008 ?auto_190009 ) ) ( not ( = ?auto_190008 ?auto_190010 ) ) ( not ( = ?auto_190009 ?auto_190010 ) ) ( ON ?auto_190010 ?auto_190012 ) ( not ( = ?auto_190008 ?auto_190012 ) ) ( not ( = ?auto_190009 ?auto_190012 ) ) ( not ( = ?auto_190010 ?auto_190012 ) ) ( ON-TABLE ?auto_190011 ) ( ON ?auto_190014 ?auto_190011 ) ( ON ?auto_190015 ?auto_190014 ) ( ON ?auto_190016 ?auto_190015 ) ( ON ?auto_190012 ?auto_190016 ) ( not ( = ?auto_190011 ?auto_190014 ) ) ( not ( = ?auto_190011 ?auto_190015 ) ) ( not ( = ?auto_190011 ?auto_190016 ) ) ( not ( = ?auto_190011 ?auto_190012 ) ) ( not ( = ?auto_190011 ?auto_190010 ) ) ( not ( = ?auto_190011 ?auto_190009 ) ) ( not ( = ?auto_190014 ?auto_190015 ) ) ( not ( = ?auto_190014 ?auto_190016 ) ) ( not ( = ?auto_190014 ?auto_190012 ) ) ( not ( = ?auto_190014 ?auto_190010 ) ) ( not ( = ?auto_190014 ?auto_190009 ) ) ( not ( = ?auto_190015 ?auto_190016 ) ) ( not ( = ?auto_190015 ?auto_190012 ) ) ( not ( = ?auto_190015 ?auto_190010 ) ) ( not ( = ?auto_190015 ?auto_190009 ) ) ( not ( = ?auto_190016 ?auto_190012 ) ) ( not ( = ?auto_190016 ?auto_190010 ) ) ( not ( = ?auto_190016 ?auto_190009 ) ) ( not ( = ?auto_190008 ?auto_190011 ) ) ( not ( = ?auto_190008 ?auto_190014 ) ) ( not ( = ?auto_190008 ?auto_190015 ) ) ( not ( = ?auto_190008 ?auto_190016 ) ) ( ON ?auto_190008 ?auto_190013 ) ( CLEAR ?auto_190008 ) ( not ( = ?auto_190008 ?auto_190013 ) ) ( not ( = ?auto_190009 ?auto_190013 ) ) ( not ( = ?auto_190010 ?auto_190013 ) ) ( not ( = ?auto_190012 ?auto_190013 ) ) ( not ( = ?auto_190011 ?auto_190013 ) ) ( not ( = ?auto_190014 ?auto_190013 ) ) ( not ( = ?auto_190015 ?auto_190013 ) ) ( not ( = ?auto_190016 ?auto_190013 ) ) ( HOLDING ?auto_190009 ) ( CLEAR ?auto_190010 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190011 ?auto_190014 ?auto_190015 ?auto_190016 ?auto_190012 ?auto_190010 ?auto_190009 )
      ( MAKE-3PILE ?auto_190008 ?auto_190009 ?auto_190010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190017 - BLOCK
      ?auto_190018 - BLOCK
      ?auto_190019 - BLOCK
    )
    :vars
    (
      ?auto_190020 - BLOCK
      ?auto_190024 - BLOCK
      ?auto_190025 - BLOCK
      ?auto_190021 - BLOCK
      ?auto_190023 - BLOCK
      ?auto_190022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190017 ?auto_190018 ) ) ( not ( = ?auto_190017 ?auto_190019 ) ) ( not ( = ?auto_190018 ?auto_190019 ) ) ( ON ?auto_190019 ?auto_190020 ) ( not ( = ?auto_190017 ?auto_190020 ) ) ( not ( = ?auto_190018 ?auto_190020 ) ) ( not ( = ?auto_190019 ?auto_190020 ) ) ( ON-TABLE ?auto_190024 ) ( ON ?auto_190025 ?auto_190024 ) ( ON ?auto_190021 ?auto_190025 ) ( ON ?auto_190023 ?auto_190021 ) ( ON ?auto_190020 ?auto_190023 ) ( not ( = ?auto_190024 ?auto_190025 ) ) ( not ( = ?auto_190024 ?auto_190021 ) ) ( not ( = ?auto_190024 ?auto_190023 ) ) ( not ( = ?auto_190024 ?auto_190020 ) ) ( not ( = ?auto_190024 ?auto_190019 ) ) ( not ( = ?auto_190024 ?auto_190018 ) ) ( not ( = ?auto_190025 ?auto_190021 ) ) ( not ( = ?auto_190025 ?auto_190023 ) ) ( not ( = ?auto_190025 ?auto_190020 ) ) ( not ( = ?auto_190025 ?auto_190019 ) ) ( not ( = ?auto_190025 ?auto_190018 ) ) ( not ( = ?auto_190021 ?auto_190023 ) ) ( not ( = ?auto_190021 ?auto_190020 ) ) ( not ( = ?auto_190021 ?auto_190019 ) ) ( not ( = ?auto_190021 ?auto_190018 ) ) ( not ( = ?auto_190023 ?auto_190020 ) ) ( not ( = ?auto_190023 ?auto_190019 ) ) ( not ( = ?auto_190023 ?auto_190018 ) ) ( not ( = ?auto_190017 ?auto_190024 ) ) ( not ( = ?auto_190017 ?auto_190025 ) ) ( not ( = ?auto_190017 ?auto_190021 ) ) ( not ( = ?auto_190017 ?auto_190023 ) ) ( ON ?auto_190017 ?auto_190022 ) ( not ( = ?auto_190017 ?auto_190022 ) ) ( not ( = ?auto_190018 ?auto_190022 ) ) ( not ( = ?auto_190019 ?auto_190022 ) ) ( not ( = ?auto_190020 ?auto_190022 ) ) ( not ( = ?auto_190024 ?auto_190022 ) ) ( not ( = ?auto_190025 ?auto_190022 ) ) ( not ( = ?auto_190021 ?auto_190022 ) ) ( not ( = ?auto_190023 ?auto_190022 ) ) ( CLEAR ?auto_190019 ) ( ON ?auto_190018 ?auto_190017 ) ( CLEAR ?auto_190018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190022 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190022 ?auto_190017 )
      ( MAKE-3PILE ?auto_190017 ?auto_190018 ?auto_190019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190026 - BLOCK
      ?auto_190027 - BLOCK
      ?auto_190028 - BLOCK
    )
    :vars
    (
      ?auto_190030 - BLOCK
      ?auto_190032 - BLOCK
      ?auto_190031 - BLOCK
      ?auto_190029 - BLOCK
      ?auto_190034 - BLOCK
      ?auto_190033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190026 ?auto_190027 ) ) ( not ( = ?auto_190026 ?auto_190028 ) ) ( not ( = ?auto_190027 ?auto_190028 ) ) ( not ( = ?auto_190026 ?auto_190030 ) ) ( not ( = ?auto_190027 ?auto_190030 ) ) ( not ( = ?auto_190028 ?auto_190030 ) ) ( ON-TABLE ?auto_190032 ) ( ON ?auto_190031 ?auto_190032 ) ( ON ?auto_190029 ?auto_190031 ) ( ON ?auto_190034 ?auto_190029 ) ( ON ?auto_190030 ?auto_190034 ) ( not ( = ?auto_190032 ?auto_190031 ) ) ( not ( = ?auto_190032 ?auto_190029 ) ) ( not ( = ?auto_190032 ?auto_190034 ) ) ( not ( = ?auto_190032 ?auto_190030 ) ) ( not ( = ?auto_190032 ?auto_190028 ) ) ( not ( = ?auto_190032 ?auto_190027 ) ) ( not ( = ?auto_190031 ?auto_190029 ) ) ( not ( = ?auto_190031 ?auto_190034 ) ) ( not ( = ?auto_190031 ?auto_190030 ) ) ( not ( = ?auto_190031 ?auto_190028 ) ) ( not ( = ?auto_190031 ?auto_190027 ) ) ( not ( = ?auto_190029 ?auto_190034 ) ) ( not ( = ?auto_190029 ?auto_190030 ) ) ( not ( = ?auto_190029 ?auto_190028 ) ) ( not ( = ?auto_190029 ?auto_190027 ) ) ( not ( = ?auto_190034 ?auto_190030 ) ) ( not ( = ?auto_190034 ?auto_190028 ) ) ( not ( = ?auto_190034 ?auto_190027 ) ) ( not ( = ?auto_190026 ?auto_190032 ) ) ( not ( = ?auto_190026 ?auto_190031 ) ) ( not ( = ?auto_190026 ?auto_190029 ) ) ( not ( = ?auto_190026 ?auto_190034 ) ) ( ON ?auto_190026 ?auto_190033 ) ( not ( = ?auto_190026 ?auto_190033 ) ) ( not ( = ?auto_190027 ?auto_190033 ) ) ( not ( = ?auto_190028 ?auto_190033 ) ) ( not ( = ?auto_190030 ?auto_190033 ) ) ( not ( = ?auto_190032 ?auto_190033 ) ) ( not ( = ?auto_190031 ?auto_190033 ) ) ( not ( = ?auto_190029 ?auto_190033 ) ) ( not ( = ?auto_190034 ?auto_190033 ) ) ( ON ?auto_190027 ?auto_190026 ) ( CLEAR ?auto_190027 ) ( ON-TABLE ?auto_190033 ) ( HOLDING ?auto_190028 ) ( CLEAR ?auto_190030 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190032 ?auto_190031 ?auto_190029 ?auto_190034 ?auto_190030 ?auto_190028 )
      ( MAKE-3PILE ?auto_190026 ?auto_190027 ?auto_190028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190035 - BLOCK
      ?auto_190036 - BLOCK
      ?auto_190037 - BLOCK
    )
    :vars
    (
      ?auto_190038 - BLOCK
      ?auto_190040 - BLOCK
      ?auto_190041 - BLOCK
      ?auto_190043 - BLOCK
      ?auto_190042 - BLOCK
      ?auto_190039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190035 ?auto_190036 ) ) ( not ( = ?auto_190035 ?auto_190037 ) ) ( not ( = ?auto_190036 ?auto_190037 ) ) ( not ( = ?auto_190035 ?auto_190038 ) ) ( not ( = ?auto_190036 ?auto_190038 ) ) ( not ( = ?auto_190037 ?auto_190038 ) ) ( ON-TABLE ?auto_190040 ) ( ON ?auto_190041 ?auto_190040 ) ( ON ?auto_190043 ?auto_190041 ) ( ON ?auto_190042 ?auto_190043 ) ( ON ?auto_190038 ?auto_190042 ) ( not ( = ?auto_190040 ?auto_190041 ) ) ( not ( = ?auto_190040 ?auto_190043 ) ) ( not ( = ?auto_190040 ?auto_190042 ) ) ( not ( = ?auto_190040 ?auto_190038 ) ) ( not ( = ?auto_190040 ?auto_190037 ) ) ( not ( = ?auto_190040 ?auto_190036 ) ) ( not ( = ?auto_190041 ?auto_190043 ) ) ( not ( = ?auto_190041 ?auto_190042 ) ) ( not ( = ?auto_190041 ?auto_190038 ) ) ( not ( = ?auto_190041 ?auto_190037 ) ) ( not ( = ?auto_190041 ?auto_190036 ) ) ( not ( = ?auto_190043 ?auto_190042 ) ) ( not ( = ?auto_190043 ?auto_190038 ) ) ( not ( = ?auto_190043 ?auto_190037 ) ) ( not ( = ?auto_190043 ?auto_190036 ) ) ( not ( = ?auto_190042 ?auto_190038 ) ) ( not ( = ?auto_190042 ?auto_190037 ) ) ( not ( = ?auto_190042 ?auto_190036 ) ) ( not ( = ?auto_190035 ?auto_190040 ) ) ( not ( = ?auto_190035 ?auto_190041 ) ) ( not ( = ?auto_190035 ?auto_190043 ) ) ( not ( = ?auto_190035 ?auto_190042 ) ) ( ON ?auto_190035 ?auto_190039 ) ( not ( = ?auto_190035 ?auto_190039 ) ) ( not ( = ?auto_190036 ?auto_190039 ) ) ( not ( = ?auto_190037 ?auto_190039 ) ) ( not ( = ?auto_190038 ?auto_190039 ) ) ( not ( = ?auto_190040 ?auto_190039 ) ) ( not ( = ?auto_190041 ?auto_190039 ) ) ( not ( = ?auto_190043 ?auto_190039 ) ) ( not ( = ?auto_190042 ?auto_190039 ) ) ( ON ?auto_190036 ?auto_190035 ) ( ON-TABLE ?auto_190039 ) ( CLEAR ?auto_190038 ) ( ON ?auto_190037 ?auto_190036 ) ( CLEAR ?auto_190037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190039 ?auto_190035 ?auto_190036 )
      ( MAKE-3PILE ?auto_190035 ?auto_190036 ?auto_190037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190044 - BLOCK
      ?auto_190045 - BLOCK
      ?auto_190046 - BLOCK
    )
    :vars
    (
      ?auto_190049 - BLOCK
      ?auto_190052 - BLOCK
      ?auto_190048 - BLOCK
      ?auto_190047 - BLOCK
      ?auto_190050 - BLOCK
      ?auto_190051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190044 ?auto_190045 ) ) ( not ( = ?auto_190044 ?auto_190046 ) ) ( not ( = ?auto_190045 ?auto_190046 ) ) ( not ( = ?auto_190044 ?auto_190049 ) ) ( not ( = ?auto_190045 ?auto_190049 ) ) ( not ( = ?auto_190046 ?auto_190049 ) ) ( ON-TABLE ?auto_190052 ) ( ON ?auto_190048 ?auto_190052 ) ( ON ?auto_190047 ?auto_190048 ) ( ON ?auto_190050 ?auto_190047 ) ( not ( = ?auto_190052 ?auto_190048 ) ) ( not ( = ?auto_190052 ?auto_190047 ) ) ( not ( = ?auto_190052 ?auto_190050 ) ) ( not ( = ?auto_190052 ?auto_190049 ) ) ( not ( = ?auto_190052 ?auto_190046 ) ) ( not ( = ?auto_190052 ?auto_190045 ) ) ( not ( = ?auto_190048 ?auto_190047 ) ) ( not ( = ?auto_190048 ?auto_190050 ) ) ( not ( = ?auto_190048 ?auto_190049 ) ) ( not ( = ?auto_190048 ?auto_190046 ) ) ( not ( = ?auto_190048 ?auto_190045 ) ) ( not ( = ?auto_190047 ?auto_190050 ) ) ( not ( = ?auto_190047 ?auto_190049 ) ) ( not ( = ?auto_190047 ?auto_190046 ) ) ( not ( = ?auto_190047 ?auto_190045 ) ) ( not ( = ?auto_190050 ?auto_190049 ) ) ( not ( = ?auto_190050 ?auto_190046 ) ) ( not ( = ?auto_190050 ?auto_190045 ) ) ( not ( = ?auto_190044 ?auto_190052 ) ) ( not ( = ?auto_190044 ?auto_190048 ) ) ( not ( = ?auto_190044 ?auto_190047 ) ) ( not ( = ?auto_190044 ?auto_190050 ) ) ( ON ?auto_190044 ?auto_190051 ) ( not ( = ?auto_190044 ?auto_190051 ) ) ( not ( = ?auto_190045 ?auto_190051 ) ) ( not ( = ?auto_190046 ?auto_190051 ) ) ( not ( = ?auto_190049 ?auto_190051 ) ) ( not ( = ?auto_190052 ?auto_190051 ) ) ( not ( = ?auto_190048 ?auto_190051 ) ) ( not ( = ?auto_190047 ?auto_190051 ) ) ( not ( = ?auto_190050 ?auto_190051 ) ) ( ON ?auto_190045 ?auto_190044 ) ( ON-TABLE ?auto_190051 ) ( ON ?auto_190046 ?auto_190045 ) ( CLEAR ?auto_190046 ) ( HOLDING ?auto_190049 ) ( CLEAR ?auto_190050 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190052 ?auto_190048 ?auto_190047 ?auto_190050 ?auto_190049 )
      ( MAKE-3PILE ?auto_190044 ?auto_190045 ?auto_190046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190053 - BLOCK
      ?auto_190054 - BLOCK
      ?auto_190055 - BLOCK
    )
    :vars
    (
      ?auto_190061 - BLOCK
      ?auto_190058 - BLOCK
      ?auto_190060 - BLOCK
      ?auto_190057 - BLOCK
      ?auto_190056 - BLOCK
      ?auto_190059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190053 ?auto_190054 ) ) ( not ( = ?auto_190053 ?auto_190055 ) ) ( not ( = ?auto_190054 ?auto_190055 ) ) ( not ( = ?auto_190053 ?auto_190061 ) ) ( not ( = ?auto_190054 ?auto_190061 ) ) ( not ( = ?auto_190055 ?auto_190061 ) ) ( ON-TABLE ?auto_190058 ) ( ON ?auto_190060 ?auto_190058 ) ( ON ?auto_190057 ?auto_190060 ) ( ON ?auto_190056 ?auto_190057 ) ( not ( = ?auto_190058 ?auto_190060 ) ) ( not ( = ?auto_190058 ?auto_190057 ) ) ( not ( = ?auto_190058 ?auto_190056 ) ) ( not ( = ?auto_190058 ?auto_190061 ) ) ( not ( = ?auto_190058 ?auto_190055 ) ) ( not ( = ?auto_190058 ?auto_190054 ) ) ( not ( = ?auto_190060 ?auto_190057 ) ) ( not ( = ?auto_190060 ?auto_190056 ) ) ( not ( = ?auto_190060 ?auto_190061 ) ) ( not ( = ?auto_190060 ?auto_190055 ) ) ( not ( = ?auto_190060 ?auto_190054 ) ) ( not ( = ?auto_190057 ?auto_190056 ) ) ( not ( = ?auto_190057 ?auto_190061 ) ) ( not ( = ?auto_190057 ?auto_190055 ) ) ( not ( = ?auto_190057 ?auto_190054 ) ) ( not ( = ?auto_190056 ?auto_190061 ) ) ( not ( = ?auto_190056 ?auto_190055 ) ) ( not ( = ?auto_190056 ?auto_190054 ) ) ( not ( = ?auto_190053 ?auto_190058 ) ) ( not ( = ?auto_190053 ?auto_190060 ) ) ( not ( = ?auto_190053 ?auto_190057 ) ) ( not ( = ?auto_190053 ?auto_190056 ) ) ( ON ?auto_190053 ?auto_190059 ) ( not ( = ?auto_190053 ?auto_190059 ) ) ( not ( = ?auto_190054 ?auto_190059 ) ) ( not ( = ?auto_190055 ?auto_190059 ) ) ( not ( = ?auto_190061 ?auto_190059 ) ) ( not ( = ?auto_190058 ?auto_190059 ) ) ( not ( = ?auto_190060 ?auto_190059 ) ) ( not ( = ?auto_190057 ?auto_190059 ) ) ( not ( = ?auto_190056 ?auto_190059 ) ) ( ON ?auto_190054 ?auto_190053 ) ( ON-TABLE ?auto_190059 ) ( ON ?auto_190055 ?auto_190054 ) ( CLEAR ?auto_190056 ) ( ON ?auto_190061 ?auto_190055 ) ( CLEAR ?auto_190061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190059 ?auto_190053 ?auto_190054 ?auto_190055 )
      ( MAKE-3PILE ?auto_190053 ?auto_190054 ?auto_190055 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190062 - BLOCK
      ?auto_190063 - BLOCK
      ?auto_190064 - BLOCK
    )
    :vars
    (
      ?auto_190069 - BLOCK
      ?auto_190065 - BLOCK
      ?auto_190067 - BLOCK
      ?auto_190068 - BLOCK
      ?auto_190066 - BLOCK
      ?auto_190070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190062 ?auto_190063 ) ) ( not ( = ?auto_190062 ?auto_190064 ) ) ( not ( = ?auto_190063 ?auto_190064 ) ) ( not ( = ?auto_190062 ?auto_190069 ) ) ( not ( = ?auto_190063 ?auto_190069 ) ) ( not ( = ?auto_190064 ?auto_190069 ) ) ( ON-TABLE ?auto_190065 ) ( ON ?auto_190067 ?auto_190065 ) ( ON ?auto_190068 ?auto_190067 ) ( not ( = ?auto_190065 ?auto_190067 ) ) ( not ( = ?auto_190065 ?auto_190068 ) ) ( not ( = ?auto_190065 ?auto_190066 ) ) ( not ( = ?auto_190065 ?auto_190069 ) ) ( not ( = ?auto_190065 ?auto_190064 ) ) ( not ( = ?auto_190065 ?auto_190063 ) ) ( not ( = ?auto_190067 ?auto_190068 ) ) ( not ( = ?auto_190067 ?auto_190066 ) ) ( not ( = ?auto_190067 ?auto_190069 ) ) ( not ( = ?auto_190067 ?auto_190064 ) ) ( not ( = ?auto_190067 ?auto_190063 ) ) ( not ( = ?auto_190068 ?auto_190066 ) ) ( not ( = ?auto_190068 ?auto_190069 ) ) ( not ( = ?auto_190068 ?auto_190064 ) ) ( not ( = ?auto_190068 ?auto_190063 ) ) ( not ( = ?auto_190066 ?auto_190069 ) ) ( not ( = ?auto_190066 ?auto_190064 ) ) ( not ( = ?auto_190066 ?auto_190063 ) ) ( not ( = ?auto_190062 ?auto_190065 ) ) ( not ( = ?auto_190062 ?auto_190067 ) ) ( not ( = ?auto_190062 ?auto_190068 ) ) ( not ( = ?auto_190062 ?auto_190066 ) ) ( ON ?auto_190062 ?auto_190070 ) ( not ( = ?auto_190062 ?auto_190070 ) ) ( not ( = ?auto_190063 ?auto_190070 ) ) ( not ( = ?auto_190064 ?auto_190070 ) ) ( not ( = ?auto_190069 ?auto_190070 ) ) ( not ( = ?auto_190065 ?auto_190070 ) ) ( not ( = ?auto_190067 ?auto_190070 ) ) ( not ( = ?auto_190068 ?auto_190070 ) ) ( not ( = ?auto_190066 ?auto_190070 ) ) ( ON ?auto_190063 ?auto_190062 ) ( ON-TABLE ?auto_190070 ) ( ON ?auto_190064 ?auto_190063 ) ( ON ?auto_190069 ?auto_190064 ) ( CLEAR ?auto_190069 ) ( HOLDING ?auto_190066 ) ( CLEAR ?auto_190068 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190065 ?auto_190067 ?auto_190068 ?auto_190066 )
      ( MAKE-3PILE ?auto_190062 ?auto_190063 ?auto_190064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190071 - BLOCK
      ?auto_190072 - BLOCK
      ?auto_190073 - BLOCK
    )
    :vars
    (
      ?auto_190079 - BLOCK
      ?auto_190075 - BLOCK
      ?auto_190078 - BLOCK
      ?auto_190077 - BLOCK
      ?auto_190074 - BLOCK
      ?auto_190076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190071 ?auto_190072 ) ) ( not ( = ?auto_190071 ?auto_190073 ) ) ( not ( = ?auto_190072 ?auto_190073 ) ) ( not ( = ?auto_190071 ?auto_190079 ) ) ( not ( = ?auto_190072 ?auto_190079 ) ) ( not ( = ?auto_190073 ?auto_190079 ) ) ( ON-TABLE ?auto_190075 ) ( ON ?auto_190078 ?auto_190075 ) ( ON ?auto_190077 ?auto_190078 ) ( not ( = ?auto_190075 ?auto_190078 ) ) ( not ( = ?auto_190075 ?auto_190077 ) ) ( not ( = ?auto_190075 ?auto_190074 ) ) ( not ( = ?auto_190075 ?auto_190079 ) ) ( not ( = ?auto_190075 ?auto_190073 ) ) ( not ( = ?auto_190075 ?auto_190072 ) ) ( not ( = ?auto_190078 ?auto_190077 ) ) ( not ( = ?auto_190078 ?auto_190074 ) ) ( not ( = ?auto_190078 ?auto_190079 ) ) ( not ( = ?auto_190078 ?auto_190073 ) ) ( not ( = ?auto_190078 ?auto_190072 ) ) ( not ( = ?auto_190077 ?auto_190074 ) ) ( not ( = ?auto_190077 ?auto_190079 ) ) ( not ( = ?auto_190077 ?auto_190073 ) ) ( not ( = ?auto_190077 ?auto_190072 ) ) ( not ( = ?auto_190074 ?auto_190079 ) ) ( not ( = ?auto_190074 ?auto_190073 ) ) ( not ( = ?auto_190074 ?auto_190072 ) ) ( not ( = ?auto_190071 ?auto_190075 ) ) ( not ( = ?auto_190071 ?auto_190078 ) ) ( not ( = ?auto_190071 ?auto_190077 ) ) ( not ( = ?auto_190071 ?auto_190074 ) ) ( ON ?auto_190071 ?auto_190076 ) ( not ( = ?auto_190071 ?auto_190076 ) ) ( not ( = ?auto_190072 ?auto_190076 ) ) ( not ( = ?auto_190073 ?auto_190076 ) ) ( not ( = ?auto_190079 ?auto_190076 ) ) ( not ( = ?auto_190075 ?auto_190076 ) ) ( not ( = ?auto_190078 ?auto_190076 ) ) ( not ( = ?auto_190077 ?auto_190076 ) ) ( not ( = ?auto_190074 ?auto_190076 ) ) ( ON ?auto_190072 ?auto_190071 ) ( ON-TABLE ?auto_190076 ) ( ON ?auto_190073 ?auto_190072 ) ( ON ?auto_190079 ?auto_190073 ) ( CLEAR ?auto_190077 ) ( ON ?auto_190074 ?auto_190079 ) ( CLEAR ?auto_190074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190076 ?auto_190071 ?auto_190072 ?auto_190073 ?auto_190079 )
      ( MAKE-3PILE ?auto_190071 ?auto_190072 ?auto_190073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190080 - BLOCK
      ?auto_190081 - BLOCK
      ?auto_190082 - BLOCK
    )
    :vars
    (
      ?auto_190084 - BLOCK
      ?auto_190086 - BLOCK
      ?auto_190087 - BLOCK
      ?auto_190088 - BLOCK
      ?auto_190085 - BLOCK
      ?auto_190083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190080 ?auto_190081 ) ) ( not ( = ?auto_190080 ?auto_190082 ) ) ( not ( = ?auto_190081 ?auto_190082 ) ) ( not ( = ?auto_190080 ?auto_190084 ) ) ( not ( = ?auto_190081 ?auto_190084 ) ) ( not ( = ?auto_190082 ?auto_190084 ) ) ( ON-TABLE ?auto_190086 ) ( ON ?auto_190087 ?auto_190086 ) ( not ( = ?auto_190086 ?auto_190087 ) ) ( not ( = ?auto_190086 ?auto_190088 ) ) ( not ( = ?auto_190086 ?auto_190085 ) ) ( not ( = ?auto_190086 ?auto_190084 ) ) ( not ( = ?auto_190086 ?auto_190082 ) ) ( not ( = ?auto_190086 ?auto_190081 ) ) ( not ( = ?auto_190087 ?auto_190088 ) ) ( not ( = ?auto_190087 ?auto_190085 ) ) ( not ( = ?auto_190087 ?auto_190084 ) ) ( not ( = ?auto_190087 ?auto_190082 ) ) ( not ( = ?auto_190087 ?auto_190081 ) ) ( not ( = ?auto_190088 ?auto_190085 ) ) ( not ( = ?auto_190088 ?auto_190084 ) ) ( not ( = ?auto_190088 ?auto_190082 ) ) ( not ( = ?auto_190088 ?auto_190081 ) ) ( not ( = ?auto_190085 ?auto_190084 ) ) ( not ( = ?auto_190085 ?auto_190082 ) ) ( not ( = ?auto_190085 ?auto_190081 ) ) ( not ( = ?auto_190080 ?auto_190086 ) ) ( not ( = ?auto_190080 ?auto_190087 ) ) ( not ( = ?auto_190080 ?auto_190088 ) ) ( not ( = ?auto_190080 ?auto_190085 ) ) ( ON ?auto_190080 ?auto_190083 ) ( not ( = ?auto_190080 ?auto_190083 ) ) ( not ( = ?auto_190081 ?auto_190083 ) ) ( not ( = ?auto_190082 ?auto_190083 ) ) ( not ( = ?auto_190084 ?auto_190083 ) ) ( not ( = ?auto_190086 ?auto_190083 ) ) ( not ( = ?auto_190087 ?auto_190083 ) ) ( not ( = ?auto_190088 ?auto_190083 ) ) ( not ( = ?auto_190085 ?auto_190083 ) ) ( ON ?auto_190081 ?auto_190080 ) ( ON-TABLE ?auto_190083 ) ( ON ?auto_190082 ?auto_190081 ) ( ON ?auto_190084 ?auto_190082 ) ( ON ?auto_190085 ?auto_190084 ) ( CLEAR ?auto_190085 ) ( HOLDING ?auto_190088 ) ( CLEAR ?auto_190087 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190086 ?auto_190087 ?auto_190088 )
      ( MAKE-3PILE ?auto_190080 ?auto_190081 ?auto_190082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190089 - BLOCK
      ?auto_190090 - BLOCK
      ?auto_190091 - BLOCK
    )
    :vars
    (
      ?auto_190093 - BLOCK
      ?auto_190096 - BLOCK
      ?auto_190094 - BLOCK
      ?auto_190092 - BLOCK
      ?auto_190097 - BLOCK
      ?auto_190095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190089 ?auto_190090 ) ) ( not ( = ?auto_190089 ?auto_190091 ) ) ( not ( = ?auto_190090 ?auto_190091 ) ) ( not ( = ?auto_190089 ?auto_190093 ) ) ( not ( = ?auto_190090 ?auto_190093 ) ) ( not ( = ?auto_190091 ?auto_190093 ) ) ( ON-TABLE ?auto_190096 ) ( ON ?auto_190094 ?auto_190096 ) ( not ( = ?auto_190096 ?auto_190094 ) ) ( not ( = ?auto_190096 ?auto_190092 ) ) ( not ( = ?auto_190096 ?auto_190097 ) ) ( not ( = ?auto_190096 ?auto_190093 ) ) ( not ( = ?auto_190096 ?auto_190091 ) ) ( not ( = ?auto_190096 ?auto_190090 ) ) ( not ( = ?auto_190094 ?auto_190092 ) ) ( not ( = ?auto_190094 ?auto_190097 ) ) ( not ( = ?auto_190094 ?auto_190093 ) ) ( not ( = ?auto_190094 ?auto_190091 ) ) ( not ( = ?auto_190094 ?auto_190090 ) ) ( not ( = ?auto_190092 ?auto_190097 ) ) ( not ( = ?auto_190092 ?auto_190093 ) ) ( not ( = ?auto_190092 ?auto_190091 ) ) ( not ( = ?auto_190092 ?auto_190090 ) ) ( not ( = ?auto_190097 ?auto_190093 ) ) ( not ( = ?auto_190097 ?auto_190091 ) ) ( not ( = ?auto_190097 ?auto_190090 ) ) ( not ( = ?auto_190089 ?auto_190096 ) ) ( not ( = ?auto_190089 ?auto_190094 ) ) ( not ( = ?auto_190089 ?auto_190092 ) ) ( not ( = ?auto_190089 ?auto_190097 ) ) ( ON ?auto_190089 ?auto_190095 ) ( not ( = ?auto_190089 ?auto_190095 ) ) ( not ( = ?auto_190090 ?auto_190095 ) ) ( not ( = ?auto_190091 ?auto_190095 ) ) ( not ( = ?auto_190093 ?auto_190095 ) ) ( not ( = ?auto_190096 ?auto_190095 ) ) ( not ( = ?auto_190094 ?auto_190095 ) ) ( not ( = ?auto_190092 ?auto_190095 ) ) ( not ( = ?auto_190097 ?auto_190095 ) ) ( ON ?auto_190090 ?auto_190089 ) ( ON-TABLE ?auto_190095 ) ( ON ?auto_190091 ?auto_190090 ) ( ON ?auto_190093 ?auto_190091 ) ( ON ?auto_190097 ?auto_190093 ) ( CLEAR ?auto_190094 ) ( ON ?auto_190092 ?auto_190097 ) ( CLEAR ?auto_190092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190095 ?auto_190089 ?auto_190090 ?auto_190091 ?auto_190093 ?auto_190097 )
      ( MAKE-3PILE ?auto_190089 ?auto_190090 ?auto_190091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190098 - BLOCK
      ?auto_190099 - BLOCK
      ?auto_190100 - BLOCK
    )
    :vars
    (
      ?auto_190106 - BLOCK
      ?auto_190103 - BLOCK
      ?auto_190104 - BLOCK
      ?auto_190102 - BLOCK
      ?auto_190105 - BLOCK
      ?auto_190101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190098 ?auto_190099 ) ) ( not ( = ?auto_190098 ?auto_190100 ) ) ( not ( = ?auto_190099 ?auto_190100 ) ) ( not ( = ?auto_190098 ?auto_190106 ) ) ( not ( = ?auto_190099 ?auto_190106 ) ) ( not ( = ?auto_190100 ?auto_190106 ) ) ( ON-TABLE ?auto_190103 ) ( not ( = ?auto_190103 ?auto_190104 ) ) ( not ( = ?auto_190103 ?auto_190102 ) ) ( not ( = ?auto_190103 ?auto_190105 ) ) ( not ( = ?auto_190103 ?auto_190106 ) ) ( not ( = ?auto_190103 ?auto_190100 ) ) ( not ( = ?auto_190103 ?auto_190099 ) ) ( not ( = ?auto_190104 ?auto_190102 ) ) ( not ( = ?auto_190104 ?auto_190105 ) ) ( not ( = ?auto_190104 ?auto_190106 ) ) ( not ( = ?auto_190104 ?auto_190100 ) ) ( not ( = ?auto_190104 ?auto_190099 ) ) ( not ( = ?auto_190102 ?auto_190105 ) ) ( not ( = ?auto_190102 ?auto_190106 ) ) ( not ( = ?auto_190102 ?auto_190100 ) ) ( not ( = ?auto_190102 ?auto_190099 ) ) ( not ( = ?auto_190105 ?auto_190106 ) ) ( not ( = ?auto_190105 ?auto_190100 ) ) ( not ( = ?auto_190105 ?auto_190099 ) ) ( not ( = ?auto_190098 ?auto_190103 ) ) ( not ( = ?auto_190098 ?auto_190104 ) ) ( not ( = ?auto_190098 ?auto_190102 ) ) ( not ( = ?auto_190098 ?auto_190105 ) ) ( ON ?auto_190098 ?auto_190101 ) ( not ( = ?auto_190098 ?auto_190101 ) ) ( not ( = ?auto_190099 ?auto_190101 ) ) ( not ( = ?auto_190100 ?auto_190101 ) ) ( not ( = ?auto_190106 ?auto_190101 ) ) ( not ( = ?auto_190103 ?auto_190101 ) ) ( not ( = ?auto_190104 ?auto_190101 ) ) ( not ( = ?auto_190102 ?auto_190101 ) ) ( not ( = ?auto_190105 ?auto_190101 ) ) ( ON ?auto_190099 ?auto_190098 ) ( ON-TABLE ?auto_190101 ) ( ON ?auto_190100 ?auto_190099 ) ( ON ?auto_190106 ?auto_190100 ) ( ON ?auto_190105 ?auto_190106 ) ( ON ?auto_190102 ?auto_190105 ) ( CLEAR ?auto_190102 ) ( HOLDING ?auto_190104 ) ( CLEAR ?auto_190103 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190103 ?auto_190104 )
      ( MAKE-3PILE ?auto_190098 ?auto_190099 ?auto_190100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190107 - BLOCK
      ?auto_190108 - BLOCK
      ?auto_190109 - BLOCK
    )
    :vars
    (
      ?auto_190113 - BLOCK
      ?auto_190114 - BLOCK
      ?auto_190112 - BLOCK
      ?auto_190115 - BLOCK
      ?auto_190111 - BLOCK
      ?auto_190110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190107 ?auto_190108 ) ) ( not ( = ?auto_190107 ?auto_190109 ) ) ( not ( = ?auto_190108 ?auto_190109 ) ) ( not ( = ?auto_190107 ?auto_190113 ) ) ( not ( = ?auto_190108 ?auto_190113 ) ) ( not ( = ?auto_190109 ?auto_190113 ) ) ( ON-TABLE ?auto_190114 ) ( not ( = ?auto_190114 ?auto_190112 ) ) ( not ( = ?auto_190114 ?auto_190115 ) ) ( not ( = ?auto_190114 ?auto_190111 ) ) ( not ( = ?auto_190114 ?auto_190113 ) ) ( not ( = ?auto_190114 ?auto_190109 ) ) ( not ( = ?auto_190114 ?auto_190108 ) ) ( not ( = ?auto_190112 ?auto_190115 ) ) ( not ( = ?auto_190112 ?auto_190111 ) ) ( not ( = ?auto_190112 ?auto_190113 ) ) ( not ( = ?auto_190112 ?auto_190109 ) ) ( not ( = ?auto_190112 ?auto_190108 ) ) ( not ( = ?auto_190115 ?auto_190111 ) ) ( not ( = ?auto_190115 ?auto_190113 ) ) ( not ( = ?auto_190115 ?auto_190109 ) ) ( not ( = ?auto_190115 ?auto_190108 ) ) ( not ( = ?auto_190111 ?auto_190113 ) ) ( not ( = ?auto_190111 ?auto_190109 ) ) ( not ( = ?auto_190111 ?auto_190108 ) ) ( not ( = ?auto_190107 ?auto_190114 ) ) ( not ( = ?auto_190107 ?auto_190112 ) ) ( not ( = ?auto_190107 ?auto_190115 ) ) ( not ( = ?auto_190107 ?auto_190111 ) ) ( ON ?auto_190107 ?auto_190110 ) ( not ( = ?auto_190107 ?auto_190110 ) ) ( not ( = ?auto_190108 ?auto_190110 ) ) ( not ( = ?auto_190109 ?auto_190110 ) ) ( not ( = ?auto_190113 ?auto_190110 ) ) ( not ( = ?auto_190114 ?auto_190110 ) ) ( not ( = ?auto_190112 ?auto_190110 ) ) ( not ( = ?auto_190115 ?auto_190110 ) ) ( not ( = ?auto_190111 ?auto_190110 ) ) ( ON ?auto_190108 ?auto_190107 ) ( ON-TABLE ?auto_190110 ) ( ON ?auto_190109 ?auto_190108 ) ( ON ?auto_190113 ?auto_190109 ) ( ON ?auto_190111 ?auto_190113 ) ( ON ?auto_190115 ?auto_190111 ) ( CLEAR ?auto_190114 ) ( ON ?auto_190112 ?auto_190115 ) ( CLEAR ?auto_190112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190110 ?auto_190107 ?auto_190108 ?auto_190109 ?auto_190113 ?auto_190111 ?auto_190115 )
      ( MAKE-3PILE ?auto_190107 ?auto_190108 ?auto_190109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190116 - BLOCK
      ?auto_190117 - BLOCK
      ?auto_190118 - BLOCK
    )
    :vars
    (
      ?auto_190124 - BLOCK
      ?auto_190119 - BLOCK
      ?auto_190120 - BLOCK
      ?auto_190122 - BLOCK
      ?auto_190123 - BLOCK
      ?auto_190121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190116 ?auto_190117 ) ) ( not ( = ?auto_190116 ?auto_190118 ) ) ( not ( = ?auto_190117 ?auto_190118 ) ) ( not ( = ?auto_190116 ?auto_190124 ) ) ( not ( = ?auto_190117 ?auto_190124 ) ) ( not ( = ?auto_190118 ?auto_190124 ) ) ( not ( = ?auto_190119 ?auto_190120 ) ) ( not ( = ?auto_190119 ?auto_190122 ) ) ( not ( = ?auto_190119 ?auto_190123 ) ) ( not ( = ?auto_190119 ?auto_190124 ) ) ( not ( = ?auto_190119 ?auto_190118 ) ) ( not ( = ?auto_190119 ?auto_190117 ) ) ( not ( = ?auto_190120 ?auto_190122 ) ) ( not ( = ?auto_190120 ?auto_190123 ) ) ( not ( = ?auto_190120 ?auto_190124 ) ) ( not ( = ?auto_190120 ?auto_190118 ) ) ( not ( = ?auto_190120 ?auto_190117 ) ) ( not ( = ?auto_190122 ?auto_190123 ) ) ( not ( = ?auto_190122 ?auto_190124 ) ) ( not ( = ?auto_190122 ?auto_190118 ) ) ( not ( = ?auto_190122 ?auto_190117 ) ) ( not ( = ?auto_190123 ?auto_190124 ) ) ( not ( = ?auto_190123 ?auto_190118 ) ) ( not ( = ?auto_190123 ?auto_190117 ) ) ( not ( = ?auto_190116 ?auto_190119 ) ) ( not ( = ?auto_190116 ?auto_190120 ) ) ( not ( = ?auto_190116 ?auto_190122 ) ) ( not ( = ?auto_190116 ?auto_190123 ) ) ( ON ?auto_190116 ?auto_190121 ) ( not ( = ?auto_190116 ?auto_190121 ) ) ( not ( = ?auto_190117 ?auto_190121 ) ) ( not ( = ?auto_190118 ?auto_190121 ) ) ( not ( = ?auto_190124 ?auto_190121 ) ) ( not ( = ?auto_190119 ?auto_190121 ) ) ( not ( = ?auto_190120 ?auto_190121 ) ) ( not ( = ?auto_190122 ?auto_190121 ) ) ( not ( = ?auto_190123 ?auto_190121 ) ) ( ON ?auto_190117 ?auto_190116 ) ( ON-TABLE ?auto_190121 ) ( ON ?auto_190118 ?auto_190117 ) ( ON ?auto_190124 ?auto_190118 ) ( ON ?auto_190123 ?auto_190124 ) ( ON ?auto_190122 ?auto_190123 ) ( ON ?auto_190120 ?auto_190122 ) ( CLEAR ?auto_190120 ) ( HOLDING ?auto_190119 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190119 )
      ( MAKE-3PILE ?auto_190116 ?auto_190117 ?auto_190118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190125 - BLOCK
      ?auto_190126 - BLOCK
      ?auto_190127 - BLOCK
    )
    :vars
    (
      ?auto_190130 - BLOCK
      ?auto_190131 - BLOCK
      ?auto_190132 - BLOCK
      ?auto_190128 - BLOCK
      ?auto_190129 - BLOCK
      ?auto_190133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190125 ?auto_190126 ) ) ( not ( = ?auto_190125 ?auto_190127 ) ) ( not ( = ?auto_190126 ?auto_190127 ) ) ( not ( = ?auto_190125 ?auto_190130 ) ) ( not ( = ?auto_190126 ?auto_190130 ) ) ( not ( = ?auto_190127 ?auto_190130 ) ) ( not ( = ?auto_190131 ?auto_190132 ) ) ( not ( = ?auto_190131 ?auto_190128 ) ) ( not ( = ?auto_190131 ?auto_190129 ) ) ( not ( = ?auto_190131 ?auto_190130 ) ) ( not ( = ?auto_190131 ?auto_190127 ) ) ( not ( = ?auto_190131 ?auto_190126 ) ) ( not ( = ?auto_190132 ?auto_190128 ) ) ( not ( = ?auto_190132 ?auto_190129 ) ) ( not ( = ?auto_190132 ?auto_190130 ) ) ( not ( = ?auto_190132 ?auto_190127 ) ) ( not ( = ?auto_190132 ?auto_190126 ) ) ( not ( = ?auto_190128 ?auto_190129 ) ) ( not ( = ?auto_190128 ?auto_190130 ) ) ( not ( = ?auto_190128 ?auto_190127 ) ) ( not ( = ?auto_190128 ?auto_190126 ) ) ( not ( = ?auto_190129 ?auto_190130 ) ) ( not ( = ?auto_190129 ?auto_190127 ) ) ( not ( = ?auto_190129 ?auto_190126 ) ) ( not ( = ?auto_190125 ?auto_190131 ) ) ( not ( = ?auto_190125 ?auto_190132 ) ) ( not ( = ?auto_190125 ?auto_190128 ) ) ( not ( = ?auto_190125 ?auto_190129 ) ) ( ON ?auto_190125 ?auto_190133 ) ( not ( = ?auto_190125 ?auto_190133 ) ) ( not ( = ?auto_190126 ?auto_190133 ) ) ( not ( = ?auto_190127 ?auto_190133 ) ) ( not ( = ?auto_190130 ?auto_190133 ) ) ( not ( = ?auto_190131 ?auto_190133 ) ) ( not ( = ?auto_190132 ?auto_190133 ) ) ( not ( = ?auto_190128 ?auto_190133 ) ) ( not ( = ?auto_190129 ?auto_190133 ) ) ( ON ?auto_190126 ?auto_190125 ) ( ON-TABLE ?auto_190133 ) ( ON ?auto_190127 ?auto_190126 ) ( ON ?auto_190130 ?auto_190127 ) ( ON ?auto_190129 ?auto_190130 ) ( ON ?auto_190128 ?auto_190129 ) ( ON ?auto_190132 ?auto_190128 ) ( ON ?auto_190131 ?auto_190132 ) ( CLEAR ?auto_190131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190133 ?auto_190125 ?auto_190126 ?auto_190127 ?auto_190130 ?auto_190129 ?auto_190128 ?auto_190132 )
      ( MAKE-3PILE ?auto_190125 ?auto_190126 ?auto_190127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190157 - BLOCK
      ?auto_190158 - BLOCK
      ?auto_190159 - BLOCK
      ?auto_190160 - BLOCK
    )
    :vars
    (
      ?auto_190162 - BLOCK
      ?auto_190161 - BLOCK
      ?auto_190163 - BLOCK
      ?auto_190164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190162 ?auto_190160 ) ( ON-TABLE ?auto_190157 ) ( ON ?auto_190158 ?auto_190157 ) ( ON ?auto_190159 ?auto_190158 ) ( ON ?auto_190160 ?auto_190159 ) ( not ( = ?auto_190157 ?auto_190158 ) ) ( not ( = ?auto_190157 ?auto_190159 ) ) ( not ( = ?auto_190157 ?auto_190160 ) ) ( not ( = ?auto_190157 ?auto_190162 ) ) ( not ( = ?auto_190158 ?auto_190159 ) ) ( not ( = ?auto_190158 ?auto_190160 ) ) ( not ( = ?auto_190158 ?auto_190162 ) ) ( not ( = ?auto_190159 ?auto_190160 ) ) ( not ( = ?auto_190159 ?auto_190162 ) ) ( not ( = ?auto_190160 ?auto_190162 ) ) ( not ( = ?auto_190157 ?auto_190161 ) ) ( not ( = ?auto_190157 ?auto_190163 ) ) ( not ( = ?auto_190158 ?auto_190161 ) ) ( not ( = ?auto_190158 ?auto_190163 ) ) ( not ( = ?auto_190159 ?auto_190161 ) ) ( not ( = ?auto_190159 ?auto_190163 ) ) ( not ( = ?auto_190160 ?auto_190161 ) ) ( not ( = ?auto_190160 ?auto_190163 ) ) ( not ( = ?auto_190162 ?auto_190161 ) ) ( not ( = ?auto_190162 ?auto_190163 ) ) ( not ( = ?auto_190161 ?auto_190163 ) ) ( ON ?auto_190161 ?auto_190162 ) ( CLEAR ?auto_190161 ) ( HOLDING ?auto_190163 ) ( CLEAR ?auto_190164 ) ( ON-TABLE ?auto_190164 ) ( not ( = ?auto_190164 ?auto_190163 ) ) ( not ( = ?auto_190157 ?auto_190164 ) ) ( not ( = ?auto_190158 ?auto_190164 ) ) ( not ( = ?auto_190159 ?auto_190164 ) ) ( not ( = ?auto_190160 ?auto_190164 ) ) ( not ( = ?auto_190162 ?auto_190164 ) ) ( not ( = ?auto_190161 ?auto_190164 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190164 ?auto_190163 )
      ( MAKE-4PILE ?auto_190157 ?auto_190158 ?auto_190159 ?auto_190160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190165 - BLOCK
      ?auto_190166 - BLOCK
      ?auto_190167 - BLOCK
      ?auto_190168 - BLOCK
    )
    :vars
    (
      ?auto_190170 - BLOCK
      ?auto_190169 - BLOCK
      ?auto_190171 - BLOCK
      ?auto_190172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190170 ?auto_190168 ) ( ON-TABLE ?auto_190165 ) ( ON ?auto_190166 ?auto_190165 ) ( ON ?auto_190167 ?auto_190166 ) ( ON ?auto_190168 ?auto_190167 ) ( not ( = ?auto_190165 ?auto_190166 ) ) ( not ( = ?auto_190165 ?auto_190167 ) ) ( not ( = ?auto_190165 ?auto_190168 ) ) ( not ( = ?auto_190165 ?auto_190170 ) ) ( not ( = ?auto_190166 ?auto_190167 ) ) ( not ( = ?auto_190166 ?auto_190168 ) ) ( not ( = ?auto_190166 ?auto_190170 ) ) ( not ( = ?auto_190167 ?auto_190168 ) ) ( not ( = ?auto_190167 ?auto_190170 ) ) ( not ( = ?auto_190168 ?auto_190170 ) ) ( not ( = ?auto_190165 ?auto_190169 ) ) ( not ( = ?auto_190165 ?auto_190171 ) ) ( not ( = ?auto_190166 ?auto_190169 ) ) ( not ( = ?auto_190166 ?auto_190171 ) ) ( not ( = ?auto_190167 ?auto_190169 ) ) ( not ( = ?auto_190167 ?auto_190171 ) ) ( not ( = ?auto_190168 ?auto_190169 ) ) ( not ( = ?auto_190168 ?auto_190171 ) ) ( not ( = ?auto_190170 ?auto_190169 ) ) ( not ( = ?auto_190170 ?auto_190171 ) ) ( not ( = ?auto_190169 ?auto_190171 ) ) ( ON ?auto_190169 ?auto_190170 ) ( CLEAR ?auto_190172 ) ( ON-TABLE ?auto_190172 ) ( not ( = ?auto_190172 ?auto_190171 ) ) ( not ( = ?auto_190165 ?auto_190172 ) ) ( not ( = ?auto_190166 ?auto_190172 ) ) ( not ( = ?auto_190167 ?auto_190172 ) ) ( not ( = ?auto_190168 ?auto_190172 ) ) ( not ( = ?auto_190170 ?auto_190172 ) ) ( not ( = ?auto_190169 ?auto_190172 ) ) ( ON ?auto_190171 ?auto_190169 ) ( CLEAR ?auto_190171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190165 ?auto_190166 ?auto_190167 ?auto_190168 ?auto_190170 ?auto_190169 )
      ( MAKE-4PILE ?auto_190165 ?auto_190166 ?auto_190167 ?auto_190168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190173 - BLOCK
      ?auto_190174 - BLOCK
      ?auto_190175 - BLOCK
      ?auto_190176 - BLOCK
    )
    :vars
    (
      ?auto_190177 - BLOCK
      ?auto_190179 - BLOCK
      ?auto_190180 - BLOCK
      ?auto_190178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190177 ?auto_190176 ) ( ON-TABLE ?auto_190173 ) ( ON ?auto_190174 ?auto_190173 ) ( ON ?auto_190175 ?auto_190174 ) ( ON ?auto_190176 ?auto_190175 ) ( not ( = ?auto_190173 ?auto_190174 ) ) ( not ( = ?auto_190173 ?auto_190175 ) ) ( not ( = ?auto_190173 ?auto_190176 ) ) ( not ( = ?auto_190173 ?auto_190177 ) ) ( not ( = ?auto_190174 ?auto_190175 ) ) ( not ( = ?auto_190174 ?auto_190176 ) ) ( not ( = ?auto_190174 ?auto_190177 ) ) ( not ( = ?auto_190175 ?auto_190176 ) ) ( not ( = ?auto_190175 ?auto_190177 ) ) ( not ( = ?auto_190176 ?auto_190177 ) ) ( not ( = ?auto_190173 ?auto_190179 ) ) ( not ( = ?auto_190173 ?auto_190180 ) ) ( not ( = ?auto_190174 ?auto_190179 ) ) ( not ( = ?auto_190174 ?auto_190180 ) ) ( not ( = ?auto_190175 ?auto_190179 ) ) ( not ( = ?auto_190175 ?auto_190180 ) ) ( not ( = ?auto_190176 ?auto_190179 ) ) ( not ( = ?auto_190176 ?auto_190180 ) ) ( not ( = ?auto_190177 ?auto_190179 ) ) ( not ( = ?auto_190177 ?auto_190180 ) ) ( not ( = ?auto_190179 ?auto_190180 ) ) ( ON ?auto_190179 ?auto_190177 ) ( not ( = ?auto_190178 ?auto_190180 ) ) ( not ( = ?auto_190173 ?auto_190178 ) ) ( not ( = ?auto_190174 ?auto_190178 ) ) ( not ( = ?auto_190175 ?auto_190178 ) ) ( not ( = ?auto_190176 ?auto_190178 ) ) ( not ( = ?auto_190177 ?auto_190178 ) ) ( not ( = ?auto_190179 ?auto_190178 ) ) ( ON ?auto_190180 ?auto_190179 ) ( CLEAR ?auto_190180 ) ( HOLDING ?auto_190178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190178 )
      ( MAKE-4PILE ?auto_190173 ?auto_190174 ?auto_190175 ?auto_190176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190193 - BLOCK
      ?auto_190194 - BLOCK
      ?auto_190195 - BLOCK
      ?auto_190196 - BLOCK
    )
    :vars
    (
      ?auto_190199 - BLOCK
      ?auto_190198 - BLOCK
      ?auto_190200 - BLOCK
      ?auto_190197 - BLOCK
      ?auto_190201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190199 ?auto_190196 ) ( ON-TABLE ?auto_190193 ) ( ON ?auto_190194 ?auto_190193 ) ( ON ?auto_190195 ?auto_190194 ) ( ON ?auto_190196 ?auto_190195 ) ( not ( = ?auto_190193 ?auto_190194 ) ) ( not ( = ?auto_190193 ?auto_190195 ) ) ( not ( = ?auto_190193 ?auto_190196 ) ) ( not ( = ?auto_190193 ?auto_190199 ) ) ( not ( = ?auto_190194 ?auto_190195 ) ) ( not ( = ?auto_190194 ?auto_190196 ) ) ( not ( = ?auto_190194 ?auto_190199 ) ) ( not ( = ?auto_190195 ?auto_190196 ) ) ( not ( = ?auto_190195 ?auto_190199 ) ) ( not ( = ?auto_190196 ?auto_190199 ) ) ( not ( = ?auto_190193 ?auto_190198 ) ) ( not ( = ?auto_190193 ?auto_190200 ) ) ( not ( = ?auto_190194 ?auto_190198 ) ) ( not ( = ?auto_190194 ?auto_190200 ) ) ( not ( = ?auto_190195 ?auto_190198 ) ) ( not ( = ?auto_190195 ?auto_190200 ) ) ( not ( = ?auto_190196 ?auto_190198 ) ) ( not ( = ?auto_190196 ?auto_190200 ) ) ( not ( = ?auto_190199 ?auto_190198 ) ) ( not ( = ?auto_190199 ?auto_190200 ) ) ( not ( = ?auto_190198 ?auto_190200 ) ) ( ON ?auto_190198 ?auto_190199 ) ( not ( = ?auto_190197 ?auto_190200 ) ) ( not ( = ?auto_190193 ?auto_190197 ) ) ( not ( = ?auto_190194 ?auto_190197 ) ) ( not ( = ?auto_190195 ?auto_190197 ) ) ( not ( = ?auto_190196 ?auto_190197 ) ) ( not ( = ?auto_190199 ?auto_190197 ) ) ( not ( = ?auto_190198 ?auto_190197 ) ) ( ON ?auto_190200 ?auto_190198 ) ( CLEAR ?auto_190200 ) ( ON ?auto_190197 ?auto_190201 ) ( CLEAR ?auto_190197 ) ( HAND-EMPTY ) ( not ( = ?auto_190193 ?auto_190201 ) ) ( not ( = ?auto_190194 ?auto_190201 ) ) ( not ( = ?auto_190195 ?auto_190201 ) ) ( not ( = ?auto_190196 ?auto_190201 ) ) ( not ( = ?auto_190199 ?auto_190201 ) ) ( not ( = ?auto_190198 ?auto_190201 ) ) ( not ( = ?auto_190200 ?auto_190201 ) ) ( not ( = ?auto_190197 ?auto_190201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190197 ?auto_190201 )
      ( MAKE-4PILE ?auto_190193 ?auto_190194 ?auto_190195 ?auto_190196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190202 - BLOCK
      ?auto_190203 - BLOCK
      ?auto_190204 - BLOCK
      ?auto_190205 - BLOCK
    )
    :vars
    (
      ?auto_190210 - BLOCK
      ?auto_190208 - BLOCK
      ?auto_190206 - BLOCK
      ?auto_190207 - BLOCK
      ?auto_190209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190210 ?auto_190205 ) ( ON-TABLE ?auto_190202 ) ( ON ?auto_190203 ?auto_190202 ) ( ON ?auto_190204 ?auto_190203 ) ( ON ?auto_190205 ?auto_190204 ) ( not ( = ?auto_190202 ?auto_190203 ) ) ( not ( = ?auto_190202 ?auto_190204 ) ) ( not ( = ?auto_190202 ?auto_190205 ) ) ( not ( = ?auto_190202 ?auto_190210 ) ) ( not ( = ?auto_190203 ?auto_190204 ) ) ( not ( = ?auto_190203 ?auto_190205 ) ) ( not ( = ?auto_190203 ?auto_190210 ) ) ( not ( = ?auto_190204 ?auto_190205 ) ) ( not ( = ?auto_190204 ?auto_190210 ) ) ( not ( = ?auto_190205 ?auto_190210 ) ) ( not ( = ?auto_190202 ?auto_190208 ) ) ( not ( = ?auto_190202 ?auto_190206 ) ) ( not ( = ?auto_190203 ?auto_190208 ) ) ( not ( = ?auto_190203 ?auto_190206 ) ) ( not ( = ?auto_190204 ?auto_190208 ) ) ( not ( = ?auto_190204 ?auto_190206 ) ) ( not ( = ?auto_190205 ?auto_190208 ) ) ( not ( = ?auto_190205 ?auto_190206 ) ) ( not ( = ?auto_190210 ?auto_190208 ) ) ( not ( = ?auto_190210 ?auto_190206 ) ) ( not ( = ?auto_190208 ?auto_190206 ) ) ( ON ?auto_190208 ?auto_190210 ) ( not ( = ?auto_190207 ?auto_190206 ) ) ( not ( = ?auto_190202 ?auto_190207 ) ) ( not ( = ?auto_190203 ?auto_190207 ) ) ( not ( = ?auto_190204 ?auto_190207 ) ) ( not ( = ?auto_190205 ?auto_190207 ) ) ( not ( = ?auto_190210 ?auto_190207 ) ) ( not ( = ?auto_190208 ?auto_190207 ) ) ( ON ?auto_190207 ?auto_190209 ) ( CLEAR ?auto_190207 ) ( not ( = ?auto_190202 ?auto_190209 ) ) ( not ( = ?auto_190203 ?auto_190209 ) ) ( not ( = ?auto_190204 ?auto_190209 ) ) ( not ( = ?auto_190205 ?auto_190209 ) ) ( not ( = ?auto_190210 ?auto_190209 ) ) ( not ( = ?auto_190208 ?auto_190209 ) ) ( not ( = ?auto_190206 ?auto_190209 ) ) ( not ( = ?auto_190207 ?auto_190209 ) ) ( HOLDING ?auto_190206 ) ( CLEAR ?auto_190208 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190202 ?auto_190203 ?auto_190204 ?auto_190205 ?auto_190210 ?auto_190208 ?auto_190206 )
      ( MAKE-4PILE ?auto_190202 ?auto_190203 ?auto_190204 ?auto_190205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190284 - BLOCK
      ?auto_190285 - BLOCK
      ?auto_190286 - BLOCK
      ?auto_190287 - BLOCK
    )
    :vars
    (
      ?auto_190288 - BLOCK
      ?auto_190290 - BLOCK
      ?auto_190289 - BLOCK
      ?auto_190291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190284 ) ( ON ?auto_190285 ?auto_190284 ) ( not ( = ?auto_190284 ?auto_190285 ) ) ( not ( = ?auto_190284 ?auto_190286 ) ) ( not ( = ?auto_190284 ?auto_190287 ) ) ( not ( = ?auto_190285 ?auto_190286 ) ) ( not ( = ?auto_190285 ?auto_190287 ) ) ( not ( = ?auto_190286 ?auto_190287 ) ) ( ON ?auto_190287 ?auto_190288 ) ( not ( = ?auto_190284 ?auto_190288 ) ) ( not ( = ?auto_190285 ?auto_190288 ) ) ( not ( = ?auto_190286 ?auto_190288 ) ) ( not ( = ?auto_190287 ?auto_190288 ) ) ( CLEAR ?auto_190285 ) ( ON ?auto_190286 ?auto_190287 ) ( CLEAR ?auto_190286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190290 ) ( ON ?auto_190289 ?auto_190290 ) ( ON ?auto_190291 ?auto_190289 ) ( ON ?auto_190288 ?auto_190291 ) ( not ( = ?auto_190290 ?auto_190289 ) ) ( not ( = ?auto_190290 ?auto_190291 ) ) ( not ( = ?auto_190290 ?auto_190288 ) ) ( not ( = ?auto_190290 ?auto_190287 ) ) ( not ( = ?auto_190290 ?auto_190286 ) ) ( not ( = ?auto_190289 ?auto_190291 ) ) ( not ( = ?auto_190289 ?auto_190288 ) ) ( not ( = ?auto_190289 ?auto_190287 ) ) ( not ( = ?auto_190289 ?auto_190286 ) ) ( not ( = ?auto_190291 ?auto_190288 ) ) ( not ( = ?auto_190291 ?auto_190287 ) ) ( not ( = ?auto_190291 ?auto_190286 ) ) ( not ( = ?auto_190284 ?auto_190290 ) ) ( not ( = ?auto_190284 ?auto_190289 ) ) ( not ( = ?auto_190284 ?auto_190291 ) ) ( not ( = ?auto_190285 ?auto_190290 ) ) ( not ( = ?auto_190285 ?auto_190289 ) ) ( not ( = ?auto_190285 ?auto_190291 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190290 ?auto_190289 ?auto_190291 ?auto_190288 ?auto_190287 )
      ( MAKE-4PILE ?auto_190284 ?auto_190285 ?auto_190286 ?auto_190287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190292 - BLOCK
      ?auto_190293 - BLOCK
      ?auto_190294 - BLOCK
      ?auto_190295 - BLOCK
    )
    :vars
    (
      ?auto_190297 - BLOCK
      ?auto_190299 - BLOCK
      ?auto_190298 - BLOCK
      ?auto_190296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190292 ) ( not ( = ?auto_190292 ?auto_190293 ) ) ( not ( = ?auto_190292 ?auto_190294 ) ) ( not ( = ?auto_190292 ?auto_190295 ) ) ( not ( = ?auto_190293 ?auto_190294 ) ) ( not ( = ?auto_190293 ?auto_190295 ) ) ( not ( = ?auto_190294 ?auto_190295 ) ) ( ON ?auto_190295 ?auto_190297 ) ( not ( = ?auto_190292 ?auto_190297 ) ) ( not ( = ?auto_190293 ?auto_190297 ) ) ( not ( = ?auto_190294 ?auto_190297 ) ) ( not ( = ?auto_190295 ?auto_190297 ) ) ( ON ?auto_190294 ?auto_190295 ) ( CLEAR ?auto_190294 ) ( ON-TABLE ?auto_190299 ) ( ON ?auto_190298 ?auto_190299 ) ( ON ?auto_190296 ?auto_190298 ) ( ON ?auto_190297 ?auto_190296 ) ( not ( = ?auto_190299 ?auto_190298 ) ) ( not ( = ?auto_190299 ?auto_190296 ) ) ( not ( = ?auto_190299 ?auto_190297 ) ) ( not ( = ?auto_190299 ?auto_190295 ) ) ( not ( = ?auto_190299 ?auto_190294 ) ) ( not ( = ?auto_190298 ?auto_190296 ) ) ( not ( = ?auto_190298 ?auto_190297 ) ) ( not ( = ?auto_190298 ?auto_190295 ) ) ( not ( = ?auto_190298 ?auto_190294 ) ) ( not ( = ?auto_190296 ?auto_190297 ) ) ( not ( = ?auto_190296 ?auto_190295 ) ) ( not ( = ?auto_190296 ?auto_190294 ) ) ( not ( = ?auto_190292 ?auto_190299 ) ) ( not ( = ?auto_190292 ?auto_190298 ) ) ( not ( = ?auto_190292 ?auto_190296 ) ) ( not ( = ?auto_190293 ?auto_190299 ) ) ( not ( = ?auto_190293 ?auto_190298 ) ) ( not ( = ?auto_190293 ?auto_190296 ) ) ( HOLDING ?auto_190293 ) ( CLEAR ?auto_190292 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190292 ?auto_190293 )
      ( MAKE-4PILE ?auto_190292 ?auto_190293 ?auto_190294 ?auto_190295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190300 - BLOCK
      ?auto_190301 - BLOCK
      ?auto_190302 - BLOCK
      ?auto_190303 - BLOCK
    )
    :vars
    (
      ?auto_190306 - BLOCK
      ?auto_190307 - BLOCK
      ?auto_190305 - BLOCK
      ?auto_190304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190300 ) ( not ( = ?auto_190300 ?auto_190301 ) ) ( not ( = ?auto_190300 ?auto_190302 ) ) ( not ( = ?auto_190300 ?auto_190303 ) ) ( not ( = ?auto_190301 ?auto_190302 ) ) ( not ( = ?auto_190301 ?auto_190303 ) ) ( not ( = ?auto_190302 ?auto_190303 ) ) ( ON ?auto_190303 ?auto_190306 ) ( not ( = ?auto_190300 ?auto_190306 ) ) ( not ( = ?auto_190301 ?auto_190306 ) ) ( not ( = ?auto_190302 ?auto_190306 ) ) ( not ( = ?auto_190303 ?auto_190306 ) ) ( ON ?auto_190302 ?auto_190303 ) ( ON-TABLE ?auto_190307 ) ( ON ?auto_190305 ?auto_190307 ) ( ON ?auto_190304 ?auto_190305 ) ( ON ?auto_190306 ?auto_190304 ) ( not ( = ?auto_190307 ?auto_190305 ) ) ( not ( = ?auto_190307 ?auto_190304 ) ) ( not ( = ?auto_190307 ?auto_190306 ) ) ( not ( = ?auto_190307 ?auto_190303 ) ) ( not ( = ?auto_190307 ?auto_190302 ) ) ( not ( = ?auto_190305 ?auto_190304 ) ) ( not ( = ?auto_190305 ?auto_190306 ) ) ( not ( = ?auto_190305 ?auto_190303 ) ) ( not ( = ?auto_190305 ?auto_190302 ) ) ( not ( = ?auto_190304 ?auto_190306 ) ) ( not ( = ?auto_190304 ?auto_190303 ) ) ( not ( = ?auto_190304 ?auto_190302 ) ) ( not ( = ?auto_190300 ?auto_190307 ) ) ( not ( = ?auto_190300 ?auto_190305 ) ) ( not ( = ?auto_190300 ?auto_190304 ) ) ( not ( = ?auto_190301 ?auto_190307 ) ) ( not ( = ?auto_190301 ?auto_190305 ) ) ( not ( = ?auto_190301 ?auto_190304 ) ) ( CLEAR ?auto_190300 ) ( ON ?auto_190301 ?auto_190302 ) ( CLEAR ?auto_190301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190307 ?auto_190305 ?auto_190304 ?auto_190306 ?auto_190303 ?auto_190302 )
      ( MAKE-4PILE ?auto_190300 ?auto_190301 ?auto_190302 ?auto_190303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190308 - BLOCK
      ?auto_190309 - BLOCK
      ?auto_190310 - BLOCK
      ?auto_190311 - BLOCK
    )
    :vars
    (
      ?auto_190312 - BLOCK
      ?auto_190314 - BLOCK
      ?auto_190315 - BLOCK
      ?auto_190313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190308 ?auto_190309 ) ) ( not ( = ?auto_190308 ?auto_190310 ) ) ( not ( = ?auto_190308 ?auto_190311 ) ) ( not ( = ?auto_190309 ?auto_190310 ) ) ( not ( = ?auto_190309 ?auto_190311 ) ) ( not ( = ?auto_190310 ?auto_190311 ) ) ( ON ?auto_190311 ?auto_190312 ) ( not ( = ?auto_190308 ?auto_190312 ) ) ( not ( = ?auto_190309 ?auto_190312 ) ) ( not ( = ?auto_190310 ?auto_190312 ) ) ( not ( = ?auto_190311 ?auto_190312 ) ) ( ON ?auto_190310 ?auto_190311 ) ( ON-TABLE ?auto_190314 ) ( ON ?auto_190315 ?auto_190314 ) ( ON ?auto_190313 ?auto_190315 ) ( ON ?auto_190312 ?auto_190313 ) ( not ( = ?auto_190314 ?auto_190315 ) ) ( not ( = ?auto_190314 ?auto_190313 ) ) ( not ( = ?auto_190314 ?auto_190312 ) ) ( not ( = ?auto_190314 ?auto_190311 ) ) ( not ( = ?auto_190314 ?auto_190310 ) ) ( not ( = ?auto_190315 ?auto_190313 ) ) ( not ( = ?auto_190315 ?auto_190312 ) ) ( not ( = ?auto_190315 ?auto_190311 ) ) ( not ( = ?auto_190315 ?auto_190310 ) ) ( not ( = ?auto_190313 ?auto_190312 ) ) ( not ( = ?auto_190313 ?auto_190311 ) ) ( not ( = ?auto_190313 ?auto_190310 ) ) ( not ( = ?auto_190308 ?auto_190314 ) ) ( not ( = ?auto_190308 ?auto_190315 ) ) ( not ( = ?auto_190308 ?auto_190313 ) ) ( not ( = ?auto_190309 ?auto_190314 ) ) ( not ( = ?auto_190309 ?auto_190315 ) ) ( not ( = ?auto_190309 ?auto_190313 ) ) ( ON ?auto_190309 ?auto_190310 ) ( CLEAR ?auto_190309 ) ( HOLDING ?auto_190308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190308 )
      ( MAKE-4PILE ?auto_190308 ?auto_190309 ?auto_190310 ?auto_190311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190316 - BLOCK
      ?auto_190317 - BLOCK
      ?auto_190318 - BLOCK
      ?auto_190319 - BLOCK
    )
    :vars
    (
      ?auto_190321 - BLOCK
      ?auto_190322 - BLOCK
      ?auto_190320 - BLOCK
      ?auto_190323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190316 ?auto_190317 ) ) ( not ( = ?auto_190316 ?auto_190318 ) ) ( not ( = ?auto_190316 ?auto_190319 ) ) ( not ( = ?auto_190317 ?auto_190318 ) ) ( not ( = ?auto_190317 ?auto_190319 ) ) ( not ( = ?auto_190318 ?auto_190319 ) ) ( ON ?auto_190319 ?auto_190321 ) ( not ( = ?auto_190316 ?auto_190321 ) ) ( not ( = ?auto_190317 ?auto_190321 ) ) ( not ( = ?auto_190318 ?auto_190321 ) ) ( not ( = ?auto_190319 ?auto_190321 ) ) ( ON ?auto_190318 ?auto_190319 ) ( ON-TABLE ?auto_190322 ) ( ON ?auto_190320 ?auto_190322 ) ( ON ?auto_190323 ?auto_190320 ) ( ON ?auto_190321 ?auto_190323 ) ( not ( = ?auto_190322 ?auto_190320 ) ) ( not ( = ?auto_190322 ?auto_190323 ) ) ( not ( = ?auto_190322 ?auto_190321 ) ) ( not ( = ?auto_190322 ?auto_190319 ) ) ( not ( = ?auto_190322 ?auto_190318 ) ) ( not ( = ?auto_190320 ?auto_190323 ) ) ( not ( = ?auto_190320 ?auto_190321 ) ) ( not ( = ?auto_190320 ?auto_190319 ) ) ( not ( = ?auto_190320 ?auto_190318 ) ) ( not ( = ?auto_190323 ?auto_190321 ) ) ( not ( = ?auto_190323 ?auto_190319 ) ) ( not ( = ?auto_190323 ?auto_190318 ) ) ( not ( = ?auto_190316 ?auto_190322 ) ) ( not ( = ?auto_190316 ?auto_190320 ) ) ( not ( = ?auto_190316 ?auto_190323 ) ) ( not ( = ?auto_190317 ?auto_190322 ) ) ( not ( = ?auto_190317 ?auto_190320 ) ) ( not ( = ?auto_190317 ?auto_190323 ) ) ( ON ?auto_190317 ?auto_190318 ) ( ON ?auto_190316 ?auto_190317 ) ( CLEAR ?auto_190316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190322 ?auto_190320 ?auto_190323 ?auto_190321 ?auto_190319 ?auto_190318 ?auto_190317 )
      ( MAKE-4PILE ?auto_190316 ?auto_190317 ?auto_190318 ?auto_190319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190328 - BLOCK
      ?auto_190329 - BLOCK
      ?auto_190330 - BLOCK
      ?auto_190331 - BLOCK
    )
    :vars
    (
      ?auto_190335 - BLOCK
      ?auto_190332 - BLOCK
      ?auto_190334 - BLOCK
      ?auto_190333 - BLOCK
      ?auto_190336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190328 ?auto_190329 ) ) ( not ( = ?auto_190328 ?auto_190330 ) ) ( not ( = ?auto_190328 ?auto_190331 ) ) ( not ( = ?auto_190329 ?auto_190330 ) ) ( not ( = ?auto_190329 ?auto_190331 ) ) ( not ( = ?auto_190330 ?auto_190331 ) ) ( ON ?auto_190331 ?auto_190335 ) ( not ( = ?auto_190328 ?auto_190335 ) ) ( not ( = ?auto_190329 ?auto_190335 ) ) ( not ( = ?auto_190330 ?auto_190335 ) ) ( not ( = ?auto_190331 ?auto_190335 ) ) ( ON ?auto_190330 ?auto_190331 ) ( ON-TABLE ?auto_190332 ) ( ON ?auto_190334 ?auto_190332 ) ( ON ?auto_190333 ?auto_190334 ) ( ON ?auto_190335 ?auto_190333 ) ( not ( = ?auto_190332 ?auto_190334 ) ) ( not ( = ?auto_190332 ?auto_190333 ) ) ( not ( = ?auto_190332 ?auto_190335 ) ) ( not ( = ?auto_190332 ?auto_190331 ) ) ( not ( = ?auto_190332 ?auto_190330 ) ) ( not ( = ?auto_190334 ?auto_190333 ) ) ( not ( = ?auto_190334 ?auto_190335 ) ) ( not ( = ?auto_190334 ?auto_190331 ) ) ( not ( = ?auto_190334 ?auto_190330 ) ) ( not ( = ?auto_190333 ?auto_190335 ) ) ( not ( = ?auto_190333 ?auto_190331 ) ) ( not ( = ?auto_190333 ?auto_190330 ) ) ( not ( = ?auto_190328 ?auto_190332 ) ) ( not ( = ?auto_190328 ?auto_190334 ) ) ( not ( = ?auto_190328 ?auto_190333 ) ) ( not ( = ?auto_190329 ?auto_190332 ) ) ( not ( = ?auto_190329 ?auto_190334 ) ) ( not ( = ?auto_190329 ?auto_190333 ) ) ( ON ?auto_190329 ?auto_190330 ) ( CLEAR ?auto_190329 ) ( ON ?auto_190328 ?auto_190336 ) ( CLEAR ?auto_190328 ) ( HAND-EMPTY ) ( not ( = ?auto_190328 ?auto_190336 ) ) ( not ( = ?auto_190329 ?auto_190336 ) ) ( not ( = ?auto_190330 ?auto_190336 ) ) ( not ( = ?auto_190331 ?auto_190336 ) ) ( not ( = ?auto_190335 ?auto_190336 ) ) ( not ( = ?auto_190332 ?auto_190336 ) ) ( not ( = ?auto_190334 ?auto_190336 ) ) ( not ( = ?auto_190333 ?auto_190336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190328 ?auto_190336 )
      ( MAKE-4PILE ?auto_190328 ?auto_190329 ?auto_190330 ?auto_190331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190337 - BLOCK
      ?auto_190338 - BLOCK
      ?auto_190339 - BLOCK
      ?auto_190340 - BLOCK
    )
    :vars
    (
      ?auto_190344 - BLOCK
      ?auto_190341 - BLOCK
      ?auto_190343 - BLOCK
      ?auto_190345 - BLOCK
      ?auto_190342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190337 ?auto_190338 ) ) ( not ( = ?auto_190337 ?auto_190339 ) ) ( not ( = ?auto_190337 ?auto_190340 ) ) ( not ( = ?auto_190338 ?auto_190339 ) ) ( not ( = ?auto_190338 ?auto_190340 ) ) ( not ( = ?auto_190339 ?auto_190340 ) ) ( ON ?auto_190340 ?auto_190344 ) ( not ( = ?auto_190337 ?auto_190344 ) ) ( not ( = ?auto_190338 ?auto_190344 ) ) ( not ( = ?auto_190339 ?auto_190344 ) ) ( not ( = ?auto_190340 ?auto_190344 ) ) ( ON ?auto_190339 ?auto_190340 ) ( ON-TABLE ?auto_190341 ) ( ON ?auto_190343 ?auto_190341 ) ( ON ?auto_190345 ?auto_190343 ) ( ON ?auto_190344 ?auto_190345 ) ( not ( = ?auto_190341 ?auto_190343 ) ) ( not ( = ?auto_190341 ?auto_190345 ) ) ( not ( = ?auto_190341 ?auto_190344 ) ) ( not ( = ?auto_190341 ?auto_190340 ) ) ( not ( = ?auto_190341 ?auto_190339 ) ) ( not ( = ?auto_190343 ?auto_190345 ) ) ( not ( = ?auto_190343 ?auto_190344 ) ) ( not ( = ?auto_190343 ?auto_190340 ) ) ( not ( = ?auto_190343 ?auto_190339 ) ) ( not ( = ?auto_190345 ?auto_190344 ) ) ( not ( = ?auto_190345 ?auto_190340 ) ) ( not ( = ?auto_190345 ?auto_190339 ) ) ( not ( = ?auto_190337 ?auto_190341 ) ) ( not ( = ?auto_190337 ?auto_190343 ) ) ( not ( = ?auto_190337 ?auto_190345 ) ) ( not ( = ?auto_190338 ?auto_190341 ) ) ( not ( = ?auto_190338 ?auto_190343 ) ) ( not ( = ?auto_190338 ?auto_190345 ) ) ( ON ?auto_190337 ?auto_190342 ) ( CLEAR ?auto_190337 ) ( not ( = ?auto_190337 ?auto_190342 ) ) ( not ( = ?auto_190338 ?auto_190342 ) ) ( not ( = ?auto_190339 ?auto_190342 ) ) ( not ( = ?auto_190340 ?auto_190342 ) ) ( not ( = ?auto_190344 ?auto_190342 ) ) ( not ( = ?auto_190341 ?auto_190342 ) ) ( not ( = ?auto_190343 ?auto_190342 ) ) ( not ( = ?auto_190345 ?auto_190342 ) ) ( HOLDING ?auto_190338 ) ( CLEAR ?auto_190339 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190341 ?auto_190343 ?auto_190345 ?auto_190344 ?auto_190340 ?auto_190339 ?auto_190338 )
      ( MAKE-4PILE ?auto_190337 ?auto_190338 ?auto_190339 ?auto_190340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190346 - BLOCK
      ?auto_190347 - BLOCK
      ?auto_190348 - BLOCK
      ?auto_190349 - BLOCK
    )
    :vars
    (
      ?auto_190354 - BLOCK
      ?auto_190352 - BLOCK
      ?auto_190350 - BLOCK
      ?auto_190351 - BLOCK
      ?auto_190353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190346 ?auto_190347 ) ) ( not ( = ?auto_190346 ?auto_190348 ) ) ( not ( = ?auto_190346 ?auto_190349 ) ) ( not ( = ?auto_190347 ?auto_190348 ) ) ( not ( = ?auto_190347 ?auto_190349 ) ) ( not ( = ?auto_190348 ?auto_190349 ) ) ( ON ?auto_190349 ?auto_190354 ) ( not ( = ?auto_190346 ?auto_190354 ) ) ( not ( = ?auto_190347 ?auto_190354 ) ) ( not ( = ?auto_190348 ?auto_190354 ) ) ( not ( = ?auto_190349 ?auto_190354 ) ) ( ON ?auto_190348 ?auto_190349 ) ( ON-TABLE ?auto_190352 ) ( ON ?auto_190350 ?auto_190352 ) ( ON ?auto_190351 ?auto_190350 ) ( ON ?auto_190354 ?auto_190351 ) ( not ( = ?auto_190352 ?auto_190350 ) ) ( not ( = ?auto_190352 ?auto_190351 ) ) ( not ( = ?auto_190352 ?auto_190354 ) ) ( not ( = ?auto_190352 ?auto_190349 ) ) ( not ( = ?auto_190352 ?auto_190348 ) ) ( not ( = ?auto_190350 ?auto_190351 ) ) ( not ( = ?auto_190350 ?auto_190354 ) ) ( not ( = ?auto_190350 ?auto_190349 ) ) ( not ( = ?auto_190350 ?auto_190348 ) ) ( not ( = ?auto_190351 ?auto_190354 ) ) ( not ( = ?auto_190351 ?auto_190349 ) ) ( not ( = ?auto_190351 ?auto_190348 ) ) ( not ( = ?auto_190346 ?auto_190352 ) ) ( not ( = ?auto_190346 ?auto_190350 ) ) ( not ( = ?auto_190346 ?auto_190351 ) ) ( not ( = ?auto_190347 ?auto_190352 ) ) ( not ( = ?auto_190347 ?auto_190350 ) ) ( not ( = ?auto_190347 ?auto_190351 ) ) ( ON ?auto_190346 ?auto_190353 ) ( not ( = ?auto_190346 ?auto_190353 ) ) ( not ( = ?auto_190347 ?auto_190353 ) ) ( not ( = ?auto_190348 ?auto_190353 ) ) ( not ( = ?auto_190349 ?auto_190353 ) ) ( not ( = ?auto_190354 ?auto_190353 ) ) ( not ( = ?auto_190352 ?auto_190353 ) ) ( not ( = ?auto_190350 ?auto_190353 ) ) ( not ( = ?auto_190351 ?auto_190353 ) ) ( CLEAR ?auto_190348 ) ( ON ?auto_190347 ?auto_190346 ) ( CLEAR ?auto_190347 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190353 ?auto_190346 )
      ( MAKE-4PILE ?auto_190346 ?auto_190347 ?auto_190348 ?auto_190349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190355 - BLOCK
      ?auto_190356 - BLOCK
      ?auto_190357 - BLOCK
      ?auto_190358 - BLOCK
    )
    :vars
    (
      ?auto_190360 - BLOCK
      ?auto_190361 - BLOCK
      ?auto_190359 - BLOCK
      ?auto_190363 - BLOCK
      ?auto_190362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190355 ?auto_190356 ) ) ( not ( = ?auto_190355 ?auto_190357 ) ) ( not ( = ?auto_190355 ?auto_190358 ) ) ( not ( = ?auto_190356 ?auto_190357 ) ) ( not ( = ?auto_190356 ?auto_190358 ) ) ( not ( = ?auto_190357 ?auto_190358 ) ) ( ON ?auto_190358 ?auto_190360 ) ( not ( = ?auto_190355 ?auto_190360 ) ) ( not ( = ?auto_190356 ?auto_190360 ) ) ( not ( = ?auto_190357 ?auto_190360 ) ) ( not ( = ?auto_190358 ?auto_190360 ) ) ( ON-TABLE ?auto_190361 ) ( ON ?auto_190359 ?auto_190361 ) ( ON ?auto_190363 ?auto_190359 ) ( ON ?auto_190360 ?auto_190363 ) ( not ( = ?auto_190361 ?auto_190359 ) ) ( not ( = ?auto_190361 ?auto_190363 ) ) ( not ( = ?auto_190361 ?auto_190360 ) ) ( not ( = ?auto_190361 ?auto_190358 ) ) ( not ( = ?auto_190361 ?auto_190357 ) ) ( not ( = ?auto_190359 ?auto_190363 ) ) ( not ( = ?auto_190359 ?auto_190360 ) ) ( not ( = ?auto_190359 ?auto_190358 ) ) ( not ( = ?auto_190359 ?auto_190357 ) ) ( not ( = ?auto_190363 ?auto_190360 ) ) ( not ( = ?auto_190363 ?auto_190358 ) ) ( not ( = ?auto_190363 ?auto_190357 ) ) ( not ( = ?auto_190355 ?auto_190361 ) ) ( not ( = ?auto_190355 ?auto_190359 ) ) ( not ( = ?auto_190355 ?auto_190363 ) ) ( not ( = ?auto_190356 ?auto_190361 ) ) ( not ( = ?auto_190356 ?auto_190359 ) ) ( not ( = ?auto_190356 ?auto_190363 ) ) ( ON ?auto_190355 ?auto_190362 ) ( not ( = ?auto_190355 ?auto_190362 ) ) ( not ( = ?auto_190356 ?auto_190362 ) ) ( not ( = ?auto_190357 ?auto_190362 ) ) ( not ( = ?auto_190358 ?auto_190362 ) ) ( not ( = ?auto_190360 ?auto_190362 ) ) ( not ( = ?auto_190361 ?auto_190362 ) ) ( not ( = ?auto_190359 ?auto_190362 ) ) ( not ( = ?auto_190363 ?auto_190362 ) ) ( ON ?auto_190356 ?auto_190355 ) ( CLEAR ?auto_190356 ) ( ON-TABLE ?auto_190362 ) ( HOLDING ?auto_190357 ) ( CLEAR ?auto_190358 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190361 ?auto_190359 ?auto_190363 ?auto_190360 ?auto_190358 ?auto_190357 )
      ( MAKE-4PILE ?auto_190355 ?auto_190356 ?auto_190357 ?auto_190358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190364 - BLOCK
      ?auto_190365 - BLOCK
      ?auto_190366 - BLOCK
      ?auto_190367 - BLOCK
    )
    :vars
    (
      ?auto_190370 - BLOCK
      ?auto_190371 - BLOCK
      ?auto_190369 - BLOCK
      ?auto_190372 - BLOCK
      ?auto_190368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190364 ?auto_190365 ) ) ( not ( = ?auto_190364 ?auto_190366 ) ) ( not ( = ?auto_190364 ?auto_190367 ) ) ( not ( = ?auto_190365 ?auto_190366 ) ) ( not ( = ?auto_190365 ?auto_190367 ) ) ( not ( = ?auto_190366 ?auto_190367 ) ) ( ON ?auto_190367 ?auto_190370 ) ( not ( = ?auto_190364 ?auto_190370 ) ) ( not ( = ?auto_190365 ?auto_190370 ) ) ( not ( = ?auto_190366 ?auto_190370 ) ) ( not ( = ?auto_190367 ?auto_190370 ) ) ( ON-TABLE ?auto_190371 ) ( ON ?auto_190369 ?auto_190371 ) ( ON ?auto_190372 ?auto_190369 ) ( ON ?auto_190370 ?auto_190372 ) ( not ( = ?auto_190371 ?auto_190369 ) ) ( not ( = ?auto_190371 ?auto_190372 ) ) ( not ( = ?auto_190371 ?auto_190370 ) ) ( not ( = ?auto_190371 ?auto_190367 ) ) ( not ( = ?auto_190371 ?auto_190366 ) ) ( not ( = ?auto_190369 ?auto_190372 ) ) ( not ( = ?auto_190369 ?auto_190370 ) ) ( not ( = ?auto_190369 ?auto_190367 ) ) ( not ( = ?auto_190369 ?auto_190366 ) ) ( not ( = ?auto_190372 ?auto_190370 ) ) ( not ( = ?auto_190372 ?auto_190367 ) ) ( not ( = ?auto_190372 ?auto_190366 ) ) ( not ( = ?auto_190364 ?auto_190371 ) ) ( not ( = ?auto_190364 ?auto_190369 ) ) ( not ( = ?auto_190364 ?auto_190372 ) ) ( not ( = ?auto_190365 ?auto_190371 ) ) ( not ( = ?auto_190365 ?auto_190369 ) ) ( not ( = ?auto_190365 ?auto_190372 ) ) ( ON ?auto_190364 ?auto_190368 ) ( not ( = ?auto_190364 ?auto_190368 ) ) ( not ( = ?auto_190365 ?auto_190368 ) ) ( not ( = ?auto_190366 ?auto_190368 ) ) ( not ( = ?auto_190367 ?auto_190368 ) ) ( not ( = ?auto_190370 ?auto_190368 ) ) ( not ( = ?auto_190371 ?auto_190368 ) ) ( not ( = ?auto_190369 ?auto_190368 ) ) ( not ( = ?auto_190372 ?auto_190368 ) ) ( ON ?auto_190365 ?auto_190364 ) ( ON-TABLE ?auto_190368 ) ( CLEAR ?auto_190367 ) ( ON ?auto_190366 ?auto_190365 ) ( CLEAR ?auto_190366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190368 ?auto_190364 ?auto_190365 )
      ( MAKE-4PILE ?auto_190364 ?auto_190365 ?auto_190366 ?auto_190367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190373 - BLOCK
      ?auto_190374 - BLOCK
      ?auto_190375 - BLOCK
      ?auto_190376 - BLOCK
    )
    :vars
    (
      ?auto_190378 - BLOCK
      ?auto_190379 - BLOCK
      ?auto_190381 - BLOCK
      ?auto_190380 - BLOCK
      ?auto_190377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190373 ?auto_190374 ) ) ( not ( = ?auto_190373 ?auto_190375 ) ) ( not ( = ?auto_190373 ?auto_190376 ) ) ( not ( = ?auto_190374 ?auto_190375 ) ) ( not ( = ?auto_190374 ?auto_190376 ) ) ( not ( = ?auto_190375 ?auto_190376 ) ) ( not ( = ?auto_190373 ?auto_190378 ) ) ( not ( = ?auto_190374 ?auto_190378 ) ) ( not ( = ?auto_190375 ?auto_190378 ) ) ( not ( = ?auto_190376 ?auto_190378 ) ) ( ON-TABLE ?auto_190379 ) ( ON ?auto_190381 ?auto_190379 ) ( ON ?auto_190380 ?auto_190381 ) ( ON ?auto_190378 ?auto_190380 ) ( not ( = ?auto_190379 ?auto_190381 ) ) ( not ( = ?auto_190379 ?auto_190380 ) ) ( not ( = ?auto_190379 ?auto_190378 ) ) ( not ( = ?auto_190379 ?auto_190376 ) ) ( not ( = ?auto_190379 ?auto_190375 ) ) ( not ( = ?auto_190381 ?auto_190380 ) ) ( not ( = ?auto_190381 ?auto_190378 ) ) ( not ( = ?auto_190381 ?auto_190376 ) ) ( not ( = ?auto_190381 ?auto_190375 ) ) ( not ( = ?auto_190380 ?auto_190378 ) ) ( not ( = ?auto_190380 ?auto_190376 ) ) ( not ( = ?auto_190380 ?auto_190375 ) ) ( not ( = ?auto_190373 ?auto_190379 ) ) ( not ( = ?auto_190373 ?auto_190381 ) ) ( not ( = ?auto_190373 ?auto_190380 ) ) ( not ( = ?auto_190374 ?auto_190379 ) ) ( not ( = ?auto_190374 ?auto_190381 ) ) ( not ( = ?auto_190374 ?auto_190380 ) ) ( ON ?auto_190373 ?auto_190377 ) ( not ( = ?auto_190373 ?auto_190377 ) ) ( not ( = ?auto_190374 ?auto_190377 ) ) ( not ( = ?auto_190375 ?auto_190377 ) ) ( not ( = ?auto_190376 ?auto_190377 ) ) ( not ( = ?auto_190378 ?auto_190377 ) ) ( not ( = ?auto_190379 ?auto_190377 ) ) ( not ( = ?auto_190381 ?auto_190377 ) ) ( not ( = ?auto_190380 ?auto_190377 ) ) ( ON ?auto_190374 ?auto_190373 ) ( ON-TABLE ?auto_190377 ) ( ON ?auto_190375 ?auto_190374 ) ( CLEAR ?auto_190375 ) ( HOLDING ?auto_190376 ) ( CLEAR ?auto_190378 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190379 ?auto_190381 ?auto_190380 ?auto_190378 ?auto_190376 )
      ( MAKE-4PILE ?auto_190373 ?auto_190374 ?auto_190375 ?auto_190376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190382 - BLOCK
      ?auto_190383 - BLOCK
      ?auto_190384 - BLOCK
      ?auto_190385 - BLOCK
    )
    :vars
    (
      ?auto_190387 - BLOCK
      ?auto_190389 - BLOCK
      ?auto_190390 - BLOCK
      ?auto_190386 - BLOCK
      ?auto_190388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190382 ?auto_190383 ) ) ( not ( = ?auto_190382 ?auto_190384 ) ) ( not ( = ?auto_190382 ?auto_190385 ) ) ( not ( = ?auto_190383 ?auto_190384 ) ) ( not ( = ?auto_190383 ?auto_190385 ) ) ( not ( = ?auto_190384 ?auto_190385 ) ) ( not ( = ?auto_190382 ?auto_190387 ) ) ( not ( = ?auto_190383 ?auto_190387 ) ) ( not ( = ?auto_190384 ?auto_190387 ) ) ( not ( = ?auto_190385 ?auto_190387 ) ) ( ON-TABLE ?auto_190389 ) ( ON ?auto_190390 ?auto_190389 ) ( ON ?auto_190386 ?auto_190390 ) ( ON ?auto_190387 ?auto_190386 ) ( not ( = ?auto_190389 ?auto_190390 ) ) ( not ( = ?auto_190389 ?auto_190386 ) ) ( not ( = ?auto_190389 ?auto_190387 ) ) ( not ( = ?auto_190389 ?auto_190385 ) ) ( not ( = ?auto_190389 ?auto_190384 ) ) ( not ( = ?auto_190390 ?auto_190386 ) ) ( not ( = ?auto_190390 ?auto_190387 ) ) ( not ( = ?auto_190390 ?auto_190385 ) ) ( not ( = ?auto_190390 ?auto_190384 ) ) ( not ( = ?auto_190386 ?auto_190387 ) ) ( not ( = ?auto_190386 ?auto_190385 ) ) ( not ( = ?auto_190386 ?auto_190384 ) ) ( not ( = ?auto_190382 ?auto_190389 ) ) ( not ( = ?auto_190382 ?auto_190390 ) ) ( not ( = ?auto_190382 ?auto_190386 ) ) ( not ( = ?auto_190383 ?auto_190389 ) ) ( not ( = ?auto_190383 ?auto_190390 ) ) ( not ( = ?auto_190383 ?auto_190386 ) ) ( ON ?auto_190382 ?auto_190388 ) ( not ( = ?auto_190382 ?auto_190388 ) ) ( not ( = ?auto_190383 ?auto_190388 ) ) ( not ( = ?auto_190384 ?auto_190388 ) ) ( not ( = ?auto_190385 ?auto_190388 ) ) ( not ( = ?auto_190387 ?auto_190388 ) ) ( not ( = ?auto_190389 ?auto_190388 ) ) ( not ( = ?auto_190390 ?auto_190388 ) ) ( not ( = ?auto_190386 ?auto_190388 ) ) ( ON ?auto_190383 ?auto_190382 ) ( ON-TABLE ?auto_190388 ) ( ON ?auto_190384 ?auto_190383 ) ( CLEAR ?auto_190387 ) ( ON ?auto_190385 ?auto_190384 ) ( CLEAR ?auto_190385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190388 ?auto_190382 ?auto_190383 ?auto_190384 )
      ( MAKE-4PILE ?auto_190382 ?auto_190383 ?auto_190384 ?auto_190385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190391 - BLOCK
      ?auto_190392 - BLOCK
      ?auto_190393 - BLOCK
      ?auto_190394 - BLOCK
    )
    :vars
    (
      ?auto_190397 - BLOCK
      ?auto_190396 - BLOCK
      ?auto_190399 - BLOCK
      ?auto_190398 - BLOCK
      ?auto_190395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190391 ?auto_190392 ) ) ( not ( = ?auto_190391 ?auto_190393 ) ) ( not ( = ?auto_190391 ?auto_190394 ) ) ( not ( = ?auto_190392 ?auto_190393 ) ) ( not ( = ?auto_190392 ?auto_190394 ) ) ( not ( = ?auto_190393 ?auto_190394 ) ) ( not ( = ?auto_190391 ?auto_190397 ) ) ( not ( = ?auto_190392 ?auto_190397 ) ) ( not ( = ?auto_190393 ?auto_190397 ) ) ( not ( = ?auto_190394 ?auto_190397 ) ) ( ON-TABLE ?auto_190396 ) ( ON ?auto_190399 ?auto_190396 ) ( ON ?auto_190398 ?auto_190399 ) ( not ( = ?auto_190396 ?auto_190399 ) ) ( not ( = ?auto_190396 ?auto_190398 ) ) ( not ( = ?auto_190396 ?auto_190397 ) ) ( not ( = ?auto_190396 ?auto_190394 ) ) ( not ( = ?auto_190396 ?auto_190393 ) ) ( not ( = ?auto_190399 ?auto_190398 ) ) ( not ( = ?auto_190399 ?auto_190397 ) ) ( not ( = ?auto_190399 ?auto_190394 ) ) ( not ( = ?auto_190399 ?auto_190393 ) ) ( not ( = ?auto_190398 ?auto_190397 ) ) ( not ( = ?auto_190398 ?auto_190394 ) ) ( not ( = ?auto_190398 ?auto_190393 ) ) ( not ( = ?auto_190391 ?auto_190396 ) ) ( not ( = ?auto_190391 ?auto_190399 ) ) ( not ( = ?auto_190391 ?auto_190398 ) ) ( not ( = ?auto_190392 ?auto_190396 ) ) ( not ( = ?auto_190392 ?auto_190399 ) ) ( not ( = ?auto_190392 ?auto_190398 ) ) ( ON ?auto_190391 ?auto_190395 ) ( not ( = ?auto_190391 ?auto_190395 ) ) ( not ( = ?auto_190392 ?auto_190395 ) ) ( not ( = ?auto_190393 ?auto_190395 ) ) ( not ( = ?auto_190394 ?auto_190395 ) ) ( not ( = ?auto_190397 ?auto_190395 ) ) ( not ( = ?auto_190396 ?auto_190395 ) ) ( not ( = ?auto_190399 ?auto_190395 ) ) ( not ( = ?auto_190398 ?auto_190395 ) ) ( ON ?auto_190392 ?auto_190391 ) ( ON-TABLE ?auto_190395 ) ( ON ?auto_190393 ?auto_190392 ) ( ON ?auto_190394 ?auto_190393 ) ( CLEAR ?auto_190394 ) ( HOLDING ?auto_190397 ) ( CLEAR ?auto_190398 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190396 ?auto_190399 ?auto_190398 ?auto_190397 )
      ( MAKE-4PILE ?auto_190391 ?auto_190392 ?auto_190393 ?auto_190394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190400 - BLOCK
      ?auto_190401 - BLOCK
      ?auto_190402 - BLOCK
      ?auto_190403 - BLOCK
    )
    :vars
    (
      ?auto_190405 - BLOCK
      ?auto_190408 - BLOCK
      ?auto_190404 - BLOCK
      ?auto_190407 - BLOCK
      ?auto_190406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190400 ?auto_190401 ) ) ( not ( = ?auto_190400 ?auto_190402 ) ) ( not ( = ?auto_190400 ?auto_190403 ) ) ( not ( = ?auto_190401 ?auto_190402 ) ) ( not ( = ?auto_190401 ?auto_190403 ) ) ( not ( = ?auto_190402 ?auto_190403 ) ) ( not ( = ?auto_190400 ?auto_190405 ) ) ( not ( = ?auto_190401 ?auto_190405 ) ) ( not ( = ?auto_190402 ?auto_190405 ) ) ( not ( = ?auto_190403 ?auto_190405 ) ) ( ON-TABLE ?auto_190408 ) ( ON ?auto_190404 ?auto_190408 ) ( ON ?auto_190407 ?auto_190404 ) ( not ( = ?auto_190408 ?auto_190404 ) ) ( not ( = ?auto_190408 ?auto_190407 ) ) ( not ( = ?auto_190408 ?auto_190405 ) ) ( not ( = ?auto_190408 ?auto_190403 ) ) ( not ( = ?auto_190408 ?auto_190402 ) ) ( not ( = ?auto_190404 ?auto_190407 ) ) ( not ( = ?auto_190404 ?auto_190405 ) ) ( not ( = ?auto_190404 ?auto_190403 ) ) ( not ( = ?auto_190404 ?auto_190402 ) ) ( not ( = ?auto_190407 ?auto_190405 ) ) ( not ( = ?auto_190407 ?auto_190403 ) ) ( not ( = ?auto_190407 ?auto_190402 ) ) ( not ( = ?auto_190400 ?auto_190408 ) ) ( not ( = ?auto_190400 ?auto_190404 ) ) ( not ( = ?auto_190400 ?auto_190407 ) ) ( not ( = ?auto_190401 ?auto_190408 ) ) ( not ( = ?auto_190401 ?auto_190404 ) ) ( not ( = ?auto_190401 ?auto_190407 ) ) ( ON ?auto_190400 ?auto_190406 ) ( not ( = ?auto_190400 ?auto_190406 ) ) ( not ( = ?auto_190401 ?auto_190406 ) ) ( not ( = ?auto_190402 ?auto_190406 ) ) ( not ( = ?auto_190403 ?auto_190406 ) ) ( not ( = ?auto_190405 ?auto_190406 ) ) ( not ( = ?auto_190408 ?auto_190406 ) ) ( not ( = ?auto_190404 ?auto_190406 ) ) ( not ( = ?auto_190407 ?auto_190406 ) ) ( ON ?auto_190401 ?auto_190400 ) ( ON-TABLE ?auto_190406 ) ( ON ?auto_190402 ?auto_190401 ) ( ON ?auto_190403 ?auto_190402 ) ( CLEAR ?auto_190407 ) ( ON ?auto_190405 ?auto_190403 ) ( CLEAR ?auto_190405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190406 ?auto_190400 ?auto_190401 ?auto_190402 ?auto_190403 )
      ( MAKE-4PILE ?auto_190400 ?auto_190401 ?auto_190402 ?auto_190403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190409 - BLOCK
      ?auto_190410 - BLOCK
      ?auto_190411 - BLOCK
      ?auto_190412 - BLOCK
    )
    :vars
    (
      ?auto_190413 - BLOCK
      ?auto_190416 - BLOCK
      ?auto_190414 - BLOCK
      ?auto_190417 - BLOCK
      ?auto_190415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190409 ?auto_190410 ) ) ( not ( = ?auto_190409 ?auto_190411 ) ) ( not ( = ?auto_190409 ?auto_190412 ) ) ( not ( = ?auto_190410 ?auto_190411 ) ) ( not ( = ?auto_190410 ?auto_190412 ) ) ( not ( = ?auto_190411 ?auto_190412 ) ) ( not ( = ?auto_190409 ?auto_190413 ) ) ( not ( = ?auto_190410 ?auto_190413 ) ) ( not ( = ?auto_190411 ?auto_190413 ) ) ( not ( = ?auto_190412 ?auto_190413 ) ) ( ON-TABLE ?auto_190416 ) ( ON ?auto_190414 ?auto_190416 ) ( not ( = ?auto_190416 ?auto_190414 ) ) ( not ( = ?auto_190416 ?auto_190417 ) ) ( not ( = ?auto_190416 ?auto_190413 ) ) ( not ( = ?auto_190416 ?auto_190412 ) ) ( not ( = ?auto_190416 ?auto_190411 ) ) ( not ( = ?auto_190414 ?auto_190417 ) ) ( not ( = ?auto_190414 ?auto_190413 ) ) ( not ( = ?auto_190414 ?auto_190412 ) ) ( not ( = ?auto_190414 ?auto_190411 ) ) ( not ( = ?auto_190417 ?auto_190413 ) ) ( not ( = ?auto_190417 ?auto_190412 ) ) ( not ( = ?auto_190417 ?auto_190411 ) ) ( not ( = ?auto_190409 ?auto_190416 ) ) ( not ( = ?auto_190409 ?auto_190414 ) ) ( not ( = ?auto_190409 ?auto_190417 ) ) ( not ( = ?auto_190410 ?auto_190416 ) ) ( not ( = ?auto_190410 ?auto_190414 ) ) ( not ( = ?auto_190410 ?auto_190417 ) ) ( ON ?auto_190409 ?auto_190415 ) ( not ( = ?auto_190409 ?auto_190415 ) ) ( not ( = ?auto_190410 ?auto_190415 ) ) ( not ( = ?auto_190411 ?auto_190415 ) ) ( not ( = ?auto_190412 ?auto_190415 ) ) ( not ( = ?auto_190413 ?auto_190415 ) ) ( not ( = ?auto_190416 ?auto_190415 ) ) ( not ( = ?auto_190414 ?auto_190415 ) ) ( not ( = ?auto_190417 ?auto_190415 ) ) ( ON ?auto_190410 ?auto_190409 ) ( ON-TABLE ?auto_190415 ) ( ON ?auto_190411 ?auto_190410 ) ( ON ?auto_190412 ?auto_190411 ) ( ON ?auto_190413 ?auto_190412 ) ( CLEAR ?auto_190413 ) ( HOLDING ?auto_190417 ) ( CLEAR ?auto_190414 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190416 ?auto_190414 ?auto_190417 )
      ( MAKE-4PILE ?auto_190409 ?auto_190410 ?auto_190411 ?auto_190412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190418 - BLOCK
      ?auto_190419 - BLOCK
      ?auto_190420 - BLOCK
      ?auto_190421 - BLOCK
    )
    :vars
    (
      ?auto_190426 - BLOCK
      ?auto_190423 - BLOCK
      ?auto_190424 - BLOCK
      ?auto_190425 - BLOCK
      ?auto_190422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190418 ?auto_190419 ) ) ( not ( = ?auto_190418 ?auto_190420 ) ) ( not ( = ?auto_190418 ?auto_190421 ) ) ( not ( = ?auto_190419 ?auto_190420 ) ) ( not ( = ?auto_190419 ?auto_190421 ) ) ( not ( = ?auto_190420 ?auto_190421 ) ) ( not ( = ?auto_190418 ?auto_190426 ) ) ( not ( = ?auto_190419 ?auto_190426 ) ) ( not ( = ?auto_190420 ?auto_190426 ) ) ( not ( = ?auto_190421 ?auto_190426 ) ) ( ON-TABLE ?auto_190423 ) ( ON ?auto_190424 ?auto_190423 ) ( not ( = ?auto_190423 ?auto_190424 ) ) ( not ( = ?auto_190423 ?auto_190425 ) ) ( not ( = ?auto_190423 ?auto_190426 ) ) ( not ( = ?auto_190423 ?auto_190421 ) ) ( not ( = ?auto_190423 ?auto_190420 ) ) ( not ( = ?auto_190424 ?auto_190425 ) ) ( not ( = ?auto_190424 ?auto_190426 ) ) ( not ( = ?auto_190424 ?auto_190421 ) ) ( not ( = ?auto_190424 ?auto_190420 ) ) ( not ( = ?auto_190425 ?auto_190426 ) ) ( not ( = ?auto_190425 ?auto_190421 ) ) ( not ( = ?auto_190425 ?auto_190420 ) ) ( not ( = ?auto_190418 ?auto_190423 ) ) ( not ( = ?auto_190418 ?auto_190424 ) ) ( not ( = ?auto_190418 ?auto_190425 ) ) ( not ( = ?auto_190419 ?auto_190423 ) ) ( not ( = ?auto_190419 ?auto_190424 ) ) ( not ( = ?auto_190419 ?auto_190425 ) ) ( ON ?auto_190418 ?auto_190422 ) ( not ( = ?auto_190418 ?auto_190422 ) ) ( not ( = ?auto_190419 ?auto_190422 ) ) ( not ( = ?auto_190420 ?auto_190422 ) ) ( not ( = ?auto_190421 ?auto_190422 ) ) ( not ( = ?auto_190426 ?auto_190422 ) ) ( not ( = ?auto_190423 ?auto_190422 ) ) ( not ( = ?auto_190424 ?auto_190422 ) ) ( not ( = ?auto_190425 ?auto_190422 ) ) ( ON ?auto_190419 ?auto_190418 ) ( ON-TABLE ?auto_190422 ) ( ON ?auto_190420 ?auto_190419 ) ( ON ?auto_190421 ?auto_190420 ) ( ON ?auto_190426 ?auto_190421 ) ( CLEAR ?auto_190424 ) ( ON ?auto_190425 ?auto_190426 ) ( CLEAR ?auto_190425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190422 ?auto_190418 ?auto_190419 ?auto_190420 ?auto_190421 ?auto_190426 )
      ( MAKE-4PILE ?auto_190418 ?auto_190419 ?auto_190420 ?auto_190421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190427 - BLOCK
      ?auto_190428 - BLOCK
      ?auto_190429 - BLOCK
      ?auto_190430 - BLOCK
    )
    :vars
    (
      ?auto_190431 - BLOCK
      ?auto_190433 - BLOCK
      ?auto_190432 - BLOCK
      ?auto_190434 - BLOCK
      ?auto_190435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190427 ?auto_190428 ) ) ( not ( = ?auto_190427 ?auto_190429 ) ) ( not ( = ?auto_190427 ?auto_190430 ) ) ( not ( = ?auto_190428 ?auto_190429 ) ) ( not ( = ?auto_190428 ?auto_190430 ) ) ( not ( = ?auto_190429 ?auto_190430 ) ) ( not ( = ?auto_190427 ?auto_190431 ) ) ( not ( = ?auto_190428 ?auto_190431 ) ) ( not ( = ?auto_190429 ?auto_190431 ) ) ( not ( = ?auto_190430 ?auto_190431 ) ) ( ON-TABLE ?auto_190433 ) ( not ( = ?auto_190433 ?auto_190432 ) ) ( not ( = ?auto_190433 ?auto_190434 ) ) ( not ( = ?auto_190433 ?auto_190431 ) ) ( not ( = ?auto_190433 ?auto_190430 ) ) ( not ( = ?auto_190433 ?auto_190429 ) ) ( not ( = ?auto_190432 ?auto_190434 ) ) ( not ( = ?auto_190432 ?auto_190431 ) ) ( not ( = ?auto_190432 ?auto_190430 ) ) ( not ( = ?auto_190432 ?auto_190429 ) ) ( not ( = ?auto_190434 ?auto_190431 ) ) ( not ( = ?auto_190434 ?auto_190430 ) ) ( not ( = ?auto_190434 ?auto_190429 ) ) ( not ( = ?auto_190427 ?auto_190433 ) ) ( not ( = ?auto_190427 ?auto_190432 ) ) ( not ( = ?auto_190427 ?auto_190434 ) ) ( not ( = ?auto_190428 ?auto_190433 ) ) ( not ( = ?auto_190428 ?auto_190432 ) ) ( not ( = ?auto_190428 ?auto_190434 ) ) ( ON ?auto_190427 ?auto_190435 ) ( not ( = ?auto_190427 ?auto_190435 ) ) ( not ( = ?auto_190428 ?auto_190435 ) ) ( not ( = ?auto_190429 ?auto_190435 ) ) ( not ( = ?auto_190430 ?auto_190435 ) ) ( not ( = ?auto_190431 ?auto_190435 ) ) ( not ( = ?auto_190433 ?auto_190435 ) ) ( not ( = ?auto_190432 ?auto_190435 ) ) ( not ( = ?auto_190434 ?auto_190435 ) ) ( ON ?auto_190428 ?auto_190427 ) ( ON-TABLE ?auto_190435 ) ( ON ?auto_190429 ?auto_190428 ) ( ON ?auto_190430 ?auto_190429 ) ( ON ?auto_190431 ?auto_190430 ) ( ON ?auto_190434 ?auto_190431 ) ( CLEAR ?auto_190434 ) ( HOLDING ?auto_190432 ) ( CLEAR ?auto_190433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190433 ?auto_190432 )
      ( MAKE-4PILE ?auto_190427 ?auto_190428 ?auto_190429 ?auto_190430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190436 - BLOCK
      ?auto_190437 - BLOCK
      ?auto_190438 - BLOCK
      ?auto_190439 - BLOCK
    )
    :vars
    (
      ?auto_190443 - BLOCK
      ?auto_190442 - BLOCK
      ?auto_190444 - BLOCK
      ?auto_190440 - BLOCK
      ?auto_190441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190436 ?auto_190437 ) ) ( not ( = ?auto_190436 ?auto_190438 ) ) ( not ( = ?auto_190436 ?auto_190439 ) ) ( not ( = ?auto_190437 ?auto_190438 ) ) ( not ( = ?auto_190437 ?auto_190439 ) ) ( not ( = ?auto_190438 ?auto_190439 ) ) ( not ( = ?auto_190436 ?auto_190443 ) ) ( not ( = ?auto_190437 ?auto_190443 ) ) ( not ( = ?auto_190438 ?auto_190443 ) ) ( not ( = ?auto_190439 ?auto_190443 ) ) ( ON-TABLE ?auto_190442 ) ( not ( = ?auto_190442 ?auto_190444 ) ) ( not ( = ?auto_190442 ?auto_190440 ) ) ( not ( = ?auto_190442 ?auto_190443 ) ) ( not ( = ?auto_190442 ?auto_190439 ) ) ( not ( = ?auto_190442 ?auto_190438 ) ) ( not ( = ?auto_190444 ?auto_190440 ) ) ( not ( = ?auto_190444 ?auto_190443 ) ) ( not ( = ?auto_190444 ?auto_190439 ) ) ( not ( = ?auto_190444 ?auto_190438 ) ) ( not ( = ?auto_190440 ?auto_190443 ) ) ( not ( = ?auto_190440 ?auto_190439 ) ) ( not ( = ?auto_190440 ?auto_190438 ) ) ( not ( = ?auto_190436 ?auto_190442 ) ) ( not ( = ?auto_190436 ?auto_190444 ) ) ( not ( = ?auto_190436 ?auto_190440 ) ) ( not ( = ?auto_190437 ?auto_190442 ) ) ( not ( = ?auto_190437 ?auto_190444 ) ) ( not ( = ?auto_190437 ?auto_190440 ) ) ( ON ?auto_190436 ?auto_190441 ) ( not ( = ?auto_190436 ?auto_190441 ) ) ( not ( = ?auto_190437 ?auto_190441 ) ) ( not ( = ?auto_190438 ?auto_190441 ) ) ( not ( = ?auto_190439 ?auto_190441 ) ) ( not ( = ?auto_190443 ?auto_190441 ) ) ( not ( = ?auto_190442 ?auto_190441 ) ) ( not ( = ?auto_190444 ?auto_190441 ) ) ( not ( = ?auto_190440 ?auto_190441 ) ) ( ON ?auto_190437 ?auto_190436 ) ( ON-TABLE ?auto_190441 ) ( ON ?auto_190438 ?auto_190437 ) ( ON ?auto_190439 ?auto_190438 ) ( ON ?auto_190443 ?auto_190439 ) ( ON ?auto_190440 ?auto_190443 ) ( CLEAR ?auto_190442 ) ( ON ?auto_190444 ?auto_190440 ) ( CLEAR ?auto_190444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190441 ?auto_190436 ?auto_190437 ?auto_190438 ?auto_190439 ?auto_190443 ?auto_190440 )
      ( MAKE-4PILE ?auto_190436 ?auto_190437 ?auto_190438 ?auto_190439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190445 - BLOCK
      ?auto_190446 - BLOCK
      ?auto_190447 - BLOCK
      ?auto_190448 - BLOCK
    )
    :vars
    (
      ?auto_190450 - BLOCK
      ?auto_190453 - BLOCK
      ?auto_190449 - BLOCK
      ?auto_190451 - BLOCK
      ?auto_190452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190445 ?auto_190446 ) ) ( not ( = ?auto_190445 ?auto_190447 ) ) ( not ( = ?auto_190445 ?auto_190448 ) ) ( not ( = ?auto_190446 ?auto_190447 ) ) ( not ( = ?auto_190446 ?auto_190448 ) ) ( not ( = ?auto_190447 ?auto_190448 ) ) ( not ( = ?auto_190445 ?auto_190450 ) ) ( not ( = ?auto_190446 ?auto_190450 ) ) ( not ( = ?auto_190447 ?auto_190450 ) ) ( not ( = ?auto_190448 ?auto_190450 ) ) ( not ( = ?auto_190453 ?auto_190449 ) ) ( not ( = ?auto_190453 ?auto_190451 ) ) ( not ( = ?auto_190453 ?auto_190450 ) ) ( not ( = ?auto_190453 ?auto_190448 ) ) ( not ( = ?auto_190453 ?auto_190447 ) ) ( not ( = ?auto_190449 ?auto_190451 ) ) ( not ( = ?auto_190449 ?auto_190450 ) ) ( not ( = ?auto_190449 ?auto_190448 ) ) ( not ( = ?auto_190449 ?auto_190447 ) ) ( not ( = ?auto_190451 ?auto_190450 ) ) ( not ( = ?auto_190451 ?auto_190448 ) ) ( not ( = ?auto_190451 ?auto_190447 ) ) ( not ( = ?auto_190445 ?auto_190453 ) ) ( not ( = ?auto_190445 ?auto_190449 ) ) ( not ( = ?auto_190445 ?auto_190451 ) ) ( not ( = ?auto_190446 ?auto_190453 ) ) ( not ( = ?auto_190446 ?auto_190449 ) ) ( not ( = ?auto_190446 ?auto_190451 ) ) ( ON ?auto_190445 ?auto_190452 ) ( not ( = ?auto_190445 ?auto_190452 ) ) ( not ( = ?auto_190446 ?auto_190452 ) ) ( not ( = ?auto_190447 ?auto_190452 ) ) ( not ( = ?auto_190448 ?auto_190452 ) ) ( not ( = ?auto_190450 ?auto_190452 ) ) ( not ( = ?auto_190453 ?auto_190452 ) ) ( not ( = ?auto_190449 ?auto_190452 ) ) ( not ( = ?auto_190451 ?auto_190452 ) ) ( ON ?auto_190446 ?auto_190445 ) ( ON-TABLE ?auto_190452 ) ( ON ?auto_190447 ?auto_190446 ) ( ON ?auto_190448 ?auto_190447 ) ( ON ?auto_190450 ?auto_190448 ) ( ON ?auto_190451 ?auto_190450 ) ( ON ?auto_190449 ?auto_190451 ) ( CLEAR ?auto_190449 ) ( HOLDING ?auto_190453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190453 )
      ( MAKE-4PILE ?auto_190445 ?auto_190446 ?auto_190447 ?auto_190448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190454 - BLOCK
      ?auto_190455 - BLOCK
      ?auto_190456 - BLOCK
      ?auto_190457 - BLOCK
    )
    :vars
    (
      ?auto_190458 - BLOCK
      ?auto_190460 - BLOCK
      ?auto_190461 - BLOCK
      ?auto_190459 - BLOCK
      ?auto_190462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190454 ?auto_190455 ) ) ( not ( = ?auto_190454 ?auto_190456 ) ) ( not ( = ?auto_190454 ?auto_190457 ) ) ( not ( = ?auto_190455 ?auto_190456 ) ) ( not ( = ?auto_190455 ?auto_190457 ) ) ( not ( = ?auto_190456 ?auto_190457 ) ) ( not ( = ?auto_190454 ?auto_190458 ) ) ( not ( = ?auto_190455 ?auto_190458 ) ) ( not ( = ?auto_190456 ?auto_190458 ) ) ( not ( = ?auto_190457 ?auto_190458 ) ) ( not ( = ?auto_190460 ?auto_190461 ) ) ( not ( = ?auto_190460 ?auto_190459 ) ) ( not ( = ?auto_190460 ?auto_190458 ) ) ( not ( = ?auto_190460 ?auto_190457 ) ) ( not ( = ?auto_190460 ?auto_190456 ) ) ( not ( = ?auto_190461 ?auto_190459 ) ) ( not ( = ?auto_190461 ?auto_190458 ) ) ( not ( = ?auto_190461 ?auto_190457 ) ) ( not ( = ?auto_190461 ?auto_190456 ) ) ( not ( = ?auto_190459 ?auto_190458 ) ) ( not ( = ?auto_190459 ?auto_190457 ) ) ( not ( = ?auto_190459 ?auto_190456 ) ) ( not ( = ?auto_190454 ?auto_190460 ) ) ( not ( = ?auto_190454 ?auto_190461 ) ) ( not ( = ?auto_190454 ?auto_190459 ) ) ( not ( = ?auto_190455 ?auto_190460 ) ) ( not ( = ?auto_190455 ?auto_190461 ) ) ( not ( = ?auto_190455 ?auto_190459 ) ) ( ON ?auto_190454 ?auto_190462 ) ( not ( = ?auto_190454 ?auto_190462 ) ) ( not ( = ?auto_190455 ?auto_190462 ) ) ( not ( = ?auto_190456 ?auto_190462 ) ) ( not ( = ?auto_190457 ?auto_190462 ) ) ( not ( = ?auto_190458 ?auto_190462 ) ) ( not ( = ?auto_190460 ?auto_190462 ) ) ( not ( = ?auto_190461 ?auto_190462 ) ) ( not ( = ?auto_190459 ?auto_190462 ) ) ( ON ?auto_190455 ?auto_190454 ) ( ON-TABLE ?auto_190462 ) ( ON ?auto_190456 ?auto_190455 ) ( ON ?auto_190457 ?auto_190456 ) ( ON ?auto_190458 ?auto_190457 ) ( ON ?auto_190459 ?auto_190458 ) ( ON ?auto_190461 ?auto_190459 ) ( ON ?auto_190460 ?auto_190461 ) ( CLEAR ?auto_190460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190462 ?auto_190454 ?auto_190455 ?auto_190456 ?auto_190457 ?auto_190458 ?auto_190459 ?auto_190461 )
      ( MAKE-4PILE ?auto_190454 ?auto_190455 ?auto_190456 ?auto_190457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190482 - BLOCK
      ?auto_190483 - BLOCK
      ?auto_190484 - BLOCK
    )
    :vars
    (
      ?auto_190487 - BLOCK
      ?auto_190485 - BLOCK
      ?auto_190486 - BLOCK
      ?auto_190488 - BLOCK
      ?auto_190489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190487 ?auto_190484 ) ( ON-TABLE ?auto_190482 ) ( ON ?auto_190483 ?auto_190482 ) ( ON ?auto_190484 ?auto_190483 ) ( not ( = ?auto_190482 ?auto_190483 ) ) ( not ( = ?auto_190482 ?auto_190484 ) ) ( not ( = ?auto_190482 ?auto_190487 ) ) ( not ( = ?auto_190483 ?auto_190484 ) ) ( not ( = ?auto_190483 ?auto_190487 ) ) ( not ( = ?auto_190484 ?auto_190487 ) ) ( not ( = ?auto_190482 ?auto_190485 ) ) ( not ( = ?auto_190482 ?auto_190486 ) ) ( not ( = ?auto_190483 ?auto_190485 ) ) ( not ( = ?auto_190483 ?auto_190486 ) ) ( not ( = ?auto_190484 ?auto_190485 ) ) ( not ( = ?auto_190484 ?auto_190486 ) ) ( not ( = ?auto_190487 ?auto_190485 ) ) ( not ( = ?auto_190487 ?auto_190486 ) ) ( not ( = ?auto_190485 ?auto_190486 ) ) ( ON ?auto_190485 ?auto_190487 ) ( CLEAR ?auto_190485 ) ( HOLDING ?auto_190486 ) ( CLEAR ?auto_190488 ) ( ON-TABLE ?auto_190489 ) ( ON ?auto_190488 ?auto_190489 ) ( not ( = ?auto_190489 ?auto_190488 ) ) ( not ( = ?auto_190489 ?auto_190486 ) ) ( not ( = ?auto_190488 ?auto_190486 ) ) ( not ( = ?auto_190482 ?auto_190488 ) ) ( not ( = ?auto_190482 ?auto_190489 ) ) ( not ( = ?auto_190483 ?auto_190488 ) ) ( not ( = ?auto_190483 ?auto_190489 ) ) ( not ( = ?auto_190484 ?auto_190488 ) ) ( not ( = ?auto_190484 ?auto_190489 ) ) ( not ( = ?auto_190487 ?auto_190488 ) ) ( not ( = ?auto_190487 ?auto_190489 ) ) ( not ( = ?auto_190485 ?auto_190488 ) ) ( not ( = ?auto_190485 ?auto_190489 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190489 ?auto_190488 ?auto_190486 )
      ( MAKE-3PILE ?auto_190482 ?auto_190483 ?auto_190484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190490 - BLOCK
      ?auto_190491 - BLOCK
      ?auto_190492 - BLOCK
    )
    :vars
    (
      ?auto_190494 - BLOCK
      ?auto_190496 - BLOCK
      ?auto_190493 - BLOCK
      ?auto_190497 - BLOCK
      ?auto_190495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190494 ?auto_190492 ) ( ON-TABLE ?auto_190490 ) ( ON ?auto_190491 ?auto_190490 ) ( ON ?auto_190492 ?auto_190491 ) ( not ( = ?auto_190490 ?auto_190491 ) ) ( not ( = ?auto_190490 ?auto_190492 ) ) ( not ( = ?auto_190490 ?auto_190494 ) ) ( not ( = ?auto_190491 ?auto_190492 ) ) ( not ( = ?auto_190491 ?auto_190494 ) ) ( not ( = ?auto_190492 ?auto_190494 ) ) ( not ( = ?auto_190490 ?auto_190496 ) ) ( not ( = ?auto_190490 ?auto_190493 ) ) ( not ( = ?auto_190491 ?auto_190496 ) ) ( not ( = ?auto_190491 ?auto_190493 ) ) ( not ( = ?auto_190492 ?auto_190496 ) ) ( not ( = ?auto_190492 ?auto_190493 ) ) ( not ( = ?auto_190494 ?auto_190496 ) ) ( not ( = ?auto_190494 ?auto_190493 ) ) ( not ( = ?auto_190496 ?auto_190493 ) ) ( ON ?auto_190496 ?auto_190494 ) ( CLEAR ?auto_190497 ) ( ON-TABLE ?auto_190495 ) ( ON ?auto_190497 ?auto_190495 ) ( not ( = ?auto_190495 ?auto_190497 ) ) ( not ( = ?auto_190495 ?auto_190493 ) ) ( not ( = ?auto_190497 ?auto_190493 ) ) ( not ( = ?auto_190490 ?auto_190497 ) ) ( not ( = ?auto_190490 ?auto_190495 ) ) ( not ( = ?auto_190491 ?auto_190497 ) ) ( not ( = ?auto_190491 ?auto_190495 ) ) ( not ( = ?auto_190492 ?auto_190497 ) ) ( not ( = ?auto_190492 ?auto_190495 ) ) ( not ( = ?auto_190494 ?auto_190497 ) ) ( not ( = ?auto_190494 ?auto_190495 ) ) ( not ( = ?auto_190496 ?auto_190497 ) ) ( not ( = ?auto_190496 ?auto_190495 ) ) ( ON ?auto_190493 ?auto_190496 ) ( CLEAR ?auto_190493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190490 ?auto_190491 ?auto_190492 ?auto_190494 ?auto_190496 )
      ( MAKE-3PILE ?auto_190490 ?auto_190491 ?auto_190492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190498 - BLOCK
      ?auto_190499 - BLOCK
      ?auto_190500 - BLOCK
    )
    :vars
    (
      ?auto_190501 - BLOCK
      ?auto_190502 - BLOCK
      ?auto_190504 - BLOCK
      ?auto_190505 - BLOCK
      ?auto_190503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190501 ?auto_190500 ) ( ON-TABLE ?auto_190498 ) ( ON ?auto_190499 ?auto_190498 ) ( ON ?auto_190500 ?auto_190499 ) ( not ( = ?auto_190498 ?auto_190499 ) ) ( not ( = ?auto_190498 ?auto_190500 ) ) ( not ( = ?auto_190498 ?auto_190501 ) ) ( not ( = ?auto_190499 ?auto_190500 ) ) ( not ( = ?auto_190499 ?auto_190501 ) ) ( not ( = ?auto_190500 ?auto_190501 ) ) ( not ( = ?auto_190498 ?auto_190502 ) ) ( not ( = ?auto_190498 ?auto_190504 ) ) ( not ( = ?auto_190499 ?auto_190502 ) ) ( not ( = ?auto_190499 ?auto_190504 ) ) ( not ( = ?auto_190500 ?auto_190502 ) ) ( not ( = ?auto_190500 ?auto_190504 ) ) ( not ( = ?auto_190501 ?auto_190502 ) ) ( not ( = ?auto_190501 ?auto_190504 ) ) ( not ( = ?auto_190502 ?auto_190504 ) ) ( ON ?auto_190502 ?auto_190501 ) ( ON-TABLE ?auto_190505 ) ( not ( = ?auto_190505 ?auto_190503 ) ) ( not ( = ?auto_190505 ?auto_190504 ) ) ( not ( = ?auto_190503 ?auto_190504 ) ) ( not ( = ?auto_190498 ?auto_190503 ) ) ( not ( = ?auto_190498 ?auto_190505 ) ) ( not ( = ?auto_190499 ?auto_190503 ) ) ( not ( = ?auto_190499 ?auto_190505 ) ) ( not ( = ?auto_190500 ?auto_190503 ) ) ( not ( = ?auto_190500 ?auto_190505 ) ) ( not ( = ?auto_190501 ?auto_190503 ) ) ( not ( = ?auto_190501 ?auto_190505 ) ) ( not ( = ?auto_190502 ?auto_190503 ) ) ( not ( = ?auto_190502 ?auto_190505 ) ) ( ON ?auto_190504 ?auto_190502 ) ( CLEAR ?auto_190504 ) ( HOLDING ?auto_190503 ) ( CLEAR ?auto_190505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190505 ?auto_190503 )
      ( MAKE-3PILE ?auto_190498 ?auto_190499 ?auto_190500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190506 - BLOCK
      ?auto_190507 - BLOCK
      ?auto_190508 - BLOCK
    )
    :vars
    (
      ?auto_190509 - BLOCK
      ?auto_190511 - BLOCK
      ?auto_190513 - BLOCK
      ?auto_190510 - BLOCK
      ?auto_190512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190509 ?auto_190508 ) ( ON-TABLE ?auto_190506 ) ( ON ?auto_190507 ?auto_190506 ) ( ON ?auto_190508 ?auto_190507 ) ( not ( = ?auto_190506 ?auto_190507 ) ) ( not ( = ?auto_190506 ?auto_190508 ) ) ( not ( = ?auto_190506 ?auto_190509 ) ) ( not ( = ?auto_190507 ?auto_190508 ) ) ( not ( = ?auto_190507 ?auto_190509 ) ) ( not ( = ?auto_190508 ?auto_190509 ) ) ( not ( = ?auto_190506 ?auto_190511 ) ) ( not ( = ?auto_190506 ?auto_190513 ) ) ( not ( = ?auto_190507 ?auto_190511 ) ) ( not ( = ?auto_190507 ?auto_190513 ) ) ( not ( = ?auto_190508 ?auto_190511 ) ) ( not ( = ?auto_190508 ?auto_190513 ) ) ( not ( = ?auto_190509 ?auto_190511 ) ) ( not ( = ?auto_190509 ?auto_190513 ) ) ( not ( = ?auto_190511 ?auto_190513 ) ) ( ON ?auto_190511 ?auto_190509 ) ( ON-TABLE ?auto_190510 ) ( not ( = ?auto_190510 ?auto_190512 ) ) ( not ( = ?auto_190510 ?auto_190513 ) ) ( not ( = ?auto_190512 ?auto_190513 ) ) ( not ( = ?auto_190506 ?auto_190512 ) ) ( not ( = ?auto_190506 ?auto_190510 ) ) ( not ( = ?auto_190507 ?auto_190512 ) ) ( not ( = ?auto_190507 ?auto_190510 ) ) ( not ( = ?auto_190508 ?auto_190512 ) ) ( not ( = ?auto_190508 ?auto_190510 ) ) ( not ( = ?auto_190509 ?auto_190512 ) ) ( not ( = ?auto_190509 ?auto_190510 ) ) ( not ( = ?auto_190511 ?auto_190512 ) ) ( not ( = ?auto_190511 ?auto_190510 ) ) ( ON ?auto_190513 ?auto_190511 ) ( CLEAR ?auto_190510 ) ( ON ?auto_190512 ?auto_190513 ) ( CLEAR ?auto_190512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190506 ?auto_190507 ?auto_190508 ?auto_190509 ?auto_190511 ?auto_190513 )
      ( MAKE-3PILE ?auto_190506 ?auto_190507 ?auto_190508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190514 - BLOCK
      ?auto_190515 - BLOCK
      ?auto_190516 - BLOCK
    )
    :vars
    (
      ?auto_190519 - BLOCK
      ?auto_190517 - BLOCK
      ?auto_190521 - BLOCK
      ?auto_190520 - BLOCK
      ?auto_190518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190519 ?auto_190516 ) ( ON-TABLE ?auto_190514 ) ( ON ?auto_190515 ?auto_190514 ) ( ON ?auto_190516 ?auto_190515 ) ( not ( = ?auto_190514 ?auto_190515 ) ) ( not ( = ?auto_190514 ?auto_190516 ) ) ( not ( = ?auto_190514 ?auto_190519 ) ) ( not ( = ?auto_190515 ?auto_190516 ) ) ( not ( = ?auto_190515 ?auto_190519 ) ) ( not ( = ?auto_190516 ?auto_190519 ) ) ( not ( = ?auto_190514 ?auto_190517 ) ) ( not ( = ?auto_190514 ?auto_190521 ) ) ( not ( = ?auto_190515 ?auto_190517 ) ) ( not ( = ?auto_190515 ?auto_190521 ) ) ( not ( = ?auto_190516 ?auto_190517 ) ) ( not ( = ?auto_190516 ?auto_190521 ) ) ( not ( = ?auto_190519 ?auto_190517 ) ) ( not ( = ?auto_190519 ?auto_190521 ) ) ( not ( = ?auto_190517 ?auto_190521 ) ) ( ON ?auto_190517 ?auto_190519 ) ( not ( = ?auto_190520 ?auto_190518 ) ) ( not ( = ?auto_190520 ?auto_190521 ) ) ( not ( = ?auto_190518 ?auto_190521 ) ) ( not ( = ?auto_190514 ?auto_190518 ) ) ( not ( = ?auto_190514 ?auto_190520 ) ) ( not ( = ?auto_190515 ?auto_190518 ) ) ( not ( = ?auto_190515 ?auto_190520 ) ) ( not ( = ?auto_190516 ?auto_190518 ) ) ( not ( = ?auto_190516 ?auto_190520 ) ) ( not ( = ?auto_190519 ?auto_190518 ) ) ( not ( = ?auto_190519 ?auto_190520 ) ) ( not ( = ?auto_190517 ?auto_190518 ) ) ( not ( = ?auto_190517 ?auto_190520 ) ) ( ON ?auto_190521 ?auto_190517 ) ( ON ?auto_190518 ?auto_190521 ) ( CLEAR ?auto_190518 ) ( HOLDING ?auto_190520 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190520 )
      ( MAKE-3PILE ?auto_190514 ?auto_190515 ?auto_190516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190533 - BLOCK
      ?auto_190534 - BLOCK
      ?auto_190535 - BLOCK
    )
    :vars
    (
      ?auto_190538 - BLOCK
      ?auto_190539 - BLOCK
      ?auto_190536 - BLOCK
      ?auto_190540 - BLOCK
      ?auto_190537 - BLOCK
      ?auto_190541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190538 ?auto_190535 ) ( ON-TABLE ?auto_190533 ) ( ON ?auto_190534 ?auto_190533 ) ( ON ?auto_190535 ?auto_190534 ) ( not ( = ?auto_190533 ?auto_190534 ) ) ( not ( = ?auto_190533 ?auto_190535 ) ) ( not ( = ?auto_190533 ?auto_190538 ) ) ( not ( = ?auto_190534 ?auto_190535 ) ) ( not ( = ?auto_190534 ?auto_190538 ) ) ( not ( = ?auto_190535 ?auto_190538 ) ) ( not ( = ?auto_190533 ?auto_190539 ) ) ( not ( = ?auto_190533 ?auto_190536 ) ) ( not ( = ?auto_190534 ?auto_190539 ) ) ( not ( = ?auto_190534 ?auto_190536 ) ) ( not ( = ?auto_190535 ?auto_190539 ) ) ( not ( = ?auto_190535 ?auto_190536 ) ) ( not ( = ?auto_190538 ?auto_190539 ) ) ( not ( = ?auto_190538 ?auto_190536 ) ) ( not ( = ?auto_190539 ?auto_190536 ) ) ( ON ?auto_190539 ?auto_190538 ) ( not ( = ?auto_190540 ?auto_190537 ) ) ( not ( = ?auto_190540 ?auto_190536 ) ) ( not ( = ?auto_190537 ?auto_190536 ) ) ( not ( = ?auto_190533 ?auto_190537 ) ) ( not ( = ?auto_190533 ?auto_190540 ) ) ( not ( = ?auto_190534 ?auto_190537 ) ) ( not ( = ?auto_190534 ?auto_190540 ) ) ( not ( = ?auto_190535 ?auto_190537 ) ) ( not ( = ?auto_190535 ?auto_190540 ) ) ( not ( = ?auto_190538 ?auto_190537 ) ) ( not ( = ?auto_190538 ?auto_190540 ) ) ( not ( = ?auto_190539 ?auto_190537 ) ) ( not ( = ?auto_190539 ?auto_190540 ) ) ( ON ?auto_190536 ?auto_190539 ) ( ON ?auto_190537 ?auto_190536 ) ( CLEAR ?auto_190537 ) ( ON ?auto_190540 ?auto_190541 ) ( CLEAR ?auto_190540 ) ( HAND-EMPTY ) ( not ( = ?auto_190533 ?auto_190541 ) ) ( not ( = ?auto_190534 ?auto_190541 ) ) ( not ( = ?auto_190535 ?auto_190541 ) ) ( not ( = ?auto_190538 ?auto_190541 ) ) ( not ( = ?auto_190539 ?auto_190541 ) ) ( not ( = ?auto_190536 ?auto_190541 ) ) ( not ( = ?auto_190540 ?auto_190541 ) ) ( not ( = ?auto_190537 ?auto_190541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190540 ?auto_190541 )
      ( MAKE-3PILE ?auto_190533 ?auto_190534 ?auto_190535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190542 - BLOCK
      ?auto_190543 - BLOCK
      ?auto_190544 - BLOCK
    )
    :vars
    (
      ?auto_190548 - BLOCK
      ?auto_190550 - BLOCK
      ?auto_190549 - BLOCK
      ?auto_190545 - BLOCK
      ?auto_190547 - BLOCK
      ?auto_190546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190548 ?auto_190544 ) ( ON-TABLE ?auto_190542 ) ( ON ?auto_190543 ?auto_190542 ) ( ON ?auto_190544 ?auto_190543 ) ( not ( = ?auto_190542 ?auto_190543 ) ) ( not ( = ?auto_190542 ?auto_190544 ) ) ( not ( = ?auto_190542 ?auto_190548 ) ) ( not ( = ?auto_190543 ?auto_190544 ) ) ( not ( = ?auto_190543 ?auto_190548 ) ) ( not ( = ?auto_190544 ?auto_190548 ) ) ( not ( = ?auto_190542 ?auto_190550 ) ) ( not ( = ?auto_190542 ?auto_190549 ) ) ( not ( = ?auto_190543 ?auto_190550 ) ) ( not ( = ?auto_190543 ?auto_190549 ) ) ( not ( = ?auto_190544 ?auto_190550 ) ) ( not ( = ?auto_190544 ?auto_190549 ) ) ( not ( = ?auto_190548 ?auto_190550 ) ) ( not ( = ?auto_190548 ?auto_190549 ) ) ( not ( = ?auto_190550 ?auto_190549 ) ) ( ON ?auto_190550 ?auto_190548 ) ( not ( = ?auto_190545 ?auto_190547 ) ) ( not ( = ?auto_190545 ?auto_190549 ) ) ( not ( = ?auto_190547 ?auto_190549 ) ) ( not ( = ?auto_190542 ?auto_190547 ) ) ( not ( = ?auto_190542 ?auto_190545 ) ) ( not ( = ?auto_190543 ?auto_190547 ) ) ( not ( = ?auto_190543 ?auto_190545 ) ) ( not ( = ?auto_190544 ?auto_190547 ) ) ( not ( = ?auto_190544 ?auto_190545 ) ) ( not ( = ?auto_190548 ?auto_190547 ) ) ( not ( = ?auto_190548 ?auto_190545 ) ) ( not ( = ?auto_190550 ?auto_190547 ) ) ( not ( = ?auto_190550 ?auto_190545 ) ) ( ON ?auto_190549 ?auto_190550 ) ( ON ?auto_190545 ?auto_190546 ) ( CLEAR ?auto_190545 ) ( not ( = ?auto_190542 ?auto_190546 ) ) ( not ( = ?auto_190543 ?auto_190546 ) ) ( not ( = ?auto_190544 ?auto_190546 ) ) ( not ( = ?auto_190548 ?auto_190546 ) ) ( not ( = ?auto_190550 ?auto_190546 ) ) ( not ( = ?auto_190549 ?auto_190546 ) ) ( not ( = ?auto_190545 ?auto_190546 ) ) ( not ( = ?auto_190547 ?auto_190546 ) ) ( HOLDING ?auto_190547 ) ( CLEAR ?auto_190549 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190542 ?auto_190543 ?auto_190544 ?auto_190548 ?auto_190550 ?auto_190549 ?auto_190547 )
      ( MAKE-3PILE ?auto_190542 ?auto_190543 ?auto_190544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190551 - BLOCK
      ?auto_190552 - BLOCK
      ?auto_190553 - BLOCK
    )
    :vars
    (
      ?auto_190555 - BLOCK
      ?auto_190556 - BLOCK
      ?auto_190557 - BLOCK
      ?auto_190558 - BLOCK
      ?auto_190554 - BLOCK
      ?auto_190559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190555 ?auto_190553 ) ( ON-TABLE ?auto_190551 ) ( ON ?auto_190552 ?auto_190551 ) ( ON ?auto_190553 ?auto_190552 ) ( not ( = ?auto_190551 ?auto_190552 ) ) ( not ( = ?auto_190551 ?auto_190553 ) ) ( not ( = ?auto_190551 ?auto_190555 ) ) ( not ( = ?auto_190552 ?auto_190553 ) ) ( not ( = ?auto_190552 ?auto_190555 ) ) ( not ( = ?auto_190553 ?auto_190555 ) ) ( not ( = ?auto_190551 ?auto_190556 ) ) ( not ( = ?auto_190551 ?auto_190557 ) ) ( not ( = ?auto_190552 ?auto_190556 ) ) ( not ( = ?auto_190552 ?auto_190557 ) ) ( not ( = ?auto_190553 ?auto_190556 ) ) ( not ( = ?auto_190553 ?auto_190557 ) ) ( not ( = ?auto_190555 ?auto_190556 ) ) ( not ( = ?auto_190555 ?auto_190557 ) ) ( not ( = ?auto_190556 ?auto_190557 ) ) ( ON ?auto_190556 ?auto_190555 ) ( not ( = ?auto_190558 ?auto_190554 ) ) ( not ( = ?auto_190558 ?auto_190557 ) ) ( not ( = ?auto_190554 ?auto_190557 ) ) ( not ( = ?auto_190551 ?auto_190554 ) ) ( not ( = ?auto_190551 ?auto_190558 ) ) ( not ( = ?auto_190552 ?auto_190554 ) ) ( not ( = ?auto_190552 ?auto_190558 ) ) ( not ( = ?auto_190553 ?auto_190554 ) ) ( not ( = ?auto_190553 ?auto_190558 ) ) ( not ( = ?auto_190555 ?auto_190554 ) ) ( not ( = ?auto_190555 ?auto_190558 ) ) ( not ( = ?auto_190556 ?auto_190554 ) ) ( not ( = ?auto_190556 ?auto_190558 ) ) ( ON ?auto_190557 ?auto_190556 ) ( ON ?auto_190558 ?auto_190559 ) ( not ( = ?auto_190551 ?auto_190559 ) ) ( not ( = ?auto_190552 ?auto_190559 ) ) ( not ( = ?auto_190553 ?auto_190559 ) ) ( not ( = ?auto_190555 ?auto_190559 ) ) ( not ( = ?auto_190556 ?auto_190559 ) ) ( not ( = ?auto_190557 ?auto_190559 ) ) ( not ( = ?auto_190558 ?auto_190559 ) ) ( not ( = ?auto_190554 ?auto_190559 ) ) ( CLEAR ?auto_190557 ) ( ON ?auto_190554 ?auto_190558 ) ( CLEAR ?auto_190554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190559 ?auto_190558 )
      ( MAKE-3PILE ?auto_190551 ?auto_190552 ?auto_190553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190560 - BLOCK
      ?auto_190561 - BLOCK
      ?auto_190562 - BLOCK
    )
    :vars
    (
      ?auto_190568 - BLOCK
      ?auto_190567 - BLOCK
      ?auto_190566 - BLOCK
      ?auto_190564 - BLOCK
      ?auto_190563 - BLOCK
      ?auto_190565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190568 ?auto_190562 ) ( ON-TABLE ?auto_190560 ) ( ON ?auto_190561 ?auto_190560 ) ( ON ?auto_190562 ?auto_190561 ) ( not ( = ?auto_190560 ?auto_190561 ) ) ( not ( = ?auto_190560 ?auto_190562 ) ) ( not ( = ?auto_190560 ?auto_190568 ) ) ( not ( = ?auto_190561 ?auto_190562 ) ) ( not ( = ?auto_190561 ?auto_190568 ) ) ( not ( = ?auto_190562 ?auto_190568 ) ) ( not ( = ?auto_190560 ?auto_190567 ) ) ( not ( = ?auto_190560 ?auto_190566 ) ) ( not ( = ?auto_190561 ?auto_190567 ) ) ( not ( = ?auto_190561 ?auto_190566 ) ) ( not ( = ?auto_190562 ?auto_190567 ) ) ( not ( = ?auto_190562 ?auto_190566 ) ) ( not ( = ?auto_190568 ?auto_190567 ) ) ( not ( = ?auto_190568 ?auto_190566 ) ) ( not ( = ?auto_190567 ?auto_190566 ) ) ( ON ?auto_190567 ?auto_190568 ) ( not ( = ?auto_190564 ?auto_190563 ) ) ( not ( = ?auto_190564 ?auto_190566 ) ) ( not ( = ?auto_190563 ?auto_190566 ) ) ( not ( = ?auto_190560 ?auto_190563 ) ) ( not ( = ?auto_190560 ?auto_190564 ) ) ( not ( = ?auto_190561 ?auto_190563 ) ) ( not ( = ?auto_190561 ?auto_190564 ) ) ( not ( = ?auto_190562 ?auto_190563 ) ) ( not ( = ?auto_190562 ?auto_190564 ) ) ( not ( = ?auto_190568 ?auto_190563 ) ) ( not ( = ?auto_190568 ?auto_190564 ) ) ( not ( = ?auto_190567 ?auto_190563 ) ) ( not ( = ?auto_190567 ?auto_190564 ) ) ( ON ?auto_190564 ?auto_190565 ) ( not ( = ?auto_190560 ?auto_190565 ) ) ( not ( = ?auto_190561 ?auto_190565 ) ) ( not ( = ?auto_190562 ?auto_190565 ) ) ( not ( = ?auto_190568 ?auto_190565 ) ) ( not ( = ?auto_190567 ?auto_190565 ) ) ( not ( = ?auto_190566 ?auto_190565 ) ) ( not ( = ?auto_190564 ?auto_190565 ) ) ( not ( = ?auto_190563 ?auto_190565 ) ) ( ON ?auto_190563 ?auto_190564 ) ( CLEAR ?auto_190563 ) ( ON-TABLE ?auto_190565 ) ( HOLDING ?auto_190566 ) ( CLEAR ?auto_190567 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190560 ?auto_190561 ?auto_190562 ?auto_190568 ?auto_190567 ?auto_190566 )
      ( MAKE-3PILE ?auto_190560 ?auto_190561 ?auto_190562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190627 - BLOCK
      ?auto_190628 - BLOCK
      ?auto_190629 - BLOCK
      ?auto_190630 - BLOCK
      ?auto_190631 - BLOCK
    )
    :vars
    (
      ?auto_190632 - BLOCK
      ?auto_190633 - BLOCK
      ?auto_190634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190627 ) ( ON ?auto_190628 ?auto_190627 ) ( ON ?auto_190629 ?auto_190628 ) ( not ( = ?auto_190627 ?auto_190628 ) ) ( not ( = ?auto_190627 ?auto_190629 ) ) ( not ( = ?auto_190627 ?auto_190630 ) ) ( not ( = ?auto_190627 ?auto_190631 ) ) ( not ( = ?auto_190628 ?auto_190629 ) ) ( not ( = ?auto_190628 ?auto_190630 ) ) ( not ( = ?auto_190628 ?auto_190631 ) ) ( not ( = ?auto_190629 ?auto_190630 ) ) ( not ( = ?auto_190629 ?auto_190631 ) ) ( not ( = ?auto_190630 ?auto_190631 ) ) ( ON ?auto_190631 ?auto_190632 ) ( not ( = ?auto_190627 ?auto_190632 ) ) ( not ( = ?auto_190628 ?auto_190632 ) ) ( not ( = ?auto_190629 ?auto_190632 ) ) ( not ( = ?auto_190630 ?auto_190632 ) ) ( not ( = ?auto_190631 ?auto_190632 ) ) ( CLEAR ?auto_190629 ) ( ON ?auto_190630 ?auto_190631 ) ( CLEAR ?auto_190630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190633 ) ( ON ?auto_190634 ?auto_190633 ) ( ON ?auto_190632 ?auto_190634 ) ( not ( = ?auto_190633 ?auto_190634 ) ) ( not ( = ?auto_190633 ?auto_190632 ) ) ( not ( = ?auto_190633 ?auto_190631 ) ) ( not ( = ?auto_190633 ?auto_190630 ) ) ( not ( = ?auto_190634 ?auto_190632 ) ) ( not ( = ?auto_190634 ?auto_190631 ) ) ( not ( = ?auto_190634 ?auto_190630 ) ) ( not ( = ?auto_190627 ?auto_190633 ) ) ( not ( = ?auto_190627 ?auto_190634 ) ) ( not ( = ?auto_190628 ?auto_190633 ) ) ( not ( = ?auto_190628 ?auto_190634 ) ) ( not ( = ?auto_190629 ?auto_190633 ) ) ( not ( = ?auto_190629 ?auto_190634 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190633 ?auto_190634 ?auto_190632 ?auto_190631 )
      ( MAKE-5PILE ?auto_190627 ?auto_190628 ?auto_190629 ?auto_190630 ?auto_190631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190635 - BLOCK
      ?auto_190636 - BLOCK
      ?auto_190637 - BLOCK
      ?auto_190638 - BLOCK
      ?auto_190639 - BLOCK
    )
    :vars
    (
      ?auto_190640 - BLOCK
      ?auto_190642 - BLOCK
      ?auto_190641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190635 ) ( ON ?auto_190636 ?auto_190635 ) ( not ( = ?auto_190635 ?auto_190636 ) ) ( not ( = ?auto_190635 ?auto_190637 ) ) ( not ( = ?auto_190635 ?auto_190638 ) ) ( not ( = ?auto_190635 ?auto_190639 ) ) ( not ( = ?auto_190636 ?auto_190637 ) ) ( not ( = ?auto_190636 ?auto_190638 ) ) ( not ( = ?auto_190636 ?auto_190639 ) ) ( not ( = ?auto_190637 ?auto_190638 ) ) ( not ( = ?auto_190637 ?auto_190639 ) ) ( not ( = ?auto_190638 ?auto_190639 ) ) ( ON ?auto_190639 ?auto_190640 ) ( not ( = ?auto_190635 ?auto_190640 ) ) ( not ( = ?auto_190636 ?auto_190640 ) ) ( not ( = ?auto_190637 ?auto_190640 ) ) ( not ( = ?auto_190638 ?auto_190640 ) ) ( not ( = ?auto_190639 ?auto_190640 ) ) ( ON ?auto_190638 ?auto_190639 ) ( CLEAR ?auto_190638 ) ( ON-TABLE ?auto_190642 ) ( ON ?auto_190641 ?auto_190642 ) ( ON ?auto_190640 ?auto_190641 ) ( not ( = ?auto_190642 ?auto_190641 ) ) ( not ( = ?auto_190642 ?auto_190640 ) ) ( not ( = ?auto_190642 ?auto_190639 ) ) ( not ( = ?auto_190642 ?auto_190638 ) ) ( not ( = ?auto_190641 ?auto_190640 ) ) ( not ( = ?auto_190641 ?auto_190639 ) ) ( not ( = ?auto_190641 ?auto_190638 ) ) ( not ( = ?auto_190635 ?auto_190642 ) ) ( not ( = ?auto_190635 ?auto_190641 ) ) ( not ( = ?auto_190636 ?auto_190642 ) ) ( not ( = ?auto_190636 ?auto_190641 ) ) ( not ( = ?auto_190637 ?auto_190642 ) ) ( not ( = ?auto_190637 ?auto_190641 ) ) ( HOLDING ?auto_190637 ) ( CLEAR ?auto_190636 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190635 ?auto_190636 ?auto_190637 )
      ( MAKE-5PILE ?auto_190635 ?auto_190636 ?auto_190637 ?auto_190638 ?auto_190639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190643 - BLOCK
      ?auto_190644 - BLOCK
      ?auto_190645 - BLOCK
      ?auto_190646 - BLOCK
      ?auto_190647 - BLOCK
    )
    :vars
    (
      ?auto_190648 - BLOCK
      ?auto_190649 - BLOCK
      ?auto_190650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190643 ) ( ON ?auto_190644 ?auto_190643 ) ( not ( = ?auto_190643 ?auto_190644 ) ) ( not ( = ?auto_190643 ?auto_190645 ) ) ( not ( = ?auto_190643 ?auto_190646 ) ) ( not ( = ?auto_190643 ?auto_190647 ) ) ( not ( = ?auto_190644 ?auto_190645 ) ) ( not ( = ?auto_190644 ?auto_190646 ) ) ( not ( = ?auto_190644 ?auto_190647 ) ) ( not ( = ?auto_190645 ?auto_190646 ) ) ( not ( = ?auto_190645 ?auto_190647 ) ) ( not ( = ?auto_190646 ?auto_190647 ) ) ( ON ?auto_190647 ?auto_190648 ) ( not ( = ?auto_190643 ?auto_190648 ) ) ( not ( = ?auto_190644 ?auto_190648 ) ) ( not ( = ?auto_190645 ?auto_190648 ) ) ( not ( = ?auto_190646 ?auto_190648 ) ) ( not ( = ?auto_190647 ?auto_190648 ) ) ( ON ?auto_190646 ?auto_190647 ) ( ON-TABLE ?auto_190649 ) ( ON ?auto_190650 ?auto_190649 ) ( ON ?auto_190648 ?auto_190650 ) ( not ( = ?auto_190649 ?auto_190650 ) ) ( not ( = ?auto_190649 ?auto_190648 ) ) ( not ( = ?auto_190649 ?auto_190647 ) ) ( not ( = ?auto_190649 ?auto_190646 ) ) ( not ( = ?auto_190650 ?auto_190648 ) ) ( not ( = ?auto_190650 ?auto_190647 ) ) ( not ( = ?auto_190650 ?auto_190646 ) ) ( not ( = ?auto_190643 ?auto_190649 ) ) ( not ( = ?auto_190643 ?auto_190650 ) ) ( not ( = ?auto_190644 ?auto_190649 ) ) ( not ( = ?auto_190644 ?auto_190650 ) ) ( not ( = ?auto_190645 ?auto_190649 ) ) ( not ( = ?auto_190645 ?auto_190650 ) ) ( CLEAR ?auto_190644 ) ( ON ?auto_190645 ?auto_190646 ) ( CLEAR ?auto_190645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190649 ?auto_190650 ?auto_190648 ?auto_190647 ?auto_190646 )
      ( MAKE-5PILE ?auto_190643 ?auto_190644 ?auto_190645 ?auto_190646 ?auto_190647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190651 - BLOCK
      ?auto_190652 - BLOCK
      ?auto_190653 - BLOCK
      ?auto_190654 - BLOCK
      ?auto_190655 - BLOCK
    )
    :vars
    (
      ?auto_190656 - BLOCK
      ?auto_190657 - BLOCK
      ?auto_190658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190651 ) ( not ( = ?auto_190651 ?auto_190652 ) ) ( not ( = ?auto_190651 ?auto_190653 ) ) ( not ( = ?auto_190651 ?auto_190654 ) ) ( not ( = ?auto_190651 ?auto_190655 ) ) ( not ( = ?auto_190652 ?auto_190653 ) ) ( not ( = ?auto_190652 ?auto_190654 ) ) ( not ( = ?auto_190652 ?auto_190655 ) ) ( not ( = ?auto_190653 ?auto_190654 ) ) ( not ( = ?auto_190653 ?auto_190655 ) ) ( not ( = ?auto_190654 ?auto_190655 ) ) ( ON ?auto_190655 ?auto_190656 ) ( not ( = ?auto_190651 ?auto_190656 ) ) ( not ( = ?auto_190652 ?auto_190656 ) ) ( not ( = ?auto_190653 ?auto_190656 ) ) ( not ( = ?auto_190654 ?auto_190656 ) ) ( not ( = ?auto_190655 ?auto_190656 ) ) ( ON ?auto_190654 ?auto_190655 ) ( ON-TABLE ?auto_190657 ) ( ON ?auto_190658 ?auto_190657 ) ( ON ?auto_190656 ?auto_190658 ) ( not ( = ?auto_190657 ?auto_190658 ) ) ( not ( = ?auto_190657 ?auto_190656 ) ) ( not ( = ?auto_190657 ?auto_190655 ) ) ( not ( = ?auto_190657 ?auto_190654 ) ) ( not ( = ?auto_190658 ?auto_190656 ) ) ( not ( = ?auto_190658 ?auto_190655 ) ) ( not ( = ?auto_190658 ?auto_190654 ) ) ( not ( = ?auto_190651 ?auto_190657 ) ) ( not ( = ?auto_190651 ?auto_190658 ) ) ( not ( = ?auto_190652 ?auto_190657 ) ) ( not ( = ?auto_190652 ?auto_190658 ) ) ( not ( = ?auto_190653 ?auto_190657 ) ) ( not ( = ?auto_190653 ?auto_190658 ) ) ( ON ?auto_190653 ?auto_190654 ) ( CLEAR ?auto_190653 ) ( HOLDING ?auto_190652 ) ( CLEAR ?auto_190651 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190651 ?auto_190652 )
      ( MAKE-5PILE ?auto_190651 ?auto_190652 ?auto_190653 ?auto_190654 ?auto_190655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190659 - BLOCK
      ?auto_190660 - BLOCK
      ?auto_190661 - BLOCK
      ?auto_190662 - BLOCK
      ?auto_190663 - BLOCK
    )
    :vars
    (
      ?auto_190664 - BLOCK
      ?auto_190665 - BLOCK
      ?auto_190666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190659 ) ( not ( = ?auto_190659 ?auto_190660 ) ) ( not ( = ?auto_190659 ?auto_190661 ) ) ( not ( = ?auto_190659 ?auto_190662 ) ) ( not ( = ?auto_190659 ?auto_190663 ) ) ( not ( = ?auto_190660 ?auto_190661 ) ) ( not ( = ?auto_190660 ?auto_190662 ) ) ( not ( = ?auto_190660 ?auto_190663 ) ) ( not ( = ?auto_190661 ?auto_190662 ) ) ( not ( = ?auto_190661 ?auto_190663 ) ) ( not ( = ?auto_190662 ?auto_190663 ) ) ( ON ?auto_190663 ?auto_190664 ) ( not ( = ?auto_190659 ?auto_190664 ) ) ( not ( = ?auto_190660 ?auto_190664 ) ) ( not ( = ?auto_190661 ?auto_190664 ) ) ( not ( = ?auto_190662 ?auto_190664 ) ) ( not ( = ?auto_190663 ?auto_190664 ) ) ( ON ?auto_190662 ?auto_190663 ) ( ON-TABLE ?auto_190665 ) ( ON ?auto_190666 ?auto_190665 ) ( ON ?auto_190664 ?auto_190666 ) ( not ( = ?auto_190665 ?auto_190666 ) ) ( not ( = ?auto_190665 ?auto_190664 ) ) ( not ( = ?auto_190665 ?auto_190663 ) ) ( not ( = ?auto_190665 ?auto_190662 ) ) ( not ( = ?auto_190666 ?auto_190664 ) ) ( not ( = ?auto_190666 ?auto_190663 ) ) ( not ( = ?auto_190666 ?auto_190662 ) ) ( not ( = ?auto_190659 ?auto_190665 ) ) ( not ( = ?auto_190659 ?auto_190666 ) ) ( not ( = ?auto_190660 ?auto_190665 ) ) ( not ( = ?auto_190660 ?auto_190666 ) ) ( not ( = ?auto_190661 ?auto_190665 ) ) ( not ( = ?auto_190661 ?auto_190666 ) ) ( ON ?auto_190661 ?auto_190662 ) ( CLEAR ?auto_190659 ) ( ON ?auto_190660 ?auto_190661 ) ( CLEAR ?auto_190660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190665 ?auto_190666 ?auto_190664 ?auto_190663 ?auto_190662 ?auto_190661 )
      ( MAKE-5PILE ?auto_190659 ?auto_190660 ?auto_190661 ?auto_190662 ?auto_190663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190667 - BLOCK
      ?auto_190668 - BLOCK
      ?auto_190669 - BLOCK
      ?auto_190670 - BLOCK
      ?auto_190671 - BLOCK
    )
    :vars
    (
      ?auto_190674 - BLOCK
      ?auto_190673 - BLOCK
      ?auto_190672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190667 ?auto_190668 ) ) ( not ( = ?auto_190667 ?auto_190669 ) ) ( not ( = ?auto_190667 ?auto_190670 ) ) ( not ( = ?auto_190667 ?auto_190671 ) ) ( not ( = ?auto_190668 ?auto_190669 ) ) ( not ( = ?auto_190668 ?auto_190670 ) ) ( not ( = ?auto_190668 ?auto_190671 ) ) ( not ( = ?auto_190669 ?auto_190670 ) ) ( not ( = ?auto_190669 ?auto_190671 ) ) ( not ( = ?auto_190670 ?auto_190671 ) ) ( ON ?auto_190671 ?auto_190674 ) ( not ( = ?auto_190667 ?auto_190674 ) ) ( not ( = ?auto_190668 ?auto_190674 ) ) ( not ( = ?auto_190669 ?auto_190674 ) ) ( not ( = ?auto_190670 ?auto_190674 ) ) ( not ( = ?auto_190671 ?auto_190674 ) ) ( ON ?auto_190670 ?auto_190671 ) ( ON-TABLE ?auto_190673 ) ( ON ?auto_190672 ?auto_190673 ) ( ON ?auto_190674 ?auto_190672 ) ( not ( = ?auto_190673 ?auto_190672 ) ) ( not ( = ?auto_190673 ?auto_190674 ) ) ( not ( = ?auto_190673 ?auto_190671 ) ) ( not ( = ?auto_190673 ?auto_190670 ) ) ( not ( = ?auto_190672 ?auto_190674 ) ) ( not ( = ?auto_190672 ?auto_190671 ) ) ( not ( = ?auto_190672 ?auto_190670 ) ) ( not ( = ?auto_190667 ?auto_190673 ) ) ( not ( = ?auto_190667 ?auto_190672 ) ) ( not ( = ?auto_190668 ?auto_190673 ) ) ( not ( = ?auto_190668 ?auto_190672 ) ) ( not ( = ?auto_190669 ?auto_190673 ) ) ( not ( = ?auto_190669 ?auto_190672 ) ) ( ON ?auto_190669 ?auto_190670 ) ( ON ?auto_190668 ?auto_190669 ) ( CLEAR ?auto_190668 ) ( HOLDING ?auto_190667 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190667 )
      ( MAKE-5PILE ?auto_190667 ?auto_190668 ?auto_190669 ?auto_190670 ?auto_190671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190675 - BLOCK
      ?auto_190676 - BLOCK
      ?auto_190677 - BLOCK
      ?auto_190678 - BLOCK
      ?auto_190679 - BLOCK
    )
    :vars
    (
      ?auto_190682 - BLOCK
      ?auto_190680 - BLOCK
      ?auto_190681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190675 ?auto_190676 ) ) ( not ( = ?auto_190675 ?auto_190677 ) ) ( not ( = ?auto_190675 ?auto_190678 ) ) ( not ( = ?auto_190675 ?auto_190679 ) ) ( not ( = ?auto_190676 ?auto_190677 ) ) ( not ( = ?auto_190676 ?auto_190678 ) ) ( not ( = ?auto_190676 ?auto_190679 ) ) ( not ( = ?auto_190677 ?auto_190678 ) ) ( not ( = ?auto_190677 ?auto_190679 ) ) ( not ( = ?auto_190678 ?auto_190679 ) ) ( ON ?auto_190679 ?auto_190682 ) ( not ( = ?auto_190675 ?auto_190682 ) ) ( not ( = ?auto_190676 ?auto_190682 ) ) ( not ( = ?auto_190677 ?auto_190682 ) ) ( not ( = ?auto_190678 ?auto_190682 ) ) ( not ( = ?auto_190679 ?auto_190682 ) ) ( ON ?auto_190678 ?auto_190679 ) ( ON-TABLE ?auto_190680 ) ( ON ?auto_190681 ?auto_190680 ) ( ON ?auto_190682 ?auto_190681 ) ( not ( = ?auto_190680 ?auto_190681 ) ) ( not ( = ?auto_190680 ?auto_190682 ) ) ( not ( = ?auto_190680 ?auto_190679 ) ) ( not ( = ?auto_190680 ?auto_190678 ) ) ( not ( = ?auto_190681 ?auto_190682 ) ) ( not ( = ?auto_190681 ?auto_190679 ) ) ( not ( = ?auto_190681 ?auto_190678 ) ) ( not ( = ?auto_190675 ?auto_190680 ) ) ( not ( = ?auto_190675 ?auto_190681 ) ) ( not ( = ?auto_190676 ?auto_190680 ) ) ( not ( = ?auto_190676 ?auto_190681 ) ) ( not ( = ?auto_190677 ?auto_190680 ) ) ( not ( = ?auto_190677 ?auto_190681 ) ) ( ON ?auto_190677 ?auto_190678 ) ( ON ?auto_190676 ?auto_190677 ) ( ON ?auto_190675 ?auto_190676 ) ( CLEAR ?auto_190675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190680 ?auto_190681 ?auto_190682 ?auto_190679 ?auto_190678 ?auto_190677 ?auto_190676 )
      ( MAKE-5PILE ?auto_190675 ?auto_190676 ?auto_190677 ?auto_190678 ?auto_190679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190688 - BLOCK
      ?auto_190689 - BLOCK
      ?auto_190690 - BLOCK
      ?auto_190691 - BLOCK
      ?auto_190692 - BLOCK
    )
    :vars
    (
      ?auto_190693 - BLOCK
      ?auto_190694 - BLOCK
      ?auto_190695 - BLOCK
      ?auto_190696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190688 ?auto_190689 ) ) ( not ( = ?auto_190688 ?auto_190690 ) ) ( not ( = ?auto_190688 ?auto_190691 ) ) ( not ( = ?auto_190688 ?auto_190692 ) ) ( not ( = ?auto_190689 ?auto_190690 ) ) ( not ( = ?auto_190689 ?auto_190691 ) ) ( not ( = ?auto_190689 ?auto_190692 ) ) ( not ( = ?auto_190690 ?auto_190691 ) ) ( not ( = ?auto_190690 ?auto_190692 ) ) ( not ( = ?auto_190691 ?auto_190692 ) ) ( ON ?auto_190692 ?auto_190693 ) ( not ( = ?auto_190688 ?auto_190693 ) ) ( not ( = ?auto_190689 ?auto_190693 ) ) ( not ( = ?auto_190690 ?auto_190693 ) ) ( not ( = ?auto_190691 ?auto_190693 ) ) ( not ( = ?auto_190692 ?auto_190693 ) ) ( ON ?auto_190691 ?auto_190692 ) ( ON-TABLE ?auto_190694 ) ( ON ?auto_190695 ?auto_190694 ) ( ON ?auto_190693 ?auto_190695 ) ( not ( = ?auto_190694 ?auto_190695 ) ) ( not ( = ?auto_190694 ?auto_190693 ) ) ( not ( = ?auto_190694 ?auto_190692 ) ) ( not ( = ?auto_190694 ?auto_190691 ) ) ( not ( = ?auto_190695 ?auto_190693 ) ) ( not ( = ?auto_190695 ?auto_190692 ) ) ( not ( = ?auto_190695 ?auto_190691 ) ) ( not ( = ?auto_190688 ?auto_190694 ) ) ( not ( = ?auto_190688 ?auto_190695 ) ) ( not ( = ?auto_190689 ?auto_190694 ) ) ( not ( = ?auto_190689 ?auto_190695 ) ) ( not ( = ?auto_190690 ?auto_190694 ) ) ( not ( = ?auto_190690 ?auto_190695 ) ) ( ON ?auto_190690 ?auto_190691 ) ( ON ?auto_190689 ?auto_190690 ) ( CLEAR ?auto_190689 ) ( ON ?auto_190688 ?auto_190696 ) ( CLEAR ?auto_190688 ) ( HAND-EMPTY ) ( not ( = ?auto_190688 ?auto_190696 ) ) ( not ( = ?auto_190689 ?auto_190696 ) ) ( not ( = ?auto_190690 ?auto_190696 ) ) ( not ( = ?auto_190691 ?auto_190696 ) ) ( not ( = ?auto_190692 ?auto_190696 ) ) ( not ( = ?auto_190693 ?auto_190696 ) ) ( not ( = ?auto_190694 ?auto_190696 ) ) ( not ( = ?auto_190695 ?auto_190696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190688 ?auto_190696 )
      ( MAKE-5PILE ?auto_190688 ?auto_190689 ?auto_190690 ?auto_190691 ?auto_190692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190697 - BLOCK
      ?auto_190698 - BLOCK
      ?auto_190699 - BLOCK
      ?auto_190700 - BLOCK
      ?auto_190701 - BLOCK
    )
    :vars
    (
      ?auto_190704 - BLOCK
      ?auto_190702 - BLOCK
      ?auto_190703 - BLOCK
      ?auto_190705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190697 ?auto_190698 ) ) ( not ( = ?auto_190697 ?auto_190699 ) ) ( not ( = ?auto_190697 ?auto_190700 ) ) ( not ( = ?auto_190697 ?auto_190701 ) ) ( not ( = ?auto_190698 ?auto_190699 ) ) ( not ( = ?auto_190698 ?auto_190700 ) ) ( not ( = ?auto_190698 ?auto_190701 ) ) ( not ( = ?auto_190699 ?auto_190700 ) ) ( not ( = ?auto_190699 ?auto_190701 ) ) ( not ( = ?auto_190700 ?auto_190701 ) ) ( ON ?auto_190701 ?auto_190704 ) ( not ( = ?auto_190697 ?auto_190704 ) ) ( not ( = ?auto_190698 ?auto_190704 ) ) ( not ( = ?auto_190699 ?auto_190704 ) ) ( not ( = ?auto_190700 ?auto_190704 ) ) ( not ( = ?auto_190701 ?auto_190704 ) ) ( ON ?auto_190700 ?auto_190701 ) ( ON-TABLE ?auto_190702 ) ( ON ?auto_190703 ?auto_190702 ) ( ON ?auto_190704 ?auto_190703 ) ( not ( = ?auto_190702 ?auto_190703 ) ) ( not ( = ?auto_190702 ?auto_190704 ) ) ( not ( = ?auto_190702 ?auto_190701 ) ) ( not ( = ?auto_190702 ?auto_190700 ) ) ( not ( = ?auto_190703 ?auto_190704 ) ) ( not ( = ?auto_190703 ?auto_190701 ) ) ( not ( = ?auto_190703 ?auto_190700 ) ) ( not ( = ?auto_190697 ?auto_190702 ) ) ( not ( = ?auto_190697 ?auto_190703 ) ) ( not ( = ?auto_190698 ?auto_190702 ) ) ( not ( = ?auto_190698 ?auto_190703 ) ) ( not ( = ?auto_190699 ?auto_190702 ) ) ( not ( = ?auto_190699 ?auto_190703 ) ) ( ON ?auto_190699 ?auto_190700 ) ( ON ?auto_190697 ?auto_190705 ) ( CLEAR ?auto_190697 ) ( not ( = ?auto_190697 ?auto_190705 ) ) ( not ( = ?auto_190698 ?auto_190705 ) ) ( not ( = ?auto_190699 ?auto_190705 ) ) ( not ( = ?auto_190700 ?auto_190705 ) ) ( not ( = ?auto_190701 ?auto_190705 ) ) ( not ( = ?auto_190704 ?auto_190705 ) ) ( not ( = ?auto_190702 ?auto_190705 ) ) ( not ( = ?auto_190703 ?auto_190705 ) ) ( HOLDING ?auto_190698 ) ( CLEAR ?auto_190699 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190702 ?auto_190703 ?auto_190704 ?auto_190701 ?auto_190700 ?auto_190699 ?auto_190698 )
      ( MAKE-5PILE ?auto_190697 ?auto_190698 ?auto_190699 ?auto_190700 ?auto_190701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190706 - BLOCK
      ?auto_190707 - BLOCK
      ?auto_190708 - BLOCK
      ?auto_190709 - BLOCK
      ?auto_190710 - BLOCK
    )
    :vars
    (
      ?auto_190711 - BLOCK
      ?auto_190712 - BLOCK
      ?auto_190713 - BLOCK
      ?auto_190714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190706 ?auto_190707 ) ) ( not ( = ?auto_190706 ?auto_190708 ) ) ( not ( = ?auto_190706 ?auto_190709 ) ) ( not ( = ?auto_190706 ?auto_190710 ) ) ( not ( = ?auto_190707 ?auto_190708 ) ) ( not ( = ?auto_190707 ?auto_190709 ) ) ( not ( = ?auto_190707 ?auto_190710 ) ) ( not ( = ?auto_190708 ?auto_190709 ) ) ( not ( = ?auto_190708 ?auto_190710 ) ) ( not ( = ?auto_190709 ?auto_190710 ) ) ( ON ?auto_190710 ?auto_190711 ) ( not ( = ?auto_190706 ?auto_190711 ) ) ( not ( = ?auto_190707 ?auto_190711 ) ) ( not ( = ?auto_190708 ?auto_190711 ) ) ( not ( = ?auto_190709 ?auto_190711 ) ) ( not ( = ?auto_190710 ?auto_190711 ) ) ( ON ?auto_190709 ?auto_190710 ) ( ON-TABLE ?auto_190712 ) ( ON ?auto_190713 ?auto_190712 ) ( ON ?auto_190711 ?auto_190713 ) ( not ( = ?auto_190712 ?auto_190713 ) ) ( not ( = ?auto_190712 ?auto_190711 ) ) ( not ( = ?auto_190712 ?auto_190710 ) ) ( not ( = ?auto_190712 ?auto_190709 ) ) ( not ( = ?auto_190713 ?auto_190711 ) ) ( not ( = ?auto_190713 ?auto_190710 ) ) ( not ( = ?auto_190713 ?auto_190709 ) ) ( not ( = ?auto_190706 ?auto_190712 ) ) ( not ( = ?auto_190706 ?auto_190713 ) ) ( not ( = ?auto_190707 ?auto_190712 ) ) ( not ( = ?auto_190707 ?auto_190713 ) ) ( not ( = ?auto_190708 ?auto_190712 ) ) ( not ( = ?auto_190708 ?auto_190713 ) ) ( ON ?auto_190708 ?auto_190709 ) ( ON ?auto_190706 ?auto_190714 ) ( not ( = ?auto_190706 ?auto_190714 ) ) ( not ( = ?auto_190707 ?auto_190714 ) ) ( not ( = ?auto_190708 ?auto_190714 ) ) ( not ( = ?auto_190709 ?auto_190714 ) ) ( not ( = ?auto_190710 ?auto_190714 ) ) ( not ( = ?auto_190711 ?auto_190714 ) ) ( not ( = ?auto_190712 ?auto_190714 ) ) ( not ( = ?auto_190713 ?auto_190714 ) ) ( CLEAR ?auto_190708 ) ( ON ?auto_190707 ?auto_190706 ) ( CLEAR ?auto_190707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190714 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190714 ?auto_190706 )
      ( MAKE-5PILE ?auto_190706 ?auto_190707 ?auto_190708 ?auto_190709 ?auto_190710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190715 - BLOCK
      ?auto_190716 - BLOCK
      ?auto_190717 - BLOCK
      ?auto_190718 - BLOCK
      ?auto_190719 - BLOCK
    )
    :vars
    (
      ?auto_190720 - BLOCK
      ?auto_190723 - BLOCK
      ?auto_190721 - BLOCK
      ?auto_190722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190715 ?auto_190716 ) ) ( not ( = ?auto_190715 ?auto_190717 ) ) ( not ( = ?auto_190715 ?auto_190718 ) ) ( not ( = ?auto_190715 ?auto_190719 ) ) ( not ( = ?auto_190716 ?auto_190717 ) ) ( not ( = ?auto_190716 ?auto_190718 ) ) ( not ( = ?auto_190716 ?auto_190719 ) ) ( not ( = ?auto_190717 ?auto_190718 ) ) ( not ( = ?auto_190717 ?auto_190719 ) ) ( not ( = ?auto_190718 ?auto_190719 ) ) ( ON ?auto_190719 ?auto_190720 ) ( not ( = ?auto_190715 ?auto_190720 ) ) ( not ( = ?auto_190716 ?auto_190720 ) ) ( not ( = ?auto_190717 ?auto_190720 ) ) ( not ( = ?auto_190718 ?auto_190720 ) ) ( not ( = ?auto_190719 ?auto_190720 ) ) ( ON ?auto_190718 ?auto_190719 ) ( ON-TABLE ?auto_190723 ) ( ON ?auto_190721 ?auto_190723 ) ( ON ?auto_190720 ?auto_190721 ) ( not ( = ?auto_190723 ?auto_190721 ) ) ( not ( = ?auto_190723 ?auto_190720 ) ) ( not ( = ?auto_190723 ?auto_190719 ) ) ( not ( = ?auto_190723 ?auto_190718 ) ) ( not ( = ?auto_190721 ?auto_190720 ) ) ( not ( = ?auto_190721 ?auto_190719 ) ) ( not ( = ?auto_190721 ?auto_190718 ) ) ( not ( = ?auto_190715 ?auto_190723 ) ) ( not ( = ?auto_190715 ?auto_190721 ) ) ( not ( = ?auto_190716 ?auto_190723 ) ) ( not ( = ?auto_190716 ?auto_190721 ) ) ( not ( = ?auto_190717 ?auto_190723 ) ) ( not ( = ?auto_190717 ?auto_190721 ) ) ( ON ?auto_190715 ?auto_190722 ) ( not ( = ?auto_190715 ?auto_190722 ) ) ( not ( = ?auto_190716 ?auto_190722 ) ) ( not ( = ?auto_190717 ?auto_190722 ) ) ( not ( = ?auto_190718 ?auto_190722 ) ) ( not ( = ?auto_190719 ?auto_190722 ) ) ( not ( = ?auto_190720 ?auto_190722 ) ) ( not ( = ?auto_190723 ?auto_190722 ) ) ( not ( = ?auto_190721 ?auto_190722 ) ) ( ON ?auto_190716 ?auto_190715 ) ( CLEAR ?auto_190716 ) ( ON-TABLE ?auto_190722 ) ( HOLDING ?auto_190717 ) ( CLEAR ?auto_190718 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190723 ?auto_190721 ?auto_190720 ?auto_190719 ?auto_190718 ?auto_190717 )
      ( MAKE-5PILE ?auto_190715 ?auto_190716 ?auto_190717 ?auto_190718 ?auto_190719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190724 - BLOCK
      ?auto_190725 - BLOCK
      ?auto_190726 - BLOCK
      ?auto_190727 - BLOCK
      ?auto_190728 - BLOCK
    )
    :vars
    (
      ?auto_190730 - BLOCK
      ?auto_190729 - BLOCK
      ?auto_190731 - BLOCK
      ?auto_190732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190724 ?auto_190725 ) ) ( not ( = ?auto_190724 ?auto_190726 ) ) ( not ( = ?auto_190724 ?auto_190727 ) ) ( not ( = ?auto_190724 ?auto_190728 ) ) ( not ( = ?auto_190725 ?auto_190726 ) ) ( not ( = ?auto_190725 ?auto_190727 ) ) ( not ( = ?auto_190725 ?auto_190728 ) ) ( not ( = ?auto_190726 ?auto_190727 ) ) ( not ( = ?auto_190726 ?auto_190728 ) ) ( not ( = ?auto_190727 ?auto_190728 ) ) ( ON ?auto_190728 ?auto_190730 ) ( not ( = ?auto_190724 ?auto_190730 ) ) ( not ( = ?auto_190725 ?auto_190730 ) ) ( not ( = ?auto_190726 ?auto_190730 ) ) ( not ( = ?auto_190727 ?auto_190730 ) ) ( not ( = ?auto_190728 ?auto_190730 ) ) ( ON ?auto_190727 ?auto_190728 ) ( ON-TABLE ?auto_190729 ) ( ON ?auto_190731 ?auto_190729 ) ( ON ?auto_190730 ?auto_190731 ) ( not ( = ?auto_190729 ?auto_190731 ) ) ( not ( = ?auto_190729 ?auto_190730 ) ) ( not ( = ?auto_190729 ?auto_190728 ) ) ( not ( = ?auto_190729 ?auto_190727 ) ) ( not ( = ?auto_190731 ?auto_190730 ) ) ( not ( = ?auto_190731 ?auto_190728 ) ) ( not ( = ?auto_190731 ?auto_190727 ) ) ( not ( = ?auto_190724 ?auto_190729 ) ) ( not ( = ?auto_190724 ?auto_190731 ) ) ( not ( = ?auto_190725 ?auto_190729 ) ) ( not ( = ?auto_190725 ?auto_190731 ) ) ( not ( = ?auto_190726 ?auto_190729 ) ) ( not ( = ?auto_190726 ?auto_190731 ) ) ( ON ?auto_190724 ?auto_190732 ) ( not ( = ?auto_190724 ?auto_190732 ) ) ( not ( = ?auto_190725 ?auto_190732 ) ) ( not ( = ?auto_190726 ?auto_190732 ) ) ( not ( = ?auto_190727 ?auto_190732 ) ) ( not ( = ?auto_190728 ?auto_190732 ) ) ( not ( = ?auto_190730 ?auto_190732 ) ) ( not ( = ?auto_190729 ?auto_190732 ) ) ( not ( = ?auto_190731 ?auto_190732 ) ) ( ON ?auto_190725 ?auto_190724 ) ( ON-TABLE ?auto_190732 ) ( CLEAR ?auto_190727 ) ( ON ?auto_190726 ?auto_190725 ) ( CLEAR ?auto_190726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190732 ?auto_190724 ?auto_190725 )
      ( MAKE-5PILE ?auto_190724 ?auto_190725 ?auto_190726 ?auto_190727 ?auto_190728 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190733 - BLOCK
      ?auto_190734 - BLOCK
      ?auto_190735 - BLOCK
      ?auto_190736 - BLOCK
      ?auto_190737 - BLOCK
    )
    :vars
    (
      ?auto_190741 - BLOCK
      ?auto_190740 - BLOCK
      ?auto_190739 - BLOCK
      ?auto_190738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190733 ?auto_190734 ) ) ( not ( = ?auto_190733 ?auto_190735 ) ) ( not ( = ?auto_190733 ?auto_190736 ) ) ( not ( = ?auto_190733 ?auto_190737 ) ) ( not ( = ?auto_190734 ?auto_190735 ) ) ( not ( = ?auto_190734 ?auto_190736 ) ) ( not ( = ?auto_190734 ?auto_190737 ) ) ( not ( = ?auto_190735 ?auto_190736 ) ) ( not ( = ?auto_190735 ?auto_190737 ) ) ( not ( = ?auto_190736 ?auto_190737 ) ) ( ON ?auto_190737 ?auto_190741 ) ( not ( = ?auto_190733 ?auto_190741 ) ) ( not ( = ?auto_190734 ?auto_190741 ) ) ( not ( = ?auto_190735 ?auto_190741 ) ) ( not ( = ?auto_190736 ?auto_190741 ) ) ( not ( = ?auto_190737 ?auto_190741 ) ) ( ON-TABLE ?auto_190740 ) ( ON ?auto_190739 ?auto_190740 ) ( ON ?auto_190741 ?auto_190739 ) ( not ( = ?auto_190740 ?auto_190739 ) ) ( not ( = ?auto_190740 ?auto_190741 ) ) ( not ( = ?auto_190740 ?auto_190737 ) ) ( not ( = ?auto_190740 ?auto_190736 ) ) ( not ( = ?auto_190739 ?auto_190741 ) ) ( not ( = ?auto_190739 ?auto_190737 ) ) ( not ( = ?auto_190739 ?auto_190736 ) ) ( not ( = ?auto_190733 ?auto_190740 ) ) ( not ( = ?auto_190733 ?auto_190739 ) ) ( not ( = ?auto_190734 ?auto_190740 ) ) ( not ( = ?auto_190734 ?auto_190739 ) ) ( not ( = ?auto_190735 ?auto_190740 ) ) ( not ( = ?auto_190735 ?auto_190739 ) ) ( ON ?auto_190733 ?auto_190738 ) ( not ( = ?auto_190733 ?auto_190738 ) ) ( not ( = ?auto_190734 ?auto_190738 ) ) ( not ( = ?auto_190735 ?auto_190738 ) ) ( not ( = ?auto_190736 ?auto_190738 ) ) ( not ( = ?auto_190737 ?auto_190738 ) ) ( not ( = ?auto_190741 ?auto_190738 ) ) ( not ( = ?auto_190740 ?auto_190738 ) ) ( not ( = ?auto_190739 ?auto_190738 ) ) ( ON ?auto_190734 ?auto_190733 ) ( ON-TABLE ?auto_190738 ) ( ON ?auto_190735 ?auto_190734 ) ( CLEAR ?auto_190735 ) ( HOLDING ?auto_190736 ) ( CLEAR ?auto_190737 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190740 ?auto_190739 ?auto_190741 ?auto_190737 ?auto_190736 )
      ( MAKE-5PILE ?auto_190733 ?auto_190734 ?auto_190735 ?auto_190736 ?auto_190737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190742 - BLOCK
      ?auto_190743 - BLOCK
      ?auto_190744 - BLOCK
      ?auto_190745 - BLOCK
      ?auto_190746 - BLOCK
    )
    :vars
    (
      ?auto_190748 - BLOCK
      ?auto_190749 - BLOCK
      ?auto_190747 - BLOCK
      ?auto_190750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190742 ?auto_190743 ) ) ( not ( = ?auto_190742 ?auto_190744 ) ) ( not ( = ?auto_190742 ?auto_190745 ) ) ( not ( = ?auto_190742 ?auto_190746 ) ) ( not ( = ?auto_190743 ?auto_190744 ) ) ( not ( = ?auto_190743 ?auto_190745 ) ) ( not ( = ?auto_190743 ?auto_190746 ) ) ( not ( = ?auto_190744 ?auto_190745 ) ) ( not ( = ?auto_190744 ?auto_190746 ) ) ( not ( = ?auto_190745 ?auto_190746 ) ) ( ON ?auto_190746 ?auto_190748 ) ( not ( = ?auto_190742 ?auto_190748 ) ) ( not ( = ?auto_190743 ?auto_190748 ) ) ( not ( = ?auto_190744 ?auto_190748 ) ) ( not ( = ?auto_190745 ?auto_190748 ) ) ( not ( = ?auto_190746 ?auto_190748 ) ) ( ON-TABLE ?auto_190749 ) ( ON ?auto_190747 ?auto_190749 ) ( ON ?auto_190748 ?auto_190747 ) ( not ( = ?auto_190749 ?auto_190747 ) ) ( not ( = ?auto_190749 ?auto_190748 ) ) ( not ( = ?auto_190749 ?auto_190746 ) ) ( not ( = ?auto_190749 ?auto_190745 ) ) ( not ( = ?auto_190747 ?auto_190748 ) ) ( not ( = ?auto_190747 ?auto_190746 ) ) ( not ( = ?auto_190747 ?auto_190745 ) ) ( not ( = ?auto_190742 ?auto_190749 ) ) ( not ( = ?auto_190742 ?auto_190747 ) ) ( not ( = ?auto_190743 ?auto_190749 ) ) ( not ( = ?auto_190743 ?auto_190747 ) ) ( not ( = ?auto_190744 ?auto_190749 ) ) ( not ( = ?auto_190744 ?auto_190747 ) ) ( ON ?auto_190742 ?auto_190750 ) ( not ( = ?auto_190742 ?auto_190750 ) ) ( not ( = ?auto_190743 ?auto_190750 ) ) ( not ( = ?auto_190744 ?auto_190750 ) ) ( not ( = ?auto_190745 ?auto_190750 ) ) ( not ( = ?auto_190746 ?auto_190750 ) ) ( not ( = ?auto_190748 ?auto_190750 ) ) ( not ( = ?auto_190749 ?auto_190750 ) ) ( not ( = ?auto_190747 ?auto_190750 ) ) ( ON ?auto_190743 ?auto_190742 ) ( ON-TABLE ?auto_190750 ) ( ON ?auto_190744 ?auto_190743 ) ( CLEAR ?auto_190746 ) ( ON ?auto_190745 ?auto_190744 ) ( CLEAR ?auto_190745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190750 ?auto_190742 ?auto_190743 ?auto_190744 )
      ( MAKE-5PILE ?auto_190742 ?auto_190743 ?auto_190744 ?auto_190745 ?auto_190746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190751 - BLOCK
      ?auto_190752 - BLOCK
      ?auto_190753 - BLOCK
      ?auto_190754 - BLOCK
      ?auto_190755 - BLOCK
    )
    :vars
    (
      ?auto_190756 - BLOCK
      ?auto_190757 - BLOCK
      ?auto_190758 - BLOCK
      ?auto_190759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190751 ?auto_190752 ) ) ( not ( = ?auto_190751 ?auto_190753 ) ) ( not ( = ?auto_190751 ?auto_190754 ) ) ( not ( = ?auto_190751 ?auto_190755 ) ) ( not ( = ?auto_190752 ?auto_190753 ) ) ( not ( = ?auto_190752 ?auto_190754 ) ) ( not ( = ?auto_190752 ?auto_190755 ) ) ( not ( = ?auto_190753 ?auto_190754 ) ) ( not ( = ?auto_190753 ?auto_190755 ) ) ( not ( = ?auto_190754 ?auto_190755 ) ) ( not ( = ?auto_190751 ?auto_190756 ) ) ( not ( = ?auto_190752 ?auto_190756 ) ) ( not ( = ?auto_190753 ?auto_190756 ) ) ( not ( = ?auto_190754 ?auto_190756 ) ) ( not ( = ?auto_190755 ?auto_190756 ) ) ( ON-TABLE ?auto_190757 ) ( ON ?auto_190758 ?auto_190757 ) ( ON ?auto_190756 ?auto_190758 ) ( not ( = ?auto_190757 ?auto_190758 ) ) ( not ( = ?auto_190757 ?auto_190756 ) ) ( not ( = ?auto_190757 ?auto_190755 ) ) ( not ( = ?auto_190757 ?auto_190754 ) ) ( not ( = ?auto_190758 ?auto_190756 ) ) ( not ( = ?auto_190758 ?auto_190755 ) ) ( not ( = ?auto_190758 ?auto_190754 ) ) ( not ( = ?auto_190751 ?auto_190757 ) ) ( not ( = ?auto_190751 ?auto_190758 ) ) ( not ( = ?auto_190752 ?auto_190757 ) ) ( not ( = ?auto_190752 ?auto_190758 ) ) ( not ( = ?auto_190753 ?auto_190757 ) ) ( not ( = ?auto_190753 ?auto_190758 ) ) ( ON ?auto_190751 ?auto_190759 ) ( not ( = ?auto_190751 ?auto_190759 ) ) ( not ( = ?auto_190752 ?auto_190759 ) ) ( not ( = ?auto_190753 ?auto_190759 ) ) ( not ( = ?auto_190754 ?auto_190759 ) ) ( not ( = ?auto_190755 ?auto_190759 ) ) ( not ( = ?auto_190756 ?auto_190759 ) ) ( not ( = ?auto_190757 ?auto_190759 ) ) ( not ( = ?auto_190758 ?auto_190759 ) ) ( ON ?auto_190752 ?auto_190751 ) ( ON-TABLE ?auto_190759 ) ( ON ?auto_190753 ?auto_190752 ) ( ON ?auto_190754 ?auto_190753 ) ( CLEAR ?auto_190754 ) ( HOLDING ?auto_190755 ) ( CLEAR ?auto_190756 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190757 ?auto_190758 ?auto_190756 ?auto_190755 )
      ( MAKE-5PILE ?auto_190751 ?auto_190752 ?auto_190753 ?auto_190754 ?auto_190755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190760 - BLOCK
      ?auto_190761 - BLOCK
      ?auto_190762 - BLOCK
      ?auto_190763 - BLOCK
      ?auto_190764 - BLOCK
    )
    :vars
    (
      ?auto_190768 - BLOCK
      ?auto_190766 - BLOCK
      ?auto_190767 - BLOCK
      ?auto_190765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190760 ?auto_190761 ) ) ( not ( = ?auto_190760 ?auto_190762 ) ) ( not ( = ?auto_190760 ?auto_190763 ) ) ( not ( = ?auto_190760 ?auto_190764 ) ) ( not ( = ?auto_190761 ?auto_190762 ) ) ( not ( = ?auto_190761 ?auto_190763 ) ) ( not ( = ?auto_190761 ?auto_190764 ) ) ( not ( = ?auto_190762 ?auto_190763 ) ) ( not ( = ?auto_190762 ?auto_190764 ) ) ( not ( = ?auto_190763 ?auto_190764 ) ) ( not ( = ?auto_190760 ?auto_190768 ) ) ( not ( = ?auto_190761 ?auto_190768 ) ) ( not ( = ?auto_190762 ?auto_190768 ) ) ( not ( = ?auto_190763 ?auto_190768 ) ) ( not ( = ?auto_190764 ?auto_190768 ) ) ( ON-TABLE ?auto_190766 ) ( ON ?auto_190767 ?auto_190766 ) ( ON ?auto_190768 ?auto_190767 ) ( not ( = ?auto_190766 ?auto_190767 ) ) ( not ( = ?auto_190766 ?auto_190768 ) ) ( not ( = ?auto_190766 ?auto_190764 ) ) ( not ( = ?auto_190766 ?auto_190763 ) ) ( not ( = ?auto_190767 ?auto_190768 ) ) ( not ( = ?auto_190767 ?auto_190764 ) ) ( not ( = ?auto_190767 ?auto_190763 ) ) ( not ( = ?auto_190760 ?auto_190766 ) ) ( not ( = ?auto_190760 ?auto_190767 ) ) ( not ( = ?auto_190761 ?auto_190766 ) ) ( not ( = ?auto_190761 ?auto_190767 ) ) ( not ( = ?auto_190762 ?auto_190766 ) ) ( not ( = ?auto_190762 ?auto_190767 ) ) ( ON ?auto_190760 ?auto_190765 ) ( not ( = ?auto_190760 ?auto_190765 ) ) ( not ( = ?auto_190761 ?auto_190765 ) ) ( not ( = ?auto_190762 ?auto_190765 ) ) ( not ( = ?auto_190763 ?auto_190765 ) ) ( not ( = ?auto_190764 ?auto_190765 ) ) ( not ( = ?auto_190768 ?auto_190765 ) ) ( not ( = ?auto_190766 ?auto_190765 ) ) ( not ( = ?auto_190767 ?auto_190765 ) ) ( ON ?auto_190761 ?auto_190760 ) ( ON-TABLE ?auto_190765 ) ( ON ?auto_190762 ?auto_190761 ) ( ON ?auto_190763 ?auto_190762 ) ( CLEAR ?auto_190768 ) ( ON ?auto_190764 ?auto_190763 ) ( CLEAR ?auto_190764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190765 ?auto_190760 ?auto_190761 ?auto_190762 ?auto_190763 )
      ( MAKE-5PILE ?auto_190760 ?auto_190761 ?auto_190762 ?auto_190763 ?auto_190764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190769 - BLOCK
      ?auto_190770 - BLOCK
      ?auto_190771 - BLOCK
      ?auto_190772 - BLOCK
      ?auto_190773 - BLOCK
    )
    :vars
    (
      ?auto_190775 - BLOCK
      ?auto_190777 - BLOCK
      ?auto_190776 - BLOCK
      ?auto_190774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190769 ?auto_190770 ) ) ( not ( = ?auto_190769 ?auto_190771 ) ) ( not ( = ?auto_190769 ?auto_190772 ) ) ( not ( = ?auto_190769 ?auto_190773 ) ) ( not ( = ?auto_190770 ?auto_190771 ) ) ( not ( = ?auto_190770 ?auto_190772 ) ) ( not ( = ?auto_190770 ?auto_190773 ) ) ( not ( = ?auto_190771 ?auto_190772 ) ) ( not ( = ?auto_190771 ?auto_190773 ) ) ( not ( = ?auto_190772 ?auto_190773 ) ) ( not ( = ?auto_190769 ?auto_190775 ) ) ( not ( = ?auto_190770 ?auto_190775 ) ) ( not ( = ?auto_190771 ?auto_190775 ) ) ( not ( = ?auto_190772 ?auto_190775 ) ) ( not ( = ?auto_190773 ?auto_190775 ) ) ( ON-TABLE ?auto_190777 ) ( ON ?auto_190776 ?auto_190777 ) ( not ( = ?auto_190777 ?auto_190776 ) ) ( not ( = ?auto_190777 ?auto_190775 ) ) ( not ( = ?auto_190777 ?auto_190773 ) ) ( not ( = ?auto_190777 ?auto_190772 ) ) ( not ( = ?auto_190776 ?auto_190775 ) ) ( not ( = ?auto_190776 ?auto_190773 ) ) ( not ( = ?auto_190776 ?auto_190772 ) ) ( not ( = ?auto_190769 ?auto_190777 ) ) ( not ( = ?auto_190769 ?auto_190776 ) ) ( not ( = ?auto_190770 ?auto_190777 ) ) ( not ( = ?auto_190770 ?auto_190776 ) ) ( not ( = ?auto_190771 ?auto_190777 ) ) ( not ( = ?auto_190771 ?auto_190776 ) ) ( ON ?auto_190769 ?auto_190774 ) ( not ( = ?auto_190769 ?auto_190774 ) ) ( not ( = ?auto_190770 ?auto_190774 ) ) ( not ( = ?auto_190771 ?auto_190774 ) ) ( not ( = ?auto_190772 ?auto_190774 ) ) ( not ( = ?auto_190773 ?auto_190774 ) ) ( not ( = ?auto_190775 ?auto_190774 ) ) ( not ( = ?auto_190777 ?auto_190774 ) ) ( not ( = ?auto_190776 ?auto_190774 ) ) ( ON ?auto_190770 ?auto_190769 ) ( ON-TABLE ?auto_190774 ) ( ON ?auto_190771 ?auto_190770 ) ( ON ?auto_190772 ?auto_190771 ) ( ON ?auto_190773 ?auto_190772 ) ( CLEAR ?auto_190773 ) ( HOLDING ?auto_190775 ) ( CLEAR ?auto_190776 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190777 ?auto_190776 ?auto_190775 )
      ( MAKE-5PILE ?auto_190769 ?auto_190770 ?auto_190771 ?auto_190772 ?auto_190773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190778 - BLOCK
      ?auto_190779 - BLOCK
      ?auto_190780 - BLOCK
      ?auto_190781 - BLOCK
      ?auto_190782 - BLOCK
    )
    :vars
    (
      ?auto_190786 - BLOCK
      ?auto_190785 - BLOCK
      ?auto_190783 - BLOCK
      ?auto_190784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190778 ?auto_190779 ) ) ( not ( = ?auto_190778 ?auto_190780 ) ) ( not ( = ?auto_190778 ?auto_190781 ) ) ( not ( = ?auto_190778 ?auto_190782 ) ) ( not ( = ?auto_190779 ?auto_190780 ) ) ( not ( = ?auto_190779 ?auto_190781 ) ) ( not ( = ?auto_190779 ?auto_190782 ) ) ( not ( = ?auto_190780 ?auto_190781 ) ) ( not ( = ?auto_190780 ?auto_190782 ) ) ( not ( = ?auto_190781 ?auto_190782 ) ) ( not ( = ?auto_190778 ?auto_190786 ) ) ( not ( = ?auto_190779 ?auto_190786 ) ) ( not ( = ?auto_190780 ?auto_190786 ) ) ( not ( = ?auto_190781 ?auto_190786 ) ) ( not ( = ?auto_190782 ?auto_190786 ) ) ( ON-TABLE ?auto_190785 ) ( ON ?auto_190783 ?auto_190785 ) ( not ( = ?auto_190785 ?auto_190783 ) ) ( not ( = ?auto_190785 ?auto_190786 ) ) ( not ( = ?auto_190785 ?auto_190782 ) ) ( not ( = ?auto_190785 ?auto_190781 ) ) ( not ( = ?auto_190783 ?auto_190786 ) ) ( not ( = ?auto_190783 ?auto_190782 ) ) ( not ( = ?auto_190783 ?auto_190781 ) ) ( not ( = ?auto_190778 ?auto_190785 ) ) ( not ( = ?auto_190778 ?auto_190783 ) ) ( not ( = ?auto_190779 ?auto_190785 ) ) ( not ( = ?auto_190779 ?auto_190783 ) ) ( not ( = ?auto_190780 ?auto_190785 ) ) ( not ( = ?auto_190780 ?auto_190783 ) ) ( ON ?auto_190778 ?auto_190784 ) ( not ( = ?auto_190778 ?auto_190784 ) ) ( not ( = ?auto_190779 ?auto_190784 ) ) ( not ( = ?auto_190780 ?auto_190784 ) ) ( not ( = ?auto_190781 ?auto_190784 ) ) ( not ( = ?auto_190782 ?auto_190784 ) ) ( not ( = ?auto_190786 ?auto_190784 ) ) ( not ( = ?auto_190785 ?auto_190784 ) ) ( not ( = ?auto_190783 ?auto_190784 ) ) ( ON ?auto_190779 ?auto_190778 ) ( ON-TABLE ?auto_190784 ) ( ON ?auto_190780 ?auto_190779 ) ( ON ?auto_190781 ?auto_190780 ) ( ON ?auto_190782 ?auto_190781 ) ( CLEAR ?auto_190783 ) ( ON ?auto_190786 ?auto_190782 ) ( CLEAR ?auto_190786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190784 ?auto_190778 ?auto_190779 ?auto_190780 ?auto_190781 ?auto_190782 )
      ( MAKE-5PILE ?auto_190778 ?auto_190779 ?auto_190780 ?auto_190781 ?auto_190782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190787 - BLOCK
      ?auto_190788 - BLOCK
      ?auto_190789 - BLOCK
      ?auto_190790 - BLOCK
      ?auto_190791 - BLOCK
    )
    :vars
    (
      ?auto_190794 - BLOCK
      ?auto_190792 - BLOCK
      ?auto_190793 - BLOCK
      ?auto_190795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190787 ?auto_190788 ) ) ( not ( = ?auto_190787 ?auto_190789 ) ) ( not ( = ?auto_190787 ?auto_190790 ) ) ( not ( = ?auto_190787 ?auto_190791 ) ) ( not ( = ?auto_190788 ?auto_190789 ) ) ( not ( = ?auto_190788 ?auto_190790 ) ) ( not ( = ?auto_190788 ?auto_190791 ) ) ( not ( = ?auto_190789 ?auto_190790 ) ) ( not ( = ?auto_190789 ?auto_190791 ) ) ( not ( = ?auto_190790 ?auto_190791 ) ) ( not ( = ?auto_190787 ?auto_190794 ) ) ( not ( = ?auto_190788 ?auto_190794 ) ) ( not ( = ?auto_190789 ?auto_190794 ) ) ( not ( = ?auto_190790 ?auto_190794 ) ) ( not ( = ?auto_190791 ?auto_190794 ) ) ( ON-TABLE ?auto_190792 ) ( not ( = ?auto_190792 ?auto_190793 ) ) ( not ( = ?auto_190792 ?auto_190794 ) ) ( not ( = ?auto_190792 ?auto_190791 ) ) ( not ( = ?auto_190792 ?auto_190790 ) ) ( not ( = ?auto_190793 ?auto_190794 ) ) ( not ( = ?auto_190793 ?auto_190791 ) ) ( not ( = ?auto_190793 ?auto_190790 ) ) ( not ( = ?auto_190787 ?auto_190792 ) ) ( not ( = ?auto_190787 ?auto_190793 ) ) ( not ( = ?auto_190788 ?auto_190792 ) ) ( not ( = ?auto_190788 ?auto_190793 ) ) ( not ( = ?auto_190789 ?auto_190792 ) ) ( not ( = ?auto_190789 ?auto_190793 ) ) ( ON ?auto_190787 ?auto_190795 ) ( not ( = ?auto_190787 ?auto_190795 ) ) ( not ( = ?auto_190788 ?auto_190795 ) ) ( not ( = ?auto_190789 ?auto_190795 ) ) ( not ( = ?auto_190790 ?auto_190795 ) ) ( not ( = ?auto_190791 ?auto_190795 ) ) ( not ( = ?auto_190794 ?auto_190795 ) ) ( not ( = ?auto_190792 ?auto_190795 ) ) ( not ( = ?auto_190793 ?auto_190795 ) ) ( ON ?auto_190788 ?auto_190787 ) ( ON-TABLE ?auto_190795 ) ( ON ?auto_190789 ?auto_190788 ) ( ON ?auto_190790 ?auto_190789 ) ( ON ?auto_190791 ?auto_190790 ) ( ON ?auto_190794 ?auto_190791 ) ( CLEAR ?auto_190794 ) ( HOLDING ?auto_190793 ) ( CLEAR ?auto_190792 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190792 ?auto_190793 )
      ( MAKE-5PILE ?auto_190787 ?auto_190788 ?auto_190789 ?auto_190790 ?auto_190791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190796 - BLOCK
      ?auto_190797 - BLOCK
      ?auto_190798 - BLOCK
      ?auto_190799 - BLOCK
      ?auto_190800 - BLOCK
    )
    :vars
    (
      ?auto_190801 - BLOCK
      ?auto_190803 - BLOCK
      ?auto_190804 - BLOCK
      ?auto_190802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190796 ?auto_190797 ) ) ( not ( = ?auto_190796 ?auto_190798 ) ) ( not ( = ?auto_190796 ?auto_190799 ) ) ( not ( = ?auto_190796 ?auto_190800 ) ) ( not ( = ?auto_190797 ?auto_190798 ) ) ( not ( = ?auto_190797 ?auto_190799 ) ) ( not ( = ?auto_190797 ?auto_190800 ) ) ( not ( = ?auto_190798 ?auto_190799 ) ) ( not ( = ?auto_190798 ?auto_190800 ) ) ( not ( = ?auto_190799 ?auto_190800 ) ) ( not ( = ?auto_190796 ?auto_190801 ) ) ( not ( = ?auto_190797 ?auto_190801 ) ) ( not ( = ?auto_190798 ?auto_190801 ) ) ( not ( = ?auto_190799 ?auto_190801 ) ) ( not ( = ?auto_190800 ?auto_190801 ) ) ( ON-TABLE ?auto_190803 ) ( not ( = ?auto_190803 ?auto_190804 ) ) ( not ( = ?auto_190803 ?auto_190801 ) ) ( not ( = ?auto_190803 ?auto_190800 ) ) ( not ( = ?auto_190803 ?auto_190799 ) ) ( not ( = ?auto_190804 ?auto_190801 ) ) ( not ( = ?auto_190804 ?auto_190800 ) ) ( not ( = ?auto_190804 ?auto_190799 ) ) ( not ( = ?auto_190796 ?auto_190803 ) ) ( not ( = ?auto_190796 ?auto_190804 ) ) ( not ( = ?auto_190797 ?auto_190803 ) ) ( not ( = ?auto_190797 ?auto_190804 ) ) ( not ( = ?auto_190798 ?auto_190803 ) ) ( not ( = ?auto_190798 ?auto_190804 ) ) ( ON ?auto_190796 ?auto_190802 ) ( not ( = ?auto_190796 ?auto_190802 ) ) ( not ( = ?auto_190797 ?auto_190802 ) ) ( not ( = ?auto_190798 ?auto_190802 ) ) ( not ( = ?auto_190799 ?auto_190802 ) ) ( not ( = ?auto_190800 ?auto_190802 ) ) ( not ( = ?auto_190801 ?auto_190802 ) ) ( not ( = ?auto_190803 ?auto_190802 ) ) ( not ( = ?auto_190804 ?auto_190802 ) ) ( ON ?auto_190797 ?auto_190796 ) ( ON-TABLE ?auto_190802 ) ( ON ?auto_190798 ?auto_190797 ) ( ON ?auto_190799 ?auto_190798 ) ( ON ?auto_190800 ?auto_190799 ) ( ON ?auto_190801 ?auto_190800 ) ( CLEAR ?auto_190803 ) ( ON ?auto_190804 ?auto_190801 ) ( CLEAR ?auto_190804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190802 ?auto_190796 ?auto_190797 ?auto_190798 ?auto_190799 ?auto_190800 ?auto_190801 )
      ( MAKE-5PILE ?auto_190796 ?auto_190797 ?auto_190798 ?auto_190799 ?auto_190800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190805 - BLOCK
      ?auto_190806 - BLOCK
      ?auto_190807 - BLOCK
      ?auto_190808 - BLOCK
      ?auto_190809 - BLOCK
    )
    :vars
    (
      ?auto_190813 - BLOCK
      ?auto_190810 - BLOCK
      ?auto_190812 - BLOCK
      ?auto_190811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190805 ?auto_190806 ) ) ( not ( = ?auto_190805 ?auto_190807 ) ) ( not ( = ?auto_190805 ?auto_190808 ) ) ( not ( = ?auto_190805 ?auto_190809 ) ) ( not ( = ?auto_190806 ?auto_190807 ) ) ( not ( = ?auto_190806 ?auto_190808 ) ) ( not ( = ?auto_190806 ?auto_190809 ) ) ( not ( = ?auto_190807 ?auto_190808 ) ) ( not ( = ?auto_190807 ?auto_190809 ) ) ( not ( = ?auto_190808 ?auto_190809 ) ) ( not ( = ?auto_190805 ?auto_190813 ) ) ( not ( = ?auto_190806 ?auto_190813 ) ) ( not ( = ?auto_190807 ?auto_190813 ) ) ( not ( = ?auto_190808 ?auto_190813 ) ) ( not ( = ?auto_190809 ?auto_190813 ) ) ( not ( = ?auto_190810 ?auto_190812 ) ) ( not ( = ?auto_190810 ?auto_190813 ) ) ( not ( = ?auto_190810 ?auto_190809 ) ) ( not ( = ?auto_190810 ?auto_190808 ) ) ( not ( = ?auto_190812 ?auto_190813 ) ) ( not ( = ?auto_190812 ?auto_190809 ) ) ( not ( = ?auto_190812 ?auto_190808 ) ) ( not ( = ?auto_190805 ?auto_190810 ) ) ( not ( = ?auto_190805 ?auto_190812 ) ) ( not ( = ?auto_190806 ?auto_190810 ) ) ( not ( = ?auto_190806 ?auto_190812 ) ) ( not ( = ?auto_190807 ?auto_190810 ) ) ( not ( = ?auto_190807 ?auto_190812 ) ) ( ON ?auto_190805 ?auto_190811 ) ( not ( = ?auto_190805 ?auto_190811 ) ) ( not ( = ?auto_190806 ?auto_190811 ) ) ( not ( = ?auto_190807 ?auto_190811 ) ) ( not ( = ?auto_190808 ?auto_190811 ) ) ( not ( = ?auto_190809 ?auto_190811 ) ) ( not ( = ?auto_190813 ?auto_190811 ) ) ( not ( = ?auto_190810 ?auto_190811 ) ) ( not ( = ?auto_190812 ?auto_190811 ) ) ( ON ?auto_190806 ?auto_190805 ) ( ON-TABLE ?auto_190811 ) ( ON ?auto_190807 ?auto_190806 ) ( ON ?auto_190808 ?auto_190807 ) ( ON ?auto_190809 ?auto_190808 ) ( ON ?auto_190813 ?auto_190809 ) ( ON ?auto_190812 ?auto_190813 ) ( CLEAR ?auto_190812 ) ( HOLDING ?auto_190810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190810 )
      ( MAKE-5PILE ?auto_190805 ?auto_190806 ?auto_190807 ?auto_190808 ?auto_190809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190814 - BLOCK
      ?auto_190815 - BLOCK
      ?auto_190816 - BLOCK
      ?auto_190817 - BLOCK
      ?auto_190818 - BLOCK
    )
    :vars
    (
      ?auto_190822 - BLOCK
      ?auto_190819 - BLOCK
      ?auto_190821 - BLOCK
      ?auto_190820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190814 ?auto_190815 ) ) ( not ( = ?auto_190814 ?auto_190816 ) ) ( not ( = ?auto_190814 ?auto_190817 ) ) ( not ( = ?auto_190814 ?auto_190818 ) ) ( not ( = ?auto_190815 ?auto_190816 ) ) ( not ( = ?auto_190815 ?auto_190817 ) ) ( not ( = ?auto_190815 ?auto_190818 ) ) ( not ( = ?auto_190816 ?auto_190817 ) ) ( not ( = ?auto_190816 ?auto_190818 ) ) ( not ( = ?auto_190817 ?auto_190818 ) ) ( not ( = ?auto_190814 ?auto_190822 ) ) ( not ( = ?auto_190815 ?auto_190822 ) ) ( not ( = ?auto_190816 ?auto_190822 ) ) ( not ( = ?auto_190817 ?auto_190822 ) ) ( not ( = ?auto_190818 ?auto_190822 ) ) ( not ( = ?auto_190819 ?auto_190821 ) ) ( not ( = ?auto_190819 ?auto_190822 ) ) ( not ( = ?auto_190819 ?auto_190818 ) ) ( not ( = ?auto_190819 ?auto_190817 ) ) ( not ( = ?auto_190821 ?auto_190822 ) ) ( not ( = ?auto_190821 ?auto_190818 ) ) ( not ( = ?auto_190821 ?auto_190817 ) ) ( not ( = ?auto_190814 ?auto_190819 ) ) ( not ( = ?auto_190814 ?auto_190821 ) ) ( not ( = ?auto_190815 ?auto_190819 ) ) ( not ( = ?auto_190815 ?auto_190821 ) ) ( not ( = ?auto_190816 ?auto_190819 ) ) ( not ( = ?auto_190816 ?auto_190821 ) ) ( ON ?auto_190814 ?auto_190820 ) ( not ( = ?auto_190814 ?auto_190820 ) ) ( not ( = ?auto_190815 ?auto_190820 ) ) ( not ( = ?auto_190816 ?auto_190820 ) ) ( not ( = ?auto_190817 ?auto_190820 ) ) ( not ( = ?auto_190818 ?auto_190820 ) ) ( not ( = ?auto_190822 ?auto_190820 ) ) ( not ( = ?auto_190819 ?auto_190820 ) ) ( not ( = ?auto_190821 ?auto_190820 ) ) ( ON ?auto_190815 ?auto_190814 ) ( ON-TABLE ?auto_190820 ) ( ON ?auto_190816 ?auto_190815 ) ( ON ?auto_190817 ?auto_190816 ) ( ON ?auto_190818 ?auto_190817 ) ( ON ?auto_190822 ?auto_190818 ) ( ON ?auto_190821 ?auto_190822 ) ( ON ?auto_190819 ?auto_190821 ) ( CLEAR ?auto_190819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190820 ?auto_190814 ?auto_190815 ?auto_190816 ?auto_190817 ?auto_190818 ?auto_190822 ?auto_190821 )
      ( MAKE-5PILE ?auto_190814 ?auto_190815 ?auto_190816 ?auto_190817 ?auto_190818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190838 - BLOCK
      ?auto_190839 - BLOCK
    )
    :vars
    (
      ?auto_190841 - BLOCK
      ?auto_190842 - BLOCK
      ?auto_190840 - BLOCK
      ?auto_190845 - BLOCK
      ?auto_190843 - BLOCK
      ?auto_190844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190841 ?auto_190839 ) ( ON-TABLE ?auto_190838 ) ( ON ?auto_190839 ?auto_190838 ) ( not ( = ?auto_190838 ?auto_190839 ) ) ( not ( = ?auto_190838 ?auto_190841 ) ) ( not ( = ?auto_190839 ?auto_190841 ) ) ( not ( = ?auto_190838 ?auto_190842 ) ) ( not ( = ?auto_190838 ?auto_190840 ) ) ( not ( = ?auto_190839 ?auto_190842 ) ) ( not ( = ?auto_190839 ?auto_190840 ) ) ( not ( = ?auto_190841 ?auto_190842 ) ) ( not ( = ?auto_190841 ?auto_190840 ) ) ( not ( = ?auto_190842 ?auto_190840 ) ) ( ON ?auto_190842 ?auto_190841 ) ( CLEAR ?auto_190842 ) ( HOLDING ?auto_190840 ) ( CLEAR ?auto_190845 ) ( ON-TABLE ?auto_190843 ) ( ON ?auto_190844 ?auto_190843 ) ( ON ?auto_190845 ?auto_190844 ) ( not ( = ?auto_190843 ?auto_190844 ) ) ( not ( = ?auto_190843 ?auto_190845 ) ) ( not ( = ?auto_190843 ?auto_190840 ) ) ( not ( = ?auto_190844 ?auto_190845 ) ) ( not ( = ?auto_190844 ?auto_190840 ) ) ( not ( = ?auto_190845 ?auto_190840 ) ) ( not ( = ?auto_190838 ?auto_190845 ) ) ( not ( = ?auto_190838 ?auto_190843 ) ) ( not ( = ?auto_190838 ?auto_190844 ) ) ( not ( = ?auto_190839 ?auto_190845 ) ) ( not ( = ?auto_190839 ?auto_190843 ) ) ( not ( = ?auto_190839 ?auto_190844 ) ) ( not ( = ?auto_190841 ?auto_190845 ) ) ( not ( = ?auto_190841 ?auto_190843 ) ) ( not ( = ?auto_190841 ?auto_190844 ) ) ( not ( = ?auto_190842 ?auto_190845 ) ) ( not ( = ?auto_190842 ?auto_190843 ) ) ( not ( = ?auto_190842 ?auto_190844 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190843 ?auto_190844 ?auto_190845 ?auto_190840 )
      ( MAKE-2PILE ?auto_190838 ?auto_190839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190846 - BLOCK
      ?auto_190847 - BLOCK
    )
    :vars
    (
      ?auto_190851 - BLOCK
      ?auto_190852 - BLOCK
      ?auto_190853 - BLOCK
      ?auto_190849 - BLOCK
      ?auto_190848 - BLOCK
      ?auto_190850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190851 ?auto_190847 ) ( ON-TABLE ?auto_190846 ) ( ON ?auto_190847 ?auto_190846 ) ( not ( = ?auto_190846 ?auto_190847 ) ) ( not ( = ?auto_190846 ?auto_190851 ) ) ( not ( = ?auto_190847 ?auto_190851 ) ) ( not ( = ?auto_190846 ?auto_190852 ) ) ( not ( = ?auto_190846 ?auto_190853 ) ) ( not ( = ?auto_190847 ?auto_190852 ) ) ( not ( = ?auto_190847 ?auto_190853 ) ) ( not ( = ?auto_190851 ?auto_190852 ) ) ( not ( = ?auto_190851 ?auto_190853 ) ) ( not ( = ?auto_190852 ?auto_190853 ) ) ( ON ?auto_190852 ?auto_190851 ) ( CLEAR ?auto_190849 ) ( ON-TABLE ?auto_190848 ) ( ON ?auto_190850 ?auto_190848 ) ( ON ?auto_190849 ?auto_190850 ) ( not ( = ?auto_190848 ?auto_190850 ) ) ( not ( = ?auto_190848 ?auto_190849 ) ) ( not ( = ?auto_190848 ?auto_190853 ) ) ( not ( = ?auto_190850 ?auto_190849 ) ) ( not ( = ?auto_190850 ?auto_190853 ) ) ( not ( = ?auto_190849 ?auto_190853 ) ) ( not ( = ?auto_190846 ?auto_190849 ) ) ( not ( = ?auto_190846 ?auto_190848 ) ) ( not ( = ?auto_190846 ?auto_190850 ) ) ( not ( = ?auto_190847 ?auto_190849 ) ) ( not ( = ?auto_190847 ?auto_190848 ) ) ( not ( = ?auto_190847 ?auto_190850 ) ) ( not ( = ?auto_190851 ?auto_190849 ) ) ( not ( = ?auto_190851 ?auto_190848 ) ) ( not ( = ?auto_190851 ?auto_190850 ) ) ( not ( = ?auto_190852 ?auto_190849 ) ) ( not ( = ?auto_190852 ?auto_190848 ) ) ( not ( = ?auto_190852 ?auto_190850 ) ) ( ON ?auto_190853 ?auto_190852 ) ( CLEAR ?auto_190853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190846 ?auto_190847 ?auto_190851 ?auto_190852 )
      ( MAKE-2PILE ?auto_190846 ?auto_190847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190854 - BLOCK
      ?auto_190855 - BLOCK
    )
    :vars
    (
      ?auto_190858 - BLOCK
      ?auto_190860 - BLOCK
      ?auto_190856 - BLOCK
      ?auto_190857 - BLOCK
      ?auto_190861 - BLOCK
      ?auto_190859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190858 ?auto_190855 ) ( ON-TABLE ?auto_190854 ) ( ON ?auto_190855 ?auto_190854 ) ( not ( = ?auto_190854 ?auto_190855 ) ) ( not ( = ?auto_190854 ?auto_190858 ) ) ( not ( = ?auto_190855 ?auto_190858 ) ) ( not ( = ?auto_190854 ?auto_190860 ) ) ( not ( = ?auto_190854 ?auto_190856 ) ) ( not ( = ?auto_190855 ?auto_190860 ) ) ( not ( = ?auto_190855 ?auto_190856 ) ) ( not ( = ?auto_190858 ?auto_190860 ) ) ( not ( = ?auto_190858 ?auto_190856 ) ) ( not ( = ?auto_190860 ?auto_190856 ) ) ( ON ?auto_190860 ?auto_190858 ) ( ON-TABLE ?auto_190857 ) ( ON ?auto_190861 ?auto_190857 ) ( not ( = ?auto_190857 ?auto_190861 ) ) ( not ( = ?auto_190857 ?auto_190859 ) ) ( not ( = ?auto_190857 ?auto_190856 ) ) ( not ( = ?auto_190861 ?auto_190859 ) ) ( not ( = ?auto_190861 ?auto_190856 ) ) ( not ( = ?auto_190859 ?auto_190856 ) ) ( not ( = ?auto_190854 ?auto_190859 ) ) ( not ( = ?auto_190854 ?auto_190857 ) ) ( not ( = ?auto_190854 ?auto_190861 ) ) ( not ( = ?auto_190855 ?auto_190859 ) ) ( not ( = ?auto_190855 ?auto_190857 ) ) ( not ( = ?auto_190855 ?auto_190861 ) ) ( not ( = ?auto_190858 ?auto_190859 ) ) ( not ( = ?auto_190858 ?auto_190857 ) ) ( not ( = ?auto_190858 ?auto_190861 ) ) ( not ( = ?auto_190860 ?auto_190859 ) ) ( not ( = ?auto_190860 ?auto_190857 ) ) ( not ( = ?auto_190860 ?auto_190861 ) ) ( ON ?auto_190856 ?auto_190860 ) ( CLEAR ?auto_190856 ) ( HOLDING ?auto_190859 ) ( CLEAR ?auto_190861 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190857 ?auto_190861 ?auto_190859 )
      ( MAKE-2PILE ?auto_190854 ?auto_190855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190862 - BLOCK
      ?auto_190863 - BLOCK
    )
    :vars
    (
      ?auto_190868 - BLOCK
      ?auto_190865 - BLOCK
      ?auto_190867 - BLOCK
      ?auto_190866 - BLOCK
      ?auto_190864 - BLOCK
      ?auto_190869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190868 ?auto_190863 ) ( ON-TABLE ?auto_190862 ) ( ON ?auto_190863 ?auto_190862 ) ( not ( = ?auto_190862 ?auto_190863 ) ) ( not ( = ?auto_190862 ?auto_190868 ) ) ( not ( = ?auto_190863 ?auto_190868 ) ) ( not ( = ?auto_190862 ?auto_190865 ) ) ( not ( = ?auto_190862 ?auto_190867 ) ) ( not ( = ?auto_190863 ?auto_190865 ) ) ( not ( = ?auto_190863 ?auto_190867 ) ) ( not ( = ?auto_190868 ?auto_190865 ) ) ( not ( = ?auto_190868 ?auto_190867 ) ) ( not ( = ?auto_190865 ?auto_190867 ) ) ( ON ?auto_190865 ?auto_190868 ) ( ON-TABLE ?auto_190866 ) ( ON ?auto_190864 ?auto_190866 ) ( not ( = ?auto_190866 ?auto_190864 ) ) ( not ( = ?auto_190866 ?auto_190869 ) ) ( not ( = ?auto_190866 ?auto_190867 ) ) ( not ( = ?auto_190864 ?auto_190869 ) ) ( not ( = ?auto_190864 ?auto_190867 ) ) ( not ( = ?auto_190869 ?auto_190867 ) ) ( not ( = ?auto_190862 ?auto_190869 ) ) ( not ( = ?auto_190862 ?auto_190866 ) ) ( not ( = ?auto_190862 ?auto_190864 ) ) ( not ( = ?auto_190863 ?auto_190869 ) ) ( not ( = ?auto_190863 ?auto_190866 ) ) ( not ( = ?auto_190863 ?auto_190864 ) ) ( not ( = ?auto_190868 ?auto_190869 ) ) ( not ( = ?auto_190868 ?auto_190866 ) ) ( not ( = ?auto_190868 ?auto_190864 ) ) ( not ( = ?auto_190865 ?auto_190869 ) ) ( not ( = ?auto_190865 ?auto_190866 ) ) ( not ( = ?auto_190865 ?auto_190864 ) ) ( ON ?auto_190867 ?auto_190865 ) ( CLEAR ?auto_190864 ) ( ON ?auto_190869 ?auto_190867 ) ( CLEAR ?auto_190869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190862 ?auto_190863 ?auto_190868 ?auto_190865 ?auto_190867 )
      ( MAKE-2PILE ?auto_190862 ?auto_190863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190870 - BLOCK
      ?auto_190871 - BLOCK
    )
    :vars
    (
      ?auto_190876 - BLOCK
      ?auto_190874 - BLOCK
      ?auto_190872 - BLOCK
      ?auto_190875 - BLOCK
      ?auto_190873 - BLOCK
      ?auto_190877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190876 ?auto_190871 ) ( ON-TABLE ?auto_190870 ) ( ON ?auto_190871 ?auto_190870 ) ( not ( = ?auto_190870 ?auto_190871 ) ) ( not ( = ?auto_190870 ?auto_190876 ) ) ( not ( = ?auto_190871 ?auto_190876 ) ) ( not ( = ?auto_190870 ?auto_190874 ) ) ( not ( = ?auto_190870 ?auto_190872 ) ) ( not ( = ?auto_190871 ?auto_190874 ) ) ( not ( = ?auto_190871 ?auto_190872 ) ) ( not ( = ?auto_190876 ?auto_190874 ) ) ( not ( = ?auto_190876 ?auto_190872 ) ) ( not ( = ?auto_190874 ?auto_190872 ) ) ( ON ?auto_190874 ?auto_190876 ) ( ON-TABLE ?auto_190875 ) ( not ( = ?auto_190875 ?auto_190873 ) ) ( not ( = ?auto_190875 ?auto_190877 ) ) ( not ( = ?auto_190875 ?auto_190872 ) ) ( not ( = ?auto_190873 ?auto_190877 ) ) ( not ( = ?auto_190873 ?auto_190872 ) ) ( not ( = ?auto_190877 ?auto_190872 ) ) ( not ( = ?auto_190870 ?auto_190877 ) ) ( not ( = ?auto_190870 ?auto_190875 ) ) ( not ( = ?auto_190870 ?auto_190873 ) ) ( not ( = ?auto_190871 ?auto_190877 ) ) ( not ( = ?auto_190871 ?auto_190875 ) ) ( not ( = ?auto_190871 ?auto_190873 ) ) ( not ( = ?auto_190876 ?auto_190877 ) ) ( not ( = ?auto_190876 ?auto_190875 ) ) ( not ( = ?auto_190876 ?auto_190873 ) ) ( not ( = ?auto_190874 ?auto_190877 ) ) ( not ( = ?auto_190874 ?auto_190875 ) ) ( not ( = ?auto_190874 ?auto_190873 ) ) ( ON ?auto_190872 ?auto_190874 ) ( ON ?auto_190877 ?auto_190872 ) ( CLEAR ?auto_190877 ) ( HOLDING ?auto_190873 ) ( CLEAR ?auto_190875 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190875 ?auto_190873 )
      ( MAKE-2PILE ?auto_190870 ?auto_190871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190878 - BLOCK
      ?auto_190879 - BLOCK
    )
    :vars
    (
      ?auto_190884 - BLOCK
      ?auto_190880 - BLOCK
      ?auto_190881 - BLOCK
      ?auto_190882 - BLOCK
      ?auto_190885 - BLOCK
      ?auto_190883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190884 ?auto_190879 ) ( ON-TABLE ?auto_190878 ) ( ON ?auto_190879 ?auto_190878 ) ( not ( = ?auto_190878 ?auto_190879 ) ) ( not ( = ?auto_190878 ?auto_190884 ) ) ( not ( = ?auto_190879 ?auto_190884 ) ) ( not ( = ?auto_190878 ?auto_190880 ) ) ( not ( = ?auto_190878 ?auto_190881 ) ) ( not ( = ?auto_190879 ?auto_190880 ) ) ( not ( = ?auto_190879 ?auto_190881 ) ) ( not ( = ?auto_190884 ?auto_190880 ) ) ( not ( = ?auto_190884 ?auto_190881 ) ) ( not ( = ?auto_190880 ?auto_190881 ) ) ( ON ?auto_190880 ?auto_190884 ) ( ON-TABLE ?auto_190882 ) ( not ( = ?auto_190882 ?auto_190885 ) ) ( not ( = ?auto_190882 ?auto_190883 ) ) ( not ( = ?auto_190882 ?auto_190881 ) ) ( not ( = ?auto_190885 ?auto_190883 ) ) ( not ( = ?auto_190885 ?auto_190881 ) ) ( not ( = ?auto_190883 ?auto_190881 ) ) ( not ( = ?auto_190878 ?auto_190883 ) ) ( not ( = ?auto_190878 ?auto_190882 ) ) ( not ( = ?auto_190878 ?auto_190885 ) ) ( not ( = ?auto_190879 ?auto_190883 ) ) ( not ( = ?auto_190879 ?auto_190882 ) ) ( not ( = ?auto_190879 ?auto_190885 ) ) ( not ( = ?auto_190884 ?auto_190883 ) ) ( not ( = ?auto_190884 ?auto_190882 ) ) ( not ( = ?auto_190884 ?auto_190885 ) ) ( not ( = ?auto_190880 ?auto_190883 ) ) ( not ( = ?auto_190880 ?auto_190882 ) ) ( not ( = ?auto_190880 ?auto_190885 ) ) ( ON ?auto_190881 ?auto_190880 ) ( ON ?auto_190883 ?auto_190881 ) ( CLEAR ?auto_190882 ) ( ON ?auto_190885 ?auto_190883 ) ( CLEAR ?auto_190885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190878 ?auto_190879 ?auto_190884 ?auto_190880 ?auto_190881 ?auto_190883 )
      ( MAKE-2PILE ?auto_190878 ?auto_190879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190886 - BLOCK
      ?auto_190887 - BLOCK
    )
    :vars
    (
      ?auto_190893 - BLOCK
      ?auto_190890 - BLOCK
      ?auto_190891 - BLOCK
      ?auto_190888 - BLOCK
      ?auto_190892 - BLOCK
      ?auto_190889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190893 ?auto_190887 ) ( ON-TABLE ?auto_190886 ) ( ON ?auto_190887 ?auto_190886 ) ( not ( = ?auto_190886 ?auto_190887 ) ) ( not ( = ?auto_190886 ?auto_190893 ) ) ( not ( = ?auto_190887 ?auto_190893 ) ) ( not ( = ?auto_190886 ?auto_190890 ) ) ( not ( = ?auto_190886 ?auto_190891 ) ) ( not ( = ?auto_190887 ?auto_190890 ) ) ( not ( = ?auto_190887 ?auto_190891 ) ) ( not ( = ?auto_190893 ?auto_190890 ) ) ( not ( = ?auto_190893 ?auto_190891 ) ) ( not ( = ?auto_190890 ?auto_190891 ) ) ( ON ?auto_190890 ?auto_190893 ) ( not ( = ?auto_190888 ?auto_190892 ) ) ( not ( = ?auto_190888 ?auto_190889 ) ) ( not ( = ?auto_190888 ?auto_190891 ) ) ( not ( = ?auto_190892 ?auto_190889 ) ) ( not ( = ?auto_190892 ?auto_190891 ) ) ( not ( = ?auto_190889 ?auto_190891 ) ) ( not ( = ?auto_190886 ?auto_190889 ) ) ( not ( = ?auto_190886 ?auto_190888 ) ) ( not ( = ?auto_190886 ?auto_190892 ) ) ( not ( = ?auto_190887 ?auto_190889 ) ) ( not ( = ?auto_190887 ?auto_190888 ) ) ( not ( = ?auto_190887 ?auto_190892 ) ) ( not ( = ?auto_190893 ?auto_190889 ) ) ( not ( = ?auto_190893 ?auto_190888 ) ) ( not ( = ?auto_190893 ?auto_190892 ) ) ( not ( = ?auto_190890 ?auto_190889 ) ) ( not ( = ?auto_190890 ?auto_190888 ) ) ( not ( = ?auto_190890 ?auto_190892 ) ) ( ON ?auto_190891 ?auto_190890 ) ( ON ?auto_190889 ?auto_190891 ) ( ON ?auto_190892 ?auto_190889 ) ( CLEAR ?auto_190892 ) ( HOLDING ?auto_190888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190888 )
      ( MAKE-2PILE ?auto_190886 ?auto_190887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190904 - BLOCK
      ?auto_190905 - BLOCK
    )
    :vars
    (
      ?auto_190907 - BLOCK
      ?auto_190911 - BLOCK
      ?auto_190910 - BLOCK
      ?auto_190909 - BLOCK
      ?auto_190906 - BLOCK
      ?auto_190908 - BLOCK
      ?auto_190912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190907 ?auto_190905 ) ( ON-TABLE ?auto_190904 ) ( ON ?auto_190905 ?auto_190904 ) ( not ( = ?auto_190904 ?auto_190905 ) ) ( not ( = ?auto_190904 ?auto_190907 ) ) ( not ( = ?auto_190905 ?auto_190907 ) ) ( not ( = ?auto_190904 ?auto_190911 ) ) ( not ( = ?auto_190904 ?auto_190910 ) ) ( not ( = ?auto_190905 ?auto_190911 ) ) ( not ( = ?auto_190905 ?auto_190910 ) ) ( not ( = ?auto_190907 ?auto_190911 ) ) ( not ( = ?auto_190907 ?auto_190910 ) ) ( not ( = ?auto_190911 ?auto_190910 ) ) ( ON ?auto_190911 ?auto_190907 ) ( not ( = ?auto_190909 ?auto_190906 ) ) ( not ( = ?auto_190909 ?auto_190908 ) ) ( not ( = ?auto_190909 ?auto_190910 ) ) ( not ( = ?auto_190906 ?auto_190908 ) ) ( not ( = ?auto_190906 ?auto_190910 ) ) ( not ( = ?auto_190908 ?auto_190910 ) ) ( not ( = ?auto_190904 ?auto_190908 ) ) ( not ( = ?auto_190904 ?auto_190909 ) ) ( not ( = ?auto_190904 ?auto_190906 ) ) ( not ( = ?auto_190905 ?auto_190908 ) ) ( not ( = ?auto_190905 ?auto_190909 ) ) ( not ( = ?auto_190905 ?auto_190906 ) ) ( not ( = ?auto_190907 ?auto_190908 ) ) ( not ( = ?auto_190907 ?auto_190909 ) ) ( not ( = ?auto_190907 ?auto_190906 ) ) ( not ( = ?auto_190911 ?auto_190908 ) ) ( not ( = ?auto_190911 ?auto_190909 ) ) ( not ( = ?auto_190911 ?auto_190906 ) ) ( ON ?auto_190910 ?auto_190911 ) ( ON ?auto_190908 ?auto_190910 ) ( ON ?auto_190906 ?auto_190908 ) ( CLEAR ?auto_190906 ) ( ON ?auto_190909 ?auto_190912 ) ( CLEAR ?auto_190909 ) ( HAND-EMPTY ) ( not ( = ?auto_190904 ?auto_190912 ) ) ( not ( = ?auto_190905 ?auto_190912 ) ) ( not ( = ?auto_190907 ?auto_190912 ) ) ( not ( = ?auto_190911 ?auto_190912 ) ) ( not ( = ?auto_190910 ?auto_190912 ) ) ( not ( = ?auto_190909 ?auto_190912 ) ) ( not ( = ?auto_190906 ?auto_190912 ) ) ( not ( = ?auto_190908 ?auto_190912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190909 ?auto_190912 )
      ( MAKE-2PILE ?auto_190904 ?auto_190905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190913 - BLOCK
      ?auto_190914 - BLOCK
    )
    :vars
    (
      ?auto_190917 - BLOCK
      ?auto_190921 - BLOCK
      ?auto_190915 - BLOCK
      ?auto_190918 - BLOCK
      ?auto_190916 - BLOCK
      ?auto_190920 - BLOCK
      ?auto_190919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190917 ?auto_190914 ) ( ON-TABLE ?auto_190913 ) ( ON ?auto_190914 ?auto_190913 ) ( not ( = ?auto_190913 ?auto_190914 ) ) ( not ( = ?auto_190913 ?auto_190917 ) ) ( not ( = ?auto_190914 ?auto_190917 ) ) ( not ( = ?auto_190913 ?auto_190921 ) ) ( not ( = ?auto_190913 ?auto_190915 ) ) ( not ( = ?auto_190914 ?auto_190921 ) ) ( not ( = ?auto_190914 ?auto_190915 ) ) ( not ( = ?auto_190917 ?auto_190921 ) ) ( not ( = ?auto_190917 ?auto_190915 ) ) ( not ( = ?auto_190921 ?auto_190915 ) ) ( ON ?auto_190921 ?auto_190917 ) ( not ( = ?auto_190918 ?auto_190916 ) ) ( not ( = ?auto_190918 ?auto_190920 ) ) ( not ( = ?auto_190918 ?auto_190915 ) ) ( not ( = ?auto_190916 ?auto_190920 ) ) ( not ( = ?auto_190916 ?auto_190915 ) ) ( not ( = ?auto_190920 ?auto_190915 ) ) ( not ( = ?auto_190913 ?auto_190920 ) ) ( not ( = ?auto_190913 ?auto_190918 ) ) ( not ( = ?auto_190913 ?auto_190916 ) ) ( not ( = ?auto_190914 ?auto_190920 ) ) ( not ( = ?auto_190914 ?auto_190918 ) ) ( not ( = ?auto_190914 ?auto_190916 ) ) ( not ( = ?auto_190917 ?auto_190920 ) ) ( not ( = ?auto_190917 ?auto_190918 ) ) ( not ( = ?auto_190917 ?auto_190916 ) ) ( not ( = ?auto_190921 ?auto_190920 ) ) ( not ( = ?auto_190921 ?auto_190918 ) ) ( not ( = ?auto_190921 ?auto_190916 ) ) ( ON ?auto_190915 ?auto_190921 ) ( ON ?auto_190920 ?auto_190915 ) ( ON ?auto_190918 ?auto_190919 ) ( CLEAR ?auto_190918 ) ( not ( = ?auto_190913 ?auto_190919 ) ) ( not ( = ?auto_190914 ?auto_190919 ) ) ( not ( = ?auto_190917 ?auto_190919 ) ) ( not ( = ?auto_190921 ?auto_190919 ) ) ( not ( = ?auto_190915 ?auto_190919 ) ) ( not ( = ?auto_190918 ?auto_190919 ) ) ( not ( = ?auto_190916 ?auto_190919 ) ) ( not ( = ?auto_190920 ?auto_190919 ) ) ( HOLDING ?auto_190916 ) ( CLEAR ?auto_190920 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190913 ?auto_190914 ?auto_190917 ?auto_190921 ?auto_190915 ?auto_190920 ?auto_190916 )
      ( MAKE-2PILE ?auto_190913 ?auto_190914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190922 - BLOCK
      ?auto_190923 - BLOCK
    )
    :vars
    (
      ?auto_190925 - BLOCK
      ?auto_190929 - BLOCK
      ?auto_190930 - BLOCK
      ?auto_190927 - BLOCK
      ?auto_190924 - BLOCK
      ?auto_190928 - BLOCK
      ?auto_190926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190925 ?auto_190923 ) ( ON-TABLE ?auto_190922 ) ( ON ?auto_190923 ?auto_190922 ) ( not ( = ?auto_190922 ?auto_190923 ) ) ( not ( = ?auto_190922 ?auto_190925 ) ) ( not ( = ?auto_190923 ?auto_190925 ) ) ( not ( = ?auto_190922 ?auto_190929 ) ) ( not ( = ?auto_190922 ?auto_190930 ) ) ( not ( = ?auto_190923 ?auto_190929 ) ) ( not ( = ?auto_190923 ?auto_190930 ) ) ( not ( = ?auto_190925 ?auto_190929 ) ) ( not ( = ?auto_190925 ?auto_190930 ) ) ( not ( = ?auto_190929 ?auto_190930 ) ) ( ON ?auto_190929 ?auto_190925 ) ( not ( = ?auto_190927 ?auto_190924 ) ) ( not ( = ?auto_190927 ?auto_190928 ) ) ( not ( = ?auto_190927 ?auto_190930 ) ) ( not ( = ?auto_190924 ?auto_190928 ) ) ( not ( = ?auto_190924 ?auto_190930 ) ) ( not ( = ?auto_190928 ?auto_190930 ) ) ( not ( = ?auto_190922 ?auto_190928 ) ) ( not ( = ?auto_190922 ?auto_190927 ) ) ( not ( = ?auto_190922 ?auto_190924 ) ) ( not ( = ?auto_190923 ?auto_190928 ) ) ( not ( = ?auto_190923 ?auto_190927 ) ) ( not ( = ?auto_190923 ?auto_190924 ) ) ( not ( = ?auto_190925 ?auto_190928 ) ) ( not ( = ?auto_190925 ?auto_190927 ) ) ( not ( = ?auto_190925 ?auto_190924 ) ) ( not ( = ?auto_190929 ?auto_190928 ) ) ( not ( = ?auto_190929 ?auto_190927 ) ) ( not ( = ?auto_190929 ?auto_190924 ) ) ( ON ?auto_190930 ?auto_190929 ) ( ON ?auto_190928 ?auto_190930 ) ( ON ?auto_190927 ?auto_190926 ) ( not ( = ?auto_190922 ?auto_190926 ) ) ( not ( = ?auto_190923 ?auto_190926 ) ) ( not ( = ?auto_190925 ?auto_190926 ) ) ( not ( = ?auto_190929 ?auto_190926 ) ) ( not ( = ?auto_190930 ?auto_190926 ) ) ( not ( = ?auto_190927 ?auto_190926 ) ) ( not ( = ?auto_190924 ?auto_190926 ) ) ( not ( = ?auto_190928 ?auto_190926 ) ) ( CLEAR ?auto_190928 ) ( ON ?auto_190924 ?auto_190927 ) ( CLEAR ?auto_190924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190926 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190926 ?auto_190927 )
      ( MAKE-2PILE ?auto_190922 ?auto_190923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190931 - BLOCK
      ?auto_190932 - BLOCK
    )
    :vars
    (
      ?auto_190933 - BLOCK
      ?auto_190935 - BLOCK
      ?auto_190936 - BLOCK
      ?auto_190937 - BLOCK
      ?auto_190939 - BLOCK
      ?auto_190934 - BLOCK
      ?auto_190938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190933 ?auto_190932 ) ( ON-TABLE ?auto_190931 ) ( ON ?auto_190932 ?auto_190931 ) ( not ( = ?auto_190931 ?auto_190932 ) ) ( not ( = ?auto_190931 ?auto_190933 ) ) ( not ( = ?auto_190932 ?auto_190933 ) ) ( not ( = ?auto_190931 ?auto_190935 ) ) ( not ( = ?auto_190931 ?auto_190936 ) ) ( not ( = ?auto_190932 ?auto_190935 ) ) ( not ( = ?auto_190932 ?auto_190936 ) ) ( not ( = ?auto_190933 ?auto_190935 ) ) ( not ( = ?auto_190933 ?auto_190936 ) ) ( not ( = ?auto_190935 ?auto_190936 ) ) ( ON ?auto_190935 ?auto_190933 ) ( not ( = ?auto_190937 ?auto_190939 ) ) ( not ( = ?auto_190937 ?auto_190934 ) ) ( not ( = ?auto_190937 ?auto_190936 ) ) ( not ( = ?auto_190939 ?auto_190934 ) ) ( not ( = ?auto_190939 ?auto_190936 ) ) ( not ( = ?auto_190934 ?auto_190936 ) ) ( not ( = ?auto_190931 ?auto_190934 ) ) ( not ( = ?auto_190931 ?auto_190937 ) ) ( not ( = ?auto_190931 ?auto_190939 ) ) ( not ( = ?auto_190932 ?auto_190934 ) ) ( not ( = ?auto_190932 ?auto_190937 ) ) ( not ( = ?auto_190932 ?auto_190939 ) ) ( not ( = ?auto_190933 ?auto_190934 ) ) ( not ( = ?auto_190933 ?auto_190937 ) ) ( not ( = ?auto_190933 ?auto_190939 ) ) ( not ( = ?auto_190935 ?auto_190934 ) ) ( not ( = ?auto_190935 ?auto_190937 ) ) ( not ( = ?auto_190935 ?auto_190939 ) ) ( ON ?auto_190936 ?auto_190935 ) ( ON ?auto_190937 ?auto_190938 ) ( not ( = ?auto_190931 ?auto_190938 ) ) ( not ( = ?auto_190932 ?auto_190938 ) ) ( not ( = ?auto_190933 ?auto_190938 ) ) ( not ( = ?auto_190935 ?auto_190938 ) ) ( not ( = ?auto_190936 ?auto_190938 ) ) ( not ( = ?auto_190937 ?auto_190938 ) ) ( not ( = ?auto_190939 ?auto_190938 ) ) ( not ( = ?auto_190934 ?auto_190938 ) ) ( ON ?auto_190939 ?auto_190937 ) ( CLEAR ?auto_190939 ) ( ON-TABLE ?auto_190938 ) ( HOLDING ?auto_190934 ) ( CLEAR ?auto_190936 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190931 ?auto_190932 ?auto_190933 ?auto_190935 ?auto_190936 ?auto_190934 )
      ( MAKE-2PILE ?auto_190931 ?auto_190932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190940 - BLOCK
      ?auto_190941 - BLOCK
    )
    :vars
    (
      ?auto_190947 - BLOCK
      ?auto_190944 - BLOCK
      ?auto_190945 - BLOCK
      ?auto_190948 - BLOCK
      ?auto_190942 - BLOCK
      ?auto_190946 - BLOCK
      ?auto_190943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190947 ?auto_190941 ) ( ON-TABLE ?auto_190940 ) ( ON ?auto_190941 ?auto_190940 ) ( not ( = ?auto_190940 ?auto_190941 ) ) ( not ( = ?auto_190940 ?auto_190947 ) ) ( not ( = ?auto_190941 ?auto_190947 ) ) ( not ( = ?auto_190940 ?auto_190944 ) ) ( not ( = ?auto_190940 ?auto_190945 ) ) ( not ( = ?auto_190941 ?auto_190944 ) ) ( not ( = ?auto_190941 ?auto_190945 ) ) ( not ( = ?auto_190947 ?auto_190944 ) ) ( not ( = ?auto_190947 ?auto_190945 ) ) ( not ( = ?auto_190944 ?auto_190945 ) ) ( ON ?auto_190944 ?auto_190947 ) ( not ( = ?auto_190948 ?auto_190942 ) ) ( not ( = ?auto_190948 ?auto_190946 ) ) ( not ( = ?auto_190948 ?auto_190945 ) ) ( not ( = ?auto_190942 ?auto_190946 ) ) ( not ( = ?auto_190942 ?auto_190945 ) ) ( not ( = ?auto_190946 ?auto_190945 ) ) ( not ( = ?auto_190940 ?auto_190946 ) ) ( not ( = ?auto_190940 ?auto_190948 ) ) ( not ( = ?auto_190940 ?auto_190942 ) ) ( not ( = ?auto_190941 ?auto_190946 ) ) ( not ( = ?auto_190941 ?auto_190948 ) ) ( not ( = ?auto_190941 ?auto_190942 ) ) ( not ( = ?auto_190947 ?auto_190946 ) ) ( not ( = ?auto_190947 ?auto_190948 ) ) ( not ( = ?auto_190947 ?auto_190942 ) ) ( not ( = ?auto_190944 ?auto_190946 ) ) ( not ( = ?auto_190944 ?auto_190948 ) ) ( not ( = ?auto_190944 ?auto_190942 ) ) ( ON ?auto_190945 ?auto_190944 ) ( ON ?auto_190948 ?auto_190943 ) ( not ( = ?auto_190940 ?auto_190943 ) ) ( not ( = ?auto_190941 ?auto_190943 ) ) ( not ( = ?auto_190947 ?auto_190943 ) ) ( not ( = ?auto_190944 ?auto_190943 ) ) ( not ( = ?auto_190945 ?auto_190943 ) ) ( not ( = ?auto_190948 ?auto_190943 ) ) ( not ( = ?auto_190942 ?auto_190943 ) ) ( not ( = ?auto_190946 ?auto_190943 ) ) ( ON ?auto_190942 ?auto_190948 ) ( ON-TABLE ?auto_190943 ) ( CLEAR ?auto_190945 ) ( ON ?auto_190946 ?auto_190942 ) ( CLEAR ?auto_190946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190943 ?auto_190948 ?auto_190942 )
      ( MAKE-2PILE ?auto_190940 ?auto_190941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190998 - BLOCK
      ?auto_190999 - BLOCK
      ?auto_191000 - BLOCK
      ?auto_191001 - BLOCK
      ?auto_191002 - BLOCK
      ?auto_191003 - BLOCK
    )
    :vars
    (
      ?auto_191004 - BLOCK
      ?auto_191005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190998 ) ( ON ?auto_190999 ?auto_190998 ) ( ON ?auto_191000 ?auto_190999 ) ( ON ?auto_191001 ?auto_191000 ) ( not ( = ?auto_190998 ?auto_190999 ) ) ( not ( = ?auto_190998 ?auto_191000 ) ) ( not ( = ?auto_190998 ?auto_191001 ) ) ( not ( = ?auto_190998 ?auto_191002 ) ) ( not ( = ?auto_190998 ?auto_191003 ) ) ( not ( = ?auto_190999 ?auto_191000 ) ) ( not ( = ?auto_190999 ?auto_191001 ) ) ( not ( = ?auto_190999 ?auto_191002 ) ) ( not ( = ?auto_190999 ?auto_191003 ) ) ( not ( = ?auto_191000 ?auto_191001 ) ) ( not ( = ?auto_191000 ?auto_191002 ) ) ( not ( = ?auto_191000 ?auto_191003 ) ) ( not ( = ?auto_191001 ?auto_191002 ) ) ( not ( = ?auto_191001 ?auto_191003 ) ) ( not ( = ?auto_191002 ?auto_191003 ) ) ( ON ?auto_191003 ?auto_191004 ) ( not ( = ?auto_190998 ?auto_191004 ) ) ( not ( = ?auto_190999 ?auto_191004 ) ) ( not ( = ?auto_191000 ?auto_191004 ) ) ( not ( = ?auto_191001 ?auto_191004 ) ) ( not ( = ?auto_191002 ?auto_191004 ) ) ( not ( = ?auto_191003 ?auto_191004 ) ) ( CLEAR ?auto_191001 ) ( ON ?auto_191002 ?auto_191003 ) ( CLEAR ?auto_191002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191005 ) ( ON ?auto_191004 ?auto_191005 ) ( not ( = ?auto_191005 ?auto_191004 ) ) ( not ( = ?auto_191005 ?auto_191003 ) ) ( not ( = ?auto_191005 ?auto_191002 ) ) ( not ( = ?auto_190998 ?auto_191005 ) ) ( not ( = ?auto_190999 ?auto_191005 ) ) ( not ( = ?auto_191000 ?auto_191005 ) ) ( not ( = ?auto_191001 ?auto_191005 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191005 ?auto_191004 ?auto_191003 )
      ( MAKE-6PILE ?auto_190998 ?auto_190999 ?auto_191000 ?auto_191001 ?auto_191002 ?auto_191003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191006 - BLOCK
      ?auto_191007 - BLOCK
      ?auto_191008 - BLOCK
      ?auto_191009 - BLOCK
      ?auto_191010 - BLOCK
      ?auto_191011 - BLOCK
    )
    :vars
    (
      ?auto_191013 - BLOCK
      ?auto_191012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191006 ) ( ON ?auto_191007 ?auto_191006 ) ( ON ?auto_191008 ?auto_191007 ) ( not ( = ?auto_191006 ?auto_191007 ) ) ( not ( = ?auto_191006 ?auto_191008 ) ) ( not ( = ?auto_191006 ?auto_191009 ) ) ( not ( = ?auto_191006 ?auto_191010 ) ) ( not ( = ?auto_191006 ?auto_191011 ) ) ( not ( = ?auto_191007 ?auto_191008 ) ) ( not ( = ?auto_191007 ?auto_191009 ) ) ( not ( = ?auto_191007 ?auto_191010 ) ) ( not ( = ?auto_191007 ?auto_191011 ) ) ( not ( = ?auto_191008 ?auto_191009 ) ) ( not ( = ?auto_191008 ?auto_191010 ) ) ( not ( = ?auto_191008 ?auto_191011 ) ) ( not ( = ?auto_191009 ?auto_191010 ) ) ( not ( = ?auto_191009 ?auto_191011 ) ) ( not ( = ?auto_191010 ?auto_191011 ) ) ( ON ?auto_191011 ?auto_191013 ) ( not ( = ?auto_191006 ?auto_191013 ) ) ( not ( = ?auto_191007 ?auto_191013 ) ) ( not ( = ?auto_191008 ?auto_191013 ) ) ( not ( = ?auto_191009 ?auto_191013 ) ) ( not ( = ?auto_191010 ?auto_191013 ) ) ( not ( = ?auto_191011 ?auto_191013 ) ) ( ON ?auto_191010 ?auto_191011 ) ( CLEAR ?auto_191010 ) ( ON-TABLE ?auto_191012 ) ( ON ?auto_191013 ?auto_191012 ) ( not ( = ?auto_191012 ?auto_191013 ) ) ( not ( = ?auto_191012 ?auto_191011 ) ) ( not ( = ?auto_191012 ?auto_191010 ) ) ( not ( = ?auto_191006 ?auto_191012 ) ) ( not ( = ?auto_191007 ?auto_191012 ) ) ( not ( = ?auto_191008 ?auto_191012 ) ) ( not ( = ?auto_191009 ?auto_191012 ) ) ( HOLDING ?auto_191009 ) ( CLEAR ?auto_191008 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191006 ?auto_191007 ?auto_191008 ?auto_191009 )
      ( MAKE-6PILE ?auto_191006 ?auto_191007 ?auto_191008 ?auto_191009 ?auto_191010 ?auto_191011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191014 - BLOCK
      ?auto_191015 - BLOCK
      ?auto_191016 - BLOCK
      ?auto_191017 - BLOCK
      ?auto_191018 - BLOCK
      ?auto_191019 - BLOCK
    )
    :vars
    (
      ?auto_191021 - BLOCK
      ?auto_191020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191014 ) ( ON ?auto_191015 ?auto_191014 ) ( ON ?auto_191016 ?auto_191015 ) ( not ( = ?auto_191014 ?auto_191015 ) ) ( not ( = ?auto_191014 ?auto_191016 ) ) ( not ( = ?auto_191014 ?auto_191017 ) ) ( not ( = ?auto_191014 ?auto_191018 ) ) ( not ( = ?auto_191014 ?auto_191019 ) ) ( not ( = ?auto_191015 ?auto_191016 ) ) ( not ( = ?auto_191015 ?auto_191017 ) ) ( not ( = ?auto_191015 ?auto_191018 ) ) ( not ( = ?auto_191015 ?auto_191019 ) ) ( not ( = ?auto_191016 ?auto_191017 ) ) ( not ( = ?auto_191016 ?auto_191018 ) ) ( not ( = ?auto_191016 ?auto_191019 ) ) ( not ( = ?auto_191017 ?auto_191018 ) ) ( not ( = ?auto_191017 ?auto_191019 ) ) ( not ( = ?auto_191018 ?auto_191019 ) ) ( ON ?auto_191019 ?auto_191021 ) ( not ( = ?auto_191014 ?auto_191021 ) ) ( not ( = ?auto_191015 ?auto_191021 ) ) ( not ( = ?auto_191016 ?auto_191021 ) ) ( not ( = ?auto_191017 ?auto_191021 ) ) ( not ( = ?auto_191018 ?auto_191021 ) ) ( not ( = ?auto_191019 ?auto_191021 ) ) ( ON ?auto_191018 ?auto_191019 ) ( ON-TABLE ?auto_191020 ) ( ON ?auto_191021 ?auto_191020 ) ( not ( = ?auto_191020 ?auto_191021 ) ) ( not ( = ?auto_191020 ?auto_191019 ) ) ( not ( = ?auto_191020 ?auto_191018 ) ) ( not ( = ?auto_191014 ?auto_191020 ) ) ( not ( = ?auto_191015 ?auto_191020 ) ) ( not ( = ?auto_191016 ?auto_191020 ) ) ( not ( = ?auto_191017 ?auto_191020 ) ) ( CLEAR ?auto_191016 ) ( ON ?auto_191017 ?auto_191018 ) ( CLEAR ?auto_191017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191020 ?auto_191021 ?auto_191019 ?auto_191018 )
      ( MAKE-6PILE ?auto_191014 ?auto_191015 ?auto_191016 ?auto_191017 ?auto_191018 ?auto_191019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191022 - BLOCK
      ?auto_191023 - BLOCK
      ?auto_191024 - BLOCK
      ?auto_191025 - BLOCK
      ?auto_191026 - BLOCK
      ?auto_191027 - BLOCK
    )
    :vars
    (
      ?auto_191028 - BLOCK
      ?auto_191029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191022 ) ( ON ?auto_191023 ?auto_191022 ) ( not ( = ?auto_191022 ?auto_191023 ) ) ( not ( = ?auto_191022 ?auto_191024 ) ) ( not ( = ?auto_191022 ?auto_191025 ) ) ( not ( = ?auto_191022 ?auto_191026 ) ) ( not ( = ?auto_191022 ?auto_191027 ) ) ( not ( = ?auto_191023 ?auto_191024 ) ) ( not ( = ?auto_191023 ?auto_191025 ) ) ( not ( = ?auto_191023 ?auto_191026 ) ) ( not ( = ?auto_191023 ?auto_191027 ) ) ( not ( = ?auto_191024 ?auto_191025 ) ) ( not ( = ?auto_191024 ?auto_191026 ) ) ( not ( = ?auto_191024 ?auto_191027 ) ) ( not ( = ?auto_191025 ?auto_191026 ) ) ( not ( = ?auto_191025 ?auto_191027 ) ) ( not ( = ?auto_191026 ?auto_191027 ) ) ( ON ?auto_191027 ?auto_191028 ) ( not ( = ?auto_191022 ?auto_191028 ) ) ( not ( = ?auto_191023 ?auto_191028 ) ) ( not ( = ?auto_191024 ?auto_191028 ) ) ( not ( = ?auto_191025 ?auto_191028 ) ) ( not ( = ?auto_191026 ?auto_191028 ) ) ( not ( = ?auto_191027 ?auto_191028 ) ) ( ON ?auto_191026 ?auto_191027 ) ( ON-TABLE ?auto_191029 ) ( ON ?auto_191028 ?auto_191029 ) ( not ( = ?auto_191029 ?auto_191028 ) ) ( not ( = ?auto_191029 ?auto_191027 ) ) ( not ( = ?auto_191029 ?auto_191026 ) ) ( not ( = ?auto_191022 ?auto_191029 ) ) ( not ( = ?auto_191023 ?auto_191029 ) ) ( not ( = ?auto_191024 ?auto_191029 ) ) ( not ( = ?auto_191025 ?auto_191029 ) ) ( ON ?auto_191025 ?auto_191026 ) ( CLEAR ?auto_191025 ) ( HOLDING ?auto_191024 ) ( CLEAR ?auto_191023 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191022 ?auto_191023 ?auto_191024 )
      ( MAKE-6PILE ?auto_191022 ?auto_191023 ?auto_191024 ?auto_191025 ?auto_191026 ?auto_191027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191030 - BLOCK
      ?auto_191031 - BLOCK
      ?auto_191032 - BLOCK
      ?auto_191033 - BLOCK
      ?auto_191034 - BLOCK
      ?auto_191035 - BLOCK
    )
    :vars
    (
      ?auto_191036 - BLOCK
      ?auto_191037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191030 ) ( ON ?auto_191031 ?auto_191030 ) ( not ( = ?auto_191030 ?auto_191031 ) ) ( not ( = ?auto_191030 ?auto_191032 ) ) ( not ( = ?auto_191030 ?auto_191033 ) ) ( not ( = ?auto_191030 ?auto_191034 ) ) ( not ( = ?auto_191030 ?auto_191035 ) ) ( not ( = ?auto_191031 ?auto_191032 ) ) ( not ( = ?auto_191031 ?auto_191033 ) ) ( not ( = ?auto_191031 ?auto_191034 ) ) ( not ( = ?auto_191031 ?auto_191035 ) ) ( not ( = ?auto_191032 ?auto_191033 ) ) ( not ( = ?auto_191032 ?auto_191034 ) ) ( not ( = ?auto_191032 ?auto_191035 ) ) ( not ( = ?auto_191033 ?auto_191034 ) ) ( not ( = ?auto_191033 ?auto_191035 ) ) ( not ( = ?auto_191034 ?auto_191035 ) ) ( ON ?auto_191035 ?auto_191036 ) ( not ( = ?auto_191030 ?auto_191036 ) ) ( not ( = ?auto_191031 ?auto_191036 ) ) ( not ( = ?auto_191032 ?auto_191036 ) ) ( not ( = ?auto_191033 ?auto_191036 ) ) ( not ( = ?auto_191034 ?auto_191036 ) ) ( not ( = ?auto_191035 ?auto_191036 ) ) ( ON ?auto_191034 ?auto_191035 ) ( ON-TABLE ?auto_191037 ) ( ON ?auto_191036 ?auto_191037 ) ( not ( = ?auto_191037 ?auto_191036 ) ) ( not ( = ?auto_191037 ?auto_191035 ) ) ( not ( = ?auto_191037 ?auto_191034 ) ) ( not ( = ?auto_191030 ?auto_191037 ) ) ( not ( = ?auto_191031 ?auto_191037 ) ) ( not ( = ?auto_191032 ?auto_191037 ) ) ( not ( = ?auto_191033 ?auto_191037 ) ) ( ON ?auto_191033 ?auto_191034 ) ( CLEAR ?auto_191031 ) ( ON ?auto_191032 ?auto_191033 ) ( CLEAR ?auto_191032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191037 ?auto_191036 ?auto_191035 ?auto_191034 ?auto_191033 )
      ( MAKE-6PILE ?auto_191030 ?auto_191031 ?auto_191032 ?auto_191033 ?auto_191034 ?auto_191035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191038 - BLOCK
      ?auto_191039 - BLOCK
      ?auto_191040 - BLOCK
      ?auto_191041 - BLOCK
      ?auto_191042 - BLOCK
      ?auto_191043 - BLOCK
    )
    :vars
    (
      ?auto_191045 - BLOCK
      ?auto_191044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191038 ) ( not ( = ?auto_191038 ?auto_191039 ) ) ( not ( = ?auto_191038 ?auto_191040 ) ) ( not ( = ?auto_191038 ?auto_191041 ) ) ( not ( = ?auto_191038 ?auto_191042 ) ) ( not ( = ?auto_191038 ?auto_191043 ) ) ( not ( = ?auto_191039 ?auto_191040 ) ) ( not ( = ?auto_191039 ?auto_191041 ) ) ( not ( = ?auto_191039 ?auto_191042 ) ) ( not ( = ?auto_191039 ?auto_191043 ) ) ( not ( = ?auto_191040 ?auto_191041 ) ) ( not ( = ?auto_191040 ?auto_191042 ) ) ( not ( = ?auto_191040 ?auto_191043 ) ) ( not ( = ?auto_191041 ?auto_191042 ) ) ( not ( = ?auto_191041 ?auto_191043 ) ) ( not ( = ?auto_191042 ?auto_191043 ) ) ( ON ?auto_191043 ?auto_191045 ) ( not ( = ?auto_191038 ?auto_191045 ) ) ( not ( = ?auto_191039 ?auto_191045 ) ) ( not ( = ?auto_191040 ?auto_191045 ) ) ( not ( = ?auto_191041 ?auto_191045 ) ) ( not ( = ?auto_191042 ?auto_191045 ) ) ( not ( = ?auto_191043 ?auto_191045 ) ) ( ON ?auto_191042 ?auto_191043 ) ( ON-TABLE ?auto_191044 ) ( ON ?auto_191045 ?auto_191044 ) ( not ( = ?auto_191044 ?auto_191045 ) ) ( not ( = ?auto_191044 ?auto_191043 ) ) ( not ( = ?auto_191044 ?auto_191042 ) ) ( not ( = ?auto_191038 ?auto_191044 ) ) ( not ( = ?auto_191039 ?auto_191044 ) ) ( not ( = ?auto_191040 ?auto_191044 ) ) ( not ( = ?auto_191041 ?auto_191044 ) ) ( ON ?auto_191041 ?auto_191042 ) ( ON ?auto_191040 ?auto_191041 ) ( CLEAR ?auto_191040 ) ( HOLDING ?auto_191039 ) ( CLEAR ?auto_191038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191038 ?auto_191039 )
      ( MAKE-6PILE ?auto_191038 ?auto_191039 ?auto_191040 ?auto_191041 ?auto_191042 ?auto_191043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191046 - BLOCK
      ?auto_191047 - BLOCK
      ?auto_191048 - BLOCK
      ?auto_191049 - BLOCK
      ?auto_191050 - BLOCK
      ?auto_191051 - BLOCK
    )
    :vars
    (
      ?auto_191053 - BLOCK
      ?auto_191052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191046 ) ( not ( = ?auto_191046 ?auto_191047 ) ) ( not ( = ?auto_191046 ?auto_191048 ) ) ( not ( = ?auto_191046 ?auto_191049 ) ) ( not ( = ?auto_191046 ?auto_191050 ) ) ( not ( = ?auto_191046 ?auto_191051 ) ) ( not ( = ?auto_191047 ?auto_191048 ) ) ( not ( = ?auto_191047 ?auto_191049 ) ) ( not ( = ?auto_191047 ?auto_191050 ) ) ( not ( = ?auto_191047 ?auto_191051 ) ) ( not ( = ?auto_191048 ?auto_191049 ) ) ( not ( = ?auto_191048 ?auto_191050 ) ) ( not ( = ?auto_191048 ?auto_191051 ) ) ( not ( = ?auto_191049 ?auto_191050 ) ) ( not ( = ?auto_191049 ?auto_191051 ) ) ( not ( = ?auto_191050 ?auto_191051 ) ) ( ON ?auto_191051 ?auto_191053 ) ( not ( = ?auto_191046 ?auto_191053 ) ) ( not ( = ?auto_191047 ?auto_191053 ) ) ( not ( = ?auto_191048 ?auto_191053 ) ) ( not ( = ?auto_191049 ?auto_191053 ) ) ( not ( = ?auto_191050 ?auto_191053 ) ) ( not ( = ?auto_191051 ?auto_191053 ) ) ( ON ?auto_191050 ?auto_191051 ) ( ON-TABLE ?auto_191052 ) ( ON ?auto_191053 ?auto_191052 ) ( not ( = ?auto_191052 ?auto_191053 ) ) ( not ( = ?auto_191052 ?auto_191051 ) ) ( not ( = ?auto_191052 ?auto_191050 ) ) ( not ( = ?auto_191046 ?auto_191052 ) ) ( not ( = ?auto_191047 ?auto_191052 ) ) ( not ( = ?auto_191048 ?auto_191052 ) ) ( not ( = ?auto_191049 ?auto_191052 ) ) ( ON ?auto_191049 ?auto_191050 ) ( ON ?auto_191048 ?auto_191049 ) ( CLEAR ?auto_191046 ) ( ON ?auto_191047 ?auto_191048 ) ( CLEAR ?auto_191047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191052 ?auto_191053 ?auto_191051 ?auto_191050 ?auto_191049 ?auto_191048 )
      ( MAKE-6PILE ?auto_191046 ?auto_191047 ?auto_191048 ?auto_191049 ?auto_191050 ?auto_191051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191054 - BLOCK
      ?auto_191055 - BLOCK
      ?auto_191056 - BLOCK
      ?auto_191057 - BLOCK
      ?auto_191058 - BLOCK
      ?auto_191059 - BLOCK
    )
    :vars
    (
      ?auto_191060 - BLOCK
      ?auto_191061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191054 ?auto_191055 ) ) ( not ( = ?auto_191054 ?auto_191056 ) ) ( not ( = ?auto_191054 ?auto_191057 ) ) ( not ( = ?auto_191054 ?auto_191058 ) ) ( not ( = ?auto_191054 ?auto_191059 ) ) ( not ( = ?auto_191055 ?auto_191056 ) ) ( not ( = ?auto_191055 ?auto_191057 ) ) ( not ( = ?auto_191055 ?auto_191058 ) ) ( not ( = ?auto_191055 ?auto_191059 ) ) ( not ( = ?auto_191056 ?auto_191057 ) ) ( not ( = ?auto_191056 ?auto_191058 ) ) ( not ( = ?auto_191056 ?auto_191059 ) ) ( not ( = ?auto_191057 ?auto_191058 ) ) ( not ( = ?auto_191057 ?auto_191059 ) ) ( not ( = ?auto_191058 ?auto_191059 ) ) ( ON ?auto_191059 ?auto_191060 ) ( not ( = ?auto_191054 ?auto_191060 ) ) ( not ( = ?auto_191055 ?auto_191060 ) ) ( not ( = ?auto_191056 ?auto_191060 ) ) ( not ( = ?auto_191057 ?auto_191060 ) ) ( not ( = ?auto_191058 ?auto_191060 ) ) ( not ( = ?auto_191059 ?auto_191060 ) ) ( ON ?auto_191058 ?auto_191059 ) ( ON-TABLE ?auto_191061 ) ( ON ?auto_191060 ?auto_191061 ) ( not ( = ?auto_191061 ?auto_191060 ) ) ( not ( = ?auto_191061 ?auto_191059 ) ) ( not ( = ?auto_191061 ?auto_191058 ) ) ( not ( = ?auto_191054 ?auto_191061 ) ) ( not ( = ?auto_191055 ?auto_191061 ) ) ( not ( = ?auto_191056 ?auto_191061 ) ) ( not ( = ?auto_191057 ?auto_191061 ) ) ( ON ?auto_191057 ?auto_191058 ) ( ON ?auto_191056 ?auto_191057 ) ( ON ?auto_191055 ?auto_191056 ) ( CLEAR ?auto_191055 ) ( HOLDING ?auto_191054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191054 )
      ( MAKE-6PILE ?auto_191054 ?auto_191055 ?auto_191056 ?auto_191057 ?auto_191058 ?auto_191059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191062 - BLOCK
      ?auto_191063 - BLOCK
      ?auto_191064 - BLOCK
      ?auto_191065 - BLOCK
      ?auto_191066 - BLOCK
      ?auto_191067 - BLOCK
    )
    :vars
    (
      ?auto_191068 - BLOCK
      ?auto_191069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191062 ?auto_191063 ) ) ( not ( = ?auto_191062 ?auto_191064 ) ) ( not ( = ?auto_191062 ?auto_191065 ) ) ( not ( = ?auto_191062 ?auto_191066 ) ) ( not ( = ?auto_191062 ?auto_191067 ) ) ( not ( = ?auto_191063 ?auto_191064 ) ) ( not ( = ?auto_191063 ?auto_191065 ) ) ( not ( = ?auto_191063 ?auto_191066 ) ) ( not ( = ?auto_191063 ?auto_191067 ) ) ( not ( = ?auto_191064 ?auto_191065 ) ) ( not ( = ?auto_191064 ?auto_191066 ) ) ( not ( = ?auto_191064 ?auto_191067 ) ) ( not ( = ?auto_191065 ?auto_191066 ) ) ( not ( = ?auto_191065 ?auto_191067 ) ) ( not ( = ?auto_191066 ?auto_191067 ) ) ( ON ?auto_191067 ?auto_191068 ) ( not ( = ?auto_191062 ?auto_191068 ) ) ( not ( = ?auto_191063 ?auto_191068 ) ) ( not ( = ?auto_191064 ?auto_191068 ) ) ( not ( = ?auto_191065 ?auto_191068 ) ) ( not ( = ?auto_191066 ?auto_191068 ) ) ( not ( = ?auto_191067 ?auto_191068 ) ) ( ON ?auto_191066 ?auto_191067 ) ( ON-TABLE ?auto_191069 ) ( ON ?auto_191068 ?auto_191069 ) ( not ( = ?auto_191069 ?auto_191068 ) ) ( not ( = ?auto_191069 ?auto_191067 ) ) ( not ( = ?auto_191069 ?auto_191066 ) ) ( not ( = ?auto_191062 ?auto_191069 ) ) ( not ( = ?auto_191063 ?auto_191069 ) ) ( not ( = ?auto_191064 ?auto_191069 ) ) ( not ( = ?auto_191065 ?auto_191069 ) ) ( ON ?auto_191065 ?auto_191066 ) ( ON ?auto_191064 ?auto_191065 ) ( ON ?auto_191063 ?auto_191064 ) ( ON ?auto_191062 ?auto_191063 ) ( CLEAR ?auto_191062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191069 ?auto_191068 ?auto_191067 ?auto_191066 ?auto_191065 ?auto_191064 ?auto_191063 )
      ( MAKE-6PILE ?auto_191062 ?auto_191063 ?auto_191064 ?auto_191065 ?auto_191066 ?auto_191067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191076 - BLOCK
      ?auto_191077 - BLOCK
      ?auto_191078 - BLOCK
      ?auto_191079 - BLOCK
      ?auto_191080 - BLOCK
      ?auto_191081 - BLOCK
    )
    :vars
    (
      ?auto_191082 - BLOCK
      ?auto_191083 - BLOCK
      ?auto_191084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191076 ?auto_191077 ) ) ( not ( = ?auto_191076 ?auto_191078 ) ) ( not ( = ?auto_191076 ?auto_191079 ) ) ( not ( = ?auto_191076 ?auto_191080 ) ) ( not ( = ?auto_191076 ?auto_191081 ) ) ( not ( = ?auto_191077 ?auto_191078 ) ) ( not ( = ?auto_191077 ?auto_191079 ) ) ( not ( = ?auto_191077 ?auto_191080 ) ) ( not ( = ?auto_191077 ?auto_191081 ) ) ( not ( = ?auto_191078 ?auto_191079 ) ) ( not ( = ?auto_191078 ?auto_191080 ) ) ( not ( = ?auto_191078 ?auto_191081 ) ) ( not ( = ?auto_191079 ?auto_191080 ) ) ( not ( = ?auto_191079 ?auto_191081 ) ) ( not ( = ?auto_191080 ?auto_191081 ) ) ( ON ?auto_191081 ?auto_191082 ) ( not ( = ?auto_191076 ?auto_191082 ) ) ( not ( = ?auto_191077 ?auto_191082 ) ) ( not ( = ?auto_191078 ?auto_191082 ) ) ( not ( = ?auto_191079 ?auto_191082 ) ) ( not ( = ?auto_191080 ?auto_191082 ) ) ( not ( = ?auto_191081 ?auto_191082 ) ) ( ON ?auto_191080 ?auto_191081 ) ( ON-TABLE ?auto_191083 ) ( ON ?auto_191082 ?auto_191083 ) ( not ( = ?auto_191083 ?auto_191082 ) ) ( not ( = ?auto_191083 ?auto_191081 ) ) ( not ( = ?auto_191083 ?auto_191080 ) ) ( not ( = ?auto_191076 ?auto_191083 ) ) ( not ( = ?auto_191077 ?auto_191083 ) ) ( not ( = ?auto_191078 ?auto_191083 ) ) ( not ( = ?auto_191079 ?auto_191083 ) ) ( ON ?auto_191079 ?auto_191080 ) ( ON ?auto_191078 ?auto_191079 ) ( ON ?auto_191077 ?auto_191078 ) ( CLEAR ?auto_191077 ) ( ON ?auto_191076 ?auto_191084 ) ( CLEAR ?auto_191076 ) ( HAND-EMPTY ) ( not ( = ?auto_191076 ?auto_191084 ) ) ( not ( = ?auto_191077 ?auto_191084 ) ) ( not ( = ?auto_191078 ?auto_191084 ) ) ( not ( = ?auto_191079 ?auto_191084 ) ) ( not ( = ?auto_191080 ?auto_191084 ) ) ( not ( = ?auto_191081 ?auto_191084 ) ) ( not ( = ?auto_191082 ?auto_191084 ) ) ( not ( = ?auto_191083 ?auto_191084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191076 ?auto_191084 )
      ( MAKE-6PILE ?auto_191076 ?auto_191077 ?auto_191078 ?auto_191079 ?auto_191080 ?auto_191081 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191085 - BLOCK
      ?auto_191086 - BLOCK
      ?auto_191087 - BLOCK
      ?auto_191088 - BLOCK
      ?auto_191089 - BLOCK
      ?auto_191090 - BLOCK
    )
    :vars
    (
      ?auto_191091 - BLOCK
      ?auto_191092 - BLOCK
      ?auto_191093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191085 ?auto_191086 ) ) ( not ( = ?auto_191085 ?auto_191087 ) ) ( not ( = ?auto_191085 ?auto_191088 ) ) ( not ( = ?auto_191085 ?auto_191089 ) ) ( not ( = ?auto_191085 ?auto_191090 ) ) ( not ( = ?auto_191086 ?auto_191087 ) ) ( not ( = ?auto_191086 ?auto_191088 ) ) ( not ( = ?auto_191086 ?auto_191089 ) ) ( not ( = ?auto_191086 ?auto_191090 ) ) ( not ( = ?auto_191087 ?auto_191088 ) ) ( not ( = ?auto_191087 ?auto_191089 ) ) ( not ( = ?auto_191087 ?auto_191090 ) ) ( not ( = ?auto_191088 ?auto_191089 ) ) ( not ( = ?auto_191088 ?auto_191090 ) ) ( not ( = ?auto_191089 ?auto_191090 ) ) ( ON ?auto_191090 ?auto_191091 ) ( not ( = ?auto_191085 ?auto_191091 ) ) ( not ( = ?auto_191086 ?auto_191091 ) ) ( not ( = ?auto_191087 ?auto_191091 ) ) ( not ( = ?auto_191088 ?auto_191091 ) ) ( not ( = ?auto_191089 ?auto_191091 ) ) ( not ( = ?auto_191090 ?auto_191091 ) ) ( ON ?auto_191089 ?auto_191090 ) ( ON-TABLE ?auto_191092 ) ( ON ?auto_191091 ?auto_191092 ) ( not ( = ?auto_191092 ?auto_191091 ) ) ( not ( = ?auto_191092 ?auto_191090 ) ) ( not ( = ?auto_191092 ?auto_191089 ) ) ( not ( = ?auto_191085 ?auto_191092 ) ) ( not ( = ?auto_191086 ?auto_191092 ) ) ( not ( = ?auto_191087 ?auto_191092 ) ) ( not ( = ?auto_191088 ?auto_191092 ) ) ( ON ?auto_191088 ?auto_191089 ) ( ON ?auto_191087 ?auto_191088 ) ( ON ?auto_191085 ?auto_191093 ) ( CLEAR ?auto_191085 ) ( not ( = ?auto_191085 ?auto_191093 ) ) ( not ( = ?auto_191086 ?auto_191093 ) ) ( not ( = ?auto_191087 ?auto_191093 ) ) ( not ( = ?auto_191088 ?auto_191093 ) ) ( not ( = ?auto_191089 ?auto_191093 ) ) ( not ( = ?auto_191090 ?auto_191093 ) ) ( not ( = ?auto_191091 ?auto_191093 ) ) ( not ( = ?auto_191092 ?auto_191093 ) ) ( HOLDING ?auto_191086 ) ( CLEAR ?auto_191087 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191092 ?auto_191091 ?auto_191090 ?auto_191089 ?auto_191088 ?auto_191087 ?auto_191086 )
      ( MAKE-6PILE ?auto_191085 ?auto_191086 ?auto_191087 ?auto_191088 ?auto_191089 ?auto_191090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191094 - BLOCK
      ?auto_191095 - BLOCK
      ?auto_191096 - BLOCK
      ?auto_191097 - BLOCK
      ?auto_191098 - BLOCK
      ?auto_191099 - BLOCK
    )
    :vars
    (
      ?auto_191102 - BLOCK
      ?auto_191101 - BLOCK
      ?auto_191100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191094 ?auto_191095 ) ) ( not ( = ?auto_191094 ?auto_191096 ) ) ( not ( = ?auto_191094 ?auto_191097 ) ) ( not ( = ?auto_191094 ?auto_191098 ) ) ( not ( = ?auto_191094 ?auto_191099 ) ) ( not ( = ?auto_191095 ?auto_191096 ) ) ( not ( = ?auto_191095 ?auto_191097 ) ) ( not ( = ?auto_191095 ?auto_191098 ) ) ( not ( = ?auto_191095 ?auto_191099 ) ) ( not ( = ?auto_191096 ?auto_191097 ) ) ( not ( = ?auto_191096 ?auto_191098 ) ) ( not ( = ?auto_191096 ?auto_191099 ) ) ( not ( = ?auto_191097 ?auto_191098 ) ) ( not ( = ?auto_191097 ?auto_191099 ) ) ( not ( = ?auto_191098 ?auto_191099 ) ) ( ON ?auto_191099 ?auto_191102 ) ( not ( = ?auto_191094 ?auto_191102 ) ) ( not ( = ?auto_191095 ?auto_191102 ) ) ( not ( = ?auto_191096 ?auto_191102 ) ) ( not ( = ?auto_191097 ?auto_191102 ) ) ( not ( = ?auto_191098 ?auto_191102 ) ) ( not ( = ?auto_191099 ?auto_191102 ) ) ( ON ?auto_191098 ?auto_191099 ) ( ON-TABLE ?auto_191101 ) ( ON ?auto_191102 ?auto_191101 ) ( not ( = ?auto_191101 ?auto_191102 ) ) ( not ( = ?auto_191101 ?auto_191099 ) ) ( not ( = ?auto_191101 ?auto_191098 ) ) ( not ( = ?auto_191094 ?auto_191101 ) ) ( not ( = ?auto_191095 ?auto_191101 ) ) ( not ( = ?auto_191096 ?auto_191101 ) ) ( not ( = ?auto_191097 ?auto_191101 ) ) ( ON ?auto_191097 ?auto_191098 ) ( ON ?auto_191096 ?auto_191097 ) ( ON ?auto_191094 ?auto_191100 ) ( not ( = ?auto_191094 ?auto_191100 ) ) ( not ( = ?auto_191095 ?auto_191100 ) ) ( not ( = ?auto_191096 ?auto_191100 ) ) ( not ( = ?auto_191097 ?auto_191100 ) ) ( not ( = ?auto_191098 ?auto_191100 ) ) ( not ( = ?auto_191099 ?auto_191100 ) ) ( not ( = ?auto_191102 ?auto_191100 ) ) ( not ( = ?auto_191101 ?auto_191100 ) ) ( CLEAR ?auto_191096 ) ( ON ?auto_191095 ?auto_191094 ) ( CLEAR ?auto_191095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191100 ?auto_191094 )
      ( MAKE-6PILE ?auto_191094 ?auto_191095 ?auto_191096 ?auto_191097 ?auto_191098 ?auto_191099 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191103 - BLOCK
      ?auto_191104 - BLOCK
      ?auto_191105 - BLOCK
      ?auto_191106 - BLOCK
      ?auto_191107 - BLOCK
      ?auto_191108 - BLOCK
    )
    :vars
    (
      ?auto_191111 - BLOCK
      ?auto_191110 - BLOCK
      ?auto_191109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191103 ?auto_191104 ) ) ( not ( = ?auto_191103 ?auto_191105 ) ) ( not ( = ?auto_191103 ?auto_191106 ) ) ( not ( = ?auto_191103 ?auto_191107 ) ) ( not ( = ?auto_191103 ?auto_191108 ) ) ( not ( = ?auto_191104 ?auto_191105 ) ) ( not ( = ?auto_191104 ?auto_191106 ) ) ( not ( = ?auto_191104 ?auto_191107 ) ) ( not ( = ?auto_191104 ?auto_191108 ) ) ( not ( = ?auto_191105 ?auto_191106 ) ) ( not ( = ?auto_191105 ?auto_191107 ) ) ( not ( = ?auto_191105 ?auto_191108 ) ) ( not ( = ?auto_191106 ?auto_191107 ) ) ( not ( = ?auto_191106 ?auto_191108 ) ) ( not ( = ?auto_191107 ?auto_191108 ) ) ( ON ?auto_191108 ?auto_191111 ) ( not ( = ?auto_191103 ?auto_191111 ) ) ( not ( = ?auto_191104 ?auto_191111 ) ) ( not ( = ?auto_191105 ?auto_191111 ) ) ( not ( = ?auto_191106 ?auto_191111 ) ) ( not ( = ?auto_191107 ?auto_191111 ) ) ( not ( = ?auto_191108 ?auto_191111 ) ) ( ON ?auto_191107 ?auto_191108 ) ( ON-TABLE ?auto_191110 ) ( ON ?auto_191111 ?auto_191110 ) ( not ( = ?auto_191110 ?auto_191111 ) ) ( not ( = ?auto_191110 ?auto_191108 ) ) ( not ( = ?auto_191110 ?auto_191107 ) ) ( not ( = ?auto_191103 ?auto_191110 ) ) ( not ( = ?auto_191104 ?auto_191110 ) ) ( not ( = ?auto_191105 ?auto_191110 ) ) ( not ( = ?auto_191106 ?auto_191110 ) ) ( ON ?auto_191106 ?auto_191107 ) ( ON ?auto_191103 ?auto_191109 ) ( not ( = ?auto_191103 ?auto_191109 ) ) ( not ( = ?auto_191104 ?auto_191109 ) ) ( not ( = ?auto_191105 ?auto_191109 ) ) ( not ( = ?auto_191106 ?auto_191109 ) ) ( not ( = ?auto_191107 ?auto_191109 ) ) ( not ( = ?auto_191108 ?auto_191109 ) ) ( not ( = ?auto_191111 ?auto_191109 ) ) ( not ( = ?auto_191110 ?auto_191109 ) ) ( ON ?auto_191104 ?auto_191103 ) ( CLEAR ?auto_191104 ) ( ON-TABLE ?auto_191109 ) ( HOLDING ?auto_191105 ) ( CLEAR ?auto_191106 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191110 ?auto_191111 ?auto_191108 ?auto_191107 ?auto_191106 ?auto_191105 )
      ( MAKE-6PILE ?auto_191103 ?auto_191104 ?auto_191105 ?auto_191106 ?auto_191107 ?auto_191108 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191112 - BLOCK
      ?auto_191113 - BLOCK
      ?auto_191114 - BLOCK
      ?auto_191115 - BLOCK
      ?auto_191116 - BLOCK
      ?auto_191117 - BLOCK
    )
    :vars
    (
      ?auto_191118 - BLOCK
      ?auto_191119 - BLOCK
      ?auto_191120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191112 ?auto_191113 ) ) ( not ( = ?auto_191112 ?auto_191114 ) ) ( not ( = ?auto_191112 ?auto_191115 ) ) ( not ( = ?auto_191112 ?auto_191116 ) ) ( not ( = ?auto_191112 ?auto_191117 ) ) ( not ( = ?auto_191113 ?auto_191114 ) ) ( not ( = ?auto_191113 ?auto_191115 ) ) ( not ( = ?auto_191113 ?auto_191116 ) ) ( not ( = ?auto_191113 ?auto_191117 ) ) ( not ( = ?auto_191114 ?auto_191115 ) ) ( not ( = ?auto_191114 ?auto_191116 ) ) ( not ( = ?auto_191114 ?auto_191117 ) ) ( not ( = ?auto_191115 ?auto_191116 ) ) ( not ( = ?auto_191115 ?auto_191117 ) ) ( not ( = ?auto_191116 ?auto_191117 ) ) ( ON ?auto_191117 ?auto_191118 ) ( not ( = ?auto_191112 ?auto_191118 ) ) ( not ( = ?auto_191113 ?auto_191118 ) ) ( not ( = ?auto_191114 ?auto_191118 ) ) ( not ( = ?auto_191115 ?auto_191118 ) ) ( not ( = ?auto_191116 ?auto_191118 ) ) ( not ( = ?auto_191117 ?auto_191118 ) ) ( ON ?auto_191116 ?auto_191117 ) ( ON-TABLE ?auto_191119 ) ( ON ?auto_191118 ?auto_191119 ) ( not ( = ?auto_191119 ?auto_191118 ) ) ( not ( = ?auto_191119 ?auto_191117 ) ) ( not ( = ?auto_191119 ?auto_191116 ) ) ( not ( = ?auto_191112 ?auto_191119 ) ) ( not ( = ?auto_191113 ?auto_191119 ) ) ( not ( = ?auto_191114 ?auto_191119 ) ) ( not ( = ?auto_191115 ?auto_191119 ) ) ( ON ?auto_191115 ?auto_191116 ) ( ON ?auto_191112 ?auto_191120 ) ( not ( = ?auto_191112 ?auto_191120 ) ) ( not ( = ?auto_191113 ?auto_191120 ) ) ( not ( = ?auto_191114 ?auto_191120 ) ) ( not ( = ?auto_191115 ?auto_191120 ) ) ( not ( = ?auto_191116 ?auto_191120 ) ) ( not ( = ?auto_191117 ?auto_191120 ) ) ( not ( = ?auto_191118 ?auto_191120 ) ) ( not ( = ?auto_191119 ?auto_191120 ) ) ( ON ?auto_191113 ?auto_191112 ) ( ON-TABLE ?auto_191120 ) ( CLEAR ?auto_191115 ) ( ON ?auto_191114 ?auto_191113 ) ( CLEAR ?auto_191114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191120 ?auto_191112 ?auto_191113 )
      ( MAKE-6PILE ?auto_191112 ?auto_191113 ?auto_191114 ?auto_191115 ?auto_191116 ?auto_191117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191121 - BLOCK
      ?auto_191122 - BLOCK
      ?auto_191123 - BLOCK
      ?auto_191124 - BLOCK
      ?auto_191125 - BLOCK
      ?auto_191126 - BLOCK
    )
    :vars
    (
      ?auto_191129 - BLOCK
      ?auto_191127 - BLOCK
      ?auto_191128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191121 ?auto_191122 ) ) ( not ( = ?auto_191121 ?auto_191123 ) ) ( not ( = ?auto_191121 ?auto_191124 ) ) ( not ( = ?auto_191121 ?auto_191125 ) ) ( not ( = ?auto_191121 ?auto_191126 ) ) ( not ( = ?auto_191122 ?auto_191123 ) ) ( not ( = ?auto_191122 ?auto_191124 ) ) ( not ( = ?auto_191122 ?auto_191125 ) ) ( not ( = ?auto_191122 ?auto_191126 ) ) ( not ( = ?auto_191123 ?auto_191124 ) ) ( not ( = ?auto_191123 ?auto_191125 ) ) ( not ( = ?auto_191123 ?auto_191126 ) ) ( not ( = ?auto_191124 ?auto_191125 ) ) ( not ( = ?auto_191124 ?auto_191126 ) ) ( not ( = ?auto_191125 ?auto_191126 ) ) ( ON ?auto_191126 ?auto_191129 ) ( not ( = ?auto_191121 ?auto_191129 ) ) ( not ( = ?auto_191122 ?auto_191129 ) ) ( not ( = ?auto_191123 ?auto_191129 ) ) ( not ( = ?auto_191124 ?auto_191129 ) ) ( not ( = ?auto_191125 ?auto_191129 ) ) ( not ( = ?auto_191126 ?auto_191129 ) ) ( ON ?auto_191125 ?auto_191126 ) ( ON-TABLE ?auto_191127 ) ( ON ?auto_191129 ?auto_191127 ) ( not ( = ?auto_191127 ?auto_191129 ) ) ( not ( = ?auto_191127 ?auto_191126 ) ) ( not ( = ?auto_191127 ?auto_191125 ) ) ( not ( = ?auto_191121 ?auto_191127 ) ) ( not ( = ?auto_191122 ?auto_191127 ) ) ( not ( = ?auto_191123 ?auto_191127 ) ) ( not ( = ?auto_191124 ?auto_191127 ) ) ( ON ?auto_191121 ?auto_191128 ) ( not ( = ?auto_191121 ?auto_191128 ) ) ( not ( = ?auto_191122 ?auto_191128 ) ) ( not ( = ?auto_191123 ?auto_191128 ) ) ( not ( = ?auto_191124 ?auto_191128 ) ) ( not ( = ?auto_191125 ?auto_191128 ) ) ( not ( = ?auto_191126 ?auto_191128 ) ) ( not ( = ?auto_191129 ?auto_191128 ) ) ( not ( = ?auto_191127 ?auto_191128 ) ) ( ON ?auto_191122 ?auto_191121 ) ( ON-TABLE ?auto_191128 ) ( ON ?auto_191123 ?auto_191122 ) ( CLEAR ?auto_191123 ) ( HOLDING ?auto_191124 ) ( CLEAR ?auto_191125 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191127 ?auto_191129 ?auto_191126 ?auto_191125 ?auto_191124 )
      ( MAKE-6PILE ?auto_191121 ?auto_191122 ?auto_191123 ?auto_191124 ?auto_191125 ?auto_191126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191130 - BLOCK
      ?auto_191131 - BLOCK
      ?auto_191132 - BLOCK
      ?auto_191133 - BLOCK
      ?auto_191134 - BLOCK
      ?auto_191135 - BLOCK
    )
    :vars
    (
      ?auto_191137 - BLOCK
      ?auto_191136 - BLOCK
      ?auto_191138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191130 ?auto_191131 ) ) ( not ( = ?auto_191130 ?auto_191132 ) ) ( not ( = ?auto_191130 ?auto_191133 ) ) ( not ( = ?auto_191130 ?auto_191134 ) ) ( not ( = ?auto_191130 ?auto_191135 ) ) ( not ( = ?auto_191131 ?auto_191132 ) ) ( not ( = ?auto_191131 ?auto_191133 ) ) ( not ( = ?auto_191131 ?auto_191134 ) ) ( not ( = ?auto_191131 ?auto_191135 ) ) ( not ( = ?auto_191132 ?auto_191133 ) ) ( not ( = ?auto_191132 ?auto_191134 ) ) ( not ( = ?auto_191132 ?auto_191135 ) ) ( not ( = ?auto_191133 ?auto_191134 ) ) ( not ( = ?auto_191133 ?auto_191135 ) ) ( not ( = ?auto_191134 ?auto_191135 ) ) ( ON ?auto_191135 ?auto_191137 ) ( not ( = ?auto_191130 ?auto_191137 ) ) ( not ( = ?auto_191131 ?auto_191137 ) ) ( not ( = ?auto_191132 ?auto_191137 ) ) ( not ( = ?auto_191133 ?auto_191137 ) ) ( not ( = ?auto_191134 ?auto_191137 ) ) ( not ( = ?auto_191135 ?auto_191137 ) ) ( ON ?auto_191134 ?auto_191135 ) ( ON-TABLE ?auto_191136 ) ( ON ?auto_191137 ?auto_191136 ) ( not ( = ?auto_191136 ?auto_191137 ) ) ( not ( = ?auto_191136 ?auto_191135 ) ) ( not ( = ?auto_191136 ?auto_191134 ) ) ( not ( = ?auto_191130 ?auto_191136 ) ) ( not ( = ?auto_191131 ?auto_191136 ) ) ( not ( = ?auto_191132 ?auto_191136 ) ) ( not ( = ?auto_191133 ?auto_191136 ) ) ( ON ?auto_191130 ?auto_191138 ) ( not ( = ?auto_191130 ?auto_191138 ) ) ( not ( = ?auto_191131 ?auto_191138 ) ) ( not ( = ?auto_191132 ?auto_191138 ) ) ( not ( = ?auto_191133 ?auto_191138 ) ) ( not ( = ?auto_191134 ?auto_191138 ) ) ( not ( = ?auto_191135 ?auto_191138 ) ) ( not ( = ?auto_191137 ?auto_191138 ) ) ( not ( = ?auto_191136 ?auto_191138 ) ) ( ON ?auto_191131 ?auto_191130 ) ( ON-TABLE ?auto_191138 ) ( ON ?auto_191132 ?auto_191131 ) ( CLEAR ?auto_191134 ) ( ON ?auto_191133 ?auto_191132 ) ( CLEAR ?auto_191133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191138 ?auto_191130 ?auto_191131 ?auto_191132 )
      ( MAKE-6PILE ?auto_191130 ?auto_191131 ?auto_191132 ?auto_191133 ?auto_191134 ?auto_191135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191139 - BLOCK
      ?auto_191140 - BLOCK
      ?auto_191141 - BLOCK
      ?auto_191142 - BLOCK
      ?auto_191143 - BLOCK
      ?auto_191144 - BLOCK
    )
    :vars
    (
      ?auto_191147 - BLOCK
      ?auto_191146 - BLOCK
      ?auto_191145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191139 ?auto_191140 ) ) ( not ( = ?auto_191139 ?auto_191141 ) ) ( not ( = ?auto_191139 ?auto_191142 ) ) ( not ( = ?auto_191139 ?auto_191143 ) ) ( not ( = ?auto_191139 ?auto_191144 ) ) ( not ( = ?auto_191140 ?auto_191141 ) ) ( not ( = ?auto_191140 ?auto_191142 ) ) ( not ( = ?auto_191140 ?auto_191143 ) ) ( not ( = ?auto_191140 ?auto_191144 ) ) ( not ( = ?auto_191141 ?auto_191142 ) ) ( not ( = ?auto_191141 ?auto_191143 ) ) ( not ( = ?auto_191141 ?auto_191144 ) ) ( not ( = ?auto_191142 ?auto_191143 ) ) ( not ( = ?auto_191142 ?auto_191144 ) ) ( not ( = ?auto_191143 ?auto_191144 ) ) ( ON ?auto_191144 ?auto_191147 ) ( not ( = ?auto_191139 ?auto_191147 ) ) ( not ( = ?auto_191140 ?auto_191147 ) ) ( not ( = ?auto_191141 ?auto_191147 ) ) ( not ( = ?auto_191142 ?auto_191147 ) ) ( not ( = ?auto_191143 ?auto_191147 ) ) ( not ( = ?auto_191144 ?auto_191147 ) ) ( ON-TABLE ?auto_191146 ) ( ON ?auto_191147 ?auto_191146 ) ( not ( = ?auto_191146 ?auto_191147 ) ) ( not ( = ?auto_191146 ?auto_191144 ) ) ( not ( = ?auto_191146 ?auto_191143 ) ) ( not ( = ?auto_191139 ?auto_191146 ) ) ( not ( = ?auto_191140 ?auto_191146 ) ) ( not ( = ?auto_191141 ?auto_191146 ) ) ( not ( = ?auto_191142 ?auto_191146 ) ) ( ON ?auto_191139 ?auto_191145 ) ( not ( = ?auto_191139 ?auto_191145 ) ) ( not ( = ?auto_191140 ?auto_191145 ) ) ( not ( = ?auto_191141 ?auto_191145 ) ) ( not ( = ?auto_191142 ?auto_191145 ) ) ( not ( = ?auto_191143 ?auto_191145 ) ) ( not ( = ?auto_191144 ?auto_191145 ) ) ( not ( = ?auto_191147 ?auto_191145 ) ) ( not ( = ?auto_191146 ?auto_191145 ) ) ( ON ?auto_191140 ?auto_191139 ) ( ON-TABLE ?auto_191145 ) ( ON ?auto_191141 ?auto_191140 ) ( ON ?auto_191142 ?auto_191141 ) ( CLEAR ?auto_191142 ) ( HOLDING ?auto_191143 ) ( CLEAR ?auto_191144 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191146 ?auto_191147 ?auto_191144 ?auto_191143 )
      ( MAKE-6PILE ?auto_191139 ?auto_191140 ?auto_191141 ?auto_191142 ?auto_191143 ?auto_191144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191148 - BLOCK
      ?auto_191149 - BLOCK
      ?auto_191150 - BLOCK
      ?auto_191151 - BLOCK
      ?auto_191152 - BLOCK
      ?auto_191153 - BLOCK
    )
    :vars
    (
      ?auto_191156 - BLOCK
      ?auto_191155 - BLOCK
      ?auto_191154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191148 ?auto_191149 ) ) ( not ( = ?auto_191148 ?auto_191150 ) ) ( not ( = ?auto_191148 ?auto_191151 ) ) ( not ( = ?auto_191148 ?auto_191152 ) ) ( not ( = ?auto_191148 ?auto_191153 ) ) ( not ( = ?auto_191149 ?auto_191150 ) ) ( not ( = ?auto_191149 ?auto_191151 ) ) ( not ( = ?auto_191149 ?auto_191152 ) ) ( not ( = ?auto_191149 ?auto_191153 ) ) ( not ( = ?auto_191150 ?auto_191151 ) ) ( not ( = ?auto_191150 ?auto_191152 ) ) ( not ( = ?auto_191150 ?auto_191153 ) ) ( not ( = ?auto_191151 ?auto_191152 ) ) ( not ( = ?auto_191151 ?auto_191153 ) ) ( not ( = ?auto_191152 ?auto_191153 ) ) ( ON ?auto_191153 ?auto_191156 ) ( not ( = ?auto_191148 ?auto_191156 ) ) ( not ( = ?auto_191149 ?auto_191156 ) ) ( not ( = ?auto_191150 ?auto_191156 ) ) ( not ( = ?auto_191151 ?auto_191156 ) ) ( not ( = ?auto_191152 ?auto_191156 ) ) ( not ( = ?auto_191153 ?auto_191156 ) ) ( ON-TABLE ?auto_191155 ) ( ON ?auto_191156 ?auto_191155 ) ( not ( = ?auto_191155 ?auto_191156 ) ) ( not ( = ?auto_191155 ?auto_191153 ) ) ( not ( = ?auto_191155 ?auto_191152 ) ) ( not ( = ?auto_191148 ?auto_191155 ) ) ( not ( = ?auto_191149 ?auto_191155 ) ) ( not ( = ?auto_191150 ?auto_191155 ) ) ( not ( = ?auto_191151 ?auto_191155 ) ) ( ON ?auto_191148 ?auto_191154 ) ( not ( = ?auto_191148 ?auto_191154 ) ) ( not ( = ?auto_191149 ?auto_191154 ) ) ( not ( = ?auto_191150 ?auto_191154 ) ) ( not ( = ?auto_191151 ?auto_191154 ) ) ( not ( = ?auto_191152 ?auto_191154 ) ) ( not ( = ?auto_191153 ?auto_191154 ) ) ( not ( = ?auto_191156 ?auto_191154 ) ) ( not ( = ?auto_191155 ?auto_191154 ) ) ( ON ?auto_191149 ?auto_191148 ) ( ON-TABLE ?auto_191154 ) ( ON ?auto_191150 ?auto_191149 ) ( ON ?auto_191151 ?auto_191150 ) ( CLEAR ?auto_191153 ) ( ON ?auto_191152 ?auto_191151 ) ( CLEAR ?auto_191152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191154 ?auto_191148 ?auto_191149 ?auto_191150 ?auto_191151 )
      ( MAKE-6PILE ?auto_191148 ?auto_191149 ?auto_191150 ?auto_191151 ?auto_191152 ?auto_191153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191157 - BLOCK
      ?auto_191158 - BLOCK
      ?auto_191159 - BLOCK
      ?auto_191160 - BLOCK
      ?auto_191161 - BLOCK
      ?auto_191162 - BLOCK
    )
    :vars
    (
      ?auto_191164 - BLOCK
      ?auto_191163 - BLOCK
      ?auto_191165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191157 ?auto_191158 ) ) ( not ( = ?auto_191157 ?auto_191159 ) ) ( not ( = ?auto_191157 ?auto_191160 ) ) ( not ( = ?auto_191157 ?auto_191161 ) ) ( not ( = ?auto_191157 ?auto_191162 ) ) ( not ( = ?auto_191158 ?auto_191159 ) ) ( not ( = ?auto_191158 ?auto_191160 ) ) ( not ( = ?auto_191158 ?auto_191161 ) ) ( not ( = ?auto_191158 ?auto_191162 ) ) ( not ( = ?auto_191159 ?auto_191160 ) ) ( not ( = ?auto_191159 ?auto_191161 ) ) ( not ( = ?auto_191159 ?auto_191162 ) ) ( not ( = ?auto_191160 ?auto_191161 ) ) ( not ( = ?auto_191160 ?auto_191162 ) ) ( not ( = ?auto_191161 ?auto_191162 ) ) ( not ( = ?auto_191157 ?auto_191164 ) ) ( not ( = ?auto_191158 ?auto_191164 ) ) ( not ( = ?auto_191159 ?auto_191164 ) ) ( not ( = ?auto_191160 ?auto_191164 ) ) ( not ( = ?auto_191161 ?auto_191164 ) ) ( not ( = ?auto_191162 ?auto_191164 ) ) ( ON-TABLE ?auto_191163 ) ( ON ?auto_191164 ?auto_191163 ) ( not ( = ?auto_191163 ?auto_191164 ) ) ( not ( = ?auto_191163 ?auto_191162 ) ) ( not ( = ?auto_191163 ?auto_191161 ) ) ( not ( = ?auto_191157 ?auto_191163 ) ) ( not ( = ?auto_191158 ?auto_191163 ) ) ( not ( = ?auto_191159 ?auto_191163 ) ) ( not ( = ?auto_191160 ?auto_191163 ) ) ( ON ?auto_191157 ?auto_191165 ) ( not ( = ?auto_191157 ?auto_191165 ) ) ( not ( = ?auto_191158 ?auto_191165 ) ) ( not ( = ?auto_191159 ?auto_191165 ) ) ( not ( = ?auto_191160 ?auto_191165 ) ) ( not ( = ?auto_191161 ?auto_191165 ) ) ( not ( = ?auto_191162 ?auto_191165 ) ) ( not ( = ?auto_191164 ?auto_191165 ) ) ( not ( = ?auto_191163 ?auto_191165 ) ) ( ON ?auto_191158 ?auto_191157 ) ( ON-TABLE ?auto_191165 ) ( ON ?auto_191159 ?auto_191158 ) ( ON ?auto_191160 ?auto_191159 ) ( ON ?auto_191161 ?auto_191160 ) ( CLEAR ?auto_191161 ) ( HOLDING ?auto_191162 ) ( CLEAR ?auto_191164 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191163 ?auto_191164 ?auto_191162 )
      ( MAKE-6PILE ?auto_191157 ?auto_191158 ?auto_191159 ?auto_191160 ?auto_191161 ?auto_191162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191166 - BLOCK
      ?auto_191167 - BLOCK
      ?auto_191168 - BLOCK
      ?auto_191169 - BLOCK
      ?auto_191170 - BLOCK
      ?auto_191171 - BLOCK
    )
    :vars
    (
      ?auto_191174 - BLOCK
      ?auto_191173 - BLOCK
      ?auto_191172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191166 ?auto_191167 ) ) ( not ( = ?auto_191166 ?auto_191168 ) ) ( not ( = ?auto_191166 ?auto_191169 ) ) ( not ( = ?auto_191166 ?auto_191170 ) ) ( not ( = ?auto_191166 ?auto_191171 ) ) ( not ( = ?auto_191167 ?auto_191168 ) ) ( not ( = ?auto_191167 ?auto_191169 ) ) ( not ( = ?auto_191167 ?auto_191170 ) ) ( not ( = ?auto_191167 ?auto_191171 ) ) ( not ( = ?auto_191168 ?auto_191169 ) ) ( not ( = ?auto_191168 ?auto_191170 ) ) ( not ( = ?auto_191168 ?auto_191171 ) ) ( not ( = ?auto_191169 ?auto_191170 ) ) ( not ( = ?auto_191169 ?auto_191171 ) ) ( not ( = ?auto_191170 ?auto_191171 ) ) ( not ( = ?auto_191166 ?auto_191174 ) ) ( not ( = ?auto_191167 ?auto_191174 ) ) ( not ( = ?auto_191168 ?auto_191174 ) ) ( not ( = ?auto_191169 ?auto_191174 ) ) ( not ( = ?auto_191170 ?auto_191174 ) ) ( not ( = ?auto_191171 ?auto_191174 ) ) ( ON-TABLE ?auto_191173 ) ( ON ?auto_191174 ?auto_191173 ) ( not ( = ?auto_191173 ?auto_191174 ) ) ( not ( = ?auto_191173 ?auto_191171 ) ) ( not ( = ?auto_191173 ?auto_191170 ) ) ( not ( = ?auto_191166 ?auto_191173 ) ) ( not ( = ?auto_191167 ?auto_191173 ) ) ( not ( = ?auto_191168 ?auto_191173 ) ) ( not ( = ?auto_191169 ?auto_191173 ) ) ( ON ?auto_191166 ?auto_191172 ) ( not ( = ?auto_191166 ?auto_191172 ) ) ( not ( = ?auto_191167 ?auto_191172 ) ) ( not ( = ?auto_191168 ?auto_191172 ) ) ( not ( = ?auto_191169 ?auto_191172 ) ) ( not ( = ?auto_191170 ?auto_191172 ) ) ( not ( = ?auto_191171 ?auto_191172 ) ) ( not ( = ?auto_191174 ?auto_191172 ) ) ( not ( = ?auto_191173 ?auto_191172 ) ) ( ON ?auto_191167 ?auto_191166 ) ( ON-TABLE ?auto_191172 ) ( ON ?auto_191168 ?auto_191167 ) ( ON ?auto_191169 ?auto_191168 ) ( ON ?auto_191170 ?auto_191169 ) ( CLEAR ?auto_191174 ) ( ON ?auto_191171 ?auto_191170 ) ( CLEAR ?auto_191171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191172 ?auto_191166 ?auto_191167 ?auto_191168 ?auto_191169 ?auto_191170 )
      ( MAKE-6PILE ?auto_191166 ?auto_191167 ?auto_191168 ?auto_191169 ?auto_191170 ?auto_191171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191175 - BLOCK
      ?auto_191176 - BLOCK
      ?auto_191177 - BLOCK
      ?auto_191178 - BLOCK
      ?auto_191179 - BLOCK
      ?auto_191180 - BLOCK
    )
    :vars
    (
      ?auto_191183 - BLOCK
      ?auto_191181 - BLOCK
      ?auto_191182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191175 ?auto_191176 ) ) ( not ( = ?auto_191175 ?auto_191177 ) ) ( not ( = ?auto_191175 ?auto_191178 ) ) ( not ( = ?auto_191175 ?auto_191179 ) ) ( not ( = ?auto_191175 ?auto_191180 ) ) ( not ( = ?auto_191176 ?auto_191177 ) ) ( not ( = ?auto_191176 ?auto_191178 ) ) ( not ( = ?auto_191176 ?auto_191179 ) ) ( not ( = ?auto_191176 ?auto_191180 ) ) ( not ( = ?auto_191177 ?auto_191178 ) ) ( not ( = ?auto_191177 ?auto_191179 ) ) ( not ( = ?auto_191177 ?auto_191180 ) ) ( not ( = ?auto_191178 ?auto_191179 ) ) ( not ( = ?auto_191178 ?auto_191180 ) ) ( not ( = ?auto_191179 ?auto_191180 ) ) ( not ( = ?auto_191175 ?auto_191183 ) ) ( not ( = ?auto_191176 ?auto_191183 ) ) ( not ( = ?auto_191177 ?auto_191183 ) ) ( not ( = ?auto_191178 ?auto_191183 ) ) ( not ( = ?auto_191179 ?auto_191183 ) ) ( not ( = ?auto_191180 ?auto_191183 ) ) ( ON-TABLE ?auto_191181 ) ( not ( = ?auto_191181 ?auto_191183 ) ) ( not ( = ?auto_191181 ?auto_191180 ) ) ( not ( = ?auto_191181 ?auto_191179 ) ) ( not ( = ?auto_191175 ?auto_191181 ) ) ( not ( = ?auto_191176 ?auto_191181 ) ) ( not ( = ?auto_191177 ?auto_191181 ) ) ( not ( = ?auto_191178 ?auto_191181 ) ) ( ON ?auto_191175 ?auto_191182 ) ( not ( = ?auto_191175 ?auto_191182 ) ) ( not ( = ?auto_191176 ?auto_191182 ) ) ( not ( = ?auto_191177 ?auto_191182 ) ) ( not ( = ?auto_191178 ?auto_191182 ) ) ( not ( = ?auto_191179 ?auto_191182 ) ) ( not ( = ?auto_191180 ?auto_191182 ) ) ( not ( = ?auto_191183 ?auto_191182 ) ) ( not ( = ?auto_191181 ?auto_191182 ) ) ( ON ?auto_191176 ?auto_191175 ) ( ON-TABLE ?auto_191182 ) ( ON ?auto_191177 ?auto_191176 ) ( ON ?auto_191178 ?auto_191177 ) ( ON ?auto_191179 ?auto_191178 ) ( ON ?auto_191180 ?auto_191179 ) ( CLEAR ?auto_191180 ) ( HOLDING ?auto_191183 ) ( CLEAR ?auto_191181 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191181 ?auto_191183 )
      ( MAKE-6PILE ?auto_191175 ?auto_191176 ?auto_191177 ?auto_191178 ?auto_191179 ?auto_191180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191184 - BLOCK
      ?auto_191185 - BLOCK
      ?auto_191186 - BLOCK
      ?auto_191187 - BLOCK
      ?auto_191188 - BLOCK
      ?auto_191189 - BLOCK
    )
    :vars
    (
      ?auto_191191 - BLOCK
      ?auto_191190 - BLOCK
      ?auto_191192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191184 ?auto_191185 ) ) ( not ( = ?auto_191184 ?auto_191186 ) ) ( not ( = ?auto_191184 ?auto_191187 ) ) ( not ( = ?auto_191184 ?auto_191188 ) ) ( not ( = ?auto_191184 ?auto_191189 ) ) ( not ( = ?auto_191185 ?auto_191186 ) ) ( not ( = ?auto_191185 ?auto_191187 ) ) ( not ( = ?auto_191185 ?auto_191188 ) ) ( not ( = ?auto_191185 ?auto_191189 ) ) ( not ( = ?auto_191186 ?auto_191187 ) ) ( not ( = ?auto_191186 ?auto_191188 ) ) ( not ( = ?auto_191186 ?auto_191189 ) ) ( not ( = ?auto_191187 ?auto_191188 ) ) ( not ( = ?auto_191187 ?auto_191189 ) ) ( not ( = ?auto_191188 ?auto_191189 ) ) ( not ( = ?auto_191184 ?auto_191191 ) ) ( not ( = ?auto_191185 ?auto_191191 ) ) ( not ( = ?auto_191186 ?auto_191191 ) ) ( not ( = ?auto_191187 ?auto_191191 ) ) ( not ( = ?auto_191188 ?auto_191191 ) ) ( not ( = ?auto_191189 ?auto_191191 ) ) ( ON-TABLE ?auto_191190 ) ( not ( = ?auto_191190 ?auto_191191 ) ) ( not ( = ?auto_191190 ?auto_191189 ) ) ( not ( = ?auto_191190 ?auto_191188 ) ) ( not ( = ?auto_191184 ?auto_191190 ) ) ( not ( = ?auto_191185 ?auto_191190 ) ) ( not ( = ?auto_191186 ?auto_191190 ) ) ( not ( = ?auto_191187 ?auto_191190 ) ) ( ON ?auto_191184 ?auto_191192 ) ( not ( = ?auto_191184 ?auto_191192 ) ) ( not ( = ?auto_191185 ?auto_191192 ) ) ( not ( = ?auto_191186 ?auto_191192 ) ) ( not ( = ?auto_191187 ?auto_191192 ) ) ( not ( = ?auto_191188 ?auto_191192 ) ) ( not ( = ?auto_191189 ?auto_191192 ) ) ( not ( = ?auto_191191 ?auto_191192 ) ) ( not ( = ?auto_191190 ?auto_191192 ) ) ( ON ?auto_191185 ?auto_191184 ) ( ON-TABLE ?auto_191192 ) ( ON ?auto_191186 ?auto_191185 ) ( ON ?auto_191187 ?auto_191186 ) ( ON ?auto_191188 ?auto_191187 ) ( ON ?auto_191189 ?auto_191188 ) ( CLEAR ?auto_191190 ) ( ON ?auto_191191 ?auto_191189 ) ( CLEAR ?auto_191191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191192 ?auto_191184 ?auto_191185 ?auto_191186 ?auto_191187 ?auto_191188 ?auto_191189 )
      ( MAKE-6PILE ?auto_191184 ?auto_191185 ?auto_191186 ?auto_191187 ?auto_191188 ?auto_191189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191193 - BLOCK
      ?auto_191194 - BLOCK
      ?auto_191195 - BLOCK
      ?auto_191196 - BLOCK
      ?auto_191197 - BLOCK
      ?auto_191198 - BLOCK
    )
    :vars
    (
      ?auto_191200 - BLOCK
      ?auto_191201 - BLOCK
      ?auto_191199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191193 ?auto_191194 ) ) ( not ( = ?auto_191193 ?auto_191195 ) ) ( not ( = ?auto_191193 ?auto_191196 ) ) ( not ( = ?auto_191193 ?auto_191197 ) ) ( not ( = ?auto_191193 ?auto_191198 ) ) ( not ( = ?auto_191194 ?auto_191195 ) ) ( not ( = ?auto_191194 ?auto_191196 ) ) ( not ( = ?auto_191194 ?auto_191197 ) ) ( not ( = ?auto_191194 ?auto_191198 ) ) ( not ( = ?auto_191195 ?auto_191196 ) ) ( not ( = ?auto_191195 ?auto_191197 ) ) ( not ( = ?auto_191195 ?auto_191198 ) ) ( not ( = ?auto_191196 ?auto_191197 ) ) ( not ( = ?auto_191196 ?auto_191198 ) ) ( not ( = ?auto_191197 ?auto_191198 ) ) ( not ( = ?auto_191193 ?auto_191200 ) ) ( not ( = ?auto_191194 ?auto_191200 ) ) ( not ( = ?auto_191195 ?auto_191200 ) ) ( not ( = ?auto_191196 ?auto_191200 ) ) ( not ( = ?auto_191197 ?auto_191200 ) ) ( not ( = ?auto_191198 ?auto_191200 ) ) ( not ( = ?auto_191201 ?auto_191200 ) ) ( not ( = ?auto_191201 ?auto_191198 ) ) ( not ( = ?auto_191201 ?auto_191197 ) ) ( not ( = ?auto_191193 ?auto_191201 ) ) ( not ( = ?auto_191194 ?auto_191201 ) ) ( not ( = ?auto_191195 ?auto_191201 ) ) ( not ( = ?auto_191196 ?auto_191201 ) ) ( ON ?auto_191193 ?auto_191199 ) ( not ( = ?auto_191193 ?auto_191199 ) ) ( not ( = ?auto_191194 ?auto_191199 ) ) ( not ( = ?auto_191195 ?auto_191199 ) ) ( not ( = ?auto_191196 ?auto_191199 ) ) ( not ( = ?auto_191197 ?auto_191199 ) ) ( not ( = ?auto_191198 ?auto_191199 ) ) ( not ( = ?auto_191200 ?auto_191199 ) ) ( not ( = ?auto_191201 ?auto_191199 ) ) ( ON ?auto_191194 ?auto_191193 ) ( ON-TABLE ?auto_191199 ) ( ON ?auto_191195 ?auto_191194 ) ( ON ?auto_191196 ?auto_191195 ) ( ON ?auto_191197 ?auto_191196 ) ( ON ?auto_191198 ?auto_191197 ) ( ON ?auto_191200 ?auto_191198 ) ( CLEAR ?auto_191200 ) ( HOLDING ?auto_191201 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191201 )
      ( MAKE-6PILE ?auto_191193 ?auto_191194 ?auto_191195 ?auto_191196 ?auto_191197 ?auto_191198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191202 - BLOCK
      ?auto_191203 - BLOCK
      ?auto_191204 - BLOCK
      ?auto_191205 - BLOCK
      ?auto_191206 - BLOCK
      ?auto_191207 - BLOCK
    )
    :vars
    (
      ?auto_191210 - BLOCK
      ?auto_191209 - BLOCK
      ?auto_191208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191202 ?auto_191203 ) ) ( not ( = ?auto_191202 ?auto_191204 ) ) ( not ( = ?auto_191202 ?auto_191205 ) ) ( not ( = ?auto_191202 ?auto_191206 ) ) ( not ( = ?auto_191202 ?auto_191207 ) ) ( not ( = ?auto_191203 ?auto_191204 ) ) ( not ( = ?auto_191203 ?auto_191205 ) ) ( not ( = ?auto_191203 ?auto_191206 ) ) ( not ( = ?auto_191203 ?auto_191207 ) ) ( not ( = ?auto_191204 ?auto_191205 ) ) ( not ( = ?auto_191204 ?auto_191206 ) ) ( not ( = ?auto_191204 ?auto_191207 ) ) ( not ( = ?auto_191205 ?auto_191206 ) ) ( not ( = ?auto_191205 ?auto_191207 ) ) ( not ( = ?auto_191206 ?auto_191207 ) ) ( not ( = ?auto_191202 ?auto_191210 ) ) ( not ( = ?auto_191203 ?auto_191210 ) ) ( not ( = ?auto_191204 ?auto_191210 ) ) ( not ( = ?auto_191205 ?auto_191210 ) ) ( not ( = ?auto_191206 ?auto_191210 ) ) ( not ( = ?auto_191207 ?auto_191210 ) ) ( not ( = ?auto_191209 ?auto_191210 ) ) ( not ( = ?auto_191209 ?auto_191207 ) ) ( not ( = ?auto_191209 ?auto_191206 ) ) ( not ( = ?auto_191202 ?auto_191209 ) ) ( not ( = ?auto_191203 ?auto_191209 ) ) ( not ( = ?auto_191204 ?auto_191209 ) ) ( not ( = ?auto_191205 ?auto_191209 ) ) ( ON ?auto_191202 ?auto_191208 ) ( not ( = ?auto_191202 ?auto_191208 ) ) ( not ( = ?auto_191203 ?auto_191208 ) ) ( not ( = ?auto_191204 ?auto_191208 ) ) ( not ( = ?auto_191205 ?auto_191208 ) ) ( not ( = ?auto_191206 ?auto_191208 ) ) ( not ( = ?auto_191207 ?auto_191208 ) ) ( not ( = ?auto_191210 ?auto_191208 ) ) ( not ( = ?auto_191209 ?auto_191208 ) ) ( ON ?auto_191203 ?auto_191202 ) ( ON-TABLE ?auto_191208 ) ( ON ?auto_191204 ?auto_191203 ) ( ON ?auto_191205 ?auto_191204 ) ( ON ?auto_191206 ?auto_191205 ) ( ON ?auto_191207 ?auto_191206 ) ( ON ?auto_191210 ?auto_191207 ) ( ON ?auto_191209 ?auto_191210 ) ( CLEAR ?auto_191209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191208 ?auto_191202 ?auto_191203 ?auto_191204 ?auto_191205 ?auto_191206 ?auto_191207 ?auto_191210 )
      ( MAKE-6PILE ?auto_191202 ?auto_191203 ?auto_191204 ?auto_191205 ?auto_191206 ?auto_191207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191222 - BLOCK
    )
    :vars
    (
      ?auto_191223 - BLOCK
      ?auto_191225 - BLOCK
      ?auto_191224 - BLOCK
      ?auto_191227 - BLOCK
      ?auto_191228 - BLOCK
      ?auto_191229 - BLOCK
      ?auto_191226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191223 ?auto_191222 ) ( ON-TABLE ?auto_191222 ) ( not ( = ?auto_191222 ?auto_191223 ) ) ( not ( = ?auto_191222 ?auto_191225 ) ) ( not ( = ?auto_191222 ?auto_191224 ) ) ( not ( = ?auto_191223 ?auto_191225 ) ) ( not ( = ?auto_191223 ?auto_191224 ) ) ( not ( = ?auto_191225 ?auto_191224 ) ) ( ON ?auto_191225 ?auto_191223 ) ( CLEAR ?auto_191225 ) ( HOLDING ?auto_191224 ) ( CLEAR ?auto_191227 ) ( ON-TABLE ?auto_191228 ) ( ON ?auto_191229 ?auto_191228 ) ( ON ?auto_191226 ?auto_191229 ) ( ON ?auto_191227 ?auto_191226 ) ( not ( = ?auto_191228 ?auto_191229 ) ) ( not ( = ?auto_191228 ?auto_191226 ) ) ( not ( = ?auto_191228 ?auto_191227 ) ) ( not ( = ?auto_191228 ?auto_191224 ) ) ( not ( = ?auto_191229 ?auto_191226 ) ) ( not ( = ?auto_191229 ?auto_191227 ) ) ( not ( = ?auto_191229 ?auto_191224 ) ) ( not ( = ?auto_191226 ?auto_191227 ) ) ( not ( = ?auto_191226 ?auto_191224 ) ) ( not ( = ?auto_191227 ?auto_191224 ) ) ( not ( = ?auto_191222 ?auto_191227 ) ) ( not ( = ?auto_191222 ?auto_191228 ) ) ( not ( = ?auto_191222 ?auto_191229 ) ) ( not ( = ?auto_191222 ?auto_191226 ) ) ( not ( = ?auto_191223 ?auto_191227 ) ) ( not ( = ?auto_191223 ?auto_191228 ) ) ( not ( = ?auto_191223 ?auto_191229 ) ) ( not ( = ?auto_191223 ?auto_191226 ) ) ( not ( = ?auto_191225 ?auto_191227 ) ) ( not ( = ?auto_191225 ?auto_191228 ) ) ( not ( = ?auto_191225 ?auto_191229 ) ) ( not ( = ?auto_191225 ?auto_191226 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191228 ?auto_191229 ?auto_191226 ?auto_191227 ?auto_191224 )
      ( MAKE-1PILE ?auto_191222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191230 - BLOCK
    )
    :vars
    (
      ?auto_191232 - BLOCK
      ?auto_191233 - BLOCK
      ?auto_191235 - BLOCK
      ?auto_191237 - BLOCK
      ?auto_191231 - BLOCK
      ?auto_191234 - BLOCK
      ?auto_191236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191232 ?auto_191230 ) ( ON-TABLE ?auto_191230 ) ( not ( = ?auto_191230 ?auto_191232 ) ) ( not ( = ?auto_191230 ?auto_191233 ) ) ( not ( = ?auto_191230 ?auto_191235 ) ) ( not ( = ?auto_191232 ?auto_191233 ) ) ( not ( = ?auto_191232 ?auto_191235 ) ) ( not ( = ?auto_191233 ?auto_191235 ) ) ( ON ?auto_191233 ?auto_191232 ) ( CLEAR ?auto_191237 ) ( ON-TABLE ?auto_191231 ) ( ON ?auto_191234 ?auto_191231 ) ( ON ?auto_191236 ?auto_191234 ) ( ON ?auto_191237 ?auto_191236 ) ( not ( = ?auto_191231 ?auto_191234 ) ) ( not ( = ?auto_191231 ?auto_191236 ) ) ( not ( = ?auto_191231 ?auto_191237 ) ) ( not ( = ?auto_191231 ?auto_191235 ) ) ( not ( = ?auto_191234 ?auto_191236 ) ) ( not ( = ?auto_191234 ?auto_191237 ) ) ( not ( = ?auto_191234 ?auto_191235 ) ) ( not ( = ?auto_191236 ?auto_191237 ) ) ( not ( = ?auto_191236 ?auto_191235 ) ) ( not ( = ?auto_191237 ?auto_191235 ) ) ( not ( = ?auto_191230 ?auto_191237 ) ) ( not ( = ?auto_191230 ?auto_191231 ) ) ( not ( = ?auto_191230 ?auto_191234 ) ) ( not ( = ?auto_191230 ?auto_191236 ) ) ( not ( = ?auto_191232 ?auto_191237 ) ) ( not ( = ?auto_191232 ?auto_191231 ) ) ( not ( = ?auto_191232 ?auto_191234 ) ) ( not ( = ?auto_191232 ?auto_191236 ) ) ( not ( = ?auto_191233 ?auto_191237 ) ) ( not ( = ?auto_191233 ?auto_191231 ) ) ( not ( = ?auto_191233 ?auto_191234 ) ) ( not ( = ?auto_191233 ?auto_191236 ) ) ( ON ?auto_191235 ?auto_191233 ) ( CLEAR ?auto_191235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191230 ?auto_191232 ?auto_191233 )
      ( MAKE-1PILE ?auto_191230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191238 - BLOCK
    )
    :vars
    (
      ?auto_191244 - BLOCK
      ?auto_191240 - BLOCK
      ?auto_191239 - BLOCK
      ?auto_191243 - BLOCK
      ?auto_191245 - BLOCK
      ?auto_191242 - BLOCK
      ?auto_191241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191244 ?auto_191238 ) ( ON-TABLE ?auto_191238 ) ( not ( = ?auto_191238 ?auto_191244 ) ) ( not ( = ?auto_191238 ?auto_191240 ) ) ( not ( = ?auto_191238 ?auto_191239 ) ) ( not ( = ?auto_191244 ?auto_191240 ) ) ( not ( = ?auto_191244 ?auto_191239 ) ) ( not ( = ?auto_191240 ?auto_191239 ) ) ( ON ?auto_191240 ?auto_191244 ) ( ON-TABLE ?auto_191243 ) ( ON ?auto_191245 ?auto_191243 ) ( ON ?auto_191242 ?auto_191245 ) ( not ( = ?auto_191243 ?auto_191245 ) ) ( not ( = ?auto_191243 ?auto_191242 ) ) ( not ( = ?auto_191243 ?auto_191241 ) ) ( not ( = ?auto_191243 ?auto_191239 ) ) ( not ( = ?auto_191245 ?auto_191242 ) ) ( not ( = ?auto_191245 ?auto_191241 ) ) ( not ( = ?auto_191245 ?auto_191239 ) ) ( not ( = ?auto_191242 ?auto_191241 ) ) ( not ( = ?auto_191242 ?auto_191239 ) ) ( not ( = ?auto_191241 ?auto_191239 ) ) ( not ( = ?auto_191238 ?auto_191241 ) ) ( not ( = ?auto_191238 ?auto_191243 ) ) ( not ( = ?auto_191238 ?auto_191245 ) ) ( not ( = ?auto_191238 ?auto_191242 ) ) ( not ( = ?auto_191244 ?auto_191241 ) ) ( not ( = ?auto_191244 ?auto_191243 ) ) ( not ( = ?auto_191244 ?auto_191245 ) ) ( not ( = ?auto_191244 ?auto_191242 ) ) ( not ( = ?auto_191240 ?auto_191241 ) ) ( not ( = ?auto_191240 ?auto_191243 ) ) ( not ( = ?auto_191240 ?auto_191245 ) ) ( not ( = ?auto_191240 ?auto_191242 ) ) ( ON ?auto_191239 ?auto_191240 ) ( CLEAR ?auto_191239 ) ( HOLDING ?auto_191241 ) ( CLEAR ?auto_191242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191243 ?auto_191245 ?auto_191242 ?auto_191241 )
      ( MAKE-1PILE ?auto_191238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191246 - BLOCK
    )
    :vars
    (
      ?auto_191252 - BLOCK
      ?auto_191248 - BLOCK
      ?auto_191249 - BLOCK
      ?auto_191253 - BLOCK
      ?auto_191250 - BLOCK
      ?auto_191251 - BLOCK
      ?auto_191247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191252 ?auto_191246 ) ( ON-TABLE ?auto_191246 ) ( not ( = ?auto_191246 ?auto_191252 ) ) ( not ( = ?auto_191246 ?auto_191248 ) ) ( not ( = ?auto_191246 ?auto_191249 ) ) ( not ( = ?auto_191252 ?auto_191248 ) ) ( not ( = ?auto_191252 ?auto_191249 ) ) ( not ( = ?auto_191248 ?auto_191249 ) ) ( ON ?auto_191248 ?auto_191252 ) ( ON-TABLE ?auto_191253 ) ( ON ?auto_191250 ?auto_191253 ) ( ON ?auto_191251 ?auto_191250 ) ( not ( = ?auto_191253 ?auto_191250 ) ) ( not ( = ?auto_191253 ?auto_191251 ) ) ( not ( = ?auto_191253 ?auto_191247 ) ) ( not ( = ?auto_191253 ?auto_191249 ) ) ( not ( = ?auto_191250 ?auto_191251 ) ) ( not ( = ?auto_191250 ?auto_191247 ) ) ( not ( = ?auto_191250 ?auto_191249 ) ) ( not ( = ?auto_191251 ?auto_191247 ) ) ( not ( = ?auto_191251 ?auto_191249 ) ) ( not ( = ?auto_191247 ?auto_191249 ) ) ( not ( = ?auto_191246 ?auto_191247 ) ) ( not ( = ?auto_191246 ?auto_191253 ) ) ( not ( = ?auto_191246 ?auto_191250 ) ) ( not ( = ?auto_191246 ?auto_191251 ) ) ( not ( = ?auto_191252 ?auto_191247 ) ) ( not ( = ?auto_191252 ?auto_191253 ) ) ( not ( = ?auto_191252 ?auto_191250 ) ) ( not ( = ?auto_191252 ?auto_191251 ) ) ( not ( = ?auto_191248 ?auto_191247 ) ) ( not ( = ?auto_191248 ?auto_191253 ) ) ( not ( = ?auto_191248 ?auto_191250 ) ) ( not ( = ?auto_191248 ?auto_191251 ) ) ( ON ?auto_191249 ?auto_191248 ) ( CLEAR ?auto_191251 ) ( ON ?auto_191247 ?auto_191249 ) ( CLEAR ?auto_191247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191246 ?auto_191252 ?auto_191248 ?auto_191249 )
      ( MAKE-1PILE ?auto_191246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191254 - BLOCK
    )
    :vars
    (
      ?auto_191260 - BLOCK
      ?auto_191257 - BLOCK
      ?auto_191259 - BLOCK
      ?auto_191255 - BLOCK
      ?auto_191256 - BLOCK
      ?auto_191261 - BLOCK
      ?auto_191258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191260 ?auto_191254 ) ( ON-TABLE ?auto_191254 ) ( not ( = ?auto_191254 ?auto_191260 ) ) ( not ( = ?auto_191254 ?auto_191257 ) ) ( not ( = ?auto_191254 ?auto_191259 ) ) ( not ( = ?auto_191260 ?auto_191257 ) ) ( not ( = ?auto_191260 ?auto_191259 ) ) ( not ( = ?auto_191257 ?auto_191259 ) ) ( ON ?auto_191257 ?auto_191260 ) ( ON-TABLE ?auto_191255 ) ( ON ?auto_191256 ?auto_191255 ) ( not ( = ?auto_191255 ?auto_191256 ) ) ( not ( = ?auto_191255 ?auto_191261 ) ) ( not ( = ?auto_191255 ?auto_191258 ) ) ( not ( = ?auto_191255 ?auto_191259 ) ) ( not ( = ?auto_191256 ?auto_191261 ) ) ( not ( = ?auto_191256 ?auto_191258 ) ) ( not ( = ?auto_191256 ?auto_191259 ) ) ( not ( = ?auto_191261 ?auto_191258 ) ) ( not ( = ?auto_191261 ?auto_191259 ) ) ( not ( = ?auto_191258 ?auto_191259 ) ) ( not ( = ?auto_191254 ?auto_191258 ) ) ( not ( = ?auto_191254 ?auto_191255 ) ) ( not ( = ?auto_191254 ?auto_191256 ) ) ( not ( = ?auto_191254 ?auto_191261 ) ) ( not ( = ?auto_191260 ?auto_191258 ) ) ( not ( = ?auto_191260 ?auto_191255 ) ) ( not ( = ?auto_191260 ?auto_191256 ) ) ( not ( = ?auto_191260 ?auto_191261 ) ) ( not ( = ?auto_191257 ?auto_191258 ) ) ( not ( = ?auto_191257 ?auto_191255 ) ) ( not ( = ?auto_191257 ?auto_191256 ) ) ( not ( = ?auto_191257 ?auto_191261 ) ) ( ON ?auto_191259 ?auto_191257 ) ( ON ?auto_191258 ?auto_191259 ) ( CLEAR ?auto_191258 ) ( HOLDING ?auto_191261 ) ( CLEAR ?auto_191256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191255 ?auto_191256 ?auto_191261 )
      ( MAKE-1PILE ?auto_191254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191262 - BLOCK
    )
    :vars
    (
      ?auto_191269 - BLOCK
      ?auto_191264 - BLOCK
      ?auto_191266 - BLOCK
      ?auto_191265 - BLOCK
      ?auto_191267 - BLOCK
      ?auto_191263 - BLOCK
      ?auto_191268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191269 ?auto_191262 ) ( ON-TABLE ?auto_191262 ) ( not ( = ?auto_191262 ?auto_191269 ) ) ( not ( = ?auto_191262 ?auto_191264 ) ) ( not ( = ?auto_191262 ?auto_191266 ) ) ( not ( = ?auto_191269 ?auto_191264 ) ) ( not ( = ?auto_191269 ?auto_191266 ) ) ( not ( = ?auto_191264 ?auto_191266 ) ) ( ON ?auto_191264 ?auto_191269 ) ( ON-TABLE ?auto_191265 ) ( ON ?auto_191267 ?auto_191265 ) ( not ( = ?auto_191265 ?auto_191267 ) ) ( not ( = ?auto_191265 ?auto_191263 ) ) ( not ( = ?auto_191265 ?auto_191268 ) ) ( not ( = ?auto_191265 ?auto_191266 ) ) ( not ( = ?auto_191267 ?auto_191263 ) ) ( not ( = ?auto_191267 ?auto_191268 ) ) ( not ( = ?auto_191267 ?auto_191266 ) ) ( not ( = ?auto_191263 ?auto_191268 ) ) ( not ( = ?auto_191263 ?auto_191266 ) ) ( not ( = ?auto_191268 ?auto_191266 ) ) ( not ( = ?auto_191262 ?auto_191268 ) ) ( not ( = ?auto_191262 ?auto_191265 ) ) ( not ( = ?auto_191262 ?auto_191267 ) ) ( not ( = ?auto_191262 ?auto_191263 ) ) ( not ( = ?auto_191269 ?auto_191268 ) ) ( not ( = ?auto_191269 ?auto_191265 ) ) ( not ( = ?auto_191269 ?auto_191267 ) ) ( not ( = ?auto_191269 ?auto_191263 ) ) ( not ( = ?auto_191264 ?auto_191268 ) ) ( not ( = ?auto_191264 ?auto_191265 ) ) ( not ( = ?auto_191264 ?auto_191267 ) ) ( not ( = ?auto_191264 ?auto_191263 ) ) ( ON ?auto_191266 ?auto_191264 ) ( ON ?auto_191268 ?auto_191266 ) ( CLEAR ?auto_191267 ) ( ON ?auto_191263 ?auto_191268 ) ( CLEAR ?auto_191263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191262 ?auto_191269 ?auto_191264 ?auto_191266 ?auto_191268 )
      ( MAKE-1PILE ?auto_191262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191270 - BLOCK
    )
    :vars
    (
      ?auto_191275 - BLOCK
      ?auto_191277 - BLOCK
      ?auto_191274 - BLOCK
      ?auto_191272 - BLOCK
      ?auto_191273 - BLOCK
      ?auto_191276 - BLOCK
      ?auto_191271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191275 ?auto_191270 ) ( ON-TABLE ?auto_191270 ) ( not ( = ?auto_191270 ?auto_191275 ) ) ( not ( = ?auto_191270 ?auto_191277 ) ) ( not ( = ?auto_191270 ?auto_191274 ) ) ( not ( = ?auto_191275 ?auto_191277 ) ) ( not ( = ?auto_191275 ?auto_191274 ) ) ( not ( = ?auto_191277 ?auto_191274 ) ) ( ON ?auto_191277 ?auto_191275 ) ( ON-TABLE ?auto_191272 ) ( not ( = ?auto_191272 ?auto_191273 ) ) ( not ( = ?auto_191272 ?auto_191276 ) ) ( not ( = ?auto_191272 ?auto_191271 ) ) ( not ( = ?auto_191272 ?auto_191274 ) ) ( not ( = ?auto_191273 ?auto_191276 ) ) ( not ( = ?auto_191273 ?auto_191271 ) ) ( not ( = ?auto_191273 ?auto_191274 ) ) ( not ( = ?auto_191276 ?auto_191271 ) ) ( not ( = ?auto_191276 ?auto_191274 ) ) ( not ( = ?auto_191271 ?auto_191274 ) ) ( not ( = ?auto_191270 ?auto_191271 ) ) ( not ( = ?auto_191270 ?auto_191272 ) ) ( not ( = ?auto_191270 ?auto_191273 ) ) ( not ( = ?auto_191270 ?auto_191276 ) ) ( not ( = ?auto_191275 ?auto_191271 ) ) ( not ( = ?auto_191275 ?auto_191272 ) ) ( not ( = ?auto_191275 ?auto_191273 ) ) ( not ( = ?auto_191275 ?auto_191276 ) ) ( not ( = ?auto_191277 ?auto_191271 ) ) ( not ( = ?auto_191277 ?auto_191272 ) ) ( not ( = ?auto_191277 ?auto_191273 ) ) ( not ( = ?auto_191277 ?auto_191276 ) ) ( ON ?auto_191274 ?auto_191277 ) ( ON ?auto_191271 ?auto_191274 ) ( ON ?auto_191276 ?auto_191271 ) ( CLEAR ?auto_191276 ) ( HOLDING ?auto_191273 ) ( CLEAR ?auto_191272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191272 ?auto_191273 )
      ( MAKE-1PILE ?auto_191270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191278 - BLOCK
    )
    :vars
    (
      ?auto_191284 - BLOCK
      ?auto_191282 - BLOCK
      ?auto_191285 - BLOCK
      ?auto_191280 - BLOCK
      ?auto_191279 - BLOCK
      ?auto_191281 - BLOCK
      ?auto_191283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191284 ?auto_191278 ) ( ON-TABLE ?auto_191278 ) ( not ( = ?auto_191278 ?auto_191284 ) ) ( not ( = ?auto_191278 ?auto_191282 ) ) ( not ( = ?auto_191278 ?auto_191285 ) ) ( not ( = ?auto_191284 ?auto_191282 ) ) ( not ( = ?auto_191284 ?auto_191285 ) ) ( not ( = ?auto_191282 ?auto_191285 ) ) ( ON ?auto_191282 ?auto_191284 ) ( ON-TABLE ?auto_191280 ) ( not ( = ?auto_191280 ?auto_191279 ) ) ( not ( = ?auto_191280 ?auto_191281 ) ) ( not ( = ?auto_191280 ?auto_191283 ) ) ( not ( = ?auto_191280 ?auto_191285 ) ) ( not ( = ?auto_191279 ?auto_191281 ) ) ( not ( = ?auto_191279 ?auto_191283 ) ) ( not ( = ?auto_191279 ?auto_191285 ) ) ( not ( = ?auto_191281 ?auto_191283 ) ) ( not ( = ?auto_191281 ?auto_191285 ) ) ( not ( = ?auto_191283 ?auto_191285 ) ) ( not ( = ?auto_191278 ?auto_191283 ) ) ( not ( = ?auto_191278 ?auto_191280 ) ) ( not ( = ?auto_191278 ?auto_191279 ) ) ( not ( = ?auto_191278 ?auto_191281 ) ) ( not ( = ?auto_191284 ?auto_191283 ) ) ( not ( = ?auto_191284 ?auto_191280 ) ) ( not ( = ?auto_191284 ?auto_191279 ) ) ( not ( = ?auto_191284 ?auto_191281 ) ) ( not ( = ?auto_191282 ?auto_191283 ) ) ( not ( = ?auto_191282 ?auto_191280 ) ) ( not ( = ?auto_191282 ?auto_191279 ) ) ( not ( = ?auto_191282 ?auto_191281 ) ) ( ON ?auto_191285 ?auto_191282 ) ( ON ?auto_191283 ?auto_191285 ) ( ON ?auto_191281 ?auto_191283 ) ( CLEAR ?auto_191280 ) ( ON ?auto_191279 ?auto_191281 ) ( CLEAR ?auto_191279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191278 ?auto_191284 ?auto_191282 ?auto_191285 ?auto_191283 ?auto_191281 )
      ( MAKE-1PILE ?auto_191278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191286 - BLOCK
    )
    :vars
    (
      ?auto_191288 - BLOCK
      ?auto_191293 - BLOCK
      ?auto_191291 - BLOCK
      ?auto_191287 - BLOCK
      ?auto_191289 - BLOCK
      ?auto_191290 - BLOCK
      ?auto_191292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191288 ?auto_191286 ) ( ON-TABLE ?auto_191286 ) ( not ( = ?auto_191286 ?auto_191288 ) ) ( not ( = ?auto_191286 ?auto_191293 ) ) ( not ( = ?auto_191286 ?auto_191291 ) ) ( not ( = ?auto_191288 ?auto_191293 ) ) ( not ( = ?auto_191288 ?auto_191291 ) ) ( not ( = ?auto_191293 ?auto_191291 ) ) ( ON ?auto_191293 ?auto_191288 ) ( not ( = ?auto_191287 ?auto_191289 ) ) ( not ( = ?auto_191287 ?auto_191290 ) ) ( not ( = ?auto_191287 ?auto_191292 ) ) ( not ( = ?auto_191287 ?auto_191291 ) ) ( not ( = ?auto_191289 ?auto_191290 ) ) ( not ( = ?auto_191289 ?auto_191292 ) ) ( not ( = ?auto_191289 ?auto_191291 ) ) ( not ( = ?auto_191290 ?auto_191292 ) ) ( not ( = ?auto_191290 ?auto_191291 ) ) ( not ( = ?auto_191292 ?auto_191291 ) ) ( not ( = ?auto_191286 ?auto_191292 ) ) ( not ( = ?auto_191286 ?auto_191287 ) ) ( not ( = ?auto_191286 ?auto_191289 ) ) ( not ( = ?auto_191286 ?auto_191290 ) ) ( not ( = ?auto_191288 ?auto_191292 ) ) ( not ( = ?auto_191288 ?auto_191287 ) ) ( not ( = ?auto_191288 ?auto_191289 ) ) ( not ( = ?auto_191288 ?auto_191290 ) ) ( not ( = ?auto_191293 ?auto_191292 ) ) ( not ( = ?auto_191293 ?auto_191287 ) ) ( not ( = ?auto_191293 ?auto_191289 ) ) ( not ( = ?auto_191293 ?auto_191290 ) ) ( ON ?auto_191291 ?auto_191293 ) ( ON ?auto_191292 ?auto_191291 ) ( ON ?auto_191290 ?auto_191292 ) ( ON ?auto_191289 ?auto_191290 ) ( CLEAR ?auto_191289 ) ( HOLDING ?auto_191287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191287 )
      ( MAKE-1PILE ?auto_191286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191303 - BLOCK
    )
    :vars
    (
      ?auto_191308 - BLOCK
      ?auto_191306 - BLOCK
      ?auto_191304 - BLOCK
      ?auto_191310 - BLOCK
      ?auto_191307 - BLOCK
      ?auto_191309 - BLOCK
      ?auto_191305 - BLOCK
      ?auto_191311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191308 ?auto_191303 ) ( ON-TABLE ?auto_191303 ) ( not ( = ?auto_191303 ?auto_191308 ) ) ( not ( = ?auto_191303 ?auto_191306 ) ) ( not ( = ?auto_191303 ?auto_191304 ) ) ( not ( = ?auto_191308 ?auto_191306 ) ) ( not ( = ?auto_191308 ?auto_191304 ) ) ( not ( = ?auto_191306 ?auto_191304 ) ) ( ON ?auto_191306 ?auto_191308 ) ( not ( = ?auto_191310 ?auto_191307 ) ) ( not ( = ?auto_191310 ?auto_191309 ) ) ( not ( = ?auto_191310 ?auto_191305 ) ) ( not ( = ?auto_191310 ?auto_191304 ) ) ( not ( = ?auto_191307 ?auto_191309 ) ) ( not ( = ?auto_191307 ?auto_191305 ) ) ( not ( = ?auto_191307 ?auto_191304 ) ) ( not ( = ?auto_191309 ?auto_191305 ) ) ( not ( = ?auto_191309 ?auto_191304 ) ) ( not ( = ?auto_191305 ?auto_191304 ) ) ( not ( = ?auto_191303 ?auto_191305 ) ) ( not ( = ?auto_191303 ?auto_191310 ) ) ( not ( = ?auto_191303 ?auto_191307 ) ) ( not ( = ?auto_191303 ?auto_191309 ) ) ( not ( = ?auto_191308 ?auto_191305 ) ) ( not ( = ?auto_191308 ?auto_191310 ) ) ( not ( = ?auto_191308 ?auto_191307 ) ) ( not ( = ?auto_191308 ?auto_191309 ) ) ( not ( = ?auto_191306 ?auto_191305 ) ) ( not ( = ?auto_191306 ?auto_191310 ) ) ( not ( = ?auto_191306 ?auto_191307 ) ) ( not ( = ?auto_191306 ?auto_191309 ) ) ( ON ?auto_191304 ?auto_191306 ) ( ON ?auto_191305 ?auto_191304 ) ( ON ?auto_191309 ?auto_191305 ) ( ON ?auto_191307 ?auto_191309 ) ( CLEAR ?auto_191307 ) ( ON ?auto_191310 ?auto_191311 ) ( CLEAR ?auto_191310 ) ( HAND-EMPTY ) ( not ( = ?auto_191303 ?auto_191311 ) ) ( not ( = ?auto_191308 ?auto_191311 ) ) ( not ( = ?auto_191306 ?auto_191311 ) ) ( not ( = ?auto_191304 ?auto_191311 ) ) ( not ( = ?auto_191310 ?auto_191311 ) ) ( not ( = ?auto_191307 ?auto_191311 ) ) ( not ( = ?auto_191309 ?auto_191311 ) ) ( not ( = ?auto_191305 ?auto_191311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191310 ?auto_191311 )
      ( MAKE-1PILE ?auto_191303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191312 - BLOCK
    )
    :vars
    (
      ?auto_191320 - BLOCK
      ?auto_191315 - BLOCK
      ?auto_191318 - BLOCK
      ?auto_191319 - BLOCK
      ?auto_191313 - BLOCK
      ?auto_191316 - BLOCK
      ?auto_191317 - BLOCK
      ?auto_191314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191320 ?auto_191312 ) ( ON-TABLE ?auto_191312 ) ( not ( = ?auto_191312 ?auto_191320 ) ) ( not ( = ?auto_191312 ?auto_191315 ) ) ( not ( = ?auto_191312 ?auto_191318 ) ) ( not ( = ?auto_191320 ?auto_191315 ) ) ( not ( = ?auto_191320 ?auto_191318 ) ) ( not ( = ?auto_191315 ?auto_191318 ) ) ( ON ?auto_191315 ?auto_191320 ) ( not ( = ?auto_191319 ?auto_191313 ) ) ( not ( = ?auto_191319 ?auto_191316 ) ) ( not ( = ?auto_191319 ?auto_191317 ) ) ( not ( = ?auto_191319 ?auto_191318 ) ) ( not ( = ?auto_191313 ?auto_191316 ) ) ( not ( = ?auto_191313 ?auto_191317 ) ) ( not ( = ?auto_191313 ?auto_191318 ) ) ( not ( = ?auto_191316 ?auto_191317 ) ) ( not ( = ?auto_191316 ?auto_191318 ) ) ( not ( = ?auto_191317 ?auto_191318 ) ) ( not ( = ?auto_191312 ?auto_191317 ) ) ( not ( = ?auto_191312 ?auto_191319 ) ) ( not ( = ?auto_191312 ?auto_191313 ) ) ( not ( = ?auto_191312 ?auto_191316 ) ) ( not ( = ?auto_191320 ?auto_191317 ) ) ( not ( = ?auto_191320 ?auto_191319 ) ) ( not ( = ?auto_191320 ?auto_191313 ) ) ( not ( = ?auto_191320 ?auto_191316 ) ) ( not ( = ?auto_191315 ?auto_191317 ) ) ( not ( = ?auto_191315 ?auto_191319 ) ) ( not ( = ?auto_191315 ?auto_191313 ) ) ( not ( = ?auto_191315 ?auto_191316 ) ) ( ON ?auto_191318 ?auto_191315 ) ( ON ?auto_191317 ?auto_191318 ) ( ON ?auto_191316 ?auto_191317 ) ( ON ?auto_191319 ?auto_191314 ) ( CLEAR ?auto_191319 ) ( not ( = ?auto_191312 ?auto_191314 ) ) ( not ( = ?auto_191320 ?auto_191314 ) ) ( not ( = ?auto_191315 ?auto_191314 ) ) ( not ( = ?auto_191318 ?auto_191314 ) ) ( not ( = ?auto_191319 ?auto_191314 ) ) ( not ( = ?auto_191313 ?auto_191314 ) ) ( not ( = ?auto_191316 ?auto_191314 ) ) ( not ( = ?auto_191317 ?auto_191314 ) ) ( HOLDING ?auto_191313 ) ( CLEAR ?auto_191316 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191312 ?auto_191320 ?auto_191315 ?auto_191318 ?auto_191317 ?auto_191316 ?auto_191313 )
      ( MAKE-1PILE ?auto_191312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191321 - BLOCK
    )
    :vars
    (
      ?auto_191325 - BLOCK
      ?auto_191329 - BLOCK
      ?auto_191327 - BLOCK
      ?auto_191322 - BLOCK
      ?auto_191324 - BLOCK
      ?auto_191328 - BLOCK
      ?auto_191323 - BLOCK
      ?auto_191326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191325 ?auto_191321 ) ( ON-TABLE ?auto_191321 ) ( not ( = ?auto_191321 ?auto_191325 ) ) ( not ( = ?auto_191321 ?auto_191329 ) ) ( not ( = ?auto_191321 ?auto_191327 ) ) ( not ( = ?auto_191325 ?auto_191329 ) ) ( not ( = ?auto_191325 ?auto_191327 ) ) ( not ( = ?auto_191329 ?auto_191327 ) ) ( ON ?auto_191329 ?auto_191325 ) ( not ( = ?auto_191322 ?auto_191324 ) ) ( not ( = ?auto_191322 ?auto_191328 ) ) ( not ( = ?auto_191322 ?auto_191323 ) ) ( not ( = ?auto_191322 ?auto_191327 ) ) ( not ( = ?auto_191324 ?auto_191328 ) ) ( not ( = ?auto_191324 ?auto_191323 ) ) ( not ( = ?auto_191324 ?auto_191327 ) ) ( not ( = ?auto_191328 ?auto_191323 ) ) ( not ( = ?auto_191328 ?auto_191327 ) ) ( not ( = ?auto_191323 ?auto_191327 ) ) ( not ( = ?auto_191321 ?auto_191323 ) ) ( not ( = ?auto_191321 ?auto_191322 ) ) ( not ( = ?auto_191321 ?auto_191324 ) ) ( not ( = ?auto_191321 ?auto_191328 ) ) ( not ( = ?auto_191325 ?auto_191323 ) ) ( not ( = ?auto_191325 ?auto_191322 ) ) ( not ( = ?auto_191325 ?auto_191324 ) ) ( not ( = ?auto_191325 ?auto_191328 ) ) ( not ( = ?auto_191329 ?auto_191323 ) ) ( not ( = ?auto_191329 ?auto_191322 ) ) ( not ( = ?auto_191329 ?auto_191324 ) ) ( not ( = ?auto_191329 ?auto_191328 ) ) ( ON ?auto_191327 ?auto_191329 ) ( ON ?auto_191323 ?auto_191327 ) ( ON ?auto_191328 ?auto_191323 ) ( ON ?auto_191322 ?auto_191326 ) ( not ( = ?auto_191321 ?auto_191326 ) ) ( not ( = ?auto_191325 ?auto_191326 ) ) ( not ( = ?auto_191329 ?auto_191326 ) ) ( not ( = ?auto_191327 ?auto_191326 ) ) ( not ( = ?auto_191322 ?auto_191326 ) ) ( not ( = ?auto_191324 ?auto_191326 ) ) ( not ( = ?auto_191328 ?auto_191326 ) ) ( not ( = ?auto_191323 ?auto_191326 ) ) ( CLEAR ?auto_191328 ) ( ON ?auto_191324 ?auto_191322 ) ( CLEAR ?auto_191324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191326 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191326 ?auto_191322 )
      ( MAKE-1PILE ?auto_191321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191330 - BLOCK
    )
    :vars
    (
      ?auto_191338 - BLOCK
      ?auto_191335 - BLOCK
      ?auto_191333 - BLOCK
      ?auto_191331 - BLOCK
      ?auto_191334 - BLOCK
      ?auto_191336 - BLOCK
      ?auto_191337 - BLOCK
      ?auto_191332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191338 ?auto_191330 ) ( ON-TABLE ?auto_191330 ) ( not ( = ?auto_191330 ?auto_191338 ) ) ( not ( = ?auto_191330 ?auto_191335 ) ) ( not ( = ?auto_191330 ?auto_191333 ) ) ( not ( = ?auto_191338 ?auto_191335 ) ) ( not ( = ?auto_191338 ?auto_191333 ) ) ( not ( = ?auto_191335 ?auto_191333 ) ) ( ON ?auto_191335 ?auto_191338 ) ( not ( = ?auto_191331 ?auto_191334 ) ) ( not ( = ?auto_191331 ?auto_191336 ) ) ( not ( = ?auto_191331 ?auto_191337 ) ) ( not ( = ?auto_191331 ?auto_191333 ) ) ( not ( = ?auto_191334 ?auto_191336 ) ) ( not ( = ?auto_191334 ?auto_191337 ) ) ( not ( = ?auto_191334 ?auto_191333 ) ) ( not ( = ?auto_191336 ?auto_191337 ) ) ( not ( = ?auto_191336 ?auto_191333 ) ) ( not ( = ?auto_191337 ?auto_191333 ) ) ( not ( = ?auto_191330 ?auto_191337 ) ) ( not ( = ?auto_191330 ?auto_191331 ) ) ( not ( = ?auto_191330 ?auto_191334 ) ) ( not ( = ?auto_191330 ?auto_191336 ) ) ( not ( = ?auto_191338 ?auto_191337 ) ) ( not ( = ?auto_191338 ?auto_191331 ) ) ( not ( = ?auto_191338 ?auto_191334 ) ) ( not ( = ?auto_191338 ?auto_191336 ) ) ( not ( = ?auto_191335 ?auto_191337 ) ) ( not ( = ?auto_191335 ?auto_191331 ) ) ( not ( = ?auto_191335 ?auto_191334 ) ) ( not ( = ?auto_191335 ?auto_191336 ) ) ( ON ?auto_191333 ?auto_191335 ) ( ON ?auto_191337 ?auto_191333 ) ( ON ?auto_191331 ?auto_191332 ) ( not ( = ?auto_191330 ?auto_191332 ) ) ( not ( = ?auto_191338 ?auto_191332 ) ) ( not ( = ?auto_191335 ?auto_191332 ) ) ( not ( = ?auto_191333 ?auto_191332 ) ) ( not ( = ?auto_191331 ?auto_191332 ) ) ( not ( = ?auto_191334 ?auto_191332 ) ) ( not ( = ?auto_191336 ?auto_191332 ) ) ( not ( = ?auto_191337 ?auto_191332 ) ) ( ON ?auto_191334 ?auto_191331 ) ( CLEAR ?auto_191334 ) ( ON-TABLE ?auto_191332 ) ( HOLDING ?auto_191336 ) ( CLEAR ?auto_191337 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191330 ?auto_191338 ?auto_191335 ?auto_191333 ?auto_191337 ?auto_191336 )
      ( MAKE-1PILE ?auto_191330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191339 - BLOCK
    )
    :vars
    (
      ?auto_191344 - BLOCK
      ?auto_191346 - BLOCK
      ?auto_191341 - BLOCK
      ?auto_191342 - BLOCK
      ?auto_191345 - BLOCK
      ?auto_191343 - BLOCK
      ?auto_191347 - BLOCK
      ?auto_191340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191344 ?auto_191339 ) ( ON-TABLE ?auto_191339 ) ( not ( = ?auto_191339 ?auto_191344 ) ) ( not ( = ?auto_191339 ?auto_191346 ) ) ( not ( = ?auto_191339 ?auto_191341 ) ) ( not ( = ?auto_191344 ?auto_191346 ) ) ( not ( = ?auto_191344 ?auto_191341 ) ) ( not ( = ?auto_191346 ?auto_191341 ) ) ( ON ?auto_191346 ?auto_191344 ) ( not ( = ?auto_191342 ?auto_191345 ) ) ( not ( = ?auto_191342 ?auto_191343 ) ) ( not ( = ?auto_191342 ?auto_191347 ) ) ( not ( = ?auto_191342 ?auto_191341 ) ) ( not ( = ?auto_191345 ?auto_191343 ) ) ( not ( = ?auto_191345 ?auto_191347 ) ) ( not ( = ?auto_191345 ?auto_191341 ) ) ( not ( = ?auto_191343 ?auto_191347 ) ) ( not ( = ?auto_191343 ?auto_191341 ) ) ( not ( = ?auto_191347 ?auto_191341 ) ) ( not ( = ?auto_191339 ?auto_191347 ) ) ( not ( = ?auto_191339 ?auto_191342 ) ) ( not ( = ?auto_191339 ?auto_191345 ) ) ( not ( = ?auto_191339 ?auto_191343 ) ) ( not ( = ?auto_191344 ?auto_191347 ) ) ( not ( = ?auto_191344 ?auto_191342 ) ) ( not ( = ?auto_191344 ?auto_191345 ) ) ( not ( = ?auto_191344 ?auto_191343 ) ) ( not ( = ?auto_191346 ?auto_191347 ) ) ( not ( = ?auto_191346 ?auto_191342 ) ) ( not ( = ?auto_191346 ?auto_191345 ) ) ( not ( = ?auto_191346 ?auto_191343 ) ) ( ON ?auto_191341 ?auto_191346 ) ( ON ?auto_191347 ?auto_191341 ) ( ON ?auto_191342 ?auto_191340 ) ( not ( = ?auto_191339 ?auto_191340 ) ) ( not ( = ?auto_191344 ?auto_191340 ) ) ( not ( = ?auto_191346 ?auto_191340 ) ) ( not ( = ?auto_191341 ?auto_191340 ) ) ( not ( = ?auto_191342 ?auto_191340 ) ) ( not ( = ?auto_191345 ?auto_191340 ) ) ( not ( = ?auto_191343 ?auto_191340 ) ) ( not ( = ?auto_191347 ?auto_191340 ) ) ( ON ?auto_191345 ?auto_191342 ) ( ON-TABLE ?auto_191340 ) ( CLEAR ?auto_191347 ) ( ON ?auto_191343 ?auto_191345 ) ( CLEAR ?auto_191343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191340 ?auto_191342 ?auto_191345 )
      ( MAKE-1PILE ?auto_191339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191391 - BLOCK
      ?auto_191392 - BLOCK
      ?auto_191393 - BLOCK
      ?auto_191394 - BLOCK
      ?auto_191395 - BLOCK
      ?auto_191396 - BLOCK
      ?auto_191397 - BLOCK
    )
    :vars
    (
      ?auto_191398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191391 ) ( ON ?auto_191392 ?auto_191391 ) ( ON ?auto_191393 ?auto_191392 ) ( ON ?auto_191394 ?auto_191393 ) ( ON ?auto_191395 ?auto_191394 ) ( not ( = ?auto_191391 ?auto_191392 ) ) ( not ( = ?auto_191391 ?auto_191393 ) ) ( not ( = ?auto_191391 ?auto_191394 ) ) ( not ( = ?auto_191391 ?auto_191395 ) ) ( not ( = ?auto_191391 ?auto_191396 ) ) ( not ( = ?auto_191391 ?auto_191397 ) ) ( not ( = ?auto_191392 ?auto_191393 ) ) ( not ( = ?auto_191392 ?auto_191394 ) ) ( not ( = ?auto_191392 ?auto_191395 ) ) ( not ( = ?auto_191392 ?auto_191396 ) ) ( not ( = ?auto_191392 ?auto_191397 ) ) ( not ( = ?auto_191393 ?auto_191394 ) ) ( not ( = ?auto_191393 ?auto_191395 ) ) ( not ( = ?auto_191393 ?auto_191396 ) ) ( not ( = ?auto_191393 ?auto_191397 ) ) ( not ( = ?auto_191394 ?auto_191395 ) ) ( not ( = ?auto_191394 ?auto_191396 ) ) ( not ( = ?auto_191394 ?auto_191397 ) ) ( not ( = ?auto_191395 ?auto_191396 ) ) ( not ( = ?auto_191395 ?auto_191397 ) ) ( not ( = ?auto_191396 ?auto_191397 ) ) ( ON ?auto_191397 ?auto_191398 ) ( not ( = ?auto_191391 ?auto_191398 ) ) ( not ( = ?auto_191392 ?auto_191398 ) ) ( not ( = ?auto_191393 ?auto_191398 ) ) ( not ( = ?auto_191394 ?auto_191398 ) ) ( not ( = ?auto_191395 ?auto_191398 ) ) ( not ( = ?auto_191396 ?auto_191398 ) ) ( not ( = ?auto_191397 ?auto_191398 ) ) ( CLEAR ?auto_191395 ) ( ON ?auto_191396 ?auto_191397 ) ( CLEAR ?auto_191396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191398 ?auto_191397 )
      ( MAKE-7PILE ?auto_191391 ?auto_191392 ?auto_191393 ?auto_191394 ?auto_191395 ?auto_191396 ?auto_191397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191399 - BLOCK
      ?auto_191400 - BLOCK
      ?auto_191401 - BLOCK
      ?auto_191402 - BLOCK
      ?auto_191403 - BLOCK
      ?auto_191404 - BLOCK
      ?auto_191405 - BLOCK
    )
    :vars
    (
      ?auto_191406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191399 ) ( ON ?auto_191400 ?auto_191399 ) ( ON ?auto_191401 ?auto_191400 ) ( ON ?auto_191402 ?auto_191401 ) ( not ( = ?auto_191399 ?auto_191400 ) ) ( not ( = ?auto_191399 ?auto_191401 ) ) ( not ( = ?auto_191399 ?auto_191402 ) ) ( not ( = ?auto_191399 ?auto_191403 ) ) ( not ( = ?auto_191399 ?auto_191404 ) ) ( not ( = ?auto_191399 ?auto_191405 ) ) ( not ( = ?auto_191400 ?auto_191401 ) ) ( not ( = ?auto_191400 ?auto_191402 ) ) ( not ( = ?auto_191400 ?auto_191403 ) ) ( not ( = ?auto_191400 ?auto_191404 ) ) ( not ( = ?auto_191400 ?auto_191405 ) ) ( not ( = ?auto_191401 ?auto_191402 ) ) ( not ( = ?auto_191401 ?auto_191403 ) ) ( not ( = ?auto_191401 ?auto_191404 ) ) ( not ( = ?auto_191401 ?auto_191405 ) ) ( not ( = ?auto_191402 ?auto_191403 ) ) ( not ( = ?auto_191402 ?auto_191404 ) ) ( not ( = ?auto_191402 ?auto_191405 ) ) ( not ( = ?auto_191403 ?auto_191404 ) ) ( not ( = ?auto_191403 ?auto_191405 ) ) ( not ( = ?auto_191404 ?auto_191405 ) ) ( ON ?auto_191405 ?auto_191406 ) ( not ( = ?auto_191399 ?auto_191406 ) ) ( not ( = ?auto_191400 ?auto_191406 ) ) ( not ( = ?auto_191401 ?auto_191406 ) ) ( not ( = ?auto_191402 ?auto_191406 ) ) ( not ( = ?auto_191403 ?auto_191406 ) ) ( not ( = ?auto_191404 ?auto_191406 ) ) ( not ( = ?auto_191405 ?auto_191406 ) ) ( ON ?auto_191404 ?auto_191405 ) ( CLEAR ?auto_191404 ) ( ON-TABLE ?auto_191406 ) ( HOLDING ?auto_191403 ) ( CLEAR ?auto_191402 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191399 ?auto_191400 ?auto_191401 ?auto_191402 ?auto_191403 )
      ( MAKE-7PILE ?auto_191399 ?auto_191400 ?auto_191401 ?auto_191402 ?auto_191403 ?auto_191404 ?auto_191405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191407 - BLOCK
      ?auto_191408 - BLOCK
      ?auto_191409 - BLOCK
      ?auto_191410 - BLOCK
      ?auto_191411 - BLOCK
      ?auto_191412 - BLOCK
      ?auto_191413 - BLOCK
    )
    :vars
    (
      ?auto_191414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191407 ) ( ON ?auto_191408 ?auto_191407 ) ( ON ?auto_191409 ?auto_191408 ) ( ON ?auto_191410 ?auto_191409 ) ( not ( = ?auto_191407 ?auto_191408 ) ) ( not ( = ?auto_191407 ?auto_191409 ) ) ( not ( = ?auto_191407 ?auto_191410 ) ) ( not ( = ?auto_191407 ?auto_191411 ) ) ( not ( = ?auto_191407 ?auto_191412 ) ) ( not ( = ?auto_191407 ?auto_191413 ) ) ( not ( = ?auto_191408 ?auto_191409 ) ) ( not ( = ?auto_191408 ?auto_191410 ) ) ( not ( = ?auto_191408 ?auto_191411 ) ) ( not ( = ?auto_191408 ?auto_191412 ) ) ( not ( = ?auto_191408 ?auto_191413 ) ) ( not ( = ?auto_191409 ?auto_191410 ) ) ( not ( = ?auto_191409 ?auto_191411 ) ) ( not ( = ?auto_191409 ?auto_191412 ) ) ( not ( = ?auto_191409 ?auto_191413 ) ) ( not ( = ?auto_191410 ?auto_191411 ) ) ( not ( = ?auto_191410 ?auto_191412 ) ) ( not ( = ?auto_191410 ?auto_191413 ) ) ( not ( = ?auto_191411 ?auto_191412 ) ) ( not ( = ?auto_191411 ?auto_191413 ) ) ( not ( = ?auto_191412 ?auto_191413 ) ) ( ON ?auto_191413 ?auto_191414 ) ( not ( = ?auto_191407 ?auto_191414 ) ) ( not ( = ?auto_191408 ?auto_191414 ) ) ( not ( = ?auto_191409 ?auto_191414 ) ) ( not ( = ?auto_191410 ?auto_191414 ) ) ( not ( = ?auto_191411 ?auto_191414 ) ) ( not ( = ?auto_191412 ?auto_191414 ) ) ( not ( = ?auto_191413 ?auto_191414 ) ) ( ON ?auto_191412 ?auto_191413 ) ( ON-TABLE ?auto_191414 ) ( CLEAR ?auto_191410 ) ( ON ?auto_191411 ?auto_191412 ) ( CLEAR ?auto_191411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191414 ?auto_191413 ?auto_191412 )
      ( MAKE-7PILE ?auto_191407 ?auto_191408 ?auto_191409 ?auto_191410 ?auto_191411 ?auto_191412 ?auto_191413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191415 - BLOCK
      ?auto_191416 - BLOCK
      ?auto_191417 - BLOCK
      ?auto_191418 - BLOCK
      ?auto_191419 - BLOCK
      ?auto_191420 - BLOCK
      ?auto_191421 - BLOCK
    )
    :vars
    (
      ?auto_191422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191415 ) ( ON ?auto_191416 ?auto_191415 ) ( ON ?auto_191417 ?auto_191416 ) ( not ( = ?auto_191415 ?auto_191416 ) ) ( not ( = ?auto_191415 ?auto_191417 ) ) ( not ( = ?auto_191415 ?auto_191418 ) ) ( not ( = ?auto_191415 ?auto_191419 ) ) ( not ( = ?auto_191415 ?auto_191420 ) ) ( not ( = ?auto_191415 ?auto_191421 ) ) ( not ( = ?auto_191416 ?auto_191417 ) ) ( not ( = ?auto_191416 ?auto_191418 ) ) ( not ( = ?auto_191416 ?auto_191419 ) ) ( not ( = ?auto_191416 ?auto_191420 ) ) ( not ( = ?auto_191416 ?auto_191421 ) ) ( not ( = ?auto_191417 ?auto_191418 ) ) ( not ( = ?auto_191417 ?auto_191419 ) ) ( not ( = ?auto_191417 ?auto_191420 ) ) ( not ( = ?auto_191417 ?auto_191421 ) ) ( not ( = ?auto_191418 ?auto_191419 ) ) ( not ( = ?auto_191418 ?auto_191420 ) ) ( not ( = ?auto_191418 ?auto_191421 ) ) ( not ( = ?auto_191419 ?auto_191420 ) ) ( not ( = ?auto_191419 ?auto_191421 ) ) ( not ( = ?auto_191420 ?auto_191421 ) ) ( ON ?auto_191421 ?auto_191422 ) ( not ( = ?auto_191415 ?auto_191422 ) ) ( not ( = ?auto_191416 ?auto_191422 ) ) ( not ( = ?auto_191417 ?auto_191422 ) ) ( not ( = ?auto_191418 ?auto_191422 ) ) ( not ( = ?auto_191419 ?auto_191422 ) ) ( not ( = ?auto_191420 ?auto_191422 ) ) ( not ( = ?auto_191421 ?auto_191422 ) ) ( ON ?auto_191420 ?auto_191421 ) ( ON-TABLE ?auto_191422 ) ( ON ?auto_191419 ?auto_191420 ) ( CLEAR ?auto_191419 ) ( HOLDING ?auto_191418 ) ( CLEAR ?auto_191417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191415 ?auto_191416 ?auto_191417 ?auto_191418 )
      ( MAKE-7PILE ?auto_191415 ?auto_191416 ?auto_191417 ?auto_191418 ?auto_191419 ?auto_191420 ?auto_191421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191423 - BLOCK
      ?auto_191424 - BLOCK
      ?auto_191425 - BLOCK
      ?auto_191426 - BLOCK
      ?auto_191427 - BLOCK
      ?auto_191428 - BLOCK
      ?auto_191429 - BLOCK
    )
    :vars
    (
      ?auto_191430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191423 ) ( ON ?auto_191424 ?auto_191423 ) ( ON ?auto_191425 ?auto_191424 ) ( not ( = ?auto_191423 ?auto_191424 ) ) ( not ( = ?auto_191423 ?auto_191425 ) ) ( not ( = ?auto_191423 ?auto_191426 ) ) ( not ( = ?auto_191423 ?auto_191427 ) ) ( not ( = ?auto_191423 ?auto_191428 ) ) ( not ( = ?auto_191423 ?auto_191429 ) ) ( not ( = ?auto_191424 ?auto_191425 ) ) ( not ( = ?auto_191424 ?auto_191426 ) ) ( not ( = ?auto_191424 ?auto_191427 ) ) ( not ( = ?auto_191424 ?auto_191428 ) ) ( not ( = ?auto_191424 ?auto_191429 ) ) ( not ( = ?auto_191425 ?auto_191426 ) ) ( not ( = ?auto_191425 ?auto_191427 ) ) ( not ( = ?auto_191425 ?auto_191428 ) ) ( not ( = ?auto_191425 ?auto_191429 ) ) ( not ( = ?auto_191426 ?auto_191427 ) ) ( not ( = ?auto_191426 ?auto_191428 ) ) ( not ( = ?auto_191426 ?auto_191429 ) ) ( not ( = ?auto_191427 ?auto_191428 ) ) ( not ( = ?auto_191427 ?auto_191429 ) ) ( not ( = ?auto_191428 ?auto_191429 ) ) ( ON ?auto_191429 ?auto_191430 ) ( not ( = ?auto_191423 ?auto_191430 ) ) ( not ( = ?auto_191424 ?auto_191430 ) ) ( not ( = ?auto_191425 ?auto_191430 ) ) ( not ( = ?auto_191426 ?auto_191430 ) ) ( not ( = ?auto_191427 ?auto_191430 ) ) ( not ( = ?auto_191428 ?auto_191430 ) ) ( not ( = ?auto_191429 ?auto_191430 ) ) ( ON ?auto_191428 ?auto_191429 ) ( ON-TABLE ?auto_191430 ) ( ON ?auto_191427 ?auto_191428 ) ( CLEAR ?auto_191425 ) ( ON ?auto_191426 ?auto_191427 ) ( CLEAR ?auto_191426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191430 ?auto_191429 ?auto_191428 ?auto_191427 )
      ( MAKE-7PILE ?auto_191423 ?auto_191424 ?auto_191425 ?auto_191426 ?auto_191427 ?auto_191428 ?auto_191429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191431 - BLOCK
      ?auto_191432 - BLOCK
      ?auto_191433 - BLOCK
      ?auto_191434 - BLOCK
      ?auto_191435 - BLOCK
      ?auto_191436 - BLOCK
      ?auto_191437 - BLOCK
    )
    :vars
    (
      ?auto_191438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191431 ) ( ON ?auto_191432 ?auto_191431 ) ( not ( = ?auto_191431 ?auto_191432 ) ) ( not ( = ?auto_191431 ?auto_191433 ) ) ( not ( = ?auto_191431 ?auto_191434 ) ) ( not ( = ?auto_191431 ?auto_191435 ) ) ( not ( = ?auto_191431 ?auto_191436 ) ) ( not ( = ?auto_191431 ?auto_191437 ) ) ( not ( = ?auto_191432 ?auto_191433 ) ) ( not ( = ?auto_191432 ?auto_191434 ) ) ( not ( = ?auto_191432 ?auto_191435 ) ) ( not ( = ?auto_191432 ?auto_191436 ) ) ( not ( = ?auto_191432 ?auto_191437 ) ) ( not ( = ?auto_191433 ?auto_191434 ) ) ( not ( = ?auto_191433 ?auto_191435 ) ) ( not ( = ?auto_191433 ?auto_191436 ) ) ( not ( = ?auto_191433 ?auto_191437 ) ) ( not ( = ?auto_191434 ?auto_191435 ) ) ( not ( = ?auto_191434 ?auto_191436 ) ) ( not ( = ?auto_191434 ?auto_191437 ) ) ( not ( = ?auto_191435 ?auto_191436 ) ) ( not ( = ?auto_191435 ?auto_191437 ) ) ( not ( = ?auto_191436 ?auto_191437 ) ) ( ON ?auto_191437 ?auto_191438 ) ( not ( = ?auto_191431 ?auto_191438 ) ) ( not ( = ?auto_191432 ?auto_191438 ) ) ( not ( = ?auto_191433 ?auto_191438 ) ) ( not ( = ?auto_191434 ?auto_191438 ) ) ( not ( = ?auto_191435 ?auto_191438 ) ) ( not ( = ?auto_191436 ?auto_191438 ) ) ( not ( = ?auto_191437 ?auto_191438 ) ) ( ON ?auto_191436 ?auto_191437 ) ( ON-TABLE ?auto_191438 ) ( ON ?auto_191435 ?auto_191436 ) ( ON ?auto_191434 ?auto_191435 ) ( CLEAR ?auto_191434 ) ( HOLDING ?auto_191433 ) ( CLEAR ?auto_191432 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191431 ?auto_191432 ?auto_191433 )
      ( MAKE-7PILE ?auto_191431 ?auto_191432 ?auto_191433 ?auto_191434 ?auto_191435 ?auto_191436 ?auto_191437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191439 - BLOCK
      ?auto_191440 - BLOCK
      ?auto_191441 - BLOCK
      ?auto_191442 - BLOCK
      ?auto_191443 - BLOCK
      ?auto_191444 - BLOCK
      ?auto_191445 - BLOCK
    )
    :vars
    (
      ?auto_191446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191439 ) ( ON ?auto_191440 ?auto_191439 ) ( not ( = ?auto_191439 ?auto_191440 ) ) ( not ( = ?auto_191439 ?auto_191441 ) ) ( not ( = ?auto_191439 ?auto_191442 ) ) ( not ( = ?auto_191439 ?auto_191443 ) ) ( not ( = ?auto_191439 ?auto_191444 ) ) ( not ( = ?auto_191439 ?auto_191445 ) ) ( not ( = ?auto_191440 ?auto_191441 ) ) ( not ( = ?auto_191440 ?auto_191442 ) ) ( not ( = ?auto_191440 ?auto_191443 ) ) ( not ( = ?auto_191440 ?auto_191444 ) ) ( not ( = ?auto_191440 ?auto_191445 ) ) ( not ( = ?auto_191441 ?auto_191442 ) ) ( not ( = ?auto_191441 ?auto_191443 ) ) ( not ( = ?auto_191441 ?auto_191444 ) ) ( not ( = ?auto_191441 ?auto_191445 ) ) ( not ( = ?auto_191442 ?auto_191443 ) ) ( not ( = ?auto_191442 ?auto_191444 ) ) ( not ( = ?auto_191442 ?auto_191445 ) ) ( not ( = ?auto_191443 ?auto_191444 ) ) ( not ( = ?auto_191443 ?auto_191445 ) ) ( not ( = ?auto_191444 ?auto_191445 ) ) ( ON ?auto_191445 ?auto_191446 ) ( not ( = ?auto_191439 ?auto_191446 ) ) ( not ( = ?auto_191440 ?auto_191446 ) ) ( not ( = ?auto_191441 ?auto_191446 ) ) ( not ( = ?auto_191442 ?auto_191446 ) ) ( not ( = ?auto_191443 ?auto_191446 ) ) ( not ( = ?auto_191444 ?auto_191446 ) ) ( not ( = ?auto_191445 ?auto_191446 ) ) ( ON ?auto_191444 ?auto_191445 ) ( ON-TABLE ?auto_191446 ) ( ON ?auto_191443 ?auto_191444 ) ( ON ?auto_191442 ?auto_191443 ) ( CLEAR ?auto_191440 ) ( ON ?auto_191441 ?auto_191442 ) ( CLEAR ?auto_191441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191446 ?auto_191445 ?auto_191444 ?auto_191443 ?auto_191442 )
      ( MAKE-7PILE ?auto_191439 ?auto_191440 ?auto_191441 ?auto_191442 ?auto_191443 ?auto_191444 ?auto_191445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191447 - BLOCK
      ?auto_191448 - BLOCK
      ?auto_191449 - BLOCK
      ?auto_191450 - BLOCK
      ?auto_191451 - BLOCK
      ?auto_191452 - BLOCK
      ?auto_191453 - BLOCK
    )
    :vars
    (
      ?auto_191454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191447 ) ( not ( = ?auto_191447 ?auto_191448 ) ) ( not ( = ?auto_191447 ?auto_191449 ) ) ( not ( = ?auto_191447 ?auto_191450 ) ) ( not ( = ?auto_191447 ?auto_191451 ) ) ( not ( = ?auto_191447 ?auto_191452 ) ) ( not ( = ?auto_191447 ?auto_191453 ) ) ( not ( = ?auto_191448 ?auto_191449 ) ) ( not ( = ?auto_191448 ?auto_191450 ) ) ( not ( = ?auto_191448 ?auto_191451 ) ) ( not ( = ?auto_191448 ?auto_191452 ) ) ( not ( = ?auto_191448 ?auto_191453 ) ) ( not ( = ?auto_191449 ?auto_191450 ) ) ( not ( = ?auto_191449 ?auto_191451 ) ) ( not ( = ?auto_191449 ?auto_191452 ) ) ( not ( = ?auto_191449 ?auto_191453 ) ) ( not ( = ?auto_191450 ?auto_191451 ) ) ( not ( = ?auto_191450 ?auto_191452 ) ) ( not ( = ?auto_191450 ?auto_191453 ) ) ( not ( = ?auto_191451 ?auto_191452 ) ) ( not ( = ?auto_191451 ?auto_191453 ) ) ( not ( = ?auto_191452 ?auto_191453 ) ) ( ON ?auto_191453 ?auto_191454 ) ( not ( = ?auto_191447 ?auto_191454 ) ) ( not ( = ?auto_191448 ?auto_191454 ) ) ( not ( = ?auto_191449 ?auto_191454 ) ) ( not ( = ?auto_191450 ?auto_191454 ) ) ( not ( = ?auto_191451 ?auto_191454 ) ) ( not ( = ?auto_191452 ?auto_191454 ) ) ( not ( = ?auto_191453 ?auto_191454 ) ) ( ON ?auto_191452 ?auto_191453 ) ( ON-TABLE ?auto_191454 ) ( ON ?auto_191451 ?auto_191452 ) ( ON ?auto_191450 ?auto_191451 ) ( ON ?auto_191449 ?auto_191450 ) ( CLEAR ?auto_191449 ) ( HOLDING ?auto_191448 ) ( CLEAR ?auto_191447 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191447 ?auto_191448 )
      ( MAKE-7PILE ?auto_191447 ?auto_191448 ?auto_191449 ?auto_191450 ?auto_191451 ?auto_191452 ?auto_191453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191455 - BLOCK
      ?auto_191456 - BLOCK
      ?auto_191457 - BLOCK
      ?auto_191458 - BLOCK
      ?auto_191459 - BLOCK
      ?auto_191460 - BLOCK
      ?auto_191461 - BLOCK
    )
    :vars
    (
      ?auto_191462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191455 ) ( not ( = ?auto_191455 ?auto_191456 ) ) ( not ( = ?auto_191455 ?auto_191457 ) ) ( not ( = ?auto_191455 ?auto_191458 ) ) ( not ( = ?auto_191455 ?auto_191459 ) ) ( not ( = ?auto_191455 ?auto_191460 ) ) ( not ( = ?auto_191455 ?auto_191461 ) ) ( not ( = ?auto_191456 ?auto_191457 ) ) ( not ( = ?auto_191456 ?auto_191458 ) ) ( not ( = ?auto_191456 ?auto_191459 ) ) ( not ( = ?auto_191456 ?auto_191460 ) ) ( not ( = ?auto_191456 ?auto_191461 ) ) ( not ( = ?auto_191457 ?auto_191458 ) ) ( not ( = ?auto_191457 ?auto_191459 ) ) ( not ( = ?auto_191457 ?auto_191460 ) ) ( not ( = ?auto_191457 ?auto_191461 ) ) ( not ( = ?auto_191458 ?auto_191459 ) ) ( not ( = ?auto_191458 ?auto_191460 ) ) ( not ( = ?auto_191458 ?auto_191461 ) ) ( not ( = ?auto_191459 ?auto_191460 ) ) ( not ( = ?auto_191459 ?auto_191461 ) ) ( not ( = ?auto_191460 ?auto_191461 ) ) ( ON ?auto_191461 ?auto_191462 ) ( not ( = ?auto_191455 ?auto_191462 ) ) ( not ( = ?auto_191456 ?auto_191462 ) ) ( not ( = ?auto_191457 ?auto_191462 ) ) ( not ( = ?auto_191458 ?auto_191462 ) ) ( not ( = ?auto_191459 ?auto_191462 ) ) ( not ( = ?auto_191460 ?auto_191462 ) ) ( not ( = ?auto_191461 ?auto_191462 ) ) ( ON ?auto_191460 ?auto_191461 ) ( ON-TABLE ?auto_191462 ) ( ON ?auto_191459 ?auto_191460 ) ( ON ?auto_191458 ?auto_191459 ) ( ON ?auto_191457 ?auto_191458 ) ( CLEAR ?auto_191455 ) ( ON ?auto_191456 ?auto_191457 ) ( CLEAR ?auto_191456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191462 ?auto_191461 ?auto_191460 ?auto_191459 ?auto_191458 ?auto_191457 )
      ( MAKE-7PILE ?auto_191455 ?auto_191456 ?auto_191457 ?auto_191458 ?auto_191459 ?auto_191460 ?auto_191461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191463 - BLOCK
      ?auto_191464 - BLOCK
      ?auto_191465 - BLOCK
      ?auto_191466 - BLOCK
      ?auto_191467 - BLOCK
      ?auto_191468 - BLOCK
      ?auto_191469 - BLOCK
    )
    :vars
    (
      ?auto_191470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191463 ?auto_191464 ) ) ( not ( = ?auto_191463 ?auto_191465 ) ) ( not ( = ?auto_191463 ?auto_191466 ) ) ( not ( = ?auto_191463 ?auto_191467 ) ) ( not ( = ?auto_191463 ?auto_191468 ) ) ( not ( = ?auto_191463 ?auto_191469 ) ) ( not ( = ?auto_191464 ?auto_191465 ) ) ( not ( = ?auto_191464 ?auto_191466 ) ) ( not ( = ?auto_191464 ?auto_191467 ) ) ( not ( = ?auto_191464 ?auto_191468 ) ) ( not ( = ?auto_191464 ?auto_191469 ) ) ( not ( = ?auto_191465 ?auto_191466 ) ) ( not ( = ?auto_191465 ?auto_191467 ) ) ( not ( = ?auto_191465 ?auto_191468 ) ) ( not ( = ?auto_191465 ?auto_191469 ) ) ( not ( = ?auto_191466 ?auto_191467 ) ) ( not ( = ?auto_191466 ?auto_191468 ) ) ( not ( = ?auto_191466 ?auto_191469 ) ) ( not ( = ?auto_191467 ?auto_191468 ) ) ( not ( = ?auto_191467 ?auto_191469 ) ) ( not ( = ?auto_191468 ?auto_191469 ) ) ( ON ?auto_191469 ?auto_191470 ) ( not ( = ?auto_191463 ?auto_191470 ) ) ( not ( = ?auto_191464 ?auto_191470 ) ) ( not ( = ?auto_191465 ?auto_191470 ) ) ( not ( = ?auto_191466 ?auto_191470 ) ) ( not ( = ?auto_191467 ?auto_191470 ) ) ( not ( = ?auto_191468 ?auto_191470 ) ) ( not ( = ?auto_191469 ?auto_191470 ) ) ( ON ?auto_191468 ?auto_191469 ) ( ON-TABLE ?auto_191470 ) ( ON ?auto_191467 ?auto_191468 ) ( ON ?auto_191466 ?auto_191467 ) ( ON ?auto_191465 ?auto_191466 ) ( ON ?auto_191464 ?auto_191465 ) ( CLEAR ?auto_191464 ) ( HOLDING ?auto_191463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191463 )
      ( MAKE-7PILE ?auto_191463 ?auto_191464 ?auto_191465 ?auto_191466 ?auto_191467 ?auto_191468 ?auto_191469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191471 - BLOCK
      ?auto_191472 - BLOCK
      ?auto_191473 - BLOCK
      ?auto_191474 - BLOCK
      ?auto_191475 - BLOCK
      ?auto_191476 - BLOCK
      ?auto_191477 - BLOCK
    )
    :vars
    (
      ?auto_191478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191471 ?auto_191472 ) ) ( not ( = ?auto_191471 ?auto_191473 ) ) ( not ( = ?auto_191471 ?auto_191474 ) ) ( not ( = ?auto_191471 ?auto_191475 ) ) ( not ( = ?auto_191471 ?auto_191476 ) ) ( not ( = ?auto_191471 ?auto_191477 ) ) ( not ( = ?auto_191472 ?auto_191473 ) ) ( not ( = ?auto_191472 ?auto_191474 ) ) ( not ( = ?auto_191472 ?auto_191475 ) ) ( not ( = ?auto_191472 ?auto_191476 ) ) ( not ( = ?auto_191472 ?auto_191477 ) ) ( not ( = ?auto_191473 ?auto_191474 ) ) ( not ( = ?auto_191473 ?auto_191475 ) ) ( not ( = ?auto_191473 ?auto_191476 ) ) ( not ( = ?auto_191473 ?auto_191477 ) ) ( not ( = ?auto_191474 ?auto_191475 ) ) ( not ( = ?auto_191474 ?auto_191476 ) ) ( not ( = ?auto_191474 ?auto_191477 ) ) ( not ( = ?auto_191475 ?auto_191476 ) ) ( not ( = ?auto_191475 ?auto_191477 ) ) ( not ( = ?auto_191476 ?auto_191477 ) ) ( ON ?auto_191477 ?auto_191478 ) ( not ( = ?auto_191471 ?auto_191478 ) ) ( not ( = ?auto_191472 ?auto_191478 ) ) ( not ( = ?auto_191473 ?auto_191478 ) ) ( not ( = ?auto_191474 ?auto_191478 ) ) ( not ( = ?auto_191475 ?auto_191478 ) ) ( not ( = ?auto_191476 ?auto_191478 ) ) ( not ( = ?auto_191477 ?auto_191478 ) ) ( ON ?auto_191476 ?auto_191477 ) ( ON-TABLE ?auto_191478 ) ( ON ?auto_191475 ?auto_191476 ) ( ON ?auto_191474 ?auto_191475 ) ( ON ?auto_191473 ?auto_191474 ) ( ON ?auto_191472 ?auto_191473 ) ( ON ?auto_191471 ?auto_191472 ) ( CLEAR ?auto_191471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191478 ?auto_191477 ?auto_191476 ?auto_191475 ?auto_191474 ?auto_191473 ?auto_191472 )
      ( MAKE-7PILE ?auto_191471 ?auto_191472 ?auto_191473 ?auto_191474 ?auto_191475 ?auto_191476 ?auto_191477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191486 - BLOCK
      ?auto_191487 - BLOCK
      ?auto_191488 - BLOCK
      ?auto_191489 - BLOCK
      ?auto_191490 - BLOCK
      ?auto_191491 - BLOCK
      ?auto_191492 - BLOCK
    )
    :vars
    (
      ?auto_191493 - BLOCK
      ?auto_191494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191486 ?auto_191487 ) ) ( not ( = ?auto_191486 ?auto_191488 ) ) ( not ( = ?auto_191486 ?auto_191489 ) ) ( not ( = ?auto_191486 ?auto_191490 ) ) ( not ( = ?auto_191486 ?auto_191491 ) ) ( not ( = ?auto_191486 ?auto_191492 ) ) ( not ( = ?auto_191487 ?auto_191488 ) ) ( not ( = ?auto_191487 ?auto_191489 ) ) ( not ( = ?auto_191487 ?auto_191490 ) ) ( not ( = ?auto_191487 ?auto_191491 ) ) ( not ( = ?auto_191487 ?auto_191492 ) ) ( not ( = ?auto_191488 ?auto_191489 ) ) ( not ( = ?auto_191488 ?auto_191490 ) ) ( not ( = ?auto_191488 ?auto_191491 ) ) ( not ( = ?auto_191488 ?auto_191492 ) ) ( not ( = ?auto_191489 ?auto_191490 ) ) ( not ( = ?auto_191489 ?auto_191491 ) ) ( not ( = ?auto_191489 ?auto_191492 ) ) ( not ( = ?auto_191490 ?auto_191491 ) ) ( not ( = ?auto_191490 ?auto_191492 ) ) ( not ( = ?auto_191491 ?auto_191492 ) ) ( ON ?auto_191492 ?auto_191493 ) ( not ( = ?auto_191486 ?auto_191493 ) ) ( not ( = ?auto_191487 ?auto_191493 ) ) ( not ( = ?auto_191488 ?auto_191493 ) ) ( not ( = ?auto_191489 ?auto_191493 ) ) ( not ( = ?auto_191490 ?auto_191493 ) ) ( not ( = ?auto_191491 ?auto_191493 ) ) ( not ( = ?auto_191492 ?auto_191493 ) ) ( ON ?auto_191491 ?auto_191492 ) ( ON-TABLE ?auto_191493 ) ( ON ?auto_191490 ?auto_191491 ) ( ON ?auto_191489 ?auto_191490 ) ( ON ?auto_191488 ?auto_191489 ) ( ON ?auto_191487 ?auto_191488 ) ( CLEAR ?auto_191487 ) ( ON ?auto_191486 ?auto_191494 ) ( CLEAR ?auto_191486 ) ( HAND-EMPTY ) ( not ( = ?auto_191486 ?auto_191494 ) ) ( not ( = ?auto_191487 ?auto_191494 ) ) ( not ( = ?auto_191488 ?auto_191494 ) ) ( not ( = ?auto_191489 ?auto_191494 ) ) ( not ( = ?auto_191490 ?auto_191494 ) ) ( not ( = ?auto_191491 ?auto_191494 ) ) ( not ( = ?auto_191492 ?auto_191494 ) ) ( not ( = ?auto_191493 ?auto_191494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191486 ?auto_191494 )
      ( MAKE-7PILE ?auto_191486 ?auto_191487 ?auto_191488 ?auto_191489 ?auto_191490 ?auto_191491 ?auto_191492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191495 - BLOCK
      ?auto_191496 - BLOCK
      ?auto_191497 - BLOCK
      ?auto_191498 - BLOCK
      ?auto_191499 - BLOCK
      ?auto_191500 - BLOCK
      ?auto_191501 - BLOCK
    )
    :vars
    (
      ?auto_191502 - BLOCK
      ?auto_191503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191495 ?auto_191496 ) ) ( not ( = ?auto_191495 ?auto_191497 ) ) ( not ( = ?auto_191495 ?auto_191498 ) ) ( not ( = ?auto_191495 ?auto_191499 ) ) ( not ( = ?auto_191495 ?auto_191500 ) ) ( not ( = ?auto_191495 ?auto_191501 ) ) ( not ( = ?auto_191496 ?auto_191497 ) ) ( not ( = ?auto_191496 ?auto_191498 ) ) ( not ( = ?auto_191496 ?auto_191499 ) ) ( not ( = ?auto_191496 ?auto_191500 ) ) ( not ( = ?auto_191496 ?auto_191501 ) ) ( not ( = ?auto_191497 ?auto_191498 ) ) ( not ( = ?auto_191497 ?auto_191499 ) ) ( not ( = ?auto_191497 ?auto_191500 ) ) ( not ( = ?auto_191497 ?auto_191501 ) ) ( not ( = ?auto_191498 ?auto_191499 ) ) ( not ( = ?auto_191498 ?auto_191500 ) ) ( not ( = ?auto_191498 ?auto_191501 ) ) ( not ( = ?auto_191499 ?auto_191500 ) ) ( not ( = ?auto_191499 ?auto_191501 ) ) ( not ( = ?auto_191500 ?auto_191501 ) ) ( ON ?auto_191501 ?auto_191502 ) ( not ( = ?auto_191495 ?auto_191502 ) ) ( not ( = ?auto_191496 ?auto_191502 ) ) ( not ( = ?auto_191497 ?auto_191502 ) ) ( not ( = ?auto_191498 ?auto_191502 ) ) ( not ( = ?auto_191499 ?auto_191502 ) ) ( not ( = ?auto_191500 ?auto_191502 ) ) ( not ( = ?auto_191501 ?auto_191502 ) ) ( ON ?auto_191500 ?auto_191501 ) ( ON-TABLE ?auto_191502 ) ( ON ?auto_191499 ?auto_191500 ) ( ON ?auto_191498 ?auto_191499 ) ( ON ?auto_191497 ?auto_191498 ) ( ON ?auto_191495 ?auto_191503 ) ( CLEAR ?auto_191495 ) ( not ( = ?auto_191495 ?auto_191503 ) ) ( not ( = ?auto_191496 ?auto_191503 ) ) ( not ( = ?auto_191497 ?auto_191503 ) ) ( not ( = ?auto_191498 ?auto_191503 ) ) ( not ( = ?auto_191499 ?auto_191503 ) ) ( not ( = ?auto_191500 ?auto_191503 ) ) ( not ( = ?auto_191501 ?auto_191503 ) ) ( not ( = ?auto_191502 ?auto_191503 ) ) ( HOLDING ?auto_191496 ) ( CLEAR ?auto_191497 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191502 ?auto_191501 ?auto_191500 ?auto_191499 ?auto_191498 ?auto_191497 ?auto_191496 )
      ( MAKE-7PILE ?auto_191495 ?auto_191496 ?auto_191497 ?auto_191498 ?auto_191499 ?auto_191500 ?auto_191501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191504 - BLOCK
      ?auto_191505 - BLOCK
      ?auto_191506 - BLOCK
      ?auto_191507 - BLOCK
      ?auto_191508 - BLOCK
      ?auto_191509 - BLOCK
      ?auto_191510 - BLOCK
    )
    :vars
    (
      ?auto_191511 - BLOCK
      ?auto_191512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191504 ?auto_191505 ) ) ( not ( = ?auto_191504 ?auto_191506 ) ) ( not ( = ?auto_191504 ?auto_191507 ) ) ( not ( = ?auto_191504 ?auto_191508 ) ) ( not ( = ?auto_191504 ?auto_191509 ) ) ( not ( = ?auto_191504 ?auto_191510 ) ) ( not ( = ?auto_191505 ?auto_191506 ) ) ( not ( = ?auto_191505 ?auto_191507 ) ) ( not ( = ?auto_191505 ?auto_191508 ) ) ( not ( = ?auto_191505 ?auto_191509 ) ) ( not ( = ?auto_191505 ?auto_191510 ) ) ( not ( = ?auto_191506 ?auto_191507 ) ) ( not ( = ?auto_191506 ?auto_191508 ) ) ( not ( = ?auto_191506 ?auto_191509 ) ) ( not ( = ?auto_191506 ?auto_191510 ) ) ( not ( = ?auto_191507 ?auto_191508 ) ) ( not ( = ?auto_191507 ?auto_191509 ) ) ( not ( = ?auto_191507 ?auto_191510 ) ) ( not ( = ?auto_191508 ?auto_191509 ) ) ( not ( = ?auto_191508 ?auto_191510 ) ) ( not ( = ?auto_191509 ?auto_191510 ) ) ( ON ?auto_191510 ?auto_191511 ) ( not ( = ?auto_191504 ?auto_191511 ) ) ( not ( = ?auto_191505 ?auto_191511 ) ) ( not ( = ?auto_191506 ?auto_191511 ) ) ( not ( = ?auto_191507 ?auto_191511 ) ) ( not ( = ?auto_191508 ?auto_191511 ) ) ( not ( = ?auto_191509 ?auto_191511 ) ) ( not ( = ?auto_191510 ?auto_191511 ) ) ( ON ?auto_191509 ?auto_191510 ) ( ON-TABLE ?auto_191511 ) ( ON ?auto_191508 ?auto_191509 ) ( ON ?auto_191507 ?auto_191508 ) ( ON ?auto_191506 ?auto_191507 ) ( ON ?auto_191504 ?auto_191512 ) ( not ( = ?auto_191504 ?auto_191512 ) ) ( not ( = ?auto_191505 ?auto_191512 ) ) ( not ( = ?auto_191506 ?auto_191512 ) ) ( not ( = ?auto_191507 ?auto_191512 ) ) ( not ( = ?auto_191508 ?auto_191512 ) ) ( not ( = ?auto_191509 ?auto_191512 ) ) ( not ( = ?auto_191510 ?auto_191512 ) ) ( not ( = ?auto_191511 ?auto_191512 ) ) ( CLEAR ?auto_191506 ) ( ON ?auto_191505 ?auto_191504 ) ( CLEAR ?auto_191505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191512 ?auto_191504 )
      ( MAKE-7PILE ?auto_191504 ?auto_191505 ?auto_191506 ?auto_191507 ?auto_191508 ?auto_191509 ?auto_191510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191513 - BLOCK
      ?auto_191514 - BLOCK
      ?auto_191515 - BLOCK
      ?auto_191516 - BLOCK
      ?auto_191517 - BLOCK
      ?auto_191518 - BLOCK
      ?auto_191519 - BLOCK
    )
    :vars
    (
      ?auto_191520 - BLOCK
      ?auto_191521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191513 ?auto_191514 ) ) ( not ( = ?auto_191513 ?auto_191515 ) ) ( not ( = ?auto_191513 ?auto_191516 ) ) ( not ( = ?auto_191513 ?auto_191517 ) ) ( not ( = ?auto_191513 ?auto_191518 ) ) ( not ( = ?auto_191513 ?auto_191519 ) ) ( not ( = ?auto_191514 ?auto_191515 ) ) ( not ( = ?auto_191514 ?auto_191516 ) ) ( not ( = ?auto_191514 ?auto_191517 ) ) ( not ( = ?auto_191514 ?auto_191518 ) ) ( not ( = ?auto_191514 ?auto_191519 ) ) ( not ( = ?auto_191515 ?auto_191516 ) ) ( not ( = ?auto_191515 ?auto_191517 ) ) ( not ( = ?auto_191515 ?auto_191518 ) ) ( not ( = ?auto_191515 ?auto_191519 ) ) ( not ( = ?auto_191516 ?auto_191517 ) ) ( not ( = ?auto_191516 ?auto_191518 ) ) ( not ( = ?auto_191516 ?auto_191519 ) ) ( not ( = ?auto_191517 ?auto_191518 ) ) ( not ( = ?auto_191517 ?auto_191519 ) ) ( not ( = ?auto_191518 ?auto_191519 ) ) ( ON ?auto_191519 ?auto_191520 ) ( not ( = ?auto_191513 ?auto_191520 ) ) ( not ( = ?auto_191514 ?auto_191520 ) ) ( not ( = ?auto_191515 ?auto_191520 ) ) ( not ( = ?auto_191516 ?auto_191520 ) ) ( not ( = ?auto_191517 ?auto_191520 ) ) ( not ( = ?auto_191518 ?auto_191520 ) ) ( not ( = ?auto_191519 ?auto_191520 ) ) ( ON ?auto_191518 ?auto_191519 ) ( ON-TABLE ?auto_191520 ) ( ON ?auto_191517 ?auto_191518 ) ( ON ?auto_191516 ?auto_191517 ) ( ON ?auto_191513 ?auto_191521 ) ( not ( = ?auto_191513 ?auto_191521 ) ) ( not ( = ?auto_191514 ?auto_191521 ) ) ( not ( = ?auto_191515 ?auto_191521 ) ) ( not ( = ?auto_191516 ?auto_191521 ) ) ( not ( = ?auto_191517 ?auto_191521 ) ) ( not ( = ?auto_191518 ?auto_191521 ) ) ( not ( = ?auto_191519 ?auto_191521 ) ) ( not ( = ?auto_191520 ?auto_191521 ) ) ( ON ?auto_191514 ?auto_191513 ) ( CLEAR ?auto_191514 ) ( ON-TABLE ?auto_191521 ) ( HOLDING ?auto_191515 ) ( CLEAR ?auto_191516 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191520 ?auto_191519 ?auto_191518 ?auto_191517 ?auto_191516 ?auto_191515 )
      ( MAKE-7PILE ?auto_191513 ?auto_191514 ?auto_191515 ?auto_191516 ?auto_191517 ?auto_191518 ?auto_191519 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191522 - BLOCK
      ?auto_191523 - BLOCK
      ?auto_191524 - BLOCK
      ?auto_191525 - BLOCK
      ?auto_191526 - BLOCK
      ?auto_191527 - BLOCK
      ?auto_191528 - BLOCK
    )
    :vars
    (
      ?auto_191529 - BLOCK
      ?auto_191530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191522 ?auto_191523 ) ) ( not ( = ?auto_191522 ?auto_191524 ) ) ( not ( = ?auto_191522 ?auto_191525 ) ) ( not ( = ?auto_191522 ?auto_191526 ) ) ( not ( = ?auto_191522 ?auto_191527 ) ) ( not ( = ?auto_191522 ?auto_191528 ) ) ( not ( = ?auto_191523 ?auto_191524 ) ) ( not ( = ?auto_191523 ?auto_191525 ) ) ( not ( = ?auto_191523 ?auto_191526 ) ) ( not ( = ?auto_191523 ?auto_191527 ) ) ( not ( = ?auto_191523 ?auto_191528 ) ) ( not ( = ?auto_191524 ?auto_191525 ) ) ( not ( = ?auto_191524 ?auto_191526 ) ) ( not ( = ?auto_191524 ?auto_191527 ) ) ( not ( = ?auto_191524 ?auto_191528 ) ) ( not ( = ?auto_191525 ?auto_191526 ) ) ( not ( = ?auto_191525 ?auto_191527 ) ) ( not ( = ?auto_191525 ?auto_191528 ) ) ( not ( = ?auto_191526 ?auto_191527 ) ) ( not ( = ?auto_191526 ?auto_191528 ) ) ( not ( = ?auto_191527 ?auto_191528 ) ) ( ON ?auto_191528 ?auto_191529 ) ( not ( = ?auto_191522 ?auto_191529 ) ) ( not ( = ?auto_191523 ?auto_191529 ) ) ( not ( = ?auto_191524 ?auto_191529 ) ) ( not ( = ?auto_191525 ?auto_191529 ) ) ( not ( = ?auto_191526 ?auto_191529 ) ) ( not ( = ?auto_191527 ?auto_191529 ) ) ( not ( = ?auto_191528 ?auto_191529 ) ) ( ON ?auto_191527 ?auto_191528 ) ( ON-TABLE ?auto_191529 ) ( ON ?auto_191526 ?auto_191527 ) ( ON ?auto_191525 ?auto_191526 ) ( ON ?auto_191522 ?auto_191530 ) ( not ( = ?auto_191522 ?auto_191530 ) ) ( not ( = ?auto_191523 ?auto_191530 ) ) ( not ( = ?auto_191524 ?auto_191530 ) ) ( not ( = ?auto_191525 ?auto_191530 ) ) ( not ( = ?auto_191526 ?auto_191530 ) ) ( not ( = ?auto_191527 ?auto_191530 ) ) ( not ( = ?auto_191528 ?auto_191530 ) ) ( not ( = ?auto_191529 ?auto_191530 ) ) ( ON ?auto_191523 ?auto_191522 ) ( ON-TABLE ?auto_191530 ) ( CLEAR ?auto_191525 ) ( ON ?auto_191524 ?auto_191523 ) ( CLEAR ?auto_191524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191530 ?auto_191522 ?auto_191523 )
      ( MAKE-7PILE ?auto_191522 ?auto_191523 ?auto_191524 ?auto_191525 ?auto_191526 ?auto_191527 ?auto_191528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191531 - BLOCK
      ?auto_191532 - BLOCK
      ?auto_191533 - BLOCK
      ?auto_191534 - BLOCK
      ?auto_191535 - BLOCK
      ?auto_191536 - BLOCK
      ?auto_191537 - BLOCK
    )
    :vars
    (
      ?auto_191538 - BLOCK
      ?auto_191539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191531 ?auto_191532 ) ) ( not ( = ?auto_191531 ?auto_191533 ) ) ( not ( = ?auto_191531 ?auto_191534 ) ) ( not ( = ?auto_191531 ?auto_191535 ) ) ( not ( = ?auto_191531 ?auto_191536 ) ) ( not ( = ?auto_191531 ?auto_191537 ) ) ( not ( = ?auto_191532 ?auto_191533 ) ) ( not ( = ?auto_191532 ?auto_191534 ) ) ( not ( = ?auto_191532 ?auto_191535 ) ) ( not ( = ?auto_191532 ?auto_191536 ) ) ( not ( = ?auto_191532 ?auto_191537 ) ) ( not ( = ?auto_191533 ?auto_191534 ) ) ( not ( = ?auto_191533 ?auto_191535 ) ) ( not ( = ?auto_191533 ?auto_191536 ) ) ( not ( = ?auto_191533 ?auto_191537 ) ) ( not ( = ?auto_191534 ?auto_191535 ) ) ( not ( = ?auto_191534 ?auto_191536 ) ) ( not ( = ?auto_191534 ?auto_191537 ) ) ( not ( = ?auto_191535 ?auto_191536 ) ) ( not ( = ?auto_191535 ?auto_191537 ) ) ( not ( = ?auto_191536 ?auto_191537 ) ) ( ON ?auto_191537 ?auto_191538 ) ( not ( = ?auto_191531 ?auto_191538 ) ) ( not ( = ?auto_191532 ?auto_191538 ) ) ( not ( = ?auto_191533 ?auto_191538 ) ) ( not ( = ?auto_191534 ?auto_191538 ) ) ( not ( = ?auto_191535 ?auto_191538 ) ) ( not ( = ?auto_191536 ?auto_191538 ) ) ( not ( = ?auto_191537 ?auto_191538 ) ) ( ON ?auto_191536 ?auto_191537 ) ( ON-TABLE ?auto_191538 ) ( ON ?auto_191535 ?auto_191536 ) ( ON ?auto_191531 ?auto_191539 ) ( not ( = ?auto_191531 ?auto_191539 ) ) ( not ( = ?auto_191532 ?auto_191539 ) ) ( not ( = ?auto_191533 ?auto_191539 ) ) ( not ( = ?auto_191534 ?auto_191539 ) ) ( not ( = ?auto_191535 ?auto_191539 ) ) ( not ( = ?auto_191536 ?auto_191539 ) ) ( not ( = ?auto_191537 ?auto_191539 ) ) ( not ( = ?auto_191538 ?auto_191539 ) ) ( ON ?auto_191532 ?auto_191531 ) ( ON-TABLE ?auto_191539 ) ( ON ?auto_191533 ?auto_191532 ) ( CLEAR ?auto_191533 ) ( HOLDING ?auto_191534 ) ( CLEAR ?auto_191535 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191538 ?auto_191537 ?auto_191536 ?auto_191535 ?auto_191534 )
      ( MAKE-7PILE ?auto_191531 ?auto_191532 ?auto_191533 ?auto_191534 ?auto_191535 ?auto_191536 ?auto_191537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191540 - BLOCK
      ?auto_191541 - BLOCK
      ?auto_191542 - BLOCK
      ?auto_191543 - BLOCK
      ?auto_191544 - BLOCK
      ?auto_191545 - BLOCK
      ?auto_191546 - BLOCK
    )
    :vars
    (
      ?auto_191547 - BLOCK
      ?auto_191548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191540 ?auto_191541 ) ) ( not ( = ?auto_191540 ?auto_191542 ) ) ( not ( = ?auto_191540 ?auto_191543 ) ) ( not ( = ?auto_191540 ?auto_191544 ) ) ( not ( = ?auto_191540 ?auto_191545 ) ) ( not ( = ?auto_191540 ?auto_191546 ) ) ( not ( = ?auto_191541 ?auto_191542 ) ) ( not ( = ?auto_191541 ?auto_191543 ) ) ( not ( = ?auto_191541 ?auto_191544 ) ) ( not ( = ?auto_191541 ?auto_191545 ) ) ( not ( = ?auto_191541 ?auto_191546 ) ) ( not ( = ?auto_191542 ?auto_191543 ) ) ( not ( = ?auto_191542 ?auto_191544 ) ) ( not ( = ?auto_191542 ?auto_191545 ) ) ( not ( = ?auto_191542 ?auto_191546 ) ) ( not ( = ?auto_191543 ?auto_191544 ) ) ( not ( = ?auto_191543 ?auto_191545 ) ) ( not ( = ?auto_191543 ?auto_191546 ) ) ( not ( = ?auto_191544 ?auto_191545 ) ) ( not ( = ?auto_191544 ?auto_191546 ) ) ( not ( = ?auto_191545 ?auto_191546 ) ) ( ON ?auto_191546 ?auto_191547 ) ( not ( = ?auto_191540 ?auto_191547 ) ) ( not ( = ?auto_191541 ?auto_191547 ) ) ( not ( = ?auto_191542 ?auto_191547 ) ) ( not ( = ?auto_191543 ?auto_191547 ) ) ( not ( = ?auto_191544 ?auto_191547 ) ) ( not ( = ?auto_191545 ?auto_191547 ) ) ( not ( = ?auto_191546 ?auto_191547 ) ) ( ON ?auto_191545 ?auto_191546 ) ( ON-TABLE ?auto_191547 ) ( ON ?auto_191544 ?auto_191545 ) ( ON ?auto_191540 ?auto_191548 ) ( not ( = ?auto_191540 ?auto_191548 ) ) ( not ( = ?auto_191541 ?auto_191548 ) ) ( not ( = ?auto_191542 ?auto_191548 ) ) ( not ( = ?auto_191543 ?auto_191548 ) ) ( not ( = ?auto_191544 ?auto_191548 ) ) ( not ( = ?auto_191545 ?auto_191548 ) ) ( not ( = ?auto_191546 ?auto_191548 ) ) ( not ( = ?auto_191547 ?auto_191548 ) ) ( ON ?auto_191541 ?auto_191540 ) ( ON-TABLE ?auto_191548 ) ( ON ?auto_191542 ?auto_191541 ) ( CLEAR ?auto_191544 ) ( ON ?auto_191543 ?auto_191542 ) ( CLEAR ?auto_191543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191548 ?auto_191540 ?auto_191541 ?auto_191542 )
      ( MAKE-7PILE ?auto_191540 ?auto_191541 ?auto_191542 ?auto_191543 ?auto_191544 ?auto_191545 ?auto_191546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191549 - BLOCK
      ?auto_191550 - BLOCK
      ?auto_191551 - BLOCK
      ?auto_191552 - BLOCK
      ?auto_191553 - BLOCK
      ?auto_191554 - BLOCK
      ?auto_191555 - BLOCK
    )
    :vars
    (
      ?auto_191557 - BLOCK
      ?auto_191556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191549 ?auto_191550 ) ) ( not ( = ?auto_191549 ?auto_191551 ) ) ( not ( = ?auto_191549 ?auto_191552 ) ) ( not ( = ?auto_191549 ?auto_191553 ) ) ( not ( = ?auto_191549 ?auto_191554 ) ) ( not ( = ?auto_191549 ?auto_191555 ) ) ( not ( = ?auto_191550 ?auto_191551 ) ) ( not ( = ?auto_191550 ?auto_191552 ) ) ( not ( = ?auto_191550 ?auto_191553 ) ) ( not ( = ?auto_191550 ?auto_191554 ) ) ( not ( = ?auto_191550 ?auto_191555 ) ) ( not ( = ?auto_191551 ?auto_191552 ) ) ( not ( = ?auto_191551 ?auto_191553 ) ) ( not ( = ?auto_191551 ?auto_191554 ) ) ( not ( = ?auto_191551 ?auto_191555 ) ) ( not ( = ?auto_191552 ?auto_191553 ) ) ( not ( = ?auto_191552 ?auto_191554 ) ) ( not ( = ?auto_191552 ?auto_191555 ) ) ( not ( = ?auto_191553 ?auto_191554 ) ) ( not ( = ?auto_191553 ?auto_191555 ) ) ( not ( = ?auto_191554 ?auto_191555 ) ) ( ON ?auto_191555 ?auto_191557 ) ( not ( = ?auto_191549 ?auto_191557 ) ) ( not ( = ?auto_191550 ?auto_191557 ) ) ( not ( = ?auto_191551 ?auto_191557 ) ) ( not ( = ?auto_191552 ?auto_191557 ) ) ( not ( = ?auto_191553 ?auto_191557 ) ) ( not ( = ?auto_191554 ?auto_191557 ) ) ( not ( = ?auto_191555 ?auto_191557 ) ) ( ON ?auto_191554 ?auto_191555 ) ( ON-TABLE ?auto_191557 ) ( ON ?auto_191549 ?auto_191556 ) ( not ( = ?auto_191549 ?auto_191556 ) ) ( not ( = ?auto_191550 ?auto_191556 ) ) ( not ( = ?auto_191551 ?auto_191556 ) ) ( not ( = ?auto_191552 ?auto_191556 ) ) ( not ( = ?auto_191553 ?auto_191556 ) ) ( not ( = ?auto_191554 ?auto_191556 ) ) ( not ( = ?auto_191555 ?auto_191556 ) ) ( not ( = ?auto_191557 ?auto_191556 ) ) ( ON ?auto_191550 ?auto_191549 ) ( ON-TABLE ?auto_191556 ) ( ON ?auto_191551 ?auto_191550 ) ( ON ?auto_191552 ?auto_191551 ) ( CLEAR ?auto_191552 ) ( HOLDING ?auto_191553 ) ( CLEAR ?auto_191554 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191557 ?auto_191555 ?auto_191554 ?auto_191553 )
      ( MAKE-7PILE ?auto_191549 ?auto_191550 ?auto_191551 ?auto_191552 ?auto_191553 ?auto_191554 ?auto_191555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191558 - BLOCK
      ?auto_191559 - BLOCK
      ?auto_191560 - BLOCK
      ?auto_191561 - BLOCK
      ?auto_191562 - BLOCK
      ?auto_191563 - BLOCK
      ?auto_191564 - BLOCK
    )
    :vars
    (
      ?auto_191565 - BLOCK
      ?auto_191566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191558 ?auto_191559 ) ) ( not ( = ?auto_191558 ?auto_191560 ) ) ( not ( = ?auto_191558 ?auto_191561 ) ) ( not ( = ?auto_191558 ?auto_191562 ) ) ( not ( = ?auto_191558 ?auto_191563 ) ) ( not ( = ?auto_191558 ?auto_191564 ) ) ( not ( = ?auto_191559 ?auto_191560 ) ) ( not ( = ?auto_191559 ?auto_191561 ) ) ( not ( = ?auto_191559 ?auto_191562 ) ) ( not ( = ?auto_191559 ?auto_191563 ) ) ( not ( = ?auto_191559 ?auto_191564 ) ) ( not ( = ?auto_191560 ?auto_191561 ) ) ( not ( = ?auto_191560 ?auto_191562 ) ) ( not ( = ?auto_191560 ?auto_191563 ) ) ( not ( = ?auto_191560 ?auto_191564 ) ) ( not ( = ?auto_191561 ?auto_191562 ) ) ( not ( = ?auto_191561 ?auto_191563 ) ) ( not ( = ?auto_191561 ?auto_191564 ) ) ( not ( = ?auto_191562 ?auto_191563 ) ) ( not ( = ?auto_191562 ?auto_191564 ) ) ( not ( = ?auto_191563 ?auto_191564 ) ) ( ON ?auto_191564 ?auto_191565 ) ( not ( = ?auto_191558 ?auto_191565 ) ) ( not ( = ?auto_191559 ?auto_191565 ) ) ( not ( = ?auto_191560 ?auto_191565 ) ) ( not ( = ?auto_191561 ?auto_191565 ) ) ( not ( = ?auto_191562 ?auto_191565 ) ) ( not ( = ?auto_191563 ?auto_191565 ) ) ( not ( = ?auto_191564 ?auto_191565 ) ) ( ON ?auto_191563 ?auto_191564 ) ( ON-TABLE ?auto_191565 ) ( ON ?auto_191558 ?auto_191566 ) ( not ( = ?auto_191558 ?auto_191566 ) ) ( not ( = ?auto_191559 ?auto_191566 ) ) ( not ( = ?auto_191560 ?auto_191566 ) ) ( not ( = ?auto_191561 ?auto_191566 ) ) ( not ( = ?auto_191562 ?auto_191566 ) ) ( not ( = ?auto_191563 ?auto_191566 ) ) ( not ( = ?auto_191564 ?auto_191566 ) ) ( not ( = ?auto_191565 ?auto_191566 ) ) ( ON ?auto_191559 ?auto_191558 ) ( ON-TABLE ?auto_191566 ) ( ON ?auto_191560 ?auto_191559 ) ( ON ?auto_191561 ?auto_191560 ) ( CLEAR ?auto_191563 ) ( ON ?auto_191562 ?auto_191561 ) ( CLEAR ?auto_191562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191566 ?auto_191558 ?auto_191559 ?auto_191560 ?auto_191561 )
      ( MAKE-7PILE ?auto_191558 ?auto_191559 ?auto_191560 ?auto_191561 ?auto_191562 ?auto_191563 ?auto_191564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191567 - BLOCK
      ?auto_191568 - BLOCK
      ?auto_191569 - BLOCK
      ?auto_191570 - BLOCK
      ?auto_191571 - BLOCK
      ?auto_191572 - BLOCK
      ?auto_191573 - BLOCK
    )
    :vars
    (
      ?auto_191575 - BLOCK
      ?auto_191574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191567 ?auto_191568 ) ) ( not ( = ?auto_191567 ?auto_191569 ) ) ( not ( = ?auto_191567 ?auto_191570 ) ) ( not ( = ?auto_191567 ?auto_191571 ) ) ( not ( = ?auto_191567 ?auto_191572 ) ) ( not ( = ?auto_191567 ?auto_191573 ) ) ( not ( = ?auto_191568 ?auto_191569 ) ) ( not ( = ?auto_191568 ?auto_191570 ) ) ( not ( = ?auto_191568 ?auto_191571 ) ) ( not ( = ?auto_191568 ?auto_191572 ) ) ( not ( = ?auto_191568 ?auto_191573 ) ) ( not ( = ?auto_191569 ?auto_191570 ) ) ( not ( = ?auto_191569 ?auto_191571 ) ) ( not ( = ?auto_191569 ?auto_191572 ) ) ( not ( = ?auto_191569 ?auto_191573 ) ) ( not ( = ?auto_191570 ?auto_191571 ) ) ( not ( = ?auto_191570 ?auto_191572 ) ) ( not ( = ?auto_191570 ?auto_191573 ) ) ( not ( = ?auto_191571 ?auto_191572 ) ) ( not ( = ?auto_191571 ?auto_191573 ) ) ( not ( = ?auto_191572 ?auto_191573 ) ) ( ON ?auto_191573 ?auto_191575 ) ( not ( = ?auto_191567 ?auto_191575 ) ) ( not ( = ?auto_191568 ?auto_191575 ) ) ( not ( = ?auto_191569 ?auto_191575 ) ) ( not ( = ?auto_191570 ?auto_191575 ) ) ( not ( = ?auto_191571 ?auto_191575 ) ) ( not ( = ?auto_191572 ?auto_191575 ) ) ( not ( = ?auto_191573 ?auto_191575 ) ) ( ON-TABLE ?auto_191575 ) ( ON ?auto_191567 ?auto_191574 ) ( not ( = ?auto_191567 ?auto_191574 ) ) ( not ( = ?auto_191568 ?auto_191574 ) ) ( not ( = ?auto_191569 ?auto_191574 ) ) ( not ( = ?auto_191570 ?auto_191574 ) ) ( not ( = ?auto_191571 ?auto_191574 ) ) ( not ( = ?auto_191572 ?auto_191574 ) ) ( not ( = ?auto_191573 ?auto_191574 ) ) ( not ( = ?auto_191575 ?auto_191574 ) ) ( ON ?auto_191568 ?auto_191567 ) ( ON-TABLE ?auto_191574 ) ( ON ?auto_191569 ?auto_191568 ) ( ON ?auto_191570 ?auto_191569 ) ( ON ?auto_191571 ?auto_191570 ) ( CLEAR ?auto_191571 ) ( HOLDING ?auto_191572 ) ( CLEAR ?auto_191573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191575 ?auto_191573 ?auto_191572 )
      ( MAKE-7PILE ?auto_191567 ?auto_191568 ?auto_191569 ?auto_191570 ?auto_191571 ?auto_191572 ?auto_191573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191576 - BLOCK
      ?auto_191577 - BLOCK
      ?auto_191578 - BLOCK
      ?auto_191579 - BLOCK
      ?auto_191580 - BLOCK
      ?auto_191581 - BLOCK
      ?auto_191582 - BLOCK
    )
    :vars
    (
      ?auto_191583 - BLOCK
      ?auto_191584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191576 ?auto_191577 ) ) ( not ( = ?auto_191576 ?auto_191578 ) ) ( not ( = ?auto_191576 ?auto_191579 ) ) ( not ( = ?auto_191576 ?auto_191580 ) ) ( not ( = ?auto_191576 ?auto_191581 ) ) ( not ( = ?auto_191576 ?auto_191582 ) ) ( not ( = ?auto_191577 ?auto_191578 ) ) ( not ( = ?auto_191577 ?auto_191579 ) ) ( not ( = ?auto_191577 ?auto_191580 ) ) ( not ( = ?auto_191577 ?auto_191581 ) ) ( not ( = ?auto_191577 ?auto_191582 ) ) ( not ( = ?auto_191578 ?auto_191579 ) ) ( not ( = ?auto_191578 ?auto_191580 ) ) ( not ( = ?auto_191578 ?auto_191581 ) ) ( not ( = ?auto_191578 ?auto_191582 ) ) ( not ( = ?auto_191579 ?auto_191580 ) ) ( not ( = ?auto_191579 ?auto_191581 ) ) ( not ( = ?auto_191579 ?auto_191582 ) ) ( not ( = ?auto_191580 ?auto_191581 ) ) ( not ( = ?auto_191580 ?auto_191582 ) ) ( not ( = ?auto_191581 ?auto_191582 ) ) ( ON ?auto_191582 ?auto_191583 ) ( not ( = ?auto_191576 ?auto_191583 ) ) ( not ( = ?auto_191577 ?auto_191583 ) ) ( not ( = ?auto_191578 ?auto_191583 ) ) ( not ( = ?auto_191579 ?auto_191583 ) ) ( not ( = ?auto_191580 ?auto_191583 ) ) ( not ( = ?auto_191581 ?auto_191583 ) ) ( not ( = ?auto_191582 ?auto_191583 ) ) ( ON-TABLE ?auto_191583 ) ( ON ?auto_191576 ?auto_191584 ) ( not ( = ?auto_191576 ?auto_191584 ) ) ( not ( = ?auto_191577 ?auto_191584 ) ) ( not ( = ?auto_191578 ?auto_191584 ) ) ( not ( = ?auto_191579 ?auto_191584 ) ) ( not ( = ?auto_191580 ?auto_191584 ) ) ( not ( = ?auto_191581 ?auto_191584 ) ) ( not ( = ?auto_191582 ?auto_191584 ) ) ( not ( = ?auto_191583 ?auto_191584 ) ) ( ON ?auto_191577 ?auto_191576 ) ( ON-TABLE ?auto_191584 ) ( ON ?auto_191578 ?auto_191577 ) ( ON ?auto_191579 ?auto_191578 ) ( ON ?auto_191580 ?auto_191579 ) ( CLEAR ?auto_191582 ) ( ON ?auto_191581 ?auto_191580 ) ( CLEAR ?auto_191581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191584 ?auto_191576 ?auto_191577 ?auto_191578 ?auto_191579 ?auto_191580 )
      ( MAKE-7PILE ?auto_191576 ?auto_191577 ?auto_191578 ?auto_191579 ?auto_191580 ?auto_191581 ?auto_191582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191585 - BLOCK
      ?auto_191586 - BLOCK
      ?auto_191587 - BLOCK
      ?auto_191588 - BLOCK
      ?auto_191589 - BLOCK
      ?auto_191590 - BLOCK
      ?auto_191591 - BLOCK
    )
    :vars
    (
      ?auto_191592 - BLOCK
      ?auto_191593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191585 ?auto_191586 ) ) ( not ( = ?auto_191585 ?auto_191587 ) ) ( not ( = ?auto_191585 ?auto_191588 ) ) ( not ( = ?auto_191585 ?auto_191589 ) ) ( not ( = ?auto_191585 ?auto_191590 ) ) ( not ( = ?auto_191585 ?auto_191591 ) ) ( not ( = ?auto_191586 ?auto_191587 ) ) ( not ( = ?auto_191586 ?auto_191588 ) ) ( not ( = ?auto_191586 ?auto_191589 ) ) ( not ( = ?auto_191586 ?auto_191590 ) ) ( not ( = ?auto_191586 ?auto_191591 ) ) ( not ( = ?auto_191587 ?auto_191588 ) ) ( not ( = ?auto_191587 ?auto_191589 ) ) ( not ( = ?auto_191587 ?auto_191590 ) ) ( not ( = ?auto_191587 ?auto_191591 ) ) ( not ( = ?auto_191588 ?auto_191589 ) ) ( not ( = ?auto_191588 ?auto_191590 ) ) ( not ( = ?auto_191588 ?auto_191591 ) ) ( not ( = ?auto_191589 ?auto_191590 ) ) ( not ( = ?auto_191589 ?auto_191591 ) ) ( not ( = ?auto_191590 ?auto_191591 ) ) ( not ( = ?auto_191585 ?auto_191592 ) ) ( not ( = ?auto_191586 ?auto_191592 ) ) ( not ( = ?auto_191587 ?auto_191592 ) ) ( not ( = ?auto_191588 ?auto_191592 ) ) ( not ( = ?auto_191589 ?auto_191592 ) ) ( not ( = ?auto_191590 ?auto_191592 ) ) ( not ( = ?auto_191591 ?auto_191592 ) ) ( ON-TABLE ?auto_191592 ) ( ON ?auto_191585 ?auto_191593 ) ( not ( = ?auto_191585 ?auto_191593 ) ) ( not ( = ?auto_191586 ?auto_191593 ) ) ( not ( = ?auto_191587 ?auto_191593 ) ) ( not ( = ?auto_191588 ?auto_191593 ) ) ( not ( = ?auto_191589 ?auto_191593 ) ) ( not ( = ?auto_191590 ?auto_191593 ) ) ( not ( = ?auto_191591 ?auto_191593 ) ) ( not ( = ?auto_191592 ?auto_191593 ) ) ( ON ?auto_191586 ?auto_191585 ) ( ON-TABLE ?auto_191593 ) ( ON ?auto_191587 ?auto_191586 ) ( ON ?auto_191588 ?auto_191587 ) ( ON ?auto_191589 ?auto_191588 ) ( ON ?auto_191590 ?auto_191589 ) ( CLEAR ?auto_191590 ) ( HOLDING ?auto_191591 ) ( CLEAR ?auto_191592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191592 ?auto_191591 )
      ( MAKE-7PILE ?auto_191585 ?auto_191586 ?auto_191587 ?auto_191588 ?auto_191589 ?auto_191590 ?auto_191591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191594 - BLOCK
      ?auto_191595 - BLOCK
      ?auto_191596 - BLOCK
      ?auto_191597 - BLOCK
      ?auto_191598 - BLOCK
      ?auto_191599 - BLOCK
      ?auto_191600 - BLOCK
    )
    :vars
    (
      ?auto_191601 - BLOCK
      ?auto_191602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191594 ?auto_191595 ) ) ( not ( = ?auto_191594 ?auto_191596 ) ) ( not ( = ?auto_191594 ?auto_191597 ) ) ( not ( = ?auto_191594 ?auto_191598 ) ) ( not ( = ?auto_191594 ?auto_191599 ) ) ( not ( = ?auto_191594 ?auto_191600 ) ) ( not ( = ?auto_191595 ?auto_191596 ) ) ( not ( = ?auto_191595 ?auto_191597 ) ) ( not ( = ?auto_191595 ?auto_191598 ) ) ( not ( = ?auto_191595 ?auto_191599 ) ) ( not ( = ?auto_191595 ?auto_191600 ) ) ( not ( = ?auto_191596 ?auto_191597 ) ) ( not ( = ?auto_191596 ?auto_191598 ) ) ( not ( = ?auto_191596 ?auto_191599 ) ) ( not ( = ?auto_191596 ?auto_191600 ) ) ( not ( = ?auto_191597 ?auto_191598 ) ) ( not ( = ?auto_191597 ?auto_191599 ) ) ( not ( = ?auto_191597 ?auto_191600 ) ) ( not ( = ?auto_191598 ?auto_191599 ) ) ( not ( = ?auto_191598 ?auto_191600 ) ) ( not ( = ?auto_191599 ?auto_191600 ) ) ( not ( = ?auto_191594 ?auto_191601 ) ) ( not ( = ?auto_191595 ?auto_191601 ) ) ( not ( = ?auto_191596 ?auto_191601 ) ) ( not ( = ?auto_191597 ?auto_191601 ) ) ( not ( = ?auto_191598 ?auto_191601 ) ) ( not ( = ?auto_191599 ?auto_191601 ) ) ( not ( = ?auto_191600 ?auto_191601 ) ) ( ON-TABLE ?auto_191601 ) ( ON ?auto_191594 ?auto_191602 ) ( not ( = ?auto_191594 ?auto_191602 ) ) ( not ( = ?auto_191595 ?auto_191602 ) ) ( not ( = ?auto_191596 ?auto_191602 ) ) ( not ( = ?auto_191597 ?auto_191602 ) ) ( not ( = ?auto_191598 ?auto_191602 ) ) ( not ( = ?auto_191599 ?auto_191602 ) ) ( not ( = ?auto_191600 ?auto_191602 ) ) ( not ( = ?auto_191601 ?auto_191602 ) ) ( ON ?auto_191595 ?auto_191594 ) ( ON-TABLE ?auto_191602 ) ( ON ?auto_191596 ?auto_191595 ) ( ON ?auto_191597 ?auto_191596 ) ( ON ?auto_191598 ?auto_191597 ) ( ON ?auto_191599 ?auto_191598 ) ( CLEAR ?auto_191601 ) ( ON ?auto_191600 ?auto_191599 ) ( CLEAR ?auto_191600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191602 ?auto_191594 ?auto_191595 ?auto_191596 ?auto_191597 ?auto_191598 ?auto_191599 )
      ( MAKE-7PILE ?auto_191594 ?auto_191595 ?auto_191596 ?auto_191597 ?auto_191598 ?auto_191599 ?auto_191600 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191603 - BLOCK
      ?auto_191604 - BLOCK
      ?auto_191605 - BLOCK
      ?auto_191606 - BLOCK
      ?auto_191607 - BLOCK
      ?auto_191608 - BLOCK
      ?auto_191609 - BLOCK
    )
    :vars
    (
      ?auto_191611 - BLOCK
      ?auto_191610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191603 ?auto_191604 ) ) ( not ( = ?auto_191603 ?auto_191605 ) ) ( not ( = ?auto_191603 ?auto_191606 ) ) ( not ( = ?auto_191603 ?auto_191607 ) ) ( not ( = ?auto_191603 ?auto_191608 ) ) ( not ( = ?auto_191603 ?auto_191609 ) ) ( not ( = ?auto_191604 ?auto_191605 ) ) ( not ( = ?auto_191604 ?auto_191606 ) ) ( not ( = ?auto_191604 ?auto_191607 ) ) ( not ( = ?auto_191604 ?auto_191608 ) ) ( not ( = ?auto_191604 ?auto_191609 ) ) ( not ( = ?auto_191605 ?auto_191606 ) ) ( not ( = ?auto_191605 ?auto_191607 ) ) ( not ( = ?auto_191605 ?auto_191608 ) ) ( not ( = ?auto_191605 ?auto_191609 ) ) ( not ( = ?auto_191606 ?auto_191607 ) ) ( not ( = ?auto_191606 ?auto_191608 ) ) ( not ( = ?auto_191606 ?auto_191609 ) ) ( not ( = ?auto_191607 ?auto_191608 ) ) ( not ( = ?auto_191607 ?auto_191609 ) ) ( not ( = ?auto_191608 ?auto_191609 ) ) ( not ( = ?auto_191603 ?auto_191611 ) ) ( not ( = ?auto_191604 ?auto_191611 ) ) ( not ( = ?auto_191605 ?auto_191611 ) ) ( not ( = ?auto_191606 ?auto_191611 ) ) ( not ( = ?auto_191607 ?auto_191611 ) ) ( not ( = ?auto_191608 ?auto_191611 ) ) ( not ( = ?auto_191609 ?auto_191611 ) ) ( ON ?auto_191603 ?auto_191610 ) ( not ( = ?auto_191603 ?auto_191610 ) ) ( not ( = ?auto_191604 ?auto_191610 ) ) ( not ( = ?auto_191605 ?auto_191610 ) ) ( not ( = ?auto_191606 ?auto_191610 ) ) ( not ( = ?auto_191607 ?auto_191610 ) ) ( not ( = ?auto_191608 ?auto_191610 ) ) ( not ( = ?auto_191609 ?auto_191610 ) ) ( not ( = ?auto_191611 ?auto_191610 ) ) ( ON ?auto_191604 ?auto_191603 ) ( ON-TABLE ?auto_191610 ) ( ON ?auto_191605 ?auto_191604 ) ( ON ?auto_191606 ?auto_191605 ) ( ON ?auto_191607 ?auto_191606 ) ( ON ?auto_191608 ?auto_191607 ) ( ON ?auto_191609 ?auto_191608 ) ( CLEAR ?auto_191609 ) ( HOLDING ?auto_191611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191611 )
      ( MAKE-7PILE ?auto_191603 ?auto_191604 ?auto_191605 ?auto_191606 ?auto_191607 ?auto_191608 ?auto_191609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191612 - BLOCK
      ?auto_191613 - BLOCK
      ?auto_191614 - BLOCK
      ?auto_191615 - BLOCK
      ?auto_191616 - BLOCK
      ?auto_191617 - BLOCK
      ?auto_191618 - BLOCK
    )
    :vars
    (
      ?auto_191620 - BLOCK
      ?auto_191619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191612 ?auto_191613 ) ) ( not ( = ?auto_191612 ?auto_191614 ) ) ( not ( = ?auto_191612 ?auto_191615 ) ) ( not ( = ?auto_191612 ?auto_191616 ) ) ( not ( = ?auto_191612 ?auto_191617 ) ) ( not ( = ?auto_191612 ?auto_191618 ) ) ( not ( = ?auto_191613 ?auto_191614 ) ) ( not ( = ?auto_191613 ?auto_191615 ) ) ( not ( = ?auto_191613 ?auto_191616 ) ) ( not ( = ?auto_191613 ?auto_191617 ) ) ( not ( = ?auto_191613 ?auto_191618 ) ) ( not ( = ?auto_191614 ?auto_191615 ) ) ( not ( = ?auto_191614 ?auto_191616 ) ) ( not ( = ?auto_191614 ?auto_191617 ) ) ( not ( = ?auto_191614 ?auto_191618 ) ) ( not ( = ?auto_191615 ?auto_191616 ) ) ( not ( = ?auto_191615 ?auto_191617 ) ) ( not ( = ?auto_191615 ?auto_191618 ) ) ( not ( = ?auto_191616 ?auto_191617 ) ) ( not ( = ?auto_191616 ?auto_191618 ) ) ( not ( = ?auto_191617 ?auto_191618 ) ) ( not ( = ?auto_191612 ?auto_191620 ) ) ( not ( = ?auto_191613 ?auto_191620 ) ) ( not ( = ?auto_191614 ?auto_191620 ) ) ( not ( = ?auto_191615 ?auto_191620 ) ) ( not ( = ?auto_191616 ?auto_191620 ) ) ( not ( = ?auto_191617 ?auto_191620 ) ) ( not ( = ?auto_191618 ?auto_191620 ) ) ( ON ?auto_191612 ?auto_191619 ) ( not ( = ?auto_191612 ?auto_191619 ) ) ( not ( = ?auto_191613 ?auto_191619 ) ) ( not ( = ?auto_191614 ?auto_191619 ) ) ( not ( = ?auto_191615 ?auto_191619 ) ) ( not ( = ?auto_191616 ?auto_191619 ) ) ( not ( = ?auto_191617 ?auto_191619 ) ) ( not ( = ?auto_191618 ?auto_191619 ) ) ( not ( = ?auto_191620 ?auto_191619 ) ) ( ON ?auto_191613 ?auto_191612 ) ( ON-TABLE ?auto_191619 ) ( ON ?auto_191614 ?auto_191613 ) ( ON ?auto_191615 ?auto_191614 ) ( ON ?auto_191616 ?auto_191615 ) ( ON ?auto_191617 ?auto_191616 ) ( ON ?auto_191618 ?auto_191617 ) ( ON ?auto_191620 ?auto_191618 ) ( CLEAR ?auto_191620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191619 ?auto_191612 ?auto_191613 ?auto_191614 ?auto_191615 ?auto_191616 ?auto_191617 ?auto_191618 )
      ( MAKE-7PILE ?auto_191612 ?auto_191613 ?auto_191614 ?auto_191615 ?auto_191616 ?auto_191617 ?auto_191618 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191637 - BLOCK
      ?auto_191638 - BLOCK
      ?auto_191639 - BLOCK
      ?auto_191640 - BLOCK
      ?auto_191641 - BLOCK
      ?auto_191642 - BLOCK
      ?auto_191643 - BLOCK
      ?auto_191644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191643 ) ( ON-TABLE ?auto_191637 ) ( ON ?auto_191638 ?auto_191637 ) ( ON ?auto_191639 ?auto_191638 ) ( ON ?auto_191640 ?auto_191639 ) ( ON ?auto_191641 ?auto_191640 ) ( ON ?auto_191642 ?auto_191641 ) ( ON ?auto_191643 ?auto_191642 ) ( not ( = ?auto_191637 ?auto_191638 ) ) ( not ( = ?auto_191637 ?auto_191639 ) ) ( not ( = ?auto_191637 ?auto_191640 ) ) ( not ( = ?auto_191637 ?auto_191641 ) ) ( not ( = ?auto_191637 ?auto_191642 ) ) ( not ( = ?auto_191637 ?auto_191643 ) ) ( not ( = ?auto_191637 ?auto_191644 ) ) ( not ( = ?auto_191638 ?auto_191639 ) ) ( not ( = ?auto_191638 ?auto_191640 ) ) ( not ( = ?auto_191638 ?auto_191641 ) ) ( not ( = ?auto_191638 ?auto_191642 ) ) ( not ( = ?auto_191638 ?auto_191643 ) ) ( not ( = ?auto_191638 ?auto_191644 ) ) ( not ( = ?auto_191639 ?auto_191640 ) ) ( not ( = ?auto_191639 ?auto_191641 ) ) ( not ( = ?auto_191639 ?auto_191642 ) ) ( not ( = ?auto_191639 ?auto_191643 ) ) ( not ( = ?auto_191639 ?auto_191644 ) ) ( not ( = ?auto_191640 ?auto_191641 ) ) ( not ( = ?auto_191640 ?auto_191642 ) ) ( not ( = ?auto_191640 ?auto_191643 ) ) ( not ( = ?auto_191640 ?auto_191644 ) ) ( not ( = ?auto_191641 ?auto_191642 ) ) ( not ( = ?auto_191641 ?auto_191643 ) ) ( not ( = ?auto_191641 ?auto_191644 ) ) ( not ( = ?auto_191642 ?auto_191643 ) ) ( not ( = ?auto_191642 ?auto_191644 ) ) ( not ( = ?auto_191643 ?auto_191644 ) ) ( ON-TABLE ?auto_191644 ) ( CLEAR ?auto_191644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_191644 )
      ( MAKE-8PILE ?auto_191637 ?auto_191638 ?auto_191639 ?auto_191640 ?auto_191641 ?auto_191642 ?auto_191643 ?auto_191644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191645 - BLOCK
      ?auto_191646 - BLOCK
      ?auto_191647 - BLOCK
      ?auto_191648 - BLOCK
      ?auto_191649 - BLOCK
      ?auto_191650 - BLOCK
      ?auto_191651 - BLOCK
      ?auto_191652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191645 ) ( ON ?auto_191646 ?auto_191645 ) ( ON ?auto_191647 ?auto_191646 ) ( ON ?auto_191648 ?auto_191647 ) ( ON ?auto_191649 ?auto_191648 ) ( ON ?auto_191650 ?auto_191649 ) ( not ( = ?auto_191645 ?auto_191646 ) ) ( not ( = ?auto_191645 ?auto_191647 ) ) ( not ( = ?auto_191645 ?auto_191648 ) ) ( not ( = ?auto_191645 ?auto_191649 ) ) ( not ( = ?auto_191645 ?auto_191650 ) ) ( not ( = ?auto_191645 ?auto_191651 ) ) ( not ( = ?auto_191645 ?auto_191652 ) ) ( not ( = ?auto_191646 ?auto_191647 ) ) ( not ( = ?auto_191646 ?auto_191648 ) ) ( not ( = ?auto_191646 ?auto_191649 ) ) ( not ( = ?auto_191646 ?auto_191650 ) ) ( not ( = ?auto_191646 ?auto_191651 ) ) ( not ( = ?auto_191646 ?auto_191652 ) ) ( not ( = ?auto_191647 ?auto_191648 ) ) ( not ( = ?auto_191647 ?auto_191649 ) ) ( not ( = ?auto_191647 ?auto_191650 ) ) ( not ( = ?auto_191647 ?auto_191651 ) ) ( not ( = ?auto_191647 ?auto_191652 ) ) ( not ( = ?auto_191648 ?auto_191649 ) ) ( not ( = ?auto_191648 ?auto_191650 ) ) ( not ( = ?auto_191648 ?auto_191651 ) ) ( not ( = ?auto_191648 ?auto_191652 ) ) ( not ( = ?auto_191649 ?auto_191650 ) ) ( not ( = ?auto_191649 ?auto_191651 ) ) ( not ( = ?auto_191649 ?auto_191652 ) ) ( not ( = ?auto_191650 ?auto_191651 ) ) ( not ( = ?auto_191650 ?auto_191652 ) ) ( not ( = ?auto_191651 ?auto_191652 ) ) ( ON-TABLE ?auto_191652 ) ( CLEAR ?auto_191652 ) ( HOLDING ?auto_191651 ) ( CLEAR ?auto_191650 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191645 ?auto_191646 ?auto_191647 ?auto_191648 ?auto_191649 ?auto_191650 ?auto_191651 )
      ( MAKE-8PILE ?auto_191645 ?auto_191646 ?auto_191647 ?auto_191648 ?auto_191649 ?auto_191650 ?auto_191651 ?auto_191652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191653 - BLOCK
      ?auto_191654 - BLOCK
      ?auto_191655 - BLOCK
      ?auto_191656 - BLOCK
      ?auto_191657 - BLOCK
      ?auto_191658 - BLOCK
      ?auto_191659 - BLOCK
      ?auto_191660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191653 ) ( ON ?auto_191654 ?auto_191653 ) ( ON ?auto_191655 ?auto_191654 ) ( ON ?auto_191656 ?auto_191655 ) ( ON ?auto_191657 ?auto_191656 ) ( ON ?auto_191658 ?auto_191657 ) ( not ( = ?auto_191653 ?auto_191654 ) ) ( not ( = ?auto_191653 ?auto_191655 ) ) ( not ( = ?auto_191653 ?auto_191656 ) ) ( not ( = ?auto_191653 ?auto_191657 ) ) ( not ( = ?auto_191653 ?auto_191658 ) ) ( not ( = ?auto_191653 ?auto_191659 ) ) ( not ( = ?auto_191653 ?auto_191660 ) ) ( not ( = ?auto_191654 ?auto_191655 ) ) ( not ( = ?auto_191654 ?auto_191656 ) ) ( not ( = ?auto_191654 ?auto_191657 ) ) ( not ( = ?auto_191654 ?auto_191658 ) ) ( not ( = ?auto_191654 ?auto_191659 ) ) ( not ( = ?auto_191654 ?auto_191660 ) ) ( not ( = ?auto_191655 ?auto_191656 ) ) ( not ( = ?auto_191655 ?auto_191657 ) ) ( not ( = ?auto_191655 ?auto_191658 ) ) ( not ( = ?auto_191655 ?auto_191659 ) ) ( not ( = ?auto_191655 ?auto_191660 ) ) ( not ( = ?auto_191656 ?auto_191657 ) ) ( not ( = ?auto_191656 ?auto_191658 ) ) ( not ( = ?auto_191656 ?auto_191659 ) ) ( not ( = ?auto_191656 ?auto_191660 ) ) ( not ( = ?auto_191657 ?auto_191658 ) ) ( not ( = ?auto_191657 ?auto_191659 ) ) ( not ( = ?auto_191657 ?auto_191660 ) ) ( not ( = ?auto_191658 ?auto_191659 ) ) ( not ( = ?auto_191658 ?auto_191660 ) ) ( not ( = ?auto_191659 ?auto_191660 ) ) ( ON-TABLE ?auto_191660 ) ( CLEAR ?auto_191658 ) ( ON ?auto_191659 ?auto_191660 ) ( CLEAR ?auto_191659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191660 )
      ( MAKE-8PILE ?auto_191653 ?auto_191654 ?auto_191655 ?auto_191656 ?auto_191657 ?auto_191658 ?auto_191659 ?auto_191660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191661 - BLOCK
      ?auto_191662 - BLOCK
      ?auto_191663 - BLOCK
      ?auto_191664 - BLOCK
      ?auto_191665 - BLOCK
      ?auto_191666 - BLOCK
      ?auto_191667 - BLOCK
      ?auto_191668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191661 ) ( ON ?auto_191662 ?auto_191661 ) ( ON ?auto_191663 ?auto_191662 ) ( ON ?auto_191664 ?auto_191663 ) ( ON ?auto_191665 ?auto_191664 ) ( not ( = ?auto_191661 ?auto_191662 ) ) ( not ( = ?auto_191661 ?auto_191663 ) ) ( not ( = ?auto_191661 ?auto_191664 ) ) ( not ( = ?auto_191661 ?auto_191665 ) ) ( not ( = ?auto_191661 ?auto_191666 ) ) ( not ( = ?auto_191661 ?auto_191667 ) ) ( not ( = ?auto_191661 ?auto_191668 ) ) ( not ( = ?auto_191662 ?auto_191663 ) ) ( not ( = ?auto_191662 ?auto_191664 ) ) ( not ( = ?auto_191662 ?auto_191665 ) ) ( not ( = ?auto_191662 ?auto_191666 ) ) ( not ( = ?auto_191662 ?auto_191667 ) ) ( not ( = ?auto_191662 ?auto_191668 ) ) ( not ( = ?auto_191663 ?auto_191664 ) ) ( not ( = ?auto_191663 ?auto_191665 ) ) ( not ( = ?auto_191663 ?auto_191666 ) ) ( not ( = ?auto_191663 ?auto_191667 ) ) ( not ( = ?auto_191663 ?auto_191668 ) ) ( not ( = ?auto_191664 ?auto_191665 ) ) ( not ( = ?auto_191664 ?auto_191666 ) ) ( not ( = ?auto_191664 ?auto_191667 ) ) ( not ( = ?auto_191664 ?auto_191668 ) ) ( not ( = ?auto_191665 ?auto_191666 ) ) ( not ( = ?auto_191665 ?auto_191667 ) ) ( not ( = ?auto_191665 ?auto_191668 ) ) ( not ( = ?auto_191666 ?auto_191667 ) ) ( not ( = ?auto_191666 ?auto_191668 ) ) ( not ( = ?auto_191667 ?auto_191668 ) ) ( ON-TABLE ?auto_191668 ) ( ON ?auto_191667 ?auto_191668 ) ( CLEAR ?auto_191667 ) ( HOLDING ?auto_191666 ) ( CLEAR ?auto_191665 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191661 ?auto_191662 ?auto_191663 ?auto_191664 ?auto_191665 ?auto_191666 )
      ( MAKE-8PILE ?auto_191661 ?auto_191662 ?auto_191663 ?auto_191664 ?auto_191665 ?auto_191666 ?auto_191667 ?auto_191668 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191669 - BLOCK
      ?auto_191670 - BLOCK
      ?auto_191671 - BLOCK
      ?auto_191672 - BLOCK
      ?auto_191673 - BLOCK
      ?auto_191674 - BLOCK
      ?auto_191675 - BLOCK
      ?auto_191676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191669 ) ( ON ?auto_191670 ?auto_191669 ) ( ON ?auto_191671 ?auto_191670 ) ( ON ?auto_191672 ?auto_191671 ) ( ON ?auto_191673 ?auto_191672 ) ( not ( = ?auto_191669 ?auto_191670 ) ) ( not ( = ?auto_191669 ?auto_191671 ) ) ( not ( = ?auto_191669 ?auto_191672 ) ) ( not ( = ?auto_191669 ?auto_191673 ) ) ( not ( = ?auto_191669 ?auto_191674 ) ) ( not ( = ?auto_191669 ?auto_191675 ) ) ( not ( = ?auto_191669 ?auto_191676 ) ) ( not ( = ?auto_191670 ?auto_191671 ) ) ( not ( = ?auto_191670 ?auto_191672 ) ) ( not ( = ?auto_191670 ?auto_191673 ) ) ( not ( = ?auto_191670 ?auto_191674 ) ) ( not ( = ?auto_191670 ?auto_191675 ) ) ( not ( = ?auto_191670 ?auto_191676 ) ) ( not ( = ?auto_191671 ?auto_191672 ) ) ( not ( = ?auto_191671 ?auto_191673 ) ) ( not ( = ?auto_191671 ?auto_191674 ) ) ( not ( = ?auto_191671 ?auto_191675 ) ) ( not ( = ?auto_191671 ?auto_191676 ) ) ( not ( = ?auto_191672 ?auto_191673 ) ) ( not ( = ?auto_191672 ?auto_191674 ) ) ( not ( = ?auto_191672 ?auto_191675 ) ) ( not ( = ?auto_191672 ?auto_191676 ) ) ( not ( = ?auto_191673 ?auto_191674 ) ) ( not ( = ?auto_191673 ?auto_191675 ) ) ( not ( = ?auto_191673 ?auto_191676 ) ) ( not ( = ?auto_191674 ?auto_191675 ) ) ( not ( = ?auto_191674 ?auto_191676 ) ) ( not ( = ?auto_191675 ?auto_191676 ) ) ( ON-TABLE ?auto_191676 ) ( ON ?auto_191675 ?auto_191676 ) ( CLEAR ?auto_191673 ) ( ON ?auto_191674 ?auto_191675 ) ( CLEAR ?auto_191674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191676 ?auto_191675 )
      ( MAKE-8PILE ?auto_191669 ?auto_191670 ?auto_191671 ?auto_191672 ?auto_191673 ?auto_191674 ?auto_191675 ?auto_191676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191677 - BLOCK
      ?auto_191678 - BLOCK
      ?auto_191679 - BLOCK
      ?auto_191680 - BLOCK
      ?auto_191681 - BLOCK
      ?auto_191682 - BLOCK
      ?auto_191683 - BLOCK
      ?auto_191684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191677 ) ( ON ?auto_191678 ?auto_191677 ) ( ON ?auto_191679 ?auto_191678 ) ( ON ?auto_191680 ?auto_191679 ) ( not ( = ?auto_191677 ?auto_191678 ) ) ( not ( = ?auto_191677 ?auto_191679 ) ) ( not ( = ?auto_191677 ?auto_191680 ) ) ( not ( = ?auto_191677 ?auto_191681 ) ) ( not ( = ?auto_191677 ?auto_191682 ) ) ( not ( = ?auto_191677 ?auto_191683 ) ) ( not ( = ?auto_191677 ?auto_191684 ) ) ( not ( = ?auto_191678 ?auto_191679 ) ) ( not ( = ?auto_191678 ?auto_191680 ) ) ( not ( = ?auto_191678 ?auto_191681 ) ) ( not ( = ?auto_191678 ?auto_191682 ) ) ( not ( = ?auto_191678 ?auto_191683 ) ) ( not ( = ?auto_191678 ?auto_191684 ) ) ( not ( = ?auto_191679 ?auto_191680 ) ) ( not ( = ?auto_191679 ?auto_191681 ) ) ( not ( = ?auto_191679 ?auto_191682 ) ) ( not ( = ?auto_191679 ?auto_191683 ) ) ( not ( = ?auto_191679 ?auto_191684 ) ) ( not ( = ?auto_191680 ?auto_191681 ) ) ( not ( = ?auto_191680 ?auto_191682 ) ) ( not ( = ?auto_191680 ?auto_191683 ) ) ( not ( = ?auto_191680 ?auto_191684 ) ) ( not ( = ?auto_191681 ?auto_191682 ) ) ( not ( = ?auto_191681 ?auto_191683 ) ) ( not ( = ?auto_191681 ?auto_191684 ) ) ( not ( = ?auto_191682 ?auto_191683 ) ) ( not ( = ?auto_191682 ?auto_191684 ) ) ( not ( = ?auto_191683 ?auto_191684 ) ) ( ON-TABLE ?auto_191684 ) ( ON ?auto_191683 ?auto_191684 ) ( ON ?auto_191682 ?auto_191683 ) ( CLEAR ?auto_191682 ) ( HOLDING ?auto_191681 ) ( CLEAR ?auto_191680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191677 ?auto_191678 ?auto_191679 ?auto_191680 ?auto_191681 )
      ( MAKE-8PILE ?auto_191677 ?auto_191678 ?auto_191679 ?auto_191680 ?auto_191681 ?auto_191682 ?auto_191683 ?auto_191684 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191685 - BLOCK
      ?auto_191686 - BLOCK
      ?auto_191687 - BLOCK
      ?auto_191688 - BLOCK
      ?auto_191689 - BLOCK
      ?auto_191690 - BLOCK
      ?auto_191691 - BLOCK
      ?auto_191692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191685 ) ( ON ?auto_191686 ?auto_191685 ) ( ON ?auto_191687 ?auto_191686 ) ( ON ?auto_191688 ?auto_191687 ) ( not ( = ?auto_191685 ?auto_191686 ) ) ( not ( = ?auto_191685 ?auto_191687 ) ) ( not ( = ?auto_191685 ?auto_191688 ) ) ( not ( = ?auto_191685 ?auto_191689 ) ) ( not ( = ?auto_191685 ?auto_191690 ) ) ( not ( = ?auto_191685 ?auto_191691 ) ) ( not ( = ?auto_191685 ?auto_191692 ) ) ( not ( = ?auto_191686 ?auto_191687 ) ) ( not ( = ?auto_191686 ?auto_191688 ) ) ( not ( = ?auto_191686 ?auto_191689 ) ) ( not ( = ?auto_191686 ?auto_191690 ) ) ( not ( = ?auto_191686 ?auto_191691 ) ) ( not ( = ?auto_191686 ?auto_191692 ) ) ( not ( = ?auto_191687 ?auto_191688 ) ) ( not ( = ?auto_191687 ?auto_191689 ) ) ( not ( = ?auto_191687 ?auto_191690 ) ) ( not ( = ?auto_191687 ?auto_191691 ) ) ( not ( = ?auto_191687 ?auto_191692 ) ) ( not ( = ?auto_191688 ?auto_191689 ) ) ( not ( = ?auto_191688 ?auto_191690 ) ) ( not ( = ?auto_191688 ?auto_191691 ) ) ( not ( = ?auto_191688 ?auto_191692 ) ) ( not ( = ?auto_191689 ?auto_191690 ) ) ( not ( = ?auto_191689 ?auto_191691 ) ) ( not ( = ?auto_191689 ?auto_191692 ) ) ( not ( = ?auto_191690 ?auto_191691 ) ) ( not ( = ?auto_191690 ?auto_191692 ) ) ( not ( = ?auto_191691 ?auto_191692 ) ) ( ON-TABLE ?auto_191692 ) ( ON ?auto_191691 ?auto_191692 ) ( ON ?auto_191690 ?auto_191691 ) ( CLEAR ?auto_191688 ) ( ON ?auto_191689 ?auto_191690 ) ( CLEAR ?auto_191689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191692 ?auto_191691 ?auto_191690 )
      ( MAKE-8PILE ?auto_191685 ?auto_191686 ?auto_191687 ?auto_191688 ?auto_191689 ?auto_191690 ?auto_191691 ?auto_191692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191693 - BLOCK
      ?auto_191694 - BLOCK
      ?auto_191695 - BLOCK
      ?auto_191696 - BLOCK
      ?auto_191697 - BLOCK
      ?auto_191698 - BLOCK
      ?auto_191699 - BLOCK
      ?auto_191700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191693 ) ( ON ?auto_191694 ?auto_191693 ) ( ON ?auto_191695 ?auto_191694 ) ( not ( = ?auto_191693 ?auto_191694 ) ) ( not ( = ?auto_191693 ?auto_191695 ) ) ( not ( = ?auto_191693 ?auto_191696 ) ) ( not ( = ?auto_191693 ?auto_191697 ) ) ( not ( = ?auto_191693 ?auto_191698 ) ) ( not ( = ?auto_191693 ?auto_191699 ) ) ( not ( = ?auto_191693 ?auto_191700 ) ) ( not ( = ?auto_191694 ?auto_191695 ) ) ( not ( = ?auto_191694 ?auto_191696 ) ) ( not ( = ?auto_191694 ?auto_191697 ) ) ( not ( = ?auto_191694 ?auto_191698 ) ) ( not ( = ?auto_191694 ?auto_191699 ) ) ( not ( = ?auto_191694 ?auto_191700 ) ) ( not ( = ?auto_191695 ?auto_191696 ) ) ( not ( = ?auto_191695 ?auto_191697 ) ) ( not ( = ?auto_191695 ?auto_191698 ) ) ( not ( = ?auto_191695 ?auto_191699 ) ) ( not ( = ?auto_191695 ?auto_191700 ) ) ( not ( = ?auto_191696 ?auto_191697 ) ) ( not ( = ?auto_191696 ?auto_191698 ) ) ( not ( = ?auto_191696 ?auto_191699 ) ) ( not ( = ?auto_191696 ?auto_191700 ) ) ( not ( = ?auto_191697 ?auto_191698 ) ) ( not ( = ?auto_191697 ?auto_191699 ) ) ( not ( = ?auto_191697 ?auto_191700 ) ) ( not ( = ?auto_191698 ?auto_191699 ) ) ( not ( = ?auto_191698 ?auto_191700 ) ) ( not ( = ?auto_191699 ?auto_191700 ) ) ( ON-TABLE ?auto_191700 ) ( ON ?auto_191699 ?auto_191700 ) ( ON ?auto_191698 ?auto_191699 ) ( ON ?auto_191697 ?auto_191698 ) ( CLEAR ?auto_191697 ) ( HOLDING ?auto_191696 ) ( CLEAR ?auto_191695 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191693 ?auto_191694 ?auto_191695 ?auto_191696 )
      ( MAKE-8PILE ?auto_191693 ?auto_191694 ?auto_191695 ?auto_191696 ?auto_191697 ?auto_191698 ?auto_191699 ?auto_191700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191701 - BLOCK
      ?auto_191702 - BLOCK
      ?auto_191703 - BLOCK
      ?auto_191704 - BLOCK
      ?auto_191705 - BLOCK
      ?auto_191706 - BLOCK
      ?auto_191707 - BLOCK
      ?auto_191708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191701 ) ( ON ?auto_191702 ?auto_191701 ) ( ON ?auto_191703 ?auto_191702 ) ( not ( = ?auto_191701 ?auto_191702 ) ) ( not ( = ?auto_191701 ?auto_191703 ) ) ( not ( = ?auto_191701 ?auto_191704 ) ) ( not ( = ?auto_191701 ?auto_191705 ) ) ( not ( = ?auto_191701 ?auto_191706 ) ) ( not ( = ?auto_191701 ?auto_191707 ) ) ( not ( = ?auto_191701 ?auto_191708 ) ) ( not ( = ?auto_191702 ?auto_191703 ) ) ( not ( = ?auto_191702 ?auto_191704 ) ) ( not ( = ?auto_191702 ?auto_191705 ) ) ( not ( = ?auto_191702 ?auto_191706 ) ) ( not ( = ?auto_191702 ?auto_191707 ) ) ( not ( = ?auto_191702 ?auto_191708 ) ) ( not ( = ?auto_191703 ?auto_191704 ) ) ( not ( = ?auto_191703 ?auto_191705 ) ) ( not ( = ?auto_191703 ?auto_191706 ) ) ( not ( = ?auto_191703 ?auto_191707 ) ) ( not ( = ?auto_191703 ?auto_191708 ) ) ( not ( = ?auto_191704 ?auto_191705 ) ) ( not ( = ?auto_191704 ?auto_191706 ) ) ( not ( = ?auto_191704 ?auto_191707 ) ) ( not ( = ?auto_191704 ?auto_191708 ) ) ( not ( = ?auto_191705 ?auto_191706 ) ) ( not ( = ?auto_191705 ?auto_191707 ) ) ( not ( = ?auto_191705 ?auto_191708 ) ) ( not ( = ?auto_191706 ?auto_191707 ) ) ( not ( = ?auto_191706 ?auto_191708 ) ) ( not ( = ?auto_191707 ?auto_191708 ) ) ( ON-TABLE ?auto_191708 ) ( ON ?auto_191707 ?auto_191708 ) ( ON ?auto_191706 ?auto_191707 ) ( ON ?auto_191705 ?auto_191706 ) ( CLEAR ?auto_191703 ) ( ON ?auto_191704 ?auto_191705 ) ( CLEAR ?auto_191704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191708 ?auto_191707 ?auto_191706 ?auto_191705 )
      ( MAKE-8PILE ?auto_191701 ?auto_191702 ?auto_191703 ?auto_191704 ?auto_191705 ?auto_191706 ?auto_191707 ?auto_191708 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191709 - BLOCK
      ?auto_191710 - BLOCK
      ?auto_191711 - BLOCK
      ?auto_191712 - BLOCK
      ?auto_191713 - BLOCK
      ?auto_191714 - BLOCK
      ?auto_191715 - BLOCK
      ?auto_191716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191709 ) ( ON ?auto_191710 ?auto_191709 ) ( not ( = ?auto_191709 ?auto_191710 ) ) ( not ( = ?auto_191709 ?auto_191711 ) ) ( not ( = ?auto_191709 ?auto_191712 ) ) ( not ( = ?auto_191709 ?auto_191713 ) ) ( not ( = ?auto_191709 ?auto_191714 ) ) ( not ( = ?auto_191709 ?auto_191715 ) ) ( not ( = ?auto_191709 ?auto_191716 ) ) ( not ( = ?auto_191710 ?auto_191711 ) ) ( not ( = ?auto_191710 ?auto_191712 ) ) ( not ( = ?auto_191710 ?auto_191713 ) ) ( not ( = ?auto_191710 ?auto_191714 ) ) ( not ( = ?auto_191710 ?auto_191715 ) ) ( not ( = ?auto_191710 ?auto_191716 ) ) ( not ( = ?auto_191711 ?auto_191712 ) ) ( not ( = ?auto_191711 ?auto_191713 ) ) ( not ( = ?auto_191711 ?auto_191714 ) ) ( not ( = ?auto_191711 ?auto_191715 ) ) ( not ( = ?auto_191711 ?auto_191716 ) ) ( not ( = ?auto_191712 ?auto_191713 ) ) ( not ( = ?auto_191712 ?auto_191714 ) ) ( not ( = ?auto_191712 ?auto_191715 ) ) ( not ( = ?auto_191712 ?auto_191716 ) ) ( not ( = ?auto_191713 ?auto_191714 ) ) ( not ( = ?auto_191713 ?auto_191715 ) ) ( not ( = ?auto_191713 ?auto_191716 ) ) ( not ( = ?auto_191714 ?auto_191715 ) ) ( not ( = ?auto_191714 ?auto_191716 ) ) ( not ( = ?auto_191715 ?auto_191716 ) ) ( ON-TABLE ?auto_191716 ) ( ON ?auto_191715 ?auto_191716 ) ( ON ?auto_191714 ?auto_191715 ) ( ON ?auto_191713 ?auto_191714 ) ( ON ?auto_191712 ?auto_191713 ) ( CLEAR ?auto_191712 ) ( HOLDING ?auto_191711 ) ( CLEAR ?auto_191710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191709 ?auto_191710 ?auto_191711 )
      ( MAKE-8PILE ?auto_191709 ?auto_191710 ?auto_191711 ?auto_191712 ?auto_191713 ?auto_191714 ?auto_191715 ?auto_191716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191717 - BLOCK
      ?auto_191718 - BLOCK
      ?auto_191719 - BLOCK
      ?auto_191720 - BLOCK
      ?auto_191721 - BLOCK
      ?auto_191722 - BLOCK
      ?auto_191723 - BLOCK
      ?auto_191724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191717 ) ( ON ?auto_191718 ?auto_191717 ) ( not ( = ?auto_191717 ?auto_191718 ) ) ( not ( = ?auto_191717 ?auto_191719 ) ) ( not ( = ?auto_191717 ?auto_191720 ) ) ( not ( = ?auto_191717 ?auto_191721 ) ) ( not ( = ?auto_191717 ?auto_191722 ) ) ( not ( = ?auto_191717 ?auto_191723 ) ) ( not ( = ?auto_191717 ?auto_191724 ) ) ( not ( = ?auto_191718 ?auto_191719 ) ) ( not ( = ?auto_191718 ?auto_191720 ) ) ( not ( = ?auto_191718 ?auto_191721 ) ) ( not ( = ?auto_191718 ?auto_191722 ) ) ( not ( = ?auto_191718 ?auto_191723 ) ) ( not ( = ?auto_191718 ?auto_191724 ) ) ( not ( = ?auto_191719 ?auto_191720 ) ) ( not ( = ?auto_191719 ?auto_191721 ) ) ( not ( = ?auto_191719 ?auto_191722 ) ) ( not ( = ?auto_191719 ?auto_191723 ) ) ( not ( = ?auto_191719 ?auto_191724 ) ) ( not ( = ?auto_191720 ?auto_191721 ) ) ( not ( = ?auto_191720 ?auto_191722 ) ) ( not ( = ?auto_191720 ?auto_191723 ) ) ( not ( = ?auto_191720 ?auto_191724 ) ) ( not ( = ?auto_191721 ?auto_191722 ) ) ( not ( = ?auto_191721 ?auto_191723 ) ) ( not ( = ?auto_191721 ?auto_191724 ) ) ( not ( = ?auto_191722 ?auto_191723 ) ) ( not ( = ?auto_191722 ?auto_191724 ) ) ( not ( = ?auto_191723 ?auto_191724 ) ) ( ON-TABLE ?auto_191724 ) ( ON ?auto_191723 ?auto_191724 ) ( ON ?auto_191722 ?auto_191723 ) ( ON ?auto_191721 ?auto_191722 ) ( ON ?auto_191720 ?auto_191721 ) ( CLEAR ?auto_191718 ) ( ON ?auto_191719 ?auto_191720 ) ( CLEAR ?auto_191719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191724 ?auto_191723 ?auto_191722 ?auto_191721 ?auto_191720 )
      ( MAKE-8PILE ?auto_191717 ?auto_191718 ?auto_191719 ?auto_191720 ?auto_191721 ?auto_191722 ?auto_191723 ?auto_191724 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191725 - BLOCK
      ?auto_191726 - BLOCK
      ?auto_191727 - BLOCK
      ?auto_191728 - BLOCK
      ?auto_191729 - BLOCK
      ?auto_191730 - BLOCK
      ?auto_191731 - BLOCK
      ?auto_191732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191725 ) ( not ( = ?auto_191725 ?auto_191726 ) ) ( not ( = ?auto_191725 ?auto_191727 ) ) ( not ( = ?auto_191725 ?auto_191728 ) ) ( not ( = ?auto_191725 ?auto_191729 ) ) ( not ( = ?auto_191725 ?auto_191730 ) ) ( not ( = ?auto_191725 ?auto_191731 ) ) ( not ( = ?auto_191725 ?auto_191732 ) ) ( not ( = ?auto_191726 ?auto_191727 ) ) ( not ( = ?auto_191726 ?auto_191728 ) ) ( not ( = ?auto_191726 ?auto_191729 ) ) ( not ( = ?auto_191726 ?auto_191730 ) ) ( not ( = ?auto_191726 ?auto_191731 ) ) ( not ( = ?auto_191726 ?auto_191732 ) ) ( not ( = ?auto_191727 ?auto_191728 ) ) ( not ( = ?auto_191727 ?auto_191729 ) ) ( not ( = ?auto_191727 ?auto_191730 ) ) ( not ( = ?auto_191727 ?auto_191731 ) ) ( not ( = ?auto_191727 ?auto_191732 ) ) ( not ( = ?auto_191728 ?auto_191729 ) ) ( not ( = ?auto_191728 ?auto_191730 ) ) ( not ( = ?auto_191728 ?auto_191731 ) ) ( not ( = ?auto_191728 ?auto_191732 ) ) ( not ( = ?auto_191729 ?auto_191730 ) ) ( not ( = ?auto_191729 ?auto_191731 ) ) ( not ( = ?auto_191729 ?auto_191732 ) ) ( not ( = ?auto_191730 ?auto_191731 ) ) ( not ( = ?auto_191730 ?auto_191732 ) ) ( not ( = ?auto_191731 ?auto_191732 ) ) ( ON-TABLE ?auto_191732 ) ( ON ?auto_191731 ?auto_191732 ) ( ON ?auto_191730 ?auto_191731 ) ( ON ?auto_191729 ?auto_191730 ) ( ON ?auto_191728 ?auto_191729 ) ( ON ?auto_191727 ?auto_191728 ) ( CLEAR ?auto_191727 ) ( HOLDING ?auto_191726 ) ( CLEAR ?auto_191725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191725 ?auto_191726 )
      ( MAKE-8PILE ?auto_191725 ?auto_191726 ?auto_191727 ?auto_191728 ?auto_191729 ?auto_191730 ?auto_191731 ?auto_191732 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191733 - BLOCK
      ?auto_191734 - BLOCK
      ?auto_191735 - BLOCK
      ?auto_191736 - BLOCK
      ?auto_191737 - BLOCK
      ?auto_191738 - BLOCK
      ?auto_191739 - BLOCK
      ?auto_191740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191733 ) ( not ( = ?auto_191733 ?auto_191734 ) ) ( not ( = ?auto_191733 ?auto_191735 ) ) ( not ( = ?auto_191733 ?auto_191736 ) ) ( not ( = ?auto_191733 ?auto_191737 ) ) ( not ( = ?auto_191733 ?auto_191738 ) ) ( not ( = ?auto_191733 ?auto_191739 ) ) ( not ( = ?auto_191733 ?auto_191740 ) ) ( not ( = ?auto_191734 ?auto_191735 ) ) ( not ( = ?auto_191734 ?auto_191736 ) ) ( not ( = ?auto_191734 ?auto_191737 ) ) ( not ( = ?auto_191734 ?auto_191738 ) ) ( not ( = ?auto_191734 ?auto_191739 ) ) ( not ( = ?auto_191734 ?auto_191740 ) ) ( not ( = ?auto_191735 ?auto_191736 ) ) ( not ( = ?auto_191735 ?auto_191737 ) ) ( not ( = ?auto_191735 ?auto_191738 ) ) ( not ( = ?auto_191735 ?auto_191739 ) ) ( not ( = ?auto_191735 ?auto_191740 ) ) ( not ( = ?auto_191736 ?auto_191737 ) ) ( not ( = ?auto_191736 ?auto_191738 ) ) ( not ( = ?auto_191736 ?auto_191739 ) ) ( not ( = ?auto_191736 ?auto_191740 ) ) ( not ( = ?auto_191737 ?auto_191738 ) ) ( not ( = ?auto_191737 ?auto_191739 ) ) ( not ( = ?auto_191737 ?auto_191740 ) ) ( not ( = ?auto_191738 ?auto_191739 ) ) ( not ( = ?auto_191738 ?auto_191740 ) ) ( not ( = ?auto_191739 ?auto_191740 ) ) ( ON-TABLE ?auto_191740 ) ( ON ?auto_191739 ?auto_191740 ) ( ON ?auto_191738 ?auto_191739 ) ( ON ?auto_191737 ?auto_191738 ) ( ON ?auto_191736 ?auto_191737 ) ( ON ?auto_191735 ?auto_191736 ) ( CLEAR ?auto_191733 ) ( ON ?auto_191734 ?auto_191735 ) ( CLEAR ?auto_191734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191740 ?auto_191739 ?auto_191738 ?auto_191737 ?auto_191736 ?auto_191735 )
      ( MAKE-8PILE ?auto_191733 ?auto_191734 ?auto_191735 ?auto_191736 ?auto_191737 ?auto_191738 ?auto_191739 ?auto_191740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191741 - BLOCK
      ?auto_191742 - BLOCK
      ?auto_191743 - BLOCK
      ?auto_191744 - BLOCK
      ?auto_191745 - BLOCK
      ?auto_191746 - BLOCK
      ?auto_191747 - BLOCK
      ?auto_191748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191741 ?auto_191742 ) ) ( not ( = ?auto_191741 ?auto_191743 ) ) ( not ( = ?auto_191741 ?auto_191744 ) ) ( not ( = ?auto_191741 ?auto_191745 ) ) ( not ( = ?auto_191741 ?auto_191746 ) ) ( not ( = ?auto_191741 ?auto_191747 ) ) ( not ( = ?auto_191741 ?auto_191748 ) ) ( not ( = ?auto_191742 ?auto_191743 ) ) ( not ( = ?auto_191742 ?auto_191744 ) ) ( not ( = ?auto_191742 ?auto_191745 ) ) ( not ( = ?auto_191742 ?auto_191746 ) ) ( not ( = ?auto_191742 ?auto_191747 ) ) ( not ( = ?auto_191742 ?auto_191748 ) ) ( not ( = ?auto_191743 ?auto_191744 ) ) ( not ( = ?auto_191743 ?auto_191745 ) ) ( not ( = ?auto_191743 ?auto_191746 ) ) ( not ( = ?auto_191743 ?auto_191747 ) ) ( not ( = ?auto_191743 ?auto_191748 ) ) ( not ( = ?auto_191744 ?auto_191745 ) ) ( not ( = ?auto_191744 ?auto_191746 ) ) ( not ( = ?auto_191744 ?auto_191747 ) ) ( not ( = ?auto_191744 ?auto_191748 ) ) ( not ( = ?auto_191745 ?auto_191746 ) ) ( not ( = ?auto_191745 ?auto_191747 ) ) ( not ( = ?auto_191745 ?auto_191748 ) ) ( not ( = ?auto_191746 ?auto_191747 ) ) ( not ( = ?auto_191746 ?auto_191748 ) ) ( not ( = ?auto_191747 ?auto_191748 ) ) ( ON-TABLE ?auto_191748 ) ( ON ?auto_191747 ?auto_191748 ) ( ON ?auto_191746 ?auto_191747 ) ( ON ?auto_191745 ?auto_191746 ) ( ON ?auto_191744 ?auto_191745 ) ( ON ?auto_191743 ?auto_191744 ) ( ON ?auto_191742 ?auto_191743 ) ( CLEAR ?auto_191742 ) ( HOLDING ?auto_191741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191741 )
      ( MAKE-8PILE ?auto_191741 ?auto_191742 ?auto_191743 ?auto_191744 ?auto_191745 ?auto_191746 ?auto_191747 ?auto_191748 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191749 - BLOCK
      ?auto_191750 - BLOCK
      ?auto_191751 - BLOCK
      ?auto_191752 - BLOCK
      ?auto_191753 - BLOCK
      ?auto_191754 - BLOCK
      ?auto_191755 - BLOCK
      ?auto_191756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191749 ?auto_191750 ) ) ( not ( = ?auto_191749 ?auto_191751 ) ) ( not ( = ?auto_191749 ?auto_191752 ) ) ( not ( = ?auto_191749 ?auto_191753 ) ) ( not ( = ?auto_191749 ?auto_191754 ) ) ( not ( = ?auto_191749 ?auto_191755 ) ) ( not ( = ?auto_191749 ?auto_191756 ) ) ( not ( = ?auto_191750 ?auto_191751 ) ) ( not ( = ?auto_191750 ?auto_191752 ) ) ( not ( = ?auto_191750 ?auto_191753 ) ) ( not ( = ?auto_191750 ?auto_191754 ) ) ( not ( = ?auto_191750 ?auto_191755 ) ) ( not ( = ?auto_191750 ?auto_191756 ) ) ( not ( = ?auto_191751 ?auto_191752 ) ) ( not ( = ?auto_191751 ?auto_191753 ) ) ( not ( = ?auto_191751 ?auto_191754 ) ) ( not ( = ?auto_191751 ?auto_191755 ) ) ( not ( = ?auto_191751 ?auto_191756 ) ) ( not ( = ?auto_191752 ?auto_191753 ) ) ( not ( = ?auto_191752 ?auto_191754 ) ) ( not ( = ?auto_191752 ?auto_191755 ) ) ( not ( = ?auto_191752 ?auto_191756 ) ) ( not ( = ?auto_191753 ?auto_191754 ) ) ( not ( = ?auto_191753 ?auto_191755 ) ) ( not ( = ?auto_191753 ?auto_191756 ) ) ( not ( = ?auto_191754 ?auto_191755 ) ) ( not ( = ?auto_191754 ?auto_191756 ) ) ( not ( = ?auto_191755 ?auto_191756 ) ) ( ON-TABLE ?auto_191756 ) ( ON ?auto_191755 ?auto_191756 ) ( ON ?auto_191754 ?auto_191755 ) ( ON ?auto_191753 ?auto_191754 ) ( ON ?auto_191752 ?auto_191753 ) ( ON ?auto_191751 ?auto_191752 ) ( ON ?auto_191750 ?auto_191751 ) ( ON ?auto_191749 ?auto_191750 ) ( CLEAR ?auto_191749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191756 ?auto_191755 ?auto_191754 ?auto_191753 ?auto_191752 ?auto_191751 ?auto_191750 )
      ( MAKE-8PILE ?auto_191749 ?auto_191750 ?auto_191751 ?auto_191752 ?auto_191753 ?auto_191754 ?auto_191755 ?auto_191756 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191765 - BLOCK
      ?auto_191766 - BLOCK
      ?auto_191767 - BLOCK
      ?auto_191768 - BLOCK
      ?auto_191769 - BLOCK
      ?auto_191770 - BLOCK
      ?auto_191771 - BLOCK
      ?auto_191772 - BLOCK
    )
    :vars
    (
      ?auto_191773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191765 ?auto_191766 ) ) ( not ( = ?auto_191765 ?auto_191767 ) ) ( not ( = ?auto_191765 ?auto_191768 ) ) ( not ( = ?auto_191765 ?auto_191769 ) ) ( not ( = ?auto_191765 ?auto_191770 ) ) ( not ( = ?auto_191765 ?auto_191771 ) ) ( not ( = ?auto_191765 ?auto_191772 ) ) ( not ( = ?auto_191766 ?auto_191767 ) ) ( not ( = ?auto_191766 ?auto_191768 ) ) ( not ( = ?auto_191766 ?auto_191769 ) ) ( not ( = ?auto_191766 ?auto_191770 ) ) ( not ( = ?auto_191766 ?auto_191771 ) ) ( not ( = ?auto_191766 ?auto_191772 ) ) ( not ( = ?auto_191767 ?auto_191768 ) ) ( not ( = ?auto_191767 ?auto_191769 ) ) ( not ( = ?auto_191767 ?auto_191770 ) ) ( not ( = ?auto_191767 ?auto_191771 ) ) ( not ( = ?auto_191767 ?auto_191772 ) ) ( not ( = ?auto_191768 ?auto_191769 ) ) ( not ( = ?auto_191768 ?auto_191770 ) ) ( not ( = ?auto_191768 ?auto_191771 ) ) ( not ( = ?auto_191768 ?auto_191772 ) ) ( not ( = ?auto_191769 ?auto_191770 ) ) ( not ( = ?auto_191769 ?auto_191771 ) ) ( not ( = ?auto_191769 ?auto_191772 ) ) ( not ( = ?auto_191770 ?auto_191771 ) ) ( not ( = ?auto_191770 ?auto_191772 ) ) ( not ( = ?auto_191771 ?auto_191772 ) ) ( ON-TABLE ?auto_191772 ) ( ON ?auto_191771 ?auto_191772 ) ( ON ?auto_191770 ?auto_191771 ) ( ON ?auto_191769 ?auto_191770 ) ( ON ?auto_191768 ?auto_191769 ) ( ON ?auto_191767 ?auto_191768 ) ( ON ?auto_191766 ?auto_191767 ) ( CLEAR ?auto_191766 ) ( ON ?auto_191765 ?auto_191773 ) ( CLEAR ?auto_191765 ) ( HAND-EMPTY ) ( not ( = ?auto_191765 ?auto_191773 ) ) ( not ( = ?auto_191766 ?auto_191773 ) ) ( not ( = ?auto_191767 ?auto_191773 ) ) ( not ( = ?auto_191768 ?auto_191773 ) ) ( not ( = ?auto_191769 ?auto_191773 ) ) ( not ( = ?auto_191770 ?auto_191773 ) ) ( not ( = ?auto_191771 ?auto_191773 ) ) ( not ( = ?auto_191772 ?auto_191773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191765 ?auto_191773 )
      ( MAKE-8PILE ?auto_191765 ?auto_191766 ?auto_191767 ?auto_191768 ?auto_191769 ?auto_191770 ?auto_191771 ?auto_191772 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191774 - BLOCK
      ?auto_191775 - BLOCK
      ?auto_191776 - BLOCK
      ?auto_191777 - BLOCK
      ?auto_191778 - BLOCK
      ?auto_191779 - BLOCK
      ?auto_191780 - BLOCK
      ?auto_191781 - BLOCK
    )
    :vars
    (
      ?auto_191782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191774 ?auto_191775 ) ) ( not ( = ?auto_191774 ?auto_191776 ) ) ( not ( = ?auto_191774 ?auto_191777 ) ) ( not ( = ?auto_191774 ?auto_191778 ) ) ( not ( = ?auto_191774 ?auto_191779 ) ) ( not ( = ?auto_191774 ?auto_191780 ) ) ( not ( = ?auto_191774 ?auto_191781 ) ) ( not ( = ?auto_191775 ?auto_191776 ) ) ( not ( = ?auto_191775 ?auto_191777 ) ) ( not ( = ?auto_191775 ?auto_191778 ) ) ( not ( = ?auto_191775 ?auto_191779 ) ) ( not ( = ?auto_191775 ?auto_191780 ) ) ( not ( = ?auto_191775 ?auto_191781 ) ) ( not ( = ?auto_191776 ?auto_191777 ) ) ( not ( = ?auto_191776 ?auto_191778 ) ) ( not ( = ?auto_191776 ?auto_191779 ) ) ( not ( = ?auto_191776 ?auto_191780 ) ) ( not ( = ?auto_191776 ?auto_191781 ) ) ( not ( = ?auto_191777 ?auto_191778 ) ) ( not ( = ?auto_191777 ?auto_191779 ) ) ( not ( = ?auto_191777 ?auto_191780 ) ) ( not ( = ?auto_191777 ?auto_191781 ) ) ( not ( = ?auto_191778 ?auto_191779 ) ) ( not ( = ?auto_191778 ?auto_191780 ) ) ( not ( = ?auto_191778 ?auto_191781 ) ) ( not ( = ?auto_191779 ?auto_191780 ) ) ( not ( = ?auto_191779 ?auto_191781 ) ) ( not ( = ?auto_191780 ?auto_191781 ) ) ( ON-TABLE ?auto_191781 ) ( ON ?auto_191780 ?auto_191781 ) ( ON ?auto_191779 ?auto_191780 ) ( ON ?auto_191778 ?auto_191779 ) ( ON ?auto_191777 ?auto_191778 ) ( ON ?auto_191776 ?auto_191777 ) ( ON ?auto_191774 ?auto_191782 ) ( CLEAR ?auto_191774 ) ( not ( = ?auto_191774 ?auto_191782 ) ) ( not ( = ?auto_191775 ?auto_191782 ) ) ( not ( = ?auto_191776 ?auto_191782 ) ) ( not ( = ?auto_191777 ?auto_191782 ) ) ( not ( = ?auto_191778 ?auto_191782 ) ) ( not ( = ?auto_191779 ?auto_191782 ) ) ( not ( = ?auto_191780 ?auto_191782 ) ) ( not ( = ?auto_191781 ?auto_191782 ) ) ( HOLDING ?auto_191775 ) ( CLEAR ?auto_191776 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191781 ?auto_191780 ?auto_191779 ?auto_191778 ?auto_191777 ?auto_191776 ?auto_191775 )
      ( MAKE-8PILE ?auto_191774 ?auto_191775 ?auto_191776 ?auto_191777 ?auto_191778 ?auto_191779 ?auto_191780 ?auto_191781 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191783 - BLOCK
      ?auto_191784 - BLOCK
      ?auto_191785 - BLOCK
      ?auto_191786 - BLOCK
      ?auto_191787 - BLOCK
      ?auto_191788 - BLOCK
      ?auto_191789 - BLOCK
      ?auto_191790 - BLOCK
    )
    :vars
    (
      ?auto_191791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191783 ?auto_191784 ) ) ( not ( = ?auto_191783 ?auto_191785 ) ) ( not ( = ?auto_191783 ?auto_191786 ) ) ( not ( = ?auto_191783 ?auto_191787 ) ) ( not ( = ?auto_191783 ?auto_191788 ) ) ( not ( = ?auto_191783 ?auto_191789 ) ) ( not ( = ?auto_191783 ?auto_191790 ) ) ( not ( = ?auto_191784 ?auto_191785 ) ) ( not ( = ?auto_191784 ?auto_191786 ) ) ( not ( = ?auto_191784 ?auto_191787 ) ) ( not ( = ?auto_191784 ?auto_191788 ) ) ( not ( = ?auto_191784 ?auto_191789 ) ) ( not ( = ?auto_191784 ?auto_191790 ) ) ( not ( = ?auto_191785 ?auto_191786 ) ) ( not ( = ?auto_191785 ?auto_191787 ) ) ( not ( = ?auto_191785 ?auto_191788 ) ) ( not ( = ?auto_191785 ?auto_191789 ) ) ( not ( = ?auto_191785 ?auto_191790 ) ) ( not ( = ?auto_191786 ?auto_191787 ) ) ( not ( = ?auto_191786 ?auto_191788 ) ) ( not ( = ?auto_191786 ?auto_191789 ) ) ( not ( = ?auto_191786 ?auto_191790 ) ) ( not ( = ?auto_191787 ?auto_191788 ) ) ( not ( = ?auto_191787 ?auto_191789 ) ) ( not ( = ?auto_191787 ?auto_191790 ) ) ( not ( = ?auto_191788 ?auto_191789 ) ) ( not ( = ?auto_191788 ?auto_191790 ) ) ( not ( = ?auto_191789 ?auto_191790 ) ) ( ON-TABLE ?auto_191790 ) ( ON ?auto_191789 ?auto_191790 ) ( ON ?auto_191788 ?auto_191789 ) ( ON ?auto_191787 ?auto_191788 ) ( ON ?auto_191786 ?auto_191787 ) ( ON ?auto_191785 ?auto_191786 ) ( ON ?auto_191783 ?auto_191791 ) ( not ( = ?auto_191783 ?auto_191791 ) ) ( not ( = ?auto_191784 ?auto_191791 ) ) ( not ( = ?auto_191785 ?auto_191791 ) ) ( not ( = ?auto_191786 ?auto_191791 ) ) ( not ( = ?auto_191787 ?auto_191791 ) ) ( not ( = ?auto_191788 ?auto_191791 ) ) ( not ( = ?auto_191789 ?auto_191791 ) ) ( not ( = ?auto_191790 ?auto_191791 ) ) ( CLEAR ?auto_191785 ) ( ON ?auto_191784 ?auto_191783 ) ( CLEAR ?auto_191784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191791 ?auto_191783 )
      ( MAKE-8PILE ?auto_191783 ?auto_191784 ?auto_191785 ?auto_191786 ?auto_191787 ?auto_191788 ?auto_191789 ?auto_191790 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191792 - BLOCK
      ?auto_191793 - BLOCK
      ?auto_191794 - BLOCK
      ?auto_191795 - BLOCK
      ?auto_191796 - BLOCK
      ?auto_191797 - BLOCK
      ?auto_191798 - BLOCK
      ?auto_191799 - BLOCK
    )
    :vars
    (
      ?auto_191800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191792 ?auto_191793 ) ) ( not ( = ?auto_191792 ?auto_191794 ) ) ( not ( = ?auto_191792 ?auto_191795 ) ) ( not ( = ?auto_191792 ?auto_191796 ) ) ( not ( = ?auto_191792 ?auto_191797 ) ) ( not ( = ?auto_191792 ?auto_191798 ) ) ( not ( = ?auto_191792 ?auto_191799 ) ) ( not ( = ?auto_191793 ?auto_191794 ) ) ( not ( = ?auto_191793 ?auto_191795 ) ) ( not ( = ?auto_191793 ?auto_191796 ) ) ( not ( = ?auto_191793 ?auto_191797 ) ) ( not ( = ?auto_191793 ?auto_191798 ) ) ( not ( = ?auto_191793 ?auto_191799 ) ) ( not ( = ?auto_191794 ?auto_191795 ) ) ( not ( = ?auto_191794 ?auto_191796 ) ) ( not ( = ?auto_191794 ?auto_191797 ) ) ( not ( = ?auto_191794 ?auto_191798 ) ) ( not ( = ?auto_191794 ?auto_191799 ) ) ( not ( = ?auto_191795 ?auto_191796 ) ) ( not ( = ?auto_191795 ?auto_191797 ) ) ( not ( = ?auto_191795 ?auto_191798 ) ) ( not ( = ?auto_191795 ?auto_191799 ) ) ( not ( = ?auto_191796 ?auto_191797 ) ) ( not ( = ?auto_191796 ?auto_191798 ) ) ( not ( = ?auto_191796 ?auto_191799 ) ) ( not ( = ?auto_191797 ?auto_191798 ) ) ( not ( = ?auto_191797 ?auto_191799 ) ) ( not ( = ?auto_191798 ?auto_191799 ) ) ( ON-TABLE ?auto_191799 ) ( ON ?auto_191798 ?auto_191799 ) ( ON ?auto_191797 ?auto_191798 ) ( ON ?auto_191796 ?auto_191797 ) ( ON ?auto_191795 ?auto_191796 ) ( ON ?auto_191792 ?auto_191800 ) ( not ( = ?auto_191792 ?auto_191800 ) ) ( not ( = ?auto_191793 ?auto_191800 ) ) ( not ( = ?auto_191794 ?auto_191800 ) ) ( not ( = ?auto_191795 ?auto_191800 ) ) ( not ( = ?auto_191796 ?auto_191800 ) ) ( not ( = ?auto_191797 ?auto_191800 ) ) ( not ( = ?auto_191798 ?auto_191800 ) ) ( not ( = ?auto_191799 ?auto_191800 ) ) ( ON ?auto_191793 ?auto_191792 ) ( CLEAR ?auto_191793 ) ( ON-TABLE ?auto_191800 ) ( HOLDING ?auto_191794 ) ( CLEAR ?auto_191795 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191799 ?auto_191798 ?auto_191797 ?auto_191796 ?auto_191795 ?auto_191794 )
      ( MAKE-8PILE ?auto_191792 ?auto_191793 ?auto_191794 ?auto_191795 ?auto_191796 ?auto_191797 ?auto_191798 ?auto_191799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191801 - BLOCK
      ?auto_191802 - BLOCK
      ?auto_191803 - BLOCK
      ?auto_191804 - BLOCK
      ?auto_191805 - BLOCK
      ?auto_191806 - BLOCK
      ?auto_191807 - BLOCK
      ?auto_191808 - BLOCK
    )
    :vars
    (
      ?auto_191809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191801 ?auto_191802 ) ) ( not ( = ?auto_191801 ?auto_191803 ) ) ( not ( = ?auto_191801 ?auto_191804 ) ) ( not ( = ?auto_191801 ?auto_191805 ) ) ( not ( = ?auto_191801 ?auto_191806 ) ) ( not ( = ?auto_191801 ?auto_191807 ) ) ( not ( = ?auto_191801 ?auto_191808 ) ) ( not ( = ?auto_191802 ?auto_191803 ) ) ( not ( = ?auto_191802 ?auto_191804 ) ) ( not ( = ?auto_191802 ?auto_191805 ) ) ( not ( = ?auto_191802 ?auto_191806 ) ) ( not ( = ?auto_191802 ?auto_191807 ) ) ( not ( = ?auto_191802 ?auto_191808 ) ) ( not ( = ?auto_191803 ?auto_191804 ) ) ( not ( = ?auto_191803 ?auto_191805 ) ) ( not ( = ?auto_191803 ?auto_191806 ) ) ( not ( = ?auto_191803 ?auto_191807 ) ) ( not ( = ?auto_191803 ?auto_191808 ) ) ( not ( = ?auto_191804 ?auto_191805 ) ) ( not ( = ?auto_191804 ?auto_191806 ) ) ( not ( = ?auto_191804 ?auto_191807 ) ) ( not ( = ?auto_191804 ?auto_191808 ) ) ( not ( = ?auto_191805 ?auto_191806 ) ) ( not ( = ?auto_191805 ?auto_191807 ) ) ( not ( = ?auto_191805 ?auto_191808 ) ) ( not ( = ?auto_191806 ?auto_191807 ) ) ( not ( = ?auto_191806 ?auto_191808 ) ) ( not ( = ?auto_191807 ?auto_191808 ) ) ( ON-TABLE ?auto_191808 ) ( ON ?auto_191807 ?auto_191808 ) ( ON ?auto_191806 ?auto_191807 ) ( ON ?auto_191805 ?auto_191806 ) ( ON ?auto_191804 ?auto_191805 ) ( ON ?auto_191801 ?auto_191809 ) ( not ( = ?auto_191801 ?auto_191809 ) ) ( not ( = ?auto_191802 ?auto_191809 ) ) ( not ( = ?auto_191803 ?auto_191809 ) ) ( not ( = ?auto_191804 ?auto_191809 ) ) ( not ( = ?auto_191805 ?auto_191809 ) ) ( not ( = ?auto_191806 ?auto_191809 ) ) ( not ( = ?auto_191807 ?auto_191809 ) ) ( not ( = ?auto_191808 ?auto_191809 ) ) ( ON ?auto_191802 ?auto_191801 ) ( ON-TABLE ?auto_191809 ) ( CLEAR ?auto_191804 ) ( ON ?auto_191803 ?auto_191802 ) ( CLEAR ?auto_191803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191809 ?auto_191801 ?auto_191802 )
      ( MAKE-8PILE ?auto_191801 ?auto_191802 ?auto_191803 ?auto_191804 ?auto_191805 ?auto_191806 ?auto_191807 ?auto_191808 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191810 - BLOCK
      ?auto_191811 - BLOCK
      ?auto_191812 - BLOCK
      ?auto_191813 - BLOCK
      ?auto_191814 - BLOCK
      ?auto_191815 - BLOCK
      ?auto_191816 - BLOCK
      ?auto_191817 - BLOCK
    )
    :vars
    (
      ?auto_191818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191810 ?auto_191811 ) ) ( not ( = ?auto_191810 ?auto_191812 ) ) ( not ( = ?auto_191810 ?auto_191813 ) ) ( not ( = ?auto_191810 ?auto_191814 ) ) ( not ( = ?auto_191810 ?auto_191815 ) ) ( not ( = ?auto_191810 ?auto_191816 ) ) ( not ( = ?auto_191810 ?auto_191817 ) ) ( not ( = ?auto_191811 ?auto_191812 ) ) ( not ( = ?auto_191811 ?auto_191813 ) ) ( not ( = ?auto_191811 ?auto_191814 ) ) ( not ( = ?auto_191811 ?auto_191815 ) ) ( not ( = ?auto_191811 ?auto_191816 ) ) ( not ( = ?auto_191811 ?auto_191817 ) ) ( not ( = ?auto_191812 ?auto_191813 ) ) ( not ( = ?auto_191812 ?auto_191814 ) ) ( not ( = ?auto_191812 ?auto_191815 ) ) ( not ( = ?auto_191812 ?auto_191816 ) ) ( not ( = ?auto_191812 ?auto_191817 ) ) ( not ( = ?auto_191813 ?auto_191814 ) ) ( not ( = ?auto_191813 ?auto_191815 ) ) ( not ( = ?auto_191813 ?auto_191816 ) ) ( not ( = ?auto_191813 ?auto_191817 ) ) ( not ( = ?auto_191814 ?auto_191815 ) ) ( not ( = ?auto_191814 ?auto_191816 ) ) ( not ( = ?auto_191814 ?auto_191817 ) ) ( not ( = ?auto_191815 ?auto_191816 ) ) ( not ( = ?auto_191815 ?auto_191817 ) ) ( not ( = ?auto_191816 ?auto_191817 ) ) ( ON-TABLE ?auto_191817 ) ( ON ?auto_191816 ?auto_191817 ) ( ON ?auto_191815 ?auto_191816 ) ( ON ?auto_191814 ?auto_191815 ) ( ON ?auto_191810 ?auto_191818 ) ( not ( = ?auto_191810 ?auto_191818 ) ) ( not ( = ?auto_191811 ?auto_191818 ) ) ( not ( = ?auto_191812 ?auto_191818 ) ) ( not ( = ?auto_191813 ?auto_191818 ) ) ( not ( = ?auto_191814 ?auto_191818 ) ) ( not ( = ?auto_191815 ?auto_191818 ) ) ( not ( = ?auto_191816 ?auto_191818 ) ) ( not ( = ?auto_191817 ?auto_191818 ) ) ( ON ?auto_191811 ?auto_191810 ) ( ON-TABLE ?auto_191818 ) ( ON ?auto_191812 ?auto_191811 ) ( CLEAR ?auto_191812 ) ( HOLDING ?auto_191813 ) ( CLEAR ?auto_191814 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191817 ?auto_191816 ?auto_191815 ?auto_191814 ?auto_191813 )
      ( MAKE-8PILE ?auto_191810 ?auto_191811 ?auto_191812 ?auto_191813 ?auto_191814 ?auto_191815 ?auto_191816 ?auto_191817 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191819 - BLOCK
      ?auto_191820 - BLOCK
      ?auto_191821 - BLOCK
      ?auto_191822 - BLOCK
      ?auto_191823 - BLOCK
      ?auto_191824 - BLOCK
      ?auto_191825 - BLOCK
      ?auto_191826 - BLOCK
    )
    :vars
    (
      ?auto_191827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191819 ?auto_191820 ) ) ( not ( = ?auto_191819 ?auto_191821 ) ) ( not ( = ?auto_191819 ?auto_191822 ) ) ( not ( = ?auto_191819 ?auto_191823 ) ) ( not ( = ?auto_191819 ?auto_191824 ) ) ( not ( = ?auto_191819 ?auto_191825 ) ) ( not ( = ?auto_191819 ?auto_191826 ) ) ( not ( = ?auto_191820 ?auto_191821 ) ) ( not ( = ?auto_191820 ?auto_191822 ) ) ( not ( = ?auto_191820 ?auto_191823 ) ) ( not ( = ?auto_191820 ?auto_191824 ) ) ( not ( = ?auto_191820 ?auto_191825 ) ) ( not ( = ?auto_191820 ?auto_191826 ) ) ( not ( = ?auto_191821 ?auto_191822 ) ) ( not ( = ?auto_191821 ?auto_191823 ) ) ( not ( = ?auto_191821 ?auto_191824 ) ) ( not ( = ?auto_191821 ?auto_191825 ) ) ( not ( = ?auto_191821 ?auto_191826 ) ) ( not ( = ?auto_191822 ?auto_191823 ) ) ( not ( = ?auto_191822 ?auto_191824 ) ) ( not ( = ?auto_191822 ?auto_191825 ) ) ( not ( = ?auto_191822 ?auto_191826 ) ) ( not ( = ?auto_191823 ?auto_191824 ) ) ( not ( = ?auto_191823 ?auto_191825 ) ) ( not ( = ?auto_191823 ?auto_191826 ) ) ( not ( = ?auto_191824 ?auto_191825 ) ) ( not ( = ?auto_191824 ?auto_191826 ) ) ( not ( = ?auto_191825 ?auto_191826 ) ) ( ON-TABLE ?auto_191826 ) ( ON ?auto_191825 ?auto_191826 ) ( ON ?auto_191824 ?auto_191825 ) ( ON ?auto_191823 ?auto_191824 ) ( ON ?auto_191819 ?auto_191827 ) ( not ( = ?auto_191819 ?auto_191827 ) ) ( not ( = ?auto_191820 ?auto_191827 ) ) ( not ( = ?auto_191821 ?auto_191827 ) ) ( not ( = ?auto_191822 ?auto_191827 ) ) ( not ( = ?auto_191823 ?auto_191827 ) ) ( not ( = ?auto_191824 ?auto_191827 ) ) ( not ( = ?auto_191825 ?auto_191827 ) ) ( not ( = ?auto_191826 ?auto_191827 ) ) ( ON ?auto_191820 ?auto_191819 ) ( ON-TABLE ?auto_191827 ) ( ON ?auto_191821 ?auto_191820 ) ( CLEAR ?auto_191823 ) ( ON ?auto_191822 ?auto_191821 ) ( CLEAR ?auto_191822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191827 ?auto_191819 ?auto_191820 ?auto_191821 )
      ( MAKE-8PILE ?auto_191819 ?auto_191820 ?auto_191821 ?auto_191822 ?auto_191823 ?auto_191824 ?auto_191825 ?auto_191826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191828 - BLOCK
      ?auto_191829 - BLOCK
      ?auto_191830 - BLOCK
      ?auto_191831 - BLOCK
      ?auto_191832 - BLOCK
      ?auto_191833 - BLOCK
      ?auto_191834 - BLOCK
      ?auto_191835 - BLOCK
    )
    :vars
    (
      ?auto_191836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191828 ?auto_191829 ) ) ( not ( = ?auto_191828 ?auto_191830 ) ) ( not ( = ?auto_191828 ?auto_191831 ) ) ( not ( = ?auto_191828 ?auto_191832 ) ) ( not ( = ?auto_191828 ?auto_191833 ) ) ( not ( = ?auto_191828 ?auto_191834 ) ) ( not ( = ?auto_191828 ?auto_191835 ) ) ( not ( = ?auto_191829 ?auto_191830 ) ) ( not ( = ?auto_191829 ?auto_191831 ) ) ( not ( = ?auto_191829 ?auto_191832 ) ) ( not ( = ?auto_191829 ?auto_191833 ) ) ( not ( = ?auto_191829 ?auto_191834 ) ) ( not ( = ?auto_191829 ?auto_191835 ) ) ( not ( = ?auto_191830 ?auto_191831 ) ) ( not ( = ?auto_191830 ?auto_191832 ) ) ( not ( = ?auto_191830 ?auto_191833 ) ) ( not ( = ?auto_191830 ?auto_191834 ) ) ( not ( = ?auto_191830 ?auto_191835 ) ) ( not ( = ?auto_191831 ?auto_191832 ) ) ( not ( = ?auto_191831 ?auto_191833 ) ) ( not ( = ?auto_191831 ?auto_191834 ) ) ( not ( = ?auto_191831 ?auto_191835 ) ) ( not ( = ?auto_191832 ?auto_191833 ) ) ( not ( = ?auto_191832 ?auto_191834 ) ) ( not ( = ?auto_191832 ?auto_191835 ) ) ( not ( = ?auto_191833 ?auto_191834 ) ) ( not ( = ?auto_191833 ?auto_191835 ) ) ( not ( = ?auto_191834 ?auto_191835 ) ) ( ON-TABLE ?auto_191835 ) ( ON ?auto_191834 ?auto_191835 ) ( ON ?auto_191833 ?auto_191834 ) ( ON ?auto_191828 ?auto_191836 ) ( not ( = ?auto_191828 ?auto_191836 ) ) ( not ( = ?auto_191829 ?auto_191836 ) ) ( not ( = ?auto_191830 ?auto_191836 ) ) ( not ( = ?auto_191831 ?auto_191836 ) ) ( not ( = ?auto_191832 ?auto_191836 ) ) ( not ( = ?auto_191833 ?auto_191836 ) ) ( not ( = ?auto_191834 ?auto_191836 ) ) ( not ( = ?auto_191835 ?auto_191836 ) ) ( ON ?auto_191829 ?auto_191828 ) ( ON-TABLE ?auto_191836 ) ( ON ?auto_191830 ?auto_191829 ) ( ON ?auto_191831 ?auto_191830 ) ( CLEAR ?auto_191831 ) ( HOLDING ?auto_191832 ) ( CLEAR ?auto_191833 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191835 ?auto_191834 ?auto_191833 ?auto_191832 )
      ( MAKE-8PILE ?auto_191828 ?auto_191829 ?auto_191830 ?auto_191831 ?auto_191832 ?auto_191833 ?auto_191834 ?auto_191835 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191837 - BLOCK
      ?auto_191838 - BLOCK
      ?auto_191839 - BLOCK
      ?auto_191840 - BLOCK
      ?auto_191841 - BLOCK
      ?auto_191842 - BLOCK
      ?auto_191843 - BLOCK
      ?auto_191844 - BLOCK
    )
    :vars
    (
      ?auto_191845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191837 ?auto_191838 ) ) ( not ( = ?auto_191837 ?auto_191839 ) ) ( not ( = ?auto_191837 ?auto_191840 ) ) ( not ( = ?auto_191837 ?auto_191841 ) ) ( not ( = ?auto_191837 ?auto_191842 ) ) ( not ( = ?auto_191837 ?auto_191843 ) ) ( not ( = ?auto_191837 ?auto_191844 ) ) ( not ( = ?auto_191838 ?auto_191839 ) ) ( not ( = ?auto_191838 ?auto_191840 ) ) ( not ( = ?auto_191838 ?auto_191841 ) ) ( not ( = ?auto_191838 ?auto_191842 ) ) ( not ( = ?auto_191838 ?auto_191843 ) ) ( not ( = ?auto_191838 ?auto_191844 ) ) ( not ( = ?auto_191839 ?auto_191840 ) ) ( not ( = ?auto_191839 ?auto_191841 ) ) ( not ( = ?auto_191839 ?auto_191842 ) ) ( not ( = ?auto_191839 ?auto_191843 ) ) ( not ( = ?auto_191839 ?auto_191844 ) ) ( not ( = ?auto_191840 ?auto_191841 ) ) ( not ( = ?auto_191840 ?auto_191842 ) ) ( not ( = ?auto_191840 ?auto_191843 ) ) ( not ( = ?auto_191840 ?auto_191844 ) ) ( not ( = ?auto_191841 ?auto_191842 ) ) ( not ( = ?auto_191841 ?auto_191843 ) ) ( not ( = ?auto_191841 ?auto_191844 ) ) ( not ( = ?auto_191842 ?auto_191843 ) ) ( not ( = ?auto_191842 ?auto_191844 ) ) ( not ( = ?auto_191843 ?auto_191844 ) ) ( ON-TABLE ?auto_191844 ) ( ON ?auto_191843 ?auto_191844 ) ( ON ?auto_191842 ?auto_191843 ) ( ON ?auto_191837 ?auto_191845 ) ( not ( = ?auto_191837 ?auto_191845 ) ) ( not ( = ?auto_191838 ?auto_191845 ) ) ( not ( = ?auto_191839 ?auto_191845 ) ) ( not ( = ?auto_191840 ?auto_191845 ) ) ( not ( = ?auto_191841 ?auto_191845 ) ) ( not ( = ?auto_191842 ?auto_191845 ) ) ( not ( = ?auto_191843 ?auto_191845 ) ) ( not ( = ?auto_191844 ?auto_191845 ) ) ( ON ?auto_191838 ?auto_191837 ) ( ON-TABLE ?auto_191845 ) ( ON ?auto_191839 ?auto_191838 ) ( ON ?auto_191840 ?auto_191839 ) ( CLEAR ?auto_191842 ) ( ON ?auto_191841 ?auto_191840 ) ( CLEAR ?auto_191841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191845 ?auto_191837 ?auto_191838 ?auto_191839 ?auto_191840 )
      ( MAKE-8PILE ?auto_191837 ?auto_191838 ?auto_191839 ?auto_191840 ?auto_191841 ?auto_191842 ?auto_191843 ?auto_191844 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191846 - BLOCK
      ?auto_191847 - BLOCK
      ?auto_191848 - BLOCK
      ?auto_191849 - BLOCK
      ?auto_191850 - BLOCK
      ?auto_191851 - BLOCK
      ?auto_191852 - BLOCK
      ?auto_191853 - BLOCK
    )
    :vars
    (
      ?auto_191854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191846 ?auto_191847 ) ) ( not ( = ?auto_191846 ?auto_191848 ) ) ( not ( = ?auto_191846 ?auto_191849 ) ) ( not ( = ?auto_191846 ?auto_191850 ) ) ( not ( = ?auto_191846 ?auto_191851 ) ) ( not ( = ?auto_191846 ?auto_191852 ) ) ( not ( = ?auto_191846 ?auto_191853 ) ) ( not ( = ?auto_191847 ?auto_191848 ) ) ( not ( = ?auto_191847 ?auto_191849 ) ) ( not ( = ?auto_191847 ?auto_191850 ) ) ( not ( = ?auto_191847 ?auto_191851 ) ) ( not ( = ?auto_191847 ?auto_191852 ) ) ( not ( = ?auto_191847 ?auto_191853 ) ) ( not ( = ?auto_191848 ?auto_191849 ) ) ( not ( = ?auto_191848 ?auto_191850 ) ) ( not ( = ?auto_191848 ?auto_191851 ) ) ( not ( = ?auto_191848 ?auto_191852 ) ) ( not ( = ?auto_191848 ?auto_191853 ) ) ( not ( = ?auto_191849 ?auto_191850 ) ) ( not ( = ?auto_191849 ?auto_191851 ) ) ( not ( = ?auto_191849 ?auto_191852 ) ) ( not ( = ?auto_191849 ?auto_191853 ) ) ( not ( = ?auto_191850 ?auto_191851 ) ) ( not ( = ?auto_191850 ?auto_191852 ) ) ( not ( = ?auto_191850 ?auto_191853 ) ) ( not ( = ?auto_191851 ?auto_191852 ) ) ( not ( = ?auto_191851 ?auto_191853 ) ) ( not ( = ?auto_191852 ?auto_191853 ) ) ( ON-TABLE ?auto_191853 ) ( ON ?auto_191852 ?auto_191853 ) ( ON ?auto_191846 ?auto_191854 ) ( not ( = ?auto_191846 ?auto_191854 ) ) ( not ( = ?auto_191847 ?auto_191854 ) ) ( not ( = ?auto_191848 ?auto_191854 ) ) ( not ( = ?auto_191849 ?auto_191854 ) ) ( not ( = ?auto_191850 ?auto_191854 ) ) ( not ( = ?auto_191851 ?auto_191854 ) ) ( not ( = ?auto_191852 ?auto_191854 ) ) ( not ( = ?auto_191853 ?auto_191854 ) ) ( ON ?auto_191847 ?auto_191846 ) ( ON-TABLE ?auto_191854 ) ( ON ?auto_191848 ?auto_191847 ) ( ON ?auto_191849 ?auto_191848 ) ( ON ?auto_191850 ?auto_191849 ) ( CLEAR ?auto_191850 ) ( HOLDING ?auto_191851 ) ( CLEAR ?auto_191852 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191853 ?auto_191852 ?auto_191851 )
      ( MAKE-8PILE ?auto_191846 ?auto_191847 ?auto_191848 ?auto_191849 ?auto_191850 ?auto_191851 ?auto_191852 ?auto_191853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191855 - BLOCK
      ?auto_191856 - BLOCK
      ?auto_191857 - BLOCK
      ?auto_191858 - BLOCK
      ?auto_191859 - BLOCK
      ?auto_191860 - BLOCK
      ?auto_191861 - BLOCK
      ?auto_191862 - BLOCK
    )
    :vars
    (
      ?auto_191863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191855 ?auto_191856 ) ) ( not ( = ?auto_191855 ?auto_191857 ) ) ( not ( = ?auto_191855 ?auto_191858 ) ) ( not ( = ?auto_191855 ?auto_191859 ) ) ( not ( = ?auto_191855 ?auto_191860 ) ) ( not ( = ?auto_191855 ?auto_191861 ) ) ( not ( = ?auto_191855 ?auto_191862 ) ) ( not ( = ?auto_191856 ?auto_191857 ) ) ( not ( = ?auto_191856 ?auto_191858 ) ) ( not ( = ?auto_191856 ?auto_191859 ) ) ( not ( = ?auto_191856 ?auto_191860 ) ) ( not ( = ?auto_191856 ?auto_191861 ) ) ( not ( = ?auto_191856 ?auto_191862 ) ) ( not ( = ?auto_191857 ?auto_191858 ) ) ( not ( = ?auto_191857 ?auto_191859 ) ) ( not ( = ?auto_191857 ?auto_191860 ) ) ( not ( = ?auto_191857 ?auto_191861 ) ) ( not ( = ?auto_191857 ?auto_191862 ) ) ( not ( = ?auto_191858 ?auto_191859 ) ) ( not ( = ?auto_191858 ?auto_191860 ) ) ( not ( = ?auto_191858 ?auto_191861 ) ) ( not ( = ?auto_191858 ?auto_191862 ) ) ( not ( = ?auto_191859 ?auto_191860 ) ) ( not ( = ?auto_191859 ?auto_191861 ) ) ( not ( = ?auto_191859 ?auto_191862 ) ) ( not ( = ?auto_191860 ?auto_191861 ) ) ( not ( = ?auto_191860 ?auto_191862 ) ) ( not ( = ?auto_191861 ?auto_191862 ) ) ( ON-TABLE ?auto_191862 ) ( ON ?auto_191861 ?auto_191862 ) ( ON ?auto_191855 ?auto_191863 ) ( not ( = ?auto_191855 ?auto_191863 ) ) ( not ( = ?auto_191856 ?auto_191863 ) ) ( not ( = ?auto_191857 ?auto_191863 ) ) ( not ( = ?auto_191858 ?auto_191863 ) ) ( not ( = ?auto_191859 ?auto_191863 ) ) ( not ( = ?auto_191860 ?auto_191863 ) ) ( not ( = ?auto_191861 ?auto_191863 ) ) ( not ( = ?auto_191862 ?auto_191863 ) ) ( ON ?auto_191856 ?auto_191855 ) ( ON-TABLE ?auto_191863 ) ( ON ?auto_191857 ?auto_191856 ) ( ON ?auto_191858 ?auto_191857 ) ( ON ?auto_191859 ?auto_191858 ) ( CLEAR ?auto_191861 ) ( ON ?auto_191860 ?auto_191859 ) ( CLEAR ?auto_191860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191863 ?auto_191855 ?auto_191856 ?auto_191857 ?auto_191858 ?auto_191859 )
      ( MAKE-8PILE ?auto_191855 ?auto_191856 ?auto_191857 ?auto_191858 ?auto_191859 ?auto_191860 ?auto_191861 ?auto_191862 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191864 - BLOCK
      ?auto_191865 - BLOCK
      ?auto_191866 - BLOCK
      ?auto_191867 - BLOCK
      ?auto_191868 - BLOCK
      ?auto_191869 - BLOCK
      ?auto_191870 - BLOCK
      ?auto_191871 - BLOCK
    )
    :vars
    (
      ?auto_191872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191864 ?auto_191865 ) ) ( not ( = ?auto_191864 ?auto_191866 ) ) ( not ( = ?auto_191864 ?auto_191867 ) ) ( not ( = ?auto_191864 ?auto_191868 ) ) ( not ( = ?auto_191864 ?auto_191869 ) ) ( not ( = ?auto_191864 ?auto_191870 ) ) ( not ( = ?auto_191864 ?auto_191871 ) ) ( not ( = ?auto_191865 ?auto_191866 ) ) ( not ( = ?auto_191865 ?auto_191867 ) ) ( not ( = ?auto_191865 ?auto_191868 ) ) ( not ( = ?auto_191865 ?auto_191869 ) ) ( not ( = ?auto_191865 ?auto_191870 ) ) ( not ( = ?auto_191865 ?auto_191871 ) ) ( not ( = ?auto_191866 ?auto_191867 ) ) ( not ( = ?auto_191866 ?auto_191868 ) ) ( not ( = ?auto_191866 ?auto_191869 ) ) ( not ( = ?auto_191866 ?auto_191870 ) ) ( not ( = ?auto_191866 ?auto_191871 ) ) ( not ( = ?auto_191867 ?auto_191868 ) ) ( not ( = ?auto_191867 ?auto_191869 ) ) ( not ( = ?auto_191867 ?auto_191870 ) ) ( not ( = ?auto_191867 ?auto_191871 ) ) ( not ( = ?auto_191868 ?auto_191869 ) ) ( not ( = ?auto_191868 ?auto_191870 ) ) ( not ( = ?auto_191868 ?auto_191871 ) ) ( not ( = ?auto_191869 ?auto_191870 ) ) ( not ( = ?auto_191869 ?auto_191871 ) ) ( not ( = ?auto_191870 ?auto_191871 ) ) ( ON-TABLE ?auto_191871 ) ( ON ?auto_191864 ?auto_191872 ) ( not ( = ?auto_191864 ?auto_191872 ) ) ( not ( = ?auto_191865 ?auto_191872 ) ) ( not ( = ?auto_191866 ?auto_191872 ) ) ( not ( = ?auto_191867 ?auto_191872 ) ) ( not ( = ?auto_191868 ?auto_191872 ) ) ( not ( = ?auto_191869 ?auto_191872 ) ) ( not ( = ?auto_191870 ?auto_191872 ) ) ( not ( = ?auto_191871 ?auto_191872 ) ) ( ON ?auto_191865 ?auto_191864 ) ( ON-TABLE ?auto_191872 ) ( ON ?auto_191866 ?auto_191865 ) ( ON ?auto_191867 ?auto_191866 ) ( ON ?auto_191868 ?auto_191867 ) ( ON ?auto_191869 ?auto_191868 ) ( CLEAR ?auto_191869 ) ( HOLDING ?auto_191870 ) ( CLEAR ?auto_191871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191871 ?auto_191870 )
      ( MAKE-8PILE ?auto_191864 ?auto_191865 ?auto_191866 ?auto_191867 ?auto_191868 ?auto_191869 ?auto_191870 ?auto_191871 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191873 - BLOCK
      ?auto_191874 - BLOCK
      ?auto_191875 - BLOCK
      ?auto_191876 - BLOCK
      ?auto_191877 - BLOCK
      ?auto_191878 - BLOCK
      ?auto_191879 - BLOCK
      ?auto_191880 - BLOCK
    )
    :vars
    (
      ?auto_191881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191873 ?auto_191874 ) ) ( not ( = ?auto_191873 ?auto_191875 ) ) ( not ( = ?auto_191873 ?auto_191876 ) ) ( not ( = ?auto_191873 ?auto_191877 ) ) ( not ( = ?auto_191873 ?auto_191878 ) ) ( not ( = ?auto_191873 ?auto_191879 ) ) ( not ( = ?auto_191873 ?auto_191880 ) ) ( not ( = ?auto_191874 ?auto_191875 ) ) ( not ( = ?auto_191874 ?auto_191876 ) ) ( not ( = ?auto_191874 ?auto_191877 ) ) ( not ( = ?auto_191874 ?auto_191878 ) ) ( not ( = ?auto_191874 ?auto_191879 ) ) ( not ( = ?auto_191874 ?auto_191880 ) ) ( not ( = ?auto_191875 ?auto_191876 ) ) ( not ( = ?auto_191875 ?auto_191877 ) ) ( not ( = ?auto_191875 ?auto_191878 ) ) ( not ( = ?auto_191875 ?auto_191879 ) ) ( not ( = ?auto_191875 ?auto_191880 ) ) ( not ( = ?auto_191876 ?auto_191877 ) ) ( not ( = ?auto_191876 ?auto_191878 ) ) ( not ( = ?auto_191876 ?auto_191879 ) ) ( not ( = ?auto_191876 ?auto_191880 ) ) ( not ( = ?auto_191877 ?auto_191878 ) ) ( not ( = ?auto_191877 ?auto_191879 ) ) ( not ( = ?auto_191877 ?auto_191880 ) ) ( not ( = ?auto_191878 ?auto_191879 ) ) ( not ( = ?auto_191878 ?auto_191880 ) ) ( not ( = ?auto_191879 ?auto_191880 ) ) ( ON-TABLE ?auto_191880 ) ( ON ?auto_191873 ?auto_191881 ) ( not ( = ?auto_191873 ?auto_191881 ) ) ( not ( = ?auto_191874 ?auto_191881 ) ) ( not ( = ?auto_191875 ?auto_191881 ) ) ( not ( = ?auto_191876 ?auto_191881 ) ) ( not ( = ?auto_191877 ?auto_191881 ) ) ( not ( = ?auto_191878 ?auto_191881 ) ) ( not ( = ?auto_191879 ?auto_191881 ) ) ( not ( = ?auto_191880 ?auto_191881 ) ) ( ON ?auto_191874 ?auto_191873 ) ( ON-TABLE ?auto_191881 ) ( ON ?auto_191875 ?auto_191874 ) ( ON ?auto_191876 ?auto_191875 ) ( ON ?auto_191877 ?auto_191876 ) ( ON ?auto_191878 ?auto_191877 ) ( CLEAR ?auto_191880 ) ( ON ?auto_191879 ?auto_191878 ) ( CLEAR ?auto_191879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191881 ?auto_191873 ?auto_191874 ?auto_191875 ?auto_191876 ?auto_191877 ?auto_191878 )
      ( MAKE-8PILE ?auto_191873 ?auto_191874 ?auto_191875 ?auto_191876 ?auto_191877 ?auto_191878 ?auto_191879 ?auto_191880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191882 - BLOCK
      ?auto_191883 - BLOCK
      ?auto_191884 - BLOCK
      ?auto_191885 - BLOCK
      ?auto_191886 - BLOCK
      ?auto_191887 - BLOCK
      ?auto_191888 - BLOCK
      ?auto_191889 - BLOCK
    )
    :vars
    (
      ?auto_191890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191882 ?auto_191883 ) ) ( not ( = ?auto_191882 ?auto_191884 ) ) ( not ( = ?auto_191882 ?auto_191885 ) ) ( not ( = ?auto_191882 ?auto_191886 ) ) ( not ( = ?auto_191882 ?auto_191887 ) ) ( not ( = ?auto_191882 ?auto_191888 ) ) ( not ( = ?auto_191882 ?auto_191889 ) ) ( not ( = ?auto_191883 ?auto_191884 ) ) ( not ( = ?auto_191883 ?auto_191885 ) ) ( not ( = ?auto_191883 ?auto_191886 ) ) ( not ( = ?auto_191883 ?auto_191887 ) ) ( not ( = ?auto_191883 ?auto_191888 ) ) ( not ( = ?auto_191883 ?auto_191889 ) ) ( not ( = ?auto_191884 ?auto_191885 ) ) ( not ( = ?auto_191884 ?auto_191886 ) ) ( not ( = ?auto_191884 ?auto_191887 ) ) ( not ( = ?auto_191884 ?auto_191888 ) ) ( not ( = ?auto_191884 ?auto_191889 ) ) ( not ( = ?auto_191885 ?auto_191886 ) ) ( not ( = ?auto_191885 ?auto_191887 ) ) ( not ( = ?auto_191885 ?auto_191888 ) ) ( not ( = ?auto_191885 ?auto_191889 ) ) ( not ( = ?auto_191886 ?auto_191887 ) ) ( not ( = ?auto_191886 ?auto_191888 ) ) ( not ( = ?auto_191886 ?auto_191889 ) ) ( not ( = ?auto_191887 ?auto_191888 ) ) ( not ( = ?auto_191887 ?auto_191889 ) ) ( not ( = ?auto_191888 ?auto_191889 ) ) ( ON ?auto_191882 ?auto_191890 ) ( not ( = ?auto_191882 ?auto_191890 ) ) ( not ( = ?auto_191883 ?auto_191890 ) ) ( not ( = ?auto_191884 ?auto_191890 ) ) ( not ( = ?auto_191885 ?auto_191890 ) ) ( not ( = ?auto_191886 ?auto_191890 ) ) ( not ( = ?auto_191887 ?auto_191890 ) ) ( not ( = ?auto_191888 ?auto_191890 ) ) ( not ( = ?auto_191889 ?auto_191890 ) ) ( ON ?auto_191883 ?auto_191882 ) ( ON-TABLE ?auto_191890 ) ( ON ?auto_191884 ?auto_191883 ) ( ON ?auto_191885 ?auto_191884 ) ( ON ?auto_191886 ?auto_191885 ) ( ON ?auto_191887 ?auto_191886 ) ( ON ?auto_191888 ?auto_191887 ) ( CLEAR ?auto_191888 ) ( HOLDING ?auto_191889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191889 )
      ( MAKE-8PILE ?auto_191882 ?auto_191883 ?auto_191884 ?auto_191885 ?auto_191886 ?auto_191887 ?auto_191888 ?auto_191889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191891 - BLOCK
      ?auto_191892 - BLOCK
      ?auto_191893 - BLOCK
      ?auto_191894 - BLOCK
      ?auto_191895 - BLOCK
      ?auto_191896 - BLOCK
      ?auto_191897 - BLOCK
      ?auto_191898 - BLOCK
    )
    :vars
    (
      ?auto_191899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191891 ?auto_191892 ) ) ( not ( = ?auto_191891 ?auto_191893 ) ) ( not ( = ?auto_191891 ?auto_191894 ) ) ( not ( = ?auto_191891 ?auto_191895 ) ) ( not ( = ?auto_191891 ?auto_191896 ) ) ( not ( = ?auto_191891 ?auto_191897 ) ) ( not ( = ?auto_191891 ?auto_191898 ) ) ( not ( = ?auto_191892 ?auto_191893 ) ) ( not ( = ?auto_191892 ?auto_191894 ) ) ( not ( = ?auto_191892 ?auto_191895 ) ) ( not ( = ?auto_191892 ?auto_191896 ) ) ( not ( = ?auto_191892 ?auto_191897 ) ) ( not ( = ?auto_191892 ?auto_191898 ) ) ( not ( = ?auto_191893 ?auto_191894 ) ) ( not ( = ?auto_191893 ?auto_191895 ) ) ( not ( = ?auto_191893 ?auto_191896 ) ) ( not ( = ?auto_191893 ?auto_191897 ) ) ( not ( = ?auto_191893 ?auto_191898 ) ) ( not ( = ?auto_191894 ?auto_191895 ) ) ( not ( = ?auto_191894 ?auto_191896 ) ) ( not ( = ?auto_191894 ?auto_191897 ) ) ( not ( = ?auto_191894 ?auto_191898 ) ) ( not ( = ?auto_191895 ?auto_191896 ) ) ( not ( = ?auto_191895 ?auto_191897 ) ) ( not ( = ?auto_191895 ?auto_191898 ) ) ( not ( = ?auto_191896 ?auto_191897 ) ) ( not ( = ?auto_191896 ?auto_191898 ) ) ( not ( = ?auto_191897 ?auto_191898 ) ) ( ON ?auto_191891 ?auto_191899 ) ( not ( = ?auto_191891 ?auto_191899 ) ) ( not ( = ?auto_191892 ?auto_191899 ) ) ( not ( = ?auto_191893 ?auto_191899 ) ) ( not ( = ?auto_191894 ?auto_191899 ) ) ( not ( = ?auto_191895 ?auto_191899 ) ) ( not ( = ?auto_191896 ?auto_191899 ) ) ( not ( = ?auto_191897 ?auto_191899 ) ) ( not ( = ?auto_191898 ?auto_191899 ) ) ( ON ?auto_191892 ?auto_191891 ) ( ON-TABLE ?auto_191899 ) ( ON ?auto_191893 ?auto_191892 ) ( ON ?auto_191894 ?auto_191893 ) ( ON ?auto_191895 ?auto_191894 ) ( ON ?auto_191896 ?auto_191895 ) ( ON ?auto_191897 ?auto_191896 ) ( ON ?auto_191898 ?auto_191897 ) ( CLEAR ?auto_191898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191899 ?auto_191891 ?auto_191892 ?auto_191893 ?auto_191894 ?auto_191895 ?auto_191896 ?auto_191897 )
      ( MAKE-8PILE ?auto_191891 ?auto_191892 ?auto_191893 ?auto_191894 ?auto_191895 ?auto_191896 ?auto_191897 ?auto_191898 ) )
  )

)

