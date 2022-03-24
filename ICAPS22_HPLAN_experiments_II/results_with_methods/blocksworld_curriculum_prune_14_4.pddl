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
      ?auto_292061 - BLOCK
    )
    :vars
    (
      ?auto_292062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292061 ?auto_292062 ) ( CLEAR ?auto_292061 ) ( HAND-EMPTY ) ( not ( = ?auto_292061 ?auto_292062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292061 ?auto_292062 )
      ( !PUTDOWN ?auto_292061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_292068 - BLOCK
      ?auto_292069 - BLOCK
    )
    :vars
    (
      ?auto_292070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292068 ) ( ON ?auto_292069 ?auto_292070 ) ( CLEAR ?auto_292069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292068 ) ( not ( = ?auto_292068 ?auto_292069 ) ) ( not ( = ?auto_292068 ?auto_292070 ) ) ( not ( = ?auto_292069 ?auto_292070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292069 ?auto_292070 )
      ( !STACK ?auto_292069 ?auto_292068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_292078 - BLOCK
      ?auto_292079 - BLOCK
    )
    :vars
    (
      ?auto_292080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292079 ?auto_292080 ) ( not ( = ?auto_292078 ?auto_292079 ) ) ( not ( = ?auto_292078 ?auto_292080 ) ) ( not ( = ?auto_292079 ?auto_292080 ) ) ( ON ?auto_292078 ?auto_292079 ) ( CLEAR ?auto_292078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292078 )
      ( MAKE-2PILE ?auto_292078 ?auto_292079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_292089 - BLOCK
      ?auto_292090 - BLOCK
      ?auto_292091 - BLOCK
    )
    :vars
    (
      ?auto_292092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292090 ) ( ON ?auto_292091 ?auto_292092 ) ( CLEAR ?auto_292091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292089 ) ( ON ?auto_292090 ?auto_292089 ) ( not ( = ?auto_292089 ?auto_292090 ) ) ( not ( = ?auto_292089 ?auto_292091 ) ) ( not ( = ?auto_292089 ?auto_292092 ) ) ( not ( = ?auto_292090 ?auto_292091 ) ) ( not ( = ?auto_292090 ?auto_292092 ) ) ( not ( = ?auto_292091 ?auto_292092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292091 ?auto_292092 )
      ( !STACK ?auto_292091 ?auto_292090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_292103 - BLOCK
      ?auto_292104 - BLOCK
      ?auto_292105 - BLOCK
    )
    :vars
    (
      ?auto_292106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292105 ?auto_292106 ) ( ON-TABLE ?auto_292103 ) ( not ( = ?auto_292103 ?auto_292104 ) ) ( not ( = ?auto_292103 ?auto_292105 ) ) ( not ( = ?auto_292103 ?auto_292106 ) ) ( not ( = ?auto_292104 ?auto_292105 ) ) ( not ( = ?auto_292104 ?auto_292106 ) ) ( not ( = ?auto_292105 ?auto_292106 ) ) ( CLEAR ?auto_292103 ) ( ON ?auto_292104 ?auto_292105 ) ( CLEAR ?auto_292104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292103 ?auto_292104 )
      ( MAKE-3PILE ?auto_292103 ?auto_292104 ?auto_292105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_292117 - BLOCK
      ?auto_292118 - BLOCK
      ?auto_292119 - BLOCK
    )
    :vars
    (
      ?auto_292120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292119 ?auto_292120 ) ( not ( = ?auto_292117 ?auto_292118 ) ) ( not ( = ?auto_292117 ?auto_292119 ) ) ( not ( = ?auto_292117 ?auto_292120 ) ) ( not ( = ?auto_292118 ?auto_292119 ) ) ( not ( = ?auto_292118 ?auto_292120 ) ) ( not ( = ?auto_292119 ?auto_292120 ) ) ( ON ?auto_292118 ?auto_292119 ) ( ON ?auto_292117 ?auto_292118 ) ( CLEAR ?auto_292117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292117 )
      ( MAKE-3PILE ?auto_292117 ?auto_292118 ?auto_292119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_292132 - BLOCK
      ?auto_292133 - BLOCK
      ?auto_292134 - BLOCK
      ?auto_292135 - BLOCK
    )
    :vars
    (
      ?auto_292136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292134 ) ( ON ?auto_292135 ?auto_292136 ) ( CLEAR ?auto_292135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292132 ) ( ON ?auto_292133 ?auto_292132 ) ( ON ?auto_292134 ?auto_292133 ) ( not ( = ?auto_292132 ?auto_292133 ) ) ( not ( = ?auto_292132 ?auto_292134 ) ) ( not ( = ?auto_292132 ?auto_292135 ) ) ( not ( = ?auto_292132 ?auto_292136 ) ) ( not ( = ?auto_292133 ?auto_292134 ) ) ( not ( = ?auto_292133 ?auto_292135 ) ) ( not ( = ?auto_292133 ?auto_292136 ) ) ( not ( = ?auto_292134 ?auto_292135 ) ) ( not ( = ?auto_292134 ?auto_292136 ) ) ( not ( = ?auto_292135 ?auto_292136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292135 ?auto_292136 )
      ( !STACK ?auto_292135 ?auto_292134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_292150 - BLOCK
      ?auto_292151 - BLOCK
      ?auto_292152 - BLOCK
      ?auto_292153 - BLOCK
    )
    :vars
    (
      ?auto_292154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292153 ?auto_292154 ) ( ON-TABLE ?auto_292150 ) ( ON ?auto_292151 ?auto_292150 ) ( not ( = ?auto_292150 ?auto_292151 ) ) ( not ( = ?auto_292150 ?auto_292152 ) ) ( not ( = ?auto_292150 ?auto_292153 ) ) ( not ( = ?auto_292150 ?auto_292154 ) ) ( not ( = ?auto_292151 ?auto_292152 ) ) ( not ( = ?auto_292151 ?auto_292153 ) ) ( not ( = ?auto_292151 ?auto_292154 ) ) ( not ( = ?auto_292152 ?auto_292153 ) ) ( not ( = ?auto_292152 ?auto_292154 ) ) ( not ( = ?auto_292153 ?auto_292154 ) ) ( CLEAR ?auto_292151 ) ( ON ?auto_292152 ?auto_292153 ) ( CLEAR ?auto_292152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_292150 ?auto_292151 ?auto_292152 )
      ( MAKE-4PILE ?auto_292150 ?auto_292151 ?auto_292152 ?auto_292153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_292168 - BLOCK
      ?auto_292169 - BLOCK
      ?auto_292170 - BLOCK
      ?auto_292171 - BLOCK
    )
    :vars
    (
      ?auto_292172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292171 ?auto_292172 ) ( ON-TABLE ?auto_292168 ) ( not ( = ?auto_292168 ?auto_292169 ) ) ( not ( = ?auto_292168 ?auto_292170 ) ) ( not ( = ?auto_292168 ?auto_292171 ) ) ( not ( = ?auto_292168 ?auto_292172 ) ) ( not ( = ?auto_292169 ?auto_292170 ) ) ( not ( = ?auto_292169 ?auto_292171 ) ) ( not ( = ?auto_292169 ?auto_292172 ) ) ( not ( = ?auto_292170 ?auto_292171 ) ) ( not ( = ?auto_292170 ?auto_292172 ) ) ( not ( = ?auto_292171 ?auto_292172 ) ) ( ON ?auto_292170 ?auto_292171 ) ( CLEAR ?auto_292168 ) ( ON ?auto_292169 ?auto_292170 ) ( CLEAR ?auto_292169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292168 ?auto_292169 )
      ( MAKE-4PILE ?auto_292168 ?auto_292169 ?auto_292170 ?auto_292171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_292186 - BLOCK
      ?auto_292187 - BLOCK
      ?auto_292188 - BLOCK
      ?auto_292189 - BLOCK
    )
    :vars
    (
      ?auto_292190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292189 ?auto_292190 ) ( not ( = ?auto_292186 ?auto_292187 ) ) ( not ( = ?auto_292186 ?auto_292188 ) ) ( not ( = ?auto_292186 ?auto_292189 ) ) ( not ( = ?auto_292186 ?auto_292190 ) ) ( not ( = ?auto_292187 ?auto_292188 ) ) ( not ( = ?auto_292187 ?auto_292189 ) ) ( not ( = ?auto_292187 ?auto_292190 ) ) ( not ( = ?auto_292188 ?auto_292189 ) ) ( not ( = ?auto_292188 ?auto_292190 ) ) ( not ( = ?auto_292189 ?auto_292190 ) ) ( ON ?auto_292188 ?auto_292189 ) ( ON ?auto_292187 ?auto_292188 ) ( ON ?auto_292186 ?auto_292187 ) ( CLEAR ?auto_292186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292186 )
      ( MAKE-4PILE ?auto_292186 ?auto_292187 ?auto_292188 ?auto_292189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_292205 - BLOCK
      ?auto_292206 - BLOCK
      ?auto_292207 - BLOCK
      ?auto_292208 - BLOCK
      ?auto_292209 - BLOCK
    )
    :vars
    (
      ?auto_292210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292208 ) ( ON ?auto_292209 ?auto_292210 ) ( CLEAR ?auto_292209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292205 ) ( ON ?auto_292206 ?auto_292205 ) ( ON ?auto_292207 ?auto_292206 ) ( ON ?auto_292208 ?auto_292207 ) ( not ( = ?auto_292205 ?auto_292206 ) ) ( not ( = ?auto_292205 ?auto_292207 ) ) ( not ( = ?auto_292205 ?auto_292208 ) ) ( not ( = ?auto_292205 ?auto_292209 ) ) ( not ( = ?auto_292205 ?auto_292210 ) ) ( not ( = ?auto_292206 ?auto_292207 ) ) ( not ( = ?auto_292206 ?auto_292208 ) ) ( not ( = ?auto_292206 ?auto_292209 ) ) ( not ( = ?auto_292206 ?auto_292210 ) ) ( not ( = ?auto_292207 ?auto_292208 ) ) ( not ( = ?auto_292207 ?auto_292209 ) ) ( not ( = ?auto_292207 ?auto_292210 ) ) ( not ( = ?auto_292208 ?auto_292209 ) ) ( not ( = ?auto_292208 ?auto_292210 ) ) ( not ( = ?auto_292209 ?auto_292210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292209 ?auto_292210 )
      ( !STACK ?auto_292209 ?auto_292208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_292227 - BLOCK
      ?auto_292228 - BLOCK
      ?auto_292229 - BLOCK
      ?auto_292230 - BLOCK
      ?auto_292231 - BLOCK
    )
    :vars
    (
      ?auto_292232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292231 ?auto_292232 ) ( ON-TABLE ?auto_292227 ) ( ON ?auto_292228 ?auto_292227 ) ( ON ?auto_292229 ?auto_292228 ) ( not ( = ?auto_292227 ?auto_292228 ) ) ( not ( = ?auto_292227 ?auto_292229 ) ) ( not ( = ?auto_292227 ?auto_292230 ) ) ( not ( = ?auto_292227 ?auto_292231 ) ) ( not ( = ?auto_292227 ?auto_292232 ) ) ( not ( = ?auto_292228 ?auto_292229 ) ) ( not ( = ?auto_292228 ?auto_292230 ) ) ( not ( = ?auto_292228 ?auto_292231 ) ) ( not ( = ?auto_292228 ?auto_292232 ) ) ( not ( = ?auto_292229 ?auto_292230 ) ) ( not ( = ?auto_292229 ?auto_292231 ) ) ( not ( = ?auto_292229 ?auto_292232 ) ) ( not ( = ?auto_292230 ?auto_292231 ) ) ( not ( = ?auto_292230 ?auto_292232 ) ) ( not ( = ?auto_292231 ?auto_292232 ) ) ( CLEAR ?auto_292229 ) ( ON ?auto_292230 ?auto_292231 ) ( CLEAR ?auto_292230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_292227 ?auto_292228 ?auto_292229 ?auto_292230 )
      ( MAKE-5PILE ?auto_292227 ?auto_292228 ?auto_292229 ?auto_292230 ?auto_292231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_292249 - BLOCK
      ?auto_292250 - BLOCK
      ?auto_292251 - BLOCK
      ?auto_292252 - BLOCK
      ?auto_292253 - BLOCK
    )
    :vars
    (
      ?auto_292254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292253 ?auto_292254 ) ( ON-TABLE ?auto_292249 ) ( ON ?auto_292250 ?auto_292249 ) ( not ( = ?auto_292249 ?auto_292250 ) ) ( not ( = ?auto_292249 ?auto_292251 ) ) ( not ( = ?auto_292249 ?auto_292252 ) ) ( not ( = ?auto_292249 ?auto_292253 ) ) ( not ( = ?auto_292249 ?auto_292254 ) ) ( not ( = ?auto_292250 ?auto_292251 ) ) ( not ( = ?auto_292250 ?auto_292252 ) ) ( not ( = ?auto_292250 ?auto_292253 ) ) ( not ( = ?auto_292250 ?auto_292254 ) ) ( not ( = ?auto_292251 ?auto_292252 ) ) ( not ( = ?auto_292251 ?auto_292253 ) ) ( not ( = ?auto_292251 ?auto_292254 ) ) ( not ( = ?auto_292252 ?auto_292253 ) ) ( not ( = ?auto_292252 ?auto_292254 ) ) ( not ( = ?auto_292253 ?auto_292254 ) ) ( ON ?auto_292252 ?auto_292253 ) ( CLEAR ?auto_292250 ) ( ON ?auto_292251 ?auto_292252 ) ( CLEAR ?auto_292251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_292249 ?auto_292250 ?auto_292251 )
      ( MAKE-5PILE ?auto_292249 ?auto_292250 ?auto_292251 ?auto_292252 ?auto_292253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_292271 - BLOCK
      ?auto_292272 - BLOCK
      ?auto_292273 - BLOCK
      ?auto_292274 - BLOCK
      ?auto_292275 - BLOCK
    )
    :vars
    (
      ?auto_292276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292275 ?auto_292276 ) ( ON-TABLE ?auto_292271 ) ( not ( = ?auto_292271 ?auto_292272 ) ) ( not ( = ?auto_292271 ?auto_292273 ) ) ( not ( = ?auto_292271 ?auto_292274 ) ) ( not ( = ?auto_292271 ?auto_292275 ) ) ( not ( = ?auto_292271 ?auto_292276 ) ) ( not ( = ?auto_292272 ?auto_292273 ) ) ( not ( = ?auto_292272 ?auto_292274 ) ) ( not ( = ?auto_292272 ?auto_292275 ) ) ( not ( = ?auto_292272 ?auto_292276 ) ) ( not ( = ?auto_292273 ?auto_292274 ) ) ( not ( = ?auto_292273 ?auto_292275 ) ) ( not ( = ?auto_292273 ?auto_292276 ) ) ( not ( = ?auto_292274 ?auto_292275 ) ) ( not ( = ?auto_292274 ?auto_292276 ) ) ( not ( = ?auto_292275 ?auto_292276 ) ) ( ON ?auto_292274 ?auto_292275 ) ( ON ?auto_292273 ?auto_292274 ) ( CLEAR ?auto_292271 ) ( ON ?auto_292272 ?auto_292273 ) ( CLEAR ?auto_292272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292271 ?auto_292272 )
      ( MAKE-5PILE ?auto_292271 ?auto_292272 ?auto_292273 ?auto_292274 ?auto_292275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_292293 - BLOCK
      ?auto_292294 - BLOCK
      ?auto_292295 - BLOCK
      ?auto_292296 - BLOCK
      ?auto_292297 - BLOCK
    )
    :vars
    (
      ?auto_292298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292297 ?auto_292298 ) ( not ( = ?auto_292293 ?auto_292294 ) ) ( not ( = ?auto_292293 ?auto_292295 ) ) ( not ( = ?auto_292293 ?auto_292296 ) ) ( not ( = ?auto_292293 ?auto_292297 ) ) ( not ( = ?auto_292293 ?auto_292298 ) ) ( not ( = ?auto_292294 ?auto_292295 ) ) ( not ( = ?auto_292294 ?auto_292296 ) ) ( not ( = ?auto_292294 ?auto_292297 ) ) ( not ( = ?auto_292294 ?auto_292298 ) ) ( not ( = ?auto_292295 ?auto_292296 ) ) ( not ( = ?auto_292295 ?auto_292297 ) ) ( not ( = ?auto_292295 ?auto_292298 ) ) ( not ( = ?auto_292296 ?auto_292297 ) ) ( not ( = ?auto_292296 ?auto_292298 ) ) ( not ( = ?auto_292297 ?auto_292298 ) ) ( ON ?auto_292296 ?auto_292297 ) ( ON ?auto_292295 ?auto_292296 ) ( ON ?auto_292294 ?auto_292295 ) ( ON ?auto_292293 ?auto_292294 ) ( CLEAR ?auto_292293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292293 )
      ( MAKE-5PILE ?auto_292293 ?auto_292294 ?auto_292295 ?auto_292296 ?auto_292297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292316 - BLOCK
      ?auto_292317 - BLOCK
      ?auto_292318 - BLOCK
      ?auto_292319 - BLOCK
      ?auto_292320 - BLOCK
      ?auto_292321 - BLOCK
    )
    :vars
    (
      ?auto_292322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292320 ) ( ON ?auto_292321 ?auto_292322 ) ( CLEAR ?auto_292321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292316 ) ( ON ?auto_292317 ?auto_292316 ) ( ON ?auto_292318 ?auto_292317 ) ( ON ?auto_292319 ?auto_292318 ) ( ON ?auto_292320 ?auto_292319 ) ( not ( = ?auto_292316 ?auto_292317 ) ) ( not ( = ?auto_292316 ?auto_292318 ) ) ( not ( = ?auto_292316 ?auto_292319 ) ) ( not ( = ?auto_292316 ?auto_292320 ) ) ( not ( = ?auto_292316 ?auto_292321 ) ) ( not ( = ?auto_292316 ?auto_292322 ) ) ( not ( = ?auto_292317 ?auto_292318 ) ) ( not ( = ?auto_292317 ?auto_292319 ) ) ( not ( = ?auto_292317 ?auto_292320 ) ) ( not ( = ?auto_292317 ?auto_292321 ) ) ( not ( = ?auto_292317 ?auto_292322 ) ) ( not ( = ?auto_292318 ?auto_292319 ) ) ( not ( = ?auto_292318 ?auto_292320 ) ) ( not ( = ?auto_292318 ?auto_292321 ) ) ( not ( = ?auto_292318 ?auto_292322 ) ) ( not ( = ?auto_292319 ?auto_292320 ) ) ( not ( = ?auto_292319 ?auto_292321 ) ) ( not ( = ?auto_292319 ?auto_292322 ) ) ( not ( = ?auto_292320 ?auto_292321 ) ) ( not ( = ?auto_292320 ?auto_292322 ) ) ( not ( = ?auto_292321 ?auto_292322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292321 ?auto_292322 )
      ( !STACK ?auto_292321 ?auto_292320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292342 - BLOCK
      ?auto_292343 - BLOCK
      ?auto_292344 - BLOCK
      ?auto_292345 - BLOCK
      ?auto_292346 - BLOCK
      ?auto_292347 - BLOCK
    )
    :vars
    (
      ?auto_292348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292347 ?auto_292348 ) ( ON-TABLE ?auto_292342 ) ( ON ?auto_292343 ?auto_292342 ) ( ON ?auto_292344 ?auto_292343 ) ( ON ?auto_292345 ?auto_292344 ) ( not ( = ?auto_292342 ?auto_292343 ) ) ( not ( = ?auto_292342 ?auto_292344 ) ) ( not ( = ?auto_292342 ?auto_292345 ) ) ( not ( = ?auto_292342 ?auto_292346 ) ) ( not ( = ?auto_292342 ?auto_292347 ) ) ( not ( = ?auto_292342 ?auto_292348 ) ) ( not ( = ?auto_292343 ?auto_292344 ) ) ( not ( = ?auto_292343 ?auto_292345 ) ) ( not ( = ?auto_292343 ?auto_292346 ) ) ( not ( = ?auto_292343 ?auto_292347 ) ) ( not ( = ?auto_292343 ?auto_292348 ) ) ( not ( = ?auto_292344 ?auto_292345 ) ) ( not ( = ?auto_292344 ?auto_292346 ) ) ( not ( = ?auto_292344 ?auto_292347 ) ) ( not ( = ?auto_292344 ?auto_292348 ) ) ( not ( = ?auto_292345 ?auto_292346 ) ) ( not ( = ?auto_292345 ?auto_292347 ) ) ( not ( = ?auto_292345 ?auto_292348 ) ) ( not ( = ?auto_292346 ?auto_292347 ) ) ( not ( = ?auto_292346 ?auto_292348 ) ) ( not ( = ?auto_292347 ?auto_292348 ) ) ( CLEAR ?auto_292345 ) ( ON ?auto_292346 ?auto_292347 ) ( CLEAR ?auto_292346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_292342 ?auto_292343 ?auto_292344 ?auto_292345 ?auto_292346 )
      ( MAKE-6PILE ?auto_292342 ?auto_292343 ?auto_292344 ?auto_292345 ?auto_292346 ?auto_292347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292368 - BLOCK
      ?auto_292369 - BLOCK
      ?auto_292370 - BLOCK
      ?auto_292371 - BLOCK
      ?auto_292372 - BLOCK
      ?auto_292373 - BLOCK
    )
    :vars
    (
      ?auto_292374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292373 ?auto_292374 ) ( ON-TABLE ?auto_292368 ) ( ON ?auto_292369 ?auto_292368 ) ( ON ?auto_292370 ?auto_292369 ) ( not ( = ?auto_292368 ?auto_292369 ) ) ( not ( = ?auto_292368 ?auto_292370 ) ) ( not ( = ?auto_292368 ?auto_292371 ) ) ( not ( = ?auto_292368 ?auto_292372 ) ) ( not ( = ?auto_292368 ?auto_292373 ) ) ( not ( = ?auto_292368 ?auto_292374 ) ) ( not ( = ?auto_292369 ?auto_292370 ) ) ( not ( = ?auto_292369 ?auto_292371 ) ) ( not ( = ?auto_292369 ?auto_292372 ) ) ( not ( = ?auto_292369 ?auto_292373 ) ) ( not ( = ?auto_292369 ?auto_292374 ) ) ( not ( = ?auto_292370 ?auto_292371 ) ) ( not ( = ?auto_292370 ?auto_292372 ) ) ( not ( = ?auto_292370 ?auto_292373 ) ) ( not ( = ?auto_292370 ?auto_292374 ) ) ( not ( = ?auto_292371 ?auto_292372 ) ) ( not ( = ?auto_292371 ?auto_292373 ) ) ( not ( = ?auto_292371 ?auto_292374 ) ) ( not ( = ?auto_292372 ?auto_292373 ) ) ( not ( = ?auto_292372 ?auto_292374 ) ) ( not ( = ?auto_292373 ?auto_292374 ) ) ( ON ?auto_292372 ?auto_292373 ) ( CLEAR ?auto_292370 ) ( ON ?auto_292371 ?auto_292372 ) ( CLEAR ?auto_292371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_292368 ?auto_292369 ?auto_292370 ?auto_292371 )
      ( MAKE-6PILE ?auto_292368 ?auto_292369 ?auto_292370 ?auto_292371 ?auto_292372 ?auto_292373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292394 - BLOCK
      ?auto_292395 - BLOCK
      ?auto_292396 - BLOCK
      ?auto_292397 - BLOCK
      ?auto_292398 - BLOCK
      ?auto_292399 - BLOCK
    )
    :vars
    (
      ?auto_292400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292399 ?auto_292400 ) ( ON-TABLE ?auto_292394 ) ( ON ?auto_292395 ?auto_292394 ) ( not ( = ?auto_292394 ?auto_292395 ) ) ( not ( = ?auto_292394 ?auto_292396 ) ) ( not ( = ?auto_292394 ?auto_292397 ) ) ( not ( = ?auto_292394 ?auto_292398 ) ) ( not ( = ?auto_292394 ?auto_292399 ) ) ( not ( = ?auto_292394 ?auto_292400 ) ) ( not ( = ?auto_292395 ?auto_292396 ) ) ( not ( = ?auto_292395 ?auto_292397 ) ) ( not ( = ?auto_292395 ?auto_292398 ) ) ( not ( = ?auto_292395 ?auto_292399 ) ) ( not ( = ?auto_292395 ?auto_292400 ) ) ( not ( = ?auto_292396 ?auto_292397 ) ) ( not ( = ?auto_292396 ?auto_292398 ) ) ( not ( = ?auto_292396 ?auto_292399 ) ) ( not ( = ?auto_292396 ?auto_292400 ) ) ( not ( = ?auto_292397 ?auto_292398 ) ) ( not ( = ?auto_292397 ?auto_292399 ) ) ( not ( = ?auto_292397 ?auto_292400 ) ) ( not ( = ?auto_292398 ?auto_292399 ) ) ( not ( = ?auto_292398 ?auto_292400 ) ) ( not ( = ?auto_292399 ?auto_292400 ) ) ( ON ?auto_292398 ?auto_292399 ) ( ON ?auto_292397 ?auto_292398 ) ( CLEAR ?auto_292395 ) ( ON ?auto_292396 ?auto_292397 ) ( CLEAR ?auto_292396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_292394 ?auto_292395 ?auto_292396 )
      ( MAKE-6PILE ?auto_292394 ?auto_292395 ?auto_292396 ?auto_292397 ?auto_292398 ?auto_292399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292420 - BLOCK
      ?auto_292421 - BLOCK
      ?auto_292422 - BLOCK
      ?auto_292423 - BLOCK
      ?auto_292424 - BLOCK
      ?auto_292425 - BLOCK
    )
    :vars
    (
      ?auto_292426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292425 ?auto_292426 ) ( ON-TABLE ?auto_292420 ) ( not ( = ?auto_292420 ?auto_292421 ) ) ( not ( = ?auto_292420 ?auto_292422 ) ) ( not ( = ?auto_292420 ?auto_292423 ) ) ( not ( = ?auto_292420 ?auto_292424 ) ) ( not ( = ?auto_292420 ?auto_292425 ) ) ( not ( = ?auto_292420 ?auto_292426 ) ) ( not ( = ?auto_292421 ?auto_292422 ) ) ( not ( = ?auto_292421 ?auto_292423 ) ) ( not ( = ?auto_292421 ?auto_292424 ) ) ( not ( = ?auto_292421 ?auto_292425 ) ) ( not ( = ?auto_292421 ?auto_292426 ) ) ( not ( = ?auto_292422 ?auto_292423 ) ) ( not ( = ?auto_292422 ?auto_292424 ) ) ( not ( = ?auto_292422 ?auto_292425 ) ) ( not ( = ?auto_292422 ?auto_292426 ) ) ( not ( = ?auto_292423 ?auto_292424 ) ) ( not ( = ?auto_292423 ?auto_292425 ) ) ( not ( = ?auto_292423 ?auto_292426 ) ) ( not ( = ?auto_292424 ?auto_292425 ) ) ( not ( = ?auto_292424 ?auto_292426 ) ) ( not ( = ?auto_292425 ?auto_292426 ) ) ( ON ?auto_292424 ?auto_292425 ) ( ON ?auto_292423 ?auto_292424 ) ( ON ?auto_292422 ?auto_292423 ) ( CLEAR ?auto_292420 ) ( ON ?auto_292421 ?auto_292422 ) ( CLEAR ?auto_292421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292420 ?auto_292421 )
      ( MAKE-6PILE ?auto_292420 ?auto_292421 ?auto_292422 ?auto_292423 ?auto_292424 ?auto_292425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_292446 - BLOCK
      ?auto_292447 - BLOCK
      ?auto_292448 - BLOCK
      ?auto_292449 - BLOCK
      ?auto_292450 - BLOCK
      ?auto_292451 - BLOCK
    )
    :vars
    (
      ?auto_292452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292451 ?auto_292452 ) ( not ( = ?auto_292446 ?auto_292447 ) ) ( not ( = ?auto_292446 ?auto_292448 ) ) ( not ( = ?auto_292446 ?auto_292449 ) ) ( not ( = ?auto_292446 ?auto_292450 ) ) ( not ( = ?auto_292446 ?auto_292451 ) ) ( not ( = ?auto_292446 ?auto_292452 ) ) ( not ( = ?auto_292447 ?auto_292448 ) ) ( not ( = ?auto_292447 ?auto_292449 ) ) ( not ( = ?auto_292447 ?auto_292450 ) ) ( not ( = ?auto_292447 ?auto_292451 ) ) ( not ( = ?auto_292447 ?auto_292452 ) ) ( not ( = ?auto_292448 ?auto_292449 ) ) ( not ( = ?auto_292448 ?auto_292450 ) ) ( not ( = ?auto_292448 ?auto_292451 ) ) ( not ( = ?auto_292448 ?auto_292452 ) ) ( not ( = ?auto_292449 ?auto_292450 ) ) ( not ( = ?auto_292449 ?auto_292451 ) ) ( not ( = ?auto_292449 ?auto_292452 ) ) ( not ( = ?auto_292450 ?auto_292451 ) ) ( not ( = ?auto_292450 ?auto_292452 ) ) ( not ( = ?auto_292451 ?auto_292452 ) ) ( ON ?auto_292450 ?auto_292451 ) ( ON ?auto_292449 ?auto_292450 ) ( ON ?auto_292448 ?auto_292449 ) ( ON ?auto_292447 ?auto_292448 ) ( ON ?auto_292446 ?auto_292447 ) ( CLEAR ?auto_292446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292446 )
      ( MAKE-6PILE ?auto_292446 ?auto_292447 ?auto_292448 ?auto_292449 ?auto_292450 ?auto_292451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292473 - BLOCK
      ?auto_292474 - BLOCK
      ?auto_292475 - BLOCK
      ?auto_292476 - BLOCK
      ?auto_292477 - BLOCK
      ?auto_292478 - BLOCK
      ?auto_292479 - BLOCK
    )
    :vars
    (
      ?auto_292480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292478 ) ( ON ?auto_292479 ?auto_292480 ) ( CLEAR ?auto_292479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292473 ) ( ON ?auto_292474 ?auto_292473 ) ( ON ?auto_292475 ?auto_292474 ) ( ON ?auto_292476 ?auto_292475 ) ( ON ?auto_292477 ?auto_292476 ) ( ON ?auto_292478 ?auto_292477 ) ( not ( = ?auto_292473 ?auto_292474 ) ) ( not ( = ?auto_292473 ?auto_292475 ) ) ( not ( = ?auto_292473 ?auto_292476 ) ) ( not ( = ?auto_292473 ?auto_292477 ) ) ( not ( = ?auto_292473 ?auto_292478 ) ) ( not ( = ?auto_292473 ?auto_292479 ) ) ( not ( = ?auto_292473 ?auto_292480 ) ) ( not ( = ?auto_292474 ?auto_292475 ) ) ( not ( = ?auto_292474 ?auto_292476 ) ) ( not ( = ?auto_292474 ?auto_292477 ) ) ( not ( = ?auto_292474 ?auto_292478 ) ) ( not ( = ?auto_292474 ?auto_292479 ) ) ( not ( = ?auto_292474 ?auto_292480 ) ) ( not ( = ?auto_292475 ?auto_292476 ) ) ( not ( = ?auto_292475 ?auto_292477 ) ) ( not ( = ?auto_292475 ?auto_292478 ) ) ( not ( = ?auto_292475 ?auto_292479 ) ) ( not ( = ?auto_292475 ?auto_292480 ) ) ( not ( = ?auto_292476 ?auto_292477 ) ) ( not ( = ?auto_292476 ?auto_292478 ) ) ( not ( = ?auto_292476 ?auto_292479 ) ) ( not ( = ?auto_292476 ?auto_292480 ) ) ( not ( = ?auto_292477 ?auto_292478 ) ) ( not ( = ?auto_292477 ?auto_292479 ) ) ( not ( = ?auto_292477 ?auto_292480 ) ) ( not ( = ?auto_292478 ?auto_292479 ) ) ( not ( = ?auto_292478 ?auto_292480 ) ) ( not ( = ?auto_292479 ?auto_292480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292479 ?auto_292480 )
      ( !STACK ?auto_292479 ?auto_292478 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292503 - BLOCK
      ?auto_292504 - BLOCK
      ?auto_292505 - BLOCK
      ?auto_292506 - BLOCK
      ?auto_292507 - BLOCK
      ?auto_292508 - BLOCK
      ?auto_292509 - BLOCK
    )
    :vars
    (
      ?auto_292510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292509 ?auto_292510 ) ( ON-TABLE ?auto_292503 ) ( ON ?auto_292504 ?auto_292503 ) ( ON ?auto_292505 ?auto_292504 ) ( ON ?auto_292506 ?auto_292505 ) ( ON ?auto_292507 ?auto_292506 ) ( not ( = ?auto_292503 ?auto_292504 ) ) ( not ( = ?auto_292503 ?auto_292505 ) ) ( not ( = ?auto_292503 ?auto_292506 ) ) ( not ( = ?auto_292503 ?auto_292507 ) ) ( not ( = ?auto_292503 ?auto_292508 ) ) ( not ( = ?auto_292503 ?auto_292509 ) ) ( not ( = ?auto_292503 ?auto_292510 ) ) ( not ( = ?auto_292504 ?auto_292505 ) ) ( not ( = ?auto_292504 ?auto_292506 ) ) ( not ( = ?auto_292504 ?auto_292507 ) ) ( not ( = ?auto_292504 ?auto_292508 ) ) ( not ( = ?auto_292504 ?auto_292509 ) ) ( not ( = ?auto_292504 ?auto_292510 ) ) ( not ( = ?auto_292505 ?auto_292506 ) ) ( not ( = ?auto_292505 ?auto_292507 ) ) ( not ( = ?auto_292505 ?auto_292508 ) ) ( not ( = ?auto_292505 ?auto_292509 ) ) ( not ( = ?auto_292505 ?auto_292510 ) ) ( not ( = ?auto_292506 ?auto_292507 ) ) ( not ( = ?auto_292506 ?auto_292508 ) ) ( not ( = ?auto_292506 ?auto_292509 ) ) ( not ( = ?auto_292506 ?auto_292510 ) ) ( not ( = ?auto_292507 ?auto_292508 ) ) ( not ( = ?auto_292507 ?auto_292509 ) ) ( not ( = ?auto_292507 ?auto_292510 ) ) ( not ( = ?auto_292508 ?auto_292509 ) ) ( not ( = ?auto_292508 ?auto_292510 ) ) ( not ( = ?auto_292509 ?auto_292510 ) ) ( CLEAR ?auto_292507 ) ( ON ?auto_292508 ?auto_292509 ) ( CLEAR ?auto_292508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_292503 ?auto_292504 ?auto_292505 ?auto_292506 ?auto_292507 ?auto_292508 )
      ( MAKE-7PILE ?auto_292503 ?auto_292504 ?auto_292505 ?auto_292506 ?auto_292507 ?auto_292508 ?auto_292509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292533 - BLOCK
      ?auto_292534 - BLOCK
      ?auto_292535 - BLOCK
      ?auto_292536 - BLOCK
      ?auto_292537 - BLOCK
      ?auto_292538 - BLOCK
      ?auto_292539 - BLOCK
    )
    :vars
    (
      ?auto_292540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292539 ?auto_292540 ) ( ON-TABLE ?auto_292533 ) ( ON ?auto_292534 ?auto_292533 ) ( ON ?auto_292535 ?auto_292534 ) ( ON ?auto_292536 ?auto_292535 ) ( not ( = ?auto_292533 ?auto_292534 ) ) ( not ( = ?auto_292533 ?auto_292535 ) ) ( not ( = ?auto_292533 ?auto_292536 ) ) ( not ( = ?auto_292533 ?auto_292537 ) ) ( not ( = ?auto_292533 ?auto_292538 ) ) ( not ( = ?auto_292533 ?auto_292539 ) ) ( not ( = ?auto_292533 ?auto_292540 ) ) ( not ( = ?auto_292534 ?auto_292535 ) ) ( not ( = ?auto_292534 ?auto_292536 ) ) ( not ( = ?auto_292534 ?auto_292537 ) ) ( not ( = ?auto_292534 ?auto_292538 ) ) ( not ( = ?auto_292534 ?auto_292539 ) ) ( not ( = ?auto_292534 ?auto_292540 ) ) ( not ( = ?auto_292535 ?auto_292536 ) ) ( not ( = ?auto_292535 ?auto_292537 ) ) ( not ( = ?auto_292535 ?auto_292538 ) ) ( not ( = ?auto_292535 ?auto_292539 ) ) ( not ( = ?auto_292535 ?auto_292540 ) ) ( not ( = ?auto_292536 ?auto_292537 ) ) ( not ( = ?auto_292536 ?auto_292538 ) ) ( not ( = ?auto_292536 ?auto_292539 ) ) ( not ( = ?auto_292536 ?auto_292540 ) ) ( not ( = ?auto_292537 ?auto_292538 ) ) ( not ( = ?auto_292537 ?auto_292539 ) ) ( not ( = ?auto_292537 ?auto_292540 ) ) ( not ( = ?auto_292538 ?auto_292539 ) ) ( not ( = ?auto_292538 ?auto_292540 ) ) ( not ( = ?auto_292539 ?auto_292540 ) ) ( ON ?auto_292538 ?auto_292539 ) ( CLEAR ?auto_292536 ) ( ON ?auto_292537 ?auto_292538 ) ( CLEAR ?auto_292537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_292533 ?auto_292534 ?auto_292535 ?auto_292536 ?auto_292537 )
      ( MAKE-7PILE ?auto_292533 ?auto_292534 ?auto_292535 ?auto_292536 ?auto_292537 ?auto_292538 ?auto_292539 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292563 - BLOCK
      ?auto_292564 - BLOCK
      ?auto_292565 - BLOCK
      ?auto_292566 - BLOCK
      ?auto_292567 - BLOCK
      ?auto_292568 - BLOCK
      ?auto_292569 - BLOCK
    )
    :vars
    (
      ?auto_292570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292569 ?auto_292570 ) ( ON-TABLE ?auto_292563 ) ( ON ?auto_292564 ?auto_292563 ) ( ON ?auto_292565 ?auto_292564 ) ( not ( = ?auto_292563 ?auto_292564 ) ) ( not ( = ?auto_292563 ?auto_292565 ) ) ( not ( = ?auto_292563 ?auto_292566 ) ) ( not ( = ?auto_292563 ?auto_292567 ) ) ( not ( = ?auto_292563 ?auto_292568 ) ) ( not ( = ?auto_292563 ?auto_292569 ) ) ( not ( = ?auto_292563 ?auto_292570 ) ) ( not ( = ?auto_292564 ?auto_292565 ) ) ( not ( = ?auto_292564 ?auto_292566 ) ) ( not ( = ?auto_292564 ?auto_292567 ) ) ( not ( = ?auto_292564 ?auto_292568 ) ) ( not ( = ?auto_292564 ?auto_292569 ) ) ( not ( = ?auto_292564 ?auto_292570 ) ) ( not ( = ?auto_292565 ?auto_292566 ) ) ( not ( = ?auto_292565 ?auto_292567 ) ) ( not ( = ?auto_292565 ?auto_292568 ) ) ( not ( = ?auto_292565 ?auto_292569 ) ) ( not ( = ?auto_292565 ?auto_292570 ) ) ( not ( = ?auto_292566 ?auto_292567 ) ) ( not ( = ?auto_292566 ?auto_292568 ) ) ( not ( = ?auto_292566 ?auto_292569 ) ) ( not ( = ?auto_292566 ?auto_292570 ) ) ( not ( = ?auto_292567 ?auto_292568 ) ) ( not ( = ?auto_292567 ?auto_292569 ) ) ( not ( = ?auto_292567 ?auto_292570 ) ) ( not ( = ?auto_292568 ?auto_292569 ) ) ( not ( = ?auto_292568 ?auto_292570 ) ) ( not ( = ?auto_292569 ?auto_292570 ) ) ( ON ?auto_292568 ?auto_292569 ) ( ON ?auto_292567 ?auto_292568 ) ( CLEAR ?auto_292565 ) ( ON ?auto_292566 ?auto_292567 ) ( CLEAR ?auto_292566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_292563 ?auto_292564 ?auto_292565 ?auto_292566 )
      ( MAKE-7PILE ?auto_292563 ?auto_292564 ?auto_292565 ?auto_292566 ?auto_292567 ?auto_292568 ?auto_292569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292593 - BLOCK
      ?auto_292594 - BLOCK
      ?auto_292595 - BLOCK
      ?auto_292596 - BLOCK
      ?auto_292597 - BLOCK
      ?auto_292598 - BLOCK
      ?auto_292599 - BLOCK
    )
    :vars
    (
      ?auto_292600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292599 ?auto_292600 ) ( ON-TABLE ?auto_292593 ) ( ON ?auto_292594 ?auto_292593 ) ( not ( = ?auto_292593 ?auto_292594 ) ) ( not ( = ?auto_292593 ?auto_292595 ) ) ( not ( = ?auto_292593 ?auto_292596 ) ) ( not ( = ?auto_292593 ?auto_292597 ) ) ( not ( = ?auto_292593 ?auto_292598 ) ) ( not ( = ?auto_292593 ?auto_292599 ) ) ( not ( = ?auto_292593 ?auto_292600 ) ) ( not ( = ?auto_292594 ?auto_292595 ) ) ( not ( = ?auto_292594 ?auto_292596 ) ) ( not ( = ?auto_292594 ?auto_292597 ) ) ( not ( = ?auto_292594 ?auto_292598 ) ) ( not ( = ?auto_292594 ?auto_292599 ) ) ( not ( = ?auto_292594 ?auto_292600 ) ) ( not ( = ?auto_292595 ?auto_292596 ) ) ( not ( = ?auto_292595 ?auto_292597 ) ) ( not ( = ?auto_292595 ?auto_292598 ) ) ( not ( = ?auto_292595 ?auto_292599 ) ) ( not ( = ?auto_292595 ?auto_292600 ) ) ( not ( = ?auto_292596 ?auto_292597 ) ) ( not ( = ?auto_292596 ?auto_292598 ) ) ( not ( = ?auto_292596 ?auto_292599 ) ) ( not ( = ?auto_292596 ?auto_292600 ) ) ( not ( = ?auto_292597 ?auto_292598 ) ) ( not ( = ?auto_292597 ?auto_292599 ) ) ( not ( = ?auto_292597 ?auto_292600 ) ) ( not ( = ?auto_292598 ?auto_292599 ) ) ( not ( = ?auto_292598 ?auto_292600 ) ) ( not ( = ?auto_292599 ?auto_292600 ) ) ( ON ?auto_292598 ?auto_292599 ) ( ON ?auto_292597 ?auto_292598 ) ( ON ?auto_292596 ?auto_292597 ) ( CLEAR ?auto_292594 ) ( ON ?auto_292595 ?auto_292596 ) ( CLEAR ?auto_292595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_292593 ?auto_292594 ?auto_292595 )
      ( MAKE-7PILE ?auto_292593 ?auto_292594 ?auto_292595 ?auto_292596 ?auto_292597 ?auto_292598 ?auto_292599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292623 - BLOCK
      ?auto_292624 - BLOCK
      ?auto_292625 - BLOCK
      ?auto_292626 - BLOCK
      ?auto_292627 - BLOCK
      ?auto_292628 - BLOCK
      ?auto_292629 - BLOCK
    )
    :vars
    (
      ?auto_292630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292629 ?auto_292630 ) ( ON-TABLE ?auto_292623 ) ( not ( = ?auto_292623 ?auto_292624 ) ) ( not ( = ?auto_292623 ?auto_292625 ) ) ( not ( = ?auto_292623 ?auto_292626 ) ) ( not ( = ?auto_292623 ?auto_292627 ) ) ( not ( = ?auto_292623 ?auto_292628 ) ) ( not ( = ?auto_292623 ?auto_292629 ) ) ( not ( = ?auto_292623 ?auto_292630 ) ) ( not ( = ?auto_292624 ?auto_292625 ) ) ( not ( = ?auto_292624 ?auto_292626 ) ) ( not ( = ?auto_292624 ?auto_292627 ) ) ( not ( = ?auto_292624 ?auto_292628 ) ) ( not ( = ?auto_292624 ?auto_292629 ) ) ( not ( = ?auto_292624 ?auto_292630 ) ) ( not ( = ?auto_292625 ?auto_292626 ) ) ( not ( = ?auto_292625 ?auto_292627 ) ) ( not ( = ?auto_292625 ?auto_292628 ) ) ( not ( = ?auto_292625 ?auto_292629 ) ) ( not ( = ?auto_292625 ?auto_292630 ) ) ( not ( = ?auto_292626 ?auto_292627 ) ) ( not ( = ?auto_292626 ?auto_292628 ) ) ( not ( = ?auto_292626 ?auto_292629 ) ) ( not ( = ?auto_292626 ?auto_292630 ) ) ( not ( = ?auto_292627 ?auto_292628 ) ) ( not ( = ?auto_292627 ?auto_292629 ) ) ( not ( = ?auto_292627 ?auto_292630 ) ) ( not ( = ?auto_292628 ?auto_292629 ) ) ( not ( = ?auto_292628 ?auto_292630 ) ) ( not ( = ?auto_292629 ?auto_292630 ) ) ( ON ?auto_292628 ?auto_292629 ) ( ON ?auto_292627 ?auto_292628 ) ( ON ?auto_292626 ?auto_292627 ) ( ON ?auto_292625 ?auto_292626 ) ( CLEAR ?auto_292623 ) ( ON ?auto_292624 ?auto_292625 ) ( CLEAR ?auto_292624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292623 ?auto_292624 )
      ( MAKE-7PILE ?auto_292623 ?auto_292624 ?auto_292625 ?auto_292626 ?auto_292627 ?auto_292628 ?auto_292629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_292653 - BLOCK
      ?auto_292654 - BLOCK
      ?auto_292655 - BLOCK
      ?auto_292656 - BLOCK
      ?auto_292657 - BLOCK
      ?auto_292658 - BLOCK
      ?auto_292659 - BLOCK
    )
    :vars
    (
      ?auto_292660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292659 ?auto_292660 ) ( not ( = ?auto_292653 ?auto_292654 ) ) ( not ( = ?auto_292653 ?auto_292655 ) ) ( not ( = ?auto_292653 ?auto_292656 ) ) ( not ( = ?auto_292653 ?auto_292657 ) ) ( not ( = ?auto_292653 ?auto_292658 ) ) ( not ( = ?auto_292653 ?auto_292659 ) ) ( not ( = ?auto_292653 ?auto_292660 ) ) ( not ( = ?auto_292654 ?auto_292655 ) ) ( not ( = ?auto_292654 ?auto_292656 ) ) ( not ( = ?auto_292654 ?auto_292657 ) ) ( not ( = ?auto_292654 ?auto_292658 ) ) ( not ( = ?auto_292654 ?auto_292659 ) ) ( not ( = ?auto_292654 ?auto_292660 ) ) ( not ( = ?auto_292655 ?auto_292656 ) ) ( not ( = ?auto_292655 ?auto_292657 ) ) ( not ( = ?auto_292655 ?auto_292658 ) ) ( not ( = ?auto_292655 ?auto_292659 ) ) ( not ( = ?auto_292655 ?auto_292660 ) ) ( not ( = ?auto_292656 ?auto_292657 ) ) ( not ( = ?auto_292656 ?auto_292658 ) ) ( not ( = ?auto_292656 ?auto_292659 ) ) ( not ( = ?auto_292656 ?auto_292660 ) ) ( not ( = ?auto_292657 ?auto_292658 ) ) ( not ( = ?auto_292657 ?auto_292659 ) ) ( not ( = ?auto_292657 ?auto_292660 ) ) ( not ( = ?auto_292658 ?auto_292659 ) ) ( not ( = ?auto_292658 ?auto_292660 ) ) ( not ( = ?auto_292659 ?auto_292660 ) ) ( ON ?auto_292658 ?auto_292659 ) ( ON ?auto_292657 ?auto_292658 ) ( ON ?auto_292656 ?auto_292657 ) ( ON ?auto_292655 ?auto_292656 ) ( ON ?auto_292654 ?auto_292655 ) ( ON ?auto_292653 ?auto_292654 ) ( CLEAR ?auto_292653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292653 )
      ( MAKE-7PILE ?auto_292653 ?auto_292654 ?auto_292655 ?auto_292656 ?auto_292657 ?auto_292658 ?auto_292659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292684 - BLOCK
      ?auto_292685 - BLOCK
      ?auto_292686 - BLOCK
      ?auto_292687 - BLOCK
      ?auto_292688 - BLOCK
      ?auto_292689 - BLOCK
      ?auto_292690 - BLOCK
      ?auto_292691 - BLOCK
    )
    :vars
    (
      ?auto_292692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292690 ) ( ON ?auto_292691 ?auto_292692 ) ( CLEAR ?auto_292691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292684 ) ( ON ?auto_292685 ?auto_292684 ) ( ON ?auto_292686 ?auto_292685 ) ( ON ?auto_292687 ?auto_292686 ) ( ON ?auto_292688 ?auto_292687 ) ( ON ?auto_292689 ?auto_292688 ) ( ON ?auto_292690 ?auto_292689 ) ( not ( = ?auto_292684 ?auto_292685 ) ) ( not ( = ?auto_292684 ?auto_292686 ) ) ( not ( = ?auto_292684 ?auto_292687 ) ) ( not ( = ?auto_292684 ?auto_292688 ) ) ( not ( = ?auto_292684 ?auto_292689 ) ) ( not ( = ?auto_292684 ?auto_292690 ) ) ( not ( = ?auto_292684 ?auto_292691 ) ) ( not ( = ?auto_292684 ?auto_292692 ) ) ( not ( = ?auto_292685 ?auto_292686 ) ) ( not ( = ?auto_292685 ?auto_292687 ) ) ( not ( = ?auto_292685 ?auto_292688 ) ) ( not ( = ?auto_292685 ?auto_292689 ) ) ( not ( = ?auto_292685 ?auto_292690 ) ) ( not ( = ?auto_292685 ?auto_292691 ) ) ( not ( = ?auto_292685 ?auto_292692 ) ) ( not ( = ?auto_292686 ?auto_292687 ) ) ( not ( = ?auto_292686 ?auto_292688 ) ) ( not ( = ?auto_292686 ?auto_292689 ) ) ( not ( = ?auto_292686 ?auto_292690 ) ) ( not ( = ?auto_292686 ?auto_292691 ) ) ( not ( = ?auto_292686 ?auto_292692 ) ) ( not ( = ?auto_292687 ?auto_292688 ) ) ( not ( = ?auto_292687 ?auto_292689 ) ) ( not ( = ?auto_292687 ?auto_292690 ) ) ( not ( = ?auto_292687 ?auto_292691 ) ) ( not ( = ?auto_292687 ?auto_292692 ) ) ( not ( = ?auto_292688 ?auto_292689 ) ) ( not ( = ?auto_292688 ?auto_292690 ) ) ( not ( = ?auto_292688 ?auto_292691 ) ) ( not ( = ?auto_292688 ?auto_292692 ) ) ( not ( = ?auto_292689 ?auto_292690 ) ) ( not ( = ?auto_292689 ?auto_292691 ) ) ( not ( = ?auto_292689 ?auto_292692 ) ) ( not ( = ?auto_292690 ?auto_292691 ) ) ( not ( = ?auto_292690 ?auto_292692 ) ) ( not ( = ?auto_292691 ?auto_292692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292691 ?auto_292692 )
      ( !STACK ?auto_292691 ?auto_292690 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292718 - BLOCK
      ?auto_292719 - BLOCK
      ?auto_292720 - BLOCK
      ?auto_292721 - BLOCK
      ?auto_292722 - BLOCK
      ?auto_292723 - BLOCK
      ?auto_292724 - BLOCK
      ?auto_292725 - BLOCK
    )
    :vars
    (
      ?auto_292726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292725 ?auto_292726 ) ( ON-TABLE ?auto_292718 ) ( ON ?auto_292719 ?auto_292718 ) ( ON ?auto_292720 ?auto_292719 ) ( ON ?auto_292721 ?auto_292720 ) ( ON ?auto_292722 ?auto_292721 ) ( ON ?auto_292723 ?auto_292722 ) ( not ( = ?auto_292718 ?auto_292719 ) ) ( not ( = ?auto_292718 ?auto_292720 ) ) ( not ( = ?auto_292718 ?auto_292721 ) ) ( not ( = ?auto_292718 ?auto_292722 ) ) ( not ( = ?auto_292718 ?auto_292723 ) ) ( not ( = ?auto_292718 ?auto_292724 ) ) ( not ( = ?auto_292718 ?auto_292725 ) ) ( not ( = ?auto_292718 ?auto_292726 ) ) ( not ( = ?auto_292719 ?auto_292720 ) ) ( not ( = ?auto_292719 ?auto_292721 ) ) ( not ( = ?auto_292719 ?auto_292722 ) ) ( not ( = ?auto_292719 ?auto_292723 ) ) ( not ( = ?auto_292719 ?auto_292724 ) ) ( not ( = ?auto_292719 ?auto_292725 ) ) ( not ( = ?auto_292719 ?auto_292726 ) ) ( not ( = ?auto_292720 ?auto_292721 ) ) ( not ( = ?auto_292720 ?auto_292722 ) ) ( not ( = ?auto_292720 ?auto_292723 ) ) ( not ( = ?auto_292720 ?auto_292724 ) ) ( not ( = ?auto_292720 ?auto_292725 ) ) ( not ( = ?auto_292720 ?auto_292726 ) ) ( not ( = ?auto_292721 ?auto_292722 ) ) ( not ( = ?auto_292721 ?auto_292723 ) ) ( not ( = ?auto_292721 ?auto_292724 ) ) ( not ( = ?auto_292721 ?auto_292725 ) ) ( not ( = ?auto_292721 ?auto_292726 ) ) ( not ( = ?auto_292722 ?auto_292723 ) ) ( not ( = ?auto_292722 ?auto_292724 ) ) ( not ( = ?auto_292722 ?auto_292725 ) ) ( not ( = ?auto_292722 ?auto_292726 ) ) ( not ( = ?auto_292723 ?auto_292724 ) ) ( not ( = ?auto_292723 ?auto_292725 ) ) ( not ( = ?auto_292723 ?auto_292726 ) ) ( not ( = ?auto_292724 ?auto_292725 ) ) ( not ( = ?auto_292724 ?auto_292726 ) ) ( not ( = ?auto_292725 ?auto_292726 ) ) ( CLEAR ?auto_292723 ) ( ON ?auto_292724 ?auto_292725 ) ( CLEAR ?auto_292724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_292718 ?auto_292719 ?auto_292720 ?auto_292721 ?auto_292722 ?auto_292723 ?auto_292724 )
      ( MAKE-8PILE ?auto_292718 ?auto_292719 ?auto_292720 ?auto_292721 ?auto_292722 ?auto_292723 ?auto_292724 ?auto_292725 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292752 - BLOCK
      ?auto_292753 - BLOCK
      ?auto_292754 - BLOCK
      ?auto_292755 - BLOCK
      ?auto_292756 - BLOCK
      ?auto_292757 - BLOCK
      ?auto_292758 - BLOCK
      ?auto_292759 - BLOCK
    )
    :vars
    (
      ?auto_292760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292759 ?auto_292760 ) ( ON-TABLE ?auto_292752 ) ( ON ?auto_292753 ?auto_292752 ) ( ON ?auto_292754 ?auto_292753 ) ( ON ?auto_292755 ?auto_292754 ) ( ON ?auto_292756 ?auto_292755 ) ( not ( = ?auto_292752 ?auto_292753 ) ) ( not ( = ?auto_292752 ?auto_292754 ) ) ( not ( = ?auto_292752 ?auto_292755 ) ) ( not ( = ?auto_292752 ?auto_292756 ) ) ( not ( = ?auto_292752 ?auto_292757 ) ) ( not ( = ?auto_292752 ?auto_292758 ) ) ( not ( = ?auto_292752 ?auto_292759 ) ) ( not ( = ?auto_292752 ?auto_292760 ) ) ( not ( = ?auto_292753 ?auto_292754 ) ) ( not ( = ?auto_292753 ?auto_292755 ) ) ( not ( = ?auto_292753 ?auto_292756 ) ) ( not ( = ?auto_292753 ?auto_292757 ) ) ( not ( = ?auto_292753 ?auto_292758 ) ) ( not ( = ?auto_292753 ?auto_292759 ) ) ( not ( = ?auto_292753 ?auto_292760 ) ) ( not ( = ?auto_292754 ?auto_292755 ) ) ( not ( = ?auto_292754 ?auto_292756 ) ) ( not ( = ?auto_292754 ?auto_292757 ) ) ( not ( = ?auto_292754 ?auto_292758 ) ) ( not ( = ?auto_292754 ?auto_292759 ) ) ( not ( = ?auto_292754 ?auto_292760 ) ) ( not ( = ?auto_292755 ?auto_292756 ) ) ( not ( = ?auto_292755 ?auto_292757 ) ) ( not ( = ?auto_292755 ?auto_292758 ) ) ( not ( = ?auto_292755 ?auto_292759 ) ) ( not ( = ?auto_292755 ?auto_292760 ) ) ( not ( = ?auto_292756 ?auto_292757 ) ) ( not ( = ?auto_292756 ?auto_292758 ) ) ( not ( = ?auto_292756 ?auto_292759 ) ) ( not ( = ?auto_292756 ?auto_292760 ) ) ( not ( = ?auto_292757 ?auto_292758 ) ) ( not ( = ?auto_292757 ?auto_292759 ) ) ( not ( = ?auto_292757 ?auto_292760 ) ) ( not ( = ?auto_292758 ?auto_292759 ) ) ( not ( = ?auto_292758 ?auto_292760 ) ) ( not ( = ?auto_292759 ?auto_292760 ) ) ( ON ?auto_292758 ?auto_292759 ) ( CLEAR ?auto_292756 ) ( ON ?auto_292757 ?auto_292758 ) ( CLEAR ?auto_292757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_292752 ?auto_292753 ?auto_292754 ?auto_292755 ?auto_292756 ?auto_292757 )
      ( MAKE-8PILE ?auto_292752 ?auto_292753 ?auto_292754 ?auto_292755 ?auto_292756 ?auto_292757 ?auto_292758 ?auto_292759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292786 - BLOCK
      ?auto_292787 - BLOCK
      ?auto_292788 - BLOCK
      ?auto_292789 - BLOCK
      ?auto_292790 - BLOCK
      ?auto_292791 - BLOCK
      ?auto_292792 - BLOCK
      ?auto_292793 - BLOCK
    )
    :vars
    (
      ?auto_292794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292793 ?auto_292794 ) ( ON-TABLE ?auto_292786 ) ( ON ?auto_292787 ?auto_292786 ) ( ON ?auto_292788 ?auto_292787 ) ( ON ?auto_292789 ?auto_292788 ) ( not ( = ?auto_292786 ?auto_292787 ) ) ( not ( = ?auto_292786 ?auto_292788 ) ) ( not ( = ?auto_292786 ?auto_292789 ) ) ( not ( = ?auto_292786 ?auto_292790 ) ) ( not ( = ?auto_292786 ?auto_292791 ) ) ( not ( = ?auto_292786 ?auto_292792 ) ) ( not ( = ?auto_292786 ?auto_292793 ) ) ( not ( = ?auto_292786 ?auto_292794 ) ) ( not ( = ?auto_292787 ?auto_292788 ) ) ( not ( = ?auto_292787 ?auto_292789 ) ) ( not ( = ?auto_292787 ?auto_292790 ) ) ( not ( = ?auto_292787 ?auto_292791 ) ) ( not ( = ?auto_292787 ?auto_292792 ) ) ( not ( = ?auto_292787 ?auto_292793 ) ) ( not ( = ?auto_292787 ?auto_292794 ) ) ( not ( = ?auto_292788 ?auto_292789 ) ) ( not ( = ?auto_292788 ?auto_292790 ) ) ( not ( = ?auto_292788 ?auto_292791 ) ) ( not ( = ?auto_292788 ?auto_292792 ) ) ( not ( = ?auto_292788 ?auto_292793 ) ) ( not ( = ?auto_292788 ?auto_292794 ) ) ( not ( = ?auto_292789 ?auto_292790 ) ) ( not ( = ?auto_292789 ?auto_292791 ) ) ( not ( = ?auto_292789 ?auto_292792 ) ) ( not ( = ?auto_292789 ?auto_292793 ) ) ( not ( = ?auto_292789 ?auto_292794 ) ) ( not ( = ?auto_292790 ?auto_292791 ) ) ( not ( = ?auto_292790 ?auto_292792 ) ) ( not ( = ?auto_292790 ?auto_292793 ) ) ( not ( = ?auto_292790 ?auto_292794 ) ) ( not ( = ?auto_292791 ?auto_292792 ) ) ( not ( = ?auto_292791 ?auto_292793 ) ) ( not ( = ?auto_292791 ?auto_292794 ) ) ( not ( = ?auto_292792 ?auto_292793 ) ) ( not ( = ?auto_292792 ?auto_292794 ) ) ( not ( = ?auto_292793 ?auto_292794 ) ) ( ON ?auto_292792 ?auto_292793 ) ( ON ?auto_292791 ?auto_292792 ) ( CLEAR ?auto_292789 ) ( ON ?auto_292790 ?auto_292791 ) ( CLEAR ?auto_292790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_292786 ?auto_292787 ?auto_292788 ?auto_292789 ?auto_292790 )
      ( MAKE-8PILE ?auto_292786 ?auto_292787 ?auto_292788 ?auto_292789 ?auto_292790 ?auto_292791 ?auto_292792 ?auto_292793 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292820 - BLOCK
      ?auto_292821 - BLOCK
      ?auto_292822 - BLOCK
      ?auto_292823 - BLOCK
      ?auto_292824 - BLOCK
      ?auto_292825 - BLOCK
      ?auto_292826 - BLOCK
      ?auto_292827 - BLOCK
    )
    :vars
    (
      ?auto_292828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292827 ?auto_292828 ) ( ON-TABLE ?auto_292820 ) ( ON ?auto_292821 ?auto_292820 ) ( ON ?auto_292822 ?auto_292821 ) ( not ( = ?auto_292820 ?auto_292821 ) ) ( not ( = ?auto_292820 ?auto_292822 ) ) ( not ( = ?auto_292820 ?auto_292823 ) ) ( not ( = ?auto_292820 ?auto_292824 ) ) ( not ( = ?auto_292820 ?auto_292825 ) ) ( not ( = ?auto_292820 ?auto_292826 ) ) ( not ( = ?auto_292820 ?auto_292827 ) ) ( not ( = ?auto_292820 ?auto_292828 ) ) ( not ( = ?auto_292821 ?auto_292822 ) ) ( not ( = ?auto_292821 ?auto_292823 ) ) ( not ( = ?auto_292821 ?auto_292824 ) ) ( not ( = ?auto_292821 ?auto_292825 ) ) ( not ( = ?auto_292821 ?auto_292826 ) ) ( not ( = ?auto_292821 ?auto_292827 ) ) ( not ( = ?auto_292821 ?auto_292828 ) ) ( not ( = ?auto_292822 ?auto_292823 ) ) ( not ( = ?auto_292822 ?auto_292824 ) ) ( not ( = ?auto_292822 ?auto_292825 ) ) ( not ( = ?auto_292822 ?auto_292826 ) ) ( not ( = ?auto_292822 ?auto_292827 ) ) ( not ( = ?auto_292822 ?auto_292828 ) ) ( not ( = ?auto_292823 ?auto_292824 ) ) ( not ( = ?auto_292823 ?auto_292825 ) ) ( not ( = ?auto_292823 ?auto_292826 ) ) ( not ( = ?auto_292823 ?auto_292827 ) ) ( not ( = ?auto_292823 ?auto_292828 ) ) ( not ( = ?auto_292824 ?auto_292825 ) ) ( not ( = ?auto_292824 ?auto_292826 ) ) ( not ( = ?auto_292824 ?auto_292827 ) ) ( not ( = ?auto_292824 ?auto_292828 ) ) ( not ( = ?auto_292825 ?auto_292826 ) ) ( not ( = ?auto_292825 ?auto_292827 ) ) ( not ( = ?auto_292825 ?auto_292828 ) ) ( not ( = ?auto_292826 ?auto_292827 ) ) ( not ( = ?auto_292826 ?auto_292828 ) ) ( not ( = ?auto_292827 ?auto_292828 ) ) ( ON ?auto_292826 ?auto_292827 ) ( ON ?auto_292825 ?auto_292826 ) ( ON ?auto_292824 ?auto_292825 ) ( CLEAR ?auto_292822 ) ( ON ?auto_292823 ?auto_292824 ) ( CLEAR ?auto_292823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_292820 ?auto_292821 ?auto_292822 ?auto_292823 )
      ( MAKE-8PILE ?auto_292820 ?auto_292821 ?auto_292822 ?auto_292823 ?auto_292824 ?auto_292825 ?auto_292826 ?auto_292827 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292854 - BLOCK
      ?auto_292855 - BLOCK
      ?auto_292856 - BLOCK
      ?auto_292857 - BLOCK
      ?auto_292858 - BLOCK
      ?auto_292859 - BLOCK
      ?auto_292860 - BLOCK
      ?auto_292861 - BLOCK
    )
    :vars
    (
      ?auto_292862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292861 ?auto_292862 ) ( ON-TABLE ?auto_292854 ) ( ON ?auto_292855 ?auto_292854 ) ( not ( = ?auto_292854 ?auto_292855 ) ) ( not ( = ?auto_292854 ?auto_292856 ) ) ( not ( = ?auto_292854 ?auto_292857 ) ) ( not ( = ?auto_292854 ?auto_292858 ) ) ( not ( = ?auto_292854 ?auto_292859 ) ) ( not ( = ?auto_292854 ?auto_292860 ) ) ( not ( = ?auto_292854 ?auto_292861 ) ) ( not ( = ?auto_292854 ?auto_292862 ) ) ( not ( = ?auto_292855 ?auto_292856 ) ) ( not ( = ?auto_292855 ?auto_292857 ) ) ( not ( = ?auto_292855 ?auto_292858 ) ) ( not ( = ?auto_292855 ?auto_292859 ) ) ( not ( = ?auto_292855 ?auto_292860 ) ) ( not ( = ?auto_292855 ?auto_292861 ) ) ( not ( = ?auto_292855 ?auto_292862 ) ) ( not ( = ?auto_292856 ?auto_292857 ) ) ( not ( = ?auto_292856 ?auto_292858 ) ) ( not ( = ?auto_292856 ?auto_292859 ) ) ( not ( = ?auto_292856 ?auto_292860 ) ) ( not ( = ?auto_292856 ?auto_292861 ) ) ( not ( = ?auto_292856 ?auto_292862 ) ) ( not ( = ?auto_292857 ?auto_292858 ) ) ( not ( = ?auto_292857 ?auto_292859 ) ) ( not ( = ?auto_292857 ?auto_292860 ) ) ( not ( = ?auto_292857 ?auto_292861 ) ) ( not ( = ?auto_292857 ?auto_292862 ) ) ( not ( = ?auto_292858 ?auto_292859 ) ) ( not ( = ?auto_292858 ?auto_292860 ) ) ( not ( = ?auto_292858 ?auto_292861 ) ) ( not ( = ?auto_292858 ?auto_292862 ) ) ( not ( = ?auto_292859 ?auto_292860 ) ) ( not ( = ?auto_292859 ?auto_292861 ) ) ( not ( = ?auto_292859 ?auto_292862 ) ) ( not ( = ?auto_292860 ?auto_292861 ) ) ( not ( = ?auto_292860 ?auto_292862 ) ) ( not ( = ?auto_292861 ?auto_292862 ) ) ( ON ?auto_292860 ?auto_292861 ) ( ON ?auto_292859 ?auto_292860 ) ( ON ?auto_292858 ?auto_292859 ) ( ON ?auto_292857 ?auto_292858 ) ( CLEAR ?auto_292855 ) ( ON ?auto_292856 ?auto_292857 ) ( CLEAR ?auto_292856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_292854 ?auto_292855 ?auto_292856 )
      ( MAKE-8PILE ?auto_292854 ?auto_292855 ?auto_292856 ?auto_292857 ?auto_292858 ?auto_292859 ?auto_292860 ?auto_292861 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292888 - BLOCK
      ?auto_292889 - BLOCK
      ?auto_292890 - BLOCK
      ?auto_292891 - BLOCK
      ?auto_292892 - BLOCK
      ?auto_292893 - BLOCK
      ?auto_292894 - BLOCK
      ?auto_292895 - BLOCK
    )
    :vars
    (
      ?auto_292896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292895 ?auto_292896 ) ( ON-TABLE ?auto_292888 ) ( not ( = ?auto_292888 ?auto_292889 ) ) ( not ( = ?auto_292888 ?auto_292890 ) ) ( not ( = ?auto_292888 ?auto_292891 ) ) ( not ( = ?auto_292888 ?auto_292892 ) ) ( not ( = ?auto_292888 ?auto_292893 ) ) ( not ( = ?auto_292888 ?auto_292894 ) ) ( not ( = ?auto_292888 ?auto_292895 ) ) ( not ( = ?auto_292888 ?auto_292896 ) ) ( not ( = ?auto_292889 ?auto_292890 ) ) ( not ( = ?auto_292889 ?auto_292891 ) ) ( not ( = ?auto_292889 ?auto_292892 ) ) ( not ( = ?auto_292889 ?auto_292893 ) ) ( not ( = ?auto_292889 ?auto_292894 ) ) ( not ( = ?auto_292889 ?auto_292895 ) ) ( not ( = ?auto_292889 ?auto_292896 ) ) ( not ( = ?auto_292890 ?auto_292891 ) ) ( not ( = ?auto_292890 ?auto_292892 ) ) ( not ( = ?auto_292890 ?auto_292893 ) ) ( not ( = ?auto_292890 ?auto_292894 ) ) ( not ( = ?auto_292890 ?auto_292895 ) ) ( not ( = ?auto_292890 ?auto_292896 ) ) ( not ( = ?auto_292891 ?auto_292892 ) ) ( not ( = ?auto_292891 ?auto_292893 ) ) ( not ( = ?auto_292891 ?auto_292894 ) ) ( not ( = ?auto_292891 ?auto_292895 ) ) ( not ( = ?auto_292891 ?auto_292896 ) ) ( not ( = ?auto_292892 ?auto_292893 ) ) ( not ( = ?auto_292892 ?auto_292894 ) ) ( not ( = ?auto_292892 ?auto_292895 ) ) ( not ( = ?auto_292892 ?auto_292896 ) ) ( not ( = ?auto_292893 ?auto_292894 ) ) ( not ( = ?auto_292893 ?auto_292895 ) ) ( not ( = ?auto_292893 ?auto_292896 ) ) ( not ( = ?auto_292894 ?auto_292895 ) ) ( not ( = ?auto_292894 ?auto_292896 ) ) ( not ( = ?auto_292895 ?auto_292896 ) ) ( ON ?auto_292894 ?auto_292895 ) ( ON ?auto_292893 ?auto_292894 ) ( ON ?auto_292892 ?auto_292893 ) ( ON ?auto_292891 ?auto_292892 ) ( ON ?auto_292890 ?auto_292891 ) ( CLEAR ?auto_292888 ) ( ON ?auto_292889 ?auto_292890 ) ( CLEAR ?auto_292889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_292888 ?auto_292889 )
      ( MAKE-8PILE ?auto_292888 ?auto_292889 ?auto_292890 ?auto_292891 ?auto_292892 ?auto_292893 ?auto_292894 ?auto_292895 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_292922 - BLOCK
      ?auto_292923 - BLOCK
      ?auto_292924 - BLOCK
      ?auto_292925 - BLOCK
      ?auto_292926 - BLOCK
      ?auto_292927 - BLOCK
      ?auto_292928 - BLOCK
      ?auto_292929 - BLOCK
    )
    :vars
    (
      ?auto_292930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292929 ?auto_292930 ) ( not ( = ?auto_292922 ?auto_292923 ) ) ( not ( = ?auto_292922 ?auto_292924 ) ) ( not ( = ?auto_292922 ?auto_292925 ) ) ( not ( = ?auto_292922 ?auto_292926 ) ) ( not ( = ?auto_292922 ?auto_292927 ) ) ( not ( = ?auto_292922 ?auto_292928 ) ) ( not ( = ?auto_292922 ?auto_292929 ) ) ( not ( = ?auto_292922 ?auto_292930 ) ) ( not ( = ?auto_292923 ?auto_292924 ) ) ( not ( = ?auto_292923 ?auto_292925 ) ) ( not ( = ?auto_292923 ?auto_292926 ) ) ( not ( = ?auto_292923 ?auto_292927 ) ) ( not ( = ?auto_292923 ?auto_292928 ) ) ( not ( = ?auto_292923 ?auto_292929 ) ) ( not ( = ?auto_292923 ?auto_292930 ) ) ( not ( = ?auto_292924 ?auto_292925 ) ) ( not ( = ?auto_292924 ?auto_292926 ) ) ( not ( = ?auto_292924 ?auto_292927 ) ) ( not ( = ?auto_292924 ?auto_292928 ) ) ( not ( = ?auto_292924 ?auto_292929 ) ) ( not ( = ?auto_292924 ?auto_292930 ) ) ( not ( = ?auto_292925 ?auto_292926 ) ) ( not ( = ?auto_292925 ?auto_292927 ) ) ( not ( = ?auto_292925 ?auto_292928 ) ) ( not ( = ?auto_292925 ?auto_292929 ) ) ( not ( = ?auto_292925 ?auto_292930 ) ) ( not ( = ?auto_292926 ?auto_292927 ) ) ( not ( = ?auto_292926 ?auto_292928 ) ) ( not ( = ?auto_292926 ?auto_292929 ) ) ( not ( = ?auto_292926 ?auto_292930 ) ) ( not ( = ?auto_292927 ?auto_292928 ) ) ( not ( = ?auto_292927 ?auto_292929 ) ) ( not ( = ?auto_292927 ?auto_292930 ) ) ( not ( = ?auto_292928 ?auto_292929 ) ) ( not ( = ?auto_292928 ?auto_292930 ) ) ( not ( = ?auto_292929 ?auto_292930 ) ) ( ON ?auto_292928 ?auto_292929 ) ( ON ?auto_292927 ?auto_292928 ) ( ON ?auto_292926 ?auto_292927 ) ( ON ?auto_292925 ?auto_292926 ) ( ON ?auto_292924 ?auto_292925 ) ( ON ?auto_292923 ?auto_292924 ) ( ON ?auto_292922 ?auto_292923 ) ( CLEAR ?auto_292922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292922 )
      ( MAKE-8PILE ?auto_292922 ?auto_292923 ?auto_292924 ?auto_292925 ?auto_292926 ?auto_292927 ?auto_292928 ?auto_292929 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_292957 - BLOCK
      ?auto_292958 - BLOCK
      ?auto_292959 - BLOCK
      ?auto_292960 - BLOCK
      ?auto_292961 - BLOCK
      ?auto_292962 - BLOCK
      ?auto_292963 - BLOCK
      ?auto_292964 - BLOCK
      ?auto_292965 - BLOCK
    )
    :vars
    (
      ?auto_292966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_292964 ) ( ON ?auto_292965 ?auto_292966 ) ( CLEAR ?auto_292965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_292957 ) ( ON ?auto_292958 ?auto_292957 ) ( ON ?auto_292959 ?auto_292958 ) ( ON ?auto_292960 ?auto_292959 ) ( ON ?auto_292961 ?auto_292960 ) ( ON ?auto_292962 ?auto_292961 ) ( ON ?auto_292963 ?auto_292962 ) ( ON ?auto_292964 ?auto_292963 ) ( not ( = ?auto_292957 ?auto_292958 ) ) ( not ( = ?auto_292957 ?auto_292959 ) ) ( not ( = ?auto_292957 ?auto_292960 ) ) ( not ( = ?auto_292957 ?auto_292961 ) ) ( not ( = ?auto_292957 ?auto_292962 ) ) ( not ( = ?auto_292957 ?auto_292963 ) ) ( not ( = ?auto_292957 ?auto_292964 ) ) ( not ( = ?auto_292957 ?auto_292965 ) ) ( not ( = ?auto_292957 ?auto_292966 ) ) ( not ( = ?auto_292958 ?auto_292959 ) ) ( not ( = ?auto_292958 ?auto_292960 ) ) ( not ( = ?auto_292958 ?auto_292961 ) ) ( not ( = ?auto_292958 ?auto_292962 ) ) ( not ( = ?auto_292958 ?auto_292963 ) ) ( not ( = ?auto_292958 ?auto_292964 ) ) ( not ( = ?auto_292958 ?auto_292965 ) ) ( not ( = ?auto_292958 ?auto_292966 ) ) ( not ( = ?auto_292959 ?auto_292960 ) ) ( not ( = ?auto_292959 ?auto_292961 ) ) ( not ( = ?auto_292959 ?auto_292962 ) ) ( not ( = ?auto_292959 ?auto_292963 ) ) ( not ( = ?auto_292959 ?auto_292964 ) ) ( not ( = ?auto_292959 ?auto_292965 ) ) ( not ( = ?auto_292959 ?auto_292966 ) ) ( not ( = ?auto_292960 ?auto_292961 ) ) ( not ( = ?auto_292960 ?auto_292962 ) ) ( not ( = ?auto_292960 ?auto_292963 ) ) ( not ( = ?auto_292960 ?auto_292964 ) ) ( not ( = ?auto_292960 ?auto_292965 ) ) ( not ( = ?auto_292960 ?auto_292966 ) ) ( not ( = ?auto_292961 ?auto_292962 ) ) ( not ( = ?auto_292961 ?auto_292963 ) ) ( not ( = ?auto_292961 ?auto_292964 ) ) ( not ( = ?auto_292961 ?auto_292965 ) ) ( not ( = ?auto_292961 ?auto_292966 ) ) ( not ( = ?auto_292962 ?auto_292963 ) ) ( not ( = ?auto_292962 ?auto_292964 ) ) ( not ( = ?auto_292962 ?auto_292965 ) ) ( not ( = ?auto_292962 ?auto_292966 ) ) ( not ( = ?auto_292963 ?auto_292964 ) ) ( not ( = ?auto_292963 ?auto_292965 ) ) ( not ( = ?auto_292963 ?auto_292966 ) ) ( not ( = ?auto_292964 ?auto_292965 ) ) ( not ( = ?auto_292964 ?auto_292966 ) ) ( not ( = ?auto_292965 ?auto_292966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_292965 ?auto_292966 )
      ( !STACK ?auto_292965 ?auto_292964 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_292995 - BLOCK
      ?auto_292996 - BLOCK
      ?auto_292997 - BLOCK
      ?auto_292998 - BLOCK
      ?auto_292999 - BLOCK
      ?auto_293000 - BLOCK
      ?auto_293001 - BLOCK
      ?auto_293002 - BLOCK
      ?auto_293003 - BLOCK
    )
    :vars
    (
      ?auto_293004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293003 ?auto_293004 ) ( ON-TABLE ?auto_292995 ) ( ON ?auto_292996 ?auto_292995 ) ( ON ?auto_292997 ?auto_292996 ) ( ON ?auto_292998 ?auto_292997 ) ( ON ?auto_292999 ?auto_292998 ) ( ON ?auto_293000 ?auto_292999 ) ( ON ?auto_293001 ?auto_293000 ) ( not ( = ?auto_292995 ?auto_292996 ) ) ( not ( = ?auto_292995 ?auto_292997 ) ) ( not ( = ?auto_292995 ?auto_292998 ) ) ( not ( = ?auto_292995 ?auto_292999 ) ) ( not ( = ?auto_292995 ?auto_293000 ) ) ( not ( = ?auto_292995 ?auto_293001 ) ) ( not ( = ?auto_292995 ?auto_293002 ) ) ( not ( = ?auto_292995 ?auto_293003 ) ) ( not ( = ?auto_292995 ?auto_293004 ) ) ( not ( = ?auto_292996 ?auto_292997 ) ) ( not ( = ?auto_292996 ?auto_292998 ) ) ( not ( = ?auto_292996 ?auto_292999 ) ) ( not ( = ?auto_292996 ?auto_293000 ) ) ( not ( = ?auto_292996 ?auto_293001 ) ) ( not ( = ?auto_292996 ?auto_293002 ) ) ( not ( = ?auto_292996 ?auto_293003 ) ) ( not ( = ?auto_292996 ?auto_293004 ) ) ( not ( = ?auto_292997 ?auto_292998 ) ) ( not ( = ?auto_292997 ?auto_292999 ) ) ( not ( = ?auto_292997 ?auto_293000 ) ) ( not ( = ?auto_292997 ?auto_293001 ) ) ( not ( = ?auto_292997 ?auto_293002 ) ) ( not ( = ?auto_292997 ?auto_293003 ) ) ( not ( = ?auto_292997 ?auto_293004 ) ) ( not ( = ?auto_292998 ?auto_292999 ) ) ( not ( = ?auto_292998 ?auto_293000 ) ) ( not ( = ?auto_292998 ?auto_293001 ) ) ( not ( = ?auto_292998 ?auto_293002 ) ) ( not ( = ?auto_292998 ?auto_293003 ) ) ( not ( = ?auto_292998 ?auto_293004 ) ) ( not ( = ?auto_292999 ?auto_293000 ) ) ( not ( = ?auto_292999 ?auto_293001 ) ) ( not ( = ?auto_292999 ?auto_293002 ) ) ( not ( = ?auto_292999 ?auto_293003 ) ) ( not ( = ?auto_292999 ?auto_293004 ) ) ( not ( = ?auto_293000 ?auto_293001 ) ) ( not ( = ?auto_293000 ?auto_293002 ) ) ( not ( = ?auto_293000 ?auto_293003 ) ) ( not ( = ?auto_293000 ?auto_293004 ) ) ( not ( = ?auto_293001 ?auto_293002 ) ) ( not ( = ?auto_293001 ?auto_293003 ) ) ( not ( = ?auto_293001 ?auto_293004 ) ) ( not ( = ?auto_293002 ?auto_293003 ) ) ( not ( = ?auto_293002 ?auto_293004 ) ) ( not ( = ?auto_293003 ?auto_293004 ) ) ( CLEAR ?auto_293001 ) ( ON ?auto_293002 ?auto_293003 ) ( CLEAR ?auto_293002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_292995 ?auto_292996 ?auto_292997 ?auto_292998 ?auto_292999 ?auto_293000 ?auto_293001 ?auto_293002 )
      ( MAKE-9PILE ?auto_292995 ?auto_292996 ?auto_292997 ?auto_292998 ?auto_292999 ?auto_293000 ?auto_293001 ?auto_293002 ?auto_293003 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293033 - BLOCK
      ?auto_293034 - BLOCK
      ?auto_293035 - BLOCK
      ?auto_293036 - BLOCK
      ?auto_293037 - BLOCK
      ?auto_293038 - BLOCK
      ?auto_293039 - BLOCK
      ?auto_293040 - BLOCK
      ?auto_293041 - BLOCK
    )
    :vars
    (
      ?auto_293042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293041 ?auto_293042 ) ( ON-TABLE ?auto_293033 ) ( ON ?auto_293034 ?auto_293033 ) ( ON ?auto_293035 ?auto_293034 ) ( ON ?auto_293036 ?auto_293035 ) ( ON ?auto_293037 ?auto_293036 ) ( ON ?auto_293038 ?auto_293037 ) ( not ( = ?auto_293033 ?auto_293034 ) ) ( not ( = ?auto_293033 ?auto_293035 ) ) ( not ( = ?auto_293033 ?auto_293036 ) ) ( not ( = ?auto_293033 ?auto_293037 ) ) ( not ( = ?auto_293033 ?auto_293038 ) ) ( not ( = ?auto_293033 ?auto_293039 ) ) ( not ( = ?auto_293033 ?auto_293040 ) ) ( not ( = ?auto_293033 ?auto_293041 ) ) ( not ( = ?auto_293033 ?auto_293042 ) ) ( not ( = ?auto_293034 ?auto_293035 ) ) ( not ( = ?auto_293034 ?auto_293036 ) ) ( not ( = ?auto_293034 ?auto_293037 ) ) ( not ( = ?auto_293034 ?auto_293038 ) ) ( not ( = ?auto_293034 ?auto_293039 ) ) ( not ( = ?auto_293034 ?auto_293040 ) ) ( not ( = ?auto_293034 ?auto_293041 ) ) ( not ( = ?auto_293034 ?auto_293042 ) ) ( not ( = ?auto_293035 ?auto_293036 ) ) ( not ( = ?auto_293035 ?auto_293037 ) ) ( not ( = ?auto_293035 ?auto_293038 ) ) ( not ( = ?auto_293035 ?auto_293039 ) ) ( not ( = ?auto_293035 ?auto_293040 ) ) ( not ( = ?auto_293035 ?auto_293041 ) ) ( not ( = ?auto_293035 ?auto_293042 ) ) ( not ( = ?auto_293036 ?auto_293037 ) ) ( not ( = ?auto_293036 ?auto_293038 ) ) ( not ( = ?auto_293036 ?auto_293039 ) ) ( not ( = ?auto_293036 ?auto_293040 ) ) ( not ( = ?auto_293036 ?auto_293041 ) ) ( not ( = ?auto_293036 ?auto_293042 ) ) ( not ( = ?auto_293037 ?auto_293038 ) ) ( not ( = ?auto_293037 ?auto_293039 ) ) ( not ( = ?auto_293037 ?auto_293040 ) ) ( not ( = ?auto_293037 ?auto_293041 ) ) ( not ( = ?auto_293037 ?auto_293042 ) ) ( not ( = ?auto_293038 ?auto_293039 ) ) ( not ( = ?auto_293038 ?auto_293040 ) ) ( not ( = ?auto_293038 ?auto_293041 ) ) ( not ( = ?auto_293038 ?auto_293042 ) ) ( not ( = ?auto_293039 ?auto_293040 ) ) ( not ( = ?auto_293039 ?auto_293041 ) ) ( not ( = ?auto_293039 ?auto_293042 ) ) ( not ( = ?auto_293040 ?auto_293041 ) ) ( not ( = ?auto_293040 ?auto_293042 ) ) ( not ( = ?auto_293041 ?auto_293042 ) ) ( ON ?auto_293040 ?auto_293041 ) ( CLEAR ?auto_293038 ) ( ON ?auto_293039 ?auto_293040 ) ( CLEAR ?auto_293039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_293033 ?auto_293034 ?auto_293035 ?auto_293036 ?auto_293037 ?auto_293038 ?auto_293039 )
      ( MAKE-9PILE ?auto_293033 ?auto_293034 ?auto_293035 ?auto_293036 ?auto_293037 ?auto_293038 ?auto_293039 ?auto_293040 ?auto_293041 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293071 - BLOCK
      ?auto_293072 - BLOCK
      ?auto_293073 - BLOCK
      ?auto_293074 - BLOCK
      ?auto_293075 - BLOCK
      ?auto_293076 - BLOCK
      ?auto_293077 - BLOCK
      ?auto_293078 - BLOCK
      ?auto_293079 - BLOCK
    )
    :vars
    (
      ?auto_293080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293079 ?auto_293080 ) ( ON-TABLE ?auto_293071 ) ( ON ?auto_293072 ?auto_293071 ) ( ON ?auto_293073 ?auto_293072 ) ( ON ?auto_293074 ?auto_293073 ) ( ON ?auto_293075 ?auto_293074 ) ( not ( = ?auto_293071 ?auto_293072 ) ) ( not ( = ?auto_293071 ?auto_293073 ) ) ( not ( = ?auto_293071 ?auto_293074 ) ) ( not ( = ?auto_293071 ?auto_293075 ) ) ( not ( = ?auto_293071 ?auto_293076 ) ) ( not ( = ?auto_293071 ?auto_293077 ) ) ( not ( = ?auto_293071 ?auto_293078 ) ) ( not ( = ?auto_293071 ?auto_293079 ) ) ( not ( = ?auto_293071 ?auto_293080 ) ) ( not ( = ?auto_293072 ?auto_293073 ) ) ( not ( = ?auto_293072 ?auto_293074 ) ) ( not ( = ?auto_293072 ?auto_293075 ) ) ( not ( = ?auto_293072 ?auto_293076 ) ) ( not ( = ?auto_293072 ?auto_293077 ) ) ( not ( = ?auto_293072 ?auto_293078 ) ) ( not ( = ?auto_293072 ?auto_293079 ) ) ( not ( = ?auto_293072 ?auto_293080 ) ) ( not ( = ?auto_293073 ?auto_293074 ) ) ( not ( = ?auto_293073 ?auto_293075 ) ) ( not ( = ?auto_293073 ?auto_293076 ) ) ( not ( = ?auto_293073 ?auto_293077 ) ) ( not ( = ?auto_293073 ?auto_293078 ) ) ( not ( = ?auto_293073 ?auto_293079 ) ) ( not ( = ?auto_293073 ?auto_293080 ) ) ( not ( = ?auto_293074 ?auto_293075 ) ) ( not ( = ?auto_293074 ?auto_293076 ) ) ( not ( = ?auto_293074 ?auto_293077 ) ) ( not ( = ?auto_293074 ?auto_293078 ) ) ( not ( = ?auto_293074 ?auto_293079 ) ) ( not ( = ?auto_293074 ?auto_293080 ) ) ( not ( = ?auto_293075 ?auto_293076 ) ) ( not ( = ?auto_293075 ?auto_293077 ) ) ( not ( = ?auto_293075 ?auto_293078 ) ) ( not ( = ?auto_293075 ?auto_293079 ) ) ( not ( = ?auto_293075 ?auto_293080 ) ) ( not ( = ?auto_293076 ?auto_293077 ) ) ( not ( = ?auto_293076 ?auto_293078 ) ) ( not ( = ?auto_293076 ?auto_293079 ) ) ( not ( = ?auto_293076 ?auto_293080 ) ) ( not ( = ?auto_293077 ?auto_293078 ) ) ( not ( = ?auto_293077 ?auto_293079 ) ) ( not ( = ?auto_293077 ?auto_293080 ) ) ( not ( = ?auto_293078 ?auto_293079 ) ) ( not ( = ?auto_293078 ?auto_293080 ) ) ( not ( = ?auto_293079 ?auto_293080 ) ) ( ON ?auto_293078 ?auto_293079 ) ( ON ?auto_293077 ?auto_293078 ) ( CLEAR ?auto_293075 ) ( ON ?auto_293076 ?auto_293077 ) ( CLEAR ?auto_293076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_293071 ?auto_293072 ?auto_293073 ?auto_293074 ?auto_293075 ?auto_293076 )
      ( MAKE-9PILE ?auto_293071 ?auto_293072 ?auto_293073 ?auto_293074 ?auto_293075 ?auto_293076 ?auto_293077 ?auto_293078 ?auto_293079 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293109 - BLOCK
      ?auto_293110 - BLOCK
      ?auto_293111 - BLOCK
      ?auto_293112 - BLOCK
      ?auto_293113 - BLOCK
      ?auto_293114 - BLOCK
      ?auto_293115 - BLOCK
      ?auto_293116 - BLOCK
      ?auto_293117 - BLOCK
    )
    :vars
    (
      ?auto_293118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293117 ?auto_293118 ) ( ON-TABLE ?auto_293109 ) ( ON ?auto_293110 ?auto_293109 ) ( ON ?auto_293111 ?auto_293110 ) ( ON ?auto_293112 ?auto_293111 ) ( not ( = ?auto_293109 ?auto_293110 ) ) ( not ( = ?auto_293109 ?auto_293111 ) ) ( not ( = ?auto_293109 ?auto_293112 ) ) ( not ( = ?auto_293109 ?auto_293113 ) ) ( not ( = ?auto_293109 ?auto_293114 ) ) ( not ( = ?auto_293109 ?auto_293115 ) ) ( not ( = ?auto_293109 ?auto_293116 ) ) ( not ( = ?auto_293109 ?auto_293117 ) ) ( not ( = ?auto_293109 ?auto_293118 ) ) ( not ( = ?auto_293110 ?auto_293111 ) ) ( not ( = ?auto_293110 ?auto_293112 ) ) ( not ( = ?auto_293110 ?auto_293113 ) ) ( not ( = ?auto_293110 ?auto_293114 ) ) ( not ( = ?auto_293110 ?auto_293115 ) ) ( not ( = ?auto_293110 ?auto_293116 ) ) ( not ( = ?auto_293110 ?auto_293117 ) ) ( not ( = ?auto_293110 ?auto_293118 ) ) ( not ( = ?auto_293111 ?auto_293112 ) ) ( not ( = ?auto_293111 ?auto_293113 ) ) ( not ( = ?auto_293111 ?auto_293114 ) ) ( not ( = ?auto_293111 ?auto_293115 ) ) ( not ( = ?auto_293111 ?auto_293116 ) ) ( not ( = ?auto_293111 ?auto_293117 ) ) ( not ( = ?auto_293111 ?auto_293118 ) ) ( not ( = ?auto_293112 ?auto_293113 ) ) ( not ( = ?auto_293112 ?auto_293114 ) ) ( not ( = ?auto_293112 ?auto_293115 ) ) ( not ( = ?auto_293112 ?auto_293116 ) ) ( not ( = ?auto_293112 ?auto_293117 ) ) ( not ( = ?auto_293112 ?auto_293118 ) ) ( not ( = ?auto_293113 ?auto_293114 ) ) ( not ( = ?auto_293113 ?auto_293115 ) ) ( not ( = ?auto_293113 ?auto_293116 ) ) ( not ( = ?auto_293113 ?auto_293117 ) ) ( not ( = ?auto_293113 ?auto_293118 ) ) ( not ( = ?auto_293114 ?auto_293115 ) ) ( not ( = ?auto_293114 ?auto_293116 ) ) ( not ( = ?auto_293114 ?auto_293117 ) ) ( not ( = ?auto_293114 ?auto_293118 ) ) ( not ( = ?auto_293115 ?auto_293116 ) ) ( not ( = ?auto_293115 ?auto_293117 ) ) ( not ( = ?auto_293115 ?auto_293118 ) ) ( not ( = ?auto_293116 ?auto_293117 ) ) ( not ( = ?auto_293116 ?auto_293118 ) ) ( not ( = ?auto_293117 ?auto_293118 ) ) ( ON ?auto_293116 ?auto_293117 ) ( ON ?auto_293115 ?auto_293116 ) ( ON ?auto_293114 ?auto_293115 ) ( CLEAR ?auto_293112 ) ( ON ?auto_293113 ?auto_293114 ) ( CLEAR ?auto_293113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_293109 ?auto_293110 ?auto_293111 ?auto_293112 ?auto_293113 )
      ( MAKE-9PILE ?auto_293109 ?auto_293110 ?auto_293111 ?auto_293112 ?auto_293113 ?auto_293114 ?auto_293115 ?auto_293116 ?auto_293117 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293147 - BLOCK
      ?auto_293148 - BLOCK
      ?auto_293149 - BLOCK
      ?auto_293150 - BLOCK
      ?auto_293151 - BLOCK
      ?auto_293152 - BLOCK
      ?auto_293153 - BLOCK
      ?auto_293154 - BLOCK
      ?auto_293155 - BLOCK
    )
    :vars
    (
      ?auto_293156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293155 ?auto_293156 ) ( ON-TABLE ?auto_293147 ) ( ON ?auto_293148 ?auto_293147 ) ( ON ?auto_293149 ?auto_293148 ) ( not ( = ?auto_293147 ?auto_293148 ) ) ( not ( = ?auto_293147 ?auto_293149 ) ) ( not ( = ?auto_293147 ?auto_293150 ) ) ( not ( = ?auto_293147 ?auto_293151 ) ) ( not ( = ?auto_293147 ?auto_293152 ) ) ( not ( = ?auto_293147 ?auto_293153 ) ) ( not ( = ?auto_293147 ?auto_293154 ) ) ( not ( = ?auto_293147 ?auto_293155 ) ) ( not ( = ?auto_293147 ?auto_293156 ) ) ( not ( = ?auto_293148 ?auto_293149 ) ) ( not ( = ?auto_293148 ?auto_293150 ) ) ( not ( = ?auto_293148 ?auto_293151 ) ) ( not ( = ?auto_293148 ?auto_293152 ) ) ( not ( = ?auto_293148 ?auto_293153 ) ) ( not ( = ?auto_293148 ?auto_293154 ) ) ( not ( = ?auto_293148 ?auto_293155 ) ) ( not ( = ?auto_293148 ?auto_293156 ) ) ( not ( = ?auto_293149 ?auto_293150 ) ) ( not ( = ?auto_293149 ?auto_293151 ) ) ( not ( = ?auto_293149 ?auto_293152 ) ) ( not ( = ?auto_293149 ?auto_293153 ) ) ( not ( = ?auto_293149 ?auto_293154 ) ) ( not ( = ?auto_293149 ?auto_293155 ) ) ( not ( = ?auto_293149 ?auto_293156 ) ) ( not ( = ?auto_293150 ?auto_293151 ) ) ( not ( = ?auto_293150 ?auto_293152 ) ) ( not ( = ?auto_293150 ?auto_293153 ) ) ( not ( = ?auto_293150 ?auto_293154 ) ) ( not ( = ?auto_293150 ?auto_293155 ) ) ( not ( = ?auto_293150 ?auto_293156 ) ) ( not ( = ?auto_293151 ?auto_293152 ) ) ( not ( = ?auto_293151 ?auto_293153 ) ) ( not ( = ?auto_293151 ?auto_293154 ) ) ( not ( = ?auto_293151 ?auto_293155 ) ) ( not ( = ?auto_293151 ?auto_293156 ) ) ( not ( = ?auto_293152 ?auto_293153 ) ) ( not ( = ?auto_293152 ?auto_293154 ) ) ( not ( = ?auto_293152 ?auto_293155 ) ) ( not ( = ?auto_293152 ?auto_293156 ) ) ( not ( = ?auto_293153 ?auto_293154 ) ) ( not ( = ?auto_293153 ?auto_293155 ) ) ( not ( = ?auto_293153 ?auto_293156 ) ) ( not ( = ?auto_293154 ?auto_293155 ) ) ( not ( = ?auto_293154 ?auto_293156 ) ) ( not ( = ?auto_293155 ?auto_293156 ) ) ( ON ?auto_293154 ?auto_293155 ) ( ON ?auto_293153 ?auto_293154 ) ( ON ?auto_293152 ?auto_293153 ) ( ON ?auto_293151 ?auto_293152 ) ( CLEAR ?auto_293149 ) ( ON ?auto_293150 ?auto_293151 ) ( CLEAR ?auto_293150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_293147 ?auto_293148 ?auto_293149 ?auto_293150 )
      ( MAKE-9PILE ?auto_293147 ?auto_293148 ?auto_293149 ?auto_293150 ?auto_293151 ?auto_293152 ?auto_293153 ?auto_293154 ?auto_293155 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293185 - BLOCK
      ?auto_293186 - BLOCK
      ?auto_293187 - BLOCK
      ?auto_293188 - BLOCK
      ?auto_293189 - BLOCK
      ?auto_293190 - BLOCK
      ?auto_293191 - BLOCK
      ?auto_293192 - BLOCK
      ?auto_293193 - BLOCK
    )
    :vars
    (
      ?auto_293194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293193 ?auto_293194 ) ( ON-TABLE ?auto_293185 ) ( ON ?auto_293186 ?auto_293185 ) ( not ( = ?auto_293185 ?auto_293186 ) ) ( not ( = ?auto_293185 ?auto_293187 ) ) ( not ( = ?auto_293185 ?auto_293188 ) ) ( not ( = ?auto_293185 ?auto_293189 ) ) ( not ( = ?auto_293185 ?auto_293190 ) ) ( not ( = ?auto_293185 ?auto_293191 ) ) ( not ( = ?auto_293185 ?auto_293192 ) ) ( not ( = ?auto_293185 ?auto_293193 ) ) ( not ( = ?auto_293185 ?auto_293194 ) ) ( not ( = ?auto_293186 ?auto_293187 ) ) ( not ( = ?auto_293186 ?auto_293188 ) ) ( not ( = ?auto_293186 ?auto_293189 ) ) ( not ( = ?auto_293186 ?auto_293190 ) ) ( not ( = ?auto_293186 ?auto_293191 ) ) ( not ( = ?auto_293186 ?auto_293192 ) ) ( not ( = ?auto_293186 ?auto_293193 ) ) ( not ( = ?auto_293186 ?auto_293194 ) ) ( not ( = ?auto_293187 ?auto_293188 ) ) ( not ( = ?auto_293187 ?auto_293189 ) ) ( not ( = ?auto_293187 ?auto_293190 ) ) ( not ( = ?auto_293187 ?auto_293191 ) ) ( not ( = ?auto_293187 ?auto_293192 ) ) ( not ( = ?auto_293187 ?auto_293193 ) ) ( not ( = ?auto_293187 ?auto_293194 ) ) ( not ( = ?auto_293188 ?auto_293189 ) ) ( not ( = ?auto_293188 ?auto_293190 ) ) ( not ( = ?auto_293188 ?auto_293191 ) ) ( not ( = ?auto_293188 ?auto_293192 ) ) ( not ( = ?auto_293188 ?auto_293193 ) ) ( not ( = ?auto_293188 ?auto_293194 ) ) ( not ( = ?auto_293189 ?auto_293190 ) ) ( not ( = ?auto_293189 ?auto_293191 ) ) ( not ( = ?auto_293189 ?auto_293192 ) ) ( not ( = ?auto_293189 ?auto_293193 ) ) ( not ( = ?auto_293189 ?auto_293194 ) ) ( not ( = ?auto_293190 ?auto_293191 ) ) ( not ( = ?auto_293190 ?auto_293192 ) ) ( not ( = ?auto_293190 ?auto_293193 ) ) ( not ( = ?auto_293190 ?auto_293194 ) ) ( not ( = ?auto_293191 ?auto_293192 ) ) ( not ( = ?auto_293191 ?auto_293193 ) ) ( not ( = ?auto_293191 ?auto_293194 ) ) ( not ( = ?auto_293192 ?auto_293193 ) ) ( not ( = ?auto_293192 ?auto_293194 ) ) ( not ( = ?auto_293193 ?auto_293194 ) ) ( ON ?auto_293192 ?auto_293193 ) ( ON ?auto_293191 ?auto_293192 ) ( ON ?auto_293190 ?auto_293191 ) ( ON ?auto_293189 ?auto_293190 ) ( ON ?auto_293188 ?auto_293189 ) ( CLEAR ?auto_293186 ) ( ON ?auto_293187 ?auto_293188 ) ( CLEAR ?auto_293187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_293185 ?auto_293186 ?auto_293187 )
      ( MAKE-9PILE ?auto_293185 ?auto_293186 ?auto_293187 ?auto_293188 ?auto_293189 ?auto_293190 ?auto_293191 ?auto_293192 ?auto_293193 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293223 - BLOCK
      ?auto_293224 - BLOCK
      ?auto_293225 - BLOCK
      ?auto_293226 - BLOCK
      ?auto_293227 - BLOCK
      ?auto_293228 - BLOCK
      ?auto_293229 - BLOCK
      ?auto_293230 - BLOCK
      ?auto_293231 - BLOCK
    )
    :vars
    (
      ?auto_293232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293231 ?auto_293232 ) ( ON-TABLE ?auto_293223 ) ( not ( = ?auto_293223 ?auto_293224 ) ) ( not ( = ?auto_293223 ?auto_293225 ) ) ( not ( = ?auto_293223 ?auto_293226 ) ) ( not ( = ?auto_293223 ?auto_293227 ) ) ( not ( = ?auto_293223 ?auto_293228 ) ) ( not ( = ?auto_293223 ?auto_293229 ) ) ( not ( = ?auto_293223 ?auto_293230 ) ) ( not ( = ?auto_293223 ?auto_293231 ) ) ( not ( = ?auto_293223 ?auto_293232 ) ) ( not ( = ?auto_293224 ?auto_293225 ) ) ( not ( = ?auto_293224 ?auto_293226 ) ) ( not ( = ?auto_293224 ?auto_293227 ) ) ( not ( = ?auto_293224 ?auto_293228 ) ) ( not ( = ?auto_293224 ?auto_293229 ) ) ( not ( = ?auto_293224 ?auto_293230 ) ) ( not ( = ?auto_293224 ?auto_293231 ) ) ( not ( = ?auto_293224 ?auto_293232 ) ) ( not ( = ?auto_293225 ?auto_293226 ) ) ( not ( = ?auto_293225 ?auto_293227 ) ) ( not ( = ?auto_293225 ?auto_293228 ) ) ( not ( = ?auto_293225 ?auto_293229 ) ) ( not ( = ?auto_293225 ?auto_293230 ) ) ( not ( = ?auto_293225 ?auto_293231 ) ) ( not ( = ?auto_293225 ?auto_293232 ) ) ( not ( = ?auto_293226 ?auto_293227 ) ) ( not ( = ?auto_293226 ?auto_293228 ) ) ( not ( = ?auto_293226 ?auto_293229 ) ) ( not ( = ?auto_293226 ?auto_293230 ) ) ( not ( = ?auto_293226 ?auto_293231 ) ) ( not ( = ?auto_293226 ?auto_293232 ) ) ( not ( = ?auto_293227 ?auto_293228 ) ) ( not ( = ?auto_293227 ?auto_293229 ) ) ( not ( = ?auto_293227 ?auto_293230 ) ) ( not ( = ?auto_293227 ?auto_293231 ) ) ( not ( = ?auto_293227 ?auto_293232 ) ) ( not ( = ?auto_293228 ?auto_293229 ) ) ( not ( = ?auto_293228 ?auto_293230 ) ) ( not ( = ?auto_293228 ?auto_293231 ) ) ( not ( = ?auto_293228 ?auto_293232 ) ) ( not ( = ?auto_293229 ?auto_293230 ) ) ( not ( = ?auto_293229 ?auto_293231 ) ) ( not ( = ?auto_293229 ?auto_293232 ) ) ( not ( = ?auto_293230 ?auto_293231 ) ) ( not ( = ?auto_293230 ?auto_293232 ) ) ( not ( = ?auto_293231 ?auto_293232 ) ) ( ON ?auto_293230 ?auto_293231 ) ( ON ?auto_293229 ?auto_293230 ) ( ON ?auto_293228 ?auto_293229 ) ( ON ?auto_293227 ?auto_293228 ) ( ON ?auto_293226 ?auto_293227 ) ( ON ?auto_293225 ?auto_293226 ) ( CLEAR ?auto_293223 ) ( ON ?auto_293224 ?auto_293225 ) ( CLEAR ?auto_293224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_293223 ?auto_293224 )
      ( MAKE-9PILE ?auto_293223 ?auto_293224 ?auto_293225 ?auto_293226 ?auto_293227 ?auto_293228 ?auto_293229 ?auto_293230 ?auto_293231 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_293261 - BLOCK
      ?auto_293262 - BLOCK
      ?auto_293263 - BLOCK
      ?auto_293264 - BLOCK
      ?auto_293265 - BLOCK
      ?auto_293266 - BLOCK
      ?auto_293267 - BLOCK
      ?auto_293268 - BLOCK
      ?auto_293269 - BLOCK
    )
    :vars
    (
      ?auto_293270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293269 ?auto_293270 ) ( not ( = ?auto_293261 ?auto_293262 ) ) ( not ( = ?auto_293261 ?auto_293263 ) ) ( not ( = ?auto_293261 ?auto_293264 ) ) ( not ( = ?auto_293261 ?auto_293265 ) ) ( not ( = ?auto_293261 ?auto_293266 ) ) ( not ( = ?auto_293261 ?auto_293267 ) ) ( not ( = ?auto_293261 ?auto_293268 ) ) ( not ( = ?auto_293261 ?auto_293269 ) ) ( not ( = ?auto_293261 ?auto_293270 ) ) ( not ( = ?auto_293262 ?auto_293263 ) ) ( not ( = ?auto_293262 ?auto_293264 ) ) ( not ( = ?auto_293262 ?auto_293265 ) ) ( not ( = ?auto_293262 ?auto_293266 ) ) ( not ( = ?auto_293262 ?auto_293267 ) ) ( not ( = ?auto_293262 ?auto_293268 ) ) ( not ( = ?auto_293262 ?auto_293269 ) ) ( not ( = ?auto_293262 ?auto_293270 ) ) ( not ( = ?auto_293263 ?auto_293264 ) ) ( not ( = ?auto_293263 ?auto_293265 ) ) ( not ( = ?auto_293263 ?auto_293266 ) ) ( not ( = ?auto_293263 ?auto_293267 ) ) ( not ( = ?auto_293263 ?auto_293268 ) ) ( not ( = ?auto_293263 ?auto_293269 ) ) ( not ( = ?auto_293263 ?auto_293270 ) ) ( not ( = ?auto_293264 ?auto_293265 ) ) ( not ( = ?auto_293264 ?auto_293266 ) ) ( not ( = ?auto_293264 ?auto_293267 ) ) ( not ( = ?auto_293264 ?auto_293268 ) ) ( not ( = ?auto_293264 ?auto_293269 ) ) ( not ( = ?auto_293264 ?auto_293270 ) ) ( not ( = ?auto_293265 ?auto_293266 ) ) ( not ( = ?auto_293265 ?auto_293267 ) ) ( not ( = ?auto_293265 ?auto_293268 ) ) ( not ( = ?auto_293265 ?auto_293269 ) ) ( not ( = ?auto_293265 ?auto_293270 ) ) ( not ( = ?auto_293266 ?auto_293267 ) ) ( not ( = ?auto_293266 ?auto_293268 ) ) ( not ( = ?auto_293266 ?auto_293269 ) ) ( not ( = ?auto_293266 ?auto_293270 ) ) ( not ( = ?auto_293267 ?auto_293268 ) ) ( not ( = ?auto_293267 ?auto_293269 ) ) ( not ( = ?auto_293267 ?auto_293270 ) ) ( not ( = ?auto_293268 ?auto_293269 ) ) ( not ( = ?auto_293268 ?auto_293270 ) ) ( not ( = ?auto_293269 ?auto_293270 ) ) ( ON ?auto_293268 ?auto_293269 ) ( ON ?auto_293267 ?auto_293268 ) ( ON ?auto_293266 ?auto_293267 ) ( ON ?auto_293265 ?auto_293266 ) ( ON ?auto_293264 ?auto_293265 ) ( ON ?auto_293263 ?auto_293264 ) ( ON ?auto_293262 ?auto_293263 ) ( ON ?auto_293261 ?auto_293262 ) ( CLEAR ?auto_293261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_293261 )
      ( MAKE-9PILE ?auto_293261 ?auto_293262 ?auto_293263 ?auto_293264 ?auto_293265 ?auto_293266 ?auto_293267 ?auto_293268 ?auto_293269 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293300 - BLOCK
      ?auto_293301 - BLOCK
      ?auto_293302 - BLOCK
      ?auto_293303 - BLOCK
      ?auto_293304 - BLOCK
      ?auto_293305 - BLOCK
      ?auto_293306 - BLOCK
      ?auto_293307 - BLOCK
      ?auto_293308 - BLOCK
      ?auto_293309 - BLOCK
    )
    :vars
    (
      ?auto_293310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_293308 ) ( ON ?auto_293309 ?auto_293310 ) ( CLEAR ?auto_293309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_293300 ) ( ON ?auto_293301 ?auto_293300 ) ( ON ?auto_293302 ?auto_293301 ) ( ON ?auto_293303 ?auto_293302 ) ( ON ?auto_293304 ?auto_293303 ) ( ON ?auto_293305 ?auto_293304 ) ( ON ?auto_293306 ?auto_293305 ) ( ON ?auto_293307 ?auto_293306 ) ( ON ?auto_293308 ?auto_293307 ) ( not ( = ?auto_293300 ?auto_293301 ) ) ( not ( = ?auto_293300 ?auto_293302 ) ) ( not ( = ?auto_293300 ?auto_293303 ) ) ( not ( = ?auto_293300 ?auto_293304 ) ) ( not ( = ?auto_293300 ?auto_293305 ) ) ( not ( = ?auto_293300 ?auto_293306 ) ) ( not ( = ?auto_293300 ?auto_293307 ) ) ( not ( = ?auto_293300 ?auto_293308 ) ) ( not ( = ?auto_293300 ?auto_293309 ) ) ( not ( = ?auto_293300 ?auto_293310 ) ) ( not ( = ?auto_293301 ?auto_293302 ) ) ( not ( = ?auto_293301 ?auto_293303 ) ) ( not ( = ?auto_293301 ?auto_293304 ) ) ( not ( = ?auto_293301 ?auto_293305 ) ) ( not ( = ?auto_293301 ?auto_293306 ) ) ( not ( = ?auto_293301 ?auto_293307 ) ) ( not ( = ?auto_293301 ?auto_293308 ) ) ( not ( = ?auto_293301 ?auto_293309 ) ) ( not ( = ?auto_293301 ?auto_293310 ) ) ( not ( = ?auto_293302 ?auto_293303 ) ) ( not ( = ?auto_293302 ?auto_293304 ) ) ( not ( = ?auto_293302 ?auto_293305 ) ) ( not ( = ?auto_293302 ?auto_293306 ) ) ( not ( = ?auto_293302 ?auto_293307 ) ) ( not ( = ?auto_293302 ?auto_293308 ) ) ( not ( = ?auto_293302 ?auto_293309 ) ) ( not ( = ?auto_293302 ?auto_293310 ) ) ( not ( = ?auto_293303 ?auto_293304 ) ) ( not ( = ?auto_293303 ?auto_293305 ) ) ( not ( = ?auto_293303 ?auto_293306 ) ) ( not ( = ?auto_293303 ?auto_293307 ) ) ( not ( = ?auto_293303 ?auto_293308 ) ) ( not ( = ?auto_293303 ?auto_293309 ) ) ( not ( = ?auto_293303 ?auto_293310 ) ) ( not ( = ?auto_293304 ?auto_293305 ) ) ( not ( = ?auto_293304 ?auto_293306 ) ) ( not ( = ?auto_293304 ?auto_293307 ) ) ( not ( = ?auto_293304 ?auto_293308 ) ) ( not ( = ?auto_293304 ?auto_293309 ) ) ( not ( = ?auto_293304 ?auto_293310 ) ) ( not ( = ?auto_293305 ?auto_293306 ) ) ( not ( = ?auto_293305 ?auto_293307 ) ) ( not ( = ?auto_293305 ?auto_293308 ) ) ( not ( = ?auto_293305 ?auto_293309 ) ) ( not ( = ?auto_293305 ?auto_293310 ) ) ( not ( = ?auto_293306 ?auto_293307 ) ) ( not ( = ?auto_293306 ?auto_293308 ) ) ( not ( = ?auto_293306 ?auto_293309 ) ) ( not ( = ?auto_293306 ?auto_293310 ) ) ( not ( = ?auto_293307 ?auto_293308 ) ) ( not ( = ?auto_293307 ?auto_293309 ) ) ( not ( = ?auto_293307 ?auto_293310 ) ) ( not ( = ?auto_293308 ?auto_293309 ) ) ( not ( = ?auto_293308 ?auto_293310 ) ) ( not ( = ?auto_293309 ?auto_293310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_293309 ?auto_293310 )
      ( !STACK ?auto_293309 ?auto_293308 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293342 - BLOCK
      ?auto_293343 - BLOCK
      ?auto_293344 - BLOCK
      ?auto_293345 - BLOCK
      ?auto_293346 - BLOCK
      ?auto_293347 - BLOCK
      ?auto_293348 - BLOCK
      ?auto_293349 - BLOCK
      ?auto_293350 - BLOCK
      ?auto_293351 - BLOCK
    )
    :vars
    (
      ?auto_293352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293351 ?auto_293352 ) ( ON-TABLE ?auto_293342 ) ( ON ?auto_293343 ?auto_293342 ) ( ON ?auto_293344 ?auto_293343 ) ( ON ?auto_293345 ?auto_293344 ) ( ON ?auto_293346 ?auto_293345 ) ( ON ?auto_293347 ?auto_293346 ) ( ON ?auto_293348 ?auto_293347 ) ( ON ?auto_293349 ?auto_293348 ) ( not ( = ?auto_293342 ?auto_293343 ) ) ( not ( = ?auto_293342 ?auto_293344 ) ) ( not ( = ?auto_293342 ?auto_293345 ) ) ( not ( = ?auto_293342 ?auto_293346 ) ) ( not ( = ?auto_293342 ?auto_293347 ) ) ( not ( = ?auto_293342 ?auto_293348 ) ) ( not ( = ?auto_293342 ?auto_293349 ) ) ( not ( = ?auto_293342 ?auto_293350 ) ) ( not ( = ?auto_293342 ?auto_293351 ) ) ( not ( = ?auto_293342 ?auto_293352 ) ) ( not ( = ?auto_293343 ?auto_293344 ) ) ( not ( = ?auto_293343 ?auto_293345 ) ) ( not ( = ?auto_293343 ?auto_293346 ) ) ( not ( = ?auto_293343 ?auto_293347 ) ) ( not ( = ?auto_293343 ?auto_293348 ) ) ( not ( = ?auto_293343 ?auto_293349 ) ) ( not ( = ?auto_293343 ?auto_293350 ) ) ( not ( = ?auto_293343 ?auto_293351 ) ) ( not ( = ?auto_293343 ?auto_293352 ) ) ( not ( = ?auto_293344 ?auto_293345 ) ) ( not ( = ?auto_293344 ?auto_293346 ) ) ( not ( = ?auto_293344 ?auto_293347 ) ) ( not ( = ?auto_293344 ?auto_293348 ) ) ( not ( = ?auto_293344 ?auto_293349 ) ) ( not ( = ?auto_293344 ?auto_293350 ) ) ( not ( = ?auto_293344 ?auto_293351 ) ) ( not ( = ?auto_293344 ?auto_293352 ) ) ( not ( = ?auto_293345 ?auto_293346 ) ) ( not ( = ?auto_293345 ?auto_293347 ) ) ( not ( = ?auto_293345 ?auto_293348 ) ) ( not ( = ?auto_293345 ?auto_293349 ) ) ( not ( = ?auto_293345 ?auto_293350 ) ) ( not ( = ?auto_293345 ?auto_293351 ) ) ( not ( = ?auto_293345 ?auto_293352 ) ) ( not ( = ?auto_293346 ?auto_293347 ) ) ( not ( = ?auto_293346 ?auto_293348 ) ) ( not ( = ?auto_293346 ?auto_293349 ) ) ( not ( = ?auto_293346 ?auto_293350 ) ) ( not ( = ?auto_293346 ?auto_293351 ) ) ( not ( = ?auto_293346 ?auto_293352 ) ) ( not ( = ?auto_293347 ?auto_293348 ) ) ( not ( = ?auto_293347 ?auto_293349 ) ) ( not ( = ?auto_293347 ?auto_293350 ) ) ( not ( = ?auto_293347 ?auto_293351 ) ) ( not ( = ?auto_293347 ?auto_293352 ) ) ( not ( = ?auto_293348 ?auto_293349 ) ) ( not ( = ?auto_293348 ?auto_293350 ) ) ( not ( = ?auto_293348 ?auto_293351 ) ) ( not ( = ?auto_293348 ?auto_293352 ) ) ( not ( = ?auto_293349 ?auto_293350 ) ) ( not ( = ?auto_293349 ?auto_293351 ) ) ( not ( = ?auto_293349 ?auto_293352 ) ) ( not ( = ?auto_293350 ?auto_293351 ) ) ( not ( = ?auto_293350 ?auto_293352 ) ) ( not ( = ?auto_293351 ?auto_293352 ) ) ( CLEAR ?auto_293349 ) ( ON ?auto_293350 ?auto_293351 ) ( CLEAR ?auto_293350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_293342 ?auto_293343 ?auto_293344 ?auto_293345 ?auto_293346 ?auto_293347 ?auto_293348 ?auto_293349 ?auto_293350 )
      ( MAKE-10PILE ?auto_293342 ?auto_293343 ?auto_293344 ?auto_293345 ?auto_293346 ?auto_293347 ?auto_293348 ?auto_293349 ?auto_293350 ?auto_293351 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293384 - BLOCK
      ?auto_293385 - BLOCK
      ?auto_293386 - BLOCK
      ?auto_293387 - BLOCK
      ?auto_293388 - BLOCK
      ?auto_293389 - BLOCK
      ?auto_293390 - BLOCK
      ?auto_293391 - BLOCK
      ?auto_293392 - BLOCK
      ?auto_293393 - BLOCK
    )
    :vars
    (
      ?auto_293394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293393 ?auto_293394 ) ( ON-TABLE ?auto_293384 ) ( ON ?auto_293385 ?auto_293384 ) ( ON ?auto_293386 ?auto_293385 ) ( ON ?auto_293387 ?auto_293386 ) ( ON ?auto_293388 ?auto_293387 ) ( ON ?auto_293389 ?auto_293388 ) ( ON ?auto_293390 ?auto_293389 ) ( not ( = ?auto_293384 ?auto_293385 ) ) ( not ( = ?auto_293384 ?auto_293386 ) ) ( not ( = ?auto_293384 ?auto_293387 ) ) ( not ( = ?auto_293384 ?auto_293388 ) ) ( not ( = ?auto_293384 ?auto_293389 ) ) ( not ( = ?auto_293384 ?auto_293390 ) ) ( not ( = ?auto_293384 ?auto_293391 ) ) ( not ( = ?auto_293384 ?auto_293392 ) ) ( not ( = ?auto_293384 ?auto_293393 ) ) ( not ( = ?auto_293384 ?auto_293394 ) ) ( not ( = ?auto_293385 ?auto_293386 ) ) ( not ( = ?auto_293385 ?auto_293387 ) ) ( not ( = ?auto_293385 ?auto_293388 ) ) ( not ( = ?auto_293385 ?auto_293389 ) ) ( not ( = ?auto_293385 ?auto_293390 ) ) ( not ( = ?auto_293385 ?auto_293391 ) ) ( not ( = ?auto_293385 ?auto_293392 ) ) ( not ( = ?auto_293385 ?auto_293393 ) ) ( not ( = ?auto_293385 ?auto_293394 ) ) ( not ( = ?auto_293386 ?auto_293387 ) ) ( not ( = ?auto_293386 ?auto_293388 ) ) ( not ( = ?auto_293386 ?auto_293389 ) ) ( not ( = ?auto_293386 ?auto_293390 ) ) ( not ( = ?auto_293386 ?auto_293391 ) ) ( not ( = ?auto_293386 ?auto_293392 ) ) ( not ( = ?auto_293386 ?auto_293393 ) ) ( not ( = ?auto_293386 ?auto_293394 ) ) ( not ( = ?auto_293387 ?auto_293388 ) ) ( not ( = ?auto_293387 ?auto_293389 ) ) ( not ( = ?auto_293387 ?auto_293390 ) ) ( not ( = ?auto_293387 ?auto_293391 ) ) ( not ( = ?auto_293387 ?auto_293392 ) ) ( not ( = ?auto_293387 ?auto_293393 ) ) ( not ( = ?auto_293387 ?auto_293394 ) ) ( not ( = ?auto_293388 ?auto_293389 ) ) ( not ( = ?auto_293388 ?auto_293390 ) ) ( not ( = ?auto_293388 ?auto_293391 ) ) ( not ( = ?auto_293388 ?auto_293392 ) ) ( not ( = ?auto_293388 ?auto_293393 ) ) ( not ( = ?auto_293388 ?auto_293394 ) ) ( not ( = ?auto_293389 ?auto_293390 ) ) ( not ( = ?auto_293389 ?auto_293391 ) ) ( not ( = ?auto_293389 ?auto_293392 ) ) ( not ( = ?auto_293389 ?auto_293393 ) ) ( not ( = ?auto_293389 ?auto_293394 ) ) ( not ( = ?auto_293390 ?auto_293391 ) ) ( not ( = ?auto_293390 ?auto_293392 ) ) ( not ( = ?auto_293390 ?auto_293393 ) ) ( not ( = ?auto_293390 ?auto_293394 ) ) ( not ( = ?auto_293391 ?auto_293392 ) ) ( not ( = ?auto_293391 ?auto_293393 ) ) ( not ( = ?auto_293391 ?auto_293394 ) ) ( not ( = ?auto_293392 ?auto_293393 ) ) ( not ( = ?auto_293392 ?auto_293394 ) ) ( not ( = ?auto_293393 ?auto_293394 ) ) ( ON ?auto_293392 ?auto_293393 ) ( CLEAR ?auto_293390 ) ( ON ?auto_293391 ?auto_293392 ) ( CLEAR ?auto_293391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_293384 ?auto_293385 ?auto_293386 ?auto_293387 ?auto_293388 ?auto_293389 ?auto_293390 ?auto_293391 )
      ( MAKE-10PILE ?auto_293384 ?auto_293385 ?auto_293386 ?auto_293387 ?auto_293388 ?auto_293389 ?auto_293390 ?auto_293391 ?auto_293392 ?auto_293393 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293426 - BLOCK
      ?auto_293427 - BLOCK
      ?auto_293428 - BLOCK
      ?auto_293429 - BLOCK
      ?auto_293430 - BLOCK
      ?auto_293431 - BLOCK
      ?auto_293432 - BLOCK
      ?auto_293433 - BLOCK
      ?auto_293434 - BLOCK
      ?auto_293435 - BLOCK
    )
    :vars
    (
      ?auto_293436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293435 ?auto_293436 ) ( ON-TABLE ?auto_293426 ) ( ON ?auto_293427 ?auto_293426 ) ( ON ?auto_293428 ?auto_293427 ) ( ON ?auto_293429 ?auto_293428 ) ( ON ?auto_293430 ?auto_293429 ) ( ON ?auto_293431 ?auto_293430 ) ( not ( = ?auto_293426 ?auto_293427 ) ) ( not ( = ?auto_293426 ?auto_293428 ) ) ( not ( = ?auto_293426 ?auto_293429 ) ) ( not ( = ?auto_293426 ?auto_293430 ) ) ( not ( = ?auto_293426 ?auto_293431 ) ) ( not ( = ?auto_293426 ?auto_293432 ) ) ( not ( = ?auto_293426 ?auto_293433 ) ) ( not ( = ?auto_293426 ?auto_293434 ) ) ( not ( = ?auto_293426 ?auto_293435 ) ) ( not ( = ?auto_293426 ?auto_293436 ) ) ( not ( = ?auto_293427 ?auto_293428 ) ) ( not ( = ?auto_293427 ?auto_293429 ) ) ( not ( = ?auto_293427 ?auto_293430 ) ) ( not ( = ?auto_293427 ?auto_293431 ) ) ( not ( = ?auto_293427 ?auto_293432 ) ) ( not ( = ?auto_293427 ?auto_293433 ) ) ( not ( = ?auto_293427 ?auto_293434 ) ) ( not ( = ?auto_293427 ?auto_293435 ) ) ( not ( = ?auto_293427 ?auto_293436 ) ) ( not ( = ?auto_293428 ?auto_293429 ) ) ( not ( = ?auto_293428 ?auto_293430 ) ) ( not ( = ?auto_293428 ?auto_293431 ) ) ( not ( = ?auto_293428 ?auto_293432 ) ) ( not ( = ?auto_293428 ?auto_293433 ) ) ( not ( = ?auto_293428 ?auto_293434 ) ) ( not ( = ?auto_293428 ?auto_293435 ) ) ( not ( = ?auto_293428 ?auto_293436 ) ) ( not ( = ?auto_293429 ?auto_293430 ) ) ( not ( = ?auto_293429 ?auto_293431 ) ) ( not ( = ?auto_293429 ?auto_293432 ) ) ( not ( = ?auto_293429 ?auto_293433 ) ) ( not ( = ?auto_293429 ?auto_293434 ) ) ( not ( = ?auto_293429 ?auto_293435 ) ) ( not ( = ?auto_293429 ?auto_293436 ) ) ( not ( = ?auto_293430 ?auto_293431 ) ) ( not ( = ?auto_293430 ?auto_293432 ) ) ( not ( = ?auto_293430 ?auto_293433 ) ) ( not ( = ?auto_293430 ?auto_293434 ) ) ( not ( = ?auto_293430 ?auto_293435 ) ) ( not ( = ?auto_293430 ?auto_293436 ) ) ( not ( = ?auto_293431 ?auto_293432 ) ) ( not ( = ?auto_293431 ?auto_293433 ) ) ( not ( = ?auto_293431 ?auto_293434 ) ) ( not ( = ?auto_293431 ?auto_293435 ) ) ( not ( = ?auto_293431 ?auto_293436 ) ) ( not ( = ?auto_293432 ?auto_293433 ) ) ( not ( = ?auto_293432 ?auto_293434 ) ) ( not ( = ?auto_293432 ?auto_293435 ) ) ( not ( = ?auto_293432 ?auto_293436 ) ) ( not ( = ?auto_293433 ?auto_293434 ) ) ( not ( = ?auto_293433 ?auto_293435 ) ) ( not ( = ?auto_293433 ?auto_293436 ) ) ( not ( = ?auto_293434 ?auto_293435 ) ) ( not ( = ?auto_293434 ?auto_293436 ) ) ( not ( = ?auto_293435 ?auto_293436 ) ) ( ON ?auto_293434 ?auto_293435 ) ( ON ?auto_293433 ?auto_293434 ) ( CLEAR ?auto_293431 ) ( ON ?auto_293432 ?auto_293433 ) ( CLEAR ?auto_293432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_293426 ?auto_293427 ?auto_293428 ?auto_293429 ?auto_293430 ?auto_293431 ?auto_293432 )
      ( MAKE-10PILE ?auto_293426 ?auto_293427 ?auto_293428 ?auto_293429 ?auto_293430 ?auto_293431 ?auto_293432 ?auto_293433 ?auto_293434 ?auto_293435 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293468 - BLOCK
      ?auto_293469 - BLOCK
      ?auto_293470 - BLOCK
      ?auto_293471 - BLOCK
      ?auto_293472 - BLOCK
      ?auto_293473 - BLOCK
      ?auto_293474 - BLOCK
      ?auto_293475 - BLOCK
      ?auto_293476 - BLOCK
      ?auto_293477 - BLOCK
    )
    :vars
    (
      ?auto_293478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293477 ?auto_293478 ) ( ON-TABLE ?auto_293468 ) ( ON ?auto_293469 ?auto_293468 ) ( ON ?auto_293470 ?auto_293469 ) ( ON ?auto_293471 ?auto_293470 ) ( ON ?auto_293472 ?auto_293471 ) ( not ( = ?auto_293468 ?auto_293469 ) ) ( not ( = ?auto_293468 ?auto_293470 ) ) ( not ( = ?auto_293468 ?auto_293471 ) ) ( not ( = ?auto_293468 ?auto_293472 ) ) ( not ( = ?auto_293468 ?auto_293473 ) ) ( not ( = ?auto_293468 ?auto_293474 ) ) ( not ( = ?auto_293468 ?auto_293475 ) ) ( not ( = ?auto_293468 ?auto_293476 ) ) ( not ( = ?auto_293468 ?auto_293477 ) ) ( not ( = ?auto_293468 ?auto_293478 ) ) ( not ( = ?auto_293469 ?auto_293470 ) ) ( not ( = ?auto_293469 ?auto_293471 ) ) ( not ( = ?auto_293469 ?auto_293472 ) ) ( not ( = ?auto_293469 ?auto_293473 ) ) ( not ( = ?auto_293469 ?auto_293474 ) ) ( not ( = ?auto_293469 ?auto_293475 ) ) ( not ( = ?auto_293469 ?auto_293476 ) ) ( not ( = ?auto_293469 ?auto_293477 ) ) ( not ( = ?auto_293469 ?auto_293478 ) ) ( not ( = ?auto_293470 ?auto_293471 ) ) ( not ( = ?auto_293470 ?auto_293472 ) ) ( not ( = ?auto_293470 ?auto_293473 ) ) ( not ( = ?auto_293470 ?auto_293474 ) ) ( not ( = ?auto_293470 ?auto_293475 ) ) ( not ( = ?auto_293470 ?auto_293476 ) ) ( not ( = ?auto_293470 ?auto_293477 ) ) ( not ( = ?auto_293470 ?auto_293478 ) ) ( not ( = ?auto_293471 ?auto_293472 ) ) ( not ( = ?auto_293471 ?auto_293473 ) ) ( not ( = ?auto_293471 ?auto_293474 ) ) ( not ( = ?auto_293471 ?auto_293475 ) ) ( not ( = ?auto_293471 ?auto_293476 ) ) ( not ( = ?auto_293471 ?auto_293477 ) ) ( not ( = ?auto_293471 ?auto_293478 ) ) ( not ( = ?auto_293472 ?auto_293473 ) ) ( not ( = ?auto_293472 ?auto_293474 ) ) ( not ( = ?auto_293472 ?auto_293475 ) ) ( not ( = ?auto_293472 ?auto_293476 ) ) ( not ( = ?auto_293472 ?auto_293477 ) ) ( not ( = ?auto_293472 ?auto_293478 ) ) ( not ( = ?auto_293473 ?auto_293474 ) ) ( not ( = ?auto_293473 ?auto_293475 ) ) ( not ( = ?auto_293473 ?auto_293476 ) ) ( not ( = ?auto_293473 ?auto_293477 ) ) ( not ( = ?auto_293473 ?auto_293478 ) ) ( not ( = ?auto_293474 ?auto_293475 ) ) ( not ( = ?auto_293474 ?auto_293476 ) ) ( not ( = ?auto_293474 ?auto_293477 ) ) ( not ( = ?auto_293474 ?auto_293478 ) ) ( not ( = ?auto_293475 ?auto_293476 ) ) ( not ( = ?auto_293475 ?auto_293477 ) ) ( not ( = ?auto_293475 ?auto_293478 ) ) ( not ( = ?auto_293476 ?auto_293477 ) ) ( not ( = ?auto_293476 ?auto_293478 ) ) ( not ( = ?auto_293477 ?auto_293478 ) ) ( ON ?auto_293476 ?auto_293477 ) ( ON ?auto_293475 ?auto_293476 ) ( ON ?auto_293474 ?auto_293475 ) ( CLEAR ?auto_293472 ) ( ON ?auto_293473 ?auto_293474 ) ( CLEAR ?auto_293473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_293468 ?auto_293469 ?auto_293470 ?auto_293471 ?auto_293472 ?auto_293473 )
      ( MAKE-10PILE ?auto_293468 ?auto_293469 ?auto_293470 ?auto_293471 ?auto_293472 ?auto_293473 ?auto_293474 ?auto_293475 ?auto_293476 ?auto_293477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293510 - BLOCK
      ?auto_293511 - BLOCK
      ?auto_293512 - BLOCK
      ?auto_293513 - BLOCK
      ?auto_293514 - BLOCK
      ?auto_293515 - BLOCK
      ?auto_293516 - BLOCK
      ?auto_293517 - BLOCK
      ?auto_293518 - BLOCK
      ?auto_293519 - BLOCK
    )
    :vars
    (
      ?auto_293520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293519 ?auto_293520 ) ( ON-TABLE ?auto_293510 ) ( ON ?auto_293511 ?auto_293510 ) ( ON ?auto_293512 ?auto_293511 ) ( ON ?auto_293513 ?auto_293512 ) ( not ( = ?auto_293510 ?auto_293511 ) ) ( not ( = ?auto_293510 ?auto_293512 ) ) ( not ( = ?auto_293510 ?auto_293513 ) ) ( not ( = ?auto_293510 ?auto_293514 ) ) ( not ( = ?auto_293510 ?auto_293515 ) ) ( not ( = ?auto_293510 ?auto_293516 ) ) ( not ( = ?auto_293510 ?auto_293517 ) ) ( not ( = ?auto_293510 ?auto_293518 ) ) ( not ( = ?auto_293510 ?auto_293519 ) ) ( not ( = ?auto_293510 ?auto_293520 ) ) ( not ( = ?auto_293511 ?auto_293512 ) ) ( not ( = ?auto_293511 ?auto_293513 ) ) ( not ( = ?auto_293511 ?auto_293514 ) ) ( not ( = ?auto_293511 ?auto_293515 ) ) ( not ( = ?auto_293511 ?auto_293516 ) ) ( not ( = ?auto_293511 ?auto_293517 ) ) ( not ( = ?auto_293511 ?auto_293518 ) ) ( not ( = ?auto_293511 ?auto_293519 ) ) ( not ( = ?auto_293511 ?auto_293520 ) ) ( not ( = ?auto_293512 ?auto_293513 ) ) ( not ( = ?auto_293512 ?auto_293514 ) ) ( not ( = ?auto_293512 ?auto_293515 ) ) ( not ( = ?auto_293512 ?auto_293516 ) ) ( not ( = ?auto_293512 ?auto_293517 ) ) ( not ( = ?auto_293512 ?auto_293518 ) ) ( not ( = ?auto_293512 ?auto_293519 ) ) ( not ( = ?auto_293512 ?auto_293520 ) ) ( not ( = ?auto_293513 ?auto_293514 ) ) ( not ( = ?auto_293513 ?auto_293515 ) ) ( not ( = ?auto_293513 ?auto_293516 ) ) ( not ( = ?auto_293513 ?auto_293517 ) ) ( not ( = ?auto_293513 ?auto_293518 ) ) ( not ( = ?auto_293513 ?auto_293519 ) ) ( not ( = ?auto_293513 ?auto_293520 ) ) ( not ( = ?auto_293514 ?auto_293515 ) ) ( not ( = ?auto_293514 ?auto_293516 ) ) ( not ( = ?auto_293514 ?auto_293517 ) ) ( not ( = ?auto_293514 ?auto_293518 ) ) ( not ( = ?auto_293514 ?auto_293519 ) ) ( not ( = ?auto_293514 ?auto_293520 ) ) ( not ( = ?auto_293515 ?auto_293516 ) ) ( not ( = ?auto_293515 ?auto_293517 ) ) ( not ( = ?auto_293515 ?auto_293518 ) ) ( not ( = ?auto_293515 ?auto_293519 ) ) ( not ( = ?auto_293515 ?auto_293520 ) ) ( not ( = ?auto_293516 ?auto_293517 ) ) ( not ( = ?auto_293516 ?auto_293518 ) ) ( not ( = ?auto_293516 ?auto_293519 ) ) ( not ( = ?auto_293516 ?auto_293520 ) ) ( not ( = ?auto_293517 ?auto_293518 ) ) ( not ( = ?auto_293517 ?auto_293519 ) ) ( not ( = ?auto_293517 ?auto_293520 ) ) ( not ( = ?auto_293518 ?auto_293519 ) ) ( not ( = ?auto_293518 ?auto_293520 ) ) ( not ( = ?auto_293519 ?auto_293520 ) ) ( ON ?auto_293518 ?auto_293519 ) ( ON ?auto_293517 ?auto_293518 ) ( ON ?auto_293516 ?auto_293517 ) ( ON ?auto_293515 ?auto_293516 ) ( CLEAR ?auto_293513 ) ( ON ?auto_293514 ?auto_293515 ) ( CLEAR ?auto_293514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_293510 ?auto_293511 ?auto_293512 ?auto_293513 ?auto_293514 )
      ( MAKE-10PILE ?auto_293510 ?auto_293511 ?auto_293512 ?auto_293513 ?auto_293514 ?auto_293515 ?auto_293516 ?auto_293517 ?auto_293518 ?auto_293519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293552 - BLOCK
      ?auto_293553 - BLOCK
      ?auto_293554 - BLOCK
      ?auto_293555 - BLOCK
      ?auto_293556 - BLOCK
      ?auto_293557 - BLOCK
      ?auto_293558 - BLOCK
      ?auto_293559 - BLOCK
      ?auto_293560 - BLOCK
      ?auto_293561 - BLOCK
    )
    :vars
    (
      ?auto_293562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293561 ?auto_293562 ) ( ON-TABLE ?auto_293552 ) ( ON ?auto_293553 ?auto_293552 ) ( ON ?auto_293554 ?auto_293553 ) ( not ( = ?auto_293552 ?auto_293553 ) ) ( not ( = ?auto_293552 ?auto_293554 ) ) ( not ( = ?auto_293552 ?auto_293555 ) ) ( not ( = ?auto_293552 ?auto_293556 ) ) ( not ( = ?auto_293552 ?auto_293557 ) ) ( not ( = ?auto_293552 ?auto_293558 ) ) ( not ( = ?auto_293552 ?auto_293559 ) ) ( not ( = ?auto_293552 ?auto_293560 ) ) ( not ( = ?auto_293552 ?auto_293561 ) ) ( not ( = ?auto_293552 ?auto_293562 ) ) ( not ( = ?auto_293553 ?auto_293554 ) ) ( not ( = ?auto_293553 ?auto_293555 ) ) ( not ( = ?auto_293553 ?auto_293556 ) ) ( not ( = ?auto_293553 ?auto_293557 ) ) ( not ( = ?auto_293553 ?auto_293558 ) ) ( not ( = ?auto_293553 ?auto_293559 ) ) ( not ( = ?auto_293553 ?auto_293560 ) ) ( not ( = ?auto_293553 ?auto_293561 ) ) ( not ( = ?auto_293553 ?auto_293562 ) ) ( not ( = ?auto_293554 ?auto_293555 ) ) ( not ( = ?auto_293554 ?auto_293556 ) ) ( not ( = ?auto_293554 ?auto_293557 ) ) ( not ( = ?auto_293554 ?auto_293558 ) ) ( not ( = ?auto_293554 ?auto_293559 ) ) ( not ( = ?auto_293554 ?auto_293560 ) ) ( not ( = ?auto_293554 ?auto_293561 ) ) ( not ( = ?auto_293554 ?auto_293562 ) ) ( not ( = ?auto_293555 ?auto_293556 ) ) ( not ( = ?auto_293555 ?auto_293557 ) ) ( not ( = ?auto_293555 ?auto_293558 ) ) ( not ( = ?auto_293555 ?auto_293559 ) ) ( not ( = ?auto_293555 ?auto_293560 ) ) ( not ( = ?auto_293555 ?auto_293561 ) ) ( not ( = ?auto_293555 ?auto_293562 ) ) ( not ( = ?auto_293556 ?auto_293557 ) ) ( not ( = ?auto_293556 ?auto_293558 ) ) ( not ( = ?auto_293556 ?auto_293559 ) ) ( not ( = ?auto_293556 ?auto_293560 ) ) ( not ( = ?auto_293556 ?auto_293561 ) ) ( not ( = ?auto_293556 ?auto_293562 ) ) ( not ( = ?auto_293557 ?auto_293558 ) ) ( not ( = ?auto_293557 ?auto_293559 ) ) ( not ( = ?auto_293557 ?auto_293560 ) ) ( not ( = ?auto_293557 ?auto_293561 ) ) ( not ( = ?auto_293557 ?auto_293562 ) ) ( not ( = ?auto_293558 ?auto_293559 ) ) ( not ( = ?auto_293558 ?auto_293560 ) ) ( not ( = ?auto_293558 ?auto_293561 ) ) ( not ( = ?auto_293558 ?auto_293562 ) ) ( not ( = ?auto_293559 ?auto_293560 ) ) ( not ( = ?auto_293559 ?auto_293561 ) ) ( not ( = ?auto_293559 ?auto_293562 ) ) ( not ( = ?auto_293560 ?auto_293561 ) ) ( not ( = ?auto_293560 ?auto_293562 ) ) ( not ( = ?auto_293561 ?auto_293562 ) ) ( ON ?auto_293560 ?auto_293561 ) ( ON ?auto_293559 ?auto_293560 ) ( ON ?auto_293558 ?auto_293559 ) ( ON ?auto_293557 ?auto_293558 ) ( ON ?auto_293556 ?auto_293557 ) ( CLEAR ?auto_293554 ) ( ON ?auto_293555 ?auto_293556 ) ( CLEAR ?auto_293555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_293552 ?auto_293553 ?auto_293554 ?auto_293555 )
      ( MAKE-10PILE ?auto_293552 ?auto_293553 ?auto_293554 ?auto_293555 ?auto_293556 ?auto_293557 ?auto_293558 ?auto_293559 ?auto_293560 ?auto_293561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293594 - BLOCK
      ?auto_293595 - BLOCK
      ?auto_293596 - BLOCK
      ?auto_293597 - BLOCK
      ?auto_293598 - BLOCK
      ?auto_293599 - BLOCK
      ?auto_293600 - BLOCK
      ?auto_293601 - BLOCK
      ?auto_293602 - BLOCK
      ?auto_293603 - BLOCK
    )
    :vars
    (
      ?auto_293604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293603 ?auto_293604 ) ( ON-TABLE ?auto_293594 ) ( ON ?auto_293595 ?auto_293594 ) ( not ( = ?auto_293594 ?auto_293595 ) ) ( not ( = ?auto_293594 ?auto_293596 ) ) ( not ( = ?auto_293594 ?auto_293597 ) ) ( not ( = ?auto_293594 ?auto_293598 ) ) ( not ( = ?auto_293594 ?auto_293599 ) ) ( not ( = ?auto_293594 ?auto_293600 ) ) ( not ( = ?auto_293594 ?auto_293601 ) ) ( not ( = ?auto_293594 ?auto_293602 ) ) ( not ( = ?auto_293594 ?auto_293603 ) ) ( not ( = ?auto_293594 ?auto_293604 ) ) ( not ( = ?auto_293595 ?auto_293596 ) ) ( not ( = ?auto_293595 ?auto_293597 ) ) ( not ( = ?auto_293595 ?auto_293598 ) ) ( not ( = ?auto_293595 ?auto_293599 ) ) ( not ( = ?auto_293595 ?auto_293600 ) ) ( not ( = ?auto_293595 ?auto_293601 ) ) ( not ( = ?auto_293595 ?auto_293602 ) ) ( not ( = ?auto_293595 ?auto_293603 ) ) ( not ( = ?auto_293595 ?auto_293604 ) ) ( not ( = ?auto_293596 ?auto_293597 ) ) ( not ( = ?auto_293596 ?auto_293598 ) ) ( not ( = ?auto_293596 ?auto_293599 ) ) ( not ( = ?auto_293596 ?auto_293600 ) ) ( not ( = ?auto_293596 ?auto_293601 ) ) ( not ( = ?auto_293596 ?auto_293602 ) ) ( not ( = ?auto_293596 ?auto_293603 ) ) ( not ( = ?auto_293596 ?auto_293604 ) ) ( not ( = ?auto_293597 ?auto_293598 ) ) ( not ( = ?auto_293597 ?auto_293599 ) ) ( not ( = ?auto_293597 ?auto_293600 ) ) ( not ( = ?auto_293597 ?auto_293601 ) ) ( not ( = ?auto_293597 ?auto_293602 ) ) ( not ( = ?auto_293597 ?auto_293603 ) ) ( not ( = ?auto_293597 ?auto_293604 ) ) ( not ( = ?auto_293598 ?auto_293599 ) ) ( not ( = ?auto_293598 ?auto_293600 ) ) ( not ( = ?auto_293598 ?auto_293601 ) ) ( not ( = ?auto_293598 ?auto_293602 ) ) ( not ( = ?auto_293598 ?auto_293603 ) ) ( not ( = ?auto_293598 ?auto_293604 ) ) ( not ( = ?auto_293599 ?auto_293600 ) ) ( not ( = ?auto_293599 ?auto_293601 ) ) ( not ( = ?auto_293599 ?auto_293602 ) ) ( not ( = ?auto_293599 ?auto_293603 ) ) ( not ( = ?auto_293599 ?auto_293604 ) ) ( not ( = ?auto_293600 ?auto_293601 ) ) ( not ( = ?auto_293600 ?auto_293602 ) ) ( not ( = ?auto_293600 ?auto_293603 ) ) ( not ( = ?auto_293600 ?auto_293604 ) ) ( not ( = ?auto_293601 ?auto_293602 ) ) ( not ( = ?auto_293601 ?auto_293603 ) ) ( not ( = ?auto_293601 ?auto_293604 ) ) ( not ( = ?auto_293602 ?auto_293603 ) ) ( not ( = ?auto_293602 ?auto_293604 ) ) ( not ( = ?auto_293603 ?auto_293604 ) ) ( ON ?auto_293602 ?auto_293603 ) ( ON ?auto_293601 ?auto_293602 ) ( ON ?auto_293600 ?auto_293601 ) ( ON ?auto_293599 ?auto_293600 ) ( ON ?auto_293598 ?auto_293599 ) ( ON ?auto_293597 ?auto_293598 ) ( CLEAR ?auto_293595 ) ( ON ?auto_293596 ?auto_293597 ) ( CLEAR ?auto_293596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_293594 ?auto_293595 ?auto_293596 )
      ( MAKE-10PILE ?auto_293594 ?auto_293595 ?auto_293596 ?auto_293597 ?auto_293598 ?auto_293599 ?auto_293600 ?auto_293601 ?auto_293602 ?auto_293603 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293636 - BLOCK
      ?auto_293637 - BLOCK
      ?auto_293638 - BLOCK
      ?auto_293639 - BLOCK
      ?auto_293640 - BLOCK
      ?auto_293641 - BLOCK
      ?auto_293642 - BLOCK
      ?auto_293643 - BLOCK
      ?auto_293644 - BLOCK
      ?auto_293645 - BLOCK
    )
    :vars
    (
      ?auto_293646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293645 ?auto_293646 ) ( ON-TABLE ?auto_293636 ) ( not ( = ?auto_293636 ?auto_293637 ) ) ( not ( = ?auto_293636 ?auto_293638 ) ) ( not ( = ?auto_293636 ?auto_293639 ) ) ( not ( = ?auto_293636 ?auto_293640 ) ) ( not ( = ?auto_293636 ?auto_293641 ) ) ( not ( = ?auto_293636 ?auto_293642 ) ) ( not ( = ?auto_293636 ?auto_293643 ) ) ( not ( = ?auto_293636 ?auto_293644 ) ) ( not ( = ?auto_293636 ?auto_293645 ) ) ( not ( = ?auto_293636 ?auto_293646 ) ) ( not ( = ?auto_293637 ?auto_293638 ) ) ( not ( = ?auto_293637 ?auto_293639 ) ) ( not ( = ?auto_293637 ?auto_293640 ) ) ( not ( = ?auto_293637 ?auto_293641 ) ) ( not ( = ?auto_293637 ?auto_293642 ) ) ( not ( = ?auto_293637 ?auto_293643 ) ) ( not ( = ?auto_293637 ?auto_293644 ) ) ( not ( = ?auto_293637 ?auto_293645 ) ) ( not ( = ?auto_293637 ?auto_293646 ) ) ( not ( = ?auto_293638 ?auto_293639 ) ) ( not ( = ?auto_293638 ?auto_293640 ) ) ( not ( = ?auto_293638 ?auto_293641 ) ) ( not ( = ?auto_293638 ?auto_293642 ) ) ( not ( = ?auto_293638 ?auto_293643 ) ) ( not ( = ?auto_293638 ?auto_293644 ) ) ( not ( = ?auto_293638 ?auto_293645 ) ) ( not ( = ?auto_293638 ?auto_293646 ) ) ( not ( = ?auto_293639 ?auto_293640 ) ) ( not ( = ?auto_293639 ?auto_293641 ) ) ( not ( = ?auto_293639 ?auto_293642 ) ) ( not ( = ?auto_293639 ?auto_293643 ) ) ( not ( = ?auto_293639 ?auto_293644 ) ) ( not ( = ?auto_293639 ?auto_293645 ) ) ( not ( = ?auto_293639 ?auto_293646 ) ) ( not ( = ?auto_293640 ?auto_293641 ) ) ( not ( = ?auto_293640 ?auto_293642 ) ) ( not ( = ?auto_293640 ?auto_293643 ) ) ( not ( = ?auto_293640 ?auto_293644 ) ) ( not ( = ?auto_293640 ?auto_293645 ) ) ( not ( = ?auto_293640 ?auto_293646 ) ) ( not ( = ?auto_293641 ?auto_293642 ) ) ( not ( = ?auto_293641 ?auto_293643 ) ) ( not ( = ?auto_293641 ?auto_293644 ) ) ( not ( = ?auto_293641 ?auto_293645 ) ) ( not ( = ?auto_293641 ?auto_293646 ) ) ( not ( = ?auto_293642 ?auto_293643 ) ) ( not ( = ?auto_293642 ?auto_293644 ) ) ( not ( = ?auto_293642 ?auto_293645 ) ) ( not ( = ?auto_293642 ?auto_293646 ) ) ( not ( = ?auto_293643 ?auto_293644 ) ) ( not ( = ?auto_293643 ?auto_293645 ) ) ( not ( = ?auto_293643 ?auto_293646 ) ) ( not ( = ?auto_293644 ?auto_293645 ) ) ( not ( = ?auto_293644 ?auto_293646 ) ) ( not ( = ?auto_293645 ?auto_293646 ) ) ( ON ?auto_293644 ?auto_293645 ) ( ON ?auto_293643 ?auto_293644 ) ( ON ?auto_293642 ?auto_293643 ) ( ON ?auto_293641 ?auto_293642 ) ( ON ?auto_293640 ?auto_293641 ) ( ON ?auto_293639 ?auto_293640 ) ( ON ?auto_293638 ?auto_293639 ) ( CLEAR ?auto_293636 ) ( ON ?auto_293637 ?auto_293638 ) ( CLEAR ?auto_293637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_293636 ?auto_293637 )
      ( MAKE-10PILE ?auto_293636 ?auto_293637 ?auto_293638 ?auto_293639 ?auto_293640 ?auto_293641 ?auto_293642 ?auto_293643 ?auto_293644 ?auto_293645 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_293678 - BLOCK
      ?auto_293679 - BLOCK
      ?auto_293680 - BLOCK
      ?auto_293681 - BLOCK
      ?auto_293682 - BLOCK
      ?auto_293683 - BLOCK
      ?auto_293684 - BLOCK
      ?auto_293685 - BLOCK
      ?auto_293686 - BLOCK
      ?auto_293687 - BLOCK
    )
    :vars
    (
      ?auto_293688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293687 ?auto_293688 ) ( not ( = ?auto_293678 ?auto_293679 ) ) ( not ( = ?auto_293678 ?auto_293680 ) ) ( not ( = ?auto_293678 ?auto_293681 ) ) ( not ( = ?auto_293678 ?auto_293682 ) ) ( not ( = ?auto_293678 ?auto_293683 ) ) ( not ( = ?auto_293678 ?auto_293684 ) ) ( not ( = ?auto_293678 ?auto_293685 ) ) ( not ( = ?auto_293678 ?auto_293686 ) ) ( not ( = ?auto_293678 ?auto_293687 ) ) ( not ( = ?auto_293678 ?auto_293688 ) ) ( not ( = ?auto_293679 ?auto_293680 ) ) ( not ( = ?auto_293679 ?auto_293681 ) ) ( not ( = ?auto_293679 ?auto_293682 ) ) ( not ( = ?auto_293679 ?auto_293683 ) ) ( not ( = ?auto_293679 ?auto_293684 ) ) ( not ( = ?auto_293679 ?auto_293685 ) ) ( not ( = ?auto_293679 ?auto_293686 ) ) ( not ( = ?auto_293679 ?auto_293687 ) ) ( not ( = ?auto_293679 ?auto_293688 ) ) ( not ( = ?auto_293680 ?auto_293681 ) ) ( not ( = ?auto_293680 ?auto_293682 ) ) ( not ( = ?auto_293680 ?auto_293683 ) ) ( not ( = ?auto_293680 ?auto_293684 ) ) ( not ( = ?auto_293680 ?auto_293685 ) ) ( not ( = ?auto_293680 ?auto_293686 ) ) ( not ( = ?auto_293680 ?auto_293687 ) ) ( not ( = ?auto_293680 ?auto_293688 ) ) ( not ( = ?auto_293681 ?auto_293682 ) ) ( not ( = ?auto_293681 ?auto_293683 ) ) ( not ( = ?auto_293681 ?auto_293684 ) ) ( not ( = ?auto_293681 ?auto_293685 ) ) ( not ( = ?auto_293681 ?auto_293686 ) ) ( not ( = ?auto_293681 ?auto_293687 ) ) ( not ( = ?auto_293681 ?auto_293688 ) ) ( not ( = ?auto_293682 ?auto_293683 ) ) ( not ( = ?auto_293682 ?auto_293684 ) ) ( not ( = ?auto_293682 ?auto_293685 ) ) ( not ( = ?auto_293682 ?auto_293686 ) ) ( not ( = ?auto_293682 ?auto_293687 ) ) ( not ( = ?auto_293682 ?auto_293688 ) ) ( not ( = ?auto_293683 ?auto_293684 ) ) ( not ( = ?auto_293683 ?auto_293685 ) ) ( not ( = ?auto_293683 ?auto_293686 ) ) ( not ( = ?auto_293683 ?auto_293687 ) ) ( not ( = ?auto_293683 ?auto_293688 ) ) ( not ( = ?auto_293684 ?auto_293685 ) ) ( not ( = ?auto_293684 ?auto_293686 ) ) ( not ( = ?auto_293684 ?auto_293687 ) ) ( not ( = ?auto_293684 ?auto_293688 ) ) ( not ( = ?auto_293685 ?auto_293686 ) ) ( not ( = ?auto_293685 ?auto_293687 ) ) ( not ( = ?auto_293685 ?auto_293688 ) ) ( not ( = ?auto_293686 ?auto_293687 ) ) ( not ( = ?auto_293686 ?auto_293688 ) ) ( not ( = ?auto_293687 ?auto_293688 ) ) ( ON ?auto_293686 ?auto_293687 ) ( ON ?auto_293685 ?auto_293686 ) ( ON ?auto_293684 ?auto_293685 ) ( ON ?auto_293683 ?auto_293684 ) ( ON ?auto_293682 ?auto_293683 ) ( ON ?auto_293681 ?auto_293682 ) ( ON ?auto_293680 ?auto_293681 ) ( ON ?auto_293679 ?auto_293680 ) ( ON ?auto_293678 ?auto_293679 ) ( CLEAR ?auto_293678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_293678 )
      ( MAKE-10PILE ?auto_293678 ?auto_293679 ?auto_293680 ?auto_293681 ?auto_293682 ?auto_293683 ?auto_293684 ?auto_293685 ?auto_293686 ?auto_293687 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293721 - BLOCK
      ?auto_293722 - BLOCK
      ?auto_293723 - BLOCK
      ?auto_293724 - BLOCK
      ?auto_293725 - BLOCK
      ?auto_293726 - BLOCK
      ?auto_293727 - BLOCK
      ?auto_293728 - BLOCK
      ?auto_293729 - BLOCK
      ?auto_293730 - BLOCK
      ?auto_293731 - BLOCK
    )
    :vars
    (
      ?auto_293732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_293730 ) ( ON ?auto_293731 ?auto_293732 ) ( CLEAR ?auto_293731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_293721 ) ( ON ?auto_293722 ?auto_293721 ) ( ON ?auto_293723 ?auto_293722 ) ( ON ?auto_293724 ?auto_293723 ) ( ON ?auto_293725 ?auto_293724 ) ( ON ?auto_293726 ?auto_293725 ) ( ON ?auto_293727 ?auto_293726 ) ( ON ?auto_293728 ?auto_293727 ) ( ON ?auto_293729 ?auto_293728 ) ( ON ?auto_293730 ?auto_293729 ) ( not ( = ?auto_293721 ?auto_293722 ) ) ( not ( = ?auto_293721 ?auto_293723 ) ) ( not ( = ?auto_293721 ?auto_293724 ) ) ( not ( = ?auto_293721 ?auto_293725 ) ) ( not ( = ?auto_293721 ?auto_293726 ) ) ( not ( = ?auto_293721 ?auto_293727 ) ) ( not ( = ?auto_293721 ?auto_293728 ) ) ( not ( = ?auto_293721 ?auto_293729 ) ) ( not ( = ?auto_293721 ?auto_293730 ) ) ( not ( = ?auto_293721 ?auto_293731 ) ) ( not ( = ?auto_293721 ?auto_293732 ) ) ( not ( = ?auto_293722 ?auto_293723 ) ) ( not ( = ?auto_293722 ?auto_293724 ) ) ( not ( = ?auto_293722 ?auto_293725 ) ) ( not ( = ?auto_293722 ?auto_293726 ) ) ( not ( = ?auto_293722 ?auto_293727 ) ) ( not ( = ?auto_293722 ?auto_293728 ) ) ( not ( = ?auto_293722 ?auto_293729 ) ) ( not ( = ?auto_293722 ?auto_293730 ) ) ( not ( = ?auto_293722 ?auto_293731 ) ) ( not ( = ?auto_293722 ?auto_293732 ) ) ( not ( = ?auto_293723 ?auto_293724 ) ) ( not ( = ?auto_293723 ?auto_293725 ) ) ( not ( = ?auto_293723 ?auto_293726 ) ) ( not ( = ?auto_293723 ?auto_293727 ) ) ( not ( = ?auto_293723 ?auto_293728 ) ) ( not ( = ?auto_293723 ?auto_293729 ) ) ( not ( = ?auto_293723 ?auto_293730 ) ) ( not ( = ?auto_293723 ?auto_293731 ) ) ( not ( = ?auto_293723 ?auto_293732 ) ) ( not ( = ?auto_293724 ?auto_293725 ) ) ( not ( = ?auto_293724 ?auto_293726 ) ) ( not ( = ?auto_293724 ?auto_293727 ) ) ( not ( = ?auto_293724 ?auto_293728 ) ) ( not ( = ?auto_293724 ?auto_293729 ) ) ( not ( = ?auto_293724 ?auto_293730 ) ) ( not ( = ?auto_293724 ?auto_293731 ) ) ( not ( = ?auto_293724 ?auto_293732 ) ) ( not ( = ?auto_293725 ?auto_293726 ) ) ( not ( = ?auto_293725 ?auto_293727 ) ) ( not ( = ?auto_293725 ?auto_293728 ) ) ( not ( = ?auto_293725 ?auto_293729 ) ) ( not ( = ?auto_293725 ?auto_293730 ) ) ( not ( = ?auto_293725 ?auto_293731 ) ) ( not ( = ?auto_293725 ?auto_293732 ) ) ( not ( = ?auto_293726 ?auto_293727 ) ) ( not ( = ?auto_293726 ?auto_293728 ) ) ( not ( = ?auto_293726 ?auto_293729 ) ) ( not ( = ?auto_293726 ?auto_293730 ) ) ( not ( = ?auto_293726 ?auto_293731 ) ) ( not ( = ?auto_293726 ?auto_293732 ) ) ( not ( = ?auto_293727 ?auto_293728 ) ) ( not ( = ?auto_293727 ?auto_293729 ) ) ( not ( = ?auto_293727 ?auto_293730 ) ) ( not ( = ?auto_293727 ?auto_293731 ) ) ( not ( = ?auto_293727 ?auto_293732 ) ) ( not ( = ?auto_293728 ?auto_293729 ) ) ( not ( = ?auto_293728 ?auto_293730 ) ) ( not ( = ?auto_293728 ?auto_293731 ) ) ( not ( = ?auto_293728 ?auto_293732 ) ) ( not ( = ?auto_293729 ?auto_293730 ) ) ( not ( = ?auto_293729 ?auto_293731 ) ) ( not ( = ?auto_293729 ?auto_293732 ) ) ( not ( = ?auto_293730 ?auto_293731 ) ) ( not ( = ?auto_293730 ?auto_293732 ) ) ( not ( = ?auto_293731 ?auto_293732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_293731 ?auto_293732 )
      ( !STACK ?auto_293731 ?auto_293730 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293767 - BLOCK
      ?auto_293768 - BLOCK
      ?auto_293769 - BLOCK
      ?auto_293770 - BLOCK
      ?auto_293771 - BLOCK
      ?auto_293772 - BLOCK
      ?auto_293773 - BLOCK
      ?auto_293774 - BLOCK
      ?auto_293775 - BLOCK
      ?auto_293776 - BLOCK
      ?auto_293777 - BLOCK
    )
    :vars
    (
      ?auto_293778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293777 ?auto_293778 ) ( ON-TABLE ?auto_293767 ) ( ON ?auto_293768 ?auto_293767 ) ( ON ?auto_293769 ?auto_293768 ) ( ON ?auto_293770 ?auto_293769 ) ( ON ?auto_293771 ?auto_293770 ) ( ON ?auto_293772 ?auto_293771 ) ( ON ?auto_293773 ?auto_293772 ) ( ON ?auto_293774 ?auto_293773 ) ( ON ?auto_293775 ?auto_293774 ) ( not ( = ?auto_293767 ?auto_293768 ) ) ( not ( = ?auto_293767 ?auto_293769 ) ) ( not ( = ?auto_293767 ?auto_293770 ) ) ( not ( = ?auto_293767 ?auto_293771 ) ) ( not ( = ?auto_293767 ?auto_293772 ) ) ( not ( = ?auto_293767 ?auto_293773 ) ) ( not ( = ?auto_293767 ?auto_293774 ) ) ( not ( = ?auto_293767 ?auto_293775 ) ) ( not ( = ?auto_293767 ?auto_293776 ) ) ( not ( = ?auto_293767 ?auto_293777 ) ) ( not ( = ?auto_293767 ?auto_293778 ) ) ( not ( = ?auto_293768 ?auto_293769 ) ) ( not ( = ?auto_293768 ?auto_293770 ) ) ( not ( = ?auto_293768 ?auto_293771 ) ) ( not ( = ?auto_293768 ?auto_293772 ) ) ( not ( = ?auto_293768 ?auto_293773 ) ) ( not ( = ?auto_293768 ?auto_293774 ) ) ( not ( = ?auto_293768 ?auto_293775 ) ) ( not ( = ?auto_293768 ?auto_293776 ) ) ( not ( = ?auto_293768 ?auto_293777 ) ) ( not ( = ?auto_293768 ?auto_293778 ) ) ( not ( = ?auto_293769 ?auto_293770 ) ) ( not ( = ?auto_293769 ?auto_293771 ) ) ( not ( = ?auto_293769 ?auto_293772 ) ) ( not ( = ?auto_293769 ?auto_293773 ) ) ( not ( = ?auto_293769 ?auto_293774 ) ) ( not ( = ?auto_293769 ?auto_293775 ) ) ( not ( = ?auto_293769 ?auto_293776 ) ) ( not ( = ?auto_293769 ?auto_293777 ) ) ( not ( = ?auto_293769 ?auto_293778 ) ) ( not ( = ?auto_293770 ?auto_293771 ) ) ( not ( = ?auto_293770 ?auto_293772 ) ) ( not ( = ?auto_293770 ?auto_293773 ) ) ( not ( = ?auto_293770 ?auto_293774 ) ) ( not ( = ?auto_293770 ?auto_293775 ) ) ( not ( = ?auto_293770 ?auto_293776 ) ) ( not ( = ?auto_293770 ?auto_293777 ) ) ( not ( = ?auto_293770 ?auto_293778 ) ) ( not ( = ?auto_293771 ?auto_293772 ) ) ( not ( = ?auto_293771 ?auto_293773 ) ) ( not ( = ?auto_293771 ?auto_293774 ) ) ( not ( = ?auto_293771 ?auto_293775 ) ) ( not ( = ?auto_293771 ?auto_293776 ) ) ( not ( = ?auto_293771 ?auto_293777 ) ) ( not ( = ?auto_293771 ?auto_293778 ) ) ( not ( = ?auto_293772 ?auto_293773 ) ) ( not ( = ?auto_293772 ?auto_293774 ) ) ( not ( = ?auto_293772 ?auto_293775 ) ) ( not ( = ?auto_293772 ?auto_293776 ) ) ( not ( = ?auto_293772 ?auto_293777 ) ) ( not ( = ?auto_293772 ?auto_293778 ) ) ( not ( = ?auto_293773 ?auto_293774 ) ) ( not ( = ?auto_293773 ?auto_293775 ) ) ( not ( = ?auto_293773 ?auto_293776 ) ) ( not ( = ?auto_293773 ?auto_293777 ) ) ( not ( = ?auto_293773 ?auto_293778 ) ) ( not ( = ?auto_293774 ?auto_293775 ) ) ( not ( = ?auto_293774 ?auto_293776 ) ) ( not ( = ?auto_293774 ?auto_293777 ) ) ( not ( = ?auto_293774 ?auto_293778 ) ) ( not ( = ?auto_293775 ?auto_293776 ) ) ( not ( = ?auto_293775 ?auto_293777 ) ) ( not ( = ?auto_293775 ?auto_293778 ) ) ( not ( = ?auto_293776 ?auto_293777 ) ) ( not ( = ?auto_293776 ?auto_293778 ) ) ( not ( = ?auto_293777 ?auto_293778 ) ) ( CLEAR ?auto_293775 ) ( ON ?auto_293776 ?auto_293777 ) ( CLEAR ?auto_293776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_293767 ?auto_293768 ?auto_293769 ?auto_293770 ?auto_293771 ?auto_293772 ?auto_293773 ?auto_293774 ?auto_293775 ?auto_293776 )
      ( MAKE-11PILE ?auto_293767 ?auto_293768 ?auto_293769 ?auto_293770 ?auto_293771 ?auto_293772 ?auto_293773 ?auto_293774 ?auto_293775 ?auto_293776 ?auto_293777 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293813 - BLOCK
      ?auto_293814 - BLOCK
      ?auto_293815 - BLOCK
      ?auto_293816 - BLOCK
      ?auto_293817 - BLOCK
      ?auto_293818 - BLOCK
      ?auto_293819 - BLOCK
      ?auto_293820 - BLOCK
      ?auto_293821 - BLOCK
      ?auto_293822 - BLOCK
      ?auto_293823 - BLOCK
    )
    :vars
    (
      ?auto_293824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293823 ?auto_293824 ) ( ON-TABLE ?auto_293813 ) ( ON ?auto_293814 ?auto_293813 ) ( ON ?auto_293815 ?auto_293814 ) ( ON ?auto_293816 ?auto_293815 ) ( ON ?auto_293817 ?auto_293816 ) ( ON ?auto_293818 ?auto_293817 ) ( ON ?auto_293819 ?auto_293818 ) ( ON ?auto_293820 ?auto_293819 ) ( not ( = ?auto_293813 ?auto_293814 ) ) ( not ( = ?auto_293813 ?auto_293815 ) ) ( not ( = ?auto_293813 ?auto_293816 ) ) ( not ( = ?auto_293813 ?auto_293817 ) ) ( not ( = ?auto_293813 ?auto_293818 ) ) ( not ( = ?auto_293813 ?auto_293819 ) ) ( not ( = ?auto_293813 ?auto_293820 ) ) ( not ( = ?auto_293813 ?auto_293821 ) ) ( not ( = ?auto_293813 ?auto_293822 ) ) ( not ( = ?auto_293813 ?auto_293823 ) ) ( not ( = ?auto_293813 ?auto_293824 ) ) ( not ( = ?auto_293814 ?auto_293815 ) ) ( not ( = ?auto_293814 ?auto_293816 ) ) ( not ( = ?auto_293814 ?auto_293817 ) ) ( not ( = ?auto_293814 ?auto_293818 ) ) ( not ( = ?auto_293814 ?auto_293819 ) ) ( not ( = ?auto_293814 ?auto_293820 ) ) ( not ( = ?auto_293814 ?auto_293821 ) ) ( not ( = ?auto_293814 ?auto_293822 ) ) ( not ( = ?auto_293814 ?auto_293823 ) ) ( not ( = ?auto_293814 ?auto_293824 ) ) ( not ( = ?auto_293815 ?auto_293816 ) ) ( not ( = ?auto_293815 ?auto_293817 ) ) ( not ( = ?auto_293815 ?auto_293818 ) ) ( not ( = ?auto_293815 ?auto_293819 ) ) ( not ( = ?auto_293815 ?auto_293820 ) ) ( not ( = ?auto_293815 ?auto_293821 ) ) ( not ( = ?auto_293815 ?auto_293822 ) ) ( not ( = ?auto_293815 ?auto_293823 ) ) ( not ( = ?auto_293815 ?auto_293824 ) ) ( not ( = ?auto_293816 ?auto_293817 ) ) ( not ( = ?auto_293816 ?auto_293818 ) ) ( not ( = ?auto_293816 ?auto_293819 ) ) ( not ( = ?auto_293816 ?auto_293820 ) ) ( not ( = ?auto_293816 ?auto_293821 ) ) ( not ( = ?auto_293816 ?auto_293822 ) ) ( not ( = ?auto_293816 ?auto_293823 ) ) ( not ( = ?auto_293816 ?auto_293824 ) ) ( not ( = ?auto_293817 ?auto_293818 ) ) ( not ( = ?auto_293817 ?auto_293819 ) ) ( not ( = ?auto_293817 ?auto_293820 ) ) ( not ( = ?auto_293817 ?auto_293821 ) ) ( not ( = ?auto_293817 ?auto_293822 ) ) ( not ( = ?auto_293817 ?auto_293823 ) ) ( not ( = ?auto_293817 ?auto_293824 ) ) ( not ( = ?auto_293818 ?auto_293819 ) ) ( not ( = ?auto_293818 ?auto_293820 ) ) ( not ( = ?auto_293818 ?auto_293821 ) ) ( not ( = ?auto_293818 ?auto_293822 ) ) ( not ( = ?auto_293818 ?auto_293823 ) ) ( not ( = ?auto_293818 ?auto_293824 ) ) ( not ( = ?auto_293819 ?auto_293820 ) ) ( not ( = ?auto_293819 ?auto_293821 ) ) ( not ( = ?auto_293819 ?auto_293822 ) ) ( not ( = ?auto_293819 ?auto_293823 ) ) ( not ( = ?auto_293819 ?auto_293824 ) ) ( not ( = ?auto_293820 ?auto_293821 ) ) ( not ( = ?auto_293820 ?auto_293822 ) ) ( not ( = ?auto_293820 ?auto_293823 ) ) ( not ( = ?auto_293820 ?auto_293824 ) ) ( not ( = ?auto_293821 ?auto_293822 ) ) ( not ( = ?auto_293821 ?auto_293823 ) ) ( not ( = ?auto_293821 ?auto_293824 ) ) ( not ( = ?auto_293822 ?auto_293823 ) ) ( not ( = ?auto_293822 ?auto_293824 ) ) ( not ( = ?auto_293823 ?auto_293824 ) ) ( ON ?auto_293822 ?auto_293823 ) ( CLEAR ?auto_293820 ) ( ON ?auto_293821 ?auto_293822 ) ( CLEAR ?auto_293821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_293813 ?auto_293814 ?auto_293815 ?auto_293816 ?auto_293817 ?auto_293818 ?auto_293819 ?auto_293820 ?auto_293821 )
      ( MAKE-11PILE ?auto_293813 ?auto_293814 ?auto_293815 ?auto_293816 ?auto_293817 ?auto_293818 ?auto_293819 ?auto_293820 ?auto_293821 ?auto_293822 ?auto_293823 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293859 - BLOCK
      ?auto_293860 - BLOCK
      ?auto_293861 - BLOCK
      ?auto_293862 - BLOCK
      ?auto_293863 - BLOCK
      ?auto_293864 - BLOCK
      ?auto_293865 - BLOCK
      ?auto_293866 - BLOCK
      ?auto_293867 - BLOCK
      ?auto_293868 - BLOCK
      ?auto_293869 - BLOCK
    )
    :vars
    (
      ?auto_293870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293869 ?auto_293870 ) ( ON-TABLE ?auto_293859 ) ( ON ?auto_293860 ?auto_293859 ) ( ON ?auto_293861 ?auto_293860 ) ( ON ?auto_293862 ?auto_293861 ) ( ON ?auto_293863 ?auto_293862 ) ( ON ?auto_293864 ?auto_293863 ) ( ON ?auto_293865 ?auto_293864 ) ( not ( = ?auto_293859 ?auto_293860 ) ) ( not ( = ?auto_293859 ?auto_293861 ) ) ( not ( = ?auto_293859 ?auto_293862 ) ) ( not ( = ?auto_293859 ?auto_293863 ) ) ( not ( = ?auto_293859 ?auto_293864 ) ) ( not ( = ?auto_293859 ?auto_293865 ) ) ( not ( = ?auto_293859 ?auto_293866 ) ) ( not ( = ?auto_293859 ?auto_293867 ) ) ( not ( = ?auto_293859 ?auto_293868 ) ) ( not ( = ?auto_293859 ?auto_293869 ) ) ( not ( = ?auto_293859 ?auto_293870 ) ) ( not ( = ?auto_293860 ?auto_293861 ) ) ( not ( = ?auto_293860 ?auto_293862 ) ) ( not ( = ?auto_293860 ?auto_293863 ) ) ( not ( = ?auto_293860 ?auto_293864 ) ) ( not ( = ?auto_293860 ?auto_293865 ) ) ( not ( = ?auto_293860 ?auto_293866 ) ) ( not ( = ?auto_293860 ?auto_293867 ) ) ( not ( = ?auto_293860 ?auto_293868 ) ) ( not ( = ?auto_293860 ?auto_293869 ) ) ( not ( = ?auto_293860 ?auto_293870 ) ) ( not ( = ?auto_293861 ?auto_293862 ) ) ( not ( = ?auto_293861 ?auto_293863 ) ) ( not ( = ?auto_293861 ?auto_293864 ) ) ( not ( = ?auto_293861 ?auto_293865 ) ) ( not ( = ?auto_293861 ?auto_293866 ) ) ( not ( = ?auto_293861 ?auto_293867 ) ) ( not ( = ?auto_293861 ?auto_293868 ) ) ( not ( = ?auto_293861 ?auto_293869 ) ) ( not ( = ?auto_293861 ?auto_293870 ) ) ( not ( = ?auto_293862 ?auto_293863 ) ) ( not ( = ?auto_293862 ?auto_293864 ) ) ( not ( = ?auto_293862 ?auto_293865 ) ) ( not ( = ?auto_293862 ?auto_293866 ) ) ( not ( = ?auto_293862 ?auto_293867 ) ) ( not ( = ?auto_293862 ?auto_293868 ) ) ( not ( = ?auto_293862 ?auto_293869 ) ) ( not ( = ?auto_293862 ?auto_293870 ) ) ( not ( = ?auto_293863 ?auto_293864 ) ) ( not ( = ?auto_293863 ?auto_293865 ) ) ( not ( = ?auto_293863 ?auto_293866 ) ) ( not ( = ?auto_293863 ?auto_293867 ) ) ( not ( = ?auto_293863 ?auto_293868 ) ) ( not ( = ?auto_293863 ?auto_293869 ) ) ( not ( = ?auto_293863 ?auto_293870 ) ) ( not ( = ?auto_293864 ?auto_293865 ) ) ( not ( = ?auto_293864 ?auto_293866 ) ) ( not ( = ?auto_293864 ?auto_293867 ) ) ( not ( = ?auto_293864 ?auto_293868 ) ) ( not ( = ?auto_293864 ?auto_293869 ) ) ( not ( = ?auto_293864 ?auto_293870 ) ) ( not ( = ?auto_293865 ?auto_293866 ) ) ( not ( = ?auto_293865 ?auto_293867 ) ) ( not ( = ?auto_293865 ?auto_293868 ) ) ( not ( = ?auto_293865 ?auto_293869 ) ) ( not ( = ?auto_293865 ?auto_293870 ) ) ( not ( = ?auto_293866 ?auto_293867 ) ) ( not ( = ?auto_293866 ?auto_293868 ) ) ( not ( = ?auto_293866 ?auto_293869 ) ) ( not ( = ?auto_293866 ?auto_293870 ) ) ( not ( = ?auto_293867 ?auto_293868 ) ) ( not ( = ?auto_293867 ?auto_293869 ) ) ( not ( = ?auto_293867 ?auto_293870 ) ) ( not ( = ?auto_293868 ?auto_293869 ) ) ( not ( = ?auto_293868 ?auto_293870 ) ) ( not ( = ?auto_293869 ?auto_293870 ) ) ( ON ?auto_293868 ?auto_293869 ) ( ON ?auto_293867 ?auto_293868 ) ( CLEAR ?auto_293865 ) ( ON ?auto_293866 ?auto_293867 ) ( CLEAR ?auto_293866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_293859 ?auto_293860 ?auto_293861 ?auto_293862 ?auto_293863 ?auto_293864 ?auto_293865 ?auto_293866 )
      ( MAKE-11PILE ?auto_293859 ?auto_293860 ?auto_293861 ?auto_293862 ?auto_293863 ?auto_293864 ?auto_293865 ?auto_293866 ?auto_293867 ?auto_293868 ?auto_293869 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293905 - BLOCK
      ?auto_293906 - BLOCK
      ?auto_293907 - BLOCK
      ?auto_293908 - BLOCK
      ?auto_293909 - BLOCK
      ?auto_293910 - BLOCK
      ?auto_293911 - BLOCK
      ?auto_293912 - BLOCK
      ?auto_293913 - BLOCK
      ?auto_293914 - BLOCK
      ?auto_293915 - BLOCK
    )
    :vars
    (
      ?auto_293916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293915 ?auto_293916 ) ( ON-TABLE ?auto_293905 ) ( ON ?auto_293906 ?auto_293905 ) ( ON ?auto_293907 ?auto_293906 ) ( ON ?auto_293908 ?auto_293907 ) ( ON ?auto_293909 ?auto_293908 ) ( ON ?auto_293910 ?auto_293909 ) ( not ( = ?auto_293905 ?auto_293906 ) ) ( not ( = ?auto_293905 ?auto_293907 ) ) ( not ( = ?auto_293905 ?auto_293908 ) ) ( not ( = ?auto_293905 ?auto_293909 ) ) ( not ( = ?auto_293905 ?auto_293910 ) ) ( not ( = ?auto_293905 ?auto_293911 ) ) ( not ( = ?auto_293905 ?auto_293912 ) ) ( not ( = ?auto_293905 ?auto_293913 ) ) ( not ( = ?auto_293905 ?auto_293914 ) ) ( not ( = ?auto_293905 ?auto_293915 ) ) ( not ( = ?auto_293905 ?auto_293916 ) ) ( not ( = ?auto_293906 ?auto_293907 ) ) ( not ( = ?auto_293906 ?auto_293908 ) ) ( not ( = ?auto_293906 ?auto_293909 ) ) ( not ( = ?auto_293906 ?auto_293910 ) ) ( not ( = ?auto_293906 ?auto_293911 ) ) ( not ( = ?auto_293906 ?auto_293912 ) ) ( not ( = ?auto_293906 ?auto_293913 ) ) ( not ( = ?auto_293906 ?auto_293914 ) ) ( not ( = ?auto_293906 ?auto_293915 ) ) ( not ( = ?auto_293906 ?auto_293916 ) ) ( not ( = ?auto_293907 ?auto_293908 ) ) ( not ( = ?auto_293907 ?auto_293909 ) ) ( not ( = ?auto_293907 ?auto_293910 ) ) ( not ( = ?auto_293907 ?auto_293911 ) ) ( not ( = ?auto_293907 ?auto_293912 ) ) ( not ( = ?auto_293907 ?auto_293913 ) ) ( not ( = ?auto_293907 ?auto_293914 ) ) ( not ( = ?auto_293907 ?auto_293915 ) ) ( not ( = ?auto_293907 ?auto_293916 ) ) ( not ( = ?auto_293908 ?auto_293909 ) ) ( not ( = ?auto_293908 ?auto_293910 ) ) ( not ( = ?auto_293908 ?auto_293911 ) ) ( not ( = ?auto_293908 ?auto_293912 ) ) ( not ( = ?auto_293908 ?auto_293913 ) ) ( not ( = ?auto_293908 ?auto_293914 ) ) ( not ( = ?auto_293908 ?auto_293915 ) ) ( not ( = ?auto_293908 ?auto_293916 ) ) ( not ( = ?auto_293909 ?auto_293910 ) ) ( not ( = ?auto_293909 ?auto_293911 ) ) ( not ( = ?auto_293909 ?auto_293912 ) ) ( not ( = ?auto_293909 ?auto_293913 ) ) ( not ( = ?auto_293909 ?auto_293914 ) ) ( not ( = ?auto_293909 ?auto_293915 ) ) ( not ( = ?auto_293909 ?auto_293916 ) ) ( not ( = ?auto_293910 ?auto_293911 ) ) ( not ( = ?auto_293910 ?auto_293912 ) ) ( not ( = ?auto_293910 ?auto_293913 ) ) ( not ( = ?auto_293910 ?auto_293914 ) ) ( not ( = ?auto_293910 ?auto_293915 ) ) ( not ( = ?auto_293910 ?auto_293916 ) ) ( not ( = ?auto_293911 ?auto_293912 ) ) ( not ( = ?auto_293911 ?auto_293913 ) ) ( not ( = ?auto_293911 ?auto_293914 ) ) ( not ( = ?auto_293911 ?auto_293915 ) ) ( not ( = ?auto_293911 ?auto_293916 ) ) ( not ( = ?auto_293912 ?auto_293913 ) ) ( not ( = ?auto_293912 ?auto_293914 ) ) ( not ( = ?auto_293912 ?auto_293915 ) ) ( not ( = ?auto_293912 ?auto_293916 ) ) ( not ( = ?auto_293913 ?auto_293914 ) ) ( not ( = ?auto_293913 ?auto_293915 ) ) ( not ( = ?auto_293913 ?auto_293916 ) ) ( not ( = ?auto_293914 ?auto_293915 ) ) ( not ( = ?auto_293914 ?auto_293916 ) ) ( not ( = ?auto_293915 ?auto_293916 ) ) ( ON ?auto_293914 ?auto_293915 ) ( ON ?auto_293913 ?auto_293914 ) ( ON ?auto_293912 ?auto_293913 ) ( CLEAR ?auto_293910 ) ( ON ?auto_293911 ?auto_293912 ) ( CLEAR ?auto_293911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_293905 ?auto_293906 ?auto_293907 ?auto_293908 ?auto_293909 ?auto_293910 ?auto_293911 )
      ( MAKE-11PILE ?auto_293905 ?auto_293906 ?auto_293907 ?auto_293908 ?auto_293909 ?auto_293910 ?auto_293911 ?auto_293912 ?auto_293913 ?auto_293914 ?auto_293915 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293951 - BLOCK
      ?auto_293952 - BLOCK
      ?auto_293953 - BLOCK
      ?auto_293954 - BLOCK
      ?auto_293955 - BLOCK
      ?auto_293956 - BLOCK
      ?auto_293957 - BLOCK
      ?auto_293958 - BLOCK
      ?auto_293959 - BLOCK
      ?auto_293960 - BLOCK
      ?auto_293961 - BLOCK
    )
    :vars
    (
      ?auto_293962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_293961 ?auto_293962 ) ( ON-TABLE ?auto_293951 ) ( ON ?auto_293952 ?auto_293951 ) ( ON ?auto_293953 ?auto_293952 ) ( ON ?auto_293954 ?auto_293953 ) ( ON ?auto_293955 ?auto_293954 ) ( not ( = ?auto_293951 ?auto_293952 ) ) ( not ( = ?auto_293951 ?auto_293953 ) ) ( not ( = ?auto_293951 ?auto_293954 ) ) ( not ( = ?auto_293951 ?auto_293955 ) ) ( not ( = ?auto_293951 ?auto_293956 ) ) ( not ( = ?auto_293951 ?auto_293957 ) ) ( not ( = ?auto_293951 ?auto_293958 ) ) ( not ( = ?auto_293951 ?auto_293959 ) ) ( not ( = ?auto_293951 ?auto_293960 ) ) ( not ( = ?auto_293951 ?auto_293961 ) ) ( not ( = ?auto_293951 ?auto_293962 ) ) ( not ( = ?auto_293952 ?auto_293953 ) ) ( not ( = ?auto_293952 ?auto_293954 ) ) ( not ( = ?auto_293952 ?auto_293955 ) ) ( not ( = ?auto_293952 ?auto_293956 ) ) ( not ( = ?auto_293952 ?auto_293957 ) ) ( not ( = ?auto_293952 ?auto_293958 ) ) ( not ( = ?auto_293952 ?auto_293959 ) ) ( not ( = ?auto_293952 ?auto_293960 ) ) ( not ( = ?auto_293952 ?auto_293961 ) ) ( not ( = ?auto_293952 ?auto_293962 ) ) ( not ( = ?auto_293953 ?auto_293954 ) ) ( not ( = ?auto_293953 ?auto_293955 ) ) ( not ( = ?auto_293953 ?auto_293956 ) ) ( not ( = ?auto_293953 ?auto_293957 ) ) ( not ( = ?auto_293953 ?auto_293958 ) ) ( not ( = ?auto_293953 ?auto_293959 ) ) ( not ( = ?auto_293953 ?auto_293960 ) ) ( not ( = ?auto_293953 ?auto_293961 ) ) ( not ( = ?auto_293953 ?auto_293962 ) ) ( not ( = ?auto_293954 ?auto_293955 ) ) ( not ( = ?auto_293954 ?auto_293956 ) ) ( not ( = ?auto_293954 ?auto_293957 ) ) ( not ( = ?auto_293954 ?auto_293958 ) ) ( not ( = ?auto_293954 ?auto_293959 ) ) ( not ( = ?auto_293954 ?auto_293960 ) ) ( not ( = ?auto_293954 ?auto_293961 ) ) ( not ( = ?auto_293954 ?auto_293962 ) ) ( not ( = ?auto_293955 ?auto_293956 ) ) ( not ( = ?auto_293955 ?auto_293957 ) ) ( not ( = ?auto_293955 ?auto_293958 ) ) ( not ( = ?auto_293955 ?auto_293959 ) ) ( not ( = ?auto_293955 ?auto_293960 ) ) ( not ( = ?auto_293955 ?auto_293961 ) ) ( not ( = ?auto_293955 ?auto_293962 ) ) ( not ( = ?auto_293956 ?auto_293957 ) ) ( not ( = ?auto_293956 ?auto_293958 ) ) ( not ( = ?auto_293956 ?auto_293959 ) ) ( not ( = ?auto_293956 ?auto_293960 ) ) ( not ( = ?auto_293956 ?auto_293961 ) ) ( not ( = ?auto_293956 ?auto_293962 ) ) ( not ( = ?auto_293957 ?auto_293958 ) ) ( not ( = ?auto_293957 ?auto_293959 ) ) ( not ( = ?auto_293957 ?auto_293960 ) ) ( not ( = ?auto_293957 ?auto_293961 ) ) ( not ( = ?auto_293957 ?auto_293962 ) ) ( not ( = ?auto_293958 ?auto_293959 ) ) ( not ( = ?auto_293958 ?auto_293960 ) ) ( not ( = ?auto_293958 ?auto_293961 ) ) ( not ( = ?auto_293958 ?auto_293962 ) ) ( not ( = ?auto_293959 ?auto_293960 ) ) ( not ( = ?auto_293959 ?auto_293961 ) ) ( not ( = ?auto_293959 ?auto_293962 ) ) ( not ( = ?auto_293960 ?auto_293961 ) ) ( not ( = ?auto_293960 ?auto_293962 ) ) ( not ( = ?auto_293961 ?auto_293962 ) ) ( ON ?auto_293960 ?auto_293961 ) ( ON ?auto_293959 ?auto_293960 ) ( ON ?auto_293958 ?auto_293959 ) ( ON ?auto_293957 ?auto_293958 ) ( CLEAR ?auto_293955 ) ( ON ?auto_293956 ?auto_293957 ) ( CLEAR ?auto_293956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_293951 ?auto_293952 ?auto_293953 ?auto_293954 ?auto_293955 ?auto_293956 )
      ( MAKE-11PILE ?auto_293951 ?auto_293952 ?auto_293953 ?auto_293954 ?auto_293955 ?auto_293956 ?auto_293957 ?auto_293958 ?auto_293959 ?auto_293960 ?auto_293961 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_293997 - BLOCK
      ?auto_293998 - BLOCK
      ?auto_293999 - BLOCK
      ?auto_294000 - BLOCK
      ?auto_294001 - BLOCK
      ?auto_294002 - BLOCK
      ?auto_294003 - BLOCK
      ?auto_294004 - BLOCK
      ?auto_294005 - BLOCK
      ?auto_294006 - BLOCK
      ?auto_294007 - BLOCK
    )
    :vars
    (
      ?auto_294008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294007 ?auto_294008 ) ( ON-TABLE ?auto_293997 ) ( ON ?auto_293998 ?auto_293997 ) ( ON ?auto_293999 ?auto_293998 ) ( ON ?auto_294000 ?auto_293999 ) ( not ( = ?auto_293997 ?auto_293998 ) ) ( not ( = ?auto_293997 ?auto_293999 ) ) ( not ( = ?auto_293997 ?auto_294000 ) ) ( not ( = ?auto_293997 ?auto_294001 ) ) ( not ( = ?auto_293997 ?auto_294002 ) ) ( not ( = ?auto_293997 ?auto_294003 ) ) ( not ( = ?auto_293997 ?auto_294004 ) ) ( not ( = ?auto_293997 ?auto_294005 ) ) ( not ( = ?auto_293997 ?auto_294006 ) ) ( not ( = ?auto_293997 ?auto_294007 ) ) ( not ( = ?auto_293997 ?auto_294008 ) ) ( not ( = ?auto_293998 ?auto_293999 ) ) ( not ( = ?auto_293998 ?auto_294000 ) ) ( not ( = ?auto_293998 ?auto_294001 ) ) ( not ( = ?auto_293998 ?auto_294002 ) ) ( not ( = ?auto_293998 ?auto_294003 ) ) ( not ( = ?auto_293998 ?auto_294004 ) ) ( not ( = ?auto_293998 ?auto_294005 ) ) ( not ( = ?auto_293998 ?auto_294006 ) ) ( not ( = ?auto_293998 ?auto_294007 ) ) ( not ( = ?auto_293998 ?auto_294008 ) ) ( not ( = ?auto_293999 ?auto_294000 ) ) ( not ( = ?auto_293999 ?auto_294001 ) ) ( not ( = ?auto_293999 ?auto_294002 ) ) ( not ( = ?auto_293999 ?auto_294003 ) ) ( not ( = ?auto_293999 ?auto_294004 ) ) ( not ( = ?auto_293999 ?auto_294005 ) ) ( not ( = ?auto_293999 ?auto_294006 ) ) ( not ( = ?auto_293999 ?auto_294007 ) ) ( not ( = ?auto_293999 ?auto_294008 ) ) ( not ( = ?auto_294000 ?auto_294001 ) ) ( not ( = ?auto_294000 ?auto_294002 ) ) ( not ( = ?auto_294000 ?auto_294003 ) ) ( not ( = ?auto_294000 ?auto_294004 ) ) ( not ( = ?auto_294000 ?auto_294005 ) ) ( not ( = ?auto_294000 ?auto_294006 ) ) ( not ( = ?auto_294000 ?auto_294007 ) ) ( not ( = ?auto_294000 ?auto_294008 ) ) ( not ( = ?auto_294001 ?auto_294002 ) ) ( not ( = ?auto_294001 ?auto_294003 ) ) ( not ( = ?auto_294001 ?auto_294004 ) ) ( not ( = ?auto_294001 ?auto_294005 ) ) ( not ( = ?auto_294001 ?auto_294006 ) ) ( not ( = ?auto_294001 ?auto_294007 ) ) ( not ( = ?auto_294001 ?auto_294008 ) ) ( not ( = ?auto_294002 ?auto_294003 ) ) ( not ( = ?auto_294002 ?auto_294004 ) ) ( not ( = ?auto_294002 ?auto_294005 ) ) ( not ( = ?auto_294002 ?auto_294006 ) ) ( not ( = ?auto_294002 ?auto_294007 ) ) ( not ( = ?auto_294002 ?auto_294008 ) ) ( not ( = ?auto_294003 ?auto_294004 ) ) ( not ( = ?auto_294003 ?auto_294005 ) ) ( not ( = ?auto_294003 ?auto_294006 ) ) ( not ( = ?auto_294003 ?auto_294007 ) ) ( not ( = ?auto_294003 ?auto_294008 ) ) ( not ( = ?auto_294004 ?auto_294005 ) ) ( not ( = ?auto_294004 ?auto_294006 ) ) ( not ( = ?auto_294004 ?auto_294007 ) ) ( not ( = ?auto_294004 ?auto_294008 ) ) ( not ( = ?auto_294005 ?auto_294006 ) ) ( not ( = ?auto_294005 ?auto_294007 ) ) ( not ( = ?auto_294005 ?auto_294008 ) ) ( not ( = ?auto_294006 ?auto_294007 ) ) ( not ( = ?auto_294006 ?auto_294008 ) ) ( not ( = ?auto_294007 ?auto_294008 ) ) ( ON ?auto_294006 ?auto_294007 ) ( ON ?auto_294005 ?auto_294006 ) ( ON ?auto_294004 ?auto_294005 ) ( ON ?auto_294003 ?auto_294004 ) ( ON ?auto_294002 ?auto_294003 ) ( CLEAR ?auto_294000 ) ( ON ?auto_294001 ?auto_294002 ) ( CLEAR ?auto_294001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_293997 ?auto_293998 ?auto_293999 ?auto_294000 ?auto_294001 )
      ( MAKE-11PILE ?auto_293997 ?auto_293998 ?auto_293999 ?auto_294000 ?auto_294001 ?auto_294002 ?auto_294003 ?auto_294004 ?auto_294005 ?auto_294006 ?auto_294007 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_294043 - BLOCK
      ?auto_294044 - BLOCK
      ?auto_294045 - BLOCK
      ?auto_294046 - BLOCK
      ?auto_294047 - BLOCK
      ?auto_294048 - BLOCK
      ?auto_294049 - BLOCK
      ?auto_294050 - BLOCK
      ?auto_294051 - BLOCK
      ?auto_294052 - BLOCK
      ?auto_294053 - BLOCK
    )
    :vars
    (
      ?auto_294054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294053 ?auto_294054 ) ( ON-TABLE ?auto_294043 ) ( ON ?auto_294044 ?auto_294043 ) ( ON ?auto_294045 ?auto_294044 ) ( not ( = ?auto_294043 ?auto_294044 ) ) ( not ( = ?auto_294043 ?auto_294045 ) ) ( not ( = ?auto_294043 ?auto_294046 ) ) ( not ( = ?auto_294043 ?auto_294047 ) ) ( not ( = ?auto_294043 ?auto_294048 ) ) ( not ( = ?auto_294043 ?auto_294049 ) ) ( not ( = ?auto_294043 ?auto_294050 ) ) ( not ( = ?auto_294043 ?auto_294051 ) ) ( not ( = ?auto_294043 ?auto_294052 ) ) ( not ( = ?auto_294043 ?auto_294053 ) ) ( not ( = ?auto_294043 ?auto_294054 ) ) ( not ( = ?auto_294044 ?auto_294045 ) ) ( not ( = ?auto_294044 ?auto_294046 ) ) ( not ( = ?auto_294044 ?auto_294047 ) ) ( not ( = ?auto_294044 ?auto_294048 ) ) ( not ( = ?auto_294044 ?auto_294049 ) ) ( not ( = ?auto_294044 ?auto_294050 ) ) ( not ( = ?auto_294044 ?auto_294051 ) ) ( not ( = ?auto_294044 ?auto_294052 ) ) ( not ( = ?auto_294044 ?auto_294053 ) ) ( not ( = ?auto_294044 ?auto_294054 ) ) ( not ( = ?auto_294045 ?auto_294046 ) ) ( not ( = ?auto_294045 ?auto_294047 ) ) ( not ( = ?auto_294045 ?auto_294048 ) ) ( not ( = ?auto_294045 ?auto_294049 ) ) ( not ( = ?auto_294045 ?auto_294050 ) ) ( not ( = ?auto_294045 ?auto_294051 ) ) ( not ( = ?auto_294045 ?auto_294052 ) ) ( not ( = ?auto_294045 ?auto_294053 ) ) ( not ( = ?auto_294045 ?auto_294054 ) ) ( not ( = ?auto_294046 ?auto_294047 ) ) ( not ( = ?auto_294046 ?auto_294048 ) ) ( not ( = ?auto_294046 ?auto_294049 ) ) ( not ( = ?auto_294046 ?auto_294050 ) ) ( not ( = ?auto_294046 ?auto_294051 ) ) ( not ( = ?auto_294046 ?auto_294052 ) ) ( not ( = ?auto_294046 ?auto_294053 ) ) ( not ( = ?auto_294046 ?auto_294054 ) ) ( not ( = ?auto_294047 ?auto_294048 ) ) ( not ( = ?auto_294047 ?auto_294049 ) ) ( not ( = ?auto_294047 ?auto_294050 ) ) ( not ( = ?auto_294047 ?auto_294051 ) ) ( not ( = ?auto_294047 ?auto_294052 ) ) ( not ( = ?auto_294047 ?auto_294053 ) ) ( not ( = ?auto_294047 ?auto_294054 ) ) ( not ( = ?auto_294048 ?auto_294049 ) ) ( not ( = ?auto_294048 ?auto_294050 ) ) ( not ( = ?auto_294048 ?auto_294051 ) ) ( not ( = ?auto_294048 ?auto_294052 ) ) ( not ( = ?auto_294048 ?auto_294053 ) ) ( not ( = ?auto_294048 ?auto_294054 ) ) ( not ( = ?auto_294049 ?auto_294050 ) ) ( not ( = ?auto_294049 ?auto_294051 ) ) ( not ( = ?auto_294049 ?auto_294052 ) ) ( not ( = ?auto_294049 ?auto_294053 ) ) ( not ( = ?auto_294049 ?auto_294054 ) ) ( not ( = ?auto_294050 ?auto_294051 ) ) ( not ( = ?auto_294050 ?auto_294052 ) ) ( not ( = ?auto_294050 ?auto_294053 ) ) ( not ( = ?auto_294050 ?auto_294054 ) ) ( not ( = ?auto_294051 ?auto_294052 ) ) ( not ( = ?auto_294051 ?auto_294053 ) ) ( not ( = ?auto_294051 ?auto_294054 ) ) ( not ( = ?auto_294052 ?auto_294053 ) ) ( not ( = ?auto_294052 ?auto_294054 ) ) ( not ( = ?auto_294053 ?auto_294054 ) ) ( ON ?auto_294052 ?auto_294053 ) ( ON ?auto_294051 ?auto_294052 ) ( ON ?auto_294050 ?auto_294051 ) ( ON ?auto_294049 ?auto_294050 ) ( ON ?auto_294048 ?auto_294049 ) ( ON ?auto_294047 ?auto_294048 ) ( CLEAR ?auto_294045 ) ( ON ?auto_294046 ?auto_294047 ) ( CLEAR ?auto_294046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_294043 ?auto_294044 ?auto_294045 ?auto_294046 )
      ( MAKE-11PILE ?auto_294043 ?auto_294044 ?auto_294045 ?auto_294046 ?auto_294047 ?auto_294048 ?auto_294049 ?auto_294050 ?auto_294051 ?auto_294052 ?auto_294053 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_294089 - BLOCK
      ?auto_294090 - BLOCK
      ?auto_294091 - BLOCK
      ?auto_294092 - BLOCK
      ?auto_294093 - BLOCK
      ?auto_294094 - BLOCK
      ?auto_294095 - BLOCK
      ?auto_294096 - BLOCK
      ?auto_294097 - BLOCK
      ?auto_294098 - BLOCK
      ?auto_294099 - BLOCK
    )
    :vars
    (
      ?auto_294100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294099 ?auto_294100 ) ( ON-TABLE ?auto_294089 ) ( ON ?auto_294090 ?auto_294089 ) ( not ( = ?auto_294089 ?auto_294090 ) ) ( not ( = ?auto_294089 ?auto_294091 ) ) ( not ( = ?auto_294089 ?auto_294092 ) ) ( not ( = ?auto_294089 ?auto_294093 ) ) ( not ( = ?auto_294089 ?auto_294094 ) ) ( not ( = ?auto_294089 ?auto_294095 ) ) ( not ( = ?auto_294089 ?auto_294096 ) ) ( not ( = ?auto_294089 ?auto_294097 ) ) ( not ( = ?auto_294089 ?auto_294098 ) ) ( not ( = ?auto_294089 ?auto_294099 ) ) ( not ( = ?auto_294089 ?auto_294100 ) ) ( not ( = ?auto_294090 ?auto_294091 ) ) ( not ( = ?auto_294090 ?auto_294092 ) ) ( not ( = ?auto_294090 ?auto_294093 ) ) ( not ( = ?auto_294090 ?auto_294094 ) ) ( not ( = ?auto_294090 ?auto_294095 ) ) ( not ( = ?auto_294090 ?auto_294096 ) ) ( not ( = ?auto_294090 ?auto_294097 ) ) ( not ( = ?auto_294090 ?auto_294098 ) ) ( not ( = ?auto_294090 ?auto_294099 ) ) ( not ( = ?auto_294090 ?auto_294100 ) ) ( not ( = ?auto_294091 ?auto_294092 ) ) ( not ( = ?auto_294091 ?auto_294093 ) ) ( not ( = ?auto_294091 ?auto_294094 ) ) ( not ( = ?auto_294091 ?auto_294095 ) ) ( not ( = ?auto_294091 ?auto_294096 ) ) ( not ( = ?auto_294091 ?auto_294097 ) ) ( not ( = ?auto_294091 ?auto_294098 ) ) ( not ( = ?auto_294091 ?auto_294099 ) ) ( not ( = ?auto_294091 ?auto_294100 ) ) ( not ( = ?auto_294092 ?auto_294093 ) ) ( not ( = ?auto_294092 ?auto_294094 ) ) ( not ( = ?auto_294092 ?auto_294095 ) ) ( not ( = ?auto_294092 ?auto_294096 ) ) ( not ( = ?auto_294092 ?auto_294097 ) ) ( not ( = ?auto_294092 ?auto_294098 ) ) ( not ( = ?auto_294092 ?auto_294099 ) ) ( not ( = ?auto_294092 ?auto_294100 ) ) ( not ( = ?auto_294093 ?auto_294094 ) ) ( not ( = ?auto_294093 ?auto_294095 ) ) ( not ( = ?auto_294093 ?auto_294096 ) ) ( not ( = ?auto_294093 ?auto_294097 ) ) ( not ( = ?auto_294093 ?auto_294098 ) ) ( not ( = ?auto_294093 ?auto_294099 ) ) ( not ( = ?auto_294093 ?auto_294100 ) ) ( not ( = ?auto_294094 ?auto_294095 ) ) ( not ( = ?auto_294094 ?auto_294096 ) ) ( not ( = ?auto_294094 ?auto_294097 ) ) ( not ( = ?auto_294094 ?auto_294098 ) ) ( not ( = ?auto_294094 ?auto_294099 ) ) ( not ( = ?auto_294094 ?auto_294100 ) ) ( not ( = ?auto_294095 ?auto_294096 ) ) ( not ( = ?auto_294095 ?auto_294097 ) ) ( not ( = ?auto_294095 ?auto_294098 ) ) ( not ( = ?auto_294095 ?auto_294099 ) ) ( not ( = ?auto_294095 ?auto_294100 ) ) ( not ( = ?auto_294096 ?auto_294097 ) ) ( not ( = ?auto_294096 ?auto_294098 ) ) ( not ( = ?auto_294096 ?auto_294099 ) ) ( not ( = ?auto_294096 ?auto_294100 ) ) ( not ( = ?auto_294097 ?auto_294098 ) ) ( not ( = ?auto_294097 ?auto_294099 ) ) ( not ( = ?auto_294097 ?auto_294100 ) ) ( not ( = ?auto_294098 ?auto_294099 ) ) ( not ( = ?auto_294098 ?auto_294100 ) ) ( not ( = ?auto_294099 ?auto_294100 ) ) ( ON ?auto_294098 ?auto_294099 ) ( ON ?auto_294097 ?auto_294098 ) ( ON ?auto_294096 ?auto_294097 ) ( ON ?auto_294095 ?auto_294096 ) ( ON ?auto_294094 ?auto_294095 ) ( ON ?auto_294093 ?auto_294094 ) ( ON ?auto_294092 ?auto_294093 ) ( CLEAR ?auto_294090 ) ( ON ?auto_294091 ?auto_294092 ) ( CLEAR ?auto_294091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_294089 ?auto_294090 ?auto_294091 )
      ( MAKE-11PILE ?auto_294089 ?auto_294090 ?auto_294091 ?auto_294092 ?auto_294093 ?auto_294094 ?auto_294095 ?auto_294096 ?auto_294097 ?auto_294098 ?auto_294099 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_294135 - BLOCK
      ?auto_294136 - BLOCK
      ?auto_294137 - BLOCK
      ?auto_294138 - BLOCK
      ?auto_294139 - BLOCK
      ?auto_294140 - BLOCK
      ?auto_294141 - BLOCK
      ?auto_294142 - BLOCK
      ?auto_294143 - BLOCK
      ?auto_294144 - BLOCK
      ?auto_294145 - BLOCK
    )
    :vars
    (
      ?auto_294146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294145 ?auto_294146 ) ( ON-TABLE ?auto_294135 ) ( not ( = ?auto_294135 ?auto_294136 ) ) ( not ( = ?auto_294135 ?auto_294137 ) ) ( not ( = ?auto_294135 ?auto_294138 ) ) ( not ( = ?auto_294135 ?auto_294139 ) ) ( not ( = ?auto_294135 ?auto_294140 ) ) ( not ( = ?auto_294135 ?auto_294141 ) ) ( not ( = ?auto_294135 ?auto_294142 ) ) ( not ( = ?auto_294135 ?auto_294143 ) ) ( not ( = ?auto_294135 ?auto_294144 ) ) ( not ( = ?auto_294135 ?auto_294145 ) ) ( not ( = ?auto_294135 ?auto_294146 ) ) ( not ( = ?auto_294136 ?auto_294137 ) ) ( not ( = ?auto_294136 ?auto_294138 ) ) ( not ( = ?auto_294136 ?auto_294139 ) ) ( not ( = ?auto_294136 ?auto_294140 ) ) ( not ( = ?auto_294136 ?auto_294141 ) ) ( not ( = ?auto_294136 ?auto_294142 ) ) ( not ( = ?auto_294136 ?auto_294143 ) ) ( not ( = ?auto_294136 ?auto_294144 ) ) ( not ( = ?auto_294136 ?auto_294145 ) ) ( not ( = ?auto_294136 ?auto_294146 ) ) ( not ( = ?auto_294137 ?auto_294138 ) ) ( not ( = ?auto_294137 ?auto_294139 ) ) ( not ( = ?auto_294137 ?auto_294140 ) ) ( not ( = ?auto_294137 ?auto_294141 ) ) ( not ( = ?auto_294137 ?auto_294142 ) ) ( not ( = ?auto_294137 ?auto_294143 ) ) ( not ( = ?auto_294137 ?auto_294144 ) ) ( not ( = ?auto_294137 ?auto_294145 ) ) ( not ( = ?auto_294137 ?auto_294146 ) ) ( not ( = ?auto_294138 ?auto_294139 ) ) ( not ( = ?auto_294138 ?auto_294140 ) ) ( not ( = ?auto_294138 ?auto_294141 ) ) ( not ( = ?auto_294138 ?auto_294142 ) ) ( not ( = ?auto_294138 ?auto_294143 ) ) ( not ( = ?auto_294138 ?auto_294144 ) ) ( not ( = ?auto_294138 ?auto_294145 ) ) ( not ( = ?auto_294138 ?auto_294146 ) ) ( not ( = ?auto_294139 ?auto_294140 ) ) ( not ( = ?auto_294139 ?auto_294141 ) ) ( not ( = ?auto_294139 ?auto_294142 ) ) ( not ( = ?auto_294139 ?auto_294143 ) ) ( not ( = ?auto_294139 ?auto_294144 ) ) ( not ( = ?auto_294139 ?auto_294145 ) ) ( not ( = ?auto_294139 ?auto_294146 ) ) ( not ( = ?auto_294140 ?auto_294141 ) ) ( not ( = ?auto_294140 ?auto_294142 ) ) ( not ( = ?auto_294140 ?auto_294143 ) ) ( not ( = ?auto_294140 ?auto_294144 ) ) ( not ( = ?auto_294140 ?auto_294145 ) ) ( not ( = ?auto_294140 ?auto_294146 ) ) ( not ( = ?auto_294141 ?auto_294142 ) ) ( not ( = ?auto_294141 ?auto_294143 ) ) ( not ( = ?auto_294141 ?auto_294144 ) ) ( not ( = ?auto_294141 ?auto_294145 ) ) ( not ( = ?auto_294141 ?auto_294146 ) ) ( not ( = ?auto_294142 ?auto_294143 ) ) ( not ( = ?auto_294142 ?auto_294144 ) ) ( not ( = ?auto_294142 ?auto_294145 ) ) ( not ( = ?auto_294142 ?auto_294146 ) ) ( not ( = ?auto_294143 ?auto_294144 ) ) ( not ( = ?auto_294143 ?auto_294145 ) ) ( not ( = ?auto_294143 ?auto_294146 ) ) ( not ( = ?auto_294144 ?auto_294145 ) ) ( not ( = ?auto_294144 ?auto_294146 ) ) ( not ( = ?auto_294145 ?auto_294146 ) ) ( ON ?auto_294144 ?auto_294145 ) ( ON ?auto_294143 ?auto_294144 ) ( ON ?auto_294142 ?auto_294143 ) ( ON ?auto_294141 ?auto_294142 ) ( ON ?auto_294140 ?auto_294141 ) ( ON ?auto_294139 ?auto_294140 ) ( ON ?auto_294138 ?auto_294139 ) ( ON ?auto_294137 ?auto_294138 ) ( CLEAR ?auto_294135 ) ( ON ?auto_294136 ?auto_294137 ) ( CLEAR ?auto_294136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_294135 ?auto_294136 )
      ( MAKE-11PILE ?auto_294135 ?auto_294136 ?auto_294137 ?auto_294138 ?auto_294139 ?auto_294140 ?auto_294141 ?auto_294142 ?auto_294143 ?auto_294144 ?auto_294145 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_294181 - BLOCK
      ?auto_294182 - BLOCK
      ?auto_294183 - BLOCK
      ?auto_294184 - BLOCK
      ?auto_294185 - BLOCK
      ?auto_294186 - BLOCK
      ?auto_294187 - BLOCK
      ?auto_294188 - BLOCK
      ?auto_294189 - BLOCK
      ?auto_294190 - BLOCK
      ?auto_294191 - BLOCK
    )
    :vars
    (
      ?auto_294192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294191 ?auto_294192 ) ( not ( = ?auto_294181 ?auto_294182 ) ) ( not ( = ?auto_294181 ?auto_294183 ) ) ( not ( = ?auto_294181 ?auto_294184 ) ) ( not ( = ?auto_294181 ?auto_294185 ) ) ( not ( = ?auto_294181 ?auto_294186 ) ) ( not ( = ?auto_294181 ?auto_294187 ) ) ( not ( = ?auto_294181 ?auto_294188 ) ) ( not ( = ?auto_294181 ?auto_294189 ) ) ( not ( = ?auto_294181 ?auto_294190 ) ) ( not ( = ?auto_294181 ?auto_294191 ) ) ( not ( = ?auto_294181 ?auto_294192 ) ) ( not ( = ?auto_294182 ?auto_294183 ) ) ( not ( = ?auto_294182 ?auto_294184 ) ) ( not ( = ?auto_294182 ?auto_294185 ) ) ( not ( = ?auto_294182 ?auto_294186 ) ) ( not ( = ?auto_294182 ?auto_294187 ) ) ( not ( = ?auto_294182 ?auto_294188 ) ) ( not ( = ?auto_294182 ?auto_294189 ) ) ( not ( = ?auto_294182 ?auto_294190 ) ) ( not ( = ?auto_294182 ?auto_294191 ) ) ( not ( = ?auto_294182 ?auto_294192 ) ) ( not ( = ?auto_294183 ?auto_294184 ) ) ( not ( = ?auto_294183 ?auto_294185 ) ) ( not ( = ?auto_294183 ?auto_294186 ) ) ( not ( = ?auto_294183 ?auto_294187 ) ) ( not ( = ?auto_294183 ?auto_294188 ) ) ( not ( = ?auto_294183 ?auto_294189 ) ) ( not ( = ?auto_294183 ?auto_294190 ) ) ( not ( = ?auto_294183 ?auto_294191 ) ) ( not ( = ?auto_294183 ?auto_294192 ) ) ( not ( = ?auto_294184 ?auto_294185 ) ) ( not ( = ?auto_294184 ?auto_294186 ) ) ( not ( = ?auto_294184 ?auto_294187 ) ) ( not ( = ?auto_294184 ?auto_294188 ) ) ( not ( = ?auto_294184 ?auto_294189 ) ) ( not ( = ?auto_294184 ?auto_294190 ) ) ( not ( = ?auto_294184 ?auto_294191 ) ) ( not ( = ?auto_294184 ?auto_294192 ) ) ( not ( = ?auto_294185 ?auto_294186 ) ) ( not ( = ?auto_294185 ?auto_294187 ) ) ( not ( = ?auto_294185 ?auto_294188 ) ) ( not ( = ?auto_294185 ?auto_294189 ) ) ( not ( = ?auto_294185 ?auto_294190 ) ) ( not ( = ?auto_294185 ?auto_294191 ) ) ( not ( = ?auto_294185 ?auto_294192 ) ) ( not ( = ?auto_294186 ?auto_294187 ) ) ( not ( = ?auto_294186 ?auto_294188 ) ) ( not ( = ?auto_294186 ?auto_294189 ) ) ( not ( = ?auto_294186 ?auto_294190 ) ) ( not ( = ?auto_294186 ?auto_294191 ) ) ( not ( = ?auto_294186 ?auto_294192 ) ) ( not ( = ?auto_294187 ?auto_294188 ) ) ( not ( = ?auto_294187 ?auto_294189 ) ) ( not ( = ?auto_294187 ?auto_294190 ) ) ( not ( = ?auto_294187 ?auto_294191 ) ) ( not ( = ?auto_294187 ?auto_294192 ) ) ( not ( = ?auto_294188 ?auto_294189 ) ) ( not ( = ?auto_294188 ?auto_294190 ) ) ( not ( = ?auto_294188 ?auto_294191 ) ) ( not ( = ?auto_294188 ?auto_294192 ) ) ( not ( = ?auto_294189 ?auto_294190 ) ) ( not ( = ?auto_294189 ?auto_294191 ) ) ( not ( = ?auto_294189 ?auto_294192 ) ) ( not ( = ?auto_294190 ?auto_294191 ) ) ( not ( = ?auto_294190 ?auto_294192 ) ) ( not ( = ?auto_294191 ?auto_294192 ) ) ( ON ?auto_294190 ?auto_294191 ) ( ON ?auto_294189 ?auto_294190 ) ( ON ?auto_294188 ?auto_294189 ) ( ON ?auto_294187 ?auto_294188 ) ( ON ?auto_294186 ?auto_294187 ) ( ON ?auto_294185 ?auto_294186 ) ( ON ?auto_294184 ?auto_294185 ) ( ON ?auto_294183 ?auto_294184 ) ( ON ?auto_294182 ?auto_294183 ) ( ON ?auto_294181 ?auto_294182 ) ( CLEAR ?auto_294181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_294181 )
      ( MAKE-11PILE ?auto_294181 ?auto_294182 ?auto_294183 ?auto_294184 ?auto_294185 ?auto_294186 ?auto_294187 ?auto_294188 ?auto_294189 ?auto_294190 ?auto_294191 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294228 - BLOCK
      ?auto_294229 - BLOCK
      ?auto_294230 - BLOCK
      ?auto_294231 - BLOCK
      ?auto_294232 - BLOCK
      ?auto_294233 - BLOCK
      ?auto_294234 - BLOCK
      ?auto_294235 - BLOCK
      ?auto_294236 - BLOCK
      ?auto_294237 - BLOCK
      ?auto_294238 - BLOCK
      ?auto_294239 - BLOCK
    )
    :vars
    (
      ?auto_294240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_294238 ) ( ON ?auto_294239 ?auto_294240 ) ( CLEAR ?auto_294239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_294228 ) ( ON ?auto_294229 ?auto_294228 ) ( ON ?auto_294230 ?auto_294229 ) ( ON ?auto_294231 ?auto_294230 ) ( ON ?auto_294232 ?auto_294231 ) ( ON ?auto_294233 ?auto_294232 ) ( ON ?auto_294234 ?auto_294233 ) ( ON ?auto_294235 ?auto_294234 ) ( ON ?auto_294236 ?auto_294235 ) ( ON ?auto_294237 ?auto_294236 ) ( ON ?auto_294238 ?auto_294237 ) ( not ( = ?auto_294228 ?auto_294229 ) ) ( not ( = ?auto_294228 ?auto_294230 ) ) ( not ( = ?auto_294228 ?auto_294231 ) ) ( not ( = ?auto_294228 ?auto_294232 ) ) ( not ( = ?auto_294228 ?auto_294233 ) ) ( not ( = ?auto_294228 ?auto_294234 ) ) ( not ( = ?auto_294228 ?auto_294235 ) ) ( not ( = ?auto_294228 ?auto_294236 ) ) ( not ( = ?auto_294228 ?auto_294237 ) ) ( not ( = ?auto_294228 ?auto_294238 ) ) ( not ( = ?auto_294228 ?auto_294239 ) ) ( not ( = ?auto_294228 ?auto_294240 ) ) ( not ( = ?auto_294229 ?auto_294230 ) ) ( not ( = ?auto_294229 ?auto_294231 ) ) ( not ( = ?auto_294229 ?auto_294232 ) ) ( not ( = ?auto_294229 ?auto_294233 ) ) ( not ( = ?auto_294229 ?auto_294234 ) ) ( not ( = ?auto_294229 ?auto_294235 ) ) ( not ( = ?auto_294229 ?auto_294236 ) ) ( not ( = ?auto_294229 ?auto_294237 ) ) ( not ( = ?auto_294229 ?auto_294238 ) ) ( not ( = ?auto_294229 ?auto_294239 ) ) ( not ( = ?auto_294229 ?auto_294240 ) ) ( not ( = ?auto_294230 ?auto_294231 ) ) ( not ( = ?auto_294230 ?auto_294232 ) ) ( not ( = ?auto_294230 ?auto_294233 ) ) ( not ( = ?auto_294230 ?auto_294234 ) ) ( not ( = ?auto_294230 ?auto_294235 ) ) ( not ( = ?auto_294230 ?auto_294236 ) ) ( not ( = ?auto_294230 ?auto_294237 ) ) ( not ( = ?auto_294230 ?auto_294238 ) ) ( not ( = ?auto_294230 ?auto_294239 ) ) ( not ( = ?auto_294230 ?auto_294240 ) ) ( not ( = ?auto_294231 ?auto_294232 ) ) ( not ( = ?auto_294231 ?auto_294233 ) ) ( not ( = ?auto_294231 ?auto_294234 ) ) ( not ( = ?auto_294231 ?auto_294235 ) ) ( not ( = ?auto_294231 ?auto_294236 ) ) ( not ( = ?auto_294231 ?auto_294237 ) ) ( not ( = ?auto_294231 ?auto_294238 ) ) ( not ( = ?auto_294231 ?auto_294239 ) ) ( not ( = ?auto_294231 ?auto_294240 ) ) ( not ( = ?auto_294232 ?auto_294233 ) ) ( not ( = ?auto_294232 ?auto_294234 ) ) ( not ( = ?auto_294232 ?auto_294235 ) ) ( not ( = ?auto_294232 ?auto_294236 ) ) ( not ( = ?auto_294232 ?auto_294237 ) ) ( not ( = ?auto_294232 ?auto_294238 ) ) ( not ( = ?auto_294232 ?auto_294239 ) ) ( not ( = ?auto_294232 ?auto_294240 ) ) ( not ( = ?auto_294233 ?auto_294234 ) ) ( not ( = ?auto_294233 ?auto_294235 ) ) ( not ( = ?auto_294233 ?auto_294236 ) ) ( not ( = ?auto_294233 ?auto_294237 ) ) ( not ( = ?auto_294233 ?auto_294238 ) ) ( not ( = ?auto_294233 ?auto_294239 ) ) ( not ( = ?auto_294233 ?auto_294240 ) ) ( not ( = ?auto_294234 ?auto_294235 ) ) ( not ( = ?auto_294234 ?auto_294236 ) ) ( not ( = ?auto_294234 ?auto_294237 ) ) ( not ( = ?auto_294234 ?auto_294238 ) ) ( not ( = ?auto_294234 ?auto_294239 ) ) ( not ( = ?auto_294234 ?auto_294240 ) ) ( not ( = ?auto_294235 ?auto_294236 ) ) ( not ( = ?auto_294235 ?auto_294237 ) ) ( not ( = ?auto_294235 ?auto_294238 ) ) ( not ( = ?auto_294235 ?auto_294239 ) ) ( not ( = ?auto_294235 ?auto_294240 ) ) ( not ( = ?auto_294236 ?auto_294237 ) ) ( not ( = ?auto_294236 ?auto_294238 ) ) ( not ( = ?auto_294236 ?auto_294239 ) ) ( not ( = ?auto_294236 ?auto_294240 ) ) ( not ( = ?auto_294237 ?auto_294238 ) ) ( not ( = ?auto_294237 ?auto_294239 ) ) ( not ( = ?auto_294237 ?auto_294240 ) ) ( not ( = ?auto_294238 ?auto_294239 ) ) ( not ( = ?auto_294238 ?auto_294240 ) ) ( not ( = ?auto_294239 ?auto_294240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_294239 ?auto_294240 )
      ( !STACK ?auto_294239 ?auto_294238 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294278 - BLOCK
      ?auto_294279 - BLOCK
      ?auto_294280 - BLOCK
      ?auto_294281 - BLOCK
      ?auto_294282 - BLOCK
      ?auto_294283 - BLOCK
      ?auto_294284 - BLOCK
      ?auto_294285 - BLOCK
      ?auto_294286 - BLOCK
      ?auto_294287 - BLOCK
      ?auto_294288 - BLOCK
      ?auto_294289 - BLOCK
    )
    :vars
    (
      ?auto_294290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294289 ?auto_294290 ) ( ON-TABLE ?auto_294278 ) ( ON ?auto_294279 ?auto_294278 ) ( ON ?auto_294280 ?auto_294279 ) ( ON ?auto_294281 ?auto_294280 ) ( ON ?auto_294282 ?auto_294281 ) ( ON ?auto_294283 ?auto_294282 ) ( ON ?auto_294284 ?auto_294283 ) ( ON ?auto_294285 ?auto_294284 ) ( ON ?auto_294286 ?auto_294285 ) ( ON ?auto_294287 ?auto_294286 ) ( not ( = ?auto_294278 ?auto_294279 ) ) ( not ( = ?auto_294278 ?auto_294280 ) ) ( not ( = ?auto_294278 ?auto_294281 ) ) ( not ( = ?auto_294278 ?auto_294282 ) ) ( not ( = ?auto_294278 ?auto_294283 ) ) ( not ( = ?auto_294278 ?auto_294284 ) ) ( not ( = ?auto_294278 ?auto_294285 ) ) ( not ( = ?auto_294278 ?auto_294286 ) ) ( not ( = ?auto_294278 ?auto_294287 ) ) ( not ( = ?auto_294278 ?auto_294288 ) ) ( not ( = ?auto_294278 ?auto_294289 ) ) ( not ( = ?auto_294278 ?auto_294290 ) ) ( not ( = ?auto_294279 ?auto_294280 ) ) ( not ( = ?auto_294279 ?auto_294281 ) ) ( not ( = ?auto_294279 ?auto_294282 ) ) ( not ( = ?auto_294279 ?auto_294283 ) ) ( not ( = ?auto_294279 ?auto_294284 ) ) ( not ( = ?auto_294279 ?auto_294285 ) ) ( not ( = ?auto_294279 ?auto_294286 ) ) ( not ( = ?auto_294279 ?auto_294287 ) ) ( not ( = ?auto_294279 ?auto_294288 ) ) ( not ( = ?auto_294279 ?auto_294289 ) ) ( not ( = ?auto_294279 ?auto_294290 ) ) ( not ( = ?auto_294280 ?auto_294281 ) ) ( not ( = ?auto_294280 ?auto_294282 ) ) ( not ( = ?auto_294280 ?auto_294283 ) ) ( not ( = ?auto_294280 ?auto_294284 ) ) ( not ( = ?auto_294280 ?auto_294285 ) ) ( not ( = ?auto_294280 ?auto_294286 ) ) ( not ( = ?auto_294280 ?auto_294287 ) ) ( not ( = ?auto_294280 ?auto_294288 ) ) ( not ( = ?auto_294280 ?auto_294289 ) ) ( not ( = ?auto_294280 ?auto_294290 ) ) ( not ( = ?auto_294281 ?auto_294282 ) ) ( not ( = ?auto_294281 ?auto_294283 ) ) ( not ( = ?auto_294281 ?auto_294284 ) ) ( not ( = ?auto_294281 ?auto_294285 ) ) ( not ( = ?auto_294281 ?auto_294286 ) ) ( not ( = ?auto_294281 ?auto_294287 ) ) ( not ( = ?auto_294281 ?auto_294288 ) ) ( not ( = ?auto_294281 ?auto_294289 ) ) ( not ( = ?auto_294281 ?auto_294290 ) ) ( not ( = ?auto_294282 ?auto_294283 ) ) ( not ( = ?auto_294282 ?auto_294284 ) ) ( not ( = ?auto_294282 ?auto_294285 ) ) ( not ( = ?auto_294282 ?auto_294286 ) ) ( not ( = ?auto_294282 ?auto_294287 ) ) ( not ( = ?auto_294282 ?auto_294288 ) ) ( not ( = ?auto_294282 ?auto_294289 ) ) ( not ( = ?auto_294282 ?auto_294290 ) ) ( not ( = ?auto_294283 ?auto_294284 ) ) ( not ( = ?auto_294283 ?auto_294285 ) ) ( not ( = ?auto_294283 ?auto_294286 ) ) ( not ( = ?auto_294283 ?auto_294287 ) ) ( not ( = ?auto_294283 ?auto_294288 ) ) ( not ( = ?auto_294283 ?auto_294289 ) ) ( not ( = ?auto_294283 ?auto_294290 ) ) ( not ( = ?auto_294284 ?auto_294285 ) ) ( not ( = ?auto_294284 ?auto_294286 ) ) ( not ( = ?auto_294284 ?auto_294287 ) ) ( not ( = ?auto_294284 ?auto_294288 ) ) ( not ( = ?auto_294284 ?auto_294289 ) ) ( not ( = ?auto_294284 ?auto_294290 ) ) ( not ( = ?auto_294285 ?auto_294286 ) ) ( not ( = ?auto_294285 ?auto_294287 ) ) ( not ( = ?auto_294285 ?auto_294288 ) ) ( not ( = ?auto_294285 ?auto_294289 ) ) ( not ( = ?auto_294285 ?auto_294290 ) ) ( not ( = ?auto_294286 ?auto_294287 ) ) ( not ( = ?auto_294286 ?auto_294288 ) ) ( not ( = ?auto_294286 ?auto_294289 ) ) ( not ( = ?auto_294286 ?auto_294290 ) ) ( not ( = ?auto_294287 ?auto_294288 ) ) ( not ( = ?auto_294287 ?auto_294289 ) ) ( not ( = ?auto_294287 ?auto_294290 ) ) ( not ( = ?auto_294288 ?auto_294289 ) ) ( not ( = ?auto_294288 ?auto_294290 ) ) ( not ( = ?auto_294289 ?auto_294290 ) ) ( CLEAR ?auto_294287 ) ( ON ?auto_294288 ?auto_294289 ) ( CLEAR ?auto_294288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_294278 ?auto_294279 ?auto_294280 ?auto_294281 ?auto_294282 ?auto_294283 ?auto_294284 ?auto_294285 ?auto_294286 ?auto_294287 ?auto_294288 )
      ( MAKE-12PILE ?auto_294278 ?auto_294279 ?auto_294280 ?auto_294281 ?auto_294282 ?auto_294283 ?auto_294284 ?auto_294285 ?auto_294286 ?auto_294287 ?auto_294288 ?auto_294289 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294328 - BLOCK
      ?auto_294329 - BLOCK
      ?auto_294330 - BLOCK
      ?auto_294331 - BLOCK
      ?auto_294332 - BLOCK
      ?auto_294333 - BLOCK
      ?auto_294334 - BLOCK
      ?auto_294335 - BLOCK
      ?auto_294336 - BLOCK
      ?auto_294337 - BLOCK
      ?auto_294338 - BLOCK
      ?auto_294339 - BLOCK
    )
    :vars
    (
      ?auto_294340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294339 ?auto_294340 ) ( ON-TABLE ?auto_294328 ) ( ON ?auto_294329 ?auto_294328 ) ( ON ?auto_294330 ?auto_294329 ) ( ON ?auto_294331 ?auto_294330 ) ( ON ?auto_294332 ?auto_294331 ) ( ON ?auto_294333 ?auto_294332 ) ( ON ?auto_294334 ?auto_294333 ) ( ON ?auto_294335 ?auto_294334 ) ( ON ?auto_294336 ?auto_294335 ) ( not ( = ?auto_294328 ?auto_294329 ) ) ( not ( = ?auto_294328 ?auto_294330 ) ) ( not ( = ?auto_294328 ?auto_294331 ) ) ( not ( = ?auto_294328 ?auto_294332 ) ) ( not ( = ?auto_294328 ?auto_294333 ) ) ( not ( = ?auto_294328 ?auto_294334 ) ) ( not ( = ?auto_294328 ?auto_294335 ) ) ( not ( = ?auto_294328 ?auto_294336 ) ) ( not ( = ?auto_294328 ?auto_294337 ) ) ( not ( = ?auto_294328 ?auto_294338 ) ) ( not ( = ?auto_294328 ?auto_294339 ) ) ( not ( = ?auto_294328 ?auto_294340 ) ) ( not ( = ?auto_294329 ?auto_294330 ) ) ( not ( = ?auto_294329 ?auto_294331 ) ) ( not ( = ?auto_294329 ?auto_294332 ) ) ( not ( = ?auto_294329 ?auto_294333 ) ) ( not ( = ?auto_294329 ?auto_294334 ) ) ( not ( = ?auto_294329 ?auto_294335 ) ) ( not ( = ?auto_294329 ?auto_294336 ) ) ( not ( = ?auto_294329 ?auto_294337 ) ) ( not ( = ?auto_294329 ?auto_294338 ) ) ( not ( = ?auto_294329 ?auto_294339 ) ) ( not ( = ?auto_294329 ?auto_294340 ) ) ( not ( = ?auto_294330 ?auto_294331 ) ) ( not ( = ?auto_294330 ?auto_294332 ) ) ( not ( = ?auto_294330 ?auto_294333 ) ) ( not ( = ?auto_294330 ?auto_294334 ) ) ( not ( = ?auto_294330 ?auto_294335 ) ) ( not ( = ?auto_294330 ?auto_294336 ) ) ( not ( = ?auto_294330 ?auto_294337 ) ) ( not ( = ?auto_294330 ?auto_294338 ) ) ( not ( = ?auto_294330 ?auto_294339 ) ) ( not ( = ?auto_294330 ?auto_294340 ) ) ( not ( = ?auto_294331 ?auto_294332 ) ) ( not ( = ?auto_294331 ?auto_294333 ) ) ( not ( = ?auto_294331 ?auto_294334 ) ) ( not ( = ?auto_294331 ?auto_294335 ) ) ( not ( = ?auto_294331 ?auto_294336 ) ) ( not ( = ?auto_294331 ?auto_294337 ) ) ( not ( = ?auto_294331 ?auto_294338 ) ) ( not ( = ?auto_294331 ?auto_294339 ) ) ( not ( = ?auto_294331 ?auto_294340 ) ) ( not ( = ?auto_294332 ?auto_294333 ) ) ( not ( = ?auto_294332 ?auto_294334 ) ) ( not ( = ?auto_294332 ?auto_294335 ) ) ( not ( = ?auto_294332 ?auto_294336 ) ) ( not ( = ?auto_294332 ?auto_294337 ) ) ( not ( = ?auto_294332 ?auto_294338 ) ) ( not ( = ?auto_294332 ?auto_294339 ) ) ( not ( = ?auto_294332 ?auto_294340 ) ) ( not ( = ?auto_294333 ?auto_294334 ) ) ( not ( = ?auto_294333 ?auto_294335 ) ) ( not ( = ?auto_294333 ?auto_294336 ) ) ( not ( = ?auto_294333 ?auto_294337 ) ) ( not ( = ?auto_294333 ?auto_294338 ) ) ( not ( = ?auto_294333 ?auto_294339 ) ) ( not ( = ?auto_294333 ?auto_294340 ) ) ( not ( = ?auto_294334 ?auto_294335 ) ) ( not ( = ?auto_294334 ?auto_294336 ) ) ( not ( = ?auto_294334 ?auto_294337 ) ) ( not ( = ?auto_294334 ?auto_294338 ) ) ( not ( = ?auto_294334 ?auto_294339 ) ) ( not ( = ?auto_294334 ?auto_294340 ) ) ( not ( = ?auto_294335 ?auto_294336 ) ) ( not ( = ?auto_294335 ?auto_294337 ) ) ( not ( = ?auto_294335 ?auto_294338 ) ) ( not ( = ?auto_294335 ?auto_294339 ) ) ( not ( = ?auto_294335 ?auto_294340 ) ) ( not ( = ?auto_294336 ?auto_294337 ) ) ( not ( = ?auto_294336 ?auto_294338 ) ) ( not ( = ?auto_294336 ?auto_294339 ) ) ( not ( = ?auto_294336 ?auto_294340 ) ) ( not ( = ?auto_294337 ?auto_294338 ) ) ( not ( = ?auto_294337 ?auto_294339 ) ) ( not ( = ?auto_294337 ?auto_294340 ) ) ( not ( = ?auto_294338 ?auto_294339 ) ) ( not ( = ?auto_294338 ?auto_294340 ) ) ( not ( = ?auto_294339 ?auto_294340 ) ) ( ON ?auto_294338 ?auto_294339 ) ( CLEAR ?auto_294336 ) ( ON ?auto_294337 ?auto_294338 ) ( CLEAR ?auto_294337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_294328 ?auto_294329 ?auto_294330 ?auto_294331 ?auto_294332 ?auto_294333 ?auto_294334 ?auto_294335 ?auto_294336 ?auto_294337 )
      ( MAKE-12PILE ?auto_294328 ?auto_294329 ?auto_294330 ?auto_294331 ?auto_294332 ?auto_294333 ?auto_294334 ?auto_294335 ?auto_294336 ?auto_294337 ?auto_294338 ?auto_294339 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294378 - BLOCK
      ?auto_294379 - BLOCK
      ?auto_294380 - BLOCK
      ?auto_294381 - BLOCK
      ?auto_294382 - BLOCK
      ?auto_294383 - BLOCK
      ?auto_294384 - BLOCK
      ?auto_294385 - BLOCK
      ?auto_294386 - BLOCK
      ?auto_294387 - BLOCK
      ?auto_294388 - BLOCK
      ?auto_294389 - BLOCK
    )
    :vars
    (
      ?auto_294390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294389 ?auto_294390 ) ( ON-TABLE ?auto_294378 ) ( ON ?auto_294379 ?auto_294378 ) ( ON ?auto_294380 ?auto_294379 ) ( ON ?auto_294381 ?auto_294380 ) ( ON ?auto_294382 ?auto_294381 ) ( ON ?auto_294383 ?auto_294382 ) ( ON ?auto_294384 ?auto_294383 ) ( ON ?auto_294385 ?auto_294384 ) ( not ( = ?auto_294378 ?auto_294379 ) ) ( not ( = ?auto_294378 ?auto_294380 ) ) ( not ( = ?auto_294378 ?auto_294381 ) ) ( not ( = ?auto_294378 ?auto_294382 ) ) ( not ( = ?auto_294378 ?auto_294383 ) ) ( not ( = ?auto_294378 ?auto_294384 ) ) ( not ( = ?auto_294378 ?auto_294385 ) ) ( not ( = ?auto_294378 ?auto_294386 ) ) ( not ( = ?auto_294378 ?auto_294387 ) ) ( not ( = ?auto_294378 ?auto_294388 ) ) ( not ( = ?auto_294378 ?auto_294389 ) ) ( not ( = ?auto_294378 ?auto_294390 ) ) ( not ( = ?auto_294379 ?auto_294380 ) ) ( not ( = ?auto_294379 ?auto_294381 ) ) ( not ( = ?auto_294379 ?auto_294382 ) ) ( not ( = ?auto_294379 ?auto_294383 ) ) ( not ( = ?auto_294379 ?auto_294384 ) ) ( not ( = ?auto_294379 ?auto_294385 ) ) ( not ( = ?auto_294379 ?auto_294386 ) ) ( not ( = ?auto_294379 ?auto_294387 ) ) ( not ( = ?auto_294379 ?auto_294388 ) ) ( not ( = ?auto_294379 ?auto_294389 ) ) ( not ( = ?auto_294379 ?auto_294390 ) ) ( not ( = ?auto_294380 ?auto_294381 ) ) ( not ( = ?auto_294380 ?auto_294382 ) ) ( not ( = ?auto_294380 ?auto_294383 ) ) ( not ( = ?auto_294380 ?auto_294384 ) ) ( not ( = ?auto_294380 ?auto_294385 ) ) ( not ( = ?auto_294380 ?auto_294386 ) ) ( not ( = ?auto_294380 ?auto_294387 ) ) ( not ( = ?auto_294380 ?auto_294388 ) ) ( not ( = ?auto_294380 ?auto_294389 ) ) ( not ( = ?auto_294380 ?auto_294390 ) ) ( not ( = ?auto_294381 ?auto_294382 ) ) ( not ( = ?auto_294381 ?auto_294383 ) ) ( not ( = ?auto_294381 ?auto_294384 ) ) ( not ( = ?auto_294381 ?auto_294385 ) ) ( not ( = ?auto_294381 ?auto_294386 ) ) ( not ( = ?auto_294381 ?auto_294387 ) ) ( not ( = ?auto_294381 ?auto_294388 ) ) ( not ( = ?auto_294381 ?auto_294389 ) ) ( not ( = ?auto_294381 ?auto_294390 ) ) ( not ( = ?auto_294382 ?auto_294383 ) ) ( not ( = ?auto_294382 ?auto_294384 ) ) ( not ( = ?auto_294382 ?auto_294385 ) ) ( not ( = ?auto_294382 ?auto_294386 ) ) ( not ( = ?auto_294382 ?auto_294387 ) ) ( not ( = ?auto_294382 ?auto_294388 ) ) ( not ( = ?auto_294382 ?auto_294389 ) ) ( not ( = ?auto_294382 ?auto_294390 ) ) ( not ( = ?auto_294383 ?auto_294384 ) ) ( not ( = ?auto_294383 ?auto_294385 ) ) ( not ( = ?auto_294383 ?auto_294386 ) ) ( not ( = ?auto_294383 ?auto_294387 ) ) ( not ( = ?auto_294383 ?auto_294388 ) ) ( not ( = ?auto_294383 ?auto_294389 ) ) ( not ( = ?auto_294383 ?auto_294390 ) ) ( not ( = ?auto_294384 ?auto_294385 ) ) ( not ( = ?auto_294384 ?auto_294386 ) ) ( not ( = ?auto_294384 ?auto_294387 ) ) ( not ( = ?auto_294384 ?auto_294388 ) ) ( not ( = ?auto_294384 ?auto_294389 ) ) ( not ( = ?auto_294384 ?auto_294390 ) ) ( not ( = ?auto_294385 ?auto_294386 ) ) ( not ( = ?auto_294385 ?auto_294387 ) ) ( not ( = ?auto_294385 ?auto_294388 ) ) ( not ( = ?auto_294385 ?auto_294389 ) ) ( not ( = ?auto_294385 ?auto_294390 ) ) ( not ( = ?auto_294386 ?auto_294387 ) ) ( not ( = ?auto_294386 ?auto_294388 ) ) ( not ( = ?auto_294386 ?auto_294389 ) ) ( not ( = ?auto_294386 ?auto_294390 ) ) ( not ( = ?auto_294387 ?auto_294388 ) ) ( not ( = ?auto_294387 ?auto_294389 ) ) ( not ( = ?auto_294387 ?auto_294390 ) ) ( not ( = ?auto_294388 ?auto_294389 ) ) ( not ( = ?auto_294388 ?auto_294390 ) ) ( not ( = ?auto_294389 ?auto_294390 ) ) ( ON ?auto_294388 ?auto_294389 ) ( ON ?auto_294387 ?auto_294388 ) ( CLEAR ?auto_294385 ) ( ON ?auto_294386 ?auto_294387 ) ( CLEAR ?auto_294386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_294378 ?auto_294379 ?auto_294380 ?auto_294381 ?auto_294382 ?auto_294383 ?auto_294384 ?auto_294385 ?auto_294386 )
      ( MAKE-12PILE ?auto_294378 ?auto_294379 ?auto_294380 ?auto_294381 ?auto_294382 ?auto_294383 ?auto_294384 ?auto_294385 ?auto_294386 ?auto_294387 ?auto_294388 ?auto_294389 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294428 - BLOCK
      ?auto_294429 - BLOCK
      ?auto_294430 - BLOCK
      ?auto_294431 - BLOCK
      ?auto_294432 - BLOCK
      ?auto_294433 - BLOCK
      ?auto_294434 - BLOCK
      ?auto_294435 - BLOCK
      ?auto_294436 - BLOCK
      ?auto_294437 - BLOCK
      ?auto_294438 - BLOCK
      ?auto_294439 - BLOCK
    )
    :vars
    (
      ?auto_294440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294439 ?auto_294440 ) ( ON-TABLE ?auto_294428 ) ( ON ?auto_294429 ?auto_294428 ) ( ON ?auto_294430 ?auto_294429 ) ( ON ?auto_294431 ?auto_294430 ) ( ON ?auto_294432 ?auto_294431 ) ( ON ?auto_294433 ?auto_294432 ) ( ON ?auto_294434 ?auto_294433 ) ( not ( = ?auto_294428 ?auto_294429 ) ) ( not ( = ?auto_294428 ?auto_294430 ) ) ( not ( = ?auto_294428 ?auto_294431 ) ) ( not ( = ?auto_294428 ?auto_294432 ) ) ( not ( = ?auto_294428 ?auto_294433 ) ) ( not ( = ?auto_294428 ?auto_294434 ) ) ( not ( = ?auto_294428 ?auto_294435 ) ) ( not ( = ?auto_294428 ?auto_294436 ) ) ( not ( = ?auto_294428 ?auto_294437 ) ) ( not ( = ?auto_294428 ?auto_294438 ) ) ( not ( = ?auto_294428 ?auto_294439 ) ) ( not ( = ?auto_294428 ?auto_294440 ) ) ( not ( = ?auto_294429 ?auto_294430 ) ) ( not ( = ?auto_294429 ?auto_294431 ) ) ( not ( = ?auto_294429 ?auto_294432 ) ) ( not ( = ?auto_294429 ?auto_294433 ) ) ( not ( = ?auto_294429 ?auto_294434 ) ) ( not ( = ?auto_294429 ?auto_294435 ) ) ( not ( = ?auto_294429 ?auto_294436 ) ) ( not ( = ?auto_294429 ?auto_294437 ) ) ( not ( = ?auto_294429 ?auto_294438 ) ) ( not ( = ?auto_294429 ?auto_294439 ) ) ( not ( = ?auto_294429 ?auto_294440 ) ) ( not ( = ?auto_294430 ?auto_294431 ) ) ( not ( = ?auto_294430 ?auto_294432 ) ) ( not ( = ?auto_294430 ?auto_294433 ) ) ( not ( = ?auto_294430 ?auto_294434 ) ) ( not ( = ?auto_294430 ?auto_294435 ) ) ( not ( = ?auto_294430 ?auto_294436 ) ) ( not ( = ?auto_294430 ?auto_294437 ) ) ( not ( = ?auto_294430 ?auto_294438 ) ) ( not ( = ?auto_294430 ?auto_294439 ) ) ( not ( = ?auto_294430 ?auto_294440 ) ) ( not ( = ?auto_294431 ?auto_294432 ) ) ( not ( = ?auto_294431 ?auto_294433 ) ) ( not ( = ?auto_294431 ?auto_294434 ) ) ( not ( = ?auto_294431 ?auto_294435 ) ) ( not ( = ?auto_294431 ?auto_294436 ) ) ( not ( = ?auto_294431 ?auto_294437 ) ) ( not ( = ?auto_294431 ?auto_294438 ) ) ( not ( = ?auto_294431 ?auto_294439 ) ) ( not ( = ?auto_294431 ?auto_294440 ) ) ( not ( = ?auto_294432 ?auto_294433 ) ) ( not ( = ?auto_294432 ?auto_294434 ) ) ( not ( = ?auto_294432 ?auto_294435 ) ) ( not ( = ?auto_294432 ?auto_294436 ) ) ( not ( = ?auto_294432 ?auto_294437 ) ) ( not ( = ?auto_294432 ?auto_294438 ) ) ( not ( = ?auto_294432 ?auto_294439 ) ) ( not ( = ?auto_294432 ?auto_294440 ) ) ( not ( = ?auto_294433 ?auto_294434 ) ) ( not ( = ?auto_294433 ?auto_294435 ) ) ( not ( = ?auto_294433 ?auto_294436 ) ) ( not ( = ?auto_294433 ?auto_294437 ) ) ( not ( = ?auto_294433 ?auto_294438 ) ) ( not ( = ?auto_294433 ?auto_294439 ) ) ( not ( = ?auto_294433 ?auto_294440 ) ) ( not ( = ?auto_294434 ?auto_294435 ) ) ( not ( = ?auto_294434 ?auto_294436 ) ) ( not ( = ?auto_294434 ?auto_294437 ) ) ( not ( = ?auto_294434 ?auto_294438 ) ) ( not ( = ?auto_294434 ?auto_294439 ) ) ( not ( = ?auto_294434 ?auto_294440 ) ) ( not ( = ?auto_294435 ?auto_294436 ) ) ( not ( = ?auto_294435 ?auto_294437 ) ) ( not ( = ?auto_294435 ?auto_294438 ) ) ( not ( = ?auto_294435 ?auto_294439 ) ) ( not ( = ?auto_294435 ?auto_294440 ) ) ( not ( = ?auto_294436 ?auto_294437 ) ) ( not ( = ?auto_294436 ?auto_294438 ) ) ( not ( = ?auto_294436 ?auto_294439 ) ) ( not ( = ?auto_294436 ?auto_294440 ) ) ( not ( = ?auto_294437 ?auto_294438 ) ) ( not ( = ?auto_294437 ?auto_294439 ) ) ( not ( = ?auto_294437 ?auto_294440 ) ) ( not ( = ?auto_294438 ?auto_294439 ) ) ( not ( = ?auto_294438 ?auto_294440 ) ) ( not ( = ?auto_294439 ?auto_294440 ) ) ( ON ?auto_294438 ?auto_294439 ) ( ON ?auto_294437 ?auto_294438 ) ( ON ?auto_294436 ?auto_294437 ) ( CLEAR ?auto_294434 ) ( ON ?auto_294435 ?auto_294436 ) ( CLEAR ?auto_294435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_294428 ?auto_294429 ?auto_294430 ?auto_294431 ?auto_294432 ?auto_294433 ?auto_294434 ?auto_294435 )
      ( MAKE-12PILE ?auto_294428 ?auto_294429 ?auto_294430 ?auto_294431 ?auto_294432 ?auto_294433 ?auto_294434 ?auto_294435 ?auto_294436 ?auto_294437 ?auto_294438 ?auto_294439 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294478 - BLOCK
      ?auto_294479 - BLOCK
      ?auto_294480 - BLOCK
      ?auto_294481 - BLOCK
      ?auto_294482 - BLOCK
      ?auto_294483 - BLOCK
      ?auto_294484 - BLOCK
      ?auto_294485 - BLOCK
      ?auto_294486 - BLOCK
      ?auto_294487 - BLOCK
      ?auto_294488 - BLOCK
      ?auto_294489 - BLOCK
    )
    :vars
    (
      ?auto_294490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294489 ?auto_294490 ) ( ON-TABLE ?auto_294478 ) ( ON ?auto_294479 ?auto_294478 ) ( ON ?auto_294480 ?auto_294479 ) ( ON ?auto_294481 ?auto_294480 ) ( ON ?auto_294482 ?auto_294481 ) ( ON ?auto_294483 ?auto_294482 ) ( not ( = ?auto_294478 ?auto_294479 ) ) ( not ( = ?auto_294478 ?auto_294480 ) ) ( not ( = ?auto_294478 ?auto_294481 ) ) ( not ( = ?auto_294478 ?auto_294482 ) ) ( not ( = ?auto_294478 ?auto_294483 ) ) ( not ( = ?auto_294478 ?auto_294484 ) ) ( not ( = ?auto_294478 ?auto_294485 ) ) ( not ( = ?auto_294478 ?auto_294486 ) ) ( not ( = ?auto_294478 ?auto_294487 ) ) ( not ( = ?auto_294478 ?auto_294488 ) ) ( not ( = ?auto_294478 ?auto_294489 ) ) ( not ( = ?auto_294478 ?auto_294490 ) ) ( not ( = ?auto_294479 ?auto_294480 ) ) ( not ( = ?auto_294479 ?auto_294481 ) ) ( not ( = ?auto_294479 ?auto_294482 ) ) ( not ( = ?auto_294479 ?auto_294483 ) ) ( not ( = ?auto_294479 ?auto_294484 ) ) ( not ( = ?auto_294479 ?auto_294485 ) ) ( not ( = ?auto_294479 ?auto_294486 ) ) ( not ( = ?auto_294479 ?auto_294487 ) ) ( not ( = ?auto_294479 ?auto_294488 ) ) ( not ( = ?auto_294479 ?auto_294489 ) ) ( not ( = ?auto_294479 ?auto_294490 ) ) ( not ( = ?auto_294480 ?auto_294481 ) ) ( not ( = ?auto_294480 ?auto_294482 ) ) ( not ( = ?auto_294480 ?auto_294483 ) ) ( not ( = ?auto_294480 ?auto_294484 ) ) ( not ( = ?auto_294480 ?auto_294485 ) ) ( not ( = ?auto_294480 ?auto_294486 ) ) ( not ( = ?auto_294480 ?auto_294487 ) ) ( not ( = ?auto_294480 ?auto_294488 ) ) ( not ( = ?auto_294480 ?auto_294489 ) ) ( not ( = ?auto_294480 ?auto_294490 ) ) ( not ( = ?auto_294481 ?auto_294482 ) ) ( not ( = ?auto_294481 ?auto_294483 ) ) ( not ( = ?auto_294481 ?auto_294484 ) ) ( not ( = ?auto_294481 ?auto_294485 ) ) ( not ( = ?auto_294481 ?auto_294486 ) ) ( not ( = ?auto_294481 ?auto_294487 ) ) ( not ( = ?auto_294481 ?auto_294488 ) ) ( not ( = ?auto_294481 ?auto_294489 ) ) ( not ( = ?auto_294481 ?auto_294490 ) ) ( not ( = ?auto_294482 ?auto_294483 ) ) ( not ( = ?auto_294482 ?auto_294484 ) ) ( not ( = ?auto_294482 ?auto_294485 ) ) ( not ( = ?auto_294482 ?auto_294486 ) ) ( not ( = ?auto_294482 ?auto_294487 ) ) ( not ( = ?auto_294482 ?auto_294488 ) ) ( not ( = ?auto_294482 ?auto_294489 ) ) ( not ( = ?auto_294482 ?auto_294490 ) ) ( not ( = ?auto_294483 ?auto_294484 ) ) ( not ( = ?auto_294483 ?auto_294485 ) ) ( not ( = ?auto_294483 ?auto_294486 ) ) ( not ( = ?auto_294483 ?auto_294487 ) ) ( not ( = ?auto_294483 ?auto_294488 ) ) ( not ( = ?auto_294483 ?auto_294489 ) ) ( not ( = ?auto_294483 ?auto_294490 ) ) ( not ( = ?auto_294484 ?auto_294485 ) ) ( not ( = ?auto_294484 ?auto_294486 ) ) ( not ( = ?auto_294484 ?auto_294487 ) ) ( not ( = ?auto_294484 ?auto_294488 ) ) ( not ( = ?auto_294484 ?auto_294489 ) ) ( not ( = ?auto_294484 ?auto_294490 ) ) ( not ( = ?auto_294485 ?auto_294486 ) ) ( not ( = ?auto_294485 ?auto_294487 ) ) ( not ( = ?auto_294485 ?auto_294488 ) ) ( not ( = ?auto_294485 ?auto_294489 ) ) ( not ( = ?auto_294485 ?auto_294490 ) ) ( not ( = ?auto_294486 ?auto_294487 ) ) ( not ( = ?auto_294486 ?auto_294488 ) ) ( not ( = ?auto_294486 ?auto_294489 ) ) ( not ( = ?auto_294486 ?auto_294490 ) ) ( not ( = ?auto_294487 ?auto_294488 ) ) ( not ( = ?auto_294487 ?auto_294489 ) ) ( not ( = ?auto_294487 ?auto_294490 ) ) ( not ( = ?auto_294488 ?auto_294489 ) ) ( not ( = ?auto_294488 ?auto_294490 ) ) ( not ( = ?auto_294489 ?auto_294490 ) ) ( ON ?auto_294488 ?auto_294489 ) ( ON ?auto_294487 ?auto_294488 ) ( ON ?auto_294486 ?auto_294487 ) ( ON ?auto_294485 ?auto_294486 ) ( CLEAR ?auto_294483 ) ( ON ?auto_294484 ?auto_294485 ) ( CLEAR ?auto_294484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_294478 ?auto_294479 ?auto_294480 ?auto_294481 ?auto_294482 ?auto_294483 ?auto_294484 )
      ( MAKE-12PILE ?auto_294478 ?auto_294479 ?auto_294480 ?auto_294481 ?auto_294482 ?auto_294483 ?auto_294484 ?auto_294485 ?auto_294486 ?auto_294487 ?auto_294488 ?auto_294489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294528 - BLOCK
      ?auto_294529 - BLOCK
      ?auto_294530 - BLOCK
      ?auto_294531 - BLOCK
      ?auto_294532 - BLOCK
      ?auto_294533 - BLOCK
      ?auto_294534 - BLOCK
      ?auto_294535 - BLOCK
      ?auto_294536 - BLOCK
      ?auto_294537 - BLOCK
      ?auto_294538 - BLOCK
      ?auto_294539 - BLOCK
    )
    :vars
    (
      ?auto_294540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294539 ?auto_294540 ) ( ON-TABLE ?auto_294528 ) ( ON ?auto_294529 ?auto_294528 ) ( ON ?auto_294530 ?auto_294529 ) ( ON ?auto_294531 ?auto_294530 ) ( ON ?auto_294532 ?auto_294531 ) ( not ( = ?auto_294528 ?auto_294529 ) ) ( not ( = ?auto_294528 ?auto_294530 ) ) ( not ( = ?auto_294528 ?auto_294531 ) ) ( not ( = ?auto_294528 ?auto_294532 ) ) ( not ( = ?auto_294528 ?auto_294533 ) ) ( not ( = ?auto_294528 ?auto_294534 ) ) ( not ( = ?auto_294528 ?auto_294535 ) ) ( not ( = ?auto_294528 ?auto_294536 ) ) ( not ( = ?auto_294528 ?auto_294537 ) ) ( not ( = ?auto_294528 ?auto_294538 ) ) ( not ( = ?auto_294528 ?auto_294539 ) ) ( not ( = ?auto_294528 ?auto_294540 ) ) ( not ( = ?auto_294529 ?auto_294530 ) ) ( not ( = ?auto_294529 ?auto_294531 ) ) ( not ( = ?auto_294529 ?auto_294532 ) ) ( not ( = ?auto_294529 ?auto_294533 ) ) ( not ( = ?auto_294529 ?auto_294534 ) ) ( not ( = ?auto_294529 ?auto_294535 ) ) ( not ( = ?auto_294529 ?auto_294536 ) ) ( not ( = ?auto_294529 ?auto_294537 ) ) ( not ( = ?auto_294529 ?auto_294538 ) ) ( not ( = ?auto_294529 ?auto_294539 ) ) ( not ( = ?auto_294529 ?auto_294540 ) ) ( not ( = ?auto_294530 ?auto_294531 ) ) ( not ( = ?auto_294530 ?auto_294532 ) ) ( not ( = ?auto_294530 ?auto_294533 ) ) ( not ( = ?auto_294530 ?auto_294534 ) ) ( not ( = ?auto_294530 ?auto_294535 ) ) ( not ( = ?auto_294530 ?auto_294536 ) ) ( not ( = ?auto_294530 ?auto_294537 ) ) ( not ( = ?auto_294530 ?auto_294538 ) ) ( not ( = ?auto_294530 ?auto_294539 ) ) ( not ( = ?auto_294530 ?auto_294540 ) ) ( not ( = ?auto_294531 ?auto_294532 ) ) ( not ( = ?auto_294531 ?auto_294533 ) ) ( not ( = ?auto_294531 ?auto_294534 ) ) ( not ( = ?auto_294531 ?auto_294535 ) ) ( not ( = ?auto_294531 ?auto_294536 ) ) ( not ( = ?auto_294531 ?auto_294537 ) ) ( not ( = ?auto_294531 ?auto_294538 ) ) ( not ( = ?auto_294531 ?auto_294539 ) ) ( not ( = ?auto_294531 ?auto_294540 ) ) ( not ( = ?auto_294532 ?auto_294533 ) ) ( not ( = ?auto_294532 ?auto_294534 ) ) ( not ( = ?auto_294532 ?auto_294535 ) ) ( not ( = ?auto_294532 ?auto_294536 ) ) ( not ( = ?auto_294532 ?auto_294537 ) ) ( not ( = ?auto_294532 ?auto_294538 ) ) ( not ( = ?auto_294532 ?auto_294539 ) ) ( not ( = ?auto_294532 ?auto_294540 ) ) ( not ( = ?auto_294533 ?auto_294534 ) ) ( not ( = ?auto_294533 ?auto_294535 ) ) ( not ( = ?auto_294533 ?auto_294536 ) ) ( not ( = ?auto_294533 ?auto_294537 ) ) ( not ( = ?auto_294533 ?auto_294538 ) ) ( not ( = ?auto_294533 ?auto_294539 ) ) ( not ( = ?auto_294533 ?auto_294540 ) ) ( not ( = ?auto_294534 ?auto_294535 ) ) ( not ( = ?auto_294534 ?auto_294536 ) ) ( not ( = ?auto_294534 ?auto_294537 ) ) ( not ( = ?auto_294534 ?auto_294538 ) ) ( not ( = ?auto_294534 ?auto_294539 ) ) ( not ( = ?auto_294534 ?auto_294540 ) ) ( not ( = ?auto_294535 ?auto_294536 ) ) ( not ( = ?auto_294535 ?auto_294537 ) ) ( not ( = ?auto_294535 ?auto_294538 ) ) ( not ( = ?auto_294535 ?auto_294539 ) ) ( not ( = ?auto_294535 ?auto_294540 ) ) ( not ( = ?auto_294536 ?auto_294537 ) ) ( not ( = ?auto_294536 ?auto_294538 ) ) ( not ( = ?auto_294536 ?auto_294539 ) ) ( not ( = ?auto_294536 ?auto_294540 ) ) ( not ( = ?auto_294537 ?auto_294538 ) ) ( not ( = ?auto_294537 ?auto_294539 ) ) ( not ( = ?auto_294537 ?auto_294540 ) ) ( not ( = ?auto_294538 ?auto_294539 ) ) ( not ( = ?auto_294538 ?auto_294540 ) ) ( not ( = ?auto_294539 ?auto_294540 ) ) ( ON ?auto_294538 ?auto_294539 ) ( ON ?auto_294537 ?auto_294538 ) ( ON ?auto_294536 ?auto_294537 ) ( ON ?auto_294535 ?auto_294536 ) ( ON ?auto_294534 ?auto_294535 ) ( CLEAR ?auto_294532 ) ( ON ?auto_294533 ?auto_294534 ) ( CLEAR ?auto_294533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_294528 ?auto_294529 ?auto_294530 ?auto_294531 ?auto_294532 ?auto_294533 )
      ( MAKE-12PILE ?auto_294528 ?auto_294529 ?auto_294530 ?auto_294531 ?auto_294532 ?auto_294533 ?auto_294534 ?auto_294535 ?auto_294536 ?auto_294537 ?auto_294538 ?auto_294539 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294578 - BLOCK
      ?auto_294579 - BLOCK
      ?auto_294580 - BLOCK
      ?auto_294581 - BLOCK
      ?auto_294582 - BLOCK
      ?auto_294583 - BLOCK
      ?auto_294584 - BLOCK
      ?auto_294585 - BLOCK
      ?auto_294586 - BLOCK
      ?auto_294587 - BLOCK
      ?auto_294588 - BLOCK
      ?auto_294589 - BLOCK
    )
    :vars
    (
      ?auto_294590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294589 ?auto_294590 ) ( ON-TABLE ?auto_294578 ) ( ON ?auto_294579 ?auto_294578 ) ( ON ?auto_294580 ?auto_294579 ) ( ON ?auto_294581 ?auto_294580 ) ( not ( = ?auto_294578 ?auto_294579 ) ) ( not ( = ?auto_294578 ?auto_294580 ) ) ( not ( = ?auto_294578 ?auto_294581 ) ) ( not ( = ?auto_294578 ?auto_294582 ) ) ( not ( = ?auto_294578 ?auto_294583 ) ) ( not ( = ?auto_294578 ?auto_294584 ) ) ( not ( = ?auto_294578 ?auto_294585 ) ) ( not ( = ?auto_294578 ?auto_294586 ) ) ( not ( = ?auto_294578 ?auto_294587 ) ) ( not ( = ?auto_294578 ?auto_294588 ) ) ( not ( = ?auto_294578 ?auto_294589 ) ) ( not ( = ?auto_294578 ?auto_294590 ) ) ( not ( = ?auto_294579 ?auto_294580 ) ) ( not ( = ?auto_294579 ?auto_294581 ) ) ( not ( = ?auto_294579 ?auto_294582 ) ) ( not ( = ?auto_294579 ?auto_294583 ) ) ( not ( = ?auto_294579 ?auto_294584 ) ) ( not ( = ?auto_294579 ?auto_294585 ) ) ( not ( = ?auto_294579 ?auto_294586 ) ) ( not ( = ?auto_294579 ?auto_294587 ) ) ( not ( = ?auto_294579 ?auto_294588 ) ) ( not ( = ?auto_294579 ?auto_294589 ) ) ( not ( = ?auto_294579 ?auto_294590 ) ) ( not ( = ?auto_294580 ?auto_294581 ) ) ( not ( = ?auto_294580 ?auto_294582 ) ) ( not ( = ?auto_294580 ?auto_294583 ) ) ( not ( = ?auto_294580 ?auto_294584 ) ) ( not ( = ?auto_294580 ?auto_294585 ) ) ( not ( = ?auto_294580 ?auto_294586 ) ) ( not ( = ?auto_294580 ?auto_294587 ) ) ( not ( = ?auto_294580 ?auto_294588 ) ) ( not ( = ?auto_294580 ?auto_294589 ) ) ( not ( = ?auto_294580 ?auto_294590 ) ) ( not ( = ?auto_294581 ?auto_294582 ) ) ( not ( = ?auto_294581 ?auto_294583 ) ) ( not ( = ?auto_294581 ?auto_294584 ) ) ( not ( = ?auto_294581 ?auto_294585 ) ) ( not ( = ?auto_294581 ?auto_294586 ) ) ( not ( = ?auto_294581 ?auto_294587 ) ) ( not ( = ?auto_294581 ?auto_294588 ) ) ( not ( = ?auto_294581 ?auto_294589 ) ) ( not ( = ?auto_294581 ?auto_294590 ) ) ( not ( = ?auto_294582 ?auto_294583 ) ) ( not ( = ?auto_294582 ?auto_294584 ) ) ( not ( = ?auto_294582 ?auto_294585 ) ) ( not ( = ?auto_294582 ?auto_294586 ) ) ( not ( = ?auto_294582 ?auto_294587 ) ) ( not ( = ?auto_294582 ?auto_294588 ) ) ( not ( = ?auto_294582 ?auto_294589 ) ) ( not ( = ?auto_294582 ?auto_294590 ) ) ( not ( = ?auto_294583 ?auto_294584 ) ) ( not ( = ?auto_294583 ?auto_294585 ) ) ( not ( = ?auto_294583 ?auto_294586 ) ) ( not ( = ?auto_294583 ?auto_294587 ) ) ( not ( = ?auto_294583 ?auto_294588 ) ) ( not ( = ?auto_294583 ?auto_294589 ) ) ( not ( = ?auto_294583 ?auto_294590 ) ) ( not ( = ?auto_294584 ?auto_294585 ) ) ( not ( = ?auto_294584 ?auto_294586 ) ) ( not ( = ?auto_294584 ?auto_294587 ) ) ( not ( = ?auto_294584 ?auto_294588 ) ) ( not ( = ?auto_294584 ?auto_294589 ) ) ( not ( = ?auto_294584 ?auto_294590 ) ) ( not ( = ?auto_294585 ?auto_294586 ) ) ( not ( = ?auto_294585 ?auto_294587 ) ) ( not ( = ?auto_294585 ?auto_294588 ) ) ( not ( = ?auto_294585 ?auto_294589 ) ) ( not ( = ?auto_294585 ?auto_294590 ) ) ( not ( = ?auto_294586 ?auto_294587 ) ) ( not ( = ?auto_294586 ?auto_294588 ) ) ( not ( = ?auto_294586 ?auto_294589 ) ) ( not ( = ?auto_294586 ?auto_294590 ) ) ( not ( = ?auto_294587 ?auto_294588 ) ) ( not ( = ?auto_294587 ?auto_294589 ) ) ( not ( = ?auto_294587 ?auto_294590 ) ) ( not ( = ?auto_294588 ?auto_294589 ) ) ( not ( = ?auto_294588 ?auto_294590 ) ) ( not ( = ?auto_294589 ?auto_294590 ) ) ( ON ?auto_294588 ?auto_294589 ) ( ON ?auto_294587 ?auto_294588 ) ( ON ?auto_294586 ?auto_294587 ) ( ON ?auto_294585 ?auto_294586 ) ( ON ?auto_294584 ?auto_294585 ) ( ON ?auto_294583 ?auto_294584 ) ( CLEAR ?auto_294581 ) ( ON ?auto_294582 ?auto_294583 ) ( CLEAR ?auto_294582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_294578 ?auto_294579 ?auto_294580 ?auto_294581 ?auto_294582 )
      ( MAKE-12PILE ?auto_294578 ?auto_294579 ?auto_294580 ?auto_294581 ?auto_294582 ?auto_294583 ?auto_294584 ?auto_294585 ?auto_294586 ?auto_294587 ?auto_294588 ?auto_294589 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294628 - BLOCK
      ?auto_294629 - BLOCK
      ?auto_294630 - BLOCK
      ?auto_294631 - BLOCK
      ?auto_294632 - BLOCK
      ?auto_294633 - BLOCK
      ?auto_294634 - BLOCK
      ?auto_294635 - BLOCK
      ?auto_294636 - BLOCK
      ?auto_294637 - BLOCK
      ?auto_294638 - BLOCK
      ?auto_294639 - BLOCK
    )
    :vars
    (
      ?auto_294640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294639 ?auto_294640 ) ( ON-TABLE ?auto_294628 ) ( ON ?auto_294629 ?auto_294628 ) ( ON ?auto_294630 ?auto_294629 ) ( not ( = ?auto_294628 ?auto_294629 ) ) ( not ( = ?auto_294628 ?auto_294630 ) ) ( not ( = ?auto_294628 ?auto_294631 ) ) ( not ( = ?auto_294628 ?auto_294632 ) ) ( not ( = ?auto_294628 ?auto_294633 ) ) ( not ( = ?auto_294628 ?auto_294634 ) ) ( not ( = ?auto_294628 ?auto_294635 ) ) ( not ( = ?auto_294628 ?auto_294636 ) ) ( not ( = ?auto_294628 ?auto_294637 ) ) ( not ( = ?auto_294628 ?auto_294638 ) ) ( not ( = ?auto_294628 ?auto_294639 ) ) ( not ( = ?auto_294628 ?auto_294640 ) ) ( not ( = ?auto_294629 ?auto_294630 ) ) ( not ( = ?auto_294629 ?auto_294631 ) ) ( not ( = ?auto_294629 ?auto_294632 ) ) ( not ( = ?auto_294629 ?auto_294633 ) ) ( not ( = ?auto_294629 ?auto_294634 ) ) ( not ( = ?auto_294629 ?auto_294635 ) ) ( not ( = ?auto_294629 ?auto_294636 ) ) ( not ( = ?auto_294629 ?auto_294637 ) ) ( not ( = ?auto_294629 ?auto_294638 ) ) ( not ( = ?auto_294629 ?auto_294639 ) ) ( not ( = ?auto_294629 ?auto_294640 ) ) ( not ( = ?auto_294630 ?auto_294631 ) ) ( not ( = ?auto_294630 ?auto_294632 ) ) ( not ( = ?auto_294630 ?auto_294633 ) ) ( not ( = ?auto_294630 ?auto_294634 ) ) ( not ( = ?auto_294630 ?auto_294635 ) ) ( not ( = ?auto_294630 ?auto_294636 ) ) ( not ( = ?auto_294630 ?auto_294637 ) ) ( not ( = ?auto_294630 ?auto_294638 ) ) ( not ( = ?auto_294630 ?auto_294639 ) ) ( not ( = ?auto_294630 ?auto_294640 ) ) ( not ( = ?auto_294631 ?auto_294632 ) ) ( not ( = ?auto_294631 ?auto_294633 ) ) ( not ( = ?auto_294631 ?auto_294634 ) ) ( not ( = ?auto_294631 ?auto_294635 ) ) ( not ( = ?auto_294631 ?auto_294636 ) ) ( not ( = ?auto_294631 ?auto_294637 ) ) ( not ( = ?auto_294631 ?auto_294638 ) ) ( not ( = ?auto_294631 ?auto_294639 ) ) ( not ( = ?auto_294631 ?auto_294640 ) ) ( not ( = ?auto_294632 ?auto_294633 ) ) ( not ( = ?auto_294632 ?auto_294634 ) ) ( not ( = ?auto_294632 ?auto_294635 ) ) ( not ( = ?auto_294632 ?auto_294636 ) ) ( not ( = ?auto_294632 ?auto_294637 ) ) ( not ( = ?auto_294632 ?auto_294638 ) ) ( not ( = ?auto_294632 ?auto_294639 ) ) ( not ( = ?auto_294632 ?auto_294640 ) ) ( not ( = ?auto_294633 ?auto_294634 ) ) ( not ( = ?auto_294633 ?auto_294635 ) ) ( not ( = ?auto_294633 ?auto_294636 ) ) ( not ( = ?auto_294633 ?auto_294637 ) ) ( not ( = ?auto_294633 ?auto_294638 ) ) ( not ( = ?auto_294633 ?auto_294639 ) ) ( not ( = ?auto_294633 ?auto_294640 ) ) ( not ( = ?auto_294634 ?auto_294635 ) ) ( not ( = ?auto_294634 ?auto_294636 ) ) ( not ( = ?auto_294634 ?auto_294637 ) ) ( not ( = ?auto_294634 ?auto_294638 ) ) ( not ( = ?auto_294634 ?auto_294639 ) ) ( not ( = ?auto_294634 ?auto_294640 ) ) ( not ( = ?auto_294635 ?auto_294636 ) ) ( not ( = ?auto_294635 ?auto_294637 ) ) ( not ( = ?auto_294635 ?auto_294638 ) ) ( not ( = ?auto_294635 ?auto_294639 ) ) ( not ( = ?auto_294635 ?auto_294640 ) ) ( not ( = ?auto_294636 ?auto_294637 ) ) ( not ( = ?auto_294636 ?auto_294638 ) ) ( not ( = ?auto_294636 ?auto_294639 ) ) ( not ( = ?auto_294636 ?auto_294640 ) ) ( not ( = ?auto_294637 ?auto_294638 ) ) ( not ( = ?auto_294637 ?auto_294639 ) ) ( not ( = ?auto_294637 ?auto_294640 ) ) ( not ( = ?auto_294638 ?auto_294639 ) ) ( not ( = ?auto_294638 ?auto_294640 ) ) ( not ( = ?auto_294639 ?auto_294640 ) ) ( ON ?auto_294638 ?auto_294639 ) ( ON ?auto_294637 ?auto_294638 ) ( ON ?auto_294636 ?auto_294637 ) ( ON ?auto_294635 ?auto_294636 ) ( ON ?auto_294634 ?auto_294635 ) ( ON ?auto_294633 ?auto_294634 ) ( ON ?auto_294632 ?auto_294633 ) ( CLEAR ?auto_294630 ) ( ON ?auto_294631 ?auto_294632 ) ( CLEAR ?auto_294631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_294628 ?auto_294629 ?auto_294630 ?auto_294631 )
      ( MAKE-12PILE ?auto_294628 ?auto_294629 ?auto_294630 ?auto_294631 ?auto_294632 ?auto_294633 ?auto_294634 ?auto_294635 ?auto_294636 ?auto_294637 ?auto_294638 ?auto_294639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294678 - BLOCK
      ?auto_294679 - BLOCK
      ?auto_294680 - BLOCK
      ?auto_294681 - BLOCK
      ?auto_294682 - BLOCK
      ?auto_294683 - BLOCK
      ?auto_294684 - BLOCK
      ?auto_294685 - BLOCK
      ?auto_294686 - BLOCK
      ?auto_294687 - BLOCK
      ?auto_294688 - BLOCK
      ?auto_294689 - BLOCK
    )
    :vars
    (
      ?auto_294690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294689 ?auto_294690 ) ( ON-TABLE ?auto_294678 ) ( ON ?auto_294679 ?auto_294678 ) ( not ( = ?auto_294678 ?auto_294679 ) ) ( not ( = ?auto_294678 ?auto_294680 ) ) ( not ( = ?auto_294678 ?auto_294681 ) ) ( not ( = ?auto_294678 ?auto_294682 ) ) ( not ( = ?auto_294678 ?auto_294683 ) ) ( not ( = ?auto_294678 ?auto_294684 ) ) ( not ( = ?auto_294678 ?auto_294685 ) ) ( not ( = ?auto_294678 ?auto_294686 ) ) ( not ( = ?auto_294678 ?auto_294687 ) ) ( not ( = ?auto_294678 ?auto_294688 ) ) ( not ( = ?auto_294678 ?auto_294689 ) ) ( not ( = ?auto_294678 ?auto_294690 ) ) ( not ( = ?auto_294679 ?auto_294680 ) ) ( not ( = ?auto_294679 ?auto_294681 ) ) ( not ( = ?auto_294679 ?auto_294682 ) ) ( not ( = ?auto_294679 ?auto_294683 ) ) ( not ( = ?auto_294679 ?auto_294684 ) ) ( not ( = ?auto_294679 ?auto_294685 ) ) ( not ( = ?auto_294679 ?auto_294686 ) ) ( not ( = ?auto_294679 ?auto_294687 ) ) ( not ( = ?auto_294679 ?auto_294688 ) ) ( not ( = ?auto_294679 ?auto_294689 ) ) ( not ( = ?auto_294679 ?auto_294690 ) ) ( not ( = ?auto_294680 ?auto_294681 ) ) ( not ( = ?auto_294680 ?auto_294682 ) ) ( not ( = ?auto_294680 ?auto_294683 ) ) ( not ( = ?auto_294680 ?auto_294684 ) ) ( not ( = ?auto_294680 ?auto_294685 ) ) ( not ( = ?auto_294680 ?auto_294686 ) ) ( not ( = ?auto_294680 ?auto_294687 ) ) ( not ( = ?auto_294680 ?auto_294688 ) ) ( not ( = ?auto_294680 ?auto_294689 ) ) ( not ( = ?auto_294680 ?auto_294690 ) ) ( not ( = ?auto_294681 ?auto_294682 ) ) ( not ( = ?auto_294681 ?auto_294683 ) ) ( not ( = ?auto_294681 ?auto_294684 ) ) ( not ( = ?auto_294681 ?auto_294685 ) ) ( not ( = ?auto_294681 ?auto_294686 ) ) ( not ( = ?auto_294681 ?auto_294687 ) ) ( not ( = ?auto_294681 ?auto_294688 ) ) ( not ( = ?auto_294681 ?auto_294689 ) ) ( not ( = ?auto_294681 ?auto_294690 ) ) ( not ( = ?auto_294682 ?auto_294683 ) ) ( not ( = ?auto_294682 ?auto_294684 ) ) ( not ( = ?auto_294682 ?auto_294685 ) ) ( not ( = ?auto_294682 ?auto_294686 ) ) ( not ( = ?auto_294682 ?auto_294687 ) ) ( not ( = ?auto_294682 ?auto_294688 ) ) ( not ( = ?auto_294682 ?auto_294689 ) ) ( not ( = ?auto_294682 ?auto_294690 ) ) ( not ( = ?auto_294683 ?auto_294684 ) ) ( not ( = ?auto_294683 ?auto_294685 ) ) ( not ( = ?auto_294683 ?auto_294686 ) ) ( not ( = ?auto_294683 ?auto_294687 ) ) ( not ( = ?auto_294683 ?auto_294688 ) ) ( not ( = ?auto_294683 ?auto_294689 ) ) ( not ( = ?auto_294683 ?auto_294690 ) ) ( not ( = ?auto_294684 ?auto_294685 ) ) ( not ( = ?auto_294684 ?auto_294686 ) ) ( not ( = ?auto_294684 ?auto_294687 ) ) ( not ( = ?auto_294684 ?auto_294688 ) ) ( not ( = ?auto_294684 ?auto_294689 ) ) ( not ( = ?auto_294684 ?auto_294690 ) ) ( not ( = ?auto_294685 ?auto_294686 ) ) ( not ( = ?auto_294685 ?auto_294687 ) ) ( not ( = ?auto_294685 ?auto_294688 ) ) ( not ( = ?auto_294685 ?auto_294689 ) ) ( not ( = ?auto_294685 ?auto_294690 ) ) ( not ( = ?auto_294686 ?auto_294687 ) ) ( not ( = ?auto_294686 ?auto_294688 ) ) ( not ( = ?auto_294686 ?auto_294689 ) ) ( not ( = ?auto_294686 ?auto_294690 ) ) ( not ( = ?auto_294687 ?auto_294688 ) ) ( not ( = ?auto_294687 ?auto_294689 ) ) ( not ( = ?auto_294687 ?auto_294690 ) ) ( not ( = ?auto_294688 ?auto_294689 ) ) ( not ( = ?auto_294688 ?auto_294690 ) ) ( not ( = ?auto_294689 ?auto_294690 ) ) ( ON ?auto_294688 ?auto_294689 ) ( ON ?auto_294687 ?auto_294688 ) ( ON ?auto_294686 ?auto_294687 ) ( ON ?auto_294685 ?auto_294686 ) ( ON ?auto_294684 ?auto_294685 ) ( ON ?auto_294683 ?auto_294684 ) ( ON ?auto_294682 ?auto_294683 ) ( ON ?auto_294681 ?auto_294682 ) ( CLEAR ?auto_294679 ) ( ON ?auto_294680 ?auto_294681 ) ( CLEAR ?auto_294680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_294678 ?auto_294679 ?auto_294680 )
      ( MAKE-12PILE ?auto_294678 ?auto_294679 ?auto_294680 ?auto_294681 ?auto_294682 ?auto_294683 ?auto_294684 ?auto_294685 ?auto_294686 ?auto_294687 ?auto_294688 ?auto_294689 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294728 - BLOCK
      ?auto_294729 - BLOCK
      ?auto_294730 - BLOCK
      ?auto_294731 - BLOCK
      ?auto_294732 - BLOCK
      ?auto_294733 - BLOCK
      ?auto_294734 - BLOCK
      ?auto_294735 - BLOCK
      ?auto_294736 - BLOCK
      ?auto_294737 - BLOCK
      ?auto_294738 - BLOCK
      ?auto_294739 - BLOCK
    )
    :vars
    (
      ?auto_294740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294739 ?auto_294740 ) ( ON-TABLE ?auto_294728 ) ( not ( = ?auto_294728 ?auto_294729 ) ) ( not ( = ?auto_294728 ?auto_294730 ) ) ( not ( = ?auto_294728 ?auto_294731 ) ) ( not ( = ?auto_294728 ?auto_294732 ) ) ( not ( = ?auto_294728 ?auto_294733 ) ) ( not ( = ?auto_294728 ?auto_294734 ) ) ( not ( = ?auto_294728 ?auto_294735 ) ) ( not ( = ?auto_294728 ?auto_294736 ) ) ( not ( = ?auto_294728 ?auto_294737 ) ) ( not ( = ?auto_294728 ?auto_294738 ) ) ( not ( = ?auto_294728 ?auto_294739 ) ) ( not ( = ?auto_294728 ?auto_294740 ) ) ( not ( = ?auto_294729 ?auto_294730 ) ) ( not ( = ?auto_294729 ?auto_294731 ) ) ( not ( = ?auto_294729 ?auto_294732 ) ) ( not ( = ?auto_294729 ?auto_294733 ) ) ( not ( = ?auto_294729 ?auto_294734 ) ) ( not ( = ?auto_294729 ?auto_294735 ) ) ( not ( = ?auto_294729 ?auto_294736 ) ) ( not ( = ?auto_294729 ?auto_294737 ) ) ( not ( = ?auto_294729 ?auto_294738 ) ) ( not ( = ?auto_294729 ?auto_294739 ) ) ( not ( = ?auto_294729 ?auto_294740 ) ) ( not ( = ?auto_294730 ?auto_294731 ) ) ( not ( = ?auto_294730 ?auto_294732 ) ) ( not ( = ?auto_294730 ?auto_294733 ) ) ( not ( = ?auto_294730 ?auto_294734 ) ) ( not ( = ?auto_294730 ?auto_294735 ) ) ( not ( = ?auto_294730 ?auto_294736 ) ) ( not ( = ?auto_294730 ?auto_294737 ) ) ( not ( = ?auto_294730 ?auto_294738 ) ) ( not ( = ?auto_294730 ?auto_294739 ) ) ( not ( = ?auto_294730 ?auto_294740 ) ) ( not ( = ?auto_294731 ?auto_294732 ) ) ( not ( = ?auto_294731 ?auto_294733 ) ) ( not ( = ?auto_294731 ?auto_294734 ) ) ( not ( = ?auto_294731 ?auto_294735 ) ) ( not ( = ?auto_294731 ?auto_294736 ) ) ( not ( = ?auto_294731 ?auto_294737 ) ) ( not ( = ?auto_294731 ?auto_294738 ) ) ( not ( = ?auto_294731 ?auto_294739 ) ) ( not ( = ?auto_294731 ?auto_294740 ) ) ( not ( = ?auto_294732 ?auto_294733 ) ) ( not ( = ?auto_294732 ?auto_294734 ) ) ( not ( = ?auto_294732 ?auto_294735 ) ) ( not ( = ?auto_294732 ?auto_294736 ) ) ( not ( = ?auto_294732 ?auto_294737 ) ) ( not ( = ?auto_294732 ?auto_294738 ) ) ( not ( = ?auto_294732 ?auto_294739 ) ) ( not ( = ?auto_294732 ?auto_294740 ) ) ( not ( = ?auto_294733 ?auto_294734 ) ) ( not ( = ?auto_294733 ?auto_294735 ) ) ( not ( = ?auto_294733 ?auto_294736 ) ) ( not ( = ?auto_294733 ?auto_294737 ) ) ( not ( = ?auto_294733 ?auto_294738 ) ) ( not ( = ?auto_294733 ?auto_294739 ) ) ( not ( = ?auto_294733 ?auto_294740 ) ) ( not ( = ?auto_294734 ?auto_294735 ) ) ( not ( = ?auto_294734 ?auto_294736 ) ) ( not ( = ?auto_294734 ?auto_294737 ) ) ( not ( = ?auto_294734 ?auto_294738 ) ) ( not ( = ?auto_294734 ?auto_294739 ) ) ( not ( = ?auto_294734 ?auto_294740 ) ) ( not ( = ?auto_294735 ?auto_294736 ) ) ( not ( = ?auto_294735 ?auto_294737 ) ) ( not ( = ?auto_294735 ?auto_294738 ) ) ( not ( = ?auto_294735 ?auto_294739 ) ) ( not ( = ?auto_294735 ?auto_294740 ) ) ( not ( = ?auto_294736 ?auto_294737 ) ) ( not ( = ?auto_294736 ?auto_294738 ) ) ( not ( = ?auto_294736 ?auto_294739 ) ) ( not ( = ?auto_294736 ?auto_294740 ) ) ( not ( = ?auto_294737 ?auto_294738 ) ) ( not ( = ?auto_294737 ?auto_294739 ) ) ( not ( = ?auto_294737 ?auto_294740 ) ) ( not ( = ?auto_294738 ?auto_294739 ) ) ( not ( = ?auto_294738 ?auto_294740 ) ) ( not ( = ?auto_294739 ?auto_294740 ) ) ( ON ?auto_294738 ?auto_294739 ) ( ON ?auto_294737 ?auto_294738 ) ( ON ?auto_294736 ?auto_294737 ) ( ON ?auto_294735 ?auto_294736 ) ( ON ?auto_294734 ?auto_294735 ) ( ON ?auto_294733 ?auto_294734 ) ( ON ?auto_294732 ?auto_294733 ) ( ON ?auto_294731 ?auto_294732 ) ( ON ?auto_294730 ?auto_294731 ) ( CLEAR ?auto_294728 ) ( ON ?auto_294729 ?auto_294730 ) ( CLEAR ?auto_294729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_294728 ?auto_294729 )
      ( MAKE-12PILE ?auto_294728 ?auto_294729 ?auto_294730 ?auto_294731 ?auto_294732 ?auto_294733 ?auto_294734 ?auto_294735 ?auto_294736 ?auto_294737 ?auto_294738 ?auto_294739 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_294778 - BLOCK
      ?auto_294779 - BLOCK
      ?auto_294780 - BLOCK
      ?auto_294781 - BLOCK
      ?auto_294782 - BLOCK
      ?auto_294783 - BLOCK
      ?auto_294784 - BLOCK
      ?auto_294785 - BLOCK
      ?auto_294786 - BLOCK
      ?auto_294787 - BLOCK
      ?auto_294788 - BLOCK
      ?auto_294789 - BLOCK
    )
    :vars
    (
      ?auto_294790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294789 ?auto_294790 ) ( not ( = ?auto_294778 ?auto_294779 ) ) ( not ( = ?auto_294778 ?auto_294780 ) ) ( not ( = ?auto_294778 ?auto_294781 ) ) ( not ( = ?auto_294778 ?auto_294782 ) ) ( not ( = ?auto_294778 ?auto_294783 ) ) ( not ( = ?auto_294778 ?auto_294784 ) ) ( not ( = ?auto_294778 ?auto_294785 ) ) ( not ( = ?auto_294778 ?auto_294786 ) ) ( not ( = ?auto_294778 ?auto_294787 ) ) ( not ( = ?auto_294778 ?auto_294788 ) ) ( not ( = ?auto_294778 ?auto_294789 ) ) ( not ( = ?auto_294778 ?auto_294790 ) ) ( not ( = ?auto_294779 ?auto_294780 ) ) ( not ( = ?auto_294779 ?auto_294781 ) ) ( not ( = ?auto_294779 ?auto_294782 ) ) ( not ( = ?auto_294779 ?auto_294783 ) ) ( not ( = ?auto_294779 ?auto_294784 ) ) ( not ( = ?auto_294779 ?auto_294785 ) ) ( not ( = ?auto_294779 ?auto_294786 ) ) ( not ( = ?auto_294779 ?auto_294787 ) ) ( not ( = ?auto_294779 ?auto_294788 ) ) ( not ( = ?auto_294779 ?auto_294789 ) ) ( not ( = ?auto_294779 ?auto_294790 ) ) ( not ( = ?auto_294780 ?auto_294781 ) ) ( not ( = ?auto_294780 ?auto_294782 ) ) ( not ( = ?auto_294780 ?auto_294783 ) ) ( not ( = ?auto_294780 ?auto_294784 ) ) ( not ( = ?auto_294780 ?auto_294785 ) ) ( not ( = ?auto_294780 ?auto_294786 ) ) ( not ( = ?auto_294780 ?auto_294787 ) ) ( not ( = ?auto_294780 ?auto_294788 ) ) ( not ( = ?auto_294780 ?auto_294789 ) ) ( not ( = ?auto_294780 ?auto_294790 ) ) ( not ( = ?auto_294781 ?auto_294782 ) ) ( not ( = ?auto_294781 ?auto_294783 ) ) ( not ( = ?auto_294781 ?auto_294784 ) ) ( not ( = ?auto_294781 ?auto_294785 ) ) ( not ( = ?auto_294781 ?auto_294786 ) ) ( not ( = ?auto_294781 ?auto_294787 ) ) ( not ( = ?auto_294781 ?auto_294788 ) ) ( not ( = ?auto_294781 ?auto_294789 ) ) ( not ( = ?auto_294781 ?auto_294790 ) ) ( not ( = ?auto_294782 ?auto_294783 ) ) ( not ( = ?auto_294782 ?auto_294784 ) ) ( not ( = ?auto_294782 ?auto_294785 ) ) ( not ( = ?auto_294782 ?auto_294786 ) ) ( not ( = ?auto_294782 ?auto_294787 ) ) ( not ( = ?auto_294782 ?auto_294788 ) ) ( not ( = ?auto_294782 ?auto_294789 ) ) ( not ( = ?auto_294782 ?auto_294790 ) ) ( not ( = ?auto_294783 ?auto_294784 ) ) ( not ( = ?auto_294783 ?auto_294785 ) ) ( not ( = ?auto_294783 ?auto_294786 ) ) ( not ( = ?auto_294783 ?auto_294787 ) ) ( not ( = ?auto_294783 ?auto_294788 ) ) ( not ( = ?auto_294783 ?auto_294789 ) ) ( not ( = ?auto_294783 ?auto_294790 ) ) ( not ( = ?auto_294784 ?auto_294785 ) ) ( not ( = ?auto_294784 ?auto_294786 ) ) ( not ( = ?auto_294784 ?auto_294787 ) ) ( not ( = ?auto_294784 ?auto_294788 ) ) ( not ( = ?auto_294784 ?auto_294789 ) ) ( not ( = ?auto_294784 ?auto_294790 ) ) ( not ( = ?auto_294785 ?auto_294786 ) ) ( not ( = ?auto_294785 ?auto_294787 ) ) ( not ( = ?auto_294785 ?auto_294788 ) ) ( not ( = ?auto_294785 ?auto_294789 ) ) ( not ( = ?auto_294785 ?auto_294790 ) ) ( not ( = ?auto_294786 ?auto_294787 ) ) ( not ( = ?auto_294786 ?auto_294788 ) ) ( not ( = ?auto_294786 ?auto_294789 ) ) ( not ( = ?auto_294786 ?auto_294790 ) ) ( not ( = ?auto_294787 ?auto_294788 ) ) ( not ( = ?auto_294787 ?auto_294789 ) ) ( not ( = ?auto_294787 ?auto_294790 ) ) ( not ( = ?auto_294788 ?auto_294789 ) ) ( not ( = ?auto_294788 ?auto_294790 ) ) ( not ( = ?auto_294789 ?auto_294790 ) ) ( ON ?auto_294788 ?auto_294789 ) ( ON ?auto_294787 ?auto_294788 ) ( ON ?auto_294786 ?auto_294787 ) ( ON ?auto_294785 ?auto_294786 ) ( ON ?auto_294784 ?auto_294785 ) ( ON ?auto_294783 ?auto_294784 ) ( ON ?auto_294782 ?auto_294783 ) ( ON ?auto_294781 ?auto_294782 ) ( ON ?auto_294780 ?auto_294781 ) ( ON ?auto_294779 ?auto_294780 ) ( ON ?auto_294778 ?auto_294779 ) ( CLEAR ?auto_294778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_294778 )
      ( MAKE-12PILE ?auto_294778 ?auto_294779 ?auto_294780 ?auto_294781 ?auto_294782 ?auto_294783 ?auto_294784 ?auto_294785 ?auto_294786 ?auto_294787 ?auto_294788 ?auto_294789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_294829 - BLOCK
      ?auto_294830 - BLOCK
      ?auto_294831 - BLOCK
      ?auto_294832 - BLOCK
      ?auto_294833 - BLOCK
      ?auto_294834 - BLOCK
      ?auto_294835 - BLOCK
      ?auto_294836 - BLOCK
      ?auto_294837 - BLOCK
      ?auto_294838 - BLOCK
      ?auto_294839 - BLOCK
      ?auto_294840 - BLOCK
      ?auto_294841 - BLOCK
    )
    :vars
    (
      ?auto_294842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_294840 ) ( ON ?auto_294841 ?auto_294842 ) ( CLEAR ?auto_294841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_294829 ) ( ON ?auto_294830 ?auto_294829 ) ( ON ?auto_294831 ?auto_294830 ) ( ON ?auto_294832 ?auto_294831 ) ( ON ?auto_294833 ?auto_294832 ) ( ON ?auto_294834 ?auto_294833 ) ( ON ?auto_294835 ?auto_294834 ) ( ON ?auto_294836 ?auto_294835 ) ( ON ?auto_294837 ?auto_294836 ) ( ON ?auto_294838 ?auto_294837 ) ( ON ?auto_294839 ?auto_294838 ) ( ON ?auto_294840 ?auto_294839 ) ( not ( = ?auto_294829 ?auto_294830 ) ) ( not ( = ?auto_294829 ?auto_294831 ) ) ( not ( = ?auto_294829 ?auto_294832 ) ) ( not ( = ?auto_294829 ?auto_294833 ) ) ( not ( = ?auto_294829 ?auto_294834 ) ) ( not ( = ?auto_294829 ?auto_294835 ) ) ( not ( = ?auto_294829 ?auto_294836 ) ) ( not ( = ?auto_294829 ?auto_294837 ) ) ( not ( = ?auto_294829 ?auto_294838 ) ) ( not ( = ?auto_294829 ?auto_294839 ) ) ( not ( = ?auto_294829 ?auto_294840 ) ) ( not ( = ?auto_294829 ?auto_294841 ) ) ( not ( = ?auto_294829 ?auto_294842 ) ) ( not ( = ?auto_294830 ?auto_294831 ) ) ( not ( = ?auto_294830 ?auto_294832 ) ) ( not ( = ?auto_294830 ?auto_294833 ) ) ( not ( = ?auto_294830 ?auto_294834 ) ) ( not ( = ?auto_294830 ?auto_294835 ) ) ( not ( = ?auto_294830 ?auto_294836 ) ) ( not ( = ?auto_294830 ?auto_294837 ) ) ( not ( = ?auto_294830 ?auto_294838 ) ) ( not ( = ?auto_294830 ?auto_294839 ) ) ( not ( = ?auto_294830 ?auto_294840 ) ) ( not ( = ?auto_294830 ?auto_294841 ) ) ( not ( = ?auto_294830 ?auto_294842 ) ) ( not ( = ?auto_294831 ?auto_294832 ) ) ( not ( = ?auto_294831 ?auto_294833 ) ) ( not ( = ?auto_294831 ?auto_294834 ) ) ( not ( = ?auto_294831 ?auto_294835 ) ) ( not ( = ?auto_294831 ?auto_294836 ) ) ( not ( = ?auto_294831 ?auto_294837 ) ) ( not ( = ?auto_294831 ?auto_294838 ) ) ( not ( = ?auto_294831 ?auto_294839 ) ) ( not ( = ?auto_294831 ?auto_294840 ) ) ( not ( = ?auto_294831 ?auto_294841 ) ) ( not ( = ?auto_294831 ?auto_294842 ) ) ( not ( = ?auto_294832 ?auto_294833 ) ) ( not ( = ?auto_294832 ?auto_294834 ) ) ( not ( = ?auto_294832 ?auto_294835 ) ) ( not ( = ?auto_294832 ?auto_294836 ) ) ( not ( = ?auto_294832 ?auto_294837 ) ) ( not ( = ?auto_294832 ?auto_294838 ) ) ( not ( = ?auto_294832 ?auto_294839 ) ) ( not ( = ?auto_294832 ?auto_294840 ) ) ( not ( = ?auto_294832 ?auto_294841 ) ) ( not ( = ?auto_294832 ?auto_294842 ) ) ( not ( = ?auto_294833 ?auto_294834 ) ) ( not ( = ?auto_294833 ?auto_294835 ) ) ( not ( = ?auto_294833 ?auto_294836 ) ) ( not ( = ?auto_294833 ?auto_294837 ) ) ( not ( = ?auto_294833 ?auto_294838 ) ) ( not ( = ?auto_294833 ?auto_294839 ) ) ( not ( = ?auto_294833 ?auto_294840 ) ) ( not ( = ?auto_294833 ?auto_294841 ) ) ( not ( = ?auto_294833 ?auto_294842 ) ) ( not ( = ?auto_294834 ?auto_294835 ) ) ( not ( = ?auto_294834 ?auto_294836 ) ) ( not ( = ?auto_294834 ?auto_294837 ) ) ( not ( = ?auto_294834 ?auto_294838 ) ) ( not ( = ?auto_294834 ?auto_294839 ) ) ( not ( = ?auto_294834 ?auto_294840 ) ) ( not ( = ?auto_294834 ?auto_294841 ) ) ( not ( = ?auto_294834 ?auto_294842 ) ) ( not ( = ?auto_294835 ?auto_294836 ) ) ( not ( = ?auto_294835 ?auto_294837 ) ) ( not ( = ?auto_294835 ?auto_294838 ) ) ( not ( = ?auto_294835 ?auto_294839 ) ) ( not ( = ?auto_294835 ?auto_294840 ) ) ( not ( = ?auto_294835 ?auto_294841 ) ) ( not ( = ?auto_294835 ?auto_294842 ) ) ( not ( = ?auto_294836 ?auto_294837 ) ) ( not ( = ?auto_294836 ?auto_294838 ) ) ( not ( = ?auto_294836 ?auto_294839 ) ) ( not ( = ?auto_294836 ?auto_294840 ) ) ( not ( = ?auto_294836 ?auto_294841 ) ) ( not ( = ?auto_294836 ?auto_294842 ) ) ( not ( = ?auto_294837 ?auto_294838 ) ) ( not ( = ?auto_294837 ?auto_294839 ) ) ( not ( = ?auto_294837 ?auto_294840 ) ) ( not ( = ?auto_294837 ?auto_294841 ) ) ( not ( = ?auto_294837 ?auto_294842 ) ) ( not ( = ?auto_294838 ?auto_294839 ) ) ( not ( = ?auto_294838 ?auto_294840 ) ) ( not ( = ?auto_294838 ?auto_294841 ) ) ( not ( = ?auto_294838 ?auto_294842 ) ) ( not ( = ?auto_294839 ?auto_294840 ) ) ( not ( = ?auto_294839 ?auto_294841 ) ) ( not ( = ?auto_294839 ?auto_294842 ) ) ( not ( = ?auto_294840 ?auto_294841 ) ) ( not ( = ?auto_294840 ?auto_294842 ) ) ( not ( = ?auto_294841 ?auto_294842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_294841 ?auto_294842 )
      ( !STACK ?auto_294841 ?auto_294840 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_294883 - BLOCK
      ?auto_294884 - BLOCK
      ?auto_294885 - BLOCK
      ?auto_294886 - BLOCK
      ?auto_294887 - BLOCK
      ?auto_294888 - BLOCK
      ?auto_294889 - BLOCK
      ?auto_294890 - BLOCK
      ?auto_294891 - BLOCK
      ?auto_294892 - BLOCK
      ?auto_294893 - BLOCK
      ?auto_294894 - BLOCK
      ?auto_294895 - BLOCK
    )
    :vars
    (
      ?auto_294896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294895 ?auto_294896 ) ( ON-TABLE ?auto_294883 ) ( ON ?auto_294884 ?auto_294883 ) ( ON ?auto_294885 ?auto_294884 ) ( ON ?auto_294886 ?auto_294885 ) ( ON ?auto_294887 ?auto_294886 ) ( ON ?auto_294888 ?auto_294887 ) ( ON ?auto_294889 ?auto_294888 ) ( ON ?auto_294890 ?auto_294889 ) ( ON ?auto_294891 ?auto_294890 ) ( ON ?auto_294892 ?auto_294891 ) ( ON ?auto_294893 ?auto_294892 ) ( not ( = ?auto_294883 ?auto_294884 ) ) ( not ( = ?auto_294883 ?auto_294885 ) ) ( not ( = ?auto_294883 ?auto_294886 ) ) ( not ( = ?auto_294883 ?auto_294887 ) ) ( not ( = ?auto_294883 ?auto_294888 ) ) ( not ( = ?auto_294883 ?auto_294889 ) ) ( not ( = ?auto_294883 ?auto_294890 ) ) ( not ( = ?auto_294883 ?auto_294891 ) ) ( not ( = ?auto_294883 ?auto_294892 ) ) ( not ( = ?auto_294883 ?auto_294893 ) ) ( not ( = ?auto_294883 ?auto_294894 ) ) ( not ( = ?auto_294883 ?auto_294895 ) ) ( not ( = ?auto_294883 ?auto_294896 ) ) ( not ( = ?auto_294884 ?auto_294885 ) ) ( not ( = ?auto_294884 ?auto_294886 ) ) ( not ( = ?auto_294884 ?auto_294887 ) ) ( not ( = ?auto_294884 ?auto_294888 ) ) ( not ( = ?auto_294884 ?auto_294889 ) ) ( not ( = ?auto_294884 ?auto_294890 ) ) ( not ( = ?auto_294884 ?auto_294891 ) ) ( not ( = ?auto_294884 ?auto_294892 ) ) ( not ( = ?auto_294884 ?auto_294893 ) ) ( not ( = ?auto_294884 ?auto_294894 ) ) ( not ( = ?auto_294884 ?auto_294895 ) ) ( not ( = ?auto_294884 ?auto_294896 ) ) ( not ( = ?auto_294885 ?auto_294886 ) ) ( not ( = ?auto_294885 ?auto_294887 ) ) ( not ( = ?auto_294885 ?auto_294888 ) ) ( not ( = ?auto_294885 ?auto_294889 ) ) ( not ( = ?auto_294885 ?auto_294890 ) ) ( not ( = ?auto_294885 ?auto_294891 ) ) ( not ( = ?auto_294885 ?auto_294892 ) ) ( not ( = ?auto_294885 ?auto_294893 ) ) ( not ( = ?auto_294885 ?auto_294894 ) ) ( not ( = ?auto_294885 ?auto_294895 ) ) ( not ( = ?auto_294885 ?auto_294896 ) ) ( not ( = ?auto_294886 ?auto_294887 ) ) ( not ( = ?auto_294886 ?auto_294888 ) ) ( not ( = ?auto_294886 ?auto_294889 ) ) ( not ( = ?auto_294886 ?auto_294890 ) ) ( not ( = ?auto_294886 ?auto_294891 ) ) ( not ( = ?auto_294886 ?auto_294892 ) ) ( not ( = ?auto_294886 ?auto_294893 ) ) ( not ( = ?auto_294886 ?auto_294894 ) ) ( not ( = ?auto_294886 ?auto_294895 ) ) ( not ( = ?auto_294886 ?auto_294896 ) ) ( not ( = ?auto_294887 ?auto_294888 ) ) ( not ( = ?auto_294887 ?auto_294889 ) ) ( not ( = ?auto_294887 ?auto_294890 ) ) ( not ( = ?auto_294887 ?auto_294891 ) ) ( not ( = ?auto_294887 ?auto_294892 ) ) ( not ( = ?auto_294887 ?auto_294893 ) ) ( not ( = ?auto_294887 ?auto_294894 ) ) ( not ( = ?auto_294887 ?auto_294895 ) ) ( not ( = ?auto_294887 ?auto_294896 ) ) ( not ( = ?auto_294888 ?auto_294889 ) ) ( not ( = ?auto_294888 ?auto_294890 ) ) ( not ( = ?auto_294888 ?auto_294891 ) ) ( not ( = ?auto_294888 ?auto_294892 ) ) ( not ( = ?auto_294888 ?auto_294893 ) ) ( not ( = ?auto_294888 ?auto_294894 ) ) ( not ( = ?auto_294888 ?auto_294895 ) ) ( not ( = ?auto_294888 ?auto_294896 ) ) ( not ( = ?auto_294889 ?auto_294890 ) ) ( not ( = ?auto_294889 ?auto_294891 ) ) ( not ( = ?auto_294889 ?auto_294892 ) ) ( not ( = ?auto_294889 ?auto_294893 ) ) ( not ( = ?auto_294889 ?auto_294894 ) ) ( not ( = ?auto_294889 ?auto_294895 ) ) ( not ( = ?auto_294889 ?auto_294896 ) ) ( not ( = ?auto_294890 ?auto_294891 ) ) ( not ( = ?auto_294890 ?auto_294892 ) ) ( not ( = ?auto_294890 ?auto_294893 ) ) ( not ( = ?auto_294890 ?auto_294894 ) ) ( not ( = ?auto_294890 ?auto_294895 ) ) ( not ( = ?auto_294890 ?auto_294896 ) ) ( not ( = ?auto_294891 ?auto_294892 ) ) ( not ( = ?auto_294891 ?auto_294893 ) ) ( not ( = ?auto_294891 ?auto_294894 ) ) ( not ( = ?auto_294891 ?auto_294895 ) ) ( not ( = ?auto_294891 ?auto_294896 ) ) ( not ( = ?auto_294892 ?auto_294893 ) ) ( not ( = ?auto_294892 ?auto_294894 ) ) ( not ( = ?auto_294892 ?auto_294895 ) ) ( not ( = ?auto_294892 ?auto_294896 ) ) ( not ( = ?auto_294893 ?auto_294894 ) ) ( not ( = ?auto_294893 ?auto_294895 ) ) ( not ( = ?auto_294893 ?auto_294896 ) ) ( not ( = ?auto_294894 ?auto_294895 ) ) ( not ( = ?auto_294894 ?auto_294896 ) ) ( not ( = ?auto_294895 ?auto_294896 ) ) ( CLEAR ?auto_294893 ) ( ON ?auto_294894 ?auto_294895 ) ( CLEAR ?auto_294894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_294883 ?auto_294884 ?auto_294885 ?auto_294886 ?auto_294887 ?auto_294888 ?auto_294889 ?auto_294890 ?auto_294891 ?auto_294892 ?auto_294893 ?auto_294894 )
      ( MAKE-13PILE ?auto_294883 ?auto_294884 ?auto_294885 ?auto_294886 ?auto_294887 ?auto_294888 ?auto_294889 ?auto_294890 ?auto_294891 ?auto_294892 ?auto_294893 ?auto_294894 ?auto_294895 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_294937 - BLOCK
      ?auto_294938 - BLOCK
      ?auto_294939 - BLOCK
      ?auto_294940 - BLOCK
      ?auto_294941 - BLOCK
      ?auto_294942 - BLOCK
      ?auto_294943 - BLOCK
      ?auto_294944 - BLOCK
      ?auto_294945 - BLOCK
      ?auto_294946 - BLOCK
      ?auto_294947 - BLOCK
      ?auto_294948 - BLOCK
      ?auto_294949 - BLOCK
    )
    :vars
    (
      ?auto_294950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_294949 ?auto_294950 ) ( ON-TABLE ?auto_294937 ) ( ON ?auto_294938 ?auto_294937 ) ( ON ?auto_294939 ?auto_294938 ) ( ON ?auto_294940 ?auto_294939 ) ( ON ?auto_294941 ?auto_294940 ) ( ON ?auto_294942 ?auto_294941 ) ( ON ?auto_294943 ?auto_294942 ) ( ON ?auto_294944 ?auto_294943 ) ( ON ?auto_294945 ?auto_294944 ) ( ON ?auto_294946 ?auto_294945 ) ( not ( = ?auto_294937 ?auto_294938 ) ) ( not ( = ?auto_294937 ?auto_294939 ) ) ( not ( = ?auto_294937 ?auto_294940 ) ) ( not ( = ?auto_294937 ?auto_294941 ) ) ( not ( = ?auto_294937 ?auto_294942 ) ) ( not ( = ?auto_294937 ?auto_294943 ) ) ( not ( = ?auto_294937 ?auto_294944 ) ) ( not ( = ?auto_294937 ?auto_294945 ) ) ( not ( = ?auto_294937 ?auto_294946 ) ) ( not ( = ?auto_294937 ?auto_294947 ) ) ( not ( = ?auto_294937 ?auto_294948 ) ) ( not ( = ?auto_294937 ?auto_294949 ) ) ( not ( = ?auto_294937 ?auto_294950 ) ) ( not ( = ?auto_294938 ?auto_294939 ) ) ( not ( = ?auto_294938 ?auto_294940 ) ) ( not ( = ?auto_294938 ?auto_294941 ) ) ( not ( = ?auto_294938 ?auto_294942 ) ) ( not ( = ?auto_294938 ?auto_294943 ) ) ( not ( = ?auto_294938 ?auto_294944 ) ) ( not ( = ?auto_294938 ?auto_294945 ) ) ( not ( = ?auto_294938 ?auto_294946 ) ) ( not ( = ?auto_294938 ?auto_294947 ) ) ( not ( = ?auto_294938 ?auto_294948 ) ) ( not ( = ?auto_294938 ?auto_294949 ) ) ( not ( = ?auto_294938 ?auto_294950 ) ) ( not ( = ?auto_294939 ?auto_294940 ) ) ( not ( = ?auto_294939 ?auto_294941 ) ) ( not ( = ?auto_294939 ?auto_294942 ) ) ( not ( = ?auto_294939 ?auto_294943 ) ) ( not ( = ?auto_294939 ?auto_294944 ) ) ( not ( = ?auto_294939 ?auto_294945 ) ) ( not ( = ?auto_294939 ?auto_294946 ) ) ( not ( = ?auto_294939 ?auto_294947 ) ) ( not ( = ?auto_294939 ?auto_294948 ) ) ( not ( = ?auto_294939 ?auto_294949 ) ) ( not ( = ?auto_294939 ?auto_294950 ) ) ( not ( = ?auto_294940 ?auto_294941 ) ) ( not ( = ?auto_294940 ?auto_294942 ) ) ( not ( = ?auto_294940 ?auto_294943 ) ) ( not ( = ?auto_294940 ?auto_294944 ) ) ( not ( = ?auto_294940 ?auto_294945 ) ) ( not ( = ?auto_294940 ?auto_294946 ) ) ( not ( = ?auto_294940 ?auto_294947 ) ) ( not ( = ?auto_294940 ?auto_294948 ) ) ( not ( = ?auto_294940 ?auto_294949 ) ) ( not ( = ?auto_294940 ?auto_294950 ) ) ( not ( = ?auto_294941 ?auto_294942 ) ) ( not ( = ?auto_294941 ?auto_294943 ) ) ( not ( = ?auto_294941 ?auto_294944 ) ) ( not ( = ?auto_294941 ?auto_294945 ) ) ( not ( = ?auto_294941 ?auto_294946 ) ) ( not ( = ?auto_294941 ?auto_294947 ) ) ( not ( = ?auto_294941 ?auto_294948 ) ) ( not ( = ?auto_294941 ?auto_294949 ) ) ( not ( = ?auto_294941 ?auto_294950 ) ) ( not ( = ?auto_294942 ?auto_294943 ) ) ( not ( = ?auto_294942 ?auto_294944 ) ) ( not ( = ?auto_294942 ?auto_294945 ) ) ( not ( = ?auto_294942 ?auto_294946 ) ) ( not ( = ?auto_294942 ?auto_294947 ) ) ( not ( = ?auto_294942 ?auto_294948 ) ) ( not ( = ?auto_294942 ?auto_294949 ) ) ( not ( = ?auto_294942 ?auto_294950 ) ) ( not ( = ?auto_294943 ?auto_294944 ) ) ( not ( = ?auto_294943 ?auto_294945 ) ) ( not ( = ?auto_294943 ?auto_294946 ) ) ( not ( = ?auto_294943 ?auto_294947 ) ) ( not ( = ?auto_294943 ?auto_294948 ) ) ( not ( = ?auto_294943 ?auto_294949 ) ) ( not ( = ?auto_294943 ?auto_294950 ) ) ( not ( = ?auto_294944 ?auto_294945 ) ) ( not ( = ?auto_294944 ?auto_294946 ) ) ( not ( = ?auto_294944 ?auto_294947 ) ) ( not ( = ?auto_294944 ?auto_294948 ) ) ( not ( = ?auto_294944 ?auto_294949 ) ) ( not ( = ?auto_294944 ?auto_294950 ) ) ( not ( = ?auto_294945 ?auto_294946 ) ) ( not ( = ?auto_294945 ?auto_294947 ) ) ( not ( = ?auto_294945 ?auto_294948 ) ) ( not ( = ?auto_294945 ?auto_294949 ) ) ( not ( = ?auto_294945 ?auto_294950 ) ) ( not ( = ?auto_294946 ?auto_294947 ) ) ( not ( = ?auto_294946 ?auto_294948 ) ) ( not ( = ?auto_294946 ?auto_294949 ) ) ( not ( = ?auto_294946 ?auto_294950 ) ) ( not ( = ?auto_294947 ?auto_294948 ) ) ( not ( = ?auto_294947 ?auto_294949 ) ) ( not ( = ?auto_294947 ?auto_294950 ) ) ( not ( = ?auto_294948 ?auto_294949 ) ) ( not ( = ?auto_294948 ?auto_294950 ) ) ( not ( = ?auto_294949 ?auto_294950 ) ) ( ON ?auto_294948 ?auto_294949 ) ( CLEAR ?auto_294946 ) ( ON ?auto_294947 ?auto_294948 ) ( CLEAR ?auto_294947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_294937 ?auto_294938 ?auto_294939 ?auto_294940 ?auto_294941 ?auto_294942 ?auto_294943 ?auto_294944 ?auto_294945 ?auto_294946 ?auto_294947 )
      ( MAKE-13PILE ?auto_294937 ?auto_294938 ?auto_294939 ?auto_294940 ?auto_294941 ?auto_294942 ?auto_294943 ?auto_294944 ?auto_294945 ?auto_294946 ?auto_294947 ?auto_294948 ?auto_294949 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_294991 - BLOCK
      ?auto_294992 - BLOCK
      ?auto_294993 - BLOCK
      ?auto_294994 - BLOCK
      ?auto_294995 - BLOCK
      ?auto_294996 - BLOCK
      ?auto_294997 - BLOCK
      ?auto_294998 - BLOCK
      ?auto_294999 - BLOCK
      ?auto_295000 - BLOCK
      ?auto_295001 - BLOCK
      ?auto_295002 - BLOCK
      ?auto_295003 - BLOCK
    )
    :vars
    (
      ?auto_295004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295003 ?auto_295004 ) ( ON-TABLE ?auto_294991 ) ( ON ?auto_294992 ?auto_294991 ) ( ON ?auto_294993 ?auto_294992 ) ( ON ?auto_294994 ?auto_294993 ) ( ON ?auto_294995 ?auto_294994 ) ( ON ?auto_294996 ?auto_294995 ) ( ON ?auto_294997 ?auto_294996 ) ( ON ?auto_294998 ?auto_294997 ) ( ON ?auto_294999 ?auto_294998 ) ( not ( = ?auto_294991 ?auto_294992 ) ) ( not ( = ?auto_294991 ?auto_294993 ) ) ( not ( = ?auto_294991 ?auto_294994 ) ) ( not ( = ?auto_294991 ?auto_294995 ) ) ( not ( = ?auto_294991 ?auto_294996 ) ) ( not ( = ?auto_294991 ?auto_294997 ) ) ( not ( = ?auto_294991 ?auto_294998 ) ) ( not ( = ?auto_294991 ?auto_294999 ) ) ( not ( = ?auto_294991 ?auto_295000 ) ) ( not ( = ?auto_294991 ?auto_295001 ) ) ( not ( = ?auto_294991 ?auto_295002 ) ) ( not ( = ?auto_294991 ?auto_295003 ) ) ( not ( = ?auto_294991 ?auto_295004 ) ) ( not ( = ?auto_294992 ?auto_294993 ) ) ( not ( = ?auto_294992 ?auto_294994 ) ) ( not ( = ?auto_294992 ?auto_294995 ) ) ( not ( = ?auto_294992 ?auto_294996 ) ) ( not ( = ?auto_294992 ?auto_294997 ) ) ( not ( = ?auto_294992 ?auto_294998 ) ) ( not ( = ?auto_294992 ?auto_294999 ) ) ( not ( = ?auto_294992 ?auto_295000 ) ) ( not ( = ?auto_294992 ?auto_295001 ) ) ( not ( = ?auto_294992 ?auto_295002 ) ) ( not ( = ?auto_294992 ?auto_295003 ) ) ( not ( = ?auto_294992 ?auto_295004 ) ) ( not ( = ?auto_294993 ?auto_294994 ) ) ( not ( = ?auto_294993 ?auto_294995 ) ) ( not ( = ?auto_294993 ?auto_294996 ) ) ( not ( = ?auto_294993 ?auto_294997 ) ) ( not ( = ?auto_294993 ?auto_294998 ) ) ( not ( = ?auto_294993 ?auto_294999 ) ) ( not ( = ?auto_294993 ?auto_295000 ) ) ( not ( = ?auto_294993 ?auto_295001 ) ) ( not ( = ?auto_294993 ?auto_295002 ) ) ( not ( = ?auto_294993 ?auto_295003 ) ) ( not ( = ?auto_294993 ?auto_295004 ) ) ( not ( = ?auto_294994 ?auto_294995 ) ) ( not ( = ?auto_294994 ?auto_294996 ) ) ( not ( = ?auto_294994 ?auto_294997 ) ) ( not ( = ?auto_294994 ?auto_294998 ) ) ( not ( = ?auto_294994 ?auto_294999 ) ) ( not ( = ?auto_294994 ?auto_295000 ) ) ( not ( = ?auto_294994 ?auto_295001 ) ) ( not ( = ?auto_294994 ?auto_295002 ) ) ( not ( = ?auto_294994 ?auto_295003 ) ) ( not ( = ?auto_294994 ?auto_295004 ) ) ( not ( = ?auto_294995 ?auto_294996 ) ) ( not ( = ?auto_294995 ?auto_294997 ) ) ( not ( = ?auto_294995 ?auto_294998 ) ) ( not ( = ?auto_294995 ?auto_294999 ) ) ( not ( = ?auto_294995 ?auto_295000 ) ) ( not ( = ?auto_294995 ?auto_295001 ) ) ( not ( = ?auto_294995 ?auto_295002 ) ) ( not ( = ?auto_294995 ?auto_295003 ) ) ( not ( = ?auto_294995 ?auto_295004 ) ) ( not ( = ?auto_294996 ?auto_294997 ) ) ( not ( = ?auto_294996 ?auto_294998 ) ) ( not ( = ?auto_294996 ?auto_294999 ) ) ( not ( = ?auto_294996 ?auto_295000 ) ) ( not ( = ?auto_294996 ?auto_295001 ) ) ( not ( = ?auto_294996 ?auto_295002 ) ) ( not ( = ?auto_294996 ?auto_295003 ) ) ( not ( = ?auto_294996 ?auto_295004 ) ) ( not ( = ?auto_294997 ?auto_294998 ) ) ( not ( = ?auto_294997 ?auto_294999 ) ) ( not ( = ?auto_294997 ?auto_295000 ) ) ( not ( = ?auto_294997 ?auto_295001 ) ) ( not ( = ?auto_294997 ?auto_295002 ) ) ( not ( = ?auto_294997 ?auto_295003 ) ) ( not ( = ?auto_294997 ?auto_295004 ) ) ( not ( = ?auto_294998 ?auto_294999 ) ) ( not ( = ?auto_294998 ?auto_295000 ) ) ( not ( = ?auto_294998 ?auto_295001 ) ) ( not ( = ?auto_294998 ?auto_295002 ) ) ( not ( = ?auto_294998 ?auto_295003 ) ) ( not ( = ?auto_294998 ?auto_295004 ) ) ( not ( = ?auto_294999 ?auto_295000 ) ) ( not ( = ?auto_294999 ?auto_295001 ) ) ( not ( = ?auto_294999 ?auto_295002 ) ) ( not ( = ?auto_294999 ?auto_295003 ) ) ( not ( = ?auto_294999 ?auto_295004 ) ) ( not ( = ?auto_295000 ?auto_295001 ) ) ( not ( = ?auto_295000 ?auto_295002 ) ) ( not ( = ?auto_295000 ?auto_295003 ) ) ( not ( = ?auto_295000 ?auto_295004 ) ) ( not ( = ?auto_295001 ?auto_295002 ) ) ( not ( = ?auto_295001 ?auto_295003 ) ) ( not ( = ?auto_295001 ?auto_295004 ) ) ( not ( = ?auto_295002 ?auto_295003 ) ) ( not ( = ?auto_295002 ?auto_295004 ) ) ( not ( = ?auto_295003 ?auto_295004 ) ) ( ON ?auto_295002 ?auto_295003 ) ( ON ?auto_295001 ?auto_295002 ) ( CLEAR ?auto_294999 ) ( ON ?auto_295000 ?auto_295001 ) ( CLEAR ?auto_295000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_294991 ?auto_294992 ?auto_294993 ?auto_294994 ?auto_294995 ?auto_294996 ?auto_294997 ?auto_294998 ?auto_294999 ?auto_295000 )
      ( MAKE-13PILE ?auto_294991 ?auto_294992 ?auto_294993 ?auto_294994 ?auto_294995 ?auto_294996 ?auto_294997 ?auto_294998 ?auto_294999 ?auto_295000 ?auto_295001 ?auto_295002 ?auto_295003 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295045 - BLOCK
      ?auto_295046 - BLOCK
      ?auto_295047 - BLOCK
      ?auto_295048 - BLOCK
      ?auto_295049 - BLOCK
      ?auto_295050 - BLOCK
      ?auto_295051 - BLOCK
      ?auto_295052 - BLOCK
      ?auto_295053 - BLOCK
      ?auto_295054 - BLOCK
      ?auto_295055 - BLOCK
      ?auto_295056 - BLOCK
      ?auto_295057 - BLOCK
    )
    :vars
    (
      ?auto_295058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295057 ?auto_295058 ) ( ON-TABLE ?auto_295045 ) ( ON ?auto_295046 ?auto_295045 ) ( ON ?auto_295047 ?auto_295046 ) ( ON ?auto_295048 ?auto_295047 ) ( ON ?auto_295049 ?auto_295048 ) ( ON ?auto_295050 ?auto_295049 ) ( ON ?auto_295051 ?auto_295050 ) ( ON ?auto_295052 ?auto_295051 ) ( not ( = ?auto_295045 ?auto_295046 ) ) ( not ( = ?auto_295045 ?auto_295047 ) ) ( not ( = ?auto_295045 ?auto_295048 ) ) ( not ( = ?auto_295045 ?auto_295049 ) ) ( not ( = ?auto_295045 ?auto_295050 ) ) ( not ( = ?auto_295045 ?auto_295051 ) ) ( not ( = ?auto_295045 ?auto_295052 ) ) ( not ( = ?auto_295045 ?auto_295053 ) ) ( not ( = ?auto_295045 ?auto_295054 ) ) ( not ( = ?auto_295045 ?auto_295055 ) ) ( not ( = ?auto_295045 ?auto_295056 ) ) ( not ( = ?auto_295045 ?auto_295057 ) ) ( not ( = ?auto_295045 ?auto_295058 ) ) ( not ( = ?auto_295046 ?auto_295047 ) ) ( not ( = ?auto_295046 ?auto_295048 ) ) ( not ( = ?auto_295046 ?auto_295049 ) ) ( not ( = ?auto_295046 ?auto_295050 ) ) ( not ( = ?auto_295046 ?auto_295051 ) ) ( not ( = ?auto_295046 ?auto_295052 ) ) ( not ( = ?auto_295046 ?auto_295053 ) ) ( not ( = ?auto_295046 ?auto_295054 ) ) ( not ( = ?auto_295046 ?auto_295055 ) ) ( not ( = ?auto_295046 ?auto_295056 ) ) ( not ( = ?auto_295046 ?auto_295057 ) ) ( not ( = ?auto_295046 ?auto_295058 ) ) ( not ( = ?auto_295047 ?auto_295048 ) ) ( not ( = ?auto_295047 ?auto_295049 ) ) ( not ( = ?auto_295047 ?auto_295050 ) ) ( not ( = ?auto_295047 ?auto_295051 ) ) ( not ( = ?auto_295047 ?auto_295052 ) ) ( not ( = ?auto_295047 ?auto_295053 ) ) ( not ( = ?auto_295047 ?auto_295054 ) ) ( not ( = ?auto_295047 ?auto_295055 ) ) ( not ( = ?auto_295047 ?auto_295056 ) ) ( not ( = ?auto_295047 ?auto_295057 ) ) ( not ( = ?auto_295047 ?auto_295058 ) ) ( not ( = ?auto_295048 ?auto_295049 ) ) ( not ( = ?auto_295048 ?auto_295050 ) ) ( not ( = ?auto_295048 ?auto_295051 ) ) ( not ( = ?auto_295048 ?auto_295052 ) ) ( not ( = ?auto_295048 ?auto_295053 ) ) ( not ( = ?auto_295048 ?auto_295054 ) ) ( not ( = ?auto_295048 ?auto_295055 ) ) ( not ( = ?auto_295048 ?auto_295056 ) ) ( not ( = ?auto_295048 ?auto_295057 ) ) ( not ( = ?auto_295048 ?auto_295058 ) ) ( not ( = ?auto_295049 ?auto_295050 ) ) ( not ( = ?auto_295049 ?auto_295051 ) ) ( not ( = ?auto_295049 ?auto_295052 ) ) ( not ( = ?auto_295049 ?auto_295053 ) ) ( not ( = ?auto_295049 ?auto_295054 ) ) ( not ( = ?auto_295049 ?auto_295055 ) ) ( not ( = ?auto_295049 ?auto_295056 ) ) ( not ( = ?auto_295049 ?auto_295057 ) ) ( not ( = ?auto_295049 ?auto_295058 ) ) ( not ( = ?auto_295050 ?auto_295051 ) ) ( not ( = ?auto_295050 ?auto_295052 ) ) ( not ( = ?auto_295050 ?auto_295053 ) ) ( not ( = ?auto_295050 ?auto_295054 ) ) ( not ( = ?auto_295050 ?auto_295055 ) ) ( not ( = ?auto_295050 ?auto_295056 ) ) ( not ( = ?auto_295050 ?auto_295057 ) ) ( not ( = ?auto_295050 ?auto_295058 ) ) ( not ( = ?auto_295051 ?auto_295052 ) ) ( not ( = ?auto_295051 ?auto_295053 ) ) ( not ( = ?auto_295051 ?auto_295054 ) ) ( not ( = ?auto_295051 ?auto_295055 ) ) ( not ( = ?auto_295051 ?auto_295056 ) ) ( not ( = ?auto_295051 ?auto_295057 ) ) ( not ( = ?auto_295051 ?auto_295058 ) ) ( not ( = ?auto_295052 ?auto_295053 ) ) ( not ( = ?auto_295052 ?auto_295054 ) ) ( not ( = ?auto_295052 ?auto_295055 ) ) ( not ( = ?auto_295052 ?auto_295056 ) ) ( not ( = ?auto_295052 ?auto_295057 ) ) ( not ( = ?auto_295052 ?auto_295058 ) ) ( not ( = ?auto_295053 ?auto_295054 ) ) ( not ( = ?auto_295053 ?auto_295055 ) ) ( not ( = ?auto_295053 ?auto_295056 ) ) ( not ( = ?auto_295053 ?auto_295057 ) ) ( not ( = ?auto_295053 ?auto_295058 ) ) ( not ( = ?auto_295054 ?auto_295055 ) ) ( not ( = ?auto_295054 ?auto_295056 ) ) ( not ( = ?auto_295054 ?auto_295057 ) ) ( not ( = ?auto_295054 ?auto_295058 ) ) ( not ( = ?auto_295055 ?auto_295056 ) ) ( not ( = ?auto_295055 ?auto_295057 ) ) ( not ( = ?auto_295055 ?auto_295058 ) ) ( not ( = ?auto_295056 ?auto_295057 ) ) ( not ( = ?auto_295056 ?auto_295058 ) ) ( not ( = ?auto_295057 ?auto_295058 ) ) ( ON ?auto_295056 ?auto_295057 ) ( ON ?auto_295055 ?auto_295056 ) ( ON ?auto_295054 ?auto_295055 ) ( CLEAR ?auto_295052 ) ( ON ?auto_295053 ?auto_295054 ) ( CLEAR ?auto_295053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_295045 ?auto_295046 ?auto_295047 ?auto_295048 ?auto_295049 ?auto_295050 ?auto_295051 ?auto_295052 ?auto_295053 )
      ( MAKE-13PILE ?auto_295045 ?auto_295046 ?auto_295047 ?auto_295048 ?auto_295049 ?auto_295050 ?auto_295051 ?auto_295052 ?auto_295053 ?auto_295054 ?auto_295055 ?auto_295056 ?auto_295057 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295099 - BLOCK
      ?auto_295100 - BLOCK
      ?auto_295101 - BLOCK
      ?auto_295102 - BLOCK
      ?auto_295103 - BLOCK
      ?auto_295104 - BLOCK
      ?auto_295105 - BLOCK
      ?auto_295106 - BLOCK
      ?auto_295107 - BLOCK
      ?auto_295108 - BLOCK
      ?auto_295109 - BLOCK
      ?auto_295110 - BLOCK
      ?auto_295111 - BLOCK
    )
    :vars
    (
      ?auto_295112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295111 ?auto_295112 ) ( ON-TABLE ?auto_295099 ) ( ON ?auto_295100 ?auto_295099 ) ( ON ?auto_295101 ?auto_295100 ) ( ON ?auto_295102 ?auto_295101 ) ( ON ?auto_295103 ?auto_295102 ) ( ON ?auto_295104 ?auto_295103 ) ( ON ?auto_295105 ?auto_295104 ) ( not ( = ?auto_295099 ?auto_295100 ) ) ( not ( = ?auto_295099 ?auto_295101 ) ) ( not ( = ?auto_295099 ?auto_295102 ) ) ( not ( = ?auto_295099 ?auto_295103 ) ) ( not ( = ?auto_295099 ?auto_295104 ) ) ( not ( = ?auto_295099 ?auto_295105 ) ) ( not ( = ?auto_295099 ?auto_295106 ) ) ( not ( = ?auto_295099 ?auto_295107 ) ) ( not ( = ?auto_295099 ?auto_295108 ) ) ( not ( = ?auto_295099 ?auto_295109 ) ) ( not ( = ?auto_295099 ?auto_295110 ) ) ( not ( = ?auto_295099 ?auto_295111 ) ) ( not ( = ?auto_295099 ?auto_295112 ) ) ( not ( = ?auto_295100 ?auto_295101 ) ) ( not ( = ?auto_295100 ?auto_295102 ) ) ( not ( = ?auto_295100 ?auto_295103 ) ) ( not ( = ?auto_295100 ?auto_295104 ) ) ( not ( = ?auto_295100 ?auto_295105 ) ) ( not ( = ?auto_295100 ?auto_295106 ) ) ( not ( = ?auto_295100 ?auto_295107 ) ) ( not ( = ?auto_295100 ?auto_295108 ) ) ( not ( = ?auto_295100 ?auto_295109 ) ) ( not ( = ?auto_295100 ?auto_295110 ) ) ( not ( = ?auto_295100 ?auto_295111 ) ) ( not ( = ?auto_295100 ?auto_295112 ) ) ( not ( = ?auto_295101 ?auto_295102 ) ) ( not ( = ?auto_295101 ?auto_295103 ) ) ( not ( = ?auto_295101 ?auto_295104 ) ) ( not ( = ?auto_295101 ?auto_295105 ) ) ( not ( = ?auto_295101 ?auto_295106 ) ) ( not ( = ?auto_295101 ?auto_295107 ) ) ( not ( = ?auto_295101 ?auto_295108 ) ) ( not ( = ?auto_295101 ?auto_295109 ) ) ( not ( = ?auto_295101 ?auto_295110 ) ) ( not ( = ?auto_295101 ?auto_295111 ) ) ( not ( = ?auto_295101 ?auto_295112 ) ) ( not ( = ?auto_295102 ?auto_295103 ) ) ( not ( = ?auto_295102 ?auto_295104 ) ) ( not ( = ?auto_295102 ?auto_295105 ) ) ( not ( = ?auto_295102 ?auto_295106 ) ) ( not ( = ?auto_295102 ?auto_295107 ) ) ( not ( = ?auto_295102 ?auto_295108 ) ) ( not ( = ?auto_295102 ?auto_295109 ) ) ( not ( = ?auto_295102 ?auto_295110 ) ) ( not ( = ?auto_295102 ?auto_295111 ) ) ( not ( = ?auto_295102 ?auto_295112 ) ) ( not ( = ?auto_295103 ?auto_295104 ) ) ( not ( = ?auto_295103 ?auto_295105 ) ) ( not ( = ?auto_295103 ?auto_295106 ) ) ( not ( = ?auto_295103 ?auto_295107 ) ) ( not ( = ?auto_295103 ?auto_295108 ) ) ( not ( = ?auto_295103 ?auto_295109 ) ) ( not ( = ?auto_295103 ?auto_295110 ) ) ( not ( = ?auto_295103 ?auto_295111 ) ) ( not ( = ?auto_295103 ?auto_295112 ) ) ( not ( = ?auto_295104 ?auto_295105 ) ) ( not ( = ?auto_295104 ?auto_295106 ) ) ( not ( = ?auto_295104 ?auto_295107 ) ) ( not ( = ?auto_295104 ?auto_295108 ) ) ( not ( = ?auto_295104 ?auto_295109 ) ) ( not ( = ?auto_295104 ?auto_295110 ) ) ( not ( = ?auto_295104 ?auto_295111 ) ) ( not ( = ?auto_295104 ?auto_295112 ) ) ( not ( = ?auto_295105 ?auto_295106 ) ) ( not ( = ?auto_295105 ?auto_295107 ) ) ( not ( = ?auto_295105 ?auto_295108 ) ) ( not ( = ?auto_295105 ?auto_295109 ) ) ( not ( = ?auto_295105 ?auto_295110 ) ) ( not ( = ?auto_295105 ?auto_295111 ) ) ( not ( = ?auto_295105 ?auto_295112 ) ) ( not ( = ?auto_295106 ?auto_295107 ) ) ( not ( = ?auto_295106 ?auto_295108 ) ) ( not ( = ?auto_295106 ?auto_295109 ) ) ( not ( = ?auto_295106 ?auto_295110 ) ) ( not ( = ?auto_295106 ?auto_295111 ) ) ( not ( = ?auto_295106 ?auto_295112 ) ) ( not ( = ?auto_295107 ?auto_295108 ) ) ( not ( = ?auto_295107 ?auto_295109 ) ) ( not ( = ?auto_295107 ?auto_295110 ) ) ( not ( = ?auto_295107 ?auto_295111 ) ) ( not ( = ?auto_295107 ?auto_295112 ) ) ( not ( = ?auto_295108 ?auto_295109 ) ) ( not ( = ?auto_295108 ?auto_295110 ) ) ( not ( = ?auto_295108 ?auto_295111 ) ) ( not ( = ?auto_295108 ?auto_295112 ) ) ( not ( = ?auto_295109 ?auto_295110 ) ) ( not ( = ?auto_295109 ?auto_295111 ) ) ( not ( = ?auto_295109 ?auto_295112 ) ) ( not ( = ?auto_295110 ?auto_295111 ) ) ( not ( = ?auto_295110 ?auto_295112 ) ) ( not ( = ?auto_295111 ?auto_295112 ) ) ( ON ?auto_295110 ?auto_295111 ) ( ON ?auto_295109 ?auto_295110 ) ( ON ?auto_295108 ?auto_295109 ) ( ON ?auto_295107 ?auto_295108 ) ( CLEAR ?auto_295105 ) ( ON ?auto_295106 ?auto_295107 ) ( CLEAR ?auto_295106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_295099 ?auto_295100 ?auto_295101 ?auto_295102 ?auto_295103 ?auto_295104 ?auto_295105 ?auto_295106 )
      ( MAKE-13PILE ?auto_295099 ?auto_295100 ?auto_295101 ?auto_295102 ?auto_295103 ?auto_295104 ?auto_295105 ?auto_295106 ?auto_295107 ?auto_295108 ?auto_295109 ?auto_295110 ?auto_295111 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295153 - BLOCK
      ?auto_295154 - BLOCK
      ?auto_295155 - BLOCK
      ?auto_295156 - BLOCK
      ?auto_295157 - BLOCK
      ?auto_295158 - BLOCK
      ?auto_295159 - BLOCK
      ?auto_295160 - BLOCK
      ?auto_295161 - BLOCK
      ?auto_295162 - BLOCK
      ?auto_295163 - BLOCK
      ?auto_295164 - BLOCK
      ?auto_295165 - BLOCK
    )
    :vars
    (
      ?auto_295166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295165 ?auto_295166 ) ( ON-TABLE ?auto_295153 ) ( ON ?auto_295154 ?auto_295153 ) ( ON ?auto_295155 ?auto_295154 ) ( ON ?auto_295156 ?auto_295155 ) ( ON ?auto_295157 ?auto_295156 ) ( ON ?auto_295158 ?auto_295157 ) ( not ( = ?auto_295153 ?auto_295154 ) ) ( not ( = ?auto_295153 ?auto_295155 ) ) ( not ( = ?auto_295153 ?auto_295156 ) ) ( not ( = ?auto_295153 ?auto_295157 ) ) ( not ( = ?auto_295153 ?auto_295158 ) ) ( not ( = ?auto_295153 ?auto_295159 ) ) ( not ( = ?auto_295153 ?auto_295160 ) ) ( not ( = ?auto_295153 ?auto_295161 ) ) ( not ( = ?auto_295153 ?auto_295162 ) ) ( not ( = ?auto_295153 ?auto_295163 ) ) ( not ( = ?auto_295153 ?auto_295164 ) ) ( not ( = ?auto_295153 ?auto_295165 ) ) ( not ( = ?auto_295153 ?auto_295166 ) ) ( not ( = ?auto_295154 ?auto_295155 ) ) ( not ( = ?auto_295154 ?auto_295156 ) ) ( not ( = ?auto_295154 ?auto_295157 ) ) ( not ( = ?auto_295154 ?auto_295158 ) ) ( not ( = ?auto_295154 ?auto_295159 ) ) ( not ( = ?auto_295154 ?auto_295160 ) ) ( not ( = ?auto_295154 ?auto_295161 ) ) ( not ( = ?auto_295154 ?auto_295162 ) ) ( not ( = ?auto_295154 ?auto_295163 ) ) ( not ( = ?auto_295154 ?auto_295164 ) ) ( not ( = ?auto_295154 ?auto_295165 ) ) ( not ( = ?auto_295154 ?auto_295166 ) ) ( not ( = ?auto_295155 ?auto_295156 ) ) ( not ( = ?auto_295155 ?auto_295157 ) ) ( not ( = ?auto_295155 ?auto_295158 ) ) ( not ( = ?auto_295155 ?auto_295159 ) ) ( not ( = ?auto_295155 ?auto_295160 ) ) ( not ( = ?auto_295155 ?auto_295161 ) ) ( not ( = ?auto_295155 ?auto_295162 ) ) ( not ( = ?auto_295155 ?auto_295163 ) ) ( not ( = ?auto_295155 ?auto_295164 ) ) ( not ( = ?auto_295155 ?auto_295165 ) ) ( not ( = ?auto_295155 ?auto_295166 ) ) ( not ( = ?auto_295156 ?auto_295157 ) ) ( not ( = ?auto_295156 ?auto_295158 ) ) ( not ( = ?auto_295156 ?auto_295159 ) ) ( not ( = ?auto_295156 ?auto_295160 ) ) ( not ( = ?auto_295156 ?auto_295161 ) ) ( not ( = ?auto_295156 ?auto_295162 ) ) ( not ( = ?auto_295156 ?auto_295163 ) ) ( not ( = ?auto_295156 ?auto_295164 ) ) ( not ( = ?auto_295156 ?auto_295165 ) ) ( not ( = ?auto_295156 ?auto_295166 ) ) ( not ( = ?auto_295157 ?auto_295158 ) ) ( not ( = ?auto_295157 ?auto_295159 ) ) ( not ( = ?auto_295157 ?auto_295160 ) ) ( not ( = ?auto_295157 ?auto_295161 ) ) ( not ( = ?auto_295157 ?auto_295162 ) ) ( not ( = ?auto_295157 ?auto_295163 ) ) ( not ( = ?auto_295157 ?auto_295164 ) ) ( not ( = ?auto_295157 ?auto_295165 ) ) ( not ( = ?auto_295157 ?auto_295166 ) ) ( not ( = ?auto_295158 ?auto_295159 ) ) ( not ( = ?auto_295158 ?auto_295160 ) ) ( not ( = ?auto_295158 ?auto_295161 ) ) ( not ( = ?auto_295158 ?auto_295162 ) ) ( not ( = ?auto_295158 ?auto_295163 ) ) ( not ( = ?auto_295158 ?auto_295164 ) ) ( not ( = ?auto_295158 ?auto_295165 ) ) ( not ( = ?auto_295158 ?auto_295166 ) ) ( not ( = ?auto_295159 ?auto_295160 ) ) ( not ( = ?auto_295159 ?auto_295161 ) ) ( not ( = ?auto_295159 ?auto_295162 ) ) ( not ( = ?auto_295159 ?auto_295163 ) ) ( not ( = ?auto_295159 ?auto_295164 ) ) ( not ( = ?auto_295159 ?auto_295165 ) ) ( not ( = ?auto_295159 ?auto_295166 ) ) ( not ( = ?auto_295160 ?auto_295161 ) ) ( not ( = ?auto_295160 ?auto_295162 ) ) ( not ( = ?auto_295160 ?auto_295163 ) ) ( not ( = ?auto_295160 ?auto_295164 ) ) ( not ( = ?auto_295160 ?auto_295165 ) ) ( not ( = ?auto_295160 ?auto_295166 ) ) ( not ( = ?auto_295161 ?auto_295162 ) ) ( not ( = ?auto_295161 ?auto_295163 ) ) ( not ( = ?auto_295161 ?auto_295164 ) ) ( not ( = ?auto_295161 ?auto_295165 ) ) ( not ( = ?auto_295161 ?auto_295166 ) ) ( not ( = ?auto_295162 ?auto_295163 ) ) ( not ( = ?auto_295162 ?auto_295164 ) ) ( not ( = ?auto_295162 ?auto_295165 ) ) ( not ( = ?auto_295162 ?auto_295166 ) ) ( not ( = ?auto_295163 ?auto_295164 ) ) ( not ( = ?auto_295163 ?auto_295165 ) ) ( not ( = ?auto_295163 ?auto_295166 ) ) ( not ( = ?auto_295164 ?auto_295165 ) ) ( not ( = ?auto_295164 ?auto_295166 ) ) ( not ( = ?auto_295165 ?auto_295166 ) ) ( ON ?auto_295164 ?auto_295165 ) ( ON ?auto_295163 ?auto_295164 ) ( ON ?auto_295162 ?auto_295163 ) ( ON ?auto_295161 ?auto_295162 ) ( ON ?auto_295160 ?auto_295161 ) ( CLEAR ?auto_295158 ) ( ON ?auto_295159 ?auto_295160 ) ( CLEAR ?auto_295159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_295153 ?auto_295154 ?auto_295155 ?auto_295156 ?auto_295157 ?auto_295158 ?auto_295159 )
      ( MAKE-13PILE ?auto_295153 ?auto_295154 ?auto_295155 ?auto_295156 ?auto_295157 ?auto_295158 ?auto_295159 ?auto_295160 ?auto_295161 ?auto_295162 ?auto_295163 ?auto_295164 ?auto_295165 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295207 - BLOCK
      ?auto_295208 - BLOCK
      ?auto_295209 - BLOCK
      ?auto_295210 - BLOCK
      ?auto_295211 - BLOCK
      ?auto_295212 - BLOCK
      ?auto_295213 - BLOCK
      ?auto_295214 - BLOCK
      ?auto_295215 - BLOCK
      ?auto_295216 - BLOCK
      ?auto_295217 - BLOCK
      ?auto_295218 - BLOCK
      ?auto_295219 - BLOCK
    )
    :vars
    (
      ?auto_295220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295219 ?auto_295220 ) ( ON-TABLE ?auto_295207 ) ( ON ?auto_295208 ?auto_295207 ) ( ON ?auto_295209 ?auto_295208 ) ( ON ?auto_295210 ?auto_295209 ) ( ON ?auto_295211 ?auto_295210 ) ( not ( = ?auto_295207 ?auto_295208 ) ) ( not ( = ?auto_295207 ?auto_295209 ) ) ( not ( = ?auto_295207 ?auto_295210 ) ) ( not ( = ?auto_295207 ?auto_295211 ) ) ( not ( = ?auto_295207 ?auto_295212 ) ) ( not ( = ?auto_295207 ?auto_295213 ) ) ( not ( = ?auto_295207 ?auto_295214 ) ) ( not ( = ?auto_295207 ?auto_295215 ) ) ( not ( = ?auto_295207 ?auto_295216 ) ) ( not ( = ?auto_295207 ?auto_295217 ) ) ( not ( = ?auto_295207 ?auto_295218 ) ) ( not ( = ?auto_295207 ?auto_295219 ) ) ( not ( = ?auto_295207 ?auto_295220 ) ) ( not ( = ?auto_295208 ?auto_295209 ) ) ( not ( = ?auto_295208 ?auto_295210 ) ) ( not ( = ?auto_295208 ?auto_295211 ) ) ( not ( = ?auto_295208 ?auto_295212 ) ) ( not ( = ?auto_295208 ?auto_295213 ) ) ( not ( = ?auto_295208 ?auto_295214 ) ) ( not ( = ?auto_295208 ?auto_295215 ) ) ( not ( = ?auto_295208 ?auto_295216 ) ) ( not ( = ?auto_295208 ?auto_295217 ) ) ( not ( = ?auto_295208 ?auto_295218 ) ) ( not ( = ?auto_295208 ?auto_295219 ) ) ( not ( = ?auto_295208 ?auto_295220 ) ) ( not ( = ?auto_295209 ?auto_295210 ) ) ( not ( = ?auto_295209 ?auto_295211 ) ) ( not ( = ?auto_295209 ?auto_295212 ) ) ( not ( = ?auto_295209 ?auto_295213 ) ) ( not ( = ?auto_295209 ?auto_295214 ) ) ( not ( = ?auto_295209 ?auto_295215 ) ) ( not ( = ?auto_295209 ?auto_295216 ) ) ( not ( = ?auto_295209 ?auto_295217 ) ) ( not ( = ?auto_295209 ?auto_295218 ) ) ( not ( = ?auto_295209 ?auto_295219 ) ) ( not ( = ?auto_295209 ?auto_295220 ) ) ( not ( = ?auto_295210 ?auto_295211 ) ) ( not ( = ?auto_295210 ?auto_295212 ) ) ( not ( = ?auto_295210 ?auto_295213 ) ) ( not ( = ?auto_295210 ?auto_295214 ) ) ( not ( = ?auto_295210 ?auto_295215 ) ) ( not ( = ?auto_295210 ?auto_295216 ) ) ( not ( = ?auto_295210 ?auto_295217 ) ) ( not ( = ?auto_295210 ?auto_295218 ) ) ( not ( = ?auto_295210 ?auto_295219 ) ) ( not ( = ?auto_295210 ?auto_295220 ) ) ( not ( = ?auto_295211 ?auto_295212 ) ) ( not ( = ?auto_295211 ?auto_295213 ) ) ( not ( = ?auto_295211 ?auto_295214 ) ) ( not ( = ?auto_295211 ?auto_295215 ) ) ( not ( = ?auto_295211 ?auto_295216 ) ) ( not ( = ?auto_295211 ?auto_295217 ) ) ( not ( = ?auto_295211 ?auto_295218 ) ) ( not ( = ?auto_295211 ?auto_295219 ) ) ( not ( = ?auto_295211 ?auto_295220 ) ) ( not ( = ?auto_295212 ?auto_295213 ) ) ( not ( = ?auto_295212 ?auto_295214 ) ) ( not ( = ?auto_295212 ?auto_295215 ) ) ( not ( = ?auto_295212 ?auto_295216 ) ) ( not ( = ?auto_295212 ?auto_295217 ) ) ( not ( = ?auto_295212 ?auto_295218 ) ) ( not ( = ?auto_295212 ?auto_295219 ) ) ( not ( = ?auto_295212 ?auto_295220 ) ) ( not ( = ?auto_295213 ?auto_295214 ) ) ( not ( = ?auto_295213 ?auto_295215 ) ) ( not ( = ?auto_295213 ?auto_295216 ) ) ( not ( = ?auto_295213 ?auto_295217 ) ) ( not ( = ?auto_295213 ?auto_295218 ) ) ( not ( = ?auto_295213 ?auto_295219 ) ) ( not ( = ?auto_295213 ?auto_295220 ) ) ( not ( = ?auto_295214 ?auto_295215 ) ) ( not ( = ?auto_295214 ?auto_295216 ) ) ( not ( = ?auto_295214 ?auto_295217 ) ) ( not ( = ?auto_295214 ?auto_295218 ) ) ( not ( = ?auto_295214 ?auto_295219 ) ) ( not ( = ?auto_295214 ?auto_295220 ) ) ( not ( = ?auto_295215 ?auto_295216 ) ) ( not ( = ?auto_295215 ?auto_295217 ) ) ( not ( = ?auto_295215 ?auto_295218 ) ) ( not ( = ?auto_295215 ?auto_295219 ) ) ( not ( = ?auto_295215 ?auto_295220 ) ) ( not ( = ?auto_295216 ?auto_295217 ) ) ( not ( = ?auto_295216 ?auto_295218 ) ) ( not ( = ?auto_295216 ?auto_295219 ) ) ( not ( = ?auto_295216 ?auto_295220 ) ) ( not ( = ?auto_295217 ?auto_295218 ) ) ( not ( = ?auto_295217 ?auto_295219 ) ) ( not ( = ?auto_295217 ?auto_295220 ) ) ( not ( = ?auto_295218 ?auto_295219 ) ) ( not ( = ?auto_295218 ?auto_295220 ) ) ( not ( = ?auto_295219 ?auto_295220 ) ) ( ON ?auto_295218 ?auto_295219 ) ( ON ?auto_295217 ?auto_295218 ) ( ON ?auto_295216 ?auto_295217 ) ( ON ?auto_295215 ?auto_295216 ) ( ON ?auto_295214 ?auto_295215 ) ( ON ?auto_295213 ?auto_295214 ) ( CLEAR ?auto_295211 ) ( ON ?auto_295212 ?auto_295213 ) ( CLEAR ?auto_295212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_295207 ?auto_295208 ?auto_295209 ?auto_295210 ?auto_295211 ?auto_295212 )
      ( MAKE-13PILE ?auto_295207 ?auto_295208 ?auto_295209 ?auto_295210 ?auto_295211 ?auto_295212 ?auto_295213 ?auto_295214 ?auto_295215 ?auto_295216 ?auto_295217 ?auto_295218 ?auto_295219 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295261 - BLOCK
      ?auto_295262 - BLOCK
      ?auto_295263 - BLOCK
      ?auto_295264 - BLOCK
      ?auto_295265 - BLOCK
      ?auto_295266 - BLOCK
      ?auto_295267 - BLOCK
      ?auto_295268 - BLOCK
      ?auto_295269 - BLOCK
      ?auto_295270 - BLOCK
      ?auto_295271 - BLOCK
      ?auto_295272 - BLOCK
      ?auto_295273 - BLOCK
    )
    :vars
    (
      ?auto_295274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295273 ?auto_295274 ) ( ON-TABLE ?auto_295261 ) ( ON ?auto_295262 ?auto_295261 ) ( ON ?auto_295263 ?auto_295262 ) ( ON ?auto_295264 ?auto_295263 ) ( not ( = ?auto_295261 ?auto_295262 ) ) ( not ( = ?auto_295261 ?auto_295263 ) ) ( not ( = ?auto_295261 ?auto_295264 ) ) ( not ( = ?auto_295261 ?auto_295265 ) ) ( not ( = ?auto_295261 ?auto_295266 ) ) ( not ( = ?auto_295261 ?auto_295267 ) ) ( not ( = ?auto_295261 ?auto_295268 ) ) ( not ( = ?auto_295261 ?auto_295269 ) ) ( not ( = ?auto_295261 ?auto_295270 ) ) ( not ( = ?auto_295261 ?auto_295271 ) ) ( not ( = ?auto_295261 ?auto_295272 ) ) ( not ( = ?auto_295261 ?auto_295273 ) ) ( not ( = ?auto_295261 ?auto_295274 ) ) ( not ( = ?auto_295262 ?auto_295263 ) ) ( not ( = ?auto_295262 ?auto_295264 ) ) ( not ( = ?auto_295262 ?auto_295265 ) ) ( not ( = ?auto_295262 ?auto_295266 ) ) ( not ( = ?auto_295262 ?auto_295267 ) ) ( not ( = ?auto_295262 ?auto_295268 ) ) ( not ( = ?auto_295262 ?auto_295269 ) ) ( not ( = ?auto_295262 ?auto_295270 ) ) ( not ( = ?auto_295262 ?auto_295271 ) ) ( not ( = ?auto_295262 ?auto_295272 ) ) ( not ( = ?auto_295262 ?auto_295273 ) ) ( not ( = ?auto_295262 ?auto_295274 ) ) ( not ( = ?auto_295263 ?auto_295264 ) ) ( not ( = ?auto_295263 ?auto_295265 ) ) ( not ( = ?auto_295263 ?auto_295266 ) ) ( not ( = ?auto_295263 ?auto_295267 ) ) ( not ( = ?auto_295263 ?auto_295268 ) ) ( not ( = ?auto_295263 ?auto_295269 ) ) ( not ( = ?auto_295263 ?auto_295270 ) ) ( not ( = ?auto_295263 ?auto_295271 ) ) ( not ( = ?auto_295263 ?auto_295272 ) ) ( not ( = ?auto_295263 ?auto_295273 ) ) ( not ( = ?auto_295263 ?auto_295274 ) ) ( not ( = ?auto_295264 ?auto_295265 ) ) ( not ( = ?auto_295264 ?auto_295266 ) ) ( not ( = ?auto_295264 ?auto_295267 ) ) ( not ( = ?auto_295264 ?auto_295268 ) ) ( not ( = ?auto_295264 ?auto_295269 ) ) ( not ( = ?auto_295264 ?auto_295270 ) ) ( not ( = ?auto_295264 ?auto_295271 ) ) ( not ( = ?auto_295264 ?auto_295272 ) ) ( not ( = ?auto_295264 ?auto_295273 ) ) ( not ( = ?auto_295264 ?auto_295274 ) ) ( not ( = ?auto_295265 ?auto_295266 ) ) ( not ( = ?auto_295265 ?auto_295267 ) ) ( not ( = ?auto_295265 ?auto_295268 ) ) ( not ( = ?auto_295265 ?auto_295269 ) ) ( not ( = ?auto_295265 ?auto_295270 ) ) ( not ( = ?auto_295265 ?auto_295271 ) ) ( not ( = ?auto_295265 ?auto_295272 ) ) ( not ( = ?auto_295265 ?auto_295273 ) ) ( not ( = ?auto_295265 ?auto_295274 ) ) ( not ( = ?auto_295266 ?auto_295267 ) ) ( not ( = ?auto_295266 ?auto_295268 ) ) ( not ( = ?auto_295266 ?auto_295269 ) ) ( not ( = ?auto_295266 ?auto_295270 ) ) ( not ( = ?auto_295266 ?auto_295271 ) ) ( not ( = ?auto_295266 ?auto_295272 ) ) ( not ( = ?auto_295266 ?auto_295273 ) ) ( not ( = ?auto_295266 ?auto_295274 ) ) ( not ( = ?auto_295267 ?auto_295268 ) ) ( not ( = ?auto_295267 ?auto_295269 ) ) ( not ( = ?auto_295267 ?auto_295270 ) ) ( not ( = ?auto_295267 ?auto_295271 ) ) ( not ( = ?auto_295267 ?auto_295272 ) ) ( not ( = ?auto_295267 ?auto_295273 ) ) ( not ( = ?auto_295267 ?auto_295274 ) ) ( not ( = ?auto_295268 ?auto_295269 ) ) ( not ( = ?auto_295268 ?auto_295270 ) ) ( not ( = ?auto_295268 ?auto_295271 ) ) ( not ( = ?auto_295268 ?auto_295272 ) ) ( not ( = ?auto_295268 ?auto_295273 ) ) ( not ( = ?auto_295268 ?auto_295274 ) ) ( not ( = ?auto_295269 ?auto_295270 ) ) ( not ( = ?auto_295269 ?auto_295271 ) ) ( not ( = ?auto_295269 ?auto_295272 ) ) ( not ( = ?auto_295269 ?auto_295273 ) ) ( not ( = ?auto_295269 ?auto_295274 ) ) ( not ( = ?auto_295270 ?auto_295271 ) ) ( not ( = ?auto_295270 ?auto_295272 ) ) ( not ( = ?auto_295270 ?auto_295273 ) ) ( not ( = ?auto_295270 ?auto_295274 ) ) ( not ( = ?auto_295271 ?auto_295272 ) ) ( not ( = ?auto_295271 ?auto_295273 ) ) ( not ( = ?auto_295271 ?auto_295274 ) ) ( not ( = ?auto_295272 ?auto_295273 ) ) ( not ( = ?auto_295272 ?auto_295274 ) ) ( not ( = ?auto_295273 ?auto_295274 ) ) ( ON ?auto_295272 ?auto_295273 ) ( ON ?auto_295271 ?auto_295272 ) ( ON ?auto_295270 ?auto_295271 ) ( ON ?auto_295269 ?auto_295270 ) ( ON ?auto_295268 ?auto_295269 ) ( ON ?auto_295267 ?auto_295268 ) ( ON ?auto_295266 ?auto_295267 ) ( CLEAR ?auto_295264 ) ( ON ?auto_295265 ?auto_295266 ) ( CLEAR ?auto_295265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_295261 ?auto_295262 ?auto_295263 ?auto_295264 ?auto_295265 )
      ( MAKE-13PILE ?auto_295261 ?auto_295262 ?auto_295263 ?auto_295264 ?auto_295265 ?auto_295266 ?auto_295267 ?auto_295268 ?auto_295269 ?auto_295270 ?auto_295271 ?auto_295272 ?auto_295273 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295315 - BLOCK
      ?auto_295316 - BLOCK
      ?auto_295317 - BLOCK
      ?auto_295318 - BLOCK
      ?auto_295319 - BLOCK
      ?auto_295320 - BLOCK
      ?auto_295321 - BLOCK
      ?auto_295322 - BLOCK
      ?auto_295323 - BLOCK
      ?auto_295324 - BLOCK
      ?auto_295325 - BLOCK
      ?auto_295326 - BLOCK
      ?auto_295327 - BLOCK
    )
    :vars
    (
      ?auto_295328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295327 ?auto_295328 ) ( ON-TABLE ?auto_295315 ) ( ON ?auto_295316 ?auto_295315 ) ( ON ?auto_295317 ?auto_295316 ) ( not ( = ?auto_295315 ?auto_295316 ) ) ( not ( = ?auto_295315 ?auto_295317 ) ) ( not ( = ?auto_295315 ?auto_295318 ) ) ( not ( = ?auto_295315 ?auto_295319 ) ) ( not ( = ?auto_295315 ?auto_295320 ) ) ( not ( = ?auto_295315 ?auto_295321 ) ) ( not ( = ?auto_295315 ?auto_295322 ) ) ( not ( = ?auto_295315 ?auto_295323 ) ) ( not ( = ?auto_295315 ?auto_295324 ) ) ( not ( = ?auto_295315 ?auto_295325 ) ) ( not ( = ?auto_295315 ?auto_295326 ) ) ( not ( = ?auto_295315 ?auto_295327 ) ) ( not ( = ?auto_295315 ?auto_295328 ) ) ( not ( = ?auto_295316 ?auto_295317 ) ) ( not ( = ?auto_295316 ?auto_295318 ) ) ( not ( = ?auto_295316 ?auto_295319 ) ) ( not ( = ?auto_295316 ?auto_295320 ) ) ( not ( = ?auto_295316 ?auto_295321 ) ) ( not ( = ?auto_295316 ?auto_295322 ) ) ( not ( = ?auto_295316 ?auto_295323 ) ) ( not ( = ?auto_295316 ?auto_295324 ) ) ( not ( = ?auto_295316 ?auto_295325 ) ) ( not ( = ?auto_295316 ?auto_295326 ) ) ( not ( = ?auto_295316 ?auto_295327 ) ) ( not ( = ?auto_295316 ?auto_295328 ) ) ( not ( = ?auto_295317 ?auto_295318 ) ) ( not ( = ?auto_295317 ?auto_295319 ) ) ( not ( = ?auto_295317 ?auto_295320 ) ) ( not ( = ?auto_295317 ?auto_295321 ) ) ( not ( = ?auto_295317 ?auto_295322 ) ) ( not ( = ?auto_295317 ?auto_295323 ) ) ( not ( = ?auto_295317 ?auto_295324 ) ) ( not ( = ?auto_295317 ?auto_295325 ) ) ( not ( = ?auto_295317 ?auto_295326 ) ) ( not ( = ?auto_295317 ?auto_295327 ) ) ( not ( = ?auto_295317 ?auto_295328 ) ) ( not ( = ?auto_295318 ?auto_295319 ) ) ( not ( = ?auto_295318 ?auto_295320 ) ) ( not ( = ?auto_295318 ?auto_295321 ) ) ( not ( = ?auto_295318 ?auto_295322 ) ) ( not ( = ?auto_295318 ?auto_295323 ) ) ( not ( = ?auto_295318 ?auto_295324 ) ) ( not ( = ?auto_295318 ?auto_295325 ) ) ( not ( = ?auto_295318 ?auto_295326 ) ) ( not ( = ?auto_295318 ?auto_295327 ) ) ( not ( = ?auto_295318 ?auto_295328 ) ) ( not ( = ?auto_295319 ?auto_295320 ) ) ( not ( = ?auto_295319 ?auto_295321 ) ) ( not ( = ?auto_295319 ?auto_295322 ) ) ( not ( = ?auto_295319 ?auto_295323 ) ) ( not ( = ?auto_295319 ?auto_295324 ) ) ( not ( = ?auto_295319 ?auto_295325 ) ) ( not ( = ?auto_295319 ?auto_295326 ) ) ( not ( = ?auto_295319 ?auto_295327 ) ) ( not ( = ?auto_295319 ?auto_295328 ) ) ( not ( = ?auto_295320 ?auto_295321 ) ) ( not ( = ?auto_295320 ?auto_295322 ) ) ( not ( = ?auto_295320 ?auto_295323 ) ) ( not ( = ?auto_295320 ?auto_295324 ) ) ( not ( = ?auto_295320 ?auto_295325 ) ) ( not ( = ?auto_295320 ?auto_295326 ) ) ( not ( = ?auto_295320 ?auto_295327 ) ) ( not ( = ?auto_295320 ?auto_295328 ) ) ( not ( = ?auto_295321 ?auto_295322 ) ) ( not ( = ?auto_295321 ?auto_295323 ) ) ( not ( = ?auto_295321 ?auto_295324 ) ) ( not ( = ?auto_295321 ?auto_295325 ) ) ( not ( = ?auto_295321 ?auto_295326 ) ) ( not ( = ?auto_295321 ?auto_295327 ) ) ( not ( = ?auto_295321 ?auto_295328 ) ) ( not ( = ?auto_295322 ?auto_295323 ) ) ( not ( = ?auto_295322 ?auto_295324 ) ) ( not ( = ?auto_295322 ?auto_295325 ) ) ( not ( = ?auto_295322 ?auto_295326 ) ) ( not ( = ?auto_295322 ?auto_295327 ) ) ( not ( = ?auto_295322 ?auto_295328 ) ) ( not ( = ?auto_295323 ?auto_295324 ) ) ( not ( = ?auto_295323 ?auto_295325 ) ) ( not ( = ?auto_295323 ?auto_295326 ) ) ( not ( = ?auto_295323 ?auto_295327 ) ) ( not ( = ?auto_295323 ?auto_295328 ) ) ( not ( = ?auto_295324 ?auto_295325 ) ) ( not ( = ?auto_295324 ?auto_295326 ) ) ( not ( = ?auto_295324 ?auto_295327 ) ) ( not ( = ?auto_295324 ?auto_295328 ) ) ( not ( = ?auto_295325 ?auto_295326 ) ) ( not ( = ?auto_295325 ?auto_295327 ) ) ( not ( = ?auto_295325 ?auto_295328 ) ) ( not ( = ?auto_295326 ?auto_295327 ) ) ( not ( = ?auto_295326 ?auto_295328 ) ) ( not ( = ?auto_295327 ?auto_295328 ) ) ( ON ?auto_295326 ?auto_295327 ) ( ON ?auto_295325 ?auto_295326 ) ( ON ?auto_295324 ?auto_295325 ) ( ON ?auto_295323 ?auto_295324 ) ( ON ?auto_295322 ?auto_295323 ) ( ON ?auto_295321 ?auto_295322 ) ( ON ?auto_295320 ?auto_295321 ) ( ON ?auto_295319 ?auto_295320 ) ( CLEAR ?auto_295317 ) ( ON ?auto_295318 ?auto_295319 ) ( CLEAR ?auto_295318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_295315 ?auto_295316 ?auto_295317 ?auto_295318 )
      ( MAKE-13PILE ?auto_295315 ?auto_295316 ?auto_295317 ?auto_295318 ?auto_295319 ?auto_295320 ?auto_295321 ?auto_295322 ?auto_295323 ?auto_295324 ?auto_295325 ?auto_295326 ?auto_295327 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295369 - BLOCK
      ?auto_295370 - BLOCK
      ?auto_295371 - BLOCK
      ?auto_295372 - BLOCK
      ?auto_295373 - BLOCK
      ?auto_295374 - BLOCK
      ?auto_295375 - BLOCK
      ?auto_295376 - BLOCK
      ?auto_295377 - BLOCK
      ?auto_295378 - BLOCK
      ?auto_295379 - BLOCK
      ?auto_295380 - BLOCK
      ?auto_295381 - BLOCK
    )
    :vars
    (
      ?auto_295382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295381 ?auto_295382 ) ( ON-TABLE ?auto_295369 ) ( ON ?auto_295370 ?auto_295369 ) ( not ( = ?auto_295369 ?auto_295370 ) ) ( not ( = ?auto_295369 ?auto_295371 ) ) ( not ( = ?auto_295369 ?auto_295372 ) ) ( not ( = ?auto_295369 ?auto_295373 ) ) ( not ( = ?auto_295369 ?auto_295374 ) ) ( not ( = ?auto_295369 ?auto_295375 ) ) ( not ( = ?auto_295369 ?auto_295376 ) ) ( not ( = ?auto_295369 ?auto_295377 ) ) ( not ( = ?auto_295369 ?auto_295378 ) ) ( not ( = ?auto_295369 ?auto_295379 ) ) ( not ( = ?auto_295369 ?auto_295380 ) ) ( not ( = ?auto_295369 ?auto_295381 ) ) ( not ( = ?auto_295369 ?auto_295382 ) ) ( not ( = ?auto_295370 ?auto_295371 ) ) ( not ( = ?auto_295370 ?auto_295372 ) ) ( not ( = ?auto_295370 ?auto_295373 ) ) ( not ( = ?auto_295370 ?auto_295374 ) ) ( not ( = ?auto_295370 ?auto_295375 ) ) ( not ( = ?auto_295370 ?auto_295376 ) ) ( not ( = ?auto_295370 ?auto_295377 ) ) ( not ( = ?auto_295370 ?auto_295378 ) ) ( not ( = ?auto_295370 ?auto_295379 ) ) ( not ( = ?auto_295370 ?auto_295380 ) ) ( not ( = ?auto_295370 ?auto_295381 ) ) ( not ( = ?auto_295370 ?auto_295382 ) ) ( not ( = ?auto_295371 ?auto_295372 ) ) ( not ( = ?auto_295371 ?auto_295373 ) ) ( not ( = ?auto_295371 ?auto_295374 ) ) ( not ( = ?auto_295371 ?auto_295375 ) ) ( not ( = ?auto_295371 ?auto_295376 ) ) ( not ( = ?auto_295371 ?auto_295377 ) ) ( not ( = ?auto_295371 ?auto_295378 ) ) ( not ( = ?auto_295371 ?auto_295379 ) ) ( not ( = ?auto_295371 ?auto_295380 ) ) ( not ( = ?auto_295371 ?auto_295381 ) ) ( not ( = ?auto_295371 ?auto_295382 ) ) ( not ( = ?auto_295372 ?auto_295373 ) ) ( not ( = ?auto_295372 ?auto_295374 ) ) ( not ( = ?auto_295372 ?auto_295375 ) ) ( not ( = ?auto_295372 ?auto_295376 ) ) ( not ( = ?auto_295372 ?auto_295377 ) ) ( not ( = ?auto_295372 ?auto_295378 ) ) ( not ( = ?auto_295372 ?auto_295379 ) ) ( not ( = ?auto_295372 ?auto_295380 ) ) ( not ( = ?auto_295372 ?auto_295381 ) ) ( not ( = ?auto_295372 ?auto_295382 ) ) ( not ( = ?auto_295373 ?auto_295374 ) ) ( not ( = ?auto_295373 ?auto_295375 ) ) ( not ( = ?auto_295373 ?auto_295376 ) ) ( not ( = ?auto_295373 ?auto_295377 ) ) ( not ( = ?auto_295373 ?auto_295378 ) ) ( not ( = ?auto_295373 ?auto_295379 ) ) ( not ( = ?auto_295373 ?auto_295380 ) ) ( not ( = ?auto_295373 ?auto_295381 ) ) ( not ( = ?auto_295373 ?auto_295382 ) ) ( not ( = ?auto_295374 ?auto_295375 ) ) ( not ( = ?auto_295374 ?auto_295376 ) ) ( not ( = ?auto_295374 ?auto_295377 ) ) ( not ( = ?auto_295374 ?auto_295378 ) ) ( not ( = ?auto_295374 ?auto_295379 ) ) ( not ( = ?auto_295374 ?auto_295380 ) ) ( not ( = ?auto_295374 ?auto_295381 ) ) ( not ( = ?auto_295374 ?auto_295382 ) ) ( not ( = ?auto_295375 ?auto_295376 ) ) ( not ( = ?auto_295375 ?auto_295377 ) ) ( not ( = ?auto_295375 ?auto_295378 ) ) ( not ( = ?auto_295375 ?auto_295379 ) ) ( not ( = ?auto_295375 ?auto_295380 ) ) ( not ( = ?auto_295375 ?auto_295381 ) ) ( not ( = ?auto_295375 ?auto_295382 ) ) ( not ( = ?auto_295376 ?auto_295377 ) ) ( not ( = ?auto_295376 ?auto_295378 ) ) ( not ( = ?auto_295376 ?auto_295379 ) ) ( not ( = ?auto_295376 ?auto_295380 ) ) ( not ( = ?auto_295376 ?auto_295381 ) ) ( not ( = ?auto_295376 ?auto_295382 ) ) ( not ( = ?auto_295377 ?auto_295378 ) ) ( not ( = ?auto_295377 ?auto_295379 ) ) ( not ( = ?auto_295377 ?auto_295380 ) ) ( not ( = ?auto_295377 ?auto_295381 ) ) ( not ( = ?auto_295377 ?auto_295382 ) ) ( not ( = ?auto_295378 ?auto_295379 ) ) ( not ( = ?auto_295378 ?auto_295380 ) ) ( not ( = ?auto_295378 ?auto_295381 ) ) ( not ( = ?auto_295378 ?auto_295382 ) ) ( not ( = ?auto_295379 ?auto_295380 ) ) ( not ( = ?auto_295379 ?auto_295381 ) ) ( not ( = ?auto_295379 ?auto_295382 ) ) ( not ( = ?auto_295380 ?auto_295381 ) ) ( not ( = ?auto_295380 ?auto_295382 ) ) ( not ( = ?auto_295381 ?auto_295382 ) ) ( ON ?auto_295380 ?auto_295381 ) ( ON ?auto_295379 ?auto_295380 ) ( ON ?auto_295378 ?auto_295379 ) ( ON ?auto_295377 ?auto_295378 ) ( ON ?auto_295376 ?auto_295377 ) ( ON ?auto_295375 ?auto_295376 ) ( ON ?auto_295374 ?auto_295375 ) ( ON ?auto_295373 ?auto_295374 ) ( ON ?auto_295372 ?auto_295373 ) ( CLEAR ?auto_295370 ) ( ON ?auto_295371 ?auto_295372 ) ( CLEAR ?auto_295371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_295369 ?auto_295370 ?auto_295371 )
      ( MAKE-13PILE ?auto_295369 ?auto_295370 ?auto_295371 ?auto_295372 ?auto_295373 ?auto_295374 ?auto_295375 ?auto_295376 ?auto_295377 ?auto_295378 ?auto_295379 ?auto_295380 ?auto_295381 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295423 - BLOCK
      ?auto_295424 - BLOCK
      ?auto_295425 - BLOCK
      ?auto_295426 - BLOCK
      ?auto_295427 - BLOCK
      ?auto_295428 - BLOCK
      ?auto_295429 - BLOCK
      ?auto_295430 - BLOCK
      ?auto_295431 - BLOCK
      ?auto_295432 - BLOCK
      ?auto_295433 - BLOCK
      ?auto_295434 - BLOCK
      ?auto_295435 - BLOCK
    )
    :vars
    (
      ?auto_295436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295435 ?auto_295436 ) ( ON-TABLE ?auto_295423 ) ( not ( = ?auto_295423 ?auto_295424 ) ) ( not ( = ?auto_295423 ?auto_295425 ) ) ( not ( = ?auto_295423 ?auto_295426 ) ) ( not ( = ?auto_295423 ?auto_295427 ) ) ( not ( = ?auto_295423 ?auto_295428 ) ) ( not ( = ?auto_295423 ?auto_295429 ) ) ( not ( = ?auto_295423 ?auto_295430 ) ) ( not ( = ?auto_295423 ?auto_295431 ) ) ( not ( = ?auto_295423 ?auto_295432 ) ) ( not ( = ?auto_295423 ?auto_295433 ) ) ( not ( = ?auto_295423 ?auto_295434 ) ) ( not ( = ?auto_295423 ?auto_295435 ) ) ( not ( = ?auto_295423 ?auto_295436 ) ) ( not ( = ?auto_295424 ?auto_295425 ) ) ( not ( = ?auto_295424 ?auto_295426 ) ) ( not ( = ?auto_295424 ?auto_295427 ) ) ( not ( = ?auto_295424 ?auto_295428 ) ) ( not ( = ?auto_295424 ?auto_295429 ) ) ( not ( = ?auto_295424 ?auto_295430 ) ) ( not ( = ?auto_295424 ?auto_295431 ) ) ( not ( = ?auto_295424 ?auto_295432 ) ) ( not ( = ?auto_295424 ?auto_295433 ) ) ( not ( = ?auto_295424 ?auto_295434 ) ) ( not ( = ?auto_295424 ?auto_295435 ) ) ( not ( = ?auto_295424 ?auto_295436 ) ) ( not ( = ?auto_295425 ?auto_295426 ) ) ( not ( = ?auto_295425 ?auto_295427 ) ) ( not ( = ?auto_295425 ?auto_295428 ) ) ( not ( = ?auto_295425 ?auto_295429 ) ) ( not ( = ?auto_295425 ?auto_295430 ) ) ( not ( = ?auto_295425 ?auto_295431 ) ) ( not ( = ?auto_295425 ?auto_295432 ) ) ( not ( = ?auto_295425 ?auto_295433 ) ) ( not ( = ?auto_295425 ?auto_295434 ) ) ( not ( = ?auto_295425 ?auto_295435 ) ) ( not ( = ?auto_295425 ?auto_295436 ) ) ( not ( = ?auto_295426 ?auto_295427 ) ) ( not ( = ?auto_295426 ?auto_295428 ) ) ( not ( = ?auto_295426 ?auto_295429 ) ) ( not ( = ?auto_295426 ?auto_295430 ) ) ( not ( = ?auto_295426 ?auto_295431 ) ) ( not ( = ?auto_295426 ?auto_295432 ) ) ( not ( = ?auto_295426 ?auto_295433 ) ) ( not ( = ?auto_295426 ?auto_295434 ) ) ( not ( = ?auto_295426 ?auto_295435 ) ) ( not ( = ?auto_295426 ?auto_295436 ) ) ( not ( = ?auto_295427 ?auto_295428 ) ) ( not ( = ?auto_295427 ?auto_295429 ) ) ( not ( = ?auto_295427 ?auto_295430 ) ) ( not ( = ?auto_295427 ?auto_295431 ) ) ( not ( = ?auto_295427 ?auto_295432 ) ) ( not ( = ?auto_295427 ?auto_295433 ) ) ( not ( = ?auto_295427 ?auto_295434 ) ) ( not ( = ?auto_295427 ?auto_295435 ) ) ( not ( = ?auto_295427 ?auto_295436 ) ) ( not ( = ?auto_295428 ?auto_295429 ) ) ( not ( = ?auto_295428 ?auto_295430 ) ) ( not ( = ?auto_295428 ?auto_295431 ) ) ( not ( = ?auto_295428 ?auto_295432 ) ) ( not ( = ?auto_295428 ?auto_295433 ) ) ( not ( = ?auto_295428 ?auto_295434 ) ) ( not ( = ?auto_295428 ?auto_295435 ) ) ( not ( = ?auto_295428 ?auto_295436 ) ) ( not ( = ?auto_295429 ?auto_295430 ) ) ( not ( = ?auto_295429 ?auto_295431 ) ) ( not ( = ?auto_295429 ?auto_295432 ) ) ( not ( = ?auto_295429 ?auto_295433 ) ) ( not ( = ?auto_295429 ?auto_295434 ) ) ( not ( = ?auto_295429 ?auto_295435 ) ) ( not ( = ?auto_295429 ?auto_295436 ) ) ( not ( = ?auto_295430 ?auto_295431 ) ) ( not ( = ?auto_295430 ?auto_295432 ) ) ( not ( = ?auto_295430 ?auto_295433 ) ) ( not ( = ?auto_295430 ?auto_295434 ) ) ( not ( = ?auto_295430 ?auto_295435 ) ) ( not ( = ?auto_295430 ?auto_295436 ) ) ( not ( = ?auto_295431 ?auto_295432 ) ) ( not ( = ?auto_295431 ?auto_295433 ) ) ( not ( = ?auto_295431 ?auto_295434 ) ) ( not ( = ?auto_295431 ?auto_295435 ) ) ( not ( = ?auto_295431 ?auto_295436 ) ) ( not ( = ?auto_295432 ?auto_295433 ) ) ( not ( = ?auto_295432 ?auto_295434 ) ) ( not ( = ?auto_295432 ?auto_295435 ) ) ( not ( = ?auto_295432 ?auto_295436 ) ) ( not ( = ?auto_295433 ?auto_295434 ) ) ( not ( = ?auto_295433 ?auto_295435 ) ) ( not ( = ?auto_295433 ?auto_295436 ) ) ( not ( = ?auto_295434 ?auto_295435 ) ) ( not ( = ?auto_295434 ?auto_295436 ) ) ( not ( = ?auto_295435 ?auto_295436 ) ) ( ON ?auto_295434 ?auto_295435 ) ( ON ?auto_295433 ?auto_295434 ) ( ON ?auto_295432 ?auto_295433 ) ( ON ?auto_295431 ?auto_295432 ) ( ON ?auto_295430 ?auto_295431 ) ( ON ?auto_295429 ?auto_295430 ) ( ON ?auto_295428 ?auto_295429 ) ( ON ?auto_295427 ?auto_295428 ) ( ON ?auto_295426 ?auto_295427 ) ( ON ?auto_295425 ?auto_295426 ) ( CLEAR ?auto_295423 ) ( ON ?auto_295424 ?auto_295425 ) ( CLEAR ?auto_295424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_295423 ?auto_295424 )
      ( MAKE-13PILE ?auto_295423 ?auto_295424 ?auto_295425 ?auto_295426 ?auto_295427 ?auto_295428 ?auto_295429 ?auto_295430 ?auto_295431 ?auto_295432 ?auto_295433 ?auto_295434 ?auto_295435 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_295477 - BLOCK
      ?auto_295478 - BLOCK
      ?auto_295479 - BLOCK
      ?auto_295480 - BLOCK
      ?auto_295481 - BLOCK
      ?auto_295482 - BLOCK
      ?auto_295483 - BLOCK
      ?auto_295484 - BLOCK
      ?auto_295485 - BLOCK
      ?auto_295486 - BLOCK
      ?auto_295487 - BLOCK
      ?auto_295488 - BLOCK
      ?auto_295489 - BLOCK
    )
    :vars
    (
      ?auto_295490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295489 ?auto_295490 ) ( not ( = ?auto_295477 ?auto_295478 ) ) ( not ( = ?auto_295477 ?auto_295479 ) ) ( not ( = ?auto_295477 ?auto_295480 ) ) ( not ( = ?auto_295477 ?auto_295481 ) ) ( not ( = ?auto_295477 ?auto_295482 ) ) ( not ( = ?auto_295477 ?auto_295483 ) ) ( not ( = ?auto_295477 ?auto_295484 ) ) ( not ( = ?auto_295477 ?auto_295485 ) ) ( not ( = ?auto_295477 ?auto_295486 ) ) ( not ( = ?auto_295477 ?auto_295487 ) ) ( not ( = ?auto_295477 ?auto_295488 ) ) ( not ( = ?auto_295477 ?auto_295489 ) ) ( not ( = ?auto_295477 ?auto_295490 ) ) ( not ( = ?auto_295478 ?auto_295479 ) ) ( not ( = ?auto_295478 ?auto_295480 ) ) ( not ( = ?auto_295478 ?auto_295481 ) ) ( not ( = ?auto_295478 ?auto_295482 ) ) ( not ( = ?auto_295478 ?auto_295483 ) ) ( not ( = ?auto_295478 ?auto_295484 ) ) ( not ( = ?auto_295478 ?auto_295485 ) ) ( not ( = ?auto_295478 ?auto_295486 ) ) ( not ( = ?auto_295478 ?auto_295487 ) ) ( not ( = ?auto_295478 ?auto_295488 ) ) ( not ( = ?auto_295478 ?auto_295489 ) ) ( not ( = ?auto_295478 ?auto_295490 ) ) ( not ( = ?auto_295479 ?auto_295480 ) ) ( not ( = ?auto_295479 ?auto_295481 ) ) ( not ( = ?auto_295479 ?auto_295482 ) ) ( not ( = ?auto_295479 ?auto_295483 ) ) ( not ( = ?auto_295479 ?auto_295484 ) ) ( not ( = ?auto_295479 ?auto_295485 ) ) ( not ( = ?auto_295479 ?auto_295486 ) ) ( not ( = ?auto_295479 ?auto_295487 ) ) ( not ( = ?auto_295479 ?auto_295488 ) ) ( not ( = ?auto_295479 ?auto_295489 ) ) ( not ( = ?auto_295479 ?auto_295490 ) ) ( not ( = ?auto_295480 ?auto_295481 ) ) ( not ( = ?auto_295480 ?auto_295482 ) ) ( not ( = ?auto_295480 ?auto_295483 ) ) ( not ( = ?auto_295480 ?auto_295484 ) ) ( not ( = ?auto_295480 ?auto_295485 ) ) ( not ( = ?auto_295480 ?auto_295486 ) ) ( not ( = ?auto_295480 ?auto_295487 ) ) ( not ( = ?auto_295480 ?auto_295488 ) ) ( not ( = ?auto_295480 ?auto_295489 ) ) ( not ( = ?auto_295480 ?auto_295490 ) ) ( not ( = ?auto_295481 ?auto_295482 ) ) ( not ( = ?auto_295481 ?auto_295483 ) ) ( not ( = ?auto_295481 ?auto_295484 ) ) ( not ( = ?auto_295481 ?auto_295485 ) ) ( not ( = ?auto_295481 ?auto_295486 ) ) ( not ( = ?auto_295481 ?auto_295487 ) ) ( not ( = ?auto_295481 ?auto_295488 ) ) ( not ( = ?auto_295481 ?auto_295489 ) ) ( not ( = ?auto_295481 ?auto_295490 ) ) ( not ( = ?auto_295482 ?auto_295483 ) ) ( not ( = ?auto_295482 ?auto_295484 ) ) ( not ( = ?auto_295482 ?auto_295485 ) ) ( not ( = ?auto_295482 ?auto_295486 ) ) ( not ( = ?auto_295482 ?auto_295487 ) ) ( not ( = ?auto_295482 ?auto_295488 ) ) ( not ( = ?auto_295482 ?auto_295489 ) ) ( not ( = ?auto_295482 ?auto_295490 ) ) ( not ( = ?auto_295483 ?auto_295484 ) ) ( not ( = ?auto_295483 ?auto_295485 ) ) ( not ( = ?auto_295483 ?auto_295486 ) ) ( not ( = ?auto_295483 ?auto_295487 ) ) ( not ( = ?auto_295483 ?auto_295488 ) ) ( not ( = ?auto_295483 ?auto_295489 ) ) ( not ( = ?auto_295483 ?auto_295490 ) ) ( not ( = ?auto_295484 ?auto_295485 ) ) ( not ( = ?auto_295484 ?auto_295486 ) ) ( not ( = ?auto_295484 ?auto_295487 ) ) ( not ( = ?auto_295484 ?auto_295488 ) ) ( not ( = ?auto_295484 ?auto_295489 ) ) ( not ( = ?auto_295484 ?auto_295490 ) ) ( not ( = ?auto_295485 ?auto_295486 ) ) ( not ( = ?auto_295485 ?auto_295487 ) ) ( not ( = ?auto_295485 ?auto_295488 ) ) ( not ( = ?auto_295485 ?auto_295489 ) ) ( not ( = ?auto_295485 ?auto_295490 ) ) ( not ( = ?auto_295486 ?auto_295487 ) ) ( not ( = ?auto_295486 ?auto_295488 ) ) ( not ( = ?auto_295486 ?auto_295489 ) ) ( not ( = ?auto_295486 ?auto_295490 ) ) ( not ( = ?auto_295487 ?auto_295488 ) ) ( not ( = ?auto_295487 ?auto_295489 ) ) ( not ( = ?auto_295487 ?auto_295490 ) ) ( not ( = ?auto_295488 ?auto_295489 ) ) ( not ( = ?auto_295488 ?auto_295490 ) ) ( not ( = ?auto_295489 ?auto_295490 ) ) ( ON ?auto_295488 ?auto_295489 ) ( ON ?auto_295487 ?auto_295488 ) ( ON ?auto_295486 ?auto_295487 ) ( ON ?auto_295485 ?auto_295486 ) ( ON ?auto_295484 ?auto_295485 ) ( ON ?auto_295483 ?auto_295484 ) ( ON ?auto_295482 ?auto_295483 ) ( ON ?auto_295481 ?auto_295482 ) ( ON ?auto_295480 ?auto_295481 ) ( ON ?auto_295479 ?auto_295480 ) ( ON ?auto_295478 ?auto_295479 ) ( ON ?auto_295477 ?auto_295478 ) ( CLEAR ?auto_295477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_295477 )
      ( MAKE-13PILE ?auto_295477 ?auto_295478 ?auto_295479 ?auto_295480 ?auto_295481 ?auto_295482 ?auto_295483 ?auto_295484 ?auto_295485 ?auto_295486 ?auto_295487 ?auto_295488 ?auto_295489 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295532 - BLOCK
      ?auto_295533 - BLOCK
      ?auto_295534 - BLOCK
      ?auto_295535 - BLOCK
      ?auto_295536 - BLOCK
      ?auto_295537 - BLOCK
      ?auto_295538 - BLOCK
      ?auto_295539 - BLOCK
      ?auto_295540 - BLOCK
      ?auto_295541 - BLOCK
      ?auto_295542 - BLOCK
      ?auto_295543 - BLOCK
      ?auto_295544 - BLOCK
      ?auto_295545 - BLOCK
    )
    :vars
    (
      ?auto_295546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_295544 ) ( ON ?auto_295545 ?auto_295546 ) ( CLEAR ?auto_295545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_295532 ) ( ON ?auto_295533 ?auto_295532 ) ( ON ?auto_295534 ?auto_295533 ) ( ON ?auto_295535 ?auto_295534 ) ( ON ?auto_295536 ?auto_295535 ) ( ON ?auto_295537 ?auto_295536 ) ( ON ?auto_295538 ?auto_295537 ) ( ON ?auto_295539 ?auto_295538 ) ( ON ?auto_295540 ?auto_295539 ) ( ON ?auto_295541 ?auto_295540 ) ( ON ?auto_295542 ?auto_295541 ) ( ON ?auto_295543 ?auto_295542 ) ( ON ?auto_295544 ?auto_295543 ) ( not ( = ?auto_295532 ?auto_295533 ) ) ( not ( = ?auto_295532 ?auto_295534 ) ) ( not ( = ?auto_295532 ?auto_295535 ) ) ( not ( = ?auto_295532 ?auto_295536 ) ) ( not ( = ?auto_295532 ?auto_295537 ) ) ( not ( = ?auto_295532 ?auto_295538 ) ) ( not ( = ?auto_295532 ?auto_295539 ) ) ( not ( = ?auto_295532 ?auto_295540 ) ) ( not ( = ?auto_295532 ?auto_295541 ) ) ( not ( = ?auto_295532 ?auto_295542 ) ) ( not ( = ?auto_295532 ?auto_295543 ) ) ( not ( = ?auto_295532 ?auto_295544 ) ) ( not ( = ?auto_295532 ?auto_295545 ) ) ( not ( = ?auto_295532 ?auto_295546 ) ) ( not ( = ?auto_295533 ?auto_295534 ) ) ( not ( = ?auto_295533 ?auto_295535 ) ) ( not ( = ?auto_295533 ?auto_295536 ) ) ( not ( = ?auto_295533 ?auto_295537 ) ) ( not ( = ?auto_295533 ?auto_295538 ) ) ( not ( = ?auto_295533 ?auto_295539 ) ) ( not ( = ?auto_295533 ?auto_295540 ) ) ( not ( = ?auto_295533 ?auto_295541 ) ) ( not ( = ?auto_295533 ?auto_295542 ) ) ( not ( = ?auto_295533 ?auto_295543 ) ) ( not ( = ?auto_295533 ?auto_295544 ) ) ( not ( = ?auto_295533 ?auto_295545 ) ) ( not ( = ?auto_295533 ?auto_295546 ) ) ( not ( = ?auto_295534 ?auto_295535 ) ) ( not ( = ?auto_295534 ?auto_295536 ) ) ( not ( = ?auto_295534 ?auto_295537 ) ) ( not ( = ?auto_295534 ?auto_295538 ) ) ( not ( = ?auto_295534 ?auto_295539 ) ) ( not ( = ?auto_295534 ?auto_295540 ) ) ( not ( = ?auto_295534 ?auto_295541 ) ) ( not ( = ?auto_295534 ?auto_295542 ) ) ( not ( = ?auto_295534 ?auto_295543 ) ) ( not ( = ?auto_295534 ?auto_295544 ) ) ( not ( = ?auto_295534 ?auto_295545 ) ) ( not ( = ?auto_295534 ?auto_295546 ) ) ( not ( = ?auto_295535 ?auto_295536 ) ) ( not ( = ?auto_295535 ?auto_295537 ) ) ( not ( = ?auto_295535 ?auto_295538 ) ) ( not ( = ?auto_295535 ?auto_295539 ) ) ( not ( = ?auto_295535 ?auto_295540 ) ) ( not ( = ?auto_295535 ?auto_295541 ) ) ( not ( = ?auto_295535 ?auto_295542 ) ) ( not ( = ?auto_295535 ?auto_295543 ) ) ( not ( = ?auto_295535 ?auto_295544 ) ) ( not ( = ?auto_295535 ?auto_295545 ) ) ( not ( = ?auto_295535 ?auto_295546 ) ) ( not ( = ?auto_295536 ?auto_295537 ) ) ( not ( = ?auto_295536 ?auto_295538 ) ) ( not ( = ?auto_295536 ?auto_295539 ) ) ( not ( = ?auto_295536 ?auto_295540 ) ) ( not ( = ?auto_295536 ?auto_295541 ) ) ( not ( = ?auto_295536 ?auto_295542 ) ) ( not ( = ?auto_295536 ?auto_295543 ) ) ( not ( = ?auto_295536 ?auto_295544 ) ) ( not ( = ?auto_295536 ?auto_295545 ) ) ( not ( = ?auto_295536 ?auto_295546 ) ) ( not ( = ?auto_295537 ?auto_295538 ) ) ( not ( = ?auto_295537 ?auto_295539 ) ) ( not ( = ?auto_295537 ?auto_295540 ) ) ( not ( = ?auto_295537 ?auto_295541 ) ) ( not ( = ?auto_295537 ?auto_295542 ) ) ( not ( = ?auto_295537 ?auto_295543 ) ) ( not ( = ?auto_295537 ?auto_295544 ) ) ( not ( = ?auto_295537 ?auto_295545 ) ) ( not ( = ?auto_295537 ?auto_295546 ) ) ( not ( = ?auto_295538 ?auto_295539 ) ) ( not ( = ?auto_295538 ?auto_295540 ) ) ( not ( = ?auto_295538 ?auto_295541 ) ) ( not ( = ?auto_295538 ?auto_295542 ) ) ( not ( = ?auto_295538 ?auto_295543 ) ) ( not ( = ?auto_295538 ?auto_295544 ) ) ( not ( = ?auto_295538 ?auto_295545 ) ) ( not ( = ?auto_295538 ?auto_295546 ) ) ( not ( = ?auto_295539 ?auto_295540 ) ) ( not ( = ?auto_295539 ?auto_295541 ) ) ( not ( = ?auto_295539 ?auto_295542 ) ) ( not ( = ?auto_295539 ?auto_295543 ) ) ( not ( = ?auto_295539 ?auto_295544 ) ) ( not ( = ?auto_295539 ?auto_295545 ) ) ( not ( = ?auto_295539 ?auto_295546 ) ) ( not ( = ?auto_295540 ?auto_295541 ) ) ( not ( = ?auto_295540 ?auto_295542 ) ) ( not ( = ?auto_295540 ?auto_295543 ) ) ( not ( = ?auto_295540 ?auto_295544 ) ) ( not ( = ?auto_295540 ?auto_295545 ) ) ( not ( = ?auto_295540 ?auto_295546 ) ) ( not ( = ?auto_295541 ?auto_295542 ) ) ( not ( = ?auto_295541 ?auto_295543 ) ) ( not ( = ?auto_295541 ?auto_295544 ) ) ( not ( = ?auto_295541 ?auto_295545 ) ) ( not ( = ?auto_295541 ?auto_295546 ) ) ( not ( = ?auto_295542 ?auto_295543 ) ) ( not ( = ?auto_295542 ?auto_295544 ) ) ( not ( = ?auto_295542 ?auto_295545 ) ) ( not ( = ?auto_295542 ?auto_295546 ) ) ( not ( = ?auto_295543 ?auto_295544 ) ) ( not ( = ?auto_295543 ?auto_295545 ) ) ( not ( = ?auto_295543 ?auto_295546 ) ) ( not ( = ?auto_295544 ?auto_295545 ) ) ( not ( = ?auto_295544 ?auto_295546 ) ) ( not ( = ?auto_295545 ?auto_295546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_295545 ?auto_295546 )
      ( !STACK ?auto_295545 ?auto_295544 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295561 - BLOCK
      ?auto_295562 - BLOCK
      ?auto_295563 - BLOCK
      ?auto_295564 - BLOCK
      ?auto_295565 - BLOCK
      ?auto_295566 - BLOCK
      ?auto_295567 - BLOCK
      ?auto_295568 - BLOCK
      ?auto_295569 - BLOCK
      ?auto_295570 - BLOCK
      ?auto_295571 - BLOCK
      ?auto_295572 - BLOCK
      ?auto_295573 - BLOCK
      ?auto_295574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_295573 ) ( ON-TABLE ?auto_295574 ) ( CLEAR ?auto_295574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_295561 ) ( ON ?auto_295562 ?auto_295561 ) ( ON ?auto_295563 ?auto_295562 ) ( ON ?auto_295564 ?auto_295563 ) ( ON ?auto_295565 ?auto_295564 ) ( ON ?auto_295566 ?auto_295565 ) ( ON ?auto_295567 ?auto_295566 ) ( ON ?auto_295568 ?auto_295567 ) ( ON ?auto_295569 ?auto_295568 ) ( ON ?auto_295570 ?auto_295569 ) ( ON ?auto_295571 ?auto_295570 ) ( ON ?auto_295572 ?auto_295571 ) ( ON ?auto_295573 ?auto_295572 ) ( not ( = ?auto_295561 ?auto_295562 ) ) ( not ( = ?auto_295561 ?auto_295563 ) ) ( not ( = ?auto_295561 ?auto_295564 ) ) ( not ( = ?auto_295561 ?auto_295565 ) ) ( not ( = ?auto_295561 ?auto_295566 ) ) ( not ( = ?auto_295561 ?auto_295567 ) ) ( not ( = ?auto_295561 ?auto_295568 ) ) ( not ( = ?auto_295561 ?auto_295569 ) ) ( not ( = ?auto_295561 ?auto_295570 ) ) ( not ( = ?auto_295561 ?auto_295571 ) ) ( not ( = ?auto_295561 ?auto_295572 ) ) ( not ( = ?auto_295561 ?auto_295573 ) ) ( not ( = ?auto_295561 ?auto_295574 ) ) ( not ( = ?auto_295562 ?auto_295563 ) ) ( not ( = ?auto_295562 ?auto_295564 ) ) ( not ( = ?auto_295562 ?auto_295565 ) ) ( not ( = ?auto_295562 ?auto_295566 ) ) ( not ( = ?auto_295562 ?auto_295567 ) ) ( not ( = ?auto_295562 ?auto_295568 ) ) ( not ( = ?auto_295562 ?auto_295569 ) ) ( not ( = ?auto_295562 ?auto_295570 ) ) ( not ( = ?auto_295562 ?auto_295571 ) ) ( not ( = ?auto_295562 ?auto_295572 ) ) ( not ( = ?auto_295562 ?auto_295573 ) ) ( not ( = ?auto_295562 ?auto_295574 ) ) ( not ( = ?auto_295563 ?auto_295564 ) ) ( not ( = ?auto_295563 ?auto_295565 ) ) ( not ( = ?auto_295563 ?auto_295566 ) ) ( not ( = ?auto_295563 ?auto_295567 ) ) ( not ( = ?auto_295563 ?auto_295568 ) ) ( not ( = ?auto_295563 ?auto_295569 ) ) ( not ( = ?auto_295563 ?auto_295570 ) ) ( not ( = ?auto_295563 ?auto_295571 ) ) ( not ( = ?auto_295563 ?auto_295572 ) ) ( not ( = ?auto_295563 ?auto_295573 ) ) ( not ( = ?auto_295563 ?auto_295574 ) ) ( not ( = ?auto_295564 ?auto_295565 ) ) ( not ( = ?auto_295564 ?auto_295566 ) ) ( not ( = ?auto_295564 ?auto_295567 ) ) ( not ( = ?auto_295564 ?auto_295568 ) ) ( not ( = ?auto_295564 ?auto_295569 ) ) ( not ( = ?auto_295564 ?auto_295570 ) ) ( not ( = ?auto_295564 ?auto_295571 ) ) ( not ( = ?auto_295564 ?auto_295572 ) ) ( not ( = ?auto_295564 ?auto_295573 ) ) ( not ( = ?auto_295564 ?auto_295574 ) ) ( not ( = ?auto_295565 ?auto_295566 ) ) ( not ( = ?auto_295565 ?auto_295567 ) ) ( not ( = ?auto_295565 ?auto_295568 ) ) ( not ( = ?auto_295565 ?auto_295569 ) ) ( not ( = ?auto_295565 ?auto_295570 ) ) ( not ( = ?auto_295565 ?auto_295571 ) ) ( not ( = ?auto_295565 ?auto_295572 ) ) ( not ( = ?auto_295565 ?auto_295573 ) ) ( not ( = ?auto_295565 ?auto_295574 ) ) ( not ( = ?auto_295566 ?auto_295567 ) ) ( not ( = ?auto_295566 ?auto_295568 ) ) ( not ( = ?auto_295566 ?auto_295569 ) ) ( not ( = ?auto_295566 ?auto_295570 ) ) ( not ( = ?auto_295566 ?auto_295571 ) ) ( not ( = ?auto_295566 ?auto_295572 ) ) ( not ( = ?auto_295566 ?auto_295573 ) ) ( not ( = ?auto_295566 ?auto_295574 ) ) ( not ( = ?auto_295567 ?auto_295568 ) ) ( not ( = ?auto_295567 ?auto_295569 ) ) ( not ( = ?auto_295567 ?auto_295570 ) ) ( not ( = ?auto_295567 ?auto_295571 ) ) ( not ( = ?auto_295567 ?auto_295572 ) ) ( not ( = ?auto_295567 ?auto_295573 ) ) ( not ( = ?auto_295567 ?auto_295574 ) ) ( not ( = ?auto_295568 ?auto_295569 ) ) ( not ( = ?auto_295568 ?auto_295570 ) ) ( not ( = ?auto_295568 ?auto_295571 ) ) ( not ( = ?auto_295568 ?auto_295572 ) ) ( not ( = ?auto_295568 ?auto_295573 ) ) ( not ( = ?auto_295568 ?auto_295574 ) ) ( not ( = ?auto_295569 ?auto_295570 ) ) ( not ( = ?auto_295569 ?auto_295571 ) ) ( not ( = ?auto_295569 ?auto_295572 ) ) ( not ( = ?auto_295569 ?auto_295573 ) ) ( not ( = ?auto_295569 ?auto_295574 ) ) ( not ( = ?auto_295570 ?auto_295571 ) ) ( not ( = ?auto_295570 ?auto_295572 ) ) ( not ( = ?auto_295570 ?auto_295573 ) ) ( not ( = ?auto_295570 ?auto_295574 ) ) ( not ( = ?auto_295571 ?auto_295572 ) ) ( not ( = ?auto_295571 ?auto_295573 ) ) ( not ( = ?auto_295571 ?auto_295574 ) ) ( not ( = ?auto_295572 ?auto_295573 ) ) ( not ( = ?auto_295572 ?auto_295574 ) ) ( not ( = ?auto_295573 ?auto_295574 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_295574 )
      ( !STACK ?auto_295574 ?auto_295573 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295589 - BLOCK
      ?auto_295590 - BLOCK
      ?auto_295591 - BLOCK
      ?auto_295592 - BLOCK
      ?auto_295593 - BLOCK
      ?auto_295594 - BLOCK
      ?auto_295595 - BLOCK
      ?auto_295596 - BLOCK
      ?auto_295597 - BLOCK
      ?auto_295598 - BLOCK
      ?auto_295599 - BLOCK
      ?auto_295600 - BLOCK
      ?auto_295601 - BLOCK
      ?auto_295602 - BLOCK
    )
    :vars
    (
      ?auto_295603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295602 ?auto_295603 ) ( ON-TABLE ?auto_295589 ) ( ON ?auto_295590 ?auto_295589 ) ( ON ?auto_295591 ?auto_295590 ) ( ON ?auto_295592 ?auto_295591 ) ( ON ?auto_295593 ?auto_295592 ) ( ON ?auto_295594 ?auto_295593 ) ( ON ?auto_295595 ?auto_295594 ) ( ON ?auto_295596 ?auto_295595 ) ( ON ?auto_295597 ?auto_295596 ) ( ON ?auto_295598 ?auto_295597 ) ( ON ?auto_295599 ?auto_295598 ) ( ON ?auto_295600 ?auto_295599 ) ( not ( = ?auto_295589 ?auto_295590 ) ) ( not ( = ?auto_295589 ?auto_295591 ) ) ( not ( = ?auto_295589 ?auto_295592 ) ) ( not ( = ?auto_295589 ?auto_295593 ) ) ( not ( = ?auto_295589 ?auto_295594 ) ) ( not ( = ?auto_295589 ?auto_295595 ) ) ( not ( = ?auto_295589 ?auto_295596 ) ) ( not ( = ?auto_295589 ?auto_295597 ) ) ( not ( = ?auto_295589 ?auto_295598 ) ) ( not ( = ?auto_295589 ?auto_295599 ) ) ( not ( = ?auto_295589 ?auto_295600 ) ) ( not ( = ?auto_295589 ?auto_295601 ) ) ( not ( = ?auto_295589 ?auto_295602 ) ) ( not ( = ?auto_295589 ?auto_295603 ) ) ( not ( = ?auto_295590 ?auto_295591 ) ) ( not ( = ?auto_295590 ?auto_295592 ) ) ( not ( = ?auto_295590 ?auto_295593 ) ) ( not ( = ?auto_295590 ?auto_295594 ) ) ( not ( = ?auto_295590 ?auto_295595 ) ) ( not ( = ?auto_295590 ?auto_295596 ) ) ( not ( = ?auto_295590 ?auto_295597 ) ) ( not ( = ?auto_295590 ?auto_295598 ) ) ( not ( = ?auto_295590 ?auto_295599 ) ) ( not ( = ?auto_295590 ?auto_295600 ) ) ( not ( = ?auto_295590 ?auto_295601 ) ) ( not ( = ?auto_295590 ?auto_295602 ) ) ( not ( = ?auto_295590 ?auto_295603 ) ) ( not ( = ?auto_295591 ?auto_295592 ) ) ( not ( = ?auto_295591 ?auto_295593 ) ) ( not ( = ?auto_295591 ?auto_295594 ) ) ( not ( = ?auto_295591 ?auto_295595 ) ) ( not ( = ?auto_295591 ?auto_295596 ) ) ( not ( = ?auto_295591 ?auto_295597 ) ) ( not ( = ?auto_295591 ?auto_295598 ) ) ( not ( = ?auto_295591 ?auto_295599 ) ) ( not ( = ?auto_295591 ?auto_295600 ) ) ( not ( = ?auto_295591 ?auto_295601 ) ) ( not ( = ?auto_295591 ?auto_295602 ) ) ( not ( = ?auto_295591 ?auto_295603 ) ) ( not ( = ?auto_295592 ?auto_295593 ) ) ( not ( = ?auto_295592 ?auto_295594 ) ) ( not ( = ?auto_295592 ?auto_295595 ) ) ( not ( = ?auto_295592 ?auto_295596 ) ) ( not ( = ?auto_295592 ?auto_295597 ) ) ( not ( = ?auto_295592 ?auto_295598 ) ) ( not ( = ?auto_295592 ?auto_295599 ) ) ( not ( = ?auto_295592 ?auto_295600 ) ) ( not ( = ?auto_295592 ?auto_295601 ) ) ( not ( = ?auto_295592 ?auto_295602 ) ) ( not ( = ?auto_295592 ?auto_295603 ) ) ( not ( = ?auto_295593 ?auto_295594 ) ) ( not ( = ?auto_295593 ?auto_295595 ) ) ( not ( = ?auto_295593 ?auto_295596 ) ) ( not ( = ?auto_295593 ?auto_295597 ) ) ( not ( = ?auto_295593 ?auto_295598 ) ) ( not ( = ?auto_295593 ?auto_295599 ) ) ( not ( = ?auto_295593 ?auto_295600 ) ) ( not ( = ?auto_295593 ?auto_295601 ) ) ( not ( = ?auto_295593 ?auto_295602 ) ) ( not ( = ?auto_295593 ?auto_295603 ) ) ( not ( = ?auto_295594 ?auto_295595 ) ) ( not ( = ?auto_295594 ?auto_295596 ) ) ( not ( = ?auto_295594 ?auto_295597 ) ) ( not ( = ?auto_295594 ?auto_295598 ) ) ( not ( = ?auto_295594 ?auto_295599 ) ) ( not ( = ?auto_295594 ?auto_295600 ) ) ( not ( = ?auto_295594 ?auto_295601 ) ) ( not ( = ?auto_295594 ?auto_295602 ) ) ( not ( = ?auto_295594 ?auto_295603 ) ) ( not ( = ?auto_295595 ?auto_295596 ) ) ( not ( = ?auto_295595 ?auto_295597 ) ) ( not ( = ?auto_295595 ?auto_295598 ) ) ( not ( = ?auto_295595 ?auto_295599 ) ) ( not ( = ?auto_295595 ?auto_295600 ) ) ( not ( = ?auto_295595 ?auto_295601 ) ) ( not ( = ?auto_295595 ?auto_295602 ) ) ( not ( = ?auto_295595 ?auto_295603 ) ) ( not ( = ?auto_295596 ?auto_295597 ) ) ( not ( = ?auto_295596 ?auto_295598 ) ) ( not ( = ?auto_295596 ?auto_295599 ) ) ( not ( = ?auto_295596 ?auto_295600 ) ) ( not ( = ?auto_295596 ?auto_295601 ) ) ( not ( = ?auto_295596 ?auto_295602 ) ) ( not ( = ?auto_295596 ?auto_295603 ) ) ( not ( = ?auto_295597 ?auto_295598 ) ) ( not ( = ?auto_295597 ?auto_295599 ) ) ( not ( = ?auto_295597 ?auto_295600 ) ) ( not ( = ?auto_295597 ?auto_295601 ) ) ( not ( = ?auto_295597 ?auto_295602 ) ) ( not ( = ?auto_295597 ?auto_295603 ) ) ( not ( = ?auto_295598 ?auto_295599 ) ) ( not ( = ?auto_295598 ?auto_295600 ) ) ( not ( = ?auto_295598 ?auto_295601 ) ) ( not ( = ?auto_295598 ?auto_295602 ) ) ( not ( = ?auto_295598 ?auto_295603 ) ) ( not ( = ?auto_295599 ?auto_295600 ) ) ( not ( = ?auto_295599 ?auto_295601 ) ) ( not ( = ?auto_295599 ?auto_295602 ) ) ( not ( = ?auto_295599 ?auto_295603 ) ) ( not ( = ?auto_295600 ?auto_295601 ) ) ( not ( = ?auto_295600 ?auto_295602 ) ) ( not ( = ?auto_295600 ?auto_295603 ) ) ( not ( = ?auto_295601 ?auto_295602 ) ) ( not ( = ?auto_295601 ?auto_295603 ) ) ( not ( = ?auto_295602 ?auto_295603 ) ) ( CLEAR ?auto_295600 ) ( ON ?auto_295601 ?auto_295602 ) ( CLEAR ?auto_295601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_295589 ?auto_295590 ?auto_295591 ?auto_295592 ?auto_295593 ?auto_295594 ?auto_295595 ?auto_295596 ?auto_295597 ?auto_295598 ?auto_295599 ?auto_295600 ?auto_295601 )
      ( MAKE-14PILE ?auto_295589 ?auto_295590 ?auto_295591 ?auto_295592 ?auto_295593 ?auto_295594 ?auto_295595 ?auto_295596 ?auto_295597 ?auto_295598 ?auto_295599 ?auto_295600 ?auto_295601 ?auto_295602 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295618 - BLOCK
      ?auto_295619 - BLOCK
      ?auto_295620 - BLOCK
      ?auto_295621 - BLOCK
      ?auto_295622 - BLOCK
      ?auto_295623 - BLOCK
      ?auto_295624 - BLOCK
      ?auto_295625 - BLOCK
      ?auto_295626 - BLOCK
      ?auto_295627 - BLOCK
      ?auto_295628 - BLOCK
      ?auto_295629 - BLOCK
      ?auto_295630 - BLOCK
      ?auto_295631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295631 ) ( ON-TABLE ?auto_295618 ) ( ON ?auto_295619 ?auto_295618 ) ( ON ?auto_295620 ?auto_295619 ) ( ON ?auto_295621 ?auto_295620 ) ( ON ?auto_295622 ?auto_295621 ) ( ON ?auto_295623 ?auto_295622 ) ( ON ?auto_295624 ?auto_295623 ) ( ON ?auto_295625 ?auto_295624 ) ( ON ?auto_295626 ?auto_295625 ) ( ON ?auto_295627 ?auto_295626 ) ( ON ?auto_295628 ?auto_295627 ) ( ON ?auto_295629 ?auto_295628 ) ( not ( = ?auto_295618 ?auto_295619 ) ) ( not ( = ?auto_295618 ?auto_295620 ) ) ( not ( = ?auto_295618 ?auto_295621 ) ) ( not ( = ?auto_295618 ?auto_295622 ) ) ( not ( = ?auto_295618 ?auto_295623 ) ) ( not ( = ?auto_295618 ?auto_295624 ) ) ( not ( = ?auto_295618 ?auto_295625 ) ) ( not ( = ?auto_295618 ?auto_295626 ) ) ( not ( = ?auto_295618 ?auto_295627 ) ) ( not ( = ?auto_295618 ?auto_295628 ) ) ( not ( = ?auto_295618 ?auto_295629 ) ) ( not ( = ?auto_295618 ?auto_295630 ) ) ( not ( = ?auto_295618 ?auto_295631 ) ) ( not ( = ?auto_295619 ?auto_295620 ) ) ( not ( = ?auto_295619 ?auto_295621 ) ) ( not ( = ?auto_295619 ?auto_295622 ) ) ( not ( = ?auto_295619 ?auto_295623 ) ) ( not ( = ?auto_295619 ?auto_295624 ) ) ( not ( = ?auto_295619 ?auto_295625 ) ) ( not ( = ?auto_295619 ?auto_295626 ) ) ( not ( = ?auto_295619 ?auto_295627 ) ) ( not ( = ?auto_295619 ?auto_295628 ) ) ( not ( = ?auto_295619 ?auto_295629 ) ) ( not ( = ?auto_295619 ?auto_295630 ) ) ( not ( = ?auto_295619 ?auto_295631 ) ) ( not ( = ?auto_295620 ?auto_295621 ) ) ( not ( = ?auto_295620 ?auto_295622 ) ) ( not ( = ?auto_295620 ?auto_295623 ) ) ( not ( = ?auto_295620 ?auto_295624 ) ) ( not ( = ?auto_295620 ?auto_295625 ) ) ( not ( = ?auto_295620 ?auto_295626 ) ) ( not ( = ?auto_295620 ?auto_295627 ) ) ( not ( = ?auto_295620 ?auto_295628 ) ) ( not ( = ?auto_295620 ?auto_295629 ) ) ( not ( = ?auto_295620 ?auto_295630 ) ) ( not ( = ?auto_295620 ?auto_295631 ) ) ( not ( = ?auto_295621 ?auto_295622 ) ) ( not ( = ?auto_295621 ?auto_295623 ) ) ( not ( = ?auto_295621 ?auto_295624 ) ) ( not ( = ?auto_295621 ?auto_295625 ) ) ( not ( = ?auto_295621 ?auto_295626 ) ) ( not ( = ?auto_295621 ?auto_295627 ) ) ( not ( = ?auto_295621 ?auto_295628 ) ) ( not ( = ?auto_295621 ?auto_295629 ) ) ( not ( = ?auto_295621 ?auto_295630 ) ) ( not ( = ?auto_295621 ?auto_295631 ) ) ( not ( = ?auto_295622 ?auto_295623 ) ) ( not ( = ?auto_295622 ?auto_295624 ) ) ( not ( = ?auto_295622 ?auto_295625 ) ) ( not ( = ?auto_295622 ?auto_295626 ) ) ( not ( = ?auto_295622 ?auto_295627 ) ) ( not ( = ?auto_295622 ?auto_295628 ) ) ( not ( = ?auto_295622 ?auto_295629 ) ) ( not ( = ?auto_295622 ?auto_295630 ) ) ( not ( = ?auto_295622 ?auto_295631 ) ) ( not ( = ?auto_295623 ?auto_295624 ) ) ( not ( = ?auto_295623 ?auto_295625 ) ) ( not ( = ?auto_295623 ?auto_295626 ) ) ( not ( = ?auto_295623 ?auto_295627 ) ) ( not ( = ?auto_295623 ?auto_295628 ) ) ( not ( = ?auto_295623 ?auto_295629 ) ) ( not ( = ?auto_295623 ?auto_295630 ) ) ( not ( = ?auto_295623 ?auto_295631 ) ) ( not ( = ?auto_295624 ?auto_295625 ) ) ( not ( = ?auto_295624 ?auto_295626 ) ) ( not ( = ?auto_295624 ?auto_295627 ) ) ( not ( = ?auto_295624 ?auto_295628 ) ) ( not ( = ?auto_295624 ?auto_295629 ) ) ( not ( = ?auto_295624 ?auto_295630 ) ) ( not ( = ?auto_295624 ?auto_295631 ) ) ( not ( = ?auto_295625 ?auto_295626 ) ) ( not ( = ?auto_295625 ?auto_295627 ) ) ( not ( = ?auto_295625 ?auto_295628 ) ) ( not ( = ?auto_295625 ?auto_295629 ) ) ( not ( = ?auto_295625 ?auto_295630 ) ) ( not ( = ?auto_295625 ?auto_295631 ) ) ( not ( = ?auto_295626 ?auto_295627 ) ) ( not ( = ?auto_295626 ?auto_295628 ) ) ( not ( = ?auto_295626 ?auto_295629 ) ) ( not ( = ?auto_295626 ?auto_295630 ) ) ( not ( = ?auto_295626 ?auto_295631 ) ) ( not ( = ?auto_295627 ?auto_295628 ) ) ( not ( = ?auto_295627 ?auto_295629 ) ) ( not ( = ?auto_295627 ?auto_295630 ) ) ( not ( = ?auto_295627 ?auto_295631 ) ) ( not ( = ?auto_295628 ?auto_295629 ) ) ( not ( = ?auto_295628 ?auto_295630 ) ) ( not ( = ?auto_295628 ?auto_295631 ) ) ( not ( = ?auto_295629 ?auto_295630 ) ) ( not ( = ?auto_295629 ?auto_295631 ) ) ( not ( = ?auto_295630 ?auto_295631 ) ) ( CLEAR ?auto_295629 ) ( ON ?auto_295630 ?auto_295631 ) ( CLEAR ?auto_295630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_295618 ?auto_295619 ?auto_295620 ?auto_295621 ?auto_295622 ?auto_295623 ?auto_295624 ?auto_295625 ?auto_295626 ?auto_295627 ?auto_295628 ?auto_295629 ?auto_295630 )
      ( MAKE-14PILE ?auto_295618 ?auto_295619 ?auto_295620 ?auto_295621 ?auto_295622 ?auto_295623 ?auto_295624 ?auto_295625 ?auto_295626 ?auto_295627 ?auto_295628 ?auto_295629 ?auto_295630 ?auto_295631 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295646 - BLOCK
      ?auto_295647 - BLOCK
      ?auto_295648 - BLOCK
      ?auto_295649 - BLOCK
      ?auto_295650 - BLOCK
      ?auto_295651 - BLOCK
      ?auto_295652 - BLOCK
      ?auto_295653 - BLOCK
      ?auto_295654 - BLOCK
      ?auto_295655 - BLOCK
      ?auto_295656 - BLOCK
      ?auto_295657 - BLOCK
      ?auto_295658 - BLOCK
      ?auto_295659 - BLOCK
    )
    :vars
    (
      ?auto_295660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295659 ?auto_295660 ) ( ON-TABLE ?auto_295646 ) ( ON ?auto_295647 ?auto_295646 ) ( ON ?auto_295648 ?auto_295647 ) ( ON ?auto_295649 ?auto_295648 ) ( ON ?auto_295650 ?auto_295649 ) ( ON ?auto_295651 ?auto_295650 ) ( ON ?auto_295652 ?auto_295651 ) ( ON ?auto_295653 ?auto_295652 ) ( ON ?auto_295654 ?auto_295653 ) ( ON ?auto_295655 ?auto_295654 ) ( ON ?auto_295656 ?auto_295655 ) ( not ( = ?auto_295646 ?auto_295647 ) ) ( not ( = ?auto_295646 ?auto_295648 ) ) ( not ( = ?auto_295646 ?auto_295649 ) ) ( not ( = ?auto_295646 ?auto_295650 ) ) ( not ( = ?auto_295646 ?auto_295651 ) ) ( not ( = ?auto_295646 ?auto_295652 ) ) ( not ( = ?auto_295646 ?auto_295653 ) ) ( not ( = ?auto_295646 ?auto_295654 ) ) ( not ( = ?auto_295646 ?auto_295655 ) ) ( not ( = ?auto_295646 ?auto_295656 ) ) ( not ( = ?auto_295646 ?auto_295657 ) ) ( not ( = ?auto_295646 ?auto_295658 ) ) ( not ( = ?auto_295646 ?auto_295659 ) ) ( not ( = ?auto_295646 ?auto_295660 ) ) ( not ( = ?auto_295647 ?auto_295648 ) ) ( not ( = ?auto_295647 ?auto_295649 ) ) ( not ( = ?auto_295647 ?auto_295650 ) ) ( not ( = ?auto_295647 ?auto_295651 ) ) ( not ( = ?auto_295647 ?auto_295652 ) ) ( not ( = ?auto_295647 ?auto_295653 ) ) ( not ( = ?auto_295647 ?auto_295654 ) ) ( not ( = ?auto_295647 ?auto_295655 ) ) ( not ( = ?auto_295647 ?auto_295656 ) ) ( not ( = ?auto_295647 ?auto_295657 ) ) ( not ( = ?auto_295647 ?auto_295658 ) ) ( not ( = ?auto_295647 ?auto_295659 ) ) ( not ( = ?auto_295647 ?auto_295660 ) ) ( not ( = ?auto_295648 ?auto_295649 ) ) ( not ( = ?auto_295648 ?auto_295650 ) ) ( not ( = ?auto_295648 ?auto_295651 ) ) ( not ( = ?auto_295648 ?auto_295652 ) ) ( not ( = ?auto_295648 ?auto_295653 ) ) ( not ( = ?auto_295648 ?auto_295654 ) ) ( not ( = ?auto_295648 ?auto_295655 ) ) ( not ( = ?auto_295648 ?auto_295656 ) ) ( not ( = ?auto_295648 ?auto_295657 ) ) ( not ( = ?auto_295648 ?auto_295658 ) ) ( not ( = ?auto_295648 ?auto_295659 ) ) ( not ( = ?auto_295648 ?auto_295660 ) ) ( not ( = ?auto_295649 ?auto_295650 ) ) ( not ( = ?auto_295649 ?auto_295651 ) ) ( not ( = ?auto_295649 ?auto_295652 ) ) ( not ( = ?auto_295649 ?auto_295653 ) ) ( not ( = ?auto_295649 ?auto_295654 ) ) ( not ( = ?auto_295649 ?auto_295655 ) ) ( not ( = ?auto_295649 ?auto_295656 ) ) ( not ( = ?auto_295649 ?auto_295657 ) ) ( not ( = ?auto_295649 ?auto_295658 ) ) ( not ( = ?auto_295649 ?auto_295659 ) ) ( not ( = ?auto_295649 ?auto_295660 ) ) ( not ( = ?auto_295650 ?auto_295651 ) ) ( not ( = ?auto_295650 ?auto_295652 ) ) ( not ( = ?auto_295650 ?auto_295653 ) ) ( not ( = ?auto_295650 ?auto_295654 ) ) ( not ( = ?auto_295650 ?auto_295655 ) ) ( not ( = ?auto_295650 ?auto_295656 ) ) ( not ( = ?auto_295650 ?auto_295657 ) ) ( not ( = ?auto_295650 ?auto_295658 ) ) ( not ( = ?auto_295650 ?auto_295659 ) ) ( not ( = ?auto_295650 ?auto_295660 ) ) ( not ( = ?auto_295651 ?auto_295652 ) ) ( not ( = ?auto_295651 ?auto_295653 ) ) ( not ( = ?auto_295651 ?auto_295654 ) ) ( not ( = ?auto_295651 ?auto_295655 ) ) ( not ( = ?auto_295651 ?auto_295656 ) ) ( not ( = ?auto_295651 ?auto_295657 ) ) ( not ( = ?auto_295651 ?auto_295658 ) ) ( not ( = ?auto_295651 ?auto_295659 ) ) ( not ( = ?auto_295651 ?auto_295660 ) ) ( not ( = ?auto_295652 ?auto_295653 ) ) ( not ( = ?auto_295652 ?auto_295654 ) ) ( not ( = ?auto_295652 ?auto_295655 ) ) ( not ( = ?auto_295652 ?auto_295656 ) ) ( not ( = ?auto_295652 ?auto_295657 ) ) ( not ( = ?auto_295652 ?auto_295658 ) ) ( not ( = ?auto_295652 ?auto_295659 ) ) ( not ( = ?auto_295652 ?auto_295660 ) ) ( not ( = ?auto_295653 ?auto_295654 ) ) ( not ( = ?auto_295653 ?auto_295655 ) ) ( not ( = ?auto_295653 ?auto_295656 ) ) ( not ( = ?auto_295653 ?auto_295657 ) ) ( not ( = ?auto_295653 ?auto_295658 ) ) ( not ( = ?auto_295653 ?auto_295659 ) ) ( not ( = ?auto_295653 ?auto_295660 ) ) ( not ( = ?auto_295654 ?auto_295655 ) ) ( not ( = ?auto_295654 ?auto_295656 ) ) ( not ( = ?auto_295654 ?auto_295657 ) ) ( not ( = ?auto_295654 ?auto_295658 ) ) ( not ( = ?auto_295654 ?auto_295659 ) ) ( not ( = ?auto_295654 ?auto_295660 ) ) ( not ( = ?auto_295655 ?auto_295656 ) ) ( not ( = ?auto_295655 ?auto_295657 ) ) ( not ( = ?auto_295655 ?auto_295658 ) ) ( not ( = ?auto_295655 ?auto_295659 ) ) ( not ( = ?auto_295655 ?auto_295660 ) ) ( not ( = ?auto_295656 ?auto_295657 ) ) ( not ( = ?auto_295656 ?auto_295658 ) ) ( not ( = ?auto_295656 ?auto_295659 ) ) ( not ( = ?auto_295656 ?auto_295660 ) ) ( not ( = ?auto_295657 ?auto_295658 ) ) ( not ( = ?auto_295657 ?auto_295659 ) ) ( not ( = ?auto_295657 ?auto_295660 ) ) ( not ( = ?auto_295658 ?auto_295659 ) ) ( not ( = ?auto_295658 ?auto_295660 ) ) ( not ( = ?auto_295659 ?auto_295660 ) ) ( ON ?auto_295658 ?auto_295659 ) ( CLEAR ?auto_295656 ) ( ON ?auto_295657 ?auto_295658 ) ( CLEAR ?auto_295657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_295646 ?auto_295647 ?auto_295648 ?auto_295649 ?auto_295650 ?auto_295651 ?auto_295652 ?auto_295653 ?auto_295654 ?auto_295655 ?auto_295656 ?auto_295657 )
      ( MAKE-14PILE ?auto_295646 ?auto_295647 ?auto_295648 ?auto_295649 ?auto_295650 ?auto_295651 ?auto_295652 ?auto_295653 ?auto_295654 ?auto_295655 ?auto_295656 ?auto_295657 ?auto_295658 ?auto_295659 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295675 - BLOCK
      ?auto_295676 - BLOCK
      ?auto_295677 - BLOCK
      ?auto_295678 - BLOCK
      ?auto_295679 - BLOCK
      ?auto_295680 - BLOCK
      ?auto_295681 - BLOCK
      ?auto_295682 - BLOCK
      ?auto_295683 - BLOCK
      ?auto_295684 - BLOCK
      ?auto_295685 - BLOCK
      ?auto_295686 - BLOCK
      ?auto_295687 - BLOCK
      ?auto_295688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295688 ) ( ON-TABLE ?auto_295675 ) ( ON ?auto_295676 ?auto_295675 ) ( ON ?auto_295677 ?auto_295676 ) ( ON ?auto_295678 ?auto_295677 ) ( ON ?auto_295679 ?auto_295678 ) ( ON ?auto_295680 ?auto_295679 ) ( ON ?auto_295681 ?auto_295680 ) ( ON ?auto_295682 ?auto_295681 ) ( ON ?auto_295683 ?auto_295682 ) ( ON ?auto_295684 ?auto_295683 ) ( ON ?auto_295685 ?auto_295684 ) ( not ( = ?auto_295675 ?auto_295676 ) ) ( not ( = ?auto_295675 ?auto_295677 ) ) ( not ( = ?auto_295675 ?auto_295678 ) ) ( not ( = ?auto_295675 ?auto_295679 ) ) ( not ( = ?auto_295675 ?auto_295680 ) ) ( not ( = ?auto_295675 ?auto_295681 ) ) ( not ( = ?auto_295675 ?auto_295682 ) ) ( not ( = ?auto_295675 ?auto_295683 ) ) ( not ( = ?auto_295675 ?auto_295684 ) ) ( not ( = ?auto_295675 ?auto_295685 ) ) ( not ( = ?auto_295675 ?auto_295686 ) ) ( not ( = ?auto_295675 ?auto_295687 ) ) ( not ( = ?auto_295675 ?auto_295688 ) ) ( not ( = ?auto_295676 ?auto_295677 ) ) ( not ( = ?auto_295676 ?auto_295678 ) ) ( not ( = ?auto_295676 ?auto_295679 ) ) ( not ( = ?auto_295676 ?auto_295680 ) ) ( not ( = ?auto_295676 ?auto_295681 ) ) ( not ( = ?auto_295676 ?auto_295682 ) ) ( not ( = ?auto_295676 ?auto_295683 ) ) ( not ( = ?auto_295676 ?auto_295684 ) ) ( not ( = ?auto_295676 ?auto_295685 ) ) ( not ( = ?auto_295676 ?auto_295686 ) ) ( not ( = ?auto_295676 ?auto_295687 ) ) ( not ( = ?auto_295676 ?auto_295688 ) ) ( not ( = ?auto_295677 ?auto_295678 ) ) ( not ( = ?auto_295677 ?auto_295679 ) ) ( not ( = ?auto_295677 ?auto_295680 ) ) ( not ( = ?auto_295677 ?auto_295681 ) ) ( not ( = ?auto_295677 ?auto_295682 ) ) ( not ( = ?auto_295677 ?auto_295683 ) ) ( not ( = ?auto_295677 ?auto_295684 ) ) ( not ( = ?auto_295677 ?auto_295685 ) ) ( not ( = ?auto_295677 ?auto_295686 ) ) ( not ( = ?auto_295677 ?auto_295687 ) ) ( not ( = ?auto_295677 ?auto_295688 ) ) ( not ( = ?auto_295678 ?auto_295679 ) ) ( not ( = ?auto_295678 ?auto_295680 ) ) ( not ( = ?auto_295678 ?auto_295681 ) ) ( not ( = ?auto_295678 ?auto_295682 ) ) ( not ( = ?auto_295678 ?auto_295683 ) ) ( not ( = ?auto_295678 ?auto_295684 ) ) ( not ( = ?auto_295678 ?auto_295685 ) ) ( not ( = ?auto_295678 ?auto_295686 ) ) ( not ( = ?auto_295678 ?auto_295687 ) ) ( not ( = ?auto_295678 ?auto_295688 ) ) ( not ( = ?auto_295679 ?auto_295680 ) ) ( not ( = ?auto_295679 ?auto_295681 ) ) ( not ( = ?auto_295679 ?auto_295682 ) ) ( not ( = ?auto_295679 ?auto_295683 ) ) ( not ( = ?auto_295679 ?auto_295684 ) ) ( not ( = ?auto_295679 ?auto_295685 ) ) ( not ( = ?auto_295679 ?auto_295686 ) ) ( not ( = ?auto_295679 ?auto_295687 ) ) ( not ( = ?auto_295679 ?auto_295688 ) ) ( not ( = ?auto_295680 ?auto_295681 ) ) ( not ( = ?auto_295680 ?auto_295682 ) ) ( not ( = ?auto_295680 ?auto_295683 ) ) ( not ( = ?auto_295680 ?auto_295684 ) ) ( not ( = ?auto_295680 ?auto_295685 ) ) ( not ( = ?auto_295680 ?auto_295686 ) ) ( not ( = ?auto_295680 ?auto_295687 ) ) ( not ( = ?auto_295680 ?auto_295688 ) ) ( not ( = ?auto_295681 ?auto_295682 ) ) ( not ( = ?auto_295681 ?auto_295683 ) ) ( not ( = ?auto_295681 ?auto_295684 ) ) ( not ( = ?auto_295681 ?auto_295685 ) ) ( not ( = ?auto_295681 ?auto_295686 ) ) ( not ( = ?auto_295681 ?auto_295687 ) ) ( not ( = ?auto_295681 ?auto_295688 ) ) ( not ( = ?auto_295682 ?auto_295683 ) ) ( not ( = ?auto_295682 ?auto_295684 ) ) ( not ( = ?auto_295682 ?auto_295685 ) ) ( not ( = ?auto_295682 ?auto_295686 ) ) ( not ( = ?auto_295682 ?auto_295687 ) ) ( not ( = ?auto_295682 ?auto_295688 ) ) ( not ( = ?auto_295683 ?auto_295684 ) ) ( not ( = ?auto_295683 ?auto_295685 ) ) ( not ( = ?auto_295683 ?auto_295686 ) ) ( not ( = ?auto_295683 ?auto_295687 ) ) ( not ( = ?auto_295683 ?auto_295688 ) ) ( not ( = ?auto_295684 ?auto_295685 ) ) ( not ( = ?auto_295684 ?auto_295686 ) ) ( not ( = ?auto_295684 ?auto_295687 ) ) ( not ( = ?auto_295684 ?auto_295688 ) ) ( not ( = ?auto_295685 ?auto_295686 ) ) ( not ( = ?auto_295685 ?auto_295687 ) ) ( not ( = ?auto_295685 ?auto_295688 ) ) ( not ( = ?auto_295686 ?auto_295687 ) ) ( not ( = ?auto_295686 ?auto_295688 ) ) ( not ( = ?auto_295687 ?auto_295688 ) ) ( ON ?auto_295687 ?auto_295688 ) ( CLEAR ?auto_295685 ) ( ON ?auto_295686 ?auto_295687 ) ( CLEAR ?auto_295686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_295675 ?auto_295676 ?auto_295677 ?auto_295678 ?auto_295679 ?auto_295680 ?auto_295681 ?auto_295682 ?auto_295683 ?auto_295684 ?auto_295685 ?auto_295686 )
      ( MAKE-14PILE ?auto_295675 ?auto_295676 ?auto_295677 ?auto_295678 ?auto_295679 ?auto_295680 ?auto_295681 ?auto_295682 ?auto_295683 ?auto_295684 ?auto_295685 ?auto_295686 ?auto_295687 ?auto_295688 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295703 - BLOCK
      ?auto_295704 - BLOCK
      ?auto_295705 - BLOCK
      ?auto_295706 - BLOCK
      ?auto_295707 - BLOCK
      ?auto_295708 - BLOCK
      ?auto_295709 - BLOCK
      ?auto_295710 - BLOCK
      ?auto_295711 - BLOCK
      ?auto_295712 - BLOCK
      ?auto_295713 - BLOCK
      ?auto_295714 - BLOCK
      ?auto_295715 - BLOCK
      ?auto_295716 - BLOCK
    )
    :vars
    (
      ?auto_295717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295716 ?auto_295717 ) ( ON-TABLE ?auto_295703 ) ( ON ?auto_295704 ?auto_295703 ) ( ON ?auto_295705 ?auto_295704 ) ( ON ?auto_295706 ?auto_295705 ) ( ON ?auto_295707 ?auto_295706 ) ( ON ?auto_295708 ?auto_295707 ) ( ON ?auto_295709 ?auto_295708 ) ( ON ?auto_295710 ?auto_295709 ) ( ON ?auto_295711 ?auto_295710 ) ( ON ?auto_295712 ?auto_295711 ) ( not ( = ?auto_295703 ?auto_295704 ) ) ( not ( = ?auto_295703 ?auto_295705 ) ) ( not ( = ?auto_295703 ?auto_295706 ) ) ( not ( = ?auto_295703 ?auto_295707 ) ) ( not ( = ?auto_295703 ?auto_295708 ) ) ( not ( = ?auto_295703 ?auto_295709 ) ) ( not ( = ?auto_295703 ?auto_295710 ) ) ( not ( = ?auto_295703 ?auto_295711 ) ) ( not ( = ?auto_295703 ?auto_295712 ) ) ( not ( = ?auto_295703 ?auto_295713 ) ) ( not ( = ?auto_295703 ?auto_295714 ) ) ( not ( = ?auto_295703 ?auto_295715 ) ) ( not ( = ?auto_295703 ?auto_295716 ) ) ( not ( = ?auto_295703 ?auto_295717 ) ) ( not ( = ?auto_295704 ?auto_295705 ) ) ( not ( = ?auto_295704 ?auto_295706 ) ) ( not ( = ?auto_295704 ?auto_295707 ) ) ( not ( = ?auto_295704 ?auto_295708 ) ) ( not ( = ?auto_295704 ?auto_295709 ) ) ( not ( = ?auto_295704 ?auto_295710 ) ) ( not ( = ?auto_295704 ?auto_295711 ) ) ( not ( = ?auto_295704 ?auto_295712 ) ) ( not ( = ?auto_295704 ?auto_295713 ) ) ( not ( = ?auto_295704 ?auto_295714 ) ) ( not ( = ?auto_295704 ?auto_295715 ) ) ( not ( = ?auto_295704 ?auto_295716 ) ) ( not ( = ?auto_295704 ?auto_295717 ) ) ( not ( = ?auto_295705 ?auto_295706 ) ) ( not ( = ?auto_295705 ?auto_295707 ) ) ( not ( = ?auto_295705 ?auto_295708 ) ) ( not ( = ?auto_295705 ?auto_295709 ) ) ( not ( = ?auto_295705 ?auto_295710 ) ) ( not ( = ?auto_295705 ?auto_295711 ) ) ( not ( = ?auto_295705 ?auto_295712 ) ) ( not ( = ?auto_295705 ?auto_295713 ) ) ( not ( = ?auto_295705 ?auto_295714 ) ) ( not ( = ?auto_295705 ?auto_295715 ) ) ( not ( = ?auto_295705 ?auto_295716 ) ) ( not ( = ?auto_295705 ?auto_295717 ) ) ( not ( = ?auto_295706 ?auto_295707 ) ) ( not ( = ?auto_295706 ?auto_295708 ) ) ( not ( = ?auto_295706 ?auto_295709 ) ) ( not ( = ?auto_295706 ?auto_295710 ) ) ( not ( = ?auto_295706 ?auto_295711 ) ) ( not ( = ?auto_295706 ?auto_295712 ) ) ( not ( = ?auto_295706 ?auto_295713 ) ) ( not ( = ?auto_295706 ?auto_295714 ) ) ( not ( = ?auto_295706 ?auto_295715 ) ) ( not ( = ?auto_295706 ?auto_295716 ) ) ( not ( = ?auto_295706 ?auto_295717 ) ) ( not ( = ?auto_295707 ?auto_295708 ) ) ( not ( = ?auto_295707 ?auto_295709 ) ) ( not ( = ?auto_295707 ?auto_295710 ) ) ( not ( = ?auto_295707 ?auto_295711 ) ) ( not ( = ?auto_295707 ?auto_295712 ) ) ( not ( = ?auto_295707 ?auto_295713 ) ) ( not ( = ?auto_295707 ?auto_295714 ) ) ( not ( = ?auto_295707 ?auto_295715 ) ) ( not ( = ?auto_295707 ?auto_295716 ) ) ( not ( = ?auto_295707 ?auto_295717 ) ) ( not ( = ?auto_295708 ?auto_295709 ) ) ( not ( = ?auto_295708 ?auto_295710 ) ) ( not ( = ?auto_295708 ?auto_295711 ) ) ( not ( = ?auto_295708 ?auto_295712 ) ) ( not ( = ?auto_295708 ?auto_295713 ) ) ( not ( = ?auto_295708 ?auto_295714 ) ) ( not ( = ?auto_295708 ?auto_295715 ) ) ( not ( = ?auto_295708 ?auto_295716 ) ) ( not ( = ?auto_295708 ?auto_295717 ) ) ( not ( = ?auto_295709 ?auto_295710 ) ) ( not ( = ?auto_295709 ?auto_295711 ) ) ( not ( = ?auto_295709 ?auto_295712 ) ) ( not ( = ?auto_295709 ?auto_295713 ) ) ( not ( = ?auto_295709 ?auto_295714 ) ) ( not ( = ?auto_295709 ?auto_295715 ) ) ( not ( = ?auto_295709 ?auto_295716 ) ) ( not ( = ?auto_295709 ?auto_295717 ) ) ( not ( = ?auto_295710 ?auto_295711 ) ) ( not ( = ?auto_295710 ?auto_295712 ) ) ( not ( = ?auto_295710 ?auto_295713 ) ) ( not ( = ?auto_295710 ?auto_295714 ) ) ( not ( = ?auto_295710 ?auto_295715 ) ) ( not ( = ?auto_295710 ?auto_295716 ) ) ( not ( = ?auto_295710 ?auto_295717 ) ) ( not ( = ?auto_295711 ?auto_295712 ) ) ( not ( = ?auto_295711 ?auto_295713 ) ) ( not ( = ?auto_295711 ?auto_295714 ) ) ( not ( = ?auto_295711 ?auto_295715 ) ) ( not ( = ?auto_295711 ?auto_295716 ) ) ( not ( = ?auto_295711 ?auto_295717 ) ) ( not ( = ?auto_295712 ?auto_295713 ) ) ( not ( = ?auto_295712 ?auto_295714 ) ) ( not ( = ?auto_295712 ?auto_295715 ) ) ( not ( = ?auto_295712 ?auto_295716 ) ) ( not ( = ?auto_295712 ?auto_295717 ) ) ( not ( = ?auto_295713 ?auto_295714 ) ) ( not ( = ?auto_295713 ?auto_295715 ) ) ( not ( = ?auto_295713 ?auto_295716 ) ) ( not ( = ?auto_295713 ?auto_295717 ) ) ( not ( = ?auto_295714 ?auto_295715 ) ) ( not ( = ?auto_295714 ?auto_295716 ) ) ( not ( = ?auto_295714 ?auto_295717 ) ) ( not ( = ?auto_295715 ?auto_295716 ) ) ( not ( = ?auto_295715 ?auto_295717 ) ) ( not ( = ?auto_295716 ?auto_295717 ) ) ( ON ?auto_295715 ?auto_295716 ) ( ON ?auto_295714 ?auto_295715 ) ( CLEAR ?auto_295712 ) ( ON ?auto_295713 ?auto_295714 ) ( CLEAR ?auto_295713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_295703 ?auto_295704 ?auto_295705 ?auto_295706 ?auto_295707 ?auto_295708 ?auto_295709 ?auto_295710 ?auto_295711 ?auto_295712 ?auto_295713 )
      ( MAKE-14PILE ?auto_295703 ?auto_295704 ?auto_295705 ?auto_295706 ?auto_295707 ?auto_295708 ?auto_295709 ?auto_295710 ?auto_295711 ?auto_295712 ?auto_295713 ?auto_295714 ?auto_295715 ?auto_295716 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295732 - BLOCK
      ?auto_295733 - BLOCK
      ?auto_295734 - BLOCK
      ?auto_295735 - BLOCK
      ?auto_295736 - BLOCK
      ?auto_295737 - BLOCK
      ?auto_295738 - BLOCK
      ?auto_295739 - BLOCK
      ?auto_295740 - BLOCK
      ?auto_295741 - BLOCK
      ?auto_295742 - BLOCK
      ?auto_295743 - BLOCK
      ?auto_295744 - BLOCK
      ?auto_295745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295745 ) ( ON-TABLE ?auto_295732 ) ( ON ?auto_295733 ?auto_295732 ) ( ON ?auto_295734 ?auto_295733 ) ( ON ?auto_295735 ?auto_295734 ) ( ON ?auto_295736 ?auto_295735 ) ( ON ?auto_295737 ?auto_295736 ) ( ON ?auto_295738 ?auto_295737 ) ( ON ?auto_295739 ?auto_295738 ) ( ON ?auto_295740 ?auto_295739 ) ( ON ?auto_295741 ?auto_295740 ) ( not ( = ?auto_295732 ?auto_295733 ) ) ( not ( = ?auto_295732 ?auto_295734 ) ) ( not ( = ?auto_295732 ?auto_295735 ) ) ( not ( = ?auto_295732 ?auto_295736 ) ) ( not ( = ?auto_295732 ?auto_295737 ) ) ( not ( = ?auto_295732 ?auto_295738 ) ) ( not ( = ?auto_295732 ?auto_295739 ) ) ( not ( = ?auto_295732 ?auto_295740 ) ) ( not ( = ?auto_295732 ?auto_295741 ) ) ( not ( = ?auto_295732 ?auto_295742 ) ) ( not ( = ?auto_295732 ?auto_295743 ) ) ( not ( = ?auto_295732 ?auto_295744 ) ) ( not ( = ?auto_295732 ?auto_295745 ) ) ( not ( = ?auto_295733 ?auto_295734 ) ) ( not ( = ?auto_295733 ?auto_295735 ) ) ( not ( = ?auto_295733 ?auto_295736 ) ) ( not ( = ?auto_295733 ?auto_295737 ) ) ( not ( = ?auto_295733 ?auto_295738 ) ) ( not ( = ?auto_295733 ?auto_295739 ) ) ( not ( = ?auto_295733 ?auto_295740 ) ) ( not ( = ?auto_295733 ?auto_295741 ) ) ( not ( = ?auto_295733 ?auto_295742 ) ) ( not ( = ?auto_295733 ?auto_295743 ) ) ( not ( = ?auto_295733 ?auto_295744 ) ) ( not ( = ?auto_295733 ?auto_295745 ) ) ( not ( = ?auto_295734 ?auto_295735 ) ) ( not ( = ?auto_295734 ?auto_295736 ) ) ( not ( = ?auto_295734 ?auto_295737 ) ) ( not ( = ?auto_295734 ?auto_295738 ) ) ( not ( = ?auto_295734 ?auto_295739 ) ) ( not ( = ?auto_295734 ?auto_295740 ) ) ( not ( = ?auto_295734 ?auto_295741 ) ) ( not ( = ?auto_295734 ?auto_295742 ) ) ( not ( = ?auto_295734 ?auto_295743 ) ) ( not ( = ?auto_295734 ?auto_295744 ) ) ( not ( = ?auto_295734 ?auto_295745 ) ) ( not ( = ?auto_295735 ?auto_295736 ) ) ( not ( = ?auto_295735 ?auto_295737 ) ) ( not ( = ?auto_295735 ?auto_295738 ) ) ( not ( = ?auto_295735 ?auto_295739 ) ) ( not ( = ?auto_295735 ?auto_295740 ) ) ( not ( = ?auto_295735 ?auto_295741 ) ) ( not ( = ?auto_295735 ?auto_295742 ) ) ( not ( = ?auto_295735 ?auto_295743 ) ) ( not ( = ?auto_295735 ?auto_295744 ) ) ( not ( = ?auto_295735 ?auto_295745 ) ) ( not ( = ?auto_295736 ?auto_295737 ) ) ( not ( = ?auto_295736 ?auto_295738 ) ) ( not ( = ?auto_295736 ?auto_295739 ) ) ( not ( = ?auto_295736 ?auto_295740 ) ) ( not ( = ?auto_295736 ?auto_295741 ) ) ( not ( = ?auto_295736 ?auto_295742 ) ) ( not ( = ?auto_295736 ?auto_295743 ) ) ( not ( = ?auto_295736 ?auto_295744 ) ) ( not ( = ?auto_295736 ?auto_295745 ) ) ( not ( = ?auto_295737 ?auto_295738 ) ) ( not ( = ?auto_295737 ?auto_295739 ) ) ( not ( = ?auto_295737 ?auto_295740 ) ) ( not ( = ?auto_295737 ?auto_295741 ) ) ( not ( = ?auto_295737 ?auto_295742 ) ) ( not ( = ?auto_295737 ?auto_295743 ) ) ( not ( = ?auto_295737 ?auto_295744 ) ) ( not ( = ?auto_295737 ?auto_295745 ) ) ( not ( = ?auto_295738 ?auto_295739 ) ) ( not ( = ?auto_295738 ?auto_295740 ) ) ( not ( = ?auto_295738 ?auto_295741 ) ) ( not ( = ?auto_295738 ?auto_295742 ) ) ( not ( = ?auto_295738 ?auto_295743 ) ) ( not ( = ?auto_295738 ?auto_295744 ) ) ( not ( = ?auto_295738 ?auto_295745 ) ) ( not ( = ?auto_295739 ?auto_295740 ) ) ( not ( = ?auto_295739 ?auto_295741 ) ) ( not ( = ?auto_295739 ?auto_295742 ) ) ( not ( = ?auto_295739 ?auto_295743 ) ) ( not ( = ?auto_295739 ?auto_295744 ) ) ( not ( = ?auto_295739 ?auto_295745 ) ) ( not ( = ?auto_295740 ?auto_295741 ) ) ( not ( = ?auto_295740 ?auto_295742 ) ) ( not ( = ?auto_295740 ?auto_295743 ) ) ( not ( = ?auto_295740 ?auto_295744 ) ) ( not ( = ?auto_295740 ?auto_295745 ) ) ( not ( = ?auto_295741 ?auto_295742 ) ) ( not ( = ?auto_295741 ?auto_295743 ) ) ( not ( = ?auto_295741 ?auto_295744 ) ) ( not ( = ?auto_295741 ?auto_295745 ) ) ( not ( = ?auto_295742 ?auto_295743 ) ) ( not ( = ?auto_295742 ?auto_295744 ) ) ( not ( = ?auto_295742 ?auto_295745 ) ) ( not ( = ?auto_295743 ?auto_295744 ) ) ( not ( = ?auto_295743 ?auto_295745 ) ) ( not ( = ?auto_295744 ?auto_295745 ) ) ( ON ?auto_295744 ?auto_295745 ) ( ON ?auto_295743 ?auto_295744 ) ( CLEAR ?auto_295741 ) ( ON ?auto_295742 ?auto_295743 ) ( CLEAR ?auto_295742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_295732 ?auto_295733 ?auto_295734 ?auto_295735 ?auto_295736 ?auto_295737 ?auto_295738 ?auto_295739 ?auto_295740 ?auto_295741 ?auto_295742 )
      ( MAKE-14PILE ?auto_295732 ?auto_295733 ?auto_295734 ?auto_295735 ?auto_295736 ?auto_295737 ?auto_295738 ?auto_295739 ?auto_295740 ?auto_295741 ?auto_295742 ?auto_295743 ?auto_295744 ?auto_295745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295760 - BLOCK
      ?auto_295761 - BLOCK
      ?auto_295762 - BLOCK
      ?auto_295763 - BLOCK
      ?auto_295764 - BLOCK
      ?auto_295765 - BLOCK
      ?auto_295766 - BLOCK
      ?auto_295767 - BLOCK
      ?auto_295768 - BLOCK
      ?auto_295769 - BLOCK
      ?auto_295770 - BLOCK
      ?auto_295771 - BLOCK
      ?auto_295772 - BLOCK
      ?auto_295773 - BLOCK
    )
    :vars
    (
      ?auto_295774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295773 ?auto_295774 ) ( ON-TABLE ?auto_295760 ) ( ON ?auto_295761 ?auto_295760 ) ( ON ?auto_295762 ?auto_295761 ) ( ON ?auto_295763 ?auto_295762 ) ( ON ?auto_295764 ?auto_295763 ) ( ON ?auto_295765 ?auto_295764 ) ( ON ?auto_295766 ?auto_295765 ) ( ON ?auto_295767 ?auto_295766 ) ( ON ?auto_295768 ?auto_295767 ) ( not ( = ?auto_295760 ?auto_295761 ) ) ( not ( = ?auto_295760 ?auto_295762 ) ) ( not ( = ?auto_295760 ?auto_295763 ) ) ( not ( = ?auto_295760 ?auto_295764 ) ) ( not ( = ?auto_295760 ?auto_295765 ) ) ( not ( = ?auto_295760 ?auto_295766 ) ) ( not ( = ?auto_295760 ?auto_295767 ) ) ( not ( = ?auto_295760 ?auto_295768 ) ) ( not ( = ?auto_295760 ?auto_295769 ) ) ( not ( = ?auto_295760 ?auto_295770 ) ) ( not ( = ?auto_295760 ?auto_295771 ) ) ( not ( = ?auto_295760 ?auto_295772 ) ) ( not ( = ?auto_295760 ?auto_295773 ) ) ( not ( = ?auto_295760 ?auto_295774 ) ) ( not ( = ?auto_295761 ?auto_295762 ) ) ( not ( = ?auto_295761 ?auto_295763 ) ) ( not ( = ?auto_295761 ?auto_295764 ) ) ( not ( = ?auto_295761 ?auto_295765 ) ) ( not ( = ?auto_295761 ?auto_295766 ) ) ( not ( = ?auto_295761 ?auto_295767 ) ) ( not ( = ?auto_295761 ?auto_295768 ) ) ( not ( = ?auto_295761 ?auto_295769 ) ) ( not ( = ?auto_295761 ?auto_295770 ) ) ( not ( = ?auto_295761 ?auto_295771 ) ) ( not ( = ?auto_295761 ?auto_295772 ) ) ( not ( = ?auto_295761 ?auto_295773 ) ) ( not ( = ?auto_295761 ?auto_295774 ) ) ( not ( = ?auto_295762 ?auto_295763 ) ) ( not ( = ?auto_295762 ?auto_295764 ) ) ( not ( = ?auto_295762 ?auto_295765 ) ) ( not ( = ?auto_295762 ?auto_295766 ) ) ( not ( = ?auto_295762 ?auto_295767 ) ) ( not ( = ?auto_295762 ?auto_295768 ) ) ( not ( = ?auto_295762 ?auto_295769 ) ) ( not ( = ?auto_295762 ?auto_295770 ) ) ( not ( = ?auto_295762 ?auto_295771 ) ) ( not ( = ?auto_295762 ?auto_295772 ) ) ( not ( = ?auto_295762 ?auto_295773 ) ) ( not ( = ?auto_295762 ?auto_295774 ) ) ( not ( = ?auto_295763 ?auto_295764 ) ) ( not ( = ?auto_295763 ?auto_295765 ) ) ( not ( = ?auto_295763 ?auto_295766 ) ) ( not ( = ?auto_295763 ?auto_295767 ) ) ( not ( = ?auto_295763 ?auto_295768 ) ) ( not ( = ?auto_295763 ?auto_295769 ) ) ( not ( = ?auto_295763 ?auto_295770 ) ) ( not ( = ?auto_295763 ?auto_295771 ) ) ( not ( = ?auto_295763 ?auto_295772 ) ) ( not ( = ?auto_295763 ?auto_295773 ) ) ( not ( = ?auto_295763 ?auto_295774 ) ) ( not ( = ?auto_295764 ?auto_295765 ) ) ( not ( = ?auto_295764 ?auto_295766 ) ) ( not ( = ?auto_295764 ?auto_295767 ) ) ( not ( = ?auto_295764 ?auto_295768 ) ) ( not ( = ?auto_295764 ?auto_295769 ) ) ( not ( = ?auto_295764 ?auto_295770 ) ) ( not ( = ?auto_295764 ?auto_295771 ) ) ( not ( = ?auto_295764 ?auto_295772 ) ) ( not ( = ?auto_295764 ?auto_295773 ) ) ( not ( = ?auto_295764 ?auto_295774 ) ) ( not ( = ?auto_295765 ?auto_295766 ) ) ( not ( = ?auto_295765 ?auto_295767 ) ) ( not ( = ?auto_295765 ?auto_295768 ) ) ( not ( = ?auto_295765 ?auto_295769 ) ) ( not ( = ?auto_295765 ?auto_295770 ) ) ( not ( = ?auto_295765 ?auto_295771 ) ) ( not ( = ?auto_295765 ?auto_295772 ) ) ( not ( = ?auto_295765 ?auto_295773 ) ) ( not ( = ?auto_295765 ?auto_295774 ) ) ( not ( = ?auto_295766 ?auto_295767 ) ) ( not ( = ?auto_295766 ?auto_295768 ) ) ( not ( = ?auto_295766 ?auto_295769 ) ) ( not ( = ?auto_295766 ?auto_295770 ) ) ( not ( = ?auto_295766 ?auto_295771 ) ) ( not ( = ?auto_295766 ?auto_295772 ) ) ( not ( = ?auto_295766 ?auto_295773 ) ) ( not ( = ?auto_295766 ?auto_295774 ) ) ( not ( = ?auto_295767 ?auto_295768 ) ) ( not ( = ?auto_295767 ?auto_295769 ) ) ( not ( = ?auto_295767 ?auto_295770 ) ) ( not ( = ?auto_295767 ?auto_295771 ) ) ( not ( = ?auto_295767 ?auto_295772 ) ) ( not ( = ?auto_295767 ?auto_295773 ) ) ( not ( = ?auto_295767 ?auto_295774 ) ) ( not ( = ?auto_295768 ?auto_295769 ) ) ( not ( = ?auto_295768 ?auto_295770 ) ) ( not ( = ?auto_295768 ?auto_295771 ) ) ( not ( = ?auto_295768 ?auto_295772 ) ) ( not ( = ?auto_295768 ?auto_295773 ) ) ( not ( = ?auto_295768 ?auto_295774 ) ) ( not ( = ?auto_295769 ?auto_295770 ) ) ( not ( = ?auto_295769 ?auto_295771 ) ) ( not ( = ?auto_295769 ?auto_295772 ) ) ( not ( = ?auto_295769 ?auto_295773 ) ) ( not ( = ?auto_295769 ?auto_295774 ) ) ( not ( = ?auto_295770 ?auto_295771 ) ) ( not ( = ?auto_295770 ?auto_295772 ) ) ( not ( = ?auto_295770 ?auto_295773 ) ) ( not ( = ?auto_295770 ?auto_295774 ) ) ( not ( = ?auto_295771 ?auto_295772 ) ) ( not ( = ?auto_295771 ?auto_295773 ) ) ( not ( = ?auto_295771 ?auto_295774 ) ) ( not ( = ?auto_295772 ?auto_295773 ) ) ( not ( = ?auto_295772 ?auto_295774 ) ) ( not ( = ?auto_295773 ?auto_295774 ) ) ( ON ?auto_295772 ?auto_295773 ) ( ON ?auto_295771 ?auto_295772 ) ( ON ?auto_295770 ?auto_295771 ) ( CLEAR ?auto_295768 ) ( ON ?auto_295769 ?auto_295770 ) ( CLEAR ?auto_295769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_295760 ?auto_295761 ?auto_295762 ?auto_295763 ?auto_295764 ?auto_295765 ?auto_295766 ?auto_295767 ?auto_295768 ?auto_295769 )
      ( MAKE-14PILE ?auto_295760 ?auto_295761 ?auto_295762 ?auto_295763 ?auto_295764 ?auto_295765 ?auto_295766 ?auto_295767 ?auto_295768 ?auto_295769 ?auto_295770 ?auto_295771 ?auto_295772 ?auto_295773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295789 - BLOCK
      ?auto_295790 - BLOCK
      ?auto_295791 - BLOCK
      ?auto_295792 - BLOCK
      ?auto_295793 - BLOCK
      ?auto_295794 - BLOCK
      ?auto_295795 - BLOCK
      ?auto_295796 - BLOCK
      ?auto_295797 - BLOCK
      ?auto_295798 - BLOCK
      ?auto_295799 - BLOCK
      ?auto_295800 - BLOCK
      ?auto_295801 - BLOCK
      ?auto_295802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295802 ) ( ON-TABLE ?auto_295789 ) ( ON ?auto_295790 ?auto_295789 ) ( ON ?auto_295791 ?auto_295790 ) ( ON ?auto_295792 ?auto_295791 ) ( ON ?auto_295793 ?auto_295792 ) ( ON ?auto_295794 ?auto_295793 ) ( ON ?auto_295795 ?auto_295794 ) ( ON ?auto_295796 ?auto_295795 ) ( ON ?auto_295797 ?auto_295796 ) ( not ( = ?auto_295789 ?auto_295790 ) ) ( not ( = ?auto_295789 ?auto_295791 ) ) ( not ( = ?auto_295789 ?auto_295792 ) ) ( not ( = ?auto_295789 ?auto_295793 ) ) ( not ( = ?auto_295789 ?auto_295794 ) ) ( not ( = ?auto_295789 ?auto_295795 ) ) ( not ( = ?auto_295789 ?auto_295796 ) ) ( not ( = ?auto_295789 ?auto_295797 ) ) ( not ( = ?auto_295789 ?auto_295798 ) ) ( not ( = ?auto_295789 ?auto_295799 ) ) ( not ( = ?auto_295789 ?auto_295800 ) ) ( not ( = ?auto_295789 ?auto_295801 ) ) ( not ( = ?auto_295789 ?auto_295802 ) ) ( not ( = ?auto_295790 ?auto_295791 ) ) ( not ( = ?auto_295790 ?auto_295792 ) ) ( not ( = ?auto_295790 ?auto_295793 ) ) ( not ( = ?auto_295790 ?auto_295794 ) ) ( not ( = ?auto_295790 ?auto_295795 ) ) ( not ( = ?auto_295790 ?auto_295796 ) ) ( not ( = ?auto_295790 ?auto_295797 ) ) ( not ( = ?auto_295790 ?auto_295798 ) ) ( not ( = ?auto_295790 ?auto_295799 ) ) ( not ( = ?auto_295790 ?auto_295800 ) ) ( not ( = ?auto_295790 ?auto_295801 ) ) ( not ( = ?auto_295790 ?auto_295802 ) ) ( not ( = ?auto_295791 ?auto_295792 ) ) ( not ( = ?auto_295791 ?auto_295793 ) ) ( not ( = ?auto_295791 ?auto_295794 ) ) ( not ( = ?auto_295791 ?auto_295795 ) ) ( not ( = ?auto_295791 ?auto_295796 ) ) ( not ( = ?auto_295791 ?auto_295797 ) ) ( not ( = ?auto_295791 ?auto_295798 ) ) ( not ( = ?auto_295791 ?auto_295799 ) ) ( not ( = ?auto_295791 ?auto_295800 ) ) ( not ( = ?auto_295791 ?auto_295801 ) ) ( not ( = ?auto_295791 ?auto_295802 ) ) ( not ( = ?auto_295792 ?auto_295793 ) ) ( not ( = ?auto_295792 ?auto_295794 ) ) ( not ( = ?auto_295792 ?auto_295795 ) ) ( not ( = ?auto_295792 ?auto_295796 ) ) ( not ( = ?auto_295792 ?auto_295797 ) ) ( not ( = ?auto_295792 ?auto_295798 ) ) ( not ( = ?auto_295792 ?auto_295799 ) ) ( not ( = ?auto_295792 ?auto_295800 ) ) ( not ( = ?auto_295792 ?auto_295801 ) ) ( not ( = ?auto_295792 ?auto_295802 ) ) ( not ( = ?auto_295793 ?auto_295794 ) ) ( not ( = ?auto_295793 ?auto_295795 ) ) ( not ( = ?auto_295793 ?auto_295796 ) ) ( not ( = ?auto_295793 ?auto_295797 ) ) ( not ( = ?auto_295793 ?auto_295798 ) ) ( not ( = ?auto_295793 ?auto_295799 ) ) ( not ( = ?auto_295793 ?auto_295800 ) ) ( not ( = ?auto_295793 ?auto_295801 ) ) ( not ( = ?auto_295793 ?auto_295802 ) ) ( not ( = ?auto_295794 ?auto_295795 ) ) ( not ( = ?auto_295794 ?auto_295796 ) ) ( not ( = ?auto_295794 ?auto_295797 ) ) ( not ( = ?auto_295794 ?auto_295798 ) ) ( not ( = ?auto_295794 ?auto_295799 ) ) ( not ( = ?auto_295794 ?auto_295800 ) ) ( not ( = ?auto_295794 ?auto_295801 ) ) ( not ( = ?auto_295794 ?auto_295802 ) ) ( not ( = ?auto_295795 ?auto_295796 ) ) ( not ( = ?auto_295795 ?auto_295797 ) ) ( not ( = ?auto_295795 ?auto_295798 ) ) ( not ( = ?auto_295795 ?auto_295799 ) ) ( not ( = ?auto_295795 ?auto_295800 ) ) ( not ( = ?auto_295795 ?auto_295801 ) ) ( not ( = ?auto_295795 ?auto_295802 ) ) ( not ( = ?auto_295796 ?auto_295797 ) ) ( not ( = ?auto_295796 ?auto_295798 ) ) ( not ( = ?auto_295796 ?auto_295799 ) ) ( not ( = ?auto_295796 ?auto_295800 ) ) ( not ( = ?auto_295796 ?auto_295801 ) ) ( not ( = ?auto_295796 ?auto_295802 ) ) ( not ( = ?auto_295797 ?auto_295798 ) ) ( not ( = ?auto_295797 ?auto_295799 ) ) ( not ( = ?auto_295797 ?auto_295800 ) ) ( not ( = ?auto_295797 ?auto_295801 ) ) ( not ( = ?auto_295797 ?auto_295802 ) ) ( not ( = ?auto_295798 ?auto_295799 ) ) ( not ( = ?auto_295798 ?auto_295800 ) ) ( not ( = ?auto_295798 ?auto_295801 ) ) ( not ( = ?auto_295798 ?auto_295802 ) ) ( not ( = ?auto_295799 ?auto_295800 ) ) ( not ( = ?auto_295799 ?auto_295801 ) ) ( not ( = ?auto_295799 ?auto_295802 ) ) ( not ( = ?auto_295800 ?auto_295801 ) ) ( not ( = ?auto_295800 ?auto_295802 ) ) ( not ( = ?auto_295801 ?auto_295802 ) ) ( ON ?auto_295801 ?auto_295802 ) ( ON ?auto_295800 ?auto_295801 ) ( ON ?auto_295799 ?auto_295800 ) ( CLEAR ?auto_295797 ) ( ON ?auto_295798 ?auto_295799 ) ( CLEAR ?auto_295798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_295789 ?auto_295790 ?auto_295791 ?auto_295792 ?auto_295793 ?auto_295794 ?auto_295795 ?auto_295796 ?auto_295797 ?auto_295798 )
      ( MAKE-14PILE ?auto_295789 ?auto_295790 ?auto_295791 ?auto_295792 ?auto_295793 ?auto_295794 ?auto_295795 ?auto_295796 ?auto_295797 ?auto_295798 ?auto_295799 ?auto_295800 ?auto_295801 ?auto_295802 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295817 - BLOCK
      ?auto_295818 - BLOCK
      ?auto_295819 - BLOCK
      ?auto_295820 - BLOCK
      ?auto_295821 - BLOCK
      ?auto_295822 - BLOCK
      ?auto_295823 - BLOCK
      ?auto_295824 - BLOCK
      ?auto_295825 - BLOCK
      ?auto_295826 - BLOCK
      ?auto_295827 - BLOCK
      ?auto_295828 - BLOCK
      ?auto_295829 - BLOCK
      ?auto_295830 - BLOCK
    )
    :vars
    (
      ?auto_295831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295830 ?auto_295831 ) ( ON-TABLE ?auto_295817 ) ( ON ?auto_295818 ?auto_295817 ) ( ON ?auto_295819 ?auto_295818 ) ( ON ?auto_295820 ?auto_295819 ) ( ON ?auto_295821 ?auto_295820 ) ( ON ?auto_295822 ?auto_295821 ) ( ON ?auto_295823 ?auto_295822 ) ( ON ?auto_295824 ?auto_295823 ) ( not ( = ?auto_295817 ?auto_295818 ) ) ( not ( = ?auto_295817 ?auto_295819 ) ) ( not ( = ?auto_295817 ?auto_295820 ) ) ( not ( = ?auto_295817 ?auto_295821 ) ) ( not ( = ?auto_295817 ?auto_295822 ) ) ( not ( = ?auto_295817 ?auto_295823 ) ) ( not ( = ?auto_295817 ?auto_295824 ) ) ( not ( = ?auto_295817 ?auto_295825 ) ) ( not ( = ?auto_295817 ?auto_295826 ) ) ( not ( = ?auto_295817 ?auto_295827 ) ) ( not ( = ?auto_295817 ?auto_295828 ) ) ( not ( = ?auto_295817 ?auto_295829 ) ) ( not ( = ?auto_295817 ?auto_295830 ) ) ( not ( = ?auto_295817 ?auto_295831 ) ) ( not ( = ?auto_295818 ?auto_295819 ) ) ( not ( = ?auto_295818 ?auto_295820 ) ) ( not ( = ?auto_295818 ?auto_295821 ) ) ( not ( = ?auto_295818 ?auto_295822 ) ) ( not ( = ?auto_295818 ?auto_295823 ) ) ( not ( = ?auto_295818 ?auto_295824 ) ) ( not ( = ?auto_295818 ?auto_295825 ) ) ( not ( = ?auto_295818 ?auto_295826 ) ) ( not ( = ?auto_295818 ?auto_295827 ) ) ( not ( = ?auto_295818 ?auto_295828 ) ) ( not ( = ?auto_295818 ?auto_295829 ) ) ( not ( = ?auto_295818 ?auto_295830 ) ) ( not ( = ?auto_295818 ?auto_295831 ) ) ( not ( = ?auto_295819 ?auto_295820 ) ) ( not ( = ?auto_295819 ?auto_295821 ) ) ( not ( = ?auto_295819 ?auto_295822 ) ) ( not ( = ?auto_295819 ?auto_295823 ) ) ( not ( = ?auto_295819 ?auto_295824 ) ) ( not ( = ?auto_295819 ?auto_295825 ) ) ( not ( = ?auto_295819 ?auto_295826 ) ) ( not ( = ?auto_295819 ?auto_295827 ) ) ( not ( = ?auto_295819 ?auto_295828 ) ) ( not ( = ?auto_295819 ?auto_295829 ) ) ( not ( = ?auto_295819 ?auto_295830 ) ) ( not ( = ?auto_295819 ?auto_295831 ) ) ( not ( = ?auto_295820 ?auto_295821 ) ) ( not ( = ?auto_295820 ?auto_295822 ) ) ( not ( = ?auto_295820 ?auto_295823 ) ) ( not ( = ?auto_295820 ?auto_295824 ) ) ( not ( = ?auto_295820 ?auto_295825 ) ) ( not ( = ?auto_295820 ?auto_295826 ) ) ( not ( = ?auto_295820 ?auto_295827 ) ) ( not ( = ?auto_295820 ?auto_295828 ) ) ( not ( = ?auto_295820 ?auto_295829 ) ) ( not ( = ?auto_295820 ?auto_295830 ) ) ( not ( = ?auto_295820 ?auto_295831 ) ) ( not ( = ?auto_295821 ?auto_295822 ) ) ( not ( = ?auto_295821 ?auto_295823 ) ) ( not ( = ?auto_295821 ?auto_295824 ) ) ( not ( = ?auto_295821 ?auto_295825 ) ) ( not ( = ?auto_295821 ?auto_295826 ) ) ( not ( = ?auto_295821 ?auto_295827 ) ) ( not ( = ?auto_295821 ?auto_295828 ) ) ( not ( = ?auto_295821 ?auto_295829 ) ) ( not ( = ?auto_295821 ?auto_295830 ) ) ( not ( = ?auto_295821 ?auto_295831 ) ) ( not ( = ?auto_295822 ?auto_295823 ) ) ( not ( = ?auto_295822 ?auto_295824 ) ) ( not ( = ?auto_295822 ?auto_295825 ) ) ( not ( = ?auto_295822 ?auto_295826 ) ) ( not ( = ?auto_295822 ?auto_295827 ) ) ( not ( = ?auto_295822 ?auto_295828 ) ) ( not ( = ?auto_295822 ?auto_295829 ) ) ( not ( = ?auto_295822 ?auto_295830 ) ) ( not ( = ?auto_295822 ?auto_295831 ) ) ( not ( = ?auto_295823 ?auto_295824 ) ) ( not ( = ?auto_295823 ?auto_295825 ) ) ( not ( = ?auto_295823 ?auto_295826 ) ) ( not ( = ?auto_295823 ?auto_295827 ) ) ( not ( = ?auto_295823 ?auto_295828 ) ) ( not ( = ?auto_295823 ?auto_295829 ) ) ( not ( = ?auto_295823 ?auto_295830 ) ) ( not ( = ?auto_295823 ?auto_295831 ) ) ( not ( = ?auto_295824 ?auto_295825 ) ) ( not ( = ?auto_295824 ?auto_295826 ) ) ( not ( = ?auto_295824 ?auto_295827 ) ) ( not ( = ?auto_295824 ?auto_295828 ) ) ( not ( = ?auto_295824 ?auto_295829 ) ) ( not ( = ?auto_295824 ?auto_295830 ) ) ( not ( = ?auto_295824 ?auto_295831 ) ) ( not ( = ?auto_295825 ?auto_295826 ) ) ( not ( = ?auto_295825 ?auto_295827 ) ) ( not ( = ?auto_295825 ?auto_295828 ) ) ( not ( = ?auto_295825 ?auto_295829 ) ) ( not ( = ?auto_295825 ?auto_295830 ) ) ( not ( = ?auto_295825 ?auto_295831 ) ) ( not ( = ?auto_295826 ?auto_295827 ) ) ( not ( = ?auto_295826 ?auto_295828 ) ) ( not ( = ?auto_295826 ?auto_295829 ) ) ( not ( = ?auto_295826 ?auto_295830 ) ) ( not ( = ?auto_295826 ?auto_295831 ) ) ( not ( = ?auto_295827 ?auto_295828 ) ) ( not ( = ?auto_295827 ?auto_295829 ) ) ( not ( = ?auto_295827 ?auto_295830 ) ) ( not ( = ?auto_295827 ?auto_295831 ) ) ( not ( = ?auto_295828 ?auto_295829 ) ) ( not ( = ?auto_295828 ?auto_295830 ) ) ( not ( = ?auto_295828 ?auto_295831 ) ) ( not ( = ?auto_295829 ?auto_295830 ) ) ( not ( = ?auto_295829 ?auto_295831 ) ) ( not ( = ?auto_295830 ?auto_295831 ) ) ( ON ?auto_295829 ?auto_295830 ) ( ON ?auto_295828 ?auto_295829 ) ( ON ?auto_295827 ?auto_295828 ) ( ON ?auto_295826 ?auto_295827 ) ( CLEAR ?auto_295824 ) ( ON ?auto_295825 ?auto_295826 ) ( CLEAR ?auto_295825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_295817 ?auto_295818 ?auto_295819 ?auto_295820 ?auto_295821 ?auto_295822 ?auto_295823 ?auto_295824 ?auto_295825 )
      ( MAKE-14PILE ?auto_295817 ?auto_295818 ?auto_295819 ?auto_295820 ?auto_295821 ?auto_295822 ?auto_295823 ?auto_295824 ?auto_295825 ?auto_295826 ?auto_295827 ?auto_295828 ?auto_295829 ?auto_295830 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295846 - BLOCK
      ?auto_295847 - BLOCK
      ?auto_295848 - BLOCK
      ?auto_295849 - BLOCK
      ?auto_295850 - BLOCK
      ?auto_295851 - BLOCK
      ?auto_295852 - BLOCK
      ?auto_295853 - BLOCK
      ?auto_295854 - BLOCK
      ?auto_295855 - BLOCK
      ?auto_295856 - BLOCK
      ?auto_295857 - BLOCK
      ?auto_295858 - BLOCK
      ?auto_295859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295859 ) ( ON-TABLE ?auto_295846 ) ( ON ?auto_295847 ?auto_295846 ) ( ON ?auto_295848 ?auto_295847 ) ( ON ?auto_295849 ?auto_295848 ) ( ON ?auto_295850 ?auto_295849 ) ( ON ?auto_295851 ?auto_295850 ) ( ON ?auto_295852 ?auto_295851 ) ( ON ?auto_295853 ?auto_295852 ) ( not ( = ?auto_295846 ?auto_295847 ) ) ( not ( = ?auto_295846 ?auto_295848 ) ) ( not ( = ?auto_295846 ?auto_295849 ) ) ( not ( = ?auto_295846 ?auto_295850 ) ) ( not ( = ?auto_295846 ?auto_295851 ) ) ( not ( = ?auto_295846 ?auto_295852 ) ) ( not ( = ?auto_295846 ?auto_295853 ) ) ( not ( = ?auto_295846 ?auto_295854 ) ) ( not ( = ?auto_295846 ?auto_295855 ) ) ( not ( = ?auto_295846 ?auto_295856 ) ) ( not ( = ?auto_295846 ?auto_295857 ) ) ( not ( = ?auto_295846 ?auto_295858 ) ) ( not ( = ?auto_295846 ?auto_295859 ) ) ( not ( = ?auto_295847 ?auto_295848 ) ) ( not ( = ?auto_295847 ?auto_295849 ) ) ( not ( = ?auto_295847 ?auto_295850 ) ) ( not ( = ?auto_295847 ?auto_295851 ) ) ( not ( = ?auto_295847 ?auto_295852 ) ) ( not ( = ?auto_295847 ?auto_295853 ) ) ( not ( = ?auto_295847 ?auto_295854 ) ) ( not ( = ?auto_295847 ?auto_295855 ) ) ( not ( = ?auto_295847 ?auto_295856 ) ) ( not ( = ?auto_295847 ?auto_295857 ) ) ( not ( = ?auto_295847 ?auto_295858 ) ) ( not ( = ?auto_295847 ?auto_295859 ) ) ( not ( = ?auto_295848 ?auto_295849 ) ) ( not ( = ?auto_295848 ?auto_295850 ) ) ( not ( = ?auto_295848 ?auto_295851 ) ) ( not ( = ?auto_295848 ?auto_295852 ) ) ( not ( = ?auto_295848 ?auto_295853 ) ) ( not ( = ?auto_295848 ?auto_295854 ) ) ( not ( = ?auto_295848 ?auto_295855 ) ) ( not ( = ?auto_295848 ?auto_295856 ) ) ( not ( = ?auto_295848 ?auto_295857 ) ) ( not ( = ?auto_295848 ?auto_295858 ) ) ( not ( = ?auto_295848 ?auto_295859 ) ) ( not ( = ?auto_295849 ?auto_295850 ) ) ( not ( = ?auto_295849 ?auto_295851 ) ) ( not ( = ?auto_295849 ?auto_295852 ) ) ( not ( = ?auto_295849 ?auto_295853 ) ) ( not ( = ?auto_295849 ?auto_295854 ) ) ( not ( = ?auto_295849 ?auto_295855 ) ) ( not ( = ?auto_295849 ?auto_295856 ) ) ( not ( = ?auto_295849 ?auto_295857 ) ) ( not ( = ?auto_295849 ?auto_295858 ) ) ( not ( = ?auto_295849 ?auto_295859 ) ) ( not ( = ?auto_295850 ?auto_295851 ) ) ( not ( = ?auto_295850 ?auto_295852 ) ) ( not ( = ?auto_295850 ?auto_295853 ) ) ( not ( = ?auto_295850 ?auto_295854 ) ) ( not ( = ?auto_295850 ?auto_295855 ) ) ( not ( = ?auto_295850 ?auto_295856 ) ) ( not ( = ?auto_295850 ?auto_295857 ) ) ( not ( = ?auto_295850 ?auto_295858 ) ) ( not ( = ?auto_295850 ?auto_295859 ) ) ( not ( = ?auto_295851 ?auto_295852 ) ) ( not ( = ?auto_295851 ?auto_295853 ) ) ( not ( = ?auto_295851 ?auto_295854 ) ) ( not ( = ?auto_295851 ?auto_295855 ) ) ( not ( = ?auto_295851 ?auto_295856 ) ) ( not ( = ?auto_295851 ?auto_295857 ) ) ( not ( = ?auto_295851 ?auto_295858 ) ) ( not ( = ?auto_295851 ?auto_295859 ) ) ( not ( = ?auto_295852 ?auto_295853 ) ) ( not ( = ?auto_295852 ?auto_295854 ) ) ( not ( = ?auto_295852 ?auto_295855 ) ) ( not ( = ?auto_295852 ?auto_295856 ) ) ( not ( = ?auto_295852 ?auto_295857 ) ) ( not ( = ?auto_295852 ?auto_295858 ) ) ( not ( = ?auto_295852 ?auto_295859 ) ) ( not ( = ?auto_295853 ?auto_295854 ) ) ( not ( = ?auto_295853 ?auto_295855 ) ) ( not ( = ?auto_295853 ?auto_295856 ) ) ( not ( = ?auto_295853 ?auto_295857 ) ) ( not ( = ?auto_295853 ?auto_295858 ) ) ( not ( = ?auto_295853 ?auto_295859 ) ) ( not ( = ?auto_295854 ?auto_295855 ) ) ( not ( = ?auto_295854 ?auto_295856 ) ) ( not ( = ?auto_295854 ?auto_295857 ) ) ( not ( = ?auto_295854 ?auto_295858 ) ) ( not ( = ?auto_295854 ?auto_295859 ) ) ( not ( = ?auto_295855 ?auto_295856 ) ) ( not ( = ?auto_295855 ?auto_295857 ) ) ( not ( = ?auto_295855 ?auto_295858 ) ) ( not ( = ?auto_295855 ?auto_295859 ) ) ( not ( = ?auto_295856 ?auto_295857 ) ) ( not ( = ?auto_295856 ?auto_295858 ) ) ( not ( = ?auto_295856 ?auto_295859 ) ) ( not ( = ?auto_295857 ?auto_295858 ) ) ( not ( = ?auto_295857 ?auto_295859 ) ) ( not ( = ?auto_295858 ?auto_295859 ) ) ( ON ?auto_295858 ?auto_295859 ) ( ON ?auto_295857 ?auto_295858 ) ( ON ?auto_295856 ?auto_295857 ) ( ON ?auto_295855 ?auto_295856 ) ( CLEAR ?auto_295853 ) ( ON ?auto_295854 ?auto_295855 ) ( CLEAR ?auto_295854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_295846 ?auto_295847 ?auto_295848 ?auto_295849 ?auto_295850 ?auto_295851 ?auto_295852 ?auto_295853 ?auto_295854 )
      ( MAKE-14PILE ?auto_295846 ?auto_295847 ?auto_295848 ?auto_295849 ?auto_295850 ?auto_295851 ?auto_295852 ?auto_295853 ?auto_295854 ?auto_295855 ?auto_295856 ?auto_295857 ?auto_295858 ?auto_295859 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295874 - BLOCK
      ?auto_295875 - BLOCK
      ?auto_295876 - BLOCK
      ?auto_295877 - BLOCK
      ?auto_295878 - BLOCK
      ?auto_295879 - BLOCK
      ?auto_295880 - BLOCK
      ?auto_295881 - BLOCK
      ?auto_295882 - BLOCK
      ?auto_295883 - BLOCK
      ?auto_295884 - BLOCK
      ?auto_295885 - BLOCK
      ?auto_295886 - BLOCK
      ?auto_295887 - BLOCK
    )
    :vars
    (
      ?auto_295888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295887 ?auto_295888 ) ( ON-TABLE ?auto_295874 ) ( ON ?auto_295875 ?auto_295874 ) ( ON ?auto_295876 ?auto_295875 ) ( ON ?auto_295877 ?auto_295876 ) ( ON ?auto_295878 ?auto_295877 ) ( ON ?auto_295879 ?auto_295878 ) ( ON ?auto_295880 ?auto_295879 ) ( not ( = ?auto_295874 ?auto_295875 ) ) ( not ( = ?auto_295874 ?auto_295876 ) ) ( not ( = ?auto_295874 ?auto_295877 ) ) ( not ( = ?auto_295874 ?auto_295878 ) ) ( not ( = ?auto_295874 ?auto_295879 ) ) ( not ( = ?auto_295874 ?auto_295880 ) ) ( not ( = ?auto_295874 ?auto_295881 ) ) ( not ( = ?auto_295874 ?auto_295882 ) ) ( not ( = ?auto_295874 ?auto_295883 ) ) ( not ( = ?auto_295874 ?auto_295884 ) ) ( not ( = ?auto_295874 ?auto_295885 ) ) ( not ( = ?auto_295874 ?auto_295886 ) ) ( not ( = ?auto_295874 ?auto_295887 ) ) ( not ( = ?auto_295874 ?auto_295888 ) ) ( not ( = ?auto_295875 ?auto_295876 ) ) ( not ( = ?auto_295875 ?auto_295877 ) ) ( not ( = ?auto_295875 ?auto_295878 ) ) ( not ( = ?auto_295875 ?auto_295879 ) ) ( not ( = ?auto_295875 ?auto_295880 ) ) ( not ( = ?auto_295875 ?auto_295881 ) ) ( not ( = ?auto_295875 ?auto_295882 ) ) ( not ( = ?auto_295875 ?auto_295883 ) ) ( not ( = ?auto_295875 ?auto_295884 ) ) ( not ( = ?auto_295875 ?auto_295885 ) ) ( not ( = ?auto_295875 ?auto_295886 ) ) ( not ( = ?auto_295875 ?auto_295887 ) ) ( not ( = ?auto_295875 ?auto_295888 ) ) ( not ( = ?auto_295876 ?auto_295877 ) ) ( not ( = ?auto_295876 ?auto_295878 ) ) ( not ( = ?auto_295876 ?auto_295879 ) ) ( not ( = ?auto_295876 ?auto_295880 ) ) ( not ( = ?auto_295876 ?auto_295881 ) ) ( not ( = ?auto_295876 ?auto_295882 ) ) ( not ( = ?auto_295876 ?auto_295883 ) ) ( not ( = ?auto_295876 ?auto_295884 ) ) ( not ( = ?auto_295876 ?auto_295885 ) ) ( not ( = ?auto_295876 ?auto_295886 ) ) ( not ( = ?auto_295876 ?auto_295887 ) ) ( not ( = ?auto_295876 ?auto_295888 ) ) ( not ( = ?auto_295877 ?auto_295878 ) ) ( not ( = ?auto_295877 ?auto_295879 ) ) ( not ( = ?auto_295877 ?auto_295880 ) ) ( not ( = ?auto_295877 ?auto_295881 ) ) ( not ( = ?auto_295877 ?auto_295882 ) ) ( not ( = ?auto_295877 ?auto_295883 ) ) ( not ( = ?auto_295877 ?auto_295884 ) ) ( not ( = ?auto_295877 ?auto_295885 ) ) ( not ( = ?auto_295877 ?auto_295886 ) ) ( not ( = ?auto_295877 ?auto_295887 ) ) ( not ( = ?auto_295877 ?auto_295888 ) ) ( not ( = ?auto_295878 ?auto_295879 ) ) ( not ( = ?auto_295878 ?auto_295880 ) ) ( not ( = ?auto_295878 ?auto_295881 ) ) ( not ( = ?auto_295878 ?auto_295882 ) ) ( not ( = ?auto_295878 ?auto_295883 ) ) ( not ( = ?auto_295878 ?auto_295884 ) ) ( not ( = ?auto_295878 ?auto_295885 ) ) ( not ( = ?auto_295878 ?auto_295886 ) ) ( not ( = ?auto_295878 ?auto_295887 ) ) ( not ( = ?auto_295878 ?auto_295888 ) ) ( not ( = ?auto_295879 ?auto_295880 ) ) ( not ( = ?auto_295879 ?auto_295881 ) ) ( not ( = ?auto_295879 ?auto_295882 ) ) ( not ( = ?auto_295879 ?auto_295883 ) ) ( not ( = ?auto_295879 ?auto_295884 ) ) ( not ( = ?auto_295879 ?auto_295885 ) ) ( not ( = ?auto_295879 ?auto_295886 ) ) ( not ( = ?auto_295879 ?auto_295887 ) ) ( not ( = ?auto_295879 ?auto_295888 ) ) ( not ( = ?auto_295880 ?auto_295881 ) ) ( not ( = ?auto_295880 ?auto_295882 ) ) ( not ( = ?auto_295880 ?auto_295883 ) ) ( not ( = ?auto_295880 ?auto_295884 ) ) ( not ( = ?auto_295880 ?auto_295885 ) ) ( not ( = ?auto_295880 ?auto_295886 ) ) ( not ( = ?auto_295880 ?auto_295887 ) ) ( not ( = ?auto_295880 ?auto_295888 ) ) ( not ( = ?auto_295881 ?auto_295882 ) ) ( not ( = ?auto_295881 ?auto_295883 ) ) ( not ( = ?auto_295881 ?auto_295884 ) ) ( not ( = ?auto_295881 ?auto_295885 ) ) ( not ( = ?auto_295881 ?auto_295886 ) ) ( not ( = ?auto_295881 ?auto_295887 ) ) ( not ( = ?auto_295881 ?auto_295888 ) ) ( not ( = ?auto_295882 ?auto_295883 ) ) ( not ( = ?auto_295882 ?auto_295884 ) ) ( not ( = ?auto_295882 ?auto_295885 ) ) ( not ( = ?auto_295882 ?auto_295886 ) ) ( not ( = ?auto_295882 ?auto_295887 ) ) ( not ( = ?auto_295882 ?auto_295888 ) ) ( not ( = ?auto_295883 ?auto_295884 ) ) ( not ( = ?auto_295883 ?auto_295885 ) ) ( not ( = ?auto_295883 ?auto_295886 ) ) ( not ( = ?auto_295883 ?auto_295887 ) ) ( not ( = ?auto_295883 ?auto_295888 ) ) ( not ( = ?auto_295884 ?auto_295885 ) ) ( not ( = ?auto_295884 ?auto_295886 ) ) ( not ( = ?auto_295884 ?auto_295887 ) ) ( not ( = ?auto_295884 ?auto_295888 ) ) ( not ( = ?auto_295885 ?auto_295886 ) ) ( not ( = ?auto_295885 ?auto_295887 ) ) ( not ( = ?auto_295885 ?auto_295888 ) ) ( not ( = ?auto_295886 ?auto_295887 ) ) ( not ( = ?auto_295886 ?auto_295888 ) ) ( not ( = ?auto_295887 ?auto_295888 ) ) ( ON ?auto_295886 ?auto_295887 ) ( ON ?auto_295885 ?auto_295886 ) ( ON ?auto_295884 ?auto_295885 ) ( ON ?auto_295883 ?auto_295884 ) ( ON ?auto_295882 ?auto_295883 ) ( CLEAR ?auto_295880 ) ( ON ?auto_295881 ?auto_295882 ) ( CLEAR ?auto_295881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_295874 ?auto_295875 ?auto_295876 ?auto_295877 ?auto_295878 ?auto_295879 ?auto_295880 ?auto_295881 )
      ( MAKE-14PILE ?auto_295874 ?auto_295875 ?auto_295876 ?auto_295877 ?auto_295878 ?auto_295879 ?auto_295880 ?auto_295881 ?auto_295882 ?auto_295883 ?auto_295884 ?auto_295885 ?auto_295886 ?auto_295887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295903 - BLOCK
      ?auto_295904 - BLOCK
      ?auto_295905 - BLOCK
      ?auto_295906 - BLOCK
      ?auto_295907 - BLOCK
      ?auto_295908 - BLOCK
      ?auto_295909 - BLOCK
      ?auto_295910 - BLOCK
      ?auto_295911 - BLOCK
      ?auto_295912 - BLOCK
      ?auto_295913 - BLOCK
      ?auto_295914 - BLOCK
      ?auto_295915 - BLOCK
      ?auto_295916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295916 ) ( ON-TABLE ?auto_295903 ) ( ON ?auto_295904 ?auto_295903 ) ( ON ?auto_295905 ?auto_295904 ) ( ON ?auto_295906 ?auto_295905 ) ( ON ?auto_295907 ?auto_295906 ) ( ON ?auto_295908 ?auto_295907 ) ( ON ?auto_295909 ?auto_295908 ) ( not ( = ?auto_295903 ?auto_295904 ) ) ( not ( = ?auto_295903 ?auto_295905 ) ) ( not ( = ?auto_295903 ?auto_295906 ) ) ( not ( = ?auto_295903 ?auto_295907 ) ) ( not ( = ?auto_295903 ?auto_295908 ) ) ( not ( = ?auto_295903 ?auto_295909 ) ) ( not ( = ?auto_295903 ?auto_295910 ) ) ( not ( = ?auto_295903 ?auto_295911 ) ) ( not ( = ?auto_295903 ?auto_295912 ) ) ( not ( = ?auto_295903 ?auto_295913 ) ) ( not ( = ?auto_295903 ?auto_295914 ) ) ( not ( = ?auto_295903 ?auto_295915 ) ) ( not ( = ?auto_295903 ?auto_295916 ) ) ( not ( = ?auto_295904 ?auto_295905 ) ) ( not ( = ?auto_295904 ?auto_295906 ) ) ( not ( = ?auto_295904 ?auto_295907 ) ) ( not ( = ?auto_295904 ?auto_295908 ) ) ( not ( = ?auto_295904 ?auto_295909 ) ) ( not ( = ?auto_295904 ?auto_295910 ) ) ( not ( = ?auto_295904 ?auto_295911 ) ) ( not ( = ?auto_295904 ?auto_295912 ) ) ( not ( = ?auto_295904 ?auto_295913 ) ) ( not ( = ?auto_295904 ?auto_295914 ) ) ( not ( = ?auto_295904 ?auto_295915 ) ) ( not ( = ?auto_295904 ?auto_295916 ) ) ( not ( = ?auto_295905 ?auto_295906 ) ) ( not ( = ?auto_295905 ?auto_295907 ) ) ( not ( = ?auto_295905 ?auto_295908 ) ) ( not ( = ?auto_295905 ?auto_295909 ) ) ( not ( = ?auto_295905 ?auto_295910 ) ) ( not ( = ?auto_295905 ?auto_295911 ) ) ( not ( = ?auto_295905 ?auto_295912 ) ) ( not ( = ?auto_295905 ?auto_295913 ) ) ( not ( = ?auto_295905 ?auto_295914 ) ) ( not ( = ?auto_295905 ?auto_295915 ) ) ( not ( = ?auto_295905 ?auto_295916 ) ) ( not ( = ?auto_295906 ?auto_295907 ) ) ( not ( = ?auto_295906 ?auto_295908 ) ) ( not ( = ?auto_295906 ?auto_295909 ) ) ( not ( = ?auto_295906 ?auto_295910 ) ) ( not ( = ?auto_295906 ?auto_295911 ) ) ( not ( = ?auto_295906 ?auto_295912 ) ) ( not ( = ?auto_295906 ?auto_295913 ) ) ( not ( = ?auto_295906 ?auto_295914 ) ) ( not ( = ?auto_295906 ?auto_295915 ) ) ( not ( = ?auto_295906 ?auto_295916 ) ) ( not ( = ?auto_295907 ?auto_295908 ) ) ( not ( = ?auto_295907 ?auto_295909 ) ) ( not ( = ?auto_295907 ?auto_295910 ) ) ( not ( = ?auto_295907 ?auto_295911 ) ) ( not ( = ?auto_295907 ?auto_295912 ) ) ( not ( = ?auto_295907 ?auto_295913 ) ) ( not ( = ?auto_295907 ?auto_295914 ) ) ( not ( = ?auto_295907 ?auto_295915 ) ) ( not ( = ?auto_295907 ?auto_295916 ) ) ( not ( = ?auto_295908 ?auto_295909 ) ) ( not ( = ?auto_295908 ?auto_295910 ) ) ( not ( = ?auto_295908 ?auto_295911 ) ) ( not ( = ?auto_295908 ?auto_295912 ) ) ( not ( = ?auto_295908 ?auto_295913 ) ) ( not ( = ?auto_295908 ?auto_295914 ) ) ( not ( = ?auto_295908 ?auto_295915 ) ) ( not ( = ?auto_295908 ?auto_295916 ) ) ( not ( = ?auto_295909 ?auto_295910 ) ) ( not ( = ?auto_295909 ?auto_295911 ) ) ( not ( = ?auto_295909 ?auto_295912 ) ) ( not ( = ?auto_295909 ?auto_295913 ) ) ( not ( = ?auto_295909 ?auto_295914 ) ) ( not ( = ?auto_295909 ?auto_295915 ) ) ( not ( = ?auto_295909 ?auto_295916 ) ) ( not ( = ?auto_295910 ?auto_295911 ) ) ( not ( = ?auto_295910 ?auto_295912 ) ) ( not ( = ?auto_295910 ?auto_295913 ) ) ( not ( = ?auto_295910 ?auto_295914 ) ) ( not ( = ?auto_295910 ?auto_295915 ) ) ( not ( = ?auto_295910 ?auto_295916 ) ) ( not ( = ?auto_295911 ?auto_295912 ) ) ( not ( = ?auto_295911 ?auto_295913 ) ) ( not ( = ?auto_295911 ?auto_295914 ) ) ( not ( = ?auto_295911 ?auto_295915 ) ) ( not ( = ?auto_295911 ?auto_295916 ) ) ( not ( = ?auto_295912 ?auto_295913 ) ) ( not ( = ?auto_295912 ?auto_295914 ) ) ( not ( = ?auto_295912 ?auto_295915 ) ) ( not ( = ?auto_295912 ?auto_295916 ) ) ( not ( = ?auto_295913 ?auto_295914 ) ) ( not ( = ?auto_295913 ?auto_295915 ) ) ( not ( = ?auto_295913 ?auto_295916 ) ) ( not ( = ?auto_295914 ?auto_295915 ) ) ( not ( = ?auto_295914 ?auto_295916 ) ) ( not ( = ?auto_295915 ?auto_295916 ) ) ( ON ?auto_295915 ?auto_295916 ) ( ON ?auto_295914 ?auto_295915 ) ( ON ?auto_295913 ?auto_295914 ) ( ON ?auto_295912 ?auto_295913 ) ( ON ?auto_295911 ?auto_295912 ) ( CLEAR ?auto_295909 ) ( ON ?auto_295910 ?auto_295911 ) ( CLEAR ?auto_295910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_295903 ?auto_295904 ?auto_295905 ?auto_295906 ?auto_295907 ?auto_295908 ?auto_295909 ?auto_295910 )
      ( MAKE-14PILE ?auto_295903 ?auto_295904 ?auto_295905 ?auto_295906 ?auto_295907 ?auto_295908 ?auto_295909 ?auto_295910 ?auto_295911 ?auto_295912 ?auto_295913 ?auto_295914 ?auto_295915 ?auto_295916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295931 - BLOCK
      ?auto_295932 - BLOCK
      ?auto_295933 - BLOCK
      ?auto_295934 - BLOCK
      ?auto_295935 - BLOCK
      ?auto_295936 - BLOCK
      ?auto_295937 - BLOCK
      ?auto_295938 - BLOCK
      ?auto_295939 - BLOCK
      ?auto_295940 - BLOCK
      ?auto_295941 - BLOCK
      ?auto_295942 - BLOCK
      ?auto_295943 - BLOCK
      ?auto_295944 - BLOCK
    )
    :vars
    (
      ?auto_295945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_295944 ?auto_295945 ) ( ON-TABLE ?auto_295931 ) ( ON ?auto_295932 ?auto_295931 ) ( ON ?auto_295933 ?auto_295932 ) ( ON ?auto_295934 ?auto_295933 ) ( ON ?auto_295935 ?auto_295934 ) ( ON ?auto_295936 ?auto_295935 ) ( not ( = ?auto_295931 ?auto_295932 ) ) ( not ( = ?auto_295931 ?auto_295933 ) ) ( not ( = ?auto_295931 ?auto_295934 ) ) ( not ( = ?auto_295931 ?auto_295935 ) ) ( not ( = ?auto_295931 ?auto_295936 ) ) ( not ( = ?auto_295931 ?auto_295937 ) ) ( not ( = ?auto_295931 ?auto_295938 ) ) ( not ( = ?auto_295931 ?auto_295939 ) ) ( not ( = ?auto_295931 ?auto_295940 ) ) ( not ( = ?auto_295931 ?auto_295941 ) ) ( not ( = ?auto_295931 ?auto_295942 ) ) ( not ( = ?auto_295931 ?auto_295943 ) ) ( not ( = ?auto_295931 ?auto_295944 ) ) ( not ( = ?auto_295931 ?auto_295945 ) ) ( not ( = ?auto_295932 ?auto_295933 ) ) ( not ( = ?auto_295932 ?auto_295934 ) ) ( not ( = ?auto_295932 ?auto_295935 ) ) ( not ( = ?auto_295932 ?auto_295936 ) ) ( not ( = ?auto_295932 ?auto_295937 ) ) ( not ( = ?auto_295932 ?auto_295938 ) ) ( not ( = ?auto_295932 ?auto_295939 ) ) ( not ( = ?auto_295932 ?auto_295940 ) ) ( not ( = ?auto_295932 ?auto_295941 ) ) ( not ( = ?auto_295932 ?auto_295942 ) ) ( not ( = ?auto_295932 ?auto_295943 ) ) ( not ( = ?auto_295932 ?auto_295944 ) ) ( not ( = ?auto_295932 ?auto_295945 ) ) ( not ( = ?auto_295933 ?auto_295934 ) ) ( not ( = ?auto_295933 ?auto_295935 ) ) ( not ( = ?auto_295933 ?auto_295936 ) ) ( not ( = ?auto_295933 ?auto_295937 ) ) ( not ( = ?auto_295933 ?auto_295938 ) ) ( not ( = ?auto_295933 ?auto_295939 ) ) ( not ( = ?auto_295933 ?auto_295940 ) ) ( not ( = ?auto_295933 ?auto_295941 ) ) ( not ( = ?auto_295933 ?auto_295942 ) ) ( not ( = ?auto_295933 ?auto_295943 ) ) ( not ( = ?auto_295933 ?auto_295944 ) ) ( not ( = ?auto_295933 ?auto_295945 ) ) ( not ( = ?auto_295934 ?auto_295935 ) ) ( not ( = ?auto_295934 ?auto_295936 ) ) ( not ( = ?auto_295934 ?auto_295937 ) ) ( not ( = ?auto_295934 ?auto_295938 ) ) ( not ( = ?auto_295934 ?auto_295939 ) ) ( not ( = ?auto_295934 ?auto_295940 ) ) ( not ( = ?auto_295934 ?auto_295941 ) ) ( not ( = ?auto_295934 ?auto_295942 ) ) ( not ( = ?auto_295934 ?auto_295943 ) ) ( not ( = ?auto_295934 ?auto_295944 ) ) ( not ( = ?auto_295934 ?auto_295945 ) ) ( not ( = ?auto_295935 ?auto_295936 ) ) ( not ( = ?auto_295935 ?auto_295937 ) ) ( not ( = ?auto_295935 ?auto_295938 ) ) ( not ( = ?auto_295935 ?auto_295939 ) ) ( not ( = ?auto_295935 ?auto_295940 ) ) ( not ( = ?auto_295935 ?auto_295941 ) ) ( not ( = ?auto_295935 ?auto_295942 ) ) ( not ( = ?auto_295935 ?auto_295943 ) ) ( not ( = ?auto_295935 ?auto_295944 ) ) ( not ( = ?auto_295935 ?auto_295945 ) ) ( not ( = ?auto_295936 ?auto_295937 ) ) ( not ( = ?auto_295936 ?auto_295938 ) ) ( not ( = ?auto_295936 ?auto_295939 ) ) ( not ( = ?auto_295936 ?auto_295940 ) ) ( not ( = ?auto_295936 ?auto_295941 ) ) ( not ( = ?auto_295936 ?auto_295942 ) ) ( not ( = ?auto_295936 ?auto_295943 ) ) ( not ( = ?auto_295936 ?auto_295944 ) ) ( not ( = ?auto_295936 ?auto_295945 ) ) ( not ( = ?auto_295937 ?auto_295938 ) ) ( not ( = ?auto_295937 ?auto_295939 ) ) ( not ( = ?auto_295937 ?auto_295940 ) ) ( not ( = ?auto_295937 ?auto_295941 ) ) ( not ( = ?auto_295937 ?auto_295942 ) ) ( not ( = ?auto_295937 ?auto_295943 ) ) ( not ( = ?auto_295937 ?auto_295944 ) ) ( not ( = ?auto_295937 ?auto_295945 ) ) ( not ( = ?auto_295938 ?auto_295939 ) ) ( not ( = ?auto_295938 ?auto_295940 ) ) ( not ( = ?auto_295938 ?auto_295941 ) ) ( not ( = ?auto_295938 ?auto_295942 ) ) ( not ( = ?auto_295938 ?auto_295943 ) ) ( not ( = ?auto_295938 ?auto_295944 ) ) ( not ( = ?auto_295938 ?auto_295945 ) ) ( not ( = ?auto_295939 ?auto_295940 ) ) ( not ( = ?auto_295939 ?auto_295941 ) ) ( not ( = ?auto_295939 ?auto_295942 ) ) ( not ( = ?auto_295939 ?auto_295943 ) ) ( not ( = ?auto_295939 ?auto_295944 ) ) ( not ( = ?auto_295939 ?auto_295945 ) ) ( not ( = ?auto_295940 ?auto_295941 ) ) ( not ( = ?auto_295940 ?auto_295942 ) ) ( not ( = ?auto_295940 ?auto_295943 ) ) ( not ( = ?auto_295940 ?auto_295944 ) ) ( not ( = ?auto_295940 ?auto_295945 ) ) ( not ( = ?auto_295941 ?auto_295942 ) ) ( not ( = ?auto_295941 ?auto_295943 ) ) ( not ( = ?auto_295941 ?auto_295944 ) ) ( not ( = ?auto_295941 ?auto_295945 ) ) ( not ( = ?auto_295942 ?auto_295943 ) ) ( not ( = ?auto_295942 ?auto_295944 ) ) ( not ( = ?auto_295942 ?auto_295945 ) ) ( not ( = ?auto_295943 ?auto_295944 ) ) ( not ( = ?auto_295943 ?auto_295945 ) ) ( not ( = ?auto_295944 ?auto_295945 ) ) ( ON ?auto_295943 ?auto_295944 ) ( ON ?auto_295942 ?auto_295943 ) ( ON ?auto_295941 ?auto_295942 ) ( ON ?auto_295940 ?auto_295941 ) ( ON ?auto_295939 ?auto_295940 ) ( ON ?auto_295938 ?auto_295939 ) ( CLEAR ?auto_295936 ) ( ON ?auto_295937 ?auto_295938 ) ( CLEAR ?auto_295937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_295931 ?auto_295932 ?auto_295933 ?auto_295934 ?auto_295935 ?auto_295936 ?auto_295937 )
      ( MAKE-14PILE ?auto_295931 ?auto_295932 ?auto_295933 ?auto_295934 ?auto_295935 ?auto_295936 ?auto_295937 ?auto_295938 ?auto_295939 ?auto_295940 ?auto_295941 ?auto_295942 ?auto_295943 ?auto_295944 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295960 - BLOCK
      ?auto_295961 - BLOCK
      ?auto_295962 - BLOCK
      ?auto_295963 - BLOCK
      ?auto_295964 - BLOCK
      ?auto_295965 - BLOCK
      ?auto_295966 - BLOCK
      ?auto_295967 - BLOCK
      ?auto_295968 - BLOCK
      ?auto_295969 - BLOCK
      ?auto_295970 - BLOCK
      ?auto_295971 - BLOCK
      ?auto_295972 - BLOCK
      ?auto_295973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_295973 ) ( ON-TABLE ?auto_295960 ) ( ON ?auto_295961 ?auto_295960 ) ( ON ?auto_295962 ?auto_295961 ) ( ON ?auto_295963 ?auto_295962 ) ( ON ?auto_295964 ?auto_295963 ) ( ON ?auto_295965 ?auto_295964 ) ( not ( = ?auto_295960 ?auto_295961 ) ) ( not ( = ?auto_295960 ?auto_295962 ) ) ( not ( = ?auto_295960 ?auto_295963 ) ) ( not ( = ?auto_295960 ?auto_295964 ) ) ( not ( = ?auto_295960 ?auto_295965 ) ) ( not ( = ?auto_295960 ?auto_295966 ) ) ( not ( = ?auto_295960 ?auto_295967 ) ) ( not ( = ?auto_295960 ?auto_295968 ) ) ( not ( = ?auto_295960 ?auto_295969 ) ) ( not ( = ?auto_295960 ?auto_295970 ) ) ( not ( = ?auto_295960 ?auto_295971 ) ) ( not ( = ?auto_295960 ?auto_295972 ) ) ( not ( = ?auto_295960 ?auto_295973 ) ) ( not ( = ?auto_295961 ?auto_295962 ) ) ( not ( = ?auto_295961 ?auto_295963 ) ) ( not ( = ?auto_295961 ?auto_295964 ) ) ( not ( = ?auto_295961 ?auto_295965 ) ) ( not ( = ?auto_295961 ?auto_295966 ) ) ( not ( = ?auto_295961 ?auto_295967 ) ) ( not ( = ?auto_295961 ?auto_295968 ) ) ( not ( = ?auto_295961 ?auto_295969 ) ) ( not ( = ?auto_295961 ?auto_295970 ) ) ( not ( = ?auto_295961 ?auto_295971 ) ) ( not ( = ?auto_295961 ?auto_295972 ) ) ( not ( = ?auto_295961 ?auto_295973 ) ) ( not ( = ?auto_295962 ?auto_295963 ) ) ( not ( = ?auto_295962 ?auto_295964 ) ) ( not ( = ?auto_295962 ?auto_295965 ) ) ( not ( = ?auto_295962 ?auto_295966 ) ) ( not ( = ?auto_295962 ?auto_295967 ) ) ( not ( = ?auto_295962 ?auto_295968 ) ) ( not ( = ?auto_295962 ?auto_295969 ) ) ( not ( = ?auto_295962 ?auto_295970 ) ) ( not ( = ?auto_295962 ?auto_295971 ) ) ( not ( = ?auto_295962 ?auto_295972 ) ) ( not ( = ?auto_295962 ?auto_295973 ) ) ( not ( = ?auto_295963 ?auto_295964 ) ) ( not ( = ?auto_295963 ?auto_295965 ) ) ( not ( = ?auto_295963 ?auto_295966 ) ) ( not ( = ?auto_295963 ?auto_295967 ) ) ( not ( = ?auto_295963 ?auto_295968 ) ) ( not ( = ?auto_295963 ?auto_295969 ) ) ( not ( = ?auto_295963 ?auto_295970 ) ) ( not ( = ?auto_295963 ?auto_295971 ) ) ( not ( = ?auto_295963 ?auto_295972 ) ) ( not ( = ?auto_295963 ?auto_295973 ) ) ( not ( = ?auto_295964 ?auto_295965 ) ) ( not ( = ?auto_295964 ?auto_295966 ) ) ( not ( = ?auto_295964 ?auto_295967 ) ) ( not ( = ?auto_295964 ?auto_295968 ) ) ( not ( = ?auto_295964 ?auto_295969 ) ) ( not ( = ?auto_295964 ?auto_295970 ) ) ( not ( = ?auto_295964 ?auto_295971 ) ) ( not ( = ?auto_295964 ?auto_295972 ) ) ( not ( = ?auto_295964 ?auto_295973 ) ) ( not ( = ?auto_295965 ?auto_295966 ) ) ( not ( = ?auto_295965 ?auto_295967 ) ) ( not ( = ?auto_295965 ?auto_295968 ) ) ( not ( = ?auto_295965 ?auto_295969 ) ) ( not ( = ?auto_295965 ?auto_295970 ) ) ( not ( = ?auto_295965 ?auto_295971 ) ) ( not ( = ?auto_295965 ?auto_295972 ) ) ( not ( = ?auto_295965 ?auto_295973 ) ) ( not ( = ?auto_295966 ?auto_295967 ) ) ( not ( = ?auto_295966 ?auto_295968 ) ) ( not ( = ?auto_295966 ?auto_295969 ) ) ( not ( = ?auto_295966 ?auto_295970 ) ) ( not ( = ?auto_295966 ?auto_295971 ) ) ( not ( = ?auto_295966 ?auto_295972 ) ) ( not ( = ?auto_295966 ?auto_295973 ) ) ( not ( = ?auto_295967 ?auto_295968 ) ) ( not ( = ?auto_295967 ?auto_295969 ) ) ( not ( = ?auto_295967 ?auto_295970 ) ) ( not ( = ?auto_295967 ?auto_295971 ) ) ( not ( = ?auto_295967 ?auto_295972 ) ) ( not ( = ?auto_295967 ?auto_295973 ) ) ( not ( = ?auto_295968 ?auto_295969 ) ) ( not ( = ?auto_295968 ?auto_295970 ) ) ( not ( = ?auto_295968 ?auto_295971 ) ) ( not ( = ?auto_295968 ?auto_295972 ) ) ( not ( = ?auto_295968 ?auto_295973 ) ) ( not ( = ?auto_295969 ?auto_295970 ) ) ( not ( = ?auto_295969 ?auto_295971 ) ) ( not ( = ?auto_295969 ?auto_295972 ) ) ( not ( = ?auto_295969 ?auto_295973 ) ) ( not ( = ?auto_295970 ?auto_295971 ) ) ( not ( = ?auto_295970 ?auto_295972 ) ) ( not ( = ?auto_295970 ?auto_295973 ) ) ( not ( = ?auto_295971 ?auto_295972 ) ) ( not ( = ?auto_295971 ?auto_295973 ) ) ( not ( = ?auto_295972 ?auto_295973 ) ) ( ON ?auto_295972 ?auto_295973 ) ( ON ?auto_295971 ?auto_295972 ) ( ON ?auto_295970 ?auto_295971 ) ( ON ?auto_295969 ?auto_295970 ) ( ON ?auto_295968 ?auto_295969 ) ( ON ?auto_295967 ?auto_295968 ) ( CLEAR ?auto_295965 ) ( ON ?auto_295966 ?auto_295967 ) ( CLEAR ?auto_295966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_295960 ?auto_295961 ?auto_295962 ?auto_295963 ?auto_295964 ?auto_295965 ?auto_295966 )
      ( MAKE-14PILE ?auto_295960 ?auto_295961 ?auto_295962 ?auto_295963 ?auto_295964 ?auto_295965 ?auto_295966 ?auto_295967 ?auto_295968 ?auto_295969 ?auto_295970 ?auto_295971 ?auto_295972 ?auto_295973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_295988 - BLOCK
      ?auto_295989 - BLOCK
      ?auto_295990 - BLOCK
      ?auto_295991 - BLOCK
      ?auto_295992 - BLOCK
      ?auto_295993 - BLOCK
      ?auto_295994 - BLOCK
      ?auto_295995 - BLOCK
      ?auto_295996 - BLOCK
      ?auto_295997 - BLOCK
      ?auto_295998 - BLOCK
      ?auto_295999 - BLOCK
      ?auto_296000 - BLOCK
      ?auto_296001 - BLOCK
    )
    :vars
    (
      ?auto_296002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296001 ?auto_296002 ) ( ON-TABLE ?auto_295988 ) ( ON ?auto_295989 ?auto_295988 ) ( ON ?auto_295990 ?auto_295989 ) ( ON ?auto_295991 ?auto_295990 ) ( ON ?auto_295992 ?auto_295991 ) ( not ( = ?auto_295988 ?auto_295989 ) ) ( not ( = ?auto_295988 ?auto_295990 ) ) ( not ( = ?auto_295988 ?auto_295991 ) ) ( not ( = ?auto_295988 ?auto_295992 ) ) ( not ( = ?auto_295988 ?auto_295993 ) ) ( not ( = ?auto_295988 ?auto_295994 ) ) ( not ( = ?auto_295988 ?auto_295995 ) ) ( not ( = ?auto_295988 ?auto_295996 ) ) ( not ( = ?auto_295988 ?auto_295997 ) ) ( not ( = ?auto_295988 ?auto_295998 ) ) ( not ( = ?auto_295988 ?auto_295999 ) ) ( not ( = ?auto_295988 ?auto_296000 ) ) ( not ( = ?auto_295988 ?auto_296001 ) ) ( not ( = ?auto_295988 ?auto_296002 ) ) ( not ( = ?auto_295989 ?auto_295990 ) ) ( not ( = ?auto_295989 ?auto_295991 ) ) ( not ( = ?auto_295989 ?auto_295992 ) ) ( not ( = ?auto_295989 ?auto_295993 ) ) ( not ( = ?auto_295989 ?auto_295994 ) ) ( not ( = ?auto_295989 ?auto_295995 ) ) ( not ( = ?auto_295989 ?auto_295996 ) ) ( not ( = ?auto_295989 ?auto_295997 ) ) ( not ( = ?auto_295989 ?auto_295998 ) ) ( not ( = ?auto_295989 ?auto_295999 ) ) ( not ( = ?auto_295989 ?auto_296000 ) ) ( not ( = ?auto_295989 ?auto_296001 ) ) ( not ( = ?auto_295989 ?auto_296002 ) ) ( not ( = ?auto_295990 ?auto_295991 ) ) ( not ( = ?auto_295990 ?auto_295992 ) ) ( not ( = ?auto_295990 ?auto_295993 ) ) ( not ( = ?auto_295990 ?auto_295994 ) ) ( not ( = ?auto_295990 ?auto_295995 ) ) ( not ( = ?auto_295990 ?auto_295996 ) ) ( not ( = ?auto_295990 ?auto_295997 ) ) ( not ( = ?auto_295990 ?auto_295998 ) ) ( not ( = ?auto_295990 ?auto_295999 ) ) ( not ( = ?auto_295990 ?auto_296000 ) ) ( not ( = ?auto_295990 ?auto_296001 ) ) ( not ( = ?auto_295990 ?auto_296002 ) ) ( not ( = ?auto_295991 ?auto_295992 ) ) ( not ( = ?auto_295991 ?auto_295993 ) ) ( not ( = ?auto_295991 ?auto_295994 ) ) ( not ( = ?auto_295991 ?auto_295995 ) ) ( not ( = ?auto_295991 ?auto_295996 ) ) ( not ( = ?auto_295991 ?auto_295997 ) ) ( not ( = ?auto_295991 ?auto_295998 ) ) ( not ( = ?auto_295991 ?auto_295999 ) ) ( not ( = ?auto_295991 ?auto_296000 ) ) ( not ( = ?auto_295991 ?auto_296001 ) ) ( not ( = ?auto_295991 ?auto_296002 ) ) ( not ( = ?auto_295992 ?auto_295993 ) ) ( not ( = ?auto_295992 ?auto_295994 ) ) ( not ( = ?auto_295992 ?auto_295995 ) ) ( not ( = ?auto_295992 ?auto_295996 ) ) ( not ( = ?auto_295992 ?auto_295997 ) ) ( not ( = ?auto_295992 ?auto_295998 ) ) ( not ( = ?auto_295992 ?auto_295999 ) ) ( not ( = ?auto_295992 ?auto_296000 ) ) ( not ( = ?auto_295992 ?auto_296001 ) ) ( not ( = ?auto_295992 ?auto_296002 ) ) ( not ( = ?auto_295993 ?auto_295994 ) ) ( not ( = ?auto_295993 ?auto_295995 ) ) ( not ( = ?auto_295993 ?auto_295996 ) ) ( not ( = ?auto_295993 ?auto_295997 ) ) ( not ( = ?auto_295993 ?auto_295998 ) ) ( not ( = ?auto_295993 ?auto_295999 ) ) ( not ( = ?auto_295993 ?auto_296000 ) ) ( not ( = ?auto_295993 ?auto_296001 ) ) ( not ( = ?auto_295993 ?auto_296002 ) ) ( not ( = ?auto_295994 ?auto_295995 ) ) ( not ( = ?auto_295994 ?auto_295996 ) ) ( not ( = ?auto_295994 ?auto_295997 ) ) ( not ( = ?auto_295994 ?auto_295998 ) ) ( not ( = ?auto_295994 ?auto_295999 ) ) ( not ( = ?auto_295994 ?auto_296000 ) ) ( not ( = ?auto_295994 ?auto_296001 ) ) ( not ( = ?auto_295994 ?auto_296002 ) ) ( not ( = ?auto_295995 ?auto_295996 ) ) ( not ( = ?auto_295995 ?auto_295997 ) ) ( not ( = ?auto_295995 ?auto_295998 ) ) ( not ( = ?auto_295995 ?auto_295999 ) ) ( not ( = ?auto_295995 ?auto_296000 ) ) ( not ( = ?auto_295995 ?auto_296001 ) ) ( not ( = ?auto_295995 ?auto_296002 ) ) ( not ( = ?auto_295996 ?auto_295997 ) ) ( not ( = ?auto_295996 ?auto_295998 ) ) ( not ( = ?auto_295996 ?auto_295999 ) ) ( not ( = ?auto_295996 ?auto_296000 ) ) ( not ( = ?auto_295996 ?auto_296001 ) ) ( not ( = ?auto_295996 ?auto_296002 ) ) ( not ( = ?auto_295997 ?auto_295998 ) ) ( not ( = ?auto_295997 ?auto_295999 ) ) ( not ( = ?auto_295997 ?auto_296000 ) ) ( not ( = ?auto_295997 ?auto_296001 ) ) ( not ( = ?auto_295997 ?auto_296002 ) ) ( not ( = ?auto_295998 ?auto_295999 ) ) ( not ( = ?auto_295998 ?auto_296000 ) ) ( not ( = ?auto_295998 ?auto_296001 ) ) ( not ( = ?auto_295998 ?auto_296002 ) ) ( not ( = ?auto_295999 ?auto_296000 ) ) ( not ( = ?auto_295999 ?auto_296001 ) ) ( not ( = ?auto_295999 ?auto_296002 ) ) ( not ( = ?auto_296000 ?auto_296001 ) ) ( not ( = ?auto_296000 ?auto_296002 ) ) ( not ( = ?auto_296001 ?auto_296002 ) ) ( ON ?auto_296000 ?auto_296001 ) ( ON ?auto_295999 ?auto_296000 ) ( ON ?auto_295998 ?auto_295999 ) ( ON ?auto_295997 ?auto_295998 ) ( ON ?auto_295996 ?auto_295997 ) ( ON ?auto_295995 ?auto_295996 ) ( ON ?auto_295994 ?auto_295995 ) ( CLEAR ?auto_295992 ) ( ON ?auto_295993 ?auto_295994 ) ( CLEAR ?auto_295993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_295988 ?auto_295989 ?auto_295990 ?auto_295991 ?auto_295992 ?auto_295993 )
      ( MAKE-14PILE ?auto_295988 ?auto_295989 ?auto_295990 ?auto_295991 ?auto_295992 ?auto_295993 ?auto_295994 ?auto_295995 ?auto_295996 ?auto_295997 ?auto_295998 ?auto_295999 ?auto_296000 ?auto_296001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296017 - BLOCK
      ?auto_296018 - BLOCK
      ?auto_296019 - BLOCK
      ?auto_296020 - BLOCK
      ?auto_296021 - BLOCK
      ?auto_296022 - BLOCK
      ?auto_296023 - BLOCK
      ?auto_296024 - BLOCK
      ?auto_296025 - BLOCK
      ?auto_296026 - BLOCK
      ?auto_296027 - BLOCK
      ?auto_296028 - BLOCK
      ?auto_296029 - BLOCK
      ?auto_296030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296030 ) ( ON-TABLE ?auto_296017 ) ( ON ?auto_296018 ?auto_296017 ) ( ON ?auto_296019 ?auto_296018 ) ( ON ?auto_296020 ?auto_296019 ) ( ON ?auto_296021 ?auto_296020 ) ( not ( = ?auto_296017 ?auto_296018 ) ) ( not ( = ?auto_296017 ?auto_296019 ) ) ( not ( = ?auto_296017 ?auto_296020 ) ) ( not ( = ?auto_296017 ?auto_296021 ) ) ( not ( = ?auto_296017 ?auto_296022 ) ) ( not ( = ?auto_296017 ?auto_296023 ) ) ( not ( = ?auto_296017 ?auto_296024 ) ) ( not ( = ?auto_296017 ?auto_296025 ) ) ( not ( = ?auto_296017 ?auto_296026 ) ) ( not ( = ?auto_296017 ?auto_296027 ) ) ( not ( = ?auto_296017 ?auto_296028 ) ) ( not ( = ?auto_296017 ?auto_296029 ) ) ( not ( = ?auto_296017 ?auto_296030 ) ) ( not ( = ?auto_296018 ?auto_296019 ) ) ( not ( = ?auto_296018 ?auto_296020 ) ) ( not ( = ?auto_296018 ?auto_296021 ) ) ( not ( = ?auto_296018 ?auto_296022 ) ) ( not ( = ?auto_296018 ?auto_296023 ) ) ( not ( = ?auto_296018 ?auto_296024 ) ) ( not ( = ?auto_296018 ?auto_296025 ) ) ( not ( = ?auto_296018 ?auto_296026 ) ) ( not ( = ?auto_296018 ?auto_296027 ) ) ( not ( = ?auto_296018 ?auto_296028 ) ) ( not ( = ?auto_296018 ?auto_296029 ) ) ( not ( = ?auto_296018 ?auto_296030 ) ) ( not ( = ?auto_296019 ?auto_296020 ) ) ( not ( = ?auto_296019 ?auto_296021 ) ) ( not ( = ?auto_296019 ?auto_296022 ) ) ( not ( = ?auto_296019 ?auto_296023 ) ) ( not ( = ?auto_296019 ?auto_296024 ) ) ( not ( = ?auto_296019 ?auto_296025 ) ) ( not ( = ?auto_296019 ?auto_296026 ) ) ( not ( = ?auto_296019 ?auto_296027 ) ) ( not ( = ?auto_296019 ?auto_296028 ) ) ( not ( = ?auto_296019 ?auto_296029 ) ) ( not ( = ?auto_296019 ?auto_296030 ) ) ( not ( = ?auto_296020 ?auto_296021 ) ) ( not ( = ?auto_296020 ?auto_296022 ) ) ( not ( = ?auto_296020 ?auto_296023 ) ) ( not ( = ?auto_296020 ?auto_296024 ) ) ( not ( = ?auto_296020 ?auto_296025 ) ) ( not ( = ?auto_296020 ?auto_296026 ) ) ( not ( = ?auto_296020 ?auto_296027 ) ) ( not ( = ?auto_296020 ?auto_296028 ) ) ( not ( = ?auto_296020 ?auto_296029 ) ) ( not ( = ?auto_296020 ?auto_296030 ) ) ( not ( = ?auto_296021 ?auto_296022 ) ) ( not ( = ?auto_296021 ?auto_296023 ) ) ( not ( = ?auto_296021 ?auto_296024 ) ) ( not ( = ?auto_296021 ?auto_296025 ) ) ( not ( = ?auto_296021 ?auto_296026 ) ) ( not ( = ?auto_296021 ?auto_296027 ) ) ( not ( = ?auto_296021 ?auto_296028 ) ) ( not ( = ?auto_296021 ?auto_296029 ) ) ( not ( = ?auto_296021 ?auto_296030 ) ) ( not ( = ?auto_296022 ?auto_296023 ) ) ( not ( = ?auto_296022 ?auto_296024 ) ) ( not ( = ?auto_296022 ?auto_296025 ) ) ( not ( = ?auto_296022 ?auto_296026 ) ) ( not ( = ?auto_296022 ?auto_296027 ) ) ( not ( = ?auto_296022 ?auto_296028 ) ) ( not ( = ?auto_296022 ?auto_296029 ) ) ( not ( = ?auto_296022 ?auto_296030 ) ) ( not ( = ?auto_296023 ?auto_296024 ) ) ( not ( = ?auto_296023 ?auto_296025 ) ) ( not ( = ?auto_296023 ?auto_296026 ) ) ( not ( = ?auto_296023 ?auto_296027 ) ) ( not ( = ?auto_296023 ?auto_296028 ) ) ( not ( = ?auto_296023 ?auto_296029 ) ) ( not ( = ?auto_296023 ?auto_296030 ) ) ( not ( = ?auto_296024 ?auto_296025 ) ) ( not ( = ?auto_296024 ?auto_296026 ) ) ( not ( = ?auto_296024 ?auto_296027 ) ) ( not ( = ?auto_296024 ?auto_296028 ) ) ( not ( = ?auto_296024 ?auto_296029 ) ) ( not ( = ?auto_296024 ?auto_296030 ) ) ( not ( = ?auto_296025 ?auto_296026 ) ) ( not ( = ?auto_296025 ?auto_296027 ) ) ( not ( = ?auto_296025 ?auto_296028 ) ) ( not ( = ?auto_296025 ?auto_296029 ) ) ( not ( = ?auto_296025 ?auto_296030 ) ) ( not ( = ?auto_296026 ?auto_296027 ) ) ( not ( = ?auto_296026 ?auto_296028 ) ) ( not ( = ?auto_296026 ?auto_296029 ) ) ( not ( = ?auto_296026 ?auto_296030 ) ) ( not ( = ?auto_296027 ?auto_296028 ) ) ( not ( = ?auto_296027 ?auto_296029 ) ) ( not ( = ?auto_296027 ?auto_296030 ) ) ( not ( = ?auto_296028 ?auto_296029 ) ) ( not ( = ?auto_296028 ?auto_296030 ) ) ( not ( = ?auto_296029 ?auto_296030 ) ) ( ON ?auto_296029 ?auto_296030 ) ( ON ?auto_296028 ?auto_296029 ) ( ON ?auto_296027 ?auto_296028 ) ( ON ?auto_296026 ?auto_296027 ) ( ON ?auto_296025 ?auto_296026 ) ( ON ?auto_296024 ?auto_296025 ) ( ON ?auto_296023 ?auto_296024 ) ( CLEAR ?auto_296021 ) ( ON ?auto_296022 ?auto_296023 ) ( CLEAR ?auto_296022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_296017 ?auto_296018 ?auto_296019 ?auto_296020 ?auto_296021 ?auto_296022 )
      ( MAKE-14PILE ?auto_296017 ?auto_296018 ?auto_296019 ?auto_296020 ?auto_296021 ?auto_296022 ?auto_296023 ?auto_296024 ?auto_296025 ?auto_296026 ?auto_296027 ?auto_296028 ?auto_296029 ?auto_296030 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296045 - BLOCK
      ?auto_296046 - BLOCK
      ?auto_296047 - BLOCK
      ?auto_296048 - BLOCK
      ?auto_296049 - BLOCK
      ?auto_296050 - BLOCK
      ?auto_296051 - BLOCK
      ?auto_296052 - BLOCK
      ?auto_296053 - BLOCK
      ?auto_296054 - BLOCK
      ?auto_296055 - BLOCK
      ?auto_296056 - BLOCK
      ?auto_296057 - BLOCK
      ?auto_296058 - BLOCK
    )
    :vars
    (
      ?auto_296059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296058 ?auto_296059 ) ( ON-TABLE ?auto_296045 ) ( ON ?auto_296046 ?auto_296045 ) ( ON ?auto_296047 ?auto_296046 ) ( ON ?auto_296048 ?auto_296047 ) ( not ( = ?auto_296045 ?auto_296046 ) ) ( not ( = ?auto_296045 ?auto_296047 ) ) ( not ( = ?auto_296045 ?auto_296048 ) ) ( not ( = ?auto_296045 ?auto_296049 ) ) ( not ( = ?auto_296045 ?auto_296050 ) ) ( not ( = ?auto_296045 ?auto_296051 ) ) ( not ( = ?auto_296045 ?auto_296052 ) ) ( not ( = ?auto_296045 ?auto_296053 ) ) ( not ( = ?auto_296045 ?auto_296054 ) ) ( not ( = ?auto_296045 ?auto_296055 ) ) ( not ( = ?auto_296045 ?auto_296056 ) ) ( not ( = ?auto_296045 ?auto_296057 ) ) ( not ( = ?auto_296045 ?auto_296058 ) ) ( not ( = ?auto_296045 ?auto_296059 ) ) ( not ( = ?auto_296046 ?auto_296047 ) ) ( not ( = ?auto_296046 ?auto_296048 ) ) ( not ( = ?auto_296046 ?auto_296049 ) ) ( not ( = ?auto_296046 ?auto_296050 ) ) ( not ( = ?auto_296046 ?auto_296051 ) ) ( not ( = ?auto_296046 ?auto_296052 ) ) ( not ( = ?auto_296046 ?auto_296053 ) ) ( not ( = ?auto_296046 ?auto_296054 ) ) ( not ( = ?auto_296046 ?auto_296055 ) ) ( not ( = ?auto_296046 ?auto_296056 ) ) ( not ( = ?auto_296046 ?auto_296057 ) ) ( not ( = ?auto_296046 ?auto_296058 ) ) ( not ( = ?auto_296046 ?auto_296059 ) ) ( not ( = ?auto_296047 ?auto_296048 ) ) ( not ( = ?auto_296047 ?auto_296049 ) ) ( not ( = ?auto_296047 ?auto_296050 ) ) ( not ( = ?auto_296047 ?auto_296051 ) ) ( not ( = ?auto_296047 ?auto_296052 ) ) ( not ( = ?auto_296047 ?auto_296053 ) ) ( not ( = ?auto_296047 ?auto_296054 ) ) ( not ( = ?auto_296047 ?auto_296055 ) ) ( not ( = ?auto_296047 ?auto_296056 ) ) ( not ( = ?auto_296047 ?auto_296057 ) ) ( not ( = ?auto_296047 ?auto_296058 ) ) ( not ( = ?auto_296047 ?auto_296059 ) ) ( not ( = ?auto_296048 ?auto_296049 ) ) ( not ( = ?auto_296048 ?auto_296050 ) ) ( not ( = ?auto_296048 ?auto_296051 ) ) ( not ( = ?auto_296048 ?auto_296052 ) ) ( not ( = ?auto_296048 ?auto_296053 ) ) ( not ( = ?auto_296048 ?auto_296054 ) ) ( not ( = ?auto_296048 ?auto_296055 ) ) ( not ( = ?auto_296048 ?auto_296056 ) ) ( not ( = ?auto_296048 ?auto_296057 ) ) ( not ( = ?auto_296048 ?auto_296058 ) ) ( not ( = ?auto_296048 ?auto_296059 ) ) ( not ( = ?auto_296049 ?auto_296050 ) ) ( not ( = ?auto_296049 ?auto_296051 ) ) ( not ( = ?auto_296049 ?auto_296052 ) ) ( not ( = ?auto_296049 ?auto_296053 ) ) ( not ( = ?auto_296049 ?auto_296054 ) ) ( not ( = ?auto_296049 ?auto_296055 ) ) ( not ( = ?auto_296049 ?auto_296056 ) ) ( not ( = ?auto_296049 ?auto_296057 ) ) ( not ( = ?auto_296049 ?auto_296058 ) ) ( not ( = ?auto_296049 ?auto_296059 ) ) ( not ( = ?auto_296050 ?auto_296051 ) ) ( not ( = ?auto_296050 ?auto_296052 ) ) ( not ( = ?auto_296050 ?auto_296053 ) ) ( not ( = ?auto_296050 ?auto_296054 ) ) ( not ( = ?auto_296050 ?auto_296055 ) ) ( not ( = ?auto_296050 ?auto_296056 ) ) ( not ( = ?auto_296050 ?auto_296057 ) ) ( not ( = ?auto_296050 ?auto_296058 ) ) ( not ( = ?auto_296050 ?auto_296059 ) ) ( not ( = ?auto_296051 ?auto_296052 ) ) ( not ( = ?auto_296051 ?auto_296053 ) ) ( not ( = ?auto_296051 ?auto_296054 ) ) ( not ( = ?auto_296051 ?auto_296055 ) ) ( not ( = ?auto_296051 ?auto_296056 ) ) ( not ( = ?auto_296051 ?auto_296057 ) ) ( not ( = ?auto_296051 ?auto_296058 ) ) ( not ( = ?auto_296051 ?auto_296059 ) ) ( not ( = ?auto_296052 ?auto_296053 ) ) ( not ( = ?auto_296052 ?auto_296054 ) ) ( not ( = ?auto_296052 ?auto_296055 ) ) ( not ( = ?auto_296052 ?auto_296056 ) ) ( not ( = ?auto_296052 ?auto_296057 ) ) ( not ( = ?auto_296052 ?auto_296058 ) ) ( not ( = ?auto_296052 ?auto_296059 ) ) ( not ( = ?auto_296053 ?auto_296054 ) ) ( not ( = ?auto_296053 ?auto_296055 ) ) ( not ( = ?auto_296053 ?auto_296056 ) ) ( not ( = ?auto_296053 ?auto_296057 ) ) ( not ( = ?auto_296053 ?auto_296058 ) ) ( not ( = ?auto_296053 ?auto_296059 ) ) ( not ( = ?auto_296054 ?auto_296055 ) ) ( not ( = ?auto_296054 ?auto_296056 ) ) ( not ( = ?auto_296054 ?auto_296057 ) ) ( not ( = ?auto_296054 ?auto_296058 ) ) ( not ( = ?auto_296054 ?auto_296059 ) ) ( not ( = ?auto_296055 ?auto_296056 ) ) ( not ( = ?auto_296055 ?auto_296057 ) ) ( not ( = ?auto_296055 ?auto_296058 ) ) ( not ( = ?auto_296055 ?auto_296059 ) ) ( not ( = ?auto_296056 ?auto_296057 ) ) ( not ( = ?auto_296056 ?auto_296058 ) ) ( not ( = ?auto_296056 ?auto_296059 ) ) ( not ( = ?auto_296057 ?auto_296058 ) ) ( not ( = ?auto_296057 ?auto_296059 ) ) ( not ( = ?auto_296058 ?auto_296059 ) ) ( ON ?auto_296057 ?auto_296058 ) ( ON ?auto_296056 ?auto_296057 ) ( ON ?auto_296055 ?auto_296056 ) ( ON ?auto_296054 ?auto_296055 ) ( ON ?auto_296053 ?auto_296054 ) ( ON ?auto_296052 ?auto_296053 ) ( ON ?auto_296051 ?auto_296052 ) ( ON ?auto_296050 ?auto_296051 ) ( CLEAR ?auto_296048 ) ( ON ?auto_296049 ?auto_296050 ) ( CLEAR ?auto_296049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296045 ?auto_296046 ?auto_296047 ?auto_296048 ?auto_296049 )
      ( MAKE-14PILE ?auto_296045 ?auto_296046 ?auto_296047 ?auto_296048 ?auto_296049 ?auto_296050 ?auto_296051 ?auto_296052 ?auto_296053 ?auto_296054 ?auto_296055 ?auto_296056 ?auto_296057 ?auto_296058 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296074 - BLOCK
      ?auto_296075 - BLOCK
      ?auto_296076 - BLOCK
      ?auto_296077 - BLOCK
      ?auto_296078 - BLOCK
      ?auto_296079 - BLOCK
      ?auto_296080 - BLOCK
      ?auto_296081 - BLOCK
      ?auto_296082 - BLOCK
      ?auto_296083 - BLOCK
      ?auto_296084 - BLOCK
      ?auto_296085 - BLOCK
      ?auto_296086 - BLOCK
      ?auto_296087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296087 ) ( ON-TABLE ?auto_296074 ) ( ON ?auto_296075 ?auto_296074 ) ( ON ?auto_296076 ?auto_296075 ) ( ON ?auto_296077 ?auto_296076 ) ( not ( = ?auto_296074 ?auto_296075 ) ) ( not ( = ?auto_296074 ?auto_296076 ) ) ( not ( = ?auto_296074 ?auto_296077 ) ) ( not ( = ?auto_296074 ?auto_296078 ) ) ( not ( = ?auto_296074 ?auto_296079 ) ) ( not ( = ?auto_296074 ?auto_296080 ) ) ( not ( = ?auto_296074 ?auto_296081 ) ) ( not ( = ?auto_296074 ?auto_296082 ) ) ( not ( = ?auto_296074 ?auto_296083 ) ) ( not ( = ?auto_296074 ?auto_296084 ) ) ( not ( = ?auto_296074 ?auto_296085 ) ) ( not ( = ?auto_296074 ?auto_296086 ) ) ( not ( = ?auto_296074 ?auto_296087 ) ) ( not ( = ?auto_296075 ?auto_296076 ) ) ( not ( = ?auto_296075 ?auto_296077 ) ) ( not ( = ?auto_296075 ?auto_296078 ) ) ( not ( = ?auto_296075 ?auto_296079 ) ) ( not ( = ?auto_296075 ?auto_296080 ) ) ( not ( = ?auto_296075 ?auto_296081 ) ) ( not ( = ?auto_296075 ?auto_296082 ) ) ( not ( = ?auto_296075 ?auto_296083 ) ) ( not ( = ?auto_296075 ?auto_296084 ) ) ( not ( = ?auto_296075 ?auto_296085 ) ) ( not ( = ?auto_296075 ?auto_296086 ) ) ( not ( = ?auto_296075 ?auto_296087 ) ) ( not ( = ?auto_296076 ?auto_296077 ) ) ( not ( = ?auto_296076 ?auto_296078 ) ) ( not ( = ?auto_296076 ?auto_296079 ) ) ( not ( = ?auto_296076 ?auto_296080 ) ) ( not ( = ?auto_296076 ?auto_296081 ) ) ( not ( = ?auto_296076 ?auto_296082 ) ) ( not ( = ?auto_296076 ?auto_296083 ) ) ( not ( = ?auto_296076 ?auto_296084 ) ) ( not ( = ?auto_296076 ?auto_296085 ) ) ( not ( = ?auto_296076 ?auto_296086 ) ) ( not ( = ?auto_296076 ?auto_296087 ) ) ( not ( = ?auto_296077 ?auto_296078 ) ) ( not ( = ?auto_296077 ?auto_296079 ) ) ( not ( = ?auto_296077 ?auto_296080 ) ) ( not ( = ?auto_296077 ?auto_296081 ) ) ( not ( = ?auto_296077 ?auto_296082 ) ) ( not ( = ?auto_296077 ?auto_296083 ) ) ( not ( = ?auto_296077 ?auto_296084 ) ) ( not ( = ?auto_296077 ?auto_296085 ) ) ( not ( = ?auto_296077 ?auto_296086 ) ) ( not ( = ?auto_296077 ?auto_296087 ) ) ( not ( = ?auto_296078 ?auto_296079 ) ) ( not ( = ?auto_296078 ?auto_296080 ) ) ( not ( = ?auto_296078 ?auto_296081 ) ) ( not ( = ?auto_296078 ?auto_296082 ) ) ( not ( = ?auto_296078 ?auto_296083 ) ) ( not ( = ?auto_296078 ?auto_296084 ) ) ( not ( = ?auto_296078 ?auto_296085 ) ) ( not ( = ?auto_296078 ?auto_296086 ) ) ( not ( = ?auto_296078 ?auto_296087 ) ) ( not ( = ?auto_296079 ?auto_296080 ) ) ( not ( = ?auto_296079 ?auto_296081 ) ) ( not ( = ?auto_296079 ?auto_296082 ) ) ( not ( = ?auto_296079 ?auto_296083 ) ) ( not ( = ?auto_296079 ?auto_296084 ) ) ( not ( = ?auto_296079 ?auto_296085 ) ) ( not ( = ?auto_296079 ?auto_296086 ) ) ( not ( = ?auto_296079 ?auto_296087 ) ) ( not ( = ?auto_296080 ?auto_296081 ) ) ( not ( = ?auto_296080 ?auto_296082 ) ) ( not ( = ?auto_296080 ?auto_296083 ) ) ( not ( = ?auto_296080 ?auto_296084 ) ) ( not ( = ?auto_296080 ?auto_296085 ) ) ( not ( = ?auto_296080 ?auto_296086 ) ) ( not ( = ?auto_296080 ?auto_296087 ) ) ( not ( = ?auto_296081 ?auto_296082 ) ) ( not ( = ?auto_296081 ?auto_296083 ) ) ( not ( = ?auto_296081 ?auto_296084 ) ) ( not ( = ?auto_296081 ?auto_296085 ) ) ( not ( = ?auto_296081 ?auto_296086 ) ) ( not ( = ?auto_296081 ?auto_296087 ) ) ( not ( = ?auto_296082 ?auto_296083 ) ) ( not ( = ?auto_296082 ?auto_296084 ) ) ( not ( = ?auto_296082 ?auto_296085 ) ) ( not ( = ?auto_296082 ?auto_296086 ) ) ( not ( = ?auto_296082 ?auto_296087 ) ) ( not ( = ?auto_296083 ?auto_296084 ) ) ( not ( = ?auto_296083 ?auto_296085 ) ) ( not ( = ?auto_296083 ?auto_296086 ) ) ( not ( = ?auto_296083 ?auto_296087 ) ) ( not ( = ?auto_296084 ?auto_296085 ) ) ( not ( = ?auto_296084 ?auto_296086 ) ) ( not ( = ?auto_296084 ?auto_296087 ) ) ( not ( = ?auto_296085 ?auto_296086 ) ) ( not ( = ?auto_296085 ?auto_296087 ) ) ( not ( = ?auto_296086 ?auto_296087 ) ) ( ON ?auto_296086 ?auto_296087 ) ( ON ?auto_296085 ?auto_296086 ) ( ON ?auto_296084 ?auto_296085 ) ( ON ?auto_296083 ?auto_296084 ) ( ON ?auto_296082 ?auto_296083 ) ( ON ?auto_296081 ?auto_296082 ) ( ON ?auto_296080 ?auto_296081 ) ( ON ?auto_296079 ?auto_296080 ) ( CLEAR ?auto_296077 ) ( ON ?auto_296078 ?auto_296079 ) ( CLEAR ?auto_296078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_296074 ?auto_296075 ?auto_296076 ?auto_296077 ?auto_296078 )
      ( MAKE-14PILE ?auto_296074 ?auto_296075 ?auto_296076 ?auto_296077 ?auto_296078 ?auto_296079 ?auto_296080 ?auto_296081 ?auto_296082 ?auto_296083 ?auto_296084 ?auto_296085 ?auto_296086 ?auto_296087 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296102 - BLOCK
      ?auto_296103 - BLOCK
      ?auto_296104 - BLOCK
      ?auto_296105 - BLOCK
      ?auto_296106 - BLOCK
      ?auto_296107 - BLOCK
      ?auto_296108 - BLOCK
      ?auto_296109 - BLOCK
      ?auto_296110 - BLOCK
      ?auto_296111 - BLOCK
      ?auto_296112 - BLOCK
      ?auto_296113 - BLOCK
      ?auto_296114 - BLOCK
      ?auto_296115 - BLOCK
    )
    :vars
    (
      ?auto_296116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296115 ?auto_296116 ) ( ON-TABLE ?auto_296102 ) ( ON ?auto_296103 ?auto_296102 ) ( ON ?auto_296104 ?auto_296103 ) ( not ( = ?auto_296102 ?auto_296103 ) ) ( not ( = ?auto_296102 ?auto_296104 ) ) ( not ( = ?auto_296102 ?auto_296105 ) ) ( not ( = ?auto_296102 ?auto_296106 ) ) ( not ( = ?auto_296102 ?auto_296107 ) ) ( not ( = ?auto_296102 ?auto_296108 ) ) ( not ( = ?auto_296102 ?auto_296109 ) ) ( not ( = ?auto_296102 ?auto_296110 ) ) ( not ( = ?auto_296102 ?auto_296111 ) ) ( not ( = ?auto_296102 ?auto_296112 ) ) ( not ( = ?auto_296102 ?auto_296113 ) ) ( not ( = ?auto_296102 ?auto_296114 ) ) ( not ( = ?auto_296102 ?auto_296115 ) ) ( not ( = ?auto_296102 ?auto_296116 ) ) ( not ( = ?auto_296103 ?auto_296104 ) ) ( not ( = ?auto_296103 ?auto_296105 ) ) ( not ( = ?auto_296103 ?auto_296106 ) ) ( not ( = ?auto_296103 ?auto_296107 ) ) ( not ( = ?auto_296103 ?auto_296108 ) ) ( not ( = ?auto_296103 ?auto_296109 ) ) ( not ( = ?auto_296103 ?auto_296110 ) ) ( not ( = ?auto_296103 ?auto_296111 ) ) ( not ( = ?auto_296103 ?auto_296112 ) ) ( not ( = ?auto_296103 ?auto_296113 ) ) ( not ( = ?auto_296103 ?auto_296114 ) ) ( not ( = ?auto_296103 ?auto_296115 ) ) ( not ( = ?auto_296103 ?auto_296116 ) ) ( not ( = ?auto_296104 ?auto_296105 ) ) ( not ( = ?auto_296104 ?auto_296106 ) ) ( not ( = ?auto_296104 ?auto_296107 ) ) ( not ( = ?auto_296104 ?auto_296108 ) ) ( not ( = ?auto_296104 ?auto_296109 ) ) ( not ( = ?auto_296104 ?auto_296110 ) ) ( not ( = ?auto_296104 ?auto_296111 ) ) ( not ( = ?auto_296104 ?auto_296112 ) ) ( not ( = ?auto_296104 ?auto_296113 ) ) ( not ( = ?auto_296104 ?auto_296114 ) ) ( not ( = ?auto_296104 ?auto_296115 ) ) ( not ( = ?auto_296104 ?auto_296116 ) ) ( not ( = ?auto_296105 ?auto_296106 ) ) ( not ( = ?auto_296105 ?auto_296107 ) ) ( not ( = ?auto_296105 ?auto_296108 ) ) ( not ( = ?auto_296105 ?auto_296109 ) ) ( not ( = ?auto_296105 ?auto_296110 ) ) ( not ( = ?auto_296105 ?auto_296111 ) ) ( not ( = ?auto_296105 ?auto_296112 ) ) ( not ( = ?auto_296105 ?auto_296113 ) ) ( not ( = ?auto_296105 ?auto_296114 ) ) ( not ( = ?auto_296105 ?auto_296115 ) ) ( not ( = ?auto_296105 ?auto_296116 ) ) ( not ( = ?auto_296106 ?auto_296107 ) ) ( not ( = ?auto_296106 ?auto_296108 ) ) ( not ( = ?auto_296106 ?auto_296109 ) ) ( not ( = ?auto_296106 ?auto_296110 ) ) ( not ( = ?auto_296106 ?auto_296111 ) ) ( not ( = ?auto_296106 ?auto_296112 ) ) ( not ( = ?auto_296106 ?auto_296113 ) ) ( not ( = ?auto_296106 ?auto_296114 ) ) ( not ( = ?auto_296106 ?auto_296115 ) ) ( not ( = ?auto_296106 ?auto_296116 ) ) ( not ( = ?auto_296107 ?auto_296108 ) ) ( not ( = ?auto_296107 ?auto_296109 ) ) ( not ( = ?auto_296107 ?auto_296110 ) ) ( not ( = ?auto_296107 ?auto_296111 ) ) ( not ( = ?auto_296107 ?auto_296112 ) ) ( not ( = ?auto_296107 ?auto_296113 ) ) ( not ( = ?auto_296107 ?auto_296114 ) ) ( not ( = ?auto_296107 ?auto_296115 ) ) ( not ( = ?auto_296107 ?auto_296116 ) ) ( not ( = ?auto_296108 ?auto_296109 ) ) ( not ( = ?auto_296108 ?auto_296110 ) ) ( not ( = ?auto_296108 ?auto_296111 ) ) ( not ( = ?auto_296108 ?auto_296112 ) ) ( not ( = ?auto_296108 ?auto_296113 ) ) ( not ( = ?auto_296108 ?auto_296114 ) ) ( not ( = ?auto_296108 ?auto_296115 ) ) ( not ( = ?auto_296108 ?auto_296116 ) ) ( not ( = ?auto_296109 ?auto_296110 ) ) ( not ( = ?auto_296109 ?auto_296111 ) ) ( not ( = ?auto_296109 ?auto_296112 ) ) ( not ( = ?auto_296109 ?auto_296113 ) ) ( not ( = ?auto_296109 ?auto_296114 ) ) ( not ( = ?auto_296109 ?auto_296115 ) ) ( not ( = ?auto_296109 ?auto_296116 ) ) ( not ( = ?auto_296110 ?auto_296111 ) ) ( not ( = ?auto_296110 ?auto_296112 ) ) ( not ( = ?auto_296110 ?auto_296113 ) ) ( not ( = ?auto_296110 ?auto_296114 ) ) ( not ( = ?auto_296110 ?auto_296115 ) ) ( not ( = ?auto_296110 ?auto_296116 ) ) ( not ( = ?auto_296111 ?auto_296112 ) ) ( not ( = ?auto_296111 ?auto_296113 ) ) ( not ( = ?auto_296111 ?auto_296114 ) ) ( not ( = ?auto_296111 ?auto_296115 ) ) ( not ( = ?auto_296111 ?auto_296116 ) ) ( not ( = ?auto_296112 ?auto_296113 ) ) ( not ( = ?auto_296112 ?auto_296114 ) ) ( not ( = ?auto_296112 ?auto_296115 ) ) ( not ( = ?auto_296112 ?auto_296116 ) ) ( not ( = ?auto_296113 ?auto_296114 ) ) ( not ( = ?auto_296113 ?auto_296115 ) ) ( not ( = ?auto_296113 ?auto_296116 ) ) ( not ( = ?auto_296114 ?auto_296115 ) ) ( not ( = ?auto_296114 ?auto_296116 ) ) ( not ( = ?auto_296115 ?auto_296116 ) ) ( ON ?auto_296114 ?auto_296115 ) ( ON ?auto_296113 ?auto_296114 ) ( ON ?auto_296112 ?auto_296113 ) ( ON ?auto_296111 ?auto_296112 ) ( ON ?auto_296110 ?auto_296111 ) ( ON ?auto_296109 ?auto_296110 ) ( ON ?auto_296108 ?auto_296109 ) ( ON ?auto_296107 ?auto_296108 ) ( ON ?auto_296106 ?auto_296107 ) ( CLEAR ?auto_296104 ) ( ON ?auto_296105 ?auto_296106 ) ( CLEAR ?auto_296105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296102 ?auto_296103 ?auto_296104 ?auto_296105 )
      ( MAKE-14PILE ?auto_296102 ?auto_296103 ?auto_296104 ?auto_296105 ?auto_296106 ?auto_296107 ?auto_296108 ?auto_296109 ?auto_296110 ?auto_296111 ?auto_296112 ?auto_296113 ?auto_296114 ?auto_296115 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296131 - BLOCK
      ?auto_296132 - BLOCK
      ?auto_296133 - BLOCK
      ?auto_296134 - BLOCK
      ?auto_296135 - BLOCK
      ?auto_296136 - BLOCK
      ?auto_296137 - BLOCK
      ?auto_296138 - BLOCK
      ?auto_296139 - BLOCK
      ?auto_296140 - BLOCK
      ?auto_296141 - BLOCK
      ?auto_296142 - BLOCK
      ?auto_296143 - BLOCK
      ?auto_296144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296144 ) ( ON-TABLE ?auto_296131 ) ( ON ?auto_296132 ?auto_296131 ) ( ON ?auto_296133 ?auto_296132 ) ( not ( = ?auto_296131 ?auto_296132 ) ) ( not ( = ?auto_296131 ?auto_296133 ) ) ( not ( = ?auto_296131 ?auto_296134 ) ) ( not ( = ?auto_296131 ?auto_296135 ) ) ( not ( = ?auto_296131 ?auto_296136 ) ) ( not ( = ?auto_296131 ?auto_296137 ) ) ( not ( = ?auto_296131 ?auto_296138 ) ) ( not ( = ?auto_296131 ?auto_296139 ) ) ( not ( = ?auto_296131 ?auto_296140 ) ) ( not ( = ?auto_296131 ?auto_296141 ) ) ( not ( = ?auto_296131 ?auto_296142 ) ) ( not ( = ?auto_296131 ?auto_296143 ) ) ( not ( = ?auto_296131 ?auto_296144 ) ) ( not ( = ?auto_296132 ?auto_296133 ) ) ( not ( = ?auto_296132 ?auto_296134 ) ) ( not ( = ?auto_296132 ?auto_296135 ) ) ( not ( = ?auto_296132 ?auto_296136 ) ) ( not ( = ?auto_296132 ?auto_296137 ) ) ( not ( = ?auto_296132 ?auto_296138 ) ) ( not ( = ?auto_296132 ?auto_296139 ) ) ( not ( = ?auto_296132 ?auto_296140 ) ) ( not ( = ?auto_296132 ?auto_296141 ) ) ( not ( = ?auto_296132 ?auto_296142 ) ) ( not ( = ?auto_296132 ?auto_296143 ) ) ( not ( = ?auto_296132 ?auto_296144 ) ) ( not ( = ?auto_296133 ?auto_296134 ) ) ( not ( = ?auto_296133 ?auto_296135 ) ) ( not ( = ?auto_296133 ?auto_296136 ) ) ( not ( = ?auto_296133 ?auto_296137 ) ) ( not ( = ?auto_296133 ?auto_296138 ) ) ( not ( = ?auto_296133 ?auto_296139 ) ) ( not ( = ?auto_296133 ?auto_296140 ) ) ( not ( = ?auto_296133 ?auto_296141 ) ) ( not ( = ?auto_296133 ?auto_296142 ) ) ( not ( = ?auto_296133 ?auto_296143 ) ) ( not ( = ?auto_296133 ?auto_296144 ) ) ( not ( = ?auto_296134 ?auto_296135 ) ) ( not ( = ?auto_296134 ?auto_296136 ) ) ( not ( = ?auto_296134 ?auto_296137 ) ) ( not ( = ?auto_296134 ?auto_296138 ) ) ( not ( = ?auto_296134 ?auto_296139 ) ) ( not ( = ?auto_296134 ?auto_296140 ) ) ( not ( = ?auto_296134 ?auto_296141 ) ) ( not ( = ?auto_296134 ?auto_296142 ) ) ( not ( = ?auto_296134 ?auto_296143 ) ) ( not ( = ?auto_296134 ?auto_296144 ) ) ( not ( = ?auto_296135 ?auto_296136 ) ) ( not ( = ?auto_296135 ?auto_296137 ) ) ( not ( = ?auto_296135 ?auto_296138 ) ) ( not ( = ?auto_296135 ?auto_296139 ) ) ( not ( = ?auto_296135 ?auto_296140 ) ) ( not ( = ?auto_296135 ?auto_296141 ) ) ( not ( = ?auto_296135 ?auto_296142 ) ) ( not ( = ?auto_296135 ?auto_296143 ) ) ( not ( = ?auto_296135 ?auto_296144 ) ) ( not ( = ?auto_296136 ?auto_296137 ) ) ( not ( = ?auto_296136 ?auto_296138 ) ) ( not ( = ?auto_296136 ?auto_296139 ) ) ( not ( = ?auto_296136 ?auto_296140 ) ) ( not ( = ?auto_296136 ?auto_296141 ) ) ( not ( = ?auto_296136 ?auto_296142 ) ) ( not ( = ?auto_296136 ?auto_296143 ) ) ( not ( = ?auto_296136 ?auto_296144 ) ) ( not ( = ?auto_296137 ?auto_296138 ) ) ( not ( = ?auto_296137 ?auto_296139 ) ) ( not ( = ?auto_296137 ?auto_296140 ) ) ( not ( = ?auto_296137 ?auto_296141 ) ) ( not ( = ?auto_296137 ?auto_296142 ) ) ( not ( = ?auto_296137 ?auto_296143 ) ) ( not ( = ?auto_296137 ?auto_296144 ) ) ( not ( = ?auto_296138 ?auto_296139 ) ) ( not ( = ?auto_296138 ?auto_296140 ) ) ( not ( = ?auto_296138 ?auto_296141 ) ) ( not ( = ?auto_296138 ?auto_296142 ) ) ( not ( = ?auto_296138 ?auto_296143 ) ) ( not ( = ?auto_296138 ?auto_296144 ) ) ( not ( = ?auto_296139 ?auto_296140 ) ) ( not ( = ?auto_296139 ?auto_296141 ) ) ( not ( = ?auto_296139 ?auto_296142 ) ) ( not ( = ?auto_296139 ?auto_296143 ) ) ( not ( = ?auto_296139 ?auto_296144 ) ) ( not ( = ?auto_296140 ?auto_296141 ) ) ( not ( = ?auto_296140 ?auto_296142 ) ) ( not ( = ?auto_296140 ?auto_296143 ) ) ( not ( = ?auto_296140 ?auto_296144 ) ) ( not ( = ?auto_296141 ?auto_296142 ) ) ( not ( = ?auto_296141 ?auto_296143 ) ) ( not ( = ?auto_296141 ?auto_296144 ) ) ( not ( = ?auto_296142 ?auto_296143 ) ) ( not ( = ?auto_296142 ?auto_296144 ) ) ( not ( = ?auto_296143 ?auto_296144 ) ) ( ON ?auto_296143 ?auto_296144 ) ( ON ?auto_296142 ?auto_296143 ) ( ON ?auto_296141 ?auto_296142 ) ( ON ?auto_296140 ?auto_296141 ) ( ON ?auto_296139 ?auto_296140 ) ( ON ?auto_296138 ?auto_296139 ) ( ON ?auto_296137 ?auto_296138 ) ( ON ?auto_296136 ?auto_296137 ) ( ON ?auto_296135 ?auto_296136 ) ( CLEAR ?auto_296133 ) ( ON ?auto_296134 ?auto_296135 ) ( CLEAR ?auto_296134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_296131 ?auto_296132 ?auto_296133 ?auto_296134 )
      ( MAKE-14PILE ?auto_296131 ?auto_296132 ?auto_296133 ?auto_296134 ?auto_296135 ?auto_296136 ?auto_296137 ?auto_296138 ?auto_296139 ?auto_296140 ?auto_296141 ?auto_296142 ?auto_296143 ?auto_296144 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296159 - BLOCK
      ?auto_296160 - BLOCK
      ?auto_296161 - BLOCK
      ?auto_296162 - BLOCK
      ?auto_296163 - BLOCK
      ?auto_296164 - BLOCK
      ?auto_296165 - BLOCK
      ?auto_296166 - BLOCK
      ?auto_296167 - BLOCK
      ?auto_296168 - BLOCK
      ?auto_296169 - BLOCK
      ?auto_296170 - BLOCK
      ?auto_296171 - BLOCK
      ?auto_296172 - BLOCK
    )
    :vars
    (
      ?auto_296173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296172 ?auto_296173 ) ( ON-TABLE ?auto_296159 ) ( ON ?auto_296160 ?auto_296159 ) ( not ( = ?auto_296159 ?auto_296160 ) ) ( not ( = ?auto_296159 ?auto_296161 ) ) ( not ( = ?auto_296159 ?auto_296162 ) ) ( not ( = ?auto_296159 ?auto_296163 ) ) ( not ( = ?auto_296159 ?auto_296164 ) ) ( not ( = ?auto_296159 ?auto_296165 ) ) ( not ( = ?auto_296159 ?auto_296166 ) ) ( not ( = ?auto_296159 ?auto_296167 ) ) ( not ( = ?auto_296159 ?auto_296168 ) ) ( not ( = ?auto_296159 ?auto_296169 ) ) ( not ( = ?auto_296159 ?auto_296170 ) ) ( not ( = ?auto_296159 ?auto_296171 ) ) ( not ( = ?auto_296159 ?auto_296172 ) ) ( not ( = ?auto_296159 ?auto_296173 ) ) ( not ( = ?auto_296160 ?auto_296161 ) ) ( not ( = ?auto_296160 ?auto_296162 ) ) ( not ( = ?auto_296160 ?auto_296163 ) ) ( not ( = ?auto_296160 ?auto_296164 ) ) ( not ( = ?auto_296160 ?auto_296165 ) ) ( not ( = ?auto_296160 ?auto_296166 ) ) ( not ( = ?auto_296160 ?auto_296167 ) ) ( not ( = ?auto_296160 ?auto_296168 ) ) ( not ( = ?auto_296160 ?auto_296169 ) ) ( not ( = ?auto_296160 ?auto_296170 ) ) ( not ( = ?auto_296160 ?auto_296171 ) ) ( not ( = ?auto_296160 ?auto_296172 ) ) ( not ( = ?auto_296160 ?auto_296173 ) ) ( not ( = ?auto_296161 ?auto_296162 ) ) ( not ( = ?auto_296161 ?auto_296163 ) ) ( not ( = ?auto_296161 ?auto_296164 ) ) ( not ( = ?auto_296161 ?auto_296165 ) ) ( not ( = ?auto_296161 ?auto_296166 ) ) ( not ( = ?auto_296161 ?auto_296167 ) ) ( not ( = ?auto_296161 ?auto_296168 ) ) ( not ( = ?auto_296161 ?auto_296169 ) ) ( not ( = ?auto_296161 ?auto_296170 ) ) ( not ( = ?auto_296161 ?auto_296171 ) ) ( not ( = ?auto_296161 ?auto_296172 ) ) ( not ( = ?auto_296161 ?auto_296173 ) ) ( not ( = ?auto_296162 ?auto_296163 ) ) ( not ( = ?auto_296162 ?auto_296164 ) ) ( not ( = ?auto_296162 ?auto_296165 ) ) ( not ( = ?auto_296162 ?auto_296166 ) ) ( not ( = ?auto_296162 ?auto_296167 ) ) ( not ( = ?auto_296162 ?auto_296168 ) ) ( not ( = ?auto_296162 ?auto_296169 ) ) ( not ( = ?auto_296162 ?auto_296170 ) ) ( not ( = ?auto_296162 ?auto_296171 ) ) ( not ( = ?auto_296162 ?auto_296172 ) ) ( not ( = ?auto_296162 ?auto_296173 ) ) ( not ( = ?auto_296163 ?auto_296164 ) ) ( not ( = ?auto_296163 ?auto_296165 ) ) ( not ( = ?auto_296163 ?auto_296166 ) ) ( not ( = ?auto_296163 ?auto_296167 ) ) ( not ( = ?auto_296163 ?auto_296168 ) ) ( not ( = ?auto_296163 ?auto_296169 ) ) ( not ( = ?auto_296163 ?auto_296170 ) ) ( not ( = ?auto_296163 ?auto_296171 ) ) ( not ( = ?auto_296163 ?auto_296172 ) ) ( not ( = ?auto_296163 ?auto_296173 ) ) ( not ( = ?auto_296164 ?auto_296165 ) ) ( not ( = ?auto_296164 ?auto_296166 ) ) ( not ( = ?auto_296164 ?auto_296167 ) ) ( not ( = ?auto_296164 ?auto_296168 ) ) ( not ( = ?auto_296164 ?auto_296169 ) ) ( not ( = ?auto_296164 ?auto_296170 ) ) ( not ( = ?auto_296164 ?auto_296171 ) ) ( not ( = ?auto_296164 ?auto_296172 ) ) ( not ( = ?auto_296164 ?auto_296173 ) ) ( not ( = ?auto_296165 ?auto_296166 ) ) ( not ( = ?auto_296165 ?auto_296167 ) ) ( not ( = ?auto_296165 ?auto_296168 ) ) ( not ( = ?auto_296165 ?auto_296169 ) ) ( not ( = ?auto_296165 ?auto_296170 ) ) ( not ( = ?auto_296165 ?auto_296171 ) ) ( not ( = ?auto_296165 ?auto_296172 ) ) ( not ( = ?auto_296165 ?auto_296173 ) ) ( not ( = ?auto_296166 ?auto_296167 ) ) ( not ( = ?auto_296166 ?auto_296168 ) ) ( not ( = ?auto_296166 ?auto_296169 ) ) ( not ( = ?auto_296166 ?auto_296170 ) ) ( not ( = ?auto_296166 ?auto_296171 ) ) ( not ( = ?auto_296166 ?auto_296172 ) ) ( not ( = ?auto_296166 ?auto_296173 ) ) ( not ( = ?auto_296167 ?auto_296168 ) ) ( not ( = ?auto_296167 ?auto_296169 ) ) ( not ( = ?auto_296167 ?auto_296170 ) ) ( not ( = ?auto_296167 ?auto_296171 ) ) ( not ( = ?auto_296167 ?auto_296172 ) ) ( not ( = ?auto_296167 ?auto_296173 ) ) ( not ( = ?auto_296168 ?auto_296169 ) ) ( not ( = ?auto_296168 ?auto_296170 ) ) ( not ( = ?auto_296168 ?auto_296171 ) ) ( not ( = ?auto_296168 ?auto_296172 ) ) ( not ( = ?auto_296168 ?auto_296173 ) ) ( not ( = ?auto_296169 ?auto_296170 ) ) ( not ( = ?auto_296169 ?auto_296171 ) ) ( not ( = ?auto_296169 ?auto_296172 ) ) ( not ( = ?auto_296169 ?auto_296173 ) ) ( not ( = ?auto_296170 ?auto_296171 ) ) ( not ( = ?auto_296170 ?auto_296172 ) ) ( not ( = ?auto_296170 ?auto_296173 ) ) ( not ( = ?auto_296171 ?auto_296172 ) ) ( not ( = ?auto_296171 ?auto_296173 ) ) ( not ( = ?auto_296172 ?auto_296173 ) ) ( ON ?auto_296171 ?auto_296172 ) ( ON ?auto_296170 ?auto_296171 ) ( ON ?auto_296169 ?auto_296170 ) ( ON ?auto_296168 ?auto_296169 ) ( ON ?auto_296167 ?auto_296168 ) ( ON ?auto_296166 ?auto_296167 ) ( ON ?auto_296165 ?auto_296166 ) ( ON ?auto_296164 ?auto_296165 ) ( ON ?auto_296163 ?auto_296164 ) ( ON ?auto_296162 ?auto_296163 ) ( CLEAR ?auto_296160 ) ( ON ?auto_296161 ?auto_296162 ) ( CLEAR ?auto_296161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296159 ?auto_296160 ?auto_296161 )
      ( MAKE-14PILE ?auto_296159 ?auto_296160 ?auto_296161 ?auto_296162 ?auto_296163 ?auto_296164 ?auto_296165 ?auto_296166 ?auto_296167 ?auto_296168 ?auto_296169 ?auto_296170 ?auto_296171 ?auto_296172 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296188 - BLOCK
      ?auto_296189 - BLOCK
      ?auto_296190 - BLOCK
      ?auto_296191 - BLOCK
      ?auto_296192 - BLOCK
      ?auto_296193 - BLOCK
      ?auto_296194 - BLOCK
      ?auto_296195 - BLOCK
      ?auto_296196 - BLOCK
      ?auto_296197 - BLOCK
      ?auto_296198 - BLOCK
      ?auto_296199 - BLOCK
      ?auto_296200 - BLOCK
      ?auto_296201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296201 ) ( ON-TABLE ?auto_296188 ) ( ON ?auto_296189 ?auto_296188 ) ( not ( = ?auto_296188 ?auto_296189 ) ) ( not ( = ?auto_296188 ?auto_296190 ) ) ( not ( = ?auto_296188 ?auto_296191 ) ) ( not ( = ?auto_296188 ?auto_296192 ) ) ( not ( = ?auto_296188 ?auto_296193 ) ) ( not ( = ?auto_296188 ?auto_296194 ) ) ( not ( = ?auto_296188 ?auto_296195 ) ) ( not ( = ?auto_296188 ?auto_296196 ) ) ( not ( = ?auto_296188 ?auto_296197 ) ) ( not ( = ?auto_296188 ?auto_296198 ) ) ( not ( = ?auto_296188 ?auto_296199 ) ) ( not ( = ?auto_296188 ?auto_296200 ) ) ( not ( = ?auto_296188 ?auto_296201 ) ) ( not ( = ?auto_296189 ?auto_296190 ) ) ( not ( = ?auto_296189 ?auto_296191 ) ) ( not ( = ?auto_296189 ?auto_296192 ) ) ( not ( = ?auto_296189 ?auto_296193 ) ) ( not ( = ?auto_296189 ?auto_296194 ) ) ( not ( = ?auto_296189 ?auto_296195 ) ) ( not ( = ?auto_296189 ?auto_296196 ) ) ( not ( = ?auto_296189 ?auto_296197 ) ) ( not ( = ?auto_296189 ?auto_296198 ) ) ( not ( = ?auto_296189 ?auto_296199 ) ) ( not ( = ?auto_296189 ?auto_296200 ) ) ( not ( = ?auto_296189 ?auto_296201 ) ) ( not ( = ?auto_296190 ?auto_296191 ) ) ( not ( = ?auto_296190 ?auto_296192 ) ) ( not ( = ?auto_296190 ?auto_296193 ) ) ( not ( = ?auto_296190 ?auto_296194 ) ) ( not ( = ?auto_296190 ?auto_296195 ) ) ( not ( = ?auto_296190 ?auto_296196 ) ) ( not ( = ?auto_296190 ?auto_296197 ) ) ( not ( = ?auto_296190 ?auto_296198 ) ) ( not ( = ?auto_296190 ?auto_296199 ) ) ( not ( = ?auto_296190 ?auto_296200 ) ) ( not ( = ?auto_296190 ?auto_296201 ) ) ( not ( = ?auto_296191 ?auto_296192 ) ) ( not ( = ?auto_296191 ?auto_296193 ) ) ( not ( = ?auto_296191 ?auto_296194 ) ) ( not ( = ?auto_296191 ?auto_296195 ) ) ( not ( = ?auto_296191 ?auto_296196 ) ) ( not ( = ?auto_296191 ?auto_296197 ) ) ( not ( = ?auto_296191 ?auto_296198 ) ) ( not ( = ?auto_296191 ?auto_296199 ) ) ( not ( = ?auto_296191 ?auto_296200 ) ) ( not ( = ?auto_296191 ?auto_296201 ) ) ( not ( = ?auto_296192 ?auto_296193 ) ) ( not ( = ?auto_296192 ?auto_296194 ) ) ( not ( = ?auto_296192 ?auto_296195 ) ) ( not ( = ?auto_296192 ?auto_296196 ) ) ( not ( = ?auto_296192 ?auto_296197 ) ) ( not ( = ?auto_296192 ?auto_296198 ) ) ( not ( = ?auto_296192 ?auto_296199 ) ) ( not ( = ?auto_296192 ?auto_296200 ) ) ( not ( = ?auto_296192 ?auto_296201 ) ) ( not ( = ?auto_296193 ?auto_296194 ) ) ( not ( = ?auto_296193 ?auto_296195 ) ) ( not ( = ?auto_296193 ?auto_296196 ) ) ( not ( = ?auto_296193 ?auto_296197 ) ) ( not ( = ?auto_296193 ?auto_296198 ) ) ( not ( = ?auto_296193 ?auto_296199 ) ) ( not ( = ?auto_296193 ?auto_296200 ) ) ( not ( = ?auto_296193 ?auto_296201 ) ) ( not ( = ?auto_296194 ?auto_296195 ) ) ( not ( = ?auto_296194 ?auto_296196 ) ) ( not ( = ?auto_296194 ?auto_296197 ) ) ( not ( = ?auto_296194 ?auto_296198 ) ) ( not ( = ?auto_296194 ?auto_296199 ) ) ( not ( = ?auto_296194 ?auto_296200 ) ) ( not ( = ?auto_296194 ?auto_296201 ) ) ( not ( = ?auto_296195 ?auto_296196 ) ) ( not ( = ?auto_296195 ?auto_296197 ) ) ( not ( = ?auto_296195 ?auto_296198 ) ) ( not ( = ?auto_296195 ?auto_296199 ) ) ( not ( = ?auto_296195 ?auto_296200 ) ) ( not ( = ?auto_296195 ?auto_296201 ) ) ( not ( = ?auto_296196 ?auto_296197 ) ) ( not ( = ?auto_296196 ?auto_296198 ) ) ( not ( = ?auto_296196 ?auto_296199 ) ) ( not ( = ?auto_296196 ?auto_296200 ) ) ( not ( = ?auto_296196 ?auto_296201 ) ) ( not ( = ?auto_296197 ?auto_296198 ) ) ( not ( = ?auto_296197 ?auto_296199 ) ) ( not ( = ?auto_296197 ?auto_296200 ) ) ( not ( = ?auto_296197 ?auto_296201 ) ) ( not ( = ?auto_296198 ?auto_296199 ) ) ( not ( = ?auto_296198 ?auto_296200 ) ) ( not ( = ?auto_296198 ?auto_296201 ) ) ( not ( = ?auto_296199 ?auto_296200 ) ) ( not ( = ?auto_296199 ?auto_296201 ) ) ( not ( = ?auto_296200 ?auto_296201 ) ) ( ON ?auto_296200 ?auto_296201 ) ( ON ?auto_296199 ?auto_296200 ) ( ON ?auto_296198 ?auto_296199 ) ( ON ?auto_296197 ?auto_296198 ) ( ON ?auto_296196 ?auto_296197 ) ( ON ?auto_296195 ?auto_296196 ) ( ON ?auto_296194 ?auto_296195 ) ( ON ?auto_296193 ?auto_296194 ) ( ON ?auto_296192 ?auto_296193 ) ( ON ?auto_296191 ?auto_296192 ) ( CLEAR ?auto_296189 ) ( ON ?auto_296190 ?auto_296191 ) ( CLEAR ?auto_296190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_296188 ?auto_296189 ?auto_296190 )
      ( MAKE-14PILE ?auto_296188 ?auto_296189 ?auto_296190 ?auto_296191 ?auto_296192 ?auto_296193 ?auto_296194 ?auto_296195 ?auto_296196 ?auto_296197 ?auto_296198 ?auto_296199 ?auto_296200 ?auto_296201 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296216 - BLOCK
      ?auto_296217 - BLOCK
      ?auto_296218 - BLOCK
      ?auto_296219 - BLOCK
      ?auto_296220 - BLOCK
      ?auto_296221 - BLOCK
      ?auto_296222 - BLOCK
      ?auto_296223 - BLOCK
      ?auto_296224 - BLOCK
      ?auto_296225 - BLOCK
      ?auto_296226 - BLOCK
      ?auto_296227 - BLOCK
      ?auto_296228 - BLOCK
      ?auto_296229 - BLOCK
    )
    :vars
    (
      ?auto_296230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296229 ?auto_296230 ) ( ON-TABLE ?auto_296216 ) ( not ( = ?auto_296216 ?auto_296217 ) ) ( not ( = ?auto_296216 ?auto_296218 ) ) ( not ( = ?auto_296216 ?auto_296219 ) ) ( not ( = ?auto_296216 ?auto_296220 ) ) ( not ( = ?auto_296216 ?auto_296221 ) ) ( not ( = ?auto_296216 ?auto_296222 ) ) ( not ( = ?auto_296216 ?auto_296223 ) ) ( not ( = ?auto_296216 ?auto_296224 ) ) ( not ( = ?auto_296216 ?auto_296225 ) ) ( not ( = ?auto_296216 ?auto_296226 ) ) ( not ( = ?auto_296216 ?auto_296227 ) ) ( not ( = ?auto_296216 ?auto_296228 ) ) ( not ( = ?auto_296216 ?auto_296229 ) ) ( not ( = ?auto_296216 ?auto_296230 ) ) ( not ( = ?auto_296217 ?auto_296218 ) ) ( not ( = ?auto_296217 ?auto_296219 ) ) ( not ( = ?auto_296217 ?auto_296220 ) ) ( not ( = ?auto_296217 ?auto_296221 ) ) ( not ( = ?auto_296217 ?auto_296222 ) ) ( not ( = ?auto_296217 ?auto_296223 ) ) ( not ( = ?auto_296217 ?auto_296224 ) ) ( not ( = ?auto_296217 ?auto_296225 ) ) ( not ( = ?auto_296217 ?auto_296226 ) ) ( not ( = ?auto_296217 ?auto_296227 ) ) ( not ( = ?auto_296217 ?auto_296228 ) ) ( not ( = ?auto_296217 ?auto_296229 ) ) ( not ( = ?auto_296217 ?auto_296230 ) ) ( not ( = ?auto_296218 ?auto_296219 ) ) ( not ( = ?auto_296218 ?auto_296220 ) ) ( not ( = ?auto_296218 ?auto_296221 ) ) ( not ( = ?auto_296218 ?auto_296222 ) ) ( not ( = ?auto_296218 ?auto_296223 ) ) ( not ( = ?auto_296218 ?auto_296224 ) ) ( not ( = ?auto_296218 ?auto_296225 ) ) ( not ( = ?auto_296218 ?auto_296226 ) ) ( not ( = ?auto_296218 ?auto_296227 ) ) ( not ( = ?auto_296218 ?auto_296228 ) ) ( not ( = ?auto_296218 ?auto_296229 ) ) ( not ( = ?auto_296218 ?auto_296230 ) ) ( not ( = ?auto_296219 ?auto_296220 ) ) ( not ( = ?auto_296219 ?auto_296221 ) ) ( not ( = ?auto_296219 ?auto_296222 ) ) ( not ( = ?auto_296219 ?auto_296223 ) ) ( not ( = ?auto_296219 ?auto_296224 ) ) ( not ( = ?auto_296219 ?auto_296225 ) ) ( not ( = ?auto_296219 ?auto_296226 ) ) ( not ( = ?auto_296219 ?auto_296227 ) ) ( not ( = ?auto_296219 ?auto_296228 ) ) ( not ( = ?auto_296219 ?auto_296229 ) ) ( not ( = ?auto_296219 ?auto_296230 ) ) ( not ( = ?auto_296220 ?auto_296221 ) ) ( not ( = ?auto_296220 ?auto_296222 ) ) ( not ( = ?auto_296220 ?auto_296223 ) ) ( not ( = ?auto_296220 ?auto_296224 ) ) ( not ( = ?auto_296220 ?auto_296225 ) ) ( not ( = ?auto_296220 ?auto_296226 ) ) ( not ( = ?auto_296220 ?auto_296227 ) ) ( not ( = ?auto_296220 ?auto_296228 ) ) ( not ( = ?auto_296220 ?auto_296229 ) ) ( not ( = ?auto_296220 ?auto_296230 ) ) ( not ( = ?auto_296221 ?auto_296222 ) ) ( not ( = ?auto_296221 ?auto_296223 ) ) ( not ( = ?auto_296221 ?auto_296224 ) ) ( not ( = ?auto_296221 ?auto_296225 ) ) ( not ( = ?auto_296221 ?auto_296226 ) ) ( not ( = ?auto_296221 ?auto_296227 ) ) ( not ( = ?auto_296221 ?auto_296228 ) ) ( not ( = ?auto_296221 ?auto_296229 ) ) ( not ( = ?auto_296221 ?auto_296230 ) ) ( not ( = ?auto_296222 ?auto_296223 ) ) ( not ( = ?auto_296222 ?auto_296224 ) ) ( not ( = ?auto_296222 ?auto_296225 ) ) ( not ( = ?auto_296222 ?auto_296226 ) ) ( not ( = ?auto_296222 ?auto_296227 ) ) ( not ( = ?auto_296222 ?auto_296228 ) ) ( not ( = ?auto_296222 ?auto_296229 ) ) ( not ( = ?auto_296222 ?auto_296230 ) ) ( not ( = ?auto_296223 ?auto_296224 ) ) ( not ( = ?auto_296223 ?auto_296225 ) ) ( not ( = ?auto_296223 ?auto_296226 ) ) ( not ( = ?auto_296223 ?auto_296227 ) ) ( not ( = ?auto_296223 ?auto_296228 ) ) ( not ( = ?auto_296223 ?auto_296229 ) ) ( not ( = ?auto_296223 ?auto_296230 ) ) ( not ( = ?auto_296224 ?auto_296225 ) ) ( not ( = ?auto_296224 ?auto_296226 ) ) ( not ( = ?auto_296224 ?auto_296227 ) ) ( not ( = ?auto_296224 ?auto_296228 ) ) ( not ( = ?auto_296224 ?auto_296229 ) ) ( not ( = ?auto_296224 ?auto_296230 ) ) ( not ( = ?auto_296225 ?auto_296226 ) ) ( not ( = ?auto_296225 ?auto_296227 ) ) ( not ( = ?auto_296225 ?auto_296228 ) ) ( not ( = ?auto_296225 ?auto_296229 ) ) ( not ( = ?auto_296225 ?auto_296230 ) ) ( not ( = ?auto_296226 ?auto_296227 ) ) ( not ( = ?auto_296226 ?auto_296228 ) ) ( not ( = ?auto_296226 ?auto_296229 ) ) ( not ( = ?auto_296226 ?auto_296230 ) ) ( not ( = ?auto_296227 ?auto_296228 ) ) ( not ( = ?auto_296227 ?auto_296229 ) ) ( not ( = ?auto_296227 ?auto_296230 ) ) ( not ( = ?auto_296228 ?auto_296229 ) ) ( not ( = ?auto_296228 ?auto_296230 ) ) ( not ( = ?auto_296229 ?auto_296230 ) ) ( ON ?auto_296228 ?auto_296229 ) ( ON ?auto_296227 ?auto_296228 ) ( ON ?auto_296226 ?auto_296227 ) ( ON ?auto_296225 ?auto_296226 ) ( ON ?auto_296224 ?auto_296225 ) ( ON ?auto_296223 ?auto_296224 ) ( ON ?auto_296222 ?auto_296223 ) ( ON ?auto_296221 ?auto_296222 ) ( ON ?auto_296220 ?auto_296221 ) ( ON ?auto_296219 ?auto_296220 ) ( ON ?auto_296218 ?auto_296219 ) ( CLEAR ?auto_296216 ) ( ON ?auto_296217 ?auto_296218 ) ( CLEAR ?auto_296217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296216 ?auto_296217 )
      ( MAKE-14PILE ?auto_296216 ?auto_296217 ?auto_296218 ?auto_296219 ?auto_296220 ?auto_296221 ?auto_296222 ?auto_296223 ?auto_296224 ?auto_296225 ?auto_296226 ?auto_296227 ?auto_296228 ?auto_296229 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296245 - BLOCK
      ?auto_296246 - BLOCK
      ?auto_296247 - BLOCK
      ?auto_296248 - BLOCK
      ?auto_296249 - BLOCK
      ?auto_296250 - BLOCK
      ?auto_296251 - BLOCK
      ?auto_296252 - BLOCK
      ?auto_296253 - BLOCK
      ?auto_296254 - BLOCK
      ?auto_296255 - BLOCK
      ?auto_296256 - BLOCK
      ?auto_296257 - BLOCK
      ?auto_296258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296258 ) ( ON-TABLE ?auto_296245 ) ( not ( = ?auto_296245 ?auto_296246 ) ) ( not ( = ?auto_296245 ?auto_296247 ) ) ( not ( = ?auto_296245 ?auto_296248 ) ) ( not ( = ?auto_296245 ?auto_296249 ) ) ( not ( = ?auto_296245 ?auto_296250 ) ) ( not ( = ?auto_296245 ?auto_296251 ) ) ( not ( = ?auto_296245 ?auto_296252 ) ) ( not ( = ?auto_296245 ?auto_296253 ) ) ( not ( = ?auto_296245 ?auto_296254 ) ) ( not ( = ?auto_296245 ?auto_296255 ) ) ( not ( = ?auto_296245 ?auto_296256 ) ) ( not ( = ?auto_296245 ?auto_296257 ) ) ( not ( = ?auto_296245 ?auto_296258 ) ) ( not ( = ?auto_296246 ?auto_296247 ) ) ( not ( = ?auto_296246 ?auto_296248 ) ) ( not ( = ?auto_296246 ?auto_296249 ) ) ( not ( = ?auto_296246 ?auto_296250 ) ) ( not ( = ?auto_296246 ?auto_296251 ) ) ( not ( = ?auto_296246 ?auto_296252 ) ) ( not ( = ?auto_296246 ?auto_296253 ) ) ( not ( = ?auto_296246 ?auto_296254 ) ) ( not ( = ?auto_296246 ?auto_296255 ) ) ( not ( = ?auto_296246 ?auto_296256 ) ) ( not ( = ?auto_296246 ?auto_296257 ) ) ( not ( = ?auto_296246 ?auto_296258 ) ) ( not ( = ?auto_296247 ?auto_296248 ) ) ( not ( = ?auto_296247 ?auto_296249 ) ) ( not ( = ?auto_296247 ?auto_296250 ) ) ( not ( = ?auto_296247 ?auto_296251 ) ) ( not ( = ?auto_296247 ?auto_296252 ) ) ( not ( = ?auto_296247 ?auto_296253 ) ) ( not ( = ?auto_296247 ?auto_296254 ) ) ( not ( = ?auto_296247 ?auto_296255 ) ) ( not ( = ?auto_296247 ?auto_296256 ) ) ( not ( = ?auto_296247 ?auto_296257 ) ) ( not ( = ?auto_296247 ?auto_296258 ) ) ( not ( = ?auto_296248 ?auto_296249 ) ) ( not ( = ?auto_296248 ?auto_296250 ) ) ( not ( = ?auto_296248 ?auto_296251 ) ) ( not ( = ?auto_296248 ?auto_296252 ) ) ( not ( = ?auto_296248 ?auto_296253 ) ) ( not ( = ?auto_296248 ?auto_296254 ) ) ( not ( = ?auto_296248 ?auto_296255 ) ) ( not ( = ?auto_296248 ?auto_296256 ) ) ( not ( = ?auto_296248 ?auto_296257 ) ) ( not ( = ?auto_296248 ?auto_296258 ) ) ( not ( = ?auto_296249 ?auto_296250 ) ) ( not ( = ?auto_296249 ?auto_296251 ) ) ( not ( = ?auto_296249 ?auto_296252 ) ) ( not ( = ?auto_296249 ?auto_296253 ) ) ( not ( = ?auto_296249 ?auto_296254 ) ) ( not ( = ?auto_296249 ?auto_296255 ) ) ( not ( = ?auto_296249 ?auto_296256 ) ) ( not ( = ?auto_296249 ?auto_296257 ) ) ( not ( = ?auto_296249 ?auto_296258 ) ) ( not ( = ?auto_296250 ?auto_296251 ) ) ( not ( = ?auto_296250 ?auto_296252 ) ) ( not ( = ?auto_296250 ?auto_296253 ) ) ( not ( = ?auto_296250 ?auto_296254 ) ) ( not ( = ?auto_296250 ?auto_296255 ) ) ( not ( = ?auto_296250 ?auto_296256 ) ) ( not ( = ?auto_296250 ?auto_296257 ) ) ( not ( = ?auto_296250 ?auto_296258 ) ) ( not ( = ?auto_296251 ?auto_296252 ) ) ( not ( = ?auto_296251 ?auto_296253 ) ) ( not ( = ?auto_296251 ?auto_296254 ) ) ( not ( = ?auto_296251 ?auto_296255 ) ) ( not ( = ?auto_296251 ?auto_296256 ) ) ( not ( = ?auto_296251 ?auto_296257 ) ) ( not ( = ?auto_296251 ?auto_296258 ) ) ( not ( = ?auto_296252 ?auto_296253 ) ) ( not ( = ?auto_296252 ?auto_296254 ) ) ( not ( = ?auto_296252 ?auto_296255 ) ) ( not ( = ?auto_296252 ?auto_296256 ) ) ( not ( = ?auto_296252 ?auto_296257 ) ) ( not ( = ?auto_296252 ?auto_296258 ) ) ( not ( = ?auto_296253 ?auto_296254 ) ) ( not ( = ?auto_296253 ?auto_296255 ) ) ( not ( = ?auto_296253 ?auto_296256 ) ) ( not ( = ?auto_296253 ?auto_296257 ) ) ( not ( = ?auto_296253 ?auto_296258 ) ) ( not ( = ?auto_296254 ?auto_296255 ) ) ( not ( = ?auto_296254 ?auto_296256 ) ) ( not ( = ?auto_296254 ?auto_296257 ) ) ( not ( = ?auto_296254 ?auto_296258 ) ) ( not ( = ?auto_296255 ?auto_296256 ) ) ( not ( = ?auto_296255 ?auto_296257 ) ) ( not ( = ?auto_296255 ?auto_296258 ) ) ( not ( = ?auto_296256 ?auto_296257 ) ) ( not ( = ?auto_296256 ?auto_296258 ) ) ( not ( = ?auto_296257 ?auto_296258 ) ) ( ON ?auto_296257 ?auto_296258 ) ( ON ?auto_296256 ?auto_296257 ) ( ON ?auto_296255 ?auto_296256 ) ( ON ?auto_296254 ?auto_296255 ) ( ON ?auto_296253 ?auto_296254 ) ( ON ?auto_296252 ?auto_296253 ) ( ON ?auto_296251 ?auto_296252 ) ( ON ?auto_296250 ?auto_296251 ) ( ON ?auto_296249 ?auto_296250 ) ( ON ?auto_296248 ?auto_296249 ) ( ON ?auto_296247 ?auto_296248 ) ( CLEAR ?auto_296245 ) ( ON ?auto_296246 ?auto_296247 ) ( CLEAR ?auto_296246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_296245 ?auto_296246 )
      ( MAKE-14PILE ?auto_296245 ?auto_296246 ?auto_296247 ?auto_296248 ?auto_296249 ?auto_296250 ?auto_296251 ?auto_296252 ?auto_296253 ?auto_296254 ?auto_296255 ?auto_296256 ?auto_296257 ?auto_296258 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296273 - BLOCK
      ?auto_296274 - BLOCK
      ?auto_296275 - BLOCK
      ?auto_296276 - BLOCK
      ?auto_296277 - BLOCK
      ?auto_296278 - BLOCK
      ?auto_296279 - BLOCK
      ?auto_296280 - BLOCK
      ?auto_296281 - BLOCK
      ?auto_296282 - BLOCK
      ?auto_296283 - BLOCK
      ?auto_296284 - BLOCK
      ?auto_296285 - BLOCK
      ?auto_296286 - BLOCK
    )
    :vars
    (
      ?auto_296287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_296286 ?auto_296287 ) ( not ( = ?auto_296273 ?auto_296274 ) ) ( not ( = ?auto_296273 ?auto_296275 ) ) ( not ( = ?auto_296273 ?auto_296276 ) ) ( not ( = ?auto_296273 ?auto_296277 ) ) ( not ( = ?auto_296273 ?auto_296278 ) ) ( not ( = ?auto_296273 ?auto_296279 ) ) ( not ( = ?auto_296273 ?auto_296280 ) ) ( not ( = ?auto_296273 ?auto_296281 ) ) ( not ( = ?auto_296273 ?auto_296282 ) ) ( not ( = ?auto_296273 ?auto_296283 ) ) ( not ( = ?auto_296273 ?auto_296284 ) ) ( not ( = ?auto_296273 ?auto_296285 ) ) ( not ( = ?auto_296273 ?auto_296286 ) ) ( not ( = ?auto_296273 ?auto_296287 ) ) ( not ( = ?auto_296274 ?auto_296275 ) ) ( not ( = ?auto_296274 ?auto_296276 ) ) ( not ( = ?auto_296274 ?auto_296277 ) ) ( not ( = ?auto_296274 ?auto_296278 ) ) ( not ( = ?auto_296274 ?auto_296279 ) ) ( not ( = ?auto_296274 ?auto_296280 ) ) ( not ( = ?auto_296274 ?auto_296281 ) ) ( not ( = ?auto_296274 ?auto_296282 ) ) ( not ( = ?auto_296274 ?auto_296283 ) ) ( not ( = ?auto_296274 ?auto_296284 ) ) ( not ( = ?auto_296274 ?auto_296285 ) ) ( not ( = ?auto_296274 ?auto_296286 ) ) ( not ( = ?auto_296274 ?auto_296287 ) ) ( not ( = ?auto_296275 ?auto_296276 ) ) ( not ( = ?auto_296275 ?auto_296277 ) ) ( not ( = ?auto_296275 ?auto_296278 ) ) ( not ( = ?auto_296275 ?auto_296279 ) ) ( not ( = ?auto_296275 ?auto_296280 ) ) ( not ( = ?auto_296275 ?auto_296281 ) ) ( not ( = ?auto_296275 ?auto_296282 ) ) ( not ( = ?auto_296275 ?auto_296283 ) ) ( not ( = ?auto_296275 ?auto_296284 ) ) ( not ( = ?auto_296275 ?auto_296285 ) ) ( not ( = ?auto_296275 ?auto_296286 ) ) ( not ( = ?auto_296275 ?auto_296287 ) ) ( not ( = ?auto_296276 ?auto_296277 ) ) ( not ( = ?auto_296276 ?auto_296278 ) ) ( not ( = ?auto_296276 ?auto_296279 ) ) ( not ( = ?auto_296276 ?auto_296280 ) ) ( not ( = ?auto_296276 ?auto_296281 ) ) ( not ( = ?auto_296276 ?auto_296282 ) ) ( not ( = ?auto_296276 ?auto_296283 ) ) ( not ( = ?auto_296276 ?auto_296284 ) ) ( not ( = ?auto_296276 ?auto_296285 ) ) ( not ( = ?auto_296276 ?auto_296286 ) ) ( not ( = ?auto_296276 ?auto_296287 ) ) ( not ( = ?auto_296277 ?auto_296278 ) ) ( not ( = ?auto_296277 ?auto_296279 ) ) ( not ( = ?auto_296277 ?auto_296280 ) ) ( not ( = ?auto_296277 ?auto_296281 ) ) ( not ( = ?auto_296277 ?auto_296282 ) ) ( not ( = ?auto_296277 ?auto_296283 ) ) ( not ( = ?auto_296277 ?auto_296284 ) ) ( not ( = ?auto_296277 ?auto_296285 ) ) ( not ( = ?auto_296277 ?auto_296286 ) ) ( not ( = ?auto_296277 ?auto_296287 ) ) ( not ( = ?auto_296278 ?auto_296279 ) ) ( not ( = ?auto_296278 ?auto_296280 ) ) ( not ( = ?auto_296278 ?auto_296281 ) ) ( not ( = ?auto_296278 ?auto_296282 ) ) ( not ( = ?auto_296278 ?auto_296283 ) ) ( not ( = ?auto_296278 ?auto_296284 ) ) ( not ( = ?auto_296278 ?auto_296285 ) ) ( not ( = ?auto_296278 ?auto_296286 ) ) ( not ( = ?auto_296278 ?auto_296287 ) ) ( not ( = ?auto_296279 ?auto_296280 ) ) ( not ( = ?auto_296279 ?auto_296281 ) ) ( not ( = ?auto_296279 ?auto_296282 ) ) ( not ( = ?auto_296279 ?auto_296283 ) ) ( not ( = ?auto_296279 ?auto_296284 ) ) ( not ( = ?auto_296279 ?auto_296285 ) ) ( not ( = ?auto_296279 ?auto_296286 ) ) ( not ( = ?auto_296279 ?auto_296287 ) ) ( not ( = ?auto_296280 ?auto_296281 ) ) ( not ( = ?auto_296280 ?auto_296282 ) ) ( not ( = ?auto_296280 ?auto_296283 ) ) ( not ( = ?auto_296280 ?auto_296284 ) ) ( not ( = ?auto_296280 ?auto_296285 ) ) ( not ( = ?auto_296280 ?auto_296286 ) ) ( not ( = ?auto_296280 ?auto_296287 ) ) ( not ( = ?auto_296281 ?auto_296282 ) ) ( not ( = ?auto_296281 ?auto_296283 ) ) ( not ( = ?auto_296281 ?auto_296284 ) ) ( not ( = ?auto_296281 ?auto_296285 ) ) ( not ( = ?auto_296281 ?auto_296286 ) ) ( not ( = ?auto_296281 ?auto_296287 ) ) ( not ( = ?auto_296282 ?auto_296283 ) ) ( not ( = ?auto_296282 ?auto_296284 ) ) ( not ( = ?auto_296282 ?auto_296285 ) ) ( not ( = ?auto_296282 ?auto_296286 ) ) ( not ( = ?auto_296282 ?auto_296287 ) ) ( not ( = ?auto_296283 ?auto_296284 ) ) ( not ( = ?auto_296283 ?auto_296285 ) ) ( not ( = ?auto_296283 ?auto_296286 ) ) ( not ( = ?auto_296283 ?auto_296287 ) ) ( not ( = ?auto_296284 ?auto_296285 ) ) ( not ( = ?auto_296284 ?auto_296286 ) ) ( not ( = ?auto_296284 ?auto_296287 ) ) ( not ( = ?auto_296285 ?auto_296286 ) ) ( not ( = ?auto_296285 ?auto_296287 ) ) ( not ( = ?auto_296286 ?auto_296287 ) ) ( ON ?auto_296285 ?auto_296286 ) ( ON ?auto_296284 ?auto_296285 ) ( ON ?auto_296283 ?auto_296284 ) ( ON ?auto_296282 ?auto_296283 ) ( ON ?auto_296281 ?auto_296282 ) ( ON ?auto_296280 ?auto_296281 ) ( ON ?auto_296279 ?auto_296280 ) ( ON ?auto_296278 ?auto_296279 ) ( ON ?auto_296277 ?auto_296278 ) ( ON ?auto_296276 ?auto_296277 ) ( ON ?auto_296275 ?auto_296276 ) ( ON ?auto_296274 ?auto_296275 ) ( ON ?auto_296273 ?auto_296274 ) ( CLEAR ?auto_296273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296273 )
      ( MAKE-14PILE ?auto_296273 ?auto_296274 ?auto_296275 ?auto_296276 ?auto_296277 ?auto_296278 ?auto_296279 ?auto_296280 ?auto_296281 ?auto_296282 ?auto_296283 ?auto_296284 ?auto_296285 ?auto_296286 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296302 - BLOCK
      ?auto_296303 - BLOCK
      ?auto_296304 - BLOCK
      ?auto_296305 - BLOCK
      ?auto_296306 - BLOCK
      ?auto_296307 - BLOCK
      ?auto_296308 - BLOCK
      ?auto_296309 - BLOCK
      ?auto_296310 - BLOCK
      ?auto_296311 - BLOCK
      ?auto_296312 - BLOCK
      ?auto_296313 - BLOCK
      ?auto_296314 - BLOCK
      ?auto_296315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_296315 ) ( not ( = ?auto_296302 ?auto_296303 ) ) ( not ( = ?auto_296302 ?auto_296304 ) ) ( not ( = ?auto_296302 ?auto_296305 ) ) ( not ( = ?auto_296302 ?auto_296306 ) ) ( not ( = ?auto_296302 ?auto_296307 ) ) ( not ( = ?auto_296302 ?auto_296308 ) ) ( not ( = ?auto_296302 ?auto_296309 ) ) ( not ( = ?auto_296302 ?auto_296310 ) ) ( not ( = ?auto_296302 ?auto_296311 ) ) ( not ( = ?auto_296302 ?auto_296312 ) ) ( not ( = ?auto_296302 ?auto_296313 ) ) ( not ( = ?auto_296302 ?auto_296314 ) ) ( not ( = ?auto_296302 ?auto_296315 ) ) ( not ( = ?auto_296303 ?auto_296304 ) ) ( not ( = ?auto_296303 ?auto_296305 ) ) ( not ( = ?auto_296303 ?auto_296306 ) ) ( not ( = ?auto_296303 ?auto_296307 ) ) ( not ( = ?auto_296303 ?auto_296308 ) ) ( not ( = ?auto_296303 ?auto_296309 ) ) ( not ( = ?auto_296303 ?auto_296310 ) ) ( not ( = ?auto_296303 ?auto_296311 ) ) ( not ( = ?auto_296303 ?auto_296312 ) ) ( not ( = ?auto_296303 ?auto_296313 ) ) ( not ( = ?auto_296303 ?auto_296314 ) ) ( not ( = ?auto_296303 ?auto_296315 ) ) ( not ( = ?auto_296304 ?auto_296305 ) ) ( not ( = ?auto_296304 ?auto_296306 ) ) ( not ( = ?auto_296304 ?auto_296307 ) ) ( not ( = ?auto_296304 ?auto_296308 ) ) ( not ( = ?auto_296304 ?auto_296309 ) ) ( not ( = ?auto_296304 ?auto_296310 ) ) ( not ( = ?auto_296304 ?auto_296311 ) ) ( not ( = ?auto_296304 ?auto_296312 ) ) ( not ( = ?auto_296304 ?auto_296313 ) ) ( not ( = ?auto_296304 ?auto_296314 ) ) ( not ( = ?auto_296304 ?auto_296315 ) ) ( not ( = ?auto_296305 ?auto_296306 ) ) ( not ( = ?auto_296305 ?auto_296307 ) ) ( not ( = ?auto_296305 ?auto_296308 ) ) ( not ( = ?auto_296305 ?auto_296309 ) ) ( not ( = ?auto_296305 ?auto_296310 ) ) ( not ( = ?auto_296305 ?auto_296311 ) ) ( not ( = ?auto_296305 ?auto_296312 ) ) ( not ( = ?auto_296305 ?auto_296313 ) ) ( not ( = ?auto_296305 ?auto_296314 ) ) ( not ( = ?auto_296305 ?auto_296315 ) ) ( not ( = ?auto_296306 ?auto_296307 ) ) ( not ( = ?auto_296306 ?auto_296308 ) ) ( not ( = ?auto_296306 ?auto_296309 ) ) ( not ( = ?auto_296306 ?auto_296310 ) ) ( not ( = ?auto_296306 ?auto_296311 ) ) ( not ( = ?auto_296306 ?auto_296312 ) ) ( not ( = ?auto_296306 ?auto_296313 ) ) ( not ( = ?auto_296306 ?auto_296314 ) ) ( not ( = ?auto_296306 ?auto_296315 ) ) ( not ( = ?auto_296307 ?auto_296308 ) ) ( not ( = ?auto_296307 ?auto_296309 ) ) ( not ( = ?auto_296307 ?auto_296310 ) ) ( not ( = ?auto_296307 ?auto_296311 ) ) ( not ( = ?auto_296307 ?auto_296312 ) ) ( not ( = ?auto_296307 ?auto_296313 ) ) ( not ( = ?auto_296307 ?auto_296314 ) ) ( not ( = ?auto_296307 ?auto_296315 ) ) ( not ( = ?auto_296308 ?auto_296309 ) ) ( not ( = ?auto_296308 ?auto_296310 ) ) ( not ( = ?auto_296308 ?auto_296311 ) ) ( not ( = ?auto_296308 ?auto_296312 ) ) ( not ( = ?auto_296308 ?auto_296313 ) ) ( not ( = ?auto_296308 ?auto_296314 ) ) ( not ( = ?auto_296308 ?auto_296315 ) ) ( not ( = ?auto_296309 ?auto_296310 ) ) ( not ( = ?auto_296309 ?auto_296311 ) ) ( not ( = ?auto_296309 ?auto_296312 ) ) ( not ( = ?auto_296309 ?auto_296313 ) ) ( not ( = ?auto_296309 ?auto_296314 ) ) ( not ( = ?auto_296309 ?auto_296315 ) ) ( not ( = ?auto_296310 ?auto_296311 ) ) ( not ( = ?auto_296310 ?auto_296312 ) ) ( not ( = ?auto_296310 ?auto_296313 ) ) ( not ( = ?auto_296310 ?auto_296314 ) ) ( not ( = ?auto_296310 ?auto_296315 ) ) ( not ( = ?auto_296311 ?auto_296312 ) ) ( not ( = ?auto_296311 ?auto_296313 ) ) ( not ( = ?auto_296311 ?auto_296314 ) ) ( not ( = ?auto_296311 ?auto_296315 ) ) ( not ( = ?auto_296312 ?auto_296313 ) ) ( not ( = ?auto_296312 ?auto_296314 ) ) ( not ( = ?auto_296312 ?auto_296315 ) ) ( not ( = ?auto_296313 ?auto_296314 ) ) ( not ( = ?auto_296313 ?auto_296315 ) ) ( not ( = ?auto_296314 ?auto_296315 ) ) ( ON ?auto_296314 ?auto_296315 ) ( ON ?auto_296313 ?auto_296314 ) ( ON ?auto_296312 ?auto_296313 ) ( ON ?auto_296311 ?auto_296312 ) ( ON ?auto_296310 ?auto_296311 ) ( ON ?auto_296309 ?auto_296310 ) ( ON ?auto_296308 ?auto_296309 ) ( ON ?auto_296307 ?auto_296308 ) ( ON ?auto_296306 ?auto_296307 ) ( ON ?auto_296305 ?auto_296306 ) ( ON ?auto_296304 ?auto_296305 ) ( ON ?auto_296303 ?auto_296304 ) ( ON ?auto_296302 ?auto_296303 ) ( CLEAR ?auto_296302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_296302 )
      ( MAKE-14PILE ?auto_296302 ?auto_296303 ?auto_296304 ?auto_296305 ?auto_296306 ?auto_296307 ?auto_296308 ?auto_296309 ?auto_296310 ?auto_296311 ?auto_296312 ?auto_296313 ?auto_296314 ?auto_296315 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_296330 - BLOCK
      ?auto_296331 - BLOCK
      ?auto_296332 - BLOCK
      ?auto_296333 - BLOCK
      ?auto_296334 - BLOCK
      ?auto_296335 - BLOCK
      ?auto_296336 - BLOCK
      ?auto_296337 - BLOCK
      ?auto_296338 - BLOCK
      ?auto_296339 - BLOCK
      ?auto_296340 - BLOCK
      ?auto_296341 - BLOCK
      ?auto_296342 - BLOCK
      ?auto_296343 - BLOCK
    )
    :vars
    (
      ?auto_296344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_296330 ?auto_296331 ) ) ( not ( = ?auto_296330 ?auto_296332 ) ) ( not ( = ?auto_296330 ?auto_296333 ) ) ( not ( = ?auto_296330 ?auto_296334 ) ) ( not ( = ?auto_296330 ?auto_296335 ) ) ( not ( = ?auto_296330 ?auto_296336 ) ) ( not ( = ?auto_296330 ?auto_296337 ) ) ( not ( = ?auto_296330 ?auto_296338 ) ) ( not ( = ?auto_296330 ?auto_296339 ) ) ( not ( = ?auto_296330 ?auto_296340 ) ) ( not ( = ?auto_296330 ?auto_296341 ) ) ( not ( = ?auto_296330 ?auto_296342 ) ) ( not ( = ?auto_296330 ?auto_296343 ) ) ( not ( = ?auto_296331 ?auto_296332 ) ) ( not ( = ?auto_296331 ?auto_296333 ) ) ( not ( = ?auto_296331 ?auto_296334 ) ) ( not ( = ?auto_296331 ?auto_296335 ) ) ( not ( = ?auto_296331 ?auto_296336 ) ) ( not ( = ?auto_296331 ?auto_296337 ) ) ( not ( = ?auto_296331 ?auto_296338 ) ) ( not ( = ?auto_296331 ?auto_296339 ) ) ( not ( = ?auto_296331 ?auto_296340 ) ) ( not ( = ?auto_296331 ?auto_296341 ) ) ( not ( = ?auto_296331 ?auto_296342 ) ) ( not ( = ?auto_296331 ?auto_296343 ) ) ( not ( = ?auto_296332 ?auto_296333 ) ) ( not ( = ?auto_296332 ?auto_296334 ) ) ( not ( = ?auto_296332 ?auto_296335 ) ) ( not ( = ?auto_296332 ?auto_296336 ) ) ( not ( = ?auto_296332 ?auto_296337 ) ) ( not ( = ?auto_296332 ?auto_296338 ) ) ( not ( = ?auto_296332 ?auto_296339 ) ) ( not ( = ?auto_296332 ?auto_296340 ) ) ( not ( = ?auto_296332 ?auto_296341 ) ) ( not ( = ?auto_296332 ?auto_296342 ) ) ( not ( = ?auto_296332 ?auto_296343 ) ) ( not ( = ?auto_296333 ?auto_296334 ) ) ( not ( = ?auto_296333 ?auto_296335 ) ) ( not ( = ?auto_296333 ?auto_296336 ) ) ( not ( = ?auto_296333 ?auto_296337 ) ) ( not ( = ?auto_296333 ?auto_296338 ) ) ( not ( = ?auto_296333 ?auto_296339 ) ) ( not ( = ?auto_296333 ?auto_296340 ) ) ( not ( = ?auto_296333 ?auto_296341 ) ) ( not ( = ?auto_296333 ?auto_296342 ) ) ( not ( = ?auto_296333 ?auto_296343 ) ) ( not ( = ?auto_296334 ?auto_296335 ) ) ( not ( = ?auto_296334 ?auto_296336 ) ) ( not ( = ?auto_296334 ?auto_296337 ) ) ( not ( = ?auto_296334 ?auto_296338 ) ) ( not ( = ?auto_296334 ?auto_296339 ) ) ( not ( = ?auto_296334 ?auto_296340 ) ) ( not ( = ?auto_296334 ?auto_296341 ) ) ( not ( = ?auto_296334 ?auto_296342 ) ) ( not ( = ?auto_296334 ?auto_296343 ) ) ( not ( = ?auto_296335 ?auto_296336 ) ) ( not ( = ?auto_296335 ?auto_296337 ) ) ( not ( = ?auto_296335 ?auto_296338 ) ) ( not ( = ?auto_296335 ?auto_296339 ) ) ( not ( = ?auto_296335 ?auto_296340 ) ) ( not ( = ?auto_296335 ?auto_296341 ) ) ( not ( = ?auto_296335 ?auto_296342 ) ) ( not ( = ?auto_296335 ?auto_296343 ) ) ( not ( = ?auto_296336 ?auto_296337 ) ) ( not ( = ?auto_296336 ?auto_296338 ) ) ( not ( = ?auto_296336 ?auto_296339 ) ) ( not ( = ?auto_296336 ?auto_296340 ) ) ( not ( = ?auto_296336 ?auto_296341 ) ) ( not ( = ?auto_296336 ?auto_296342 ) ) ( not ( = ?auto_296336 ?auto_296343 ) ) ( not ( = ?auto_296337 ?auto_296338 ) ) ( not ( = ?auto_296337 ?auto_296339 ) ) ( not ( = ?auto_296337 ?auto_296340 ) ) ( not ( = ?auto_296337 ?auto_296341 ) ) ( not ( = ?auto_296337 ?auto_296342 ) ) ( not ( = ?auto_296337 ?auto_296343 ) ) ( not ( = ?auto_296338 ?auto_296339 ) ) ( not ( = ?auto_296338 ?auto_296340 ) ) ( not ( = ?auto_296338 ?auto_296341 ) ) ( not ( = ?auto_296338 ?auto_296342 ) ) ( not ( = ?auto_296338 ?auto_296343 ) ) ( not ( = ?auto_296339 ?auto_296340 ) ) ( not ( = ?auto_296339 ?auto_296341 ) ) ( not ( = ?auto_296339 ?auto_296342 ) ) ( not ( = ?auto_296339 ?auto_296343 ) ) ( not ( = ?auto_296340 ?auto_296341 ) ) ( not ( = ?auto_296340 ?auto_296342 ) ) ( not ( = ?auto_296340 ?auto_296343 ) ) ( not ( = ?auto_296341 ?auto_296342 ) ) ( not ( = ?auto_296341 ?auto_296343 ) ) ( not ( = ?auto_296342 ?auto_296343 ) ) ( ON ?auto_296330 ?auto_296344 ) ( not ( = ?auto_296343 ?auto_296344 ) ) ( not ( = ?auto_296342 ?auto_296344 ) ) ( not ( = ?auto_296341 ?auto_296344 ) ) ( not ( = ?auto_296340 ?auto_296344 ) ) ( not ( = ?auto_296339 ?auto_296344 ) ) ( not ( = ?auto_296338 ?auto_296344 ) ) ( not ( = ?auto_296337 ?auto_296344 ) ) ( not ( = ?auto_296336 ?auto_296344 ) ) ( not ( = ?auto_296335 ?auto_296344 ) ) ( not ( = ?auto_296334 ?auto_296344 ) ) ( not ( = ?auto_296333 ?auto_296344 ) ) ( not ( = ?auto_296332 ?auto_296344 ) ) ( not ( = ?auto_296331 ?auto_296344 ) ) ( not ( = ?auto_296330 ?auto_296344 ) ) ( ON ?auto_296331 ?auto_296330 ) ( ON ?auto_296332 ?auto_296331 ) ( ON ?auto_296333 ?auto_296332 ) ( ON ?auto_296334 ?auto_296333 ) ( ON ?auto_296335 ?auto_296334 ) ( ON ?auto_296336 ?auto_296335 ) ( ON ?auto_296337 ?auto_296336 ) ( ON ?auto_296338 ?auto_296337 ) ( ON ?auto_296339 ?auto_296338 ) ( ON ?auto_296340 ?auto_296339 ) ( ON ?auto_296341 ?auto_296340 ) ( ON ?auto_296342 ?auto_296341 ) ( ON ?auto_296343 ?auto_296342 ) ( CLEAR ?auto_296343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_296343 ?auto_296342 ?auto_296341 ?auto_296340 ?auto_296339 ?auto_296338 ?auto_296337 ?auto_296336 ?auto_296335 ?auto_296334 ?auto_296333 ?auto_296332 ?auto_296331 ?auto_296330 )
      ( MAKE-14PILE ?auto_296330 ?auto_296331 ?auto_296332 ?auto_296333 ?auto_296334 ?auto_296335 ?auto_296336 ?auto_296337 ?auto_296338 ?auto_296339 ?auto_296340 ?auto_296341 ?auto_296342 ?auto_296343 ) )
  )

)

