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
      ?auto_111077 - BLOCK
    )
    :vars
    (
      ?auto_111078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111077 ?auto_111078 ) ( CLEAR ?auto_111077 ) ( HAND-EMPTY ) ( not ( = ?auto_111077 ?auto_111078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111077 ?auto_111078 )
      ( !PUTDOWN ?auto_111077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111084 - BLOCK
      ?auto_111085 - BLOCK
    )
    :vars
    (
      ?auto_111086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111084 ) ( ON ?auto_111085 ?auto_111086 ) ( CLEAR ?auto_111085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111084 ) ( not ( = ?auto_111084 ?auto_111085 ) ) ( not ( = ?auto_111084 ?auto_111086 ) ) ( not ( = ?auto_111085 ?auto_111086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111085 ?auto_111086 )
      ( !STACK ?auto_111085 ?auto_111084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111094 - BLOCK
      ?auto_111095 - BLOCK
    )
    :vars
    (
      ?auto_111096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111095 ?auto_111096 ) ( not ( = ?auto_111094 ?auto_111095 ) ) ( not ( = ?auto_111094 ?auto_111096 ) ) ( not ( = ?auto_111095 ?auto_111096 ) ) ( ON ?auto_111094 ?auto_111095 ) ( CLEAR ?auto_111094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111094 )
      ( MAKE-2PILE ?auto_111094 ?auto_111095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111105 - BLOCK
      ?auto_111106 - BLOCK
      ?auto_111107 - BLOCK
    )
    :vars
    (
      ?auto_111108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111106 ) ( ON ?auto_111107 ?auto_111108 ) ( CLEAR ?auto_111107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111105 ) ( ON ?auto_111106 ?auto_111105 ) ( not ( = ?auto_111105 ?auto_111106 ) ) ( not ( = ?auto_111105 ?auto_111107 ) ) ( not ( = ?auto_111105 ?auto_111108 ) ) ( not ( = ?auto_111106 ?auto_111107 ) ) ( not ( = ?auto_111106 ?auto_111108 ) ) ( not ( = ?auto_111107 ?auto_111108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111107 ?auto_111108 )
      ( !STACK ?auto_111107 ?auto_111106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111119 - BLOCK
      ?auto_111120 - BLOCK
      ?auto_111121 - BLOCK
    )
    :vars
    (
      ?auto_111122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111121 ?auto_111122 ) ( ON-TABLE ?auto_111119 ) ( not ( = ?auto_111119 ?auto_111120 ) ) ( not ( = ?auto_111119 ?auto_111121 ) ) ( not ( = ?auto_111119 ?auto_111122 ) ) ( not ( = ?auto_111120 ?auto_111121 ) ) ( not ( = ?auto_111120 ?auto_111122 ) ) ( not ( = ?auto_111121 ?auto_111122 ) ) ( CLEAR ?auto_111119 ) ( ON ?auto_111120 ?auto_111121 ) ( CLEAR ?auto_111120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111119 ?auto_111120 )
      ( MAKE-3PILE ?auto_111119 ?auto_111120 ?auto_111121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111133 - BLOCK
      ?auto_111134 - BLOCK
      ?auto_111135 - BLOCK
    )
    :vars
    (
      ?auto_111136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111135 ?auto_111136 ) ( not ( = ?auto_111133 ?auto_111134 ) ) ( not ( = ?auto_111133 ?auto_111135 ) ) ( not ( = ?auto_111133 ?auto_111136 ) ) ( not ( = ?auto_111134 ?auto_111135 ) ) ( not ( = ?auto_111134 ?auto_111136 ) ) ( not ( = ?auto_111135 ?auto_111136 ) ) ( ON ?auto_111134 ?auto_111135 ) ( ON ?auto_111133 ?auto_111134 ) ( CLEAR ?auto_111133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111133 )
      ( MAKE-3PILE ?auto_111133 ?auto_111134 ?auto_111135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111148 - BLOCK
      ?auto_111149 - BLOCK
      ?auto_111150 - BLOCK
      ?auto_111151 - BLOCK
    )
    :vars
    (
      ?auto_111152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111150 ) ( ON ?auto_111151 ?auto_111152 ) ( CLEAR ?auto_111151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111148 ) ( ON ?auto_111149 ?auto_111148 ) ( ON ?auto_111150 ?auto_111149 ) ( not ( = ?auto_111148 ?auto_111149 ) ) ( not ( = ?auto_111148 ?auto_111150 ) ) ( not ( = ?auto_111148 ?auto_111151 ) ) ( not ( = ?auto_111148 ?auto_111152 ) ) ( not ( = ?auto_111149 ?auto_111150 ) ) ( not ( = ?auto_111149 ?auto_111151 ) ) ( not ( = ?auto_111149 ?auto_111152 ) ) ( not ( = ?auto_111150 ?auto_111151 ) ) ( not ( = ?auto_111150 ?auto_111152 ) ) ( not ( = ?auto_111151 ?auto_111152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111151 ?auto_111152 )
      ( !STACK ?auto_111151 ?auto_111150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111166 - BLOCK
      ?auto_111167 - BLOCK
      ?auto_111168 - BLOCK
      ?auto_111169 - BLOCK
    )
    :vars
    (
      ?auto_111170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111169 ?auto_111170 ) ( ON-TABLE ?auto_111166 ) ( ON ?auto_111167 ?auto_111166 ) ( not ( = ?auto_111166 ?auto_111167 ) ) ( not ( = ?auto_111166 ?auto_111168 ) ) ( not ( = ?auto_111166 ?auto_111169 ) ) ( not ( = ?auto_111166 ?auto_111170 ) ) ( not ( = ?auto_111167 ?auto_111168 ) ) ( not ( = ?auto_111167 ?auto_111169 ) ) ( not ( = ?auto_111167 ?auto_111170 ) ) ( not ( = ?auto_111168 ?auto_111169 ) ) ( not ( = ?auto_111168 ?auto_111170 ) ) ( not ( = ?auto_111169 ?auto_111170 ) ) ( CLEAR ?auto_111167 ) ( ON ?auto_111168 ?auto_111169 ) ( CLEAR ?auto_111168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111166 ?auto_111167 ?auto_111168 )
      ( MAKE-4PILE ?auto_111166 ?auto_111167 ?auto_111168 ?auto_111169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111184 - BLOCK
      ?auto_111185 - BLOCK
      ?auto_111186 - BLOCK
      ?auto_111187 - BLOCK
    )
    :vars
    (
      ?auto_111188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111187 ?auto_111188 ) ( ON-TABLE ?auto_111184 ) ( not ( = ?auto_111184 ?auto_111185 ) ) ( not ( = ?auto_111184 ?auto_111186 ) ) ( not ( = ?auto_111184 ?auto_111187 ) ) ( not ( = ?auto_111184 ?auto_111188 ) ) ( not ( = ?auto_111185 ?auto_111186 ) ) ( not ( = ?auto_111185 ?auto_111187 ) ) ( not ( = ?auto_111185 ?auto_111188 ) ) ( not ( = ?auto_111186 ?auto_111187 ) ) ( not ( = ?auto_111186 ?auto_111188 ) ) ( not ( = ?auto_111187 ?auto_111188 ) ) ( ON ?auto_111186 ?auto_111187 ) ( CLEAR ?auto_111184 ) ( ON ?auto_111185 ?auto_111186 ) ( CLEAR ?auto_111185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111184 ?auto_111185 )
      ( MAKE-4PILE ?auto_111184 ?auto_111185 ?auto_111186 ?auto_111187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111202 - BLOCK
      ?auto_111203 - BLOCK
      ?auto_111204 - BLOCK
      ?auto_111205 - BLOCK
    )
    :vars
    (
      ?auto_111206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111205 ?auto_111206 ) ( not ( = ?auto_111202 ?auto_111203 ) ) ( not ( = ?auto_111202 ?auto_111204 ) ) ( not ( = ?auto_111202 ?auto_111205 ) ) ( not ( = ?auto_111202 ?auto_111206 ) ) ( not ( = ?auto_111203 ?auto_111204 ) ) ( not ( = ?auto_111203 ?auto_111205 ) ) ( not ( = ?auto_111203 ?auto_111206 ) ) ( not ( = ?auto_111204 ?auto_111205 ) ) ( not ( = ?auto_111204 ?auto_111206 ) ) ( not ( = ?auto_111205 ?auto_111206 ) ) ( ON ?auto_111204 ?auto_111205 ) ( ON ?auto_111203 ?auto_111204 ) ( ON ?auto_111202 ?auto_111203 ) ( CLEAR ?auto_111202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111202 )
      ( MAKE-4PILE ?auto_111202 ?auto_111203 ?auto_111204 ?auto_111205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111221 - BLOCK
      ?auto_111222 - BLOCK
      ?auto_111223 - BLOCK
      ?auto_111224 - BLOCK
      ?auto_111225 - BLOCK
    )
    :vars
    (
      ?auto_111226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111224 ) ( ON ?auto_111225 ?auto_111226 ) ( CLEAR ?auto_111225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111221 ) ( ON ?auto_111222 ?auto_111221 ) ( ON ?auto_111223 ?auto_111222 ) ( ON ?auto_111224 ?auto_111223 ) ( not ( = ?auto_111221 ?auto_111222 ) ) ( not ( = ?auto_111221 ?auto_111223 ) ) ( not ( = ?auto_111221 ?auto_111224 ) ) ( not ( = ?auto_111221 ?auto_111225 ) ) ( not ( = ?auto_111221 ?auto_111226 ) ) ( not ( = ?auto_111222 ?auto_111223 ) ) ( not ( = ?auto_111222 ?auto_111224 ) ) ( not ( = ?auto_111222 ?auto_111225 ) ) ( not ( = ?auto_111222 ?auto_111226 ) ) ( not ( = ?auto_111223 ?auto_111224 ) ) ( not ( = ?auto_111223 ?auto_111225 ) ) ( not ( = ?auto_111223 ?auto_111226 ) ) ( not ( = ?auto_111224 ?auto_111225 ) ) ( not ( = ?auto_111224 ?auto_111226 ) ) ( not ( = ?auto_111225 ?auto_111226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111225 ?auto_111226 )
      ( !STACK ?auto_111225 ?auto_111224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111243 - BLOCK
      ?auto_111244 - BLOCK
      ?auto_111245 - BLOCK
      ?auto_111246 - BLOCK
      ?auto_111247 - BLOCK
    )
    :vars
    (
      ?auto_111248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111247 ?auto_111248 ) ( ON-TABLE ?auto_111243 ) ( ON ?auto_111244 ?auto_111243 ) ( ON ?auto_111245 ?auto_111244 ) ( not ( = ?auto_111243 ?auto_111244 ) ) ( not ( = ?auto_111243 ?auto_111245 ) ) ( not ( = ?auto_111243 ?auto_111246 ) ) ( not ( = ?auto_111243 ?auto_111247 ) ) ( not ( = ?auto_111243 ?auto_111248 ) ) ( not ( = ?auto_111244 ?auto_111245 ) ) ( not ( = ?auto_111244 ?auto_111246 ) ) ( not ( = ?auto_111244 ?auto_111247 ) ) ( not ( = ?auto_111244 ?auto_111248 ) ) ( not ( = ?auto_111245 ?auto_111246 ) ) ( not ( = ?auto_111245 ?auto_111247 ) ) ( not ( = ?auto_111245 ?auto_111248 ) ) ( not ( = ?auto_111246 ?auto_111247 ) ) ( not ( = ?auto_111246 ?auto_111248 ) ) ( not ( = ?auto_111247 ?auto_111248 ) ) ( CLEAR ?auto_111245 ) ( ON ?auto_111246 ?auto_111247 ) ( CLEAR ?auto_111246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111243 ?auto_111244 ?auto_111245 ?auto_111246 )
      ( MAKE-5PILE ?auto_111243 ?auto_111244 ?auto_111245 ?auto_111246 ?auto_111247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111265 - BLOCK
      ?auto_111266 - BLOCK
      ?auto_111267 - BLOCK
      ?auto_111268 - BLOCK
      ?auto_111269 - BLOCK
    )
    :vars
    (
      ?auto_111270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111269 ?auto_111270 ) ( ON-TABLE ?auto_111265 ) ( ON ?auto_111266 ?auto_111265 ) ( not ( = ?auto_111265 ?auto_111266 ) ) ( not ( = ?auto_111265 ?auto_111267 ) ) ( not ( = ?auto_111265 ?auto_111268 ) ) ( not ( = ?auto_111265 ?auto_111269 ) ) ( not ( = ?auto_111265 ?auto_111270 ) ) ( not ( = ?auto_111266 ?auto_111267 ) ) ( not ( = ?auto_111266 ?auto_111268 ) ) ( not ( = ?auto_111266 ?auto_111269 ) ) ( not ( = ?auto_111266 ?auto_111270 ) ) ( not ( = ?auto_111267 ?auto_111268 ) ) ( not ( = ?auto_111267 ?auto_111269 ) ) ( not ( = ?auto_111267 ?auto_111270 ) ) ( not ( = ?auto_111268 ?auto_111269 ) ) ( not ( = ?auto_111268 ?auto_111270 ) ) ( not ( = ?auto_111269 ?auto_111270 ) ) ( ON ?auto_111268 ?auto_111269 ) ( CLEAR ?auto_111266 ) ( ON ?auto_111267 ?auto_111268 ) ( CLEAR ?auto_111267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111265 ?auto_111266 ?auto_111267 )
      ( MAKE-5PILE ?auto_111265 ?auto_111266 ?auto_111267 ?auto_111268 ?auto_111269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111287 - BLOCK
      ?auto_111288 - BLOCK
      ?auto_111289 - BLOCK
      ?auto_111290 - BLOCK
      ?auto_111291 - BLOCK
    )
    :vars
    (
      ?auto_111292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111291 ?auto_111292 ) ( ON-TABLE ?auto_111287 ) ( not ( = ?auto_111287 ?auto_111288 ) ) ( not ( = ?auto_111287 ?auto_111289 ) ) ( not ( = ?auto_111287 ?auto_111290 ) ) ( not ( = ?auto_111287 ?auto_111291 ) ) ( not ( = ?auto_111287 ?auto_111292 ) ) ( not ( = ?auto_111288 ?auto_111289 ) ) ( not ( = ?auto_111288 ?auto_111290 ) ) ( not ( = ?auto_111288 ?auto_111291 ) ) ( not ( = ?auto_111288 ?auto_111292 ) ) ( not ( = ?auto_111289 ?auto_111290 ) ) ( not ( = ?auto_111289 ?auto_111291 ) ) ( not ( = ?auto_111289 ?auto_111292 ) ) ( not ( = ?auto_111290 ?auto_111291 ) ) ( not ( = ?auto_111290 ?auto_111292 ) ) ( not ( = ?auto_111291 ?auto_111292 ) ) ( ON ?auto_111290 ?auto_111291 ) ( ON ?auto_111289 ?auto_111290 ) ( CLEAR ?auto_111287 ) ( ON ?auto_111288 ?auto_111289 ) ( CLEAR ?auto_111288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111287 ?auto_111288 )
      ( MAKE-5PILE ?auto_111287 ?auto_111288 ?auto_111289 ?auto_111290 ?auto_111291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111309 - BLOCK
      ?auto_111310 - BLOCK
      ?auto_111311 - BLOCK
      ?auto_111312 - BLOCK
      ?auto_111313 - BLOCK
    )
    :vars
    (
      ?auto_111314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111313 ?auto_111314 ) ( not ( = ?auto_111309 ?auto_111310 ) ) ( not ( = ?auto_111309 ?auto_111311 ) ) ( not ( = ?auto_111309 ?auto_111312 ) ) ( not ( = ?auto_111309 ?auto_111313 ) ) ( not ( = ?auto_111309 ?auto_111314 ) ) ( not ( = ?auto_111310 ?auto_111311 ) ) ( not ( = ?auto_111310 ?auto_111312 ) ) ( not ( = ?auto_111310 ?auto_111313 ) ) ( not ( = ?auto_111310 ?auto_111314 ) ) ( not ( = ?auto_111311 ?auto_111312 ) ) ( not ( = ?auto_111311 ?auto_111313 ) ) ( not ( = ?auto_111311 ?auto_111314 ) ) ( not ( = ?auto_111312 ?auto_111313 ) ) ( not ( = ?auto_111312 ?auto_111314 ) ) ( not ( = ?auto_111313 ?auto_111314 ) ) ( ON ?auto_111312 ?auto_111313 ) ( ON ?auto_111311 ?auto_111312 ) ( ON ?auto_111310 ?auto_111311 ) ( ON ?auto_111309 ?auto_111310 ) ( CLEAR ?auto_111309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111309 )
      ( MAKE-5PILE ?auto_111309 ?auto_111310 ?auto_111311 ?auto_111312 ?auto_111313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111332 - BLOCK
      ?auto_111333 - BLOCK
      ?auto_111334 - BLOCK
      ?auto_111335 - BLOCK
      ?auto_111336 - BLOCK
      ?auto_111337 - BLOCK
    )
    :vars
    (
      ?auto_111338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111336 ) ( ON ?auto_111337 ?auto_111338 ) ( CLEAR ?auto_111337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111332 ) ( ON ?auto_111333 ?auto_111332 ) ( ON ?auto_111334 ?auto_111333 ) ( ON ?auto_111335 ?auto_111334 ) ( ON ?auto_111336 ?auto_111335 ) ( not ( = ?auto_111332 ?auto_111333 ) ) ( not ( = ?auto_111332 ?auto_111334 ) ) ( not ( = ?auto_111332 ?auto_111335 ) ) ( not ( = ?auto_111332 ?auto_111336 ) ) ( not ( = ?auto_111332 ?auto_111337 ) ) ( not ( = ?auto_111332 ?auto_111338 ) ) ( not ( = ?auto_111333 ?auto_111334 ) ) ( not ( = ?auto_111333 ?auto_111335 ) ) ( not ( = ?auto_111333 ?auto_111336 ) ) ( not ( = ?auto_111333 ?auto_111337 ) ) ( not ( = ?auto_111333 ?auto_111338 ) ) ( not ( = ?auto_111334 ?auto_111335 ) ) ( not ( = ?auto_111334 ?auto_111336 ) ) ( not ( = ?auto_111334 ?auto_111337 ) ) ( not ( = ?auto_111334 ?auto_111338 ) ) ( not ( = ?auto_111335 ?auto_111336 ) ) ( not ( = ?auto_111335 ?auto_111337 ) ) ( not ( = ?auto_111335 ?auto_111338 ) ) ( not ( = ?auto_111336 ?auto_111337 ) ) ( not ( = ?auto_111336 ?auto_111338 ) ) ( not ( = ?auto_111337 ?auto_111338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111337 ?auto_111338 )
      ( !STACK ?auto_111337 ?auto_111336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111358 - BLOCK
      ?auto_111359 - BLOCK
      ?auto_111360 - BLOCK
      ?auto_111361 - BLOCK
      ?auto_111362 - BLOCK
      ?auto_111363 - BLOCK
    )
    :vars
    (
      ?auto_111364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111363 ?auto_111364 ) ( ON-TABLE ?auto_111358 ) ( ON ?auto_111359 ?auto_111358 ) ( ON ?auto_111360 ?auto_111359 ) ( ON ?auto_111361 ?auto_111360 ) ( not ( = ?auto_111358 ?auto_111359 ) ) ( not ( = ?auto_111358 ?auto_111360 ) ) ( not ( = ?auto_111358 ?auto_111361 ) ) ( not ( = ?auto_111358 ?auto_111362 ) ) ( not ( = ?auto_111358 ?auto_111363 ) ) ( not ( = ?auto_111358 ?auto_111364 ) ) ( not ( = ?auto_111359 ?auto_111360 ) ) ( not ( = ?auto_111359 ?auto_111361 ) ) ( not ( = ?auto_111359 ?auto_111362 ) ) ( not ( = ?auto_111359 ?auto_111363 ) ) ( not ( = ?auto_111359 ?auto_111364 ) ) ( not ( = ?auto_111360 ?auto_111361 ) ) ( not ( = ?auto_111360 ?auto_111362 ) ) ( not ( = ?auto_111360 ?auto_111363 ) ) ( not ( = ?auto_111360 ?auto_111364 ) ) ( not ( = ?auto_111361 ?auto_111362 ) ) ( not ( = ?auto_111361 ?auto_111363 ) ) ( not ( = ?auto_111361 ?auto_111364 ) ) ( not ( = ?auto_111362 ?auto_111363 ) ) ( not ( = ?auto_111362 ?auto_111364 ) ) ( not ( = ?auto_111363 ?auto_111364 ) ) ( CLEAR ?auto_111361 ) ( ON ?auto_111362 ?auto_111363 ) ( CLEAR ?auto_111362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111358 ?auto_111359 ?auto_111360 ?auto_111361 ?auto_111362 )
      ( MAKE-6PILE ?auto_111358 ?auto_111359 ?auto_111360 ?auto_111361 ?auto_111362 ?auto_111363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111384 - BLOCK
      ?auto_111385 - BLOCK
      ?auto_111386 - BLOCK
      ?auto_111387 - BLOCK
      ?auto_111388 - BLOCK
      ?auto_111389 - BLOCK
    )
    :vars
    (
      ?auto_111390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111389 ?auto_111390 ) ( ON-TABLE ?auto_111384 ) ( ON ?auto_111385 ?auto_111384 ) ( ON ?auto_111386 ?auto_111385 ) ( not ( = ?auto_111384 ?auto_111385 ) ) ( not ( = ?auto_111384 ?auto_111386 ) ) ( not ( = ?auto_111384 ?auto_111387 ) ) ( not ( = ?auto_111384 ?auto_111388 ) ) ( not ( = ?auto_111384 ?auto_111389 ) ) ( not ( = ?auto_111384 ?auto_111390 ) ) ( not ( = ?auto_111385 ?auto_111386 ) ) ( not ( = ?auto_111385 ?auto_111387 ) ) ( not ( = ?auto_111385 ?auto_111388 ) ) ( not ( = ?auto_111385 ?auto_111389 ) ) ( not ( = ?auto_111385 ?auto_111390 ) ) ( not ( = ?auto_111386 ?auto_111387 ) ) ( not ( = ?auto_111386 ?auto_111388 ) ) ( not ( = ?auto_111386 ?auto_111389 ) ) ( not ( = ?auto_111386 ?auto_111390 ) ) ( not ( = ?auto_111387 ?auto_111388 ) ) ( not ( = ?auto_111387 ?auto_111389 ) ) ( not ( = ?auto_111387 ?auto_111390 ) ) ( not ( = ?auto_111388 ?auto_111389 ) ) ( not ( = ?auto_111388 ?auto_111390 ) ) ( not ( = ?auto_111389 ?auto_111390 ) ) ( ON ?auto_111388 ?auto_111389 ) ( CLEAR ?auto_111386 ) ( ON ?auto_111387 ?auto_111388 ) ( CLEAR ?auto_111387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111384 ?auto_111385 ?auto_111386 ?auto_111387 )
      ( MAKE-6PILE ?auto_111384 ?auto_111385 ?auto_111386 ?auto_111387 ?auto_111388 ?auto_111389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111410 - BLOCK
      ?auto_111411 - BLOCK
      ?auto_111412 - BLOCK
      ?auto_111413 - BLOCK
      ?auto_111414 - BLOCK
      ?auto_111415 - BLOCK
    )
    :vars
    (
      ?auto_111416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111415 ?auto_111416 ) ( ON-TABLE ?auto_111410 ) ( ON ?auto_111411 ?auto_111410 ) ( not ( = ?auto_111410 ?auto_111411 ) ) ( not ( = ?auto_111410 ?auto_111412 ) ) ( not ( = ?auto_111410 ?auto_111413 ) ) ( not ( = ?auto_111410 ?auto_111414 ) ) ( not ( = ?auto_111410 ?auto_111415 ) ) ( not ( = ?auto_111410 ?auto_111416 ) ) ( not ( = ?auto_111411 ?auto_111412 ) ) ( not ( = ?auto_111411 ?auto_111413 ) ) ( not ( = ?auto_111411 ?auto_111414 ) ) ( not ( = ?auto_111411 ?auto_111415 ) ) ( not ( = ?auto_111411 ?auto_111416 ) ) ( not ( = ?auto_111412 ?auto_111413 ) ) ( not ( = ?auto_111412 ?auto_111414 ) ) ( not ( = ?auto_111412 ?auto_111415 ) ) ( not ( = ?auto_111412 ?auto_111416 ) ) ( not ( = ?auto_111413 ?auto_111414 ) ) ( not ( = ?auto_111413 ?auto_111415 ) ) ( not ( = ?auto_111413 ?auto_111416 ) ) ( not ( = ?auto_111414 ?auto_111415 ) ) ( not ( = ?auto_111414 ?auto_111416 ) ) ( not ( = ?auto_111415 ?auto_111416 ) ) ( ON ?auto_111414 ?auto_111415 ) ( ON ?auto_111413 ?auto_111414 ) ( CLEAR ?auto_111411 ) ( ON ?auto_111412 ?auto_111413 ) ( CLEAR ?auto_111412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111410 ?auto_111411 ?auto_111412 )
      ( MAKE-6PILE ?auto_111410 ?auto_111411 ?auto_111412 ?auto_111413 ?auto_111414 ?auto_111415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111436 - BLOCK
      ?auto_111437 - BLOCK
      ?auto_111438 - BLOCK
      ?auto_111439 - BLOCK
      ?auto_111440 - BLOCK
      ?auto_111441 - BLOCK
    )
    :vars
    (
      ?auto_111442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111441 ?auto_111442 ) ( ON-TABLE ?auto_111436 ) ( not ( = ?auto_111436 ?auto_111437 ) ) ( not ( = ?auto_111436 ?auto_111438 ) ) ( not ( = ?auto_111436 ?auto_111439 ) ) ( not ( = ?auto_111436 ?auto_111440 ) ) ( not ( = ?auto_111436 ?auto_111441 ) ) ( not ( = ?auto_111436 ?auto_111442 ) ) ( not ( = ?auto_111437 ?auto_111438 ) ) ( not ( = ?auto_111437 ?auto_111439 ) ) ( not ( = ?auto_111437 ?auto_111440 ) ) ( not ( = ?auto_111437 ?auto_111441 ) ) ( not ( = ?auto_111437 ?auto_111442 ) ) ( not ( = ?auto_111438 ?auto_111439 ) ) ( not ( = ?auto_111438 ?auto_111440 ) ) ( not ( = ?auto_111438 ?auto_111441 ) ) ( not ( = ?auto_111438 ?auto_111442 ) ) ( not ( = ?auto_111439 ?auto_111440 ) ) ( not ( = ?auto_111439 ?auto_111441 ) ) ( not ( = ?auto_111439 ?auto_111442 ) ) ( not ( = ?auto_111440 ?auto_111441 ) ) ( not ( = ?auto_111440 ?auto_111442 ) ) ( not ( = ?auto_111441 ?auto_111442 ) ) ( ON ?auto_111440 ?auto_111441 ) ( ON ?auto_111439 ?auto_111440 ) ( ON ?auto_111438 ?auto_111439 ) ( CLEAR ?auto_111436 ) ( ON ?auto_111437 ?auto_111438 ) ( CLEAR ?auto_111437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111436 ?auto_111437 )
      ( MAKE-6PILE ?auto_111436 ?auto_111437 ?auto_111438 ?auto_111439 ?auto_111440 ?auto_111441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111462 - BLOCK
      ?auto_111463 - BLOCK
      ?auto_111464 - BLOCK
      ?auto_111465 - BLOCK
      ?auto_111466 - BLOCK
      ?auto_111467 - BLOCK
    )
    :vars
    (
      ?auto_111468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111467 ?auto_111468 ) ( not ( = ?auto_111462 ?auto_111463 ) ) ( not ( = ?auto_111462 ?auto_111464 ) ) ( not ( = ?auto_111462 ?auto_111465 ) ) ( not ( = ?auto_111462 ?auto_111466 ) ) ( not ( = ?auto_111462 ?auto_111467 ) ) ( not ( = ?auto_111462 ?auto_111468 ) ) ( not ( = ?auto_111463 ?auto_111464 ) ) ( not ( = ?auto_111463 ?auto_111465 ) ) ( not ( = ?auto_111463 ?auto_111466 ) ) ( not ( = ?auto_111463 ?auto_111467 ) ) ( not ( = ?auto_111463 ?auto_111468 ) ) ( not ( = ?auto_111464 ?auto_111465 ) ) ( not ( = ?auto_111464 ?auto_111466 ) ) ( not ( = ?auto_111464 ?auto_111467 ) ) ( not ( = ?auto_111464 ?auto_111468 ) ) ( not ( = ?auto_111465 ?auto_111466 ) ) ( not ( = ?auto_111465 ?auto_111467 ) ) ( not ( = ?auto_111465 ?auto_111468 ) ) ( not ( = ?auto_111466 ?auto_111467 ) ) ( not ( = ?auto_111466 ?auto_111468 ) ) ( not ( = ?auto_111467 ?auto_111468 ) ) ( ON ?auto_111466 ?auto_111467 ) ( ON ?auto_111465 ?auto_111466 ) ( ON ?auto_111464 ?auto_111465 ) ( ON ?auto_111463 ?auto_111464 ) ( ON ?auto_111462 ?auto_111463 ) ( CLEAR ?auto_111462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111462 )
      ( MAKE-6PILE ?auto_111462 ?auto_111463 ?auto_111464 ?auto_111465 ?auto_111466 ?auto_111467 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111489 - BLOCK
      ?auto_111490 - BLOCK
      ?auto_111491 - BLOCK
      ?auto_111492 - BLOCK
      ?auto_111493 - BLOCK
      ?auto_111494 - BLOCK
      ?auto_111495 - BLOCK
    )
    :vars
    (
      ?auto_111496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111494 ) ( ON ?auto_111495 ?auto_111496 ) ( CLEAR ?auto_111495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111489 ) ( ON ?auto_111490 ?auto_111489 ) ( ON ?auto_111491 ?auto_111490 ) ( ON ?auto_111492 ?auto_111491 ) ( ON ?auto_111493 ?auto_111492 ) ( ON ?auto_111494 ?auto_111493 ) ( not ( = ?auto_111489 ?auto_111490 ) ) ( not ( = ?auto_111489 ?auto_111491 ) ) ( not ( = ?auto_111489 ?auto_111492 ) ) ( not ( = ?auto_111489 ?auto_111493 ) ) ( not ( = ?auto_111489 ?auto_111494 ) ) ( not ( = ?auto_111489 ?auto_111495 ) ) ( not ( = ?auto_111489 ?auto_111496 ) ) ( not ( = ?auto_111490 ?auto_111491 ) ) ( not ( = ?auto_111490 ?auto_111492 ) ) ( not ( = ?auto_111490 ?auto_111493 ) ) ( not ( = ?auto_111490 ?auto_111494 ) ) ( not ( = ?auto_111490 ?auto_111495 ) ) ( not ( = ?auto_111490 ?auto_111496 ) ) ( not ( = ?auto_111491 ?auto_111492 ) ) ( not ( = ?auto_111491 ?auto_111493 ) ) ( not ( = ?auto_111491 ?auto_111494 ) ) ( not ( = ?auto_111491 ?auto_111495 ) ) ( not ( = ?auto_111491 ?auto_111496 ) ) ( not ( = ?auto_111492 ?auto_111493 ) ) ( not ( = ?auto_111492 ?auto_111494 ) ) ( not ( = ?auto_111492 ?auto_111495 ) ) ( not ( = ?auto_111492 ?auto_111496 ) ) ( not ( = ?auto_111493 ?auto_111494 ) ) ( not ( = ?auto_111493 ?auto_111495 ) ) ( not ( = ?auto_111493 ?auto_111496 ) ) ( not ( = ?auto_111494 ?auto_111495 ) ) ( not ( = ?auto_111494 ?auto_111496 ) ) ( not ( = ?auto_111495 ?auto_111496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111495 ?auto_111496 )
      ( !STACK ?auto_111495 ?auto_111494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111519 - BLOCK
      ?auto_111520 - BLOCK
      ?auto_111521 - BLOCK
      ?auto_111522 - BLOCK
      ?auto_111523 - BLOCK
      ?auto_111524 - BLOCK
      ?auto_111525 - BLOCK
    )
    :vars
    (
      ?auto_111526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111525 ?auto_111526 ) ( ON-TABLE ?auto_111519 ) ( ON ?auto_111520 ?auto_111519 ) ( ON ?auto_111521 ?auto_111520 ) ( ON ?auto_111522 ?auto_111521 ) ( ON ?auto_111523 ?auto_111522 ) ( not ( = ?auto_111519 ?auto_111520 ) ) ( not ( = ?auto_111519 ?auto_111521 ) ) ( not ( = ?auto_111519 ?auto_111522 ) ) ( not ( = ?auto_111519 ?auto_111523 ) ) ( not ( = ?auto_111519 ?auto_111524 ) ) ( not ( = ?auto_111519 ?auto_111525 ) ) ( not ( = ?auto_111519 ?auto_111526 ) ) ( not ( = ?auto_111520 ?auto_111521 ) ) ( not ( = ?auto_111520 ?auto_111522 ) ) ( not ( = ?auto_111520 ?auto_111523 ) ) ( not ( = ?auto_111520 ?auto_111524 ) ) ( not ( = ?auto_111520 ?auto_111525 ) ) ( not ( = ?auto_111520 ?auto_111526 ) ) ( not ( = ?auto_111521 ?auto_111522 ) ) ( not ( = ?auto_111521 ?auto_111523 ) ) ( not ( = ?auto_111521 ?auto_111524 ) ) ( not ( = ?auto_111521 ?auto_111525 ) ) ( not ( = ?auto_111521 ?auto_111526 ) ) ( not ( = ?auto_111522 ?auto_111523 ) ) ( not ( = ?auto_111522 ?auto_111524 ) ) ( not ( = ?auto_111522 ?auto_111525 ) ) ( not ( = ?auto_111522 ?auto_111526 ) ) ( not ( = ?auto_111523 ?auto_111524 ) ) ( not ( = ?auto_111523 ?auto_111525 ) ) ( not ( = ?auto_111523 ?auto_111526 ) ) ( not ( = ?auto_111524 ?auto_111525 ) ) ( not ( = ?auto_111524 ?auto_111526 ) ) ( not ( = ?auto_111525 ?auto_111526 ) ) ( CLEAR ?auto_111523 ) ( ON ?auto_111524 ?auto_111525 ) ( CLEAR ?auto_111524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111519 ?auto_111520 ?auto_111521 ?auto_111522 ?auto_111523 ?auto_111524 )
      ( MAKE-7PILE ?auto_111519 ?auto_111520 ?auto_111521 ?auto_111522 ?auto_111523 ?auto_111524 ?auto_111525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111549 - BLOCK
      ?auto_111550 - BLOCK
      ?auto_111551 - BLOCK
      ?auto_111552 - BLOCK
      ?auto_111553 - BLOCK
      ?auto_111554 - BLOCK
      ?auto_111555 - BLOCK
    )
    :vars
    (
      ?auto_111556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111555 ?auto_111556 ) ( ON-TABLE ?auto_111549 ) ( ON ?auto_111550 ?auto_111549 ) ( ON ?auto_111551 ?auto_111550 ) ( ON ?auto_111552 ?auto_111551 ) ( not ( = ?auto_111549 ?auto_111550 ) ) ( not ( = ?auto_111549 ?auto_111551 ) ) ( not ( = ?auto_111549 ?auto_111552 ) ) ( not ( = ?auto_111549 ?auto_111553 ) ) ( not ( = ?auto_111549 ?auto_111554 ) ) ( not ( = ?auto_111549 ?auto_111555 ) ) ( not ( = ?auto_111549 ?auto_111556 ) ) ( not ( = ?auto_111550 ?auto_111551 ) ) ( not ( = ?auto_111550 ?auto_111552 ) ) ( not ( = ?auto_111550 ?auto_111553 ) ) ( not ( = ?auto_111550 ?auto_111554 ) ) ( not ( = ?auto_111550 ?auto_111555 ) ) ( not ( = ?auto_111550 ?auto_111556 ) ) ( not ( = ?auto_111551 ?auto_111552 ) ) ( not ( = ?auto_111551 ?auto_111553 ) ) ( not ( = ?auto_111551 ?auto_111554 ) ) ( not ( = ?auto_111551 ?auto_111555 ) ) ( not ( = ?auto_111551 ?auto_111556 ) ) ( not ( = ?auto_111552 ?auto_111553 ) ) ( not ( = ?auto_111552 ?auto_111554 ) ) ( not ( = ?auto_111552 ?auto_111555 ) ) ( not ( = ?auto_111552 ?auto_111556 ) ) ( not ( = ?auto_111553 ?auto_111554 ) ) ( not ( = ?auto_111553 ?auto_111555 ) ) ( not ( = ?auto_111553 ?auto_111556 ) ) ( not ( = ?auto_111554 ?auto_111555 ) ) ( not ( = ?auto_111554 ?auto_111556 ) ) ( not ( = ?auto_111555 ?auto_111556 ) ) ( ON ?auto_111554 ?auto_111555 ) ( CLEAR ?auto_111552 ) ( ON ?auto_111553 ?auto_111554 ) ( CLEAR ?auto_111553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111549 ?auto_111550 ?auto_111551 ?auto_111552 ?auto_111553 )
      ( MAKE-7PILE ?auto_111549 ?auto_111550 ?auto_111551 ?auto_111552 ?auto_111553 ?auto_111554 ?auto_111555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111579 - BLOCK
      ?auto_111580 - BLOCK
      ?auto_111581 - BLOCK
      ?auto_111582 - BLOCK
      ?auto_111583 - BLOCK
      ?auto_111584 - BLOCK
      ?auto_111585 - BLOCK
    )
    :vars
    (
      ?auto_111586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111585 ?auto_111586 ) ( ON-TABLE ?auto_111579 ) ( ON ?auto_111580 ?auto_111579 ) ( ON ?auto_111581 ?auto_111580 ) ( not ( = ?auto_111579 ?auto_111580 ) ) ( not ( = ?auto_111579 ?auto_111581 ) ) ( not ( = ?auto_111579 ?auto_111582 ) ) ( not ( = ?auto_111579 ?auto_111583 ) ) ( not ( = ?auto_111579 ?auto_111584 ) ) ( not ( = ?auto_111579 ?auto_111585 ) ) ( not ( = ?auto_111579 ?auto_111586 ) ) ( not ( = ?auto_111580 ?auto_111581 ) ) ( not ( = ?auto_111580 ?auto_111582 ) ) ( not ( = ?auto_111580 ?auto_111583 ) ) ( not ( = ?auto_111580 ?auto_111584 ) ) ( not ( = ?auto_111580 ?auto_111585 ) ) ( not ( = ?auto_111580 ?auto_111586 ) ) ( not ( = ?auto_111581 ?auto_111582 ) ) ( not ( = ?auto_111581 ?auto_111583 ) ) ( not ( = ?auto_111581 ?auto_111584 ) ) ( not ( = ?auto_111581 ?auto_111585 ) ) ( not ( = ?auto_111581 ?auto_111586 ) ) ( not ( = ?auto_111582 ?auto_111583 ) ) ( not ( = ?auto_111582 ?auto_111584 ) ) ( not ( = ?auto_111582 ?auto_111585 ) ) ( not ( = ?auto_111582 ?auto_111586 ) ) ( not ( = ?auto_111583 ?auto_111584 ) ) ( not ( = ?auto_111583 ?auto_111585 ) ) ( not ( = ?auto_111583 ?auto_111586 ) ) ( not ( = ?auto_111584 ?auto_111585 ) ) ( not ( = ?auto_111584 ?auto_111586 ) ) ( not ( = ?auto_111585 ?auto_111586 ) ) ( ON ?auto_111584 ?auto_111585 ) ( ON ?auto_111583 ?auto_111584 ) ( CLEAR ?auto_111581 ) ( ON ?auto_111582 ?auto_111583 ) ( CLEAR ?auto_111582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111579 ?auto_111580 ?auto_111581 ?auto_111582 )
      ( MAKE-7PILE ?auto_111579 ?auto_111580 ?auto_111581 ?auto_111582 ?auto_111583 ?auto_111584 ?auto_111585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111609 - BLOCK
      ?auto_111610 - BLOCK
      ?auto_111611 - BLOCK
      ?auto_111612 - BLOCK
      ?auto_111613 - BLOCK
      ?auto_111614 - BLOCK
      ?auto_111615 - BLOCK
    )
    :vars
    (
      ?auto_111616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111615 ?auto_111616 ) ( ON-TABLE ?auto_111609 ) ( ON ?auto_111610 ?auto_111609 ) ( not ( = ?auto_111609 ?auto_111610 ) ) ( not ( = ?auto_111609 ?auto_111611 ) ) ( not ( = ?auto_111609 ?auto_111612 ) ) ( not ( = ?auto_111609 ?auto_111613 ) ) ( not ( = ?auto_111609 ?auto_111614 ) ) ( not ( = ?auto_111609 ?auto_111615 ) ) ( not ( = ?auto_111609 ?auto_111616 ) ) ( not ( = ?auto_111610 ?auto_111611 ) ) ( not ( = ?auto_111610 ?auto_111612 ) ) ( not ( = ?auto_111610 ?auto_111613 ) ) ( not ( = ?auto_111610 ?auto_111614 ) ) ( not ( = ?auto_111610 ?auto_111615 ) ) ( not ( = ?auto_111610 ?auto_111616 ) ) ( not ( = ?auto_111611 ?auto_111612 ) ) ( not ( = ?auto_111611 ?auto_111613 ) ) ( not ( = ?auto_111611 ?auto_111614 ) ) ( not ( = ?auto_111611 ?auto_111615 ) ) ( not ( = ?auto_111611 ?auto_111616 ) ) ( not ( = ?auto_111612 ?auto_111613 ) ) ( not ( = ?auto_111612 ?auto_111614 ) ) ( not ( = ?auto_111612 ?auto_111615 ) ) ( not ( = ?auto_111612 ?auto_111616 ) ) ( not ( = ?auto_111613 ?auto_111614 ) ) ( not ( = ?auto_111613 ?auto_111615 ) ) ( not ( = ?auto_111613 ?auto_111616 ) ) ( not ( = ?auto_111614 ?auto_111615 ) ) ( not ( = ?auto_111614 ?auto_111616 ) ) ( not ( = ?auto_111615 ?auto_111616 ) ) ( ON ?auto_111614 ?auto_111615 ) ( ON ?auto_111613 ?auto_111614 ) ( ON ?auto_111612 ?auto_111613 ) ( CLEAR ?auto_111610 ) ( ON ?auto_111611 ?auto_111612 ) ( CLEAR ?auto_111611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111609 ?auto_111610 ?auto_111611 )
      ( MAKE-7PILE ?auto_111609 ?auto_111610 ?auto_111611 ?auto_111612 ?auto_111613 ?auto_111614 ?auto_111615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111639 - BLOCK
      ?auto_111640 - BLOCK
      ?auto_111641 - BLOCK
      ?auto_111642 - BLOCK
      ?auto_111643 - BLOCK
      ?auto_111644 - BLOCK
      ?auto_111645 - BLOCK
    )
    :vars
    (
      ?auto_111646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111645 ?auto_111646 ) ( ON-TABLE ?auto_111639 ) ( not ( = ?auto_111639 ?auto_111640 ) ) ( not ( = ?auto_111639 ?auto_111641 ) ) ( not ( = ?auto_111639 ?auto_111642 ) ) ( not ( = ?auto_111639 ?auto_111643 ) ) ( not ( = ?auto_111639 ?auto_111644 ) ) ( not ( = ?auto_111639 ?auto_111645 ) ) ( not ( = ?auto_111639 ?auto_111646 ) ) ( not ( = ?auto_111640 ?auto_111641 ) ) ( not ( = ?auto_111640 ?auto_111642 ) ) ( not ( = ?auto_111640 ?auto_111643 ) ) ( not ( = ?auto_111640 ?auto_111644 ) ) ( not ( = ?auto_111640 ?auto_111645 ) ) ( not ( = ?auto_111640 ?auto_111646 ) ) ( not ( = ?auto_111641 ?auto_111642 ) ) ( not ( = ?auto_111641 ?auto_111643 ) ) ( not ( = ?auto_111641 ?auto_111644 ) ) ( not ( = ?auto_111641 ?auto_111645 ) ) ( not ( = ?auto_111641 ?auto_111646 ) ) ( not ( = ?auto_111642 ?auto_111643 ) ) ( not ( = ?auto_111642 ?auto_111644 ) ) ( not ( = ?auto_111642 ?auto_111645 ) ) ( not ( = ?auto_111642 ?auto_111646 ) ) ( not ( = ?auto_111643 ?auto_111644 ) ) ( not ( = ?auto_111643 ?auto_111645 ) ) ( not ( = ?auto_111643 ?auto_111646 ) ) ( not ( = ?auto_111644 ?auto_111645 ) ) ( not ( = ?auto_111644 ?auto_111646 ) ) ( not ( = ?auto_111645 ?auto_111646 ) ) ( ON ?auto_111644 ?auto_111645 ) ( ON ?auto_111643 ?auto_111644 ) ( ON ?auto_111642 ?auto_111643 ) ( ON ?auto_111641 ?auto_111642 ) ( CLEAR ?auto_111639 ) ( ON ?auto_111640 ?auto_111641 ) ( CLEAR ?auto_111640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111639 ?auto_111640 )
      ( MAKE-7PILE ?auto_111639 ?auto_111640 ?auto_111641 ?auto_111642 ?auto_111643 ?auto_111644 ?auto_111645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111669 - BLOCK
      ?auto_111670 - BLOCK
      ?auto_111671 - BLOCK
      ?auto_111672 - BLOCK
      ?auto_111673 - BLOCK
      ?auto_111674 - BLOCK
      ?auto_111675 - BLOCK
    )
    :vars
    (
      ?auto_111676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111675 ?auto_111676 ) ( not ( = ?auto_111669 ?auto_111670 ) ) ( not ( = ?auto_111669 ?auto_111671 ) ) ( not ( = ?auto_111669 ?auto_111672 ) ) ( not ( = ?auto_111669 ?auto_111673 ) ) ( not ( = ?auto_111669 ?auto_111674 ) ) ( not ( = ?auto_111669 ?auto_111675 ) ) ( not ( = ?auto_111669 ?auto_111676 ) ) ( not ( = ?auto_111670 ?auto_111671 ) ) ( not ( = ?auto_111670 ?auto_111672 ) ) ( not ( = ?auto_111670 ?auto_111673 ) ) ( not ( = ?auto_111670 ?auto_111674 ) ) ( not ( = ?auto_111670 ?auto_111675 ) ) ( not ( = ?auto_111670 ?auto_111676 ) ) ( not ( = ?auto_111671 ?auto_111672 ) ) ( not ( = ?auto_111671 ?auto_111673 ) ) ( not ( = ?auto_111671 ?auto_111674 ) ) ( not ( = ?auto_111671 ?auto_111675 ) ) ( not ( = ?auto_111671 ?auto_111676 ) ) ( not ( = ?auto_111672 ?auto_111673 ) ) ( not ( = ?auto_111672 ?auto_111674 ) ) ( not ( = ?auto_111672 ?auto_111675 ) ) ( not ( = ?auto_111672 ?auto_111676 ) ) ( not ( = ?auto_111673 ?auto_111674 ) ) ( not ( = ?auto_111673 ?auto_111675 ) ) ( not ( = ?auto_111673 ?auto_111676 ) ) ( not ( = ?auto_111674 ?auto_111675 ) ) ( not ( = ?auto_111674 ?auto_111676 ) ) ( not ( = ?auto_111675 ?auto_111676 ) ) ( ON ?auto_111674 ?auto_111675 ) ( ON ?auto_111673 ?auto_111674 ) ( ON ?auto_111672 ?auto_111673 ) ( ON ?auto_111671 ?auto_111672 ) ( ON ?auto_111670 ?auto_111671 ) ( ON ?auto_111669 ?auto_111670 ) ( CLEAR ?auto_111669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111669 )
      ( MAKE-7PILE ?auto_111669 ?auto_111670 ?auto_111671 ?auto_111672 ?auto_111673 ?auto_111674 ?auto_111675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111700 - BLOCK
      ?auto_111701 - BLOCK
      ?auto_111702 - BLOCK
      ?auto_111703 - BLOCK
      ?auto_111704 - BLOCK
      ?auto_111705 - BLOCK
      ?auto_111706 - BLOCK
      ?auto_111707 - BLOCK
    )
    :vars
    (
      ?auto_111708 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111706 ) ( ON ?auto_111707 ?auto_111708 ) ( CLEAR ?auto_111707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111700 ) ( ON ?auto_111701 ?auto_111700 ) ( ON ?auto_111702 ?auto_111701 ) ( ON ?auto_111703 ?auto_111702 ) ( ON ?auto_111704 ?auto_111703 ) ( ON ?auto_111705 ?auto_111704 ) ( ON ?auto_111706 ?auto_111705 ) ( not ( = ?auto_111700 ?auto_111701 ) ) ( not ( = ?auto_111700 ?auto_111702 ) ) ( not ( = ?auto_111700 ?auto_111703 ) ) ( not ( = ?auto_111700 ?auto_111704 ) ) ( not ( = ?auto_111700 ?auto_111705 ) ) ( not ( = ?auto_111700 ?auto_111706 ) ) ( not ( = ?auto_111700 ?auto_111707 ) ) ( not ( = ?auto_111700 ?auto_111708 ) ) ( not ( = ?auto_111701 ?auto_111702 ) ) ( not ( = ?auto_111701 ?auto_111703 ) ) ( not ( = ?auto_111701 ?auto_111704 ) ) ( not ( = ?auto_111701 ?auto_111705 ) ) ( not ( = ?auto_111701 ?auto_111706 ) ) ( not ( = ?auto_111701 ?auto_111707 ) ) ( not ( = ?auto_111701 ?auto_111708 ) ) ( not ( = ?auto_111702 ?auto_111703 ) ) ( not ( = ?auto_111702 ?auto_111704 ) ) ( not ( = ?auto_111702 ?auto_111705 ) ) ( not ( = ?auto_111702 ?auto_111706 ) ) ( not ( = ?auto_111702 ?auto_111707 ) ) ( not ( = ?auto_111702 ?auto_111708 ) ) ( not ( = ?auto_111703 ?auto_111704 ) ) ( not ( = ?auto_111703 ?auto_111705 ) ) ( not ( = ?auto_111703 ?auto_111706 ) ) ( not ( = ?auto_111703 ?auto_111707 ) ) ( not ( = ?auto_111703 ?auto_111708 ) ) ( not ( = ?auto_111704 ?auto_111705 ) ) ( not ( = ?auto_111704 ?auto_111706 ) ) ( not ( = ?auto_111704 ?auto_111707 ) ) ( not ( = ?auto_111704 ?auto_111708 ) ) ( not ( = ?auto_111705 ?auto_111706 ) ) ( not ( = ?auto_111705 ?auto_111707 ) ) ( not ( = ?auto_111705 ?auto_111708 ) ) ( not ( = ?auto_111706 ?auto_111707 ) ) ( not ( = ?auto_111706 ?auto_111708 ) ) ( not ( = ?auto_111707 ?auto_111708 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111707 ?auto_111708 )
      ( !STACK ?auto_111707 ?auto_111706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111734 - BLOCK
      ?auto_111735 - BLOCK
      ?auto_111736 - BLOCK
      ?auto_111737 - BLOCK
      ?auto_111738 - BLOCK
      ?auto_111739 - BLOCK
      ?auto_111740 - BLOCK
      ?auto_111741 - BLOCK
    )
    :vars
    (
      ?auto_111742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111741 ?auto_111742 ) ( ON-TABLE ?auto_111734 ) ( ON ?auto_111735 ?auto_111734 ) ( ON ?auto_111736 ?auto_111735 ) ( ON ?auto_111737 ?auto_111736 ) ( ON ?auto_111738 ?auto_111737 ) ( ON ?auto_111739 ?auto_111738 ) ( not ( = ?auto_111734 ?auto_111735 ) ) ( not ( = ?auto_111734 ?auto_111736 ) ) ( not ( = ?auto_111734 ?auto_111737 ) ) ( not ( = ?auto_111734 ?auto_111738 ) ) ( not ( = ?auto_111734 ?auto_111739 ) ) ( not ( = ?auto_111734 ?auto_111740 ) ) ( not ( = ?auto_111734 ?auto_111741 ) ) ( not ( = ?auto_111734 ?auto_111742 ) ) ( not ( = ?auto_111735 ?auto_111736 ) ) ( not ( = ?auto_111735 ?auto_111737 ) ) ( not ( = ?auto_111735 ?auto_111738 ) ) ( not ( = ?auto_111735 ?auto_111739 ) ) ( not ( = ?auto_111735 ?auto_111740 ) ) ( not ( = ?auto_111735 ?auto_111741 ) ) ( not ( = ?auto_111735 ?auto_111742 ) ) ( not ( = ?auto_111736 ?auto_111737 ) ) ( not ( = ?auto_111736 ?auto_111738 ) ) ( not ( = ?auto_111736 ?auto_111739 ) ) ( not ( = ?auto_111736 ?auto_111740 ) ) ( not ( = ?auto_111736 ?auto_111741 ) ) ( not ( = ?auto_111736 ?auto_111742 ) ) ( not ( = ?auto_111737 ?auto_111738 ) ) ( not ( = ?auto_111737 ?auto_111739 ) ) ( not ( = ?auto_111737 ?auto_111740 ) ) ( not ( = ?auto_111737 ?auto_111741 ) ) ( not ( = ?auto_111737 ?auto_111742 ) ) ( not ( = ?auto_111738 ?auto_111739 ) ) ( not ( = ?auto_111738 ?auto_111740 ) ) ( not ( = ?auto_111738 ?auto_111741 ) ) ( not ( = ?auto_111738 ?auto_111742 ) ) ( not ( = ?auto_111739 ?auto_111740 ) ) ( not ( = ?auto_111739 ?auto_111741 ) ) ( not ( = ?auto_111739 ?auto_111742 ) ) ( not ( = ?auto_111740 ?auto_111741 ) ) ( not ( = ?auto_111740 ?auto_111742 ) ) ( not ( = ?auto_111741 ?auto_111742 ) ) ( CLEAR ?auto_111739 ) ( ON ?auto_111740 ?auto_111741 ) ( CLEAR ?auto_111740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111734 ?auto_111735 ?auto_111736 ?auto_111737 ?auto_111738 ?auto_111739 ?auto_111740 )
      ( MAKE-8PILE ?auto_111734 ?auto_111735 ?auto_111736 ?auto_111737 ?auto_111738 ?auto_111739 ?auto_111740 ?auto_111741 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111768 - BLOCK
      ?auto_111769 - BLOCK
      ?auto_111770 - BLOCK
      ?auto_111771 - BLOCK
      ?auto_111772 - BLOCK
      ?auto_111773 - BLOCK
      ?auto_111774 - BLOCK
      ?auto_111775 - BLOCK
    )
    :vars
    (
      ?auto_111776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111775 ?auto_111776 ) ( ON-TABLE ?auto_111768 ) ( ON ?auto_111769 ?auto_111768 ) ( ON ?auto_111770 ?auto_111769 ) ( ON ?auto_111771 ?auto_111770 ) ( ON ?auto_111772 ?auto_111771 ) ( not ( = ?auto_111768 ?auto_111769 ) ) ( not ( = ?auto_111768 ?auto_111770 ) ) ( not ( = ?auto_111768 ?auto_111771 ) ) ( not ( = ?auto_111768 ?auto_111772 ) ) ( not ( = ?auto_111768 ?auto_111773 ) ) ( not ( = ?auto_111768 ?auto_111774 ) ) ( not ( = ?auto_111768 ?auto_111775 ) ) ( not ( = ?auto_111768 ?auto_111776 ) ) ( not ( = ?auto_111769 ?auto_111770 ) ) ( not ( = ?auto_111769 ?auto_111771 ) ) ( not ( = ?auto_111769 ?auto_111772 ) ) ( not ( = ?auto_111769 ?auto_111773 ) ) ( not ( = ?auto_111769 ?auto_111774 ) ) ( not ( = ?auto_111769 ?auto_111775 ) ) ( not ( = ?auto_111769 ?auto_111776 ) ) ( not ( = ?auto_111770 ?auto_111771 ) ) ( not ( = ?auto_111770 ?auto_111772 ) ) ( not ( = ?auto_111770 ?auto_111773 ) ) ( not ( = ?auto_111770 ?auto_111774 ) ) ( not ( = ?auto_111770 ?auto_111775 ) ) ( not ( = ?auto_111770 ?auto_111776 ) ) ( not ( = ?auto_111771 ?auto_111772 ) ) ( not ( = ?auto_111771 ?auto_111773 ) ) ( not ( = ?auto_111771 ?auto_111774 ) ) ( not ( = ?auto_111771 ?auto_111775 ) ) ( not ( = ?auto_111771 ?auto_111776 ) ) ( not ( = ?auto_111772 ?auto_111773 ) ) ( not ( = ?auto_111772 ?auto_111774 ) ) ( not ( = ?auto_111772 ?auto_111775 ) ) ( not ( = ?auto_111772 ?auto_111776 ) ) ( not ( = ?auto_111773 ?auto_111774 ) ) ( not ( = ?auto_111773 ?auto_111775 ) ) ( not ( = ?auto_111773 ?auto_111776 ) ) ( not ( = ?auto_111774 ?auto_111775 ) ) ( not ( = ?auto_111774 ?auto_111776 ) ) ( not ( = ?auto_111775 ?auto_111776 ) ) ( ON ?auto_111774 ?auto_111775 ) ( CLEAR ?auto_111772 ) ( ON ?auto_111773 ?auto_111774 ) ( CLEAR ?auto_111773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111768 ?auto_111769 ?auto_111770 ?auto_111771 ?auto_111772 ?auto_111773 )
      ( MAKE-8PILE ?auto_111768 ?auto_111769 ?auto_111770 ?auto_111771 ?auto_111772 ?auto_111773 ?auto_111774 ?auto_111775 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111802 - BLOCK
      ?auto_111803 - BLOCK
      ?auto_111804 - BLOCK
      ?auto_111805 - BLOCK
      ?auto_111806 - BLOCK
      ?auto_111807 - BLOCK
      ?auto_111808 - BLOCK
      ?auto_111809 - BLOCK
    )
    :vars
    (
      ?auto_111810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111809 ?auto_111810 ) ( ON-TABLE ?auto_111802 ) ( ON ?auto_111803 ?auto_111802 ) ( ON ?auto_111804 ?auto_111803 ) ( ON ?auto_111805 ?auto_111804 ) ( not ( = ?auto_111802 ?auto_111803 ) ) ( not ( = ?auto_111802 ?auto_111804 ) ) ( not ( = ?auto_111802 ?auto_111805 ) ) ( not ( = ?auto_111802 ?auto_111806 ) ) ( not ( = ?auto_111802 ?auto_111807 ) ) ( not ( = ?auto_111802 ?auto_111808 ) ) ( not ( = ?auto_111802 ?auto_111809 ) ) ( not ( = ?auto_111802 ?auto_111810 ) ) ( not ( = ?auto_111803 ?auto_111804 ) ) ( not ( = ?auto_111803 ?auto_111805 ) ) ( not ( = ?auto_111803 ?auto_111806 ) ) ( not ( = ?auto_111803 ?auto_111807 ) ) ( not ( = ?auto_111803 ?auto_111808 ) ) ( not ( = ?auto_111803 ?auto_111809 ) ) ( not ( = ?auto_111803 ?auto_111810 ) ) ( not ( = ?auto_111804 ?auto_111805 ) ) ( not ( = ?auto_111804 ?auto_111806 ) ) ( not ( = ?auto_111804 ?auto_111807 ) ) ( not ( = ?auto_111804 ?auto_111808 ) ) ( not ( = ?auto_111804 ?auto_111809 ) ) ( not ( = ?auto_111804 ?auto_111810 ) ) ( not ( = ?auto_111805 ?auto_111806 ) ) ( not ( = ?auto_111805 ?auto_111807 ) ) ( not ( = ?auto_111805 ?auto_111808 ) ) ( not ( = ?auto_111805 ?auto_111809 ) ) ( not ( = ?auto_111805 ?auto_111810 ) ) ( not ( = ?auto_111806 ?auto_111807 ) ) ( not ( = ?auto_111806 ?auto_111808 ) ) ( not ( = ?auto_111806 ?auto_111809 ) ) ( not ( = ?auto_111806 ?auto_111810 ) ) ( not ( = ?auto_111807 ?auto_111808 ) ) ( not ( = ?auto_111807 ?auto_111809 ) ) ( not ( = ?auto_111807 ?auto_111810 ) ) ( not ( = ?auto_111808 ?auto_111809 ) ) ( not ( = ?auto_111808 ?auto_111810 ) ) ( not ( = ?auto_111809 ?auto_111810 ) ) ( ON ?auto_111808 ?auto_111809 ) ( ON ?auto_111807 ?auto_111808 ) ( CLEAR ?auto_111805 ) ( ON ?auto_111806 ?auto_111807 ) ( CLEAR ?auto_111806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111802 ?auto_111803 ?auto_111804 ?auto_111805 ?auto_111806 )
      ( MAKE-8PILE ?auto_111802 ?auto_111803 ?auto_111804 ?auto_111805 ?auto_111806 ?auto_111807 ?auto_111808 ?auto_111809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111836 - BLOCK
      ?auto_111837 - BLOCK
      ?auto_111838 - BLOCK
      ?auto_111839 - BLOCK
      ?auto_111840 - BLOCK
      ?auto_111841 - BLOCK
      ?auto_111842 - BLOCK
      ?auto_111843 - BLOCK
    )
    :vars
    (
      ?auto_111844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111843 ?auto_111844 ) ( ON-TABLE ?auto_111836 ) ( ON ?auto_111837 ?auto_111836 ) ( ON ?auto_111838 ?auto_111837 ) ( not ( = ?auto_111836 ?auto_111837 ) ) ( not ( = ?auto_111836 ?auto_111838 ) ) ( not ( = ?auto_111836 ?auto_111839 ) ) ( not ( = ?auto_111836 ?auto_111840 ) ) ( not ( = ?auto_111836 ?auto_111841 ) ) ( not ( = ?auto_111836 ?auto_111842 ) ) ( not ( = ?auto_111836 ?auto_111843 ) ) ( not ( = ?auto_111836 ?auto_111844 ) ) ( not ( = ?auto_111837 ?auto_111838 ) ) ( not ( = ?auto_111837 ?auto_111839 ) ) ( not ( = ?auto_111837 ?auto_111840 ) ) ( not ( = ?auto_111837 ?auto_111841 ) ) ( not ( = ?auto_111837 ?auto_111842 ) ) ( not ( = ?auto_111837 ?auto_111843 ) ) ( not ( = ?auto_111837 ?auto_111844 ) ) ( not ( = ?auto_111838 ?auto_111839 ) ) ( not ( = ?auto_111838 ?auto_111840 ) ) ( not ( = ?auto_111838 ?auto_111841 ) ) ( not ( = ?auto_111838 ?auto_111842 ) ) ( not ( = ?auto_111838 ?auto_111843 ) ) ( not ( = ?auto_111838 ?auto_111844 ) ) ( not ( = ?auto_111839 ?auto_111840 ) ) ( not ( = ?auto_111839 ?auto_111841 ) ) ( not ( = ?auto_111839 ?auto_111842 ) ) ( not ( = ?auto_111839 ?auto_111843 ) ) ( not ( = ?auto_111839 ?auto_111844 ) ) ( not ( = ?auto_111840 ?auto_111841 ) ) ( not ( = ?auto_111840 ?auto_111842 ) ) ( not ( = ?auto_111840 ?auto_111843 ) ) ( not ( = ?auto_111840 ?auto_111844 ) ) ( not ( = ?auto_111841 ?auto_111842 ) ) ( not ( = ?auto_111841 ?auto_111843 ) ) ( not ( = ?auto_111841 ?auto_111844 ) ) ( not ( = ?auto_111842 ?auto_111843 ) ) ( not ( = ?auto_111842 ?auto_111844 ) ) ( not ( = ?auto_111843 ?auto_111844 ) ) ( ON ?auto_111842 ?auto_111843 ) ( ON ?auto_111841 ?auto_111842 ) ( ON ?auto_111840 ?auto_111841 ) ( CLEAR ?auto_111838 ) ( ON ?auto_111839 ?auto_111840 ) ( CLEAR ?auto_111839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111836 ?auto_111837 ?auto_111838 ?auto_111839 )
      ( MAKE-8PILE ?auto_111836 ?auto_111837 ?auto_111838 ?auto_111839 ?auto_111840 ?auto_111841 ?auto_111842 ?auto_111843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111870 - BLOCK
      ?auto_111871 - BLOCK
      ?auto_111872 - BLOCK
      ?auto_111873 - BLOCK
      ?auto_111874 - BLOCK
      ?auto_111875 - BLOCK
      ?auto_111876 - BLOCK
      ?auto_111877 - BLOCK
    )
    :vars
    (
      ?auto_111878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111877 ?auto_111878 ) ( ON-TABLE ?auto_111870 ) ( ON ?auto_111871 ?auto_111870 ) ( not ( = ?auto_111870 ?auto_111871 ) ) ( not ( = ?auto_111870 ?auto_111872 ) ) ( not ( = ?auto_111870 ?auto_111873 ) ) ( not ( = ?auto_111870 ?auto_111874 ) ) ( not ( = ?auto_111870 ?auto_111875 ) ) ( not ( = ?auto_111870 ?auto_111876 ) ) ( not ( = ?auto_111870 ?auto_111877 ) ) ( not ( = ?auto_111870 ?auto_111878 ) ) ( not ( = ?auto_111871 ?auto_111872 ) ) ( not ( = ?auto_111871 ?auto_111873 ) ) ( not ( = ?auto_111871 ?auto_111874 ) ) ( not ( = ?auto_111871 ?auto_111875 ) ) ( not ( = ?auto_111871 ?auto_111876 ) ) ( not ( = ?auto_111871 ?auto_111877 ) ) ( not ( = ?auto_111871 ?auto_111878 ) ) ( not ( = ?auto_111872 ?auto_111873 ) ) ( not ( = ?auto_111872 ?auto_111874 ) ) ( not ( = ?auto_111872 ?auto_111875 ) ) ( not ( = ?auto_111872 ?auto_111876 ) ) ( not ( = ?auto_111872 ?auto_111877 ) ) ( not ( = ?auto_111872 ?auto_111878 ) ) ( not ( = ?auto_111873 ?auto_111874 ) ) ( not ( = ?auto_111873 ?auto_111875 ) ) ( not ( = ?auto_111873 ?auto_111876 ) ) ( not ( = ?auto_111873 ?auto_111877 ) ) ( not ( = ?auto_111873 ?auto_111878 ) ) ( not ( = ?auto_111874 ?auto_111875 ) ) ( not ( = ?auto_111874 ?auto_111876 ) ) ( not ( = ?auto_111874 ?auto_111877 ) ) ( not ( = ?auto_111874 ?auto_111878 ) ) ( not ( = ?auto_111875 ?auto_111876 ) ) ( not ( = ?auto_111875 ?auto_111877 ) ) ( not ( = ?auto_111875 ?auto_111878 ) ) ( not ( = ?auto_111876 ?auto_111877 ) ) ( not ( = ?auto_111876 ?auto_111878 ) ) ( not ( = ?auto_111877 ?auto_111878 ) ) ( ON ?auto_111876 ?auto_111877 ) ( ON ?auto_111875 ?auto_111876 ) ( ON ?auto_111874 ?auto_111875 ) ( ON ?auto_111873 ?auto_111874 ) ( CLEAR ?auto_111871 ) ( ON ?auto_111872 ?auto_111873 ) ( CLEAR ?auto_111872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111870 ?auto_111871 ?auto_111872 )
      ( MAKE-8PILE ?auto_111870 ?auto_111871 ?auto_111872 ?auto_111873 ?auto_111874 ?auto_111875 ?auto_111876 ?auto_111877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111904 - BLOCK
      ?auto_111905 - BLOCK
      ?auto_111906 - BLOCK
      ?auto_111907 - BLOCK
      ?auto_111908 - BLOCK
      ?auto_111909 - BLOCK
      ?auto_111910 - BLOCK
      ?auto_111911 - BLOCK
    )
    :vars
    (
      ?auto_111912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111911 ?auto_111912 ) ( ON-TABLE ?auto_111904 ) ( not ( = ?auto_111904 ?auto_111905 ) ) ( not ( = ?auto_111904 ?auto_111906 ) ) ( not ( = ?auto_111904 ?auto_111907 ) ) ( not ( = ?auto_111904 ?auto_111908 ) ) ( not ( = ?auto_111904 ?auto_111909 ) ) ( not ( = ?auto_111904 ?auto_111910 ) ) ( not ( = ?auto_111904 ?auto_111911 ) ) ( not ( = ?auto_111904 ?auto_111912 ) ) ( not ( = ?auto_111905 ?auto_111906 ) ) ( not ( = ?auto_111905 ?auto_111907 ) ) ( not ( = ?auto_111905 ?auto_111908 ) ) ( not ( = ?auto_111905 ?auto_111909 ) ) ( not ( = ?auto_111905 ?auto_111910 ) ) ( not ( = ?auto_111905 ?auto_111911 ) ) ( not ( = ?auto_111905 ?auto_111912 ) ) ( not ( = ?auto_111906 ?auto_111907 ) ) ( not ( = ?auto_111906 ?auto_111908 ) ) ( not ( = ?auto_111906 ?auto_111909 ) ) ( not ( = ?auto_111906 ?auto_111910 ) ) ( not ( = ?auto_111906 ?auto_111911 ) ) ( not ( = ?auto_111906 ?auto_111912 ) ) ( not ( = ?auto_111907 ?auto_111908 ) ) ( not ( = ?auto_111907 ?auto_111909 ) ) ( not ( = ?auto_111907 ?auto_111910 ) ) ( not ( = ?auto_111907 ?auto_111911 ) ) ( not ( = ?auto_111907 ?auto_111912 ) ) ( not ( = ?auto_111908 ?auto_111909 ) ) ( not ( = ?auto_111908 ?auto_111910 ) ) ( not ( = ?auto_111908 ?auto_111911 ) ) ( not ( = ?auto_111908 ?auto_111912 ) ) ( not ( = ?auto_111909 ?auto_111910 ) ) ( not ( = ?auto_111909 ?auto_111911 ) ) ( not ( = ?auto_111909 ?auto_111912 ) ) ( not ( = ?auto_111910 ?auto_111911 ) ) ( not ( = ?auto_111910 ?auto_111912 ) ) ( not ( = ?auto_111911 ?auto_111912 ) ) ( ON ?auto_111910 ?auto_111911 ) ( ON ?auto_111909 ?auto_111910 ) ( ON ?auto_111908 ?auto_111909 ) ( ON ?auto_111907 ?auto_111908 ) ( ON ?auto_111906 ?auto_111907 ) ( CLEAR ?auto_111904 ) ( ON ?auto_111905 ?auto_111906 ) ( CLEAR ?auto_111905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111904 ?auto_111905 )
      ( MAKE-8PILE ?auto_111904 ?auto_111905 ?auto_111906 ?auto_111907 ?auto_111908 ?auto_111909 ?auto_111910 ?auto_111911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_111938 - BLOCK
      ?auto_111939 - BLOCK
      ?auto_111940 - BLOCK
      ?auto_111941 - BLOCK
      ?auto_111942 - BLOCK
      ?auto_111943 - BLOCK
      ?auto_111944 - BLOCK
      ?auto_111945 - BLOCK
    )
    :vars
    (
      ?auto_111946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111945 ?auto_111946 ) ( not ( = ?auto_111938 ?auto_111939 ) ) ( not ( = ?auto_111938 ?auto_111940 ) ) ( not ( = ?auto_111938 ?auto_111941 ) ) ( not ( = ?auto_111938 ?auto_111942 ) ) ( not ( = ?auto_111938 ?auto_111943 ) ) ( not ( = ?auto_111938 ?auto_111944 ) ) ( not ( = ?auto_111938 ?auto_111945 ) ) ( not ( = ?auto_111938 ?auto_111946 ) ) ( not ( = ?auto_111939 ?auto_111940 ) ) ( not ( = ?auto_111939 ?auto_111941 ) ) ( not ( = ?auto_111939 ?auto_111942 ) ) ( not ( = ?auto_111939 ?auto_111943 ) ) ( not ( = ?auto_111939 ?auto_111944 ) ) ( not ( = ?auto_111939 ?auto_111945 ) ) ( not ( = ?auto_111939 ?auto_111946 ) ) ( not ( = ?auto_111940 ?auto_111941 ) ) ( not ( = ?auto_111940 ?auto_111942 ) ) ( not ( = ?auto_111940 ?auto_111943 ) ) ( not ( = ?auto_111940 ?auto_111944 ) ) ( not ( = ?auto_111940 ?auto_111945 ) ) ( not ( = ?auto_111940 ?auto_111946 ) ) ( not ( = ?auto_111941 ?auto_111942 ) ) ( not ( = ?auto_111941 ?auto_111943 ) ) ( not ( = ?auto_111941 ?auto_111944 ) ) ( not ( = ?auto_111941 ?auto_111945 ) ) ( not ( = ?auto_111941 ?auto_111946 ) ) ( not ( = ?auto_111942 ?auto_111943 ) ) ( not ( = ?auto_111942 ?auto_111944 ) ) ( not ( = ?auto_111942 ?auto_111945 ) ) ( not ( = ?auto_111942 ?auto_111946 ) ) ( not ( = ?auto_111943 ?auto_111944 ) ) ( not ( = ?auto_111943 ?auto_111945 ) ) ( not ( = ?auto_111943 ?auto_111946 ) ) ( not ( = ?auto_111944 ?auto_111945 ) ) ( not ( = ?auto_111944 ?auto_111946 ) ) ( not ( = ?auto_111945 ?auto_111946 ) ) ( ON ?auto_111944 ?auto_111945 ) ( ON ?auto_111943 ?auto_111944 ) ( ON ?auto_111942 ?auto_111943 ) ( ON ?auto_111941 ?auto_111942 ) ( ON ?auto_111940 ?auto_111941 ) ( ON ?auto_111939 ?auto_111940 ) ( ON ?auto_111938 ?auto_111939 ) ( CLEAR ?auto_111938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111938 )
      ( MAKE-8PILE ?auto_111938 ?auto_111939 ?auto_111940 ?auto_111941 ?auto_111942 ?auto_111943 ?auto_111944 ?auto_111945 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_111973 - BLOCK
      ?auto_111974 - BLOCK
      ?auto_111975 - BLOCK
      ?auto_111976 - BLOCK
      ?auto_111977 - BLOCK
      ?auto_111978 - BLOCK
      ?auto_111979 - BLOCK
      ?auto_111980 - BLOCK
      ?auto_111981 - BLOCK
    )
    :vars
    (
      ?auto_111982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111980 ) ( ON ?auto_111981 ?auto_111982 ) ( CLEAR ?auto_111981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111973 ) ( ON ?auto_111974 ?auto_111973 ) ( ON ?auto_111975 ?auto_111974 ) ( ON ?auto_111976 ?auto_111975 ) ( ON ?auto_111977 ?auto_111976 ) ( ON ?auto_111978 ?auto_111977 ) ( ON ?auto_111979 ?auto_111978 ) ( ON ?auto_111980 ?auto_111979 ) ( not ( = ?auto_111973 ?auto_111974 ) ) ( not ( = ?auto_111973 ?auto_111975 ) ) ( not ( = ?auto_111973 ?auto_111976 ) ) ( not ( = ?auto_111973 ?auto_111977 ) ) ( not ( = ?auto_111973 ?auto_111978 ) ) ( not ( = ?auto_111973 ?auto_111979 ) ) ( not ( = ?auto_111973 ?auto_111980 ) ) ( not ( = ?auto_111973 ?auto_111981 ) ) ( not ( = ?auto_111973 ?auto_111982 ) ) ( not ( = ?auto_111974 ?auto_111975 ) ) ( not ( = ?auto_111974 ?auto_111976 ) ) ( not ( = ?auto_111974 ?auto_111977 ) ) ( not ( = ?auto_111974 ?auto_111978 ) ) ( not ( = ?auto_111974 ?auto_111979 ) ) ( not ( = ?auto_111974 ?auto_111980 ) ) ( not ( = ?auto_111974 ?auto_111981 ) ) ( not ( = ?auto_111974 ?auto_111982 ) ) ( not ( = ?auto_111975 ?auto_111976 ) ) ( not ( = ?auto_111975 ?auto_111977 ) ) ( not ( = ?auto_111975 ?auto_111978 ) ) ( not ( = ?auto_111975 ?auto_111979 ) ) ( not ( = ?auto_111975 ?auto_111980 ) ) ( not ( = ?auto_111975 ?auto_111981 ) ) ( not ( = ?auto_111975 ?auto_111982 ) ) ( not ( = ?auto_111976 ?auto_111977 ) ) ( not ( = ?auto_111976 ?auto_111978 ) ) ( not ( = ?auto_111976 ?auto_111979 ) ) ( not ( = ?auto_111976 ?auto_111980 ) ) ( not ( = ?auto_111976 ?auto_111981 ) ) ( not ( = ?auto_111976 ?auto_111982 ) ) ( not ( = ?auto_111977 ?auto_111978 ) ) ( not ( = ?auto_111977 ?auto_111979 ) ) ( not ( = ?auto_111977 ?auto_111980 ) ) ( not ( = ?auto_111977 ?auto_111981 ) ) ( not ( = ?auto_111977 ?auto_111982 ) ) ( not ( = ?auto_111978 ?auto_111979 ) ) ( not ( = ?auto_111978 ?auto_111980 ) ) ( not ( = ?auto_111978 ?auto_111981 ) ) ( not ( = ?auto_111978 ?auto_111982 ) ) ( not ( = ?auto_111979 ?auto_111980 ) ) ( not ( = ?auto_111979 ?auto_111981 ) ) ( not ( = ?auto_111979 ?auto_111982 ) ) ( not ( = ?auto_111980 ?auto_111981 ) ) ( not ( = ?auto_111980 ?auto_111982 ) ) ( not ( = ?auto_111981 ?auto_111982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111981 ?auto_111982 )
      ( !STACK ?auto_111981 ?auto_111980 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112011 - BLOCK
      ?auto_112012 - BLOCK
      ?auto_112013 - BLOCK
      ?auto_112014 - BLOCK
      ?auto_112015 - BLOCK
      ?auto_112016 - BLOCK
      ?auto_112017 - BLOCK
      ?auto_112018 - BLOCK
      ?auto_112019 - BLOCK
    )
    :vars
    (
      ?auto_112020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112019 ?auto_112020 ) ( ON-TABLE ?auto_112011 ) ( ON ?auto_112012 ?auto_112011 ) ( ON ?auto_112013 ?auto_112012 ) ( ON ?auto_112014 ?auto_112013 ) ( ON ?auto_112015 ?auto_112014 ) ( ON ?auto_112016 ?auto_112015 ) ( ON ?auto_112017 ?auto_112016 ) ( not ( = ?auto_112011 ?auto_112012 ) ) ( not ( = ?auto_112011 ?auto_112013 ) ) ( not ( = ?auto_112011 ?auto_112014 ) ) ( not ( = ?auto_112011 ?auto_112015 ) ) ( not ( = ?auto_112011 ?auto_112016 ) ) ( not ( = ?auto_112011 ?auto_112017 ) ) ( not ( = ?auto_112011 ?auto_112018 ) ) ( not ( = ?auto_112011 ?auto_112019 ) ) ( not ( = ?auto_112011 ?auto_112020 ) ) ( not ( = ?auto_112012 ?auto_112013 ) ) ( not ( = ?auto_112012 ?auto_112014 ) ) ( not ( = ?auto_112012 ?auto_112015 ) ) ( not ( = ?auto_112012 ?auto_112016 ) ) ( not ( = ?auto_112012 ?auto_112017 ) ) ( not ( = ?auto_112012 ?auto_112018 ) ) ( not ( = ?auto_112012 ?auto_112019 ) ) ( not ( = ?auto_112012 ?auto_112020 ) ) ( not ( = ?auto_112013 ?auto_112014 ) ) ( not ( = ?auto_112013 ?auto_112015 ) ) ( not ( = ?auto_112013 ?auto_112016 ) ) ( not ( = ?auto_112013 ?auto_112017 ) ) ( not ( = ?auto_112013 ?auto_112018 ) ) ( not ( = ?auto_112013 ?auto_112019 ) ) ( not ( = ?auto_112013 ?auto_112020 ) ) ( not ( = ?auto_112014 ?auto_112015 ) ) ( not ( = ?auto_112014 ?auto_112016 ) ) ( not ( = ?auto_112014 ?auto_112017 ) ) ( not ( = ?auto_112014 ?auto_112018 ) ) ( not ( = ?auto_112014 ?auto_112019 ) ) ( not ( = ?auto_112014 ?auto_112020 ) ) ( not ( = ?auto_112015 ?auto_112016 ) ) ( not ( = ?auto_112015 ?auto_112017 ) ) ( not ( = ?auto_112015 ?auto_112018 ) ) ( not ( = ?auto_112015 ?auto_112019 ) ) ( not ( = ?auto_112015 ?auto_112020 ) ) ( not ( = ?auto_112016 ?auto_112017 ) ) ( not ( = ?auto_112016 ?auto_112018 ) ) ( not ( = ?auto_112016 ?auto_112019 ) ) ( not ( = ?auto_112016 ?auto_112020 ) ) ( not ( = ?auto_112017 ?auto_112018 ) ) ( not ( = ?auto_112017 ?auto_112019 ) ) ( not ( = ?auto_112017 ?auto_112020 ) ) ( not ( = ?auto_112018 ?auto_112019 ) ) ( not ( = ?auto_112018 ?auto_112020 ) ) ( not ( = ?auto_112019 ?auto_112020 ) ) ( CLEAR ?auto_112017 ) ( ON ?auto_112018 ?auto_112019 ) ( CLEAR ?auto_112018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_112011 ?auto_112012 ?auto_112013 ?auto_112014 ?auto_112015 ?auto_112016 ?auto_112017 ?auto_112018 )
      ( MAKE-9PILE ?auto_112011 ?auto_112012 ?auto_112013 ?auto_112014 ?auto_112015 ?auto_112016 ?auto_112017 ?auto_112018 ?auto_112019 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112049 - BLOCK
      ?auto_112050 - BLOCK
      ?auto_112051 - BLOCK
      ?auto_112052 - BLOCK
      ?auto_112053 - BLOCK
      ?auto_112054 - BLOCK
      ?auto_112055 - BLOCK
      ?auto_112056 - BLOCK
      ?auto_112057 - BLOCK
    )
    :vars
    (
      ?auto_112058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112057 ?auto_112058 ) ( ON-TABLE ?auto_112049 ) ( ON ?auto_112050 ?auto_112049 ) ( ON ?auto_112051 ?auto_112050 ) ( ON ?auto_112052 ?auto_112051 ) ( ON ?auto_112053 ?auto_112052 ) ( ON ?auto_112054 ?auto_112053 ) ( not ( = ?auto_112049 ?auto_112050 ) ) ( not ( = ?auto_112049 ?auto_112051 ) ) ( not ( = ?auto_112049 ?auto_112052 ) ) ( not ( = ?auto_112049 ?auto_112053 ) ) ( not ( = ?auto_112049 ?auto_112054 ) ) ( not ( = ?auto_112049 ?auto_112055 ) ) ( not ( = ?auto_112049 ?auto_112056 ) ) ( not ( = ?auto_112049 ?auto_112057 ) ) ( not ( = ?auto_112049 ?auto_112058 ) ) ( not ( = ?auto_112050 ?auto_112051 ) ) ( not ( = ?auto_112050 ?auto_112052 ) ) ( not ( = ?auto_112050 ?auto_112053 ) ) ( not ( = ?auto_112050 ?auto_112054 ) ) ( not ( = ?auto_112050 ?auto_112055 ) ) ( not ( = ?auto_112050 ?auto_112056 ) ) ( not ( = ?auto_112050 ?auto_112057 ) ) ( not ( = ?auto_112050 ?auto_112058 ) ) ( not ( = ?auto_112051 ?auto_112052 ) ) ( not ( = ?auto_112051 ?auto_112053 ) ) ( not ( = ?auto_112051 ?auto_112054 ) ) ( not ( = ?auto_112051 ?auto_112055 ) ) ( not ( = ?auto_112051 ?auto_112056 ) ) ( not ( = ?auto_112051 ?auto_112057 ) ) ( not ( = ?auto_112051 ?auto_112058 ) ) ( not ( = ?auto_112052 ?auto_112053 ) ) ( not ( = ?auto_112052 ?auto_112054 ) ) ( not ( = ?auto_112052 ?auto_112055 ) ) ( not ( = ?auto_112052 ?auto_112056 ) ) ( not ( = ?auto_112052 ?auto_112057 ) ) ( not ( = ?auto_112052 ?auto_112058 ) ) ( not ( = ?auto_112053 ?auto_112054 ) ) ( not ( = ?auto_112053 ?auto_112055 ) ) ( not ( = ?auto_112053 ?auto_112056 ) ) ( not ( = ?auto_112053 ?auto_112057 ) ) ( not ( = ?auto_112053 ?auto_112058 ) ) ( not ( = ?auto_112054 ?auto_112055 ) ) ( not ( = ?auto_112054 ?auto_112056 ) ) ( not ( = ?auto_112054 ?auto_112057 ) ) ( not ( = ?auto_112054 ?auto_112058 ) ) ( not ( = ?auto_112055 ?auto_112056 ) ) ( not ( = ?auto_112055 ?auto_112057 ) ) ( not ( = ?auto_112055 ?auto_112058 ) ) ( not ( = ?auto_112056 ?auto_112057 ) ) ( not ( = ?auto_112056 ?auto_112058 ) ) ( not ( = ?auto_112057 ?auto_112058 ) ) ( ON ?auto_112056 ?auto_112057 ) ( CLEAR ?auto_112054 ) ( ON ?auto_112055 ?auto_112056 ) ( CLEAR ?auto_112055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112049 ?auto_112050 ?auto_112051 ?auto_112052 ?auto_112053 ?auto_112054 ?auto_112055 )
      ( MAKE-9PILE ?auto_112049 ?auto_112050 ?auto_112051 ?auto_112052 ?auto_112053 ?auto_112054 ?auto_112055 ?auto_112056 ?auto_112057 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112087 - BLOCK
      ?auto_112088 - BLOCK
      ?auto_112089 - BLOCK
      ?auto_112090 - BLOCK
      ?auto_112091 - BLOCK
      ?auto_112092 - BLOCK
      ?auto_112093 - BLOCK
      ?auto_112094 - BLOCK
      ?auto_112095 - BLOCK
    )
    :vars
    (
      ?auto_112096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112095 ?auto_112096 ) ( ON-TABLE ?auto_112087 ) ( ON ?auto_112088 ?auto_112087 ) ( ON ?auto_112089 ?auto_112088 ) ( ON ?auto_112090 ?auto_112089 ) ( ON ?auto_112091 ?auto_112090 ) ( not ( = ?auto_112087 ?auto_112088 ) ) ( not ( = ?auto_112087 ?auto_112089 ) ) ( not ( = ?auto_112087 ?auto_112090 ) ) ( not ( = ?auto_112087 ?auto_112091 ) ) ( not ( = ?auto_112087 ?auto_112092 ) ) ( not ( = ?auto_112087 ?auto_112093 ) ) ( not ( = ?auto_112087 ?auto_112094 ) ) ( not ( = ?auto_112087 ?auto_112095 ) ) ( not ( = ?auto_112087 ?auto_112096 ) ) ( not ( = ?auto_112088 ?auto_112089 ) ) ( not ( = ?auto_112088 ?auto_112090 ) ) ( not ( = ?auto_112088 ?auto_112091 ) ) ( not ( = ?auto_112088 ?auto_112092 ) ) ( not ( = ?auto_112088 ?auto_112093 ) ) ( not ( = ?auto_112088 ?auto_112094 ) ) ( not ( = ?auto_112088 ?auto_112095 ) ) ( not ( = ?auto_112088 ?auto_112096 ) ) ( not ( = ?auto_112089 ?auto_112090 ) ) ( not ( = ?auto_112089 ?auto_112091 ) ) ( not ( = ?auto_112089 ?auto_112092 ) ) ( not ( = ?auto_112089 ?auto_112093 ) ) ( not ( = ?auto_112089 ?auto_112094 ) ) ( not ( = ?auto_112089 ?auto_112095 ) ) ( not ( = ?auto_112089 ?auto_112096 ) ) ( not ( = ?auto_112090 ?auto_112091 ) ) ( not ( = ?auto_112090 ?auto_112092 ) ) ( not ( = ?auto_112090 ?auto_112093 ) ) ( not ( = ?auto_112090 ?auto_112094 ) ) ( not ( = ?auto_112090 ?auto_112095 ) ) ( not ( = ?auto_112090 ?auto_112096 ) ) ( not ( = ?auto_112091 ?auto_112092 ) ) ( not ( = ?auto_112091 ?auto_112093 ) ) ( not ( = ?auto_112091 ?auto_112094 ) ) ( not ( = ?auto_112091 ?auto_112095 ) ) ( not ( = ?auto_112091 ?auto_112096 ) ) ( not ( = ?auto_112092 ?auto_112093 ) ) ( not ( = ?auto_112092 ?auto_112094 ) ) ( not ( = ?auto_112092 ?auto_112095 ) ) ( not ( = ?auto_112092 ?auto_112096 ) ) ( not ( = ?auto_112093 ?auto_112094 ) ) ( not ( = ?auto_112093 ?auto_112095 ) ) ( not ( = ?auto_112093 ?auto_112096 ) ) ( not ( = ?auto_112094 ?auto_112095 ) ) ( not ( = ?auto_112094 ?auto_112096 ) ) ( not ( = ?auto_112095 ?auto_112096 ) ) ( ON ?auto_112094 ?auto_112095 ) ( ON ?auto_112093 ?auto_112094 ) ( CLEAR ?auto_112091 ) ( ON ?auto_112092 ?auto_112093 ) ( CLEAR ?auto_112092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112087 ?auto_112088 ?auto_112089 ?auto_112090 ?auto_112091 ?auto_112092 )
      ( MAKE-9PILE ?auto_112087 ?auto_112088 ?auto_112089 ?auto_112090 ?auto_112091 ?auto_112092 ?auto_112093 ?auto_112094 ?auto_112095 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112125 - BLOCK
      ?auto_112126 - BLOCK
      ?auto_112127 - BLOCK
      ?auto_112128 - BLOCK
      ?auto_112129 - BLOCK
      ?auto_112130 - BLOCK
      ?auto_112131 - BLOCK
      ?auto_112132 - BLOCK
      ?auto_112133 - BLOCK
    )
    :vars
    (
      ?auto_112134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112133 ?auto_112134 ) ( ON-TABLE ?auto_112125 ) ( ON ?auto_112126 ?auto_112125 ) ( ON ?auto_112127 ?auto_112126 ) ( ON ?auto_112128 ?auto_112127 ) ( not ( = ?auto_112125 ?auto_112126 ) ) ( not ( = ?auto_112125 ?auto_112127 ) ) ( not ( = ?auto_112125 ?auto_112128 ) ) ( not ( = ?auto_112125 ?auto_112129 ) ) ( not ( = ?auto_112125 ?auto_112130 ) ) ( not ( = ?auto_112125 ?auto_112131 ) ) ( not ( = ?auto_112125 ?auto_112132 ) ) ( not ( = ?auto_112125 ?auto_112133 ) ) ( not ( = ?auto_112125 ?auto_112134 ) ) ( not ( = ?auto_112126 ?auto_112127 ) ) ( not ( = ?auto_112126 ?auto_112128 ) ) ( not ( = ?auto_112126 ?auto_112129 ) ) ( not ( = ?auto_112126 ?auto_112130 ) ) ( not ( = ?auto_112126 ?auto_112131 ) ) ( not ( = ?auto_112126 ?auto_112132 ) ) ( not ( = ?auto_112126 ?auto_112133 ) ) ( not ( = ?auto_112126 ?auto_112134 ) ) ( not ( = ?auto_112127 ?auto_112128 ) ) ( not ( = ?auto_112127 ?auto_112129 ) ) ( not ( = ?auto_112127 ?auto_112130 ) ) ( not ( = ?auto_112127 ?auto_112131 ) ) ( not ( = ?auto_112127 ?auto_112132 ) ) ( not ( = ?auto_112127 ?auto_112133 ) ) ( not ( = ?auto_112127 ?auto_112134 ) ) ( not ( = ?auto_112128 ?auto_112129 ) ) ( not ( = ?auto_112128 ?auto_112130 ) ) ( not ( = ?auto_112128 ?auto_112131 ) ) ( not ( = ?auto_112128 ?auto_112132 ) ) ( not ( = ?auto_112128 ?auto_112133 ) ) ( not ( = ?auto_112128 ?auto_112134 ) ) ( not ( = ?auto_112129 ?auto_112130 ) ) ( not ( = ?auto_112129 ?auto_112131 ) ) ( not ( = ?auto_112129 ?auto_112132 ) ) ( not ( = ?auto_112129 ?auto_112133 ) ) ( not ( = ?auto_112129 ?auto_112134 ) ) ( not ( = ?auto_112130 ?auto_112131 ) ) ( not ( = ?auto_112130 ?auto_112132 ) ) ( not ( = ?auto_112130 ?auto_112133 ) ) ( not ( = ?auto_112130 ?auto_112134 ) ) ( not ( = ?auto_112131 ?auto_112132 ) ) ( not ( = ?auto_112131 ?auto_112133 ) ) ( not ( = ?auto_112131 ?auto_112134 ) ) ( not ( = ?auto_112132 ?auto_112133 ) ) ( not ( = ?auto_112132 ?auto_112134 ) ) ( not ( = ?auto_112133 ?auto_112134 ) ) ( ON ?auto_112132 ?auto_112133 ) ( ON ?auto_112131 ?auto_112132 ) ( ON ?auto_112130 ?auto_112131 ) ( CLEAR ?auto_112128 ) ( ON ?auto_112129 ?auto_112130 ) ( CLEAR ?auto_112129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112125 ?auto_112126 ?auto_112127 ?auto_112128 ?auto_112129 )
      ( MAKE-9PILE ?auto_112125 ?auto_112126 ?auto_112127 ?auto_112128 ?auto_112129 ?auto_112130 ?auto_112131 ?auto_112132 ?auto_112133 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112163 - BLOCK
      ?auto_112164 - BLOCK
      ?auto_112165 - BLOCK
      ?auto_112166 - BLOCK
      ?auto_112167 - BLOCK
      ?auto_112168 - BLOCK
      ?auto_112169 - BLOCK
      ?auto_112170 - BLOCK
      ?auto_112171 - BLOCK
    )
    :vars
    (
      ?auto_112172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112171 ?auto_112172 ) ( ON-TABLE ?auto_112163 ) ( ON ?auto_112164 ?auto_112163 ) ( ON ?auto_112165 ?auto_112164 ) ( not ( = ?auto_112163 ?auto_112164 ) ) ( not ( = ?auto_112163 ?auto_112165 ) ) ( not ( = ?auto_112163 ?auto_112166 ) ) ( not ( = ?auto_112163 ?auto_112167 ) ) ( not ( = ?auto_112163 ?auto_112168 ) ) ( not ( = ?auto_112163 ?auto_112169 ) ) ( not ( = ?auto_112163 ?auto_112170 ) ) ( not ( = ?auto_112163 ?auto_112171 ) ) ( not ( = ?auto_112163 ?auto_112172 ) ) ( not ( = ?auto_112164 ?auto_112165 ) ) ( not ( = ?auto_112164 ?auto_112166 ) ) ( not ( = ?auto_112164 ?auto_112167 ) ) ( not ( = ?auto_112164 ?auto_112168 ) ) ( not ( = ?auto_112164 ?auto_112169 ) ) ( not ( = ?auto_112164 ?auto_112170 ) ) ( not ( = ?auto_112164 ?auto_112171 ) ) ( not ( = ?auto_112164 ?auto_112172 ) ) ( not ( = ?auto_112165 ?auto_112166 ) ) ( not ( = ?auto_112165 ?auto_112167 ) ) ( not ( = ?auto_112165 ?auto_112168 ) ) ( not ( = ?auto_112165 ?auto_112169 ) ) ( not ( = ?auto_112165 ?auto_112170 ) ) ( not ( = ?auto_112165 ?auto_112171 ) ) ( not ( = ?auto_112165 ?auto_112172 ) ) ( not ( = ?auto_112166 ?auto_112167 ) ) ( not ( = ?auto_112166 ?auto_112168 ) ) ( not ( = ?auto_112166 ?auto_112169 ) ) ( not ( = ?auto_112166 ?auto_112170 ) ) ( not ( = ?auto_112166 ?auto_112171 ) ) ( not ( = ?auto_112166 ?auto_112172 ) ) ( not ( = ?auto_112167 ?auto_112168 ) ) ( not ( = ?auto_112167 ?auto_112169 ) ) ( not ( = ?auto_112167 ?auto_112170 ) ) ( not ( = ?auto_112167 ?auto_112171 ) ) ( not ( = ?auto_112167 ?auto_112172 ) ) ( not ( = ?auto_112168 ?auto_112169 ) ) ( not ( = ?auto_112168 ?auto_112170 ) ) ( not ( = ?auto_112168 ?auto_112171 ) ) ( not ( = ?auto_112168 ?auto_112172 ) ) ( not ( = ?auto_112169 ?auto_112170 ) ) ( not ( = ?auto_112169 ?auto_112171 ) ) ( not ( = ?auto_112169 ?auto_112172 ) ) ( not ( = ?auto_112170 ?auto_112171 ) ) ( not ( = ?auto_112170 ?auto_112172 ) ) ( not ( = ?auto_112171 ?auto_112172 ) ) ( ON ?auto_112170 ?auto_112171 ) ( ON ?auto_112169 ?auto_112170 ) ( ON ?auto_112168 ?auto_112169 ) ( ON ?auto_112167 ?auto_112168 ) ( CLEAR ?auto_112165 ) ( ON ?auto_112166 ?auto_112167 ) ( CLEAR ?auto_112166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112163 ?auto_112164 ?auto_112165 ?auto_112166 )
      ( MAKE-9PILE ?auto_112163 ?auto_112164 ?auto_112165 ?auto_112166 ?auto_112167 ?auto_112168 ?auto_112169 ?auto_112170 ?auto_112171 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112201 - BLOCK
      ?auto_112202 - BLOCK
      ?auto_112203 - BLOCK
      ?auto_112204 - BLOCK
      ?auto_112205 - BLOCK
      ?auto_112206 - BLOCK
      ?auto_112207 - BLOCK
      ?auto_112208 - BLOCK
      ?auto_112209 - BLOCK
    )
    :vars
    (
      ?auto_112210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112209 ?auto_112210 ) ( ON-TABLE ?auto_112201 ) ( ON ?auto_112202 ?auto_112201 ) ( not ( = ?auto_112201 ?auto_112202 ) ) ( not ( = ?auto_112201 ?auto_112203 ) ) ( not ( = ?auto_112201 ?auto_112204 ) ) ( not ( = ?auto_112201 ?auto_112205 ) ) ( not ( = ?auto_112201 ?auto_112206 ) ) ( not ( = ?auto_112201 ?auto_112207 ) ) ( not ( = ?auto_112201 ?auto_112208 ) ) ( not ( = ?auto_112201 ?auto_112209 ) ) ( not ( = ?auto_112201 ?auto_112210 ) ) ( not ( = ?auto_112202 ?auto_112203 ) ) ( not ( = ?auto_112202 ?auto_112204 ) ) ( not ( = ?auto_112202 ?auto_112205 ) ) ( not ( = ?auto_112202 ?auto_112206 ) ) ( not ( = ?auto_112202 ?auto_112207 ) ) ( not ( = ?auto_112202 ?auto_112208 ) ) ( not ( = ?auto_112202 ?auto_112209 ) ) ( not ( = ?auto_112202 ?auto_112210 ) ) ( not ( = ?auto_112203 ?auto_112204 ) ) ( not ( = ?auto_112203 ?auto_112205 ) ) ( not ( = ?auto_112203 ?auto_112206 ) ) ( not ( = ?auto_112203 ?auto_112207 ) ) ( not ( = ?auto_112203 ?auto_112208 ) ) ( not ( = ?auto_112203 ?auto_112209 ) ) ( not ( = ?auto_112203 ?auto_112210 ) ) ( not ( = ?auto_112204 ?auto_112205 ) ) ( not ( = ?auto_112204 ?auto_112206 ) ) ( not ( = ?auto_112204 ?auto_112207 ) ) ( not ( = ?auto_112204 ?auto_112208 ) ) ( not ( = ?auto_112204 ?auto_112209 ) ) ( not ( = ?auto_112204 ?auto_112210 ) ) ( not ( = ?auto_112205 ?auto_112206 ) ) ( not ( = ?auto_112205 ?auto_112207 ) ) ( not ( = ?auto_112205 ?auto_112208 ) ) ( not ( = ?auto_112205 ?auto_112209 ) ) ( not ( = ?auto_112205 ?auto_112210 ) ) ( not ( = ?auto_112206 ?auto_112207 ) ) ( not ( = ?auto_112206 ?auto_112208 ) ) ( not ( = ?auto_112206 ?auto_112209 ) ) ( not ( = ?auto_112206 ?auto_112210 ) ) ( not ( = ?auto_112207 ?auto_112208 ) ) ( not ( = ?auto_112207 ?auto_112209 ) ) ( not ( = ?auto_112207 ?auto_112210 ) ) ( not ( = ?auto_112208 ?auto_112209 ) ) ( not ( = ?auto_112208 ?auto_112210 ) ) ( not ( = ?auto_112209 ?auto_112210 ) ) ( ON ?auto_112208 ?auto_112209 ) ( ON ?auto_112207 ?auto_112208 ) ( ON ?auto_112206 ?auto_112207 ) ( ON ?auto_112205 ?auto_112206 ) ( ON ?auto_112204 ?auto_112205 ) ( CLEAR ?auto_112202 ) ( ON ?auto_112203 ?auto_112204 ) ( CLEAR ?auto_112203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112201 ?auto_112202 ?auto_112203 )
      ( MAKE-9PILE ?auto_112201 ?auto_112202 ?auto_112203 ?auto_112204 ?auto_112205 ?auto_112206 ?auto_112207 ?auto_112208 ?auto_112209 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112239 - BLOCK
      ?auto_112240 - BLOCK
      ?auto_112241 - BLOCK
      ?auto_112242 - BLOCK
      ?auto_112243 - BLOCK
      ?auto_112244 - BLOCK
      ?auto_112245 - BLOCK
      ?auto_112246 - BLOCK
      ?auto_112247 - BLOCK
    )
    :vars
    (
      ?auto_112248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112247 ?auto_112248 ) ( ON-TABLE ?auto_112239 ) ( not ( = ?auto_112239 ?auto_112240 ) ) ( not ( = ?auto_112239 ?auto_112241 ) ) ( not ( = ?auto_112239 ?auto_112242 ) ) ( not ( = ?auto_112239 ?auto_112243 ) ) ( not ( = ?auto_112239 ?auto_112244 ) ) ( not ( = ?auto_112239 ?auto_112245 ) ) ( not ( = ?auto_112239 ?auto_112246 ) ) ( not ( = ?auto_112239 ?auto_112247 ) ) ( not ( = ?auto_112239 ?auto_112248 ) ) ( not ( = ?auto_112240 ?auto_112241 ) ) ( not ( = ?auto_112240 ?auto_112242 ) ) ( not ( = ?auto_112240 ?auto_112243 ) ) ( not ( = ?auto_112240 ?auto_112244 ) ) ( not ( = ?auto_112240 ?auto_112245 ) ) ( not ( = ?auto_112240 ?auto_112246 ) ) ( not ( = ?auto_112240 ?auto_112247 ) ) ( not ( = ?auto_112240 ?auto_112248 ) ) ( not ( = ?auto_112241 ?auto_112242 ) ) ( not ( = ?auto_112241 ?auto_112243 ) ) ( not ( = ?auto_112241 ?auto_112244 ) ) ( not ( = ?auto_112241 ?auto_112245 ) ) ( not ( = ?auto_112241 ?auto_112246 ) ) ( not ( = ?auto_112241 ?auto_112247 ) ) ( not ( = ?auto_112241 ?auto_112248 ) ) ( not ( = ?auto_112242 ?auto_112243 ) ) ( not ( = ?auto_112242 ?auto_112244 ) ) ( not ( = ?auto_112242 ?auto_112245 ) ) ( not ( = ?auto_112242 ?auto_112246 ) ) ( not ( = ?auto_112242 ?auto_112247 ) ) ( not ( = ?auto_112242 ?auto_112248 ) ) ( not ( = ?auto_112243 ?auto_112244 ) ) ( not ( = ?auto_112243 ?auto_112245 ) ) ( not ( = ?auto_112243 ?auto_112246 ) ) ( not ( = ?auto_112243 ?auto_112247 ) ) ( not ( = ?auto_112243 ?auto_112248 ) ) ( not ( = ?auto_112244 ?auto_112245 ) ) ( not ( = ?auto_112244 ?auto_112246 ) ) ( not ( = ?auto_112244 ?auto_112247 ) ) ( not ( = ?auto_112244 ?auto_112248 ) ) ( not ( = ?auto_112245 ?auto_112246 ) ) ( not ( = ?auto_112245 ?auto_112247 ) ) ( not ( = ?auto_112245 ?auto_112248 ) ) ( not ( = ?auto_112246 ?auto_112247 ) ) ( not ( = ?auto_112246 ?auto_112248 ) ) ( not ( = ?auto_112247 ?auto_112248 ) ) ( ON ?auto_112246 ?auto_112247 ) ( ON ?auto_112245 ?auto_112246 ) ( ON ?auto_112244 ?auto_112245 ) ( ON ?auto_112243 ?auto_112244 ) ( ON ?auto_112242 ?auto_112243 ) ( ON ?auto_112241 ?auto_112242 ) ( CLEAR ?auto_112239 ) ( ON ?auto_112240 ?auto_112241 ) ( CLEAR ?auto_112240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112239 ?auto_112240 )
      ( MAKE-9PILE ?auto_112239 ?auto_112240 ?auto_112241 ?auto_112242 ?auto_112243 ?auto_112244 ?auto_112245 ?auto_112246 ?auto_112247 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_112277 - BLOCK
      ?auto_112278 - BLOCK
      ?auto_112279 - BLOCK
      ?auto_112280 - BLOCK
      ?auto_112281 - BLOCK
      ?auto_112282 - BLOCK
      ?auto_112283 - BLOCK
      ?auto_112284 - BLOCK
      ?auto_112285 - BLOCK
    )
    :vars
    (
      ?auto_112286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112285 ?auto_112286 ) ( not ( = ?auto_112277 ?auto_112278 ) ) ( not ( = ?auto_112277 ?auto_112279 ) ) ( not ( = ?auto_112277 ?auto_112280 ) ) ( not ( = ?auto_112277 ?auto_112281 ) ) ( not ( = ?auto_112277 ?auto_112282 ) ) ( not ( = ?auto_112277 ?auto_112283 ) ) ( not ( = ?auto_112277 ?auto_112284 ) ) ( not ( = ?auto_112277 ?auto_112285 ) ) ( not ( = ?auto_112277 ?auto_112286 ) ) ( not ( = ?auto_112278 ?auto_112279 ) ) ( not ( = ?auto_112278 ?auto_112280 ) ) ( not ( = ?auto_112278 ?auto_112281 ) ) ( not ( = ?auto_112278 ?auto_112282 ) ) ( not ( = ?auto_112278 ?auto_112283 ) ) ( not ( = ?auto_112278 ?auto_112284 ) ) ( not ( = ?auto_112278 ?auto_112285 ) ) ( not ( = ?auto_112278 ?auto_112286 ) ) ( not ( = ?auto_112279 ?auto_112280 ) ) ( not ( = ?auto_112279 ?auto_112281 ) ) ( not ( = ?auto_112279 ?auto_112282 ) ) ( not ( = ?auto_112279 ?auto_112283 ) ) ( not ( = ?auto_112279 ?auto_112284 ) ) ( not ( = ?auto_112279 ?auto_112285 ) ) ( not ( = ?auto_112279 ?auto_112286 ) ) ( not ( = ?auto_112280 ?auto_112281 ) ) ( not ( = ?auto_112280 ?auto_112282 ) ) ( not ( = ?auto_112280 ?auto_112283 ) ) ( not ( = ?auto_112280 ?auto_112284 ) ) ( not ( = ?auto_112280 ?auto_112285 ) ) ( not ( = ?auto_112280 ?auto_112286 ) ) ( not ( = ?auto_112281 ?auto_112282 ) ) ( not ( = ?auto_112281 ?auto_112283 ) ) ( not ( = ?auto_112281 ?auto_112284 ) ) ( not ( = ?auto_112281 ?auto_112285 ) ) ( not ( = ?auto_112281 ?auto_112286 ) ) ( not ( = ?auto_112282 ?auto_112283 ) ) ( not ( = ?auto_112282 ?auto_112284 ) ) ( not ( = ?auto_112282 ?auto_112285 ) ) ( not ( = ?auto_112282 ?auto_112286 ) ) ( not ( = ?auto_112283 ?auto_112284 ) ) ( not ( = ?auto_112283 ?auto_112285 ) ) ( not ( = ?auto_112283 ?auto_112286 ) ) ( not ( = ?auto_112284 ?auto_112285 ) ) ( not ( = ?auto_112284 ?auto_112286 ) ) ( not ( = ?auto_112285 ?auto_112286 ) ) ( ON ?auto_112284 ?auto_112285 ) ( ON ?auto_112283 ?auto_112284 ) ( ON ?auto_112282 ?auto_112283 ) ( ON ?auto_112281 ?auto_112282 ) ( ON ?auto_112280 ?auto_112281 ) ( ON ?auto_112279 ?auto_112280 ) ( ON ?auto_112278 ?auto_112279 ) ( ON ?auto_112277 ?auto_112278 ) ( CLEAR ?auto_112277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112277 )
      ( MAKE-9PILE ?auto_112277 ?auto_112278 ?auto_112279 ?auto_112280 ?auto_112281 ?auto_112282 ?auto_112283 ?auto_112284 ?auto_112285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112316 - BLOCK
      ?auto_112317 - BLOCK
      ?auto_112318 - BLOCK
      ?auto_112319 - BLOCK
      ?auto_112320 - BLOCK
      ?auto_112321 - BLOCK
      ?auto_112322 - BLOCK
      ?auto_112323 - BLOCK
      ?auto_112324 - BLOCK
      ?auto_112325 - BLOCK
    )
    :vars
    (
      ?auto_112326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112324 ) ( ON ?auto_112325 ?auto_112326 ) ( CLEAR ?auto_112325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112316 ) ( ON ?auto_112317 ?auto_112316 ) ( ON ?auto_112318 ?auto_112317 ) ( ON ?auto_112319 ?auto_112318 ) ( ON ?auto_112320 ?auto_112319 ) ( ON ?auto_112321 ?auto_112320 ) ( ON ?auto_112322 ?auto_112321 ) ( ON ?auto_112323 ?auto_112322 ) ( ON ?auto_112324 ?auto_112323 ) ( not ( = ?auto_112316 ?auto_112317 ) ) ( not ( = ?auto_112316 ?auto_112318 ) ) ( not ( = ?auto_112316 ?auto_112319 ) ) ( not ( = ?auto_112316 ?auto_112320 ) ) ( not ( = ?auto_112316 ?auto_112321 ) ) ( not ( = ?auto_112316 ?auto_112322 ) ) ( not ( = ?auto_112316 ?auto_112323 ) ) ( not ( = ?auto_112316 ?auto_112324 ) ) ( not ( = ?auto_112316 ?auto_112325 ) ) ( not ( = ?auto_112316 ?auto_112326 ) ) ( not ( = ?auto_112317 ?auto_112318 ) ) ( not ( = ?auto_112317 ?auto_112319 ) ) ( not ( = ?auto_112317 ?auto_112320 ) ) ( not ( = ?auto_112317 ?auto_112321 ) ) ( not ( = ?auto_112317 ?auto_112322 ) ) ( not ( = ?auto_112317 ?auto_112323 ) ) ( not ( = ?auto_112317 ?auto_112324 ) ) ( not ( = ?auto_112317 ?auto_112325 ) ) ( not ( = ?auto_112317 ?auto_112326 ) ) ( not ( = ?auto_112318 ?auto_112319 ) ) ( not ( = ?auto_112318 ?auto_112320 ) ) ( not ( = ?auto_112318 ?auto_112321 ) ) ( not ( = ?auto_112318 ?auto_112322 ) ) ( not ( = ?auto_112318 ?auto_112323 ) ) ( not ( = ?auto_112318 ?auto_112324 ) ) ( not ( = ?auto_112318 ?auto_112325 ) ) ( not ( = ?auto_112318 ?auto_112326 ) ) ( not ( = ?auto_112319 ?auto_112320 ) ) ( not ( = ?auto_112319 ?auto_112321 ) ) ( not ( = ?auto_112319 ?auto_112322 ) ) ( not ( = ?auto_112319 ?auto_112323 ) ) ( not ( = ?auto_112319 ?auto_112324 ) ) ( not ( = ?auto_112319 ?auto_112325 ) ) ( not ( = ?auto_112319 ?auto_112326 ) ) ( not ( = ?auto_112320 ?auto_112321 ) ) ( not ( = ?auto_112320 ?auto_112322 ) ) ( not ( = ?auto_112320 ?auto_112323 ) ) ( not ( = ?auto_112320 ?auto_112324 ) ) ( not ( = ?auto_112320 ?auto_112325 ) ) ( not ( = ?auto_112320 ?auto_112326 ) ) ( not ( = ?auto_112321 ?auto_112322 ) ) ( not ( = ?auto_112321 ?auto_112323 ) ) ( not ( = ?auto_112321 ?auto_112324 ) ) ( not ( = ?auto_112321 ?auto_112325 ) ) ( not ( = ?auto_112321 ?auto_112326 ) ) ( not ( = ?auto_112322 ?auto_112323 ) ) ( not ( = ?auto_112322 ?auto_112324 ) ) ( not ( = ?auto_112322 ?auto_112325 ) ) ( not ( = ?auto_112322 ?auto_112326 ) ) ( not ( = ?auto_112323 ?auto_112324 ) ) ( not ( = ?auto_112323 ?auto_112325 ) ) ( not ( = ?auto_112323 ?auto_112326 ) ) ( not ( = ?auto_112324 ?auto_112325 ) ) ( not ( = ?auto_112324 ?auto_112326 ) ) ( not ( = ?auto_112325 ?auto_112326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112325 ?auto_112326 )
      ( !STACK ?auto_112325 ?auto_112324 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112358 - BLOCK
      ?auto_112359 - BLOCK
      ?auto_112360 - BLOCK
      ?auto_112361 - BLOCK
      ?auto_112362 - BLOCK
      ?auto_112363 - BLOCK
      ?auto_112364 - BLOCK
      ?auto_112365 - BLOCK
      ?auto_112366 - BLOCK
      ?auto_112367 - BLOCK
    )
    :vars
    (
      ?auto_112368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112367 ?auto_112368 ) ( ON-TABLE ?auto_112358 ) ( ON ?auto_112359 ?auto_112358 ) ( ON ?auto_112360 ?auto_112359 ) ( ON ?auto_112361 ?auto_112360 ) ( ON ?auto_112362 ?auto_112361 ) ( ON ?auto_112363 ?auto_112362 ) ( ON ?auto_112364 ?auto_112363 ) ( ON ?auto_112365 ?auto_112364 ) ( not ( = ?auto_112358 ?auto_112359 ) ) ( not ( = ?auto_112358 ?auto_112360 ) ) ( not ( = ?auto_112358 ?auto_112361 ) ) ( not ( = ?auto_112358 ?auto_112362 ) ) ( not ( = ?auto_112358 ?auto_112363 ) ) ( not ( = ?auto_112358 ?auto_112364 ) ) ( not ( = ?auto_112358 ?auto_112365 ) ) ( not ( = ?auto_112358 ?auto_112366 ) ) ( not ( = ?auto_112358 ?auto_112367 ) ) ( not ( = ?auto_112358 ?auto_112368 ) ) ( not ( = ?auto_112359 ?auto_112360 ) ) ( not ( = ?auto_112359 ?auto_112361 ) ) ( not ( = ?auto_112359 ?auto_112362 ) ) ( not ( = ?auto_112359 ?auto_112363 ) ) ( not ( = ?auto_112359 ?auto_112364 ) ) ( not ( = ?auto_112359 ?auto_112365 ) ) ( not ( = ?auto_112359 ?auto_112366 ) ) ( not ( = ?auto_112359 ?auto_112367 ) ) ( not ( = ?auto_112359 ?auto_112368 ) ) ( not ( = ?auto_112360 ?auto_112361 ) ) ( not ( = ?auto_112360 ?auto_112362 ) ) ( not ( = ?auto_112360 ?auto_112363 ) ) ( not ( = ?auto_112360 ?auto_112364 ) ) ( not ( = ?auto_112360 ?auto_112365 ) ) ( not ( = ?auto_112360 ?auto_112366 ) ) ( not ( = ?auto_112360 ?auto_112367 ) ) ( not ( = ?auto_112360 ?auto_112368 ) ) ( not ( = ?auto_112361 ?auto_112362 ) ) ( not ( = ?auto_112361 ?auto_112363 ) ) ( not ( = ?auto_112361 ?auto_112364 ) ) ( not ( = ?auto_112361 ?auto_112365 ) ) ( not ( = ?auto_112361 ?auto_112366 ) ) ( not ( = ?auto_112361 ?auto_112367 ) ) ( not ( = ?auto_112361 ?auto_112368 ) ) ( not ( = ?auto_112362 ?auto_112363 ) ) ( not ( = ?auto_112362 ?auto_112364 ) ) ( not ( = ?auto_112362 ?auto_112365 ) ) ( not ( = ?auto_112362 ?auto_112366 ) ) ( not ( = ?auto_112362 ?auto_112367 ) ) ( not ( = ?auto_112362 ?auto_112368 ) ) ( not ( = ?auto_112363 ?auto_112364 ) ) ( not ( = ?auto_112363 ?auto_112365 ) ) ( not ( = ?auto_112363 ?auto_112366 ) ) ( not ( = ?auto_112363 ?auto_112367 ) ) ( not ( = ?auto_112363 ?auto_112368 ) ) ( not ( = ?auto_112364 ?auto_112365 ) ) ( not ( = ?auto_112364 ?auto_112366 ) ) ( not ( = ?auto_112364 ?auto_112367 ) ) ( not ( = ?auto_112364 ?auto_112368 ) ) ( not ( = ?auto_112365 ?auto_112366 ) ) ( not ( = ?auto_112365 ?auto_112367 ) ) ( not ( = ?auto_112365 ?auto_112368 ) ) ( not ( = ?auto_112366 ?auto_112367 ) ) ( not ( = ?auto_112366 ?auto_112368 ) ) ( not ( = ?auto_112367 ?auto_112368 ) ) ( CLEAR ?auto_112365 ) ( ON ?auto_112366 ?auto_112367 ) ( CLEAR ?auto_112366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_112358 ?auto_112359 ?auto_112360 ?auto_112361 ?auto_112362 ?auto_112363 ?auto_112364 ?auto_112365 ?auto_112366 )
      ( MAKE-10PILE ?auto_112358 ?auto_112359 ?auto_112360 ?auto_112361 ?auto_112362 ?auto_112363 ?auto_112364 ?auto_112365 ?auto_112366 ?auto_112367 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112400 - BLOCK
      ?auto_112401 - BLOCK
      ?auto_112402 - BLOCK
      ?auto_112403 - BLOCK
      ?auto_112404 - BLOCK
      ?auto_112405 - BLOCK
      ?auto_112406 - BLOCK
      ?auto_112407 - BLOCK
      ?auto_112408 - BLOCK
      ?auto_112409 - BLOCK
    )
    :vars
    (
      ?auto_112410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112409 ?auto_112410 ) ( ON-TABLE ?auto_112400 ) ( ON ?auto_112401 ?auto_112400 ) ( ON ?auto_112402 ?auto_112401 ) ( ON ?auto_112403 ?auto_112402 ) ( ON ?auto_112404 ?auto_112403 ) ( ON ?auto_112405 ?auto_112404 ) ( ON ?auto_112406 ?auto_112405 ) ( not ( = ?auto_112400 ?auto_112401 ) ) ( not ( = ?auto_112400 ?auto_112402 ) ) ( not ( = ?auto_112400 ?auto_112403 ) ) ( not ( = ?auto_112400 ?auto_112404 ) ) ( not ( = ?auto_112400 ?auto_112405 ) ) ( not ( = ?auto_112400 ?auto_112406 ) ) ( not ( = ?auto_112400 ?auto_112407 ) ) ( not ( = ?auto_112400 ?auto_112408 ) ) ( not ( = ?auto_112400 ?auto_112409 ) ) ( not ( = ?auto_112400 ?auto_112410 ) ) ( not ( = ?auto_112401 ?auto_112402 ) ) ( not ( = ?auto_112401 ?auto_112403 ) ) ( not ( = ?auto_112401 ?auto_112404 ) ) ( not ( = ?auto_112401 ?auto_112405 ) ) ( not ( = ?auto_112401 ?auto_112406 ) ) ( not ( = ?auto_112401 ?auto_112407 ) ) ( not ( = ?auto_112401 ?auto_112408 ) ) ( not ( = ?auto_112401 ?auto_112409 ) ) ( not ( = ?auto_112401 ?auto_112410 ) ) ( not ( = ?auto_112402 ?auto_112403 ) ) ( not ( = ?auto_112402 ?auto_112404 ) ) ( not ( = ?auto_112402 ?auto_112405 ) ) ( not ( = ?auto_112402 ?auto_112406 ) ) ( not ( = ?auto_112402 ?auto_112407 ) ) ( not ( = ?auto_112402 ?auto_112408 ) ) ( not ( = ?auto_112402 ?auto_112409 ) ) ( not ( = ?auto_112402 ?auto_112410 ) ) ( not ( = ?auto_112403 ?auto_112404 ) ) ( not ( = ?auto_112403 ?auto_112405 ) ) ( not ( = ?auto_112403 ?auto_112406 ) ) ( not ( = ?auto_112403 ?auto_112407 ) ) ( not ( = ?auto_112403 ?auto_112408 ) ) ( not ( = ?auto_112403 ?auto_112409 ) ) ( not ( = ?auto_112403 ?auto_112410 ) ) ( not ( = ?auto_112404 ?auto_112405 ) ) ( not ( = ?auto_112404 ?auto_112406 ) ) ( not ( = ?auto_112404 ?auto_112407 ) ) ( not ( = ?auto_112404 ?auto_112408 ) ) ( not ( = ?auto_112404 ?auto_112409 ) ) ( not ( = ?auto_112404 ?auto_112410 ) ) ( not ( = ?auto_112405 ?auto_112406 ) ) ( not ( = ?auto_112405 ?auto_112407 ) ) ( not ( = ?auto_112405 ?auto_112408 ) ) ( not ( = ?auto_112405 ?auto_112409 ) ) ( not ( = ?auto_112405 ?auto_112410 ) ) ( not ( = ?auto_112406 ?auto_112407 ) ) ( not ( = ?auto_112406 ?auto_112408 ) ) ( not ( = ?auto_112406 ?auto_112409 ) ) ( not ( = ?auto_112406 ?auto_112410 ) ) ( not ( = ?auto_112407 ?auto_112408 ) ) ( not ( = ?auto_112407 ?auto_112409 ) ) ( not ( = ?auto_112407 ?auto_112410 ) ) ( not ( = ?auto_112408 ?auto_112409 ) ) ( not ( = ?auto_112408 ?auto_112410 ) ) ( not ( = ?auto_112409 ?auto_112410 ) ) ( ON ?auto_112408 ?auto_112409 ) ( CLEAR ?auto_112406 ) ( ON ?auto_112407 ?auto_112408 ) ( CLEAR ?auto_112407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_112400 ?auto_112401 ?auto_112402 ?auto_112403 ?auto_112404 ?auto_112405 ?auto_112406 ?auto_112407 )
      ( MAKE-10PILE ?auto_112400 ?auto_112401 ?auto_112402 ?auto_112403 ?auto_112404 ?auto_112405 ?auto_112406 ?auto_112407 ?auto_112408 ?auto_112409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112442 - BLOCK
      ?auto_112443 - BLOCK
      ?auto_112444 - BLOCK
      ?auto_112445 - BLOCK
      ?auto_112446 - BLOCK
      ?auto_112447 - BLOCK
      ?auto_112448 - BLOCK
      ?auto_112449 - BLOCK
      ?auto_112450 - BLOCK
      ?auto_112451 - BLOCK
    )
    :vars
    (
      ?auto_112452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112451 ?auto_112452 ) ( ON-TABLE ?auto_112442 ) ( ON ?auto_112443 ?auto_112442 ) ( ON ?auto_112444 ?auto_112443 ) ( ON ?auto_112445 ?auto_112444 ) ( ON ?auto_112446 ?auto_112445 ) ( ON ?auto_112447 ?auto_112446 ) ( not ( = ?auto_112442 ?auto_112443 ) ) ( not ( = ?auto_112442 ?auto_112444 ) ) ( not ( = ?auto_112442 ?auto_112445 ) ) ( not ( = ?auto_112442 ?auto_112446 ) ) ( not ( = ?auto_112442 ?auto_112447 ) ) ( not ( = ?auto_112442 ?auto_112448 ) ) ( not ( = ?auto_112442 ?auto_112449 ) ) ( not ( = ?auto_112442 ?auto_112450 ) ) ( not ( = ?auto_112442 ?auto_112451 ) ) ( not ( = ?auto_112442 ?auto_112452 ) ) ( not ( = ?auto_112443 ?auto_112444 ) ) ( not ( = ?auto_112443 ?auto_112445 ) ) ( not ( = ?auto_112443 ?auto_112446 ) ) ( not ( = ?auto_112443 ?auto_112447 ) ) ( not ( = ?auto_112443 ?auto_112448 ) ) ( not ( = ?auto_112443 ?auto_112449 ) ) ( not ( = ?auto_112443 ?auto_112450 ) ) ( not ( = ?auto_112443 ?auto_112451 ) ) ( not ( = ?auto_112443 ?auto_112452 ) ) ( not ( = ?auto_112444 ?auto_112445 ) ) ( not ( = ?auto_112444 ?auto_112446 ) ) ( not ( = ?auto_112444 ?auto_112447 ) ) ( not ( = ?auto_112444 ?auto_112448 ) ) ( not ( = ?auto_112444 ?auto_112449 ) ) ( not ( = ?auto_112444 ?auto_112450 ) ) ( not ( = ?auto_112444 ?auto_112451 ) ) ( not ( = ?auto_112444 ?auto_112452 ) ) ( not ( = ?auto_112445 ?auto_112446 ) ) ( not ( = ?auto_112445 ?auto_112447 ) ) ( not ( = ?auto_112445 ?auto_112448 ) ) ( not ( = ?auto_112445 ?auto_112449 ) ) ( not ( = ?auto_112445 ?auto_112450 ) ) ( not ( = ?auto_112445 ?auto_112451 ) ) ( not ( = ?auto_112445 ?auto_112452 ) ) ( not ( = ?auto_112446 ?auto_112447 ) ) ( not ( = ?auto_112446 ?auto_112448 ) ) ( not ( = ?auto_112446 ?auto_112449 ) ) ( not ( = ?auto_112446 ?auto_112450 ) ) ( not ( = ?auto_112446 ?auto_112451 ) ) ( not ( = ?auto_112446 ?auto_112452 ) ) ( not ( = ?auto_112447 ?auto_112448 ) ) ( not ( = ?auto_112447 ?auto_112449 ) ) ( not ( = ?auto_112447 ?auto_112450 ) ) ( not ( = ?auto_112447 ?auto_112451 ) ) ( not ( = ?auto_112447 ?auto_112452 ) ) ( not ( = ?auto_112448 ?auto_112449 ) ) ( not ( = ?auto_112448 ?auto_112450 ) ) ( not ( = ?auto_112448 ?auto_112451 ) ) ( not ( = ?auto_112448 ?auto_112452 ) ) ( not ( = ?auto_112449 ?auto_112450 ) ) ( not ( = ?auto_112449 ?auto_112451 ) ) ( not ( = ?auto_112449 ?auto_112452 ) ) ( not ( = ?auto_112450 ?auto_112451 ) ) ( not ( = ?auto_112450 ?auto_112452 ) ) ( not ( = ?auto_112451 ?auto_112452 ) ) ( ON ?auto_112450 ?auto_112451 ) ( ON ?auto_112449 ?auto_112450 ) ( CLEAR ?auto_112447 ) ( ON ?auto_112448 ?auto_112449 ) ( CLEAR ?auto_112448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112442 ?auto_112443 ?auto_112444 ?auto_112445 ?auto_112446 ?auto_112447 ?auto_112448 )
      ( MAKE-10PILE ?auto_112442 ?auto_112443 ?auto_112444 ?auto_112445 ?auto_112446 ?auto_112447 ?auto_112448 ?auto_112449 ?auto_112450 ?auto_112451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112484 - BLOCK
      ?auto_112485 - BLOCK
      ?auto_112486 - BLOCK
      ?auto_112487 - BLOCK
      ?auto_112488 - BLOCK
      ?auto_112489 - BLOCK
      ?auto_112490 - BLOCK
      ?auto_112491 - BLOCK
      ?auto_112492 - BLOCK
      ?auto_112493 - BLOCK
    )
    :vars
    (
      ?auto_112494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112493 ?auto_112494 ) ( ON-TABLE ?auto_112484 ) ( ON ?auto_112485 ?auto_112484 ) ( ON ?auto_112486 ?auto_112485 ) ( ON ?auto_112487 ?auto_112486 ) ( ON ?auto_112488 ?auto_112487 ) ( not ( = ?auto_112484 ?auto_112485 ) ) ( not ( = ?auto_112484 ?auto_112486 ) ) ( not ( = ?auto_112484 ?auto_112487 ) ) ( not ( = ?auto_112484 ?auto_112488 ) ) ( not ( = ?auto_112484 ?auto_112489 ) ) ( not ( = ?auto_112484 ?auto_112490 ) ) ( not ( = ?auto_112484 ?auto_112491 ) ) ( not ( = ?auto_112484 ?auto_112492 ) ) ( not ( = ?auto_112484 ?auto_112493 ) ) ( not ( = ?auto_112484 ?auto_112494 ) ) ( not ( = ?auto_112485 ?auto_112486 ) ) ( not ( = ?auto_112485 ?auto_112487 ) ) ( not ( = ?auto_112485 ?auto_112488 ) ) ( not ( = ?auto_112485 ?auto_112489 ) ) ( not ( = ?auto_112485 ?auto_112490 ) ) ( not ( = ?auto_112485 ?auto_112491 ) ) ( not ( = ?auto_112485 ?auto_112492 ) ) ( not ( = ?auto_112485 ?auto_112493 ) ) ( not ( = ?auto_112485 ?auto_112494 ) ) ( not ( = ?auto_112486 ?auto_112487 ) ) ( not ( = ?auto_112486 ?auto_112488 ) ) ( not ( = ?auto_112486 ?auto_112489 ) ) ( not ( = ?auto_112486 ?auto_112490 ) ) ( not ( = ?auto_112486 ?auto_112491 ) ) ( not ( = ?auto_112486 ?auto_112492 ) ) ( not ( = ?auto_112486 ?auto_112493 ) ) ( not ( = ?auto_112486 ?auto_112494 ) ) ( not ( = ?auto_112487 ?auto_112488 ) ) ( not ( = ?auto_112487 ?auto_112489 ) ) ( not ( = ?auto_112487 ?auto_112490 ) ) ( not ( = ?auto_112487 ?auto_112491 ) ) ( not ( = ?auto_112487 ?auto_112492 ) ) ( not ( = ?auto_112487 ?auto_112493 ) ) ( not ( = ?auto_112487 ?auto_112494 ) ) ( not ( = ?auto_112488 ?auto_112489 ) ) ( not ( = ?auto_112488 ?auto_112490 ) ) ( not ( = ?auto_112488 ?auto_112491 ) ) ( not ( = ?auto_112488 ?auto_112492 ) ) ( not ( = ?auto_112488 ?auto_112493 ) ) ( not ( = ?auto_112488 ?auto_112494 ) ) ( not ( = ?auto_112489 ?auto_112490 ) ) ( not ( = ?auto_112489 ?auto_112491 ) ) ( not ( = ?auto_112489 ?auto_112492 ) ) ( not ( = ?auto_112489 ?auto_112493 ) ) ( not ( = ?auto_112489 ?auto_112494 ) ) ( not ( = ?auto_112490 ?auto_112491 ) ) ( not ( = ?auto_112490 ?auto_112492 ) ) ( not ( = ?auto_112490 ?auto_112493 ) ) ( not ( = ?auto_112490 ?auto_112494 ) ) ( not ( = ?auto_112491 ?auto_112492 ) ) ( not ( = ?auto_112491 ?auto_112493 ) ) ( not ( = ?auto_112491 ?auto_112494 ) ) ( not ( = ?auto_112492 ?auto_112493 ) ) ( not ( = ?auto_112492 ?auto_112494 ) ) ( not ( = ?auto_112493 ?auto_112494 ) ) ( ON ?auto_112492 ?auto_112493 ) ( ON ?auto_112491 ?auto_112492 ) ( ON ?auto_112490 ?auto_112491 ) ( CLEAR ?auto_112488 ) ( ON ?auto_112489 ?auto_112490 ) ( CLEAR ?auto_112489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112484 ?auto_112485 ?auto_112486 ?auto_112487 ?auto_112488 ?auto_112489 )
      ( MAKE-10PILE ?auto_112484 ?auto_112485 ?auto_112486 ?auto_112487 ?auto_112488 ?auto_112489 ?auto_112490 ?auto_112491 ?auto_112492 ?auto_112493 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112526 - BLOCK
      ?auto_112527 - BLOCK
      ?auto_112528 - BLOCK
      ?auto_112529 - BLOCK
      ?auto_112530 - BLOCK
      ?auto_112531 - BLOCK
      ?auto_112532 - BLOCK
      ?auto_112533 - BLOCK
      ?auto_112534 - BLOCK
      ?auto_112535 - BLOCK
    )
    :vars
    (
      ?auto_112536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112535 ?auto_112536 ) ( ON-TABLE ?auto_112526 ) ( ON ?auto_112527 ?auto_112526 ) ( ON ?auto_112528 ?auto_112527 ) ( ON ?auto_112529 ?auto_112528 ) ( not ( = ?auto_112526 ?auto_112527 ) ) ( not ( = ?auto_112526 ?auto_112528 ) ) ( not ( = ?auto_112526 ?auto_112529 ) ) ( not ( = ?auto_112526 ?auto_112530 ) ) ( not ( = ?auto_112526 ?auto_112531 ) ) ( not ( = ?auto_112526 ?auto_112532 ) ) ( not ( = ?auto_112526 ?auto_112533 ) ) ( not ( = ?auto_112526 ?auto_112534 ) ) ( not ( = ?auto_112526 ?auto_112535 ) ) ( not ( = ?auto_112526 ?auto_112536 ) ) ( not ( = ?auto_112527 ?auto_112528 ) ) ( not ( = ?auto_112527 ?auto_112529 ) ) ( not ( = ?auto_112527 ?auto_112530 ) ) ( not ( = ?auto_112527 ?auto_112531 ) ) ( not ( = ?auto_112527 ?auto_112532 ) ) ( not ( = ?auto_112527 ?auto_112533 ) ) ( not ( = ?auto_112527 ?auto_112534 ) ) ( not ( = ?auto_112527 ?auto_112535 ) ) ( not ( = ?auto_112527 ?auto_112536 ) ) ( not ( = ?auto_112528 ?auto_112529 ) ) ( not ( = ?auto_112528 ?auto_112530 ) ) ( not ( = ?auto_112528 ?auto_112531 ) ) ( not ( = ?auto_112528 ?auto_112532 ) ) ( not ( = ?auto_112528 ?auto_112533 ) ) ( not ( = ?auto_112528 ?auto_112534 ) ) ( not ( = ?auto_112528 ?auto_112535 ) ) ( not ( = ?auto_112528 ?auto_112536 ) ) ( not ( = ?auto_112529 ?auto_112530 ) ) ( not ( = ?auto_112529 ?auto_112531 ) ) ( not ( = ?auto_112529 ?auto_112532 ) ) ( not ( = ?auto_112529 ?auto_112533 ) ) ( not ( = ?auto_112529 ?auto_112534 ) ) ( not ( = ?auto_112529 ?auto_112535 ) ) ( not ( = ?auto_112529 ?auto_112536 ) ) ( not ( = ?auto_112530 ?auto_112531 ) ) ( not ( = ?auto_112530 ?auto_112532 ) ) ( not ( = ?auto_112530 ?auto_112533 ) ) ( not ( = ?auto_112530 ?auto_112534 ) ) ( not ( = ?auto_112530 ?auto_112535 ) ) ( not ( = ?auto_112530 ?auto_112536 ) ) ( not ( = ?auto_112531 ?auto_112532 ) ) ( not ( = ?auto_112531 ?auto_112533 ) ) ( not ( = ?auto_112531 ?auto_112534 ) ) ( not ( = ?auto_112531 ?auto_112535 ) ) ( not ( = ?auto_112531 ?auto_112536 ) ) ( not ( = ?auto_112532 ?auto_112533 ) ) ( not ( = ?auto_112532 ?auto_112534 ) ) ( not ( = ?auto_112532 ?auto_112535 ) ) ( not ( = ?auto_112532 ?auto_112536 ) ) ( not ( = ?auto_112533 ?auto_112534 ) ) ( not ( = ?auto_112533 ?auto_112535 ) ) ( not ( = ?auto_112533 ?auto_112536 ) ) ( not ( = ?auto_112534 ?auto_112535 ) ) ( not ( = ?auto_112534 ?auto_112536 ) ) ( not ( = ?auto_112535 ?auto_112536 ) ) ( ON ?auto_112534 ?auto_112535 ) ( ON ?auto_112533 ?auto_112534 ) ( ON ?auto_112532 ?auto_112533 ) ( ON ?auto_112531 ?auto_112532 ) ( CLEAR ?auto_112529 ) ( ON ?auto_112530 ?auto_112531 ) ( CLEAR ?auto_112530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112526 ?auto_112527 ?auto_112528 ?auto_112529 ?auto_112530 )
      ( MAKE-10PILE ?auto_112526 ?auto_112527 ?auto_112528 ?auto_112529 ?auto_112530 ?auto_112531 ?auto_112532 ?auto_112533 ?auto_112534 ?auto_112535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112568 - BLOCK
      ?auto_112569 - BLOCK
      ?auto_112570 - BLOCK
      ?auto_112571 - BLOCK
      ?auto_112572 - BLOCK
      ?auto_112573 - BLOCK
      ?auto_112574 - BLOCK
      ?auto_112575 - BLOCK
      ?auto_112576 - BLOCK
      ?auto_112577 - BLOCK
    )
    :vars
    (
      ?auto_112578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112577 ?auto_112578 ) ( ON-TABLE ?auto_112568 ) ( ON ?auto_112569 ?auto_112568 ) ( ON ?auto_112570 ?auto_112569 ) ( not ( = ?auto_112568 ?auto_112569 ) ) ( not ( = ?auto_112568 ?auto_112570 ) ) ( not ( = ?auto_112568 ?auto_112571 ) ) ( not ( = ?auto_112568 ?auto_112572 ) ) ( not ( = ?auto_112568 ?auto_112573 ) ) ( not ( = ?auto_112568 ?auto_112574 ) ) ( not ( = ?auto_112568 ?auto_112575 ) ) ( not ( = ?auto_112568 ?auto_112576 ) ) ( not ( = ?auto_112568 ?auto_112577 ) ) ( not ( = ?auto_112568 ?auto_112578 ) ) ( not ( = ?auto_112569 ?auto_112570 ) ) ( not ( = ?auto_112569 ?auto_112571 ) ) ( not ( = ?auto_112569 ?auto_112572 ) ) ( not ( = ?auto_112569 ?auto_112573 ) ) ( not ( = ?auto_112569 ?auto_112574 ) ) ( not ( = ?auto_112569 ?auto_112575 ) ) ( not ( = ?auto_112569 ?auto_112576 ) ) ( not ( = ?auto_112569 ?auto_112577 ) ) ( not ( = ?auto_112569 ?auto_112578 ) ) ( not ( = ?auto_112570 ?auto_112571 ) ) ( not ( = ?auto_112570 ?auto_112572 ) ) ( not ( = ?auto_112570 ?auto_112573 ) ) ( not ( = ?auto_112570 ?auto_112574 ) ) ( not ( = ?auto_112570 ?auto_112575 ) ) ( not ( = ?auto_112570 ?auto_112576 ) ) ( not ( = ?auto_112570 ?auto_112577 ) ) ( not ( = ?auto_112570 ?auto_112578 ) ) ( not ( = ?auto_112571 ?auto_112572 ) ) ( not ( = ?auto_112571 ?auto_112573 ) ) ( not ( = ?auto_112571 ?auto_112574 ) ) ( not ( = ?auto_112571 ?auto_112575 ) ) ( not ( = ?auto_112571 ?auto_112576 ) ) ( not ( = ?auto_112571 ?auto_112577 ) ) ( not ( = ?auto_112571 ?auto_112578 ) ) ( not ( = ?auto_112572 ?auto_112573 ) ) ( not ( = ?auto_112572 ?auto_112574 ) ) ( not ( = ?auto_112572 ?auto_112575 ) ) ( not ( = ?auto_112572 ?auto_112576 ) ) ( not ( = ?auto_112572 ?auto_112577 ) ) ( not ( = ?auto_112572 ?auto_112578 ) ) ( not ( = ?auto_112573 ?auto_112574 ) ) ( not ( = ?auto_112573 ?auto_112575 ) ) ( not ( = ?auto_112573 ?auto_112576 ) ) ( not ( = ?auto_112573 ?auto_112577 ) ) ( not ( = ?auto_112573 ?auto_112578 ) ) ( not ( = ?auto_112574 ?auto_112575 ) ) ( not ( = ?auto_112574 ?auto_112576 ) ) ( not ( = ?auto_112574 ?auto_112577 ) ) ( not ( = ?auto_112574 ?auto_112578 ) ) ( not ( = ?auto_112575 ?auto_112576 ) ) ( not ( = ?auto_112575 ?auto_112577 ) ) ( not ( = ?auto_112575 ?auto_112578 ) ) ( not ( = ?auto_112576 ?auto_112577 ) ) ( not ( = ?auto_112576 ?auto_112578 ) ) ( not ( = ?auto_112577 ?auto_112578 ) ) ( ON ?auto_112576 ?auto_112577 ) ( ON ?auto_112575 ?auto_112576 ) ( ON ?auto_112574 ?auto_112575 ) ( ON ?auto_112573 ?auto_112574 ) ( ON ?auto_112572 ?auto_112573 ) ( CLEAR ?auto_112570 ) ( ON ?auto_112571 ?auto_112572 ) ( CLEAR ?auto_112571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112568 ?auto_112569 ?auto_112570 ?auto_112571 )
      ( MAKE-10PILE ?auto_112568 ?auto_112569 ?auto_112570 ?auto_112571 ?auto_112572 ?auto_112573 ?auto_112574 ?auto_112575 ?auto_112576 ?auto_112577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112610 - BLOCK
      ?auto_112611 - BLOCK
      ?auto_112612 - BLOCK
      ?auto_112613 - BLOCK
      ?auto_112614 - BLOCK
      ?auto_112615 - BLOCK
      ?auto_112616 - BLOCK
      ?auto_112617 - BLOCK
      ?auto_112618 - BLOCK
      ?auto_112619 - BLOCK
    )
    :vars
    (
      ?auto_112620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112619 ?auto_112620 ) ( ON-TABLE ?auto_112610 ) ( ON ?auto_112611 ?auto_112610 ) ( not ( = ?auto_112610 ?auto_112611 ) ) ( not ( = ?auto_112610 ?auto_112612 ) ) ( not ( = ?auto_112610 ?auto_112613 ) ) ( not ( = ?auto_112610 ?auto_112614 ) ) ( not ( = ?auto_112610 ?auto_112615 ) ) ( not ( = ?auto_112610 ?auto_112616 ) ) ( not ( = ?auto_112610 ?auto_112617 ) ) ( not ( = ?auto_112610 ?auto_112618 ) ) ( not ( = ?auto_112610 ?auto_112619 ) ) ( not ( = ?auto_112610 ?auto_112620 ) ) ( not ( = ?auto_112611 ?auto_112612 ) ) ( not ( = ?auto_112611 ?auto_112613 ) ) ( not ( = ?auto_112611 ?auto_112614 ) ) ( not ( = ?auto_112611 ?auto_112615 ) ) ( not ( = ?auto_112611 ?auto_112616 ) ) ( not ( = ?auto_112611 ?auto_112617 ) ) ( not ( = ?auto_112611 ?auto_112618 ) ) ( not ( = ?auto_112611 ?auto_112619 ) ) ( not ( = ?auto_112611 ?auto_112620 ) ) ( not ( = ?auto_112612 ?auto_112613 ) ) ( not ( = ?auto_112612 ?auto_112614 ) ) ( not ( = ?auto_112612 ?auto_112615 ) ) ( not ( = ?auto_112612 ?auto_112616 ) ) ( not ( = ?auto_112612 ?auto_112617 ) ) ( not ( = ?auto_112612 ?auto_112618 ) ) ( not ( = ?auto_112612 ?auto_112619 ) ) ( not ( = ?auto_112612 ?auto_112620 ) ) ( not ( = ?auto_112613 ?auto_112614 ) ) ( not ( = ?auto_112613 ?auto_112615 ) ) ( not ( = ?auto_112613 ?auto_112616 ) ) ( not ( = ?auto_112613 ?auto_112617 ) ) ( not ( = ?auto_112613 ?auto_112618 ) ) ( not ( = ?auto_112613 ?auto_112619 ) ) ( not ( = ?auto_112613 ?auto_112620 ) ) ( not ( = ?auto_112614 ?auto_112615 ) ) ( not ( = ?auto_112614 ?auto_112616 ) ) ( not ( = ?auto_112614 ?auto_112617 ) ) ( not ( = ?auto_112614 ?auto_112618 ) ) ( not ( = ?auto_112614 ?auto_112619 ) ) ( not ( = ?auto_112614 ?auto_112620 ) ) ( not ( = ?auto_112615 ?auto_112616 ) ) ( not ( = ?auto_112615 ?auto_112617 ) ) ( not ( = ?auto_112615 ?auto_112618 ) ) ( not ( = ?auto_112615 ?auto_112619 ) ) ( not ( = ?auto_112615 ?auto_112620 ) ) ( not ( = ?auto_112616 ?auto_112617 ) ) ( not ( = ?auto_112616 ?auto_112618 ) ) ( not ( = ?auto_112616 ?auto_112619 ) ) ( not ( = ?auto_112616 ?auto_112620 ) ) ( not ( = ?auto_112617 ?auto_112618 ) ) ( not ( = ?auto_112617 ?auto_112619 ) ) ( not ( = ?auto_112617 ?auto_112620 ) ) ( not ( = ?auto_112618 ?auto_112619 ) ) ( not ( = ?auto_112618 ?auto_112620 ) ) ( not ( = ?auto_112619 ?auto_112620 ) ) ( ON ?auto_112618 ?auto_112619 ) ( ON ?auto_112617 ?auto_112618 ) ( ON ?auto_112616 ?auto_112617 ) ( ON ?auto_112615 ?auto_112616 ) ( ON ?auto_112614 ?auto_112615 ) ( ON ?auto_112613 ?auto_112614 ) ( CLEAR ?auto_112611 ) ( ON ?auto_112612 ?auto_112613 ) ( CLEAR ?auto_112612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112610 ?auto_112611 ?auto_112612 )
      ( MAKE-10PILE ?auto_112610 ?auto_112611 ?auto_112612 ?auto_112613 ?auto_112614 ?auto_112615 ?auto_112616 ?auto_112617 ?auto_112618 ?auto_112619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112652 - BLOCK
      ?auto_112653 - BLOCK
      ?auto_112654 - BLOCK
      ?auto_112655 - BLOCK
      ?auto_112656 - BLOCK
      ?auto_112657 - BLOCK
      ?auto_112658 - BLOCK
      ?auto_112659 - BLOCK
      ?auto_112660 - BLOCK
      ?auto_112661 - BLOCK
    )
    :vars
    (
      ?auto_112662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112661 ?auto_112662 ) ( ON-TABLE ?auto_112652 ) ( not ( = ?auto_112652 ?auto_112653 ) ) ( not ( = ?auto_112652 ?auto_112654 ) ) ( not ( = ?auto_112652 ?auto_112655 ) ) ( not ( = ?auto_112652 ?auto_112656 ) ) ( not ( = ?auto_112652 ?auto_112657 ) ) ( not ( = ?auto_112652 ?auto_112658 ) ) ( not ( = ?auto_112652 ?auto_112659 ) ) ( not ( = ?auto_112652 ?auto_112660 ) ) ( not ( = ?auto_112652 ?auto_112661 ) ) ( not ( = ?auto_112652 ?auto_112662 ) ) ( not ( = ?auto_112653 ?auto_112654 ) ) ( not ( = ?auto_112653 ?auto_112655 ) ) ( not ( = ?auto_112653 ?auto_112656 ) ) ( not ( = ?auto_112653 ?auto_112657 ) ) ( not ( = ?auto_112653 ?auto_112658 ) ) ( not ( = ?auto_112653 ?auto_112659 ) ) ( not ( = ?auto_112653 ?auto_112660 ) ) ( not ( = ?auto_112653 ?auto_112661 ) ) ( not ( = ?auto_112653 ?auto_112662 ) ) ( not ( = ?auto_112654 ?auto_112655 ) ) ( not ( = ?auto_112654 ?auto_112656 ) ) ( not ( = ?auto_112654 ?auto_112657 ) ) ( not ( = ?auto_112654 ?auto_112658 ) ) ( not ( = ?auto_112654 ?auto_112659 ) ) ( not ( = ?auto_112654 ?auto_112660 ) ) ( not ( = ?auto_112654 ?auto_112661 ) ) ( not ( = ?auto_112654 ?auto_112662 ) ) ( not ( = ?auto_112655 ?auto_112656 ) ) ( not ( = ?auto_112655 ?auto_112657 ) ) ( not ( = ?auto_112655 ?auto_112658 ) ) ( not ( = ?auto_112655 ?auto_112659 ) ) ( not ( = ?auto_112655 ?auto_112660 ) ) ( not ( = ?auto_112655 ?auto_112661 ) ) ( not ( = ?auto_112655 ?auto_112662 ) ) ( not ( = ?auto_112656 ?auto_112657 ) ) ( not ( = ?auto_112656 ?auto_112658 ) ) ( not ( = ?auto_112656 ?auto_112659 ) ) ( not ( = ?auto_112656 ?auto_112660 ) ) ( not ( = ?auto_112656 ?auto_112661 ) ) ( not ( = ?auto_112656 ?auto_112662 ) ) ( not ( = ?auto_112657 ?auto_112658 ) ) ( not ( = ?auto_112657 ?auto_112659 ) ) ( not ( = ?auto_112657 ?auto_112660 ) ) ( not ( = ?auto_112657 ?auto_112661 ) ) ( not ( = ?auto_112657 ?auto_112662 ) ) ( not ( = ?auto_112658 ?auto_112659 ) ) ( not ( = ?auto_112658 ?auto_112660 ) ) ( not ( = ?auto_112658 ?auto_112661 ) ) ( not ( = ?auto_112658 ?auto_112662 ) ) ( not ( = ?auto_112659 ?auto_112660 ) ) ( not ( = ?auto_112659 ?auto_112661 ) ) ( not ( = ?auto_112659 ?auto_112662 ) ) ( not ( = ?auto_112660 ?auto_112661 ) ) ( not ( = ?auto_112660 ?auto_112662 ) ) ( not ( = ?auto_112661 ?auto_112662 ) ) ( ON ?auto_112660 ?auto_112661 ) ( ON ?auto_112659 ?auto_112660 ) ( ON ?auto_112658 ?auto_112659 ) ( ON ?auto_112657 ?auto_112658 ) ( ON ?auto_112656 ?auto_112657 ) ( ON ?auto_112655 ?auto_112656 ) ( ON ?auto_112654 ?auto_112655 ) ( CLEAR ?auto_112652 ) ( ON ?auto_112653 ?auto_112654 ) ( CLEAR ?auto_112653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112652 ?auto_112653 )
      ( MAKE-10PILE ?auto_112652 ?auto_112653 ?auto_112654 ?auto_112655 ?auto_112656 ?auto_112657 ?auto_112658 ?auto_112659 ?auto_112660 ?auto_112661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_112694 - BLOCK
      ?auto_112695 - BLOCK
      ?auto_112696 - BLOCK
      ?auto_112697 - BLOCK
      ?auto_112698 - BLOCK
      ?auto_112699 - BLOCK
      ?auto_112700 - BLOCK
      ?auto_112701 - BLOCK
      ?auto_112702 - BLOCK
      ?auto_112703 - BLOCK
    )
    :vars
    (
      ?auto_112704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112703 ?auto_112704 ) ( not ( = ?auto_112694 ?auto_112695 ) ) ( not ( = ?auto_112694 ?auto_112696 ) ) ( not ( = ?auto_112694 ?auto_112697 ) ) ( not ( = ?auto_112694 ?auto_112698 ) ) ( not ( = ?auto_112694 ?auto_112699 ) ) ( not ( = ?auto_112694 ?auto_112700 ) ) ( not ( = ?auto_112694 ?auto_112701 ) ) ( not ( = ?auto_112694 ?auto_112702 ) ) ( not ( = ?auto_112694 ?auto_112703 ) ) ( not ( = ?auto_112694 ?auto_112704 ) ) ( not ( = ?auto_112695 ?auto_112696 ) ) ( not ( = ?auto_112695 ?auto_112697 ) ) ( not ( = ?auto_112695 ?auto_112698 ) ) ( not ( = ?auto_112695 ?auto_112699 ) ) ( not ( = ?auto_112695 ?auto_112700 ) ) ( not ( = ?auto_112695 ?auto_112701 ) ) ( not ( = ?auto_112695 ?auto_112702 ) ) ( not ( = ?auto_112695 ?auto_112703 ) ) ( not ( = ?auto_112695 ?auto_112704 ) ) ( not ( = ?auto_112696 ?auto_112697 ) ) ( not ( = ?auto_112696 ?auto_112698 ) ) ( not ( = ?auto_112696 ?auto_112699 ) ) ( not ( = ?auto_112696 ?auto_112700 ) ) ( not ( = ?auto_112696 ?auto_112701 ) ) ( not ( = ?auto_112696 ?auto_112702 ) ) ( not ( = ?auto_112696 ?auto_112703 ) ) ( not ( = ?auto_112696 ?auto_112704 ) ) ( not ( = ?auto_112697 ?auto_112698 ) ) ( not ( = ?auto_112697 ?auto_112699 ) ) ( not ( = ?auto_112697 ?auto_112700 ) ) ( not ( = ?auto_112697 ?auto_112701 ) ) ( not ( = ?auto_112697 ?auto_112702 ) ) ( not ( = ?auto_112697 ?auto_112703 ) ) ( not ( = ?auto_112697 ?auto_112704 ) ) ( not ( = ?auto_112698 ?auto_112699 ) ) ( not ( = ?auto_112698 ?auto_112700 ) ) ( not ( = ?auto_112698 ?auto_112701 ) ) ( not ( = ?auto_112698 ?auto_112702 ) ) ( not ( = ?auto_112698 ?auto_112703 ) ) ( not ( = ?auto_112698 ?auto_112704 ) ) ( not ( = ?auto_112699 ?auto_112700 ) ) ( not ( = ?auto_112699 ?auto_112701 ) ) ( not ( = ?auto_112699 ?auto_112702 ) ) ( not ( = ?auto_112699 ?auto_112703 ) ) ( not ( = ?auto_112699 ?auto_112704 ) ) ( not ( = ?auto_112700 ?auto_112701 ) ) ( not ( = ?auto_112700 ?auto_112702 ) ) ( not ( = ?auto_112700 ?auto_112703 ) ) ( not ( = ?auto_112700 ?auto_112704 ) ) ( not ( = ?auto_112701 ?auto_112702 ) ) ( not ( = ?auto_112701 ?auto_112703 ) ) ( not ( = ?auto_112701 ?auto_112704 ) ) ( not ( = ?auto_112702 ?auto_112703 ) ) ( not ( = ?auto_112702 ?auto_112704 ) ) ( not ( = ?auto_112703 ?auto_112704 ) ) ( ON ?auto_112702 ?auto_112703 ) ( ON ?auto_112701 ?auto_112702 ) ( ON ?auto_112700 ?auto_112701 ) ( ON ?auto_112699 ?auto_112700 ) ( ON ?auto_112698 ?auto_112699 ) ( ON ?auto_112697 ?auto_112698 ) ( ON ?auto_112696 ?auto_112697 ) ( ON ?auto_112695 ?auto_112696 ) ( ON ?auto_112694 ?auto_112695 ) ( CLEAR ?auto_112694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112694 )
      ( MAKE-10PILE ?auto_112694 ?auto_112695 ?auto_112696 ?auto_112697 ?auto_112698 ?auto_112699 ?auto_112700 ?auto_112701 ?auto_112702 ?auto_112703 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112737 - BLOCK
      ?auto_112738 - BLOCK
      ?auto_112739 - BLOCK
      ?auto_112740 - BLOCK
      ?auto_112741 - BLOCK
      ?auto_112742 - BLOCK
      ?auto_112743 - BLOCK
      ?auto_112744 - BLOCK
      ?auto_112745 - BLOCK
      ?auto_112746 - BLOCK
      ?auto_112747 - BLOCK
    )
    :vars
    (
      ?auto_112748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112746 ) ( ON ?auto_112747 ?auto_112748 ) ( CLEAR ?auto_112747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112737 ) ( ON ?auto_112738 ?auto_112737 ) ( ON ?auto_112739 ?auto_112738 ) ( ON ?auto_112740 ?auto_112739 ) ( ON ?auto_112741 ?auto_112740 ) ( ON ?auto_112742 ?auto_112741 ) ( ON ?auto_112743 ?auto_112742 ) ( ON ?auto_112744 ?auto_112743 ) ( ON ?auto_112745 ?auto_112744 ) ( ON ?auto_112746 ?auto_112745 ) ( not ( = ?auto_112737 ?auto_112738 ) ) ( not ( = ?auto_112737 ?auto_112739 ) ) ( not ( = ?auto_112737 ?auto_112740 ) ) ( not ( = ?auto_112737 ?auto_112741 ) ) ( not ( = ?auto_112737 ?auto_112742 ) ) ( not ( = ?auto_112737 ?auto_112743 ) ) ( not ( = ?auto_112737 ?auto_112744 ) ) ( not ( = ?auto_112737 ?auto_112745 ) ) ( not ( = ?auto_112737 ?auto_112746 ) ) ( not ( = ?auto_112737 ?auto_112747 ) ) ( not ( = ?auto_112737 ?auto_112748 ) ) ( not ( = ?auto_112738 ?auto_112739 ) ) ( not ( = ?auto_112738 ?auto_112740 ) ) ( not ( = ?auto_112738 ?auto_112741 ) ) ( not ( = ?auto_112738 ?auto_112742 ) ) ( not ( = ?auto_112738 ?auto_112743 ) ) ( not ( = ?auto_112738 ?auto_112744 ) ) ( not ( = ?auto_112738 ?auto_112745 ) ) ( not ( = ?auto_112738 ?auto_112746 ) ) ( not ( = ?auto_112738 ?auto_112747 ) ) ( not ( = ?auto_112738 ?auto_112748 ) ) ( not ( = ?auto_112739 ?auto_112740 ) ) ( not ( = ?auto_112739 ?auto_112741 ) ) ( not ( = ?auto_112739 ?auto_112742 ) ) ( not ( = ?auto_112739 ?auto_112743 ) ) ( not ( = ?auto_112739 ?auto_112744 ) ) ( not ( = ?auto_112739 ?auto_112745 ) ) ( not ( = ?auto_112739 ?auto_112746 ) ) ( not ( = ?auto_112739 ?auto_112747 ) ) ( not ( = ?auto_112739 ?auto_112748 ) ) ( not ( = ?auto_112740 ?auto_112741 ) ) ( not ( = ?auto_112740 ?auto_112742 ) ) ( not ( = ?auto_112740 ?auto_112743 ) ) ( not ( = ?auto_112740 ?auto_112744 ) ) ( not ( = ?auto_112740 ?auto_112745 ) ) ( not ( = ?auto_112740 ?auto_112746 ) ) ( not ( = ?auto_112740 ?auto_112747 ) ) ( not ( = ?auto_112740 ?auto_112748 ) ) ( not ( = ?auto_112741 ?auto_112742 ) ) ( not ( = ?auto_112741 ?auto_112743 ) ) ( not ( = ?auto_112741 ?auto_112744 ) ) ( not ( = ?auto_112741 ?auto_112745 ) ) ( not ( = ?auto_112741 ?auto_112746 ) ) ( not ( = ?auto_112741 ?auto_112747 ) ) ( not ( = ?auto_112741 ?auto_112748 ) ) ( not ( = ?auto_112742 ?auto_112743 ) ) ( not ( = ?auto_112742 ?auto_112744 ) ) ( not ( = ?auto_112742 ?auto_112745 ) ) ( not ( = ?auto_112742 ?auto_112746 ) ) ( not ( = ?auto_112742 ?auto_112747 ) ) ( not ( = ?auto_112742 ?auto_112748 ) ) ( not ( = ?auto_112743 ?auto_112744 ) ) ( not ( = ?auto_112743 ?auto_112745 ) ) ( not ( = ?auto_112743 ?auto_112746 ) ) ( not ( = ?auto_112743 ?auto_112747 ) ) ( not ( = ?auto_112743 ?auto_112748 ) ) ( not ( = ?auto_112744 ?auto_112745 ) ) ( not ( = ?auto_112744 ?auto_112746 ) ) ( not ( = ?auto_112744 ?auto_112747 ) ) ( not ( = ?auto_112744 ?auto_112748 ) ) ( not ( = ?auto_112745 ?auto_112746 ) ) ( not ( = ?auto_112745 ?auto_112747 ) ) ( not ( = ?auto_112745 ?auto_112748 ) ) ( not ( = ?auto_112746 ?auto_112747 ) ) ( not ( = ?auto_112746 ?auto_112748 ) ) ( not ( = ?auto_112747 ?auto_112748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112747 ?auto_112748 )
      ( !STACK ?auto_112747 ?auto_112746 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112760 - BLOCK
      ?auto_112761 - BLOCK
      ?auto_112762 - BLOCK
      ?auto_112763 - BLOCK
      ?auto_112764 - BLOCK
      ?auto_112765 - BLOCK
      ?auto_112766 - BLOCK
      ?auto_112767 - BLOCK
      ?auto_112768 - BLOCK
      ?auto_112769 - BLOCK
      ?auto_112770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112769 ) ( ON-TABLE ?auto_112770 ) ( CLEAR ?auto_112770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112760 ) ( ON ?auto_112761 ?auto_112760 ) ( ON ?auto_112762 ?auto_112761 ) ( ON ?auto_112763 ?auto_112762 ) ( ON ?auto_112764 ?auto_112763 ) ( ON ?auto_112765 ?auto_112764 ) ( ON ?auto_112766 ?auto_112765 ) ( ON ?auto_112767 ?auto_112766 ) ( ON ?auto_112768 ?auto_112767 ) ( ON ?auto_112769 ?auto_112768 ) ( not ( = ?auto_112760 ?auto_112761 ) ) ( not ( = ?auto_112760 ?auto_112762 ) ) ( not ( = ?auto_112760 ?auto_112763 ) ) ( not ( = ?auto_112760 ?auto_112764 ) ) ( not ( = ?auto_112760 ?auto_112765 ) ) ( not ( = ?auto_112760 ?auto_112766 ) ) ( not ( = ?auto_112760 ?auto_112767 ) ) ( not ( = ?auto_112760 ?auto_112768 ) ) ( not ( = ?auto_112760 ?auto_112769 ) ) ( not ( = ?auto_112760 ?auto_112770 ) ) ( not ( = ?auto_112761 ?auto_112762 ) ) ( not ( = ?auto_112761 ?auto_112763 ) ) ( not ( = ?auto_112761 ?auto_112764 ) ) ( not ( = ?auto_112761 ?auto_112765 ) ) ( not ( = ?auto_112761 ?auto_112766 ) ) ( not ( = ?auto_112761 ?auto_112767 ) ) ( not ( = ?auto_112761 ?auto_112768 ) ) ( not ( = ?auto_112761 ?auto_112769 ) ) ( not ( = ?auto_112761 ?auto_112770 ) ) ( not ( = ?auto_112762 ?auto_112763 ) ) ( not ( = ?auto_112762 ?auto_112764 ) ) ( not ( = ?auto_112762 ?auto_112765 ) ) ( not ( = ?auto_112762 ?auto_112766 ) ) ( not ( = ?auto_112762 ?auto_112767 ) ) ( not ( = ?auto_112762 ?auto_112768 ) ) ( not ( = ?auto_112762 ?auto_112769 ) ) ( not ( = ?auto_112762 ?auto_112770 ) ) ( not ( = ?auto_112763 ?auto_112764 ) ) ( not ( = ?auto_112763 ?auto_112765 ) ) ( not ( = ?auto_112763 ?auto_112766 ) ) ( not ( = ?auto_112763 ?auto_112767 ) ) ( not ( = ?auto_112763 ?auto_112768 ) ) ( not ( = ?auto_112763 ?auto_112769 ) ) ( not ( = ?auto_112763 ?auto_112770 ) ) ( not ( = ?auto_112764 ?auto_112765 ) ) ( not ( = ?auto_112764 ?auto_112766 ) ) ( not ( = ?auto_112764 ?auto_112767 ) ) ( not ( = ?auto_112764 ?auto_112768 ) ) ( not ( = ?auto_112764 ?auto_112769 ) ) ( not ( = ?auto_112764 ?auto_112770 ) ) ( not ( = ?auto_112765 ?auto_112766 ) ) ( not ( = ?auto_112765 ?auto_112767 ) ) ( not ( = ?auto_112765 ?auto_112768 ) ) ( not ( = ?auto_112765 ?auto_112769 ) ) ( not ( = ?auto_112765 ?auto_112770 ) ) ( not ( = ?auto_112766 ?auto_112767 ) ) ( not ( = ?auto_112766 ?auto_112768 ) ) ( not ( = ?auto_112766 ?auto_112769 ) ) ( not ( = ?auto_112766 ?auto_112770 ) ) ( not ( = ?auto_112767 ?auto_112768 ) ) ( not ( = ?auto_112767 ?auto_112769 ) ) ( not ( = ?auto_112767 ?auto_112770 ) ) ( not ( = ?auto_112768 ?auto_112769 ) ) ( not ( = ?auto_112768 ?auto_112770 ) ) ( not ( = ?auto_112769 ?auto_112770 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_112770 )
      ( !STACK ?auto_112770 ?auto_112769 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112782 - BLOCK
      ?auto_112783 - BLOCK
      ?auto_112784 - BLOCK
      ?auto_112785 - BLOCK
      ?auto_112786 - BLOCK
      ?auto_112787 - BLOCK
      ?auto_112788 - BLOCK
      ?auto_112789 - BLOCK
      ?auto_112790 - BLOCK
      ?auto_112791 - BLOCK
      ?auto_112792 - BLOCK
    )
    :vars
    (
      ?auto_112793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112792 ?auto_112793 ) ( ON-TABLE ?auto_112782 ) ( ON ?auto_112783 ?auto_112782 ) ( ON ?auto_112784 ?auto_112783 ) ( ON ?auto_112785 ?auto_112784 ) ( ON ?auto_112786 ?auto_112785 ) ( ON ?auto_112787 ?auto_112786 ) ( ON ?auto_112788 ?auto_112787 ) ( ON ?auto_112789 ?auto_112788 ) ( ON ?auto_112790 ?auto_112789 ) ( not ( = ?auto_112782 ?auto_112783 ) ) ( not ( = ?auto_112782 ?auto_112784 ) ) ( not ( = ?auto_112782 ?auto_112785 ) ) ( not ( = ?auto_112782 ?auto_112786 ) ) ( not ( = ?auto_112782 ?auto_112787 ) ) ( not ( = ?auto_112782 ?auto_112788 ) ) ( not ( = ?auto_112782 ?auto_112789 ) ) ( not ( = ?auto_112782 ?auto_112790 ) ) ( not ( = ?auto_112782 ?auto_112791 ) ) ( not ( = ?auto_112782 ?auto_112792 ) ) ( not ( = ?auto_112782 ?auto_112793 ) ) ( not ( = ?auto_112783 ?auto_112784 ) ) ( not ( = ?auto_112783 ?auto_112785 ) ) ( not ( = ?auto_112783 ?auto_112786 ) ) ( not ( = ?auto_112783 ?auto_112787 ) ) ( not ( = ?auto_112783 ?auto_112788 ) ) ( not ( = ?auto_112783 ?auto_112789 ) ) ( not ( = ?auto_112783 ?auto_112790 ) ) ( not ( = ?auto_112783 ?auto_112791 ) ) ( not ( = ?auto_112783 ?auto_112792 ) ) ( not ( = ?auto_112783 ?auto_112793 ) ) ( not ( = ?auto_112784 ?auto_112785 ) ) ( not ( = ?auto_112784 ?auto_112786 ) ) ( not ( = ?auto_112784 ?auto_112787 ) ) ( not ( = ?auto_112784 ?auto_112788 ) ) ( not ( = ?auto_112784 ?auto_112789 ) ) ( not ( = ?auto_112784 ?auto_112790 ) ) ( not ( = ?auto_112784 ?auto_112791 ) ) ( not ( = ?auto_112784 ?auto_112792 ) ) ( not ( = ?auto_112784 ?auto_112793 ) ) ( not ( = ?auto_112785 ?auto_112786 ) ) ( not ( = ?auto_112785 ?auto_112787 ) ) ( not ( = ?auto_112785 ?auto_112788 ) ) ( not ( = ?auto_112785 ?auto_112789 ) ) ( not ( = ?auto_112785 ?auto_112790 ) ) ( not ( = ?auto_112785 ?auto_112791 ) ) ( not ( = ?auto_112785 ?auto_112792 ) ) ( not ( = ?auto_112785 ?auto_112793 ) ) ( not ( = ?auto_112786 ?auto_112787 ) ) ( not ( = ?auto_112786 ?auto_112788 ) ) ( not ( = ?auto_112786 ?auto_112789 ) ) ( not ( = ?auto_112786 ?auto_112790 ) ) ( not ( = ?auto_112786 ?auto_112791 ) ) ( not ( = ?auto_112786 ?auto_112792 ) ) ( not ( = ?auto_112786 ?auto_112793 ) ) ( not ( = ?auto_112787 ?auto_112788 ) ) ( not ( = ?auto_112787 ?auto_112789 ) ) ( not ( = ?auto_112787 ?auto_112790 ) ) ( not ( = ?auto_112787 ?auto_112791 ) ) ( not ( = ?auto_112787 ?auto_112792 ) ) ( not ( = ?auto_112787 ?auto_112793 ) ) ( not ( = ?auto_112788 ?auto_112789 ) ) ( not ( = ?auto_112788 ?auto_112790 ) ) ( not ( = ?auto_112788 ?auto_112791 ) ) ( not ( = ?auto_112788 ?auto_112792 ) ) ( not ( = ?auto_112788 ?auto_112793 ) ) ( not ( = ?auto_112789 ?auto_112790 ) ) ( not ( = ?auto_112789 ?auto_112791 ) ) ( not ( = ?auto_112789 ?auto_112792 ) ) ( not ( = ?auto_112789 ?auto_112793 ) ) ( not ( = ?auto_112790 ?auto_112791 ) ) ( not ( = ?auto_112790 ?auto_112792 ) ) ( not ( = ?auto_112790 ?auto_112793 ) ) ( not ( = ?auto_112791 ?auto_112792 ) ) ( not ( = ?auto_112791 ?auto_112793 ) ) ( not ( = ?auto_112792 ?auto_112793 ) ) ( CLEAR ?auto_112790 ) ( ON ?auto_112791 ?auto_112792 ) ( CLEAR ?auto_112791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_112782 ?auto_112783 ?auto_112784 ?auto_112785 ?auto_112786 ?auto_112787 ?auto_112788 ?auto_112789 ?auto_112790 ?auto_112791 )
      ( MAKE-11PILE ?auto_112782 ?auto_112783 ?auto_112784 ?auto_112785 ?auto_112786 ?auto_112787 ?auto_112788 ?auto_112789 ?auto_112790 ?auto_112791 ?auto_112792 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112805 - BLOCK
      ?auto_112806 - BLOCK
      ?auto_112807 - BLOCK
      ?auto_112808 - BLOCK
      ?auto_112809 - BLOCK
      ?auto_112810 - BLOCK
      ?auto_112811 - BLOCK
      ?auto_112812 - BLOCK
      ?auto_112813 - BLOCK
      ?auto_112814 - BLOCK
      ?auto_112815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112815 ) ( ON-TABLE ?auto_112805 ) ( ON ?auto_112806 ?auto_112805 ) ( ON ?auto_112807 ?auto_112806 ) ( ON ?auto_112808 ?auto_112807 ) ( ON ?auto_112809 ?auto_112808 ) ( ON ?auto_112810 ?auto_112809 ) ( ON ?auto_112811 ?auto_112810 ) ( ON ?auto_112812 ?auto_112811 ) ( ON ?auto_112813 ?auto_112812 ) ( not ( = ?auto_112805 ?auto_112806 ) ) ( not ( = ?auto_112805 ?auto_112807 ) ) ( not ( = ?auto_112805 ?auto_112808 ) ) ( not ( = ?auto_112805 ?auto_112809 ) ) ( not ( = ?auto_112805 ?auto_112810 ) ) ( not ( = ?auto_112805 ?auto_112811 ) ) ( not ( = ?auto_112805 ?auto_112812 ) ) ( not ( = ?auto_112805 ?auto_112813 ) ) ( not ( = ?auto_112805 ?auto_112814 ) ) ( not ( = ?auto_112805 ?auto_112815 ) ) ( not ( = ?auto_112806 ?auto_112807 ) ) ( not ( = ?auto_112806 ?auto_112808 ) ) ( not ( = ?auto_112806 ?auto_112809 ) ) ( not ( = ?auto_112806 ?auto_112810 ) ) ( not ( = ?auto_112806 ?auto_112811 ) ) ( not ( = ?auto_112806 ?auto_112812 ) ) ( not ( = ?auto_112806 ?auto_112813 ) ) ( not ( = ?auto_112806 ?auto_112814 ) ) ( not ( = ?auto_112806 ?auto_112815 ) ) ( not ( = ?auto_112807 ?auto_112808 ) ) ( not ( = ?auto_112807 ?auto_112809 ) ) ( not ( = ?auto_112807 ?auto_112810 ) ) ( not ( = ?auto_112807 ?auto_112811 ) ) ( not ( = ?auto_112807 ?auto_112812 ) ) ( not ( = ?auto_112807 ?auto_112813 ) ) ( not ( = ?auto_112807 ?auto_112814 ) ) ( not ( = ?auto_112807 ?auto_112815 ) ) ( not ( = ?auto_112808 ?auto_112809 ) ) ( not ( = ?auto_112808 ?auto_112810 ) ) ( not ( = ?auto_112808 ?auto_112811 ) ) ( not ( = ?auto_112808 ?auto_112812 ) ) ( not ( = ?auto_112808 ?auto_112813 ) ) ( not ( = ?auto_112808 ?auto_112814 ) ) ( not ( = ?auto_112808 ?auto_112815 ) ) ( not ( = ?auto_112809 ?auto_112810 ) ) ( not ( = ?auto_112809 ?auto_112811 ) ) ( not ( = ?auto_112809 ?auto_112812 ) ) ( not ( = ?auto_112809 ?auto_112813 ) ) ( not ( = ?auto_112809 ?auto_112814 ) ) ( not ( = ?auto_112809 ?auto_112815 ) ) ( not ( = ?auto_112810 ?auto_112811 ) ) ( not ( = ?auto_112810 ?auto_112812 ) ) ( not ( = ?auto_112810 ?auto_112813 ) ) ( not ( = ?auto_112810 ?auto_112814 ) ) ( not ( = ?auto_112810 ?auto_112815 ) ) ( not ( = ?auto_112811 ?auto_112812 ) ) ( not ( = ?auto_112811 ?auto_112813 ) ) ( not ( = ?auto_112811 ?auto_112814 ) ) ( not ( = ?auto_112811 ?auto_112815 ) ) ( not ( = ?auto_112812 ?auto_112813 ) ) ( not ( = ?auto_112812 ?auto_112814 ) ) ( not ( = ?auto_112812 ?auto_112815 ) ) ( not ( = ?auto_112813 ?auto_112814 ) ) ( not ( = ?auto_112813 ?auto_112815 ) ) ( not ( = ?auto_112814 ?auto_112815 ) ) ( CLEAR ?auto_112813 ) ( ON ?auto_112814 ?auto_112815 ) ( CLEAR ?auto_112814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_112805 ?auto_112806 ?auto_112807 ?auto_112808 ?auto_112809 ?auto_112810 ?auto_112811 ?auto_112812 ?auto_112813 ?auto_112814 )
      ( MAKE-11PILE ?auto_112805 ?auto_112806 ?auto_112807 ?auto_112808 ?auto_112809 ?auto_112810 ?auto_112811 ?auto_112812 ?auto_112813 ?auto_112814 ?auto_112815 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112827 - BLOCK
      ?auto_112828 - BLOCK
      ?auto_112829 - BLOCK
      ?auto_112830 - BLOCK
      ?auto_112831 - BLOCK
      ?auto_112832 - BLOCK
      ?auto_112833 - BLOCK
      ?auto_112834 - BLOCK
      ?auto_112835 - BLOCK
      ?auto_112836 - BLOCK
      ?auto_112837 - BLOCK
    )
    :vars
    (
      ?auto_112838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112837 ?auto_112838 ) ( ON-TABLE ?auto_112827 ) ( ON ?auto_112828 ?auto_112827 ) ( ON ?auto_112829 ?auto_112828 ) ( ON ?auto_112830 ?auto_112829 ) ( ON ?auto_112831 ?auto_112830 ) ( ON ?auto_112832 ?auto_112831 ) ( ON ?auto_112833 ?auto_112832 ) ( ON ?auto_112834 ?auto_112833 ) ( not ( = ?auto_112827 ?auto_112828 ) ) ( not ( = ?auto_112827 ?auto_112829 ) ) ( not ( = ?auto_112827 ?auto_112830 ) ) ( not ( = ?auto_112827 ?auto_112831 ) ) ( not ( = ?auto_112827 ?auto_112832 ) ) ( not ( = ?auto_112827 ?auto_112833 ) ) ( not ( = ?auto_112827 ?auto_112834 ) ) ( not ( = ?auto_112827 ?auto_112835 ) ) ( not ( = ?auto_112827 ?auto_112836 ) ) ( not ( = ?auto_112827 ?auto_112837 ) ) ( not ( = ?auto_112827 ?auto_112838 ) ) ( not ( = ?auto_112828 ?auto_112829 ) ) ( not ( = ?auto_112828 ?auto_112830 ) ) ( not ( = ?auto_112828 ?auto_112831 ) ) ( not ( = ?auto_112828 ?auto_112832 ) ) ( not ( = ?auto_112828 ?auto_112833 ) ) ( not ( = ?auto_112828 ?auto_112834 ) ) ( not ( = ?auto_112828 ?auto_112835 ) ) ( not ( = ?auto_112828 ?auto_112836 ) ) ( not ( = ?auto_112828 ?auto_112837 ) ) ( not ( = ?auto_112828 ?auto_112838 ) ) ( not ( = ?auto_112829 ?auto_112830 ) ) ( not ( = ?auto_112829 ?auto_112831 ) ) ( not ( = ?auto_112829 ?auto_112832 ) ) ( not ( = ?auto_112829 ?auto_112833 ) ) ( not ( = ?auto_112829 ?auto_112834 ) ) ( not ( = ?auto_112829 ?auto_112835 ) ) ( not ( = ?auto_112829 ?auto_112836 ) ) ( not ( = ?auto_112829 ?auto_112837 ) ) ( not ( = ?auto_112829 ?auto_112838 ) ) ( not ( = ?auto_112830 ?auto_112831 ) ) ( not ( = ?auto_112830 ?auto_112832 ) ) ( not ( = ?auto_112830 ?auto_112833 ) ) ( not ( = ?auto_112830 ?auto_112834 ) ) ( not ( = ?auto_112830 ?auto_112835 ) ) ( not ( = ?auto_112830 ?auto_112836 ) ) ( not ( = ?auto_112830 ?auto_112837 ) ) ( not ( = ?auto_112830 ?auto_112838 ) ) ( not ( = ?auto_112831 ?auto_112832 ) ) ( not ( = ?auto_112831 ?auto_112833 ) ) ( not ( = ?auto_112831 ?auto_112834 ) ) ( not ( = ?auto_112831 ?auto_112835 ) ) ( not ( = ?auto_112831 ?auto_112836 ) ) ( not ( = ?auto_112831 ?auto_112837 ) ) ( not ( = ?auto_112831 ?auto_112838 ) ) ( not ( = ?auto_112832 ?auto_112833 ) ) ( not ( = ?auto_112832 ?auto_112834 ) ) ( not ( = ?auto_112832 ?auto_112835 ) ) ( not ( = ?auto_112832 ?auto_112836 ) ) ( not ( = ?auto_112832 ?auto_112837 ) ) ( not ( = ?auto_112832 ?auto_112838 ) ) ( not ( = ?auto_112833 ?auto_112834 ) ) ( not ( = ?auto_112833 ?auto_112835 ) ) ( not ( = ?auto_112833 ?auto_112836 ) ) ( not ( = ?auto_112833 ?auto_112837 ) ) ( not ( = ?auto_112833 ?auto_112838 ) ) ( not ( = ?auto_112834 ?auto_112835 ) ) ( not ( = ?auto_112834 ?auto_112836 ) ) ( not ( = ?auto_112834 ?auto_112837 ) ) ( not ( = ?auto_112834 ?auto_112838 ) ) ( not ( = ?auto_112835 ?auto_112836 ) ) ( not ( = ?auto_112835 ?auto_112837 ) ) ( not ( = ?auto_112835 ?auto_112838 ) ) ( not ( = ?auto_112836 ?auto_112837 ) ) ( not ( = ?auto_112836 ?auto_112838 ) ) ( not ( = ?auto_112837 ?auto_112838 ) ) ( ON ?auto_112836 ?auto_112837 ) ( CLEAR ?auto_112834 ) ( ON ?auto_112835 ?auto_112836 ) ( CLEAR ?auto_112835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_112827 ?auto_112828 ?auto_112829 ?auto_112830 ?auto_112831 ?auto_112832 ?auto_112833 ?auto_112834 ?auto_112835 )
      ( MAKE-11PILE ?auto_112827 ?auto_112828 ?auto_112829 ?auto_112830 ?auto_112831 ?auto_112832 ?auto_112833 ?auto_112834 ?auto_112835 ?auto_112836 ?auto_112837 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112850 - BLOCK
      ?auto_112851 - BLOCK
      ?auto_112852 - BLOCK
      ?auto_112853 - BLOCK
      ?auto_112854 - BLOCK
      ?auto_112855 - BLOCK
      ?auto_112856 - BLOCK
      ?auto_112857 - BLOCK
      ?auto_112858 - BLOCK
      ?auto_112859 - BLOCK
      ?auto_112860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112860 ) ( ON-TABLE ?auto_112850 ) ( ON ?auto_112851 ?auto_112850 ) ( ON ?auto_112852 ?auto_112851 ) ( ON ?auto_112853 ?auto_112852 ) ( ON ?auto_112854 ?auto_112853 ) ( ON ?auto_112855 ?auto_112854 ) ( ON ?auto_112856 ?auto_112855 ) ( ON ?auto_112857 ?auto_112856 ) ( not ( = ?auto_112850 ?auto_112851 ) ) ( not ( = ?auto_112850 ?auto_112852 ) ) ( not ( = ?auto_112850 ?auto_112853 ) ) ( not ( = ?auto_112850 ?auto_112854 ) ) ( not ( = ?auto_112850 ?auto_112855 ) ) ( not ( = ?auto_112850 ?auto_112856 ) ) ( not ( = ?auto_112850 ?auto_112857 ) ) ( not ( = ?auto_112850 ?auto_112858 ) ) ( not ( = ?auto_112850 ?auto_112859 ) ) ( not ( = ?auto_112850 ?auto_112860 ) ) ( not ( = ?auto_112851 ?auto_112852 ) ) ( not ( = ?auto_112851 ?auto_112853 ) ) ( not ( = ?auto_112851 ?auto_112854 ) ) ( not ( = ?auto_112851 ?auto_112855 ) ) ( not ( = ?auto_112851 ?auto_112856 ) ) ( not ( = ?auto_112851 ?auto_112857 ) ) ( not ( = ?auto_112851 ?auto_112858 ) ) ( not ( = ?auto_112851 ?auto_112859 ) ) ( not ( = ?auto_112851 ?auto_112860 ) ) ( not ( = ?auto_112852 ?auto_112853 ) ) ( not ( = ?auto_112852 ?auto_112854 ) ) ( not ( = ?auto_112852 ?auto_112855 ) ) ( not ( = ?auto_112852 ?auto_112856 ) ) ( not ( = ?auto_112852 ?auto_112857 ) ) ( not ( = ?auto_112852 ?auto_112858 ) ) ( not ( = ?auto_112852 ?auto_112859 ) ) ( not ( = ?auto_112852 ?auto_112860 ) ) ( not ( = ?auto_112853 ?auto_112854 ) ) ( not ( = ?auto_112853 ?auto_112855 ) ) ( not ( = ?auto_112853 ?auto_112856 ) ) ( not ( = ?auto_112853 ?auto_112857 ) ) ( not ( = ?auto_112853 ?auto_112858 ) ) ( not ( = ?auto_112853 ?auto_112859 ) ) ( not ( = ?auto_112853 ?auto_112860 ) ) ( not ( = ?auto_112854 ?auto_112855 ) ) ( not ( = ?auto_112854 ?auto_112856 ) ) ( not ( = ?auto_112854 ?auto_112857 ) ) ( not ( = ?auto_112854 ?auto_112858 ) ) ( not ( = ?auto_112854 ?auto_112859 ) ) ( not ( = ?auto_112854 ?auto_112860 ) ) ( not ( = ?auto_112855 ?auto_112856 ) ) ( not ( = ?auto_112855 ?auto_112857 ) ) ( not ( = ?auto_112855 ?auto_112858 ) ) ( not ( = ?auto_112855 ?auto_112859 ) ) ( not ( = ?auto_112855 ?auto_112860 ) ) ( not ( = ?auto_112856 ?auto_112857 ) ) ( not ( = ?auto_112856 ?auto_112858 ) ) ( not ( = ?auto_112856 ?auto_112859 ) ) ( not ( = ?auto_112856 ?auto_112860 ) ) ( not ( = ?auto_112857 ?auto_112858 ) ) ( not ( = ?auto_112857 ?auto_112859 ) ) ( not ( = ?auto_112857 ?auto_112860 ) ) ( not ( = ?auto_112858 ?auto_112859 ) ) ( not ( = ?auto_112858 ?auto_112860 ) ) ( not ( = ?auto_112859 ?auto_112860 ) ) ( ON ?auto_112859 ?auto_112860 ) ( CLEAR ?auto_112857 ) ( ON ?auto_112858 ?auto_112859 ) ( CLEAR ?auto_112858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_112850 ?auto_112851 ?auto_112852 ?auto_112853 ?auto_112854 ?auto_112855 ?auto_112856 ?auto_112857 ?auto_112858 )
      ( MAKE-11PILE ?auto_112850 ?auto_112851 ?auto_112852 ?auto_112853 ?auto_112854 ?auto_112855 ?auto_112856 ?auto_112857 ?auto_112858 ?auto_112859 ?auto_112860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112872 - BLOCK
      ?auto_112873 - BLOCK
      ?auto_112874 - BLOCK
      ?auto_112875 - BLOCK
      ?auto_112876 - BLOCK
      ?auto_112877 - BLOCK
      ?auto_112878 - BLOCK
      ?auto_112879 - BLOCK
      ?auto_112880 - BLOCK
      ?auto_112881 - BLOCK
      ?auto_112882 - BLOCK
    )
    :vars
    (
      ?auto_112883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112882 ?auto_112883 ) ( ON-TABLE ?auto_112872 ) ( ON ?auto_112873 ?auto_112872 ) ( ON ?auto_112874 ?auto_112873 ) ( ON ?auto_112875 ?auto_112874 ) ( ON ?auto_112876 ?auto_112875 ) ( ON ?auto_112877 ?auto_112876 ) ( ON ?auto_112878 ?auto_112877 ) ( not ( = ?auto_112872 ?auto_112873 ) ) ( not ( = ?auto_112872 ?auto_112874 ) ) ( not ( = ?auto_112872 ?auto_112875 ) ) ( not ( = ?auto_112872 ?auto_112876 ) ) ( not ( = ?auto_112872 ?auto_112877 ) ) ( not ( = ?auto_112872 ?auto_112878 ) ) ( not ( = ?auto_112872 ?auto_112879 ) ) ( not ( = ?auto_112872 ?auto_112880 ) ) ( not ( = ?auto_112872 ?auto_112881 ) ) ( not ( = ?auto_112872 ?auto_112882 ) ) ( not ( = ?auto_112872 ?auto_112883 ) ) ( not ( = ?auto_112873 ?auto_112874 ) ) ( not ( = ?auto_112873 ?auto_112875 ) ) ( not ( = ?auto_112873 ?auto_112876 ) ) ( not ( = ?auto_112873 ?auto_112877 ) ) ( not ( = ?auto_112873 ?auto_112878 ) ) ( not ( = ?auto_112873 ?auto_112879 ) ) ( not ( = ?auto_112873 ?auto_112880 ) ) ( not ( = ?auto_112873 ?auto_112881 ) ) ( not ( = ?auto_112873 ?auto_112882 ) ) ( not ( = ?auto_112873 ?auto_112883 ) ) ( not ( = ?auto_112874 ?auto_112875 ) ) ( not ( = ?auto_112874 ?auto_112876 ) ) ( not ( = ?auto_112874 ?auto_112877 ) ) ( not ( = ?auto_112874 ?auto_112878 ) ) ( not ( = ?auto_112874 ?auto_112879 ) ) ( not ( = ?auto_112874 ?auto_112880 ) ) ( not ( = ?auto_112874 ?auto_112881 ) ) ( not ( = ?auto_112874 ?auto_112882 ) ) ( not ( = ?auto_112874 ?auto_112883 ) ) ( not ( = ?auto_112875 ?auto_112876 ) ) ( not ( = ?auto_112875 ?auto_112877 ) ) ( not ( = ?auto_112875 ?auto_112878 ) ) ( not ( = ?auto_112875 ?auto_112879 ) ) ( not ( = ?auto_112875 ?auto_112880 ) ) ( not ( = ?auto_112875 ?auto_112881 ) ) ( not ( = ?auto_112875 ?auto_112882 ) ) ( not ( = ?auto_112875 ?auto_112883 ) ) ( not ( = ?auto_112876 ?auto_112877 ) ) ( not ( = ?auto_112876 ?auto_112878 ) ) ( not ( = ?auto_112876 ?auto_112879 ) ) ( not ( = ?auto_112876 ?auto_112880 ) ) ( not ( = ?auto_112876 ?auto_112881 ) ) ( not ( = ?auto_112876 ?auto_112882 ) ) ( not ( = ?auto_112876 ?auto_112883 ) ) ( not ( = ?auto_112877 ?auto_112878 ) ) ( not ( = ?auto_112877 ?auto_112879 ) ) ( not ( = ?auto_112877 ?auto_112880 ) ) ( not ( = ?auto_112877 ?auto_112881 ) ) ( not ( = ?auto_112877 ?auto_112882 ) ) ( not ( = ?auto_112877 ?auto_112883 ) ) ( not ( = ?auto_112878 ?auto_112879 ) ) ( not ( = ?auto_112878 ?auto_112880 ) ) ( not ( = ?auto_112878 ?auto_112881 ) ) ( not ( = ?auto_112878 ?auto_112882 ) ) ( not ( = ?auto_112878 ?auto_112883 ) ) ( not ( = ?auto_112879 ?auto_112880 ) ) ( not ( = ?auto_112879 ?auto_112881 ) ) ( not ( = ?auto_112879 ?auto_112882 ) ) ( not ( = ?auto_112879 ?auto_112883 ) ) ( not ( = ?auto_112880 ?auto_112881 ) ) ( not ( = ?auto_112880 ?auto_112882 ) ) ( not ( = ?auto_112880 ?auto_112883 ) ) ( not ( = ?auto_112881 ?auto_112882 ) ) ( not ( = ?auto_112881 ?auto_112883 ) ) ( not ( = ?auto_112882 ?auto_112883 ) ) ( ON ?auto_112881 ?auto_112882 ) ( ON ?auto_112880 ?auto_112881 ) ( CLEAR ?auto_112878 ) ( ON ?auto_112879 ?auto_112880 ) ( CLEAR ?auto_112879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_112872 ?auto_112873 ?auto_112874 ?auto_112875 ?auto_112876 ?auto_112877 ?auto_112878 ?auto_112879 )
      ( MAKE-11PILE ?auto_112872 ?auto_112873 ?auto_112874 ?auto_112875 ?auto_112876 ?auto_112877 ?auto_112878 ?auto_112879 ?auto_112880 ?auto_112881 ?auto_112882 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112895 - BLOCK
      ?auto_112896 - BLOCK
      ?auto_112897 - BLOCK
      ?auto_112898 - BLOCK
      ?auto_112899 - BLOCK
      ?auto_112900 - BLOCK
      ?auto_112901 - BLOCK
      ?auto_112902 - BLOCK
      ?auto_112903 - BLOCK
      ?auto_112904 - BLOCK
      ?auto_112905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112905 ) ( ON-TABLE ?auto_112895 ) ( ON ?auto_112896 ?auto_112895 ) ( ON ?auto_112897 ?auto_112896 ) ( ON ?auto_112898 ?auto_112897 ) ( ON ?auto_112899 ?auto_112898 ) ( ON ?auto_112900 ?auto_112899 ) ( ON ?auto_112901 ?auto_112900 ) ( not ( = ?auto_112895 ?auto_112896 ) ) ( not ( = ?auto_112895 ?auto_112897 ) ) ( not ( = ?auto_112895 ?auto_112898 ) ) ( not ( = ?auto_112895 ?auto_112899 ) ) ( not ( = ?auto_112895 ?auto_112900 ) ) ( not ( = ?auto_112895 ?auto_112901 ) ) ( not ( = ?auto_112895 ?auto_112902 ) ) ( not ( = ?auto_112895 ?auto_112903 ) ) ( not ( = ?auto_112895 ?auto_112904 ) ) ( not ( = ?auto_112895 ?auto_112905 ) ) ( not ( = ?auto_112896 ?auto_112897 ) ) ( not ( = ?auto_112896 ?auto_112898 ) ) ( not ( = ?auto_112896 ?auto_112899 ) ) ( not ( = ?auto_112896 ?auto_112900 ) ) ( not ( = ?auto_112896 ?auto_112901 ) ) ( not ( = ?auto_112896 ?auto_112902 ) ) ( not ( = ?auto_112896 ?auto_112903 ) ) ( not ( = ?auto_112896 ?auto_112904 ) ) ( not ( = ?auto_112896 ?auto_112905 ) ) ( not ( = ?auto_112897 ?auto_112898 ) ) ( not ( = ?auto_112897 ?auto_112899 ) ) ( not ( = ?auto_112897 ?auto_112900 ) ) ( not ( = ?auto_112897 ?auto_112901 ) ) ( not ( = ?auto_112897 ?auto_112902 ) ) ( not ( = ?auto_112897 ?auto_112903 ) ) ( not ( = ?auto_112897 ?auto_112904 ) ) ( not ( = ?auto_112897 ?auto_112905 ) ) ( not ( = ?auto_112898 ?auto_112899 ) ) ( not ( = ?auto_112898 ?auto_112900 ) ) ( not ( = ?auto_112898 ?auto_112901 ) ) ( not ( = ?auto_112898 ?auto_112902 ) ) ( not ( = ?auto_112898 ?auto_112903 ) ) ( not ( = ?auto_112898 ?auto_112904 ) ) ( not ( = ?auto_112898 ?auto_112905 ) ) ( not ( = ?auto_112899 ?auto_112900 ) ) ( not ( = ?auto_112899 ?auto_112901 ) ) ( not ( = ?auto_112899 ?auto_112902 ) ) ( not ( = ?auto_112899 ?auto_112903 ) ) ( not ( = ?auto_112899 ?auto_112904 ) ) ( not ( = ?auto_112899 ?auto_112905 ) ) ( not ( = ?auto_112900 ?auto_112901 ) ) ( not ( = ?auto_112900 ?auto_112902 ) ) ( not ( = ?auto_112900 ?auto_112903 ) ) ( not ( = ?auto_112900 ?auto_112904 ) ) ( not ( = ?auto_112900 ?auto_112905 ) ) ( not ( = ?auto_112901 ?auto_112902 ) ) ( not ( = ?auto_112901 ?auto_112903 ) ) ( not ( = ?auto_112901 ?auto_112904 ) ) ( not ( = ?auto_112901 ?auto_112905 ) ) ( not ( = ?auto_112902 ?auto_112903 ) ) ( not ( = ?auto_112902 ?auto_112904 ) ) ( not ( = ?auto_112902 ?auto_112905 ) ) ( not ( = ?auto_112903 ?auto_112904 ) ) ( not ( = ?auto_112903 ?auto_112905 ) ) ( not ( = ?auto_112904 ?auto_112905 ) ) ( ON ?auto_112904 ?auto_112905 ) ( ON ?auto_112903 ?auto_112904 ) ( CLEAR ?auto_112901 ) ( ON ?auto_112902 ?auto_112903 ) ( CLEAR ?auto_112902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_112895 ?auto_112896 ?auto_112897 ?auto_112898 ?auto_112899 ?auto_112900 ?auto_112901 ?auto_112902 )
      ( MAKE-11PILE ?auto_112895 ?auto_112896 ?auto_112897 ?auto_112898 ?auto_112899 ?auto_112900 ?auto_112901 ?auto_112902 ?auto_112903 ?auto_112904 ?auto_112905 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112917 - BLOCK
      ?auto_112918 - BLOCK
      ?auto_112919 - BLOCK
      ?auto_112920 - BLOCK
      ?auto_112921 - BLOCK
      ?auto_112922 - BLOCK
      ?auto_112923 - BLOCK
      ?auto_112924 - BLOCK
      ?auto_112925 - BLOCK
      ?auto_112926 - BLOCK
      ?auto_112927 - BLOCK
    )
    :vars
    (
      ?auto_112928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112927 ?auto_112928 ) ( ON-TABLE ?auto_112917 ) ( ON ?auto_112918 ?auto_112917 ) ( ON ?auto_112919 ?auto_112918 ) ( ON ?auto_112920 ?auto_112919 ) ( ON ?auto_112921 ?auto_112920 ) ( ON ?auto_112922 ?auto_112921 ) ( not ( = ?auto_112917 ?auto_112918 ) ) ( not ( = ?auto_112917 ?auto_112919 ) ) ( not ( = ?auto_112917 ?auto_112920 ) ) ( not ( = ?auto_112917 ?auto_112921 ) ) ( not ( = ?auto_112917 ?auto_112922 ) ) ( not ( = ?auto_112917 ?auto_112923 ) ) ( not ( = ?auto_112917 ?auto_112924 ) ) ( not ( = ?auto_112917 ?auto_112925 ) ) ( not ( = ?auto_112917 ?auto_112926 ) ) ( not ( = ?auto_112917 ?auto_112927 ) ) ( not ( = ?auto_112917 ?auto_112928 ) ) ( not ( = ?auto_112918 ?auto_112919 ) ) ( not ( = ?auto_112918 ?auto_112920 ) ) ( not ( = ?auto_112918 ?auto_112921 ) ) ( not ( = ?auto_112918 ?auto_112922 ) ) ( not ( = ?auto_112918 ?auto_112923 ) ) ( not ( = ?auto_112918 ?auto_112924 ) ) ( not ( = ?auto_112918 ?auto_112925 ) ) ( not ( = ?auto_112918 ?auto_112926 ) ) ( not ( = ?auto_112918 ?auto_112927 ) ) ( not ( = ?auto_112918 ?auto_112928 ) ) ( not ( = ?auto_112919 ?auto_112920 ) ) ( not ( = ?auto_112919 ?auto_112921 ) ) ( not ( = ?auto_112919 ?auto_112922 ) ) ( not ( = ?auto_112919 ?auto_112923 ) ) ( not ( = ?auto_112919 ?auto_112924 ) ) ( not ( = ?auto_112919 ?auto_112925 ) ) ( not ( = ?auto_112919 ?auto_112926 ) ) ( not ( = ?auto_112919 ?auto_112927 ) ) ( not ( = ?auto_112919 ?auto_112928 ) ) ( not ( = ?auto_112920 ?auto_112921 ) ) ( not ( = ?auto_112920 ?auto_112922 ) ) ( not ( = ?auto_112920 ?auto_112923 ) ) ( not ( = ?auto_112920 ?auto_112924 ) ) ( not ( = ?auto_112920 ?auto_112925 ) ) ( not ( = ?auto_112920 ?auto_112926 ) ) ( not ( = ?auto_112920 ?auto_112927 ) ) ( not ( = ?auto_112920 ?auto_112928 ) ) ( not ( = ?auto_112921 ?auto_112922 ) ) ( not ( = ?auto_112921 ?auto_112923 ) ) ( not ( = ?auto_112921 ?auto_112924 ) ) ( not ( = ?auto_112921 ?auto_112925 ) ) ( not ( = ?auto_112921 ?auto_112926 ) ) ( not ( = ?auto_112921 ?auto_112927 ) ) ( not ( = ?auto_112921 ?auto_112928 ) ) ( not ( = ?auto_112922 ?auto_112923 ) ) ( not ( = ?auto_112922 ?auto_112924 ) ) ( not ( = ?auto_112922 ?auto_112925 ) ) ( not ( = ?auto_112922 ?auto_112926 ) ) ( not ( = ?auto_112922 ?auto_112927 ) ) ( not ( = ?auto_112922 ?auto_112928 ) ) ( not ( = ?auto_112923 ?auto_112924 ) ) ( not ( = ?auto_112923 ?auto_112925 ) ) ( not ( = ?auto_112923 ?auto_112926 ) ) ( not ( = ?auto_112923 ?auto_112927 ) ) ( not ( = ?auto_112923 ?auto_112928 ) ) ( not ( = ?auto_112924 ?auto_112925 ) ) ( not ( = ?auto_112924 ?auto_112926 ) ) ( not ( = ?auto_112924 ?auto_112927 ) ) ( not ( = ?auto_112924 ?auto_112928 ) ) ( not ( = ?auto_112925 ?auto_112926 ) ) ( not ( = ?auto_112925 ?auto_112927 ) ) ( not ( = ?auto_112925 ?auto_112928 ) ) ( not ( = ?auto_112926 ?auto_112927 ) ) ( not ( = ?auto_112926 ?auto_112928 ) ) ( not ( = ?auto_112927 ?auto_112928 ) ) ( ON ?auto_112926 ?auto_112927 ) ( ON ?auto_112925 ?auto_112926 ) ( ON ?auto_112924 ?auto_112925 ) ( CLEAR ?auto_112922 ) ( ON ?auto_112923 ?auto_112924 ) ( CLEAR ?auto_112923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112917 ?auto_112918 ?auto_112919 ?auto_112920 ?auto_112921 ?auto_112922 ?auto_112923 )
      ( MAKE-11PILE ?auto_112917 ?auto_112918 ?auto_112919 ?auto_112920 ?auto_112921 ?auto_112922 ?auto_112923 ?auto_112924 ?auto_112925 ?auto_112926 ?auto_112927 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112940 - BLOCK
      ?auto_112941 - BLOCK
      ?auto_112942 - BLOCK
      ?auto_112943 - BLOCK
      ?auto_112944 - BLOCK
      ?auto_112945 - BLOCK
      ?auto_112946 - BLOCK
      ?auto_112947 - BLOCK
      ?auto_112948 - BLOCK
      ?auto_112949 - BLOCK
      ?auto_112950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112950 ) ( ON-TABLE ?auto_112940 ) ( ON ?auto_112941 ?auto_112940 ) ( ON ?auto_112942 ?auto_112941 ) ( ON ?auto_112943 ?auto_112942 ) ( ON ?auto_112944 ?auto_112943 ) ( ON ?auto_112945 ?auto_112944 ) ( not ( = ?auto_112940 ?auto_112941 ) ) ( not ( = ?auto_112940 ?auto_112942 ) ) ( not ( = ?auto_112940 ?auto_112943 ) ) ( not ( = ?auto_112940 ?auto_112944 ) ) ( not ( = ?auto_112940 ?auto_112945 ) ) ( not ( = ?auto_112940 ?auto_112946 ) ) ( not ( = ?auto_112940 ?auto_112947 ) ) ( not ( = ?auto_112940 ?auto_112948 ) ) ( not ( = ?auto_112940 ?auto_112949 ) ) ( not ( = ?auto_112940 ?auto_112950 ) ) ( not ( = ?auto_112941 ?auto_112942 ) ) ( not ( = ?auto_112941 ?auto_112943 ) ) ( not ( = ?auto_112941 ?auto_112944 ) ) ( not ( = ?auto_112941 ?auto_112945 ) ) ( not ( = ?auto_112941 ?auto_112946 ) ) ( not ( = ?auto_112941 ?auto_112947 ) ) ( not ( = ?auto_112941 ?auto_112948 ) ) ( not ( = ?auto_112941 ?auto_112949 ) ) ( not ( = ?auto_112941 ?auto_112950 ) ) ( not ( = ?auto_112942 ?auto_112943 ) ) ( not ( = ?auto_112942 ?auto_112944 ) ) ( not ( = ?auto_112942 ?auto_112945 ) ) ( not ( = ?auto_112942 ?auto_112946 ) ) ( not ( = ?auto_112942 ?auto_112947 ) ) ( not ( = ?auto_112942 ?auto_112948 ) ) ( not ( = ?auto_112942 ?auto_112949 ) ) ( not ( = ?auto_112942 ?auto_112950 ) ) ( not ( = ?auto_112943 ?auto_112944 ) ) ( not ( = ?auto_112943 ?auto_112945 ) ) ( not ( = ?auto_112943 ?auto_112946 ) ) ( not ( = ?auto_112943 ?auto_112947 ) ) ( not ( = ?auto_112943 ?auto_112948 ) ) ( not ( = ?auto_112943 ?auto_112949 ) ) ( not ( = ?auto_112943 ?auto_112950 ) ) ( not ( = ?auto_112944 ?auto_112945 ) ) ( not ( = ?auto_112944 ?auto_112946 ) ) ( not ( = ?auto_112944 ?auto_112947 ) ) ( not ( = ?auto_112944 ?auto_112948 ) ) ( not ( = ?auto_112944 ?auto_112949 ) ) ( not ( = ?auto_112944 ?auto_112950 ) ) ( not ( = ?auto_112945 ?auto_112946 ) ) ( not ( = ?auto_112945 ?auto_112947 ) ) ( not ( = ?auto_112945 ?auto_112948 ) ) ( not ( = ?auto_112945 ?auto_112949 ) ) ( not ( = ?auto_112945 ?auto_112950 ) ) ( not ( = ?auto_112946 ?auto_112947 ) ) ( not ( = ?auto_112946 ?auto_112948 ) ) ( not ( = ?auto_112946 ?auto_112949 ) ) ( not ( = ?auto_112946 ?auto_112950 ) ) ( not ( = ?auto_112947 ?auto_112948 ) ) ( not ( = ?auto_112947 ?auto_112949 ) ) ( not ( = ?auto_112947 ?auto_112950 ) ) ( not ( = ?auto_112948 ?auto_112949 ) ) ( not ( = ?auto_112948 ?auto_112950 ) ) ( not ( = ?auto_112949 ?auto_112950 ) ) ( ON ?auto_112949 ?auto_112950 ) ( ON ?auto_112948 ?auto_112949 ) ( ON ?auto_112947 ?auto_112948 ) ( CLEAR ?auto_112945 ) ( ON ?auto_112946 ?auto_112947 ) ( CLEAR ?auto_112946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112940 ?auto_112941 ?auto_112942 ?auto_112943 ?auto_112944 ?auto_112945 ?auto_112946 )
      ( MAKE-11PILE ?auto_112940 ?auto_112941 ?auto_112942 ?auto_112943 ?auto_112944 ?auto_112945 ?auto_112946 ?auto_112947 ?auto_112948 ?auto_112949 ?auto_112950 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112962 - BLOCK
      ?auto_112963 - BLOCK
      ?auto_112964 - BLOCK
      ?auto_112965 - BLOCK
      ?auto_112966 - BLOCK
      ?auto_112967 - BLOCK
      ?auto_112968 - BLOCK
      ?auto_112969 - BLOCK
      ?auto_112970 - BLOCK
      ?auto_112971 - BLOCK
      ?auto_112972 - BLOCK
    )
    :vars
    (
      ?auto_112973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112972 ?auto_112973 ) ( ON-TABLE ?auto_112962 ) ( ON ?auto_112963 ?auto_112962 ) ( ON ?auto_112964 ?auto_112963 ) ( ON ?auto_112965 ?auto_112964 ) ( ON ?auto_112966 ?auto_112965 ) ( not ( = ?auto_112962 ?auto_112963 ) ) ( not ( = ?auto_112962 ?auto_112964 ) ) ( not ( = ?auto_112962 ?auto_112965 ) ) ( not ( = ?auto_112962 ?auto_112966 ) ) ( not ( = ?auto_112962 ?auto_112967 ) ) ( not ( = ?auto_112962 ?auto_112968 ) ) ( not ( = ?auto_112962 ?auto_112969 ) ) ( not ( = ?auto_112962 ?auto_112970 ) ) ( not ( = ?auto_112962 ?auto_112971 ) ) ( not ( = ?auto_112962 ?auto_112972 ) ) ( not ( = ?auto_112962 ?auto_112973 ) ) ( not ( = ?auto_112963 ?auto_112964 ) ) ( not ( = ?auto_112963 ?auto_112965 ) ) ( not ( = ?auto_112963 ?auto_112966 ) ) ( not ( = ?auto_112963 ?auto_112967 ) ) ( not ( = ?auto_112963 ?auto_112968 ) ) ( not ( = ?auto_112963 ?auto_112969 ) ) ( not ( = ?auto_112963 ?auto_112970 ) ) ( not ( = ?auto_112963 ?auto_112971 ) ) ( not ( = ?auto_112963 ?auto_112972 ) ) ( not ( = ?auto_112963 ?auto_112973 ) ) ( not ( = ?auto_112964 ?auto_112965 ) ) ( not ( = ?auto_112964 ?auto_112966 ) ) ( not ( = ?auto_112964 ?auto_112967 ) ) ( not ( = ?auto_112964 ?auto_112968 ) ) ( not ( = ?auto_112964 ?auto_112969 ) ) ( not ( = ?auto_112964 ?auto_112970 ) ) ( not ( = ?auto_112964 ?auto_112971 ) ) ( not ( = ?auto_112964 ?auto_112972 ) ) ( not ( = ?auto_112964 ?auto_112973 ) ) ( not ( = ?auto_112965 ?auto_112966 ) ) ( not ( = ?auto_112965 ?auto_112967 ) ) ( not ( = ?auto_112965 ?auto_112968 ) ) ( not ( = ?auto_112965 ?auto_112969 ) ) ( not ( = ?auto_112965 ?auto_112970 ) ) ( not ( = ?auto_112965 ?auto_112971 ) ) ( not ( = ?auto_112965 ?auto_112972 ) ) ( not ( = ?auto_112965 ?auto_112973 ) ) ( not ( = ?auto_112966 ?auto_112967 ) ) ( not ( = ?auto_112966 ?auto_112968 ) ) ( not ( = ?auto_112966 ?auto_112969 ) ) ( not ( = ?auto_112966 ?auto_112970 ) ) ( not ( = ?auto_112966 ?auto_112971 ) ) ( not ( = ?auto_112966 ?auto_112972 ) ) ( not ( = ?auto_112966 ?auto_112973 ) ) ( not ( = ?auto_112967 ?auto_112968 ) ) ( not ( = ?auto_112967 ?auto_112969 ) ) ( not ( = ?auto_112967 ?auto_112970 ) ) ( not ( = ?auto_112967 ?auto_112971 ) ) ( not ( = ?auto_112967 ?auto_112972 ) ) ( not ( = ?auto_112967 ?auto_112973 ) ) ( not ( = ?auto_112968 ?auto_112969 ) ) ( not ( = ?auto_112968 ?auto_112970 ) ) ( not ( = ?auto_112968 ?auto_112971 ) ) ( not ( = ?auto_112968 ?auto_112972 ) ) ( not ( = ?auto_112968 ?auto_112973 ) ) ( not ( = ?auto_112969 ?auto_112970 ) ) ( not ( = ?auto_112969 ?auto_112971 ) ) ( not ( = ?auto_112969 ?auto_112972 ) ) ( not ( = ?auto_112969 ?auto_112973 ) ) ( not ( = ?auto_112970 ?auto_112971 ) ) ( not ( = ?auto_112970 ?auto_112972 ) ) ( not ( = ?auto_112970 ?auto_112973 ) ) ( not ( = ?auto_112971 ?auto_112972 ) ) ( not ( = ?auto_112971 ?auto_112973 ) ) ( not ( = ?auto_112972 ?auto_112973 ) ) ( ON ?auto_112971 ?auto_112972 ) ( ON ?auto_112970 ?auto_112971 ) ( ON ?auto_112969 ?auto_112970 ) ( ON ?auto_112968 ?auto_112969 ) ( CLEAR ?auto_112966 ) ( ON ?auto_112967 ?auto_112968 ) ( CLEAR ?auto_112967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112962 ?auto_112963 ?auto_112964 ?auto_112965 ?auto_112966 ?auto_112967 )
      ( MAKE-11PILE ?auto_112962 ?auto_112963 ?auto_112964 ?auto_112965 ?auto_112966 ?auto_112967 ?auto_112968 ?auto_112969 ?auto_112970 ?auto_112971 ?auto_112972 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_112985 - BLOCK
      ?auto_112986 - BLOCK
      ?auto_112987 - BLOCK
      ?auto_112988 - BLOCK
      ?auto_112989 - BLOCK
      ?auto_112990 - BLOCK
      ?auto_112991 - BLOCK
      ?auto_112992 - BLOCK
      ?auto_112993 - BLOCK
      ?auto_112994 - BLOCK
      ?auto_112995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112995 ) ( ON-TABLE ?auto_112985 ) ( ON ?auto_112986 ?auto_112985 ) ( ON ?auto_112987 ?auto_112986 ) ( ON ?auto_112988 ?auto_112987 ) ( ON ?auto_112989 ?auto_112988 ) ( not ( = ?auto_112985 ?auto_112986 ) ) ( not ( = ?auto_112985 ?auto_112987 ) ) ( not ( = ?auto_112985 ?auto_112988 ) ) ( not ( = ?auto_112985 ?auto_112989 ) ) ( not ( = ?auto_112985 ?auto_112990 ) ) ( not ( = ?auto_112985 ?auto_112991 ) ) ( not ( = ?auto_112985 ?auto_112992 ) ) ( not ( = ?auto_112985 ?auto_112993 ) ) ( not ( = ?auto_112985 ?auto_112994 ) ) ( not ( = ?auto_112985 ?auto_112995 ) ) ( not ( = ?auto_112986 ?auto_112987 ) ) ( not ( = ?auto_112986 ?auto_112988 ) ) ( not ( = ?auto_112986 ?auto_112989 ) ) ( not ( = ?auto_112986 ?auto_112990 ) ) ( not ( = ?auto_112986 ?auto_112991 ) ) ( not ( = ?auto_112986 ?auto_112992 ) ) ( not ( = ?auto_112986 ?auto_112993 ) ) ( not ( = ?auto_112986 ?auto_112994 ) ) ( not ( = ?auto_112986 ?auto_112995 ) ) ( not ( = ?auto_112987 ?auto_112988 ) ) ( not ( = ?auto_112987 ?auto_112989 ) ) ( not ( = ?auto_112987 ?auto_112990 ) ) ( not ( = ?auto_112987 ?auto_112991 ) ) ( not ( = ?auto_112987 ?auto_112992 ) ) ( not ( = ?auto_112987 ?auto_112993 ) ) ( not ( = ?auto_112987 ?auto_112994 ) ) ( not ( = ?auto_112987 ?auto_112995 ) ) ( not ( = ?auto_112988 ?auto_112989 ) ) ( not ( = ?auto_112988 ?auto_112990 ) ) ( not ( = ?auto_112988 ?auto_112991 ) ) ( not ( = ?auto_112988 ?auto_112992 ) ) ( not ( = ?auto_112988 ?auto_112993 ) ) ( not ( = ?auto_112988 ?auto_112994 ) ) ( not ( = ?auto_112988 ?auto_112995 ) ) ( not ( = ?auto_112989 ?auto_112990 ) ) ( not ( = ?auto_112989 ?auto_112991 ) ) ( not ( = ?auto_112989 ?auto_112992 ) ) ( not ( = ?auto_112989 ?auto_112993 ) ) ( not ( = ?auto_112989 ?auto_112994 ) ) ( not ( = ?auto_112989 ?auto_112995 ) ) ( not ( = ?auto_112990 ?auto_112991 ) ) ( not ( = ?auto_112990 ?auto_112992 ) ) ( not ( = ?auto_112990 ?auto_112993 ) ) ( not ( = ?auto_112990 ?auto_112994 ) ) ( not ( = ?auto_112990 ?auto_112995 ) ) ( not ( = ?auto_112991 ?auto_112992 ) ) ( not ( = ?auto_112991 ?auto_112993 ) ) ( not ( = ?auto_112991 ?auto_112994 ) ) ( not ( = ?auto_112991 ?auto_112995 ) ) ( not ( = ?auto_112992 ?auto_112993 ) ) ( not ( = ?auto_112992 ?auto_112994 ) ) ( not ( = ?auto_112992 ?auto_112995 ) ) ( not ( = ?auto_112993 ?auto_112994 ) ) ( not ( = ?auto_112993 ?auto_112995 ) ) ( not ( = ?auto_112994 ?auto_112995 ) ) ( ON ?auto_112994 ?auto_112995 ) ( ON ?auto_112993 ?auto_112994 ) ( ON ?auto_112992 ?auto_112993 ) ( ON ?auto_112991 ?auto_112992 ) ( CLEAR ?auto_112989 ) ( ON ?auto_112990 ?auto_112991 ) ( CLEAR ?auto_112990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112985 ?auto_112986 ?auto_112987 ?auto_112988 ?auto_112989 ?auto_112990 )
      ( MAKE-11PILE ?auto_112985 ?auto_112986 ?auto_112987 ?auto_112988 ?auto_112989 ?auto_112990 ?auto_112991 ?auto_112992 ?auto_112993 ?auto_112994 ?auto_112995 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113007 - BLOCK
      ?auto_113008 - BLOCK
      ?auto_113009 - BLOCK
      ?auto_113010 - BLOCK
      ?auto_113011 - BLOCK
      ?auto_113012 - BLOCK
      ?auto_113013 - BLOCK
      ?auto_113014 - BLOCK
      ?auto_113015 - BLOCK
      ?auto_113016 - BLOCK
      ?auto_113017 - BLOCK
    )
    :vars
    (
      ?auto_113018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113017 ?auto_113018 ) ( ON-TABLE ?auto_113007 ) ( ON ?auto_113008 ?auto_113007 ) ( ON ?auto_113009 ?auto_113008 ) ( ON ?auto_113010 ?auto_113009 ) ( not ( = ?auto_113007 ?auto_113008 ) ) ( not ( = ?auto_113007 ?auto_113009 ) ) ( not ( = ?auto_113007 ?auto_113010 ) ) ( not ( = ?auto_113007 ?auto_113011 ) ) ( not ( = ?auto_113007 ?auto_113012 ) ) ( not ( = ?auto_113007 ?auto_113013 ) ) ( not ( = ?auto_113007 ?auto_113014 ) ) ( not ( = ?auto_113007 ?auto_113015 ) ) ( not ( = ?auto_113007 ?auto_113016 ) ) ( not ( = ?auto_113007 ?auto_113017 ) ) ( not ( = ?auto_113007 ?auto_113018 ) ) ( not ( = ?auto_113008 ?auto_113009 ) ) ( not ( = ?auto_113008 ?auto_113010 ) ) ( not ( = ?auto_113008 ?auto_113011 ) ) ( not ( = ?auto_113008 ?auto_113012 ) ) ( not ( = ?auto_113008 ?auto_113013 ) ) ( not ( = ?auto_113008 ?auto_113014 ) ) ( not ( = ?auto_113008 ?auto_113015 ) ) ( not ( = ?auto_113008 ?auto_113016 ) ) ( not ( = ?auto_113008 ?auto_113017 ) ) ( not ( = ?auto_113008 ?auto_113018 ) ) ( not ( = ?auto_113009 ?auto_113010 ) ) ( not ( = ?auto_113009 ?auto_113011 ) ) ( not ( = ?auto_113009 ?auto_113012 ) ) ( not ( = ?auto_113009 ?auto_113013 ) ) ( not ( = ?auto_113009 ?auto_113014 ) ) ( not ( = ?auto_113009 ?auto_113015 ) ) ( not ( = ?auto_113009 ?auto_113016 ) ) ( not ( = ?auto_113009 ?auto_113017 ) ) ( not ( = ?auto_113009 ?auto_113018 ) ) ( not ( = ?auto_113010 ?auto_113011 ) ) ( not ( = ?auto_113010 ?auto_113012 ) ) ( not ( = ?auto_113010 ?auto_113013 ) ) ( not ( = ?auto_113010 ?auto_113014 ) ) ( not ( = ?auto_113010 ?auto_113015 ) ) ( not ( = ?auto_113010 ?auto_113016 ) ) ( not ( = ?auto_113010 ?auto_113017 ) ) ( not ( = ?auto_113010 ?auto_113018 ) ) ( not ( = ?auto_113011 ?auto_113012 ) ) ( not ( = ?auto_113011 ?auto_113013 ) ) ( not ( = ?auto_113011 ?auto_113014 ) ) ( not ( = ?auto_113011 ?auto_113015 ) ) ( not ( = ?auto_113011 ?auto_113016 ) ) ( not ( = ?auto_113011 ?auto_113017 ) ) ( not ( = ?auto_113011 ?auto_113018 ) ) ( not ( = ?auto_113012 ?auto_113013 ) ) ( not ( = ?auto_113012 ?auto_113014 ) ) ( not ( = ?auto_113012 ?auto_113015 ) ) ( not ( = ?auto_113012 ?auto_113016 ) ) ( not ( = ?auto_113012 ?auto_113017 ) ) ( not ( = ?auto_113012 ?auto_113018 ) ) ( not ( = ?auto_113013 ?auto_113014 ) ) ( not ( = ?auto_113013 ?auto_113015 ) ) ( not ( = ?auto_113013 ?auto_113016 ) ) ( not ( = ?auto_113013 ?auto_113017 ) ) ( not ( = ?auto_113013 ?auto_113018 ) ) ( not ( = ?auto_113014 ?auto_113015 ) ) ( not ( = ?auto_113014 ?auto_113016 ) ) ( not ( = ?auto_113014 ?auto_113017 ) ) ( not ( = ?auto_113014 ?auto_113018 ) ) ( not ( = ?auto_113015 ?auto_113016 ) ) ( not ( = ?auto_113015 ?auto_113017 ) ) ( not ( = ?auto_113015 ?auto_113018 ) ) ( not ( = ?auto_113016 ?auto_113017 ) ) ( not ( = ?auto_113016 ?auto_113018 ) ) ( not ( = ?auto_113017 ?auto_113018 ) ) ( ON ?auto_113016 ?auto_113017 ) ( ON ?auto_113015 ?auto_113016 ) ( ON ?auto_113014 ?auto_113015 ) ( ON ?auto_113013 ?auto_113014 ) ( ON ?auto_113012 ?auto_113013 ) ( CLEAR ?auto_113010 ) ( ON ?auto_113011 ?auto_113012 ) ( CLEAR ?auto_113011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113007 ?auto_113008 ?auto_113009 ?auto_113010 ?auto_113011 )
      ( MAKE-11PILE ?auto_113007 ?auto_113008 ?auto_113009 ?auto_113010 ?auto_113011 ?auto_113012 ?auto_113013 ?auto_113014 ?auto_113015 ?auto_113016 ?auto_113017 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113030 - BLOCK
      ?auto_113031 - BLOCK
      ?auto_113032 - BLOCK
      ?auto_113033 - BLOCK
      ?auto_113034 - BLOCK
      ?auto_113035 - BLOCK
      ?auto_113036 - BLOCK
      ?auto_113037 - BLOCK
      ?auto_113038 - BLOCK
      ?auto_113039 - BLOCK
      ?auto_113040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113040 ) ( ON-TABLE ?auto_113030 ) ( ON ?auto_113031 ?auto_113030 ) ( ON ?auto_113032 ?auto_113031 ) ( ON ?auto_113033 ?auto_113032 ) ( not ( = ?auto_113030 ?auto_113031 ) ) ( not ( = ?auto_113030 ?auto_113032 ) ) ( not ( = ?auto_113030 ?auto_113033 ) ) ( not ( = ?auto_113030 ?auto_113034 ) ) ( not ( = ?auto_113030 ?auto_113035 ) ) ( not ( = ?auto_113030 ?auto_113036 ) ) ( not ( = ?auto_113030 ?auto_113037 ) ) ( not ( = ?auto_113030 ?auto_113038 ) ) ( not ( = ?auto_113030 ?auto_113039 ) ) ( not ( = ?auto_113030 ?auto_113040 ) ) ( not ( = ?auto_113031 ?auto_113032 ) ) ( not ( = ?auto_113031 ?auto_113033 ) ) ( not ( = ?auto_113031 ?auto_113034 ) ) ( not ( = ?auto_113031 ?auto_113035 ) ) ( not ( = ?auto_113031 ?auto_113036 ) ) ( not ( = ?auto_113031 ?auto_113037 ) ) ( not ( = ?auto_113031 ?auto_113038 ) ) ( not ( = ?auto_113031 ?auto_113039 ) ) ( not ( = ?auto_113031 ?auto_113040 ) ) ( not ( = ?auto_113032 ?auto_113033 ) ) ( not ( = ?auto_113032 ?auto_113034 ) ) ( not ( = ?auto_113032 ?auto_113035 ) ) ( not ( = ?auto_113032 ?auto_113036 ) ) ( not ( = ?auto_113032 ?auto_113037 ) ) ( not ( = ?auto_113032 ?auto_113038 ) ) ( not ( = ?auto_113032 ?auto_113039 ) ) ( not ( = ?auto_113032 ?auto_113040 ) ) ( not ( = ?auto_113033 ?auto_113034 ) ) ( not ( = ?auto_113033 ?auto_113035 ) ) ( not ( = ?auto_113033 ?auto_113036 ) ) ( not ( = ?auto_113033 ?auto_113037 ) ) ( not ( = ?auto_113033 ?auto_113038 ) ) ( not ( = ?auto_113033 ?auto_113039 ) ) ( not ( = ?auto_113033 ?auto_113040 ) ) ( not ( = ?auto_113034 ?auto_113035 ) ) ( not ( = ?auto_113034 ?auto_113036 ) ) ( not ( = ?auto_113034 ?auto_113037 ) ) ( not ( = ?auto_113034 ?auto_113038 ) ) ( not ( = ?auto_113034 ?auto_113039 ) ) ( not ( = ?auto_113034 ?auto_113040 ) ) ( not ( = ?auto_113035 ?auto_113036 ) ) ( not ( = ?auto_113035 ?auto_113037 ) ) ( not ( = ?auto_113035 ?auto_113038 ) ) ( not ( = ?auto_113035 ?auto_113039 ) ) ( not ( = ?auto_113035 ?auto_113040 ) ) ( not ( = ?auto_113036 ?auto_113037 ) ) ( not ( = ?auto_113036 ?auto_113038 ) ) ( not ( = ?auto_113036 ?auto_113039 ) ) ( not ( = ?auto_113036 ?auto_113040 ) ) ( not ( = ?auto_113037 ?auto_113038 ) ) ( not ( = ?auto_113037 ?auto_113039 ) ) ( not ( = ?auto_113037 ?auto_113040 ) ) ( not ( = ?auto_113038 ?auto_113039 ) ) ( not ( = ?auto_113038 ?auto_113040 ) ) ( not ( = ?auto_113039 ?auto_113040 ) ) ( ON ?auto_113039 ?auto_113040 ) ( ON ?auto_113038 ?auto_113039 ) ( ON ?auto_113037 ?auto_113038 ) ( ON ?auto_113036 ?auto_113037 ) ( ON ?auto_113035 ?auto_113036 ) ( CLEAR ?auto_113033 ) ( ON ?auto_113034 ?auto_113035 ) ( CLEAR ?auto_113034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113030 ?auto_113031 ?auto_113032 ?auto_113033 ?auto_113034 )
      ( MAKE-11PILE ?auto_113030 ?auto_113031 ?auto_113032 ?auto_113033 ?auto_113034 ?auto_113035 ?auto_113036 ?auto_113037 ?auto_113038 ?auto_113039 ?auto_113040 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113052 - BLOCK
      ?auto_113053 - BLOCK
      ?auto_113054 - BLOCK
      ?auto_113055 - BLOCK
      ?auto_113056 - BLOCK
      ?auto_113057 - BLOCK
      ?auto_113058 - BLOCK
      ?auto_113059 - BLOCK
      ?auto_113060 - BLOCK
      ?auto_113061 - BLOCK
      ?auto_113062 - BLOCK
    )
    :vars
    (
      ?auto_113063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113062 ?auto_113063 ) ( ON-TABLE ?auto_113052 ) ( ON ?auto_113053 ?auto_113052 ) ( ON ?auto_113054 ?auto_113053 ) ( not ( = ?auto_113052 ?auto_113053 ) ) ( not ( = ?auto_113052 ?auto_113054 ) ) ( not ( = ?auto_113052 ?auto_113055 ) ) ( not ( = ?auto_113052 ?auto_113056 ) ) ( not ( = ?auto_113052 ?auto_113057 ) ) ( not ( = ?auto_113052 ?auto_113058 ) ) ( not ( = ?auto_113052 ?auto_113059 ) ) ( not ( = ?auto_113052 ?auto_113060 ) ) ( not ( = ?auto_113052 ?auto_113061 ) ) ( not ( = ?auto_113052 ?auto_113062 ) ) ( not ( = ?auto_113052 ?auto_113063 ) ) ( not ( = ?auto_113053 ?auto_113054 ) ) ( not ( = ?auto_113053 ?auto_113055 ) ) ( not ( = ?auto_113053 ?auto_113056 ) ) ( not ( = ?auto_113053 ?auto_113057 ) ) ( not ( = ?auto_113053 ?auto_113058 ) ) ( not ( = ?auto_113053 ?auto_113059 ) ) ( not ( = ?auto_113053 ?auto_113060 ) ) ( not ( = ?auto_113053 ?auto_113061 ) ) ( not ( = ?auto_113053 ?auto_113062 ) ) ( not ( = ?auto_113053 ?auto_113063 ) ) ( not ( = ?auto_113054 ?auto_113055 ) ) ( not ( = ?auto_113054 ?auto_113056 ) ) ( not ( = ?auto_113054 ?auto_113057 ) ) ( not ( = ?auto_113054 ?auto_113058 ) ) ( not ( = ?auto_113054 ?auto_113059 ) ) ( not ( = ?auto_113054 ?auto_113060 ) ) ( not ( = ?auto_113054 ?auto_113061 ) ) ( not ( = ?auto_113054 ?auto_113062 ) ) ( not ( = ?auto_113054 ?auto_113063 ) ) ( not ( = ?auto_113055 ?auto_113056 ) ) ( not ( = ?auto_113055 ?auto_113057 ) ) ( not ( = ?auto_113055 ?auto_113058 ) ) ( not ( = ?auto_113055 ?auto_113059 ) ) ( not ( = ?auto_113055 ?auto_113060 ) ) ( not ( = ?auto_113055 ?auto_113061 ) ) ( not ( = ?auto_113055 ?auto_113062 ) ) ( not ( = ?auto_113055 ?auto_113063 ) ) ( not ( = ?auto_113056 ?auto_113057 ) ) ( not ( = ?auto_113056 ?auto_113058 ) ) ( not ( = ?auto_113056 ?auto_113059 ) ) ( not ( = ?auto_113056 ?auto_113060 ) ) ( not ( = ?auto_113056 ?auto_113061 ) ) ( not ( = ?auto_113056 ?auto_113062 ) ) ( not ( = ?auto_113056 ?auto_113063 ) ) ( not ( = ?auto_113057 ?auto_113058 ) ) ( not ( = ?auto_113057 ?auto_113059 ) ) ( not ( = ?auto_113057 ?auto_113060 ) ) ( not ( = ?auto_113057 ?auto_113061 ) ) ( not ( = ?auto_113057 ?auto_113062 ) ) ( not ( = ?auto_113057 ?auto_113063 ) ) ( not ( = ?auto_113058 ?auto_113059 ) ) ( not ( = ?auto_113058 ?auto_113060 ) ) ( not ( = ?auto_113058 ?auto_113061 ) ) ( not ( = ?auto_113058 ?auto_113062 ) ) ( not ( = ?auto_113058 ?auto_113063 ) ) ( not ( = ?auto_113059 ?auto_113060 ) ) ( not ( = ?auto_113059 ?auto_113061 ) ) ( not ( = ?auto_113059 ?auto_113062 ) ) ( not ( = ?auto_113059 ?auto_113063 ) ) ( not ( = ?auto_113060 ?auto_113061 ) ) ( not ( = ?auto_113060 ?auto_113062 ) ) ( not ( = ?auto_113060 ?auto_113063 ) ) ( not ( = ?auto_113061 ?auto_113062 ) ) ( not ( = ?auto_113061 ?auto_113063 ) ) ( not ( = ?auto_113062 ?auto_113063 ) ) ( ON ?auto_113061 ?auto_113062 ) ( ON ?auto_113060 ?auto_113061 ) ( ON ?auto_113059 ?auto_113060 ) ( ON ?auto_113058 ?auto_113059 ) ( ON ?auto_113057 ?auto_113058 ) ( ON ?auto_113056 ?auto_113057 ) ( CLEAR ?auto_113054 ) ( ON ?auto_113055 ?auto_113056 ) ( CLEAR ?auto_113055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113052 ?auto_113053 ?auto_113054 ?auto_113055 )
      ( MAKE-11PILE ?auto_113052 ?auto_113053 ?auto_113054 ?auto_113055 ?auto_113056 ?auto_113057 ?auto_113058 ?auto_113059 ?auto_113060 ?auto_113061 ?auto_113062 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113075 - BLOCK
      ?auto_113076 - BLOCK
      ?auto_113077 - BLOCK
      ?auto_113078 - BLOCK
      ?auto_113079 - BLOCK
      ?auto_113080 - BLOCK
      ?auto_113081 - BLOCK
      ?auto_113082 - BLOCK
      ?auto_113083 - BLOCK
      ?auto_113084 - BLOCK
      ?auto_113085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113085 ) ( ON-TABLE ?auto_113075 ) ( ON ?auto_113076 ?auto_113075 ) ( ON ?auto_113077 ?auto_113076 ) ( not ( = ?auto_113075 ?auto_113076 ) ) ( not ( = ?auto_113075 ?auto_113077 ) ) ( not ( = ?auto_113075 ?auto_113078 ) ) ( not ( = ?auto_113075 ?auto_113079 ) ) ( not ( = ?auto_113075 ?auto_113080 ) ) ( not ( = ?auto_113075 ?auto_113081 ) ) ( not ( = ?auto_113075 ?auto_113082 ) ) ( not ( = ?auto_113075 ?auto_113083 ) ) ( not ( = ?auto_113075 ?auto_113084 ) ) ( not ( = ?auto_113075 ?auto_113085 ) ) ( not ( = ?auto_113076 ?auto_113077 ) ) ( not ( = ?auto_113076 ?auto_113078 ) ) ( not ( = ?auto_113076 ?auto_113079 ) ) ( not ( = ?auto_113076 ?auto_113080 ) ) ( not ( = ?auto_113076 ?auto_113081 ) ) ( not ( = ?auto_113076 ?auto_113082 ) ) ( not ( = ?auto_113076 ?auto_113083 ) ) ( not ( = ?auto_113076 ?auto_113084 ) ) ( not ( = ?auto_113076 ?auto_113085 ) ) ( not ( = ?auto_113077 ?auto_113078 ) ) ( not ( = ?auto_113077 ?auto_113079 ) ) ( not ( = ?auto_113077 ?auto_113080 ) ) ( not ( = ?auto_113077 ?auto_113081 ) ) ( not ( = ?auto_113077 ?auto_113082 ) ) ( not ( = ?auto_113077 ?auto_113083 ) ) ( not ( = ?auto_113077 ?auto_113084 ) ) ( not ( = ?auto_113077 ?auto_113085 ) ) ( not ( = ?auto_113078 ?auto_113079 ) ) ( not ( = ?auto_113078 ?auto_113080 ) ) ( not ( = ?auto_113078 ?auto_113081 ) ) ( not ( = ?auto_113078 ?auto_113082 ) ) ( not ( = ?auto_113078 ?auto_113083 ) ) ( not ( = ?auto_113078 ?auto_113084 ) ) ( not ( = ?auto_113078 ?auto_113085 ) ) ( not ( = ?auto_113079 ?auto_113080 ) ) ( not ( = ?auto_113079 ?auto_113081 ) ) ( not ( = ?auto_113079 ?auto_113082 ) ) ( not ( = ?auto_113079 ?auto_113083 ) ) ( not ( = ?auto_113079 ?auto_113084 ) ) ( not ( = ?auto_113079 ?auto_113085 ) ) ( not ( = ?auto_113080 ?auto_113081 ) ) ( not ( = ?auto_113080 ?auto_113082 ) ) ( not ( = ?auto_113080 ?auto_113083 ) ) ( not ( = ?auto_113080 ?auto_113084 ) ) ( not ( = ?auto_113080 ?auto_113085 ) ) ( not ( = ?auto_113081 ?auto_113082 ) ) ( not ( = ?auto_113081 ?auto_113083 ) ) ( not ( = ?auto_113081 ?auto_113084 ) ) ( not ( = ?auto_113081 ?auto_113085 ) ) ( not ( = ?auto_113082 ?auto_113083 ) ) ( not ( = ?auto_113082 ?auto_113084 ) ) ( not ( = ?auto_113082 ?auto_113085 ) ) ( not ( = ?auto_113083 ?auto_113084 ) ) ( not ( = ?auto_113083 ?auto_113085 ) ) ( not ( = ?auto_113084 ?auto_113085 ) ) ( ON ?auto_113084 ?auto_113085 ) ( ON ?auto_113083 ?auto_113084 ) ( ON ?auto_113082 ?auto_113083 ) ( ON ?auto_113081 ?auto_113082 ) ( ON ?auto_113080 ?auto_113081 ) ( ON ?auto_113079 ?auto_113080 ) ( CLEAR ?auto_113077 ) ( ON ?auto_113078 ?auto_113079 ) ( CLEAR ?auto_113078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113075 ?auto_113076 ?auto_113077 ?auto_113078 )
      ( MAKE-11PILE ?auto_113075 ?auto_113076 ?auto_113077 ?auto_113078 ?auto_113079 ?auto_113080 ?auto_113081 ?auto_113082 ?auto_113083 ?auto_113084 ?auto_113085 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113097 - BLOCK
      ?auto_113098 - BLOCK
      ?auto_113099 - BLOCK
      ?auto_113100 - BLOCK
      ?auto_113101 - BLOCK
      ?auto_113102 - BLOCK
      ?auto_113103 - BLOCK
      ?auto_113104 - BLOCK
      ?auto_113105 - BLOCK
      ?auto_113106 - BLOCK
      ?auto_113107 - BLOCK
    )
    :vars
    (
      ?auto_113108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113107 ?auto_113108 ) ( ON-TABLE ?auto_113097 ) ( ON ?auto_113098 ?auto_113097 ) ( not ( = ?auto_113097 ?auto_113098 ) ) ( not ( = ?auto_113097 ?auto_113099 ) ) ( not ( = ?auto_113097 ?auto_113100 ) ) ( not ( = ?auto_113097 ?auto_113101 ) ) ( not ( = ?auto_113097 ?auto_113102 ) ) ( not ( = ?auto_113097 ?auto_113103 ) ) ( not ( = ?auto_113097 ?auto_113104 ) ) ( not ( = ?auto_113097 ?auto_113105 ) ) ( not ( = ?auto_113097 ?auto_113106 ) ) ( not ( = ?auto_113097 ?auto_113107 ) ) ( not ( = ?auto_113097 ?auto_113108 ) ) ( not ( = ?auto_113098 ?auto_113099 ) ) ( not ( = ?auto_113098 ?auto_113100 ) ) ( not ( = ?auto_113098 ?auto_113101 ) ) ( not ( = ?auto_113098 ?auto_113102 ) ) ( not ( = ?auto_113098 ?auto_113103 ) ) ( not ( = ?auto_113098 ?auto_113104 ) ) ( not ( = ?auto_113098 ?auto_113105 ) ) ( not ( = ?auto_113098 ?auto_113106 ) ) ( not ( = ?auto_113098 ?auto_113107 ) ) ( not ( = ?auto_113098 ?auto_113108 ) ) ( not ( = ?auto_113099 ?auto_113100 ) ) ( not ( = ?auto_113099 ?auto_113101 ) ) ( not ( = ?auto_113099 ?auto_113102 ) ) ( not ( = ?auto_113099 ?auto_113103 ) ) ( not ( = ?auto_113099 ?auto_113104 ) ) ( not ( = ?auto_113099 ?auto_113105 ) ) ( not ( = ?auto_113099 ?auto_113106 ) ) ( not ( = ?auto_113099 ?auto_113107 ) ) ( not ( = ?auto_113099 ?auto_113108 ) ) ( not ( = ?auto_113100 ?auto_113101 ) ) ( not ( = ?auto_113100 ?auto_113102 ) ) ( not ( = ?auto_113100 ?auto_113103 ) ) ( not ( = ?auto_113100 ?auto_113104 ) ) ( not ( = ?auto_113100 ?auto_113105 ) ) ( not ( = ?auto_113100 ?auto_113106 ) ) ( not ( = ?auto_113100 ?auto_113107 ) ) ( not ( = ?auto_113100 ?auto_113108 ) ) ( not ( = ?auto_113101 ?auto_113102 ) ) ( not ( = ?auto_113101 ?auto_113103 ) ) ( not ( = ?auto_113101 ?auto_113104 ) ) ( not ( = ?auto_113101 ?auto_113105 ) ) ( not ( = ?auto_113101 ?auto_113106 ) ) ( not ( = ?auto_113101 ?auto_113107 ) ) ( not ( = ?auto_113101 ?auto_113108 ) ) ( not ( = ?auto_113102 ?auto_113103 ) ) ( not ( = ?auto_113102 ?auto_113104 ) ) ( not ( = ?auto_113102 ?auto_113105 ) ) ( not ( = ?auto_113102 ?auto_113106 ) ) ( not ( = ?auto_113102 ?auto_113107 ) ) ( not ( = ?auto_113102 ?auto_113108 ) ) ( not ( = ?auto_113103 ?auto_113104 ) ) ( not ( = ?auto_113103 ?auto_113105 ) ) ( not ( = ?auto_113103 ?auto_113106 ) ) ( not ( = ?auto_113103 ?auto_113107 ) ) ( not ( = ?auto_113103 ?auto_113108 ) ) ( not ( = ?auto_113104 ?auto_113105 ) ) ( not ( = ?auto_113104 ?auto_113106 ) ) ( not ( = ?auto_113104 ?auto_113107 ) ) ( not ( = ?auto_113104 ?auto_113108 ) ) ( not ( = ?auto_113105 ?auto_113106 ) ) ( not ( = ?auto_113105 ?auto_113107 ) ) ( not ( = ?auto_113105 ?auto_113108 ) ) ( not ( = ?auto_113106 ?auto_113107 ) ) ( not ( = ?auto_113106 ?auto_113108 ) ) ( not ( = ?auto_113107 ?auto_113108 ) ) ( ON ?auto_113106 ?auto_113107 ) ( ON ?auto_113105 ?auto_113106 ) ( ON ?auto_113104 ?auto_113105 ) ( ON ?auto_113103 ?auto_113104 ) ( ON ?auto_113102 ?auto_113103 ) ( ON ?auto_113101 ?auto_113102 ) ( ON ?auto_113100 ?auto_113101 ) ( CLEAR ?auto_113098 ) ( ON ?auto_113099 ?auto_113100 ) ( CLEAR ?auto_113099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113097 ?auto_113098 ?auto_113099 )
      ( MAKE-11PILE ?auto_113097 ?auto_113098 ?auto_113099 ?auto_113100 ?auto_113101 ?auto_113102 ?auto_113103 ?auto_113104 ?auto_113105 ?auto_113106 ?auto_113107 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113120 - BLOCK
      ?auto_113121 - BLOCK
      ?auto_113122 - BLOCK
      ?auto_113123 - BLOCK
      ?auto_113124 - BLOCK
      ?auto_113125 - BLOCK
      ?auto_113126 - BLOCK
      ?auto_113127 - BLOCK
      ?auto_113128 - BLOCK
      ?auto_113129 - BLOCK
      ?auto_113130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113130 ) ( ON-TABLE ?auto_113120 ) ( ON ?auto_113121 ?auto_113120 ) ( not ( = ?auto_113120 ?auto_113121 ) ) ( not ( = ?auto_113120 ?auto_113122 ) ) ( not ( = ?auto_113120 ?auto_113123 ) ) ( not ( = ?auto_113120 ?auto_113124 ) ) ( not ( = ?auto_113120 ?auto_113125 ) ) ( not ( = ?auto_113120 ?auto_113126 ) ) ( not ( = ?auto_113120 ?auto_113127 ) ) ( not ( = ?auto_113120 ?auto_113128 ) ) ( not ( = ?auto_113120 ?auto_113129 ) ) ( not ( = ?auto_113120 ?auto_113130 ) ) ( not ( = ?auto_113121 ?auto_113122 ) ) ( not ( = ?auto_113121 ?auto_113123 ) ) ( not ( = ?auto_113121 ?auto_113124 ) ) ( not ( = ?auto_113121 ?auto_113125 ) ) ( not ( = ?auto_113121 ?auto_113126 ) ) ( not ( = ?auto_113121 ?auto_113127 ) ) ( not ( = ?auto_113121 ?auto_113128 ) ) ( not ( = ?auto_113121 ?auto_113129 ) ) ( not ( = ?auto_113121 ?auto_113130 ) ) ( not ( = ?auto_113122 ?auto_113123 ) ) ( not ( = ?auto_113122 ?auto_113124 ) ) ( not ( = ?auto_113122 ?auto_113125 ) ) ( not ( = ?auto_113122 ?auto_113126 ) ) ( not ( = ?auto_113122 ?auto_113127 ) ) ( not ( = ?auto_113122 ?auto_113128 ) ) ( not ( = ?auto_113122 ?auto_113129 ) ) ( not ( = ?auto_113122 ?auto_113130 ) ) ( not ( = ?auto_113123 ?auto_113124 ) ) ( not ( = ?auto_113123 ?auto_113125 ) ) ( not ( = ?auto_113123 ?auto_113126 ) ) ( not ( = ?auto_113123 ?auto_113127 ) ) ( not ( = ?auto_113123 ?auto_113128 ) ) ( not ( = ?auto_113123 ?auto_113129 ) ) ( not ( = ?auto_113123 ?auto_113130 ) ) ( not ( = ?auto_113124 ?auto_113125 ) ) ( not ( = ?auto_113124 ?auto_113126 ) ) ( not ( = ?auto_113124 ?auto_113127 ) ) ( not ( = ?auto_113124 ?auto_113128 ) ) ( not ( = ?auto_113124 ?auto_113129 ) ) ( not ( = ?auto_113124 ?auto_113130 ) ) ( not ( = ?auto_113125 ?auto_113126 ) ) ( not ( = ?auto_113125 ?auto_113127 ) ) ( not ( = ?auto_113125 ?auto_113128 ) ) ( not ( = ?auto_113125 ?auto_113129 ) ) ( not ( = ?auto_113125 ?auto_113130 ) ) ( not ( = ?auto_113126 ?auto_113127 ) ) ( not ( = ?auto_113126 ?auto_113128 ) ) ( not ( = ?auto_113126 ?auto_113129 ) ) ( not ( = ?auto_113126 ?auto_113130 ) ) ( not ( = ?auto_113127 ?auto_113128 ) ) ( not ( = ?auto_113127 ?auto_113129 ) ) ( not ( = ?auto_113127 ?auto_113130 ) ) ( not ( = ?auto_113128 ?auto_113129 ) ) ( not ( = ?auto_113128 ?auto_113130 ) ) ( not ( = ?auto_113129 ?auto_113130 ) ) ( ON ?auto_113129 ?auto_113130 ) ( ON ?auto_113128 ?auto_113129 ) ( ON ?auto_113127 ?auto_113128 ) ( ON ?auto_113126 ?auto_113127 ) ( ON ?auto_113125 ?auto_113126 ) ( ON ?auto_113124 ?auto_113125 ) ( ON ?auto_113123 ?auto_113124 ) ( CLEAR ?auto_113121 ) ( ON ?auto_113122 ?auto_113123 ) ( CLEAR ?auto_113122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113120 ?auto_113121 ?auto_113122 )
      ( MAKE-11PILE ?auto_113120 ?auto_113121 ?auto_113122 ?auto_113123 ?auto_113124 ?auto_113125 ?auto_113126 ?auto_113127 ?auto_113128 ?auto_113129 ?auto_113130 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113142 - BLOCK
      ?auto_113143 - BLOCK
      ?auto_113144 - BLOCK
      ?auto_113145 - BLOCK
      ?auto_113146 - BLOCK
      ?auto_113147 - BLOCK
      ?auto_113148 - BLOCK
      ?auto_113149 - BLOCK
      ?auto_113150 - BLOCK
      ?auto_113151 - BLOCK
      ?auto_113152 - BLOCK
    )
    :vars
    (
      ?auto_113153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113152 ?auto_113153 ) ( ON-TABLE ?auto_113142 ) ( not ( = ?auto_113142 ?auto_113143 ) ) ( not ( = ?auto_113142 ?auto_113144 ) ) ( not ( = ?auto_113142 ?auto_113145 ) ) ( not ( = ?auto_113142 ?auto_113146 ) ) ( not ( = ?auto_113142 ?auto_113147 ) ) ( not ( = ?auto_113142 ?auto_113148 ) ) ( not ( = ?auto_113142 ?auto_113149 ) ) ( not ( = ?auto_113142 ?auto_113150 ) ) ( not ( = ?auto_113142 ?auto_113151 ) ) ( not ( = ?auto_113142 ?auto_113152 ) ) ( not ( = ?auto_113142 ?auto_113153 ) ) ( not ( = ?auto_113143 ?auto_113144 ) ) ( not ( = ?auto_113143 ?auto_113145 ) ) ( not ( = ?auto_113143 ?auto_113146 ) ) ( not ( = ?auto_113143 ?auto_113147 ) ) ( not ( = ?auto_113143 ?auto_113148 ) ) ( not ( = ?auto_113143 ?auto_113149 ) ) ( not ( = ?auto_113143 ?auto_113150 ) ) ( not ( = ?auto_113143 ?auto_113151 ) ) ( not ( = ?auto_113143 ?auto_113152 ) ) ( not ( = ?auto_113143 ?auto_113153 ) ) ( not ( = ?auto_113144 ?auto_113145 ) ) ( not ( = ?auto_113144 ?auto_113146 ) ) ( not ( = ?auto_113144 ?auto_113147 ) ) ( not ( = ?auto_113144 ?auto_113148 ) ) ( not ( = ?auto_113144 ?auto_113149 ) ) ( not ( = ?auto_113144 ?auto_113150 ) ) ( not ( = ?auto_113144 ?auto_113151 ) ) ( not ( = ?auto_113144 ?auto_113152 ) ) ( not ( = ?auto_113144 ?auto_113153 ) ) ( not ( = ?auto_113145 ?auto_113146 ) ) ( not ( = ?auto_113145 ?auto_113147 ) ) ( not ( = ?auto_113145 ?auto_113148 ) ) ( not ( = ?auto_113145 ?auto_113149 ) ) ( not ( = ?auto_113145 ?auto_113150 ) ) ( not ( = ?auto_113145 ?auto_113151 ) ) ( not ( = ?auto_113145 ?auto_113152 ) ) ( not ( = ?auto_113145 ?auto_113153 ) ) ( not ( = ?auto_113146 ?auto_113147 ) ) ( not ( = ?auto_113146 ?auto_113148 ) ) ( not ( = ?auto_113146 ?auto_113149 ) ) ( not ( = ?auto_113146 ?auto_113150 ) ) ( not ( = ?auto_113146 ?auto_113151 ) ) ( not ( = ?auto_113146 ?auto_113152 ) ) ( not ( = ?auto_113146 ?auto_113153 ) ) ( not ( = ?auto_113147 ?auto_113148 ) ) ( not ( = ?auto_113147 ?auto_113149 ) ) ( not ( = ?auto_113147 ?auto_113150 ) ) ( not ( = ?auto_113147 ?auto_113151 ) ) ( not ( = ?auto_113147 ?auto_113152 ) ) ( not ( = ?auto_113147 ?auto_113153 ) ) ( not ( = ?auto_113148 ?auto_113149 ) ) ( not ( = ?auto_113148 ?auto_113150 ) ) ( not ( = ?auto_113148 ?auto_113151 ) ) ( not ( = ?auto_113148 ?auto_113152 ) ) ( not ( = ?auto_113148 ?auto_113153 ) ) ( not ( = ?auto_113149 ?auto_113150 ) ) ( not ( = ?auto_113149 ?auto_113151 ) ) ( not ( = ?auto_113149 ?auto_113152 ) ) ( not ( = ?auto_113149 ?auto_113153 ) ) ( not ( = ?auto_113150 ?auto_113151 ) ) ( not ( = ?auto_113150 ?auto_113152 ) ) ( not ( = ?auto_113150 ?auto_113153 ) ) ( not ( = ?auto_113151 ?auto_113152 ) ) ( not ( = ?auto_113151 ?auto_113153 ) ) ( not ( = ?auto_113152 ?auto_113153 ) ) ( ON ?auto_113151 ?auto_113152 ) ( ON ?auto_113150 ?auto_113151 ) ( ON ?auto_113149 ?auto_113150 ) ( ON ?auto_113148 ?auto_113149 ) ( ON ?auto_113147 ?auto_113148 ) ( ON ?auto_113146 ?auto_113147 ) ( ON ?auto_113145 ?auto_113146 ) ( ON ?auto_113144 ?auto_113145 ) ( CLEAR ?auto_113142 ) ( ON ?auto_113143 ?auto_113144 ) ( CLEAR ?auto_113143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113142 ?auto_113143 )
      ( MAKE-11PILE ?auto_113142 ?auto_113143 ?auto_113144 ?auto_113145 ?auto_113146 ?auto_113147 ?auto_113148 ?auto_113149 ?auto_113150 ?auto_113151 ?auto_113152 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113165 - BLOCK
      ?auto_113166 - BLOCK
      ?auto_113167 - BLOCK
      ?auto_113168 - BLOCK
      ?auto_113169 - BLOCK
      ?auto_113170 - BLOCK
      ?auto_113171 - BLOCK
      ?auto_113172 - BLOCK
      ?auto_113173 - BLOCK
      ?auto_113174 - BLOCK
      ?auto_113175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113175 ) ( ON-TABLE ?auto_113165 ) ( not ( = ?auto_113165 ?auto_113166 ) ) ( not ( = ?auto_113165 ?auto_113167 ) ) ( not ( = ?auto_113165 ?auto_113168 ) ) ( not ( = ?auto_113165 ?auto_113169 ) ) ( not ( = ?auto_113165 ?auto_113170 ) ) ( not ( = ?auto_113165 ?auto_113171 ) ) ( not ( = ?auto_113165 ?auto_113172 ) ) ( not ( = ?auto_113165 ?auto_113173 ) ) ( not ( = ?auto_113165 ?auto_113174 ) ) ( not ( = ?auto_113165 ?auto_113175 ) ) ( not ( = ?auto_113166 ?auto_113167 ) ) ( not ( = ?auto_113166 ?auto_113168 ) ) ( not ( = ?auto_113166 ?auto_113169 ) ) ( not ( = ?auto_113166 ?auto_113170 ) ) ( not ( = ?auto_113166 ?auto_113171 ) ) ( not ( = ?auto_113166 ?auto_113172 ) ) ( not ( = ?auto_113166 ?auto_113173 ) ) ( not ( = ?auto_113166 ?auto_113174 ) ) ( not ( = ?auto_113166 ?auto_113175 ) ) ( not ( = ?auto_113167 ?auto_113168 ) ) ( not ( = ?auto_113167 ?auto_113169 ) ) ( not ( = ?auto_113167 ?auto_113170 ) ) ( not ( = ?auto_113167 ?auto_113171 ) ) ( not ( = ?auto_113167 ?auto_113172 ) ) ( not ( = ?auto_113167 ?auto_113173 ) ) ( not ( = ?auto_113167 ?auto_113174 ) ) ( not ( = ?auto_113167 ?auto_113175 ) ) ( not ( = ?auto_113168 ?auto_113169 ) ) ( not ( = ?auto_113168 ?auto_113170 ) ) ( not ( = ?auto_113168 ?auto_113171 ) ) ( not ( = ?auto_113168 ?auto_113172 ) ) ( not ( = ?auto_113168 ?auto_113173 ) ) ( not ( = ?auto_113168 ?auto_113174 ) ) ( not ( = ?auto_113168 ?auto_113175 ) ) ( not ( = ?auto_113169 ?auto_113170 ) ) ( not ( = ?auto_113169 ?auto_113171 ) ) ( not ( = ?auto_113169 ?auto_113172 ) ) ( not ( = ?auto_113169 ?auto_113173 ) ) ( not ( = ?auto_113169 ?auto_113174 ) ) ( not ( = ?auto_113169 ?auto_113175 ) ) ( not ( = ?auto_113170 ?auto_113171 ) ) ( not ( = ?auto_113170 ?auto_113172 ) ) ( not ( = ?auto_113170 ?auto_113173 ) ) ( not ( = ?auto_113170 ?auto_113174 ) ) ( not ( = ?auto_113170 ?auto_113175 ) ) ( not ( = ?auto_113171 ?auto_113172 ) ) ( not ( = ?auto_113171 ?auto_113173 ) ) ( not ( = ?auto_113171 ?auto_113174 ) ) ( not ( = ?auto_113171 ?auto_113175 ) ) ( not ( = ?auto_113172 ?auto_113173 ) ) ( not ( = ?auto_113172 ?auto_113174 ) ) ( not ( = ?auto_113172 ?auto_113175 ) ) ( not ( = ?auto_113173 ?auto_113174 ) ) ( not ( = ?auto_113173 ?auto_113175 ) ) ( not ( = ?auto_113174 ?auto_113175 ) ) ( ON ?auto_113174 ?auto_113175 ) ( ON ?auto_113173 ?auto_113174 ) ( ON ?auto_113172 ?auto_113173 ) ( ON ?auto_113171 ?auto_113172 ) ( ON ?auto_113170 ?auto_113171 ) ( ON ?auto_113169 ?auto_113170 ) ( ON ?auto_113168 ?auto_113169 ) ( ON ?auto_113167 ?auto_113168 ) ( CLEAR ?auto_113165 ) ( ON ?auto_113166 ?auto_113167 ) ( CLEAR ?auto_113166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113165 ?auto_113166 )
      ( MAKE-11PILE ?auto_113165 ?auto_113166 ?auto_113167 ?auto_113168 ?auto_113169 ?auto_113170 ?auto_113171 ?auto_113172 ?auto_113173 ?auto_113174 ?auto_113175 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113187 - BLOCK
      ?auto_113188 - BLOCK
      ?auto_113189 - BLOCK
      ?auto_113190 - BLOCK
      ?auto_113191 - BLOCK
      ?auto_113192 - BLOCK
      ?auto_113193 - BLOCK
      ?auto_113194 - BLOCK
      ?auto_113195 - BLOCK
      ?auto_113196 - BLOCK
      ?auto_113197 - BLOCK
    )
    :vars
    (
      ?auto_113198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113197 ?auto_113198 ) ( not ( = ?auto_113187 ?auto_113188 ) ) ( not ( = ?auto_113187 ?auto_113189 ) ) ( not ( = ?auto_113187 ?auto_113190 ) ) ( not ( = ?auto_113187 ?auto_113191 ) ) ( not ( = ?auto_113187 ?auto_113192 ) ) ( not ( = ?auto_113187 ?auto_113193 ) ) ( not ( = ?auto_113187 ?auto_113194 ) ) ( not ( = ?auto_113187 ?auto_113195 ) ) ( not ( = ?auto_113187 ?auto_113196 ) ) ( not ( = ?auto_113187 ?auto_113197 ) ) ( not ( = ?auto_113187 ?auto_113198 ) ) ( not ( = ?auto_113188 ?auto_113189 ) ) ( not ( = ?auto_113188 ?auto_113190 ) ) ( not ( = ?auto_113188 ?auto_113191 ) ) ( not ( = ?auto_113188 ?auto_113192 ) ) ( not ( = ?auto_113188 ?auto_113193 ) ) ( not ( = ?auto_113188 ?auto_113194 ) ) ( not ( = ?auto_113188 ?auto_113195 ) ) ( not ( = ?auto_113188 ?auto_113196 ) ) ( not ( = ?auto_113188 ?auto_113197 ) ) ( not ( = ?auto_113188 ?auto_113198 ) ) ( not ( = ?auto_113189 ?auto_113190 ) ) ( not ( = ?auto_113189 ?auto_113191 ) ) ( not ( = ?auto_113189 ?auto_113192 ) ) ( not ( = ?auto_113189 ?auto_113193 ) ) ( not ( = ?auto_113189 ?auto_113194 ) ) ( not ( = ?auto_113189 ?auto_113195 ) ) ( not ( = ?auto_113189 ?auto_113196 ) ) ( not ( = ?auto_113189 ?auto_113197 ) ) ( not ( = ?auto_113189 ?auto_113198 ) ) ( not ( = ?auto_113190 ?auto_113191 ) ) ( not ( = ?auto_113190 ?auto_113192 ) ) ( not ( = ?auto_113190 ?auto_113193 ) ) ( not ( = ?auto_113190 ?auto_113194 ) ) ( not ( = ?auto_113190 ?auto_113195 ) ) ( not ( = ?auto_113190 ?auto_113196 ) ) ( not ( = ?auto_113190 ?auto_113197 ) ) ( not ( = ?auto_113190 ?auto_113198 ) ) ( not ( = ?auto_113191 ?auto_113192 ) ) ( not ( = ?auto_113191 ?auto_113193 ) ) ( not ( = ?auto_113191 ?auto_113194 ) ) ( not ( = ?auto_113191 ?auto_113195 ) ) ( not ( = ?auto_113191 ?auto_113196 ) ) ( not ( = ?auto_113191 ?auto_113197 ) ) ( not ( = ?auto_113191 ?auto_113198 ) ) ( not ( = ?auto_113192 ?auto_113193 ) ) ( not ( = ?auto_113192 ?auto_113194 ) ) ( not ( = ?auto_113192 ?auto_113195 ) ) ( not ( = ?auto_113192 ?auto_113196 ) ) ( not ( = ?auto_113192 ?auto_113197 ) ) ( not ( = ?auto_113192 ?auto_113198 ) ) ( not ( = ?auto_113193 ?auto_113194 ) ) ( not ( = ?auto_113193 ?auto_113195 ) ) ( not ( = ?auto_113193 ?auto_113196 ) ) ( not ( = ?auto_113193 ?auto_113197 ) ) ( not ( = ?auto_113193 ?auto_113198 ) ) ( not ( = ?auto_113194 ?auto_113195 ) ) ( not ( = ?auto_113194 ?auto_113196 ) ) ( not ( = ?auto_113194 ?auto_113197 ) ) ( not ( = ?auto_113194 ?auto_113198 ) ) ( not ( = ?auto_113195 ?auto_113196 ) ) ( not ( = ?auto_113195 ?auto_113197 ) ) ( not ( = ?auto_113195 ?auto_113198 ) ) ( not ( = ?auto_113196 ?auto_113197 ) ) ( not ( = ?auto_113196 ?auto_113198 ) ) ( not ( = ?auto_113197 ?auto_113198 ) ) ( ON ?auto_113196 ?auto_113197 ) ( ON ?auto_113195 ?auto_113196 ) ( ON ?auto_113194 ?auto_113195 ) ( ON ?auto_113193 ?auto_113194 ) ( ON ?auto_113192 ?auto_113193 ) ( ON ?auto_113191 ?auto_113192 ) ( ON ?auto_113190 ?auto_113191 ) ( ON ?auto_113189 ?auto_113190 ) ( ON ?auto_113188 ?auto_113189 ) ( ON ?auto_113187 ?auto_113188 ) ( CLEAR ?auto_113187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113187 )
      ( MAKE-11PILE ?auto_113187 ?auto_113188 ?auto_113189 ?auto_113190 ?auto_113191 ?auto_113192 ?auto_113193 ?auto_113194 ?auto_113195 ?auto_113196 ?auto_113197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113210 - BLOCK
      ?auto_113211 - BLOCK
      ?auto_113212 - BLOCK
      ?auto_113213 - BLOCK
      ?auto_113214 - BLOCK
      ?auto_113215 - BLOCK
      ?auto_113216 - BLOCK
      ?auto_113217 - BLOCK
      ?auto_113218 - BLOCK
      ?auto_113219 - BLOCK
      ?auto_113220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113220 ) ( not ( = ?auto_113210 ?auto_113211 ) ) ( not ( = ?auto_113210 ?auto_113212 ) ) ( not ( = ?auto_113210 ?auto_113213 ) ) ( not ( = ?auto_113210 ?auto_113214 ) ) ( not ( = ?auto_113210 ?auto_113215 ) ) ( not ( = ?auto_113210 ?auto_113216 ) ) ( not ( = ?auto_113210 ?auto_113217 ) ) ( not ( = ?auto_113210 ?auto_113218 ) ) ( not ( = ?auto_113210 ?auto_113219 ) ) ( not ( = ?auto_113210 ?auto_113220 ) ) ( not ( = ?auto_113211 ?auto_113212 ) ) ( not ( = ?auto_113211 ?auto_113213 ) ) ( not ( = ?auto_113211 ?auto_113214 ) ) ( not ( = ?auto_113211 ?auto_113215 ) ) ( not ( = ?auto_113211 ?auto_113216 ) ) ( not ( = ?auto_113211 ?auto_113217 ) ) ( not ( = ?auto_113211 ?auto_113218 ) ) ( not ( = ?auto_113211 ?auto_113219 ) ) ( not ( = ?auto_113211 ?auto_113220 ) ) ( not ( = ?auto_113212 ?auto_113213 ) ) ( not ( = ?auto_113212 ?auto_113214 ) ) ( not ( = ?auto_113212 ?auto_113215 ) ) ( not ( = ?auto_113212 ?auto_113216 ) ) ( not ( = ?auto_113212 ?auto_113217 ) ) ( not ( = ?auto_113212 ?auto_113218 ) ) ( not ( = ?auto_113212 ?auto_113219 ) ) ( not ( = ?auto_113212 ?auto_113220 ) ) ( not ( = ?auto_113213 ?auto_113214 ) ) ( not ( = ?auto_113213 ?auto_113215 ) ) ( not ( = ?auto_113213 ?auto_113216 ) ) ( not ( = ?auto_113213 ?auto_113217 ) ) ( not ( = ?auto_113213 ?auto_113218 ) ) ( not ( = ?auto_113213 ?auto_113219 ) ) ( not ( = ?auto_113213 ?auto_113220 ) ) ( not ( = ?auto_113214 ?auto_113215 ) ) ( not ( = ?auto_113214 ?auto_113216 ) ) ( not ( = ?auto_113214 ?auto_113217 ) ) ( not ( = ?auto_113214 ?auto_113218 ) ) ( not ( = ?auto_113214 ?auto_113219 ) ) ( not ( = ?auto_113214 ?auto_113220 ) ) ( not ( = ?auto_113215 ?auto_113216 ) ) ( not ( = ?auto_113215 ?auto_113217 ) ) ( not ( = ?auto_113215 ?auto_113218 ) ) ( not ( = ?auto_113215 ?auto_113219 ) ) ( not ( = ?auto_113215 ?auto_113220 ) ) ( not ( = ?auto_113216 ?auto_113217 ) ) ( not ( = ?auto_113216 ?auto_113218 ) ) ( not ( = ?auto_113216 ?auto_113219 ) ) ( not ( = ?auto_113216 ?auto_113220 ) ) ( not ( = ?auto_113217 ?auto_113218 ) ) ( not ( = ?auto_113217 ?auto_113219 ) ) ( not ( = ?auto_113217 ?auto_113220 ) ) ( not ( = ?auto_113218 ?auto_113219 ) ) ( not ( = ?auto_113218 ?auto_113220 ) ) ( not ( = ?auto_113219 ?auto_113220 ) ) ( ON ?auto_113219 ?auto_113220 ) ( ON ?auto_113218 ?auto_113219 ) ( ON ?auto_113217 ?auto_113218 ) ( ON ?auto_113216 ?auto_113217 ) ( ON ?auto_113215 ?auto_113216 ) ( ON ?auto_113214 ?auto_113215 ) ( ON ?auto_113213 ?auto_113214 ) ( ON ?auto_113212 ?auto_113213 ) ( ON ?auto_113211 ?auto_113212 ) ( ON ?auto_113210 ?auto_113211 ) ( CLEAR ?auto_113210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113210 )
      ( MAKE-11PILE ?auto_113210 ?auto_113211 ?auto_113212 ?auto_113213 ?auto_113214 ?auto_113215 ?auto_113216 ?auto_113217 ?auto_113218 ?auto_113219 ?auto_113220 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_113232 - BLOCK
      ?auto_113233 - BLOCK
      ?auto_113234 - BLOCK
      ?auto_113235 - BLOCK
      ?auto_113236 - BLOCK
      ?auto_113237 - BLOCK
      ?auto_113238 - BLOCK
      ?auto_113239 - BLOCK
      ?auto_113240 - BLOCK
      ?auto_113241 - BLOCK
      ?auto_113242 - BLOCK
    )
    :vars
    (
      ?auto_113243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113232 ?auto_113233 ) ) ( not ( = ?auto_113232 ?auto_113234 ) ) ( not ( = ?auto_113232 ?auto_113235 ) ) ( not ( = ?auto_113232 ?auto_113236 ) ) ( not ( = ?auto_113232 ?auto_113237 ) ) ( not ( = ?auto_113232 ?auto_113238 ) ) ( not ( = ?auto_113232 ?auto_113239 ) ) ( not ( = ?auto_113232 ?auto_113240 ) ) ( not ( = ?auto_113232 ?auto_113241 ) ) ( not ( = ?auto_113232 ?auto_113242 ) ) ( not ( = ?auto_113233 ?auto_113234 ) ) ( not ( = ?auto_113233 ?auto_113235 ) ) ( not ( = ?auto_113233 ?auto_113236 ) ) ( not ( = ?auto_113233 ?auto_113237 ) ) ( not ( = ?auto_113233 ?auto_113238 ) ) ( not ( = ?auto_113233 ?auto_113239 ) ) ( not ( = ?auto_113233 ?auto_113240 ) ) ( not ( = ?auto_113233 ?auto_113241 ) ) ( not ( = ?auto_113233 ?auto_113242 ) ) ( not ( = ?auto_113234 ?auto_113235 ) ) ( not ( = ?auto_113234 ?auto_113236 ) ) ( not ( = ?auto_113234 ?auto_113237 ) ) ( not ( = ?auto_113234 ?auto_113238 ) ) ( not ( = ?auto_113234 ?auto_113239 ) ) ( not ( = ?auto_113234 ?auto_113240 ) ) ( not ( = ?auto_113234 ?auto_113241 ) ) ( not ( = ?auto_113234 ?auto_113242 ) ) ( not ( = ?auto_113235 ?auto_113236 ) ) ( not ( = ?auto_113235 ?auto_113237 ) ) ( not ( = ?auto_113235 ?auto_113238 ) ) ( not ( = ?auto_113235 ?auto_113239 ) ) ( not ( = ?auto_113235 ?auto_113240 ) ) ( not ( = ?auto_113235 ?auto_113241 ) ) ( not ( = ?auto_113235 ?auto_113242 ) ) ( not ( = ?auto_113236 ?auto_113237 ) ) ( not ( = ?auto_113236 ?auto_113238 ) ) ( not ( = ?auto_113236 ?auto_113239 ) ) ( not ( = ?auto_113236 ?auto_113240 ) ) ( not ( = ?auto_113236 ?auto_113241 ) ) ( not ( = ?auto_113236 ?auto_113242 ) ) ( not ( = ?auto_113237 ?auto_113238 ) ) ( not ( = ?auto_113237 ?auto_113239 ) ) ( not ( = ?auto_113237 ?auto_113240 ) ) ( not ( = ?auto_113237 ?auto_113241 ) ) ( not ( = ?auto_113237 ?auto_113242 ) ) ( not ( = ?auto_113238 ?auto_113239 ) ) ( not ( = ?auto_113238 ?auto_113240 ) ) ( not ( = ?auto_113238 ?auto_113241 ) ) ( not ( = ?auto_113238 ?auto_113242 ) ) ( not ( = ?auto_113239 ?auto_113240 ) ) ( not ( = ?auto_113239 ?auto_113241 ) ) ( not ( = ?auto_113239 ?auto_113242 ) ) ( not ( = ?auto_113240 ?auto_113241 ) ) ( not ( = ?auto_113240 ?auto_113242 ) ) ( not ( = ?auto_113241 ?auto_113242 ) ) ( ON ?auto_113232 ?auto_113243 ) ( not ( = ?auto_113242 ?auto_113243 ) ) ( not ( = ?auto_113241 ?auto_113243 ) ) ( not ( = ?auto_113240 ?auto_113243 ) ) ( not ( = ?auto_113239 ?auto_113243 ) ) ( not ( = ?auto_113238 ?auto_113243 ) ) ( not ( = ?auto_113237 ?auto_113243 ) ) ( not ( = ?auto_113236 ?auto_113243 ) ) ( not ( = ?auto_113235 ?auto_113243 ) ) ( not ( = ?auto_113234 ?auto_113243 ) ) ( not ( = ?auto_113233 ?auto_113243 ) ) ( not ( = ?auto_113232 ?auto_113243 ) ) ( ON ?auto_113233 ?auto_113232 ) ( ON ?auto_113234 ?auto_113233 ) ( ON ?auto_113235 ?auto_113234 ) ( ON ?auto_113236 ?auto_113235 ) ( ON ?auto_113237 ?auto_113236 ) ( ON ?auto_113238 ?auto_113237 ) ( ON ?auto_113239 ?auto_113238 ) ( ON ?auto_113240 ?auto_113239 ) ( ON ?auto_113241 ?auto_113240 ) ( ON ?auto_113242 ?auto_113241 ) ( CLEAR ?auto_113242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_113242 ?auto_113241 ?auto_113240 ?auto_113239 ?auto_113238 ?auto_113237 ?auto_113236 ?auto_113235 ?auto_113234 ?auto_113233 ?auto_113232 )
      ( MAKE-11PILE ?auto_113232 ?auto_113233 ?auto_113234 ?auto_113235 ?auto_113236 ?auto_113237 ?auto_113238 ?auto_113239 ?auto_113240 ?auto_113241 ?auto_113242 ) )
  )

)

