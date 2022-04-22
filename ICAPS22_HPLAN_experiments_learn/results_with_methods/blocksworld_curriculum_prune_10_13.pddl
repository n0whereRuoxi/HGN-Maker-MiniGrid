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
      ?auto_95114 - BLOCK
    )
    :vars
    (
      ?auto_95115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95114 ?auto_95115 ) ( CLEAR ?auto_95114 ) ( HAND-EMPTY ) ( not ( = ?auto_95114 ?auto_95115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95114 ?auto_95115 )
      ( !PUTDOWN ?auto_95114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95121 - BLOCK
      ?auto_95122 - BLOCK
    )
    :vars
    (
      ?auto_95123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95121 ) ( ON ?auto_95122 ?auto_95123 ) ( CLEAR ?auto_95122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95121 ) ( not ( = ?auto_95121 ?auto_95122 ) ) ( not ( = ?auto_95121 ?auto_95123 ) ) ( not ( = ?auto_95122 ?auto_95123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95122 ?auto_95123 )
      ( !STACK ?auto_95122 ?auto_95121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95131 - BLOCK
      ?auto_95132 - BLOCK
    )
    :vars
    (
      ?auto_95133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95132 ?auto_95133 ) ( not ( = ?auto_95131 ?auto_95132 ) ) ( not ( = ?auto_95131 ?auto_95133 ) ) ( not ( = ?auto_95132 ?auto_95133 ) ) ( ON ?auto_95131 ?auto_95132 ) ( CLEAR ?auto_95131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95131 )
      ( MAKE-2PILE ?auto_95131 ?auto_95132 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95142 - BLOCK
      ?auto_95143 - BLOCK
      ?auto_95144 - BLOCK
    )
    :vars
    (
      ?auto_95145 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95143 ) ( ON ?auto_95144 ?auto_95145 ) ( CLEAR ?auto_95144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95142 ) ( ON ?auto_95143 ?auto_95142 ) ( not ( = ?auto_95142 ?auto_95143 ) ) ( not ( = ?auto_95142 ?auto_95144 ) ) ( not ( = ?auto_95142 ?auto_95145 ) ) ( not ( = ?auto_95143 ?auto_95144 ) ) ( not ( = ?auto_95143 ?auto_95145 ) ) ( not ( = ?auto_95144 ?auto_95145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95144 ?auto_95145 )
      ( !STACK ?auto_95144 ?auto_95143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95156 - BLOCK
      ?auto_95157 - BLOCK
      ?auto_95158 - BLOCK
    )
    :vars
    (
      ?auto_95159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95158 ?auto_95159 ) ( ON-TABLE ?auto_95156 ) ( not ( = ?auto_95156 ?auto_95157 ) ) ( not ( = ?auto_95156 ?auto_95158 ) ) ( not ( = ?auto_95156 ?auto_95159 ) ) ( not ( = ?auto_95157 ?auto_95158 ) ) ( not ( = ?auto_95157 ?auto_95159 ) ) ( not ( = ?auto_95158 ?auto_95159 ) ) ( CLEAR ?auto_95156 ) ( ON ?auto_95157 ?auto_95158 ) ( CLEAR ?auto_95157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95156 ?auto_95157 )
      ( MAKE-3PILE ?auto_95156 ?auto_95157 ?auto_95158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95170 - BLOCK
      ?auto_95171 - BLOCK
      ?auto_95172 - BLOCK
    )
    :vars
    (
      ?auto_95173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95172 ?auto_95173 ) ( not ( = ?auto_95170 ?auto_95171 ) ) ( not ( = ?auto_95170 ?auto_95172 ) ) ( not ( = ?auto_95170 ?auto_95173 ) ) ( not ( = ?auto_95171 ?auto_95172 ) ) ( not ( = ?auto_95171 ?auto_95173 ) ) ( not ( = ?auto_95172 ?auto_95173 ) ) ( ON ?auto_95171 ?auto_95172 ) ( ON ?auto_95170 ?auto_95171 ) ( CLEAR ?auto_95170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95170 )
      ( MAKE-3PILE ?auto_95170 ?auto_95171 ?auto_95172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95185 - BLOCK
      ?auto_95186 - BLOCK
      ?auto_95187 - BLOCK
      ?auto_95188 - BLOCK
    )
    :vars
    (
      ?auto_95189 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95187 ) ( ON ?auto_95188 ?auto_95189 ) ( CLEAR ?auto_95188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95185 ) ( ON ?auto_95186 ?auto_95185 ) ( ON ?auto_95187 ?auto_95186 ) ( not ( = ?auto_95185 ?auto_95186 ) ) ( not ( = ?auto_95185 ?auto_95187 ) ) ( not ( = ?auto_95185 ?auto_95188 ) ) ( not ( = ?auto_95185 ?auto_95189 ) ) ( not ( = ?auto_95186 ?auto_95187 ) ) ( not ( = ?auto_95186 ?auto_95188 ) ) ( not ( = ?auto_95186 ?auto_95189 ) ) ( not ( = ?auto_95187 ?auto_95188 ) ) ( not ( = ?auto_95187 ?auto_95189 ) ) ( not ( = ?auto_95188 ?auto_95189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95188 ?auto_95189 )
      ( !STACK ?auto_95188 ?auto_95187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95203 - BLOCK
      ?auto_95204 - BLOCK
      ?auto_95205 - BLOCK
      ?auto_95206 - BLOCK
    )
    :vars
    (
      ?auto_95207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95206 ?auto_95207 ) ( ON-TABLE ?auto_95203 ) ( ON ?auto_95204 ?auto_95203 ) ( not ( = ?auto_95203 ?auto_95204 ) ) ( not ( = ?auto_95203 ?auto_95205 ) ) ( not ( = ?auto_95203 ?auto_95206 ) ) ( not ( = ?auto_95203 ?auto_95207 ) ) ( not ( = ?auto_95204 ?auto_95205 ) ) ( not ( = ?auto_95204 ?auto_95206 ) ) ( not ( = ?auto_95204 ?auto_95207 ) ) ( not ( = ?auto_95205 ?auto_95206 ) ) ( not ( = ?auto_95205 ?auto_95207 ) ) ( not ( = ?auto_95206 ?auto_95207 ) ) ( CLEAR ?auto_95204 ) ( ON ?auto_95205 ?auto_95206 ) ( CLEAR ?auto_95205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95203 ?auto_95204 ?auto_95205 )
      ( MAKE-4PILE ?auto_95203 ?auto_95204 ?auto_95205 ?auto_95206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95221 - BLOCK
      ?auto_95222 - BLOCK
      ?auto_95223 - BLOCK
      ?auto_95224 - BLOCK
    )
    :vars
    (
      ?auto_95225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95224 ?auto_95225 ) ( ON-TABLE ?auto_95221 ) ( not ( = ?auto_95221 ?auto_95222 ) ) ( not ( = ?auto_95221 ?auto_95223 ) ) ( not ( = ?auto_95221 ?auto_95224 ) ) ( not ( = ?auto_95221 ?auto_95225 ) ) ( not ( = ?auto_95222 ?auto_95223 ) ) ( not ( = ?auto_95222 ?auto_95224 ) ) ( not ( = ?auto_95222 ?auto_95225 ) ) ( not ( = ?auto_95223 ?auto_95224 ) ) ( not ( = ?auto_95223 ?auto_95225 ) ) ( not ( = ?auto_95224 ?auto_95225 ) ) ( ON ?auto_95223 ?auto_95224 ) ( CLEAR ?auto_95221 ) ( ON ?auto_95222 ?auto_95223 ) ( CLEAR ?auto_95222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95221 ?auto_95222 )
      ( MAKE-4PILE ?auto_95221 ?auto_95222 ?auto_95223 ?auto_95224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95239 - BLOCK
      ?auto_95240 - BLOCK
      ?auto_95241 - BLOCK
      ?auto_95242 - BLOCK
    )
    :vars
    (
      ?auto_95243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95242 ?auto_95243 ) ( not ( = ?auto_95239 ?auto_95240 ) ) ( not ( = ?auto_95239 ?auto_95241 ) ) ( not ( = ?auto_95239 ?auto_95242 ) ) ( not ( = ?auto_95239 ?auto_95243 ) ) ( not ( = ?auto_95240 ?auto_95241 ) ) ( not ( = ?auto_95240 ?auto_95242 ) ) ( not ( = ?auto_95240 ?auto_95243 ) ) ( not ( = ?auto_95241 ?auto_95242 ) ) ( not ( = ?auto_95241 ?auto_95243 ) ) ( not ( = ?auto_95242 ?auto_95243 ) ) ( ON ?auto_95241 ?auto_95242 ) ( ON ?auto_95240 ?auto_95241 ) ( ON ?auto_95239 ?auto_95240 ) ( CLEAR ?auto_95239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95239 )
      ( MAKE-4PILE ?auto_95239 ?auto_95240 ?auto_95241 ?auto_95242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95258 - BLOCK
      ?auto_95259 - BLOCK
      ?auto_95260 - BLOCK
      ?auto_95261 - BLOCK
      ?auto_95262 - BLOCK
    )
    :vars
    (
      ?auto_95263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95261 ) ( ON ?auto_95262 ?auto_95263 ) ( CLEAR ?auto_95262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95258 ) ( ON ?auto_95259 ?auto_95258 ) ( ON ?auto_95260 ?auto_95259 ) ( ON ?auto_95261 ?auto_95260 ) ( not ( = ?auto_95258 ?auto_95259 ) ) ( not ( = ?auto_95258 ?auto_95260 ) ) ( not ( = ?auto_95258 ?auto_95261 ) ) ( not ( = ?auto_95258 ?auto_95262 ) ) ( not ( = ?auto_95258 ?auto_95263 ) ) ( not ( = ?auto_95259 ?auto_95260 ) ) ( not ( = ?auto_95259 ?auto_95261 ) ) ( not ( = ?auto_95259 ?auto_95262 ) ) ( not ( = ?auto_95259 ?auto_95263 ) ) ( not ( = ?auto_95260 ?auto_95261 ) ) ( not ( = ?auto_95260 ?auto_95262 ) ) ( not ( = ?auto_95260 ?auto_95263 ) ) ( not ( = ?auto_95261 ?auto_95262 ) ) ( not ( = ?auto_95261 ?auto_95263 ) ) ( not ( = ?auto_95262 ?auto_95263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95262 ?auto_95263 )
      ( !STACK ?auto_95262 ?auto_95261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95280 - BLOCK
      ?auto_95281 - BLOCK
      ?auto_95282 - BLOCK
      ?auto_95283 - BLOCK
      ?auto_95284 - BLOCK
    )
    :vars
    (
      ?auto_95285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95284 ?auto_95285 ) ( ON-TABLE ?auto_95280 ) ( ON ?auto_95281 ?auto_95280 ) ( ON ?auto_95282 ?auto_95281 ) ( not ( = ?auto_95280 ?auto_95281 ) ) ( not ( = ?auto_95280 ?auto_95282 ) ) ( not ( = ?auto_95280 ?auto_95283 ) ) ( not ( = ?auto_95280 ?auto_95284 ) ) ( not ( = ?auto_95280 ?auto_95285 ) ) ( not ( = ?auto_95281 ?auto_95282 ) ) ( not ( = ?auto_95281 ?auto_95283 ) ) ( not ( = ?auto_95281 ?auto_95284 ) ) ( not ( = ?auto_95281 ?auto_95285 ) ) ( not ( = ?auto_95282 ?auto_95283 ) ) ( not ( = ?auto_95282 ?auto_95284 ) ) ( not ( = ?auto_95282 ?auto_95285 ) ) ( not ( = ?auto_95283 ?auto_95284 ) ) ( not ( = ?auto_95283 ?auto_95285 ) ) ( not ( = ?auto_95284 ?auto_95285 ) ) ( CLEAR ?auto_95282 ) ( ON ?auto_95283 ?auto_95284 ) ( CLEAR ?auto_95283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95280 ?auto_95281 ?auto_95282 ?auto_95283 )
      ( MAKE-5PILE ?auto_95280 ?auto_95281 ?auto_95282 ?auto_95283 ?auto_95284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95302 - BLOCK
      ?auto_95303 - BLOCK
      ?auto_95304 - BLOCK
      ?auto_95305 - BLOCK
      ?auto_95306 - BLOCK
    )
    :vars
    (
      ?auto_95307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95306 ?auto_95307 ) ( ON-TABLE ?auto_95302 ) ( ON ?auto_95303 ?auto_95302 ) ( not ( = ?auto_95302 ?auto_95303 ) ) ( not ( = ?auto_95302 ?auto_95304 ) ) ( not ( = ?auto_95302 ?auto_95305 ) ) ( not ( = ?auto_95302 ?auto_95306 ) ) ( not ( = ?auto_95302 ?auto_95307 ) ) ( not ( = ?auto_95303 ?auto_95304 ) ) ( not ( = ?auto_95303 ?auto_95305 ) ) ( not ( = ?auto_95303 ?auto_95306 ) ) ( not ( = ?auto_95303 ?auto_95307 ) ) ( not ( = ?auto_95304 ?auto_95305 ) ) ( not ( = ?auto_95304 ?auto_95306 ) ) ( not ( = ?auto_95304 ?auto_95307 ) ) ( not ( = ?auto_95305 ?auto_95306 ) ) ( not ( = ?auto_95305 ?auto_95307 ) ) ( not ( = ?auto_95306 ?auto_95307 ) ) ( ON ?auto_95305 ?auto_95306 ) ( CLEAR ?auto_95303 ) ( ON ?auto_95304 ?auto_95305 ) ( CLEAR ?auto_95304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95302 ?auto_95303 ?auto_95304 )
      ( MAKE-5PILE ?auto_95302 ?auto_95303 ?auto_95304 ?auto_95305 ?auto_95306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95324 - BLOCK
      ?auto_95325 - BLOCK
      ?auto_95326 - BLOCK
      ?auto_95327 - BLOCK
      ?auto_95328 - BLOCK
    )
    :vars
    (
      ?auto_95329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95328 ?auto_95329 ) ( ON-TABLE ?auto_95324 ) ( not ( = ?auto_95324 ?auto_95325 ) ) ( not ( = ?auto_95324 ?auto_95326 ) ) ( not ( = ?auto_95324 ?auto_95327 ) ) ( not ( = ?auto_95324 ?auto_95328 ) ) ( not ( = ?auto_95324 ?auto_95329 ) ) ( not ( = ?auto_95325 ?auto_95326 ) ) ( not ( = ?auto_95325 ?auto_95327 ) ) ( not ( = ?auto_95325 ?auto_95328 ) ) ( not ( = ?auto_95325 ?auto_95329 ) ) ( not ( = ?auto_95326 ?auto_95327 ) ) ( not ( = ?auto_95326 ?auto_95328 ) ) ( not ( = ?auto_95326 ?auto_95329 ) ) ( not ( = ?auto_95327 ?auto_95328 ) ) ( not ( = ?auto_95327 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95329 ) ) ( ON ?auto_95327 ?auto_95328 ) ( ON ?auto_95326 ?auto_95327 ) ( CLEAR ?auto_95324 ) ( ON ?auto_95325 ?auto_95326 ) ( CLEAR ?auto_95325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95324 ?auto_95325 )
      ( MAKE-5PILE ?auto_95324 ?auto_95325 ?auto_95326 ?auto_95327 ?auto_95328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95346 - BLOCK
      ?auto_95347 - BLOCK
      ?auto_95348 - BLOCK
      ?auto_95349 - BLOCK
      ?auto_95350 - BLOCK
    )
    :vars
    (
      ?auto_95351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95350 ?auto_95351 ) ( not ( = ?auto_95346 ?auto_95347 ) ) ( not ( = ?auto_95346 ?auto_95348 ) ) ( not ( = ?auto_95346 ?auto_95349 ) ) ( not ( = ?auto_95346 ?auto_95350 ) ) ( not ( = ?auto_95346 ?auto_95351 ) ) ( not ( = ?auto_95347 ?auto_95348 ) ) ( not ( = ?auto_95347 ?auto_95349 ) ) ( not ( = ?auto_95347 ?auto_95350 ) ) ( not ( = ?auto_95347 ?auto_95351 ) ) ( not ( = ?auto_95348 ?auto_95349 ) ) ( not ( = ?auto_95348 ?auto_95350 ) ) ( not ( = ?auto_95348 ?auto_95351 ) ) ( not ( = ?auto_95349 ?auto_95350 ) ) ( not ( = ?auto_95349 ?auto_95351 ) ) ( not ( = ?auto_95350 ?auto_95351 ) ) ( ON ?auto_95349 ?auto_95350 ) ( ON ?auto_95348 ?auto_95349 ) ( ON ?auto_95347 ?auto_95348 ) ( ON ?auto_95346 ?auto_95347 ) ( CLEAR ?auto_95346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95346 )
      ( MAKE-5PILE ?auto_95346 ?auto_95347 ?auto_95348 ?auto_95349 ?auto_95350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95369 - BLOCK
      ?auto_95370 - BLOCK
      ?auto_95371 - BLOCK
      ?auto_95372 - BLOCK
      ?auto_95373 - BLOCK
      ?auto_95374 - BLOCK
    )
    :vars
    (
      ?auto_95375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95373 ) ( ON ?auto_95374 ?auto_95375 ) ( CLEAR ?auto_95374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95369 ) ( ON ?auto_95370 ?auto_95369 ) ( ON ?auto_95371 ?auto_95370 ) ( ON ?auto_95372 ?auto_95371 ) ( ON ?auto_95373 ?auto_95372 ) ( not ( = ?auto_95369 ?auto_95370 ) ) ( not ( = ?auto_95369 ?auto_95371 ) ) ( not ( = ?auto_95369 ?auto_95372 ) ) ( not ( = ?auto_95369 ?auto_95373 ) ) ( not ( = ?auto_95369 ?auto_95374 ) ) ( not ( = ?auto_95369 ?auto_95375 ) ) ( not ( = ?auto_95370 ?auto_95371 ) ) ( not ( = ?auto_95370 ?auto_95372 ) ) ( not ( = ?auto_95370 ?auto_95373 ) ) ( not ( = ?auto_95370 ?auto_95374 ) ) ( not ( = ?auto_95370 ?auto_95375 ) ) ( not ( = ?auto_95371 ?auto_95372 ) ) ( not ( = ?auto_95371 ?auto_95373 ) ) ( not ( = ?auto_95371 ?auto_95374 ) ) ( not ( = ?auto_95371 ?auto_95375 ) ) ( not ( = ?auto_95372 ?auto_95373 ) ) ( not ( = ?auto_95372 ?auto_95374 ) ) ( not ( = ?auto_95372 ?auto_95375 ) ) ( not ( = ?auto_95373 ?auto_95374 ) ) ( not ( = ?auto_95373 ?auto_95375 ) ) ( not ( = ?auto_95374 ?auto_95375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95374 ?auto_95375 )
      ( !STACK ?auto_95374 ?auto_95373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95395 - BLOCK
      ?auto_95396 - BLOCK
      ?auto_95397 - BLOCK
      ?auto_95398 - BLOCK
      ?auto_95399 - BLOCK
      ?auto_95400 - BLOCK
    )
    :vars
    (
      ?auto_95401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95400 ?auto_95401 ) ( ON-TABLE ?auto_95395 ) ( ON ?auto_95396 ?auto_95395 ) ( ON ?auto_95397 ?auto_95396 ) ( ON ?auto_95398 ?auto_95397 ) ( not ( = ?auto_95395 ?auto_95396 ) ) ( not ( = ?auto_95395 ?auto_95397 ) ) ( not ( = ?auto_95395 ?auto_95398 ) ) ( not ( = ?auto_95395 ?auto_95399 ) ) ( not ( = ?auto_95395 ?auto_95400 ) ) ( not ( = ?auto_95395 ?auto_95401 ) ) ( not ( = ?auto_95396 ?auto_95397 ) ) ( not ( = ?auto_95396 ?auto_95398 ) ) ( not ( = ?auto_95396 ?auto_95399 ) ) ( not ( = ?auto_95396 ?auto_95400 ) ) ( not ( = ?auto_95396 ?auto_95401 ) ) ( not ( = ?auto_95397 ?auto_95398 ) ) ( not ( = ?auto_95397 ?auto_95399 ) ) ( not ( = ?auto_95397 ?auto_95400 ) ) ( not ( = ?auto_95397 ?auto_95401 ) ) ( not ( = ?auto_95398 ?auto_95399 ) ) ( not ( = ?auto_95398 ?auto_95400 ) ) ( not ( = ?auto_95398 ?auto_95401 ) ) ( not ( = ?auto_95399 ?auto_95400 ) ) ( not ( = ?auto_95399 ?auto_95401 ) ) ( not ( = ?auto_95400 ?auto_95401 ) ) ( CLEAR ?auto_95398 ) ( ON ?auto_95399 ?auto_95400 ) ( CLEAR ?auto_95399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95395 ?auto_95396 ?auto_95397 ?auto_95398 ?auto_95399 )
      ( MAKE-6PILE ?auto_95395 ?auto_95396 ?auto_95397 ?auto_95398 ?auto_95399 ?auto_95400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95421 - BLOCK
      ?auto_95422 - BLOCK
      ?auto_95423 - BLOCK
      ?auto_95424 - BLOCK
      ?auto_95425 - BLOCK
      ?auto_95426 - BLOCK
    )
    :vars
    (
      ?auto_95427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95426 ?auto_95427 ) ( ON-TABLE ?auto_95421 ) ( ON ?auto_95422 ?auto_95421 ) ( ON ?auto_95423 ?auto_95422 ) ( not ( = ?auto_95421 ?auto_95422 ) ) ( not ( = ?auto_95421 ?auto_95423 ) ) ( not ( = ?auto_95421 ?auto_95424 ) ) ( not ( = ?auto_95421 ?auto_95425 ) ) ( not ( = ?auto_95421 ?auto_95426 ) ) ( not ( = ?auto_95421 ?auto_95427 ) ) ( not ( = ?auto_95422 ?auto_95423 ) ) ( not ( = ?auto_95422 ?auto_95424 ) ) ( not ( = ?auto_95422 ?auto_95425 ) ) ( not ( = ?auto_95422 ?auto_95426 ) ) ( not ( = ?auto_95422 ?auto_95427 ) ) ( not ( = ?auto_95423 ?auto_95424 ) ) ( not ( = ?auto_95423 ?auto_95425 ) ) ( not ( = ?auto_95423 ?auto_95426 ) ) ( not ( = ?auto_95423 ?auto_95427 ) ) ( not ( = ?auto_95424 ?auto_95425 ) ) ( not ( = ?auto_95424 ?auto_95426 ) ) ( not ( = ?auto_95424 ?auto_95427 ) ) ( not ( = ?auto_95425 ?auto_95426 ) ) ( not ( = ?auto_95425 ?auto_95427 ) ) ( not ( = ?auto_95426 ?auto_95427 ) ) ( ON ?auto_95425 ?auto_95426 ) ( CLEAR ?auto_95423 ) ( ON ?auto_95424 ?auto_95425 ) ( CLEAR ?auto_95424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95421 ?auto_95422 ?auto_95423 ?auto_95424 )
      ( MAKE-6PILE ?auto_95421 ?auto_95422 ?auto_95423 ?auto_95424 ?auto_95425 ?auto_95426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95447 - BLOCK
      ?auto_95448 - BLOCK
      ?auto_95449 - BLOCK
      ?auto_95450 - BLOCK
      ?auto_95451 - BLOCK
      ?auto_95452 - BLOCK
    )
    :vars
    (
      ?auto_95453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95452 ?auto_95453 ) ( ON-TABLE ?auto_95447 ) ( ON ?auto_95448 ?auto_95447 ) ( not ( = ?auto_95447 ?auto_95448 ) ) ( not ( = ?auto_95447 ?auto_95449 ) ) ( not ( = ?auto_95447 ?auto_95450 ) ) ( not ( = ?auto_95447 ?auto_95451 ) ) ( not ( = ?auto_95447 ?auto_95452 ) ) ( not ( = ?auto_95447 ?auto_95453 ) ) ( not ( = ?auto_95448 ?auto_95449 ) ) ( not ( = ?auto_95448 ?auto_95450 ) ) ( not ( = ?auto_95448 ?auto_95451 ) ) ( not ( = ?auto_95448 ?auto_95452 ) ) ( not ( = ?auto_95448 ?auto_95453 ) ) ( not ( = ?auto_95449 ?auto_95450 ) ) ( not ( = ?auto_95449 ?auto_95451 ) ) ( not ( = ?auto_95449 ?auto_95452 ) ) ( not ( = ?auto_95449 ?auto_95453 ) ) ( not ( = ?auto_95450 ?auto_95451 ) ) ( not ( = ?auto_95450 ?auto_95452 ) ) ( not ( = ?auto_95450 ?auto_95453 ) ) ( not ( = ?auto_95451 ?auto_95452 ) ) ( not ( = ?auto_95451 ?auto_95453 ) ) ( not ( = ?auto_95452 ?auto_95453 ) ) ( ON ?auto_95451 ?auto_95452 ) ( ON ?auto_95450 ?auto_95451 ) ( CLEAR ?auto_95448 ) ( ON ?auto_95449 ?auto_95450 ) ( CLEAR ?auto_95449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95447 ?auto_95448 ?auto_95449 )
      ( MAKE-6PILE ?auto_95447 ?auto_95448 ?auto_95449 ?auto_95450 ?auto_95451 ?auto_95452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95473 - BLOCK
      ?auto_95474 - BLOCK
      ?auto_95475 - BLOCK
      ?auto_95476 - BLOCK
      ?auto_95477 - BLOCK
      ?auto_95478 - BLOCK
    )
    :vars
    (
      ?auto_95479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95478 ?auto_95479 ) ( ON-TABLE ?auto_95473 ) ( not ( = ?auto_95473 ?auto_95474 ) ) ( not ( = ?auto_95473 ?auto_95475 ) ) ( not ( = ?auto_95473 ?auto_95476 ) ) ( not ( = ?auto_95473 ?auto_95477 ) ) ( not ( = ?auto_95473 ?auto_95478 ) ) ( not ( = ?auto_95473 ?auto_95479 ) ) ( not ( = ?auto_95474 ?auto_95475 ) ) ( not ( = ?auto_95474 ?auto_95476 ) ) ( not ( = ?auto_95474 ?auto_95477 ) ) ( not ( = ?auto_95474 ?auto_95478 ) ) ( not ( = ?auto_95474 ?auto_95479 ) ) ( not ( = ?auto_95475 ?auto_95476 ) ) ( not ( = ?auto_95475 ?auto_95477 ) ) ( not ( = ?auto_95475 ?auto_95478 ) ) ( not ( = ?auto_95475 ?auto_95479 ) ) ( not ( = ?auto_95476 ?auto_95477 ) ) ( not ( = ?auto_95476 ?auto_95478 ) ) ( not ( = ?auto_95476 ?auto_95479 ) ) ( not ( = ?auto_95477 ?auto_95478 ) ) ( not ( = ?auto_95477 ?auto_95479 ) ) ( not ( = ?auto_95478 ?auto_95479 ) ) ( ON ?auto_95477 ?auto_95478 ) ( ON ?auto_95476 ?auto_95477 ) ( ON ?auto_95475 ?auto_95476 ) ( CLEAR ?auto_95473 ) ( ON ?auto_95474 ?auto_95475 ) ( CLEAR ?auto_95474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95473 ?auto_95474 )
      ( MAKE-6PILE ?auto_95473 ?auto_95474 ?auto_95475 ?auto_95476 ?auto_95477 ?auto_95478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95499 - BLOCK
      ?auto_95500 - BLOCK
      ?auto_95501 - BLOCK
      ?auto_95502 - BLOCK
      ?auto_95503 - BLOCK
      ?auto_95504 - BLOCK
    )
    :vars
    (
      ?auto_95505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95504 ?auto_95505 ) ( not ( = ?auto_95499 ?auto_95500 ) ) ( not ( = ?auto_95499 ?auto_95501 ) ) ( not ( = ?auto_95499 ?auto_95502 ) ) ( not ( = ?auto_95499 ?auto_95503 ) ) ( not ( = ?auto_95499 ?auto_95504 ) ) ( not ( = ?auto_95499 ?auto_95505 ) ) ( not ( = ?auto_95500 ?auto_95501 ) ) ( not ( = ?auto_95500 ?auto_95502 ) ) ( not ( = ?auto_95500 ?auto_95503 ) ) ( not ( = ?auto_95500 ?auto_95504 ) ) ( not ( = ?auto_95500 ?auto_95505 ) ) ( not ( = ?auto_95501 ?auto_95502 ) ) ( not ( = ?auto_95501 ?auto_95503 ) ) ( not ( = ?auto_95501 ?auto_95504 ) ) ( not ( = ?auto_95501 ?auto_95505 ) ) ( not ( = ?auto_95502 ?auto_95503 ) ) ( not ( = ?auto_95502 ?auto_95504 ) ) ( not ( = ?auto_95502 ?auto_95505 ) ) ( not ( = ?auto_95503 ?auto_95504 ) ) ( not ( = ?auto_95503 ?auto_95505 ) ) ( not ( = ?auto_95504 ?auto_95505 ) ) ( ON ?auto_95503 ?auto_95504 ) ( ON ?auto_95502 ?auto_95503 ) ( ON ?auto_95501 ?auto_95502 ) ( ON ?auto_95500 ?auto_95501 ) ( ON ?auto_95499 ?auto_95500 ) ( CLEAR ?auto_95499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95499 )
      ( MAKE-6PILE ?auto_95499 ?auto_95500 ?auto_95501 ?auto_95502 ?auto_95503 ?auto_95504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95526 - BLOCK
      ?auto_95527 - BLOCK
      ?auto_95528 - BLOCK
      ?auto_95529 - BLOCK
      ?auto_95530 - BLOCK
      ?auto_95531 - BLOCK
      ?auto_95532 - BLOCK
    )
    :vars
    (
      ?auto_95533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95531 ) ( ON ?auto_95532 ?auto_95533 ) ( CLEAR ?auto_95532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95526 ) ( ON ?auto_95527 ?auto_95526 ) ( ON ?auto_95528 ?auto_95527 ) ( ON ?auto_95529 ?auto_95528 ) ( ON ?auto_95530 ?auto_95529 ) ( ON ?auto_95531 ?auto_95530 ) ( not ( = ?auto_95526 ?auto_95527 ) ) ( not ( = ?auto_95526 ?auto_95528 ) ) ( not ( = ?auto_95526 ?auto_95529 ) ) ( not ( = ?auto_95526 ?auto_95530 ) ) ( not ( = ?auto_95526 ?auto_95531 ) ) ( not ( = ?auto_95526 ?auto_95532 ) ) ( not ( = ?auto_95526 ?auto_95533 ) ) ( not ( = ?auto_95527 ?auto_95528 ) ) ( not ( = ?auto_95527 ?auto_95529 ) ) ( not ( = ?auto_95527 ?auto_95530 ) ) ( not ( = ?auto_95527 ?auto_95531 ) ) ( not ( = ?auto_95527 ?auto_95532 ) ) ( not ( = ?auto_95527 ?auto_95533 ) ) ( not ( = ?auto_95528 ?auto_95529 ) ) ( not ( = ?auto_95528 ?auto_95530 ) ) ( not ( = ?auto_95528 ?auto_95531 ) ) ( not ( = ?auto_95528 ?auto_95532 ) ) ( not ( = ?auto_95528 ?auto_95533 ) ) ( not ( = ?auto_95529 ?auto_95530 ) ) ( not ( = ?auto_95529 ?auto_95531 ) ) ( not ( = ?auto_95529 ?auto_95532 ) ) ( not ( = ?auto_95529 ?auto_95533 ) ) ( not ( = ?auto_95530 ?auto_95531 ) ) ( not ( = ?auto_95530 ?auto_95532 ) ) ( not ( = ?auto_95530 ?auto_95533 ) ) ( not ( = ?auto_95531 ?auto_95532 ) ) ( not ( = ?auto_95531 ?auto_95533 ) ) ( not ( = ?auto_95532 ?auto_95533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95532 ?auto_95533 )
      ( !STACK ?auto_95532 ?auto_95531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95556 - BLOCK
      ?auto_95557 - BLOCK
      ?auto_95558 - BLOCK
      ?auto_95559 - BLOCK
      ?auto_95560 - BLOCK
      ?auto_95561 - BLOCK
      ?auto_95562 - BLOCK
    )
    :vars
    (
      ?auto_95563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95562 ?auto_95563 ) ( ON-TABLE ?auto_95556 ) ( ON ?auto_95557 ?auto_95556 ) ( ON ?auto_95558 ?auto_95557 ) ( ON ?auto_95559 ?auto_95558 ) ( ON ?auto_95560 ?auto_95559 ) ( not ( = ?auto_95556 ?auto_95557 ) ) ( not ( = ?auto_95556 ?auto_95558 ) ) ( not ( = ?auto_95556 ?auto_95559 ) ) ( not ( = ?auto_95556 ?auto_95560 ) ) ( not ( = ?auto_95556 ?auto_95561 ) ) ( not ( = ?auto_95556 ?auto_95562 ) ) ( not ( = ?auto_95556 ?auto_95563 ) ) ( not ( = ?auto_95557 ?auto_95558 ) ) ( not ( = ?auto_95557 ?auto_95559 ) ) ( not ( = ?auto_95557 ?auto_95560 ) ) ( not ( = ?auto_95557 ?auto_95561 ) ) ( not ( = ?auto_95557 ?auto_95562 ) ) ( not ( = ?auto_95557 ?auto_95563 ) ) ( not ( = ?auto_95558 ?auto_95559 ) ) ( not ( = ?auto_95558 ?auto_95560 ) ) ( not ( = ?auto_95558 ?auto_95561 ) ) ( not ( = ?auto_95558 ?auto_95562 ) ) ( not ( = ?auto_95558 ?auto_95563 ) ) ( not ( = ?auto_95559 ?auto_95560 ) ) ( not ( = ?auto_95559 ?auto_95561 ) ) ( not ( = ?auto_95559 ?auto_95562 ) ) ( not ( = ?auto_95559 ?auto_95563 ) ) ( not ( = ?auto_95560 ?auto_95561 ) ) ( not ( = ?auto_95560 ?auto_95562 ) ) ( not ( = ?auto_95560 ?auto_95563 ) ) ( not ( = ?auto_95561 ?auto_95562 ) ) ( not ( = ?auto_95561 ?auto_95563 ) ) ( not ( = ?auto_95562 ?auto_95563 ) ) ( CLEAR ?auto_95560 ) ( ON ?auto_95561 ?auto_95562 ) ( CLEAR ?auto_95561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95556 ?auto_95557 ?auto_95558 ?auto_95559 ?auto_95560 ?auto_95561 )
      ( MAKE-7PILE ?auto_95556 ?auto_95557 ?auto_95558 ?auto_95559 ?auto_95560 ?auto_95561 ?auto_95562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95586 - BLOCK
      ?auto_95587 - BLOCK
      ?auto_95588 - BLOCK
      ?auto_95589 - BLOCK
      ?auto_95590 - BLOCK
      ?auto_95591 - BLOCK
      ?auto_95592 - BLOCK
    )
    :vars
    (
      ?auto_95593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95592 ?auto_95593 ) ( ON-TABLE ?auto_95586 ) ( ON ?auto_95587 ?auto_95586 ) ( ON ?auto_95588 ?auto_95587 ) ( ON ?auto_95589 ?auto_95588 ) ( not ( = ?auto_95586 ?auto_95587 ) ) ( not ( = ?auto_95586 ?auto_95588 ) ) ( not ( = ?auto_95586 ?auto_95589 ) ) ( not ( = ?auto_95586 ?auto_95590 ) ) ( not ( = ?auto_95586 ?auto_95591 ) ) ( not ( = ?auto_95586 ?auto_95592 ) ) ( not ( = ?auto_95586 ?auto_95593 ) ) ( not ( = ?auto_95587 ?auto_95588 ) ) ( not ( = ?auto_95587 ?auto_95589 ) ) ( not ( = ?auto_95587 ?auto_95590 ) ) ( not ( = ?auto_95587 ?auto_95591 ) ) ( not ( = ?auto_95587 ?auto_95592 ) ) ( not ( = ?auto_95587 ?auto_95593 ) ) ( not ( = ?auto_95588 ?auto_95589 ) ) ( not ( = ?auto_95588 ?auto_95590 ) ) ( not ( = ?auto_95588 ?auto_95591 ) ) ( not ( = ?auto_95588 ?auto_95592 ) ) ( not ( = ?auto_95588 ?auto_95593 ) ) ( not ( = ?auto_95589 ?auto_95590 ) ) ( not ( = ?auto_95589 ?auto_95591 ) ) ( not ( = ?auto_95589 ?auto_95592 ) ) ( not ( = ?auto_95589 ?auto_95593 ) ) ( not ( = ?auto_95590 ?auto_95591 ) ) ( not ( = ?auto_95590 ?auto_95592 ) ) ( not ( = ?auto_95590 ?auto_95593 ) ) ( not ( = ?auto_95591 ?auto_95592 ) ) ( not ( = ?auto_95591 ?auto_95593 ) ) ( not ( = ?auto_95592 ?auto_95593 ) ) ( ON ?auto_95591 ?auto_95592 ) ( CLEAR ?auto_95589 ) ( ON ?auto_95590 ?auto_95591 ) ( CLEAR ?auto_95590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95586 ?auto_95587 ?auto_95588 ?auto_95589 ?auto_95590 )
      ( MAKE-7PILE ?auto_95586 ?auto_95587 ?auto_95588 ?auto_95589 ?auto_95590 ?auto_95591 ?auto_95592 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95616 - BLOCK
      ?auto_95617 - BLOCK
      ?auto_95618 - BLOCK
      ?auto_95619 - BLOCK
      ?auto_95620 - BLOCK
      ?auto_95621 - BLOCK
      ?auto_95622 - BLOCK
    )
    :vars
    (
      ?auto_95623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95622 ?auto_95623 ) ( ON-TABLE ?auto_95616 ) ( ON ?auto_95617 ?auto_95616 ) ( ON ?auto_95618 ?auto_95617 ) ( not ( = ?auto_95616 ?auto_95617 ) ) ( not ( = ?auto_95616 ?auto_95618 ) ) ( not ( = ?auto_95616 ?auto_95619 ) ) ( not ( = ?auto_95616 ?auto_95620 ) ) ( not ( = ?auto_95616 ?auto_95621 ) ) ( not ( = ?auto_95616 ?auto_95622 ) ) ( not ( = ?auto_95616 ?auto_95623 ) ) ( not ( = ?auto_95617 ?auto_95618 ) ) ( not ( = ?auto_95617 ?auto_95619 ) ) ( not ( = ?auto_95617 ?auto_95620 ) ) ( not ( = ?auto_95617 ?auto_95621 ) ) ( not ( = ?auto_95617 ?auto_95622 ) ) ( not ( = ?auto_95617 ?auto_95623 ) ) ( not ( = ?auto_95618 ?auto_95619 ) ) ( not ( = ?auto_95618 ?auto_95620 ) ) ( not ( = ?auto_95618 ?auto_95621 ) ) ( not ( = ?auto_95618 ?auto_95622 ) ) ( not ( = ?auto_95618 ?auto_95623 ) ) ( not ( = ?auto_95619 ?auto_95620 ) ) ( not ( = ?auto_95619 ?auto_95621 ) ) ( not ( = ?auto_95619 ?auto_95622 ) ) ( not ( = ?auto_95619 ?auto_95623 ) ) ( not ( = ?auto_95620 ?auto_95621 ) ) ( not ( = ?auto_95620 ?auto_95622 ) ) ( not ( = ?auto_95620 ?auto_95623 ) ) ( not ( = ?auto_95621 ?auto_95622 ) ) ( not ( = ?auto_95621 ?auto_95623 ) ) ( not ( = ?auto_95622 ?auto_95623 ) ) ( ON ?auto_95621 ?auto_95622 ) ( ON ?auto_95620 ?auto_95621 ) ( CLEAR ?auto_95618 ) ( ON ?auto_95619 ?auto_95620 ) ( CLEAR ?auto_95619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95616 ?auto_95617 ?auto_95618 ?auto_95619 )
      ( MAKE-7PILE ?auto_95616 ?auto_95617 ?auto_95618 ?auto_95619 ?auto_95620 ?auto_95621 ?auto_95622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95646 - BLOCK
      ?auto_95647 - BLOCK
      ?auto_95648 - BLOCK
      ?auto_95649 - BLOCK
      ?auto_95650 - BLOCK
      ?auto_95651 - BLOCK
      ?auto_95652 - BLOCK
    )
    :vars
    (
      ?auto_95653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95652 ?auto_95653 ) ( ON-TABLE ?auto_95646 ) ( ON ?auto_95647 ?auto_95646 ) ( not ( = ?auto_95646 ?auto_95647 ) ) ( not ( = ?auto_95646 ?auto_95648 ) ) ( not ( = ?auto_95646 ?auto_95649 ) ) ( not ( = ?auto_95646 ?auto_95650 ) ) ( not ( = ?auto_95646 ?auto_95651 ) ) ( not ( = ?auto_95646 ?auto_95652 ) ) ( not ( = ?auto_95646 ?auto_95653 ) ) ( not ( = ?auto_95647 ?auto_95648 ) ) ( not ( = ?auto_95647 ?auto_95649 ) ) ( not ( = ?auto_95647 ?auto_95650 ) ) ( not ( = ?auto_95647 ?auto_95651 ) ) ( not ( = ?auto_95647 ?auto_95652 ) ) ( not ( = ?auto_95647 ?auto_95653 ) ) ( not ( = ?auto_95648 ?auto_95649 ) ) ( not ( = ?auto_95648 ?auto_95650 ) ) ( not ( = ?auto_95648 ?auto_95651 ) ) ( not ( = ?auto_95648 ?auto_95652 ) ) ( not ( = ?auto_95648 ?auto_95653 ) ) ( not ( = ?auto_95649 ?auto_95650 ) ) ( not ( = ?auto_95649 ?auto_95651 ) ) ( not ( = ?auto_95649 ?auto_95652 ) ) ( not ( = ?auto_95649 ?auto_95653 ) ) ( not ( = ?auto_95650 ?auto_95651 ) ) ( not ( = ?auto_95650 ?auto_95652 ) ) ( not ( = ?auto_95650 ?auto_95653 ) ) ( not ( = ?auto_95651 ?auto_95652 ) ) ( not ( = ?auto_95651 ?auto_95653 ) ) ( not ( = ?auto_95652 ?auto_95653 ) ) ( ON ?auto_95651 ?auto_95652 ) ( ON ?auto_95650 ?auto_95651 ) ( ON ?auto_95649 ?auto_95650 ) ( CLEAR ?auto_95647 ) ( ON ?auto_95648 ?auto_95649 ) ( CLEAR ?auto_95648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95646 ?auto_95647 ?auto_95648 )
      ( MAKE-7PILE ?auto_95646 ?auto_95647 ?auto_95648 ?auto_95649 ?auto_95650 ?auto_95651 ?auto_95652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95676 - BLOCK
      ?auto_95677 - BLOCK
      ?auto_95678 - BLOCK
      ?auto_95679 - BLOCK
      ?auto_95680 - BLOCK
      ?auto_95681 - BLOCK
      ?auto_95682 - BLOCK
    )
    :vars
    (
      ?auto_95683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95682 ?auto_95683 ) ( ON-TABLE ?auto_95676 ) ( not ( = ?auto_95676 ?auto_95677 ) ) ( not ( = ?auto_95676 ?auto_95678 ) ) ( not ( = ?auto_95676 ?auto_95679 ) ) ( not ( = ?auto_95676 ?auto_95680 ) ) ( not ( = ?auto_95676 ?auto_95681 ) ) ( not ( = ?auto_95676 ?auto_95682 ) ) ( not ( = ?auto_95676 ?auto_95683 ) ) ( not ( = ?auto_95677 ?auto_95678 ) ) ( not ( = ?auto_95677 ?auto_95679 ) ) ( not ( = ?auto_95677 ?auto_95680 ) ) ( not ( = ?auto_95677 ?auto_95681 ) ) ( not ( = ?auto_95677 ?auto_95682 ) ) ( not ( = ?auto_95677 ?auto_95683 ) ) ( not ( = ?auto_95678 ?auto_95679 ) ) ( not ( = ?auto_95678 ?auto_95680 ) ) ( not ( = ?auto_95678 ?auto_95681 ) ) ( not ( = ?auto_95678 ?auto_95682 ) ) ( not ( = ?auto_95678 ?auto_95683 ) ) ( not ( = ?auto_95679 ?auto_95680 ) ) ( not ( = ?auto_95679 ?auto_95681 ) ) ( not ( = ?auto_95679 ?auto_95682 ) ) ( not ( = ?auto_95679 ?auto_95683 ) ) ( not ( = ?auto_95680 ?auto_95681 ) ) ( not ( = ?auto_95680 ?auto_95682 ) ) ( not ( = ?auto_95680 ?auto_95683 ) ) ( not ( = ?auto_95681 ?auto_95682 ) ) ( not ( = ?auto_95681 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( ON ?auto_95681 ?auto_95682 ) ( ON ?auto_95680 ?auto_95681 ) ( ON ?auto_95679 ?auto_95680 ) ( ON ?auto_95678 ?auto_95679 ) ( CLEAR ?auto_95676 ) ( ON ?auto_95677 ?auto_95678 ) ( CLEAR ?auto_95677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95676 ?auto_95677 )
      ( MAKE-7PILE ?auto_95676 ?auto_95677 ?auto_95678 ?auto_95679 ?auto_95680 ?auto_95681 ?auto_95682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95706 - BLOCK
      ?auto_95707 - BLOCK
      ?auto_95708 - BLOCK
      ?auto_95709 - BLOCK
      ?auto_95710 - BLOCK
      ?auto_95711 - BLOCK
      ?auto_95712 - BLOCK
    )
    :vars
    (
      ?auto_95713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95712 ?auto_95713 ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95706 ?auto_95710 ) ) ( not ( = ?auto_95706 ?auto_95711 ) ) ( not ( = ?auto_95706 ?auto_95712 ) ) ( not ( = ?auto_95706 ?auto_95713 ) ) ( not ( = ?auto_95707 ?auto_95708 ) ) ( not ( = ?auto_95707 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95710 ) ) ( not ( = ?auto_95707 ?auto_95711 ) ) ( not ( = ?auto_95707 ?auto_95712 ) ) ( not ( = ?auto_95707 ?auto_95713 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) ( not ( = ?auto_95708 ?auto_95710 ) ) ( not ( = ?auto_95708 ?auto_95711 ) ) ( not ( = ?auto_95708 ?auto_95712 ) ) ( not ( = ?auto_95708 ?auto_95713 ) ) ( not ( = ?auto_95709 ?auto_95710 ) ) ( not ( = ?auto_95709 ?auto_95711 ) ) ( not ( = ?auto_95709 ?auto_95712 ) ) ( not ( = ?auto_95709 ?auto_95713 ) ) ( not ( = ?auto_95710 ?auto_95711 ) ) ( not ( = ?auto_95710 ?auto_95712 ) ) ( not ( = ?auto_95710 ?auto_95713 ) ) ( not ( = ?auto_95711 ?auto_95712 ) ) ( not ( = ?auto_95711 ?auto_95713 ) ) ( not ( = ?auto_95712 ?auto_95713 ) ) ( ON ?auto_95711 ?auto_95712 ) ( ON ?auto_95710 ?auto_95711 ) ( ON ?auto_95709 ?auto_95710 ) ( ON ?auto_95708 ?auto_95709 ) ( ON ?auto_95707 ?auto_95708 ) ( ON ?auto_95706 ?auto_95707 ) ( CLEAR ?auto_95706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95706 )
      ( MAKE-7PILE ?auto_95706 ?auto_95707 ?auto_95708 ?auto_95709 ?auto_95710 ?auto_95711 ?auto_95712 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95737 - BLOCK
      ?auto_95738 - BLOCK
      ?auto_95739 - BLOCK
      ?auto_95740 - BLOCK
      ?auto_95741 - BLOCK
      ?auto_95742 - BLOCK
      ?auto_95743 - BLOCK
      ?auto_95744 - BLOCK
    )
    :vars
    (
      ?auto_95745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95743 ) ( ON ?auto_95744 ?auto_95745 ) ( CLEAR ?auto_95744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95737 ) ( ON ?auto_95738 ?auto_95737 ) ( ON ?auto_95739 ?auto_95738 ) ( ON ?auto_95740 ?auto_95739 ) ( ON ?auto_95741 ?auto_95740 ) ( ON ?auto_95742 ?auto_95741 ) ( ON ?auto_95743 ?auto_95742 ) ( not ( = ?auto_95737 ?auto_95738 ) ) ( not ( = ?auto_95737 ?auto_95739 ) ) ( not ( = ?auto_95737 ?auto_95740 ) ) ( not ( = ?auto_95737 ?auto_95741 ) ) ( not ( = ?auto_95737 ?auto_95742 ) ) ( not ( = ?auto_95737 ?auto_95743 ) ) ( not ( = ?auto_95737 ?auto_95744 ) ) ( not ( = ?auto_95737 ?auto_95745 ) ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95740 ) ) ( not ( = ?auto_95738 ?auto_95741 ) ) ( not ( = ?auto_95738 ?auto_95742 ) ) ( not ( = ?auto_95738 ?auto_95743 ) ) ( not ( = ?auto_95738 ?auto_95744 ) ) ( not ( = ?auto_95738 ?auto_95745 ) ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95741 ) ) ( not ( = ?auto_95739 ?auto_95742 ) ) ( not ( = ?auto_95739 ?auto_95743 ) ) ( not ( = ?auto_95739 ?auto_95744 ) ) ( not ( = ?auto_95739 ?auto_95745 ) ) ( not ( = ?auto_95740 ?auto_95741 ) ) ( not ( = ?auto_95740 ?auto_95742 ) ) ( not ( = ?auto_95740 ?auto_95743 ) ) ( not ( = ?auto_95740 ?auto_95744 ) ) ( not ( = ?auto_95740 ?auto_95745 ) ) ( not ( = ?auto_95741 ?auto_95742 ) ) ( not ( = ?auto_95741 ?auto_95743 ) ) ( not ( = ?auto_95741 ?auto_95744 ) ) ( not ( = ?auto_95741 ?auto_95745 ) ) ( not ( = ?auto_95742 ?auto_95743 ) ) ( not ( = ?auto_95742 ?auto_95744 ) ) ( not ( = ?auto_95742 ?auto_95745 ) ) ( not ( = ?auto_95743 ?auto_95744 ) ) ( not ( = ?auto_95743 ?auto_95745 ) ) ( not ( = ?auto_95744 ?auto_95745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95744 ?auto_95745 )
      ( !STACK ?auto_95744 ?auto_95743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95771 - BLOCK
      ?auto_95772 - BLOCK
      ?auto_95773 - BLOCK
      ?auto_95774 - BLOCK
      ?auto_95775 - BLOCK
      ?auto_95776 - BLOCK
      ?auto_95777 - BLOCK
      ?auto_95778 - BLOCK
    )
    :vars
    (
      ?auto_95779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95778 ?auto_95779 ) ( ON-TABLE ?auto_95771 ) ( ON ?auto_95772 ?auto_95771 ) ( ON ?auto_95773 ?auto_95772 ) ( ON ?auto_95774 ?auto_95773 ) ( ON ?auto_95775 ?auto_95774 ) ( ON ?auto_95776 ?auto_95775 ) ( not ( = ?auto_95771 ?auto_95772 ) ) ( not ( = ?auto_95771 ?auto_95773 ) ) ( not ( = ?auto_95771 ?auto_95774 ) ) ( not ( = ?auto_95771 ?auto_95775 ) ) ( not ( = ?auto_95771 ?auto_95776 ) ) ( not ( = ?auto_95771 ?auto_95777 ) ) ( not ( = ?auto_95771 ?auto_95778 ) ) ( not ( = ?auto_95771 ?auto_95779 ) ) ( not ( = ?auto_95772 ?auto_95773 ) ) ( not ( = ?auto_95772 ?auto_95774 ) ) ( not ( = ?auto_95772 ?auto_95775 ) ) ( not ( = ?auto_95772 ?auto_95776 ) ) ( not ( = ?auto_95772 ?auto_95777 ) ) ( not ( = ?auto_95772 ?auto_95778 ) ) ( not ( = ?auto_95772 ?auto_95779 ) ) ( not ( = ?auto_95773 ?auto_95774 ) ) ( not ( = ?auto_95773 ?auto_95775 ) ) ( not ( = ?auto_95773 ?auto_95776 ) ) ( not ( = ?auto_95773 ?auto_95777 ) ) ( not ( = ?auto_95773 ?auto_95778 ) ) ( not ( = ?auto_95773 ?auto_95779 ) ) ( not ( = ?auto_95774 ?auto_95775 ) ) ( not ( = ?auto_95774 ?auto_95776 ) ) ( not ( = ?auto_95774 ?auto_95777 ) ) ( not ( = ?auto_95774 ?auto_95778 ) ) ( not ( = ?auto_95774 ?auto_95779 ) ) ( not ( = ?auto_95775 ?auto_95776 ) ) ( not ( = ?auto_95775 ?auto_95777 ) ) ( not ( = ?auto_95775 ?auto_95778 ) ) ( not ( = ?auto_95775 ?auto_95779 ) ) ( not ( = ?auto_95776 ?auto_95777 ) ) ( not ( = ?auto_95776 ?auto_95778 ) ) ( not ( = ?auto_95776 ?auto_95779 ) ) ( not ( = ?auto_95777 ?auto_95778 ) ) ( not ( = ?auto_95777 ?auto_95779 ) ) ( not ( = ?auto_95778 ?auto_95779 ) ) ( CLEAR ?auto_95776 ) ( ON ?auto_95777 ?auto_95778 ) ( CLEAR ?auto_95777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95771 ?auto_95772 ?auto_95773 ?auto_95774 ?auto_95775 ?auto_95776 ?auto_95777 )
      ( MAKE-8PILE ?auto_95771 ?auto_95772 ?auto_95773 ?auto_95774 ?auto_95775 ?auto_95776 ?auto_95777 ?auto_95778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95805 - BLOCK
      ?auto_95806 - BLOCK
      ?auto_95807 - BLOCK
      ?auto_95808 - BLOCK
      ?auto_95809 - BLOCK
      ?auto_95810 - BLOCK
      ?auto_95811 - BLOCK
      ?auto_95812 - BLOCK
    )
    :vars
    (
      ?auto_95813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95812 ?auto_95813 ) ( ON-TABLE ?auto_95805 ) ( ON ?auto_95806 ?auto_95805 ) ( ON ?auto_95807 ?auto_95806 ) ( ON ?auto_95808 ?auto_95807 ) ( ON ?auto_95809 ?auto_95808 ) ( not ( = ?auto_95805 ?auto_95806 ) ) ( not ( = ?auto_95805 ?auto_95807 ) ) ( not ( = ?auto_95805 ?auto_95808 ) ) ( not ( = ?auto_95805 ?auto_95809 ) ) ( not ( = ?auto_95805 ?auto_95810 ) ) ( not ( = ?auto_95805 ?auto_95811 ) ) ( not ( = ?auto_95805 ?auto_95812 ) ) ( not ( = ?auto_95805 ?auto_95813 ) ) ( not ( = ?auto_95806 ?auto_95807 ) ) ( not ( = ?auto_95806 ?auto_95808 ) ) ( not ( = ?auto_95806 ?auto_95809 ) ) ( not ( = ?auto_95806 ?auto_95810 ) ) ( not ( = ?auto_95806 ?auto_95811 ) ) ( not ( = ?auto_95806 ?auto_95812 ) ) ( not ( = ?auto_95806 ?auto_95813 ) ) ( not ( = ?auto_95807 ?auto_95808 ) ) ( not ( = ?auto_95807 ?auto_95809 ) ) ( not ( = ?auto_95807 ?auto_95810 ) ) ( not ( = ?auto_95807 ?auto_95811 ) ) ( not ( = ?auto_95807 ?auto_95812 ) ) ( not ( = ?auto_95807 ?auto_95813 ) ) ( not ( = ?auto_95808 ?auto_95809 ) ) ( not ( = ?auto_95808 ?auto_95810 ) ) ( not ( = ?auto_95808 ?auto_95811 ) ) ( not ( = ?auto_95808 ?auto_95812 ) ) ( not ( = ?auto_95808 ?auto_95813 ) ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( not ( = ?auto_95809 ?auto_95811 ) ) ( not ( = ?auto_95809 ?auto_95812 ) ) ( not ( = ?auto_95809 ?auto_95813 ) ) ( not ( = ?auto_95810 ?auto_95811 ) ) ( not ( = ?auto_95810 ?auto_95812 ) ) ( not ( = ?auto_95810 ?auto_95813 ) ) ( not ( = ?auto_95811 ?auto_95812 ) ) ( not ( = ?auto_95811 ?auto_95813 ) ) ( not ( = ?auto_95812 ?auto_95813 ) ) ( ON ?auto_95811 ?auto_95812 ) ( CLEAR ?auto_95809 ) ( ON ?auto_95810 ?auto_95811 ) ( CLEAR ?auto_95810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 ?auto_95809 ?auto_95810 )
      ( MAKE-8PILE ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 ?auto_95809 ?auto_95810 ?auto_95811 ?auto_95812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95839 - BLOCK
      ?auto_95840 - BLOCK
      ?auto_95841 - BLOCK
      ?auto_95842 - BLOCK
      ?auto_95843 - BLOCK
      ?auto_95844 - BLOCK
      ?auto_95845 - BLOCK
      ?auto_95846 - BLOCK
    )
    :vars
    (
      ?auto_95847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95846 ?auto_95847 ) ( ON-TABLE ?auto_95839 ) ( ON ?auto_95840 ?auto_95839 ) ( ON ?auto_95841 ?auto_95840 ) ( ON ?auto_95842 ?auto_95841 ) ( not ( = ?auto_95839 ?auto_95840 ) ) ( not ( = ?auto_95839 ?auto_95841 ) ) ( not ( = ?auto_95839 ?auto_95842 ) ) ( not ( = ?auto_95839 ?auto_95843 ) ) ( not ( = ?auto_95839 ?auto_95844 ) ) ( not ( = ?auto_95839 ?auto_95845 ) ) ( not ( = ?auto_95839 ?auto_95846 ) ) ( not ( = ?auto_95839 ?auto_95847 ) ) ( not ( = ?auto_95840 ?auto_95841 ) ) ( not ( = ?auto_95840 ?auto_95842 ) ) ( not ( = ?auto_95840 ?auto_95843 ) ) ( not ( = ?auto_95840 ?auto_95844 ) ) ( not ( = ?auto_95840 ?auto_95845 ) ) ( not ( = ?auto_95840 ?auto_95846 ) ) ( not ( = ?auto_95840 ?auto_95847 ) ) ( not ( = ?auto_95841 ?auto_95842 ) ) ( not ( = ?auto_95841 ?auto_95843 ) ) ( not ( = ?auto_95841 ?auto_95844 ) ) ( not ( = ?auto_95841 ?auto_95845 ) ) ( not ( = ?auto_95841 ?auto_95846 ) ) ( not ( = ?auto_95841 ?auto_95847 ) ) ( not ( = ?auto_95842 ?auto_95843 ) ) ( not ( = ?auto_95842 ?auto_95844 ) ) ( not ( = ?auto_95842 ?auto_95845 ) ) ( not ( = ?auto_95842 ?auto_95846 ) ) ( not ( = ?auto_95842 ?auto_95847 ) ) ( not ( = ?auto_95843 ?auto_95844 ) ) ( not ( = ?auto_95843 ?auto_95845 ) ) ( not ( = ?auto_95843 ?auto_95846 ) ) ( not ( = ?auto_95843 ?auto_95847 ) ) ( not ( = ?auto_95844 ?auto_95845 ) ) ( not ( = ?auto_95844 ?auto_95846 ) ) ( not ( = ?auto_95844 ?auto_95847 ) ) ( not ( = ?auto_95845 ?auto_95846 ) ) ( not ( = ?auto_95845 ?auto_95847 ) ) ( not ( = ?auto_95846 ?auto_95847 ) ) ( ON ?auto_95845 ?auto_95846 ) ( ON ?auto_95844 ?auto_95845 ) ( CLEAR ?auto_95842 ) ( ON ?auto_95843 ?auto_95844 ) ( CLEAR ?auto_95843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95839 ?auto_95840 ?auto_95841 ?auto_95842 ?auto_95843 )
      ( MAKE-8PILE ?auto_95839 ?auto_95840 ?auto_95841 ?auto_95842 ?auto_95843 ?auto_95844 ?auto_95845 ?auto_95846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95873 - BLOCK
      ?auto_95874 - BLOCK
      ?auto_95875 - BLOCK
      ?auto_95876 - BLOCK
      ?auto_95877 - BLOCK
      ?auto_95878 - BLOCK
      ?auto_95879 - BLOCK
      ?auto_95880 - BLOCK
    )
    :vars
    (
      ?auto_95881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95880 ?auto_95881 ) ( ON-TABLE ?auto_95873 ) ( ON ?auto_95874 ?auto_95873 ) ( ON ?auto_95875 ?auto_95874 ) ( not ( = ?auto_95873 ?auto_95874 ) ) ( not ( = ?auto_95873 ?auto_95875 ) ) ( not ( = ?auto_95873 ?auto_95876 ) ) ( not ( = ?auto_95873 ?auto_95877 ) ) ( not ( = ?auto_95873 ?auto_95878 ) ) ( not ( = ?auto_95873 ?auto_95879 ) ) ( not ( = ?auto_95873 ?auto_95880 ) ) ( not ( = ?auto_95873 ?auto_95881 ) ) ( not ( = ?auto_95874 ?auto_95875 ) ) ( not ( = ?auto_95874 ?auto_95876 ) ) ( not ( = ?auto_95874 ?auto_95877 ) ) ( not ( = ?auto_95874 ?auto_95878 ) ) ( not ( = ?auto_95874 ?auto_95879 ) ) ( not ( = ?auto_95874 ?auto_95880 ) ) ( not ( = ?auto_95874 ?auto_95881 ) ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( not ( = ?auto_95875 ?auto_95877 ) ) ( not ( = ?auto_95875 ?auto_95878 ) ) ( not ( = ?auto_95875 ?auto_95879 ) ) ( not ( = ?auto_95875 ?auto_95880 ) ) ( not ( = ?auto_95875 ?auto_95881 ) ) ( not ( = ?auto_95876 ?auto_95877 ) ) ( not ( = ?auto_95876 ?auto_95878 ) ) ( not ( = ?auto_95876 ?auto_95879 ) ) ( not ( = ?auto_95876 ?auto_95880 ) ) ( not ( = ?auto_95876 ?auto_95881 ) ) ( not ( = ?auto_95877 ?auto_95878 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95880 ) ) ( not ( = ?auto_95877 ?auto_95881 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) ( not ( = ?auto_95879 ?auto_95881 ) ) ( not ( = ?auto_95880 ?auto_95881 ) ) ( ON ?auto_95879 ?auto_95880 ) ( ON ?auto_95878 ?auto_95879 ) ( ON ?auto_95877 ?auto_95878 ) ( CLEAR ?auto_95875 ) ( ON ?auto_95876 ?auto_95877 ) ( CLEAR ?auto_95876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95873 ?auto_95874 ?auto_95875 ?auto_95876 )
      ( MAKE-8PILE ?auto_95873 ?auto_95874 ?auto_95875 ?auto_95876 ?auto_95877 ?auto_95878 ?auto_95879 ?auto_95880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95907 - BLOCK
      ?auto_95908 - BLOCK
      ?auto_95909 - BLOCK
      ?auto_95910 - BLOCK
      ?auto_95911 - BLOCK
      ?auto_95912 - BLOCK
      ?auto_95913 - BLOCK
      ?auto_95914 - BLOCK
    )
    :vars
    (
      ?auto_95915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95914 ?auto_95915 ) ( ON-TABLE ?auto_95907 ) ( ON ?auto_95908 ?auto_95907 ) ( not ( = ?auto_95907 ?auto_95908 ) ) ( not ( = ?auto_95907 ?auto_95909 ) ) ( not ( = ?auto_95907 ?auto_95910 ) ) ( not ( = ?auto_95907 ?auto_95911 ) ) ( not ( = ?auto_95907 ?auto_95912 ) ) ( not ( = ?auto_95907 ?auto_95913 ) ) ( not ( = ?auto_95907 ?auto_95914 ) ) ( not ( = ?auto_95907 ?auto_95915 ) ) ( not ( = ?auto_95908 ?auto_95909 ) ) ( not ( = ?auto_95908 ?auto_95910 ) ) ( not ( = ?auto_95908 ?auto_95911 ) ) ( not ( = ?auto_95908 ?auto_95912 ) ) ( not ( = ?auto_95908 ?auto_95913 ) ) ( not ( = ?auto_95908 ?auto_95914 ) ) ( not ( = ?auto_95908 ?auto_95915 ) ) ( not ( = ?auto_95909 ?auto_95910 ) ) ( not ( = ?auto_95909 ?auto_95911 ) ) ( not ( = ?auto_95909 ?auto_95912 ) ) ( not ( = ?auto_95909 ?auto_95913 ) ) ( not ( = ?auto_95909 ?auto_95914 ) ) ( not ( = ?auto_95909 ?auto_95915 ) ) ( not ( = ?auto_95910 ?auto_95911 ) ) ( not ( = ?auto_95910 ?auto_95912 ) ) ( not ( = ?auto_95910 ?auto_95913 ) ) ( not ( = ?auto_95910 ?auto_95914 ) ) ( not ( = ?auto_95910 ?auto_95915 ) ) ( not ( = ?auto_95911 ?auto_95912 ) ) ( not ( = ?auto_95911 ?auto_95913 ) ) ( not ( = ?auto_95911 ?auto_95914 ) ) ( not ( = ?auto_95911 ?auto_95915 ) ) ( not ( = ?auto_95912 ?auto_95913 ) ) ( not ( = ?auto_95912 ?auto_95914 ) ) ( not ( = ?auto_95912 ?auto_95915 ) ) ( not ( = ?auto_95913 ?auto_95914 ) ) ( not ( = ?auto_95913 ?auto_95915 ) ) ( not ( = ?auto_95914 ?auto_95915 ) ) ( ON ?auto_95913 ?auto_95914 ) ( ON ?auto_95912 ?auto_95913 ) ( ON ?auto_95911 ?auto_95912 ) ( ON ?auto_95910 ?auto_95911 ) ( CLEAR ?auto_95908 ) ( ON ?auto_95909 ?auto_95910 ) ( CLEAR ?auto_95909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95907 ?auto_95908 ?auto_95909 )
      ( MAKE-8PILE ?auto_95907 ?auto_95908 ?auto_95909 ?auto_95910 ?auto_95911 ?auto_95912 ?auto_95913 ?auto_95914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95941 - BLOCK
      ?auto_95942 - BLOCK
      ?auto_95943 - BLOCK
      ?auto_95944 - BLOCK
      ?auto_95945 - BLOCK
      ?auto_95946 - BLOCK
      ?auto_95947 - BLOCK
      ?auto_95948 - BLOCK
    )
    :vars
    (
      ?auto_95949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95948 ?auto_95949 ) ( ON-TABLE ?auto_95941 ) ( not ( = ?auto_95941 ?auto_95942 ) ) ( not ( = ?auto_95941 ?auto_95943 ) ) ( not ( = ?auto_95941 ?auto_95944 ) ) ( not ( = ?auto_95941 ?auto_95945 ) ) ( not ( = ?auto_95941 ?auto_95946 ) ) ( not ( = ?auto_95941 ?auto_95947 ) ) ( not ( = ?auto_95941 ?auto_95948 ) ) ( not ( = ?auto_95941 ?auto_95949 ) ) ( not ( = ?auto_95942 ?auto_95943 ) ) ( not ( = ?auto_95942 ?auto_95944 ) ) ( not ( = ?auto_95942 ?auto_95945 ) ) ( not ( = ?auto_95942 ?auto_95946 ) ) ( not ( = ?auto_95942 ?auto_95947 ) ) ( not ( = ?auto_95942 ?auto_95948 ) ) ( not ( = ?auto_95942 ?auto_95949 ) ) ( not ( = ?auto_95943 ?auto_95944 ) ) ( not ( = ?auto_95943 ?auto_95945 ) ) ( not ( = ?auto_95943 ?auto_95946 ) ) ( not ( = ?auto_95943 ?auto_95947 ) ) ( not ( = ?auto_95943 ?auto_95948 ) ) ( not ( = ?auto_95943 ?auto_95949 ) ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95944 ?auto_95946 ) ) ( not ( = ?auto_95944 ?auto_95947 ) ) ( not ( = ?auto_95944 ?auto_95948 ) ) ( not ( = ?auto_95944 ?auto_95949 ) ) ( not ( = ?auto_95945 ?auto_95946 ) ) ( not ( = ?auto_95945 ?auto_95947 ) ) ( not ( = ?auto_95945 ?auto_95948 ) ) ( not ( = ?auto_95945 ?auto_95949 ) ) ( not ( = ?auto_95946 ?auto_95947 ) ) ( not ( = ?auto_95946 ?auto_95948 ) ) ( not ( = ?auto_95946 ?auto_95949 ) ) ( not ( = ?auto_95947 ?auto_95948 ) ) ( not ( = ?auto_95947 ?auto_95949 ) ) ( not ( = ?auto_95948 ?auto_95949 ) ) ( ON ?auto_95947 ?auto_95948 ) ( ON ?auto_95946 ?auto_95947 ) ( ON ?auto_95945 ?auto_95946 ) ( ON ?auto_95944 ?auto_95945 ) ( ON ?auto_95943 ?auto_95944 ) ( CLEAR ?auto_95941 ) ( ON ?auto_95942 ?auto_95943 ) ( CLEAR ?auto_95942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95941 ?auto_95942 )
      ( MAKE-8PILE ?auto_95941 ?auto_95942 ?auto_95943 ?auto_95944 ?auto_95945 ?auto_95946 ?auto_95947 ?auto_95948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95975 - BLOCK
      ?auto_95976 - BLOCK
      ?auto_95977 - BLOCK
      ?auto_95978 - BLOCK
      ?auto_95979 - BLOCK
      ?auto_95980 - BLOCK
      ?auto_95981 - BLOCK
      ?auto_95982 - BLOCK
    )
    :vars
    (
      ?auto_95983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95982 ?auto_95983 ) ( not ( = ?auto_95975 ?auto_95976 ) ) ( not ( = ?auto_95975 ?auto_95977 ) ) ( not ( = ?auto_95975 ?auto_95978 ) ) ( not ( = ?auto_95975 ?auto_95979 ) ) ( not ( = ?auto_95975 ?auto_95980 ) ) ( not ( = ?auto_95975 ?auto_95981 ) ) ( not ( = ?auto_95975 ?auto_95982 ) ) ( not ( = ?auto_95975 ?auto_95983 ) ) ( not ( = ?auto_95976 ?auto_95977 ) ) ( not ( = ?auto_95976 ?auto_95978 ) ) ( not ( = ?auto_95976 ?auto_95979 ) ) ( not ( = ?auto_95976 ?auto_95980 ) ) ( not ( = ?auto_95976 ?auto_95981 ) ) ( not ( = ?auto_95976 ?auto_95982 ) ) ( not ( = ?auto_95976 ?auto_95983 ) ) ( not ( = ?auto_95977 ?auto_95978 ) ) ( not ( = ?auto_95977 ?auto_95979 ) ) ( not ( = ?auto_95977 ?auto_95980 ) ) ( not ( = ?auto_95977 ?auto_95981 ) ) ( not ( = ?auto_95977 ?auto_95982 ) ) ( not ( = ?auto_95977 ?auto_95983 ) ) ( not ( = ?auto_95978 ?auto_95979 ) ) ( not ( = ?auto_95978 ?auto_95980 ) ) ( not ( = ?auto_95978 ?auto_95981 ) ) ( not ( = ?auto_95978 ?auto_95982 ) ) ( not ( = ?auto_95978 ?auto_95983 ) ) ( not ( = ?auto_95979 ?auto_95980 ) ) ( not ( = ?auto_95979 ?auto_95981 ) ) ( not ( = ?auto_95979 ?auto_95982 ) ) ( not ( = ?auto_95979 ?auto_95983 ) ) ( not ( = ?auto_95980 ?auto_95981 ) ) ( not ( = ?auto_95980 ?auto_95982 ) ) ( not ( = ?auto_95980 ?auto_95983 ) ) ( not ( = ?auto_95981 ?auto_95982 ) ) ( not ( = ?auto_95981 ?auto_95983 ) ) ( not ( = ?auto_95982 ?auto_95983 ) ) ( ON ?auto_95981 ?auto_95982 ) ( ON ?auto_95980 ?auto_95981 ) ( ON ?auto_95979 ?auto_95980 ) ( ON ?auto_95978 ?auto_95979 ) ( ON ?auto_95977 ?auto_95978 ) ( ON ?auto_95976 ?auto_95977 ) ( ON ?auto_95975 ?auto_95976 ) ( CLEAR ?auto_95975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95975 )
      ( MAKE-8PILE ?auto_95975 ?auto_95976 ?auto_95977 ?auto_95978 ?auto_95979 ?auto_95980 ?auto_95981 ?auto_95982 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96010 - BLOCK
      ?auto_96011 - BLOCK
      ?auto_96012 - BLOCK
      ?auto_96013 - BLOCK
      ?auto_96014 - BLOCK
      ?auto_96015 - BLOCK
      ?auto_96016 - BLOCK
      ?auto_96017 - BLOCK
      ?auto_96018 - BLOCK
    )
    :vars
    (
      ?auto_96019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96017 ) ( ON ?auto_96018 ?auto_96019 ) ( CLEAR ?auto_96018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96010 ) ( ON ?auto_96011 ?auto_96010 ) ( ON ?auto_96012 ?auto_96011 ) ( ON ?auto_96013 ?auto_96012 ) ( ON ?auto_96014 ?auto_96013 ) ( ON ?auto_96015 ?auto_96014 ) ( ON ?auto_96016 ?auto_96015 ) ( ON ?auto_96017 ?auto_96016 ) ( not ( = ?auto_96010 ?auto_96011 ) ) ( not ( = ?auto_96010 ?auto_96012 ) ) ( not ( = ?auto_96010 ?auto_96013 ) ) ( not ( = ?auto_96010 ?auto_96014 ) ) ( not ( = ?auto_96010 ?auto_96015 ) ) ( not ( = ?auto_96010 ?auto_96016 ) ) ( not ( = ?auto_96010 ?auto_96017 ) ) ( not ( = ?auto_96010 ?auto_96018 ) ) ( not ( = ?auto_96010 ?auto_96019 ) ) ( not ( = ?auto_96011 ?auto_96012 ) ) ( not ( = ?auto_96011 ?auto_96013 ) ) ( not ( = ?auto_96011 ?auto_96014 ) ) ( not ( = ?auto_96011 ?auto_96015 ) ) ( not ( = ?auto_96011 ?auto_96016 ) ) ( not ( = ?auto_96011 ?auto_96017 ) ) ( not ( = ?auto_96011 ?auto_96018 ) ) ( not ( = ?auto_96011 ?auto_96019 ) ) ( not ( = ?auto_96012 ?auto_96013 ) ) ( not ( = ?auto_96012 ?auto_96014 ) ) ( not ( = ?auto_96012 ?auto_96015 ) ) ( not ( = ?auto_96012 ?auto_96016 ) ) ( not ( = ?auto_96012 ?auto_96017 ) ) ( not ( = ?auto_96012 ?auto_96018 ) ) ( not ( = ?auto_96012 ?auto_96019 ) ) ( not ( = ?auto_96013 ?auto_96014 ) ) ( not ( = ?auto_96013 ?auto_96015 ) ) ( not ( = ?auto_96013 ?auto_96016 ) ) ( not ( = ?auto_96013 ?auto_96017 ) ) ( not ( = ?auto_96013 ?auto_96018 ) ) ( not ( = ?auto_96013 ?auto_96019 ) ) ( not ( = ?auto_96014 ?auto_96015 ) ) ( not ( = ?auto_96014 ?auto_96016 ) ) ( not ( = ?auto_96014 ?auto_96017 ) ) ( not ( = ?auto_96014 ?auto_96018 ) ) ( not ( = ?auto_96014 ?auto_96019 ) ) ( not ( = ?auto_96015 ?auto_96016 ) ) ( not ( = ?auto_96015 ?auto_96017 ) ) ( not ( = ?auto_96015 ?auto_96018 ) ) ( not ( = ?auto_96015 ?auto_96019 ) ) ( not ( = ?auto_96016 ?auto_96017 ) ) ( not ( = ?auto_96016 ?auto_96018 ) ) ( not ( = ?auto_96016 ?auto_96019 ) ) ( not ( = ?auto_96017 ?auto_96018 ) ) ( not ( = ?auto_96017 ?auto_96019 ) ) ( not ( = ?auto_96018 ?auto_96019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96018 ?auto_96019 )
      ( !STACK ?auto_96018 ?auto_96017 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96048 - BLOCK
      ?auto_96049 - BLOCK
      ?auto_96050 - BLOCK
      ?auto_96051 - BLOCK
      ?auto_96052 - BLOCK
      ?auto_96053 - BLOCK
      ?auto_96054 - BLOCK
      ?auto_96055 - BLOCK
      ?auto_96056 - BLOCK
    )
    :vars
    (
      ?auto_96057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96056 ?auto_96057 ) ( ON-TABLE ?auto_96048 ) ( ON ?auto_96049 ?auto_96048 ) ( ON ?auto_96050 ?auto_96049 ) ( ON ?auto_96051 ?auto_96050 ) ( ON ?auto_96052 ?auto_96051 ) ( ON ?auto_96053 ?auto_96052 ) ( ON ?auto_96054 ?auto_96053 ) ( not ( = ?auto_96048 ?auto_96049 ) ) ( not ( = ?auto_96048 ?auto_96050 ) ) ( not ( = ?auto_96048 ?auto_96051 ) ) ( not ( = ?auto_96048 ?auto_96052 ) ) ( not ( = ?auto_96048 ?auto_96053 ) ) ( not ( = ?auto_96048 ?auto_96054 ) ) ( not ( = ?auto_96048 ?auto_96055 ) ) ( not ( = ?auto_96048 ?auto_96056 ) ) ( not ( = ?auto_96048 ?auto_96057 ) ) ( not ( = ?auto_96049 ?auto_96050 ) ) ( not ( = ?auto_96049 ?auto_96051 ) ) ( not ( = ?auto_96049 ?auto_96052 ) ) ( not ( = ?auto_96049 ?auto_96053 ) ) ( not ( = ?auto_96049 ?auto_96054 ) ) ( not ( = ?auto_96049 ?auto_96055 ) ) ( not ( = ?auto_96049 ?auto_96056 ) ) ( not ( = ?auto_96049 ?auto_96057 ) ) ( not ( = ?auto_96050 ?auto_96051 ) ) ( not ( = ?auto_96050 ?auto_96052 ) ) ( not ( = ?auto_96050 ?auto_96053 ) ) ( not ( = ?auto_96050 ?auto_96054 ) ) ( not ( = ?auto_96050 ?auto_96055 ) ) ( not ( = ?auto_96050 ?auto_96056 ) ) ( not ( = ?auto_96050 ?auto_96057 ) ) ( not ( = ?auto_96051 ?auto_96052 ) ) ( not ( = ?auto_96051 ?auto_96053 ) ) ( not ( = ?auto_96051 ?auto_96054 ) ) ( not ( = ?auto_96051 ?auto_96055 ) ) ( not ( = ?auto_96051 ?auto_96056 ) ) ( not ( = ?auto_96051 ?auto_96057 ) ) ( not ( = ?auto_96052 ?auto_96053 ) ) ( not ( = ?auto_96052 ?auto_96054 ) ) ( not ( = ?auto_96052 ?auto_96055 ) ) ( not ( = ?auto_96052 ?auto_96056 ) ) ( not ( = ?auto_96052 ?auto_96057 ) ) ( not ( = ?auto_96053 ?auto_96054 ) ) ( not ( = ?auto_96053 ?auto_96055 ) ) ( not ( = ?auto_96053 ?auto_96056 ) ) ( not ( = ?auto_96053 ?auto_96057 ) ) ( not ( = ?auto_96054 ?auto_96055 ) ) ( not ( = ?auto_96054 ?auto_96056 ) ) ( not ( = ?auto_96054 ?auto_96057 ) ) ( not ( = ?auto_96055 ?auto_96056 ) ) ( not ( = ?auto_96055 ?auto_96057 ) ) ( not ( = ?auto_96056 ?auto_96057 ) ) ( CLEAR ?auto_96054 ) ( ON ?auto_96055 ?auto_96056 ) ( CLEAR ?auto_96055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96048 ?auto_96049 ?auto_96050 ?auto_96051 ?auto_96052 ?auto_96053 ?auto_96054 ?auto_96055 )
      ( MAKE-9PILE ?auto_96048 ?auto_96049 ?auto_96050 ?auto_96051 ?auto_96052 ?auto_96053 ?auto_96054 ?auto_96055 ?auto_96056 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96086 - BLOCK
      ?auto_96087 - BLOCK
      ?auto_96088 - BLOCK
      ?auto_96089 - BLOCK
      ?auto_96090 - BLOCK
      ?auto_96091 - BLOCK
      ?auto_96092 - BLOCK
      ?auto_96093 - BLOCK
      ?auto_96094 - BLOCK
    )
    :vars
    (
      ?auto_96095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96094 ?auto_96095 ) ( ON-TABLE ?auto_96086 ) ( ON ?auto_96087 ?auto_96086 ) ( ON ?auto_96088 ?auto_96087 ) ( ON ?auto_96089 ?auto_96088 ) ( ON ?auto_96090 ?auto_96089 ) ( ON ?auto_96091 ?auto_96090 ) ( not ( = ?auto_96086 ?auto_96087 ) ) ( not ( = ?auto_96086 ?auto_96088 ) ) ( not ( = ?auto_96086 ?auto_96089 ) ) ( not ( = ?auto_96086 ?auto_96090 ) ) ( not ( = ?auto_96086 ?auto_96091 ) ) ( not ( = ?auto_96086 ?auto_96092 ) ) ( not ( = ?auto_96086 ?auto_96093 ) ) ( not ( = ?auto_96086 ?auto_96094 ) ) ( not ( = ?auto_96086 ?auto_96095 ) ) ( not ( = ?auto_96087 ?auto_96088 ) ) ( not ( = ?auto_96087 ?auto_96089 ) ) ( not ( = ?auto_96087 ?auto_96090 ) ) ( not ( = ?auto_96087 ?auto_96091 ) ) ( not ( = ?auto_96087 ?auto_96092 ) ) ( not ( = ?auto_96087 ?auto_96093 ) ) ( not ( = ?auto_96087 ?auto_96094 ) ) ( not ( = ?auto_96087 ?auto_96095 ) ) ( not ( = ?auto_96088 ?auto_96089 ) ) ( not ( = ?auto_96088 ?auto_96090 ) ) ( not ( = ?auto_96088 ?auto_96091 ) ) ( not ( = ?auto_96088 ?auto_96092 ) ) ( not ( = ?auto_96088 ?auto_96093 ) ) ( not ( = ?auto_96088 ?auto_96094 ) ) ( not ( = ?auto_96088 ?auto_96095 ) ) ( not ( = ?auto_96089 ?auto_96090 ) ) ( not ( = ?auto_96089 ?auto_96091 ) ) ( not ( = ?auto_96089 ?auto_96092 ) ) ( not ( = ?auto_96089 ?auto_96093 ) ) ( not ( = ?auto_96089 ?auto_96094 ) ) ( not ( = ?auto_96089 ?auto_96095 ) ) ( not ( = ?auto_96090 ?auto_96091 ) ) ( not ( = ?auto_96090 ?auto_96092 ) ) ( not ( = ?auto_96090 ?auto_96093 ) ) ( not ( = ?auto_96090 ?auto_96094 ) ) ( not ( = ?auto_96090 ?auto_96095 ) ) ( not ( = ?auto_96091 ?auto_96092 ) ) ( not ( = ?auto_96091 ?auto_96093 ) ) ( not ( = ?auto_96091 ?auto_96094 ) ) ( not ( = ?auto_96091 ?auto_96095 ) ) ( not ( = ?auto_96092 ?auto_96093 ) ) ( not ( = ?auto_96092 ?auto_96094 ) ) ( not ( = ?auto_96092 ?auto_96095 ) ) ( not ( = ?auto_96093 ?auto_96094 ) ) ( not ( = ?auto_96093 ?auto_96095 ) ) ( not ( = ?auto_96094 ?auto_96095 ) ) ( ON ?auto_96093 ?auto_96094 ) ( CLEAR ?auto_96091 ) ( ON ?auto_96092 ?auto_96093 ) ( CLEAR ?auto_96092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96086 ?auto_96087 ?auto_96088 ?auto_96089 ?auto_96090 ?auto_96091 ?auto_96092 )
      ( MAKE-9PILE ?auto_96086 ?auto_96087 ?auto_96088 ?auto_96089 ?auto_96090 ?auto_96091 ?auto_96092 ?auto_96093 ?auto_96094 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96124 - BLOCK
      ?auto_96125 - BLOCK
      ?auto_96126 - BLOCK
      ?auto_96127 - BLOCK
      ?auto_96128 - BLOCK
      ?auto_96129 - BLOCK
      ?auto_96130 - BLOCK
      ?auto_96131 - BLOCK
      ?auto_96132 - BLOCK
    )
    :vars
    (
      ?auto_96133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96132 ?auto_96133 ) ( ON-TABLE ?auto_96124 ) ( ON ?auto_96125 ?auto_96124 ) ( ON ?auto_96126 ?auto_96125 ) ( ON ?auto_96127 ?auto_96126 ) ( ON ?auto_96128 ?auto_96127 ) ( not ( = ?auto_96124 ?auto_96125 ) ) ( not ( = ?auto_96124 ?auto_96126 ) ) ( not ( = ?auto_96124 ?auto_96127 ) ) ( not ( = ?auto_96124 ?auto_96128 ) ) ( not ( = ?auto_96124 ?auto_96129 ) ) ( not ( = ?auto_96124 ?auto_96130 ) ) ( not ( = ?auto_96124 ?auto_96131 ) ) ( not ( = ?auto_96124 ?auto_96132 ) ) ( not ( = ?auto_96124 ?auto_96133 ) ) ( not ( = ?auto_96125 ?auto_96126 ) ) ( not ( = ?auto_96125 ?auto_96127 ) ) ( not ( = ?auto_96125 ?auto_96128 ) ) ( not ( = ?auto_96125 ?auto_96129 ) ) ( not ( = ?auto_96125 ?auto_96130 ) ) ( not ( = ?auto_96125 ?auto_96131 ) ) ( not ( = ?auto_96125 ?auto_96132 ) ) ( not ( = ?auto_96125 ?auto_96133 ) ) ( not ( = ?auto_96126 ?auto_96127 ) ) ( not ( = ?auto_96126 ?auto_96128 ) ) ( not ( = ?auto_96126 ?auto_96129 ) ) ( not ( = ?auto_96126 ?auto_96130 ) ) ( not ( = ?auto_96126 ?auto_96131 ) ) ( not ( = ?auto_96126 ?auto_96132 ) ) ( not ( = ?auto_96126 ?auto_96133 ) ) ( not ( = ?auto_96127 ?auto_96128 ) ) ( not ( = ?auto_96127 ?auto_96129 ) ) ( not ( = ?auto_96127 ?auto_96130 ) ) ( not ( = ?auto_96127 ?auto_96131 ) ) ( not ( = ?auto_96127 ?auto_96132 ) ) ( not ( = ?auto_96127 ?auto_96133 ) ) ( not ( = ?auto_96128 ?auto_96129 ) ) ( not ( = ?auto_96128 ?auto_96130 ) ) ( not ( = ?auto_96128 ?auto_96131 ) ) ( not ( = ?auto_96128 ?auto_96132 ) ) ( not ( = ?auto_96128 ?auto_96133 ) ) ( not ( = ?auto_96129 ?auto_96130 ) ) ( not ( = ?auto_96129 ?auto_96131 ) ) ( not ( = ?auto_96129 ?auto_96132 ) ) ( not ( = ?auto_96129 ?auto_96133 ) ) ( not ( = ?auto_96130 ?auto_96131 ) ) ( not ( = ?auto_96130 ?auto_96132 ) ) ( not ( = ?auto_96130 ?auto_96133 ) ) ( not ( = ?auto_96131 ?auto_96132 ) ) ( not ( = ?auto_96131 ?auto_96133 ) ) ( not ( = ?auto_96132 ?auto_96133 ) ) ( ON ?auto_96131 ?auto_96132 ) ( ON ?auto_96130 ?auto_96131 ) ( CLEAR ?auto_96128 ) ( ON ?auto_96129 ?auto_96130 ) ( CLEAR ?auto_96129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96124 ?auto_96125 ?auto_96126 ?auto_96127 ?auto_96128 ?auto_96129 )
      ( MAKE-9PILE ?auto_96124 ?auto_96125 ?auto_96126 ?auto_96127 ?auto_96128 ?auto_96129 ?auto_96130 ?auto_96131 ?auto_96132 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96162 - BLOCK
      ?auto_96163 - BLOCK
      ?auto_96164 - BLOCK
      ?auto_96165 - BLOCK
      ?auto_96166 - BLOCK
      ?auto_96167 - BLOCK
      ?auto_96168 - BLOCK
      ?auto_96169 - BLOCK
      ?auto_96170 - BLOCK
    )
    :vars
    (
      ?auto_96171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96170 ?auto_96171 ) ( ON-TABLE ?auto_96162 ) ( ON ?auto_96163 ?auto_96162 ) ( ON ?auto_96164 ?auto_96163 ) ( ON ?auto_96165 ?auto_96164 ) ( not ( = ?auto_96162 ?auto_96163 ) ) ( not ( = ?auto_96162 ?auto_96164 ) ) ( not ( = ?auto_96162 ?auto_96165 ) ) ( not ( = ?auto_96162 ?auto_96166 ) ) ( not ( = ?auto_96162 ?auto_96167 ) ) ( not ( = ?auto_96162 ?auto_96168 ) ) ( not ( = ?auto_96162 ?auto_96169 ) ) ( not ( = ?auto_96162 ?auto_96170 ) ) ( not ( = ?auto_96162 ?auto_96171 ) ) ( not ( = ?auto_96163 ?auto_96164 ) ) ( not ( = ?auto_96163 ?auto_96165 ) ) ( not ( = ?auto_96163 ?auto_96166 ) ) ( not ( = ?auto_96163 ?auto_96167 ) ) ( not ( = ?auto_96163 ?auto_96168 ) ) ( not ( = ?auto_96163 ?auto_96169 ) ) ( not ( = ?auto_96163 ?auto_96170 ) ) ( not ( = ?auto_96163 ?auto_96171 ) ) ( not ( = ?auto_96164 ?auto_96165 ) ) ( not ( = ?auto_96164 ?auto_96166 ) ) ( not ( = ?auto_96164 ?auto_96167 ) ) ( not ( = ?auto_96164 ?auto_96168 ) ) ( not ( = ?auto_96164 ?auto_96169 ) ) ( not ( = ?auto_96164 ?auto_96170 ) ) ( not ( = ?auto_96164 ?auto_96171 ) ) ( not ( = ?auto_96165 ?auto_96166 ) ) ( not ( = ?auto_96165 ?auto_96167 ) ) ( not ( = ?auto_96165 ?auto_96168 ) ) ( not ( = ?auto_96165 ?auto_96169 ) ) ( not ( = ?auto_96165 ?auto_96170 ) ) ( not ( = ?auto_96165 ?auto_96171 ) ) ( not ( = ?auto_96166 ?auto_96167 ) ) ( not ( = ?auto_96166 ?auto_96168 ) ) ( not ( = ?auto_96166 ?auto_96169 ) ) ( not ( = ?auto_96166 ?auto_96170 ) ) ( not ( = ?auto_96166 ?auto_96171 ) ) ( not ( = ?auto_96167 ?auto_96168 ) ) ( not ( = ?auto_96167 ?auto_96169 ) ) ( not ( = ?auto_96167 ?auto_96170 ) ) ( not ( = ?auto_96167 ?auto_96171 ) ) ( not ( = ?auto_96168 ?auto_96169 ) ) ( not ( = ?auto_96168 ?auto_96170 ) ) ( not ( = ?auto_96168 ?auto_96171 ) ) ( not ( = ?auto_96169 ?auto_96170 ) ) ( not ( = ?auto_96169 ?auto_96171 ) ) ( not ( = ?auto_96170 ?auto_96171 ) ) ( ON ?auto_96169 ?auto_96170 ) ( ON ?auto_96168 ?auto_96169 ) ( ON ?auto_96167 ?auto_96168 ) ( CLEAR ?auto_96165 ) ( ON ?auto_96166 ?auto_96167 ) ( CLEAR ?auto_96166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96162 ?auto_96163 ?auto_96164 ?auto_96165 ?auto_96166 )
      ( MAKE-9PILE ?auto_96162 ?auto_96163 ?auto_96164 ?auto_96165 ?auto_96166 ?auto_96167 ?auto_96168 ?auto_96169 ?auto_96170 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96200 - BLOCK
      ?auto_96201 - BLOCK
      ?auto_96202 - BLOCK
      ?auto_96203 - BLOCK
      ?auto_96204 - BLOCK
      ?auto_96205 - BLOCK
      ?auto_96206 - BLOCK
      ?auto_96207 - BLOCK
      ?auto_96208 - BLOCK
    )
    :vars
    (
      ?auto_96209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96208 ?auto_96209 ) ( ON-TABLE ?auto_96200 ) ( ON ?auto_96201 ?auto_96200 ) ( ON ?auto_96202 ?auto_96201 ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( not ( = ?auto_96200 ?auto_96202 ) ) ( not ( = ?auto_96200 ?auto_96203 ) ) ( not ( = ?auto_96200 ?auto_96204 ) ) ( not ( = ?auto_96200 ?auto_96205 ) ) ( not ( = ?auto_96200 ?auto_96206 ) ) ( not ( = ?auto_96200 ?auto_96207 ) ) ( not ( = ?auto_96200 ?auto_96208 ) ) ( not ( = ?auto_96200 ?auto_96209 ) ) ( not ( = ?auto_96201 ?auto_96202 ) ) ( not ( = ?auto_96201 ?auto_96203 ) ) ( not ( = ?auto_96201 ?auto_96204 ) ) ( not ( = ?auto_96201 ?auto_96205 ) ) ( not ( = ?auto_96201 ?auto_96206 ) ) ( not ( = ?auto_96201 ?auto_96207 ) ) ( not ( = ?auto_96201 ?auto_96208 ) ) ( not ( = ?auto_96201 ?auto_96209 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( not ( = ?auto_96202 ?auto_96204 ) ) ( not ( = ?auto_96202 ?auto_96205 ) ) ( not ( = ?auto_96202 ?auto_96206 ) ) ( not ( = ?auto_96202 ?auto_96207 ) ) ( not ( = ?auto_96202 ?auto_96208 ) ) ( not ( = ?auto_96202 ?auto_96209 ) ) ( not ( = ?auto_96203 ?auto_96204 ) ) ( not ( = ?auto_96203 ?auto_96205 ) ) ( not ( = ?auto_96203 ?auto_96206 ) ) ( not ( = ?auto_96203 ?auto_96207 ) ) ( not ( = ?auto_96203 ?auto_96208 ) ) ( not ( = ?auto_96203 ?auto_96209 ) ) ( not ( = ?auto_96204 ?auto_96205 ) ) ( not ( = ?auto_96204 ?auto_96206 ) ) ( not ( = ?auto_96204 ?auto_96207 ) ) ( not ( = ?auto_96204 ?auto_96208 ) ) ( not ( = ?auto_96204 ?auto_96209 ) ) ( not ( = ?auto_96205 ?auto_96206 ) ) ( not ( = ?auto_96205 ?auto_96207 ) ) ( not ( = ?auto_96205 ?auto_96208 ) ) ( not ( = ?auto_96205 ?auto_96209 ) ) ( not ( = ?auto_96206 ?auto_96207 ) ) ( not ( = ?auto_96206 ?auto_96208 ) ) ( not ( = ?auto_96206 ?auto_96209 ) ) ( not ( = ?auto_96207 ?auto_96208 ) ) ( not ( = ?auto_96207 ?auto_96209 ) ) ( not ( = ?auto_96208 ?auto_96209 ) ) ( ON ?auto_96207 ?auto_96208 ) ( ON ?auto_96206 ?auto_96207 ) ( ON ?auto_96205 ?auto_96206 ) ( ON ?auto_96204 ?auto_96205 ) ( CLEAR ?auto_96202 ) ( ON ?auto_96203 ?auto_96204 ) ( CLEAR ?auto_96203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96200 ?auto_96201 ?auto_96202 ?auto_96203 )
      ( MAKE-9PILE ?auto_96200 ?auto_96201 ?auto_96202 ?auto_96203 ?auto_96204 ?auto_96205 ?auto_96206 ?auto_96207 ?auto_96208 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96238 - BLOCK
      ?auto_96239 - BLOCK
      ?auto_96240 - BLOCK
      ?auto_96241 - BLOCK
      ?auto_96242 - BLOCK
      ?auto_96243 - BLOCK
      ?auto_96244 - BLOCK
      ?auto_96245 - BLOCK
      ?auto_96246 - BLOCK
    )
    :vars
    (
      ?auto_96247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96246 ?auto_96247 ) ( ON-TABLE ?auto_96238 ) ( ON ?auto_96239 ?auto_96238 ) ( not ( = ?auto_96238 ?auto_96239 ) ) ( not ( = ?auto_96238 ?auto_96240 ) ) ( not ( = ?auto_96238 ?auto_96241 ) ) ( not ( = ?auto_96238 ?auto_96242 ) ) ( not ( = ?auto_96238 ?auto_96243 ) ) ( not ( = ?auto_96238 ?auto_96244 ) ) ( not ( = ?auto_96238 ?auto_96245 ) ) ( not ( = ?auto_96238 ?auto_96246 ) ) ( not ( = ?auto_96238 ?auto_96247 ) ) ( not ( = ?auto_96239 ?auto_96240 ) ) ( not ( = ?auto_96239 ?auto_96241 ) ) ( not ( = ?auto_96239 ?auto_96242 ) ) ( not ( = ?auto_96239 ?auto_96243 ) ) ( not ( = ?auto_96239 ?auto_96244 ) ) ( not ( = ?auto_96239 ?auto_96245 ) ) ( not ( = ?auto_96239 ?auto_96246 ) ) ( not ( = ?auto_96239 ?auto_96247 ) ) ( not ( = ?auto_96240 ?auto_96241 ) ) ( not ( = ?auto_96240 ?auto_96242 ) ) ( not ( = ?auto_96240 ?auto_96243 ) ) ( not ( = ?auto_96240 ?auto_96244 ) ) ( not ( = ?auto_96240 ?auto_96245 ) ) ( not ( = ?auto_96240 ?auto_96246 ) ) ( not ( = ?auto_96240 ?auto_96247 ) ) ( not ( = ?auto_96241 ?auto_96242 ) ) ( not ( = ?auto_96241 ?auto_96243 ) ) ( not ( = ?auto_96241 ?auto_96244 ) ) ( not ( = ?auto_96241 ?auto_96245 ) ) ( not ( = ?auto_96241 ?auto_96246 ) ) ( not ( = ?auto_96241 ?auto_96247 ) ) ( not ( = ?auto_96242 ?auto_96243 ) ) ( not ( = ?auto_96242 ?auto_96244 ) ) ( not ( = ?auto_96242 ?auto_96245 ) ) ( not ( = ?auto_96242 ?auto_96246 ) ) ( not ( = ?auto_96242 ?auto_96247 ) ) ( not ( = ?auto_96243 ?auto_96244 ) ) ( not ( = ?auto_96243 ?auto_96245 ) ) ( not ( = ?auto_96243 ?auto_96246 ) ) ( not ( = ?auto_96243 ?auto_96247 ) ) ( not ( = ?auto_96244 ?auto_96245 ) ) ( not ( = ?auto_96244 ?auto_96246 ) ) ( not ( = ?auto_96244 ?auto_96247 ) ) ( not ( = ?auto_96245 ?auto_96246 ) ) ( not ( = ?auto_96245 ?auto_96247 ) ) ( not ( = ?auto_96246 ?auto_96247 ) ) ( ON ?auto_96245 ?auto_96246 ) ( ON ?auto_96244 ?auto_96245 ) ( ON ?auto_96243 ?auto_96244 ) ( ON ?auto_96242 ?auto_96243 ) ( ON ?auto_96241 ?auto_96242 ) ( CLEAR ?auto_96239 ) ( ON ?auto_96240 ?auto_96241 ) ( CLEAR ?auto_96240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96238 ?auto_96239 ?auto_96240 )
      ( MAKE-9PILE ?auto_96238 ?auto_96239 ?auto_96240 ?auto_96241 ?auto_96242 ?auto_96243 ?auto_96244 ?auto_96245 ?auto_96246 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96276 - BLOCK
      ?auto_96277 - BLOCK
      ?auto_96278 - BLOCK
      ?auto_96279 - BLOCK
      ?auto_96280 - BLOCK
      ?auto_96281 - BLOCK
      ?auto_96282 - BLOCK
      ?auto_96283 - BLOCK
      ?auto_96284 - BLOCK
    )
    :vars
    (
      ?auto_96285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96284 ?auto_96285 ) ( ON-TABLE ?auto_96276 ) ( not ( = ?auto_96276 ?auto_96277 ) ) ( not ( = ?auto_96276 ?auto_96278 ) ) ( not ( = ?auto_96276 ?auto_96279 ) ) ( not ( = ?auto_96276 ?auto_96280 ) ) ( not ( = ?auto_96276 ?auto_96281 ) ) ( not ( = ?auto_96276 ?auto_96282 ) ) ( not ( = ?auto_96276 ?auto_96283 ) ) ( not ( = ?auto_96276 ?auto_96284 ) ) ( not ( = ?auto_96276 ?auto_96285 ) ) ( not ( = ?auto_96277 ?auto_96278 ) ) ( not ( = ?auto_96277 ?auto_96279 ) ) ( not ( = ?auto_96277 ?auto_96280 ) ) ( not ( = ?auto_96277 ?auto_96281 ) ) ( not ( = ?auto_96277 ?auto_96282 ) ) ( not ( = ?auto_96277 ?auto_96283 ) ) ( not ( = ?auto_96277 ?auto_96284 ) ) ( not ( = ?auto_96277 ?auto_96285 ) ) ( not ( = ?auto_96278 ?auto_96279 ) ) ( not ( = ?auto_96278 ?auto_96280 ) ) ( not ( = ?auto_96278 ?auto_96281 ) ) ( not ( = ?auto_96278 ?auto_96282 ) ) ( not ( = ?auto_96278 ?auto_96283 ) ) ( not ( = ?auto_96278 ?auto_96284 ) ) ( not ( = ?auto_96278 ?auto_96285 ) ) ( not ( = ?auto_96279 ?auto_96280 ) ) ( not ( = ?auto_96279 ?auto_96281 ) ) ( not ( = ?auto_96279 ?auto_96282 ) ) ( not ( = ?auto_96279 ?auto_96283 ) ) ( not ( = ?auto_96279 ?auto_96284 ) ) ( not ( = ?auto_96279 ?auto_96285 ) ) ( not ( = ?auto_96280 ?auto_96281 ) ) ( not ( = ?auto_96280 ?auto_96282 ) ) ( not ( = ?auto_96280 ?auto_96283 ) ) ( not ( = ?auto_96280 ?auto_96284 ) ) ( not ( = ?auto_96280 ?auto_96285 ) ) ( not ( = ?auto_96281 ?auto_96282 ) ) ( not ( = ?auto_96281 ?auto_96283 ) ) ( not ( = ?auto_96281 ?auto_96284 ) ) ( not ( = ?auto_96281 ?auto_96285 ) ) ( not ( = ?auto_96282 ?auto_96283 ) ) ( not ( = ?auto_96282 ?auto_96284 ) ) ( not ( = ?auto_96282 ?auto_96285 ) ) ( not ( = ?auto_96283 ?auto_96284 ) ) ( not ( = ?auto_96283 ?auto_96285 ) ) ( not ( = ?auto_96284 ?auto_96285 ) ) ( ON ?auto_96283 ?auto_96284 ) ( ON ?auto_96282 ?auto_96283 ) ( ON ?auto_96281 ?auto_96282 ) ( ON ?auto_96280 ?auto_96281 ) ( ON ?auto_96279 ?auto_96280 ) ( ON ?auto_96278 ?auto_96279 ) ( CLEAR ?auto_96276 ) ( ON ?auto_96277 ?auto_96278 ) ( CLEAR ?auto_96277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96276 ?auto_96277 )
      ( MAKE-9PILE ?auto_96276 ?auto_96277 ?auto_96278 ?auto_96279 ?auto_96280 ?auto_96281 ?auto_96282 ?auto_96283 ?auto_96284 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96314 - BLOCK
      ?auto_96315 - BLOCK
      ?auto_96316 - BLOCK
      ?auto_96317 - BLOCK
      ?auto_96318 - BLOCK
      ?auto_96319 - BLOCK
      ?auto_96320 - BLOCK
      ?auto_96321 - BLOCK
      ?auto_96322 - BLOCK
    )
    :vars
    (
      ?auto_96323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96322 ?auto_96323 ) ( not ( = ?auto_96314 ?auto_96315 ) ) ( not ( = ?auto_96314 ?auto_96316 ) ) ( not ( = ?auto_96314 ?auto_96317 ) ) ( not ( = ?auto_96314 ?auto_96318 ) ) ( not ( = ?auto_96314 ?auto_96319 ) ) ( not ( = ?auto_96314 ?auto_96320 ) ) ( not ( = ?auto_96314 ?auto_96321 ) ) ( not ( = ?auto_96314 ?auto_96322 ) ) ( not ( = ?auto_96314 ?auto_96323 ) ) ( not ( = ?auto_96315 ?auto_96316 ) ) ( not ( = ?auto_96315 ?auto_96317 ) ) ( not ( = ?auto_96315 ?auto_96318 ) ) ( not ( = ?auto_96315 ?auto_96319 ) ) ( not ( = ?auto_96315 ?auto_96320 ) ) ( not ( = ?auto_96315 ?auto_96321 ) ) ( not ( = ?auto_96315 ?auto_96322 ) ) ( not ( = ?auto_96315 ?auto_96323 ) ) ( not ( = ?auto_96316 ?auto_96317 ) ) ( not ( = ?auto_96316 ?auto_96318 ) ) ( not ( = ?auto_96316 ?auto_96319 ) ) ( not ( = ?auto_96316 ?auto_96320 ) ) ( not ( = ?auto_96316 ?auto_96321 ) ) ( not ( = ?auto_96316 ?auto_96322 ) ) ( not ( = ?auto_96316 ?auto_96323 ) ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( not ( = ?auto_96317 ?auto_96319 ) ) ( not ( = ?auto_96317 ?auto_96320 ) ) ( not ( = ?auto_96317 ?auto_96321 ) ) ( not ( = ?auto_96317 ?auto_96322 ) ) ( not ( = ?auto_96317 ?auto_96323 ) ) ( not ( = ?auto_96318 ?auto_96319 ) ) ( not ( = ?auto_96318 ?auto_96320 ) ) ( not ( = ?auto_96318 ?auto_96321 ) ) ( not ( = ?auto_96318 ?auto_96322 ) ) ( not ( = ?auto_96318 ?auto_96323 ) ) ( not ( = ?auto_96319 ?auto_96320 ) ) ( not ( = ?auto_96319 ?auto_96321 ) ) ( not ( = ?auto_96319 ?auto_96322 ) ) ( not ( = ?auto_96319 ?auto_96323 ) ) ( not ( = ?auto_96320 ?auto_96321 ) ) ( not ( = ?auto_96320 ?auto_96322 ) ) ( not ( = ?auto_96320 ?auto_96323 ) ) ( not ( = ?auto_96321 ?auto_96322 ) ) ( not ( = ?auto_96321 ?auto_96323 ) ) ( not ( = ?auto_96322 ?auto_96323 ) ) ( ON ?auto_96321 ?auto_96322 ) ( ON ?auto_96320 ?auto_96321 ) ( ON ?auto_96319 ?auto_96320 ) ( ON ?auto_96318 ?auto_96319 ) ( ON ?auto_96317 ?auto_96318 ) ( ON ?auto_96316 ?auto_96317 ) ( ON ?auto_96315 ?auto_96316 ) ( ON ?auto_96314 ?auto_96315 ) ( CLEAR ?auto_96314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96314 )
      ( MAKE-9PILE ?auto_96314 ?auto_96315 ?auto_96316 ?auto_96317 ?auto_96318 ?auto_96319 ?auto_96320 ?auto_96321 ?auto_96322 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96353 - BLOCK
      ?auto_96354 - BLOCK
      ?auto_96355 - BLOCK
      ?auto_96356 - BLOCK
      ?auto_96357 - BLOCK
      ?auto_96358 - BLOCK
      ?auto_96359 - BLOCK
      ?auto_96360 - BLOCK
      ?auto_96361 - BLOCK
      ?auto_96362 - BLOCK
    )
    :vars
    (
      ?auto_96363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96361 ) ( ON ?auto_96362 ?auto_96363 ) ( CLEAR ?auto_96362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96353 ) ( ON ?auto_96354 ?auto_96353 ) ( ON ?auto_96355 ?auto_96354 ) ( ON ?auto_96356 ?auto_96355 ) ( ON ?auto_96357 ?auto_96356 ) ( ON ?auto_96358 ?auto_96357 ) ( ON ?auto_96359 ?auto_96358 ) ( ON ?auto_96360 ?auto_96359 ) ( ON ?auto_96361 ?auto_96360 ) ( not ( = ?auto_96353 ?auto_96354 ) ) ( not ( = ?auto_96353 ?auto_96355 ) ) ( not ( = ?auto_96353 ?auto_96356 ) ) ( not ( = ?auto_96353 ?auto_96357 ) ) ( not ( = ?auto_96353 ?auto_96358 ) ) ( not ( = ?auto_96353 ?auto_96359 ) ) ( not ( = ?auto_96353 ?auto_96360 ) ) ( not ( = ?auto_96353 ?auto_96361 ) ) ( not ( = ?auto_96353 ?auto_96362 ) ) ( not ( = ?auto_96353 ?auto_96363 ) ) ( not ( = ?auto_96354 ?auto_96355 ) ) ( not ( = ?auto_96354 ?auto_96356 ) ) ( not ( = ?auto_96354 ?auto_96357 ) ) ( not ( = ?auto_96354 ?auto_96358 ) ) ( not ( = ?auto_96354 ?auto_96359 ) ) ( not ( = ?auto_96354 ?auto_96360 ) ) ( not ( = ?auto_96354 ?auto_96361 ) ) ( not ( = ?auto_96354 ?auto_96362 ) ) ( not ( = ?auto_96354 ?auto_96363 ) ) ( not ( = ?auto_96355 ?auto_96356 ) ) ( not ( = ?auto_96355 ?auto_96357 ) ) ( not ( = ?auto_96355 ?auto_96358 ) ) ( not ( = ?auto_96355 ?auto_96359 ) ) ( not ( = ?auto_96355 ?auto_96360 ) ) ( not ( = ?auto_96355 ?auto_96361 ) ) ( not ( = ?auto_96355 ?auto_96362 ) ) ( not ( = ?auto_96355 ?auto_96363 ) ) ( not ( = ?auto_96356 ?auto_96357 ) ) ( not ( = ?auto_96356 ?auto_96358 ) ) ( not ( = ?auto_96356 ?auto_96359 ) ) ( not ( = ?auto_96356 ?auto_96360 ) ) ( not ( = ?auto_96356 ?auto_96361 ) ) ( not ( = ?auto_96356 ?auto_96362 ) ) ( not ( = ?auto_96356 ?auto_96363 ) ) ( not ( = ?auto_96357 ?auto_96358 ) ) ( not ( = ?auto_96357 ?auto_96359 ) ) ( not ( = ?auto_96357 ?auto_96360 ) ) ( not ( = ?auto_96357 ?auto_96361 ) ) ( not ( = ?auto_96357 ?auto_96362 ) ) ( not ( = ?auto_96357 ?auto_96363 ) ) ( not ( = ?auto_96358 ?auto_96359 ) ) ( not ( = ?auto_96358 ?auto_96360 ) ) ( not ( = ?auto_96358 ?auto_96361 ) ) ( not ( = ?auto_96358 ?auto_96362 ) ) ( not ( = ?auto_96358 ?auto_96363 ) ) ( not ( = ?auto_96359 ?auto_96360 ) ) ( not ( = ?auto_96359 ?auto_96361 ) ) ( not ( = ?auto_96359 ?auto_96362 ) ) ( not ( = ?auto_96359 ?auto_96363 ) ) ( not ( = ?auto_96360 ?auto_96361 ) ) ( not ( = ?auto_96360 ?auto_96362 ) ) ( not ( = ?auto_96360 ?auto_96363 ) ) ( not ( = ?auto_96361 ?auto_96362 ) ) ( not ( = ?auto_96361 ?auto_96363 ) ) ( not ( = ?auto_96362 ?auto_96363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96362 ?auto_96363 )
      ( !STACK ?auto_96362 ?auto_96361 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96374 - BLOCK
      ?auto_96375 - BLOCK
      ?auto_96376 - BLOCK
      ?auto_96377 - BLOCK
      ?auto_96378 - BLOCK
      ?auto_96379 - BLOCK
      ?auto_96380 - BLOCK
      ?auto_96381 - BLOCK
      ?auto_96382 - BLOCK
      ?auto_96383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96382 ) ( ON-TABLE ?auto_96383 ) ( CLEAR ?auto_96383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96374 ) ( ON ?auto_96375 ?auto_96374 ) ( ON ?auto_96376 ?auto_96375 ) ( ON ?auto_96377 ?auto_96376 ) ( ON ?auto_96378 ?auto_96377 ) ( ON ?auto_96379 ?auto_96378 ) ( ON ?auto_96380 ?auto_96379 ) ( ON ?auto_96381 ?auto_96380 ) ( ON ?auto_96382 ?auto_96381 ) ( not ( = ?auto_96374 ?auto_96375 ) ) ( not ( = ?auto_96374 ?auto_96376 ) ) ( not ( = ?auto_96374 ?auto_96377 ) ) ( not ( = ?auto_96374 ?auto_96378 ) ) ( not ( = ?auto_96374 ?auto_96379 ) ) ( not ( = ?auto_96374 ?auto_96380 ) ) ( not ( = ?auto_96374 ?auto_96381 ) ) ( not ( = ?auto_96374 ?auto_96382 ) ) ( not ( = ?auto_96374 ?auto_96383 ) ) ( not ( = ?auto_96375 ?auto_96376 ) ) ( not ( = ?auto_96375 ?auto_96377 ) ) ( not ( = ?auto_96375 ?auto_96378 ) ) ( not ( = ?auto_96375 ?auto_96379 ) ) ( not ( = ?auto_96375 ?auto_96380 ) ) ( not ( = ?auto_96375 ?auto_96381 ) ) ( not ( = ?auto_96375 ?auto_96382 ) ) ( not ( = ?auto_96375 ?auto_96383 ) ) ( not ( = ?auto_96376 ?auto_96377 ) ) ( not ( = ?auto_96376 ?auto_96378 ) ) ( not ( = ?auto_96376 ?auto_96379 ) ) ( not ( = ?auto_96376 ?auto_96380 ) ) ( not ( = ?auto_96376 ?auto_96381 ) ) ( not ( = ?auto_96376 ?auto_96382 ) ) ( not ( = ?auto_96376 ?auto_96383 ) ) ( not ( = ?auto_96377 ?auto_96378 ) ) ( not ( = ?auto_96377 ?auto_96379 ) ) ( not ( = ?auto_96377 ?auto_96380 ) ) ( not ( = ?auto_96377 ?auto_96381 ) ) ( not ( = ?auto_96377 ?auto_96382 ) ) ( not ( = ?auto_96377 ?auto_96383 ) ) ( not ( = ?auto_96378 ?auto_96379 ) ) ( not ( = ?auto_96378 ?auto_96380 ) ) ( not ( = ?auto_96378 ?auto_96381 ) ) ( not ( = ?auto_96378 ?auto_96382 ) ) ( not ( = ?auto_96378 ?auto_96383 ) ) ( not ( = ?auto_96379 ?auto_96380 ) ) ( not ( = ?auto_96379 ?auto_96381 ) ) ( not ( = ?auto_96379 ?auto_96382 ) ) ( not ( = ?auto_96379 ?auto_96383 ) ) ( not ( = ?auto_96380 ?auto_96381 ) ) ( not ( = ?auto_96380 ?auto_96382 ) ) ( not ( = ?auto_96380 ?auto_96383 ) ) ( not ( = ?auto_96381 ?auto_96382 ) ) ( not ( = ?auto_96381 ?auto_96383 ) ) ( not ( = ?auto_96382 ?auto_96383 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_96383 )
      ( !STACK ?auto_96383 ?auto_96382 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96394 - BLOCK
      ?auto_96395 - BLOCK
      ?auto_96396 - BLOCK
      ?auto_96397 - BLOCK
      ?auto_96398 - BLOCK
      ?auto_96399 - BLOCK
      ?auto_96400 - BLOCK
      ?auto_96401 - BLOCK
      ?auto_96402 - BLOCK
      ?auto_96403 - BLOCK
    )
    :vars
    (
      ?auto_96404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96403 ?auto_96404 ) ( ON-TABLE ?auto_96394 ) ( ON ?auto_96395 ?auto_96394 ) ( ON ?auto_96396 ?auto_96395 ) ( ON ?auto_96397 ?auto_96396 ) ( ON ?auto_96398 ?auto_96397 ) ( ON ?auto_96399 ?auto_96398 ) ( ON ?auto_96400 ?auto_96399 ) ( ON ?auto_96401 ?auto_96400 ) ( not ( = ?auto_96394 ?auto_96395 ) ) ( not ( = ?auto_96394 ?auto_96396 ) ) ( not ( = ?auto_96394 ?auto_96397 ) ) ( not ( = ?auto_96394 ?auto_96398 ) ) ( not ( = ?auto_96394 ?auto_96399 ) ) ( not ( = ?auto_96394 ?auto_96400 ) ) ( not ( = ?auto_96394 ?auto_96401 ) ) ( not ( = ?auto_96394 ?auto_96402 ) ) ( not ( = ?auto_96394 ?auto_96403 ) ) ( not ( = ?auto_96394 ?auto_96404 ) ) ( not ( = ?auto_96395 ?auto_96396 ) ) ( not ( = ?auto_96395 ?auto_96397 ) ) ( not ( = ?auto_96395 ?auto_96398 ) ) ( not ( = ?auto_96395 ?auto_96399 ) ) ( not ( = ?auto_96395 ?auto_96400 ) ) ( not ( = ?auto_96395 ?auto_96401 ) ) ( not ( = ?auto_96395 ?auto_96402 ) ) ( not ( = ?auto_96395 ?auto_96403 ) ) ( not ( = ?auto_96395 ?auto_96404 ) ) ( not ( = ?auto_96396 ?auto_96397 ) ) ( not ( = ?auto_96396 ?auto_96398 ) ) ( not ( = ?auto_96396 ?auto_96399 ) ) ( not ( = ?auto_96396 ?auto_96400 ) ) ( not ( = ?auto_96396 ?auto_96401 ) ) ( not ( = ?auto_96396 ?auto_96402 ) ) ( not ( = ?auto_96396 ?auto_96403 ) ) ( not ( = ?auto_96396 ?auto_96404 ) ) ( not ( = ?auto_96397 ?auto_96398 ) ) ( not ( = ?auto_96397 ?auto_96399 ) ) ( not ( = ?auto_96397 ?auto_96400 ) ) ( not ( = ?auto_96397 ?auto_96401 ) ) ( not ( = ?auto_96397 ?auto_96402 ) ) ( not ( = ?auto_96397 ?auto_96403 ) ) ( not ( = ?auto_96397 ?auto_96404 ) ) ( not ( = ?auto_96398 ?auto_96399 ) ) ( not ( = ?auto_96398 ?auto_96400 ) ) ( not ( = ?auto_96398 ?auto_96401 ) ) ( not ( = ?auto_96398 ?auto_96402 ) ) ( not ( = ?auto_96398 ?auto_96403 ) ) ( not ( = ?auto_96398 ?auto_96404 ) ) ( not ( = ?auto_96399 ?auto_96400 ) ) ( not ( = ?auto_96399 ?auto_96401 ) ) ( not ( = ?auto_96399 ?auto_96402 ) ) ( not ( = ?auto_96399 ?auto_96403 ) ) ( not ( = ?auto_96399 ?auto_96404 ) ) ( not ( = ?auto_96400 ?auto_96401 ) ) ( not ( = ?auto_96400 ?auto_96402 ) ) ( not ( = ?auto_96400 ?auto_96403 ) ) ( not ( = ?auto_96400 ?auto_96404 ) ) ( not ( = ?auto_96401 ?auto_96402 ) ) ( not ( = ?auto_96401 ?auto_96403 ) ) ( not ( = ?auto_96401 ?auto_96404 ) ) ( not ( = ?auto_96402 ?auto_96403 ) ) ( not ( = ?auto_96402 ?auto_96404 ) ) ( not ( = ?auto_96403 ?auto_96404 ) ) ( CLEAR ?auto_96401 ) ( ON ?auto_96402 ?auto_96403 ) ( CLEAR ?auto_96402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_96394 ?auto_96395 ?auto_96396 ?auto_96397 ?auto_96398 ?auto_96399 ?auto_96400 ?auto_96401 ?auto_96402 )
      ( MAKE-10PILE ?auto_96394 ?auto_96395 ?auto_96396 ?auto_96397 ?auto_96398 ?auto_96399 ?auto_96400 ?auto_96401 ?auto_96402 ?auto_96403 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96415 - BLOCK
      ?auto_96416 - BLOCK
      ?auto_96417 - BLOCK
      ?auto_96418 - BLOCK
      ?auto_96419 - BLOCK
      ?auto_96420 - BLOCK
      ?auto_96421 - BLOCK
      ?auto_96422 - BLOCK
      ?auto_96423 - BLOCK
      ?auto_96424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96424 ) ( ON-TABLE ?auto_96415 ) ( ON ?auto_96416 ?auto_96415 ) ( ON ?auto_96417 ?auto_96416 ) ( ON ?auto_96418 ?auto_96417 ) ( ON ?auto_96419 ?auto_96418 ) ( ON ?auto_96420 ?auto_96419 ) ( ON ?auto_96421 ?auto_96420 ) ( ON ?auto_96422 ?auto_96421 ) ( not ( = ?auto_96415 ?auto_96416 ) ) ( not ( = ?auto_96415 ?auto_96417 ) ) ( not ( = ?auto_96415 ?auto_96418 ) ) ( not ( = ?auto_96415 ?auto_96419 ) ) ( not ( = ?auto_96415 ?auto_96420 ) ) ( not ( = ?auto_96415 ?auto_96421 ) ) ( not ( = ?auto_96415 ?auto_96422 ) ) ( not ( = ?auto_96415 ?auto_96423 ) ) ( not ( = ?auto_96415 ?auto_96424 ) ) ( not ( = ?auto_96416 ?auto_96417 ) ) ( not ( = ?auto_96416 ?auto_96418 ) ) ( not ( = ?auto_96416 ?auto_96419 ) ) ( not ( = ?auto_96416 ?auto_96420 ) ) ( not ( = ?auto_96416 ?auto_96421 ) ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( not ( = ?auto_96416 ?auto_96423 ) ) ( not ( = ?auto_96416 ?auto_96424 ) ) ( not ( = ?auto_96417 ?auto_96418 ) ) ( not ( = ?auto_96417 ?auto_96419 ) ) ( not ( = ?auto_96417 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96421 ) ) ( not ( = ?auto_96417 ?auto_96422 ) ) ( not ( = ?auto_96417 ?auto_96423 ) ) ( not ( = ?auto_96417 ?auto_96424 ) ) ( not ( = ?auto_96418 ?auto_96419 ) ) ( not ( = ?auto_96418 ?auto_96420 ) ) ( not ( = ?auto_96418 ?auto_96421 ) ) ( not ( = ?auto_96418 ?auto_96422 ) ) ( not ( = ?auto_96418 ?auto_96423 ) ) ( not ( = ?auto_96418 ?auto_96424 ) ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96421 ) ) ( not ( = ?auto_96419 ?auto_96422 ) ) ( not ( = ?auto_96419 ?auto_96423 ) ) ( not ( = ?auto_96419 ?auto_96424 ) ) ( not ( = ?auto_96420 ?auto_96421 ) ) ( not ( = ?auto_96420 ?auto_96422 ) ) ( not ( = ?auto_96420 ?auto_96423 ) ) ( not ( = ?auto_96420 ?auto_96424 ) ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) ( not ( = ?auto_96423 ?auto_96424 ) ) ( CLEAR ?auto_96422 ) ( ON ?auto_96423 ?auto_96424 ) ( CLEAR ?auto_96423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ?auto_96422 ?auto_96423 )
      ( MAKE-10PILE ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ?auto_96422 ?auto_96423 ?auto_96424 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96435 - BLOCK
      ?auto_96436 - BLOCK
      ?auto_96437 - BLOCK
      ?auto_96438 - BLOCK
      ?auto_96439 - BLOCK
      ?auto_96440 - BLOCK
      ?auto_96441 - BLOCK
      ?auto_96442 - BLOCK
      ?auto_96443 - BLOCK
      ?auto_96444 - BLOCK
    )
    :vars
    (
      ?auto_96445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96444 ?auto_96445 ) ( ON-TABLE ?auto_96435 ) ( ON ?auto_96436 ?auto_96435 ) ( ON ?auto_96437 ?auto_96436 ) ( ON ?auto_96438 ?auto_96437 ) ( ON ?auto_96439 ?auto_96438 ) ( ON ?auto_96440 ?auto_96439 ) ( ON ?auto_96441 ?auto_96440 ) ( not ( = ?auto_96435 ?auto_96436 ) ) ( not ( = ?auto_96435 ?auto_96437 ) ) ( not ( = ?auto_96435 ?auto_96438 ) ) ( not ( = ?auto_96435 ?auto_96439 ) ) ( not ( = ?auto_96435 ?auto_96440 ) ) ( not ( = ?auto_96435 ?auto_96441 ) ) ( not ( = ?auto_96435 ?auto_96442 ) ) ( not ( = ?auto_96435 ?auto_96443 ) ) ( not ( = ?auto_96435 ?auto_96444 ) ) ( not ( = ?auto_96435 ?auto_96445 ) ) ( not ( = ?auto_96436 ?auto_96437 ) ) ( not ( = ?auto_96436 ?auto_96438 ) ) ( not ( = ?auto_96436 ?auto_96439 ) ) ( not ( = ?auto_96436 ?auto_96440 ) ) ( not ( = ?auto_96436 ?auto_96441 ) ) ( not ( = ?auto_96436 ?auto_96442 ) ) ( not ( = ?auto_96436 ?auto_96443 ) ) ( not ( = ?auto_96436 ?auto_96444 ) ) ( not ( = ?auto_96436 ?auto_96445 ) ) ( not ( = ?auto_96437 ?auto_96438 ) ) ( not ( = ?auto_96437 ?auto_96439 ) ) ( not ( = ?auto_96437 ?auto_96440 ) ) ( not ( = ?auto_96437 ?auto_96441 ) ) ( not ( = ?auto_96437 ?auto_96442 ) ) ( not ( = ?auto_96437 ?auto_96443 ) ) ( not ( = ?auto_96437 ?auto_96444 ) ) ( not ( = ?auto_96437 ?auto_96445 ) ) ( not ( = ?auto_96438 ?auto_96439 ) ) ( not ( = ?auto_96438 ?auto_96440 ) ) ( not ( = ?auto_96438 ?auto_96441 ) ) ( not ( = ?auto_96438 ?auto_96442 ) ) ( not ( = ?auto_96438 ?auto_96443 ) ) ( not ( = ?auto_96438 ?auto_96444 ) ) ( not ( = ?auto_96438 ?auto_96445 ) ) ( not ( = ?auto_96439 ?auto_96440 ) ) ( not ( = ?auto_96439 ?auto_96441 ) ) ( not ( = ?auto_96439 ?auto_96442 ) ) ( not ( = ?auto_96439 ?auto_96443 ) ) ( not ( = ?auto_96439 ?auto_96444 ) ) ( not ( = ?auto_96439 ?auto_96445 ) ) ( not ( = ?auto_96440 ?auto_96441 ) ) ( not ( = ?auto_96440 ?auto_96442 ) ) ( not ( = ?auto_96440 ?auto_96443 ) ) ( not ( = ?auto_96440 ?auto_96444 ) ) ( not ( = ?auto_96440 ?auto_96445 ) ) ( not ( = ?auto_96441 ?auto_96442 ) ) ( not ( = ?auto_96441 ?auto_96443 ) ) ( not ( = ?auto_96441 ?auto_96444 ) ) ( not ( = ?auto_96441 ?auto_96445 ) ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96442 ?auto_96445 ) ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( not ( = ?auto_96443 ?auto_96445 ) ) ( not ( = ?auto_96444 ?auto_96445 ) ) ( ON ?auto_96443 ?auto_96444 ) ( CLEAR ?auto_96441 ) ( ON ?auto_96442 ?auto_96443 ) ( CLEAR ?auto_96442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96435 ?auto_96436 ?auto_96437 ?auto_96438 ?auto_96439 ?auto_96440 ?auto_96441 ?auto_96442 )
      ( MAKE-10PILE ?auto_96435 ?auto_96436 ?auto_96437 ?auto_96438 ?auto_96439 ?auto_96440 ?auto_96441 ?auto_96442 ?auto_96443 ?auto_96444 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96456 - BLOCK
      ?auto_96457 - BLOCK
      ?auto_96458 - BLOCK
      ?auto_96459 - BLOCK
      ?auto_96460 - BLOCK
      ?auto_96461 - BLOCK
      ?auto_96462 - BLOCK
      ?auto_96463 - BLOCK
      ?auto_96464 - BLOCK
      ?auto_96465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96465 ) ( ON-TABLE ?auto_96456 ) ( ON ?auto_96457 ?auto_96456 ) ( ON ?auto_96458 ?auto_96457 ) ( ON ?auto_96459 ?auto_96458 ) ( ON ?auto_96460 ?auto_96459 ) ( ON ?auto_96461 ?auto_96460 ) ( ON ?auto_96462 ?auto_96461 ) ( not ( = ?auto_96456 ?auto_96457 ) ) ( not ( = ?auto_96456 ?auto_96458 ) ) ( not ( = ?auto_96456 ?auto_96459 ) ) ( not ( = ?auto_96456 ?auto_96460 ) ) ( not ( = ?auto_96456 ?auto_96461 ) ) ( not ( = ?auto_96456 ?auto_96462 ) ) ( not ( = ?auto_96456 ?auto_96463 ) ) ( not ( = ?auto_96456 ?auto_96464 ) ) ( not ( = ?auto_96456 ?auto_96465 ) ) ( not ( = ?auto_96457 ?auto_96458 ) ) ( not ( = ?auto_96457 ?auto_96459 ) ) ( not ( = ?auto_96457 ?auto_96460 ) ) ( not ( = ?auto_96457 ?auto_96461 ) ) ( not ( = ?auto_96457 ?auto_96462 ) ) ( not ( = ?auto_96457 ?auto_96463 ) ) ( not ( = ?auto_96457 ?auto_96464 ) ) ( not ( = ?auto_96457 ?auto_96465 ) ) ( not ( = ?auto_96458 ?auto_96459 ) ) ( not ( = ?auto_96458 ?auto_96460 ) ) ( not ( = ?auto_96458 ?auto_96461 ) ) ( not ( = ?auto_96458 ?auto_96462 ) ) ( not ( = ?auto_96458 ?auto_96463 ) ) ( not ( = ?auto_96458 ?auto_96464 ) ) ( not ( = ?auto_96458 ?auto_96465 ) ) ( not ( = ?auto_96459 ?auto_96460 ) ) ( not ( = ?auto_96459 ?auto_96461 ) ) ( not ( = ?auto_96459 ?auto_96462 ) ) ( not ( = ?auto_96459 ?auto_96463 ) ) ( not ( = ?auto_96459 ?auto_96464 ) ) ( not ( = ?auto_96459 ?auto_96465 ) ) ( not ( = ?auto_96460 ?auto_96461 ) ) ( not ( = ?auto_96460 ?auto_96462 ) ) ( not ( = ?auto_96460 ?auto_96463 ) ) ( not ( = ?auto_96460 ?auto_96464 ) ) ( not ( = ?auto_96460 ?auto_96465 ) ) ( not ( = ?auto_96461 ?auto_96462 ) ) ( not ( = ?auto_96461 ?auto_96463 ) ) ( not ( = ?auto_96461 ?auto_96464 ) ) ( not ( = ?auto_96461 ?auto_96465 ) ) ( not ( = ?auto_96462 ?auto_96463 ) ) ( not ( = ?auto_96462 ?auto_96464 ) ) ( not ( = ?auto_96462 ?auto_96465 ) ) ( not ( = ?auto_96463 ?auto_96464 ) ) ( not ( = ?auto_96463 ?auto_96465 ) ) ( not ( = ?auto_96464 ?auto_96465 ) ) ( ON ?auto_96464 ?auto_96465 ) ( CLEAR ?auto_96462 ) ( ON ?auto_96463 ?auto_96464 ) ( CLEAR ?auto_96463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ?auto_96460 ?auto_96461 ?auto_96462 ?auto_96463 )
      ( MAKE-10PILE ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ?auto_96460 ?auto_96461 ?auto_96462 ?auto_96463 ?auto_96464 ?auto_96465 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96476 - BLOCK
      ?auto_96477 - BLOCK
      ?auto_96478 - BLOCK
      ?auto_96479 - BLOCK
      ?auto_96480 - BLOCK
      ?auto_96481 - BLOCK
      ?auto_96482 - BLOCK
      ?auto_96483 - BLOCK
      ?auto_96484 - BLOCK
      ?auto_96485 - BLOCK
    )
    :vars
    (
      ?auto_96486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96485 ?auto_96486 ) ( ON-TABLE ?auto_96476 ) ( ON ?auto_96477 ?auto_96476 ) ( ON ?auto_96478 ?auto_96477 ) ( ON ?auto_96479 ?auto_96478 ) ( ON ?auto_96480 ?auto_96479 ) ( ON ?auto_96481 ?auto_96480 ) ( not ( = ?auto_96476 ?auto_96477 ) ) ( not ( = ?auto_96476 ?auto_96478 ) ) ( not ( = ?auto_96476 ?auto_96479 ) ) ( not ( = ?auto_96476 ?auto_96480 ) ) ( not ( = ?auto_96476 ?auto_96481 ) ) ( not ( = ?auto_96476 ?auto_96482 ) ) ( not ( = ?auto_96476 ?auto_96483 ) ) ( not ( = ?auto_96476 ?auto_96484 ) ) ( not ( = ?auto_96476 ?auto_96485 ) ) ( not ( = ?auto_96476 ?auto_96486 ) ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96477 ?auto_96481 ) ) ( not ( = ?auto_96477 ?auto_96482 ) ) ( not ( = ?auto_96477 ?auto_96483 ) ) ( not ( = ?auto_96477 ?auto_96484 ) ) ( not ( = ?auto_96477 ?auto_96485 ) ) ( not ( = ?auto_96477 ?auto_96486 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96481 ) ) ( not ( = ?auto_96478 ?auto_96482 ) ) ( not ( = ?auto_96478 ?auto_96483 ) ) ( not ( = ?auto_96478 ?auto_96484 ) ) ( not ( = ?auto_96478 ?auto_96485 ) ) ( not ( = ?auto_96478 ?auto_96486 ) ) ( not ( = ?auto_96479 ?auto_96480 ) ) ( not ( = ?auto_96479 ?auto_96481 ) ) ( not ( = ?auto_96479 ?auto_96482 ) ) ( not ( = ?auto_96479 ?auto_96483 ) ) ( not ( = ?auto_96479 ?auto_96484 ) ) ( not ( = ?auto_96479 ?auto_96485 ) ) ( not ( = ?auto_96479 ?auto_96486 ) ) ( not ( = ?auto_96480 ?auto_96481 ) ) ( not ( = ?auto_96480 ?auto_96482 ) ) ( not ( = ?auto_96480 ?auto_96483 ) ) ( not ( = ?auto_96480 ?auto_96484 ) ) ( not ( = ?auto_96480 ?auto_96485 ) ) ( not ( = ?auto_96480 ?auto_96486 ) ) ( not ( = ?auto_96481 ?auto_96482 ) ) ( not ( = ?auto_96481 ?auto_96483 ) ) ( not ( = ?auto_96481 ?auto_96484 ) ) ( not ( = ?auto_96481 ?auto_96485 ) ) ( not ( = ?auto_96481 ?auto_96486 ) ) ( not ( = ?auto_96482 ?auto_96483 ) ) ( not ( = ?auto_96482 ?auto_96484 ) ) ( not ( = ?auto_96482 ?auto_96485 ) ) ( not ( = ?auto_96482 ?auto_96486 ) ) ( not ( = ?auto_96483 ?auto_96484 ) ) ( not ( = ?auto_96483 ?auto_96485 ) ) ( not ( = ?auto_96483 ?auto_96486 ) ) ( not ( = ?auto_96484 ?auto_96485 ) ) ( not ( = ?auto_96484 ?auto_96486 ) ) ( not ( = ?auto_96485 ?auto_96486 ) ) ( ON ?auto_96484 ?auto_96485 ) ( ON ?auto_96483 ?auto_96484 ) ( CLEAR ?auto_96481 ) ( ON ?auto_96482 ?auto_96483 ) ( CLEAR ?auto_96482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96476 ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ?auto_96481 ?auto_96482 )
      ( MAKE-10PILE ?auto_96476 ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ?auto_96481 ?auto_96482 ?auto_96483 ?auto_96484 ?auto_96485 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96497 - BLOCK
      ?auto_96498 - BLOCK
      ?auto_96499 - BLOCK
      ?auto_96500 - BLOCK
      ?auto_96501 - BLOCK
      ?auto_96502 - BLOCK
      ?auto_96503 - BLOCK
      ?auto_96504 - BLOCK
      ?auto_96505 - BLOCK
      ?auto_96506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96506 ) ( ON-TABLE ?auto_96497 ) ( ON ?auto_96498 ?auto_96497 ) ( ON ?auto_96499 ?auto_96498 ) ( ON ?auto_96500 ?auto_96499 ) ( ON ?auto_96501 ?auto_96500 ) ( ON ?auto_96502 ?auto_96501 ) ( not ( = ?auto_96497 ?auto_96498 ) ) ( not ( = ?auto_96497 ?auto_96499 ) ) ( not ( = ?auto_96497 ?auto_96500 ) ) ( not ( = ?auto_96497 ?auto_96501 ) ) ( not ( = ?auto_96497 ?auto_96502 ) ) ( not ( = ?auto_96497 ?auto_96503 ) ) ( not ( = ?auto_96497 ?auto_96504 ) ) ( not ( = ?auto_96497 ?auto_96505 ) ) ( not ( = ?auto_96497 ?auto_96506 ) ) ( not ( = ?auto_96498 ?auto_96499 ) ) ( not ( = ?auto_96498 ?auto_96500 ) ) ( not ( = ?auto_96498 ?auto_96501 ) ) ( not ( = ?auto_96498 ?auto_96502 ) ) ( not ( = ?auto_96498 ?auto_96503 ) ) ( not ( = ?auto_96498 ?auto_96504 ) ) ( not ( = ?auto_96498 ?auto_96505 ) ) ( not ( = ?auto_96498 ?auto_96506 ) ) ( not ( = ?auto_96499 ?auto_96500 ) ) ( not ( = ?auto_96499 ?auto_96501 ) ) ( not ( = ?auto_96499 ?auto_96502 ) ) ( not ( = ?auto_96499 ?auto_96503 ) ) ( not ( = ?auto_96499 ?auto_96504 ) ) ( not ( = ?auto_96499 ?auto_96505 ) ) ( not ( = ?auto_96499 ?auto_96506 ) ) ( not ( = ?auto_96500 ?auto_96501 ) ) ( not ( = ?auto_96500 ?auto_96502 ) ) ( not ( = ?auto_96500 ?auto_96503 ) ) ( not ( = ?auto_96500 ?auto_96504 ) ) ( not ( = ?auto_96500 ?auto_96505 ) ) ( not ( = ?auto_96500 ?auto_96506 ) ) ( not ( = ?auto_96501 ?auto_96502 ) ) ( not ( = ?auto_96501 ?auto_96503 ) ) ( not ( = ?auto_96501 ?auto_96504 ) ) ( not ( = ?auto_96501 ?auto_96505 ) ) ( not ( = ?auto_96501 ?auto_96506 ) ) ( not ( = ?auto_96502 ?auto_96503 ) ) ( not ( = ?auto_96502 ?auto_96504 ) ) ( not ( = ?auto_96502 ?auto_96505 ) ) ( not ( = ?auto_96502 ?auto_96506 ) ) ( not ( = ?auto_96503 ?auto_96504 ) ) ( not ( = ?auto_96503 ?auto_96505 ) ) ( not ( = ?auto_96503 ?auto_96506 ) ) ( not ( = ?auto_96504 ?auto_96505 ) ) ( not ( = ?auto_96504 ?auto_96506 ) ) ( not ( = ?auto_96505 ?auto_96506 ) ) ( ON ?auto_96505 ?auto_96506 ) ( ON ?auto_96504 ?auto_96505 ) ( CLEAR ?auto_96502 ) ( ON ?auto_96503 ?auto_96504 ) ( CLEAR ?auto_96503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96497 ?auto_96498 ?auto_96499 ?auto_96500 ?auto_96501 ?auto_96502 ?auto_96503 )
      ( MAKE-10PILE ?auto_96497 ?auto_96498 ?auto_96499 ?auto_96500 ?auto_96501 ?auto_96502 ?auto_96503 ?auto_96504 ?auto_96505 ?auto_96506 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96517 - BLOCK
      ?auto_96518 - BLOCK
      ?auto_96519 - BLOCK
      ?auto_96520 - BLOCK
      ?auto_96521 - BLOCK
      ?auto_96522 - BLOCK
      ?auto_96523 - BLOCK
      ?auto_96524 - BLOCK
      ?auto_96525 - BLOCK
      ?auto_96526 - BLOCK
    )
    :vars
    (
      ?auto_96527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96526 ?auto_96527 ) ( ON-TABLE ?auto_96517 ) ( ON ?auto_96518 ?auto_96517 ) ( ON ?auto_96519 ?auto_96518 ) ( ON ?auto_96520 ?auto_96519 ) ( ON ?auto_96521 ?auto_96520 ) ( not ( = ?auto_96517 ?auto_96518 ) ) ( not ( = ?auto_96517 ?auto_96519 ) ) ( not ( = ?auto_96517 ?auto_96520 ) ) ( not ( = ?auto_96517 ?auto_96521 ) ) ( not ( = ?auto_96517 ?auto_96522 ) ) ( not ( = ?auto_96517 ?auto_96523 ) ) ( not ( = ?auto_96517 ?auto_96524 ) ) ( not ( = ?auto_96517 ?auto_96525 ) ) ( not ( = ?auto_96517 ?auto_96526 ) ) ( not ( = ?auto_96517 ?auto_96527 ) ) ( not ( = ?auto_96518 ?auto_96519 ) ) ( not ( = ?auto_96518 ?auto_96520 ) ) ( not ( = ?auto_96518 ?auto_96521 ) ) ( not ( = ?auto_96518 ?auto_96522 ) ) ( not ( = ?auto_96518 ?auto_96523 ) ) ( not ( = ?auto_96518 ?auto_96524 ) ) ( not ( = ?auto_96518 ?auto_96525 ) ) ( not ( = ?auto_96518 ?auto_96526 ) ) ( not ( = ?auto_96518 ?auto_96527 ) ) ( not ( = ?auto_96519 ?auto_96520 ) ) ( not ( = ?auto_96519 ?auto_96521 ) ) ( not ( = ?auto_96519 ?auto_96522 ) ) ( not ( = ?auto_96519 ?auto_96523 ) ) ( not ( = ?auto_96519 ?auto_96524 ) ) ( not ( = ?auto_96519 ?auto_96525 ) ) ( not ( = ?auto_96519 ?auto_96526 ) ) ( not ( = ?auto_96519 ?auto_96527 ) ) ( not ( = ?auto_96520 ?auto_96521 ) ) ( not ( = ?auto_96520 ?auto_96522 ) ) ( not ( = ?auto_96520 ?auto_96523 ) ) ( not ( = ?auto_96520 ?auto_96524 ) ) ( not ( = ?auto_96520 ?auto_96525 ) ) ( not ( = ?auto_96520 ?auto_96526 ) ) ( not ( = ?auto_96520 ?auto_96527 ) ) ( not ( = ?auto_96521 ?auto_96522 ) ) ( not ( = ?auto_96521 ?auto_96523 ) ) ( not ( = ?auto_96521 ?auto_96524 ) ) ( not ( = ?auto_96521 ?auto_96525 ) ) ( not ( = ?auto_96521 ?auto_96526 ) ) ( not ( = ?auto_96521 ?auto_96527 ) ) ( not ( = ?auto_96522 ?auto_96523 ) ) ( not ( = ?auto_96522 ?auto_96524 ) ) ( not ( = ?auto_96522 ?auto_96525 ) ) ( not ( = ?auto_96522 ?auto_96526 ) ) ( not ( = ?auto_96522 ?auto_96527 ) ) ( not ( = ?auto_96523 ?auto_96524 ) ) ( not ( = ?auto_96523 ?auto_96525 ) ) ( not ( = ?auto_96523 ?auto_96526 ) ) ( not ( = ?auto_96523 ?auto_96527 ) ) ( not ( = ?auto_96524 ?auto_96525 ) ) ( not ( = ?auto_96524 ?auto_96526 ) ) ( not ( = ?auto_96524 ?auto_96527 ) ) ( not ( = ?auto_96525 ?auto_96526 ) ) ( not ( = ?auto_96525 ?auto_96527 ) ) ( not ( = ?auto_96526 ?auto_96527 ) ) ( ON ?auto_96525 ?auto_96526 ) ( ON ?auto_96524 ?auto_96525 ) ( ON ?auto_96523 ?auto_96524 ) ( CLEAR ?auto_96521 ) ( ON ?auto_96522 ?auto_96523 ) ( CLEAR ?auto_96522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96517 ?auto_96518 ?auto_96519 ?auto_96520 ?auto_96521 ?auto_96522 )
      ( MAKE-10PILE ?auto_96517 ?auto_96518 ?auto_96519 ?auto_96520 ?auto_96521 ?auto_96522 ?auto_96523 ?auto_96524 ?auto_96525 ?auto_96526 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96538 - BLOCK
      ?auto_96539 - BLOCK
      ?auto_96540 - BLOCK
      ?auto_96541 - BLOCK
      ?auto_96542 - BLOCK
      ?auto_96543 - BLOCK
      ?auto_96544 - BLOCK
      ?auto_96545 - BLOCK
      ?auto_96546 - BLOCK
      ?auto_96547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96547 ) ( ON-TABLE ?auto_96538 ) ( ON ?auto_96539 ?auto_96538 ) ( ON ?auto_96540 ?auto_96539 ) ( ON ?auto_96541 ?auto_96540 ) ( ON ?auto_96542 ?auto_96541 ) ( not ( = ?auto_96538 ?auto_96539 ) ) ( not ( = ?auto_96538 ?auto_96540 ) ) ( not ( = ?auto_96538 ?auto_96541 ) ) ( not ( = ?auto_96538 ?auto_96542 ) ) ( not ( = ?auto_96538 ?auto_96543 ) ) ( not ( = ?auto_96538 ?auto_96544 ) ) ( not ( = ?auto_96538 ?auto_96545 ) ) ( not ( = ?auto_96538 ?auto_96546 ) ) ( not ( = ?auto_96538 ?auto_96547 ) ) ( not ( = ?auto_96539 ?auto_96540 ) ) ( not ( = ?auto_96539 ?auto_96541 ) ) ( not ( = ?auto_96539 ?auto_96542 ) ) ( not ( = ?auto_96539 ?auto_96543 ) ) ( not ( = ?auto_96539 ?auto_96544 ) ) ( not ( = ?auto_96539 ?auto_96545 ) ) ( not ( = ?auto_96539 ?auto_96546 ) ) ( not ( = ?auto_96539 ?auto_96547 ) ) ( not ( = ?auto_96540 ?auto_96541 ) ) ( not ( = ?auto_96540 ?auto_96542 ) ) ( not ( = ?auto_96540 ?auto_96543 ) ) ( not ( = ?auto_96540 ?auto_96544 ) ) ( not ( = ?auto_96540 ?auto_96545 ) ) ( not ( = ?auto_96540 ?auto_96546 ) ) ( not ( = ?auto_96540 ?auto_96547 ) ) ( not ( = ?auto_96541 ?auto_96542 ) ) ( not ( = ?auto_96541 ?auto_96543 ) ) ( not ( = ?auto_96541 ?auto_96544 ) ) ( not ( = ?auto_96541 ?auto_96545 ) ) ( not ( = ?auto_96541 ?auto_96546 ) ) ( not ( = ?auto_96541 ?auto_96547 ) ) ( not ( = ?auto_96542 ?auto_96543 ) ) ( not ( = ?auto_96542 ?auto_96544 ) ) ( not ( = ?auto_96542 ?auto_96545 ) ) ( not ( = ?auto_96542 ?auto_96546 ) ) ( not ( = ?auto_96542 ?auto_96547 ) ) ( not ( = ?auto_96543 ?auto_96544 ) ) ( not ( = ?auto_96543 ?auto_96545 ) ) ( not ( = ?auto_96543 ?auto_96546 ) ) ( not ( = ?auto_96543 ?auto_96547 ) ) ( not ( = ?auto_96544 ?auto_96545 ) ) ( not ( = ?auto_96544 ?auto_96546 ) ) ( not ( = ?auto_96544 ?auto_96547 ) ) ( not ( = ?auto_96545 ?auto_96546 ) ) ( not ( = ?auto_96545 ?auto_96547 ) ) ( not ( = ?auto_96546 ?auto_96547 ) ) ( ON ?auto_96546 ?auto_96547 ) ( ON ?auto_96545 ?auto_96546 ) ( ON ?auto_96544 ?auto_96545 ) ( CLEAR ?auto_96542 ) ( ON ?auto_96543 ?auto_96544 ) ( CLEAR ?auto_96543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 )
      ( MAKE-10PILE ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 ?auto_96544 ?auto_96545 ?auto_96546 ?auto_96547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96558 - BLOCK
      ?auto_96559 - BLOCK
      ?auto_96560 - BLOCK
      ?auto_96561 - BLOCK
      ?auto_96562 - BLOCK
      ?auto_96563 - BLOCK
      ?auto_96564 - BLOCK
      ?auto_96565 - BLOCK
      ?auto_96566 - BLOCK
      ?auto_96567 - BLOCK
    )
    :vars
    (
      ?auto_96568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96567 ?auto_96568 ) ( ON-TABLE ?auto_96558 ) ( ON ?auto_96559 ?auto_96558 ) ( ON ?auto_96560 ?auto_96559 ) ( ON ?auto_96561 ?auto_96560 ) ( not ( = ?auto_96558 ?auto_96559 ) ) ( not ( = ?auto_96558 ?auto_96560 ) ) ( not ( = ?auto_96558 ?auto_96561 ) ) ( not ( = ?auto_96558 ?auto_96562 ) ) ( not ( = ?auto_96558 ?auto_96563 ) ) ( not ( = ?auto_96558 ?auto_96564 ) ) ( not ( = ?auto_96558 ?auto_96565 ) ) ( not ( = ?auto_96558 ?auto_96566 ) ) ( not ( = ?auto_96558 ?auto_96567 ) ) ( not ( = ?auto_96558 ?auto_96568 ) ) ( not ( = ?auto_96559 ?auto_96560 ) ) ( not ( = ?auto_96559 ?auto_96561 ) ) ( not ( = ?auto_96559 ?auto_96562 ) ) ( not ( = ?auto_96559 ?auto_96563 ) ) ( not ( = ?auto_96559 ?auto_96564 ) ) ( not ( = ?auto_96559 ?auto_96565 ) ) ( not ( = ?auto_96559 ?auto_96566 ) ) ( not ( = ?auto_96559 ?auto_96567 ) ) ( not ( = ?auto_96559 ?auto_96568 ) ) ( not ( = ?auto_96560 ?auto_96561 ) ) ( not ( = ?auto_96560 ?auto_96562 ) ) ( not ( = ?auto_96560 ?auto_96563 ) ) ( not ( = ?auto_96560 ?auto_96564 ) ) ( not ( = ?auto_96560 ?auto_96565 ) ) ( not ( = ?auto_96560 ?auto_96566 ) ) ( not ( = ?auto_96560 ?auto_96567 ) ) ( not ( = ?auto_96560 ?auto_96568 ) ) ( not ( = ?auto_96561 ?auto_96562 ) ) ( not ( = ?auto_96561 ?auto_96563 ) ) ( not ( = ?auto_96561 ?auto_96564 ) ) ( not ( = ?auto_96561 ?auto_96565 ) ) ( not ( = ?auto_96561 ?auto_96566 ) ) ( not ( = ?auto_96561 ?auto_96567 ) ) ( not ( = ?auto_96561 ?auto_96568 ) ) ( not ( = ?auto_96562 ?auto_96563 ) ) ( not ( = ?auto_96562 ?auto_96564 ) ) ( not ( = ?auto_96562 ?auto_96565 ) ) ( not ( = ?auto_96562 ?auto_96566 ) ) ( not ( = ?auto_96562 ?auto_96567 ) ) ( not ( = ?auto_96562 ?auto_96568 ) ) ( not ( = ?auto_96563 ?auto_96564 ) ) ( not ( = ?auto_96563 ?auto_96565 ) ) ( not ( = ?auto_96563 ?auto_96566 ) ) ( not ( = ?auto_96563 ?auto_96567 ) ) ( not ( = ?auto_96563 ?auto_96568 ) ) ( not ( = ?auto_96564 ?auto_96565 ) ) ( not ( = ?auto_96564 ?auto_96566 ) ) ( not ( = ?auto_96564 ?auto_96567 ) ) ( not ( = ?auto_96564 ?auto_96568 ) ) ( not ( = ?auto_96565 ?auto_96566 ) ) ( not ( = ?auto_96565 ?auto_96567 ) ) ( not ( = ?auto_96565 ?auto_96568 ) ) ( not ( = ?auto_96566 ?auto_96567 ) ) ( not ( = ?auto_96566 ?auto_96568 ) ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( ON ?auto_96566 ?auto_96567 ) ( ON ?auto_96565 ?auto_96566 ) ( ON ?auto_96564 ?auto_96565 ) ( ON ?auto_96563 ?auto_96564 ) ( CLEAR ?auto_96561 ) ( ON ?auto_96562 ?auto_96563 ) ( CLEAR ?auto_96562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96558 ?auto_96559 ?auto_96560 ?auto_96561 ?auto_96562 )
      ( MAKE-10PILE ?auto_96558 ?auto_96559 ?auto_96560 ?auto_96561 ?auto_96562 ?auto_96563 ?auto_96564 ?auto_96565 ?auto_96566 ?auto_96567 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96579 - BLOCK
      ?auto_96580 - BLOCK
      ?auto_96581 - BLOCK
      ?auto_96582 - BLOCK
      ?auto_96583 - BLOCK
      ?auto_96584 - BLOCK
      ?auto_96585 - BLOCK
      ?auto_96586 - BLOCK
      ?auto_96587 - BLOCK
      ?auto_96588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96588 ) ( ON-TABLE ?auto_96579 ) ( ON ?auto_96580 ?auto_96579 ) ( ON ?auto_96581 ?auto_96580 ) ( ON ?auto_96582 ?auto_96581 ) ( not ( = ?auto_96579 ?auto_96580 ) ) ( not ( = ?auto_96579 ?auto_96581 ) ) ( not ( = ?auto_96579 ?auto_96582 ) ) ( not ( = ?auto_96579 ?auto_96583 ) ) ( not ( = ?auto_96579 ?auto_96584 ) ) ( not ( = ?auto_96579 ?auto_96585 ) ) ( not ( = ?auto_96579 ?auto_96586 ) ) ( not ( = ?auto_96579 ?auto_96587 ) ) ( not ( = ?auto_96579 ?auto_96588 ) ) ( not ( = ?auto_96580 ?auto_96581 ) ) ( not ( = ?auto_96580 ?auto_96582 ) ) ( not ( = ?auto_96580 ?auto_96583 ) ) ( not ( = ?auto_96580 ?auto_96584 ) ) ( not ( = ?auto_96580 ?auto_96585 ) ) ( not ( = ?auto_96580 ?auto_96586 ) ) ( not ( = ?auto_96580 ?auto_96587 ) ) ( not ( = ?auto_96580 ?auto_96588 ) ) ( not ( = ?auto_96581 ?auto_96582 ) ) ( not ( = ?auto_96581 ?auto_96583 ) ) ( not ( = ?auto_96581 ?auto_96584 ) ) ( not ( = ?auto_96581 ?auto_96585 ) ) ( not ( = ?auto_96581 ?auto_96586 ) ) ( not ( = ?auto_96581 ?auto_96587 ) ) ( not ( = ?auto_96581 ?auto_96588 ) ) ( not ( = ?auto_96582 ?auto_96583 ) ) ( not ( = ?auto_96582 ?auto_96584 ) ) ( not ( = ?auto_96582 ?auto_96585 ) ) ( not ( = ?auto_96582 ?auto_96586 ) ) ( not ( = ?auto_96582 ?auto_96587 ) ) ( not ( = ?auto_96582 ?auto_96588 ) ) ( not ( = ?auto_96583 ?auto_96584 ) ) ( not ( = ?auto_96583 ?auto_96585 ) ) ( not ( = ?auto_96583 ?auto_96586 ) ) ( not ( = ?auto_96583 ?auto_96587 ) ) ( not ( = ?auto_96583 ?auto_96588 ) ) ( not ( = ?auto_96584 ?auto_96585 ) ) ( not ( = ?auto_96584 ?auto_96586 ) ) ( not ( = ?auto_96584 ?auto_96587 ) ) ( not ( = ?auto_96584 ?auto_96588 ) ) ( not ( = ?auto_96585 ?auto_96586 ) ) ( not ( = ?auto_96585 ?auto_96587 ) ) ( not ( = ?auto_96585 ?auto_96588 ) ) ( not ( = ?auto_96586 ?auto_96587 ) ) ( not ( = ?auto_96586 ?auto_96588 ) ) ( not ( = ?auto_96587 ?auto_96588 ) ) ( ON ?auto_96587 ?auto_96588 ) ( ON ?auto_96586 ?auto_96587 ) ( ON ?auto_96585 ?auto_96586 ) ( ON ?auto_96584 ?auto_96585 ) ( CLEAR ?auto_96582 ) ( ON ?auto_96583 ?auto_96584 ) ( CLEAR ?auto_96583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ?auto_96583 )
      ( MAKE-10PILE ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ?auto_96583 ?auto_96584 ?auto_96585 ?auto_96586 ?auto_96587 ?auto_96588 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96599 - BLOCK
      ?auto_96600 - BLOCK
      ?auto_96601 - BLOCK
      ?auto_96602 - BLOCK
      ?auto_96603 - BLOCK
      ?auto_96604 - BLOCK
      ?auto_96605 - BLOCK
      ?auto_96606 - BLOCK
      ?auto_96607 - BLOCK
      ?auto_96608 - BLOCK
    )
    :vars
    (
      ?auto_96609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96608 ?auto_96609 ) ( ON-TABLE ?auto_96599 ) ( ON ?auto_96600 ?auto_96599 ) ( ON ?auto_96601 ?auto_96600 ) ( not ( = ?auto_96599 ?auto_96600 ) ) ( not ( = ?auto_96599 ?auto_96601 ) ) ( not ( = ?auto_96599 ?auto_96602 ) ) ( not ( = ?auto_96599 ?auto_96603 ) ) ( not ( = ?auto_96599 ?auto_96604 ) ) ( not ( = ?auto_96599 ?auto_96605 ) ) ( not ( = ?auto_96599 ?auto_96606 ) ) ( not ( = ?auto_96599 ?auto_96607 ) ) ( not ( = ?auto_96599 ?auto_96608 ) ) ( not ( = ?auto_96599 ?auto_96609 ) ) ( not ( = ?auto_96600 ?auto_96601 ) ) ( not ( = ?auto_96600 ?auto_96602 ) ) ( not ( = ?auto_96600 ?auto_96603 ) ) ( not ( = ?auto_96600 ?auto_96604 ) ) ( not ( = ?auto_96600 ?auto_96605 ) ) ( not ( = ?auto_96600 ?auto_96606 ) ) ( not ( = ?auto_96600 ?auto_96607 ) ) ( not ( = ?auto_96600 ?auto_96608 ) ) ( not ( = ?auto_96600 ?auto_96609 ) ) ( not ( = ?auto_96601 ?auto_96602 ) ) ( not ( = ?auto_96601 ?auto_96603 ) ) ( not ( = ?auto_96601 ?auto_96604 ) ) ( not ( = ?auto_96601 ?auto_96605 ) ) ( not ( = ?auto_96601 ?auto_96606 ) ) ( not ( = ?auto_96601 ?auto_96607 ) ) ( not ( = ?auto_96601 ?auto_96608 ) ) ( not ( = ?auto_96601 ?auto_96609 ) ) ( not ( = ?auto_96602 ?auto_96603 ) ) ( not ( = ?auto_96602 ?auto_96604 ) ) ( not ( = ?auto_96602 ?auto_96605 ) ) ( not ( = ?auto_96602 ?auto_96606 ) ) ( not ( = ?auto_96602 ?auto_96607 ) ) ( not ( = ?auto_96602 ?auto_96608 ) ) ( not ( = ?auto_96602 ?auto_96609 ) ) ( not ( = ?auto_96603 ?auto_96604 ) ) ( not ( = ?auto_96603 ?auto_96605 ) ) ( not ( = ?auto_96603 ?auto_96606 ) ) ( not ( = ?auto_96603 ?auto_96607 ) ) ( not ( = ?auto_96603 ?auto_96608 ) ) ( not ( = ?auto_96603 ?auto_96609 ) ) ( not ( = ?auto_96604 ?auto_96605 ) ) ( not ( = ?auto_96604 ?auto_96606 ) ) ( not ( = ?auto_96604 ?auto_96607 ) ) ( not ( = ?auto_96604 ?auto_96608 ) ) ( not ( = ?auto_96604 ?auto_96609 ) ) ( not ( = ?auto_96605 ?auto_96606 ) ) ( not ( = ?auto_96605 ?auto_96607 ) ) ( not ( = ?auto_96605 ?auto_96608 ) ) ( not ( = ?auto_96605 ?auto_96609 ) ) ( not ( = ?auto_96606 ?auto_96607 ) ) ( not ( = ?auto_96606 ?auto_96608 ) ) ( not ( = ?auto_96606 ?auto_96609 ) ) ( not ( = ?auto_96607 ?auto_96608 ) ) ( not ( = ?auto_96607 ?auto_96609 ) ) ( not ( = ?auto_96608 ?auto_96609 ) ) ( ON ?auto_96607 ?auto_96608 ) ( ON ?auto_96606 ?auto_96607 ) ( ON ?auto_96605 ?auto_96606 ) ( ON ?auto_96604 ?auto_96605 ) ( ON ?auto_96603 ?auto_96604 ) ( CLEAR ?auto_96601 ) ( ON ?auto_96602 ?auto_96603 ) ( CLEAR ?auto_96602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96599 ?auto_96600 ?auto_96601 ?auto_96602 )
      ( MAKE-10PILE ?auto_96599 ?auto_96600 ?auto_96601 ?auto_96602 ?auto_96603 ?auto_96604 ?auto_96605 ?auto_96606 ?auto_96607 ?auto_96608 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96620 - BLOCK
      ?auto_96621 - BLOCK
      ?auto_96622 - BLOCK
      ?auto_96623 - BLOCK
      ?auto_96624 - BLOCK
      ?auto_96625 - BLOCK
      ?auto_96626 - BLOCK
      ?auto_96627 - BLOCK
      ?auto_96628 - BLOCK
      ?auto_96629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96629 ) ( ON-TABLE ?auto_96620 ) ( ON ?auto_96621 ?auto_96620 ) ( ON ?auto_96622 ?auto_96621 ) ( not ( = ?auto_96620 ?auto_96621 ) ) ( not ( = ?auto_96620 ?auto_96622 ) ) ( not ( = ?auto_96620 ?auto_96623 ) ) ( not ( = ?auto_96620 ?auto_96624 ) ) ( not ( = ?auto_96620 ?auto_96625 ) ) ( not ( = ?auto_96620 ?auto_96626 ) ) ( not ( = ?auto_96620 ?auto_96627 ) ) ( not ( = ?auto_96620 ?auto_96628 ) ) ( not ( = ?auto_96620 ?auto_96629 ) ) ( not ( = ?auto_96621 ?auto_96622 ) ) ( not ( = ?auto_96621 ?auto_96623 ) ) ( not ( = ?auto_96621 ?auto_96624 ) ) ( not ( = ?auto_96621 ?auto_96625 ) ) ( not ( = ?auto_96621 ?auto_96626 ) ) ( not ( = ?auto_96621 ?auto_96627 ) ) ( not ( = ?auto_96621 ?auto_96628 ) ) ( not ( = ?auto_96621 ?auto_96629 ) ) ( not ( = ?auto_96622 ?auto_96623 ) ) ( not ( = ?auto_96622 ?auto_96624 ) ) ( not ( = ?auto_96622 ?auto_96625 ) ) ( not ( = ?auto_96622 ?auto_96626 ) ) ( not ( = ?auto_96622 ?auto_96627 ) ) ( not ( = ?auto_96622 ?auto_96628 ) ) ( not ( = ?auto_96622 ?auto_96629 ) ) ( not ( = ?auto_96623 ?auto_96624 ) ) ( not ( = ?auto_96623 ?auto_96625 ) ) ( not ( = ?auto_96623 ?auto_96626 ) ) ( not ( = ?auto_96623 ?auto_96627 ) ) ( not ( = ?auto_96623 ?auto_96628 ) ) ( not ( = ?auto_96623 ?auto_96629 ) ) ( not ( = ?auto_96624 ?auto_96625 ) ) ( not ( = ?auto_96624 ?auto_96626 ) ) ( not ( = ?auto_96624 ?auto_96627 ) ) ( not ( = ?auto_96624 ?auto_96628 ) ) ( not ( = ?auto_96624 ?auto_96629 ) ) ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96625 ?auto_96629 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96629 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96629 ) ) ( not ( = ?auto_96628 ?auto_96629 ) ) ( ON ?auto_96628 ?auto_96629 ) ( ON ?auto_96627 ?auto_96628 ) ( ON ?auto_96626 ?auto_96627 ) ( ON ?auto_96625 ?auto_96626 ) ( ON ?auto_96624 ?auto_96625 ) ( CLEAR ?auto_96622 ) ( ON ?auto_96623 ?auto_96624 ) ( CLEAR ?auto_96623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96620 ?auto_96621 ?auto_96622 ?auto_96623 )
      ( MAKE-10PILE ?auto_96620 ?auto_96621 ?auto_96622 ?auto_96623 ?auto_96624 ?auto_96625 ?auto_96626 ?auto_96627 ?auto_96628 ?auto_96629 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96640 - BLOCK
      ?auto_96641 - BLOCK
      ?auto_96642 - BLOCK
      ?auto_96643 - BLOCK
      ?auto_96644 - BLOCK
      ?auto_96645 - BLOCK
      ?auto_96646 - BLOCK
      ?auto_96647 - BLOCK
      ?auto_96648 - BLOCK
      ?auto_96649 - BLOCK
    )
    :vars
    (
      ?auto_96650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96649 ?auto_96650 ) ( ON-TABLE ?auto_96640 ) ( ON ?auto_96641 ?auto_96640 ) ( not ( = ?auto_96640 ?auto_96641 ) ) ( not ( = ?auto_96640 ?auto_96642 ) ) ( not ( = ?auto_96640 ?auto_96643 ) ) ( not ( = ?auto_96640 ?auto_96644 ) ) ( not ( = ?auto_96640 ?auto_96645 ) ) ( not ( = ?auto_96640 ?auto_96646 ) ) ( not ( = ?auto_96640 ?auto_96647 ) ) ( not ( = ?auto_96640 ?auto_96648 ) ) ( not ( = ?auto_96640 ?auto_96649 ) ) ( not ( = ?auto_96640 ?auto_96650 ) ) ( not ( = ?auto_96641 ?auto_96642 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96644 ) ) ( not ( = ?auto_96641 ?auto_96645 ) ) ( not ( = ?auto_96641 ?auto_96646 ) ) ( not ( = ?auto_96641 ?auto_96647 ) ) ( not ( = ?auto_96641 ?auto_96648 ) ) ( not ( = ?auto_96641 ?auto_96649 ) ) ( not ( = ?auto_96641 ?auto_96650 ) ) ( not ( = ?auto_96642 ?auto_96643 ) ) ( not ( = ?auto_96642 ?auto_96644 ) ) ( not ( = ?auto_96642 ?auto_96645 ) ) ( not ( = ?auto_96642 ?auto_96646 ) ) ( not ( = ?auto_96642 ?auto_96647 ) ) ( not ( = ?auto_96642 ?auto_96648 ) ) ( not ( = ?auto_96642 ?auto_96649 ) ) ( not ( = ?auto_96642 ?auto_96650 ) ) ( not ( = ?auto_96643 ?auto_96644 ) ) ( not ( = ?auto_96643 ?auto_96645 ) ) ( not ( = ?auto_96643 ?auto_96646 ) ) ( not ( = ?auto_96643 ?auto_96647 ) ) ( not ( = ?auto_96643 ?auto_96648 ) ) ( not ( = ?auto_96643 ?auto_96649 ) ) ( not ( = ?auto_96643 ?auto_96650 ) ) ( not ( = ?auto_96644 ?auto_96645 ) ) ( not ( = ?auto_96644 ?auto_96646 ) ) ( not ( = ?auto_96644 ?auto_96647 ) ) ( not ( = ?auto_96644 ?auto_96648 ) ) ( not ( = ?auto_96644 ?auto_96649 ) ) ( not ( = ?auto_96644 ?auto_96650 ) ) ( not ( = ?auto_96645 ?auto_96646 ) ) ( not ( = ?auto_96645 ?auto_96647 ) ) ( not ( = ?auto_96645 ?auto_96648 ) ) ( not ( = ?auto_96645 ?auto_96649 ) ) ( not ( = ?auto_96645 ?auto_96650 ) ) ( not ( = ?auto_96646 ?auto_96647 ) ) ( not ( = ?auto_96646 ?auto_96648 ) ) ( not ( = ?auto_96646 ?auto_96649 ) ) ( not ( = ?auto_96646 ?auto_96650 ) ) ( not ( = ?auto_96647 ?auto_96648 ) ) ( not ( = ?auto_96647 ?auto_96649 ) ) ( not ( = ?auto_96647 ?auto_96650 ) ) ( not ( = ?auto_96648 ?auto_96649 ) ) ( not ( = ?auto_96648 ?auto_96650 ) ) ( not ( = ?auto_96649 ?auto_96650 ) ) ( ON ?auto_96648 ?auto_96649 ) ( ON ?auto_96647 ?auto_96648 ) ( ON ?auto_96646 ?auto_96647 ) ( ON ?auto_96645 ?auto_96646 ) ( ON ?auto_96644 ?auto_96645 ) ( ON ?auto_96643 ?auto_96644 ) ( CLEAR ?auto_96641 ) ( ON ?auto_96642 ?auto_96643 ) ( CLEAR ?auto_96642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96640 ?auto_96641 ?auto_96642 )
      ( MAKE-10PILE ?auto_96640 ?auto_96641 ?auto_96642 ?auto_96643 ?auto_96644 ?auto_96645 ?auto_96646 ?auto_96647 ?auto_96648 ?auto_96649 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96661 - BLOCK
      ?auto_96662 - BLOCK
      ?auto_96663 - BLOCK
      ?auto_96664 - BLOCK
      ?auto_96665 - BLOCK
      ?auto_96666 - BLOCK
      ?auto_96667 - BLOCK
      ?auto_96668 - BLOCK
      ?auto_96669 - BLOCK
      ?auto_96670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96670 ) ( ON-TABLE ?auto_96661 ) ( ON ?auto_96662 ?auto_96661 ) ( not ( = ?auto_96661 ?auto_96662 ) ) ( not ( = ?auto_96661 ?auto_96663 ) ) ( not ( = ?auto_96661 ?auto_96664 ) ) ( not ( = ?auto_96661 ?auto_96665 ) ) ( not ( = ?auto_96661 ?auto_96666 ) ) ( not ( = ?auto_96661 ?auto_96667 ) ) ( not ( = ?auto_96661 ?auto_96668 ) ) ( not ( = ?auto_96661 ?auto_96669 ) ) ( not ( = ?auto_96661 ?auto_96670 ) ) ( not ( = ?auto_96662 ?auto_96663 ) ) ( not ( = ?auto_96662 ?auto_96664 ) ) ( not ( = ?auto_96662 ?auto_96665 ) ) ( not ( = ?auto_96662 ?auto_96666 ) ) ( not ( = ?auto_96662 ?auto_96667 ) ) ( not ( = ?auto_96662 ?auto_96668 ) ) ( not ( = ?auto_96662 ?auto_96669 ) ) ( not ( = ?auto_96662 ?auto_96670 ) ) ( not ( = ?auto_96663 ?auto_96664 ) ) ( not ( = ?auto_96663 ?auto_96665 ) ) ( not ( = ?auto_96663 ?auto_96666 ) ) ( not ( = ?auto_96663 ?auto_96667 ) ) ( not ( = ?auto_96663 ?auto_96668 ) ) ( not ( = ?auto_96663 ?auto_96669 ) ) ( not ( = ?auto_96663 ?auto_96670 ) ) ( not ( = ?auto_96664 ?auto_96665 ) ) ( not ( = ?auto_96664 ?auto_96666 ) ) ( not ( = ?auto_96664 ?auto_96667 ) ) ( not ( = ?auto_96664 ?auto_96668 ) ) ( not ( = ?auto_96664 ?auto_96669 ) ) ( not ( = ?auto_96664 ?auto_96670 ) ) ( not ( = ?auto_96665 ?auto_96666 ) ) ( not ( = ?auto_96665 ?auto_96667 ) ) ( not ( = ?auto_96665 ?auto_96668 ) ) ( not ( = ?auto_96665 ?auto_96669 ) ) ( not ( = ?auto_96665 ?auto_96670 ) ) ( not ( = ?auto_96666 ?auto_96667 ) ) ( not ( = ?auto_96666 ?auto_96668 ) ) ( not ( = ?auto_96666 ?auto_96669 ) ) ( not ( = ?auto_96666 ?auto_96670 ) ) ( not ( = ?auto_96667 ?auto_96668 ) ) ( not ( = ?auto_96667 ?auto_96669 ) ) ( not ( = ?auto_96667 ?auto_96670 ) ) ( not ( = ?auto_96668 ?auto_96669 ) ) ( not ( = ?auto_96668 ?auto_96670 ) ) ( not ( = ?auto_96669 ?auto_96670 ) ) ( ON ?auto_96669 ?auto_96670 ) ( ON ?auto_96668 ?auto_96669 ) ( ON ?auto_96667 ?auto_96668 ) ( ON ?auto_96666 ?auto_96667 ) ( ON ?auto_96665 ?auto_96666 ) ( ON ?auto_96664 ?auto_96665 ) ( CLEAR ?auto_96662 ) ( ON ?auto_96663 ?auto_96664 ) ( CLEAR ?auto_96663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96661 ?auto_96662 ?auto_96663 )
      ( MAKE-10PILE ?auto_96661 ?auto_96662 ?auto_96663 ?auto_96664 ?auto_96665 ?auto_96666 ?auto_96667 ?auto_96668 ?auto_96669 ?auto_96670 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96681 - BLOCK
      ?auto_96682 - BLOCK
      ?auto_96683 - BLOCK
      ?auto_96684 - BLOCK
      ?auto_96685 - BLOCK
      ?auto_96686 - BLOCK
      ?auto_96687 - BLOCK
      ?auto_96688 - BLOCK
      ?auto_96689 - BLOCK
      ?auto_96690 - BLOCK
    )
    :vars
    (
      ?auto_96691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96690 ?auto_96691 ) ( ON-TABLE ?auto_96681 ) ( not ( = ?auto_96681 ?auto_96682 ) ) ( not ( = ?auto_96681 ?auto_96683 ) ) ( not ( = ?auto_96681 ?auto_96684 ) ) ( not ( = ?auto_96681 ?auto_96685 ) ) ( not ( = ?auto_96681 ?auto_96686 ) ) ( not ( = ?auto_96681 ?auto_96687 ) ) ( not ( = ?auto_96681 ?auto_96688 ) ) ( not ( = ?auto_96681 ?auto_96689 ) ) ( not ( = ?auto_96681 ?auto_96690 ) ) ( not ( = ?auto_96681 ?auto_96691 ) ) ( not ( = ?auto_96682 ?auto_96683 ) ) ( not ( = ?auto_96682 ?auto_96684 ) ) ( not ( = ?auto_96682 ?auto_96685 ) ) ( not ( = ?auto_96682 ?auto_96686 ) ) ( not ( = ?auto_96682 ?auto_96687 ) ) ( not ( = ?auto_96682 ?auto_96688 ) ) ( not ( = ?auto_96682 ?auto_96689 ) ) ( not ( = ?auto_96682 ?auto_96690 ) ) ( not ( = ?auto_96682 ?auto_96691 ) ) ( not ( = ?auto_96683 ?auto_96684 ) ) ( not ( = ?auto_96683 ?auto_96685 ) ) ( not ( = ?auto_96683 ?auto_96686 ) ) ( not ( = ?auto_96683 ?auto_96687 ) ) ( not ( = ?auto_96683 ?auto_96688 ) ) ( not ( = ?auto_96683 ?auto_96689 ) ) ( not ( = ?auto_96683 ?auto_96690 ) ) ( not ( = ?auto_96683 ?auto_96691 ) ) ( not ( = ?auto_96684 ?auto_96685 ) ) ( not ( = ?auto_96684 ?auto_96686 ) ) ( not ( = ?auto_96684 ?auto_96687 ) ) ( not ( = ?auto_96684 ?auto_96688 ) ) ( not ( = ?auto_96684 ?auto_96689 ) ) ( not ( = ?auto_96684 ?auto_96690 ) ) ( not ( = ?auto_96684 ?auto_96691 ) ) ( not ( = ?auto_96685 ?auto_96686 ) ) ( not ( = ?auto_96685 ?auto_96687 ) ) ( not ( = ?auto_96685 ?auto_96688 ) ) ( not ( = ?auto_96685 ?auto_96689 ) ) ( not ( = ?auto_96685 ?auto_96690 ) ) ( not ( = ?auto_96685 ?auto_96691 ) ) ( not ( = ?auto_96686 ?auto_96687 ) ) ( not ( = ?auto_96686 ?auto_96688 ) ) ( not ( = ?auto_96686 ?auto_96689 ) ) ( not ( = ?auto_96686 ?auto_96690 ) ) ( not ( = ?auto_96686 ?auto_96691 ) ) ( not ( = ?auto_96687 ?auto_96688 ) ) ( not ( = ?auto_96687 ?auto_96689 ) ) ( not ( = ?auto_96687 ?auto_96690 ) ) ( not ( = ?auto_96687 ?auto_96691 ) ) ( not ( = ?auto_96688 ?auto_96689 ) ) ( not ( = ?auto_96688 ?auto_96690 ) ) ( not ( = ?auto_96688 ?auto_96691 ) ) ( not ( = ?auto_96689 ?auto_96690 ) ) ( not ( = ?auto_96689 ?auto_96691 ) ) ( not ( = ?auto_96690 ?auto_96691 ) ) ( ON ?auto_96689 ?auto_96690 ) ( ON ?auto_96688 ?auto_96689 ) ( ON ?auto_96687 ?auto_96688 ) ( ON ?auto_96686 ?auto_96687 ) ( ON ?auto_96685 ?auto_96686 ) ( ON ?auto_96684 ?auto_96685 ) ( ON ?auto_96683 ?auto_96684 ) ( CLEAR ?auto_96681 ) ( ON ?auto_96682 ?auto_96683 ) ( CLEAR ?auto_96682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96681 ?auto_96682 )
      ( MAKE-10PILE ?auto_96681 ?auto_96682 ?auto_96683 ?auto_96684 ?auto_96685 ?auto_96686 ?auto_96687 ?auto_96688 ?auto_96689 ?auto_96690 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96702 - BLOCK
      ?auto_96703 - BLOCK
      ?auto_96704 - BLOCK
      ?auto_96705 - BLOCK
      ?auto_96706 - BLOCK
      ?auto_96707 - BLOCK
      ?auto_96708 - BLOCK
      ?auto_96709 - BLOCK
      ?auto_96710 - BLOCK
      ?auto_96711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96711 ) ( ON-TABLE ?auto_96702 ) ( not ( = ?auto_96702 ?auto_96703 ) ) ( not ( = ?auto_96702 ?auto_96704 ) ) ( not ( = ?auto_96702 ?auto_96705 ) ) ( not ( = ?auto_96702 ?auto_96706 ) ) ( not ( = ?auto_96702 ?auto_96707 ) ) ( not ( = ?auto_96702 ?auto_96708 ) ) ( not ( = ?auto_96702 ?auto_96709 ) ) ( not ( = ?auto_96702 ?auto_96710 ) ) ( not ( = ?auto_96702 ?auto_96711 ) ) ( not ( = ?auto_96703 ?auto_96704 ) ) ( not ( = ?auto_96703 ?auto_96705 ) ) ( not ( = ?auto_96703 ?auto_96706 ) ) ( not ( = ?auto_96703 ?auto_96707 ) ) ( not ( = ?auto_96703 ?auto_96708 ) ) ( not ( = ?auto_96703 ?auto_96709 ) ) ( not ( = ?auto_96703 ?auto_96710 ) ) ( not ( = ?auto_96703 ?auto_96711 ) ) ( not ( = ?auto_96704 ?auto_96705 ) ) ( not ( = ?auto_96704 ?auto_96706 ) ) ( not ( = ?auto_96704 ?auto_96707 ) ) ( not ( = ?auto_96704 ?auto_96708 ) ) ( not ( = ?auto_96704 ?auto_96709 ) ) ( not ( = ?auto_96704 ?auto_96710 ) ) ( not ( = ?auto_96704 ?auto_96711 ) ) ( not ( = ?auto_96705 ?auto_96706 ) ) ( not ( = ?auto_96705 ?auto_96707 ) ) ( not ( = ?auto_96705 ?auto_96708 ) ) ( not ( = ?auto_96705 ?auto_96709 ) ) ( not ( = ?auto_96705 ?auto_96710 ) ) ( not ( = ?auto_96705 ?auto_96711 ) ) ( not ( = ?auto_96706 ?auto_96707 ) ) ( not ( = ?auto_96706 ?auto_96708 ) ) ( not ( = ?auto_96706 ?auto_96709 ) ) ( not ( = ?auto_96706 ?auto_96710 ) ) ( not ( = ?auto_96706 ?auto_96711 ) ) ( not ( = ?auto_96707 ?auto_96708 ) ) ( not ( = ?auto_96707 ?auto_96709 ) ) ( not ( = ?auto_96707 ?auto_96710 ) ) ( not ( = ?auto_96707 ?auto_96711 ) ) ( not ( = ?auto_96708 ?auto_96709 ) ) ( not ( = ?auto_96708 ?auto_96710 ) ) ( not ( = ?auto_96708 ?auto_96711 ) ) ( not ( = ?auto_96709 ?auto_96710 ) ) ( not ( = ?auto_96709 ?auto_96711 ) ) ( not ( = ?auto_96710 ?auto_96711 ) ) ( ON ?auto_96710 ?auto_96711 ) ( ON ?auto_96709 ?auto_96710 ) ( ON ?auto_96708 ?auto_96709 ) ( ON ?auto_96707 ?auto_96708 ) ( ON ?auto_96706 ?auto_96707 ) ( ON ?auto_96705 ?auto_96706 ) ( ON ?auto_96704 ?auto_96705 ) ( CLEAR ?auto_96702 ) ( ON ?auto_96703 ?auto_96704 ) ( CLEAR ?auto_96703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96702 ?auto_96703 )
      ( MAKE-10PILE ?auto_96702 ?auto_96703 ?auto_96704 ?auto_96705 ?auto_96706 ?auto_96707 ?auto_96708 ?auto_96709 ?auto_96710 ?auto_96711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96722 - BLOCK
      ?auto_96723 - BLOCK
      ?auto_96724 - BLOCK
      ?auto_96725 - BLOCK
      ?auto_96726 - BLOCK
      ?auto_96727 - BLOCK
      ?auto_96728 - BLOCK
      ?auto_96729 - BLOCK
      ?auto_96730 - BLOCK
      ?auto_96731 - BLOCK
    )
    :vars
    (
      ?auto_96732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96731 ?auto_96732 ) ( not ( = ?auto_96722 ?auto_96723 ) ) ( not ( = ?auto_96722 ?auto_96724 ) ) ( not ( = ?auto_96722 ?auto_96725 ) ) ( not ( = ?auto_96722 ?auto_96726 ) ) ( not ( = ?auto_96722 ?auto_96727 ) ) ( not ( = ?auto_96722 ?auto_96728 ) ) ( not ( = ?auto_96722 ?auto_96729 ) ) ( not ( = ?auto_96722 ?auto_96730 ) ) ( not ( = ?auto_96722 ?auto_96731 ) ) ( not ( = ?auto_96722 ?auto_96732 ) ) ( not ( = ?auto_96723 ?auto_96724 ) ) ( not ( = ?auto_96723 ?auto_96725 ) ) ( not ( = ?auto_96723 ?auto_96726 ) ) ( not ( = ?auto_96723 ?auto_96727 ) ) ( not ( = ?auto_96723 ?auto_96728 ) ) ( not ( = ?auto_96723 ?auto_96729 ) ) ( not ( = ?auto_96723 ?auto_96730 ) ) ( not ( = ?auto_96723 ?auto_96731 ) ) ( not ( = ?auto_96723 ?auto_96732 ) ) ( not ( = ?auto_96724 ?auto_96725 ) ) ( not ( = ?auto_96724 ?auto_96726 ) ) ( not ( = ?auto_96724 ?auto_96727 ) ) ( not ( = ?auto_96724 ?auto_96728 ) ) ( not ( = ?auto_96724 ?auto_96729 ) ) ( not ( = ?auto_96724 ?auto_96730 ) ) ( not ( = ?auto_96724 ?auto_96731 ) ) ( not ( = ?auto_96724 ?auto_96732 ) ) ( not ( = ?auto_96725 ?auto_96726 ) ) ( not ( = ?auto_96725 ?auto_96727 ) ) ( not ( = ?auto_96725 ?auto_96728 ) ) ( not ( = ?auto_96725 ?auto_96729 ) ) ( not ( = ?auto_96725 ?auto_96730 ) ) ( not ( = ?auto_96725 ?auto_96731 ) ) ( not ( = ?auto_96725 ?auto_96732 ) ) ( not ( = ?auto_96726 ?auto_96727 ) ) ( not ( = ?auto_96726 ?auto_96728 ) ) ( not ( = ?auto_96726 ?auto_96729 ) ) ( not ( = ?auto_96726 ?auto_96730 ) ) ( not ( = ?auto_96726 ?auto_96731 ) ) ( not ( = ?auto_96726 ?auto_96732 ) ) ( not ( = ?auto_96727 ?auto_96728 ) ) ( not ( = ?auto_96727 ?auto_96729 ) ) ( not ( = ?auto_96727 ?auto_96730 ) ) ( not ( = ?auto_96727 ?auto_96731 ) ) ( not ( = ?auto_96727 ?auto_96732 ) ) ( not ( = ?auto_96728 ?auto_96729 ) ) ( not ( = ?auto_96728 ?auto_96730 ) ) ( not ( = ?auto_96728 ?auto_96731 ) ) ( not ( = ?auto_96728 ?auto_96732 ) ) ( not ( = ?auto_96729 ?auto_96730 ) ) ( not ( = ?auto_96729 ?auto_96731 ) ) ( not ( = ?auto_96729 ?auto_96732 ) ) ( not ( = ?auto_96730 ?auto_96731 ) ) ( not ( = ?auto_96730 ?auto_96732 ) ) ( not ( = ?auto_96731 ?auto_96732 ) ) ( ON ?auto_96730 ?auto_96731 ) ( ON ?auto_96729 ?auto_96730 ) ( ON ?auto_96728 ?auto_96729 ) ( ON ?auto_96727 ?auto_96728 ) ( ON ?auto_96726 ?auto_96727 ) ( ON ?auto_96725 ?auto_96726 ) ( ON ?auto_96724 ?auto_96725 ) ( ON ?auto_96723 ?auto_96724 ) ( ON ?auto_96722 ?auto_96723 ) ( CLEAR ?auto_96722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96722 )
      ( MAKE-10PILE ?auto_96722 ?auto_96723 ?auto_96724 ?auto_96725 ?auto_96726 ?auto_96727 ?auto_96728 ?auto_96729 ?auto_96730 ?auto_96731 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96743 - BLOCK
      ?auto_96744 - BLOCK
      ?auto_96745 - BLOCK
      ?auto_96746 - BLOCK
      ?auto_96747 - BLOCK
      ?auto_96748 - BLOCK
      ?auto_96749 - BLOCK
      ?auto_96750 - BLOCK
      ?auto_96751 - BLOCK
      ?auto_96752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96752 ) ( not ( = ?auto_96743 ?auto_96744 ) ) ( not ( = ?auto_96743 ?auto_96745 ) ) ( not ( = ?auto_96743 ?auto_96746 ) ) ( not ( = ?auto_96743 ?auto_96747 ) ) ( not ( = ?auto_96743 ?auto_96748 ) ) ( not ( = ?auto_96743 ?auto_96749 ) ) ( not ( = ?auto_96743 ?auto_96750 ) ) ( not ( = ?auto_96743 ?auto_96751 ) ) ( not ( = ?auto_96743 ?auto_96752 ) ) ( not ( = ?auto_96744 ?auto_96745 ) ) ( not ( = ?auto_96744 ?auto_96746 ) ) ( not ( = ?auto_96744 ?auto_96747 ) ) ( not ( = ?auto_96744 ?auto_96748 ) ) ( not ( = ?auto_96744 ?auto_96749 ) ) ( not ( = ?auto_96744 ?auto_96750 ) ) ( not ( = ?auto_96744 ?auto_96751 ) ) ( not ( = ?auto_96744 ?auto_96752 ) ) ( not ( = ?auto_96745 ?auto_96746 ) ) ( not ( = ?auto_96745 ?auto_96747 ) ) ( not ( = ?auto_96745 ?auto_96748 ) ) ( not ( = ?auto_96745 ?auto_96749 ) ) ( not ( = ?auto_96745 ?auto_96750 ) ) ( not ( = ?auto_96745 ?auto_96751 ) ) ( not ( = ?auto_96745 ?auto_96752 ) ) ( not ( = ?auto_96746 ?auto_96747 ) ) ( not ( = ?auto_96746 ?auto_96748 ) ) ( not ( = ?auto_96746 ?auto_96749 ) ) ( not ( = ?auto_96746 ?auto_96750 ) ) ( not ( = ?auto_96746 ?auto_96751 ) ) ( not ( = ?auto_96746 ?auto_96752 ) ) ( not ( = ?auto_96747 ?auto_96748 ) ) ( not ( = ?auto_96747 ?auto_96749 ) ) ( not ( = ?auto_96747 ?auto_96750 ) ) ( not ( = ?auto_96747 ?auto_96751 ) ) ( not ( = ?auto_96747 ?auto_96752 ) ) ( not ( = ?auto_96748 ?auto_96749 ) ) ( not ( = ?auto_96748 ?auto_96750 ) ) ( not ( = ?auto_96748 ?auto_96751 ) ) ( not ( = ?auto_96748 ?auto_96752 ) ) ( not ( = ?auto_96749 ?auto_96750 ) ) ( not ( = ?auto_96749 ?auto_96751 ) ) ( not ( = ?auto_96749 ?auto_96752 ) ) ( not ( = ?auto_96750 ?auto_96751 ) ) ( not ( = ?auto_96750 ?auto_96752 ) ) ( not ( = ?auto_96751 ?auto_96752 ) ) ( ON ?auto_96751 ?auto_96752 ) ( ON ?auto_96750 ?auto_96751 ) ( ON ?auto_96749 ?auto_96750 ) ( ON ?auto_96748 ?auto_96749 ) ( ON ?auto_96747 ?auto_96748 ) ( ON ?auto_96746 ?auto_96747 ) ( ON ?auto_96745 ?auto_96746 ) ( ON ?auto_96744 ?auto_96745 ) ( ON ?auto_96743 ?auto_96744 ) ( CLEAR ?auto_96743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96743 )
      ( MAKE-10PILE ?auto_96743 ?auto_96744 ?auto_96745 ?auto_96746 ?auto_96747 ?auto_96748 ?auto_96749 ?auto_96750 ?auto_96751 ?auto_96752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96763 - BLOCK
      ?auto_96764 - BLOCK
      ?auto_96765 - BLOCK
      ?auto_96766 - BLOCK
      ?auto_96767 - BLOCK
      ?auto_96768 - BLOCK
      ?auto_96769 - BLOCK
      ?auto_96770 - BLOCK
      ?auto_96771 - BLOCK
      ?auto_96772 - BLOCK
    )
    :vars
    (
      ?auto_96773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96763 ?auto_96764 ) ) ( not ( = ?auto_96763 ?auto_96765 ) ) ( not ( = ?auto_96763 ?auto_96766 ) ) ( not ( = ?auto_96763 ?auto_96767 ) ) ( not ( = ?auto_96763 ?auto_96768 ) ) ( not ( = ?auto_96763 ?auto_96769 ) ) ( not ( = ?auto_96763 ?auto_96770 ) ) ( not ( = ?auto_96763 ?auto_96771 ) ) ( not ( = ?auto_96763 ?auto_96772 ) ) ( not ( = ?auto_96764 ?auto_96765 ) ) ( not ( = ?auto_96764 ?auto_96766 ) ) ( not ( = ?auto_96764 ?auto_96767 ) ) ( not ( = ?auto_96764 ?auto_96768 ) ) ( not ( = ?auto_96764 ?auto_96769 ) ) ( not ( = ?auto_96764 ?auto_96770 ) ) ( not ( = ?auto_96764 ?auto_96771 ) ) ( not ( = ?auto_96764 ?auto_96772 ) ) ( not ( = ?auto_96765 ?auto_96766 ) ) ( not ( = ?auto_96765 ?auto_96767 ) ) ( not ( = ?auto_96765 ?auto_96768 ) ) ( not ( = ?auto_96765 ?auto_96769 ) ) ( not ( = ?auto_96765 ?auto_96770 ) ) ( not ( = ?auto_96765 ?auto_96771 ) ) ( not ( = ?auto_96765 ?auto_96772 ) ) ( not ( = ?auto_96766 ?auto_96767 ) ) ( not ( = ?auto_96766 ?auto_96768 ) ) ( not ( = ?auto_96766 ?auto_96769 ) ) ( not ( = ?auto_96766 ?auto_96770 ) ) ( not ( = ?auto_96766 ?auto_96771 ) ) ( not ( = ?auto_96766 ?auto_96772 ) ) ( not ( = ?auto_96767 ?auto_96768 ) ) ( not ( = ?auto_96767 ?auto_96769 ) ) ( not ( = ?auto_96767 ?auto_96770 ) ) ( not ( = ?auto_96767 ?auto_96771 ) ) ( not ( = ?auto_96767 ?auto_96772 ) ) ( not ( = ?auto_96768 ?auto_96769 ) ) ( not ( = ?auto_96768 ?auto_96770 ) ) ( not ( = ?auto_96768 ?auto_96771 ) ) ( not ( = ?auto_96768 ?auto_96772 ) ) ( not ( = ?auto_96769 ?auto_96770 ) ) ( not ( = ?auto_96769 ?auto_96771 ) ) ( not ( = ?auto_96769 ?auto_96772 ) ) ( not ( = ?auto_96770 ?auto_96771 ) ) ( not ( = ?auto_96770 ?auto_96772 ) ) ( not ( = ?auto_96771 ?auto_96772 ) ) ( ON ?auto_96763 ?auto_96773 ) ( not ( = ?auto_96772 ?auto_96773 ) ) ( not ( = ?auto_96771 ?auto_96773 ) ) ( not ( = ?auto_96770 ?auto_96773 ) ) ( not ( = ?auto_96769 ?auto_96773 ) ) ( not ( = ?auto_96768 ?auto_96773 ) ) ( not ( = ?auto_96767 ?auto_96773 ) ) ( not ( = ?auto_96766 ?auto_96773 ) ) ( not ( = ?auto_96765 ?auto_96773 ) ) ( not ( = ?auto_96764 ?auto_96773 ) ) ( not ( = ?auto_96763 ?auto_96773 ) ) ( ON ?auto_96764 ?auto_96763 ) ( ON ?auto_96765 ?auto_96764 ) ( ON ?auto_96766 ?auto_96765 ) ( ON ?auto_96767 ?auto_96766 ) ( ON ?auto_96768 ?auto_96767 ) ( ON ?auto_96769 ?auto_96768 ) ( ON ?auto_96770 ?auto_96769 ) ( ON ?auto_96771 ?auto_96770 ) ( ON ?auto_96772 ?auto_96771 ) ( CLEAR ?auto_96772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_96772 ?auto_96771 ?auto_96770 ?auto_96769 ?auto_96768 ?auto_96767 ?auto_96766 ?auto_96765 ?auto_96764 ?auto_96763 )
      ( MAKE-10PILE ?auto_96763 ?auto_96764 ?auto_96765 ?auto_96766 ?auto_96767 ?auto_96768 ?auto_96769 ?auto_96770 ?auto_96771 ?auto_96772 ) )
  )

)

