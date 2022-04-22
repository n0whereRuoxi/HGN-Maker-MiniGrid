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
      ?auto_247145 - BLOCK
    )
    :vars
    (
      ?auto_247146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247145 ?auto_247146 ) ( CLEAR ?auto_247145 ) ( HAND-EMPTY ) ( not ( = ?auto_247145 ?auto_247146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247145 ?auto_247146 )
      ( !PUTDOWN ?auto_247145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247152 - BLOCK
      ?auto_247153 - BLOCK
    )
    :vars
    (
      ?auto_247154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247152 ) ( ON ?auto_247153 ?auto_247154 ) ( CLEAR ?auto_247153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247152 ) ( not ( = ?auto_247152 ?auto_247153 ) ) ( not ( = ?auto_247152 ?auto_247154 ) ) ( not ( = ?auto_247153 ?auto_247154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247153 ?auto_247154 )
      ( !STACK ?auto_247153 ?auto_247152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247162 - BLOCK
      ?auto_247163 - BLOCK
    )
    :vars
    (
      ?auto_247164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247163 ?auto_247164 ) ( not ( = ?auto_247162 ?auto_247163 ) ) ( not ( = ?auto_247162 ?auto_247164 ) ) ( not ( = ?auto_247163 ?auto_247164 ) ) ( ON ?auto_247162 ?auto_247163 ) ( CLEAR ?auto_247162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247162 )
      ( MAKE-2PILE ?auto_247162 ?auto_247163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247173 - BLOCK
      ?auto_247174 - BLOCK
      ?auto_247175 - BLOCK
    )
    :vars
    (
      ?auto_247176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247174 ) ( ON ?auto_247175 ?auto_247176 ) ( CLEAR ?auto_247175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247173 ) ( ON ?auto_247174 ?auto_247173 ) ( not ( = ?auto_247173 ?auto_247174 ) ) ( not ( = ?auto_247173 ?auto_247175 ) ) ( not ( = ?auto_247173 ?auto_247176 ) ) ( not ( = ?auto_247174 ?auto_247175 ) ) ( not ( = ?auto_247174 ?auto_247176 ) ) ( not ( = ?auto_247175 ?auto_247176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247175 ?auto_247176 )
      ( !STACK ?auto_247175 ?auto_247174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247187 - BLOCK
      ?auto_247188 - BLOCK
      ?auto_247189 - BLOCK
    )
    :vars
    (
      ?auto_247190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247189 ?auto_247190 ) ( ON-TABLE ?auto_247187 ) ( not ( = ?auto_247187 ?auto_247188 ) ) ( not ( = ?auto_247187 ?auto_247189 ) ) ( not ( = ?auto_247187 ?auto_247190 ) ) ( not ( = ?auto_247188 ?auto_247189 ) ) ( not ( = ?auto_247188 ?auto_247190 ) ) ( not ( = ?auto_247189 ?auto_247190 ) ) ( CLEAR ?auto_247187 ) ( ON ?auto_247188 ?auto_247189 ) ( CLEAR ?auto_247188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247187 ?auto_247188 )
      ( MAKE-3PILE ?auto_247187 ?auto_247188 ?auto_247189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247201 - BLOCK
      ?auto_247202 - BLOCK
      ?auto_247203 - BLOCK
    )
    :vars
    (
      ?auto_247204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247203 ?auto_247204 ) ( not ( = ?auto_247201 ?auto_247202 ) ) ( not ( = ?auto_247201 ?auto_247203 ) ) ( not ( = ?auto_247201 ?auto_247204 ) ) ( not ( = ?auto_247202 ?auto_247203 ) ) ( not ( = ?auto_247202 ?auto_247204 ) ) ( not ( = ?auto_247203 ?auto_247204 ) ) ( ON ?auto_247202 ?auto_247203 ) ( ON ?auto_247201 ?auto_247202 ) ( CLEAR ?auto_247201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247201 )
      ( MAKE-3PILE ?auto_247201 ?auto_247202 ?auto_247203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247216 - BLOCK
      ?auto_247217 - BLOCK
      ?auto_247218 - BLOCK
      ?auto_247219 - BLOCK
    )
    :vars
    (
      ?auto_247220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247218 ) ( ON ?auto_247219 ?auto_247220 ) ( CLEAR ?auto_247219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247216 ) ( ON ?auto_247217 ?auto_247216 ) ( ON ?auto_247218 ?auto_247217 ) ( not ( = ?auto_247216 ?auto_247217 ) ) ( not ( = ?auto_247216 ?auto_247218 ) ) ( not ( = ?auto_247216 ?auto_247219 ) ) ( not ( = ?auto_247216 ?auto_247220 ) ) ( not ( = ?auto_247217 ?auto_247218 ) ) ( not ( = ?auto_247217 ?auto_247219 ) ) ( not ( = ?auto_247217 ?auto_247220 ) ) ( not ( = ?auto_247218 ?auto_247219 ) ) ( not ( = ?auto_247218 ?auto_247220 ) ) ( not ( = ?auto_247219 ?auto_247220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247219 ?auto_247220 )
      ( !STACK ?auto_247219 ?auto_247218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247234 - BLOCK
      ?auto_247235 - BLOCK
      ?auto_247236 - BLOCK
      ?auto_247237 - BLOCK
    )
    :vars
    (
      ?auto_247238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247237 ?auto_247238 ) ( ON-TABLE ?auto_247234 ) ( ON ?auto_247235 ?auto_247234 ) ( not ( = ?auto_247234 ?auto_247235 ) ) ( not ( = ?auto_247234 ?auto_247236 ) ) ( not ( = ?auto_247234 ?auto_247237 ) ) ( not ( = ?auto_247234 ?auto_247238 ) ) ( not ( = ?auto_247235 ?auto_247236 ) ) ( not ( = ?auto_247235 ?auto_247237 ) ) ( not ( = ?auto_247235 ?auto_247238 ) ) ( not ( = ?auto_247236 ?auto_247237 ) ) ( not ( = ?auto_247236 ?auto_247238 ) ) ( not ( = ?auto_247237 ?auto_247238 ) ) ( CLEAR ?auto_247235 ) ( ON ?auto_247236 ?auto_247237 ) ( CLEAR ?auto_247236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247234 ?auto_247235 ?auto_247236 )
      ( MAKE-4PILE ?auto_247234 ?auto_247235 ?auto_247236 ?auto_247237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247252 - BLOCK
      ?auto_247253 - BLOCK
      ?auto_247254 - BLOCK
      ?auto_247255 - BLOCK
    )
    :vars
    (
      ?auto_247256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247255 ?auto_247256 ) ( ON-TABLE ?auto_247252 ) ( not ( = ?auto_247252 ?auto_247253 ) ) ( not ( = ?auto_247252 ?auto_247254 ) ) ( not ( = ?auto_247252 ?auto_247255 ) ) ( not ( = ?auto_247252 ?auto_247256 ) ) ( not ( = ?auto_247253 ?auto_247254 ) ) ( not ( = ?auto_247253 ?auto_247255 ) ) ( not ( = ?auto_247253 ?auto_247256 ) ) ( not ( = ?auto_247254 ?auto_247255 ) ) ( not ( = ?auto_247254 ?auto_247256 ) ) ( not ( = ?auto_247255 ?auto_247256 ) ) ( ON ?auto_247254 ?auto_247255 ) ( CLEAR ?auto_247252 ) ( ON ?auto_247253 ?auto_247254 ) ( CLEAR ?auto_247253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247252 ?auto_247253 )
      ( MAKE-4PILE ?auto_247252 ?auto_247253 ?auto_247254 ?auto_247255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247270 - BLOCK
      ?auto_247271 - BLOCK
      ?auto_247272 - BLOCK
      ?auto_247273 - BLOCK
    )
    :vars
    (
      ?auto_247274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247273 ?auto_247274 ) ( not ( = ?auto_247270 ?auto_247271 ) ) ( not ( = ?auto_247270 ?auto_247272 ) ) ( not ( = ?auto_247270 ?auto_247273 ) ) ( not ( = ?auto_247270 ?auto_247274 ) ) ( not ( = ?auto_247271 ?auto_247272 ) ) ( not ( = ?auto_247271 ?auto_247273 ) ) ( not ( = ?auto_247271 ?auto_247274 ) ) ( not ( = ?auto_247272 ?auto_247273 ) ) ( not ( = ?auto_247272 ?auto_247274 ) ) ( not ( = ?auto_247273 ?auto_247274 ) ) ( ON ?auto_247272 ?auto_247273 ) ( ON ?auto_247271 ?auto_247272 ) ( ON ?auto_247270 ?auto_247271 ) ( CLEAR ?auto_247270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247270 )
      ( MAKE-4PILE ?auto_247270 ?auto_247271 ?auto_247272 ?auto_247273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247289 - BLOCK
      ?auto_247290 - BLOCK
      ?auto_247291 - BLOCK
      ?auto_247292 - BLOCK
      ?auto_247293 - BLOCK
    )
    :vars
    (
      ?auto_247294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247292 ) ( ON ?auto_247293 ?auto_247294 ) ( CLEAR ?auto_247293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247289 ) ( ON ?auto_247290 ?auto_247289 ) ( ON ?auto_247291 ?auto_247290 ) ( ON ?auto_247292 ?auto_247291 ) ( not ( = ?auto_247289 ?auto_247290 ) ) ( not ( = ?auto_247289 ?auto_247291 ) ) ( not ( = ?auto_247289 ?auto_247292 ) ) ( not ( = ?auto_247289 ?auto_247293 ) ) ( not ( = ?auto_247289 ?auto_247294 ) ) ( not ( = ?auto_247290 ?auto_247291 ) ) ( not ( = ?auto_247290 ?auto_247292 ) ) ( not ( = ?auto_247290 ?auto_247293 ) ) ( not ( = ?auto_247290 ?auto_247294 ) ) ( not ( = ?auto_247291 ?auto_247292 ) ) ( not ( = ?auto_247291 ?auto_247293 ) ) ( not ( = ?auto_247291 ?auto_247294 ) ) ( not ( = ?auto_247292 ?auto_247293 ) ) ( not ( = ?auto_247292 ?auto_247294 ) ) ( not ( = ?auto_247293 ?auto_247294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247293 ?auto_247294 )
      ( !STACK ?auto_247293 ?auto_247292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247311 - BLOCK
      ?auto_247312 - BLOCK
      ?auto_247313 - BLOCK
      ?auto_247314 - BLOCK
      ?auto_247315 - BLOCK
    )
    :vars
    (
      ?auto_247316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247315 ?auto_247316 ) ( ON-TABLE ?auto_247311 ) ( ON ?auto_247312 ?auto_247311 ) ( ON ?auto_247313 ?auto_247312 ) ( not ( = ?auto_247311 ?auto_247312 ) ) ( not ( = ?auto_247311 ?auto_247313 ) ) ( not ( = ?auto_247311 ?auto_247314 ) ) ( not ( = ?auto_247311 ?auto_247315 ) ) ( not ( = ?auto_247311 ?auto_247316 ) ) ( not ( = ?auto_247312 ?auto_247313 ) ) ( not ( = ?auto_247312 ?auto_247314 ) ) ( not ( = ?auto_247312 ?auto_247315 ) ) ( not ( = ?auto_247312 ?auto_247316 ) ) ( not ( = ?auto_247313 ?auto_247314 ) ) ( not ( = ?auto_247313 ?auto_247315 ) ) ( not ( = ?auto_247313 ?auto_247316 ) ) ( not ( = ?auto_247314 ?auto_247315 ) ) ( not ( = ?auto_247314 ?auto_247316 ) ) ( not ( = ?auto_247315 ?auto_247316 ) ) ( CLEAR ?auto_247313 ) ( ON ?auto_247314 ?auto_247315 ) ( CLEAR ?auto_247314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247311 ?auto_247312 ?auto_247313 ?auto_247314 )
      ( MAKE-5PILE ?auto_247311 ?auto_247312 ?auto_247313 ?auto_247314 ?auto_247315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247333 - BLOCK
      ?auto_247334 - BLOCK
      ?auto_247335 - BLOCK
      ?auto_247336 - BLOCK
      ?auto_247337 - BLOCK
    )
    :vars
    (
      ?auto_247338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247337 ?auto_247338 ) ( ON-TABLE ?auto_247333 ) ( ON ?auto_247334 ?auto_247333 ) ( not ( = ?auto_247333 ?auto_247334 ) ) ( not ( = ?auto_247333 ?auto_247335 ) ) ( not ( = ?auto_247333 ?auto_247336 ) ) ( not ( = ?auto_247333 ?auto_247337 ) ) ( not ( = ?auto_247333 ?auto_247338 ) ) ( not ( = ?auto_247334 ?auto_247335 ) ) ( not ( = ?auto_247334 ?auto_247336 ) ) ( not ( = ?auto_247334 ?auto_247337 ) ) ( not ( = ?auto_247334 ?auto_247338 ) ) ( not ( = ?auto_247335 ?auto_247336 ) ) ( not ( = ?auto_247335 ?auto_247337 ) ) ( not ( = ?auto_247335 ?auto_247338 ) ) ( not ( = ?auto_247336 ?auto_247337 ) ) ( not ( = ?auto_247336 ?auto_247338 ) ) ( not ( = ?auto_247337 ?auto_247338 ) ) ( ON ?auto_247336 ?auto_247337 ) ( CLEAR ?auto_247334 ) ( ON ?auto_247335 ?auto_247336 ) ( CLEAR ?auto_247335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247333 ?auto_247334 ?auto_247335 )
      ( MAKE-5PILE ?auto_247333 ?auto_247334 ?auto_247335 ?auto_247336 ?auto_247337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247355 - BLOCK
      ?auto_247356 - BLOCK
      ?auto_247357 - BLOCK
      ?auto_247358 - BLOCK
      ?auto_247359 - BLOCK
    )
    :vars
    (
      ?auto_247360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247359 ?auto_247360 ) ( ON-TABLE ?auto_247355 ) ( not ( = ?auto_247355 ?auto_247356 ) ) ( not ( = ?auto_247355 ?auto_247357 ) ) ( not ( = ?auto_247355 ?auto_247358 ) ) ( not ( = ?auto_247355 ?auto_247359 ) ) ( not ( = ?auto_247355 ?auto_247360 ) ) ( not ( = ?auto_247356 ?auto_247357 ) ) ( not ( = ?auto_247356 ?auto_247358 ) ) ( not ( = ?auto_247356 ?auto_247359 ) ) ( not ( = ?auto_247356 ?auto_247360 ) ) ( not ( = ?auto_247357 ?auto_247358 ) ) ( not ( = ?auto_247357 ?auto_247359 ) ) ( not ( = ?auto_247357 ?auto_247360 ) ) ( not ( = ?auto_247358 ?auto_247359 ) ) ( not ( = ?auto_247358 ?auto_247360 ) ) ( not ( = ?auto_247359 ?auto_247360 ) ) ( ON ?auto_247358 ?auto_247359 ) ( ON ?auto_247357 ?auto_247358 ) ( CLEAR ?auto_247355 ) ( ON ?auto_247356 ?auto_247357 ) ( CLEAR ?auto_247356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247355 ?auto_247356 )
      ( MAKE-5PILE ?auto_247355 ?auto_247356 ?auto_247357 ?auto_247358 ?auto_247359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247377 - BLOCK
      ?auto_247378 - BLOCK
      ?auto_247379 - BLOCK
      ?auto_247380 - BLOCK
      ?auto_247381 - BLOCK
    )
    :vars
    (
      ?auto_247382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247381 ?auto_247382 ) ( not ( = ?auto_247377 ?auto_247378 ) ) ( not ( = ?auto_247377 ?auto_247379 ) ) ( not ( = ?auto_247377 ?auto_247380 ) ) ( not ( = ?auto_247377 ?auto_247381 ) ) ( not ( = ?auto_247377 ?auto_247382 ) ) ( not ( = ?auto_247378 ?auto_247379 ) ) ( not ( = ?auto_247378 ?auto_247380 ) ) ( not ( = ?auto_247378 ?auto_247381 ) ) ( not ( = ?auto_247378 ?auto_247382 ) ) ( not ( = ?auto_247379 ?auto_247380 ) ) ( not ( = ?auto_247379 ?auto_247381 ) ) ( not ( = ?auto_247379 ?auto_247382 ) ) ( not ( = ?auto_247380 ?auto_247381 ) ) ( not ( = ?auto_247380 ?auto_247382 ) ) ( not ( = ?auto_247381 ?auto_247382 ) ) ( ON ?auto_247380 ?auto_247381 ) ( ON ?auto_247379 ?auto_247380 ) ( ON ?auto_247378 ?auto_247379 ) ( ON ?auto_247377 ?auto_247378 ) ( CLEAR ?auto_247377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247377 )
      ( MAKE-5PILE ?auto_247377 ?auto_247378 ?auto_247379 ?auto_247380 ?auto_247381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247400 - BLOCK
      ?auto_247401 - BLOCK
      ?auto_247402 - BLOCK
      ?auto_247403 - BLOCK
      ?auto_247404 - BLOCK
      ?auto_247405 - BLOCK
    )
    :vars
    (
      ?auto_247406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247404 ) ( ON ?auto_247405 ?auto_247406 ) ( CLEAR ?auto_247405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247400 ) ( ON ?auto_247401 ?auto_247400 ) ( ON ?auto_247402 ?auto_247401 ) ( ON ?auto_247403 ?auto_247402 ) ( ON ?auto_247404 ?auto_247403 ) ( not ( = ?auto_247400 ?auto_247401 ) ) ( not ( = ?auto_247400 ?auto_247402 ) ) ( not ( = ?auto_247400 ?auto_247403 ) ) ( not ( = ?auto_247400 ?auto_247404 ) ) ( not ( = ?auto_247400 ?auto_247405 ) ) ( not ( = ?auto_247400 ?auto_247406 ) ) ( not ( = ?auto_247401 ?auto_247402 ) ) ( not ( = ?auto_247401 ?auto_247403 ) ) ( not ( = ?auto_247401 ?auto_247404 ) ) ( not ( = ?auto_247401 ?auto_247405 ) ) ( not ( = ?auto_247401 ?auto_247406 ) ) ( not ( = ?auto_247402 ?auto_247403 ) ) ( not ( = ?auto_247402 ?auto_247404 ) ) ( not ( = ?auto_247402 ?auto_247405 ) ) ( not ( = ?auto_247402 ?auto_247406 ) ) ( not ( = ?auto_247403 ?auto_247404 ) ) ( not ( = ?auto_247403 ?auto_247405 ) ) ( not ( = ?auto_247403 ?auto_247406 ) ) ( not ( = ?auto_247404 ?auto_247405 ) ) ( not ( = ?auto_247404 ?auto_247406 ) ) ( not ( = ?auto_247405 ?auto_247406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247405 ?auto_247406 )
      ( !STACK ?auto_247405 ?auto_247404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247426 - BLOCK
      ?auto_247427 - BLOCK
      ?auto_247428 - BLOCK
      ?auto_247429 - BLOCK
      ?auto_247430 - BLOCK
      ?auto_247431 - BLOCK
    )
    :vars
    (
      ?auto_247432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247431 ?auto_247432 ) ( ON-TABLE ?auto_247426 ) ( ON ?auto_247427 ?auto_247426 ) ( ON ?auto_247428 ?auto_247427 ) ( ON ?auto_247429 ?auto_247428 ) ( not ( = ?auto_247426 ?auto_247427 ) ) ( not ( = ?auto_247426 ?auto_247428 ) ) ( not ( = ?auto_247426 ?auto_247429 ) ) ( not ( = ?auto_247426 ?auto_247430 ) ) ( not ( = ?auto_247426 ?auto_247431 ) ) ( not ( = ?auto_247426 ?auto_247432 ) ) ( not ( = ?auto_247427 ?auto_247428 ) ) ( not ( = ?auto_247427 ?auto_247429 ) ) ( not ( = ?auto_247427 ?auto_247430 ) ) ( not ( = ?auto_247427 ?auto_247431 ) ) ( not ( = ?auto_247427 ?auto_247432 ) ) ( not ( = ?auto_247428 ?auto_247429 ) ) ( not ( = ?auto_247428 ?auto_247430 ) ) ( not ( = ?auto_247428 ?auto_247431 ) ) ( not ( = ?auto_247428 ?auto_247432 ) ) ( not ( = ?auto_247429 ?auto_247430 ) ) ( not ( = ?auto_247429 ?auto_247431 ) ) ( not ( = ?auto_247429 ?auto_247432 ) ) ( not ( = ?auto_247430 ?auto_247431 ) ) ( not ( = ?auto_247430 ?auto_247432 ) ) ( not ( = ?auto_247431 ?auto_247432 ) ) ( CLEAR ?auto_247429 ) ( ON ?auto_247430 ?auto_247431 ) ( CLEAR ?auto_247430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247426 ?auto_247427 ?auto_247428 ?auto_247429 ?auto_247430 )
      ( MAKE-6PILE ?auto_247426 ?auto_247427 ?auto_247428 ?auto_247429 ?auto_247430 ?auto_247431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247452 - BLOCK
      ?auto_247453 - BLOCK
      ?auto_247454 - BLOCK
      ?auto_247455 - BLOCK
      ?auto_247456 - BLOCK
      ?auto_247457 - BLOCK
    )
    :vars
    (
      ?auto_247458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247457 ?auto_247458 ) ( ON-TABLE ?auto_247452 ) ( ON ?auto_247453 ?auto_247452 ) ( ON ?auto_247454 ?auto_247453 ) ( not ( = ?auto_247452 ?auto_247453 ) ) ( not ( = ?auto_247452 ?auto_247454 ) ) ( not ( = ?auto_247452 ?auto_247455 ) ) ( not ( = ?auto_247452 ?auto_247456 ) ) ( not ( = ?auto_247452 ?auto_247457 ) ) ( not ( = ?auto_247452 ?auto_247458 ) ) ( not ( = ?auto_247453 ?auto_247454 ) ) ( not ( = ?auto_247453 ?auto_247455 ) ) ( not ( = ?auto_247453 ?auto_247456 ) ) ( not ( = ?auto_247453 ?auto_247457 ) ) ( not ( = ?auto_247453 ?auto_247458 ) ) ( not ( = ?auto_247454 ?auto_247455 ) ) ( not ( = ?auto_247454 ?auto_247456 ) ) ( not ( = ?auto_247454 ?auto_247457 ) ) ( not ( = ?auto_247454 ?auto_247458 ) ) ( not ( = ?auto_247455 ?auto_247456 ) ) ( not ( = ?auto_247455 ?auto_247457 ) ) ( not ( = ?auto_247455 ?auto_247458 ) ) ( not ( = ?auto_247456 ?auto_247457 ) ) ( not ( = ?auto_247456 ?auto_247458 ) ) ( not ( = ?auto_247457 ?auto_247458 ) ) ( ON ?auto_247456 ?auto_247457 ) ( CLEAR ?auto_247454 ) ( ON ?auto_247455 ?auto_247456 ) ( CLEAR ?auto_247455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247452 ?auto_247453 ?auto_247454 ?auto_247455 )
      ( MAKE-6PILE ?auto_247452 ?auto_247453 ?auto_247454 ?auto_247455 ?auto_247456 ?auto_247457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247478 - BLOCK
      ?auto_247479 - BLOCK
      ?auto_247480 - BLOCK
      ?auto_247481 - BLOCK
      ?auto_247482 - BLOCK
      ?auto_247483 - BLOCK
    )
    :vars
    (
      ?auto_247484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247483 ?auto_247484 ) ( ON-TABLE ?auto_247478 ) ( ON ?auto_247479 ?auto_247478 ) ( not ( = ?auto_247478 ?auto_247479 ) ) ( not ( = ?auto_247478 ?auto_247480 ) ) ( not ( = ?auto_247478 ?auto_247481 ) ) ( not ( = ?auto_247478 ?auto_247482 ) ) ( not ( = ?auto_247478 ?auto_247483 ) ) ( not ( = ?auto_247478 ?auto_247484 ) ) ( not ( = ?auto_247479 ?auto_247480 ) ) ( not ( = ?auto_247479 ?auto_247481 ) ) ( not ( = ?auto_247479 ?auto_247482 ) ) ( not ( = ?auto_247479 ?auto_247483 ) ) ( not ( = ?auto_247479 ?auto_247484 ) ) ( not ( = ?auto_247480 ?auto_247481 ) ) ( not ( = ?auto_247480 ?auto_247482 ) ) ( not ( = ?auto_247480 ?auto_247483 ) ) ( not ( = ?auto_247480 ?auto_247484 ) ) ( not ( = ?auto_247481 ?auto_247482 ) ) ( not ( = ?auto_247481 ?auto_247483 ) ) ( not ( = ?auto_247481 ?auto_247484 ) ) ( not ( = ?auto_247482 ?auto_247483 ) ) ( not ( = ?auto_247482 ?auto_247484 ) ) ( not ( = ?auto_247483 ?auto_247484 ) ) ( ON ?auto_247482 ?auto_247483 ) ( ON ?auto_247481 ?auto_247482 ) ( CLEAR ?auto_247479 ) ( ON ?auto_247480 ?auto_247481 ) ( CLEAR ?auto_247480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247478 ?auto_247479 ?auto_247480 )
      ( MAKE-6PILE ?auto_247478 ?auto_247479 ?auto_247480 ?auto_247481 ?auto_247482 ?auto_247483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247504 - BLOCK
      ?auto_247505 - BLOCK
      ?auto_247506 - BLOCK
      ?auto_247507 - BLOCK
      ?auto_247508 - BLOCK
      ?auto_247509 - BLOCK
    )
    :vars
    (
      ?auto_247510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247509 ?auto_247510 ) ( ON-TABLE ?auto_247504 ) ( not ( = ?auto_247504 ?auto_247505 ) ) ( not ( = ?auto_247504 ?auto_247506 ) ) ( not ( = ?auto_247504 ?auto_247507 ) ) ( not ( = ?auto_247504 ?auto_247508 ) ) ( not ( = ?auto_247504 ?auto_247509 ) ) ( not ( = ?auto_247504 ?auto_247510 ) ) ( not ( = ?auto_247505 ?auto_247506 ) ) ( not ( = ?auto_247505 ?auto_247507 ) ) ( not ( = ?auto_247505 ?auto_247508 ) ) ( not ( = ?auto_247505 ?auto_247509 ) ) ( not ( = ?auto_247505 ?auto_247510 ) ) ( not ( = ?auto_247506 ?auto_247507 ) ) ( not ( = ?auto_247506 ?auto_247508 ) ) ( not ( = ?auto_247506 ?auto_247509 ) ) ( not ( = ?auto_247506 ?auto_247510 ) ) ( not ( = ?auto_247507 ?auto_247508 ) ) ( not ( = ?auto_247507 ?auto_247509 ) ) ( not ( = ?auto_247507 ?auto_247510 ) ) ( not ( = ?auto_247508 ?auto_247509 ) ) ( not ( = ?auto_247508 ?auto_247510 ) ) ( not ( = ?auto_247509 ?auto_247510 ) ) ( ON ?auto_247508 ?auto_247509 ) ( ON ?auto_247507 ?auto_247508 ) ( ON ?auto_247506 ?auto_247507 ) ( CLEAR ?auto_247504 ) ( ON ?auto_247505 ?auto_247506 ) ( CLEAR ?auto_247505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247504 ?auto_247505 )
      ( MAKE-6PILE ?auto_247504 ?auto_247505 ?auto_247506 ?auto_247507 ?auto_247508 ?auto_247509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247530 - BLOCK
      ?auto_247531 - BLOCK
      ?auto_247532 - BLOCK
      ?auto_247533 - BLOCK
      ?auto_247534 - BLOCK
      ?auto_247535 - BLOCK
    )
    :vars
    (
      ?auto_247536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247535 ?auto_247536 ) ( not ( = ?auto_247530 ?auto_247531 ) ) ( not ( = ?auto_247530 ?auto_247532 ) ) ( not ( = ?auto_247530 ?auto_247533 ) ) ( not ( = ?auto_247530 ?auto_247534 ) ) ( not ( = ?auto_247530 ?auto_247535 ) ) ( not ( = ?auto_247530 ?auto_247536 ) ) ( not ( = ?auto_247531 ?auto_247532 ) ) ( not ( = ?auto_247531 ?auto_247533 ) ) ( not ( = ?auto_247531 ?auto_247534 ) ) ( not ( = ?auto_247531 ?auto_247535 ) ) ( not ( = ?auto_247531 ?auto_247536 ) ) ( not ( = ?auto_247532 ?auto_247533 ) ) ( not ( = ?auto_247532 ?auto_247534 ) ) ( not ( = ?auto_247532 ?auto_247535 ) ) ( not ( = ?auto_247532 ?auto_247536 ) ) ( not ( = ?auto_247533 ?auto_247534 ) ) ( not ( = ?auto_247533 ?auto_247535 ) ) ( not ( = ?auto_247533 ?auto_247536 ) ) ( not ( = ?auto_247534 ?auto_247535 ) ) ( not ( = ?auto_247534 ?auto_247536 ) ) ( not ( = ?auto_247535 ?auto_247536 ) ) ( ON ?auto_247534 ?auto_247535 ) ( ON ?auto_247533 ?auto_247534 ) ( ON ?auto_247532 ?auto_247533 ) ( ON ?auto_247531 ?auto_247532 ) ( ON ?auto_247530 ?auto_247531 ) ( CLEAR ?auto_247530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247530 )
      ( MAKE-6PILE ?auto_247530 ?auto_247531 ?auto_247532 ?auto_247533 ?auto_247534 ?auto_247535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247557 - BLOCK
      ?auto_247558 - BLOCK
      ?auto_247559 - BLOCK
      ?auto_247560 - BLOCK
      ?auto_247561 - BLOCK
      ?auto_247562 - BLOCK
      ?auto_247563 - BLOCK
    )
    :vars
    (
      ?auto_247564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247562 ) ( ON ?auto_247563 ?auto_247564 ) ( CLEAR ?auto_247563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247557 ) ( ON ?auto_247558 ?auto_247557 ) ( ON ?auto_247559 ?auto_247558 ) ( ON ?auto_247560 ?auto_247559 ) ( ON ?auto_247561 ?auto_247560 ) ( ON ?auto_247562 ?auto_247561 ) ( not ( = ?auto_247557 ?auto_247558 ) ) ( not ( = ?auto_247557 ?auto_247559 ) ) ( not ( = ?auto_247557 ?auto_247560 ) ) ( not ( = ?auto_247557 ?auto_247561 ) ) ( not ( = ?auto_247557 ?auto_247562 ) ) ( not ( = ?auto_247557 ?auto_247563 ) ) ( not ( = ?auto_247557 ?auto_247564 ) ) ( not ( = ?auto_247558 ?auto_247559 ) ) ( not ( = ?auto_247558 ?auto_247560 ) ) ( not ( = ?auto_247558 ?auto_247561 ) ) ( not ( = ?auto_247558 ?auto_247562 ) ) ( not ( = ?auto_247558 ?auto_247563 ) ) ( not ( = ?auto_247558 ?auto_247564 ) ) ( not ( = ?auto_247559 ?auto_247560 ) ) ( not ( = ?auto_247559 ?auto_247561 ) ) ( not ( = ?auto_247559 ?auto_247562 ) ) ( not ( = ?auto_247559 ?auto_247563 ) ) ( not ( = ?auto_247559 ?auto_247564 ) ) ( not ( = ?auto_247560 ?auto_247561 ) ) ( not ( = ?auto_247560 ?auto_247562 ) ) ( not ( = ?auto_247560 ?auto_247563 ) ) ( not ( = ?auto_247560 ?auto_247564 ) ) ( not ( = ?auto_247561 ?auto_247562 ) ) ( not ( = ?auto_247561 ?auto_247563 ) ) ( not ( = ?auto_247561 ?auto_247564 ) ) ( not ( = ?auto_247562 ?auto_247563 ) ) ( not ( = ?auto_247562 ?auto_247564 ) ) ( not ( = ?auto_247563 ?auto_247564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247563 ?auto_247564 )
      ( !STACK ?auto_247563 ?auto_247562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247587 - BLOCK
      ?auto_247588 - BLOCK
      ?auto_247589 - BLOCK
      ?auto_247590 - BLOCK
      ?auto_247591 - BLOCK
      ?auto_247592 - BLOCK
      ?auto_247593 - BLOCK
    )
    :vars
    (
      ?auto_247594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247593 ?auto_247594 ) ( ON-TABLE ?auto_247587 ) ( ON ?auto_247588 ?auto_247587 ) ( ON ?auto_247589 ?auto_247588 ) ( ON ?auto_247590 ?auto_247589 ) ( ON ?auto_247591 ?auto_247590 ) ( not ( = ?auto_247587 ?auto_247588 ) ) ( not ( = ?auto_247587 ?auto_247589 ) ) ( not ( = ?auto_247587 ?auto_247590 ) ) ( not ( = ?auto_247587 ?auto_247591 ) ) ( not ( = ?auto_247587 ?auto_247592 ) ) ( not ( = ?auto_247587 ?auto_247593 ) ) ( not ( = ?auto_247587 ?auto_247594 ) ) ( not ( = ?auto_247588 ?auto_247589 ) ) ( not ( = ?auto_247588 ?auto_247590 ) ) ( not ( = ?auto_247588 ?auto_247591 ) ) ( not ( = ?auto_247588 ?auto_247592 ) ) ( not ( = ?auto_247588 ?auto_247593 ) ) ( not ( = ?auto_247588 ?auto_247594 ) ) ( not ( = ?auto_247589 ?auto_247590 ) ) ( not ( = ?auto_247589 ?auto_247591 ) ) ( not ( = ?auto_247589 ?auto_247592 ) ) ( not ( = ?auto_247589 ?auto_247593 ) ) ( not ( = ?auto_247589 ?auto_247594 ) ) ( not ( = ?auto_247590 ?auto_247591 ) ) ( not ( = ?auto_247590 ?auto_247592 ) ) ( not ( = ?auto_247590 ?auto_247593 ) ) ( not ( = ?auto_247590 ?auto_247594 ) ) ( not ( = ?auto_247591 ?auto_247592 ) ) ( not ( = ?auto_247591 ?auto_247593 ) ) ( not ( = ?auto_247591 ?auto_247594 ) ) ( not ( = ?auto_247592 ?auto_247593 ) ) ( not ( = ?auto_247592 ?auto_247594 ) ) ( not ( = ?auto_247593 ?auto_247594 ) ) ( CLEAR ?auto_247591 ) ( ON ?auto_247592 ?auto_247593 ) ( CLEAR ?auto_247592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247587 ?auto_247588 ?auto_247589 ?auto_247590 ?auto_247591 ?auto_247592 )
      ( MAKE-7PILE ?auto_247587 ?auto_247588 ?auto_247589 ?auto_247590 ?auto_247591 ?auto_247592 ?auto_247593 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247617 - BLOCK
      ?auto_247618 - BLOCK
      ?auto_247619 - BLOCK
      ?auto_247620 - BLOCK
      ?auto_247621 - BLOCK
      ?auto_247622 - BLOCK
      ?auto_247623 - BLOCK
    )
    :vars
    (
      ?auto_247624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247623 ?auto_247624 ) ( ON-TABLE ?auto_247617 ) ( ON ?auto_247618 ?auto_247617 ) ( ON ?auto_247619 ?auto_247618 ) ( ON ?auto_247620 ?auto_247619 ) ( not ( = ?auto_247617 ?auto_247618 ) ) ( not ( = ?auto_247617 ?auto_247619 ) ) ( not ( = ?auto_247617 ?auto_247620 ) ) ( not ( = ?auto_247617 ?auto_247621 ) ) ( not ( = ?auto_247617 ?auto_247622 ) ) ( not ( = ?auto_247617 ?auto_247623 ) ) ( not ( = ?auto_247617 ?auto_247624 ) ) ( not ( = ?auto_247618 ?auto_247619 ) ) ( not ( = ?auto_247618 ?auto_247620 ) ) ( not ( = ?auto_247618 ?auto_247621 ) ) ( not ( = ?auto_247618 ?auto_247622 ) ) ( not ( = ?auto_247618 ?auto_247623 ) ) ( not ( = ?auto_247618 ?auto_247624 ) ) ( not ( = ?auto_247619 ?auto_247620 ) ) ( not ( = ?auto_247619 ?auto_247621 ) ) ( not ( = ?auto_247619 ?auto_247622 ) ) ( not ( = ?auto_247619 ?auto_247623 ) ) ( not ( = ?auto_247619 ?auto_247624 ) ) ( not ( = ?auto_247620 ?auto_247621 ) ) ( not ( = ?auto_247620 ?auto_247622 ) ) ( not ( = ?auto_247620 ?auto_247623 ) ) ( not ( = ?auto_247620 ?auto_247624 ) ) ( not ( = ?auto_247621 ?auto_247622 ) ) ( not ( = ?auto_247621 ?auto_247623 ) ) ( not ( = ?auto_247621 ?auto_247624 ) ) ( not ( = ?auto_247622 ?auto_247623 ) ) ( not ( = ?auto_247622 ?auto_247624 ) ) ( not ( = ?auto_247623 ?auto_247624 ) ) ( ON ?auto_247622 ?auto_247623 ) ( CLEAR ?auto_247620 ) ( ON ?auto_247621 ?auto_247622 ) ( CLEAR ?auto_247621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247617 ?auto_247618 ?auto_247619 ?auto_247620 ?auto_247621 )
      ( MAKE-7PILE ?auto_247617 ?auto_247618 ?auto_247619 ?auto_247620 ?auto_247621 ?auto_247622 ?auto_247623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247647 - BLOCK
      ?auto_247648 - BLOCK
      ?auto_247649 - BLOCK
      ?auto_247650 - BLOCK
      ?auto_247651 - BLOCK
      ?auto_247652 - BLOCK
      ?auto_247653 - BLOCK
    )
    :vars
    (
      ?auto_247654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247653 ?auto_247654 ) ( ON-TABLE ?auto_247647 ) ( ON ?auto_247648 ?auto_247647 ) ( ON ?auto_247649 ?auto_247648 ) ( not ( = ?auto_247647 ?auto_247648 ) ) ( not ( = ?auto_247647 ?auto_247649 ) ) ( not ( = ?auto_247647 ?auto_247650 ) ) ( not ( = ?auto_247647 ?auto_247651 ) ) ( not ( = ?auto_247647 ?auto_247652 ) ) ( not ( = ?auto_247647 ?auto_247653 ) ) ( not ( = ?auto_247647 ?auto_247654 ) ) ( not ( = ?auto_247648 ?auto_247649 ) ) ( not ( = ?auto_247648 ?auto_247650 ) ) ( not ( = ?auto_247648 ?auto_247651 ) ) ( not ( = ?auto_247648 ?auto_247652 ) ) ( not ( = ?auto_247648 ?auto_247653 ) ) ( not ( = ?auto_247648 ?auto_247654 ) ) ( not ( = ?auto_247649 ?auto_247650 ) ) ( not ( = ?auto_247649 ?auto_247651 ) ) ( not ( = ?auto_247649 ?auto_247652 ) ) ( not ( = ?auto_247649 ?auto_247653 ) ) ( not ( = ?auto_247649 ?auto_247654 ) ) ( not ( = ?auto_247650 ?auto_247651 ) ) ( not ( = ?auto_247650 ?auto_247652 ) ) ( not ( = ?auto_247650 ?auto_247653 ) ) ( not ( = ?auto_247650 ?auto_247654 ) ) ( not ( = ?auto_247651 ?auto_247652 ) ) ( not ( = ?auto_247651 ?auto_247653 ) ) ( not ( = ?auto_247651 ?auto_247654 ) ) ( not ( = ?auto_247652 ?auto_247653 ) ) ( not ( = ?auto_247652 ?auto_247654 ) ) ( not ( = ?auto_247653 ?auto_247654 ) ) ( ON ?auto_247652 ?auto_247653 ) ( ON ?auto_247651 ?auto_247652 ) ( CLEAR ?auto_247649 ) ( ON ?auto_247650 ?auto_247651 ) ( CLEAR ?auto_247650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247647 ?auto_247648 ?auto_247649 ?auto_247650 )
      ( MAKE-7PILE ?auto_247647 ?auto_247648 ?auto_247649 ?auto_247650 ?auto_247651 ?auto_247652 ?auto_247653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247677 - BLOCK
      ?auto_247678 - BLOCK
      ?auto_247679 - BLOCK
      ?auto_247680 - BLOCK
      ?auto_247681 - BLOCK
      ?auto_247682 - BLOCK
      ?auto_247683 - BLOCK
    )
    :vars
    (
      ?auto_247684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247683 ?auto_247684 ) ( ON-TABLE ?auto_247677 ) ( ON ?auto_247678 ?auto_247677 ) ( not ( = ?auto_247677 ?auto_247678 ) ) ( not ( = ?auto_247677 ?auto_247679 ) ) ( not ( = ?auto_247677 ?auto_247680 ) ) ( not ( = ?auto_247677 ?auto_247681 ) ) ( not ( = ?auto_247677 ?auto_247682 ) ) ( not ( = ?auto_247677 ?auto_247683 ) ) ( not ( = ?auto_247677 ?auto_247684 ) ) ( not ( = ?auto_247678 ?auto_247679 ) ) ( not ( = ?auto_247678 ?auto_247680 ) ) ( not ( = ?auto_247678 ?auto_247681 ) ) ( not ( = ?auto_247678 ?auto_247682 ) ) ( not ( = ?auto_247678 ?auto_247683 ) ) ( not ( = ?auto_247678 ?auto_247684 ) ) ( not ( = ?auto_247679 ?auto_247680 ) ) ( not ( = ?auto_247679 ?auto_247681 ) ) ( not ( = ?auto_247679 ?auto_247682 ) ) ( not ( = ?auto_247679 ?auto_247683 ) ) ( not ( = ?auto_247679 ?auto_247684 ) ) ( not ( = ?auto_247680 ?auto_247681 ) ) ( not ( = ?auto_247680 ?auto_247682 ) ) ( not ( = ?auto_247680 ?auto_247683 ) ) ( not ( = ?auto_247680 ?auto_247684 ) ) ( not ( = ?auto_247681 ?auto_247682 ) ) ( not ( = ?auto_247681 ?auto_247683 ) ) ( not ( = ?auto_247681 ?auto_247684 ) ) ( not ( = ?auto_247682 ?auto_247683 ) ) ( not ( = ?auto_247682 ?auto_247684 ) ) ( not ( = ?auto_247683 ?auto_247684 ) ) ( ON ?auto_247682 ?auto_247683 ) ( ON ?auto_247681 ?auto_247682 ) ( ON ?auto_247680 ?auto_247681 ) ( CLEAR ?auto_247678 ) ( ON ?auto_247679 ?auto_247680 ) ( CLEAR ?auto_247679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247677 ?auto_247678 ?auto_247679 )
      ( MAKE-7PILE ?auto_247677 ?auto_247678 ?auto_247679 ?auto_247680 ?auto_247681 ?auto_247682 ?auto_247683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247707 - BLOCK
      ?auto_247708 - BLOCK
      ?auto_247709 - BLOCK
      ?auto_247710 - BLOCK
      ?auto_247711 - BLOCK
      ?auto_247712 - BLOCK
      ?auto_247713 - BLOCK
    )
    :vars
    (
      ?auto_247714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247713 ?auto_247714 ) ( ON-TABLE ?auto_247707 ) ( not ( = ?auto_247707 ?auto_247708 ) ) ( not ( = ?auto_247707 ?auto_247709 ) ) ( not ( = ?auto_247707 ?auto_247710 ) ) ( not ( = ?auto_247707 ?auto_247711 ) ) ( not ( = ?auto_247707 ?auto_247712 ) ) ( not ( = ?auto_247707 ?auto_247713 ) ) ( not ( = ?auto_247707 ?auto_247714 ) ) ( not ( = ?auto_247708 ?auto_247709 ) ) ( not ( = ?auto_247708 ?auto_247710 ) ) ( not ( = ?auto_247708 ?auto_247711 ) ) ( not ( = ?auto_247708 ?auto_247712 ) ) ( not ( = ?auto_247708 ?auto_247713 ) ) ( not ( = ?auto_247708 ?auto_247714 ) ) ( not ( = ?auto_247709 ?auto_247710 ) ) ( not ( = ?auto_247709 ?auto_247711 ) ) ( not ( = ?auto_247709 ?auto_247712 ) ) ( not ( = ?auto_247709 ?auto_247713 ) ) ( not ( = ?auto_247709 ?auto_247714 ) ) ( not ( = ?auto_247710 ?auto_247711 ) ) ( not ( = ?auto_247710 ?auto_247712 ) ) ( not ( = ?auto_247710 ?auto_247713 ) ) ( not ( = ?auto_247710 ?auto_247714 ) ) ( not ( = ?auto_247711 ?auto_247712 ) ) ( not ( = ?auto_247711 ?auto_247713 ) ) ( not ( = ?auto_247711 ?auto_247714 ) ) ( not ( = ?auto_247712 ?auto_247713 ) ) ( not ( = ?auto_247712 ?auto_247714 ) ) ( not ( = ?auto_247713 ?auto_247714 ) ) ( ON ?auto_247712 ?auto_247713 ) ( ON ?auto_247711 ?auto_247712 ) ( ON ?auto_247710 ?auto_247711 ) ( ON ?auto_247709 ?auto_247710 ) ( CLEAR ?auto_247707 ) ( ON ?auto_247708 ?auto_247709 ) ( CLEAR ?auto_247708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247707 ?auto_247708 )
      ( MAKE-7PILE ?auto_247707 ?auto_247708 ?auto_247709 ?auto_247710 ?auto_247711 ?auto_247712 ?auto_247713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247737 - BLOCK
      ?auto_247738 - BLOCK
      ?auto_247739 - BLOCK
      ?auto_247740 - BLOCK
      ?auto_247741 - BLOCK
      ?auto_247742 - BLOCK
      ?auto_247743 - BLOCK
    )
    :vars
    (
      ?auto_247744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247743 ?auto_247744 ) ( not ( = ?auto_247737 ?auto_247738 ) ) ( not ( = ?auto_247737 ?auto_247739 ) ) ( not ( = ?auto_247737 ?auto_247740 ) ) ( not ( = ?auto_247737 ?auto_247741 ) ) ( not ( = ?auto_247737 ?auto_247742 ) ) ( not ( = ?auto_247737 ?auto_247743 ) ) ( not ( = ?auto_247737 ?auto_247744 ) ) ( not ( = ?auto_247738 ?auto_247739 ) ) ( not ( = ?auto_247738 ?auto_247740 ) ) ( not ( = ?auto_247738 ?auto_247741 ) ) ( not ( = ?auto_247738 ?auto_247742 ) ) ( not ( = ?auto_247738 ?auto_247743 ) ) ( not ( = ?auto_247738 ?auto_247744 ) ) ( not ( = ?auto_247739 ?auto_247740 ) ) ( not ( = ?auto_247739 ?auto_247741 ) ) ( not ( = ?auto_247739 ?auto_247742 ) ) ( not ( = ?auto_247739 ?auto_247743 ) ) ( not ( = ?auto_247739 ?auto_247744 ) ) ( not ( = ?auto_247740 ?auto_247741 ) ) ( not ( = ?auto_247740 ?auto_247742 ) ) ( not ( = ?auto_247740 ?auto_247743 ) ) ( not ( = ?auto_247740 ?auto_247744 ) ) ( not ( = ?auto_247741 ?auto_247742 ) ) ( not ( = ?auto_247741 ?auto_247743 ) ) ( not ( = ?auto_247741 ?auto_247744 ) ) ( not ( = ?auto_247742 ?auto_247743 ) ) ( not ( = ?auto_247742 ?auto_247744 ) ) ( not ( = ?auto_247743 ?auto_247744 ) ) ( ON ?auto_247742 ?auto_247743 ) ( ON ?auto_247741 ?auto_247742 ) ( ON ?auto_247740 ?auto_247741 ) ( ON ?auto_247739 ?auto_247740 ) ( ON ?auto_247738 ?auto_247739 ) ( ON ?auto_247737 ?auto_247738 ) ( CLEAR ?auto_247737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247737 )
      ( MAKE-7PILE ?auto_247737 ?auto_247738 ?auto_247739 ?auto_247740 ?auto_247741 ?auto_247742 ?auto_247743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247768 - BLOCK
      ?auto_247769 - BLOCK
      ?auto_247770 - BLOCK
      ?auto_247771 - BLOCK
      ?auto_247772 - BLOCK
      ?auto_247773 - BLOCK
      ?auto_247774 - BLOCK
      ?auto_247775 - BLOCK
    )
    :vars
    (
      ?auto_247776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247774 ) ( ON ?auto_247775 ?auto_247776 ) ( CLEAR ?auto_247775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247768 ) ( ON ?auto_247769 ?auto_247768 ) ( ON ?auto_247770 ?auto_247769 ) ( ON ?auto_247771 ?auto_247770 ) ( ON ?auto_247772 ?auto_247771 ) ( ON ?auto_247773 ?auto_247772 ) ( ON ?auto_247774 ?auto_247773 ) ( not ( = ?auto_247768 ?auto_247769 ) ) ( not ( = ?auto_247768 ?auto_247770 ) ) ( not ( = ?auto_247768 ?auto_247771 ) ) ( not ( = ?auto_247768 ?auto_247772 ) ) ( not ( = ?auto_247768 ?auto_247773 ) ) ( not ( = ?auto_247768 ?auto_247774 ) ) ( not ( = ?auto_247768 ?auto_247775 ) ) ( not ( = ?auto_247768 ?auto_247776 ) ) ( not ( = ?auto_247769 ?auto_247770 ) ) ( not ( = ?auto_247769 ?auto_247771 ) ) ( not ( = ?auto_247769 ?auto_247772 ) ) ( not ( = ?auto_247769 ?auto_247773 ) ) ( not ( = ?auto_247769 ?auto_247774 ) ) ( not ( = ?auto_247769 ?auto_247775 ) ) ( not ( = ?auto_247769 ?auto_247776 ) ) ( not ( = ?auto_247770 ?auto_247771 ) ) ( not ( = ?auto_247770 ?auto_247772 ) ) ( not ( = ?auto_247770 ?auto_247773 ) ) ( not ( = ?auto_247770 ?auto_247774 ) ) ( not ( = ?auto_247770 ?auto_247775 ) ) ( not ( = ?auto_247770 ?auto_247776 ) ) ( not ( = ?auto_247771 ?auto_247772 ) ) ( not ( = ?auto_247771 ?auto_247773 ) ) ( not ( = ?auto_247771 ?auto_247774 ) ) ( not ( = ?auto_247771 ?auto_247775 ) ) ( not ( = ?auto_247771 ?auto_247776 ) ) ( not ( = ?auto_247772 ?auto_247773 ) ) ( not ( = ?auto_247772 ?auto_247774 ) ) ( not ( = ?auto_247772 ?auto_247775 ) ) ( not ( = ?auto_247772 ?auto_247776 ) ) ( not ( = ?auto_247773 ?auto_247774 ) ) ( not ( = ?auto_247773 ?auto_247775 ) ) ( not ( = ?auto_247773 ?auto_247776 ) ) ( not ( = ?auto_247774 ?auto_247775 ) ) ( not ( = ?auto_247774 ?auto_247776 ) ) ( not ( = ?auto_247775 ?auto_247776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247775 ?auto_247776 )
      ( !STACK ?auto_247775 ?auto_247774 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247802 - BLOCK
      ?auto_247803 - BLOCK
      ?auto_247804 - BLOCK
      ?auto_247805 - BLOCK
      ?auto_247806 - BLOCK
      ?auto_247807 - BLOCK
      ?auto_247808 - BLOCK
      ?auto_247809 - BLOCK
    )
    :vars
    (
      ?auto_247810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247809 ?auto_247810 ) ( ON-TABLE ?auto_247802 ) ( ON ?auto_247803 ?auto_247802 ) ( ON ?auto_247804 ?auto_247803 ) ( ON ?auto_247805 ?auto_247804 ) ( ON ?auto_247806 ?auto_247805 ) ( ON ?auto_247807 ?auto_247806 ) ( not ( = ?auto_247802 ?auto_247803 ) ) ( not ( = ?auto_247802 ?auto_247804 ) ) ( not ( = ?auto_247802 ?auto_247805 ) ) ( not ( = ?auto_247802 ?auto_247806 ) ) ( not ( = ?auto_247802 ?auto_247807 ) ) ( not ( = ?auto_247802 ?auto_247808 ) ) ( not ( = ?auto_247802 ?auto_247809 ) ) ( not ( = ?auto_247802 ?auto_247810 ) ) ( not ( = ?auto_247803 ?auto_247804 ) ) ( not ( = ?auto_247803 ?auto_247805 ) ) ( not ( = ?auto_247803 ?auto_247806 ) ) ( not ( = ?auto_247803 ?auto_247807 ) ) ( not ( = ?auto_247803 ?auto_247808 ) ) ( not ( = ?auto_247803 ?auto_247809 ) ) ( not ( = ?auto_247803 ?auto_247810 ) ) ( not ( = ?auto_247804 ?auto_247805 ) ) ( not ( = ?auto_247804 ?auto_247806 ) ) ( not ( = ?auto_247804 ?auto_247807 ) ) ( not ( = ?auto_247804 ?auto_247808 ) ) ( not ( = ?auto_247804 ?auto_247809 ) ) ( not ( = ?auto_247804 ?auto_247810 ) ) ( not ( = ?auto_247805 ?auto_247806 ) ) ( not ( = ?auto_247805 ?auto_247807 ) ) ( not ( = ?auto_247805 ?auto_247808 ) ) ( not ( = ?auto_247805 ?auto_247809 ) ) ( not ( = ?auto_247805 ?auto_247810 ) ) ( not ( = ?auto_247806 ?auto_247807 ) ) ( not ( = ?auto_247806 ?auto_247808 ) ) ( not ( = ?auto_247806 ?auto_247809 ) ) ( not ( = ?auto_247806 ?auto_247810 ) ) ( not ( = ?auto_247807 ?auto_247808 ) ) ( not ( = ?auto_247807 ?auto_247809 ) ) ( not ( = ?auto_247807 ?auto_247810 ) ) ( not ( = ?auto_247808 ?auto_247809 ) ) ( not ( = ?auto_247808 ?auto_247810 ) ) ( not ( = ?auto_247809 ?auto_247810 ) ) ( CLEAR ?auto_247807 ) ( ON ?auto_247808 ?auto_247809 ) ( CLEAR ?auto_247808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_247802 ?auto_247803 ?auto_247804 ?auto_247805 ?auto_247806 ?auto_247807 ?auto_247808 )
      ( MAKE-8PILE ?auto_247802 ?auto_247803 ?auto_247804 ?auto_247805 ?auto_247806 ?auto_247807 ?auto_247808 ?auto_247809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247836 - BLOCK
      ?auto_247837 - BLOCK
      ?auto_247838 - BLOCK
      ?auto_247839 - BLOCK
      ?auto_247840 - BLOCK
      ?auto_247841 - BLOCK
      ?auto_247842 - BLOCK
      ?auto_247843 - BLOCK
    )
    :vars
    (
      ?auto_247844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247843 ?auto_247844 ) ( ON-TABLE ?auto_247836 ) ( ON ?auto_247837 ?auto_247836 ) ( ON ?auto_247838 ?auto_247837 ) ( ON ?auto_247839 ?auto_247838 ) ( ON ?auto_247840 ?auto_247839 ) ( not ( = ?auto_247836 ?auto_247837 ) ) ( not ( = ?auto_247836 ?auto_247838 ) ) ( not ( = ?auto_247836 ?auto_247839 ) ) ( not ( = ?auto_247836 ?auto_247840 ) ) ( not ( = ?auto_247836 ?auto_247841 ) ) ( not ( = ?auto_247836 ?auto_247842 ) ) ( not ( = ?auto_247836 ?auto_247843 ) ) ( not ( = ?auto_247836 ?auto_247844 ) ) ( not ( = ?auto_247837 ?auto_247838 ) ) ( not ( = ?auto_247837 ?auto_247839 ) ) ( not ( = ?auto_247837 ?auto_247840 ) ) ( not ( = ?auto_247837 ?auto_247841 ) ) ( not ( = ?auto_247837 ?auto_247842 ) ) ( not ( = ?auto_247837 ?auto_247843 ) ) ( not ( = ?auto_247837 ?auto_247844 ) ) ( not ( = ?auto_247838 ?auto_247839 ) ) ( not ( = ?auto_247838 ?auto_247840 ) ) ( not ( = ?auto_247838 ?auto_247841 ) ) ( not ( = ?auto_247838 ?auto_247842 ) ) ( not ( = ?auto_247838 ?auto_247843 ) ) ( not ( = ?auto_247838 ?auto_247844 ) ) ( not ( = ?auto_247839 ?auto_247840 ) ) ( not ( = ?auto_247839 ?auto_247841 ) ) ( not ( = ?auto_247839 ?auto_247842 ) ) ( not ( = ?auto_247839 ?auto_247843 ) ) ( not ( = ?auto_247839 ?auto_247844 ) ) ( not ( = ?auto_247840 ?auto_247841 ) ) ( not ( = ?auto_247840 ?auto_247842 ) ) ( not ( = ?auto_247840 ?auto_247843 ) ) ( not ( = ?auto_247840 ?auto_247844 ) ) ( not ( = ?auto_247841 ?auto_247842 ) ) ( not ( = ?auto_247841 ?auto_247843 ) ) ( not ( = ?auto_247841 ?auto_247844 ) ) ( not ( = ?auto_247842 ?auto_247843 ) ) ( not ( = ?auto_247842 ?auto_247844 ) ) ( not ( = ?auto_247843 ?auto_247844 ) ) ( ON ?auto_247842 ?auto_247843 ) ( CLEAR ?auto_247840 ) ( ON ?auto_247841 ?auto_247842 ) ( CLEAR ?auto_247841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247836 ?auto_247837 ?auto_247838 ?auto_247839 ?auto_247840 ?auto_247841 )
      ( MAKE-8PILE ?auto_247836 ?auto_247837 ?auto_247838 ?auto_247839 ?auto_247840 ?auto_247841 ?auto_247842 ?auto_247843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247870 - BLOCK
      ?auto_247871 - BLOCK
      ?auto_247872 - BLOCK
      ?auto_247873 - BLOCK
      ?auto_247874 - BLOCK
      ?auto_247875 - BLOCK
      ?auto_247876 - BLOCK
      ?auto_247877 - BLOCK
    )
    :vars
    (
      ?auto_247878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247877 ?auto_247878 ) ( ON-TABLE ?auto_247870 ) ( ON ?auto_247871 ?auto_247870 ) ( ON ?auto_247872 ?auto_247871 ) ( ON ?auto_247873 ?auto_247872 ) ( not ( = ?auto_247870 ?auto_247871 ) ) ( not ( = ?auto_247870 ?auto_247872 ) ) ( not ( = ?auto_247870 ?auto_247873 ) ) ( not ( = ?auto_247870 ?auto_247874 ) ) ( not ( = ?auto_247870 ?auto_247875 ) ) ( not ( = ?auto_247870 ?auto_247876 ) ) ( not ( = ?auto_247870 ?auto_247877 ) ) ( not ( = ?auto_247870 ?auto_247878 ) ) ( not ( = ?auto_247871 ?auto_247872 ) ) ( not ( = ?auto_247871 ?auto_247873 ) ) ( not ( = ?auto_247871 ?auto_247874 ) ) ( not ( = ?auto_247871 ?auto_247875 ) ) ( not ( = ?auto_247871 ?auto_247876 ) ) ( not ( = ?auto_247871 ?auto_247877 ) ) ( not ( = ?auto_247871 ?auto_247878 ) ) ( not ( = ?auto_247872 ?auto_247873 ) ) ( not ( = ?auto_247872 ?auto_247874 ) ) ( not ( = ?auto_247872 ?auto_247875 ) ) ( not ( = ?auto_247872 ?auto_247876 ) ) ( not ( = ?auto_247872 ?auto_247877 ) ) ( not ( = ?auto_247872 ?auto_247878 ) ) ( not ( = ?auto_247873 ?auto_247874 ) ) ( not ( = ?auto_247873 ?auto_247875 ) ) ( not ( = ?auto_247873 ?auto_247876 ) ) ( not ( = ?auto_247873 ?auto_247877 ) ) ( not ( = ?auto_247873 ?auto_247878 ) ) ( not ( = ?auto_247874 ?auto_247875 ) ) ( not ( = ?auto_247874 ?auto_247876 ) ) ( not ( = ?auto_247874 ?auto_247877 ) ) ( not ( = ?auto_247874 ?auto_247878 ) ) ( not ( = ?auto_247875 ?auto_247876 ) ) ( not ( = ?auto_247875 ?auto_247877 ) ) ( not ( = ?auto_247875 ?auto_247878 ) ) ( not ( = ?auto_247876 ?auto_247877 ) ) ( not ( = ?auto_247876 ?auto_247878 ) ) ( not ( = ?auto_247877 ?auto_247878 ) ) ( ON ?auto_247876 ?auto_247877 ) ( ON ?auto_247875 ?auto_247876 ) ( CLEAR ?auto_247873 ) ( ON ?auto_247874 ?auto_247875 ) ( CLEAR ?auto_247874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247870 ?auto_247871 ?auto_247872 ?auto_247873 ?auto_247874 )
      ( MAKE-8PILE ?auto_247870 ?auto_247871 ?auto_247872 ?auto_247873 ?auto_247874 ?auto_247875 ?auto_247876 ?auto_247877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247904 - BLOCK
      ?auto_247905 - BLOCK
      ?auto_247906 - BLOCK
      ?auto_247907 - BLOCK
      ?auto_247908 - BLOCK
      ?auto_247909 - BLOCK
      ?auto_247910 - BLOCK
      ?auto_247911 - BLOCK
    )
    :vars
    (
      ?auto_247912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247911 ?auto_247912 ) ( ON-TABLE ?auto_247904 ) ( ON ?auto_247905 ?auto_247904 ) ( ON ?auto_247906 ?auto_247905 ) ( not ( = ?auto_247904 ?auto_247905 ) ) ( not ( = ?auto_247904 ?auto_247906 ) ) ( not ( = ?auto_247904 ?auto_247907 ) ) ( not ( = ?auto_247904 ?auto_247908 ) ) ( not ( = ?auto_247904 ?auto_247909 ) ) ( not ( = ?auto_247904 ?auto_247910 ) ) ( not ( = ?auto_247904 ?auto_247911 ) ) ( not ( = ?auto_247904 ?auto_247912 ) ) ( not ( = ?auto_247905 ?auto_247906 ) ) ( not ( = ?auto_247905 ?auto_247907 ) ) ( not ( = ?auto_247905 ?auto_247908 ) ) ( not ( = ?auto_247905 ?auto_247909 ) ) ( not ( = ?auto_247905 ?auto_247910 ) ) ( not ( = ?auto_247905 ?auto_247911 ) ) ( not ( = ?auto_247905 ?auto_247912 ) ) ( not ( = ?auto_247906 ?auto_247907 ) ) ( not ( = ?auto_247906 ?auto_247908 ) ) ( not ( = ?auto_247906 ?auto_247909 ) ) ( not ( = ?auto_247906 ?auto_247910 ) ) ( not ( = ?auto_247906 ?auto_247911 ) ) ( not ( = ?auto_247906 ?auto_247912 ) ) ( not ( = ?auto_247907 ?auto_247908 ) ) ( not ( = ?auto_247907 ?auto_247909 ) ) ( not ( = ?auto_247907 ?auto_247910 ) ) ( not ( = ?auto_247907 ?auto_247911 ) ) ( not ( = ?auto_247907 ?auto_247912 ) ) ( not ( = ?auto_247908 ?auto_247909 ) ) ( not ( = ?auto_247908 ?auto_247910 ) ) ( not ( = ?auto_247908 ?auto_247911 ) ) ( not ( = ?auto_247908 ?auto_247912 ) ) ( not ( = ?auto_247909 ?auto_247910 ) ) ( not ( = ?auto_247909 ?auto_247911 ) ) ( not ( = ?auto_247909 ?auto_247912 ) ) ( not ( = ?auto_247910 ?auto_247911 ) ) ( not ( = ?auto_247910 ?auto_247912 ) ) ( not ( = ?auto_247911 ?auto_247912 ) ) ( ON ?auto_247910 ?auto_247911 ) ( ON ?auto_247909 ?auto_247910 ) ( ON ?auto_247908 ?auto_247909 ) ( CLEAR ?auto_247906 ) ( ON ?auto_247907 ?auto_247908 ) ( CLEAR ?auto_247907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247904 ?auto_247905 ?auto_247906 ?auto_247907 )
      ( MAKE-8PILE ?auto_247904 ?auto_247905 ?auto_247906 ?auto_247907 ?auto_247908 ?auto_247909 ?auto_247910 ?auto_247911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247938 - BLOCK
      ?auto_247939 - BLOCK
      ?auto_247940 - BLOCK
      ?auto_247941 - BLOCK
      ?auto_247942 - BLOCK
      ?auto_247943 - BLOCK
      ?auto_247944 - BLOCK
      ?auto_247945 - BLOCK
    )
    :vars
    (
      ?auto_247946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247945 ?auto_247946 ) ( ON-TABLE ?auto_247938 ) ( ON ?auto_247939 ?auto_247938 ) ( not ( = ?auto_247938 ?auto_247939 ) ) ( not ( = ?auto_247938 ?auto_247940 ) ) ( not ( = ?auto_247938 ?auto_247941 ) ) ( not ( = ?auto_247938 ?auto_247942 ) ) ( not ( = ?auto_247938 ?auto_247943 ) ) ( not ( = ?auto_247938 ?auto_247944 ) ) ( not ( = ?auto_247938 ?auto_247945 ) ) ( not ( = ?auto_247938 ?auto_247946 ) ) ( not ( = ?auto_247939 ?auto_247940 ) ) ( not ( = ?auto_247939 ?auto_247941 ) ) ( not ( = ?auto_247939 ?auto_247942 ) ) ( not ( = ?auto_247939 ?auto_247943 ) ) ( not ( = ?auto_247939 ?auto_247944 ) ) ( not ( = ?auto_247939 ?auto_247945 ) ) ( not ( = ?auto_247939 ?auto_247946 ) ) ( not ( = ?auto_247940 ?auto_247941 ) ) ( not ( = ?auto_247940 ?auto_247942 ) ) ( not ( = ?auto_247940 ?auto_247943 ) ) ( not ( = ?auto_247940 ?auto_247944 ) ) ( not ( = ?auto_247940 ?auto_247945 ) ) ( not ( = ?auto_247940 ?auto_247946 ) ) ( not ( = ?auto_247941 ?auto_247942 ) ) ( not ( = ?auto_247941 ?auto_247943 ) ) ( not ( = ?auto_247941 ?auto_247944 ) ) ( not ( = ?auto_247941 ?auto_247945 ) ) ( not ( = ?auto_247941 ?auto_247946 ) ) ( not ( = ?auto_247942 ?auto_247943 ) ) ( not ( = ?auto_247942 ?auto_247944 ) ) ( not ( = ?auto_247942 ?auto_247945 ) ) ( not ( = ?auto_247942 ?auto_247946 ) ) ( not ( = ?auto_247943 ?auto_247944 ) ) ( not ( = ?auto_247943 ?auto_247945 ) ) ( not ( = ?auto_247943 ?auto_247946 ) ) ( not ( = ?auto_247944 ?auto_247945 ) ) ( not ( = ?auto_247944 ?auto_247946 ) ) ( not ( = ?auto_247945 ?auto_247946 ) ) ( ON ?auto_247944 ?auto_247945 ) ( ON ?auto_247943 ?auto_247944 ) ( ON ?auto_247942 ?auto_247943 ) ( ON ?auto_247941 ?auto_247942 ) ( CLEAR ?auto_247939 ) ( ON ?auto_247940 ?auto_247941 ) ( CLEAR ?auto_247940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247938 ?auto_247939 ?auto_247940 )
      ( MAKE-8PILE ?auto_247938 ?auto_247939 ?auto_247940 ?auto_247941 ?auto_247942 ?auto_247943 ?auto_247944 ?auto_247945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247972 - BLOCK
      ?auto_247973 - BLOCK
      ?auto_247974 - BLOCK
      ?auto_247975 - BLOCK
      ?auto_247976 - BLOCK
      ?auto_247977 - BLOCK
      ?auto_247978 - BLOCK
      ?auto_247979 - BLOCK
    )
    :vars
    (
      ?auto_247980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247979 ?auto_247980 ) ( ON-TABLE ?auto_247972 ) ( not ( = ?auto_247972 ?auto_247973 ) ) ( not ( = ?auto_247972 ?auto_247974 ) ) ( not ( = ?auto_247972 ?auto_247975 ) ) ( not ( = ?auto_247972 ?auto_247976 ) ) ( not ( = ?auto_247972 ?auto_247977 ) ) ( not ( = ?auto_247972 ?auto_247978 ) ) ( not ( = ?auto_247972 ?auto_247979 ) ) ( not ( = ?auto_247972 ?auto_247980 ) ) ( not ( = ?auto_247973 ?auto_247974 ) ) ( not ( = ?auto_247973 ?auto_247975 ) ) ( not ( = ?auto_247973 ?auto_247976 ) ) ( not ( = ?auto_247973 ?auto_247977 ) ) ( not ( = ?auto_247973 ?auto_247978 ) ) ( not ( = ?auto_247973 ?auto_247979 ) ) ( not ( = ?auto_247973 ?auto_247980 ) ) ( not ( = ?auto_247974 ?auto_247975 ) ) ( not ( = ?auto_247974 ?auto_247976 ) ) ( not ( = ?auto_247974 ?auto_247977 ) ) ( not ( = ?auto_247974 ?auto_247978 ) ) ( not ( = ?auto_247974 ?auto_247979 ) ) ( not ( = ?auto_247974 ?auto_247980 ) ) ( not ( = ?auto_247975 ?auto_247976 ) ) ( not ( = ?auto_247975 ?auto_247977 ) ) ( not ( = ?auto_247975 ?auto_247978 ) ) ( not ( = ?auto_247975 ?auto_247979 ) ) ( not ( = ?auto_247975 ?auto_247980 ) ) ( not ( = ?auto_247976 ?auto_247977 ) ) ( not ( = ?auto_247976 ?auto_247978 ) ) ( not ( = ?auto_247976 ?auto_247979 ) ) ( not ( = ?auto_247976 ?auto_247980 ) ) ( not ( = ?auto_247977 ?auto_247978 ) ) ( not ( = ?auto_247977 ?auto_247979 ) ) ( not ( = ?auto_247977 ?auto_247980 ) ) ( not ( = ?auto_247978 ?auto_247979 ) ) ( not ( = ?auto_247978 ?auto_247980 ) ) ( not ( = ?auto_247979 ?auto_247980 ) ) ( ON ?auto_247978 ?auto_247979 ) ( ON ?auto_247977 ?auto_247978 ) ( ON ?auto_247976 ?auto_247977 ) ( ON ?auto_247975 ?auto_247976 ) ( ON ?auto_247974 ?auto_247975 ) ( CLEAR ?auto_247972 ) ( ON ?auto_247973 ?auto_247974 ) ( CLEAR ?auto_247973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247972 ?auto_247973 )
      ( MAKE-8PILE ?auto_247972 ?auto_247973 ?auto_247974 ?auto_247975 ?auto_247976 ?auto_247977 ?auto_247978 ?auto_247979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_248006 - BLOCK
      ?auto_248007 - BLOCK
      ?auto_248008 - BLOCK
      ?auto_248009 - BLOCK
      ?auto_248010 - BLOCK
      ?auto_248011 - BLOCK
      ?auto_248012 - BLOCK
      ?auto_248013 - BLOCK
    )
    :vars
    (
      ?auto_248014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248013 ?auto_248014 ) ( not ( = ?auto_248006 ?auto_248007 ) ) ( not ( = ?auto_248006 ?auto_248008 ) ) ( not ( = ?auto_248006 ?auto_248009 ) ) ( not ( = ?auto_248006 ?auto_248010 ) ) ( not ( = ?auto_248006 ?auto_248011 ) ) ( not ( = ?auto_248006 ?auto_248012 ) ) ( not ( = ?auto_248006 ?auto_248013 ) ) ( not ( = ?auto_248006 ?auto_248014 ) ) ( not ( = ?auto_248007 ?auto_248008 ) ) ( not ( = ?auto_248007 ?auto_248009 ) ) ( not ( = ?auto_248007 ?auto_248010 ) ) ( not ( = ?auto_248007 ?auto_248011 ) ) ( not ( = ?auto_248007 ?auto_248012 ) ) ( not ( = ?auto_248007 ?auto_248013 ) ) ( not ( = ?auto_248007 ?auto_248014 ) ) ( not ( = ?auto_248008 ?auto_248009 ) ) ( not ( = ?auto_248008 ?auto_248010 ) ) ( not ( = ?auto_248008 ?auto_248011 ) ) ( not ( = ?auto_248008 ?auto_248012 ) ) ( not ( = ?auto_248008 ?auto_248013 ) ) ( not ( = ?auto_248008 ?auto_248014 ) ) ( not ( = ?auto_248009 ?auto_248010 ) ) ( not ( = ?auto_248009 ?auto_248011 ) ) ( not ( = ?auto_248009 ?auto_248012 ) ) ( not ( = ?auto_248009 ?auto_248013 ) ) ( not ( = ?auto_248009 ?auto_248014 ) ) ( not ( = ?auto_248010 ?auto_248011 ) ) ( not ( = ?auto_248010 ?auto_248012 ) ) ( not ( = ?auto_248010 ?auto_248013 ) ) ( not ( = ?auto_248010 ?auto_248014 ) ) ( not ( = ?auto_248011 ?auto_248012 ) ) ( not ( = ?auto_248011 ?auto_248013 ) ) ( not ( = ?auto_248011 ?auto_248014 ) ) ( not ( = ?auto_248012 ?auto_248013 ) ) ( not ( = ?auto_248012 ?auto_248014 ) ) ( not ( = ?auto_248013 ?auto_248014 ) ) ( ON ?auto_248012 ?auto_248013 ) ( ON ?auto_248011 ?auto_248012 ) ( ON ?auto_248010 ?auto_248011 ) ( ON ?auto_248009 ?auto_248010 ) ( ON ?auto_248008 ?auto_248009 ) ( ON ?auto_248007 ?auto_248008 ) ( ON ?auto_248006 ?auto_248007 ) ( CLEAR ?auto_248006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248006 )
      ( MAKE-8PILE ?auto_248006 ?auto_248007 ?auto_248008 ?auto_248009 ?auto_248010 ?auto_248011 ?auto_248012 ?auto_248013 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248041 - BLOCK
      ?auto_248042 - BLOCK
      ?auto_248043 - BLOCK
      ?auto_248044 - BLOCK
      ?auto_248045 - BLOCK
      ?auto_248046 - BLOCK
      ?auto_248047 - BLOCK
      ?auto_248048 - BLOCK
      ?auto_248049 - BLOCK
    )
    :vars
    (
      ?auto_248050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248048 ) ( ON ?auto_248049 ?auto_248050 ) ( CLEAR ?auto_248049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248041 ) ( ON ?auto_248042 ?auto_248041 ) ( ON ?auto_248043 ?auto_248042 ) ( ON ?auto_248044 ?auto_248043 ) ( ON ?auto_248045 ?auto_248044 ) ( ON ?auto_248046 ?auto_248045 ) ( ON ?auto_248047 ?auto_248046 ) ( ON ?auto_248048 ?auto_248047 ) ( not ( = ?auto_248041 ?auto_248042 ) ) ( not ( = ?auto_248041 ?auto_248043 ) ) ( not ( = ?auto_248041 ?auto_248044 ) ) ( not ( = ?auto_248041 ?auto_248045 ) ) ( not ( = ?auto_248041 ?auto_248046 ) ) ( not ( = ?auto_248041 ?auto_248047 ) ) ( not ( = ?auto_248041 ?auto_248048 ) ) ( not ( = ?auto_248041 ?auto_248049 ) ) ( not ( = ?auto_248041 ?auto_248050 ) ) ( not ( = ?auto_248042 ?auto_248043 ) ) ( not ( = ?auto_248042 ?auto_248044 ) ) ( not ( = ?auto_248042 ?auto_248045 ) ) ( not ( = ?auto_248042 ?auto_248046 ) ) ( not ( = ?auto_248042 ?auto_248047 ) ) ( not ( = ?auto_248042 ?auto_248048 ) ) ( not ( = ?auto_248042 ?auto_248049 ) ) ( not ( = ?auto_248042 ?auto_248050 ) ) ( not ( = ?auto_248043 ?auto_248044 ) ) ( not ( = ?auto_248043 ?auto_248045 ) ) ( not ( = ?auto_248043 ?auto_248046 ) ) ( not ( = ?auto_248043 ?auto_248047 ) ) ( not ( = ?auto_248043 ?auto_248048 ) ) ( not ( = ?auto_248043 ?auto_248049 ) ) ( not ( = ?auto_248043 ?auto_248050 ) ) ( not ( = ?auto_248044 ?auto_248045 ) ) ( not ( = ?auto_248044 ?auto_248046 ) ) ( not ( = ?auto_248044 ?auto_248047 ) ) ( not ( = ?auto_248044 ?auto_248048 ) ) ( not ( = ?auto_248044 ?auto_248049 ) ) ( not ( = ?auto_248044 ?auto_248050 ) ) ( not ( = ?auto_248045 ?auto_248046 ) ) ( not ( = ?auto_248045 ?auto_248047 ) ) ( not ( = ?auto_248045 ?auto_248048 ) ) ( not ( = ?auto_248045 ?auto_248049 ) ) ( not ( = ?auto_248045 ?auto_248050 ) ) ( not ( = ?auto_248046 ?auto_248047 ) ) ( not ( = ?auto_248046 ?auto_248048 ) ) ( not ( = ?auto_248046 ?auto_248049 ) ) ( not ( = ?auto_248046 ?auto_248050 ) ) ( not ( = ?auto_248047 ?auto_248048 ) ) ( not ( = ?auto_248047 ?auto_248049 ) ) ( not ( = ?auto_248047 ?auto_248050 ) ) ( not ( = ?auto_248048 ?auto_248049 ) ) ( not ( = ?auto_248048 ?auto_248050 ) ) ( not ( = ?auto_248049 ?auto_248050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248049 ?auto_248050 )
      ( !STACK ?auto_248049 ?auto_248048 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248079 - BLOCK
      ?auto_248080 - BLOCK
      ?auto_248081 - BLOCK
      ?auto_248082 - BLOCK
      ?auto_248083 - BLOCK
      ?auto_248084 - BLOCK
      ?auto_248085 - BLOCK
      ?auto_248086 - BLOCK
      ?auto_248087 - BLOCK
    )
    :vars
    (
      ?auto_248088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248087 ?auto_248088 ) ( ON-TABLE ?auto_248079 ) ( ON ?auto_248080 ?auto_248079 ) ( ON ?auto_248081 ?auto_248080 ) ( ON ?auto_248082 ?auto_248081 ) ( ON ?auto_248083 ?auto_248082 ) ( ON ?auto_248084 ?auto_248083 ) ( ON ?auto_248085 ?auto_248084 ) ( not ( = ?auto_248079 ?auto_248080 ) ) ( not ( = ?auto_248079 ?auto_248081 ) ) ( not ( = ?auto_248079 ?auto_248082 ) ) ( not ( = ?auto_248079 ?auto_248083 ) ) ( not ( = ?auto_248079 ?auto_248084 ) ) ( not ( = ?auto_248079 ?auto_248085 ) ) ( not ( = ?auto_248079 ?auto_248086 ) ) ( not ( = ?auto_248079 ?auto_248087 ) ) ( not ( = ?auto_248079 ?auto_248088 ) ) ( not ( = ?auto_248080 ?auto_248081 ) ) ( not ( = ?auto_248080 ?auto_248082 ) ) ( not ( = ?auto_248080 ?auto_248083 ) ) ( not ( = ?auto_248080 ?auto_248084 ) ) ( not ( = ?auto_248080 ?auto_248085 ) ) ( not ( = ?auto_248080 ?auto_248086 ) ) ( not ( = ?auto_248080 ?auto_248087 ) ) ( not ( = ?auto_248080 ?auto_248088 ) ) ( not ( = ?auto_248081 ?auto_248082 ) ) ( not ( = ?auto_248081 ?auto_248083 ) ) ( not ( = ?auto_248081 ?auto_248084 ) ) ( not ( = ?auto_248081 ?auto_248085 ) ) ( not ( = ?auto_248081 ?auto_248086 ) ) ( not ( = ?auto_248081 ?auto_248087 ) ) ( not ( = ?auto_248081 ?auto_248088 ) ) ( not ( = ?auto_248082 ?auto_248083 ) ) ( not ( = ?auto_248082 ?auto_248084 ) ) ( not ( = ?auto_248082 ?auto_248085 ) ) ( not ( = ?auto_248082 ?auto_248086 ) ) ( not ( = ?auto_248082 ?auto_248087 ) ) ( not ( = ?auto_248082 ?auto_248088 ) ) ( not ( = ?auto_248083 ?auto_248084 ) ) ( not ( = ?auto_248083 ?auto_248085 ) ) ( not ( = ?auto_248083 ?auto_248086 ) ) ( not ( = ?auto_248083 ?auto_248087 ) ) ( not ( = ?auto_248083 ?auto_248088 ) ) ( not ( = ?auto_248084 ?auto_248085 ) ) ( not ( = ?auto_248084 ?auto_248086 ) ) ( not ( = ?auto_248084 ?auto_248087 ) ) ( not ( = ?auto_248084 ?auto_248088 ) ) ( not ( = ?auto_248085 ?auto_248086 ) ) ( not ( = ?auto_248085 ?auto_248087 ) ) ( not ( = ?auto_248085 ?auto_248088 ) ) ( not ( = ?auto_248086 ?auto_248087 ) ) ( not ( = ?auto_248086 ?auto_248088 ) ) ( not ( = ?auto_248087 ?auto_248088 ) ) ( CLEAR ?auto_248085 ) ( ON ?auto_248086 ?auto_248087 ) ( CLEAR ?auto_248086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248079 ?auto_248080 ?auto_248081 ?auto_248082 ?auto_248083 ?auto_248084 ?auto_248085 ?auto_248086 )
      ( MAKE-9PILE ?auto_248079 ?auto_248080 ?auto_248081 ?auto_248082 ?auto_248083 ?auto_248084 ?auto_248085 ?auto_248086 ?auto_248087 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248117 - BLOCK
      ?auto_248118 - BLOCK
      ?auto_248119 - BLOCK
      ?auto_248120 - BLOCK
      ?auto_248121 - BLOCK
      ?auto_248122 - BLOCK
      ?auto_248123 - BLOCK
      ?auto_248124 - BLOCK
      ?auto_248125 - BLOCK
    )
    :vars
    (
      ?auto_248126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248125 ?auto_248126 ) ( ON-TABLE ?auto_248117 ) ( ON ?auto_248118 ?auto_248117 ) ( ON ?auto_248119 ?auto_248118 ) ( ON ?auto_248120 ?auto_248119 ) ( ON ?auto_248121 ?auto_248120 ) ( ON ?auto_248122 ?auto_248121 ) ( not ( = ?auto_248117 ?auto_248118 ) ) ( not ( = ?auto_248117 ?auto_248119 ) ) ( not ( = ?auto_248117 ?auto_248120 ) ) ( not ( = ?auto_248117 ?auto_248121 ) ) ( not ( = ?auto_248117 ?auto_248122 ) ) ( not ( = ?auto_248117 ?auto_248123 ) ) ( not ( = ?auto_248117 ?auto_248124 ) ) ( not ( = ?auto_248117 ?auto_248125 ) ) ( not ( = ?auto_248117 ?auto_248126 ) ) ( not ( = ?auto_248118 ?auto_248119 ) ) ( not ( = ?auto_248118 ?auto_248120 ) ) ( not ( = ?auto_248118 ?auto_248121 ) ) ( not ( = ?auto_248118 ?auto_248122 ) ) ( not ( = ?auto_248118 ?auto_248123 ) ) ( not ( = ?auto_248118 ?auto_248124 ) ) ( not ( = ?auto_248118 ?auto_248125 ) ) ( not ( = ?auto_248118 ?auto_248126 ) ) ( not ( = ?auto_248119 ?auto_248120 ) ) ( not ( = ?auto_248119 ?auto_248121 ) ) ( not ( = ?auto_248119 ?auto_248122 ) ) ( not ( = ?auto_248119 ?auto_248123 ) ) ( not ( = ?auto_248119 ?auto_248124 ) ) ( not ( = ?auto_248119 ?auto_248125 ) ) ( not ( = ?auto_248119 ?auto_248126 ) ) ( not ( = ?auto_248120 ?auto_248121 ) ) ( not ( = ?auto_248120 ?auto_248122 ) ) ( not ( = ?auto_248120 ?auto_248123 ) ) ( not ( = ?auto_248120 ?auto_248124 ) ) ( not ( = ?auto_248120 ?auto_248125 ) ) ( not ( = ?auto_248120 ?auto_248126 ) ) ( not ( = ?auto_248121 ?auto_248122 ) ) ( not ( = ?auto_248121 ?auto_248123 ) ) ( not ( = ?auto_248121 ?auto_248124 ) ) ( not ( = ?auto_248121 ?auto_248125 ) ) ( not ( = ?auto_248121 ?auto_248126 ) ) ( not ( = ?auto_248122 ?auto_248123 ) ) ( not ( = ?auto_248122 ?auto_248124 ) ) ( not ( = ?auto_248122 ?auto_248125 ) ) ( not ( = ?auto_248122 ?auto_248126 ) ) ( not ( = ?auto_248123 ?auto_248124 ) ) ( not ( = ?auto_248123 ?auto_248125 ) ) ( not ( = ?auto_248123 ?auto_248126 ) ) ( not ( = ?auto_248124 ?auto_248125 ) ) ( not ( = ?auto_248124 ?auto_248126 ) ) ( not ( = ?auto_248125 ?auto_248126 ) ) ( ON ?auto_248124 ?auto_248125 ) ( CLEAR ?auto_248122 ) ( ON ?auto_248123 ?auto_248124 ) ( CLEAR ?auto_248123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248117 ?auto_248118 ?auto_248119 ?auto_248120 ?auto_248121 ?auto_248122 ?auto_248123 )
      ( MAKE-9PILE ?auto_248117 ?auto_248118 ?auto_248119 ?auto_248120 ?auto_248121 ?auto_248122 ?auto_248123 ?auto_248124 ?auto_248125 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248155 - BLOCK
      ?auto_248156 - BLOCK
      ?auto_248157 - BLOCK
      ?auto_248158 - BLOCK
      ?auto_248159 - BLOCK
      ?auto_248160 - BLOCK
      ?auto_248161 - BLOCK
      ?auto_248162 - BLOCK
      ?auto_248163 - BLOCK
    )
    :vars
    (
      ?auto_248164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248163 ?auto_248164 ) ( ON-TABLE ?auto_248155 ) ( ON ?auto_248156 ?auto_248155 ) ( ON ?auto_248157 ?auto_248156 ) ( ON ?auto_248158 ?auto_248157 ) ( ON ?auto_248159 ?auto_248158 ) ( not ( = ?auto_248155 ?auto_248156 ) ) ( not ( = ?auto_248155 ?auto_248157 ) ) ( not ( = ?auto_248155 ?auto_248158 ) ) ( not ( = ?auto_248155 ?auto_248159 ) ) ( not ( = ?auto_248155 ?auto_248160 ) ) ( not ( = ?auto_248155 ?auto_248161 ) ) ( not ( = ?auto_248155 ?auto_248162 ) ) ( not ( = ?auto_248155 ?auto_248163 ) ) ( not ( = ?auto_248155 ?auto_248164 ) ) ( not ( = ?auto_248156 ?auto_248157 ) ) ( not ( = ?auto_248156 ?auto_248158 ) ) ( not ( = ?auto_248156 ?auto_248159 ) ) ( not ( = ?auto_248156 ?auto_248160 ) ) ( not ( = ?auto_248156 ?auto_248161 ) ) ( not ( = ?auto_248156 ?auto_248162 ) ) ( not ( = ?auto_248156 ?auto_248163 ) ) ( not ( = ?auto_248156 ?auto_248164 ) ) ( not ( = ?auto_248157 ?auto_248158 ) ) ( not ( = ?auto_248157 ?auto_248159 ) ) ( not ( = ?auto_248157 ?auto_248160 ) ) ( not ( = ?auto_248157 ?auto_248161 ) ) ( not ( = ?auto_248157 ?auto_248162 ) ) ( not ( = ?auto_248157 ?auto_248163 ) ) ( not ( = ?auto_248157 ?auto_248164 ) ) ( not ( = ?auto_248158 ?auto_248159 ) ) ( not ( = ?auto_248158 ?auto_248160 ) ) ( not ( = ?auto_248158 ?auto_248161 ) ) ( not ( = ?auto_248158 ?auto_248162 ) ) ( not ( = ?auto_248158 ?auto_248163 ) ) ( not ( = ?auto_248158 ?auto_248164 ) ) ( not ( = ?auto_248159 ?auto_248160 ) ) ( not ( = ?auto_248159 ?auto_248161 ) ) ( not ( = ?auto_248159 ?auto_248162 ) ) ( not ( = ?auto_248159 ?auto_248163 ) ) ( not ( = ?auto_248159 ?auto_248164 ) ) ( not ( = ?auto_248160 ?auto_248161 ) ) ( not ( = ?auto_248160 ?auto_248162 ) ) ( not ( = ?auto_248160 ?auto_248163 ) ) ( not ( = ?auto_248160 ?auto_248164 ) ) ( not ( = ?auto_248161 ?auto_248162 ) ) ( not ( = ?auto_248161 ?auto_248163 ) ) ( not ( = ?auto_248161 ?auto_248164 ) ) ( not ( = ?auto_248162 ?auto_248163 ) ) ( not ( = ?auto_248162 ?auto_248164 ) ) ( not ( = ?auto_248163 ?auto_248164 ) ) ( ON ?auto_248162 ?auto_248163 ) ( ON ?auto_248161 ?auto_248162 ) ( CLEAR ?auto_248159 ) ( ON ?auto_248160 ?auto_248161 ) ( CLEAR ?auto_248160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248155 ?auto_248156 ?auto_248157 ?auto_248158 ?auto_248159 ?auto_248160 )
      ( MAKE-9PILE ?auto_248155 ?auto_248156 ?auto_248157 ?auto_248158 ?auto_248159 ?auto_248160 ?auto_248161 ?auto_248162 ?auto_248163 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248193 - BLOCK
      ?auto_248194 - BLOCK
      ?auto_248195 - BLOCK
      ?auto_248196 - BLOCK
      ?auto_248197 - BLOCK
      ?auto_248198 - BLOCK
      ?auto_248199 - BLOCK
      ?auto_248200 - BLOCK
      ?auto_248201 - BLOCK
    )
    :vars
    (
      ?auto_248202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248201 ?auto_248202 ) ( ON-TABLE ?auto_248193 ) ( ON ?auto_248194 ?auto_248193 ) ( ON ?auto_248195 ?auto_248194 ) ( ON ?auto_248196 ?auto_248195 ) ( not ( = ?auto_248193 ?auto_248194 ) ) ( not ( = ?auto_248193 ?auto_248195 ) ) ( not ( = ?auto_248193 ?auto_248196 ) ) ( not ( = ?auto_248193 ?auto_248197 ) ) ( not ( = ?auto_248193 ?auto_248198 ) ) ( not ( = ?auto_248193 ?auto_248199 ) ) ( not ( = ?auto_248193 ?auto_248200 ) ) ( not ( = ?auto_248193 ?auto_248201 ) ) ( not ( = ?auto_248193 ?auto_248202 ) ) ( not ( = ?auto_248194 ?auto_248195 ) ) ( not ( = ?auto_248194 ?auto_248196 ) ) ( not ( = ?auto_248194 ?auto_248197 ) ) ( not ( = ?auto_248194 ?auto_248198 ) ) ( not ( = ?auto_248194 ?auto_248199 ) ) ( not ( = ?auto_248194 ?auto_248200 ) ) ( not ( = ?auto_248194 ?auto_248201 ) ) ( not ( = ?auto_248194 ?auto_248202 ) ) ( not ( = ?auto_248195 ?auto_248196 ) ) ( not ( = ?auto_248195 ?auto_248197 ) ) ( not ( = ?auto_248195 ?auto_248198 ) ) ( not ( = ?auto_248195 ?auto_248199 ) ) ( not ( = ?auto_248195 ?auto_248200 ) ) ( not ( = ?auto_248195 ?auto_248201 ) ) ( not ( = ?auto_248195 ?auto_248202 ) ) ( not ( = ?auto_248196 ?auto_248197 ) ) ( not ( = ?auto_248196 ?auto_248198 ) ) ( not ( = ?auto_248196 ?auto_248199 ) ) ( not ( = ?auto_248196 ?auto_248200 ) ) ( not ( = ?auto_248196 ?auto_248201 ) ) ( not ( = ?auto_248196 ?auto_248202 ) ) ( not ( = ?auto_248197 ?auto_248198 ) ) ( not ( = ?auto_248197 ?auto_248199 ) ) ( not ( = ?auto_248197 ?auto_248200 ) ) ( not ( = ?auto_248197 ?auto_248201 ) ) ( not ( = ?auto_248197 ?auto_248202 ) ) ( not ( = ?auto_248198 ?auto_248199 ) ) ( not ( = ?auto_248198 ?auto_248200 ) ) ( not ( = ?auto_248198 ?auto_248201 ) ) ( not ( = ?auto_248198 ?auto_248202 ) ) ( not ( = ?auto_248199 ?auto_248200 ) ) ( not ( = ?auto_248199 ?auto_248201 ) ) ( not ( = ?auto_248199 ?auto_248202 ) ) ( not ( = ?auto_248200 ?auto_248201 ) ) ( not ( = ?auto_248200 ?auto_248202 ) ) ( not ( = ?auto_248201 ?auto_248202 ) ) ( ON ?auto_248200 ?auto_248201 ) ( ON ?auto_248199 ?auto_248200 ) ( ON ?auto_248198 ?auto_248199 ) ( CLEAR ?auto_248196 ) ( ON ?auto_248197 ?auto_248198 ) ( CLEAR ?auto_248197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248193 ?auto_248194 ?auto_248195 ?auto_248196 ?auto_248197 )
      ( MAKE-9PILE ?auto_248193 ?auto_248194 ?auto_248195 ?auto_248196 ?auto_248197 ?auto_248198 ?auto_248199 ?auto_248200 ?auto_248201 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248231 - BLOCK
      ?auto_248232 - BLOCK
      ?auto_248233 - BLOCK
      ?auto_248234 - BLOCK
      ?auto_248235 - BLOCK
      ?auto_248236 - BLOCK
      ?auto_248237 - BLOCK
      ?auto_248238 - BLOCK
      ?auto_248239 - BLOCK
    )
    :vars
    (
      ?auto_248240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248239 ?auto_248240 ) ( ON-TABLE ?auto_248231 ) ( ON ?auto_248232 ?auto_248231 ) ( ON ?auto_248233 ?auto_248232 ) ( not ( = ?auto_248231 ?auto_248232 ) ) ( not ( = ?auto_248231 ?auto_248233 ) ) ( not ( = ?auto_248231 ?auto_248234 ) ) ( not ( = ?auto_248231 ?auto_248235 ) ) ( not ( = ?auto_248231 ?auto_248236 ) ) ( not ( = ?auto_248231 ?auto_248237 ) ) ( not ( = ?auto_248231 ?auto_248238 ) ) ( not ( = ?auto_248231 ?auto_248239 ) ) ( not ( = ?auto_248231 ?auto_248240 ) ) ( not ( = ?auto_248232 ?auto_248233 ) ) ( not ( = ?auto_248232 ?auto_248234 ) ) ( not ( = ?auto_248232 ?auto_248235 ) ) ( not ( = ?auto_248232 ?auto_248236 ) ) ( not ( = ?auto_248232 ?auto_248237 ) ) ( not ( = ?auto_248232 ?auto_248238 ) ) ( not ( = ?auto_248232 ?auto_248239 ) ) ( not ( = ?auto_248232 ?auto_248240 ) ) ( not ( = ?auto_248233 ?auto_248234 ) ) ( not ( = ?auto_248233 ?auto_248235 ) ) ( not ( = ?auto_248233 ?auto_248236 ) ) ( not ( = ?auto_248233 ?auto_248237 ) ) ( not ( = ?auto_248233 ?auto_248238 ) ) ( not ( = ?auto_248233 ?auto_248239 ) ) ( not ( = ?auto_248233 ?auto_248240 ) ) ( not ( = ?auto_248234 ?auto_248235 ) ) ( not ( = ?auto_248234 ?auto_248236 ) ) ( not ( = ?auto_248234 ?auto_248237 ) ) ( not ( = ?auto_248234 ?auto_248238 ) ) ( not ( = ?auto_248234 ?auto_248239 ) ) ( not ( = ?auto_248234 ?auto_248240 ) ) ( not ( = ?auto_248235 ?auto_248236 ) ) ( not ( = ?auto_248235 ?auto_248237 ) ) ( not ( = ?auto_248235 ?auto_248238 ) ) ( not ( = ?auto_248235 ?auto_248239 ) ) ( not ( = ?auto_248235 ?auto_248240 ) ) ( not ( = ?auto_248236 ?auto_248237 ) ) ( not ( = ?auto_248236 ?auto_248238 ) ) ( not ( = ?auto_248236 ?auto_248239 ) ) ( not ( = ?auto_248236 ?auto_248240 ) ) ( not ( = ?auto_248237 ?auto_248238 ) ) ( not ( = ?auto_248237 ?auto_248239 ) ) ( not ( = ?auto_248237 ?auto_248240 ) ) ( not ( = ?auto_248238 ?auto_248239 ) ) ( not ( = ?auto_248238 ?auto_248240 ) ) ( not ( = ?auto_248239 ?auto_248240 ) ) ( ON ?auto_248238 ?auto_248239 ) ( ON ?auto_248237 ?auto_248238 ) ( ON ?auto_248236 ?auto_248237 ) ( ON ?auto_248235 ?auto_248236 ) ( CLEAR ?auto_248233 ) ( ON ?auto_248234 ?auto_248235 ) ( CLEAR ?auto_248234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248231 ?auto_248232 ?auto_248233 ?auto_248234 )
      ( MAKE-9PILE ?auto_248231 ?auto_248232 ?auto_248233 ?auto_248234 ?auto_248235 ?auto_248236 ?auto_248237 ?auto_248238 ?auto_248239 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248269 - BLOCK
      ?auto_248270 - BLOCK
      ?auto_248271 - BLOCK
      ?auto_248272 - BLOCK
      ?auto_248273 - BLOCK
      ?auto_248274 - BLOCK
      ?auto_248275 - BLOCK
      ?auto_248276 - BLOCK
      ?auto_248277 - BLOCK
    )
    :vars
    (
      ?auto_248278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248277 ?auto_248278 ) ( ON-TABLE ?auto_248269 ) ( ON ?auto_248270 ?auto_248269 ) ( not ( = ?auto_248269 ?auto_248270 ) ) ( not ( = ?auto_248269 ?auto_248271 ) ) ( not ( = ?auto_248269 ?auto_248272 ) ) ( not ( = ?auto_248269 ?auto_248273 ) ) ( not ( = ?auto_248269 ?auto_248274 ) ) ( not ( = ?auto_248269 ?auto_248275 ) ) ( not ( = ?auto_248269 ?auto_248276 ) ) ( not ( = ?auto_248269 ?auto_248277 ) ) ( not ( = ?auto_248269 ?auto_248278 ) ) ( not ( = ?auto_248270 ?auto_248271 ) ) ( not ( = ?auto_248270 ?auto_248272 ) ) ( not ( = ?auto_248270 ?auto_248273 ) ) ( not ( = ?auto_248270 ?auto_248274 ) ) ( not ( = ?auto_248270 ?auto_248275 ) ) ( not ( = ?auto_248270 ?auto_248276 ) ) ( not ( = ?auto_248270 ?auto_248277 ) ) ( not ( = ?auto_248270 ?auto_248278 ) ) ( not ( = ?auto_248271 ?auto_248272 ) ) ( not ( = ?auto_248271 ?auto_248273 ) ) ( not ( = ?auto_248271 ?auto_248274 ) ) ( not ( = ?auto_248271 ?auto_248275 ) ) ( not ( = ?auto_248271 ?auto_248276 ) ) ( not ( = ?auto_248271 ?auto_248277 ) ) ( not ( = ?auto_248271 ?auto_248278 ) ) ( not ( = ?auto_248272 ?auto_248273 ) ) ( not ( = ?auto_248272 ?auto_248274 ) ) ( not ( = ?auto_248272 ?auto_248275 ) ) ( not ( = ?auto_248272 ?auto_248276 ) ) ( not ( = ?auto_248272 ?auto_248277 ) ) ( not ( = ?auto_248272 ?auto_248278 ) ) ( not ( = ?auto_248273 ?auto_248274 ) ) ( not ( = ?auto_248273 ?auto_248275 ) ) ( not ( = ?auto_248273 ?auto_248276 ) ) ( not ( = ?auto_248273 ?auto_248277 ) ) ( not ( = ?auto_248273 ?auto_248278 ) ) ( not ( = ?auto_248274 ?auto_248275 ) ) ( not ( = ?auto_248274 ?auto_248276 ) ) ( not ( = ?auto_248274 ?auto_248277 ) ) ( not ( = ?auto_248274 ?auto_248278 ) ) ( not ( = ?auto_248275 ?auto_248276 ) ) ( not ( = ?auto_248275 ?auto_248277 ) ) ( not ( = ?auto_248275 ?auto_248278 ) ) ( not ( = ?auto_248276 ?auto_248277 ) ) ( not ( = ?auto_248276 ?auto_248278 ) ) ( not ( = ?auto_248277 ?auto_248278 ) ) ( ON ?auto_248276 ?auto_248277 ) ( ON ?auto_248275 ?auto_248276 ) ( ON ?auto_248274 ?auto_248275 ) ( ON ?auto_248273 ?auto_248274 ) ( ON ?auto_248272 ?auto_248273 ) ( CLEAR ?auto_248270 ) ( ON ?auto_248271 ?auto_248272 ) ( CLEAR ?auto_248271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248269 ?auto_248270 ?auto_248271 )
      ( MAKE-9PILE ?auto_248269 ?auto_248270 ?auto_248271 ?auto_248272 ?auto_248273 ?auto_248274 ?auto_248275 ?auto_248276 ?auto_248277 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248307 - BLOCK
      ?auto_248308 - BLOCK
      ?auto_248309 - BLOCK
      ?auto_248310 - BLOCK
      ?auto_248311 - BLOCK
      ?auto_248312 - BLOCK
      ?auto_248313 - BLOCK
      ?auto_248314 - BLOCK
      ?auto_248315 - BLOCK
    )
    :vars
    (
      ?auto_248316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248315 ?auto_248316 ) ( ON-TABLE ?auto_248307 ) ( not ( = ?auto_248307 ?auto_248308 ) ) ( not ( = ?auto_248307 ?auto_248309 ) ) ( not ( = ?auto_248307 ?auto_248310 ) ) ( not ( = ?auto_248307 ?auto_248311 ) ) ( not ( = ?auto_248307 ?auto_248312 ) ) ( not ( = ?auto_248307 ?auto_248313 ) ) ( not ( = ?auto_248307 ?auto_248314 ) ) ( not ( = ?auto_248307 ?auto_248315 ) ) ( not ( = ?auto_248307 ?auto_248316 ) ) ( not ( = ?auto_248308 ?auto_248309 ) ) ( not ( = ?auto_248308 ?auto_248310 ) ) ( not ( = ?auto_248308 ?auto_248311 ) ) ( not ( = ?auto_248308 ?auto_248312 ) ) ( not ( = ?auto_248308 ?auto_248313 ) ) ( not ( = ?auto_248308 ?auto_248314 ) ) ( not ( = ?auto_248308 ?auto_248315 ) ) ( not ( = ?auto_248308 ?auto_248316 ) ) ( not ( = ?auto_248309 ?auto_248310 ) ) ( not ( = ?auto_248309 ?auto_248311 ) ) ( not ( = ?auto_248309 ?auto_248312 ) ) ( not ( = ?auto_248309 ?auto_248313 ) ) ( not ( = ?auto_248309 ?auto_248314 ) ) ( not ( = ?auto_248309 ?auto_248315 ) ) ( not ( = ?auto_248309 ?auto_248316 ) ) ( not ( = ?auto_248310 ?auto_248311 ) ) ( not ( = ?auto_248310 ?auto_248312 ) ) ( not ( = ?auto_248310 ?auto_248313 ) ) ( not ( = ?auto_248310 ?auto_248314 ) ) ( not ( = ?auto_248310 ?auto_248315 ) ) ( not ( = ?auto_248310 ?auto_248316 ) ) ( not ( = ?auto_248311 ?auto_248312 ) ) ( not ( = ?auto_248311 ?auto_248313 ) ) ( not ( = ?auto_248311 ?auto_248314 ) ) ( not ( = ?auto_248311 ?auto_248315 ) ) ( not ( = ?auto_248311 ?auto_248316 ) ) ( not ( = ?auto_248312 ?auto_248313 ) ) ( not ( = ?auto_248312 ?auto_248314 ) ) ( not ( = ?auto_248312 ?auto_248315 ) ) ( not ( = ?auto_248312 ?auto_248316 ) ) ( not ( = ?auto_248313 ?auto_248314 ) ) ( not ( = ?auto_248313 ?auto_248315 ) ) ( not ( = ?auto_248313 ?auto_248316 ) ) ( not ( = ?auto_248314 ?auto_248315 ) ) ( not ( = ?auto_248314 ?auto_248316 ) ) ( not ( = ?auto_248315 ?auto_248316 ) ) ( ON ?auto_248314 ?auto_248315 ) ( ON ?auto_248313 ?auto_248314 ) ( ON ?auto_248312 ?auto_248313 ) ( ON ?auto_248311 ?auto_248312 ) ( ON ?auto_248310 ?auto_248311 ) ( ON ?auto_248309 ?auto_248310 ) ( CLEAR ?auto_248307 ) ( ON ?auto_248308 ?auto_248309 ) ( CLEAR ?auto_248308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248307 ?auto_248308 )
      ( MAKE-9PILE ?auto_248307 ?auto_248308 ?auto_248309 ?auto_248310 ?auto_248311 ?auto_248312 ?auto_248313 ?auto_248314 ?auto_248315 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248345 - BLOCK
      ?auto_248346 - BLOCK
      ?auto_248347 - BLOCK
      ?auto_248348 - BLOCK
      ?auto_248349 - BLOCK
      ?auto_248350 - BLOCK
      ?auto_248351 - BLOCK
      ?auto_248352 - BLOCK
      ?auto_248353 - BLOCK
    )
    :vars
    (
      ?auto_248354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248353 ?auto_248354 ) ( not ( = ?auto_248345 ?auto_248346 ) ) ( not ( = ?auto_248345 ?auto_248347 ) ) ( not ( = ?auto_248345 ?auto_248348 ) ) ( not ( = ?auto_248345 ?auto_248349 ) ) ( not ( = ?auto_248345 ?auto_248350 ) ) ( not ( = ?auto_248345 ?auto_248351 ) ) ( not ( = ?auto_248345 ?auto_248352 ) ) ( not ( = ?auto_248345 ?auto_248353 ) ) ( not ( = ?auto_248345 ?auto_248354 ) ) ( not ( = ?auto_248346 ?auto_248347 ) ) ( not ( = ?auto_248346 ?auto_248348 ) ) ( not ( = ?auto_248346 ?auto_248349 ) ) ( not ( = ?auto_248346 ?auto_248350 ) ) ( not ( = ?auto_248346 ?auto_248351 ) ) ( not ( = ?auto_248346 ?auto_248352 ) ) ( not ( = ?auto_248346 ?auto_248353 ) ) ( not ( = ?auto_248346 ?auto_248354 ) ) ( not ( = ?auto_248347 ?auto_248348 ) ) ( not ( = ?auto_248347 ?auto_248349 ) ) ( not ( = ?auto_248347 ?auto_248350 ) ) ( not ( = ?auto_248347 ?auto_248351 ) ) ( not ( = ?auto_248347 ?auto_248352 ) ) ( not ( = ?auto_248347 ?auto_248353 ) ) ( not ( = ?auto_248347 ?auto_248354 ) ) ( not ( = ?auto_248348 ?auto_248349 ) ) ( not ( = ?auto_248348 ?auto_248350 ) ) ( not ( = ?auto_248348 ?auto_248351 ) ) ( not ( = ?auto_248348 ?auto_248352 ) ) ( not ( = ?auto_248348 ?auto_248353 ) ) ( not ( = ?auto_248348 ?auto_248354 ) ) ( not ( = ?auto_248349 ?auto_248350 ) ) ( not ( = ?auto_248349 ?auto_248351 ) ) ( not ( = ?auto_248349 ?auto_248352 ) ) ( not ( = ?auto_248349 ?auto_248353 ) ) ( not ( = ?auto_248349 ?auto_248354 ) ) ( not ( = ?auto_248350 ?auto_248351 ) ) ( not ( = ?auto_248350 ?auto_248352 ) ) ( not ( = ?auto_248350 ?auto_248353 ) ) ( not ( = ?auto_248350 ?auto_248354 ) ) ( not ( = ?auto_248351 ?auto_248352 ) ) ( not ( = ?auto_248351 ?auto_248353 ) ) ( not ( = ?auto_248351 ?auto_248354 ) ) ( not ( = ?auto_248352 ?auto_248353 ) ) ( not ( = ?auto_248352 ?auto_248354 ) ) ( not ( = ?auto_248353 ?auto_248354 ) ) ( ON ?auto_248352 ?auto_248353 ) ( ON ?auto_248351 ?auto_248352 ) ( ON ?auto_248350 ?auto_248351 ) ( ON ?auto_248349 ?auto_248350 ) ( ON ?auto_248348 ?auto_248349 ) ( ON ?auto_248347 ?auto_248348 ) ( ON ?auto_248346 ?auto_248347 ) ( ON ?auto_248345 ?auto_248346 ) ( CLEAR ?auto_248345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248345 )
      ( MAKE-9PILE ?auto_248345 ?auto_248346 ?auto_248347 ?auto_248348 ?auto_248349 ?auto_248350 ?auto_248351 ?auto_248352 ?auto_248353 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248384 - BLOCK
      ?auto_248385 - BLOCK
      ?auto_248386 - BLOCK
      ?auto_248387 - BLOCK
      ?auto_248388 - BLOCK
      ?auto_248389 - BLOCK
      ?auto_248390 - BLOCK
      ?auto_248391 - BLOCK
      ?auto_248392 - BLOCK
      ?auto_248393 - BLOCK
    )
    :vars
    (
      ?auto_248394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248392 ) ( ON ?auto_248393 ?auto_248394 ) ( CLEAR ?auto_248393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248384 ) ( ON ?auto_248385 ?auto_248384 ) ( ON ?auto_248386 ?auto_248385 ) ( ON ?auto_248387 ?auto_248386 ) ( ON ?auto_248388 ?auto_248387 ) ( ON ?auto_248389 ?auto_248388 ) ( ON ?auto_248390 ?auto_248389 ) ( ON ?auto_248391 ?auto_248390 ) ( ON ?auto_248392 ?auto_248391 ) ( not ( = ?auto_248384 ?auto_248385 ) ) ( not ( = ?auto_248384 ?auto_248386 ) ) ( not ( = ?auto_248384 ?auto_248387 ) ) ( not ( = ?auto_248384 ?auto_248388 ) ) ( not ( = ?auto_248384 ?auto_248389 ) ) ( not ( = ?auto_248384 ?auto_248390 ) ) ( not ( = ?auto_248384 ?auto_248391 ) ) ( not ( = ?auto_248384 ?auto_248392 ) ) ( not ( = ?auto_248384 ?auto_248393 ) ) ( not ( = ?auto_248384 ?auto_248394 ) ) ( not ( = ?auto_248385 ?auto_248386 ) ) ( not ( = ?auto_248385 ?auto_248387 ) ) ( not ( = ?auto_248385 ?auto_248388 ) ) ( not ( = ?auto_248385 ?auto_248389 ) ) ( not ( = ?auto_248385 ?auto_248390 ) ) ( not ( = ?auto_248385 ?auto_248391 ) ) ( not ( = ?auto_248385 ?auto_248392 ) ) ( not ( = ?auto_248385 ?auto_248393 ) ) ( not ( = ?auto_248385 ?auto_248394 ) ) ( not ( = ?auto_248386 ?auto_248387 ) ) ( not ( = ?auto_248386 ?auto_248388 ) ) ( not ( = ?auto_248386 ?auto_248389 ) ) ( not ( = ?auto_248386 ?auto_248390 ) ) ( not ( = ?auto_248386 ?auto_248391 ) ) ( not ( = ?auto_248386 ?auto_248392 ) ) ( not ( = ?auto_248386 ?auto_248393 ) ) ( not ( = ?auto_248386 ?auto_248394 ) ) ( not ( = ?auto_248387 ?auto_248388 ) ) ( not ( = ?auto_248387 ?auto_248389 ) ) ( not ( = ?auto_248387 ?auto_248390 ) ) ( not ( = ?auto_248387 ?auto_248391 ) ) ( not ( = ?auto_248387 ?auto_248392 ) ) ( not ( = ?auto_248387 ?auto_248393 ) ) ( not ( = ?auto_248387 ?auto_248394 ) ) ( not ( = ?auto_248388 ?auto_248389 ) ) ( not ( = ?auto_248388 ?auto_248390 ) ) ( not ( = ?auto_248388 ?auto_248391 ) ) ( not ( = ?auto_248388 ?auto_248392 ) ) ( not ( = ?auto_248388 ?auto_248393 ) ) ( not ( = ?auto_248388 ?auto_248394 ) ) ( not ( = ?auto_248389 ?auto_248390 ) ) ( not ( = ?auto_248389 ?auto_248391 ) ) ( not ( = ?auto_248389 ?auto_248392 ) ) ( not ( = ?auto_248389 ?auto_248393 ) ) ( not ( = ?auto_248389 ?auto_248394 ) ) ( not ( = ?auto_248390 ?auto_248391 ) ) ( not ( = ?auto_248390 ?auto_248392 ) ) ( not ( = ?auto_248390 ?auto_248393 ) ) ( not ( = ?auto_248390 ?auto_248394 ) ) ( not ( = ?auto_248391 ?auto_248392 ) ) ( not ( = ?auto_248391 ?auto_248393 ) ) ( not ( = ?auto_248391 ?auto_248394 ) ) ( not ( = ?auto_248392 ?auto_248393 ) ) ( not ( = ?auto_248392 ?auto_248394 ) ) ( not ( = ?auto_248393 ?auto_248394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248393 ?auto_248394 )
      ( !STACK ?auto_248393 ?auto_248392 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248426 - BLOCK
      ?auto_248427 - BLOCK
      ?auto_248428 - BLOCK
      ?auto_248429 - BLOCK
      ?auto_248430 - BLOCK
      ?auto_248431 - BLOCK
      ?auto_248432 - BLOCK
      ?auto_248433 - BLOCK
      ?auto_248434 - BLOCK
      ?auto_248435 - BLOCK
    )
    :vars
    (
      ?auto_248436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248435 ?auto_248436 ) ( ON-TABLE ?auto_248426 ) ( ON ?auto_248427 ?auto_248426 ) ( ON ?auto_248428 ?auto_248427 ) ( ON ?auto_248429 ?auto_248428 ) ( ON ?auto_248430 ?auto_248429 ) ( ON ?auto_248431 ?auto_248430 ) ( ON ?auto_248432 ?auto_248431 ) ( ON ?auto_248433 ?auto_248432 ) ( not ( = ?auto_248426 ?auto_248427 ) ) ( not ( = ?auto_248426 ?auto_248428 ) ) ( not ( = ?auto_248426 ?auto_248429 ) ) ( not ( = ?auto_248426 ?auto_248430 ) ) ( not ( = ?auto_248426 ?auto_248431 ) ) ( not ( = ?auto_248426 ?auto_248432 ) ) ( not ( = ?auto_248426 ?auto_248433 ) ) ( not ( = ?auto_248426 ?auto_248434 ) ) ( not ( = ?auto_248426 ?auto_248435 ) ) ( not ( = ?auto_248426 ?auto_248436 ) ) ( not ( = ?auto_248427 ?auto_248428 ) ) ( not ( = ?auto_248427 ?auto_248429 ) ) ( not ( = ?auto_248427 ?auto_248430 ) ) ( not ( = ?auto_248427 ?auto_248431 ) ) ( not ( = ?auto_248427 ?auto_248432 ) ) ( not ( = ?auto_248427 ?auto_248433 ) ) ( not ( = ?auto_248427 ?auto_248434 ) ) ( not ( = ?auto_248427 ?auto_248435 ) ) ( not ( = ?auto_248427 ?auto_248436 ) ) ( not ( = ?auto_248428 ?auto_248429 ) ) ( not ( = ?auto_248428 ?auto_248430 ) ) ( not ( = ?auto_248428 ?auto_248431 ) ) ( not ( = ?auto_248428 ?auto_248432 ) ) ( not ( = ?auto_248428 ?auto_248433 ) ) ( not ( = ?auto_248428 ?auto_248434 ) ) ( not ( = ?auto_248428 ?auto_248435 ) ) ( not ( = ?auto_248428 ?auto_248436 ) ) ( not ( = ?auto_248429 ?auto_248430 ) ) ( not ( = ?auto_248429 ?auto_248431 ) ) ( not ( = ?auto_248429 ?auto_248432 ) ) ( not ( = ?auto_248429 ?auto_248433 ) ) ( not ( = ?auto_248429 ?auto_248434 ) ) ( not ( = ?auto_248429 ?auto_248435 ) ) ( not ( = ?auto_248429 ?auto_248436 ) ) ( not ( = ?auto_248430 ?auto_248431 ) ) ( not ( = ?auto_248430 ?auto_248432 ) ) ( not ( = ?auto_248430 ?auto_248433 ) ) ( not ( = ?auto_248430 ?auto_248434 ) ) ( not ( = ?auto_248430 ?auto_248435 ) ) ( not ( = ?auto_248430 ?auto_248436 ) ) ( not ( = ?auto_248431 ?auto_248432 ) ) ( not ( = ?auto_248431 ?auto_248433 ) ) ( not ( = ?auto_248431 ?auto_248434 ) ) ( not ( = ?auto_248431 ?auto_248435 ) ) ( not ( = ?auto_248431 ?auto_248436 ) ) ( not ( = ?auto_248432 ?auto_248433 ) ) ( not ( = ?auto_248432 ?auto_248434 ) ) ( not ( = ?auto_248432 ?auto_248435 ) ) ( not ( = ?auto_248432 ?auto_248436 ) ) ( not ( = ?auto_248433 ?auto_248434 ) ) ( not ( = ?auto_248433 ?auto_248435 ) ) ( not ( = ?auto_248433 ?auto_248436 ) ) ( not ( = ?auto_248434 ?auto_248435 ) ) ( not ( = ?auto_248434 ?auto_248436 ) ) ( not ( = ?auto_248435 ?auto_248436 ) ) ( CLEAR ?auto_248433 ) ( ON ?auto_248434 ?auto_248435 ) ( CLEAR ?auto_248434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248426 ?auto_248427 ?auto_248428 ?auto_248429 ?auto_248430 ?auto_248431 ?auto_248432 ?auto_248433 ?auto_248434 )
      ( MAKE-10PILE ?auto_248426 ?auto_248427 ?auto_248428 ?auto_248429 ?auto_248430 ?auto_248431 ?auto_248432 ?auto_248433 ?auto_248434 ?auto_248435 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248468 - BLOCK
      ?auto_248469 - BLOCK
      ?auto_248470 - BLOCK
      ?auto_248471 - BLOCK
      ?auto_248472 - BLOCK
      ?auto_248473 - BLOCK
      ?auto_248474 - BLOCK
      ?auto_248475 - BLOCK
      ?auto_248476 - BLOCK
      ?auto_248477 - BLOCK
    )
    :vars
    (
      ?auto_248478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248477 ?auto_248478 ) ( ON-TABLE ?auto_248468 ) ( ON ?auto_248469 ?auto_248468 ) ( ON ?auto_248470 ?auto_248469 ) ( ON ?auto_248471 ?auto_248470 ) ( ON ?auto_248472 ?auto_248471 ) ( ON ?auto_248473 ?auto_248472 ) ( ON ?auto_248474 ?auto_248473 ) ( not ( = ?auto_248468 ?auto_248469 ) ) ( not ( = ?auto_248468 ?auto_248470 ) ) ( not ( = ?auto_248468 ?auto_248471 ) ) ( not ( = ?auto_248468 ?auto_248472 ) ) ( not ( = ?auto_248468 ?auto_248473 ) ) ( not ( = ?auto_248468 ?auto_248474 ) ) ( not ( = ?auto_248468 ?auto_248475 ) ) ( not ( = ?auto_248468 ?auto_248476 ) ) ( not ( = ?auto_248468 ?auto_248477 ) ) ( not ( = ?auto_248468 ?auto_248478 ) ) ( not ( = ?auto_248469 ?auto_248470 ) ) ( not ( = ?auto_248469 ?auto_248471 ) ) ( not ( = ?auto_248469 ?auto_248472 ) ) ( not ( = ?auto_248469 ?auto_248473 ) ) ( not ( = ?auto_248469 ?auto_248474 ) ) ( not ( = ?auto_248469 ?auto_248475 ) ) ( not ( = ?auto_248469 ?auto_248476 ) ) ( not ( = ?auto_248469 ?auto_248477 ) ) ( not ( = ?auto_248469 ?auto_248478 ) ) ( not ( = ?auto_248470 ?auto_248471 ) ) ( not ( = ?auto_248470 ?auto_248472 ) ) ( not ( = ?auto_248470 ?auto_248473 ) ) ( not ( = ?auto_248470 ?auto_248474 ) ) ( not ( = ?auto_248470 ?auto_248475 ) ) ( not ( = ?auto_248470 ?auto_248476 ) ) ( not ( = ?auto_248470 ?auto_248477 ) ) ( not ( = ?auto_248470 ?auto_248478 ) ) ( not ( = ?auto_248471 ?auto_248472 ) ) ( not ( = ?auto_248471 ?auto_248473 ) ) ( not ( = ?auto_248471 ?auto_248474 ) ) ( not ( = ?auto_248471 ?auto_248475 ) ) ( not ( = ?auto_248471 ?auto_248476 ) ) ( not ( = ?auto_248471 ?auto_248477 ) ) ( not ( = ?auto_248471 ?auto_248478 ) ) ( not ( = ?auto_248472 ?auto_248473 ) ) ( not ( = ?auto_248472 ?auto_248474 ) ) ( not ( = ?auto_248472 ?auto_248475 ) ) ( not ( = ?auto_248472 ?auto_248476 ) ) ( not ( = ?auto_248472 ?auto_248477 ) ) ( not ( = ?auto_248472 ?auto_248478 ) ) ( not ( = ?auto_248473 ?auto_248474 ) ) ( not ( = ?auto_248473 ?auto_248475 ) ) ( not ( = ?auto_248473 ?auto_248476 ) ) ( not ( = ?auto_248473 ?auto_248477 ) ) ( not ( = ?auto_248473 ?auto_248478 ) ) ( not ( = ?auto_248474 ?auto_248475 ) ) ( not ( = ?auto_248474 ?auto_248476 ) ) ( not ( = ?auto_248474 ?auto_248477 ) ) ( not ( = ?auto_248474 ?auto_248478 ) ) ( not ( = ?auto_248475 ?auto_248476 ) ) ( not ( = ?auto_248475 ?auto_248477 ) ) ( not ( = ?auto_248475 ?auto_248478 ) ) ( not ( = ?auto_248476 ?auto_248477 ) ) ( not ( = ?auto_248476 ?auto_248478 ) ) ( not ( = ?auto_248477 ?auto_248478 ) ) ( ON ?auto_248476 ?auto_248477 ) ( CLEAR ?auto_248474 ) ( ON ?auto_248475 ?auto_248476 ) ( CLEAR ?auto_248475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248468 ?auto_248469 ?auto_248470 ?auto_248471 ?auto_248472 ?auto_248473 ?auto_248474 ?auto_248475 )
      ( MAKE-10PILE ?auto_248468 ?auto_248469 ?auto_248470 ?auto_248471 ?auto_248472 ?auto_248473 ?auto_248474 ?auto_248475 ?auto_248476 ?auto_248477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248510 - BLOCK
      ?auto_248511 - BLOCK
      ?auto_248512 - BLOCK
      ?auto_248513 - BLOCK
      ?auto_248514 - BLOCK
      ?auto_248515 - BLOCK
      ?auto_248516 - BLOCK
      ?auto_248517 - BLOCK
      ?auto_248518 - BLOCK
      ?auto_248519 - BLOCK
    )
    :vars
    (
      ?auto_248520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248519 ?auto_248520 ) ( ON-TABLE ?auto_248510 ) ( ON ?auto_248511 ?auto_248510 ) ( ON ?auto_248512 ?auto_248511 ) ( ON ?auto_248513 ?auto_248512 ) ( ON ?auto_248514 ?auto_248513 ) ( ON ?auto_248515 ?auto_248514 ) ( not ( = ?auto_248510 ?auto_248511 ) ) ( not ( = ?auto_248510 ?auto_248512 ) ) ( not ( = ?auto_248510 ?auto_248513 ) ) ( not ( = ?auto_248510 ?auto_248514 ) ) ( not ( = ?auto_248510 ?auto_248515 ) ) ( not ( = ?auto_248510 ?auto_248516 ) ) ( not ( = ?auto_248510 ?auto_248517 ) ) ( not ( = ?auto_248510 ?auto_248518 ) ) ( not ( = ?auto_248510 ?auto_248519 ) ) ( not ( = ?auto_248510 ?auto_248520 ) ) ( not ( = ?auto_248511 ?auto_248512 ) ) ( not ( = ?auto_248511 ?auto_248513 ) ) ( not ( = ?auto_248511 ?auto_248514 ) ) ( not ( = ?auto_248511 ?auto_248515 ) ) ( not ( = ?auto_248511 ?auto_248516 ) ) ( not ( = ?auto_248511 ?auto_248517 ) ) ( not ( = ?auto_248511 ?auto_248518 ) ) ( not ( = ?auto_248511 ?auto_248519 ) ) ( not ( = ?auto_248511 ?auto_248520 ) ) ( not ( = ?auto_248512 ?auto_248513 ) ) ( not ( = ?auto_248512 ?auto_248514 ) ) ( not ( = ?auto_248512 ?auto_248515 ) ) ( not ( = ?auto_248512 ?auto_248516 ) ) ( not ( = ?auto_248512 ?auto_248517 ) ) ( not ( = ?auto_248512 ?auto_248518 ) ) ( not ( = ?auto_248512 ?auto_248519 ) ) ( not ( = ?auto_248512 ?auto_248520 ) ) ( not ( = ?auto_248513 ?auto_248514 ) ) ( not ( = ?auto_248513 ?auto_248515 ) ) ( not ( = ?auto_248513 ?auto_248516 ) ) ( not ( = ?auto_248513 ?auto_248517 ) ) ( not ( = ?auto_248513 ?auto_248518 ) ) ( not ( = ?auto_248513 ?auto_248519 ) ) ( not ( = ?auto_248513 ?auto_248520 ) ) ( not ( = ?auto_248514 ?auto_248515 ) ) ( not ( = ?auto_248514 ?auto_248516 ) ) ( not ( = ?auto_248514 ?auto_248517 ) ) ( not ( = ?auto_248514 ?auto_248518 ) ) ( not ( = ?auto_248514 ?auto_248519 ) ) ( not ( = ?auto_248514 ?auto_248520 ) ) ( not ( = ?auto_248515 ?auto_248516 ) ) ( not ( = ?auto_248515 ?auto_248517 ) ) ( not ( = ?auto_248515 ?auto_248518 ) ) ( not ( = ?auto_248515 ?auto_248519 ) ) ( not ( = ?auto_248515 ?auto_248520 ) ) ( not ( = ?auto_248516 ?auto_248517 ) ) ( not ( = ?auto_248516 ?auto_248518 ) ) ( not ( = ?auto_248516 ?auto_248519 ) ) ( not ( = ?auto_248516 ?auto_248520 ) ) ( not ( = ?auto_248517 ?auto_248518 ) ) ( not ( = ?auto_248517 ?auto_248519 ) ) ( not ( = ?auto_248517 ?auto_248520 ) ) ( not ( = ?auto_248518 ?auto_248519 ) ) ( not ( = ?auto_248518 ?auto_248520 ) ) ( not ( = ?auto_248519 ?auto_248520 ) ) ( ON ?auto_248518 ?auto_248519 ) ( ON ?auto_248517 ?auto_248518 ) ( CLEAR ?auto_248515 ) ( ON ?auto_248516 ?auto_248517 ) ( CLEAR ?auto_248516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248510 ?auto_248511 ?auto_248512 ?auto_248513 ?auto_248514 ?auto_248515 ?auto_248516 )
      ( MAKE-10PILE ?auto_248510 ?auto_248511 ?auto_248512 ?auto_248513 ?auto_248514 ?auto_248515 ?auto_248516 ?auto_248517 ?auto_248518 ?auto_248519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248552 - BLOCK
      ?auto_248553 - BLOCK
      ?auto_248554 - BLOCK
      ?auto_248555 - BLOCK
      ?auto_248556 - BLOCK
      ?auto_248557 - BLOCK
      ?auto_248558 - BLOCK
      ?auto_248559 - BLOCK
      ?auto_248560 - BLOCK
      ?auto_248561 - BLOCK
    )
    :vars
    (
      ?auto_248562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248561 ?auto_248562 ) ( ON-TABLE ?auto_248552 ) ( ON ?auto_248553 ?auto_248552 ) ( ON ?auto_248554 ?auto_248553 ) ( ON ?auto_248555 ?auto_248554 ) ( ON ?auto_248556 ?auto_248555 ) ( not ( = ?auto_248552 ?auto_248553 ) ) ( not ( = ?auto_248552 ?auto_248554 ) ) ( not ( = ?auto_248552 ?auto_248555 ) ) ( not ( = ?auto_248552 ?auto_248556 ) ) ( not ( = ?auto_248552 ?auto_248557 ) ) ( not ( = ?auto_248552 ?auto_248558 ) ) ( not ( = ?auto_248552 ?auto_248559 ) ) ( not ( = ?auto_248552 ?auto_248560 ) ) ( not ( = ?auto_248552 ?auto_248561 ) ) ( not ( = ?auto_248552 ?auto_248562 ) ) ( not ( = ?auto_248553 ?auto_248554 ) ) ( not ( = ?auto_248553 ?auto_248555 ) ) ( not ( = ?auto_248553 ?auto_248556 ) ) ( not ( = ?auto_248553 ?auto_248557 ) ) ( not ( = ?auto_248553 ?auto_248558 ) ) ( not ( = ?auto_248553 ?auto_248559 ) ) ( not ( = ?auto_248553 ?auto_248560 ) ) ( not ( = ?auto_248553 ?auto_248561 ) ) ( not ( = ?auto_248553 ?auto_248562 ) ) ( not ( = ?auto_248554 ?auto_248555 ) ) ( not ( = ?auto_248554 ?auto_248556 ) ) ( not ( = ?auto_248554 ?auto_248557 ) ) ( not ( = ?auto_248554 ?auto_248558 ) ) ( not ( = ?auto_248554 ?auto_248559 ) ) ( not ( = ?auto_248554 ?auto_248560 ) ) ( not ( = ?auto_248554 ?auto_248561 ) ) ( not ( = ?auto_248554 ?auto_248562 ) ) ( not ( = ?auto_248555 ?auto_248556 ) ) ( not ( = ?auto_248555 ?auto_248557 ) ) ( not ( = ?auto_248555 ?auto_248558 ) ) ( not ( = ?auto_248555 ?auto_248559 ) ) ( not ( = ?auto_248555 ?auto_248560 ) ) ( not ( = ?auto_248555 ?auto_248561 ) ) ( not ( = ?auto_248555 ?auto_248562 ) ) ( not ( = ?auto_248556 ?auto_248557 ) ) ( not ( = ?auto_248556 ?auto_248558 ) ) ( not ( = ?auto_248556 ?auto_248559 ) ) ( not ( = ?auto_248556 ?auto_248560 ) ) ( not ( = ?auto_248556 ?auto_248561 ) ) ( not ( = ?auto_248556 ?auto_248562 ) ) ( not ( = ?auto_248557 ?auto_248558 ) ) ( not ( = ?auto_248557 ?auto_248559 ) ) ( not ( = ?auto_248557 ?auto_248560 ) ) ( not ( = ?auto_248557 ?auto_248561 ) ) ( not ( = ?auto_248557 ?auto_248562 ) ) ( not ( = ?auto_248558 ?auto_248559 ) ) ( not ( = ?auto_248558 ?auto_248560 ) ) ( not ( = ?auto_248558 ?auto_248561 ) ) ( not ( = ?auto_248558 ?auto_248562 ) ) ( not ( = ?auto_248559 ?auto_248560 ) ) ( not ( = ?auto_248559 ?auto_248561 ) ) ( not ( = ?auto_248559 ?auto_248562 ) ) ( not ( = ?auto_248560 ?auto_248561 ) ) ( not ( = ?auto_248560 ?auto_248562 ) ) ( not ( = ?auto_248561 ?auto_248562 ) ) ( ON ?auto_248560 ?auto_248561 ) ( ON ?auto_248559 ?auto_248560 ) ( ON ?auto_248558 ?auto_248559 ) ( CLEAR ?auto_248556 ) ( ON ?auto_248557 ?auto_248558 ) ( CLEAR ?auto_248557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248552 ?auto_248553 ?auto_248554 ?auto_248555 ?auto_248556 ?auto_248557 )
      ( MAKE-10PILE ?auto_248552 ?auto_248553 ?auto_248554 ?auto_248555 ?auto_248556 ?auto_248557 ?auto_248558 ?auto_248559 ?auto_248560 ?auto_248561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248594 - BLOCK
      ?auto_248595 - BLOCK
      ?auto_248596 - BLOCK
      ?auto_248597 - BLOCK
      ?auto_248598 - BLOCK
      ?auto_248599 - BLOCK
      ?auto_248600 - BLOCK
      ?auto_248601 - BLOCK
      ?auto_248602 - BLOCK
      ?auto_248603 - BLOCK
    )
    :vars
    (
      ?auto_248604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248603 ?auto_248604 ) ( ON-TABLE ?auto_248594 ) ( ON ?auto_248595 ?auto_248594 ) ( ON ?auto_248596 ?auto_248595 ) ( ON ?auto_248597 ?auto_248596 ) ( not ( = ?auto_248594 ?auto_248595 ) ) ( not ( = ?auto_248594 ?auto_248596 ) ) ( not ( = ?auto_248594 ?auto_248597 ) ) ( not ( = ?auto_248594 ?auto_248598 ) ) ( not ( = ?auto_248594 ?auto_248599 ) ) ( not ( = ?auto_248594 ?auto_248600 ) ) ( not ( = ?auto_248594 ?auto_248601 ) ) ( not ( = ?auto_248594 ?auto_248602 ) ) ( not ( = ?auto_248594 ?auto_248603 ) ) ( not ( = ?auto_248594 ?auto_248604 ) ) ( not ( = ?auto_248595 ?auto_248596 ) ) ( not ( = ?auto_248595 ?auto_248597 ) ) ( not ( = ?auto_248595 ?auto_248598 ) ) ( not ( = ?auto_248595 ?auto_248599 ) ) ( not ( = ?auto_248595 ?auto_248600 ) ) ( not ( = ?auto_248595 ?auto_248601 ) ) ( not ( = ?auto_248595 ?auto_248602 ) ) ( not ( = ?auto_248595 ?auto_248603 ) ) ( not ( = ?auto_248595 ?auto_248604 ) ) ( not ( = ?auto_248596 ?auto_248597 ) ) ( not ( = ?auto_248596 ?auto_248598 ) ) ( not ( = ?auto_248596 ?auto_248599 ) ) ( not ( = ?auto_248596 ?auto_248600 ) ) ( not ( = ?auto_248596 ?auto_248601 ) ) ( not ( = ?auto_248596 ?auto_248602 ) ) ( not ( = ?auto_248596 ?auto_248603 ) ) ( not ( = ?auto_248596 ?auto_248604 ) ) ( not ( = ?auto_248597 ?auto_248598 ) ) ( not ( = ?auto_248597 ?auto_248599 ) ) ( not ( = ?auto_248597 ?auto_248600 ) ) ( not ( = ?auto_248597 ?auto_248601 ) ) ( not ( = ?auto_248597 ?auto_248602 ) ) ( not ( = ?auto_248597 ?auto_248603 ) ) ( not ( = ?auto_248597 ?auto_248604 ) ) ( not ( = ?auto_248598 ?auto_248599 ) ) ( not ( = ?auto_248598 ?auto_248600 ) ) ( not ( = ?auto_248598 ?auto_248601 ) ) ( not ( = ?auto_248598 ?auto_248602 ) ) ( not ( = ?auto_248598 ?auto_248603 ) ) ( not ( = ?auto_248598 ?auto_248604 ) ) ( not ( = ?auto_248599 ?auto_248600 ) ) ( not ( = ?auto_248599 ?auto_248601 ) ) ( not ( = ?auto_248599 ?auto_248602 ) ) ( not ( = ?auto_248599 ?auto_248603 ) ) ( not ( = ?auto_248599 ?auto_248604 ) ) ( not ( = ?auto_248600 ?auto_248601 ) ) ( not ( = ?auto_248600 ?auto_248602 ) ) ( not ( = ?auto_248600 ?auto_248603 ) ) ( not ( = ?auto_248600 ?auto_248604 ) ) ( not ( = ?auto_248601 ?auto_248602 ) ) ( not ( = ?auto_248601 ?auto_248603 ) ) ( not ( = ?auto_248601 ?auto_248604 ) ) ( not ( = ?auto_248602 ?auto_248603 ) ) ( not ( = ?auto_248602 ?auto_248604 ) ) ( not ( = ?auto_248603 ?auto_248604 ) ) ( ON ?auto_248602 ?auto_248603 ) ( ON ?auto_248601 ?auto_248602 ) ( ON ?auto_248600 ?auto_248601 ) ( ON ?auto_248599 ?auto_248600 ) ( CLEAR ?auto_248597 ) ( ON ?auto_248598 ?auto_248599 ) ( CLEAR ?auto_248598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248594 ?auto_248595 ?auto_248596 ?auto_248597 ?auto_248598 )
      ( MAKE-10PILE ?auto_248594 ?auto_248595 ?auto_248596 ?auto_248597 ?auto_248598 ?auto_248599 ?auto_248600 ?auto_248601 ?auto_248602 ?auto_248603 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248636 - BLOCK
      ?auto_248637 - BLOCK
      ?auto_248638 - BLOCK
      ?auto_248639 - BLOCK
      ?auto_248640 - BLOCK
      ?auto_248641 - BLOCK
      ?auto_248642 - BLOCK
      ?auto_248643 - BLOCK
      ?auto_248644 - BLOCK
      ?auto_248645 - BLOCK
    )
    :vars
    (
      ?auto_248646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248645 ?auto_248646 ) ( ON-TABLE ?auto_248636 ) ( ON ?auto_248637 ?auto_248636 ) ( ON ?auto_248638 ?auto_248637 ) ( not ( = ?auto_248636 ?auto_248637 ) ) ( not ( = ?auto_248636 ?auto_248638 ) ) ( not ( = ?auto_248636 ?auto_248639 ) ) ( not ( = ?auto_248636 ?auto_248640 ) ) ( not ( = ?auto_248636 ?auto_248641 ) ) ( not ( = ?auto_248636 ?auto_248642 ) ) ( not ( = ?auto_248636 ?auto_248643 ) ) ( not ( = ?auto_248636 ?auto_248644 ) ) ( not ( = ?auto_248636 ?auto_248645 ) ) ( not ( = ?auto_248636 ?auto_248646 ) ) ( not ( = ?auto_248637 ?auto_248638 ) ) ( not ( = ?auto_248637 ?auto_248639 ) ) ( not ( = ?auto_248637 ?auto_248640 ) ) ( not ( = ?auto_248637 ?auto_248641 ) ) ( not ( = ?auto_248637 ?auto_248642 ) ) ( not ( = ?auto_248637 ?auto_248643 ) ) ( not ( = ?auto_248637 ?auto_248644 ) ) ( not ( = ?auto_248637 ?auto_248645 ) ) ( not ( = ?auto_248637 ?auto_248646 ) ) ( not ( = ?auto_248638 ?auto_248639 ) ) ( not ( = ?auto_248638 ?auto_248640 ) ) ( not ( = ?auto_248638 ?auto_248641 ) ) ( not ( = ?auto_248638 ?auto_248642 ) ) ( not ( = ?auto_248638 ?auto_248643 ) ) ( not ( = ?auto_248638 ?auto_248644 ) ) ( not ( = ?auto_248638 ?auto_248645 ) ) ( not ( = ?auto_248638 ?auto_248646 ) ) ( not ( = ?auto_248639 ?auto_248640 ) ) ( not ( = ?auto_248639 ?auto_248641 ) ) ( not ( = ?auto_248639 ?auto_248642 ) ) ( not ( = ?auto_248639 ?auto_248643 ) ) ( not ( = ?auto_248639 ?auto_248644 ) ) ( not ( = ?auto_248639 ?auto_248645 ) ) ( not ( = ?auto_248639 ?auto_248646 ) ) ( not ( = ?auto_248640 ?auto_248641 ) ) ( not ( = ?auto_248640 ?auto_248642 ) ) ( not ( = ?auto_248640 ?auto_248643 ) ) ( not ( = ?auto_248640 ?auto_248644 ) ) ( not ( = ?auto_248640 ?auto_248645 ) ) ( not ( = ?auto_248640 ?auto_248646 ) ) ( not ( = ?auto_248641 ?auto_248642 ) ) ( not ( = ?auto_248641 ?auto_248643 ) ) ( not ( = ?auto_248641 ?auto_248644 ) ) ( not ( = ?auto_248641 ?auto_248645 ) ) ( not ( = ?auto_248641 ?auto_248646 ) ) ( not ( = ?auto_248642 ?auto_248643 ) ) ( not ( = ?auto_248642 ?auto_248644 ) ) ( not ( = ?auto_248642 ?auto_248645 ) ) ( not ( = ?auto_248642 ?auto_248646 ) ) ( not ( = ?auto_248643 ?auto_248644 ) ) ( not ( = ?auto_248643 ?auto_248645 ) ) ( not ( = ?auto_248643 ?auto_248646 ) ) ( not ( = ?auto_248644 ?auto_248645 ) ) ( not ( = ?auto_248644 ?auto_248646 ) ) ( not ( = ?auto_248645 ?auto_248646 ) ) ( ON ?auto_248644 ?auto_248645 ) ( ON ?auto_248643 ?auto_248644 ) ( ON ?auto_248642 ?auto_248643 ) ( ON ?auto_248641 ?auto_248642 ) ( ON ?auto_248640 ?auto_248641 ) ( CLEAR ?auto_248638 ) ( ON ?auto_248639 ?auto_248640 ) ( CLEAR ?auto_248639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248636 ?auto_248637 ?auto_248638 ?auto_248639 )
      ( MAKE-10PILE ?auto_248636 ?auto_248637 ?auto_248638 ?auto_248639 ?auto_248640 ?auto_248641 ?auto_248642 ?auto_248643 ?auto_248644 ?auto_248645 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248678 - BLOCK
      ?auto_248679 - BLOCK
      ?auto_248680 - BLOCK
      ?auto_248681 - BLOCK
      ?auto_248682 - BLOCK
      ?auto_248683 - BLOCK
      ?auto_248684 - BLOCK
      ?auto_248685 - BLOCK
      ?auto_248686 - BLOCK
      ?auto_248687 - BLOCK
    )
    :vars
    (
      ?auto_248688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248687 ?auto_248688 ) ( ON-TABLE ?auto_248678 ) ( ON ?auto_248679 ?auto_248678 ) ( not ( = ?auto_248678 ?auto_248679 ) ) ( not ( = ?auto_248678 ?auto_248680 ) ) ( not ( = ?auto_248678 ?auto_248681 ) ) ( not ( = ?auto_248678 ?auto_248682 ) ) ( not ( = ?auto_248678 ?auto_248683 ) ) ( not ( = ?auto_248678 ?auto_248684 ) ) ( not ( = ?auto_248678 ?auto_248685 ) ) ( not ( = ?auto_248678 ?auto_248686 ) ) ( not ( = ?auto_248678 ?auto_248687 ) ) ( not ( = ?auto_248678 ?auto_248688 ) ) ( not ( = ?auto_248679 ?auto_248680 ) ) ( not ( = ?auto_248679 ?auto_248681 ) ) ( not ( = ?auto_248679 ?auto_248682 ) ) ( not ( = ?auto_248679 ?auto_248683 ) ) ( not ( = ?auto_248679 ?auto_248684 ) ) ( not ( = ?auto_248679 ?auto_248685 ) ) ( not ( = ?auto_248679 ?auto_248686 ) ) ( not ( = ?auto_248679 ?auto_248687 ) ) ( not ( = ?auto_248679 ?auto_248688 ) ) ( not ( = ?auto_248680 ?auto_248681 ) ) ( not ( = ?auto_248680 ?auto_248682 ) ) ( not ( = ?auto_248680 ?auto_248683 ) ) ( not ( = ?auto_248680 ?auto_248684 ) ) ( not ( = ?auto_248680 ?auto_248685 ) ) ( not ( = ?auto_248680 ?auto_248686 ) ) ( not ( = ?auto_248680 ?auto_248687 ) ) ( not ( = ?auto_248680 ?auto_248688 ) ) ( not ( = ?auto_248681 ?auto_248682 ) ) ( not ( = ?auto_248681 ?auto_248683 ) ) ( not ( = ?auto_248681 ?auto_248684 ) ) ( not ( = ?auto_248681 ?auto_248685 ) ) ( not ( = ?auto_248681 ?auto_248686 ) ) ( not ( = ?auto_248681 ?auto_248687 ) ) ( not ( = ?auto_248681 ?auto_248688 ) ) ( not ( = ?auto_248682 ?auto_248683 ) ) ( not ( = ?auto_248682 ?auto_248684 ) ) ( not ( = ?auto_248682 ?auto_248685 ) ) ( not ( = ?auto_248682 ?auto_248686 ) ) ( not ( = ?auto_248682 ?auto_248687 ) ) ( not ( = ?auto_248682 ?auto_248688 ) ) ( not ( = ?auto_248683 ?auto_248684 ) ) ( not ( = ?auto_248683 ?auto_248685 ) ) ( not ( = ?auto_248683 ?auto_248686 ) ) ( not ( = ?auto_248683 ?auto_248687 ) ) ( not ( = ?auto_248683 ?auto_248688 ) ) ( not ( = ?auto_248684 ?auto_248685 ) ) ( not ( = ?auto_248684 ?auto_248686 ) ) ( not ( = ?auto_248684 ?auto_248687 ) ) ( not ( = ?auto_248684 ?auto_248688 ) ) ( not ( = ?auto_248685 ?auto_248686 ) ) ( not ( = ?auto_248685 ?auto_248687 ) ) ( not ( = ?auto_248685 ?auto_248688 ) ) ( not ( = ?auto_248686 ?auto_248687 ) ) ( not ( = ?auto_248686 ?auto_248688 ) ) ( not ( = ?auto_248687 ?auto_248688 ) ) ( ON ?auto_248686 ?auto_248687 ) ( ON ?auto_248685 ?auto_248686 ) ( ON ?auto_248684 ?auto_248685 ) ( ON ?auto_248683 ?auto_248684 ) ( ON ?auto_248682 ?auto_248683 ) ( ON ?auto_248681 ?auto_248682 ) ( CLEAR ?auto_248679 ) ( ON ?auto_248680 ?auto_248681 ) ( CLEAR ?auto_248680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248678 ?auto_248679 ?auto_248680 )
      ( MAKE-10PILE ?auto_248678 ?auto_248679 ?auto_248680 ?auto_248681 ?auto_248682 ?auto_248683 ?auto_248684 ?auto_248685 ?auto_248686 ?auto_248687 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248720 - BLOCK
      ?auto_248721 - BLOCK
      ?auto_248722 - BLOCK
      ?auto_248723 - BLOCK
      ?auto_248724 - BLOCK
      ?auto_248725 - BLOCK
      ?auto_248726 - BLOCK
      ?auto_248727 - BLOCK
      ?auto_248728 - BLOCK
      ?auto_248729 - BLOCK
    )
    :vars
    (
      ?auto_248730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248729 ?auto_248730 ) ( ON-TABLE ?auto_248720 ) ( not ( = ?auto_248720 ?auto_248721 ) ) ( not ( = ?auto_248720 ?auto_248722 ) ) ( not ( = ?auto_248720 ?auto_248723 ) ) ( not ( = ?auto_248720 ?auto_248724 ) ) ( not ( = ?auto_248720 ?auto_248725 ) ) ( not ( = ?auto_248720 ?auto_248726 ) ) ( not ( = ?auto_248720 ?auto_248727 ) ) ( not ( = ?auto_248720 ?auto_248728 ) ) ( not ( = ?auto_248720 ?auto_248729 ) ) ( not ( = ?auto_248720 ?auto_248730 ) ) ( not ( = ?auto_248721 ?auto_248722 ) ) ( not ( = ?auto_248721 ?auto_248723 ) ) ( not ( = ?auto_248721 ?auto_248724 ) ) ( not ( = ?auto_248721 ?auto_248725 ) ) ( not ( = ?auto_248721 ?auto_248726 ) ) ( not ( = ?auto_248721 ?auto_248727 ) ) ( not ( = ?auto_248721 ?auto_248728 ) ) ( not ( = ?auto_248721 ?auto_248729 ) ) ( not ( = ?auto_248721 ?auto_248730 ) ) ( not ( = ?auto_248722 ?auto_248723 ) ) ( not ( = ?auto_248722 ?auto_248724 ) ) ( not ( = ?auto_248722 ?auto_248725 ) ) ( not ( = ?auto_248722 ?auto_248726 ) ) ( not ( = ?auto_248722 ?auto_248727 ) ) ( not ( = ?auto_248722 ?auto_248728 ) ) ( not ( = ?auto_248722 ?auto_248729 ) ) ( not ( = ?auto_248722 ?auto_248730 ) ) ( not ( = ?auto_248723 ?auto_248724 ) ) ( not ( = ?auto_248723 ?auto_248725 ) ) ( not ( = ?auto_248723 ?auto_248726 ) ) ( not ( = ?auto_248723 ?auto_248727 ) ) ( not ( = ?auto_248723 ?auto_248728 ) ) ( not ( = ?auto_248723 ?auto_248729 ) ) ( not ( = ?auto_248723 ?auto_248730 ) ) ( not ( = ?auto_248724 ?auto_248725 ) ) ( not ( = ?auto_248724 ?auto_248726 ) ) ( not ( = ?auto_248724 ?auto_248727 ) ) ( not ( = ?auto_248724 ?auto_248728 ) ) ( not ( = ?auto_248724 ?auto_248729 ) ) ( not ( = ?auto_248724 ?auto_248730 ) ) ( not ( = ?auto_248725 ?auto_248726 ) ) ( not ( = ?auto_248725 ?auto_248727 ) ) ( not ( = ?auto_248725 ?auto_248728 ) ) ( not ( = ?auto_248725 ?auto_248729 ) ) ( not ( = ?auto_248725 ?auto_248730 ) ) ( not ( = ?auto_248726 ?auto_248727 ) ) ( not ( = ?auto_248726 ?auto_248728 ) ) ( not ( = ?auto_248726 ?auto_248729 ) ) ( not ( = ?auto_248726 ?auto_248730 ) ) ( not ( = ?auto_248727 ?auto_248728 ) ) ( not ( = ?auto_248727 ?auto_248729 ) ) ( not ( = ?auto_248727 ?auto_248730 ) ) ( not ( = ?auto_248728 ?auto_248729 ) ) ( not ( = ?auto_248728 ?auto_248730 ) ) ( not ( = ?auto_248729 ?auto_248730 ) ) ( ON ?auto_248728 ?auto_248729 ) ( ON ?auto_248727 ?auto_248728 ) ( ON ?auto_248726 ?auto_248727 ) ( ON ?auto_248725 ?auto_248726 ) ( ON ?auto_248724 ?auto_248725 ) ( ON ?auto_248723 ?auto_248724 ) ( ON ?auto_248722 ?auto_248723 ) ( CLEAR ?auto_248720 ) ( ON ?auto_248721 ?auto_248722 ) ( CLEAR ?auto_248721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248720 ?auto_248721 )
      ( MAKE-10PILE ?auto_248720 ?auto_248721 ?auto_248722 ?auto_248723 ?auto_248724 ?auto_248725 ?auto_248726 ?auto_248727 ?auto_248728 ?auto_248729 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248762 - BLOCK
      ?auto_248763 - BLOCK
      ?auto_248764 - BLOCK
      ?auto_248765 - BLOCK
      ?auto_248766 - BLOCK
      ?auto_248767 - BLOCK
      ?auto_248768 - BLOCK
      ?auto_248769 - BLOCK
      ?auto_248770 - BLOCK
      ?auto_248771 - BLOCK
    )
    :vars
    (
      ?auto_248772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248771 ?auto_248772 ) ( not ( = ?auto_248762 ?auto_248763 ) ) ( not ( = ?auto_248762 ?auto_248764 ) ) ( not ( = ?auto_248762 ?auto_248765 ) ) ( not ( = ?auto_248762 ?auto_248766 ) ) ( not ( = ?auto_248762 ?auto_248767 ) ) ( not ( = ?auto_248762 ?auto_248768 ) ) ( not ( = ?auto_248762 ?auto_248769 ) ) ( not ( = ?auto_248762 ?auto_248770 ) ) ( not ( = ?auto_248762 ?auto_248771 ) ) ( not ( = ?auto_248762 ?auto_248772 ) ) ( not ( = ?auto_248763 ?auto_248764 ) ) ( not ( = ?auto_248763 ?auto_248765 ) ) ( not ( = ?auto_248763 ?auto_248766 ) ) ( not ( = ?auto_248763 ?auto_248767 ) ) ( not ( = ?auto_248763 ?auto_248768 ) ) ( not ( = ?auto_248763 ?auto_248769 ) ) ( not ( = ?auto_248763 ?auto_248770 ) ) ( not ( = ?auto_248763 ?auto_248771 ) ) ( not ( = ?auto_248763 ?auto_248772 ) ) ( not ( = ?auto_248764 ?auto_248765 ) ) ( not ( = ?auto_248764 ?auto_248766 ) ) ( not ( = ?auto_248764 ?auto_248767 ) ) ( not ( = ?auto_248764 ?auto_248768 ) ) ( not ( = ?auto_248764 ?auto_248769 ) ) ( not ( = ?auto_248764 ?auto_248770 ) ) ( not ( = ?auto_248764 ?auto_248771 ) ) ( not ( = ?auto_248764 ?auto_248772 ) ) ( not ( = ?auto_248765 ?auto_248766 ) ) ( not ( = ?auto_248765 ?auto_248767 ) ) ( not ( = ?auto_248765 ?auto_248768 ) ) ( not ( = ?auto_248765 ?auto_248769 ) ) ( not ( = ?auto_248765 ?auto_248770 ) ) ( not ( = ?auto_248765 ?auto_248771 ) ) ( not ( = ?auto_248765 ?auto_248772 ) ) ( not ( = ?auto_248766 ?auto_248767 ) ) ( not ( = ?auto_248766 ?auto_248768 ) ) ( not ( = ?auto_248766 ?auto_248769 ) ) ( not ( = ?auto_248766 ?auto_248770 ) ) ( not ( = ?auto_248766 ?auto_248771 ) ) ( not ( = ?auto_248766 ?auto_248772 ) ) ( not ( = ?auto_248767 ?auto_248768 ) ) ( not ( = ?auto_248767 ?auto_248769 ) ) ( not ( = ?auto_248767 ?auto_248770 ) ) ( not ( = ?auto_248767 ?auto_248771 ) ) ( not ( = ?auto_248767 ?auto_248772 ) ) ( not ( = ?auto_248768 ?auto_248769 ) ) ( not ( = ?auto_248768 ?auto_248770 ) ) ( not ( = ?auto_248768 ?auto_248771 ) ) ( not ( = ?auto_248768 ?auto_248772 ) ) ( not ( = ?auto_248769 ?auto_248770 ) ) ( not ( = ?auto_248769 ?auto_248771 ) ) ( not ( = ?auto_248769 ?auto_248772 ) ) ( not ( = ?auto_248770 ?auto_248771 ) ) ( not ( = ?auto_248770 ?auto_248772 ) ) ( not ( = ?auto_248771 ?auto_248772 ) ) ( ON ?auto_248770 ?auto_248771 ) ( ON ?auto_248769 ?auto_248770 ) ( ON ?auto_248768 ?auto_248769 ) ( ON ?auto_248767 ?auto_248768 ) ( ON ?auto_248766 ?auto_248767 ) ( ON ?auto_248765 ?auto_248766 ) ( ON ?auto_248764 ?auto_248765 ) ( ON ?auto_248763 ?auto_248764 ) ( ON ?auto_248762 ?auto_248763 ) ( CLEAR ?auto_248762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248762 )
      ( MAKE-10PILE ?auto_248762 ?auto_248763 ?auto_248764 ?auto_248765 ?auto_248766 ?auto_248767 ?auto_248768 ?auto_248769 ?auto_248770 ?auto_248771 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248805 - BLOCK
      ?auto_248806 - BLOCK
      ?auto_248807 - BLOCK
      ?auto_248808 - BLOCK
      ?auto_248809 - BLOCK
      ?auto_248810 - BLOCK
      ?auto_248811 - BLOCK
      ?auto_248812 - BLOCK
      ?auto_248813 - BLOCK
      ?auto_248814 - BLOCK
      ?auto_248815 - BLOCK
    )
    :vars
    (
      ?auto_248816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248814 ) ( ON ?auto_248815 ?auto_248816 ) ( CLEAR ?auto_248815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248805 ) ( ON ?auto_248806 ?auto_248805 ) ( ON ?auto_248807 ?auto_248806 ) ( ON ?auto_248808 ?auto_248807 ) ( ON ?auto_248809 ?auto_248808 ) ( ON ?auto_248810 ?auto_248809 ) ( ON ?auto_248811 ?auto_248810 ) ( ON ?auto_248812 ?auto_248811 ) ( ON ?auto_248813 ?auto_248812 ) ( ON ?auto_248814 ?auto_248813 ) ( not ( = ?auto_248805 ?auto_248806 ) ) ( not ( = ?auto_248805 ?auto_248807 ) ) ( not ( = ?auto_248805 ?auto_248808 ) ) ( not ( = ?auto_248805 ?auto_248809 ) ) ( not ( = ?auto_248805 ?auto_248810 ) ) ( not ( = ?auto_248805 ?auto_248811 ) ) ( not ( = ?auto_248805 ?auto_248812 ) ) ( not ( = ?auto_248805 ?auto_248813 ) ) ( not ( = ?auto_248805 ?auto_248814 ) ) ( not ( = ?auto_248805 ?auto_248815 ) ) ( not ( = ?auto_248805 ?auto_248816 ) ) ( not ( = ?auto_248806 ?auto_248807 ) ) ( not ( = ?auto_248806 ?auto_248808 ) ) ( not ( = ?auto_248806 ?auto_248809 ) ) ( not ( = ?auto_248806 ?auto_248810 ) ) ( not ( = ?auto_248806 ?auto_248811 ) ) ( not ( = ?auto_248806 ?auto_248812 ) ) ( not ( = ?auto_248806 ?auto_248813 ) ) ( not ( = ?auto_248806 ?auto_248814 ) ) ( not ( = ?auto_248806 ?auto_248815 ) ) ( not ( = ?auto_248806 ?auto_248816 ) ) ( not ( = ?auto_248807 ?auto_248808 ) ) ( not ( = ?auto_248807 ?auto_248809 ) ) ( not ( = ?auto_248807 ?auto_248810 ) ) ( not ( = ?auto_248807 ?auto_248811 ) ) ( not ( = ?auto_248807 ?auto_248812 ) ) ( not ( = ?auto_248807 ?auto_248813 ) ) ( not ( = ?auto_248807 ?auto_248814 ) ) ( not ( = ?auto_248807 ?auto_248815 ) ) ( not ( = ?auto_248807 ?auto_248816 ) ) ( not ( = ?auto_248808 ?auto_248809 ) ) ( not ( = ?auto_248808 ?auto_248810 ) ) ( not ( = ?auto_248808 ?auto_248811 ) ) ( not ( = ?auto_248808 ?auto_248812 ) ) ( not ( = ?auto_248808 ?auto_248813 ) ) ( not ( = ?auto_248808 ?auto_248814 ) ) ( not ( = ?auto_248808 ?auto_248815 ) ) ( not ( = ?auto_248808 ?auto_248816 ) ) ( not ( = ?auto_248809 ?auto_248810 ) ) ( not ( = ?auto_248809 ?auto_248811 ) ) ( not ( = ?auto_248809 ?auto_248812 ) ) ( not ( = ?auto_248809 ?auto_248813 ) ) ( not ( = ?auto_248809 ?auto_248814 ) ) ( not ( = ?auto_248809 ?auto_248815 ) ) ( not ( = ?auto_248809 ?auto_248816 ) ) ( not ( = ?auto_248810 ?auto_248811 ) ) ( not ( = ?auto_248810 ?auto_248812 ) ) ( not ( = ?auto_248810 ?auto_248813 ) ) ( not ( = ?auto_248810 ?auto_248814 ) ) ( not ( = ?auto_248810 ?auto_248815 ) ) ( not ( = ?auto_248810 ?auto_248816 ) ) ( not ( = ?auto_248811 ?auto_248812 ) ) ( not ( = ?auto_248811 ?auto_248813 ) ) ( not ( = ?auto_248811 ?auto_248814 ) ) ( not ( = ?auto_248811 ?auto_248815 ) ) ( not ( = ?auto_248811 ?auto_248816 ) ) ( not ( = ?auto_248812 ?auto_248813 ) ) ( not ( = ?auto_248812 ?auto_248814 ) ) ( not ( = ?auto_248812 ?auto_248815 ) ) ( not ( = ?auto_248812 ?auto_248816 ) ) ( not ( = ?auto_248813 ?auto_248814 ) ) ( not ( = ?auto_248813 ?auto_248815 ) ) ( not ( = ?auto_248813 ?auto_248816 ) ) ( not ( = ?auto_248814 ?auto_248815 ) ) ( not ( = ?auto_248814 ?auto_248816 ) ) ( not ( = ?auto_248815 ?auto_248816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248815 ?auto_248816 )
      ( !STACK ?auto_248815 ?auto_248814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248851 - BLOCK
      ?auto_248852 - BLOCK
      ?auto_248853 - BLOCK
      ?auto_248854 - BLOCK
      ?auto_248855 - BLOCK
      ?auto_248856 - BLOCK
      ?auto_248857 - BLOCK
      ?auto_248858 - BLOCK
      ?auto_248859 - BLOCK
      ?auto_248860 - BLOCK
      ?auto_248861 - BLOCK
    )
    :vars
    (
      ?auto_248862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248861 ?auto_248862 ) ( ON-TABLE ?auto_248851 ) ( ON ?auto_248852 ?auto_248851 ) ( ON ?auto_248853 ?auto_248852 ) ( ON ?auto_248854 ?auto_248853 ) ( ON ?auto_248855 ?auto_248854 ) ( ON ?auto_248856 ?auto_248855 ) ( ON ?auto_248857 ?auto_248856 ) ( ON ?auto_248858 ?auto_248857 ) ( ON ?auto_248859 ?auto_248858 ) ( not ( = ?auto_248851 ?auto_248852 ) ) ( not ( = ?auto_248851 ?auto_248853 ) ) ( not ( = ?auto_248851 ?auto_248854 ) ) ( not ( = ?auto_248851 ?auto_248855 ) ) ( not ( = ?auto_248851 ?auto_248856 ) ) ( not ( = ?auto_248851 ?auto_248857 ) ) ( not ( = ?auto_248851 ?auto_248858 ) ) ( not ( = ?auto_248851 ?auto_248859 ) ) ( not ( = ?auto_248851 ?auto_248860 ) ) ( not ( = ?auto_248851 ?auto_248861 ) ) ( not ( = ?auto_248851 ?auto_248862 ) ) ( not ( = ?auto_248852 ?auto_248853 ) ) ( not ( = ?auto_248852 ?auto_248854 ) ) ( not ( = ?auto_248852 ?auto_248855 ) ) ( not ( = ?auto_248852 ?auto_248856 ) ) ( not ( = ?auto_248852 ?auto_248857 ) ) ( not ( = ?auto_248852 ?auto_248858 ) ) ( not ( = ?auto_248852 ?auto_248859 ) ) ( not ( = ?auto_248852 ?auto_248860 ) ) ( not ( = ?auto_248852 ?auto_248861 ) ) ( not ( = ?auto_248852 ?auto_248862 ) ) ( not ( = ?auto_248853 ?auto_248854 ) ) ( not ( = ?auto_248853 ?auto_248855 ) ) ( not ( = ?auto_248853 ?auto_248856 ) ) ( not ( = ?auto_248853 ?auto_248857 ) ) ( not ( = ?auto_248853 ?auto_248858 ) ) ( not ( = ?auto_248853 ?auto_248859 ) ) ( not ( = ?auto_248853 ?auto_248860 ) ) ( not ( = ?auto_248853 ?auto_248861 ) ) ( not ( = ?auto_248853 ?auto_248862 ) ) ( not ( = ?auto_248854 ?auto_248855 ) ) ( not ( = ?auto_248854 ?auto_248856 ) ) ( not ( = ?auto_248854 ?auto_248857 ) ) ( not ( = ?auto_248854 ?auto_248858 ) ) ( not ( = ?auto_248854 ?auto_248859 ) ) ( not ( = ?auto_248854 ?auto_248860 ) ) ( not ( = ?auto_248854 ?auto_248861 ) ) ( not ( = ?auto_248854 ?auto_248862 ) ) ( not ( = ?auto_248855 ?auto_248856 ) ) ( not ( = ?auto_248855 ?auto_248857 ) ) ( not ( = ?auto_248855 ?auto_248858 ) ) ( not ( = ?auto_248855 ?auto_248859 ) ) ( not ( = ?auto_248855 ?auto_248860 ) ) ( not ( = ?auto_248855 ?auto_248861 ) ) ( not ( = ?auto_248855 ?auto_248862 ) ) ( not ( = ?auto_248856 ?auto_248857 ) ) ( not ( = ?auto_248856 ?auto_248858 ) ) ( not ( = ?auto_248856 ?auto_248859 ) ) ( not ( = ?auto_248856 ?auto_248860 ) ) ( not ( = ?auto_248856 ?auto_248861 ) ) ( not ( = ?auto_248856 ?auto_248862 ) ) ( not ( = ?auto_248857 ?auto_248858 ) ) ( not ( = ?auto_248857 ?auto_248859 ) ) ( not ( = ?auto_248857 ?auto_248860 ) ) ( not ( = ?auto_248857 ?auto_248861 ) ) ( not ( = ?auto_248857 ?auto_248862 ) ) ( not ( = ?auto_248858 ?auto_248859 ) ) ( not ( = ?auto_248858 ?auto_248860 ) ) ( not ( = ?auto_248858 ?auto_248861 ) ) ( not ( = ?auto_248858 ?auto_248862 ) ) ( not ( = ?auto_248859 ?auto_248860 ) ) ( not ( = ?auto_248859 ?auto_248861 ) ) ( not ( = ?auto_248859 ?auto_248862 ) ) ( not ( = ?auto_248860 ?auto_248861 ) ) ( not ( = ?auto_248860 ?auto_248862 ) ) ( not ( = ?auto_248861 ?auto_248862 ) ) ( CLEAR ?auto_248859 ) ( ON ?auto_248860 ?auto_248861 ) ( CLEAR ?auto_248860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_248851 ?auto_248852 ?auto_248853 ?auto_248854 ?auto_248855 ?auto_248856 ?auto_248857 ?auto_248858 ?auto_248859 ?auto_248860 )
      ( MAKE-11PILE ?auto_248851 ?auto_248852 ?auto_248853 ?auto_248854 ?auto_248855 ?auto_248856 ?auto_248857 ?auto_248858 ?auto_248859 ?auto_248860 ?auto_248861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248897 - BLOCK
      ?auto_248898 - BLOCK
      ?auto_248899 - BLOCK
      ?auto_248900 - BLOCK
      ?auto_248901 - BLOCK
      ?auto_248902 - BLOCK
      ?auto_248903 - BLOCK
      ?auto_248904 - BLOCK
      ?auto_248905 - BLOCK
      ?auto_248906 - BLOCK
      ?auto_248907 - BLOCK
    )
    :vars
    (
      ?auto_248908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248907 ?auto_248908 ) ( ON-TABLE ?auto_248897 ) ( ON ?auto_248898 ?auto_248897 ) ( ON ?auto_248899 ?auto_248898 ) ( ON ?auto_248900 ?auto_248899 ) ( ON ?auto_248901 ?auto_248900 ) ( ON ?auto_248902 ?auto_248901 ) ( ON ?auto_248903 ?auto_248902 ) ( ON ?auto_248904 ?auto_248903 ) ( not ( = ?auto_248897 ?auto_248898 ) ) ( not ( = ?auto_248897 ?auto_248899 ) ) ( not ( = ?auto_248897 ?auto_248900 ) ) ( not ( = ?auto_248897 ?auto_248901 ) ) ( not ( = ?auto_248897 ?auto_248902 ) ) ( not ( = ?auto_248897 ?auto_248903 ) ) ( not ( = ?auto_248897 ?auto_248904 ) ) ( not ( = ?auto_248897 ?auto_248905 ) ) ( not ( = ?auto_248897 ?auto_248906 ) ) ( not ( = ?auto_248897 ?auto_248907 ) ) ( not ( = ?auto_248897 ?auto_248908 ) ) ( not ( = ?auto_248898 ?auto_248899 ) ) ( not ( = ?auto_248898 ?auto_248900 ) ) ( not ( = ?auto_248898 ?auto_248901 ) ) ( not ( = ?auto_248898 ?auto_248902 ) ) ( not ( = ?auto_248898 ?auto_248903 ) ) ( not ( = ?auto_248898 ?auto_248904 ) ) ( not ( = ?auto_248898 ?auto_248905 ) ) ( not ( = ?auto_248898 ?auto_248906 ) ) ( not ( = ?auto_248898 ?auto_248907 ) ) ( not ( = ?auto_248898 ?auto_248908 ) ) ( not ( = ?auto_248899 ?auto_248900 ) ) ( not ( = ?auto_248899 ?auto_248901 ) ) ( not ( = ?auto_248899 ?auto_248902 ) ) ( not ( = ?auto_248899 ?auto_248903 ) ) ( not ( = ?auto_248899 ?auto_248904 ) ) ( not ( = ?auto_248899 ?auto_248905 ) ) ( not ( = ?auto_248899 ?auto_248906 ) ) ( not ( = ?auto_248899 ?auto_248907 ) ) ( not ( = ?auto_248899 ?auto_248908 ) ) ( not ( = ?auto_248900 ?auto_248901 ) ) ( not ( = ?auto_248900 ?auto_248902 ) ) ( not ( = ?auto_248900 ?auto_248903 ) ) ( not ( = ?auto_248900 ?auto_248904 ) ) ( not ( = ?auto_248900 ?auto_248905 ) ) ( not ( = ?auto_248900 ?auto_248906 ) ) ( not ( = ?auto_248900 ?auto_248907 ) ) ( not ( = ?auto_248900 ?auto_248908 ) ) ( not ( = ?auto_248901 ?auto_248902 ) ) ( not ( = ?auto_248901 ?auto_248903 ) ) ( not ( = ?auto_248901 ?auto_248904 ) ) ( not ( = ?auto_248901 ?auto_248905 ) ) ( not ( = ?auto_248901 ?auto_248906 ) ) ( not ( = ?auto_248901 ?auto_248907 ) ) ( not ( = ?auto_248901 ?auto_248908 ) ) ( not ( = ?auto_248902 ?auto_248903 ) ) ( not ( = ?auto_248902 ?auto_248904 ) ) ( not ( = ?auto_248902 ?auto_248905 ) ) ( not ( = ?auto_248902 ?auto_248906 ) ) ( not ( = ?auto_248902 ?auto_248907 ) ) ( not ( = ?auto_248902 ?auto_248908 ) ) ( not ( = ?auto_248903 ?auto_248904 ) ) ( not ( = ?auto_248903 ?auto_248905 ) ) ( not ( = ?auto_248903 ?auto_248906 ) ) ( not ( = ?auto_248903 ?auto_248907 ) ) ( not ( = ?auto_248903 ?auto_248908 ) ) ( not ( = ?auto_248904 ?auto_248905 ) ) ( not ( = ?auto_248904 ?auto_248906 ) ) ( not ( = ?auto_248904 ?auto_248907 ) ) ( not ( = ?auto_248904 ?auto_248908 ) ) ( not ( = ?auto_248905 ?auto_248906 ) ) ( not ( = ?auto_248905 ?auto_248907 ) ) ( not ( = ?auto_248905 ?auto_248908 ) ) ( not ( = ?auto_248906 ?auto_248907 ) ) ( not ( = ?auto_248906 ?auto_248908 ) ) ( not ( = ?auto_248907 ?auto_248908 ) ) ( ON ?auto_248906 ?auto_248907 ) ( CLEAR ?auto_248904 ) ( ON ?auto_248905 ?auto_248906 ) ( CLEAR ?auto_248905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248897 ?auto_248898 ?auto_248899 ?auto_248900 ?auto_248901 ?auto_248902 ?auto_248903 ?auto_248904 ?auto_248905 )
      ( MAKE-11PILE ?auto_248897 ?auto_248898 ?auto_248899 ?auto_248900 ?auto_248901 ?auto_248902 ?auto_248903 ?auto_248904 ?auto_248905 ?auto_248906 ?auto_248907 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248943 - BLOCK
      ?auto_248944 - BLOCK
      ?auto_248945 - BLOCK
      ?auto_248946 - BLOCK
      ?auto_248947 - BLOCK
      ?auto_248948 - BLOCK
      ?auto_248949 - BLOCK
      ?auto_248950 - BLOCK
      ?auto_248951 - BLOCK
      ?auto_248952 - BLOCK
      ?auto_248953 - BLOCK
    )
    :vars
    (
      ?auto_248954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248953 ?auto_248954 ) ( ON-TABLE ?auto_248943 ) ( ON ?auto_248944 ?auto_248943 ) ( ON ?auto_248945 ?auto_248944 ) ( ON ?auto_248946 ?auto_248945 ) ( ON ?auto_248947 ?auto_248946 ) ( ON ?auto_248948 ?auto_248947 ) ( ON ?auto_248949 ?auto_248948 ) ( not ( = ?auto_248943 ?auto_248944 ) ) ( not ( = ?auto_248943 ?auto_248945 ) ) ( not ( = ?auto_248943 ?auto_248946 ) ) ( not ( = ?auto_248943 ?auto_248947 ) ) ( not ( = ?auto_248943 ?auto_248948 ) ) ( not ( = ?auto_248943 ?auto_248949 ) ) ( not ( = ?auto_248943 ?auto_248950 ) ) ( not ( = ?auto_248943 ?auto_248951 ) ) ( not ( = ?auto_248943 ?auto_248952 ) ) ( not ( = ?auto_248943 ?auto_248953 ) ) ( not ( = ?auto_248943 ?auto_248954 ) ) ( not ( = ?auto_248944 ?auto_248945 ) ) ( not ( = ?auto_248944 ?auto_248946 ) ) ( not ( = ?auto_248944 ?auto_248947 ) ) ( not ( = ?auto_248944 ?auto_248948 ) ) ( not ( = ?auto_248944 ?auto_248949 ) ) ( not ( = ?auto_248944 ?auto_248950 ) ) ( not ( = ?auto_248944 ?auto_248951 ) ) ( not ( = ?auto_248944 ?auto_248952 ) ) ( not ( = ?auto_248944 ?auto_248953 ) ) ( not ( = ?auto_248944 ?auto_248954 ) ) ( not ( = ?auto_248945 ?auto_248946 ) ) ( not ( = ?auto_248945 ?auto_248947 ) ) ( not ( = ?auto_248945 ?auto_248948 ) ) ( not ( = ?auto_248945 ?auto_248949 ) ) ( not ( = ?auto_248945 ?auto_248950 ) ) ( not ( = ?auto_248945 ?auto_248951 ) ) ( not ( = ?auto_248945 ?auto_248952 ) ) ( not ( = ?auto_248945 ?auto_248953 ) ) ( not ( = ?auto_248945 ?auto_248954 ) ) ( not ( = ?auto_248946 ?auto_248947 ) ) ( not ( = ?auto_248946 ?auto_248948 ) ) ( not ( = ?auto_248946 ?auto_248949 ) ) ( not ( = ?auto_248946 ?auto_248950 ) ) ( not ( = ?auto_248946 ?auto_248951 ) ) ( not ( = ?auto_248946 ?auto_248952 ) ) ( not ( = ?auto_248946 ?auto_248953 ) ) ( not ( = ?auto_248946 ?auto_248954 ) ) ( not ( = ?auto_248947 ?auto_248948 ) ) ( not ( = ?auto_248947 ?auto_248949 ) ) ( not ( = ?auto_248947 ?auto_248950 ) ) ( not ( = ?auto_248947 ?auto_248951 ) ) ( not ( = ?auto_248947 ?auto_248952 ) ) ( not ( = ?auto_248947 ?auto_248953 ) ) ( not ( = ?auto_248947 ?auto_248954 ) ) ( not ( = ?auto_248948 ?auto_248949 ) ) ( not ( = ?auto_248948 ?auto_248950 ) ) ( not ( = ?auto_248948 ?auto_248951 ) ) ( not ( = ?auto_248948 ?auto_248952 ) ) ( not ( = ?auto_248948 ?auto_248953 ) ) ( not ( = ?auto_248948 ?auto_248954 ) ) ( not ( = ?auto_248949 ?auto_248950 ) ) ( not ( = ?auto_248949 ?auto_248951 ) ) ( not ( = ?auto_248949 ?auto_248952 ) ) ( not ( = ?auto_248949 ?auto_248953 ) ) ( not ( = ?auto_248949 ?auto_248954 ) ) ( not ( = ?auto_248950 ?auto_248951 ) ) ( not ( = ?auto_248950 ?auto_248952 ) ) ( not ( = ?auto_248950 ?auto_248953 ) ) ( not ( = ?auto_248950 ?auto_248954 ) ) ( not ( = ?auto_248951 ?auto_248952 ) ) ( not ( = ?auto_248951 ?auto_248953 ) ) ( not ( = ?auto_248951 ?auto_248954 ) ) ( not ( = ?auto_248952 ?auto_248953 ) ) ( not ( = ?auto_248952 ?auto_248954 ) ) ( not ( = ?auto_248953 ?auto_248954 ) ) ( ON ?auto_248952 ?auto_248953 ) ( ON ?auto_248951 ?auto_248952 ) ( CLEAR ?auto_248949 ) ( ON ?auto_248950 ?auto_248951 ) ( CLEAR ?auto_248950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248943 ?auto_248944 ?auto_248945 ?auto_248946 ?auto_248947 ?auto_248948 ?auto_248949 ?auto_248950 )
      ( MAKE-11PILE ?auto_248943 ?auto_248944 ?auto_248945 ?auto_248946 ?auto_248947 ?auto_248948 ?auto_248949 ?auto_248950 ?auto_248951 ?auto_248952 ?auto_248953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248989 - BLOCK
      ?auto_248990 - BLOCK
      ?auto_248991 - BLOCK
      ?auto_248992 - BLOCK
      ?auto_248993 - BLOCK
      ?auto_248994 - BLOCK
      ?auto_248995 - BLOCK
      ?auto_248996 - BLOCK
      ?auto_248997 - BLOCK
      ?auto_248998 - BLOCK
      ?auto_248999 - BLOCK
    )
    :vars
    (
      ?auto_249000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248999 ?auto_249000 ) ( ON-TABLE ?auto_248989 ) ( ON ?auto_248990 ?auto_248989 ) ( ON ?auto_248991 ?auto_248990 ) ( ON ?auto_248992 ?auto_248991 ) ( ON ?auto_248993 ?auto_248992 ) ( ON ?auto_248994 ?auto_248993 ) ( not ( = ?auto_248989 ?auto_248990 ) ) ( not ( = ?auto_248989 ?auto_248991 ) ) ( not ( = ?auto_248989 ?auto_248992 ) ) ( not ( = ?auto_248989 ?auto_248993 ) ) ( not ( = ?auto_248989 ?auto_248994 ) ) ( not ( = ?auto_248989 ?auto_248995 ) ) ( not ( = ?auto_248989 ?auto_248996 ) ) ( not ( = ?auto_248989 ?auto_248997 ) ) ( not ( = ?auto_248989 ?auto_248998 ) ) ( not ( = ?auto_248989 ?auto_248999 ) ) ( not ( = ?auto_248989 ?auto_249000 ) ) ( not ( = ?auto_248990 ?auto_248991 ) ) ( not ( = ?auto_248990 ?auto_248992 ) ) ( not ( = ?auto_248990 ?auto_248993 ) ) ( not ( = ?auto_248990 ?auto_248994 ) ) ( not ( = ?auto_248990 ?auto_248995 ) ) ( not ( = ?auto_248990 ?auto_248996 ) ) ( not ( = ?auto_248990 ?auto_248997 ) ) ( not ( = ?auto_248990 ?auto_248998 ) ) ( not ( = ?auto_248990 ?auto_248999 ) ) ( not ( = ?auto_248990 ?auto_249000 ) ) ( not ( = ?auto_248991 ?auto_248992 ) ) ( not ( = ?auto_248991 ?auto_248993 ) ) ( not ( = ?auto_248991 ?auto_248994 ) ) ( not ( = ?auto_248991 ?auto_248995 ) ) ( not ( = ?auto_248991 ?auto_248996 ) ) ( not ( = ?auto_248991 ?auto_248997 ) ) ( not ( = ?auto_248991 ?auto_248998 ) ) ( not ( = ?auto_248991 ?auto_248999 ) ) ( not ( = ?auto_248991 ?auto_249000 ) ) ( not ( = ?auto_248992 ?auto_248993 ) ) ( not ( = ?auto_248992 ?auto_248994 ) ) ( not ( = ?auto_248992 ?auto_248995 ) ) ( not ( = ?auto_248992 ?auto_248996 ) ) ( not ( = ?auto_248992 ?auto_248997 ) ) ( not ( = ?auto_248992 ?auto_248998 ) ) ( not ( = ?auto_248992 ?auto_248999 ) ) ( not ( = ?auto_248992 ?auto_249000 ) ) ( not ( = ?auto_248993 ?auto_248994 ) ) ( not ( = ?auto_248993 ?auto_248995 ) ) ( not ( = ?auto_248993 ?auto_248996 ) ) ( not ( = ?auto_248993 ?auto_248997 ) ) ( not ( = ?auto_248993 ?auto_248998 ) ) ( not ( = ?auto_248993 ?auto_248999 ) ) ( not ( = ?auto_248993 ?auto_249000 ) ) ( not ( = ?auto_248994 ?auto_248995 ) ) ( not ( = ?auto_248994 ?auto_248996 ) ) ( not ( = ?auto_248994 ?auto_248997 ) ) ( not ( = ?auto_248994 ?auto_248998 ) ) ( not ( = ?auto_248994 ?auto_248999 ) ) ( not ( = ?auto_248994 ?auto_249000 ) ) ( not ( = ?auto_248995 ?auto_248996 ) ) ( not ( = ?auto_248995 ?auto_248997 ) ) ( not ( = ?auto_248995 ?auto_248998 ) ) ( not ( = ?auto_248995 ?auto_248999 ) ) ( not ( = ?auto_248995 ?auto_249000 ) ) ( not ( = ?auto_248996 ?auto_248997 ) ) ( not ( = ?auto_248996 ?auto_248998 ) ) ( not ( = ?auto_248996 ?auto_248999 ) ) ( not ( = ?auto_248996 ?auto_249000 ) ) ( not ( = ?auto_248997 ?auto_248998 ) ) ( not ( = ?auto_248997 ?auto_248999 ) ) ( not ( = ?auto_248997 ?auto_249000 ) ) ( not ( = ?auto_248998 ?auto_248999 ) ) ( not ( = ?auto_248998 ?auto_249000 ) ) ( not ( = ?auto_248999 ?auto_249000 ) ) ( ON ?auto_248998 ?auto_248999 ) ( ON ?auto_248997 ?auto_248998 ) ( ON ?auto_248996 ?auto_248997 ) ( CLEAR ?auto_248994 ) ( ON ?auto_248995 ?auto_248996 ) ( CLEAR ?auto_248995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248989 ?auto_248990 ?auto_248991 ?auto_248992 ?auto_248993 ?auto_248994 ?auto_248995 )
      ( MAKE-11PILE ?auto_248989 ?auto_248990 ?auto_248991 ?auto_248992 ?auto_248993 ?auto_248994 ?auto_248995 ?auto_248996 ?auto_248997 ?auto_248998 ?auto_248999 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249035 - BLOCK
      ?auto_249036 - BLOCK
      ?auto_249037 - BLOCK
      ?auto_249038 - BLOCK
      ?auto_249039 - BLOCK
      ?auto_249040 - BLOCK
      ?auto_249041 - BLOCK
      ?auto_249042 - BLOCK
      ?auto_249043 - BLOCK
      ?auto_249044 - BLOCK
      ?auto_249045 - BLOCK
    )
    :vars
    (
      ?auto_249046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249045 ?auto_249046 ) ( ON-TABLE ?auto_249035 ) ( ON ?auto_249036 ?auto_249035 ) ( ON ?auto_249037 ?auto_249036 ) ( ON ?auto_249038 ?auto_249037 ) ( ON ?auto_249039 ?auto_249038 ) ( not ( = ?auto_249035 ?auto_249036 ) ) ( not ( = ?auto_249035 ?auto_249037 ) ) ( not ( = ?auto_249035 ?auto_249038 ) ) ( not ( = ?auto_249035 ?auto_249039 ) ) ( not ( = ?auto_249035 ?auto_249040 ) ) ( not ( = ?auto_249035 ?auto_249041 ) ) ( not ( = ?auto_249035 ?auto_249042 ) ) ( not ( = ?auto_249035 ?auto_249043 ) ) ( not ( = ?auto_249035 ?auto_249044 ) ) ( not ( = ?auto_249035 ?auto_249045 ) ) ( not ( = ?auto_249035 ?auto_249046 ) ) ( not ( = ?auto_249036 ?auto_249037 ) ) ( not ( = ?auto_249036 ?auto_249038 ) ) ( not ( = ?auto_249036 ?auto_249039 ) ) ( not ( = ?auto_249036 ?auto_249040 ) ) ( not ( = ?auto_249036 ?auto_249041 ) ) ( not ( = ?auto_249036 ?auto_249042 ) ) ( not ( = ?auto_249036 ?auto_249043 ) ) ( not ( = ?auto_249036 ?auto_249044 ) ) ( not ( = ?auto_249036 ?auto_249045 ) ) ( not ( = ?auto_249036 ?auto_249046 ) ) ( not ( = ?auto_249037 ?auto_249038 ) ) ( not ( = ?auto_249037 ?auto_249039 ) ) ( not ( = ?auto_249037 ?auto_249040 ) ) ( not ( = ?auto_249037 ?auto_249041 ) ) ( not ( = ?auto_249037 ?auto_249042 ) ) ( not ( = ?auto_249037 ?auto_249043 ) ) ( not ( = ?auto_249037 ?auto_249044 ) ) ( not ( = ?auto_249037 ?auto_249045 ) ) ( not ( = ?auto_249037 ?auto_249046 ) ) ( not ( = ?auto_249038 ?auto_249039 ) ) ( not ( = ?auto_249038 ?auto_249040 ) ) ( not ( = ?auto_249038 ?auto_249041 ) ) ( not ( = ?auto_249038 ?auto_249042 ) ) ( not ( = ?auto_249038 ?auto_249043 ) ) ( not ( = ?auto_249038 ?auto_249044 ) ) ( not ( = ?auto_249038 ?auto_249045 ) ) ( not ( = ?auto_249038 ?auto_249046 ) ) ( not ( = ?auto_249039 ?auto_249040 ) ) ( not ( = ?auto_249039 ?auto_249041 ) ) ( not ( = ?auto_249039 ?auto_249042 ) ) ( not ( = ?auto_249039 ?auto_249043 ) ) ( not ( = ?auto_249039 ?auto_249044 ) ) ( not ( = ?auto_249039 ?auto_249045 ) ) ( not ( = ?auto_249039 ?auto_249046 ) ) ( not ( = ?auto_249040 ?auto_249041 ) ) ( not ( = ?auto_249040 ?auto_249042 ) ) ( not ( = ?auto_249040 ?auto_249043 ) ) ( not ( = ?auto_249040 ?auto_249044 ) ) ( not ( = ?auto_249040 ?auto_249045 ) ) ( not ( = ?auto_249040 ?auto_249046 ) ) ( not ( = ?auto_249041 ?auto_249042 ) ) ( not ( = ?auto_249041 ?auto_249043 ) ) ( not ( = ?auto_249041 ?auto_249044 ) ) ( not ( = ?auto_249041 ?auto_249045 ) ) ( not ( = ?auto_249041 ?auto_249046 ) ) ( not ( = ?auto_249042 ?auto_249043 ) ) ( not ( = ?auto_249042 ?auto_249044 ) ) ( not ( = ?auto_249042 ?auto_249045 ) ) ( not ( = ?auto_249042 ?auto_249046 ) ) ( not ( = ?auto_249043 ?auto_249044 ) ) ( not ( = ?auto_249043 ?auto_249045 ) ) ( not ( = ?auto_249043 ?auto_249046 ) ) ( not ( = ?auto_249044 ?auto_249045 ) ) ( not ( = ?auto_249044 ?auto_249046 ) ) ( not ( = ?auto_249045 ?auto_249046 ) ) ( ON ?auto_249044 ?auto_249045 ) ( ON ?auto_249043 ?auto_249044 ) ( ON ?auto_249042 ?auto_249043 ) ( ON ?auto_249041 ?auto_249042 ) ( CLEAR ?auto_249039 ) ( ON ?auto_249040 ?auto_249041 ) ( CLEAR ?auto_249040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249035 ?auto_249036 ?auto_249037 ?auto_249038 ?auto_249039 ?auto_249040 )
      ( MAKE-11PILE ?auto_249035 ?auto_249036 ?auto_249037 ?auto_249038 ?auto_249039 ?auto_249040 ?auto_249041 ?auto_249042 ?auto_249043 ?auto_249044 ?auto_249045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249081 - BLOCK
      ?auto_249082 - BLOCK
      ?auto_249083 - BLOCK
      ?auto_249084 - BLOCK
      ?auto_249085 - BLOCK
      ?auto_249086 - BLOCK
      ?auto_249087 - BLOCK
      ?auto_249088 - BLOCK
      ?auto_249089 - BLOCK
      ?auto_249090 - BLOCK
      ?auto_249091 - BLOCK
    )
    :vars
    (
      ?auto_249092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249091 ?auto_249092 ) ( ON-TABLE ?auto_249081 ) ( ON ?auto_249082 ?auto_249081 ) ( ON ?auto_249083 ?auto_249082 ) ( ON ?auto_249084 ?auto_249083 ) ( not ( = ?auto_249081 ?auto_249082 ) ) ( not ( = ?auto_249081 ?auto_249083 ) ) ( not ( = ?auto_249081 ?auto_249084 ) ) ( not ( = ?auto_249081 ?auto_249085 ) ) ( not ( = ?auto_249081 ?auto_249086 ) ) ( not ( = ?auto_249081 ?auto_249087 ) ) ( not ( = ?auto_249081 ?auto_249088 ) ) ( not ( = ?auto_249081 ?auto_249089 ) ) ( not ( = ?auto_249081 ?auto_249090 ) ) ( not ( = ?auto_249081 ?auto_249091 ) ) ( not ( = ?auto_249081 ?auto_249092 ) ) ( not ( = ?auto_249082 ?auto_249083 ) ) ( not ( = ?auto_249082 ?auto_249084 ) ) ( not ( = ?auto_249082 ?auto_249085 ) ) ( not ( = ?auto_249082 ?auto_249086 ) ) ( not ( = ?auto_249082 ?auto_249087 ) ) ( not ( = ?auto_249082 ?auto_249088 ) ) ( not ( = ?auto_249082 ?auto_249089 ) ) ( not ( = ?auto_249082 ?auto_249090 ) ) ( not ( = ?auto_249082 ?auto_249091 ) ) ( not ( = ?auto_249082 ?auto_249092 ) ) ( not ( = ?auto_249083 ?auto_249084 ) ) ( not ( = ?auto_249083 ?auto_249085 ) ) ( not ( = ?auto_249083 ?auto_249086 ) ) ( not ( = ?auto_249083 ?auto_249087 ) ) ( not ( = ?auto_249083 ?auto_249088 ) ) ( not ( = ?auto_249083 ?auto_249089 ) ) ( not ( = ?auto_249083 ?auto_249090 ) ) ( not ( = ?auto_249083 ?auto_249091 ) ) ( not ( = ?auto_249083 ?auto_249092 ) ) ( not ( = ?auto_249084 ?auto_249085 ) ) ( not ( = ?auto_249084 ?auto_249086 ) ) ( not ( = ?auto_249084 ?auto_249087 ) ) ( not ( = ?auto_249084 ?auto_249088 ) ) ( not ( = ?auto_249084 ?auto_249089 ) ) ( not ( = ?auto_249084 ?auto_249090 ) ) ( not ( = ?auto_249084 ?auto_249091 ) ) ( not ( = ?auto_249084 ?auto_249092 ) ) ( not ( = ?auto_249085 ?auto_249086 ) ) ( not ( = ?auto_249085 ?auto_249087 ) ) ( not ( = ?auto_249085 ?auto_249088 ) ) ( not ( = ?auto_249085 ?auto_249089 ) ) ( not ( = ?auto_249085 ?auto_249090 ) ) ( not ( = ?auto_249085 ?auto_249091 ) ) ( not ( = ?auto_249085 ?auto_249092 ) ) ( not ( = ?auto_249086 ?auto_249087 ) ) ( not ( = ?auto_249086 ?auto_249088 ) ) ( not ( = ?auto_249086 ?auto_249089 ) ) ( not ( = ?auto_249086 ?auto_249090 ) ) ( not ( = ?auto_249086 ?auto_249091 ) ) ( not ( = ?auto_249086 ?auto_249092 ) ) ( not ( = ?auto_249087 ?auto_249088 ) ) ( not ( = ?auto_249087 ?auto_249089 ) ) ( not ( = ?auto_249087 ?auto_249090 ) ) ( not ( = ?auto_249087 ?auto_249091 ) ) ( not ( = ?auto_249087 ?auto_249092 ) ) ( not ( = ?auto_249088 ?auto_249089 ) ) ( not ( = ?auto_249088 ?auto_249090 ) ) ( not ( = ?auto_249088 ?auto_249091 ) ) ( not ( = ?auto_249088 ?auto_249092 ) ) ( not ( = ?auto_249089 ?auto_249090 ) ) ( not ( = ?auto_249089 ?auto_249091 ) ) ( not ( = ?auto_249089 ?auto_249092 ) ) ( not ( = ?auto_249090 ?auto_249091 ) ) ( not ( = ?auto_249090 ?auto_249092 ) ) ( not ( = ?auto_249091 ?auto_249092 ) ) ( ON ?auto_249090 ?auto_249091 ) ( ON ?auto_249089 ?auto_249090 ) ( ON ?auto_249088 ?auto_249089 ) ( ON ?auto_249087 ?auto_249088 ) ( ON ?auto_249086 ?auto_249087 ) ( CLEAR ?auto_249084 ) ( ON ?auto_249085 ?auto_249086 ) ( CLEAR ?auto_249085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249081 ?auto_249082 ?auto_249083 ?auto_249084 ?auto_249085 )
      ( MAKE-11PILE ?auto_249081 ?auto_249082 ?auto_249083 ?auto_249084 ?auto_249085 ?auto_249086 ?auto_249087 ?auto_249088 ?auto_249089 ?auto_249090 ?auto_249091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249127 - BLOCK
      ?auto_249128 - BLOCK
      ?auto_249129 - BLOCK
      ?auto_249130 - BLOCK
      ?auto_249131 - BLOCK
      ?auto_249132 - BLOCK
      ?auto_249133 - BLOCK
      ?auto_249134 - BLOCK
      ?auto_249135 - BLOCK
      ?auto_249136 - BLOCK
      ?auto_249137 - BLOCK
    )
    :vars
    (
      ?auto_249138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249137 ?auto_249138 ) ( ON-TABLE ?auto_249127 ) ( ON ?auto_249128 ?auto_249127 ) ( ON ?auto_249129 ?auto_249128 ) ( not ( = ?auto_249127 ?auto_249128 ) ) ( not ( = ?auto_249127 ?auto_249129 ) ) ( not ( = ?auto_249127 ?auto_249130 ) ) ( not ( = ?auto_249127 ?auto_249131 ) ) ( not ( = ?auto_249127 ?auto_249132 ) ) ( not ( = ?auto_249127 ?auto_249133 ) ) ( not ( = ?auto_249127 ?auto_249134 ) ) ( not ( = ?auto_249127 ?auto_249135 ) ) ( not ( = ?auto_249127 ?auto_249136 ) ) ( not ( = ?auto_249127 ?auto_249137 ) ) ( not ( = ?auto_249127 ?auto_249138 ) ) ( not ( = ?auto_249128 ?auto_249129 ) ) ( not ( = ?auto_249128 ?auto_249130 ) ) ( not ( = ?auto_249128 ?auto_249131 ) ) ( not ( = ?auto_249128 ?auto_249132 ) ) ( not ( = ?auto_249128 ?auto_249133 ) ) ( not ( = ?auto_249128 ?auto_249134 ) ) ( not ( = ?auto_249128 ?auto_249135 ) ) ( not ( = ?auto_249128 ?auto_249136 ) ) ( not ( = ?auto_249128 ?auto_249137 ) ) ( not ( = ?auto_249128 ?auto_249138 ) ) ( not ( = ?auto_249129 ?auto_249130 ) ) ( not ( = ?auto_249129 ?auto_249131 ) ) ( not ( = ?auto_249129 ?auto_249132 ) ) ( not ( = ?auto_249129 ?auto_249133 ) ) ( not ( = ?auto_249129 ?auto_249134 ) ) ( not ( = ?auto_249129 ?auto_249135 ) ) ( not ( = ?auto_249129 ?auto_249136 ) ) ( not ( = ?auto_249129 ?auto_249137 ) ) ( not ( = ?auto_249129 ?auto_249138 ) ) ( not ( = ?auto_249130 ?auto_249131 ) ) ( not ( = ?auto_249130 ?auto_249132 ) ) ( not ( = ?auto_249130 ?auto_249133 ) ) ( not ( = ?auto_249130 ?auto_249134 ) ) ( not ( = ?auto_249130 ?auto_249135 ) ) ( not ( = ?auto_249130 ?auto_249136 ) ) ( not ( = ?auto_249130 ?auto_249137 ) ) ( not ( = ?auto_249130 ?auto_249138 ) ) ( not ( = ?auto_249131 ?auto_249132 ) ) ( not ( = ?auto_249131 ?auto_249133 ) ) ( not ( = ?auto_249131 ?auto_249134 ) ) ( not ( = ?auto_249131 ?auto_249135 ) ) ( not ( = ?auto_249131 ?auto_249136 ) ) ( not ( = ?auto_249131 ?auto_249137 ) ) ( not ( = ?auto_249131 ?auto_249138 ) ) ( not ( = ?auto_249132 ?auto_249133 ) ) ( not ( = ?auto_249132 ?auto_249134 ) ) ( not ( = ?auto_249132 ?auto_249135 ) ) ( not ( = ?auto_249132 ?auto_249136 ) ) ( not ( = ?auto_249132 ?auto_249137 ) ) ( not ( = ?auto_249132 ?auto_249138 ) ) ( not ( = ?auto_249133 ?auto_249134 ) ) ( not ( = ?auto_249133 ?auto_249135 ) ) ( not ( = ?auto_249133 ?auto_249136 ) ) ( not ( = ?auto_249133 ?auto_249137 ) ) ( not ( = ?auto_249133 ?auto_249138 ) ) ( not ( = ?auto_249134 ?auto_249135 ) ) ( not ( = ?auto_249134 ?auto_249136 ) ) ( not ( = ?auto_249134 ?auto_249137 ) ) ( not ( = ?auto_249134 ?auto_249138 ) ) ( not ( = ?auto_249135 ?auto_249136 ) ) ( not ( = ?auto_249135 ?auto_249137 ) ) ( not ( = ?auto_249135 ?auto_249138 ) ) ( not ( = ?auto_249136 ?auto_249137 ) ) ( not ( = ?auto_249136 ?auto_249138 ) ) ( not ( = ?auto_249137 ?auto_249138 ) ) ( ON ?auto_249136 ?auto_249137 ) ( ON ?auto_249135 ?auto_249136 ) ( ON ?auto_249134 ?auto_249135 ) ( ON ?auto_249133 ?auto_249134 ) ( ON ?auto_249132 ?auto_249133 ) ( ON ?auto_249131 ?auto_249132 ) ( CLEAR ?auto_249129 ) ( ON ?auto_249130 ?auto_249131 ) ( CLEAR ?auto_249130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249127 ?auto_249128 ?auto_249129 ?auto_249130 )
      ( MAKE-11PILE ?auto_249127 ?auto_249128 ?auto_249129 ?auto_249130 ?auto_249131 ?auto_249132 ?auto_249133 ?auto_249134 ?auto_249135 ?auto_249136 ?auto_249137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249173 - BLOCK
      ?auto_249174 - BLOCK
      ?auto_249175 - BLOCK
      ?auto_249176 - BLOCK
      ?auto_249177 - BLOCK
      ?auto_249178 - BLOCK
      ?auto_249179 - BLOCK
      ?auto_249180 - BLOCK
      ?auto_249181 - BLOCK
      ?auto_249182 - BLOCK
      ?auto_249183 - BLOCK
    )
    :vars
    (
      ?auto_249184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249183 ?auto_249184 ) ( ON-TABLE ?auto_249173 ) ( ON ?auto_249174 ?auto_249173 ) ( not ( = ?auto_249173 ?auto_249174 ) ) ( not ( = ?auto_249173 ?auto_249175 ) ) ( not ( = ?auto_249173 ?auto_249176 ) ) ( not ( = ?auto_249173 ?auto_249177 ) ) ( not ( = ?auto_249173 ?auto_249178 ) ) ( not ( = ?auto_249173 ?auto_249179 ) ) ( not ( = ?auto_249173 ?auto_249180 ) ) ( not ( = ?auto_249173 ?auto_249181 ) ) ( not ( = ?auto_249173 ?auto_249182 ) ) ( not ( = ?auto_249173 ?auto_249183 ) ) ( not ( = ?auto_249173 ?auto_249184 ) ) ( not ( = ?auto_249174 ?auto_249175 ) ) ( not ( = ?auto_249174 ?auto_249176 ) ) ( not ( = ?auto_249174 ?auto_249177 ) ) ( not ( = ?auto_249174 ?auto_249178 ) ) ( not ( = ?auto_249174 ?auto_249179 ) ) ( not ( = ?auto_249174 ?auto_249180 ) ) ( not ( = ?auto_249174 ?auto_249181 ) ) ( not ( = ?auto_249174 ?auto_249182 ) ) ( not ( = ?auto_249174 ?auto_249183 ) ) ( not ( = ?auto_249174 ?auto_249184 ) ) ( not ( = ?auto_249175 ?auto_249176 ) ) ( not ( = ?auto_249175 ?auto_249177 ) ) ( not ( = ?auto_249175 ?auto_249178 ) ) ( not ( = ?auto_249175 ?auto_249179 ) ) ( not ( = ?auto_249175 ?auto_249180 ) ) ( not ( = ?auto_249175 ?auto_249181 ) ) ( not ( = ?auto_249175 ?auto_249182 ) ) ( not ( = ?auto_249175 ?auto_249183 ) ) ( not ( = ?auto_249175 ?auto_249184 ) ) ( not ( = ?auto_249176 ?auto_249177 ) ) ( not ( = ?auto_249176 ?auto_249178 ) ) ( not ( = ?auto_249176 ?auto_249179 ) ) ( not ( = ?auto_249176 ?auto_249180 ) ) ( not ( = ?auto_249176 ?auto_249181 ) ) ( not ( = ?auto_249176 ?auto_249182 ) ) ( not ( = ?auto_249176 ?auto_249183 ) ) ( not ( = ?auto_249176 ?auto_249184 ) ) ( not ( = ?auto_249177 ?auto_249178 ) ) ( not ( = ?auto_249177 ?auto_249179 ) ) ( not ( = ?auto_249177 ?auto_249180 ) ) ( not ( = ?auto_249177 ?auto_249181 ) ) ( not ( = ?auto_249177 ?auto_249182 ) ) ( not ( = ?auto_249177 ?auto_249183 ) ) ( not ( = ?auto_249177 ?auto_249184 ) ) ( not ( = ?auto_249178 ?auto_249179 ) ) ( not ( = ?auto_249178 ?auto_249180 ) ) ( not ( = ?auto_249178 ?auto_249181 ) ) ( not ( = ?auto_249178 ?auto_249182 ) ) ( not ( = ?auto_249178 ?auto_249183 ) ) ( not ( = ?auto_249178 ?auto_249184 ) ) ( not ( = ?auto_249179 ?auto_249180 ) ) ( not ( = ?auto_249179 ?auto_249181 ) ) ( not ( = ?auto_249179 ?auto_249182 ) ) ( not ( = ?auto_249179 ?auto_249183 ) ) ( not ( = ?auto_249179 ?auto_249184 ) ) ( not ( = ?auto_249180 ?auto_249181 ) ) ( not ( = ?auto_249180 ?auto_249182 ) ) ( not ( = ?auto_249180 ?auto_249183 ) ) ( not ( = ?auto_249180 ?auto_249184 ) ) ( not ( = ?auto_249181 ?auto_249182 ) ) ( not ( = ?auto_249181 ?auto_249183 ) ) ( not ( = ?auto_249181 ?auto_249184 ) ) ( not ( = ?auto_249182 ?auto_249183 ) ) ( not ( = ?auto_249182 ?auto_249184 ) ) ( not ( = ?auto_249183 ?auto_249184 ) ) ( ON ?auto_249182 ?auto_249183 ) ( ON ?auto_249181 ?auto_249182 ) ( ON ?auto_249180 ?auto_249181 ) ( ON ?auto_249179 ?auto_249180 ) ( ON ?auto_249178 ?auto_249179 ) ( ON ?auto_249177 ?auto_249178 ) ( ON ?auto_249176 ?auto_249177 ) ( CLEAR ?auto_249174 ) ( ON ?auto_249175 ?auto_249176 ) ( CLEAR ?auto_249175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249173 ?auto_249174 ?auto_249175 )
      ( MAKE-11PILE ?auto_249173 ?auto_249174 ?auto_249175 ?auto_249176 ?auto_249177 ?auto_249178 ?auto_249179 ?auto_249180 ?auto_249181 ?auto_249182 ?auto_249183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249219 - BLOCK
      ?auto_249220 - BLOCK
      ?auto_249221 - BLOCK
      ?auto_249222 - BLOCK
      ?auto_249223 - BLOCK
      ?auto_249224 - BLOCK
      ?auto_249225 - BLOCK
      ?auto_249226 - BLOCK
      ?auto_249227 - BLOCK
      ?auto_249228 - BLOCK
      ?auto_249229 - BLOCK
    )
    :vars
    (
      ?auto_249230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249229 ?auto_249230 ) ( ON-TABLE ?auto_249219 ) ( not ( = ?auto_249219 ?auto_249220 ) ) ( not ( = ?auto_249219 ?auto_249221 ) ) ( not ( = ?auto_249219 ?auto_249222 ) ) ( not ( = ?auto_249219 ?auto_249223 ) ) ( not ( = ?auto_249219 ?auto_249224 ) ) ( not ( = ?auto_249219 ?auto_249225 ) ) ( not ( = ?auto_249219 ?auto_249226 ) ) ( not ( = ?auto_249219 ?auto_249227 ) ) ( not ( = ?auto_249219 ?auto_249228 ) ) ( not ( = ?auto_249219 ?auto_249229 ) ) ( not ( = ?auto_249219 ?auto_249230 ) ) ( not ( = ?auto_249220 ?auto_249221 ) ) ( not ( = ?auto_249220 ?auto_249222 ) ) ( not ( = ?auto_249220 ?auto_249223 ) ) ( not ( = ?auto_249220 ?auto_249224 ) ) ( not ( = ?auto_249220 ?auto_249225 ) ) ( not ( = ?auto_249220 ?auto_249226 ) ) ( not ( = ?auto_249220 ?auto_249227 ) ) ( not ( = ?auto_249220 ?auto_249228 ) ) ( not ( = ?auto_249220 ?auto_249229 ) ) ( not ( = ?auto_249220 ?auto_249230 ) ) ( not ( = ?auto_249221 ?auto_249222 ) ) ( not ( = ?auto_249221 ?auto_249223 ) ) ( not ( = ?auto_249221 ?auto_249224 ) ) ( not ( = ?auto_249221 ?auto_249225 ) ) ( not ( = ?auto_249221 ?auto_249226 ) ) ( not ( = ?auto_249221 ?auto_249227 ) ) ( not ( = ?auto_249221 ?auto_249228 ) ) ( not ( = ?auto_249221 ?auto_249229 ) ) ( not ( = ?auto_249221 ?auto_249230 ) ) ( not ( = ?auto_249222 ?auto_249223 ) ) ( not ( = ?auto_249222 ?auto_249224 ) ) ( not ( = ?auto_249222 ?auto_249225 ) ) ( not ( = ?auto_249222 ?auto_249226 ) ) ( not ( = ?auto_249222 ?auto_249227 ) ) ( not ( = ?auto_249222 ?auto_249228 ) ) ( not ( = ?auto_249222 ?auto_249229 ) ) ( not ( = ?auto_249222 ?auto_249230 ) ) ( not ( = ?auto_249223 ?auto_249224 ) ) ( not ( = ?auto_249223 ?auto_249225 ) ) ( not ( = ?auto_249223 ?auto_249226 ) ) ( not ( = ?auto_249223 ?auto_249227 ) ) ( not ( = ?auto_249223 ?auto_249228 ) ) ( not ( = ?auto_249223 ?auto_249229 ) ) ( not ( = ?auto_249223 ?auto_249230 ) ) ( not ( = ?auto_249224 ?auto_249225 ) ) ( not ( = ?auto_249224 ?auto_249226 ) ) ( not ( = ?auto_249224 ?auto_249227 ) ) ( not ( = ?auto_249224 ?auto_249228 ) ) ( not ( = ?auto_249224 ?auto_249229 ) ) ( not ( = ?auto_249224 ?auto_249230 ) ) ( not ( = ?auto_249225 ?auto_249226 ) ) ( not ( = ?auto_249225 ?auto_249227 ) ) ( not ( = ?auto_249225 ?auto_249228 ) ) ( not ( = ?auto_249225 ?auto_249229 ) ) ( not ( = ?auto_249225 ?auto_249230 ) ) ( not ( = ?auto_249226 ?auto_249227 ) ) ( not ( = ?auto_249226 ?auto_249228 ) ) ( not ( = ?auto_249226 ?auto_249229 ) ) ( not ( = ?auto_249226 ?auto_249230 ) ) ( not ( = ?auto_249227 ?auto_249228 ) ) ( not ( = ?auto_249227 ?auto_249229 ) ) ( not ( = ?auto_249227 ?auto_249230 ) ) ( not ( = ?auto_249228 ?auto_249229 ) ) ( not ( = ?auto_249228 ?auto_249230 ) ) ( not ( = ?auto_249229 ?auto_249230 ) ) ( ON ?auto_249228 ?auto_249229 ) ( ON ?auto_249227 ?auto_249228 ) ( ON ?auto_249226 ?auto_249227 ) ( ON ?auto_249225 ?auto_249226 ) ( ON ?auto_249224 ?auto_249225 ) ( ON ?auto_249223 ?auto_249224 ) ( ON ?auto_249222 ?auto_249223 ) ( ON ?auto_249221 ?auto_249222 ) ( CLEAR ?auto_249219 ) ( ON ?auto_249220 ?auto_249221 ) ( CLEAR ?auto_249220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249219 ?auto_249220 )
      ( MAKE-11PILE ?auto_249219 ?auto_249220 ?auto_249221 ?auto_249222 ?auto_249223 ?auto_249224 ?auto_249225 ?auto_249226 ?auto_249227 ?auto_249228 ?auto_249229 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249265 - BLOCK
      ?auto_249266 - BLOCK
      ?auto_249267 - BLOCK
      ?auto_249268 - BLOCK
      ?auto_249269 - BLOCK
      ?auto_249270 - BLOCK
      ?auto_249271 - BLOCK
      ?auto_249272 - BLOCK
      ?auto_249273 - BLOCK
      ?auto_249274 - BLOCK
      ?auto_249275 - BLOCK
    )
    :vars
    (
      ?auto_249276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249275 ?auto_249276 ) ( not ( = ?auto_249265 ?auto_249266 ) ) ( not ( = ?auto_249265 ?auto_249267 ) ) ( not ( = ?auto_249265 ?auto_249268 ) ) ( not ( = ?auto_249265 ?auto_249269 ) ) ( not ( = ?auto_249265 ?auto_249270 ) ) ( not ( = ?auto_249265 ?auto_249271 ) ) ( not ( = ?auto_249265 ?auto_249272 ) ) ( not ( = ?auto_249265 ?auto_249273 ) ) ( not ( = ?auto_249265 ?auto_249274 ) ) ( not ( = ?auto_249265 ?auto_249275 ) ) ( not ( = ?auto_249265 ?auto_249276 ) ) ( not ( = ?auto_249266 ?auto_249267 ) ) ( not ( = ?auto_249266 ?auto_249268 ) ) ( not ( = ?auto_249266 ?auto_249269 ) ) ( not ( = ?auto_249266 ?auto_249270 ) ) ( not ( = ?auto_249266 ?auto_249271 ) ) ( not ( = ?auto_249266 ?auto_249272 ) ) ( not ( = ?auto_249266 ?auto_249273 ) ) ( not ( = ?auto_249266 ?auto_249274 ) ) ( not ( = ?auto_249266 ?auto_249275 ) ) ( not ( = ?auto_249266 ?auto_249276 ) ) ( not ( = ?auto_249267 ?auto_249268 ) ) ( not ( = ?auto_249267 ?auto_249269 ) ) ( not ( = ?auto_249267 ?auto_249270 ) ) ( not ( = ?auto_249267 ?auto_249271 ) ) ( not ( = ?auto_249267 ?auto_249272 ) ) ( not ( = ?auto_249267 ?auto_249273 ) ) ( not ( = ?auto_249267 ?auto_249274 ) ) ( not ( = ?auto_249267 ?auto_249275 ) ) ( not ( = ?auto_249267 ?auto_249276 ) ) ( not ( = ?auto_249268 ?auto_249269 ) ) ( not ( = ?auto_249268 ?auto_249270 ) ) ( not ( = ?auto_249268 ?auto_249271 ) ) ( not ( = ?auto_249268 ?auto_249272 ) ) ( not ( = ?auto_249268 ?auto_249273 ) ) ( not ( = ?auto_249268 ?auto_249274 ) ) ( not ( = ?auto_249268 ?auto_249275 ) ) ( not ( = ?auto_249268 ?auto_249276 ) ) ( not ( = ?auto_249269 ?auto_249270 ) ) ( not ( = ?auto_249269 ?auto_249271 ) ) ( not ( = ?auto_249269 ?auto_249272 ) ) ( not ( = ?auto_249269 ?auto_249273 ) ) ( not ( = ?auto_249269 ?auto_249274 ) ) ( not ( = ?auto_249269 ?auto_249275 ) ) ( not ( = ?auto_249269 ?auto_249276 ) ) ( not ( = ?auto_249270 ?auto_249271 ) ) ( not ( = ?auto_249270 ?auto_249272 ) ) ( not ( = ?auto_249270 ?auto_249273 ) ) ( not ( = ?auto_249270 ?auto_249274 ) ) ( not ( = ?auto_249270 ?auto_249275 ) ) ( not ( = ?auto_249270 ?auto_249276 ) ) ( not ( = ?auto_249271 ?auto_249272 ) ) ( not ( = ?auto_249271 ?auto_249273 ) ) ( not ( = ?auto_249271 ?auto_249274 ) ) ( not ( = ?auto_249271 ?auto_249275 ) ) ( not ( = ?auto_249271 ?auto_249276 ) ) ( not ( = ?auto_249272 ?auto_249273 ) ) ( not ( = ?auto_249272 ?auto_249274 ) ) ( not ( = ?auto_249272 ?auto_249275 ) ) ( not ( = ?auto_249272 ?auto_249276 ) ) ( not ( = ?auto_249273 ?auto_249274 ) ) ( not ( = ?auto_249273 ?auto_249275 ) ) ( not ( = ?auto_249273 ?auto_249276 ) ) ( not ( = ?auto_249274 ?auto_249275 ) ) ( not ( = ?auto_249274 ?auto_249276 ) ) ( not ( = ?auto_249275 ?auto_249276 ) ) ( ON ?auto_249274 ?auto_249275 ) ( ON ?auto_249273 ?auto_249274 ) ( ON ?auto_249272 ?auto_249273 ) ( ON ?auto_249271 ?auto_249272 ) ( ON ?auto_249270 ?auto_249271 ) ( ON ?auto_249269 ?auto_249270 ) ( ON ?auto_249268 ?auto_249269 ) ( ON ?auto_249267 ?auto_249268 ) ( ON ?auto_249266 ?auto_249267 ) ( ON ?auto_249265 ?auto_249266 ) ( CLEAR ?auto_249265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249265 )
      ( MAKE-11PILE ?auto_249265 ?auto_249266 ?auto_249267 ?auto_249268 ?auto_249269 ?auto_249270 ?auto_249271 ?auto_249272 ?auto_249273 ?auto_249274 ?auto_249275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249312 - BLOCK
      ?auto_249313 - BLOCK
      ?auto_249314 - BLOCK
      ?auto_249315 - BLOCK
      ?auto_249316 - BLOCK
      ?auto_249317 - BLOCK
      ?auto_249318 - BLOCK
      ?auto_249319 - BLOCK
      ?auto_249320 - BLOCK
      ?auto_249321 - BLOCK
      ?auto_249322 - BLOCK
      ?auto_249323 - BLOCK
    )
    :vars
    (
      ?auto_249324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249322 ) ( ON ?auto_249323 ?auto_249324 ) ( CLEAR ?auto_249323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249312 ) ( ON ?auto_249313 ?auto_249312 ) ( ON ?auto_249314 ?auto_249313 ) ( ON ?auto_249315 ?auto_249314 ) ( ON ?auto_249316 ?auto_249315 ) ( ON ?auto_249317 ?auto_249316 ) ( ON ?auto_249318 ?auto_249317 ) ( ON ?auto_249319 ?auto_249318 ) ( ON ?auto_249320 ?auto_249319 ) ( ON ?auto_249321 ?auto_249320 ) ( ON ?auto_249322 ?auto_249321 ) ( not ( = ?auto_249312 ?auto_249313 ) ) ( not ( = ?auto_249312 ?auto_249314 ) ) ( not ( = ?auto_249312 ?auto_249315 ) ) ( not ( = ?auto_249312 ?auto_249316 ) ) ( not ( = ?auto_249312 ?auto_249317 ) ) ( not ( = ?auto_249312 ?auto_249318 ) ) ( not ( = ?auto_249312 ?auto_249319 ) ) ( not ( = ?auto_249312 ?auto_249320 ) ) ( not ( = ?auto_249312 ?auto_249321 ) ) ( not ( = ?auto_249312 ?auto_249322 ) ) ( not ( = ?auto_249312 ?auto_249323 ) ) ( not ( = ?auto_249312 ?auto_249324 ) ) ( not ( = ?auto_249313 ?auto_249314 ) ) ( not ( = ?auto_249313 ?auto_249315 ) ) ( not ( = ?auto_249313 ?auto_249316 ) ) ( not ( = ?auto_249313 ?auto_249317 ) ) ( not ( = ?auto_249313 ?auto_249318 ) ) ( not ( = ?auto_249313 ?auto_249319 ) ) ( not ( = ?auto_249313 ?auto_249320 ) ) ( not ( = ?auto_249313 ?auto_249321 ) ) ( not ( = ?auto_249313 ?auto_249322 ) ) ( not ( = ?auto_249313 ?auto_249323 ) ) ( not ( = ?auto_249313 ?auto_249324 ) ) ( not ( = ?auto_249314 ?auto_249315 ) ) ( not ( = ?auto_249314 ?auto_249316 ) ) ( not ( = ?auto_249314 ?auto_249317 ) ) ( not ( = ?auto_249314 ?auto_249318 ) ) ( not ( = ?auto_249314 ?auto_249319 ) ) ( not ( = ?auto_249314 ?auto_249320 ) ) ( not ( = ?auto_249314 ?auto_249321 ) ) ( not ( = ?auto_249314 ?auto_249322 ) ) ( not ( = ?auto_249314 ?auto_249323 ) ) ( not ( = ?auto_249314 ?auto_249324 ) ) ( not ( = ?auto_249315 ?auto_249316 ) ) ( not ( = ?auto_249315 ?auto_249317 ) ) ( not ( = ?auto_249315 ?auto_249318 ) ) ( not ( = ?auto_249315 ?auto_249319 ) ) ( not ( = ?auto_249315 ?auto_249320 ) ) ( not ( = ?auto_249315 ?auto_249321 ) ) ( not ( = ?auto_249315 ?auto_249322 ) ) ( not ( = ?auto_249315 ?auto_249323 ) ) ( not ( = ?auto_249315 ?auto_249324 ) ) ( not ( = ?auto_249316 ?auto_249317 ) ) ( not ( = ?auto_249316 ?auto_249318 ) ) ( not ( = ?auto_249316 ?auto_249319 ) ) ( not ( = ?auto_249316 ?auto_249320 ) ) ( not ( = ?auto_249316 ?auto_249321 ) ) ( not ( = ?auto_249316 ?auto_249322 ) ) ( not ( = ?auto_249316 ?auto_249323 ) ) ( not ( = ?auto_249316 ?auto_249324 ) ) ( not ( = ?auto_249317 ?auto_249318 ) ) ( not ( = ?auto_249317 ?auto_249319 ) ) ( not ( = ?auto_249317 ?auto_249320 ) ) ( not ( = ?auto_249317 ?auto_249321 ) ) ( not ( = ?auto_249317 ?auto_249322 ) ) ( not ( = ?auto_249317 ?auto_249323 ) ) ( not ( = ?auto_249317 ?auto_249324 ) ) ( not ( = ?auto_249318 ?auto_249319 ) ) ( not ( = ?auto_249318 ?auto_249320 ) ) ( not ( = ?auto_249318 ?auto_249321 ) ) ( not ( = ?auto_249318 ?auto_249322 ) ) ( not ( = ?auto_249318 ?auto_249323 ) ) ( not ( = ?auto_249318 ?auto_249324 ) ) ( not ( = ?auto_249319 ?auto_249320 ) ) ( not ( = ?auto_249319 ?auto_249321 ) ) ( not ( = ?auto_249319 ?auto_249322 ) ) ( not ( = ?auto_249319 ?auto_249323 ) ) ( not ( = ?auto_249319 ?auto_249324 ) ) ( not ( = ?auto_249320 ?auto_249321 ) ) ( not ( = ?auto_249320 ?auto_249322 ) ) ( not ( = ?auto_249320 ?auto_249323 ) ) ( not ( = ?auto_249320 ?auto_249324 ) ) ( not ( = ?auto_249321 ?auto_249322 ) ) ( not ( = ?auto_249321 ?auto_249323 ) ) ( not ( = ?auto_249321 ?auto_249324 ) ) ( not ( = ?auto_249322 ?auto_249323 ) ) ( not ( = ?auto_249322 ?auto_249324 ) ) ( not ( = ?auto_249323 ?auto_249324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_249323 ?auto_249324 )
      ( !STACK ?auto_249323 ?auto_249322 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249362 - BLOCK
      ?auto_249363 - BLOCK
      ?auto_249364 - BLOCK
      ?auto_249365 - BLOCK
      ?auto_249366 - BLOCK
      ?auto_249367 - BLOCK
      ?auto_249368 - BLOCK
      ?auto_249369 - BLOCK
      ?auto_249370 - BLOCK
      ?auto_249371 - BLOCK
      ?auto_249372 - BLOCK
      ?auto_249373 - BLOCK
    )
    :vars
    (
      ?auto_249374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249373 ?auto_249374 ) ( ON-TABLE ?auto_249362 ) ( ON ?auto_249363 ?auto_249362 ) ( ON ?auto_249364 ?auto_249363 ) ( ON ?auto_249365 ?auto_249364 ) ( ON ?auto_249366 ?auto_249365 ) ( ON ?auto_249367 ?auto_249366 ) ( ON ?auto_249368 ?auto_249367 ) ( ON ?auto_249369 ?auto_249368 ) ( ON ?auto_249370 ?auto_249369 ) ( ON ?auto_249371 ?auto_249370 ) ( not ( = ?auto_249362 ?auto_249363 ) ) ( not ( = ?auto_249362 ?auto_249364 ) ) ( not ( = ?auto_249362 ?auto_249365 ) ) ( not ( = ?auto_249362 ?auto_249366 ) ) ( not ( = ?auto_249362 ?auto_249367 ) ) ( not ( = ?auto_249362 ?auto_249368 ) ) ( not ( = ?auto_249362 ?auto_249369 ) ) ( not ( = ?auto_249362 ?auto_249370 ) ) ( not ( = ?auto_249362 ?auto_249371 ) ) ( not ( = ?auto_249362 ?auto_249372 ) ) ( not ( = ?auto_249362 ?auto_249373 ) ) ( not ( = ?auto_249362 ?auto_249374 ) ) ( not ( = ?auto_249363 ?auto_249364 ) ) ( not ( = ?auto_249363 ?auto_249365 ) ) ( not ( = ?auto_249363 ?auto_249366 ) ) ( not ( = ?auto_249363 ?auto_249367 ) ) ( not ( = ?auto_249363 ?auto_249368 ) ) ( not ( = ?auto_249363 ?auto_249369 ) ) ( not ( = ?auto_249363 ?auto_249370 ) ) ( not ( = ?auto_249363 ?auto_249371 ) ) ( not ( = ?auto_249363 ?auto_249372 ) ) ( not ( = ?auto_249363 ?auto_249373 ) ) ( not ( = ?auto_249363 ?auto_249374 ) ) ( not ( = ?auto_249364 ?auto_249365 ) ) ( not ( = ?auto_249364 ?auto_249366 ) ) ( not ( = ?auto_249364 ?auto_249367 ) ) ( not ( = ?auto_249364 ?auto_249368 ) ) ( not ( = ?auto_249364 ?auto_249369 ) ) ( not ( = ?auto_249364 ?auto_249370 ) ) ( not ( = ?auto_249364 ?auto_249371 ) ) ( not ( = ?auto_249364 ?auto_249372 ) ) ( not ( = ?auto_249364 ?auto_249373 ) ) ( not ( = ?auto_249364 ?auto_249374 ) ) ( not ( = ?auto_249365 ?auto_249366 ) ) ( not ( = ?auto_249365 ?auto_249367 ) ) ( not ( = ?auto_249365 ?auto_249368 ) ) ( not ( = ?auto_249365 ?auto_249369 ) ) ( not ( = ?auto_249365 ?auto_249370 ) ) ( not ( = ?auto_249365 ?auto_249371 ) ) ( not ( = ?auto_249365 ?auto_249372 ) ) ( not ( = ?auto_249365 ?auto_249373 ) ) ( not ( = ?auto_249365 ?auto_249374 ) ) ( not ( = ?auto_249366 ?auto_249367 ) ) ( not ( = ?auto_249366 ?auto_249368 ) ) ( not ( = ?auto_249366 ?auto_249369 ) ) ( not ( = ?auto_249366 ?auto_249370 ) ) ( not ( = ?auto_249366 ?auto_249371 ) ) ( not ( = ?auto_249366 ?auto_249372 ) ) ( not ( = ?auto_249366 ?auto_249373 ) ) ( not ( = ?auto_249366 ?auto_249374 ) ) ( not ( = ?auto_249367 ?auto_249368 ) ) ( not ( = ?auto_249367 ?auto_249369 ) ) ( not ( = ?auto_249367 ?auto_249370 ) ) ( not ( = ?auto_249367 ?auto_249371 ) ) ( not ( = ?auto_249367 ?auto_249372 ) ) ( not ( = ?auto_249367 ?auto_249373 ) ) ( not ( = ?auto_249367 ?auto_249374 ) ) ( not ( = ?auto_249368 ?auto_249369 ) ) ( not ( = ?auto_249368 ?auto_249370 ) ) ( not ( = ?auto_249368 ?auto_249371 ) ) ( not ( = ?auto_249368 ?auto_249372 ) ) ( not ( = ?auto_249368 ?auto_249373 ) ) ( not ( = ?auto_249368 ?auto_249374 ) ) ( not ( = ?auto_249369 ?auto_249370 ) ) ( not ( = ?auto_249369 ?auto_249371 ) ) ( not ( = ?auto_249369 ?auto_249372 ) ) ( not ( = ?auto_249369 ?auto_249373 ) ) ( not ( = ?auto_249369 ?auto_249374 ) ) ( not ( = ?auto_249370 ?auto_249371 ) ) ( not ( = ?auto_249370 ?auto_249372 ) ) ( not ( = ?auto_249370 ?auto_249373 ) ) ( not ( = ?auto_249370 ?auto_249374 ) ) ( not ( = ?auto_249371 ?auto_249372 ) ) ( not ( = ?auto_249371 ?auto_249373 ) ) ( not ( = ?auto_249371 ?auto_249374 ) ) ( not ( = ?auto_249372 ?auto_249373 ) ) ( not ( = ?auto_249372 ?auto_249374 ) ) ( not ( = ?auto_249373 ?auto_249374 ) ) ( CLEAR ?auto_249371 ) ( ON ?auto_249372 ?auto_249373 ) ( CLEAR ?auto_249372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_249362 ?auto_249363 ?auto_249364 ?auto_249365 ?auto_249366 ?auto_249367 ?auto_249368 ?auto_249369 ?auto_249370 ?auto_249371 ?auto_249372 )
      ( MAKE-12PILE ?auto_249362 ?auto_249363 ?auto_249364 ?auto_249365 ?auto_249366 ?auto_249367 ?auto_249368 ?auto_249369 ?auto_249370 ?auto_249371 ?auto_249372 ?auto_249373 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249412 - BLOCK
      ?auto_249413 - BLOCK
      ?auto_249414 - BLOCK
      ?auto_249415 - BLOCK
      ?auto_249416 - BLOCK
      ?auto_249417 - BLOCK
      ?auto_249418 - BLOCK
      ?auto_249419 - BLOCK
      ?auto_249420 - BLOCK
      ?auto_249421 - BLOCK
      ?auto_249422 - BLOCK
      ?auto_249423 - BLOCK
    )
    :vars
    (
      ?auto_249424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249423 ?auto_249424 ) ( ON-TABLE ?auto_249412 ) ( ON ?auto_249413 ?auto_249412 ) ( ON ?auto_249414 ?auto_249413 ) ( ON ?auto_249415 ?auto_249414 ) ( ON ?auto_249416 ?auto_249415 ) ( ON ?auto_249417 ?auto_249416 ) ( ON ?auto_249418 ?auto_249417 ) ( ON ?auto_249419 ?auto_249418 ) ( ON ?auto_249420 ?auto_249419 ) ( not ( = ?auto_249412 ?auto_249413 ) ) ( not ( = ?auto_249412 ?auto_249414 ) ) ( not ( = ?auto_249412 ?auto_249415 ) ) ( not ( = ?auto_249412 ?auto_249416 ) ) ( not ( = ?auto_249412 ?auto_249417 ) ) ( not ( = ?auto_249412 ?auto_249418 ) ) ( not ( = ?auto_249412 ?auto_249419 ) ) ( not ( = ?auto_249412 ?auto_249420 ) ) ( not ( = ?auto_249412 ?auto_249421 ) ) ( not ( = ?auto_249412 ?auto_249422 ) ) ( not ( = ?auto_249412 ?auto_249423 ) ) ( not ( = ?auto_249412 ?auto_249424 ) ) ( not ( = ?auto_249413 ?auto_249414 ) ) ( not ( = ?auto_249413 ?auto_249415 ) ) ( not ( = ?auto_249413 ?auto_249416 ) ) ( not ( = ?auto_249413 ?auto_249417 ) ) ( not ( = ?auto_249413 ?auto_249418 ) ) ( not ( = ?auto_249413 ?auto_249419 ) ) ( not ( = ?auto_249413 ?auto_249420 ) ) ( not ( = ?auto_249413 ?auto_249421 ) ) ( not ( = ?auto_249413 ?auto_249422 ) ) ( not ( = ?auto_249413 ?auto_249423 ) ) ( not ( = ?auto_249413 ?auto_249424 ) ) ( not ( = ?auto_249414 ?auto_249415 ) ) ( not ( = ?auto_249414 ?auto_249416 ) ) ( not ( = ?auto_249414 ?auto_249417 ) ) ( not ( = ?auto_249414 ?auto_249418 ) ) ( not ( = ?auto_249414 ?auto_249419 ) ) ( not ( = ?auto_249414 ?auto_249420 ) ) ( not ( = ?auto_249414 ?auto_249421 ) ) ( not ( = ?auto_249414 ?auto_249422 ) ) ( not ( = ?auto_249414 ?auto_249423 ) ) ( not ( = ?auto_249414 ?auto_249424 ) ) ( not ( = ?auto_249415 ?auto_249416 ) ) ( not ( = ?auto_249415 ?auto_249417 ) ) ( not ( = ?auto_249415 ?auto_249418 ) ) ( not ( = ?auto_249415 ?auto_249419 ) ) ( not ( = ?auto_249415 ?auto_249420 ) ) ( not ( = ?auto_249415 ?auto_249421 ) ) ( not ( = ?auto_249415 ?auto_249422 ) ) ( not ( = ?auto_249415 ?auto_249423 ) ) ( not ( = ?auto_249415 ?auto_249424 ) ) ( not ( = ?auto_249416 ?auto_249417 ) ) ( not ( = ?auto_249416 ?auto_249418 ) ) ( not ( = ?auto_249416 ?auto_249419 ) ) ( not ( = ?auto_249416 ?auto_249420 ) ) ( not ( = ?auto_249416 ?auto_249421 ) ) ( not ( = ?auto_249416 ?auto_249422 ) ) ( not ( = ?auto_249416 ?auto_249423 ) ) ( not ( = ?auto_249416 ?auto_249424 ) ) ( not ( = ?auto_249417 ?auto_249418 ) ) ( not ( = ?auto_249417 ?auto_249419 ) ) ( not ( = ?auto_249417 ?auto_249420 ) ) ( not ( = ?auto_249417 ?auto_249421 ) ) ( not ( = ?auto_249417 ?auto_249422 ) ) ( not ( = ?auto_249417 ?auto_249423 ) ) ( not ( = ?auto_249417 ?auto_249424 ) ) ( not ( = ?auto_249418 ?auto_249419 ) ) ( not ( = ?auto_249418 ?auto_249420 ) ) ( not ( = ?auto_249418 ?auto_249421 ) ) ( not ( = ?auto_249418 ?auto_249422 ) ) ( not ( = ?auto_249418 ?auto_249423 ) ) ( not ( = ?auto_249418 ?auto_249424 ) ) ( not ( = ?auto_249419 ?auto_249420 ) ) ( not ( = ?auto_249419 ?auto_249421 ) ) ( not ( = ?auto_249419 ?auto_249422 ) ) ( not ( = ?auto_249419 ?auto_249423 ) ) ( not ( = ?auto_249419 ?auto_249424 ) ) ( not ( = ?auto_249420 ?auto_249421 ) ) ( not ( = ?auto_249420 ?auto_249422 ) ) ( not ( = ?auto_249420 ?auto_249423 ) ) ( not ( = ?auto_249420 ?auto_249424 ) ) ( not ( = ?auto_249421 ?auto_249422 ) ) ( not ( = ?auto_249421 ?auto_249423 ) ) ( not ( = ?auto_249421 ?auto_249424 ) ) ( not ( = ?auto_249422 ?auto_249423 ) ) ( not ( = ?auto_249422 ?auto_249424 ) ) ( not ( = ?auto_249423 ?auto_249424 ) ) ( ON ?auto_249422 ?auto_249423 ) ( CLEAR ?auto_249420 ) ( ON ?auto_249421 ?auto_249422 ) ( CLEAR ?auto_249421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_249412 ?auto_249413 ?auto_249414 ?auto_249415 ?auto_249416 ?auto_249417 ?auto_249418 ?auto_249419 ?auto_249420 ?auto_249421 )
      ( MAKE-12PILE ?auto_249412 ?auto_249413 ?auto_249414 ?auto_249415 ?auto_249416 ?auto_249417 ?auto_249418 ?auto_249419 ?auto_249420 ?auto_249421 ?auto_249422 ?auto_249423 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249462 - BLOCK
      ?auto_249463 - BLOCK
      ?auto_249464 - BLOCK
      ?auto_249465 - BLOCK
      ?auto_249466 - BLOCK
      ?auto_249467 - BLOCK
      ?auto_249468 - BLOCK
      ?auto_249469 - BLOCK
      ?auto_249470 - BLOCK
      ?auto_249471 - BLOCK
      ?auto_249472 - BLOCK
      ?auto_249473 - BLOCK
    )
    :vars
    (
      ?auto_249474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249473 ?auto_249474 ) ( ON-TABLE ?auto_249462 ) ( ON ?auto_249463 ?auto_249462 ) ( ON ?auto_249464 ?auto_249463 ) ( ON ?auto_249465 ?auto_249464 ) ( ON ?auto_249466 ?auto_249465 ) ( ON ?auto_249467 ?auto_249466 ) ( ON ?auto_249468 ?auto_249467 ) ( ON ?auto_249469 ?auto_249468 ) ( not ( = ?auto_249462 ?auto_249463 ) ) ( not ( = ?auto_249462 ?auto_249464 ) ) ( not ( = ?auto_249462 ?auto_249465 ) ) ( not ( = ?auto_249462 ?auto_249466 ) ) ( not ( = ?auto_249462 ?auto_249467 ) ) ( not ( = ?auto_249462 ?auto_249468 ) ) ( not ( = ?auto_249462 ?auto_249469 ) ) ( not ( = ?auto_249462 ?auto_249470 ) ) ( not ( = ?auto_249462 ?auto_249471 ) ) ( not ( = ?auto_249462 ?auto_249472 ) ) ( not ( = ?auto_249462 ?auto_249473 ) ) ( not ( = ?auto_249462 ?auto_249474 ) ) ( not ( = ?auto_249463 ?auto_249464 ) ) ( not ( = ?auto_249463 ?auto_249465 ) ) ( not ( = ?auto_249463 ?auto_249466 ) ) ( not ( = ?auto_249463 ?auto_249467 ) ) ( not ( = ?auto_249463 ?auto_249468 ) ) ( not ( = ?auto_249463 ?auto_249469 ) ) ( not ( = ?auto_249463 ?auto_249470 ) ) ( not ( = ?auto_249463 ?auto_249471 ) ) ( not ( = ?auto_249463 ?auto_249472 ) ) ( not ( = ?auto_249463 ?auto_249473 ) ) ( not ( = ?auto_249463 ?auto_249474 ) ) ( not ( = ?auto_249464 ?auto_249465 ) ) ( not ( = ?auto_249464 ?auto_249466 ) ) ( not ( = ?auto_249464 ?auto_249467 ) ) ( not ( = ?auto_249464 ?auto_249468 ) ) ( not ( = ?auto_249464 ?auto_249469 ) ) ( not ( = ?auto_249464 ?auto_249470 ) ) ( not ( = ?auto_249464 ?auto_249471 ) ) ( not ( = ?auto_249464 ?auto_249472 ) ) ( not ( = ?auto_249464 ?auto_249473 ) ) ( not ( = ?auto_249464 ?auto_249474 ) ) ( not ( = ?auto_249465 ?auto_249466 ) ) ( not ( = ?auto_249465 ?auto_249467 ) ) ( not ( = ?auto_249465 ?auto_249468 ) ) ( not ( = ?auto_249465 ?auto_249469 ) ) ( not ( = ?auto_249465 ?auto_249470 ) ) ( not ( = ?auto_249465 ?auto_249471 ) ) ( not ( = ?auto_249465 ?auto_249472 ) ) ( not ( = ?auto_249465 ?auto_249473 ) ) ( not ( = ?auto_249465 ?auto_249474 ) ) ( not ( = ?auto_249466 ?auto_249467 ) ) ( not ( = ?auto_249466 ?auto_249468 ) ) ( not ( = ?auto_249466 ?auto_249469 ) ) ( not ( = ?auto_249466 ?auto_249470 ) ) ( not ( = ?auto_249466 ?auto_249471 ) ) ( not ( = ?auto_249466 ?auto_249472 ) ) ( not ( = ?auto_249466 ?auto_249473 ) ) ( not ( = ?auto_249466 ?auto_249474 ) ) ( not ( = ?auto_249467 ?auto_249468 ) ) ( not ( = ?auto_249467 ?auto_249469 ) ) ( not ( = ?auto_249467 ?auto_249470 ) ) ( not ( = ?auto_249467 ?auto_249471 ) ) ( not ( = ?auto_249467 ?auto_249472 ) ) ( not ( = ?auto_249467 ?auto_249473 ) ) ( not ( = ?auto_249467 ?auto_249474 ) ) ( not ( = ?auto_249468 ?auto_249469 ) ) ( not ( = ?auto_249468 ?auto_249470 ) ) ( not ( = ?auto_249468 ?auto_249471 ) ) ( not ( = ?auto_249468 ?auto_249472 ) ) ( not ( = ?auto_249468 ?auto_249473 ) ) ( not ( = ?auto_249468 ?auto_249474 ) ) ( not ( = ?auto_249469 ?auto_249470 ) ) ( not ( = ?auto_249469 ?auto_249471 ) ) ( not ( = ?auto_249469 ?auto_249472 ) ) ( not ( = ?auto_249469 ?auto_249473 ) ) ( not ( = ?auto_249469 ?auto_249474 ) ) ( not ( = ?auto_249470 ?auto_249471 ) ) ( not ( = ?auto_249470 ?auto_249472 ) ) ( not ( = ?auto_249470 ?auto_249473 ) ) ( not ( = ?auto_249470 ?auto_249474 ) ) ( not ( = ?auto_249471 ?auto_249472 ) ) ( not ( = ?auto_249471 ?auto_249473 ) ) ( not ( = ?auto_249471 ?auto_249474 ) ) ( not ( = ?auto_249472 ?auto_249473 ) ) ( not ( = ?auto_249472 ?auto_249474 ) ) ( not ( = ?auto_249473 ?auto_249474 ) ) ( ON ?auto_249472 ?auto_249473 ) ( ON ?auto_249471 ?auto_249472 ) ( CLEAR ?auto_249469 ) ( ON ?auto_249470 ?auto_249471 ) ( CLEAR ?auto_249470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_249462 ?auto_249463 ?auto_249464 ?auto_249465 ?auto_249466 ?auto_249467 ?auto_249468 ?auto_249469 ?auto_249470 )
      ( MAKE-12PILE ?auto_249462 ?auto_249463 ?auto_249464 ?auto_249465 ?auto_249466 ?auto_249467 ?auto_249468 ?auto_249469 ?auto_249470 ?auto_249471 ?auto_249472 ?auto_249473 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249512 - BLOCK
      ?auto_249513 - BLOCK
      ?auto_249514 - BLOCK
      ?auto_249515 - BLOCK
      ?auto_249516 - BLOCK
      ?auto_249517 - BLOCK
      ?auto_249518 - BLOCK
      ?auto_249519 - BLOCK
      ?auto_249520 - BLOCK
      ?auto_249521 - BLOCK
      ?auto_249522 - BLOCK
      ?auto_249523 - BLOCK
    )
    :vars
    (
      ?auto_249524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249523 ?auto_249524 ) ( ON-TABLE ?auto_249512 ) ( ON ?auto_249513 ?auto_249512 ) ( ON ?auto_249514 ?auto_249513 ) ( ON ?auto_249515 ?auto_249514 ) ( ON ?auto_249516 ?auto_249515 ) ( ON ?auto_249517 ?auto_249516 ) ( ON ?auto_249518 ?auto_249517 ) ( not ( = ?auto_249512 ?auto_249513 ) ) ( not ( = ?auto_249512 ?auto_249514 ) ) ( not ( = ?auto_249512 ?auto_249515 ) ) ( not ( = ?auto_249512 ?auto_249516 ) ) ( not ( = ?auto_249512 ?auto_249517 ) ) ( not ( = ?auto_249512 ?auto_249518 ) ) ( not ( = ?auto_249512 ?auto_249519 ) ) ( not ( = ?auto_249512 ?auto_249520 ) ) ( not ( = ?auto_249512 ?auto_249521 ) ) ( not ( = ?auto_249512 ?auto_249522 ) ) ( not ( = ?auto_249512 ?auto_249523 ) ) ( not ( = ?auto_249512 ?auto_249524 ) ) ( not ( = ?auto_249513 ?auto_249514 ) ) ( not ( = ?auto_249513 ?auto_249515 ) ) ( not ( = ?auto_249513 ?auto_249516 ) ) ( not ( = ?auto_249513 ?auto_249517 ) ) ( not ( = ?auto_249513 ?auto_249518 ) ) ( not ( = ?auto_249513 ?auto_249519 ) ) ( not ( = ?auto_249513 ?auto_249520 ) ) ( not ( = ?auto_249513 ?auto_249521 ) ) ( not ( = ?auto_249513 ?auto_249522 ) ) ( not ( = ?auto_249513 ?auto_249523 ) ) ( not ( = ?auto_249513 ?auto_249524 ) ) ( not ( = ?auto_249514 ?auto_249515 ) ) ( not ( = ?auto_249514 ?auto_249516 ) ) ( not ( = ?auto_249514 ?auto_249517 ) ) ( not ( = ?auto_249514 ?auto_249518 ) ) ( not ( = ?auto_249514 ?auto_249519 ) ) ( not ( = ?auto_249514 ?auto_249520 ) ) ( not ( = ?auto_249514 ?auto_249521 ) ) ( not ( = ?auto_249514 ?auto_249522 ) ) ( not ( = ?auto_249514 ?auto_249523 ) ) ( not ( = ?auto_249514 ?auto_249524 ) ) ( not ( = ?auto_249515 ?auto_249516 ) ) ( not ( = ?auto_249515 ?auto_249517 ) ) ( not ( = ?auto_249515 ?auto_249518 ) ) ( not ( = ?auto_249515 ?auto_249519 ) ) ( not ( = ?auto_249515 ?auto_249520 ) ) ( not ( = ?auto_249515 ?auto_249521 ) ) ( not ( = ?auto_249515 ?auto_249522 ) ) ( not ( = ?auto_249515 ?auto_249523 ) ) ( not ( = ?auto_249515 ?auto_249524 ) ) ( not ( = ?auto_249516 ?auto_249517 ) ) ( not ( = ?auto_249516 ?auto_249518 ) ) ( not ( = ?auto_249516 ?auto_249519 ) ) ( not ( = ?auto_249516 ?auto_249520 ) ) ( not ( = ?auto_249516 ?auto_249521 ) ) ( not ( = ?auto_249516 ?auto_249522 ) ) ( not ( = ?auto_249516 ?auto_249523 ) ) ( not ( = ?auto_249516 ?auto_249524 ) ) ( not ( = ?auto_249517 ?auto_249518 ) ) ( not ( = ?auto_249517 ?auto_249519 ) ) ( not ( = ?auto_249517 ?auto_249520 ) ) ( not ( = ?auto_249517 ?auto_249521 ) ) ( not ( = ?auto_249517 ?auto_249522 ) ) ( not ( = ?auto_249517 ?auto_249523 ) ) ( not ( = ?auto_249517 ?auto_249524 ) ) ( not ( = ?auto_249518 ?auto_249519 ) ) ( not ( = ?auto_249518 ?auto_249520 ) ) ( not ( = ?auto_249518 ?auto_249521 ) ) ( not ( = ?auto_249518 ?auto_249522 ) ) ( not ( = ?auto_249518 ?auto_249523 ) ) ( not ( = ?auto_249518 ?auto_249524 ) ) ( not ( = ?auto_249519 ?auto_249520 ) ) ( not ( = ?auto_249519 ?auto_249521 ) ) ( not ( = ?auto_249519 ?auto_249522 ) ) ( not ( = ?auto_249519 ?auto_249523 ) ) ( not ( = ?auto_249519 ?auto_249524 ) ) ( not ( = ?auto_249520 ?auto_249521 ) ) ( not ( = ?auto_249520 ?auto_249522 ) ) ( not ( = ?auto_249520 ?auto_249523 ) ) ( not ( = ?auto_249520 ?auto_249524 ) ) ( not ( = ?auto_249521 ?auto_249522 ) ) ( not ( = ?auto_249521 ?auto_249523 ) ) ( not ( = ?auto_249521 ?auto_249524 ) ) ( not ( = ?auto_249522 ?auto_249523 ) ) ( not ( = ?auto_249522 ?auto_249524 ) ) ( not ( = ?auto_249523 ?auto_249524 ) ) ( ON ?auto_249522 ?auto_249523 ) ( ON ?auto_249521 ?auto_249522 ) ( ON ?auto_249520 ?auto_249521 ) ( CLEAR ?auto_249518 ) ( ON ?auto_249519 ?auto_249520 ) ( CLEAR ?auto_249519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_249512 ?auto_249513 ?auto_249514 ?auto_249515 ?auto_249516 ?auto_249517 ?auto_249518 ?auto_249519 )
      ( MAKE-12PILE ?auto_249512 ?auto_249513 ?auto_249514 ?auto_249515 ?auto_249516 ?auto_249517 ?auto_249518 ?auto_249519 ?auto_249520 ?auto_249521 ?auto_249522 ?auto_249523 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249562 - BLOCK
      ?auto_249563 - BLOCK
      ?auto_249564 - BLOCK
      ?auto_249565 - BLOCK
      ?auto_249566 - BLOCK
      ?auto_249567 - BLOCK
      ?auto_249568 - BLOCK
      ?auto_249569 - BLOCK
      ?auto_249570 - BLOCK
      ?auto_249571 - BLOCK
      ?auto_249572 - BLOCK
      ?auto_249573 - BLOCK
    )
    :vars
    (
      ?auto_249574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249573 ?auto_249574 ) ( ON-TABLE ?auto_249562 ) ( ON ?auto_249563 ?auto_249562 ) ( ON ?auto_249564 ?auto_249563 ) ( ON ?auto_249565 ?auto_249564 ) ( ON ?auto_249566 ?auto_249565 ) ( ON ?auto_249567 ?auto_249566 ) ( not ( = ?auto_249562 ?auto_249563 ) ) ( not ( = ?auto_249562 ?auto_249564 ) ) ( not ( = ?auto_249562 ?auto_249565 ) ) ( not ( = ?auto_249562 ?auto_249566 ) ) ( not ( = ?auto_249562 ?auto_249567 ) ) ( not ( = ?auto_249562 ?auto_249568 ) ) ( not ( = ?auto_249562 ?auto_249569 ) ) ( not ( = ?auto_249562 ?auto_249570 ) ) ( not ( = ?auto_249562 ?auto_249571 ) ) ( not ( = ?auto_249562 ?auto_249572 ) ) ( not ( = ?auto_249562 ?auto_249573 ) ) ( not ( = ?auto_249562 ?auto_249574 ) ) ( not ( = ?auto_249563 ?auto_249564 ) ) ( not ( = ?auto_249563 ?auto_249565 ) ) ( not ( = ?auto_249563 ?auto_249566 ) ) ( not ( = ?auto_249563 ?auto_249567 ) ) ( not ( = ?auto_249563 ?auto_249568 ) ) ( not ( = ?auto_249563 ?auto_249569 ) ) ( not ( = ?auto_249563 ?auto_249570 ) ) ( not ( = ?auto_249563 ?auto_249571 ) ) ( not ( = ?auto_249563 ?auto_249572 ) ) ( not ( = ?auto_249563 ?auto_249573 ) ) ( not ( = ?auto_249563 ?auto_249574 ) ) ( not ( = ?auto_249564 ?auto_249565 ) ) ( not ( = ?auto_249564 ?auto_249566 ) ) ( not ( = ?auto_249564 ?auto_249567 ) ) ( not ( = ?auto_249564 ?auto_249568 ) ) ( not ( = ?auto_249564 ?auto_249569 ) ) ( not ( = ?auto_249564 ?auto_249570 ) ) ( not ( = ?auto_249564 ?auto_249571 ) ) ( not ( = ?auto_249564 ?auto_249572 ) ) ( not ( = ?auto_249564 ?auto_249573 ) ) ( not ( = ?auto_249564 ?auto_249574 ) ) ( not ( = ?auto_249565 ?auto_249566 ) ) ( not ( = ?auto_249565 ?auto_249567 ) ) ( not ( = ?auto_249565 ?auto_249568 ) ) ( not ( = ?auto_249565 ?auto_249569 ) ) ( not ( = ?auto_249565 ?auto_249570 ) ) ( not ( = ?auto_249565 ?auto_249571 ) ) ( not ( = ?auto_249565 ?auto_249572 ) ) ( not ( = ?auto_249565 ?auto_249573 ) ) ( not ( = ?auto_249565 ?auto_249574 ) ) ( not ( = ?auto_249566 ?auto_249567 ) ) ( not ( = ?auto_249566 ?auto_249568 ) ) ( not ( = ?auto_249566 ?auto_249569 ) ) ( not ( = ?auto_249566 ?auto_249570 ) ) ( not ( = ?auto_249566 ?auto_249571 ) ) ( not ( = ?auto_249566 ?auto_249572 ) ) ( not ( = ?auto_249566 ?auto_249573 ) ) ( not ( = ?auto_249566 ?auto_249574 ) ) ( not ( = ?auto_249567 ?auto_249568 ) ) ( not ( = ?auto_249567 ?auto_249569 ) ) ( not ( = ?auto_249567 ?auto_249570 ) ) ( not ( = ?auto_249567 ?auto_249571 ) ) ( not ( = ?auto_249567 ?auto_249572 ) ) ( not ( = ?auto_249567 ?auto_249573 ) ) ( not ( = ?auto_249567 ?auto_249574 ) ) ( not ( = ?auto_249568 ?auto_249569 ) ) ( not ( = ?auto_249568 ?auto_249570 ) ) ( not ( = ?auto_249568 ?auto_249571 ) ) ( not ( = ?auto_249568 ?auto_249572 ) ) ( not ( = ?auto_249568 ?auto_249573 ) ) ( not ( = ?auto_249568 ?auto_249574 ) ) ( not ( = ?auto_249569 ?auto_249570 ) ) ( not ( = ?auto_249569 ?auto_249571 ) ) ( not ( = ?auto_249569 ?auto_249572 ) ) ( not ( = ?auto_249569 ?auto_249573 ) ) ( not ( = ?auto_249569 ?auto_249574 ) ) ( not ( = ?auto_249570 ?auto_249571 ) ) ( not ( = ?auto_249570 ?auto_249572 ) ) ( not ( = ?auto_249570 ?auto_249573 ) ) ( not ( = ?auto_249570 ?auto_249574 ) ) ( not ( = ?auto_249571 ?auto_249572 ) ) ( not ( = ?auto_249571 ?auto_249573 ) ) ( not ( = ?auto_249571 ?auto_249574 ) ) ( not ( = ?auto_249572 ?auto_249573 ) ) ( not ( = ?auto_249572 ?auto_249574 ) ) ( not ( = ?auto_249573 ?auto_249574 ) ) ( ON ?auto_249572 ?auto_249573 ) ( ON ?auto_249571 ?auto_249572 ) ( ON ?auto_249570 ?auto_249571 ) ( ON ?auto_249569 ?auto_249570 ) ( CLEAR ?auto_249567 ) ( ON ?auto_249568 ?auto_249569 ) ( CLEAR ?auto_249568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_249562 ?auto_249563 ?auto_249564 ?auto_249565 ?auto_249566 ?auto_249567 ?auto_249568 )
      ( MAKE-12PILE ?auto_249562 ?auto_249563 ?auto_249564 ?auto_249565 ?auto_249566 ?auto_249567 ?auto_249568 ?auto_249569 ?auto_249570 ?auto_249571 ?auto_249572 ?auto_249573 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249612 - BLOCK
      ?auto_249613 - BLOCK
      ?auto_249614 - BLOCK
      ?auto_249615 - BLOCK
      ?auto_249616 - BLOCK
      ?auto_249617 - BLOCK
      ?auto_249618 - BLOCK
      ?auto_249619 - BLOCK
      ?auto_249620 - BLOCK
      ?auto_249621 - BLOCK
      ?auto_249622 - BLOCK
      ?auto_249623 - BLOCK
    )
    :vars
    (
      ?auto_249624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249623 ?auto_249624 ) ( ON-TABLE ?auto_249612 ) ( ON ?auto_249613 ?auto_249612 ) ( ON ?auto_249614 ?auto_249613 ) ( ON ?auto_249615 ?auto_249614 ) ( ON ?auto_249616 ?auto_249615 ) ( not ( = ?auto_249612 ?auto_249613 ) ) ( not ( = ?auto_249612 ?auto_249614 ) ) ( not ( = ?auto_249612 ?auto_249615 ) ) ( not ( = ?auto_249612 ?auto_249616 ) ) ( not ( = ?auto_249612 ?auto_249617 ) ) ( not ( = ?auto_249612 ?auto_249618 ) ) ( not ( = ?auto_249612 ?auto_249619 ) ) ( not ( = ?auto_249612 ?auto_249620 ) ) ( not ( = ?auto_249612 ?auto_249621 ) ) ( not ( = ?auto_249612 ?auto_249622 ) ) ( not ( = ?auto_249612 ?auto_249623 ) ) ( not ( = ?auto_249612 ?auto_249624 ) ) ( not ( = ?auto_249613 ?auto_249614 ) ) ( not ( = ?auto_249613 ?auto_249615 ) ) ( not ( = ?auto_249613 ?auto_249616 ) ) ( not ( = ?auto_249613 ?auto_249617 ) ) ( not ( = ?auto_249613 ?auto_249618 ) ) ( not ( = ?auto_249613 ?auto_249619 ) ) ( not ( = ?auto_249613 ?auto_249620 ) ) ( not ( = ?auto_249613 ?auto_249621 ) ) ( not ( = ?auto_249613 ?auto_249622 ) ) ( not ( = ?auto_249613 ?auto_249623 ) ) ( not ( = ?auto_249613 ?auto_249624 ) ) ( not ( = ?auto_249614 ?auto_249615 ) ) ( not ( = ?auto_249614 ?auto_249616 ) ) ( not ( = ?auto_249614 ?auto_249617 ) ) ( not ( = ?auto_249614 ?auto_249618 ) ) ( not ( = ?auto_249614 ?auto_249619 ) ) ( not ( = ?auto_249614 ?auto_249620 ) ) ( not ( = ?auto_249614 ?auto_249621 ) ) ( not ( = ?auto_249614 ?auto_249622 ) ) ( not ( = ?auto_249614 ?auto_249623 ) ) ( not ( = ?auto_249614 ?auto_249624 ) ) ( not ( = ?auto_249615 ?auto_249616 ) ) ( not ( = ?auto_249615 ?auto_249617 ) ) ( not ( = ?auto_249615 ?auto_249618 ) ) ( not ( = ?auto_249615 ?auto_249619 ) ) ( not ( = ?auto_249615 ?auto_249620 ) ) ( not ( = ?auto_249615 ?auto_249621 ) ) ( not ( = ?auto_249615 ?auto_249622 ) ) ( not ( = ?auto_249615 ?auto_249623 ) ) ( not ( = ?auto_249615 ?auto_249624 ) ) ( not ( = ?auto_249616 ?auto_249617 ) ) ( not ( = ?auto_249616 ?auto_249618 ) ) ( not ( = ?auto_249616 ?auto_249619 ) ) ( not ( = ?auto_249616 ?auto_249620 ) ) ( not ( = ?auto_249616 ?auto_249621 ) ) ( not ( = ?auto_249616 ?auto_249622 ) ) ( not ( = ?auto_249616 ?auto_249623 ) ) ( not ( = ?auto_249616 ?auto_249624 ) ) ( not ( = ?auto_249617 ?auto_249618 ) ) ( not ( = ?auto_249617 ?auto_249619 ) ) ( not ( = ?auto_249617 ?auto_249620 ) ) ( not ( = ?auto_249617 ?auto_249621 ) ) ( not ( = ?auto_249617 ?auto_249622 ) ) ( not ( = ?auto_249617 ?auto_249623 ) ) ( not ( = ?auto_249617 ?auto_249624 ) ) ( not ( = ?auto_249618 ?auto_249619 ) ) ( not ( = ?auto_249618 ?auto_249620 ) ) ( not ( = ?auto_249618 ?auto_249621 ) ) ( not ( = ?auto_249618 ?auto_249622 ) ) ( not ( = ?auto_249618 ?auto_249623 ) ) ( not ( = ?auto_249618 ?auto_249624 ) ) ( not ( = ?auto_249619 ?auto_249620 ) ) ( not ( = ?auto_249619 ?auto_249621 ) ) ( not ( = ?auto_249619 ?auto_249622 ) ) ( not ( = ?auto_249619 ?auto_249623 ) ) ( not ( = ?auto_249619 ?auto_249624 ) ) ( not ( = ?auto_249620 ?auto_249621 ) ) ( not ( = ?auto_249620 ?auto_249622 ) ) ( not ( = ?auto_249620 ?auto_249623 ) ) ( not ( = ?auto_249620 ?auto_249624 ) ) ( not ( = ?auto_249621 ?auto_249622 ) ) ( not ( = ?auto_249621 ?auto_249623 ) ) ( not ( = ?auto_249621 ?auto_249624 ) ) ( not ( = ?auto_249622 ?auto_249623 ) ) ( not ( = ?auto_249622 ?auto_249624 ) ) ( not ( = ?auto_249623 ?auto_249624 ) ) ( ON ?auto_249622 ?auto_249623 ) ( ON ?auto_249621 ?auto_249622 ) ( ON ?auto_249620 ?auto_249621 ) ( ON ?auto_249619 ?auto_249620 ) ( ON ?auto_249618 ?auto_249619 ) ( CLEAR ?auto_249616 ) ( ON ?auto_249617 ?auto_249618 ) ( CLEAR ?auto_249617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249612 ?auto_249613 ?auto_249614 ?auto_249615 ?auto_249616 ?auto_249617 )
      ( MAKE-12PILE ?auto_249612 ?auto_249613 ?auto_249614 ?auto_249615 ?auto_249616 ?auto_249617 ?auto_249618 ?auto_249619 ?auto_249620 ?auto_249621 ?auto_249622 ?auto_249623 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249662 - BLOCK
      ?auto_249663 - BLOCK
      ?auto_249664 - BLOCK
      ?auto_249665 - BLOCK
      ?auto_249666 - BLOCK
      ?auto_249667 - BLOCK
      ?auto_249668 - BLOCK
      ?auto_249669 - BLOCK
      ?auto_249670 - BLOCK
      ?auto_249671 - BLOCK
      ?auto_249672 - BLOCK
      ?auto_249673 - BLOCK
    )
    :vars
    (
      ?auto_249674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249673 ?auto_249674 ) ( ON-TABLE ?auto_249662 ) ( ON ?auto_249663 ?auto_249662 ) ( ON ?auto_249664 ?auto_249663 ) ( ON ?auto_249665 ?auto_249664 ) ( not ( = ?auto_249662 ?auto_249663 ) ) ( not ( = ?auto_249662 ?auto_249664 ) ) ( not ( = ?auto_249662 ?auto_249665 ) ) ( not ( = ?auto_249662 ?auto_249666 ) ) ( not ( = ?auto_249662 ?auto_249667 ) ) ( not ( = ?auto_249662 ?auto_249668 ) ) ( not ( = ?auto_249662 ?auto_249669 ) ) ( not ( = ?auto_249662 ?auto_249670 ) ) ( not ( = ?auto_249662 ?auto_249671 ) ) ( not ( = ?auto_249662 ?auto_249672 ) ) ( not ( = ?auto_249662 ?auto_249673 ) ) ( not ( = ?auto_249662 ?auto_249674 ) ) ( not ( = ?auto_249663 ?auto_249664 ) ) ( not ( = ?auto_249663 ?auto_249665 ) ) ( not ( = ?auto_249663 ?auto_249666 ) ) ( not ( = ?auto_249663 ?auto_249667 ) ) ( not ( = ?auto_249663 ?auto_249668 ) ) ( not ( = ?auto_249663 ?auto_249669 ) ) ( not ( = ?auto_249663 ?auto_249670 ) ) ( not ( = ?auto_249663 ?auto_249671 ) ) ( not ( = ?auto_249663 ?auto_249672 ) ) ( not ( = ?auto_249663 ?auto_249673 ) ) ( not ( = ?auto_249663 ?auto_249674 ) ) ( not ( = ?auto_249664 ?auto_249665 ) ) ( not ( = ?auto_249664 ?auto_249666 ) ) ( not ( = ?auto_249664 ?auto_249667 ) ) ( not ( = ?auto_249664 ?auto_249668 ) ) ( not ( = ?auto_249664 ?auto_249669 ) ) ( not ( = ?auto_249664 ?auto_249670 ) ) ( not ( = ?auto_249664 ?auto_249671 ) ) ( not ( = ?auto_249664 ?auto_249672 ) ) ( not ( = ?auto_249664 ?auto_249673 ) ) ( not ( = ?auto_249664 ?auto_249674 ) ) ( not ( = ?auto_249665 ?auto_249666 ) ) ( not ( = ?auto_249665 ?auto_249667 ) ) ( not ( = ?auto_249665 ?auto_249668 ) ) ( not ( = ?auto_249665 ?auto_249669 ) ) ( not ( = ?auto_249665 ?auto_249670 ) ) ( not ( = ?auto_249665 ?auto_249671 ) ) ( not ( = ?auto_249665 ?auto_249672 ) ) ( not ( = ?auto_249665 ?auto_249673 ) ) ( not ( = ?auto_249665 ?auto_249674 ) ) ( not ( = ?auto_249666 ?auto_249667 ) ) ( not ( = ?auto_249666 ?auto_249668 ) ) ( not ( = ?auto_249666 ?auto_249669 ) ) ( not ( = ?auto_249666 ?auto_249670 ) ) ( not ( = ?auto_249666 ?auto_249671 ) ) ( not ( = ?auto_249666 ?auto_249672 ) ) ( not ( = ?auto_249666 ?auto_249673 ) ) ( not ( = ?auto_249666 ?auto_249674 ) ) ( not ( = ?auto_249667 ?auto_249668 ) ) ( not ( = ?auto_249667 ?auto_249669 ) ) ( not ( = ?auto_249667 ?auto_249670 ) ) ( not ( = ?auto_249667 ?auto_249671 ) ) ( not ( = ?auto_249667 ?auto_249672 ) ) ( not ( = ?auto_249667 ?auto_249673 ) ) ( not ( = ?auto_249667 ?auto_249674 ) ) ( not ( = ?auto_249668 ?auto_249669 ) ) ( not ( = ?auto_249668 ?auto_249670 ) ) ( not ( = ?auto_249668 ?auto_249671 ) ) ( not ( = ?auto_249668 ?auto_249672 ) ) ( not ( = ?auto_249668 ?auto_249673 ) ) ( not ( = ?auto_249668 ?auto_249674 ) ) ( not ( = ?auto_249669 ?auto_249670 ) ) ( not ( = ?auto_249669 ?auto_249671 ) ) ( not ( = ?auto_249669 ?auto_249672 ) ) ( not ( = ?auto_249669 ?auto_249673 ) ) ( not ( = ?auto_249669 ?auto_249674 ) ) ( not ( = ?auto_249670 ?auto_249671 ) ) ( not ( = ?auto_249670 ?auto_249672 ) ) ( not ( = ?auto_249670 ?auto_249673 ) ) ( not ( = ?auto_249670 ?auto_249674 ) ) ( not ( = ?auto_249671 ?auto_249672 ) ) ( not ( = ?auto_249671 ?auto_249673 ) ) ( not ( = ?auto_249671 ?auto_249674 ) ) ( not ( = ?auto_249672 ?auto_249673 ) ) ( not ( = ?auto_249672 ?auto_249674 ) ) ( not ( = ?auto_249673 ?auto_249674 ) ) ( ON ?auto_249672 ?auto_249673 ) ( ON ?auto_249671 ?auto_249672 ) ( ON ?auto_249670 ?auto_249671 ) ( ON ?auto_249669 ?auto_249670 ) ( ON ?auto_249668 ?auto_249669 ) ( ON ?auto_249667 ?auto_249668 ) ( CLEAR ?auto_249665 ) ( ON ?auto_249666 ?auto_249667 ) ( CLEAR ?auto_249666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249662 ?auto_249663 ?auto_249664 ?auto_249665 ?auto_249666 )
      ( MAKE-12PILE ?auto_249662 ?auto_249663 ?auto_249664 ?auto_249665 ?auto_249666 ?auto_249667 ?auto_249668 ?auto_249669 ?auto_249670 ?auto_249671 ?auto_249672 ?auto_249673 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249712 - BLOCK
      ?auto_249713 - BLOCK
      ?auto_249714 - BLOCK
      ?auto_249715 - BLOCK
      ?auto_249716 - BLOCK
      ?auto_249717 - BLOCK
      ?auto_249718 - BLOCK
      ?auto_249719 - BLOCK
      ?auto_249720 - BLOCK
      ?auto_249721 - BLOCK
      ?auto_249722 - BLOCK
      ?auto_249723 - BLOCK
    )
    :vars
    (
      ?auto_249724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249723 ?auto_249724 ) ( ON-TABLE ?auto_249712 ) ( ON ?auto_249713 ?auto_249712 ) ( ON ?auto_249714 ?auto_249713 ) ( not ( = ?auto_249712 ?auto_249713 ) ) ( not ( = ?auto_249712 ?auto_249714 ) ) ( not ( = ?auto_249712 ?auto_249715 ) ) ( not ( = ?auto_249712 ?auto_249716 ) ) ( not ( = ?auto_249712 ?auto_249717 ) ) ( not ( = ?auto_249712 ?auto_249718 ) ) ( not ( = ?auto_249712 ?auto_249719 ) ) ( not ( = ?auto_249712 ?auto_249720 ) ) ( not ( = ?auto_249712 ?auto_249721 ) ) ( not ( = ?auto_249712 ?auto_249722 ) ) ( not ( = ?auto_249712 ?auto_249723 ) ) ( not ( = ?auto_249712 ?auto_249724 ) ) ( not ( = ?auto_249713 ?auto_249714 ) ) ( not ( = ?auto_249713 ?auto_249715 ) ) ( not ( = ?auto_249713 ?auto_249716 ) ) ( not ( = ?auto_249713 ?auto_249717 ) ) ( not ( = ?auto_249713 ?auto_249718 ) ) ( not ( = ?auto_249713 ?auto_249719 ) ) ( not ( = ?auto_249713 ?auto_249720 ) ) ( not ( = ?auto_249713 ?auto_249721 ) ) ( not ( = ?auto_249713 ?auto_249722 ) ) ( not ( = ?auto_249713 ?auto_249723 ) ) ( not ( = ?auto_249713 ?auto_249724 ) ) ( not ( = ?auto_249714 ?auto_249715 ) ) ( not ( = ?auto_249714 ?auto_249716 ) ) ( not ( = ?auto_249714 ?auto_249717 ) ) ( not ( = ?auto_249714 ?auto_249718 ) ) ( not ( = ?auto_249714 ?auto_249719 ) ) ( not ( = ?auto_249714 ?auto_249720 ) ) ( not ( = ?auto_249714 ?auto_249721 ) ) ( not ( = ?auto_249714 ?auto_249722 ) ) ( not ( = ?auto_249714 ?auto_249723 ) ) ( not ( = ?auto_249714 ?auto_249724 ) ) ( not ( = ?auto_249715 ?auto_249716 ) ) ( not ( = ?auto_249715 ?auto_249717 ) ) ( not ( = ?auto_249715 ?auto_249718 ) ) ( not ( = ?auto_249715 ?auto_249719 ) ) ( not ( = ?auto_249715 ?auto_249720 ) ) ( not ( = ?auto_249715 ?auto_249721 ) ) ( not ( = ?auto_249715 ?auto_249722 ) ) ( not ( = ?auto_249715 ?auto_249723 ) ) ( not ( = ?auto_249715 ?auto_249724 ) ) ( not ( = ?auto_249716 ?auto_249717 ) ) ( not ( = ?auto_249716 ?auto_249718 ) ) ( not ( = ?auto_249716 ?auto_249719 ) ) ( not ( = ?auto_249716 ?auto_249720 ) ) ( not ( = ?auto_249716 ?auto_249721 ) ) ( not ( = ?auto_249716 ?auto_249722 ) ) ( not ( = ?auto_249716 ?auto_249723 ) ) ( not ( = ?auto_249716 ?auto_249724 ) ) ( not ( = ?auto_249717 ?auto_249718 ) ) ( not ( = ?auto_249717 ?auto_249719 ) ) ( not ( = ?auto_249717 ?auto_249720 ) ) ( not ( = ?auto_249717 ?auto_249721 ) ) ( not ( = ?auto_249717 ?auto_249722 ) ) ( not ( = ?auto_249717 ?auto_249723 ) ) ( not ( = ?auto_249717 ?auto_249724 ) ) ( not ( = ?auto_249718 ?auto_249719 ) ) ( not ( = ?auto_249718 ?auto_249720 ) ) ( not ( = ?auto_249718 ?auto_249721 ) ) ( not ( = ?auto_249718 ?auto_249722 ) ) ( not ( = ?auto_249718 ?auto_249723 ) ) ( not ( = ?auto_249718 ?auto_249724 ) ) ( not ( = ?auto_249719 ?auto_249720 ) ) ( not ( = ?auto_249719 ?auto_249721 ) ) ( not ( = ?auto_249719 ?auto_249722 ) ) ( not ( = ?auto_249719 ?auto_249723 ) ) ( not ( = ?auto_249719 ?auto_249724 ) ) ( not ( = ?auto_249720 ?auto_249721 ) ) ( not ( = ?auto_249720 ?auto_249722 ) ) ( not ( = ?auto_249720 ?auto_249723 ) ) ( not ( = ?auto_249720 ?auto_249724 ) ) ( not ( = ?auto_249721 ?auto_249722 ) ) ( not ( = ?auto_249721 ?auto_249723 ) ) ( not ( = ?auto_249721 ?auto_249724 ) ) ( not ( = ?auto_249722 ?auto_249723 ) ) ( not ( = ?auto_249722 ?auto_249724 ) ) ( not ( = ?auto_249723 ?auto_249724 ) ) ( ON ?auto_249722 ?auto_249723 ) ( ON ?auto_249721 ?auto_249722 ) ( ON ?auto_249720 ?auto_249721 ) ( ON ?auto_249719 ?auto_249720 ) ( ON ?auto_249718 ?auto_249719 ) ( ON ?auto_249717 ?auto_249718 ) ( ON ?auto_249716 ?auto_249717 ) ( CLEAR ?auto_249714 ) ( ON ?auto_249715 ?auto_249716 ) ( CLEAR ?auto_249715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249712 ?auto_249713 ?auto_249714 ?auto_249715 )
      ( MAKE-12PILE ?auto_249712 ?auto_249713 ?auto_249714 ?auto_249715 ?auto_249716 ?auto_249717 ?auto_249718 ?auto_249719 ?auto_249720 ?auto_249721 ?auto_249722 ?auto_249723 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249762 - BLOCK
      ?auto_249763 - BLOCK
      ?auto_249764 - BLOCK
      ?auto_249765 - BLOCK
      ?auto_249766 - BLOCK
      ?auto_249767 - BLOCK
      ?auto_249768 - BLOCK
      ?auto_249769 - BLOCK
      ?auto_249770 - BLOCK
      ?auto_249771 - BLOCK
      ?auto_249772 - BLOCK
      ?auto_249773 - BLOCK
    )
    :vars
    (
      ?auto_249774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249773 ?auto_249774 ) ( ON-TABLE ?auto_249762 ) ( ON ?auto_249763 ?auto_249762 ) ( not ( = ?auto_249762 ?auto_249763 ) ) ( not ( = ?auto_249762 ?auto_249764 ) ) ( not ( = ?auto_249762 ?auto_249765 ) ) ( not ( = ?auto_249762 ?auto_249766 ) ) ( not ( = ?auto_249762 ?auto_249767 ) ) ( not ( = ?auto_249762 ?auto_249768 ) ) ( not ( = ?auto_249762 ?auto_249769 ) ) ( not ( = ?auto_249762 ?auto_249770 ) ) ( not ( = ?auto_249762 ?auto_249771 ) ) ( not ( = ?auto_249762 ?auto_249772 ) ) ( not ( = ?auto_249762 ?auto_249773 ) ) ( not ( = ?auto_249762 ?auto_249774 ) ) ( not ( = ?auto_249763 ?auto_249764 ) ) ( not ( = ?auto_249763 ?auto_249765 ) ) ( not ( = ?auto_249763 ?auto_249766 ) ) ( not ( = ?auto_249763 ?auto_249767 ) ) ( not ( = ?auto_249763 ?auto_249768 ) ) ( not ( = ?auto_249763 ?auto_249769 ) ) ( not ( = ?auto_249763 ?auto_249770 ) ) ( not ( = ?auto_249763 ?auto_249771 ) ) ( not ( = ?auto_249763 ?auto_249772 ) ) ( not ( = ?auto_249763 ?auto_249773 ) ) ( not ( = ?auto_249763 ?auto_249774 ) ) ( not ( = ?auto_249764 ?auto_249765 ) ) ( not ( = ?auto_249764 ?auto_249766 ) ) ( not ( = ?auto_249764 ?auto_249767 ) ) ( not ( = ?auto_249764 ?auto_249768 ) ) ( not ( = ?auto_249764 ?auto_249769 ) ) ( not ( = ?auto_249764 ?auto_249770 ) ) ( not ( = ?auto_249764 ?auto_249771 ) ) ( not ( = ?auto_249764 ?auto_249772 ) ) ( not ( = ?auto_249764 ?auto_249773 ) ) ( not ( = ?auto_249764 ?auto_249774 ) ) ( not ( = ?auto_249765 ?auto_249766 ) ) ( not ( = ?auto_249765 ?auto_249767 ) ) ( not ( = ?auto_249765 ?auto_249768 ) ) ( not ( = ?auto_249765 ?auto_249769 ) ) ( not ( = ?auto_249765 ?auto_249770 ) ) ( not ( = ?auto_249765 ?auto_249771 ) ) ( not ( = ?auto_249765 ?auto_249772 ) ) ( not ( = ?auto_249765 ?auto_249773 ) ) ( not ( = ?auto_249765 ?auto_249774 ) ) ( not ( = ?auto_249766 ?auto_249767 ) ) ( not ( = ?auto_249766 ?auto_249768 ) ) ( not ( = ?auto_249766 ?auto_249769 ) ) ( not ( = ?auto_249766 ?auto_249770 ) ) ( not ( = ?auto_249766 ?auto_249771 ) ) ( not ( = ?auto_249766 ?auto_249772 ) ) ( not ( = ?auto_249766 ?auto_249773 ) ) ( not ( = ?auto_249766 ?auto_249774 ) ) ( not ( = ?auto_249767 ?auto_249768 ) ) ( not ( = ?auto_249767 ?auto_249769 ) ) ( not ( = ?auto_249767 ?auto_249770 ) ) ( not ( = ?auto_249767 ?auto_249771 ) ) ( not ( = ?auto_249767 ?auto_249772 ) ) ( not ( = ?auto_249767 ?auto_249773 ) ) ( not ( = ?auto_249767 ?auto_249774 ) ) ( not ( = ?auto_249768 ?auto_249769 ) ) ( not ( = ?auto_249768 ?auto_249770 ) ) ( not ( = ?auto_249768 ?auto_249771 ) ) ( not ( = ?auto_249768 ?auto_249772 ) ) ( not ( = ?auto_249768 ?auto_249773 ) ) ( not ( = ?auto_249768 ?auto_249774 ) ) ( not ( = ?auto_249769 ?auto_249770 ) ) ( not ( = ?auto_249769 ?auto_249771 ) ) ( not ( = ?auto_249769 ?auto_249772 ) ) ( not ( = ?auto_249769 ?auto_249773 ) ) ( not ( = ?auto_249769 ?auto_249774 ) ) ( not ( = ?auto_249770 ?auto_249771 ) ) ( not ( = ?auto_249770 ?auto_249772 ) ) ( not ( = ?auto_249770 ?auto_249773 ) ) ( not ( = ?auto_249770 ?auto_249774 ) ) ( not ( = ?auto_249771 ?auto_249772 ) ) ( not ( = ?auto_249771 ?auto_249773 ) ) ( not ( = ?auto_249771 ?auto_249774 ) ) ( not ( = ?auto_249772 ?auto_249773 ) ) ( not ( = ?auto_249772 ?auto_249774 ) ) ( not ( = ?auto_249773 ?auto_249774 ) ) ( ON ?auto_249772 ?auto_249773 ) ( ON ?auto_249771 ?auto_249772 ) ( ON ?auto_249770 ?auto_249771 ) ( ON ?auto_249769 ?auto_249770 ) ( ON ?auto_249768 ?auto_249769 ) ( ON ?auto_249767 ?auto_249768 ) ( ON ?auto_249766 ?auto_249767 ) ( ON ?auto_249765 ?auto_249766 ) ( CLEAR ?auto_249763 ) ( ON ?auto_249764 ?auto_249765 ) ( CLEAR ?auto_249764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249762 ?auto_249763 ?auto_249764 )
      ( MAKE-12PILE ?auto_249762 ?auto_249763 ?auto_249764 ?auto_249765 ?auto_249766 ?auto_249767 ?auto_249768 ?auto_249769 ?auto_249770 ?auto_249771 ?auto_249772 ?auto_249773 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249812 - BLOCK
      ?auto_249813 - BLOCK
      ?auto_249814 - BLOCK
      ?auto_249815 - BLOCK
      ?auto_249816 - BLOCK
      ?auto_249817 - BLOCK
      ?auto_249818 - BLOCK
      ?auto_249819 - BLOCK
      ?auto_249820 - BLOCK
      ?auto_249821 - BLOCK
      ?auto_249822 - BLOCK
      ?auto_249823 - BLOCK
    )
    :vars
    (
      ?auto_249824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249823 ?auto_249824 ) ( ON-TABLE ?auto_249812 ) ( not ( = ?auto_249812 ?auto_249813 ) ) ( not ( = ?auto_249812 ?auto_249814 ) ) ( not ( = ?auto_249812 ?auto_249815 ) ) ( not ( = ?auto_249812 ?auto_249816 ) ) ( not ( = ?auto_249812 ?auto_249817 ) ) ( not ( = ?auto_249812 ?auto_249818 ) ) ( not ( = ?auto_249812 ?auto_249819 ) ) ( not ( = ?auto_249812 ?auto_249820 ) ) ( not ( = ?auto_249812 ?auto_249821 ) ) ( not ( = ?auto_249812 ?auto_249822 ) ) ( not ( = ?auto_249812 ?auto_249823 ) ) ( not ( = ?auto_249812 ?auto_249824 ) ) ( not ( = ?auto_249813 ?auto_249814 ) ) ( not ( = ?auto_249813 ?auto_249815 ) ) ( not ( = ?auto_249813 ?auto_249816 ) ) ( not ( = ?auto_249813 ?auto_249817 ) ) ( not ( = ?auto_249813 ?auto_249818 ) ) ( not ( = ?auto_249813 ?auto_249819 ) ) ( not ( = ?auto_249813 ?auto_249820 ) ) ( not ( = ?auto_249813 ?auto_249821 ) ) ( not ( = ?auto_249813 ?auto_249822 ) ) ( not ( = ?auto_249813 ?auto_249823 ) ) ( not ( = ?auto_249813 ?auto_249824 ) ) ( not ( = ?auto_249814 ?auto_249815 ) ) ( not ( = ?auto_249814 ?auto_249816 ) ) ( not ( = ?auto_249814 ?auto_249817 ) ) ( not ( = ?auto_249814 ?auto_249818 ) ) ( not ( = ?auto_249814 ?auto_249819 ) ) ( not ( = ?auto_249814 ?auto_249820 ) ) ( not ( = ?auto_249814 ?auto_249821 ) ) ( not ( = ?auto_249814 ?auto_249822 ) ) ( not ( = ?auto_249814 ?auto_249823 ) ) ( not ( = ?auto_249814 ?auto_249824 ) ) ( not ( = ?auto_249815 ?auto_249816 ) ) ( not ( = ?auto_249815 ?auto_249817 ) ) ( not ( = ?auto_249815 ?auto_249818 ) ) ( not ( = ?auto_249815 ?auto_249819 ) ) ( not ( = ?auto_249815 ?auto_249820 ) ) ( not ( = ?auto_249815 ?auto_249821 ) ) ( not ( = ?auto_249815 ?auto_249822 ) ) ( not ( = ?auto_249815 ?auto_249823 ) ) ( not ( = ?auto_249815 ?auto_249824 ) ) ( not ( = ?auto_249816 ?auto_249817 ) ) ( not ( = ?auto_249816 ?auto_249818 ) ) ( not ( = ?auto_249816 ?auto_249819 ) ) ( not ( = ?auto_249816 ?auto_249820 ) ) ( not ( = ?auto_249816 ?auto_249821 ) ) ( not ( = ?auto_249816 ?auto_249822 ) ) ( not ( = ?auto_249816 ?auto_249823 ) ) ( not ( = ?auto_249816 ?auto_249824 ) ) ( not ( = ?auto_249817 ?auto_249818 ) ) ( not ( = ?auto_249817 ?auto_249819 ) ) ( not ( = ?auto_249817 ?auto_249820 ) ) ( not ( = ?auto_249817 ?auto_249821 ) ) ( not ( = ?auto_249817 ?auto_249822 ) ) ( not ( = ?auto_249817 ?auto_249823 ) ) ( not ( = ?auto_249817 ?auto_249824 ) ) ( not ( = ?auto_249818 ?auto_249819 ) ) ( not ( = ?auto_249818 ?auto_249820 ) ) ( not ( = ?auto_249818 ?auto_249821 ) ) ( not ( = ?auto_249818 ?auto_249822 ) ) ( not ( = ?auto_249818 ?auto_249823 ) ) ( not ( = ?auto_249818 ?auto_249824 ) ) ( not ( = ?auto_249819 ?auto_249820 ) ) ( not ( = ?auto_249819 ?auto_249821 ) ) ( not ( = ?auto_249819 ?auto_249822 ) ) ( not ( = ?auto_249819 ?auto_249823 ) ) ( not ( = ?auto_249819 ?auto_249824 ) ) ( not ( = ?auto_249820 ?auto_249821 ) ) ( not ( = ?auto_249820 ?auto_249822 ) ) ( not ( = ?auto_249820 ?auto_249823 ) ) ( not ( = ?auto_249820 ?auto_249824 ) ) ( not ( = ?auto_249821 ?auto_249822 ) ) ( not ( = ?auto_249821 ?auto_249823 ) ) ( not ( = ?auto_249821 ?auto_249824 ) ) ( not ( = ?auto_249822 ?auto_249823 ) ) ( not ( = ?auto_249822 ?auto_249824 ) ) ( not ( = ?auto_249823 ?auto_249824 ) ) ( ON ?auto_249822 ?auto_249823 ) ( ON ?auto_249821 ?auto_249822 ) ( ON ?auto_249820 ?auto_249821 ) ( ON ?auto_249819 ?auto_249820 ) ( ON ?auto_249818 ?auto_249819 ) ( ON ?auto_249817 ?auto_249818 ) ( ON ?auto_249816 ?auto_249817 ) ( ON ?auto_249815 ?auto_249816 ) ( ON ?auto_249814 ?auto_249815 ) ( CLEAR ?auto_249812 ) ( ON ?auto_249813 ?auto_249814 ) ( CLEAR ?auto_249813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249812 ?auto_249813 )
      ( MAKE-12PILE ?auto_249812 ?auto_249813 ?auto_249814 ?auto_249815 ?auto_249816 ?auto_249817 ?auto_249818 ?auto_249819 ?auto_249820 ?auto_249821 ?auto_249822 ?auto_249823 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249862 - BLOCK
      ?auto_249863 - BLOCK
      ?auto_249864 - BLOCK
      ?auto_249865 - BLOCK
      ?auto_249866 - BLOCK
      ?auto_249867 - BLOCK
      ?auto_249868 - BLOCK
      ?auto_249869 - BLOCK
      ?auto_249870 - BLOCK
      ?auto_249871 - BLOCK
      ?auto_249872 - BLOCK
      ?auto_249873 - BLOCK
    )
    :vars
    (
      ?auto_249874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249873 ?auto_249874 ) ( not ( = ?auto_249862 ?auto_249863 ) ) ( not ( = ?auto_249862 ?auto_249864 ) ) ( not ( = ?auto_249862 ?auto_249865 ) ) ( not ( = ?auto_249862 ?auto_249866 ) ) ( not ( = ?auto_249862 ?auto_249867 ) ) ( not ( = ?auto_249862 ?auto_249868 ) ) ( not ( = ?auto_249862 ?auto_249869 ) ) ( not ( = ?auto_249862 ?auto_249870 ) ) ( not ( = ?auto_249862 ?auto_249871 ) ) ( not ( = ?auto_249862 ?auto_249872 ) ) ( not ( = ?auto_249862 ?auto_249873 ) ) ( not ( = ?auto_249862 ?auto_249874 ) ) ( not ( = ?auto_249863 ?auto_249864 ) ) ( not ( = ?auto_249863 ?auto_249865 ) ) ( not ( = ?auto_249863 ?auto_249866 ) ) ( not ( = ?auto_249863 ?auto_249867 ) ) ( not ( = ?auto_249863 ?auto_249868 ) ) ( not ( = ?auto_249863 ?auto_249869 ) ) ( not ( = ?auto_249863 ?auto_249870 ) ) ( not ( = ?auto_249863 ?auto_249871 ) ) ( not ( = ?auto_249863 ?auto_249872 ) ) ( not ( = ?auto_249863 ?auto_249873 ) ) ( not ( = ?auto_249863 ?auto_249874 ) ) ( not ( = ?auto_249864 ?auto_249865 ) ) ( not ( = ?auto_249864 ?auto_249866 ) ) ( not ( = ?auto_249864 ?auto_249867 ) ) ( not ( = ?auto_249864 ?auto_249868 ) ) ( not ( = ?auto_249864 ?auto_249869 ) ) ( not ( = ?auto_249864 ?auto_249870 ) ) ( not ( = ?auto_249864 ?auto_249871 ) ) ( not ( = ?auto_249864 ?auto_249872 ) ) ( not ( = ?auto_249864 ?auto_249873 ) ) ( not ( = ?auto_249864 ?auto_249874 ) ) ( not ( = ?auto_249865 ?auto_249866 ) ) ( not ( = ?auto_249865 ?auto_249867 ) ) ( not ( = ?auto_249865 ?auto_249868 ) ) ( not ( = ?auto_249865 ?auto_249869 ) ) ( not ( = ?auto_249865 ?auto_249870 ) ) ( not ( = ?auto_249865 ?auto_249871 ) ) ( not ( = ?auto_249865 ?auto_249872 ) ) ( not ( = ?auto_249865 ?auto_249873 ) ) ( not ( = ?auto_249865 ?auto_249874 ) ) ( not ( = ?auto_249866 ?auto_249867 ) ) ( not ( = ?auto_249866 ?auto_249868 ) ) ( not ( = ?auto_249866 ?auto_249869 ) ) ( not ( = ?auto_249866 ?auto_249870 ) ) ( not ( = ?auto_249866 ?auto_249871 ) ) ( not ( = ?auto_249866 ?auto_249872 ) ) ( not ( = ?auto_249866 ?auto_249873 ) ) ( not ( = ?auto_249866 ?auto_249874 ) ) ( not ( = ?auto_249867 ?auto_249868 ) ) ( not ( = ?auto_249867 ?auto_249869 ) ) ( not ( = ?auto_249867 ?auto_249870 ) ) ( not ( = ?auto_249867 ?auto_249871 ) ) ( not ( = ?auto_249867 ?auto_249872 ) ) ( not ( = ?auto_249867 ?auto_249873 ) ) ( not ( = ?auto_249867 ?auto_249874 ) ) ( not ( = ?auto_249868 ?auto_249869 ) ) ( not ( = ?auto_249868 ?auto_249870 ) ) ( not ( = ?auto_249868 ?auto_249871 ) ) ( not ( = ?auto_249868 ?auto_249872 ) ) ( not ( = ?auto_249868 ?auto_249873 ) ) ( not ( = ?auto_249868 ?auto_249874 ) ) ( not ( = ?auto_249869 ?auto_249870 ) ) ( not ( = ?auto_249869 ?auto_249871 ) ) ( not ( = ?auto_249869 ?auto_249872 ) ) ( not ( = ?auto_249869 ?auto_249873 ) ) ( not ( = ?auto_249869 ?auto_249874 ) ) ( not ( = ?auto_249870 ?auto_249871 ) ) ( not ( = ?auto_249870 ?auto_249872 ) ) ( not ( = ?auto_249870 ?auto_249873 ) ) ( not ( = ?auto_249870 ?auto_249874 ) ) ( not ( = ?auto_249871 ?auto_249872 ) ) ( not ( = ?auto_249871 ?auto_249873 ) ) ( not ( = ?auto_249871 ?auto_249874 ) ) ( not ( = ?auto_249872 ?auto_249873 ) ) ( not ( = ?auto_249872 ?auto_249874 ) ) ( not ( = ?auto_249873 ?auto_249874 ) ) ( ON ?auto_249872 ?auto_249873 ) ( ON ?auto_249871 ?auto_249872 ) ( ON ?auto_249870 ?auto_249871 ) ( ON ?auto_249869 ?auto_249870 ) ( ON ?auto_249868 ?auto_249869 ) ( ON ?auto_249867 ?auto_249868 ) ( ON ?auto_249866 ?auto_249867 ) ( ON ?auto_249865 ?auto_249866 ) ( ON ?auto_249864 ?auto_249865 ) ( ON ?auto_249863 ?auto_249864 ) ( ON ?auto_249862 ?auto_249863 ) ( CLEAR ?auto_249862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249862 )
      ( MAKE-12PILE ?auto_249862 ?auto_249863 ?auto_249864 ?auto_249865 ?auto_249866 ?auto_249867 ?auto_249868 ?auto_249869 ?auto_249870 ?auto_249871 ?auto_249872 ?auto_249873 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249913 - BLOCK
      ?auto_249914 - BLOCK
      ?auto_249915 - BLOCK
      ?auto_249916 - BLOCK
      ?auto_249917 - BLOCK
      ?auto_249918 - BLOCK
      ?auto_249919 - BLOCK
      ?auto_249920 - BLOCK
      ?auto_249921 - BLOCK
      ?auto_249922 - BLOCK
      ?auto_249923 - BLOCK
      ?auto_249924 - BLOCK
      ?auto_249925 - BLOCK
    )
    :vars
    (
      ?auto_249926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249924 ) ( ON ?auto_249925 ?auto_249926 ) ( CLEAR ?auto_249925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249913 ) ( ON ?auto_249914 ?auto_249913 ) ( ON ?auto_249915 ?auto_249914 ) ( ON ?auto_249916 ?auto_249915 ) ( ON ?auto_249917 ?auto_249916 ) ( ON ?auto_249918 ?auto_249917 ) ( ON ?auto_249919 ?auto_249918 ) ( ON ?auto_249920 ?auto_249919 ) ( ON ?auto_249921 ?auto_249920 ) ( ON ?auto_249922 ?auto_249921 ) ( ON ?auto_249923 ?auto_249922 ) ( ON ?auto_249924 ?auto_249923 ) ( not ( = ?auto_249913 ?auto_249914 ) ) ( not ( = ?auto_249913 ?auto_249915 ) ) ( not ( = ?auto_249913 ?auto_249916 ) ) ( not ( = ?auto_249913 ?auto_249917 ) ) ( not ( = ?auto_249913 ?auto_249918 ) ) ( not ( = ?auto_249913 ?auto_249919 ) ) ( not ( = ?auto_249913 ?auto_249920 ) ) ( not ( = ?auto_249913 ?auto_249921 ) ) ( not ( = ?auto_249913 ?auto_249922 ) ) ( not ( = ?auto_249913 ?auto_249923 ) ) ( not ( = ?auto_249913 ?auto_249924 ) ) ( not ( = ?auto_249913 ?auto_249925 ) ) ( not ( = ?auto_249913 ?auto_249926 ) ) ( not ( = ?auto_249914 ?auto_249915 ) ) ( not ( = ?auto_249914 ?auto_249916 ) ) ( not ( = ?auto_249914 ?auto_249917 ) ) ( not ( = ?auto_249914 ?auto_249918 ) ) ( not ( = ?auto_249914 ?auto_249919 ) ) ( not ( = ?auto_249914 ?auto_249920 ) ) ( not ( = ?auto_249914 ?auto_249921 ) ) ( not ( = ?auto_249914 ?auto_249922 ) ) ( not ( = ?auto_249914 ?auto_249923 ) ) ( not ( = ?auto_249914 ?auto_249924 ) ) ( not ( = ?auto_249914 ?auto_249925 ) ) ( not ( = ?auto_249914 ?auto_249926 ) ) ( not ( = ?auto_249915 ?auto_249916 ) ) ( not ( = ?auto_249915 ?auto_249917 ) ) ( not ( = ?auto_249915 ?auto_249918 ) ) ( not ( = ?auto_249915 ?auto_249919 ) ) ( not ( = ?auto_249915 ?auto_249920 ) ) ( not ( = ?auto_249915 ?auto_249921 ) ) ( not ( = ?auto_249915 ?auto_249922 ) ) ( not ( = ?auto_249915 ?auto_249923 ) ) ( not ( = ?auto_249915 ?auto_249924 ) ) ( not ( = ?auto_249915 ?auto_249925 ) ) ( not ( = ?auto_249915 ?auto_249926 ) ) ( not ( = ?auto_249916 ?auto_249917 ) ) ( not ( = ?auto_249916 ?auto_249918 ) ) ( not ( = ?auto_249916 ?auto_249919 ) ) ( not ( = ?auto_249916 ?auto_249920 ) ) ( not ( = ?auto_249916 ?auto_249921 ) ) ( not ( = ?auto_249916 ?auto_249922 ) ) ( not ( = ?auto_249916 ?auto_249923 ) ) ( not ( = ?auto_249916 ?auto_249924 ) ) ( not ( = ?auto_249916 ?auto_249925 ) ) ( not ( = ?auto_249916 ?auto_249926 ) ) ( not ( = ?auto_249917 ?auto_249918 ) ) ( not ( = ?auto_249917 ?auto_249919 ) ) ( not ( = ?auto_249917 ?auto_249920 ) ) ( not ( = ?auto_249917 ?auto_249921 ) ) ( not ( = ?auto_249917 ?auto_249922 ) ) ( not ( = ?auto_249917 ?auto_249923 ) ) ( not ( = ?auto_249917 ?auto_249924 ) ) ( not ( = ?auto_249917 ?auto_249925 ) ) ( not ( = ?auto_249917 ?auto_249926 ) ) ( not ( = ?auto_249918 ?auto_249919 ) ) ( not ( = ?auto_249918 ?auto_249920 ) ) ( not ( = ?auto_249918 ?auto_249921 ) ) ( not ( = ?auto_249918 ?auto_249922 ) ) ( not ( = ?auto_249918 ?auto_249923 ) ) ( not ( = ?auto_249918 ?auto_249924 ) ) ( not ( = ?auto_249918 ?auto_249925 ) ) ( not ( = ?auto_249918 ?auto_249926 ) ) ( not ( = ?auto_249919 ?auto_249920 ) ) ( not ( = ?auto_249919 ?auto_249921 ) ) ( not ( = ?auto_249919 ?auto_249922 ) ) ( not ( = ?auto_249919 ?auto_249923 ) ) ( not ( = ?auto_249919 ?auto_249924 ) ) ( not ( = ?auto_249919 ?auto_249925 ) ) ( not ( = ?auto_249919 ?auto_249926 ) ) ( not ( = ?auto_249920 ?auto_249921 ) ) ( not ( = ?auto_249920 ?auto_249922 ) ) ( not ( = ?auto_249920 ?auto_249923 ) ) ( not ( = ?auto_249920 ?auto_249924 ) ) ( not ( = ?auto_249920 ?auto_249925 ) ) ( not ( = ?auto_249920 ?auto_249926 ) ) ( not ( = ?auto_249921 ?auto_249922 ) ) ( not ( = ?auto_249921 ?auto_249923 ) ) ( not ( = ?auto_249921 ?auto_249924 ) ) ( not ( = ?auto_249921 ?auto_249925 ) ) ( not ( = ?auto_249921 ?auto_249926 ) ) ( not ( = ?auto_249922 ?auto_249923 ) ) ( not ( = ?auto_249922 ?auto_249924 ) ) ( not ( = ?auto_249922 ?auto_249925 ) ) ( not ( = ?auto_249922 ?auto_249926 ) ) ( not ( = ?auto_249923 ?auto_249924 ) ) ( not ( = ?auto_249923 ?auto_249925 ) ) ( not ( = ?auto_249923 ?auto_249926 ) ) ( not ( = ?auto_249924 ?auto_249925 ) ) ( not ( = ?auto_249924 ?auto_249926 ) ) ( not ( = ?auto_249925 ?auto_249926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_249925 ?auto_249926 )
      ( !STACK ?auto_249925 ?auto_249924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249940 - BLOCK
      ?auto_249941 - BLOCK
      ?auto_249942 - BLOCK
      ?auto_249943 - BLOCK
      ?auto_249944 - BLOCK
      ?auto_249945 - BLOCK
      ?auto_249946 - BLOCK
      ?auto_249947 - BLOCK
      ?auto_249948 - BLOCK
      ?auto_249949 - BLOCK
      ?auto_249950 - BLOCK
      ?auto_249951 - BLOCK
      ?auto_249952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249951 ) ( ON-TABLE ?auto_249952 ) ( CLEAR ?auto_249952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249940 ) ( ON ?auto_249941 ?auto_249940 ) ( ON ?auto_249942 ?auto_249941 ) ( ON ?auto_249943 ?auto_249942 ) ( ON ?auto_249944 ?auto_249943 ) ( ON ?auto_249945 ?auto_249944 ) ( ON ?auto_249946 ?auto_249945 ) ( ON ?auto_249947 ?auto_249946 ) ( ON ?auto_249948 ?auto_249947 ) ( ON ?auto_249949 ?auto_249948 ) ( ON ?auto_249950 ?auto_249949 ) ( ON ?auto_249951 ?auto_249950 ) ( not ( = ?auto_249940 ?auto_249941 ) ) ( not ( = ?auto_249940 ?auto_249942 ) ) ( not ( = ?auto_249940 ?auto_249943 ) ) ( not ( = ?auto_249940 ?auto_249944 ) ) ( not ( = ?auto_249940 ?auto_249945 ) ) ( not ( = ?auto_249940 ?auto_249946 ) ) ( not ( = ?auto_249940 ?auto_249947 ) ) ( not ( = ?auto_249940 ?auto_249948 ) ) ( not ( = ?auto_249940 ?auto_249949 ) ) ( not ( = ?auto_249940 ?auto_249950 ) ) ( not ( = ?auto_249940 ?auto_249951 ) ) ( not ( = ?auto_249940 ?auto_249952 ) ) ( not ( = ?auto_249941 ?auto_249942 ) ) ( not ( = ?auto_249941 ?auto_249943 ) ) ( not ( = ?auto_249941 ?auto_249944 ) ) ( not ( = ?auto_249941 ?auto_249945 ) ) ( not ( = ?auto_249941 ?auto_249946 ) ) ( not ( = ?auto_249941 ?auto_249947 ) ) ( not ( = ?auto_249941 ?auto_249948 ) ) ( not ( = ?auto_249941 ?auto_249949 ) ) ( not ( = ?auto_249941 ?auto_249950 ) ) ( not ( = ?auto_249941 ?auto_249951 ) ) ( not ( = ?auto_249941 ?auto_249952 ) ) ( not ( = ?auto_249942 ?auto_249943 ) ) ( not ( = ?auto_249942 ?auto_249944 ) ) ( not ( = ?auto_249942 ?auto_249945 ) ) ( not ( = ?auto_249942 ?auto_249946 ) ) ( not ( = ?auto_249942 ?auto_249947 ) ) ( not ( = ?auto_249942 ?auto_249948 ) ) ( not ( = ?auto_249942 ?auto_249949 ) ) ( not ( = ?auto_249942 ?auto_249950 ) ) ( not ( = ?auto_249942 ?auto_249951 ) ) ( not ( = ?auto_249942 ?auto_249952 ) ) ( not ( = ?auto_249943 ?auto_249944 ) ) ( not ( = ?auto_249943 ?auto_249945 ) ) ( not ( = ?auto_249943 ?auto_249946 ) ) ( not ( = ?auto_249943 ?auto_249947 ) ) ( not ( = ?auto_249943 ?auto_249948 ) ) ( not ( = ?auto_249943 ?auto_249949 ) ) ( not ( = ?auto_249943 ?auto_249950 ) ) ( not ( = ?auto_249943 ?auto_249951 ) ) ( not ( = ?auto_249943 ?auto_249952 ) ) ( not ( = ?auto_249944 ?auto_249945 ) ) ( not ( = ?auto_249944 ?auto_249946 ) ) ( not ( = ?auto_249944 ?auto_249947 ) ) ( not ( = ?auto_249944 ?auto_249948 ) ) ( not ( = ?auto_249944 ?auto_249949 ) ) ( not ( = ?auto_249944 ?auto_249950 ) ) ( not ( = ?auto_249944 ?auto_249951 ) ) ( not ( = ?auto_249944 ?auto_249952 ) ) ( not ( = ?auto_249945 ?auto_249946 ) ) ( not ( = ?auto_249945 ?auto_249947 ) ) ( not ( = ?auto_249945 ?auto_249948 ) ) ( not ( = ?auto_249945 ?auto_249949 ) ) ( not ( = ?auto_249945 ?auto_249950 ) ) ( not ( = ?auto_249945 ?auto_249951 ) ) ( not ( = ?auto_249945 ?auto_249952 ) ) ( not ( = ?auto_249946 ?auto_249947 ) ) ( not ( = ?auto_249946 ?auto_249948 ) ) ( not ( = ?auto_249946 ?auto_249949 ) ) ( not ( = ?auto_249946 ?auto_249950 ) ) ( not ( = ?auto_249946 ?auto_249951 ) ) ( not ( = ?auto_249946 ?auto_249952 ) ) ( not ( = ?auto_249947 ?auto_249948 ) ) ( not ( = ?auto_249947 ?auto_249949 ) ) ( not ( = ?auto_249947 ?auto_249950 ) ) ( not ( = ?auto_249947 ?auto_249951 ) ) ( not ( = ?auto_249947 ?auto_249952 ) ) ( not ( = ?auto_249948 ?auto_249949 ) ) ( not ( = ?auto_249948 ?auto_249950 ) ) ( not ( = ?auto_249948 ?auto_249951 ) ) ( not ( = ?auto_249948 ?auto_249952 ) ) ( not ( = ?auto_249949 ?auto_249950 ) ) ( not ( = ?auto_249949 ?auto_249951 ) ) ( not ( = ?auto_249949 ?auto_249952 ) ) ( not ( = ?auto_249950 ?auto_249951 ) ) ( not ( = ?auto_249950 ?auto_249952 ) ) ( not ( = ?auto_249951 ?auto_249952 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_249952 )
      ( !STACK ?auto_249952 ?auto_249951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249966 - BLOCK
      ?auto_249967 - BLOCK
      ?auto_249968 - BLOCK
      ?auto_249969 - BLOCK
      ?auto_249970 - BLOCK
      ?auto_249971 - BLOCK
      ?auto_249972 - BLOCK
      ?auto_249973 - BLOCK
      ?auto_249974 - BLOCK
      ?auto_249975 - BLOCK
      ?auto_249976 - BLOCK
      ?auto_249977 - BLOCK
      ?auto_249978 - BLOCK
    )
    :vars
    (
      ?auto_249979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249978 ?auto_249979 ) ( ON-TABLE ?auto_249966 ) ( ON ?auto_249967 ?auto_249966 ) ( ON ?auto_249968 ?auto_249967 ) ( ON ?auto_249969 ?auto_249968 ) ( ON ?auto_249970 ?auto_249969 ) ( ON ?auto_249971 ?auto_249970 ) ( ON ?auto_249972 ?auto_249971 ) ( ON ?auto_249973 ?auto_249972 ) ( ON ?auto_249974 ?auto_249973 ) ( ON ?auto_249975 ?auto_249974 ) ( ON ?auto_249976 ?auto_249975 ) ( not ( = ?auto_249966 ?auto_249967 ) ) ( not ( = ?auto_249966 ?auto_249968 ) ) ( not ( = ?auto_249966 ?auto_249969 ) ) ( not ( = ?auto_249966 ?auto_249970 ) ) ( not ( = ?auto_249966 ?auto_249971 ) ) ( not ( = ?auto_249966 ?auto_249972 ) ) ( not ( = ?auto_249966 ?auto_249973 ) ) ( not ( = ?auto_249966 ?auto_249974 ) ) ( not ( = ?auto_249966 ?auto_249975 ) ) ( not ( = ?auto_249966 ?auto_249976 ) ) ( not ( = ?auto_249966 ?auto_249977 ) ) ( not ( = ?auto_249966 ?auto_249978 ) ) ( not ( = ?auto_249966 ?auto_249979 ) ) ( not ( = ?auto_249967 ?auto_249968 ) ) ( not ( = ?auto_249967 ?auto_249969 ) ) ( not ( = ?auto_249967 ?auto_249970 ) ) ( not ( = ?auto_249967 ?auto_249971 ) ) ( not ( = ?auto_249967 ?auto_249972 ) ) ( not ( = ?auto_249967 ?auto_249973 ) ) ( not ( = ?auto_249967 ?auto_249974 ) ) ( not ( = ?auto_249967 ?auto_249975 ) ) ( not ( = ?auto_249967 ?auto_249976 ) ) ( not ( = ?auto_249967 ?auto_249977 ) ) ( not ( = ?auto_249967 ?auto_249978 ) ) ( not ( = ?auto_249967 ?auto_249979 ) ) ( not ( = ?auto_249968 ?auto_249969 ) ) ( not ( = ?auto_249968 ?auto_249970 ) ) ( not ( = ?auto_249968 ?auto_249971 ) ) ( not ( = ?auto_249968 ?auto_249972 ) ) ( not ( = ?auto_249968 ?auto_249973 ) ) ( not ( = ?auto_249968 ?auto_249974 ) ) ( not ( = ?auto_249968 ?auto_249975 ) ) ( not ( = ?auto_249968 ?auto_249976 ) ) ( not ( = ?auto_249968 ?auto_249977 ) ) ( not ( = ?auto_249968 ?auto_249978 ) ) ( not ( = ?auto_249968 ?auto_249979 ) ) ( not ( = ?auto_249969 ?auto_249970 ) ) ( not ( = ?auto_249969 ?auto_249971 ) ) ( not ( = ?auto_249969 ?auto_249972 ) ) ( not ( = ?auto_249969 ?auto_249973 ) ) ( not ( = ?auto_249969 ?auto_249974 ) ) ( not ( = ?auto_249969 ?auto_249975 ) ) ( not ( = ?auto_249969 ?auto_249976 ) ) ( not ( = ?auto_249969 ?auto_249977 ) ) ( not ( = ?auto_249969 ?auto_249978 ) ) ( not ( = ?auto_249969 ?auto_249979 ) ) ( not ( = ?auto_249970 ?auto_249971 ) ) ( not ( = ?auto_249970 ?auto_249972 ) ) ( not ( = ?auto_249970 ?auto_249973 ) ) ( not ( = ?auto_249970 ?auto_249974 ) ) ( not ( = ?auto_249970 ?auto_249975 ) ) ( not ( = ?auto_249970 ?auto_249976 ) ) ( not ( = ?auto_249970 ?auto_249977 ) ) ( not ( = ?auto_249970 ?auto_249978 ) ) ( not ( = ?auto_249970 ?auto_249979 ) ) ( not ( = ?auto_249971 ?auto_249972 ) ) ( not ( = ?auto_249971 ?auto_249973 ) ) ( not ( = ?auto_249971 ?auto_249974 ) ) ( not ( = ?auto_249971 ?auto_249975 ) ) ( not ( = ?auto_249971 ?auto_249976 ) ) ( not ( = ?auto_249971 ?auto_249977 ) ) ( not ( = ?auto_249971 ?auto_249978 ) ) ( not ( = ?auto_249971 ?auto_249979 ) ) ( not ( = ?auto_249972 ?auto_249973 ) ) ( not ( = ?auto_249972 ?auto_249974 ) ) ( not ( = ?auto_249972 ?auto_249975 ) ) ( not ( = ?auto_249972 ?auto_249976 ) ) ( not ( = ?auto_249972 ?auto_249977 ) ) ( not ( = ?auto_249972 ?auto_249978 ) ) ( not ( = ?auto_249972 ?auto_249979 ) ) ( not ( = ?auto_249973 ?auto_249974 ) ) ( not ( = ?auto_249973 ?auto_249975 ) ) ( not ( = ?auto_249973 ?auto_249976 ) ) ( not ( = ?auto_249973 ?auto_249977 ) ) ( not ( = ?auto_249973 ?auto_249978 ) ) ( not ( = ?auto_249973 ?auto_249979 ) ) ( not ( = ?auto_249974 ?auto_249975 ) ) ( not ( = ?auto_249974 ?auto_249976 ) ) ( not ( = ?auto_249974 ?auto_249977 ) ) ( not ( = ?auto_249974 ?auto_249978 ) ) ( not ( = ?auto_249974 ?auto_249979 ) ) ( not ( = ?auto_249975 ?auto_249976 ) ) ( not ( = ?auto_249975 ?auto_249977 ) ) ( not ( = ?auto_249975 ?auto_249978 ) ) ( not ( = ?auto_249975 ?auto_249979 ) ) ( not ( = ?auto_249976 ?auto_249977 ) ) ( not ( = ?auto_249976 ?auto_249978 ) ) ( not ( = ?auto_249976 ?auto_249979 ) ) ( not ( = ?auto_249977 ?auto_249978 ) ) ( not ( = ?auto_249977 ?auto_249979 ) ) ( not ( = ?auto_249978 ?auto_249979 ) ) ( CLEAR ?auto_249976 ) ( ON ?auto_249977 ?auto_249978 ) ( CLEAR ?auto_249977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_249966 ?auto_249967 ?auto_249968 ?auto_249969 ?auto_249970 ?auto_249971 ?auto_249972 ?auto_249973 ?auto_249974 ?auto_249975 ?auto_249976 ?auto_249977 )
      ( MAKE-13PILE ?auto_249966 ?auto_249967 ?auto_249968 ?auto_249969 ?auto_249970 ?auto_249971 ?auto_249972 ?auto_249973 ?auto_249974 ?auto_249975 ?auto_249976 ?auto_249977 ?auto_249978 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249993 - BLOCK
      ?auto_249994 - BLOCK
      ?auto_249995 - BLOCK
      ?auto_249996 - BLOCK
      ?auto_249997 - BLOCK
      ?auto_249998 - BLOCK
      ?auto_249999 - BLOCK
      ?auto_250000 - BLOCK
      ?auto_250001 - BLOCK
      ?auto_250002 - BLOCK
      ?auto_250003 - BLOCK
      ?auto_250004 - BLOCK
      ?auto_250005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250005 ) ( ON-TABLE ?auto_249993 ) ( ON ?auto_249994 ?auto_249993 ) ( ON ?auto_249995 ?auto_249994 ) ( ON ?auto_249996 ?auto_249995 ) ( ON ?auto_249997 ?auto_249996 ) ( ON ?auto_249998 ?auto_249997 ) ( ON ?auto_249999 ?auto_249998 ) ( ON ?auto_250000 ?auto_249999 ) ( ON ?auto_250001 ?auto_250000 ) ( ON ?auto_250002 ?auto_250001 ) ( ON ?auto_250003 ?auto_250002 ) ( not ( = ?auto_249993 ?auto_249994 ) ) ( not ( = ?auto_249993 ?auto_249995 ) ) ( not ( = ?auto_249993 ?auto_249996 ) ) ( not ( = ?auto_249993 ?auto_249997 ) ) ( not ( = ?auto_249993 ?auto_249998 ) ) ( not ( = ?auto_249993 ?auto_249999 ) ) ( not ( = ?auto_249993 ?auto_250000 ) ) ( not ( = ?auto_249993 ?auto_250001 ) ) ( not ( = ?auto_249993 ?auto_250002 ) ) ( not ( = ?auto_249993 ?auto_250003 ) ) ( not ( = ?auto_249993 ?auto_250004 ) ) ( not ( = ?auto_249993 ?auto_250005 ) ) ( not ( = ?auto_249994 ?auto_249995 ) ) ( not ( = ?auto_249994 ?auto_249996 ) ) ( not ( = ?auto_249994 ?auto_249997 ) ) ( not ( = ?auto_249994 ?auto_249998 ) ) ( not ( = ?auto_249994 ?auto_249999 ) ) ( not ( = ?auto_249994 ?auto_250000 ) ) ( not ( = ?auto_249994 ?auto_250001 ) ) ( not ( = ?auto_249994 ?auto_250002 ) ) ( not ( = ?auto_249994 ?auto_250003 ) ) ( not ( = ?auto_249994 ?auto_250004 ) ) ( not ( = ?auto_249994 ?auto_250005 ) ) ( not ( = ?auto_249995 ?auto_249996 ) ) ( not ( = ?auto_249995 ?auto_249997 ) ) ( not ( = ?auto_249995 ?auto_249998 ) ) ( not ( = ?auto_249995 ?auto_249999 ) ) ( not ( = ?auto_249995 ?auto_250000 ) ) ( not ( = ?auto_249995 ?auto_250001 ) ) ( not ( = ?auto_249995 ?auto_250002 ) ) ( not ( = ?auto_249995 ?auto_250003 ) ) ( not ( = ?auto_249995 ?auto_250004 ) ) ( not ( = ?auto_249995 ?auto_250005 ) ) ( not ( = ?auto_249996 ?auto_249997 ) ) ( not ( = ?auto_249996 ?auto_249998 ) ) ( not ( = ?auto_249996 ?auto_249999 ) ) ( not ( = ?auto_249996 ?auto_250000 ) ) ( not ( = ?auto_249996 ?auto_250001 ) ) ( not ( = ?auto_249996 ?auto_250002 ) ) ( not ( = ?auto_249996 ?auto_250003 ) ) ( not ( = ?auto_249996 ?auto_250004 ) ) ( not ( = ?auto_249996 ?auto_250005 ) ) ( not ( = ?auto_249997 ?auto_249998 ) ) ( not ( = ?auto_249997 ?auto_249999 ) ) ( not ( = ?auto_249997 ?auto_250000 ) ) ( not ( = ?auto_249997 ?auto_250001 ) ) ( not ( = ?auto_249997 ?auto_250002 ) ) ( not ( = ?auto_249997 ?auto_250003 ) ) ( not ( = ?auto_249997 ?auto_250004 ) ) ( not ( = ?auto_249997 ?auto_250005 ) ) ( not ( = ?auto_249998 ?auto_249999 ) ) ( not ( = ?auto_249998 ?auto_250000 ) ) ( not ( = ?auto_249998 ?auto_250001 ) ) ( not ( = ?auto_249998 ?auto_250002 ) ) ( not ( = ?auto_249998 ?auto_250003 ) ) ( not ( = ?auto_249998 ?auto_250004 ) ) ( not ( = ?auto_249998 ?auto_250005 ) ) ( not ( = ?auto_249999 ?auto_250000 ) ) ( not ( = ?auto_249999 ?auto_250001 ) ) ( not ( = ?auto_249999 ?auto_250002 ) ) ( not ( = ?auto_249999 ?auto_250003 ) ) ( not ( = ?auto_249999 ?auto_250004 ) ) ( not ( = ?auto_249999 ?auto_250005 ) ) ( not ( = ?auto_250000 ?auto_250001 ) ) ( not ( = ?auto_250000 ?auto_250002 ) ) ( not ( = ?auto_250000 ?auto_250003 ) ) ( not ( = ?auto_250000 ?auto_250004 ) ) ( not ( = ?auto_250000 ?auto_250005 ) ) ( not ( = ?auto_250001 ?auto_250002 ) ) ( not ( = ?auto_250001 ?auto_250003 ) ) ( not ( = ?auto_250001 ?auto_250004 ) ) ( not ( = ?auto_250001 ?auto_250005 ) ) ( not ( = ?auto_250002 ?auto_250003 ) ) ( not ( = ?auto_250002 ?auto_250004 ) ) ( not ( = ?auto_250002 ?auto_250005 ) ) ( not ( = ?auto_250003 ?auto_250004 ) ) ( not ( = ?auto_250003 ?auto_250005 ) ) ( not ( = ?auto_250004 ?auto_250005 ) ) ( CLEAR ?auto_250003 ) ( ON ?auto_250004 ?auto_250005 ) ( CLEAR ?auto_250004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_249993 ?auto_249994 ?auto_249995 ?auto_249996 ?auto_249997 ?auto_249998 ?auto_249999 ?auto_250000 ?auto_250001 ?auto_250002 ?auto_250003 ?auto_250004 )
      ( MAKE-13PILE ?auto_249993 ?auto_249994 ?auto_249995 ?auto_249996 ?auto_249997 ?auto_249998 ?auto_249999 ?auto_250000 ?auto_250001 ?auto_250002 ?auto_250003 ?auto_250004 ?auto_250005 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250019 - BLOCK
      ?auto_250020 - BLOCK
      ?auto_250021 - BLOCK
      ?auto_250022 - BLOCK
      ?auto_250023 - BLOCK
      ?auto_250024 - BLOCK
      ?auto_250025 - BLOCK
      ?auto_250026 - BLOCK
      ?auto_250027 - BLOCK
      ?auto_250028 - BLOCK
      ?auto_250029 - BLOCK
      ?auto_250030 - BLOCK
      ?auto_250031 - BLOCK
    )
    :vars
    (
      ?auto_250032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250031 ?auto_250032 ) ( ON-TABLE ?auto_250019 ) ( ON ?auto_250020 ?auto_250019 ) ( ON ?auto_250021 ?auto_250020 ) ( ON ?auto_250022 ?auto_250021 ) ( ON ?auto_250023 ?auto_250022 ) ( ON ?auto_250024 ?auto_250023 ) ( ON ?auto_250025 ?auto_250024 ) ( ON ?auto_250026 ?auto_250025 ) ( ON ?auto_250027 ?auto_250026 ) ( ON ?auto_250028 ?auto_250027 ) ( not ( = ?auto_250019 ?auto_250020 ) ) ( not ( = ?auto_250019 ?auto_250021 ) ) ( not ( = ?auto_250019 ?auto_250022 ) ) ( not ( = ?auto_250019 ?auto_250023 ) ) ( not ( = ?auto_250019 ?auto_250024 ) ) ( not ( = ?auto_250019 ?auto_250025 ) ) ( not ( = ?auto_250019 ?auto_250026 ) ) ( not ( = ?auto_250019 ?auto_250027 ) ) ( not ( = ?auto_250019 ?auto_250028 ) ) ( not ( = ?auto_250019 ?auto_250029 ) ) ( not ( = ?auto_250019 ?auto_250030 ) ) ( not ( = ?auto_250019 ?auto_250031 ) ) ( not ( = ?auto_250019 ?auto_250032 ) ) ( not ( = ?auto_250020 ?auto_250021 ) ) ( not ( = ?auto_250020 ?auto_250022 ) ) ( not ( = ?auto_250020 ?auto_250023 ) ) ( not ( = ?auto_250020 ?auto_250024 ) ) ( not ( = ?auto_250020 ?auto_250025 ) ) ( not ( = ?auto_250020 ?auto_250026 ) ) ( not ( = ?auto_250020 ?auto_250027 ) ) ( not ( = ?auto_250020 ?auto_250028 ) ) ( not ( = ?auto_250020 ?auto_250029 ) ) ( not ( = ?auto_250020 ?auto_250030 ) ) ( not ( = ?auto_250020 ?auto_250031 ) ) ( not ( = ?auto_250020 ?auto_250032 ) ) ( not ( = ?auto_250021 ?auto_250022 ) ) ( not ( = ?auto_250021 ?auto_250023 ) ) ( not ( = ?auto_250021 ?auto_250024 ) ) ( not ( = ?auto_250021 ?auto_250025 ) ) ( not ( = ?auto_250021 ?auto_250026 ) ) ( not ( = ?auto_250021 ?auto_250027 ) ) ( not ( = ?auto_250021 ?auto_250028 ) ) ( not ( = ?auto_250021 ?auto_250029 ) ) ( not ( = ?auto_250021 ?auto_250030 ) ) ( not ( = ?auto_250021 ?auto_250031 ) ) ( not ( = ?auto_250021 ?auto_250032 ) ) ( not ( = ?auto_250022 ?auto_250023 ) ) ( not ( = ?auto_250022 ?auto_250024 ) ) ( not ( = ?auto_250022 ?auto_250025 ) ) ( not ( = ?auto_250022 ?auto_250026 ) ) ( not ( = ?auto_250022 ?auto_250027 ) ) ( not ( = ?auto_250022 ?auto_250028 ) ) ( not ( = ?auto_250022 ?auto_250029 ) ) ( not ( = ?auto_250022 ?auto_250030 ) ) ( not ( = ?auto_250022 ?auto_250031 ) ) ( not ( = ?auto_250022 ?auto_250032 ) ) ( not ( = ?auto_250023 ?auto_250024 ) ) ( not ( = ?auto_250023 ?auto_250025 ) ) ( not ( = ?auto_250023 ?auto_250026 ) ) ( not ( = ?auto_250023 ?auto_250027 ) ) ( not ( = ?auto_250023 ?auto_250028 ) ) ( not ( = ?auto_250023 ?auto_250029 ) ) ( not ( = ?auto_250023 ?auto_250030 ) ) ( not ( = ?auto_250023 ?auto_250031 ) ) ( not ( = ?auto_250023 ?auto_250032 ) ) ( not ( = ?auto_250024 ?auto_250025 ) ) ( not ( = ?auto_250024 ?auto_250026 ) ) ( not ( = ?auto_250024 ?auto_250027 ) ) ( not ( = ?auto_250024 ?auto_250028 ) ) ( not ( = ?auto_250024 ?auto_250029 ) ) ( not ( = ?auto_250024 ?auto_250030 ) ) ( not ( = ?auto_250024 ?auto_250031 ) ) ( not ( = ?auto_250024 ?auto_250032 ) ) ( not ( = ?auto_250025 ?auto_250026 ) ) ( not ( = ?auto_250025 ?auto_250027 ) ) ( not ( = ?auto_250025 ?auto_250028 ) ) ( not ( = ?auto_250025 ?auto_250029 ) ) ( not ( = ?auto_250025 ?auto_250030 ) ) ( not ( = ?auto_250025 ?auto_250031 ) ) ( not ( = ?auto_250025 ?auto_250032 ) ) ( not ( = ?auto_250026 ?auto_250027 ) ) ( not ( = ?auto_250026 ?auto_250028 ) ) ( not ( = ?auto_250026 ?auto_250029 ) ) ( not ( = ?auto_250026 ?auto_250030 ) ) ( not ( = ?auto_250026 ?auto_250031 ) ) ( not ( = ?auto_250026 ?auto_250032 ) ) ( not ( = ?auto_250027 ?auto_250028 ) ) ( not ( = ?auto_250027 ?auto_250029 ) ) ( not ( = ?auto_250027 ?auto_250030 ) ) ( not ( = ?auto_250027 ?auto_250031 ) ) ( not ( = ?auto_250027 ?auto_250032 ) ) ( not ( = ?auto_250028 ?auto_250029 ) ) ( not ( = ?auto_250028 ?auto_250030 ) ) ( not ( = ?auto_250028 ?auto_250031 ) ) ( not ( = ?auto_250028 ?auto_250032 ) ) ( not ( = ?auto_250029 ?auto_250030 ) ) ( not ( = ?auto_250029 ?auto_250031 ) ) ( not ( = ?auto_250029 ?auto_250032 ) ) ( not ( = ?auto_250030 ?auto_250031 ) ) ( not ( = ?auto_250030 ?auto_250032 ) ) ( not ( = ?auto_250031 ?auto_250032 ) ) ( ON ?auto_250030 ?auto_250031 ) ( CLEAR ?auto_250028 ) ( ON ?auto_250029 ?auto_250030 ) ( CLEAR ?auto_250029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_250019 ?auto_250020 ?auto_250021 ?auto_250022 ?auto_250023 ?auto_250024 ?auto_250025 ?auto_250026 ?auto_250027 ?auto_250028 ?auto_250029 )
      ( MAKE-13PILE ?auto_250019 ?auto_250020 ?auto_250021 ?auto_250022 ?auto_250023 ?auto_250024 ?auto_250025 ?auto_250026 ?auto_250027 ?auto_250028 ?auto_250029 ?auto_250030 ?auto_250031 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250046 - BLOCK
      ?auto_250047 - BLOCK
      ?auto_250048 - BLOCK
      ?auto_250049 - BLOCK
      ?auto_250050 - BLOCK
      ?auto_250051 - BLOCK
      ?auto_250052 - BLOCK
      ?auto_250053 - BLOCK
      ?auto_250054 - BLOCK
      ?auto_250055 - BLOCK
      ?auto_250056 - BLOCK
      ?auto_250057 - BLOCK
      ?auto_250058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250058 ) ( ON-TABLE ?auto_250046 ) ( ON ?auto_250047 ?auto_250046 ) ( ON ?auto_250048 ?auto_250047 ) ( ON ?auto_250049 ?auto_250048 ) ( ON ?auto_250050 ?auto_250049 ) ( ON ?auto_250051 ?auto_250050 ) ( ON ?auto_250052 ?auto_250051 ) ( ON ?auto_250053 ?auto_250052 ) ( ON ?auto_250054 ?auto_250053 ) ( ON ?auto_250055 ?auto_250054 ) ( not ( = ?auto_250046 ?auto_250047 ) ) ( not ( = ?auto_250046 ?auto_250048 ) ) ( not ( = ?auto_250046 ?auto_250049 ) ) ( not ( = ?auto_250046 ?auto_250050 ) ) ( not ( = ?auto_250046 ?auto_250051 ) ) ( not ( = ?auto_250046 ?auto_250052 ) ) ( not ( = ?auto_250046 ?auto_250053 ) ) ( not ( = ?auto_250046 ?auto_250054 ) ) ( not ( = ?auto_250046 ?auto_250055 ) ) ( not ( = ?auto_250046 ?auto_250056 ) ) ( not ( = ?auto_250046 ?auto_250057 ) ) ( not ( = ?auto_250046 ?auto_250058 ) ) ( not ( = ?auto_250047 ?auto_250048 ) ) ( not ( = ?auto_250047 ?auto_250049 ) ) ( not ( = ?auto_250047 ?auto_250050 ) ) ( not ( = ?auto_250047 ?auto_250051 ) ) ( not ( = ?auto_250047 ?auto_250052 ) ) ( not ( = ?auto_250047 ?auto_250053 ) ) ( not ( = ?auto_250047 ?auto_250054 ) ) ( not ( = ?auto_250047 ?auto_250055 ) ) ( not ( = ?auto_250047 ?auto_250056 ) ) ( not ( = ?auto_250047 ?auto_250057 ) ) ( not ( = ?auto_250047 ?auto_250058 ) ) ( not ( = ?auto_250048 ?auto_250049 ) ) ( not ( = ?auto_250048 ?auto_250050 ) ) ( not ( = ?auto_250048 ?auto_250051 ) ) ( not ( = ?auto_250048 ?auto_250052 ) ) ( not ( = ?auto_250048 ?auto_250053 ) ) ( not ( = ?auto_250048 ?auto_250054 ) ) ( not ( = ?auto_250048 ?auto_250055 ) ) ( not ( = ?auto_250048 ?auto_250056 ) ) ( not ( = ?auto_250048 ?auto_250057 ) ) ( not ( = ?auto_250048 ?auto_250058 ) ) ( not ( = ?auto_250049 ?auto_250050 ) ) ( not ( = ?auto_250049 ?auto_250051 ) ) ( not ( = ?auto_250049 ?auto_250052 ) ) ( not ( = ?auto_250049 ?auto_250053 ) ) ( not ( = ?auto_250049 ?auto_250054 ) ) ( not ( = ?auto_250049 ?auto_250055 ) ) ( not ( = ?auto_250049 ?auto_250056 ) ) ( not ( = ?auto_250049 ?auto_250057 ) ) ( not ( = ?auto_250049 ?auto_250058 ) ) ( not ( = ?auto_250050 ?auto_250051 ) ) ( not ( = ?auto_250050 ?auto_250052 ) ) ( not ( = ?auto_250050 ?auto_250053 ) ) ( not ( = ?auto_250050 ?auto_250054 ) ) ( not ( = ?auto_250050 ?auto_250055 ) ) ( not ( = ?auto_250050 ?auto_250056 ) ) ( not ( = ?auto_250050 ?auto_250057 ) ) ( not ( = ?auto_250050 ?auto_250058 ) ) ( not ( = ?auto_250051 ?auto_250052 ) ) ( not ( = ?auto_250051 ?auto_250053 ) ) ( not ( = ?auto_250051 ?auto_250054 ) ) ( not ( = ?auto_250051 ?auto_250055 ) ) ( not ( = ?auto_250051 ?auto_250056 ) ) ( not ( = ?auto_250051 ?auto_250057 ) ) ( not ( = ?auto_250051 ?auto_250058 ) ) ( not ( = ?auto_250052 ?auto_250053 ) ) ( not ( = ?auto_250052 ?auto_250054 ) ) ( not ( = ?auto_250052 ?auto_250055 ) ) ( not ( = ?auto_250052 ?auto_250056 ) ) ( not ( = ?auto_250052 ?auto_250057 ) ) ( not ( = ?auto_250052 ?auto_250058 ) ) ( not ( = ?auto_250053 ?auto_250054 ) ) ( not ( = ?auto_250053 ?auto_250055 ) ) ( not ( = ?auto_250053 ?auto_250056 ) ) ( not ( = ?auto_250053 ?auto_250057 ) ) ( not ( = ?auto_250053 ?auto_250058 ) ) ( not ( = ?auto_250054 ?auto_250055 ) ) ( not ( = ?auto_250054 ?auto_250056 ) ) ( not ( = ?auto_250054 ?auto_250057 ) ) ( not ( = ?auto_250054 ?auto_250058 ) ) ( not ( = ?auto_250055 ?auto_250056 ) ) ( not ( = ?auto_250055 ?auto_250057 ) ) ( not ( = ?auto_250055 ?auto_250058 ) ) ( not ( = ?auto_250056 ?auto_250057 ) ) ( not ( = ?auto_250056 ?auto_250058 ) ) ( not ( = ?auto_250057 ?auto_250058 ) ) ( ON ?auto_250057 ?auto_250058 ) ( CLEAR ?auto_250055 ) ( ON ?auto_250056 ?auto_250057 ) ( CLEAR ?auto_250056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_250046 ?auto_250047 ?auto_250048 ?auto_250049 ?auto_250050 ?auto_250051 ?auto_250052 ?auto_250053 ?auto_250054 ?auto_250055 ?auto_250056 )
      ( MAKE-13PILE ?auto_250046 ?auto_250047 ?auto_250048 ?auto_250049 ?auto_250050 ?auto_250051 ?auto_250052 ?auto_250053 ?auto_250054 ?auto_250055 ?auto_250056 ?auto_250057 ?auto_250058 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250072 - BLOCK
      ?auto_250073 - BLOCK
      ?auto_250074 - BLOCK
      ?auto_250075 - BLOCK
      ?auto_250076 - BLOCK
      ?auto_250077 - BLOCK
      ?auto_250078 - BLOCK
      ?auto_250079 - BLOCK
      ?auto_250080 - BLOCK
      ?auto_250081 - BLOCK
      ?auto_250082 - BLOCK
      ?auto_250083 - BLOCK
      ?auto_250084 - BLOCK
    )
    :vars
    (
      ?auto_250085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250084 ?auto_250085 ) ( ON-TABLE ?auto_250072 ) ( ON ?auto_250073 ?auto_250072 ) ( ON ?auto_250074 ?auto_250073 ) ( ON ?auto_250075 ?auto_250074 ) ( ON ?auto_250076 ?auto_250075 ) ( ON ?auto_250077 ?auto_250076 ) ( ON ?auto_250078 ?auto_250077 ) ( ON ?auto_250079 ?auto_250078 ) ( ON ?auto_250080 ?auto_250079 ) ( not ( = ?auto_250072 ?auto_250073 ) ) ( not ( = ?auto_250072 ?auto_250074 ) ) ( not ( = ?auto_250072 ?auto_250075 ) ) ( not ( = ?auto_250072 ?auto_250076 ) ) ( not ( = ?auto_250072 ?auto_250077 ) ) ( not ( = ?auto_250072 ?auto_250078 ) ) ( not ( = ?auto_250072 ?auto_250079 ) ) ( not ( = ?auto_250072 ?auto_250080 ) ) ( not ( = ?auto_250072 ?auto_250081 ) ) ( not ( = ?auto_250072 ?auto_250082 ) ) ( not ( = ?auto_250072 ?auto_250083 ) ) ( not ( = ?auto_250072 ?auto_250084 ) ) ( not ( = ?auto_250072 ?auto_250085 ) ) ( not ( = ?auto_250073 ?auto_250074 ) ) ( not ( = ?auto_250073 ?auto_250075 ) ) ( not ( = ?auto_250073 ?auto_250076 ) ) ( not ( = ?auto_250073 ?auto_250077 ) ) ( not ( = ?auto_250073 ?auto_250078 ) ) ( not ( = ?auto_250073 ?auto_250079 ) ) ( not ( = ?auto_250073 ?auto_250080 ) ) ( not ( = ?auto_250073 ?auto_250081 ) ) ( not ( = ?auto_250073 ?auto_250082 ) ) ( not ( = ?auto_250073 ?auto_250083 ) ) ( not ( = ?auto_250073 ?auto_250084 ) ) ( not ( = ?auto_250073 ?auto_250085 ) ) ( not ( = ?auto_250074 ?auto_250075 ) ) ( not ( = ?auto_250074 ?auto_250076 ) ) ( not ( = ?auto_250074 ?auto_250077 ) ) ( not ( = ?auto_250074 ?auto_250078 ) ) ( not ( = ?auto_250074 ?auto_250079 ) ) ( not ( = ?auto_250074 ?auto_250080 ) ) ( not ( = ?auto_250074 ?auto_250081 ) ) ( not ( = ?auto_250074 ?auto_250082 ) ) ( not ( = ?auto_250074 ?auto_250083 ) ) ( not ( = ?auto_250074 ?auto_250084 ) ) ( not ( = ?auto_250074 ?auto_250085 ) ) ( not ( = ?auto_250075 ?auto_250076 ) ) ( not ( = ?auto_250075 ?auto_250077 ) ) ( not ( = ?auto_250075 ?auto_250078 ) ) ( not ( = ?auto_250075 ?auto_250079 ) ) ( not ( = ?auto_250075 ?auto_250080 ) ) ( not ( = ?auto_250075 ?auto_250081 ) ) ( not ( = ?auto_250075 ?auto_250082 ) ) ( not ( = ?auto_250075 ?auto_250083 ) ) ( not ( = ?auto_250075 ?auto_250084 ) ) ( not ( = ?auto_250075 ?auto_250085 ) ) ( not ( = ?auto_250076 ?auto_250077 ) ) ( not ( = ?auto_250076 ?auto_250078 ) ) ( not ( = ?auto_250076 ?auto_250079 ) ) ( not ( = ?auto_250076 ?auto_250080 ) ) ( not ( = ?auto_250076 ?auto_250081 ) ) ( not ( = ?auto_250076 ?auto_250082 ) ) ( not ( = ?auto_250076 ?auto_250083 ) ) ( not ( = ?auto_250076 ?auto_250084 ) ) ( not ( = ?auto_250076 ?auto_250085 ) ) ( not ( = ?auto_250077 ?auto_250078 ) ) ( not ( = ?auto_250077 ?auto_250079 ) ) ( not ( = ?auto_250077 ?auto_250080 ) ) ( not ( = ?auto_250077 ?auto_250081 ) ) ( not ( = ?auto_250077 ?auto_250082 ) ) ( not ( = ?auto_250077 ?auto_250083 ) ) ( not ( = ?auto_250077 ?auto_250084 ) ) ( not ( = ?auto_250077 ?auto_250085 ) ) ( not ( = ?auto_250078 ?auto_250079 ) ) ( not ( = ?auto_250078 ?auto_250080 ) ) ( not ( = ?auto_250078 ?auto_250081 ) ) ( not ( = ?auto_250078 ?auto_250082 ) ) ( not ( = ?auto_250078 ?auto_250083 ) ) ( not ( = ?auto_250078 ?auto_250084 ) ) ( not ( = ?auto_250078 ?auto_250085 ) ) ( not ( = ?auto_250079 ?auto_250080 ) ) ( not ( = ?auto_250079 ?auto_250081 ) ) ( not ( = ?auto_250079 ?auto_250082 ) ) ( not ( = ?auto_250079 ?auto_250083 ) ) ( not ( = ?auto_250079 ?auto_250084 ) ) ( not ( = ?auto_250079 ?auto_250085 ) ) ( not ( = ?auto_250080 ?auto_250081 ) ) ( not ( = ?auto_250080 ?auto_250082 ) ) ( not ( = ?auto_250080 ?auto_250083 ) ) ( not ( = ?auto_250080 ?auto_250084 ) ) ( not ( = ?auto_250080 ?auto_250085 ) ) ( not ( = ?auto_250081 ?auto_250082 ) ) ( not ( = ?auto_250081 ?auto_250083 ) ) ( not ( = ?auto_250081 ?auto_250084 ) ) ( not ( = ?auto_250081 ?auto_250085 ) ) ( not ( = ?auto_250082 ?auto_250083 ) ) ( not ( = ?auto_250082 ?auto_250084 ) ) ( not ( = ?auto_250082 ?auto_250085 ) ) ( not ( = ?auto_250083 ?auto_250084 ) ) ( not ( = ?auto_250083 ?auto_250085 ) ) ( not ( = ?auto_250084 ?auto_250085 ) ) ( ON ?auto_250083 ?auto_250084 ) ( ON ?auto_250082 ?auto_250083 ) ( CLEAR ?auto_250080 ) ( ON ?auto_250081 ?auto_250082 ) ( CLEAR ?auto_250081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_250072 ?auto_250073 ?auto_250074 ?auto_250075 ?auto_250076 ?auto_250077 ?auto_250078 ?auto_250079 ?auto_250080 ?auto_250081 )
      ( MAKE-13PILE ?auto_250072 ?auto_250073 ?auto_250074 ?auto_250075 ?auto_250076 ?auto_250077 ?auto_250078 ?auto_250079 ?auto_250080 ?auto_250081 ?auto_250082 ?auto_250083 ?auto_250084 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250099 - BLOCK
      ?auto_250100 - BLOCK
      ?auto_250101 - BLOCK
      ?auto_250102 - BLOCK
      ?auto_250103 - BLOCK
      ?auto_250104 - BLOCK
      ?auto_250105 - BLOCK
      ?auto_250106 - BLOCK
      ?auto_250107 - BLOCK
      ?auto_250108 - BLOCK
      ?auto_250109 - BLOCK
      ?auto_250110 - BLOCK
      ?auto_250111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250111 ) ( ON-TABLE ?auto_250099 ) ( ON ?auto_250100 ?auto_250099 ) ( ON ?auto_250101 ?auto_250100 ) ( ON ?auto_250102 ?auto_250101 ) ( ON ?auto_250103 ?auto_250102 ) ( ON ?auto_250104 ?auto_250103 ) ( ON ?auto_250105 ?auto_250104 ) ( ON ?auto_250106 ?auto_250105 ) ( ON ?auto_250107 ?auto_250106 ) ( not ( = ?auto_250099 ?auto_250100 ) ) ( not ( = ?auto_250099 ?auto_250101 ) ) ( not ( = ?auto_250099 ?auto_250102 ) ) ( not ( = ?auto_250099 ?auto_250103 ) ) ( not ( = ?auto_250099 ?auto_250104 ) ) ( not ( = ?auto_250099 ?auto_250105 ) ) ( not ( = ?auto_250099 ?auto_250106 ) ) ( not ( = ?auto_250099 ?auto_250107 ) ) ( not ( = ?auto_250099 ?auto_250108 ) ) ( not ( = ?auto_250099 ?auto_250109 ) ) ( not ( = ?auto_250099 ?auto_250110 ) ) ( not ( = ?auto_250099 ?auto_250111 ) ) ( not ( = ?auto_250100 ?auto_250101 ) ) ( not ( = ?auto_250100 ?auto_250102 ) ) ( not ( = ?auto_250100 ?auto_250103 ) ) ( not ( = ?auto_250100 ?auto_250104 ) ) ( not ( = ?auto_250100 ?auto_250105 ) ) ( not ( = ?auto_250100 ?auto_250106 ) ) ( not ( = ?auto_250100 ?auto_250107 ) ) ( not ( = ?auto_250100 ?auto_250108 ) ) ( not ( = ?auto_250100 ?auto_250109 ) ) ( not ( = ?auto_250100 ?auto_250110 ) ) ( not ( = ?auto_250100 ?auto_250111 ) ) ( not ( = ?auto_250101 ?auto_250102 ) ) ( not ( = ?auto_250101 ?auto_250103 ) ) ( not ( = ?auto_250101 ?auto_250104 ) ) ( not ( = ?auto_250101 ?auto_250105 ) ) ( not ( = ?auto_250101 ?auto_250106 ) ) ( not ( = ?auto_250101 ?auto_250107 ) ) ( not ( = ?auto_250101 ?auto_250108 ) ) ( not ( = ?auto_250101 ?auto_250109 ) ) ( not ( = ?auto_250101 ?auto_250110 ) ) ( not ( = ?auto_250101 ?auto_250111 ) ) ( not ( = ?auto_250102 ?auto_250103 ) ) ( not ( = ?auto_250102 ?auto_250104 ) ) ( not ( = ?auto_250102 ?auto_250105 ) ) ( not ( = ?auto_250102 ?auto_250106 ) ) ( not ( = ?auto_250102 ?auto_250107 ) ) ( not ( = ?auto_250102 ?auto_250108 ) ) ( not ( = ?auto_250102 ?auto_250109 ) ) ( not ( = ?auto_250102 ?auto_250110 ) ) ( not ( = ?auto_250102 ?auto_250111 ) ) ( not ( = ?auto_250103 ?auto_250104 ) ) ( not ( = ?auto_250103 ?auto_250105 ) ) ( not ( = ?auto_250103 ?auto_250106 ) ) ( not ( = ?auto_250103 ?auto_250107 ) ) ( not ( = ?auto_250103 ?auto_250108 ) ) ( not ( = ?auto_250103 ?auto_250109 ) ) ( not ( = ?auto_250103 ?auto_250110 ) ) ( not ( = ?auto_250103 ?auto_250111 ) ) ( not ( = ?auto_250104 ?auto_250105 ) ) ( not ( = ?auto_250104 ?auto_250106 ) ) ( not ( = ?auto_250104 ?auto_250107 ) ) ( not ( = ?auto_250104 ?auto_250108 ) ) ( not ( = ?auto_250104 ?auto_250109 ) ) ( not ( = ?auto_250104 ?auto_250110 ) ) ( not ( = ?auto_250104 ?auto_250111 ) ) ( not ( = ?auto_250105 ?auto_250106 ) ) ( not ( = ?auto_250105 ?auto_250107 ) ) ( not ( = ?auto_250105 ?auto_250108 ) ) ( not ( = ?auto_250105 ?auto_250109 ) ) ( not ( = ?auto_250105 ?auto_250110 ) ) ( not ( = ?auto_250105 ?auto_250111 ) ) ( not ( = ?auto_250106 ?auto_250107 ) ) ( not ( = ?auto_250106 ?auto_250108 ) ) ( not ( = ?auto_250106 ?auto_250109 ) ) ( not ( = ?auto_250106 ?auto_250110 ) ) ( not ( = ?auto_250106 ?auto_250111 ) ) ( not ( = ?auto_250107 ?auto_250108 ) ) ( not ( = ?auto_250107 ?auto_250109 ) ) ( not ( = ?auto_250107 ?auto_250110 ) ) ( not ( = ?auto_250107 ?auto_250111 ) ) ( not ( = ?auto_250108 ?auto_250109 ) ) ( not ( = ?auto_250108 ?auto_250110 ) ) ( not ( = ?auto_250108 ?auto_250111 ) ) ( not ( = ?auto_250109 ?auto_250110 ) ) ( not ( = ?auto_250109 ?auto_250111 ) ) ( not ( = ?auto_250110 ?auto_250111 ) ) ( ON ?auto_250110 ?auto_250111 ) ( ON ?auto_250109 ?auto_250110 ) ( CLEAR ?auto_250107 ) ( ON ?auto_250108 ?auto_250109 ) ( CLEAR ?auto_250108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_250099 ?auto_250100 ?auto_250101 ?auto_250102 ?auto_250103 ?auto_250104 ?auto_250105 ?auto_250106 ?auto_250107 ?auto_250108 )
      ( MAKE-13PILE ?auto_250099 ?auto_250100 ?auto_250101 ?auto_250102 ?auto_250103 ?auto_250104 ?auto_250105 ?auto_250106 ?auto_250107 ?auto_250108 ?auto_250109 ?auto_250110 ?auto_250111 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250125 - BLOCK
      ?auto_250126 - BLOCK
      ?auto_250127 - BLOCK
      ?auto_250128 - BLOCK
      ?auto_250129 - BLOCK
      ?auto_250130 - BLOCK
      ?auto_250131 - BLOCK
      ?auto_250132 - BLOCK
      ?auto_250133 - BLOCK
      ?auto_250134 - BLOCK
      ?auto_250135 - BLOCK
      ?auto_250136 - BLOCK
      ?auto_250137 - BLOCK
    )
    :vars
    (
      ?auto_250138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250137 ?auto_250138 ) ( ON-TABLE ?auto_250125 ) ( ON ?auto_250126 ?auto_250125 ) ( ON ?auto_250127 ?auto_250126 ) ( ON ?auto_250128 ?auto_250127 ) ( ON ?auto_250129 ?auto_250128 ) ( ON ?auto_250130 ?auto_250129 ) ( ON ?auto_250131 ?auto_250130 ) ( ON ?auto_250132 ?auto_250131 ) ( not ( = ?auto_250125 ?auto_250126 ) ) ( not ( = ?auto_250125 ?auto_250127 ) ) ( not ( = ?auto_250125 ?auto_250128 ) ) ( not ( = ?auto_250125 ?auto_250129 ) ) ( not ( = ?auto_250125 ?auto_250130 ) ) ( not ( = ?auto_250125 ?auto_250131 ) ) ( not ( = ?auto_250125 ?auto_250132 ) ) ( not ( = ?auto_250125 ?auto_250133 ) ) ( not ( = ?auto_250125 ?auto_250134 ) ) ( not ( = ?auto_250125 ?auto_250135 ) ) ( not ( = ?auto_250125 ?auto_250136 ) ) ( not ( = ?auto_250125 ?auto_250137 ) ) ( not ( = ?auto_250125 ?auto_250138 ) ) ( not ( = ?auto_250126 ?auto_250127 ) ) ( not ( = ?auto_250126 ?auto_250128 ) ) ( not ( = ?auto_250126 ?auto_250129 ) ) ( not ( = ?auto_250126 ?auto_250130 ) ) ( not ( = ?auto_250126 ?auto_250131 ) ) ( not ( = ?auto_250126 ?auto_250132 ) ) ( not ( = ?auto_250126 ?auto_250133 ) ) ( not ( = ?auto_250126 ?auto_250134 ) ) ( not ( = ?auto_250126 ?auto_250135 ) ) ( not ( = ?auto_250126 ?auto_250136 ) ) ( not ( = ?auto_250126 ?auto_250137 ) ) ( not ( = ?auto_250126 ?auto_250138 ) ) ( not ( = ?auto_250127 ?auto_250128 ) ) ( not ( = ?auto_250127 ?auto_250129 ) ) ( not ( = ?auto_250127 ?auto_250130 ) ) ( not ( = ?auto_250127 ?auto_250131 ) ) ( not ( = ?auto_250127 ?auto_250132 ) ) ( not ( = ?auto_250127 ?auto_250133 ) ) ( not ( = ?auto_250127 ?auto_250134 ) ) ( not ( = ?auto_250127 ?auto_250135 ) ) ( not ( = ?auto_250127 ?auto_250136 ) ) ( not ( = ?auto_250127 ?auto_250137 ) ) ( not ( = ?auto_250127 ?auto_250138 ) ) ( not ( = ?auto_250128 ?auto_250129 ) ) ( not ( = ?auto_250128 ?auto_250130 ) ) ( not ( = ?auto_250128 ?auto_250131 ) ) ( not ( = ?auto_250128 ?auto_250132 ) ) ( not ( = ?auto_250128 ?auto_250133 ) ) ( not ( = ?auto_250128 ?auto_250134 ) ) ( not ( = ?auto_250128 ?auto_250135 ) ) ( not ( = ?auto_250128 ?auto_250136 ) ) ( not ( = ?auto_250128 ?auto_250137 ) ) ( not ( = ?auto_250128 ?auto_250138 ) ) ( not ( = ?auto_250129 ?auto_250130 ) ) ( not ( = ?auto_250129 ?auto_250131 ) ) ( not ( = ?auto_250129 ?auto_250132 ) ) ( not ( = ?auto_250129 ?auto_250133 ) ) ( not ( = ?auto_250129 ?auto_250134 ) ) ( not ( = ?auto_250129 ?auto_250135 ) ) ( not ( = ?auto_250129 ?auto_250136 ) ) ( not ( = ?auto_250129 ?auto_250137 ) ) ( not ( = ?auto_250129 ?auto_250138 ) ) ( not ( = ?auto_250130 ?auto_250131 ) ) ( not ( = ?auto_250130 ?auto_250132 ) ) ( not ( = ?auto_250130 ?auto_250133 ) ) ( not ( = ?auto_250130 ?auto_250134 ) ) ( not ( = ?auto_250130 ?auto_250135 ) ) ( not ( = ?auto_250130 ?auto_250136 ) ) ( not ( = ?auto_250130 ?auto_250137 ) ) ( not ( = ?auto_250130 ?auto_250138 ) ) ( not ( = ?auto_250131 ?auto_250132 ) ) ( not ( = ?auto_250131 ?auto_250133 ) ) ( not ( = ?auto_250131 ?auto_250134 ) ) ( not ( = ?auto_250131 ?auto_250135 ) ) ( not ( = ?auto_250131 ?auto_250136 ) ) ( not ( = ?auto_250131 ?auto_250137 ) ) ( not ( = ?auto_250131 ?auto_250138 ) ) ( not ( = ?auto_250132 ?auto_250133 ) ) ( not ( = ?auto_250132 ?auto_250134 ) ) ( not ( = ?auto_250132 ?auto_250135 ) ) ( not ( = ?auto_250132 ?auto_250136 ) ) ( not ( = ?auto_250132 ?auto_250137 ) ) ( not ( = ?auto_250132 ?auto_250138 ) ) ( not ( = ?auto_250133 ?auto_250134 ) ) ( not ( = ?auto_250133 ?auto_250135 ) ) ( not ( = ?auto_250133 ?auto_250136 ) ) ( not ( = ?auto_250133 ?auto_250137 ) ) ( not ( = ?auto_250133 ?auto_250138 ) ) ( not ( = ?auto_250134 ?auto_250135 ) ) ( not ( = ?auto_250134 ?auto_250136 ) ) ( not ( = ?auto_250134 ?auto_250137 ) ) ( not ( = ?auto_250134 ?auto_250138 ) ) ( not ( = ?auto_250135 ?auto_250136 ) ) ( not ( = ?auto_250135 ?auto_250137 ) ) ( not ( = ?auto_250135 ?auto_250138 ) ) ( not ( = ?auto_250136 ?auto_250137 ) ) ( not ( = ?auto_250136 ?auto_250138 ) ) ( not ( = ?auto_250137 ?auto_250138 ) ) ( ON ?auto_250136 ?auto_250137 ) ( ON ?auto_250135 ?auto_250136 ) ( ON ?auto_250134 ?auto_250135 ) ( CLEAR ?auto_250132 ) ( ON ?auto_250133 ?auto_250134 ) ( CLEAR ?auto_250133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_250125 ?auto_250126 ?auto_250127 ?auto_250128 ?auto_250129 ?auto_250130 ?auto_250131 ?auto_250132 ?auto_250133 )
      ( MAKE-13PILE ?auto_250125 ?auto_250126 ?auto_250127 ?auto_250128 ?auto_250129 ?auto_250130 ?auto_250131 ?auto_250132 ?auto_250133 ?auto_250134 ?auto_250135 ?auto_250136 ?auto_250137 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250152 - BLOCK
      ?auto_250153 - BLOCK
      ?auto_250154 - BLOCK
      ?auto_250155 - BLOCK
      ?auto_250156 - BLOCK
      ?auto_250157 - BLOCK
      ?auto_250158 - BLOCK
      ?auto_250159 - BLOCK
      ?auto_250160 - BLOCK
      ?auto_250161 - BLOCK
      ?auto_250162 - BLOCK
      ?auto_250163 - BLOCK
      ?auto_250164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250164 ) ( ON-TABLE ?auto_250152 ) ( ON ?auto_250153 ?auto_250152 ) ( ON ?auto_250154 ?auto_250153 ) ( ON ?auto_250155 ?auto_250154 ) ( ON ?auto_250156 ?auto_250155 ) ( ON ?auto_250157 ?auto_250156 ) ( ON ?auto_250158 ?auto_250157 ) ( ON ?auto_250159 ?auto_250158 ) ( not ( = ?auto_250152 ?auto_250153 ) ) ( not ( = ?auto_250152 ?auto_250154 ) ) ( not ( = ?auto_250152 ?auto_250155 ) ) ( not ( = ?auto_250152 ?auto_250156 ) ) ( not ( = ?auto_250152 ?auto_250157 ) ) ( not ( = ?auto_250152 ?auto_250158 ) ) ( not ( = ?auto_250152 ?auto_250159 ) ) ( not ( = ?auto_250152 ?auto_250160 ) ) ( not ( = ?auto_250152 ?auto_250161 ) ) ( not ( = ?auto_250152 ?auto_250162 ) ) ( not ( = ?auto_250152 ?auto_250163 ) ) ( not ( = ?auto_250152 ?auto_250164 ) ) ( not ( = ?auto_250153 ?auto_250154 ) ) ( not ( = ?auto_250153 ?auto_250155 ) ) ( not ( = ?auto_250153 ?auto_250156 ) ) ( not ( = ?auto_250153 ?auto_250157 ) ) ( not ( = ?auto_250153 ?auto_250158 ) ) ( not ( = ?auto_250153 ?auto_250159 ) ) ( not ( = ?auto_250153 ?auto_250160 ) ) ( not ( = ?auto_250153 ?auto_250161 ) ) ( not ( = ?auto_250153 ?auto_250162 ) ) ( not ( = ?auto_250153 ?auto_250163 ) ) ( not ( = ?auto_250153 ?auto_250164 ) ) ( not ( = ?auto_250154 ?auto_250155 ) ) ( not ( = ?auto_250154 ?auto_250156 ) ) ( not ( = ?auto_250154 ?auto_250157 ) ) ( not ( = ?auto_250154 ?auto_250158 ) ) ( not ( = ?auto_250154 ?auto_250159 ) ) ( not ( = ?auto_250154 ?auto_250160 ) ) ( not ( = ?auto_250154 ?auto_250161 ) ) ( not ( = ?auto_250154 ?auto_250162 ) ) ( not ( = ?auto_250154 ?auto_250163 ) ) ( not ( = ?auto_250154 ?auto_250164 ) ) ( not ( = ?auto_250155 ?auto_250156 ) ) ( not ( = ?auto_250155 ?auto_250157 ) ) ( not ( = ?auto_250155 ?auto_250158 ) ) ( not ( = ?auto_250155 ?auto_250159 ) ) ( not ( = ?auto_250155 ?auto_250160 ) ) ( not ( = ?auto_250155 ?auto_250161 ) ) ( not ( = ?auto_250155 ?auto_250162 ) ) ( not ( = ?auto_250155 ?auto_250163 ) ) ( not ( = ?auto_250155 ?auto_250164 ) ) ( not ( = ?auto_250156 ?auto_250157 ) ) ( not ( = ?auto_250156 ?auto_250158 ) ) ( not ( = ?auto_250156 ?auto_250159 ) ) ( not ( = ?auto_250156 ?auto_250160 ) ) ( not ( = ?auto_250156 ?auto_250161 ) ) ( not ( = ?auto_250156 ?auto_250162 ) ) ( not ( = ?auto_250156 ?auto_250163 ) ) ( not ( = ?auto_250156 ?auto_250164 ) ) ( not ( = ?auto_250157 ?auto_250158 ) ) ( not ( = ?auto_250157 ?auto_250159 ) ) ( not ( = ?auto_250157 ?auto_250160 ) ) ( not ( = ?auto_250157 ?auto_250161 ) ) ( not ( = ?auto_250157 ?auto_250162 ) ) ( not ( = ?auto_250157 ?auto_250163 ) ) ( not ( = ?auto_250157 ?auto_250164 ) ) ( not ( = ?auto_250158 ?auto_250159 ) ) ( not ( = ?auto_250158 ?auto_250160 ) ) ( not ( = ?auto_250158 ?auto_250161 ) ) ( not ( = ?auto_250158 ?auto_250162 ) ) ( not ( = ?auto_250158 ?auto_250163 ) ) ( not ( = ?auto_250158 ?auto_250164 ) ) ( not ( = ?auto_250159 ?auto_250160 ) ) ( not ( = ?auto_250159 ?auto_250161 ) ) ( not ( = ?auto_250159 ?auto_250162 ) ) ( not ( = ?auto_250159 ?auto_250163 ) ) ( not ( = ?auto_250159 ?auto_250164 ) ) ( not ( = ?auto_250160 ?auto_250161 ) ) ( not ( = ?auto_250160 ?auto_250162 ) ) ( not ( = ?auto_250160 ?auto_250163 ) ) ( not ( = ?auto_250160 ?auto_250164 ) ) ( not ( = ?auto_250161 ?auto_250162 ) ) ( not ( = ?auto_250161 ?auto_250163 ) ) ( not ( = ?auto_250161 ?auto_250164 ) ) ( not ( = ?auto_250162 ?auto_250163 ) ) ( not ( = ?auto_250162 ?auto_250164 ) ) ( not ( = ?auto_250163 ?auto_250164 ) ) ( ON ?auto_250163 ?auto_250164 ) ( ON ?auto_250162 ?auto_250163 ) ( ON ?auto_250161 ?auto_250162 ) ( CLEAR ?auto_250159 ) ( ON ?auto_250160 ?auto_250161 ) ( CLEAR ?auto_250160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_250152 ?auto_250153 ?auto_250154 ?auto_250155 ?auto_250156 ?auto_250157 ?auto_250158 ?auto_250159 ?auto_250160 )
      ( MAKE-13PILE ?auto_250152 ?auto_250153 ?auto_250154 ?auto_250155 ?auto_250156 ?auto_250157 ?auto_250158 ?auto_250159 ?auto_250160 ?auto_250161 ?auto_250162 ?auto_250163 ?auto_250164 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250178 - BLOCK
      ?auto_250179 - BLOCK
      ?auto_250180 - BLOCK
      ?auto_250181 - BLOCK
      ?auto_250182 - BLOCK
      ?auto_250183 - BLOCK
      ?auto_250184 - BLOCK
      ?auto_250185 - BLOCK
      ?auto_250186 - BLOCK
      ?auto_250187 - BLOCK
      ?auto_250188 - BLOCK
      ?auto_250189 - BLOCK
      ?auto_250190 - BLOCK
    )
    :vars
    (
      ?auto_250191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250190 ?auto_250191 ) ( ON-TABLE ?auto_250178 ) ( ON ?auto_250179 ?auto_250178 ) ( ON ?auto_250180 ?auto_250179 ) ( ON ?auto_250181 ?auto_250180 ) ( ON ?auto_250182 ?auto_250181 ) ( ON ?auto_250183 ?auto_250182 ) ( ON ?auto_250184 ?auto_250183 ) ( not ( = ?auto_250178 ?auto_250179 ) ) ( not ( = ?auto_250178 ?auto_250180 ) ) ( not ( = ?auto_250178 ?auto_250181 ) ) ( not ( = ?auto_250178 ?auto_250182 ) ) ( not ( = ?auto_250178 ?auto_250183 ) ) ( not ( = ?auto_250178 ?auto_250184 ) ) ( not ( = ?auto_250178 ?auto_250185 ) ) ( not ( = ?auto_250178 ?auto_250186 ) ) ( not ( = ?auto_250178 ?auto_250187 ) ) ( not ( = ?auto_250178 ?auto_250188 ) ) ( not ( = ?auto_250178 ?auto_250189 ) ) ( not ( = ?auto_250178 ?auto_250190 ) ) ( not ( = ?auto_250178 ?auto_250191 ) ) ( not ( = ?auto_250179 ?auto_250180 ) ) ( not ( = ?auto_250179 ?auto_250181 ) ) ( not ( = ?auto_250179 ?auto_250182 ) ) ( not ( = ?auto_250179 ?auto_250183 ) ) ( not ( = ?auto_250179 ?auto_250184 ) ) ( not ( = ?auto_250179 ?auto_250185 ) ) ( not ( = ?auto_250179 ?auto_250186 ) ) ( not ( = ?auto_250179 ?auto_250187 ) ) ( not ( = ?auto_250179 ?auto_250188 ) ) ( not ( = ?auto_250179 ?auto_250189 ) ) ( not ( = ?auto_250179 ?auto_250190 ) ) ( not ( = ?auto_250179 ?auto_250191 ) ) ( not ( = ?auto_250180 ?auto_250181 ) ) ( not ( = ?auto_250180 ?auto_250182 ) ) ( not ( = ?auto_250180 ?auto_250183 ) ) ( not ( = ?auto_250180 ?auto_250184 ) ) ( not ( = ?auto_250180 ?auto_250185 ) ) ( not ( = ?auto_250180 ?auto_250186 ) ) ( not ( = ?auto_250180 ?auto_250187 ) ) ( not ( = ?auto_250180 ?auto_250188 ) ) ( not ( = ?auto_250180 ?auto_250189 ) ) ( not ( = ?auto_250180 ?auto_250190 ) ) ( not ( = ?auto_250180 ?auto_250191 ) ) ( not ( = ?auto_250181 ?auto_250182 ) ) ( not ( = ?auto_250181 ?auto_250183 ) ) ( not ( = ?auto_250181 ?auto_250184 ) ) ( not ( = ?auto_250181 ?auto_250185 ) ) ( not ( = ?auto_250181 ?auto_250186 ) ) ( not ( = ?auto_250181 ?auto_250187 ) ) ( not ( = ?auto_250181 ?auto_250188 ) ) ( not ( = ?auto_250181 ?auto_250189 ) ) ( not ( = ?auto_250181 ?auto_250190 ) ) ( not ( = ?auto_250181 ?auto_250191 ) ) ( not ( = ?auto_250182 ?auto_250183 ) ) ( not ( = ?auto_250182 ?auto_250184 ) ) ( not ( = ?auto_250182 ?auto_250185 ) ) ( not ( = ?auto_250182 ?auto_250186 ) ) ( not ( = ?auto_250182 ?auto_250187 ) ) ( not ( = ?auto_250182 ?auto_250188 ) ) ( not ( = ?auto_250182 ?auto_250189 ) ) ( not ( = ?auto_250182 ?auto_250190 ) ) ( not ( = ?auto_250182 ?auto_250191 ) ) ( not ( = ?auto_250183 ?auto_250184 ) ) ( not ( = ?auto_250183 ?auto_250185 ) ) ( not ( = ?auto_250183 ?auto_250186 ) ) ( not ( = ?auto_250183 ?auto_250187 ) ) ( not ( = ?auto_250183 ?auto_250188 ) ) ( not ( = ?auto_250183 ?auto_250189 ) ) ( not ( = ?auto_250183 ?auto_250190 ) ) ( not ( = ?auto_250183 ?auto_250191 ) ) ( not ( = ?auto_250184 ?auto_250185 ) ) ( not ( = ?auto_250184 ?auto_250186 ) ) ( not ( = ?auto_250184 ?auto_250187 ) ) ( not ( = ?auto_250184 ?auto_250188 ) ) ( not ( = ?auto_250184 ?auto_250189 ) ) ( not ( = ?auto_250184 ?auto_250190 ) ) ( not ( = ?auto_250184 ?auto_250191 ) ) ( not ( = ?auto_250185 ?auto_250186 ) ) ( not ( = ?auto_250185 ?auto_250187 ) ) ( not ( = ?auto_250185 ?auto_250188 ) ) ( not ( = ?auto_250185 ?auto_250189 ) ) ( not ( = ?auto_250185 ?auto_250190 ) ) ( not ( = ?auto_250185 ?auto_250191 ) ) ( not ( = ?auto_250186 ?auto_250187 ) ) ( not ( = ?auto_250186 ?auto_250188 ) ) ( not ( = ?auto_250186 ?auto_250189 ) ) ( not ( = ?auto_250186 ?auto_250190 ) ) ( not ( = ?auto_250186 ?auto_250191 ) ) ( not ( = ?auto_250187 ?auto_250188 ) ) ( not ( = ?auto_250187 ?auto_250189 ) ) ( not ( = ?auto_250187 ?auto_250190 ) ) ( not ( = ?auto_250187 ?auto_250191 ) ) ( not ( = ?auto_250188 ?auto_250189 ) ) ( not ( = ?auto_250188 ?auto_250190 ) ) ( not ( = ?auto_250188 ?auto_250191 ) ) ( not ( = ?auto_250189 ?auto_250190 ) ) ( not ( = ?auto_250189 ?auto_250191 ) ) ( not ( = ?auto_250190 ?auto_250191 ) ) ( ON ?auto_250189 ?auto_250190 ) ( ON ?auto_250188 ?auto_250189 ) ( ON ?auto_250187 ?auto_250188 ) ( ON ?auto_250186 ?auto_250187 ) ( CLEAR ?auto_250184 ) ( ON ?auto_250185 ?auto_250186 ) ( CLEAR ?auto_250185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_250178 ?auto_250179 ?auto_250180 ?auto_250181 ?auto_250182 ?auto_250183 ?auto_250184 ?auto_250185 )
      ( MAKE-13PILE ?auto_250178 ?auto_250179 ?auto_250180 ?auto_250181 ?auto_250182 ?auto_250183 ?auto_250184 ?auto_250185 ?auto_250186 ?auto_250187 ?auto_250188 ?auto_250189 ?auto_250190 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250205 - BLOCK
      ?auto_250206 - BLOCK
      ?auto_250207 - BLOCK
      ?auto_250208 - BLOCK
      ?auto_250209 - BLOCK
      ?auto_250210 - BLOCK
      ?auto_250211 - BLOCK
      ?auto_250212 - BLOCK
      ?auto_250213 - BLOCK
      ?auto_250214 - BLOCK
      ?auto_250215 - BLOCK
      ?auto_250216 - BLOCK
      ?auto_250217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250217 ) ( ON-TABLE ?auto_250205 ) ( ON ?auto_250206 ?auto_250205 ) ( ON ?auto_250207 ?auto_250206 ) ( ON ?auto_250208 ?auto_250207 ) ( ON ?auto_250209 ?auto_250208 ) ( ON ?auto_250210 ?auto_250209 ) ( ON ?auto_250211 ?auto_250210 ) ( not ( = ?auto_250205 ?auto_250206 ) ) ( not ( = ?auto_250205 ?auto_250207 ) ) ( not ( = ?auto_250205 ?auto_250208 ) ) ( not ( = ?auto_250205 ?auto_250209 ) ) ( not ( = ?auto_250205 ?auto_250210 ) ) ( not ( = ?auto_250205 ?auto_250211 ) ) ( not ( = ?auto_250205 ?auto_250212 ) ) ( not ( = ?auto_250205 ?auto_250213 ) ) ( not ( = ?auto_250205 ?auto_250214 ) ) ( not ( = ?auto_250205 ?auto_250215 ) ) ( not ( = ?auto_250205 ?auto_250216 ) ) ( not ( = ?auto_250205 ?auto_250217 ) ) ( not ( = ?auto_250206 ?auto_250207 ) ) ( not ( = ?auto_250206 ?auto_250208 ) ) ( not ( = ?auto_250206 ?auto_250209 ) ) ( not ( = ?auto_250206 ?auto_250210 ) ) ( not ( = ?auto_250206 ?auto_250211 ) ) ( not ( = ?auto_250206 ?auto_250212 ) ) ( not ( = ?auto_250206 ?auto_250213 ) ) ( not ( = ?auto_250206 ?auto_250214 ) ) ( not ( = ?auto_250206 ?auto_250215 ) ) ( not ( = ?auto_250206 ?auto_250216 ) ) ( not ( = ?auto_250206 ?auto_250217 ) ) ( not ( = ?auto_250207 ?auto_250208 ) ) ( not ( = ?auto_250207 ?auto_250209 ) ) ( not ( = ?auto_250207 ?auto_250210 ) ) ( not ( = ?auto_250207 ?auto_250211 ) ) ( not ( = ?auto_250207 ?auto_250212 ) ) ( not ( = ?auto_250207 ?auto_250213 ) ) ( not ( = ?auto_250207 ?auto_250214 ) ) ( not ( = ?auto_250207 ?auto_250215 ) ) ( not ( = ?auto_250207 ?auto_250216 ) ) ( not ( = ?auto_250207 ?auto_250217 ) ) ( not ( = ?auto_250208 ?auto_250209 ) ) ( not ( = ?auto_250208 ?auto_250210 ) ) ( not ( = ?auto_250208 ?auto_250211 ) ) ( not ( = ?auto_250208 ?auto_250212 ) ) ( not ( = ?auto_250208 ?auto_250213 ) ) ( not ( = ?auto_250208 ?auto_250214 ) ) ( not ( = ?auto_250208 ?auto_250215 ) ) ( not ( = ?auto_250208 ?auto_250216 ) ) ( not ( = ?auto_250208 ?auto_250217 ) ) ( not ( = ?auto_250209 ?auto_250210 ) ) ( not ( = ?auto_250209 ?auto_250211 ) ) ( not ( = ?auto_250209 ?auto_250212 ) ) ( not ( = ?auto_250209 ?auto_250213 ) ) ( not ( = ?auto_250209 ?auto_250214 ) ) ( not ( = ?auto_250209 ?auto_250215 ) ) ( not ( = ?auto_250209 ?auto_250216 ) ) ( not ( = ?auto_250209 ?auto_250217 ) ) ( not ( = ?auto_250210 ?auto_250211 ) ) ( not ( = ?auto_250210 ?auto_250212 ) ) ( not ( = ?auto_250210 ?auto_250213 ) ) ( not ( = ?auto_250210 ?auto_250214 ) ) ( not ( = ?auto_250210 ?auto_250215 ) ) ( not ( = ?auto_250210 ?auto_250216 ) ) ( not ( = ?auto_250210 ?auto_250217 ) ) ( not ( = ?auto_250211 ?auto_250212 ) ) ( not ( = ?auto_250211 ?auto_250213 ) ) ( not ( = ?auto_250211 ?auto_250214 ) ) ( not ( = ?auto_250211 ?auto_250215 ) ) ( not ( = ?auto_250211 ?auto_250216 ) ) ( not ( = ?auto_250211 ?auto_250217 ) ) ( not ( = ?auto_250212 ?auto_250213 ) ) ( not ( = ?auto_250212 ?auto_250214 ) ) ( not ( = ?auto_250212 ?auto_250215 ) ) ( not ( = ?auto_250212 ?auto_250216 ) ) ( not ( = ?auto_250212 ?auto_250217 ) ) ( not ( = ?auto_250213 ?auto_250214 ) ) ( not ( = ?auto_250213 ?auto_250215 ) ) ( not ( = ?auto_250213 ?auto_250216 ) ) ( not ( = ?auto_250213 ?auto_250217 ) ) ( not ( = ?auto_250214 ?auto_250215 ) ) ( not ( = ?auto_250214 ?auto_250216 ) ) ( not ( = ?auto_250214 ?auto_250217 ) ) ( not ( = ?auto_250215 ?auto_250216 ) ) ( not ( = ?auto_250215 ?auto_250217 ) ) ( not ( = ?auto_250216 ?auto_250217 ) ) ( ON ?auto_250216 ?auto_250217 ) ( ON ?auto_250215 ?auto_250216 ) ( ON ?auto_250214 ?auto_250215 ) ( ON ?auto_250213 ?auto_250214 ) ( CLEAR ?auto_250211 ) ( ON ?auto_250212 ?auto_250213 ) ( CLEAR ?auto_250212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_250205 ?auto_250206 ?auto_250207 ?auto_250208 ?auto_250209 ?auto_250210 ?auto_250211 ?auto_250212 )
      ( MAKE-13PILE ?auto_250205 ?auto_250206 ?auto_250207 ?auto_250208 ?auto_250209 ?auto_250210 ?auto_250211 ?auto_250212 ?auto_250213 ?auto_250214 ?auto_250215 ?auto_250216 ?auto_250217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250231 - BLOCK
      ?auto_250232 - BLOCK
      ?auto_250233 - BLOCK
      ?auto_250234 - BLOCK
      ?auto_250235 - BLOCK
      ?auto_250236 - BLOCK
      ?auto_250237 - BLOCK
      ?auto_250238 - BLOCK
      ?auto_250239 - BLOCK
      ?auto_250240 - BLOCK
      ?auto_250241 - BLOCK
      ?auto_250242 - BLOCK
      ?auto_250243 - BLOCK
    )
    :vars
    (
      ?auto_250244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250243 ?auto_250244 ) ( ON-TABLE ?auto_250231 ) ( ON ?auto_250232 ?auto_250231 ) ( ON ?auto_250233 ?auto_250232 ) ( ON ?auto_250234 ?auto_250233 ) ( ON ?auto_250235 ?auto_250234 ) ( ON ?auto_250236 ?auto_250235 ) ( not ( = ?auto_250231 ?auto_250232 ) ) ( not ( = ?auto_250231 ?auto_250233 ) ) ( not ( = ?auto_250231 ?auto_250234 ) ) ( not ( = ?auto_250231 ?auto_250235 ) ) ( not ( = ?auto_250231 ?auto_250236 ) ) ( not ( = ?auto_250231 ?auto_250237 ) ) ( not ( = ?auto_250231 ?auto_250238 ) ) ( not ( = ?auto_250231 ?auto_250239 ) ) ( not ( = ?auto_250231 ?auto_250240 ) ) ( not ( = ?auto_250231 ?auto_250241 ) ) ( not ( = ?auto_250231 ?auto_250242 ) ) ( not ( = ?auto_250231 ?auto_250243 ) ) ( not ( = ?auto_250231 ?auto_250244 ) ) ( not ( = ?auto_250232 ?auto_250233 ) ) ( not ( = ?auto_250232 ?auto_250234 ) ) ( not ( = ?auto_250232 ?auto_250235 ) ) ( not ( = ?auto_250232 ?auto_250236 ) ) ( not ( = ?auto_250232 ?auto_250237 ) ) ( not ( = ?auto_250232 ?auto_250238 ) ) ( not ( = ?auto_250232 ?auto_250239 ) ) ( not ( = ?auto_250232 ?auto_250240 ) ) ( not ( = ?auto_250232 ?auto_250241 ) ) ( not ( = ?auto_250232 ?auto_250242 ) ) ( not ( = ?auto_250232 ?auto_250243 ) ) ( not ( = ?auto_250232 ?auto_250244 ) ) ( not ( = ?auto_250233 ?auto_250234 ) ) ( not ( = ?auto_250233 ?auto_250235 ) ) ( not ( = ?auto_250233 ?auto_250236 ) ) ( not ( = ?auto_250233 ?auto_250237 ) ) ( not ( = ?auto_250233 ?auto_250238 ) ) ( not ( = ?auto_250233 ?auto_250239 ) ) ( not ( = ?auto_250233 ?auto_250240 ) ) ( not ( = ?auto_250233 ?auto_250241 ) ) ( not ( = ?auto_250233 ?auto_250242 ) ) ( not ( = ?auto_250233 ?auto_250243 ) ) ( not ( = ?auto_250233 ?auto_250244 ) ) ( not ( = ?auto_250234 ?auto_250235 ) ) ( not ( = ?auto_250234 ?auto_250236 ) ) ( not ( = ?auto_250234 ?auto_250237 ) ) ( not ( = ?auto_250234 ?auto_250238 ) ) ( not ( = ?auto_250234 ?auto_250239 ) ) ( not ( = ?auto_250234 ?auto_250240 ) ) ( not ( = ?auto_250234 ?auto_250241 ) ) ( not ( = ?auto_250234 ?auto_250242 ) ) ( not ( = ?auto_250234 ?auto_250243 ) ) ( not ( = ?auto_250234 ?auto_250244 ) ) ( not ( = ?auto_250235 ?auto_250236 ) ) ( not ( = ?auto_250235 ?auto_250237 ) ) ( not ( = ?auto_250235 ?auto_250238 ) ) ( not ( = ?auto_250235 ?auto_250239 ) ) ( not ( = ?auto_250235 ?auto_250240 ) ) ( not ( = ?auto_250235 ?auto_250241 ) ) ( not ( = ?auto_250235 ?auto_250242 ) ) ( not ( = ?auto_250235 ?auto_250243 ) ) ( not ( = ?auto_250235 ?auto_250244 ) ) ( not ( = ?auto_250236 ?auto_250237 ) ) ( not ( = ?auto_250236 ?auto_250238 ) ) ( not ( = ?auto_250236 ?auto_250239 ) ) ( not ( = ?auto_250236 ?auto_250240 ) ) ( not ( = ?auto_250236 ?auto_250241 ) ) ( not ( = ?auto_250236 ?auto_250242 ) ) ( not ( = ?auto_250236 ?auto_250243 ) ) ( not ( = ?auto_250236 ?auto_250244 ) ) ( not ( = ?auto_250237 ?auto_250238 ) ) ( not ( = ?auto_250237 ?auto_250239 ) ) ( not ( = ?auto_250237 ?auto_250240 ) ) ( not ( = ?auto_250237 ?auto_250241 ) ) ( not ( = ?auto_250237 ?auto_250242 ) ) ( not ( = ?auto_250237 ?auto_250243 ) ) ( not ( = ?auto_250237 ?auto_250244 ) ) ( not ( = ?auto_250238 ?auto_250239 ) ) ( not ( = ?auto_250238 ?auto_250240 ) ) ( not ( = ?auto_250238 ?auto_250241 ) ) ( not ( = ?auto_250238 ?auto_250242 ) ) ( not ( = ?auto_250238 ?auto_250243 ) ) ( not ( = ?auto_250238 ?auto_250244 ) ) ( not ( = ?auto_250239 ?auto_250240 ) ) ( not ( = ?auto_250239 ?auto_250241 ) ) ( not ( = ?auto_250239 ?auto_250242 ) ) ( not ( = ?auto_250239 ?auto_250243 ) ) ( not ( = ?auto_250239 ?auto_250244 ) ) ( not ( = ?auto_250240 ?auto_250241 ) ) ( not ( = ?auto_250240 ?auto_250242 ) ) ( not ( = ?auto_250240 ?auto_250243 ) ) ( not ( = ?auto_250240 ?auto_250244 ) ) ( not ( = ?auto_250241 ?auto_250242 ) ) ( not ( = ?auto_250241 ?auto_250243 ) ) ( not ( = ?auto_250241 ?auto_250244 ) ) ( not ( = ?auto_250242 ?auto_250243 ) ) ( not ( = ?auto_250242 ?auto_250244 ) ) ( not ( = ?auto_250243 ?auto_250244 ) ) ( ON ?auto_250242 ?auto_250243 ) ( ON ?auto_250241 ?auto_250242 ) ( ON ?auto_250240 ?auto_250241 ) ( ON ?auto_250239 ?auto_250240 ) ( ON ?auto_250238 ?auto_250239 ) ( CLEAR ?auto_250236 ) ( ON ?auto_250237 ?auto_250238 ) ( CLEAR ?auto_250237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_250231 ?auto_250232 ?auto_250233 ?auto_250234 ?auto_250235 ?auto_250236 ?auto_250237 )
      ( MAKE-13PILE ?auto_250231 ?auto_250232 ?auto_250233 ?auto_250234 ?auto_250235 ?auto_250236 ?auto_250237 ?auto_250238 ?auto_250239 ?auto_250240 ?auto_250241 ?auto_250242 ?auto_250243 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250258 - BLOCK
      ?auto_250259 - BLOCK
      ?auto_250260 - BLOCK
      ?auto_250261 - BLOCK
      ?auto_250262 - BLOCK
      ?auto_250263 - BLOCK
      ?auto_250264 - BLOCK
      ?auto_250265 - BLOCK
      ?auto_250266 - BLOCK
      ?auto_250267 - BLOCK
      ?auto_250268 - BLOCK
      ?auto_250269 - BLOCK
      ?auto_250270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250270 ) ( ON-TABLE ?auto_250258 ) ( ON ?auto_250259 ?auto_250258 ) ( ON ?auto_250260 ?auto_250259 ) ( ON ?auto_250261 ?auto_250260 ) ( ON ?auto_250262 ?auto_250261 ) ( ON ?auto_250263 ?auto_250262 ) ( not ( = ?auto_250258 ?auto_250259 ) ) ( not ( = ?auto_250258 ?auto_250260 ) ) ( not ( = ?auto_250258 ?auto_250261 ) ) ( not ( = ?auto_250258 ?auto_250262 ) ) ( not ( = ?auto_250258 ?auto_250263 ) ) ( not ( = ?auto_250258 ?auto_250264 ) ) ( not ( = ?auto_250258 ?auto_250265 ) ) ( not ( = ?auto_250258 ?auto_250266 ) ) ( not ( = ?auto_250258 ?auto_250267 ) ) ( not ( = ?auto_250258 ?auto_250268 ) ) ( not ( = ?auto_250258 ?auto_250269 ) ) ( not ( = ?auto_250258 ?auto_250270 ) ) ( not ( = ?auto_250259 ?auto_250260 ) ) ( not ( = ?auto_250259 ?auto_250261 ) ) ( not ( = ?auto_250259 ?auto_250262 ) ) ( not ( = ?auto_250259 ?auto_250263 ) ) ( not ( = ?auto_250259 ?auto_250264 ) ) ( not ( = ?auto_250259 ?auto_250265 ) ) ( not ( = ?auto_250259 ?auto_250266 ) ) ( not ( = ?auto_250259 ?auto_250267 ) ) ( not ( = ?auto_250259 ?auto_250268 ) ) ( not ( = ?auto_250259 ?auto_250269 ) ) ( not ( = ?auto_250259 ?auto_250270 ) ) ( not ( = ?auto_250260 ?auto_250261 ) ) ( not ( = ?auto_250260 ?auto_250262 ) ) ( not ( = ?auto_250260 ?auto_250263 ) ) ( not ( = ?auto_250260 ?auto_250264 ) ) ( not ( = ?auto_250260 ?auto_250265 ) ) ( not ( = ?auto_250260 ?auto_250266 ) ) ( not ( = ?auto_250260 ?auto_250267 ) ) ( not ( = ?auto_250260 ?auto_250268 ) ) ( not ( = ?auto_250260 ?auto_250269 ) ) ( not ( = ?auto_250260 ?auto_250270 ) ) ( not ( = ?auto_250261 ?auto_250262 ) ) ( not ( = ?auto_250261 ?auto_250263 ) ) ( not ( = ?auto_250261 ?auto_250264 ) ) ( not ( = ?auto_250261 ?auto_250265 ) ) ( not ( = ?auto_250261 ?auto_250266 ) ) ( not ( = ?auto_250261 ?auto_250267 ) ) ( not ( = ?auto_250261 ?auto_250268 ) ) ( not ( = ?auto_250261 ?auto_250269 ) ) ( not ( = ?auto_250261 ?auto_250270 ) ) ( not ( = ?auto_250262 ?auto_250263 ) ) ( not ( = ?auto_250262 ?auto_250264 ) ) ( not ( = ?auto_250262 ?auto_250265 ) ) ( not ( = ?auto_250262 ?auto_250266 ) ) ( not ( = ?auto_250262 ?auto_250267 ) ) ( not ( = ?auto_250262 ?auto_250268 ) ) ( not ( = ?auto_250262 ?auto_250269 ) ) ( not ( = ?auto_250262 ?auto_250270 ) ) ( not ( = ?auto_250263 ?auto_250264 ) ) ( not ( = ?auto_250263 ?auto_250265 ) ) ( not ( = ?auto_250263 ?auto_250266 ) ) ( not ( = ?auto_250263 ?auto_250267 ) ) ( not ( = ?auto_250263 ?auto_250268 ) ) ( not ( = ?auto_250263 ?auto_250269 ) ) ( not ( = ?auto_250263 ?auto_250270 ) ) ( not ( = ?auto_250264 ?auto_250265 ) ) ( not ( = ?auto_250264 ?auto_250266 ) ) ( not ( = ?auto_250264 ?auto_250267 ) ) ( not ( = ?auto_250264 ?auto_250268 ) ) ( not ( = ?auto_250264 ?auto_250269 ) ) ( not ( = ?auto_250264 ?auto_250270 ) ) ( not ( = ?auto_250265 ?auto_250266 ) ) ( not ( = ?auto_250265 ?auto_250267 ) ) ( not ( = ?auto_250265 ?auto_250268 ) ) ( not ( = ?auto_250265 ?auto_250269 ) ) ( not ( = ?auto_250265 ?auto_250270 ) ) ( not ( = ?auto_250266 ?auto_250267 ) ) ( not ( = ?auto_250266 ?auto_250268 ) ) ( not ( = ?auto_250266 ?auto_250269 ) ) ( not ( = ?auto_250266 ?auto_250270 ) ) ( not ( = ?auto_250267 ?auto_250268 ) ) ( not ( = ?auto_250267 ?auto_250269 ) ) ( not ( = ?auto_250267 ?auto_250270 ) ) ( not ( = ?auto_250268 ?auto_250269 ) ) ( not ( = ?auto_250268 ?auto_250270 ) ) ( not ( = ?auto_250269 ?auto_250270 ) ) ( ON ?auto_250269 ?auto_250270 ) ( ON ?auto_250268 ?auto_250269 ) ( ON ?auto_250267 ?auto_250268 ) ( ON ?auto_250266 ?auto_250267 ) ( ON ?auto_250265 ?auto_250266 ) ( CLEAR ?auto_250263 ) ( ON ?auto_250264 ?auto_250265 ) ( CLEAR ?auto_250264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_250258 ?auto_250259 ?auto_250260 ?auto_250261 ?auto_250262 ?auto_250263 ?auto_250264 )
      ( MAKE-13PILE ?auto_250258 ?auto_250259 ?auto_250260 ?auto_250261 ?auto_250262 ?auto_250263 ?auto_250264 ?auto_250265 ?auto_250266 ?auto_250267 ?auto_250268 ?auto_250269 ?auto_250270 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250284 - BLOCK
      ?auto_250285 - BLOCK
      ?auto_250286 - BLOCK
      ?auto_250287 - BLOCK
      ?auto_250288 - BLOCK
      ?auto_250289 - BLOCK
      ?auto_250290 - BLOCK
      ?auto_250291 - BLOCK
      ?auto_250292 - BLOCK
      ?auto_250293 - BLOCK
      ?auto_250294 - BLOCK
      ?auto_250295 - BLOCK
      ?auto_250296 - BLOCK
    )
    :vars
    (
      ?auto_250297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250296 ?auto_250297 ) ( ON-TABLE ?auto_250284 ) ( ON ?auto_250285 ?auto_250284 ) ( ON ?auto_250286 ?auto_250285 ) ( ON ?auto_250287 ?auto_250286 ) ( ON ?auto_250288 ?auto_250287 ) ( not ( = ?auto_250284 ?auto_250285 ) ) ( not ( = ?auto_250284 ?auto_250286 ) ) ( not ( = ?auto_250284 ?auto_250287 ) ) ( not ( = ?auto_250284 ?auto_250288 ) ) ( not ( = ?auto_250284 ?auto_250289 ) ) ( not ( = ?auto_250284 ?auto_250290 ) ) ( not ( = ?auto_250284 ?auto_250291 ) ) ( not ( = ?auto_250284 ?auto_250292 ) ) ( not ( = ?auto_250284 ?auto_250293 ) ) ( not ( = ?auto_250284 ?auto_250294 ) ) ( not ( = ?auto_250284 ?auto_250295 ) ) ( not ( = ?auto_250284 ?auto_250296 ) ) ( not ( = ?auto_250284 ?auto_250297 ) ) ( not ( = ?auto_250285 ?auto_250286 ) ) ( not ( = ?auto_250285 ?auto_250287 ) ) ( not ( = ?auto_250285 ?auto_250288 ) ) ( not ( = ?auto_250285 ?auto_250289 ) ) ( not ( = ?auto_250285 ?auto_250290 ) ) ( not ( = ?auto_250285 ?auto_250291 ) ) ( not ( = ?auto_250285 ?auto_250292 ) ) ( not ( = ?auto_250285 ?auto_250293 ) ) ( not ( = ?auto_250285 ?auto_250294 ) ) ( not ( = ?auto_250285 ?auto_250295 ) ) ( not ( = ?auto_250285 ?auto_250296 ) ) ( not ( = ?auto_250285 ?auto_250297 ) ) ( not ( = ?auto_250286 ?auto_250287 ) ) ( not ( = ?auto_250286 ?auto_250288 ) ) ( not ( = ?auto_250286 ?auto_250289 ) ) ( not ( = ?auto_250286 ?auto_250290 ) ) ( not ( = ?auto_250286 ?auto_250291 ) ) ( not ( = ?auto_250286 ?auto_250292 ) ) ( not ( = ?auto_250286 ?auto_250293 ) ) ( not ( = ?auto_250286 ?auto_250294 ) ) ( not ( = ?auto_250286 ?auto_250295 ) ) ( not ( = ?auto_250286 ?auto_250296 ) ) ( not ( = ?auto_250286 ?auto_250297 ) ) ( not ( = ?auto_250287 ?auto_250288 ) ) ( not ( = ?auto_250287 ?auto_250289 ) ) ( not ( = ?auto_250287 ?auto_250290 ) ) ( not ( = ?auto_250287 ?auto_250291 ) ) ( not ( = ?auto_250287 ?auto_250292 ) ) ( not ( = ?auto_250287 ?auto_250293 ) ) ( not ( = ?auto_250287 ?auto_250294 ) ) ( not ( = ?auto_250287 ?auto_250295 ) ) ( not ( = ?auto_250287 ?auto_250296 ) ) ( not ( = ?auto_250287 ?auto_250297 ) ) ( not ( = ?auto_250288 ?auto_250289 ) ) ( not ( = ?auto_250288 ?auto_250290 ) ) ( not ( = ?auto_250288 ?auto_250291 ) ) ( not ( = ?auto_250288 ?auto_250292 ) ) ( not ( = ?auto_250288 ?auto_250293 ) ) ( not ( = ?auto_250288 ?auto_250294 ) ) ( not ( = ?auto_250288 ?auto_250295 ) ) ( not ( = ?auto_250288 ?auto_250296 ) ) ( not ( = ?auto_250288 ?auto_250297 ) ) ( not ( = ?auto_250289 ?auto_250290 ) ) ( not ( = ?auto_250289 ?auto_250291 ) ) ( not ( = ?auto_250289 ?auto_250292 ) ) ( not ( = ?auto_250289 ?auto_250293 ) ) ( not ( = ?auto_250289 ?auto_250294 ) ) ( not ( = ?auto_250289 ?auto_250295 ) ) ( not ( = ?auto_250289 ?auto_250296 ) ) ( not ( = ?auto_250289 ?auto_250297 ) ) ( not ( = ?auto_250290 ?auto_250291 ) ) ( not ( = ?auto_250290 ?auto_250292 ) ) ( not ( = ?auto_250290 ?auto_250293 ) ) ( not ( = ?auto_250290 ?auto_250294 ) ) ( not ( = ?auto_250290 ?auto_250295 ) ) ( not ( = ?auto_250290 ?auto_250296 ) ) ( not ( = ?auto_250290 ?auto_250297 ) ) ( not ( = ?auto_250291 ?auto_250292 ) ) ( not ( = ?auto_250291 ?auto_250293 ) ) ( not ( = ?auto_250291 ?auto_250294 ) ) ( not ( = ?auto_250291 ?auto_250295 ) ) ( not ( = ?auto_250291 ?auto_250296 ) ) ( not ( = ?auto_250291 ?auto_250297 ) ) ( not ( = ?auto_250292 ?auto_250293 ) ) ( not ( = ?auto_250292 ?auto_250294 ) ) ( not ( = ?auto_250292 ?auto_250295 ) ) ( not ( = ?auto_250292 ?auto_250296 ) ) ( not ( = ?auto_250292 ?auto_250297 ) ) ( not ( = ?auto_250293 ?auto_250294 ) ) ( not ( = ?auto_250293 ?auto_250295 ) ) ( not ( = ?auto_250293 ?auto_250296 ) ) ( not ( = ?auto_250293 ?auto_250297 ) ) ( not ( = ?auto_250294 ?auto_250295 ) ) ( not ( = ?auto_250294 ?auto_250296 ) ) ( not ( = ?auto_250294 ?auto_250297 ) ) ( not ( = ?auto_250295 ?auto_250296 ) ) ( not ( = ?auto_250295 ?auto_250297 ) ) ( not ( = ?auto_250296 ?auto_250297 ) ) ( ON ?auto_250295 ?auto_250296 ) ( ON ?auto_250294 ?auto_250295 ) ( ON ?auto_250293 ?auto_250294 ) ( ON ?auto_250292 ?auto_250293 ) ( ON ?auto_250291 ?auto_250292 ) ( ON ?auto_250290 ?auto_250291 ) ( CLEAR ?auto_250288 ) ( ON ?auto_250289 ?auto_250290 ) ( CLEAR ?auto_250289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_250284 ?auto_250285 ?auto_250286 ?auto_250287 ?auto_250288 ?auto_250289 )
      ( MAKE-13PILE ?auto_250284 ?auto_250285 ?auto_250286 ?auto_250287 ?auto_250288 ?auto_250289 ?auto_250290 ?auto_250291 ?auto_250292 ?auto_250293 ?auto_250294 ?auto_250295 ?auto_250296 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250311 - BLOCK
      ?auto_250312 - BLOCK
      ?auto_250313 - BLOCK
      ?auto_250314 - BLOCK
      ?auto_250315 - BLOCK
      ?auto_250316 - BLOCK
      ?auto_250317 - BLOCK
      ?auto_250318 - BLOCK
      ?auto_250319 - BLOCK
      ?auto_250320 - BLOCK
      ?auto_250321 - BLOCK
      ?auto_250322 - BLOCK
      ?auto_250323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250323 ) ( ON-TABLE ?auto_250311 ) ( ON ?auto_250312 ?auto_250311 ) ( ON ?auto_250313 ?auto_250312 ) ( ON ?auto_250314 ?auto_250313 ) ( ON ?auto_250315 ?auto_250314 ) ( not ( = ?auto_250311 ?auto_250312 ) ) ( not ( = ?auto_250311 ?auto_250313 ) ) ( not ( = ?auto_250311 ?auto_250314 ) ) ( not ( = ?auto_250311 ?auto_250315 ) ) ( not ( = ?auto_250311 ?auto_250316 ) ) ( not ( = ?auto_250311 ?auto_250317 ) ) ( not ( = ?auto_250311 ?auto_250318 ) ) ( not ( = ?auto_250311 ?auto_250319 ) ) ( not ( = ?auto_250311 ?auto_250320 ) ) ( not ( = ?auto_250311 ?auto_250321 ) ) ( not ( = ?auto_250311 ?auto_250322 ) ) ( not ( = ?auto_250311 ?auto_250323 ) ) ( not ( = ?auto_250312 ?auto_250313 ) ) ( not ( = ?auto_250312 ?auto_250314 ) ) ( not ( = ?auto_250312 ?auto_250315 ) ) ( not ( = ?auto_250312 ?auto_250316 ) ) ( not ( = ?auto_250312 ?auto_250317 ) ) ( not ( = ?auto_250312 ?auto_250318 ) ) ( not ( = ?auto_250312 ?auto_250319 ) ) ( not ( = ?auto_250312 ?auto_250320 ) ) ( not ( = ?auto_250312 ?auto_250321 ) ) ( not ( = ?auto_250312 ?auto_250322 ) ) ( not ( = ?auto_250312 ?auto_250323 ) ) ( not ( = ?auto_250313 ?auto_250314 ) ) ( not ( = ?auto_250313 ?auto_250315 ) ) ( not ( = ?auto_250313 ?auto_250316 ) ) ( not ( = ?auto_250313 ?auto_250317 ) ) ( not ( = ?auto_250313 ?auto_250318 ) ) ( not ( = ?auto_250313 ?auto_250319 ) ) ( not ( = ?auto_250313 ?auto_250320 ) ) ( not ( = ?auto_250313 ?auto_250321 ) ) ( not ( = ?auto_250313 ?auto_250322 ) ) ( not ( = ?auto_250313 ?auto_250323 ) ) ( not ( = ?auto_250314 ?auto_250315 ) ) ( not ( = ?auto_250314 ?auto_250316 ) ) ( not ( = ?auto_250314 ?auto_250317 ) ) ( not ( = ?auto_250314 ?auto_250318 ) ) ( not ( = ?auto_250314 ?auto_250319 ) ) ( not ( = ?auto_250314 ?auto_250320 ) ) ( not ( = ?auto_250314 ?auto_250321 ) ) ( not ( = ?auto_250314 ?auto_250322 ) ) ( not ( = ?auto_250314 ?auto_250323 ) ) ( not ( = ?auto_250315 ?auto_250316 ) ) ( not ( = ?auto_250315 ?auto_250317 ) ) ( not ( = ?auto_250315 ?auto_250318 ) ) ( not ( = ?auto_250315 ?auto_250319 ) ) ( not ( = ?auto_250315 ?auto_250320 ) ) ( not ( = ?auto_250315 ?auto_250321 ) ) ( not ( = ?auto_250315 ?auto_250322 ) ) ( not ( = ?auto_250315 ?auto_250323 ) ) ( not ( = ?auto_250316 ?auto_250317 ) ) ( not ( = ?auto_250316 ?auto_250318 ) ) ( not ( = ?auto_250316 ?auto_250319 ) ) ( not ( = ?auto_250316 ?auto_250320 ) ) ( not ( = ?auto_250316 ?auto_250321 ) ) ( not ( = ?auto_250316 ?auto_250322 ) ) ( not ( = ?auto_250316 ?auto_250323 ) ) ( not ( = ?auto_250317 ?auto_250318 ) ) ( not ( = ?auto_250317 ?auto_250319 ) ) ( not ( = ?auto_250317 ?auto_250320 ) ) ( not ( = ?auto_250317 ?auto_250321 ) ) ( not ( = ?auto_250317 ?auto_250322 ) ) ( not ( = ?auto_250317 ?auto_250323 ) ) ( not ( = ?auto_250318 ?auto_250319 ) ) ( not ( = ?auto_250318 ?auto_250320 ) ) ( not ( = ?auto_250318 ?auto_250321 ) ) ( not ( = ?auto_250318 ?auto_250322 ) ) ( not ( = ?auto_250318 ?auto_250323 ) ) ( not ( = ?auto_250319 ?auto_250320 ) ) ( not ( = ?auto_250319 ?auto_250321 ) ) ( not ( = ?auto_250319 ?auto_250322 ) ) ( not ( = ?auto_250319 ?auto_250323 ) ) ( not ( = ?auto_250320 ?auto_250321 ) ) ( not ( = ?auto_250320 ?auto_250322 ) ) ( not ( = ?auto_250320 ?auto_250323 ) ) ( not ( = ?auto_250321 ?auto_250322 ) ) ( not ( = ?auto_250321 ?auto_250323 ) ) ( not ( = ?auto_250322 ?auto_250323 ) ) ( ON ?auto_250322 ?auto_250323 ) ( ON ?auto_250321 ?auto_250322 ) ( ON ?auto_250320 ?auto_250321 ) ( ON ?auto_250319 ?auto_250320 ) ( ON ?auto_250318 ?auto_250319 ) ( ON ?auto_250317 ?auto_250318 ) ( CLEAR ?auto_250315 ) ( ON ?auto_250316 ?auto_250317 ) ( CLEAR ?auto_250316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_250311 ?auto_250312 ?auto_250313 ?auto_250314 ?auto_250315 ?auto_250316 )
      ( MAKE-13PILE ?auto_250311 ?auto_250312 ?auto_250313 ?auto_250314 ?auto_250315 ?auto_250316 ?auto_250317 ?auto_250318 ?auto_250319 ?auto_250320 ?auto_250321 ?auto_250322 ?auto_250323 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250337 - BLOCK
      ?auto_250338 - BLOCK
      ?auto_250339 - BLOCK
      ?auto_250340 - BLOCK
      ?auto_250341 - BLOCK
      ?auto_250342 - BLOCK
      ?auto_250343 - BLOCK
      ?auto_250344 - BLOCK
      ?auto_250345 - BLOCK
      ?auto_250346 - BLOCK
      ?auto_250347 - BLOCK
      ?auto_250348 - BLOCK
      ?auto_250349 - BLOCK
    )
    :vars
    (
      ?auto_250350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250349 ?auto_250350 ) ( ON-TABLE ?auto_250337 ) ( ON ?auto_250338 ?auto_250337 ) ( ON ?auto_250339 ?auto_250338 ) ( ON ?auto_250340 ?auto_250339 ) ( not ( = ?auto_250337 ?auto_250338 ) ) ( not ( = ?auto_250337 ?auto_250339 ) ) ( not ( = ?auto_250337 ?auto_250340 ) ) ( not ( = ?auto_250337 ?auto_250341 ) ) ( not ( = ?auto_250337 ?auto_250342 ) ) ( not ( = ?auto_250337 ?auto_250343 ) ) ( not ( = ?auto_250337 ?auto_250344 ) ) ( not ( = ?auto_250337 ?auto_250345 ) ) ( not ( = ?auto_250337 ?auto_250346 ) ) ( not ( = ?auto_250337 ?auto_250347 ) ) ( not ( = ?auto_250337 ?auto_250348 ) ) ( not ( = ?auto_250337 ?auto_250349 ) ) ( not ( = ?auto_250337 ?auto_250350 ) ) ( not ( = ?auto_250338 ?auto_250339 ) ) ( not ( = ?auto_250338 ?auto_250340 ) ) ( not ( = ?auto_250338 ?auto_250341 ) ) ( not ( = ?auto_250338 ?auto_250342 ) ) ( not ( = ?auto_250338 ?auto_250343 ) ) ( not ( = ?auto_250338 ?auto_250344 ) ) ( not ( = ?auto_250338 ?auto_250345 ) ) ( not ( = ?auto_250338 ?auto_250346 ) ) ( not ( = ?auto_250338 ?auto_250347 ) ) ( not ( = ?auto_250338 ?auto_250348 ) ) ( not ( = ?auto_250338 ?auto_250349 ) ) ( not ( = ?auto_250338 ?auto_250350 ) ) ( not ( = ?auto_250339 ?auto_250340 ) ) ( not ( = ?auto_250339 ?auto_250341 ) ) ( not ( = ?auto_250339 ?auto_250342 ) ) ( not ( = ?auto_250339 ?auto_250343 ) ) ( not ( = ?auto_250339 ?auto_250344 ) ) ( not ( = ?auto_250339 ?auto_250345 ) ) ( not ( = ?auto_250339 ?auto_250346 ) ) ( not ( = ?auto_250339 ?auto_250347 ) ) ( not ( = ?auto_250339 ?auto_250348 ) ) ( not ( = ?auto_250339 ?auto_250349 ) ) ( not ( = ?auto_250339 ?auto_250350 ) ) ( not ( = ?auto_250340 ?auto_250341 ) ) ( not ( = ?auto_250340 ?auto_250342 ) ) ( not ( = ?auto_250340 ?auto_250343 ) ) ( not ( = ?auto_250340 ?auto_250344 ) ) ( not ( = ?auto_250340 ?auto_250345 ) ) ( not ( = ?auto_250340 ?auto_250346 ) ) ( not ( = ?auto_250340 ?auto_250347 ) ) ( not ( = ?auto_250340 ?auto_250348 ) ) ( not ( = ?auto_250340 ?auto_250349 ) ) ( not ( = ?auto_250340 ?auto_250350 ) ) ( not ( = ?auto_250341 ?auto_250342 ) ) ( not ( = ?auto_250341 ?auto_250343 ) ) ( not ( = ?auto_250341 ?auto_250344 ) ) ( not ( = ?auto_250341 ?auto_250345 ) ) ( not ( = ?auto_250341 ?auto_250346 ) ) ( not ( = ?auto_250341 ?auto_250347 ) ) ( not ( = ?auto_250341 ?auto_250348 ) ) ( not ( = ?auto_250341 ?auto_250349 ) ) ( not ( = ?auto_250341 ?auto_250350 ) ) ( not ( = ?auto_250342 ?auto_250343 ) ) ( not ( = ?auto_250342 ?auto_250344 ) ) ( not ( = ?auto_250342 ?auto_250345 ) ) ( not ( = ?auto_250342 ?auto_250346 ) ) ( not ( = ?auto_250342 ?auto_250347 ) ) ( not ( = ?auto_250342 ?auto_250348 ) ) ( not ( = ?auto_250342 ?auto_250349 ) ) ( not ( = ?auto_250342 ?auto_250350 ) ) ( not ( = ?auto_250343 ?auto_250344 ) ) ( not ( = ?auto_250343 ?auto_250345 ) ) ( not ( = ?auto_250343 ?auto_250346 ) ) ( not ( = ?auto_250343 ?auto_250347 ) ) ( not ( = ?auto_250343 ?auto_250348 ) ) ( not ( = ?auto_250343 ?auto_250349 ) ) ( not ( = ?auto_250343 ?auto_250350 ) ) ( not ( = ?auto_250344 ?auto_250345 ) ) ( not ( = ?auto_250344 ?auto_250346 ) ) ( not ( = ?auto_250344 ?auto_250347 ) ) ( not ( = ?auto_250344 ?auto_250348 ) ) ( not ( = ?auto_250344 ?auto_250349 ) ) ( not ( = ?auto_250344 ?auto_250350 ) ) ( not ( = ?auto_250345 ?auto_250346 ) ) ( not ( = ?auto_250345 ?auto_250347 ) ) ( not ( = ?auto_250345 ?auto_250348 ) ) ( not ( = ?auto_250345 ?auto_250349 ) ) ( not ( = ?auto_250345 ?auto_250350 ) ) ( not ( = ?auto_250346 ?auto_250347 ) ) ( not ( = ?auto_250346 ?auto_250348 ) ) ( not ( = ?auto_250346 ?auto_250349 ) ) ( not ( = ?auto_250346 ?auto_250350 ) ) ( not ( = ?auto_250347 ?auto_250348 ) ) ( not ( = ?auto_250347 ?auto_250349 ) ) ( not ( = ?auto_250347 ?auto_250350 ) ) ( not ( = ?auto_250348 ?auto_250349 ) ) ( not ( = ?auto_250348 ?auto_250350 ) ) ( not ( = ?auto_250349 ?auto_250350 ) ) ( ON ?auto_250348 ?auto_250349 ) ( ON ?auto_250347 ?auto_250348 ) ( ON ?auto_250346 ?auto_250347 ) ( ON ?auto_250345 ?auto_250346 ) ( ON ?auto_250344 ?auto_250345 ) ( ON ?auto_250343 ?auto_250344 ) ( ON ?auto_250342 ?auto_250343 ) ( CLEAR ?auto_250340 ) ( ON ?auto_250341 ?auto_250342 ) ( CLEAR ?auto_250341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_250337 ?auto_250338 ?auto_250339 ?auto_250340 ?auto_250341 )
      ( MAKE-13PILE ?auto_250337 ?auto_250338 ?auto_250339 ?auto_250340 ?auto_250341 ?auto_250342 ?auto_250343 ?auto_250344 ?auto_250345 ?auto_250346 ?auto_250347 ?auto_250348 ?auto_250349 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250364 - BLOCK
      ?auto_250365 - BLOCK
      ?auto_250366 - BLOCK
      ?auto_250367 - BLOCK
      ?auto_250368 - BLOCK
      ?auto_250369 - BLOCK
      ?auto_250370 - BLOCK
      ?auto_250371 - BLOCK
      ?auto_250372 - BLOCK
      ?auto_250373 - BLOCK
      ?auto_250374 - BLOCK
      ?auto_250375 - BLOCK
      ?auto_250376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250376 ) ( ON-TABLE ?auto_250364 ) ( ON ?auto_250365 ?auto_250364 ) ( ON ?auto_250366 ?auto_250365 ) ( ON ?auto_250367 ?auto_250366 ) ( not ( = ?auto_250364 ?auto_250365 ) ) ( not ( = ?auto_250364 ?auto_250366 ) ) ( not ( = ?auto_250364 ?auto_250367 ) ) ( not ( = ?auto_250364 ?auto_250368 ) ) ( not ( = ?auto_250364 ?auto_250369 ) ) ( not ( = ?auto_250364 ?auto_250370 ) ) ( not ( = ?auto_250364 ?auto_250371 ) ) ( not ( = ?auto_250364 ?auto_250372 ) ) ( not ( = ?auto_250364 ?auto_250373 ) ) ( not ( = ?auto_250364 ?auto_250374 ) ) ( not ( = ?auto_250364 ?auto_250375 ) ) ( not ( = ?auto_250364 ?auto_250376 ) ) ( not ( = ?auto_250365 ?auto_250366 ) ) ( not ( = ?auto_250365 ?auto_250367 ) ) ( not ( = ?auto_250365 ?auto_250368 ) ) ( not ( = ?auto_250365 ?auto_250369 ) ) ( not ( = ?auto_250365 ?auto_250370 ) ) ( not ( = ?auto_250365 ?auto_250371 ) ) ( not ( = ?auto_250365 ?auto_250372 ) ) ( not ( = ?auto_250365 ?auto_250373 ) ) ( not ( = ?auto_250365 ?auto_250374 ) ) ( not ( = ?auto_250365 ?auto_250375 ) ) ( not ( = ?auto_250365 ?auto_250376 ) ) ( not ( = ?auto_250366 ?auto_250367 ) ) ( not ( = ?auto_250366 ?auto_250368 ) ) ( not ( = ?auto_250366 ?auto_250369 ) ) ( not ( = ?auto_250366 ?auto_250370 ) ) ( not ( = ?auto_250366 ?auto_250371 ) ) ( not ( = ?auto_250366 ?auto_250372 ) ) ( not ( = ?auto_250366 ?auto_250373 ) ) ( not ( = ?auto_250366 ?auto_250374 ) ) ( not ( = ?auto_250366 ?auto_250375 ) ) ( not ( = ?auto_250366 ?auto_250376 ) ) ( not ( = ?auto_250367 ?auto_250368 ) ) ( not ( = ?auto_250367 ?auto_250369 ) ) ( not ( = ?auto_250367 ?auto_250370 ) ) ( not ( = ?auto_250367 ?auto_250371 ) ) ( not ( = ?auto_250367 ?auto_250372 ) ) ( not ( = ?auto_250367 ?auto_250373 ) ) ( not ( = ?auto_250367 ?auto_250374 ) ) ( not ( = ?auto_250367 ?auto_250375 ) ) ( not ( = ?auto_250367 ?auto_250376 ) ) ( not ( = ?auto_250368 ?auto_250369 ) ) ( not ( = ?auto_250368 ?auto_250370 ) ) ( not ( = ?auto_250368 ?auto_250371 ) ) ( not ( = ?auto_250368 ?auto_250372 ) ) ( not ( = ?auto_250368 ?auto_250373 ) ) ( not ( = ?auto_250368 ?auto_250374 ) ) ( not ( = ?auto_250368 ?auto_250375 ) ) ( not ( = ?auto_250368 ?auto_250376 ) ) ( not ( = ?auto_250369 ?auto_250370 ) ) ( not ( = ?auto_250369 ?auto_250371 ) ) ( not ( = ?auto_250369 ?auto_250372 ) ) ( not ( = ?auto_250369 ?auto_250373 ) ) ( not ( = ?auto_250369 ?auto_250374 ) ) ( not ( = ?auto_250369 ?auto_250375 ) ) ( not ( = ?auto_250369 ?auto_250376 ) ) ( not ( = ?auto_250370 ?auto_250371 ) ) ( not ( = ?auto_250370 ?auto_250372 ) ) ( not ( = ?auto_250370 ?auto_250373 ) ) ( not ( = ?auto_250370 ?auto_250374 ) ) ( not ( = ?auto_250370 ?auto_250375 ) ) ( not ( = ?auto_250370 ?auto_250376 ) ) ( not ( = ?auto_250371 ?auto_250372 ) ) ( not ( = ?auto_250371 ?auto_250373 ) ) ( not ( = ?auto_250371 ?auto_250374 ) ) ( not ( = ?auto_250371 ?auto_250375 ) ) ( not ( = ?auto_250371 ?auto_250376 ) ) ( not ( = ?auto_250372 ?auto_250373 ) ) ( not ( = ?auto_250372 ?auto_250374 ) ) ( not ( = ?auto_250372 ?auto_250375 ) ) ( not ( = ?auto_250372 ?auto_250376 ) ) ( not ( = ?auto_250373 ?auto_250374 ) ) ( not ( = ?auto_250373 ?auto_250375 ) ) ( not ( = ?auto_250373 ?auto_250376 ) ) ( not ( = ?auto_250374 ?auto_250375 ) ) ( not ( = ?auto_250374 ?auto_250376 ) ) ( not ( = ?auto_250375 ?auto_250376 ) ) ( ON ?auto_250375 ?auto_250376 ) ( ON ?auto_250374 ?auto_250375 ) ( ON ?auto_250373 ?auto_250374 ) ( ON ?auto_250372 ?auto_250373 ) ( ON ?auto_250371 ?auto_250372 ) ( ON ?auto_250370 ?auto_250371 ) ( ON ?auto_250369 ?auto_250370 ) ( CLEAR ?auto_250367 ) ( ON ?auto_250368 ?auto_250369 ) ( CLEAR ?auto_250368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_250364 ?auto_250365 ?auto_250366 ?auto_250367 ?auto_250368 )
      ( MAKE-13PILE ?auto_250364 ?auto_250365 ?auto_250366 ?auto_250367 ?auto_250368 ?auto_250369 ?auto_250370 ?auto_250371 ?auto_250372 ?auto_250373 ?auto_250374 ?auto_250375 ?auto_250376 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250390 - BLOCK
      ?auto_250391 - BLOCK
      ?auto_250392 - BLOCK
      ?auto_250393 - BLOCK
      ?auto_250394 - BLOCK
      ?auto_250395 - BLOCK
      ?auto_250396 - BLOCK
      ?auto_250397 - BLOCK
      ?auto_250398 - BLOCK
      ?auto_250399 - BLOCK
      ?auto_250400 - BLOCK
      ?auto_250401 - BLOCK
      ?auto_250402 - BLOCK
    )
    :vars
    (
      ?auto_250403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250402 ?auto_250403 ) ( ON-TABLE ?auto_250390 ) ( ON ?auto_250391 ?auto_250390 ) ( ON ?auto_250392 ?auto_250391 ) ( not ( = ?auto_250390 ?auto_250391 ) ) ( not ( = ?auto_250390 ?auto_250392 ) ) ( not ( = ?auto_250390 ?auto_250393 ) ) ( not ( = ?auto_250390 ?auto_250394 ) ) ( not ( = ?auto_250390 ?auto_250395 ) ) ( not ( = ?auto_250390 ?auto_250396 ) ) ( not ( = ?auto_250390 ?auto_250397 ) ) ( not ( = ?auto_250390 ?auto_250398 ) ) ( not ( = ?auto_250390 ?auto_250399 ) ) ( not ( = ?auto_250390 ?auto_250400 ) ) ( not ( = ?auto_250390 ?auto_250401 ) ) ( not ( = ?auto_250390 ?auto_250402 ) ) ( not ( = ?auto_250390 ?auto_250403 ) ) ( not ( = ?auto_250391 ?auto_250392 ) ) ( not ( = ?auto_250391 ?auto_250393 ) ) ( not ( = ?auto_250391 ?auto_250394 ) ) ( not ( = ?auto_250391 ?auto_250395 ) ) ( not ( = ?auto_250391 ?auto_250396 ) ) ( not ( = ?auto_250391 ?auto_250397 ) ) ( not ( = ?auto_250391 ?auto_250398 ) ) ( not ( = ?auto_250391 ?auto_250399 ) ) ( not ( = ?auto_250391 ?auto_250400 ) ) ( not ( = ?auto_250391 ?auto_250401 ) ) ( not ( = ?auto_250391 ?auto_250402 ) ) ( not ( = ?auto_250391 ?auto_250403 ) ) ( not ( = ?auto_250392 ?auto_250393 ) ) ( not ( = ?auto_250392 ?auto_250394 ) ) ( not ( = ?auto_250392 ?auto_250395 ) ) ( not ( = ?auto_250392 ?auto_250396 ) ) ( not ( = ?auto_250392 ?auto_250397 ) ) ( not ( = ?auto_250392 ?auto_250398 ) ) ( not ( = ?auto_250392 ?auto_250399 ) ) ( not ( = ?auto_250392 ?auto_250400 ) ) ( not ( = ?auto_250392 ?auto_250401 ) ) ( not ( = ?auto_250392 ?auto_250402 ) ) ( not ( = ?auto_250392 ?auto_250403 ) ) ( not ( = ?auto_250393 ?auto_250394 ) ) ( not ( = ?auto_250393 ?auto_250395 ) ) ( not ( = ?auto_250393 ?auto_250396 ) ) ( not ( = ?auto_250393 ?auto_250397 ) ) ( not ( = ?auto_250393 ?auto_250398 ) ) ( not ( = ?auto_250393 ?auto_250399 ) ) ( not ( = ?auto_250393 ?auto_250400 ) ) ( not ( = ?auto_250393 ?auto_250401 ) ) ( not ( = ?auto_250393 ?auto_250402 ) ) ( not ( = ?auto_250393 ?auto_250403 ) ) ( not ( = ?auto_250394 ?auto_250395 ) ) ( not ( = ?auto_250394 ?auto_250396 ) ) ( not ( = ?auto_250394 ?auto_250397 ) ) ( not ( = ?auto_250394 ?auto_250398 ) ) ( not ( = ?auto_250394 ?auto_250399 ) ) ( not ( = ?auto_250394 ?auto_250400 ) ) ( not ( = ?auto_250394 ?auto_250401 ) ) ( not ( = ?auto_250394 ?auto_250402 ) ) ( not ( = ?auto_250394 ?auto_250403 ) ) ( not ( = ?auto_250395 ?auto_250396 ) ) ( not ( = ?auto_250395 ?auto_250397 ) ) ( not ( = ?auto_250395 ?auto_250398 ) ) ( not ( = ?auto_250395 ?auto_250399 ) ) ( not ( = ?auto_250395 ?auto_250400 ) ) ( not ( = ?auto_250395 ?auto_250401 ) ) ( not ( = ?auto_250395 ?auto_250402 ) ) ( not ( = ?auto_250395 ?auto_250403 ) ) ( not ( = ?auto_250396 ?auto_250397 ) ) ( not ( = ?auto_250396 ?auto_250398 ) ) ( not ( = ?auto_250396 ?auto_250399 ) ) ( not ( = ?auto_250396 ?auto_250400 ) ) ( not ( = ?auto_250396 ?auto_250401 ) ) ( not ( = ?auto_250396 ?auto_250402 ) ) ( not ( = ?auto_250396 ?auto_250403 ) ) ( not ( = ?auto_250397 ?auto_250398 ) ) ( not ( = ?auto_250397 ?auto_250399 ) ) ( not ( = ?auto_250397 ?auto_250400 ) ) ( not ( = ?auto_250397 ?auto_250401 ) ) ( not ( = ?auto_250397 ?auto_250402 ) ) ( not ( = ?auto_250397 ?auto_250403 ) ) ( not ( = ?auto_250398 ?auto_250399 ) ) ( not ( = ?auto_250398 ?auto_250400 ) ) ( not ( = ?auto_250398 ?auto_250401 ) ) ( not ( = ?auto_250398 ?auto_250402 ) ) ( not ( = ?auto_250398 ?auto_250403 ) ) ( not ( = ?auto_250399 ?auto_250400 ) ) ( not ( = ?auto_250399 ?auto_250401 ) ) ( not ( = ?auto_250399 ?auto_250402 ) ) ( not ( = ?auto_250399 ?auto_250403 ) ) ( not ( = ?auto_250400 ?auto_250401 ) ) ( not ( = ?auto_250400 ?auto_250402 ) ) ( not ( = ?auto_250400 ?auto_250403 ) ) ( not ( = ?auto_250401 ?auto_250402 ) ) ( not ( = ?auto_250401 ?auto_250403 ) ) ( not ( = ?auto_250402 ?auto_250403 ) ) ( ON ?auto_250401 ?auto_250402 ) ( ON ?auto_250400 ?auto_250401 ) ( ON ?auto_250399 ?auto_250400 ) ( ON ?auto_250398 ?auto_250399 ) ( ON ?auto_250397 ?auto_250398 ) ( ON ?auto_250396 ?auto_250397 ) ( ON ?auto_250395 ?auto_250396 ) ( ON ?auto_250394 ?auto_250395 ) ( CLEAR ?auto_250392 ) ( ON ?auto_250393 ?auto_250394 ) ( CLEAR ?auto_250393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250390 ?auto_250391 ?auto_250392 ?auto_250393 )
      ( MAKE-13PILE ?auto_250390 ?auto_250391 ?auto_250392 ?auto_250393 ?auto_250394 ?auto_250395 ?auto_250396 ?auto_250397 ?auto_250398 ?auto_250399 ?auto_250400 ?auto_250401 ?auto_250402 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250417 - BLOCK
      ?auto_250418 - BLOCK
      ?auto_250419 - BLOCK
      ?auto_250420 - BLOCK
      ?auto_250421 - BLOCK
      ?auto_250422 - BLOCK
      ?auto_250423 - BLOCK
      ?auto_250424 - BLOCK
      ?auto_250425 - BLOCK
      ?auto_250426 - BLOCK
      ?auto_250427 - BLOCK
      ?auto_250428 - BLOCK
      ?auto_250429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250429 ) ( ON-TABLE ?auto_250417 ) ( ON ?auto_250418 ?auto_250417 ) ( ON ?auto_250419 ?auto_250418 ) ( not ( = ?auto_250417 ?auto_250418 ) ) ( not ( = ?auto_250417 ?auto_250419 ) ) ( not ( = ?auto_250417 ?auto_250420 ) ) ( not ( = ?auto_250417 ?auto_250421 ) ) ( not ( = ?auto_250417 ?auto_250422 ) ) ( not ( = ?auto_250417 ?auto_250423 ) ) ( not ( = ?auto_250417 ?auto_250424 ) ) ( not ( = ?auto_250417 ?auto_250425 ) ) ( not ( = ?auto_250417 ?auto_250426 ) ) ( not ( = ?auto_250417 ?auto_250427 ) ) ( not ( = ?auto_250417 ?auto_250428 ) ) ( not ( = ?auto_250417 ?auto_250429 ) ) ( not ( = ?auto_250418 ?auto_250419 ) ) ( not ( = ?auto_250418 ?auto_250420 ) ) ( not ( = ?auto_250418 ?auto_250421 ) ) ( not ( = ?auto_250418 ?auto_250422 ) ) ( not ( = ?auto_250418 ?auto_250423 ) ) ( not ( = ?auto_250418 ?auto_250424 ) ) ( not ( = ?auto_250418 ?auto_250425 ) ) ( not ( = ?auto_250418 ?auto_250426 ) ) ( not ( = ?auto_250418 ?auto_250427 ) ) ( not ( = ?auto_250418 ?auto_250428 ) ) ( not ( = ?auto_250418 ?auto_250429 ) ) ( not ( = ?auto_250419 ?auto_250420 ) ) ( not ( = ?auto_250419 ?auto_250421 ) ) ( not ( = ?auto_250419 ?auto_250422 ) ) ( not ( = ?auto_250419 ?auto_250423 ) ) ( not ( = ?auto_250419 ?auto_250424 ) ) ( not ( = ?auto_250419 ?auto_250425 ) ) ( not ( = ?auto_250419 ?auto_250426 ) ) ( not ( = ?auto_250419 ?auto_250427 ) ) ( not ( = ?auto_250419 ?auto_250428 ) ) ( not ( = ?auto_250419 ?auto_250429 ) ) ( not ( = ?auto_250420 ?auto_250421 ) ) ( not ( = ?auto_250420 ?auto_250422 ) ) ( not ( = ?auto_250420 ?auto_250423 ) ) ( not ( = ?auto_250420 ?auto_250424 ) ) ( not ( = ?auto_250420 ?auto_250425 ) ) ( not ( = ?auto_250420 ?auto_250426 ) ) ( not ( = ?auto_250420 ?auto_250427 ) ) ( not ( = ?auto_250420 ?auto_250428 ) ) ( not ( = ?auto_250420 ?auto_250429 ) ) ( not ( = ?auto_250421 ?auto_250422 ) ) ( not ( = ?auto_250421 ?auto_250423 ) ) ( not ( = ?auto_250421 ?auto_250424 ) ) ( not ( = ?auto_250421 ?auto_250425 ) ) ( not ( = ?auto_250421 ?auto_250426 ) ) ( not ( = ?auto_250421 ?auto_250427 ) ) ( not ( = ?auto_250421 ?auto_250428 ) ) ( not ( = ?auto_250421 ?auto_250429 ) ) ( not ( = ?auto_250422 ?auto_250423 ) ) ( not ( = ?auto_250422 ?auto_250424 ) ) ( not ( = ?auto_250422 ?auto_250425 ) ) ( not ( = ?auto_250422 ?auto_250426 ) ) ( not ( = ?auto_250422 ?auto_250427 ) ) ( not ( = ?auto_250422 ?auto_250428 ) ) ( not ( = ?auto_250422 ?auto_250429 ) ) ( not ( = ?auto_250423 ?auto_250424 ) ) ( not ( = ?auto_250423 ?auto_250425 ) ) ( not ( = ?auto_250423 ?auto_250426 ) ) ( not ( = ?auto_250423 ?auto_250427 ) ) ( not ( = ?auto_250423 ?auto_250428 ) ) ( not ( = ?auto_250423 ?auto_250429 ) ) ( not ( = ?auto_250424 ?auto_250425 ) ) ( not ( = ?auto_250424 ?auto_250426 ) ) ( not ( = ?auto_250424 ?auto_250427 ) ) ( not ( = ?auto_250424 ?auto_250428 ) ) ( not ( = ?auto_250424 ?auto_250429 ) ) ( not ( = ?auto_250425 ?auto_250426 ) ) ( not ( = ?auto_250425 ?auto_250427 ) ) ( not ( = ?auto_250425 ?auto_250428 ) ) ( not ( = ?auto_250425 ?auto_250429 ) ) ( not ( = ?auto_250426 ?auto_250427 ) ) ( not ( = ?auto_250426 ?auto_250428 ) ) ( not ( = ?auto_250426 ?auto_250429 ) ) ( not ( = ?auto_250427 ?auto_250428 ) ) ( not ( = ?auto_250427 ?auto_250429 ) ) ( not ( = ?auto_250428 ?auto_250429 ) ) ( ON ?auto_250428 ?auto_250429 ) ( ON ?auto_250427 ?auto_250428 ) ( ON ?auto_250426 ?auto_250427 ) ( ON ?auto_250425 ?auto_250426 ) ( ON ?auto_250424 ?auto_250425 ) ( ON ?auto_250423 ?auto_250424 ) ( ON ?auto_250422 ?auto_250423 ) ( ON ?auto_250421 ?auto_250422 ) ( CLEAR ?auto_250419 ) ( ON ?auto_250420 ?auto_250421 ) ( CLEAR ?auto_250420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250417 ?auto_250418 ?auto_250419 ?auto_250420 )
      ( MAKE-13PILE ?auto_250417 ?auto_250418 ?auto_250419 ?auto_250420 ?auto_250421 ?auto_250422 ?auto_250423 ?auto_250424 ?auto_250425 ?auto_250426 ?auto_250427 ?auto_250428 ?auto_250429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250443 - BLOCK
      ?auto_250444 - BLOCK
      ?auto_250445 - BLOCK
      ?auto_250446 - BLOCK
      ?auto_250447 - BLOCK
      ?auto_250448 - BLOCK
      ?auto_250449 - BLOCK
      ?auto_250450 - BLOCK
      ?auto_250451 - BLOCK
      ?auto_250452 - BLOCK
      ?auto_250453 - BLOCK
      ?auto_250454 - BLOCK
      ?auto_250455 - BLOCK
    )
    :vars
    (
      ?auto_250456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250455 ?auto_250456 ) ( ON-TABLE ?auto_250443 ) ( ON ?auto_250444 ?auto_250443 ) ( not ( = ?auto_250443 ?auto_250444 ) ) ( not ( = ?auto_250443 ?auto_250445 ) ) ( not ( = ?auto_250443 ?auto_250446 ) ) ( not ( = ?auto_250443 ?auto_250447 ) ) ( not ( = ?auto_250443 ?auto_250448 ) ) ( not ( = ?auto_250443 ?auto_250449 ) ) ( not ( = ?auto_250443 ?auto_250450 ) ) ( not ( = ?auto_250443 ?auto_250451 ) ) ( not ( = ?auto_250443 ?auto_250452 ) ) ( not ( = ?auto_250443 ?auto_250453 ) ) ( not ( = ?auto_250443 ?auto_250454 ) ) ( not ( = ?auto_250443 ?auto_250455 ) ) ( not ( = ?auto_250443 ?auto_250456 ) ) ( not ( = ?auto_250444 ?auto_250445 ) ) ( not ( = ?auto_250444 ?auto_250446 ) ) ( not ( = ?auto_250444 ?auto_250447 ) ) ( not ( = ?auto_250444 ?auto_250448 ) ) ( not ( = ?auto_250444 ?auto_250449 ) ) ( not ( = ?auto_250444 ?auto_250450 ) ) ( not ( = ?auto_250444 ?auto_250451 ) ) ( not ( = ?auto_250444 ?auto_250452 ) ) ( not ( = ?auto_250444 ?auto_250453 ) ) ( not ( = ?auto_250444 ?auto_250454 ) ) ( not ( = ?auto_250444 ?auto_250455 ) ) ( not ( = ?auto_250444 ?auto_250456 ) ) ( not ( = ?auto_250445 ?auto_250446 ) ) ( not ( = ?auto_250445 ?auto_250447 ) ) ( not ( = ?auto_250445 ?auto_250448 ) ) ( not ( = ?auto_250445 ?auto_250449 ) ) ( not ( = ?auto_250445 ?auto_250450 ) ) ( not ( = ?auto_250445 ?auto_250451 ) ) ( not ( = ?auto_250445 ?auto_250452 ) ) ( not ( = ?auto_250445 ?auto_250453 ) ) ( not ( = ?auto_250445 ?auto_250454 ) ) ( not ( = ?auto_250445 ?auto_250455 ) ) ( not ( = ?auto_250445 ?auto_250456 ) ) ( not ( = ?auto_250446 ?auto_250447 ) ) ( not ( = ?auto_250446 ?auto_250448 ) ) ( not ( = ?auto_250446 ?auto_250449 ) ) ( not ( = ?auto_250446 ?auto_250450 ) ) ( not ( = ?auto_250446 ?auto_250451 ) ) ( not ( = ?auto_250446 ?auto_250452 ) ) ( not ( = ?auto_250446 ?auto_250453 ) ) ( not ( = ?auto_250446 ?auto_250454 ) ) ( not ( = ?auto_250446 ?auto_250455 ) ) ( not ( = ?auto_250446 ?auto_250456 ) ) ( not ( = ?auto_250447 ?auto_250448 ) ) ( not ( = ?auto_250447 ?auto_250449 ) ) ( not ( = ?auto_250447 ?auto_250450 ) ) ( not ( = ?auto_250447 ?auto_250451 ) ) ( not ( = ?auto_250447 ?auto_250452 ) ) ( not ( = ?auto_250447 ?auto_250453 ) ) ( not ( = ?auto_250447 ?auto_250454 ) ) ( not ( = ?auto_250447 ?auto_250455 ) ) ( not ( = ?auto_250447 ?auto_250456 ) ) ( not ( = ?auto_250448 ?auto_250449 ) ) ( not ( = ?auto_250448 ?auto_250450 ) ) ( not ( = ?auto_250448 ?auto_250451 ) ) ( not ( = ?auto_250448 ?auto_250452 ) ) ( not ( = ?auto_250448 ?auto_250453 ) ) ( not ( = ?auto_250448 ?auto_250454 ) ) ( not ( = ?auto_250448 ?auto_250455 ) ) ( not ( = ?auto_250448 ?auto_250456 ) ) ( not ( = ?auto_250449 ?auto_250450 ) ) ( not ( = ?auto_250449 ?auto_250451 ) ) ( not ( = ?auto_250449 ?auto_250452 ) ) ( not ( = ?auto_250449 ?auto_250453 ) ) ( not ( = ?auto_250449 ?auto_250454 ) ) ( not ( = ?auto_250449 ?auto_250455 ) ) ( not ( = ?auto_250449 ?auto_250456 ) ) ( not ( = ?auto_250450 ?auto_250451 ) ) ( not ( = ?auto_250450 ?auto_250452 ) ) ( not ( = ?auto_250450 ?auto_250453 ) ) ( not ( = ?auto_250450 ?auto_250454 ) ) ( not ( = ?auto_250450 ?auto_250455 ) ) ( not ( = ?auto_250450 ?auto_250456 ) ) ( not ( = ?auto_250451 ?auto_250452 ) ) ( not ( = ?auto_250451 ?auto_250453 ) ) ( not ( = ?auto_250451 ?auto_250454 ) ) ( not ( = ?auto_250451 ?auto_250455 ) ) ( not ( = ?auto_250451 ?auto_250456 ) ) ( not ( = ?auto_250452 ?auto_250453 ) ) ( not ( = ?auto_250452 ?auto_250454 ) ) ( not ( = ?auto_250452 ?auto_250455 ) ) ( not ( = ?auto_250452 ?auto_250456 ) ) ( not ( = ?auto_250453 ?auto_250454 ) ) ( not ( = ?auto_250453 ?auto_250455 ) ) ( not ( = ?auto_250453 ?auto_250456 ) ) ( not ( = ?auto_250454 ?auto_250455 ) ) ( not ( = ?auto_250454 ?auto_250456 ) ) ( not ( = ?auto_250455 ?auto_250456 ) ) ( ON ?auto_250454 ?auto_250455 ) ( ON ?auto_250453 ?auto_250454 ) ( ON ?auto_250452 ?auto_250453 ) ( ON ?auto_250451 ?auto_250452 ) ( ON ?auto_250450 ?auto_250451 ) ( ON ?auto_250449 ?auto_250450 ) ( ON ?auto_250448 ?auto_250449 ) ( ON ?auto_250447 ?auto_250448 ) ( ON ?auto_250446 ?auto_250447 ) ( CLEAR ?auto_250444 ) ( ON ?auto_250445 ?auto_250446 ) ( CLEAR ?auto_250445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250443 ?auto_250444 ?auto_250445 )
      ( MAKE-13PILE ?auto_250443 ?auto_250444 ?auto_250445 ?auto_250446 ?auto_250447 ?auto_250448 ?auto_250449 ?auto_250450 ?auto_250451 ?auto_250452 ?auto_250453 ?auto_250454 ?auto_250455 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250470 - BLOCK
      ?auto_250471 - BLOCK
      ?auto_250472 - BLOCK
      ?auto_250473 - BLOCK
      ?auto_250474 - BLOCK
      ?auto_250475 - BLOCK
      ?auto_250476 - BLOCK
      ?auto_250477 - BLOCK
      ?auto_250478 - BLOCK
      ?auto_250479 - BLOCK
      ?auto_250480 - BLOCK
      ?auto_250481 - BLOCK
      ?auto_250482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250482 ) ( ON-TABLE ?auto_250470 ) ( ON ?auto_250471 ?auto_250470 ) ( not ( = ?auto_250470 ?auto_250471 ) ) ( not ( = ?auto_250470 ?auto_250472 ) ) ( not ( = ?auto_250470 ?auto_250473 ) ) ( not ( = ?auto_250470 ?auto_250474 ) ) ( not ( = ?auto_250470 ?auto_250475 ) ) ( not ( = ?auto_250470 ?auto_250476 ) ) ( not ( = ?auto_250470 ?auto_250477 ) ) ( not ( = ?auto_250470 ?auto_250478 ) ) ( not ( = ?auto_250470 ?auto_250479 ) ) ( not ( = ?auto_250470 ?auto_250480 ) ) ( not ( = ?auto_250470 ?auto_250481 ) ) ( not ( = ?auto_250470 ?auto_250482 ) ) ( not ( = ?auto_250471 ?auto_250472 ) ) ( not ( = ?auto_250471 ?auto_250473 ) ) ( not ( = ?auto_250471 ?auto_250474 ) ) ( not ( = ?auto_250471 ?auto_250475 ) ) ( not ( = ?auto_250471 ?auto_250476 ) ) ( not ( = ?auto_250471 ?auto_250477 ) ) ( not ( = ?auto_250471 ?auto_250478 ) ) ( not ( = ?auto_250471 ?auto_250479 ) ) ( not ( = ?auto_250471 ?auto_250480 ) ) ( not ( = ?auto_250471 ?auto_250481 ) ) ( not ( = ?auto_250471 ?auto_250482 ) ) ( not ( = ?auto_250472 ?auto_250473 ) ) ( not ( = ?auto_250472 ?auto_250474 ) ) ( not ( = ?auto_250472 ?auto_250475 ) ) ( not ( = ?auto_250472 ?auto_250476 ) ) ( not ( = ?auto_250472 ?auto_250477 ) ) ( not ( = ?auto_250472 ?auto_250478 ) ) ( not ( = ?auto_250472 ?auto_250479 ) ) ( not ( = ?auto_250472 ?auto_250480 ) ) ( not ( = ?auto_250472 ?auto_250481 ) ) ( not ( = ?auto_250472 ?auto_250482 ) ) ( not ( = ?auto_250473 ?auto_250474 ) ) ( not ( = ?auto_250473 ?auto_250475 ) ) ( not ( = ?auto_250473 ?auto_250476 ) ) ( not ( = ?auto_250473 ?auto_250477 ) ) ( not ( = ?auto_250473 ?auto_250478 ) ) ( not ( = ?auto_250473 ?auto_250479 ) ) ( not ( = ?auto_250473 ?auto_250480 ) ) ( not ( = ?auto_250473 ?auto_250481 ) ) ( not ( = ?auto_250473 ?auto_250482 ) ) ( not ( = ?auto_250474 ?auto_250475 ) ) ( not ( = ?auto_250474 ?auto_250476 ) ) ( not ( = ?auto_250474 ?auto_250477 ) ) ( not ( = ?auto_250474 ?auto_250478 ) ) ( not ( = ?auto_250474 ?auto_250479 ) ) ( not ( = ?auto_250474 ?auto_250480 ) ) ( not ( = ?auto_250474 ?auto_250481 ) ) ( not ( = ?auto_250474 ?auto_250482 ) ) ( not ( = ?auto_250475 ?auto_250476 ) ) ( not ( = ?auto_250475 ?auto_250477 ) ) ( not ( = ?auto_250475 ?auto_250478 ) ) ( not ( = ?auto_250475 ?auto_250479 ) ) ( not ( = ?auto_250475 ?auto_250480 ) ) ( not ( = ?auto_250475 ?auto_250481 ) ) ( not ( = ?auto_250475 ?auto_250482 ) ) ( not ( = ?auto_250476 ?auto_250477 ) ) ( not ( = ?auto_250476 ?auto_250478 ) ) ( not ( = ?auto_250476 ?auto_250479 ) ) ( not ( = ?auto_250476 ?auto_250480 ) ) ( not ( = ?auto_250476 ?auto_250481 ) ) ( not ( = ?auto_250476 ?auto_250482 ) ) ( not ( = ?auto_250477 ?auto_250478 ) ) ( not ( = ?auto_250477 ?auto_250479 ) ) ( not ( = ?auto_250477 ?auto_250480 ) ) ( not ( = ?auto_250477 ?auto_250481 ) ) ( not ( = ?auto_250477 ?auto_250482 ) ) ( not ( = ?auto_250478 ?auto_250479 ) ) ( not ( = ?auto_250478 ?auto_250480 ) ) ( not ( = ?auto_250478 ?auto_250481 ) ) ( not ( = ?auto_250478 ?auto_250482 ) ) ( not ( = ?auto_250479 ?auto_250480 ) ) ( not ( = ?auto_250479 ?auto_250481 ) ) ( not ( = ?auto_250479 ?auto_250482 ) ) ( not ( = ?auto_250480 ?auto_250481 ) ) ( not ( = ?auto_250480 ?auto_250482 ) ) ( not ( = ?auto_250481 ?auto_250482 ) ) ( ON ?auto_250481 ?auto_250482 ) ( ON ?auto_250480 ?auto_250481 ) ( ON ?auto_250479 ?auto_250480 ) ( ON ?auto_250478 ?auto_250479 ) ( ON ?auto_250477 ?auto_250478 ) ( ON ?auto_250476 ?auto_250477 ) ( ON ?auto_250475 ?auto_250476 ) ( ON ?auto_250474 ?auto_250475 ) ( ON ?auto_250473 ?auto_250474 ) ( CLEAR ?auto_250471 ) ( ON ?auto_250472 ?auto_250473 ) ( CLEAR ?auto_250472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250470 ?auto_250471 ?auto_250472 )
      ( MAKE-13PILE ?auto_250470 ?auto_250471 ?auto_250472 ?auto_250473 ?auto_250474 ?auto_250475 ?auto_250476 ?auto_250477 ?auto_250478 ?auto_250479 ?auto_250480 ?auto_250481 ?auto_250482 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250496 - BLOCK
      ?auto_250497 - BLOCK
      ?auto_250498 - BLOCK
      ?auto_250499 - BLOCK
      ?auto_250500 - BLOCK
      ?auto_250501 - BLOCK
      ?auto_250502 - BLOCK
      ?auto_250503 - BLOCK
      ?auto_250504 - BLOCK
      ?auto_250505 - BLOCK
      ?auto_250506 - BLOCK
      ?auto_250507 - BLOCK
      ?auto_250508 - BLOCK
    )
    :vars
    (
      ?auto_250509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250508 ?auto_250509 ) ( ON-TABLE ?auto_250496 ) ( not ( = ?auto_250496 ?auto_250497 ) ) ( not ( = ?auto_250496 ?auto_250498 ) ) ( not ( = ?auto_250496 ?auto_250499 ) ) ( not ( = ?auto_250496 ?auto_250500 ) ) ( not ( = ?auto_250496 ?auto_250501 ) ) ( not ( = ?auto_250496 ?auto_250502 ) ) ( not ( = ?auto_250496 ?auto_250503 ) ) ( not ( = ?auto_250496 ?auto_250504 ) ) ( not ( = ?auto_250496 ?auto_250505 ) ) ( not ( = ?auto_250496 ?auto_250506 ) ) ( not ( = ?auto_250496 ?auto_250507 ) ) ( not ( = ?auto_250496 ?auto_250508 ) ) ( not ( = ?auto_250496 ?auto_250509 ) ) ( not ( = ?auto_250497 ?auto_250498 ) ) ( not ( = ?auto_250497 ?auto_250499 ) ) ( not ( = ?auto_250497 ?auto_250500 ) ) ( not ( = ?auto_250497 ?auto_250501 ) ) ( not ( = ?auto_250497 ?auto_250502 ) ) ( not ( = ?auto_250497 ?auto_250503 ) ) ( not ( = ?auto_250497 ?auto_250504 ) ) ( not ( = ?auto_250497 ?auto_250505 ) ) ( not ( = ?auto_250497 ?auto_250506 ) ) ( not ( = ?auto_250497 ?auto_250507 ) ) ( not ( = ?auto_250497 ?auto_250508 ) ) ( not ( = ?auto_250497 ?auto_250509 ) ) ( not ( = ?auto_250498 ?auto_250499 ) ) ( not ( = ?auto_250498 ?auto_250500 ) ) ( not ( = ?auto_250498 ?auto_250501 ) ) ( not ( = ?auto_250498 ?auto_250502 ) ) ( not ( = ?auto_250498 ?auto_250503 ) ) ( not ( = ?auto_250498 ?auto_250504 ) ) ( not ( = ?auto_250498 ?auto_250505 ) ) ( not ( = ?auto_250498 ?auto_250506 ) ) ( not ( = ?auto_250498 ?auto_250507 ) ) ( not ( = ?auto_250498 ?auto_250508 ) ) ( not ( = ?auto_250498 ?auto_250509 ) ) ( not ( = ?auto_250499 ?auto_250500 ) ) ( not ( = ?auto_250499 ?auto_250501 ) ) ( not ( = ?auto_250499 ?auto_250502 ) ) ( not ( = ?auto_250499 ?auto_250503 ) ) ( not ( = ?auto_250499 ?auto_250504 ) ) ( not ( = ?auto_250499 ?auto_250505 ) ) ( not ( = ?auto_250499 ?auto_250506 ) ) ( not ( = ?auto_250499 ?auto_250507 ) ) ( not ( = ?auto_250499 ?auto_250508 ) ) ( not ( = ?auto_250499 ?auto_250509 ) ) ( not ( = ?auto_250500 ?auto_250501 ) ) ( not ( = ?auto_250500 ?auto_250502 ) ) ( not ( = ?auto_250500 ?auto_250503 ) ) ( not ( = ?auto_250500 ?auto_250504 ) ) ( not ( = ?auto_250500 ?auto_250505 ) ) ( not ( = ?auto_250500 ?auto_250506 ) ) ( not ( = ?auto_250500 ?auto_250507 ) ) ( not ( = ?auto_250500 ?auto_250508 ) ) ( not ( = ?auto_250500 ?auto_250509 ) ) ( not ( = ?auto_250501 ?auto_250502 ) ) ( not ( = ?auto_250501 ?auto_250503 ) ) ( not ( = ?auto_250501 ?auto_250504 ) ) ( not ( = ?auto_250501 ?auto_250505 ) ) ( not ( = ?auto_250501 ?auto_250506 ) ) ( not ( = ?auto_250501 ?auto_250507 ) ) ( not ( = ?auto_250501 ?auto_250508 ) ) ( not ( = ?auto_250501 ?auto_250509 ) ) ( not ( = ?auto_250502 ?auto_250503 ) ) ( not ( = ?auto_250502 ?auto_250504 ) ) ( not ( = ?auto_250502 ?auto_250505 ) ) ( not ( = ?auto_250502 ?auto_250506 ) ) ( not ( = ?auto_250502 ?auto_250507 ) ) ( not ( = ?auto_250502 ?auto_250508 ) ) ( not ( = ?auto_250502 ?auto_250509 ) ) ( not ( = ?auto_250503 ?auto_250504 ) ) ( not ( = ?auto_250503 ?auto_250505 ) ) ( not ( = ?auto_250503 ?auto_250506 ) ) ( not ( = ?auto_250503 ?auto_250507 ) ) ( not ( = ?auto_250503 ?auto_250508 ) ) ( not ( = ?auto_250503 ?auto_250509 ) ) ( not ( = ?auto_250504 ?auto_250505 ) ) ( not ( = ?auto_250504 ?auto_250506 ) ) ( not ( = ?auto_250504 ?auto_250507 ) ) ( not ( = ?auto_250504 ?auto_250508 ) ) ( not ( = ?auto_250504 ?auto_250509 ) ) ( not ( = ?auto_250505 ?auto_250506 ) ) ( not ( = ?auto_250505 ?auto_250507 ) ) ( not ( = ?auto_250505 ?auto_250508 ) ) ( not ( = ?auto_250505 ?auto_250509 ) ) ( not ( = ?auto_250506 ?auto_250507 ) ) ( not ( = ?auto_250506 ?auto_250508 ) ) ( not ( = ?auto_250506 ?auto_250509 ) ) ( not ( = ?auto_250507 ?auto_250508 ) ) ( not ( = ?auto_250507 ?auto_250509 ) ) ( not ( = ?auto_250508 ?auto_250509 ) ) ( ON ?auto_250507 ?auto_250508 ) ( ON ?auto_250506 ?auto_250507 ) ( ON ?auto_250505 ?auto_250506 ) ( ON ?auto_250504 ?auto_250505 ) ( ON ?auto_250503 ?auto_250504 ) ( ON ?auto_250502 ?auto_250503 ) ( ON ?auto_250501 ?auto_250502 ) ( ON ?auto_250500 ?auto_250501 ) ( ON ?auto_250499 ?auto_250500 ) ( ON ?auto_250498 ?auto_250499 ) ( CLEAR ?auto_250496 ) ( ON ?auto_250497 ?auto_250498 ) ( CLEAR ?auto_250497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250496 ?auto_250497 )
      ( MAKE-13PILE ?auto_250496 ?auto_250497 ?auto_250498 ?auto_250499 ?auto_250500 ?auto_250501 ?auto_250502 ?auto_250503 ?auto_250504 ?auto_250505 ?auto_250506 ?auto_250507 ?auto_250508 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250523 - BLOCK
      ?auto_250524 - BLOCK
      ?auto_250525 - BLOCK
      ?auto_250526 - BLOCK
      ?auto_250527 - BLOCK
      ?auto_250528 - BLOCK
      ?auto_250529 - BLOCK
      ?auto_250530 - BLOCK
      ?auto_250531 - BLOCK
      ?auto_250532 - BLOCK
      ?auto_250533 - BLOCK
      ?auto_250534 - BLOCK
      ?auto_250535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250535 ) ( ON-TABLE ?auto_250523 ) ( not ( = ?auto_250523 ?auto_250524 ) ) ( not ( = ?auto_250523 ?auto_250525 ) ) ( not ( = ?auto_250523 ?auto_250526 ) ) ( not ( = ?auto_250523 ?auto_250527 ) ) ( not ( = ?auto_250523 ?auto_250528 ) ) ( not ( = ?auto_250523 ?auto_250529 ) ) ( not ( = ?auto_250523 ?auto_250530 ) ) ( not ( = ?auto_250523 ?auto_250531 ) ) ( not ( = ?auto_250523 ?auto_250532 ) ) ( not ( = ?auto_250523 ?auto_250533 ) ) ( not ( = ?auto_250523 ?auto_250534 ) ) ( not ( = ?auto_250523 ?auto_250535 ) ) ( not ( = ?auto_250524 ?auto_250525 ) ) ( not ( = ?auto_250524 ?auto_250526 ) ) ( not ( = ?auto_250524 ?auto_250527 ) ) ( not ( = ?auto_250524 ?auto_250528 ) ) ( not ( = ?auto_250524 ?auto_250529 ) ) ( not ( = ?auto_250524 ?auto_250530 ) ) ( not ( = ?auto_250524 ?auto_250531 ) ) ( not ( = ?auto_250524 ?auto_250532 ) ) ( not ( = ?auto_250524 ?auto_250533 ) ) ( not ( = ?auto_250524 ?auto_250534 ) ) ( not ( = ?auto_250524 ?auto_250535 ) ) ( not ( = ?auto_250525 ?auto_250526 ) ) ( not ( = ?auto_250525 ?auto_250527 ) ) ( not ( = ?auto_250525 ?auto_250528 ) ) ( not ( = ?auto_250525 ?auto_250529 ) ) ( not ( = ?auto_250525 ?auto_250530 ) ) ( not ( = ?auto_250525 ?auto_250531 ) ) ( not ( = ?auto_250525 ?auto_250532 ) ) ( not ( = ?auto_250525 ?auto_250533 ) ) ( not ( = ?auto_250525 ?auto_250534 ) ) ( not ( = ?auto_250525 ?auto_250535 ) ) ( not ( = ?auto_250526 ?auto_250527 ) ) ( not ( = ?auto_250526 ?auto_250528 ) ) ( not ( = ?auto_250526 ?auto_250529 ) ) ( not ( = ?auto_250526 ?auto_250530 ) ) ( not ( = ?auto_250526 ?auto_250531 ) ) ( not ( = ?auto_250526 ?auto_250532 ) ) ( not ( = ?auto_250526 ?auto_250533 ) ) ( not ( = ?auto_250526 ?auto_250534 ) ) ( not ( = ?auto_250526 ?auto_250535 ) ) ( not ( = ?auto_250527 ?auto_250528 ) ) ( not ( = ?auto_250527 ?auto_250529 ) ) ( not ( = ?auto_250527 ?auto_250530 ) ) ( not ( = ?auto_250527 ?auto_250531 ) ) ( not ( = ?auto_250527 ?auto_250532 ) ) ( not ( = ?auto_250527 ?auto_250533 ) ) ( not ( = ?auto_250527 ?auto_250534 ) ) ( not ( = ?auto_250527 ?auto_250535 ) ) ( not ( = ?auto_250528 ?auto_250529 ) ) ( not ( = ?auto_250528 ?auto_250530 ) ) ( not ( = ?auto_250528 ?auto_250531 ) ) ( not ( = ?auto_250528 ?auto_250532 ) ) ( not ( = ?auto_250528 ?auto_250533 ) ) ( not ( = ?auto_250528 ?auto_250534 ) ) ( not ( = ?auto_250528 ?auto_250535 ) ) ( not ( = ?auto_250529 ?auto_250530 ) ) ( not ( = ?auto_250529 ?auto_250531 ) ) ( not ( = ?auto_250529 ?auto_250532 ) ) ( not ( = ?auto_250529 ?auto_250533 ) ) ( not ( = ?auto_250529 ?auto_250534 ) ) ( not ( = ?auto_250529 ?auto_250535 ) ) ( not ( = ?auto_250530 ?auto_250531 ) ) ( not ( = ?auto_250530 ?auto_250532 ) ) ( not ( = ?auto_250530 ?auto_250533 ) ) ( not ( = ?auto_250530 ?auto_250534 ) ) ( not ( = ?auto_250530 ?auto_250535 ) ) ( not ( = ?auto_250531 ?auto_250532 ) ) ( not ( = ?auto_250531 ?auto_250533 ) ) ( not ( = ?auto_250531 ?auto_250534 ) ) ( not ( = ?auto_250531 ?auto_250535 ) ) ( not ( = ?auto_250532 ?auto_250533 ) ) ( not ( = ?auto_250532 ?auto_250534 ) ) ( not ( = ?auto_250532 ?auto_250535 ) ) ( not ( = ?auto_250533 ?auto_250534 ) ) ( not ( = ?auto_250533 ?auto_250535 ) ) ( not ( = ?auto_250534 ?auto_250535 ) ) ( ON ?auto_250534 ?auto_250535 ) ( ON ?auto_250533 ?auto_250534 ) ( ON ?auto_250532 ?auto_250533 ) ( ON ?auto_250531 ?auto_250532 ) ( ON ?auto_250530 ?auto_250531 ) ( ON ?auto_250529 ?auto_250530 ) ( ON ?auto_250528 ?auto_250529 ) ( ON ?auto_250527 ?auto_250528 ) ( ON ?auto_250526 ?auto_250527 ) ( ON ?auto_250525 ?auto_250526 ) ( CLEAR ?auto_250523 ) ( ON ?auto_250524 ?auto_250525 ) ( CLEAR ?auto_250524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250523 ?auto_250524 )
      ( MAKE-13PILE ?auto_250523 ?auto_250524 ?auto_250525 ?auto_250526 ?auto_250527 ?auto_250528 ?auto_250529 ?auto_250530 ?auto_250531 ?auto_250532 ?auto_250533 ?auto_250534 ?auto_250535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250549 - BLOCK
      ?auto_250550 - BLOCK
      ?auto_250551 - BLOCK
      ?auto_250552 - BLOCK
      ?auto_250553 - BLOCK
      ?auto_250554 - BLOCK
      ?auto_250555 - BLOCK
      ?auto_250556 - BLOCK
      ?auto_250557 - BLOCK
      ?auto_250558 - BLOCK
      ?auto_250559 - BLOCK
      ?auto_250560 - BLOCK
      ?auto_250561 - BLOCK
    )
    :vars
    (
      ?auto_250562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250561 ?auto_250562 ) ( not ( = ?auto_250549 ?auto_250550 ) ) ( not ( = ?auto_250549 ?auto_250551 ) ) ( not ( = ?auto_250549 ?auto_250552 ) ) ( not ( = ?auto_250549 ?auto_250553 ) ) ( not ( = ?auto_250549 ?auto_250554 ) ) ( not ( = ?auto_250549 ?auto_250555 ) ) ( not ( = ?auto_250549 ?auto_250556 ) ) ( not ( = ?auto_250549 ?auto_250557 ) ) ( not ( = ?auto_250549 ?auto_250558 ) ) ( not ( = ?auto_250549 ?auto_250559 ) ) ( not ( = ?auto_250549 ?auto_250560 ) ) ( not ( = ?auto_250549 ?auto_250561 ) ) ( not ( = ?auto_250549 ?auto_250562 ) ) ( not ( = ?auto_250550 ?auto_250551 ) ) ( not ( = ?auto_250550 ?auto_250552 ) ) ( not ( = ?auto_250550 ?auto_250553 ) ) ( not ( = ?auto_250550 ?auto_250554 ) ) ( not ( = ?auto_250550 ?auto_250555 ) ) ( not ( = ?auto_250550 ?auto_250556 ) ) ( not ( = ?auto_250550 ?auto_250557 ) ) ( not ( = ?auto_250550 ?auto_250558 ) ) ( not ( = ?auto_250550 ?auto_250559 ) ) ( not ( = ?auto_250550 ?auto_250560 ) ) ( not ( = ?auto_250550 ?auto_250561 ) ) ( not ( = ?auto_250550 ?auto_250562 ) ) ( not ( = ?auto_250551 ?auto_250552 ) ) ( not ( = ?auto_250551 ?auto_250553 ) ) ( not ( = ?auto_250551 ?auto_250554 ) ) ( not ( = ?auto_250551 ?auto_250555 ) ) ( not ( = ?auto_250551 ?auto_250556 ) ) ( not ( = ?auto_250551 ?auto_250557 ) ) ( not ( = ?auto_250551 ?auto_250558 ) ) ( not ( = ?auto_250551 ?auto_250559 ) ) ( not ( = ?auto_250551 ?auto_250560 ) ) ( not ( = ?auto_250551 ?auto_250561 ) ) ( not ( = ?auto_250551 ?auto_250562 ) ) ( not ( = ?auto_250552 ?auto_250553 ) ) ( not ( = ?auto_250552 ?auto_250554 ) ) ( not ( = ?auto_250552 ?auto_250555 ) ) ( not ( = ?auto_250552 ?auto_250556 ) ) ( not ( = ?auto_250552 ?auto_250557 ) ) ( not ( = ?auto_250552 ?auto_250558 ) ) ( not ( = ?auto_250552 ?auto_250559 ) ) ( not ( = ?auto_250552 ?auto_250560 ) ) ( not ( = ?auto_250552 ?auto_250561 ) ) ( not ( = ?auto_250552 ?auto_250562 ) ) ( not ( = ?auto_250553 ?auto_250554 ) ) ( not ( = ?auto_250553 ?auto_250555 ) ) ( not ( = ?auto_250553 ?auto_250556 ) ) ( not ( = ?auto_250553 ?auto_250557 ) ) ( not ( = ?auto_250553 ?auto_250558 ) ) ( not ( = ?auto_250553 ?auto_250559 ) ) ( not ( = ?auto_250553 ?auto_250560 ) ) ( not ( = ?auto_250553 ?auto_250561 ) ) ( not ( = ?auto_250553 ?auto_250562 ) ) ( not ( = ?auto_250554 ?auto_250555 ) ) ( not ( = ?auto_250554 ?auto_250556 ) ) ( not ( = ?auto_250554 ?auto_250557 ) ) ( not ( = ?auto_250554 ?auto_250558 ) ) ( not ( = ?auto_250554 ?auto_250559 ) ) ( not ( = ?auto_250554 ?auto_250560 ) ) ( not ( = ?auto_250554 ?auto_250561 ) ) ( not ( = ?auto_250554 ?auto_250562 ) ) ( not ( = ?auto_250555 ?auto_250556 ) ) ( not ( = ?auto_250555 ?auto_250557 ) ) ( not ( = ?auto_250555 ?auto_250558 ) ) ( not ( = ?auto_250555 ?auto_250559 ) ) ( not ( = ?auto_250555 ?auto_250560 ) ) ( not ( = ?auto_250555 ?auto_250561 ) ) ( not ( = ?auto_250555 ?auto_250562 ) ) ( not ( = ?auto_250556 ?auto_250557 ) ) ( not ( = ?auto_250556 ?auto_250558 ) ) ( not ( = ?auto_250556 ?auto_250559 ) ) ( not ( = ?auto_250556 ?auto_250560 ) ) ( not ( = ?auto_250556 ?auto_250561 ) ) ( not ( = ?auto_250556 ?auto_250562 ) ) ( not ( = ?auto_250557 ?auto_250558 ) ) ( not ( = ?auto_250557 ?auto_250559 ) ) ( not ( = ?auto_250557 ?auto_250560 ) ) ( not ( = ?auto_250557 ?auto_250561 ) ) ( not ( = ?auto_250557 ?auto_250562 ) ) ( not ( = ?auto_250558 ?auto_250559 ) ) ( not ( = ?auto_250558 ?auto_250560 ) ) ( not ( = ?auto_250558 ?auto_250561 ) ) ( not ( = ?auto_250558 ?auto_250562 ) ) ( not ( = ?auto_250559 ?auto_250560 ) ) ( not ( = ?auto_250559 ?auto_250561 ) ) ( not ( = ?auto_250559 ?auto_250562 ) ) ( not ( = ?auto_250560 ?auto_250561 ) ) ( not ( = ?auto_250560 ?auto_250562 ) ) ( not ( = ?auto_250561 ?auto_250562 ) ) ( ON ?auto_250560 ?auto_250561 ) ( ON ?auto_250559 ?auto_250560 ) ( ON ?auto_250558 ?auto_250559 ) ( ON ?auto_250557 ?auto_250558 ) ( ON ?auto_250556 ?auto_250557 ) ( ON ?auto_250555 ?auto_250556 ) ( ON ?auto_250554 ?auto_250555 ) ( ON ?auto_250553 ?auto_250554 ) ( ON ?auto_250552 ?auto_250553 ) ( ON ?auto_250551 ?auto_250552 ) ( ON ?auto_250550 ?auto_250551 ) ( ON ?auto_250549 ?auto_250550 ) ( CLEAR ?auto_250549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250549 )
      ( MAKE-13PILE ?auto_250549 ?auto_250550 ?auto_250551 ?auto_250552 ?auto_250553 ?auto_250554 ?auto_250555 ?auto_250556 ?auto_250557 ?auto_250558 ?auto_250559 ?auto_250560 ?auto_250561 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250576 - BLOCK
      ?auto_250577 - BLOCK
      ?auto_250578 - BLOCK
      ?auto_250579 - BLOCK
      ?auto_250580 - BLOCK
      ?auto_250581 - BLOCK
      ?auto_250582 - BLOCK
      ?auto_250583 - BLOCK
      ?auto_250584 - BLOCK
      ?auto_250585 - BLOCK
      ?auto_250586 - BLOCK
      ?auto_250587 - BLOCK
      ?auto_250588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250588 ) ( not ( = ?auto_250576 ?auto_250577 ) ) ( not ( = ?auto_250576 ?auto_250578 ) ) ( not ( = ?auto_250576 ?auto_250579 ) ) ( not ( = ?auto_250576 ?auto_250580 ) ) ( not ( = ?auto_250576 ?auto_250581 ) ) ( not ( = ?auto_250576 ?auto_250582 ) ) ( not ( = ?auto_250576 ?auto_250583 ) ) ( not ( = ?auto_250576 ?auto_250584 ) ) ( not ( = ?auto_250576 ?auto_250585 ) ) ( not ( = ?auto_250576 ?auto_250586 ) ) ( not ( = ?auto_250576 ?auto_250587 ) ) ( not ( = ?auto_250576 ?auto_250588 ) ) ( not ( = ?auto_250577 ?auto_250578 ) ) ( not ( = ?auto_250577 ?auto_250579 ) ) ( not ( = ?auto_250577 ?auto_250580 ) ) ( not ( = ?auto_250577 ?auto_250581 ) ) ( not ( = ?auto_250577 ?auto_250582 ) ) ( not ( = ?auto_250577 ?auto_250583 ) ) ( not ( = ?auto_250577 ?auto_250584 ) ) ( not ( = ?auto_250577 ?auto_250585 ) ) ( not ( = ?auto_250577 ?auto_250586 ) ) ( not ( = ?auto_250577 ?auto_250587 ) ) ( not ( = ?auto_250577 ?auto_250588 ) ) ( not ( = ?auto_250578 ?auto_250579 ) ) ( not ( = ?auto_250578 ?auto_250580 ) ) ( not ( = ?auto_250578 ?auto_250581 ) ) ( not ( = ?auto_250578 ?auto_250582 ) ) ( not ( = ?auto_250578 ?auto_250583 ) ) ( not ( = ?auto_250578 ?auto_250584 ) ) ( not ( = ?auto_250578 ?auto_250585 ) ) ( not ( = ?auto_250578 ?auto_250586 ) ) ( not ( = ?auto_250578 ?auto_250587 ) ) ( not ( = ?auto_250578 ?auto_250588 ) ) ( not ( = ?auto_250579 ?auto_250580 ) ) ( not ( = ?auto_250579 ?auto_250581 ) ) ( not ( = ?auto_250579 ?auto_250582 ) ) ( not ( = ?auto_250579 ?auto_250583 ) ) ( not ( = ?auto_250579 ?auto_250584 ) ) ( not ( = ?auto_250579 ?auto_250585 ) ) ( not ( = ?auto_250579 ?auto_250586 ) ) ( not ( = ?auto_250579 ?auto_250587 ) ) ( not ( = ?auto_250579 ?auto_250588 ) ) ( not ( = ?auto_250580 ?auto_250581 ) ) ( not ( = ?auto_250580 ?auto_250582 ) ) ( not ( = ?auto_250580 ?auto_250583 ) ) ( not ( = ?auto_250580 ?auto_250584 ) ) ( not ( = ?auto_250580 ?auto_250585 ) ) ( not ( = ?auto_250580 ?auto_250586 ) ) ( not ( = ?auto_250580 ?auto_250587 ) ) ( not ( = ?auto_250580 ?auto_250588 ) ) ( not ( = ?auto_250581 ?auto_250582 ) ) ( not ( = ?auto_250581 ?auto_250583 ) ) ( not ( = ?auto_250581 ?auto_250584 ) ) ( not ( = ?auto_250581 ?auto_250585 ) ) ( not ( = ?auto_250581 ?auto_250586 ) ) ( not ( = ?auto_250581 ?auto_250587 ) ) ( not ( = ?auto_250581 ?auto_250588 ) ) ( not ( = ?auto_250582 ?auto_250583 ) ) ( not ( = ?auto_250582 ?auto_250584 ) ) ( not ( = ?auto_250582 ?auto_250585 ) ) ( not ( = ?auto_250582 ?auto_250586 ) ) ( not ( = ?auto_250582 ?auto_250587 ) ) ( not ( = ?auto_250582 ?auto_250588 ) ) ( not ( = ?auto_250583 ?auto_250584 ) ) ( not ( = ?auto_250583 ?auto_250585 ) ) ( not ( = ?auto_250583 ?auto_250586 ) ) ( not ( = ?auto_250583 ?auto_250587 ) ) ( not ( = ?auto_250583 ?auto_250588 ) ) ( not ( = ?auto_250584 ?auto_250585 ) ) ( not ( = ?auto_250584 ?auto_250586 ) ) ( not ( = ?auto_250584 ?auto_250587 ) ) ( not ( = ?auto_250584 ?auto_250588 ) ) ( not ( = ?auto_250585 ?auto_250586 ) ) ( not ( = ?auto_250585 ?auto_250587 ) ) ( not ( = ?auto_250585 ?auto_250588 ) ) ( not ( = ?auto_250586 ?auto_250587 ) ) ( not ( = ?auto_250586 ?auto_250588 ) ) ( not ( = ?auto_250587 ?auto_250588 ) ) ( ON ?auto_250587 ?auto_250588 ) ( ON ?auto_250586 ?auto_250587 ) ( ON ?auto_250585 ?auto_250586 ) ( ON ?auto_250584 ?auto_250585 ) ( ON ?auto_250583 ?auto_250584 ) ( ON ?auto_250582 ?auto_250583 ) ( ON ?auto_250581 ?auto_250582 ) ( ON ?auto_250580 ?auto_250581 ) ( ON ?auto_250579 ?auto_250580 ) ( ON ?auto_250578 ?auto_250579 ) ( ON ?auto_250577 ?auto_250578 ) ( ON ?auto_250576 ?auto_250577 ) ( CLEAR ?auto_250576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250576 )
      ( MAKE-13PILE ?auto_250576 ?auto_250577 ?auto_250578 ?auto_250579 ?auto_250580 ?auto_250581 ?auto_250582 ?auto_250583 ?auto_250584 ?auto_250585 ?auto_250586 ?auto_250587 ?auto_250588 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250602 - BLOCK
      ?auto_250603 - BLOCK
      ?auto_250604 - BLOCK
      ?auto_250605 - BLOCK
      ?auto_250606 - BLOCK
      ?auto_250607 - BLOCK
      ?auto_250608 - BLOCK
      ?auto_250609 - BLOCK
      ?auto_250610 - BLOCK
      ?auto_250611 - BLOCK
      ?auto_250612 - BLOCK
      ?auto_250613 - BLOCK
      ?auto_250614 - BLOCK
    )
    :vars
    (
      ?auto_250615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_250602 ?auto_250603 ) ) ( not ( = ?auto_250602 ?auto_250604 ) ) ( not ( = ?auto_250602 ?auto_250605 ) ) ( not ( = ?auto_250602 ?auto_250606 ) ) ( not ( = ?auto_250602 ?auto_250607 ) ) ( not ( = ?auto_250602 ?auto_250608 ) ) ( not ( = ?auto_250602 ?auto_250609 ) ) ( not ( = ?auto_250602 ?auto_250610 ) ) ( not ( = ?auto_250602 ?auto_250611 ) ) ( not ( = ?auto_250602 ?auto_250612 ) ) ( not ( = ?auto_250602 ?auto_250613 ) ) ( not ( = ?auto_250602 ?auto_250614 ) ) ( not ( = ?auto_250603 ?auto_250604 ) ) ( not ( = ?auto_250603 ?auto_250605 ) ) ( not ( = ?auto_250603 ?auto_250606 ) ) ( not ( = ?auto_250603 ?auto_250607 ) ) ( not ( = ?auto_250603 ?auto_250608 ) ) ( not ( = ?auto_250603 ?auto_250609 ) ) ( not ( = ?auto_250603 ?auto_250610 ) ) ( not ( = ?auto_250603 ?auto_250611 ) ) ( not ( = ?auto_250603 ?auto_250612 ) ) ( not ( = ?auto_250603 ?auto_250613 ) ) ( not ( = ?auto_250603 ?auto_250614 ) ) ( not ( = ?auto_250604 ?auto_250605 ) ) ( not ( = ?auto_250604 ?auto_250606 ) ) ( not ( = ?auto_250604 ?auto_250607 ) ) ( not ( = ?auto_250604 ?auto_250608 ) ) ( not ( = ?auto_250604 ?auto_250609 ) ) ( not ( = ?auto_250604 ?auto_250610 ) ) ( not ( = ?auto_250604 ?auto_250611 ) ) ( not ( = ?auto_250604 ?auto_250612 ) ) ( not ( = ?auto_250604 ?auto_250613 ) ) ( not ( = ?auto_250604 ?auto_250614 ) ) ( not ( = ?auto_250605 ?auto_250606 ) ) ( not ( = ?auto_250605 ?auto_250607 ) ) ( not ( = ?auto_250605 ?auto_250608 ) ) ( not ( = ?auto_250605 ?auto_250609 ) ) ( not ( = ?auto_250605 ?auto_250610 ) ) ( not ( = ?auto_250605 ?auto_250611 ) ) ( not ( = ?auto_250605 ?auto_250612 ) ) ( not ( = ?auto_250605 ?auto_250613 ) ) ( not ( = ?auto_250605 ?auto_250614 ) ) ( not ( = ?auto_250606 ?auto_250607 ) ) ( not ( = ?auto_250606 ?auto_250608 ) ) ( not ( = ?auto_250606 ?auto_250609 ) ) ( not ( = ?auto_250606 ?auto_250610 ) ) ( not ( = ?auto_250606 ?auto_250611 ) ) ( not ( = ?auto_250606 ?auto_250612 ) ) ( not ( = ?auto_250606 ?auto_250613 ) ) ( not ( = ?auto_250606 ?auto_250614 ) ) ( not ( = ?auto_250607 ?auto_250608 ) ) ( not ( = ?auto_250607 ?auto_250609 ) ) ( not ( = ?auto_250607 ?auto_250610 ) ) ( not ( = ?auto_250607 ?auto_250611 ) ) ( not ( = ?auto_250607 ?auto_250612 ) ) ( not ( = ?auto_250607 ?auto_250613 ) ) ( not ( = ?auto_250607 ?auto_250614 ) ) ( not ( = ?auto_250608 ?auto_250609 ) ) ( not ( = ?auto_250608 ?auto_250610 ) ) ( not ( = ?auto_250608 ?auto_250611 ) ) ( not ( = ?auto_250608 ?auto_250612 ) ) ( not ( = ?auto_250608 ?auto_250613 ) ) ( not ( = ?auto_250608 ?auto_250614 ) ) ( not ( = ?auto_250609 ?auto_250610 ) ) ( not ( = ?auto_250609 ?auto_250611 ) ) ( not ( = ?auto_250609 ?auto_250612 ) ) ( not ( = ?auto_250609 ?auto_250613 ) ) ( not ( = ?auto_250609 ?auto_250614 ) ) ( not ( = ?auto_250610 ?auto_250611 ) ) ( not ( = ?auto_250610 ?auto_250612 ) ) ( not ( = ?auto_250610 ?auto_250613 ) ) ( not ( = ?auto_250610 ?auto_250614 ) ) ( not ( = ?auto_250611 ?auto_250612 ) ) ( not ( = ?auto_250611 ?auto_250613 ) ) ( not ( = ?auto_250611 ?auto_250614 ) ) ( not ( = ?auto_250612 ?auto_250613 ) ) ( not ( = ?auto_250612 ?auto_250614 ) ) ( not ( = ?auto_250613 ?auto_250614 ) ) ( ON ?auto_250602 ?auto_250615 ) ( not ( = ?auto_250614 ?auto_250615 ) ) ( not ( = ?auto_250613 ?auto_250615 ) ) ( not ( = ?auto_250612 ?auto_250615 ) ) ( not ( = ?auto_250611 ?auto_250615 ) ) ( not ( = ?auto_250610 ?auto_250615 ) ) ( not ( = ?auto_250609 ?auto_250615 ) ) ( not ( = ?auto_250608 ?auto_250615 ) ) ( not ( = ?auto_250607 ?auto_250615 ) ) ( not ( = ?auto_250606 ?auto_250615 ) ) ( not ( = ?auto_250605 ?auto_250615 ) ) ( not ( = ?auto_250604 ?auto_250615 ) ) ( not ( = ?auto_250603 ?auto_250615 ) ) ( not ( = ?auto_250602 ?auto_250615 ) ) ( ON ?auto_250603 ?auto_250602 ) ( ON ?auto_250604 ?auto_250603 ) ( ON ?auto_250605 ?auto_250604 ) ( ON ?auto_250606 ?auto_250605 ) ( ON ?auto_250607 ?auto_250606 ) ( ON ?auto_250608 ?auto_250607 ) ( ON ?auto_250609 ?auto_250608 ) ( ON ?auto_250610 ?auto_250609 ) ( ON ?auto_250611 ?auto_250610 ) ( ON ?auto_250612 ?auto_250611 ) ( ON ?auto_250613 ?auto_250612 ) ( ON ?auto_250614 ?auto_250613 ) ( CLEAR ?auto_250614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_250614 ?auto_250613 ?auto_250612 ?auto_250611 ?auto_250610 ?auto_250609 ?auto_250608 ?auto_250607 ?auto_250606 ?auto_250605 ?auto_250604 ?auto_250603 ?auto_250602 )
      ( MAKE-13PILE ?auto_250602 ?auto_250603 ?auto_250604 ?auto_250605 ?auto_250606 ?auto_250607 ?auto_250608 ?auto_250609 ?auto_250610 ?auto_250611 ?auto_250612 ?auto_250613 ?auto_250614 ) )
  )

)

