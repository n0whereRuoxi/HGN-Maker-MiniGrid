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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_261033 - BLOCK
    )
    :vars
    (
      ?auto_261034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261033 ?auto_261034 ) ( CLEAR ?auto_261033 ) ( HAND-EMPTY ) ( not ( = ?auto_261033 ?auto_261034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261033 ?auto_261034 )
      ( !PUTDOWN ?auto_261033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_261040 - BLOCK
      ?auto_261041 - BLOCK
    )
    :vars
    (
      ?auto_261042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261040 ) ( ON ?auto_261041 ?auto_261042 ) ( CLEAR ?auto_261041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261040 ) ( not ( = ?auto_261040 ?auto_261041 ) ) ( not ( = ?auto_261040 ?auto_261042 ) ) ( not ( = ?auto_261041 ?auto_261042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261041 ?auto_261042 )
      ( !STACK ?auto_261041 ?auto_261040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_261050 - BLOCK
      ?auto_261051 - BLOCK
    )
    :vars
    (
      ?auto_261052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261051 ?auto_261052 ) ( not ( = ?auto_261050 ?auto_261051 ) ) ( not ( = ?auto_261050 ?auto_261052 ) ) ( not ( = ?auto_261051 ?auto_261052 ) ) ( ON ?auto_261050 ?auto_261051 ) ( CLEAR ?auto_261050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261050 )
      ( MAKE-2PILE ?auto_261050 ?auto_261051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_261061 - BLOCK
      ?auto_261062 - BLOCK
      ?auto_261063 - BLOCK
    )
    :vars
    (
      ?auto_261064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261062 ) ( ON ?auto_261063 ?auto_261064 ) ( CLEAR ?auto_261063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261061 ) ( ON ?auto_261062 ?auto_261061 ) ( not ( = ?auto_261061 ?auto_261062 ) ) ( not ( = ?auto_261061 ?auto_261063 ) ) ( not ( = ?auto_261061 ?auto_261064 ) ) ( not ( = ?auto_261062 ?auto_261063 ) ) ( not ( = ?auto_261062 ?auto_261064 ) ) ( not ( = ?auto_261063 ?auto_261064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261063 ?auto_261064 )
      ( !STACK ?auto_261063 ?auto_261062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_261075 - BLOCK
      ?auto_261076 - BLOCK
      ?auto_261077 - BLOCK
    )
    :vars
    (
      ?auto_261078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261077 ?auto_261078 ) ( ON-TABLE ?auto_261075 ) ( not ( = ?auto_261075 ?auto_261076 ) ) ( not ( = ?auto_261075 ?auto_261077 ) ) ( not ( = ?auto_261075 ?auto_261078 ) ) ( not ( = ?auto_261076 ?auto_261077 ) ) ( not ( = ?auto_261076 ?auto_261078 ) ) ( not ( = ?auto_261077 ?auto_261078 ) ) ( CLEAR ?auto_261075 ) ( ON ?auto_261076 ?auto_261077 ) ( CLEAR ?auto_261076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261075 ?auto_261076 )
      ( MAKE-3PILE ?auto_261075 ?auto_261076 ?auto_261077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_261089 - BLOCK
      ?auto_261090 - BLOCK
      ?auto_261091 - BLOCK
    )
    :vars
    (
      ?auto_261092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261091 ?auto_261092 ) ( not ( = ?auto_261089 ?auto_261090 ) ) ( not ( = ?auto_261089 ?auto_261091 ) ) ( not ( = ?auto_261089 ?auto_261092 ) ) ( not ( = ?auto_261090 ?auto_261091 ) ) ( not ( = ?auto_261090 ?auto_261092 ) ) ( not ( = ?auto_261091 ?auto_261092 ) ) ( ON ?auto_261090 ?auto_261091 ) ( ON ?auto_261089 ?auto_261090 ) ( CLEAR ?auto_261089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261089 )
      ( MAKE-3PILE ?auto_261089 ?auto_261090 ?auto_261091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_261104 - BLOCK
      ?auto_261105 - BLOCK
      ?auto_261106 - BLOCK
      ?auto_261107 - BLOCK
    )
    :vars
    (
      ?auto_261108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261106 ) ( ON ?auto_261107 ?auto_261108 ) ( CLEAR ?auto_261107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261104 ) ( ON ?auto_261105 ?auto_261104 ) ( ON ?auto_261106 ?auto_261105 ) ( not ( = ?auto_261104 ?auto_261105 ) ) ( not ( = ?auto_261104 ?auto_261106 ) ) ( not ( = ?auto_261104 ?auto_261107 ) ) ( not ( = ?auto_261104 ?auto_261108 ) ) ( not ( = ?auto_261105 ?auto_261106 ) ) ( not ( = ?auto_261105 ?auto_261107 ) ) ( not ( = ?auto_261105 ?auto_261108 ) ) ( not ( = ?auto_261106 ?auto_261107 ) ) ( not ( = ?auto_261106 ?auto_261108 ) ) ( not ( = ?auto_261107 ?auto_261108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261107 ?auto_261108 )
      ( !STACK ?auto_261107 ?auto_261106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_261122 - BLOCK
      ?auto_261123 - BLOCK
      ?auto_261124 - BLOCK
      ?auto_261125 - BLOCK
    )
    :vars
    (
      ?auto_261126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261125 ?auto_261126 ) ( ON-TABLE ?auto_261122 ) ( ON ?auto_261123 ?auto_261122 ) ( not ( = ?auto_261122 ?auto_261123 ) ) ( not ( = ?auto_261122 ?auto_261124 ) ) ( not ( = ?auto_261122 ?auto_261125 ) ) ( not ( = ?auto_261122 ?auto_261126 ) ) ( not ( = ?auto_261123 ?auto_261124 ) ) ( not ( = ?auto_261123 ?auto_261125 ) ) ( not ( = ?auto_261123 ?auto_261126 ) ) ( not ( = ?auto_261124 ?auto_261125 ) ) ( not ( = ?auto_261124 ?auto_261126 ) ) ( not ( = ?auto_261125 ?auto_261126 ) ) ( CLEAR ?auto_261123 ) ( ON ?auto_261124 ?auto_261125 ) ( CLEAR ?auto_261124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_261122 ?auto_261123 ?auto_261124 )
      ( MAKE-4PILE ?auto_261122 ?auto_261123 ?auto_261124 ?auto_261125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_261140 - BLOCK
      ?auto_261141 - BLOCK
      ?auto_261142 - BLOCK
      ?auto_261143 - BLOCK
    )
    :vars
    (
      ?auto_261144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261143 ?auto_261144 ) ( ON-TABLE ?auto_261140 ) ( not ( = ?auto_261140 ?auto_261141 ) ) ( not ( = ?auto_261140 ?auto_261142 ) ) ( not ( = ?auto_261140 ?auto_261143 ) ) ( not ( = ?auto_261140 ?auto_261144 ) ) ( not ( = ?auto_261141 ?auto_261142 ) ) ( not ( = ?auto_261141 ?auto_261143 ) ) ( not ( = ?auto_261141 ?auto_261144 ) ) ( not ( = ?auto_261142 ?auto_261143 ) ) ( not ( = ?auto_261142 ?auto_261144 ) ) ( not ( = ?auto_261143 ?auto_261144 ) ) ( ON ?auto_261142 ?auto_261143 ) ( CLEAR ?auto_261140 ) ( ON ?auto_261141 ?auto_261142 ) ( CLEAR ?auto_261141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261140 ?auto_261141 )
      ( MAKE-4PILE ?auto_261140 ?auto_261141 ?auto_261142 ?auto_261143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_261158 - BLOCK
      ?auto_261159 - BLOCK
      ?auto_261160 - BLOCK
      ?auto_261161 - BLOCK
    )
    :vars
    (
      ?auto_261162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261161 ?auto_261162 ) ( not ( = ?auto_261158 ?auto_261159 ) ) ( not ( = ?auto_261158 ?auto_261160 ) ) ( not ( = ?auto_261158 ?auto_261161 ) ) ( not ( = ?auto_261158 ?auto_261162 ) ) ( not ( = ?auto_261159 ?auto_261160 ) ) ( not ( = ?auto_261159 ?auto_261161 ) ) ( not ( = ?auto_261159 ?auto_261162 ) ) ( not ( = ?auto_261160 ?auto_261161 ) ) ( not ( = ?auto_261160 ?auto_261162 ) ) ( not ( = ?auto_261161 ?auto_261162 ) ) ( ON ?auto_261160 ?auto_261161 ) ( ON ?auto_261159 ?auto_261160 ) ( ON ?auto_261158 ?auto_261159 ) ( CLEAR ?auto_261158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261158 )
      ( MAKE-4PILE ?auto_261158 ?auto_261159 ?auto_261160 ?auto_261161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_261177 - BLOCK
      ?auto_261178 - BLOCK
      ?auto_261179 - BLOCK
      ?auto_261180 - BLOCK
      ?auto_261181 - BLOCK
    )
    :vars
    (
      ?auto_261182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261180 ) ( ON ?auto_261181 ?auto_261182 ) ( CLEAR ?auto_261181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261177 ) ( ON ?auto_261178 ?auto_261177 ) ( ON ?auto_261179 ?auto_261178 ) ( ON ?auto_261180 ?auto_261179 ) ( not ( = ?auto_261177 ?auto_261178 ) ) ( not ( = ?auto_261177 ?auto_261179 ) ) ( not ( = ?auto_261177 ?auto_261180 ) ) ( not ( = ?auto_261177 ?auto_261181 ) ) ( not ( = ?auto_261177 ?auto_261182 ) ) ( not ( = ?auto_261178 ?auto_261179 ) ) ( not ( = ?auto_261178 ?auto_261180 ) ) ( not ( = ?auto_261178 ?auto_261181 ) ) ( not ( = ?auto_261178 ?auto_261182 ) ) ( not ( = ?auto_261179 ?auto_261180 ) ) ( not ( = ?auto_261179 ?auto_261181 ) ) ( not ( = ?auto_261179 ?auto_261182 ) ) ( not ( = ?auto_261180 ?auto_261181 ) ) ( not ( = ?auto_261180 ?auto_261182 ) ) ( not ( = ?auto_261181 ?auto_261182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261181 ?auto_261182 )
      ( !STACK ?auto_261181 ?auto_261180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_261199 - BLOCK
      ?auto_261200 - BLOCK
      ?auto_261201 - BLOCK
      ?auto_261202 - BLOCK
      ?auto_261203 - BLOCK
    )
    :vars
    (
      ?auto_261204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261203 ?auto_261204 ) ( ON-TABLE ?auto_261199 ) ( ON ?auto_261200 ?auto_261199 ) ( ON ?auto_261201 ?auto_261200 ) ( not ( = ?auto_261199 ?auto_261200 ) ) ( not ( = ?auto_261199 ?auto_261201 ) ) ( not ( = ?auto_261199 ?auto_261202 ) ) ( not ( = ?auto_261199 ?auto_261203 ) ) ( not ( = ?auto_261199 ?auto_261204 ) ) ( not ( = ?auto_261200 ?auto_261201 ) ) ( not ( = ?auto_261200 ?auto_261202 ) ) ( not ( = ?auto_261200 ?auto_261203 ) ) ( not ( = ?auto_261200 ?auto_261204 ) ) ( not ( = ?auto_261201 ?auto_261202 ) ) ( not ( = ?auto_261201 ?auto_261203 ) ) ( not ( = ?auto_261201 ?auto_261204 ) ) ( not ( = ?auto_261202 ?auto_261203 ) ) ( not ( = ?auto_261202 ?auto_261204 ) ) ( not ( = ?auto_261203 ?auto_261204 ) ) ( CLEAR ?auto_261201 ) ( ON ?auto_261202 ?auto_261203 ) ( CLEAR ?auto_261202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_261199 ?auto_261200 ?auto_261201 ?auto_261202 )
      ( MAKE-5PILE ?auto_261199 ?auto_261200 ?auto_261201 ?auto_261202 ?auto_261203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_261221 - BLOCK
      ?auto_261222 - BLOCK
      ?auto_261223 - BLOCK
      ?auto_261224 - BLOCK
      ?auto_261225 - BLOCK
    )
    :vars
    (
      ?auto_261226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261225 ?auto_261226 ) ( ON-TABLE ?auto_261221 ) ( ON ?auto_261222 ?auto_261221 ) ( not ( = ?auto_261221 ?auto_261222 ) ) ( not ( = ?auto_261221 ?auto_261223 ) ) ( not ( = ?auto_261221 ?auto_261224 ) ) ( not ( = ?auto_261221 ?auto_261225 ) ) ( not ( = ?auto_261221 ?auto_261226 ) ) ( not ( = ?auto_261222 ?auto_261223 ) ) ( not ( = ?auto_261222 ?auto_261224 ) ) ( not ( = ?auto_261222 ?auto_261225 ) ) ( not ( = ?auto_261222 ?auto_261226 ) ) ( not ( = ?auto_261223 ?auto_261224 ) ) ( not ( = ?auto_261223 ?auto_261225 ) ) ( not ( = ?auto_261223 ?auto_261226 ) ) ( not ( = ?auto_261224 ?auto_261225 ) ) ( not ( = ?auto_261224 ?auto_261226 ) ) ( not ( = ?auto_261225 ?auto_261226 ) ) ( ON ?auto_261224 ?auto_261225 ) ( CLEAR ?auto_261222 ) ( ON ?auto_261223 ?auto_261224 ) ( CLEAR ?auto_261223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_261221 ?auto_261222 ?auto_261223 )
      ( MAKE-5PILE ?auto_261221 ?auto_261222 ?auto_261223 ?auto_261224 ?auto_261225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_261243 - BLOCK
      ?auto_261244 - BLOCK
      ?auto_261245 - BLOCK
      ?auto_261246 - BLOCK
      ?auto_261247 - BLOCK
    )
    :vars
    (
      ?auto_261248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261247 ?auto_261248 ) ( ON-TABLE ?auto_261243 ) ( not ( = ?auto_261243 ?auto_261244 ) ) ( not ( = ?auto_261243 ?auto_261245 ) ) ( not ( = ?auto_261243 ?auto_261246 ) ) ( not ( = ?auto_261243 ?auto_261247 ) ) ( not ( = ?auto_261243 ?auto_261248 ) ) ( not ( = ?auto_261244 ?auto_261245 ) ) ( not ( = ?auto_261244 ?auto_261246 ) ) ( not ( = ?auto_261244 ?auto_261247 ) ) ( not ( = ?auto_261244 ?auto_261248 ) ) ( not ( = ?auto_261245 ?auto_261246 ) ) ( not ( = ?auto_261245 ?auto_261247 ) ) ( not ( = ?auto_261245 ?auto_261248 ) ) ( not ( = ?auto_261246 ?auto_261247 ) ) ( not ( = ?auto_261246 ?auto_261248 ) ) ( not ( = ?auto_261247 ?auto_261248 ) ) ( ON ?auto_261246 ?auto_261247 ) ( ON ?auto_261245 ?auto_261246 ) ( CLEAR ?auto_261243 ) ( ON ?auto_261244 ?auto_261245 ) ( CLEAR ?auto_261244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261243 ?auto_261244 )
      ( MAKE-5PILE ?auto_261243 ?auto_261244 ?auto_261245 ?auto_261246 ?auto_261247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_261265 - BLOCK
      ?auto_261266 - BLOCK
      ?auto_261267 - BLOCK
      ?auto_261268 - BLOCK
      ?auto_261269 - BLOCK
    )
    :vars
    (
      ?auto_261270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261269 ?auto_261270 ) ( not ( = ?auto_261265 ?auto_261266 ) ) ( not ( = ?auto_261265 ?auto_261267 ) ) ( not ( = ?auto_261265 ?auto_261268 ) ) ( not ( = ?auto_261265 ?auto_261269 ) ) ( not ( = ?auto_261265 ?auto_261270 ) ) ( not ( = ?auto_261266 ?auto_261267 ) ) ( not ( = ?auto_261266 ?auto_261268 ) ) ( not ( = ?auto_261266 ?auto_261269 ) ) ( not ( = ?auto_261266 ?auto_261270 ) ) ( not ( = ?auto_261267 ?auto_261268 ) ) ( not ( = ?auto_261267 ?auto_261269 ) ) ( not ( = ?auto_261267 ?auto_261270 ) ) ( not ( = ?auto_261268 ?auto_261269 ) ) ( not ( = ?auto_261268 ?auto_261270 ) ) ( not ( = ?auto_261269 ?auto_261270 ) ) ( ON ?auto_261268 ?auto_261269 ) ( ON ?auto_261267 ?auto_261268 ) ( ON ?auto_261266 ?auto_261267 ) ( ON ?auto_261265 ?auto_261266 ) ( CLEAR ?auto_261265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261265 )
      ( MAKE-5PILE ?auto_261265 ?auto_261266 ?auto_261267 ?auto_261268 ?auto_261269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261288 - BLOCK
      ?auto_261289 - BLOCK
      ?auto_261290 - BLOCK
      ?auto_261291 - BLOCK
      ?auto_261292 - BLOCK
      ?auto_261293 - BLOCK
    )
    :vars
    (
      ?auto_261294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261292 ) ( ON ?auto_261293 ?auto_261294 ) ( CLEAR ?auto_261293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261288 ) ( ON ?auto_261289 ?auto_261288 ) ( ON ?auto_261290 ?auto_261289 ) ( ON ?auto_261291 ?auto_261290 ) ( ON ?auto_261292 ?auto_261291 ) ( not ( = ?auto_261288 ?auto_261289 ) ) ( not ( = ?auto_261288 ?auto_261290 ) ) ( not ( = ?auto_261288 ?auto_261291 ) ) ( not ( = ?auto_261288 ?auto_261292 ) ) ( not ( = ?auto_261288 ?auto_261293 ) ) ( not ( = ?auto_261288 ?auto_261294 ) ) ( not ( = ?auto_261289 ?auto_261290 ) ) ( not ( = ?auto_261289 ?auto_261291 ) ) ( not ( = ?auto_261289 ?auto_261292 ) ) ( not ( = ?auto_261289 ?auto_261293 ) ) ( not ( = ?auto_261289 ?auto_261294 ) ) ( not ( = ?auto_261290 ?auto_261291 ) ) ( not ( = ?auto_261290 ?auto_261292 ) ) ( not ( = ?auto_261290 ?auto_261293 ) ) ( not ( = ?auto_261290 ?auto_261294 ) ) ( not ( = ?auto_261291 ?auto_261292 ) ) ( not ( = ?auto_261291 ?auto_261293 ) ) ( not ( = ?auto_261291 ?auto_261294 ) ) ( not ( = ?auto_261292 ?auto_261293 ) ) ( not ( = ?auto_261292 ?auto_261294 ) ) ( not ( = ?auto_261293 ?auto_261294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261293 ?auto_261294 )
      ( !STACK ?auto_261293 ?auto_261292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261314 - BLOCK
      ?auto_261315 - BLOCK
      ?auto_261316 - BLOCK
      ?auto_261317 - BLOCK
      ?auto_261318 - BLOCK
      ?auto_261319 - BLOCK
    )
    :vars
    (
      ?auto_261320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261319 ?auto_261320 ) ( ON-TABLE ?auto_261314 ) ( ON ?auto_261315 ?auto_261314 ) ( ON ?auto_261316 ?auto_261315 ) ( ON ?auto_261317 ?auto_261316 ) ( not ( = ?auto_261314 ?auto_261315 ) ) ( not ( = ?auto_261314 ?auto_261316 ) ) ( not ( = ?auto_261314 ?auto_261317 ) ) ( not ( = ?auto_261314 ?auto_261318 ) ) ( not ( = ?auto_261314 ?auto_261319 ) ) ( not ( = ?auto_261314 ?auto_261320 ) ) ( not ( = ?auto_261315 ?auto_261316 ) ) ( not ( = ?auto_261315 ?auto_261317 ) ) ( not ( = ?auto_261315 ?auto_261318 ) ) ( not ( = ?auto_261315 ?auto_261319 ) ) ( not ( = ?auto_261315 ?auto_261320 ) ) ( not ( = ?auto_261316 ?auto_261317 ) ) ( not ( = ?auto_261316 ?auto_261318 ) ) ( not ( = ?auto_261316 ?auto_261319 ) ) ( not ( = ?auto_261316 ?auto_261320 ) ) ( not ( = ?auto_261317 ?auto_261318 ) ) ( not ( = ?auto_261317 ?auto_261319 ) ) ( not ( = ?auto_261317 ?auto_261320 ) ) ( not ( = ?auto_261318 ?auto_261319 ) ) ( not ( = ?auto_261318 ?auto_261320 ) ) ( not ( = ?auto_261319 ?auto_261320 ) ) ( CLEAR ?auto_261317 ) ( ON ?auto_261318 ?auto_261319 ) ( CLEAR ?auto_261318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_261314 ?auto_261315 ?auto_261316 ?auto_261317 ?auto_261318 )
      ( MAKE-6PILE ?auto_261314 ?auto_261315 ?auto_261316 ?auto_261317 ?auto_261318 ?auto_261319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261340 - BLOCK
      ?auto_261341 - BLOCK
      ?auto_261342 - BLOCK
      ?auto_261343 - BLOCK
      ?auto_261344 - BLOCK
      ?auto_261345 - BLOCK
    )
    :vars
    (
      ?auto_261346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261345 ?auto_261346 ) ( ON-TABLE ?auto_261340 ) ( ON ?auto_261341 ?auto_261340 ) ( ON ?auto_261342 ?auto_261341 ) ( not ( = ?auto_261340 ?auto_261341 ) ) ( not ( = ?auto_261340 ?auto_261342 ) ) ( not ( = ?auto_261340 ?auto_261343 ) ) ( not ( = ?auto_261340 ?auto_261344 ) ) ( not ( = ?auto_261340 ?auto_261345 ) ) ( not ( = ?auto_261340 ?auto_261346 ) ) ( not ( = ?auto_261341 ?auto_261342 ) ) ( not ( = ?auto_261341 ?auto_261343 ) ) ( not ( = ?auto_261341 ?auto_261344 ) ) ( not ( = ?auto_261341 ?auto_261345 ) ) ( not ( = ?auto_261341 ?auto_261346 ) ) ( not ( = ?auto_261342 ?auto_261343 ) ) ( not ( = ?auto_261342 ?auto_261344 ) ) ( not ( = ?auto_261342 ?auto_261345 ) ) ( not ( = ?auto_261342 ?auto_261346 ) ) ( not ( = ?auto_261343 ?auto_261344 ) ) ( not ( = ?auto_261343 ?auto_261345 ) ) ( not ( = ?auto_261343 ?auto_261346 ) ) ( not ( = ?auto_261344 ?auto_261345 ) ) ( not ( = ?auto_261344 ?auto_261346 ) ) ( not ( = ?auto_261345 ?auto_261346 ) ) ( ON ?auto_261344 ?auto_261345 ) ( CLEAR ?auto_261342 ) ( ON ?auto_261343 ?auto_261344 ) ( CLEAR ?auto_261343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_261340 ?auto_261341 ?auto_261342 ?auto_261343 )
      ( MAKE-6PILE ?auto_261340 ?auto_261341 ?auto_261342 ?auto_261343 ?auto_261344 ?auto_261345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261366 - BLOCK
      ?auto_261367 - BLOCK
      ?auto_261368 - BLOCK
      ?auto_261369 - BLOCK
      ?auto_261370 - BLOCK
      ?auto_261371 - BLOCK
    )
    :vars
    (
      ?auto_261372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261371 ?auto_261372 ) ( ON-TABLE ?auto_261366 ) ( ON ?auto_261367 ?auto_261366 ) ( not ( = ?auto_261366 ?auto_261367 ) ) ( not ( = ?auto_261366 ?auto_261368 ) ) ( not ( = ?auto_261366 ?auto_261369 ) ) ( not ( = ?auto_261366 ?auto_261370 ) ) ( not ( = ?auto_261366 ?auto_261371 ) ) ( not ( = ?auto_261366 ?auto_261372 ) ) ( not ( = ?auto_261367 ?auto_261368 ) ) ( not ( = ?auto_261367 ?auto_261369 ) ) ( not ( = ?auto_261367 ?auto_261370 ) ) ( not ( = ?auto_261367 ?auto_261371 ) ) ( not ( = ?auto_261367 ?auto_261372 ) ) ( not ( = ?auto_261368 ?auto_261369 ) ) ( not ( = ?auto_261368 ?auto_261370 ) ) ( not ( = ?auto_261368 ?auto_261371 ) ) ( not ( = ?auto_261368 ?auto_261372 ) ) ( not ( = ?auto_261369 ?auto_261370 ) ) ( not ( = ?auto_261369 ?auto_261371 ) ) ( not ( = ?auto_261369 ?auto_261372 ) ) ( not ( = ?auto_261370 ?auto_261371 ) ) ( not ( = ?auto_261370 ?auto_261372 ) ) ( not ( = ?auto_261371 ?auto_261372 ) ) ( ON ?auto_261370 ?auto_261371 ) ( ON ?auto_261369 ?auto_261370 ) ( CLEAR ?auto_261367 ) ( ON ?auto_261368 ?auto_261369 ) ( CLEAR ?auto_261368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_261366 ?auto_261367 ?auto_261368 )
      ( MAKE-6PILE ?auto_261366 ?auto_261367 ?auto_261368 ?auto_261369 ?auto_261370 ?auto_261371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261392 - BLOCK
      ?auto_261393 - BLOCK
      ?auto_261394 - BLOCK
      ?auto_261395 - BLOCK
      ?auto_261396 - BLOCK
      ?auto_261397 - BLOCK
    )
    :vars
    (
      ?auto_261398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261397 ?auto_261398 ) ( ON-TABLE ?auto_261392 ) ( not ( = ?auto_261392 ?auto_261393 ) ) ( not ( = ?auto_261392 ?auto_261394 ) ) ( not ( = ?auto_261392 ?auto_261395 ) ) ( not ( = ?auto_261392 ?auto_261396 ) ) ( not ( = ?auto_261392 ?auto_261397 ) ) ( not ( = ?auto_261392 ?auto_261398 ) ) ( not ( = ?auto_261393 ?auto_261394 ) ) ( not ( = ?auto_261393 ?auto_261395 ) ) ( not ( = ?auto_261393 ?auto_261396 ) ) ( not ( = ?auto_261393 ?auto_261397 ) ) ( not ( = ?auto_261393 ?auto_261398 ) ) ( not ( = ?auto_261394 ?auto_261395 ) ) ( not ( = ?auto_261394 ?auto_261396 ) ) ( not ( = ?auto_261394 ?auto_261397 ) ) ( not ( = ?auto_261394 ?auto_261398 ) ) ( not ( = ?auto_261395 ?auto_261396 ) ) ( not ( = ?auto_261395 ?auto_261397 ) ) ( not ( = ?auto_261395 ?auto_261398 ) ) ( not ( = ?auto_261396 ?auto_261397 ) ) ( not ( = ?auto_261396 ?auto_261398 ) ) ( not ( = ?auto_261397 ?auto_261398 ) ) ( ON ?auto_261396 ?auto_261397 ) ( ON ?auto_261395 ?auto_261396 ) ( ON ?auto_261394 ?auto_261395 ) ( CLEAR ?auto_261392 ) ( ON ?auto_261393 ?auto_261394 ) ( CLEAR ?auto_261393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261392 ?auto_261393 )
      ( MAKE-6PILE ?auto_261392 ?auto_261393 ?auto_261394 ?auto_261395 ?auto_261396 ?auto_261397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_261418 - BLOCK
      ?auto_261419 - BLOCK
      ?auto_261420 - BLOCK
      ?auto_261421 - BLOCK
      ?auto_261422 - BLOCK
      ?auto_261423 - BLOCK
    )
    :vars
    (
      ?auto_261424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261423 ?auto_261424 ) ( not ( = ?auto_261418 ?auto_261419 ) ) ( not ( = ?auto_261418 ?auto_261420 ) ) ( not ( = ?auto_261418 ?auto_261421 ) ) ( not ( = ?auto_261418 ?auto_261422 ) ) ( not ( = ?auto_261418 ?auto_261423 ) ) ( not ( = ?auto_261418 ?auto_261424 ) ) ( not ( = ?auto_261419 ?auto_261420 ) ) ( not ( = ?auto_261419 ?auto_261421 ) ) ( not ( = ?auto_261419 ?auto_261422 ) ) ( not ( = ?auto_261419 ?auto_261423 ) ) ( not ( = ?auto_261419 ?auto_261424 ) ) ( not ( = ?auto_261420 ?auto_261421 ) ) ( not ( = ?auto_261420 ?auto_261422 ) ) ( not ( = ?auto_261420 ?auto_261423 ) ) ( not ( = ?auto_261420 ?auto_261424 ) ) ( not ( = ?auto_261421 ?auto_261422 ) ) ( not ( = ?auto_261421 ?auto_261423 ) ) ( not ( = ?auto_261421 ?auto_261424 ) ) ( not ( = ?auto_261422 ?auto_261423 ) ) ( not ( = ?auto_261422 ?auto_261424 ) ) ( not ( = ?auto_261423 ?auto_261424 ) ) ( ON ?auto_261422 ?auto_261423 ) ( ON ?auto_261421 ?auto_261422 ) ( ON ?auto_261420 ?auto_261421 ) ( ON ?auto_261419 ?auto_261420 ) ( ON ?auto_261418 ?auto_261419 ) ( CLEAR ?auto_261418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261418 )
      ( MAKE-6PILE ?auto_261418 ?auto_261419 ?auto_261420 ?auto_261421 ?auto_261422 ?auto_261423 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261445 - BLOCK
      ?auto_261446 - BLOCK
      ?auto_261447 - BLOCK
      ?auto_261448 - BLOCK
      ?auto_261449 - BLOCK
      ?auto_261450 - BLOCK
      ?auto_261451 - BLOCK
    )
    :vars
    (
      ?auto_261452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261450 ) ( ON ?auto_261451 ?auto_261452 ) ( CLEAR ?auto_261451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261445 ) ( ON ?auto_261446 ?auto_261445 ) ( ON ?auto_261447 ?auto_261446 ) ( ON ?auto_261448 ?auto_261447 ) ( ON ?auto_261449 ?auto_261448 ) ( ON ?auto_261450 ?auto_261449 ) ( not ( = ?auto_261445 ?auto_261446 ) ) ( not ( = ?auto_261445 ?auto_261447 ) ) ( not ( = ?auto_261445 ?auto_261448 ) ) ( not ( = ?auto_261445 ?auto_261449 ) ) ( not ( = ?auto_261445 ?auto_261450 ) ) ( not ( = ?auto_261445 ?auto_261451 ) ) ( not ( = ?auto_261445 ?auto_261452 ) ) ( not ( = ?auto_261446 ?auto_261447 ) ) ( not ( = ?auto_261446 ?auto_261448 ) ) ( not ( = ?auto_261446 ?auto_261449 ) ) ( not ( = ?auto_261446 ?auto_261450 ) ) ( not ( = ?auto_261446 ?auto_261451 ) ) ( not ( = ?auto_261446 ?auto_261452 ) ) ( not ( = ?auto_261447 ?auto_261448 ) ) ( not ( = ?auto_261447 ?auto_261449 ) ) ( not ( = ?auto_261447 ?auto_261450 ) ) ( not ( = ?auto_261447 ?auto_261451 ) ) ( not ( = ?auto_261447 ?auto_261452 ) ) ( not ( = ?auto_261448 ?auto_261449 ) ) ( not ( = ?auto_261448 ?auto_261450 ) ) ( not ( = ?auto_261448 ?auto_261451 ) ) ( not ( = ?auto_261448 ?auto_261452 ) ) ( not ( = ?auto_261449 ?auto_261450 ) ) ( not ( = ?auto_261449 ?auto_261451 ) ) ( not ( = ?auto_261449 ?auto_261452 ) ) ( not ( = ?auto_261450 ?auto_261451 ) ) ( not ( = ?auto_261450 ?auto_261452 ) ) ( not ( = ?auto_261451 ?auto_261452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261451 ?auto_261452 )
      ( !STACK ?auto_261451 ?auto_261450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261475 - BLOCK
      ?auto_261476 - BLOCK
      ?auto_261477 - BLOCK
      ?auto_261478 - BLOCK
      ?auto_261479 - BLOCK
      ?auto_261480 - BLOCK
      ?auto_261481 - BLOCK
    )
    :vars
    (
      ?auto_261482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261481 ?auto_261482 ) ( ON-TABLE ?auto_261475 ) ( ON ?auto_261476 ?auto_261475 ) ( ON ?auto_261477 ?auto_261476 ) ( ON ?auto_261478 ?auto_261477 ) ( ON ?auto_261479 ?auto_261478 ) ( not ( = ?auto_261475 ?auto_261476 ) ) ( not ( = ?auto_261475 ?auto_261477 ) ) ( not ( = ?auto_261475 ?auto_261478 ) ) ( not ( = ?auto_261475 ?auto_261479 ) ) ( not ( = ?auto_261475 ?auto_261480 ) ) ( not ( = ?auto_261475 ?auto_261481 ) ) ( not ( = ?auto_261475 ?auto_261482 ) ) ( not ( = ?auto_261476 ?auto_261477 ) ) ( not ( = ?auto_261476 ?auto_261478 ) ) ( not ( = ?auto_261476 ?auto_261479 ) ) ( not ( = ?auto_261476 ?auto_261480 ) ) ( not ( = ?auto_261476 ?auto_261481 ) ) ( not ( = ?auto_261476 ?auto_261482 ) ) ( not ( = ?auto_261477 ?auto_261478 ) ) ( not ( = ?auto_261477 ?auto_261479 ) ) ( not ( = ?auto_261477 ?auto_261480 ) ) ( not ( = ?auto_261477 ?auto_261481 ) ) ( not ( = ?auto_261477 ?auto_261482 ) ) ( not ( = ?auto_261478 ?auto_261479 ) ) ( not ( = ?auto_261478 ?auto_261480 ) ) ( not ( = ?auto_261478 ?auto_261481 ) ) ( not ( = ?auto_261478 ?auto_261482 ) ) ( not ( = ?auto_261479 ?auto_261480 ) ) ( not ( = ?auto_261479 ?auto_261481 ) ) ( not ( = ?auto_261479 ?auto_261482 ) ) ( not ( = ?auto_261480 ?auto_261481 ) ) ( not ( = ?auto_261480 ?auto_261482 ) ) ( not ( = ?auto_261481 ?auto_261482 ) ) ( CLEAR ?auto_261479 ) ( ON ?auto_261480 ?auto_261481 ) ( CLEAR ?auto_261480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_261475 ?auto_261476 ?auto_261477 ?auto_261478 ?auto_261479 ?auto_261480 )
      ( MAKE-7PILE ?auto_261475 ?auto_261476 ?auto_261477 ?auto_261478 ?auto_261479 ?auto_261480 ?auto_261481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261505 - BLOCK
      ?auto_261506 - BLOCK
      ?auto_261507 - BLOCK
      ?auto_261508 - BLOCK
      ?auto_261509 - BLOCK
      ?auto_261510 - BLOCK
      ?auto_261511 - BLOCK
    )
    :vars
    (
      ?auto_261512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261511 ?auto_261512 ) ( ON-TABLE ?auto_261505 ) ( ON ?auto_261506 ?auto_261505 ) ( ON ?auto_261507 ?auto_261506 ) ( ON ?auto_261508 ?auto_261507 ) ( not ( = ?auto_261505 ?auto_261506 ) ) ( not ( = ?auto_261505 ?auto_261507 ) ) ( not ( = ?auto_261505 ?auto_261508 ) ) ( not ( = ?auto_261505 ?auto_261509 ) ) ( not ( = ?auto_261505 ?auto_261510 ) ) ( not ( = ?auto_261505 ?auto_261511 ) ) ( not ( = ?auto_261505 ?auto_261512 ) ) ( not ( = ?auto_261506 ?auto_261507 ) ) ( not ( = ?auto_261506 ?auto_261508 ) ) ( not ( = ?auto_261506 ?auto_261509 ) ) ( not ( = ?auto_261506 ?auto_261510 ) ) ( not ( = ?auto_261506 ?auto_261511 ) ) ( not ( = ?auto_261506 ?auto_261512 ) ) ( not ( = ?auto_261507 ?auto_261508 ) ) ( not ( = ?auto_261507 ?auto_261509 ) ) ( not ( = ?auto_261507 ?auto_261510 ) ) ( not ( = ?auto_261507 ?auto_261511 ) ) ( not ( = ?auto_261507 ?auto_261512 ) ) ( not ( = ?auto_261508 ?auto_261509 ) ) ( not ( = ?auto_261508 ?auto_261510 ) ) ( not ( = ?auto_261508 ?auto_261511 ) ) ( not ( = ?auto_261508 ?auto_261512 ) ) ( not ( = ?auto_261509 ?auto_261510 ) ) ( not ( = ?auto_261509 ?auto_261511 ) ) ( not ( = ?auto_261509 ?auto_261512 ) ) ( not ( = ?auto_261510 ?auto_261511 ) ) ( not ( = ?auto_261510 ?auto_261512 ) ) ( not ( = ?auto_261511 ?auto_261512 ) ) ( ON ?auto_261510 ?auto_261511 ) ( CLEAR ?auto_261508 ) ( ON ?auto_261509 ?auto_261510 ) ( CLEAR ?auto_261509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_261505 ?auto_261506 ?auto_261507 ?auto_261508 ?auto_261509 )
      ( MAKE-7PILE ?auto_261505 ?auto_261506 ?auto_261507 ?auto_261508 ?auto_261509 ?auto_261510 ?auto_261511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261535 - BLOCK
      ?auto_261536 - BLOCK
      ?auto_261537 - BLOCK
      ?auto_261538 - BLOCK
      ?auto_261539 - BLOCK
      ?auto_261540 - BLOCK
      ?auto_261541 - BLOCK
    )
    :vars
    (
      ?auto_261542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261541 ?auto_261542 ) ( ON-TABLE ?auto_261535 ) ( ON ?auto_261536 ?auto_261535 ) ( ON ?auto_261537 ?auto_261536 ) ( not ( = ?auto_261535 ?auto_261536 ) ) ( not ( = ?auto_261535 ?auto_261537 ) ) ( not ( = ?auto_261535 ?auto_261538 ) ) ( not ( = ?auto_261535 ?auto_261539 ) ) ( not ( = ?auto_261535 ?auto_261540 ) ) ( not ( = ?auto_261535 ?auto_261541 ) ) ( not ( = ?auto_261535 ?auto_261542 ) ) ( not ( = ?auto_261536 ?auto_261537 ) ) ( not ( = ?auto_261536 ?auto_261538 ) ) ( not ( = ?auto_261536 ?auto_261539 ) ) ( not ( = ?auto_261536 ?auto_261540 ) ) ( not ( = ?auto_261536 ?auto_261541 ) ) ( not ( = ?auto_261536 ?auto_261542 ) ) ( not ( = ?auto_261537 ?auto_261538 ) ) ( not ( = ?auto_261537 ?auto_261539 ) ) ( not ( = ?auto_261537 ?auto_261540 ) ) ( not ( = ?auto_261537 ?auto_261541 ) ) ( not ( = ?auto_261537 ?auto_261542 ) ) ( not ( = ?auto_261538 ?auto_261539 ) ) ( not ( = ?auto_261538 ?auto_261540 ) ) ( not ( = ?auto_261538 ?auto_261541 ) ) ( not ( = ?auto_261538 ?auto_261542 ) ) ( not ( = ?auto_261539 ?auto_261540 ) ) ( not ( = ?auto_261539 ?auto_261541 ) ) ( not ( = ?auto_261539 ?auto_261542 ) ) ( not ( = ?auto_261540 ?auto_261541 ) ) ( not ( = ?auto_261540 ?auto_261542 ) ) ( not ( = ?auto_261541 ?auto_261542 ) ) ( ON ?auto_261540 ?auto_261541 ) ( ON ?auto_261539 ?auto_261540 ) ( CLEAR ?auto_261537 ) ( ON ?auto_261538 ?auto_261539 ) ( CLEAR ?auto_261538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_261535 ?auto_261536 ?auto_261537 ?auto_261538 )
      ( MAKE-7PILE ?auto_261535 ?auto_261536 ?auto_261537 ?auto_261538 ?auto_261539 ?auto_261540 ?auto_261541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261565 - BLOCK
      ?auto_261566 - BLOCK
      ?auto_261567 - BLOCK
      ?auto_261568 - BLOCK
      ?auto_261569 - BLOCK
      ?auto_261570 - BLOCK
      ?auto_261571 - BLOCK
    )
    :vars
    (
      ?auto_261572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261571 ?auto_261572 ) ( ON-TABLE ?auto_261565 ) ( ON ?auto_261566 ?auto_261565 ) ( not ( = ?auto_261565 ?auto_261566 ) ) ( not ( = ?auto_261565 ?auto_261567 ) ) ( not ( = ?auto_261565 ?auto_261568 ) ) ( not ( = ?auto_261565 ?auto_261569 ) ) ( not ( = ?auto_261565 ?auto_261570 ) ) ( not ( = ?auto_261565 ?auto_261571 ) ) ( not ( = ?auto_261565 ?auto_261572 ) ) ( not ( = ?auto_261566 ?auto_261567 ) ) ( not ( = ?auto_261566 ?auto_261568 ) ) ( not ( = ?auto_261566 ?auto_261569 ) ) ( not ( = ?auto_261566 ?auto_261570 ) ) ( not ( = ?auto_261566 ?auto_261571 ) ) ( not ( = ?auto_261566 ?auto_261572 ) ) ( not ( = ?auto_261567 ?auto_261568 ) ) ( not ( = ?auto_261567 ?auto_261569 ) ) ( not ( = ?auto_261567 ?auto_261570 ) ) ( not ( = ?auto_261567 ?auto_261571 ) ) ( not ( = ?auto_261567 ?auto_261572 ) ) ( not ( = ?auto_261568 ?auto_261569 ) ) ( not ( = ?auto_261568 ?auto_261570 ) ) ( not ( = ?auto_261568 ?auto_261571 ) ) ( not ( = ?auto_261568 ?auto_261572 ) ) ( not ( = ?auto_261569 ?auto_261570 ) ) ( not ( = ?auto_261569 ?auto_261571 ) ) ( not ( = ?auto_261569 ?auto_261572 ) ) ( not ( = ?auto_261570 ?auto_261571 ) ) ( not ( = ?auto_261570 ?auto_261572 ) ) ( not ( = ?auto_261571 ?auto_261572 ) ) ( ON ?auto_261570 ?auto_261571 ) ( ON ?auto_261569 ?auto_261570 ) ( ON ?auto_261568 ?auto_261569 ) ( CLEAR ?auto_261566 ) ( ON ?auto_261567 ?auto_261568 ) ( CLEAR ?auto_261567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_261565 ?auto_261566 ?auto_261567 )
      ( MAKE-7PILE ?auto_261565 ?auto_261566 ?auto_261567 ?auto_261568 ?auto_261569 ?auto_261570 ?auto_261571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261595 - BLOCK
      ?auto_261596 - BLOCK
      ?auto_261597 - BLOCK
      ?auto_261598 - BLOCK
      ?auto_261599 - BLOCK
      ?auto_261600 - BLOCK
      ?auto_261601 - BLOCK
    )
    :vars
    (
      ?auto_261602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261601 ?auto_261602 ) ( ON-TABLE ?auto_261595 ) ( not ( = ?auto_261595 ?auto_261596 ) ) ( not ( = ?auto_261595 ?auto_261597 ) ) ( not ( = ?auto_261595 ?auto_261598 ) ) ( not ( = ?auto_261595 ?auto_261599 ) ) ( not ( = ?auto_261595 ?auto_261600 ) ) ( not ( = ?auto_261595 ?auto_261601 ) ) ( not ( = ?auto_261595 ?auto_261602 ) ) ( not ( = ?auto_261596 ?auto_261597 ) ) ( not ( = ?auto_261596 ?auto_261598 ) ) ( not ( = ?auto_261596 ?auto_261599 ) ) ( not ( = ?auto_261596 ?auto_261600 ) ) ( not ( = ?auto_261596 ?auto_261601 ) ) ( not ( = ?auto_261596 ?auto_261602 ) ) ( not ( = ?auto_261597 ?auto_261598 ) ) ( not ( = ?auto_261597 ?auto_261599 ) ) ( not ( = ?auto_261597 ?auto_261600 ) ) ( not ( = ?auto_261597 ?auto_261601 ) ) ( not ( = ?auto_261597 ?auto_261602 ) ) ( not ( = ?auto_261598 ?auto_261599 ) ) ( not ( = ?auto_261598 ?auto_261600 ) ) ( not ( = ?auto_261598 ?auto_261601 ) ) ( not ( = ?auto_261598 ?auto_261602 ) ) ( not ( = ?auto_261599 ?auto_261600 ) ) ( not ( = ?auto_261599 ?auto_261601 ) ) ( not ( = ?auto_261599 ?auto_261602 ) ) ( not ( = ?auto_261600 ?auto_261601 ) ) ( not ( = ?auto_261600 ?auto_261602 ) ) ( not ( = ?auto_261601 ?auto_261602 ) ) ( ON ?auto_261600 ?auto_261601 ) ( ON ?auto_261599 ?auto_261600 ) ( ON ?auto_261598 ?auto_261599 ) ( ON ?auto_261597 ?auto_261598 ) ( CLEAR ?auto_261595 ) ( ON ?auto_261596 ?auto_261597 ) ( CLEAR ?auto_261596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261595 ?auto_261596 )
      ( MAKE-7PILE ?auto_261595 ?auto_261596 ?auto_261597 ?auto_261598 ?auto_261599 ?auto_261600 ?auto_261601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_261625 - BLOCK
      ?auto_261626 - BLOCK
      ?auto_261627 - BLOCK
      ?auto_261628 - BLOCK
      ?auto_261629 - BLOCK
      ?auto_261630 - BLOCK
      ?auto_261631 - BLOCK
    )
    :vars
    (
      ?auto_261632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261631 ?auto_261632 ) ( not ( = ?auto_261625 ?auto_261626 ) ) ( not ( = ?auto_261625 ?auto_261627 ) ) ( not ( = ?auto_261625 ?auto_261628 ) ) ( not ( = ?auto_261625 ?auto_261629 ) ) ( not ( = ?auto_261625 ?auto_261630 ) ) ( not ( = ?auto_261625 ?auto_261631 ) ) ( not ( = ?auto_261625 ?auto_261632 ) ) ( not ( = ?auto_261626 ?auto_261627 ) ) ( not ( = ?auto_261626 ?auto_261628 ) ) ( not ( = ?auto_261626 ?auto_261629 ) ) ( not ( = ?auto_261626 ?auto_261630 ) ) ( not ( = ?auto_261626 ?auto_261631 ) ) ( not ( = ?auto_261626 ?auto_261632 ) ) ( not ( = ?auto_261627 ?auto_261628 ) ) ( not ( = ?auto_261627 ?auto_261629 ) ) ( not ( = ?auto_261627 ?auto_261630 ) ) ( not ( = ?auto_261627 ?auto_261631 ) ) ( not ( = ?auto_261627 ?auto_261632 ) ) ( not ( = ?auto_261628 ?auto_261629 ) ) ( not ( = ?auto_261628 ?auto_261630 ) ) ( not ( = ?auto_261628 ?auto_261631 ) ) ( not ( = ?auto_261628 ?auto_261632 ) ) ( not ( = ?auto_261629 ?auto_261630 ) ) ( not ( = ?auto_261629 ?auto_261631 ) ) ( not ( = ?auto_261629 ?auto_261632 ) ) ( not ( = ?auto_261630 ?auto_261631 ) ) ( not ( = ?auto_261630 ?auto_261632 ) ) ( not ( = ?auto_261631 ?auto_261632 ) ) ( ON ?auto_261630 ?auto_261631 ) ( ON ?auto_261629 ?auto_261630 ) ( ON ?auto_261628 ?auto_261629 ) ( ON ?auto_261627 ?auto_261628 ) ( ON ?auto_261626 ?auto_261627 ) ( ON ?auto_261625 ?auto_261626 ) ( CLEAR ?auto_261625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261625 )
      ( MAKE-7PILE ?auto_261625 ?auto_261626 ?auto_261627 ?auto_261628 ?auto_261629 ?auto_261630 ?auto_261631 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261656 - BLOCK
      ?auto_261657 - BLOCK
      ?auto_261658 - BLOCK
      ?auto_261659 - BLOCK
      ?auto_261660 - BLOCK
      ?auto_261661 - BLOCK
      ?auto_261662 - BLOCK
      ?auto_261663 - BLOCK
    )
    :vars
    (
      ?auto_261664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261662 ) ( ON ?auto_261663 ?auto_261664 ) ( CLEAR ?auto_261663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261656 ) ( ON ?auto_261657 ?auto_261656 ) ( ON ?auto_261658 ?auto_261657 ) ( ON ?auto_261659 ?auto_261658 ) ( ON ?auto_261660 ?auto_261659 ) ( ON ?auto_261661 ?auto_261660 ) ( ON ?auto_261662 ?auto_261661 ) ( not ( = ?auto_261656 ?auto_261657 ) ) ( not ( = ?auto_261656 ?auto_261658 ) ) ( not ( = ?auto_261656 ?auto_261659 ) ) ( not ( = ?auto_261656 ?auto_261660 ) ) ( not ( = ?auto_261656 ?auto_261661 ) ) ( not ( = ?auto_261656 ?auto_261662 ) ) ( not ( = ?auto_261656 ?auto_261663 ) ) ( not ( = ?auto_261656 ?auto_261664 ) ) ( not ( = ?auto_261657 ?auto_261658 ) ) ( not ( = ?auto_261657 ?auto_261659 ) ) ( not ( = ?auto_261657 ?auto_261660 ) ) ( not ( = ?auto_261657 ?auto_261661 ) ) ( not ( = ?auto_261657 ?auto_261662 ) ) ( not ( = ?auto_261657 ?auto_261663 ) ) ( not ( = ?auto_261657 ?auto_261664 ) ) ( not ( = ?auto_261658 ?auto_261659 ) ) ( not ( = ?auto_261658 ?auto_261660 ) ) ( not ( = ?auto_261658 ?auto_261661 ) ) ( not ( = ?auto_261658 ?auto_261662 ) ) ( not ( = ?auto_261658 ?auto_261663 ) ) ( not ( = ?auto_261658 ?auto_261664 ) ) ( not ( = ?auto_261659 ?auto_261660 ) ) ( not ( = ?auto_261659 ?auto_261661 ) ) ( not ( = ?auto_261659 ?auto_261662 ) ) ( not ( = ?auto_261659 ?auto_261663 ) ) ( not ( = ?auto_261659 ?auto_261664 ) ) ( not ( = ?auto_261660 ?auto_261661 ) ) ( not ( = ?auto_261660 ?auto_261662 ) ) ( not ( = ?auto_261660 ?auto_261663 ) ) ( not ( = ?auto_261660 ?auto_261664 ) ) ( not ( = ?auto_261661 ?auto_261662 ) ) ( not ( = ?auto_261661 ?auto_261663 ) ) ( not ( = ?auto_261661 ?auto_261664 ) ) ( not ( = ?auto_261662 ?auto_261663 ) ) ( not ( = ?auto_261662 ?auto_261664 ) ) ( not ( = ?auto_261663 ?auto_261664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261663 ?auto_261664 )
      ( !STACK ?auto_261663 ?auto_261662 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261690 - BLOCK
      ?auto_261691 - BLOCK
      ?auto_261692 - BLOCK
      ?auto_261693 - BLOCK
      ?auto_261694 - BLOCK
      ?auto_261695 - BLOCK
      ?auto_261696 - BLOCK
      ?auto_261697 - BLOCK
    )
    :vars
    (
      ?auto_261698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261697 ?auto_261698 ) ( ON-TABLE ?auto_261690 ) ( ON ?auto_261691 ?auto_261690 ) ( ON ?auto_261692 ?auto_261691 ) ( ON ?auto_261693 ?auto_261692 ) ( ON ?auto_261694 ?auto_261693 ) ( ON ?auto_261695 ?auto_261694 ) ( not ( = ?auto_261690 ?auto_261691 ) ) ( not ( = ?auto_261690 ?auto_261692 ) ) ( not ( = ?auto_261690 ?auto_261693 ) ) ( not ( = ?auto_261690 ?auto_261694 ) ) ( not ( = ?auto_261690 ?auto_261695 ) ) ( not ( = ?auto_261690 ?auto_261696 ) ) ( not ( = ?auto_261690 ?auto_261697 ) ) ( not ( = ?auto_261690 ?auto_261698 ) ) ( not ( = ?auto_261691 ?auto_261692 ) ) ( not ( = ?auto_261691 ?auto_261693 ) ) ( not ( = ?auto_261691 ?auto_261694 ) ) ( not ( = ?auto_261691 ?auto_261695 ) ) ( not ( = ?auto_261691 ?auto_261696 ) ) ( not ( = ?auto_261691 ?auto_261697 ) ) ( not ( = ?auto_261691 ?auto_261698 ) ) ( not ( = ?auto_261692 ?auto_261693 ) ) ( not ( = ?auto_261692 ?auto_261694 ) ) ( not ( = ?auto_261692 ?auto_261695 ) ) ( not ( = ?auto_261692 ?auto_261696 ) ) ( not ( = ?auto_261692 ?auto_261697 ) ) ( not ( = ?auto_261692 ?auto_261698 ) ) ( not ( = ?auto_261693 ?auto_261694 ) ) ( not ( = ?auto_261693 ?auto_261695 ) ) ( not ( = ?auto_261693 ?auto_261696 ) ) ( not ( = ?auto_261693 ?auto_261697 ) ) ( not ( = ?auto_261693 ?auto_261698 ) ) ( not ( = ?auto_261694 ?auto_261695 ) ) ( not ( = ?auto_261694 ?auto_261696 ) ) ( not ( = ?auto_261694 ?auto_261697 ) ) ( not ( = ?auto_261694 ?auto_261698 ) ) ( not ( = ?auto_261695 ?auto_261696 ) ) ( not ( = ?auto_261695 ?auto_261697 ) ) ( not ( = ?auto_261695 ?auto_261698 ) ) ( not ( = ?auto_261696 ?auto_261697 ) ) ( not ( = ?auto_261696 ?auto_261698 ) ) ( not ( = ?auto_261697 ?auto_261698 ) ) ( CLEAR ?auto_261695 ) ( ON ?auto_261696 ?auto_261697 ) ( CLEAR ?auto_261696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_261690 ?auto_261691 ?auto_261692 ?auto_261693 ?auto_261694 ?auto_261695 ?auto_261696 )
      ( MAKE-8PILE ?auto_261690 ?auto_261691 ?auto_261692 ?auto_261693 ?auto_261694 ?auto_261695 ?auto_261696 ?auto_261697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261724 - BLOCK
      ?auto_261725 - BLOCK
      ?auto_261726 - BLOCK
      ?auto_261727 - BLOCK
      ?auto_261728 - BLOCK
      ?auto_261729 - BLOCK
      ?auto_261730 - BLOCK
      ?auto_261731 - BLOCK
    )
    :vars
    (
      ?auto_261732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261731 ?auto_261732 ) ( ON-TABLE ?auto_261724 ) ( ON ?auto_261725 ?auto_261724 ) ( ON ?auto_261726 ?auto_261725 ) ( ON ?auto_261727 ?auto_261726 ) ( ON ?auto_261728 ?auto_261727 ) ( not ( = ?auto_261724 ?auto_261725 ) ) ( not ( = ?auto_261724 ?auto_261726 ) ) ( not ( = ?auto_261724 ?auto_261727 ) ) ( not ( = ?auto_261724 ?auto_261728 ) ) ( not ( = ?auto_261724 ?auto_261729 ) ) ( not ( = ?auto_261724 ?auto_261730 ) ) ( not ( = ?auto_261724 ?auto_261731 ) ) ( not ( = ?auto_261724 ?auto_261732 ) ) ( not ( = ?auto_261725 ?auto_261726 ) ) ( not ( = ?auto_261725 ?auto_261727 ) ) ( not ( = ?auto_261725 ?auto_261728 ) ) ( not ( = ?auto_261725 ?auto_261729 ) ) ( not ( = ?auto_261725 ?auto_261730 ) ) ( not ( = ?auto_261725 ?auto_261731 ) ) ( not ( = ?auto_261725 ?auto_261732 ) ) ( not ( = ?auto_261726 ?auto_261727 ) ) ( not ( = ?auto_261726 ?auto_261728 ) ) ( not ( = ?auto_261726 ?auto_261729 ) ) ( not ( = ?auto_261726 ?auto_261730 ) ) ( not ( = ?auto_261726 ?auto_261731 ) ) ( not ( = ?auto_261726 ?auto_261732 ) ) ( not ( = ?auto_261727 ?auto_261728 ) ) ( not ( = ?auto_261727 ?auto_261729 ) ) ( not ( = ?auto_261727 ?auto_261730 ) ) ( not ( = ?auto_261727 ?auto_261731 ) ) ( not ( = ?auto_261727 ?auto_261732 ) ) ( not ( = ?auto_261728 ?auto_261729 ) ) ( not ( = ?auto_261728 ?auto_261730 ) ) ( not ( = ?auto_261728 ?auto_261731 ) ) ( not ( = ?auto_261728 ?auto_261732 ) ) ( not ( = ?auto_261729 ?auto_261730 ) ) ( not ( = ?auto_261729 ?auto_261731 ) ) ( not ( = ?auto_261729 ?auto_261732 ) ) ( not ( = ?auto_261730 ?auto_261731 ) ) ( not ( = ?auto_261730 ?auto_261732 ) ) ( not ( = ?auto_261731 ?auto_261732 ) ) ( ON ?auto_261730 ?auto_261731 ) ( CLEAR ?auto_261728 ) ( ON ?auto_261729 ?auto_261730 ) ( CLEAR ?auto_261729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_261724 ?auto_261725 ?auto_261726 ?auto_261727 ?auto_261728 ?auto_261729 )
      ( MAKE-8PILE ?auto_261724 ?auto_261725 ?auto_261726 ?auto_261727 ?auto_261728 ?auto_261729 ?auto_261730 ?auto_261731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261758 - BLOCK
      ?auto_261759 - BLOCK
      ?auto_261760 - BLOCK
      ?auto_261761 - BLOCK
      ?auto_261762 - BLOCK
      ?auto_261763 - BLOCK
      ?auto_261764 - BLOCK
      ?auto_261765 - BLOCK
    )
    :vars
    (
      ?auto_261766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261765 ?auto_261766 ) ( ON-TABLE ?auto_261758 ) ( ON ?auto_261759 ?auto_261758 ) ( ON ?auto_261760 ?auto_261759 ) ( ON ?auto_261761 ?auto_261760 ) ( not ( = ?auto_261758 ?auto_261759 ) ) ( not ( = ?auto_261758 ?auto_261760 ) ) ( not ( = ?auto_261758 ?auto_261761 ) ) ( not ( = ?auto_261758 ?auto_261762 ) ) ( not ( = ?auto_261758 ?auto_261763 ) ) ( not ( = ?auto_261758 ?auto_261764 ) ) ( not ( = ?auto_261758 ?auto_261765 ) ) ( not ( = ?auto_261758 ?auto_261766 ) ) ( not ( = ?auto_261759 ?auto_261760 ) ) ( not ( = ?auto_261759 ?auto_261761 ) ) ( not ( = ?auto_261759 ?auto_261762 ) ) ( not ( = ?auto_261759 ?auto_261763 ) ) ( not ( = ?auto_261759 ?auto_261764 ) ) ( not ( = ?auto_261759 ?auto_261765 ) ) ( not ( = ?auto_261759 ?auto_261766 ) ) ( not ( = ?auto_261760 ?auto_261761 ) ) ( not ( = ?auto_261760 ?auto_261762 ) ) ( not ( = ?auto_261760 ?auto_261763 ) ) ( not ( = ?auto_261760 ?auto_261764 ) ) ( not ( = ?auto_261760 ?auto_261765 ) ) ( not ( = ?auto_261760 ?auto_261766 ) ) ( not ( = ?auto_261761 ?auto_261762 ) ) ( not ( = ?auto_261761 ?auto_261763 ) ) ( not ( = ?auto_261761 ?auto_261764 ) ) ( not ( = ?auto_261761 ?auto_261765 ) ) ( not ( = ?auto_261761 ?auto_261766 ) ) ( not ( = ?auto_261762 ?auto_261763 ) ) ( not ( = ?auto_261762 ?auto_261764 ) ) ( not ( = ?auto_261762 ?auto_261765 ) ) ( not ( = ?auto_261762 ?auto_261766 ) ) ( not ( = ?auto_261763 ?auto_261764 ) ) ( not ( = ?auto_261763 ?auto_261765 ) ) ( not ( = ?auto_261763 ?auto_261766 ) ) ( not ( = ?auto_261764 ?auto_261765 ) ) ( not ( = ?auto_261764 ?auto_261766 ) ) ( not ( = ?auto_261765 ?auto_261766 ) ) ( ON ?auto_261764 ?auto_261765 ) ( ON ?auto_261763 ?auto_261764 ) ( CLEAR ?auto_261761 ) ( ON ?auto_261762 ?auto_261763 ) ( CLEAR ?auto_261762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_261758 ?auto_261759 ?auto_261760 ?auto_261761 ?auto_261762 )
      ( MAKE-8PILE ?auto_261758 ?auto_261759 ?auto_261760 ?auto_261761 ?auto_261762 ?auto_261763 ?auto_261764 ?auto_261765 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261792 - BLOCK
      ?auto_261793 - BLOCK
      ?auto_261794 - BLOCK
      ?auto_261795 - BLOCK
      ?auto_261796 - BLOCK
      ?auto_261797 - BLOCK
      ?auto_261798 - BLOCK
      ?auto_261799 - BLOCK
    )
    :vars
    (
      ?auto_261800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261799 ?auto_261800 ) ( ON-TABLE ?auto_261792 ) ( ON ?auto_261793 ?auto_261792 ) ( ON ?auto_261794 ?auto_261793 ) ( not ( = ?auto_261792 ?auto_261793 ) ) ( not ( = ?auto_261792 ?auto_261794 ) ) ( not ( = ?auto_261792 ?auto_261795 ) ) ( not ( = ?auto_261792 ?auto_261796 ) ) ( not ( = ?auto_261792 ?auto_261797 ) ) ( not ( = ?auto_261792 ?auto_261798 ) ) ( not ( = ?auto_261792 ?auto_261799 ) ) ( not ( = ?auto_261792 ?auto_261800 ) ) ( not ( = ?auto_261793 ?auto_261794 ) ) ( not ( = ?auto_261793 ?auto_261795 ) ) ( not ( = ?auto_261793 ?auto_261796 ) ) ( not ( = ?auto_261793 ?auto_261797 ) ) ( not ( = ?auto_261793 ?auto_261798 ) ) ( not ( = ?auto_261793 ?auto_261799 ) ) ( not ( = ?auto_261793 ?auto_261800 ) ) ( not ( = ?auto_261794 ?auto_261795 ) ) ( not ( = ?auto_261794 ?auto_261796 ) ) ( not ( = ?auto_261794 ?auto_261797 ) ) ( not ( = ?auto_261794 ?auto_261798 ) ) ( not ( = ?auto_261794 ?auto_261799 ) ) ( not ( = ?auto_261794 ?auto_261800 ) ) ( not ( = ?auto_261795 ?auto_261796 ) ) ( not ( = ?auto_261795 ?auto_261797 ) ) ( not ( = ?auto_261795 ?auto_261798 ) ) ( not ( = ?auto_261795 ?auto_261799 ) ) ( not ( = ?auto_261795 ?auto_261800 ) ) ( not ( = ?auto_261796 ?auto_261797 ) ) ( not ( = ?auto_261796 ?auto_261798 ) ) ( not ( = ?auto_261796 ?auto_261799 ) ) ( not ( = ?auto_261796 ?auto_261800 ) ) ( not ( = ?auto_261797 ?auto_261798 ) ) ( not ( = ?auto_261797 ?auto_261799 ) ) ( not ( = ?auto_261797 ?auto_261800 ) ) ( not ( = ?auto_261798 ?auto_261799 ) ) ( not ( = ?auto_261798 ?auto_261800 ) ) ( not ( = ?auto_261799 ?auto_261800 ) ) ( ON ?auto_261798 ?auto_261799 ) ( ON ?auto_261797 ?auto_261798 ) ( ON ?auto_261796 ?auto_261797 ) ( CLEAR ?auto_261794 ) ( ON ?auto_261795 ?auto_261796 ) ( CLEAR ?auto_261795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_261792 ?auto_261793 ?auto_261794 ?auto_261795 )
      ( MAKE-8PILE ?auto_261792 ?auto_261793 ?auto_261794 ?auto_261795 ?auto_261796 ?auto_261797 ?auto_261798 ?auto_261799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261826 - BLOCK
      ?auto_261827 - BLOCK
      ?auto_261828 - BLOCK
      ?auto_261829 - BLOCK
      ?auto_261830 - BLOCK
      ?auto_261831 - BLOCK
      ?auto_261832 - BLOCK
      ?auto_261833 - BLOCK
    )
    :vars
    (
      ?auto_261834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261833 ?auto_261834 ) ( ON-TABLE ?auto_261826 ) ( ON ?auto_261827 ?auto_261826 ) ( not ( = ?auto_261826 ?auto_261827 ) ) ( not ( = ?auto_261826 ?auto_261828 ) ) ( not ( = ?auto_261826 ?auto_261829 ) ) ( not ( = ?auto_261826 ?auto_261830 ) ) ( not ( = ?auto_261826 ?auto_261831 ) ) ( not ( = ?auto_261826 ?auto_261832 ) ) ( not ( = ?auto_261826 ?auto_261833 ) ) ( not ( = ?auto_261826 ?auto_261834 ) ) ( not ( = ?auto_261827 ?auto_261828 ) ) ( not ( = ?auto_261827 ?auto_261829 ) ) ( not ( = ?auto_261827 ?auto_261830 ) ) ( not ( = ?auto_261827 ?auto_261831 ) ) ( not ( = ?auto_261827 ?auto_261832 ) ) ( not ( = ?auto_261827 ?auto_261833 ) ) ( not ( = ?auto_261827 ?auto_261834 ) ) ( not ( = ?auto_261828 ?auto_261829 ) ) ( not ( = ?auto_261828 ?auto_261830 ) ) ( not ( = ?auto_261828 ?auto_261831 ) ) ( not ( = ?auto_261828 ?auto_261832 ) ) ( not ( = ?auto_261828 ?auto_261833 ) ) ( not ( = ?auto_261828 ?auto_261834 ) ) ( not ( = ?auto_261829 ?auto_261830 ) ) ( not ( = ?auto_261829 ?auto_261831 ) ) ( not ( = ?auto_261829 ?auto_261832 ) ) ( not ( = ?auto_261829 ?auto_261833 ) ) ( not ( = ?auto_261829 ?auto_261834 ) ) ( not ( = ?auto_261830 ?auto_261831 ) ) ( not ( = ?auto_261830 ?auto_261832 ) ) ( not ( = ?auto_261830 ?auto_261833 ) ) ( not ( = ?auto_261830 ?auto_261834 ) ) ( not ( = ?auto_261831 ?auto_261832 ) ) ( not ( = ?auto_261831 ?auto_261833 ) ) ( not ( = ?auto_261831 ?auto_261834 ) ) ( not ( = ?auto_261832 ?auto_261833 ) ) ( not ( = ?auto_261832 ?auto_261834 ) ) ( not ( = ?auto_261833 ?auto_261834 ) ) ( ON ?auto_261832 ?auto_261833 ) ( ON ?auto_261831 ?auto_261832 ) ( ON ?auto_261830 ?auto_261831 ) ( ON ?auto_261829 ?auto_261830 ) ( CLEAR ?auto_261827 ) ( ON ?auto_261828 ?auto_261829 ) ( CLEAR ?auto_261828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_261826 ?auto_261827 ?auto_261828 )
      ( MAKE-8PILE ?auto_261826 ?auto_261827 ?auto_261828 ?auto_261829 ?auto_261830 ?auto_261831 ?auto_261832 ?auto_261833 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261860 - BLOCK
      ?auto_261861 - BLOCK
      ?auto_261862 - BLOCK
      ?auto_261863 - BLOCK
      ?auto_261864 - BLOCK
      ?auto_261865 - BLOCK
      ?auto_261866 - BLOCK
      ?auto_261867 - BLOCK
    )
    :vars
    (
      ?auto_261868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261867 ?auto_261868 ) ( ON-TABLE ?auto_261860 ) ( not ( = ?auto_261860 ?auto_261861 ) ) ( not ( = ?auto_261860 ?auto_261862 ) ) ( not ( = ?auto_261860 ?auto_261863 ) ) ( not ( = ?auto_261860 ?auto_261864 ) ) ( not ( = ?auto_261860 ?auto_261865 ) ) ( not ( = ?auto_261860 ?auto_261866 ) ) ( not ( = ?auto_261860 ?auto_261867 ) ) ( not ( = ?auto_261860 ?auto_261868 ) ) ( not ( = ?auto_261861 ?auto_261862 ) ) ( not ( = ?auto_261861 ?auto_261863 ) ) ( not ( = ?auto_261861 ?auto_261864 ) ) ( not ( = ?auto_261861 ?auto_261865 ) ) ( not ( = ?auto_261861 ?auto_261866 ) ) ( not ( = ?auto_261861 ?auto_261867 ) ) ( not ( = ?auto_261861 ?auto_261868 ) ) ( not ( = ?auto_261862 ?auto_261863 ) ) ( not ( = ?auto_261862 ?auto_261864 ) ) ( not ( = ?auto_261862 ?auto_261865 ) ) ( not ( = ?auto_261862 ?auto_261866 ) ) ( not ( = ?auto_261862 ?auto_261867 ) ) ( not ( = ?auto_261862 ?auto_261868 ) ) ( not ( = ?auto_261863 ?auto_261864 ) ) ( not ( = ?auto_261863 ?auto_261865 ) ) ( not ( = ?auto_261863 ?auto_261866 ) ) ( not ( = ?auto_261863 ?auto_261867 ) ) ( not ( = ?auto_261863 ?auto_261868 ) ) ( not ( = ?auto_261864 ?auto_261865 ) ) ( not ( = ?auto_261864 ?auto_261866 ) ) ( not ( = ?auto_261864 ?auto_261867 ) ) ( not ( = ?auto_261864 ?auto_261868 ) ) ( not ( = ?auto_261865 ?auto_261866 ) ) ( not ( = ?auto_261865 ?auto_261867 ) ) ( not ( = ?auto_261865 ?auto_261868 ) ) ( not ( = ?auto_261866 ?auto_261867 ) ) ( not ( = ?auto_261866 ?auto_261868 ) ) ( not ( = ?auto_261867 ?auto_261868 ) ) ( ON ?auto_261866 ?auto_261867 ) ( ON ?auto_261865 ?auto_261866 ) ( ON ?auto_261864 ?auto_261865 ) ( ON ?auto_261863 ?auto_261864 ) ( ON ?auto_261862 ?auto_261863 ) ( CLEAR ?auto_261860 ) ( ON ?auto_261861 ?auto_261862 ) ( CLEAR ?auto_261861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_261860 ?auto_261861 )
      ( MAKE-8PILE ?auto_261860 ?auto_261861 ?auto_261862 ?auto_261863 ?auto_261864 ?auto_261865 ?auto_261866 ?auto_261867 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_261894 - BLOCK
      ?auto_261895 - BLOCK
      ?auto_261896 - BLOCK
      ?auto_261897 - BLOCK
      ?auto_261898 - BLOCK
      ?auto_261899 - BLOCK
      ?auto_261900 - BLOCK
      ?auto_261901 - BLOCK
    )
    :vars
    (
      ?auto_261902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261901 ?auto_261902 ) ( not ( = ?auto_261894 ?auto_261895 ) ) ( not ( = ?auto_261894 ?auto_261896 ) ) ( not ( = ?auto_261894 ?auto_261897 ) ) ( not ( = ?auto_261894 ?auto_261898 ) ) ( not ( = ?auto_261894 ?auto_261899 ) ) ( not ( = ?auto_261894 ?auto_261900 ) ) ( not ( = ?auto_261894 ?auto_261901 ) ) ( not ( = ?auto_261894 ?auto_261902 ) ) ( not ( = ?auto_261895 ?auto_261896 ) ) ( not ( = ?auto_261895 ?auto_261897 ) ) ( not ( = ?auto_261895 ?auto_261898 ) ) ( not ( = ?auto_261895 ?auto_261899 ) ) ( not ( = ?auto_261895 ?auto_261900 ) ) ( not ( = ?auto_261895 ?auto_261901 ) ) ( not ( = ?auto_261895 ?auto_261902 ) ) ( not ( = ?auto_261896 ?auto_261897 ) ) ( not ( = ?auto_261896 ?auto_261898 ) ) ( not ( = ?auto_261896 ?auto_261899 ) ) ( not ( = ?auto_261896 ?auto_261900 ) ) ( not ( = ?auto_261896 ?auto_261901 ) ) ( not ( = ?auto_261896 ?auto_261902 ) ) ( not ( = ?auto_261897 ?auto_261898 ) ) ( not ( = ?auto_261897 ?auto_261899 ) ) ( not ( = ?auto_261897 ?auto_261900 ) ) ( not ( = ?auto_261897 ?auto_261901 ) ) ( not ( = ?auto_261897 ?auto_261902 ) ) ( not ( = ?auto_261898 ?auto_261899 ) ) ( not ( = ?auto_261898 ?auto_261900 ) ) ( not ( = ?auto_261898 ?auto_261901 ) ) ( not ( = ?auto_261898 ?auto_261902 ) ) ( not ( = ?auto_261899 ?auto_261900 ) ) ( not ( = ?auto_261899 ?auto_261901 ) ) ( not ( = ?auto_261899 ?auto_261902 ) ) ( not ( = ?auto_261900 ?auto_261901 ) ) ( not ( = ?auto_261900 ?auto_261902 ) ) ( not ( = ?auto_261901 ?auto_261902 ) ) ( ON ?auto_261900 ?auto_261901 ) ( ON ?auto_261899 ?auto_261900 ) ( ON ?auto_261898 ?auto_261899 ) ( ON ?auto_261897 ?auto_261898 ) ( ON ?auto_261896 ?auto_261897 ) ( ON ?auto_261895 ?auto_261896 ) ( ON ?auto_261894 ?auto_261895 ) ( CLEAR ?auto_261894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_261894 )
      ( MAKE-8PILE ?auto_261894 ?auto_261895 ?auto_261896 ?auto_261897 ?auto_261898 ?auto_261899 ?auto_261900 ?auto_261901 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_261929 - BLOCK
      ?auto_261930 - BLOCK
      ?auto_261931 - BLOCK
      ?auto_261932 - BLOCK
      ?auto_261933 - BLOCK
      ?auto_261934 - BLOCK
      ?auto_261935 - BLOCK
      ?auto_261936 - BLOCK
      ?auto_261937 - BLOCK
    )
    :vars
    (
      ?auto_261938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_261936 ) ( ON ?auto_261937 ?auto_261938 ) ( CLEAR ?auto_261937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_261929 ) ( ON ?auto_261930 ?auto_261929 ) ( ON ?auto_261931 ?auto_261930 ) ( ON ?auto_261932 ?auto_261931 ) ( ON ?auto_261933 ?auto_261932 ) ( ON ?auto_261934 ?auto_261933 ) ( ON ?auto_261935 ?auto_261934 ) ( ON ?auto_261936 ?auto_261935 ) ( not ( = ?auto_261929 ?auto_261930 ) ) ( not ( = ?auto_261929 ?auto_261931 ) ) ( not ( = ?auto_261929 ?auto_261932 ) ) ( not ( = ?auto_261929 ?auto_261933 ) ) ( not ( = ?auto_261929 ?auto_261934 ) ) ( not ( = ?auto_261929 ?auto_261935 ) ) ( not ( = ?auto_261929 ?auto_261936 ) ) ( not ( = ?auto_261929 ?auto_261937 ) ) ( not ( = ?auto_261929 ?auto_261938 ) ) ( not ( = ?auto_261930 ?auto_261931 ) ) ( not ( = ?auto_261930 ?auto_261932 ) ) ( not ( = ?auto_261930 ?auto_261933 ) ) ( not ( = ?auto_261930 ?auto_261934 ) ) ( not ( = ?auto_261930 ?auto_261935 ) ) ( not ( = ?auto_261930 ?auto_261936 ) ) ( not ( = ?auto_261930 ?auto_261937 ) ) ( not ( = ?auto_261930 ?auto_261938 ) ) ( not ( = ?auto_261931 ?auto_261932 ) ) ( not ( = ?auto_261931 ?auto_261933 ) ) ( not ( = ?auto_261931 ?auto_261934 ) ) ( not ( = ?auto_261931 ?auto_261935 ) ) ( not ( = ?auto_261931 ?auto_261936 ) ) ( not ( = ?auto_261931 ?auto_261937 ) ) ( not ( = ?auto_261931 ?auto_261938 ) ) ( not ( = ?auto_261932 ?auto_261933 ) ) ( not ( = ?auto_261932 ?auto_261934 ) ) ( not ( = ?auto_261932 ?auto_261935 ) ) ( not ( = ?auto_261932 ?auto_261936 ) ) ( not ( = ?auto_261932 ?auto_261937 ) ) ( not ( = ?auto_261932 ?auto_261938 ) ) ( not ( = ?auto_261933 ?auto_261934 ) ) ( not ( = ?auto_261933 ?auto_261935 ) ) ( not ( = ?auto_261933 ?auto_261936 ) ) ( not ( = ?auto_261933 ?auto_261937 ) ) ( not ( = ?auto_261933 ?auto_261938 ) ) ( not ( = ?auto_261934 ?auto_261935 ) ) ( not ( = ?auto_261934 ?auto_261936 ) ) ( not ( = ?auto_261934 ?auto_261937 ) ) ( not ( = ?auto_261934 ?auto_261938 ) ) ( not ( = ?auto_261935 ?auto_261936 ) ) ( not ( = ?auto_261935 ?auto_261937 ) ) ( not ( = ?auto_261935 ?auto_261938 ) ) ( not ( = ?auto_261936 ?auto_261937 ) ) ( not ( = ?auto_261936 ?auto_261938 ) ) ( not ( = ?auto_261937 ?auto_261938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_261937 ?auto_261938 )
      ( !STACK ?auto_261937 ?auto_261936 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_261967 - BLOCK
      ?auto_261968 - BLOCK
      ?auto_261969 - BLOCK
      ?auto_261970 - BLOCK
      ?auto_261971 - BLOCK
      ?auto_261972 - BLOCK
      ?auto_261973 - BLOCK
      ?auto_261974 - BLOCK
      ?auto_261975 - BLOCK
    )
    :vars
    (
      ?auto_261976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_261975 ?auto_261976 ) ( ON-TABLE ?auto_261967 ) ( ON ?auto_261968 ?auto_261967 ) ( ON ?auto_261969 ?auto_261968 ) ( ON ?auto_261970 ?auto_261969 ) ( ON ?auto_261971 ?auto_261970 ) ( ON ?auto_261972 ?auto_261971 ) ( ON ?auto_261973 ?auto_261972 ) ( not ( = ?auto_261967 ?auto_261968 ) ) ( not ( = ?auto_261967 ?auto_261969 ) ) ( not ( = ?auto_261967 ?auto_261970 ) ) ( not ( = ?auto_261967 ?auto_261971 ) ) ( not ( = ?auto_261967 ?auto_261972 ) ) ( not ( = ?auto_261967 ?auto_261973 ) ) ( not ( = ?auto_261967 ?auto_261974 ) ) ( not ( = ?auto_261967 ?auto_261975 ) ) ( not ( = ?auto_261967 ?auto_261976 ) ) ( not ( = ?auto_261968 ?auto_261969 ) ) ( not ( = ?auto_261968 ?auto_261970 ) ) ( not ( = ?auto_261968 ?auto_261971 ) ) ( not ( = ?auto_261968 ?auto_261972 ) ) ( not ( = ?auto_261968 ?auto_261973 ) ) ( not ( = ?auto_261968 ?auto_261974 ) ) ( not ( = ?auto_261968 ?auto_261975 ) ) ( not ( = ?auto_261968 ?auto_261976 ) ) ( not ( = ?auto_261969 ?auto_261970 ) ) ( not ( = ?auto_261969 ?auto_261971 ) ) ( not ( = ?auto_261969 ?auto_261972 ) ) ( not ( = ?auto_261969 ?auto_261973 ) ) ( not ( = ?auto_261969 ?auto_261974 ) ) ( not ( = ?auto_261969 ?auto_261975 ) ) ( not ( = ?auto_261969 ?auto_261976 ) ) ( not ( = ?auto_261970 ?auto_261971 ) ) ( not ( = ?auto_261970 ?auto_261972 ) ) ( not ( = ?auto_261970 ?auto_261973 ) ) ( not ( = ?auto_261970 ?auto_261974 ) ) ( not ( = ?auto_261970 ?auto_261975 ) ) ( not ( = ?auto_261970 ?auto_261976 ) ) ( not ( = ?auto_261971 ?auto_261972 ) ) ( not ( = ?auto_261971 ?auto_261973 ) ) ( not ( = ?auto_261971 ?auto_261974 ) ) ( not ( = ?auto_261971 ?auto_261975 ) ) ( not ( = ?auto_261971 ?auto_261976 ) ) ( not ( = ?auto_261972 ?auto_261973 ) ) ( not ( = ?auto_261972 ?auto_261974 ) ) ( not ( = ?auto_261972 ?auto_261975 ) ) ( not ( = ?auto_261972 ?auto_261976 ) ) ( not ( = ?auto_261973 ?auto_261974 ) ) ( not ( = ?auto_261973 ?auto_261975 ) ) ( not ( = ?auto_261973 ?auto_261976 ) ) ( not ( = ?auto_261974 ?auto_261975 ) ) ( not ( = ?auto_261974 ?auto_261976 ) ) ( not ( = ?auto_261975 ?auto_261976 ) ) ( CLEAR ?auto_261973 ) ( ON ?auto_261974 ?auto_261975 ) ( CLEAR ?auto_261974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_261967 ?auto_261968 ?auto_261969 ?auto_261970 ?auto_261971 ?auto_261972 ?auto_261973 ?auto_261974 )
      ( MAKE-9PILE ?auto_261967 ?auto_261968 ?auto_261969 ?auto_261970 ?auto_261971 ?auto_261972 ?auto_261973 ?auto_261974 ?auto_261975 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262005 - BLOCK
      ?auto_262006 - BLOCK
      ?auto_262007 - BLOCK
      ?auto_262008 - BLOCK
      ?auto_262009 - BLOCK
      ?auto_262010 - BLOCK
      ?auto_262011 - BLOCK
      ?auto_262012 - BLOCK
      ?auto_262013 - BLOCK
    )
    :vars
    (
      ?auto_262014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262013 ?auto_262014 ) ( ON-TABLE ?auto_262005 ) ( ON ?auto_262006 ?auto_262005 ) ( ON ?auto_262007 ?auto_262006 ) ( ON ?auto_262008 ?auto_262007 ) ( ON ?auto_262009 ?auto_262008 ) ( ON ?auto_262010 ?auto_262009 ) ( not ( = ?auto_262005 ?auto_262006 ) ) ( not ( = ?auto_262005 ?auto_262007 ) ) ( not ( = ?auto_262005 ?auto_262008 ) ) ( not ( = ?auto_262005 ?auto_262009 ) ) ( not ( = ?auto_262005 ?auto_262010 ) ) ( not ( = ?auto_262005 ?auto_262011 ) ) ( not ( = ?auto_262005 ?auto_262012 ) ) ( not ( = ?auto_262005 ?auto_262013 ) ) ( not ( = ?auto_262005 ?auto_262014 ) ) ( not ( = ?auto_262006 ?auto_262007 ) ) ( not ( = ?auto_262006 ?auto_262008 ) ) ( not ( = ?auto_262006 ?auto_262009 ) ) ( not ( = ?auto_262006 ?auto_262010 ) ) ( not ( = ?auto_262006 ?auto_262011 ) ) ( not ( = ?auto_262006 ?auto_262012 ) ) ( not ( = ?auto_262006 ?auto_262013 ) ) ( not ( = ?auto_262006 ?auto_262014 ) ) ( not ( = ?auto_262007 ?auto_262008 ) ) ( not ( = ?auto_262007 ?auto_262009 ) ) ( not ( = ?auto_262007 ?auto_262010 ) ) ( not ( = ?auto_262007 ?auto_262011 ) ) ( not ( = ?auto_262007 ?auto_262012 ) ) ( not ( = ?auto_262007 ?auto_262013 ) ) ( not ( = ?auto_262007 ?auto_262014 ) ) ( not ( = ?auto_262008 ?auto_262009 ) ) ( not ( = ?auto_262008 ?auto_262010 ) ) ( not ( = ?auto_262008 ?auto_262011 ) ) ( not ( = ?auto_262008 ?auto_262012 ) ) ( not ( = ?auto_262008 ?auto_262013 ) ) ( not ( = ?auto_262008 ?auto_262014 ) ) ( not ( = ?auto_262009 ?auto_262010 ) ) ( not ( = ?auto_262009 ?auto_262011 ) ) ( not ( = ?auto_262009 ?auto_262012 ) ) ( not ( = ?auto_262009 ?auto_262013 ) ) ( not ( = ?auto_262009 ?auto_262014 ) ) ( not ( = ?auto_262010 ?auto_262011 ) ) ( not ( = ?auto_262010 ?auto_262012 ) ) ( not ( = ?auto_262010 ?auto_262013 ) ) ( not ( = ?auto_262010 ?auto_262014 ) ) ( not ( = ?auto_262011 ?auto_262012 ) ) ( not ( = ?auto_262011 ?auto_262013 ) ) ( not ( = ?auto_262011 ?auto_262014 ) ) ( not ( = ?auto_262012 ?auto_262013 ) ) ( not ( = ?auto_262012 ?auto_262014 ) ) ( not ( = ?auto_262013 ?auto_262014 ) ) ( ON ?auto_262012 ?auto_262013 ) ( CLEAR ?auto_262010 ) ( ON ?auto_262011 ?auto_262012 ) ( CLEAR ?auto_262011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_262005 ?auto_262006 ?auto_262007 ?auto_262008 ?auto_262009 ?auto_262010 ?auto_262011 )
      ( MAKE-9PILE ?auto_262005 ?auto_262006 ?auto_262007 ?auto_262008 ?auto_262009 ?auto_262010 ?auto_262011 ?auto_262012 ?auto_262013 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262043 - BLOCK
      ?auto_262044 - BLOCK
      ?auto_262045 - BLOCK
      ?auto_262046 - BLOCK
      ?auto_262047 - BLOCK
      ?auto_262048 - BLOCK
      ?auto_262049 - BLOCK
      ?auto_262050 - BLOCK
      ?auto_262051 - BLOCK
    )
    :vars
    (
      ?auto_262052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262051 ?auto_262052 ) ( ON-TABLE ?auto_262043 ) ( ON ?auto_262044 ?auto_262043 ) ( ON ?auto_262045 ?auto_262044 ) ( ON ?auto_262046 ?auto_262045 ) ( ON ?auto_262047 ?auto_262046 ) ( not ( = ?auto_262043 ?auto_262044 ) ) ( not ( = ?auto_262043 ?auto_262045 ) ) ( not ( = ?auto_262043 ?auto_262046 ) ) ( not ( = ?auto_262043 ?auto_262047 ) ) ( not ( = ?auto_262043 ?auto_262048 ) ) ( not ( = ?auto_262043 ?auto_262049 ) ) ( not ( = ?auto_262043 ?auto_262050 ) ) ( not ( = ?auto_262043 ?auto_262051 ) ) ( not ( = ?auto_262043 ?auto_262052 ) ) ( not ( = ?auto_262044 ?auto_262045 ) ) ( not ( = ?auto_262044 ?auto_262046 ) ) ( not ( = ?auto_262044 ?auto_262047 ) ) ( not ( = ?auto_262044 ?auto_262048 ) ) ( not ( = ?auto_262044 ?auto_262049 ) ) ( not ( = ?auto_262044 ?auto_262050 ) ) ( not ( = ?auto_262044 ?auto_262051 ) ) ( not ( = ?auto_262044 ?auto_262052 ) ) ( not ( = ?auto_262045 ?auto_262046 ) ) ( not ( = ?auto_262045 ?auto_262047 ) ) ( not ( = ?auto_262045 ?auto_262048 ) ) ( not ( = ?auto_262045 ?auto_262049 ) ) ( not ( = ?auto_262045 ?auto_262050 ) ) ( not ( = ?auto_262045 ?auto_262051 ) ) ( not ( = ?auto_262045 ?auto_262052 ) ) ( not ( = ?auto_262046 ?auto_262047 ) ) ( not ( = ?auto_262046 ?auto_262048 ) ) ( not ( = ?auto_262046 ?auto_262049 ) ) ( not ( = ?auto_262046 ?auto_262050 ) ) ( not ( = ?auto_262046 ?auto_262051 ) ) ( not ( = ?auto_262046 ?auto_262052 ) ) ( not ( = ?auto_262047 ?auto_262048 ) ) ( not ( = ?auto_262047 ?auto_262049 ) ) ( not ( = ?auto_262047 ?auto_262050 ) ) ( not ( = ?auto_262047 ?auto_262051 ) ) ( not ( = ?auto_262047 ?auto_262052 ) ) ( not ( = ?auto_262048 ?auto_262049 ) ) ( not ( = ?auto_262048 ?auto_262050 ) ) ( not ( = ?auto_262048 ?auto_262051 ) ) ( not ( = ?auto_262048 ?auto_262052 ) ) ( not ( = ?auto_262049 ?auto_262050 ) ) ( not ( = ?auto_262049 ?auto_262051 ) ) ( not ( = ?auto_262049 ?auto_262052 ) ) ( not ( = ?auto_262050 ?auto_262051 ) ) ( not ( = ?auto_262050 ?auto_262052 ) ) ( not ( = ?auto_262051 ?auto_262052 ) ) ( ON ?auto_262050 ?auto_262051 ) ( ON ?auto_262049 ?auto_262050 ) ( CLEAR ?auto_262047 ) ( ON ?auto_262048 ?auto_262049 ) ( CLEAR ?auto_262048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_262043 ?auto_262044 ?auto_262045 ?auto_262046 ?auto_262047 ?auto_262048 )
      ( MAKE-9PILE ?auto_262043 ?auto_262044 ?auto_262045 ?auto_262046 ?auto_262047 ?auto_262048 ?auto_262049 ?auto_262050 ?auto_262051 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262081 - BLOCK
      ?auto_262082 - BLOCK
      ?auto_262083 - BLOCK
      ?auto_262084 - BLOCK
      ?auto_262085 - BLOCK
      ?auto_262086 - BLOCK
      ?auto_262087 - BLOCK
      ?auto_262088 - BLOCK
      ?auto_262089 - BLOCK
    )
    :vars
    (
      ?auto_262090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262089 ?auto_262090 ) ( ON-TABLE ?auto_262081 ) ( ON ?auto_262082 ?auto_262081 ) ( ON ?auto_262083 ?auto_262082 ) ( ON ?auto_262084 ?auto_262083 ) ( not ( = ?auto_262081 ?auto_262082 ) ) ( not ( = ?auto_262081 ?auto_262083 ) ) ( not ( = ?auto_262081 ?auto_262084 ) ) ( not ( = ?auto_262081 ?auto_262085 ) ) ( not ( = ?auto_262081 ?auto_262086 ) ) ( not ( = ?auto_262081 ?auto_262087 ) ) ( not ( = ?auto_262081 ?auto_262088 ) ) ( not ( = ?auto_262081 ?auto_262089 ) ) ( not ( = ?auto_262081 ?auto_262090 ) ) ( not ( = ?auto_262082 ?auto_262083 ) ) ( not ( = ?auto_262082 ?auto_262084 ) ) ( not ( = ?auto_262082 ?auto_262085 ) ) ( not ( = ?auto_262082 ?auto_262086 ) ) ( not ( = ?auto_262082 ?auto_262087 ) ) ( not ( = ?auto_262082 ?auto_262088 ) ) ( not ( = ?auto_262082 ?auto_262089 ) ) ( not ( = ?auto_262082 ?auto_262090 ) ) ( not ( = ?auto_262083 ?auto_262084 ) ) ( not ( = ?auto_262083 ?auto_262085 ) ) ( not ( = ?auto_262083 ?auto_262086 ) ) ( not ( = ?auto_262083 ?auto_262087 ) ) ( not ( = ?auto_262083 ?auto_262088 ) ) ( not ( = ?auto_262083 ?auto_262089 ) ) ( not ( = ?auto_262083 ?auto_262090 ) ) ( not ( = ?auto_262084 ?auto_262085 ) ) ( not ( = ?auto_262084 ?auto_262086 ) ) ( not ( = ?auto_262084 ?auto_262087 ) ) ( not ( = ?auto_262084 ?auto_262088 ) ) ( not ( = ?auto_262084 ?auto_262089 ) ) ( not ( = ?auto_262084 ?auto_262090 ) ) ( not ( = ?auto_262085 ?auto_262086 ) ) ( not ( = ?auto_262085 ?auto_262087 ) ) ( not ( = ?auto_262085 ?auto_262088 ) ) ( not ( = ?auto_262085 ?auto_262089 ) ) ( not ( = ?auto_262085 ?auto_262090 ) ) ( not ( = ?auto_262086 ?auto_262087 ) ) ( not ( = ?auto_262086 ?auto_262088 ) ) ( not ( = ?auto_262086 ?auto_262089 ) ) ( not ( = ?auto_262086 ?auto_262090 ) ) ( not ( = ?auto_262087 ?auto_262088 ) ) ( not ( = ?auto_262087 ?auto_262089 ) ) ( not ( = ?auto_262087 ?auto_262090 ) ) ( not ( = ?auto_262088 ?auto_262089 ) ) ( not ( = ?auto_262088 ?auto_262090 ) ) ( not ( = ?auto_262089 ?auto_262090 ) ) ( ON ?auto_262088 ?auto_262089 ) ( ON ?auto_262087 ?auto_262088 ) ( ON ?auto_262086 ?auto_262087 ) ( CLEAR ?auto_262084 ) ( ON ?auto_262085 ?auto_262086 ) ( CLEAR ?auto_262085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_262081 ?auto_262082 ?auto_262083 ?auto_262084 ?auto_262085 )
      ( MAKE-9PILE ?auto_262081 ?auto_262082 ?auto_262083 ?auto_262084 ?auto_262085 ?auto_262086 ?auto_262087 ?auto_262088 ?auto_262089 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262119 - BLOCK
      ?auto_262120 - BLOCK
      ?auto_262121 - BLOCK
      ?auto_262122 - BLOCK
      ?auto_262123 - BLOCK
      ?auto_262124 - BLOCK
      ?auto_262125 - BLOCK
      ?auto_262126 - BLOCK
      ?auto_262127 - BLOCK
    )
    :vars
    (
      ?auto_262128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262127 ?auto_262128 ) ( ON-TABLE ?auto_262119 ) ( ON ?auto_262120 ?auto_262119 ) ( ON ?auto_262121 ?auto_262120 ) ( not ( = ?auto_262119 ?auto_262120 ) ) ( not ( = ?auto_262119 ?auto_262121 ) ) ( not ( = ?auto_262119 ?auto_262122 ) ) ( not ( = ?auto_262119 ?auto_262123 ) ) ( not ( = ?auto_262119 ?auto_262124 ) ) ( not ( = ?auto_262119 ?auto_262125 ) ) ( not ( = ?auto_262119 ?auto_262126 ) ) ( not ( = ?auto_262119 ?auto_262127 ) ) ( not ( = ?auto_262119 ?auto_262128 ) ) ( not ( = ?auto_262120 ?auto_262121 ) ) ( not ( = ?auto_262120 ?auto_262122 ) ) ( not ( = ?auto_262120 ?auto_262123 ) ) ( not ( = ?auto_262120 ?auto_262124 ) ) ( not ( = ?auto_262120 ?auto_262125 ) ) ( not ( = ?auto_262120 ?auto_262126 ) ) ( not ( = ?auto_262120 ?auto_262127 ) ) ( not ( = ?auto_262120 ?auto_262128 ) ) ( not ( = ?auto_262121 ?auto_262122 ) ) ( not ( = ?auto_262121 ?auto_262123 ) ) ( not ( = ?auto_262121 ?auto_262124 ) ) ( not ( = ?auto_262121 ?auto_262125 ) ) ( not ( = ?auto_262121 ?auto_262126 ) ) ( not ( = ?auto_262121 ?auto_262127 ) ) ( not ( = ?auto_262121 ?auto_262128 ) ) ( not ( = ?auto_262122 ?auto_262123 ) ) ( not ( = ?auto_262122 ?auto_262124 ) ) ( not ( = ?auto_262122 ?auto_262125 ) ) ( not ( = ?auto_262122 ?auto_262126 ) ) ( not ( = ?auto_262122 ?auto_262127 ) ) ( not ( = ?auto_262122 ?auto_262128 ) ) ( not ( = ?auto_262123 ?auto_262124 ) ) ( not ( = ?auto_262123 ?auto_262125 ) ) ( not ( = ?auto_262123 ?auto_262126 ) ) ( not ( = ?auto_262123 ?auto_262127 ) ) ( not ( = ?auto_262123 ?auto_262128 ) ) ( not ( = ?auto_262124 ?auto_262125 ) ) ( not ( = ?auto_262124 ?auto_262126 ) ) ( not ( = ?auto_262124 ?auto_262127 ) ) ( not ( = ?auto_262124 ?auto_262128 ) ) ( not ( = ?auto_262125 ?auto_262126 ) ) ( not ( = ?auto_262125 ?auto_262127 ) ) ( not ( = ?auto_262125 ?auto_262128 ) ) ( not ( = ?auto_262126 ?auto_262127 ) ) ( not ( = ?auto_262126 ?auto_262128 ) ) ( not ( = ?auto_262127 ?auto_262128 ) ) ( ON ?auto_262126 ?auto_262127 ) ( ON ?auto_262125 ?auto_262126 ) ( ON ?auto_262124 ?auto_262125 ) ( ON ?auto_262123 ?auto_262124 ) ( CLEAR ?auto_262121 ) ( ON ?auto_262122 ?auto_262123 ) ( CLEAR ?auto_262122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_262119 ?auto_262120 ?auto_262121 ?auto_262122 )
      ( MAKE-9PILE ?auto_262119 ?auto_262120 ?auto_262121 ?auto_262122 ?auto_262123 ?auto_262124 ?auto_262125 ?auto_262126 ?auto_262127 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262157 - BLOCK
      ?auto_262158 - BLOCK
      ?auto_262159 - BLOCK
      ?auto_262160 - BLOCK
      ?auto_262161 - BLOCK
      ?auto_262162 - BLOCK
      ?auto_262163 - BLOCK
      ?auto_262164 - BLOCK
      ?auto_262165 - BLOCK
    )
    :vars
    (
      ?auto_262166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262165 ?auto_262166 ) ( ON-TABLE ?auto_262157 ) ( ON ?auto_262158 ?auto_262157 ) ( not ( = ?auto_262157 ?auto_262158 ) ) ( not ( = ?auto_262157 ?auto_262159 ) ) ( not ( = ?auto_262157 ?auto_262160 ) ) ( not ( = ?auto_262157 ?auto_262161 ) ) ( not ( = ?auto_262157 ?auto_262162 ) ) ( not ( = ?auto_262157 ?auto_262163 ) ) ( not ( = ?auto_262157 ?auto_262164 ) ) ( not ( = ?auto_262157 ?auto_262165 ) ) ( not ( = ?auto_262157 ?auto_262166 ) ) ( not ( = ?auto_262158 ?auto_262159 ) ) ( not ( = ?auto_262158 ?auto_262160 ) ) ( not ( = ?auto_262158 ?auto_262161 ) ) ( not ( = ?auto_262158 ?auto_262162 ) ) ( not ( = ?auto_262158 ?auto_262163 ) ) ( not ( = ?auto_262158 ?auto_262164 ) ) ( not ( = ?auto_262158 ?auto_262165 ) ) ( not ( = ?auto_262158 ?auto_262166 ) ) ( not ( = ?auto_262159 ?auto_262160 ) ) ( not ( = ?auto_262159 ?auto_262161 ) ) ( not ( = ?auto_262159 ?auto_262162 ) ) ( not ( = ?auto_262159 ?auto_262163 ) ) ( not ( = ?auto_262159 ?auto_262164 ) ) ( not ( = ?auto_262159 ?auto_262165 ) ) ( not ( = ?auto_262159 ?auto_262166 ) ) ( not ( = ?auto_262160 ?auto_262161 ) ) ( not ( = ?auto_262160 ?auto_262162 ) ) ( not ( = ?auto_262160 ?auto_262163 ) ) ( not ( = ?auto_262160 ?auto_262164 ) ) ( not ( = ?auto_262160 ?auto_262165 ) ) ( not ( = ?auto_262160 ?auto_262166 ) ) ( not ( = ?auto_262161 ?auto_262162 ) ) ( not ( = ?auto_262161 ?auto_262163 ) ) ( not ( = ?auto_262161 ?auto_262164 ) ) ( not ( = ?auto_262161 ?auto_262165 ) ) ( not ( = ?auto_262161 ?auto_262166 ) ) ( not ( = ?auto_262162 ?auto_262163 ) ) ( not ( = ?auto_262162 ?auto_262164 ) ) ( not ( = ?auto_262162 ?auto_262165 ) ) ( not ( = ?auto_262162 ?auto_262166 ) ) ( not ( = ?auto_262163 ?auto_262164 ) ) ( not ( = ?auto_262163 ?auto_262165 ) ) ( not ( = ?auto_262163 ?auto_262166 ) ) ( not ( = ?auto_262164 ?auto_262165 ) ) ( not ( = ?auto_262164 ?auto_262166 ) ) ( not ( = ?auto_262165 ?auto_262166 ) ) ( ON ?auto_262164 ?auto_262165 ) ( ON ?auto_262163 ?auto_262164 ) ( ON ?auto_262162 ?auto_262163 ) ( ON ?auto_262161 ?auto_262162 ) ( ON ?auto_262160 ?auto_262161 ) ( CLEAR ?auto_262158 ) ( ON ?auto_262159 ?auto_262160 ) ( CLEAR ?auto_262159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_262157 ?auto_262158 ?auto_262159 )
      ( MAKE-9PILE ?auto_262157 ?auto_262158 ?auto_262159 ?auto_262160 ?auto_262161 ?auto_262162 ?auto_262163 ?auto_262164 ?auto_262165 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262195 - BLOCK
      ?auto_262196 - BLOCK
      ?auto_262197 - BLOCK
      ?auto_262198 - BLOCK
      ?auto_262199 - BLOCK
      ?auto_262200 - BLOCK
      ?auto_262201 - BLOCK
      ?auto_262202 - BLOCK
      ?auto_262203 - BLOCK
    )
    :vars
    (
      ?auto_262204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262203 ?auto_262204 ) ( ON-TABLE ?auto_262195 ) ( not ( = ?auto_262195 ?auto_262196 ) ) ( not ( = ?auto_262195 ?auto_262197 ) ) ( not ( = ?auto_262195 ?auto_262198 ) ) ( not ( = ?auto_262195 ?auto_262199 ) ) ( not ( = ?auto_262195 ?auto_262200 ) ) ( not ( = ?auto_262195 ?auto_262201 ) ) ( not ( = ?auto_262195 ?auto_262202 ) ) ( not ( = ?auto_262195 ?auto_262203 ) ) ( not ( = ?auto_262195 ?auto_262204 ) ) ( not ( = ?auto_262196 ?auto_262197 ) ) ( not ( = ?auto_262196 ?auto_262198 ) ) ( not ( = ?auto_262196 ?auto_262199 ) ) ( not ( = ?auto_262196 ?auto_262200 ) ) ( not ( = ?auto_262196 ?auto_262201 ) ) ( not ( = ?auto_262196 ?auto_262202 ) ) ( not ( = ?auto_262196 ?auto_262203 ) ) ( not ( = ?auto_262196 ?auto_262204 ) ) ( not ( = ?auto_262197 ?auto_262198 ) ) ( not ( = ?auto_262197 ?auto_262199 ) ) ( not ( = ?auto_262197 ?auto_262200 ) ) ( not ( = ?auto_262197 ?auto_262201 ) ) ( not ( = ?auto_262197 ?auto_262202 ) ) ( not ( = ?auto_262197 ?auto_262203 ) ) ( not ( = ?auto_262197 ?auto_262204 ) ) ( not ( = ?auto_262198 ?auto_262199 ) ) ( not ( = ?auto_262198 ?auto_262200 ) ) ( not ( = ?auto_262198 ?auto_262201 ) ) ( not ( = ?auto_262198 ?auto_262202 ) ) ( not ( = ?auto_262198 ?auto_262203 ) ) ( not ( = ?auto_262198 ?auto_262204 ) ) ( not ( = ?auto_262199 ?auto_262200 ) ) ( not ( = ?auto_262199 ?auto_262201 ) ) ( not ( = ?auto_262199 ?auto_262202 ) ) ( not ( = ?auto_262199 ?auto_262203 ) ) ( not ( = ?auto_262199 ?auto_262204 ) ) ( not ( = ?auto_262200 ?auto_262201 ) ) ( not ( = ?auto_262200 ?auto_262202 ) ) ( not ( = ?auto_262200 ?auto_262203 ) ) ( not ( = ?auto_262200 ?auto_262204 ) ) ( not ( = ?auto_262201 ?auto_262202 ) ) ( not ( = ?auto_262201 ?auto_262203 ) ) ( not ( = ?auto_262201 ?auto_262204 ) ) ( not ( = ?auto_262202 ?auto_262203 ) ) ( not ( = ?auto_262202 ?auto_262204 ) ) ( not ( = ?auto_262203 ?auto_262204 ) ) ( ON ?auto_262202 ?auto_262203 ) ( ON ?auto_262201 ?auto_262202 ) ( ON ?auto_262200 ?auto_262201 ) ( ON ?auto_262199 ?auto_262200 ) ( ON ?auto_262198 ?auto_262199 ) ( ON ?auto_262197 ?auto_262198 ) ( CLEAR ?auto_262195 ) ( ON ?auto_262196 ?auto_262197 ) ( CLEAR ?auto_262196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_262195 ?auto_262196 )
      ( MAKE-9PILE ?auto_262195 ?auto_262196 ?auto_262197 ?auto_262198 ?auto_262199 ?auto_262200 ?auto_262201 ?auto_262202 ?auto_262203 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_262233 - BLOCK
      ?auto_262234 - BLOCK
      ?auto_262235 - BLOCK
      ?auto_262236 - BLOCK
      ?auto_262237 - BLOCK
      ?auto_262238 - BLOCK
      ?auto_262239 - BLOCK
      ?auto_262240 - BLOCK
      ?auto_262241 - BLOCK
    )
    :vars
    (
      ?auto_262242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262241 ?auto_262242 ) ( not ( = ?auto_262233 ?auto_262234 ) ) ( not ( = ?auto_262233 ?auto_262235 ) ) ( not ( = ?auto_262233 ?auto_262236 ) ) ( not ( = ?auto_262233 ?auto_262237 ) ) ( not ( = ?auto_262233 ?auto_262238 ) ) ( not ( = ?auto_262233 ?auto_262239 ) ) ( not ( = ?auto_262233 ?auto_262240 ) ) ( not ( = ?auto_262233 ?auto_262241 ) ) ( not ( = ?auto_262233 ?auto_262242 ) ) ( not ( = ?auto_262234 ?auto_262235 ) ) ( not ( = ?auto_262234 ?auto_262236 ) ) ( not ( = ?auto_262234 ?auto_262237 ) ) ( not ( = ?auto_262234 ?auto_262238 ) ) ( not ( = ?auto_262234 ?auto_262239 ) ) ( not ( = ?auto_262234 ?auto_262240 ) ) ( not ( = ?auto_262234 ?auto_262241 ) ) ( not ( = ?auto_262234 ?auto_262242 ) ) ( not ( = ?auto_262235 ?auto_262236 ) ) ( not ( = ?auto_262235 ?auto_262237 ) ) ( not ( = ?auto_262235 ?auto_262238 ) ) ( not ( = ?auto_262235 ?auto_262239 ) ) ( not ( = ?auto_262235 ?auto_262240 ) ) ( not ( = ?auto_262235 ?auto_262241 ) ) ( not ( = ?auto_262235 ?auto_262242 ) ) ( not ( = ?auto_262236 ?auto_262237 ) ) ( not ( = ?auto_262236 ?auto_262238 ) ) ( not ( = ?auto_262236 ?auto_262239 ) ) ( not ( = ?auto_262236 ?auto_262240 ) ) ( not ( = ?auto_262236 ?auto_262241 ) ) ( not ( = ?auto_262236 ?auto_262242 ) ) ( not ( = ?auto_262237 ?auto_262238 ) ) ( not ( = ?auto_262237 ?auto_262239 ) ) ( not ( = ?auto_262237 ?auto_262240 ) ) ( not ( = ?auto_262237 ?auto_262241 ) ) ( not ( = ?auto_262237 ?auto_262242 ) ) ( not ( = ?auto_262238 ?auto_262239 ) ) ( not ( = ?auto_262238 ?auto_262240 ) ) ( not ( = ?auto_262238 ?auto_262241 ) ) ( not ( = ?auto_262238 ?auto_262242 ) ) ( not ( = ?auto_262239 ?auto_262240 ) ) ( not ( = ?auto_262239 ?auto_262241 ) ) ( not ( = ?auto_262239 ?auto_262242 ) ) ( not ( = ?auto_262240 ?auto_262241 ) ) ( not ( = ?auto_262240 ?auto_262242 ) ) ( not ( = ?auto_262241 ?auto_262242 ) ) ( ON ?auto_262240 ?auto_262241 ) ( ON ?auto_262239 ?auto_262240 ) ( ON ?auto_262238 ?auto_262239 ) ( ON ?auto_262237 ?auto_262238 ) ( ON ?auto_262236 ?auto_262237 ) ( ON ?auto_262235 ?auto_262236 ) ( ON ?auto_262234 ?auto_262235 ) ( ON ?auto_262233 ?auto_262234 ) ( CLEAR ?auto_262233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_262233 )
      ( MAKE-9PILE ?auto_262233 ?auto_262234 ?auto_262235 ?auto_262236 ?auto_262237 ?auto_262238 ?auto_262239 ?auto_262240 ?auto_262241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262272 - BLOCK
      ?auto_262273 - BLOCK
      ?auto_262274 - BLOCK
      ?auto_262275 - BLOCK
      ?auto_262276 - BLOCK
      ?auto_262277 - BLOCK
      ?auto_262278 - BLOCK
      ?auto_262279 - BLOCK
      ?auto_262280 - BLOCK
      ?auto_262281 - BLOCK
    )
    :vars
    (
      ?auto_262282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_262280 ) ( ON ?auto_262281 ?auto_262282 ) ( CLEAR ?auto_262281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_262272 ) ( ON ?auto_262273 ?auto_262272 ) ( ON ?auto_262274 ?auto_262273 ) ( ON ?auto_262275 ?auto_262274 ) ( ON ?auto_262276 ?auto_262275 ) ( ON ?auto_262277 ?auto_262276 ) ( ON ?auto_262278 ?auto_262277 ) ( ON ?auto_262279 ?auto_262278 ) ( ON ?auto_262280 ?auto_262279 ) ( not ( = ?auto_262272 ?auto_262273 ) ) ( not ( = ?auto_262272 ?auto_262274 ) ) ( not ( = ?auto_262272 ?auto_262275 ) ) ( not ( = ?auto_262272 ?auto_262276 ) ) ( not ( = ?auto_262272 ?auto_262277 ) ) ( not ( = ?auto_262272 ?auto_262278 ) ) ( not ( = ?auto_262272 ?auto_262279 ) ) ( not ( = ?auto_262272 ?auto_262280 ) ) ( not ( = ?auto_262272 ?auto_262281 ) ) ( not ( = ?auto_262272 ?auto_262282 ) ) ( not ( = ?auto_262273 ?auto_262274 ) ) ( not ( = ?auto_262273 ?auto_262275 ) ) ( not ( = ?auto_262273 ?auto_262276 ) ) ( not ( = ?auto_262273 ?auto_262277 ) ) ( not ( = ?auto_262273 ?auto_262278 ) ) ( not ( = ?auto_262273 ?auto_262279 ) ) ( not ( = ?auto_262273 ?auto_262280 ) ) ( not ( = ?auto_262273 ?auto_262281 ) ) ( not ( = ?auto_262273 ?auto_262282 ) ) ( not ( = ?auto_262274 ?auto_262275 ) ) ( not ( = ?auto_262274 ?auto_262276 ) ) ( not ( = ?auto_262274 ?auto_262277 ) ) ( not ( = ?auto_262274 ?auto_262278 ) ) ( not ( = ?auto_262274 ?auto_262279 ) ) ( not ( = ?auto_262274 ?auto_262280 ) ) ( not ( = ?auto_262274 ?auto_262281 ) ) ( not ( = ?auto_262274 ?auto_262282 ) ) ( not ( = ?auto_262275 ?auto_262276 ) ) ( not ( = ?auto_262275 ?auto_262277 ) ) ( not ( = ?auto_262275 ?auto_262278 ) ) ( not ( = ?auto_262275 ?auto_262279 ) ) ( not ( = ?auto_262275 ?auto_262280 ) ) ( not ( = ?auto_262275 ?auto_262281 ) ) ( not ( = ?auto_262275 ?auto_262282 ) ) ( not ( = ?auto_262276 ?auto_262277 ) ) ( not ( = ?auto_262276 ?auto_262278 ) ) ( not ( = ?auto_262276 ?auto_262279 ) ) ( not ( = ?auto_262276 ?auto_262280 ) ) ( not ( = ?auto_262276 ?auto_262281 ) ) ( not ( = ?auto_262276 ?auto_262282 ) ) ( not ( = ?auto_262277 ?auto_262278 ) ) ( not ( = ?auto_262277 ?auto_262279 ) ) ( not ( = ?auto_262277 ?auto_262280 ) ) ( not ( = ?auto_262277 ?auto_262281 ) ) ( not ( = ?auto_262277 ?auto_262282 ) ) ( not ( = ?auto_262278 ?auto_262279 ) ) ( not ( = ?auto_262278 ?auto_262280 ) ) ( not ( = ?auto_262278 ?auto_262281 ) ) ( not ( = ?auto_262278 ?auto_262282 ) ) ( not ( = ?auto_262279 ?auto_262280 ) ) ( not ( = ?auto_262279 ?auto_262281 ) ) ( not ( = ?auto_262279 ?auto_262282 ) ) ( not ( = ?auto_262280 ?auto_262281 ) ) ( not ( = ?auto_262280 ?auto_262282 ) ) ( not ( = ?auto_262281 ?auto_262282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_262281 ?auto_262282 )
      ( !STACK ?auto_262281 ?auto_262280 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262314 - BLOCK
      ?auto_262315 - BLOCK
      ?auto_262316 - BLOCK
      ?auto_262317 - BLOCK
      ?auto_262318 - BLOCK
      ?auto_262319 - BLOCK
      ?auto_262320 - BLOCK
      ?auto_262321 - BLOCK
      ?auto_262322 - BLOCK
      ?auto_262323 - BLOCK
    )
    :vars
    (
      ?auto_262324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262323 ?auto_262324 ) ( ON-TABLE ?auto_262314 ) ( ON ?auto_262315 ?auto_262314 ) ( ON ?auto_262316 ?auto_262315 ) ( ON ?auto_262317 ?auto_262316 ) ( ON ?auto_262318 ?auto_262317 ) ( ON ?auto_262319 ?auto_262318 ) ( ON ?auto_262320 ?auto_262319 ) ( ON ?auto_262321 ?auto_262320 ) ( not ( = ?auto_262314 ?auto_262315 ) ) ( not ( = ?auto_262314 ?auto_262316 ) ) ( not ( = ?auto_262314 ?auto_262317 ) ) ( not ( = ?auto_262314 ?auto_262318 ) ) ( not ( = ?auto_262314 ?auto_262319 ) ) ( not ( = ?auto_262314 ?auto_262320 ) ) ( not ( = ?auto_262314 ?auto_262321 ) ) ( not ( = ?auto_262314 ?auto_262322 ) ) ( not ( = ?auto_262314 ?auto_262323 ) ) ( not ( = ?auto_262314 ?auto_262324 ) ) ( not ( = ?auto_262315 ?auto_262316 ) ) ( not ( = ?auto_262315 ?auto_262317 ) ) ( not ( = ?auto_262315 ?auto_262318 ) ) ( not ( = ?auto_262315 ?auto_262319 ) ) ( not ( = ?auto_262315 ?auto_262320 ) ) ( not ( = ?auto_262315 ?auto_262321 ) ) ( not ( = ?auto_262315 ?auto_262322 ) ) ( not ( = ?auto_262315 ?auto_262323 ) ) ( not ( = ?auto_262315 ?auto_262324 ) ) ( not ( = ?auto_262316 ?auto_262317 ) ) ( not ( = ?auto_262316 ?auto_262318 ) ) ( not ( = ?auto_262316 ?auto_262319 ) ) ( not ( = ?auto_262316 ?auto_262320 ) ) ( not ( = ?auto_262316 ?auto_262321 ) ) ( not ( = ?auto_262316 ?auto_262322 ) ) ( not ( = ?auto_262316 ?auto_262323 ) ) ( not ( = ?auto_262316 ?auto_262324 ) ) ( not ( = ?auto_262317 ?auto_262318 ) ) ( not ( = ?auto_262317 ?auto_262319 ) ) ( not ( = ?auto_262317 ?auto_262320 ) ) ( not ( = ?auto_262317 ?auto_262321 ) ) ( not ( = ?auto_262317 ?auto_262322 ) ) ( not ( = ?auto_262317 ?auto_262323 ) ) ( not ( = ?auto_262317 ?auto_262324 ) ) ( not ( = ?auto_262318 ?auto_262319 ) ) ( not ( = ?auto_262318 ?auto_262320 ) ) ( not ( = ?auto_262318 ?auto_262321 ) ) ( not ( = ?auto_262318 ?auto_262322 ) ) ( not ( = ?auto_262318 ?auto_262323 ) ) ( not ( = ?auto_262318 ?auto_262324 ) ) ( not ( = ?auto_262319 ?auto_262320 ) ) ( not ( = ?auto_262319 ?auto_262321 ) ) ( not ( = ?auto_262319 ?auto_262322 ) ) ( not ( = ?auto_262319 ?auto_262323 ) ) ( not ( = ?auto_262319 ?auto_262324 ) ) ( not ( = ?auto_262320 ?auto_262321 ) ) ( not ( = ?auto_262320 ?auto_262322 ) ) ( not ( = ?auto_262320 ?auto_262323 ) ) ( not ( = ?auto_262320 ?auto_262324 ) ) ( not ( = ?auto_262321 ?auto_262322 ) ) ( not ( = ?auto_262321 ?auto_262323 ) ) ( not ( = ?auto_262321 ?auto_262324 ) ) ( not ( = ?auto_262322 ?auto_262323 ) ) ( not ( = ?auto_262322 ?auto_262324 ) ) ( not ( = ?auto_262323 ?auto_262324 ) ) ( CLEAR ?auto_262321 ) ( ON ?auto_262322 ?auto_262323 ) ( CLEAR ?auto_262322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_262314 ?auto_262315 ?auto_262316 ?auto_262317 ?auto_262318 ?auto_262319 ?auto_262320 ?auto_262321 ?auto_262322 )
      ( MAKE-10PILE ?auto_262314 ?auto_262315 ?auto_262316 ?auto_262317 ?auto_262318 ?auto_262319 ?auto_262320 ?auto_262321 ?auto_262322 ?auto_262323 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262356 - BLOCK
      ?auto_262357 - BLOCK
      ?auto_262358 - BLOCK
      ?auto_262359 - BLOCK
      ?auto_262360 - BLOCK
      ?auto_262361 - BLOCK
      ?auto_262362 - BLOCK
      ?auto_262363 - BLOCK
      ?auto_262364 - BLOCK
      ?auto_262365 - BLOCK
    )
    :vars
    (
      ?auto_262366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262365 ?auto_262366 ) ( ON-TABLE ?auto_262356 ) ( ON ?auto_262357 ?auto_262356 ) ( ON ?auto_262358 ?auto_262357 ) ( ON ?auto_262359 ?auto_262358 ) ( ON ?auto_262360 ?auto_262359 ) ( ON ?auto_262361 ?auto_262360 ) ( ON ?auto_262362 ?auto_262361 ) ( not ( = ?auto_262356 ?auto_262357 ) ) ( not ( = ?auto_262356 ?auto_262358 ) ) ( not ( = ?auto_262356 ?auto_262359 ) ) ( not ( = ?auto_262356 ?auto_262360 ) ) ( not ( = ?auto_262356 ?auto_262361 ) ) ( not ( = ?auto_262356 ?auto_262362 ) ) ( not ( = ?auto_262356 ?auto_262363 ) ) ( not ( = ?auto_262356 ?auto_262364 ) ) ( not ( = ?auto_262356 ?auto_262365 ) ) ( not ( = ?auto_262356 ?auto_262366 ) ) ( not ( = ?auto_262357 ?auto_262358 ) ) ( not ( = ?auto_262357 ?auto_262359 ) ) ( not ( = ?auto_262357 ?auto_262360 ) ) ( not ( = ?auto_262357 ?auto_262361 ) ) ( not ( = ?auto_262357 ?auto_262362 ) ) ( not ( = ?auto_262357 ?auto_262363 ) ) ( not ( = ?auto_262357 ?auto_262364 ) ) ( not ( = ?auto_262357 ?auto_262365 ) ) ( not ( = ?auto_262357 ?auto_262366 ) ) ( not ( = ?auto_262358 ?auto_262359 ) ) ( not ( = ?auto_262358 ?auto_262360 ) ) ( not ( = ?auto_262358 ?auto_262361 ) ) ( not ( = ?auto_262358 ?auto_262362 ) ) ( not ( = ?auto_262358 ?auto_262363 ) ) ( not ( = ?auto_262358 ?auto_262364 ) ) ( not ( = ?auto_262358 ?auto_262365 ) ) ( not ( = ?auto_262358 ?auto_262366 ) ) ( not ( = ?auto_262359 ?auto_262360 ) ) ( not ( = ?auto_262359 ?auto_262361 ) ) ( not ( = ?auto_262359 ?auto_262362 ) ) ( not ( = ?auto_262359 ?auto_262363 ) ) ( not ( = ?auto_262359 ?auto_262364 ) ) ( not ( = ?auto_262359 ?auto_262365 ) ) ( not ( = ?auto_262359 ?auto_262366 ) ) ( not ( = ?auto_262360 ?auto_262361 ) ) ( not ( = ?auto_262360 ?auto_262362 ) ) ( not ( = ?auto_262360 ?auto_262363 ) ) ( not ( = ?auto_262360 ?auto_262364 ) ) ( not ( = ?auto_262360 ?auto_262365 ) ) ( not ( = ?auto_262360 ?auto_262366 ) ) ( not ( = ?auto_262361 ?auto_262362 ) ) ( not ( = ?auto_262361 ?auto_262363 ) ) ( not ( = ?auto_262361 ?auto_262364 ) ) ( not ( = ?auto_262361 ?auto_262365 ) ) ( not ( = ?auto_262361 ?auto_262366 ) ) ( not ( = ?auto_262362 ?auto_262363 ) ) ( not ( = ?auto_262362 ?auto_262364 ) ) ( not ( = ?auto_262362 ?auto_262365 ) ) ( not ( = ?auto_262362 ?auto_262366 ) ) ( not ( = ?auto_262363 ?auto_262364 ) ) ( not ( = ?auto_262363 ?auto_262365 ) ) ( not ( = ?auto_262363 ?auto_262366 ) ) ( not ( = ?auto_262364 ?auto_262365 ) ) ( not ( = ?auto_262364 ?auto_262366 ) ) ( not ( = ?auto_262365 ?auto_262366 ) ) ( ON ?auto_262364 ?auto_262365 ) ( CLEAR ?auto_262362 ) ( ON ?auto_262363 ?auto_262364 ) ( CLEAR ?auto_262363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_262356 ?auto_262357 ?auto_262358 ?auto_262359 ?auto_262360 ?auto_262361 ?auto_262362 ?auto_262363 )
      ( MAKE-10PILE ?auto_262356 ?auto_262357 ?auto_262358 ?auto_262359 ?auto_262360 ?auto_262361 ?auto_262362 ?auto_262363 ?auto_262364 ?auto_262365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262398 - BLOCK
      ?auto_262399 - BLOCK
      ?auto_262400 - BLOCK
      ?auto_262401 - BLOCK
      ?auto_262402 - BLOCK
      ?auto_262403 - BLOCK
      ?auto_262404 - BLOCK
      ?auto_262405 - BLOCK
      ?auto_262406 - BLOCK
      ?auto_262407 - BLOCK
    )
    :vars
    (
      ?auto_262408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262407 ?auto_262408 ) ( ON-TABLE ?auto_262398 ) ( ON ?auto_262399 ?auto_262398 ) ( ON ?auto_262400 ?auto_262399 ) ( ON ?auto_262401 ?auto_262400 ) ( ON ?auto_262402 ?auto_262401 ) ( ON ?auto_262403 ?auto_262402 ) ( not ( = ?auto_262398 ?auto_262399 ) ) ( not ( = ?auto_262398 ?auto_262400 ) ) ( not ( = ?auto_262398 ?auto_262401 ) ) ( not ( = ?auto_262398 ?auto_262402 ) ) ( not ( = ?auto_262398 ?auto_262403 ) ) ( not ( = ?auto_262398 ?auto_262404 ) ) ( not ( = ?auto_262398 ?auto_262405 ) ) ( not ( = ?auto_262398 ?auto_262406 ) ) ( not ( = ?auto_262398 ?auto_262407 ) ) ( not ( = ?auto_262398 ?auto_262408 ) ) ( not ( = ?auto_262399 ?auto_262400 ) ) ( not ( = ?auto_262399 ?auto_262401 ) ) ( not ( = ?auto_262399 ?auto_262402 ) ) ( not ( = ?auto_262399 ?auto_262403 ) ) ( not ( = ?auto_262399 ?auto_262404 ) ) ( not ( = ?auto_262399 ?auto_262405 ) ) ( not ( = ?auto_262399 ?auto_262406 ) ) ( not ( = ?auto_262399 ?auto_262407 ) ) ( not ( = ?auto_262399 ?auto_262408 ) ) ( not ( = ?auto_262400 ?auto_262401 ) ) ( not ( = ?auto_262400 ?auto_262402 ) ) ( not ( = ?auto_262400 ?auto_262403 ) ) ( not ( = ?auto_262400 ?auto_262404 ) ) ( not ( = ?auto_262400 ?auto_262405 ) ) ( not ( = ?auto_262400 ?auto_262406 ) ) ( not ( = ?auto_262400 ?auto_262407 ) ) ( not ( = ?auto_262400 ?auto_262408 ) ) ( not ( = ?auto_262401 ?auto_262402 ) ) ( not ( = ?auto_262401 ?auto_262403 ) ) ( not ( = ?auto_262401 ?auto_262404 ) ) ( not ( = ?auto_262401 ?auto_262405 ) ) ( not ( = ?auto_262401 ?auto_262406 ) ) ( not ( = ?auto_262401 ?auto_262407 ) ) ( not ( = ?auto_262401 ?auto_262408 ) ) ( not ( = ?auto_262402 ?auto_262403 ) ) ( not ( = ?auto_262402 ?auto_262404 ) ) ( not ( = ?auto_262402 ?auto_262405 ) ) ( not ( = ?auto_262402 ?auto_262406 ) ) ( not ( = ?auto_262402 ?auto_262407 ) ) ( not ( = ?auto_262402 ?auto_262408 ) ) ( not ( = ?auto_262403 ?auto_262404 ) ) ( not ( = ?auto_262403 ?auto_262405 ) ) ( not ( = ?auto_262403 ?auto_262406 ) ) ( not ( = ?auto_262403 ?auto_262407 ) ) ( not ( = ?auto_262403 ?auto_262408 ) ) ( not ( = ?auto_262404 ?auto_262405 ) ) ( not ( = ?auto_262404 ?auto_262406 ) ) ( not ( = ?auto_262404 ?auto_262407 ) ) ( not ( = ?auto_262404 ?auto_262408 ) ) ( not ( = ?auto_262405 ?auto_262406 ) ) ( not ( = ?auto_262405 ?auto_262407 ) ) ( not ( = ?auto_262405 ?auto_262408 ) ) ( not ( = ?auto_262406 ?auto_262407 ) ) ( not ( = ?auto_262406 ?auto_262408 ) ) ( not ( = ?auto_262407 ?auto_262408 ) ) ( ON ?auto_262406 ?auto_262407 ) ( ON ?auto_262405 ?auto_262406 ) ( CLEAR ?auto_262403 ) ( ON ?auto_262404 ?auto_262405 ) ( CLEAR ?auto_262404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_262398 ?auto_262399 ?auto_262400 ?auto_262401 ?auto_262402 ?auto_262403 ?auto_262404 )
      ( MAKE-10PILE ?auto_262398 ?auto_262399 ?auto_262400 ?auto_262401 ?auto_262402 ?auto_262403 ?auto_262404 ?auto_262405 ?auto_262406 ?auto_262407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262440 - BLOCK
      ?auto_262441 - BLOCK
      ?auto_262442 - BLOCK
      ?auto_262443 - BLOCK
      ?auto_262444 - BLOCK
      ?auto_262445 - BLOCK
      ?auto_262446 - BLOCK
      ?auto_262447 - BLOCK
      ?auto_262448 - BLOCK
      ?auto_262449 - BLOCK
    )
    :vars
    (
      ?auto_262450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262449 ?auto_262450 ) ( ON-TABLE ?auto_262440 ) ( ON ?auto_262441 ?auto_262440 ) ( ON ?auto_262442 ?auto_262441 ) ( ON ?auto_262443 ?auto_262442 ) ( ON ?auto_262444 ?auto_262443 ) ( not ( = ?auto_262440 ?auto_262441 ) ) ( not ( = ?auto_262440 ?auto_262442 ) ) ( not ( = ?auto_262440 ?auto_262443 ) ) ( not ( = ?auto_262440 ?auto_262444 ) ) ( not ( = ?auto_262440 ?auto_262445 ) ) ( not ( = ?auto_262440 ?auto_262446 ) ) ( not ( = ?auto_262440 ?auto_262447 ) ) ( not ( = ?auto_262440 ?auto_262448 ) ) ( not ( = ?auto_262440 ?auto_262449 ) ) ( not ( = ?auto_262440 ?auto_262450 ) ) ( not ( = ?auto_262441 ?auto_262442 ) ) ( not ( = ?auto_262441 ?auto_262443 ) ) ( not ( = ?auto_262441 ?auto_262444 ) ) ( not ( = ?auto_262441 ?auto_262445 ) ) ( not ( = ?auto_262441 ?auto_262446 ) ) ( not ( = ?auto_262441 ?auto_262447 ) ) ( not ( = ?auto_262441 ?auto_262448 ) ) ( not ( = ?auto_262441 ?auto_262449 ) ) ( not ( = ?auto_262441 ?auto_262450 ) ) ( not ( = ?auto_262442 ?auto_262443 ) ) ( not ( = ?auto_262442 ?auto_262444 ) ) ( not ( = ?auto_262442 ?auto_262445 ) ) ( not ( = ?auto_262442 ?auto_262446 ) ) ( not ( = ?auto_262442 ?auto_262447 ) ) ( not ( = ?auto_262442 ?auto_262448 ) ) ( not ( = ?auto_262442 ?auto_262449 ) ) ( not ( = ?auto_262442 ?auto_262450 ) ) ( not ( = ?auto_262443 ?auto_262444 ) ) ( not ( = ?auto_262443 ?auto_262445 ) ) ( not ( = ?auto_262443 ?auto_262446 ) ) ( not ( = ?auto_262443 ?auto_262447 ) ) ( not ( = ?auto_262443 ?auto_262448 ) ) ( not ( = ?auto_262443 ?auto_262449 ) ) ( not ( = ?auto_262443 ?auto_262450 ) ) ( not ( = ?auto_262444 ?auto_262445 ) ) ( not ( = ?auto_262444 ?auto_262446 ) ) ( not ( = ?auto_262444 ?auto_262447 ) ) ( not ( = ?auto_262444 ?auto_262448 ) ) ( not ( = ?auto_262444 ?auto_262449 ) ) ( not ( = ?auto_262444 ?auto_262450 ) ) ( not ( = ?auto_262445 ?auto_262446 ) ) ( not ( = ?auto_262445 ?auto_262447 ) ) ( not ( = ?auto_262445 ?auto_262448 ) ) ( not ( = ?auto_262445 ?auto_262449 ) ) ( not ( = ?auto_262445 ?auto_262450 ) ) ( not ( = ?auto_262446 ?auto_262447 ) ) ( not ( = ?auto_262446 ?auto_262448 ) ) ( not ( = ?auto_262446 ?auto_262449 ) ) ( not ( = ?auto_262446 ?auto_262450 ) ) ( not ( = ?auto_262447 ?auto_262448 ) ) ( not ( = ?auto_262447 ?auto_262449 ) ) ( not ( = ?auto_262447 ?auto_262450 ) ) ( not ( = ?auto_262448 ?auto_262449 ) ) ( not ( = ?auto_262448 ?auto_262450 ) ) ( not ( = ?auto_262449 ?auto_262450 ) ) ( ON ?auto_262448 ?auto_262449 ) ( ON ?auto_262447 ?auto_262448 ) ( ON ?auto_262446 ?auto_262447 ) ( CLEAR ?auto_262444 ) ( ON ?auto_262445 ?auto_262446 ) ( CLEAR ?auto_262445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_262440 ?auto_262441 ?auto_262442 ?auto_262443 ?auto_262444 ?auto_262445 )
      ( MAKE-10PILE ?auto_262440 ?auto_262441 ?auto_262442 ?auto_262443 ?auto_262444 ?auto_262445 ?auto_262446 ?auto_262447 ?auto_262448 ?auto_262449 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262482 - BLOCK
      ?auto_262483 - BLOCK
      ?auto_262484 - BLOCK
      ?auto_262485 - BLOCK
      ?auto_262486 - BLOCK
      ?auto_262487 - BLOCK
      ?auto_262488 - BLOCK
      ?auto_262489 - BLOCK
      ?auto_262490 - BLOCK
      ?auto_262491 - BLOCK
    )
    :vars
    (
      ?auto_262492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262491 ?auto_262492 ) ( ON-TABLE ?auto_262482 ) ( ON ?auto_262483 ?auto_262482 ) ( ON ?auto_262484 ?auto_262483 ) ( ON ?auto_262485 ?auto_262484 ) ( not ( = ?auto_262482 ?auto_262483 ) ) ( not ( = ?auto_262482 ?auto_262484 ) ) ( not ( = ?auto_262482 ?auto_262485 ) ) ( not ( = ?auto_262482 ?auto_262486 ) ) ( not ( = ?auto_262482 ?auto_262487 ) ) ( not ( = ?auto_262482 ?auto_262488 ) ) ( not ( = ?auto_262482 ?auto_262489 ) ) ( not ( = ?auto_262482 ?auto_262490 ) ) ( not ( = ?auto_262482 ?auto_262491 ) ) ( not ( = ?auto_262482 ?auto_262492 ) ) ( not ( = ?auto_262483 ?auto_262484 ) ) ( not ( = ?auto_262483 ?auto_262485 ) ) ( not ( = ?auto_262483 ?auto_262486 ) ) ( not ( = ?auto_262483 ?auto_262487 ) ) ( not ( = ?auto_262483 ?auto_262488 ) ) ( not ( = ?auto_262483 ?auto_262489 ) ) ( not ( = ?auto_262483 ?auto_262490 ) ) ( not ( = ?auto_262483 ?auto_262491 ) ) ( not ( = ?auto_262483 ?auto_262492 ) ) ( not ( = ?auto_262484 ?auto_262485 ) ) ( not ( = ?auto_262484 ?auto_262486 ) ) ( not ( = ?auto_262484 ?auto_262487 ) ) ( not ( = ?auto_262484 ?auto_262488 ) ) ( not ( = ?auto_262484 ?auto_262489 ) ) ( not ( = ?auto_262484 ?auto_262490 ) ) ( not ( = ?auto_262484 ?auto_262491 ) ) ( not ( = ?auto_262484 ?auto_262492 ) ) ( not ( = ?auto_262485 ?auto_262486 ) ) ( not ( = ?auto_262485 ?auto_262487 ) ) ( not ( = ?auto_262485 ?auto_262488 ) ) ( not ( = ?auto_262485 ?auto_262489 ) ) ( not ( = ?auto_262485 ?auto_262490 ) ) ( not ( = ?auto_262485 ?auto_262491 ) ) ( not ( = ?auto_262485 ?auto_262492 ) ) ( not ( = ?auto_262486 ?auto_262487 ) ) ( not ( = ?auto_262486 ?auto_262488 ) ) ( not ( = ?auto_262486 ?auto_262489 ) ) ( not ( = ?auto_262486 ?auto_262490 ) ) ( not ( = ?auto_262486 ?auto_262491 ) ) ( not ( = ?auto_262486 ?auto_262492 ) ) ( not ( = ?auto_262487 ?auto_262488 ) ) ( not ( = ?auto_262487 ?auto_262489 ) ) ( not ( = ?auto_262487 ?auto_262490 ) ) ( not ( = ?auto_262487 ?auto_262491 ) ) ( not ( = ?auto_262487 ?auto_262492 ) ) ( not ( = ?auto_262488 ?auto_262489 ) ) ( not ( = ?auto_262488 ?auto_262490 ) ) ( not ( = ?auto_262488 ?auto_262491 ) ) ( not ( = ?auto_262488 ?auto_262492 ) ) ( not ( = ?auto_262489 ?auto_262490 ) ) ( not ( = ?auto_262489 ?auto_262491 ) ) ( not ( = ?auto_262489 ?auto_262492 ) ) ( not ( = ?auto_262490 ?auto_262491 ) ) ( not ( = ?auto_262490 ?auto_262492 ) ) ( not ( = ?auto_262491 ?auto_262492 ) ) ( ON ?auto_262490 ?auto_262491 ) ( ON ?auto_262489 ?auto_262490 ) ( ON ?auto_262488 ?auto_262489 ) ( ON ?auto_262487 ?auto_262488 ) ( CLEAR ?auto_262485 ) ( ON ?auto_262486 ?auto_262487 ) ( CLEAR ?auto_262486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_262482 ?auto_262483 ?auto_262484 ?auto_262485 ?auto_262486 )
      ( MAKE-10PILE ?auto_262482 ?auto_262483 ?auto_262484 ?auto_262485 ?auto_262486 ?auto_262487 ?auto_262488 ?auto_262489 ?auto_262490 ?auto_262491 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262524 - BLOCK
      ?auto_262525 - BLOCK
      ?auto_262526 - BLOCK
      ?auto_262527 - BLOCK
      ?auto_262528 - BLOCK
      ?auto_262529 - BLOCK
      ?auto_262530 - BLOCK
      ?auto_262531 - BLOCK
      ?auto_262532 - BLOCK
      ?auto_262533 - BLOCK
    )
    :vars
    (
      ?auto_262534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262533 ?auto_262534 ) ( ON-TABLE ?auto_262524 ) ( ON ?auto_262525 ?auto_262524 ) ( ON ?auto_262526 ?auto_262525 ) ( not ( = ?auto_262524 ?auto_262525 ) ) ( not ( = ?auto_262524 ?auto_262526 ) ) ( not ( = ?auto_262524 ?auto_262527 ) ) ( not ( = ?auto_262524 ?auto_262528 ) ) ( not ( = ?auto_262524 ?auto_262529 ) ) ( not ( = ?auto_262524 ?auto_262530 ) ) ( not ( = ?auto_262524 ?auto_262531 ) ) ( not ( = ?auto_262524 ?auto_262532 ) ) ( not ( = ?auto_262524 ?auto_262533 ) ) ( not ( = ?auto_262524 ?auto_262534 ) ) ( not ( = ?auto_262525 ?auto_262526 ) ) ( not ( = ?auto_262525 ?auto_262527 ) ) ( not ( = ?auto_262525 ?auto_262528 ) ) ( not ( = ?auto_262525 ?auto_262529 ) ) ( not ( = ?auto_262525 ?auto_262530 ) ) ( not ( = ?auto_262525 ?auto_262531 ) ) ( not ( = ?auto_262525 ?auto_262532 ) ) ( not ( = ?auto_262525 ?auto_262533 ) ) ( not ( = ?auto_262525 ?auto_262534 ) ) ( not ( = ?auto_262526 ?auto_262527 ) ) ( not ( = ?auto_262526 ?auto_262528 ) ) ( not ( = ?auto_262526 ?auto_262529 ) ) ( not ( = ?auto_262526 ?auto_262530 ) ) ( not ( = ?auto_262526 ?auto_262531 ) ) ( not ( = ?auto_262526 ?auto_262532 ) ) ( not ( = ?auto_262526 ?auto_262533 ) ) ( not ( = ?auto_262526 ?auto_262534 ) ) ( not ( = ?auto_262527 ?auto_262528 ) ) ( not ( = ?auto_262527 ?auto_262529 ) ) ( not ( = ?auto_262527 ?auto_262530 ) ) ( not ( = ?auto_262527 ?auto_262531 ) ) ( not ( = ?auto_262527 ?auto_262532 ) ) ( not ( = ?auto_262527 ?auto_262533 ) ) ( not ( = ?auto_262527 ?auto_262534 ) ) ( not ( = ?auto_262528 ?auto_262529 ) ) ( not ( = ?auto_262528 ?auto_262530 ) ) ( not ( = ?auto_262528 ?auto_262531 ) ) ( not ( = ?auto_262528 ?auto_262532 ) ) ( not ( = ?auto_262528 ?auto_262533 ) ) ( not ( = ?auto_262528 ?auto_262534 ) ) ( not ( = ?auto_262529 ?auto_262530 ) ) ( not ( = ?auto_262529 ?auto_262531 ) ) ( not ( = ?auto_262529 ?auto_262532 ) ) ( not ( = ?auto_262529 ?auto_262533 ) ) ( not ( = ?auto_262529 ?auto_262534 ) ) ( not ( = ?auto_262530 ?auto_262531 ) ) ( not ( = ?auto_262530 ?auto_262532 ) ) ( not ( = ?auto_262530 ?auto_262533 ) ) ( not ( = ?auto_262530 ?auto_262534 ) ) ( not ( = ?auto_262531 ?auto_262532 ) ) ( not ( = ?auto_262531 ?auto_262533 ) ) ( not ( = ?auto_262531 ?auto_262534 ) ) ( not ( = ?auto_262532 ?auto_262533 ) ) ( not ( = ?auto_262532 ?auto_262534 ) ) ( not ( = ?auto_262533 ?auto_262534 ) ) ( ON ?auto_262532 ?auto_262533 ) ( ON ?auto_262531 ?auto_262532 ) ( ON ?auto_262530 ?auto_262531 ) ( ON ?auto_262529 ?auto_262530 ) ( ON ?auto_262528 ?auto_262529 ) ( CLEAR ?auto_262526 ) ( ON ?auto_262527 ?auto_262528 ) ( CLEAR ?auto_262527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_262524 ?auto_262525 ?auto_262526 ?auto_262527 )
      ( MAKE-10PILE ?auto_262524 ?auto_262525 ?auto_262526 ?auto_262527 ?auto_262528 ?auto_262529 ?auto_262530 ?auto_262531 ?auto_262532 ?auto_262533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262566 - BLOCK
      ?auto_262567 - BLOCK
      ?auto_262568 - BLOCK
      ?auto_262569 - BLOCK
      ?auto_262570 - BLOCK
      ?auto_262571 - BLOCK
      ?auto_262572 - BLOCK
      ?auto_262573 - BLOCK
      ?auto_262574 - BLOCK
      ?auto_262575 - BLOCK
    )
    :vars
    (
      ?auto_262576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262575 ?auto_262576 ) ( ON-TABLE ?auto_262566 ) ( ON ?auto_262567 ?auto_262566 ) ( not ( = ?auto_262566 ?auto_262567 ) ) ( not ( = ?auto_262566 ?auto_262568 ) ) ( not ( = ?auto_262566 ?auto_262569 ) ) ( not ( = ?auto_262566 ?auto_262570 ) ) ( not ( = ?auto_262566 ?auto_262571 ) ) ( not ( = ?auto_262566 ?auto_262572 ) ) ( not ( = ?auto_262566 ?auto_262573 ) ) ( not ( = ?auto_262566 ?auto_262574 ) ) ( not ( = ?auto_262566 ?auto_262575 ) ) ( not ( = ?auto_262566 ?auto_262576 ) ) ( not ( = ?auto_262567 ?auto_262568 ) ) ( not ( = ?auto_262567 ?auto_262569 ) ) ( not ( = ?auto_262567 ?auto_262570 ) ) ( not ( = ?auto_262567 ?auto_262571 ) ) ( not ( = ?auto_262567 ?auto_262572 ) ) ( not ( = ?auto_262567 ?auto_262573 ) ) ( not ( = ?auto_262567 ?auto_262574 ) ) ( not ( = ?auto_262567 ?auto_262575 ) ) ( not ( = ?auto_262567 ?auto_262576 ) ) ( not ( = ?auto_262568 ?auto_262569 ) ) ( not ( = ?auto_262568 ?auto_262570 ) ) ( not ( = ?auto_262568 ?auto_262571 ) ) ( not ( = ?auto_262568 ?auto_262572 ) ) ( not ( = ?auto_262568 ?auto_262573 ) ) ( not ( = ?auto_262568 ?auto_262574 ) ) ( not ( = ?auto_262568 ?auto_262575 ) ) ( not ( = ?auto_262568 ?auto_262576 ) ) ( not ( = ?auto_262569 ?auto_262570 ) ) ( not ( = ?auto_262569 ?auto_262571 ) ) ( not ( = ?auto_262569 ?auto_262572 ) ) ( not ( = ?auto_262569 ?auto_262573 ) ) ( not ( = ?auto_262569 ?auto_262574 ) ) ( not ( = ?auto_262569 ?auto_262575 ) ) ( not ( = ?auto_262569 ?auto_262576 ) ) ( not ( = ?auto_262570 ?auto_262571 ) ) ( not ( = ?auto_262570 ?auto_262572 ) ) ( not ( = ?auto_262570 ?auto_262573 ) ) ( not ( = ?auto_262570 ?auto_262574 ) ) ( not ( = ?auto_262570 ?auto_262575 ) ) ( not ( = ?auto_262570 ?auto_262576 ) ) ( not ( = ?auto_262571 ?auto_262572 ) ) ( not ( = ?auto_262571 ?auto_262573 ) ) ( not ( = ?auto_262571 ?auto_262574 ) ) ( not ( = ?auto_262571 ?auto_262575 ) ) ( not ( = ?auto_262571 ?auto_262576 ) ) ( not ( = ?auto_262572 ?auto_262573 ) ) ( not ( = ?auto_262572 ?auto_262574 ) ) ( not ( = ?auto_262572 ?auto_262575 ) ) ( not ( = ?auto_262572 ?auto_262576 ) ) ( not ( = ?auto_262573 ?auto_262574 ) ) ( not ( = ?auto_262573 ?auto_262575 ) ) ( not ( = ?auto_262573 ?auto_262576 ) ) ( not ( = ?auto_262574 ?auto_262575 ) ) ( not ( = ?auto_262574 ?auto_262576 ) ) ( not ( = ?auto_262575 ?auto_262576 ) ) ( ON ?auto_262574 ?auto_262575 ) ( ON ?auto_262573 ?auto_262574 ) ( ON ?auto_262572 ?auto_262573 ) ( ON ?auto_262571 ?auto_262572 ) ( ON ?auto_262570 ?auto_262571 ) ( ON ?auto_262569 ?auto_262570 ) ( CLEAR ?auto_262567 ) ( ON ?auto_262568 ?auto_262569 ) ( CLEAR ?auto_262568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_262566 ?auto_262567 ?auto_262568 )
      ( MAKE-10PILE ?auto_262566 ?auto_262567 ?auto_262568 ?auto_262569 ?auto_262570 ?auto_262571 ?auto_262572 ?auto_262573 ?auto_262574 ?auto_262575 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262608 - BLOCK
      ?auto_262609 - BLOCK
      ?auto_262610 - BLOCK
      ?auto_262611 - BLOCK
      ?auto_262612 - BLOCK
      ?auto_262613 - BLOCK
      ?auto_262614 - BLOCK
      ?auto_262615 - BLOCK
      ?auto_262616 - BLOCK
      ?auto_262617 - BLOCK
    )
    :vars
    (
      ?auto_262618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262617 ?auto_262618 ) ( ON-TABLE ?auto_262608 ) ( not ( = ?auto_262608 ?auto_262609 ) ) ( not ( = ?auto_262608 ?auto_262610 ) ) ( not ( = ?auto_262608 ?auto_262611 ) ) ( not ( = ?auto_262608 ?auto_262612 ) ) ( not ( = ?auto_262608 ?auto_262613 ) ) ( not ( = ?auto_262608 ?auto_262614 ) ) ( not ( = ?auto_262608 ?auto_262615 ) ) ( not ( = ?auto_262608 ?auto_262616 ) ) ( not ( = ?auto_262608 ?auto_262617 ) ) ( not ( = ?auto_262608 ?auto_262618 ) ) ( not ( = ?auto_262609 ?auto_262610 ) ) ( not ( = ?auto_262609 ?auto_262611 ) ) ( not ( = ?auto_262609 ?auto_262612 ) ) ( not ( = ?auto_262609 ?auto_262613 ) ) ( not ( = ?auto_262609 ?auto_262614 ) ) ( not ( = ?auto_262609 ?auto_262615 ) ) ( not ( = ?auto_262609 ?auto_262616 ) ) ( not ( = ?auto_262609 ?auto_262617 ) ) ( not ( = ?auto_262609 ?auto_262618 ) ) ( not ( = ?auto_262610 ?auto_262611 ) ) ( not ( = ?auto_262610 ?auto_262612 ) ) ( not ( = ?auto_262610 ?auto_262613 ) ) ( not ( = ?auto_262610 ?auto_262614 ) ) ( not ( = ?auto_262610 ?auto_262615 ) ) ( not ( = ?auto_262610 ?auto_262616 ) ) ( not ( = ?auto_262610 ?auto_262617 ) ) ( not ( = ?auto_262610 ?auto_262618 ) ) ( not ( = ?auto_262611 ?auto_262612 ) ) ( not ( = ?auto_262611 ?auto_262613 ) ) ( not ( = ?auto_262611 ?auto_262614 ) ) ( not ( = ?auto_262611 ?auto_262615 ) ) ( not ( = ?auto_262611 ?auto_262616 ) ) ( not ( = ?auto_262611 ?auto_262617 ) ) ( not ( = ?auto_262611 ?auto_262618 ) ) ( not ( = ?auto_262612 ?auto_262613 ) ) ( not ( = ?auto_262612 ?auto_262614 ) ) ( not ( = ?auto_262612 ?auto_262615 ) ) ( not ( = ?auto_262612 ?auto_262616 ) ) ( not ( = ?auto_262612 ?auto_262617 ) ) ( not ( = ?auto_262612 ?auto_262618 ) ) ( not ( = ?auto_262613 ?auto_262614 ) ) ( not ( = ?auto_262613 ?auto_262615 ) ) ( not ( = ?auto_262613 ?auto_262616 ) ) ( not ( = ?auto_262613 ?auto_262617 ) ) ( not ( = ?auto_262613 ?auto_262618 ) ) ( not ( = ?auto_262614 ?auto_262615 ) ) ( not ( = ?auto_262614 ?auto_262616 ) ) ( not ( = ?auto_262614 ?auto_262617 ) ) ( not ( = ?auto_262614 ?auto_262618 ) ) ( not ( = ?auto_262615 ?auto_262616 ) ) ( not ( = ?auto_262615 ?auto_262617 ) ) ( not ( = ?auto_262615 ?auto_262618 ) ) ( not ( = ?auto_262616 ?auto_262617 ) ) ( not ( = ?auto_262616 ?auto_262618 ) ) ( not ( = ?auto_262617 ?auto_262618 ) ) ( ON ?auto_262616 ?auto_262617 ) ( ON ?auto_262615 ?auto_262616 ) ( ON ?auto_262614 ?auto_262615 ) ( ON ?auto_262613 ?auto_262614 ) ( ON ?auto_262612 ?auto_262613 ) ( ON ?auto_262611 ?auto_262612 ) ( ON ?auto_262610 ?auto_262611 ) ( CLEAR ?auto_262608 ) ( ON ?auto_262609 ?auto_262610 ) ( CLEAR ?auto_262609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_262608 ?auto_262609 )
      ( MAKE-10PILE ?auto_262608 ?auto_262609 ?auto_262610 ?auto_262611 ?auto_262612 ?auto_262613 ?auto_262614 ?auto_262615 ?auto_262616 ?auto_262617 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_262650 - BLOCK
      ?auto_262651 - BLOCK
      ?auto_262652 - BLOCK
      ?auto_262653 - BLOCK
      ?auto_262654 - BLOCK
      ?auto_262655 - BLOCK
      ?auto_262656 - BLOCK
      ?auto_262657 - BLOCK
      ?auto_262658 - BLOCK
      ?auto_262659 - BLOCK
    )
    :vars
    (
      ?auto_262660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262659 ?auto_262660 ) ( not ( = ?auto_262650 ?auto_262651 ) ) ( not ( = ?auto_262650 ?auto_262652 ) ) ( not ( = ?auto_262650 ?auto_262653 ) ) ( not ( = ?auto_262650 ?auto_262654 ) ) ( not ( = ?auto_262650 ?auto_262655 ) ) ( not ( = ?auto_262650 ?auto_262656 ) ) ( not ( = ?auto_262650 ?auto_262657 ) ) ( not ( = ?auto_262650 ?auto_262658 ) ) ( not ( = ?auto_262650 ?auto_262659 ) ) ( not ( = ?auto_262650 ?auto_262660 ) ) ( not ( = ?auto_262651 ?auto_262652 ) ) ( not ( = ?auto_262651 ?auto_262653 ) ) ( not ( = ?auto_262651 ?auto_262654 ) ) ( not ( = ?auto_262651 ?auto_262655 ) ) ( not ( = ?auto_262651 ?auto_262656 ) ) ( not ( = ?auto_262651 ?auto_262657 ) ) ( not ( = ?auto_262651 ?auto_262658 ) ) ( not ( = ?auto_262651 ?auto_262659 ) ) ( not ( = ?auto_262651 ?auto_262660 ) ) ( not ( = ?auto_262652 ?auto_262653 ) ) ( not ( = ?auto_262652 ?auto_262654 ) ) ( not ( = ?auto_262652 ?auto_262655 ) ) ( not ( = ?auto_262652 ?auto_262656 ) ) ( not ( = ?auto_262652 ?auto_262657 ) ) ( not ( = ?auto_262652 ?auto_262658 ) ) ( not ( = ?auto_262652 ?auto_262659 ) ) ( not ( = ?auto_262652 ?auto_262660 ) ) ( not ( = ?auto_262653 ?auto_262654 ) ) ( not ( = ?auto_262653 ?auto_262655 ) ) ( not ( = ?auto_262653 ?auto_262656 ) ) ( not ( = ?auto_262653 ?auto_262657 ) ) ( not ( = ?auto_262653 ?auto_262658 ) ) ( not ( = ?auto_262653 ?auto_262659 ) ) ( not ( = ?auto_262653 ?auto_262660 ) ) ( not ( = ?auto_262654 ?auto_262655 ) ) ( not ( = ?auto_262654 ?auto_262656 ) ) ( not ( = ?auto_262654 ?auto_262657 ) ) ( not ( = ?auto_262654 ?auto_262658 ) ) ( not ( = ?auto_262654 ?auto_262659 ) ) ( not ( = ?auto_262654 ?auto_262660 ) ) ( not ( = ?auto_262655 ?auto_262656 ) ) ( not ( = ?auto_262655 ?auto_262657 ) ) ( not ( = ?auto_262655 ?auto_262658 ) ) ( not ( = ?auto_262655 ?auto_262659 ) ) ( not ( = ?auto_262655 ?auto_262660 ) ) ( not ( = ?auto_262656 ?auto_262657 ) ) ( not ( = ?auto_262656 ?auto_262658 ) ) ( not ( = ?auto_262656 ?auto_262659 ) ) ( not ( = ?auto_262656 ?auto_262660 ) ) ( not ( = ?auto_262657 ?auto_262658 ) ) ( not ( = ?auto_262657 ?auto_262659 ) ) ( not ( = ?auto_262657 ?auto_262660 ) ) ( not ( = ?auto_262658 ?auto_262659 ) ) ( not ( = ?auto_262658 ?auto_262660 ) ) ( not ( = ?auto_262659 ?auto_262660 ) ) ( ON ?auto_262658 ?auto_262659 ) ( ON ?auto_262657 ?auto_262658 ) ( ON ?auto_262656 ?auto_262657 ) ( ON ?auto_262655 ?auto_262656 ) ( ON ?auto_262654 ?auto_262655 ) ( ON ?auto_262653 ?auto_262654 ) ( ON ?auto_262652 ?auto_262653 ) ( ON ?auto_262651 ?auto_262652 ) ( ON ?auto_262650 ?auto_262651 ) ( CLEAR ?auto_262650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_262650 )
      ( MAKE-10PILE ?auto_262650 ?auto_262651 ?auto_262652 ?auto_262653 ?auto_262654 ?auto_262655 ?auto_262656 ?auto_262657 ?auto_262658 ?auto_262659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262693 - BLOCK
      ?auto_262694 - BLOCK
      ?auto_262695 - BLOCK
      ?auto_262696 - BLOCK
      ?auto_262697 - BLOCK
      ?auto_262698 - BLOCK
      ?auto_262699 - BLOCK
      ?auto_262700 - BLOCK
      ?auto_262701 - BLOCK
      ?auto_262702 - BLOCK
      ?auto_262703 - BLOCK
    )
    :vars
    (
      ?auto_262704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_262702 ) ( ON ?auto_262703 ?auto_262704 ) ( CLEAR ?auto_262703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_262693 ) ( ON ?auto_262694 ?auto_262693 ) ( ON ?auto_262695 ?auto_262694 ) ( ON ?auto_262696 ?auto_262695 ) ( ON ?auto_262697 ?auto_262696 ) ( ON ?auto_262698 ?auto_262697 ) ( ON ?auto_262699 ?auto_262698 ) ( ON ?auto_262700 ?auto_262699 ) ( ON ?auto_262701 ?auto_262700 ) ( ON ?auto_262702 ?auto_262701 ) ( not ( = ?auto_262693 ?auto_262694 ) ) ( not ( = ?auto_262693 ?auto_262695 ) ) ( not ( = ?auto_262693 ?auto_262696 ) ) ( not ( = ?auto_262693 ?auto_262697 ) ) ( not ( = ?auto_262693 ?auto_262698 ) ) ( not ( = ?auto_262693 ?auto_262699 ) ) ( not ( = ?auto_262693 ?auto_262700 ) ) ( not ( = ?auto_262693 ?auto_262701 ) ) ( not ( = ?auto_262693 ?auto_262702 ) ) ( not ( = ?auto_262693 ?auto_262703 ) ) ( not ( = ?auto_262693 ?auto_262704 ) ) ( not ( = ?auto_262694 ?auto_262695 ) ) ( not ( = ?auto_262694 ?auto_262696 ) ) ( not ( = ?auto_262694 ?auto_262697 ) ) ( not ( = ?auto_262694 ?auto_262698 ) ) ( not ( = ?auto_262694 ?auto_262699 ) ) ( not ( = ?auto_262694 ?auto_262700 ) ) ( not ( = ?auto_262694 ?auto_262701 ) ) ( not ( = ?auto_262694 ?auto_262702 ) ) ( not ( = ?auto_262694 ?auto_262703 ) ) ( not ( = ?auto_262694 ?auto_262704 ) ) ( not ( = ?auto_262695 ?auto_262696 ) ) ( not ( = ?auto_262695 ?auto_262697 ) ) ( not ( = ?auto_262695 ?auto_262698 ) ) ( not ( = ?auto_262695 ?auto_262699 ) ) ( not ( = ?auto_262695 ?auto_262700 ) ) ( not ( = ?auto_262695 ?auto_262701 ) ) ( not ( = ?auto_262695 ?auto_262702 ) ) ( not ( = ?auto_262695 ?auto_262703 ) ) ( not ( = ?auto_262695 ?auto_262704 ) ) ( not ( = ?auto_262696 ?auto_262697 ) ) ( not ( = ?auto_262696 ?auto_262698 ) ) ( not ( = ?auto_262696 ?auto_262699 ) ) ( not ( = ?auto_262696 ?auto_262700 ) ) ( not ( = ?auto_262696 ?auto_262701 ) ) ( not ( = ?auto_262696 ?auto_262702 ) ) ( not ( = ?auto_262696 ?auto_262703 ) ) ( not ( = ?auto_262696 ?auto_262704 ) ) ( not ( = ?auto_262697 ?auto_262698 ) ) ( not ( = ?auto_262697 ?auto_262699 ) ) ( not ( = ?auto_262697 ?auto_262700 ) ) ( not ( = ?auto_262697 ?auto_262701 ) ) ( not ( = ?auto_262697 ?auto_262702 ) ) ( not ( = ?auto_262697 ?auto_262703 ) ) ( not ( = ?auto_262697 ?auto_262704 ) ) ( not ( = ?auto_262698 ?auto_262699 ) ) ( not ( = ?auto_262698 ?auto_262700 ) ) ( not ( = ?auto_262698 ?auto_262701 ) ) ( not ( = ?auto_262698 ?auto_262702 ) ) ( not ( = ?auto_262698 ?auto_262703 ) ) ( not ( = ?auto_262698 ?auto_262704 ) ) ( not ( = ?auto_262699 ?auto_262700 ) ) ( not ( = ?auto_262699 ?auto_262701 ) ) ( not ( = ?auto_262699 ?auto_262702 ) ) ( not ( = ?auto_262699 ?auto_262703 ) ) ( not ( = ?auto_262699 ?auto_262704 ) ) ( not ( = ?auto_262700 ?auto_262701 ) ) ( not ( = ?auto_262700 ?auto_262702 ) ) ( not ( = ?auto_262700 ?auto_262703 ) ) ( not ( = ?auto_262700 ?auto_262704 ) ) ( not ( = ?auto_262701 ?auto_262702 ) ) ( not ( = ?auto_262701 ?auto_262703 ) ) ( not ( = ?auto_262701 ?auto_262704 ) ) ( not ( = ?auto_262702 ?auto_262703 ) ) ( not ( = ?auto_262702 ?auto_262704 ) ) ( not ( = ?auto_262703 ?auto_262704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_262703 ?auto_262704 )
      ( !STACK ?auto_262703 ?auto_262702 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262739 - BLOCK
      ?auto_262740 - BLOCK
      ?auto_262741 - BLOCK
      ?auto_262742 - BLOCK
      ?auto_262743 - BLOCK
      ?auto_262744 - BLOCK
      ?auto_262745 - BLOCK
      ?auto_262746 - BLOCK
      ?auto_262747 - BLOCK
      ?auto_262748 - BLOCK
      ?auto_262749 - BLOCK
    )
    :vars
    (
      ?auto_262750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262749 ?auto_262750 ) ( ON-TABLE ?auto_262739 ) ( ON ?auto_262740 ?auto_262739 ) ( ON ?auto_262741 ?auto_262740 ) ( ON ?auto_262742 ?auto_262741 ) ( ON ?auto_262743 ?auto_262742 ) ( ON ?auto_262744 ?auto_262743 ) ( ON ?auto_262745 ?auto_262744 ) ( ON ?auto_262746 ?auto_262745 ) ( ON ?auto_262747 ?auto_262746 ) ( not ( = ?auto_262739 ?auto_262740 ) ) ( not ( = ?auto_262739 ?auto_262741 ) ) ( not ( = ?auto_262739 ?auto_262742 ) ) ( not ( = ?auto_262739 ?auto_262743 ) ) ( not ( = ?auto_262739 ?auto_262744 ) ) ( not ( = ?auto_262739 ?auto_262745 ) ) ( not ( = ?auto_262739 ?auto_262746 ) ) ( not ( = ?auto_262739 ?auto_262747 ) ) ( not ( = ?auto_262739 ?auto_262748 ) ) ( not ( = ?auto_262739 ?auto_262749 ) ) ( not ( = ?auto_262739 ?auto_262750 ) ) ( not ( = ?auto_262740 ?auto_262741 ) ) ( not ( = ?auto_262740 ?auto_262742 ) ) ( not ( = ?auto_262740 ?auto_262743 ) ) ( not ( = ?auto_262740 ?auto_262744 ) ) ( not ( = ?auto_262740 ?auto_262745 ) ) ( not ( = ?auto_262740 ?auto_262746 ) ) ( not ( = ?auto_262740 ?auto_262747 ) ) ( not ( = ?auto_262740 ?auto_262748 ) ) ( not ( = ?auto_262740 ?auto_262749 ) ) ( not ( = ?auto_262740 ?auto_262750 ) ) ( not ( = ?auto_262741 ?auto_262742 ) ) ( not ( = ?auto_262741 ?auto_262743 ) ) ( not ( = ?auto_262741 ?auto_262744 ) ) ( not ( = ?auto_262741 ?auto_262745 ) ) ( not ( = ?auto_262741 ?auto_262746 ) ) ( not ( = ?auto_262741 ?auto_262747 ) ) ( not ( = ?auto_262741 ?auto_262748 ) ) ( not ( = ?auto_262741 ?auto_262749 ) ) ( not ( = ?auto_262741 ?auto_262750 ) ) ( not ( = ?auto_262742 ?auto_262743 ) ) ( not ( = ?auto_262742 ?auto_262744 ) ) ( not ( = ?auto_262742 ?auto_262745 ) ) ( not ( = ?auto_262742 ?auto_262746 ) ) ( not ( = ?auto_262742 ?auto_262747 ) ) ( not ( = ?auto_262742 ?auto_262748 ) ) ( not ( = ?auto_262742 ?auto_262749 ) ) ( not ( = ?auto_262742 ?auto_262750 ) ) ( not ( = ?auto_262743 ?auto_262744 ) ) ( not ( = ?auto_262743 ?auto_262745 ) ) ( not ( = ?auto_262743 ?auto_262746 ) ) ( not ( = ?auto_262743 ?auto_262747 ) ) ( not ( = ?auto_262743 ?auto_262748 ) ) ( not ( = ?auto_262743 ?auto_262749 ) ) ( not ( = ?auto_262743 ?auto_262750 ) ) ( not ( = ?auto_262744 ?auto_262745 ) ) ( not ( = ?auto_262744 ?auto_262746 ) ) ( not ( = ?auto_262744 ?auto_262747 ) ) ( not ( = ?auto_262744 ?auto_262748 ) ) ( not ( = ?auto_262744 ?auto_262749 ) ) ( not ( = ?auto_262744 ?auto_262750 ) ) ( not ( = ?auto_262745 ?auto_262746 ) ) ( not ( = ?auto_262745 ?auto_262747 ) ) ( not ( = ?auto_262745 ?auto_262748 ) ) ( not ( = ?auto_262745 ?auto_262749 ) ) ( not ( = ?auto_262745 ?auto_262750 ) ) ( not ( = ?auto_262746 ?auto_262747 ) ) ( not ( = ?auto_262746 ?auto_262748 ) ) ( not ( = ?auto_262746 ?auto_262749 ) ) ( not ( = ?auto_262746 ?auto_262750 ) ) ( not ( = ?auto_262747 ?auto_262748 ) ) ( not ( = ?auto_262747 ?auto_262749 ) ) ( not ( = ?auto_262747 ?auto_262750 ) ) ( not ( = ?auto_262748 ?auto_262749 ) ) ( not ( = ?auto_262748 ?auto_262750 ) ) ( not ( = ?auto_262749 ?auto_262750 ) ) ( CLEAR ?auto_262747 ) ( ON ?auto_262748 ?auto_262749 ) ( CLEAR ?auto_262748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_262739 ?auto_262740 ?auto_262741 ?auto_262742 ?auto_262743 ?auto_262744 ?auto_262745 ?auto_262746 ?auto_262747 ?auto_262748 )
      ( MAKE-11PILE ?auto_262739 ?auto_262740 ?auto_262741 ?auto_262742 ?auto_262743 ?auto_262744 ?auto_262745 ?auto_262746 ?auto_262747 ?auto_262748 ?auto_262749 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262785 - BLOCK
      ?auto_262786 - BLOCK
      ?auto_262787 - BLOCK
      ?auto_262788 - BLOCK
      ?auto_262789 - BLOCK
      ?auto_262790 - BLOCK
      ?auto_262791 - BLOCK
      ?auto_262792 - BLOCK
      ?auto_262793 - BLOCK
      ?auto_262794 - BLOCK
      ?auto_262795 - BLOCK
    )
    :vars
    (
      ?auto_262796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262795 ?auto_262796 ) ( ON-TABLE ?auto_262785 ) ( ON ?auto_262786 ?auto_262785 ) ( ON ?auto_262787 ?auto_262786 ) ( ON ?auto_262788 ?auto_262787 ) ( ON ?auto_262789 ?auto_262788 ) ( ON ?auto_262790 ?auto_262789 ) ( ON ?auto_262791 ?auto_262790 ) ( ON ?auto_262792 ?auto_262791 ) ( not ( = ?auto_262785 ?auto_262786 ) ) ( not ( = ?auto_262785 ?auto_262787 ) ) ( not ( = ?auto_262785 ?auto_262788 ) ) ( not ( = ?auto_262785 ?auto_262789 ) ) ( not ( = ?auto_262785 ?auto_262790 ) ) ( not ( = ?auto_262785 ?auto_262791 ) ) ( not ( = ?auto_262785 ?auto_262792 ) ) ( not ( = ?auto_262785 ?auto_262793 ) ) ( not ( = ?auto_262785 ?auto_262794 ) ) ( not ( = ?auto_262785 ?auto_262795 ) ) ( not ( = ?auto_262785 ?auto_262796 ) ) ( not ( = ?auto_262786 ?auto_262787 ) ) ( not ( = ?auto_262786 ?auto_262788 ) ) ( not ( = ?auto_262786 ?auto_262789 ) ) ( not ( = ?auto_262786 ?auto_262790 ) ) ( not ( = ?auto_262786 ?auto_262791 ) ) ( not ( = ?auto_262786 ?auto_262792 ) ) ( not ( = ?auto_262786 ?auto_262793 ) ) ( not ( = ?auto_262786 ?auto_262794 ) ) ( not ( = ?auto_262786 ?auto_262795 ) ) ( not ( = ?auto_262786 ?auto_262796 ) ) ( not ( = ?auto_262787 ?auto_262788 ) ) ( not ( = ?auto_262787 ?auto_262789 ) ) ( not ( = ?auto_262787 ?auto_262790 ) ) ( not ( = ?auto_262787 ?auto_262791 ) ) ( not ( = ?auto_262787 ?auto_262792 ) ) ( not ( = ?auto_262787 ?auto_262793 ) ) ( not ( = ?auto_262787 ?auto_262794 ) ) ( not ( = ?auto_262787 ?auto_262795 ) ) ( not ( = ?auto_262787 ?auto_262796 ) ) ( not ( = ?auto_262788 ?auto_262789 ) ) ( not ( = ?auto_262788 ?auto_262790 ) ) ( not ( = ?auto_262788 ?auto_262791 ) ) ( not ( = ?auto_262788 ?auto_262792 ) ) ( not ( = ?auto_262788 ?auto_262793 ) ) ( not ( = ?auto_262788 ?auto_262794 ) ) ( not ( = ?auto_262788 ?auto_262795 ) ) ( not ( = ?auto_262788 ?auto_262796 ) ) ( not ( = ?auto_262789 ?auto_262790 ) ) ( not ( = ?auto_262789 ?auto_262791 ) ) ( not ( = ?auto_262789 ?auto_262792 ) ) ( not ( = ?auto_262789 ?auto_262793 ) ) ( not ( = ?auto_262789 ?auto_262794 ) ) ( not ( = ?auto_262789 ?auto_262795 ) ) ( not ( = ?auto_262789 ?auto_262796 ) ) ( not ( = ?auto_262790 ?auto_262791 ) ) ( not ( = ?auto_262790 ?auto_262792 ) ) ( not ( = ?auto_262790 ?auto_262793 ) ) ( not ( = ?auto_262790 ?auto_262794 ) ) ( not ( = ?auto_262790 ?auto_262795 ) ) ( not ( = ?auto_262790 ?auto_262796 ) ) ( not ( = ?auto_262791 ?auto_262792 ) ) ( not ( = ?auto_262791 ?auto_262793 ) ) ( not ( = ?auto_262791 ?auto_262794 ) ) ( not ( = ?auto_262791 ?auto_262795 ) ) ( not ( = ?auto_262791 ?auto_262796 ) ) ( not ( = ?auto_262792 ?auto_262793 ) ) ( not ( = ?auto_262792 ?auto_262794 ) ) ( not ( = ?auto_262792 ?auto_262795 ) ) ( not ( = ?auto_262792 ?auto_262796 ) ) ( not ( = ?auto_262793 ?auto_262794 ) ) ( not ( = ?auto_262793 ?auto_262795 ) ) ( not ( = ?auto_262793 ?auto_262796 ) ) ( not ( = ?auto_262794 ?auto_262795 ) ) ( not ( = ?auto_262794 ?auto_262796 ) ) ( not ( = ?auto_262795 ?auto_262796 ) ) ( ON ?auto_262794 ?auto_262795 ) ( CLEAR ?auto_262792 ) ( ON ?auto_262793 ?auto_262794 ) ( CLEAR ?auto_262793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_262785 ?auto_262786 ?auto_262787 ?auto_262788 ?auto_262789 ?auto_262790 ?auto_262791 ?auto_262792 ?auto_262793 )
      ( MAKE-11PILE ?auto_262785 ?auto_262786 ?auto_262787 ?auto_262788 ?auto_262789 ?auto_262790 ?auto_262791 ?auto_262792 ?auto_262793 ?auto_262794 ?auto_262795 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262831 - BLOCK
      ?auto_262832 - BLOCK
      ?auto_262833 - BLOCK
      ?auto_262834 - BLOCK
      ?auto_262835 - BLOCK
      ?auto_262836 - BLOCK
      ?auto_262837 - BLOCK
      ?auto_262838 - BLOCK
      ?auto_262839 - BLOCK
      ?auto_262840 - BLOCK
      ?auto_262841 - BLOCK
    )
    :vars
    (
      ?auto_262842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262841 ?auto_262842 ) ( ON-TABLE ?auto_262831 ) ( ON ?auto_262832 ?auto_262831 ) ( ON ?auto_262833 ?auto_262832 ) ( ON ?auto_262834 ?auto_262833 ) ( ON ?auto_262835 ?auto_262834 ) ( ON ?auto_262836 ?auto_262835 ) ( ON ?auto_262837 ?auto_262836 ) ( not ( = ?auto_262831 ?auto_262832 ) ) ( not ( = ?auto_262831 ?auto_262833 ) ) ( not ( = ?auto_262831 ?auto_262834 ) ) ( not ( = ?auto_262831 ?auto_262835 ) ) ( not ( = ?auto_262831 ?auto_262836 ) ) ( not ( = ?auto_262831 ?auto_262837 ) ) ( not ( = ?auto_262831 ?auto_262838 ) ) ( not ( = ?auto_262831 ?auto_262839 ) ) ( not ( = ?auto_262831 ?auto_262840 ) ) ( not ( = ?auto_262831 ?auto_262841 ) ) ( not ( = ?auto_262831 ?auto_262842 ) ) ( not ( = ?auto_262832 ?auto_262833 ) ) ( not ( = ?auto_262832 ?auto_262834 ) ) ( not ( = ?auto_262832 ?auto_262835 ) ) ( not ( = ?auto_262832 ?auto_262836 ) ) ( not ( = ?auto_262832 ?auto_262837 ) ) ( not ( = ?auto_262832 ?auto_262838 ) ) ( not ( = ?auto_262832 ?auto_262839 ) ) ( not ( = ?auto_262832 ?auto_262840 ) ) ( not ( = ?auto_262832 ?auto_262841 ) ) ( not ( = ?auto_262832 ?auto_262842 ) ) ( not ( = ?auto_262833 ?auto_262834 ) ) ( not ( = ?auto_262833 ?auto_262835 ) ) ( not ( = ?auto_262833 ?auto_262836 ) ) ( not ( = ?auto_262833 ?auto_262837 ) ) ( not ( = ?auto_262833 ?auto_262838 ) ) ( not ( = ?auto_262833 ?auto_262839 ) ) ( not ( = ?auto_262833 ?auto_262840 ) ) ( not ( = ?auto_262833 ?auto_262841 ) ) ( not ( = ?auto_262833 ?auto_262842 ) ) ( not ( = ?auto_262834 ?auto_262835 ) ) ( not ( = ?auto_262834 ?auto_262836 ) ) ( not ( = ?auto_262834 ?auto_262837 ) ) ( not ( = ?auto_262834 ?auto_262838 ) ) ( not ( = ?auto_262834 ?auto_262839 ) ) ( not ( = ?auto_262834 ?auto_262840 ) ) ( not ( = ?auto_262834 ?auto_262841 ) ) ( not ( = ?auto_262834 ?auto_262842 ) ) ( not ( = ?auto_262835 ?auto_262836 ) ) ( not ( = ?auto_262835 ?auto_262837 ) ) ( not ( = ?auto_262835 ?auto_262838 ) ) ( not ( = ?auto_262835 ?auto_262839 ) ) ( not ( = ?auto_262835 ?auto_262840 ) ) ( not ( = ?auto_262835 ?auto_262841 ) ) ( not ( = ?auto_262835 ?auto_262842 ) ) ( not ( = ?auto_262836 ?auto_262837 ) ) ( not ( = ?auto_262836 ?auto_262838 ) ) ( not ( = ?auto_262836 ?auto_262839 ) ) ( not ( = ?auto_262836 ?auto_262840 ) ) ( not ( = ?auto_262836 ?auto_262841 ) ) ( not ( = ?auto_262836 ?auto_262842 ) ) ( not ( = ?auto_262837 ?auto_262838 ) ) ( not ( = ?auto_262837 ?auto_262839 ) ) ( not ( = ?auto_262837 ?auto_262840 ) ) ( not ( = ?auto_262837 ?auto_262841 ) ) ( not ( = ?auto_262837 ?auto_262842 ) ) ( not ( = ?auto_262838 ?auto_262839 ) ) ( not ( = ?auto_262838 ?auto_262840 ) ) ( not ( = ?auto_262838 ?auto_262841 ) ) ( not ( = ?auto_262838 ?auto_262842 ) ) ( not ( = ?auto_262839 ?auto_262840 ) ) ( not ( = ?auto_262839 ?auto_262841 ) ) ( not ( = ?auto_262839 ?auto_262842 ) ) ( not ( = ?auto_262840 ?auto_262841 ) ) ( not ( = ?auto_262840 ?auto_262842 ) ) ( not ( = ?auto_262841 ?auto_262842 ) ) ( ON ?auto_262840 ?auto_262841 ) ( ON ?auto_262839 ?auto_262840 ) ( CLEAR ?auto_262837 ) ( ON ?auto_262838 ?auto_262839 ) ( CLEAR ?auto_262838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_262831 ?auto_262832 ?auto_262833 ?auto_262834 ?auto_262835 ?auto_262836 ?auto_262837 ?auto_262838 )
      ( MAKE-11PILE ?auto_262831 ?auto_262832 ?auto_262833 ?auto_262834 ?auto_262835 ?auto_262836 ?auto_262837 ?auto_262838 ?auto_262839 ?auto_262840 ?auto_262841 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262877 - BLOCK
      ?auto_262878 - BLOCK
      ?auto_262879 - BLOCK
      ?auto_262880 - BLOCK
      ?auto_262881 - BLOCK
      ?auto_262882 - BLOCK
      ?auto_262883 - BLOCK
      ?auto_262884 - BLOCK
      ?auto_262885 - BLOCK
      ?auto_262886 - BLOCK
      ?auto_262887 - BLOCK
    )
    :vars
    (
      ?auto_262888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262887 ?auto_262888 ) ( ON-TABLE ?auto_262877 ) ( ON ?auto_262878 ?auto_262877 ) ( ON ?auto_262879 ?auto_262878 ) ( ON ?auto_262880 ?auto_262879 ) ( ON ?auto_262881 ?auto_262880 ) ( ON ?auto_262882 ?auto_262881 ) ( not ( = ?auto_262877 ?auto_262878 ) ) ( not ( = ?auto_262877 ?auto_262879 ) ) ( not ( = ?auto_262877 ?auto_262880 ) ) ( not ( = ?auto_262877 ?auto_262881 ) ) ( not ( = ?auto_262877 ?auto_262882 ) ) ( not ( = ?auto_262877 ?auto_262883 ) ) ( not ( = ?auto_262877 ?auto_262884 ) ) ( not ( = ?auto_262877 ?auto_262885 ) ) ( not ( = ?auto_262877 ?auto_262886 ) ) ( not ( = ?auto_262877 ?auto_262887 ) ) ( not ( = ?auto_262877 ?auto_262888 ) ) ( not ( = ?auto_262878 ?auto_262879 ) ) ( not ( = ?auto_262878 ?auto_262880 ) ) ( not ( = ?auto_262878 ?auto_262881 ) ) ( not ( = ?auto_262878 ?auto_262882 ) ) ( not ( = ?auto_262878 ?auto_262883 ) ) ( not ( = ?auto_262878 ?auto_262884 ) ) ( not ( = ?auto_262878 ?auto_262885 ) ) ( not ( = ?auto_262878 ?auto_262886 ) ) ( not ( = ?auto_262878 ?auto_262887 ) ) ( not ( = ?auto_262878 ?auto_262888 ) ) ( not ( = ?auto_262879 ?auto_262880 ) ) ( not ( = ?auto_262879 ?auto_262881 ) ) ( not ( = ?auto_262879 ?auto_262882 ) ) ( not ( = ?auto_262879 ?auto_262883 ) ) ( not ( = ?auto_262879 ?auto_262884 ) ) ( not ( = ?auto_262879 ?auto_262885 ) ) ( not ( = ?auto_262879 ?auto_262886 ) ) ( not ( = ?auto_262879 ?auto_262887 ) ) ( not ( = ?auto_262879 ?auto_262888 ) ) ( not ( = ?auto_262880 ?auto_262881 ) ) ( not ( = ?auto_262880 ?auto_262882 ) ) ( not ( = ?auto_262880 ?auto_262883 ) ) ( not ( = ?auto_262880 ?auto_262884 ) ) ( not ( = ?auto_262880 ?auto_262885 ) ) ( not ( = ?auto_262880 ?auto_262886 ) ) ( not ( = ?auto_262880 ?auto_262887 ) ) ( not ( = ?auto_262880 ?auto_262888 ) ) ( not ( = ?auto_262881 ?auto_262882 ) ) ( not ( = ?auto_262881 ?auto_262883 ) ) ( not ( = ?auto_262881 ?auto_262884 ) ) ( not ( = ?auto_262881 ?auto_262885 ) ) ( not ( = ?auto_262881 ?auto_262886 ) ) ( not ( = ?auto_262881 ?auto_262887 ) ) ( not ( = ?auto_262881 ?auto_262888 ) ) ( not ( = ?auto_262882 ?auto_262883 ) ) ( not ( = ?auto_262882 ?auto_262884 ) ) ( not ( = ?auto_262882 ?auto_262885 ) ) ( not ( = ?auto_262882 ?auto_262886 ) ) ( not ( = ?auto_262882 ?auto_262887 ) ) ( not ( = ?auto_262882 ?auto_262888 ) ) ( not ( = ?auto_262883 ?auto_262884 ) ) ( not ( = ?auto_262883 ?auto_262885 ) ) ( not ( = ?auto_262883 ?auto_262886 ) ) ( not ( = ?auto_262883 ?auto_262887 ) ) ( not ( = ?auto_262883 ?auto_262888 ) ) ( not ( = ?auto_262884 ?auto_262885 ) ) ( not ( = ?auto_262884 ?auto_262886 ) ) ( not ( = ?auto_262884 ?auto_262887 ) ) ( not ( = ?auto_262884 ?auto_262888 ) ) ( not ( = ?auto_262885 ?auto_262886 ) ) ( not ( = ?auto_262885 ?auto_262887 ) ) ( not ( = ?auto_262885 ?auto_262888 ) ) ( not ( = ?auto_262886 ?auto_262887 ) ) ( not ( = ?auto_262886 ?auto_262888 ) ) ( not ( = ?auto_262887 ?auto_262888 ) ) ( ON ?auto_262886 ?auto_262887 ) ( ON ?auto_262885 ?auto_262886 ) ( ON ?auto_262884 ?auto_262885 ) ( CLEAR ?auto_262882 ) ( ON ?auto_262883 ?auto_262884 ) ( CLEAR ?auto_262883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_262877 ?auto_262878 ?auto_262879 ?auto_262880 ?auto_262881 ?auto_262882 ?auto_262883 )
      ( MAKE-11PILE ?auto_262877 ?auto_262878 ?auto_262879 ?auto_262880 ?auto_262881 ?auto_262882 ?auto_262883 ?auto_262884 ?auto_262885 ?auto_262886 ?auto_262887 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262923 - BLOCK
      ?auto_262924 - BLOCK
      ?auto_262925 - BLOCK
      ?auto_262926 - BLOCK
      ?auto_262927 - BLOCK
      ?auto_262928 - BLOCK
      ?auto_262929 - BLOCK
      ?auto_262930 - BLOCK
      ?auto_262931 - BLOCK
      ?auto_262932 - BLOCK
      ?auto_262933 - BLOCK
    )
    :vars
    (
      ?auto_262934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262933 ?auto_262934 ) ( ON-TABLE ?auto_262923 ) ( ON ?auto_262924 ?auto_262923 ) ( ON ?auto_262925 ?auto_262924 ) ( ON ?auto_262926 ?auto_262925 ) ( ON ?auto_262927 ?auto_262926 ) ( not ( = ?auto_262923 ?auto_262924 ) ) ( not ( = ?auto_262923 ?auto_262925 ) ) ( not ( = ?auto_262923 ?auto_262926 ) ) ( not ( = ?auto_262923 ?auto_262927 ) ) ( not ( = ?auto_262923 ?auto_262928 ) ) ( not ( = ?auto_262923 ?auto_262929 ) ) ( not ( = ?auto_262923 ?auto_262930 ) ) ( not ( = ?auto_262923 ?auto_262931 ) ) ( not ( = ?auto_262923 ?auto_262932 ) ) ( not ( = ?auto_262923 ?auto_262933 ) ) ( not ( = ?auto_262923 ?auto_262934 ) ) ( not ( = ?auto_262924 ?auto_262925 ) ) ( not ( = ?auto_262924 ?auto_262926 ) ) ( not ( = ?auto_262924 ?auto_262927 ) ) ( not ( = ?auto_262924 ?auto_262928 ) ) ( not ( = ?auto_262924 ?auto_262929 ) ) ( not ( = ?auto_262924 ?auto_262930 ) ) ( not ( = ?auto_262924 ?auto_262931 ) ) ( not ( = ?auto_262924 ?auto_262932 ) ) ( not ( = ?auto_262924 ?auto_262933 ) ) ( not ( = ?auto_262924 ?auto_262934 ) ) ( not ( = ?auto_262925 ?auto_262926 ) ) ( not ( = ?auto_262925 ?auto_262927 ) ) ( not ( = ?auto_262925 ?auto_262928 ) ) ( not ( = ?auto_262925 ?auto_262929 ) ) ( not ( = ?auto_262925 ?auto_262930 ) ) ( not ( = ?auto_262925 ?auto_262931 ) ) ( not ( = ?auto_262925 ?auto_262932 ) ) ( not ( = ?auto_262925 ?auto_262933 ) ) ( not ( = ?auto_262925 ?auto_262934 ) ) ( not ( = ?auto_262926 ?auto_262927 ) ) ( not ( = ?auto_262926 ?auto_262928 ) ) ( not ( = ?auto_262926 ?auto_262929 ) ) ( not ( = ?auto_262926 ?auto_262930 ) ) ( not ( = ?auto_262926 ?auto_262931 ) ) ( not ( = ?auto_262926 ?auto_262932 ) ) ( not ( = ?auto_262926 ?auto_262933 ) ) ( not ( = ?auto_262926 ?auto_262934 ) ) ( not ( = ?auto_262927 ?auto_262928 ) ) ( not ( = ?auto_262927 ?auto_262929 ) ) ( not ( = ?auto_262927 ?auto_262930 ) ) ( not ( = ?auto_262927 ?auto_262931 ) ) ( not ( = ?auto_262927 ?auto_262932 ) ) ( not ( = ?auto_262927 ?auto_262933 ) ) ( not ( = ?auto_262927 ?auto_262934 ) ) ( not ( = ?auto_262928 ?auto_262929 ) ) ( not ( = ?auto_262928 ?auto_262930 ) ) ( not ( = ?auto_262928 ?auto_262931 ) ) ( not ( = ?auto_262928 ?auto_262932 ) ) ( not ( = ?auto_262928 ?auto_262933 ) ) ( not ( = ?auto_262928 ?auto_262934 ) ) ( not ( = ?auto_262929 ?auto_262930 ) ) ( not ( = ?auto_262929 ?auto_262931 ) ) ( not ( = ?auto_262929 ?auto_262932 ) ) ( not ( = ?auto_262929 ?auto_262933 ) ) ( not ( = ?auto_262929 ?auto_262934 ) ) ( not ( = ?auto_262930 ?auto_262931 ) ) ( not ( = ?auto_262930 ?auto_262932 ) ) ( not ( = ?auto_262930 ?auto_262933 ) ) ( not ( = ?auto_262930 ?auto_262934 ) ) ( not ( = ?auto_262931 ?auto_262932 ) ) ( not ( = ?auto_262931 ?auto_262933 ) ) ( not ( = ?auto_262931 ?auto_262934 ) ) ( not ( = ?auto_262932 ?auto_262933 ) ) ( not ( = ?auto_262932 ?auto_262934 ) ) ( not ( = ?auto_262933 ?auto_262934 ) ) ( ON ?auto_262932 ?auto_262933 ) ( ON ?auto_262931 ?auto_262932 ) ( ON ?auto_262930 ?auto_262931 ) ( ON ?auto_262929 ?auto_262930 ) ( CLEAR ?auto_262927 ) ( ON ?auto_262928 ?auto_262929 ) ( CLEAR ?auto_262928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_262923 ?auto_262924 ?auto_262925 ?auto_262926 ?auto_262927 ?auto_262928 )
      ( MAKE-11PILE ?auto_262923 ?auto_262924 ?auto_262925 ?auto_262926 ?auto_262927 ?auto_262928 ?auto_262929 ?auto_262930 ?auto_262931 ?auto_262932 ?auto_262933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_262969 - BLOCK
      ?auto_262970 - BLOCK
      ?auto_262971 - BLOCK
      ?auto_262972 - BLOCK
      ?auto_262973 - BLOCK
      ?auto_262974 - BLOCK
      ?auto_262975 - BLOCK
      ?auto_262976 - BLOCK
      ?auto_262977 - BLOCK
      ?auto_262978 - BLOCK
      ?auto_262979 - BLOCK
    )
    :vars
    (
      ?auto_262980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262979 ?auto_262980 ) ( ON-TABLE ?auto_262969 ) ( ON ?auto_262970 ?auto_262969 ) ( ON ?auto_262971 ?auto_262970 ) ( ON ?auto_262972 ?auto_262971 ) ( not ( = ?auto_262969 ?auto_262970 ) ) ( not ( = ?auto_262969 ?auto_262971 ) ) ( not ( = ?auto_262969 ?auto_262972 ) ) ( not ( = ?auto_262969 ?auto_262973 ) ) ( not ( = ?auto_262969 ?auto_262974 ) ) ( not ( = ?auto_262969 ?auto_262975 ) ) ( not ( = ?auto_262969 ?auto_262976 ) ) ( not ( = ?auto_262969 ?auto_262977 ) ) ( not ( = ?auto_262969 ?auto_262978 ) ) ( not ( = ?auto_262969 ?auto_262979 ) ) ( not ( = ?auto_262969 ?auto_262980 ) ) ( not ( = ?auto_262970 ?auto_262971 ) ) ( not ( = ?auto_262970 ?auto_262972 ) ) ( not ( = ?auto_262970 ?auto_262973 ) ) ( not ( = ?auto_262970 ?auto_262974 ) ) ( not ( = ?auto_262970 ?auto_262975 ) ) ( not ( = ?auto_262970 ?auto_262976 ) ) ( not ( = ?auto_262970 ?auto_262977 ) ) ( not ( = ?auto_262970 ?auto_262978 ) ) ( not ( = ?auto_262970 ?auto_262979 ) ) ( not ( = ?auto_262970 ?auto_262980 ) ) ( not ( = ?auto_262971 ?auto_262972 ) ) ( not ( = ?auto_262971 ?auto_262973 ) ) ( not ( = ?auto_262971 ?auto_262974 ) ) ( not ( = ?auto_262971 ?auto_262975 ) ) ( not ( = ?auto_262971 ?auto_262976 ) ) ( not ( = ?auto_262971 ?auto_262977 ) ) ( not ( = ?auto_262971 ?auto_262978 ) ) ( not ( = ?auto_262971 ?auto_262979 ) ) ( not ( = ?auto_262971 ?auto_262980 ) ) ( not ( = ?auto_262972 ?auto_262973 ) ) ( not ( = ?auto_262972 ?auto_262974 ) ) ( not ( = ?auto_262972 ?auto_262975 ) ) ( not ( = ?auto_262972 ?auto_262976 ) ) ( not ( = ?auto_262972 ?auto_262977 ) ) ( not ( = ?auto_262972 ?auto_262978 ) ) ( not ( = ?auto_262972 ?auto_262979 ) ) ( not ( = ?auto_262972 ?auto_262980 ) ) ( not ( = ?auto_262973 ?auto_262974 ) ) ( not ( = ?auto_262973 ?auto_262975 ) ) ( not ( = ?auto_262973 ?auto_262976 ) ) ( not ( = ?auto_262973 ?auto_262977 ) ) ( not ( = ?auto_262973 ?auto_262978 ) ) ( not ( = ?auto_262973 ?auto_262979 ) ) ( not ( = ?auto_262973 ?auto_262980 ) ) ( not ( = ?auto_262974 ?auto_262975 ) ) ( not ( = ?auto_262974 ?auto_262976 ) ) ( not ( = ?auto_262974 ?auto_262977 ) ) ( not ( = ?auto_262974 ?auto_262978 ) ) ( not ( = ?auto_262974 ?auto_262979 ) ) ( not ( = ?auto_262974 ?auto_262980 ) ) ( not ( = ?auto_262975 ?auto_262976 ) ) ( not ( = ?auto_262975 ?auto_262977 ) ) ( not ( = ?auto_262975 ?auto_262978 ) ) ( not ( = ?auto_262975 ?auto_262979 ) ) ( not ( = ?auto_262975 ?auto_262980 ) ) ( not ( = ?auto_262976 ?auto_262977 ) ) ( not ( = ?auto_262976 ?auto_262978 ) ) ( not ( = ?auto_262976 ?auto_262979 ) ) ( not ( = ?auto_262976 ?auto_262980 ) ) ( not ( = ?auto_262977 ?auto_262978 ) ) ( not ( = ?auto_262977 ?auto_262979 ) ) ( not ( = ?auto_262977 ?auto_262980 ) ) ( not ( = ?auto_262978 ?auto_262979 ) ) ( not ( = ?auto_262978 ?auto_262980 ) ) ( not ( = ?auto_262979 ?auto_262980 ) ) ( ON ?auto_262978 ?auto_262979 ) ( ON ?auto_262977 ?auto_262978 ) ( ON ?auto_262976 ?auto_262977 ) ( ON ?auto_262975 ?auto_262976 ) ( ON ?auto_262974 ?auto_262975 ) ( CLEAR ?auto_262972 ) ( ON ?auto_262973 ?auto_262974 ) ( CLEAR ?auto_262973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_262969 ?auto_262970 ?auto_262971 ?auto_262972 ?auto_262973 )
      ( MAKE-11PILE ?auto_262969 ?auto_262970 ?auto_262971 ?auto_262972 ?auto_262973 ?auto_262974 ?auto_262975 ?auto_262976 ?auto_262977 ?auto_262978 ?auto_262979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_263015 - BLOCK
      ?auto_263016 - BLOCK
      ?auto_263017 - BLOCK
      ?auto_263018 - BLOCK
      ?auto_263019 - BLOCK
      ?auto_263020 - BLOCK
      ?auto_263021 - BLOCK
      ?auto_263022 - BLOCK
      ?auto_263023 - BLOCK
      ?auto_263024 - BLOCK
      ?auto_263025 - BLOCK
    )
    :vars
    (
      ?auto_263026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263025 ?auto_263026 ) ( ON-TABLE ?auto_263015 ) ( ON ?auto_263016 ?auto_263015 ) ( ON ?auto_263017 ?auto_263016 ) ( not ( = ?auto_263015 ?auto_263016 ) ) ( not ( = ?auto_263015 ?auto_263017 ) ) ( not ( = ?auto_263015 ?auto_263018 ) ) ( not ( = ?auto_263015 ?auto_263019 ) ) ( not ( = ?auto_263015 ?auto_263020 ) ) ( not ( = ?auto_263015 ?auto_263021 ) ) ( not ( = ?auto_263015 ?auto_263022 ) ) ( not ( = ?auto_263015 ?auto_263023 ) ) ( not ( = ?auto_263015 ?auto_263024 ) ) ( not ( = ?auto_263015 ?auto_263025 ) ) ( not ( = ?auto_263015 ?auto_263026 ) ) ( not ( = ?auto_263016 ?auto_263017 ) ) ( not ( = ?auto_263016 ?auto_263018 ) ) ( not ( = ?auto_263016 ?auto_263019 ) ) ( not ( = ?auto_263016 ?auto_263020 ) ) ( not ( = ?auto_263016 ?auto_263021 ) ) ( not ( = ?auto_263016 ?auto_263022 ) ) ( not ( = ?auto_263016 ?auto_263023 ) ) ( not ( = ?auto_263016 ?auto_263024 ) ) ( not ( = ?auto_263016 ?auto_263025 ) ) ( not ( = ?auto_263016 ?auto_263026 ) ) ( not ( = ?auto_263017 ?auto_263018 ) ) ( not ( = ?auto_263017 ?auto_263019 ) ) ( not ( = ?auto_263017 ?auto_263020 ) ) ( not ( = ?auto_263017 ?auto_263021 ) ) ( not ( = ?auto_263017 ?auto_263022 ) ) ( not ( = ?auto_263017 ?auto_263023 ) ) ( not ( = ?auto_263017 ?auto_263024 ) ) ( not ( = ?auto_263017 ?auto_263025 ) ) ( not ( = ?auto_263017 ?auto_263026 ) ) ( not ( = ?auto_263018 ?auto_263019 ) ) ( not ( = ?auto_263018 ?auto_263020 ) ) ( not ( = ?auto_263018 ?auto_263021 ) ) ( not ( = ?auto_263018 ?auto_263022 ) ) ( not ( = ?auto_263018 ?auto_263023 ) ) ( not ( = ?auto_263018 ?auto_263024 ) ) ( not ( = ?auto_263018 ?auto_263025 ) ) ( not ( = ?auto_263018 ?auto_263026 ) ) ( not ( = ?auto_263019 ?auto_263020 ) ) ( not ( = ?auto_263019 ?auto_263021 ) ) ( not ( = ?auto_263019 ?auto_263022 ) ) ( not ( = ?auto_263019 ?auto_263023 ) ) ( not ( = ?auto_263019 ?auto_263024 ) ) ( not ( = ?auto_263019 ?auto_263025 ) ) ( not ( = ?auto_263019 ?auto_263026 ) ) ( not ( = ?auto_263020 ?auto_263021 ) ) ( not ( = ?auto_263020 ?auto_263022 ) ) ( not ( = ?auto_263020 ?auto_263023 ) ) ( not ( = ?auto_263020 ?auto_263024 ) ) ( not ( = ?auto_263020 ?auto_263025 ) ) ( not ( = ?auto_263020 ?auto_263026 ) ) ( not ( = ?auto_263021 ?auto_263022 ) ) ( not ( = ?auto_263021 ?auto_263023 ) ) ( not ( = ?auto_263021 ?auto_263024 ) ) ( not ( = ?auto_263021 ?auto_263025 ) ) ( not ( = ?auto_263021 ?auto_263026 ) ) ( not ( = ?auto_263022 ?auto_263023 ) ) ( not ( = ?auto_263022 ?auto_263024 ) ) ( not ( = ?auto_263022 ?auto_263025 ) ) ( not ( = ?auto_263022 ?auto_263026 ) ) ( not ( = ?auto_263023 ?auto_263024 ) ) ( not ( = ?auto_263023 ?auto_263025 ) ) ( not ( = ?auto_263023 ?auto_263026 ) ) ( not ( = ?auto_263024 ?auto_263025 ) ) ( not ( = ?auto_263024 ?auto_263026 ) ) ( not ( = ?auto_263025 ?auto_263026 ) ) ( ON ?auto_263024 ?auto_263025 ) ( ON ?auto_263023 ?auto_263024 ) ( ON ?auto_263022 ?auto_263023 ) ( ON ?auto_263021 ?auto_263022 ) ( ON ?auto_263020 ?auto_263021 ) ( ON ?auto_263019 ?auto_263020 ) ( CLEAR ?auto_263017 ) ( ON ?auto_263018 ?auto_263019 ) ( CLEAR ?auto_263018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_263015 ?auto_263016 ?auto_263017 ?auto_263018 )
      ( MAKE-11PILE ?auto_263015 ?auto_263016 ?auto_263017 ?auto_263018 ?auto_263019 ?auto_263020 ?auto_263021 ?auto_263022 ?auto_263023 ?auto_263024 ?auto_263025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_263061 - BLOCK
      ?auto_263062 - BLOCK
      ?auto_263063 - BLOCK
      ?auto_263064 - BLOCK
      ?auto_263065 - BLOCK
      ?auto_263066 - BLOCK
      ?auto_263067 - BLOCK
      ?auto_263068 - BLOCK
      ?auto_263069 - BLOCK
      ?auto_263070 - BLOCK
      ?auto_263071 - BLOCK
    )
    :vars
    (
      ?auto_263072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263071 ?auto_263072 ) ( ON-TABLE ?auto_263061 ) ( ON ?auto_263062 ?auto_263061 ) ( not ( = ?auto_263061 ?auto_263062 ) ) ( not ( = ?auto_263061 ?auto_263063 ) ) ( not ( = ?auto_263061 ?auto_263064 ) ) ( not ( = ?auto_263061 ?auto_263065 ) ) ( not ( = ?auto_263061 ?auto_263066 ) ) ( not ( = ?auto_263061 ?auto_263067 ) ) ( not ( = ?auto_263061 ?auto_263068 ) ) ( not ( = ?auto_263061 ?auto_263069 ) ) ( not ( = ?auto_263061 ?auto_263070 ) ) ( not ( = ?auto_263061 ?auto_263071 ) ) ( not ( = ?auto_263061 ?auto_263072 ) ) ( not ( = ?auto_263062 ?auto_263063 ) ) ( not ( = ?auto_263062 ?auto_263064 ) ) ( not ( = ?auto_263062 ?auto_263065 ) ) ( not ( = ?auto_263062 ?auto_263066 ) ) ( not ( = ?auto_263062 ?auto_263067 ) ) ( not ( = ?auto_263062 ?auto_263068 ) ) ( not ( = ?auto_263062 ?auto_263069 ) ) ( not ( = ?auto_263062 ?auto_263070 ) ) ( not ( = ?auto_263062 ?auto_263071 ) ) ( not ( = ?auto_263062 ?auto_263072 ) ) ( not ( = ?auto_263063 ?auto_263064 ) ) ( not ( = ?auto_263063 ?auto_263065 ) ) ( not ( = ?auto_263063 ?auto_263066 ) ) ( not ( = ?auto_263063 ?auto_263067 ) ) ( not ( = ?auto_263063 ?auto_263068 ) ) ( not ( = ?auto_263063 ?auto_263069 ) ) ( not ( = ?auto_263063 ?auto_263070 ) ) ( not ( = ?auto_263063 ?auto_263071 ) ) ( not ( = ?auto_263063 ?auto_263072 ) ) ( not ( = ?auto_263064 ?auto_263065 ) ) ( not ( = ?auto_263064 ?auto_263066 ) ) ( not ( = ?auto_263064 ?auto_263067 ) ) ( not ( = ?auto_263064 ?auto_263068 ) ) ( not ( = ?auto_263064 ?auto_263069 ) ) ( not ( = ?auto_263064 ?auto_263070 ) ) ( not ( = ?auto_263064 ?auto_263071 ) ) ( not ( = ?auto_263064 ?auto_263072 ) ) ( not ( = ?auto_263065 ?auto_263066 ) ) ( not ( = ?auto_263065 ?auto_263067 ) ) ( not ( = ?auto_263065 ?auto_263068 ) ) ( not ( = ?auto_263065 ?auto_263069 ) ) ( not ( = ?auto_263065 ?auto_263070 ) ) ( not ( = ?auto_263065 ?auto_263071 ) ) ( not ( = ?auto_263065 ?auto_263072 ) ) ( not ( = ?auto_263066 ?auto_263067 ) ) ( not ( = ?auto_263066 ?auto_263068 ) ) ( not ( = ?auto_263066 ?auto_263069 ) ) ( not ( = ?auto_263066 ?auto_263070 ) ) ( not ( = ?auto_263066 ?auto_263071 ) ) ( not ( = ?auto_263066 ?auto_263072 ) ) ( not ( = ?auto_263067 ?auto_263068 ) ) ( not ( = ?auto_263067 ?auto_263069 ) ) ( not ( = ?auto_263067 ?auto_263070 ) ) ( not ( = ?auto_263067 ?auto_263071 ) ) ( not ( = ?auto_263067 ?auto_263072 ) ) ( not ( = ?auto_263068 ?auto_263069 ) ) ( not ( = ?auto_263068 ?auto_263070 ) ) ( not ( = ?auto_263068 ?auto_263071 ) ) ( not ( = ?auto_263068 ?auto_263072 ) ) ( not ( = ?auto_263069 ?auto_263070 ) ) ( not ( = ?auto_263069 ?auto_263071 ) ) ( not ( = ?auto_263069 ?auto_263072 ) ) ( not ( = ?auto_263070 ?auto_263071 ) ) ( not ( = ?auto_263070 ?auto_263072 ) ) ( not ( = ?auto_263071 ?auto_263072 ) ) ( ON ?auto_263070 ?auto_263071 ) ( ON ?auto_263069 ?auto_263070 ) ( ON ?auto_263068 ?auto_263069 ) ( ON ?auto_263067 ?auto_263068 ) ( ON ?auto_263066 ?auto_263067 ) ( ON ?auto_263065 ?auto_263066 ) ( ON ?auto_263064 ?auto_263065 ) ( CLEAR ?auto_263062 ) ( ON ?auto_263063 ?auto_263064 ) ( CLEAR ?auto_263063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_263061 ?auto_263062 ?auto_263063 )
      ( MAKE-11PILE ?auto_263061 ?auto_263062 ?auto_263063 ?auto_263064 ?auto_263065 ?auto_263066 ?auto_263067 ?auto_263068 ?auto_263069 ?auto_263070 ?auto_263071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_263107 - BLOCK
      ?auto_263108 - BLOCK
      ?auto_263109 - BLOCK
      ?auto_263110 - BLOCK
      ?auto_263111 - BLOCK
      ?auto_263112 - BLOCK
      ?auto_263113 - BLOCK
      ?auto_263114 - BLOCK
      ?auto_263115 - BLOCK
      ?auto_263116 - BLOCK
      ?auto_263117 - BLOCK
    )
    :vars
    (
      ?auto_263118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263117 ?auto_263118 ) ( ON-TABLE ?auto_263107 ) ( not ( = ?auto_263107 ?auto_263108 ) ) ( not ( = ?auto_263107 ?auto_263109 ) ) ( not ( = ?auto_263107 ?auto_263110 ) ) ( not ( = ?auto_263107 ?auto_263111 ) ) ( not ( = ?auto_263107 ?auto_263112 ) ) ( not ( = ?auto_263107 ?auto_263113 ) ) ( not ( = ?auto_263107 ?auto_263114 ) ) ( not ( = ?auto_263107 ?auto_263115 ) ) ( not ( = ?auto_263107 ?auto_263116 ) ) ( not ( = ?auto_263107 ?auto_263117 ) ) ( not ( = ?auto_263107 ?auto_263118 ) ) ( not ( = ?auto_263108 ?auto_263109 ) ) ( not ( = ?auto_263108 ?auto_263110 ) ) ( not ( = ?auto_263108 ?auto_263111 ) ) ( not ( = ?auto_263108 ?auto_263112 ) ) ( not ( = ?auto_263108 ?auto_263113 ) ) ( not ( = ?auto_263108 ?auto_263114 ) ) ( not ( = ?auto_263108 ?auto_263115 ) ) ( not ( = ?auto_263108 ?auto_263116 ) ) ( not ( = ?auto_263108 ?auto_263117 ) ) ( not ( = ?auto_263108 ?auto_263118 ) ) ( not ( = ?auto_263109 ?auto_263110 ) ) ( not ( = ?auto_263109 ?auto_263111 ) ) ( not ( = ?auto_263109 ?auto_263112 ) ) ( not ( = ?auto_263109 ?auto_263113 ) ) ( not ( = ?auto_263109 ?auto_263114 ) ) ( not ( = ?auto_263109 ?auto_263115 ) ) ( not ( = ?auto_263109 ?auto_263116 ) ) ( not ( = ?auto_263109 ?auto_263117 ) ) ( not ( = ?auto_263109 ?auto_263118 ) ) ( not ( = ?auto_263110 ?auto_263111 ) ) ( not ( = ?auto_263110 ?auto_263112 ) ) ( not ( = ?auto_263110 ?auto_263113 ) ) ( not ( = ?auto_263110 ?auto_263114 ) ) ( not ( = ?auto_263110 ?auto_263115 ) ) ( not ( = ?auto_263110 ?auto_263116 ) ) ( not ( = ?auto_263110 ?auto_263117 ) ) ( not ( = ?auto_263110 ?auto_263118 ) ) ( not ( = ?auto_263111 ?auto_263112 ) ) ( not ( = ?auto_263111 ?auto_263113 ) ) ( not ( = ?auto_263111 ?auto_263114 ) ) ( not ( = ?auto_263111 ?auto_263115 ) ) ( not ( = ?auto_263111 ?auto_263116 ) ) ( not ( = ?auto_263111 ?auto_263117 ) ) ( not ( = ?auto_263111 ?auto_263118 ) ) ( not ( = ?auto_263112 ?auto_263113 ) ) ( not ( = ?auto_263112 ?auto_263114 ) ) ( not ( = ?auto_263112 ?auto_263115 ) ) ( not ( = ?auto_263112 ?auto_263116 ) ) ( not ( = ?auto_263112 ?auto_263117 ) ) ( not ( = ?auto_263112 ?auto_263118 ) ) ( not ( = ?auto_263113 ?auto_263114 ) ) ( not ( = ?auto_263113 ?auto_263115 ) ) ( not ( = ?auto_263113 ?auto_263116 ) ) ( not ( = ?auto_263113 ?auto_263117 ) ) ( not ( = ?auto_263113 ?auto_263118 ) ) ( not ( = ?auto_263114 ?auto_263115 ) ) ( not ( = ?auto_263114 ?auto_263116 ) ) ( not ( = ?auto_263114 ?auto_263117 ) ) ( not ( = ?auto_263114 ?auto_263118 ) ) ( not ( = ?auto_263115 ?auto_263116 ) ) ( not ( = ?auto_263115 ?auto_263117 ) ) ( not ( = ?auto_263115 ?auto_263118 ) ) ( not ( = ?auto_263116 ?auto_263117 ) ) ( not ( = ?auto_263116 ?auto_263118 ) ) ( not ( = ?auto_263117 ?auto_263118 ) ) ( ON ?auto_263116 ?auto_263117 ) ( ON ?auto_263115 ?auto_263116 ) ( ON ?auto_263114 ?auto_263115 ) ( ON ?auto_263113 ?auto_263114 ) ( ON ?auto_263112 ?auto_263113 ) ( ON ?auto_263111 ?auto_263112 ) ( ON ?auto_263110 ?auto_263111 ) ( ON ?auto_263109 ?auto_263110 ) ( CLEAR ?auto_263107 ) ( ON ?auto_263108 ?auto_263109 ) ( CLEAR ?auto_263108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_263107 ?auto_263108 )
      ( MAKE-11PILE ?auto_263107 ?auto_263108 ?auto_263109 ?auto_263110 ?auto_263111 ?auto_263112 ?auto_263113 ?auto_263114 ?auto_263115 ?auto_263116 ?auto_263117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_263153 - BLOCK
      ?auto_263154 - BLOCK
      ?auto_263155 - BLOCK
      ?auto_263156 - BLOCK
      ?auto_263157 - BLOCK
      ?auto_263158 - BLOCK
      ?auto_263159 - BLOCK
      ?auto_263160 - BLOCK
      ?auto_263161 - BLOCK
      ?auto_263162 - BLOCK
      ?auto_263163 - BLOCK
    )
    :vars
    (
      ?auto_263164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263163 ?auto_263164 ) ( not ( = ?auto_263153 ?auto_263154 ) ) ( not ( = ?auto_263153 ?auto_263155 ) ) ( not ( = ?auto_263153 ?auto_263156 ) ) ( not ( = ?auto_263153 ?auto_263157 ) ) ( not ( = ?auto_263153 ?auto_263158 ) ) ( not ( = ?auto_263153 ?auto_263159 ) ) ( not ( = ?auto_263153 ?auto_263160 ) ) ( not ( = ?auto_263153 ?auto_263161 ) ) ( not ( = ?auto_263153 ?auto_263162 ) ) ( not ( = ?auto_263153 ?auto_263163 ) ) ( not ( = ?auto_263153 ?auto_263164 ) ) ( not ( = ?auto_263154 ?auto_263155 ) ) ( not ( = ?auto_263154 ?auto_263156 ) ) ( not ( = ?auto_263154 ?auto_263157 ) ) ( not ( = ?auto_263154 ?auto_263158 ) ) ( not ( = ?auto_263154 ?auto_263159 ) ) ( not ( = ?auto_263154 ?auto_263160 ) ) ( not ( = ?auto_263154 ?auto_263161 ) ) ( not ( = ?auto_263154 ?auto_263162 ) ) ( not ( = ?auto_263154 ?auto_263163 ) ) ( not ( = ?auto_263154 ?auto_263164 ) ) ( not ( = ?auto_263155 ?auto_263156 ) ) ( not ( = ?auto_263155 ?auto_263157 ) ) ( not ( = ?auto_263155 ?auto_263158 ) ) ( not ( = ?auto_263155 ?auto_263159 ) ) ( not ( = ?auto_263155 ?auto_263160 ) ) ( not ( = ?auto_263155 ?auto_263161 ) ) ( not ( = ?auto_263155 ?auto_263162 ) ) ( not ( = ?auto_263155 ?auto_263163 ) ) ( not ( = ?auto_263155 ?auto_263164 ) ) ( not ( = ?auto_263156 ?auto_263157 ) ) ( not ( = ?auto_263156 ?auto_263158 ) ) ( not ( = ?auto_263156 ?auto_263159 ) ) ( not ( = ?auto_263156 ?auto_263160 ) ) ( not ( = ?auto_263156 ?auto_263161 ) ) ( not ( = ?auto_263156 ?auto_263162 ) ) ( not ( = ?auto_263156 ?auto_263163 ) ) ( not ( = ?auto_263156 ?auto_263164 ) ) ( not ( = ?auto_263157 ?auto_263158 ) ) ( not ( = ?auto_263157 ?auto_263159 ) ) ( not ( = ?auto_263157 ?auto_263160 ) ) ( not ( = ?auto_263157 ?auto_263161 ) ) ( not ( = ?auto_263157 ?auto_263162 ) ) ( not ( = ?auto_263157 ?auto_263163 ) ) ( not ( = ?auto_263157 ?auto_263164 ) ) ( not ( = ?auto_263158 ?auto_263159 ) ) ( not ( = ?auto_263158 ?auto_263160 ) ) ( not ( = ?auto_263158 ?auto_263161 ) ) ( not ( = ?auto_263158 ?auto_263162 ) ) ( not ( = ?auto_263158 ?auto_263163 ) ) ( not ( = ?auto_263158 ?auto_263164 ) ) ( not ( = ?auto_263159 ?auto_263160 ) ) ( not ( = ?auto_263159 ?auto_263161 ) ) ( not ( = ?auto_263159 ?auto_263162 ) ) ( not ( = ?auto_263159 ?auto_263163 ) ) ( not ( = ?auto_263159 ?auto_263164 ) ) ( not ( = ?auto_263160 ?auto_263161 ) ) ( not ( = ?auto_263160 ?auto_263162 ) ) ( not ( = ?auto_263160 ?auto_263163 ) ) ( not ( = ?auto_263160 ?auto_263164 ) ) ( not ( = ?auto_263161 ?auto_263162 ) ) ( not ( = ?auto_263161 ?auto_263163 ) ) ( not ( = ?auto_263161 ?auto_263164 ) ) ( not ( = ?auto_263162 ?auto_263163 ) ) ( not ( = ?auto_263162 ?auto_263164 ) ) ( not ( = ?auto_263163 ?auto_263164 ) ) ( ON ?auto_263162 ?auto_263163 ) ( ON ?auto_263161 ?auto_263162 ) ( ON ?auto_263160 ?auto_263161 ) ( ON ?auto_263159 ?auto_263160 ) ( ON ?auto_263158 ?auto_263159 ) ( ON ?auto_263157 ?auto_263158 ) ( ON ?auto_263156 ?auto_263157 ) ( ON ?auto_263155 ?auto_263156 ) ( ON ?auto_263154 ?auto_263155 ) ( ON ?auto_263153 ?auto_263154 ) ( CLEAR ?auto_263153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_263153 )
      ( MAKE-11PILE ?auto_263153 ?auto_263154 ?auto_263155 ?auto_263156 ?auto_263157 ?auto_263158 ?auto_263159 ?auto_263160 ?auto_263161 ?auto_263162 ?auto_263163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263200 - BLOCK
      ?auto_263201 - BLOCK
      ?auto_263202 - BLOCK
      ?auto_263203 - BLOCK
      ?auto_263204 - BLOCK
      ?auto_263205 - BLOCK
      ?auto_263206 - BLOCK
      ?auto_263207 - BLOCK
      ?auto_263208 - BLOCK
      ?auto_263209 - BLOCK
      ?auto_263210 - BLOCK
      ?auto_263211 - BLOCK
    )
    :vars
    (
      ?auto_263212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_263210 ) ( ON ?auto_263211 ?auto_263212 ) ( CLEAR ?auto_263211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_263200 ) ( ON ?auto_263201 ?auto_263200 ) ( ON ?auto_263202 ?auto_263201 ) ( ON ?auto_263203 ?auto_263202 ) ( ON ?auto_263204 ?auto_263203 ) ( ON ?auto_263205 ?auto_263204 ) ( ON ?auto_263206 ?auto_263205 ) ( ON ?auto_263207 ?auto_263206 ) ( ON ?auto_263208 ?auto_263207 ) ( ON ?auto_263209 ?auto_263208 ) ( ON ?auto_263210 ?auto_263209 ) ( not ( = ?auto_263200 ?auto_263201 ) ) ( not ( = ?auto_263200 ?auto_263202 ) ) ( not ( = ?auto_263200 ?auto_263203 ) ) ( not ( = ?auto_263200 ?auto_263204 ) ) ( not ( = ?auto_263200 ?auto_263205 ) ) ( not ( = ?auto_263200 ?auto_263206 ) ) ( not ( = ?auto_263200 ?auto_263207 ) ) ( not ( = ?auto_263200 ?auto_263208 ) ) ( not ( = ?auto_263200 ?auto_263209 ) ) ( not ( = ?auto_263200 ?auto_263210 ) ) ( not ( = ?auto_263200 ?auto_263211 ) ) ( not ( = ?auto_263200 ?auto_263212 ) ) ( not ( = ?auto_263201 ?auto_263202 ) ) ( not ( = ?auto_263201 ?auto_263203 ) ) ( not ( = ?auto_263201 ?auto_263204 ) ) ( not ( = ?auto_263201 ?auto_263205 ) ) ( not ( = ?auto_263201 ?auto_263206 ) ) ( not ( = ?auto_263201 ?auto_263207 ) ) ( not ( = ?auto_263201 ?auto_263208 ) ) ( not ( = ?auto_263201 ?auto_263209 ) ) ( not ( = ?auto_263201 ?auto_263210 ) ) ( not ( = ?auto_263201 ?auto_263211 ) ) ( not ( = ?auto_263201 ?auto_263212 ) ) ( not ( = ?auto_263202 ?auto_263203 ) ) ( not ( = ?auto_263202 ?auto_263204 ) ) ( not ( = ?auto_263202 ?auto_263205 ) ) ( not ( = ?auto_263202 ?auto_263206 ) ) ( not ( = ?auto_263202 ?auto_263207 ) ) ( not ( = ?auto_263202 ?auto_263208 ) ) ( not ( = ?auto_263202 ?auto_263209 ) ) ( not ( = ?auto_263202 ?auto_263210 ) ) ( not ( = ?auto_263202 ?auto_263211 ) ) ( not ( = ?auto_263202 ?auto_263212 ) ) ( not ( = ?auto_263203 ?auto_263204 ) ) ( not ( = ?auto_263203 ?auto_263205 ) ) ( not ( = ?auto_263203 ?auto_263206 ) ) ( not ( = ?auto_263203 ?auto_263207 ) ) ( not ( = ?auto_263203 ?auto_263208 ) ) ( not ( = ?auto_263203 ?auto_263209 ) ) ( not ( = ?auto_263203 ?auto_263210 ) ) ( not ( = ?auto_263203 ?auto_263211 ) ) ( not ( = ?auto_263203 ?auto_263212 ) ) ( not ( = ?auto_263204 ?auto_263205 ) ) ( not ( = ?auto_263204 ?auto_263206 ) ) ( not ( = ?auto_263204 ?auto_263207 ) ) ( not ( = ?auto_263204 ?auto_263208 ) ) ( not ( = ?auto_263204 ?auto_263209 ) ) ( not ( = ?auto_263204 ?auto_263210 ) ) ( not ( = ?auto_263204 ?auto_263211 ) ) ( not ( = ?auto_263204 ?auto_263212 ) ) ( not ( = ?auto_263205 ?auto_263206 ) ) ( not ( = ?auto_263205 ?auto_263207 ) ) ( not ( = ?auto_263205 ?auto_263208 ) ) ( not ( = ?auto_263205 ?auto_263209 ) ) ( not ( = ?auto_263205 ?auto_263210 ) ) ( not ( = ?auto_263205 ?auto_263211 ) ) ( not ( = ?auto_263205 ?auto_263212 ) ) ( not ( = ?auto_263206 ?auto_263207 ) ) ( not ( = ?auto_263206 ?auto_263208 ) ) ( not ( = ?auto_263206 ?auto_263209 ) ) ( not ( = ?auto_263206 ?auto_263210 ) ) ( not ( = ?auto_263206 ?auto_263211 ) ) ( not ( = ?auto_263206 ?auto_263212 ) ) ( not ( = ?auto_263207 ?auto_263208 ) ) ( not ( = ?auto_263207 ?auto_263209 ) ) ( not ( = ?auto_263207 ?auto_263210 ) ) ( not ( = ?auto_263207 ?auto_263211 ) ) ( not ( = ?auto_263207 ?auto_263212 ) ) ( not ( = ?auto_263208 ?auto_263209 ) ) ( not ( = ?auto_263208 ?auto_263210 ) ) ( not ( = ?auto_263208 ?auto_263211 ) ) ( not ( = ?auto_263208 ?auto_263212 ) ) ( not ( = ?auto_263209 ?auto_263210 ) ) ( not ( = ?auto_263209 ?auto_263211 ) ) ( not ( = ?auto_263209 ?auto_263212 ) ) ( not ( = ?auto_263210 ?auto_263211 ) ) ( not ( = ?auto_263210 ?auto_263212 ) ) ( not ( = ?auto_263211 ?auto_263212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_263211 ?auto_263212 )
      ( !STACK ?auto_263211 ?auto_263210 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263250 - BLOCK
      ?auto_263251 - BLOCK
      ?auto_263252 - BLOCK
      ?auto_263253 - BLOCK
      ?auto_263254 - BLOCK
      ?auto_263255 - BLOCK
      ?auto_263256 - BLOCK
      ?auto_263257 - BLOCK
      ?auto_263258 - BLOCK
      ?auto_263259 - BLOCK
      ?auto_263260 - BLOCK
      ?auto_263261 - BLOCK
    )
    :vars
    (
      ?auto_263262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263261 ?auto_263262 ) ( ON-TABLE ?auto_263250 ) ( ON ?auto_263251 ?auto_263250 ) ( ON ?auto_263252 ?auto_263251 ) ( ON ?auto_263253 ?auto_263252 ) ( ON ?auto_263254 ?auto_263253 ) ( ON ?auto_263255 ?auto_263254 ) ( ON ?auto_263256 ?auto_263255 ) ( ON ?auto_263257 ?auto_263256 ) ( ON ?auto_263258 ?auto_263257 ) ( ON ?auto_263259 ?auto_263258 ) ( not ( = ?auto_263250 ?auto_263251 ) ) ( not ( = ?auto_263250 ?auto_263252 ) ) ( not ( = ?auto_263250 ?auto_263253 ) ) ( not ( = ?auto_263250 ?auto_263254 ) ) ( not ( = ?auto_263250 ?auto_263255 ) ) ( not ( = ?auto_263250 ?auto_263256 ) ) ( not ( = ?auto_263250 ?auto_263257 ) ) ( not ( = ?auto_263250 ?auto_263258 ) ) ( not ( = ?auto_263250 ?auto_263259 ) ) ( not ( = ?auto_263250 ?auto_263260 ) ) ( not ( = ?auto_263250 ?auto_263261 ) ) ( not ( = ?auto_263250 ?auto_263262 ) ) ( not ( = ?auto_263251 ?auto_263252 ) ) ( not ( = ?auto_263251 ?auto_263253 ) ) ( not ( = ?auto_263251 ?auto_263254 ) ) ( not ( = ?auto_263251 ?auto_263255 ) ) ( not ( = ?auto_263251 ?auto_263256 ) ) ( not ( = ?auto_263251 ?auto_263257 ) ) ( not ( = ?auto_263251 ?auto_263258 ) ) ( not ( = ?auto_263251 ?auto_263259 ) ) ( not ( = ?auto_263251 ?auto_263260 ) ) ( not ( = ?auto_263251 ?auto_263261 ) ) ( not ( = ?auto_263251 ?auto_263262 ) ) ( not ( = ?auto_263252 ?auto_263253 ) ) ( not ( = ?auto_263252 ?auto_263254 ) ) ( not ( = ?auto_263252 ?auto_263255 ) ) ( not ( = ?auto_263252 ?auto_263256 ) ) ( not ( = ?auto_263252 ?auto_263257 ) ) ( not ( = ?auto_263252 ?auto_263258 ) ) ( not ( = ?auto_263252 ?auto_263259 ) ) ( not ( = ?auto_263252 ?auto_263260 ) ) ( not ( = ?auto_263252 ?auto_263261 ) ) ( not ( = ?auto_263252 ?auto_263262 ) ) ( not ( = ?auto_263253 ?auto_263254 ) ) ( not ( = ?auto_263253 ?auto_263255 ) ) ( not ( = ?auto_263253 ?auto_263256 ) ) ( not ( = ?auto_263253 ?auto_263257 ) ) ( not ( = ?auto_263253 ?auto_263258 ) ) ( not ( = ?auto_263253 ?auto_263259 ) ) ( not ( = ?auto_263253 ?auto_263260 ) ) ( not ( = ?auto_263253 ?auto_263261 ) ) ( not ( = ?auto_263253 ?auto_263262 ) ) ( not ( = ?auto_263254 ?auto_263255 ) ) ( not ( = ?auto_263254 ?auto_263256 ) ) ( not ( = ?auto_263254 ?auto_263257 ) ) ( not ( = ?auto_263254 ?auto_263258 ) ) ( not ( = ?auto_263254 ?auto_263259 ) ) ( not ( = ?auto_263254 ?auto_263260 ) ) ( not ( = ?auto_263254 ?auto_263261 ) ) ( not ( = ?auto_263254 ?auto_263262 ) ) ( not ( = ?auto_263255 ?auto_263256 ) ) ( not ( = ?auto_263255 ?auto_263257 ) ) ( not ( = ?auto_263255 ?auto_263258 ) ) ( not ( = ?auto_263255 ?auto_263259 ) ) ( not ( = ?auto_263255 ?auto_263260 ) ) ( not ( = ?auto_263255 ?auto_263261 ) ) ( not ( = ?auto_263255 ?auto_263262 ) ) ( not ( = ?auto_263256 ?auto_263257 ) ) ( not ( = ?auto_263256 ?auto_263258 ) ) ( not ( = ?auto_263256 ?auto_263259 ) ) ( not ( = ?auto_263256 ?auto_263260 ) ) ( not ( = ?auto_263256 ?auto_263261 ) ) ( not ( = ?auto_263256 ?auto_263262 ) ) ( not ( = ?auto_263257 ?auto_263258 ) ) ( not ( = ?auto_263257 ?auto_263259 ) ) ( not ( = ?auto_263257 ?auto_263260 ) ) ( not ( = ?auto_263257 ?auto_263261 ) ) ( not ( = ?auto_263257 ?auto_263262 ) ) ( not ( = ?auto_263258 ?auto_263259 ) ) ( not ( = ?auto_263258 ?auto_263260 ) ) ( not ( = ?auto_263258 ?auto_263261 ) ) ( not ( = ?auto_263258 ?auto_263262 ) ) ( not ( = ?auto_263259 ?auto_263260 ) ) ( not ( = ?auto_263259 ?auto_263261 ) ) ( not ( = ?auto_263259 ?auto_263262 ) ) ( not ( = ?auto_263260 ?auto_263261 ) ) ( not ( = ?auto_263260 ?auto_263262 ) ) ( not ( = ?auto_263261 ?auto_263262 ) ) ( CLEAR ?auto_263259 ) ( ON ?auto_263260 ?auto_263261 ) ( CLEAR ?auto_263260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_263250 ?auto_263251 ?auto_263252 ?auto_263253 ?auto_263254 ?auto_263255 ?auto_263256 ?auto_263257 ?auto_263258 ?auto_263259 ?auto_263260 )
      ( MAKE-12PILE ?auto_263250 ?auto_263251 ?auto_263252 ?auto_263253 ?auto_263254 ?auto_263255 ?auto_263256 ?auto_263257 ?auto_263258 ?auto_263259 ?auto_263260 ?auto_263261 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263300 - BLOCK
      ?auto_263301 - BLOCK
      ?auto_263302 - BLOCK
      ?auto_263303 - BLOCK
      ?auto_263304 - BLOCK
      ?auto_263305 - BLOCK
      ?auto_263306 - BLOCK
      ?auto_263307 - BLOCK
      ?auto_263308 - BLOCK
      ?auto_263309 - BLOCK
      ?auto_263310 - BLOCK
      ?auto_263311 - BLOCK
    )
    :vars
    (
      ?auto_263312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263311 ?auto_263312 ) ( ON-TABLE ?auto_263300 ) ( ON ?auto_263301 ?auto_263300 ) ( ON ?auto_263302 ?auto_263301 ) ( ON ?auto_263303 ?auto_263302 ) ( ON ?auto_263304 ?auto_263303 ) ( ON ?auto_263305 ?auto_263304 ) ( ON ?auto_263306 ?auto_263305 ) ( ON ?auto_263307 ?auto_263306 ) ( ON ?auto_263308 ?auto_263307 ) ( not ( = ?auto_263300 ?auto_263301 ) ) ( not ( = ?auto_263300 ?auto_263302 ) ) ( not ( = ?auto_263300 ?auto_263303 ) ) ( not ( = ?auto_263300 ?auto_263304 ) ) ( not ( = ?auto_263300 ?auto_263305 ) ) ( not ( = ?auto_263300 ?auto_263306 ) ) ( not ( = ?auto_263300 ?auto_263307 ) ) ( not ( = ?auto_263300 ?auto_263308 ) ) ( not ( = ?auto_263300 ?auto_263309 ) ) ( not ( = ?auto_263300 ?auto_263310 ) ) ( not ( = ?auto_263300 ?auto_263311 ) ) ( not ( = ?auto_263300 ?auto_263312 ) ) ( not ( = ?auto_263301 ?auto_263302 ) ) ( not ( = ?auto_263301 ?auto_263303 ) ) ( not ( = ?auto_263301 ?auto_263304 ) ) ( not ( = ?auto_263301 ?auto_263305 ) ) ( not ( = ?auto_263301 ?auto_263306 ) ) ( not ( = ?auto_263301 ?auto_263307 ) ) ( not ( = ?auto_263301 ?auto_263308 ) ) ( not ( = ?auto_263301 ?auto_263309 ) ) ( not ( = ?auto_263301 ?auto_263310 ) ) ( not ( = ?auto_263301 ?auto_263311 ) ) ( not ( = ?auto_263301 ?auto_263312 ) ) ( not ( = ?auto_263302 ?auto_263303 ) ) ( not ( = ?auto_263302 ?auto_263304 ) ) ( not ( = ?auto_263302 ?auto_263305 ) ) ( not ( = ?auto_263302 ?auto_263306 ) ) ( not ( = ?auto_263302 ?auto_263307 ) ) ( not ( = ?auto_263302 ?auto_263308 ) ) ( not ( = ?auto_263302 ?auto_263309 ) ) ( not ( = ?auto_263302 ?auto_263310 ) ) ( not ( = ?auto_263302 ?auto_263311 ) ) ( not ( = ?auto_263302 ?auto_263312 ) ) ( not ( = ?auto_263303 ?auto_263304 ) ) ( not ( = ?auto_263303 ?auto_263305 ) ) ( not ( = ?auto_263303 ?auto_263306 ) ) ( not ( = ?auto_263303 ?auto_263307 ) ) ( not ( = ?auto_263303 ?auto_263308 ) ) ( not ( = ?auto_263303 ?auto_263309 ) ) ( not ( = ?auto_263303 ?auto_263310 ) ) ( not ( = ?auto_263303 ?auto_263311 ) ) ( not ( = ?auto_263303 ?auto_263312 ) ) ( not ( = ?auto_263304 ?auto_263305 ) ) ( not ( = ?auto_263304 ?auto_263306 ) ) ( not ( = ?auto_263304 ?auto_263307 ) ) ( not ( = ?auto_263304 ?auto_263308 ) ) ( not ( = ?auto_263304 ?auto_263309 ) ) ( not ( = ?auto_263304 ?auto_263310 ) ) ( not ( = ?auto_263304 ?auto_263311 ) ) ( not ( = ?auto_263304 ?auto_263312 ) ) ( not ( = ?auto_263305 ?auto_263306 ) ) ( not ( = ?auto_263305 ?auto_263307 ) ) ( not ( = ?auto_263305 ?auto_263308 ) ) ( not ( = ?auto_263305 ?auto_263309 ) ) ( not ( = ?auto_263305 ?auto_263310 ) ) ( not ( = ?auto_263305 ?auto_263311 ) ) ( not ( = ?auto_263305 ?auto_263312 ) ) ( not ( = ?auto_263306 ?auto_263307 ) ) ( not ( = ?auto_263306 ?auto_263308 ) ) ( not ( = ?auto_263306 ?auto_263309 ) ) ( not ( = ?auto_263306 ?auto_263310 ) ) ( not ( = ?auto_263306 ?auto_263311 ) ) ( not ( = ?auto_263306 ?auto_263312 ) ) ( not ( = ?auto_263307 ?auto_263308 ) ) ( not ( = ?auto_263307 ?auto_263309 ) ) ( not ( = ?auto_263307 ?auto_263310 ) ) ( not ( = ?auto_263307 ?auto_263311 ) ) ( not ( = ?auto_263307 ?auto_263312 ) ) ( not ( = ?auto_263308 ?auto_263309 ) ) ( not ( = ?auto_263308 ?auto_263310 ) ) ( not ( = ?auto_263308 ?auto_263311 ) ) ( not ( = ?auto_263308 ?auto_263312 ) ) ( not ( = ?auto_263309 ?auto_263310 ) ) ( not ( = ?auto_263309 ?auto_263311 ) ) ( not ( = ?auto_263309 ?auto_263312 ) ) ( not ( = ?auto_263310 ?auto_263311 ) ) ( not ( = ?auto_263310 ?auto_263312 ) ) ( not ( = ?auto_263311 ?auto_263312 ) ) ( ON ?auto_263310 ?auto_263311 ) ( CLEAR ?auto_263308 ) ( ON ?auto_263309 ?auto_263310 ) ( CLEAR ?auto_263309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_263300 ?auto_263301 ?auto_263302 ?auto_263303 ?auto_263304 ?auto_263305 ?auto_263306 ?auto_263307 ?auto_263308 ?auto_263309 )
      ( MAKE-12PILE ?auto_263300 ?auto_263301 ?auto_263302 ?auto_263303 ?auto_263304 ?auto_263305 ?auto_263306 ?auto_263307 ?auto_263308 ?auto_263309 ?auto_263310 ?auto_263311 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263350 - BLOCK
      ?auto_263351 - BLOCK
      ?auto_263352 - BLOCK
      ?auto_263353 - BLOCK
      ?auto_263354 - BLOCK
      ?auto_263355 - BLOCK
      ?auto_263356 - BLOCK
      ?auto_263357 - BLOCK
      ?auto_263358 - BLOCK
      ?auto_263359 - BLOCK
      ?auto_263360 - BLOCK
      ?auto_263361 - BLOCK
    )
    :vars
    (
      ?auto_263362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263361 ?auto_263362 ) ( ON-TABLE ?auto_263350 ) ( ON ?auto_263351 ?auto_263350 ) ( ON ?auto_263352 ?auto_263351 ) ( ON ?auto_263353 ?auto_263352 ) ( ON ?auto_263354 ?auto_263353 ) ( ON ?auto_263355 ?auto_263354 ) ( ON ?auto_263356 ?auto_263355 ) ( ON ?auto_263357 ?auto_263356 ) ( not ( = ?auto_263350 ?auto_263351 ) ) ( not ( = ?auto_263350 ?auto_263352 ) ) ( not ( = ?auto_263350 ?auto_263353 ) ) ( not ( = ?auto_263350 ?auto_263354 ) ) ( not ( = ?auto_263350 ?auto_263355 ) ) ( not ( = ?auto_263350 ?auto_263356 ) ) ( not ( = ?auto_263350 ?auto_263357 ) ) ( not ( = ?auto_263350 ?auto_263358 ) ) ( not ( = ?auto_263350 ?auto_263359 ) ) ( not ( = ?auto_263350 ?auto_263360 ) ) ( not ( = ?auto_263350 ?auto_263361 ) ) ( not ( = ?auto_263350 ?auto_263362 ) ) ( not ( = ?auto_263351 ?auto_263352 ) ) ( not ( = ?auto_263351 ?auto_263353 ) ) ( not ( = ?auto_263351 ?auto_263354 ) ) ( not ( = ?auto_263351 ?auto_263355 ) ) ( not ( = ?auto_263351 ?auto_263356 ) ) ( not ( = ?auto_263351 ?auto_263357 ) ) ( not ( = ?auto_263351 ?auto_263358 ) ) ( not ( = ?auto_263351 ?auto_263359 ) ) ( not ( = ?auto_263351 ?auto_263360 ) ) ( not ( = ?auto_263351 ?auto_263361 ) ) ( not ( = ?auto_263351 ?auto_263362 ) ) ( not ( = ?auto_263352 ?auto_263353 ) ) ( not ( = ?auto_263352 ?auto_263354 ) ) ( not ( = ?auto_263352 ?auto_263355 ) ) ( not ( = ?auto_263352 ?auto_263356 ) ) ( not ( = ?auto_263352 ?auto_263357 ) ) ( not ( = ?auto_263352 ?auto_263358 ) ) ( not ( = ?auto_263352 ?auto_263359 ) ) ( not ( = ?auto_263352 ?auto_263360 ) ) ( not ( = ?auto_263352 ?auto_263361 ) ) ( not ( = ?auto_263352 ?auto_263362 ) ) ( not ( = ?auto_263353 ?auto_263354 ) ) ( not ( = ?auto_263353 ?auto_263355 ) ) ( not ( = ?auto_263353 ?auto_263356 ) ) ( not ( = ?auto_263353 ?auto_263357 ) ) ( not ( = ?auto_263353 ?auto_263358 ) ) ( not ( = ?auto_263353 ?auto_263359 ) ) ( not ( = ?auto_263353 ?auto_263360 ) ) ( not ( = ?auto_263353 ?auto_263361 ) ) ( not ( = ?auto_263353 ?auto_263362 ) ) ( not ( = ?auto_263354 ?auto_263355 ) ) ( not ( = ?auto_263354 ?auto_263356 ) ) ( not ( = ?auto_263354 ?auto_263357 ) ) ( not ( = ?auto_263354 ?auto_263358 ) ) ( not ( = ?auto_263354 ?auto_263359 ) ) ( not ( = ?auto_263354 ?auto_263360 ) ) ( not ( = ?auto_263354 ?auto_263361 ) ) ( not ( = ?auto_263354 ?auto_263362 ) ) ( not ( = ?auto_263355 ?auto_263356 ) ) ( not ( = ?auto_263355 ?auto_263357 ) ) ( not ( = ?auto_263355 ?auto_263358 ) ) ( not ( = ?auto_263355 ?auto_263359 ) ) ( not ( = ?auto_263355 ?auto_263360 ) ) ( not ( = ?auto_263355 ?auto_263361 ) ) ( not ( = ?auto_263355 ?auto_263362 ) ) ( not ( = ?auto_263356 ?auto_263357 ) ) ( not ( = ?auto_263356 ?auto_263358 ) ) ( not ( = ?auto_263356 ?auto_263359 ) ) ( not ( = ?auto_263356 ?auto_263360 ) ) ( not ( = ?auto_263356 ?auto_263361 ) ) ( not ( = ?auto_263356 ?auto_263362 ) ) ( not ( = ?auto_263357 ?auto_263358 ) ) ( not ( = ?auto_263357 ?auto_263359 ) ) ( not ( = ?auto_263357 ?auto_263360 ) ) ( not ( = ?auto_263357 ?auto_263361 ) ) ( not ( = ?auto_263357 ?auto_263362 ) ) ( not ( = ?auto_263358 ?auto_263359 ) ) ( not ( = ?auto_263358 ?auto_263360 ) ) ( not ( = ?auto_263358 ?auto_263361 ) ) ( not ( = ?auto_263358 ?auto_263362 ) ) ( not ( = ?auto_263359 ?auto_263360 ) ) ( not ( = ?auto_263359 ?auto_263361 ) ) ( not ( = ?auto_263359 ?auto_263362 ) ) ( not ( = ?auto_263360 ?auto_263361 ) ) ( not ( = ?auto_263360 ?auto_263362 ) ) ( not ( = ?auto_263361 ?auto_263362 ) ) ( ON ?auto_263360 ?auto_263361 ) ( ON ?auto_263359 ?auto_263360 ) ( CLEAR ?auto_263357 ) ( ON ?auto_263358 ?auto_263359 ) ( CLEAR ?auto_263358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_263350 ?auto_263351 ?auto_263352 ?auto_263353 ?auto_263354 ?auto_263355 ?auto_263356 ?auto_263357 ?auto_263358 )
      ( MAKE-12PILE ?auto_263350 ?auto_263351 ?auto_263352 ?auto_263353 ?auto_263354 ?auto_263355 ?auto_263356 ?auto_263357 ?auto_263358 ?auto_263359 ?auto_263360 ?auto_263361 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263400 - BLOCK
      ?auto_263401 - BLOCK
      ?auto_263402 - BLOCK
      ?auto_263403 - BLOCK
      ?auto_263404 - BLOCK
      ?auto_263405 - BLOCK
      ?auto_263406 - BLOCK
      ?auto_263407 - BLOCK
      ?auto_263408 - BLOCK
      ?auto_263409 - BLOCK
      ?auto_263410 - BLOCK
      ?auto_263411 - BLOCK
    )
    :vars
    (
      ?auto_263412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263411 ?auto_263412 ) ( ON-TABLE ?auto_263400 ) ( ON ?auto_263401 ?auto_263400 ) ( ON ?auto_263402 ?auto_263401 ) ( ON ?auto_263403 ?auto_263402 ) ( ON ?auto_263404 ?auto_263403 ) ( ON ?auto_263405 ?auto_263404 ) ( ON ?auto_263406 ?auto_263405 ) ( not ( = ?auto_263400 ?auto_263401 ) ) ( not ( = ?auto_263400 ?auto_263402 ) ) ( not ( = ?auto_263400 ?auto_263403 ) ) ( not ( = ?auto_263400 ?auto_263404 ) ) ( not ( = ?auto_263400 ?auto_263405 ) ) ( not ( = ?auto_263400 ?auto_263406 ) ) ( not ( = ?auto_263400 ?auto_263407 ) ) ( not ( = ?auto_263400 ?auto_263408 ) ) ( not ( = ?auto_263400 ?auto_263409 ) ) ( not ( = ?auto_263400 ?auto_263410 ) ) ( not ( = ?auto_263400 ?auto_263411 ) ) ( not ( = ?auto_263400 ?auto_263412 ) ) ( not ( = ?auto_263401 ?auto_263402 ) ) ( not ( = ?auto_263401 ?auto_263403 ) ) ( not ( = ?auto_263401 ?auto_263404 ) ) ( not ( = ?auto_263401 ?auto_263405 ) ) ( not ( = ?auto_263401 ?auto_263406 ) ) ( not ( = ?auto_263401 ?auto_263407 ) ) ( not ( = ?auto_263401 ?auto_263408 ) ) ( not ( = ?auto_263401 ?auto_263409 ) ) ( not ( = ?auto_263401 ?auto_263410 ) ) ( not ( = ?auto_263401 ?auto_263411 ) ) ( not ( = ?auto_263401 ?auto_263412 ) ) ( not ( = ?auto_263402 ?auto_263403 ) ) ( not ( = ?auto_263402 ?auto_263404 ) ) ( not ( = ?auto_263402 ?auto_263405 ) ) ( not ( = ?auto_263402 ?auto_263406 ) ) ( not ( = ?auto_263402 ?auto_263407 ) ) ( not ( = ?auto_263402 ?auto_263408 ) ) ( not ( = ?auto_263402 ?auto_263409 ) ) ( not ( = ?auto_263402 ?auto_263410 ) ) ( not ( = ?auto_263402 ?auto_263411 ) ) ( not ( = ?auto_263402 ?auto_263412 ) ) ( not ( = ?auto_263403 ?auto_263404 ) ) ( not ( = ?auto_263403 ?auto_263405 ) ) ( not ( = ?auto_263403 ?auto_263406 ) ) ( not ( = ?auto_263403 ?auto_263407 ) ) ( not ( = ?auto_263403 ?auto_263408 ) ) ( not ( = ?auto_263403 ?auto_263409 ) ) ( not ( = ?auto_263403 ?auto_263410 ) ) ( not ( = ?auto_263403 ?auto_263411 ) ) ( not ( = ?auto_263403 ?auto_263412 ) ) ( not ( = ?auto_263404 ?auto_263405 ) ) ( not ( = ?auto_263404 ?auto_263406 ) ) ( not ( = ?auto_263404 ?auto_263407 ) ) ( not ( = ?auto_263404 ?auto_263408 ) ) ( not ( = ?auto_263404 ?auto_263409 ) ) ( not ( = ?auto_263404 ?auto_263410 ) ) ( not ( = ?auto_263404 ?auto_263411 ) ) ( not ( = ?auto_263404 ?auto_263412 ) ) ( not ( = ?auto_263405 ?auto_263406 ) ) ( not ( = ?auto_263405 ?auto_263407 ) ) ( not ( = ?auto_263405 ?auto_263408 ) ) ( not ( = ?auto_263405 ?auto_263409 ) ) ( not ( = ?auto_263405 ?auto_263410 ) ) ( not ( = ?auto_263405 ?auto_263411 ) ) ( not ( = ?auto_263405 ?auto_263412 ) ) ( not ( = ?auto_263406 ?auto_263407 ) ) ( not ( = ?auto_263406 ?auto_263408 ) ) ( not ( = ?auto_263406 ?auto_263409 ) ) ( not ( = ?auto_263406 ?auto_263410 ) ) ( not ( = ?auto_263406 ?auto_263411 ) ) ( not ( = ?auto_263406 ?auto_263412 ) ) ( not ( = ?auto_263407 ?auto_263408 ) ) ( not ( = ?auto_263407 ?auto_263409 ) ) ( not ( = ?auto_263407 ?auto_263410 ) ) ( not ( = ?auto_263407 ?auto_263411 ) ) ( not ( = ?auto_263407 ?auto_263412 ) ) ( not ( = ?auto_263408 ?auto_263409 ) ) ( not ( = ?auto_263408 ?auto_263410 ) ) ( not ( = ?auto_263408 ?auto_263411 ) ) ( not ( = ?auto_263408 ?auto_263412 ) ) ( not ( = ?auto_263409 ?auto_263410 ) ) ( not ( = ?auto_263409 ?auto_263411 ) ) ( not ( = ?auto_263409 ?auto_263412 ) ) ( not ( = ?auto_263410 ?auto_263411 ) ) ( not ( = ?auto_263410 ?auto_263412 ) ) ( not ( = ?auto_263411 ?auto_263412 ) ) ( ON ?auto_263410 ?auto_263411 ) ( ON ?auto_263409 ?auto_263410 ) ( ON ?auto_263408 ?auto_263409 ) ( CLEAR ?auto_263406 ) ( ON ?auto_263407 ?auto_263408 ) ( CLEAR ?auto_263407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_263400 ?auto_263401 ?auto_263402 ?auto_263403 ?auto_263404 ?auto_263405 ?auto_263406 ?auto_263407 )
      ( MAKE-12PILE ?auto_263400 ?auto_263401 ?auto_263402 ?auto_263403 ?auto_263404 ?auto_263405 ?auto_263406 ?auto_263407 ?auto_263408 ?auto_263409 ?auto_263410 ?auto_263411 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263450 - BLOCK
      ?auto_263451 - BLOCK
      ?auto_263452 - BLOCK
      ?auto_263453 - BLOCK
      ?auto_263454 - BLOCK
      ?auto_263455 - BLOCK
      ?auto_263456 - BLOCK
      ?auto_263457 - BLOCK
      ?auto_263458 - BLOCK
      ?auto_263459 - BLOCK
      ?auto_263460 - BLOCK
      ?auto_263461 - BLOCK
    )
    :vars
    (
      ?auto_263462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263461 ?auto_263462 ) ( ON-TABLE ?auto_263450 ) ( ON ?auto_263451 ?auto_263450 ) ( ON ?auto_263452 ?auto_263451 ) ( ON ?auto_263453 ?auto_263452 ) ( ON ?auto_263454 ?auto_263453 ) ( ON ?auto_263455 ?auto_263454 ) ( not ( = ?auto_263450 ?auto_263451 ) ) ( not ( = ?auto_263450 ?auto_263452 ) ) ( not ( = ?auto_263450 ?auto_263453 ) ) ( not ( = ?auto_263450 ?auto_263454 ) ) ( not ( = ?auto_263450 ?auto_263455 ) ) ( not ( = ?auto_263450 ?auto_263456 ) ) ( not ( = ?auto_263450 ?auto_263457 ) ) ( not ( = ?auto_263450 ?auto_263458 ) ) ( not ( = ?auto_263450 ?auto_263459 ) ) ( not ( = ?auto_263450 ?auto_263460 ) ) ( not ( = ?auto_263450 ?auto_263461 ) ) ( not ( = ?auto_263450 ?auto_263462 ) ) ( not ( = ?auto_263451 ?auto_263452 ) ) ( not ( = ?auto_263451 ?auto_263453 ) ) ( not ( = ?auto_263451 ?auto_263454 ) ) ( not ( = ?auto_263451 ?auto_263455 ) ) ( not ( = ?auto_263451 ?auto_263456 ) ) ( not ( = ?auto_263451 ?auto_263457 ) ) ( not ( = ?auto_263451 ?auto_263458 ) ) ( not ( = ?auto_263451 ?auto_263459 ) ) ( not ( = ?auto_263451 ?auto_263460 ) ) ( not ( = ?auto_263451 ?auto_263461 ) ) ( not ( = ?auto_263451 ?auto_263462 ) ) ( not ( = ?auto_263452 ?auto_263453 ) ) ( not ( = ?auto_263452 ?auto_263454 ) ) ( not ( = ?auto_263452 ?auto_263455 ) ) ( not ( = ?auto_263452 ?auto_263456 ) ) ( not ( = ?auto_263452 ?auto_263457 ) ) ( not ( = ?auto_263452 ?auto_263458 ) ) ( not ( = ?auto_263452 ?auto_263459 ) ) ( not ( = ?auto_263452 ?auto_263460 ) ) ( not ( = ?auto_263452 ?auto_263461 ) ) ( not ( = ?auto_263452 ?auto_263462 ) ) ( not ( = ?auto_263453 ?auto_263454 ) ) ( not ( = ?auto_263453 ?auto_263455 ) ) ( not ( = ?auto_263453 ?auto_263456 ) ) ( not ( = ?auto_263453 ?auto_263457 ) ) ( not ( = ?auto_263453 ?auto_263458 ) ) ( not ( = ?auto_263453 ?auto_263459 ) ) ( not ( = ?auto_263453 ?auto_263460 ) ) ( not ( = ?auto_263453 ?auto_263461 ) ) ( not ( = ?auto_263453 ?auto_263462 ) ) ( not ( = ?auto_263454 ?auto_263455 ) ) ( not ( = ?auto_263454 ?auto_263456 ) ) ( not ( = ?auto_263454 ?auto_263457 ) ) ( not ( = ?auto_263454 ?auto_263458 ) ) ( not ( = ?auto_263454 ?auto_263459 ) ) ( not ( = ?auto_263454 ?auto_263460 ) ) ( not ( = ?auto_263454 ?auto_263461 ) ) ( not ( = ?auto_263454 ?auto_263462 ) ) ( not ( = ?auto_263455 ?auto_263456 ) ) ( not ( = ?auto_263455 ?auto_263457 ) ) ( not ( = ?auto_263455 ?auto_263458 ) ) ( not ( = ?auto_263455 ?auto_263459 ) ) ( not ( = ?auto_263455 ?auto_263460 ) ) ( not ( = ?auto_263455 ?auto_263461 ) ) ( not ( = ?auto_263455 ?auto_263462 ) ) ( not ( = ?auto_263456 ?auto_263457 ) ) ( not ( = ?auto_263456 ?auto_263458 ) ) ( not ( = ?auto_263456 ?auto_263459 ) ) ( not ( = ?auto_263456 ?auto_263460 ) ) ( not ( = ?auto_263456 ?auto_263461 ) ) ( not ( = ?auto_263456 ?auto_263462 ) ) ( not ( = ?auto_263457 ?auto_263458 ) ) ( not ( = ?auto_263457 ?auto_263459 ) ) ( not ( = ?auto_263457 ?auto_263460 ) ) ( not ( = ?auto_263457 ?auto_263461 ) ) ( not ( = ?auto_263457 ?auto_263462 ) ) ( not ( = ?auto_263458 ?auto_263459 ) ) ( not ( = ?auto_263458 ?auto_263460 ) ) ( not ( = ?auto_263458 ?auto_263461 ) ) ( not ( = ?auto_263458 ?auto_263462 ) ) ( not ( = ?auto_263459 ?auto_263460 ) ) ( not ( = ?auto_263459 ?auto_263461 ) ) ( not ( = ?auto_263459 ?auto_263462 ) ) ( not ( = ?auto_263460 ?auto_263461 ) ) ( not ( = ?auto_263460 ?auto_263462 ) ) ( not ( = ?auto_263461 ?auto_263462 ) ) ( ON ?auto_263460 ?auto_263461 ) ( ON ?auto_263459 ?auto_263460 ) ( ON ?auto_263458 ?auto_263459 ) ( ON ?auto_263457 ?auto_263458 ) ( CLEAR ?auto_263455 ) ( ON ?auto_263456 ?auto_263457 ) ( CLEAR ?auto_263456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_263450 ?auto_263451 ?auto_263452 ?auto_263453 ?auto_263454 ?auto_263455 ?auto_263456 )
      ( MAKE-12PILE ?auto_263450 ?auto_263451 ?auto_263452 ?auto_263453 ?auto_263454 ?auto_263455 ?auto_263456 ?auto_263457 ?auto_263458 ?auto_263459 ?auto_263460 ?auto_263461 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263500 - BLOCK
      ?auto_263501 - BLOCK
      ?auto_263502 - BLOCK
      ?auto_263503 - BLOCK
      ?auto_263504 - BLOCK
      ?auto_263505 - BLOCK
      ?auto_263506 - BLOCK
      ?auto_263507 - BLOCK
      ?auto_263508 - BLOCK
      ?auto_263509 - BLOCK
      ?auto_263510 - BLOCK
      ?auto_263511 - BLOCK
    )
    :vars
    (
      ?auto_263512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263511 ?auto_263512 ) ( ON-TABLE ?auto_263500 ) ( ON ?auto_263501 ?auto_263500 ) ( ON ?auto_263502 ?auto_263501 ) ( ON ?auto_263503 ?auto_263502 ) ( ON ?auto_263504 ?auto_263503 ) ( not ( = ?auto_263500 ?auto_263501 ) ) ( not ( = ?auto_263500 ?auto_263502 ) ) ( not ( = ?auto_263500 ?auto_263503 ) ) ( not ( = ?auto_263500 ?auto_263504 ) ) ( not ( = ?auto_263500 ?auto_263505 ) ) ( not ( = ?auto_263500 ?auto_263506 ) ) ( not ( = ?auto_263500 ?auto_263507 ) ) ( not ( = ?auto_263500 ?auto_263508 ) ) ( not ( = ?auto_263500 ?auto_263509 ) ) ( not ( = ?auto_263500 ?auto_263510 ) ) ( not ( = ?auto_263500 ?auto_263511 ) ) ( not ( = ?auto_263500 ?auto_263512 ) ) ( not ( = ?auto_263501 ?auto_263502 ) ) ( not ( = ?auto_263501 ?auto_263503 ) ) ( not ( = ?auto_263501 ?auto_263504 ) ) ( not ( = ?auto_263501 ?auto_263505 ) ) ( not ( = ?auto_263501 ?auto_263506 ) ) ( not ( = ?auto_263501 ?auto_263507 ) ) ( not ( = ?auto_263501 ?auto_263508 ) ) ( not ( = ?auto_263501 ?auto_263509 ) ) ( not ( = ?auto_263501 ?auto_263510 ) ) ( not ( = ?auto_263501 ?auto_263511 ) ) ( not ( = ?auto_263501 ?auto_263512 ) ) ( not ( = ?auto_263502 ?auto_263503 ) ) ( not ( = ?auto_263502 ?auto_263504 ) ) ( not ( = ?auto_263502 ?auto_263505 ) ) ( not ( = ?auto_263502 ?auto_263506 ) ) ( not ( = ?auto_263502 ?auto_263507 ) ) ( not ( = ?auto_263502 ?auto_263508 ) ) ( not ( = ?auto_263502 ?auto_263509 ) ) ( not ( = ?auto_263502 ?auto_263510 ) ) ( not ( = ?auto_263502 ?auto_263511 ) ) ( not ( = ?auto_263502 ?auto_263512 ) ) ( not ( = ?auto_263503 ?auto_263504 ) ) ( not ( = ?auto_263503 ?auto_263505 ) ) ( not ( = ?auto_263503 ?auto_263506 ) ) ( not ( = ?auto_263503 ?auto_263507 ) ) ( not ( = ?auto_263503 ?auto_263508 ) ) ( not ( = ?auto_263503 ?auto_263509 ) ) ( not ( = ?auto_263503 ?auto_263510 ) ) ( not ( = ?auto_263503 ?auto_263511 ) ) ( not ( = ?auto_263503 ?auto_263512 ) ) ( not ( = ?auto_263504 ?auto_263505 ) ) ( not ( = ?auto_263504 ?auto_263506 ) ) ( not ( = ?auto_263504 ?auto_263507 ) ) ( not ( = ?auto_263504 ?auto_263508 ) ) ( not ( = ?auto_263504 ?auto_263509 ) ) ( not ( = ?auto_263504 ?auto_263510 ) ) ( not ( = ?auto_263504 ?auto_263511 ) ) ( not ( = ?auto_263504 ?auto_263512 ) ) ( not ( = ?auto_263505 ?auto_263506 ) ) ( not ( = ?auto_263505 ?auto_263507 ) ) ( not ( = ?auto_263505 ?auto_263508 ) ) ( not ( = ?auto_263505 ?auto_263509 ) ) ( not ( = ?auto_263505 ?auto_263510 ) ) ( not ( = ?auto_263505 ?auto_263511 ) ) ( not ( = ?auto_263505 ?auto_263512 ) ) ( not ( = ?auto_263506 ?auto_263507 ) ) ( not ( = ?auto_263506 ?auto_263508 ) ) ( not ( = ?auto_263506 ?auto_263509 ) ) ( not ( = ?auto_263506 ?auto_263510 ) ) ( not ( = ?auto_263506 ?auto_263511 ) ) ( not ( = ?auto_263506 ?auto_263512 ) ) ( not ( = ?auto_263507 ?auto_263508 ) ) ( not ( = ?auto_263507 ?auto_263509 ) ) ( not ( = ?auto_263507 ?auto_263510 ) ) ( not ( = ?auto_263507 ?auto_263511 ) ) ( not ( = ?auto_263507 ?auto_263512 ) ) ( not ( = ?auto_263508 ?auto_263509 ) ) ( not ( = ?auto_263508 ?auto_263510 ) ) ( not ( = ?auto_263508 ?auto_263511 ) ) ( not ( = ?auto_263508 ?auto_263512 ) ) ( not ( = ?auto_263509 ?auto_263510 ) ) ( not ( = ?auto_263509 ?auto_263511 ) ) ( not ( = ?auto_263509 ?auto_263512 ) ) ( not ( = ?auto_263510 ?auto_263511 ) ) ( not ( = ?auto_263510 ?auto_263512 ) ) ( not ( = ?auto_263511 ?auto_263512 ) ) ( ON ?auto_263510 ?auto_263511 ) ( ON ?auto_263509 ?auto_263510 ) ( ON ?auto_263508 ?auto_263509 ) ( ON ?auto_263507 ?auto_263508 ) ( ON ?auto_263506 ?auto_263507 ) ( CLEAR ?auto_263504 ) ( ON ?auto_263505 ?auto_263506 ) ( CLEAR ?auto_263505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_263500 ?auto_263501 ?auto_263502 ?auto_263503 ?auto_263504 ?auto_263505 )
      ( MAKE-12PILE ?auto_263500 ?auto_263501 ?auto_263502 ?auto_263503 ?auto_263504 ?auto_263505 ?auto_263506 ?auto_263507 ?auto_263508 ?auto_263509 ?auto_263510 ?auto_263511 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263550 - BLOCK
      ?auto_263551 - BLOCK
      ?auto_263552 - BLOCK
      ?auto_263553 - BLOCK
      ?auto_263554 - BLOCK
      ?auto_263555 - BLOCK
      ?auto_263556 - BLOCK
      ?auto_263557 - BLOCK
      ?auto_263558 - BLOCK
      ?auto_263559 - BLOCK
      ?auto_263560 - BLOCK
      ?auto_263561 - BLOCK
    )
    :vars
    (
      ?auto_263562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263561 ?auto_263562 ) ( ON-TABLE ?auto_263550 ) ( ON ?auto_263551 ?auto_263550 ) ( ON ?auto_263552 ?auto_263551 ) ( ON ?auto_263553 ?auto_263552 ) ( not ( = ?auto_263550 ?auto_263551 ) ) ( not ( = ?auto_263550 ?auto_263552 ) ) ( not ( = ?auto_263550 ?auto_263553 ) ) ( not ( = ?auto_263550 ?auto_263554 ) ) ( not ( = ?auto_263550 ?auto_263555 ) ) ( not ( = ?auto_263550 ?auto_263556 ) ) ( not ( = ?auto_263550 ?auto_263557 ) ) ( not ( = ?auto_263550 ?auto_263558 ) ) ( not ( = ?auto_263550 ?auto_263559 ) ) ( not ( = ?auto_263550 ?auto_263560 ) ) ( not ( = ?auto_263550 ?auto_263561 ) ) ( not ( = ?auto_263550 ?auto_263562 ) ) ( not ( = ?auto_263551 ?auto_263552 ) ) ( not ( = ?auto_263551 ?auto_263553 ) ) ( not ( = ?auto_263551 ?auto_263554 ) ) ( not ( = ?auto_263551 ?auto_263555 ) ) ( not ( = ?auto_263551 ?auto_263556 ) ) ( not ( = ?auto_263551 ?auto_263557 ) ) ( not ( = ?auto_263551 ?auto_263558 ) ) ( not ( = ?auto_263551 ?auto_263559 ) ) ( not ( = ?auto_263551 ?auto_263560 ) ) ( not ( = ?auto_263551 ?auto_263561 ) ) ( not ( = ?auto_263551 ?auto_263562 ) ) ( not ( = ?auto_263552 ?auto_263553 ) ) ( not ( = ?auto_263552 ?auto_263554 ) ) ( not ( = ?auto_263552 ?auto_263555 ) ) ( not ( = ?auto_263552 ?auto_263556 ) ) ( not ( = ?auto_263552 ?auto_263557 ) ) ( not ( = ?auto_263552 ?auto_263558 ) ) ( not ( = ?auto_263552 ?auto_263559 ) ) ( not ( = ?auto_263552 ?auto_263560 ) ) ( not ( = ?auto_263552 ?auto_263561 ) ) ( not ( = ?auto_263552 ?auto_263562 ) ) ( not ( = ?auto_263553 ?auto_263554 ) ) ( not ( = ?auto_263553 ?auto_263555 ) ) ( not ( = ?auto_263553 ?auto_263556 ) ) ( not ( = ?auto_263553 ?auto_263557 ) ) ( not ( = ?auto_263553 ?auto_263558 ) ) ( not ( = ?auto_263553 ?auto_263559 ) ) ( not ( = ?auto_263553 ?auto_263560 ) ) ( not ( = ?auto_263553 ?auto_263561 ) ) ( not ( = ?auto_263553 ?auto_263562 ) ) ( not ( = ?auto_263554 ?auto_263555 ) ) ( not ( = ?auto_263554 ?auto_263556 ) ) ( not ( = ?auto_263554 ?auto_263557 ) ) ( not ( = ?auto_263554 ?auto_263558 ) ) ( not ( = ?auto_263554 ?auto_263559 ) ) ( not ( = ?auto_263554 ?auto_263560 ) ) ( not ( = ?auto_263554 ?auto_263561 ) ) ( not ( = ?auto_263554 ?auto_263562 ) ) ( not ( = ?auto_263555 ?auto_263556 ) ) ( not ( = ?auto_263555 ?auto_263557 ) ) ( not ( = ?auto_263555 ?auto_263558 ) ) ( not ( = ?auto_263555 ?auto_263559 ) ) ( not ( = ?auto_263555 ?auto_263560 ) ) ( not ( = ?auto_263555 ?auto_263561 ) ) ( not ( = ?auto_263555 ?auto_263562 ) ) ( not ( = ?auto_263556 ?auto_263557 ) ) ( not ( = ?auto_263556 ?auto_263558 ) ) ( not ( = ?auto_263556 ?auto_263559 ) ) ( not ( = ?auto_263556 ?auto_263560 ) ) ( not ( = ?auto_263556 ?auto_263561 ) ) ( not ( = ?auto_263556 ?auto_263562 ) ) ( not ( = ?auto_263557 ?auto_263558 ) ) ( not ( = ?auto_263557 ?auto_263559 ) ) ( not ( = ?auto_263557 ?auto_263560 ) ) ( not ( = ?auto_263557 ?auto_263561 ) ) ( not ( = ?auto_263557 ?auto_263562 ) ) ( not ( = ?auto_263558 ?auto_263559 ) ) ( not ( = ?auto_263558 ?auto_263560 ) ) ( not ( = ?auto_263558 ?auto_263561 ) ) ( not ( = ?auto_263558 ?auto_263562 ) ) ( not ( = ?auto_263559 ?auto_263560 ) ) ( not ( = ?auto_263559 ?auto_263561 ) ) ( not ( = ?auto_263559 ?auto_263562 ) ) ( not ( = ?auto_263560 ?auto_263561 ) ) ( not ( = ?auto_263560 ?auto_263562 ) ) ( not ( = ?auto_263561 ?auto_263562 ) ) ( ON ?auto_263560 ?auto_263561 ) ( ON ?auto_263559 ?auto_263560 ) ( ON ?auto_263558 ?auto_263559 ) ( ON ?auto_263557 ?auto_263558 ) ( ON ?auto_263556 ?auto_263557 ) ( ON ?auto_263555 ?auto_263556 ) ( CLEAR ?auto_263553 ) ( ON ?auto_263554 ?auto_263555 ) ( CLEAR ?auto_263554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_263550 ?auto_263551 ?auto_263552 ?auto_263553 ?auto_263554 )
      ( MAKE-12PILE ?auto_263550 ?auto_263551 ?auto_263552 ?auto_263553 ?auto_263554 ?auto_263555 ?auto_263556 ?auto_263557 ?auto_263558 ?auto_263559 ?auto_263560 ?auto_263561 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263600 - BLOCK
      ?auto_263601 - BLOCK
      ?auto_263602 - BLOCK
      ?auto_263603 - BLOCK
      ?auto_263604 - BLOCK
      ?auto_263605 - BLOCK
      ?auto_263606 - BLOCK
      ?auto_263607 - BLOCK
      ?auto_263608 - BLOCK
      ?auto_263609 - BLOCK
      ?auto_263610 - BLOCK
      ?auto_263611 - BLOCK
    )
    :vars
    (
      ?auto_263612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263611 ?auto_263612 ) ( ON-TABLE ?auto_263600 ) ( ON ?auto_263601 ?auto_263600 ) ( ON ?auto_263602 ?auto_263601 ) ( not ( = ?auto_263600 ?auto_263601 ) ) ( not ( = ?auto_263600 ?auto_263602 ) ) ( not ( = ?auto_263600 ?auto_263603 ) ) ( not ( = ?auto_263600 ?auto_263604 ) ) ( not ( = ?auto_263600 ?auto_263605 ) ) ( not ( = ?auto_263600 ?auto_263606 ) ) ( not ( = ?auto_263600 ?auto_263607 ) ) ( not ( = ?auto_263600 ?auto_263608 ) ) ( not ( = ?auto_263600 ?auto_263609 ) ) ( not ( = ?auto_263600 ?auto_263610 ) ) ( not ( = ?auto_263600 ?auto_263611 ) ) ( not ( = ?auto_263600 ?auto_263612 ) ) ( not ( = ?auto_263601 ?auto_263602 ) ) ( not ( = ?auto_263601 ?auto_263603 ) ) ( not ( = ?auto_263601 ?auto_263604 ) ) ( not ( = ?auto_263601 ?auto_263605 ) ) ( not ( = ?auto_263601 ?auto_263606 ) ) ( not ( = ?auto_263601 ?auto_263607 ) ) ( not ( = ?auto_263601 ?auto_263608 ) ) ( not ( = ?auto_263601 ?auto_263609 ) ) ( not ( = ?auto_263601 ?auto_263610 ) ) ( not ( = ?auto_263601 ?auto_263611 ) ) ( not ( = ?auto_263601 ?auto_263612 ) ) ( not ( = ?auto_263602 ?auto_263603 ) ) ( not ( = ?auto_263602 ?auto_263604 ) ) ( not ( = ?auto_263602 ?auto_263605 ) ) ( not ( = ?auto_263602 ?auto_263606 ) ) ( not ( = ?auto_263602 ?auto_263607 ) ) ( not ( = ?auto_263602 ?auto_263608 ) ) ( not ( = ?auto_263602 ?auto_263609 ) ) ( not ( = ?auto_263602 ?auto_263610 ) ) ( not ( = ?auto_263602 ?auto_263611 ) ) ( not ( = ?auto_263602 ?auto_263612 ) ) ( not ( = ?auto_263603 ?auto_263604 ) ) ( not ( = ?auto_263603 ?auto_263605 ) ) ( not ( = ?auto_263603 ?auto_263606 ) ) ( not ( = ?auto_263603 ?auto_263607 ) ) ( not ( = ?auto_263603 ?auto_263608 ) ) ( not ( = ?auto_263603 ?auto_263609 ) ) ( not ( = ?auto_263603 ?auto_263610 ) ) ( not ( = ?auto_263603 ?auto_263611 ) ) ( not ( = ?auto_263603 ?auto_263612 ) ) ( not ( = ?auto_263604 ?auto_263605 ) ) ( not ( = ?auto_263604 ?auto_263606 ) ) ( not ( = ?auto_263604 ?auto_263607 ) ) ( not ( = ?auto_263604 ?auto_263608 ) ) ( not ( = ?auto_263604 ?auto_263609 ) ) ( not ( = ?auto_263604 ?auto_263610 ) ) ( not ( = ?auto_263604 ?auto_263611 ) ) ( not ( = ?auto_263604 ?auto_263612 ) ) ( not ( = ?auto_263605 ?auto_263606 ) ) ( not ( = ?auto_263605 ?auto_263607 ) ) ( not ( = ?auto_263605 ?auto_263608 ) ) ( not ( = ?auto_263605 ?auto_263609 ) ) ( not ( = ?auto_263605 ?auto_263610 ) ) ( not ( = ?auto_263605 ?auto_263611 ) ) ( not ( = ?auto_263605 ?auto_263612 ) ) ( not ( = ?auto_263606 ?auto_263607 ) ) ( not ( = ?auto_263606 ?auto_263608 ) ) ( not ( = ?auto_263606 ?auto_263609 ) ) ( not ( = ?auto_263606 ?auto_263610 ) ) ( not ( = ?auto_263606 ?auto_263611 ) ) ( not ( = ?auto_263606 ?auto_263612 ) ) ( not ( = ?auto_263607 ?auto_263608 ) ) ( not ( = ?auto_263607 ?auto_263609 ) ) ( not ( = ?auto_263607 ?auto_263610 ) ) ( not ( = ?auto_263607 ?auto_263611 ) ) ( not ( = ?auto_263607 ?auto_263612 ) ) ( not ( = ?auto_263608 ?auto_263609 ) ) ( not ( = ?auto_263608 ?auto_263610 ) ) ( not ( = ?auto_263608 ?auto_263611 ) ) ( not ( = ?auto_263608 ?auto_263612 ) ) ( not ( = ?auto_263609 ?auto_263610 ) ) ( not ( = ?auto_263609 ?auto_263611 ) ) ( not ( = ?auto_263609 ?auto_263612 ) ) ( not ( = ?auto_263610 ?auto_263611 ) ) ( not ( = ?auto_263610 ?auto_263612 ) ) ( not ( = ?auto_263611 ?auto_263612 ) ) ( ON ?auto_263610 ?auto_263611 ) ( ON ?auto_263609 ?auto_263610 ) ( ON ?auto_263608 ?auto_263609 ) ( ON ?auto_263607 ?auto_263608 ) ( ON ?auto_263606 ?auto_263607 ) ( ON ?auto_263605 ?auto_263606 ) ( ON ?auto_263604 ?auto_263605 ) ( CLEAR ?auto_263602 ) ( ON ?auto_263603 ?auto_263604 ) ( CLEAR ?auto_263603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_263600 ?auto_263601 ?auto_263602 ?auto_263603 )
      ( MAKE-12PILE ?auto_263600 ?auto_263601 ?auto_263602 ?auto_263603 ?auto_263604 ?auto_263605 ?auto_263606 ?auto_263607 ?auto_263608 ?auto_263609 ?auto_263610 ?auto_263611 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263650 - BLOCK
      ?auto_263651 - BLOCK
      ?auto_263652 - BLOCK
      ?auto_263653 - BLOCK
      ?auto_263654 - BLOCK
      ?auto_263655 - BLOCK
      ?auto_263656 - BLOCK
      ?auto_263657 - BLOCK
      ?auto_263658 - BLOCK
      ?auto_263659 - BLOCK
      ?auto_263660 - BLOCK
      ?auto_263661 - BLOCK
    )
    :vars
    (
      ?auto_263662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263661 ?auto_263662 ) ( ON-TABLE ?auto_263650 ) ( ON ?auto_263651 ?auto_263650 ) ( not ( = ?auto_263650 ?auto_263651 ) ) ( not ( = ?auto_263650 ?auto_263652 ) ) ( not ( = ?auto_263650 ?auto_263653 ) ) ( not ( = ?auto_263650 ?auto_263654 ) ) ( not ( = ?auto_263650 ?auto_263655 ) ) ( not ( = ?auto_263650 ?auto_263656 ) ) ( not ( = ?auto_263650 ?auto_263657 ) ) ( not ( = ?auto_263650 ?auto_263658 ) ) ( not ( = ?auto_263650 ?auto_263659 ) ) ( not ( = ?auto_263650 ?auto_263660 ) ) ( not ( = ?auto_263650 ?auto_263661 ) ) ( not ( = ?auto_263650 ?auto_263662 ) ) ( not ( = ?auto_263651 ?auto_263652 ) ) ( not ( = ?auto_263651 ?auto_263653 ) ) ( not ( = ?auto_263651 ?auto_263654 ) ) ( not ( = ?auto_263651 ?auto_263655 ) ) ( not ( = ?auto_263651 ?auto_263656 ) ) ( not ( = ?auto_263651 ?auto_263657 ) ) ( not ( = ?auto_263651 ?auto_263658 ) ) ( not ( = ?auto_263651 ?auto_263659 ) ) ( not ( = ?auto_263651 ?auto_263660 ) ) ( not ( = ?auto_263651 ?auto_263661 ) ) ( not ( = ?auto_263651 ?auto_263662 ) ) ( not ( = ?auto_263652 ?auto_263653 ) ) ( not ( = ?auto_263652 ?auto_263654 ) ) ( not ( = ?auto_263652 ?auto_263655 ) ) ( not ( = ?auto_263652 ?auto_263656 ) ) ( not ( = ?auto_263652 ?auto_263657 ) ) ( not ( = ?auto_263652 ?auto_263658 ) ) ( not ( = ?auto_263652 ?auto_263659 ) ) ( not ( = ?auto_263652 ?auto_263660 ) ) ( not ( = ?auto_263652 ?auto_263661 ) ) ( not ( = ?auto_263652 ?auto_263662 ) ) ( not ( = ?auto_263653 ?auto_263654 ) ) ( not ( = ?auto_263653 ?auto_263655 ) ) ( not ( = ?auto_263653 ?auto_263656 ) ) ( not ( = ?auto_263653 ?auto_263657 ) ) ( not ( = ?auto_263653 ?auto_263658 ) ) ( not ( = ?auto_263653 ?auto_263659 ) ) ( not ( = ?auto_263653 ?auto_263660 ) ) ( not ( = ?auto_263653 ?auto_263661 ) ) ( not ( = ?auto_263653 ?auto_263662 ) ) ( not ( = ?auto_263654 ?auto_263655 ) ) ( not ( = ?auto_263654 ?auto_263656 ) ) ( not ( = ?auto_263654 ?auto_263657 ) ) ( not ( = ?auto_263654 ?auto_263658 ) ) ( not ( = ?auto_263654 ?auto_263659 ) ) ( not ( = ?auto_263654 ?auto_263660 ) ) ( not ( = ?auto_263654 ?auto_263661 ) ) ( not ( = ?auto_263654 ?auto_263662 ) ) ( not ( = ?auto_263655 ?auto_263656 ) ) ( not ( = ?auto_263655 ?auto_263657 ) ) ( not ( = ?auto_263655 ?auto_263658 ) ) ( not ( = ?auto_263655 ?auto_263659 ) ) ( not ( = ?auto_263655 ?auto_263660 ) ) ( not ( = ?auto_263655 ?auto_263661 ) ) ( not ( = ?auto_263655 ?auto_263662 ) ) ( not ( = ?auto_263656 ?auto_263657 ) ) ( not ( = ?auto_263656 ?auto_263658 ) ) ( not ( = ?auto_263656 ?auto_263659 ) ) ( not ( = ?auto_263656 ?auto_263660 ) ) ( not ( = ?auto_263656 ?auto_263661 ) ) ( not ( = ?auto_263656 ?auto_263662 ) ) ( not ( = ?auto_263657 ?auto_263658 ) ) ( not ( = ?auto_263657 ?auto_263659 ) ) ( not ( = ?auto_263657 ?auto_263660 ) ) ( not ( = ?auto_263657 ?auto_263661 ) ) ( not ( = ?auto_263657 ?auto_263662 ) ) ( not ( = ?auto_263658 ?auto_263659 ) ) ( not ( = ?auto_263658 ?auto_263660 ) ) ( not ( = ?auto_263658 ?auto_263661 ) ) ( not ( = ?auto_263658 ?auto_263662 ) ) ( not ( = ?auto_263659 ?auto_263660 ) ) ( not ( = ?auto_263659 ?auto_263661 ) ) ( not ( = ?auto_263659 ?auto_263662 ) ) ( not ( = ?auto_263660 ?auto_263661 ) ) ( not ( = ?auto_263660 ?auto_263662 ) ) ( not ( = ?auto_263661 ?auto_263662 ) ) ( ON ?auto_263660 ?auto_263661 ) ( ON ?auto_263659 ?auto_263660 ) ( ON ?auto_263658 ?auto_263659 ) ( ON ?auto_263657 ?auto_263658 ) ( ON ?auto_263656 ?auto_263657 ) ( ON ?auto_263655 ?auto_263656 ) ( ON ?auto_263654 ?auto_263655 ) ( ON ?auto_263653 ?auto_263654 ) ( CLEAR ?auto_263651 ) ( ON ?auto_263652 ?auto_263653 ) ( CLEAR ?auto_263652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_263650 ?auto_263651 ?auto_263652 )
      ( MAKE-12PILE ?auto_263650 ?auto_263651 ?auto_263652 ?auto_263653 ?auto_263654 ?auto_263655 ?auto_263656 ?auto_263657 ?auto_263658 ?auto_263659 ?auto_263660 ?auto_263661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263700 - BLOCK
      ?auto_263701 - BLOCK
      ?auto_263702 - BLOCK
      ?auto_263703 - BLOCK
      ?auto_263704 - BLOCK
      ?auto_263705 - BLOCK
      ?auto_263706 - BLOCK
      ?auto_263707 - BLOCK
      ?auto_263708 - BLOCK
      ?auto_263709 - BLOCK
      ?auto_263710 - BLOCK
      ?auto_263711 - BLOCK
    )
    :vars
    (
      ?auto_263712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263711 ?auto_263712 ) ( ON-TABLE ?auto_263700 ) ( not ( = ?auto_263700 ?auto_263701 ) ) ( not ( = ?auto_263700 ?auto_263702 ) ) ( not ( = ?auto_263700 ?auto_263703 ) ) ( not ( = ?auto_263700 ?auto_263704 ) ) ( not ( = ?auto_263700 ?auto_263705 ) ) ( not ( = ?auto_263700 ?auto_263706 ) ) ( not ( = ?auto_263700 ?auto_263707 ) ) ( not ( = ?auto_263700 ?auto_263708 ) ) ( not ( = ?auto_263700 ?auto_263709 ) ) ( not ( = ?auto_263700 ?auto_263710 ) ) ( not ( = ?auto_263700 ?auto_263711 ) ) ( not ( = ?auto_263700 ?auto_263712 ) ) ( not ( = ?auto_263701 ?auto_263702 ) ) ( not ( = ?auto_263701 ?auto_263703 ) ) ( not ( = ?auto_263701 ?auto_263704 ) ) ( not ( = ?auto_263701 ?auto_263705 ) ) ( not ( = ?auto_263701 ?auto_263706 ) ) ( not ( = ?auto_263701 ?auto_263707 ) ) ( not ( = ?auto_263701 ?auto_263708 ) ) ( not ( = ?auto_263701 ?auto_263709 ) ) ( not ( = ?auto_263701 ?auto_263710 ) ) ( not ( = ?auto_263701 ?auto_263711 ) ) ( not ( = ?auto_263701 ?auto_263712 ) ) ( not ( = ?auto_263702 ?auto_263703 ) ) ( not ( = ?auto_263702 ?auto_263704 ) ) ( not ( = ?auto_263702 ?auto_263705 ) ) ( not ( = ?auto_263702 ?auto_263706 ) ) ( not ( = ?auto_263702 ?auto_263707 ) ) ( not ( = ?auto_263702 ?auto_263708 ) ) ( not ( = ?auto_263702 ?auto_263709 ) ) ( not ( = ?auto_263702 ?auto_263710 ) ) ( not ( = ?auto_263702 ?auto_263711 ) ) ( not ( = ?auto_263702 ?auto_263712 ) ) ( not ( = ?auto_263703 ?auto_263704 ) ) ( not ( = ?auto_263703 ?auto_263705 ) ) ( not ( = ?auto_263703 ?auto_263706 ) ) ( not ( = ?auto_263703 ?auto_263707 ) ) ( not ( = ?auto_263703 ?auto_263708 ) ) ( not ( = ?auto_263703 ?auto_263709 ) ) ( not ( = ?auto_263703 ?auto_263710 ) ) ( not ( = ?auto_263703 ?auto_263711 ) ) ( not ( = ?auto_263703 ?auto_263712 ) ) ( not ( = ?auto_263704 ?auto_263705 ) ) ( not ( = ?auto_263704 ?auto_263706 ) ) ( not ( = ?auto_263704 ?auto_263707 ) ) ( not ( = ?auto_263704 ?auto_263708 ) ) ( not ( = ?auto_263704 ?auto_263709 ) ) ( not ( = ?auto_263704 ?auto_263710 ) ) ( not ( = ?auto_263704 ?auto_263711 ) ) ( not ( = ?auto_263704 ?auto_263712 ) ) ( not ( = ?auto_263705 ?auto_263706 ) ) ( not ( = ?auto_263705 ?auto_263707 ) ) ( not ( = ?auto_263705 ?auto_263708 ) ) ( not ( = ?auto_263705 ?auto_263709 ) ) ( not ( = ?auto_263705 ?auto_263710 ) ) ( not ( = ?auto_263705 ?auto_263711 ) ) ( not ( = ?auto_263705 ?auto_263712 ) ) ( not ( = ?auto_263706 ?auto_263707 ) ) ( not ( = ?auto_263706 ?auto_263708 ) ) ( not ( = ?auto_263706 ?auto_263709 ) ) ( not ( = ?auto_263706 ?auto_263710 ) ) ( not ( = ?auto_263706 ?auto_263711 ) ) ( not ( = ?auto_263706 ?auto_263712 ) ) ( not ( = ?auto_263707 ?auto_263708 ) ) ( not ( = ?auto_263707 ?auto_263709 ) ) ( not ( = ?auto_263707 ?auto_263710 ) ) ( not ( = ?auto_263707 ?auto_263711 ) ) ( not ( = ?auto_263707 ?auto_263712 ) ) ( not ( = ?auto_263708 ?auto_263709 ) ) ( not ( = ?auto_263708 ?auto_263710 ) ) ( not ( = ?auto_263708 ?auto_263711 ) ) ( not ( = ?auto_263708 ?auto_263712 ) ) ( not ( = ?auto_263709 ?auto_263710 ) ) ( not ( = ?auto_263709 ?auto_263711 ) ) ( not ( = ?auto_263709 ?auto_263712 ) ) ( not ( = ?auto_263710 ?auto_263711 ) ) ( not ( = ?auto_263710 ?auto_263712 ) ) ( not ( = ?auto_263711 ?auto_263712 ) ) ( ON ?auto_263710 ?auto_263711 ) ( ON ?auto_263709 ?auto_263710 ) ( ON ?auto_263708 ?auto_263709 ) ( ON ?auto_263707 ?auto_263708 ) ( ON ?auto_263706 ?auto_263707 ) ( ON ?auto_263705 ?auto_263706 ) ( ON ?auto_263704 ?auto_263705 ) ( ON ?auto_263703 ?auto_263704 ) ( ON ?auto_263702 ?auto_263703 ) ( CLEAR ?auto_263700 ) ( ON ?auto_263701 ?auto_263702 ) ( CLEAR ?auto_263701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_263700 ?auto_263701 )
      ( MAKE-12PILE ?auto_263700 ?auto_263701 ?auto_263702 ?auto_263703 ?auto_263704 ?auto_263705 ?auto_263706 ?auto_263707 ?auto_263708 ?auto_263709 ?auto_263710 ?auto_263711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_263750 - BLOCK
      ?auto_263751 - BLOCK
      ?auto_263752 - BLOCK
      ?auto_263753 - BLOCK
      ?auto_263754 - BLOCK
      ?auto_263755 - BLOCK
      ?auto_263756 - BLOCK
      ?auto_263757 - BLOCK
      ?auto_263758 - BLOCK
      ?auto_263759 - BLOCK
      ?auto_263760 - BLOCK
      ?auto_263761 - BLOCK
    )
    :vars
    (
      ?auto_263762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263761 ?auto_263762 ) ( not ( = ?auto_263750 ?auto_263751 ) ) ( not ( = ?auto_263750 ?auto_263752 ) ) ( not ( = ?auto_263750 ?auto_263753 ) ) ( not ( = ?auto_263750 ?auto_263754 ) ) ( not ( = ?auto_263750 ?auto_263755 ) ) ( not ( = ?auto_263750 ?auto_263756 ) ) ( not ( = ?auto_263750 ?auto_263757 ) ) ( not ( = ?auto_263750 ?auto_263758 ) ) ( not ( = ?auto_263750 ?auto_263759 ) ) ( not ( = ?auto_263750 ?auto_263760 ) ) ( not ( = ?auto_263750 ?auto_263761 ) ) ( not ( = ?auto_263750 ?auto_263762 ) ) ( not ( = ?auto_263751 ?auto_263752 ) ) ( not ( = ?auto_263751 ?auto_263753 ) ) ( not ( = ?auto_263751 ?auto_263754 ) ) ( not ( = ?auto_263751 ?auto_263755 ) ) ( not ( = ?auto_263751 ?auto_263756 ) ) ( not ( = ?auto_263751 ?auto_263757 ) ) ( not ( = ?auto_263751 ?auto_263758 ) ) ( not ( = ?auto_263751 ?auto_263759 ) ) ( not ( = ?auto_263751 ?auto_263760 ) ) ( not ( = ?auto_263751 ?auto_263761 ) ) ( not ( = ?auto_263751 ?auto_263762 ) ) ( not ( = ?auto_263752 ?auto_263753 ) ) ( not ( = ?auto_263752 ?auto_263754 ) ) ( not ( = ?auto_263752 ?auto_263755 ) ) ( not ( = ?auto_263752 ?auto_263756 ) ) ( not ( = ?auto_263752 ?auto_263757 ) ) ( not ( = ?auto_263752 ?auto_263758 ) ) ( not ( = ?auto_263752 ?auto_263759 ) ) ( not ( = ?auto_263752 ?auto_263760 ) ) ( not ( = ?auto_263752 ?auto_263761 ) ) ( not ( = ?auto_263752 ?auto_263762 ) ) ( not ( = ?auto_263753 ?auto_263754 ) ) ( not ( = ?auto_263753 ?auto_263755 ) ) ( not ( = ?auto_263753 ?auto_263756 ) ) ( not ( = ?auto_263753 ?auto_263757 ) ) ( not ( = ?auto_263753 ?auto_263758 ) ) ( not ( = ?auto_263753 ?auto_263759 ) ) ( not ( = ?auto_263753 ?auto_263760 ) ) ( not ( = ?auto_263753 ?auto_263761 ) ) ( not ( = ?auto_263753 ?auto_263762 ) ) ( not ( = ?auto_263754 ?auto_263755 ) ) ( not ( = ?auto_263754 ?auto_263756 ) ) ( not ( = ?auto_263754 ?auto_263757 ) ) ( not ( = ?auto_263754 ?auto_263758 ) ) ( not ( = ?auto_263754 ?auto_263759 ) ) ( not ( = ?auto_263754 ?auto_263760 ) ) ( not ( = ?auto_263754 ?auto_263761 ) ) ( not ( = ?auto_263754 ?auto_263762 ) ) ( not ( = ?auto_263755 ?auto_263756 ) ) ( not ( = ?auto_263755 ?auto_263757 ) ) ( not ( = ?auto_263755 ?auto_263758 ) ) ( not ( = ?auto_263755 ?auto_263759 ) ) ( not ( = ?auto_263755 ?auto_263760 ) ) ( not ( = ?auto_263755 ?auto_263761 ) ) ( not ( = ?auto_263755 ?auto_263762 ) ) ( not ( = ?auto_263756 ?auto_263757 ) ) ( not ( = ?auto_263756 ?auto_263758 ) ) ( not ( = ?auto_263756 ?auto_263759 ) ) ( not ( = ?auto_263756 ?auto_263760 ) ) ( not ( = ?auto_263756 ?auto_263761 ) ) ( not ( = ?auto_263756 ?auto_263762 ) ) ( not ( = ?auto_263757 ?auto_263758 ) ) ( not ( = ?auto_263757 ?auto_263759 ) ) ( not ( = ?auto_263757 ?auto_263760 ) ) ( not ( = ?auto_263757 ?auto_263761 ) ) ( not ( = ?auto_263757 ?auto_263762 ) ) ( not ( = ?auto_263758 ?auto_263759 ) ) ( not ( = ?auto_263758 ?auto_263760 ) ) ( not ( = ?auto_263758 ?auto_263761 ) ) ( not ( = ?auto_263758 ?auto_263762 ) ) ( not ( = ?auto_263759 ?auto_263760 ) ) ( not ( = ?auto_263759 ?auto_263761 ) ) ( not ( = ?auto_263759 ?auto_263762 ) ) ( not ( = ?auto_263760 ?auto_263761 ) ) ( not ( = ?auto_263760 ?auto_263762 ) ) ( not ( = ?auto_263761 ?auto_263762 ) ) ( ON ?auto_263760 ?auto_263761 ) ( ON ?auto_263759 ?auto_263760 ) ( ON ?auto_263758 ?auto_263759 ) ( ON ?auto_263757 ?auto_263758 ) ( ON ?auto_263756 ?auto_263757 ) ( ON ?auto_263755 ?auto_263756 ) ( ON ?auto_263754 ?auto_263755 ) ( ON ?auto_263753 ?auto_263754 ) ( ON ?auto_263752 ?auto_263753 ) ( ON ?auto_263751 ?auto_263752 ) ( ON ?auto_263750 ?auto_263751 ) ( CLEAR ?auto_263750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_263750 )
      ( MAKE-12PILE ?auto_263750 ?auto_263751 ?auto_263752 ?auto_263753 ?auto_263754 ?auto_263755 ?auto_263756 ?auto_263757 ?auto_263758 ?auto_263759 ?auto_263760 ?auto_263761 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263801 - BLOCK
      ?auto_263802 - BLOCK
      ?auto_263803 - BLOCK
      ?auto_263804 - BLOCK
      ?auto_263805 - BLOCK
      ?auto_263806 - BLOCK
      ?auto_263807 - BLOCK
      ?auto_263808 - BLOCK
      ?auto_263809 - BLOCK
      ?auto_263810 - BLOCK
      ?auto_263811 - BLOCK
      ?auto_263812 - BLOCK
      ?auto_263813 - BLOCK
    )
    :vars
    (
      ?auto_263814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_263812 ) ( ON ?auto_263813 ?auto_263814 ) ( CLEAR ?auto_263813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_263801 ) ( ON ?auto_263802 ?auto_263801 ) ( ON ?auto_263803 ?auto_263802 ) ( ON ?auto_263804 ?auto_263803 ) ( ON ?auto_263805 ?auto_263804 ) ( ON ?auto_263806 ?auto_263805 ) ( ON ?auto_263807 ?auto_263806 ) ( ON ?auto_263808 ?auto_263807 ) ( ON ?auto_263809 ?auto_263808 ) ( ON ?auto_263810 ?auto_263809 ) ( ON ?auto_263811 ?auto_263810 ) ( ON ?auto_263812 ?auto_263811 ) ( not ( = ?auto_263801 ?auto_263802 ) ) ( not ( = ?auto_263801 ?auto_263803 ) ) ( not ( = ?auto_263801 ?auto_263804 ) ) ( not ( = ?auto_263801 ?auto_263805 ) ) ( not ( = ?auto_263801 ?auto_263806 ) ) ( not ( = ?auto_263801 ?auto_263807 ) ) ( not ( = ?auto_263801 ?auto_263808 ) ) ( not ( = ?auto_263801 ?auto_263809 ) ) ( not ( = ?auto_263801 ?auto_263810 ) ) ( not ( = ?auto_263801 ?auto_263811 ) ) ( not ( = ?auto_263801 ?auto_263812 ) ) ( not ( = ?auto_263801 ?auto_263813 ) ) ( not ( = ?auto_263801 ?auto_263814 ) ) ( not ( = ?auto_263802 ?auto_263803 ) ) ( not ( = ?auto_263802 ?auto_263804 ) ) ( not ( = ?auto_263802 ?auto_263805 ) ) ( not ( = ?auto_263802 ?auto_263806 ) ) ( not ( = ?auto_263802 ?auto_263807 ) ) ( not ( = ?auto_263802 ?auto_263808 ) ) ( not ( = ?auto_263802 ?auto_263809 ) ) ( not ( = ?auto_263802 ?auto_263810 ) ) ( not ( = ?auto_263802 ?auto_263811 ) ) ( not ( = ?auto_263802 ?auto_263812 ) ) ( not ( = ?auto_263802 ?auto_263813 ) ) ( not ( = ?auto_263802 ?auto_263814 ) ) ( not ( = ?auto_263803 ?auto_263804 ) ) ( not ( = ?auto_263803 ?auto_263805 ) ) ( not ( = ?auto_263803 ?auto_263806 ) ) ( not ( = ?auto_263803 ?auto_263807 ) ) ( not ( = ?auto_263803 ?auto_263808 ) ) ( not ( = ?auto_263803 ?auto_263809 ) ) ( not ( = ?auto_263803 ?auto_263810 ) ) ( not ( = ?auto_263803 ?auto_263811 ) ) ( not ( = ?auto_263803 ?auto_263812 ) ) ( not ( = ?auto_263803 ?auto_263813 ) ) ( not ( = ?auto_263803 ?auto_263814 ) ) ( not ( = ?auto_263804 ?auto_263805 ) ) ( not ( = ?auto_263804 ?auto_263806 ) ) ( not ( = ?auto_263804 ?auto_263807 ) ) ( not ( = ?auto_263804 ?auto_263808 ) ) ( not ( = ?auto_263804 ?auto_263809 ) ) ( not ( = ?auto_263804 ?auto_263810 ) ) ( not ( = ?auto_263804 ?auto_263811 ) ) ( not ( = ?auto_263804 ?auto_263812 ) ) ( not ( = ?auto_263804 ?auto_263813 ) ) ( not ( = ?auto_263804 ?auto_263814 ) ) ( not ( = ?auto_263805 ?auto_263806 ) ) ( not ( = ?auto_263805 ?auto_263807 ) ) ( not ( = ?auto_263805 ?auto_263808 ) ) ( not ( = ?auto_263805 ?auto_263809 ) ) ( not ( = ?auto_263805 ?auto_263810 ) ) ( not ( = ?auto_263805 ?auto_263811 ) ) ( not ( = ?auto_263805 ?auto_263812 ) ) ( not ( = ?auto_263805 ?auto_263813 ) ) ( not ( = ?auto_263805 ?auto_263814 ) ) ( not ( = ?auto_263806 ?auto_263807 ) ) ( not ( = ?auto_263806 ?auto_263808 ) ) ( not ( = ?auto_263806 ?auto_263809 ) ) ( not ( = ?auto_263806 ?auto_263810 ) ) ( not ( = ?auto_263806 ?auto_263811 ) ) ( not ( = ?auto_263806 ?auto_263812 ) ) ( not ( = ?auto_263806 ?auto_263813 ) ) ( not ( = ?auto_263806 ?auto_263814 ) ) ( not ( = ?auto_263807 ?auto_263808 ) ) ( not ( = ?auto_263807 ?auto_263809 ) ) ( not ( = ?auto_263807 ?auto_263810 ) ) ( not ( = ?auto_263807 ?auto_263811 ) ) ( not ( = ?auto_263807 ?auto_263812 ) ) ( not ( = ?auto_263807 ?auto_263813 ) ) ( not ( = ?auto_263807 ?auto_263814 ) ) ( not ( = ?auto_263808 ?auto_263809 ) ) ( not ( = ?auto_263808 ?auto_263810 ) ) ( not ( = ?auto_263808 ?auto_263811 ) ) ( not ( = ?auto_263808 ?auto_263812 ) ) ( not ( = ?auto_263808 ?auto_263813 ) ) ( not ( = ?auto_263808 ?auto_263814 ) ) ( not ( = ?auto_263809 ?auto_263810 ) ) ( not ( = ?auto_263809 ?auto_263811 ) ) ( not ( = ?auto_263809 ?auto_263812 ) ) ( not ( = ?auto_263809 ?auto_263813 ) ) ( not ( = ?auto_263809 ?auto_263814 ) ) ( not ( = ?auto_263810 ?auto_263811 ) ) ( not ( = ?auto_263810 ?auto_263812 ) ) ( not ( = ?auto_263810 ?auto_263813 ) ) ( not ( = ?auto_263810 ?auto_263814 ) ) ( not ( = ?auto_263811 ?auto_263812 ) ) ( not ( = ?auto_263811 ?auto_263813 ) ) ( not ( = ?auto_263811 ?auto_263814 ) ) ( not ( = ?auto_263812 ?auto_263813 ) ) ( not ( = ?auto_263812 ?auto_263814 ) ) ( not ( = ?auto_263813 ?auto_263814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_263813 ?auto_263814 )
      ( !STACK ?auto_263813 ?auto_263812 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263828 - BLOCK
      ?auto_263829 - BLOCK
      ?auto_263830 - BLOCK
      ?auto_263831 - BLOCK
      ?auto_263832 - BLOCK
      ?auto_263833 - BLOCK
      ?auto_263834 - BLOCK
      ?auto_263835 - BLOCK
      ?auto_263836 - BLOCK
      ?auto_263837 - BLOCK
      ?auto_263838 - BLOCK
      ?auto_263839 - BLOCK
      ?auto_263840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_263839 ) ( ON-TABLE ?auto_263840 ) ( CLEAR ?auto_263840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_263828 ) ( ON ?auto_263829 ?auto_263828 ) ( ON ?auto_263830 ?auto_263829 ) ( ON ?auto_263831 ?auto_263830 ) ( ON ?auto_263832 ?auto_263831 ) ( ON ?auto_263833 ?auto_263832 ) ( ON ?auto_263834 ?auto_263833 ) ( ON ?auto_263835 ?auto_263834 ) ( ON ?auto_263836 ?auto_263835 ) ( ON ?auto_263837 ?auto_263836 ) ( ON ?auto_263838 ?auto_263837 ) ( ON ?auto_263839 ?auto_263838 ) ( not ( = ?auto_263828 ?auto_263829 ) ) ( not ( = ?auto_263828 ?auto_263830 ) ) ( not ( = ?auto_263828 ?auto_263831 ) ) ( not ( = ?auto_263828 ?auto_263832 ) ) ( not ( = ?auto_263828 ?auto_263833 ) ) ( not ( = ?auto_263828 ?auto_263834 ) ) ( not ( = ?auto_263828 ?auto_263835 ) ) ( not ( = ?auto_263828 ?auto_263836 ) ) ( not ( = ?auto_263828 ?auto_263837 ) ) ( not ( = ?auto_263828 ?auto_263838 ) ) ( not ( = ?auto_263828 ?auto_263839 ) ) ( not ( = ?auto_263828 ?auto_263840 ) ) ( not ( = ?auto_263829 ?auto_263830 ) ) ( not ( = ?auto_263829 ?auto_263831 ) ) ( not ( = ?auto_263829 ?auto_263832 ) ) ( not ( = ?auto_263829 ?auto_263833 ) ) ( not ( = ?auto_263829 ?auto_263834 ) ) ( not ( = ?auto_263829 ?auto_263835 ) ) ( not ( = ?auto_263829 ?auto_263836 ) ) ( not ( = ?auto_263829 ?auto_263837 ) ) ( not ( = ?auto_263829 ?auto_263838 ) ) ( not ( = ?auto_263829 ?auto_263839 ) ) ( not ( = ?auto_263829 ?auto_263840 ) ) ( not ( = ?auto_263830 ?auto_263831 ) ) ( not ( = ?auto_263830 ?auto_263832 ) ) ( not ( = ?auto_263830 ?auto_263833 ) ) ( not ( = ?auto_263830 ?auto_263834 ) ) ( not ( = ?auto_263830 ?auto_263835 ) ) ( not ( = ?auto_263830 ?auto_263836 ) ) ( not ( = ?auto_263830 ?auto_263837 ) ) ( not ( = ?auto_263830 ?auto_263838 ) ) ( not ( = ?auto_263830 ?auto_263839 ) ) ( not ( = ?auto_263830 ?auto_263840 ) ) ( not ( = ?auto_263831 ?auto_263832 ) ) ( not ( = ?auto_263831 ?auto_263833 ) ) ( not ( = ?auto_263831 ?auto_263834 ) ) ( not ( = ?auto_263831 ?auto_263835 ) ) ( not ( = ?auto_263831 ?auto_263836 ) ) ( not ( = ?auto_263831 ?auto_263837 ) ) ( not ( = ?auto_263831 ?auto_263838 ) ) ( not ( = ?auto_263831 ?auto_263839 ) ) ( not ( = ?auto_263831 ?auto_263840 ) ) ( not ( = ?auto_263832 ?auto_263833 ) ) ( not ( = ?auto_263832 ?auto_263834 ) ) ( not ( = ?auto_263832 ?auto_263835 ) ) ( not ( = ?auto_263832 ?auto_263836 ) ) ( not ( = ?auto_263832 ?auto_263837 ) ) ( not ( = ?auto_263832 ?auto_263838 ) ) ( not ( = ?auto_263832 ?auto_263839 ) ) ( not ( = ?auto_263832 ?auto_263840 ) ) ( not ( = ?auto_263833 ?auto_263834 ) ) ( not ( = ?auto_263833 ?auto_263835 ) ) ( not ( = ?auto_263833 ?auto_263836 ) ) ( not ( = ?auto_263833 ?auto_263837 ) ) ( not ( = ?auto_263833 ?auto_263838 ) ) ( not ( = ?auto_263833 ?auto_263839 ) ) ( not ( = ?auto_263833 ?auto_263840 ) ) ( not ( = ?auto_263834 ?auto_263835 ) ) ( not ( = ?auto_263834 ?auto_263836 ) ) ( not ( = ?auto_263834 ?auto_263837 ) ) ( not ( = ?auto_263834 ?auto_263838 ) ) ( not ( = ?auto_263834 ?auto_263839 ) ) ( not ( = ?auto_263834 ?auto_263840 ) ) ( not ( = ?auto_263835 ?auto_263836 ) ) ( not ( = ?auto_263835 ?auto_263837 ) ) ( not ( = ?auto_263835 ?auto_263838 ) ) ( not ( = ?auto_263835 ?auto_263839 ) ) ( not ( = ?auto_263835 ?auto_263840 ) ) ( not ( = ?auto_263836 ?auto_263837 ) ) ( not ( = ?auto_263836 ?auto_263838 ) ) ( not ( = ?auto_263836 ?auto_263839 ) ) ( not ( = ?auto_263836 ?auto_263840 ) ) ( not ( = ?auto_263837 ?auto_263838 ) ) ( not ( = ?auto_263837 ?auto_263839 ) ) ( not ( = ?auto_263837 ?auto_263840 ) ) ( not ( = ?auto_263838 ?auto_263839 ) ) ( not ( = ?auto_263838 ?auto_263840 ) ) ( not ( = ?auto_263839 ?auto_263840 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_263840 )
      ( !STACK ?auto_263840 ?auto_263839 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263854 - BLOCK
      ?auto_263855 - BLOCK
      ?auto_263856 - BLOCK
      ?auto_263857 - BLOCK
      ?auto_263858 - BLOCK
      ?auto_263859 - BLOCK
      ?auto_263860 - BLOCK
      ?auto_263861 - BLOCK
      ?auto_263862 - BLOCK
      ?auto_263863 - BLOCK
      ?auto_263864 - BLOCK
      ?auto_263865 - BLOCK
      ?auto_263866 - BLOCK
    )
    :vars
    (
      ?auto_263867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263866 ?auto_263867 ) ( ON-TABLE ?auto_263854 ) ( ON ?auto_263855 ?auto_263854 ) ( ON ?auto_263856 ?auto_263855 ) ( ON ?auto_263857 ?auto_263856 ) ( ON ?auto_263858 ?auto_263857 ) ( ON ?auto_263859 ?auto_263858 ) ( ON ?auto_263860 ?auto_263859 ) ( ON ?auto_263861 ?auto_263860 ) ( ON ?auto_263862 ?auto_263861 ) ( ON ?auto_263863 ?auto_263862 ) ( ON ?auto_263864 ?auto_263863 ) ( not ( = ?auto_263854 ?auto_263855 ) ) ( not ( = ?auto_263854 ?auto_263856 ) ) ( not ( = ?auto_263854 ?auto_263857 ) ) ( not ( = ?auto_263854 ?auto_263858 ) ) ( not ( = ?auto_263854 ?auto_263859 ) ) ( not ( = ?auto_263854 ?auto_263860 ) ) ( not ( = ?auto_263854 ?auto_263861 ) ) ( not ( = ?auto_263854 ?auto_263862 ) ) ( not ( = ?auto_263854 ?auto_263863 ) ) ( not ( = ?auto_263854 ?auto_263864 ) ) ( not ( = ?auto_263854 ?auto_263865 ) ) ( not ( = ?auto_263854 ?auto_263866 ) ) ( not ( = ?auto_263854 ?auto_263867 ) ) ( not ( = ?auto_263855 ?auto_263856 ) ) ( not ( = ?auto_263855 ?auto_263857 ) ) ( not ( = ?auto_263855 ?auto_263858 ) ) ( not ( = ?auto_263855 ?auto_263859 ) ) ( not ( = ?auto_263855 ?auto_263860 ) ) ( not ( = ?auto_263855 ?auto_263861 ) ) ( not ( = ?auto_263855 ?auto_263862 ) ) ( not ( = ?auto_263855 ?auto_263863 ) ) ( not ( = ?auto_263855 ?auto_263864 ) ) ( not ( = ?auto_263855 ?auto_263865 ) ) ( not ( = ?auto_263855 ?auto_263866 ) ) ( not ( = ?auto_263855 ?auto_263867 ) ) ( not ( = ?auto_263856 ?auto_263857 ) ) ( not ( = ?auto_263856 ?auto_263858 ) ) ( not ( = ?auto_263856 ?auto_263859 ) ) ( not ( = ?auto_263856 ?auto_263860 ) ) ( not ( = ?auto_263856 ?auto_263861 ) ) ( not ( = ?auto_263856 ?auto_263862 ) ) ( not ( = ?auto_263856 ?auto_263863 ) ) ( not ( = ?auto_263856 ?auto_263864 ) ) ( not ( = ?auto_263856 ?auto_263865 ) ) ( not ( = ?auto_263856 ?auto_263866 ) ) ( not ( = ?auto_263856 ?auto_263867 ) ) ( not ( = ?auto_263857 ?auto_263858 ) ) ( not ( = ?auto_263857 ?auto_263859 ) ) ( not ( = ?auto_263857 ?auto_263860 ) ) ( not ( = ?auto_263857 ?auto_263861 ) ) ( not ( = ?auto_263857 ?auto_263862 ) ) ( not ( = ?auto_263857 ?auto_263863 ) ) ( not ( = ?auto_263857 ?auto_263864 ) ) ( not ( = ?auto_263857 ?auto_263865 ) ) ( not ( = ?auto_263857 ?auto_263866 ) ) ( not ( = ?auto_263857 ?auto_263867 ) ) ( not ( = ?auto_263858 ?auto_263859 ) ) ( not ( = ?auto_263858 ?auto_263860 ) ) ( not ( = ?auto_263858 ?auto_263861 ) ) ( not ( = ?auto_263858 ?auto_263862 ) ) ( not ( = ?auto_263858 ?auto_263863 ) ) ( not ( = ?auto_263858 ?auto_263864 ) ) ( not ( = ?auto_263858 ?auto_263865 ) ) ( not ( = ?auto_263858 ?auto_263866 ) ) ( not ( = ?auto_263858 ?auto_263867 ) ) ( not ( = ?auto_263859 ?auto_263860 ) ) ( not ( = ?auto_263859 ?auto_263861 ) ) ( not ( = ?auto_263859 ?auto_263862 ) ) ( not ( = ?auto_263859 ?auto_263863 ) ) ( not ( = ?auto_263859 ?auto_263864 ) ) ( not ( = ?auto_263859 ?auto_263865 ) ) ( not ( = ?auto_263859 ?auto_263866 ) ) ( not ( = ?auto_263859 ?auto_263867 ) ) ( not ( = ?auto_263860 ?auto_263861 ) ) ( not ( = ?auto_263860 ?auto_263862 ) ) ( not ( = ?auto_263860 ?auto_263863 ) ) ( not ( = ?auto_263860 ?auto_263864 ) ) ( not ( = ?auto_263860 ?auto_263865 ) ) ( not ( = ?auto_263860 ?auto_263866 ) ) ( not ( = ?auto_263860 ?auto_263867 ) ) ( not ( = ?auto_263861 ?auto_263862 ) ) ( not ( = ?auto_263861 ?auto_263863 ) ) ( not ( = ?auto_263861 ?auto_263864 ) ) ( not ( = ?auto_263861 ?auto_263865 ) ) ( not ( = ?auto_263861 ?auto_263866 ) ) ( not ( = ?auto_263861 ?auto_263867 ) ) ( not ( = ?auto_263862 ?auto_263863 ) ) ( not ( = ?auto_263862 ?auto_263864 ) ) ( not ( = ?auto_263862 ?auto_263865 ) ) ( not ( = ?auto_263862 ?auto_263866 ) ) ( not ( = ?auto_263862 ?auto_263867 ) ) ( not ( = ?auto_263863 ?auto_263864 ) ) ( not ( = ?auto_263863 ?auto_263865 ) ) ( not ( = ?auto_263863 ?auto_263866 ) ) ( not ( = ?auto_263863 ?auto_263867 ) ) ( not ( = ?auto_263864 ?auto_263865 ) ) ( not ( = ?auto_263864 ?auto_263866 ) ) ( not ( = ?auto_263864 ?auto_263867 ) ) ( not ( = ?auto_263865 ?auto_263866 ) ) ( not ( = ?auto_263865 ?auto_263867 ) ) ( not ( = ?auto_263866 ?auto_263867 ) ) ( CLEAR ?auto_263864 ) ( ON ?auto_263865 ?auto_263866 ) ( CLEAR ?auto_263865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_263854 ?auto_263855 ?auto_263856 ?auto_263857 ?auto_263858 ?auto_263859 ?auto_263860 ?auto_263861 ?auto_263862 ?auto_263863 ?auto_263864 ?auto_263865 )
      ( MAKE-13PILE ?auto_263854 ?auto_263855 ?auto_263856 ?auto_263857 ?auto_263858 ?auto_263859 ?auto_263860 ?auto_263861 ?auto_263862 ?auto_263863 ?auto_263864 ?auto_263865 ?auto_263866 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263881 - BLOCK
      ?auto_263882 - BLOCK
      ?auto_263883 - BLOCK
      ?auto_263884 - BLOCK
      ?auto_263885 - BLOCK
      ?auto_263886 - BLOCK
      ?auto_263887 - BLOCK
      ?auto_263888 - BLOCK
      ?auto_263889 - BLOCK
      ?auto_263890 - BLOCK
      ?auto_263891 - BLOCK
      ?auto_263892 - BLOCK
      ?auto_263893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_263893 ) ( ON-TABLE ?auto_263881 ) ( ON ?auto_263882 ?auto_263881 ) ( ON ?auto_263883 ?auto_263882 ) ( ON ?auto_263884 ?auto_263883 ) ( ON ?auto_263885 ?auto_263884 ) ( ON ?auto_263886 ?auto_263885 ) ( ON ?auto_263887 ?auto_263886 ) ( ON ?auto_263888 ?auto_263887 ) ( ON ?auto_263889 ?auto_263888 ) ( ON ?auto_263890 ?auto_263889 ) ( ON ?auto_263891 ?auto_263890 ) ( not ( = ?auto_263881 ?auto_263882 ) ) ( not ( = ?auto_263881 ?auto_263883 ) ) ( not ( = ?auto_263881 ?auto_263884 ) ) ( not ( = ?auto_263881 ?auto_263885 ) ) ( not ( = ?auto_263881 ?auto_263886 ) ) ( not ( = ?auto_263881 ?auto_263887 ) ) ( not ( = ?auto_263881 ?auto_263888 ) ) ( not ( = ?auto_263881 ?auto_263889 ) ) ( not ( = ?auto_263881 ?auto_263890 ) ) ( not ( = ?auto_263881 ?auto_263891 ) ) ( not ( = ?auto_263881 ?auto_263892 ) ) ( not ( = ?auto_263881 ?auto_263893 ) ) ( not ( = ?auto_263882 ?auto_263883 ) ) ( not ( = ?auto_263882 ?auto_263884 ) ) ( not ( = ?auto_263882 ?auto_263885 ) ) ( not ( = ?auto_263882 ?auto_263886 ) ) ( not ( = ?auto_263882 ?auto_263887 ) ) ( not ( = ?auto_263882 ?auto_263888 ) ) ( not ( = ?auto_263882 ?auto_263889 ) ) ( not ( = ?auto_263882 ?auto_263890 ) ) ( not ( = ?auto_263882 ?auto_263891 ) ) ( not ( = ?auto_263882 ?auto_263892 ) ) ( not ( = ?auto_263882 ?auto_263893 ) ) ( not ( = ?auto_263883 ?auto_263884 ) ) ( not ( = ?auto_263883 ?auto_263885 ) ) ( not ( = ?auto_263883 ?auto_263886 ) ) ( not ( = ?auto_263883 ?auto_263887 ) ) ( not ( = ?auto_263883 ?auto_263888 ) ) ( not ( = ?auto_263883 ?auto_263889 ) ) ( not ( = ?auto_263883 ?auto_263890 ) ) ( not ( = ?auto_263883 ?auto_263891 ) ) ( not ( = ?auto_263883 ?auto_263892 ) ) ( not ( = ?auto_263883 ?auto_263893 ) ) ( not ( = ?auto_263884 ?auto_263885 ) ) ( not ( = ?auto_263884 ?auto_263886 ) ) ( not ( = ?auto_263884 ?auto_263887 ) ) ( not ( = ?auto_263884 ?auto_263888 ) ) ( not ( = ?auto_263884 ?auto_263889 ) ) ( not ( = ?auto_263884 ?auto_263890 ) ) ( not ( = ?auto_263884 ?auto_263891 ) ) ( not ( = ?auto_263884 ?auto_263892 ) ) ( not ( = ?auto_263884 ?auto_263893 ) ) ( not ( = ?auto_263885 ?auto_263886 ) ) ( not ( = ?auto_263885 ?auto_263887 ) ) ( not ( = ?auto_263885 ?auto_263888 ) ) ( not ( = ?auto_263885 ?auto_263889 ) ) ( not ( = ?auto_263885 ?auto_263890 ) ) ( not ( = ?auto_263885 ?auto_263891 ) ) ( not ( = ?auto_263885 ?auto_263892 ) ) ( not ( = ?auto_263885 ?auto_263893 ) ) ( not ( = ?auto_263886 ?auto_263887 ) ) ( not ( = ?auto_263886 ?auto_263888 ) ) ( not ( = ?auto_263886 ?auto_263889 ) ) ( not ( = ?auto_263886 ?auto_263890 ) ) ( not ( = ?auto_263886 ?auto_263891 ) ) ( not ( = ?auto_263886 ?auto_263892 ) ) ( not ( = ?auto_263886 ?auto_263893 ) ) ( not ( = ?auto_263887 ?auto_263888 ) ) ( not ( = ?auto_263887 ?auto_263889 ) ) ( not ( = ?auto_263887 ?auto_263890 ) ) ( not ( = ?auto_263887 ?auto_263891 ) ) ( not ( = ?auto_263887 ?auto_263892 ) ) ( not ( = ?auto_263887 ?auto_263893 ) ) ( not ( = ?auto_263888 ?auto_263889 ) ) ( not ( = ?auto_263888 ?auto_263890 ) ) ( not ( = ?auto_263888 ?auto_263891 ) ) ( not ( = ?auto_263888 ?auto_263892 ) ) ( not ( = ?auto_263888 ?auto_263893 ) ) ( not ( = ?auto_263889 ?auto_263890 ) ) ( not ( = ?auto_263889 ?auto_263891 ) ) ( not ( = ?auto_263889 ?auto_263892 ) ) ( not ( = ?auto_263889 ?auto_263893 ) ) ( not ( = ?auto_263890 ?auto_263891 ) ) ( not ( = ?auto_263890 ?auto_263892 ) ) ( not ( = ?auto_263890 ?auto_263893 ) ) ( not ( = ?auto_263891 ?auto_263892 ) ) ( not ( = ?auto_263891 ?auto_263893 ) ) ( not ( = ?auto_263892 ?auto_263893 ) ) ( CLEAR ?auto_263891 ) ( ON ?auto_263892 ?auto_263893 ) ( CLEAR ?auto_263892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_263881 ?auto_263882 ?auto_263883 ?auto_263884 ?auto_263885 ?auto_263886 ?auto_263887 ?auto_263888 ?auto_263889 ?auto_263890 ?auto_263891 ?auto_263892 )
      ( MAKE-13PILE ?auto_263881 ?auto_263882 ?auto_263883 ?auto_263884 ?auto_263885 ?auto_263886 ?auto_263887 ?auto_263888 ?auto_263889 ?auto_263890 ?auto_263891 ?auto_263892 ?auto_263893 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263907 - BLOCK
      ?auto_263908 - BLOCK
      ?auto_263909 - BLOCK
      ?auto_263910 - BLOCK
      ?auto_263911 - BLOCK
      ?auto_263912 - BLOCK
      ?auto_263913 - BLOCK
      ?auto_263914 - BLOCK
      ?auto_263915 - BLOCK
      ?auto_263916 - BLOCK
      ?auto_263917 - BLOCK
      ?auto_263918 - BLOCK
      ?auto_263919 - BLOCK
    )
    :vars
    (
      ?auto_263920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263919 ?auto_263920 ) ( ON-TABLE ?auto_263907 ) ( ON ?auto_263908 ?auto_263907 ) ( ON ?auto_263909 ?auto_263908 ) ( ON ?auto_263910 ?auto_263909 ) ( ON ?auto_263911 ?auto_263910 ) ( ON ?auto_263912 ?auto_263911 ) ( ON ?auto_263913 ?auto_263912 ) ( ON ?auto_263914 ?auto_263913 ) ( ON ?auto_263915 ?auto_263914 ) ( ON ?auto_263916 ?auto_263915 ) ( not ( = ?auto_263907 ?auto_263908 ) ) ( not ( = ?auto_263907 ?auto_263909 ) ) ( not ( = ?auto_263907 ?auto_263910 ) ) ( not ( = ?auto_263907 ?auto_263911 ) ) ( not ( = ?auto_263907 ?auto_263912 ) ) ( not ( = ?auto_263907 ?auto_263913 ) ) ( not ( = ?auto_263907 ?auto_263914 ) ) ( not ( = ?auto_263907 ?auto_263915 ) ) ( not ( = ?auto_263907 ?auto_263916 ) ) ( not ( = ?auto_263907 ?auto_263917 ) ) ( not ( = ?auto_263907 ?auto_263918 ) ) ( not ( = ?auto_263907 ?auto_263919 ) ) ( not ( = ?auto_263907 ?auto_263920 ) ) ( not ( = ?auto_263908 ?auto_263909 ) ) ( not ( = ?auto_263908 ?auto_263910 ) ) ( not ( = ?auto_263908 ?auto_263911 ) ) ( not ( = ?auto_263908 ?auto_263912 ) ) ( not ( = ?auto_263908 ?auto_263913 ) ) ( not ( = ?auto_263908 ?auto_263914 ) ) ( not ( = ?auto_263908 ?auto_263915 ) ) ( not ( = ?auto_263908 ?auto_263916 ) ) ( not ( = ?auto_263908 ?auto_263917 ) ) ( not ( = ?auto_263908 ?auto_263918 ) ) ( not ( = ?auto_263908 ?auto_263919 ) ) ( not ( = ?auto_263908 ?auto_263920 ) ) ( not ( = ?auto_263909 ?auto_263910 ) ) ( not ( = ?auto_263909 ?auto_263911 ) ) ( not ( = ?auto_263909 ?auto_263912 ) ) ( not ( = ?auto_263909 ?auto_263913 ) ) ( not ( = ?auto_263909 ?auto_263914 ) ) ( not ( = ?auto_263909 ?auto_263915 ) ) ( not ( = ?auto_263909 ?auto_263916 ) ) ( not ( = ?auto_263909 ?auto_263917 ) ) ( not ( = ?auto_263909 ?auto_263918 ) ) ( not ( = ?auto_263909 ?auto_263919 ) ) ( not ( = ?auto_263909 ?auto_263920 ) ) ( not ( = ?auto_263910 ?auto_263911 ) ) ( not ( = ?auto_263910 ?auto_263912 ) ) ( not ( = ?auto_263910 ?auto_263913 ) ) ( not ( = ?auto_263910 ?auto_263914 ) ) ( not ( = ?auto_263910 ?auto_263915 ) ) ( not ( = ?auto_263910 ?auto_263916 ) ) ( not ( = ?auto_263910 ?auto_263917 ) ) ( not ( = ?auto_263910 ?auto_263918 ) ) ( not ( = ?auto_263910 ?auto_263919 ) ) ( not ( = ?auto_263910 ?auto_263920 ) ) ( not ( = ?auto_263911 ?auto_263912 ) ) ( not ( = ?auto_263911 ?auto_263913 ) ) ( not ( = ?auto_263911 ?auto_263914 ) ) ( not ( = ?auto_263911 ?auto_263915 ) ) ( not ( = ?auto_263911 ?auto_263916 ) ) ( not ( = ?auto_263911 ?auto_263917 ) ) ( not ( = ?auto_263911 ?auto_263918 ) ) ( not ( = ?auto_263911 ?auto_263919 ) ) ( not ( = ?auto_263911 ?auto_263920 ) ) ( not ( = ?auto_263912 ?auto_263913 ) ) ( not ( = ?auto_263912 ?auto_263914 ) ) ( not ( = ?auto_263912 ?auto_263915 ) ) ( not ( = ?auto_263912 ?auto_263916 ) ) ( not ( = ?auto_263912 ?auto_263917 ) ) ( not ( = ?auto_263912 ?auto_263918 ) ) ( not ( = ?auto_263912 ?auto_263919 ) ) ( not ( = ?auto_263912 ?auto_263920 ) ) ( not ( = ?auto_263913 ?auto_263914 ) ) ( not ( = ?auto_263913 ?auto_263915 ) ) ( not ( = ?auto_263913 ?auto_263916 ) ) ( not ( = ?auto_263913 ?auto_263917 ) ) ( not ( = ?auto_263913 ?auto_263918 ) ) ( not ( = ?auto_263913 ?auto_263919 ) ) ( not ( = ?auto_263913 ?auto_263920 ) ) ( not ( = ?auto_263914 ?auto_263915 ) ) ( not ( = ?auto_263914 ?auto_263916 ) ) ( not ( = ?auto_263914 ?auto_263917 ) ) ( not ( = ?auto_263914 ?auto_263918 ) ) ( not ( = ?auto_263914 ?auto_263919 ) ) ( not ( = ?auto_263914 ?auto_263920 ) ) ( not ( = ?auto_263915 ?auto_263916 ) ) ( not ( = ?auto_263915 ?auto_263917 ) ) ( not ( = ?auto_263915 ?auto_263918 ) ) ( not ( = ?auto_263915 ?auto_263919 ) ) ( not ( = ?auto_263915 ?auto_263920 ) ) ( not ( = ?auto_263916 ?auto_263917 ) ) ( not ( = ?auto_263916 ?auto_263918 ) ) ( not ( = ?auto_263916 ?auto_263919 ) ) ( not ( = ?auto_263916 ?auto_263920 ) ) ( not ( = ?auto_263917 ?auto_263918 ) ) ( not ( = ?auto_263917 ?auto_263919 ) ) ( not ( = ?auto_263917 ?auto_263920 ) ) ( not ( = ?auto_263918 ?auto_263919 ) ) ( not ( = ?auto_263918 ?auto_263920 ) ) ( not ( = ?auto_263919 ?auto_263920 ) ) ( ON ?auto_263918 ?auto_263919 ) ( CLEAR ?auto_263916 ) ( ON ?auto_263917 ?auto_263918 ) ( CLEAR ?auto_263917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_263907 ?auto_263908 ?auto_263909 ?auto_263910 ?auto_263911 ?auto_263912 ?auto_263913 ?auto_263914 ?auto_263915 ?auto_263916 ?auto_263917 )
      ( MAKE-13PILE ?auto_263907 ?auto_263908 ?auto_263909 ?auto_263910 ?auto_263911 ?auto_263912 ?auto_263913 ?auto_263914 ?auto_263915 ?auto_263916 ?auto_263917 ?auto_263918 ?auto_263919 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263934 - BLOCK
      ?auto_263935 - BLOCK
      ?auto_263936 - BLOCK
      ?auto_263937 - BLOCK
      ?auto_263938 - BLOCK
      ?auto_263939 - BLOCK
      ?auto_263940 - BLOCK
      ?auto_263941 - BLOCK
      ?auto_263942 - BLOCK
      ?auto_263943 - BLOCK
      ?auto_263944 - BLOCK
      ?auto_263945 - BLOCK
      ?auto_263946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_263946 ) ( ON-TABLE ?auto_263934 ) ( ON ?auto_263935 ?auto_263934 ) ( ON ?auto_263936 ?auto_263935 ) ( ON ?auto_263937 ?auto_263936 ) ( ON ?auto_263938 ?auto_263937 ) ( ON ?auto_263939 ?auto_263938 ) ( ON ?auto_263940 ?auto_263939 ) ( ON ?auto_263941 ?auto_263940 ) ( ON ?auto_263942 ?auto_263941 ) ( ON ?auto_263943 ?auto_263942 ) ( not ( = ?auto_263934 ?auto_263935 ) ) ( not ( = ?auto_263934 ?auto_263936 ) ) ( not ( = ?auto_263934 ?auto_263937 ) ) ( not ( = ?auto_263934 ?auto_263938 ) ) ( not ( = ?auto_263934 ?auto_263939 ) ) ( not ( = ?auto_263934 ?auto_263940 ) ) ( not ( = ?auto_263934 ?auto_263941 ) ) ( not ( = ?auto_263934 ?auto_263942 ) ) ( not ( = ?auto_263934 ?auto_263943 ) ) ( not ( = ?auto_263934 ?auto_263944 ) ) ( not ( = ?auto_263934 ?auto_263945 ) ) ( not ( = ?auto_263934 ?auto_263946 ) ) ( not ( = ?auto_263935 ?auto_263936 ) ) ( not ( = ?auto_263935 ?auto_263937 ) ) ( not ( = ?auto_263935 ?auto_263938 ) ) ( not ( = ?auto_263935 ?auto_263939 ) ) ( not ( = ?auto_263935 ?auto_263940 ) ) ( not ( = ?auto_263935 ?auto_263941 ) ) ( not ( = ?auto_263935 ?auto_263942 ) ) ( not ( = ?auto_263935 ?auto_263943 ) ) ( not ( = ?auto_263935 ?auto_263944 ) ) ( not ( = ?auto_263935 ?auto_263945 ) ) ( not ( = ?auto_263935 ?auto_263946 ) ) ( not ( = ?auto_263936 ?auto_263937 ) ) ( not ( = ?auto_263936 ?auto_263938 ) ) ( not ( = ?auto_263936 ?auto_263939 ) ) ( not ( = ?auto_263936 ?auto_263940 ) ) ( not ( = ?auto_263936 ?auto_263941 ) ) ( not ( = ?auto_263936 ?auto_263942 ) ) ( not ( = ?auto_263936 ?auto_263943 ) ) ( not ( = ?auto_263936 ?auto_263944 ) ) ( not ( = ?auto_263936 ?auto_263945 ) ) ( not ( = ?auto_263936 ?auto_263946 ) ) ( not ( = ?auto_263937 ?auto_263938 ) ) ( not ( = ?auto_263937 ?auto_263939 ) ) ( not ( = ?auto_263937 ?auto_263940 ) ) ( not ( = ?auto_263937 ?auto_263941 ) ) ( not ( = ?auto_263937 ?auto_263942 ) ) ( not ( = ?auto_263937 ?auto_263943 ) ) ( not ( = ?auto_263937 ?auto_263944 ) ) ( not ( = ?auto_263937 ?auto_263945 ) ) ( not ( = ?auto_263937 ?auto_263946 ) ) ( not ( = ?auto_263938 ?auto_263939 ) ) ( not ( = ?auto_263938 ?auto_263940 ) ) ( not ( = ?auto_263938 ?auto_263941 ) ) ( not ( = ?auto_263938 ?auto_263942 ) ) ( not ( = ?auto_263938 ?auto_263943 ) ) ( not ( = ?auto_263938 ?auto_263944 ) ) ( not ( = ?auto_263938 ?auto_263945 ) ) ( not ( = ?auto_263938 ?auto_263946 ) ) ( not ( = ?auto_263939 ?auto_263940 ) ) ( not ( = ?auto_263939 ?auto_263941 ) ) ( not ( = ?auto_263939 ?auto_263942 ) ) ( not ( = ?auto_263939 ?auto_263943 ) ) ( not ( = ?auto_263939 ?auto_263944 ) ) ( not ( = ?auto_263939 ?auto_263945 ) ) ( not ( = ?auto_263939 ?auto_263946 ) ) ( not ( = ?auto_263940 ?auto_263941 ) ) ( not ( = ?auto_263940 ?auto_263942 ) ) ( not ( = ?auto_263940 ?auto_263943 ) ) ( not ( = ?auto_263940 ?auto_263944 ) ) ( not ( = ?auto_263940 ?auto_263945 ) ) ( not ( = ?auto_263940 ?auto_263946 ) ) ( not ( = ?auto_263941 ?auto_263942 ) ) ( not ( = ?auto_263941 ?auto_263943 ) ) ( not ( = ?auto_263941 ?auto_263944 ) ) ( not ( = ?auto_263941 ?auto_263945 ) ) ( not ( = ?auto_263941 ?auto_263946 ) ) ( not ( = ?auto_263942 ?auto_263943 ) ) ( not ( = ?auto_263942 ?auto_263944 ) ) ( not ( = ?auto_263942 ?auto_263945 ) ) ( not ( = ?auto_263942 ?auto_263946 ) ) ( not ( = ?auto_263943 ?auto_263944 ) ) ( not ( = ?auto_263943 ?auto_263945 ) ) ( not ( = ?auto_263943 ?auto_263946 ) ) ( not ( = ?auto_263944 ?auto_263945 ) ) ( not ( = ?auto_263944 ?auto_263946 ) ) ( not ( = ?auto_263945 ?auto_263946 ) ) ( ON ?auto_263945 ?auto_263946 ) ( CLEAR ?auto_263943 ) ( ON ?auto_263944 ?auto_263945 ) ( CLEAR ?auto_263944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_263934 ?auto_263935 ?auto_263936 ?auto_263937 ?auto_263938 ?auto_263939 ?auto_263940 ?auto_263941 ?auto_263942 ?auto_263943 ?auto_263944 )
      ( MAKE-13PILE ?auto_263934 ?auto_263935 ?auto_263936 ?auto_263937 ?auto_263938 ?auto_263939 ?auto_263940 ?auto_263941 ?auto_263942 ?auto_263943 ?auto_263944 ?auto_263945 ?auto_263946 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263960 - BLOCK
      ?auto_263961 - BLOCK
      ?auto_263962 - BLOCK
      ?auto_263963 - BLOCK
      ?auto_263964 - BLOCK
      ?auto_263965 - BLOCK
      ?auto_263966 - BLOCK
      ?auto_263967 - BLOCK
      ?auto_263968 - BLOCK
      ?auto_263969 - BLOCK
      ?auto_263970 - BLOCK
      ?auto_263971 - BLOCK
      ?auto_263972 - BLOCK
    )
    :vars
    (
      ?auto_263973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_263972 ?auto_263973 ) ( ON-TABLE ?auto_263960 ) ( ON ?auto_263961 ?auto_263960 ) ( ON ?auto_263962 ?auto_263961 ) ( ON ?auto_263963 ?auto_263962 ) ( ON ?auto_263964 ?auto_263963 ) ( ON ?auto_263965 ?auto_263964 ) ( ON ?auto_263966 ?auto_263965 ) ( ON ?auto_263967 ?auto_263966 ) ( ON ?auto_263968 ?auto_263967 ) ( not ( = ?auto_263960 ?auto_263961 ) ) ( not ( = ?auto_263960 ?auto_263962 ) ) ( not ( = ?auto_263960 ?auto_263963 ) ) ( not ( = ?auto_263960 ?auto_263964 ) ) ( not ( = ?auto_263960 ?auto_263965 ) ) ( not ( = ?auto_263960 ?auto_263966 ) ) ( not ( = ?auto_263960 ?auto_263967 ) ) ( not ( = ?auto_263960 ?auto_263968 ) ) ( not ( = ?auto_263960 ?auto_263969 ) ) ( not ( = ?auto_263960 ?auto_263970 ) ) ( not ( = ?auto_263960 ?auto_263971 ) ) ( not ( = ?auto_263960 ?auto_263972 ) ) ( not ( = ?auto_263960 ?auto_263973 ) ) ( not ( = ?auto_263961 ?auto_263962 ) ) ( not ( = ?auto_263961 ?auto_263963 ) ) ( not ( = ?auto_263961 ?auto_263964 ) ) ( not ( = ?auto_263961 ?auto_263965 ) ) ( not ( = ?auto_263961 ?auto_263966 ) ) ( not ( = ?auto_263961 ?auto_263967 ) ) ( not ( = ?auto_263961 ?auto_263968 ) ) ( not ( = ?auto_263961 ?auto_263969 ) ) ( not ( = ?auto_263961 ?auto_263970 ) ) ( not ( = ?auto_263961 ?auto_263971 ) ) ( not ( = ?auto_263961 ?auto_263972 ) ) ( not ( = ?auto_263961 ?auto_263973 ) ) ( not ( = ?auto_263962 ?auto_263963 ) ) ( not ( = ?auto_263962 ?auto_263964 ) ) ( not ( = ?auto_263962 ?auto_263965 ) ) ( not ( = ?auto_263962 ?auto_263966 ) ) ( not ( = ?auto_263962 ?auto_263967 ) ) ( not ( = ?auto_263962 ?auto_263968 ) ) ( not ( = ?auto_263962 ?auto_263969 ) ) ( not ( = ?auto_263962 ?auto_263970 ) ) ( not ( = ?auto_263962 ?auto_263971 ) ) ( not ( = ?auto_263962 ?auto_263972 ) ) ( not ( = ?auto_263962 ?auto_263973 ) ) ( not ( = ?auto_263963 ?auto_263964 ) ) ( not ( = ?auto_263963 ?auto_263965 ) ) ( not ( = ?auto_263963 ?auto_263966 ) ) ( not ( = ?auto_263963 ?auto_263967 ) ) ( not ( = ?auto_263963 ?auto_263968 ) ) ( not ( = ?auto_263963 ?auto_263969 ) ) ( not ( = ?auto_263963 ?auto_263970 ) ) ( not ( = ?auto_263963 ?auto_263971 ) ) ( not ( = ?auto_263963 ?auto_263972 ) ) ( not ( = ?auto_263963 ?auto_263973 ) ) ( not ( = ?auto_263964 ?auto_263965 ) ) ( not ( = ?auto_263964 ?auto_263966 ) ) ( not ( = ?auto_263964 ?auto_263967 ) ) ( not ( = ?auto_263964 ?auto_263968 ) ) ( not ( = ?auto_263964 ?auto_263969 ) ) ( not ( = ?auto_263964 ?auto_263970 ) ) ( not ( = ?auto_263964 ?auto_263971 ) ) ( not ( = ?auto_263964 ?auto_263972 ) ) ( not ( = ?auto_263964 ?auto_263973 ) ) ( not ( = ?auto_263965 ?auto_263966 ) ) ( not ( = ?auto_263965 ?auto_263967 ) ) ( not ( = ?auto_263965 ?auto_263968 ) ) ( not ( = ?auto_263965 ?auto_263969 ) ) ( not ( = ?auto_263965 ?auto_263970 ) ) ( not ( = ?auto_263965 ?auto_263971 ) ) ( not ( = ?auto_263965 ?auto_263972 ) ) ( not ( = ?auto_263965 ?auto_263973 ) ) ( not ( = ?auto_263966 ?auto_263967 ) ) ( not ( = ?auto_263966 ?auto_263968 ) ) ( not ( = ?auto_263966 ?auto_263969 ) ) ( not ( = ?auto_263966 ?auto_263970 ) ) ( not ( = ?auto_263966 ?auto_263971 ) ) ( not ( = ?auto_263966 ?auto_263972 ) ) ( not ( = ?auto_263966 ?auto_263973 ) ) ( not ( = ?auto_263967 ?auto_263968 ) ) ( not ( = ?auto_263967 ?auto_263969 ) ) ( not ( = ?auto_263967 ?auto_263970 ) ) ( not ( = ?auto_263967 ?auto_263971 ) ) ( not ( = ?auto_263967 ?auto_263972 ) ) ( not ( = ?auto_263967 ?auto_263973 ) ) ( not ( = ?auto_263968 ?auto_263969 ) ) ( not ( = ?auto_263968 ?auto_263970 ) ) ( not ( = ?auto_263968 ?auto_263971 ) ) ( not ( = ?auto_263968 ?auto_263972 ) ) ( not ( = ?auto_263968 ?auto_263973 ) ) ( not ( = ?auto_263969 ?auto_263970 ) ) ( not ( = ?auto_263969 ?auto_263971 ) ) ( not ( = ?auto_263969 ?auto_263972 ) ) ( not ( = ?auto_263969 ?auto_263973 ) ) ( not ( = ?auto_263970 ?auto_263971 ) ) ( not ( = ?auto_263970 ?auto_263972 ) ) ( not ( = ?auto_263970 ?auto_263973 ) ) ( not ( = ?auto_263971 ?auto_263972 ) ) ( not ( = ?auto_263971 ?auto_263973 ) ) ( not ( = ?auto_263972 ?auto_263973 ) ) ( ON ?auto_263971 ?auto_263972 ) ( ON ?auto_263970 ?auto_263971 ) ( CLEAR ?auto_263968 ) ( ON ?auto_263969 ?auto_263970 ) ( CLEAR ?auto_263969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_263960 ?auto_263961 ?auto_263962 ?auto_263963 ?auto_263964 ?auto_263965 ?auto_263966 ?auto_263967 ?auto_263968 ?auto_263969 )
      ( MAKE-13PILE ?auto_263960 ?auto_263961 ?auto_263962 ?auto_263963 ?auto_263964 ?auto_263965 ?auto_263966 ?auto_263967 ?auto_263968 ?auto_263969 ?auto_263970 ?auto_263971 ?auto_263972 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_263987 - BLOCK
      ?auto_263988 - BLOCK
      ?auto_263989 - BLOCK
      ?auto_263990 - BLOCK
      ?auto_263991 - BLOCK
      ?auto_263992 - BLOCK
      ?auto_263993 - BLOCK
      ?auto_263994 - BLOCK
      ?auto_263995 - BLOCK
      ?auto_263996 - BLOCK
      ?auto_263997 - BLOCK
      ?auto_263998 - BLOCK
      ?auto_263999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_263999 ) ( ON-TABLE ?auto_263987 ) ( ON ?auto_263988 ?auto_263987 ) ( ON ?auto_263989 ?auto_263988 ) ( ON ?auto_263990 ?auto_263989 ) ( ON ?auto_263991 ?auto_263990 ) ( ON ?auto_263992 ?auto_263991 ) ( ON ?auto_263993 ?auto_263992 ) ( ON ?auto_263994 ?auto_263993 ) ( ON ?auto_263995 ?auto_263994 ) ( not ( = ?auto_263987 ?auto_263988 ) ) ( not ( = ?auto_263987 ?auto_263989 ) ) ( not ( = ?auto_263987 ?auto_263990 ) ) ( not ( = ?auto_263987 ?auto_263991 ) ) ( not ( = ?auto_263987 ?auto_263992 ) ) ( not ( = ?auto_263987 ?auto_263993 ) ) ( not ( = ?auto_263987 ?auto_263994 ) ) ( not ( = ?auto_263987 ?auto_263995 ) ) ( not ( = ?auto_263987 ?auto_263996 ) ) ( not ( = ?auto_263987 ?auto_263997 ) ) ( not ( = ?auto_263987 ?auto_263998 ) ) ( not ( = ?auto_263987 ?auto_263999 ) ) ( not ( = ?auto_263988 ?auto_263989 ) ) ( not ( = ?auto_263988 ?auto_263990 ) ) ( not ( = ?auto_263988 ?auto_263991 ) ) ( not ( = ?auto_263988 ?auto_263992 ) ) ( not ( = ?auto_263988 ?auto_263993 ) ) ( not ( = ?auto_263988 ?auto_263994 ) ) ( not ( = ?auto_263988 ?auto_263995 ) ) ( not ( = ?auto_263988 ?auto_263996 ) ) ( not ( = ?auto_263988 ?auto_263997 ) ) ( not ( = ?auto_263988 ?auto_263998 ) ) ( not ( = ?auto_263988 ?auto_263999 ) ) ( not ( = ?auto_263989 ?auto_263990 ) ) ( not ( = ?auto_263989 ?auto_263991 ) ) ( not ( = ?auto_263989 ?auto_263992 ) ) ( not ( = ?auto_263989 ?auto_263993 ) ) ( not ( = ?auto_263989 ?auto_263994 ) ) ( not ( = ?auto_263989 ?auto_263995 ) ) ( not ( = ?auto_263989 ?auto_263996 ) ) ( not ( = ?auto_263989 ?auto_263997 ) ) ( not ( = ?auto_263989 ?auto_263998 ) ) ( not ( = ?auto_263989 ?auto_263999 ) ) ( not ( = ?auto_263990 ?auto_263991 ) ) ( not ( = ?auto_263990 ?auto_263992 ) ) ( not ( = ?auto_263990 ?auto_263993 ) ) ( not ( = ?auto_263990 ?auto_263994 ) ) ( not ( = ?auto_263990 ?auto_263995 ) ) ( not ( = ?auto_263990 ?auto_263996 ) ) ( not ( = ?auto_263990 ?auto_263997 ) ) ( not ( = ?auto_263990 ?auto_263998 ) ) ( not ( = ?auto_263990 ?auto_263999 ) ) ( not ( = ?auto_263991 ?auto_263992 ) ) ( not ( = ?auto_263991 ?auto_263993 ) ) ( not ( = ?auto_263991 ?auto_263994 ) ) ( not ( = ?auto_263991 ?auto_263995 ) ) ( not ( = ?auto_263991 ?auto_263996 ) ) ( not ( = ?auto_263991 ?auto_263997 ) ) ( not ( = ?auto_263991 ?auto_263998 ) ) ( not ( = ?auto_263991 ?auto_263999 ) ) ( not ( = ?auto_263992 ?auto_263993 ) ) ( not ( = ?auto_263992 ?auto_263994 ) ) ( not ( = ?auto_263992 ?auto_263995 ) ) ( not ( = ?auto_263992 ?auto_263996 ) ) ( not ( = ?auto_263992 ?auto_263997 ) ) ( not ( = ?auto_263992 ?auto_263998 ) ) ( not ( = ?auto_263992 ?auto_263999 ) ) ( not ( = ?auto_263993 ?auto_263994 ) ) ( not ( = ?auto_263993 ?auto_263995 ) ) ( not ( = ?auto_263993 ?auto_263996 ) ) ( not ( = ?auto_263993 ?auto_263997 ) ) ( not ( = ?auto_263993 ?auto_263998 ) ) ( not ( = ?auto_263993 ?auto_263999 ) ) ( not ( = ?auto_263994 ?auto_263995 ) ) ( not ( = ?auto_263994 ?auto_263996 ) ) ( not ( = ?auto_263994 ?auto_263997 ) ) ( not ( = ?auto_263994 ?auto_263998 ) ) ( not ( = ?auto_263994 ?auto_263999 ) ) ( not ( = ?auto_263995 ?auto_263996 ) ) ( not ( = ?auto_263995 ?auto_263997 ) ) ( not ( = ?auto_263995 ?auto_263998 ) ) ( not ( = ?auto_263995 ?auto_263999 ) ) ( not ( = ?auto_263996 ?auto_263997 ) ) ( not ( = ?auto_263996 ?auto_263998 ) ) ( not ( = ?auto_263996 ?auto_263999 ) ) ( not ( = ?auto_263997 ?auto_263998 ) ) ( not ( = ?auto_263997 ?auto_263999 ) ) ( not ( = ?auto_263998 ?auto_263999 ) ) ( ON ?auto_263998 ?auto_263999 ) ( ON ?auto_263997 ?auto_263998 ) ( CLEAR ?auto_263995 ) ( ON ?auto_263996 ?auto_263997 ) ( CLEAR ?auto_263996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_263987 ?auto_263988 ?auto_263989 ?auto_263990 ?auto_263991 ?auto_263992 ?auto_263993 ?auto_263994 ?auto_263995 ?auto_263996 )
      ( MAKE-13PILE ?auto_263987 ?auto_263988 ?auto_263989 ?auto_263990 ?auto_263991 ?auto_263992 ?auto_263993 ?auto_263994 ?auto_263995 ?auto_263996 ?auto_263997 ?auto_263998 ?auto_263999 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264013 - BLOCK
      ?auto_264014 - BLOCK
      ?auto_264015 - BLOCK
      ?auto_264016 - BLOCK
      ?auto_264017 - BLOCK
      ?auto_264018 - BLOCK
      ?auto_264019 - BLOCK
      ?auto_264020 - BLOCK
      ?auto_264021 - BLOCK
      ?auto_264022 - BLOCK
      ?auto_264023 - BLOCK
      ?auto_264024 - BLOCK
      ?auto_264025 - BLOCK
    )
    :vars
    (
      ?auto_264026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264025 ?auto_264026 ) ( ON-TABLE ?auto_264013 ) ( ON ?auto_264014 ?auto_264013 ) ( ON ?auto_264015 ?auto_264014 ) ( ON ?auto_264016 ?auto_264015 ) ( ON ?auto_264017 ?auto_264016 ) ( ON ?auto_264018 ?auto_264017 ) ( ON ?auto_264019 ?auto_264018 ) ( ON ?auto_264020 ?auto_264019 ) ( not ( = ?auto_264013 ?auto_264014 ) ) ( not ( = ?auto_264013 ?auto_264015 ) ) ( not ( = ?auto_264013 ?auto_264016 ) ) ( not ( = ?auto_264013 ?auto_264017 ) ) ( not ( = ?auto_264013 ?auto_264018 ) ) ( not ( = ?auto_264013 ?auto_264019 ) ) ( not ( = ?auto_264013 ?auto_264020 ) ) ( not ( = ?auto_264013 ?auto_264021 ) ) ( not ( = ?auto_264013 ?auto_264022 ) ) ( not ( = ?auto_264013 ?auto_264023 ) ) ( not ( = ?auto_264013 ?auto_264024 ) ) ( not ( = ?auto_264013 ?auto_264025 ) ) ( not ( = ?auto_264013 ?auto_264026 ) ) ( not ( = ?auto_264014 ?auto_264015 ) ) ( not ( = ?auto_264014 ?auto_264016 ) ) ( not ( = ?auto_264014 ?auto_264017 ) ) ( not ( = ?auto_264014 ?auto_264018 ) ) ( not ( = ?auto_264014 ?auto_264019 ) ) ( not ( = ?auto_264014 ?auto_264020 ) ) ( not ( = ?auto_264014 ?auto_264021 ) ) ( not ( = ?auto_264014 ?auto_264022 ) ) ( not ( = ?auto_264014 ?auto_264023 ) ) ( not ( = ?auto_264014 ?auto_264024 ) ) ( not ( = ?auto_264014 ?auto_264025 ) ) ( not ( = ?auto_264014 ?auto_264026 ) ) ( not ( = ?auto_264015 ?auto_264016 ) ) ( not ( = ?auto_264015 ?auto_264017 ) ) ( not ( = ?auto_264015 ?auto_264018 ) ) ( not ( = ?auto_264015 ?auto_264019 ) ) ( not ( = ?auto_264015 ?auto_264020 ) ) ( not ( = ?auto_264015 ?auto_264021 ) ) ( not ( = ?auto_264015 ?auto_264022 ) ) ( not ( = ?auto_264015 ?auto_264023 ) ) ( not ( = ?auto_264015 ?auto_264024 ) ) ( not ( = ?auto_264015 ?auto_264025 ) ) ( not ( = ?auto_264015 ?auto_264026 ) ) ( not ( = ?auto_264016 ?auto_264017 ) ) ( not ( = ?auto_264016 ?auto_264018 ) ) ( not ( = ?auto_264016 ?auto_264019 ) ) ( not ( = ?auto_264016 ?auto_264020 ) ) ( not ( = ?auto_264016 ?auto_264021 ) ) ( not ( = ?auto_264016 ?auto_264022 ) ) ( not ( = ?auto_264016 ?auto_264023 ) ) ( not ( = ?auto_264016 ?auto_264024 ) ) ( not ( = ?auto_264016 ?auto_264025 ) ) ( not ( = ?auto_264016 ?auto_264026 ) ) ( not ( = ?auto_264017 ?auto_264018 ) ) ( not ( = ?auto_264017 ?auto_264019 ) ) ( not ( = ?auto_264017 ?auto_264020 ) ) ( not ( = ?auto_264017 ?auto_264021 ) ) ( not ( = ?auto_264017 ?auto_264022 ) ) ( not ( = ?auto_264017 ?auto_264023 ) ) ( not ( = ?auto_264017 ?auto_264024 ) ) ( not ( = ?auto_264017 ?auto_264025 ) ) ( not ( = ?auto_264017 ?auto_264026 ) ) ( not ( = ?auto_264018 ?auto_264019 ) ) ( not ( = ?auto_264018 ?auto_264020 ) ) ( not ( = ?auto_264018 ?auto_264021 ) ) ( not ( = ?auto_264018 ?auto_264022 ) ) ( not ( = ?auto_264018 ?auto_264023 ) ) ( not ( = ?auto_264018 ?auto_264024 ) ) ( not ( = ?auto_264018 ?auto_264025 ) ) ( not ( = ?auto_264018 ?auto_264026 ) ) ( not ( = ?auto_264019 ?auto_264020 ) ) ( not ( = ?auto_264019 ?auto_264021 ) ) ( not ( = ?auto_264019 ?auto_264022 ) ) ( not ( = ?auto_264019 ?auto_264023 ) ) ( not ( = ?auto_264019 ?auto_264024 ) ) ( not ( = ?auto_264019 ?auto_264025 ) ) ( not ( = ?auto_264019 ?auto_264026 ) ) ( not ( = ?auto_264020 ?auto_264021 ) ) ( not ( = ?auto_264020 ?auto_264022 ) ) ( not ( = ?auto_264020 ?auto_264023 ) ) ( not ( = ?auto_264020 ?auto_264024 ) ) ( not ( = ?auto_264020 ?auto_264025 ) ) ( not ( = ?auto_264020 ?auto_264026 ) ) ( not ( = ?auto_264021 ?auto_264022 ) ) ( not ( = ?auto_264021 ?auto_264023 ) ) ( not ( = ?auto_264021 ?auto_264024 ) ) ( not ( = ?auto_264021 ?auto_264025 ) ) ( not ( = ?auto_264021 ?auto_264026 ) ) ( not ( = ?auto_264022 ?auto_264023 ) ) ( not ( = ?auto_264022 ?auto_264024 ) ) ( not ( = ?auto_264022 ?auto_264025 ) ) ( not ( = ?auto_264022 ?auto_264026 ) ) ( not ( = ?auto_264023 ?auto_264024 ) ) ( not ( = ?auto_264023 ?auto_264025 ) ) ( not ( = ?auto_264023 ?auto_264026 ) ) ( not ( = ?auto_264024 ?auto_264025 ) ) ( not ( = ?auto_264024 ?auto_264026 ) ) ( not ( = ?auto_264025 ?auto_264026 ) ) ( ON ?auto_264024 ?auto_264025 ) ( ON ?auto_264023 ?auto_264024 ) ( ON ?auto_264022 ?auto_264023 ) ( CLEAR ?auto_264020 ) ( ON ?auto_264021 ?auto_264022 ) ( CLEAR ?auto_264021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_264013 ?auto_264014 ?auto_264015 ?auto_264016 ?auto_264017 ?auto_264018 ?auto_264019 ?auto_264020 ?auto_264021 )
      ( MAKE-13PILE ?auto_264013 ?auto_264014 ?auto_264015 ?auto_264016 ?auto_264017 ?auto_264018 ?auto_264019 ?auto_264020 ?auto_264021 ?auto_264022 ?auto_264023 ?auto_264024 ?auto_264025 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264040 - BLOCK
      ?auto_264041 - BLOCK
      ?auto_264042 - BLOCK
      ?auto_264043 - BLOCK
      ?auto_264044 - BLOCK
      ?auto_264045 - BLOCK
      ?auto_264046 - BLOCK
      ?auto_264047 - BLOCK
      ?auto_264048 - BLOCK
      ?auto_264049 - BLOCK
      ?auto_264050 - BLOCK
      ?auto_264051 - BLOCK
      ?auto_264052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264052 ) ( ON-TABLE ?auto_264040 ) ( ON ?auto_264041 ?auto_264040 ) ( ON ?auto_264042 ?auto_264041 ) ( ON ?auto_264043 ?auto_264042 ) ( ON ?auto_264044 ?auto_264043 ) ( ON ?auto_264045 ?auto_264044 ) ( ON ?auto_264046 ?auto_264045 ) ( ON ?auto_264047 ?auto_264046 ) ( not ( = ?auto_264040 ?auto_264041 ) ) ( not ( = ?auto_264040 ?auto_264042 ) ) ( not ( = ?auto_264040 ?auto_264043 ) ) ( not ( = ?auto_264040 ?auto_264044 ) ) ( not ( = ?auto_264040 ?auto_264045 ) ) ( not ( = ?auto_264040 ?auto_264046 ) ) ( not ( = ?auto_264040 ?auto_264047 ) ) ( not ( = ?auto_264040 ?auto_264048 ) ) ( not ( = ?auto_264040 ?auto_264049 ) ) ( not ( = ?auto_264040 ?auto_264050 ) ) ( not ( = ?auto_264040 ?auto_264051 ) ) ( not ( = ?auto_264040 ?auto_264052 ) ) ( not ( = ?auto_264041 ?auto_264042 ) ) ( not ( = ?auto_264041 ?auto_264043 ) ) ( not ( = ?auto_264041 ?auto_264044 ) ) ( not ( = ?auto_264041 ?auto_264045 ) ) ( not ( = ?auto_264041 ?auto_264046 ) ) ( not ( = ?auto_264041 ?auto_264047 ) ) ( not ( = ?auto_264041 ?auto_264048 ) ) ( not ( = ?auto_264041 ?auto_264049 ) ) ( not ( = ?auto_264041 ?auto_264050 ) ) ( not ( = ?auto_264041 ?auto_264051 ) ) ( not ( = ?auto_264041 ?auto_264052 ) ) ( not ( = ?auto_264042 ?auto_264043 ) ) ( not ( = ?auto_264042 ?auto_264044 ) ) ( not ( = ?auto_264042 ?auto_264045 ) ) ( not ( = ?auto_264042 ?auto_264046 ) ) ( not ( = ?auto_264042 ?auto_264047 ) ) ( not ( = ?auto_264042 ?auto_264048 ) ) ( not ( = ?auto_264042 ?auto_264049 ) ) ( not ( = ?auto_264042 ?auto_264050 ) ) ( not ( = ?auto_264042 ?auto_264051 ) ) ( not ( = ?auto_264042 ?auto_264052 ) ) ( not ( = ?auto_264043 ?auto_264044 ) ) ( not ( = ?auto_264043 ?auto_264045 ) ) ( not ( = ?auto_264043 ?auto_264046 ) ) ( not ( = ?auto_264043 ?auto_264047 ) ) ( not ( = ?auto_264043 ?auto_264048 ) ) ( not ( = ?auto_264043 ?auto_264049 ) ) ( not ( = ?auto_264043 ?auto_264050 ) ) ( not ( = ?auto_264043 ?auto_264051 ) ) ( not ( = ?auto_264043 ?auto_264052 ) ) ( not ( = ?auto_264044 ?auto_264045 ) ) ( not ( = ?auto_264044 ?auto_264046 ) ) ( not ( = ?auto_264044 ?auto_264047 ) ) ( not ( = ?auto_264044 ?auto_264048 ) ) ( not ( = ?auto_264044 ?auto_264049 ) ) ( not ( = ?auto_264044 ?auto_264050 ) ) ( not ( = ?auto_264044 ?auto_264051 ) ) ( not ( = ?auto_264044 ?auto_264052 ) ) ( not ( = ?auto_264045 ?auto_264046 ) ) ( not ( = ?auto_264045 ?auto_264047 ) ) ( not ( = ?auto_264045 ?auto_264048 ) ) ( not ( = ?auto_264045 ?auto_264049 ) ) ( not ( = ?auto_264045 ?auto_264050 ) ) ( not ( = ?auto_264045 ?auto_264051 ) ) ( not ( = ?auto_264045 ?auto_264052 ) ) ( not ( = ?auto_264046 ?auto_264047 ) ) ( not ( = ?auto_264046 ?auto_264048 ) ) ( not ( = ?auto_264046 ?auto_264049 ) ) ( not ( = ?auto_264046 ?auto_264050 ) ) ( not ( = ?auto_264046 ?auto_264051 ) ) ( not ( = ?auto_264046 ?auto_264052 ) ) ( not ( = ?auto_264047 ?auto_264048 ) ) ( not ( = ?auto_264047 ?auto_264049 ) ) ( not ( = ?auto_264047 ?auto_264050 ) ) ( not ( = ?auto_264047 ?auto_264051 ) ) ( not ( = ?auto_264047 ?auto_264052 ) ) ( not ( = ?auto_264048 ?auto_264049 ) ) ( not ( = ?auto_264048 ?auto_264050 ) ) ( not ( = ?auto_264048 ?auto_264051 ) ) ( not ( = ?auto_264048 ?auto_264052 ) ) ( not ( = ?auto_264049 ?auto_264050 ) ) ( not ( = ?auto_264049 ?auto_264051 ) ) ( not ( = ?auto_264049 ?auto_264052 ) ) ( not ( = ?auto_264050 ?auto_264051 ) ) ( not ( = ?auto_264050 ?auto_264052 ) ) ( not ( = ?auto_264051 ?auto_264052 ) ) ( ON ?auto_264051 ?auto_264052 ) ( ON ?auto_264050 ?auto_264051 ) ( ON ?auto_264049 ?auto_264050 ) ( CLEAR ?auto_264047 ) ( ON ?auto_264048 ?auto_264049 ) ( CLEAR ?auto_264048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_264040 ?auto_264041 ?auto_264042 ?auto_264043 ?auto_264044 ?auto_264045 ?auto_264046 ?auto_264047 ?auto_264048 )
      ( MAKE-13PILE ?auto_264040 ?auto_264041 ?auto_264042 ?auto_264043 ?auto_264044 ?auto_264045 ?auto_264046 ?auto_264047 ?auto_264048 ?auto_264049 ?auto_264050 ?auto_264051 ?auto_264052 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264066 - BLOCK
      ?auto_264067 - BLOCK
      ?auto_264068 - BLOCK
      ?auto_264069 - BLOCK
      ?auto_264070 - BLOCK
      ?auto_264071 - BLOCK
      ?auto_264072 - BLOCK
      ?auto_264073 - BLOCK
      ?auto_264074 - BLOCK
      ?auto_264075 - BLOCK
      ?auto_264076 - BLOCK
      ?auto_264077 - BLOCK
      ?auto_264078 - BLOCK
    )
    :vars
    (
      ?auto_264079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264078 ?auto_264079 ) ( ON-TABLE ?auto_264066 ) ( ON ?auto_264067 ?auto_264066 ) ( ON ?auto_264068 ?auto_264067 ) ( ON ?auto_264069 ?auto_264068 ) ( ON ?auto_264070 ?auto_264069 ) ( ON ?auto_264071 ?auto_264070 ) ( ON ?auto_264072 ?auto_264071 ) ( not ( = ?auto_264066 ?auto_264067 ) ) ( not ( = ?auto_264066 ?auto_264068 ) ) ( not ( = ?auto_264066 ?auto_264069 ) ) ( not ( = ?auto_264066 ?auto_264070 ) ) ( not ( = ?auto_264066 ?auto_264071 ) ) ( not ( = ?auto_264066 ?auto_264072 ) ) ( not ( = ?auto_264066 ?auto_264073 ) ) ( not ( = ?auto_264066 ?auto_264074 ) ) ( not ( = ?auto_264066 ?auto_264075 ) ) ( not ( = ?auto_264066 ?auto_264076 ) ) ( not ( = ?auto_264066 ?auto_264077 ) ) ( not ( = ?auto_264066 ?auto_264078 ) ) ( not ( = ?auto_264066 ?auto_264079 ) ) ( not ( = ?auto_264067 ?auto_264068 ) ) ( not ( = ?auto_264067 ?auto_264069 ) ) ( not ( = ?auto_264067 ?auto_264070 ) ) ( not ( = ?auto_264067 ?auto_264071 ) ) ( not ( = ?auto_264067 ?auto_264072 ) ) ( not ( = ?auto_264067 ?auto_264073 ) ) ( not ( = ?auto_264067 ?auto_264074 ) ) ( not ( = ?auto_264067 ?auto_264075 ) ) ( not ( = ?auto_264067 ?auto_264076 ) ) ( not ( = ?auto_264067 ?auto_264077 ) ) ( not ( = ?auto_264067 ?auto_264078 ) ) ( not ( = ?auto_264067 ?auto_264079 ) ) ( not ( = ?auto_264068 ?auto_264069 ) ) ( not ( = ?auto_264068 ?auto_264070 ) ) ( not ( = ?auto_264068 ?auto_264071 ) ) ( not ( = ?auto_264068 ?auto_264072 ) ) ( not ( = ?auto_264068 ?auto_264073 ) ) ( not ( = ?auto_264068 ?auto_264074 ) ) ( not ( = ?auto_264068 ?auto_264075 ) ) ( not ( = ?auto_264068 ?auto_264076 ) ) ( not ( = ?auto_264068 ?auto_264077 ) ) ( not ( = ?auto_264068 ?auto_264078 ) ) ( not ( = ?auto_264068 ?auto_264079 ) ) ( not ( = ?auto_264069 ?auto_264070 ) ) ( not ( = ?auto_264069 ?auto_264071 ) ) ( not ( = ?auto_264069 ?auto_264072 ) ) ( not ( = ?auto_264069 ?auto_264073 ) ) ( not ( = ?auto_264069 ?auto_264074 ) ) ( not ( = ?auto_264069 ?auto_264075 ) ) ( not ( = ?auto_264069 ?auto_264076 ) ) ( not ( = ?auto_264069 ?auto_264077 ) ) ( not ( = ?auto_264069 ?auto_264078 ) ) ( not ( = ?auto_264069 ?auto_264079 ) ) ( not ( = ?auto_264070 ?auto_264071 ) ) ( not ( = ?auto_264070 ?auto_264072 ) ) ( not ( = ?auto_264070 ?auto_264073 ) ) ( not ( = ?auto_264070 ?auto_264074 ) ) ( not ( = ?auto_264070 ?auto_264075 ) ) ( not ( = ?auto_264070 ?auto_264076 ) ) ( not ( = ?auto_264070 ?auto_264077 ) ) ( not ( = ?auto_264070 ?auto_264078 ) ) ( not ( = ?auto_264070 ?auto_264079 ) ) ( not ( = ?auto_264071 ?auto_264072 ) ) ( not ( = ?auto_264071 ?auto_264073 ) ) ( not ( = ?auto_264071 ?auto_264074 ) ) ( not ( = ?auto_264071 ?auto_264075 ) ) ( not ( = ?auto_264071 ?auto_264076 ) ) ( not ( = ?auto_264071 ?auto_264077 ) ) ( not ( = ?auto_264071 ?auto_264078 ) ) ( not ( = ?auto_264071 ?auto_264079 ) ) ( not ( = ?auto_264072 ?auto_264073 ) ) ( not ( = ?auto_264072 ?auto_264074 ) ) ( not ( = ?auto_264072 ?auto_264075 ) ) ( not ( = ?auto_264072 ?auto_264076 ) ) ( not ( = ?auto_264072 ?auto_264077 ) ) ( not ( = ?auto_264072 ?auto_264078 ) ) ( not ( = ?auto_264072 ?auto_264079 ) ) ( not ( = ?auto_264073 ?auto_264074 ) ) ( not ( = ?auto_264073 ?auto_264075 ) ) ( not ( = ?auto_264073 ?auto_264076 ) ) ( not ( = ?auto_264073 ?auto_264077 ) ) ( not ( = ?auto_264073 ?auto_264078 ) ) ( not ( = ?auto_264073 ?auto_264079 ) ) ( not ( = ?auto_264074 ?auto_264075 ) ) ( not ( = ?auto_264074 ?auto_264076 ) ) ( not ( = ?auto_264074 ?auto_264077 ) ) ( not ( = ?auto_264074 ?auto_264078 ) ) ( not ( = ?auto_264074 ?auto_264079 ) ) ( not ( = ?auto_264075 ?auto_264076 ) ) ( not ( = ?auto_264075 ?auto_264077 ) ) ( not ( = ?auto_264075 ?auto_264078 ) ) ( not ( = ?auto_264075 ?auto_264079 ) ) ( not ( = ?auto_264076 ?auto_264077 ) ) ( not ( = ?auto_264076 ?auto_264078 ) ) ( not ( = ?auto_264076 ?auto_264079 ) ) ( not ( = ?auto_264077 ?auto_264078 ) ) ( not ( = ?auto_264077 ?auto_264079 ) ) ( not ( = ?auto_264078 ?auto_264079 ) ) ( ON ?auto_264077 ?auto_264078 ) ( ON ?auto_264076 ?auto_264077 ) ( ON ?auto_264075 ?auto_264076 ) ( ON ?auto_264074 ?auto_264075 ) ( CLEAR ?auto_264072 ) ( ON ?auto_264073 ?auto_264074 ) ( CLEAR ?auto_264073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_264066 ?auto_264067 ?auto_264068 ?auto_264069 ?auto_264070 ?auto_264071 ?auto_264072 ?auto_264073 )
      ( MAKE-13PILE ?auto_264066 ?auto_264067 ?auto_264068 ?auto_264069 ?auto_264070 ?auto_264071 ?auto_264072 ?auto_264073 ?auto_264074 ?auto_264075 ?auto_264076 ?auto_264077 ?auto_264078 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264093 - BLOCK
      ?auto_264094 - BLOCK
      ?auto_264095 - BLOCK
      ?auto_264096 - BLOCK
      ?auto_264097 - BLOCK
      ?auto_264098 - BLOCK
      ?auto_264099 - BLOCK
      ?auto_264100 - BLOCK
      ?auto_264101 - BLOCK
      ?auto_264102 - BLOCK
      ?auto_264103 - BLOCK
      ?auto_264104 - BLOCK
      ?auto_264105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264105 ) ( ON-TABLE ?auto_264093 ) ( ON ?auto_264094 ?auto_264093 ) ( ON ?auto_264095 ?auto_264094 ) ( ON ?auto_264096 ?auto_264095 ) ( ON ?auto_264097 ?auto_264096 ) ( ON ?auto_264098 ?auto_264097 ) ( ON ?auto_264099 ?auto_264098 ) ( not ( = ?auto_264093 ?auto_264094 ) ) ( not ( = ?auto_264093 ?auto_264095 ) ) ( not ( = ?auto_264093 ?auto_264096 ) ) ( not ( = ?auto_264093 ?auto_264097 ) ) ( not ( = ?auto_264093 ?auto_264098 ) ) ( not ( = ?auto_264093 ?auto_264099 ) ) ( not ( = ?auto_264093 ?auto_264100 ) ) ( not ( = ?auto_264093 ?auto_264101 ) ) ( not ( = ?auto_264093 ?auto_264102 ) ) ( not ( = ?auto_264093 ?auto_264103 ) ) ( not ( = ?auto_264093 ?auto_264104 ) ) ( not ( = ?auto_264093 ?auto_264105 ) ) ( not ( = ?auto_264094 ?auto_264095 ) ) ( not ( = ?auto_264094 ?auto_264096 ) ) ( not ( = ?auto_264094 ?auto_264097 ) ) ( not ( = ?auto_264094 ?auto_264098 ) ) ( not ( = ?auto_264094 ?auto_264099 ) ) ( not ( = ?auto_264094 ?auto_264100 ) ) ( not ( = ?auto_264094 ?auto_264101 ) ) ( not ( = ?auto_264094 ?auto_264102 ) ) ( not ( = ?auto_264094 ?auto_264103 ) ) ( not ( = ?auto_264094 ?auto_264104 ) ) ( not ( = ?auto_264094 ?auto_264105 ) ) ( not ( = ?auto_264095 ?auto_264096 ) ) ( not ( = ?auto_264095 ?auto_264097 ) ) ( not ( = ?auto_264095 ?auto_264098 ) ) ( not ( = ?auto_264095 ?auto_264099 ) ) ( not ( = ?auto_264095 ?auto_264100 ) ) ( not ( = ?auto_264095 ?auto_264101 ) ) ( not ( = ?auto_264095 ?auto_264102 ) ) ( not ( = ?auto_264095 ?auto_264103 ) ) ( not ( = ?auto_264095 ?auto_264104 ) ) ( not ( = ?auto_264095 ?auto_264105 ) ) ( not ( = ?auto_264096 ?auto_264097 ) ) ( not ( = ?auto_264096 ?auto_264098 ) ) ( not ( = ?auto_264096 ?auto_264099 ) ) ( not ( = ?auto_264096 ?auto_264100 ) ) ( not ( = ?auto_264096 ?auto_264101 ) ) ( not ( = ?auto_264096 ?auto_264102 ) ) ( not ( = ?auto_264096 ?auto_264103 ) ) ( not ( = ?auto_264096 ?auto_264104 ) ) ( not ( = ?auto_264096 ?auto_264105 ) ) ( not ( = ?auto_264097 ?auto_264098 ) ) ( not ( = ?auto_264097 ?auto_264099 ) ) ( not ( = ?auto_264097 ?auto_264100 ) ) ( not ( = ?auto_264097 ?auto_264101 ) ) ( not ( = ?auto_264097 ?auto_264102 ) ) ( not ( = ?auto_264097 ?auto_264103 ) ) ( not ( = ?auto_264097 ?auto_264104 ) ) ( not ( = ?auto_264097 ?auto_264105 ) ) ( not ( = ?auto_264098 ?auto_264099 ) ) ( not ( = ?auto_264098 ?auto_264100 ) ) ( not ( = ?auto_264098 ?auto_264101 ) ) ( not ( = ?auto_264098 ?auto_264102 ) ) ( not ( = ?auto_264098 ?auto_264103 ) ) ( not ( = ?auto_264098 ?auto_264104 ) ) ( not ( = ?auto_264098 ?auto_264105 ) ) ( not ( = ?auto_264099 ?auto_264100 ) ) ( not ( = ?auto_264099 ?auto_264101 ) ) ( not ( = ?auto_264099 ?auto_264102 ) ) ( not ( = ?auto_264099 ?auto_264103 ) ) ( not ( = ?auto_264099 ?auto_264104 ) ) ( not ( = ?auto_264099 ?auto_264105 ) ) ( not ( = ?auto_264100 ?auto_264101 ) ) ( not ( = ?auto_264100 ?auto_264102 ) ) ( not ( = ?auto_264100 ?auto_264103 ) ) ( not ( = ?auto_264100 ?auto_264104 ) ) ( not ( = ?auto_264100 ?auto_264105 ) ) ( not ( = ?auto_264101 ?auto_264102 ) ) ( not ( = ?auto_264101 ?auto_264103 ) ) ( not ( = ?auto_264101 ?auto_264104 ) ) ( not ( = ?auto_264101 ?auto_264105 ) ) ( not ( = ?auto_264102 ?auto_264103 ) ) ( not ( = ?auto_264102 ?auto_264104 ) ) ( not ( = ?auto_264102 ?auto_264105 ) ) ( not ( = ?auto_264103 ?auto_264104 ) ) ( not ( = ?auto_264103 ?auto_264105 ) ) ( not ( = ?auto_264104 ?auto_264105 ) ) ( ON ?auto_264104 ?auto_264105 ) ( ON ?auto_264103 ?auto_264104 ) ( ON ?auto_264102 ?auto_264103 ) ( ON ?auto_264101 ?auto_264102 ) ( CLEAR ?auto_264099 ) ( ON ?auto_264100 ?auto_264101 ) ( CLEAR ?auto_264100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_264093 ?auto_264094 ?auto_264095 ?auto_264096 ?auto_264097 ?auto_264098 ?auto_264099 ?auto_264100 )
      ( MAKE-13PILE ?auto_264093 ?auto_264094 ?auto_264095 ?auto_264096 ?auto_264097 ?auto_264098 ?auto_264099 ?auto_264100 ?auto_264101 ?auto_264102 ?auto_264103 ?auto_264104 ?auto_264105 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264119 - BLOCK
      ?auto_264120 - BLOCK
      ?auto_264121 - BLOCK
      ?auto_264122 - BLOCK
      ?auto_264123 - BLOCK
      ?auto_264124 - BLOCK
      ?auto_264125 - BLOCK
      ?auto_264126 - BLOCK
      ?auto_264127 - BLOCK
      ?auto_264128 - BLOCK
      ?auto_264129 - BLOCK
      ?auto_264130 - BLOCK
      ?auto_264131 - BLOCK
    )
    :vars
    (
      ?auto_264132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264131 ?auto_264132 ) ( ON-TABLE ?auto_264119 ) ( ON ?auto_264120 ?auto_264119 ) ( ON ?auto_264121 ?auto_264120 ) ( ON ?auto_264122 ?auto_264121 ) ( ON ?auto_264123 ?auto_264122 ) ( ON ?auto_264124 ?auto_264123 ) ( not ( = ?auto_264119 ?auto_264120 ) ) ( not ( = ?auto_264119 ?auto_264121 ) ) ( not ( = ?auto_264119 ?auto_264122 ) ) ( not ( = ?auto_264119 ?auto_264123 ) ) ( not ( = ?auto_264119 ?auto_264124 ) ) ( not ( = ?auto_264119 ?auto_264125 ) ) ( not ( = ?auto_264119 ?auto_264126 ) ) ( not ( = ?auto_264119 ?auto_264127 ) ) ( not ( = ?auto_264119 ?auto_264128 ) ) ( not ( = ?auto_264119 ?auto_264129 ) ) ( not ( = ?auto_264119 ?auto_264130 ) ) ( not ( = ?auto_264119 ?auto_264131 ) ) ( not ( = ?auto_264119 ?auto_264132 ) ) ( not ( = ?auto_264120 ?auto_264121 ) ) ( not ( = ?auto_264120 ?auto_264122 ) ) ( not ( = ?auto_264120 ?auto_264123 ) ) ( not ( = ?auto_264120 ?auto_264124 ) ) ( not ( = ?auto_264120 ?auto_264125 ) ) ( not ( = ?auto_264120 ?auto_264126 ) ) ( not ( = ?auto_264120 ?auto_264127 ) ) ( not ( = ?auto_264120 ?auto_264128 ) ) ( not ( = ?auto_264120 ?auto_264129 ) ) ( not ( = ?auto_264120 ?auto_264130 ) ) ( not ( = ?auto_264120 ?auto_264131 ) ) ( not ( = ?auto_264120 ?auto_264132 ) ) ( not ( = ?auto_264121 ?auto_264122 ) ) ( not ( = ?auto_264121 ?auto_264123 ) ) ( not ( = ?auto_264121 ?auto_264124 ) ) ( not ( = ?auto_264121 ?auto_264125 ) ) ( not ( = ?auto_264121 ?auto_264126 ) ) ( not ( = ?auto_264121 ?auto_264127 ) ) ( not ( = ?auto_264121 ?auto_264128 ) ) ( not ( = ?auto_264121 ?auto_264129 ) ) ( not ( = ?auto_264121 ?auto_264130 ) ) ( not ( = ?auto_264121 ?auto_264131 ) ) ( not ( = ?auto_264121 ?auto_264132 ) ) ( not ( = ?auto_264122 ?auto_264123 ) ) ( not ( = ?auto_264122 ?auto_264124 ) ) ( not ( = ?auto_264122 ?auto_264125 ) ) ( not ( = ?auto_264122 ?auto_264126 ) ) ( not ( = ?auto_264122 ?auto_264127 ) ) ( not ( = ?auto_264122 ?auto_264128 ) ) ( not ( = ?auto_264122 ?auto_264129 ) ) ( not ( = ?auto_264122 ?auto_264130 ) ) ( not ( = ?auto_264122 ?auto_264131 ) ) ( not ( = ?auto_264122 ?auto_264132 ) ) ( not ( = ?auto_264123 ?auto_264124 ) ) ( not ( = ?auto_264123 ?auto_264125 ) ) ( not ( = ?auto_264123 ?auto_264126 ) ) ( not ( = ?auto_264123 ?auto_264127 ) ) ( not ( = ?auto_264123 ?auto_264128 ) ) ( not ( = ?auto_264123 ?auto_264129 ) ) ( not ( = ?auto_264123 ?auto_264130 ) ) ( not ( = ?auto_264123 ?auto_264131 ) ) ( not ( = ?auto_264123 ?auto_264132 ) ) ( not ( = ?auto_264124 ?auto_264125 ) ) ( not ( = ?auto_264124 ?auto_264126 ) ) ( not ( = ?auto_264124 ?auto_264127 ) ) ( not ( = ?auto_264124 ?auto_264128 ) ) ( not ( = ?auto_264124 ?auto_264129 ) ) ( not ( = ?auto_264124 ?auto_264130 ) ) ( not ( = ?auto_264124 ?auto_264131 ) ) ( not ( = ?auto_264124 ?auto_264132 ) ) ( not ( = ?auto_264125 ?auto_264126 ) ) ( not ( = ?auto_264125 ?auto_264127 ) ) ( not ( = ?auto_264125 ?auto_264128 ) ) ( not ( = ?auto_264125 ?auto_264129 ) ) ( not ( = ?auto_264125 ?auto_264130 ) ) ( not ( = ?auto_264125 ?auto_264131 ) ) ( not ( = ?auto_264125 ?auto_264132 ) ) ( not ( = ?auto_264126 ?auto_264127 ) ) ( not ( = ?auto_264126 ?auto_264128 ) ) ( not ( = ?auto_264126 ?auto_264129 ) ) ( not ( = ?auto_264126 ?auto_264130 ) ) ( not ( = ?auto_264126 ?auto_264131 ) ) ( not ( = ?auto_264126 ?auto_264132 ) ) ( not ( = ?auto_264127 ?auto_264128 ) ) ( not ( = ?auto_264127 ?auto_264129 ) ) ( not ( = ?auto_264127 ?auto_264130 ) ) ( not ( = ?auto_264127 ?auto_264131 ) ) ( not ( = ?auto_264127 ?auto_264132 ) ) ( not ( = ?auto_264128 ?auto_264129 ) ) ( not ( = ?auto_264128 ?auto_264130 ) ) ( not ( = ?auto_264128 ?auto_264131 ) ) ( not ( = ?auto_264128 ?auto_264132 ) ) ( not ( = ?auto_264129 ?auto_264130 ) ) ( not ( = ?auto_264129 ?auto_264131 ) ) ( not ( = ?auto_264129 ?auto_264132 ) ) ( not ( = ?auto_264130 ?auto_264131 ) ) ( not ( = ?auto_264130 ?auto_264132 ) ) ( not ( = ?auto_264131 ?auto_264132 ) ) ( ON ?auto_264130 ?auto_264131 ) ( ON ?auto_264129 ?auto_264130 ) ( ON ?auto_264128 ?auto_264129 ) ( ON ?auto_264127 ?auto_264128 ) ( ON ?auto_264126 ?auto_264127 ) ( CLEAR ?auto_264124 ) ( ON ?auto_264125 ?auto_264126 ) ( CLEAR ?auto_264125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_264119 ?auto_264120 ?auto_264121 ?auto_264122 ?auto_264123 ?auto_264124 ?auto_264125 )
      ( MAKE-13PILE ?auto_264119 ?auto_264120 ?auto_264121 ?auto_264122 ?auto_264123 ?auto_264124 ?auto_264125 ?auto_264126 ?auto_264127 ?auto_264128 ?auto_264129 ?auto_264130 ?auto_264131 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264146 - BLOCK
      ?auto_264147 - BLOCK
      ?auto_264148 - BLOCK
      ?auto_264149 - BLOCK
      ?auto_264150 - BLOCK
      ?auto_264151 - BLOCK
      ?auto_264152 - BLOCK
      ?auto_264153 - BLOCK
      ?auto_264154 - BLOCK
      ?auto_264155 - BLOCK
      ?auto_264156 - BLOCK
      ?auto_264157 - BLOCK
      ?auto_264158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264158 ) ( ON-TABLE ?auto_264146 ) ( ON ?auto_264147 ?auto_264146 ) ( ON ?auto_264148 ?auto_264147 ) ( ON ?auto_264149 ?auto_264148 ) ( ON ?auto_264150 ?auto_264149 ) ( ON ?auto_264151 ?auto_264150 ) ( not ( = ?auto_264146 ?auto_264147 ) ) ( not ( = ?auto_264146 ?auto_264148 ) ) ( not ( = ?auto_264146 ?auto_264149 ) ) ( not ( = ?auto_264146 ?auto_264150 ) ) ( not ( = ?auto_264146 ?auto_264151 ) ) ( not ( = ?auto_264146 ?auto_264152 ) ) ( not ( = ?auto_264146 ?auto_264153 ) ) ( not ( = ?auto_264146 ?auto_264154 ) ) ( not ( = ?auto_264146 ?auto_264155 ) ) ( not ( = ?auto_264146 ?auto_264156 ) ) ( not ( = ?auto_264146 ?auto_264157 ) ) ( not ( = ?auto_264146 ?auto_264158 ) ) ( not ( = ?auto_264147 ?auto_264148 ) ) ( not ( = ?auto_264147 ?auto_264149 ) ) ( not ( = ?auto_264147 ?auto_264150 ) ) ( not ( = ?auto_264147 ?auto_264151 ) ) ( not ( = ?auto_264147 ?auto_264152 ) ) ( not ( = ?auto_264147 ?auto_264153 ) ) ( not ( = ?auto_264147 ?auto_264154 ) ) ( not ( = ?auto_264147 ?auto_264155 ) ) ( not ( = ?auto_264147 ?auto_264156 ) ) ( not ( = ?auto_264147 ?auto_264157 ) ) ( not ( = ?auto_264147 ?auto_264158 ) ) ( not ( = ?auto_264148 ?auto_264149 ) ) ( not ( = ?auto_264148 ?auto_264150 ) ) ( not ( = ?auto_264148 ?auto_264151 ) ) ( not ( = ?auto_264148 ?auto_264152 ) ) ( not ( = ?auto_264148 ?auto_264153 ) ) ( not ( = ?auto_264148 ?auto_264154 ) ) ( not ( = ?auto_264148 ?auto_264155 ) ) ( not ( = ?auto_264148 ?auto_264156 ) ) ( not ( = ?auto_264148 ?auto_264157 ) ) ( not ( = ?auto_264148 ?auto_264158 ) ) ( not ( = ?auto_264149 ?auto_264150 ) ) ( not ( = ?auto_264149 ?auto_264151 ) ) ( not ( = ?auto_264149 ?auto_264152 ) ) ( not ( = ?auto_264149 ?auto_264153 ) ) ( not ( = ?auto_264149 ?auto_264154 ) ) ( not ( = ?auto_264149 ?auto_264155 ) ) ( not ( = ?auto_264149 ?auto_264156 ) ) ( not ( = ?auto_264149 ?auto_264157 ) ) ( not ( = ?auto_264149 ?auto_264158 ) ) ( not ( = ?auto_264150 ?auto_264151 ) ) ( not ( = ?auto_264150 ?auto_264152 ) ) ( not ( = ?auto_264150 ?auto_264153 ) ) ( not ( = ?auto_264150 ?auto_264154 ) ) ( not ( = ?auto_264150 ?auto_264155 ) ) ( not ( = ?auto_264150 ?auto_264156 ) ) ( not ( = ?auto_264150 ?auto_264157 ) ) ( not ( = ?auto_264150 ?auto_264158 ) ) ( not ( = ?auto_264151 ?auto_264152 ) ) ( not ( = ?auto_264151 ?auto_264153 ) ) ( not ( = ?auto_264151 ?auto_264154 ) ) ( not ( = ?auto_264151 ?auto_264155 ) ) ( not ( = ?auto_264151 ?auto_264156 ) ) ( not ( = ?auto_264151 ?auto_264157 ) ) ( not ( = ?auto_264151 ?auto_264158 ) ) ( not ( = ?auto_264152 ?auto_264153 ) ) ( not ( = ?auto_264152 ?auto_264154 ) ) ( not ( = ?auto_264152 ?auto_264155 ) ) ( not ( = ?auto_264152 ?auto_264156 ) ) ( not ( = ?auto_264152 ?auto_264157 ) ) ( not ( = ?auto_264152 ?auto_264158 ) ) ( not ( = ?auto_264153 ?auto_264154 ) ) ( not ( = ?auto_264153 ?auto_264155 ) ) ( not ( = ?auto_264153 ?auto_264156 ) ) ( not ( = ?auto_264153 ?auto_264157 ) ) ( not ( = ?auto_264153 ?auto_264158 ) ) ( not ( = ?auto_264154 ?auto_264155 ) ) ( not ( = ?auto_264154 ?auto_264156 ) ) ( not ( = ?auto_264154 ?auto_264157 ) ) ( not ( = ?auto_264154 ?auto_264158 ) ) ( not ( = ?auto_264155 ?auto_264156 ) ) ( not ( = ?auto_264155 ?auto_264157 ) ) ( not ( = ?auto_264155 ?auto_264158 ) ) ( not ( = ?auto_264156 ?auto_264157 ) ) ( not ( = ?auto_264156 ?auto_264158 ) ) ( not ( = ?auto_264157 ?auto_264158 ) ) ( ON ?auto_264157 ?auto_264158 ) ( ON ?auto_264156 ?auto_264157 ) ( ON ?auto_264155 ?auto_264156 ) ( ON ?auto_264154 ?auto_264155 ) ( ON ?auto_264153 ?auto_264154 ) ( CLEAR ?auto_264151 ) ( ON ?auto_264152 ?auto_264153 ) ( CLEAR ?auto_264152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_264146 ?auto_264147 ?auto_264148 ?auto_264149 ?auto_264150 ?auto_264151 ?auto_264152 )
      ( MAKE-13PILE ?auto_264146 ?auto_264147 ?auto_264148 ?auto_264149 ?auto_264150 ?auto_264151 ?auto_264152 ?auto_264153 ?auto_264154 ?auto_264155 ?auto_264156 ?auto_264157 ?auto_264158 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264172 - BLOCK
      ?auto_264173 - BLOCK
      ?auto_264174 - BLOCK
      ?auto_264175 - BLOCK
      ?auto_264176 - BLOCK
      ?auto_264177 - BLOCK
      ?auto_264178 - BLOCK
      ?auto_264179 - BLOCK
      ?auto_264180 - BLOCK
      ?auto_264181 - BLOCK
      ?auto_264182 - BLOCK
      ?auto_264183 - BLOCK
      ?auto_264184 - BLOCK
    )
    :vars
    (
      ?auto_264185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264184 ?auto_264185 ) ( ON-TABLE ?auto_264172 ) ( ON ?auto_264173 ?auto_264172 ) ( ON ?auto_264174 ?auto_264173 ) ( ON ?auto_264175 ?auto_264174 ) ( ON ?auto_264176 ?auto_264175 ) ( not ( = ?auto_264172 ?auto_264173 ) ) ( not ( = ?auto_264172 ?auto_264174 ) ) ( not ( = ?auto_264172 ?auto_264175 ) ) ( not ( = ?auto_264172 ?auto_264176 ) ) ( not ( = ?auto_264172 ?auto_264177 ) ) ( not ( = ?auto_264172 ?auto_264178 ) ) ( not ( = ?auto_264172 ?auto_264179 ) ) ( not ( = ?auto_264172 ?auto_264180 ) ) ( not ( = ?auto_264172 ?auto_264181 ) ) ( not ( = ?auto_264172 ?auto_264182 ) ) ( not ( = ?auto_264172 ?auto_264183 ) ) ( not ( = ?auto_264172 ?auto_264184 ) ) ( not ( = ?auto_264172 ?auto_264185 ) ) ( not ( = ?auto_264173 ?auto_264174 ) ) ( not ( = ?auto_264173 ?auto_264175 ) ) ( not ( = ?auto_264173 ?auto_264176 ) ) ( not ( = ?auto_264173 ?auto_264177 ) ) ( not ( = ?auto_264173 ?auto_264178 ) ) ( not ( = ?auto_264173 ?auto_264179 ) ) ( not ( = ?auto_264173 ?auto_264180 ) ) ( not ( = ?auto_264173 ?auto_264181 ) ) ( not ( = ?auto_264173 ?auto_264182 ) ) ( not ( = ?auto_264173 ?auto_264183 ) ) ( not ( = ?auto_264173 ?auto_264184 ) ) ( not ( = ?auto_264173 ?auto_264185 ) ) ( not ( = ?auto_264174 ?auto_264175 ) ) ( not ( = ?auto_264174 ?auto_264176 ) ) ( not ( = ?auto_264174 ?auto_264177 ) ) ( not ( = ?auto_264174 ?auto_264178 ) ) ( not ( = ?auto_264174 ?auto_264179 ) ) ( not ( = ?auto_264174 ?auto_264180 ) ) ( not ( = ?auto_264174 ?auto_264181 ) ) ( not ( = ?auto_264174 ?auto_264182 ) ) ( not ( = ?auto_264174 ?auto_264183 ) ) ( not ( = ?auto_264174 ?auto_264184 ) ) ( not ( = ?auto_264174 ?auto_264185 ) ) ( not ( = ?auto_264175 ?auto_264176 ) ) ( not ( = ?auto_264175 ?auto_264177 ) ) ( not ( = ?auto_264175 ?auto_264178 ) ) ( not ( = ?auto_264175 ?auto_264179 ) ) ( not ( = ?auto_264175 ?auto_264180 ) ) ( not ( = ?auto_264175 ?auto_264181 ) ) ( not ( = ?auto_264175 ?auto_264182 ) ) ( not ( = ?auto_264175 ?auto_264183 ) ) ( not ( = ?auto_264175 ?auto_264184 ) ) ( not ( = ?auto_264175 ?auto_264185 ) ) ( not ( = ?auto_264176 ?auto_264177 ) ) ( not ( = ?auto_264176 ?auto_264178 ) ) ( not ( = ?auto_264176 ?auto_264179 ) ) ( not ( = ?auto_264176 ?auto_264180 ) ) ( not ( = ?auto_264176 ?auto_264181 ) ) ( not ( = ?auto_264176 ?auto_264182 ) ) ( not ( = ?auto_264176 ?auto_264183 ) ) ( not ( = ?auto_264176 ?auto_264184 ) ) ( not ( = ?auto_264176 ?auto_264185 ) ) ( not ( = ?auto_264177 ?auto_264178 ) ) ( not ( = ?auto_264177 ?auto_264179 ) ) ( not ( = ?auto_264177 ?auto_264180 ) ) ( not ( = ?auto_264177 ?auto_264181 ) ) ( not ( = ?auto_264177 ?auto_264182 ) ) ( not ( = ?auto_264177 ?auto_264183 ) ) ( not ( = ?auto_264177 ?auto_264184 ) ) ( not ( = ?auto_264177 ?auto_264185 ) ) ( not ( = ?auto_264178 ?auto_264179 ) ) ( not ( = ?auto_264178 ?auto_264180 ) ) ( not ( = ?auto_264178 ?auto_264181 ) ) ( not ( = ?auto_264178 ?auto_264182 ) ) ( not ( = ?auto_264178 ?auto_264183 ) ) ( not ( = ?auto_264178 ?auto_264184 ) ) ( not ( = ?auto_264178 ?auto_264185 ) ) ( not ( = ?auto_264179 ?auto_264180 ) ) ( not ( = ?auto_264179 ?auto_264181 ) ) ( not ( = ?auto_264179 ?auto_264182 ) ) ( not ( = ?auto_264179 ?auto_264183 ) ) ( not ( = ?auto_264179 ?auto_264184 ) ) ( not ( = ?auto_264179 ?auto_264185 ) ) ( not ( = ?auto_264180 ?auto_264181 ) ) ( not ( = ?auto_264180 ?auto_264182 ) ) ( not ( = ?auto_264180 ?auto_264183 ) ) ( not ( = ?auto_264180 ?auto_264184 ) ) ( not ( = ?auto_264180 ?auto_264185 ) ) ( not ( = ?auto_264181 ?auto_264182 ) ) ( not ( = ?auto_264181 ?auto_264183 ) ) ( not ( = ?auto_264181 ?auto_264184 ) ) ( not ( = ?auto_264181 ?auto_264185 ) ) ( not ( = ?auto_264182 ?auto_264183 ) ) ( not ( = ?auto_264182 ?auto_264184 ) ) ( not ( = ?auto_264182 ?auto_264185 ) ) ( not ( = ?auto_264183 ?auto_264184 ) ) ( not ( = ?auto_264183 ?auto_264185 ) ) ( not ( = ?auto_264184 ?auto_264185 ) ) ( ON ?auto_264183 ?auto_264184 ) ( ON ?auto_264182 ?auto_264183 ) ( ON ?auto_264181 ?auto_264182 ) ( ON ?auto_264180 ?auto_264181 ) ( ON ?auto_264179 ?auto_264180 ) ( ON ?auto_264178 ?auto_264179 ) ( CLEAR ?auto_264176 ) ( ON ?auto_264177 ?auto_264178 ) ( CLEAR ?auto_264177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_264172 ?auto_264173 ?auto_264174 ?auto_264175 ?auto_264176 ?auto_264177 )
      ( MAKE-13PILE ?auto_264172 ?auto_264173 ?auto_264174 ?auto_264175 ?auto_264176 ?auto_264177 ?auto_264178 ?auto_264179 ?auto_264180 ?auto_264181 ?auto_264182 ?auto_264183 ?auto_264184 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264199 - BLOCK
      ?auto_264200 - BLOCK
      ?auto_264201 - BLOCK
      ?auto_264202 - BLOCK
      ?auto_264203 - BLOCK
      ?auto_264204 - BLOCK
      ?auto_264205 - BLOCK
      ?auto_264206 - BLOCK
      ?auto_264207 - BLOCK
      ?auto_264208 - BLOCK
      ?auto_264209 - BLOCK
      ?auto_264210 - BLOCK
      ?auto_264211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264211 ) ( ON-TABLE ?auto_264199 ) ( ON ?auto_264200 ?auto_264199 ) ( ON ?auto_264201 ?auto_264200 ) ( ON ?auto_264202 ?auto_264201 ) ( ON ?auto_264203 ?auto_264202 ) ( not ( = ?auto_264199 ?auto_264200 ) ) ( not ( = ?auto_264199 ?auto_264201 ) ) ( not ( = ?auto_264199 ?auto_264202 ) ) ( not ( = ?auto_264199 ?auto_264203 ) ) ( not ( = ?auto_264199 ?auto_264204 ) ) ( not ( = ?auto_264199 ?auto_264205 ) ) ( not ( = ?auto_264199 ?auto_264206 ) ) ( not ( = ?auto_264199 ?auto_264207 ) ) ( not ( = ?auto_264199 ?auto_264208 ) ) ( not ( = ?auto_264199 ?auto_264209 ) ) ( not ( = ?auto_264199 ?auto_264210 ) ) ( not ( = ?auto_264199 ?auto_264211 ) ) ( not ( = ?auto_264200 ?auto_264201 ) ) ( not ( = ?auto_264200 ?auto_264202 ) ) ( not ( = ?auto_264200 ?auto_264203 ) ) ( not ( = ?auto_264200 ?auto_264204 ) ) ( not ( = ?auto_264200 ?auto_264205 ) ) ( not ( = ?auto_264200 ?auto_264206 ) ) ( not ( = ?auto_264200 ?auto_264207 ) ) ( not ( = ?auto_264200 ?auto_264208 ) ) ( not ( = ?auto_264200 ?auto_264209 ) ) ( not ( = ?auto_264200 ?auto_264210 ) ) ( not ( = ?auto_264200 ?auto_264211 ) ) ( not ( = ?auto_264201 ?auto_264202 ) ) ( not ( = ?auto_264201 ?auto_264203 ) ) ( not ( = ?auto_264201 ?auto_264204 ) ) ( not ( = ?auto_264201 ?auto_264205 ) ) ( not ( = ?auto_264201 ?auto_264206 ) ) ( not ( = ?auto_264201 ?auto_264207 ) ) ( not ( = ?auto_264201 ?auto_264208 ) ) ( not ( = ?auto_264201 ?auto_264209 ) ) ( not ( = ?auto_264201 ?auto_264210 ) ) ( not ( = ?auto_264201 ?auto_264211 ) ) ( not ( = ?auto_264202 ?auto_264203 ) ) ( not ( = ?auto_264202 ?auto_264204 ) ) ( not ( = ?auto_264202 ?auto_264205 ) ) ( not ( = ?auto_264202 ?auto_264206 ) ) ( not ( = ?auto_264202 ?auto_264207 ) ) ( not ( = ?auto_264202 ?auto_264208 ) ) ( not ( = ?auto_264202 ?auto_264209 ) ) ( not ( = ?auto_264202 ?auto_264210 ) ) ( not ( = ?auto_264202 ?auto_264211 ) ) ( not ( = ?auto_264203 ?auto_264204 ) ) ( not ( = ?auto_264203 ?auto_264205 ) ) ( not ( = ?auto_264203 ?auto_264206 ) ) ( not ( = ?auto_264203 ?auto_264207 ) ) ( not ( = ?auto_264203 ?auto_264208 ) ) ( not ( = ?auto_264203 ?auto_264209 ) ) ( not ( = ?auto_264203 ?auto_264210 ) ) ( not ( = ?auto_264203 ?auto_264211 ) ) ( not ( = ?auto_264204 ?auto_264205 ) ) ( not ( = ?auto_264204 ?auto_264206 ) ) ( not ( = ?auto_264204 ?auto_264207 ) ) ( not ( = ?auto_264204 ?auto_264208 ) ) ( not ( = ?auto_264204 ?auto_264209 ) ) ( not ( = ?auto_264204 ?auto_264210 ) ) ( not ( = ?auto_264204 ?auto_264211 ) ) ( not ( = ?auto_264205 ?auto_264206 ) ) ( not ( = ?auto_264205 ?auto_264207 ) ) ( not ( = ?auto_264205 ?auto_264208 ) ) ( not ( = ?auto_264205 ?auto_264209 ) ) ( not ( = ?auto_264205 ?auto_264210 ) ) ( not ( = ?auto_264205 ?auto_264211 ) ) ( not ( = ?auto_264206 ?auto_264207 ) ) ( not ( = ?auto_264206 ?auto_264208 ) ) ( not ( = ?auto_264206 ?auto_264209 ) ) ( not ( = ?auto_264206 ?auto_264210 ) ) ( not ( = ?auto_264206 ?auto_264211 ) ) ( not ( = ?auto_264207 ?auto_264208 ) ) ( not ( = ?auto_264207 ?auto_264209 ) ) ( not ( = ?auto_264207 ?auto_264210 ) ) ( not ( = ?auto_264207 ?auto_264211 ) ) ( not ( = ?auto_264208 ?auto_264209 ) ) ( not ( = ?auto_264208 ?auto_264210 ) ) ( not ( = ?auto_264208 ?auto_264211 ) ) ( not ( = ?auto_264209 ?auto_264210 ) ) ( not ( = ?auto_264209 ?auto_264211 ) ) ( not ( = ?auto_264210 ?auto_264211 ) ) ( ON ?auto_264210 ?auto_264211 ) ( ON ?auto_264209 ?auto_264210 ) ( ON ?auto_264208 ?auto_264209 ) ( ON ?auto_264207 ?auto_264208 ) ( ON ?auto_264206 ?auto_264207 ) ( ON ?auto_264205 ?auto_264206 ) ( CLEAR ?auto_264203 ) ( ON ?auto_264204 ?auto_264205 ) ( CLEAR ?auto_264204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_264199 ?auto_264200 ?auto_264201 ?auto_264202 ?auto_264203 ?auto_264204 )
      ( MAKE-13PILE ?auto_264199 ?auto_264200 ?auto_264201 ?auto_264202 ?auto_264203 ?auto_264204 ?auto_264205 ?auto_264206 ?auto_264207 ?auto_264208 ?auto_264209 ?auto_264210 ?auto_264211 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264225 - BLOCK
      ?auto_264226 - BLOCK
      ?auto_264227 - BLOCK
      ?auto_264228 - BLOCK
      ?auto_264229 - BLOCK
      ?auto_264230 - BLOCK
      ?auto_264231 - BLOCK
      ?auto_264232 - BLOCK
      ?auto_264233 - BLOCK
      ?auto_264234 - BLOCK
      ?auto_264235 - BLOCK
      ?auto_264236 - BLOCK
      ?auto_264237 - BLOCK
    )
    :vars
    (
      ?auto_264238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264237 ?auto_264238 ) ( ON-TABLE ?auto_264225 ) ( ON ?auto_264226 ?auto_264225 ) ( ON ?auto_264227 ?auto_264226 ) ( ON ?auto_264228 ?auto_264227 ) ( not ( = ?auto_264225 ?auto_264226 ) ) ( not ( = ?auto_264225 ?auto_264227 ) ) ( not ( = ?auto_264225 ?auto_264228 ) ) ( not ( = ?auto_264225 ?auto_264229 ) ) ( not ( = ?auto_264225 ?auto_264230 ) ) ( not ( = ?auto_264225 ?auto_264231 ) ) ( not ( = ?auto_264225 ?auto_264232 ) ) ( not ( = ?auto_264225 ?auto_264233 ) ) ( not ( = ?auto_264225 ?auto_264234 ) ) ( not ( = ?auto_264225 ?auto_264235 ) ) ( not ( = ?auto_264225 ?auto_264236 ) ) ( not ( = ?auto_264225 ?auto_264237 ) ) ( not ( = ?auto_264225 ?auto_264238 ) ) ( not ( = ?auto_264226 ?auto_264227 ) ) ( not ( = ?auto_264226 ?auto_264228 ) ) ( not ( = ?auto_264226 ?auto_264229 ) ) ( not ( = ?auto_264226 ?auto_264230 ) ) ( not ( = ?auto_264226 ?auto_264231 ) ) ( not ( = ?auto_264226 ?auto_264232 ) ) ( not ( = ?auto_264226 ?auto_264233 ) ) ( not ( = ?auto_264226 ?auto_264234 ) ) ( not ( = ?auto_264226 ?auto_264235 ) ) ( not ( = ?auto_264226 ?auto_264236 ) ) ( not ( = ?auto_264226 ?auto_264237 ) ) ( not ( = ?auto_264226 ?auto_264238 ) ) ( not ( = ?auto_264227 ?auto_264228 ) ) ( not ( = ?auto_264227 ?auto_264229 ) ) ( not ( = ?auto_264227 ?auto_264230 ) ) ( not ( = ?auto_264227 ?auto_264231 ) ) ( not ( = ?auto_264227 ?auto_264232 ) ) ( not ( = ?auto_264227 ?auto_264233 ) ) ( not ( = ?auto_264227 ?auto_264234 ) ) ( not ( = ?auto_264227 ?auto_264235 ) ) ( not ( = ?auto_264227 ?auto_264236 ) ) ( not ( = ?auto_264227 ?auto_264237 ) ) ( not ( = ?auto_264227 ?auto_264238 ) ) ( not ( = ?auto_264228 ?auto_264229 ) ) ( not ( = ?auto_264228 ?auto_264230 ) ) ( not ( = ?auto_264228 ?auto_264231 ) ) ( not ( = ?auto_264228 ?auto_264232 ) ) ( not ( = ?auto_264228 ?auto_264233 ) ) ( not ( = ?auto_264228 ?auto_264234 ) ) ( not ( = ?auto_264228 ?auto_264235 ) ) ( not ( = ?auto_264228 ?auto_264236 ) ) ( not ( = ?auto_264228 ?auto_264237 ) ) ( not ( = ?auto_264228 ?auto_264238 ) ) ( not ( = ?auto_264229 ?auto_264230 ) ) ( not ( = ?auto_264229 ?auto_264231 ) ) ( not ( = ?auto_264229 ?auto_264232 ) ) ( not ( = ?auto_264229 ?auto_264233 ) ) ( not ( = ?auto_264229 ?auto_264234 ) ) ( not ( = ?auto_264229 ?auto_264235 ) ) ( not ( = ?auto_264229 ?auto_264236 ) ) ( not ( = ?auto_264229 ?auto_264237 ) ) ( not ( = ?auto_264229 ?auto_264238 ) ) ( not ( = ?auto_264230 ?auto_264231 ) ) ( not ( = ?auto_264230 ?auto_264232 ) ) ( not ( = ?auto_264230 ?auto_264233 ) ) ( not ( = ?auto_264230 ?auto_264234 ) ) ( not ( = ?auto_264230 ?auto_264235 ) ) ( not ( = ?auto_264230 ?auto_264236 ) ) ( not ( = ?auto_264230 ?auto_264237 ) ) ( not ( = ?auto_264230 ?auto_264238 ) ) ( not ( = ?auto_264231 ?auto_264232 ) ) ( not ( = ?auto_264231 ?auto_264233 ) ) ( not ( = ?auto_264231 ?auto_264234 ) ) ( not ( = ?auto_264231 ?auto_264235 ) ) ( not ( = ?auto_264231 ?auto_264236 ) ) ( not ( = ?auto_264231 ?auto_264237 ) ) ( not ( = ?auto_264231 ?auto_264238 ) ) ( not ( = ?auto_264232 ?auto_264233 ) ) ( not ( = ?auto_264232 ?auto_264234 ) ) ( not ( = ?auto_264232 ?auto_264235 ) ) ( not ( = ?auto_264232 ?auto_264236 ) ) ( not ( = ?auto_264232 ?auto_264237 ) ) ( not ( = ?auto_264232 ?auto_264238 ) ) ( not ( = ?auto_264233 ?auto_264234 ) ) ( not ( = ?auto_264233 ?auto_264235 ) ) ( not ( = ?auto_264233 ?auto_264236 ) ) ( not ( = ?auto_264233 ?auto_264237 ) ) ( not ( = ?auto_264233 ?auto_264238 ) ) ( not ( = ?auto_264234 ?auto_264235 ) ) ( not ( = ?auto_264234 ?auto_264236 ) ) ( not ( = ?auto_264234 ?auto_264237 ) ) ( not ( = ?auto_264234 ?auto_264238 ) ) ( not ( = ?auto_264235 ?auto_264236 ) ) ( not ( = ?auto_264235 ?auto_264237 ) ) ( not ( = ?auto_264235 ?auto_264238 ) ) ( not ( = ?auto_264236 ?auto_264237 ) ) ( not ( = ?auto_264236 ?auto_264238 ) ) ( not ( = ?auto_264237 ?auto_264238 ) ) ( ON ?auto_264236 ?auto_264237 ) ( ON ?auto_264235 ?auto_264236 ) ( ON ?auto_264234 ?auto_264235 ) ( ON ?auto_264233 ?auto_264234 ) ( ON ?auto_264232 ?auto_264233 ) ( ON ?auto_264231 ?auto_264232 ) ( ON ?auto_264230 ?auto_264231 ) ( CLEAR ?auto_264228 ) ( ON ?auto_264229 ?auto_264230 ) ( CLEAR ?auto_264229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264225 ?auto_264226 ?auto_264227 ?auto_264228 ?auto_264229 )
      ( MAKE-13PILE ?auto_264225 ?auto_264226 ?auto_264227 ?auto_264228 ?auto_264229 ?auto_264230 ?auto_264231 ?auto_264232 ?auto_264233 ?auto_264234 ?auto_264235 ?auto_264236 ?auto_264237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264252 - BLOCK
      ?auto_264253 - BLOCK
      ?auto_264254 - BLOCK
      ?auto_264255 - BLOCK
      ?auto_264256 - BLOCK
      ?auto_264257 - BLOCK
      ?auto_264258 - BLOCK
      ?auto_264259 - BLOCK
      ?auto_264260 - BLOCK
      ?auto_264261 - BLOCK
      ?auto_264262 - BLOCK
      ?auto_264263 - BLOCK
      ?auto_264264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264264 ) ( ON-TABLE ?auto_264252 ) ( ON ?auto_264253 ?auto_264252 ) ( ON ?auto_264254 ?auto_264253 ) ( ON ?auto_264255 ?auto_264254 ) ( not ( = ?auto_264252 ?auto_264253 ) ) ( not ( = ?auto_264252 ?auto_264254 ) ) ( not ( = ?auto_264252 ?auto_264255 ) ) ( not ( = ?auto_264252 ?auto_264256 ) ) ( not ( = ?auto_264252 ?auto_264257 ) ) ( not ( = ?auto_264252 ?auto_264258 ) ) ( not ( = ?auto_264252 ?auto_264259 ) ) ( not ( = ?auto_264252 ?auto_264260 ) ) ( not ( = ?auto_264252 ?auto_264261 ) ) ( not ( = ?auto_264252 ?auto_264262 ) ) ( not ( = ?auto_264252 ?auto_264263 ) ) ( not ( = ?auto_264252 ?auto_264264 ) ) ( not ( = ?auto_264253 ?auto_264254 ) ) ( not ( = ?auto_264253 ?auto_264255 ) ) ( not ( = ?auto_264253 ?auto_264256 ) ) ( not ( = ?auto_264253 ?auto_264257 ) ) ( not ( = ?auto_264253 ?auto_264258 ) ) ( not ( = ?auto_264253 ?auto_264259 ) ) ( not ( = ?auto_264253 ?auto_264260 ) ) ( not ( = ?auto_264253 ?auto_264261 ) ) ( not ( = ?auto_264253 ?auto_264262 ) ) ( not ( = ?auto_264253 ?auto_264263 ) ) ( not ( = ?auto_264253 ?auto_264264 ) ) ( not ( = ?auto_264254 ?auto_264255 ) ) ( not ( = ?auto_264254 ?auto_264256 ) ) ( not ( = ?auto_264254 ?auto_264257 ) ) ( not ( = ?auto_264254 ?auto_264258 ) ) ( not ( = ?auto_264254 ?auto_264259 ) ) ( not ( = ?auto_264254 ?auto_264260 ) ) ( not ( = ?auto_264254 ?auto_264261 ) ) ( not ( = ?auto_264254 ?auto_264262 ) ) ( not ( = ?auto_264254 ?auto_264263 ) ) ( not ( = ?auto_264254 ?auto_264264 ) ) ( not ( = ?auto_264255 ?auto_264256 ) ) ( not ( = ?auto_264255 ?auto_264257 ) ) ( not ( = ?auto_264255 ?auto_264258 ) ) ( not ( = ?auto_264255 ?auto_264259 ) ) ( not ( = ?auto_264255 ?auto_264260 ) ) ( not ( = ?auto_264255 ?auto_264261 ) ) ( not ( = ?auto_264255 ?auto_264262 ) ) ( not ( = ?auto_264255 ?auto_264263 ) ) ( not ( = ?auto_264255 ?auto_264264 ) ) ( not ( = ?auto_264256 ?auto_264257 ) ) ( not ( = ?auto_264256 ?auto_264258 ) ) ( not ( = ?auto_264256 ?auto_264259 ) ) ( not ( = ?auto_264256 ?auto_264260 ) ) ( not ( = ?auto_264256 ?auto_264261 ) ) ( not ( = ?auto_264256 ?auto_264262 ) ) ( not ( = ?auto_264256 ?auto_264263 ) ) ( not ( = ?auto_264256 ?auto_264264 ) ) ( not ( = ?auto_264257 ?auto_264258 ) ) ( not ( = ?auto_264257 ?auto_264259 ) ) ( not ( = ?auto_264257 ?auto_264260 ) ) ( not ( = ?auto_264257 ?auto_264261 ) ) ( not ( = ?auto_264257 ?auto_264262 ) ) ( not ( = ?auto_264257 ?auto_264263 ) ) ( not ( = ?auto_264257 ?auto_264264 ) ) ( not ( = ?auto_264258 ?auto_264259 ) ) ( not ( = ?auto_264258 ?auto_264260 ) ) ( not ( = ?auto_264258 ?auto_264261 ) ) ( not ( = ?auto_264258 ?auto_264262 ) ) ( not ( = ?auto_264258 ?auto_264263 ) ) ( not ( = ?auto_264258 ?auto_264264 ) ) ( not ( = ?auto_264259 ?auto_264260 ) ) ( not ( = ?auto_264259 ?auto_264261 ) ) ( not ( = ?auto_264259 ?auto_264262 ) ) ( not ( = ?auto_264259 ?auto_264263 ) ) ( not ( = ?auto_264259 ?auto_264264 ) ) ( not ( = ?auto_264260 ?auto_264261 ) ) ( not ( = ?auto_264260 ?auto_264262 ) ) ( not ( = ?auto_264260 ?auto_264263 ) ) ( not ( = ?auto_264260 ?auto_264264 ) ) ( not ( = ?auto_264261 ?auto_264262 ) ) ( not ( = ?auto_264261 ?auto_264263 ) ) ( not ( = ?auto_264261 ?auto_264264 ) ) ( not ( = ?auto_264262 ?auto_264263 ) ) ( not ( = ?auto_264262 ?auto_264264 ) ) ( not ( = ?auto_264263 ?auto_264264 ) ) ( ON ?auto_264263 ?auto_264264 ) ( ON ?auto_264262 ?auto_264263 ) ( ON ?auto_264261 ?auto_264262 ) ( ON ?auto_264260 ?auto_264261 ) ( ON ?auto_264259 ?auto_264260 ) ( ON ?auto_264258 ?auto_264259 ) ( ON ?auto_264257 ?auto_264258 ) ( CLEAR ?auto_264255 ) ( ON ?auto_264256 ?auto_264257 ) ( CLEAR ?auto_264256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264252 ?auto_264253 ?auto_264254 ?auto_264255 ?auto_264256 )
      ( MAKE-13PILE ?auto_264252 ?auto_264253 ?auto_264254 ?auto_264255 ?auto_264256 ?auto_264257 ?auto_264258 ?auto_264259 ?auto_264260 ?auto_264261 ?auto_264262 ?auto_264263 ?auto_264264 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264278 - BLOCK
      ?auto_264279 - BLOCK
      ?auto_264280 - BLOCK
      ?auto_264281 - BLOCK
      ?auto_264282 - BLOCK
      ?auto_264283 - BLOCK
      ?auto_264284 - BLOCK
      ?auto_264285 - BLOCK
      ?auto_264286 - BLOCK
      ?auto_264287 - BLOCK
      ?auto_264288 - BLOCK
      ?auto_264289 - BLOCK
      ?auto_264290 - BLOCK
    )
    :vars
    (
      ?auto_264291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264290 ?auto_264291 ) ( ON-TABLE ?auto_264278 ) ( ON ?auto_264279 ?auto_264278 ) ( ON ?auto_264280 ?auto_264279 ) ( not ( = ?auto_264278 ?auto_264279 ) ) ( not ( = ?auto_264278 ?auto_264280 ) ) ( not ( = ?auto_264278 ?auto_264281 ) ) ( not ( = ?auto_264278 ?auto_264282 ) ) ( not ( = ?auto_264278 ?auto_264283 ) ) ( not ( = ?auto_264278 ?auto_264284 ) ) ( not ( = ?auto_264278 ?auto_264285 ) ) ( not ( = ?auto_264278 ?auto_264286 ) ) ( not ( = ?auto_264278 ?auto_264287 ) ) ( not ( = ?auto_264278 ?auto_264288 ) ) ( not ( = ?auto_264278 ?auto_264289 ) ) ( not ( = ?auto_264278 ?auto_264290 ) ) ( not ( = ?auto_264278 ?auto_264291 ) ) ( not ( = ?auto_264279 ?auto_264280 ) ) ( not ( = ?auto_264279 ?auto_264281 ) ) ( not ( = ?auto_264279 ?auto_264282 ) ) ( not ( = ?auto_264279 ?auto_264283 ) ) ( not ( = ?auto_264279 ?auto_264284 ) ) ( not ( = ?auto_264279 ?auto_264285 ) ) ( not ( = ?auto_264279 ?auto_264286 ) ) ( not ( = ?auto_264279 ?auto_264287 ) ) ( not ( = ?auto_264279 ?auto_264288 ) ) ( not ( = ?auto_264279 ?auto_264289 ) ) ( not ( = ?auto_264279 ?auto_264290 ) ) ( not ( = ?auto_264279 ?auto_264291 ) ) ( not ( = ?auto_264280 ?auto_264281 ) ) ( not ( = ?auto_264280 ?auto_264282 ) ) ( not ( = ?auto_264280 ?auto_264283 ) ) ( not ( = ?auto_264280 ?auto_264284 ) ) ( not ( = ?auto_264280 ?auto_264285 ) ) ( not ( = ?auto_264280 ?auto_264286 ) ) ( not ( = ?auto_264280 ?auto_264287 ) ) ( not ( = ?auto_264280 ?auto_264288 ) ) ( not ( = ?auto_264280 ?auto_264289 ) ) ( not ( = ?auto_264280 ?auto_264290 ) ) ( not ( = ?auto_264280 ?auto_264291 ) ) ( not ( = ?auto_264281 ?auto_264282 ) ) ( not ( = ?auto_264281 ?auto_264283 ) ) ( not ( = ?auto_264281 ?auto_264284 ) ) ( not ( = ?auto_264281 ?auto_264285 ) ) ( not ( = ?auto_264281 ?auto_264286 ) ) ( not ( = ?auto_264281 ?auto_264287 ) ) ( not ( = ?auto_264281 ?auto_264288 ) ) ( not ( = ?auto_264281 ?auto_264289 ) ) ( not ( = ?auto_264281 ?auto_264290 ) ) ( not ( = ?auto_264281 ?auto_264291 ) ) ( not ( = ?auto_264282 ?auto_264283 ) ) ( not ( = ?auto_264282 ?auto_264284 ) ) ( not ( = ?auto_264282 ?auto_264285 ) ) ( not ( = ?auto_264282 ?auto_264286 ) ) ( not ( = ?auto_264282 ?auto_264287 ) ) ( not ( = ?auto_264282 ?auto_264288 ) ) ( not ( = ?auto_264282 ?auto_264289 ) ) ( not ( = ?auto_264282 ?auto_264290 ) ) ( not ( = ?auto_264282 ?auto_264291 ) ) ( not ( = ?auto_264283 ?auto_264284 ) ) ( not ( = ?auto_264283 ?auto_264285 ) ) ( not ( = ?auto_264283 ?auto_264286 ) ) ( not ( = ?auto_264283 ?auto_264287 ) ) ( not ( = ?auto_264283 ?auto_264288 ) ) ( not ( = ?auto_264283 ?auto_264289 ) ) ( not ( = ?auto_264283 ?auto_264290 ) ) ( not ( = ?auto_264283 ?auto_264291 ) ) ( not ( = ?auto_264284 ?auto_264285 ) ) ( not ( = ?auto_264284 ?auto_264286 ) ) ( not ( = ?auto_264284 ?auto_264287 ) ) ( not ( = ?auto_264284 ?auto_264288 ) ) ( not ( = ?auto_264284 ?auto_264289 ) ) ( not ( = ?auto_264284 ?auto_264290 ) ) ( not ( = ?auto_264284 ?auto_264291 ) ) ( not ( = ?auto_264285 ?auto_264286 ) ) ( not ( = ?auto_264285 ?auto_264287 ) ) ( not ( = ?auto_264285 ?auto_264288 ) ) ( not ( = ?auto_264285 ?auto_264289 ) ) ( not ( = ?auto_264285 ?auto_264290 ) ) ( not ( = ?auto_264285 ?auto_264291 ) ) ( not ( = ?auto_264286 ?auto_264287 ) ) ( not ( = ?auto_264286 ?auto_264288 ) ) ( not ( = ?auto_264286 ?auto_264289 ) ) ( not ( = ?auto_264286 ?auto_264290 ) ) ( not ( = ?auto_264286 ?auto_264291 ) ) ( not ( = ?auto_264287 ?auto_264288 ) ) ( not ( = ?auto_264287 ?auto_264289 ) ) ( not ( = ?auto_264287 ?auto_264290 ) ) ( not ( = ?auto_264287 ?auto_264291 ) ) ( not ( = ?auto_264288 ?auto_264289 ) ) ( not ( = ?auto_264288 ?auto_264290 ) ) ( not ( = ?auto_264288 ?auto_264291 ) ) ( not ( = ?auto_264289 ?auto_264290 ) ) ( not ( = ?auto_264289 ?auto_264291 ) ) ( not ( = ?auto_264290 ?auto_264291 ) ) ( ON ?auto_264289 ?auto_264290 ) ( ON ?auto_264288 ?auto_264289 ) ( ON ?auto_264287 ?auto_264288 ) ( ON ?auto_264286 ?auto_264287 ) ( ON ?auto_264285 ?auto_264286 ) ( ON ?auto_264284 ?auto_264285 ) ( ON ?auto_264283 ?auto_264284 ) ( ON ?auto_264282 ?auto_264283 ) ( CLEAR ?auto_264280 ) ( ON ?auto_264281 ?auto_264282 ) ( CLEAR ?auto_264281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264278 ?auto_264279 ?auto_264280 ?auto_264281 )
      ( MAKE-13PILE ?auto_264278 ?auto_264279 ?auto_264280 ?auto_264281 ?auto_264282 ?auto_264283 ?auto_264284 ?auto_264285 ?auto_264286 ?auto_264287 ?auto_264288 ?auto_264289 ?auto_264290 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264305 - BLOCK
      ?auto_264306 - BLOCK
      ?auto_264307 - BLOCK
      ?auto_264308 - BLOCK
      ?auto_264309 - BLOCK
      ?auto_264310 - BLOCK
      ?auto_264311 - BLOCK
      ?auto_264312 - BLOCK
      ?auto_264313 - BLOCK
      ?auto_264314 - BLOCK
      ?auto_264315 - BLOCK
      ?auto_264316 - BLOCK
      ?auto_264317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264317 ) ( ON-TABLE ?auto_264305 ) ( ON ?auto_264306 ?auto_264305 ) ( ON ?auto_264307 ?auto_264306 ) ( not ( = ?auto_264305 ?auto_264306 ) ) ( not ( = ?auto_264305 ?auto_264307 ) ) ( not ( = ?auto_264305 ?auto_264308 ) ) ( not ( = ?auto_264305 ?auto_264309 ) ) ( not ( = ?auto_264305 ?auto_264310 ) ) ( not ( = ?auto_264305 ?auto_264311 ) ) ( not ( = ?auto_264305 ?auto_264312 ) ) ( not ( = ?auto_264305 ?auto_264313 ) ) ( not ( = ?auto_264305 ?auto_264314 ) ) ( not ( = ?auto_264305 ?auto_264315 ) ) ( not ( = ?auto_264305 ?auto_264316 ) ) ( not ( = ?auto_264305 ?auto_264317 ) ) ( not ( = ?auto_264306 ?auto_264307 ) ) ( not ( = ?auto_264306 ?auto_264308 ) ) ( not ( = ?auto_264306 ?auto_264309 ) ) ( not ( = ?auto_264306 ?auto_264310 ) ) ( not ( = ?auto_264306 ?auto_264311 ) ) ( not ( = ?auto_264306 ?auto_264312 ) ) ( not ( = ?auto_264306 ?auto_264313 ) ) ( not ( = ?auto_264306 ?auto_264314 ) ) ( not ( = ?auto_264306 ?auto_264315 ) ) ( not ( = ?auto_264306 ?auto_264316 ) ) ( not ( = ?auto_264306 ?auto_264317 ) ) ( not ( = ?auto_264307 ?auto_264308 ) ) ( not ( = ?auto_264307 ?auto_264309 ) ) ( not ( = ?auto_264307 ?auto_264310 ) ) ( not ( = ?auto_264307 ?auto_264311 ) ) ( not ( = ?auto_264307 ?auto_264312 ) ) ( not ( = ?auto_264307 ?auto_264313 ) ) ( not ( = ?auto_264307 ?auto_264314 ) ) ( not ( = ?auto_264307 ?auto_264315 ) ) ( not ( = ?auto_264307 ?auto_264316 ) ) ( not ( = ?auto_264307 ?auto_264317 ) ) ( not ( = ?auto_264308 ?auto_264309 ) ) ( not ( = ?auto_264308 ?auto_264310 ) ) ( not ( = ?auto_264308 ?auto_264311 ) ) ( not ( = ?auto_264308 ?auto_264312 ) ) ( not ( = ?auto_264308 ?auto_264313 ) ) ( not ( = ?auto_264308 ?auto_264314 ) ) ( not ( = ?auto_264308 ?auto_264315 ) ) ( not ( = ?auto_264308 ?auto_264316 ) ) ( not ( = ?auto_264308 ?auto_264317 ) ) ( not ( = ?auto_264309 ?auto_264310 ) ) ( not ( = ?auto_264309 ?auto_264311 ) ) ( not ( = ?auto_264309 ?auto_264312 ) ) ( not ( = ?auto_264309 ?auto_264313 ) ) ( not ( = ?auto_264309 ?auto_264314 ) ) ( not ( = ?auto_264309 ?auto_264315 ) ) ( not ( = ?auto_264309 ?auto_264316 ) ) ( not ( = ?auto_264309 ?auto_264317 ) ) ( not ( = ?auto_264310 ?auto_264311 ) ) ( not ( = ?auto_264310 ?auto_264312 ) ) ( not ( = ?auto_264310 ?auto_264313 ) ) ( not ( = ?auto_264310 ?auto_264314 ) ) ( not ( = ?auto_264310 ?auto_264315 ) ) ( not ( = ?auto_264310 ?auto_264316 ) ) ( not ( = ?auto_264310 ?auto_264317 ) ) ( not ( = ?auto_264311 ?auto_264312 ) ) ( not ( = ?auto_264311 ?auto_264313 ) ) ( not ( = ?auto_264311 ?auto_264314 ) ) ( not ( = ?auto_264311 ?auto_264315 ) ) ( not ( = ?auto_264311 ?auto_264316 ) ) ( not ( = ?auto_264311 ?auto_264317 ) ) ( not ( = ?auto_264312 ?auto_264313 ) ) ( not ( = ?auto_264312 ?auto_264314 ) ) ( not ( = ?auto_264312 ?auto_264315 ) ) ( not ( = ?auto_264312 ?auto_264316 ) ) ( not ( = ?auto_264312 ?auto_264317 ) ) ( not ( = ?auto_264313 ?auto_264314 ) ) ( not ( = ?auto_264313 ?auto_264315 ) ) ( not ( = ?auto_264313 ?auto_264316 ) ) ( not ( = ?auto_264313 ?auto_264317 ) ) ( not ( = ?auto_264314 ?auto_264315 ) ) ( not ( = ?auto_264314 ?auto_264316 ) ) ( not ( = ?auto_264314 ?auto_264317 ) ) ( not ( = ?auto_264315 ?auto_264316 ) ) ( not ( = ?auto_264315 ?auto_264317 ) ) ( not ( = ?auto_264316 ?auto_264317 ) ) ( ON ?auto_264316 ?auto_264317 ) ( ON ?auto_264315 ?auto_264316 ) ( ON ?auto_264314 ?auto_264315 ) ( ON ?auto_264313 ?auto_264314 ) ( ON ?auto_264312 ?auto_264313 ) ( ON ?auto_264311 ?auto_264312 ) ( ON ?auto_264310 ?auto_264311 ) ( ON ?auto_264309 ?auto_264310 ) ( CLEAR ?auto_264307 ) ( ON ?auto_264308 ?auto_264309 ) ( CLEAR ?auto_264308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264305 ?auto_264306 ?auto_264307 ?auto_264308 )
      ( MAKE-13PILE ?auto_264305 ?auto_264306 ?auto_264307 ?auto_264308 ?auto_264309 ?auto_264310 ?auto_264311 ?auto_264312 ?auto_264313 ?auto_264314 ?auto_264315 ?auto_264316 ?auto_264317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264331 - BLOCK
      ?auto_264332 - BLOCK
      ?auto_264333 - BLOCK
      ?auto_264334 - BLOCK
      ?auto_264335 - BLOCK
      ?auto_264336 - BLOCK
      ?auto_264337 - BLOCK
      ?auto_264338 - BLOCK
      ?auto_264339 - BLOCK
      ?auto_264340 - BLOCK
      ?auto_264341 - BLOCK
      ?auto_264342 - BLOCK
      ?auto_264343 - BLOCK
    )
    :vars
    (
      ?auto_264344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264343 ?auto_264344 ) ( ON-TABLE ?auto_264331 ) ( ON ?auto_264332 ?auto_264331 ) ( not ( = ?auto_264331 ?auto_264332 ) ) ( not ( = ?auto_264331 ?auto_264333 ) ) ( not ( = ?auto_264331 ?auto_264334 ) ) ( not ( = ?auto_264331 ?auto_264335 ) ) ( not ( = ?auto_264331 ?auto_264336 ) ) ( not ( = ?auto_264331 ?auto_264337 ) ) ( not ( = ?auto_264331 ?auto_264338 ) ) ( not ( = ?auto_264331 ?auto_264339 ) ) ( not ( = ?auto_264331 ?auto_264340 ) ) ( not ( = ?auto_264331 ?auto_264341 ) ) ( not ( = ?auto_264331 ?auto_264342 ) ) ( not ( = ?auto_264331 ?auto_264343 ) ) ( not ( = ?auto_264331 ?auto_264344 ) ) ( not ( = ?auto_264332 ?auto_264333 ) ) ( not ( = ?auto_264332 ?auto_264334 ) ) ( not ( = ?auto_264332 ?auto_264335 ) ) ( not ( = ?auto_264332 ?auto_264336 ) ) ( not ( = ?auto_264332 ?auto_264337 ) ) ( not ( = ?auto_264332 ?auto_264338 ) ) ( not ( = ?auto_264332 ?auto_264339 ) ) ( not ( = ?auto_264332 ?auto_264340 ) ) ( not ( = ?auto_264332 ?auto_264341 ) ) ( not ( = ?auto_264332 ?auto_264342 ) ) ( not ( = ?auto_264332 ?auto_264343 ) ) ( not ( = ?auto_264332 ?auto_264344 ) ) ( not ( = ?auto_264333 ?auto_264334 ) ) ( not ( = ?auto_264333 ?auto_264335 ) ) ( not ( = ?auto_264333 ?auto_264336 ) ) ( not ( = ?auto_264333 ?auto_264337 ) ) ( not ( = ?auto_264333 ?auto_264338 ) ) ( not ( = ?auto_264333 ?auto_264339 ) ) ( not ( = ?auto_264333 ?auto_264340 ) ) ( not ( = ?auto_264333 ?auto_264341 ) ) ( not ( = ?auto_264333 ?auto_264342 ) ) ( not ( = ?auto_264333 ?auto_264343 ) ) ( not ( = ?auto_264333 ?auto_264344 ) ) ( not ( = ?auto_264334 ?auto_264335 ) ) ( not ( = ?auto_264334 ?auto_264336 ) ) ( not ( = ?auto_264334 ?auto_264337 ) ) ( not ( = ?auto_264334 ?auto_264338 ) ) ( not ( = ?auto_264334 ?auto_264339 ) ) ( not ( = ?auto_264334 ?auto_264340 ) ) ( not ( = ?auto_264334 ?auto_264341 ) ) ( not ( = ?auto_264334 ?auto_264342 ) ) ( not ( = ?auto_264334 ?auto_264343 ) ) ( not ( = ?auto_264334 ?auto_264344 ) ) ( not ( = ?auto_264335 ?auto_264336 ) ) ( not ( = ?auto_264335 ?auto_264337 ) ) ( not ( = ?auto_264335 ?auto_264338 ) ) ( not ( = ?auto_264335 ?auto_264339 ) ) ( not ( = ?auto_264335 ?auto_264340 ) ) ( not ( = ?auto_264335 ?auto_264341 ) ) ( not ( = ?auto_264335 ?auto_264342 ) ) ( not ( = ?auto_264335 ?auto_264343 ) ) ( not ( = ?auto_264335 ?auto_264344 ) ) ( not ( = ?auto_264336 ?auto_264337 ) ) ( not ( = ?auto_264336 ?auto_264338 ) ) ( not ( = ?auto_264336 ?auto_264339 ) ) ( not ( = ?auto_264336 ?auto_264340 ) ) ( not ( = ?auto_264336 ?auto_264341 ) ) ( not ( = ?auto_264336 ?auto_264342 ) ) ( not ( = ?auto_264336 ?auto_264343 ) ) ( not ( = ?auto_264336 ?auto_264344 ) ) ( not ( = ?auto_264337 ?auto_264338 ) ) ( not ( = ?auto_264337 ?auto_264339 ) ) ( not ( = ?auto_264337 ?auto_264340 ) ) ( not ( = ?auto_264337 ?auto_264341 ) ) ( not ( = ?auto_264337 ?auto_264342 ) ) ( not ( = ?auto_264337 ?auto_264343 ) ) ( not ( = ?auto_264337 ?auto_264344 ) ) ( not ( = ?auto_264338 ?auto_264339 ) ) ( not ( = ?auto_264338 ?auto_264340 ) ) ( not ( = ?auto_264338 ?auto_264341 ) ) ( not ( = ?auto_264338 ?auto_264342 ) ) ( not ( = ?auto_264338 ?auto_264343 ) ) ( not ( = ?auto_264338 ?auto_264344 ) ) ( not ( = ?auto_264339 ?auto_264340 ) ) ( not ( = ?auto_264339 ?auto_264341 ) ) ( not ( = ?auto_264339 ?auto_264342 ) ) ( not ( = ?auto_264339 ?auto_264343 ) ) ( not ( = ?auto_264339 ?auto_264344 ) ) ( not ( = ?auto_264340 ?auto_264341 ) ) ( not ( = ?auto_264340 ?auto_264342 ) ) ( not ( = ?auto_264340 ?auto_264343 ) ) ( not ( = ?auto_264340 ?auto_264344 ) ) ( not ( = ?auto_264341 ?auto_264342 ) ) ( not ( = ?auto_264341 ?auto_264343 ) ) ( not ( = ?auto_264341 ?auto_264344 ) ) ( not ( = ?auto_264342 ?auto_264343 ) ) ( not ( = ?auto_264342 ?auto_264344 ) ) ( not ( = ?auto_264343 ?auto_264344 ) ) ( ON ?auto_264342 ?auto_264343 ) ( ON ?auto_264341 ?auto_264342 ) ( ON ?auto_264340 ?auto_264341 ) ( ON ?auto_264339 ?auto_264340 ) ( ON ?auto_264338 ?auto_264339 ) ( ON ?auto_264337 ?auto_264338 ) ( ON ?auto_264336 ?auto_264337 ) ( ON ?auto_264335 ?auto_264336 ) ( ON ?auto_264334 ?auto_264335 ) ( CLEAR ?auto_264332 ) ( ON ?auto_264333 ?auto_264334 ) ( CLEAR ?auto_264333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264331 ?auto_264332 ?auto_264333 )
      ( MAKE-13PILE ?auto_264331 ?auto_264332 ?auto_264333 ?auto_264334 ?auto_264335 ?auto_264336 ?auto_264337 ?auto_264338 ?auto_264339 ?auto_264340 ?auto_264341 ?auto_264342 ?auto_264343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264358 - BLOCK
      ?auto_264359 - BLOCK
      ?auto_264360 - BLOCK
      ?auto_264361 - BLOCK
      ?auto_264362 - BLOCK
      ?auto_264363 - BLOCK
      ?auto_264364 - BLOCK
      ?auto_264365 - BLOCK
      ?auto_264366 - BLOCK
      ?auto_264367 - BLOCK
      ?auto_264368 - BLOCK
      ?auto_264369 - BLOCK
      ?auto_264370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264370 ) ( ON-TABLE ?auto_264358 ) ( ON ?auto_264359 ?auto_264358 ) ( not ( = ?auto_264358 ?auto_264359 ) ) ( not ( = ?auto_264358 ?auto_264360 ) ) ( not ( = ?auto_264358 ?auto_264361 ) ) ( not ( = ?auto_264358 ?auto_264362 ) ) ( not ( = ?auto_264358 ?auto_264363 ) ) ( not ( = ?auto_264358 ?auto_264364 ) ) ( not ( = ?auto_264358 ?auto_264365 ) ) ( not ( = ?auto_264358 ?auto_264366 ) ) ( not ( = ?auto_264358 ?auto_264367 ) ) ( not ( = ?auto_264358 ?auto_264368 ) ) ( not ( = ?auto_264358 ?auto_264369 ) ) ( not ( = ?auto_264358 ?auto_264370 ) ) ( not ( = ?auto_264359 ?auto_264360 ) ) ( not ( = ?auto_264359 ?auto_264361 ) ) ( not ( = ?auto_264359 ?auto_264362 ) ) ( not ( = ?auto_264359 ?auto_264363 ) ) ( not ( = ?auto_264359 ?auto_264364 ) ) ( not ( = ?auto_264359 ?auto_264365 ) ) ( not ( = ?auto_264359 ?auto_264366 ) ) ( not ( = ?auto_264359 ?auto_264367 ) ) ( not ( = ?auto_264359 ?auto_264368 ) ) ( not ( = ?auto_264359 ?auto_264369 ) ) ( not ( = ?auto_264359 ?auto_264370 ) ) ( not ( = ?auto_264360 ?auto_264361 ) ) ( not ( = ?auto_264360 ?auto_264362 ) ) ( not ( = ?auto_264360 ?auto_264363 ) ) ( not ( = ?auto_264360 ?auto_264364 ) ) ( not ( = ?auto_264360 ?auto_264365 ) ) ( not ( = ?auto_264360 ?auto_264366 ) ) ( not ( = ?auto_264360 ?auto_264367 ) ) ( not ( = ?auto_264360 ?auto_264368 ) ) ( not ( = ?auto_264360 ?auto_264369 ) ) ( not ( = ?auto_264360 ?auto_264370 ) ) ( not ( = ?auto_264361 ?auto_264362 ) ) ( not ( = ?auto_264361 ?auto_264363 ) ) ( not ( = ?auto_264361 ?auto_264364 ) ) ( not ( = ?auto_264361 ?auto_264365 ) ) ( not ( = ?auto_264361 ?auto_264366 ) ) ( not ( = ?auto_264361 ?auto_264367 ) ) ( not ( = ?auto_264361 ?auto_264368 ) ) ( not ( = ?auto_264361 ?auto_264369 ) ) ( not ( = ?auto_264361 ?auto_264370 ) ) ( not ( = ?auto_264362 ?auto_264363 ) ) ( not ( = ?auto_264362 ?auto_264364 ) ) ( not ( = ?auto_264362 ?auto_264365 ) ) ( not ( = ?auto_264362 ?auto_264366 ) ) ( not ( = ?auto_264362 ?auto_264367 ) ) ( not ( = ?auto_264362 ?auto_264368 ) ) ( not ( = ?auto_264362 ?auto_264369 ) ) ( not ( = ?auto_264362 ?auto_264370 ) ) ( not ( = ?auto_264363 ?auto_264364 ) ) ( not ( = ?auto_264363 ?auto_264365 ) ) ( not ( = ?auto_264363 ?auto_264366 ) ) ( not ( = ?auto_264363 ?auto_264367 ) ) ( not ( = ?auto_264363 ?auto_264368 ) ) ( not ( = ?auto_264363 ?auto_264369 ) ) ( not ( = ?auto_264363 ?auto_264370 ) ) ( not ( = ?auto_264364 ?auto_264365 ) ) ( not ( = ?auto_264364 ?auto_264366 ) ) ( not ( = ?auto_264364 ?auto_264367 ) ) ( not ( = ?auto_264364 ?auto_264368 ) ) ( not ( = ?auto_264364 ?auto_264369 ) ) ( not ( = ?auto_264364 ?auto_264370 ) ) ( not ( = ?auto_264365 ?auto_264366 ) ) ( not ( = ?auto_264365 ?auto_264367 ) ) ( not ( = ?auto_264365 ?auto_264368 ) ) ( not ( = ?auto_264365 ?auto_264369 ) ) ( not ( = ?auto_264365 ?auto_264370 ) ) ( not ( = ?auto_264366 ?auto_264367 ) ) ( not ( = ?auto_264366 ?auto_264368 ) ) ( not ( = ?auto_264366 ?auto_264369 ) ) ( not ( = ?auto_264366 ?auto_264370 ) ) ( not ( = ?auto_264367 ?auto_264368 ) ) ( not ( = ?auto_264367 ?auto_264369 ) ) ( not ( = ?auto_264367 ?auto_264370 ) ) ( not ( = ?auto_264368 ?auto_264369 ) ) ( not ( = ?auto_264368 ?auto_264370 ) ) ( not ( = ?auto_264369 ?auto_264370 ) ) ( ON ?auto_264369 ?auto_264370 ) ( ON ?auto_264368 ?auto_264369 ) ( ON ?auto_264367 ?auto_264368 ) ( ON ?auto_264366 ?auto_264367 ) ( ON ?auto_264365 ?auto_264366 ) ( ON ?auto_264364 ?auto_264365 ) ( ON ?auto_264363 ?auto_264364 ) ( ON ?auto_264362 ?auto_264363 ) ( ON ?auto_264361 ?auto_264362 ) ( CLEAR ?auto_264359 ) ( ON ?auto_264360 ?auto_264361 ) ( CLEAR ?auto_264360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264358 ?auto_264359 ?auto_264360 )
      ( MAKE-13PILE ?auto_264358 ?auto_264359 ?auto_264360 ?auto_264361 ?auto_264362 ?auto_264363 ?auto_264364 ?auto_264365 ?auto_264366 ?auto_264367 ?auto_264368 ?auto_264369 ?auto_264370 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264384 - BLOCK
      ?auto_264385 - BLOCK
      ?auto_264386 - BLOCK
      ?auto_264387 - BLOCK
      ?auto_264388 - BLOCK
      ?auto_264389 - BLOCK
      ?auto_264390 - BLOCK
      ?auto_264391 - BLOCK
      ?auto_264392 - BLOCK
      ?auto_264393 - BLOCK
      ?auto_264394 - BLOCK
      ?auto_264395 - BLOCK
      ?auto_264396 - BLOCK
    )
    :vars
    (
      ?auto_264397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264396 ?auto_264397 ) ( ON-TABLE ?auto_264384 ) ( not ( = ?auto_264384 ?auto_264385 ) ) ( not ( = ?auto_264384 ?auto_264386 ) ) ( not ( = ?auto_264384 ?auto_264387 ) ) ( not ( = ?auto_264384 ?auto_264388 ) ) ( not ( = ?auto_264384 ?auto_264389 ) ) ( not ( = ?auto_264384 ?auto_264390 ) ) ( not ( = ?auto_264384 ?auto_264391 ) ) ( not ( = ?auto_264384 ?auto_264392 ) ) ( not ( = ?auto_264384 ?auto_264393 ) ) ( not ( = ?auto_264384 ?auto_264394 ) ) ( not ( = ?auto_264384 ?auto_264395 ) ) ( not ( = ?auto_264384 ?auto_264396 ) ) ( not ( = ?auto_264384 ?auto_264397 ) ) ( not ( = ?auto_264385 ?auto_264386 ) ) ( not ( = ?auto_264385 ?auto_264387 ) ) ( not ( = ?auto_264385 ?auto_264388 ) ) ( not ( = ?auto_264385 ?auto_264389 ) ) ( not ( = ?auto_264385 ?auto_264390 ) ) ( not ( = ?auto_264385 ?auto_264391 ) ) ( not ( = ?auto_264385 ?auto_264392 ) ) ( not ( = ?auto_264385 ?auto_264393 ) ) ( not ( = ?auto_264385 ?auto_264394 ) ) ( not ( = ?auto_264385 ?auto_264395 ) ) ( not ( = ?auto_264385 ?auto_264396 ) ) ( not ( = ?auto_264385 ?auto_264397 ) ) ( not ( = ?auto_264386 ?auto_264387 ) ) ( not ( = ?auto_264386 ?auto_264388 ) ) ( not ( = ?auto_264386 ?auto_264389 ) ) ( not ( = ?auto_264386 ?auto_264390 ) ) ( not ( = ?auto_264386 ?auto_264391 ) ) ( not ( = ?auto_264386 ?auto_264392 ) ) ( not ( = ?auto_264386 ?auto_264393 ) ) ( not ( = ?auto_264386 ?auto_264394 ) ) ( not ( = ?auto_264386 ?auto_264395 ) ) ( not ( = ?auto_264386 ?auto_264396 ) ) ( not ( = ?auto_264386 ?auto_264397 ) ) ( not ( = ?auto_264387 ?auto_264388 ) ) ( not ( = ?auto_264387 ?auto_264389 ) ) ( not ( = ?auto_264387 ?auto_264390 ) ) ( not ( = ?auto_264387 ?auto_264391 ) ) ( not ( = ?auto_264387 ?auto_264392 ) ) ( not ( = ?auto_264387 ?auto_264393 ) ) ( not ( = ?auto_264387 ?auto_264394 ) ) ( not ( = ?auto_264387 ?auto_264395 ) ) ( not ( = ?auto_264387 ?auto_264396 ) ) ( not ( = ?auto_264387 ?auto_264397 ) ) ( not ( = ?auto_264388 ?auto_264389 ) ) ( not ( = ?auto_264388 ?auto_264390 ) ) ( not ( = ?auto_264388 ?auto_264391 ) ) ( not ( = ?auto_264388 ?auto_264392 ) ) ( not ( = ?auto_264388 ?auto_264393 ) ) ( not ( = ?auto_264388 ?auto_264394 ) ) ( not ( = ?auto_264388 ?auto_264395 ) ) ( not ( = ?auto_264388 ?auto_264396 ) ) ( not ( = ?auto_264388 ?auto_264397 ) ) ( not ( = ?auto_264389 ?auto_264390 ) ) ( not ( = ?auto_264389 ?auto_264391 ) ) ( not ( = ?auto_264389 ?auto_264392 ) ) ( not ( = ?auto_264389 ?auto_264393 ) ) ( not ( = ?auto_264389 ?auto_264394 ) ) ( not ( = ?auto_264389 ?auto_264395 ) ) ( not ( = ?auto_264389 ?auto_264396 ) ) ( not ( = ?auto_264389 ?auto_264397 ) ) ( not ( = ?auto_264390 ?auto_264391 ) ) ( not ( = ?auto_264390 ?auto_264392 ) ) ( not ( = ?auto_264390 ?auto_264393 ) ) ( not ( = ?auto_264390 ?auto_264394 ) ) ( not ( = ?auto_264390 ?auto_264395 ) ) ( not ( = ?auto_264390 ?auto_264396 ) ) ( not ( = ?auto_264390 ?auto_264397 ) ) ( not ( = ?auto_264391 ?auto_264392 ) ) ( not ( = ?auto_264391 ?auto_264393 ) ) ( not ( = ?auto_264391 ?auto_264394 ) ) ( not ( = ?auto_264391 ?auto_264395 ) ) ( not ( = ?auto_264391 ?auto_264396 ) ) ( not ( = ?auto_264391 ?auto_264397 ) ) ( not ( = ?auto_264392 ?auto_264393 ) ) ( not ( = ?auto_264392 ?auto_264394 ) ) ( not ( = ?auto_264392 ?auto_264395 ) ) ( not ( = ?auto_264392 ?auto_264396 ) ) ( not ( = ?auto_264392 ?auto_264397 ) ) ( not ( = ?auto_264393 ?auto_264394 ) ) ( not ( = ?auto_264393 ?auto_264395 ) ) ( not ( = ?auto_264393 ?auto_264396 ) ) ( not ( = ?auto_264393 ?auto_264397 ) ) ( not ( = ?auto_264394 ?auto_264395 ) ) ( not ( = ?auto_264394 ?auto_264396 ) ) ( not ( = ?auto_264394 ?auto_264397 ) ) ( not ( = ?auto_264395 ?auto_264396 ) ) ( not ( = ?auto_264395 ?auto_264397 ) ) ( not ( = ?auto_264396 ?auto_264397 ) ) ( ON ?auto_264395 ?auto_264396 ) ( ON ?auto_264394 ?auto_264395 ) ( ON ?auto_264393 ?auto_264394 ) ( ON ?auto_264392 ?auto_264393 ) ( ON ?auto_264391 ?auto_264392 ) ( ON ?auto_264390 ?auto_264391 ) ( ON ?auto_264389 ?auto_264390 ) ( ON ?auto_264388 ?auto_264389 ) ( ON ?auto_264387 ?auto_264388 ) ( ON ?auto_264386 ?auto_264387 ) ( CLEAR ?auto_264384 ) ( ON ?auto_264385 ?auto_264386 ) ( CLEAR ?auto_264385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264384 ?auto_264385 )
      ( MAKE-13PILE ?auto_264384 ?auto_264385 ?auto_264386 ?auto_264387 ?auto_264388 ?auto_264389 ?auto_264390 ?auto_264391 ?auto_264392 ?auto_264393 ?auto_264394 ?auto_264395 ?auto_264396 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264411 - BLOCK
      ?auto_264412 - BLOCK
      ?auto_264413 - BLOCK
      ?auto_264414 - BLOCK
      ?auto_264415 - BLOCK
      ?auto_264416 - BLOCK
      ?auto_264417 - BLOCK
      ?auto_264418 - BLOCK
      ?auto_264419 - BLOCK
      ?auto_264420 - BLOCK
      ?auto_264421 - BLOCK
      ?auto_264422 - BLOCK
      ?auto_264423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264423 ) ( ON-TABLE ?auto_264411 ) ( not ( = ?auto_264411 ?auto_264412 ) ) ( not ( = ?auto_264411 ?auto_264413 ) ) ( not ( = ?auto_264411 ?auto_264414 ) ) ( not ( = ?auto_264411 ?auto_264415 ) ) ( not ( = ?auto_264411 ?auto_264416 ) ) ( not ( = ?auto_264411 ?auto_264417 ) ) ( not ( = ?auto_264411 ?auto_264418 ) ) ( not ( = ?auto_264411 ?auto_264419 ) ) ( not ( = ?auto_264411 ?auto_264420 ) ) ( not ( = ?auto_264411 ?auto_264421 ) ) ( not ( = ?auto_264411 ?auto_264422 ) ) ( not ( = ?auto_264411 ?auto_264423 ) ) ( not ( = ?auto_264412 ?auto_264413 ) ) ( not ( = ?auto_264412 ?auto_264414 ) ) ( not ( = ?auto_264412 ?auto_264415 ) ) ( not ( = ?auto_264412 ?auto_264416 ) ) ( not ( = ?auto_264412 ?auto_264417 ) ) ( not ( = ?auto_264412 ?auto_264418 ) ) ( not ( = ?auto_264412 ?auto_264419 ) ) ( not ( = ?auto_264412 ?auto_264420 ) ) ( not ( = ?auto_264412 ?auto_264421 ) ) ( not ( = ?auto_264412 ?auto_264422 ) ) ( not ( = ?auto_264412 ?auto_264423 ) ) ( not ( = ?auto_264413 ?auto_264414 ) ) ( not ( = ?auto_264413 ?auto_264415 ) ) ( not ( = ?auto_264413 ?auto_264416 ) ) ( not ( = ?auto_264413 ?auto_264417 ) ) ( not ( = ?auto_264413 ?auto_264418 ) ) ( not ( = ?auto_264413 ?auto_264419 ) ) ( not ( = ?auto_264413 ?auto_264420 ) ) ( not ( = ?auto_264413 ?auto_264421 ) ) ( not ( = ?auto_264413 ?auto_264422 ) ) ( not ( = ?auto_264413 ?auto_264423 ) ) ( not ( = ?auto_264414 ?auto_264415 ) ) ( not ( = ?auto_264414 ?auto_264416 ) ) ( not ( = ?auto_264414 ?auto_264417 ) ) ( not ( = ?auto_264414 ?auto_264418 ) ) ( not ( = ?auto_264414 ?auto_264419 ) ) ( not ( = ?auto_264414 ?auto_264420 ) ) ( not ( = ?auto_264414 ?auto_264421 ) ) ( not ( = ?auto_264414 ?auto_264422 ) ) ( not ( = ?auto_264414 ?auto_264423 ) ) ( not ( = ?auto_264415 ?auto_264416 ) ) ( not ( = ?auto_264415 ?auto_264417 ) ) ( not ( = ?auto_264415 ?auto_264418 ) ) ( not ( = ?auto_264415 ?auto_264419 ) ) ( not ( = ?auto_264415 ?auto_264420 ) ) ( not ( = ?auto_264415 ?auto_264421 ) ) ( not ( = ?auto_264415 ?auto_264422 ) ) ( not ( = ?auto_264415 ?auto_264423 ) ) ( not ( = ?auto_264416 ?auto_264417 ) ) ( not ( = ?auto_264416 ?auto_264418 ) ) ( not ( = ?auto_264416 ?auto_264419 ) ) ( not ( = ?auto_264416 ?auto_264420 ) ) ( not ( = ?auto_264416 ?auto_264421 ) ) ( not ( = ?auto_264416 ?auto_264422 ) ) ( not ( = ?auto_264416 ?auto_264423 ) ) ( not ( = ?auto_264417 ?auto_264418 ) ) ( not ( = ?auto_264417 ?auto_264419 ) ) ( not ( = ?auto_264417 ?auto_264420 ) ) ( not ( = ?auto_264417 ?auto_264421 ) ) ( not ( = ?auto_264417 ?auto_264422 ) ) ( not ( = ?auto_264417 ?auto_264423 ) ) ( not ( = ?auto_264418 ?auto_264419 ) ) ( not ( = ?auto_264418 ?auto_264420 ) ) ( not ( = ?auto_264418 ?auto_264421 ) ) ( not ( = ?auto_264418 ?auto_264422 ) ) ( not ( = ?auto_264418 ?auto_264423 ) ) ( not ( = ?auto_264419 ?auto_264420 ) ) ( not ( = ?auto_264419 ?auto_264421 ) ) ( not ( = ?auto_264419 ?auto_264422 ) ) ( not ( = ?auto_264419 ?auto_264423 ) ) ( not ( = ?auto_264420 ?auto_264421 ) ) ( not ( = ?auto_264420 ?auto_264422 ) ) ( not ( = ?auto_264420 ?auto_264423 ) ) ( not ( = ?auto_264421 ?auto_264422 ) ) ( not ( = ?auto_264421 ?auto_264423 ) ) ( not ( = ?auto_264422 ?auto_264423 ) ) ( ON ?auto_264422 ?auto_264423 ) ( ON ?auto_264421 ?auto_264422 ) ( ON ?auto_264420 ?auto_264421 ) ( ON ?auto_264419 ?auto_264420 ) ( ON ?auto_264418 ?auto_264419 ) ( ON ?auto_264417 ?auto_264418 ) ( ON ?auto_264416 ?auto_264417 ) ( ON ?auto_264415 ?auto_264416 ) ( ON ?auto_264414 ?auto_264415 ) ( ON ?auto_264413 ?auto_264414 ) ( CLEAR ?auto_264411 ) ( ON ?auto_264412 ?auto_264413 ) ( CLEAR ?auto_264412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264411 ?auto_264412 )
      ( MAKE-13PILE ?auto_264411 ?auto_264412 ?auto_264413 ?auto_264414 ?auto_264415 ?auto_264416 ?auto_264417 ?auto_264418 ?auto_264419 ?auto_264420 ?auto_264421 ?auto_264422 ?auto_264423 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264437 - BLOCK
      ?auto_264438 - BLOCK
      ?auto_264439 - BLOCK
      ?auto_264440 - BLOCK
      ?auto_264441 - BLOCK
      ?auto_264442 - BLOCK
      ?auto_264443 - BLOCK
      ?auto_264444 - BLOCK
      ?auto_264445 - BLOCK
      ?auto_264446 - BLOCK
      ?auto_264447 - BLOCK
      ?auto_264448 - BLOCK
      ?auto_264449 - BLOCK
    )
    :vars
    (
      ?auto_264450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264449 ?auto_264450 ) ( not ( = ?auto_264437 ?auto_264438 ) ) ( not ( = ?auto_264437 ?auto_264439 ) ) ( not ( = ?auto_264437 ?auto_264440 ) ) ( not ( = ?auto_264437 ?auto_264441 ) ) ( not ( = ?auto_264437 ?auto_264442 ) ) ( not ( = ?auto_264437 ?auto_264443 ) ) ( not ( = ?auto_264437 ?auto_264444 ) ) ( not ( = ?auto_264437 ?auto_264445 ) ) ( not ( = ?auto_264437 ?auto_264446 ) ) ( not ( = ?auto_264437 ?auto_264447 ) ) ( not ( = ?auto_264437 ?auto_264448 ) ) ( not ( = ?auto_264437 ?auto_264449 ) ) ( not ( = ?auto_264437 ?auto_264450 ) ) ( not ( = ?auto_264438 ?auto_264439 ) ) ( not ( = ?auto_264438 ?auto_264440 ) ) ( not ( = ?auto_264438 ?auto_264441 ) ) ( not ( = ?auto_264438 ?auto_264442 ) ) ( not ( = ?auto_264438 ?auto_264443 ) ) ( not ( = ?auto_264438 ?auto_264444 ) ) ( not ( = ?auto_264438 ?auto_264445 ) ) ( not ( = ?auto_264438 ?auto_264446 ) ) ( not ( = ?auto_264438 ?auto_264447 ) ) ( not ( = ?auto_264438 ?auto_264448 ) ) ( not ( = ?auto_264438 ?auto_264449 ) ) ( not ( = ?auto_264438 ?auto_264450 ) ) ( not ( = ?auto_264439 ?auto_264440 ) ) ( not ( = ?auto_264439 ?auto_264441 ) ) ( not ( = ?auto_264439 ?auto_264442 ) ) ( not ( = ?auto_264439 ?auto_264443 ) ) ( not ( = ?auto_264439 ?auto_264444 ) ) ( not ( = ?auto_264439 ?auto_264445 ) ) ( not ( = ?auto_264439 ?auto_264446 ) ) ( not ( = ?auto_264439 ?auto_264447 ) ) ( not ( = ?auto_264439 ?auto_264448 ) ) ( not ( = ?auto_264439 ?auto_264449 ) ) ( not ( = ?auto_264439 ?auto_264450 ) ) ( not ( = ?auto_264440 ?auto_264441 ) ) ( not ( = ?auto_264440 ?auto_264442 ) ) ( not ( = ?auto_264440 ?auto_264443 ) ) ( not ( = ?auto_264440 ?auto_264444 ) ) ( not ( = ?auto_264440 ?auto_264445 ) ) ( not ( = ?auto_264440 ?auto_264446 ) ) ( not ( = ?auto_264440 ?auto_264447 ) ) ( not ( = ?auto_264440 ?auto_264448 ) ) ( not ( = ?auto_264440 ?auto_264449 ) ) ( not ( = ?auto_264440 ?auto_264450 ) ) ( not ( = ?auto_264441 ?auto_264442 ) ) ( not ( = ?auto_264441 ?auto_264443 ) ) ( not ( = ?auto_264441 ?auto_264444 ) ) ( not ( = ?auto_264441 ?auto_264445 ) ) ( not ( = ?auto_264441 ?auto_264446 ) ) ( not ( = ?auto_264441 ?auto_264447 ) ) ( not ( = ?auto_264441 ?auto_264448 ) ) ( not ( = ?auto_264441 ?auto_264449 ) ) ( not ( = ?auto_264441 ?auto_264450 ) ) ( not ( = ?auto_264442 ?auto_264443 ) ) ( not ( = ?auto_264442 ?auto_264444 ) ) ( not ( = ?auto_264442 ?auto_264445 ) ) ( not ( = ?auto_264442 ?auto_264446 ) ) ( not ( = ?auto_264442 ?auto_264447 ) ) ( not ( = ?auto_264442 ?auto_264448 ) ) ( not ( = ?auto_264442 ?auto_264449 ) ) ( not ( = ?auto_264442 ?auto_264450 ) ) ( not ( = ?auto_264443 ?auto_264444 ) ) ( not ( = ?auto_264443 ?auto_264445 ) ) ( not ( = ?auto_264443 ?auto_264446 ) ) ( not ( = ?auto_264443 ?auto_264447 ) ) ( not ( = ?auto_264443 ?auto_264448 ) ) ( not ( = ?auto_264443 ?auto_264449 ) ) ( not ( = ?auto_264443 ?auto_264450 ) ) ( not ( = ?auto_264444 ?auto_264445 ) ) ( not ( = ?auto_264444 ?auto_264446 ) ) ( not ( = ?auto_264444 ?auto_264447 ) ) ( not ( = ?auto_264444 ?auto_264448 ) ) ( not ( = ?auto_264444 ?auto_264449 ) ) ( not ( = ?auto_264444 ?auto_264450 ) ) ( not ( = ?auto_264445 ?auto_264446 ) ) ( not ( = ?auto_264445 ?auto_264447 ) ) ( not ( = ?auto_264445 ?auto_264448 ) ) ( not ( = ?auto_264445 ?auto_264449 ) ) ( not ( = ?auto_264445 ?auto_264450 ) ) ( not ( = ?auto_264446 ?auto_264447 ) ) ( not ( = ?auto_264446 ?auto_264448 ) ) ( not ( = ?auto_264446 ?auto_264449 ) ) ( not ( = ?auto_264446 ?auto_264450 ) ) ( not ( = ?auto_264447 ?auto_264448 ) ) ( not ( = ?auto_264447 ?auto_264449 ) ) ( not ( = ?auto_264447 ?auto_264450 ) ) ( not ( = ?auto_264448 ?auto_264449 ) ) ( not ( = ?auto_264448 ?auto_264450 ) ) ( not ( = ?auto_264449 ?auto_264450 ) ) ( ON ?auto_264448 ?auto_264449 ) ( ON ?auto_264447 ?auto_264448 ) ( ON ?auto_264446 ?auto_264447 ) ( ON ?auto_264445 ?auto_264446 ) ( ON ?auto_264444 ?auto_264445 ) ( ON ?auto_264443 ?auto_264444 ) ( ON ?auto_264442 ?auto_264443 ) ( ON ?auto_264441 ?auto_264442 ) ( ON ?auto_264440 ?auto_264441 ) ( ON ?auto_264439 ?auto_264440 ) ( ON ?auto_264438 ?auto_264439 ) ( ON ?auto_264437 ?auto_264438 ) ( CLEAR ?auto_264437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264437 )
      ( MAKE-13PILE ?auto_264437 ?auto_264438 ?auto_264439 ?auto_264440 ?auto_264441 ?auto_264442 ?auto_264443 ?auto_264444 ?auto_264445 ?auto_264446 ?auto_264447 ?auto_264448 ?auto_264449 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264464 - BLOCK
      ?auto_264465 - BLOCK
      ?auto_264466 - BLOCK
      ?auto_264467 - BLOCK
      ?auto_264468 - BLOCK
      ?auto_264469 - BLOCK
      ?auto_264470 - BLOCK
      ?auto_264471 - BLOCK
      ?auto_264472 - BLOCK
      ?auto_264473 - BLOCK
      ?auto_264474 - BLOCK
      ?auto_264475 - BLOCK
      ?auto_264476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_264476 ) ( not ( = ?auto_264464 ?auto_264465 ) ) ( not ( = ?auto_264464 ?auto_264466 ) ) ( not ( = ?auto_264464 ?auto_264467 ) ) ( not ( = ?auto_264464 ?auto_264468 ) ) ( not ( = ?auto_264464 ?auto_264469 ) ) ( not ( = ?auto_264464 ?auto_264470 ) ) ( not ( = ?auto_264464 ?auto_264471 ) ) ( not ( = ?auto_264464 ?auto_264472 ) ) ( not ( = ?auto_264464 ?auto_264473 ) ) ( not ( = ?auto_264464 ?auto_264474 ) ) ( not ( = ?auto_264464 ?auto_264475 ) ) ( not ( = ?auto_264464 ?auto_264476 ) ) ( not ( = ?auto_264465 ?auto_264466 ) ) ( not ( = ?auto_264465 ?auto_264467 ) ) ( not ( = ?auto_264465 ?auto_264468 ) ) ( not ( = ?auto_264465 ?auto_264469 ) ) ( not ( = ?auto_264465 ?auto_264470 ) ) ( not ( = ?auto_264465 ?auto_264471 ) ) ( not ( = ?auto_264465 ?auto_264472 ) ) ( not ( = ?auto_264465 ?auto_264473 ) ) ( not ( = ?auto_264465 ?auto_264474 ) ) ( not ( = ?auto_264465 ?auto_264475 ) ) ( not ( = ?auto_264465 ?auto_264476 ) ) ( not ( = ?auto_264466 ?auto_264467 ) ) ( not ( = ?auto_264466 ?auto_264468 ) ) ( not ( = ?auto_264466 ?auto_264469 ) ) ( not ( = ?auto_264466 ?auto_264470 ) ) ( not ( = ?auto_264466 ?auto_264471 ) ) ( not ( = ?auto_264466 ?auto_264472 ) ) ( not ( = ?auto_264466 ?auto_264473 ) ) ( not ( = ?auto_264466 ?auto_264474 ) ) ( not ( = ?auto_264466 ?auto_264475 ) ) ( not ( = ?auto_264466 ?auto_264476 ) ) ( not ( = ?auto_264467 ?auto_264468 ) ) ( not ( = ?auto_264467 ?auto_264469 ) ) ( not ( = ?auto_264467 ?auto_264470 ) ) ( not ( = ?auto_264467 ?auto_264471 ) ) ( not ( = ?auto_264467 ?auto_264472 ) ) ( not ( = ?auto_264467 ?auto_264473 ) ) ( not ( = ?auto_264467 ?auto_264474 ) ) ( not ( = ?auto_264467 ?auto_264475 ) ) ( not ( = ?auto_264467 ?auto_264476 ) ) ( not ( = ?auto_264468 ?auto_264469 ) ) ( not ( = ?auto_264468 ?auto_264470 ) ) ( not ( = ?auto_264468 ?auto_264471 ) ) ( not ( = ?auto_264468 ?auto_264472 ) ) ( not ( = ?auto_264468 ?auto_264473 ) ) ( not ( = ?auto_264468 ?auto_264474 ) ) ( not ( = ?auto_264468 ?auto_264475 ) ) ( not ( = ?auto_264468 ?auto_264476 ) ) ( not ( = ?auto_264469 ?auto_264470 ) ) ( not ( = ?auto_264469 ?auto_264471 ) ) ( not ( = ?auto_264469 ?auto_264472 ) ) ( not ( = ?auto_264469 ?auto_264473 ) ) ( not ( = ?auto_264469 ?auto_264474 ) ) ( not ( = ?auto_264469 ?auto_264475 ) ) ( not ( = ?auto_264469 ?auto_264476 ) ) ( not ( = ?auto_264470 ?auto_264471 ) ) ( not ( = ?auto_264470 ?auto_264472 ) ) ( not ( = ?auto_264470 ?auto_264473 ) ) ( not ( = ?auto_264470 ?auto_264474 ) ) ( not ( = ?auto_264470 ?auto_264475 ) ) ( not ( = ?auto_264470 ?auto_264476 ) ) ( not ( = ?auto_264471 ?auto_264472 ) ) ( not ( = ?auto_264471 ?auto_264473 ) ) ( not ( = ?auto_264471 ?auto_264474 ) ) ( not ( = ?auto_264471 ?auto_264475 ) ) ( not ( = ?auto_264471 ?auto_264476 ) ) ( not ( = ?auto_264472 ?auto_264473 ) ) ( not ( = ?auto_264472 ?auto_264474 ) ) ( not ( = ?auto_264472 ?auto_264475 ) ) ( not ( = ?auto_264472 ?auto_264476 ) ) ( not ( = ?auto_264473 ?auto_264474 ) ) ( not ( = ?auto_264473 ?auto_264475 ) ) ( not ( = ?auto_264473 ?auto_264476 ) ) ( not ( = ?auto_264474 ?auto_264475 ) ) ( not ( = ?auto_264474 ?auto_264476 ) ) ( not ( = ?auto_264475 ?auto_264476 ) ) ( ON ?auto_264475 ?auto_264476 ) ( ON ?auto_264474 ?auto_264475 ) ( ON ?auto_264473 ?auto_264474 ) ( ON ?auto_264472 ?auto_264473 ) ( ON ?auto_264471 ?auto_264472 ) ( ON ?auto_264470 ?auto_264471 ) ( ON ?auto_264469 ?auto_264470 ) ( ON ?auto_264468 ?auto_264469 ) ( ON ?auto_264467 ?auto_264468 ) ( ON ?auto_264466 ?auto_264467 ) ( ON ?auto_264465 ?auto_264466 ) ( ON ?auto_264464 ?auto_264465 ) ( CLEAR ?auto_264464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264464 )
      ( MAKE-13PILE ?auto_264464 ?auto_264465 ?auto_264466 ?auto_264467 ?auto_264468 ?auto_264469 ?auto_264470 ?auto_264471 ?auto_264472 ?auto_264473 ?auto_264474 ?auto_264475 ?auto_264476 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_264490 - BLOCK
      ?auto_264491 - BLOCK
      ?auto_264492 - BLOCK
      ?auto_264493 - BLOCK
      ?auto_264494 - BLOCK
      ?auto_264495 - BLOCK
      ?auto_264496 - BLOCK
      ?auto_264497 - BLOCK
      ?auto_264498 - BLOCK
      ?auto_264499 - BLOCK
      ?auto_264500 - BLOCK
      ?auto_264501 - BLOCK
      ?auto_264502 - BLOCK
    )
    :vars
    (
      ?auto_264503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_264490 ?auto_264491 ) ) ( not ( = ?auto_264490 ?auto_264492 ) ) ( not ( = ?auto_264490 ?auto_264493 ) ) ( not ( = ?auto_264490 ?auto_264494 ) ) ( not ( = ?auto_264490 ?auto_264495 ) ) ( not ( = ?auto_264490 ?auto_264496 ) ) ( not ( = ?auto_264490 ?auto_264497 ) ) ( not ( = ?auto_264490 ?auto_264498 ) ) ( not ( = ?auto_264490 ?auto_264499 ) ) ( not ( = ?auto_264490 ?auto_264500 ) ) ( not ( = ?auto_264490 ?auto_264501 ) ) ( not ( = ?auto_264490 ?auto_264502 ) ) ( not ( = ?auto_264491 ?auto_264492 ) ) ( not ( = ?auto_264491 ?auto_264493 ) ) ( not ( = ?auto_264491 ?auto_264494 ) ) ( not ( = ?auto_264491 ?auto_264495 ) ) ( not ( = ?auto_264491 ?auto_264496 ) ) ( not ( = ?auto_264491 ?auto_264497 ) ) ( not ( = ?auto_264491 ?auto_264498 ) ) ( not ( = ?auto_264491 ?auto_264499 ) ) ( not ( = ?auto_264491 ?auto_264500 ) ) ( not ( = ?auto_264491 ?auto_264501 ) ) ( not ( = ?auto_264491 ?auto_264502 ) ) ( not ( = ?auto_264492 ?auto_264493 ) ) ( not ( = ?auto_264492 ?auto_264494 ) ) ( not ( = ?auto_264492 ?auto_264495 ) ) ( not ( = ?auto_264492 ?auto_264496 ) ) ( not ( = ?auto_264492 ?auto_264497 ) ) ( not ( = ?auto_264492 ?auto_264498 ) ) ( not ( = ?auto_264492 ?auto_264499 ) ) ( not ( = ?auto_264492 ?auto_264500 ) ) ( not ( = ?auto_264492 ?auto_264501 ) ) ( not ( = ?auto_264492 ?auto_264502 ) ) ( not ( = ?auto_264493 ?auto_264494 ) ) ( not ( = ?auto_264493 ?auto_264495 ) ) ( not ( = ?auto_264493 ?auto_264496 ) ) ( not ( = ?auto_264493 ?auto_264497 ) ) ( not ( = ?auto_264493 ?auto_264498 ) ) ( not ( = ?auto_264493 ?auto_264499 ) ) ( not ( = ?auto_264493 ?auto_264500 ) ) ( not ( = ?auto_264493 ?auto_264501 ) ) ( not ( = ?auto_264493 ?auto_264502 ) ) ( not ( = ?auto_264494 ?auto_264495 ) ) ( not ( = ?auto_264494 ?auto_264496 ) ) ( not ( = ?auto_264494 ?auto_264497 ) ) ( not ( = ?auto_264494 ?auto_264498 ) ) ( not ( = ?auto_264494 ?auto_264499 ) ) ( not ( = ?auto_264494 ?auto_264500 ) ) ( not ( = ?auto_264494 ?auto_264501 ) ) ( not ( = ?auto_264494 ?auto_264502 ) ) ( not ( = ?auto_264495 ?auto_264496 ) ) ( not ( = ?auto_264495 ?auto_264497 ) ) ( not ( = ?auto_264495 ?auto_264498 ) ) ( not ( = ?auto_264495 ?auto_264499 ) ) ( not ( = ?auto_264495 ?auto_264500 ) ) ( not ( = ?auto_264495 ?auto_264501 ) ) ( not ( = ?auto_264495 ?auto_264502 ) ) ( not ( = ?auto_264496 ?auto_264497 ) ) ( not ( = ?auto_264496 ?auto_264498 ) ) ( not ( = ?auto_264496 ?auto_264499 ) ) ( not ( = ?auto_264496 ?auto_264500 ) ) ( not ( = ?auto_264496 ?auto_264501 ) ) ( not ( = ?auto_264496 ?auto_264502 ) ) ( not ( = ?auto_264497 ?auto_264498 ) ) ( not ( = ?auto_264497 ?auto_264499 ) ) ( not ( = ?auto_264497 ?auto_264500 ) ) ( not ( = ?auto_264497 ?auto_264501 ) ) ( not ( = ?auto_264497 ?auto_264502 ) ) ( not ( = ?auto_264498 ?auto_264499 ) ) ( not ( = ?auto_264498 ?auto_264500 ) ) ( not ( = ?auto_264498 ?auto_264501 ) ) ( not ( = ?auto_264498 ?auto_264502 ) ) ( not ( = ?auto_264499 ?auto_264500 ) ) ( not ( = ?auto_264499 ?auto_264501 ) ) ( not ( = ?auto_264499 ?auto_264502 ) ) ( not ( = ?auto_264500 ?auto_264501 ) ) ( not ( = ?auto_264500 ?auto_264502 ) ) ( not ( = ?auto_264501 ?auto_264502 ) ) ( ON ?auto_264490 ?auto_264503 ) ( not ( = ?auto_264502 ?auto_264503 ) ) ( not ( = ?auto_264501 ?auto_264503 ) ) ( not ( = ?auto_264500 ?auto_264503 ) ) ( not ( = ?auto_264499 ?auto_264503 ) ) ( not ( = ?auto_264498 ?auto_264503 ) ) ( not ( = ?auto_264497 ?auto_264503 ) ) ( not ( = ?auto_264496 ?auto_264503 ) ) ( not ( = ?auto_264495 ?auto_264503 ) ) ( not ( = ?auto_264494 ?auto_264503 ) ) ( not ( = ?auto_264493 ?auto_264503 ) ) ( not ( = ?auto_264492 ?auto_264503 ) ) ( not ( = ?auto_264491 ?auto_264503 ) ) ( not ( = ?auto_264490 ?auto_264503 ) ) ( ON ?auto_264491 ?auto_264490 ) ( ON ?auto_264492 ?auto_264491 ) ( ON ?auto_264493 ?auto_264492 ) ( ON ?auto_264494 ?auto_264493 ) ( ON ?auto_264495 ?auto_264494 ) ( ON ?auto_264496 ?auto_264495 ) ( ON ?auto_264497 ?auto_264496 ) ( ON ?auto_264498 ?auto_264497 ) ( ON ?auto_264499 ?auto_264498 ) ( ON ?auto_264500 ?auto_264499 ) ( ON ?auto_264501 ?auto_264500 ) ( ON ?auto_264502 ?auto_264501 ) ( CLEAR ?auto_264502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_264502 ?auto_264501 ?auto_264500 ?auto_264499 ?auto_264498 ?auto_264497 ?auto_264496 ?auto_264495 ?auto_264494 ?auto_264493 ?auto_264492 ?auto_264491 ?auto_264490 )
      ( MAKE-13PILE ?auto_264490 ?auto_264491 ?auto_264492 ?auto_264493 ?auto_264494 ?auto_264495 ?auto_264496 ?auto_264497 ?auto_264498 ?auto_264499 ?auto_264500 ?auto_264501 ?auto_264502 ) )
  )

)

