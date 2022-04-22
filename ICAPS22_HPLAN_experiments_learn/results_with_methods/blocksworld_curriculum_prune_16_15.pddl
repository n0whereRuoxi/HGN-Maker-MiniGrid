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
      ?auto_559036 - BLOCK
    )
    :vars
    (
      ?auto_559037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559036 ?auto_559037 ) ( CLEAR ?auto_559036 ) ( HAND-EMPTY ) ( not ( = ?auto_559036 ?auto_559037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559036 ?auto_559037 )
      ( !PUTDOWN ?auto_559036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_559043 - BLOCK
      ?auto_559044 - BLOCK
    )
    :vars
    (
      ?auto_559045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559043 ) ( ON ?auto_559044 ?auto_559045 ) ( CLEAR ?auto_559044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559043 ) ( not ( = ?auto_559043 ?auto_559044 ) ) ( not ( = ?auto_559043 ?auto_559045 ) ) ( not ( = ?auto_559044 ?auto_559045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559044 ?auto_559045 )
      ( !STACK ?auto_559044 ?auto_559043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_559053 - BLOCK
      ?auto_559054 - BLOCK
    )
    :vars
    (
      ?auto_559055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559054 ?auto_559055 ) ( not ( = ?auto_559053 ?auto_559054 ) ) ( not ( = ?auto_559053 ?auto_559055 ) ) ( not ( = ?auto_559054 ?auto_559055 ) ) ( ON ?auto_559053 ?auto_559054 ) ( CLEAR ?auto_559053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559053 )
      ( MAKE-2PILE ?auto_559053 ?auto_559054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_559064 - BLOCK
      ?auto_559065 - BLOCK
      ?auto_559066 - BLOCK
    )
    :vars
    (
      ?auto_559067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559065 ) ( ON ?auto_559066 ?auto_559067 ) ( CLEAR ?auto_559066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559064 ) ( ON ?auto_559065 ?auto_559064 ) ( not ( = ?auto_559064 ?auto_559065 ) ) ( not ( = ?auto_559064 ?auto_559066 ) ) ( not ( = ?auto_559064 ?auto_559067 ) ) ( not ( = ?auto_559065 ?auto_559066 ) ) ( not ( = ?auto_559065 ?auto_559067 ) ) ( not ( = ?auto_559066 ?auto_559067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559066 ?auto_559067 )
      ( !STACK ?auto_559066 ?auto_559065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_559078 - BLOCK
      ?auto_559079 - BLOCK
      ?auto_559080 - BLOCK
    )
    :vars
    (
      ?auto_559081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559080 ?auto_559081 ) ( ON-TABLE ?auto_559078 ) ( not ( = ?auto_559078 ?auto_559079 ) ) ( not ( = ?auto_559078 ?auto_559080 ) ) ( not ( = ?auto_559078 ?auto_559081 ) ) ( not ( = ?auto_559079 ?auto_559080 ) ) ( not ( = ?auto_559079 ?auto_559081 ) ) ( not ( = ?auto_559080 ?auto_559081 ) ) ( CLEAR ?auto_559078 ) ( ON ?auto_559079 ?auto_559080 ) ( CLEAR ?auto_559079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559078 ?auto_559079 )
      ( MAKE-3PILE ?auto_559078 ?auto_559079 ?auto_559080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_559092 - BLOCK
      ?auto_559093 - BLOCK
      ?auto_559094 - BLOCK
    )
    :vars
    (
      ?auto_559095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559094 ?auto_559095 ) ( not ( = ?auto_559092 ?auto_559093 ) ) ( not ( = ?auto_559092 ?auto_559094 ) ) ( not ( = ?auto_559092 ?auto_559095 ) ) ( not ( = ?auto_559093 ?auto_559094 ) ) ( not ( = ?auto_559093 ?auto_559095 ) ) ( not ( = ?auto_559094 ?auto_559095 ) ) ( ON ?auto_559093 ?auto_559094 ) ( ON ?auto_559092 ?auto_559093 ) ( CLEAR ?auto_559092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559092 )
      ( MAKE-3PILE ?auto_559092 ?auto_559093 ?auto_559094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_559107 - BLOCK
      ?auto_559108 - BLOCK
      ?auto_559109 - BLOCK
      ?auto_559110 - BLOCK
    )
    :vars
    (
      ?auto_559111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559109 ) ( ON ?auto_559110 ?auto_559111 ) ( CLEAR ?auto_559110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559107 ) ( ON ?auto_559108 ?auto_559107 ) ( ON ?auto_559109 ?auto_559108 ) ( not ( = ?auto_559107 ?auto_559108 ) ) ( not ( = ?auto_559107 ?auto_559109 ) ) ( not ( = ?auto_559107 ?auto_559110 ) ) ( not ( = ?auto_559107 ?auto_559111 ) ) ( not ( = ?auto_559108 ?auto_559109 ) ) ( not ( = ?auto_559108 ?auto_559110 ) ) ( not ( = ?auto_559108 ?auto_559111 ) ) ( not ( = ?auto_559109 ?auto_559110 ) ) ( not ( = ?auto_559109 ?auto_559111 ) ) ( not ( = ?auto_559110 ?auto_559111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559110 ?auto_559111 )
      ( !STACK ?auto_559110 ?auto_559109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_559125 - BLOCK
      ?auto_559126 - BLOCK
      ?auto_559127 - BLOCK
      ?auto_559128 - BLOCK
    )
    :vars
    (
      ?auto_559129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559128 ?auto_559129 ) ( ON-TABLE ?auto_559125 ) ( ON ?auto_559126 ?auto_559125 ) ( not ( = ?auto_559125 ?auto_559126 ) ) ( not ( = ?auto_559125 ?auto_559127 ) ) ( not ( = ?auto_559125 ?auto_559128 ) ) ( not ( = ?auto_559125 ?auto_559129 ) ) ( not ( = ?auto_559126 ?auto_559127 ) ) ( not ( = ?auto_559126 ?auto_559128 ) ) ( not ( = ?auto_559126 ?auto_559129 ) ) ( not ( = ?auto_559127 ?auto_559128 ) ) ( not ( = ?auto_559127 ?auto_559129 ) ) ( not ( = ?auto_559128 ?auto_559129 ) ) ( CLEAR ?auto_559126 ) ( ON ?auto_559127 ?auto_559128 ) ( CLEAR ?auto_559127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_559125 ?auto_559126 ?auto_559127 )
      ( MAKE-4PILE ?auto_559125 ?auto_559126 ?auto_559127 ?auto_559128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_559143 - BLOCK
      ?auto_559144 - BLOCK
      ?auto_559145 - BLOCK
      ?auto_559146 - BLOCK
    )
    :vars
    (
      ?auto_559147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559146 ?auto_559147 ) ( ON-TABLE ?auto_559143 ) ( not ( = ?auto_559143 ?auto_559144 ) ) ( not ( = ?auto_559143 ?auto_559145 ) ) ( not ( = ?auto_559143 ?auto_559146 ) ) ( not ( = ?auto_559143 ?auto_559147 ) ) ( not ( = ?auto_559144 ?auto_559145 ) ) ( not ( = ?auto_559144 ?auto_559146 ) ) ( not ( = ?auto_559144 ?auto_559147 ) ) ( not ( = ?auto_559145 ?auto_559146 ) ) ( not ( = ?auto_559145 ?auto_559147 ) ) ( not ( = ?auto_559146 ?auto_559147 ) ) ( ON ?auto_559145 ?auto_559146 ) ( CLEAR ?auto_559143 ) ( ON ?auto_559144 ?auto_559145 ) ( CLEAR ?auto_559144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559143 ?auto_559144 )
      ( MAKE-4PILE ?auto_559143 ?auto_559144 ?auto_559145 ?auto_559146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_559161 - BLOCK
      ?auto_559162 - BLOCK
      ?auto_559163 - BLOCK
      ?auto_559164 - BLOCK
    )
    :vars
    (
      ?auto_559165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559164 ?auto_559165 ) ( not ( = ?auto_559161 ?auto_559162 ) ) ( not ( = ?auto_559161 ?auto_559163 ) ) ( not ( = ?auto_559161 ?auto_559164 ) ) ( not ( = ?auto_559161 ?auto_559165 ) ) ( not ( = ?auto_559162 ?auto_559163 ) ) ( not ( = ?auto_559162 ?auto_559164 ) ) ( not ( = ?auto_559162 ?auto_559165 ) ) ( not ( = ?auto_559163 ?auto_559164 ) ) ( not ( = ?auto_559163 ?auto_559165 ) ) ( not ( = ?auto_559164 ?auto_559165 ) ) ( ON ?auto_559163 ?auto_559164 ) ( ON ?auto_559162 ?auto_559163 ) ( ON ?auto_559161 ?auto_559162 ) ( CLEAR ?auto_559161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559161 )
      ( MAKE-4PILE ?auto_559161 ?auto_559162 ?auto_559163 ?auto_559164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_559180 - BLOCK
      ?auto_559181 - BLOCK
      ?auto_559182 - BLOCK
      ?auto_559183 - BLOCK
      ?auto_559184 - BLOCK
    )
    :vars
    (
      ?auto_559185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559183 ) ( ON ?auto_559184 ?auto_559185 ) ( CLEAR ?auto_559184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559180 ) ( ON ?auto_559181 ?auto_559180 ) ( ON ?auto_559182 ?auto_559181 ) ( ON ?auto_559183 ?auto_559182 ) ( not ( = ?auto_559180 ?auto_559181 ) ) ( not ( = ?auto_559180 ?auto_559182 ) ) ( not ( = ?auto_559180 ?auto_559183 ) ) ( not ( = ?auto_559180 ?auto_559184 ) ) ( not ( = ?auto_559180 ?auto_559185 ) ) ( not ( = ?auto_559181 ?auto_559182 ) ) ( not ( = ?auto_559181 ?auto_559183 ) ) ( not ( = ?auto_559181 ?auto_559184 ) ) ( not ( = ?auto_559181 ?auto_559185 ) ) ( not ( = ?auto_559182 ?auto_559183 ) ) ( not ( = ?auto_559182 ?auto_559184 ) ) ( not ( = ?auto_559182 ?auto_559185 ) ) ( not ( = ?auto_559183 ?auto_559184 ) ) ( not ( = ?auto_559183 ?auto_559185 ) ) ( not ( = ?auto_559184 ?auto_559185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559184 ?auto_559185 )
      ( !STACK ?auto_559184 ?auto_559183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_559202 - BLOCK
      ?auto_559203 - BLOCK
      ?auto_559204 - BLOCK
      ?auto_559205 - BLOCK
      ?auto_559206 - BLOCK
    )
    :vars
    (
      ?auto_559207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559206 ?auto_559207 ) ( ON-TABLE ?auto_559202 ) ( ON ?auto_559203 ?auto_559202 ) ( ON ?auto_559204 ?auto_559203 ) ( not ( = ?auto_559202 ?auto_559203 ) ) ( not ( = ?auto_559202 ?auto_559204 ) ) ( not ( = ?auto_559202 ?auto_559205 ) ) ( not ( = ?auto_559202 ?auto_559206 ) ) ( not ( = ?auto_559202 ?auto_559207 ) ) ( not ( = ?auto_559203 ?auto_559204 ) ) ( not ( = ?auto_559203 ?auto_559205 ) ) ( not ( = ?auto_559203 ?auto_559206 ) ) ( not ( = ?auto_559203 ?auto_559207 ) ) ( not ( = ?auto_559204 ?auto_559205 ) ) ( not ( = ?auto_559204 ?auto_559206 ) ) ( not ( = ?auto_559204 ?auto_559207 ) ) ( not ( = ?auto_559205 ?auto_559206 ) ) ( not ( = ?auto_559205 ?auto_559207 ) ) ( not ( = ?auto_559206 ?auto_559207 ) ) ( CLEAR ?auto_559204 ) ( ON ?auto_559205 ?auto_559206 ) ( CLEAR ?auto_559205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_559202 ?auto_559203 ?auto_559204 ?auto_559205 )
      ( MAKE-5PILE ?auto_559202 ?auto_559203 ?auto_559204 ?auto_559205 ?auto_559206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_559224 - BLOCK
      ?auto_559225 - BLOCK
      ?auto_559226 - BLOCK
      ?auto_559227 - BLOCK
      ?auto_559228 - BLOCK
    )
    :vars
    (
      ?auto_559229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559228 ?auto_559229 ) ( ON-TABLE ?auto_559224 ) ( ON ?auto_559225 ?auto_559224 ) ( not ( = ?auto_559224 ?auto_559225 ) ) ( not ( = ?auto_559224 ?auto_559226 ) ) ( not ( = ?auto_559224 ?auto_559227 ) ) ( not ( = ?auto_559224 ?auto_559228 ) ) ( not ( = ?auto_559224 ?auto_559229 ) ) ( not ( = ?auto_559225 ?auto_559226 ) ) ( not ( = ?auto_559225 ?auto_559227 ) ) ( not ( = ?auto_559225 ?auto_559228 ) ) ( not ( = ?auto_559225 ?auto_559229 ) ) ( not ( = ?auto_559226 ?auto_559227 ) ) ( not ( = ?auto_559226 ?auto_559228 ) ) ( not ( = ?auto_559226 ?auto_559229 ) ) ( not ( = ?auto_559227 ?auto_559228 ) ) ( not ( = ?auto_559227 ?auto_559229 ) ) ( not ( = ?auto_559228 ?auto_559229 ) ) ( ON ?auto_559227 ?auto_559228 ) ( CLEAR ?auto_559225 ) ( ON ?auto_559226 ?auto_559227 ) ( CLEAR ?auto_559226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_559224 ?auto_559225 ?auto_559226 )
      ( MAKE-5PILE ?auto_559224 ?auto_559225 ?auto_559226 ?auto_559227 ?auto_559228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_559246 - BLOCK
      ?auto_559247 - BLOCK
      ?auto_559248 - BLOCK
      ?auto_559249 - BLOCK
      ?auto_559250 - BLOCK
    )
    :vars
    (
      ?auto_559251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559250 ?auto_559251 ) ( ON-TABLE ?auto_559246 ) ( not ( = ?auto_559246 ?auto_559247 ) ) ( not ( = ?auto_559246 ?auto_559248 ) ) ( not ( = ?auto_559246 ?auto_559249 ) ) ( not ( = ?auto_559246 ?auto_559250 ) ) ( not ( = ?auto_559246 ?auto_559251 ) ) ( not ( = ?auto_559247 ?auto_559248 ) ) ( not ( = ?auto_559247 ?auto_559249 ) ) ( not ( = ?auto_559247 ?auto_559250 ) ) ( not ( = ?auto_559247 ?auto_559251 ) ) ( not ( = ?auto_559248 ?auto_559249 ) ) ( not ( = ?auto_559248 ?auto_559250 ) ) ( not ( = ?auto_559248 ?auto_559251 ) ) ( not ( = ?auto_559249 ?auto_559250 ) ) ( not ( = ?auto_559249 ?auto_559251 ) ) ( not ( = ?auto_559250 ?auto_559251 ) ) ( ON ?auto_559249 ?auto_559250 ) ( ON ?auto_559248 ?auto_559249 ) ( CLEAR ?auto_559246 ) ( ON ?auto_559247 ?auto_559248 ) ( CLEAR ?auto_559247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559246 ?auto_559247 )
      ( MAKE-5PILE ?auto_559246 ?auto_559247 ?auto_559248 ?auto_559249 ?auto_559250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_559268 - BLOCK
      ?auto_559269 - BLOCK
      ?auto_559270 - BLOCK
      ?auto_559271 - BLOCK
      ?auto_559272 - BLOCK
    )
    :vars
    (
      ?auto_559273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559272 ?auto_559273 ) ( not ( = ?auto_559268 ?auto_559269 ) ) ( not ( = ?auto_559268 ?auto_559270 ) ) ( not ( = ?auto_559268 ?auto_559271 ) ) ( not ( = ?auto_559268 ?auto_559272 ) ) ( not ( = ?auto_559268 ?auto_559273 ) ) ( not ( = ?auto_559269 ?auto_559270 ) ) ( not ( = ?auto_559269 ?auto_559271 ) ) ( not ( = ?auto_559269 ?auto_559272 ) ) ( not ( = ?auto_559269 ?auto_559273 ) ) ( not ( = ?auto_559270 ?auto_559271 ) ) ( not ( = ?auto_559270 ?auto_559272 ) ) ( not ( = ?auto_559270 ?auto_559273 ) ) ( not ( = ?auto_559271 ?auto_559272 ) ) ( not ( = ?auto_559271 ?auto_559273 ) ) ( not ( = ?auto_559272 ?auto_559273 ) ) ( ON ?auto_559271 ?auto_559272 ) ( ON ?auto_559270 ?auto_559271 ) ( ON ?auto_559269 ?auto_559270 ) ( ON ?auto_559268 ?auto_559269 ) ( CLEAR ?auto_559268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559268 )
      ( MAKE-5PILE ?auto_559268 ?auto_559269 ?auto_559270 ?auto_559271 ?auto_559272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559291 - BLOCK
      ?auto_559292 - BLOCK
      ?auto_559293 - BLOCK
      ?auto_559294 - BLOCK
      ?auto_559295 - BLOCK
      ?auto_559296 - BLOCK
    )
    :vars
    (
      ?auto_559297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559295 ) ( ON ?auto_559296 ?auto_559297 ) ( CLEAR ?auto_559296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559291 ) ( ON ?auto_559292 ?auto_559291 ) ( ON ?auto_559293 ?auto_559292 ) ( ON ?auto_559294 ?auto_559293 ) ( ON ?auto_559295 ?auto_559294 ) ( not ( = ?auto_559291 ?auto_559292 ) ) ( not ( = ?auto_559291 ?auto_559293 ) ) ( not ( = ?auto_559291 ?auto_559294 ) ) ( not ( = ?auto_559291 ?auto_559295 ) ) ( not ( = ?auto_559291 ?auto_559296 ) ) ( not ( = ?auto_559291 ?auto_559297 ) ) ( not ( = ?auto_559292 ?auto_559293 ) ) ( not ( = ?auto_559292 ?auto_559294 ) ) ( not ( = ?auto_559292 ?auto_559295 ) ) ( not ( = ?auto_559292 ?auto_559296 ) ) ( not ( = ?auto_559292 ?auto_559297 ) ) ( not ( = ?auto_559293 ?auto_559294 ) ) ( not ( = ?auto_559293 ?auto_559295 ) ) ( not ( = ?auto_559293 ?auto_559296 ) ) ( not ( = ?auto_559293 ?auto_559297 ) ) ( not ( = ?auto_559294 ?auto_559295 ) ) ( not ( = ?auto_559294 ?auto_559296 ) ) ( not ( = ?auto_559294 ?auto_559297 ) ) ( not ( = ?auto_559295 ?auto_559296 ) ) ( not ( = ?auto_559295 ?auto_559297 ) ) ( not ( = ?auto_559296 ?auto_559297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559296 ?auto_559297 )
      ( !STACK ?auto_559296 ?auto_559295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559317 - BLOCK
      ?auto_559318 - BLOCK
      ?auto_559319 - BLOCK
      ?auto_559320 - BLOCK
      ?auto_559321 - BLOCK
      ?auto_559322 - BLOCK
    )
    :vars
    (
      ?auto_559323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559322 ?auto_559323 ) ( ON-TABLE ?auto_559317 ) ( ON ?auto_559318 ?auto_559317 ) ( ON ?auto_559319 ?auto_559318 ) ( ON ?auto_559320 ?auto_559319 ) ( not ( = ?auto_559317 ?auto_559318 ) ) ( not ( = ?auto_559317 ?auto_559319 ) ) ( not ( = ?auto_559317 ?auto_559320 ) ) ( not ( = ?auto_559317 ?auto_559321 ) ) ( not ( = ?auto_559317 ?auto_559322 ) ) ( not ( = ?auto_559317 ?auto_559323 ) ) ( not ( = ?auto_559318 ?auto_559319 ) ) ( not ( = ?auto_559318 ?auto_559320 ) ) ( not ( = ?auto_559318 ?auto_559321 ) ) ( not ( = ?auto_559318 ?auto_559322 ) ) ( not ( = ?auto_559318 ?auto_559323 ) ) ( not ( = ?auto_559319 ?auto_559320 ) ) ( not ( = ?auto_559319 ?auto_559321 ) ) ( not ( = ?auto_559319 ?auto_559322 ) ) ( not ( = ?auto_559319 ?auto_559323 ) ) ( not ( = ?auto_559320 ?auto_559321 ) ) ( not ( = ?auto_559320 ?auto_559322 ) ) ( not ( = ?auto_559320 ?auto_559323 ) ) ( not ( = ?auto_559321 ?auto_559322 ) ) ( not ( = ?auto_559321 ?auto_559323 ) ) ( not ( = ?auto_559322 ?auto_559323 ) ) ( CLEAR ?auto_559320 ) ( ON ?auto_559321 ?auto_559322 ) ( CLEAR ?auto_559321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_559317 ?auto_559318 ?auto_559319 ?auto_559320 ?auto_559321 )
      ( MAKE-6PILE ?auto_559317 ?auto_559318 ?auto_559319 ?auto_559320 ?auto_559321 ?auto_559322 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559343 - BLOCK
      ?auto_559344 - BLOCK
      ?auto_559345 - BLOCK
      ?auto_559346 - BLOCK
      ?auto_559347 - BLOCK
      ?auto_559348 - BLOCK
    )
    :vars
    (
      ?auto_559349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559348 ?auto_559349 ) ( ON-TABLE ?auto_559343 ) ( ON ?auto_559344 ?auto_559343 ) ( ON ?auto_559345 ?auto_559344 ) ( not ( = ?auto_559343 ?auto_559344 ) ) ( not ( = ?auto_559343 ?auto_559345 ) ) ( not ( = ?auto_559343 ?auto_559346 ) ) ( not ( = ?auto_559343 ?auto_559347 ) ) ( not ( = ?auto_559343 ?auto_559348 ) ) ( not ( = ?auto_559343 ?auto_559349 ) ) ( not ( = ?auto_559344 ?auto_559345 ) ) ( not ( = ?auto_559344 ?auto_559346 ) ) ( not ( = ?auto_559344 ?auto_559347 ) ) ( not ( = ?auto_559344 ?auto_559348 ) ) ( not ( = ?auto_559344 ?auto_559349 ) ) ( not ( = ?auto_559345 ?auto_559346 ) ) ( not ( = ?auto_559345 ?auto_559347 ) ) ( not ( = ?auto_559345 ?auto_559348 ) ) ( not ( = ?auto_559345 ?auto_559349 ) ) ( not ( = ?auto_559346 ?auto_559347 ) ) ( not ( = ?auto_559346 ?auto_559348 ) ) ( not ( = ?auto_559346 ?auto_559349 ) ) ( not ( = ?auto_559347 ?auto_559348 ) ) ( not ( = ?auto_559347 ?auto_559349 ) ) ( not ( = ?auto_559348 ?auto_559349 ) ) ( ON ?auto_559347 ?auto_559348 ) ( CLEAR ?auto_559345 ) ( ON ?auto_559346 ?auto_559347 ) ( CLEAR ?auto_559346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_559343 ?auto_559344 ?auto_559345 ?auto_559346 )
      ( MAKE-6PILE ?auto_559343 ?auto_559344 ?auto_559345 ?auto_559346 ?auto_559347 ?auto_559348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559369 - BLOCK
      ?auto_559370 - BLOCK
      ?auto_559371 - BLOCK
      ?auto_559372 - BLOCK
      ?auto_559373 - BLOCK
      ?auto_559374 - BLOCK
    )
    :vars
    (
      ?auto_559375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559374 ?auto_559375 ) ( ON-TABLE ?auto_559369 ) ( ON ?auto_559370 ?auto_559369 ) ( not ( = ?auto_559369 ?auto_559370 ) ) ( not ( = ?auto_559369 ?auto_559371 ) ) ( not ( = ?auto_559369 ?auto_559372 ) ) ( not ( = ?auto_559369 ?auto_559373 ) ) ( not ( = ?auto_559369 ?auto_559374 ) ) ( not ( = ?auto_559369 ?auto_559375 ) ) ( not ( = ?auto_559370 ?auto_559371 ) ) ( not ( = ?auto_559370 ?auto_559372 ) ) ( not ( = ?auto_559370 ?auto_559373 ) ) ( not ( = ?auto_559370 ?auto_559374 ) ) ( not ( = ?auto_559370 ?auto_559375 ) ) ( not ( = ?auto_559371 ?auto_559372 ) ) ( not ( = ?auto_559371 ?auto_559373 ) ) ( not ( = ?auto_559371 ?auto_559374 ) ) ( not ( = ?auto_559371 ?auto_559375 ) ) ( not ( = ?auto_559372 ?auto_559373 ) ) ( not ( = ?auto_559372 ?auto_559374 ) ) ( not ( = ?auto_559372 ?auto_559375 ) ) ( not ( = ?auto_559373 ?auto_559374 ) ) ( not ( = ?auto_559373 ?auto_559375 ) ) ( not ( = ?auto_559374 ?auto_559375 ) ) ( ON ?auto_559373 ?auto_559374 ) ( ON ?auto_559372 ?auto_559373 ) ( CLEAR ?auto_559370 ) ( ON ?auto_559371 ?auto_559372 ) ( CLEAR ?auto_559371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_559369 ?auto_559370 ?auto_559371 )
      ( MAKE-6PILE ?auto_559369 ?auto_559370 ?auto_559371 ?auto_559372 ?auto_559373 ?auto_559374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559395 - BLOCK
      ?auto_559396 - BLOCK
      ?auto_559397 - BLOCK
      ?auto_559398 - BLOCK
      ?auto_559399 - BLOCK
      ?auto_559400 - BLOCK
    )
    :vars
    (
      ?auto_559401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559400 ?auto_559401 ) ( ON-TABLE ?auto_559395 ) ( not ( = ?auto_559395 ?auto_559396 ) ) ( not ( = ?auto_559395 ?auto_559397 ) ) ( not ( = ?auto_559395 ?auto_559398 ) ) ( not ( = ?auto_559395 ?auto_559399 ) ) ( not ( = ?auto_559395 ?auto_559400 ) ) ( not ( = ?auto_559395 ?auto_559401 ) ) ( not ( = ?auto_559396 ?auto_559397 ) ) ( not ( = ?auto_559396 ?auto_559398 ) ) ( not ( = ?auto_559396 ?auto_559399 ) ) ( not ( = ?auto_559396 ?auto_559400 ) ) ( not ( = ?auto_559396 ?auto_559401 ) ) ( not ( = ?auto_559397 ?auto_559398 ) ) ( not ( = ?auto_559397 ?auto_559399 ) ) ( not ( = ?auto_559397 ?auto_559400 ) ) ( not ( = ?auto_559397 ?auto_559401 ) ) ( not ( = ?auto_559398 ?auto_559399 ) ) ( not ( = ?auto_559398 ?auto_559400 ) ) ( not ( = ?auto_559398 ?auto_559401 ) ) ( not ( = ?auto_559399 ?auto_559400 ) ) ( not ( = ?auto_559399 ?auto_559401 ) ) ( not ( = ?auto_559400 ?auto_559401 ) ) ( ON ?auto_559399 ?auto_559400 ) ( ON ?auto_559398 ?auto_559399 ) ( ON ?auto_559397 ?auto_559398 ) ( CLEAR ?auto_559395 ) ( ON ?auto_559396 ?auto_559397 ) ( CLEAR ?auto_559396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559395 ?auto_559396 )
      ( MAKE-6PILE ?auto_559395 ?auto_559396 ?auto_559397 ?auto_559398 ?auto_559399 ?auto_559400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_559421 - BLOCK
      ?auto_559422 - BLOCK
      ?auto_559423 - BLOCK
      ?auto_559424 - BLOCK
      ?auto_559425 - BLOCK
      ?auto_559426 - BLOCK
    )
    :vars
    (
      ?auto_559427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559426 ?auto_559427 ) ( not ( = ?auto_559421 ?auto_559422 ) ) ( not ( = ?auto_559421 ?auto_559423 ) ) ( not ( = ?auto_559421 ?auto_559424 ) ) ( not ( = ?auto_559421 ?auto_559425 ) ) ( not ( = ?auto_559421 ?auto_559426 ) ) ( not ( = ?auto_559421 ?auto_559427 ) ) ( not ( = ?auto_559422 ?auto_559423 ) ) ( not ( = ?auto_559422 ?auto_559424 ) ) ( not ( = ?auto_559422 ?auto_559425 ) ) ( not ( = ?auto_559422 ?auto_559426 ) ) ( not ( = ?auto_559422 ?auto_559427 ) ) ( not ( = ?auto_559423 ?auto_559424 ) ) ( not ( = ?auto_559423 ?auto_559425 ) ) ( not ( = ?auto_559423 ?auto_559426 ) ) ( not ( = ?auto_559423 ?auto_559427 ) ) ( not ( = ?auto_559424 ?auto_559425 ) ) ( not ( = ?auto_559424 ?auto_559426 ) ) ( not ( = ?auto_559424 ?auto_559427 ) ) ( not ( = ?auto_559425 ?auto_559426 ) ) ( not ( = ?auto_559425 ?auto_559427 ) ) ( not ( = ?auto_559426 ?auto_559427 ) ) ( ON ?auto_559425 ?auto_559426 ) ( ON ?auto_559424 ?auto_559425 ) ( ON ?auto_559423 ?auto_559424 ) ( ON ?auto_559422 ?auto_559423 ) ( ON ?auto_559421 ?auto_559422 ) ( CLEAR ?auto_559421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559421 )
      ( MAKE-6PILE ?auto_559421 ?auto_559422 ?auto_559423 ?auto_559424 ?auto_559425 ?auto_559426 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559448 - BLOCK
      ?auto_559449 - BLOCK
      ?auto_559450 - BLOCK
      ?auto_559451 - BLOCK
      ?auto_559452 - BLOCK
      ?auto_559453 - BLOCK
      ?auto_559454 - BLOCK
    )
    :vars
    (
      ?auto_559455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559453 ) ( ON ?auto_559454 ?auto_559455 ) ( CLEAR ?auto_559454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559448 ) ( ON ?auto_559449 ?auto_559448 ) ( ON ?auto_559450 ?auto_559449 ) ( ON ?auto_559451 ?auto_559450 ) ( ON ?auto_559452 ?auto_559451 ) ( ON ?auto_559453 ?auto_559452 ) ( not ( = ?auto_559448 ?auto_559449 ) ) ( not ( = ?auto_559448 ?auto_559450 ) ) ( not ( = ?auto_559448 ?auto_559451 ) ) ( not ( = ?auto_559448 ?auto_559452 ) ) ( not ( = ?auto_559448 ?auto_559453 ) ) ( not ( = ?auto_559448 ?auto_559454 ) ) ( not ( = ?auto_559448 ?auto_559455 ) ) ( not ( = ?auto_559449 ?auto_559450 ) ) ( not ( = ?auto_559449 ?auto_559451 ) ) ( not ( = ?auto_559449 ?auto_559452 ) ) ( not ( = ?auto_559449 ?auto_559453 ) ) ( not ( = ?auto_559449 ?auto_559454 ) ) ( not ( = ?auto_559449 ?auto_559455 ) ) ( not ( = ?auto_559450 ?auto_559451 ) ) ( not ( = ?auto_559450 ?auto_559452 ) ) ( not ( = ?auto_559450 ?auto_559453 ) ) ( not ( = ?auto_559450 ?auto_559454 ) ) ( not ( = ?auto_559450 ?auto_559455 ) ) ( not ( = ?auto_559451 ?auto_559452 ) ) ( not ( = ?auto_559451 ?auto_559453 ) ) ( not ( = ?auto_559451 ?auto_559454 ) ) ( not ( = ?auto_559451 ?auto_559455 ) ) ( not ( = ?auto_559452 ?auto_559453 ) ) ( not ( = ?auto_559452 ?auto_559454 ) ) ( not ( = ?auto_559452 ?auto_559455 ) ) ( not ( = ?auto_559453 ?auto_559454 ) ) ( not ( = ?auto_559453 ?auto_559455 ) ) ( not ( = ?auto_559454 ?auto_559455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559454 ?auto_559455 )
      ( !STACK ?auto_559454 ?auto_559453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559478 - BLOCK
      ?auto_559479 - BLOCK
      ?auto_559480 - BLOCK
      ?auto_559481 - BLOCK
      ?auto_559482 - BLOCK
      ?auto_559483 - BLOCK
      ?auto_559484 - BLOCK
    )
    :vars
    (
      ?auto_559485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559484 ?auto_559485 ) ( ON-TABLE ?auto_559478 ) ( ON ?auto_559479 ?auto_559478 ) ( ON ?auto_559480 ?auto_559479 ) ( ON ?auto_559481 ?auto_559480 ) ( ON ?auto_559482 ?auto_559481 ) ( not ( = ?auto_559478 ?auto_559479 ) ) ( not ( = ?auto_559478 ?auto_559480 ) ) ( not ( = ?auto_559478 ?auto_559481 ) ) ( not ( = ?auto_559478 ?auto_559482 ) ) ( not ( = ?auto_559478 ?auto_559483 ) ) ( not ( = ?auto_559478 ?auto_559484 ) ) ( not ( = ?auto_559478 ?auto_559485 ) ) ( not ( = ?auto_559479 ?auto_559480 ) ) ( not ( = ?auto_559479 ?auto_559481 ) ) ( not ( = ?auto_559479 ?auto_559482 ) ) ( not ( = ?auto_559479 ?auto_559483 ) ) ( not ( = ?auto_559479 ?auto_559484 ) ) ( not ( = ?auto_559479 ?auto_559485 ) ) ( not ( = ?auto_559480 ?auto_559481 ) ) ( not ( = ?auto_559480 ?auto_559482 ) ) ( not ( = ?auto_559480 ?auto_559483 ) ) ( not ( = ?auto_559480 ?auto_559484 ) ) ( not ( = ?auto_559480 ?auto_559485 ) ) ( not ( = ?auto_559481 ?auto_559482 ) ) ( not ( = ?auto_559481 ?auto_559483 ) ) ( not ( = ?auto_559481 ?auto_559484 ) ) ( not ( = ?auto_559481 ?auto_559485 ) ) ( not ( = ?auto_559482 ?auto_559483 ) ) ( not ( = ?auto_559482 ?auto_559484 ) ) ( not ( = ?auto_559482 ?auto_559485 ) ) ( not ( = ?auto_559483 ?auto_559484 ) ) ( not ( = ?auto_559483 ?auto_559485 ) ) ( not ( = ?auto_559484 ?auto_559485 ) ) ( CLEAR ?auto_559482 ) ( ON ?auto_559483 ?auto_559484 ) ( CLEAR ?auto_559483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_559478 ?auto_559479 ?auto_559480 ?auto_559481 ?auto_559482 ?auto_559483 )
      ( MAKE-7PILE ?auto_559478 ?auto_559479 ?auto_559480 ?auto_559481 ?auto_559482 ?auto_559483 ?auto_559484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559508 - BLOCK
      ?auto_559509 - BLOCK
      ?auto_559510 - BLOCK
      ?auto_559511 - BLOCK
      ?auto_559512 - BLOCK
      ?auto_559513 - BLOCK
      ?auto_559514 - BLOCK
    )
    :vars
    (
      ?auto_559515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559514 ?auto_559515 ) ( ON-TABLE ?auto_559508 ) ( ON ?auto_559509 ?auto_559508 ) ( ON ?auto_559510 ?auto_559509 ) ( ON ?auto_559511 ?auto_559510 ) ( not ( = ?auto_559508 ?auto_559509 ) ) ( not ( = ?auto_559508 ?auto_559510 ) ) ( not ( = ?auto_559508 ?auto_559511 ) ) ( not ( = ?auto_559508 ?auto_559512 ) ) ( not ( = ?auto_559508 ?auto_559513 ) ) ( not ( = ?auto_559508 ?auto_559514 ) ) ( not ( = ?auto_559508 ?auto_559515 ) ) ( not ( = ?auto_559509 ?auto_559510 ) ) ( not ( = ?auto_559509 ?auto_559511 ) ) ( not ( = ?auto_559509 ?auto_559512 ) ) ( not ( = ?auto_559509 ?auto_559513 ) ) ( not ( = ?auto_559509 ?auto_559514 ) ) ( not ( = ?auto_559509 ?auto_559515 ) ) ( not ( = ?auto_559510 ?auto_559511 ) ) ( not ( = ?auto_559510 ?auto_559512 ) ) ( not ( = ?auto_559510 ?auto_559513 ) ) ( not ( = ?auto_559510 ?auto_559514 ) ) ( not ( = ?auto_559510 ?auto_559515 ) ) ( not ( = ?auto_559511 ?auto_559512 ) ) ( not ( = ?auto_559511 ?auto_559513 ) ) ( not ( = ?auto_559511 ?auto_559514 ) ) ( not ( = ?auto_559511 ?auto_559515 ) ) ( not ( = ?auto_559512 ?auto_559513 ) ) ( not ( = ?auto_559512 ?auto_559514 ) ) ( not ( = ?auto_559512 ?auto_559515 ) ) ( not ( = ?auto_559513 ?auto_559514 ) ) ( not ( = ?auto_559513 ?auto_559515 ) ) ( not ( = ?auto_559514 ?auto_559515 ) ) ( ON ?auto_559513 ?auto_559514 ) ( CLEAR ?auto_559511 ) ( ON ?auto_559512 ?auto_559513 ) ( CLEAR ?auto_559512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_559508 ?auto_559509 ?auto_559510 ?auto_559511 ?auto_559512 )
      ( MAKE-7PILE ?auto_559508 ?auto_559509 ?auto_559510 ?auto_559511 ?auto_559512 ?auto_559513 ?auto_559514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559538 - BLOCK
      ?auto_559539 - BLOCK
      ?auto_559540 - BLOCK
      ?auto_559541 - BLOCK
      ?auto_559542 - BLOCK
      ?auto_559543 - BLOCK
      ?auto_559544 - BLOCK
    )
    :vars
    (
      ?auto_559545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559544 ?auto_559545 ) ( ON-TABLE ?auto_559538 ) ( ON ?auto_559539 ?auto_559538 ) ( ON ?auto_559540 ?auto_559539 ) ( not ( = ?auto_559538 ?auto_559539 ) ) ( not ( = ?auto_559538 ?auto_559540 ) ) ( not ( = ?auto_559538 ?auto_559541 ) ) ( not ( = ?auto_559538 ?auto_559542 ) ) ( not ( = ?auto_559538 ?auto_559543 ) ) ( not ( = ?auto_559538 ?auto_559544 ) ) ( not ( = ?auto_559538 ?auto_559545 ) ) ( not ( = ?auto_559539 ?auto_559540 ) ) ( not ( = ?auto_559539 ?auto_559541 ) ) ( not ( = ?auto_559539 ?auto_559542 ) ) ( not ( = ?auto_559539 ?auto_559543 ) ) ( not ( = ?auto_559539 ?auto_559544 ) ) ( not ( = ?auto_559539 ?auto_559545 ) ) ( not ( = ?auto_559540 ?auto_559541 ) ) ( not ( = ?auto_559540 ?auto_559542 ) ) ( not ( = ?auto_559540 ?auto_559543 ) ) ( not ( = ?auto_559540 ?auto_559544 ) ) ( not ( = ?auto_559540 ?auto_559545 ) ) ( not ( = ?auto_559541 ?auto_559542 ) ) ( not ( = ?auto_559541 ?auto_559543 ) ) ( not ( = ?auto_559541 ?auto_559544 ) ) ( not ( = ?auto_559541 ?auto_559545 ) ) ( not ( = ?auto_559542 ?auto_559543 ) ) ( not ( = ?auto_559542 ?auto_559544 ) ) ( not ( = ?auto_559542 ?auto_559545 ) ) ( not ( = ?auto_559543 ?auto_559544 ) ) ( not ( = ?auto_559543 ?auto_559545 ) ) ( not ( = ?auto_559544 ?auto_559545 ) ) ( ON ?auto_559543 ?auto_559544 ) ( ON ?auto_559542 ?auto_559543 ) ( CLEAR ?auto_559540 ) ( ON ?auto_559541 ?auto_559542 ) ( CLEAR ?auto_559541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_559538 ?auto_559539 ?auto_559540 ?auto_559541 )
      ( MAKE-7PILE ?auto_559538 ?auto_559539 ?auto_559540 ?auto_559541 ?auto_559542 ?auto_559543 ?auto_559544 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559568 - BLOCK
      ?auto_559569 - BLOCK
      ?auto_559570 - BLOCK
      ?auto_559571 - BLOCK
      ?auto_559572 - BLOCK
      ?auto_559573 - BLOCK
      ?auto_559574 - BLOCK
    )
    :vars
    (
      ?auto_559575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559574 ?auto_559575 ) ( ON-TABLE ?auto_559568 ) ( ON ?auto_559569 ?auto_559568 ) ( not ( = ?auto_559568 ?auto_559569 ) ) ( not ( = ?auto_559568 ?auto_559570 ) ) ( not ( = ?auto_559568 ?auto_559571 ) ) ( not ( = ?auto_559568 ?auto_559572 ) ) ( not ( = ?auto_559568 ?auto_559573 ) ) ( not ( = ?auto_559568 ?auto_559574 ) ) ( not ( = ?auto_559568 ?auto_559575 ) ) ( not ( = ?auto_559569 ?auto_559570 ) ) ( not ( = ?auto_559569 ?auto_559571 ) ) ( not ( = ?auto_559569 ?auto_559572 ) ) ( not ( = ?auto_559569 ?auto_559573 ) ) ( not ( = ?auto_559569 ?auto_559574 ) ) ( not ( = ?auto_559569 ?auto_559575 ) ) ( not ( = ?auto_559570 ?auto_559571 ) ) ( not ( = ?auto_559570 ?auto_559572 ) ) ( not ( = ?auto_559570 ?auto_559573 ) ) ( not ( = ?auto_559570 ?auto_559574 ) ) ( not ( = ?auto_559570 ?auto_559575 ) ) ( not ( = ?auto_559571 ?auto_559572 ) ) ( not ( = ?auto_559571 ?auto_559573 ) ) ( not ( = ?auto_559571 ?auto_559574 ) ) ( not ( = ?auto_559571 ?auto_559575 ) ) ( not ( = ?auto_559572 ?auto_559573 ) ) ( not ( = ?auto_559572 ?auto_559574 ) ) ( not ( = ?auto_559572 ?auto_559575 ) ) ( not ( = ?auto_559573 ?auto_559574 ) ) ( not ( = ?auto_559573 ?auto_559575 ) ) ( not ( = ?auto_559574 ?auto_559575 ) ) ( ON ?auto_559573 ?auto_559574 ) ( ON ?auto_559572 ?auto_559573 ) ( ON ?auto_559571 ?auto_559572 ) ( CLEAR ?auto_559569 ) ( ON ?auto_559570 ?auto_559571 ) ( CLEAR ?auto_559570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_559568 ?auto_559569 ?auto_559570 )
      ( MAKE-7PILE ?auto_559568 ?auto_559569 ?auto_559570 ?auto_559571 ?auto_559572 ?auto_559573 ?auto_559574 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559598 - BLOCK
      ?auto_559599 - BLOCK
      ?auto_559600 - BLOCK
      ?auto_559601 - BLOCK
      ?auto_559602 - BLOCK
      ?auto_559603 - BLOCK
      ?auto_559604 - BLOCK
    )
    :vars
    (
      ?auto_559605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559604 ?auto_559605 ) ( ON-TABLE ?auto_559598 ) ( not ( = ?auto_559598 ?auto_559599 ) ) ( not ( = ?auto_559598 ?auto_559600 ) ) ( not ( = ?auto_559598 ?auto_559601 ) ) ( not ( = ?auto_559598 ?auto_559602 ) ) ( not ( = ?auto_559598 ?auto_559603 ) ) ( not ( = ?auto_559598 ?auto_559604 ) ) ( not ( = ?auto_559598 ?auto_559605 ) ) ( not ( = ?auto_559599 ?auto_559600 ) ) ( not ( = ?auto_559599 ?auto_559601 ) ) ( not ( = ?auto_559599 ?auto_559602 ) ) ( not ( = ?auto_559599 ?auto_559603 ) ) ( not ( = ?auto_559599 ?auto_559604 ) ) ( not ( = ?auto_559599 ?auto_559605 ) ) ( not ( = ?auto_559600 ?auto_559601 ) ) ( not ( = ?auto_559600 ?auto_559602 ) ) ( not ( = ?auto_559600 ?auto_559603 ) ) ( not ( = ?auto_559600 ?auto_559604 ) ) ( not ( = ?auto_559600 ?auto_559605 ) ) ( not ( = ?auto_559601 ?auto_559602 ) ) ( not ( = ?auto_559601 ?auto_559603 ) ) ( not ( = ?auto_559601 ?auto_559604 ) ) ( not ( = ?auto_559601 ?auto_559605 ) ) ( not ( = ?auto_559602 ?auto_559603 ) ) ( not ( = ?auto_559602 ?auto_559604 ) ) ( not ( = ?auto_559602 ?auto_559605 ) ) ( not ( = ?auto_559603 ?auto_559604 ) ) ( not ( = ?auto_559603 ?auto_559605 ) ) ( not ( = ?auto_559604 ?auto_559605 ) ) ( ON ?auto_559603 ?auto_559604 ) ( ON ?auto_559602 ?auto_559603 ) ( ON ?auto_559601 ?auto_559602 ) ( ON ?auto_559600 ?auto_559601 ) ( CLEAR ?auto_559598 ) ( ON ?auto_559599 ?auto_559600 ) ( CLEAR ?auto_559599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559598 ?auto_559599 )
      ( MAKE-7PILE ?auto_559598 ?auto_559599 ?auto_559600 ?auto_559601 ?auto_559602 ?auto_559603 ?auto_559604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_559628 - BLOCK
      ?auto_559629 - BLOCK
      ?auto_559630 - BLOCK
      ?auto_559631 - BLOCK
      ?auto_559632 - BLOCK
      ?auto_559633 - BLOCK
      ?auto_559634 - BLOCK
    )
    :vars
    (
      ?auto_559635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559634 ?auto_559635 ) ( not ( = ?auto_559628 ?auto_559629 ) ) ( not ( = ?auto_559628 ?auto_559630 ) ) ( not ( = ?auto_559628 ?auto_559631 ) ) ( not ( = ?auto_559628 ?auto_559632 ) ) ( not ( = ?auto_559628 ?auto_559633 ) ) ( not ( = ?auto_559628 ?auto_559634 ) ) ( not ( = ?auto_559628 ?auto_559635 ) ) ( not ( = ?auto_559629 ?auto_559630 ) ) ( not ( = ?auto_559629 ?auto_559631 ) ) ( not ( = ?auto_559629 ?auto_559632 ) ) ( not ( = ?auto_559629 ?auto_559633 ) ) ( not ( = ?auto_559629 ?auto_559634 ) ) ( not ( = ?auto_559629 ?auto_559635 ) ) ( not ( = ?auto_559630 ?auto_559631 ) ) ( not ( = ?auto_559630 ?auto_559632 ) ) ( not ( = ?auto_559630 ?auto_559633 ) ) ( not ( = ?auto_559630 ?auto_559634 ) ) ( not ( = ?auto_559630 ?auto_559635 ) ) ( not ( = ?auto_559631 ?auto_559632 ) ) ( not ( = ?auto_559631 ?auto_559633 ) ) ( not ( = ?auto_559631 ?auto_559634 ) ) ( not ( = ?auto_559631 ?auto_559635 ) ) ( not ( = ?auto_559632 ?auto_559633 ) ) ( not ( = ?auto_559632 ?auto_559634 ) ) ( not ( = ?auto_559632 ?auto_559635 ) ) ( not ( = ?auto_559633 ?auto_559634 ) ) ( not ( = ?auto_559633 ?auto_559635 ) ) ( not ( = ?auto_559634 ?auto_559635 ) ) ( ON ?auto_559633 ?auto_559634 ) ( ON ?auto_559632 ?auto_559633 ) ( ON ?auto_559631 ?auto_559632 ) ( ON ?auto_559630 ?auto_559631 ) ( ON ?auto_559629 ?auto_559630 ) ( ON ?auto_559628 ?auto_559629 ) ( CLEAR ?auto_559628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559628 )
      ( MAKE-7PILE ?auto_559628 ?auto_559629 ?auto_559630 ?auto_559631 ?auto_559632 ?auto_559633 ?auto_559634 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559659 - BLOCK
      ?auto_559660 - BLOCK
      ?auto_559661 - BLOCK
      ?auto_559662 - BLOCK
      ?auto_559663 - BLOCK
      ?auto_559664 - BLOCK
      ?auto_559665 - BLOCK
      ?auto_559666 - BLOCK
    )
    :vars
    (
      ?auto_559667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559665 ) ( ON ?auto_559666 ?auto_559667 ) ( CLEAR ?auto_559666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559659 ) ( ON ?auto_559660 ?auto_559659 ) ( ON ?auto_559661 ?auto_559660 ) ( ON ?auto_559662 ?auto_559661 ) ( ON ?auto_559663 ?auto_559662 ) ( ON ?auto_559664 ?auto_559663 ) ( ON ?auto_559665 ?auto_559664 ) ( not ( = ?auto_559659 ?auto_559660 ) ) ( not ( = ?auto_559659 ?auto_559661 ) ) ( not ( = ?auto_559659 ?auto_559662 ) ) ( not ( = ?auto_559659 ?auto_559663 ) ) ( not ( = ?auto_559659 ?auto_559664 ) ) ( not ( = ?auto_559659 ?auto_559665 ) ) ( not ( = ?auto_559659 ?auto_559666 ) ) ( not ( = ?auto_559659 ?auto_559667 ) ) ( not ( = ?auto_559660 ?auto_559661 ) ) ( not ( = ?auto_559660 ?auto_559662 ) ) ( not ( = ?auto_559660 ?auto_559663 ) ) ( not ( = ?auto_559660 ?auto_559664 ) ) ( not ( = ?auto_559660 ?auto_559665 ) ) ( not ( = ?auto_559660 ?auto_559666 ) ) ( not ( = ?auto_559660 ?auto_559667 ) ) ( not ( = ?auto_559661 ?auto_559662 ) ) ( not ( = ?auto_559661 ?auto_559663 ) ) ( not ( = ?auto_559661 ?auto_559664 ) ) ( not ( = ?auto_559661 ?auto_559665 ) ) ( not ( = ?auto_559661 ?auto_559666 ) ) ( not ( = ?auto_559661 ?auto_559667 ) ) ( not ( = ?auto_559662 ?auto_559663 ) ) ( not ( = ?auto_559662 ?auto_559664 ) ) ( not ( = ?auto_559662 ?auto_559665 ) ) ( not ( = ?auto_559662 ?auto_559666 ) ) ( not ( = ?auto_559662 ?auto_559667 ) ) ( not ( = ?auto_559663 ?auto_559664 ) ) ( not ( = ?auto_559663 ?auto_559665 ) ) ( not ( = ?auto_559663 ?auto_559666 ) ) ( not ( = ?auto_559663 ?auto_559667 ) ) ( not ( = ?auto_559664 ?auto_559665 ) ) ( not ( = ?auto_559664 ?auto_559666 ) ) ( not ( = ?auto_559664 ?auto_559667 ) ) ( not ( = ?auto_559665 ?auto_559666 ) ) ( not ( = ?auto_559665 ?auto_559667 ) ) ( not ( = ?auto_559666 ?auto_559667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559666 ?auto_559667 )
      ( !STACK ?auto_559666 ?auto_559665 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559693 - BLOCK
      ?auto_559694 - BLOCK
      ?auto_559695 - BLOCK
      ?auto_559696 - BLOCK
      ?auto_559697 - BLOCK
      ?auto_559698 - BLOCK
      ?auto_559699 - BLOCK
      ?auto_559700 - BLOCK
    )
    :vars
    (
      ?auto_559701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559700 ?auto_559701 ) ( ON-TABLE ?auto_559693 ) ( ON ?auto_559694 ?auto_559693 ) ( ON ?auto_559695 ?auto_559694 ) ( ON ?auto_559696 ?auto_559695 ) ( ON ?auto_559697 ?auto_559696 ) ( ON ?auto_559698 ?auto_559697 ) ( not ( = ?auto_559693 ?auto_559694 ) ) ( not ( = ?auto_559693 ?auto_559695 ) ) ( not ( = ?auto_559693 ?auto_559696 ) ) ( not ( = ?auto_559693 ?auto_559697 ) ) ( not ( = ?auto_559693 ?auto_559698 ) ) ( not ( = ?auto_559693 ?auto_559699 ) ) ( not ( = ?auto_559693 ?auto_559700 ) ) ( not ( = ?auto_559693 ?auto_559701 ) ) ( not ( = ?auto_559694 ?auto_559695 ) ) ( not ( = ?auto_559694 ?auto_559696 ) ) ( not ( = ?auto_559694 ?auto_559697 ) ) ( not ( = ?auto_559694 ?auto_559698 ) ) ( not ( = ?auto_559694 ?auto_559699 ) ) ( not ( = ?auto_559694 ?auto_559700 ) ) ( not ( = ?auto_559694 ?auto_559701 ) ) ( not ( = ?auto_559695 ?auto_559696 ) ) ( not ( = ?auto_559695 ?auto_559697 ) ) ( not ( = ?auto_559695 ?auto_559698 ) ) ( not ( = ?auto_559695 ?auto_559699 ) ) ( not ( = ?auto_559695 ?auto_559700 ) ) ( not ( = ?auto_559695 ?auto_559701 ) ) ( not ( = ?auto_559696 ?auto_559697 ) ) ( not ( = ?auto_559696 ?auto_559698 ) ) ( not ( = ?auto_559696 ?auto_559699 ) ) ( not ( = ?auto_559696 ?auto_559700 ) ) ( not ( = ?auto_559696 ?auto_559701 ) ) ( not ( = ?auto_559697 ?auto_559698 ) ) ( not ( = ?auto_559697 ?auto_559699 ) ) ( not ( = ?auto_559697 ?auto_559700 ) ) ( not ( = ?auto_559697 ?auto_559701 ) ) ( not ( = ?auto_559698 ?auto_559699 ) ) ( not ( = ?auto_559698 ?auto_559700 ) ) ( not ( = ?auto_559698 ?auto_559701 ) ) ( not ( = ?auto_559699 ?auto_559700 ) ) ( not ( = ?auto_559699 ?auto_559701 ) ) ( not ( = ?auto_559700 ?auto_559701 ) ) ( CLEAR ?auto_559698 ) ( ON ?auto_559699 ?auto_559700 ) ( CLEAR ?auto_559699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_559693 ?auto_559694 ?auto_559695 ?auto_559696 ?auto_559697 ?auto_559698 ?auto_559699 )
      ( MAKE-8PILE ?auto_559693 ?auto_559694 ?auto_559695 ?auto_559696 ?auto_559697 ?auto_559698 ?auto_559699 ?auto_559700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559727 - BLOCK
      ?auto_559728 - BLOCK
      ?auto_559729 - BLOCK
      ?auto_559730 - BLOCK
      ?auto_559731 - BLOCK
      ?auto_559732 - BLOCK
      ?auto_559733 - BLOCK
      ?auto_559734 - BLOCK
    )
    :vars
    (
      ?auto_559735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559734 ?auto_559735 ) ( ON-TABLE ?auto_559727 ) ( ON ?auto_559728 ?auto_559727 ) ( ON ?auto_559729 ?auto_559728 ) ( ON ?auto_559730 ?auto_559729 ) ( ON ?auto_559731 ?auto_559730 ) ( not ( = ?auto_559727 ?auto_559728 ) ) ( not ( = ?auto_559727 ?auto_559729 ) ) ( not ( = ?auto_559727 ?auto_559730 ) ) ( not ( = ?auto_559727 ?auto_559731 ) ) ( not ( = ?auto_559727 ?auto_559732 ) ) ( not ( = ?auto_559727 ?auto_559733 ) ) ( not ( = ?auto_559727 ?auto_559734 ) ) ( not ( = ?auto_559727 ?auto_559735 ) ) ( not ( = ?auto_559728 ?auto_559729 ) ) ( not ( = ?auto_559728 ?auto_559730 ) ) ( not ( = ?auto_559728 ?auto_559731 ) ) ( not ( = ?auto_559728 ?auto_559732 ) ) ( not ( = ?auto_559728 ?auto_559733 ) ) ( not ( = ?auto_559728 ?auto_559734 ) ) ( not ( = ?auto_559728 ?auto_559735 ) ) ( not ( = ?auto_559729 ?auto_559730 ) ) ( not ( = ?auto_559729 ?auto_559731 ) ) ( not ( = ?auto_559729 ?auto_559732 ) ) ( not ( = ?auto_559729 ?auto_559733 ) ) ( not ( = ?auto_559729 ?auto_559734 ) ) ( not ( = ?auto_559729 ?auto_559735 ) ) ( not ( = ?auto_559730 ?auto_559731 ) ) ( not ( = ?auto_559730 ?auto_559732 ) ) ( not ( = ?auto_559730 ?auto_559733 ) ) ( not ( = ?auto_559730 ?auto_559734 ) ) ( not ( = ?auto_559730 ?auto_559735 ) ) ( not ( = ?auto_559731 ?auto_559732 ) ) ( not ( = ?auto_559731 ?auto_559733 ) ) ( not ( = ?auto_559731 ?auto_559734 ) ) ( not ( = ?auto_559731 ?auto_559735 ) ) ( not ( = ?auto_559732 ?auto_559733 ) ) ( not ( = ?auto_559732 ?auto_559734 ) ) ( not ( = ?auto_559732 ?auto_559735 ) ) ( not ( = ?auto_559733 ?auto_559734 ) ) ( not ( = ?auto_559733 ?auto_559735 ) ) ( not ( = ?auto_559734 ?auto_559735 ) ) ( ON ?auto_559733 ?auto_559734 ) ( CLEAR ?auto_559731 ) ( ON ?auto_559732 ?auto_559733 ) ( CLEAR ?auto_559732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_559727 ?auto_559728 ?auto_559729 ?auto_559730 ?auto_559731 ?auto_559732 )
      ( MAKE-8PILE ?auto_559727 ?auto_559728 ?auto_559729 ?auto_559730 ?auto_559731 ?auto_559732 ?auto_559733 ?auto_559734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559761 - BLOCK
      ?auto_559762 - BLOCK
      ?auto_559763 - BLOCK
      ?auto_559764 - BLOCK
      ?auto_559765 - BLOCK
      ?auto_559766 - BLOCK
      ?auto_559767 - BLOCK
      ?auto_559768 - BLOCK
    )
    :vars
    (
      ?auto_559769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559768 ?auto_559769 ) ( ON-TABLE ?auto_559761 ) ( ON ?auto_559762 ?auto_559761 ) ( ON ?auto_559763 ?auto_559762 ) ( ON ?auto_559764 ?auto_559763 ) ( not ( = ?auto_559761 ?auto_559762 ) ) ( not ( = ?auto_559761 ?auto_559763 ) ) ( not ( = ?auto_559761 ?auto_559764 ) ) ( not ( = ?auto_559761 ?auto_559765 ) ) ( not ( = ?auto_559761 ?auto_559766 ) ) ( not ( = ?auto_559761 ?auto_559767 ) ) ( not ( = ?auto_559761 ?auto_559768 ) ) ( not ( = ?auto_559761 ?auto_559769 ) ) ( not ( = ?auto_559762 ?auto_559763 ) ) ( not ( = ?auto_559762 ?auto_559764 ) ) ( not ( = ?auto_559762 ?auto_559765 ) ) ( not ( = ?auto_559762 ?auto_559766 ) ) ( not ( = ?auto_559762 ?auto_559767 ) ) ( not ( = ?auto_559762 ?auto_559768 ) ) ( not ( = ?auto_559762 ?auto_559769 ) ) ( not ( = ?auto_559763 ?auto_559764 ) ) ( not ( = ?auto_559763 ?auto_559765 ) ) ( not ( = ?auto_559763 ?auto_559766 ) ) ( not ( = ?auto_559763 ?auto_559767 ) ) ( not ( = ?auto_559763 ?auto_559768 ) ) ( not ( = ?auto_559763 ?auto_559769 ) ) ( not ( = ?auto_559764 ?auto_559765 ) ) ( not ( = ?auto_559764 ?auto_559766 ) ) ( not ( = ?auto_559764 ?auto_559767 ) ) ( not ( = ?auto_559764 ?auto_559768 ) ) ( not ( = ?auto_559764 ?auto_559769 ) ) ( not ( = ?auto_559765 ?auto_559766 ) ) ( not ( = ?auto_559765 ?auto_559767 ) ) ( not ( = ?auto_559765 ?auto_559768 ) ) ( not ( = ?auto_559765 ?auto_559769 ) ) ( not ( = ?auto_559766 ?auto_559767 ) ) ( not ( = ?auto_559766 ?auto_559768 ) ) ( not ( = ?auto_559766 ?auto_559769 ) ) ( not ( = ?auto_559767 ?auto_559768 ) ) ( not ( = ?auto_559767 ?auto_559769 ) ) ( not ( = ?auto_559768 ?auto_559769 ) ) ( ON ?auto_559767 ?auto_559768 ) ( ON ?auto_559766 ?auto_559767 ) ( CLEAR ?auto_559764 ) ( ON ?auto_559765 ?auto_559766 ) ( CLEAR ?auto_559765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_559761 ?auto_559762 ?auto_559763 ?auto_559764 ?auto_559765 )
      ( MAKE-8PILE ?auto_559761 ?auto_559762 ?auto_559763 ?auto_559764 ?auto_559765 ?auto_559766 ?auto_559767 ?auto_559768 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559795 - BLOCK
      ?auto_559796 - BLOCK
      ?auto_559797 - BLOCK
      ?auto_559798 - BLOCK
      ?auto_559799 - BLOCK
      ?auto_559800 - BLOCK
      ?auto_559801 - BLOCK
      ?auto_559802 - BLOCK
    )
    :vars
    (
      ?auto_559803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559802 ?auto_559803 ) ( ON-TABLE ?auto_559795 ) ( ON ?auto_559796 ?auto_559795 ) ( ON ?auto_559797 ?auto_559796 ) ( not ( = ?auto_559795 ?auto_559796 ) ) ( not ( = ?auto_559795 ?auto_559797 ) ) ( not ( = ?auto_559795 ?auto_559798 ) ) ( not ( = ?auto_559795 ?auto_559799 ) ) ( not ( = ?auto_559795 ?auto_559800 ) ) ( not ( = ?auto_559795 ?auto_559801 ) ) ( not ( = ?auto_559795 ?auto_559802 ) ) ( not ( = ?auto_559795 ?auto_559803 ) ) ( not ( = ?auto_559796 ?auto_559797 ) ) ( not ( = ?auto_559796 ?auto_559798 ) ) ( not ( = ?auto_559796 ?auto_559799 ) ) ( not ( = ?auto_559796 ?auto_559800 ) ) ( not ( = ?auto_559796 ?auto_559801 ) ) ( not ( = ?auto_559796 ?auto_559802 ) ) ( not ( = ?auto_559796 ?auto_559803 ) ) ( not ( = ?auto_559797 ?auto_559798 ) ) ( not ( = ?auto_559797 ?auto_559799 ) ) ( not ( = ?auto_559797 ?auto_559800 ) ) ( not ( = ?auto_559797 ?auto_559801 ) ) ( not ( = ?auto_559797 ?auto_559802 ) ) ( not ( = ?auto_559797 ?auto_559803 ) ) ( not ( = ?auto_559798 ?auto_559799 ) ) ( not ( = ?auto_559798 ?auto_559800 ) ) ( not ( = ?auto_559798 ?auto_559801 ) ) ( not ( = ?auto_559798 ?auto_559802 ) ) ( not ( = ?auto_559798 ?auto_559803 ) ) ( not ( = ?auto_559799 ?auto_559800 ) ) ( not ( = ?auto_559799 ?auto_559801 ) ) ( not ( = ?auto_559799 ?auto_559802 ) ) ( not ( = ?auto_559799 ?auto_559803 ) ) ( not ( = ?auto_559800 ?auto_559801 ) ) ( not ( = ?auto_559800 ?auto_559802 ) ) ( not ( = ?auto_559800 ?auto_559803 ) ) ( not ( = ?auto_559801 ?auto_559802 ) ) ( not ( = ?auto_559801 ?auto_559803 ) ) ( not ( = ?auto_559802 ?auto_559803 ) ) ( ON ?auto_559801 ?auto_559802 ) ( ON ?auto_559800 ?auto_559801 ) ( ON ?auto_559799 ?auto_559800 ) ( CLEAR ?auto_559797 ) ( ON ?auto_559798 ?auto_559799 ) ( CLEAR ?auto_559798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_559795 ?auto_559796 ?auto_559797 ?auto_559798 )
      ( MAKE-8PILE ?auto_559795 ?auto_559796 ?auto_559797 ?auto_559798 ?auto_559799 ?auto_559800 ?auto_559801 ?auto_559802 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559829 - BLOCK
      ?auto_559830 - BLOCK
      ?auto_559831 - BLOCK
      ?auto_559832 - BLOCK
      ?auto_559833 - BLOCK
      ?auto_559834 - BLOCK
      ?auto_559835 - BLOCK
      ?auto_559836 - BLOCK
    )
    :vars
    (
      ?auto_559837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559836 ?auto_559837 ) ( ON-TABLE ?auto_559829 ) ( ON ?auto_559830 ?auto_559829 ) ( not ( = ?auto_559829 ?auto_559830 ) ) ( not ( = ?auto_559829 ?auto_559831 ) ) ( not ( = ?auto_559829 ?auto_559832 ) ) ( not ( = ?auto_559829 ?auto_559833 ) ) ( not ( = ?auto_559829 ?auto_559834 ) ) ( not ( = ?auto_559829 ?auto_559835 ) ) ( not ( = ?auto_559829 ?auto_559836 ) ) ( not ( = ?auto_559829 ?auto_559837 ) ) ( not ( = ?auto_559830 ?auto_559831 ) ) ( not ( = ?auto_559830 ?auto_559832 ) ) ( not ( = ?auto_559830 ?auto_559833 ) ) ( not ( = ?auto_559830 ?auto_559834 ) ) ( not ( = ?auto_559830 ?auto_559835 ) ) ( not ( = ?auto_559830 ?auto_559836 ) ) ( not ( = ?auto_559830 ?auto_559837 ) ) ( not ( = ?auto_559831 ?auto_559832 ) ) ( not ( = ?auto_559831 ?auto_559833 ) ) ( not ( = ?auto_559831 ?auto_559834 ) ) ( not ( = ?auto_559831 ?auto_559835 ) ) ( not ( = ?auto_559831 ?auto_559836 ) ) ( not ( = ?auto_559831 ?auto_559837 ) ) ( not ( = ?auto_559832 ?auto_559833 ) ) ( not ( = ?auto_559832 ?auto_559834 ) ) ( not ( = ?auto_559832 ?auto_559835 ) ) ( not ( = ?auto_559832 ?auto_559836 ) ) ( not ( = ?auto_559832 ?auto_559837 ) ) ( not ( = ?auto_559833 ?auto_559834 ) ) ( not ( = ?auto_559833 ?auto_559835 ) ) ( not ( = ?auto_559833 ?auto_559836 ) ) ( not ( = ?auto_559833 ?auto_559837 ) ) ( not ( = ?auto_559834 ?auto_559835 ) ) ( not ( = ?auto_559834 ?auto_559836 ) ) ( not ( = ?auto_559834 ?auto_559837 ) ) ( not ( = ?auto_559835 ?auto_559836 ) ) ( not ( = ?auto_559835 ?auto_559837 ) ) ( not ( = ?auto_559836 ?auto_559837 ) ) ( ON ?auto_559835 ?auto_559836 ) ( ON ?auto_559834 ?auto_559835 ) ( ON ?auto_559833 ?auto_559834 ) ( ON ?auto_559832 ?auto_559833 ) ( CLEAR ?auto_559830 ) ( ON ?auto_559831 ?auto_559832 ) ( CLEAR ?auto_559831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_559829 ?auto_559830 ?auto_559831 )
      ( MAKE-8PILE ?auto_559829 ?auto_559830 ?auto_559831 ?auto_559832 ?auto_559833 ?auto_559834 ?auto_559835 ?auto_559836 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559863 - BLOCK
      ?auto_559864 - BLOCK
      ?auto_559865 - BLOCK
      ?auto_559866 - BLOCK
      ?auto_559867 - BLOCK
      ?auto_559868 - BLOCK
      ?auto_559869 - BLOCK
      ?auto_559870 - BLOCK
    )
    :vars
    (
      ?auto_559871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559870 ?auto_559871 ) ( ON-TABLE ?auto_559863 ) ( not ( = ?auto_559863 ?auto_559864 ) ) ( not ( = ?auto_559863 ?auto_559865 ) ) ( not ( = ?auto_559863 ?auto_559866 ) ) ( not ( = ?auto_559863 ?auto_559867 ) ) ( not ( = ?auto_559863 ?auto_559868 ) ) ( not ( = ?auto_559863 ?auto_559869 ) ) ( not ( = ?auto_559863 ?auto_559870 ) ) ( not ( = ?auto_559863 ?auto_559871 ) ) ( not ( = ?auto_559864 ?auto_559865 ) ) ( not ( = ?auto_559864 ?auto_559866 ) ) ( not ( = ?auto_559864 ?auto_559867 ) ) ( not ( = ?auto_559864 ?auto_559868 ) ) ( not ( = ?auto_559864 ?auto_559869 ) ) ( not ( = ?auto_559864 ?auto_559870 ) ) ( not ( = ?auto_559864 ?auto_559871 ) ) ( not ( = ?auto_559865 ?auto_559866 ) ) ( not ( = ?auto_559865 ?auto_559867 ) ) ( not ( = ?auto_559865 ?auto_559868 ) ) ( not ( = ?auto_559865 ?auto_559869 ) ) ( not ( = ?auto_559865 ?auto_559870 ) ) ( not ( = ?auto_559865 ?auto_559871 ) ) ( not ( = ?auto_559866 ?auto_559867 ) ) ( not ( = ?auto_559866 ?auto_559868 ) ) ( not ( = ?auto_559866 ?auto_559869 ) ) ( not ( = ?auto_559866 ?auto_559870 ) ) ( not ( = ?auto_559866 ?auto_559871 ) ) ( not ( = ?auto_559867 ?auto_559868 ) ) ( not ( = ?auto_559867 ?auto_559869 ) ) ( not ( = ?auto_559867 ?auto_559870 ) ) ( not ( = ?auto_559867 ?auto_559871 ) ) ( not ( = ?auto_559868 ?auto_559869 ) ) ( not ( = ?auto_559868 ?auto_559870 ) ) ( not ( = ?auto_559868 ?auto_559871 ) ) ( not ( = ?auto_559869 ?auto_559870 ) ) ( not ( = ?auto_559869 ?auto_559871 ) ) ( not ( = ?auto_559870 ?auto_559871 ) ) ( ON ?auto_559869 ?auto_559870 ) ( ON ?auto_559868 ?auto_559869 ) ( ON ?auto_559867 ?auto_559868 ) ( ON ?auto_559866 ?auto_559867 ) ( ON ?auto_559865 ?auto_559866 ) ( CLEAR ?auto_559863 ) ( ON ?auto_559864 ?auto_559865 ) ( CLEAR ?auto_559864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_559863 ?auto_559864 )
      ( MAKE-8PILE ?auto_559863 ?auto_559864 ?auto_559865 ?auto_559866 ?auto_559867 ?auto_559868 ?auto_559869 ?auto_559870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_559897 - BLOCK
      ?auto_559898 - BLOCK
      ?auto_559899 - BLOCK
      ?auto_559900 - BLOCK
      ?auto_559901 - BLOCK
      ?auto_559902 - BLOCK
      ?auto_559903 - BLOCK
      ?auto_559904 - BLOCK
    )
    :vars
    (
      ?auto_559905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559904 ?auto_559905 ) ( not ( = ?auto_559897 ?auto_559898 ) ) ( not ( = ?auto_559897 ?auto_559899 ) ) ( not ( = ?auto_559897 ?auto_559900 ) ) ( not ( = ?auto_559897 ?auto_559901 ) ) ( not ( = ?auto_559897 ?auto_559902 ) ) ( not ( = ?auto_559897 ?auto_559903 ) ) ( not ( = ?auto_559897 ?auto_559904 ) ) ( not ( = ?auto_559897 ?auto_559905 ) ) ( not ( = ?auto_559898 ?auto_559899 ) ) ( not ( = ?auto_559898 ?auto_559900 ) ) ( not ( = ?auto_559898 ?auto_559901 ) ) ( not ( = ?auto_559898 ?auto_559902 ) ) ( not ( = ?auto_559898 ?auto_559903 ) ) ( not ( = ?auto_559898 ?auto_559904 ) ) ( not ( = ?auto_559898 ?auto_559905 ) ) ( not ( = ?auto_559899 ?auto_559900 ) ) ( not ( = ?auto_559899 ?auto_559901 ) ) ( not ( = ?auto_559899 ?auto_559902 ) ) ( not ( = ?auto_559899 ?auto_559903 ) ) ( not ( = ?auto_559899 ?auto_559904 ) ) ( not ( = ?auto_559899 ?auto_559905 ) ) ( not ( = ?auto_559900 ?auto_559901 ) ) ( not ( = ?auto_559900 ?auto_559902 ) ) ( not ( = ?auto_559900 ?auto_559903 ) ) ( not ( = ?auto_559900 ?auto_559904 ) ) ( not ( = ?auto_559900 ?auto_559905 ) ) ( not ( = ?auto_559901 ?auto_559902 ) ) ( not ( = ?auto_559901 ?auto_559903 ) ) ( not ( = ?auto_559901 ?auto_559904 ) ) ( not ( = ?auto_559901 ?auto_559905 ) ) ( not ( = ?auto_559902 ?auto_559903 ) ) ( not ( = ?auto_559902 ?auto_559904 ) ) ( not ( = ?auto_559902 ?auto_559905 ) ) ( not ( = ?auto_559903 ?auto_559904 ) ) ( not ( = ?auto_559903 ?auto_559905 ) ) ( not ( = ?auto_559904 ?auto_559905 ) ) ( ON ?auto_559903 ?auto_559904 ) ( ON ?auto_559902 ?auto_559903 ) ( ON ?auto_559901 ?auto_559902 ) ( ON ?auto_559900 ?auto_559901 ) ( ON ?auto_559899 ?auto_559900 ) ( ON ?auto_559898 ?auto_559899 ) ( ON ?auto_559897 ?auto_559898 ) ( CLEAR ?auto_559897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_559897 )
      ( MAKE-8PILE ?auto_559897 ?auto_559898 ?auto_559899 ?auto_559900 ?auto_559901 ?auto_559902 ?auto_559903 ?auto_559904 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_559932 - BLOCK
      ?auto_559933 - BLOCK
      ?auto_559934 - BLOCK
      ?auto_559935 - BLOCK
      ?auto_559936 - BLOCK
      ?auto_559937 - BLOCK
      ?auto_559938 - BLOCK
      ?auto_559939 - BLOCK
      ?auto_559940 - BLOCK
    )
    :vars
    (
      ?auto_559941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559939 ) ( ON ?auto_559940 ?auto_559941 ) ( CLEAR ?auto_559940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559932 ) ( ON ?auto_559933 ?auto_559932 ) ( ON ?auto_559934 ?auto_559933 ) ( ON ?auto_559935 ?auto_559934 ) ( ON ?auto_559936 ?auto_559935 ) ( ON ?auto_559937 ?auto_559936 ) ( ON ?auto_559938 ?auto_559937 ) ( ON ?auto_559939 ?auto_559938 ) ( not ( = ?auto_559932 ?auto_559933 ) ) ( not ( = ?auto_559932 ?auto_559934 ) ) ( not ( = ?auto_559932 ?auto_559935 ) ) ( not ( = ?auto_559932 ?auto_559936 ) ) ( not ( = ?auto_559932 ?auto_559937 ) ) ( not ( = ?auto_559932 ?auto_559938 ) ) ( not ( = ?auto_559932 ?auto_559939 ) ) ( not ( = ?auto_559932 ?auto_559940 ) ) ( not ( = ?auto_559932 ?auto_559941 ) ) ( not ( = ?auto_559933 ?auto_559934 ) ) ( not ( = ?auto_559933 ?auto_559935 ) ) ( not ( = ?auto_559933 ?auto_559936 ) ) ( not ( = ?auto_559933 ?auto_559937 ) ) ( not ( = ?auto_559933 ?auto_559938 ) ) ( not ( = ?auto_559933 ?auto_559939 ) ) ( not ( = ?auto_559933 ?auto_559940 ) ) ( not ( = ?auto_559933 ?auto_559941 ) ) ( not ( = ?auto_559934 ?auto_559935 ) ) ( not ( = ?auto_559934 ?auto_559936 ) ) ( not ( = ?auto_559934 ?auto_559937 ) ) ( not ( = ?auto_559934 ?auto_559938 ) ) ( not ( = ?auto_559934 ?auto_559939 ) ) ( not ( = ?auto_559934 ?auto_559940 ) ) ( not ( = ?auto_559934 ?auto_559941 ) ) ( not ( = ?auto_559935 ?auto_559936 ) ) ( not ( = ?auto_559935 ?auto_559937 ) ) ( not ( = ?auto_559935 ?auto_559938 ) ) ( not ( = ?auto_559935 ?auto_559939 ) ) ( not ( = ?auto_559935 ?auto_559940 ) ) ( not ( = ?auto_559935 ?auto_559941 ) ) ( not ( = ?auto_559936 ?auto_559937 ) ) ( not ( = ?auto_559936 ?auto_559938 ) ) ( not ( = ?auto_559936 ?auto_559939 ) ) ( not ( = ?auto_559936 ?auto_559940 ) ) ( not ( = ?auto_559936 ?auto_559941 ) ) ( not ( = ?auto_559937 ?auto_559938 ) ) ( not ( = ?auto_559937 ?auto_559939 ) ) ( not ( = ?auto_559937 ?auto_559940 ) ) ( not ( = ?auto_559937 ?auto_559941 ) ) ( not ( = ?auto_559938 ?auto_559939 ) ) ( not ( = ?auto_559938 ?auto_559940 ) ) ( not ( = ?auto_559938 ?auto_559941 ) ) ( not ( = ?auto_559939 ?auto_559940 ) ) ( not ( = ?auto_559939 ?auto_559941 ) ) ( not ( = ?auto_559940 ?auto_559941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_559940 ?auto_559941 )
      ( !STACK ?auto_559940 ?auto_559939 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_559970 - BLOCK
      ?auto_559971 - BLOCK
      ?auto_559972 - BLOCK
      ?auto_559973 - BLOCK
      ?auto_559974 - BLOCK
      ?auto_559975 - BLOCK
      ?auto_559976 - BLOCK
      ?auto_559977 - BLOCK
      ?auto_559978 - BLOCK
    )
    :vars
    (
      ?auto_559979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_559978 ?auto_559979 ) ( ON-TABLE ?auto_559970 ) ( ON ?auto_559971 ?auto_559970 ) ( ON ?auto_559972 ?auto_559971 ) ( ON ?auto_559973 ?auto_559972 ) ( ON ?auto_559974 ?auto_559973 ) ( ON ?auto_559975 ?auto_559974 ) ( ON ?auto_559976 ?auto_559975 ) ( not ( = ?auto_559970 ?auto_559971 ) ) ( not ( = ?auto_559970 ?auto_559972 ) ) ( not ( = ?auto_559970 ?auto_559973 ) ) ( not ( = ?auto_559970 ?auto_559974 ) ) ( not ( = ?auto_559970 ?auto_559975 ) ) ( not ( = ?auto_559970 ?auto_559976 ) ) ( not ( = ?auto_559970 ?auto_559977 ) ) ( not ( = ?auto_559970 ?auto_559978 ) ) ( not ( = ?auto_559970 ?auto_559979 ) ) ( not ( = ?auto_559971 ?auto_559972 ) ) ( not ( = ?auto_559971 ?auto_559973 ) ) ( not ( = ?auto_559971 ?auto_559974 ) ) ( not ( = ?auto_559971 ?auto_559975 ) ) ( not ( = ?auto_559971 ?auto_559976 ) ) ( not ( = ?auto_559971 ?auto_559977 ) ) ( not ( = ?auto_559971 ?auto_559978 ) ) ( not ( = ?auto_559971 ?auto_559979 ) ) ( not ( = ?auto_559972 ?auto_559973 ) ) ( not ( = ?auto_559972 ?auto_559974 ) ) ( not ( = ?auto_559972 ?auto_559975 ) ) ( not ( = ?auto_559972 ?auto_559976 ) ) ( not ( = ?auto_559972 ?auto_559977 ) ) ( not ( = ?auto_559972 ?auto_559978 ) ) ( not ( = ?auto_559972 ?auto_559979 ) ) ( not ( = ?auto_559973 ?auto_559974 ) ) ( not ( = ?auto_559973 ?auto_559975 ) ) ( not ( = ?auto_559973 ?auto_559976 ) ) ( not ( = ?auto_559973 ?auto_559977 ) ) ( not ( = ?auto_559973 ?auto_559978 ) ) ( not ( = ?auto_559973 ?auto_559979 ) ) ( not ( = ?auto_559974 ?auto_559975 ) ) ( not ( = ?auto_559974 ?auto_559976 ) ) ( not ( = ?auto_559974 ?auto_559977 ) ) ( not ( = ?auto_559974 ?auto_559978 ) ) ( not ( = ?auto_559974 ?auto_559979 ) ) ( not ( = ?auto_559975 ?auto_559976 ) ) ( not ( = ?auto_559975 ?auto_559977 ) ) ( not ( = ?auto_559975 ?auto_559978 ) ) ( not ( = ?auto_559975 ?auto_559979 ) ) ( not ( = ?auto_559976 ?auto_559977 ) ) ( not ( = ?auto_559976 ?auto_559978 ) ) ( not ( = ?auto_559976 ?auto_559979 ) ) ( not ( = ?auto_559977 ?auto_559978 ) ) ( not ( = ?auto_559977 ?auto_559979 ) ) ( not ( = ?auto_559978 ?auto_559979 ) ) ( CLEAR ?auto_559976 ) ( ON ?auto_559977 ?auto_559978 ) ( CLEAR ?auto_559977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_559970 ?auto_559971 ?auto_559972 ?auto_559973 ?auto_559974 ?auto_559975 ?auto_559976 ?auto_559977 )
      ( MAKE-9PILE ?auto_559970 ?auto_559971 ?auto_559972 ?auto_559973 ?auto_559974 ?auto_559975 ?auto_559976 ?auto_559977 ?auto_559978 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560008 - BLOCK
      ?auto_560009 - BLOCK
      ?auto_560010 - BLOCK
      ?auto_560011 - BLOCK
      ?auto_560012 - BLOCK
      ?auto_560013 - BLOCK
      ?auto_560014 - BLOCK
      ?auto_560015 - BLOCK
      ?auto_560016 - BLOCK
    )
    :vars
    (
      ?auto_560017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560016 ?auto_560017 ) ( ON-TABLE ?auto_560008 ) ( ON ?auto_560009 ?auto_560008 ) ( ON ?auto_560010 ?auto_560009 ) ( ON ?auto_560011 ?auto_560010 ) ( ON ?auto_560012 ?auto_560011 ) ( ON ?auto_560013 ?auto_560012 ) ( not ( = ?auto_560008 ?auto_560009 ) ) ( not ( = ?auto_560008 ?auto_560010 ) ) ( not ( = ?auto_560008 ?auto_560011 ) ) ( not ( = ?auto_560008 ?auto_560012 ) ) ( not ( = ?auto_560008 ?auto_560013 ) ) ( not ( = ?auto_560008 ?auto_560014 ) ) ( not ( = ?auto_560008 ?auto_560015 ) ) ( not ( = ?auto_560008 ?auto_560016 ) ) ( not ( = ?auto_560008 ?auto_560017 ) ) ( not ( = ?auto_560009 ?auto_560010 ) ) ( not ( = ?auto_560009 ?auto_560011 ) ) ( not ( = ?auto_560009 ?auto_560012 ) ) ( not ( = ?auto_560009 ?auto_560013 ) ) ( not ( = ?auto_560009 ?auto_560014 ) ) ( not ( = ?auto_560009 ?auto_560015 ) ) ( not ( = ?auto_560009 ?auto_560016 ) ) ( not ( = ?auto_560009 ?auto_560017 ) ) ( not ( = ?auto_560010 ?auto_560011 ) ) ( not ( = ?auto_560010 ?auto_560012 ) ) ( not ( = ?auto_560010 ?auto_560013 ) ) ( not ( = ?auto_560010 ?auto_560014 ) ) ( not ( = ?auto_560010 ?auto_560015 ) ) ( not ( = ?auto_560010 ?auto_560016 ) ) ( not ( = ?auto_560010 ?auto_560017 ) ) ( not ( = ?auto_560011 ?auto_560012 ) ) ( not ( = ?auto_560011 ?auto_560013 ) ) ( not ( = ?auto_560011 ?auto_560014 ) ) ( not ( = ?auto_560011 ?auto_560015 ) ) ( not ( = ?auto_560011 ?auto_560016 ) ) ( not ( = ?auto_560011 ?auto_560017 ) ) ( not ( = ?auto_560012 ?auto_560013 ) ) ( not ( = ?auto_560012 ?auto_560014 ) ) ( not ( = ?auto_560012 ?auto_560015 ) ) ( not ( = ?auto_560012 ?auto_560016 ) ) ( not ( = ?auto_560012 ?auto_560017 ) ) ( not ( = ?auto_560013 ?auto_560014 ) ) ( not ( = ?auto_560013 ?auto_560015 ) ) ( not ( = ?auto_560013 ?auto_560016 ) ) ( not ( = ?auto_560013 ?auto_560017 ) ) ( not ( = ?auto_560014 ?auto_560015 ) ) ( not ( = ?auto_560014 ?auto_560016 ) ) ( not ( = ?auto_560014 ?auto_560017 ) ) ( not ( = ?auto_560015 ?auto_560016 ) ) ( not ( = ?auto_560015 ?auto_560017 ) ) ( not ( = ?auto_560016 ?auto_560017 ) ) ( ON ?auto_560015 ?auto_560016 ) ( CLEAR ?auto_560013 ) ( ON ?auto_560014 ?auto_560015 ) ( CLEAR ?auto_560014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_560008 ?auto_560009 ?auto_560010 ?auto_560011 ?auto_560012 ?auto_560013 ?auto_560014 )
      ( MAKE-9PILE ?auto_560008 ?auto_560009 ?auto_560010 ?auto_560011 ?auto_560012 ?auto_560013 ?auto_560014 ?auto_560015 ?auto_560016 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560046 - BLOCK
      ?auto_560047 - BLOCK
      ?auto_560048 - BLOCK
      ?auto_560049 - BLOCK
      ?auto_560050 - BLOCK
      ?auto_560051 - BLOCK
      ?auto_560052 - BLOCK
      ?auto_560053 - BLOCK
      ?auto_560054 - BLOCK
    )
    :vars
    (
      ?auto_560055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560054 ?auto_560055 ) ( ON-TABLE ?auto_560046 ) ( ON ?auto_560047 ?auto_560046 ) ( ON ?auto_560048 ?auto_560047 ) ( ON ?auto_560049 ?auto_560048 ) ( ON ?auto_560050 ?auto_560049 ) ( not ( = ?auto_560046 ?auto_560047 ) ) ( not ( = ?auto_560046 ?auto_560048 ) ) ( not ( = ?auto_560046 ?auto_560049 ) ) ( not ( = ?auto_560046 ?auto_560050 ) ) ( not ( = ?auto_560046 ?auto_560051 ) ) ( not ( = ?auto_560046 ?auto_560052 ) ) ( not ( = ?auto_560046 ?auto_560053 ) ) ( not ( = ?auto_560046 ?auto_560054 ) ) ( not ( = ?auto_560046 ?auto_560055 ) ) ( not ( = ?auto_560047 ?auto_560048 ) ) ( not ( = ?auto_560047 ?auto_560049 ) ) ( not ( = ?auto_560047 ?auto_560050 ) ) ( not ( = ?auto_560047 ?auto_560051 ) ) ( not ( = ?auto_560047 ?auto_560052 ) ) ( not ( = ?auto_560047 ?auto_560053 ) ) ( not ( = ?auto_560047 ?auto_560054 ) ) ( not ( = ?auto_560047 ?auto_560055 ) ) ( not ( = ?auto_560048 ?auto_560049 ) ) ( not ( = ?auto_560048 ?auto_560050 ) ) ( not ( = ?auto_560048 ?auto_560051 ) ) ( not ( = ?auto_560048 ?auto_560052 ) ) ( not ( = ?auto_560048 ?auto_560053 ) ) ( not ( = ?auto_560048 ?auto_560054 ) ) ( not ( = ?auto_560048 ?auto_560055 ) ) ( not ( = ?auto_560049 ?auto_560050 ) ) ( not ( = ?auto_560049 ?auto_560051 ) ) ( not ( = ?auto_560049 ?auto_560052 ) ) ( not ( = ?auto_560049 ?auto_560053 ) ) ( not ( = ?auto_560049 ?auto_560054 ) ) ( not ( = ?auto_560049 ?auto_560055 ) ) ( not ( = ?auto_560050 ?auto_560051 ) ) ( not ( = ?auto_560050 ?auto_560052 ) ) ( not ( = ?auto_560050 ?auto_560053 ) ) ( not ( = ?auto_560050 ?auto_560054 ) ) ( not ( = ?auto_560050 ?auto_560055 ) ) ( not ( = ?auto_560051 ?auto_560052 ) ) ( not ( = ?auto_560051 ?auto_560053 ) ) ( not ( = ?auto_560051 ?auto_560054 ) ) ( not ( = ?auto_560051 ?auto_560055 ) ) ( not ( = ?auto_560052 ?auto_560053 ) ) ( not ( = ?auto_560052 ?auto_560054 ) ) ( not ( = ?auto_560052 ?auto_560055 ) ) ( not ( = ?auto_560053 ?auto_560054 ) ) ( not ( = ?auto_560053 ?auto_560055 ) ) ( not ( = ?auto_560054 ?auto_560055 ) ) ( ON ?auto_560053 ?auto_560054 ) ( ON ?auto_560052 ?auto_560053 ) ( CLEAR ?auto_560050 ) ( ON ?auto_560051 ?auto_560052 ) ( CLEAR ?auto_560051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_560046 ?auto_560047 ?auto_560048 ?auto_560049 ?auto_560050 ?auto_560051 )
      ( MAKE-9PILE ?auto_560046 ?auto_560047 ?auto_560048 ?auto_560049 ?auto_560050 ?auto_560051 ?auto_560052 ?auto_560053 ?auto_560054 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560084 - BLOCK
      ?auto_560085 - BLOCK
      ?auto_560086 - BLOCK
      ?auto_560087 - BLOCK
      ?auto_560088 - BLOCK
      ?auto_560089 - BLOCK
      ?auto_560090 - BLOCK
      ?auto_560091 - BLOCK
      ?auto_560092 - BLOCK
    )
    :vars
    (
      ?auto_560093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560092 ?auto_560093 ) ( ON-TABLE ?auto_560084 ) ( ON ?auto_560085 ?auto_560084 ) ( ON ?auto_560086 ?auto_560085 ) ( ON ?auto_560087 ?auto_560086 ) ( not ( = ?auto_560084 ?auto_560085 ) ) ( not ( = ?auto_560084 ?auto_560086 ) ) ( not ( = ?auto_560084 ?auto_560087 ) ) ( not ( = ?auto_560084 ?auto_560088 ) ) ( not ( = ?auto_560084 ?auto_560089 ) ) ( not ( = ?auto_560084 ?auto_560090 ) ) ( not ( = ?auto_560084 ?auto_560091 ) ) ( not ( = ?auto_560084 ?auto_560092 ) ) ( not ( = ?auto_560084 ?auto_560093 ) ) ( not ( = ?auto_560085 ?auto_560086 ) ) ( not ( = ?auto_560085 ?auto_560087 ) ) ( not ( = ?auto_560085 ?auto_560088 ) ) ( not ( = ?auto_560085 ?auto_560089 ) ) ( not ( = ?auto_560085 ?auto_560090 ) ) ( not ( = ?auto_560085 ?auto_560091 ) ) ( not ( = ?auto_560085 ?auto_560092 ) ) ( not ( = ?auto_560085 ?auto_560093 ) ) ( not ( = ?auto_560086 ?auto_560087 ) ) ( not ( = ?auto_560086 ?auto_560088 ) ) ( not ( = ?auto_560086 ?auto_560089 ) ) ( not ( = ?auto_560086 ?auto_560090 ) ) ( not ( = ?auto_560086 ?auto_560091 ) ) ( not ( = ?auto_560086 ?auto_560092 ) ) ( not ( = ?auto_560086 ?auto_560093 ) ) ( not ( = ?auto_560087 ?auto_560088 ) ) ( not ( = ?auto_560087 ?auto_560089 ) ) ( not ( = ?auto_560087 ?auto_560090 ) ) ( not ( = ?auto_560087 ?auto_560091 ) ) ( not ( = ?auto_560087 ?auto_560092 ) ) ( not ( = ?auto_560087 ?auto_560093 ) ) ( not ( = ?auto_560088 ?auto_560089 ) ) ( not ( = ?auto_560088 ?auto_560090 ) ) ( not ( = ?auto_560088 ?auto_560091 ) ) ( not ( = ?auto_560088 ?auto_560092 ) ) ( not ( = ?auto_560088 ?auto_560093 ) ) ( not ( = ?auto_560089 ?auto_560090 ) ) ( not ( = ?auto_560089 ?auto_560091 ) ) ( not ( = ?auto_560089 ?auto_560092 ) ) ( not ( = ?auto_560089 ?auto_560093 ) ) ( not ( = ?auto_560090 ?auto_560091 ) ) ( not ( = ?auto_560090 ?auto_560092 ) ) ( not ( = ?auto_560090 ?auto_560093 ) ) ( not ( = ?auto_560091 ?auto_560092 ) ) ( not ( = ?auto_560091 ?auto_560093 ) ) ( not ( = ?auto_560092 ?auto_560093 ) ) ( ON ?auto_560091 ?auto_560092 ) ( ON ?auto_560090 ?auto_560091 ) ( ON ?auto_560089 ?auto_560090 ) ( CLEAR ?auto_560087 ) ( ON ?auto_560088 ?auto_560089 ) ( CLEAR ?auto_560088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_560084 ?auto_560085 ?auto_560086 ?auto_560087 ?auto_560088 )
      ( MAKE-9PILE ?auto_560084 ?auto_560085 ?auto_560086 ?auto_560087 ?auto_560088 ?auto_560089 ?auto_560090 ?auto_560091 ?auto_560092 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560122 - BLOCK
      ?auto_560123 - BLOCK
      ?auto_560124 - BLOCK
      ?auto_560125 - BLOCK
      ?auto_560126 - BLOCK
      ?auto_560127 - BLOCK
      ?auto_560128 - BLOCK
      ?auto_560129 - BLOCK
      ?auto_560130 - BLOCK
    )
    :vars
    (
      ?auto_560131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560130 ?auto_560131 ) ( ON-TABLE ?auto_560122 ) ( ON ?auto_560123 ?auto_560122 ) ( ON ?auto_560124 ?auto_560123 ) ( not ( = ?auto_560122 ?auto_560123 ) ) ( not ( = ?auto_560122 ?auto_560124 ) ) ( not ( = ?auto_560122 ?auto_560125 ) ) ( not ( = ?auto_560122 ?auto_560126 ) ) ( not ( = ?auto_560122 ?auto_560127 ) ) ( not ( = ?auto_560122 ?auto_560128 ) ) ( not ( = ?auto_560122 ?auto_560129 ) ) ( not ( = ?auto_560122 ?auto_560130 ) ) ( not ( = ?auto_560122 ?auto_560131 ) ) ( not ( = ?auto_560123 ?auto_560124 ) ) ( not ( = ?auto_560123 ?auto_560125 ) ) ( not ( = ?auto_560123 ?auto_560126 ) ) ( not ( = ?auto_560123 ?auto_560127 ) ) ( not ( = ?auto_560123 ?auto_560128 ) ) ( not ( = ?auto_560123 ?auto_560129 ) ) ( not ( = ?auto_560123 ?auto_560130 ) ) ( not ( = ?auto_560123 ?auto_560131 ) ) ( not ( = ?auto_560124 ?auto_560125 ) ) ( not ( = ?auto_560124 ?auto_560126 ) ) ( not ( = ?auto_560124 ?auto_560127 ) ) ( not ( = ?auto_560124 ?auto_560128 ) ) ( not ( = ?auto_560124 ?auto_560129 ) ) ( not ( = ?auto_560124 ?auto_560130 ) ) ( not ( = ?auto_560124 ?auto_560131 ) ) ( not ( = ?auto_560125 ?auto_560126 ) ) ( not ( = ?auto_560125 ?auto_560127 ) ) ( not ( = ?auto_560125 ?auto_560128 ) ) ( not ( = ?auto_560125 ?auto_560129 ) ) ( not ( = ?auto_560125 ?auto_560130 ) ) ( not ( = ?auto_560125 ?auto_560131 ) ) ( not ( = ?auto_560126 ?auto_560127 ) ) ( not ( = ?auto_560126 ?auto_560128 ) ) ( not ( = ?auto_560126 ?auto_560129 ) ) ( not ( = ?auto_560126 ?auto_560130 ) ) ( not ( = ?auto_560126 ?auto_560131 ) ) ( not ( = ?auto_560127 ?auto_560128 ) ) ( not ( = ?auto_560127 ?auto_560129 ) ) ( not ( = ?auto_560127 ?auto_560130 ) ) ( not ( = ?auto_560127 ?auto_560131 ) ) ( not ( = ?auto_560128 ?auto_560129 ) ) ( not ( = ?auto_560128 ?auto_560130 ) ) ( not ( = ?auto_560128 ?auto_560131 ) ) ( not ( = ?auto_560129 ?auto_560130 ) ) ( not ( = ?auto_560129 ?auto_560131 ) ) ( not ( = ?auto_560130 ?auto_560131 ) ) ( ON ?auto_560129 ?auto_560130 ) ( ON ?auto_560128 ?auto_560129 ) ( ON ?auto_560127 ?auto_560128 ) ( ON ?auto_560126 ?auto_560127 ) ( CLEAR ?auto_560124 ) ( ON ?auto_560125 ?auto_560126 ) ( CLEAR ?auto_560125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_560122 ?auto_560123 ?auto_560124 ?auto_560125 )
      ( MAKE-9PILE ?auto_560122 ?auto_560123 ?auto_560124 ?auto_560125 ?auto_560126 ?auto_560127 ?auto_560128 ?auto_560129 ?auto_560130 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560160 - BLOCK
      ?auto_560161 - BLOCK
      ?auto_560162 - BLOCK
      ?auto_560163 - BLOCK
      ?auto_560164 - BLOCK
      ?auto_560165 - BLOCK
      ?auto_560166 - BLOCK
      ?auto_560167 - BLOCK
      ?auto_560168 - BLOCK
    )
    :vars
    (
      ?auto_560169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560168 ?auto_560169 ) ( ON-TABLE ?auto_560160 ) ( ON ?auto_560161 ?auto_560160 ) ( not ( = ?auto_560160 ?auto_560161 ) ) ( not ( = ?auto_560160 ?auto_560162 ) ) ( not ( = ?auto_560160 ?auto_560163 ) ) ( not ( = ?auto_560160 ?auto_560164 ) ) ( not ( = ?auto_560160 ?auto_560165 ) ) ( not ( = ?auto_560160 ?auto_560166 ) ) ( not ( = ?auto_560160 ?auto_560167 ) ) ( not ( = ?auto_560160 ?auto_560168 ) ) ( not ( = ?auto_560160 ?auto_560169 ) ) ( not ( = ?auto_560161 ?auto_560162 ) ) ( not ( = ?auto_560161 ?auto_560163 ) ) ( not ( = ?auto_560161 ?auto_560164 ) ) ( not ( = ?auto_560161 ?auto_560165 ) ) ( not ( = ?auto_560161 ?auto_560166 ) ) ( not ( = ?auto_560161 ?auto_560167 ) ) ( not ( = ?auto_560161 ?auto_560168 ) ) ( not ( = ?auto_560161 ?auto_560169 ) ) ( not ( = ?auto_560162 ?auto_560163 ) ) ( not ( = ?auto_560162 ?auto_560164 ) ) ( not ( = ?auto_560162 ?auto_560165 ) ) ( not ( = ?auto_560162 ?auto_560166 ) ) ( not ( = ?auto_560162 ?auto_560167 ) ) ( not ( = ?auto_560162 ?auto_560168 ) ) ( not ( = ?auto_560162 ?auto_560169 ) ) ( not ( = ?auto_560163 ?auto_560164 ) ) ( not ( = ?auto_560163 ?auto_560165 ) ) ( not ( = ?auto_560163 ?auto_560166 ) ) ( not ( = ?auto_560163 ?auto_560167 ) ) ( not ( = ?auto_560163 ?auto_560168 ) ) ( not ( = ?auto_560163 ?auto_560169 ) ) ( not ( = ?auto_560164 ?auto_560165 ) ) ( not ( = ?auto_560164 ?auto_560166 ) ) ( not ( = ?auto_560164 ?auto_560167 ) ) ( not ( = ?auto_560164 ?auto_560168 ) ) ( not ( = ?auto_560164 ?auto_560169 ) ) ( not ( = ?auto_560165 ?auto_560166 ) ) ( not ( = ?auto_560165 ?auto_560167 ) ) ( not ( = ?auto_560165 ?auto_560168 ) ) ( not ( = ?auto_560165 ?auto_560169 ) ) ( not ( = ?auto_560166 ?auto_560167 ) ) ( not ( = ?auto_560166 ?auto_560168 ) ) ( not ( = ?auto_560166 ?auto_560169 ) ) ( not ( = ?auto_560167 ?auto_560168 ) ) ( not ( = ?auto_560167 ?auto_560169 ) ) ( not ( = ?auto_560168 ?auto_560169 ) ) ( ON ?auto_560167 ?auto_560168 ) ( ON ?auto_560166 ?auto_560167 ) ( ON ?auto_560165 ?auto_560166 ) ( ON ?auto_560164 ?auto_560165 ) ( ON ?auto_560163 ?auto_560164 ) ( CLEAR ?auto_560161 ) ( ON ?auto_560162 ?auto_560163 ) ( CLEAR ?auto_560162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_560160 ?auto_560161 ?auto_560162 )
      ( MAKE-9PILE ?auto_560160 ?auto_560161 ?auto_560162 ?auto_560163 ?auto_560164 ?auto_560165 ?auto_560166 ?auto_560167 ?auto_560168 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560198 - BLOCK
      ?auto_560199 - BLOCK
      ?auto_560200 - BLOCK
      ?auto_560201 - BLOCK
      ?auto_560202 - BLOCK
      ?auto_560203 - BLOCK
      ?auto_560204 - BLOCK
      ?auto_560205 - BLOCK
      ?auto_560206 - BLOCK
    )
    :vars
    (
      ?auto_560207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560206 ?auto_560207 ) ( ON-TABLE ?auto_560198 ) ( not ( = ?auto_560198 ?auto_560199 ) ) ( not ( = ?auto_560198 ?auto_560200 ) ) ( not ( = ?auto_560198 ?auto_560201 ) ) ( not ( = ?auto_560198 ?auto_560202 ) ) ( not ( = ?auto_560198 ?auto_560203 ) ) ( not ( = ?auto_560198 ?auto_560204 ) ) ( not ( = ?auto_560198 ?auto_560205 ) ) ( not ( = ?auto_560198 ?auto_560206 ) ) ( not ( = ?auto_560198 ?auto_560207 ) ) ( not ( = ?auto_560199 ?auto_560200 ) ) ( not ( = ?auto_560199 ?auto_560201 ) ) ( not ( = ?auto_560199 ?auto_560202 ) ) ( not ( = ?auto_560199 ?auto_560203 ) ) ( not ( = ?auto_560199 ?auto_560204 ) ) ( not ( = ?auto_560199 ?auto_560205 ) ) ( not ( = ?auto_560199 ?auto_560206 ) ) ( not ( = ?auto_560199 ?auto_560207 ) ) ( not ( = ?auto_560200 ?auto_560201 ) ) ( not ( = ?auto_560200 ?auto_560202 ) ) ( not ( = ?auto_560200 ?auto_560203 ) ) ( not ( = ?auto_560200 ?auto_560204 ) ) ( not ( = ?auto_560200 ?auto_560205 ) ) ( not ( = ?auto_560200 ?auto_560206 ) ) ( not ( = ?auto_560200 ?auto_560207 ) ) ( not ( = ?auto_560201 ?auto_560202 ) ) ( not ( = ?auto_560201 ?auto_560203 ) ) ( not ( = ?auto_560201 ?auto_560204 ) ) ( not ( = ?auto_560201 ?auto_560205 ) ) ( not ( = ?auto_560201 ?auto_560206 ) ) ( not ( = ?auto_560201 ?auto_560207 ) ) ( not ( = ?auto_560202 ?auto_560203 ) ) ( not ( = ?auto_560202 ?auto_560204 ) ) ( not ( = ?auto_560202 ?auto_560205 ) ) ( not ( = ?auto_560202 ?auto_560206 ) ) ( not ( = ?auto_560202 ?auto_560207 ) ) ( not ( = ?auto_560203 ?auto_560204 ) ) ( not ( = ?auto_560203 ?auto_560205 ) ) ( not ( = ?auto_560203 ?auto_560206 ) ) ( not ( = ?auto_560203 ?auto_560207 ) ) ( not ( = ?auto_560204 ?auto_560205 ) ) ( not ( = ?auto_560204 ?auto_560206 ) ) ( not ( = ?auto_560204 ?auto_560207 ) ) ( not ( = ?auto_560205 ?auto_560206 ) ) ( not ( = ?auto_560205 ?auto_560207 ) ) ( not ( = ?auto_560206 ?auto_560207 ) ) ( ON ?auto_560205 ?auto_560206 ) ( ON ?auto_560204 ?auto_560205 ) ( ON ?auto_560203 ?auto_560204 ) ( ON ?auto_560202 ?auto_560203 ) ( ON ?auto_560201 ?auto_560202 ) ( ON ?auto_560200 ?auto_560201 ) ( CLEAR ?auto_560198 ) ( ON ?auto_560199 ?auto_560200 ) ( CLEAR ?auto_560199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_560198 ?auto_560199 )
      ( MAKE-9PILE ?auto_560198 ?auto_560199 ?auto_560200 ?auto_560201 ?auto_560202 ?auto_560203 ?auto_560204 ?auto_560205 ?auto_560206 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_560236 - BLOCK
      ?auto_560237 - BLOCK
      ?auto_560238 - BLOCK
      ?auto_560239 - BLOCK
      ?auto_560240 - BLOCK
      ?auto_560241 - BLOCK
      ?auto_560242 - BLOCK
      ?auto_560243 - BLOCK
      ?auto_560244 - BLOCK
    )
    :vars
    (
      ?auto_560245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560244 ?auto_560245 ) ( not ( = ?auto_560236 ?auto_560237 ) ) ( not ( = ?auto_560236 ?auto_560238 ) ) ( not ( = ?auto_560236 ?auto_560239 ) ) ( not ( = ?auto_560236 ?auto_560240 ) ) ( not ( = ?auto_560236 ?auto_560241 ) ) ( not ( = ?auto_560236 ?auto_560242 ) ) ( not ( = ?auto_560236 ?auto_560243 ) ) ( not ( = ?auto_560236 ?auto_560244 ) ) ( not ( = ?auto_560236 ?auto_560245 ) ) ( not ( = ?auto_560237 ?auto_560238 ) ) ( not ( = ?auto_560237 ?auto_560239 ) ) ( not ( = ?auto_560237 ?auto_560240 ) ) ( not ( = ?auto_560237 ?auto_560241 ) ) ( not ( = ?auto_560237 ?auto_560242 ) ) ( not ( = ?auto_560237 ?auto_560243 ) ) ( not ( = ?auto_560237 ?auto_560244 ) ) ( not ( = ?auto_560237 ?auto_560245 ) ) ( not ( = ?auto_560238 ?auto_560239 ) ) ( not ( = ?auto_560238 ?auto_560240 ) ) ( not ( = ?auto_560238 ?auto_560241 ) ) ( not ( = ?auto_560238 ?auto_560242 ) ) ( not ( = ?auto_560238 ?auto_560243 ) ) ( not ( = ?auto_560238 ?auto_560244 ) ) ( not ( = ?auto_560238 ?auto_560245 ) ) ( not ( = ?auto_560239 ?auto_560240 ) ) ( not ( = ?auto_560239 ?auto_560241 ) ) ( not ( = ?auto_560239 ?auto_560242 ) ) ( not ( = ?auto_560239 ?auto_560243 ) ) ( not ( = ?auto_560239 ?auto_560244 ) ) ( not ( = ?auto_560239 ?auto_560245 ) ) ( not ( = ?auto_560240 ?auto_560241 ) ) ( not ( = ?auto_560240 ?auto_560242 ) ) ( not ( = ?auto_560240 ?auto_560243 ) ) ( not ( = ?auto_560240 ?auto_560244 ) ) ( not ( = ?auto_560240 ?auto_560245 ) ) ( not ( = ?auto_560241 ?auto_560242 ) ) ( not ( = ?auto_560241 ?auto_560243 ) ) ( not ( = ?auto_560241 ?auto_560244 ) ) ( not ( = ?auto_560241 ?auto_560245 ) ) ( not ( = ?auto_560242 ?auto_560243 ) ) ( not ( = ?auto_560242 ?auto_560244 ) ) ( not ( = ?auto_560242 ?auto_560245 ) ) ( not ( = ?auto_560243 ?auto_560244 ) ) ( not ( = ?auto_560243 ?auto_560245 ) ) ( not ( = ?auto_560244 ?auto_560245 ) ) ( ON ?auto_560243 ?auto_560244 ) ( ON ?auto_560242 ?auto_560243 ) ( ON ?auto_560241 ?auto_560242 ) ( ON ?auto_560240 ?auto_560241 ) ( ON ?auto_560239 ?auto_560240 ) ( ON ?auto_560238 ?auto_560239 ) ( ON ?auto_560237 ?auto_560238 ) ( ON ?auto_560236 ?auto_560237 ) ( CLEAR ?auto_560236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_560236 )
      ( MAKE-9PILE ?auto_560236 ?auto_560237 ?auto_560238 ?auto_560239 ?auto_560240 ?auto_560241 ?auto_560242 ?auto_560243 ?auto_560244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560275 - BLOCK
      ?auto_560276 - BLOCK
      ?auto_560277 - BLOCK
      ?auto_560278 - BLOCK
      ?auto_560279 - BLOCK
      ?auto_560280 - BLOCK
      ?auto_560281 - BLOCK
      ?auto_560282 - BLOCK
      ?auto_560283 - BLOCK
      ?auto_560284 - BLOCK
    )
    :vars
    (
      ?auto_560285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_560283 ) ( ON ?auto_560284 ?auto_560285 ) ( CLEAR ?auto_560284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_560275 ) ( ON ?auto_560276 ?auto_560275 ) ( ON ?auto_560277 ?auto_560276 ) ( ON ?auto_560278 ?auto_560277 ) ( ON ?auto_560279 ?auto_560278 ) ( ON ?auto_560280 ?auto_560279 ) ( ON ?auto_560281 ?auto_560280 ) ( ON ?auto_560282 ?auto_560281 ) ( ON ?auto_560283 ?auto_560282 ) ( not ( = ?auto_560275 ?auto_560276 ) ) ( not ( = ?auto_560275 ?auto_560277 ) ) ( not ( = ?auto_560275 ?auto_560278 ) ) ( not ( = ?auto_560275 ?auto_560279 ) ) ( not ( = ?auto_560275 ?auto_560280 ) ) ( not ( = ?auto_560275 ?auto_560281 ) ) ( not ( = ?auto_560275 ?auto_560282 ) ) ( not ( = ?auto_560275 ?auto_560283 ) ) ( not ( = ?auto_560275 ?auto_560284 ) ) ( not ( = ?auto_560275 ?auto_560285 ) ) ( not ( = ?auto_560276 ?auto_560277 ) ) ( not ( = ?auto_560276 ?auto_560278 ) ) ( not ( = ?auto_560276 ?auto_560279 ) ) ( not ( = ?auto_560276 ?auto_560280 ) ) ( not ( = ?auto_560276 ?auto_560281 ) ) ( not ( = ?auto_560276 ?auto_560282 ) ) ( not ( = ?auto_560276 ?auto_560283 ) ) ( not ( = ?auto_560276 ?auto_560284 ) ) ( not ( = ?auto_560276 ?auto_560285 ) ) ( not ( = ?auto_560277 ?auto_560278 ) ) ( not ( = ?auto_560277 ?auto_560279 ) ) ( not ( = ?auto_560277 ?auto_560280 ) ) ( not ( = ?auto_560277 ?auto_560281 ) ) ( not ( = ?auto_560277 ?auto_560282 ) ) ( not ( = ?auto_560277 ?auto_560283 ) ) ( not ( = ?auto_560277 ?auto_560284 ) ) ( not ( = ?auto_560277 ?auto_560285 ) ) ( not ( = ?auto_560278 ?auto_560279 ) ) ( not ( = ?auto_560278 ?auto_560280 ) ) ( not ( = ?auto_560278 ?auto_560281 ) ) ( not ( = ?auto_560278 ?auto_560282 ) ) ( not ( = ?auto_560278 ?auto_560283 ) ) ( not ( = ?auto_560278 ?auto_560284 ) ) ( not ( = ?auto_560278 ?auto_560285 ) ) ( not ( = ?auto_560279 ?auto_560280 ) ) ( not ( = ?auto_560279 ?auto_560281 ) ) ( not ( = ?auto_560279 ?auto_560282 ) ) ( not ( = ?auto_560279 ?auto_560283 ) ) ( not ( = ?auto_560279 ?auto_560284 ) ) ( not ( = ?auto_560279 ?auto_560285 ) ) ( not ( = ?auto_560280 ?auto_560281 ) ) ( not ( = ?auto_560280 ?auto_560282 ) ) ( not ( = ?auto_560280 ?auto_560283 ) ) ( not ( = ?auto_560280 ?auto_560284 ) ) ( not ( = ?auto_560280 ?auto_560285 ) ) ( not ( = ?auto_560281 ?auto_560282 ) ) ( not ( = ?auto_560281 ?auto_560283 ) ) ( not ( = ?auto_560281 ?auto_560284 ) ) ( not ( = ?auto_560281 ?auto_560285 ) ) ( not ( = ?auto_560282 ?auto_560283 ) ) ( not ( = ?auto_560282 ?auto_560284 ) ) ( not ( = ?auto_560282 ?auto_560285 ) ) ( not ( = ?auto_560283 ?auto_560284 ) ) ( not ( = ?auto_560283 ?auto_560285 ) ) ( not ( = ?auto_560284 ?auto_560285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_560284 ?auto_560285 )
      ( !STACK ?auto_560284 ?auto_560283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560317 - BLOCK
      ?auto_560318 - BLOCK
      ?auto_560319 - BLOCK
      ?auto_560320 - BLOCK
      ?auto_560321 - BLOCK
      ?auto_560322 - BLOCK
      ?auto_560323 - BLOCK
      ?auto_560324 - BLOCK
      ?auto_560325 - BLOCK
      ?auto_560326 - BLOCK
    )
    :vars
    (
      ?auto_560327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560326 ?auto_560327 ) ( ON-TABLE ?auto_560317 ) ( ON ?auto_560318 ?auto_560317 ) ( ON ?auto_560319 ?auto_560318 ) ( ON ?auto_560320 ?auto_560319 ) ( ON ?auto_560321 ?auto_560320 ) ( ON ?auto_560322 ?auto_560321 ) ( ON ?auto_560323 ?auto_560322 ) ( ON ?auto_560324 ?auto_560323 ) ( not ( = ?auto_560317 ?auto_560318 ) ) ( not ( = ?auto_560317 ?auto_560319 ) ) ( not ( = ?auto_560317 ?auto_560320 ) ) ( not ( = ?auto_560317 ?auto_560321 ) ) ( not ( = ?auto_560317 ?auto_560322 ) ) ( not ( = ?auto_560317 ?auto_560323 ) ) ( not ( = ?auto_560317 ?auto_560324 ) ) ( not ( = ?auto_560317 ?auto_560325 ) ) ( not ( = ?auto_560317 ?auto_560326 ) ) ( not ( = ?auto_560317 ?auto_560327 ) ) ( not ( = ?auto_560318 ?auto_560319 ) ) ( not ( = ?auto_560318 ?auto_560320 ) ) ( not ( = ?auto_560318 ?auto_560321 ) ) ( not ( = ?auto_560318 ?auto_560322 ) ) ( not ( = ?auto_560318 ?auto_560323 ) ) ( not ( = ?auto_560318 ?auto_560324 ) ) ( not ( = ?auto_560318 ?auto_560325 ) ) ( not ( = ?auto_560318 ?auto_560326 ) ) ( not ( = ?auto_560318 ?auto_560327 ) ) ( not ( = ?auto_560319 ?auto_560320 ) ) ( not ( = ?auto_560319 ?auto_560321 ) ) ( not ( = ?auto_560319 ?auto_560322 ) ) ( not ( = ?auto_560319 ?auto_560323 ) ) ( not ( = ?auto_560319 ?auto_560324 ) ) ( not ( = ?auto_560319 ?auto_560325 ) ) ( not ( = ?auto_560319 ?auto_560326 ) ) ( not ( = ?auto_560319 ?auto_560327 ) ) ( not ( = ?auto_560320 ?auto_560321 ) ) ( not ( = ?auto_560320 ?auto_560322 ) ) ( not ( = ?auto_560320 ?auto_560323 ) ) ( not ( = ?auto_560320 ?auto_560324 ) ) ( not ( = ?auto_560320 ?auto_560325 ) ) ( not ( = ?auto_560320 ?auto_560326 ) ) ( not ( = ?auto_560320 ?auto_560327 ) ) ( not ( = ?auto_560321 ?auto_560322 ) ) ( not ( = ?auto_560321 ?auto_560323 ) ) ( not ( = ?auto_560321 ?auto_560324 ) ) ( not ( = ?auto_560321 ?auto_560325 ) ) ( not ( = ?auto_560321 ?auto_560326 ) ) ( not ( = ?auto_560321 ?auto_560327 ) ) ( not ( = ?auto_560322 ?auto_560323 ) ) ( not ( = ?auto_560322 ?auto_560324 ) ) ( not ( = ?auto_560322 ?auto_560325 ) ) ( not ( = ?auto_560322 ?auto_560326 ) ) ( not ( = ?auto_560322 ?auto_560327 ) ) ( not ( = ?auto_560323 ?auto_560324 ) ) ( not ( = ?auto_560323 ?auto_560325 ) ) ( not ( = ?auto_560323 ?auto_560326 ) ) ( not ( = ?auto_560323 ?auto_560327 ) ) ( not ( = ?auto_560324 ?auto_560325 ) ) ( not ( = ?auto_560324 ?auto_560326 ) ) ( not ( = ?auto_560324 ?auto_560327 ) ) ( not ( = ?auto_560325 ?auto_560326 ) ) ( not ( = ?auto_560325 ?auto_560327 ) ) ( not ( = ?auto_560326 ?auto_560327 ) ) ( CLEAR ?auto_560324 ) ( ON ?auto_560325 ?auto_560326 ) ( CLEAR ?auto_560325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_560317 ?auto_560318 ?auto_560319 ?auto_560320 ?auto_560321 ?auto_560322 ?auto_560323 ?auto_560324 ?auto_560325 )
      ( MAKE-10PILE ?auto_560317 ?auto_560318 ?auto_560319 ?auto_560320 ?auto_560321 ?auto_560322 ?auto_560323 ?auto_560324 ?auto_560325 ?auto_560326 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560359 - BLOCK
      ?auto_560360 - BLOCK
      ?auto_560361 - BLOCK
      ?auto_560362 - BLOCK
      ?auto_560363 - BLOCK
      ?auto_560364 - BLOCK
      ?auto_560365 - BLOCK
      ?auto_560366 - BLOCK
      ?auto_560367 - BLOCK
      ?auto_560368 - BLOCK
    )
    :vars
    (
      ?auto_560369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560368 ?auto_560369 ) ( ON-TABLE ?auto_560359 ) ( ON ?auto_560360 ?auto_560359 ) ( ON ?auto_560361 ?auto_560360 ) ( ON ?auto_560362 ?auto_560361 ) ( ON ?auto_560363 ?auto_560362 ) ( ON ?auto_560364 ?auto_560363 ) ( ON ?auto_560365 ?auto_560364 ) ( not ( = ?auto_560359 ?auto_560360 ) ) ( not ( = ?auto_560359 ?auto_560361 ) ) ( not ( = ?auto_560359 ?auto_560362 ) ) ( not ( = ?auto_560359 ?auto_560363 ) ) ( not ( = ?auto_560359 ?auto_560364 ) ) ( not ( = ?auto_560359 ?auto_560365 ) ) ( not ( = ?auto_560359 ?auto_560366 ) ) ( not ( = ?auto_560359 ?auto_560367 ) ) ( not ( = ?auto_560359 ?auto_560368 ) ) ( not ( = ?auto_560359 ?auto_560369 ) ) ( not ( = ?auto_560360 ?auto_560361 ) ) ( not ( = ?auto_560360 ?auto_560362 ) ) ( not ( = ?auto_560360 ?auto_560363 ) ) ( not ( = ?auto_560360 ?auto_560364 ) ) ( not ( = ?auto_560360 ?auto_560365 ) ) ( not ( = ?auto_560360 ?auto_560366 ) ) ( not ( = ?auto_560360 ?auto_560367 ) ) ( not ( = ?auto_560360 ?auto_560368 ) ) ( not ( = ?auto_560360 ?auto_560369 ) ) ( not ( = ?auto_560361 ?auto_560362 ) ) ( not ( = ?auto_560361 ?auto_560363 ) ) ( not ( = ?auto_560361 ?auto_560364 ) ) ( not ( = ?auto_560361 ?auto_560365 ) ) ( not ( = ?auto_560361 ?auto_560366 ) ) ( not ( = ?auto_560361 ?auto_560367 ) ) ( not ( = ?auto_560361 ?auto_560368 ) ) ( not ( = ?auto_560361 ?auto_560369 ) ) ( not ( = ?auto_560362 ?auto_560363 ) ) ( not ( = ?auto_560362 ?auto_560364 ) ) ( not ( = ?auto_560362 ?auto_560365 ) ) ( not ( = ?auto_560362 ?auto_560366 ) ) ( not ( = ?auto_560362 ?auto_560367 ) ) ( not ( = ?auto_560362 ?auto_560368 ) ) ( not ( = ?auto_560362 ?auto_560369 ) ) ( not ( = ?auto_560363 ?auto_560364 ) ) ( not ( = ?auto_560363 ?auto_560365 ) ) ( not ( = ?auto_560363 ?auto_560366 ) ) ( not ( = ?auto_560363 ?auto_560367 ) ) ( not ( = ?auto_560363 ?auto_560368 ) ) ( not ( = ?auto_560363 ?auto_560369 ) ) ( not ( = ?auto_560364 ?auto_560365 ) ) ( not ( = ?auto_560364 ?auto_560366 ) ) ( not ( = ?auto_560364 ?auto_560367 ) ) ( not ( = ?auto_560364 ?auto_560368 ) ) ( not ( = ?auto_560364 ?auto_560369 ) ) ( not ( = ?auto_560365 ?auto_560366 ) ) ( not ( = ?auto_560365 ?auto_560367 ) ) ( not ( = ?auto_560365 ?auto_560368 ) ) ( not ( = ?auto_560365 ?auto_560369 ) ) ( not ( = ?auto_560366 ?auto_560367 ) ) ( not ( = ?auto_560366 ?auto_560368 ) ) ( not ( = ?auto_560366 ?auto_560369 ) ) ( not ( = ?auto_560367 ?auto_560368 ) ) ( not ( = ?auto_560367 ?auto_560369 ) ) ( not ( = ?auto_560368 ?auto_560369 ) ) ( ON ?auto_560367 ?auto_560368 ) ( CLEAR ?auto_560365 ) ( ON ?auto_560366 ?auto_560367 ) ( CLEAR ?auto_560366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_560359 ?auto_560360 ?auto_560361 ?auto_560362 ?auto_560363 ?auto_560364 ?auto_560365 ?auto_560366 )
      ( MAKE-10PILE ?auto_560359 ?auto_560360 ?auto_560361 ?auto_560362 ?auto_560363 ?auto_560364 ?auto_560365 ?auto_560366 ?auto_560367 ?auto_560368 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560401 - BLOCK
      ?auto_560402 - BLOCK
      ?auto_560403 - BLOCK
      ?auto_560404 - BLOCK
      ?auto_560405 - BLOCK
      ?auto_560406 - BLOCK
      ?auto_560407 - BLOCK
      ?auto_560408 - BLOCK
      ?auto_560409 - BLOCK
      ?auto_560410 - BLOCK
    )
    :vars
    (
      ?auto_560411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560410 ?auto_560411 ) ( ON-TABLE ?auto_560401 ) ( ON ?auto_560402 ?auto_560401 ) ( ON ?auto_560403 ?auto_560402 ) ( ON ?auto_560404 ?auto_560403 ) ( ON ?auto_560405 ?auto_560404 ) ( ON ?auto_560406 ?auto_560405 ) ( not ( = ?auto_560401 ?auto_560402 ) ) ( not ( = ?auto_560401 ?auto_560403 ) ) ( not ( = ?auto_560401 ?auto_560404 ) ) ( not ( = ?auto_560401 ?auto_560405 ) ) ( not ( = ?auto_560401 ?auto_560406 ) ) ( not ( = ?auto_560401 ?auto_560407 ) ) ( not ( = ?auto_560401 ?auto_560408 ) ) ( not ( = ?auto_560401 ?auto_560409 ) ) ( not ( = ?auto_560401 ?auto_560410 ) ) ( not ( = ?auto_560401 ?auto_560411 ) ) ( not ( = ?auto_560402 ?auto_560403 ) ) ( not ( = ?auto_560402 ?auto_560404 ) ) ( not ( = ?auto_560402 ?auto_560405 ) ) ( not ( = ?auto_560402 ?auto_560406 ) ) ( not ( = ?auto_560402 ?auto_560407 ) ) ( not ( = ?auto_560402 ?auto_560408 ) ) ( not ( = ?auto_560402 ?auto_560409 ) ) ( not ( = ?auto_560402 ?auto_560410 ) ) ( not ( = ?auto_560402 ?auto_560411 ) ) ( not ( = ?auto_560403 ?auto_560404 ) ) ( not ( = ?auto_560403 ?auto_560405 ) ) ( not ( = ?auto_560403 ?auto_560406 ) ) ( not ( = ?auto_560403 ?auto_560407 ) ) ( not ( = ?auto_560403 ?auto_560408 ) ) ( not ( = ?auto_560403 ?auto_560409 ) ) ( not ( = ?auto_560403 ?auto_560410 ) ) ( not ( = ?auto_560403 ?auto_560411 ) ) ( not ( = ?auto_560404 ?auto_560405 ) ) ( not ( = ?auto_560404 ?auto_560406 ) ) ( not ( = ?auto_560404 ?auto_560407 ) ) ( not ( = ?auto_560404 ?auto_560408 ) ) ( not ( = ?auto_560404 ?auto_560409 ) ) ( not ( = ?auto_560404 ?auto_560410 ) ) ( not ( = ?auto_560404 ?auto_560411 ) ) ( not ( = ?auto_560405 ?auto_560406 ) ) ( not ( = ?auto_560405 ?auto_560407 ) ) ( not ( = ?auto_560405 ?auto_560408 ) ) ( not ( = ?auto_560405 ?auto_560409 ) ) ( not ( = ?auto_560405 ?auto_560410 ) ) ( not ( = ?auto_560405 ?auto_560411 ) ) ( not ( = ?auto_560406 ?auto_560407 ) ) ( not ( = ?auto_560406 ?auto_560408 ) ) ( not ( = ?auto_560406 ?auto_560409 ) ) ( not ( = ?auto_560406 ?auto_560410 ) ) ( not ( = ?auto_560406 ?auto_560411 ) ) ( not ( = ?auto_560407 ?auto_560408 ) ) ( not ( = ?auto_560407 ?auto_560409 ) ) ( not ( = ?auto_560407 ?auto_560410 ) ) ( not ( = ?auto_560407 ?auto_560411 ) ) ( not ( = ?auto_560408 ?auto_560409 ) ) ( not ( = ?auto_560408 ?auto_560410 ) ) ( not ( = ?auto_560408 ?auto_560411 ) ) ( not ( = ?auto_560409 ?auto_560410 ) ) ( not ( = ?auto_560409 ?auto_560411 ) ) ( not ( = ?auto_560410 ?auto_560411 ) ) ( ON ?auto_560409 ?auto_560410 ) ( ON ?auto_560408 ?auto_560409 ) ( CLEAR ?auto_560406 ) ( ON ?auto_560407 ?auto_560408 ) ( CLEAR ?auto_560407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_560401 ?auto_560402 ?auto_560403 ?auto_560404 ?auto_560405 ?auto_560406 ?auto_560407 )
      ( MAKE-10PILE ?auto_560401 ?auto_560402 ?auto_560403 ?auto_560404 ?auto_560405 ?auto_560406 ?auto_560407 ?auto_560408 ?auto_560409 ?auto_560410 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560443 - BLOCK
      ?auto_560444 - BLOCK
      ?auto_560445 - BLOCK
      ?auto_560446 - BLOCK
      ?auto_560447 - BLOCK
      ?auto_560448 - BLOCK
      ?auto_560449 - BLOCK
      ?auto_560450 - BLOCK
      ?auto_560451 - BLOCK
      ?auto_560452 - BLOCK
    )
    :vars
    (
      ?auto_560453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560452 ?auto_560453 ) ( ON-TABLE ?auto_560443 ) ( ON ?auto_560444 ?auto_560443 ) ( ON ?auto_560445 ?auto_560444 ) ( ON ?auto_560446 ?auto_560445 ) ( ON ?auto_560447 ?auto_560446 ) ( not ( = ?auto_560443 ?auto_560444 ) ) ( not ( = ?auto_560443 ?auto_560445 ) ) ( not ( = ?auto_560443 ?auto_560446 ) ) ( not ( = ?auto_560443 ?auto_560447 ) ) ( not ( = ?auto_560443 ?auto_560448 ) ) ( not ( = ?auto_560443 ?auto_560449 ) ) ( not ( = ?auto_560443 ?auto_560450 ) ) ( not ( = ?auto_560443 ?auto_560451 ) ) ( not ( = ?auto_560443 ?auto_560452 ) ) ( not ( = ?auto_560443 ?auto_560453 ) ) ( not ( = ?auto_560444 ?auto_560445 ) ) ( not ( = ?auto_560444 ?auto_560446 ) ) ( not ( = ?auto_560444 ?auto_560447 ) ) ( not ( = ?auto_560444 ?auto_560448 ) ) ( not ( = ?auto_560444 ?auto_560449 ) ) ( not ( = ?auto_560444 ?auto_560450 ) ) ( not ( = ?auto_560444 ?auto_560451 ) ) ( not ( = ?auto_560444 ?auto_560452 ) ) ( not ( = ?auto_560444 ?auto_560453 ) ) ( not ( = ?auto_560445 ?auto_560446 ) ) ( not ( = ?auto_560445 ?auto_560447 ) ) ( not ( = ?auto_560445 ?auto_560448 ) ) ( not ( = ?auto_560445 ?auto_560449 ) ) ( not ( = ?auto_560445 ?auto_560450 ) ) ( not ( = ?auto_560445 ?auto_560451 ) ) ( not ( = ?auto_560445 ?auto_560452 ) ) ( not ( = ?auto_560445 ?auto_560453 ) ) ( not ( = ?auto_560446 ?auto_560447 ) ) ( not ( = ?auto_560446 ?auto_560448 ) ) ( not ( = ?auto_560446 ?auto_560449 ) ) ( not ( = ?auto_560446 ?auto_560450 ) ) ( not ( = ?auto_560446 ?auto_560451 ) ) ( not ( = ?auto_560446 ?auto_560452 ) ) ( not ( = ?auto_560446 ?auto_560453 ) ) ( not ( = ?auto_560447 ?auto_560448 ) ) ( not ( = ?auto_560447 ?auto_560449 ) ) ( not ( = ?auto_560447 ?auto_560450 ) ) ( not ( = ?auto_560447 ?auto_560451 ) ) ( not ( = ?auto_560447 ?auto_560452 ) ) ( not ( = ?auto_560447 ?auto_560453 ) ) ( not ( = ?auto_560448 ?auto_560449 ) ) ( not ( = ?auto_560448 ?auto_560450 ) ) ( not ( = ?auto_560448 ?auto_560451 ) ) ( not ( = ?auto_560448 ?auto_560452 ) ) ( not ( = ?auto_560448 ?auto_560453 ) ) ( not ( = ?auto_560449 ?auto_560450 ) ) ( not ( = ?auto_560449 ?auto_560451 ) ) ( not ( = ?auto_560449 ?auto_560452 ) ) ( not ( = ?auto_560449 ?auto_560453 ) ) ( not ( = ?auto_560450 ?auto_560451 ) ) ( not ( = ?auto_560450 ?auto_560452 ) ) ( not ( = ?auto_560450 ?auto_560453 ) ) ( not ( = ?auto_560451 ?auto_560452 ) ) ( not ( = ?auto_560451 ?auto_560453 ) ) ( not ( = ?auto_560452 ?auto_560453 ) ) ( ON ?auto_560451 ?auto_560452 ) ( ON ?auto_560450 ?auto_560451 ) ( ON ?auto_560449 ?auto_560450 ) ( CLEAR ?auto_560447 ) ( ON ?auto_560448 ?auto_560449 ) ( CLEAR ?auto_560448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_560443 ?auto_560444 ?auto_560445 ?auto_560446 ?auto_560447 ?auto_560448 )
      ( MAKE-10PILE ?auto_560443 ?auto_560444 ?auto_560445 ?auto_560446 ?auto_560447 ?auto_560448 ?auto_560449 ?auto_560450 ?auto_560451 ?auto_560452 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560485 - BLOCK
      ?auto_560486 - BLOCK
      ?auto_560487 - BLOCK
      ?auto_560488 - BLOCK
      ?auto_560489 - BLOCK
      ?auto_560490 - BLOCK
      ?auto_560491 - BLOCK
      ?auto_560492 - BLOCK
      ?auto_560493 - BLOCK
      ?auto_560494 - BLOCK
    )
    :vars
    (
      ?auto_560495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560494 ?auto_560495 ) ( ON-TABLE ?auto_560485 ) ( ON ?auto_560486 ?auto_560485 ) ( ON ?auto_560487 ?auto_560486 ) ( ON ?auto_560488 ?auto_560487 ) ( not ( = ?auto_560485 ?auto_560486 ) ) ( not ( = ?auto_560485 ?auto_560487 ) ) ( not ( = ?auto_560485 ?auto_560488 ) ) ( not ( = ?auto_560485 ?auto_560489 ) ) ( not ( = ?auto_560485 ?auto_560490 ) ) ( not ( = ?auto_560485 ?auto_560491 ) ) ( not ( = ?auto_560485 ?auto_560492 ) ) ( not ( = ?auto_560485 ?auto_560493 ) ) ( not ( = ?auto_560485 ?auto_560494 ) ) ( not ( = ?auto_560485 ?auto_560495 ) ) ( not ( = ?auto_560486 ?auto_560487 ) ) ( not ( = ?auto_560486 ?auto_560488 ) ) ( not ( = ?auto_560486 ?auto_560489 ) ) ( not ( = ?auto_560486 ?auto_560490 ) ) ( not ( = ?auto_560486 ?auto_560491 ) ) ( not ( = ?auto_560486 ?auto_560492 ) ) ( not ( = ?auto_560486 ?auto_560493 ) ) ( not ( = ?auto_560486 ?auto_560494 ) ) ( not ( = ?auto_560486 ?auto_560495 ) ) ( not ( = ?auto_560487 ?auto_560488 ) ) ( not ( = ?auto_560487 ?auto_560489 ) ) ( not ( = ?auto_560487 ?auto_560490 ) ) ( not ( = ?auto_560487 ?auto_560491 ) ) ( not ( = ?auto_560487 ?auto_560492 ) ) ( not ( = ?auto_560487 ?auto_560493 ) ) ( not ( = ?auto_560487 ?auto_560494 ) ) ( not ( = ?auto_560487 ?auto_560495 ) ) ( not ( = ?auto_560488 ?auto_560489 ) ) ( not ( = ?auto_560488 ?auto_560490 ) ) ( not ( = ?auto_560488 ?auto_560491 ) ) ( not ( = ?auto_560488 ?auto_560492 ) ) ( not ( = ?auto_560488 ?auto_560493 ) ) ( not ( = ?auto_560488 ?auto_560494 ) ) ( not ( = ?auto_560488 ?auto_560495 ) ) ( not ( = ?auto_560489 ?auto_560490 ) ) ( not ( = ?auto_560489 ?auto_560491 ) ) ( not ( = ?auto_560489 ?auto_560492 ) ) ( not ( = ?auto_560489 ?auto_560493 ) ) ( not ( = ?auto_560489 ?auto_560494 ) ) ( not ( = ?auto_560489 ?auto_560495 ) ) ( not ( = ?auto_560490 ?auto_560491 ) ) ( not ( = ?auto_560490 ?auto_560492 ) ) ( not ( = ?auto_560490 ?auto_560493 ) ) ( not ( = ?auto_560490 ?auto_560494 ) ) ( not ( = ?auto_560490 ?auto_560495 ) ) ( not ( = ?auto_560491 ?auto_560492 ) ) ( not ( = ?auto_560491 ?auto_560493 ) ) ( not ( = ?auto_560491 ?auto_560494 ) ) ( not ( = ?auto_560491 ?auto_560495 ) ) ( not ( = ?auto_560492 ?auto_560493 ) ) ( not ( = ?auto_560492 ?auto_560494 ) ) ( not ( = ?auto_560492 ?auto_560495 ) ) ( not ( = ?auto_560493 ?auto_560494 ) ) ( not ( = ?auto_560493 ?auto_560495 ) ) ( not ( = ?auto_560494 ?auto_560495 ) ) ( ON ?auto_560493 ?auto_560494 ) ( ON ?auto_560492 ?auto_560493 ) ( ON ?auto_560491 ?auto_560492 ) ( ON ?auto_560490 ?auto_560491 ) ( CLEAR ?auto_560488 ) ( ON ?auto_560489 ?auto_560490 ) ( CLEAR ?auto_560489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_560485 ?auto_560486 ?auto_560487 ?auto_560488 ?auto_560489 )
      ( MAKE-10PILE ?auto_560485 ?auto_560486 ?auto_560487 ?auto_560488 ?auto_560489 ?auto_560490 ?auto_560491 ?auto_560492 ?auto_560493 ?auto_560494 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560527 - BLOCK
      ?auto_560528 - BLOCK
      ?auto_560529 - BLOCK
      ?auto_560530 - BLOCK
      ?auto_560531 - BLOCK
      ?auto_560532 - BLOCK
      ?auto_560533 - BLOCK
      ?auto_560534 - BLOCK
      ?auto_560535 - BLOCK
      ?auto_560536 - BLOCK
    )
    :vars
    (
      ?auto_560537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560536 ?auto_560537 ) ( ON-TABLE ?auto_560527 ) ( ON ?auto_560528 ?auto_560527 ) ( ON ?auto_560529 ?auto_560528 ) ( not ( = ?auto_560527 ?auto_560528 ) ) ( not ( = ?auto_560527 ?auto_560529 ) ) ( not ( = ?auto_560527 ?auto_560530 ) ) ( not ( = ?auto_560527 ?auto_560531 ) ) ( not ( = ?auto_560527 ?auto_560532 ) ) ( not ( = ?auto_560527 ?auto_560533 ) ) ( not ( = ?auto_560527 ?auto_560534 ) ) ( not ( = ?auto_560527 ?auto_560535 ) ) ( not ( = ?auto_560527 ?auto_560536 ) ) ( not ( = ?auto_560527 ?auto_560537 ) ) ( not ( = ?auto_560528 ?auto_560529 ) ) ( not ( = ?auto_560528 ?auto_560530 ) ) ( not ( = ?auto_560528 ?auto_560531 ) ) ( not ( = ?auto_560528 ?auto_560532 ) ) ( not ( = ?auto_560528 ?auto_560533 ) ) ( not ( = ?auto_560528 ?auto_560534 ) ) ( not ( = ?auto_560528 ?auto_560535 ) ) ( not ( = ?auto_560528 ?auto_560536 ) ) ( not ( = ?auto_560528 ?auto_560537 ) ) ( not ( = ?auto_560529 ?auto_560530 ) ) ( not ( = ?auto_560529 ?auto_560531 ) ) ( not ( = ?auto_560529 ?auto_560532 ) ) ( not ( = ?auto_560529 ?auto_560533 ) ) ( not ( = ?auto_560529 ?auto_560534 ) ) ( not ( = ?auto_560529 ?auto_560535 ) ) ( not ( = ?auto_560529 ?auto_560536 ) ) ( not ( = ?auto_560529 ?auto_560537 ) ) ( not ( = ?auto_560530 ?auto_560531 ) ) ( not ( = ?auto_560530 ?auto_560532 ) ) ( not ( = ?auto_560530 ?auto_560533 ) ) ( not ( = ?auto_560530 ?auto_560534 ) ) ( not ( = ?auto_560530 ?auto_560535 ) ) ( not ( = ?auto_560530 ?auto_560536 ) ) ( not ( = ?auto_560530 ?auto_560537 ) ) ( not ( = ?auto_560531 ?auto_560532 ) ) ( not ( = ?auto_560531 ?auto_560533 ) ) ( not ( = ?auto_560531 ?auto_560534 ) ) ( not ( = ?auto_560531 ?auto_560535 ) ) ( not ( = ?auto_560531 ?auto_560536 ) ) ( not ( = ?auto_560531 ?auto_560537 ) ) ( not ( = ?auto_560532 ?auto_560533 ) ) ( not ( = ?auto_560532 ?auto_560534 ) ) ( not ( = ?auto_560532 ?auto_560535 ) ) ( not ( = ?auto_560532 ?auto_560536 ) ) ( not ( = ?auto_560532 ?auto_560537 ) ) ( not ( = ?auto_560533 ?auto_560534 ) ) ( not ( = ?auto_560533 ?auto_560535 ) ) ( not ( = ?auto_560533 ?auto_560536 ) ) ( not ( = ?auto_560533 ?auto_560537 ) ) ( not ( = ?auto_560534 ?auto_560535 ) ) ( not ( = ?auto_560534 ?auto_560536 ) ) ( not ( = ?auto_560534 ?auto_560537 ) ) ( not ( = ?auto_560535 ?auto_560536 ) ) ( not ( = ?auto_560535 ?auto_560537 ) ) ( not ( = ?auto_560536 ?auto_560537 ) ) ( ON ?auto_560535 ?auto_560536 ) ( ON ?auto_560534 ?auto_560535 ) ( ON ?auto_560533 ?auto_560534 ) ( ON ?auto_560532 ?auto_560533 ) ( ON ?auto_560531 ?auto_560532 ) ( CLEAR ?auto_560529 ) ( ON ?auto_560530 ?auto_560531 ) ( CLEAR ?auto_560530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_560527 ?auto_560528 ?auto_560529 ?auto_560530 )
      ( MAKE-10PILE ?auto_560527 ?auto_560528 ?auto_560529 ?auto_560530 ?auto_560531 ?auto_560532 ?auto_560533 ?auto_560534 ?auto_560535 ?auto_560536 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560569 - BLOCK
      ?auto_560570 - BLOCK
      ?auto_560571 - BLOCK
      ?auto_560572 - BLOCK
      ?auto_560573 - BLOCK
      ?auto_560574 - BLOCK
      ?auto_560575 - BLOCK
      ?auto_560576 - BLOCK
      ?auto_560577 - BLOCK
      ?auto_560578 - BLOCK
    )
    :vars
    (
      ?auto_560579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560578 ?auto_560579 ) ( ON-TABLE ?auto_560569 ) ( ON ?auto_560570 ?auto_560569 ) ( not ( = ?auto_560569 ?auto_560570 ) ) ( not ( = ?auto_560569 ?auto_560571 ) ) ( not ( = ?auto_560569 ?auto_560572 ) ) ( not ( = ?auto_560569 ?auto_560573 ) ) ( not ( = ?auto_560569 ?auto_560574 ) ) ( not ( = ?auto_560569 ?auto_560575 ) ) ( not ( = ?auto_560569 ?auto_560576 ) ) ( not ( = ?auto_560569 ?auto_560577 ) ) ( not ( = ?auto_560569 ?auto_560578 ) ) ( not ( = ?auto_560569 ?auto_560579 ) ) ( not ( = ?auto_560570 ?auto_560571 ) ) ( not ( = ?auto_560570 ?auto_560572 ) ) ( not ( = ?auto_560570 ?auto_560573 ) ) ( not ( = ?auto_560570 ?auto_560574 ) ) ( not ( = ?auto_560570 ?auto_560575 ) ) ( not ( = ?auto_560570 ?auto_560576 ) ) ( not ( = ?auto_560570 ?auto_560577 ) ) ( not ( = ?auto_560570 ?auto_560578 ) ) ( not ( = ?auto_560570 ?auto_560579 ) ) ( not ( = ?auto_560571 ?auto_560572 ) ) ( not ( = ?auto_560571 ?auto_560573 ) ) ( not ( = ?auto_560571 ?auto_560574 ) ) ( not ( = ?auto_560571 ?auto_560575 ) ) ( not ( = ?auto_560571 ?auto_560576 ) ) ( not ( = ?auto_560571 ?auto_560577 ) ) ( not ( = ?auto_560571 ?auto_560578 ) ) ( not ( = ?auto_560571 ?auto_560579 ) ) ( not ( = ?auto_560572 ?auto_560573 ) ) ( not ( = ?auto_560572 ?auto_560574 ) ) ( not ( = ?auto_560572 ?auto_560575 ) ) ( not ( = ?auto_560572 ?auto_560576 ) ) ( not ( = ?auto_560572 ?auto_560577 ) ) ( not ( = ?auto_560572 ?auto_560578 ) ) ( not ( = ?auto_560572 ?auto_560579 ) ) ( not ( = ?auto_560573 ?auto_560574 ) ) ( not ( = ?auto_560573 ?auto_560575 ) ) ( not ( = ?auto_560573 ?auto_560576 ) ) ( not ( = ?auto_560573 ?auto_560577 ) ) ( not ( = ?auto_560573 ?auto_560578 ) ) ( not ( = ?auto_560573 ?auto_560579 ) ) ( not ( = ?auto_560574 ?auto_560575 ) ) ( not ( = ?auto_560574 ?auto_560576 ) ) ( not ( = ?auto_560574 ?auto_560577 ) ) ( not ( = ?auto_560574 ?auto_560578 ) ) ( not ( = ?auto_560574 ?auto_560579 ) ) ( not ( = ?auto_560575 ?auto_560576 ) ) ( not ( = ?auto_560575 ?auto_560577 ) ) ( not ( = ?auto_560575 ?auto_560578 ) ) ( not ( = ?auto_560575 ?auto_560579 ) ) ( not ( = ?auto_560576 ?auto_560577 ) ) ( not ( = ?auto_560576 ?auto_560578 ) ) ( not ( = ?auto_560576 ?auto_560579 ) ) ( not ( = ?auto_560577 ?auto_560578 ) ) ( not ( = ?auto_560577 ?auto_560579 ) ) ( not ( = ?auto_560578 ?auto_560579 ) ) ( ON ?auto_560577 ?auto_560578 ) ( ON ?auto_560576 ?auto_560577 ) ( ON ?auto_560575 ?auto_560576 ) ( ON ?auto_560574 ?auto_560575 ) ( ON ?auto_560573 ?auto_560574 ) ( ON ?auto_560572 ?auto_560573 ) ( CLEAR ?auto_560570 ) ( ON ?auto_560571 ?auto_560572 ) ( CLEAR ?auto_560571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_560569 ?auto_560570 ?auto_560571 )
      ( MAKE-10PILE ?auto_560569 ?auto_560570 ?auto_560571 ?auto_560572 ?auto_560573 ?auto_560574 ?auto_560575 ?auto_560576 ?auto_560577 ?auto_560578 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560611 - BLOCK
      ?auto_560612 - BLOCK
      ?auto_560613 - BLOCK
      ?auto_560614 - BLOCK
      ?auto_560615 - BLOCK
      ?auto_560616 - BLOCK
      ?auto_560617 - BLOCK
      ?auto_560618 - BLOCK
      ?auto_560619 - BLOCK
      ?auto_560620 - BLOCK
    )
    :vars
    (
      ?auto_560621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560620 ?auto_560621 ) ( ON-TABLE ?auto_560611 ) ( not ( = ?auto_560611 ?auto_560612 ) ) ( not ( = ?auto_560611 ?auto_560613 ) ) ( not ( = ?auto_560611 ?auto_560614 ) ) ( not ( = ?auto_560611 ?auto_560615 ) ) ( not ( = ?auto_560611 ?auto_560616 ) ) ( not ( = ?auto_560611 ?auto_560617 ) ) ( not ( = ?auto_560611 ?auto_560618 ) ) ( not ( = ?auto_560611 ?auto_560619 ) ) ( not ( = ?auto_560611 ?auto_560620 ) ) ( not ( = ?auto_560611 ?auto_560621 ) ) ( not ( = ?auto_560612 ?auto_560613 ) ) ( not ( = ?auto_560612 ?auto_560614 ) ) ( not ( = ?auto_560612 ?auto_560615 ) ) ( not ( = ?auto_560612 ?auto_560616 ) ) ( not ( = ?auto_560612 ?auto_560617 ) ) ( not ( = ?auto_560612 ?auto_560618 ) ) ( not ( = ?auto_560612 ?auto_560619 ) ) ( not ( = ?auto_560612 ?auto_560620 ) ) ( not ( = ?auto_560612 ?auto_560621 ) ) ( not ( = ?auto_560613 ?auto_560614 ) ) ( not ( = ?auto_560613 ?auto_560615 ) ) ( not ( = ?auto_560613 ?auto_560616 ) ) ( not ( = ?auto_560613 ?auto_560617 ) ) ( not ( = ?auto_560613 ?auto_560618 ) ) ( not ( = ?auto_560613 ?auto_560619 ) ) ( not ( = ?auto_560613 ?auto_560620 ) ) ( not ( = ?auto_560613 ?auto_560621 ) ) ( not ( = ?auto_560614 ?auto_560615 ) ) ( not ( = ?auto_560614 ?auto_560616 ) ) ( not ( = ?auto_560614 ?auto_560617 ) ) ( not ( = ?auto_560614 ?auto_560618 ) ) ( not ( = ?auto_560614 ?auto_560619 ) ) ( not ( = ?auto_560614 ?auto_560620 ) ) ( not ( = ?auto_560614 ?auto_560621 ) ) ( not ( = ?auto_560615 ?auto_560616 ) ) ( not ( = ?auto_560615 ?auto_560617 ) ) ( not ( = ?auto_560615 ?auto_560618 ) ) ( not ( = ?auto_560615 ?auto_560619 ) ) ( not ( = ?auto_560615 ?auto_560620 ) ) ( not ( = ?auto_560615 ?auto_560621 ) ) ( not ( = ?auto_560616 ?auto_560617 ) ) ( not ( = ?auto_560616 ?auto_560618 ) ) ( not ( = ?auto_560616 ?auto_560619 ) ) ( not ( = ?auto_560616 ?auto_560620 ) ) ( not ( = ?auto_560616 ?auto_560621 ) ) ( not ( = ?auto_560617 ?auto_560618 ) ) ( not ( = ?auto_560617 ?auto_560619 ) ) ( not ( = ?auto_560617 ?auto_560620 ) ) ( not ( = ?auto_560617 ?auto_560621 ) ) ( not ( = ?auto_560618 ?auto_560619 ) ) ( not ( = ?auto_560618 ?auto_560620 ) ) ( not ( = ?auto_560618 ?auto_560621 ) ) ( not ( = ?auto_560619 ?auto_560620 ) ) ( not ( = ?auto_560619 ?auto_560621 ) ) ( not ( = ?auto_560620 ?auto_560621 ) ) ( ON ?auto_560619 ?auto_560620 ) ( ON ?auto_560618 ?auto_560619 ) ( ON ?auto_560617 ?auto_560618 ) ( ON ?auto_560616 ?auto_560617 ) ( ON ?auto_560615 ?auto_560616 ) ( ON ?auto_560614 ?auto_560615 ) ( ON ?auto_560613 ?auto_560614 ) ( CLEAR ?auto_560611 ) ( ON ?auto_560612 ?auto_560613 ) ( CLEAR ?auto_560612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_560611 ?auto_560612 )
      ( MAKE-10PILE ?auto_560611 ?auto_560612 ?auto_560613 ?auto_560614 ?auto_560615 ?auto_560616 ?auto_560617 ?auto_560618 ?auto_560619 ?auto_560620 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_560653 - BLOCK
      ?auto_560654 - BLOCK
      ?auto_560655 - BLOCK
      ?auto_560656 - BLOCK
      ?auto_560657 - BLOCK
      ?auto_560658 - BLOCK
      ?auto_560659 - BLOCK
      ?auto_560660 - BLOCK
      ?auto_560661 - BLOCK
      ?auto_560662 - BLOCK
    )
    :vars
    (
      ?auto_560663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560662 ?auto_560663 ) ( not ( = ?auto_560653 ?auto_560654 ) ) ( not ( = ?auto_560653 ?auto_560655 ) ) ( not ( = ?auto_560653 ?auto_560656 ) ) ( not ( = ?auto_560653 ?auto_560657 ) ) ( not ( = ?auto_560653 ?auto_560658 ) ) ( not ( = ?auto_560653 ?auto_560659 ) ) ( not ( = ?auto_560653 ?auto_560660 ) ) ( not ( = ?auto_560653 ?auto_560661 ) ) ( not ( = ?auto_560653 ?auto_560662 ) ) ( not ( = ?auto_560653 ?auto_560663 ) ) ( not ( = ?auto_560654 ?auto_560655 ) ) ( not ( = ?auto_560654 ?auto_560656 ) ) ( not ( = ?auto_560654 ?auto_560657 ) ) ( not ( = ?auto_560654 ?auto_560658 ) ) ( not ( = ?auto_560654 ?auto_560659 ) ) ( not ( = ?auto_560654 ?auto_560660 ) ) ( not ( = ?auto_560654 ?auto_560661 ) ) ( not ( = ?auto_560654 ?auto_560662 ) ) ( not ( = ?auto_560654 ?auto_560663 ) ) ( not ( = ?auto_560655 ?auto_560656 ) ) ( not ( = ?auto_560655 ?auto_560657 ) ) ( not ( = ?auto_560655 ?auto_560658 ) ) ( not ( = ?auto_560655 ?auto_560659 ) ) ( not ( = ?auto_560655 ?auto_560660 ) ) ( not ( = ?auto_560655 ?auto_560661 ) ) ( not ( = ?auto_560655 ?auto_560662 ) ) ( not ( = ?auto_560655 ?auto_560663 ) ) ( not ( = ?auto_560656 ?auto_560657 ) ) ( not ( = ?auto_560656 ?auto_560658 ) ) ( not ( = ?auto_560656 ?auto_560659 ) ) ( not ( = ?auto_560656 ?auto_560660 ) ) ( not ( = ?auto_560656 ?auto_560661 ) ) ( not ( = ?auto_560656 ?auto_560662 ) ) ( not ( = ?auto_560656 ?auto_560663 ) ) ( not ( = ?auto_560657 ?auto_560658 ) ) ( not ( = ?auto_560657 ?auto_560659 ) ) ( not ( = ?auto_560657 ?auto_560660 ) ) ( not ( = ?auto_560657 ?auto_560661 ) ) ( not ( = ?auto_560657 ?auto_560662 ) ) ( not ( = ?auto_560657 ?auto_560663 ) ) ( not ( = ?auto_560658 ?auto_560659 ) ) ( not ( = ?auto_560658 ?auto_560660 ) ) ( not ( = ?auto_560658 ?auto_560661 ) ) ( not ( = ?auto_560658 ?auto_560662 ) ) ( not ( = ?auto_560658 ?auto_560663 ) ) ( not ( = ?auto_560659 ?auto_560660 ) ) ( not ( = ?auto_560659 ?auto_560661 ) ) ( not ( = ?auto_560659 ?auto_560662 ) ) ( not ( = ?auto_560659 ?auto_560663 ) ) ( not ( = ?auto_560660 ?auto_560661 ) ) ( not ( = ?auto_560660 ?auto_560662 ) ) ( not ( = ?auto_560660 ?auto_560663 ) ) ( not ( = ?auto_560661 ?auto_560662 ) ) ( not ( = ?auto_560661 ?auto_560663 ) ) ( not ( = ?auto_560662 ?auto_560663 ) ) ( ON ?auto_560661 ?auto_560662 ) ( ON ?auto_560660 ?auto_560661 ) ( ON ?auto_560659 ?auto_560660 ) ( ON ?auto_560658 ?auto_560659 ) ( ON ?auto_560657 ?auto_560658 ) ( ON ?auto_560656 ?auto_560657 ) ( ON ?auto_560655 ?auto_560656 ) ( ON ?auto_560654 ?auto_560655 ) ( ON ?auto_560653 ?auto_560654 ) ( CLEAR ?auto_560653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_560653 )
      ( MAKE-10PILE ?auto_560653 ?auto_560654 ?auto_560655 ?auto_560656 ?auto_560657 ?auto_560658 ?auto_560659 ?auto_560660 ?auto_560661 ?auto_560662 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560696 - BLOCK
      ?auto_560697 - BLOCK
      ?auto_560698 - BLOCK
      ?auto_560699 - BLOCK
      ?auto_560700 - BLOCK
      ?auto_560701 - BLOCK
      ?auto_560702 - BLOCK
      ?auto_560703 - BLOCK
      ?auto_560704 - BLOCK
      ?auto_560705 - BLOCK
      ?auto_560706 - BLOCK
    )
    :vars
    (
      ?auto_560707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_560705 ) ( ON ?auto_560706 ?auto_560707 ) ( CLEAR ?auto_560706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_560696 ) ( ON ?auto_560697 ?auto_560696 ) ( ON ?auto_560698 ?auto_560697 ) ( ON ?auto_560699 ?auto_560698 ) ( ON ?auto_560700 ?auto_560699 ) ( ON ?auto_560701 ?auto_560700 ) ( ON ?auto_560702 ?auto_560701 ) ( ON ?auto_560703 ?auto_560702 ) ( ON ?auto_560704 ?auto_560703 ) ( ON ?auto_560705 ?auto_560704 ) ( not ( = ?auto_560696 ?auto_560697 ) ) ( not ( = ?auto_560696 ?auto_560698 ) ) ( not ( = ?auto_560696 ?auto_560699 ) ) ( not ( = ?auto_560696 ?auto_560700 ) ) ( not ( = ?auto_560696 ?auto_560701 ) ) ( not ( = ?auto_560696 ?auto_560702 ) ) ( not ( = ?auto_560696 ?auto_560703 ) ) ( not ( = ?auto_560696 ?auto_560704 ) ) ( not ( = ?auto_560696 ?auto_560705 ) ) ( not ( = ?auto_560696 ?auto_560706 ) ) ( not ( = ?auto_560696 ?auto_560707 ) ) ( not ( = ?auto_560697 ?auto_560698 ) ) ( not ( = ?auto_560697 ?auto_560699 ) ) ( not ( = ?auto_560697 ?auto_560700 ) ) ( not ( = ?auto_560697 ?auto_560701 ) ) ( not ( = ?auto_560697 ?auto_560702 ) ) ( not ( = ?auto_560697 ?auto_560703 ) ) ( not ( = ?auto_560697 ?auto_560704 ) ) ( not ( = ?auto_560697 ?auto_560705 ) ) ( not ( = ?auto_560697 ?auto_560706 ) ) ( not ( = ?auto_560697 ?auto_560707 ) ) ( not ( = ?auto_560698 ?auto_560699 ) ) ( not ( = ?auto_560698 ?auto_560700 ) ) ( not ( = ?auto_560698 ?auto_560701 ) ) ( not ( = ?auto_560698 ?auto_560702 ) ) ( not ( = ?auto_560698 ?auto_560703 ) ) ( not ( = ?auto_560698 ?auto_560704 ) ) ( not ( = ?auto_560698 ?auto_560705 ) ) ( not ( = ?auto_560698 ?auto_560706 ) ) ( not ( = ?auto_560698 ?auto_560707 ) ) ( not ( = ?auto_560699 ?auto_560700 ) ) ( not ( = ?auto_560699 ?auto_560701 ) ) ( not ( = ?auto_560699 ?auto_560702 ) ) ( not ( = ?auto_560699 ?auto_560703 ) ) ( not ( = ?auto_560699 ?auto_560704 ) ) ( not ( = ?auto_560699 ?auto_560705 ) ) ( not ( = ?auto_560699 ?auto_560706 ) ) ( not ( = ?auto_560699 ?auto_560707 ) ) ( not ( = ?auto_560700 ?auto_560701 ) ) ( not ( = ?auto_560700 ?auto_560702 ) ) ( not ( = ?auto_560700 ?auto_560703 ) ) ( not ( = ?auto_560700 ?auto_560704 ) ) ( not ( = ?auto_560700 ?auto_560705 ) ) ( not ( = ?auto_560700 ?auto_560706 ) ) ( not ( = ?auto_560700 ?auto_560707 ) ) ( not ( = ?auto_560701 ?auto_560702 ) ) ( not ( = ?auto_560701 ?auto_560703 ) ) ( not ( = ?auto_560701 ?auto_560704 ) ) ( not ( = ?auto_560701 ?auto_560705 ) ) ( not ( = ?auto_560701 ?auto_560706 ) ) ( not ( = ?auto_560701 ?auto_560707 ) ) ( not ( = ?auto_560702 ?auto_560703 ) ) ( not ( = ?auto_560702 ?auto_560704 ) ) ( not ( = ?auto_560702 ?auto_560705 ) ) ( not ( = ?auto_560702 ?auto_560706 ) ) ( not ( = ?auto_560702 ?auto_560707 ) ) ( not ( = ?auto_560703 ?auto_560704 ) ) ( not ( = ?auto_560703 ?auto_560705 ) ) ( not ( = ?auto_560703 ?auto_560706 ) ) ( not ( = ?auto_560703 ?auto_560707 ) ) ( not ( = ?auto_560704 ?auto_560705 ) ) ( not ( = ?auto_560704 ?auto_560706 ) ) ( not ( = ?auto_560704 ?auto_560707 ) ) ( not ( = ?auto_560705 ?auto_560706 ) ) ( not ( = ?auto_560705 ?auto_560707 ) ) ( not ( = ?auto_560706 ?auto_560707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_560706 ?auto_560707 )
      ( !STACK ?auto_560706 ?auto_560705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560742 - BLOCK
      ?auto_560743 - BLOCK
      ?auto_560744 - BLOCK
      ?auto_560745 - BLOCK
      ?auto_560746 - BLOCK
      ?auto_560747 - BLOCK
      ?auto_560748 - BLOCK
      ?auto_560749 - BLOCK
      ?auto_560750 - BLOCK
      ?auto_560751 - BLOCK
      ?auto_560752 - BLOCK
    )
    :vars
    (
      ?auto_560753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560752 ?auto_560753 ) ( ON-TABLE ?auto_560742 ) ( ON ?auto_560743 ?auto_560742 ) ( ON ?auto_560744 ?auto_560743 ) ( ON ?auto_560745 ?auto_560744 ) ( ON ?auto_560746 ?auto_560745 ) ( ON ?auto_560747 ?auto_560746 ) ( ON ?auto_560748 ?auto_560747 ) ( ON ?auto_560749 ?auto_560748 ) ( ON ?auto_560750 ?auto_560749 ) ( not ( = ?auto_560742 ?auto_560743 ) ) ( not ( = ?auto_560742 ?auto_560744 ) ) ( not ( = ?auto_560742 ?auto_560745 ) ) ( not ( = ?auto_560742 ?auto_560746 ) ) ( not ( = ?auto_560742 ?auto_560747 ) ) ( not ( = ?auto_560742 ?auto_560748 ) ) ( not ( = ?auto_560742 ?auto_560749 ) ) ( not ( = ?auto_560742 ?auto_560750 ) ) ( not ( = ?auto_560742 ?auto_560751 ) ) ( not ( = ?auto_560742 ?auto_560752 ) ) ( not ( = ?auto_560742 ?auto_560753 ) ) ( not ( = ?auto_560743 ?auto_560744 ) ) ( not ( = ?auto_560743 ?auto_560745 ) ) ( not ( = ?auto_560743 ?auto_560746 ) ) ( not ( = ?auto_560743 ?auto_560747 ) ) ( not ( = ?auto_560743 ?auto_560748 ) ) ( not ( = ?auto_560743 ?auto_560749 ) ) ( not ( = ?auto_560743 ?auto_560750 ) ) ( not ( = ?auto_560743 ?auto_560751 ) ) ( not ( = ?auto_560743 ?auto_560752 ) ) ( not ( = ?auto_560743 ?auto_560753 ) ) ( not ( = ?auto_560744 ?auto_560745 ) ) ( not ( = ?auto_560744 ?auto_560746 ) ) ( not ( = ?auto_560744 ?auto_560747 ) ) ( not ( = ?auto_560744 ?auto_560748 ) ) ( not ( = ?auto_560744 ?auto_560749 ) ) ( not ( = ?auto_560744 ?auto_560750 ) ) ( not ( = ?auto_560744 ?auto_560751 ) ) ( not ( = ?auto_560744 ?auto_560752 ) ) ( not ( = ?auto_560744 ?auto_560753 ) ) ( not ( = ?auto_560745 ?auto_560746 ) ) ( not ( = ?auto_560745 ?auto_560747 ) ) ( not ( = ?auto_560745 ?auto_560748 ) ) ( not ( = ?auto_560745 ?auto_560749 ) ) ( not ( = ?auto_560745 ?auto_560750 ) ) ( not ( = ?auto_560745 ?auto_560751 ) ) ( not ( = ?auto_560745 ?auto_560752 ) ) ( not ( = ?auto_560745 ?auto_560753 ) ) ( not ( = ?auto_560746 ?auto_560747 ) ) ( not ( = ?auto_560746 ?auto_560748 ) ) ( not ( = ?auto_560746 ?auto_560749 ) ) ( not ( = ?auto_560746 ?auto_560750 ) ) ( not ( = ?auto_560746 ?auto_560751 ) ) ( not ( = ?auto_560746 ?auto_560752 ) ) ( not ( = ?auto_560746 ?auto_560753 ) ) ( not ( = ?auto_560747 ?auto_560748 ) ) ( not ( = ?auto_560747 ?auto_560749 ) ) ( not ( = ?auto_560747 ?auto_560750 ) ) ( not ( = ?auto_560747 ?auto_560751 ) ) ( not ( = ?auto_560747 ?auto_560752 ) ) ( not ( = ?auto_560747 ?auto_560753 ) ) ( not ( = ?auto_560748 ?auto_560749 ) ) ( not ( = ?auto_560748 ?auto_560750 ) ) ( not ( = ?auto_560748 ?auto_560751 ) ) ( not ( = ?auto_560748 ?auto_560752 ) ) ( not ( = ?auto_560748 ?auto_560753 ) ) ( not ( = ?auto_560749 ?auto_560750 ) ) ( not ( = ?auto_560749 ?auto_560751 ) ) ( not ( = ?auto_560749 ?auto_560752 ) ) ( not ( = ?auto_560749 ?auto_560753 ) ) ( not ( = ?auto_560750 ?auto_560751 ) ) ( not ( = ?auto_560750 ?auto_560752 ) ) ( not ( = ?auto_560750 ?auto_560753 ) ) ( not ( = ?auto_560751 ?auto_560752 ) ) ( not ( = ?auto_560751 ?auto_560753 ) ) ( not ( = ?auto_560752 ?auto_560753 ) ) ( CLEAR ?auto_560750 ) ( ON ?auto_560751 ?auto_560752 ) ( CLEAR ?auto_560751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_560742 ?auto_560743 ?auto_560744 ?auto_560745 ?auto_560746 ?auto_560747 ?auto_560748 ?auto_560749 ?auto_560750 ?auto_560751 )
      ( MAKE-11PILE ?auto_560742 ?auto_560743 ?auto_560744 ?auto_560745 ?auto_560746 ?auto_560747 ?auto_560748 ?auto_560749 ?auto_560750 ?auto_560751 ?auto_560752 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560788 - BLOCK
      ?auto_560789 - BLOCK
      ?auto_560790 - BLOCK
      ?auto_560791 - BLOCK
      ?auto_560792 - BLOCK
      ?auto_560793 - BLOCK
      ?auto_560794 - BLOCK
      ?auto_560795 - BLOCK
      ?auto_560796 - BLOCK
      ?auto_560797 - BLOCK
      ?auto_560798 - BLOCK
    )
    :vars
    (
      ?auto_560799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560798 ?auto_560799 ) ( ON-TABLE ?auto_560788 ) ( ON ?auto_560789 ?auto_560788 ) ( ON ?auto_560790 ?auto_560789 ) ( ON ?auto_560791 ?auto_560790 ) ( ON ?auto_560792 ?auto_560791 ) ( ON ?auto_560793 ?auto_560792 ) ( ON ?auto_560794 ?auto_560793 ) ( ON ?auto_560795 ?auto_560794 ) ( not ( = ?auto_560788 ?auto_560789 ) ) ( not ( = ?auto_560788 ?auto_560790 ) ) ( not ( = ?auto_560788 ?auto_560791 ) ) ( not ( = ?auto_560788 ?auto_560792 ) ) ( not ( = ?auto_560788 ?auto_560793 ) ) ( not ( = ?auto_560788 ?auto_560794 ) ) ( not ( = ?auto_560788 ?auto_560795 ) ) ( not ( = ?auto_560788 ?auto_560796 ) ) ( not ( = ?auto_560788 ?auto_560797 ) ) ( not ( = ?auto_560788 ?auto_560798 ) ) ( not ( = ?auto_560788 ?auto_560799 ) ) ( not ( = ?auto_560789 ?auto_560790 ) ) ( not ( = ?auto_560789 ?auto_560791 ) ) ( not ( = ?auto_560789 ?auto_560792 ) ) ( not ( = ?auto_560789 ?auto_560793 ) ) ( not ( = ?auto_560789 ?auto_560794 ) ) ( not ( = ?auto_560789 ?auto_560795 ) ) ( not ( = ?auto_560789 ?auto_560796 ) ) ( not ( = ?auto_560789 ?auto_560797 ) ) ( not ( = ?auto_560789 ?auto_560798 ) ) ( not ( = ?auto_560789 ?auto_560799 ) ) ( not ( = ?auto_560790 ?auto_560791 ) ) ( not ( = ?auto_560790 ?auto_560792 ) ) ( not ( = ?auto_560790 ?auto_560793 ) ) ( not ( = ?auto_560790 ?auto_560794 ) ) ( not ( = ?auto_560790 ?auto_560795 ) ) ( not ( = ?auto_560790 ?auto_560796 ) ) ( not ( = ?auto_560790 ?auto_560797 ) ) ( not ( = ?auto_560790 ?auto_560798 ) ) ( not ( = ?auto_560790 ?auto_560799 ) ) ( not ( = ?auto_560791 ?auto_560792 ) ) ( not ( = ?auto_560791 ?auto_560793 ) ) ( not ( = ?auto_560791 ?auto_560794 ) ) ( not ( = ?auto_560791 ?auto_560795 ) ) ( not ( = ?auto_560791 ?auto_560796 ) ) ( not ( = ?auto_560791 ?auto_560797 ) ) ( not ( = ?auto_560791 ?auto_560798 ) ) ( not ( = ?auto_560791 ?auto_560799 ) ) ( not ( = ?auto_560792 ?auto_560793 ) ) ( not ( = ?auto_560792 ?auto_560794 ) ) ( not ( = ?auto_560792 ?auto_560795 ) ) ( not ( = ?auto_560792 ?auto_560796 ) ) ( not ( = ?auto_560792 ?auto_560797 ) ) ( not ( = ?auto_560792 ?auto_560798 ) ) ( not ( = ?auto_560792 ?auto_560799 ) ) ( not ( = ?auto_560793 ?auto_560794 ) ) ( not ( = ?auto_560793 ?auto_560795 ) ) ( not ( = ?auto_560793 ?auto_560796 ) ) ( not ( = ?auto_560793 ?auto_560797 ) ) ( not ( = ?auto_560793 ?auto_560798 ) ) ( not ( = ?auto_560793 ?auto_560799 ) ) ( not ( = ?auto_560794 ?auto_560795 ) ) ( not ( = ?auto_560794 ?auto_560796 ) ) ( not ( = ?auto_560794 ?auto_560797 ) ) ( not ( = ?auto_560794 ?auto_560798 ) ) ( not ( = ?auto_560794 ?auto_560799 ) ) ( not ( = ?auto_560795 ?auto_560796 ) ) ( not ( = ?auto_560795 ?auto_560797 ) ) ( not ( = ?auto_560795 ?auto_560798 ) ) ( not ( = ?auto_560795 ?auto_560799 ) ) ( not ( = ?auto_560796 ?auto_560797 ) ) ( not ( = ?auto_560796 ?auto_560798 ) ) ( not ( = ?auto_560796 ?auto_560799 ) ) ( not ( = ?auto_560797 ?auto_560798 ) ) ( not ( = ?auto_560797 ?auto_560799 ) ) ( not ( = ?auto_560798 ?auto_560799 ) ) ( ON ?auto_560797 ?auto_560798 ) ( CLEAR ?auto_560795 ) ( ON ?auto_560796 ?auto_560797 ) ( CLEAR ?auto_560796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_560788 ?auto_560789 ?auto_560790 ?auto_560791 ?auto_560792 ?auto_560793 ?auto_560794 ?auto_560795 ?auto_560796 )
      ( MAKE-11PILE ?auto_560788 ?auto_560789 ?auto_560790 ?auto_560791 ?auto_560792 ?auto_560793 ?auto_560794 ?auto_560795 ?auto_560796 ?auto_560797 ?auto_560798 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560834 - BLOCK
      ?auto_560835 - BLOCK
      ?auto_560836 - BLOCK
      ?auto_560837 - BLOCK
      ?auto_560838 - BLOCK
      ?auto_560839 - BLOCK
      ?auto_560840 - BLOCK
      ?auto_560841 - BLOCK
      ?auto_560842 - BLOCK
      ?auto_560843 - BLOCK
      ?auto_560844 - BLOCK
    )
    :vars
    (
      ?auto_560845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560844 ?auto_560845 ) ( ON-TABLE ?auto_560834 ) ( ON ?auto_560835 ?auto_560834 ) ( ON ?auto_560836 ?auto_560835 ) ( ON ?auto_560837 ?auto_560836 ) ( ON ?auto_560838 ?auto_560837 ) ( ON ?auto_560839 ?auto_560838 ) ( ON ?auto_560840 ?auto_560839 ) ( not ( = ?auto_560834 ?auto_560835 ) ) ( not ( = ?auto_560834 ?auto_560836 ) ) ( not ( = ?auto_560834 ?auto_560837 ) ) ( not ( = ?auto_560834 ?auto_560838 ) ) ( not ( = ?auto_560834 ?auto_560839 ) ) ( not ( = ?auto_560834 ?auto_560840 ) ) ( not ( = ?auto_560834 ?auto_560841 ) ) ( not ( = ?auto_560834 ?auto_560842 ) ) ( not ( = ?auto_560834 ?auto_560843 ) ) ( not ( = ?auto_560834 ?auto_560844 ) ) ( not ( = ?auto_560834 ?auto_560845 ) ) ( not ( = ?auto_560835 ?auto_560836 ) ) ( not ( = ?auto_560835 ?auto_560837 ) ) ( not ( = ?auto_560835 ?auto_560838 ) ) ( not ( = ?auto_560835 ?auto_560839 ) ) ( not ( = ?auto_560835 ?auto_560840 ) ) ( not ( = ?auto_560835 ?auto_560841 ) ) ( not ( = ?auto_560835 ?auto_560842 ) ) ( not ( = ?auto_560835 ?auto_560843 ) ) ( not ( = ?auto_560835 ?auto_560844 ) ) ( not ( = ?auto_560835 ?auto_560845 ) ) ( not ( = ?auto_560836 ?auto_560837 ) ) ( not ( = ?auto_560836 ?auto_560838 ) ) ( not ( = ?auto_560836 ?auto_560839 ) ) ( not ( = ?auto_560836 ?auto_560840 ) ) ( not ( = ?auto_560836 ?auto_560841 ) ) ( not ( = ?auto_560836 ?auto_560842 ) ) ( not ( = ?auto_560836 ?auto_560843 ) ) ( not ( = ?auto_560836 ?auto_560844 ) ) ( not ( = ?auto_560836 ?auto_560845 ) ) ( not ( = ?auto_560837 ?auto_560838 ) ) ( not ( = ?auto_560837 ?auto_560839 ) ) ( not ( = ?auto_560837 ?auto_560840 ) ) ( not ( = ?auto_560837 ?auto_560841 ) ) ( not ( = ?auto_560837 ?auto_560842 ) ) ( not ( = ?auto_560837 ?auto_560843 ) ) ( not ( = ?auto_560837 ?auto_560844 ) ) ( not ( = ?auto_560837 ?auto_560845 ) ) ( not ( = ?auto_560838 ?auto_560839 ) ) ( not ( = ?auto_560838 ?auto_560840 ) ) ( not ( = ?auto_560838 ?auto_560841 ) ) ( not ( = ?auto_560838 ?auto_560842 ) ) ( not ( = ?auto_560838 ?auto_560843 ) ) ( not ( = ?auto_560838 ?auto_560844 ) ) ( not ( = ?auto_560838 ?auto_560845 ) ) ( not ( = ?auto_560839 ?auto_560840 ) ) ( not ( = ?auto_560839 ?auto_560841 ) ) ( not ( = ?auto_560839 ?auto_560842 ) ) ( not ( = ?auto_560839 ?auto_560843 ) ) ( not ( = ?auto_560839 ?auto_560844 ) ) ( not ( = ?auto_560839 ?auto_560845 ) ) ( not ( = ?auto_560840 ?auto_560841 ) ) ( not ( = ?auto_560840 ?auto_560842 ) ) ( not ( = ?auto_560840 ?auto_560843 ) ) ( not ( = ?auto_560840 ?auto_560844 ) ) ( not ( = ?auto_560840 ?auto_560845 ) ) ( not ( = ?auto_560841 ?auto_560842 ) ) ( not ( = ?auto_560841 ?auto_560843 ) ) ( not ( = ?auto_560841 ?auto_560844 ) ) ( not ( = ?auto_560841 ?auto_560845 ) ) ( not ( = ?auto_560842 ?auto_560843 ) ) ( not ( = ?auto_560842 ?auto_560844 ) ) ( not ( = ?auto_560842 ?auto_560845 ) ) ( not ( = ?auto_560843 ?auto_560844 ) ) ( not ( = ?auto_560843 ?auto_560845 ) ) ( not ( = ?auto_560844 ?auto_560845 ) ) ( ON ?auto_560843 ?auto_560844 ) ( ON ?auto_560842 ?auto_560843 ) ( CLEAR ?auto_560840 ) ( ON ?auto_560841 ?auto_560842 ) ( CLEAR ?auto_560841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_560834 ?auto_560835 ?auto_560836 ?auto_560837 ?auto_560838 ?auto_560839 ?auto_560840 ?auto_560841 )
      ( MAKE-11PILE ?auto_560834 ?auto_560835 ?auto_560836 ?auto_560837 ?auto_560838 ?auto_560839 ?auto_560840 ?auto_560841 ?auto_560842 ?auto_560843 ?auto_560844 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560880 - BLOCK
      ?auto_560881 - BLOCK
      ?auto_560882 - BLOCK
      ?auto_560883 - BLOCK
      ?auto_560884 - BLOCK
      ?auto_560885 - BLOCK
      ?auto_560886 - BLOCK
      ?auto_560887 - BLOCK
      ?auto_560888 - BLOCK
      ?auto_560889 - BLOCK
      ?auto_560890 - BLOCK
    )
    :vars
    (
      ?auto_560891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560890 ?auto_560891 ) ( ON-TABLE ?auto_560880 ) ( ON ?auto_560881 ?auto_560880 ) ( ON ?auto_560882 ?auto_560881 ) ( ON ?auto_560883 ?auto_560882 ) ( ON ?auto_560884 ?auto_560883 ) ( ON ?auto_560885 ?auto_560884 ) ( not ( = ?auto_560880 ?auto_560881 ) ) ( not ( = ?auto_560880 ?auto_560882 ) ) ( not ( = ?auto_560880 ?auto_560883 ) ) ( not ( = ?auto_560880 ?auto_560884 ) ) ( not ( = ?auto_560880 ?auto_560885 ) ) ( not ( = ?auto_560880 ?auto_560886 ) ) ( not ( = ?auto_560880 ?auto_560887 ) ) ( not ( = ?auto_560880 ?auto_560888 ) ) ( not ( = ?auto_560880 ?auto_560889 ) ) ( not ( = ?auto_560880 ?auto_560890 ) ) ( not ( = ?auto_560880 ?auto_560891 ) ) ( not ( = ?auto_560881 ?auto_560882 ) ) ( not ( = ?auto_560881 ?auto_560883 ) ) ( not ( = ?auto_560881 ?auto_560884 ) ) ( not ( = ?auto_560881 ?auto_560885 ) ) ( not ( = ?auto_560881 ?auto_560886 ) ) ( not ( = ?auto_560881 ?auto_560887 ) ) ( not ( = ?auto_560881 ?auto_560888 ) ) ( not ( = ?auto_560881 ?auto_560889 ) ) ( not ( = ?auto_560881 ?auto_560890 ) ) ( not ( = ?auto_560881 ?auto_560891 ) ) ( not ( = ?auto_560882 ?auto_560883 ) ) ( not ( = ?auto_560882 ?auto_560884 ) ) ( not ( = ?auto_560882 ?auto_560885 ) ) ( not ( = ?auto_560882 ?auto_560886 ) ) ( not ( = ?auto_560882 ?auto_560887 ) ) ( not ( = ?auto_560882 ?auto_560888 ) ) ( not ( = ?auto_560882 ?auto_560889 ) ) ( not ( = ?auto_560882 ?auto_560890 ) ) ( not ( = ?auto_560882 ?auto_560891 ) ) ( not ( = ?auto_560883 ?auto_560884 ) ) ( not ( = ?auto_560883 ?auto_560885 ) ) ( not ( = ?auto_560883 ?auto_560886 ) ) ( not ( = ?auto_560883 ?auto_560887 ) ) ( not ( = ?auto_560883 ?auto_560888 ) ) ( not ( = ?auto_560883 ?auto_560889 ) ) ( not ( = ?auto_560883 ?auto_560890 ) ) ( not ( = ?auto_560883 ?auto_560891 ) ) ( not ( = ?auto_560884 ?auto_560885 ) ) ( not ( = ?auto_560884 ?auto_560886 ) ) ( not ( = ?auto_560884 ?auto_560887 ) ) ( not ( = ?auto_560884 ?auto_560888 ) ) ( not ( = ?auto_560884 ?auto_560889 ) ) ( not ( = ?auto_560884 ?auto_560890 ) ) ( not ( = ?auto_560884 ?auto_560891 ) ) ( not ( = ?auto_560885 ?auto_560886 ) ) ( not ( = ?auto_560885 ?auto_560887 ) ) ( not ( = ?auto_560885 ?auto_560888 ) ) ( not ( = ?auto_560885 ?auto_560889 ) ) ( not ( = ?auto_560885 ?auto_560890 ) ) ( not ( = ?auto_560885 ?auto_560891 ) ) ( not ( = ?auto_560886 ?auto_560887 ) ) ( not ( = ?auto_560886 ?auto_560888 ) ) ( not ( = ?auto_560886 ?auto_560889 ) ) ( not ( = ?auto_560886 ?auto_560890 ) ) ( not ( = ?auto_560886 ?auto_560891 ) ) ( not ( = ?auto_560887 ?auto_560888 ) ) ( not ( = ?auto_560887 ?auto_560889 ) ) ( not ( = ?auto_560887 ?auto_560890 ) ) ( not ( = ?auto_560887 ?auto_560891 ) ) ( not ( = ?auto_560888 ?auto_560889 ) ) ( not ( = ?auto_560888 ?auto_560890 ) ) ( not ( = ?auto_560888 ?auto_560891 ) ) ( not ( = ?auto_560889 ?auto_560890 ) ) ( not ( = ?auto_560889 ?auto_560891 ) ) ( not ( = ?auto_560890 ?auto_560891 ) ) ( ON ?auto_560889 ?auto_560890 ) ( ON ?auto_560888 ?auto_560889 ) ( ON ?auto_560887 ?auto_560888 ) ( CLEAR ?auto_560885 ) ( ON ?auto_560886 ?auto_560887 ) ( CLEAR ?auto_560886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_560880 ?auto_560881 ?auto_560882 ?auto_560883 ?auto_560884 ?auto_560885 ?auto_560886 )
      ( MAKE-11PILE ?auto_560880 ?auto_560881 ?auto_560882 ?auto_560883 ?auto_560884 ?auto_560885 ?auto_560886 ?auto_560887 ?auto_560888 ?auto_560889 ?auto_560890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560926 - BLOCK
      ?auto_560927 - BLOCK
      ?auto_560928 - BLOCK
      ?auto_560929 - BLOCK
      ?auto_560930 - BLOCK
      ?auto_560931 - BLOCK
      ?auto_560932 - BLOCK
      ?auto_560933 - BLOCK
      ?auto_560934 - BLOCK
      ?auto_560935 - BLOCK
      ?auto_560936 - BLOCK
    )
    :vars
    (
      ?auto_560937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560936 ?auto_560937 ) ( ON-TABLE ?auto_560926 ) ( ON ?auto_560927 ?auto_560926 ) ( ON ?auto_560928 ?auto_560927 ) ( ON ?auto_560929 ?auto_560928 ) ( ON ?auto_560930 ?auto_560929 ) ( not ( = ?auto_560926 ?auto_560927 ) ) ( not ( = ?auto_560926 ?auto_560928 ) ) ( not ( = ?auto_560926 ?auto_560929 ) ) ( not ( = ?auto_560926 ?auto_560930 ) ) ( not ( = ?auto_560926 ?auto_560931 ) ) ( not ( = ?auto_560926 ?auto_560932 ) ) ( not ( = ?auto_560926 ?auto_560933 ) ) ( not ( = ?auto_560926 ?auto_560934 ) ) ( not ( = ?auto_560926 ?auto_560935 ) ) ( not ( = ?auto_560926 ?auto_560936 ) ) ( not ( = ?auto_560926 ?auto_560937 ) ) ( not ( = ?auto_560927 ?auto_560928 ) ) ( not ( = ?auto_560927 ?auto_560929 ) ) ( not ( = ?auto_560927 ?auto_560930 ) ) ( not ( = ?auto_560927 ?auto_560931 ) ) ( not ( = ?auto_560927 ?auto_560932 ) ) ( not ( = ?auto_560927 ?auto_560933 ) ) ( not ( = ?auto_560927 ?auto_560934 ) ) ( not ( = ?auto_560927 ?auto_560935 ) ) ( not ( = ?auto_560927 ?auto_560936 ) ) ( not ( = ?auto_560927 ?auto_560937 ) ) ( not ( = ?auto_560928 ?auto_560929 ) ) ( not ( = ?auto_560928 ?auto_560930 ) ) ( not ( = ?auto_560928 ?auto_560931 ) ) ( not ( = ?auto_560928 ?auto_560932 ) ) ( not ( = ?auto_560928 ?auto_560933 ) ) ( not ( = ?auto_560928 ?auto_560934 ) ) ( not ( = ?auto_560928 ?auto_560935 ) ) ( not ( = ?auto_560928 ?auto_560936 ) ) ( not ( = ?auto_560928 ?auto_560937 ) ) ( not ( = ?auto_560929 ?auto_560930 ) ) ( not ( = ?auto_560929 ?auto_560931 ) ) ( not ( = ?auto_560929 ?auto_560932 ) ) ( not ( = ?auto_560929 ?auto_560933 ) ) ( not ( = ?auto_560929 ?auto_560934 ) ) ( not ( = ?auto_560929 ?auto_560935 ) ) ( not ( = ?auto_560929 ?auto_560936 ) ) ( not ( = ?auto_560929 ?auto_560937 ) ) ( not ( = ?auto_560930 ?auto_560931 ) ) ( not ( = ?auto_560930 ?auto_560932 ) ) ( not ( = ?auto_560930 ?auto_560933 ) ) ( not ( = ?auto_560930 ?auto_560934 ) ) ( not ( = ?auto_560930 ?auto_560935 ) ) ( not ( = ?auto_560930 ?auto_560936 ) ) ( not ( = ?auto_560930 ?auto_560937 ) ) ( not ( = ?auto_560931 ?auto_560932 ) ) ( not ( = ?auto_560931 ?auto_560933 ) ) ( not ( = ?auto_560931 ?auto_560934 ) ) ( not ( = ?auto_560931 ?auto_560935 ) ) ( not ( = ?auto_560931 ?auto_560936 ) ) ( not ( = ?auto_560931 ?auto_560937 ) ) ( not ( = ?auto_560932 ?auto_560933 ) ) ( not ( = ?auto_560932 ?auto_560934 ) ) ( not ( = ?auto_560932 ?auto_560935 ) ) ( not ( = ?auto_560932 ?auto_560936 ) ) ( not ( = ?auto_560932 ?auto_560937 ) ) ( not ( = ?auto_560933 ?auto_560934 ) ) ( not ( = ?auto_560933 ?auto_560935 ) ) ( not ( = ?auto_560933 ?auto_560936 ) ) ( not ( = ?auto_560933 ?auto_560937 ) ) ( not ( = ?auto_560934 ?auto_560935 ) ) ( not ( = ?auto_560934 ?auto_560936 ) ) ( not ( = ?auto_560934 ?auto_560937 ) ) ( not ( = ?auto_560935 ?auto_560936 ) ) ( not ( = ?auto_560935 ?auto_560937 ) ) ( not ( = ?auto_560936 ?auto_560937 ) ) ( ON ?auto_560935 ?auto_560936 ) ( ON ?auto_560934 ?auto_560935 ) ( ON ?auto_560933 ?auto_560934 ) ( ON ?auto_560932 ?auto_560933 ) ( CLEAR ?auto_560930 ) ( ON ?auto_560931 ?auto_560932 ) ( CLEAR ?auto_560931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_560926 ?auto_560927 ?auto_560928 ?auto_560929 ?auto_560930 ?auto_560931 )
      ( MAKE-11PILE ?auto_560926 ?auto_560927 ?auto_560928 ?auto_560929 ?auto_560930 ?auto_560931 ?auto_560932 ?auto_560933 ?auto_560934 ?auto_560935 ?auto_560936 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_560972 - BLOCK
      ?auto_560973 - BLOCK
      ?auto_560974 - BLOCK
      ?auto_560975 - BLOCK
      ?auto_560976 - BLOCK
      ?auto_560977 - BLOCK
      ?auto_560978 - BLOCK
      ?auto_560979 - BLOCK
      ?auto_560980 - BLOCK
      ?auto_560981 - BLOCK
      ?auto_560982 - BLOCK
    )
    :vars
    (
      ?auto_560983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_560982 ?auto_560983 ) ( ON-TABLE ?auto_560972 ) ( ON ?auto_560973 ?auto_560972 ) ( ON ?auto_560974 ?auto_560973 ) ( ON ?auto_560975 ?auto_560974 ) ( not ( = ?auto_560972 ?auto_560973 ) ) ( not ( = ?auto_560972 ?auto_560974 ) ) ( not ( = ?auto_560972 ?auto_560975 ) ) ( not ( = ?auto_560972 ?auto_560976 ) ) ( not ( = ?auto_560972 ?auto_560977 ) ) ( not ( = ?auto_560972 ?auto_560978 ) ) ( not ( = ?auto_560972 ?auto_560979 ) ) ( not ( = ?auto_560972 ?auto_560980 ) ) ( not ( = ?auto_560972 ?auto_560981 ) ) ( not ( = ?auto_560972 ?auto_560982 ) ) ( not ( = ?auto_560972 ?auto_560983 ) ) ( not ( = ?auto_560973 ?auto_560974 ) ) ( not ( = ?auto_560973 ?auto_560975 ) ) ( not ( = ?auto_560973 ?auto_560976 ) ) ( not ( = ?auto_560973 ?auto_560977 ) ) ( not ( = ?auto_560973 ?auto_560978 ) ) ( not ( = ?auto_560973 ?auto_560979 ) ) ( not ( = ?auto_560973 ?auto_560980 ) ) ( not ( = ?auto_560973 ?auto_560981 ) ) ( not ( = ?auto_560973 ?auto_560982 ) ) ( not ( = ?auto_560973 ?auto_560983 ) ) ( not ( = ?auto_560974 ?auto_560975 ) ) ( not ( = ?auto_560974 ?auto_560976 ) ) ( not ( = ?auto_560974 ?auto_560977 ) ) ( not ( = ?auto_560974 ?auto_560978 ) ) ( not ( = ?auto_560974 ?auto_560979 ) ) ( not ( = ?auto_560974 ?auto_560980 ) ) ( not ( = ?auto_560974 ?auto_560981 ) ) ( not ( = ?auto_560974 ?auto_560982 ) ) ( not ( = ?auto_560974 ?auto_560983 ) ) ( not ( = ?auto_560975 ?auto_560976 ) ) ( not ( = ?auto_560975 ?auto_560977 ) ) ( not ( = ?auto_560975 ?auto_560978 ) ) ( not ( = ?auto_560975 ?auto_560979 ) ) ( not ( = ?auto_560975 ?auto_560980 ) ) ( not ( = ?auto_560975 ?auto_560981 ) ) ( not ( = ?auto_560975 ?auto_560982 ) ) ( not ( = ?auto_560975 ?auto_560983 ) ) ( not ( = ?auto_560976 ?auto_560977 ) ) ( not ( = ?auto_560976 ?auto_560978 ) ) ( not ( = ?auto_560976 ?auto_560979 ) ) ( not ( = ?auto_560976 ?auto_560980 ) ) ( not ( = ?auto_560976 ?auto_560981 ) ) ( not ( = ?auto_560976 ?auto_560982 ) ) ( not ( = ?auto_560976 ?auto_560983 ) ) ( not ( = ?auto_560977 ?auto_560978 ) ) ( not ( = ?auto_560977 ?auto_560979 ) ) ( not ( = ?auto_560977 ?auto_560980 ) ) ( not ( = ?auto_560977 ?auto_560981 ) ) ( not ( = ?auto_560977 ?auto_560982 ) ) ( not ( = ?auto_560977 ?auto_560983 ) ) ( not ( = ?auto_560978 ?auto_560979 ) ) ( not ( = ?auto_560978 ?auto_560980 ) ) ( not ( = ?auto_560978 ?auto_560981 ) ) ( not ( = ?auto_560978 ?auto_560982 ) ) ( not ( = ?auto_560978 ?auto_560983 ) ) ( not ( = ?auto_560979 ?auto_560980 ) ) ( not ( = ?auto_560979 ?auto_560981 ) ) ( not ( = ?auto_560979 ?auto_560982 ) ) ( not ( = ?auto_560979 ?auto_560983 ) ) ( not ( = ?auto_560980 ?auto_560981 ) ) ( not ( = ?auto_560980 ?auto_560982 ) ) ( not ( = ?auto_560980 ?auto_560983 ) ) ( not ( = ?auto_560981 ?auto_560982 ) ) ( not ( = ?auto_560981 ?auto_560983 ) ) ( not ( = ?auto_560982 ?auto_560983 ) ) ( ON ?auto_560981 ?auto_560982 ) ( ON ?auto_560980 ?auto_560981 ) ( ON ?auto_560979 ?auto_560980 ) ( ON ?auto_560978 ?auto_560979 ) ( ON ?auto_560977 ?auto_560978 ) ( CLEAR ?auto_560975 ) ( ON ?auto_560976 ?auto_560977 ) ( CLEAR ?auto_560976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_560972 ?auto_560973 ?auto_560974 ?auto_560975 ?auto_560976 )
      ( MAKE-11PILE ?auto_560972 ?auto_560973 ?auto_560974 ?auto_560975 ?auto_560976 ?auto_560977 ?auto_560978 ?auto_560979 ?auto_560980 ?auto_560981 ?auto_560982 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_561018 - BLOCK
      ?auto_561019 - BLOCK
      ?auto_561020 - BLOCK
      ?auto_561021 - BLOCK
      ?auto_561022 - BLOCK
      ?auto_561023 - BLOCK
      ?auto_561024 - BLOCK
      ?auto_561025 - BLOCK
      ?auto_561026 - BLOCK
      ?auto_561027 - BLOCK
      ?auto_561028 - BLOCK
    )
    :vars
    (
      ?auto_561029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561028 ?auto_561029 ) ( ON-TABLE ?auto_561018 ) ( ON ?auto_561019 ?auto_561018 ) ( ON ?auto_561020 ?auto_561019 ) ( not ( = ?auto_561018 ?auto_561019 ) ) ( not ( = ?auto_561018 ?auto_561020 ) ) ( not ( = ?auto_561018 ?auto_561021 ) ) ( not ( = ?auto_561018 ?auto_561022 ) ) ( not ( = ?auto_561018 ?auto_561023 ) ) ( not ( = ?auto_561018 ?auto_561024 ) ) ( not ( = ?auto_561018 ?auto_561025 ) ) ( not ( = ?auto_561018 ?auto_561026 ) ) ( not ( = ?auto_561018 ?auto_561027 ) ) ( not ( = ?auto_561018 ?auto_561028 ) ) ( not ( = ?auto_561018 ?auto_561029 ) ) ( not ( = ?auto_561019 ?auto_561020 ) ) ( not ( = ?auto_561019 ?auto_561021 ) ) ( not ( = ?auto_561019 ?auto_561022 ) ) ( not ( = ?auto_561019 ?auto_561023 ) ) ( not ( = ?auto_561019 ?auto_561024 ) ) ( not ( = ?auto_561019 ?auto_561025 ) ) ( not ( = ?auto_561019 ?auto_561026 ) ) ( not ( = ?auto_561019 ?auto_561027 ) ) ( not ( = ?auto_561019 ?auto_561028 ) ) ( not ( = ?auto_561019 ?auto_561029 ) ) ( not ( = ?auto_561020 ?auto_561021 ) ) ( not ( = ?auto_561020 ?auto_561022 ) ) ( not ( = ?auto_561020 ?auto_561023 ) ) ( not ( = ?auto_561020 ?auto_561024 ) ) ( not ( = ?auto_561020 ?auto_561025 ) ) ( not ( = ?auto_561020 ?auto_561026 ) ) ( not ( = ?auto_561020 ?auto_561027 ) ) ( not ( = ?auto_561020 ?auto_561028 ) ) ( not ( = ?auto_561020 ?auto_561029 ) ) ( not ( = ?auto_561021 ?auto_561022 ) ) ( not ( = ?auto_561021 ?auto_561023 ) ) ( not ( = ?auto_561021 ?auto_561024 ) ) ( not ( = ?auto_561021 ?auto_561025 ) ) ( not ( = ?auto_561021 ?auto_561026 ) ) ( not ( = ?auto_561021 ?auto_561027 ) ) ( not ( = ?auto_561021 ?auto_561028 ) ) ( not ( = ?auto_561021 ?auto_561029 ) ) ( not ( = ?auto_561022 ?auto_561023 ) ) ( not ( = ?auto_561022 ?auto_561024 ) ) ( not ( = ?auto_561022 ?auto_561025 ) ) ( not ( = ?auto_561022 ?auto_561026 ) ) ( not ( = ?auto_561022 ?auto_561027 ) ) ( not ( = ?auto_561022 ?auto_561028 ) ) ( not ( = ?auto_561022 ?auto_561029 ) ) ( not ( = ?auto_561023 ?auto_561024 ) ) ( not ( = ?auto_561023 ?auto_561025 ) ) ( not ( = ?auto_561023 ?auto_561026 ) ) ( not ( = ?auto_561023 ?auto_561027 ) ) ( not ( = ?auto_561023 ?auto_561028 ) ) ( not ( = ?auto_561023 ?auto_561029 ) ) ( not ( = ?auto_561024 ?auto_561025 ) ) ( not ( = ?auto_561024 ?auto_561026 ) ) ( not ( = ?auto_561024 ?auto_561027 ) ) ( not ( = ?auto_561024 ?auto_561028 ) ) ( not ( = ?auto_561024 ?auto_561029 ) ) ( not ( = ?auto_561025 ?auto_561026 ) ) ( not ( = ?auto_561025 ?auto_561027 ) ) ( not ( = ?auto_561025 ?auto_561028 ) ) ( not ( = ?auto_561025 ?auto_561029 ) ) ( not ( = ?auto_561026 ?auto_561027 ) ) ( not ( = ?auto_561026 ?auto_561028 ) ) ( not ( = ?auto_561026 ?auto_561029 ) ) ( not ( = ?auto_561027 ?auto_561028 ) ) ( not ( = ?auto_561027 ?auto_561029 ) ) ( not ( = ?auto_561028 ?auto_561029 ) ) ( ON ?auto_561027 ?auto_561028 ) ( ON ?auto_561026 ?auto_561027 ) ( ON ?auto_561025 ?auto_561026 ) ( ON ?auto_561024 ?auto_561025 ) ( ON ?auto_561023 ?auto_561024 ) ( ON ?auto_561022 ?auto_561023 ) ( CLEAR ?auto_561020 ) ( ON ?auto_561021 ?auto_561022 ) ( CLEAR ?auto_561021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_561018 ?auto_561019 ?auto_561020 ?auto_561021 )
      ( MAKE-11PILE ?auto_561018 ?auto_561019 ?auto_561020 ?auto_561021 ?auto_561022 ?auto_561023 ?auto_561024 ?auto_561025 ?auto_561026 ?auto_561027 ?auto_561028 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_561064 - BLOCK
      ?auto_561065 - BLOCK
      ?auto_561066 - BLOCK
      ?auto_561067 - BLOCK
      ?auto_561068 - BLOCK
      ?auto_561069 - BLOCK
      ?auto_561070 - BLOCK
      ?auto_561071 - BLOCK
      ?auto_561072 - BLOCK
      ?auto_561073 - BLOCK
      ?auto_561074 - BLOCK
    )
    :vars
    (
      ?auto_561075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561074 ?auto_561075 ) ( ON-TABLE ?auto_561064 ) ( ON ?auto_561065 ?auto_561064 ) ( not ( = ?auto_561064 ?auto_561065 ) ) ( not ( = ?auto_561064 ?auto_561066 ) ) ( not ( = ?auto_561064 ?auto_561067 ) ) ( not ( = ?auto_561064 ?auto_561068 ) ) ( not ( = ?auto_561064 ?auto_561069 ) ) ( not ( = ?auto_561064 ?auto_561070 ) ) ( not ( = ?auto_561064 ?auto_561071 ) ) ( not ( = ?auto_561064 ?auto_561072 ) ) ( not ( = ?auto_561064 ?auto_561073 ) ) ( not ( = ?auto_561064 ?auto_561074 ) ) ( not ( = ?auto_561064 ?auto_561075 ) ) ( not ( = ?auto_561065 ?auto_561066 ) ) ( not ( = ?auto_561065 ?auto_561067 ) ) ( not ( = ?auto_561065 ?auto_561068 ) ) ( not ( = ?auto_561065 ?auto_561069 ) ) ( not ( = ?auto_561065 ?auto_561070 ) ) ( not ( = ?auto_561065 ?auto_561071 ) ) ( not ( = ?auto_561065 ?auto_561072 ) ) ( not ( = ?auto_561065 ?auto_561073 ) ) ( not ( = ?auto_561065 ?auto_561074 ) ) ( not ( = ?auto_561065 ?auto_561075 ) ) ( not ( = ?auto_561066 ?auto_561067 ) ) ( not ( = ?auto_561066 ?auto_561068 ) ) ( not ( = ?auto_561066 ?auto_561069 ) ) ( not ( = ?auto_561066 ?auto_561070 ) ) ( not ( = ?auto_561066 ?auto_561071 ) ) ( not ( = ?auto_561066 ?auto_561072 ) ) ( not ( = ?auto_561066 ?auto_561073 ) ) ( not ( = ?auto_561066 ?auto_561074 ) ) ( not ( = ?auto_561066 ?auto_561075 ) ) ( not ( = ?auto_561067 ?auto_561068 ) ) ( not ( = ?auto_561067 ?auto_561069 ) ) ( not ( = ?auto_561067 ?auto_561070 ) ) ( not ( = ?auto_561067 ?auto_561071 ) ) ( not ( = ?auto_561067 ?auto_561072 ) ) ( not ( = ?auto_561067 ?auto_561073 ) ) ( not ( = ?auto_561067 ?auto_561074 ) ) ( not ( = ?auto_561067 ?auto_561075 ) ) ( not ( = ?auto_561068 ?auto_561069 ) ) ( not ( = ?auto_561068 ?auto_561070 ) ) ( not ( = ?auto_561068 ?auto_561071 ) ) ( not ( = ?auto_561068 ?auto_561072 ) ) ( not ( = ?auto_561068 ?auto_561073 ) ) ( not ( = ?auto_561068 ?auto_561074 ) ) ( not ( = ?auto_561068 ?auto_561075 ) ) ( not ( = ?auto_561069 ?auto_561070 ) ) ( not ( = ?auto_561069 ?auto_561071 ) ) ( not ( = ?auto_561069 ?auto_561072 ) ) ( not ( = ?auto_561069 ?auto_561073 ) ) ( not ( = ?auto_561069 ?auto_561074 ) ) ( not ( = ?auto_561069 ?auto_561075 ) ) ( not ( = ?auto_561070 ?auto_561071 ) ) ( not ( = ?auto_561070 ?auto_561072 ) ) ( not ( = ?auto_561070 ?auto_561073 ) ) ( not ( = ?auto_561070 ?auto_561074 ) ) ( not ( = ?auto_561070 ?auto_561075 ) ) ( not ( = ?auto_561071 ?auto_561072 ) ) ( not ( = ?auto_561071 ?auto_561073 ) ) ( not ( = ?auto_561071 ?auto_561074 ) ) ( not ( = ?auto_561071 ?auto_561075 ) ) ( not ( = ?auto_561072 ?auto_561073 ) ) ( not ( = ?auto_561072 ?auto_561074 ) ) ( not ( = ?auto_561072 ?auto_561075 ) ) ( not ( = ?auto_561073 ?auto_561074 ) ) ( not ( = ?auto_561073 ?auto_561075 ) ) ( not ( = ?auto_561074 ?auto_561075 ) ) ( ON ?auto_561073 ?auto_561074 ) ( ON ?auto_561072 ?auto_561073 ) ( ON ?auto_561071 ?auto_561072 ) ( ON ?auto_561070 ?auto_561071 ) ( ON ?auto_561069 ?auto_561070 ) ( ON ?auto_561068 ?auto_561069 ) ( ON ?auto_561067 ?auto_561068 ) ( CLEAR ?auto_561065 ) ( ON ?auto_561066 ?auto_561067 ) ( CLEAR ?auto_561066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_561064 ?auto_561065 ?auto_561066 )
      ( MAKE-11PILE ?auto_561064 ?auto_561065 ?auto_561066 ?auto_561067 ?auto_561068 ?auto_561069 ?auto_561070 ?auto_561071 ?auto_561072 ?auto_561073 ?auto_561074 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_561110 - BLOCK
      ?auto_561111 - BLOCK
      ?auto_561112 - BLOCK
      ?auto_561113 - BLOCK
      ?auto_561114 - BLOCK
      ?auto_561115 - BLOCK
      ?auto_561116 - BLOCK
      ?auto_561117 - BLOCK
      ?auto_561118 - BLOCK
      ?auto_561119 - BLOCK
      ?auto_561120 - BLOCK
    )
    :vars
    (
      ?auto_561121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561120 ?auto_561121 ) ( ON-TABLE ?auto_561110 ) ( not ( = ?auto_561110 ?auto_561111 ) ) ( not ( = ?auto_561110 ?auto_561112 ) ) ( not ( = ?auto_561110 ?auto_561113 ) ) ( not ( = ?auto_561110 ?auto_561114 ) ) ( not ( = ?auto_561110 ?auto_561115 ) ) ( not ( = ?auto_561110 ?auto_561116 ) ) ( not ( = ?auto_561110 ?auto_561117 ) ) ( not ( = ?auto_561110 ?auto_561118 ) ) ( not ( = ?auto_561110 ?auto_561119 ) ) ( not ( = ?auto_561110 ?auto_561120 ) ) ( not ( = ?auto_561110 ?auto_561121 ) ) ( not ( = ?auto_561111 ?auto_561112 ) ) ( not ( = ?auto_561111 ?auto_561113 ) ) ( not ( = ?auto_561111 ?auto_561114 ) ) ( not ( = ?auto_561111 ?auto_561115 ) ) ( not ( = ?auto_561111 ?auto_561116 ) ) ( not ( = ?auto_561111 ?auto_561117 ) ) ( not ( = ?auto_561111 ?auto_561118 ) ) ( not ( = ?auto_561111 ?auto_561119 ) ) ( not ( = ?auto_561111 ?auto_561120 ) ) ( not ( = ?auto_561111 ?auto_561121 ) ) ( not ( = ?auto_561112 ?auto_561113 ) ) ( not ( = ?auto_561112 ?auto_561114 ) ) ( not ( = ?auto_561112 ?auto_561115 ) ) ( not ( = ?auto_561112 ?auto_561116 ) ) ( not ( = ?auto_561112 ?auto_561117 ) ) ( not ( = ?auto_561112 ?auto_561118 ) ) ( not ( = ?auto_561112 ?auto_561119 ) ) ( not ( = ?auto_561112 ?auto_561120 ) ) ( not ( = ?auto_561112 ?auto_561121 ) ) ( not ( = ?auto_561113 ?auto_561114 ) ) ( not ( = ?auto_561113 ?auto_561115 ) ) ( not ( = ?auto_561113 ?auto_561116 ) ) ( not ( = ?auto_561113 ?auto_561117 ) ) ( not ( = ?auto_561113 ?auto_561118 ) ) ( not ( = ?auto_561113 ?auto_561119 ) ) ( not ( = ?auto_561113 ?auto_561120 ) ) ( not ( = ?auto_561113 ?auto_561121 ) ) ( not ( = ?auto_561114 ?auto_561115 ) ) ( not ( = ?auto_561114 ?auto_561116 ) ) ( not ( = ?auto_561114 ?auto_561117 ) ) ( not ( = ?auto_561114 ?auto_561118 ) ) ( not ( = ?auto_561114 ?auto_561119 ) ) ( not ( = ?auto_561114 ?auto_561120 ) ) ( not ( = ?auto_561114 ?auto_561121 ) ) ( not ( = ?auto_561115 ?auto_561116 ) ) ( not ( = ?auto_561115 ?auto_561117 ) ) ( not ( = ?auto_561115 ?auto_561118 ) ) ( not ( = ?auto_561115 ?auto_561119 ) ) ( not ( = ?auto_561115 ?auto_561120 ) ) ( not ( = ?auto_561115 ?auto_561121 ) ) ( not ( = ?auto_561116 ?auto_561117 ) ) ( not ( = ?auto_561116 ?auto_561118 ) ) ( not ( = ?auto_561116 ?auto_561119 ) ) ( not ( = ?auto_561116 ?auto_561120 ) ) ( not ( = ?auto_561116 ?auto_561121 ) ) ( not ( = ?auto_561117 ?auto_561118 ) ) ( not ( = ?auto_561117 ?auto_561119 ) ) ( not ( = ?auto_561117 ?auto_561120 ) ) ( not ( = ?auto_561117 ?auto_561121 ) ) ( not ( = ?auto_561118 ?auto_561119 ) ) ( not ( = ?auto_561118 ?auto_561120 ) ) ( not ( = ?auto_561118 ?auto_561121 ) ) ( not ( = ?auto_561119 ?auto_561120 ) ) ( not ( = ?auto_561119 ?auto_561121 ) ) ( not ( = ?auto_561120 ?auto_561121 ) ) ( ON ?auto_561119 ?auto_561120 ) ( ON ?auto_561118 ?auto_561119 ) ( ON ?auto_561117 ?auto_561118 ) ( ON ?auto_561116 ?auto_561117 ) ( ON ?auto_561115 ?auto_561116 ) ( ON ?auto_561114 ?auto_561115 ) ( ON ?auto_561113 ?auto_561114 ) ( ON ?auto_561112 ?auto_561113 ) ( CLEAR ?auto_561110 ) ( ON ?auto_561111 ?auto_561112 ) ( CLEAR ?auto_561111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_561110 ?auto_561111 )
      ( MAKE-11PILE ?auto_561110 ?auto_561111 ?auto_561112 ?auto_561113 ?auto_561114 ?auto_561115 ?auto_561116 ?auto_561117 ?auto_561118 ?auto_561119 ?auto_561120 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_561156 - BLOCK
      ?auto_561157 - BLOCK
      ?auto_561158 - BLOCK
      ?auto_561159 - BLOCK
      ?auto_561160 - BLOCK
      ?auto_561161 - BLOCK
      ?auto_561162 - BLOCK
      ?auto_561163 - BLOCK
      ?auto_561164 - BLOCK
      ?auto_561165 - BLOCK
      ?auto_561166 - BLOCK
    )
    :vars
    (
      ?auto_561167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561166 ?auto_561167 ) ( not ( = ?auto_561156 ?auto_561157 ) ) ( not ( = ?auto_561156 ?auto_561158 ) ) ( not ( = ?auto_561156 ?auto_561159 ) ) ( not ( = ?auto_561156 ?auto_561160 ) ) ( not ( = ?auto_561156 ?auto_561161 ) ) ( not ( = ?auto_561156 ?auto_561162 ) ) ( not ( = ?auto_561156 ?auto_561163 ) ) ( not ( = ?auto_561156 ?auto_561164 ) ) ( not ( = ?auto_561156 ?auto_561165 ) ) ( not ( = ?auto_561156 ?auto_561166 ) ) ( not ( = ?auto_561156 ?auto_561167 ) ) ( not ( = ?auto_561157 ?auto_561158 ) ) ( not ( = ?auto_561157 ?auto_561159 ) ) ( not ( = ?auto_561157 ?auto_561160 ) ) ( not ( = ?auto_561157 ?auto_561161 ) ) ( not ( = ?auto_561157 ?auto_561162 ) ) ( not ( = ?auto_561157 ?auto_561163 ) ) ( not ( = ?auto_561157 ?auto_561164 ) ) ( not ( = ?auto_561157 ?auto_561165 ) ) ( not ( = ?auto_561157 ?auto_561166 ) ) ( not ( = ?auto_561157 ?auto_561167 ) ) ( not ( = ?auto_561158 ?auto_561159 ) ) ( not ( = ?auto_561158 ?auto_561160 ) ) ( not ( = ?auto_561158 ?auto_561161 ) ) ( not ( = ?auto_561158 ?auto_561162 ) ) ( not ( = ?auto_561158 ?auto_561163 ) ) ( not ( = ?auto_561158 ?auto_561164 ) ) ( not ( = ?auto_561158 ?auto_561165 ) ) ( not ( = ?auto_561158 ?auto_561166 ) ) ( not ( = ?auto_561158 ?auto_561167 ) ) ( not ( = ?auto_561159 ?auto_561160 ) ) ( not ( = ?auto_561159 ?auto_561161 ) ) ( not ( = ?auto_561159 ?auto_561162 ) ) ( not ( = ?auto_561159 ?auto_561163 ) ) ( not ( = ?auto_561159 ?auto_561164 ) ) ( not ( = ?auto_561159 ?auto_561165 ) ) ( not ( = ?auto_561159 ?auto_561166 ) ) ( not ( = ?auto_561159 ?auto_561167 ) ) ( not ( = ?auto_561160 ?auto_561161 ) ) ( not ( = ?auto_561160 ?auto_561162 ) ) ( not ( = ?auto_561160 ?auto_561163 ) ) ( not ( = ?auto_561160 ?auto_561164 ) ) ( not ( = ?auto_561160 ?auto_561165 ) ) ( not ( = ?auto_561160 ?auto_561166 ) ) ( not ( = ?auto_561160 ?auto_561167 ) ) ( not ( = ?auto_561161 ?auto_561162 ) ) ( not ( = ?auto_561161 ?auto_561163 ) ) ( not ( = ?auto_561161 ?auto_561164 ) ) ( not ( = ?auto_561161 ?auto_561165 ) ) ( not ( = ?auto_561161 ?auto_561166 ) ) ( not ( = ?auto_561161 ?auto_561167 ) ) ( not ( = ?auto_561162 ?auto_561163 ) ) ( not ( = ?auto_561162 ?auto_561164 ) ) ( not ( = ?auto_561162 ?auto_561165 ) ) ( not ( = ?auto_561162 ?auto_561166 ) ) ( not ( = ?auto_561162 ?auto_561167 ) ) ( not ( = ?auto_561163 ?auto_561164 ) ) ( not ( = ?auto_561163 ?auto_561165 ) ) ( not ( = ?auto_561163 ?auto_561166 ) ) ( not ( = ?auto_561163 ?auto_561167 ) ) ( not ( = ?auto_561164 ?auto_561165 ) ) ( not ( = ?auto_561164 ?auto_561166 ) ) ( not ( = ?auto_561164 ?auto_561167 ) ) ( not ( = ?auto_561165 ?auto_561166 ) ) ( not ( = ?auto_561165 ?auto_561167 ) ) ( not ( = ?auto_561166 ?auto_561167 ) ) ( ON ?auto_561165 ?auto_561166 ) ( ON ?auto_561164 ?auto_561165 ) ( ON ?auto_561163 ?auto_561164 ) ( ON ?auto_561162 ?auto_561163 ) ( ON ?auto_561161 ?auto_561162 ) ( ON ?auto_561160 ?auto_561161 ) ( ON ?auto_561159 ?auto_561160 ) ( ON ?auto_561158 ?auto_561159 ) ( ON ?auto_561157 ?auto_561158 ) ( ON ?auto_561156 ?auto_561157 ) ( CLEAR ?auto_561156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_561156 )
      ( MAKE-11PILE ?auto_561156 ?auto_561157 ?auto_561158 ?auto_561159 ?auto_561160 ?auto_561161 ?auto_561162 ?auto_561163 ?auto_561164 ?auto_561165 ?auto_561166 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561203 - BLOCK
      ?auto_561204 - BLOCK
      ?auto_561205 - BLOCK
      ?auto_561206 - BLOCK
      ?auto_561207 - BLOCK
      ?auto_561208 - BLOCK
      ?auto_561209 - BLOCK
      ?auto_561210 - BLOCK
      ?auto_561211 - BLOCK
      ?auto_561212 - BLOCK
      ?auto_561213 - BLOCK
      ?auto_561214 - BLOCK
    )
    :vars
    (
      ?auto_561215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_561213 ) ( ON ?auto_561214 ?auto_561215 ) ( CLEAR ?auto_561214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_561203 ) ( ON ?auto_561204 ?auto_561203 ) ( ON ?auto_561205 ?auto_561204 ) ( ON ?auto_561206 ?auto_561205 ) ( ON ?auto_561207 ?auto_561206 ) ( ON ?auto_561208 ?auto_561207 ) ( ON ?auto_561209 ?auto_561208 ) ( ON ?auto_561210 ?auto_561209 ) ( ON ?auto_561211 ?auto_561210 ) ( ON ?auto_561212 ?auto_561211 ) ( ON ?auto_561213 ?auto_561212 ) ( not ( = ?auto_561203 ?auto_561204 ) ) ( not ( = ?auto_561203 ?auto_561205 ) ) ( not ( = ?auto_561203 ?auto_561206 ) ) ( not ( = ?auto_561203 ?auto_561207 ) ) ( not ( = ?auto_561203 ?auto_561208 ) ) ( not ( = ?auto_561203 ?auto_561209 ) ) ( not ( = ?auto_561203 ?auto_561210 ) ) ( not ( = ?auto_561203 ?auto_561211 ) ) ( not ( = ?auto_561203 ?auto_561212 ) ) ( not ( = ?auto_561203 ?auto_561213 ) ) ( not ( = ?auto_561203 ?auto_561214 ) ) ( not ( = ?auto_561203 ?auto_561215 ) ) ( not ( = ?auto_561204 ?auto_561205 ) ) ( not ( = ?auto_561204 ?auto_561206 ) ) ( not ( = ?auto_561204 ?auto_561207 ) ) ( not ( = ?auto_561204 ?auto_561208 ) ) ( not ( = ?auto_561204 ?auto_561209 ) ) ( not ( = ?auto_561204 ?auto_561210 ) ) ( not ( = ?auto_561204 ?auto_561211 ) ) ( not ( = ?auto_561204 ?auto_561212 ) ) ( not ( = ?auto_561204 ?auto_561213 ) ) ( not ( = ?auto_561204 ?auto_561214 ) ) ( not ( = ?auto_561204 ?auto_561215 ) ) ( not ( = ?auto_561205 ?auto_561206 ) ) ( not ( = ?auto_561205 ?auto_561207 ) ) ( not ( = ?auto_561205 ?auto_561208 ) ) ( not ( = ?auto_561205 ?auto_561209 ) ) ( not ( = ?auto_561205 ?auto_561210 ) ) ( not ( = ?auto_561205 ?auto_561211 ) ) ( not ( = ?auto_561205 ?auto_561212 ) ) ( not ( = ?auto_561205 ?auto_561213 ) ) ( not ( = ?auto_561205 ?auto_561214 ) ) ( not ( = ?auto_561205 ?auto_561215 ) ) ( not ( = ?auto_561206 ?auto_561207 ) ) ( not ( = ?auto_561206 ?auto_561208 ) ) ( not ( = ?auto_561206 ?auto_561209 ) ) ( not ( = ?auto_561206 ?auto_561210 ) ) ( not ( = ?auto_561206 ?auto_561211 ) ) ( not ( = ?auto_561206 ?auto_561212 ) ) ( not ( = ?auto_561206 ?auto_561213 ) ) ( not ( = ?auto_561206 ?auto_561214 ) ) ( not ( = ?auto_561206 ?auto_561215 ) ) ( not ( = ?auto_561207 ?auto_561208 ) ) ( not ( = ?auto_561207 ?auto_561209 ) ) ( not ( = ?auto_561207 ?auto_561210 ) ) ( not ( = ?auto_561207 ?auto_561211 ) ) ( not ( = ?auto_561207 ?auto_561212 ) ) ( not ( = ?auto_561207 ?auto_561213 ) ) ( not ( = ?auto_561207 ?auto_561214 ) ) ( not ( = ?auto_561207 ?auto_561215 ) ) ( not ( = ?auto_561208 ?auto_561209 ) ) ( not ( = ?auto_561208 ?auto_561210 ) ) ( not ( = ?auto_561208 ?auto_561211 ) ) ( not ( = ?auto_561208 ?auto_561212 ) ) ( not ( = ?auto_561208 ?auto_561213 ) ) ( not ( = ?auto_561208 ?auto_561214 ) ) ( not ( = ?auto_561208 ?auto_561215 ) ) ( not ( = ?auto_561209 ?auto_561210 ) ) ( not ( = ?auto_561209 ?auto_561211 ) ) ( not ( = ?auto_561209 ?auto_561212 ) ) ( not ( = ?auto_561209 ?auto_561213 ) ) ( not ( = ?auto_561209 ?auto_561214 ) ) ( not ( = ?auto_561209 ?auto_561215 ) ) ( not ( = ?auto_561210 ?auto_561211 ) ) ( not ( = ?auto_561210 ?auto_561212 ) ) ( not ( = ?auto_561210 ?auto_561213 ) ) ( not ( = ?auto_561210 ?auto_561214 ) ) ( not ( = ?auto_561210 ?auto_561215 ) ) ( not ( = ?auto_561211 ?auto_561212 ) ) ( not ( = ?auto_561211 ?auto_561213 ) ) ( not ( = ?auto_561211 ?auto_561214 ) ) ( not ( = ?auto_561211 ?auto_561215 ) ) ( not ( = ?auto_561212 ?auto_561213 ) ) ( not ( = ?auto_561212 ?auto_561214 ) ) ( not ( = ?auto_561212 ?auto_561215 ) ) ( not ( = ?auto_561213 ?auto_561214 ) ) ( not ( = ?auto_561213 ?auto_561215 ) ) ( not ( = ?auto_561214 ?auto_561215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_561214 ?auto_561215 )
      ( !STACK ?auto_561214 ?auto_561213 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561253 - BLOCK
      ?auto_561254 - BLOCK
      ?auto_561255 - BLOCK
      ?auto_561256 - BLOCK
      ?auto_561257 - BLOCK
      ?auto_561258 - BLOCK
      ?auto_561259 - BLOCK
      ?auto_561260 - BLOCK
      ?auto_561261 - BLOCK
      ?auto_561262 - BLOCK
      ?auto_561263 - BLOCK
      ?auto_561264 - BLOCK
    )
    :vars
    (
      ?auto_561265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561264 ?auto_561265 ) ( ON-TABLE ?auto_561253 ) ( ON ?auto_561254 ?auto_561253 ) ( ON ?auto_561255 ?auto_561254 ) ( ON ?auto_561256 ?auto_561255 ) ( ON ?auto_561257 ?auto_561256 ) ( ON ?auto_561258 ?auto_561257 ) ( ON ?auto_561259 ?auto_561258 ) ( ON ?auto_561260 ?auto_561259 ) ( ON ?auto_561261 ?auto_561260 ) ( ON ?auto_561262 ?auto_561261 ) ( not ( = ?auto_561253 ?auto_561254 ) ) ( not ( = ?auto_561253 ?auto_561255 ) ) ( not ( = ?auto_561253 ?auto_561256 ) ) ( not ( = ?auto_561253 ?auto_561257 ) ) ( not ( = ?auto_561253 ?auto_561258 ) ) ( not ( = ?auto_561253 ?auto_561259 ) ) ( not ( = ?auto_561253 ?auto_561260 ) ) ( not ( = ?auto_561253 ?auto_561261 ) ) ( not ( = ?auto_561253 ?auto_561262 ) ) ( not ( = ?auto_561253 ?auto_561263 ) ) ( not ( = ?auto_561253 ?auto_561264 ) ) ( not ( = ?auto_561253 ?auto_561265 ) ) ( not ( = ?auto_561254 ?auto_561255 ) ) ( not ( = ?auto_561254 ?auto_561256 ) ) ( not ( = ?auto_561254 ?auto_561257 ) ) ( not ( = ?auto_561254 ?auto_561258 ) ) ( not ( = ?auto_561254 ?auto_561259 ) ) ( not ( = ?auto_561254 ?auto_561260 ) ) ( not ( = ?auto_561254 ?auto_561261 ) ) ( not ( = ?auto_561254 ?auto_561262 ) ) ( not ( = ?auto_561254 ?auto_561263 ) ) ( not ( = ?auto_561254 ?auto_561264 ) ) ( not ( = ?auto_561254 ?auto_561265 ) ) ( not ( = ?auto_561255 ?auto_561256 ) ) ( not ( = ?auto_561255 ?auto_561257 ) ) ( not ( = ?auto_561255 ?auto_561258 ) ) ( not ( = ?auto_561255 ?auto_561259 ) ) ( not ( = ?auto_561255 ?auto_561260 ) ) ( not ( = ?auto_561255 ?auto_561261 ) ) ( not ( = ?auto_561255 ?auto_561262 ) ) ( not ( = ?auto_561255 ?auto_561263 ) ) ( not ( = ?auto_561255 ?auto_561264 ) ) ( not ( = ?auto_561255 ?auto_561265 ) ) ( not ( = ?auto_561256 ?auto_561257 ) ) ( not ( = ?auto_561256 ?auto_561258 ) ) ( not ( = ?auto_561256 ?auto_561259 ) ) ( not ( = ?auto_561256 ?auto_561260 ) ) ( not ( = ?auto_561256 ?auto_561261 ) ) ( not ( = ?auto_561256 ?auto_561262 ) ) ( not ( = ?auto_561256 ?auto_561263 ) ) ( not ( = ?auto_561256 ?auto_561264 ) ) ( not ( = ?auto_561256 ?auto_561265 ) ) ( not ( = ?auto_561257 ?auto_561258 ) ) ( not ( = ?auto_561257 ?auto_561259 ) ) ( not ( = ?auto_561257 ?auto_561260 ) ) ( not ( = ?auto_561257 ?auto_561261 ) ) ( not ( = ?auto_561257 ?auto_561262 ) ) ( not ( = ?auto_561257 ?auto_561263 ) ) ( not ( = ?auto_561257 ?auto_561264 ) ) ( not ( = ?auto_561257 ?auto_561265 ) ) ( not ( = ?auto_561258 ?auto_561259 ) ) ( not ( = ?auto_561258 ?auto_561260 ) ) ( not ( = ?auto_561258 ?auto_561261 ) ) ( not ( = ?auto_561258 ?auto_561262 ) ) ( not ( = ?auto_561258 ?auto_561263 ) ) ( not ( = ?auto_561258 ?auto_561264 ) ) ( not ( = ?auto_561258 ?auto_561265 ) ) ( not ( = ?auto_561259 ?auto_561260 ) ) ( not ( = ?auto_561259 ?auto_561261 ) ) ( not ( = ?auto_561259 ?auto_561262 ) ) ( not ( = ?auto_561259 ?auto_561263 ) ) ( not ( = ?auto_561259 ?auto_561264 ) ) ( not ( = ?auto_561259 ?auto_561265 ) ) ( not ( = ?auto_561260 ?auto_561261 ) ) ( not ( = ?auto_561260 ?auto_561262 ) ) ( not ( = ?auto_561260 ?auto_561263 ) ) ( not ( = ?auto_561260 ?auto_561264 ) ) ( not ( = ?auto_561260 ?auto_561265 ) ) ( not ( = ?auto_561261 ?auto_561262 ) ) ( not ( = ?auto_561261 ?auto_561263 ) ) ( not ( = ?auto_561261 ?auto_561264 ) ) ( not ( = ?auto_561261 ?auto_561265 ) ) ( not ( = ?auto_561262 ?auto_561263 ) ) ( not ( = ?auto_561262 ?auto_561264 ) ) ( not ( = ?auto_561262 ?auto_561265 ) ) ( not ( = ?auto_561263 ?auto_561264 ) ) ( not ( = ?auto_561263 ?auto_561265 ) ) ( not ( = ?auto_561264 ?auto_561265 ) ) ( CLEAR ?auto_561262 ) ( ON ?auto_561263 ?auto_561264 ) ( CLEAR ?auto_561263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_561253 ?auto_561254 ?auto_561255 ?auto_561256 ?auto_561257 ?auto_561258 ?auto_561259 ?auto_561260 ?auto_561261 ?auto_561262 ?auto_561263 )
      ( MAKE-12PILE ?auto_561253 ?auto_561254 ?auto_561255 ?auto_561256 ?auto_561257 ?auto_561258 ?auto_561259 ?auto_561260 ?auto_561261 ?auto_561262 ?auto_561263 ?auto_561264 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561303 - BLOCK
      ?auto_561304 - BLOCK
      ?auto_561305 - BLOCK
      ?auto_561306 - BLOCK
      ?auto_561307 - BLOCK
      ?auto_561308 - BLOCK
      ?auto_561309 - BLOCK
      ?auto_561310 - BLOCK
      ?auto_561311 - BLOCK
      ?auto_561312 - BLOCK
      ?auto_561313 - BLOCK
      ?auto_561314 - BLOCK
    )
    :vars
    (
      ?auto_561315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561314 ?auto_561315 ) ( ON-TABLE ?auto_561303 ) ( ON ?auto_561304 ?auto_561303 ) ( ON ?auto_561305 ?auto_561304 ) ( ON ?auto_561306 ?auto_561305 ) ( ON ?auto_561307 ?auto_561306 ) ( ON ?auto_561308 ?auto_561307 ) ( ON ?auto_561309 ?auto_561308 ) ( ON ?auto_561310 ?auto_561309 ) ( ON ?auto_561311 ?auto_561310 ) ( not ( = ?auto_561303 ?auto_561304 ) ) ( not ( = ?auto_561303 ?auto_561305 ) ) ( not ( = ?auto_561303 ?auto_561306 ) ) ( not ( = ?auto_561303 ?auto_561307 ) ) ( not ( = ?auto_561303 ?auto_561308 ) ) ( not ( = ?auto_561303 ?auto_561309 ) ) ( not ( = ?auto_561303 ?auto_561310 ) ) ( not ( = ?auto_561303 ?auto_561311 ) ) ( not ( = ?auto_561303 ?auto_561312 ) ) ( not ( = ?auto_561303 ?auto_561313 ) ) ( not ( = ?auto_561303 ?auto_561314 ) ) ( not ( = ?auto_561303 ?auto_561315 ) ) ( not ( = ?auto_561304 ?auto_561305 ) ) ( not ( = ?auto_561304 ?auto_561306 ) ) ( not ( = ?auto_561304 ?auto_561307 ) ) ( not ( = ?auto_561304 ?auto_561308 ) ) ( not ( = ?auto_561304 ?auto_561309 ) ) ( not ( = ?auto_561304 ?auto_561310 ) ) ( not ( = ?auto_561304 ?auto_561311 ) ) ( not ( = ?auto_561304 ?auto_561312 ) ) ( not ( = ?auto_561304 ?auto_561313 ) ) ( not ( = ?auto_561304 ?auto_561314 ) ) ( not ( = ?auto_561304 ?auto_561315 ) ) ( not ( = ?auto_561305 ?auto_561306 ) ) ( not ( = ?auto_561305 ?auto_561307 ) ) ( not ( = ?auto_561305 ?auto_561308 ) ) ( not ( = ?auto_561305 ?auto_561309 ) ) ( not ( = ?auto_561305 ?auto_561310 ) ) ( not ( = ?auto_561305 ?auto_561311 ) ) ( not ( = ?auto_561305 ?auto_561312 ) ) ( not ( = ?auto_561305 ?auto_561313 ) ) ( not ( = ?auto_561305 ?auto_561314 ) ) ( not ( = ?auto_561305 ?auto_561315 ) ) ( not ( = ?auto_561306 ?auto_561307 ) ) ( not ( = ?auto_561306 ?auto_561308 ) ) ( not ( = ?auto_561306 ?auto_561309 ) ) ( not ( = ?auto_561306 ?auto_561310 ) ) ( not ( = ?auto_561306 ?auto_561311 ) ) ( not ( = ?auto_561306 ?auto_561312 ) ) ( not ( = ?auto_561306 ?auto_561313 ) ) ( not ( = ?auto_561306 ?auto_561314 ) ) ( not ( = ?auto_561306 ?auto_561315 ) ) ( not ( = ?auto_561307 ?auto_561308 ) ) ( not ( = ?auto_561307 ?auto_561309 ) ) ( not ( = ?auto_561307 ?auto_561310 ) ) ( not ( = ?auto_561307 ?auto_561311 ) ) ( not ( = ?auto_561307 ?auto_561312 ) ) ( not ( = ?auto_561307 ?auto_561313 ) ) ( not ( = ?auto_561307 ?auto_561314 ) ) ( not ( = ?auto_561307 ?auto_561315 ) ) ( not ( = ?auto_561308 ?auto_561309 ) ) ( not ( = ?auto_561308 ?auto_561310 ) ) ( not ( = ?auto_561308 ?auto_561311 ) ) ( not ( = ?auto_561308 ?auto_561312 ) ) ( not ( = ?auto_561308 ?auto_561313 ) ) ( not ( = ?auto_561308 ?auto_561314 ) ) ( not ( = ?auto_561308 ?auto_561315 ) ) ( not ( = ?auto_561309 ?auto_561310 ) ) ( not ( = ?auto_561309 ?auto_561311 ) ) ( not ( = ?auto_561309 ?auto_561312 ) ) ( not ( = ?auto_561309 ?auto_561313 ) ) ( not ( = ?auto_561309 ?auto_561314 ) ) ( not ( = ?auto_561309 ?auto_561315 ) ) ( not ( = ?auto_561310 ?auto_561311 ) ) ( not ( = ?auto_561310 ?auto_561312 ) ) ( not ( = ?auto_561310 ?auto_561313 ) ) ( not ( = ?auto_561310 ?auto_561314 ) ) ( not ( = ?auto_561310 ?auto_561315 ) ) ( not ( = ?auto_561311 ?auto_561312 ) ) ( not ( = ?auto_561311 ?auto_561313 ) ) ( not ( = ?auto_561311 ?auto_561314 ) ) ( not ( = ?auto_561311 ?auto_561315 ) ) ( not ( = ?auto_561312 ?auto_561313 ) ) ( not ( = ?auto_561312 ?auto_561314 ) ) ( not ( = ?auto_561312 ?auto_561315 ) ) ( not ( = ?auto_561313 ?auto_561314 ) ) ( not ( = ?auto_561313 ?auto_561315 ) ) ( not ( = ?auto_561314 ?auto_561315 ) ) ( ON ?auto_561313 ?auto_561314 ) ( CLEAR ?auto_561311 ) ( ON ?auto_561312 ?auto_561313 ) ( CLEAR ?auto_561312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_561303 ?auto_561304 ?auto_561305 ?auto_561306 ?auto_561307 ?auto_561308 ?auto_561309 ?auto_561310 ?auto_561311 ?auto_561312 )
      ( MAKE-12PILE ?auto_561303 ?auto_561304 ?auto_561305 ?auto_561306 ?auto_561307 ?auto_561308 ?auto_561309 ?auto_561310 ?auto_561311 ?auto_561312 ?auto_561313 ?auto_561314 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561353 - BLOCK
      ?auto_561354 - BLOCK
      ?auto_561355 - BLOCK
      ?auto_561356 - BLOCK
      ?auto_561357 - BLOCK
      ?auto_561358 - BLOCK
      ?auto_561359 - BLOCK
      ?auto_561360 - BLOCK
      ?auto_561361 - BLOCK
      ?auto_561362 - BLOCK
      ?auto_561363 - BLOCK
      ?auto_561364 - BLOCK
    )
    :vars
    (
      ?auto_561365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561364 ?auto_561365 ) ( ON-TABLE ?auto_561353 ) ( ON ?auto_561354 ?auto_561353 ) ( ON ?auto_561355 ?auto_561354 ) ( ON ?auto_561356 ?auto_561355 ) ( ON ?auto_561357 ?auto_561356 ) ( ON ?auto_561358 ?auto_561357 ) ( ON ?auto_561359 ?auto_561358 ) ( ON ?auto_561360 ?auto_561359 ) ( not ( = ?auto_561353 ?auto_561354 ) ) ( not ( = ?auto_561353 ?auto_561355 ) ) ( not ( = ?auto_561353 ?auto_561356 ) ) ( not ( = ?auto_561353 ?auto_561357 ) ) ( not ( = ?auto_561353 ?auto_561358 ) ) ( not ( = ?auto_561353 ?auto_561359 ) ) ( not ( = ?auto_561353 ?auto_561360 ) ) ( not ( = ?auto_561353 ?auto_561361 ) ) ( not ( = ?auto_561353 ?auto_561362 ) ) ( not ( = ?auto_561353 ?auto_561363 ) ) ( not ( = ?auto_561353 ?auto_561364 ) ) ( not ( = ?auto_561353 ?auto_561365 ) ) ( not ( = ?auto_561354 ?auto_561355 ) ) ( not ( = ?auto_561354 ?auto_561356 ) ) ( not ( = ?auto_561354 ?auto_561357 ) ) ( not ( = ?auto_561354 ?auto_561358 ) ) ( not ( = ?auto_561354 ?auto_561359 ) ) ( not ( = ?auto_561354 ?auto_561360 ) ) ( not ( = ?auto_561354 ?auto_561361 ) ) ( not ( = ?auto_561354 ?auto_561362 ) ) ( not ( = ?auto_561354 ?auto_561363 ) ) ( not ( = ?auto_561354 ?auto_561364 ) ) ( not ( = ?auto_561354 ?auto_561365 ) ) ( not ( = ?auto_561355 ?auto_561356 ) ) ( not ( = ?auto_561355 ?auto_561357 ) ) ( not ( = ?auto_561355 ?auto_561358 ) ) ( not ( = ?auto_561355 ?auto_561359 ) ) ( not ( = ?auto_561355 ?auto_561360 ) ) ( not ( = ?auto_561355 ?auto_561361 ) ) ( not ( = ?auto_561355 ?auto_561362 ) ) ( not ( = ?auto_561355 ?auto_561363 ) ) ( not ( = ?auto_561355 ?auto_561364 ) ) ( not ( = ?auto_561355 ?auto_561365 ) ) ( not ( = ?auto_561356 ?auto_561357 ) ) ( not ( = ?auto_561356 ?auto_561358 ) ) ( not ( = ?auto_561356 ?auto_561359 ) ) ( not ( = ?auto_561356 ?auto_561360 ) ) ( not ( = ?auto_561356 ?auto_561361 ) ) ( not ( = ?auto_561356 ?auto_561362 ) ) ( not ( = ?auto_561356 ?auto_561363 ) ) ( not ( = ?auto_561356 ?auto_561364 ) ) ( not ( = ?auto_561356 ?auto_561365 ) ) ( not ( = ?auto_561357 ?auto_561358 ) ) ( not ( = ?auto_561357 ?auto_561359 ) ) ( not ( = ?auto_561357 ?auto_561360 ) ) ( not ( = ?auto_561357 ?auto_561361 ) ) ( not ( = ?auto_561357 ?auto_561362 ) ) ( not ( = ?auto_561357 ?auto_561363 ) ) ( not ( = ?auto_561357 ?auto_561364 ) ) ( not ( = ?auto_561357 ?auto_561365 ) ) ( not ( = ?auto_561358 ?auto_561359 ) ) ( not ( = ?auto_561358 ?auto_561360 ) ) ( not ( = ?auto_561358 ?auto_561361 ) ) ( not ( = ?auto_561358 ?auto_561362 ) ) ( not ( = ?auto_561358 ?auto_561363 ) ) ( not ( = ?auto_561358 ?auto_561364 ) ) ( not ( = ?auto_561358 ?auto_561365 ) ) ( not ( = ?auto_561359 ?auto_561360 ) ) ( not ( = ?auto_561359 ?auto_561361 ) ) ( not ( = ?auto_561359 ?auto_561362 ) ) ( not ( = ?auto_561359 ?auto_561363 ) ) ( not ( = ?auto_561359 ?auto_561364 ) ) ( not ( = ?auto_561359 ?auto_561365 ) ) ( not ( = ?auto_561360 ?auto_561361 ) ) ( not ( = ?auto_561360 ?auto_561362 ) ) ( not ( = ?auto_561360 ?auto_561363 ) ) ( not ( = ?auto_561360 ?auto_561364 ) ) ( not ( = ?auto_561360 ?auto_561365 ) ) ( not ( = ?auto_561361 ?auto_561362 ) ) ( not ( = ?auto_561361 ?auto_561363 ) ) ( not ( = ?auto_561361 ?auto_561364 ) ) ( not ( = ?auto_561361 ?auto_561365 ) ) ( not ( = ?auto_561362 ?auto_561363 ) ) ( not ( = ?auto_561362 ?auto_561364 ) ) ( not ( = ?auto_561362 ?auto_561365 ) ) ( not ( = ?auto_561363 ?auto_561364 ) ) ( not ( = ?auto_561363 ?auto_561365 ) ) ( not ( = ?auto_561364 ?auto_561365 ) ) ( ON ?auto_561363 ?auto_561364 ) ( ON ?auto_561362 ?auto_561363 ) ( CLEAR ?auto_561360 ) ( ON ?auto_561361 ?auto_561362 ) ( CLEAR ?auto_561361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_561353 ?auto_561354 ?auto_561355 ?auto_561356 ?auto_561357 ?auto_561358 ?auto_561359 ?auto_561360 ?auto_561361 )
      ( MAKE-12PILE ?auto_561353 ?auto_561354 ?auto_561355 ?auto_561356 ?auto_561357 ?auto_561358 ?auto_561359 ?auto_561360 ?auto_561361 ?auto_561362 ?auto_561363 ?auto_561364 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561403 - BLOCK
      ?auto_561404 - BLOCK
      ?auto_561405 - BLOCK
      ?auto_561406 - BLOCK
      ?auto_561407 - BLOCK
      ?auto_561408 - BLOCK
      ?auto_561409 - BLOCK
      ?auto_561410 - BLOCK
      ?auto_561411 - BLOCK
      ?auto_561412 - BLOCK
      ?auto_561413 - BLOCK
      ?auto_561414 - BLOCK
    )
    :vars
    (
      ?auto_561415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561414 ?auto_561415 ) ( ON-TABLE ?auto_561403 ) ( ON ?auto_561404 ?auto_561403 ) ( ON ?auto_561405 ?auto_561404 ) ( ON ?auto_561406 ?auto_561405 ) ( ON ?auto_561407 ?auto_561406 ) ( ON ?auto_561408 ?auto_561407 ) ( ON ?auto_561409 ?auto_561408 ) ( not ( = ?auto_561403 ?auto_561404 ) ) ( not ( = ?auto_561403 ?auto_561405 ) ) ( not ( = ?auto_561403 ?auto_561406 ) ) ( not ( = ?auto_561403 ?auto_561407 ) ) ( not ( = ?auto_561403 ?auto_561408 ) ) ( not ( = ?auto_561403 ?auto_561409 ) ) ( not ( = ?auto_561403 ?auto_561410 ) ) ( not ( = ?auto_561403 ?auto_561411 ) ) ( not ( = ?auto_561403 ?auto_561412 ) ) ( not ( = ?auto_561403 ?auto_561413 ) ) ( not ( = ?auto_561403 ?auto_561414 ) ) ( not ( = ?auto_561403 ?auto_561415 ) ) ( not ( = ?auto_561404 ?auto_561405 ) ) ( not ( = ?auto_561404 ?auto_561406 ) ) ( not ( = ?auto_561404 ?auto_561407 ) ) ( not ( = ?auto_561404 ?auto_561408 ) ) ( not ( = ?auto_561404 ?auto_561409 ) ) ( not ( = ?auto_561404 ?auto_561410 ) ) ( not ( = ?auto_561404 ?auto_561411 ) ) ( not ( = ?auto_561404 ?auto_561412 ) ) ( not ( = ?auto_561404 ?auto_561413 ) ) ( not ( = ?auto_561404 ?auto_561414 ) ) ( not ( = ?auto_561404 ?auto_561415 ) ) ( not ( = ?auto_561405 ?auto_561406 ) ) ( not ( = ?auto_561405 ?auto_561407 ) ) ( not ( = ?auto_561405 ?auto_561408 ) ) ( not ( = ?auto_561405 ?auto_561409 ) ) ( not ( = ?auto_561405 ?auto_561410 ) ) ( not ( = ?auto_561405 ?auto_561411 ) ) ( not ( = ?auto_561405 ?auto_561412 ) ) ( not ( = ?auto_561405 ?auto_561413 ) ) ( not ( = ?auto_561405 ?auto_561414 ) ) ( not ( = ?auto_561405 ?auto_561415 ) ) ( not ( = ?auto_561406 ?auto_561407 ) ) ( not ( = ?auto_561406 ?auto_561408 ) ) ( not ( = ?auto_561406 ?auto_561409 ) ) ( not ( = ?auto_561406 ?auto_561410 ) ) ( not ( = ?auto_561406 ?auto_561411 ) ) ( not ( = ?auto_561406 ?auto_561412 ) ) ( not ( = ?auto_561406 ?auto_561413 ) ) ( not ( = ?auto_561406 ?auto_561414 ) ) ( not ( = ?auto_561406 ?auto_561415 ) ) ( not ( = ?auto_561407 ?auto_561408 ) ) ( not ( = ?auto_561407 ?auto_561409 ) ) ( not ( = ?auto_561407 ?auto_561410 ) ) ( not ( = ?auto_561407 ?auto_561411 ) ) ( not ( = ?auto_561407 ?auto_561412 ) ) ( not ( = ?auto_561407 ?auto_561413 ) ) ( not ( = ?auto_561407 ?auto_561414 ) ) ( not ( = ?auto_561407 ?auto_561415 ) ) ( not ( = ?auto_561408 ?auto_561409 ) ) ( not ( = ?auto_561408 ?auto_561410 ) ) ( not ( = ?auto_561408 ?auto_561411 ) ) ( not ( = ?auto_561408 ?auto_561412 ) ) ( not ( = ?auto_561408 ?auto_561413 ) ) ( not ( = ?auto_561408 ?auto_561414 ) ) ( not ( = ?auto_561408 ?auto_561415 ) ) ( not ( = ?auto_561409 ?auto_561410 ) ) ( not ( = ?auto_561409 ?auto_561411 ) ) ( not ( = ?auto_561409 ?auto_561412 ) ) ( not ( = ?auto_561409 ?auto_561413 ) ) ( not ( = ?auto_561409 ?auto_561414 ) ) ( not ( = ?auto_561409 ?auto_561415 ) ) ( not ( = ?auto_561410 ?auto_561411 ) ) ( not ( = ?auto_561410 ?auto_561412 ) ) ( not ( = ?auto_561410 ?auto_561413 ) ) ( not ( = ?auto_561410 ?auto_561414 ) ) ( not ( = ?auto_561410 ?auto_561415 ) ) ( not ( = ?auto_561411 ?auto_561412 ) ) ( not ( = ?auto_561411 ?auto_561413 ) ) ( not ( = ?auto_561411 ?auto_561414 ) ) ( not ( = ?auto_561411 ?auto_561415 ) ) ( not ( = ?auto_561412 ?auto_561413 ) ) ( not ( = ?auto_561412 ?auto_561414 ) ) ( not ( = ?auto_561412 ?auto_561415 ) ) ( not ( = ?auto_561413 ?auto_561414 ) ) ( not ( = ?auto_561413 ?auto_561415 ) ) ( not ( = ?auto_561414 ?auto_561415 ) ) ( ON ?auto_561413 ?auto_561414 ) ( ON ?auto_561412 ?auto_561413 ) ( ON ?auto_561411 ?auto_561412 ) ( CLEAR ?auto_561409 ) ( ON ?auto_561410 ?auto_561411 ) ( CLEAR ?auto_561410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_561403 ?auto_561404 ?auto_561405 ?auto_561406 ?auto_561407 ?auto_561408 ?auto_561409 ?auto_561410 )
      ( MAKE-12PILE ?auto_561403 ?auto_561404 ?auto_561405 ?auto_561406 ?auto_561407 ?auto_561408 ?auto_561409 ?auto_561410 ?auto_561411 ?auto_561412 ?auto_561413 ?auto_561414 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561453 - BLOCK
      ?auto_561454 - BLOCK
      ?auto_561455 - BLOCK
      ?auto_561456 - BLOCK
      ?auto_561457 - BLOCK
      ?auto_561458 - BLOCK
      ?auto_561459 - BLOCK
      ?auto_561460 - BLOCK
      ?auto_561461 - BLOCK
      ?auto_561462 - BLOCK
      ?auto_561463 - BLOCK
      ?auto_561464 - BLOCK
    )
    :vars
    (
      ?auto_561465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561464 ?auto_561465 ) ( ON-TABLE ?auto_561453 ) ( ON ?auto_561454 ?auto_561453 ) ( ON ?auto_561455 ?auto_561454 ) ( ON ?auto_561456 ?auto_561455 ) ( ON ?auto_561457 ?auto_561456 ) ( ON ?auto_561458 ?auto_561457 ) ( not ( = ?auto_561453 ?auto_561454 ) ) ( not ( = ?auto_561453 ?auto_561455 ) ) ( not ( = ?auto_561453 ?auto_561456 ) ) ( not ( = ?auto_561453 ?auto_561457 ) ) ( not ( = ?auto_561453 ?auto_561458 ) ) ( not ( = ?auto_561453 ?auto_561459 ) ) ( not ( = ?auto_561453 ?auto_561460 ) ) ( not ( = ?auto_561453 ?auto_561461 ) ) ( not ( = ?auto_561453 ?auto_561462 ) ) ( not ( = ?auto_561453 ?auto_561463 ) ) ( not ( = ?auto_561453 ?auto_561464 ) ) ( not ( = ?auto_561453 ?auto_561465 ) ) ( not ( = ?auto_561454 ?auto_561455 ) ) ( not ( = ?auto_561454 ?auto_561456 ) ) ( not ( = ?auto_561454 ?auto_561457 ) ) ( not ( = ?auto_561454 ?auto_561458 ) ) ( not ( = ?auto_561454 ?auto_561459 ) ) ( not ( = ?auto_561454 ?auto_561460 ) ) ( not ( = ?auto_561454 ?auto_561461 ) ) ( not ( = ?auto_561454 ?auto_561462 ) ) ( not ( = ?auto_561454 ?auto_561463 ) ) ( not ( = ?auto_561454 ?auto_561464 ) ) ( not ( = ?auto_561454 ?auto_561465 ) ) ( not ( = ?auto_561455 ?auto_561456 ) ) ( not ( = ?auto_561455 ?auto_561457 ) ) ( not ( = ?auto_561455 ?auto_561458 ) ) ( not ( = ?auto_561455 ?auto_561459 ) ) ( not ( = ?auto_561455 ?auto_561460 ) ) ( not ( = ?auto_561455 ?auto_561461 ) ) ( not ( = ?auto_561455 ?auto_561462 ) ) ( not ( = ?auto_561455 ?auto_561463 ) ) ( not ( = ?auto_561455 ?auto_561464 ) ) ( not ( = ?auto_561455 ?auto_561465 ) ) ( not ( = ?auto_561456 ?auto_561457 ) ) ( not ( = ?auto_561456 ?auto_561458 ) ) ( not ( = ?auto_561456 ?auto_561459 ) ) ( not ( = ?auto_561456 ?auto_561460 ) ) ( not ( = ?auto_561456 ?auto_561461 ) ) ( not ( = ?auto_561456 ?auto_561462 ) ) ( not ( = ?auto_561456 ?auto_561463 ) ) ( not ( = ?auto_561456 ?auto_561464 ) ) ( not ( = ?auto_561456 ?auto_561465 ) ) ( not ( = ?auto_561457 ?auto_561458 ) ) ( not ( = ?auto_561457 ?auto_561459 ) ) ( not ( = ?auto_561457 ?auto_561460 ) ) ( not ( = ?auto_561457 ?auto_561461 ) ) ( not ( = ?auto_561457 ?auto_561462 ) ) ( not ( = ?auto_561457 ?auto_561463 ) ) ( not ( = ?auto_561457 ?auto_561464 ) ) ( not ( = ?auto_561457 ?auto_561465 ) ) ( not ( = ?auto_561458 ?auto_561459 ) ) ( not ( = ?auto_561458 ?auto_561460 ) ) ( not ( = ?auto_561458 ?auto_561461 ) ) ( not ( = ?auto_561458 ?auto_561462 ) ) ( not ( = ?auto_561458 ?auto_561463 ) ) ( not ( = ?auto_561458 ?auto_561464 ) ) ( not ( = ?auto_561458 ?auto_561465 ) ) ( not ( = ?auto_561459 ?auto_561460 ) ) ( not ( = ?auto_561459 ?auto_561461 ) ) ( not ( = ?auto_561459 ?auto_561462 ) ) ( not ( = ?auto_561459 ?auto_561463 ) ) ( not ( = ?auto_561459 ?auto_561464 ) ) ( not ( = ?auto_561459 ?auto_561465 ) ) ( not ( = ?auto_561460 ?auto_561461 ) ) ( not ( = ?auto_561460 ?auto_561462 ) ) ( not ( = ?auto_561460 ?auto_561463 ) ) ( not ( = ?auto_561460 ?auto_561464 ) ) ( not ( = ?auto_561460 ?auto_561465 ) ) ( not ( = ?auto_561461 ?auto_561462 ) ) ( not ( = ?auto_561461 ?auto_561463 ) ) ( not ( = ?auto_561461 ?auto_561464 ) ) ( not ( = ?auto_561461 ?auto_561465 ) ) ( not ( = ?auto_561462 ?auto_561463 ) ) ( not ( = ?auto_561462 ?auto_561464 ) ) ( not ( = ?auto_561462 ?auto_561465 ) ) ( not ( = ?auto_561463 ?auto_561464 ) ) ( not ( = ?auto_561463 ?auto_561465 ) ) ( not ( = ?auto_561464 ?auto_561465 ) ) ( ON ?auto_561463 ?auto_561464 ) ( ON ?auto_561462 ?auto_561463 ) ( ON ?auto_561461 ?auto_561462 ) ( ON ?auto_561460 ?auto_561461 ) ( CLEAR ?auto_561458 ) ( ON ?auto_561459 ?auto_561460 ) ( CLEAR ?auto_561459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_561453 ?auto_561454 ?auto_561455 ?auto_561456 ?auto_561457 ?auto_561458 ?auto_561459 )
      ( MAKE-12PILE ?auto_561453 ?auto_561454 ?auto_561455 ?auto_561456 ?auto_561457 ?auto_561458 ?auto_561459 ?auto_561460 ?auto_561461 ?auto_561462 ?auto_561463 ?auto_561464 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561503 - BLOCK
      ?auto_561504 - BLOCK
      ?auto_561505 - BLOCK
      ?auto_561506 - BLOCK
      ?auto_561507 - BLOCK
      ?auto_561508 - BLOCK
      ?auto_561509 - BLOCK
      ?auto_561510 - BLOCK
      ?auto_561511 - BLOCK
      ?auto_561512 - BLOCK
      ?auto_561513 - BLOCK
      ?auto_561514 - BLOCK
    )
    :vars
    (
      ?auto_561515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561514 ?auto_561515 ) ( ON-TABLE ?auto_561503 ) ( ON ?auto_561504 ?auto_561503 ) ( ON ?auto_561505 ?auto_561504 ) ( ON ?auto_561506 ?auto_561505 ) ( ON ?auto_561507 ?auto_561506 ) ( not ( = ?auto_561503 ?auto_561504 ) ) ( not ( = ?auto_561503 ?auto_561505 ) ) ( not ( = ?auto_561503 ?auto_561506 ) ) ( not ( = ?auto_561503 ?auto_561507 ) ) ( not ( = ?auto_561503 ?auto_561508 ) ) ( not ( = ?auto_561503 ?auto_561509 ) ) ( not ( = ?auto_561503 ?auto_561510 ) ) ( not ( = ?auto_561503 ?auto_561511 ) ) ( not ( = ?auto_561503 ?auto_561512 ) ) ( not ( = ?auto_561503 ?auto_561513 ) ) ( not ( = ?auto_561503 ?auto_561514 ) ) ( not ( = ?auto_561503 ?auto_561515 ) ) ( not ( = ?auto_561504 ?auto_561505 ) ) ( not ( = ?auto_561504 ?auto_561506 ) ) ( not ( = ?auto_561504 ?auto_561507 ) ) ( not ( = ?auto_561504 ?auto_561508 ) ) ( not ( = ?auto_561504 ?auto_561509 ) ) ( not ( = ?auto_561504 ?auto_561510 ) ) ( not ( = ?auto_561504 ?auto_561511 ) ) ( not ( = ?auto_561504 ?auto_561512 ) ) ( not ( = ?auto_561504 ?auto_561513 ) ) ( not ( = ?auto_561504 ?auto_561514 ) ) ( not ( = ?auto_561504 ?auto_561515 ) ) ( not ( = ?auto_561505 ?auto_561506 ) ) ( not ( = ?auto_561505 ?auto_561507 ) ) ( not ( = ?auto_561505 ?auto_561508 ) ) ( not ( = ?auto_561505 ?auto_561509 ) ) ( not ( = ?auto_561505 ?auto_561510 ) ) ( not ( = ?auto_561505 ?auto_561511 ) ) ( not ( = ?auto_561505 ?auto_561512 ) ) ( not ( = ?auto_561505 ?auto_561513 ) ) ( not ( = ?auto_561505 ?auto_561514 ) ) ( not ( = ?auto_561505 ?auto_561515 ) ) ( not ( = ?auto_561506 ?auto_561507 ) ) ( not ( = ?auto_561506 ?auto_561508 ) ) ( not ( = ?auto_561506 ?auto_561509 ) ) ( not ( = ?auto_561506 ?auto_561510 ) ) ( not ( = ?auto_561506 ?auto_561511 ) ) ( not ( = ?auto_561506 ?auto_561512 ) ) ( not ( = ?auto_561506 ?auto_561513 ) ) ( not ( = ?auto_561506 ?auto_561514 ) ) ( not ( = ?auto_561506 ?auto_561515 ) ) ( not ( = ?auto_561507 ?auto_561508 ) ) ( not ( = ?auto_561507 ?auto_561509 ) ) ( not ( = ?auto_561507 ?auto_561510 ) ) ( not ( = ?auto_561507 ?auto_561511 ) ) ( not ( = ?auto_561507 ?auto_561512 ) ) ( not ( = ?auto_561507 ?auto_561513 ) ) ( not ( = ?auto_561507 ?auto_561514 ) ) ( not ( = ?auto_561507 ?auto_561515 ) ) ( not ( = ?auto_561508 ?auto_561509 ) ) ( not ( = ?auto_561508 ?auto_561510 ) ) ( not ( = ?auto_561508 ?auto_561511 ) ) ( not ( = ?auto_561508 ?auto_561512 ) ) ( not ( = ?auto_561508 ?auto_561513 ) ) ( not ( = ?auto_561508 ?auto_561514 ) ) ( not ( = ?auto_561508 ?auto_561515 ) ) ( not ( = ?auto_561509 ?auto_561510 ) ) ( not ( = ?auto_561509 ?auto_561511 ) ) ( not ( = ?auto_561509 ?auto_561512 ) ) ( not ( = ?auto_561509 ?auto_561513 ) ) ( not ( = ?auto_561509 ?auto_561514 ) ) ( not ( = ?auto_561509 ?auto_561515 ) ) ( not ( = ?auto_561510 ?auto_561511 ) ) ( not ( = ?auto_561510 ?auto_561512 ) ) ( not ( = ?auto_561510 ?auto_561513 ) ) ( not ( = ?auto_561510 ?auto_561514 ) ) ( not ( = ?auto_561510 ?auto_561515 ) ) ( not ( = ?auto_561511 ?auto_561512 ) ) ( not ( = ?auto_561511 ?auto_561513 ) ) ( not ( = ?auto_561511 ?auto_561514 ) ) ( not ( = ?auto_561511 ?auto_561515 ) ) ( not ( = ?auto_561512 ?auto_561513 ) ) ( not ( = ?auto_561512 ?auto_561514 ) ) ( not ( = ?auto_561512 ?auto_561515 ) ) ( not ( = ?auto_561513 ?auto_561514 ) ) ( not ( = ?auto_561513 ?auto_561515 ) ) ( not ( = ?auto_561514 ?auto_561515 ) ) ( ON ?auto_561513 ?auto_561514 ) ( ON ?auto_561512 ?auto_561513 ) ( ON ?auto_561511 ?auto_561512 ) ( ON ?auto_561510 ?auto_561511 ) ( ON ?auto_561509 ?auto_561510 ) ( CLEAR ?auto_561507 ) ( ON ?auto_561508 ?auto_561509 ) ( CLEAR ?auto_561508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_561503 ?auto_561504 ?auto_561505 ?auto_561506 ?auto_561507 ?auto_561508 )
      ( MAKE-12PILE ?auto_561503 ?auto_561504 ?auto_561505 ?auto_561506 ?auto_561507 ?auto_561508 ?auto_561509 ?auto_561510 ?auto_561511 ?auto_561512 ?auto_561513 ?auto_561514 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561553 - BLOCK
      ?auto_561554 - BLOCK
      ?auto_561555 - BLOCK
      ?auto_561556 - BLOCK
      ?auto_561557 - BLOCK
      ?auto_561558 - BLOCK
      ?auto_561559 - BLOCK
      ?auto_561560 - BLOCK
      ?auto_561561 - BLOCK
      ?auto_561562 - BLOCK
      ?auto_561563 - BLOCK
      ?auto_561564 - BLOCK
    )
    :vars
    (
      ?auto_561565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561564 ?auto_561565 ) ( ON-TABLE ?auto_561553 ) ( ON ?auto_561554 ?auto_561553 ) ( ON ?auto_561555 ?auto_561554 ) ( ON ?auto_561556 ?auto_561555 ) ( not ( = ?auto_561553 ?auto_561554 ) ) ( not ( = ?auto_561553 ?auto_561555 ) ) ( not ( = ?auto_561553 ?auto_561556 ) ) ( not ( = ?auto_561553 ?auto_561557 ) ) ( not ( = ?auto_561553 ?auto_561558 ) ) ( not ( = ?auto_561553 ?auto_561559 ) ) ( not ( = ?auto_561553 ?auto_561560 ) ) ( not ( = ?auto_561553 ?auto_561561 ) ) ( not ( = ?auto_561553 ?auto_561562 ) ) ( not ( = ?auto_561553 ?auto_561563 ) ) ( not ( = ?auto_561553 ?auto_561564 ) ) ( not ( = ?auto_561553 ?auto_561565 ) ) ( not ( = ?auto_561554 ?auto_561555 ) ) ( not ( = ?auto_561554 ?auto_561556 ) ) ( not ( = ?auto_561554 ?auto_561557 ) ) ( not ( = ?auto_561554 ?auto_561558 ) ) ( not ( = ?auto_561554 ?auto_561559 ) ) ( not ( = ?auto_561554 ?auto_561560 ) ) ( not ( = ?auto_561554 ?auto_561561 ) ) ( not ( = ?auto_561554 ?auto_561562 ) ) ( not ( = ?auto_561554 ?auto_561563 ) ) ( not ( = ?auto_561554 ?auto_561564 ) ) ( not ( = ?auto_561554 ?auto_561565 ) ) ( not ( = ?auto_561555 ?auto_561556 ) ) ( not ( = ?auto_561555 ?auto_561557 ) ) ( not ( = ?auto_561555 ?auto_561558 ) ) ( not ( = ?auto_561555 ?auto_561559 ) ) ( not ( = ?auto_561555 ?auto_561560 ) ) ( not ( = ?auto_561555 ?auto_561561 ) ) ( not ( = ?auto_561555 ?auto_561562 ) ) ( not ( = ?auto_561555 ?auto_561563 ) ) ( not ( = ?auto_561555 ?auto_561564 ) ) ( not ( = ?auto_561555 ?auto_561565 ) ) ( not ( = ?auto_561556 ?auto_561557 ) ) ( not ( = ?auto_561556 ?auto_561558 ) ) ( not ( = ?auto_561556 ?auto_561559 ) ) ( not ( = ?auto_561556 ?auto_561560 ) ) ( not ( = ?auto_561556 ?auto_561561 ) ) ( not ( = ?auto_561556 ?auto_561562 ) ) ( not ( = ?auto_561556 ?auto_561563 ) ) ( not ( = ?auto_561556 ?auto_561564 ) ) ( not ( = ?auto_561556 ?auto_561565 ) ) ( not ( = ?auto_561557 ?auto_561558 ) ) ( not ( = ?auto_561557 ?auto_561559 ) ) ( not ( = ?auto_561557 ?auto_561560 ) ) ( not ( = ?auto_561557 ?auto_561561 ) ) ( not ( = ?auto_561557 ?auto_561562 ) ) ( not ( = ?auto_561557 ?auto_561563 ) ) ( not ( = ?auto_561557 ?auto_561564 ) ) ( not ( = ?auto_561557 ?auto_561565 ) ) ( not ( = ?auto_561558 ?auto_561559 ) ) ( not ( = ?auto_561558 ?auto_561560 ) ) ( not ( = ?auto_561558 ?auto_561561 ) ) ( not ( = ?auto_561558 ?auto_561562 ) ) ( not ( = ?auto_561558 ?auto_561563 ) ) ( not ( = ?auto_561558 ?auto_561564 ) ) ( not ( = ?auto_561558 ?auto_561565 ) ) ( not ( = ?auto_561559 ?auto_561560 ) ) ( not ( = ?auto_561559 ?auto_561561 ) ) ( not ( = ?auto_561559 ?auto_561562 ) ) ( not ( = ?auto_561559 ?auto_561563 ) ) ( not ( = ?auto_561559 ?auto_561564 ) ) ( not ( = ?auto_561559 ?auto_561565 ) ) ( not ( = ?auto_561560 ?auto_561561 ) ) ( not ( = ?auto_561560 ?auto_561562 ) ) ( not ( = ?auto_561560 ?auto_561563 ) ) ( not ( = ?auto_561560 ?auto_561564 ) ) ( not ( = ?auto_561560 ?auto_561565 ) ) ( not ( = ?auto_561561 ?auto_561562 ) ) ( not ( = ?auto_561561 ?auto_561563 ) ) ( not ( = ?auto_561561 ?auto_561564 ) ) ( not ( = ?auto_561561 ?auto_561565 ) ) ( not ( = ?auto_561562 ?auto_561563 ) ) ( not ( = ?auto_561562 ?auto_561564 ) ) ( not ( = ?auto_561562 ?auto_561565 ) ) ( not ( = ?auto_561563 ?auto_561564 ) ) ( not ( = ?auto_561563 ?auto_561565 ) ) ( not ( = ?auto_561564 ?auto_561565 ) ) ( ON ?auto_561563 ?auto_561564 ) ( ON ?auto_561562 ?auto_561563 ) ( ON ?auto_561561 ?auto_561562 ) ( ON ?auto_561560 ?auto_561561 ) ( ON ?auto_561559 ?auto_561560 ) ( ON ?auto_561558 ?auto_561559 ) ( CLEAR ?auto_561556 ) ( ON ?auto_561557 ?auto_561558 ) ( CLEAR ?auto_561557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_561553 ?auto_561554 ?auto_561555 ?auto_561556 ?auto_561557 )
      ( MAKE-12PILE ?auto_561553 ?auto_561554 ?auto_561555 ?auto_561556 ?auto_561557 ?auto_561558 ?auto_561559 ?auto_561560 ?auto_561561 ?auto_561562 ?auto_561563 ?auto_561564 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561603 - BLOCK
      ?auto_561604 - BLOCK
      ?auto_561605 - BLOCK
      ?auto_561606 - BLOCK
      ?auto_561607 - BLOCK
      ?auto_561608 - BLOCK
      ?auto_561609 - BLOCK
      ?auto_561610 - BLOCK
      ?auto_561611 - BLOCK
      ?auto_561612 - BLOCK
      ?auto_561613 - BLOCK
      ?auto_561614 - BLOCK
    )
    :vars
    (
      ?auto_561615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561614 ?auto_561615 ) ( ON-TABLE ?auto_561603 ) ( ON ?auto_561604 ?auto_561603 ) ( ON ?auto_561605 ?auto_561604 ) ( not ( = ?auto_561603 ?auto_561604 ) ) ( not ( = ?auto_561603 ?auto_561605 ) ) ( not ( = ?auto_561603 ?auto_561606 ) ) ( not ( = ?auto_561603 ?auto_561607 ) ) ( not ( = ?auto_561603 ?auto_561608 ) ) ( not ( = ?auto_561603 ?auto_561609 ) ) ( not ( = ?auto_561603 ?auto_561610 ) ) ( not ( = ?auto_561603 ?auto_561611 ) ) ( not ( = ?auto_561603 ?auto_561612 ) ) ( not ( = ?auto_561603 ?auto_561613 ) ) ( not ( = ?auto_561603 ?auto_561614 ) ) ( not ( = ?auto_561603 ?auto_561615 ) ) ( not ( = ?auto_561604 ?auto_561605 ) ) ( not ( = ?auto_561604 ?auto_561606 ) ) ( not ( = ?auto_561604 ?auto_561607 ) ) ( not ( = ?auto_561604 ?auto_561608 ) ) ( not ( = ?auto_561604 ?auto_561609 ) ) ( not ( = ?auto_561604 ?auto_561610 ) ) ( not ( = ?auto_561604 ?auto_561611 ) ) ( not ( = ?auto_561604 ?auto_561612 ) ) ( not ( = ?auto_561604 ?auto_561613 ) ) ( not ( = ?auto_561604 ?auto_561614 ) ) ( not ( = ?auto_561604 ?auto_561615 ) ) ( not ( = ?auto_561605 ?auto_561606 ) ) ( not ( = ?auto_561605 ?auto_561607 ) ) ( not ( = ?auto_561605 ?auto_561608 ) ) ( not ( = ?auto_561605 ?auto_561609 ) ) ( not ( = ?auto_561605 ?auto_561610 ) ) ( not ( = ?auto_561605 ?auto_561611 ) ) ( not ( = ?auto_561605 ?auto_561612 ) ) ( not ( = ?auto_561605 ?auto_561613 ) ) ( not ( = ?auto_561605 ?auto_561614 ) ) ( not ( = ?auto_561605 ?auto_561615 ) ) ( not ( = ?auto_561606 ?auto_561607 ) ) ( not ( = ?auto_561606 ?auto_561608 ) ) ( not ( = ?auto_561606 ?auto_561609 ) ) ( not ( = ?auto_561606 ?auto_561610 ) ) ( not ( = ?auto_561606 ?auto_561611 ) ) ( not ( = ?auto_561606 ?auto_561612 ) ) ( not ( = ?auto_561606 ?auto_561613 ) ) ( not ( = ?auto_561606 ?auto_561614 ) ) ( not ( = ?auto_561606 ?auto_561615 ) ) ( not ( = ?auto_561607 ?auto_561608 ) ) ( not ( = ?auto_561607 ?auto_561609 ) ) ( not ( = ?auto_561607 ?auto_561610 ) ) ( not ( = ?auto_561607 ?auto_561611 ) ) ( not ( = ?auto_561607 ?auto_561612 ) ) ( not ( = ?auto_561607 ?auto_561613 ) ) ( not ( = ?auto_561607 ?auto_561614 ) ) ( not ( = ?auto_561607 ?auto_561615 ) ) ( not ( = ?auto_561608 ?auto_561609 ) ) ( not ( = ?auto_561608 ?auto_561610 ) ) ( not ( = ?auto_561608 ?auto_561611 ) ) ( not ( = ?auto_561608 ?auto_561612 ) ) ( not ( = ?auto_561608 ?auto_561613 ) ) ( not ( = ?auto_561608 ?auto_561614 ) ) ( not ( = ?auto_561608 ?auto_561615 ) ) ( not ( = ?auto_561609 ?auto_561610 ) ) ( not ( = ?auto_561609 ?auto_561611 ) ) ( not ( = ?auto_561609 ?auto_561612 ) ) ( not ( = ?auto_561609 ?auto_561613 ) ) ( not ( = ?auto_561609 ?auto_561614 ) ) ( not ( = ?auto_561609 ?auto_561615 ) ) ( not ( = ?auto_561610 ?auto_561611 ) ) ( not ( = ?auto_561610 ?auto_561612 ) ) ( not ( = ?auto_561610 ?auto_561613 ) ) ( not ( = ?auto_561610 ?auto_561614 ) ) ( not ( = ?auto_561610 ?auto_561615 ) ) ( not ( = ?auto_561611 ?auto_561612 ) ) ( not ( = ?auto_561611 ?auto_561613 ) ) ( not ( = ?auto_561611 ?auto_561614 ) ) ( not ( = ?auto_561611 ?auto_561615 ) ) ( not ( = ?auto_561612 ?auto_561613 ) ) ( not ( = ?auto_561612 ?auto_561614 ) ) ( not ( = ?auto_561612 ?auto_561615 ) ) ( not ( = ?auto_561613 ?auto_561614 ) ) ( not ( = ?auto_561613 ?auto_561615 ) ) ( not ( = ?auto_561614 ?auto_561615 ) ) ( ON ?auto_561613 ?auto_561614 ) ( ON ?auto_561612 ?auto_561613 ) ( ON ?auto_561611 ?auto_561612 ) ( ON ?auto_561610 ?auto_561611 ) ( ON ?auto_561609 ?auto_561610 ) ( ON ?auto_561608 ?auto_561609 ) ( ON ?auto_561607 ?auto_561608 ) ( CLEAR ?auto_561605 ) ( ON ?auto_561606 ?auto_561607 ) ( CLEAR ?auto_561606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_561603 ?auto_561604 ?auto_561605 ?auto_561606 )
      ( MAKE-12PILE ?auto_561603 ?auto_561604 ?auto_561605 ?auto_561606 ?auto_561607 ?auto_561608 ?auto_561609 ?auto_561610 ?auto_561611 ?auto_561612 ?auto_561613 ?auto_561614 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561653 - BLOCK
      ?auto_561654 - BLOCK
      ?auto_561655 - BLOCK
      ?auto_561656 - BLOCK
      ?auto_561657 - BLOCK
      ?auto_561658 - BLOCK
      ?auto_561659 - BLOCK
      ?auto_561660 - BLOCK
      ?auto_561661 - BLOCK
      ?auto_561662 - BLOCK
      ?auto_561663 - BLOCK
      ?auto_561664 - BLOCK
    )
    :vars
    (
      ?auto_561665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561664 ?auto_561665 ) ( ON-TABLE ?auto_561653 ) ( ON ?auto_561654 ?auto_561653 ) ( not ( = ?auto_561653 ?auto_561654 ) ) ( not ( = ?auto_561653 ?auto_561655 ) ) ( not ( = ?auto_561653 ?auto_561656 ) ) ( not ( = ?auto_561653 ?auto_561657 ) ) ( not ( = ?auto_561653 ?auto_561658 ) ) ( not ( = ?auto_561653 ?auto_561659 ) ) ( not ( = ?auto_561653 ?auto_561660 ) ) ( not ( = ?auto_561653 ?auto_561661 ) ) ( not ( = ?auto_561653 ?auto_561662 ) ) ( not ( = ?auto_561653 ?auto_561663 ) ) ( not ( = ?auto_561653 ?auto_561664 ) ) ( not ( = ?auto_561653 ?auto_561665 ) ) ( not ( = ?auto_561654 ?auto_561655 ) ) ( not ( = ?auto_561654 ?auto_561656 ) ) ( not ( = ?auto_561654 ?auto_561657 ) ) ( not ( = ?auto_561654 ?auto_561658 ) ) ( not ( = ?auto_561654 ?auto_561659 ) ) ( not ( = ?auto_561654 ?auto_561660 ) ) ( not ( = ?auto_561654 ?auto_561661 ) ) ( not ( = ?auto_561654 ?auto_561662 ) ) ( not ( = ?auto_561654 ?auto_561663 ) ) ( not ( = ?auto_561654 ?auto_561664 ) ) ( not ( = ?auto_561654 ?auto_561665 ) ) ( not ( = ?auto_561655 ?auto_561656 ) ) ( not ( = ?auto_561655 ?auto_561657 ) ) ( not ( = ?auto_561655 ?auto_561658 ) ) ( not ( = ?auto_561655 ?auto_561659 ) ) ( not ( = ?auto_561655 ?auto_561660 ) ) ( not ( = ?auto_561655 ?auto_561661 ) ) ( not ( = ?auto_561655 ?auto_561662 ) ) ( not ( = ?auto_561655 ?auto_561663 ) ) ( not ( = ?auto_561655 ?auto_561664 ) ) ( not ( = ?auto_561655 ?auto_561665 ) ) ( not ( = ?auto_561656 ?auto_561657 ) ) ( not ( = ?auto_561656 ?auto_561658 ) ) ( not ( = ?auto_561656 ?auto_561659 ) ) ( not ( = ?auto_561656 ?auto_561660 ) ) ( not ( = ?auto_561656 ?auto_561661 ) ) ( not ( = ?auto_561656 ?auto_561662 ) ) ( not ( = ?auto_561656 ?auto_561663 ) ) ( not ( = ?auto_561656 ?auto_561664 ) ) ( not ( = ?auto_561656 ?auto_561665 ) ) ( not ( = ?auto_561657 ?auto_561658 ) ) ( not ( = ?auto_561657 ?auto_561659 ) ) ( not ( = ?auto_561657 ?auto_561660 ) ) ( not ( = ?auto_561657 ?auto_561661 ) ) ( not ( = ?auto_561657 ?auto_561662 ) ) ( not ( = ?auto_561657 ?auto_561663 ) ) ( not ( = ?auto_561657 ?auto_561664 ) ) ( not ( = ?auto_561657 ?auto_561665 ) ) ( not ( = ?auto_561658 ?auto_561659 ) ) ( not ( = ?auto_561658 ?auto_561660 ) ) ( not ( = ?auto_561658 ?auto_561661 ) ) ( not ( = ?auto_561658 ?auto_561662 ) ) ( not ( = ?auto_561658 ?auto_561663 ) ) ( not ( = ?auto_561658 ?auto_561664 ) ) ( not ( = ?auto_561658 ?auto_561665 ) ) ( not ( = ?auto_561659 ?auto_561660 ) ) ( not ( = ?auto_561659 ?auto_561661 ) ) ( not ( = ?auto_561659 ?auto_561662 ) ) ( not ( = ?auto_561659 ?auto_561663 ) ) ( not ( = ?auto_561659 ?auto_561664 ) ) ( not ( = ?auto_561659 ?auto_561665 ) ) ( not ( = ?auto_561660 ?auto_561661 ) ) ( not ( = ?auto_561660 ?auto_561662 ) ) ( not ( = ?auto_561660 ?auto_561663 ) ) ( not ( = ?auto_561660 ?auto_561664 ) ) ( not ( = ?auto_561660 ?auto_561665 ) ) ( not ( = ?auto_561661 ?auto_561662 ) ) ( not ( = ?auto_561661 ?auto_561663 ) ) ( not ( = ?auto_561661 ?auto_561664 ) ) ( not ( = ?auto_561661 ?auto_561665 ) ) ( not ( = ?auto_561662 ?auto_561663 ) ) ( not ( = ?auto_561662 ?auto_561664 ) ) ( not ( = ?auto_561662 ?auto_561665 ) ) ( not ( = ?auto_561663 ?auto_561664 ) ) ( not ( = ?auto_561663 ?auto_561665 ) ) ( not ( = ?auto_561664 ?auto_561665 ) ) ( ON ?auto_561663 ?auto_561664 ) ( ON ?auto_561662 ?auto_561663 ) ( ON ?auto_561661 ?auto_561662 ) ( ON ?auto_561660 ?auto_561661 ) ( ON ?auto_561659 ?auto_561660 ) ( ON ?auto_561658 ?auto_561659 ) ( ON ?auto_561657 ?auto_561658 ) ( ON ?auto_561656 ?auto_561657 ) ( CLEAR ?auto_561654 ) ( ON ?auto_561655 ?auto_561656 ) ( CLEAR ?auto_561655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_561653 ?auto_561654 ?auto_561655 )
      ( MAKE-12PILE ?auto_561653 ?auto_561654 ?auto_561655 ?auto_561656 ?auto_561657 ?auto_561658 ?auto_561659 ?auto_561660 ?auto_561661 ?auto_561662 ?auto_561663 ?auto_561664 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561703 - BLOCK
      ?auto_561704 - BLOCK
      ?auto_561705 - BLOCK
      ?auto_561706 - BLOCK
      ?auto_561707 - BLOCK
      ?auto_561708 - BLOCK
      ?auto_561709 - BLOCK
      ?auto_561710 - BLOCK
      ?auto_561711 - BLOCK
      ?auto_561712 - BLOCK
      ?auto_561713 - BLOCK
      ?auto_561714 - BLOCK
    )
    :vars
    (
      ?auto_561715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561714 ?auto_561715 ) ( ON-TABLE ?auto_561703 ) ( not ( = ?auto_561703 ?auto_561704 ) ) ( not ( = ?auto_561703 ?auto_561705 ) ) ( not ( = ?auto_561703 ?auto_561706 ) ) ( not ( = ?auto_561703 ?auto_561707 ) ) ( not ( = ?auto_561703 ?auto_561708 ) ) ( not ( = ?auto_561703 ?auto_561709 ) ) ( not ( = ?auto_561703 ?auto_561710 ) ) ( not ( = ?auto_561703 ?auto_561711 ) ) ( not ( = ?auto_561703 ?auto_561712 ) ) ( not ( = ?auto_561703 ?auto_561713 ) ) ( not ( = ?auto_561703 ?auto_561714 ) ) ( not ( = ?auto_561703 ?auto_561715 ) ) ( not ( = ?auto_561704 ?auto_561705 ) ) ( not ( = ?auto_561704 ?auto_561706 ) ) ( not ( = ?auto_561704 ?auto_561707 ) ) ( not ( = ?auto_561704 ?auto_561708 ) ) ( not ( = ?auto_561704 ?auto_561709 ) ) ( not ( = ?auto_561704 ?auto_561710 ) ) ( not ( = ?auto_561704 ?auto_561711 ) ) ( not ( = ?auto_561704 ?auto_561712 ) ) ( not ( = ?auto_561704 ?auto_561713 ) ) ( not ( = ?auto_561704 ?auto_561714 ) ) ( not ( = ?auto_561704 ?auto_561715 ) ) ( not ( = ?auto_561705 ?auto_561706 ) ) ( not ( = ?auto_561705 ?auto_561707 ) ) ( not ( = ?auto_561705 ?auto_561708 ) ) ( not ( = ?auto_561705 ?auto_561709 ) ) ( not ( = ?auto_561705 ?auto_561710 ) ) ( not ( = ?auto_561705 ?auto_561711 ) ) ( not ( = ?auto_561705 ?auto_561712 ) ) ( not ( = ?auto_561705 ?auto_561713 ) ) ( not ( = ?auto_561705 ?auto_561714 ) ) ( not ( = ?auto_561705 ?auto_561715 ) ) ( not ( = ?auto_561706 ?auto_561707 ) ) ( not ( = ?auto_561706 ?auto_561708 ) ) ( not ( = ?auto_561706 ?auto_561709 ) ) ( not ( = ?auto_561706 ?auto_561710 ) ) ( not ( = ?auto_561706 ?auto_561711 ) ) ( not ( = ?auto_561706 ?auto_561712 ) ) ( not ( = ?auto_561706 ?auto_561713 ) ) ( not ( = ?auto_561706 ?auto_561714 ) ) ( not ( = ?auto_561706 ?auto_561715 ) ) ( not ( = ?auto_561707 ?auto_561708 ) ) ( not ( = ?auto_561707 ?auto_561709 ) ) ( not ( = ?auto_561707 ?auto_561710 ) ) ( not ( = ?auto_561707 ?auto_561711 ) ) ( not ( = ?auto_561707 ?auto_561712 ) ) ( not ( = ?auto_561707 ?auto_561713 ) ) ( not ( = ?auto_561707 ?auto_561714 ) ) ( not ( = ?auto_561707 ?auto_561715 ) ) ( not ( = ?auto_561708 ?auto_561709 ) ) ( not ( = ?auto_561708 ?auto_561710 ) ) ( not ( = ?auto_561708 ?auto_561711 ) ) ( not ( = ?auto_561708 ?auto_561712 ) ) ( not ( = ?auto_561708 ?auto_561713 ) ) ( not ( = ?auto_561708 ?auto_561714 ) ) ( not ( = ?auto_561708 ?auto_561715 ) ) ( not ( = ?auto_561709 ?auto_561710 ) ) ( not ( = ?auto_561709 ?auto_561711 ) ) ( not ( = ?auto_561709 ?auto_561712 ) ) ( not ( = ?auto_561709 ?auto_561713 ) ) ( not ( = ?auto_561709 ?auto_561714 ) ) ( not ( = ?auto_561709 ?auto_561715 ) ) ( not ( = ?auto_561710 ?auto_561711 ) ) ( not ( = ?auto_561710 ?auto_561712 ) ) ( not ( = ?auto_561710 ?auto_561713 ) ) ( not ( = ?auto_561710 ?auto_561714 ) ) ( not ( = ?auto_561710 ?auto_561715 ) ) ( not ( = ?auto_561711 ?auto_561712 ) ) ( not ( = ?auto_561711 ?auto_561713 ) ) ( not ( = ?auto_561711 ?auto_561714 ) ) ( not ( = ?auto_561711 ?auto_561715 ) ) ( not ( = ?auto_561712 ?auto_561713 ) ) ( not ( = ?auto_561712 ?auto_561714 ) ) ( not ( = ?auto_561712 ?auto_561715 ) ) ( not ( = ?auto_561713 ?auto_561714 ) ) ( not ( = ?auto_561713 ?auto_561715 ) ) ( not ( = ?auto_561714 ?auto_561715 ) ) ( ON ?auto_561713 ?auto_561714 ) ( ON ?auto_561712 ?auto_561713 ) ( ON ?auto_561711 ?auto_561712 ) ( ON ?auto_561710 ?auto_561711 ) ( ON ?auto_561709 ?auto_561710 ) ( ON ?auto_561708 ?auto_561709 ) ( ON ?auto_561707 ?auto_561708 ) ( ON ?auto_561706 ?auto_561707 ) ( ON ?auto_561705 ?auto_561706 ) ( CLEAR ?auto_561703 ) ( ON ?auto_561704 ?auto_561705 ) ( CLEAR ?auto_561704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_561703 ?auto_561704 )
      ( MAKE-12PILE ?auto_561703 ?auto_561704 ?auto_561705 ?auto_561706 ?auto_561707 ?auto_561708 ?auto_561709 ?auto_561710 ?auto_561711 ?auto_561712 ?auto_561713 ?auto_561714 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_561753 - BLOCK
      ?auto_561754 - BLOCK
      ?auto_561755 - BLOCK
      ?auto_561756 - BLOCK
      ?auto_561757 - BLOCK
      ?auto_561758 - BLOCK
      ?auto_561759 - BLOCK
      ?auto_561760 - BLOCK
      ?auto_561761 - BLOCK
      ?auto_561762 - BLOCK
      ?auto_561763 - BLOCK
      ?auto_561764 - BLOCK
    )
    :vars
    (
      ?auto_561765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561764 ?auto_561765 ) ( not ( = ?auto_561753 ?auto_561754 ) ) ( not ( = ?auto_561753 ?auto_561755 ) ) ( not ( = ?auto_561753 ?auto_561756 ) ) ( not ( = ?auto_561753 ?auto_561757 ) ) ( not ( = ?auto_561753 ?auto_561758 ) ) ( not ( = ?auto_561753 ?auto_561759 ) ) ( not ( = ?auto_561753 ?auto_561760 ) ) ( not ( = ?auto_561753 ?auto_561761 ) ) ( not ( = ?auto_561753 ?auto_561762 ) ) ( not ( = ?auto_561753 ?auto_561763 ) ) ( not ( = ?auto_561753 ?auto_561764 ) ) ( not ( = ?auto_561753 ?auto_561765 ) ) ( not ( = ?auto_561754 ?auto_561755 ) ) ( not ( = ?auto_561754 ?auto_561756 ) ) ( not ( = ?auto_561754 ?auto_561757 ) ) ( not ( = ?auto_561754 ?auto_561758 ) ) ( not ( = ?auto_561754 ?auto_561759 ) ) ( not ( = ?auto_561754 ?auto_561760 ) ) ( not ( = ?auto_561754 ?auto_561761 ) ) ( not ( = ?auto_561754 ?auto_561762 ) ) ( not ( = ?auto_561754 ?auto_561763 ) ) ( not ( = ?auto_561754 ?auto_561764 ) ) ( not ( = ?auto_561754 ?auto_561765 ) ) ( not ( = ?auto_561755 ?auto_561756 ) ) ( not ( = ?auto_561755 ?auto_561757 ) ) ( not ( = ?auto_561755 ?auto_561758 ) ) ( not ( = ?auto_561755 ?auto_561759 ) ) ( not ( = ?auto_561755 ?auto_561760 ) ) ( not ( = ?auto_561755 ?auto_561761 ) ) ( not ( = ?auto_561755 ?auto_561762 ) ) ( not ( = ?auto_561755 ?auto_561763 ) ) ( not ( = ?auto_561755 ?auto_561764 ) ) ( not ( = ?auto_561755 ?auto_561765 ) ) ( not ( = ?auto_561756 ?auto_561757 ) ) ( not ( = ?auto_561756 ?auto_561758 ) ) ( not ( = ?auto_561756 ?auto_561759 ) ) ( not ( = ?auto_561756 ?auto_561760 ) ) ( not ( = ?auto_561756 ?auto_561761 ) ) ( not ( = ?auto_561756 ?auto_561762 ) ) ( not ( = ?auto_561756 ?auto_561763 ) ) ( not ( = ?auto_561756 ?auto_561764 ) ) ( not ( = ?auto_561756 ?auto_561765 ) ) ( not ( = ?auto_561757 ?auto_561758 ) ) ( not ( = ?auto_561757 ?auto_561759 ) ) ( not ( = ?auto_561757 ?auto_561760 ) ) ( not ( = ?auto_561757 ?auto_561761 ) ) ( not ( = ?auto_561757 ?auto_561762 ) ) ( not ( = ?auto_561757 ?auto_561763 ) ) ( not ( = ?auto_561757 ?auto_561764 ) ) ( not ( = ?auto_561757 ?auto_561765 ) ) ( not ( = ?auto_561758 ?auto_561759 ) ) ( not ( = ?auto_561758 ?auto_561760 ) ) ( not ( = ?auto_561758 ?auto_561761 ) ) ( not ( = ?auto_561758 ?auto_561762 ) ) ( not ( = ?auto_561758 ?auto_561763 ) ) ( not ( = ?auto_561758 ?auto_561764 ) ) ( not ( = ?auto_561758 ?auto_561765 ) ) ( not ( = ?auto_561759 ?auto_561760 ) ) ( not ( = ?auto_561759 ?auto_561761 ) ) ( not ( = ?auto_561759 ?auto_561762 ) ) ( not ( = ?auto_561759 ?auto_561763 ) ) ( not ( = ?auto_561759 ?auto_561764 ) ) ( not ( = ?auto_561759 ?auto_561765 ) ) ( not ( = ?auto_561760 ?auto_561761 ) ) ( not ( = ?auto_561760 ?auto_561762 ) ) ( not ( = ?auto_561760 ?auto_561763 ) ) ( not ( = ?auto_561760 ?auto_561764 ) ) ( not ( = ?auto_561760 ?auto_561765 ) ) ( not ( = ?auto_561761 ?auto_561762 ) ) ( not ( = ?auto_561761 ?auto_561763 ) ) ( not ( = ?auto_561761 ?auto_561764 ) ) ( not ( = ?auto_561761 ?auto_561765 ) ) ( not ( = ?auto_561762 ?auto_561763 ) ) ( not ( = ?auto_561762 ?auto_561764 ) ) ( not ( = ?auto_561762 ?auto_561765 ) ) ( not ( = ?auto_561763 ?auto_561764 ) ) ( not ( = ?auto_561763 ?auto_561765 ) ) ( not ( = ?auto_561764 ?auto_561765 ) ) ( ON ?auto_561763 ?auto_561764 ) ( ON ?auto_561762 ?auto_561763 ) ( ON ?auto_561761 ?auto_561762 ) ( ON ?auto_561760 ?auto_561761 ) ( ON ?auto_561759 ?auto_561760 ) ( ON ?auto_561758 ?auto_561759 ) ( ON ?auto_561757 ?auto_561758 ) ( ON ?auto_561756 ?auto_561757 ) ( ON ?auto_561755 ?auto_561756 ) ( ON ?auto_561754 ?auto_561755 ) ( ON ?auto_561753 ?auto_561754 ) ( CLEAR ?auto_561753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_561753 )
      ( MAKE-12PILE ?auto_561753 ?auto_561754 ?auto_561755 ?auto_561756 ?auto_561757 ?auto_561758 ?auto_561759 ?auto_561760 ?auto_561761 ?auto_561762 ?auto_561763 ?auto_561764 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_561804 - BLOCK
      ?auto_561805 - BLOCK
      ?auto_561806 - BLOCK
      ?auto_561807 - BLOCK
      ?auto_561808 - BLOCK
      ?auto_561809 - BLOCK
      ?auto_561810 - BLOCK
      ?auto_561811 - BLOCK
      ?auto_561812 - BLOCK
      ?auto_561813 - BLOCK
      ?auto_561814 - BLOCK
      ?auto_561815 - BLOCK
      ?auto_561816 - BLOCK
    )
    :vars
    (
      ?auto_561817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_561815 ) ( ON ?auto_561816 ?auto_561817 ) ( CLEAR ?auto_561816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_561804 ) ( ON ?auto_561805 ?auto_561804 ) ( ON ?auto_561806 ?auto_561805 ) ( ON ?auto_561807 ?auto_561806 ) ( ON ?auto_561808 ?auto_561807 ) ( ON ?auto_561809 ?auto_561808 ) ( ON ?auto_561810 ?auto_561809 ) ( ON ?auto_561811 ?auto_561810 ) ( ON ?auto_561812 ?auto_561811 ) ( ON ?auto_561813 ?auto_561812 ) ( ON ?auto_561814 ?auto_561813 ) ( ON ?auto_561815 ?auto_561814 ) ( not ( = ?auto_561804 ?auto_561805 ) ) ( not ( = ?auto_561804 ?auto_561806 ) ) ( not ( = ?auto_561804 ?auto_561807 ) ) ( not ( = ?auto_561804 ?auto_561808 ) ) ( not ( = ?auto_561804 ?auto_561809 ) ) ( not ( = ?auto_561804 ?auto_561810 ) ) ( not ( = ?auto_561804 ?auto_561811 ) ) ( not ( = ?auto_561804 ?auto_561812 ) ) ( not ( = ?auto_561804 ?auto_561813 ) ) ( not ( = ?auto_561804 ?auto_561814 ) ) ( not ( = ?auto_561804 ?auto_561815 ) ) ( not ( = ?auto_561804 ?auto_561816 ) ) ( not ( = ?auto_561804 ?auto_561817 ) ) ( not ( = ?auto_561805 ?auto_561806 ) ) ( not ( = ?auto_561805 ?auto_561807 ) ) ( not ( = ?auto_561805 ?auto_561808 ) ) ( not ( = ?auto_561805 ?auto_561809 ) ) ( not ( = ?auto_561805 ?auto_561810 ) ) ( not ( = ?auto_561805 ?auto_561811 ) ) ( not ( = ?auto_561805 ?auto_561812 ) ) ( not ( = ?auto_561805 ?auto_561813 ) ) ( not ( = ?auto_561805 ?auto_561814 ) ) ( not ( = ?auto_561805 ?auto_561815 ) ) ( not ( = ?auto_561805 ?auto_561816 ) ) ( not ( = ?auto_561805 ?auto_561817 ) ) ( not ( = ?auto_561806 ?auto_561807 ) ) ( not ( = ?auto_561806 ?auto_561808 ) ) ( not ( = ?auto_561806 ?auto_561809 ) ) ( not ( = ?auto_561806 ?auto_561810 ) ) ( not ( = ?auto_561806 ?auto_561811 ) ) ( not ( = ?auto_561806 ?auto_561812 ) ) ( not ( = ?auto_561806 ?auto_561813 ) ) ( not ( = ?auto_561806 ?auto_561814 ) ) ( not ( = ?auto_561806 ?auto_561815 ) ) ( not ( = ?auto_561806 ?auto_561816 ) ) ( not ( = ?auto_561806 ?auto_561817 ) ) ( not ( = ?auto_561807 ?auto_561808 ) ) ( not ( = ?auto_561807 ?auto_561809 ) ) ( not ( = ?auto_561807 ?auto_561810 ) ) ( not ( = ?auto_561807 ?auto_561811 ) ) ( not ( = ?auto_561807 ?auto_561812 ) ) ( not ( = ?auto_561807 ?auto_561813 ) ) ( not ( = ?auto_561807 ?auto_561814 ) ) ( not ( = ?auto_561807 ?auto_561815 ) ) ( not ( = ?auto_561807 ?auto_561816 ) ) ( not ( = ?auto_561807 ?auto_561817 ) ) ( not ( = ?auto_561808 ?auto_561809 ) ) ( not ( = ?auto_561808 ?auto_561810 ) ) ( not ( = ?auto_561808 ?auto_561811 ) ) ( not ( = ?auto_561808 ?auto_561812 ) ) ( not ( = ?auto_561808 ?auto_561813 ) ) ( not ( = ?auto_561808 ?auto_561814 ) ) ( not ( = ?auto_561808 ?auto_561815 ) ) ( not ( = ?auto_561808 ?auto_561816 ) ) ( not ( = ?auto_561808 ?auto_561817 ) ) ( not ( = ?auto_561809 ?auto_561810 ) ) ( not ( = ?auto_561809 ?auto_561811 ) ) ( not ( = ?auto_561809 ?auto_561812 ) ) ( not ( = ?auto_561809 ?auto_561813 ) ) ( not ( = ?auto_561809 ?auto_561814 ) ) ( not ( = ?auto_561809 ?auto_561815 ) ) ( not ( = ?auto_561809 ?auto_561816 ) ) ( not ( = ?auto_561809 ?auto_561817 ) ) ( not ( = ?auto_561810 ?auto_561811 ) ) ( not ( = ?auto_561810 ?auto_561812 ) ) ( not ( = ?auto_561810 ?auto_561813 ) ) ( not ( = ?auto_561810 ?auto_561814 ) ) ( not ( = ?auto_561810 ?auto_561815 ) ) ( not ( = ?auto_561810 ?auto_561816 ) ) ( not ( = ?auto_561810 ?auto_561817 ) ) ( not ( = ?auto_561811 ?auto_561812 ) ) ( not ( = ?auto_561811 ?auto_561813 ) ) ( not ( = ?auto_561811 ?auto_561814 ) ) ( not ( = ?auto_561811 ?auto_561815 ) ) ( not ( = ?auto_561811 ?auto_561816 ) ) ( not ( = ?auto_561811 ?auto_561817 ) ) ( not ( = ?auto_561812 ?auto_561813 ) ) ( not ( = ?auto_561812 ?auto_561814 ) ) ( not ( = ?auto_561812 ?auto_561815 ) ) ( not ( = ?auto_561812 ?auto_561816 ) ) ( not ( = ?auto_561812 ?auto_561817 ) ) ( not ( = ?auto_561813 ?auto_561814 ) ) ( not ( = ?auto_561813 ?auto_561815 ) ) ( not ( = ?auto_561813 ?auto_561816 ) ) ( not ( = ?auto_561813 ?auto_561817 ) ) ( not ( = ?auto_561814 ?auto_561815 ) ) ( not ( = ?auto_561814 ?auto_561816 ) ) ( not ( = ?auto_561814 ?auto_561817 ) ) ( not ( = ?auto_561815 ?auto_561816 ) ) ( not ( = ?auto_561815 ?auto_561817 ) ) ( not ( = ?auto_561816 ?auto_561817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_561816 ?auto_561817 )
      ( !STACK ?auto_561816 ?auto_561815 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_561858 - BLOCK
      ?auto_561859 - BLOCK
      ?auto_561860 - BLOCK
      ?auto_561861 - BLOCK
      ?auto_561862 - BLOCK
      ?auto_561863 - BLOCK
      ?auto_561864 - BLOCK
      ?auto_561865 - BLOCK
      ?auto_561866 - BLOCK
      ?auto_561867 - BLOCK
      ?auto_561868 - BLOCK
      ?auto_561869 - BLOCK
      ?auto_561870 - BLOCK
    )
    :vars
    (
      ?auto_561871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561870 ?auto_561871 ) ( ON-TABLE ?auto_561858 ) ( ON ?auto_561859 ?auto_561858 ) ( ON ?auto_561860 ?auto_561859 ) ( ON ?auto_561861 ?auto_561860 ) ( ON ?auto_561862 ?auto_561861 ) ( ON ?auto_561863 ?auto_561862 ) ( ON ?auto_561864 ?auto_561863 ) ( ON ?auto_561865 ?auto_561864 ) ( ON ?auto_561866 ?auto_561865 ) ( ON ?auto_561867 ?auto_561866 ) ( ON ?auto_561868 ?auto_561867 ) ( not ( = ?auto_561858 ?auto_561859 ) ) ( not ( = ?auto_561858 ?auto_561860 ) ) ( not ( = ?auto_561858 ?auto_561861 ) ) ( not ( = ?auto_561858 ?auto_561862 ) ) ( not ( = ?auto_561858 ?auto_561863 ) ) ( not ( = ?auto_561858 ?auto_561864 ) ) ( not ( = ?auto_561858 ?auto_561865 ) ) ( not ( = ?auto_561858 ?auto_561866 ) ) ( not ( = ?auto_561858 ?auto_561867 ) ) ( not ( = ?auto_561858 ?auto_561868 ) ) ( not ( = ?auto_561858 ?auto_561869 ) ) ( not ( = ?auto_561858 ?auto_561870 ) ) ( not ( = ?auto_561858 ?auto_561871 ) ) ( not ( = ?auto_561859 ?auto_561860 ) ) ( not ( = ?auto_561859 ?auto_561861 ) ) ( not ( = ?auto_561859 ?auto_561862 ) ) ( not ( = ?auto_561859 ?auto_561863 ) ) ( not ( = ?auto_561859 ?auto_561864 ) ) ( not ( = ?auto_561859 ?auto_561865 ) ) ( not ( = ?auto_561859 ?auto_561866 ) ) ( not ( = ?auto_561859 ?auto_561867 ) ) ( not ( = ?auto_561859 ?auto_561868 ) ) ( not ( = ?auto_561859 ?auto_561869 ) ) ( not ( = ?auto_561859 ?auto_561870 ) ) ( not ( = ?auto_561859 ?auto_561871 ) ) ( not ( = ?auto_561860 ?auto_561861 ) ) ( not ( = ?auto_561860 ?auto_561862 ) ) ( not ( = ?auto_561860 ?auto_561863 ) ) ( not ( = ?auto_561860 ?auto_561864 ) ) ( not ( = ?auto_561860 ?auto_561865 ) ) ( not ( = ?auto_561860 ?auto_561866 ) ) ( not ( = ?auto_561860 ?auto_561867 ) ) ( not ( = ?auto_561860 ?auto_561868 ) ) ( not ( = ?auto_561860 ?auto_561869 ) ) ( not ( = ?auto_561860 ?auto_561870 ) ) ( not ( = ?auto_561860 ?auto_561871 ) ) ( not ( = ?auto_561861 ?auto_561862 ) ) ( not ( = ?auto_561861 ?auto_561863 ) ) ( not ( = ?auto_561861 ?auto_561864 ) ) ( not ( = ?auto_561861 ?auto_561865 ) ) ( not ( = ?auto_561861 ?auto_561866 ) ) ( not ( = ?auto_561861 ?auto_561867 ) ) ( not ( = ?auto_561861 ?auto_561868 ) ) ( not ( = ?auto_561861 ?auto_561869 ) ) ( not ( = ?auto_561861 ?auto_561870 ) ) ( not ( = ?auto_561861 ?auto_561871 ) ) ( not ( = ?auto_561862 ?auto_561863 ) ) ( not ( = ?auto_561862 ?auto_561864 ) ) ( not ( = ?auto_561862 ?auto_561865 ) ) ( not ( = ?auto_561862 ?auto_561866 ) ) ( not ( = ?auto_561862 ?auto_561867 ) ) ( not ( = ?auto_561862 ?auto_561868 ) ) ( not ( = ?auto_561862 ?auto_561869 ) ) ( not ( = ?auto_561862 ?auto_561870 ) ) ( not ( = ?auto_561862 ?auto_561871 ) ) ( not ( = ?auto_561863 ?auto_561864 ) ) ( not ( = ?auto_561863 ?auto_561865 ) ) ( not ( = ?auto_561863 ?auto_561866 ) ) ( not ( = ?auto_561863 ?auto_561867 ) ) ( not ( = ?auto_561863 ?auto_561868 ) ) ( not ( = ?auto_561863 ?auto_561869 ) ) ( not ( = ?auto_561863 ?auto_561870 ) ) ( not ( = ?auto_561863 ?auto_561871 ) ) ( not ( = ?auto_561864 ?auto_561865 ) ) ( not ( = ?auto_561864 ?auto_561866 ) ) ( not ( = ?auto_561864 ?auto_561867 ) ) ( not ( = ?auto_561864 ?auto_561868 ) ) ( not ( = ?auto_561864 ?auto_561869 ) ) ( not ( = ?auto_561864 ?auto_561870 ) ) ( not ( = ?auto_561864 ?auto_561871 ) ) ( not ( = ?auto_561865 ?auto_561866 ) ) ( not ( = ?auto_561865 ?auto_561867 ) ) ( not ( = ?auto_561865 ?auto_561868 ) ) ( not ( = ?auto_561865 ?auto_561869 ) ) ( not ( = ?auto_561865 ?auto_561870 ) ) ( not ( = ?auto_561865 ?auto_561871 ) ) ( not ( = ?auto_561866 ?auto_561867 ) ) ( not ( = ?auto_561866 ?auto_561868 ) ) ( not ( = ?auto_561866 ?auto_561869 ) ) ( not ( = ?auto_561866 ?auto_561870 ) ) ( not ( = ?auto_561866 ?auto_561871 ) ) ( not ( = ?auto_561867 ?auto_561868 ) ) ( not ( = ?auto_561867 ?auto_561869 ) ) ( not ( = ?auto_561867 ?auto_561870 ) ) ( not ( = ?auto_561867 ?auto_561871 ) ) ( not ( = ?auto_561868 ?auto_561869 ) ) ( not ( = ?auto_561868 ?auto_561870 ) ) ( not ( = ?auto_561868 ?auto_561871 ) ) ( not ( = ?auto_561869 ?auto_561870 ) ) ( not ( = ?auto_561869 ?auto_561871 ) ) ( not ( = ?auto_561870 ?auto_561871 ) ) ( CLEAR ?auto_561868 ) ( ON ?auto_561869 ?auto_561870 ) ( CLEAR ?auto_561869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_561858 ?auto_561859 ?auto_561860 ?auto_561861 ?auto_561862 ?auto_561863 ?auto_561864 ?auto_561865 ?auto_561866 ?auto_561867 ?auto_561868 ?auto_561869 )
      ( MAKE-13PILE ?auto_561858 ?auto_561859 ?auto_561860 ?auto_561861 ?auto_561862 ?auto_561863 ?auto_561864 ?auto_561865 ?auto_561866 ?auto_561867 ?auto_561868 ?auto_561869 ?auto_561870 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_561912 - BLOCK
      ?auto_561913 - BLOCK
      ?auto_561914 - BLOCK
      ?auto_561915 - BLOCK
      ?auto_561916 - BLOCK
      ?auto_561917 - BLOCK
      ?auto_561918 - BLOCK
      ?auto_561919 - BLOCK
      ?auto_561920 - BLOCK
      ?auto_561921 - BLOCK
      ?auto_561922 - BLOCK
      ?auto_561923 - BLOCK
      ?auto_561924 - BLOCK
    )
    :vars
    (
      ?auto_561925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561924 ?auto_561925 ) ( ON-TABLE ?auto_561912 ) ( ON ?auto_561913 ?auto_561912 ) ( ON ?auto_561914 ?auto_561913 ) ( ON ?auto_561915 ?auto_561914 ) ( ON ?auto_561916 ?auto_561915 ) ( ON ?auto_561917 ?auto_561916 ) ( ON ?auto_561918 ?auto_561917 ) ( ON ?auto_561919 ?auto_561918 ) ( ON ?auto_561920 ?auto_561919 ) ( ON ?auto_561921 ?auto_561920 ) ( not ( = ?auto_561912 ?auto_561913 ) ) ( not ( = ?auto_561912 ?auto_561914 ) ) ( not ( = ?auto_561912 ?auto_561915 ) ) ( not ( = ?auto_561912 ?auto_561916 ) ) ( not ( = ?auto_561912 ?auto_561917 ) ) ( not ( = ?auto_561912 ?auto_561918 ) ) ( not ( = ?auto_561912 ?auto_561919 ) ) ( not ( = ?auto_561912 ?auto_561920 ) ) ( not ( = ?auto_561912 ?auto_561921 ) ) ( not ( = ?auto_561912 ?auto_561922 ) ) ( not ( = ?auto_561912 ?auto_561923 ) ) ( not ( = ?auto_561912 ?auto_561924 ) ) ( not ( = ?auto_561912 ?auto_561925 ) ) ( not ( = ?auto_561913 ?auto_561914 ) ) ( not ( = ?auto_561913 ?auto_561915 ) ) ( not ( = ?auto_561913 ?auto_561916 ) ) ( not ( = ?auto_561913 ?auto_561917 ) ) ( not ( = ?auto_561913 ?auto_561918 ) ) ( not ( = ?auto_561913 ?auto_561919 ) ) ( not ( = ?auto_561913 ?auto_561920 ) ) ( not ( = ?auto_561913 ?auto_561921 ) ) ( not ( = ?auto_561913 ?auto_561922 ) ) ( not ( = ?auto_561913 ?auto_561923 ) ) ( not ( = ?auto_561913 ?auto_561924 ) ) ( not ( = ?auto_561913 ?auto_561925 ) ) ( not ( = ?auto_561914 ?auto_561915 ) ) ( not ( = ?auto_561914 ?auto_561916 ) ) ( not ( = ?auto_561914 ?auto_561917 ) ) ( not ( = ?auto_561914 ?auto_561918 ) ) ( not ( = ?auto_561914 ?auto_561919 ) ) ( not ( = ?auto_561914 ?auto_561920 ) ) ( not ( = ?auto_561914 ?auto_561921 ) ) ( not ( = ?auto_561914 ?auto_561922 ) ) ( not ( = ?auto_561914 ?auto_561923 ) ) ( not ( = ?auto_561914 ?auto_561924 ) ) ( not ( = ?auto_561914 ?auto_561925 ) ) ( not ( = ?auto_561915 ?auto_561916 ) ) ( not ( = ?auto_561915 ?auto_561917 ) ) ( not ( = ?auto_561915 ?auto_561918 ) ) ( not ( = ?auto_561915 ?auto_561919 ) ) ( not ( = ?auto_561915 ?auto_561920 ) ) ( not ( = ?auto_561915 ?auto_561921 ) ) ( not ( = ?auto_561915 ?auto_561922 ) ) ( not ( = ?auto_561915 ?auto_561923 ) ) ( not ( = ?auto_561915 ?auto_561924 ) ) ( not ( = ?auto_561915 ?auto_561925 ) ) ( not ( = ?auto_561916 ?auto_561917 ) ) ( not ( = ?auto_561916 ?auto_561918 ) ) ( not ( = ?auto_561916 ?auto_561919 ) ) ( not ( = ?auto_561916 ?auto_561920 ) ) ( not ( = ?auto_561916 ?auto_561921 ) ) ( not ( = ?auto_561916 ?auto_561922 ) ) ( not ( = ?auto_561916 ?auto_561923 ) ) ( not ( = ?auto_561916 ?auto_561924 ) ) ( not ( = ?auto_561916 ?auto_561925 ) ) ( not ( = ?auto_561917 ?auto_561918 ) ) ( not ( = ?auto_561917 ?auto_561919 ) ) ( not ( = ?auto_561917 ?auto_561920 ) ) ( not ( = ?auto_561917 ?auto_561921 ) ) ( not ( = ?auto_561917 ?auto_561922 ) ) ( not ( = ?auto_561917 ?auto_561923 ) ) ( not ( = ?auto_561917 ?auto_561924 ) ) ( not ( = ?auto_561917 ?auto_561925 ) ) ( not ( = ?auto_561918 ?auto_561919 ) ) ( not ( = ?auto_561918 ?auto_561920 ) ) ( not ( = ?auto_561918 ?auto_561921 ) ) ( not ( = ?auto_561918 ?auto_561922 ) ) ( not ( = ?auto_561918 ?auto_561923 ) ) ( not ( = ?auto_561918 ?auto_561924 ) ) ( not ( = ?auto_561918 ?auto_561925 ) ) ( not ( = ?auto_561919 ?auto_561920 ) ) ( not ( = ?auto_561919 ?auto_561921 ) ) ( not ( = ?auto_561919 ?auto_561922 ) ) ( not ( = ?auto_561919 ?auto_561923 ) ) ( not ( = ?auto_561919 ?auto_561924 ) ) ( not ( = ?auto_561919 ?auto_561925 ) ) ( not ( = ?auto_561920 ?auto_561921 ) ) ( not ( = ?auto_561920 ?auto_561922 ) ) ( not ( = ?auto_561920 ?auto_561923 ) ) ( not ( = ?auto_561920 ?auto_561924 ) ) ( not ( = ?auto_561920 ?auto_561925 ) ) ( not ( = ?auto_561921 ?auto_561922 ) ) ( not ( = ?auto_561921 ?auto_561923 ) ) ( not ( = ?auto_561921 ?auto_561924 ) ) ( not ( = ?auto_561921 ?auto_561925 ) ) ( not ( = ?auto_561922 ?auto_561923 ) ) ( not ( = ?auto_561922 ?auto_561924 ) ) ( not ( = ?auto_561922 ?auto_561925 ) ) ( not ( = ?auto_561923 ?auto_561924 ) ) ( not ( = ?auto_561923 ?auto_561925 ) ) ( not ( = ?auto_561924 ?auto_561925 ) ) ( ON ?auto_561923 ?auto_561924 ) ( CLEAR ?auto_561921 ) ( ON ?auto_561922 ?auto_561923 ) ( CLEAR ?auto_561922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_561912 ?auto_561913 ?auto_561914 ?auto_561915 ?auto_561916 ?auto_561917 ?auto_561918 ?auto_561919 ?auto_561920 ?auto_561921 ?auto_561922 )
      ( MAKE-13PILE ?auto_561912 ?auto_561913 ?auto_561914 ?auto_561915 ?auto_561916 ?auto_561917 ?auto_561918 ?auto_561919 ?auto_561920 ?auto_561921 ?auto_561922 ?auto_561923 ?auto_561924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_561966 - BLOCK
      ?auto_561967 - BLOCK
      ?auto_561968 - BLOCK
      ?auto_561969 - BLOCK
      ?auto_561970 - BLOCK
      ?auto_561971 - BLOCK
      ?auto_561972 - BLOCK
      ?auto_561973 - BLOCK
      ?auto_561974 - BLOCK
      ?auto_561975 - BLOCK
      ?auto_561976 - BLOCK
      ?auto_561977 - BLOCK
      ?auto_561978 - BLOCK
    )
    :vars
    (
      ?auto_561979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_561978 ?auto_561979 ) ( ON-TABLE ?auto_561966 ) ( ON ?auto_561967 ?auto_561966 ) ( ON ?auto_561968 ?auto_561967 ) ( ON ?auto_561969 ?auto_561968 ) ( ON ?auto_561970 ?auto_561969 ) ( ON ?auto_561971 ?auto_561970 ) ( ON ?auto_561972 ?auto_561971 ) ( ON ?auto_561973 ?auto_561972 ) ( ON ?auto_561974 ?auto_561973 ) ( not ( = ?auto_561966 ?auto_561967 ) ) ( not ( = ?auto_561966 ?auto_561968 ) ) ( not ( = ?auto_561966 ?auto_561969 ) ) ( not ( = ?auto_561966 ?auto_561970 ) ) ( not ( = ?auto_561966 ?auto_561971 ) ) ( not ( = ?auto_561966 ?auto_561972 ) ) ( not ( = ?auto_561966 ?auto_561973 ) ) ( not ( = ?auto_561966 ?auto_561974 ) ) ( not ( = ?auto_561966 ?auto_561975 ) ) ( not ( = ?auto_561966 ?auto_561976 ) ) ( not ( = ?auto_561966 ?auto_561977 ) ) ( not ( = ?auto_561966 ?auto_561978 ) ) ( not ( = ?auto_561966 ?auto_561979 ) ) ( not ( = ?auto_561967 ?auto_561968 ) ) ( not ( = ?auto_561967 ?auto_561969 ) ) ( not ( = ?auto_561967 ?auto_561970 ) ) ( not ( = ?auto_561967 ?auto_561971 ) ) ( not ( = ?auto_561967 ?auto_561972 ) ) ( not ( = ?auto_561967 ?auto_561973 ) ) ( not ( = ?auto_561967 ?auto_561974 ) ) ( not ( = ?auto_561967 ?auto_561975 ) ) ( not ( = ?auto_561967 ?auto_561976 ) ) ( not ( = ?auto_561967 ?auto_561977 ) ) ( not ( = ?auto_561967 ?auto_561978 ) ) ( not ( = ?auto_561967 ?auto_561979 ) ) ( not ( = ?auto_561968 ?auto_561969 ) ) ( not ( = ?auto_561968 ?auto_561970 ) ) ( not ( = ?auto_561968 ?auto_561971 ) ) ( not ( = ?auto_561968 ?auto_561972 ) ) ( not ( = ?auto_561968 ?auto_561973 ) ) ( not ( = ?auto_561968 ?auto_561974 ) ) ( not ( = ?auto_561968 ?auto_561975 ) ) ( not ( = ?auto_561968 ?auto_561976 ) ) ( not ( = ?auto_561968 ?auto_561977 ) ) ( not ( = ?auto_561968 ?auto_561978 ) ) ( not ( = ?auto_561968 ?auto_561979 ) ) ( not ( = ?auto_561969 ?auto_561970 ) ) ( not ( = ?auto_561969 ?auto_561971 ) ) ( not ( = ?auto_561969 ?auto_561972 ) ) ( not ( = ?auto_561969 ?auto_561973 ) ) ( not ( = ?auto_561969 ?auto_561974 ) ) ( not ( = ?auto_561969 ?auto_561975 ) ) ( not ( = ?auto_561969 ?auto_561976 ) ) ( not ( = ?auto_561969 ?auto_561977 ) ) ( not ( = ?auto_561969 ?auto_561978 ) ) ( not ( = ?auto_561969 ?auto_561979 ) ) ( not ( = ?auto_561970 ?auto_561971 ) ) ( not ( = ?auto_561970 ?auto_561972 ) ) ( not ( = ?auto_561970 ?auto_561973 ) ) ( not ( = ?auto_561970 ?auto_561974 ) ) ( not ( = ?auto_561970 ?auto_561975 ) ) ( not ( = ?auto_561970 ?auto_561976 ) ) ( not ( = ?auto_561970 ?auto_561977 ) ) ( not ( = ?auto_561970 ?auto_561978 ) ) ( not ( = ?auto_561970 ?auto_561979 ) ) ( not ( = ?auto_561971 ?auto_561972 ) ) ( not ( = ?auto_561971 ?auto_561973 ) ) ( not ( = ?auto_561971 ?auto_561974 ) ) ( not ( = ?auto_561971 ?auto_561975 ) ) ( not ( = ?auto_561971 ?auto_561976 ) ) ( not ( = ?auto_561971 ?auto_561977 ) ) ( not ( = ?auto_561971 ?auto_561978 ) ) ( not ( = ?auto_561971 ?auto_561979 ) ) ( not ( = ?auto_561972 ?auto_561973 ) ) ( not ( = ?auto_561972 ?auto_561974 ) ) ( not ( = ?auto_561972 ?auto_561975 ) ) ( not ( = ?auto_561972 ?auto_561976 ) ) ( not ( = ?auto_561972 ?auto_561977 ) ) ( not ( = ?auto_561972 ?auto_561978 ) ) ( not ( = ?auto_561972 ?auto_561979 ) ) ( not ( = ?auto_561973 ?auto_561974 ) ) ( not ( = ?auto_561973 ?auto_561975 ) ) ( not ( = ?auto_561973 ?auto_561976 ) ) ( not ( = ?auto_561973 ?auto_561977 ) ) ( not ( = ?auto_561973 ?auto_561978 ) ) ( not ( = ?auto_561973 ?auto_561979 ) ) ( not ( = ?auto_561974 ?auto_561975 ) ) ( not ( = ?auto_561974 ?auto_561976 ) ) ( not ( = ?auto_561974 ?auto_561977 ) ) ( not ( = ?auto_561974 ?auto_561978 ) ) ( not ( = ?auto_561974 ?auto_561979 ) ) ( not ( = ?auto_561975 ?auto_561976 ) ) ( not ( = ?auto_561975 ?auto_561977 ) ) ( not ( = ?auto_561975 ?auto_561978 ) ) ( not ( = ?auto_561975 ?auto_561979 ) ) ( not ( = ?auto_561976 ?auto_561977 ) ) ( not ( = ?auto_561976 ?auto_561978 ) ) ( not ( = ?auto_561976 ?auto_561979 ) ) ( not ( = ?auto_561977 ?auto_561978 ) ) ( not ( = ?auto_561977 ?auto_561979 ) ) ( not ( = ?auto_561978 ?auto_561979 ) ) ( ON ?auto_561977 ?auto_561978 ) ( ON ?auto_561976 ?auto_561977 ) ( CLEAR ?auto_561974 ) ( ON ?auto_561975 ?auto_561976 ) ( CLEAR ?auto_561975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_561966 ?auto_561967 ?auto_561968 ?auto_561969 ?auto_561970 ?auto_561971 ?auto_561972 ?auto_561973 ?auto_561974 ?auto_561975 )
      ( MAKE-13PILE ?auto_561966 ?auto_561967 ?auto_561968 ?auto_561969 ?auto_561970 ?auto_561971 ?auto_561972 ?auto_561973 ?auto_561974 ?auto_561975 ?auto_561976 ?auto_561977 ?auto_561978 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562020 - BLOCK
      ?auto_562021 - BLOCK
      ?auto_562022 - BLOCK
      ?auto_562023 - BLOCK
      ?auto_562024 - BLOCK
      ?auto_562025 - BLOCK
      ?auto_562026 - BLOCK
      ?auto_562027 - BLOCK
      ?auto_562028 - BLOCK
      ?auto_562029 - BLOCK
      ?auto_562030 - BLOCK
      ?auto_562031 - BLOCK
      ?auto_562032 - BLOCK
    )
    :vars
    (
      ?auto_562033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562032 ?auto_562033 ) ( ON-TABLE ?auto_562020 ) ( ON ?auto_562021 ?auto_562020 ) ( ON ?auto_562022 ?auto_562021 ) ( ON ?auto_562023 ?auto_562022 ) ( ON ?auto_562024 ?auto_562023 ) ( ON ?auto_562025 ?auto_562024 ) ( ON ?auto_562026 ?auto_562025 ) ( ON ?auto_562027 ?auto_562026 ) ( not ( = ?auto_562020 ?auto_562021 ) ) ( not ( = ?auto_562020 ?auto_562022 ) ) ( not ( = ?auto_562020 ?auto_562023 ) ) ( not ( = ?auto_562020 ?auto_562024 ) ) ( not ( = ?auto_562020 ?auto_562025 ) ) ( not ( = ?auto_562020 ?auto_562026 ) ) ( not ( = ?auto_562020 ?auto_562027 ) ) ( not ( = ?auto_562020 ?auto_562028 ) ) ( not ( = ?auto_562020 ?auto_562029 ) ) ( not ( = ?auto_562020 ?auto_562030 ) ) ( not ( = ?auto_562020 ?auto_562031 ) ) ( not ( = ?auto_562020 ?auto_562032 ) ) ( not ( = ?auto_562020 ?auto_562033 ) ) ( not ( = ?auto_562021 ?auto_562022 ) ) ( not ( = ?auto_562021 ?auto_562023 ) ) ( not ( = ?auto_562021 ?auto_562024 ) ) ( not ( = ?auto_562021 ?auto_562025 ) ) ( not ( = ?auto_562021 ?auto_562026 ) ) ( not ( = ?auto_562021 ?auto_562027 ) ) ( not ( = ?auto_562021 ?auto_562028 ) ) ( not ( = ?auto_562021 ?auto_562029 ) ) ( not ( = ?auto_562021 ?auto_562030 ) ) ( not ( = ?auto_562021 ?auto_562031 ) ) ( not ( = ?auto_562021 ?auto_562032 ) ) ( not ( = ?auto_562021 ?auto_562033 ) ) ( not ( = ?auto_562022 ?auto_562023 ) ) ( not ( = ?auto_562022 ?auto_562024 ) ) ( not ( = ?auto_562022 ?auto_562025 ) ) ( not ( = ?auto_562022 ?auto_562026 ) ) ( not ( = ?auto_562022 ?auto_562027 ) ) ( not ( = ?auto_562022 ?auto_562028 ) ) ( not ( = ?auto_562022 ?auto_562029 ) ) ( not ( = ?auto_562022 ?auto_562030 ) ) ( not ( = ?auto_562022 ?auto_562031 ) ) ( not ( = ?auto_562022 ?auto_562032 ) ) ( not ( = ?auto_562022 ?auto_562033 ) ) ( not ( = ?auto_562023 ?auto_562024 ) ) ( not ( = ?auto_562023 ?auto_562025 ) ) ( not ( = ?auto_562023 ?auto_562026 ) ) ( not ( = ?auto_562023 ?auto_562027 ) ) ( not ( = ?auto_562023 ?auto_562028 ) ) ( not ( = ?auto_562023 ?auto_562029 ) ) ( not ( = ?auto_562023 ?auto_562030 ) ) ( not ( = ?auto_562023 ?auto_562031 ) ) ( not ( = ?auto_562023 ?auto_562032 ) ) ( not ( = ?auto_562023 ?auto_562033 ) ) ( not ( = ?auto_562024 ?auto_562025 ) ) ( not ( = ?auto_562024 ?auto_562026 ) ) ( not ( = ?auto_562024 ?auto_562027 ) ) ( not ( = ?auto_562024 ?auto_562028 ) ) ( not ( = ?auto_562024 ?auto_562029 ) ) ( not ( = ?auto_562024 ?auto_562030 ) ) ( not ( = ?auto_562024 ?auto_562031 ) ) ( not ( = ?auto_562024 ?auto_562032 ) ) ( not ( = ?auto_562024 ?auto_562033 ) ) ( not ( = ?auto_562025 ?auto_562026 ) ) ( not ( = ?auto_562025 ?auto_562027 ) ) ( not ( = ?auto_562025 ?auto_562028 ) ) ( not ( = ?auto_562025 ?auto_562029 ) ) ( not ( = ?auto_562025 ?auto_562030 ) ) ( not ( = ?auto_562025 ?auto_562031 ) ) ( not ( = ?auto_562025 ?auto_562032 ) ) ( not ( = ?auto_562025 ?auto_562033 ) ) ( not ( = ?auto_562026 ?auto_562027 ) ) ( not ( = ?auto_562026 ?auto_562028 ) ) ( not ( = ?auto_562026 ?auto_562029 ) ) ( not ( = ?auto_562026 ?auto_562030 ) ) ( not ( = ?auto_562026 ?auto_562031 ) ) ( not ( = ?auto_562026 ?auto_562032 ) ) ( not ( = ?auto_562026 ?auto_562033 ) ) ( not ( = ?auto_562027 ?auto_562028 ) ) ( not ( = ?auto_562027 ?auto_562029 ) ) ( not ( = ?auto_562027 ?auto_562030 ) ) ( not ( = ?auto_562027 ?auto_562031 ) ) ( not ( = ?auto_562027 ?auto_562032 ) ) ( not ( = ?auto_562027 ?auto_562033 ) ) ( not ( = ?auto_562028 ?auto_562029 ) ) ( not ( = ?auto_562028 ?auto_562030 ) ) ( not ( = ?auto_562028 ?auto_562031 ) ) ( not ( = ?auto_562028 ?auto_562032 ) ) ( not ( = ?auto_562028 ?auto_562033 ) ) ( not ( = ?auto_562029 ?auto_562030 ) ) ( not ( = ?auto_562029 ?auto_562031 ) ) ( not ( = ?auto_562029 ?auto_562032 ) ) ( not ( = ?auto_562029 ?auto_562033 ) ) ( not ( = ?auto_562030 ?auto_562031 ) ) ( not ( = ?auto_562030 ?auto_562032 ) ) ( not ( = ?auto_562030 ?auto_562033 ) ) ( not ( = ?auto_562031 ?auto_562032 ) ) ( not ( = ?auto_562031 ?auto_562033 ) ) ( not ( = ?auto_562032 ?auto_562033 ) ) ( ON ?auto_562031 ?auto_562032 ) ( ON ?auto_562030 ?auto_562031 ) ( ON ?auto_562029 ?auto_562030 ) ( CLEAR ?auto_562027 ) ( ON ?auto_562028 ?auto_562029 ) ( CLEAR ?auto_562028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_562020 ?auto_562021 ?auto_562022 ?auto_562023 ?auto_562024 ?auto_562025 ?auto_562026 ?auto_562027 ?auto_562028 )
      ( MAKE-13PILE ?auto_562020 ?auto_562021 ?auto_562022 ?auto_562023 ?auto_562024 ?auto_562025 ?auto_562026 ?auto_562027 ?auto_562028 ?auto_562029 ?auto_562030 ?auto_562031 ?auto_562032 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562074 - BLOCK
      ?auto_562075 - BLOCK
      ?auto_562076 - BLOCK
      ?auto_562077 - BLOCK
      ?auto_562078 - BLOCK
      ?auto_562079 - BLOCK
      ?auto_562080 - BLOCK
      ?auto_562081 - BLOCK
      ?auto_562082 - BLOCK
      ?auto_562083 - BLOCK
      ?auto_562084 - BLOCK
      ?auto_562085 - BLOCK
      ?auto_562086 - BLOCK
    )
    :vars
    (
      ?auto_562087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562086 ?auto_562087 ) ( ON-TABLE ?auto_562074 ) ( ON ?auto_562075 ?auto_562074 ) ( ON ?auto_562076 ?auto_562075 ) ( ON ?auto_562077 ?auto_562076 ) ( ON ?auto_562078 ?auto_562077 ) ( ON ?auto_562079 ?auto_562078 ) ( ON ?auto_562080 ?auto_562079 ) ( not ( = ?auto_562074 ?auto_562075 ) ) ( not ( = ?auto_562074 ?auto_562076 ) ) ( not ( = ?auto_562074 ?auto_562077 ) ) ( not ( = ?auto_562074 ?auto_562078 ) ) ( not ( = ?auto_562074 ?auto_562079 ) ) ( not ( = ?auto_562074 ?auto_562080 ) ) ( not ( = ?auto_562074 ?auto_562081 ) ) ( not ( = ?auto_562074 ?auto_562082 ) ) ( not ( = ?auto_562074 ?auto_562083 ) ) ( not ( = ?auto_562074 ?auto_562084 ) ) ( not ( = ?auto_562074 ?auto_562085 ) ) ( not ( = ?auto_562074 ?auto_562086 ) ) ( not ( = ?auto_562074 ?auto_562087 ) ) ( not ( = ?auto_562075 ?auto_562076 ) ) ( not ( = ?auto_562075 ?auto_562077 ) ) ( not ( = ?auto_562075 ?auto_562078 ) ) ( not ( = ?auto_562075 ?auto_562079 ) ) ( not ( = ?auto_562075 ?auto_562080 ) ) ( not ( = ?auto_562075 ?auto_562081 ) ) ( not ( = ?auto_562075 ?auto_562082 ) ) ( not ( = ?auto_562075 ?auto_562083 ) ) ( not ( = ?auto_562075 ?auto_562084 ) ) ( not ( = ?auto_562075 ?auto_562085 ) ) ( not ( = ?auto_562075 ?auto_562086 ) ) ( not ( = ?auto_562075 ?auto_562087 ) ) ( not ( = ?auto_562076 ?auto_562077 ) ) ( not ( = ?auto_562076 ?auto_562078 ) ) ( not ( = ?auto_562076 ?auto_562079 ) ) ( not ( = ?auto_562076 ?auto_562080 ) ) ( not ( = ?auto_562076 ?auto_562081 ) ) ( not ( = ?auto_562076 ?auto_562082 ) ) ( not ( = ?auto_562076 ?auto_562083 ) ) ( not ( = ?auto_562076 ?auto_562084 ) ) ( not ( = ?auto_562076 ?auto_562085 ) ) ( not ( = ?auto_562076 ?auto_562086 ) ) ( not ( = ?auto_562076 ?auto_562087 ) ) ( not ( = ?auto_562077 ?auto_562078 ) ) ( not ( = ?auto_562077 ?auto_562079 ) ) ( not ( = ?auto_562077 ?auto_562080 ) ) ( not ( = ?auto_562077 ?auto_562081 ) ) ( not ( = ?auto_562077 ?auto_562082 ) ) ( not ( = ?auto_562077 ?auto_562083 ) ) ( not ( = ?auto_562077 ?auto_562084 ) ) ( not ( = ?auto_562077 ?auto_562085 ) ) ( not ( = ?auto_562077 ?auto_562086 ) ) ( not ( = ?auto_562077 ?auto_562087 ) ) ( not ( = ?auto_562078 ?auto_562079 ) ) ( not ( = ?auto_562078 ?auto_562080 ) ) ( not ( = ?auto_562078 ?auto_562081 ) ) ( not ( = ?auto_562078 ?auto_562082 ) ) ( not ( = ?auto_562078 ?auto_562083 ) ) ( not ( = ?auto_562078 ?auto_562084 ) ) ( not ( = ?auto_562078 ?auto_562085 ) ) ( not ( = ?auto_562078 ?auto_562086 ) ) ( not ( = ?auto_562078 ?auto_562087 ) ) ( not ( = ?auto_562079 ?auto_562080 ) ) ( not ( = ?auto_562079 ?auto_562081 ) ) ( not ( = ?auto_562079 ?auto_562082 ) ) ( not ( = ?auto_562079 ?auto_562083 ) ) ( not ( = ?auto_562079 ?auto_562084 ) ) ( not ( = ?auto_562079 ?auto_562085 ) ) ( not ( = ?auto_562079 ?auto_562086 ) ) ( not ( = ?auto_562079 ?auto_562087 ) ) ( not ( = ?auto_562080 ?auto_562081 ) ) ( not ( = ?auto_562080 ?auto_562082 ) ) ( not ( = ?auto_562080 ?auto_562083 ) ) ( not ( = ?auto_562080 ?auto_562084 ) ) ( not ( = ?auto_562080 ?auto_562085 ) ) ( not ( = ?auto_562080 ?auto_562086 ) ) ( not ( = ?auto_562080 ?auto_562087 ) ) ( not ( = ?auto_562081 ?auto_562082 ) ) ( not ( = ?auto_562081 ?auto_562083 ) ) ( not ( = ?auto_562081 ?auto_562084 ) ) ( not ( = ?auto_562081 ?auto_562085 ) ) ( not ( = ?auto_562081 ?auto_562086 ) ) ( not ( = ?auto_562081 ?auto_562087 ) ) ( not ( = ?auto_562082 ?auto_562083 ) ) ( not ( = ?auto_562082 ?auto_562084 ) ) ( not ( = ?auto_562082 ?auto_562085 ) ) ( not ( = ?auto_562082 ?auto_562086 ) ) ( not ( = ?auto_562082 ?auto_562087 ) ) ( not ( = ?auto_562083 ?auto_562084 ) ) ( not ( = ?auto_562083 ?auto_562085 ) ) ( not ( = ?auto_562083 ?auto_562086 ) ) ( not ( = ?auto_562083 ?auto_562087 ) ) ( not ( = ?auto_562084 ?auto_562085 ) ) ( not ( = ?auto_562084 ?auto_562086 ) ) ( not ( = ?auto_562084 ?auto_562087 ) ) ( not ( = ?auto_562085 ?auto_562086 ) ) ( not ( = ?auto_562085 ?auto_562087 ) ) ( not ( = ?auto_562086 ?auto_562087 ) ) ( ON ?auto_562085 ?auto_562086 ) ( ON ?auto_562084 ?auto_562085 ) ( ON ?auto_562083 ?auto_562084 ) ( ON ?auto_562082 ?auto_562083 ) ( CLEAR ?auto_562080 ) ( ON ?auto_562081 ?auto_562082 ) ( CLEAR ?auto_562081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_562074 ?auto_562075 ?auto_562076 ?auto_562077 ?auto_562078 ?auto_562079 ?auto_562080 ?auto_562081 )
      ( MAKE-13PILE ?auto_562074 ?auto_562075 ?auto_562076 ?auto_562077 ?auto_562078 ?auto_562079 ?auto_562080 ?auto_562081 ?auto_562082 ?auto_562083 ?auto_562084 ?auto_562085 ?auto_562086 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562128 - BLOCK
      ?auto_562129 - BLOCK
      ?auto_562130 - BLOCK
      ?auto_562131 - BLOCK
      ?auto_562132 - BLOCK
      ?auto_562133 - BLOCK
      ?auto_562134 - BLOCK
      ?auto_562135 - BLOCK
      ?auto_562136 - BLOCK
      ?auto_562137 - BLOCK
      ?auto_562138 - BLOCK
      ?auto_562139 - BLOCK
      ?auto_562140 - BLOCK
    )
    :vars
    (
      ?auto_562141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562140 ?auto_562141 ) ( ON-TABLE ?auto_562128 ) ( ON ?auto_562129 ?auto_562128 ) ( ON ?auto_562130 ?auto_562129 ) ( ON ?auto_562131 ?auto_562130 ) ( ON ?auto_562132 ?auto_562131 ) ( ON ?auto_562133 ?auto_562132 ) ( not ( = ?auto_562128 ?auto_562129 ) ) ( not ( = ?auto_562128 ?auto_562130 ) ) ( not ( = ?auto_562128 ?auto_562131 ) ) ( not ( = ?auto_562128 ?auto_562132 ) ) ( not ( = ?auto_562128 ?auto_562133 ) ) ( not ( = ?auto_562128 ?auto_562134 ) ) ( not ( = ?auto_562128 ?auto_562135 ) ) ( not ( = ?auto_562128 ?auto_562136 ) ) ( not ( = ?auto_562128 ?auto_562137 ) ) ( not ( = ?auto_562128 ?auto_562138 ) ) ( not ( = ?auto_562128 ?auto_562139 ) ) ( not ( = ?auto_562128 ?auto_562140 ) ) ( not ( = ?auto_562128 ?auto_562141 ) ) ( not ( = ?auto_562129 ?auto_562130 ) ) ( not ( = ?auto_562129 ?auto_562131 ) ) ( not ( = ?auto_562129 ?auto_562132 ) ) ( not ( = ?auto_562129 ?auto_562133 ) ) ( not ( = ?auto_562129 ?auto_562134 ) ) ( not ( = ?auto_562129 ?auto_562135 ) ) ( not ( = ?auto_562129 ?auto_562136 ) ) ( not ( = ?auto_562129 ?auto_562137 ) ) ( not ( = ?auto_562129 ?auto_562138 ) ) ( not ( = ?auto_562129 ?auto_562139 ) ) ( not ( = ?auto_562129 ?auto_562140 ) ) ( not ( = ?auto_562129 ?auto_562141 ) ) ( not ( = ?auto_562130 ?auto_562131 ) ) ( not ( = ?auto_562130 ?auto_562132 ) ) ( not ( = ?auto_562130 ?auto_562133 ) ) ( not ( = ?auto_562130 ?auto_562134 ) ) ( not ( = ?auto_562130 ?auto_562135 ) ) ( not ( = ?auto_562130 ?auto_562136 ) ) ( not ( = ?auto_562130 ?auto_562137 ) ) ( not ( = ?auto_562130 ?auto_562138 ) ) ( not ( = ?auto_562130 ?auto_562139 ) ) ( not ( = ?auto_562130 ?auto_562140 ) ) ( not ( = ?auto_562130 ?auto_562141 ) ) ( not ( = ?auto_562131 ?auto_562132 ) ) ( not ( = ?auto_562131 ?auto_562133 ) ) ( not ( = ?auto_562131 ?auto_562134 ) ) ( not ( = ?auto_562131 ?auto_562135 ) ) ( not ( = ?auto_562131 ?auto_562136 ) ) ( not ( = ?auto_562131 ?auto_562137 ) ) ( not ( = ?auto_562131 ?auto_562138 ) ) ( not ( = ?auto_562131 ?auto_562139 ) ) ( not ( = ?auto_562131 ?auto_562140 ) ) ( not ( = ?auto_562131 ?auto_562141 ) ) ( not ( = ?auto_562132 ?auto_562133 ) ) ( not ( = ?auto_562132 ?auto_562134 ) ) ( not ( = ?auto_562132 ?auto_562135 ) ) ( not ( = ?auto_562132 ?auto_562136 ) ) ( not ( = ?auto_562132 ?auto_562137 ) ) ( not ( = ?auto_562132 ?auto_562138 ) ) ( not ( = ?auto_562132 ?auto_562139 ) ) ( not ( = ?auto_562132 ?auto_562140 ) ) ( not ( = ?auto_562132 ?auto_562141 ) ) ( not ( = ?auto_562133 ?auto_562134 ) ) ( not ( = ?auto_562133 ?auto_562135 ) ) ( not ( = ?auto_562133 ?auto_562136 ) ) ( not ( = ?auto_562133 ?auto_562137 ) ) ( not ( = ?auto_562133 ?auto_562138 ) ) ( not ( = ?auto_562133 ?auto_562139 ) ) ( not ( = ?auto_562133 ?auto_562140 ) ) ( not ( = ?auto_562133 ?auto_562141 ) ) ( not ( = ?auto_562134 ?auto_562135 ) ) ( not ( = ?auto_562134 ?auto_562136 ) ) ( not ( = ?auto_562134 ?auto_562137 ) ) ( not ( = ?auto_562134 ?auto_562138 ) ) ( not ( = ?auto_562134 ?auto_562139 ) ) ( not ( = ?auto_562134 ?auto_562140 ) ) ( not ( = ?auto_562134 ?auto_562141 ) ) ( not ( = ?auto_562135 ?auto_562136 ) ) ( not ( = ?auto_562135 ?auto_562137 ) ) ( not ( = ?auto_562135 ?auto_562138 ) ) ( not ( = ?auto_562135 ?auto_562139 ) ) ( not ( = ?auto_562135 ?auto_562140 ) ) ( not ( = ?auto_562135 ?auto_562141 ) ) ( not ( = ?auto_562136 ?auto_562137 ) ) ( not ( = ?auto_562136 ?auto_562138 ) ) ( not ( = ?auto_562136 ?auto_562139 ) ) ( not ( = ?auto_562136 ?auto_562140 ) ) ( not ( = ?auto_562136 ?auto_562141 ) ) ( not ( = ?auto_562137 ?auto_562138 ) ) ( not ( = ?auto_562137 ?auto_562139 ) ) ( not ( = ?auto_562137 ?auto_562140 ) ) ( not ( = ?auto_562137 ?auto_562141 ) ) ( not ( = ?auto_562138 ?auto_562139 ) ) ( not ( = ?auto_562138 ?auto_562140 ) ) ( not ( = ?auto_562138 ?auto_562141 ) ) ( not ( = ?auto_562139 ?auto_562140 ) ) ( not ( = ?auto_562139 ?auto_562141 ) ) ( not ( = ?auto_562140 ?auto_562141 ) ) ( ON ?auto_562139 ?auto_562140 ) ( ON ?auto_562138 ?auto_562139 ) ( ON ?auto_562137 ?auto_562138 ) ( ON ?auto_562136 ?auto_562137 ) ( ON ?auto_562135 ?auto_562136 ) ( CLEAR ?auto_562133 ) ( ON ?auto_562134 ?auto_562135 ) ( CLEAR ?auto_562134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_562128 ?auto_562129 ?auto_562130 ?auto_562131 ?auto_562132 ?auto_562133 ?auto_562134 )
      ( MAKE-13PILE ?auto_562128 ?auto_562129 ?auto_562130 ?auto_562131 ?auto_562132 ?auto_562133 ?auto_562134 ?auto_562135 ?auto_562136 ?auto_562137 ?auto_562138 ?auto_562139 ?auto_562140 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562182 - BLOCK
      ?auto_562183 - BLOCK
      ?auto_562184 - BLOCK
      ?auto_562185 - BLOCK
      ?auto_562186 - BLOCK
      ?auto_562187 - BLOCK
      ?auto_562188 - BLOCK
      ?auto_562189 - BLOCK
      ?auto_562190 - BLOCK
      ?auto_562191 - BLOCK
      ?auto_562192 - BLOCK
      ?auto_562193 - BLOCK
      ?auto_562194 - BLOCK
    )
    :vars
    (
      ?auto_562195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562194 ?auto_562195 ) ( ON-TABLE ?auto_562182 ) ( ON ?auto_562183 ?auto_562182 ) ( ON ?auto_562184 ?auto_562183 ) ( ON ?auto_562185 ?auto_562184 ) ( ON ?auto_562186 ?auto_562185 ) ( not ( = ?auto_562182 ?auto_562183 ) ) ( not ( = ?auto_562182 ?auto_562184 ) ) ( not ( = ?auto_562182 ?auto_562185 ) ) ( not ( = ?auto_562182 ?auto_562186 ) ) ( not ( = ?auto_562182 ?auto_562187 ) ) ( not ( = ?auto_562182 ?auto_562188 ) ) ( not ( = ?auto_562182 ?auto_562189 ) ) ( not ( = ?auto_562182 ?auto_562190 ) ) ( not ( = ?auto_562182 ?auto_562191 ) ) ( not ( = ?auto_562182 ?auto_562192 ) ) ( not ( = ?auto_562182 ?auto_562193 ) ) ( not ( = ?auto_562182 ?auto_562194 ) ) ( not ( = ?auto_562182 ?auto_562195 ) ) ( not ( = ?auto_562183 ?auto_562184 ) ) ( not ( = ?auto_562183 ?auto_562185 ) ) ( not ( = ?auto_562183 ?auto_562186 ) ) ( not ( = ?auto_562183 ?auto_562187 ) ) ( not ( = ?auto_562183 ?auto_562188 ) ) ( not ( = ?auto_562183 ?auto_562189 ) ) ( not ( = ?auto_562183 ?auto_562190 ) ) ( not ( = ?auto_562183 ?auto_562191 ) ) ( not ( = ?auto_562183 ?auto_562192 ) ) ( not ( = ?auto_562183 ?auto_562193 ) ) ( not ( = ?auto_562183 ?auto_562194 ) ) ( not ( = ?auto_562183 ?auto_562195 ) ) ( not ( = ?auto_562184 ?auto_562185 ) ) ( not ( = ?auto_562184 ?auto_562186 ) ) ( not ( = ?auto_562184 ?auto_562187 ) ) ( not ( = ?auto_562184 ?auto_562188 ) ) ( not ( = ?auto_562184 ?auto_562189 ) ) ( not ( = ?auto_562184 ?auto_562190 ) ) ( not ( = ?auto_562184 ?auto_562191 ) ) ( not ( = ?auto_562184 ?auto_562192 ) ) ( not ( = ?auto_562184 ?auto_562193 ) ) ( not ( = ?auto_562184 ?auto_562194 ) ) ( not ( = ?auto_562184 ?auto_562195 ) ) ( not ( = ?auto_562185 ?auto_562186 ) ) ( not ( = ?auto_562185 ?auto_562187 ) ) ( not ( = ?auto_562185 ?auto_562188 ) ) ( not ( = ?auto_562185 ?auto_562189 ) ) ( not ( = ?auto_562185 ?auto_562190 ) ) ( not ( = ?auto_562185 ?auto_562191 ) ) ( not ( = ?auto_562185 ?auto_562192 ) ) ( not ( = ?auto_562185 ?auto_562193 ) ) ( not ( = ?auto_562185 ?auto_562194 ) ) ( not ( = ?auto_562185 ?auto_562195 ) ) ( not ( = ?auto_562186 ?auto_562187 ) ) ( not ( = ?auto_562186 ?auto_562188 ) ) ( not ( = ?auto_562186 ?auto_562189 ) ) ( not ( = ?auto_562186 ?auto_562190 ) ) ( not ( = ?auto_562186 ?auto_562191 ) ) ( not ( = ?auto_562186 ?auto_562192 ) ) ( not ( = ?auto_562186 ?auto_562193 ) ) ( not ( = ?auto_562186 ?auto_562194 ) ) ( not ( = ?auto_562186 ?auto_562195 ) ) ( not ( = ?auto_562187 ?auto_562188 ) ) ( not ( = ?auto_562187 ?auto_562189 ) ) ( not ( = ?auto_562187 ?auto_562190 ) ) ( not ( = ?auto_562187 ?auto_562191 ) ) ( not ( = ?auto_562187 ?auto_562192 ) ) ( not ( = ?auto_562187 ?auto_562193 ) ) ( not ( = ?auto_562187 ?auto_562194 ) ) ( not ( = ?auto_562187 ?auto_562195 ) ) ( not ( = ?auto_562188 ?auto_562189 ) ) ( not ( = ?auto_562188 ?auto_562190 ) ) ( not ( = ?auto_562188 ?auto_562191 ) ) ( not ( = ?auto_562188 ?auto_562192 ) ) ( not ( = ?auto_562188 ?auto_562193 ) ) ( not ( = ?auto_562188 ?auto_562194 ) ) ( not ( = ?auto_562188 ?auto_562195 ) ) ( not ( = ?auto_562189 ?auto_562190 ) ) ( not ( = ?auto_562189 ?auto_562191 ) ) ( not ( = ?auto_562189 ?auto_562192 ) ) ( not ( = ?auto_562189 ?auto_562193 ) ) ( not ( = ?auto_562189 ?auto_562194 ) ) ( not ( = ?auto_562189 ?auto_562195 ) ) ( not ( = ?auto_562190 ?auto_562191 ) ) ( not ( = ?auto_562190 ?auto_562192 ) ) ( not ( = ?auto_562190 ?auto_562193 ) ) ( not ( = ?auto_562190 ?auto_562194 ) ) ( not ( = ?auto_562190 ?auto_562195 ) ) ( not ( = ?auto_562191 ?auto_562192 ) ) ( not ( = ?auto_562191 ?auto_562193 ) ) ( not ( = ?auto_562191 ?auto_562194 ) ) ( not ( = ?auto_562191 ?auto_562195 ) ) ( not ( = ?auto_562192 ?auto_562193 ) ) ( not ( = ?auto_562192 ?auto_562194 ) ) ( not ( = ?auto_562192 ?auto_562195 ) ) ( not ( = ?auto_562193 ?auto_562194 ) ) ( not ( = ?auto_562193 ?auto_562195 ) ) ( not ( = ?auto_562194 ?auto_562195 ) ) ( ON ?auto_562193 ?auto_562194 ) ( ON ?auto_562192 ?auto_562193 ) ( ON ?auto_562191 ?auto_562192 ) ( ON ?auto_562190 ?auto_562191 ) ( ON ?auto_562189 ?auto_562190 ) ( ON ?auto_562188 ?auto_562189 ) ( CLEAR ?auto_562186 ) ( ON ?auto_562187 ?auto_562188 ) ( CLEAR ?auto_562187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_562182 ?auto_562183 ?auto_562184 ?auto_562185 ?auto_562186 ?auto_562187 )
      ( MAKE-13PILE ?auto_562182 ?auto_562183 ?auto_562184 ?auto_562185 ?auto_562186 ?auto_562187 ?auto_562188 ?auto_562189 ?auto_562190 ?auto_562191 ?auto_562192 ?auto_562193 ?auto_562194 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562236 - BLOCK
      ?auto_562237 - BLOCK
      ?auto_562238 - BLOCK
      ?auto_562239 - BLOCK
      ?auto_562240 - BLOCK
      ?auto_562241 - BLOCK
      ?auto_562242 - BLOCK
      ?auto_562243 - BLOCK
      ?auto_562244 - BLOCK
      ?auto_562245 - BLOCK
      ?auto_562246 - BLOCK
      ?auto_562247 - BLOCK
      ?auto_562248 - BLOCK
    )
    :vars
    (
      ?auto_562249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562248 ?auto_562249 ) ( ON-TABLE ?auto_562236 ) ( ON ?auto_562237 ?auto_562236 ) ( ON ?auto_562238 ?auto_562237 ) ( ON ?auto_562239 ?auto_562238 ) ( not ( = ?auto_562236 ?auto_562237 ) ) ( not ( = ?auto_562236 ?auto_562238 ) ) ( not ( = ?auto_562236 ?auto_562239 ) ) ( not ( = ?auto_562236 ?auto_562240 ) ) ( not ( = ?auto_562236 ?auto_562241 ) ) ( not ( = ?auto_562236 ?auto_562242 ) ) ( not ( = ?auto_562236 ?auto_562243 ) ) ( not ( = ?auto_562236 ?auto_562244 ) ) ( not ( = ?auto_562236 ?auto_562245 ) ) ( not ( = ?auto_562236 ?auto_562246 ) ) ( not ( = ?auto_562236 ?auto_562247 ) ) ( not ( = ?auto_562236 ?auto_562248 ) ) ( not ( = ?auto_562236 ?auto_562249 ) ) ( not ( = ?auto_562237 ?auto_562238 ) ) ( not ( = ?auto_562237 ?auto_562239 ) ) ( not ( = ?auto_562237 ?auto_562240 ) ) ( not ( = ?auto_562237 ?auto_562241 ) ) ( not ( = ?auto_562237 ?auto_562242 ) ) ( not ( = ?auto_562237 ?auto_562243 ) ) ( not ( = ?auto_562237 ?auto_562244 ) ) ( not ( = ?auto_562237 ?auto_562245 ) ) ( not ( = ?auto_562237 ?auto_562246 ) ) ( not ( = ?auto_562237 ?auto_562247 ) ) ( not ( = ?auto_562237 ?auto_562248 ) ) ( not ( = ?auto_562237 ?auto_562249 ) ) ( not ( = ?auto_562238 ?auto_562239 ) ) ( not ( = ?auto_562238 ?auto_562240 ) ) ( not ( = ?auto_562238 ?auto_562241 ) ) ( not ( = ?auto_562238 ?auto_562242 ) ) ( not ( = ?auto_562238 ?auto_562243 ) ) ( not ( = ?auto_562238 ?auto_562244 ) ) ( not ( = ?auto_562238 ?auto_562245 ) ) ( not ( = ?auto_562238 ?auto_562246 ) ) ( not ( = ?auto_562238 ?auto_562247 ) ) ( not ( = ?auto_562238 ?auto_562248 ) ) ( not ( = ?auto_562238 ?auto_562249 ) ) ( not ( = ?auto_562239 ?auto_562240 ) ) ( not ( = ?auto_562239 ?auto_562241 ) ) ( not ( = ?auto_562239 ?auto_562242 ) ) ( not ( = ?auto_562239 ?auto_562243 ) ) ( not ( = ?auto_562239 ?auto_562244 ) ) ( not ( = ?auto_562239 ?auto_562245 ) ) ( not ( = ?auto_562239 ?auto_562246 ) ) ( not ( = ?auto_562239 ?auto_562247 ) ) ( not ( = ?auto_562239 ?auto_562248 ) ) ( not ( = ?auto_562239 ?auto_562249 ) ) ( not ( = ?auto_562240 ?auto_562241 ) ) ( not ( = ?auto_562240 ?auto_562242 ) ) ( not ( = ?auto_562240 ?auto_562243 ) ) ( not ( = ?auto_562240 ?auto_562244 ) ) ( not ( = ?auto_562240 ?auto_562245 ) ) ( not ( = ?auto_562240 ?auto_562246 ) ) ( not ( = ?auto_562240 ?auto_562247 ) ) ( not ( = ?auto_562240 ?auto_562248 ) ) ( not ( = ?auto_562240 ?auto_562249 ) ) ( not ( = ?auto_562241 ?auto_562242 ) ) ( not ( = ?auto_562241 ?auto_562243 ) ) ( not ( = ?auto_562241 ?auto_562244 ) ) ( not ( = ?auto_562241 ?auto_562245 ) ) ( not ( = ?auto_562241 ?auto_562246 ) ) ( not ( = ?auto_562241 ?auto_562247 ) ) ( not ( = ?auto_562241 ?auto_562248 ) ) ( not ( = ?auto_562241 ?auto_562249 ) ) ( not ( = ?auto_562242 ?auto_562243 ) ) ( not ( = ?auto_562242 ?auto_562244 ) ) ( not ( = ?auto_562242 ?auto_562245 ) ) ( not ( = ?auto_562242 ?auto_562246 ) ) ( not ( = ?auto_562242 ?auto_562247 ) ) ( not ( = ?auto_562242 ?auto_562248 ) ) ( not ( = ?auto_562242 ?auto_562249 ) ) ( not ( = ?auto_562243 ?auto_562244 ) ) ( not ( = ?auto_562243 ?auto_562245 ) ) ( not ( = ?auto_562243 ?auto_562246 ) ) ( not ( = ?auto_562243 ?auto_562247 ) ) ( not ( = ?auto_562243 ?auto_562248 ) ) ( not ( = ?auto_562243 ?auto_562249 ) ) ( not ( = ?auto_562244 ?auto_562245 ) ) ( not ( = ?auto_562244 ?auto_562246 ) ) ( not ( = ?auto_562244 ?auto_562247 ) ) ( not ( = ?auto_562244 ?auto_562248 ) ) ( not ( = ?auto_562244 ?auto_562249 ) ) ( not ( = ?auto_562245 ?auto_562246 ) ) ( not ( = ?auto_562245 ?auto_562247 ) ) ( not ( = ?auto_562245 ?auto_562248 ) ) ( not ( = ?auto_562245 ?auto_562249 ) ) ( not ( = ?auto_562246 ?auto_562247 ) ) ( not ( = ?auto_562246 ?auto_562248 ) ) ( not ( = ?auto_562246 ?auto_562249 ) ) ( not ( = ?auto_562247 ?auto_562248 ) ) ( not ( = ?auto_562247 ?auto_562249 ) ) ( not ( = ?auto_562248 ?auto_562249 ) ) ( ON ?auto_562247 ?auto_562248 ) ( ON ?auto_562246 ?auto_562247 ) ( ON ?auto_562245 ?auto_562246 ) ( ON ?auto_562244 ?auto_562245 ) ( ON ?auto_562243 ?auto_562244 ) ( ON ?auto_562242 ?auto_562243 ) ( ON ?auto_562241 ?auto_562242 ) ( CLEAR ?auto_562239 ) ( ON ?auto_562240 ?auto_562241 ) ( CLEAR ?auto_562240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_562236 ?auto_562237 ?auto_562238 ?auto_562239 ?auto_562240 )
      ( MAKE-13PILE ?auto_562236 ?auto_562237 ?auto_562238 ?auto_562239 ?auto_562240 ?auto_562241 ?auto_562242 ?auto_562243 ?auto_562244 ?auto_562245 ?auto_562246 ?auto_562247 ?auto_562248 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562290 - BLOCK
      ?auto_562291 - BLOCK
      ?auto_562292 - BLOCK
      ?auto_562293 - BLOCK
      ?auto_562294 - BLOCK
      ?auto_562295 - BLOCK
      ?auto_562296 - BLOCK
      ?auto_562297 - BLOCK
      ?auto_562298 - BLOCK
      ?auto_562299 - BLOCK
      ?auto_562300 - BLOCK
      ?auto_562301 - BLOCK
      ?auto_562302 - BLOCK
    )
    :vars
    (
      ?auto_562303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562302 ?auto_562303 ) ( ON-TABLE ?auto_562290 ) ( ON ?auto_562291 ?auto_562290 ) ( ON ?auto_562292 ?auto_562291 ) ( not ( = ?auto_562290 ?auto_562291 ) ) ( not ( = ?auto_562290 ?auto_562292 ) ) ( not ( = ?auto_562290 ?auto_562293 ) ) ( not ( = ?auto_562290 ?auto_562294 ) ) ( not ( = ?auto_562290 ?auto_562295 ) ) ( not ( = ?auto_562290 ?auto_562296 ) ) ( not ( = ?auto_562290 ?auto_562297 ) ) ( not ( = ?auto_562290 ?auto_562298 ) ) ( not ( = ?auto_562290 ?auto_562299 ) ) ( not ( = ?auto_562290 ?auto_562300 ) ) ( not ( = ?auto_562290 ?auto_562301 ) ) ( not ( = ?auto_562290 ?auto_562302 ) ) ( not ( = ?auto_562290 ?auto_562303 ) ) ( not ( = ?auto_562291 ?auto_562292 ) ) ( not ( = ?auto_562291 ?auto_562293 ) ) ( not ( = ?auto_562291 ?auto_562294 ) ) ( not ( = ?auto_562291 ?auto_562295 ) ) ( not ( = ?auto_562291 ?auto_562296 ) ) ( not ( = ?auto_562291 ?auto_562297 ) ) ( not ( = ?auto_562291 ?auto_562298 ) ) ( not ( = ?auto_562291 ?auto_562299 ) ) ( not ( = ?auto_562291 ?auto_562300 ) ) ( not ( = ?auto_562291 ?auto_562301 ) ) ( not ( = ?auto_562291 ?auto_562302 ) ) ( not ( = ?auto_562291 ?auto_562303 ) ) ( not ( = ?auto_562292 ?auto_562293 ) ) ( not ( = ?auto_562292 ?auto_562294 ) ) ( not ( = ?auto_562292 ?auto_562295 ) ) ( not ( = ?auto_562292 ?auto_562296 ) ) ( not ( = ?auto_562292 ?auto_562297 ) ) ( not ( = ?auto_562292 ?auto_562298 ) ) ( not ( = ?auto_562292 ?auto_562299 ) ) ( not ( = ?auto_562292 ?auto_562300 ) ) ( not ( = ?auto_562292 ?auto_562301 ) ) ( not ( = ?auto_562292 ?auto_562302 ) ) ( not ( = ?auto_562292 ?auto_562303 ) ) ( not ( = ?auto_562293 ?auto_562294 ) ) ( not ( = ?auto_562293 ?auto_562295 ) ) ( not ( = ?auto_562293 ?auto_562296 ) ) ( not ( = ?auto_562293 ?auto_562297 ) ) ( not ( = ?auto_562293 ?auto_562298 ) ) ( not ( = ?auto_562293 ?auto_562299 ) ) ( not ( = ?auto_562293 ?auto_562300 ) ) ( not ( = ?auto_562293 ?auto_562301 ) ) ( not ( = ?auto_562293 ?auto_562302 ) ) ( not ( = ?auto_562293 ?auto_562303 ) ) ( not ( = ?auto_562294 ?auto_562295 ) ) ( not ( = ?auto_562294 ?auto_562296 ) ) ( not ( = ?auto_562294 ?auto_562297 ) ) ( not ( = ?auto_562294 ?auto_562298 ) ) ( not ( = ?auto_562294 ?auto_562299 ) ) ( not ( = ?auto_562294 ?auto_562300 ) ) ( not ( = ?auto_562294 ?auto_562301 ) ) ( not ( = ?auto_562294 ?auto_562302 ) ) ( not ( = ?auto_562294 ?auto_562303 ) ) ( not ( = ?auto_562295 ?auto_562296 ) ) ( not ( = ?auto_562295 ?auto_562297 ) ) ( not ( = ?auto_562295 ?auto_562298 ) ) ( not ( = ?auto_562295 ?auto_562299 ) ) ( not ( = ?auto_562295 ?auto_562300 ) ) ( not ( = ?auto_562295 ?auto_562301 ) ) ( not ( = ?auto_562295 ?auto_562302 ) ) ( not ( = ?auto_562295 ?auto_562303 ) ) ( not ( = ?auto_562296 ?auto_562297 ) ) ( not ( = ?auto_562296 ?auto_562298 ) ) ( not ( = ?auto_562296 ?auto_562299 ) ) ( not ( = ?auto_562296 ?auto_562300 ) ) ( not ( = ?auto_562296 ?auto_562301 ) ) ( not ( = ?auto_562296 ?auto_562302 ) ) ( not ( = ?auto_562296 ?auto_562303 ) ) ( not ( = ?auto_562297 ?auto_562298 ) ) ( not ( = ?auto_562297 ?auto_562299 ) ) ( not ( = ?auto_562297 ?auto_562300 ) ) ( not ( = ?auto_562297 ?auto_562301 ) ) ( not ( = ?auto_562297 ?auto_562302 ) ) ( not ( = ?auto_562297 ?auto_562303 ) ) ( not ( = ?auto_562298 ?auto_562299 ) ) ( not ( = ?auto_562298 ?auto_562300 ) ) ( not ( = ?auto_562298 ?auto_562301 ) ) ( not ( = ?auto_562298 ?auto_562302 ) ) ( not ( = ?auto_562298 ?auto_562303 ) ) ( not ( = ?auto_562299 ?auto_562300 ) ) ( not ( = ?auto_562299 ?auto_562301 ) ) ( not ( = ?auto_562299 ?auto_562302 ) ) ( not ( = ?auto_562299 ?auto_562303 ) ) ( not ( = ?auto_562300 ?auto_562301 ) ) ( not ( = ?auto_562300 ?auto_562302 ) ) ( not ( = ?auto_562300 ?auto_562303 ) ) ( not ( = ?auto_562301 ?auto_562302 ) ) ( not ( = ?auto_562301 ?auto_562303 ) ) ( not ( = ?auto_562302 ?auto_562303 ) ) ( ON ?auto_562301 ?auto_562302 ) ( ON ?auto_562300 ?auto_562301 ) ( ON ?auto_562299 ?auto_562300 ) ( ON ?auto_562298 ?auto_562299 ) ( ON ?auto_562297 ?auto_562298 ) ( ON ?auto_562296 ?auto_562297 ) ( ON ?auto_562295 ?auto_562296 ) ( ON ?auto_562294 ?auto_562295 ) ( CLEAR ?auto_562292 ) ( ON ?auto_562293 ?auto_562294 ) ( CLEAR ?auto_562293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_562290 ?auto_562291 ?auto_562292 ?auto_562293 )
      ( MAKE-13PILE ?auto_562290 ?auto_562291 ?auto_562292 ?auto_562293 ?auto_562294 ?auto_562295 ?auto_562296 ?auto_562297 ?auto_562298 ?auto_562299 ?auto_562300 ?auto_562301 ?auto_562302 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562344 - BLOCK
      ?auto_562345 - BLOCK
      ?auto_562346 - BLOCK
      ?auto_562347 - BLOCK
      ?auto_562348 - BLOCK
      ?auto_562349 - BLOCK
      ?auto_562350 - BLOCK
      ?auto_562351 - BLOCK
      ?auto_562352 - BLOCK
      ?auto_562353 - BLOCK
      ?auto_562354 - BLOCK
      ?auto_562355 - BLOCK
      ?auto_562356 - BLOCK
    )
    :vars
    (
      ?auto_562357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562356 ?auto_562357 ) ( ON-TABLE ?auto_562344 ) ( ON ?auto_562345 ?auto_562344 ) ( not ( = ?auto_562344 ?auto_562345 ) ) ( not ( = ?auto_562344 ?auto_562346 ) ) ( not ( = ?auto_562344 ?auto_562347 ) ) ( not ( = ?auto_562344 ?auto_562348 ) ) ( not ( = ?auto_562344 ?auto_562349 ) ) ( not ( = ?auto_562344 ?auto_562350 ) ) ( not ( = ?auto_562344 ?auto_562351 ) ) ( not ( = ?auto_562344 ?auto_562352 ) ) ( not ( = ?auto_562344 ?auto_562353 ) ) ( not ( = ?auto_562344 ?auto_562354 ) ) ( not ( = ?auto_562344 ?auto_562355 ) ) ( not ( = ?auto_562344 ?auto_562356 ) ) ( not ( = ?auto_562344 ?auto_562357 ) ) ( not ( = ?auto_562345 ?auto_562346 ) ) ( not ( = ?auto_562345 ?auto_562347 ) ) ( not ( = ?auto_562345 ?auto_562348 ) ) ( not ( = ?auto_562345 ?auto_562349 ) ) ( not ( = ?auto_562345 ?auto_562350 ) ) ( not ( = ?auto_562345 ?auto_562351 ) ) ( not ( = ?auto_562345 ?auto_562352 ) ) ( not ( = ?auto_562345 ?auto_562353 ) ) ( not ( = ?auto_562345 ?auto_562354 ) ) ( not ( = ?auto_562345 ?auto_562355 ) ) ( not ( = ?auto_562345 ?auto_562356 ) ) ( not ( = ?auto_562345 ?auto_562357 ) ) ( not ( = ?auto_562346 ?auto_562347 ) ) ( not ( = ?auto_562346 ?auto_562348 ) ) ( not ( = ?auto_562346 ?auto_562349 ) ) ( not ( = ?auto_562346 ?auto_562350 ) ) ( not ( = ?auto_562346 ?auto_562351 ) ) ( not ( = ?auto_562346 ?auto_562352 ) ) ( not ( = ?auto_562346 ?auto_562353 ) ) ( not ( = ?auto_562346 ?auto_562354 ) ) ( not ( = ?auto_562346 ?auto_562355 ) ) ( not ( = ?auto_562346 ?auto_562356 ) ) ( not ( = ?auto_562346 ?auto_562357 ) ) ( not ( = ?auto_562347 ?auto_562348 ) ) ( not ( = ?auto_562347 ?auto_562349 ) ) ( not ( = ?auto_562347 ?auto_562350 ) ) ( not ( = ?auto_562347 ?auto_562351 ) ) ( not ( = ?auto_562347 ?auto_562352 ) ) ( not ( = ?auto_562347 ?auto_562353 ) ) ( not ( = ?auto_562347 ?auto_562354 ) ) ( not ( = ?auto_562347 ?auto_562355 ) ) ( not ( = ?auto_562347 ?auto_562356 ) ) ( not ( = ?auto_562347 ?auto_562357 ) ) ( not ( = ?auto_562348 ?auto_562349 ) ) ( not ( = ?auto_562348 ?auto_562350 ) ) ( not ( = ?auto_562348 ?auto_562351 ) ) ( not ( = ?auto_562348 ?auto_562352 ) ) ( not ( = ?auto_562348 ?auto_562353 ) ) ( not ( = ?auto_562348 ?auto_562354 ) ) ( not ( = ?auto_562348 ?auto_562355 ) ) ( not ( = ?auto_562348 ?auto_562356 ) ) ( not ( = ?auto_562348 ?auto_562357 ) ) ( not ( = ?auto_562349 ?auto_562350 ) ) ( not ( = ?auto_562349 ?auto_562351 ) ) ( not ( = ?auto_562349 ?auto_562352 ) ) ( not ( = ?auto_562349 ?auto_562353 ) ) ( not ( = ?auto_562349 ?auto_562354 ) ) ( not ( = ?auto_562349 ?auto_562355 ) ) ( not ( = ?auto_562349 ?auto_562356 ) ) ( not ( = ?auto_562349 ?auto_562357 ) ) ( not ( = ?auto_562350 ?auto_562351 ) ) ( not ( = ?auto_562350 ?auto_562352 ) ) ( not ( = ?auto_562350 ?auto_562353 ) ) ( not ( = ?auto_562350 ?auto_562354 ) ) ( not ( = ?auto_562350 ?auto_562355 ) ) ( not ( = ?auto_562350 ?auto_562356 ) ) ( not ( = ?auto_562350 ?auto_562357 ) ) ( not ( = ?auto_562351 ?auto_562352 ) ) ( not ( = ?auto_562351 ?auto_562353 ) ) ( not ( = ?auto_562351 ?auto_562354 ) ) ( not ( = ?auto_562351 ?auto_562355 ) ) ( not ( = ?auto_562351 ?auto_562356 ) ) ( not ( = ?auto_562351 ?auto_562357 ) ) ( not ( = ?auto_562352 ?auto_562353 ) ) ( not ( = ?auto_562352 ?auto_562354 ) ) ( not ( = ?auto_562352 ?auto_562355 ) ) ( not ( = ?auto_562352 ?auto_562356 ) ) ( not ( = ?auto_562352 ?auto_562357 ) ) ( not ( = ?auto_562353 ?auto_562354 ) ) ( not ( = ?auto_562353 ?auto_562355 ) ) ( not ( = ?auto_562353 ?auto_562356 ) ) ( not ( = ?auto_562353 ?auto_562357 ) ) ( not ( = ?auto_562354 ?auto_562355 ) ) ( not ( = ?auto_562354 ?auto_562356 ) ) ( not ( = ?auto_562354 ?auto_562357 ) ) ( not ( = ?auto_562355 ?auto_562356 ) ) ( not ( = ?auto_562355 ?auto_562357 ) ) ( not ( = ?auto_562356 ?auto_562357 ) ) ( ON ?auto_562355 ?auto_562356 ) ( ON ?auto_562354 ?auto_562355 ) ( ON ?auto_562353 ?auto_562354 ) ( ON ?auto_562352 ?auto_562353 ) ( ON ?auto_562351 ?auto_562352 ) ( ON ?auto_562350 ?auto_562351 ) ( ON ?auto_562349 ?auto_562350 ) ( ON ?auto_562348 ?auto_562349 ) ( ON ?auto_562347 ?auto_562348 ) ( CLEAR ?auto_562345 ) ( ON ?auto_562346 ?auto_562347 ) ( CLEAR ?auto_562346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_562344 ?auto_562345 ?auto_562346 )
      ( MAKE-13PILE ?auto_562344 ?auto_562345 ?auto_562346 ?auto_562347 ?auto_562348 ?auto_562349 ?auto_562350 ?auto_562351 ?auto_562352 ?auto_562353 ?auto_562354 ?auto_562355 ?auto_562356 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562398 - BLOCK
      ?auto_562399 - BLOCK
      ?auto_562400 - BLOCK
      ?auto_562401 - BLOCK
      ?auto_562402 - BLOCK
      ?auto_562403 - BLOCK
      ?auto_562404 - BLOCK
      ?auto_562405 - BLOCK
      ?auto_562406 - BLOCK
      ?auto_562407 - BLOCK
      ?auto_562408 - BLOCK
      ?auto_562409 - BLOCK
      ?auto_562410 - BLOCK
    )
    :vars
    (
      ?auto_562411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562410 ?auto_562411 ) ( ON-TABLE ?auto_562398 ) ( not ( = ?auto_562398 ?auto_562399 ) ) ( not ( = ?auto_562398 ?auto_562400 ) ) ( not ( = ?auto_562398 ?auto_562401 ) ) ( not ( = ?auto_562398 ?auto_562402 ) ) ( not ( = ?auto_562398 ?auto_562403 ) ) ( not ( = ?auto_562398 ?auto_562404 ) ) ( not ( = ?auto_562398 ?auto_562405 ) ) ( not ( = ?auto_562398 ?auto_562406 ) ) ( not ( = ?auto_562398 ?auto_562407 ) ) ( not ( = ?auto_562398 ?auto_562408 ) ) ( not ( = ?auto_562398 ?auto_562409 ) ) ( not ( = ?auto_562398 ?auto_562410 ) ) ( not ( = ?auto_562398 ?auto_562411 ) ) ( not ( = ?auto_562399 ?auto_562400 ) ) ( not ( = ?auto_562399 ?auto_562401 ) ) ( not ( = ?auto_562399 ?auto_562402 ) ) ( not ( = ?auto_562399 ?auto_562403 ) ) ( not ( = ?auto_562399 ?auto_562404 ) ) ( not ( = ?auto_562399 ?auto_562405 ) ) ( not ( = ?auto_562399 ?auto_562406 ) ) ( not ( = ?auto_562399 ?auto_562407 ) ) ( not ( = ?auto_562399 ?auto_562408 ) ) ( not ( = ?auto_562399 ?auto_562409 ) ) ( not ( = ?auto_562399 ?auto_562410 ) ) ( not ( = ?auto_562399 ?auto_562411 ) ) ( not ( = ?auto_562400 ?auto_562401 ) ) ( not ( = ?auto_562400 ?auto_562402 ) ) ( not ( = ?auto_562400 ?auto_562403 ) ) ( not ( = ?auto_562400 ?auto_562404 ) ) ( not ( = ?auto_562400 ?auto_562405 ) ) ( not ( = ?auto_562400 ?auto_562406 ) ) ( not ( = ?auto_562400 ?auto_562407 ) ) ( not ( = ?auto_562400 ?auto_562408 ) ) ( not ( = ?auto_562400 ?auto_562409 ) ) ( not ( = ?auto_562400 ?auto_562410 ) ) ( not ( = ?auto_562400 ?auto_562411 ) ) ( not ( = ?auto_562401 ?auto_562402 ) ) ( not ( = ?auto_562401 ?auto_562403 ) ) ( not ( = ?auto_562401 ?auto_562404 ) ) ( not ( = ?auto_562401 ?auto_562405 ) ) ( not ( = ?auto_562401 ?auto_562406 ) ) ( not ( = ?auto_562401 ?auto_562407 ) ) ( not ( = ?auto_562401 ?auto_562408 ) ) ( not ( = ?auto_562401 ?auto_562409 ) ) ( not ( = ?auto_562401 ?auto_562410 ) ) ( not ( = ?auto_562401 ?auto_562411 ) ) ( not ( = ?auto_562402 ?auto_562403 ) ) ( not ( = ?auto_562402 ?auto_562404 ) ) ( not ( = ?auto_562402 ?auto_562405 ) ) ( not ( = ?auto_562402 ?auto_562406 ) ) ( not ( = ?auto_562402 ?auto_562407 ) ) ( not ( = ?auto_562402 ?auto_562408 ) ) ( not ( = ?auto_562402 ?auto_562409 ) ) ( not ( = ?auto_562402 ?auto_562410 ) ) ( not ( = ?auto_562402 ?auto_562411 ) ) ( not ( = ?auto_562403 ?auto_562404 ) ) ( not ( = ?auto_562403 ?auto_562405 ) ) ( not ( = ?auto_562403 ?auto_562406 ) ) ( not ( = ?auto_562403 ?auto_562407 ) ) ( not ( = ?auto_562403 ?auto_562408 ) ) ( not ( = ?auto_562403 ?auto_562409 ) ) ( not ( = ?auto_562403 ?auto_562410 ) ) ( not ( = ?auto_562403 ?auto_562411 ) ) ( not ( = ?auto_562404 ?auto_562405 ) ) ( not ( = ?auto_562404 ?auto_562406 ) ) ( not ( = ?auto_562404 ?auto_562407 ) ) ( not ( = ?auto_562404 ?auto_562408 ) ) ( not ( = ?auto_562404 ?auto_562409 ) ) ( not ( = ?auto_562404 ?auto_562410 ) ) ( not ( = ?auto_562404 ?auto_562411 ) ) ( not ( = ?auto_562405 ?auto_562406 ) ) ( not ( = ?auto_562405 ?auto_562407 ) ) ( not ( = ?auto_562405 ?auto_562408 ) ) ( not ( = ?auto_562405 ?auto_562409 ) ) ( not ( = ?auto_562405 ?auto_562410 ) ) ( not ( = ?auto_562405 ?auto_562411 ) ) ( not ( = ?auto_562406 ?auto_562407 ) ) ( not ( = ?auto_562406 ?auto_562408 ) ) ( not ( = ?auto_562406 ?auto_562409 ) ) ( not ( = ?auto_562406 ?auto_562410 ) ) ( not ( = ?auto_562406 ?auto_562411 ) ) ( not ( = ?auto_562407 ?auto_562408 ) ) ( not ( = ?auto_562407 ?auto_562409 ) ) ( not ( = ?auto_562407 ?auto_562410 ) ) ( not ( = ?auto_562407 ?auto_562411 ) ) ( not ( = ?auto_562408 ?auto_562409 ) ) ( not ( = ?auto_562408 ?auto_562410 ) ) ( not ( = ?auto_562408 ?auto_562411 ) ) ( not ( = ?auto_562409 ?auto_562410 ) ) ( not ( = ?auto_562409 ?auto_562411 ) ) ( not ( = ?auto_562410 ?auto_562411 ) ) ( ON ?auto_562409 ?auto_562410 ) ( ON ?auto_562408 ?auto_562409 ) ( ON ?auto_562407 ?auto_562408 ) ( ON ?auto_562406 ?auto_562407 ) ( ON ?auto_562405 ?auto_562406 ) ( ON ?auto_562404 ?auto_562405 ) ( ON ?auto_562403 ?auto_562404 ) ( ON ?auto_562402 ?auto_562403 ) ( ON ?auto_562401 ?auto_562402 ) ( ON ?auto_562400 ?auto_562401 ) ( CLEAR ?auto_562398 ) ( ON ?auto_562399 ?auto_562400 ) ( CLEAR ?auto_562399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_562398 ?auto_562399 )
      ( MAKE-13PILE ?auto_562398 ?auto_562399 ?auto_562400 ?auto_562401 ?auto_562402 ?auto_562403 ?auto_562404 ?auto_562405 ?auto_562406 ?auto_562407 ?auto_562408 ?auto_562409 ?auto_562410 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_562452 - BLOCK
      ?auto_562453 - BLOCK
      ?auto_562454 - BLOCK
      ?auto_562455 - BLOCK
      ?auto_562456 - BLOCK
      ?auto_562457 - BLOCK
      ?auto_562458 - BLOCK
      ?auto_562459 - BLOCK
      ?auto_562460 - BLOCK
      ?auto_562461 - BLOCK
      ?auto_562462 - BLOCK
      ?auto_562463 - BLOCK
      ?auto_562464 - BLOCK
    )
    :vars
    (
      ?auto_562465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562464 ?auto_562465 ) ( not ( = ?auto_562452 ?auto_562453 ) ) ( not ( = ?auto_562452 ?auto_562454 ) ) ( not ( = ?auto_562452 ?auto_562455 ) ) ( not ( = ?auto_562452 ?auto_562456 ) ) ( not ( = ?auto_562452 ?auto_562457 ) ) ( not ( = ?auto_562452 ?auto_562458 ) ) ( not ( = ?auto_562452 ?auto_562459 ) ) ( not ( = ?auto_562452 ?auto_562460 ) ) ( not ( = ?auto_562452 ?auto_562461 ) ) ( not ( = ?auto_562452 ?auto_562462 ) ) ( not ( = ?auto_562452 ?auto_562463 ) ) ( not ( = ?auto_562452 ?auto_562464 ) ) ( not ( = ?auto_562452 ?auto_562465 ) ) ( not ( = ?auto_562453 ?auto_562454 ) ) ( not ( = ?auto_562453 ?auto_562455 ) ) ( not ( = ?auto_562453 ?auto_562456 ) ) ( not ( = ?auto_562453 ?auto_562457 ) ) ( not ( = ?auto_562453 ?auto_562458 ) ) ( not ( = ?auto_562453 ?auto_562459 ) ) ( not ( = ?auto_562453 ?auto_562460 ) ) ( not ( = ?auto_562453 ?auto_562461 ) ) ( not ( = ?auto_562453 ?auto_562462 ) ) ( not ( = ?auto_562453 ?auto_562463 ) ) ( not ( = ?auto_562453 ?auto_562464 ) ) ( not ( = ?auto_562453 ?auto_562465 ) ) ( not ( = ?auto_562454 ?auto_562455 ) ) ( not ( = ?auto_562454 ?auto_562456 ) ) ( not ( = ?auto_562454 ?auto_562457 ) ) ( not ( = ?auto_562454 ?auto_562458 ) ) ( not ( = ?auto_562454 ?auto_562459 ) ) ( not ( = ?auto_562454 ?auto_562460 ) ) ( not ( = ?auto_562454 ?auto_562461 ) ) ( not ( = ?auto_562454 ?auto_562462 ) ) ( not ( = ?auto_562454 ?auto_562463 ) ) ( not ( = ?auto_562454 ?auto_562464 ) ) ( not ( = ?auto_562454 ?auto_562465 ) ) ( not ( = ?auto_562455 ?auto_562456 ) ) ( not ( = ?auto_562455 ?auto_562457 ) ) ( not ( = ?auto_562455 ?auto_562458 ) ) ( not ( = ?auto_562455 ?auto_562459 ) ) ( not ( = ?auto_562455 ?auto_562460 ) ) ( not ( = ?auto_562455 ?auto_562461 ) ) ( not ( = ?auto_562455 ?auto_562462 ) ) ( not ( = ?auto_562455 ?auto_562463 ) ) ( not ( = ?auto_562455 ?auto_562464 ) ) ( not ( = ?auto_562455 ?auto_562465 ) ) ( not ( = ?auto_562456 ?auto_562457 ) ) ( not ( = ?auto_562456 ?auto_562458 ) ) ( not ( = ?auto_562456 ?auto_562459 ) ) ( not ( = ?auto_562456 ?auto_562460 ) ) ( not ( = ?auto_562456 ?auto_562461 ) ) ( not ( = ?auto_562456 ?auto_562462 ) ) ( not ( = ?auto_562456 ?auto_562463 ) ) ( not ( = ?auto_562456 ?auto_562464 ) ) ( not ( = ?auto_562456 ?auto_562465 ) ) ( not ( = ?auto_562457 ?auto_562458 ) ) ( not ( = ?auto_562457 ?auto_562459 ) ) ( not ( = ?auto_562457 ?auto_562460 ) ) ( not ( = ?auto_562457 ?auto_562461 ) ) ( not ( = ?auto_562457 ?auto_562462 ) ) ( not ( = ?auto_562457 ?auto_562463 ) ) ( not ( = ?auto_562457 ?auto_562464 ) ) ( not ( = ?auto_562457 ?auto_562465 ) ) ( not ( = ?auto_562458 ?auto_562459 ) ) ( not ( = ?auto_562458 ?auto_562460 ) ) ( not ( = ?auto_562458 ?auto_562461 ) ) ( not ( = ?auto_562458 ?auto_562462 ) ) ( not ( = ?auto_562458 ?auto_562463 ) ) ( not ( = ?auto_562458 ?auto_562464 ) ) ( not ( = ?auto_562458 ?auto_562465 ) ) ( not ( = ?auto_562459 ?auto_562460 ) ) ( not ( = ?auto_562459 ?auto_562461 ) ) ( not ( = ?auto_562459 ?auto_562462 ) ) ( not ( = ?auto_562459 ?auto_562463 ) ) ( not ( = ?auto_562459 ?auto_562464 ) ) ( not ( = ?auto_562459 ?auto_562465 ) ) ( not ( = ?auto_562460 ?auto_562461 ) ) ( not ( = ?auto_562460 ?auto_562462 ) ) ( not ( = ?auto_562460 ?auto_562463 ) ) ( not ( = ?auto_562460 ?auto_562464 ) ) ( not ( = ?auto_562460 ?auto_562465 ) ) ( not ( = ?auto_562461 ?auto_562462 ) ) ( not ( = ?auto_562461 ?auto_562463 ) ) ( not ( = ?auto_562461 ?auto_562464 ) ) ( not ( = ?auto_562461 ?auto_562465 ) ) ( not ( = ?auto_562462 ?auto_562463 ) ) ( not ( = ?auto_562462 ?auto_562464 ) ) ( not ( = ?auto_562462 ?auto_562465 ) ) ( not ( = ?auto_562463 ?auto_562464 ) ) ( not ( = ?auto_562463 ?auto_562465 ) ) ( not ( = ?auto_562464 ?auto_562465 ) ) ( ON ?auto_562463 ?auto_562464 ) ( ON ?auto_562462 ?auto_562463 ) ( ON ?auto_562461 ?auto_562462 ) ( ON ?auto_562460 ?auto_562461 ) ( ON ?auto_562459 ?auto_562460 ) ( ON ?auto_562458 ?auto_562459 ) ( ON ?auto_562457 ?auto_562458 ) ( ON ?auto_562456 ?auto_562457 ) ( ON ?auto_562455 ?auto_562456 ) ( ON ?auto_562454 ?auto_562455 ) ( ON ?auto_562453 ?auto_562454 ) ( ON ?auto_562452 ?auto_562453 ) ( CLEAR ?auto_562452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_562452 )
      ( MAKE-13PILE ?auto_562452 ?auto_562453 ?auto_562454 ?auto_562455 ?auto_562456 ?auto_562457 ?auto_562458 ?auto_562459 ?auto_562460 ?auto_562461 ?auto_562462 ?auto_562463 ?auto_562464 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562507 - BLOCK
      ?auto_562508 - BLOCK
      ?auto_562509 - BLOCK
      ?auto_562510 - BLOCK
      ?auto_562511 - BLOCK
      ?auto_562512 - BLOCK
      ?auto_562513 - BLOCK
      ?auto_562514 - BLOCK
      ?auto_562515 - BLOCK
      ?auto_562516 - BLOCK
      ?auto_562517 - BLOCK
      ?auto_562518 - BLOCK
      ?auto_562519 - BLOCK
      ?auto_562520 - BLOCK
    )
    :vars
    (
      ?auto_562521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_562519 ) ( ON ?auto_562520 ?auto_562521 ) ( CLEAR ?auto_562520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_562507 ) ( ON ?auto_562508 ?auto_562507 ) ( ON ?auto_562509 ?auto_562508 ) ( ON ?auto_562510 ?auto_562509 ) ( ON ?auto_562511 ?auto_562510 ) ( ON ?auto_562512 ?auto_562511 ) ( ON ?auto_562513 ?auto_562512 ) ( ON ?auto_562514 ?auto_562513 ) ( ON ?auto_562515 ?auto_562514 ) ( ON ?auto_562516 ?auto_562515 ) ( ON ?auto_562517 ?auto_562516 ) ( ON ?auto_562518 ?auto_562517 ) ( ON ?auto_562519 ?auto_562518 ) ( not ( = ?auto_562507 ?auto_562508 ) ) ( not ( = ?auto_562507 ?auto_562509 ) ) ( not ( = ?auto_562507 ?auto_562510 ) ) ( not ( = ?auto_562507 ?auto_562511 ) ) ( not ( = ?auto_562507 ?auto_562512 ) ) ( not ( = ?auto_562507 ?auto_562513 ) ) ( not ( = ?auto_562507 ?auto_562514 ) ) ( not ( = ?auto_562507 ?auto_562515 ) ) ( not ( = ?auto_562507 ?auto_562516 ) ) ( not ( = ?auto_562507 ?auto_562517 ) ) ( not ( = ?auto_562507 ?auto_562518 ) ) ( not ( = ?auto_562507 ?auto_562519 ) ) ( not ( = ?auto_562507 ?auto_562520 ) ) ( not ( = ?auto_562507 ?auto_562521 ) ) ( not ( = ?auto_562508 ?auto_562509 ) ) ( not ( = ?auto_562508 ?auto_562510 ) ) ( not ( = ?auto_562508 ?auto_562511 ) ) ( not ( = ?auto_562508 ?auto_562512 ) ) ( not ( = ?auto_562508 ?auto_562513 ) ) ( not ( = ?auto_562508 ?auto_562514 ) ) ( not ( = ?auto_562508 ?auto_562515 ) ) ( not ( = ?auto_562508 ?auto_562516 ) ) ( not ( = ?auto_562508 ?auto_562517 ) ) ( not ( = ?auto_562508 ?auto_562518 ) ) ( not ( = ?auto_562508 ?auto_562519 ) ) ( not ( = ?auto_562508 ?auto_562520 ) ) ( not ( = ?auto_562508 ?auto_562521 ) ) ( not ( = ?auto_562509 ?auto_562510 ) ) ( not ( = ?auto_562509 ?auto_562511 ) ) ( not ( = ?auto_562509 ?auto_562512 ) ) ( not ( = ?auto_562509 ?auto_562513 ) ) ( not ( = ?auto_562509 ?auto_562514 ) ) ( not ( = ?auto_562509 ?auto_562515 ) ) ( not ( = ?auto_562509 ?auto_562516 ) ) ( not ( = ?auto_562509 ?auto_562517 ) ) ( not ( = ?auto_562509 ?auto_562518 ) ) ( not ( = ?auto_562509 ?auto_562519 ) ) ( not ( = ?auto_562509 ?auto_562520 ) ) ( not ( = ?auto_562509 ?auto_562521 ) ) ( not ( = ?auto_562510 ?auto_562511 ) ) ( not ( = ?auto_562510 ?auto_562512 ) ) ( not ( = ?auto_562510 ?auto_562513 ) ) ( not ( = ?auto_562510 ?auto_562514 ) ) ( not ( = ?auto_562510 ?auto_562515 ) ) ( not ( = ?auto_562510 ?auto_562516 ) ) ( not ( = ?auto_562510 ?auto_562517 ) ) ( not ( = ?auto_562510 ?auto_562518 ) ) ( not ( = ?auto_562510 ?auto_562519 ) ) ( not ( = ?auto_562510 ?auto_562520 ) ) ( not ( = ?auto_562510 ?auto_562521 ) ) ( not ( = ?auto_562511 ?auto_562512 ) ) ( not ( = ?auto_562511 ?auto_562513 ) ) ( not ( = ?auto_562511 ?auto_562514 ) ) ( not ( = ?auto_562511 ?auto_562515 ) ) ( not ( = ?auto_562511 ?auto_562516 ) ) ( not ( = ?auto_562511 ?auto_562517 ) ) ( not ( = ?auto_562511 ?auto_562518 ) ) ( not ( = ?auto_562511 ?auto_562519 ) ) ( not ( = ?auto_562511 ?auto_562520 ) ) ( not ( = ?auto_562511 ?auto_562521 ) ) ( not ( = ?auto_562512 ?auto_562513 ) ) ( not ( = ?auto_562512 ?auto_562514 ) ) ( not ( = ?auto_562512 ?auto_562515 ) ) ( not ( = ?auto_562512 ?auto_562516 ) ) ( not ( = ?auto_562512 ?auto_562517 ) ) ( not ( = ?auto_562512 ?auto_562518 ) ) ( not ( = ?auto_562512 ?auto_562519 ) ) ( not ( = ?auto_562512 ?auto_562520 ) ) ( not ( = ?auto_562512 ?auto_562521 ) ) ( not ( = ?auto_562513 ?auto_562514 ) ) ( not ( = ?auto_562513 ?auto_562515 ) ) ( not ( = ?auto_562513 ?auto_562516 ) ) ( not ( = ?auto_562513 ?auto_562517 ) ) ( not ( = ?auto_562513 ?auto_562518 ) ) ( not ( = ?auto_562513 ?auto_562519 ) ) ( not ( = ?auto_562513 ?auto_562520 ) ) ( not ( = ?auto_562513 ?auto_562521 ) ) ( not ( = ?auto_562514 ?auto_562515 ) ) ( not ( = ?auto_562514 ?auto_562516 ) ) ( not ( = ?auto_562514 ?auto_562517 ) ) ( not ( = ?auto_562514 ?auto_562518 ) ) ( not ( = ?auto_562514 ?auto_562519 ) ) ( not ( = ?auto_562514 ?auto_562520 ) ) ( not ( = ?auto_562514 ?auto_562521 ) ) ( not ( = ?auto_562515 ?auto_562516 ) ) ( not ( = ?auto_562515 ?auto_562517 ) ) ( not ( = ?auto_562515 ?auto_562518 ) ) ( not ( = ?auto_562515 ?auto_562519 ) ) ( not ( = ?auto_562515 ?auto_562520 ) ) ( not ( = ?auto_562515 ?auto_562521 ) ) ( not ( = ?auto_562516 ?auto_562517 ) ) ( not ( = ?auto_562516 ?auto_562518 ) ) ( not ( = ?auto_562516 ?auto_562519 ) ) ( not ( = ?auto_562516 ?auto_562520 ) ) ( not ( = ?auto_562516 ?auto_562521 ) ) ( not ( = ?auto_562517 ?auto_562518 ) ) ( not ( = ?auto_562517 ?auto_562519 ) ) ( not ( = ?auto_562517 ?auto_562520 ) ) ( not ( = ?auto_562517 ?auto_562521 ) ) ( not ( = ?auto_562518 ?auto_562519 ) ) ( not ( = ?auto_562518 ?auto_562520 ) ) ( not ( = ?auto_562518 ?auto_562521 ) ) ( not ( = ?auto_562519 ?auto_562520 ) ) ( not ( = ?auto_562519 ?auto_562521 ) ) ( not ( = ?auto_562520 ?auto_562521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_562520 ?auto_562521 )
      ( !STACK ?auto_562520 ?auto_562519 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562565 - BLOCK
      ?auto_562566 - BLOCK
      ?auto_562567 - BLOCK
      ?auto_562568 - BLOCK
      ?auto_562569 - BLOCK
      ?auto_562570 - BLOCK
      ?auto_562571 - BLOCK
      ?auto_562572 - BLOCK
      ?auto_562573 - BLOCK
      ?auto_562574 - BLOCK
      ?auto_562575 - BLOCK
      ?auto_562576 - BLOCK
      ?auto_562577 - BLOCK
      ?auto_562578 - BLOCK
    )
    :vars
    (
      ?auto_562579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562578 ?auto_562579 ) ( ON-TABLE ?auto_562565 ) ( ON ?auto_562566 ?auto_562565 ) ( ON ?auto_562567 ?auto_562566 ) ( ON ?auto_562568 ?auto_562567 ) ( ON ?auto_562569 ?auto_562568 ) ( ON ?auto_562570 ?auto_562569 ) ( ON ?auto_562571 ?auto_562570 ) ( ON ?auto_562572 ?auto_562571 ) ( ON ?auto_562573 ?auto_562572 ) ( ON ?auto_562574 ?auto_562573 ) ( ON ?auto_562575 ?auto_562574 ) ( ON ?auto_562576 ?auto_562575 ) ( not ( = ?auto_562565 ?auto_562566 ) ) ( not ( = ?auto_562565 ?auto_562567 ) ) ( not ( = ?auto_562565 ?auto_562568 ) ) ( not ( = ?auto_562565 ?auto_562569 ) ) ( not ( = ?auto_562565 ?auto_562570 ) ) ( not ( = ?auto_562565 ?auto_562571 ) ) ( not ( = ?auto_562565 ?auto_562572 ) ) ( not ( = ?auto_562565 ?auto_562573 ) ) ( not ( = ?auto_562565 ?auto_562574 ) ) ( not ( = ?auto_562565 ?auto_562575 ) ) ( not ( = ?auto_562565 ?auto_562576 ) ) ( not ( = ?auto_562565 ?auto_562577 ) ) ( not ( = ?auto_562565 ?auto_562578 ) ) ( not ( = ?auto_562565 ?auto_562579 ) ) ( not ( = ?auto_562566 ?auto_562567 ) ) ( not ( = ?auto_562566 ?auto_562568 ) ) ( not ( = ?auto_562566 ?auto_562569 ) ) ( not ( = ?auto_562566 ?auto_562570 ) ) ( not ( = ?auto_562566 ?auto_562571 ) ) ( not ( = ?auto_562566 ?auto_562572 ) ) ( not ( = ?auto_562566 ?auto_562573 ) ) ( not ( = ?auto_562566 ?auto_562574 ) ) ( not ( = ?auto_562566 ?auto_562575 ) ) ( not ( = ?auto_562566 ?auto_562576 ) ) ( not ( = ?auto_562566 ?auto_562577 ) ) ( not ( = ?auto_562566 ?auto_562578 ) ) ( not ( = ?auto_562566 ?auto_562579 ) ) ( not ( = ?auto_562567 ?auto_562568 ) ) ( not ( = ?auto_562567 ?auto_562569 ) ) ( not ( = ?auto_562567 ?auto_562570 ) ) ( not ( = ?auto_562567 ?auto_562571 ) ) ( not ( = ?auto_562567 ?auto_562572 ) ) ( not ( = ?auto_562567 ?auto_562573 ) ) ( not ( = ?auto_562567 ?auto_562574 ) ) ( not ( = ?auto_562567 ?auto_562575 ) ) ( not ( = ?auto_562567 ?auto_562576 ) ) ( not ( = ?auto_562567 ?auto_562577 ) ) ( not ( = ?auto_562567 ?auto_562578 ) ) ( not ( = ?auto_562567 ?auto_562579 ) ) ( not ( = ?auto_562568 ?auto_562569 ) ) ( not ( = ?auto_562568 ?auto_562570 ) ) ( not ( = ?auto_562568 ?auto_562571 ) ) ( not ( = ?auto_562568 ?auto_562572 ) ) ( not ( = ?auto_562568 ?auto_562573 ) ) ( not ( = ?auto_562568 ?auto_562574 ) ) ( not ( = ?auto_562568 ?auto_562575 ) ) ( not ( = ?auto_562568 ?auto_562576 ) ) ( not ( = ?auto_562568 ?auto_562577 ) ) ( not ( = ?auto_562568 ?auto_562578 ) ) ( not ( = ?auto_562568 ?auto_562579 ) ) ( not ( = ?auto_562569 ?auto_562570 ) ) ( not ( = ?auto_562569 ?auto_562571 ) ) ( not ( = ?auto_562569 ?auto_562572 ) ) ( not ( = ?auto_562569 ?auto_562573 ) ) ( not ( = ?auto_562569 ?auto_562574 ) ) ( not ( = ?auto_562569 ?auto_562575 ) ) ( not ( = ?auto_562569 ?auto_562576 ) ) ( not ( = ?auto_562569 ?auto_562577 ) ) ( not ( = ?auto_562569 ?auto_562578 ) ) ( not ( = ?auto_562569 ?auto_562579 ) ) ( not ( = ?auto_562570 ?auto_562571 ) ) ( not ( = ?auto_562570 ?auto_562572 ) ) ( not ( = ?auto_562570 ?auto_562573 ) ) ( not ( = ?auto_562570 ?auto_562574 ) ) ( not ( = ?auto_562570 ?auto_562575 ) ) ( not ( = ?auto_562570 ?auto_562576 ) ) ( not ( = ?auto_562570 ?auto_562577 ) ) ( not ( = ?auto_562570 ?auto_562578 ) ) ( not ( = ?auto_562570 ?auto_562579 ) ) ( not ( = ?auto_562571 ?auto_562572 ) ) ( not ( = ?auto_562571 ?auto_562573 ) ) ( not ( = ?auto_562571 ?auto_562574 ) ) ( not ( = ?auto_562571 ?auto_562575 ) ) ( not ( = ?auto_562571 ?auto_562576 ) ) ( not ( = ?auto_562571 ?auto_562577 ) ) ( not ( = ?auto_562571 ?auto_562578 ) ) ( not ( = ?auto_562571 ?auto_562579 ) ) ( not ( = ?auto_562572 ?auto_562573 ) ) ( not ( = ?auto_562572 ?auto_562574 ) ) ( not ( = ?auto_562572 ?auto_562575 ) ) ( not ( = ?auto_562572 ?auto_562576 ) ) ( not ( = ?auto_562572 ?auto_562577 ) ) ( not ( = ?auto_562572 ?auto_562578 ) ) ( not ( = ?auto_562572 ?auto_562579 ) ) ( not ( = ?auto_562573 ?auto_562574 ) ) ( not ( = ?auto_562573 ?auto_562575 ) ) ( not ( = ?auto_562573 ?auto_562576 ) ) ( not ( = ?auto_562573 ?auto_562577 ) ) ( not ( = ?auto_562573 ?auto_562578 ) ) ( not ( = ?auto_562573 ?auto_562579 ) ) ( not ( = ?auto_562574 ?auto_562575 ) ) ( not ( = ?auto_562574 ?auto_562576 ) ) ( not ( = ?auto_562574 ?auto_562577 ) ) ( not ( = ?auto_562574 ?auto_562578 ) ) ( not ( = ?auto_562574 ?auto_562579 ) ) ( not ( = ?auto_562575 ?auto_562576 ) ) ( not ( = ?auto_562575 ?auto_562577 ) ) ( not ( = ?auto_562575 ?auto_562578 ) ) ( not ( = ?auto_562575 ?auto_562579 ) ) ( not ( = ?auto_562576 ?auto_562577 ) ) ( not ( = ?auto_562576 ?auto_562578 ) ) ( not ( = ?auto_562576 ?auto_562579 ) ) ( not ( = ?auto_562577 ?auto_562578 ) ) ( not ( = ?auto_562577 ?auto_562579 ) ) ( not ( = ?auto_562578 ?auto_562579 ) ) ( CLEAR ?auto_562576 ) ( ON ?auto_562577 ?auto_562578 ) ( CLEAR ?auto_562577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_562565 ?auto_562566 ?auto_562567 ?auto_562568 ?auto_562569 ?auto_562570 ?auto_562571 ?auto_562572 ?auto_562573 ?auto_562574 ?auto_562575 ?auto_562576 ?auto_562577 )
      ( MAKE-14PILE ?auto_562565 ?auto_562566 ?auto_562567 ?auto_562568 ?auto_562569 ?auto_562570 ?auto_562571 ?auto_562572 ?auto_562573 ?auto_562574 ?auto_562575 ?auto_562576 ?auto_562577 ?auto_562578 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562623 - BLOCK
      ?auto_562624 - BLOCK
      ?auto_562625 - BLOCK
      ?auto_562626 - BLOCK
      ?auto_562627 - BLOCK
      ?auto_562628 - BLOCK
      ?auto_562629 - BLOCK
      ?auto_562630 - BLOCK
      ?auto_562631 - BLOCK
      ?auto_562632 - BLOCK
      ?auto_562633 - BLOCK
      ?auto_562634 - BLOCK
      ?auto_562635 - BLOCK
      ?auto_562636 - BLOCK
    )
    :vars
    (
      ?auto_562637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562636 ?auto_562637 ) ( ON-TABLE ?auto_562623 ) ( ON ?auto_562624 ?auto_562623 ) ( ON ?auto_562625 ?auto_562624 ) ( ON ?auto_562626 ?auto_562625 ) ( ON ?auto_562627 ?auto_562626 ) ( ON ?auto_562628 ?auto_562627 ) ( ON ?auto_562629 ?auto_562628 ) ( ON ?auto_562630 ?auto_562629 ) ( ON ?auto_562631 ?auto_562630 ) ( ON ?auto_562632 ?auto_562631 ) ( ON ?auto_562633 ?auto_562632 ) ( not ( = ?auto_562623 ?auto_562624 ) ) ( not ( = ?auto_562623 ?auto_562625 ) ) ( not ( = ?auto_562623 ?auto_562626 ) ) ( not ( = ?auto_562623 ?auto_562627 ) ) ( not ( = ?auto_562623 ?auto_562628 ) ) ( not ( = ?auto_562623 ?auto_562629 ) ) ( not ( = ?auto_562623 ?auto_562630 ) ) ( not ( = ?auto_562623 ?auto_562631 ) ) ( not ( = ?auto_562623 ?auto_562632 ) ) ( not ( = ?auto_562623 ?auto_562633 ) ) ( not ( = ?auto_562623 ?auto_562634 ) ) ( not ( = ?auto_562623 ?auto_562635 ) ) ( not ( = ?auto_562623 ?auto_562636 ) ) ( not ( = ?auto_562623 ?auto_562637 ) ) ( not ( = ?auto_562624 ?auto_562625 ) ) ( not ( = ?auto_562624 ?auto_562626 ) ) ( not ( = ?auto_562624 ?auto_562627 ) ) ( not ( = ?auto_562624 ?auto_562628 ) ) ( not ( = ?auto_562624 ?auto_562629 ) ) ( not ( = ?auto_562624 ?auto_562630 ) ) ( not ( = ?auto_562624 ?auto_562631 ) ) ( not ( = ?auto_562624 ?auto_562632 ) ) ( not ( = ?auto_562624 ?auto_562633 ) ) ( not ( = ?auto_562624 ?auto_562634 ) ) ( not ( = ?auto_562624 ?auto_562635 ) ) ( not ( = ?auto_562624 ?auto_562636 ) ) ( not ( = ?auto_562624 ?auto_562637 ) ) ( not ( = ?auto_562625 ?auto_562626 ) ) ( not ( = ?auto_562625 ?auto_562627 ) ) ( not ( = ?auto_562625 ?auto_562628 ) ) ( not ( = ?auto_562625 ?auto_562629 ) ) ( not ( = ?auto_562625 ?auto_562630 ) ) ( not ( = ?auto_562625 ?auto_562631 ) ) ( not ( = ?auto_562625 ?auto_562632 ) ) ( not ( = ?auto_562625 ?auto_562633 ) ) ( not ( = ?auto_562625 ?auto_562634 ) ) ( not ( = ?auto_562625 ?auto_562635 ) ) ( not ( = ?auto_562625 ?auto_562636 ) ) ( not ( = ?auto_562625 ?auto_562637 ) ) ( not ( = ?auto_562626 ?auto_562627 ) ) ( not ( = ?auto_562626 ?auto_562628 ) ) ( not ( = ?auto_562626 ?auto_562629 ) ) ( not ( = ?auto_562626 ?auto_562630 ) ) ( not ( = ?auto_562626 ?auto_562631 ) ) ( not ( = ?auto_562626 ?auto_562632 ) ) ( not ( = ?auto_562626 ?auto_562633 ) ) ( not ( = ?auto_562626 ?auto_562634 ) ) ( not ( = ?auto_562626 ?auto_562635 ) ) ( not ( = ?auto_562626 ?auto_562636 ) ) ( not ( = ?auto_562626 ?auto_562637 ) ) ( not ( = ?auto_562627 ?auto_562628 ) ) ( not ( = ?auto_562627 ?auto_562629 ) ) ( not ( = ?auto_562627 ?auto_562630 ) ) ( not ( = ?auto_562627 ?auto_562631 ) ) ( not ( = ?auto_562627 ?auto_562632 ) ) ( not ( = ?auto_562627 ?auto_562633 ) ) ( not ( = ?auto_562627 ?auto_562634 ) ) ( not ( = ?auto_562627 ?auto_562635 ) ) ( not ( = ?auto_562627 ?auto_562636 ) ) ( not ( = ?auto_562627 ?auto_562637 ) ) ( not ( = ?auto_562628 ?auto_562629 ) ) ( not ( = ?auto_562628 ?auto_562630 ) ) ( not ( = ?auto_562628 ?auto_562631 ) ) ( not ( = ?auto_562628 ?auto_562632 ) ) ( not ( = ?auto_562628 ?auto_562633 ) ) ( not ( = ?auto_562628 ?auto_562634 ) ) ( not ( = ?auto_562628 ?auto_562635 ) ) ( not ( = ?auto_562628 ?auto_562636 ) ) ( not ( = ?auto_562628 ?auto_562637 ) ) ( not ( = ?auto_562629 ?auto_562630 ) ) ( not ( = ?auto_562629 ?auto_562631 ) ) ( not ( = ?auto_562629 ?auto_562632 ) ) ( not ( = ?auto_562629 ?auto_562633 ) ) ( not ( = ?auto_562629 ?auto_562634 ) ) ( not ( = ?auto_562629 ?auto_562635 ) ) ( not ( = ?auto_562629 ?auto_562636 ) ) ( not ( = ?auto_562629 ?auto_562637 ) ) ( not ( = ?auto_562630 ?auto_562631 ) ) ( not ( = ?auto_562630 ?auto_562632 ) ) ( not ( = ?auto_562630 ?auto_562633 ) ) ( not ( = ?auto_562630 ?auto_562634 ) ) ( not ( = ?auto_562630 ?auto_562635 ) ) ( not ( = ?auto_562630 ?auto_562636 ) ) ( not ( = ?auto_562630 ?auto_562637 ) ) ( not ( = ?auto_562631 ?auto_562632 ) ) ( not ( = ?auto_562631 ?auto_562633 ) ) ( not ( = ?auto_562631 ?auto_562634 ) ) ( not ( = ?auto_562631 ?auto_562635 ) ) ( not ( = ?auto_562631 ?auto_562636 ) ) ( not ( = ?auto_562631 ?auto_562637 ) ) ( not ( = ?auto_562632 ?auto_562633 ) ) ( not ( = ?auto_562632 ?auto_562634 ) ) ( not ( = ?auto_562632 ?auto_562635 ) ) ( not ( = ?auto_562632 ?auto_562636 ) ) ( not ( = ?auto_562632 ?auto_562637 ) ) ( not ( = ?auto_562633 ?auto_562634 ) ) ( not ( = ?auto_562633 ?auto_562635 ) ) ( not ( = ?auto_562633 ?auto_562636 ) ) ( not ( = ?auto_562633 ?auto_562637 ) ) ( not ( = ?auto_562634 ?auto_562635 ) ) ( not ( = ?auto_562634 ?auto_562636 ) ) ( not ( = ?auto_562634 ?auto_562637 ) ) ( not ( = ?auto_562635 ?auto_562636 ) ) ( not ( = ?auto_562635 ?auto_562637 ) ) ( not ( = ?auto_562636 ?auto_562637 ) ) ( ON ?auto_562635 ?auto_562636 ) ( CLEAR ?auto_562633 ) ( ON ?auto_562634 ?auto_562635 ) ( CLEAR ?auto_562634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_562623 ?auto_562624 ?auto_562625 ?auto_562626 ?auto_562627 ?auto_562628 ?auto_562629 ?auto_562630 ?auto_562631 ?auto_562632 ?auto_562633 ?auto_562634 )
      ( MAKE-14PILE ?auto_562623 ?auto_562624 ?auto_562625 ?auto_562626 ?auto_562627 ?auto_562628 ?auto_562629 ?auto_562630 ?auto_562631 ?auto_562632 ?auto_562633 ?auto_562634 ?auto_562635 ?auto_562636 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562681 - BLOCK
      ?auto_562682 - BLOCK
      ?auto_562683 - BLOCK
      ?auto_562684 - BLOCK
      ?auto_562685 - BLOCK
      ?auto_562686 - BLOCK
      ?auto_562687 - BLOCK
      ?auto_562688 - BLOCK
      ?auto_562689 - BLOCK
      ?auto_562690 - BLOCK
      ?auto_562691 - BLOCK
      ?auto_562692 - BLOCK
      ?auto_562693 - BLOCK
      ?auto_562694 - BLOCK
    )
    :vars
    (
      ?auto_562695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562694 ?auto_562695 ) ( ON-TABLE ?auto_562681 ) ( ON ?auto_562682 ?auto_562681 ) ( ON ?auto_562683 ?auto_562682 ) ( ON ?auto_562684 ?auto_562683 ) ( ON ?auto_562685 ?auto_562684 ) ( ON ?auto_562686 ?auto_562685 ) ( ON ?auto_562687 ?auto_562686 ) ( ON ?auto_562688 ?auto_562687 ) ( ON ?auto_562689 ?auto_562688 ) ( ON ?auto_562690 ?auto_562689 ) ( not ( = ?auto_562681 ?auto_562682 ) ) ( not ( = ?auto_562681 ?auto_562683 ) ) ( not ( = ?auto_562681 ?auto_562684 ) ) ( not ( = ?auto_562681 ?auto_562685 ) ) ( not ( = ?auto_562681 ?auto_562686 ) ) ( not ( = ?auto_562681 ?auto_562687 ) ) ( not ( = ?auto_562681 ?auto_562688 ) ) ( not ( = ?auto_562681 ?auto_562689 ) ) ( not ( = ?auto_562681 ?auto_562690 ) ) ( not ( = ?auto_562681 ?auto_562691 ) ) ( not ( = ?auto_562681 ?auto_562692 ) ) ( not ( = ?auto_562681 ?auto_562693 ) ) ( not ( = ?auto_562681 ?auto_562694 ) ) ( not ( = ?auto_562681 ?auto_562695 ) ) ( not ( = ?auto_562682 ?auto_562683 ) ) ( not ( = ?auto_562682 ?auto_562684 ) ) ( not ( = ?auto_562682 ?auto_562685 ) ) ( not ( = ?auto_562682 ?auto_562686 ) ) ( not ( = ?auto_562682 ?auto_562687 ) ) ( not ( = ?auto_562682 ?auto_562688 ) ) ( not ( = ?auto_562682 ?auto_562689 ) ) ( not ( = ?auto_562682 ?auto_562690 ) ) ( not ( = ?auto_562682 ?auto_562691 ) ) ( not ( = ?auto_562682 ?auto_562692 ) ) ( not ( = ?auto_562682 ?auto_562693 ) ) ( not ( = ?auto_562682 ?auto_562694 ) ) ( not ( = ?auto_562682 ?auto_562695 ) ) ( not ( = ?auto_562683 ?auto_562684 ) ) ( not ( = ?auto_562683 ?auto_562685 ) ) ( not ( = ?auto_562683 ?auto_562686 ) ) ( not ( = ?auto_562683 ?auto_562687 ) ) ( not ( = ?auto_562683 ?auto_562688 ) ) ( not ( = ?auto_562683 ?auto_562689 ) ) ( not ( = ?auto_562683 ?auto_562690 ) ) ( not ( = ?auto_562683 ?auto_562691 ) ) ( not ( = ?auto_562683 ?auto_562692 ) ) ( not ( = ?auto_562683 ?auto_562693 ) ) ( not ( = ?auto_562683 ?auto_562694 ) ) ( not ( = ?auto_562683 ?auto_562695 ) ) ( not ( = ?auto_562684 ?auto_562685 ) ) ( not ( = ?auto_562684 ?auto_562686 ) ) ( not ( = ?auto_562684 ?auto_562687 ) ) ( not ( = ?auto_562684 ?auto_562688 ) ) ( not ( = ?auto_562684 ?auto_562689 ) ) ( not ( = ?auto_562684 ?auto_562690 ) ) ( not ( = ?auto_562684 ?auto_562691 ) ) ( not ( = ?auto_562684 ?auto_562692 ) ) ( not ( = ?auto_562684 ?auto_562693 ) ) ( not ( = ?auto_562684 ?auto_562694 ) ) ( not ( = ?auto_562684 ?auto_562695 ) ) ( not ( = ?auto_562685 ?auto_562686 ) ) ( not ( = ?auto_562685 ?auto_562687 ) ) ( not ( = ?auto_562685 ?auto_562688 ) ) ( not ( = ?auto_562685 ?auto_562689 ) ) ( not ( = ?auto_562685 ?auto_562690 ) ) ( not ( = ?auto_562685 ?auto_562691 ) ) ( not ( = ?auto_562685 ?auto_562692 ) ) ( not ( = ?auto_562685 ?auto_562693 ) ) ( not ( = ?auto_562685 ?auto_562694 ) ) ( not ( = ?auto_562685 ?auto_562695 ) ) ( not ( = ?auto_562686 ?auto_562687 ) ) ( not ( = ?auto_562686 ?auto_562688 ) ) ( not ( = ?auto_562686 ?auto_562689 ) ) ( not ( = ?auto_562686 ?auto_562690 ) ) ( not ( = ?auto_562686 ?auto_562691 ) ) ( not ( = ?auto_562686 ?auto_562692 ) ) ( not ( = ?auto_562686 ?auto_562693 ) ) ( not ( = ?auto_562686 ?auto_562694 ) ) ( not ( = ?auto_562686 ?auto_562695 ) ) ( not ( = ?auto_562687 ?auto_562688 ) ) ( not ( = ?auto_562687 ?auto_562689 ) ) ( not ( = ?auto_562687 ?auto_562690 ) ) ( not ( = ?auto_562687 ?auto_562691 ) ) ( not ( = ?auto_562687 ?auto_562692 ) ) ( not ( = ?auto_562687 ?auto_562693 ) ) ( not ( = ?auto_562687 ?auto_562694 ) ) ( not ( = ?auto_562687 ?auto_562695 ) ) ( not ( = ?auto_562688 ?auto_562689 ) ) ( not ( = ?auto_562688 ?auto_562690 ) ) ( not ( = ?auto_562688 ?auto_562691 ) ) ( not ( = ?auto_562688 ?auto_562692 ) ) ( not ( = ?auto_562688 ?auto_562693 ) ) ( not ( = ?auto_562688 ?auto_562694 ) ) ( not ( = ?auto_562688 ?auto_562695 ) ) ( not ( = ?auto_562689 ?auto_562690 ) ) ( not ( = ?auto_562689 ?auto_562691 ) ) ( not ( = ?auto_562689 ?auto_562692 ) ) ( not ( = ?auto_562689 ?auto_562693 ) ) ( not ( = ?auto_562689 ?auto_562694 ) ) ( not ( = ?auto_562689 ?auto_562695 ) ) ( not ( = ?auto_562690 ?auto_562691 ) ) ( not ( = ?auto_562690 ?auto_562692 ) ) ( not ( = ?auto_562690 ?auto_562693 ) ) ( not ( = ?auto_562690 ?auto_562694 ) ) ( not ( = ?auto_562690 ?auto_562695 ) ) ( not ( = ?auto_562691 ?auto_562692 ) ) ( not ( = ?auto_562691 ?auto_562693 ) ) ( not ( = ?auto_562691 ?auto_562694 ) ) ( not ( = ?auto_562691 ?auto_562695 ) ) ( not ( = ?auto_562692 ?auto_562693 ) ) ( not ( = ?auto_562692 ?auto_562694 ) ) ( not ( = ?auto_562692 ?auto_562695 ) ) ( not ( = ?auto_562693 ?auto_562694 ) ) ( not ( = ?auto_562693 ?auto_562695 ) ) ( not ( = ?auto_562694 ?auto_562695 ) ) ( ON ?auto_562693 ?auto_562694 ) ( ON ?auto_562692 ?auto_562693 ) ( CLEAR ?auto_562690 ) ( ON ?auto_562691 ?auto_562692 ) ( CLEAR ?auto_562691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_562681 ?auto_562682 ?auto_562683 ?auto_562684 ?auto_562685 ?auto_562686 ?auto_562687 ?auto_562688 ?auto_562689 ?auto_562690 ?auto_562691 )
      ( MAKE-14PILE ?auto_562681 ?auto_562682 ?auto_562683 ?auto_562684 ?auto_562685 ?auto_562686 ?auto_562687 ?auto_562688 ?auto_562689 ?auto_562690 ?auto_562691 ?auto_562692 ?auto_562693 ?auto_562694 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562739 - BLOCK
      ?auto_562740 - BLOCK
      ?auto_562741 - BLOCK
      ?auto_562742 - BLOCK
      ?auto_562743 - BLOCK
      ?auto_562744 - BLOCK
      ?auto_562745 - BLOCK
      ?auto_562746 - BLOCK
      ?auto_562747 - BLOCK
      ?auto_562748 - BLOCK
      ?auto_562749 - BLOCK
      ?auto_562750 - BLOCK
      ?auto_562751 - BLOCK
      ?auto_562752 - BLOCK
    )
    :vars
    (
      ?auto_562753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562752 ?auto_562753 ) ( ON-TABLE ?auto_562739 ) ( ON ?auto_562740 ?auto_562739 ) ( ON ?auto_562741 ?auto_562740 ) ( ON ?auto_562742 ?auto_562741 ) ( ON ?auto_562743 ?auto_562742 ) ( ON ?auto_562744 ?auto_562743 ) ( ON ?auto_562745 ?auto_562744 ) ( ON ?auto_562746 ?auto_562745 ) ( ON ?auto_562747 ?auto_562746 ) ( not ( = ?auto_562739 ?auto_562740 ) ) ( not ( = ?auto_562739 ?auto_562741 ) ) ( not ( = ?auto_562739 ?auto_562742 ) ) ( not ( = ?auto_562739 ?auto_562743 ) ) ( not ( = ?auto_562739 ?auto_562744 ) ) ( not ( = ?auto_562739 ?auto_562745 ) ) ( not ( = ?auto_562739 ?auto_562746 ) ) ( not ( = ?auto_562739 ?auto_562747 ) ) ( not ( = ?auto_562739 ?auto_562748 ) ) ( not ( = ?auto_562739 ?auto_562749 ) ) ( not ( = ?auto_562739 ?auto_562750 ) ) ( not ( = ?auto_562739 ?auto_562751 ) ) ( not ( = ?auto_562739 ?auto_562752 ) ) ( not ( = ?auto_562739 ?auto_562753 ) ) ( not ( = ?auto_562740 ?auto_562741 ) ) ( not ( = ?auto_562740 ?auto_562742 ) ) ( not ( = ?auto_562740 ?auto_562743 ) ) ( not ( = ?auto_562740 ?auto_562744 ) ) ( not ( = ?auto_562740 ?auto_562745 ) ) ( not ( = ?auto_562740 ?auto_562746 ) ) ( not ( = ?auto_562740 ?auto_562747 ) ) ( not ( = ?auto_562740 ?auto_562748 ) ) ( not ( = ?auto_562740 ?auto_562749 ) ) ( not ( = ?auto_562740 ?auto_562750 ) ) ( not ( = ?auto_562740 ?auto_562751 ) ) ( not ( = ?auto_562740 ?auto_562752 ) ) ( not ( = ?auto_562740 ?auto_562753 ) ) ( not ( = ?auto_562741 ?auto_562742 ) ) ( not ( = ?auto_562741 ?auto_562743 ) ) ( not ( = ?auto_562741 ?auto_562744 ) ) ( not ( = ?auto_562741 ?auto_562745 ) ) ( not ( = ?auto_562741 ?auto_562746 ) ) ( not ( = ?auto_562741 ?auto_562747 ) ) ( not ( = ?auto_562741 ?auto_562748 ) ) ( not ( = ?auto_562741 ?auto_562749 ) ) ( not ( = ?auto_562741 ?auto_562750 ) ) ( not ( = ?auto_562741 ?auto_562751 ) ) ( not ( = ?auto_562741 ?auto_562752 ) ) ( not ( = ?auto_562741 ?auto_562753 ) ) ( not ( = ?auto_562742 ?auto_562743 ) ) ( not ( = ?auto_562742 ?auto_562744 ) ) ( not ( = ?auto_562742 ?auto_562745 ) ) ( not ( = ?auto_562742 ?auto_562746 ) ) ( not ( = ?auto_562742 ?auto_562747 ) ) ( not ( = ?auto_562742 ?auto_562748 ) ) ( not ( = ?auto_562742 ?auto_562749 ) ) ( not ( = ?auto_562742 ?auto_562750 ) ) ( not ( = ?auto_562742 ?auto_562751 ) ) ( not ( = ?auto_562742 ?auto_562752 ) ) ( not ( = ?auto_562742 ?auto_562753 ) ) ( not ( = ?auto_562743 ?auto_562744 ) ) ( not ( = ?auto_562743 ?auto_562745 ) ) ( not ( = ?auto_562743 ?auto_562746 ) ) ( not ( = ?auto_562743 ?auto_562747 ) ) ( not ( = ?auto_562743 ?auto_562748 ) ) ( not ( = ?auto_562743 ?auto_562749 ) ) ( not ( = ?auto_562743 ?auto_562750 ) ) ( not ( = ?auto_562743 ?auto_562751 ) ) ( not ( = ?auto_562743 ?auto_562752 ) ) ( not ( = ?auto_562743 ?auto_562753 ) ) ( not ( = ?auto_562744 ?auto_562745 ) ) ( not ( = ?auto_562744 ?auto_562746 ) ) ( not ( = ?auto_562744 ?auto_562747 ) ) ( not ( = ?auto_562744 ?auto_562748 ) ) ( not ( = ?auto_562744 ?auto_562749 ) ) ( not ( = ?auto_562744 ?auto_562750 ) ) ( not ( = ?auto_562744 ?auto_562751 ) ) ( not ( = ?auto_562744 ?auto_562752 ) ) ( not ( = ?auto_562744 ?auto_562753 ) ) ( not ( = ?auto_562745 ?auto_562746 ) ) ( not ( = ?auto_562745 ?auto_562747 ) ) ( not ( = ?auto_562745 ?auto_562748 ) ) ( not ( = ?auto_562745 ?auto_562749 ) ) ( not ( = ?auto_562745 ?auto_562750 ) ) ( not ( = ?auto_562745 ?auto_562751 ) ) ( not ( = ?auto_562745 ?auto_562752 ) ) ( not ( = ?auto_562745 ?auto_562753 ) ) ( not ( = ?auto_562746 ?auto_562747 ) ) ( not ( = ?auto_562746 ?auto_562748 ) ) ( not ( = ?auto_562746 ?auto_562749 ) ) ( not ( = ?auto_562746 ?auto_562750 ) ) ( not ( = ?auto_562746 ?auto_562751 ) ) ( not ( = ?auto_562746 ?auto_562752 ) ) ( not ( = ?auto_562746 ?auto_562753 ) ) ( not ( = ?auto_562747 ?auto_562748 ) ) ( not ( = ?auto_562747 ?auto_562749 ) ) ( not ( = ?auto_562747 ?auto_562750 ) ) ( not ( = ?auto_562747 ?auto_562751 ) ) ( not ( = ?auto_562747 ?auto_562752 ) ) ( not ( = ?auto_562747 ?auto_562753 ) ) ( not ( = ?auto_562748 ?auto_562749 ) ) ( not ( = ?auto_562748 ?auto_562750 ) ) ( not ( = ?auto_562748 ?auto_562751 ) ) ( not ( = ?auto_562748 ?auto_562752 ) ) ( not ( = ?auto_562748 ?auto_562753 ) ) ( not ( = ?auto_562749 ?auto_562750 ) ) ( not ( = ?auto_562749 ?auto_562751 ) ) ( not ( = ?auto_562749 ?auto_562752 ) ) ( not ( = ?auto_562749 ?auto_562753 ) ) ( not ( = ?auto_562750 ?auto_562751 ) ) ( not ( = ?auto_562750 ?auto_562752 ) ) ( not ( = ?auto_562750 ?auto_562753 ) ) ( not ( = ?auto_562751 ?auto_562752 ) ) ( not ( = ?auto_562751 ?auto_562753 ) ) ( not ( = ?auto_562752 ?auto_562753 ) ) ( ON ?auto_562751 ?auto_562752 ) ( ON ?auto_562750 ?auto_562751 ) ( ON ?auto_562749 ?auto_562750 ) ( CLEAR ?auto_562747 ) ( ON ?auto_562748 ?auto_562749 ) ( CLEAR ?auto_562748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_562739 ?auto_562740 ?auto_562741 ?auto_562742 ?auto_562743 ?auto_562744 ?auto_562745 ?auto_562746 ?auto_562747 ?auto_562748 )
      ( MAKE-14PILE ?auto_562739 ?auto_562740 ?auto_562741 ?auto_562742 ?auto_562743 ?auto_562744 ?auto_562745 ?auto_562746 ?auto_562747 ?auto_562748 ?auto_562749 ?auto_562750 ?auto_562751 ?auto_562752 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562797 - BLOCK
      ?auto_562798 - BLOCK
      ?auto_562799 - BLOCK
      ?auto_562800 - BLOCK
      ?auto_562801 - BLOCK
      ?auto_562802 - BLOCK
      ?auto_562803 - BLOCK
      ?auto_562804 - BLOCK
      ?auto_562805 - BLOCK
      ?auto_562806 - BLOCK
      ?auto_562807 - BLOCK
      ?auto_562808 - BLOCK
      ?auto_562809 - BLOCK
      ?auto_562810 - BLOCK
    )
    :vars
    (
      ?auto_562811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562810 ?auto_562811 ) ( ON-TABLE ?auto_562797 ) ( ON ?auto_562798 ?auto_562797 ) ( ON ?auto_562799 ?auto_562798 ) ( ON ?auto_562800 ?auto_562799 ) ( ON ?auto_562801 ?auto_562800 ) ( ON ?auto_562802 ?auto_562801 ) ( ON ?auto_562803 ?auto_562802 ) ( ON ?auto_562804 ?auto_562803 ) ( not ( = ?auto_562797 ?auto_562798 ) ) ( not ( = ?auto_562797 ?auto_562799 ) ) ( not ( = ?auto_562797 ?auto_562800 ) ) ( not ( = ?auto_562797 ?auto_562801 ) ) ( not ( = ?auto_562797 ?auto_562802 ) ) ( not ( = ?auto_562797 ?auto_562803 ) ) ( not ( = ?auto_562797 ?auto_562804 ) ) ( not ( = ?auto_562797 ?auto_562805 ) ) ( not ( = ?auto_562797 ?auto_562806 ) ) ( not ( = ?auto_562797 ?auto_562807 ) ) ( not ( = ?auto_562797 ?auto_562808 ) ) ( not ( = ?auto_562797 ?auto_562809 ) ) ( not ( = ?auto_562797 ?auto_562810 ) ) ( not ( = ?auto_562797 ?auto_562811 ) ) ( not ( = ?auto_562798 ?auto_562799 ) ) ( not ( = ?auto_562798 ?auto_562800 ) ) ( not ( = ?auto_562798 ?auto_562801 ) ) ( not ( = ?auto_562798 ?auto_562802 ) ) ( not ( = ?auto_562798 ?auto_562803 ) ) ( not ( = ?auto_562798 ?auto_562804 ) ) ( not ( = ?auto_562798 ?auto_562805 ) ) ( not ( = ?auto_562798 ?auto_562806 ) ) ( not ( = ?auto_562798 ?auto_562807 ) ) ( not ( = ?auto_562798 ?auto_562808 ) ) ( not ( = ?auto_562798 ?auto_562809 ) ) ( not ( = ?auto_562798 ?auto_562810 ) ) ( not ( = ?auto_562798 ?auto_562811 ) ) ( not ( = ?auto_562799 ?auto_562800 ) ) ( not ( = ?auto_562799 ?auto_562801 ) ) ( not ( = ?auto_562799 ?auto_562802 ) ) ( not ( = ?auto_562799 ?auto_562803 ) ) ( not ( = ?auto_562799 ?auto_562804 ) ) ( not ( = ?auto_562799 ?auto_562805 ) ) ( not ( = ?auto_562799 ?auto_562806 ) ) ( not ( = ?auto_562799 ?auto_562807 ) ) ( not ( = ?auto_562799 ?auto_562808 ) ) ( not ( = ?auto_562799 ?auto_562809 ) ) ( not ( = ?auto_562799 ?auto_562810 ) ) ( not ( = ?auto_562799 ?auto_562811 ) ) ( not ( = ?auto_562800 ?auto_562801 ) ) ( not ( = ?auto_562800 ?auto_562802 ) ) ( not ( = ?auto_562800 ?auto_562803 ) ) ( not ( = ?auto_562800 ?auto_562804 ) ) ( not ( = ?auto_562800 ?auto_562805 ) ) ( not ( = ?auto_562800 ?auto_562806 ) ) ( not ( = ?auto_562800 ?auto_562807 ) ) ( not ( = ?auto_562800 ?auto_562808 ) ) ( not ( = ?auto_562800 ?auto_562809 ) ) ( not ( = ?auto_562800 ?auto_562810 ) ) ( not ( = ?auto_562800 ?auto_562811 ) ) ( not ( = ?auto_562801 ?auto_562802 ) ) ( not ( = ?auto_562801 ?auto_562803 ) ) ( not ( = ?auto_562801 ?auto_562804 ) ) ( not ( = ?auto_562801 ?auto_562805 ) ) ( not ( = ?auto_562801 ?auto_562806 ) ) ( not ( = ?auto_562801 ?auto_562807 ) ) ( not ( = ?auto_562801 ?auto_562808 ) ) ( not ( = ?auto_562801 ?auto_562809 ) ) ( not ( = ?auto_562801 ?auto_562810 ) ) ( not ( = ?auto_562801 ?auto_562811 ) ) ( not ( = ?auto_562802 ?auto_562803 ) ) ( not ( = ?auto_562802 ?auto_562804 ) ) ( not ( = ?auto_562802 ?auto_562805 ) ) ( not ( = ?auto_562802 ?auto_562806 ) ) ( not ( = ?auto_562802 ?auto_562807 ) ) ( not ( = ?auto_562802 ?auto_562808 ) ) ( not ( = ?auto_562802 ?auto_562809 ) ) ( not ( = ?auto_562802 ?auto_562810 ) ) ( not ( = ?auto_562802 ?auto_562811 ) ) ( not ( = ?auto_562803 ?auto_562804 ) ) ( not ( = ?auto_562803 ?auto_562805 ) ) ( not ( = ?auto_562803 ?auto_562806 ) ) ( not ( = ?auto_562803 ?auto_562807 ) ) ( not ( = ?auto_562803 ?auto_562808 ) ) ( not ( = ?auto_562803 ?auto_562809 ) ) ( not ( = ?auto_562803 ?auto_562810 ) ) ( not ( = ?auto_562803 ?auto_562811 ) ) ( not ( = ?auto_562804 ?auto_562805 ) ) ( not ( = ?auto_562804 ?auto_562806 ) ) ( not ( = ?auto_562804 ?auto_562807 ) ) ( not ( = ?auto_562804 ?auto_562808 ) ) ( not ( = ?auto_562804 ?auto_562809 ) ) ( not ( = ?auto_562804 ?auto_562810 ) ) ( not ( = ?auto_562804 ?auto_562811 ) ) ( not ( = ?auto_562805 ?auto_562806 ) ) ( not ( = ?auto_562805 ?auto_562807 ) ) ( not ( = ?auto_562805 ?auto_562808 ) ) ( not ( = ?auto_562805 ?auto_562809 ) ) ( not ( = ?auto_562805 ?auto_562810 ) ) ( not ( = ?auto_562805 ?auto_562811 ) ) ( not ( = ?auto_562806 ?auto_562807 ) ) ( not ( = ?auto_562806 ?auto_562808 ) ) ( not ( = ?auto_562806 ?auto_562809 ) ) ( not ( = ?auto_562806 ?auto_562810 ) ) ( not ( = ?auto_562806 ?auto_562811 ) ) ( not ( = ?auto_562807 ?auto_562808 ) ) ( not ( = ?auto_562807 ?auto_562809 ) ) ( not ( = ?auto_562807 ?auto_562810 ) ) ( not ( = ?auto_562807 ?auto_562811 ) ) ( not ( = ?auto_562808 ?auto_562809 ) ) ( not ( = ?auto_562808 ?auto_562810 ) ) ( not ( = ?auto_562808 ?auto_562811 ) ) ( not ( = ?auto_562809 ?auto_562810 ) ) ( not ( = ?auto_562809 ?auto_562811 ) ) ( not ( = ?auto_562810 ?auto_562811 ) ) ( ON ?auto_562809 ?auto_562810 ) ( ON ?auto_562808 ?auto_562809 ) ( ON ?auto_562807 ?auto_562808 ) ( ON ?auto_562806 ?auto_562807 ) ( CLEAR ?auto_562804 ) ( ON ?auto_562805 ?auto_562806 ) ( CLEAR ?auto_562805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_562797 ?auto_562798 ?auto_562799 ?auto_562800 ?auto_562801 ?auto_562802 ?auto_562803 ?auto_562804 ?auto_562805 )
      ( MAKE-14PILE ?auto_562797 ?auto_562798 ?auto_562799 ?auto_562800 ?auto_562801 ?auto_562802 ?auto_562803 ?auto_562804 ?auto_562805 ?auto_562806 ?auto_562807 ?auto_562808 ?auto_562809 ?auto_562810 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562855 - BLOCK
      ?auto_562856 - BLOCK
      ?auto_562857 - BLOCK
      ?auto_562858 - BLOCK
      ?auto_562859 - BLOCK
      ?auto_562860 - BLOCK
      ?auto_562861 - BLOCK
      ?auto_562862 - BLOCK
      ?auto_562863 - BLOCK
      ?auto_562864 - BLOCK
      ?auto_562865 - BLOCK
      ?auto_562866 - BLOCK
      ?auto_562867 - BLOCK
      ?auto_562868 - BLOCK
    )
    :vars
    (
      ?auto_562869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562868 ?auto_562869 ) ( ON-TABLE ?auto_562855 ) ( ON ?auto_562856 ?auto_562855 ) ( ON ?auto_562857 ?auto_562856 ) ( ON ?auto_562858 ?auto_562857 ) ( ON ?auto_562859 ?auto_562858 ) ( ON ?auto_562860 ?auto_562859 ) ( ON ?auto_562861 ?auto_562860 ) ( not ( = ?auto_562855 ?auto_562856 ) ) ( not ( = ?auto_562855 ?auto_562857 ) ) ( not ( = ?auto_562855 ?auto_562858 ) ) ( not ( = ?auto_562855 ?auto_562859 ) ) ( not ( = ?auto_562855 ?auto_562860 ) ) ( not ( = ?auto_562855 ?auto_562861 ) ) ( not ( = ?auto_562855 ?auto_562862 ) ) ( not ( = ?auto_562855 ?auto_562863 ) ) ( not ( = ?auto_562855 ?auto_562864 ) ) ( not ( = ?auto_562855 ?auto_562865 ) ) ( not ( = ?auto_562855 ?auto_562866 ) ) ( not ( = ?auto_562855 ?auto_562867 ) ) ( not ( = ?auto_562855 ?auto_562868 ) ) ( not ( = ?auto_562855 ?auto_562869 ) ) ( not ( = ?auto_562856 ?auto_562857 ) ) ( not ( = ?auto_562856 ?auto_562858 ) ) ( not ( = ?auto_562856 ?auto_562859 ) ) ( not ( = ?auto_562856 ?auto_562860 ) ) ( not ( = ?auto_562856 ?auto_562861 ) ) ( not ( = ?auto_562856 ?auto_562862 ) ) ( not ( = ?auto_562856 ?auto_562863 ) ) ( not ( = ?auto_562856 ?auto_562864 ) ) ( not ( = ?auto_562856 ?auto_562865 ) ) ( not ( = ?auto_562856 ?auto_562866 ) ) ( not ( = ?auto_562856 ?auto_562867 ) ) ( not ( = ?auto_562856 ?auto_562868 ) ) ( not ( = ?auto_562856 ?auto_562869 ) ) ( not ( = ?auto_562857 ?auto_562858 ) ) ( not ( = ?auto_562857 ?auto_562859 ) ) ( not ( = ?auto_562857 ?auto_562860 ) ) ( not ( = ?auto_562857 ?auto_562861 ) ) ( not ( = ?auto_562857 ?auto_562862 ) ) ( not ( = ?auto_562857 ?auto_562863 ) ) ( not ( = ?auto_562857 ?auto_562864 ) ) ( not ( = ?auto_562857 ?auto_562865 ) ) ( not ( = ?auto_562857 ?auto_562866 ) ) ( not ( = ?auto_562857 ?auto_562867 ) ) ( not ( = ?auto_562857 ?auto_562868 ) ) ( not ( = ?auto_562857 ?auto_562869 ) ) ( not ( = ?auto_562858 ?auto_562859 ) ) ( not ( = ?auto_562858 ?auto_562860 ) ) ( not ( = ?auto_562858 ?auto_562861 ) ) ( not ( = ?auto_562858 ?auto_562862 ) ) ( not ( = ?auto_562858 ?auto_562863 ) ) ( not ( = ?auto_562858 ?auto_562864 ) ) ( not ( = ?auto_562858 ?auto_562865 ) ) ( not ( = ?auto_562858 ?auto_562866 ) ) ( not ( = ?auto_562858 ?auto_562867 ) ) ( not ( = ?auto_562858 ?auto_562868 ) ) ( not ( = ?auto_562858 ?auto_562869 ) ) ( not ( = ?auto_562859 ?auto_562860 ) ) ( not ( = ?auto_562859 ?auto_562861 ) ) ( not ( = ?auto_562859 ?auto_562862 ) ) ( not ( = ?auto_562859 ?auto_562863 ) ) ( not ( = ?auto_562859 ?auto_562864 ) ) ( not ( = ?auto_562859 ?auto_562865 ) ) ( not ( = ?auto_562859 ?auto_562866 ) ) ( not ( = ?auto_562859 ?auto_562867 ) ) ( not ( = ?auto_562859 ?auto_562868 ) ) ( not ( = ?auto_562859 ?auto_562869 ) ) ( not ( = ?auto_562860 ?auto_562861 ) ) ( not ( = ?auto_562860 ?auto_562862 ) ) ( not ( = ?auto_562860 ?auto_562863 ) ) ( not ( = ?auto_562860 ?auto_562864 ) ) ( not ( = ?auto_562860 ?auto_562865 ) ) ( not ( = ?auto_562860 ?auto_562866 ) ) ( not ( = ?auto_562860 ?auto_562867 ) ) ( not ( = ?auto_562860 ?auto_562868 ) ) ( not ( = ?auto_562860 ?auto_562869 ) ) ( not ( = ?auto_562861 ?auto_562862 ) ) ( not ( = ?auto_562861 ?auto_562863 ) ) ( not ( = ?auto_562861 ?auto_562864 ) ) ( not ( = ?auto_562861 ?auto_562865 ) ) ( not ( = ?auto_562861 ?auto_562866 ) ) ( not ( = ?auto_562861 ?auto_562867 ) ) ( not ( = ?auto_562861 ?auto_562868 ) ) ( not ( = ?auto_562861 ?auto_562869 ) ) ( not ( = ?auto_562862 ?auto_562863 ) ) ( not ( = ?auto_562862 ?auto_562864 ) ) ( not ( = ?auto_562862 ?auto_562865 ) ) ( not ( = ?auto_562862 ?auto_562866 ) ) ( not ( = ?auto_562862 ?auto_562867 ) ) ( not ( = ?auto_562862 ?auto_562868 ) ) ( not ( = ?auto_562862 ?auto_562869 ) ) ( not ( = ?auto_562863 ?auto_562864 ) ) ( not ( = ?auto_562863 ?auto_562865 ) ) ( not ( = ?auto_562863 ?auto_562866 ) ) ( not ( = ?auto_562863 ?auto_562867 ) ) ( not ( = ?auto_562863 ?auto_562868 ) ) ( not ( = ?auto_562863 ?auto_562869 ) ) ( not ( = ?auto_562864 ?auto_562865 ) ) ( not ( = ?auto_562864 ?auto_562866 ) ) ( not ( = ?auto_562864 ?auto_562867 ) ) ( not ( = ?auto_562864 ?auto_562868 ) ) ( not ( = ?auto_562864 ?auto_562869 ) ) ( not ( = ?auto_562865 ?auto_562866 ) ) ( not ( = ?auto_562865 ?auto_562867 ) ) ( not ( = ?auto_562865 ?auto_562868 ) ) ( not ( = ?auto_562865 ?auto_562869 ) ) ( not ( = ?auto_562866 ?auto_562867 ) ) ( not ( = ?auto_562866 ?auto_562868 ) ) ( not ( = ?auto_562866 ?auto_562869 ) ) ( not ( = ?auto_562867 ?auto_562868 ) ) ( not ( = ?auto_562867 ?auto_562869 ) ) ( not ( = ?auto_562868 ?auto_562869 ) ) ( ON ?auto_562867 ?auto_562868 ) ( ON ?auto_562866 ?auto_562867 ) ( ON ?auto_562865 ?auto_562866 ) ( ON ?auto_562864 ?auto_562865 ) ( ON ?auto_562863 ?auto_562864 ) ( CLEAR ?auto_562861 ) ( ON ?auto_562862 ?auto_562863 ) ( CLEAR ?auto_562862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_562855 ?auto_562856 ?auto_562857 ?auto_562858 ?auto_562859 ?auto_562860 ?auto_562861 ?auto_562862 )
      ( MAKE-14PILE ?auto_562855 ?auto_562856 ?auto_562857 ?auto_562858 ?auto_562859 ?auto_562860 ?auto_562861 ?auto_562862 ?auto_562863 ?auto_562864 ?auto_562865 ?auto_562866 ?auto_562867 ?auto_562868 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562913 - BLOCK
      ?auto_562914 - BLOCK
      ?auto_562915 - BLOCK
      ?auto_562916 - BLOCK
      ?auto_562917 - BLOCK
      ?auto_562918 - BLOCK
      ?auto_562919 - BLOCK
      ?auto_562920 - BLOCK
      ?auto_562921 - BLOCK
      ?auto_562922 - BLOCK
      ?auto_562923 - BLOCK
      ?auto_562924 - BLOCK
      ?auto_562925 - BLOCK
      ?auto_562926 - BLOCK
    )
    :vars
    (
      ?auto_562927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562926 ?auto_562927 ) ( ON-TABLE ?auto_562913 ) ( ON ?auto_562914 ?auto_562913 ) ( ON ?auto_562915 ?auto_562914 ) ( ON ?auto_562916 ?auto_562915 ) ( ON ?auto_562917 ?auto_562916 ) ( ON ?auto_562918 ?auto_562917 ) ( not ( = ?auto_562913 ?auto_562914 ) ) ( not ( = ?auto_562913 ?auto_562915 ) ) ( not ( = ?auto_562913 ?auto_562916 ) ) ( not ( = ?auto_562913 ?auto_562917 ) ) ( not ( = ?auto_562913 ?auto_562918 ) ) ( not ( = ?auto_562913 ?auto_562919 ) ) ( not ( = ?auto_562913 ?auto_562920 ) ) ( not ( = ?auto_562913 ?auto_562921 ) ) ( not ( = ?auto_562913 ?auto_562922 ) ) ( not ( = ?auto_562913 ?auto_562923 ) ) ( not ( = ?auto_562913 ?auto_562924 ) ) ( not ( = ?auto_562913 ?auto_562925 ) ) ( not ( = ?auto_562913 ?auto_562926 ) ) ( not ( = ?auto_562913 ?auto_562927 ) ) ( not ( = ?auto_562914 ?auto_562915 ) ) ( not ( = ?auto_562914 ?auto_562916 ) ) ( not ( = ?auto_562914 ?auto_562917 ) ) ( not ( = ?auto_562914 ?auto_562918 ) ) ( not ( = ?auto_562914 ?auto_562919 ) ) ( not ( = ?auto_562914 ?auto_562920 ) ) ( not ( = ?auto_562914 ?auto_562921 ) ) ( not ( = ?auto_562914 ?auto_562922 ) ) ( not ( = ?auto_562914 ?auto_562923 ) ) ( not ( = ?auto_562914 ?auto_562924 ) ) ( not ( = ?auto_562914 ?auto_562925 ) ) ( not ( = ?auto_562914 ?auto_562926 ) ) ( not ( = ?auto_562914 ?auto_562927 ) ) ( not ( = ?auto_562915 ?auto_562916 ) ) ( not ( = ?auto_562915 ?auto_562917 ) ) ( not ( = ?auto_562915 ?auto_562918 ) ) ( not ( = ?auto_562915 ?auto_562919 ) ) ( not ( = ?auto_562915 ?auto_562920 ) ) ( not ( = ?auto_562915 ?auto_562921 ) ) ( not ( = ?auto_562915 ?auto_562922 ) ) ( not ( = ?auto_562915 ?auto_562923 ) ) ( not ( = ?auto_562915 ?auto_562924 ) ) ( not ( = ?auto_562915 ?auto_562925 ) ) ( not ( = ?auto_562915 ?auto_562926 ) ) ( not ( = ?auto_562915 ?auto_562927 ) ) ( not ( = ?auto_562916 ?auto_562917 ) ) ( not ( = ?auto_562916 ?auto_562918 ) ) ( not ( = ?auto_562916 ?auto_562919 ) ) ( not ( = ?auto_562916 ?auto_562920 ) ) ( not ( = ?auto_562916 ?auto_562921 ) ) ( not ( = ?auto_562916 ?auto_562922 ) ) ( not ( = ?auto_562916 ?auto_562923 ) ) ( not ( = ?auto_562916 ?auto_562924 ) ) ( not ( = ?auto_562916 ?auto_562925 ) ) ( not ( = ?auto_562916 ?auto_562926 ) ) ( not ( = ?auto_562916 ?auto_562927 ) ) ( not ( = ?auto_562917 ?auto_562918 ) ) ( not ( = ?auto_562917 ?auto_562919 ) ) ( not ( = ?auto_562917 ?auto_562920 ) ) ( not ( = ?auto_562917 ?auto_562921 ) ) ( not ( = ?auto_562917 ?auto_562922 ) ) ( not ( = ?auto_562917 ?auto_562923 ) ) ( not ( = ?auto_562917 ?auto_562924 ) ) ( not ( = ?auto_562917 ?auto_562925 ) ) ( not ( = ?auto_562917 ?auto_562926 ) ) ( not ( = ?auto_562917 ?auto_562927 ) ) ( not ( = ?auto_562918 ?auto_562919 ) ) ( not ( = ?auto_562918 ?auto_562920 ) ) ( not ( = ?auto_562918 ?auto_562921 ) ) ( not ( = ?auto_562918 ?auto_562922 ) ) ( not ( = ?auto_562918 ?auto_562923 ) ) ( not ( = ?auto_562918 ?auto_562924 ) ) ( not ( = ?auto_562918 ?auto_562925 ) ) ( not ( = ?auto_562918 ?auto_562926 ) ) ( not ( = ?auto_562918 ?auto_562927 ) ) ( not ( = ?auto_562919 ?auto_562920 ) ) ( not ( = ?auto_562919 ?auto_562921 ) ) ( not ( = ?auto_562919 ?auto_562922 ) ) ( not ( = ?auto_562919 ?auto_562923 ) ) ( not ( = ?auto_562919 ?auto_562924 ) ) ( not ( = ?auto_562919 ?auto_562925 ) ) ( not ( = ?auto_562919 ?auto_562926 ) ) ( not ( = ?auto_562919 ?auto_562927 ) ) ( not ( = ?auto_562920 ?auto_562921 ) ) ( not ( = ?auto_562920 ?auto_562922 ) ) ( not ( = ?auto_562920 ?auto_562923 ) ) ( not ( = ?auto_562920 ?auto_562924 ) ) ( not ( = ?auto_562920 ?auto_562925 ) ) ( not ( = ?auto_562920 ?auto_562926 ) ) ( not ( = ?auto_562920 ?auto_562927 ) ) ( not ( = ?auto_562921 ?auto_562922 ) ) ( not ( = ?auto_562921 ?auto_562923 ) ) ( not ( = ?auto_562921 ?auto_562924 ) ) ( not ( = ?auto_562921 ?auto_562925 ) ) ( not ( = ?auto_562921 ?auto_562926 ) ) ( not ( = ?auto_562921 ?auto_562927 ) ) ( not ( = ?auto_562922 ?auto_562923 ) ) ( not ( = ?auto_562922 ?auto_562924 ) ) ( not ( = ?auto_562922 ?auto_562925 ) ) ( not ( = ?auto_562922 ?auto_562926 ) ) ( not ( = ?auto_562922 ?auto_562927 ) ) ( not ( = ?auto_562923 ?auto_562924 ) ) ( not ( = ?auto_562923 ?auto_562925 ) ) ( not ( = ?auto_562923 ?auto_562926 ) ) ( not ( = ?auto_562923 ?auto_562927 ) ) ( not ( = ?auto_562924 ?auto_562925 ) ) ( not ( = ?auto_562924 ?auto_562926 ) ) ( not ( = ?auto_562924 ?auto_562927 ) ) ( not ( = ?auto_562925 ?auto_562926 ) ) ( not ( = ?auto_562925 ?auto_562927 ) ) ( not ( = ?auto_562926 ?auto_562927 ) ) ( ON ?auto_562925 ?auto_562926 ) ( ON ?auto_562924 ?auto_562925 ) ( ON ?auto_562923 ?auto_562924 ) ( ON ?auto_562922 ?auto_562923 ) ( ON ?auto_562921 ?auto_562922 ) ( ON ?auto_562920 ?auto_562921 ) ( CLEAR ?auto_562918 ) ( ON ?auto_562919 ?auto_562920 ) ( CLEAR ?auto_562919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_562913 ?auto_562914 ?auto_562915 ?auto_562916 ?auto_562917 ?auto_562918 ?auto_562919 )
      ( MAKE-14PILE ?auto_562913 ?auto_562914 ?auto_562915 ?auto_562916 ?auto_562917 ?auto_562918 ?auto_562919 ?auto_562920 ?auto_562921 ?auto_562922 ?auto_562923 ?auto_562924 ?auto_562925 ?auto_562926 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_562971 - BLOCK
      ?auto_562972 - BLOCK
      ?auto_562973 - BLOCK
      ?auto_562974 - BLOCK
      ?auto_562975 - BLOCK
      ?auto_562976 - BLOCK
      ?auto_562977 - BLOCK
      ?auto_562978 - BLOCK
      ?auto_562979 - BLOCK
      ?auto_562980 - BLOCK
      ?auto_562981 - BLOCK
      ?auto_562982 - BLOCK
      ?auto_562983 - BLOCK
      ?auto_562984 - BLOCK
    )
    :vars
    (
      ?auto_562985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_562984 ?auto_562985 ) ( ON-TABLE ?auto_562971 ) ( ON ?auto_562972 ?auto_562971 ) ( ON ?auto_562973 ?auto_562972 ) ( ON ?auto_562974 ?auto_562973 ) ( ON ?auto_562975 ?auto_562974 ) ( not ( = ?auto_562971 ?auto_562972 ) ) ( not ( = ?auto_562971 ?auto_562973 ) ) ( not ( = ?auto_562971 ?auto_562974 ) ) ( not ( = ?auto_562971 ?auto_562975 ) ) ( not ( = ?auto_562971 ?auto_562976 ) ) ( not ( = ?auto_562971 ?auto_562977 ) ) ( not ( = ?auto_562971 ?auto_562978 ) ) ( not ( = ?auto_562971 ?auto_562979 ) ) ( not ( = ?auto_562971 ?auto_562980 ) ) ( not ( = ?auto_562971 ?auto_562981 ) ) ( not ( = ?auto_562971 ?auto_562982 ) ) ( not ( = ?auto_562971 ?auto_562983 ) ) ( not ( = ?auto_562971 ?auto_562984 ) ) ( not ( = ?auto_562971 ?auto_562985 ) ) ( not ( = ?auto_562972 ?auto_562973 ) ) ( not ( = ?auto_562972 ?auto_562974 ) ) ( not ( = ?auto_562972 ?auto_562975 ) ) ( not ( = ?auto_562972 ?auto_562976 ) ) ( not ( = ?auto_562972 ?auto_562977 ) ) ( not ( = ?auto_562972 ?auto_562978 ) ) ( not ( = ?auto_562972 ?auto_562979 ) ) ( not ( = ?auto_562972 ?auto_562980 ) ) ( not ( = ?auto_562972 ?auto_562981 ) ) ( not ( = ?auto_562972 ?auto_562982 ) ) ( not ( = ?auto_562972 ?auto_562983 ) ) ( not ( = ?auto_562972 ?auto_562984 ) ) ( not ( = ?auto_562972 ?auto_562985 ) ) ( not ( = ?auto_562973 ?auto_562974 ) ) ( not ( = ?auto_562973 ?auto_562975 ) ) ( not ( = ?auto_562973 ?auto_562976 ) ) ( not ( = ?auto_562973 ?auto_562977 ) ) ( not ( = ?auto_562973 ?auto_562978 ) ) ( not ( = ?auto_562973 ?auto_562979 ) ) ( not ( = ?auto_562973 ?auto_562980 ) ) ( not ( = ?auto_562973 ?auto_562981 ) ) ( not ( = ?auto_562973 ?auto_562982 ) ) ( not ( = ?auto_562973 ?auto_562983 ) ) ( not ( = ?auto_562973 ?auto_562984 ) ) ( not ( = ?auto_562973 ?auto_562985 ) ) ( not ( = ?auto_562974 ?auto_562975 ) ) ( not ( = ?auto_562974 ?auto_562976 ) ) ( not ( = ?auto_562974 ?auto_562977 ) ) ( not ( = ?auto_562974 ?auto_562978 ) ) ( not ( = ?auto_562974 ?auto_562979 ) ) ( not ( = ?auto_562974 ?auto_562980 ) ) ( not ( = ?auto_562974 ?auto_562981 ) ) ( not ( = ?auto_562974 ?auto_562982 ) ) ( not ( = ?auto_562974 ?auto_562983 ) ) ( not ( = ?auto_562974 ?auto_562984 ) ) ( not ( = ?auto_562974 ?auto_562985 ) ) ( not ( = ?auto_562975 ?auto_562976 ) ) ( not ( = ?auto_562975 ?auto_562977 ) ) ( not ( = ?auto_562975 ?auto_562978 ) ) ( not ( = ?auto_562975 ?auto_562979 ) ) ( not ( = ?auto_562975 ?auto_562980 ) ) ( not ( = ?auto_562975 ?auto_562981 ) ) ( not ( = ?auto_562975 ?auto_562982 ) ) ( not ( = ?auto_562975 ?auto_562983 ) ) ( not ( = ?auto_562975 ?auto_562984 ) ) ( not ( = ?auto_562975 ?auto_562985 ) ) ( not ( = ?auto_562976 ?auto_562977 ) ) ( not ( = ?auto_562976 ?auto_562978 ) ) ( not ( = ?auto_562976 ?auto_562979 ) ) ( not ( = ?auto_562976 ?auto_562980 ) ) ( not ( = ?auto_562976 ?auto_562981 ) ) ( not ( = ?auto_562976 ?auto_562982 ) ) ( not ( = ?auto_562976 ?auto_562983 ) ) ( not ( = ?auto_562976 ?auto_562984 ) ) ( not ( = ?auto_562976 ?auto_562985 ) ) ( not ( = ?auto_562977 ?auto_562978 ) ) ( not ( = ?auto_562977 ?auto_562979 ) ) ( not ( = ?auto_562977 ?auto_562980 ) ) ( not ( = ?auto_562977 ?auto_562981 ) ) ( not ( = ?auto_562977 ?auto_562982 ) ) ( not ( = ?auto_562977 ?auto_562983 ) ) ( not ( = ?auto_562977 ?auto_562984 ) ) ( not ( = ?auto_562977 ?auto_562985 ) ) ( not ( = ?auto_562978 ?auto_562979 ) ) ( not ( = ?auto_562978 ?auto_562980 ) ) ( not ( = ?auto_562978 ?auto_562981 ) ) ( not ( = ?auto_562978 ?auto_562982 ) ) ( not ( = ?auto_562978 ?auto_562983 ) ) ( not ( = ?auto_562978 ?auto_562984 ) ) ( not ( = ?auto_562978 ?auto_562985 ) ) ( not ( = ?auto_562979 ?auto_562980 ) ) ( not ( = ?auto_562979 ?auto_562981 ) ) ( not ( = ?auto_562979 ?auto_562982 ) ) ( not ( = ?auto_562979 ?auto_562983 ) ) ( not ( = ?auto_562979 ?auto_562984 ) ) ( not ( = ?auto_562979 ?auto_562985 ) ) ( not ( = ?auto_562980 ?auto_562981 ) ) ( not ( = ?auto_562980 ?auto_562982 ) ) ( not ( = ?auto_562980 ?auto_562983 ) ) ( not ( = ?auto_562980 ?auto_562984 ) ) ( not ( = ?auto_562980 ?auto_562985 ) ) ( not ( = ?auto_562981 ?auto_562982 ) ) ( not ( = ?auto_562981 ?auto_562983 ) ) ( not ( = ?auto_562981 ?auto_562984 ) ) ( not ( = ?auto_562981 ?auto_562985 ) ) ( not ( = ?auto_562982 ?auto_562983 ) ) ( not ( = ?auto_562982 ?auto_562984 ) ) ( not ( = ?auto_562982 ?auto_562985 ) ) ( not ( = ?auto_562983 ?auto_562984 ) ) ( not ( = ?auto_562983 ?auto_562985 ) ) ( not ( = ?auto_562984 ?auto_562985 ) ) ( ON ?auto_562983 ?auto_562984 ) ( ON ?auto_562982 ?auto_562983 ) ( ON ?auto_562981 ?auto_562982 ) ( ON ?auto_562980 ?auto_562981 ) ( ON ?auto_562979 ?auto_562980 ) ( ON ?auto_562978 ?auto_562979 ) ( ON ?auto_562977 ?auto_562978 ) ( CLEAR ?auto_562975 ) ( ON ?auto_562976 ?auto_562977 ) ( CLEAR ?auto_562976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_562971 ?auto_562972 ?auto_562973 ?auto_562974 ?auto_562975 ?auto_562976 )
      ( MAKE-14PILE ?auto_562971 ?auto_562972 ?auto_562973 ?auto_562974 ?auto_562975 ?auto_562976 ?auto_562977 ?auto_562978 ?auto_562979 ?auto_562980 ?auto_562981 ?auto_562982 ?auto_562983 ?auto_562984 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_563029 - BLOCK
      ?auto_563030 - BLOCK
      ?auto_563031 - BLOCK
      ?auto_563032 - BLOCK
      ?auto_563033 - BLOCK
      ?auto_563034 - BLOCK
      ?auto_563035 - BLOCK
      ?auto_563036 - BLOCK
      ?auto_563037 - BLOCK
      ?auto_563038 - BLOCK
      ?auto_563039 - BLOCK
      ?auto_563040 - BLOCK
      ?auto_563041 - BLOCK
      ?auto_563042 - BLOCK
    )
    :vars
    (
      ?auto_563043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563042 ?auto_563043 ) ( ON-TABLE ?auto_563029 ) ( ON ?auto_563030 ?auto_563029 ) ( ON ?auto_563031 ?auto_563030 ) ( ON ?auto_563032 ?auto_563031 ) ( not ( = ?auto_563029 ?auto_563030 ) ) ( not ( = ?auto_563029 ?auto_563031 ) ) ( not ( = ?auto_563029 ?auto_563032 ) ) ( not ( = ?auto_563029 ?auto_563033 ) ) ( not ( = ?auto_563029 ?auto_563034 ) ) ( not ( = ?auto_563029 ?auto_563035 ) ) ( not ( = ?auto_563029 ?auto_563036 ) ) ( not ( = ?auto_563029 ?auto_563037 ) ) ( not ( = ?auto_563029 ?auto_563038 ) ) ( not ( = ?auto_563029 ?auto_563039 ) ) ( not ( = ?auto_563029 ?auto_563040 ) ) ( not ( = ?auto_563029 ?auto_563041 ) ) ( not ( = ?auto_563029 ?auto_563042 ) ) ( not ( = ?auto_563029 ?auto_563043 ) ) ( not ( = ?auto_563030 ?auto_563031 ) ) ( not ( = ?auto_563030 ?auto_563032 ) ) ( not ( = ?auto_563030 ?auto_563033 ) ) ( not ( = ?auto_563030 ?auto_563034 ) ) ( not ( = ?auto_563030 ?auto_563035 ) ) ( not ( = ?auto_563030 ?auto_563036 ) ) ( not ( = ?auto_563030 ?auto_563037 ) ) ( not ( = ?auto_563030 ?auto_563038 ) ) ( not ( = ?auto_563030 ?auto_563039 ) ) ( not ( = ?auto_563030 ?auto_563040 ) ) ( not ( = ?auto_563030 ?auto_563041 ) ) ( not ( = ?auto_563030 ?auto_563042 ) ) ( not ( = ?auto_563030 ?auto_563043 ) ) ( not ( = ?auto_563031 ?auto_563032 ) ) ( not ( = ?auto_563031 ?auto_563033 ) ) ( not ( = ?auto_563031 ?auto_563034 ) ) ( not ( = ?auto_563031 ?auto_563035 ) ) ( not ( = ?auto_563031 ?auto_563036 ) ) ( not ( = ?auto_563031 ?auto_563037 ) ) ( not ( = ?auto_563031 ?auto_563038 ) ) ( not ( = ?auto_563031 ?auto_563039 ) ) ( not ( = ?auto_563031 ?auto_563040 ) ) ( not ( = ?auto_563031 ?auto_563041 ) ) ( not ( = ?auto_563031 ?auto_563042 ) ) ( not ( = ?auto_563031 ?auto_563043 ) ) ( not ( = ?auto_563032 ?auto_563033 ) ) ( not ( = ?auto_563032 ?auto_563034 ) ) ( not ( = ?auto_563032 ?auto_563035 ) ) ( not ( = ?auto_563032 ?auto_563036 ) ) ( not ( = ?auto_563032 ?auto_563037 ) ) ( not ( = ?auto_563032 ?auto_563038 ) ) ( not ( = ?auto_563032 ?auto_563039 ) ) ( not ( = ?auto_563032 ?auto_563040 ) ) ( not ( = ?auto_563032 ?auto_563041 ) ) ( not ( = ?auto_563032 ?auto_563042 ) ) ( not ( = ?auto_563032 ?auto_563043 ) ) ( not ( = ?auto_563033 ?auto_563034 ) ) ( not ( = ?auto_563033 ?auto_563035 ) ) ( not ( = ?auto_563033 ?auto_563036 ) ) ( not ( = ?auto_563033 ?auto_563037 ) ) ( not ( = ?auto_563033 ?auto_563038 ) ) ( not ( = ?auto_563033 ?auto_563039 ) ) ( not ( = ?auto_563033 ?auto_563040 ) ) ( not ( = ?auto_563033 ?auto_563041 ) ) ( not ( = ?auto_563033 ?auto_563042 ) ) ( not ( = ?auto_563033 ?auto_563043 ) ) ( not ( = ?auto_563034 ?auto_563035 ) ) ( not ( = ?auto_563034 ?auto_563036 ) ) ( not ( = ?auto_563034 ?auto_563037 ) ) ( not ( = ?auto_563034 ?auto_563038 ) ) ( not ( = ?auto_563034 ?auto_563039 ) ) ( not ( = ?auto_563034 ?auto_563040 ) ) ( not ( = ?auto_563034 ?auto_563041 ) ) ( not ( = ?auto_563034 ?auto_563042 ) ) ( not ( = ?auto_563034 ?auto_563043 ) ) ( not ( = ?auto_563035 ?auto_563036 ) ) ( not ( = ?auto_563035 ?auto_563037 ) ) ( not ( = ?auto_563035 ?auto_563038 ) ) ( not ( = ?auto_563035 ?auto_563039 ) ) ( not ( = ?auto_563035 ?auto_563040 ) ) ( not ( = ?auto_563035 ?auto_563041 ) ) ( not ( = ?auto_563035 ?auto_563042 ) ) ( not ( = ?auto_563035 ?auto_563043 ) ) ( not ( = ?auto_563036 ?auto_563037 ) ) ( not ( = ?auto_563036 ?auto_563038 ) ) ( not ( = ?auto_563036 ?auto_563039 ) ) ( not ( = ?auto_563036 ?auto_563040 ) ) ( not ( = ?auto_563036 ?auto_563041 ) ) ( not ( = ?auto_563036 ?auto_563042 ) ) ( not ( = ?auto_563036 ?auto_563043 ) ) ( not ( = ?auto_563037 ?auto_563038 ) ) ( not ( = ?auto_563037 ?auto_563039 ) ) ( not ( = ?auto_563037 ?auto_563040 ) ) ( not ( = ?auto_563037 ?auto_563041 ) ) ( not ( = ?auto_563037 ?auto_563042 ) ) ( not ( = ?auto_563037 ?auto_563043 ) ) ( not ( = ?auto_563038 ?auto_563039 ) ) ( not ( = ?auto_563038 ?auto_563040 ) ) ( not ( = ?auto_563038 ?auto_563041 ) ) ( not ( = ?auto_563038 ?auto_563042 ) ) ( not ( = ?auto_563038 ?auto_563043 ) ) ( not ( = ?auto_563039 ?auto_563040 ) ) ( not ( = ?auto_563039 ?auto_563041 ) ) ( not ( = ?auto_563039 ?auto_563042 ) ) ( not ( = ?auto_563039 ?auto_563043 ) ) ( not ( = ?auto_563040 ?auto_563041 ) ) ( not ( = ?auto_563040 ?auto_563042 ) ) ( not ( = ?auto_563040 ?auto_563043 ) ) ( not ( = ?auto_563041 ?auto_563042 ) ) ( not ( = ?auto_563041 ?auto_563043 ) ) ( not ( = ?auto_563042 ?auto_563043 ) ) ( ON ?auto_563041 ?auto_563042 ) ( ON ?auto_563040 ?auto_563041 ) ( ON ?auto_563039 ?auto_563040 ) ( ON ?auto_563038 ?auto_563039 ) ( ON ?auto_563037 ?auto_563038 ) ( ON ?auto_563036 ?auto_563037 ) ( ON ?auto_563035 ?auto_563036 ) ( ON ?auto_563034 ?auto_563035 ) ( CLEAR ?auto_563032 ) ( ON ?auto_563033 ?auto_563034 ) ( CLEAR ?auto_563033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_563029 ?auto_563030 ?auto_563031 ?auto_563032 ?auto_563033 )
      ( MAKE-14PILE ?auto_563029 ?auto_563030 ?auto_563031 ?auto_563032 ?auto_563033 ?auto_563034 ?auto_563035 ?auto_563036 ?auto_563037 ?auto_563038 ?auto_563039 ?auto_563040 ?auto_563041 ?auto_563042 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_563087 - BLOCK
      ?auto_563088 - BLOCK
      ?auto_563089 - BLOCK
      ?auto_563090 - BLOCK
      ?auto_563091 - BLOCK
      ?auto_563092 - BLOCK
      ?auto_563093 - BLOCK
      ?auto_563094 - BLOCK
      ?auto_563095 - BLOCK
      ?auto_563096 - BLOCK
      ?auto_563097 - BLOCK
      ?auto_563098 - BLOCK
      ?auto_563099 - BLOCK
      ?auto_563100 - BLOCK
    )
    :vars
    (
      ?auto_563101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563100 ?auto_563101 ) ( ON-TABLE ?auto_563087 ) ( ON ?auto_563088 ?auto_563087 ) ( ON ?auto_563089 ?auto_563088 ) ( not ( = ?auto_563087 ?auto_563088 ) ) ( not ( = ?auto_563087 ?auto_563089 ) ) ( not ( = ?auto_563087 ?auto_563090 ) ) ( not ( = ?auto_563087 ?auto_563091 ) ) ( not ( = ?auto_563087 ?auto_563092 ) ) ( not ( = ?auto_563087 ?auto_563093 ) ) ( not ( = ?auto_563087 ?auto_563094 ) ) ( not ( = ?auto_563087 ?auto_563095 ) ) ( not ( = ?auto_563087 ?auto_563096 ) ) ( not ( = ?auto_563087 ?auto_563097 ) ) ( not ( = ?auto_563087 ?auto_563098 ) ) ( not ( = ?auto_563087 ?auto_563099 ) ) ( not ( = ?auto_563087 ?auto_563100 ) ) ( not ( = ?auto_563087 ?auto_563101 ) ) ( not ( = ?auto_563088 ?auto_563089 ) ) ( not ( = ?auto_563088 ?auto_563090 ) ) ( not ( = ?auto_563088 ?auto_563091 ) ) ( not ( = ?auto_563088 ?auto_563092 ) ) ( not ( = ?auto_563088 ?auto_563093 ) ) ( not ( = ?auto_563088 ?auto_563094 ) ) ( not ( = ?auto_563088 ?auto_563095 ) ) ( not ( = ?auto_563088 ?auto_563096 ) ) ( not ( = ?auto_563088 ?auto_563097 ) ) ( not ( = ?auto_563088 ?auto_563098 ) ) ( not ( = ?auto_563088 ?auto_563099 ) ) ( not ( = ?auto_563088 ?auto_563100 ) ) ( not ( = ?auto_563088 ?auto_563101 ) ) ( not ( = ?auto_563089 ?auto_563090 ) ) ( not ( = ?auto_563089 ?auto_563091 ) ) ( not ( = ?auto_563089 ?auto_563092 ) ) ( not ( = ?auto_563089 ?auto_563093 ) ) ( not ( = ?auto_563089 ?auto_563094 ) ) ( not ( = ?auto_563089 ?auto_563095 ) ) ( not ( = ?auto_563089 ?auto_563096 ) ) ( not ( = ?auto_563089 ?auto_563097 ) ) ( not ( = ?auto_563089 ?auto_563098 ) ) ( not ( = ?auto_563089 ?auto_563099 ) ) ( not ( = ?auto_563089 ?auto_563100 ) ) ( not ( = ?auto_563089 ?auto_563101 ) ) ( not ( = ?auto_563090 ?auto_563091 ) ) ( not ( = ?auto_563090 ?auto_563092 ) ) ( not ( = ?auto_563090 ?auto_563093 ) ) ( not ( = ?auto_563090 ?auto_563094 ) ) ( not ( = ?auto_563090 ?auto_563095 ) ) ( not ( = ?auto_563090 ?auto_563096 ) ) ( not ( = ?auto_563090 ?auto_563097 ) ) ( not ( = ?auto_563090 ?auto_563098 ) ) ( not ( = ?auto_563090 ?auto_563099 ) ) ( not ( = ?auto_563090 ?auto_563100 ) ) ( not ( = ?auto_563090 ?auto_563101 ) ) ( not ( = ?auto_563091 ?auto_563092 ) ) ( not ( = ?auto_563091 ?auto_563093 ) ) ( not ( = ?auto_563091 ?auto_563094 ) ) ( not ( = ?auto_563091 ?auto_563095 ) ) ( not ( = ?auto_563091 ?auto_563096 ) ) ( not ( = ?auto_563091 ?auto_563097 ) ) ( not ( = ?auto_563091 ?auto_563098 ) ) ( not ( = ?auto_563091 ?auto_563099 ) ) ( not ( = ?auto_563091 ?auto_563100 ) ) ( not ( = ?auto_563091 ?auto_563101 ) ) ( not ( = ?auto_563092 ?auto_563093 ) ) ( not ( = ?auto_563092 ?auto_563094 ) ) ( not ( = ?auto_563092 ?auto_563095 ) ) ( not ( = ?auto_563092 ?auto_563096 ) ) ( not ( = ?auto_563092 ?auto_563097 ) ) ( not ( = ?auto_563092 ?auto_563098 ) ) ( not ( = ?auto_563092 ?auto_563099 ) ) ( not ( = ?auto_563092 ?auto_563100 ) ) ( not ( = ?auto_563092 ?auto_563101 ) ) ( not ( = ?auto_563093 ?auto_563094 ) ) ( not ( = ?auto_563093 ?auto_563095 ) ) ( not ( = ?auto_563093 ?auto_563096 ) ) ( not ( = ?auto_563093 ?auto_563097 ) ) ( not ( = ?auto_563093 ?auto_563098 ) ) ( not ( = ?auto_563093 ?auto_563099 ) ) ( not ( = ?auto_563093 ?auto_563100 ) ) ( not ( = ?auto_563093 ?auto_563101 ) ) ( not ( = ?auto_563094 ?auto_563095 ) ) ( not ( = ?auto_563094 ?auto_563096 ) ) ( not ( = ?auto_563094 ?auto_563097 ) ) ( not ( = ?auto_563094 ?auto_563098 ) ) ( not ( = ?auto_563094 ?auto_563099 ) ) ( not ( = ?auto_563094 ?auto_563100 ) ) ( not ( = ?auto_563094 ?auto_563101 ) ) ( not ( = ?auto_563095 ?auto_563096 ) ) ( not ( = ?auto_563095 ?auto_563097 ) ) ( not ( = ?auto_563095 ?auto_563098 ) ) ( not ( = ?auto_563095 ?auto_563099 ) ) ( not ( = ?auto_563095 ?auto_563100 ) ) ( not ( = ?auto_563095 ?auto_563101 ) ) ( not ( = ?auto_563096 ?auto_563097 ) ) ( not ( = ?auto_563096 ?auto_563098 ) ) ( not ( = ?auto_563096 ?auto_563099 ) ) ( not ( = ?auto_563096 ?auto_563100 ) ) ( not ( = ?auto_563096 ?auto_563101 ) ) ( not ( = ?auto_563097 ?auto_563098 ) ) ( not ( = ?auto_563097 ?auto_563099 ) ) ( not ( = ?auto_563097 ?auto_563100 ) ) ( not ( = ?auto_563097 ?auto_563101 ) ) ( not ( = ?auto_563098 ?auto_563099 ) ) ( not ( = ?auto_563098 ?auto_563100 ) ) ( not ( = ?auto_563098 ?auto_563101 ) ) ( not ( = ?auto_563099 ?auto_563100 ) ) ( not ( = ?auto_563099 ?auto_563101 ) ) ( not ( = ?auto_563100 ?auto_563101 ) ) ( ON ?auto_563099 ?auto_563100 ) ( ON ?auto_563098 ?auto_563099 ) ( ON ?auto_563097 ?auto_563098 ) ( ON ?auto_563096 ?auto_563097 ) ( ON ?auto_563095 ?auto_563096 ) ( ON ?auto_563094 ?auto_563095 ) ( ON ?auto_563093 ?auto_563094 ) ( ON ?auto_563092 ?auto_563093 ) ( ON ?auto_563091 ?auto_563092 ) ( CLEAR ?auto_563089 ) ( ON ?auto_563090 ?auto_563091 ) ( CLEAR ?auto_563090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_563087 ?auto_563088 ?auto_563089 ?auto_563090 )
      ( MAKE-14PILE ?auto_563087 ?auto_563088 ?auto_563089 ?auto_563090 ?auto_563091 ?auto_563092 ?auto_563093 ?auto_563094 ?auto_563095 ?auto_563096 ?auto_563097 ?auto_563098 ?auto_563099 ?auto_563100 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_563145 - BLOCK
      ?auto_563146 - BLOCK
      ?auto_563147 - BLOCK
      ?auto_563148 - BLOCK
      ?auto_563149 - BLOCK
      ?auto_563150 - BLOCK
      ?auto_563151 - BLOCK
      ?auto_563152 - BLOCK
      ?auto_563153 - BLOCK
      ?auto_563154 - BLOCK
      ?auto_563155 - BLOCK
      ?auto_563156 - BLOCK
      ?auto_563157 - BLOCK
      ?auto_563158 - BLOCK
    )
    :vars
    (
      ?auto_563159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563158 ?auto_563159 ) ( ON-TABLE ?auto_563145 ) ( ON ?auto_563146 ?auto_563145 ) ( not ( = ?auto_563145 ?auto_563146 ) ) ( not ( = ?auto_563145 ?auto_563147 ) ) ( not ( = ?auto_563145 ?auto_563148 ) ) ( not ( = ?auto_563145 ?auto_563149 ) ) ( not ( = ?auto_563145 ?auto_563150 ) ) ( not ( = ?auto_563145 ?auto_563151 ) ) ( not ( = ?auto_563145 ?auto_563152 ) ) ( not ( = ?auto_563145 ?auto_563153 ) ) ( not ( = ?auto_563145 ?auto_563154 ) ) ( not ( = ?auto_563145 ?auto_563155 ) ) ( not ( = ?auto_563145 ?auto_563156 ) ) ( not ( = ?auto_563145 ?auto_563157 ) ) ( not ( = ?auto_563145 ?auto_563158 ) ) ( not ( = ?auto_563145 ?auto_563159 ) ) ( not ( = ?auto_563146 ?auto_563147 ) ) ( not ( = ?auto_563146 ?auto_563148 ) ) ( not ( = ?auto_563146 ?auto_563149 ) ) ( not ( = ?auto_563146 ?auto_563150 ) ) ( not ( = ?auto_563146 ?auto_563151 ) ) ( not ( = ?auto_563146 ?auto_563152 ) ) ( not ( = ?auto_563146 ?auto_563153 ) ) ( not ( = ?auto_563146 ?auto_563154 ) ) ( not ( = ?auto_563146 ?auto_563155 ) ) ( not ( = ?auto_563146 ?auto_563156 ) ) ( not ( = ?auto_563146 ?auto_563157 ) ) ( not ( = ?auto_563146 ?auto_563158 ) ) ( not ( = ?auto_563146 ?auto_563159 ) ) ( not ( = ?auto_563147 ?auto_563148 ) ) ( not ( = ?auto_563147 ?auto_563149 ) ) ( not ( = ?auto_563147 ?auto_563150 ) ) ( not ( = ?auto_563147 ?auto_563151 ) ) ( not ( = ?auto_563147 ?auto_563152 ) ) ( not ( = ?auto_563147 ?auto_563153 ) ) ( not ( = ?auto_563147 ?auto_563154 ) ) ( not ( = ?auto_563147 ?auto_563155 ) ) ( not ( = ?auto_563147 ?auto_563156 ) ) ( not ( = ?auto_563147 ?auto_563157 ) ) ( not ( = ?auto_563147 ?auto_563158 ) ) ( not ( = ?auto_563147 ?auto_563159 ) ) ( not ( = ?auto_563148 ?auto_563149 ) ) ( not ( = ?auto_563148 ?auto_563150 ) ) ( not ( = ?auto_563148 ?auto_563151 ) ) ( not ( = ?auto_563148 ?auto_563152 ) ) ( not ( = ?auto_563148 ?auto_563153 ) ) ( not ( = ?auto_563148 ?auto_563154 ) ) ( not ( = ?auto_563148 ?auto_563155 ) ) ( not ( = ?auto_563148 ?auto_563156 ) ) ( not ( = ?auto_563148 ?auto_563157 ) ) ( not ( = ?auto_563148 ?auto_563158 ) ) ( not ( = ?auto_563148 ?auto_563159 ) ) ( not ( = ?auto_563149 ?auto_563150 ) ) ( not ( = ?auto_563149 ?auto_563151 ) ) ( not ( = ?auto_563149 ?auto_563152 ) ) ( not ( = ?auto_563149 ?auto_563153 ) ) ( not ( = ?auto_563149 ?auto_563154 ) ) ( not ( = ?auto_563149 ?auto_563155 ) ) ( not ( = ?auto_563149 ?auto_563156 ) ) ( not ( = ?auto_563149 ?auto_563157 ) ) ( not ( = ?auto_563149 ?auto_563158 ) ) ( not ( = ?auto_563149 ?auto_563159 ) ) ( not ( = ?auto_563150 ?auto_563151 ) ) ( not ( = ?auto_563150 ?auto_563152 ) ) ( not ( = ?auto_563150 ?auto_563153 ) ) ( not ( = ?auto_563150 ?auto_563154 ) ) ( not ( = ?auto_563150 ?auto_563155 ) ) ( not ( = ?auto_563150 ?auto_563156 ) ) ( not ( = ?auto_563150 ?auto_563157 ) ) ( not ( = ?auto_563150 ?auto_563158 ) ) ( not ( = ?auto_563150 ?auto_563159 ) ) ( not ( = ?auto_563151 ?auto_563152 ) ) ( not ( = ?auto_563151 ?auto_563153 ) ) ( not ( = ?auto_563151 ?auto_563154 ) ) ( not ( = ?auto_563151 ?auto_563155 ) ) ( not ( = ?auto_563151 ?auto_563156 ) ) ( not ( = ?auto_563151 ?auto_563157 ) ) ( not ( = ?auto_563151 ?auto_563158 ) ) ( not ( = ?auto_563151 ?auto_563159 ) ) ( not ( = ?auto_563152 ?auto_563153 ) ) ( not ( = ?auto_563152 ?auto_563154 ) ) ( not ( = ?auto_563152 ?auto_563155 ) ) ( not ( = ?auto_563152 ?auto_563156 ) ) ( not ( = ?auto_563152 ?auto_563157 ) ) ( not ( = ?auto_563152 ?auto_563158 ) ) ( not ( = ?auto_563152 ?auto_563159 ) ) ( not ( = ?auto_563153 ?auto_563154 ) ) ( not ( = ?auto_563153 ?auto_563155 ) ) ( not ( = ?auto_563153 ?auto_563156 ) ) ( not ( = ?auto_563153 ?auto_563157 ) ) ( not ( = ?auto_563153 ?auto_563158 ) ) ( not ( = ?auto_563153 ?auto_563159 ) ) ( not ( = ?auto_563154 ?auto_563155 ) ) ( not ( = ?auto_563154 ?auto_563156 ) ) ( not ( = ?auto_563154 ?auto_563157 ) ) ( not ( = ?auto_563154 ?auto_563158 ) ) ( not ( = ?auto_563154 ?auto_563159 ) ) ( not ( = ?auto_563155 ?auto_563156 ) ) ( not ( = ?auto_563155 ?auto_563157 ) ) ( not ( = ?auto_563155 ?auto_563158 ) ) ( not ( = ?auto_563155 ?auto_563159 ) ) ( not ( = ?auto_563156 ?auto_563157 ) ) ( not ( = ?auto_563156 ?auto_563158 ) ) ( not ( = ?auto_563156 ?auto_563159 ) ) ( not ( = ?auto_563157 ?auto_563158 ) ) ( not ( = ?auto_563157 ?auto_563159 ) ) ( not ( = ?auto_563158 ?auto_563159 ) ) ( ON ?auto_563157 ?auto_563158 ) ( ON ?auto_563156 ?auto_563157 ) ( ON ?auto_563155 ?auto_563156 ) ( ON ?auto_563154 ?auto_563155 ) ( ON ?auto_563153 ?auto_563154 ) ( ON ?auto_563152 ?auto_563153 ) ( ON ?auto_563151 ?auto_563152 ) ( ON ?auto_563150 ?auto_563151 ) ( ON ?auto_563149 ?auto_563150 ) ( ON ?auto_563148 ?auto_563149 ) ( CLEAR ?auto_563146 ) ( ON ?auto_563147 ?auto_563148 ) ( CLEAR ?auto_563147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_563145 ?auto_563146 ?auto_563147 )
      ( MAKE-14PILE ?auto_563145 ?auto_563146 ?auto_563147 ?auto_563148 ?auto_563149 ?auto_563150 ?auto_563151 ?auto_563152 ?auto_563153 ?auto_563154 ?auto_563155 ?auto_563156 ?auto_563157 ?auto_563158 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_563203 - BLOCK
      ?auto_563204 - BLOCK
      ?auto_563205 - BLOCK
      ?auto_563206 - BLOCK
      ?auto_563207 - BLOCK
      ?auto_563208 - BLOCK
      ?auto_563209 - BLOCK
      ?auto_563210 - BLOCK
      ?auto_563211 - BLOCK
      ?auto_563212 - BLOCK
      ?auto_563213 - BLOCK
      ?auto_563214 - BLOCK
      ?auto_563215 - BLOCK
      ?auto_563216 - BLOCK
    )
    :vars
    (
      ?auto_563217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563216 ?auto_563217 ) ( ON-TABLE ?auto_563203 ) ( not ( = ?auto_563203 ?auto_563204 ) ) ( not ( = ?auto_563203 ?auto_563205 ) ) ( not ( = ?auto_563203 ?auto_563206 ) ) ( not ( = ?auto_563203 ?auto_563207 ) ) ( not ( = ?auto_563203 ?auto_563208 ) ) ( not ( = ?auto_563203 ?auto_563209 ) ) ( not ( = ?auto_563203 ?auto_563210 ) ) ( not ( = ?auto_563203 ?auto_563211 ) ) ( not ( = ?auto_563203 ?auto_563212 ) ) ( not ( = ?auto_563203 ?auto_563213 ) ) ( not ( = ?auto_563203 ?auto_563214 ) ) ( not ( = ?auto_563203 ?auto_563215 ) ) ( not ( = ?auto_563203 ?auto_563216 ) ) ( not ( = ?auto_563203 ?auto_563217 ) ) ( not ( = ?auto_563204 ?auto_563205 ) ) ( not ( = ?auto_563204 ?auto_563206 ) ) ( not ( = ?auto_563204 ?auto_563207 ) ) ( not ( = ?auto_563204 ?auto_563208 ) ) ( not ( = ?auto_563204 ?auto_563209 ) ) ( not ( = ?auto_563204 ?auto_563210 ) ) ( not ( = ?auto_563204 ?auto_563211 ) ) ( not ( = ?auto_563204 ?auto_563212 ) ) ( not ( = ?auto_563204 ?auto_563213 ) ) ( not ( = ?auto_563204 ?auto_563214 ) ) ( not ( = ?auto_563204 ?auto_563215 ) ) ( not ( = ?auto_563204 ?auto_563216 ) ) ( not ( = ?auto_563204 ?auto_563217 ) ) ( not ( = ?auto_563205 ?auto_563206 ) ) ( not ( = ?auto_563205 ?auto_563207 ) ) ( not ( = ?auto_563205 ?auto_563208 ) ) ( not ( = ?auto_563205 ?auto_563209 ) ) ( not ( = ?auto_563205 ?auto_563210 ) ) ( not ( = ?auto_563205 ?auto_563211 ) ) ( not ( = ?auto_563205 ?auto_563212 ) ) ( not ( = ?auto_563205 ?auto_563213 ) ) ( not ( = ?auto_563205 ?auto_563214 ) ) ( not ( = ?auto_563205 ?auto_563215 ) ) ( not ( = ?auto_563205 ?auto_563216 ) ) ( not ( = ?auto_563205 ?auto_563217 ) ) ( not ( = ?auto_563206 ?auto_563207 ) ) ( not ( = ?auto_563206 ?auto_563208 ) ) ( not ( = ?auto_563206 ?auto_563209 ) ) ( not ( = ?auto_563206 ?auto_563210 ) ) ( not ( = ?auto_563206 ?auto_563211 ) ) ( not ( = ?auto_563206 ?auto_563212 ) ) ( not ( = ?auto_563206 ?auto_563213 ) ) ( not ( = ?auto_563206 ?auto_563214 ) ) ( not ( = ?auto_563206 ?auto_563215 ) ) ( not ( = ?auto_563206 ?auto_563216 ) ) ( not ( = ?auto_563206 ?auto_563217 ) ) ( not ( = ?auto_563207 ?auto_563208 ) ) ( not ( = ?auto_563207 ?auto_563209 ) ) ( not ( = ?auto_563207 ?auto_563210 ) ) ( not ( = ?auto_563207 ?auto_563211 ) ) ( not ( = ?auto_563207 ?auto_563212 ) ) ( not ( = ?auto_563207 ?auto_563213 ) ) ( not ( = ?auto_563207 ?auto_563214 ) ) ( not ( = ?auto_563207 ?auto_563215 ) ) ( not ( = ?auto_563207 ?auto_563216 ) ) ( not ( = ?auto_563207 ?auto_563217 ) ) ( not ( = ?auto_563208 ?auto_563209 ) ) ( not ( = ?auto_563208 ?auto_563210 ) ) ( not ( = ?auto_563208 ?auto_563211 ) ) ( not ( = ?auto_563208 ?auto_563212 ) ) ( not ( = ?auto_563208 ?auto_563213 ) ) ( not ( = ?auto_563208 ?auto_563214 ) ) ( not ( = ?auto_563208 ?auto_563215 ) ) ( not ( = ?auto_563208 ?auto_563216 ) ) ( not ( = ?auto_563208 ?auto_563217 ) ) ( not ( = ?auto_563209 ?auto_563210 ) ) ( not ( = ?auto_563209 ?auto_563211 ) ) ( not ( = ?auto_563209 ?auto_563212 ) ) ( not ( = ?auto_563209 ?auto_563213 ) ) ( not ( = ?auto_563209 ?auto_563214 ) ) ( not ( = ?auto_563209 ?auto_563215 ) ) ( not ( = ?auto_563209 ?auto_563216 ) ) ( not ( = ?auto_563209 ?auto_563217 ) ) ( not ( = ?auto_563210 ?auto_563211 ) ) ( not ( = ?auto_563210 ?auto_563212 ) ) ( not ( = ?auto_563210 ?auto_563213 ) ) ( not ( = ?auto_563210 ?auto_563214 ) ) ( not ( = ?auto_563210 ?auto_563215 ) ) ( not ( = ?auto_563210 ?auto_563216 ) ) ( not ( = ?auto_563210 ?auto_563217 ) ) ( not ( = ?auto_563211 ?auto_563212 ) ) ( not ( = ?auto_563211 ?auto_563213 ) ) ( not ( = ?auto_563211 ?auto_563214 ) ) ( not ( = ?auto_563211 ?auto_563215 ) ) ( not ( = ?auto_563211 ?auto_563216 ) ) ( not ( = ?auto_563211 ?auto_563217 ) ) ( not ( = ?auto_563212 ?auto_563213 ) ) ( not ( = ?auto_563212 ?auto_563214 ) ) ( not ( = ?auto_563212 ?auto_563215 ) ) ( not ( = ?auto_563212 ?auto_563216 ) ) ( not ( = ?auto_563212 ?auto_563217 ) ) ( not ( = ?auto_563213 ?auto_563214 ) ) ( not ( = ?auto_563213 ?auto_563215 ) ) ( not ( = ?auto_563213 ?auto_563216 ) ) ( not ( = ?auto_563213 ?auto_563217 ) ) ( not ( = ?auto_563214 ?auto_563215 ) ) ( not ( = ?auto_563214 ?auto_563216 ) ) ( not ( = ?auto_563214 ?auto_563217 ) ) ( not ( = ?auto_563215 ?auto_563216 ) ) ( not ( = ?auto_563215 ?auto_563217 ) ) ( not ( = ?auto_563216 ?auto_563217 ) ) ( ON ?auto_563215 ?auto_563216 ) ( ON ?auto_563214 ?auto_563215 ) ( ON ?auto_563213 ?auto_563214 ) ( ON ?auto_563212 ?auto_563213 ) ( ON ?auto_563211 ?auto_563212 ) ( ON ?auto_563210 ?auto_563211 ) ( ON ?auto_563209 ?auto_563210 ) ( ON ?auto_563208 ?auto_563209 ) ( ON ?auto_563207 ?auto_563208 ) ( ON ?auto_563206 ?auto_563207 ) ( ON ?auto_563205 ?auto_563206 ) ( CLEAR ?auto_563203 ) ( ON ?auto_563204 ?auto_563205 ) ( CLEAR ?auto_563204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_563203 ?auto_563204 )
      ( MAKE-14PILE ?auto_563203 ?auto_563204 ?auto_563205 ?auto_563206 ?auto_563207 ?auto_563208 ?auto_563209 ?auto_563210 ?auto_563211 ?auto_563212 ?auto_563213 ?auto_563214 ?auto_563215 ?auto_563216 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_563261 - BLOCK
      ?auto_563262 - BLOCK
      ?auto_563263 - BLOCK
      ?auto_563264 - BLOCK
      ?auto_563265 - BLOCK
      ?auto_563266 - BLOCK
      ?auto_563267 - BLOCK
      ?auto_563268 - BLOCK
      ?auto_563269 - BLOCK
      ?auto_563270 - BLOCK
      ?auto_563271 - BLOCK
      ?auto_563272 - BLOCK
      ?auto_563273 - BLOCK
      ?auto_563274 - BLOCK
    )
    :vars
    (
      ?auto_563275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563274 ?auto_563275 ) ( not ( = ?auto_563261 ?auto_563262 ) ) ( not ( = ?auto_563261 ?auto_563263 ) ) ( not ( = ?auto_563261 ?auto_563264 ) ) ( not ( = ?auto_563261 ?auto_563265 ) ) ( not ( = ?auto_563261 ?auto_563266 ) ) ( not ( = ?auto_563261 ?auto_563267 ) ) ( not ( = ?auto_563261 ?auto_563268 ) ) ( not ( = ?auto_563261 ?auto_563269 ) ) ( not ( = ?auto_563261 ?auto_563270 ) ) ( not ( = ?auto_563261 ?auto_563271 ) ) ( not ( = ?auto_563261 ?auto_563272 ) ) ( not ( = ?auto_563261 ?auto_563273 ) ) ( not ( = ?auto_563261 ?auto_563274 ) ) ( not ( = ?auto_563261 ?auto_563275 ) ) ( not ( = ?auto_563262 ?auto_563263 ) ) ( not ( = ?auto_563262 ?auto_563264 ) ) ( not ( = ?auto_563262 ?auto_563265 ) ) ( not ( = ?auto_563262 ?auto_563266 ) ) ( not ( = ?auto_563262 ?auto_563267 ) ) ( not ( = ?auto_563262 ?auto_563268 ) ) ( not ( = ?auto_563262 ?auto_563269 ) ) ( not ( = ?auto_563262 ?auto_563270 ) ) ( not ( = ?auto_563262 ?auto_563271 ) ) ( not ( = ?auto_563262 ?auto_563272 ) ) ( not ( = ?auto_563262 ?auto_563273 ) ) ( not ( = ?auto_563262 ?auto_563274 ) ) ( not ( = ?auto_563262 ?auto_563275 ) ) ( not ( = ?auto_563263 ?auto_563264 ) ) ( not ( = ?auto_563263 ?auto_563265 ) ) ( not ( = ?auto_563263 ?auto_563266 ) ) ( not ( = ?auto_563263 ?auto_563267 ) ) ( not ( = ?auto_563263 ?auto_563268 ) ) ( not ( = ?auto_563263 ?auto_563269 ) ) ( not ( = ?auto_563263 ?auto_563270 ) ) ( not ( = ?auto_563263 ?auto_563271 ) ) ( not ( = ?auto_563263 ?auto_563272 ) ) ( not ( = ?auto_563263 ?auto_563273 ) ) ( not ( = ?auto_563263 ?auto_563274 ) ) ( not ( = ?auto_563263 ?auto_563275 ) ) ( not ( = ?auto_563264 ?auto_563265 ) ) ( not ( = ?auto_563264 ?auto_563266 ) ) ( not ( = ?auto_563264 ?auto_563267 ) ) ( not ( = ?auto_563264 ?auto_563268 ) ) ( not ( = ?auto_563264 ?auto_563269 ) ) ( not ( = ?auto_563264 ?auto_563270 ) ) ( not ( = ?auto_563264 ?auto_563271 ) ) ( not ( = ?auto_563264 ?auto_563272 ) ) ( not ( = ?auto_563264 ?auto_563273 ) ) ( not ( = ?auto_563264 ?auto_563274 ) ) ( not ( = ?auto_563264 ?auto_563275 ) ) ( not ( = ?auto_563265 ?auto_563266 ) ) ( not ( = ?auto_563265 ?auto_563267 ) ) ( not ( = ?auto_563265 ?auto_563268 ) ) ( not ( = ?auto_563265 ?auto_563269 ) ) ( not ( = ?auto_563265 ?auto_563270 ) ) ( not ( = ?auto_563265 ?auto_563271 ) ) ( not ( = ?auto_563265 ?auto_563272 ) ) ( not ( = ?auto_563265 ?auto_563273 ) ) ( not ( = ?auto_563265 ?auto_563274 ) ) ( not ( = ?auto_563265 ?auto_563275 ) ) ( not ( = ?auto_563266 ?auto_563267 ) ) ( not ( = ?auto_563266 ?auto_563268 ) ) ( not ( = ?auto_563266 ?auto_563269 ) ) ( not ( = ?auto_563266 ?auto_563270 ) ) ( not ( = ?auto_563266 ?auto_563271 ) ) ( not ( = ?auto_563266 ?auto_563272 ) ) ( not ( = ?auto_563266 ?auto_563273 ) ) ( not ( = ?auto_563266 ?auto_563274 ) ) ( not ( = ?auto_563266 ?auto_563275 ) ) ( not ( = ?auto_563267 ?auto_563268 ) ) ( not ( = ?auto_563267 ?auto_563269 ) ) ( not ( = ?auto_563267 ?auto_563270 ) ) ( not ( = ?auto_563267 ?auto_563271 ) ) ( not ( = ?auto_563267 ?auto_563272 ) ) ( not ( = ?auto_563267 ?auto_563273 ) ) ( not ( = ?auto_563267 ?auto_563274 ) ) ( not ( = ?auto_563267 ?auto_563275 ) ) ( not ( = ?auto_563268 ?auto_563269 ) ) ( not ( = ?auto_563268 ?auto_563270 ) ) ( not ( = ?auto_563268 ?auto_563271 ) ) ( not ( = ?auto_563268 ?auto_563272 ) ) ( not ( = ?auto_563268 ?auto_563273 ) ) ( not ( = ?auto_563268 ?auto_563274 ) ) ( not ( = ?auto_563268 ?auto_563275 ) ) ( not ( = ?auto_563269 ?auto_563270 ) ) ( not ( = ?auto_563269 ?auto_563271 ) ) ( not ( = ?auto_563269 ?auto_563272 ) ) ( not ( = ?auto_563269 ?auto_563273 ) ) ( not ( = ?auto_563269 ?auto_563274 ) ) ( not ( = ?auto_563269 ?auto_563275 ) ) ( not ( = ?auto_563270 ?auto_563271 ) ) ( not ( = ?auto_563270 ?auto_563272 ) ) ( not ( = ?auto_563270 ?auto_563273 ) ) ( not ( = ?auto_563270 ?auto_563274 ) ) ( not ( = ?auto_563270 ?auto_563275 ) ) ( not ( = ?auto_563271 ?auto_563272 ) ) ( not ( = ?auto_563271 ?auto_563273 ) ) ( not ( = ?auto_563271 ?auto_563274 ) ) ( not ( = ?auto_563271 ?auto_563275 ) ) ( not ( = ?auto_563272 ?auto_563273 ) ) ( not ( = ?auto_563272 ?auto_563274 ) ) ( not ( = ?auto_563272 ?auto_563275 ) ) ( not ( = ?auto_563273 ?auto_563274 ) ) ( not ( = ?auto_563273 ?auto_563275 ) ) ( not ( = ?auto_563274 ?auto_563275 ) ) ( ON ?auto_563273 ?auto_563274 ) ( ON ?auto_563272 ?auto_563273 ) ( ON ?auto_563271 ?auto_563272 ) ( ON ?auto_563270 ?auto_563271 ) ( ON ?auto_563269 ?auto_563270 ) ( ON ?auto_563268 ?auto_563269 ) ( ON ?auto_563267 ?auto_563268 ) ( ON ?auto_563266 ?auto_563267 ) ( ON ?auto_563265 ?auto_563266 ) ( ON ?auto_563264 ?auto_563265 ) ( ON ?auto_563263 ?auto_563264 ) ( ON ?auto_563262 ?auto_563263 ) ( ON ?auto_563261 ?auto_563262 ) ( CLEAR ?auto_563261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_563261 )
      ( MAKE-14PILE ?auto_563261 ?auto_563262 ?auto_563263 ?auto_563264 ?auto_563265 ?auto_563266 ?auto_563267 ?auto_563268 ?auto_563269 ?auto_563270 ?auto_563271 ?auto_563272 ?auto_563273 ?auto_563274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563320 - BLOCK
      ?auto_563321 - BLOCK
      ?auto_563322 - BLOCK
      ?auto_563323 - BLOCK
      ?auto_563324 - BLOCK
      ?auto_563325 - BLOCK
      ?auto_563326 - BLOCK
      ?auto_563327 - BLOCK
      ?auto_563328 - BLOCK
      ?auto_563329 - BLOCK
      ?auto_563330 - BLOCK
      ?auto_563331 - BLOCK
      ?auto_563332 - BLOCK
      ?auto_563333 - BLOCK
      ?auto_563334 - BLOCK
    )
    :vars
    (
      ?auto_563335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_563333 ) ( ON ?auto_563334 ?auto_563335 ) ( CLEAR ?auto_563334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_563320 ) ( ON ?auto_563321 ?auto_563320 ) ( ON ?auto_563322 ?auto_563321 ) ( ON ?auto_563323 ?auto_563322 ) ( ON ?auto_563324 ?auto_563323 ) ( ON ?auto_563325 ?auto_563324 ) ( ON ?auto_563326 ?auto_563325 ) ( ON ?auto_563327 ?auto_563326 ) ( ON ?auto_563328 ?auto_563327 ) ( ON ?auto_563329 ?auto_563328 ) ( ON ?auto_563330 ?auto_563329 ) ( ON ?auto_563331 ?auto_563330 ) ( ON ?auto_563332 ?auto_563331 ) ( ON ?auto_563333 ?auto_563332 ) ( not ( = ?auto_563320 ?auto_563321 ) ) ( not ( = ?auto_563320 ?auto_563322 ) ) ( not ( = ?auto_563320 ?auto_563323 ) ) ( not ( = ?auto_563320 ?auto_563324 ) ) ( not ( = ?auto_563320 ?auto_563325 ) ) ( not ( = ?auto_563320 ?auto_563326 ) ) ( not ( = ?auto_563320 ?auto_563327 ) ) ( not ( = ?auto_563320 ?auto_563328 ) ) ( not ( = ?auto_563320 ?auto_563329 ) ) ( not ( = ?auto_563320 ?auto_563330 ) ) ( not ( = ?auto_563320 ?auto_563331 ) ) ( not ( = ?auto_563320 ?auto_563332 ) ) ( not ( = ?auto_563320 ?auto_563333 ) ) ( not ( = ?auto_563320 ?auto_563334 ) ) ( not ( = ?auto_563320 ?auto_563335 ) ) ( not ( = ?auto_563321 ?auto_563322 ) ) ( not ( = ?auto_563321 ?auto_563323 ) ) ( not ( = ?auto_563321 ?auto_563324 ) ) ( not ( = ?auto_563321 ?auto_563325 ) ) ( not ( = ?auto_563321 ?auto_563326 ) ) ( not ( = ?auto_563321 ?auto_563327 ) ) ( not ( = ?auto_563321 ?auto_563328 ) ) ( not ( = ?auto_563321 ?auto_563329 ) ) ( not ( = ?auto_563321 ?auto_563330 ) ) ( not ( = ?auto_563321 ?auto_563331 ) ) ( not ( = ?auto_563321 ?auto_563332 ) ) ( not ( = ?auto_563321 ?auto_563333 ) ) ( not ( = ?auto_563321 ?auto_563334 ) ) ( not ( = ?auto_563321 ?auto_563335 ) ) ( not ( = ?auto_563322 ?auto_563323 ) ) ( not ( = ?auto_563322 ?auto_563324 ) ) ( not ( = ?auto_563322 ?auto_563325 ) ) ( not ( = ?auto_563322 ?auto_563326 ) ) ( not ( = ?auto_563322 ?auto_563327 ) ) ( not ( = ?auto_563322 ?auto_563328 ) ) ( not ( = ?auto_563322 ?auto_563329 ) ) ( not ( = ?auto_563322 ?auto_563330 ) ) ( not ( = ?auto_563322 ?auto_563331 ) ) ( not ( = ?auto_563322 ?auto_563332 ) ) ( not ( = ?auto_563322 ?auto_563333 ) ) ( not ( = ?auto_563322 ?auto_563334 ) ) ( not ( = ?auto_563322 ?auto_563335 ) ) ( not ( = ?auto_563323 ?auto_563324 ) ) ( not ( = ?auto_563323 ?auto_563325 ) ) ( not ( = ?auto_563323 ?auto_563326 ) ) ( not ( = ?auto_563323 ?auto_563327 ) ) ( not ( = ?auto_563323 ?auto_563328 ) ) ( not ( = ?auto_563323 ?auto_563329 ) ) ( not ( = ?auto_563323 ?auto_563330 ) ) ( not ( = ?auto_563323 ?auto_563331 ) ) ( not ( = ?auto_563323 ?auto_563332 ) ) ( not ( = ?auto_563323 ?auto_563333 ) ) ( not ( = ?auto_563323 ?auto_563334 ) ) ( not ( = ?auto_563323 ?auto_563335 ) ) ( not ( = ?auto_563324 ?auto_563325 ) ) ( not ( = ?auto_563324 ?auto_563326 ) ) ( not ( = ?auto_563324 ?auto_563327 ) ) ( not ( = ?auto_563324 ?auto_563328 ) ) ( not ( = ?auto_563324 ?auto_563329 ) ) ( not ( = ?auto_563324 ?auto_563330 ) ) ( not ( = ?auto_563324 ?auto_563331 ) ) ( not ( = ?auto_563324 ?auto_563332 ) ) ( not ( = ?auto_563324 ?auto_563333 ) ) ( not ( = ?auto_563324 ?auto_563334 ) ) ( not ( = ?auto_563324 ?auto_563335 ) ) ( not ( = ?auto_563325 ?auto_563326 ) ) ( not ( = ?auto_563325 ?auto_563327 ) ) ( not ( = ?auto_563325 ?auto_563328 ) ) ( not ( = ?auto_563325 ?auto_563329 ) ) ( not ( = ?auto_563325 ?auto_563330 ) ) ( not ( = ?auto_563325 ?auto_563331 ) ) ( not ( = ?auto_563325 ?auto_563332 ) ) ( not ( = ?auto_563325 ?auto_563333 ) ) ( not ( = ?auto_563325 ?auto_563334 ) ) ( not ( = ?auto_563325 ?auto_563335 ) ) ( not ( = ?auto_563326 ?auto_563327 ) ) ( not ( = ?auto_563326 ?auto_563328 ) ) ( not ( = ?auto_563326 ?auto_563329 ) ) ( not ( = ?auto_563326 ?auto_563330 ) ) ( not ( = ?auto_563326 ?auto_563331 ) ) ( not ( = ?auto_563326 ?auto_563332 ) ) ( not ( = ?auto_563326 ?auto_563333 ) ) ( not ( = ?auto_563326 ?auto_563334 ) ) ( not ( = ?auto_563326 ?auto_563335 ) ) ( not ( = ?auto_563327 ?auto_563328 ) ) ( not ( = ?auto_563327 ?auto_563329 ) ) ( not ( = ?auto_563327 ?auto_563330 ) ) ( not ( = ?auto_563327 ?auto_563331 ) ) ( not ( = ?auto_563327 ?auto_563332 ) ) ( not ( = ?auto_563327 ?auto_563333 ) ) ( not ( = ?auto_563327 ?auto_563334 ) ) ( not ( = ?auto_563327 ?auto_563335 ) ) ( not ( = ?auto_563328 ?auto_563329 ) ) ( not ( = ?auto_563328 ?auto_563330 ) ) ( not ( = ?auto_563328 ?auto_563331 ) ) ( not ( = ?auto_563328 ?auto_563332 ) ) ( not ( = ?auto_563328 ?auto_563333 ) ) ( not ( = ?auto_563328 ?auto_563334 ) ) ( not ( = ?auto_563328 ?auto_563335 ) ) ( not ( = ?auto_563329 ?auto_563330 ) ) ( not ( = ?auto_563329 ?auto_563331 ) ) ( not ( = ?auto_563329 ?auto_563332 ) ) ( not ( = ?auto_563329 ?auto_563333 ) ) ( not ( = ?auto_563329 ?auto_563334 ) ) ( not ( = ?auto_563329 ?auto_563335 ) ) ( not ( = ?auto_563330 ?auto_563331 ) ) ( not ( = ?auto_563330 ?auto_563332 ) ) ( not ( = ?auto_563330 ?auto_563333 ) ) ( not ( = ?auto_563330 ?auto_563334 ) ) ( not ( = ?auto_563330 ?auto_563335 ) ) ( not ( = ?auto_563331 ?auto_563332 ) ) ( not ( = ?auto_563331 ?auto_563333 ) ) ( not ( = ?auto_563331 ?auto_563334 ) ) ( not ( = ?auto_563331 ?auto_563335 ) ) ( not ( = ?auto_563332 ?auto_563333 ) ) ( not ( = ?auto_563332 ?auto_563334 ) ) ( not ( = ?auto_563332 ?auto_563335 ) ) ( not ( = ?auto_563333 ?auto_563334 ) ) ( not ( = ?auto_563333 ?auto_563335 ) ) ( not ( = ?auto_563334 ?auto_563335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_563334 ?auto_563335 )
      ( !STACK ?auto_563334 ?auto_563333 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563382 - BLOCK
      ?auto_563383 - BLOCK
      ?auto_563384 - BLOCK
      ?auto_563385 - BLOCK
      ?auto_563386 - BLOCK
      ?auto_563387 - BLOCK
      ?auto_563388 - BLOCK
      ?auto_563389 - BLOCK
      ?auto_563390 - BLOCK
      ?auto_563391 - BLOCK
      ?auto_563392 - BLOCK
      ?auto_563393 - BLOCK
      ?auto_563394 - BLOCK
      ?auto_563395 - BLOCK
      ?auto_563396 - BLOCK
    )
    :vars
    (
      ?auto_563397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563396 ?auto_563397 ) ( ON-TABLE ?auto_563382 ) ( ON ?auto_563383 ?auto_563382 ) ( ON ?auto_563384 ?auto_563383 ) ( ON ?auto_563385 ?auto_563384 ) ( ON ?auto_563386 ?auto_563385 ) ( ON ?auto_563387 ?auto_563386 ) ( ON ?auto_563388 ?auto_563387 ) ( ON ?auto_563389 ?auto_563388 ) ( ON ?auto_563390 ?auto_563389 ) ( ON ?auto_563391 ?auto_563390 ) ( ON ?auto_563392 ?auto_563391 ) ( ON ?auto_563393 ?auto_563392 ) ( ON ?auto_563394 ?auto_563393 ) ( not ( = ?auto_563382 ?auto_563383 ) ) ( not ( = ?auto_563382 ?auto_563384 ) ) ( not ( = ?auto_563382 ?auto_563385 ) ) ( not ( = ?auto_563382 ?auto_563386 ) ) ( not ( = ?auto_563382 ?auto_563387 ) ) ( not ( = ?auto_563382 ?auto_563388 ) ) ( not ( = ?auto_563382 ?auto_563389 ) ) ( not ( = ?auto_563382 ?auto_563390 ) ) ( not ( = ?auto_563382 ?auto_563391 ) ) ( not ( = ?auto_563382 ?auto_563392 ) ) ( not ( = ?auto_563382 ?auto_563393 ) ) ( not ( = ?auto_563382 ?auto_563394 ) ) ( not ( = ?auto_563382 ?auto_563395 ) ) ( not ( = ?auto_563382 ?auto_563396 ) ) ( not ( = ?auto_563382 ?auto_563397 ) ) ( not ( = ?auto_563383 ?auto_563384 ) ) ( not ( = ?auto_563383 ?auto_563385 ) ) ( not ( = ?auto_563383 ?auto_563386 ) ) ( not ( = ?auto_563383 ?auto_563387 ) ) ( not ( = ?auto_563383 ?auto_563388 ) ) ( not ( = ?auto_563383 ?auto_563389 ) ) ( not ( = ?auto_563383 ?auto_563390 ) ) ( not ( = ?auto_563383 ?auto_563391 ) ) ( not ( = ?auto_563383 ?auto_563392 ) ) ( not ( = ?auto_563383 ?auto_563393 ) ) ( not ( = ?auto_563383 ?auto_563394 ) ) ( not ( = ?auto_563383 ?auto_563395 ) ) ( not ( = ?auto_563383 ?auto_563396 ) ) ( not ( = ?auto_563383 ?auto_563397 ) ) ( not ( = ?auto_563384 ?auto_563385 ) ) ( not ( = ?auto_563384 ?auto_563386 ) ) ( not ( = ?auto_563384 ?auto_563387 ) ) ( not ( = ?auto_563384 ?auto_563388 ) ) ( not ( = ?auto_563384 ?auto_563389 ) ) ( not ( = ?auto_563384 ?auto_563390 ) ) ( not ( = ?auto_563384 ?auto_563391 ) ) ( not ( = ?auto_563384 ?auto_563392 ) ) ( not ( = ?auto_563384 ?auto_563393 ) ) ( not ( = ?auto_563384 ?auto_563394 ) ) ( not ( = ?auto_563384 ?auto_563395 ) ) ( not ( = ?auto_563384 ?auto_563396 ) ) ( not ( = ?auto_563384 ?auto_563397 ) ) ( not ( = ?auto_563385 ?auto_563386 ) ) ( not ( = ?auto_563385 ?auto_563387 ) ) ( not ( = ?auto_563385 ?auto_563388 ) ) ( not ( = ?auto_563385 ?auto_563389 ) ) ( not ( = ?auto_563385 ?auto_563390 ) ) ( not ( = ?auto_563385 ?auto_563391 ) ) ( not ( = ?auto_563385 ?auto_563392 ) ) ( not ( = ?auto_563385 ?auto_563393 ) ) ( not ( = ?auto_563385 ?auto_563394 ) ) ( not ( = ?auto_563385 ?auto_563395 ) ) ( not ( = ?auto_563385 ?auto_563396 ) ) ( not ( = ?auto_563385 ?auto_563397 ) ) ( not ( = ?auto_563386 ?auto_563387 ) ) ( not ( = ?auto_563386 ?auto_563388 ) ) ( not ( = ?auto_563386 ?auto_563389 ) ) ( not ( = ?auto_563386 ?auto_563390 ) ) ( not ( = ?auto_563386 ?auto_563391 ) ) ( not ( = ?auto_563386 ?auto_563392 ) ) ( not ( = ?auto_563386 ?auto_563393 ) ) ( not ( = ?auto_563386 ?auto_563394 ) ) ( not ( = ?auto_563386 ?auto_563395 ) ) ( not ( = ?auto_563386 ?auto_563396 ) ) ( not ( = ?auto_563386 ?auto_563397 ) ) ( not ( = ?auto_563387 ?auto_563388 ) ) ( not ( = ?auto_563387 ?auto_563389 ) ) ( not ( = ?auto_563387 ?auto_563390 ) ) ( not ( = ?auto_563387 ?auto_563391 ) ) ( not ( = ?auto_563387 ?auto_563392 ) ) ( not ( = ?auto_563387 ?auto_563393 ) ) ( not ( = ?auto_563387 ?auto_563394 ) ) ( not ( = ?auto_563387 ?auto_563395 ) ) ( not ( = ?auto_563387 ?auto_563396 ) ) ( not ( = ?auto_563387 ?auto_563397 ) ) ( not ( = ?auto_563388 ?auto_563389 ) ) ( not ( = ?auto_563388 ?auto_563390 ) ) ( not ( = ?auto_563388 ?auto_563391 ) ) ( not ( = ?auto_563388 ?auto_563392 ) ) ( not ( = ?auto_563388 ?auto_563393 ) ) ( not ( = ?auto_563388 ?auto_563394 ) ) ( not ( = ?auto_563388 ?auto_563395 ) ) ( not ( = ?auto_563388 ?auto_563396 ) ) ( not ( = ?auto_563388 ?auto_563397 ) ) ( not ( = ?auto_563389 ?auto_563390 ) ) ( not ( = ?auto_563389 ?auto_563391 ) ) ( not ( = ?auto_563389 ?auto_563392 ) ) ( not ( = ?auto_563389 ?auto_563393 ) ) ( not ( = ?auto_563389 ?auto_563394 ) ) ( not ( = ?auto_563389 ?auto_563395 ) ) ( not ( = ?auto_563389 ?auto_563396 ) ) ( not ( = ?auto_563389 ?auto_563397 ) ) ( not ( = ?auto_563390 ?auto_563391 ) ) ( not ( = ?auto_563390 ?auto_563392 ) ) ( not ( = ?auto_563390 ?auto_563393 ) ) ( not ( = ?auto_563390 ?auto_563394 ) ) ( not ( = ?auto_563390 ?auto_563395 ) ) ( not ( = ?auto_563390 ?auto_563396 ) ) ( not ( = ?auto_563390 ?auto_563397 ) ) ( not ( = ?auto_563391 ?auto_563392 ) ) ( not ( = ?auto_563391 ?auto_563393 ) ) ( not ( = ?auto_563391 ?auto_563394 ) ) ( not ( = ?auto_563391 ?auto_563395 ) ) ( not ( = ?auto_563391 ?auto_563396 ) ) ( not ( = ?auto_563391 ?auto_563397 ) ) ( not ( = ?auto_563392 ?auto_563393 ) ) ( not ( = ?auto_563392 ?auto_563394 ) ) ( not ( = ?auto_563392 ?auto_563395 ) ) ( not ( = ?auto_563392 ?auto_563396 ) ) ( not ( = ?auto_563392 ?auto_563397 ) ) ( not ( = ?auto_563393 ?auto_563394 ) ) ( not ( = ?auto_563393 ?auto_563395 ) ) ( not ( = ?auto_563393 ?auto_563396 ) ) ( not ( = ?auto_563393 ?auto_563397 ) ) ( not ( = ?auto_563394 ?auto_563395 ) ) ( not ( = ?auto_563394 ?auto_563396 ) ) ( not ( = ?auto_563394 ?auto_563397 ) ) ( not ( = ?auto_563395 ?auto_563396 ) ) ( not ( = ?auto_563395 ?auto_563397 ) ) ( not ( = ?auto_563396 ?auto_563397 ) ) ( CLEAR ?auto_563394 ) ( ON ?auto_563395 ?auto_563396 ) ( CLEAR ?auto_563395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_563382 ?auto_563383 ?auto_563384 ?auto_563385 ?auto_563386 ?auto_563387 ?auto_563388 ?auto_563389 ?auto_563390 ?auto_563391 ?auto_563392 ?auto_563393 ?auto_563394 ?auto_563395 )
      ( MAKE-15PILE ?auto_563382 ?auto_563383 ?auto_563384 ?auto_563385 ?auto_563386 ?auto_563387 ?auto_563388 ?auto_563389 ?auto_563390 ?auto_563391 ?auto_563392 ?auto_563393 ?auto_563394 ?auto_563395 ?auto_563396 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563444 - BLOCK
      ?auto_563445 - BLOCK
      ?auto_563446 - BLOCK
      ?auto_563447 - BLOCK
      ?auto_563448 - BLOCK
      ?auto_563449 - BLOCK
      ?auto_563450 - BLOCK
      ?auto_563451 - BLOCK
      ?auto_563452 - BLOCK
      ?auto_563453 - BLOCK
      ?auto_563454 - BLOCK
      ?auto_563455 - BLOCK
      ?auto_563456 - BLOCK
      ?auto_563457 - BLOCK
      ?auto_563458 - BLOCK
    )
    :vars
    (
      ?auto_563459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563458 ?auto_563459 ) ( ON-TABLE ?auto_563444 ) ( ON ?auto_563445 ?auto_563444 ) ( ON ?auto_563446 ?auto_563445 ) ( ON ?auto_563447 ?auto_563446 ) ( ON ?auto_563448 ?auto_563447 ) ( ON ?auto_563449 ?auto_563448 ) ( ON ?auto_563450 ?auto_563449 ) ( ON ?auto_563451 ?auto_563450 ) ( ON ?auto_563452 ?auto_563451 ) ( ON ?auto_563453 ?auto_563452 ) ( ON ?auto_563454 ?auto_563453 ) ( ON ?auto_563455 ?auto_563454 ) ( not ( = ?auto_563444 ?auto_563445 ) ) ( not ( = ?auto_563444 ?auto_563446 ) ) ( not ( = ?auto_563444 ?auto_563447 ) ) ( not ( = ?auto_563444 ?auto_563448 ) ) ( not ( = ?auto_563444 ?auto_563449 ) ) ( not ( = ?auto_563444 ?auto_563450 ) ) ( not ( = ?auto_563444 ?auto_563451 ) ) ( not ( = ?auto_563444 ?auto_563452 ) ) ( not ( = ?auto_563444 ?auto_563453 ) ) ( not ( = ?auto_563444 ?auto_563454 ) ) ( not ( = ?auto_563444 ?auto_563455 ) ) ( not ( = ?auto_563444 ?auto_563456 ) ) ( not ( = ?auto_563444 ?auto_563457 ) ) ( not ( = ?auto_563444 ?auto_563458 ) ) ( not ( = ?auto_563444 ?auto_563459 ) ) ( not ( = ?auto_563445 ?auto_563446 ) ) ( not ( = ?auto_563445 ?auto_563447 ) ) ( not ( = ?auto_563445 ?auto_563448 ) ) ( not ( = ?auto_563445 ?auto_563449 ) ) ( not ( = ?auto_563445 ?auto_563450 ) ) ( not ( = ?auto_563445 ?auto_563451 ) ) ( not ( = ?auto_563445 ?auto_563452 ) ) ( not ( = ?auto_563445 ?auto_563453 ) ) ( not ( = ?auto_563445 ?auto_563454 ) ) ( not ( = ?auto_563445 ?auto_563455 ) ) ( not ( = ?auto_563445 ?auto_563456 ) ) ( not ( = ?auto_563445 ?auto_563457 ) ) ( not ( = ?auto_563445 ?auto_563458 ) ) ( not ( = ?auto_563445 ?auto_563459 ) ) ( not ( = ?auto_563446 ?auto_563447 ) ) ( not ( = ?auto_563446 ?auto_563448 ) ) ( not ( = ?auto_563446 ?auto_563449 ) ) ( not ( = ?auto_563446 ?auto_563450 ) ) ( not ( = ?auto_563446 ?auto_563451 ) ) ( not ( = ?auto_563446 ?auto_563452 ) ) ( not ( = ?auto_563446 ?auto_563453 ) ) ( not ( = ?auto_563446 ?auto_563454 ) ) ( not ( = ?auto_563446 ?auto_563455 ) ) ( not ( = ?auto_563446 ?auto_563456 ) ) ( not ( = ?auto_563446 ?auto_563457 ) ) ( not ( = ?auto_563446 ?auto_563458 ) ) ( not ( = ?auto_563446 ?auto_563459 ) ) ( not ( = ?auto_563447 ?auto_563448 ) ) ( not ( = ?auto_563447 ?auto_563449 ) ) ( not ( = ?auto_563447 ?auto_563450 ) ) ( not ( = ?auto_563447 ?auto_563451 ) ) ( not ( = ?auto_563447 ?auto_563452 ) ) ( not ( = ?auto_563447 ?auto_563453 ) ) ( not ( = ?auto_563447 ?auto_563454 ) ) ( not ( = ?auto_563447 ?auto_563455 ) ) ( not ( = ?auto_563447 ?auto_563456 ) ) ( not ( = ?auto_563447 ?auto_563457 ) ) ( not ( = ?auto_563447 ?auto_563458 ) ) ( not ( = ?auto_563447 ?auto_563459 ) ) ( not ( = ?auto_563448 ?auto_563449 ) ) ( not ( = ?auto_563448 ?auto_563450 ) ) ( not ( = ?auto_563448 ?auto_563451 ) ) ( not ( = ?auto_563448 ?auto_563452 ) ) ( not ( = ?auto_563448 ?auto_563453 ) ) ( not ( = ?auto_563448 ?auto_563454 ) ) ( not ( = ?auto_563448 ?auto_563455 ) ) ( not ( = ?auto_563448 ?auto_563456 ) ) ( not ( = ?auto_563448 ?auto_563457 ) ) ( not ( = ?auto_563448 ?auto_563458 ) ) ( not ( = ?auto_563448 ?auto_563459 ) ) ( not ( = ?auto_563449 ?auto_563450 ) ) ( not ( = ?auto_563449 ?auto_563451 ) ) ( not ( = ?auto_563449 ?auto_563452 ) ) ( not ( = ?auto_563449 ?auto_563453 ) ) ( not ( = ?auto_563449 ?auto_563454 ) ) ( not ( = ?auto_563449 ?auto_563455 ) ) ( not ( = ?auto_563449 ?auto_563456 ) ) ( not ( = ?auto_563449 ?auto_563457 ) ) ( not ( = ?auto_563449 ?auto_563458 ) ) ( not ( = ?auto_563449 ?auto_563459 ) ) ( not ( = ?auto_563450 ?auto_563451 ) ) ( not ( = ?auto_563450 ?auto_563452 ) ) ( not ( = ?auto_563450 ?auto_563453 ) ) ( not ( = ?auto_563450 ?auto_563454 ) ) ( not ( = ?auto_563450 ?auto_563455 ) ) ( not ( = ?auto_563450 ?auto_563456 ) ) ( not ( = ?auto_563450 ?auto_563457 ) ) ( not ( = ?auto_563450 ?auto_563458 ) ) ( not ( = ?auto_563450 ?auto_563459 ) ) ( not ( = ?auto_563451 ?auto_563452 ) ) ( not ( = ?auto_563451 ?auto_563453 ) ) ( not ( = ?auto_563451 ?auto_563454 ) ) ( not ( = ?auto_563451 ?auto_563455 ) ) ( not ( = ?auto_563451 ?auto_563456 ) ) ( not ( = ?auto_563451 ?auto_563457 ) ) ( not ( = ?auto_563451 ?auto_563458 ) ) ( not ( = ?auto_563451 ?auto_563459 ) ) ( not ( = ?auto_563452 ?auto_563453 ) ) ( not ( = ?auto_563452 ?auto_563454 ) ) ( not ( = ?auto_563452 ?auto_563455 ) ) ( not ( = ?auto_563452 ?auto_563456 ) ) ( not ( = ?auto_563452 ?auto_563457 ) ) ( not ( = ?auto_563452 ?auto_563458 ) ) ( not ( = ?auto_563452 ?auto_563459 ) ) ( not ( = ?auto_563453 ?auto_563454 ) ) ( not ( = ?auto_563453 ?auto_563455 ) ) ( not ( = ?auto_563453 ?auto_563456 ) ) ( not ( = ?auto_563453 ?auto_563457 ) ) ( not ( = ?auto_563453 ?auto_563458 ) ) ( not ( = ?auto_563453 ?auto_563459 ) ) ( not ( = ?auto_563454 ?auto_563455 ) ) ( not ( = ?auto_563454 ?auto_563456 ) ) ( not ( = ?auto_563454 ?auto_563457 ) ) ( not ( = ?auto_563454 ?auto_563458 ) ) ( not ( = ?auto_563454 ?auto_563459 ) ) ( not ( = ?auto_563455 ?auto_563456 ) ) ( not ( = ?auto_563455 ?auto_563457 ) ) ( not ( = ?auto_563455 ?auto_563458 ) ) ( not ( = ?auto_563455 ?auto_563459 ) ) ( not ( = ?auto_563456 ?auto_563457 ) ) ( not ( = ?auto_563456 ?auto_563458 ) ) ( not ( = ?auto_563456 ?auto_563459 ) ) ( not ( = ?auto_563457 ?auto_563458 ) ) ( not ( = ?auto_563457 ?auto_563459 ) ) ( not ( = ?auto_563458 ?auto_563459 ) ) ( ON ?auto_563457 ?auto_563458 ) ( CLEAR ?auto_563455 ) ( ON ?auto_563456 ?auto_563457 ) ( CLEAR ?auto_563456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_563444 ?auto_563445 ?auto_563446 ?auto_563447 ?auto_563448 ?auto_563449 ?auto_563450 ?auto_563451 ?auto_563452 ?auto_563453 ?auto_563454 ?auto_563455 ?auto_563456 )
      ( MAKE-15PILE ?auto_563444 ?auto_563445 ?auto_563446 ?auto_563447 ?auto_563448 ?auto_563449 ?auto_563450 ?auto_563451 ?auto_563452 ?auto_563453 ?auto_563454 ?auto_563455 ?auto_563456 ?auto_563457 ?auto_563458 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563506 - BLOCK
      ?auto_563507 - BLOCK
      ?auto_563508 - BLOCK
      ?auto_563509 - BLOCK
      ?auto_563510 - BLOCK
      ?auto_563511 - BLOCK
      ?auto_563512 - BLOCK
      ?auto_563513 - BLOCK
      ?auto_563514 - BLOCK
      ?auto_563515 - BLOCK
      ?auto_563516 - BLOCK
      ?auto_563517 - BLOCK
      ?auto_563518 - BLOCK
      ?auto_563519 - BLOCK
      ?auto_563520 - BLOCK
    )
    :vars
    (
      ?auto_563521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563520 ?auto_563521 ) ( ON-TABLE ?auto_563506 ) ( ON ?auto_563507 ?auto_563506 ) ( ON ?auto_563508 ?auto_563507 ) ( ON ?auto_563509 ?auto_563508 ) ( ON ?auto_563510 ?auto_563509 ) ( ON ?auto_563511 ?auto_563510 ) ( ON ?auto_563512 ?auto_563511 ) ( ON ?auto_563513 ?auto_563512 ) ( ON ?auto_563514 ?auto_563513 ) ( ON ?auto_563515 ?auto_563514 ) ( ON ?auto_563516 ?auto_563515 ) ( not ( = ?auto_563506 ?auto_563507 ) ) ( not ( = ?auto_563506 ?auto_563508 ) ) ( not ( = ?auto_563506 ?auto_563509 ) ) ( not ( = ?auto_563506 ?auto_563510 ) ) ( not ( = ?auto_563506 ?auto_563511 ) ) ( not ( = ?auto_563506 ?auto_563512 ) ) ( not ( = ?auto_563506 ?auto_563513 ) ) ( not ( = ?auto_563506 ?auto_563514 ) ) ( not ( = ?auto_563506 ?auto_563515 ) ) ( not ( = ?auto_563506 ?auto_563516 ) ) ( not ( = ?auto_563506 ?auto_563517 ) ) ( not ( = ?auto_563506 ?auto_563518 ) ) ( not ( = ?auto_563506 ?auto_563519 ) ) ( not ( = ?auto_563506 ?auto_563520 ) ) ( not ( = ?auto_563506 ?auto_563521 ) ) ( not ( = ?auto_563507 ?auto_563508 ) ) ( not ( = ?auto_563507 ?auto_563509 ) ) ( not ( = ?auto_563507 ?auto_563510 ) ) ( not ( = ?auto_563507 ?auto_563511 ) ) ( not ( = ?auto_563507 ?auto_563512 ) ) ( not ( = ?auto_563507 ?auto_563513 ) ) ( not ( = ?auto_563507 ?auto_563514 ) ) ( not ( = ?auto_563507 ?auto_563515 ) ) ( not ( = ?auto_563507 ?auto_563516 ) ) ( not ( = ?auto_563507 ?auto_563517 ) ) ( not ( = ?auto_563507 ?auto_563518 ) ) ( not ( = ?auto_563507 ?auto_563519 ) ) ( not ( = ?auto_563507 ?auto_563520 ) ) ( not ( = ?auto_563507 ?auto_563521 ) ) ( not ( = ?auto_563508 ?auto_563509 ) ) ( not ( = ?auto_563508 ?auto_563510 ) ) ( not ( = ?auto_563508 ?auto_563511 ) ) ( not ( = ?auto_563508 ?auto_563512 ) ) ( not ( = ?auto_563508 ?auto_563513 ) ) ( not ( = ?auto_563508 ?auto_563514 ) ) ( not ( = ?auto_563508 ?auto_563515 ) ) ( not ( = ?auto_563508 ?auto_563516 ) ) ( not ( = ?auto_563508 ?auto_563517 ) ) ( not ( = ?auto_563508 ?auto_563518 ) ) ( not ( = ?auto_563508 ?auto_563519 ) ) ( not ( = ?auto_563508 ?auto_563520 ) ) ( not ( = ?auto_563508 ?auto_563521 ) ) ( not ( = ?auto_563509 ?auto_563510 ) ) ( not ( = ?auto_563509 ?auto_563511 ) ) ( not ( = ?auto_563509 ?auto_563512 ) ) ( not ( = ?auto_563509 ?auto_563513 ) ) ( not ( = ?auto_563509 ?auto_563514 ) ) ( not ( = ?auto_563509 ?auto_563515 ) ) ( not ( = ?auto_563509 ?auto_563516 ) ) ( not ( = ?auto_563509 ?auto_563517 ) ) ( not ( = ?auto_563509 ?auto_563518 ) ) ( not ( = ?auto_563509 ?auto_563519 ) ) ( not ( = ?auto_563509 ?auto_563520 ) ) ( not ( = ?auto_563509 ?auto_563521 ) ) ( not ( = ?auto_563510 ?auto_563511 ) ) ( not ( = ?auto_563510 ?auto_563512 ) ) ( not ( = ?auto_563510 ?auto_563513 ) ) ( not ( = ?auto_563510 ?auto_563514 ) ) ( not ( = ?auto_563510 ?auto_563515 ) ) ( not ( = ?auto_563510 ?auto_563516 ) ) ( not ( = ?auto_563510 ?auto_563517 ) ) ( not ( = ?auto_563510 ?auto_563518 ) ) ( not ( = ?auto_563510 ?auto_563519 ) ) ( not ( = ?auto_563510 ?auto_563520 ) ) ( not ( = ?auto_563510 ?auto_563521 ) ) ( not ( = ?auto_563511 ?auto_563512 ) ) ( not ( = ?auto_563511 ?auto_563513 ) ) ( not ( = ?auto_563511 ?auto_563514 ) ) ( not ( = ?auto_563511 ?auto_563515 ) ) ( not ( = ?auto_563511 ?auto_563516 ) ) ( not ( = ?auto_563511 ?auto_563517 ) ) ( not ( = ?auto_563511 ?auto_563518 ) ) ( not ( = ?auto_563511 ?auto_563519 ) ) ( not ( = ?auto_563511 ?auto_563520 ) ) ( not ( = ?auto_563511 ?auto_563521 ) ) ( not ( = ?auto_563512 ?auto_563513 ) ) ( not ( = ?auto_563512 ?auto_563514 ) ) ( not ( = ?auto_563512 ?auto_563515 ) ) ( not ( = ?auto_563512 ?auto_563516 ) ) ( not ( = ?auto_563512 ?auto_563517 ) ) ( not ( = ?auto_563512 ?auto_563518 ) ) ( not ( = ?auto_563512 ?auto_563519 ) ) ( not ( = ?auto_563512 ?auto_563520 ) ) ( not ( = ?auto_563512 ?auto_563521 ) ) ( not ( = ?auto_563513 ?auto_563514 ) ) ( not ( = ?auto_563513 ?auto_563515 ) ) ( not ( = ?auto_563513 ?auto_563516 ) ) ( not ( = ?auto_563513 ?auto_563517 ) ) ( not ( = ?auto_563513 ?auto_563518 ) ) ( not ( = ?auto_563513 ?auto_563519 ) ) ( not ( = ?auto_563513 ?auto_563520 ) ) ( not ( = ?auto_563513 ?auto_563521 ) ) ( not ( = ?auto_563514 ?auto_563515 ) ) ( not ( = ?auto_563514 ?auto_563516 ) ) ( not ( = ?auto_563514 ?auto_563517 ) ) ( not ( = ?auto_563514 ?auto_563518 ) ) ( not ( = ?auto_563514 ?auto_563519 ) ) ( not ( = ?auto_563514 ?auto_563520 ) ) ( not ( = ?auto_563514 ?auto_563521 ) ) ( not ( = ?auto_563515 ?auto_563516 ) ) ( not ( = ?auto_563515 ?auto_563517 ) ) ( not ( = ?auto_563515 ?auto_563518 ) ) ( not ( = ?auto_563515 ?auto_563519 ) ) ( not ( = ?auto_563515 ?auto_563520 ) ) ( not ( = ?auto_563515 ?auto_563521 ) ) ( not ( = ?auto_563516 ?auto_563517 ) ) ( not ( = ?auto_563516 ?auto_563518 ) ) ( not ( = ?auto_563516 ?auto_563519 ) ) ( not ( = ?auto_563516 ?auto_563520 ) ) ( not ( = ?auto_563516 ?auto_563521 ) ) ( not ( = ?auto_563517 ?auto_563518 ) ) ( not ( = ?auto_563517 ?auto_563519 ) ) ( not ( = ?auto_563517 ?auto_563520 ) ) ( not ( = ?auto_563517 ?auto_563521 ) ) ( not ( = ?auto_563518 ?auto_563519 ) ) ( not ( = ?auto_563518 ?auto_563520 ) ) ( not ( = ?auto_563518 ?auto_563521 ) ) ( not ( = ?auto_563519 ?auto_563520 ) ) ( not ( = ?auto_563519 ?auto_563521 ) ) ( not ( = ?auto_563520 ?auto_563521 ) ) ( ON ?auto_563519 ?auto_563520 ) ( ON ?auto_563518 ?auto_563519 ) ( CLEAR ?auto_563516 ) ( ON ?auto_563517 ?auto_563518 ) ( CLEAR ?auto_563517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_563506 ?auto_563507 ?auto_563508 ?auto_563509 ?auto_563510 ?auto_563511 ?auto_563512 ?auto_563513 ?auto_563514 ?auto_563515 ?auto_563516 ?auto_563517 )
      ( MAKE-15PILE ?auto_563506 ?auto_563507 ?auto_563508 ?auto_563509 ?auto_563510 ?auto_563511 ?auto_563512 ?auto_563513 ?auto_563514 ?auto_563515 ?auto_563516 ?auto_563517 ?auto_563518 ?auto_563519 ?auto_563520 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563568 - BLOCK
      ?auto_563569 - BLOCK
      ?auto_563570 - BLOCK
      ?auto_563571 - BLOCK
      ?auto_563572 - BLOCK
      ?auto_563573 - BLOCK
      ?auto_563574 - BLOCK
      ?auto_563575 - BLOCK
      ?auto_563576 - BLOCK
      ?auto_563577 - BLOCK
      ?auto_563578 - BLOCK
      ?auto_563579 - BLOCK
      ?auto_563580 - BLOCK
      ?auto_563581 - BLOCK
      ?auto_563582 - BLOCK
    )
    :vars
    (
      ?auto_563583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563582 ?auto_563583 ) ( ON-TABLE ?auto_563568 ) ( ON ?auto_563569 ?auto_563568 ) ( ON ?auto_563570 ?auto_563569 ) ( ON ?auto_563571 ?auto_563570 ) ( ON ?auto_563572 ?auto_563571 ) ( ON ?auto_563573 ?auto_563572 ) ( ON ?auto_563574 ?auto_563573 ) ( ON ?auto_563575 ?auto_563574 ) ( ON ?auto_563576 ?auto_563575 ) ( ON ?auto_563577 ?auto_563576 ) ( not ( = ?auto_563568 ?auto_563569 ) ) ( not ( = ?auto_563568 ?auto_563570 ) ) ( not ( = ?auto_563568 ?auto_563571 ) ) ( not ( = ?auto_563568 ?auto_563572 ) ) ( not ( = ?auto_563568 ?auto_563573 ) ) ( not ( = ?auto_563568 ?auto_563574 ) ) ( not ( = ?auto_563568 ?auto_563575 ) ) ( not ( = ?auto_563568 ?auto_563576 ) ) ( not ( = ?auto_563568 ?auto_563577 ) ) ( not ( = ?auto_563568 ?auto_563578 ) ) ( not ( = ?auto_563568 ?auto_563579 ) ) ( not ( = ?auto_563568 ?auto_563580 ) ) ( not ( = ?auto_563568 ?auto_563581 ) ) ( not ( = ?auto_563568 ?auto_563582 ) ) ( not ( = ?auto_563568 ?auto_563583 ) ) ( not ( = ?auto_563569 ?auto_563570 ) ) ( not ( = ?auto_563569 ?auto_563571 ) ) ( not ( = ?auto_563569 ?auto_563572 ) ) ( not ( = ?auto_563569 ?auto_563573 ) ) ( not ( = ?auto_563569 ?auto_563574 ) ) ( not ( = ?auto_563569 ?auto_563575 ) ) ( not ( = ?auto_563569 ?auto_563576 ) ) ( not ( = ?auto_563569 ?auto_563577 ) ) ( not ( = ?auto_563569 ?auto_563578 ) ) ( not ( = ?auto_563569 ?auto_563579 ) ) ( not ( = ?auto_563569 ?auto_563580 ) ) ( not ( = ?auto_563569 ?auto_563581 ) ) ( not ( = ?auto_563569 ?auto_563582 ) ) ( not ( = ?auto_563569 ?auto_563583 ) ) ( not ( = ?auto_563570 ?auto_563571 ) ) ( not ( = ?auto_563570 ?auto_563572 ) ) ( not ( = ?auto_563570 ?auto_563573 ) ) ( not ( = ?auto_563570 ?auto_563574 ) ) ( not ( = ?auto_563570 ?auto_563575 ) ) ( not ( = ?auto_563570 ?auto_563576 ) ) ( not ( = ?auto_563570 ?auto_563577 ) ) ( not ( = ?auto_563570 ?auto_563578 ) ) ( not ( = ?auto_563570 ?auto_563579 ) ) ( not ( = ?auto_563570 ?auto_563580 ) ) ( not ( = ?auto_563570 ?auto_563581 ) ) ( not ( = ?auto_563570 ?auto_563582 ) ) ( not ( = ?auto_563570 ?auto_563583 ) ) ( not ( = ?auto_563571 ?auto_563572 ) ) ( not ( = ?auto_563571 ?auto_563573 ) ) ( not ( = ?auto_563571 ?auto_563574 ) ) ( not ( = ?auto_563571 ?auto_563575 ) ) ( not ( = ?auto_563571 ?auto_563576 ) ) ( not ( = ?auto_563571 ?auto_563577 ) ) ( not ( = ?auto_563571 ?auto_563578 ) ) ( not ( = ?auto_563571 ?auto_563579 ) ) ( not ( = ?auto_563571 ?auto_563580 ) ) ( not ( = ?auto_563571 ?auto_563581 ) ) ( not ( = ?auto_563571 ?auto_563582 ) ) ( not ( = ?auto_563571 ?auto_563583 ) ) ( not ( = ?auto_563572 ?auto_563573 ) ) ( not ( = ?auto_563572 ?auto_563574 ) ) ( not ( = ?auto_563572 ?auto_563575 ) ) ( not ( = ?auto_563572 ?auto_563576 ) ) ( not ( = ?auto_563572 ?auto_563577 ) ) ( not ( = ?auto_563572 ?auto_563578 ) ) ( not ( = ?auto_563572 ?auto_563579 ) ) ( not ( = ?auto_563572 ?auto_563580 ) ) ( not ( = ?auto_563572 ?auto_563581 ) ) ( not ( = ?auto_563572 ?auto_563582 ) ) ( not ( = ?auto_563572 ?auto_563583 ) ) ( not ( = ?auto_563573 ?auto_563574 ) ) ( not ( = ?auto_563573 ?auto_563575 ) ) ( not ( = ?auto_563573 ?auto_563576 ) ) ( not ( = ?auto_563573 ?auto_563577 ) ) ( not ( = ?auto_563573 ?auto_563578 ) ) ( not ( = ?auto_563573 ?auto_563579 ) ) ( not ( = ?auto_563573 ?auto_563580 ) ) ( not ( = ?auto_563573 ?auto_563581 ) ) ( not ( = ?auto_563573 ?auto_563582 ) ) ( not ( = ?auto_563573 ?auto_563583 ) ) ( not ( = ?auto_563574 ?auto_563575 ) ) ( not ( = ?auto_563574 ?auto_563576 ) ) ( not ( = ?auto_563574 ?auto_563577 ) ) ( not ( = ?auto_563574 ?auto_563578 ) ) ( not ( = ?auto_563574 ?auto_563579 ) ) ( not ( = ?auto_563574 ?auto_563580 ) ) ( not ( = ?auto_563574 ?auto_563581 ) ) ( not ( = ?auto_563574 ?auto_563582 ) ) ( not ( = ?auto_563574 ?auto_563583 ) ) ( not ( = ?auto_563575 ?auto_563576 ) ) ( not ( = ?auto_563575 ?auto_563577 ) ) ( not ( = ?auto_563575 ?auto_563578 ) ) ( not ( = ?auto_563575 ?auto_563579 ) ) ( not ( = ?auto_563575 ?auto_563580 ) ) ( not ( = ?auto_563575 ?auto_563581 ) ) ( not ( = ?auto_563575 ?auto_563582 ) ) ( not ( = ?auto_563575 ?auto_563583 ) ) ( not ( = ?auto_563576 ?auto_563577 ) ) ( not ( = ?auto_563576 ?auto_563578 ) ) ( not ( = ?auto_563576 ?auto_563579 ) ) ( not ( = ?auto_563576 ?auto_563580 ) ) ( not ( = ?auto_563576 ?auto_563581 ) ) ( not ( = ?auto_563576 ?auto_563582 ) ) ( not ( = ?auto_563576 ?auto_563583 ) ) ( not ( = ?auto_563577 ?auto_563578 ) ) ( not ( = ?auto_563577 ?auto_563579 ) ) ( not ( = ?auto_563577 ?auto_563580 ) ) ( not ( = ?auto_563577 ?auto_563581 ) ) ( not ( = ?auto_563577 ?auto_563582 ) ) ( not ( = ?auto_563577 ?auto_563583 ) ) ( not ( = ?auto_563578 ?auto_563579 ) ) ( not ( = ?auto_563578 ?auto_563580 ) ) ( not ( = ?auto_563578 ?auto_563581 ) ) ( not ( = ?auto_563578 ?auto_563582 ) ) ( not ( = ?auto_563578 ?auto_563583 ) ) ( not ( = ?auto_563579 ?auto_563580 ) ) ( not ( = ?auto_563579 ?auto_563581 ) ) ( not ( = ?auto_563579 ?auto_563582 ) ) ( not ( = ?auto_563579 ?auto_563583 ) ) ( not ( = ?auto_563580 ?auto_563581 ) ) ( not ( = ?auto_563580 ?auto_563582 ) ) ( not ( = ?auto_563580 ?auto_563583 ) ) ( not ( = ?auto_563581 ?auto_563582 ) ) ( not ( = ?auto_563581 ?auto_563583 ) ) ( not ( = ?auto_563582 ?auto_563583 ) ) ( ON ?auto_563581 ?auto_563582 ) ( ON ?auto_563580 ?auto_563581 ) ( ON ?auto_563579 ?auto_563580 ) ( CLEAR ?auto_563577 ) ( ON ?auto_563578 ?auto_563579 ) ( CLEAR ?auto_563578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_563568 ?auto_563569 ?auto_563570 ?auto_563571 ?auto_563572 ?auto_563573 ?auto_563574 ?auto_563575 ?auto_563576 ?auto_563577 ?auto_563578 )
      ( MAKE-15PILE ?auto_563568 ?auto_563569 ?auto_563570 ?auto_563571 ?auto_563572 ?auto_563573 ?auto_563574 ?auto_563575 ?auto_563576 ?auto_563577 ?auto_563578 ?auto_563579 ?auto_563580 ?auto_563581 ?auto_563582 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563630 - BLOCK
      ?auto_563631 - BLOCK
      ?auto_563632 - BLOCK
      ?auto_563633 - BLOCK
      ?auto_563634 - BLOCK
      ?auto_563635 - BLOCK
      ?auto_563636 - BLOCK
      ?auto_563637 - BLOCK
      ?auto_563638 - BLOCK
      ?auto_563639 - BLOCK
      ?auto_563640 - BLOCK
      ?auto_563641 - BLOCK
      ?auto_563642 - BLOCK
      ?auto_563643 - BLOCK
      ?auto_563644 - BLOCK
    )
    :vars
    (
      ?auto_563645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563644 ?auto_563645 ) ( ON-TABLE ?auto_563630 ) ( ON ?auto_563631 ?auto_563630 ) ( ON ?auto_563632 ?auto_563631 ) ( ON ?auto_563633 ?auto_563632 ) ( ON ?auto_563634 ?auto_563633 ) ( ON ?auto_563635 ?auto_563634 ) ( ON ?auto_563636 ?auto_563635 ) ( ON ?auto_563637 ?auto_563636 ) ( ON ?auto_563638 ?auto_563637 ) ( not ( = ?auto_563630 ?auto_563631 ) ) ( not ( = ?auto_563630 ?auto_563632 ) ) ( not ( = ?auto_563630 ?auto_563633 ) ) ( not ( = ?auto_563630 ?auto_563634 ) ) ( not ( = ?auto_563630 ?auto_563635 ) ) ( not ( = ?auto_563630 ?auto_563636 ) ) ( not ( = ?auto_563630 ?auto_563637 ) ) ( not ( = ?auto_563630 ?auto_563638 ) ) ( not ( = ?auto_563630 ?auto_563639 ) ) ( not ( = ?auto_563630 ?auto_563640 ) ) ( not ( = ?auto_563630 ?auto_563641 ) ) ( not ( = ?auto_563630 ?auto_563642 ) ) ( not ( = ?auto_563630 ?auto_563643 ) ) ( not ( = ?auto_563630 ?auto_563644 ) ) ( not ( = ?auto_563630 ?auto_563645 ) ) ( not ( = ?auto_563631 ?auto_563632 ) ) ( not ( = ?auto_563631 ?auto_563633 ) ) ( not ( = ?auto_563631 ?auto_563634 ) ) ( not ( = ?auto_563631 ?auto_563635 ) ) ( not ( = ?auto_563631 ?auto_563636 ) ) ( not ( = ?auto_563631 ?auto_563637 ) ) ( not ( = ?auto_563631 ?auto_563638 ) ) ( not ( = ?auto_563631 ?auto_563639 ) ) ( not ( = ?auto_563631 ?auto_563640 ) ) ( not ( = ?auto_563631 ?auto_563641 ) ) ( not ( = ?auto_563631 ?auto_563642 ) ) ( not ( = ?auto_563631 ?auto_563643 ) ) ( not ( = ?auto_563631 ?auto_563644 ) ) ( not ( = ?auto_563631 ?auto_563645 ) ) ( not ( = ?auto_563632 ?auto_563633 ) ) ( not ( = ?auto_563632 ?auto_563634 ) ) ( not ( = ?auto_563632 ?auto_563635 ) ) ( not ( = ?auto_563632 ?auto_563636 ) ) ( not ( = ?auto_563632 ?auto_563637 ) ) ( not ( = ?auto_563632 ?auto_563638 ) ) ( not ( = ?auto_563632 ?auto_563639 ) ) ( not ( = ?auto_563632 ?auto_563640 ) ) ( not ( = ?auto_563632 ?auto_563641 ) ) ( not ( = ?auto_563632 ?auto_563642 ) ) ( not ( = ?auto_563632 ?auto_563643 ) ) ( not ( = ?auto_563632 ?auto_563644 ) ) ( not ( = ?auto_563632 ?auto_563645 ) ) ( not ( = ?auto_563633 ?auto_563634 ) ) ( not ( = ?auto_563633 ?auto_563635 ) ) ( not ( = ?auto_563633 ?auto_563636 ) ) ( not ( = ?auto_563633 ?auto_563637 ) ) ( not ( = ?auto_563633 ?auto_563638 ) ) ( not ( = ?auto_563633 ?auto_563639 ) ) ( not ( = ?auto_563633 ?auto_563640 ) ) ( not ( = ?auto_563633 ?auto_563641 ) ) ( not ( = ?auto_563633 ?auto_563642 ) ) ( not ( = ?auto_563633 ?auto_563643 ) ) ( not ( = ?auto_563633 ?auto_563644 ) ) ( not ( = ?auto_563633 ?auto_563645 ) ) ( not ( = ?auto_563634 ?auto_563635 ) ) ( not ( = ?auto_563634 ?auto_563636 ) ) ( not ( = ?auto_563634 ?auto_563637 ) ) ( not ( = ?auto_563634 ?auto_563638 ) ) ( not ( = ?auto_563634 ?auto_563639 ) ) ( not ( = ?auto_563634 ?auto_563640 ) ) ( not ( = ?auto_563634 ?auto_563641 ) ) ( not ( = ?auto_563634 ?auto_563642 ) ) ( not ( = ?auto_563634 ?auto_563643 ) ) ( not ( = ?auto_563634 ?auto_563644 ) ) ( not ( = ?auto_563634 ?auto_563645 ) ) ( not ( = ?auto_563635 ?auto_563636 ) ) ( not ( = ?auto_563635 ?auto_563637 ) ) ( not ( = ?auto_563635 ?auto_563638 ) ) ( not ( = ?auto_563635 ?auto_563639 ) ) ( not ( = ?auto_563635 ?auto_563640 ) ) ( not ( = ?auto_563635 ?auto_563641 ) ) ( not ( = ?auto_563635 ?auto_563642 ) ) ( not ( = ?auto_563635 ?auto_563643 ) ) ( not ( = ?auto_563635 ?auto_563644 ) ) ( not ( = ?auto_563635 ?auto_563645 ) ) ( not ( = ?auto_563636 ?auto_563637 ) ) ( not ( = ?auto_563636 ?auto_563638 ) ) ( not ( = ?auto_563636 ?auto_563639 ) ) ( not ( = ?auto_563636 ?auto_563640 ) ) ( not ( = ?auto_563636 ?auto_563641 ) ) ( not ( = ?auto_563636 ?auto_563642 ) ) ( not ( = ?auto_563636 ?auto_563643 ) ) ( not ( = ?auto_563636 ?auto_563644 ) ) ( not ( = ?auto_563636 ?auto_563645 ) ) ( not ( = ?auto_563637 ?auto_563638 ) ) ( not ( = ?auto_563637 ?auto_563639 ) ) ( not ( = ?auto_563637 ?auto_563640 ) ) ( not ( = ?auto_563637 ?auto_563641 ) ) ( not ( = ?auto_563637 ?auto_563642 ) ) ( not ( = ?auto_563637 ?auto_563643 ) ) ( not ( = ?auto_563637 ?auto_563644 ) ) ( not ( = ?auto_563637 ?auto_563645 ) ) ( not ( = ?auto_563638 ?auto_563639 ) ) ( not ( = ?auto_563638 ?auto_563640 ) ) ( not ( = ?auto_563638 ?auto_563641 ) ) ( not ( = ?auto_563638 ?auto_563642 ) ) ( not ( = ?auto_563638 ?auto_563643 ) ) ( not ( = ?auto_563638 ?auto_563644 ) ) ( not ( = ?auto_563638 ?auto_563645 ) ) ( not ( = ?auto_563639 ?auto_563640 ) ) ( not ( = ?auto_563639 ?auto_563641 ) ) ( not ( = ?auto_563639 ?auto_563642 ) ) ( not ( = ?auto_563639 ?auto_563643 ) ) ( not ( = ?auto_563639 ?auto_563644 ) ) ( not ( = ?auto_563639 ?auto_563645 ) ) ( not ( = ?auto_563640 ?auto_563641 ) ) ( not ( = ?auto_563640 ?auto_563642 ) ) ( not ( = ?auto_563640 ?auto_563643 ) ) ( not ( = ?auto_563640 ?auto_563644 ) ) ( not ( = ?auto_563640 ?auto_563645 ) ) ( not ( = ?auto_563641 ?auto_563642 ) ) ( not ( = ?auto_563641 ?auto_563643 ) ) ( not ( = ?auto_563641 ?auto_563644 ) ) ( not ( = ?auto_563641 ?auto_563645 ) ) ( not ( = ?auto_563642 ?auto_563643 ) ) ( not ( = ?auto_563642 ?auto_563644 ) ) ( not ( = ?auto_563642 ?auto_563645 ) ) ( not ( = ?auto_563643 ?auto_563644 ) ) ( not ( = ?auto_563643 ?auto_563645 ) ) ( not ( = ?auto_563644 ?auto_563645 ) ) ( ON ?auto_563643 ?auto_563644 ) ( ON ?auto_563642 ?auto_563643 ) ( ON ?auto_563641 ?auto_563642 ) ( ON ?auto_563640 ?auto_563641 ) ( CLEAR ?auto_563638 ) ( ON ?auto_563639 ?auto_563640 ) ( CLEAR ?auto_563639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_563630 ?auto_563631 ?auto_563632 ?auto_563633 ?auto_563634 ?auto_563635 ?auto_563636 ?auto_563637 ?auto_563638 ?auto_563639 )
      ( MAKE-15PILE ?auto_563630 ?auto_563631 ?auto_563632 ?auto_563633 ?auto_563634 ?auto_563635 ?auto_563636 ?auto_563637 ?auto_563638 ?auto_563639 ?auto_563640 ?auto_563641 ?auto_563642 ?auto_563643 ?auto_563644 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563692 - BLOCK
      ?auto_563693 - BLOCK
      ?auto_563694 - BLOCK
      ?auto_563695 - BLOCK
      ?auto_563696 - BLOCK
      ?auto_563697 - BLOCK
      ?auto_563698 - BLOCK
      ?auto_563699 - BLOCK
      ?auto_563700 - BLOCK
      ?auto_563701 - BLOCK
      ?auto_563702 - BLOCK
      ?auto_563703 - BLOCK
      ?auto_563704 - BLOCK
      ?auto_563705 - BLOCK
      ?auto_563706 - BLOCK
    )
    :vars
    (
      ?auto_563707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563706 ?auto_563707 ) ( ON-TABLE ?auto_563692 ) ( ON ?auto_563693 ?auto_563692 ) ( ON ?auto_563694 ?auto_563693 ) ( ON ?auto_563695 ?auto_563694 ) ( ON ?auto_563696 ?auto_563695 ) ( ON ?auto_563697 ?auto_563696 ) ( ON ?auto_563698 ?auto_563697 ) ( ON ?auto_563699 ?auto_563698 ) ( not ( = ?auto_563692 ?auto_563693 ) ) ( not ( = ?auto_563692 ?auto_563694 ) ) ( not ( = ?auto_563692 ?auto_563695 ) ) ( not ( = ?auto_563692 ?auto_563696 ) ) ( not ( = ?auto_563692 ?auto_563697 ) ) ( not ( = ?auto_563692 ?auto_563698 ) ) ( not ( = ?auto_563692 ?auto_563699 ) ) ( not ( = ?auto_563692 ?auto_563700 ) ) ( not ( = ?auto_563692 ?auto_563701 ) ) ( not ( = ?auto_563692 ?auto_563702 ) ) ( not ( = ?auto_563692 ?auto_563703 ) ) ( not ( = ?auto_563692 ?auto_563704 ) ) ( not ( = ?auto_563692 ?auto_563705 ) ) ( not ( = ?auto_563692 ?auto_563706 ) ) ( not ( = ?auto_563692 ?auto_563707 ) ) ( not ( = ?auto_563693 ?auto_563694 ) ) ( not ( = ?auto_563693 ?auto_563695 ) ) ( not ( = ?auto_563693 ?auto_563696 ) ) ( not ( = ?auto_563693 ?auto_563697 ) ) ( not ( = ?auto_563693 ?auto_563698 ) ) ( not ( = ?auto_563693 ?auto_563699 ) ) ( not ( = ?auto_563693 ?auto_563700 ) ) ( not ( = ?auto_563693 ?auto_563701 ) ) ( not ( = ?auto_563693 ?auto_563702 ) ) ( not ( = ?auto_563693 ?auto_563703 ) ) ( not ( = ?auto_563693 ?auto_563704 ) ) ( not ( = ?auto_563693 ?auto_563705 ) ) ( not ( = ?auto_563693 ?auto_563706 ) ) ( not ( = ?auto_563693 ?auto_563707 ) ) ( not ( = ?auto_563694 ?auto_563695 ) ) ( not ( = ?auto_563694 ?auto_563696 ) ) ( not ( = ?auto_563694 ?auto_563697 ) ) ( not ( = ?auto_563694 ?auto_563698 ) ) ( not ( = ?auto_563694 ?auto_563699 ) ) ( not ( = ?auto_563694 ?auto_563700 ) ) ( not ( = ?auto_563694 ?auto_563701 ) ) ( not ( = ?auto_563694 ?auto_563702 ) ) ( not ( = ?auto_563694 ?auto_563703 ) ) ( not ( = ?auto_563694 ?auto_563704 ) ) ( not ( = ?auto_563694 ?auto_563705 ) ) ( not ( = ?auto_563694 ?auto_563706 ) ) ( not ( = ?auto_563694 ?auto_563707 ) ) ( not ( = ?auto_563695 ?auto_563696 ) ) ( not ( = ?auto_563695 ?auto_563697 ) ) ( not ( = ?auto_563695 ?auto_563698 ) ) ( not ( = ?auto_563695 ?auto_563699 ) ) ( not ( = ?auto_563695 ?auto_563700 ) ) ( not ( = ?auto_563695 ?auto_563701 ) ) ( not ( = ?auto_563695 ?auto_563702 ) ) ( not ( = ?auto_563695 ?auto_563703 ) ) ( not ( = ?auto_563695 ?auto_563704 ) ) ( not ( = ?auto_563695 ?auto_563705 ) ) ( not ( = ?auto_563695 ?auto_563706 ) ) ( not ( = ?auto_563695 ?auto_563707 ) ) ( not ( = ?auto_563696 ?auto_563697 ) ) ( not ( = ?auto_563696 ?auto_563698 ) ) ( not ( = ?auto_563696 ?auto_563699 ) ) ( not ( = ?auto_563696 ?auto_563700 ) ) ( not ( = ?auto_563696 ?auto_563701 ) ) ( not ( = ?auto_563696 ?auto_563702 ) ) ( not ( = ?auto_563696 ?auto_563703 ) ) ( not ( = ?auto_563696 ?auto_563704 ) ) ( not ( = ?auto_563696 ?auto_563705 ) ) ( not ( = ?auto_563696 ?auto_563706 ) ) ( not ( = ?auto_563696 ?auto_563707 ) ) ( not ( = ?auto_563697 ?auto_563698 ) ) ( not ( = ?auto_563697 ?auto_563699 ) ) ( not ( = ?auto_563697 ?auto_563700 ) ) ( not ( = ?auto_563697 ?auto_563701 ) ) ( not ( = ?auto_563697 ?auto_563702 ) ) ( not ( = ?auto_563697 ?auto_563703 ) ) ( not ( = ?auto_563697 ?auto_563704 ) ) ( not ( = ?auto_563697 ?auto_563705 ) ) ( not ( = ?auto_563697 ?auto_563706 ) ) ( not ( = ?auto_563697 ?auto_563707 ) ) ( not ( = ?auto_563698 ?auto_563699 ) ) ( not ( = ?auto_563698 ?auto_563700 ) ) ( not ( = ?auto_563698 ?auto_563701 ) ) ( not ( = ?auto_563698 ?auto_563702 ) ) ( not ( = ?auto_563698 ?auto_563703 ) ) ( not ( = ?auto_563698 ?auto_563704 ) ) ( not ( = ?auto_563698 ?auto_563705 ) ) ( not ( = ?auto_563698 ?auto_563706 ) ) ( not ( = ?auto_563698 ?auto_563707 ) ) ( not ( = ?auto_563699 ?auto_563700 ) ) ( not ( = ?auto_563699 ?auto_563701 ) ) ( not ( = ?auto_563699 ?auto_563702 ) ) ( not ( = ?auto_563699 ?auto_563703 ) ) ( not ( = ?auto_563699 ?auto_563704 ) ) ( not ( = ?auto_563699 ?auto_563705 ) ) ( not ( = ?auto_563699 ?auto_563706 ) ) ( not ( = ?auto_563699 ?auto_563707 ) ) ( not ( = ?auto_563700 ?auto_563701 ) ) ( not ( = ?auto_563700 ?auto_563702 ) ) ( not ( = ?auto_563700 ?auto_563703 ) ) ( not ( = ?auto_563700 ?auto_563704 ) ) ( not ( = ?auto_563700 ?auto_563705 ) ) ( not ( = ?auto_563700 ?auto_563706 ) ) ( not ( = ?auto_563700 ?auto_563707 ) ) ( not ( = ?auto_563701 ?auto_563702 ) ) ( not ( = ?auto_563701 ?auto_563703 ) ) ( not ( = ?auto_563701 ?auto_563704 ) ) ( not ( = ?auto_563701 ?auto_563705 ) ) ( not ( = ?auto_563701 ?auto_563706 ) ) ( not ( = ?auto_563701 ?auto_563707 ) ) ( not ( = ?auto_563702 ?auto_563703 ) ) ( not ( = ?auto_563702 ?auto_563704 ) ) ( not ( = ?auto_563702 ?auto_563705 ) ) ( not ( = ?auto_563702 ?auto_563706 ) ) ( not ( = ?auto_563702 ?auto_563707 ) ) ( not ( = ?auto_563703 ?auto_563704 ) ) ( not ( = ?auto_563703 ?auto_563705 ) ) ( not ( = ?auto_563703 ?auto_563706 ) ) ( not ( = ?auto_563703 ?auto_563707 ) ) ( not ( = ?auto_563704 ?auto_563705 ) ) ( not ( = ?auto_563704 ?auto_563706 ) ) ( not ( = ?auto_563704 ?auto_563707 ) ) ( not ( = ?auto_563705 ?auto_563706 ) ) ( not ( = ?auto_563705 ?auto_563707 ) ) ( not ( = ?auto_563706 ?auto_563707 ) ) ( ON ?auto_563705 ?auto_563706 ) ( ON ?auto_563704 ?auto_563705 ) ( ON ?auto_563703 ?auto_563704 ) ( ON ?auto_563702 ?auto_563703 ) ( ON ?auto_563701 ?auto_563702 ) ( CLEAR ?auto_563699 ) ( ON ?auto_563700 ?auto_563701 ) ( CLEAR ?auto_563700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_563692 ?auto_563693 ?auto_563694 ?auto_563695 ?auto_563696 ?auto_563697 ?auto_563698 ?auto_563699 ?auto_563700 )
      ( MAKE-15PILE ?auto_563692 ?auto_563693 ?auto_563694 ?auto_563695 ?auto_563696 ?auto_563697 ?auto_563698 ?auto_563699 ?auto_563700 ?auto_563701 ?auto_563702 ?auto_563703 ?auto_563704 ?auto_563705 ?auto_563706 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563754 - BLOCK
      ?auto_563755 - BLOCK
      ?auto_563756 - BLOCK
      ?auto_563757 - BLOCK
      ?auto_563758 - BLOCK
      ?auto_563759 - BLOCK
      ?auto_563760 - BLOCK
      ?auto_563761 - BLOCK
      ?auto_563762 - BLOCK
      ?auto_563763 - BLOCK
      ?auto_563764 - BLOCK
      ?auto_563765 - BLOCK
      ?auto_563766 - BLOCK
      ?auto_563767 - BLOCK
      ?auto_563768 - BLOCK
    )
    :vars
    (
      ?auto_563769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563768 ?auto_563769 ) ( ON-TABLE ?auto_563754 ) ( ON ?auto_563755 ?auto_563754 ) ( ON ?auto_563756 ?auto_563755 ) ( ON ?auto_563757 ?auto_563756 ) ( ON ?auto_563758 ?auto_563757 ) ( ON ?auto_563759 ?auto_563758 ) ( ON ?auto_563760 ?auto_563759 ) ( not ( = ?auto_563754 ?auto_563755 ) ) ( not ( = ?auto_563754 ?auto_563756 ) ) ( not ( = ?auto_563754 ?auto_563757 ) ) ( not ( = ?auto_563754 ?auto_563758 ) ) ( not ( = ?auto_563754 ?auto_563759 ) ) ( not ( = ?auto_563754 ?auto_563760 ) ) ( not ( = ?auto_563754 ?auto_563761 ) ) ( not ( = ?auto_563754 ?auto_563762 ) ) ( not ( = ?auto_563754 ?auto_563763 ) ) ( not ( = ?auto_563754 ?auto_563764 ) ) ( not ( = ?auto_563754 ?auto_563765 ) ) ( not ( = ?auto_563754 ?auto_563766 ) ) ( not ( = ?auto_563754 ?auto_563767 ) ) ( not ( = ?auto_563754 ?auto_563768 ) ) ( not ( = ?auto_563754 ?auto_563769 ) ) ( not ( = ?auto_563755 ?auto_563756 ) ) ( not ( = ?auto_563755 ?auto_563757 ) ) ( not ( = ?auto_563755 ?auto_563758 ) ) ( not ( = ?auto_563755 ?auto_563759 ) ) ( not ( = ?auto_563755 ?auto_563760 ) ) ( not ( = ?auto_563755 ?auto_563761 ) ) ( not ( = ?auto_563755 ?auto_563762 ) ) ( not ( = ?auto_563755 ?auto_563763 ) ) ( not ( = ?auto_563755 ?auto_563764 ) ) ( not ( = ?auto_563755 ?auto_563765 ) ) ( not ( = ?auto_563755 ?auto_563766 ) ) ( not ( = ?auto_563755 ?auto_563767 ) ) ( not ( = ?auto_563755 ?auto_563768 ) ) ( not ( = ?auto_563755 ?auto_563769 ) ) ( not ( = ?auto_563756 ?auto_563757 ) ) ( not ( = ?auto_563756 ?auto_563758 ) ) ( not ( = ?auto_563756 ?auto_563759 ) ) ( not ( = ?auto_563756 ?auto_563760 ) ) ( not ( = ?auto_563756 ?auto_563761 ) ) ( not ( = ?auto_563756 ?auto_563762 ) ) ( not ( = ?auto_563756 ?auto_563763 ) ) ( not ( = ?auto_563756 ?auto_563764 ) ) ( not ( = ?auto_563756 ?auto_563765 ) ) ( not ( = ?auto_563756 ?auto_563766 ) ) ( not ( = ?auto_563756 ?auto_563767 ) ) ( not ( = ?auto_563756 ?auto_563768 ) ) ( not ( = ?auto_563756 ?auto_563769 ) ) ( not ( = ?auto_563757 ?auto_563758 ) ) ( not ( = ?auto_563757 ?auto_563759 ) ) ( not ( = ?auto_563757 ?auto_563760 ) ) ( not ( = ?auto_563757 ?auto_563761 ) ) ( not ( = ?auto_563757 ?auto_563762 ) ) ( not ( = ?auto_563757 ?auto_563763 ) ) ( not ( = ?auto_563757 ?auto_563764 ) ) ( not ( = ?auto_563757 ?auto_563765 ) ) ( not ( = ?auto_563757 ?auto_563766 ) ) ( not ( = ?auto_563757 ?auto_563767 ) ) ( not ( = ?auto_563757 ?auto_563768 ) ) ( not ( = ?auto_563757 ?auto_563769 ) ) ( not ( = ?auto_563758 ?auto_563759 ) ) ( not ( = ?auto_563758 ?auto_563760 ) ) ( not ( = ?auto_563758 ?auto_563761 ) ) ( not ( = ?auto_563758 ?auto_563762 ) ) ( not ( = ?auto_563758 ?auto_563763 ) ) ( not ( = ?auto_563758 ?auto_563764 ) ) ( not ( = ?auto_563758 ?auto_563765 ) ) ( not ( = ?auto_563758 ?auto_563766 ) ) ( not ( = ?auto_563758 ?auto_563767 ) ) ( not ( = ?auto_563758 ?auto_563768 ) ) ( not ( = ?auto_563758 ?auto_563769 ) ) ( not ( = ?auto_563759 ?auto_563760 ) ) ( not ( = ?auto_563759 ?auto_563761 ) ) ( not ( = ?auto_563759 ?auto_563762 ) ) ( not ( = ?auto_563759 ?auto_563763 ) ) ( not ( = ?auto_563759 ?auto_563764 ) ) ( not ( = ?auto_563759 ?auto_563765 ) ) ( not ( = ?auto_563759 ?auto_563766 ) ) ( not ( = ?auto_563759 ?auto_563767 ) ) ( not ( = ?auto_563759 ?auto_563768 ) ) ( not ( = ?auto_563759 ?auto_563769 ) ) ( not ( = ?auto_563760 ?auto_563761 ) ) ( not ( = ?auto_563760 ?auto_563762 ) ) ( not ( = ?auto_563760 ?auto_563763 ) ) ( not ( = ?auto_563760 ?auto_563764 ) ) ( not ( = ?auto_563760 ?auto_563765 ) ) ( not ( = ?auto_563760 ?auto_563766 ) ) ( not ( = ?auto_563760 ?auto_563767 ) ) ( not ( = ?auto_563760 ?auto_563768 ) ) ( not ( = ?auto_563760 ?auto_563769 ) ) ( not ( = ?auto_563761 ?auto_563762 ) ) ( not ( = ?auto_563761 ?auto_563763 ) ) ( not ( = ?auto_563761 ?auto_563764 ) ) ( not ( = ?auto_563761 ?auto_563765 ) ) ( not ( = ?auto_563761 ?auto_563766 ) ) ( not ( = ?auto_563761 ?auto_563767 ) ) ( not ( = ?auto_563761 ?auto_563768 ) ) ( not ( = ?auto_563761 ?auto_563769 ) ) ( not ( = ?auto_563762 ?auto_563763 ) ) ( not ( = ?auto_563762 ?auto_563764 ) ) ( not ( = ?auto_563762 ?auto_563765 ) ) ( not ( = ?auto_563762 ?auto_563766 ) ) ( not ( = ?auto_563762 ?auto_563767 ) ) ( not ( = ?auto_563762 ?auto_563768 ) ) ( not ( = ?auto_563762 ?auto_563769 ) ) ( not ( = ?auto_563763 ?auto_563764 ) ) ( not ( = ?auto_563763 ?auto_563765 ) ) ( not ( = ?auto_563763 ?auto_563766 ) ) ( not ( = ?auto_563763 ?auto_563767 ) ) ( not ( = ?auto_563763 ?auto_563768 ) ) ( not ( = ?auto_563763 ?auto_563769 ) ) ( not ( = ?auto_563764 ?auto_563765 ) ) ( not ( = ?auto_563764 ?auto_563766 ) ) ( not ( = ?auto_563764 ?auto_563767 ) ) ( not ( = ?auto_563764 ?auto_563768 ) ) ( not ( = ?auto_563764 ?auto_563769 ) ) ( not ( = ?auto_563765 ?auto_563766 ) ) ( not ( = ?auto_563765 ?auto_563767 ) ) ( not ( = ?auto_563765 ?auto_563768 ) ) ( not ( = ?auto_563765 ?auto_563769 ) ) ( not ( = ?auto_563766 ?auto_563767 ) ) ( not ( = ?auto_563766 ?auto_563768 ) ) ( not ( = ?auto_563766 ?auto_563769 ) ) ( not ( = ?auto_563767 ?auto_563768 ) ) ( not ( = ?auto_563767 ?auto_563769 ) ) ( not ( = ?auto_563768 ?auto_563769 ) ) ( ON ?auto_563767 ?auto_563768 ) ( ON ?auto_563766 ?auto_563767 ) ( ON ?auto_563765 ?auto_563766 ) ( ON ?auto_563764 ?auto_563765 ) ( ON ?auto_563763 ?auto_563764 ) ( ON ?auto_563762 ?auto_563763 ) ( CLEAR ?auto_563760 ) ( ON ?auto_563761 ?auto_563762 ) ( CLEAR ?auto_563761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_563754 ?auto_563755 ?auto_563756 ?auto_563757 ?auto_563758 ?auto_563759 ?auto_563760 ?auto_563761 )
      ( MAKE-15PILE ?auto_563754 ?auto_563755 ?auto_563756 ?auto_563757 ?auto_563758 ?auto_563759 ?auto_563760 ?auto_563761 ?auto_563762 ?auto_563763 ?auto_563764 ?auto_563765 ?auto_563766 ?auto_563767 ?auto_563768 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563816 - BLOCK
      ?auto_563817 - BLOCK
      ?auto_563818 - BLOCK
      ?auto_563819 - BLOCK
      ?auto_563820 - BLOCK
      ?auto_563821 - BLOCK
      ?auto_563822 - BLOCK
      ?auto_563823 - BLOCK
      ?auto_563824 - BLOCK
      ?auto_563825 - BLOCK
      ?auto_563826 - BLOCK
      ?auto_563827 - BLOCK
      ?auto_563828 - BLOCK
      ?auto_563829 - BLOCK
      ?auto_563830 - BLOCK
    )
    :vars
    (
      ?auto_563831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563830 ?auto_563831 ) ( ON-TABLE ?auto_563816 ) ( ON ?auto_563817 ?auto_563816 ) ( ON ?auto_563818 ?auto_563817 ) ( ON ?auto_563819 ?auto_563818 ) ( ON ?auto_563820 ?auto_563819 ) ( ON ?auto_563821 ?auto_563820 ) ( not ( = ?auto_563816 ?auto_563817 ) ) ( not ( = ?auto_563816 ?auto_563818 ) ) ( not ( = ?auto_563816 ?auto_563819 ) ) ( not ( = ?auto_563816 ?auto_563820 ) ) ( not ( = ?auto_563816 ?auto_563821 ) ) ( not ( = ?auto_563816 ?auto_563822 ) ) ( not ( = ?auto_563816 ?auto_563823 ) ) ( not ( = ?auto_563816 ?auto_563824 ) ) ( not ( = ?auto_563816 ?auto_563825 ) ) ( not ( = ?auto_563816 ?auto_563826 ) ) ( not ( = ?auto_563816 ?auto_563827 ) ) ( not ( = ?auto_563816 ?auto_563828 ) ) ( not ( = ?auto_563816 ?auto_563829 ) ) ( not ( = ?auto_563816 ?auto_563830 ) ) ( not ( = ?auto_563816 ?auto_563831 ) ) ( not ( = ?auto_563817 ?auto_563818 ) ) ( not ( = ?auto_563817 ?auto_563819 ) ) ( not ( = ?auto_563817 ?auto_563820 ) ) ( not ( = ?auto_563817 ?auto_563821 ) ) ( not ( = ?auto_563817 ?auto_563822 ) ) ( not ( = ?auto_563817 ?auto_563823 ) ) ( not ( = ?auto_563817 ?auto_563824 ) ) ( not ( = ?auto_563817 ?auto_563825 ) ) ( not ( = ?auto_563817 ?auto_563826 ) ) ( not ( = ?auto_563817 ?auto_563827 ) ) ( not ( = ?auto_563817 ?auto_563828 ) ) ( not ( = ?auto_563817 ?auto_563829 ) ) ( not ( = ?auto_563817 ?auto_563830 ) ) ( not ( = ?auto_563817 ?auto_563831 ) ) ( not ( = ?auto_563818 ?auto_563819 ) ) ( not ( = ?auto_563818 ?auto_563820 ) ) ( not ( = ?auto_563818 ?auto_563821 ) ) ( not ( = ?auto_563818 ?auto_563822 ) ) ( not ( = ?auto_563818 ?auto_563823 ) ) ( not ( = ?auto_563818 ?auto_563824 ) ) ( not ( = ?auto_563818 ?auto_563825 ) ) ( not ( = ?auto_563818 ?auto_563826 ) ) ( not ( = ?auto_563818 ?auto_563827 ) ) ( not ( = ?auto_563818 ?auto_563828 ) ) ( not ( = ?auto_563818 ?auto_563829 ) ) ( not ( = ?auto_563818 ?auto_563830 ) ) ( not ( = ?auto_563818 ?auto_563831 ) ) ( not ( = ?auto_563819 ?auto_563820 ) ) ( not ( = ?auto_563819 ?auto_563821 ) ) ( not ( = ?auto_563819 ?auto_563822 ) ) ( not ( = ?auto_563819 ?auto_563823 ) ) ( not ( = ?auto_563819 ?auto_563824 ) ) ( not ( = ?auto_563819 ?auto_563825 ) ) ( not ( = ?auto_563819 ?auto_563826 ) ) ( not ( = ?auto_563819 ?auto_563827 ) ) ( not ( = ?auto_563819 ?auto_563828 ) ) ( not ( = ?auto_563819 ?auto_563829 ) ) ( not ( = ?auto_563819 ?auto_563830 ) ) ( not ( = ?auto_563819 ?auto_563831 ) ) ( not ( = ?auto_563820 ?auto_563821 ) ) ( not ( = ?auto_563820 ?auto_563822 ) ) ( not ( = ?auto_563820 ?auto_563823 ) ) ( not ( = ?auto_563820 ?auto_563824 ) ) ( not ( = ?auto_563820 ?auto_563825 ) ) ( not ( = ?auto_563820 ?auto_563826 ) ) ( not ( = ?auto_563820 ?auto_563827 ) ) ( not ( = ?auto_563820 ?auto_563828 ) ) ( not ( = ?auto_563820 ?auto_563829 ) ) ( not ( = ?auto_563820 ?auto_563830 ) ) ( not ( = ?auto_563820 ?auto_563831 ) ) ( not ( = ?auto_563821 ?auto_563822 ) ) ( not ( = ?auto_563821 ?auto_563823 ) ) ( not ( = ?auto_563821 ?auto_563824 ) ) ( not ( = ?auto_563821 ?auto_563825 ) ) ( not ( = ?auto_563821 ?auto_563826 ) ) ( not ( = ?auto_563821 ?auto_563827 ) ) ( not ( = ?auto_563821 ?auto_563828 ) ) ( not ( = ?auto_563821 ?auto_563829 ) ) ( not ( = ?auto_563821 ?auto_563830 ) ) ( not ( = ?auto_563821 ?auto_563831 ) ) ( not ( = ?auto_563822 ?auto_563823 ) ) ( not ( = ?auto_563822 ?auto_563824 ) ) ( not ( = ?auto_563822 ?auto_563825 ) ) ( not ( = ?auto_563822 ?auto_563826 ) ) ( not ( = ?auto_563822 ?auto_563827 ) ) ( not ( = ?auto_563822 ?auto_563828 ) ) ( not ( = ?auto_563822 ?auto_563829 ) ) ( not ( = ?auto_563822 ?auto_563830 ) ) ( not ( = ?auto_563822 ?auto_563831 ) ) ( not ( = ?auto_563823 ?auto_563824 ) ) ( not ( = ?auto_563823 ?auto_563825 ) ) ( not ( = ?auto_563823 ?auto_563826 ) ) ( not ( = ?auto_563823 ?auto_563827 ) ) ( not ( = ?auto_563823 ?auto_563828 ) ) ( not ( = ?auto_563823 ?auto_563829 ) ) ( not ( = ?auto_563823 ?auto_563830 ) ) ( not ( = ?auto_563823 ?auto_563831 ) ) ( not ( = ?auto_563824 ?auto_563825 ) ) ( not ( = ?auto_563824 ?auto_563826 ) ) ( not ( = ?auto_563824 ?auto_563827 ) ) ( not ( = ?auto_563824 ?auto_563828 ) ) ( not ( = ?auto_563824 ?auto_563829 ) ) ( not ( = ?auto_563824 ?auto_563830 ) ) ( not ( = ?auto_563824 ?auto_563831 ) ) ( not ( = ?auto_563825 ?auto_563826 ) ) ( not ( = ?auto_563825 ?auto_563827 ) ) ( not ( = ?auto_563825 ?auto_563828 ) ) ( not ( = ?auto_563825 ?auto_563829 ) ) ( not ( = ?auto_563825 ?auto_563830 ) ) ( not ( = ?auto_563825 ?auto_563831 ) ) ( not ( = ?auto_563826 ?auto_563827 ) ) ( not ( = ?auto_563826 ?auto_563828 ) ) ( not ( = ?auto_563826 ?auto_563829 ) ) ( not ( = ?auto_563826 ?auto_563830 ) ) ( not ( = ?auto_563826 ?auto_563831 ) ) ( not ( = ?auto_563827 ?auto_563828 ) ) ( not ( = ?auto_563827 ?auto_563829 ) ) ( not ( = ?auto_563827 ?auto_563830 ) ) ( not ( = ?auto_563827 ?auto_563831 ) ) ( not ( = ?auto_563828 ?auto_563829 ) ) ( not ( = ?auto_563828 ?auto_563830 ) ) ( not ( = ?auto_563828 ?auto_563831 ) ) ( not ( = ?auto_563829 ?auto_563830 ) ) ( not ( = ?auto_563829 ?auto_563831 ) ) ( not ( = ?auto_563830 ?auto_563831 ) ) ( ON ?auto_563829 ?auto_563830 ) ( ON ?auto_563828 ?auto_563829 ) ( ON ?auto_563827 ?auto_563828 ) ( ON ?auto_563826 ?auto_563827 ) ( ON ?auto_563825 ?auto_563826 ) ( ON ?auto_563824 ?auto_563825 ) ( ON ?auto_563823 ?auto_563824 ) ( CLEAR ?auto_563821 ) ( ON ?auto_563822 ?auto_563823 ) ( CLEAR ?auto_563822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_563816 ?auto_563817 ?auto_563818 ?auto_563819 ?auto_563820 ?auto_563821 ?auto_563822 )
      ( MAKE-15PILE ?auto_563816 ?auto_563817 ?auto_563818 ?auto_563819 ?auto_563820 ?auto_563821 ?auto_563822 ?auto_563823 ?auto_563824 ?auto_563825 ?auto_563826 ?auto_563827 ?auto_563828 ?auto_563829 ?auto_563830 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563878 - BLOCK
      ?auto_563879 - BLOCK
      ?auto_563880 - BLOCK
      ?auto_563881 - BLOCK
      ?auto_563882 - BLOCK
      ?auto_563883 - BLOCK
      ?auto_563884 - BLOCK
      ?auto_563885 - BLOCK
      ?auto_563886 - BLOCK
      ?auto_563887 - BLOCK
      ?auto_563888 - BLOCK
      ?auto_563889 - BLOCK
      ?auto_563890 - BLOCK
      ?auto_563891 - BLOCK
      ?auto_563892 - BLOCK
    )
    :vars
    (
      ?auto_563893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563892 ?auto_563893 ) ( ON-TABLE ?auto_563878 ) ( ON ?auto_563879 ?auto_563878 ) ( ON ?auto_563880 ?auto_563879 ) ( ON ?auto_563881 ?auto_563880 ) ( ON ?auto_563882 ?auto_563881 ) ( not ( = ?auto_563878 ?auto_563879 ) ) ( not ( = ?auto_563878 ?auto_563880 ) ) ( not ( = ?auto_563878 ?auto_563881 ) ) ( not ( = ?auto_563878 ?auto_563882 ) ) ( not ( = ?auto_563878 ?auto_563883 ) ) ( not ( = ?auto_563878 ?auto_563884 ) ) ( not ( = ?auto_563878 ?auto_563885 ) ) ( not ( = ?auto_563878 ?auto_563886 ) ) ( not ( = ?auto_563878 ?auto_563887 ) ) ( not ( = ?auto_563878 ?auto_563888 ) ) ( not ( = ?auto_563878 ?auto_563889 ) ) ( not ( = ?auto_563878 ?auto_563890 ) ) ( not ( = ?auto_563878 ?auto_563891 ) ) ( not ( = ?auto_563878 ?auto_563892 ) ) ( not ( = ?auto_563878 ?auto_563893 ) ) ( not ( = ?auto_563879 ?auto_563880 ) ) ( not ( = ?auto_563879 ?auto_563881 ) ) ( not ( = ?auto_563879 ?auto_563882 ) ) ( not ( = ?auto_563879 ?auto_563883 ) ) ( not ( = ?auto_563879 ?auto_563884 ) ) ( not ( = ?auto_563879 ?auto_563885 ) ) ( not ( = ?auto_563879 ?auto_563886 ) ) ( not ( = ?auto_563879 ?auto_563887 ) ) ( not ( = ?auto_563879 ?auto_563888 ) ) ( not ( = ?auto_563879 ?auto_563889 ) ) ( not ( = ?auto_563879 ?auto_563890 ) ) ( not ( = ?auto_563879 ?auto_563891 ) ) ( not ( = ?auto_563879 ?auto_563892 ) ) ( not ( = ?auto_563879 ?auto_563893 ) ) ( not ( = ?auto_563880 ?auto_563881 ) ) ( not ( = ?auto_563880 ?auto_563882 ) ) ( not ( = ?auto_563880 ?auto_563883 ) ) ( not ( = ?auto_563880 ?auto_563884 ) ) ( not ( = ?auto_563880 ?auto_563885 ) ) ( not ( = ?auto_563880 ?auto_563886 ) ) ( not ( = ?auto_563880 ?auto_563887 ) ) ( not ( = ?auto_563880 ?auto_563888 ) ) ( not ( = ?auto_563880 ?auto_563889 ) ) ( not ( = ?auto_563880 ?auto_563890 ) ) ( not ( = ?auto_563880 ?auto_563891 ) ) ( not ( = ?auto_563880 ?auto_563892 ) ) ( not ( = ?auto_563880 ?auto_563893 ) ) ( not ( = ?auto_563881 ?auto_563882 ) ) ( not ( = ?auto_563881 ?auto_563883 ) ) ( not ( = ?auto_563881 ?auto_563884 ) ) ( not ( = ?auto_563881 ?auto_563885 ) ) ( not ( = ?auto_563881 ?auto_563886 ) ) ( not ( = ?auto_563881 ?auto_563887 ) ) ( not ( = ?auto_563881 ?auto_563888 ) ) ( not ( = ?auto_563881 ?auto_563889 ) ) ( not ( = ?auto_563881 ?auto_563890 ) ) ( not ( = ?auto_563881 ?auto_563891 ) ) ( not ( = ?auto_563881 ?auto_563892 ) ) ( not ( = ?auto_563881 ?auto_563893 ) ) ( not ( = ?auto_563882 ?auto_563883 ) ) ( not ( = ?auto_563882 ?auto_563884 ) ) ( not ( = ?auto_563882 ?auto_563885 ) ) ( not ( = ?auto_563882 ?auto_563886 ) ) ( not ( = ?auto_563882 ?auto_563887 ) ) ( not ( = ?auto_563882 ?auto_563888 ) ) ( not ( = ?auto_563882 ?auto_563889 ) ) ( not ( = ?auto_563882 ?auto_563890 ) ) ( not ( = ?auto_563882 ?auto_563891 ) ) ( not ( = ?auto_563882 ?auto_563892 ) ) ( not ( = ?auto_563882 ?auto_563893 ) ) ( not ( = ?auto_563883 ?auto_563884 ) ) ( not ( = ?auto_563883 ?auto_563885 ) ) ( not ( = ?auto_563883 ?auto_563886 ) ) ( not ( = ?auto_563883 ?auto_563887 ) ) ( not ( = ?auto_563883 ?auto_563888 ) ) ( not ( = ?auto_563883 ?auto_563889 ) ) ( not ( = ?auto_563883 ?auto_563890 ) ) ( not ( = ?auto_563883 ?auto_563891 ) ) ( not ( = ?auto_563883 ?auto_563892 ) ) ( not ( = ?auto_563883 ?auto_563893 ) ) ( not ( = ?auto_563884 ?auto_563885 ) ) ( not ( = ?auto_563884 ?auto_563886 ) ) ( not ( = ?auto_563884 ?auto_563887 ) ) ( not ( = ?auto_563884 ?auto_563888 ) ) ( not ( = ?auto_563884 ?auto_563889 ) ) ( not ( = ?auto_563884 ?auto_563890 ) ) ( not ( = ?auto_563884 ?auto_563891 ) ) ( not ( = ?auto_563884 ?auto_563892 ) ) ( not ( = ?auto_563884 ?auto_563893 ) ) ( not ( = ?auto_563885 ?auto_563886 ) ) ( not ( = ?auto_563885 ?auto_563887 ) ) ( not ( = ?auto_563885 ?auto_563888 ) ) ( not ( = ?auto_563885 ?auto_563889 ) ) ( not ( = ?auto_563885 ?auto_563890 ) ) ( not ( = ?auto_563885 ?auto_563891 ) ) ( not ( = ?auto_563885 ?auto_563892 ) ) ( not ( = ?auto_563885 ?auto_563893 ) ) ( not ( = ?auto_563886 ?auto_563887 ) ) ( not ( = ?auto_563886 ?auto_563888 ) ) ( not ( = ?auto_563886 ?auto_563889 ) ) ( not ( = ?auto_563886 ?auto_563890 ) ) ( not ( = ?auto_563886 ?auto_563891 ) ) ( not ( = ?auto_563886 ?auto_563892 ) ) ( not ( = ?auto_563886 ?auto_563893 ) ) ( not ( = ?auto_563887 ?auto_563888 ) ) ( not ( = ?auto_563887 ?auto_563889 ) ) ( not ( = ?auto_563887 ?auto_563890 ) ) ( not ( = ?auto_563887 ?auto_563891 ) ) ( not ( = ?auto_563887 ?auto_563892 ) ) ( not ( = ?auto_563887 ?auto_563893 ) ) ( not ( = ?auto_563888 ?auto_563889 ) ) ( not ( = ?auto_563888 ?auto_563890 ) ) ( not ( = ?auto_563888 ?auto_563891 ) ) ( not ( = ?auto_563888 ?auto_563892 ) ) ( not ( = ?auto_563888 ?auto_563893 ) ) ( not ( = ?auto_563889 ?auto_563890 ) ) ( not ( = ?auto_563889 ?auto_563891 ) ) ( not ( = ?auto_563889 ?auto_563892 ) ) ( not ( = ?auto_563889 ?auto_563893 ) ) ( not ( = ?auto_563890 ?auto_563891 ) ) ( not ( = ?auto_563890 ?auto_563892 ) ) ( not ( = ?auto_563890 ?auto_563893 ) ) ( not ( = ?auto_563891 ?auto_563892 ) ) ( not ( = ?auto_563891 ?auto_563893 ) ) ( not ( = ?auto_563892 ?auto_563893 ) ) ( ON ?auto_563891 ?auto_563892 ) ( ON ?auto_563890 ?auto_563891 ) ( ON ?auto_563889 ?auto_563890 ) ( ON ?auto_563888 ?auto_563889 ) ( ON ?auto_563887 ?auto_563888 ) ( ON ?auto_563886 ?auto_563887 ) ( ON ?auto_563885 ?auto_563886 ) ( ON ?auto_563884 ?auto_563885 ) ( CLEAR ?auto_563882 ) ( ON ?auto_563883 ?auto_563884 ) ( CLEAR ?auto_563883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_563878 ?auto_563879 ?auto_563880 ?auto_563881 ?auto_563882 ?auto_563883 )
      ( MAKE-15PILE ?auto_563878 ?auto_563879 ?auto_563880 ?auto_563881 ?auto_563882 ?auto_563883 ?auto_563884 ?auto_563885 ?auto_563886 ?auto_563887 ?auto_563888 ?auto_563889 ?auto_563890 ?auto_563891 ?auto_563892 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_563940 - BLOCK
      ?auto_563941 - BLOCK
      ?auto_563942 - BLOCK
      ?auto_563943 - BLOCK
      ?auto_563944 - BLOCK
      ?auto_563945 - BLOCK
      ?auto_563946 - BLOCK
      ?auto_563947 - BLOCK
      ?auto_563948 - BLOCK
      ?auto_563949 - BLOCK
      ?auto_563950 - BLOCK
      ?auto_563951 - BLOCK
      ?auto_563952 - BLOCK
      ?auto_563953 - BLOCK
      ?auto_563954 - BLOCK
    )
    :vars
    (
      ?auto_563955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_563954 ?auto_563955 ) ( ON-TABLE ?auto_563940 ) ( ON ?auto_563941 ?auto_563940 ) ( ON ?auto_563942 ?auto_563941 ) ( ON ?auto_563943 ?auto_563942 ) ( not ( = ?auto_563940 ?auto_563941 ) ) ( not ( = ?auto_563940 ?auto_563942 ) ) ( not ( = ?auto_563940 ?auto_563943 ) ) ( not ( = ?auto_563940 ?auto_563944 ) ) ( not ( = ?auto_563940 ?auto_563945 ) ) ( not ( = ?auto_563940 ?auto_563946 ) ) ( not ( = ?auto_563940 ?auto_563947 ) ) ( not ( = ?auto_563940 ?auto_563948 ) ) ( not ( = ?auto_563940 ?auto_563949 ) ) ( not ( = ?auto_563940 ?auto_563950 ) ) ( not ( = ?auto_563940 ?auto_563951 ) ) ( not ( = ?auto_563940 ?auto_563952 ) ) ( not ( = ?auto_563940 ?auto_563953 ) ) ( not ( = ?auto_563940 ?auto_563954 ) ) ( not ( = ?auto_563940 ?auto_563955 ) ) ( not ( = ?auto_563941 ?auto_563942 ) ) ( not ( = ?auto_563941 ?auto_563943 ) ) ( not ( = ?auto_563941 ?auto_563944 ) ) ( not ( = ?auto_563941 ?auto_563945 ) ) ( not ( = ?auto_563941 ?auto_563946 ) ) ( not ( = ?auto_563941 ?auto_563947 ) ) ( not ( = ?auto_563941 ?auto_563948 ) ) ( not ( = ?auto_563941 ?auto_563949 ) ) ( not ( = ?auto_563941 ?auto_563950 ) ) ( not ( = ?auto_563941 ?auto_563951 ) ) ( not ( = ?auto_563941 ?auto_563952 ) ) ( not ( = ?auto_563941 ?auto_563953 ) ) ( not ( = ?auto_563941 ?auto_563954 ) ) ( not ( = ?auto_563941 ?auto_563955 ) ) ( not ( = ?auto_563942 ?auto_563943 ) ) ( not ( = ?auto_563942 ?auto_563944 ) ) ( not ( = ?auto_563942 ?auto_563945 ) ) ( not ( = ?auto_563942 ?auto_563946 ) ) ( not ( = ?auto_563942 ?auto_563947 ) ) ( not ( = ?auto_563942 ?auto_563948 ) ) ( not ( = ?auto_563942 ?auto_563949 ) ) ( not ( = ?auto_563942 ?auto_563950 ) ) ( not ( = ?auto_563942 ?auto_563951 ) ) ( not ( = ?auto_563942 ?auto_563952 ) ) ( not ( = ?auto_563942 ?auto_563953 ) ) ( not ( = ?auto_563942 ?auto_563954 ) ) ( not ( = ?auto_563942 ?auto_563955 ) ) ( not ( = ?auto_563943 ?auto_563944 ) ) ( not ( = ?auto_563943 ?auto_563945 ) ) ( not ( = ?auto_563943 ?auto_563946 ) ) ( not ( = ?auto_563943 ?auto_563947 ) ) ( not ( = ?auto_563943 ?auto_563948 ) ) ( not ( = ?auto_563943 ?auto_563949 ) ) ( not ( = ?auto_563943 ?auto_563950 ) ) ( not ( = ?auto_563943 ?auto_563951 ) ) ( not ( = ?auto_563943 ?auto_563952 ) ) ( not ( = ?auto_563943 ?auto_563953 ) ) ( not ( = ?auto_563943 ?auto_563954 ) ) ( not ( = ?auto_563943 ?auto_563955 ) ) ( not ( = ?auto_563944 ?auto_563945 ) ) ( not ( = ?auto_563944 ?auto_563946 ) ) ( not ( = ?auto_563944 ?auto_563947 ) ) ( not ( = ?auto_563944 ?auto_563948 ) ) ( not ( = ?auto_563944 ?auto_563949 ) ) ( not ( = ?auto_563944 ?auto_563950 ) ) ( not ( = ?auto_563944 ?auto_563951 ) ) ( not ( = ?auto_563944 ?auto_563952 ) ) ( not ( = ?auto_563944 ?auto_563953 ) ) ( not ( = ?auto_563944 ?auto_563954 ) ) ( not ( = ?auto_563944 ?auto_563955 ) ) ( not ( = ?auto_563945 ?auto_563946 ) ) ( not ( = ?auto_563945 ?auto_563947 ) ) ( not ( = ?auto_563945 ?auto_563948 ) ) ( not ( = ?auto_563945 ?auto_563949 ) ) ( not ( = ?auto_563945 ?auto_563950 ) ) ( not ( = ?auto_563945 ?auto_563951 ) ) ( not ( = ?auto_563945 ?auto_563952 ) ) ( not ( = ?auto_563945 ?auto_563953 ) ) ( not ( = ?auto_563945 ?auto_563954 ) ) ( not ( = ?auto_563945 ?auto_563955 ) ) ( not ( = ?auto_563946 ?auto_563947 ) ) ( not ( = ?auto_563946 ?auto_563948 ) ) ( not ( = ?auto_563946 ?auto_563949 ) ) ( not ( = ?auto_563946 ?auto_563950 ) ) ( not ( = ?auto_563946 ?auto_563951 ) ) ( not ( = ?auto_563946 ?auto_563952 ) ) ( not ( = ?auto_563946 ?auto_563953 ) ) ( not ( = ?auto_563946 ?auto_563954 ) ) ( not ( = ?auto_563946 ?auto_563955 ) ) ( not ( = ?auto_563947 ?auto_563948 ) ) ( not ( = ?auto_563947 ?auto_563949 ) ) ( not ( = ?auto_563947 ?auto_563950 ) ) ( not ( = ?auto_563947 ?auto_563951 ) ) ( not ( = ?auto_563947 ?auto_563952 ) ) ( not ( = ?auto_563947 ?auto_563953 ) ) ( not ( = ?auto_563947 ?auto_563954 ) ) ( not ( = ?auto_563947 ?auto_563955 ) ) ( not ( = ?auto_563948 ?auto_563949 ) ) ( not ( = ?auto_563948 ?auto_563950 ) ) ( not ( = ?auto_563948 ?auto_563951 ) ) ( not ( = ?auto_563948 ?auto_563952 ) ) ( not ( = ?auto_563948 ?auto_563953 ) ) ( not ( = ?auto_563948 ?auto_563954 ) ) ( not ( = ?auto_563948 ?auto_563955 ) ) ( not ( = ?auto_563949 ?auto_563950 ) ) ( not ( = ?auto_563949 ?auto_563951 ) ) ( not ( = ?auto_563949 ?auto_563952 ) ) ( not ( = ?auto_563949 ?auto_563953 ) ) ( not ( = ?auto_563949 ?auto_563954 ) ) ( not ( = ?auto_563949 ?auto_563955 ) ) ( not ( = ?auto_563950 ?auto_563951 ) ) ( not ( = ?auto_563950 ?auto_563952 ) ) ( not ( = ?auto_563950 ?auto_563953 ) ) ( not ( = ?auto_563950 ?auto_563954 ) ) ( not ( = ?auto_563950 ?auto_563955 ) ) ( not ( = ?auto_563951 ?auto_563952 ) ) ( not ( = ?auto_563951 ?auto_563953 ) ) ( not ( = ?auto_563951 ?auto_563954 ) ) ( not ( = ?auto_563951 ?auto_563955 ) ) ( not ( = ?auto_563952 ?auto_563953 ) ) ( not ( = ?auto_563952 ?auto_563954 ) ) ( not ( = ?auto_563952 ?auto_563955 ) ) ( not ( = ?auto_563953 ?auto_563954 ) ) ( not ( = ?auto_563953 ?auto_563955 ) ) ( not ( = ?auto_563954 ?auto_563955 ) ) ( ON ?auto_563953 ?auto_563954 ) ( ON ?auto_563952 ?auto_563953 ) ( ON ?auto_563951 ?auto_563952 ) ( ON ?auto_563950 ?auto_563951 ) ( ON ?auto_563949 ?auto_563950 ) ( ON ?auto_563948 ?auto_563949 ) ( ON ?auto_563947 ?auto_563948 ) ( ON ?auto_563946 ?auto_563947 ) ( ON ?auto_563945 ?auto_563946 ) ( CLEAR ?auto_563943 ) ( ON ?auto_563944 ?auto_563945 ) ( CLEAR ?auto_563944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_563940 ?auto_563941 ?auto_563942 ?auto_563943 ?auto_563944 )
      ( MAKE-15PILE ?auto_563940 ?auto_563941 ?auto_563942 ?auto_563943 ?auto_563944 ?auto_563945 ?auto_563946 ?auto_563947 ?auto_563948 ?auto_563949 ?auto_563950 ?auto_563951 ?auto_563952 ?auto_563953 ?auto_563954 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_564002 - BLOCK
      ?auto_564003 - BLOCK
      ?auto_564004 - BLOCK
      ?auto_564005 - BLOCK
      ?auto_564006 - BLOCK
      ?auto_564007 - BLOCK
      ?auto_564008 - BLOCK
      ?auto_564009 - BLOCK
      ?auto_564010 - BLOCK
      ?auto_564011 - BLOCK
      ?auto_564012 - BLOCK
      ?auto_564013 - BLOCK
      ?auto_564014 - BLOCK
      ?auto_564015 - BLOCK
      ?auto_564016 - BLOCK
    )
    :vars
    (
      ?auto_564017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564016 ?auto_564017 ) ( ON-TABLE ?auto_564002 ) ( ON ?auto_564003 ?auto_564002 ) ( ON ?auto_564004 ?auto_564003 ) ( not ( = ?auto_564002 ?auto_564003 ) ) ( not ( = ?auto_564002 ?auto_564004 ) ) ( not ( = ?auto_564002 ?auto_564005 ) ) ( not ( = ?auto_564002 ?auto_564006 ) ) ( not ( = ?auto_564002 ?auto_564007 ) ) ( not ( = ?auto_564002 ?auto_564008 ) ) ( not ( = ?auto_564002 ?auto_564009 ) ) ( not ( = ?auto_564002 ?auto_564010 ) ) ( not ( = ?auto_564002 ?auto_564011 ) ) ( not ( = ?auto_564002 ?auto_564012 ) ) ( not ( = ?auto_564002 ?auto_564013 ) ) ( not ( = ?auto_564002 ?auto_564014 ) ) ( not ( = ?auto_564002 ?auto_564015 ) ) ( not ( = ?auto_564002 ?auto_564016 ) ) ( not ( = ?auto_564002 ?auto_564017 ) ) ( not ( = ?auto_564003 ?auto_564004 ) ) ( not ( = ?auto_564003 ?auto_564005 ) ) ( not ( = ?auto_564003 ?auto_564006 ) ) ( not ( = ?auto_564003 ?auto_564007 ) ) ( not ( = ?auto_564003 ?auto_564008 ) ) ( not ( = ?auto_564003 ?auto_564009 ) ) ( not ( = ?auto_564003 ?auto_564010 ) ) ( not ( = ?auto_564003 ?auto_564011 ) ) ( not ( = ?auto_564003 ?auto_564012 ) ) ( not ( = ?auto_564003 ?auto_564013 ) ) ( not ( = ?auto_564003 ?auto_564014 ) ) ( not ( = ?auto_564003 ?auto_564015 ) ) ( not ( = ?auto_564003 ?auto_564016 ) ) ( not ( = ?auto_564003 ?auto_564017 ) ) ( not ( = ?auto_564004 ?auto_564005 ) ) ( not ( = ?auto_564004 ?auto_564006 ) ) ( not ( = ?auto_564004 ?auto_564007 ) ) ( not ( = ?auto_564004 ?auto_564008 ) ) ( not ( = ?auto_564004 ?auto_564009 ) ) ( not ( = ?auto_564004 ?auto_564010 ) ) ( not ( = ?auto_564004 ?auto_564011 ) ) ( not ( = ?auto_564004 ?auto_564012 ) ) ( not ( = ?auto_564004 ?auto_564013 ) ) ( not ( = ?auto_564004 ?auto_564014 ) ) ( not ( = ?auto_564004 ?auto_564015 ) ) ( not ( = ?auto_564004 ?auto_564016 ) ) ( not ( = ?auto_564004 ?auto_564017 ) ) ( not ( = ?auto_564005 ?auto_564006 ) ) ( not ( = ?auto_564005 ?auto_564007 ) ) ( not ( = ?auto_564005 ?auto_564008 ) ) ( not ( = ?auto_564005 ?auto_564009 ) ) ( not ( = ?auto_564005 ?auto_564010 ) ) ( not ( = ?auto_564005 ?auto_564011 ) ) ( not ( = ?auto_564005 ?auto_564012 ) ) ( not ( = ?auto_564005 ?auto_564013 ) ) ( not ( = ?auto_564005 ?auto_564014 ) ) ( not ( = ?auto_564005 ?auto_564015 ) ) ( not ( = ?auto_564005 ?auto_564016 ) ) ( not ( = ?auto_564005 ?auto_564017 ) ) ( not ( = ?auto_564006 ?auto_564007 ) ) ( not ( = ?auto_564006 ?auto_564008 ) ) ( not ( = ?auto_564006 ?auto_564009 ) ) ( not ( = ?auto_564006 ?auto_564010 ) ) ( not ( = ?auto_564006 ?auto_564011 ) ) ( not ( = ?auto_564006 ?auto_564012 ) ) ( not ( = ?auto_564006 ?auto_564013 ) ) ( not ( = ?auto_564006 ?auto_564014 ) ) ( not ( = ?auto_564006 ?auto_564015 ) ) ( not ( = ?auto_564006 ?auto_564016 ) ) ( not ( = ?auto_564006 ?auto_564017 ) ) ( not ( = ?auto_564007 ?auto_564008 ) ) ( not ( = ?auto_564007 ?auto_564009 ) ) ( not ( = ?auto_564007 ?auto_564010 ) ) ( not ( = ?auto_564007 ?auto_564011 ) ) ( not ( = ?auto_564007 ?auto_564012 ) ) ( not ( = ?auto_564007 ?auto_564013 ) ) ( not ( = ?auto_564007 ?auto_564014 ) ) ( not ( = ?auto_564007 ?auto_564015 ) ) ( not ( = ?auto_564007 ?auto_564016 ) ) ( not ( = ?auto_564007 ?auto_564017 ) ) ( not ( = ?auto_564008 ?auto_564009 ) ) ( not ( = ?auto_564008 ?auto_564010 ) ) ( not ( = ?auto_564008 ?auto_564011 ) ) ( not ( = ?auto_564008 ?auto_564012 ) ) ( not ( = ?auto_564008 ?auto_564013 ) ) ( not ( = ?auto_564008 ?auto_564014 ) ) ( not ( = ?auto_564008 ?auto_564015 ) ) ( not ( = ?auto_564008 ?auto_564016 ) ) ( not ( = ?auto_564008 ?auto_564017 ) ) ( not ( = ?auto_564009 ?auto_564010 ) ) ( not ( = ?auto_564009 ?auto_564011 ) ) ( not ( = ?auto_564009 ?auto_564012 ) ) ( not ( = ?auto_564009 ?auto_564013 ) ) ( not ( = ?auto_564009 ?auto_564014 ) ) ( not ( = ?auto_564009 ?auto_564015 ) ) ( not ( = ?auto_564009 ?auto_564016 ) ) ( not ( = ?auto_564009 ?auto_564017 ) ) ( not ( = ?auto_564010 ?auto_564011 ) ) ( not ( = ?auto_564010 ?auto_564012 ) ) ( not ( = ?auto_564010 ?auto_564013 ) ) ( not ( = ?auto_564010 ?auto_564014 ) ) ( not ( = ?auto_564010 ?auto_564015 ) ) ( not ( = ?auto_564010 ?auto_564016 ) ) ( not ( = ?auto_564010 ?auto_564017 ) ) ( not ( = ?auto_564011 ?auto_564012 ) ) ( not ( = ?auto_564011 ?auto_564013 ) ) ( not ( = ?auto_564011 ?auto_564014 ) ) ( not ( = ?auto_564011 ?auto_564015 ) ) ( not ( = ?auto_564011 ?auto_564016 ) ) ( not ( = ?auto_564011 ?auto_564017 ) ) ( not ( = ?auto_564012 ?auto_564013 ) ) ( not ( = ?auto_564012 ?auto_564014 ) ) ( not ( = ?auto_564012 ?auto_564015 ) ) ( not ( = ?auto_564012 ?auto_564016 ) ) ( not ( = ?auto_564012 ?auto_564017 ) ) ( not ( = ?auto_564013 ?auto_564014 ) ) ( not ( = ?auto_564013 ?auto_564015 ) ) ( not ( = ?auto_564013 ?auto_564016 ) ) ( not ( = ?auto_564013 ?auto_564017 ) ) ( not ( = ?auto_564014 ?auto_564015 ) ) ( not ( = ?auto_564014 ?auto_564016 ) ) ( not ( = ?auto_564014 ?auto_564017 ) ) ( not ( = ?auto_564015 ?auto_564016 ) ) ( not ( = ?auto_564015 ?auto_564017 ) ) ( not ( = ?auto_564016 ?auto_564017 ) ) ( ON ?auto_564015 ?auto_564016 ) ( ON ?auto_564014 ?auto_564015 ) ( ON ?auto_564013 ?auto_564014 ) ( ON ?auto_564012 ?auto_564013 ) ( ON ?auto_564011 ?auto_564012 ) ( ON ?auto_564010 ?auto_564011 ) ( ON ?auto_564009 ?auto_564010 ) ( ON ?auto_564008 ?auto_564009 ) ( ON ?auto_564007 ?auto_564008 ) ( ON ?auto_564006 ?auto_564007 ) ( CLEAR ?auto_564004 ) ( ON ?auto_564005 ?auto_564006 ) ( CLEAR ?auto_564005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_564002 ?auto_564003 ?auto_564004 ?auto_564005 )
      ( MAKE-15PILE ?auto_564002 ?auto_564003 ?auto_564004 ?auto_564005 ?auto_564006 ?auto_564007 ?auto_564008 ?auto_564009 ?auto_564010 ?auto_564011 ?auto_564012 ?auto_564013 ?auto_564014 ?auto_564015 ?auto_564016 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_564064 - BLOCK
      ?auto_564065 - BLOCK
      ?auto_564066 - BLOCK
      ?auto_564067 - BLOCK
      ?auto_564068 - BLOCK
      ?auto_564069 - BLOCK
      ?auto_564070 - BLOCK
      ?auto_564071 - BLOCK
      ?auto_564072 - BLOCK
      ?auto_564073 - BLOCK
      ?auto_564074 - BLOCK
      ?auto_564075 - BLOCK
      ?auto_564076 - BLOCK
      ?auto_564077 - BLOCK
      ?auto_564078 - BLOCK
    )
    :vars
    (
      ?auto_564079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564078 ?auto_564079 ) ( ON-TABLE ?auto_564064 ) ( ON ?auto_564065 ?auto_564064 ) ( not ( = ?auto_564064 ?auto_564065 ) ) ( not ( = ?auto_564064 ?auto_564066 ) ) ( not ( = ?auto_564064 ?auto_564067 ) ) ( not ( = ?auto_564064 ?auto_564068 ) ) ( not ( = ?auto_564064 ?auto_564069 ) ) ( not ( = ?auto_564064 ?auto_564070 ) ) ( not ( = ?auto_564064 ?auto_564071 ) ) ( not ( = ?auto_564064 ?auto_564072 ) ) ( not ( = ?auto_564064 ?auto_564073 ) ) ( not ( = ?auto_564064 ?auto_564074 ) ) ( not ( = ?auto_564064 ?auto_564075 ) ) ( not ( = ?auto_564064 ?auto_564076 ) ) ( not ( = ?auto_564064 ?auto_564077 ) ) ( not ( = ?auto_564064 ?auto_564078 ) ) ( not ( = ?auto_564064 ?auto_564079 ) ) ( not ( = ?auto_564065 ?auto_564066 ) ) ( not ( = ?auto_564065 ?auto_564067 ) ) ( not ( = ?auto_564065 ?auto_564068 ) ) ( not ( = ?auto_564065 ?auto_564069 ) ) ( not ( = ?auto_564065 ?auto_564070 ) ) ( not ( = ?auto_564065 ?auto_564071 ) ) ( not ( = ?auto_564065 ?auto_564072 ) ) ( not ( = ?auto_564065 ?auto_564073 ) ) ( not ( = ?auto_564065 ?auto_564074 ) ) ( not ( = ?auto_564065 ?auto_564075 ) ) ( not ( = ?auto_564065 ?auto_564076 ) ) ( not ( = ?auto_564065 ?auto_564077 ) ) ( not ( = ?auto_564065 ?auto_564078 ) ) ( not ( = ?auto_564065 ?auto_564079 ) ) ( not ( = ?auto_564066 ?auto_564067 ) ) ( not ( = ?auto_564066 ?auto_564068 ) ) ( not ( = ?auto_564066 ?auto_564069 ) ) ( not ( = ?auto_564066 ?auto_564070 ) ) ( not ( = ?auto_564066 ?auto_564071 ) ) ( not ( = ?auto_564066 ?auto_564072 ) ) ( not ( = ?auto_564066 ?auto_564073 ) ) ( not ( = ?auto_564066 ?auto_564074 ) ) ( not ( = ?auto_564066 ?auto_564075 ) ) ( not ( = ?auto_564066 ?auto_564076 ) ) ( not ( = ?auto_564066 ?auto_564077 ) ) ( not ( = ?auto_564066 ?auto_564078 ) ) ( not ( = ?auto_564066 ?auto_564079 ) ) ( not ( = ?auto_564067 ?auto_564068 ) ) ( not ( = ?auto_564067 ?auto_564069 ) ) ( not ( = ?auto_564067 ?auto_564070 ) ) ( not ( = ?auto_564067 ?auto_564071 ) ) ( not ( = ?auto_564067 ?auto_564072 ) ) ( not ( = ?auto_564067 ?auto_564073 ) ) ( not ( = ?auto_564067 ?auto_564074 ) ) ( not ( = ?auto_564067 ?auto_564075 ) ) ( not ( = ?auto_564067 ?auto_564076 ) ) ( not ( = ?auto_564067 ?auto_564077 ) ) ( not ( = ?auto_564067 ?auto_564078 ) ) ( not ( = ?auto_564067 ?auto_564079 ) ) ( not ( = ?auto_564068 ?auto_564069 ) ) ( not ( = ?auto_564068 ?auto_564070 ) ) ( not ( = ?auto_564068 ?auto_564071 ) ) ( not ( = ?auto_564068 ?auto_564072 ) ) ( not ( = ?auto_564068 ?auto_564073 ) ) ( not ( = ?auto_564068 ?auto_564074 ) ) ( not ( = ?auto_564068 ?auto_564075 ) ) ( not ( = ?auto_564068 ?auto_564076 ) ) ( not ( = ?auto_564068 ?auto_564077 ) ) ( not ( = ?auto_564068 ?auto_564078 ) ) ( not ( = ?auto_564068 ?auto_564079 ) ) ( not ( = ?auto_564069 ?auto_564070 ) ) ( not ( = ?auto_564069 ?auto_564071 ) ) ( not ( = ?auto_564069 ?auto_564072 ) ) ( not ( = ?auto_564069 ?auto_564073 ) ) ( not ( = ?auto_564069 ?auto_564074 ) ) ( not ( = ?auto_564069 ?auto_564075 ) ) ( not ( = ?auto_564069 ?auto_564076 ) ) ( not ( = ?auto_564069 ?auto_564077 ) ) ( not ( = ?auto_564069 ?auto_564078 ) ) ( not ( = ?auto_564069 ?auto_564079 ) ) ( not ( = ?auto_564070 ?auto_564071 ) ) ( not ( = ?auto_564070 ?auto_564072 ) ) ( not ( = ?auto_564070 ?auto_564073 ) ) ( not ( = ?auto_564070 ?auto_564074 ) ) ( not ( = ?auto_564070 ?auto_564075 ) ) ( not ( = ?auto_564070 ?auto_564076 ) ) ( not ( = ?auto_564070 ?auto_564077 ) ) ( not ( = ?auto_564070 ?auto_564078 ) ) ( not ( = ?auto_564070 ?auto_564079 ) ) ( not ( = ?auto_564071 ?auto_564072 ) ) ( not ( = ?auto_564071 ?auto_564073 ) ) ( not ( = ?auto_564071 ?auto_564074 ) ) ( not ( = ?auto_564071 ?auto_564075 ) ) ( not ( = ?auto_564071 ?auto_564076 ) ) ( not ( = ?auto_564071 ?auto_564077 ) ) ( not ( = ?auto_564071 ?auto_564078 ) ) ( not ( = ?auto_564071 ?auto_564079 ) ) ( not ( = ?auto_564072 ?auto_564073 ) ) ( not ( = ?auto_564072 ?auto_564074 ) ) ( not ( = ?auto_564072 ?auto_564075 ) ) ( not ( = ?auto_564072 ?auto_564076 ) ) ( not ( = ?auto_564072 ?auto_564077 ) ) ( not ( = ?auto_564072 ?auto_564078 ) ) ( not ( = ?auto_564072 ?auto_564079 ) ) ( not ( = ?auto_564073 ?auto_564074 ) ) ( not ( = ?auto_564073 ?auto_564075 ) ) ( not ( = ?auto_564073 ?auto_564076 ) ) ( not ( = ?auto_564073 ?auto_564077 ) ) ( not ( = ?auto_564073 ?auto_564078 ) ) ( not ( = ?auto_564073 ?auto_564079 ) ) ( not ( = ?auto_564074 ?auto_564075 ) ) ( not ( = ?auto_564074 ?auto_564076 ) ) ( not ( = ?auto_564074 ?auto_564077 ) ) ( not ( = ?auto_564074 ?auto_564078 ) ) ( not ( = ?auto_564074 ?auto_564079 ) ) ( not ( = ?auto_564075 ?auto_564076 ) ) ( not ( = ?auto_564075 ?auto_564077 ) ) ( not ( = ?auto_564075 ?auto_564078 ) ) ( not ( = ?auto_564075 ?auto_564079 ) ) ( not ( = ?auto_564076 ?auto_564077 ) ) ( not ( = ?auto_564076 ?auto_564078 ) ) ( not ( = ?auto_564076 ?auto_564079 ) ) ( not ( = ?auto_564077 ?auto_564078 ) ) ( not ( = ?auto_564077 ?auto_564079 ) ) ( not ( = ?auto_564078 ?auto_564079 ) ) ( ON ?auto_564077 ?auto_564078 ) ( ON ?auto_564076 ?auto_564077 ) ( ON ?auto_564075 ?auto_564076 ) ( ON ?auto_564074 ?auto_564075 ) ( ON ?auto_564073 ?auto_564074 ) ( ON ?auto_564072 ?auto_564073 ) ( ON ?auto_564071 ?auto_564072 ) ( ON ?auto_564070 ?auto_564071 ) ( ON ?auto_564069 ?auto_564070 ) ( ON ?auto_564068 ?auto_564069 ) ( ON ?auto_564067 ?auto_564068 ) ( CLEAR ?auto_564065 ) ( ON ?auto_564066 ?auto_564067 ) ( CLEAR ?auto_564066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_564064 ?auto_564065 ?auto_564066 )
      ( MAKE-15PILE ?auto_564064 ?auto_564065 ?auto_564066 ?auto_564067 ?auto_564068 ?auto_564069 ?auto_564070 ?auto_564071 ?auto_564072 ?auto_564073 ?auto_564074 ?auto_564075 ?auto_564076 ?auto_564077 ?auto_564078 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_564126 - BLOCK
      ?auto_564127 - BLOCK
      ?auto_564128 - BLOCK
      ?auto_564129 - BLOCK
      ?auto_564130 - BLOCK
      ?auto_564131 - BLOCK
      ?auto_564132 - BLOCK
      ?auto_564133 - BLOCK
      ?auto_564134 - BLOCK
      ?auto_564135 - BLOCK
      ?auto_564136 - BLOCK
      ?auto_564137 - BLOCK
      ?auto_564138 - BLOCK
      ?auto_564139 - BLOCK
      ?auto_564140 - BLOCK
    )
    :vars
    (
      ?auto_564141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564140 ?auto_564141 ) ( ON-TABLE ?auto_564126 ) ( not ( = ?auto_564126 ?auto_564127 ) ) ( not ( = ?auto_564126 ?auto_564128 ) ) ( not ( = ?auto_564126 ?auto_564129 ) ) ( not ( = ?auto_564126 ?auto_564130 ) ) ( not ( = ?auto_564126 ?auto_564131 ) ) ( not ( = ?auto_564126 ?auto_564132 ) ) ( not ( = ?auto_564126 ?auto_564133 ) ) ( not ( = ?auto_564126 ?auto_564134 ) ) ( not ( = ?auto_564126 ?auto_564135 ) ) ( not ( = ?auto_564126 ?auto_564136 ) ) ( not ( = ?auto_564126 ?auto_564137 ) ) ( not ( = ?auto_564126 ?auto_564138 ) ) ( not ( = ?auto_564126 ?auto_564139 ) ) ( not ( = ?auto_564126 ?auto_564140 ) ) ( not ( = ?auto_564126 ?auto_564141 ) ) ( not ( = ?auto_564127 ?auto_564128 ) ) ( not ( = ?auto_564127 ?auto_564129 ) ) ( not ( = ?auto_564127 ?auto_564130 ) ) ( not ( = ?auto_564127 ?auto_564131 ) ) ( not ( = ?auto_564127 ?auto_564132 ) ) ( not ( = ?auto_564127 ?auto_564133 ) ) ( not ( = ?auto_564127 ?auto_564134 ) ) ( not ( = ?auto_564127 ?auto_564135 ) ) ( not ( = ?auto_564127 ?auto_564136 ) ) ( not ( = ?auto_564127 ?auto_564137 ) ) ( not ( = ?auto_564127 ?auto_564138 ) ) ( not ( = ?auto_564127 ?auto_564139 ) ) ( not ( = ?auto_564127 ?auto_564140 ) ) ( not ( = ?auto_564127 ?auto_564141 ) ) ( not ( = ?auto_564128 ?auto_564129 ) ) ( not ( = ?auto_564128 ?auto_564130 ) ) ( not ( = ?auto_564128 ?auto_564131 ) ) ( not ( = ?auto_564128 ?auto_564132 ) ) ( not ( = ?auto_564128 ?auto_564133 ) ) ( not ( = ?auto_564128 ?auto_564134 ) ) ( not ( = ?auto_564128 ?auto_564135 ) ) ( not ( = ?auto_564128 ?auto_564136 ) ) ( not ( = ?auto_564128 ?auto_564137 ) ) ( not ( = ?auto_564128 ?auto_564138 ) ) ( not ( = ?auto_564128 ?auto_564139 ) ) ( not ( = ?auto_564128 ?auto_564140 ) ) ( not ( = ?auto_564128 ?auto_564141 ) ) ( not ( = ?auto_564129 ?auto_564130 ) ) ( not ( = ?auto_564129 ?auto_564131 ) ) ( not ( = ?auto_564129 ?auto_564132 ) ) ( not ( = ?auto_564129 ?auto_564133 ) ) ( not ( = ?auto_564129 ?auto_564134 ) ) ( not ( = ?auto_564129 ?auto_564135 ) ) ( not ( = ?auto_564129 ?auto_564136 ) ) ( not ( = ?auto_564129 ?auto_564137 ) ) ( not ( = ?auto_564129 ?auto_564138 ) ) ( not ( = ?auto_564129 ?auto_564139 ) ) ( not ( = ?auto_564129 ?auto_564140 ) ) ( not ( = ?auto_564129 ?auto_564141 ) ) ( not ( = ?auto_564130 ?auto_564131 ) ) ( not ( = ?auto_564130 ?auto_564132 ) ) ( not ( = ?auto_564130 ?auto_564133 ) ) ( not ( = ?auto_564130 ?auto_564134 ) ) ( not ( = ?auto_564130 ?auto_564135 ) ) ( not ( = ?auto_564130 ?auto_564136 ) ) ( not ( = ?auto_564130 ?auto_564137 ) ) ( not ( = ?auto_564130 ?auto_564138 ) ) ( not ( = ?auto_564130 ?auto_564139 ) ) ( not ( = ?auto_564130 ?auto_564140 ) ) ( not ( = ?auto_564130 ?auto_564141 ) ) ( not ( = ?auto_564131 ?auto_564132 ) ) ( not ( = ?auto_564131 ?auto_564133 ) ) ( not ( = ?auto_564131 ?auto_564134 ) ) ( not ( = ?auto_564131 ?auto_564135 ) ) ( not ( = ?auto_564131 ?auto_564136 ) ) ( not ( = ?auto_564131 ?auto_564137 ) ) ( not ( = ?auto_564131 ?auto_564138 ) ) ( not ( = ?auto_564131 ?auto_564139 ) ) ( not ( = ?auto_564131 ?auto_564140 ) ) ( not ( = ?auto_564131 ?auto_564141 ) ) ( not ( = ?auto_564132 ?auto_564133 ) ) ( not ( = ?auto_564132 ?auto_564134 ) ) ( not ( = ?auto_564132 ?auto_564135 ) ) ( not ( = ?auto_564132 ?auto_564136 ) ) ( not ( = ?auto_564132 ?auto_564137 ) ) ( not ( = ?auto_564132 ?auto_564138 ) ) ( not ( = ?auto_564132 ?auto_564139 ) ) ( not ( = ?auto_564132 ?auto_564140 ) ) ( not ( = ?auto_564132 ?auto_564141 ) ) ( not ( = ?auto_564133 ?auto_564134 ) ) ( not ( = ?auto_564133 ?auto_564135 ) ) ( not ( = ?auto_564133 ?auto_564136 ) ) ( not ( = ?auto_564133 ?auto_564137 ) ) ( not ( = ?auto_564133 ?auto_564138 ) ) ( not ( = ?auto_564133 ?auto_564139 ) ) ( not ( = ?auto_564133 ?auto_564140 ) ) ( not ( = ?auto_564133 ?auto_564141 ) ) ( not ( = ?auto_564134 ?auto_564135 ) ) ( not ( = ?auto_564134 ?auto_564136 ) ) ( not ( = ?auto_564134 ?auto_564137 ) ) ( not ( = ?auto_564134 ?auto_564138 ) ) ( not ( = ?auto_564134 ?auto_564139 ) ) ( not ( = ?auto_564134 ?auto_564140 ) ) ( not ( = ?auto_564134 ?auto_564141 ) ) ( not ( = ?auto_564135 ?auto_564136 ) ) ( not ( = ?auto_564135 ?auto_564137 ) ) ( not ( = ?auto_564135 ?auto_564138 ) ) ( not ( = ?auto_564135 ?auto_564139 ) ) ( not ( = ?auto_564135 ?auto_564140 ) ) ( not ( = ?auto_564135 ?auto_564141 ) ) ( not ( = ?auto_564136 ?auto_564137 ) ) ( not ( = ?auto_564136 ?auto_564138 ) ) ( not ( = ?auto_564136 ?auto_564139 ) ) ( not ( = ?auto_564136 ?auto_564140 ) ) ( not ( = ?auto_564136 ?auto_564141 ) ) ( not ( = ?auto_564137 ?auto_564138 ) ) ( not ( = ?auto_564137 ?auto_564139 ) ) ( not ( = ?auto_564137 ?auto_564140 ) ) ( not ( = ?auto_564137 ?auto_564141 ) ) ( not ( = ?auto_564138 ?auto_564139 ) ) ( not ( = ?auto_564138 ?auto_564140 ) ) ( not ( = ?auto_564138 ?auto_564141 ) ) ( not ( = ?auto_564139 ?auto_564140 ) ) ( not ( = ?auto_564139 ?auto_564141 ) ) ( not ( = ?auto_564140 ?auto_564141 ) ) ( ON ?auto_564139 ?auto_564140 ) ( ON ?auto_564138 ?auto_564139 ) ( ON ?auto_564137 ?auto_564138 ) ( ON ?auto_564136 ?auto_564137 ) ( ON ?auto_564135 ?auto_564136 ) ( ON ?auto_564134 ?auto_564135 ) ( ON ?auto_564133 ?auto_564134 ) ( ON ?auto_564132 ?auto_564133 ) ( ON ?auto_564131 ?auto_564132 ) ( ON ?auto_564130 ?auto_564131 ) ( ON ?auto_564129 ?auto_564130 ) ( ON ?auto_564128 ?auto_564129 ) ( CLEAR ?auto_564126 ) ( ON ?auto_564127 ?auto_564128 ) ( CLEAR ?auto_564127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_564126 ?auto_564127 )
      ( MAKE-15PILE ?auto_564126 ?auto_564127 ?auto_564128 ?auto_564129 ?auto_564130 ?auto_564131 ?auto_564132 ?auto_564133 ?auto_564134 ?auto_564135 ?auto_564136 ?auto_564137 ?auto_564138 ?auto_564139 ?auto_564140 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_564188 - BLOCK
      ?auto_564189 - BLOCK
      ?auto_564190 - BLOCK
      ?auto_564191 - BLOCK
      ?auto_564192 - BLOCK
      ?auto_564193 - BLOCK
      ?auto_564194 - BLOCK
      ?auto_564195 - BLOCK
      ?auto_564196 - BLOCK
      ?auto_564197 - BLOCK
      ?auto_564198 - BLOCK
      ?auto_564199 - BLOCK
      ?auto_564200 - BLOCK
      ?auto_564201 - BLOCK
      ?auto_564202 - BLOCK
    )
    :vars
    (
      ?auto_564203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564202 ?auto_564203 ) ( not ( = ?auto_564188 ?auto_564189 ) ) ( not ( = ?auto_564188 ?auto_564190 ) ) ( not ( = ?auto_564188 ?auto_564191 ) ) ( not ( = ?auto_564188 ?auto_564192 ) ) ( not ( = ?auto_564188 ?auto_564193 ) ) ( not ( = ?auto_564188 ?auto_564194 ) ) ( not ( = ?auto_564188 ?auto_564195 ) ) ( not ( = ?auto_564188 ?auto_564196 ) ) ( not ( = ?auto_564188 ?auto_564197 ) ) ( not ( = ?auto_564188 ?auto_564198 ) ) ( not ( = ?auto_564188 ?auto_564199 ) ) ( not ( = ?auto_564188 ?auto_564200 ) ) ( not ( = ?auto_564188 ?auto_564201 ) ) ( not ( = ?auto_564188 ?auto_564202 ) ) ( not ( = ?auto_564188 ?auto_564203 ) ) ( not ( = ?auto_564189 ?auto_564190 ) ) ( not ( = ?auto_564189 ?auto_564191 ) ) ( not ( = ?auto_564189 ?auto_564192 ) ) ( not ( = ?auto_564189 ?auto_564193 ) ) ( not ( = ?auto_564189 ?auto_564194 ) ) ( not ( = ?auto_564189 ?auto_564195 ) ) ( not ( = ?auto_564189 ?auto_564196 ) ) ( not ( = ?auto_564189 ?auto_564197 ) ) ( not ( = ?auto_564189 ?auto_564198 ) ) ( not ( = ?auto_564189 ?auto_564199 ) ) ( not ( = ?auto_564189 ?auto_564200 ) ) ( not ( = ?auto_564189 ?auto_564201 ) ) ( not ( = ?auto_564189 ?auto_564202 ) ) ( not ( = ?auto_564189 ?auto_564203 ) ) ( not ( = ?auto_564190 ?auto_564191 ) ) ( not ( = ?auto_564190 ?auto_564192 ) ) ( not ( = ?auto_564190 ?auto_564193 ) ) ( not ( = ?auto_564190 ?auto_564194 ) ) ( not ( = ?auto_564190 ?auto_564195 ) ) ( not ( = ?auto_564190 ?auto_564196 ) ) ( not ( = ?auto_564190 ?auto_564197 ) ) ( not ( = ?auto_564190 ?auto_564198 ) ) ( not ( = ?auto_564190 ?auto_564199 ) ) ( not ( = ?auto_564190 ?auto_564200 ) ) ( not ( = ?auto_564190 ?auto_564201 ) ) ( not ( = ?auto_564190 ?auto_564202 ) ) ( not ( = ?auto_564190 ?auto_564203 ) ) ( not ( = ?auto_564191 ?auto_564192 ) ) ( not ( = ?auto_564191 ?auto_564193 ) ) ( not ( = ?auto_564191 ?auto_564194 ) ) ( not ( = ?auto_564191 ?auto_564195 ) ) ( not ( = ?auto_564191 ?auto_564196 ) ) ( not ( = ?auto_564191 ?auto_564197 ) ) ( not ( = ?auto_564191 ?auto_564198 ) ) ( not ( = ?auto_564191 ?auto_564199 ) ) ( not ( = ?auto_564191 ?auto_564200 ) ) ( not ( = ?auto_564191 ?auto_564201 ) ) ( not ( = ?auto_564191 ?auto_564202 ) ) ( not ( = ?auto_564191 ?auto_564203 ) ) ( not ( = ?auto_564192 ?auto_564193 ) ) ( not ( = ?auto_564192 ?auto_564194 ) ) ( not ( = ?auto_564192 ?auto_564195 ) ) ( not ( = ?auto_564192 ?auto_564196 ) ) ( not ( = ?auto_564192 ?auto_564197 ) ) ( not ( = ?auto_564192 ?auto_564198 ) ) ( not ( = ?auto_564192 ?auto_564199 ) ) ( not ( = ?auto_564192 ?auto_564200 ) ) ( not ( = ?auto_564192 ?auto_564201 ) ) ( not ( = ?auto_564192 ?auto_564202 ) ) ( not ( = ?auto_564192 ?auto_564203 ) ) ( not ( = ?auto_564193 ?auto_564194 ) ) ( not ( = ?auto_564193 ?auto_564195 ) ) ( not ( = ?auto_564193 ?auto_564196 ) ) ( not ( = ?auto_564193 ?auto_564197 ) ) ( not ( = ?auto_564193 ?auto_564198 ) ) ( not ( = ?auto_564193 ?auto_564199 ) ) ( not ( = ?auto_564193 ?auto_564200 ) ) ( not ( = ?auto_564193 ?auto_564201 ) ) ( not ( = ?auto_564193 ?auto_564202 ) ) ( not ( = ?auto_564193 ?auto_564203 ) ) ( not ( = ?auto_564194 ?auto_564195 ) ) ( not ( = ?auto_564194 ?auto_564196 ) ) ( not ( = ?auto_564194 ?auto_564197 ) ) ( not ( = ?auto_564194 ?auto_564198 ) ) ( not ( = ?auto_564194 ?auto_564199 ) ) ( not ( = ?auto_564194 ?auto_564200 ) ) ( not ( = ?auto_564194 ?auto_564201 ) ) ( not ( = ?auto_564194 ?auto_564202 ) ) ( not ( = ?auto_564194 ?auto_564203 ) ) ( not ( = ?auto_564195 ?auto_564196 ) ) ( not ( = ?auto_564195 ?auto_564197 ) ) ( not ( = ?auto_564195 ?auto_564198 ) ) ( not ( = ?auto_564195 ?auto_564199 ) ) ( not ( = ?auto_564195 ?auto_564200 ) ) ( not ( = ?auto_564195 ?auto_564201 ) ) ( not ( = ?auto_564195 ?auto_564202 ) ) ( not ( = ?auto_564195 ?auto_564203 ) ) ( not ( = ?auto_564196 ?auto_564197 ) ) ( not ( = ?auto_564196 ?auto_564198 ) ) ( not ( = ?auto_564196 ?auto_564199 ) ) ( not ( = ?auto_564196 ?auto_564200 ) ) ( not ( = ?auto_564196 ?auto_564201 ) ) ( not ( = ?auto_564196 ?auto_564202 ) ) ( not ( = ?auto_564196 ?auto_564203 ) ) ( not ( = ?auto_564197 ?auto_564198 ) ) ( not ( = ?auto_564197 ?auto_564199 ) ) ( not ( = ?auto_564197 ?auto_564200 ) ) ( not ( = ?auto_564197 ?auto_564201 ) ) ( not ( = ?auto_564197 ?auto_564202 ) ) ( not ( = ?auto_564197 ?auto_564203 ) ) ( not ( = ?auto_564198 ?auto_564199 ) ) ( not ( = ?auto_564198 ?auto_564200 ) ) ( not ( = ?auto_564198 ?auto_564201 ) ) ( not ( = ?auto_564198 ?auto_564202 ) ) ( not ( = ?auto_564198 ?auto_564203 ) ) ( not ( = ?auto_564199 ?auto_564200 ) ) ( not ( = ?auto_564199 ?auto_564201 ) ) ( not ( = ?auto_564199 ?auto_564202 ) ) ( not ( = ?auto_564199 ?auto_564203 ) ) ( not ( = ?auto_564200 ?auto_564201 ) ) ( not ( = ?auto_564200 ?auto_564202 ) ) ( not ( = ?auto_564200 ?auto_564203 ) ) ( not ( = ?auto_564201 ?auto_564202 ) ) ( not ( = ?auto_564201 ?auto_564203 ) ) ( not ( = ?auto_564202 ?auto_564203 ) ) ( ON ?auto_564201 ?auto_564202 ) ( ON ?auto_564200 ?auto_564201 ) ( ON ?auto_564199 ?auto_564200 ) ( ON ?auto_564198 ?auto_564199 ) ( ON ?auto_564197 ?auto_564198 ) ( ON ?auto_564196 ?auto_564197 ) ( ON ?auto_564195 ?auto_564196 ) ( ON ?auto_564194 ?auto_564195 ) ( ON ?auto_564193 ?auto_564194 ) ( ON ?auto_564192 ?auto_564193 ) ( ON ?auto_564191 ?auto_564192 ) ( ON ?auto_564190 ?auto_564191 ) ( ON ?auto_564189 ?auto_564190 ) ( ON ?auto_564188 ?auto_564189 ) ( CLEAR ?auto_564188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_564188 )
      ( MAKE-15PILE ?auto_564188 ?auto_564189 ?auto_564190 ?auto_564191 ?auto_564192 ?auto_564193 ?auto_564194 ?auto_564195 ?auto_564196 ?auto_564197 ?auto_564198 ?auto_564199 ?auto_564200 ?auto_564201 ?auto_564202 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564251 - BLOCK
      ?auto_564252 - BLOCK
      ?auto_564253 - BLOCK
      ?auto_564254 - BLOCK
      ?auto_564255 - BLOCK
      ?auto_564256 - BLOCK
      ?auto_564257 - BLOCK
      ?auto_564258 - BLOCK
      ?auto_564259 - BLOCK
      ?auto_564260 - BLOCK
      ?auto_564261 - BLOCK
      ?auto_564262 - BLOCK
      ?auto_564263 - BLOCK
      ?auto_564264 - BLOCK
      ?auto_564265 - BLOCK
      ?auto_564266 - BLOCK
    )
    :vars
    (
      ?auto_564267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_564265 ) ( ON ?auto_564266 ?auto_564267 ) ( CLEAR ?auto_564266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_564251 ) ( ON ?auto_564252 ?auto_564251 ) ( ON ?auto_564253 ?auto_564252 ) ( ON ?auto_564254 ?auto_564253 ) ( ON ?auto_564255 ?auto_564254 ) ( ON ?auto_564256 ?auto_564255 ) ( ON ?auto_564257 ?auto_564256 ) ( ON ?auto_564258 ?auto_564257 ) ( ON ?auto_564259 ?auto_564258 ) ( ON ?auto_564260 ?auto_564259 ) ( ON ?auto_564261 ?auto_564260 ) ( ON ?auto_564262 ?auto_564261 ) ( ON ?auto_564263 ?auto_564262 ) ( ON ?auto_564264 ?auto_564263 ) ( ON ?auto_564265 ?auto_564264 ) ( not ( = ?auto_564251 ?auto_564252 ) ) ( not ( = ?auto_564251 ?auto_564253 ) ) ( not ( = ?auto_564251 ?auto_564254 ) ) ( not ( = ?auto_564251 ?auto_564255 ) ) ( not ( = ?auto_564251 ?auto_564256 ) ) ( not ( = ?auto_564251 ?auto_564257 ) ) ( not ( = ?auto_564251 ?auto_564258 ) ) ( not ( = ?auto_564251 ?auto_564259 ) ) ( not ( = ?auto_564251 ?auto_564260 ) ) ( not ( = ?auto_564251 ?auto_564261 ) ) ( not ( = ?auto_564251 ?auto_564262 ) ) ( not ( = ?auto_564251 ?auto_564263 ) ) ( not ( = ?auto_564251 ?auto_564264 ) ) ( not ( = ?auto_564251 ?auto_564265 ) ) ( not ( = ?auto_564251 ?auto_564266 ) ) ( not ( = ?auto_564251 ?auto_564267 ) ) ( not ( = ?auto_564252 ?auto_564253 ) ) ( not ( = ?auto_564252 ?auto_564254 ) ) ( not ( = ?auto_564252 ?auto_564255 ) ) ( not ( = ?auto_564252 ?auto_564256 ) ) ( not ( = ?auto_564252 ?auto_564257 ) ) ( not ( = ?auto_564252 ?auto_564258 ) ) ( not ( = ?auto_564252 ?auto_564259 ) ) ( not ( = ?auto_564252 ?auto_564260 ) ) ( not ( = ?auto_564252 ?auto_564261 ) ) ( not ( = ?auto_564252 ?auto_564262 ) ) ( not ( = ?auto_564252 ?auto_564263 ) ) ( not ( = ?auto_564252 ?auto_564264 ) ) ( not ( = ?auto_564252 ?auto_564265 ) ) ( not ( = ?auto_564252 ?auto_564266 ) ) ( not ( = ?auto_564252 ?auto_564267 ) ) ( not ( = ?auto_564253 ?auto_564254 ) ) ( not ( = ?auto_564253 ?auto_564255 ) ) ( not ( = ?auto_564253 ?auto_564256 ) ) ( not ( = ?auto_564253 ?auto_564257 ) ) ( not ( = ?auto_564253 ?auto_564258 ) ) ( not ( = ?auto_564253 ?auto_564259 ) ) ( not ( = ?auto_564253 ?auto_564260 ) ) ( not ( = ?auto_564253 ?auto_564261 ) ) ( not ( = ?auto_564253 ?auto_564262 ) ) ( not ( = ?auto_564253 ?auto_564263 ) ) ( not ( = ?auto_564253 ?auto_564264 ) ) ( not ( = ?auto_564253 ?auto_564265 ) ) ( not ( = ?auto_564253 ?auto_564266 ) ) ( not ( = ?auto_564253 ?auto_564267 ) ) ( not ( = ?auto_564254 ?auto_564255 ) ) ( not ( = ?auto_564254 ?auto_564256 ) ) ( not ( = ?auto_564254 ?auto_564257 ) ) ( not ( = ?auto_564254 ?auto_564258 ) ) ( not ( = ?auto_564254 ?auto_564259 ) ) ( not ( = ?auto_564254 ?auto_564260 ) ) ( not ( = ?auto_564254 ?auto_564261 ) ) ( not ( = ?auto_564254 ?auto_564262 ) ) ( not ( = ?auto_564254 ?auto_564263 ) ) ( not ( = ?auto_564254 ?auto_564264 ) ) ( not ( = ?auto_564254 ?auto_564265 ) ) ( not ( = ?auto_564254 ?auto_564266 ) ) ( not ( = ?auto_564254 ?auto_564267 ) ) ( not ( = ?auto_564255 ?auto_564256 ) ) ( not ( = ?auto_564255 ?auto_564257 ) ) ( not ( = ?auto_564255 ?auto_564258 ) ) ( not ( = ?auto_564255 ?auto_564259 ) ) ( not ( = ?auto_564255 ?auto_564260 ) ) ( not ( = ?auto_564255 ?auto_564261 ) ) ( not ( = ?auto_564255 ?auto_564262 ) ) ( not ( = ?auto_564255 ?auto_564263 ) ) ( not ( = ?auto_564255 ?auto_564264 ) ) ( not ( = ?auto_564255 ?auto_564265 ) ) ( not ( = ?auto_564255 ?auto_564266 ) ) ( not ( = ?auto_564255 ?auto_564267 ) ) ( not ( = ?auto_564256 ?auto_564257 ) ) ( not ( = ?auto_564256 ?auto_564258 ) ) ( not ( = ?auto_564256 ?auto_564259 ) ) ( not ( = ?auto_564256 ?auto_564260 ) ) ( not ( = ?auto_564256 ?auto_564261 ) ) ( not ( = ?auto_564256 ?auto_564262 ) ) ( not ( = ?auto_564256 ?auto_564263 ) ) ( not ( = ?auto_564256 ?auto_564264 ) ) ( not ( = ?auto_564256 ?auto_564265 ) ) ( not ( = ?auto_564256 ?auto_564266 ) ) ( not ( = ?auto_564256 ?auto_564267 ) ) ( not ( = ?auto_564257 ?auto_564258 ) ) ( not ( = ?auto_564257 ?auto_564259 ) ) ( not ( = ?auto_564257 ?auto_564260 ) ) ( not ( = ?auto_564257 ?auto_564261 ) ) ( not ( = ?auto_564257 ?auto_564262 ) ) ( not ( = ?auto_564257 ?auto_564263 ) ) ( not ( = ?auto_564257 ?auto_564264 ) ) ( not ( = ?auto_564257 ?auto_564265 ) ) ( not ( = ?auto_564257 ?auto_564266 ) ) ( not ( = ?auto_564257 ?auto_564267 ) ) ( not ( = ?auto_564258 ?auto_564259 ) ) ( not ( = ?auto_564258 ?auto_564260 ) ) ( not ( = ?auto_564258 ?auto_564261 ) ) ( not ( = ?auto_564258 ?auto_564262 ) ) ( not ( = ?auto_564258 ?auto_564263 ) ) ( not ( = ?auto_564258 ?auto_564264 ) ) ( not ( = ?auto_564258 ?auto_564265 ) ) ( not ( = ?auto_564258 ?auto_564266 ) ) ( not ( = ?auto_564258 ?auto_564267 ) ) ( not ( = ?auto_564259 ?auto_564260 ) ) ( not ( = ?auto_564259 ?auto_564261 ) ) ( not ( = ?auto_564259 ?auto_564262 ) ) ( not ( = ?auto_564259 ?auto_564263 ) ) ( not ( = ?auto_564259 ?auto_564264 ) ) ( not ( = ?auto_564259 ?auto_564265 ) ) ( not ( = ?auto_564259 ?auto_564266 ) ) ( not ( = ?auto_564259 ?auto_564267 ) ) ( not ( = ?auto_564260 ?auto_564261 ) ) ( not ( = ?auto_564260 ?auto_564262 ) ) ( not ( = ?auto_564260 ?auto_564263 ) ) ( not ( = ?auto_564260 ?auto_564264 ) ) ( not ( = ?auto_564260 ?auto_564265 ) ) ( not ( = ?auto_564260 ?auto_564266 ) ) ( not ( = ?auto_564260 ?auto_564267 ) ) ( not ( = ?auto_564261 ?auto_564262 ) ) ( not ( = ?auto_564261 ?auto_564263 ) ) ( not ( = ?auto_564261 ?auto_564264 ) ) ( not ( = ?auto_564261 ?auto_564265 ) ) ( not ( = ?auto_564261 ?auto_564266 ) ) ( not ( = ?auto_564261 ?auto_564267 ) ) ( not ( = ?auto_564262 ?auto_564263 ) ) ( not ( = ?auto_564262 ?auto_564264 ) ) ( not ( = ?auto_564262 ?auto_564265 ) ) ( not ( = ?auto_564262 ?auto_564266 ) ) ( not ( = ?auto_564262 ?auto_564267 ) ) ( not ( = ?auto_564263 ?auto_564264 ) ) ( not ( = ?auto_564263 ?auto_564265 ) ) ( not ( = ?auto_564263 ?auto_564266 ) ) ( not ( = ?auto_564263 ?auto_564267 ) ) ( not ( = ?auto_564264 ?auto_564265 ) ) ( not ( = ?auto_564264 ?auto_564266 ) ) ( not ( = ?auto_564264 ?auto_564267 ) ) ( not ( = ?auto_564265 ?auto_564266 ) ) ( not ( = ?auto_564265 ?auto_564267 ) ) ( not ( = ?auto_564266 ?auto_564267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_564266 ?auto_564267 )
      ( !STACK ?auto_564266 ?auto_564265 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564284 - BLOCK
      ?auto_564285 - BLOCK
      ?auto_564286 - BLOCK
      ?auto_564287 - BLOCK
      ?auto_564288 - BLOCK
      ?auto_564289 - BLOCK
      ?auto_564290 - BLOCK
      ?auto_564291 - BLOCK
      ?auto_564292 - BLOCK
      ?auto_564293 - BLOCK
      ?auto_564294 - BLOCK
      ?auto_564295 - BLOCK
      ?auto_564296 - BLOCK
      ?auto_564297 - BLOCK
      ?auto_564298 - BLOCK
      ?auto_564299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_564298 ) ( ON-TABLE ?auto_564299 ) ( CLEAR ?auto_564299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_564284 ) ( ON ?auto_564285 ?auto_564284 ) ( ON ?auto_564286 ?auto_564285 ) ( ON ?auto_564287 ?auto_564286 ) ( ON ?auto_564288 ?auto_564287 ) ( ON ?auto_564289 ?auto_564288 ) ( ON ?auto_564290 ?auto_564289 ) ( ON ?auto_564291 ?auto_564290 ) ( ON ?auto_564292 ?auto_564291 ) ( ON ?auto_564293 ?auto_564292 ) ( ON ?auto_564294 ?auto_564293 ) ( ON ?auto_564295 ?auto_564294 ) ( ON ?auto_564296 ?auto_564295 ) ( ON ?auto_564297 ?auto_564296 ) ( ON ?auto_564298 ?auto_564297 ) ( not ( = ?auto_564284 ?auto_564285 ) ) ( not ( = ?auto_564284 ?auto_564286 ) ) ( not ( = ?auto_564284 ?auto_564287 ) ) ( not ( = ?auto_564284 ?auto_564288 ) ) ( not ( = ?auto_564284 ?auto_564289 ) ) ( not ( = ?auto_564284 ?auto_564290 ) ) ( not ( = ?auto_564284 ?auto_564291 ) ) ( not ( = ?auto_564284 ?auto_564292 ) ) ( not ( = ?auto_564284 ?auto_564293 ) ) ( not ( = ?auto_564284 ?auto_564294 ) ) ( not ( = ?auto_564284 ?auto_564295 ) ) ( not ( = ?auto_564284 ?auto_564296 ) ) ( not ( = ?auto_564284 ?auto_564297 ) ) ( not ( = ?auto_564284 ?auto_564298 ) ) ( not ( = ?auto_564284 ?auto_564299 ) ) ( not ( = ?auto_564285 ?auto_564286 ) ) ( not ( = ?auto_564285 ?auto_564287 ) ) ( not ( = ?auto_564285 ?auto_564288 ) ) ( not ( = ?auto_564285 ?auto_564289 ) ) ( not ( = ?auto_564285 ?auto_564290 ) ) ( not ( = ?auto_564285 ?auto_564291 ) ) ( not ( = ?auto_564285 ?auto_564292 ) ) ( not ( = ?auto_564285 ?auto_564293 ) ) ( not ( = ?auto_564285 ?auto_564294 ) ) ( not ( = ?auto_564285 ?auto_564295 ) ) ( not ( = ?auto_564285 ?auto_564296 ) ) ( not ( = ?auto_564285 ?auto_564297 ) ) ( not ( = ?auto_564285 ?auto_564298 ) ) ( not ( = ?auto_564285 ?auto_564299 ) ) ( not ( = ?auto_564286 ?auto_564287 ) ) ( not ( = ?auto_564286 ?auto_564288 ) ) ( not ( = ?auto_564286 ?auto_564289 ) ) ( not ( = ?auto_564286 ?auto_564290 ) ) ( not ( = ?auto_564286 ?auto_564291 ) ) ( not ( = ?auto_564286 ?auto_564292 ) ) ( not ( = ?auto_564286 ?auto_564293 ) ) ( not ( = ?auto_564286 ?auto_564294 ) ) ( not ( = ?auto_564286 ?auto_564295 ) ) ( not ( = ?auto_564286 ?auto_564296 ) ) ( not ( = ?auto_564286 ?auto_564297 ) ) ( not ( = ?auto_564286 ?auto_564298 ) ) ( not ( = ?auto_564286 ?auto_564299 ) ) ( not ( = ?auto_564287 ?auto_564288 ) ) ( not ( = ?auto_564287 ?auto_564289 ) ) ( not ( = ?auto_564287 ?auto_564290 ) ) ( not ( = ?auto_564287 ?auto_564291 ) ) ( not ( = ?auto_564287 ?auto_564292 ) ) ( not ( = ?auto_564287 ?auto_564293 ) ) ( not ( = ?auto_564287 ?auto_564294 ) ) ( not ( = ?auto_564287 ?auto_564295 ) ) ( not ( = ?auto_564287 ?auto_564296 ) ) ( not ( = ?auto_564287 ?auto_564297 ) ) ( not ( = ?auto_564287 ?auto_564298 ) ) ( not ( = ?auto_564287 ?auto_564299 ) ) ( not ( = ?auto_564288 ?auto_564289 ) ) ( not ( = ?auto_564288 ?auto_564290 ) ) ( not ( = ?auto_564288 ?auto_564291 ) ) ( not ( = ?auto_564288 ?auto_564292 ) ) ( not ( = ?auto_564288 ?auto_564293 ) ) ( not ( = ?auto_564288 ?auto_564294 ) ) ( not ( = ?auto_564288 ?auto_564295 ) ) ( not ( = ?auto_564288 ?auto_564296 ) ) ( not ( = ?auto_564288 ?auto_564297 ) ) ( not ( = ?auto_564288 ?auto_564298 ) ) ( not ( = ?auto_564288 ?auto_564299 ) ) ( not ( = ?auto_564289 ?auto_564290 ) ) ( not ( = ?auto_564289 ?auto_564291 ) ) ( not ( = ?auto_564289 ?auto_564292 ) ) ( not ( = ?auto_564289 ?auto_564293 ) ) ( not ( = ?auto_564289 ?auto_564294 ) ) ( not ( = ?auto_564289 ?auto_564295 ) ) ( not ( = ?auto_564289 ?auto_564296 ) ) ( not ( = ?auto_564289 ?auto_564297 ) ) ( not ( = ?auto_564289 ?auto_564298 ) ) ( not ( = ?auto_564289 ?auto_564299 ) ) ( not ( = ?auto_564290 ?auto_564291 ) ) ( not ( = ?auto_564290 ?auto_564292 ) ) ( not ( = ?auto_564290 ?auto_564293 ) ) ( not ( = ?auto_564290 ?auto_564294 ) ) ( not ( = ?auto_564290 ?auto_564295 ) ) ( not ( = ?auto_564290 ?auto_564296 ) ) ( not ( = ?auto_564290 ?auto_564297 ) ) ( not ( = ?auto_564290 ?auto_564298 ) ) ( not ( = ?auto_564290 ?auto_564299 ) ) ( not ( = ?auto_564291 ?auto_564292 ) ) ( not ( = ?auto_564291 ?auto_564293 ) ) ( not ( = ?auto_564291 ?auto_564294 ) ) ( not ( = ?auto_564291 ?auto_564295 ) ) ( not ( = ?auto_564291 ?auto_564296 ) ) ( not ( = ?auto_564291 ?auto_564297 ) ) ( not ( = ?auto_564291 ?auto_564298 ) ) ( not ( = ?auto_564291 ?auto_564299 ) ) ( not ( = ?auto_564292 ?auto_564293 ) ) ( not ( = ?auto_564292 ?auto_564294 ) ) ( not ( = ?auto_564292 ?auto_564295 ) ) ( not ( = ?auto_564292 ?auto_564296 ) ) ( not ( = ?auto_564292 ?auto_564297 ) ) ( not ( = ?auto_564292 ?auto_564298 ) ) ( not ( = ?auto_564292 ?auto_564299 ) ) ( not ( = ?auto_564293 ?auto_564294 ) ) ( not ( = ?auto_564293 ?auto_564295 ) ) ( not ( = ?auto_564293 ?auto_564296 ) ) ( not ( = ?auto_564293 ?auto_564297 ) ) ( not ( = ?auto_564293 ?auto_564298 ) ) ( not ( = ?auto_564293 ?auto_564299 ) ) ( not ( = ?auto_564294 ?auto_564295 ) ) ( not ( = ?auto_564294 ?auto_564296 ) ) ( not ( = ?auto_564294 ?auto_564297 ) ) ( not ( = ?auto_564294 ?auto_564298 ) ) ( not ( = ?auto_564294 ?auto_564299 ) ) ( not ( = ?auto_564295 ?auto_564296 ) ) ( not ( = ?auto_564295 ?auto_564297 ) ) ( not ( = ?auto_564295 ?auto_564298 ) ) ( not ( = ?auto_564295 ?auto_564299 ) ) ( not ( = ?auto_564296 ?auto_564297 ) ) ( not ( = ?auto_564296 ?auto_564298 ) ) ( not ( = ?auto_564296 ?auto_564299 ) ) ( not ( = ?auto_564297 ?auto_564298 ) ) ( not ( = ?auto_564297 ?auto_564299 ) ) ( not ( = ?auto_564298 ?auto_564299 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_564299 )
      ( !STACK ?auto_564299 ?auto_564298 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564316 - BLOCK
      ?auto_564317 - BLOCK
      ?auto_564318 - BLOCK
      ?auto_564319 - BLOCK
      ?auto_564320 - BLOCK
      ?auto_564321 - BLOCK
      ?auto_564322 - BLOCK
      ?auto_564323 - BLOCK
      ?auto_564324 - BLOCK
      ?auto_564325 - BLOCK
      ?auto_564326 - BLOCK
      ?auto_564327 - BLOCK
      ?auto_564328 - BLOCK
      ?auto_564329 - BLOCK
      ?auto_564330 - BLOCK
      ?auto_564331 - BLOCK
    )
    :vars
    (
      ?auto_564332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564331 ?auto_564332 ) ( ON-TABLE ?auto_564316 ) ( ON ?auto_564317 ?auto_564316 ) ( ON ?auto_564318 ?auto_564317 ) ( ON ?auto_564319 ?auto_564318 ) ( ON ?auto_564320 ?auto_564319 ) ( ON ?auto_564321 ?auto_564320 ) ( ON ?auto_564322 ?auto_564321 ) ( ON ?auto_564323 ?auto_564322 ) ( ON ?auto_564324 ?auto_564323 ) ( ON ?auto_564325 ?auto_564324 ) ( ON ?auto_564326 ?auto_564325 ) ( ON ?auto_564327 ?auto_564326 ) ( ON ?auto_564328 ?auto_564327 ) ( ON ?auto_564329 ?auto_564328 ) ( not ( = ?auto_564316 ?auto_564317 ) ) ( not ( = ?auto_564316 ?auto_564318 ) ) ( not ( = ?auto_564316 ?auto_564319 ) ) ( not ( = ?auto_564316 ?auto_564320 ) ) ( not ( = ?auto_564316 ?auto_564321 ) ) ( not ( = ?auto_564316 ?auto_564322 ) ) ( not ( = ?auto_564316 ?auto_564323 ) ) ( not ( = ?auto_564316 ?auto_564324 ) ) ( not ( = ?auto_564316 ?auto_564325 ) ) ( not ( = ?auto_564316 ?auto_564326 ) ) ( not ( = ?auto_564316 ?auto_564327 ) ) ( not ( = ?auto_564316 ?auto_564328 ) ) ( not ( = ?auto_564316 ?auto_564329 ) ) ( not ( = ?auto_564316 ?auto_564330 ) ) ( not ( = ?auto_564316 ?auto_564331 ) ) ( not ( = ?auto_564316 ?auto_564332 ) ) ( not ( = ?auto_564317 ?auto_564318 ) ) ( not ( = ?auto_564317 ?auto_564319 ) ) ( not ( = ?auto_564317 ?auto_564320 ) ) ( not ( = ?auto_564317 ?auto_564321 ) ) ( not ( = ?auto_564317 ?auto_564322 ) ) ( not ( = ?auto_564317 ?auto_564323 ) ) ( not ( = ?auto_564317 ?auto_564324 ) ) ( not ( = ?auto_564317 ?auto_564325 ) ) ( not ( = ?auto_564317 ?auto_564326 ) ) ( not ( = ?auto_564317 ?auto_564327 ) ) ( not ( = ?auto_564317 ?auto_564328 ) ) ( not ( = ?auto_564317 ?auto_564329 ) ) ( not ( = ?auto_564317 ?auto_564330 ) ) ( not ( = ?auto_564317 ?auto_564331 ) ) ( not ( = ?auto_564317 ?auto_564332 ) ) ( not ( = ?auto_564318 ?auto_564319 ) ) ( not ( = ?auto_564318 ?auto_564320 ) ) ( not ( = ?auto_564318 ?auto_564321 ) ) ( not ( = ?auto_564318 ?auto_564322 ) ) ( not ( = ?auto_564318 ?auto_564323 ) ) ( not ( = ?auto_564318 ?auto_564324 ) ) ( not ( = ?auto_564318 ?auto_564325 ) ) ( not ( = ?auto_564318 ?auto_564326 ) ) ( not ( = ?auto_564318 ?auto_564327 ) ) ( not ( = ?auto_564318 ?auto_564328 ) ) ( not ( = ?auto_564318 ?auto_564329 ) ) ( not ( = ?auto_564318 ?auto_564330 ) ) ( not ( = ?auto_564318 ?auto_564331 ) ) ( not ( = ?auto_564318 ?auto_564332 ) ) ( not ( = ?auto_564319 ?auto_564320 ) ) ( not ( = ?auto_564319 ?auto_564321 ) ) ( not ( = ?auto_564319 ?auto_564322 ) ) ( not ( = ?auto_564319 ?auto_564323 ) ) ( not ( = ?auto_564319 ?auto_564324 ) ) ( not ( = ?auto_564319 ?auto_564325 ) ) ( not ( = ?auto_564319 ?auto_564326 ) ) ( not ( = ?auto_564319 ?auto_564327 ) ) ( not ( = ?auto_564319 ?auto_564328 ) ) ( not ( = ?auto_564319 ?auto_564329 ) ) ( not ( = ?auto_564319 ?auto_564330 ) ) ( not ( = ?auto_564319 ?auto_564331 ) ) ( not ( = ?auto_564319 ?auto_564332 ) ) ( not ( = ?auto_564320 ?auto_564321 ) ) ( not ( = ?auto_564320 ?auto_564322 ) ) ( not ( = ?auto_564320 ?auto_564323 ) ) ( not ( = ?auto_564320 ?auto_564324 ) ) ( not ( = ?auto_564320 ?auto_564325 ) ) ( not ( = ?auto_564320 ?auto_564326 ) ) ( not ( = ?auto_564320 ?auto_564327 ) ) ( not ( = ?auto_564320 ?auto_564328 ) ) ( not ( = ?auto_564320 ?auto_564329 ) ) ( not ( = ?auto_564320 ?auto_564330 ) ) ( not ( = ?auto_564320 ?auto_564331 ) ) ( not ( = ?auto_564320 ?auto_564332 ) ) ( not ( = ?auto_564321 ?auto_564322 ) ) ( not ( = ?auto_564321 ?auto_564323 ) ) ( not ( = ?auto_564321 ?auto_564324 ) ) ( not ( = ?auto_564321 ?auto_564325 ) ) ( not ( = ?auto_564321 ?auto_564326 ) ) ( not ( = ?auto_564321 ?auto_564327 ) ) ( not ( = ?auto_564321 ?auto_564328 ) ) ( not ( = ?auto_564321 ?auto_564329 ) ) ( not ( = ?auto_564321 ?auto_564330 ) ) ( not ( = ?auto_564321 ?auto_564331 ) ) ( not ( = ?auto_564321 ?auto_564332 ) ) ( not ( = ?auto_564322 ?auto_564323 ) ) ( not ( = ?auto_564322 ?auto_564324 ) ) ( not ( = ?auto_564322 ?auto_564325 ) ) ( not ( = ?auto_564322 ?auto_564326 ) ) ( not ( = ?auto_564322 ?auto_564327 ) ) ( not ( = ?auto_564322 ?auto_564328 ) ) ( not ( = ?auto_564322 ?auto_564329 ) ) ( not ( = ?auto_564322 ?auto_564330 ) ) ( not ( = ?auto_564322 ?auto_564331 ) ) ( not ( = ?auto_564322 ?auto_564332 ) ) ( not ( = ?auto_564323 ?auto_564324 ) ) ( not ( = ?auto_564323 ?auto_564325 ) ) ( not ( = ?auto_564323 ?auto_564326 ) ) ( not ( = ?auto_564323 ?auto_564327 ) ) ( not ( = ?auto_564323 ?auto_564328 ) ) ( not ( = ?auto_564323 ?auto_564329 ) ) ( not ( = ?auto_564323 ?auto_564330 ) ) ( not ( = ?auto_564323 ?auto_564331 ) ) ( not ( = ?auto_564323 ?auto_564332 ) ) ( not ( = ?auto_564324 ?auto_564325 ) ) ( not ( = ?auto_564324 ?auto_564326 ) ) ( not ( = ?auto_564324 ?auto_564327 ) ) ( not ( = ?auto_564324 ?auto_564328 ) ) ( not ( = ?auto_564324 ?auto_564329 ) ) ( not ( = ?auto_564324 ?auto_564330 ) ) ( not ( = ?auto_564324 ?auto_564331 ) ) ( not ( = ?auto_564324 ?auto_564332 ) ) ( not ( = ?auto_564325 ?auto_564326 ) ) ( not ( = ?auto_564325 ?auto_564327 ) ) ( not ( = ?auto_564325 ?auto_564328 ) ) ( not ( = ?auto_564325 ?auto_564329 ) ) ( not ( = ?auto_564325 ?auto_564330 ) ) ( not ( = ?auto_564325 ?auto_564331 ) ) ( not ( = ?auto_564325 ?auto_564332 ) ) ( not ( = ?auto_564326 ?auto_564327 ) ) ( not ( = ?auto_564326 ?auto_564328 ) ) ( not ( = ?auto_564326 ?auto_564329 ) ) ( not ( = ?auto_564326 ?auto_564330 ) ) ( not ( = ?auto_564326 ?auto_564331 ) ) ( not ( = ?auto_564326 ?auto_564332 ) ) ( not ( = ?auto_564327 ?auto_564328 ) ) ( not ( = ?auto_564327 ?auto_564329 ) ) ( not ( = ?auto_564327 ?auto_564330 ) ) ( not ( = ?auto_564327 ?auto_564331 ) ) ( not ( = ?auto_564327 ?auto_564332 ) ) ( not ( = ?auto_564328 ?auto_564329 ) ) ( not ( = ?auto_564328 ?auto_564330 ) ) ( not ( = ?auto_564328 ?auto_564331 ) ) ( not ( = ?auto_564328 ?auto_564332 ) ) ( not ( = ?auto_564329 ?auto_564330 ) ) ( not ( = ?auto_564329 ?auto_564331 ) ) ( not ( = ?auto_564329 ?auto_564332 ) ) ( not ( = ?auto_564330 ?auto_564331 ) ) ( not ( = ?auto_564330 ?auto_564332 ) ) ( not ( = ?auto_564331 ?auto_564332 ) ) ( CLEAR ?auto_564329 ) ( ON ?auto_564330 ?auto_564331 ) ( CLEAR ?auto_564330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_564316 ?auto_564317 ?auto_564318 ?auto_564319 ?auto_564320 ?auto_564321 ?auto_564322 ?auto_564323 ?auto_564324 ?auto_564325 ?auto_564326 ?auto_564327 ?auto_564328 ?auto_564329 ?auto_564330 )
      ( MAKE-16PILE ?auto_564316 ?auto_564317 ?auto_564318 ?auto_564319 ?auto_564320 ?auto_564321 ?auto_564322 ?auto_564323 ?auto_564324 ?auto_564325 ?auto_564326 ?auto_564327 ?auto_564328 ?auto_564329 ?auto_564330 ?auto_564331 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564349 - BLOCK
      ?auto_564350 - BLOCK
      ?auto_564351 - BLOCK
      ?auto_564352 - BLOCK
      ?auto_564353 - BLOCK
      ?auto_564354 - BLOCK
      ?auto_564355 - BLOCK
      ?auto_564356 - BLOCK
      ?auto_564357 - BLOCK
      ?auto_564358 - BLOCK
      ?auto_564359 - BLOCK
      ?auto_564360 - BLOCK
      ?auto_564361 - BLOCK
      ?auto_564362 - BLOCK
      ?auto_564363 - BLOCK
      ?auto_564364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564364 ) ( ON-TABLE ?auto_564349 ) ( ON ?auto_564350 ?auto_564349 ) ( ON ?auto_564351 ?auto_564350 ) ( ON ?auto_564352 ?auto_564351 ) ( ON ?auto_564353 ?auto_564352 ) ( ON ?auto_564354 ?auto_564353 ) ( ON ?auto_564355 ?auto_564354 ) ( ON ?auto_564356 ?auto_564355 ) ( ON ?auto_564357 ?auto_564356 ) ( ON ?auto_564358 ?auto_564357 ) ( ON ?auto_564359 ?auto_564358 ) ( ON ?auto_564360 ?auto_564359 ) ( ON ?auto_564361 ?auto_564360 ) ( ON ?auto_564362 ?auto_564361 ) ( not ( = ?auto_564349 ?auto_564350 ) ) ( not ( = ?auto_564349 ?auto_564351 ) ) ( not ( = ?auto_564349 ?auto_564352 ) ) ( not ( = ?auto_564349 ?auto_564353 ) ) ( not ( = ?auto_564349 ?auto_564354 ) ) ( not ( = ?auto_564349 ?auto_564355 ) ) ( not ( = ?auto_564349 ?auto_564356 ) ) ( not ( = ?auto_564349 ?auto_564357 ) ) ( not ( = ?auto_564349 ?auto_564358 ) ) ( not ( = ?auto_564349 ?auto_564359 ) ) ( not ( = ?auto_564349 ?auto_564360 ) ) ( not ( = ?auto_564349 ?auto_564361 ) ) ( not ( = ?auto_564349 ?auto_564362 ) ) ( not ( = ?auto_564349 ?auto_564363 ) ) ( not ( = ?auto_564349 ?auto_564364 ) ) ( not ( = ?auto_564350 ?auto_564351 ) ) ( not ( = ?auto_564350 ?auto_564352 ) ) ( not ( = ?auto_564350 ?auto_564353 ) ) ( not ( = ?auto_564350 ?auto_564354 ) ) ( not ( = ?auto_564350 ?auto_564355 ) ) ( not ( = ?auto_564350 ?auto_564356 ) ) ( not ( = ?auto_564350 ?auto_564357 ) ) ( not ( = ?auto_564350 ?auto_564358 ) ) ( not ( = ?auto_564350 ?auto_564359 ) ) ( not ( = ?auto_564350 ?auto_564360 ) ) ( not ( = ?auto_564350 ?auto_564361 ) ) ( not ( = ?auto_564350 ?auto_564362 ) ) ( not ( = ?auto_564350 ?auto_564363 ) ) ( not ( = ?auto_564350 ?auto_564364 ) ) ( not ( = ?auto_564351 ?auto_564352 ) ) ( not ( = ?auto_564351 ?auto_564353 ) ) ( not ( = ?auto_564351 ?auto_564354 ) ) ( not ( = ?auto_564351 ?auto_564355 ) ) ( not ( = ?auto_564351 ?auto_564356 ) ) ( not ( = ?auto_564351 ?auto_564357 ) ) ( not ( = ?auto_564351 ?auto_564358 ) ) ( not ( = ?auto_564351 ?auto_564359 ) ) ( not ( = ?auto_564351 ?auto_564360 ) ) ( not ( = ?auto_564351 ?auto_564361 ) ) ( not ( = ?auto_564351 ?auto_564362 ) ) ( not ( = ?auto_564351 ?auto_564363 ) ) ( not ( = ?auto_564351 ?auto_564364 ) ) ( not ( = ?auto_564352 ?auto_564353 ) ) ( not ( = ?auto_564352 ?auto_564354 ) ) ( not ( = ?auto_564352 ?auto_564355 ) ) ( not ( = ?auto_564352 ?auto_564356 ) ) ( not ( = ?auto_564352 ?auto_564357 ) ) ( not ( = ?auto_564352 ?auto_564358 ) ) ( not ( = ?auto_564352 ?auto_564359 ) ) ( not ( = ?auto_564352 ?auto_564360 ) ) ( not ( = ?auto_564352 ?auto_564361 ) ) ( not ( = ?auto_564352 ?auto_564362 ) ) ( not ( = ?auto_564352 ?auto_564363 ) ) ( not ( = ?auto_564352 ?auto_564364 ) ) ( not ( = ?auto_564353 ?auto_564354 ) ) ( not ( = ?auto_564353 ?auto_564355 ) ) ( not ( = ?auto_564353 ?auto_564356 ) ) ( not ( = ?auto_564353 ?auto_564357 ) ) ( not ( = ?auto_564353 ?auto_564358 ) ) ( not ( = ?auto_564353 ?auto_564359 ) ) ( not ( = ?auto_564353 ?auto_564360 ) ) ( not ( = ?auto_564353 ?auto_564361 ) ) ( not ( = ?auto_564353 ?auto_564362 ) ) ( not ( = ?auto_564353 ?auto_564363 ) ) ( not ( = ?auto_564353 ?auto_564364 ) ) ( not ( = ?auto_564354 ?auto_564355 ) ) ( not ( = ?auto_564354 ?auto_564356 ) ) ( not ( = ?auto_564354 ?auto_564357 ) ) ( not ( = ?auto_564354 ?auto_564358 ) ) ( not ( = ?auto_564354 ?auto_564359 ) ) ( not ( = ?auto_564354 ?auto_564360 ) ) ( not ( = ?auto_564354 ?auto_564361 ) ) ( not ( = ?auto_564354 ?auto_564362 ) ) ( not ( = ?auto_564354 ?auto_564363 ) ) ( not ( = ?auto_564354 ?auto_564364 ) ) ( not ( = ?auto_564355 ?auto_564356 ) ) ( not ( = ?auto_564355 ?auto_564357 ) ) ( not ( = ?auto_564355 ?auto_564358 ) ) ( not ( = ?auto_564355 ?auto_564359 ) ) ( not ( = ?auto_564355 ?auto_564360 ) ) ( not ( = ?auto_564355 ?auto_564361 ) ) ( not ( = ?auto_564355 ?auto_564362 ) ) ( not ( = ?auto_564355 ?auto_564363 ) ) ( not ( = ?auto_564355 ?auto_564364 ) ) ( not ( = ?auto_564356 ?auto_564357 ) ) ( not ( = ?auto_564356 ?auto_564358 ) ) ( not ( = ?auto_564356 ?auto_564359 ) ) ( not ( = ?auto_564356 ?auto_564360 ) ) ( not ( = ?auto_564356 ?auto_564361 ) ) ( not ( = ?auto_564356 ?auto_564362 ) ) ( not ( = ?auto_564356 ?auto_564363 ) ) ( not ( = ?auto_564356 ?auto_564364 ) ) ( not ( = ?auto_564357 ?auto_564358 ) ) ( not ( = ?auto_564357 ?auto_564359 ) ) ( not ( = ?auto_564357 ?auto_564360 ) ) ( not ( = ?auto_564357 ?auto_564361 ) ) ( not ( = ?auto_564357 ?auto_564362 ) ) ( not ( = ?auto_564357 ?auto_564363 ) ) ( not ( = ?auto_564357 ?auto_564364 ) ) ( not ( = ?auto_564358 ?auto_564359 ) ) ( not ( = ?auto_564358 ?auto_564360 ) ) ( not ( = ?auto_564358 ?auto_564361 ) ) ( not ( = ?auto_564358 ?auto_564362 ) ) ( not ( = ?auto_564358 ?auto_564363 ) ) ( not ( = ?auto_564358 ?auto_564364 ) ) ( not ( = ?auto_564359 ?auto_564360 ) ) ( not ( = ?auto_564359 ?auto_564361 ) ) ( not ( = ?auto_564359 ?auto_564362 ) ) ( not ( = ?auto_564359 ?auto_564363 ) ) ( not ( = ?auto_564359 ?auto_564364 ) ) ( not ( = ?auto_564360 ?auto_564361 ) ) ( not ( = ?auto_564360 ?auto_564362 ) ) ( not ( = ?auto_564360 ?auto_564363 ) ) ( not ( = ?auto_564360 ?auto_564364 ) ) ( not ( = ?auto_564361 ?auto_564362 ) ) ( not ( = ?auto_564361 ?auto_564363 ) ) ( not ( = ?auto_564361 ?auto_564364 ) ) ( not ( = ?auto_564362 ?auto_564363 ) ) ( not ( = ?auto_564362 ?auto_564364 ) ) ( not ( = ?auto_564363 ?auto_564364 ) ) ( CLEAR ?auto_564362 ) ( ON ?auto_564363 ?auto_564364 ) ( CLEAR ?auto_564363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_564349 ?auto_564350 ?auto_564351 ?auto_564352 ?auto_564353 ?auto_564354 ?auto_564355 ?auto_564356 ?auto_564357 ?auto_564358 ?auto_564359 ?auto_564360 ?auto_564361 ?auto_564362 ?auto_564363 )
      ( MAKE-16PILE ?auto_564349 ?auto_564350 ?auto_564351 ?auto_564352 ?auto_564353 ?auto_564354 ?auto_564355 ?auto_564356 ?auto_564357 ?auto_564358 ?auto_564359 ?auto_564360 ?auto_564361 ?auto_564362 ?auto_564363 ?auto_564364 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564381 - BLOCK
      ?auto_564382 - BLOCK
      ?auto_564383 - BLOCK
      ?auto_564384 - BLOCK
      ?auto_564385 - BLOCK
      ?auto_564386 - BLOCK
      ?auto_564387 - BLOCK
      ?auto_564388 - BLOCK
      ?auto_564389 - BLOCK
      ?auto_564390 - BLOCK
      ?auto_564391 - BLOCK
      ?auto_564392 - BLOCK
      ?auto_564393 - BLOCK
      ?auto_564394 - BLOCK
      ?auto_564395 - BLOCK
      ?auto_564396 - BLOCK
    )
    :vars
    (
      ?auto_564397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564396 ?auto_564397 ) ( ON-TABLE ?auto_564381 ) ( ON ?auto_564382 ?auto_564381 ) ( ON ?auto_564383 ?auto_564382 ) ( ON ?auto_564384 ?auto_564383 ) ( ON ?auto_564385 ?auto_564384 ) ( ON ?auto_564386 ?auto_564385 ) ( ON ?auto_564387 ?auto_564386 ) ( ON ?auto_564388 ?auto_564387 ) ( ON ?auto_564389 ?auto_564388 ) ( ON ?auto_564390 ?auto_564389 ) ( ON ?auto_564391 ?auto_564390 ) ( ON ?auto_564392 ?auto_564391 ) ( ON ?auto_564393 ?auto_564392 ) ( not ( = ?auto_564381 ?auto_564382 ) ) ( not ( = ?auto_564381 ?auto_564383 ) ) ( not ( = ?auto_564381 ?auto_564384 ) ) ( not ( = ?auto_564381 ?auto_564385 ) ) ( not ( = ?auto_564381 ?auto_564386 ) ) ( not ( = ?auto_564381 ?auto_564387 ) ) ( not ( = ?auto_564381 ?auto_564388 ) ) ( not ( = ?auto_564381 ?auto_564389 ) ) ( not ( = ?auto_564381 ?auto_564390 ) ) ( not ( = ?auto_564381 ?auto_564391 ) ) ( not ( = ?auto_564381 ?auto_564392 ) ) ( not ( = ?auto_564381 ?auto_564393 ) ) ( not ( = ?auto_564381 ?auto_564394 ) ) ( not ( = ?auto_564381 ?auto_564395 ) ) ( not ( = ?auto_564381 ?auto_564396 ) ) ( not ( = ?auto_564381 ?auto_564397 ) ) ( not ( = ?auto_564382 ?auto_564383 ) ) ( not ( = ?auto_564382 ?auto_564384 ) ) ( not ( = ?auto_564382 ?auto_564385 ) ) ( not ( = ?auto_564382 ?auto_564386 ) ) ( not ( = ?auto_564382 ?auto_564387 ) ) ( not ( = ?auto_564382 ?auto_564388 ) ) ( not ( = ?auto_564382 ?auto_564389 ) ) ( not ( = ?auto_564382 ?auto_564390 ) ) ( not ( = ?auto_564382 ?auto_564391 ) ) ( not ( = ?auto_564382 ?auto_564392 ) ) ( not ( = ?auto_564382 ?auto_564393 ) ) ( not ( = ?auto_564382 ?auto_564394 ) ) ( not ( = ?auto_564382 ?auto_564395 ) ) ( not ( = ?auto_564382 ?auto_564396 ) ) ( not ( = ?auto_564382 ?auto_564397 ) ) ( not ( = ?auto_564383 ?auto_564384 ) ) ( not ( = ?auto_564383 ?auto_564385 ) ) ( not ( = ?auto_564383 ?auto_564386 ) ) ( not ( = ?auto_564383 ?auto_564387 ) ) ( not ( = ?auto_564383 ?auto_564388 ) ) ( not ( = ?auto_564383 ?auto_564389 ) ) ( not ( = ?auto_564383 ?auto_564390 ) ) ( not ( = ?auto_564383 ?auto_564391 ) ) ( not ( = ?auto_564383 ?auto_564392 ) ) ( not ( = ?auto_564383 ?auto_564393 ) ) ( not ( = ?auto_564383 ?auto_564394 ) ) ( not ( = ?auto_564383 ?auto_564395 ) ) ( not ( = ?auto_564383 ?auto_564396 ) ) ( not ( = ?auto_564383 ?auto_564397 ) ) ( not ( = ?auto_564384 ?auto_564385 ) ) ( not ( = ?auto_564384 ?auto_564386 ) ) ( not ( = ?auto_564384 ?auto_564387 ) ) ( not ( = ?auto_564384 ?auto_564388 ) ) ( not ( = ?auto_564384 ?auto_564389 ) ) ( not ( = ?auto_564384 ?auto_564390 ) ) ( not ( = ?auto_564384 ?auto_564391 ) ) ( not ( = ?auto_564384 ?auto_564392 ) ) ( not ( = ?auto_564384 ?auto_564393 ) ) ( not ( = ?auto_564384 ?auto_564394 ) ) ( not ( = ?auto_564384 ?auto_564395 ) ) ( not ( = ?auto_564384 ?auto_564396 ) ) ( not ( = ?auto_564384 ?auto_564397 ) ) ( not ( = ?auto_564385 ?auto_564386 ) ) ( not ( = ?auto_564385 ?auto_564387 ) ) ( not ( = ?auto_564385 ?auto_564388 ) ) ( not ( = ?auto_564385 ?auto_564389 ) ) ( not ( = ?auto_564385 ?auto_564390 ) ) ( not ( = ?auto_564385 ?auto_564391 ) ) ( not ( = ?auto_564385 ?auto_564392 ) ) ( not ( = ?auto_564385 ?auto_564393 ) ) ( not ( = ?auto_564385 ?auto_564394 ) ) ( not ( = ?auto_564385 ?auto_564395 ) ) ( not ( = ?auto_564385 ?auto_564396 ) ) ( not ( = ?auto_564385 ?auto_564397 ) ) ( not ( = ?auto_564386 ?auto_564387 ) ) ( not ( = ?auto_564386 ?auto_564388 ) ) ( not ( = ?auto_564386 ?auto_564389 ) ) ( not ( = ?auto_564386 ?auto_564390 ) ) ( not ( = ?auto_564386 ?auto_564391 ) ) ( not ( = ?auto_564386 ?auto_564392 ) ) ( not ( = ?auto_564386 ?auto_564393 ) ) ( not ( = ?auto_564386 ?auto_564394 ) ) ( not ( = ?auto_564386 ?auto_564395 ) ) ( not ( = ?auto_564386 ?auto_564396 ) ) ( not ( = ?auto_564386 ?auto_564397 ) ) ( not ( = ?auto_564387 ?auto_564388 ) ) ( not ( = ?auto_564387 ?auto_564389 ) ) ( not ( = ?auto_564387 ?auto_564390 ) ) ( not ( = ?auto_564387 ?auto_564391 ) ) ( not ( = ?auto_564387 ?auto_564392 ) ) ( not ( = ?auto_564387 ?auto_564393 ) ) ( not ( = ?auto_564387 ?auto_564394 ) ) ( not ( = ?auto_564387 ?auto_564395 ) ) ( not ( = ?auto_564387 ?auto_564396 ) ) ( not ( = ?auto_564387 ?auto_564397 ) ) ( not ( = ?auto_564388 ?auto_564389 ) ) ( not ( = ?auto_564388 ?auto_564390 ) ) ( not ( = ?auto_564388 ?auto_564391 ) ) ( not ( = ?auto_564388 ?auto_564392 ) ) ( not ( = ?auto_564388 ?auto_564393 ) ) ( not ( = ?auto_564388 ?auto_564394 ) ) ( not ( = ?auto_564388 ?auto_564395 ) ) ( not ( = ?auto_564388 ?auto_564396 ) ) ( not ( = ?auto_564388 ?auto_564397 ) ) ( not ( = ?auto_564389 ?auto_564390 ) ) ( not ( = ?auto_564389 ?auto_564391 ) ) ( not ( = ?auto_564389 ?auto_564392 ) ) ( not ( = ?auto_564389 ?auto_564393 ) ) ( not ( = ?auto_564389 ?auto_564394 ) ) ( not ( = ?auto_564389 ?auto_564395 ) ) ( not ( = ?auto_564389 ?auto_564396 ) ) ( not ( = ?auto_564389 ?auto_564397 ) ) ( not ( = ?auto_564390 ?auto_564391 ) ) ( not ( = ?auto_564390 ?auto_564392 ) ) ( not ( = ?auto_564390 ?auto_564393 ) ) ( not ( = ?auto_564390 ?auto_564394 ) ) ( not ( = ?auto_564390 ?auto_564395 ) ) ( not ( = ?auto_564390 ?auto_564396 ) ) ( not ( = ?auto_564390 ?auto_564397 ) ) ( not ( = ?auto_564391 ?auto_564392 ) ) ( not ( = ?auto_564391 ?auto_564393 ) ) ( not ( = ?auto_564391 ?auto_564394 ) ) ( not ( = ?auto_564391 ?auto_564395 ) ) ( not ( = ?auto_564391 ?auto_564396 ) ) ( not ( = ?auto_564391 ?auto_564397 ) ) ( not ( = ?auto_564392 ?auto_564393 ) ) ( not ( = ?auto_564392 ?auto_564394 ) ) ( not ( = ?auto_564392 ?auto_564395 ) ) ( not ( = ?auto_564392 ?auto_564396 ) ) ( not ( = ?auto_564392 ?auto_564397 ) ) ( not ( = ?auto_564393 ?auto_564394 ) ) ( not ( = ?auto_564393 ?auto_564395 ) ) ( not ( = ?auto_564393 ?auto_564396 ) ) ( not ( = ?auto_564393 ?auto_564397 ) ) ( not ( = ?auto_564394 ?auto_564395 ) ) ( not ( = ?auto_564394 ?auto_564396 ) ) ( not ( = ?auto_564394 ?auto_564397 ) ) ( not ( = ?auto_564395 ?auto_564396 ) ) ( not ( = ?auto_564395 ?auto_564397 ) ) ( not ( = ?auto_564396 ?auto_564397 ) ) ( ON ?auto_564395 ?auto_564396 ) ( CLEAR ?auto_564393 ) ( ON ?auto_564394 ?auto_564395 ) ( CLEAR ?auto_564394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_564381 ?auto_564382 ?auto_564383 ?auto_564384 ?auto_564385 ?auto_564386 ?auto_564387 ?auto_564388 ?auto_564389 ?auto_564390 ?auto_564391 ?auto_564392 ?auto_564393 ?auto_564394 )
      ( MAKE-16PILE ?auto_564381 ?auto_564382 ?auto_564383 ?auto_564384 ?auto_564385 ?auto_564386 ?auto_564387 ?auto_564388 ?auto_564389 ?auto_564390 ?auto_564391 ?auto_564392 ?auto_564393 ?auto_564394 ?auto_564395 ?auto_564396 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564414 - BLOCK
      ?auto_564415 - BLOCK
      ?auto_564416 - BLOCK
      ?auto_564417 - BLOCK
      ?auto_564418 - BLOCK
      ?auto_564419 - BLOCK
      ?auto_564420 - BLOCK
      ?auto_564421 - BLOCK
      ?auto_564422 - BLOCK
      ?auto_564423 - BLOCK
      ?auto_564424 - BLOCK
      ?auto_564425 - BLOCK
      ?auto_564426 - BLOCK
      ?auto_564427 - BLOCK
      ?auto_564428 - BLOCK
      ?auto_564429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564429 ) ( ON-TABLE ?auto_564414 ) ( ON ?auto_564415 ?auto_564414 ) ( ON ?auto_564416 ?auto_564415 ) ( ON ?auto_564417 ?auto_564416 ) ( ON ?auto_564418 ?auto_564417 ) ( ON ?auto_564419 ?auto_564418 ) ( ON ?auto_564420 ?auto_564419 ) ( ON ?auto_564421 ?auto_564420 ) ( ON ?auto_564422 ?auto_564421 ) ( ON ?auto_564423 ?auto_564422 ) ( ON ?auto_564424 ?auto_564423 ) ( ON ?auto_564425 ?auto_564424 ) ( ON ?auto_564426 ?auto_564425 ) ( not ( = ?auto_564414 ?auto_564415 ) ) ( not ( = ?auto_564414 ?auto_564416 ) ) ( not ( = ?auto_564414 ?auto_564417 ) ) ( not ( = ?auto_564414 ?auto_564418 ) ) ( not ( = ?auto_564414 ?auto_564419 ) ) ( not ( = ?auto_564414 ?auto_564420 ) ) ( not ( = ?auto_564414 ?auto_564421 ) ) ( not ( = ?auto_564414 ?auto_564422 ) ) ( not ( = ?auto_564414 ?auto_564423 ) ) ( not ( = ?auto_564414 ?auto_564424 ) ) ( not ( = ?auto_564414 ?auto_564425 ) ) ( not ( = ?auto_564414 ?auto_564426 ) ) ( not ( = ?auto_564414 ?auto_564427 ) ) ( not ( = ?auto_564414 ?auto_564428 ) ) ( not ( = ?auto_564414 ?auto_564429 ) ) ( not ( = ?auto_564415 ?auto_564416 ) ) ( not ( = ?auto_564415 ?auto_564417 ) ) ( not ( = ?auto_564415 ?auto_564418 ) ) ( not ( = ?auto_564415 ?auto_564419 ) ) ( not ( = ?auto_564415 ?auto_564420 ) ) ( not ( = ?auto_564415 ?auto_564421 ) ) ( not ( = ?auto_564415 ?auto_564422 ) ) ( not ( = ?auto_564415 ?auto_564423 ) ) ( not ( = ?auto_564415 ?auto_564424 ) ) ( not ( = ?auto_564415 ?auto_564425 ) ) ( not ( = ?auto_564415 ?auto_564426 ) ) ( not ( = ?auto_564415 ?auto_564427 ) ) ( not ( = ?auto_564415 ?auto_564428 ) ) ( not ( = ?auto_564415 ?auto_564429 ) ) ( not ( = ?auto_564416 ?auto_564417 ) ) ( not ( = ?auto_564416 ?auto_564418 ) ) ( not ( = ?auto_564416 ?auto_564419 ) ) ( not ( = ?auto_564416 ?auto_564420 ) ) ( not ( = ?auto_564416 ?auto_564421 ) ) ( not ( = ?auto_564416 ?auto_564422 ) ) ( not ( = ?auto_564416 ?auto_564423 ) ) ( not ( = ?auto_564416 ?auto_564424 ) ) ( not ( = ?auto_564416 ?auto_564425 ) ) ( not ( = ?auto_564416 ?auto_564426 ) ) ( not ( = ?auto_564416 ?auto_564427 ) ) ( not ( = ?auto_564416 ?auto_564428 ) ) ( not ( = ?auto_564416 ?auto_564429 ) ) ( not ( = ?auto_564417 ?auto_564418 ) ) ( not ( = ?auto_564417 ?auto_564419 ) ) ( not ( = ?auto_564417 ?auto_564420 ) ) ( not ( = ?auto_564417 ?auto_564421 ) ) ( not ( = ?auto_564417 ?auto_564422 ) ) ( not ( = ?auto_564417 ?auto_564423 ) ) ( not ( = ?auto_564417 ?auto_564424 ) ) ( not ( = ?auto_564417 ?auto_564425 ) ) ( not ( = ?auto_564417 ?auto_564426 ) ) ( not ( = ?auto_564417 ?auto_564427 ) ) ( not ( = ?auto_564417 ?auto_564428 ) ) ( not ( = ?auto_564417 ?auto_564429 ) ) ( not ( = ?auto_564418 ?auto_564419 ) ) ( not ( = ?auto_564418 ?auto_564420 ) ) ( not ( = ?auto_564418 ?auto_564421 ) ) ( not ( = ?auto_564418 ?auto_564422 ) ) ( not ( = ?auto_564418 ?auto_564423 ) ) ( not ( = ?auto_564418 ?auto_564424 ) ) ( not ( = ?auto_564418 ?auto_564425 ) ) ( not ( = ?auto_564418 ?auto_564426 ) ) ( not ( = ?auto_564418 ?auto_564427 ) ) ( not ( = ?auto_564418 ?auto_564428 ) ) ( not ( = ?auto_564418 ?auto_564429 ) ) ( not ( = ?auto_564419 ?auto_564420 ) ) ( not ( = ?auto_564419 ?auto_564421 ) ) ( not ( = ?auto_564419 ?auto_564422 ) ) ( not ( = ?auto_564419 ?auto_564423 ) ) ( not ( = ?auto_564419 ?auto_564424 ) ) ( not ( = ?auto_564419 ?auto_564425 ) ) ( not ( = ?auto_564419 ?auto_564426 ) ) ( not ( = ?auto_564419 ?auto_564427 ) ) ( not ( = ?auto_564419 ?auto_564428 ) ) ( not ( = ?auto_564419 ?auto_564429 ) ) ( not ( = ?auto_564420 ?auto_564421 ) ) ( not ( = ?auto_564420 ?auto_564422 ) ) ( not ( = ?auto_564420 ?auto_564423 ) ) ( not ( = ?auto_564420 ?auto_564424 ) ) ( not ( = ?auto_564420 ?auto_564425 ) ) ( not ( = ?auto_564420 ?auto_564426 ) ) ( not ( = ?auto_564420 ?auto_564427 ) ) ( not ( = ?auto_564420 ?auto_564428 ) ) ( not ( = ?auto_564420 ?auto_564429 ) ) ( not ( = ?auto_564421 ?auto_564422 ) ) ( not ( = ?auto_564421 ?auto_564423 ) ) ( not ( = ?auto_564421 ?auto_564424 ) ) ( not ( = ?auto_564421 ?auto_564425 ) ) ( not ( = ?auto_564421 ?auto_564426 ) ) ( not ( = ?auto_564421 ?auto_564427 ) ) ( not ( = ?auto_564421 ?auto_564428 ) ) ( not ( = ?auto_564421 ?auto_564429 ) ) ( not ( = ?auto_564422 ?auto_564423 ) ) ( not ( = ?auto_564422 ?auto_564424 ) ) ( not ( = ?auto_564422 ?auto_564425 ) ) ( not ( = ?auto_564422 ?auto_564426 ) ) ( not ( = ?auto_564422 ?auto_564427 ) ) ( not ( = ?auto_564422 ?auto_564428 ) ) ( not ( = ?auto_564422 ?auto_564429 ) ) ( not ( = ?auto_564423 ?auto_564424 ) ) ( not ( = ?auto_564423 ?auto_564425 ) ) ( not ( = ?auto_564423 ?auto_564426 ) ) ( not ( = ?auto_564423 ?auto_564427 ) ) ( not ( = ?auto_564423 ?auto_564428 ) ) ( not ( = ?auto_564423 ?auto_564429 ) ) ( not ( = ?auto_564424 ?auto_564425 ) ) ( not ( = ?auto_564424 ?auto_564426 ) ) ( not ( = ?auto_564424 ?auto_564427 ) ) ( not ( = ?auto_564424 ?auto_564428 ) ) ( not ( = ?auto_564424 ?auto_564429 ) ) ( not ( = ?auto_564425 ?auto_564426 ) ) ( not ( = ?auto_564425 ?auto_564427 ) ) ( not ( = ?auto_564425 ?auto_564428 ) ) ( not ( = ?auto_564425 ?auto_564429 ) ) ( not ( = ?auto_564426 ?auto_564427 ) ) ( not ( = ?auto_564426 ?auto_564428 ) ) ( not ( = ?auto_564426 ?auto_564429 ) ) ( not ( = ?auto_564427 ?auto_564428 ) ) ( not ( = ?auto_564427 ?auto_564429 ) ) ( not ( = ?auto_564428 ?auto_564429 ) ) ( ON ?auto_564428 ?auto_564429 ) ( CLEAR ?auto_564426 ) ( ON ?auto_564427 ?auto_564428 ) ( CLEAR ?auto_564427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_564414 ?auto_564415 ?auto_564416 ?auto_564417 ?auto_564418 ?auto_564419 ?auto_564420 ?auto_564421 ?auto_564422 ?auto_564423 ?auto_564424 ?auto_564425 ?auto_564426 ?auto_564427 )
      ( MAKE-16PILE ?auto_564414 ?auto_564415 ?auto_564416 ?auto_564417 ?auto_564418 ?auto_564419 ?auto_564420 ?auto_564421 ?auto_564422 ?auto_564423 ?auto_564424 ?auto_564425 ?auto_564426 ?auto_564427 ?auto_564428 ?auto_564429 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564446 - BLOCK
      ?auto_564447 - BLOCK
      ?auto_564448 - BLOCK
      ?auto_564449 - BLOCK
      ?auto_564450 - BLOCK
      ?auto_564451 - BLOCK
      ?auto_564452 - BLOCK
      ?auto_564453 - BLOCK
      ?auto_564454 - BLOCK
      ?auto_564455 - BLOCK
      ?auto_564456 - BLOCK
      ?auto_564457 - BLOCK
      ?auto_564458 - BLOCK
      ?auto_564459 - BLOCK
      ?auto_564460 - BLOCK
      ?auto_564461 - BLOCK
    )
    :vars
    (
      ?auto_564462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564461 ?auto_564462 ) ( ON-TABLE ?auto_564446 ) ( ON ?auto_564447 ?auto_564446 ) ( ON ?auto_564448 ?auto_564447 ) ( ON ?auto_564449 ?auto_564448 ) ( ON ?auto_564450 ?auto_564449 ) ( ON ?auto_564451 ?auto_564450 ) ( ON ?auto_564452 ?auto_564451 ) ( ON ?auto_564453 ?auto_564452 ) ( ON ?auto_564454 ?auto_564453 ) ( ON ?auto_564455 ?auto_564454 ) ( ON ?auto_564456 ?auto_564455 ) ( ON ?auto_564457 ?auto_564456 ) ( not ( = ?auto_564446 ?auto_564447 ) ) ( not ( = ?auto_564446 ?auto_564448 ) ) ( not ( = ?auto_564446 ?auto_564449 ) ) ( not ( = ?auto_564446 ?auto_564450 ) ) ( not ( = ?auto_564446 ?auto_564451 ) ) ( not ( = ?auto_564446 ?auto_564452 ) ) ( not ( = ?auto_564446 ?auto_564453 ) ) ( not ( = ?auto_564446 ?auto_564454 ) ) ( not ( = ?auto_564446 ?auto_564455 ) ) ( not ( = ?auto_564446 ?auto_564456 ) ) ( not ( = ?auto_564446 ?auto_564457 ) ) ( not ( = ?auto_564446 ?auto_564458 ) ) ( not ( = ?auto_564446 ?auto_564459 ) ) ( not ( = ?auto_564446 ?auto_564460 ) ) ( not ( = ?auto_564446 ?auto_564461 ) ) ( not ( = ?auto_564446 ?auto_564462 ) ) ( not ( = ?auto_564447 ?auto_564448 ) ) ( not ( = ?auto_564447 ?auto_564449 ) ) ( not ( = ?auto_564447 ?auto_564450 ) ) ( not ( = ?auto_564447 ?auto_564451 ) ) ( not ( = ?auto_564447 ?auto_564452 ) ) ( not ( = ?auto_564447 ?auto_564453 ) ) ( not ( = ?auto_564447 ?auto_564454 ) ) ( not ( = ?auto_564447 ?auto_564455 ) ) ( not ( = ?auto_564447 ?auto_564456 ) ) ( not ( = ?auto_564447 ?auto_564457 ) ) ( not ( = ?auto_564447 ?auto_564458 ) ) ( not ( = ?auto_564447 ?auto_564459 ) ) ( not ( = ?auto_564447 ?auto_564460 ) ) ( not ( = ?auto_564447 ?auto_564461 ) ) ( not ( = ?auto_564447 ?auto_564462 ) ) ( not ( = ?auto_564448 ?auto_564449 ) ) ( not ( = ?auto_564448 ?auto_564450 ) ) ( not ( = ?auto_564448 ?auto_564451 ) ) ( not ( = ?auto_564448 ?auto_564452 ) ) ( not ( = ?auto_564448 ?auto_564453 ) ) ( not ( = ?auto_564448 ?auto_564454 ) ) ( not ( = ?auto_564448 ?auto_564455 ) ) ( not ( = ?auto_564448 ?auto_564456 ) ) ( not ( = ?auto_564448 ?auto_564457 ) ) ( not ( = ?auto_564448 ?auto_564458 ) ) ( not ( = ?auto_564448 ?auto_564459 ) ) ( not ( = ?auto_564448 ?auto_564460 ) ) ( not ( = ?auto_564448 ?auto_564461 ) ) ( not ( = ?auto_564448 ?auto_564462 ) ) ( not ( = ?auto_564449 ?auto_564450 ) ) ( not ( = ?auto_564449 ?auto_564451 ) ) ( not ( = ?auto_564449 ?auto_564452 ) ) ( not ( = ?auto_564449 ?auto_564453 ) ) ( not ( = ?auto_564449 ?auto_564454 ) ) ( not ( = ?auto_564449 ?auto_564455 ) ) ( not ( = ?auto_564449 ?auto_564456 ) ) ( not ( = ?auto_564449 ?auto_564457 ) ) ( not ( = ?auto_564449 ?auto_564458 ) ) ( not ( = ?auto_564449 ?auto_564459 ) ) ( not ( = ?auto_564449 ?auto_564460 ) ) ( not ( = ?auto_564449 ?auto_564461 ) ) ( not ( = ?auto_564449 ?auto_564462 ) ) ( not ( = ?auto_564450 ?auto_564451 ) ) ( not ( = ?auto_564450 ?auto_564452 ) ) ( not ( = ?auto_564450 ?auto_564453 ) ) ( not ( = ?auto_564450 ?auto_564454 ) ) ( not ( = ?auto_564450 ?auto_564455 ) ) ( not ( = ?auto_564450 ?auto_564456 ) ) ( not ( = ?auto_564450 ?auto_564457 ) ) ( not ( = ?auto_564450 ?auto_564458 ) ) ( not ( = ?auto_564450 ?auto_564459 ) ) ( not ( = ?auto_564450 ?auto_564460 ) ) ( not ( = ?auto_564450 ?auto_564461 ) ) ( not ( = ?auto_564450 ?auto_564462 ) ) ( not ( = ?auto_564451 ?auto_564452 ) ) ( not ( = ?auto_564451 ?auto_564453 ) ) ( not ( = ?auto_564451 ?auto_564454 ) ) ( not ( = ?auto_564451 ?auto_564455 ) ) ( not ( = ?auto_564451 ?auto_564456 ) ) ( not ( = ?auto_564451 ?auto_564457 ) ) ( not ( = ?auto_564451 ?auto_564458 ) ) ( not ( = ?auto_564451 ?auto_564459 ) ) ( not ( = ?auto_564451 ?auto_564460 ) ) ( not ( = ?auto_564451 ?auto_564461 ) ) ( not ( = ?auto_564451 ?auto_564462 ) ) ( not ( = ?auto_564452 ?auto_564453 ) ) ( not ( = ?auto_564452 ?auto_564454 ) ) ( not ( = ?auto_564452 ?auto_564455 ) ) ( not ( = ?auto_564452 ?auto_564456 ) ) ( not ( = ?auto_564452 ?auto_564457 ) ) ( not ( = ?auto_564452 ?auto_564458 ) ) ( not ( = ?auto_564452 ?auto_564459 ) ) ( not ( = ?auto_564452 ?auto_564460 ) ) ( not ( = ?auto_564452 ?auto_564461 ) ) ( not ( = ?auto_564452 ?auto_564462 ) ) ( not ( = ?auto_564453 ?auto_564454 ) ) ( not ( = ?auto_564453 ?auto_564455 ) ) ( not ( = ?auto_564453 ?auto_564456 ) ) ( not ( = ?auto_564453 ?auto_564457 ) ) ( not ( = ?auto_564453 ?auto_564458 ) ) ( not ( = ?auto_564453 ?auto_564459 ) ) ( not ( = ?auto_564453 ?auto_564460 ) ) ( not ( = ?auto_564453 ?auto_564461 ) ) ( not ( = ?auto_564453 ?auto_564462 ) ) ( not ( = ?auto_564454 ?auto_564455 ) ) ( not ( = ?auto_564454 ?auto_564456 ) ) ( not ( = ?auto_564454 ?auto_564457 ) ) ( not ( = ?auto_564454 ?auto_564458 ) ) ( not ( = ?auto_564454 ?auto_564459 ) ) ( not ( = ?auto_564454 ?auto_564460 ) ) ( not ( = ?auto_564454 ?auto_564461 ) ) ( not ( = ?auto_564454 ?auto_564462 ) ) ( not ( = ?auto_564455 ?auto_564456 ) ) ( not ( = ?auto_564455 ?auto_564457 ) ) ( not ( = ?auto_564455 ?auto_564458 ) ) ( not ( = ?auto_564455 ?auto_564459 ) ) ( not ( = ?auto_564455 ?auto_564460 ) ) ( not ( = ?auto_564455 ?auto_564461 ) ) ( not ( = ?auto_564455 ?auto_564462 ) ) ( not ( = ?auto_564456 ?auto_564457 ) ) ( not ( = ?auto_564456 ?auto_564458 ) ) ( not ( = ?auto_564456 ?auto_564459 ) ) ( not ( = ?auto_564456 ?auto_564460 ) ) ( not ( = ?auto_564456 ?auto_564461 ) ) ( not ( = ?auto_564456 ?auto_564462 ) ) ( not ( = ?auto_564457 ?auto_564458 ) ) ( not ( = ?auto_564457 ?auto_564459 ) ) ( not ( = ?auto_564457 ?auto_564460 ) ) ( not ( = ?auto_564457 ?auto_564461 ) ) ( not ( = ?auto_564457 ?auto_564462 ) ) ( not ( = ?auto_564458 ?auto_564459 ) ) ( not ( = ?auto_564458 ?auto_564460 ) ) ( not ( = ?auto_564458 ?auto_564461 ) ) ( not ( = ?auto_564458 ?auto_564462 ) ) ( not ( = ?auto_564459 ?auto_564460 ) ) ( not ( = ?auto_564459 ?auto_564461 ) ) ( not ( = ?auto_564459 ?auto_564462 ) ) ( not ( = ?auto_564460 ?auto_564461 ) ) ( not ( = ?auto_564460 ?auto_564462 ) ) ( not ( = ?auto_564461 ?auto_564462 ) ) ( ON ?auto_564460 ?auto_564461 ) ( ON ?auto_564459 ?auto_564460 ) ( CLEAR ?auto_564457 ) ( ON ?auto_564458 ?auto_564459 ) ( CLEAR ?auto_564458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_564446 ?auto_564447 ?auto_564448 ?auto_564449 ?auto_564450 ?auto_564451 ?auto_564452 ?auto_564453 ?auto_564454 ?auto_564455 ?auto_564456 ?auto_564457 ?auto_564458 )
      ( MAKE-16PILE ?auto_564446 ?auto_564447 ?auto_564448 ?auto_564449 ?auto_564450 ?auto_564451 ?auto_564452 ?auto_564453 ?auto_564454 ?auto_564455 ?auto_564456 ?auto_564457 ?auto_564458 ?auto_564459 ?auto_564460 ?auto_564461 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564479 - BLOCK
      ?auto_564480 - BLOCK
      ?auto_564481 - BLOCK
      ?auto_564482 - BLOCK
      ?auto_564483 - BLOCK
      ?auto_564484 - BLOCK
      ?auto_564485 - BLOCK
      ?auto_564486 - BLOCK
      ?auto_564487 - BLOCK
      ?auto_564488 - BLOCK
      ?auto_564489 - BLOCK
      ?auto_564490 - BLOCK
      ?auto_564491 - BLOCK
      ?auto_564492 - BLOCK
      ?auto_564493 - BLOCK
      ?auto_564494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564494 ) ( ON-TABLE ?auto_564479 ) ( ON ?auto_564480 ?auto_564479 ) ( ON ?auto_564481 ?auto_564480 ) ( ON ?auto_564482 ?auto_564481 ) ( ON ?auto_564483 ?auto_564482 ) ( ON ?auto_564484 ?auto_564483 ) ( ON ?auto_564485 ?auto_564484 ) ( ON ?auto_564486 ?auto_564485 ) ( ON ?auto_564487 ?auto_564486 ) ( ON ?auto_564488 ?auto_564487 ) ( ON ?auto_564489 ?auto_564488 ) ( ON ?auto_564490 ?auto_564489 ) ( not ( = ?auto_564479 ?auto_564480 ) ) ( not ( = ?auto_564479 ?auto_564481 ) ) ( not ( = ?auto_564479 ?auto_564482 ) ) ( not ( = ?auto_564479 ?auto_564483 ) ) ( not ( = ?auto_564479 ?auto_564484 ) ) ( not ( = ?auto_564479 ?auto_564485 ) ) ( not ( = ?auto_564479 ?auto_564486 ) ) ( not ( = ?auto_564479 ?auto_564487 ) ) ( not ( = ?auto_564479 ?auto_564488 ) ) ( not ( = ?auto_564479 ?auto_564489 ) ) ( not ( = ?auto_564479 ?auto_564490 ) ) ( not ( = ?auto_564479 ?auto_564491 ) ) ( not ( = ?auto_564479 ?auto_564492 ) ) ( not ( = ?auto_564479 ?auto_564493 ) ) ( not ( = ?auto_564479 ?auto_564494 ) ) ( not ( = ?auto_564480 ?auto_564481 ) ) ( not ( = ?auto_564480 ?auto_564482 ) ) ( not ( = ?auto_564480 ?auto_564483 ) ) ( not ( = ?auto_564480 ?auto_564484 ) ) ( not ( = ?auto_564480 ?auto_564485 ) ) ( not ( = ?auto_564480 ?auto_564486 ) ) ( not ( = ?auto_564480 ?auto_564487 ) ) ( not ( = ?auto_564480 ?auto_564488 ) ) ( not ( = ?auto_564480 ?auto_564489 ) ) ( not ( = ?auto_564480 ?auto_564490 ) ) ( not ( = ?auto_564480 ?auto_564491 ) ) ( not ( = ?auto_564480 ?auto_564492 ) ) ( not ( = ?auto_564480 ?auto_564493 ) ) ( not ( = ?auto_564480 ?auto_564494 ) ) ( not ( = ?auto_564481 ?auto_564482 ) ) ( not ( = ?auto_564481 ?auto_564483 ) ) ( not ( = ?auto_564481 ?auto_564484 ) ) ( not ( = ?auto_564481 ?auto_564485 ) ) ( not ( = ?auto_564481 ?auto_564486 ) ) ( not ( = ?auto_564481 ?auto_564487 ) ) ( not ( = ?auto_564481 ?auto_564488 ) ) ( not ( = ?auto_564481 ?auto_564489 ) ) ( not ( = ?auto_564481 ?auto_564490 ) ) ( not ( = ?auto_564481 ?auto_564491 ) ) ( not ( = ?auto_564481 ?auto_564492 ) ) ( not ( = ?auto_564481 ?auto_564493 ) ) ( not ( = ?auto_564481 ?auto_564494 ) ) ( not ( = ?auto_564482 ?auto_564483 ) ) ( not ( = ?auto_564482 ?auto_564484 ) ) ( not ( = ?auto_564482 ?auto_564485 ) ) ( not ( = ?auto_564482 ?auto_564486 ) ) ( not ( = ?auto_564482 ?auto_564487 ) ) ( not ( = ?auto_564482 ?auto_564488 ) ) ( not ( = ?auto_564482 ?auto_564489 ) ) ( not ( = ?auto_564482 ?auto_564490 ) ) ( not ( = ?auto_564482 ?auto_564491 ) ) ( not ( = ?auto_564482 ?auto_564492 ) ) ( not ( = ?auto_564482 ?auto_564493 ) ) ( not ( = ?auto_564482 ?auto_564494 ) ) ( not ( = ?auto_564483 ?auto_564484 ) ) ( not ( = ?auto_564483 ?auto_564485 ) ) ( not ( = ?auto_564483 ?auto_564486 ) ) ( not ( = ?auto_564483 ?auto_564487 ) ) ( not ( = ?auto_564483 ?auto_564488 ) ) ( not ( = ?auto_564483 ?auto_564489 ) ) ( not ( = ?auto_564483 ?auto_564490 ) ) ( not ( = ?auto_564483 ?auto_564491 ) ) ( not ( = ?auto_564483 ?auto_564492 ) ) ( not ( = ?auto_564483 ?auto_564493 ) ) ( not ( = ?auto_564483 ?auto_564494 ) ) ( not ( = ?auto_564484 ?auto_564485 ) ) ( not ( = ?auto_564484 ?auto_564486 ) ) ( not ( = ?auto_564484 ?auto_564487 ) ) ( not ( = ?auto_564484 ?auto_564488 ) ) ( not ( = ?auto_564484 ?auto_564489 ) ) ( not ( = ?auto_564484 ?auto_564490 ) ) ( not ( = ?auto_564484 ?auto_564491 ) ) ( not ( = ?auto_564484 ?auto_564492 ) ) ( not ( = ?auto_564484 ?auto_564493 ) ) ( not ( = ?auto_564484 ?auto_564494 ) ) ( not ( = ?auto_564485 ?auto_564486 ) ) ( not ( = ?auto_564485 ?auto_564487 ) ) ( not ( = ?auto_564485 ?auto_564488 ) ) ( not ( = ?auto_564485 ?auto_564489 ) ) ( not ( = ?auto_564485 ?auto_564490 ) ) ( not ( = ?auto_564485 ?auto_564491 ) ) ( not ( = ?auto_564485 ?auto_564492 ) ) ( not ( = ?auto_564485 ?auto_564493 ) ) ( not ( = ?auto_564485 ?auto_564494 ) ) ( not ( = ?auto_564486 ?auto_564487 ) ) ( not ( = ?auto_564486 ?auto_564488 ) ) ( not ( = ?auto_564486 ?auto_564489 ) ) ( not ( = ?auto_564486 ?auto_564490 ) ) ( not ( = ?auto_564486 ?auto_564491 ) ) ( not ( = ?auto_564486 ?auto_564492 ) ) ( not ( = ?auto_564486 ?auto_564493 ) ) ( not ( = ?auto_564486 ?auto_564494 ) ) ( not ( = ?auto_564487 ?auto_564488 ) ) ( not ( = ?auto_564487 ?auto_564489 ) ) ( not ( = ?auto_564487 ?auto_564490 ) ) ( not ( = ?auto_564487 ?auto_564491 ) ) ( not ( = ?auto_564487 ?auto_564492 ) ) ( not ( = ?auto_564487 ?auto_564493 ) ) ( not ( = ?auto_564487 ?auto_564494 ) ) ( not ( = ?auto_564488 ?auto_564489 ) ) ( not ( = ?auto_564488 ?auto_564490 ) ) ( not ( = ?auto_564488 ?auto_564491 ) ) ( not ( = ?auto_564488 ?auto_564492 ) ) ( not ( = ?auto_564488 ?auto_564493 ) ) ( not ( = ?auto_564488 ?auto_564494 ) ) ( not ( = ?auto_564489 ?auto_564490 ) ) ( not ( = ?auto_564489 ?auto_564491 ) ) ( not ( = ?auto_564489 ?auto_564492 ) ) ( not ( = ?auto_564489 ?auto_564493 ) ) ( not ( = ?auto_564489 ?auto_564494 ) ) ( not ( = ?auto_564490 ?auto_564491 ) ) ( not ( = ?auto_564490 ?auto_564492 ) ) ( not ( = ?auto_564490 ?auto_564493 ) ) ( not ( = ?auto_564490 ?auto_564494 ) ) ( not ( = ?auto_564491 ?auto_564492 ) ) ( not ( = ?auto_564491 ?auto_564493 ) ) ( not ( = ?auto_564491 ?auto_564494 ) ) ( not ( = ?auto_564492 ?auto_564493 ) ) ( not ( = ?auto_564492 ?auto_564494 ) ) ( not ( = ?auto_564493 ?auto_564494 ) ) ( ON ?auto_564493 ?auto_564494 ) ( ON ?auto_564492 ?auto_564493 ) ( CLEAR ?auto_564490 ) ( ON ?auto_564491 ?auto_564492 ) ( CLEAR ?auto_564491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_564479 ?auto_564480 ?auto_564481 ?auto_564482 ?auto_564483 ?auto_564484 ?auto_564485 ?auto_564486 ?auto_564487 ?auto_564488 ?auto_564489 ?auto_564490 ?auto_564491 )
      ( MAKE-16PILE ?auto_564479 ?auto_564480 ?auto_564481 ?auto_564482 ?auto_564483 ?auto_564484 ?auto_564485 ?auto_564486 ?auto_564487 ?auto_564488 ?auto_564489 ?auto_564490 ?auto_564491 ?auto_564492 ?auto_564493 ?auto_564494 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564511 - BLOCK
      ?auto_564512 - BLOCK
      ?auto_564513 - BLOCK
      ?auto_564514 - BLOCK
      ?auto_564515 - BLOCK
      ?auto_564516 - BLOCK
      ?auto_564517 - BLOCK
      ?auto_564518 - BLOCK
      ?auto_564519 - BLOCK
      ?auto_564520 - BLOCK
      ?auto_564521 - BLOCK
      ?auto_564522 - BLOCK
      ?auto_564523 - BLOCK
      ?auto_564524 - BLOCK
      ?auto_564525 - BLOCK
      ?auto_564526 - BLOCK
    )
    :vars
    (
      ?auto_564527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564526 ?auto_564527 ) ( ON-TABLE ?auto_564511 ) ( ON ?auto_564512 ?auto_564511 ) ( ON ?auto_564513 ?auto_564512 ) ( ON ?auto_564514 ?auto_564513 ) ( ON ?auto_564515 ?auto_564514 ) ( ON ?auto_564516 ?auto_564515 ) ( ON ?auto_564517 ?auto_564516 ) ( ON ?auto_564518 ?auto_564517 ) ( ON ?auto_564519 ?auto_564518 ) ( ON ?auto_564520 ?auto_564519 ) ( ON ?auto_564521 ?auto_564520 ) ( not ( = ?auto_564511 ?auto_564512 ) ) ( not ( = ?auto_564511 ?auto_564513 ) ) ( not ( = ?auto_564511 ?auto_564514 ) ) ( not ( = ?auto_564511 ?auto_564515 ) ) ( not ( = ?auto_564511 ?auto_564516 ) ) ( not ( = ?auto_564511 ?auto_564517 ) ) ( not ( = ?auto_564511 ?auto_564518 ) ) ( not ( = ?auto_564511 ?auto_564519 ) ) ( not ( = ?auto_564511 ?auto_564520 ) ) ( not ( = ?auto_564511 ?auto_564521 ) ) ( not ( = ?auto_564511 ?auto_564522 ) ) ( not ( = ?auto_564511 ?auto_564523 ) ) ( not ( = ?auto_564511 ?auto_564524 ) ) ( not ( = ?auto_564511 ?auto_564525 ) ) ( not ( = ?auto_564511 ?auto_564526 ) ) ( not ( = ?auto_564511 ?auto_564527 ) ) ( not ( = ?auto_564512 ?auto_564513 ) ) ( not ( = ?auto_564512 ?auto_564514 ) ) ( not ( = ?auto_564512 ?auto_564515 ) ) ( not ( = ?auto_564512 ?auto_564516 ) ) ( not ( = ?auto_564512 ?auto_564517 ) ) ( not ( = ?auto_564512 ?auto_564518 ) ) ( not ( = ?auto_564512 ?auto_564519 ) ) ( not ( = ?auto_564512 ?auto_564520 ) ) ( not ( = ?auto_564512 ?auto_564521 ) ) ( not ( = ?auto_564512 ?auto_564522 ) ) ( not ( = ?auto_564512 ?auto_564523 ) ) ( not ( = ?auto_564512 ?auto_564524 ) ) ( not ( = ?auto_564512 ?auto_564525 ) ) ( not ( = ?auto_564512 ?auto_564526 ) ) ( not ( = ?auto_564512 ?auto_564527 ) ) ( not ( = ?auto_564513 ?auto_564514 ) ) ( not ( = ?auto_564513 ?auto_564515 ) ) ( not ( = ?auto_564513 ?auto_564516 ) ) ( not ( = ?auto_564513 ?auto_564517 ) ) ( not ( = ?auto_564513 ?auto_564518 ) ) ( not ( = ?auto_564513 ?auto_564519 ) ) ( not ( = ?auto_564513 ?auto_564520 ) ) ( not ( = ?auto_564513 ?auto_564521 ) ) ( not ( = ?auto_564513 ?auto_564522 ) ) ( not ( = ?auto_564513 ?auto_564523 ) ) ( not ( = ?auto_564513 ?auto_564524 ) ) ( not ( = ?auto_564513 ?auto_564525 ) ) ( not ( = ?auto_564513 ?auto_564526 ) ) ( not ( = ?auto_564513 ?auto_564527 ) ) ( not ( = ?auto_564514 ?auto_564515 ) ) ( not ( = ?auto_564514 ?auto_564516 ) ) ( not ( = ?auto_564514 ?auto_564517 ) ) ( not ( = ?auto_564514 ?auto_564518 ) ) ( not ( = ?auto_564514 ?auto_564519 ) ) ( not ( = ?auto_564514 ?auto_564520 ) ) ( not ( = ?auto_564514 ?auto_564521 ) ) ( not ( = ?auto_564514 ?auto_564522 ) ) ( not ( = ?auto_564514 ?auto_564523 ) ) ( not ( = ?auto_564514 ?auto_564524 ) ) ( not ( = ?auto_564514 ?auto_564525 ) ) ( not ( = ?auto_564514 ?auto_564526 ) ) ( not ( = ?auto_564514 ?auto_564527 ) ) ( not ( = ?auto_564515 ?auto_564516 ) ) ( not ( = ?auto_564515 ?auto_564517 ) ) ( not ( = ?auto_564515 ?auto_564518 ) ) ( not ( = ?auto_564515 ?auto_564519 ) ) ( not ( = ?auto_564515 ?auto_564520 ) ) ( not ( = ?auto_564515 ?auto_564521 ) ) ( not ( = ?auto_564515 ?auto_564522 ) ) ( not ( = ?auto_564515 ?auto_564523 ) ) ( not ( = ?auto_564515 ?auto_564524 ) ) ( not ( = ?auto_564515 ?auto_564525 ) ) ( not ( = ?auto_564515 ?auto_564526 ) ) ( not ( = ?auto_564515 ?auto_564527 ) ) ( not ( = ?auto_564516 ?auto_564517 ) ) ( not ( = ?auto_564516 ?auto_564518 ) ) ( not ( = ?auto_564516 ?auto_564519 ) ) ( not ( = ?auto_564516 ?auto_564520 ) ) ( not ( = ?auto_564516 ?auto_564521 ) ) ( not ( = ?auto_564516 ?auto_564522 ) ) ( not ( = ?auto_564516 ?auto_564523 ) ) ( not ( = ?auto_564516 ?auto_564524 ) ) ( not ( = ?auto_564516 ?auto_564525 ) ) ( not ( = ?auto_564516 ?auto_564526 ) ) ( not ( = ?auto_564516 ?auto_564527 ) ) ( not ( = ?auto_564517 ?auto_564518 ) ) ( not ( = ?auto_564517 ?auto_564519 ) ) ( not ( = ?auto_564517 ?auto_564520 ) ) ( not ( = ?auto_564517 ?auto_564521 ) ) ( not ( = ?auto_564517 ?auto_564522 ) ) ( not ( = ?auto_564517 ?auto_564523 ) ) ( not ( = ?auto_564517 ?auto_564524 ) ) ( not ( = ?auto_564517 ?auto_564525 ) ) ( not ( = ?auto_564517 ?auto_564526 ) ) ( not ( = ?auto_564517 ?auto_564527 ) ) ( not ( = ?auto_564518 ?auto_564519 ) ) ( not ( = ?auto_564518 ?auto_564520 ) ) ( not ( = ?auto_564518 ?auto_564521 ) ) ( not ( = ?auto_564518 ?auto_564522 ) ) ( not ( = ?auto_564518 ?auto_564523 ) ) ( not ( = ?auto_564518 ?auto_564524 ) ) ( not ( = ?auto_564518 ?auto_564525 ) ) ( not ( = ?auto_564518 ?auto_564526 ) ) ( not ( = ?auto_564518 ?auto_564527 ) ) ( not ( = ?auto_564519 ?auto_564520 ) ) ( not ( = ?auto_564519 ?auto_564521 ) ) ( not ( = ?auto_564519 ?auto_564522 ) ) ( not ( = ?auto_564519 ?auto_564523 ) ) ( not ( = ?auto_564519 ?auto_564524 ) ) ( not ( = ?auto_564519 ?auto_564525 ) ) ( not ( = ?auto_564519 ?auto_564526 ) ) ( not ( = ?auto_564519 ?auto_564527 ) ) ( not ( = ?auto_564520 ?auto_564521 ) ) ( not ( = ?auto_564520 ?auto_564522 ) ) ( not ( = ?auto_564520 ?auto_564523 ) ) ( not ( = ?auto_564520 ?auto_564524 ) ) ( not ( = ?auto_564520 ?auto_564525 ) ) ( not ( = ?auto_564520 ?auto_564526 ) ) ( not ( = ?auto_564520 ?auto_564527 ) ) ( not ( = ?auto_564521 ?auto_564522 ) ) ( not ( = ?auto_564521 ?auto_564523 ) ) ( not ( = ?auto_564521 ?auto_564524 ) ) ( not ( = ?auto_564521 ?auto_564525 ) ) ( not ( = ?auto_564521 ?auto_564526 ) ) ( not ( = ?auto_564521 ?auto_564527 ) ) ( not ( = ?auto_564522 ?auto_564523 ) ) ( not ( = ?auto_564522 ?auto_564524 ) ) ( not ( = ?auto_564522 ?auto_564525 ) ) ( not ( = ?auto_564522 ?auto_564526 ) ) ( not ( = ?auto_564522 ?auto_564527 ) ) ( not ( = ?auto_564523 ?auto_564524 ) ) ( not ( = ?auto_564523 ?auto_564525 ) ) ( not ( = ?auto_564523 ?auto_564526 ) ) ( not ( = ?auto_564523 ?auto_564527 ) ) ( not ( = ?auto_564524 ?auto_564525 ) ) ( not ( = ?auto_564524 ?auto_564526 ) ) ( not ( = ?auto_564524 ?auto_564527 ) ) ( not ( = ?auto_564525 ?auto_564526 ) ) ( not ( = ?auto_564525 ?auto_564527 ) ) ( not ( = ?auto_564526 ?auto_564527 ) ) ( ON ?auto_564525 ?auto_564526 ) ( ON ?auto_564524 ?auto_564525 ) ( ON ?auto_564523 ?auto_564524 ) ( CLEAR ?auto_564521 ) ( ON ?auto_564522 ?auto_564523 ) ( CLEAR ?auto_564522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_564511 ?auto_564512 ?auto_564513 ?auto_564514 ?auto_564515 ?auto_564516 ?auto_564517 ?auto_564518 ?auto_564519 ?auto_564520 ?auto_564521 ?auto_564522 )
      ( MAKE-16PILE ?auto_564511 ?auto_564512 ?auto_564513 ?auto_564514 ?auto_564515 ?auto_564516 ?auto_564517 ?auto_564518 ?auto_564519 ?auto_564520 ?auto_564521 ?auto_564522 ?auto_564523 ?auto_564524 ?auto_564525 ?auto_564526 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564544 - BLOCK
      ?auto_564545 - BLOCK
      ?auto_564546 - BLOCK
      ?auto_564547 - BLOCK
      ?auto_564548 - BLOCK
      ?auto_564549 - BLOCK
      ?auto_564550 - BLOCK
      ?auto_564551 - BLOCK
      ?auto_564552 - BLOCK
      ?auto_564553 - BLOCK
      ?auto_564554 - BLOCK
      ?auto_564555 - BLOCK
      ?auto_564556 - BLOCK
      ?auto_564557 - BLOCK
      ?auto_564558 - BLOCK
      ?auto_564559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564559 ) ( ON-TABLE ?auto_564544 ) ( ON ?auto_564545 ?auto_564544 ) ( ON ?auto_564546 ?auto_564545 ) ( ON ?auto_564547 ?auto_564546 ) ( ON ?auto_564548 ?auto_564547 ) ( ON ?auto_564549 ?auto_564548 ) ( ON ?auto_564550 ?auto_564549 ) ( ON ?auto_564551 ?auto_564550 ) ( ON ?auto_564552 ?auto_564551 ) ( ON ?auto_564553 ?auto_564552 ) ( ON ?auto_564554 ?auto_564553 ) ( not ( = ?auto_564544 ?auto_564545 ) ) ( not ( = ?auto_564544 ?auto_564546 ) ) ( not ( = ?auto_564544 ?auto_564547 ) ) ( not ( = ?auto_564544 ?auto_564548 ) ) ( not ( = ?auto_564544 ?auto_564549 ) ) ( not ( = ?auto_564544 ?auto_564550 ) ) ( not ( = ?auto_564544 ?auto_564551 ) ) ( not ( = ?auto_564544 ?auto_564552 ) ) ( not ( = ?auto_564544 ?auto_564553 ) ) ( not ( = ?auto_564544 ?auto_564554 ) ) ( not ( = ?auto_564544 ?auto_564555 ) ) ( not ( = ?auto_564544 ?auto_564556 ) ) ( not ( = ?auto_564544 ?auto_564557 ) ) ( not ( = ?auto_564544 ?auto_564558 ) ) ( not ( = ?auto_564544 ?auto_564559 ) ) ( not ( = ?auto_564545 ?auto_564546 ) ) ( not ( = ?auto_564545 ?auto_564547 ) ) ( not ( = ?auto_564545 ?auto_564548 ) ) ( not ( = ?auto_564545 ?auto_564549 ) ) ( not ( = ?auto_564545 ?auto_564550 ) ) ( not ( = ?auto_564545 ?auto_564551 ) ) ( not ( = ?auto_564545 ?auto_564552 ) ) ( not ( = ?auto_564545 ?auto_564553 ) ) ( not ( = ?auto_564545 ?auto_564554 ) ) ( not ( = ?auto_564545 ?auto_564555 ) ) ( not ( = ?auto_564545 ?auto_564556 ) ) ( not ( = ?auto_564545 ?auto_564557 ) ) ( not ( = ?auto_564545 ?auto_564558 ) ) ( not ( = ?auto_564545 ?auto_564559 ) ) ( not ( = ?auto_564546 ?auto_564547 ) ) ( not ( = ?auto_564546 ?auto_564548 ) ) ( not ( = ?auto_564546 ?auto_564549 ) ) ( not ( = ?auto_564546 ?auto_564550 ) ) ( not ( = ?auto_564546 ?auto_564551 ) ) ( not ( = ?auto_564546 ?auto_564552 ) ) ( not ( = ?auto_564546 ?auto_564553 ) ) ( not ( = ?auto_564546 ?auto_564554 ) ) ( not ( = ?auto_564546 ?auto_564555 ) ) ( not ( = ?auto_564546 ?auto_564556 ) ) ( not ( = ?auto_564546 ?auto_564557 ) ) ( not ( = ?auto_564546 ?auto_564558 ) ) ( not ( = ?auto_564546 ?auto_564559 ) ) ( not ( = ?auto_564547 ?auto_564548 ) ) ( not ( = ?auto_564547 ?auto_564549 ) ) ( not ( = ?auto_564547 ?auto_564550 ) ) ( not ( = ?auto_564547 ?auto_564551 ) ) ( not ( = ?auto_564547 ?auto_564552 ) ) ( not ( = ?auto_564547 ?auto_564553 ) ) ( not ( = ?auto_564547 ?auto_564554 ) ) ( not ( = ?auto_564547 ?auto_564555 ) ) ( not ( = ?auto_564547 ?auto_564556 ) ) ( not ( = ?auto_564547 ?auto_564557 ) ) ( not ( = ?auto_564547 ?auto_564558 ) ) ( not ( = ?auto_564547 ?auto_564559 ) ) ( not ( = ?auto_564548 ?auto_564549 ) ) ( not ( = ?auto_564548 ?auto_564550 ) ) ( not ( = ?auto_564548 ?auto_564551 ) ) ( not ( = ?auto_564548 ?auto_564552 ) ) ( not ( = ?auto_564548 ?auto_564553 ) ) ( not ( = ?auto_564548 ?auto_564554 ) ) ( not ( = ?auto_564548 ?auto_564555 ) ) ( not ( = ?auto_564548 ?auto_564556 ) ) ( not ( = ?auto_564548 ?auto_564557 ) ) ( not ( = ?auto_564548 ?auto_564558 ) ) ( not ( = ?auto_564548 ?auto_564559 ) ) ( not ( = ?auto_564549 ?auto_564550 ) ) ( not ( = ?auto_564549 ?auto_564551 ) ) ( not ( = ?auto_564549 ?auto_564552 ) ) ( not ( = ?auto_564549 ?auto_564553 ) ) ( not ( = ?auto_564549 ?auto_564554 ) ) ( not ( = ?auto_564549 ?auto_564555 ) ) ( not ( = ?auto_564549 ?auto_564556 ) ) ( not ( = ?auto_564549 ?auto_564557 ) ) ( not ( = ?auto_564549 ?auto_564558 ) ) ( not ( = ?auto_564549 ?auto_564559 ) ) ( not ( = ?auto_564550 ?auto_564551 ) ) ( not ( = ?auto_564550 ?auto_564552 ) ) ( not ( = ?auto_564550 ?auto_564553 ) ) ( not ( = ?auto_564550 ?auto_564554 ) ) ( not ( = ?auto_564550 ?auto_564555 ) ) ( not ( = ?auto_564550 ?auto_564556 ) ) ( not ( = ?auto_564550 ?auto_564557 ) ) ( not ( = ?auto_564550 ?auto_564558 ) ) ( not ( = ?auto_564550 ?auto_564559 ) ) ( not ( = ?auto_564551 ?auto_564552 ) ) ( not ( = ?auto_564551 ?auto_564553 ) ) ( not ( = ?auto_564551 ?auto_564554 ) ) ( not ( = ?auto_564551 ?auto_564555 ) ) ( not ( = ?auto_564551 ?auto_564556 ) ) ( not ( = ?auto_564551 ?auto_564557 ) ) ( not ( = ?auto_564551 ?auto_564558 ) ) ( not ( = ?auto_564551 ?auto_564559 ) ) ( not ( = ?auto_564552 ?auto_564553 ) ) ( not ( = ?auto_564552 ?auto_564554 ) ) ( not ( = ?auto_564552 ?auto_564555 ) ) ( not ( = ?auto_564552 ?auto_564556 ) ) ( not ( = ?auto_564552 ?auto_564557 ) ) ( not ( = ?auto_564552 ?auto_564558 ) ) ( not ( = ?auto_564552 ?auto_564559 ) ) ( not ( = ?auto_564553 ?auto_564554 ) ) ( not ( = ?auto_564553 ?auto_564555 ) ) ( not ( = ?auto_564553 ?auto_564556 ) ) ( not ( = ?auto_564553 ?auto_564557 ) ) ( not ( = ?auto_564553 ?auto_564558 ) ) ( not ( = ?auto_564553 ?auto_564559 ) ) ( not ( = ?auto_564554 ?auto_564555 ) ) ( not ( = ?auto_564554 ?auto_564556 ) ) ( not ( = ?auto_564554 ?auto_564557 ) ) ( not ( = ?auto_564554 ?auto_564558 ) ) ( not ( = ?auto_564554 ?auto_564559 ) ) ( not ( = ?auto_564555 ?auto_564556 ) ) ( not ( = ?auto_564555 ?auto_564557 ) ) ( not ( = ?auto_564555 ?auto_564558 ) ) ( not ( = ?auto_564555 ?auto_564559 ) ) ( not ( = ?auto_564556 ?auto_564557 ) ) ( not ( = ?auto_564556 ?auto_564558 ) ) ( not ( = ?auto_564556 ?auto_564559 ) ) ( not ( = ?auto_564557 ?auto_564558 ) ) ( not ( = ?auto_564557 ?auto_564559 ) ) ( not ( = ?auto_564558 ?auto_564559 ) ) ( ON ?auto_564558 ?auto_564559 ) ( ON ?auto_564557 ?auto_564558 ) ( ON ?auto_564556 ?auto_564557 ) ( CLEAR ?auto_564554 ) ( ON ?auto_564555 ?auto_564556 ) ( CLEAR ?auto_564555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_564544 ?auto_564545 ?auto_564546 ?auto_564547 ?auto_564548 ?auto_564549 ?auto_564550 ?auto_564551 ?auto_564552 ?auto_564553 ?auto_564554 ?auto_564555 )
      ( MAKE-16PILE ?auto_564544 ?auto_564545 ?auto_564546 ?auto_564547 ?auto_564548 ?auto_564549 ?auto_564550 ?auto_564551 ?auto_564552 ?auto_564553 ?auto_564554 ?auto_564555 ?auto_564556 ?auto_564557 ?auto_564558 ?auto_564559 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564576 - BLOCK
      ?auto_564577 - BLOCK
      ?auto_564578 - BLOCK
      ?auto_564579 - BLOCK
      ?auto_564580 - BLOCK
      ?auto_564581 - BLOCK
      ?auto_564582 - BLOCK
      ?auto_564583 - BLOCK
      ?auto_564584 - BLOCK
      ?auto_564585 - BLOCK
      ?auto_564586 - BLOCK
      ?auto_564587 - BLOCK
      ?auto_564588 - BLOCK
      ?auto_564589 - BLOCK
      ?auto_564590 - BLOCK
      ?auto_564591 - BLOCK
    )
    :vars
    (
      ?auto_564592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564591 ?auto_564592 ) ( ON-TABLE ?auto_564576 ) ( ON ?auto_564577 ?auto_564576 ) ( ON ?auto_564578 ?auto_564577 ) ( ON ?auto_564579 ?auto_564578 ) ( ON ?auto_564580 ?auto_564579 ) ( ON ?auto_564581 ?auto_564580 ) ( ON ?auto_564582 ?auto_564581 ) ( ON ?auto_564583 ?auto_564582 ) ( ON ?auto_564584 ?auto_564583 ) ( ON ?auto_564585 ?auto_564584 ) ( not ( = ?auto_564576 ?auto_564577 ) ) ( not ( = ?auto_564576 ?auto_564578 ) ) ( not ( = ?auto_564576 ?auto_564579 ) ) ( not ( = ?auto_564576 ?auto_564580 ) ) ( not ( = ?auto_564576 ?auto_564581 ) ) ( not ( = ?auto_564576 ?auto_564582 ) ) ( not ( = ?auto_564576 ?auto_564583 ) ) ( not ( = ?auto_564576 ?auto_564584 ) ) ( not ( = ?auto_564576 ?auto_564585 ) ) ( not ( = ?auto_564576 ?auto_564586 ) ) ( not ( = ?auto_564576 ?auto_564587 ) ) ( not ( = ?auto_564576 ?auto_564588 ) ) ( not ( = ?auto_564576 ?auto_564589 ) ) ( not ( = ?auto_564576 ?auto_564590 ) ) ( not ( = ?auto_564576 ?auto_564591 ) ) ( not ( = ?auto_564576 ?auto_564592 ) ) ( not ( = ?auto_564577 ?auto_564578 ) ) ( not ( = ?auto_564577 ?auto_564579 ) ) ( not ( = ?auto_564577 ?auto_564580 ) ) ( not ( = ?auto_564577 ?auto_564581 ) ) ( not ( = ?auto_564577 ?auto_564582 ) ) ( not ( = ?auto_564577 ?auto_564583 ) ) ( not ( = ?auto_564577 ?auto_564584 ) ) ( not ( = ?auto_564577 ?auto_564585 ) ) ( not ( = ?auto_564577 ?auto_564586 ) ) ( not ( = ?auto_564577 ?auto_564587 ) ) ( not ( = ?auto_564577 ?auto_564588 ) ) ( not ( = ?auto_564577 ?auto_564589 ) ) ( not ( = ?auto_564577 ?auto_564590 ) ) ( not ( = ?auto_564577 ?auto_564591 ) ) ( not ( = ?auto_564577 ?auto_564592 ) ) ( not ( = ?auto_564578 ?auto_564579 ) ) ( not ( = ?auto_564578 ?auto_564580 ) ) ( not ( = ?auto_564578 ?auto_564581 ) ) ( not ( = ?auto_564578 ?auto_564582 ) ) ( not ( = ?auto_564578 ?auto_564583 ) ) ( not ( = ?auto_564578 ?auto_564584 ) ) ( not ( = ?auto_564578 ?auto_564585 ) ) ( not ( = ?auto_564578 ?auto_564586 ) ) ( not ( = ?auto_564578 ?auto_564587 ) ) ( not ( = ?auto_564578 ?auto_564588 ) ) ( not ( = ?auto_564578 ?auto_564589 ) ) ( not ( = ?auto_564578 ?auto_564590 ) ) ( not ( = ?auto_564578 ?auto_564591 ) ) ( not ( = ?auto_564578 ?auto_564592 ) ) ( not ( = ?auto_564579 ?auto_564580 ) ) ( not ( = ?auto_564579 ?auto_564581 ) ) ( not ( = ?auto_564579 ?auto_564582 ) ) ( not ( = ?auto_564579 ?auto_564583 ) ) ( not ( = ?auto_564579 ?auto_564584 ) ) ( not ( = ?auto_564579 ?auto_564585 ) ) ( not ( = ?auto_564579 ?auto_564586 ) ) ( not ( = ?auto_564579 ?auto_564587 ) ) ( not ( = ?auto_564579 ?auto_564588 ) ) ( not ( = ?auto_564579 ?auto_564589 ) ) ( not ( = ?auto_564579 ?auto_564590 ) ) ( not ( = ?auto_564579 ?auto_564591 ) ) ( not ( = ?auto_564579 ?auto_564592 ) ) ( not ( = ?auto_564580 ?auto_564581 ) ) ( not ( = ?auto_564580 ?auto_564582 ) ) ( not ( = ?auto_564580 ?auto_564583 ) ) ( not ( = ?auto_564580 ?auto_564584 ) ) ( not ( = ?auto_564580 ?auto_564585 ) ) ( not ( = ?auto_564580 ?auto_564586 ) ) ( not ( = ?auto_564580 ?auto_564587 ) ) ( not ( = ?auto_564580 ?auto_564588 ) ) ( not ( = ?auto_564580 ?auto_564589 ) ) ( not ( = ?auto_564580 ?auto_564590 ) ) ( not ( = ?auto_564580 ?auto_564591 ) ) ( not ( = ?auto_564580 ?auto_564592 ) ) ( not ( = ?auto_564581 ?auto_564582 ) ) ( not ( = ?auto_564581 ?auto_564583 ) ) ( not ( = ?auto_564581 ?auto_564584 ) ) ( not ( = ?auto_564581 ?auto_564585 ) ) ( not ( = ?auto_564581 ?auto_564586 ) ) ( not ( = ?auto_564581 ?auto_564587 ) ) ( not ( = ?auto_564581 ?auto_564588 ) ) ( not ( = ?auto_564581 ?auto_564589 ) ) ( not ( = ?auto_564581 ?auto_564590 ) ) ( not ( = ?auto_564581 ?auto_564591 ) ) ( not ( = ?auto_564581 ?auto_564592 ) ) ( not ( = ?auto_564582 ?auto_564583 ) ) ( not ( = ?auto_564582 ?auto_564584 ) ) ( not ( = ?auto_564582 ?auto_564585 ) ) ( not ( = ?auto_564582 ?auto_564586 ) ) ( not ( = ?auto_564582 ?auto_564587 ) ) ( not ( = ?auto_564582 ?auto_564588 ) ) ( not ( = ?auto_564582 ?auto_564589 ) ) ( not ( = ?auto_564582 ?auto_564590 ) ) ( not ( = ?auto_564582 ?auto_564591 ) ) ( not ( = ?auto_564582 ?auto_564592 ) ) ( not ( = ?auto_564583 ?auto_564584 ) ) ( not ( = ?auto_564583 ?auto_564585 ) ) ( not ( = ?auto_564583 ?auto_564586 ) ) ( not ( = ?auto_564583 ?auto_564587 ) ) ( not ( = ?auto_564583 ?auto_564588 ) ) ( not ( = ?auto_564583 ?auto_564589 ) ) ( not ( = ?auto_564583 ?auto_564590 ) ) ( not ( = ?auto_564583 ?auto_564591 ) ) ( not ( = ?auto_564583 ?auto_564592 ) ) ( not ( = ?auto_564584 ?auto_564585 ) ) ( not ( = ?auto_564584 ?auto_564586 ) ) ( not ( = ?auto_564584 ?auto_564587 ) ) ( not ( = ?auto_564584 ?auto_564588 ) ) ( not ( = ?auto_564584 ?auto_564589 ) ) ( not ( = ?auto_564584 ?auto_564590 ) ) ( not ( = ?auto_564584 ?auto_564591 ) ) ( not ( = ?auto_564584 ?auto_564592 ) ) ( not ( = ?auto_564585 ?auto_564586 ) ) ( not ( = ?auto_564585 ?auto_564587 ) ) ( not ( = ?auto_564585 ?auto_564588 ) ) ( not ( = ?auto_564585 ?auto_564589 ) ) ( not ( = ?auto_564585 ?auto_564590 ) ) ( not ( = ?auto_564585 ?auto_564591 ) ) ( not ( = ?auto_564585 ?auto_564592 ) ) ( not ( = ?auto_564586 ?auto_564587 ) ) ( not ( = ?auto_564586 ?auto_564588 ) ) ( not ( = ?auto_564586 ?auto_564589 ) ) ( not ( = ?auto_564586 ?auto_564590 ) ) ( not ( = ?auto_564586 ?auto_564591 ) ) ( not ( = ?auto_564586 ?auto_564592 ) ) ( not ( = ?auto_564587 ?auto_564588 ) ) ( not ( = ?auto_564587 ?auto_564589 ) ) ( not ( = ?auto_564587 ?auto_564590 ) ) ( not ( = ?auto_564587 ?auto_564591 ) ) ( not ( = ?auto_564587 ?auto_564592 ) ) ( not ( = ?auto_564588 ?auto_564589 ) ) ( not ( = ?auto_564588 ?auto_564590 ) ) ( not ( = ?auto_564588 ?auto_564591 ) ) ( not ( = ?auto_564588 ?auto_564592 ) ) ( not ( = ?auto_564589 ?auto_564590 ) ) ( not ( = ?auto_564589 ?auto_564591 ) ) ( not ( = ?auto_564589 ?auto_564592 ) ) ( not ( = ?auto_564590 ?auto_564591 ) ) ( not ( = ?auto_564590 ?auto_564592 ) ) ( not ( = ?auto_564591 ?auto_564592 ) ) ( ON ?auto_564590 ?auto_564591 ) ( ON ?auto_564589 ?auto_564590 ) ( ON ?auto_564588 ?auto_564589 ) ( ON ?auto_564587 ?auto_564588 ) ( CLEAR ?auto_564585 ) ( ON ?auto_564586 ?auto_564587 ) ( CLEAR ?auto_564586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_564576 ?auto_564577 ?auto_564578 ?auto_564579 ?auto_564580 ?auto_564581 ?auto_564582 ?auto_564583 ?auto_564584 ?auto_564585 ?auto_564586 )
      ( MAKE-16PILE ?auto_564576 ?auto_564577 ?auto_564578 ?auto_564579 ?auto_564580 ?auto_564581 ?auto_564582 ?auto_564583 ?auto_564584 ?auto_564585 ?auto_564586 ?auto_564587 ?auto_564588 ?auto_564589 ?auto_564590 ?auto_564591 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564609 - BLOCK
      ?auto_564610 - BLOCK
      ?auto_564611 - BLOCK
      ?auto_564612 - BLOCK
      ?auto_564613 - BLOCK
      ?auto_564614 - BLOCK
      ?auto_564615 - BLOCK
      ?auto_564616 - BLOCK
      ?auto_564617 - BLOCK
      ?auto_564618 - BLOCK
      ?auto_564619 - BLOCK
      ?auto_564620 - BLOCK
      ?auto_564621 - BLOCK
      ?auto_564622 - BLOCK
      ?auto_564623 - BLOCK
      ?auto_564624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564624 ) ( ON-TABLE ?auto_564609 ) ( ON ?auto_564610 ?auto_564609 ) ( ON ?auto_564611 ?auto_564610 ) ( ON ?auto_564612 ?auto_564611 ) ( ON ?auto_564613 ?auto_564612 ) ( ON ?auto_564614 ?auto_564613 ) ( ON ?auto_564615 ?auto_564614 ) ( ON ?auto_564616 ?auto_564615 ) ( ON ?auto_564617 ?auto_564616 ) ( ON ?auto_564618 ?auto_564617 ) ( not ( = ?auto_564609 ?auto_564610 ) ) ( not ( = ?auto_564609 ?auto_564611 ) ) ( not ( = ?auto_564609 ?auto_564612 ) ) ( not ( = ?auto_564609 ?auto_564613 ) ) ( not ( = ?auto_564609 ?auto_564614 ) ) ( not ( = ?auto_564609 ?auto_564615 ) ) ( not ( = ?auto_564609 ?auto_564616 ) ) ( not ( = ?auto_564609 ?auto_564617 ) ) ( not ( = ?auto_564609 ?auto_564618 ) ) ( not ( = ?auto_564609 ?auto_564619 ) ) ( not ( = ?auto_564609 ?auto_564620 ) ) ( not ( = ?auto_564609 ?auto_564621 ) ) ( not ( = ?auto_564609 ?auto_564622 ) ) ( not ( = ?auto_564609 ?auto_564623 ) ) ( not ( = ?auto_564609 ?auto_564624 ) ) ( not ( = ?auto_564610 ?auto_564611 ) ) ( not ( = ?auto_564610 ?auto_564612 ) ) ( not ( = ?auto_564610 ?auto_564613 ) ) ( not ( = ?auto_564610 ?auto_564614 ) ) ( not ( = ?auto_564610 ?auto_564615 ) ) ( not ( = ?auto_564610 ?auto_564616 ) ) ( not ( = ?auto_564610 ?auto_564617 ) ) ( not ( = ?auto_564610 ?auto_564618 ) ) ( not ( = ?auto_564610 ?auto_564619 ) ) ( not ( = ?auto_564610 ?auto_564620 ) ) ( not ( = ?auto_564610 ?auto_564621 ) ) ( not ( = ?auto_564610 ?auto_564622 ) ) ( not ( = ?auto_564610 ?auto_564623 ) ) ( not ( = ?auto_564610 ?auto_564624 ) ) ( not ( = ?auto_564611 ?auto_564612 ) ) ( not ( = ?auto_564611 ?auto_564613 ) ) ( not ( = ?auto_564611 ?auto_564614 ) ) ( not ( = ?auto_564611 ?auto_564615 ) ) ( not ( = ?auto_564611 ?auto_564616 ) ) ( not ( = ?auto_564611 ?auto_564617 ) ) ( not ( = ?auto_564611 ?auto_564618 ) ) ( not ( = ?auto_564611 ?auto_564619 ) ) ( not ( = ?auto_564611 ?auto_564620 ) ) ( not ( = ?auto_564611 ?auto_564621 ) ) ( not ( = ?auto_564611 ?auto_564622 ) ) ( not ( = ?auto_564611 ?auto_564623 ) ) ( not ( = ?auto_564611 ?auto_564624 ) ) ( not ( = ?auto_564612 ?auto_564613 ) ) ( not ( = ?auto_564612 ?auto_564614 ) ) ( not ( = ?auto_564612 ?auto_564615 ) ) ( not ( = ?auto_564612 ?auto_564616 ) ) ( not ( = ?auto_564612 ?auto_564617 ) ) ( not ( = ?auto_564612 ?auto_564618 ) ) ( not ( = ?auto_564612 ?auto_564619 ) ) ( not ( = ?auto_564612 ?auto_564620 ) ) ( not ( = ?auto_564612 ?auto_564621 ) ) ( not ( = ?auto_564612 ?auto_564622 ) ) ( not ( = ?auto_564612 ?auto_564623 ) ) ( not ( = ?auto_564612 ?auto_564624 ) ) ( not ( = ?auto_564613 ?auto_564614 ) ) ( not ( = ?auto_564613 ?auto_564615 ) ) ( not ( = ?auto_564613 ?auto_564616 ) ) ( not ( = ?auto_564613 ?auto_564617 ) ) ( not ( = ?auto_564613 ?auto_564618 ) ) ( not ( = ?auto_564613 ?auto_564619 ) ) ( not ( = ?auto_564613 ?auto_564620 ) ) ( not ( = ?auto_564613 ?auto_564621 ) ) ( not ( = ?auto_564613 ?auto_564622 ) ) ( not ( = ?auto_564613 ?auto_564623 ) ) ( not ( = ?auto_564613 ?auto_564624 ) ) ( not ( = ?auto_564614 ?auto_564615 ) ) ( not ( = ?auto_564614 ?auto_564616 ) ) ( not ( = ?auto_564614 ?auto_564617 ) ) ( not ( = ?auto_564614 ?auto_564618 ) ) ( not ( = ?auto_564614 ?auto_564619 ) ) ( not ( = ?auto_564614 ?auto_564620 ) ) ( not ( = ?auto_564614 ?auto_564621 ) ) ( not ( = ?auto_564614 ?auto_564622 ) ) ( not ( = ?auto_564614 ?auto_564623 ) ) ( not ( = ?auto_564614 ?auto_564624 ) ) ( not ( = ?auto_564615 ?auto_564616 ) ) ( not ( = ?auto_564615 ?auto_564617 ) ) ( not ( = ?auto_564615 ?auto_564618 ) ) ( not ( = ?auto_564615 ?auto_564619 ) ) ( not ( = ?auto_564615 ?auto_564620 ) ) ( not ( = ?auto_564615 ?auto_564621 ) ) ( not ( = ?auto_564615 ?auto_564622 ) ) ( not ( = ?auto_564615 ?auto_564623 ) ) ( not ( = ?auto_564615 ?auto_564624 ) ) ( not ( = ?auto_564616 ?auto_564617 ) ) ( not ( = ?auto_564616 ?auto_564618 ) ) ( not ( = ?auto_564616 ?auto_564619 ) ) ( not ( = ?auto_564616 ?auto_564620 ) ) ( not ( = ?auto_564616 ?auto_564621 ) ) ( not ( = ?auto_564616 ?auto_564622 ) ) ( not ( = ?auto_564616 ?auto_564623 ) ) ( not ( = ?auto_564616 ?auto_564624 ) ) ( not ( = ?auto_564617 ?auto_564618 ) ) ( not ( = ?auto_564617 ?auto_564619 ) ) ( not ( = ?auto_564617 ?auto_564620 ) ) ( not ( = ?auto_564617 ?auto_564621 ) ) ( not ( = ?auto_564617 ?auto_564622 ) ) ( not ( = ?auto_564617 ?auto_564623 ) ) ( not ( = ?auto_564617 ?auto_564624 ) ) ( not ( = ?auto_564618 ?auto_564619 ) ) ( not ( = ?auto_564618 ?auto_564620 ) ) ( not ( = ?auto_564618 ?auto_564621 ) ) ( not ( = ?auto_564618 ?auto_564622 ) ) ( not ( = ?auto_564618 ?auto_564623 ) ) ( not ( = ?auto_564618 ?auto_564624 ) ) ( not ( = ?auto_564619 ?auto_564620 ) ) ( not ( = ?auto_564619 ?auto_564621 ) ) ( not ( = ?auto_564619 ?auto_564622 ) ) ( not ( = ?auto_564619 ?auto_564623 ) ) ( not ( = ?auto_564619 ?auto_564624 ) ) ( not ( = ?auto_564620 ?auto_564621 ) ) ( not ( = ?auto_564620 ?auto_564622 ) ) ( not ( = ?auto_564620 ?auto_564623 ) ) ( not ( = ?auto_564620 ?auto_564624 ) ) ( not ( = ?auto_564621 ?auto_564622 ) ) ( not ( = ?auto_564621 ?auto_564623 ) ) ( not ( = ?auto_564621 ?auto_564624 ) ) ( not ( = ?auto_564622 ?auto_564623 ) ) ( not ( = ?auto_564622 ?auto_564624 ) ) ( not ( = ?auto_564623 ?auto_564624 ) ) ( ON ?auto_564623 ?auto_564624 ) ( ON ?auto_564622 ?auto_564623 ) ( ON ?auto_564621 ?auto_564622 ) ( ON ?auto_564620 ?auto_564621 ) ( CLEAR ?auto_564618 ) ( ON ?auto_564619 ?auto_564620 ) ( CLEAR ?auto_564619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_564609 ?auto_564610 ?auto_564611 ?auto_564612 ?auto_564613 ?auto_564614 ?auto_564615 ?auto_564616 ?auto_564617 ?auto_564618 ?auto_564619 )
      ( MAKE-16PILE ?auto_564609 ?auto_564610 ?auto_564611 ?auto_564612 ?auto_564613 ?auto_564614 ?auto_564615 ?auto_564616 ?auto_564617 ?auto_564618 ?auto_564619 ?auto_564620 ?auto_564621 ?auto_564622 ?auto_564623 ?auto_564624 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564641 - BLOCK
      ?auto_564642 - BLOCK
      ?auto_564643 - BLOCK
      ?auto_564644 - BLOCK
      ?auto_564645 - BLOCK
      ?auto_564646 - BLOCK
      ?auto_564647 - BLOCK
      ?auto_564648 - BLOCK
      ?auto_564649 - BLOCK
      ?auto_564650 - BLOCK
      ?auto_564651 - BLOCK
      ?auto_564652 - BLOCK
      ?auto_564653 - BLOCK
      ?auto_564654 - BLOCK
      ?auto_564655 - BLOCK
      ?auto_564656 - BLOCK
    )
    :vars
    (
      ?auto_564657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564656 ?auto_564657 ) ( ON-TABLE ?auto_564641 ) ( ON ?auto_564642 ?auto_564641 ) ( ON ?auto_564643 ?auto_564642 ) ( ON ?auto_564644 ?auto_564643 ) ( ON ?auto_564645 ?auto_564644 ) ( ON ?auto_564646 ?auto_564645 ) ( ON ?auto_564647 ?auto_564646 ) ( ON ?auto_564648 ?auto_564647 ) ( ON ?auto_564649 ?auto_564648 ) ( not ( = ?auto_564641 ?auto_564642 ) ) ( not ( = ?auto_564641 ?auto_564643 ) ) ( not ( = ?auto_564641 ?auto_564644 ) ) ( not ( = ?auto_564641 ?auto_564645 ) ) ( not ( = ?auto_564641 ?auto_564646 ) ) ( not ( = ?auto_564641 ?auto_564647 ) ) ( not ( = ?auto_564641 ?auto_564648 ) ) ( not ( = ?auto_564641 ?auto_564649 ) ) ( not ( = ?auto_564641 ?auto_564650 ) ) ( not ( = ?auto_564641 ?auto_564651 ) ) ( not ( = ?auto_564641 ?auto_564652 ) ) ( not ( = ?auto_564641 ?auto_564653 ) ) ( not ( = ?auto_564641 ?auto_564654 ) ) ( not ( = ?auto_564641 ?auto_564655 ) ) ( not ( = ?auto_564641 ?auto_564656 ) ) ( not ( = ?auto_564641 ?auto_564657 ) ) ( not ( = ?auto_564642 ?auto_564643 ) ) ( not ( = ?auto_564642 ?auto_564644 ) ) ( not ( = ?auto_564642 ?auto_564645 ) ) ( not ( = ?auto_564642 ?auto_564646 ) ) ( not ( = ?auto_564642 ?auto_564647 ) ) ( not ( = ?auto_564642 ?auto_564648 ) ) ( not ( = ?auto_564642 ?auto_564649 ) ) ( not ( = ?auto_564642 ?auto_564650 ) ) ( not ( = ?auto_564642 ?auto_564651 ) ) ( not ( = ?auto_564642 ?auto_564652 ) ) ( not ( = ?auto_564642 ?auto_564653 ) ) ( not ( = ?auto_564642 ?auto_564654 ) ) ( not ( = ?auto_564642 ?auto_564655 ) ) ( not ( = ?auto_564642 ?auto_564656 ) ) ( not ( = ?auto_564642 ?auto_564657 ) ) ( not ( = ?auto_564643 ?auto_564644 ) ) ( not ( = ?auto_564643 ?auto_564645 ) ) ( not ( = ?auto_564643 ?auto_564646 ) ) ( not ( = ?auto_564643 ?auto_564647 ) ) ( not ( = ?auto_564643 ?auto_564648 ) ) ( not ( = ?auto_564643 ?auto_564649 ) ) ( not ( = ?auto_564643 ?auto_564650 ) ) ( not ( = ?auto_564643 ?auto_564651 ) ) ( not ( = ?auto_564643 ?auto_564652 ) ) ( not ( = ?auto_564643 ?auto_564653 ) ) ( not ( = ?auto_564643 ?auto_564654 ) ) ( not ( = ?auto_564643 ?auto_564655 ) ) ( not ( = ?auto_564643 ?auto_564656 ) ) ( not ( = ?auto_564643 ?auto_564657 ) ) ( not ( = ?auto_564644 ?auto_564645 ) ) ( not ( = ?auto_564644 ?auto_564646 ) ) ( not ( = ?auto_564644 ?auto_564647 ) ) ( not ( = ?auto_564644 ?auto_564648 ) ) ( not ( = ?auto_564644 ?auto_564649 ) ) ( not ( = ?auto_564644 ?auto_564650 ) ) ( not ( = ?auto_564644 ?auto_564651 ) ) ( not ( = ?auto_564644 ?auto_564652 ) ) ( not ( = ?auto_564644 ?auto_564653 ) ) ( not ( = ?auto_564644 ?auto_564654 ) ) ( not ( = ?auto_564644 ?auto_564655 ) ) ( not ( = ?auto_564644 ?auto_564656 ) ) ( not ( = ?auto_564644 ?auto_564657 ) ) ( not ( = ?auto_564645 ?auto_564646 ) ) ( not ( = ?auto_564645 ?auto_564647 ) ) ( not ( = ?auto_564645 ?auto_564648 ) ) ( not ( = ?auto_564645 ?auto_564649 ) ) ( not ( = ?auto_564645 ?auto_564650 ) ) ( not ( = ?auto_564645 ?auto_564651 ) ) ( not ( = ?auto_564645 ?auto_564652 ) ) ( not ( = ?auto_564645 ?auto_564653 ) ) ( not ( = ?auto_564645 ?auto_564654 ) ) ( not ( = ?auto_564645 ?auto_564655 ) ) ( not ( = ?auto_564645 ?auto_564656 ) ) ( not ( = ?auto_564645 ?auto_564657 ) ) ( not ( = ?auto_564646 ?auto_564647 ) ) ( not ( = ?auto_564646 ?auto_564648 ) ) ( not ( = ?auto_564646 ?auto_564649 ) ) ( not ( = ?auto_564646 ?auto_564650 ) ) ( not ( = ?auto_564646 ?auto_564651 ) ) ( not ( = ?auto_564646 ?auto_564652 ) ) ( not ( = ?auto_564646 ?auto_564653 ) ) ( not ( = ?auto_564646 ?auto_564654 ) ) ( not ( = ?auto_564646 ?auto_564655 ) ) ( not ( = ?auto_564646 ?auto_564656 ) ) ( not ( = ?auto_564646 ?auto_564657 ) ) ( not ( = ?auto_564647 ?auto_564648 ) ) ( not ( = ?auto_564647 ?auto_564649 ) ) ( not ( = ?auto_564647 ?auto_564650 ) ) ( not ( = ?auto_564647 ?auto_564651 ) ) ( not ( = ?auto_564647 ?auto_564652 ) ) ( not ( = ?auto_564647 ?auto_564653 ) ) ( not ( = ?auto_564647 ?auto_564654 ) ) ( not ( = ?auto_564647 ?auto_564655 ) ) ( not ( = ?auto_564647 ?auto_564656 ) ) ( not ( = ?auto_564647 ?auto_564657 ) ) ( not ( = ?auto_564648 ?auto_564649 ) ) ( not ( = ?auto_564648 ?auto_564650 ) ) ( not ( = ?auto_564648 ?auto_564651 ) ) ( not ( = ?auto_564648 ?auto_564652 ) ) ( not ( = ?auto_564648 ?auto_564653 ) ) ( not ( = ?auto_564648 ?auto_564654 ) ) ( not ( = ?auto_564648 ?auto_564655 ) ) ( not ( = ?auto_564648 ?auto_564656 ) ) ( not ( = ?auto_564648 ?auto_564657 ) ) ( not ( = ?auto_564649 ?auto_564650 ) ) ( not ( = ?auto_564649 ?auto_564651 ) ) ( not ( = ?auto_564649 ?auto_564652 ) ) ( not ( = ?auto_564649 ?auto_564653 ) ) ( not ( = ?auto_564649 ?auto_564654 ) ) ( not ( = ?auto_564649 ?auto_564655 ) ) ( not ( = ?auto_564649 ?auto_564656 ) ) ( not ( = ?auto_564649 ?auto_564657 ) ) ( not ( = ?auto_564650 ?auto_564651 ) ) ( not ( = ?auto_564650 ?auto_564652 ) ) ( not ( = ?auto_564650 ?auto_564653 ) ) ( not ( = ?auto_564650 ?auto_564654 ) ) ( not ( = ?auto_564650 ?auto_564655 ) ) ( not ( = ?auto_564650 ?auto_564656 ) ) ( not ( = ?auto_564650 ?auto_564657 ) ) ( not ( = ?auto_564651 ?auto_564652 ) ) ( not ( = ?auto_564651 ?auto_564653 ) ) ( not ( = ?auto_564651 ?auto_564654 ) ) ( not ( = ?auto_564651 ?auto_564655 ) ) ( not ( = ?auto_564651 ?auto_564656 ) ) ( not ( = ?auto_564651 ?auto_564657 ) ) ( not ( = ?auto_564652 ?auto_564653 ) ) ( not ( = ?auto_564652 ?auto_564654 ) ) ( not ( = ?auto_564652 ?auto_564655 ) ) ( not ( = ?auto_564652 ?auto_564656 ) ) ( not ( = ?auto_564652 ?auto_564657 ) ) ( not ( = ?auto_564653 ?auto_564654 ) ) ( not ( = ?auto_564653 ?auto_564655 ) ) ( not ( = ?auto_564653 ?auto_564656 ) ) ( not ( = ?auto_564653 ?auto_564657 ) ) ( not ( = ?auto_564654 ?auto_564655 ) ) ( not ( = ?auto_564654 ?auto_564656 ) ) ( not ( = ?auto_564654 ?auto_564657 ) ) ( not ( = ?auto_564655 ?auto_564656 ) ) ( not ( = ?auto_564655 ?auto_564657 ) ) ( not ( = ?auto_564656 ?auto_564657 ) ) ( ON ?auto_564655 ?auto_564656 ) ( ON ?auto_564654 ?auto_564655 ) ( ON ?auto_564653 ?auto_564654 ) ( ON ?auto_564652 ?auto_564653 ) ( ON ?auto_564651 ?auto_564652 ) ( CLEAR ?auto_564649 ) ( ON ?auto_564650 ?auto_564651 ) ( CLEAR ?auto_564650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_564641 ?auto_564642 ?auto_564643 ?auto_564644 ?auto_564645 ?auto_564646 ?auto_564647 ?auto_564648 ?auto_564649 ?auto_564650 )
      ( MAKE-16PILE ?auto_564641 ?auto_564642 ?auto_564643 ?auto_564644 ?auto_564645 ?auto_564646 ?auto_564647 ?auto_564648 ?auto_564649 ?auto_564650 ?auto_564651 ?auto_564652 ?auto_564653 ?auto_564654 ?auto_564655 ?auto_564656 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564674 - BLOCK
      ?auto_564675 - BLOCK
      ?auto_564676 - BLOCK
      ?auto_564677 - BLOCK
      ?auto_564678 - BLOCK
      ?auto_564679 - BLOCK
      ?auto_564680 - BLOCK
      ?auto_564681 - BLOCK
      ?auto_564682 - BLOCK
      ?auto_564683 - BLOCK
      ?auto_564684 - BLOCK
      ?auto_564685 - BLOCK
      ?auto_564686 - BLOCK
      ?auto_564687 - BLOCK
      ?auto_564688 - BLOCK
      ?auto_564689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564689 ) ( ON-TABLE ?auto_564674 ) ( ON ?auto_564675 ?auto_564674 ) ( ON ?auto_564676 ?auto_564675 ) ( ON ?auto_564677 ?auto_564676 ) ( ON ?auto_564678 ?auto_564677 ) ( ON ?auto_564679 ?auto_564678 ) ( ON ?auto_564680 ?auto_564679 ) ( ON ?auto_564681 ?auto_564680 ) ( ON ?auto_564682 ?auto_564681 ) ( not ( = ?auto_564674 ?auto_564675 ) ) ( not ( = ?auto_564674 ?auto_564676 ) ) ( not ( = ?auto_564674 ?auto_564677 ) ) ( not ( = ?auto_564674 ?auto_564678 ) ) ( not ( = ?auto_564674 ?auto_564679 ) ) ( not ( = ?auto_564674 ?auto_564680 ) ) ( not ( = ?auto_564674 ?auto_564681 ) ) ( not ( = ?auto_564674 ?auto_564682 ) ) ( not ( = ?auto_564674 ?auto_564683 ) ) ( not ( = ?auto_564674 ?auto_564684 ) ) ( not ( = ?auto_564674 ?auto_564685 ) ) ( not ( = ?auto_564674 ?auto_564686 ) ) ( not ( = ?auto_564674 ?auto_564687 ) ) ( not ( = ?auto_564674 ?auto_564688 ) ) ( not ( = ?auto_564674 ?auto_564689 ) ) ( not ( = ?auto_564675 ?auto_564676 ) ) ( not ( = ?auto_564675 ?auto_564677 ) ) ( not ( = ?auto_564675 ?auto_564678 ) ) ( not ( = ?auto_564675 ?auto_564679 ) ) ( not ( = ?auto_564675 ?auto_564680 ) ) ( not ( = ?auto_564675 ?auto_564681 ) ) ( not ( = ?auto_564675 ?auto_564682 ) ) ( not ( = ?auto_564675 ?auto_564683 ) ) ( not ( = ?auto_564675 ?auto_564684 ) ) ( not ( = ?auto_564675 ?auto_564685 ) ) ( not ( = ?auto_564675 ?auto_564686 ) ) ( not ( = ?auto_564675 ?auto_564687 ) ) ( not ( = ?auto_564675 ?auto_564688 ) ) ( not ( = ?auto_564675 ?auto_564689 ) ) ( not ( = ?auto_564676 ?auto_564677 ) ) ( not ( = ?auto_564676 ?auto_564678 ) ) ( not ( = ?auto_564676 ?auto_564679 ) ) ( not ( = ?auto_564676 ?auto_564680 ) ) ( not ( = ?auto_564676 ?auto_564681 ) ) ( not ( = ?auto_564676 ?auto_564682 ) ) ( not ( = ?auto_564676 ?auto_564683 ) ) ( not ( = ?auto_564676 ?auto_564684 ) ) ( not ( = ?auto_564676 ?auto_564685 ) ) ( not ( = ?auto_564676 ?auto_564686 ) ) ( not ( = ?auto_564676 ?auto_564687 ) ) ( not ( = ?auto_564676 ?auto_564688 ) ) ( not ( = ?auto_564676 ?auto_564689 ) ) ( not ( = ?auto_564677 ?auto_564678 ) ) ( not ( = ?auto_564677 ?auto_564679 ) ) ( not ( = ?auto_564677 ?auto_564680 ) ) ( not ( = ?auto_564677 ?auto_564681 ) ) ( not ( = ?auto_564677 ?auto_564682 ) ) ( not ( = ?auto_564677 ?auto_564683 ) ) ( not ( = ?auto_564677 ?auto_564684 ) ) ( not ( = ?auto_564677 ?auto_564685 ) ) ( not ( = ?auto_564677 ?auto_564686 ) ) ( not ( = ?auto_564677 ?auto_564687 ) ) ( not ( = ?auto_564677 ?auto_564688 ) ) ( not ( = ?auto_564677 ?auto_564689 ) ) ( not ( = ?auto_564678 ?auto_564679 ) ) ( not ( = ?auto_564678 ?auto_564680 ) ) ( not ( = ?auto_564678 ?auto_564681 ) ) ( not ( = ?auto_564678 ?auto_564682 ) ) ( not ( = ?auto_564678 ?auto_564683 ) ) ( not ( = ?auto_564678 ?auto_564684 ) ) ( not ( = ?auto_564678 ?auto_564685 ) ) ( not ( = ?auto_564678 ?auto_564686 ) ) ( not ( = ?auto_564678 ?auto_564687 ) ) ( not ( = ?auto_564678 ?auto_564688 ) ) ( not ( = ?auto_564678 ?auto_564689 ) ) ( not ( = ?auto_564679 ?auto_564680 ) ) ( not ( = ?auto_564679 ?auto_564681 ) ) ( not ( = ?auto_564679 ?auto_564682 ) ) ( not ( = ?auto_564679 ?auto_564683 ) ) ( not ( = ?auto_564679 ?auto_564684 ) ) ( not ( = ?auto_564679 ?auto_564685 ) ) ( not ( = ?auto_564679 ?auto_564686 ) ) ( not ( = ?auto_564679 ?auto_564687 ) ) ( not ( = ?auto_564679 ?auto_564688 ) ) ( not ( = ?auto_564679 ?auto_564689 ) ) ( not ( = ?auto_564680 ?auto_564681 ) ) ( not ( = ?auto_564680 ?auto_564682 ) ) ( not ( = ?auto_564680 ?auto_564683 ) ) ( not ( = ?auto_564680 ?auto_564684 ) ) ( not ( = ?auto_564680 ?auto_564685 ) ) ( not ( = ?auto_564680 ?auto_564686 ) ) ( not ( = ?auto_564680 ?auto_564687 ) ) ( not ( = ?auto_564680 ?auto_564688 ) ) ( not ( = ?auto_564680 ?auto_564689 ) ) ( not ( = ?auto_564681 ?auto_564682 ) ) ( not ( = ?auto_564681 ?auto_564683 ) ) ( not ( = ?auto_564681 ?auto_564684 ) ) ( not ( = ?auto_564681 ?auto_564685 ) ) ( not ( = ?auto_564681 ?auto_564686 ) ) ( not ( = ?auto_564681 ?auto_564687 ) ) ( not ( = ?auto_564681 ?auto_564688 ) ) ( not ( = ?auto_564681 ?auto_564689 ) ) ( not ( = ?auto_564682 ?auto_564683 ) ) ( not ( = ?auto_564682 ?auto_564684 ) ) ( not ( = ?auto_564682 ?auto_564685 ) ) ( not ( = ?auto_564682 ?auto_564686 ) ) ( not ( = ?auto_564682 ?auto_564687 ) ) ( not ( = ?auto_564682 ?auto_564688 ) ) ( not ( = ?auto_564682 ?auto_564689 ) ) ( not ( = ?auto_564683 ?auto_564684 ) ) ( not ( = ?auto_564683 ?auto_564685 ) ) ( not ( = ?auto_564683 ?auto_564686 ) ) ( not ( = ?auto_564683 ?auto_564687 ) ) ( not ( = ?auto_564683 ?auto_564688 ) ) ( not ( = ?auto_564683 ?auto_564689 ) ) ( not ( = ?auto_564684 ?auto_564685 ) ) ( not ( = ?auto_564684 ?auto_564686 ) ) ( not ( = ?auto_564684 ?auto_564687 ) ) ( not ( = ?auto_564684 ?auto_564688 ) ) ( not ( = ?auto_564684 ?auto_564689 ) ) ( not ( = ?auto_564685 ?auto_564686 ) ) ( not ( = ?auto_564685 ?auto_564687 ) ) ( not ( = ?auto_564685 ?auto_564688 ) ) ( not ( = ?auto_564685 ?auto_564689 ) ) ( not ( = ?auto_564686 ?auto_564687 ) ) ( not ( = ?auto_564686 ?auto_564688 ) ) ( not ( = ?auto_564686 ?auto_564689 ) ) ( not ( = ?auto_564687 ?auto_564688 ) ) ( not ( = ?auto_564687 ?auto_564689 ) ) ( not ( = ?auto_564688 ?auto_564689 ) ) ( ON ?auto_564688 ?auto_564689 ) ( ON ?auto_564687 ?auto_564688 ) ( ON ?auto_564686 ?auto_564687 ) ( ON ?auto_564685 ?auto_564686 ) ( ON ?auto_564684 ?auto_564685 ) ( CLEAR ?auto_564682 ) ( ON ?auto_564683 ?auto_564684 ) ( CLEAR ?auto_564683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_564674 ?auto_564675 ?auto_564676 ?auto_564677 ?auto_564678 ?auto_564679 ?auto_564680 ?auto_564681 ?auto_564682 ?auto_564683 )
      ( MAKE-16PILE ?auto_564674 ?auto_564675 ?auto_564676 ?auto_564677 ?auto_564678 ?auto_564679 ?auto_564680 ?auto_564681 ?auto_564682 ?auto_564683 ?auto_564684 ?auto_564685 ?auto_564686 ?auto_564687 ?auto_564688 ?auto_564689 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564706 - BLOCK
      ?auto_564707 - BLOCK
      ?auto_564708 - BLOCK
      ?auto_564709 - BLOCK
      ?auto_564710 - BLOCK
      ?auto_564711 - BLOCK
      ?auto_564712 - BLOCK
      ?auto_564713 - BLOCK
      ?auto_564714 - BLOCK
      ?auto_564715 - BLOCK
      ?auto_564716 - BLOCK
      ?auto_564717 - BLOCK
      ?auto_564718 - BLOCK
      ?auto_564719 - BLOCK
      ?auto_564720 - BLOCK
      ?auto_564721 - BLOCK
    )
    :vars
    (
      ?auto_564722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564721 ?auto_564722 ) ( ON-TABLE ?auto_564706 ) ( ON ?auto_564707 ?auto_564706 ) ( ON ?auto_564708 ?auto_564707 ) ( ON ?auto_564709 ?auto_564708 ) ( ON ?auto_564710 ?auto_564709 ) ( ON ?auto_564711 ?auto_564710 ) ( ON ?auto_564712 ?auto_564711 ) ( ON ?auto_564713 ?auto_564712 ) ( not ( = ?auto_564706 ?auto_564707 ) ) ( not ( = ?auto_564706 ?auto_564708 ) ) ( not ( = ?auto_564706 ?auto_564709 ) ) ( not ( = ?auto_564706 ?auto_564710 ) ) ( not ( = ?auto_564706 ?auto_564711 ) ) ( not ( = ?auto_564706 ?auto_564712 ) ) ( not ( = ?auto_564706 ?auto_564713 ) ) ( not ( = ?auto_564706 ?auto_564714 ) ) ( not ( = ?auto_564706 ?auto_564715 ) ) ( not ( = ?auto_564706 ?auto_564716 ) ) ( not ( = ?auto_564706 ?auto_564717 ) ) ( not ( = ?auto_564706 ?auto_564718 ) ) ( not ( = ?auto_564706 ?auto_564719 ) ) ( not ( = ?auto_564706 ?auto_564720 ) ) ( not ( = ?auto_564706 ?auto_564721 ) ) ( not ( = ?auto_564706 ?auto_564722 ) ) ( not ( = ?auto_564707 ?auto_564708 ) ) ( not ( = ?auto_564707 ?auto_564709 ) ) ( not ( = ?auto_564707 ?auto_564710 ) ) ( not ( = ?auto_564707 ?auto_564711 ) ) ( not ( = ?auto_564707 ?auto_564712 ) ) ( not ( = ?auto_564707 ?auto_564713 ) ) ( not ( = ?auto_564707 ?auto_564714 ) ) ( not ( = ?auto_564707 ?auto_564715 ) ) ( not ( = ?auto_564707 ?auto_564716 ) ) ( not ( = ?auto_564707 ?auto_564717 ) ) ( not ( = ?auto_564707 ?auto_564718 ) ) ( not ( = ?auto_564707 ?auto_564719 ) ) ( not ( = ?auto_564707 ?auto_564720 ) ) ( not ( = ?auto_564707 ?auto_564721 ) ) ( not ( = ?auto_564707 ?auto_564722 ) ) ( not ( = ?auto_564708 ?auto_564709 ) ) ( not ( = ?auto_564708 ?auto_564710 ) ) ( not ( = ?auto_564708 ?auto_564711 ) ) ( not ( = ?auto_564708 ?auto_564712 ) ) ( not ( = ?auto_564708 ?auto_564713 ) ) ( not ( = ?auto_564708 ?auto_564714 ) ) ( not ( = ?auto_564708 ?auto_564715 ) ) ( not ( = ?auto_564708 ?auto_564716 ) ) ( not ( = ?auto_564708 ?auto_564717 ) ) ( not ( = ?auto_564708 ?auto_564718 ) ) ( not ( = ?auto_564708 ?auto_564719 ) ) ( not ( = ?auto_564708 ?auto_564720 ) ) ( not ( = ?auto_564708 ?auto_564721 ) ) ( not ( = ?auto_564708 ?auto_564722 ) ) ( not ( = ?auto_564709 ?auto_564710 ) ) ( not ( = ?auto_564709 ?auto_564711 ) ) ( not ( = ?auto_564709 ?auto_564712 ) ) ( not ( = ?auto_564709 ?auto_564713 ) ) ( not ( = ?auto_564709 ?auto_564714 ) ) ( not ( = ?auto_564709 ?auto_564715 ) ) ( not ( = ?auto_564709 ?auto_564716 ) ) ( not ( = ?auto_564709 ?auto_564717 ) ) ( not ( = ?auto_564709 ?auto_564718 ) ) ( not ( = ?auto_564709 ?auto_564719 ) ) ( not ( = ?auto_564709 ?auto_564720 ) ) ( not ( = ?auto_564709 ?auto_564721 ) ) ( not ( = ?auto_564709 ?auto_564722 ) ) ( not ( = ?auto_564710 ?auto_564711 ) ) ( not ( = ?auto_564710 ?auto_564712 ) ) ( not ( = ?auto_564710 ?auto_564713 ) ) ( not ( = ?auto_564710 ?auto_564714 ) ) ( not ( = ?auto_564710 ?auto_564715 ) ) ( not ( = ?auto_564710 ?auto_564716 ) ) ( not ( = ?auto_564710 ?auto_564717 ) ) ( not ( = ?auto_564710 ?auto_564718 ) ) ( not ( = ?auto_564710 ?auto_564719 ) ) ( not ( = ?auto_564710 ?auto_564720 ) ) ( not ( = ?auto_564710 ?auto_564721 ) ) ( not ( = ?auto_564710 ?auto_564722 ) ) ( not ( = ?auto_564711 ?auto_564712 ) ) ( not ( = ?auto_564711 ?auto_564713 ) ) ( not ( = ?auto_564711 ?auto_564714 ) ) ( not ( = ?auto_564711 ?auto_564715 ) ) ( not ( = ?auto_564711 ?auto_564716 ) ) ( not ( = ?auto_564711 ?auto_564717 ) ) ( not ( = ?auto_564711 ?auto_564718 ) ) ( not ( = ?auto_564711 ?auto_564719 ) ) ( not ( = ?auto_564711 ?auto_564720 ) ) ( not ( = ?auto_564711 ?auto_564721 ) ) ( not ( = ?auto_564711 ?auto_564722 ) ) ( not ( = ?auto_564712 ?auto_564713 ) ) ( not ( = ?auto_564712 ?auto_564714 ) ) ( not ( = ?auto_564712 ?auto_564715 ) ) ( not ( = ?auto_564712 ?auto_564716 ) ) ( not ( = ?auto_564712 ?auto_564717 ) ) ( not ( = ?auto_564712 ?auto_564718 ) ) ( not ( = ?auto_564712 ?auto_564719 ) ) ( not ( = ?auto_564712 ?auto_564720 ) ) ( not ( = ?auto_564712 ?auto_564721 ) ) ( not ( = ?auto_564712 ?auto_564722 ) ) ( not ( = ?auto_564713 ?auto_564714 ) ) ( not ( = ?auto_564713 ?auto_564715 ) ) ( not ( = ?auto_564713 ?auto_564716 ) ) ( not ( = ?auto_564713 ?auto_564717 ) ) ( not ( = ?auto_564713 ?auto_564718 ) ) ( not ( = ?auto_564713 ?auto_564719 ) ) ( not ( = ?auto_564713 ?auto_564720 ) ) ( not ( = ?auto_564713 ?auto_564721 ) ) ( not ( = ?auto_564713 ?auto_564722 ) ) ( not ( = ?auto_564714 ?auto_564715 ) ) ( not ( = ?auto_564714 ?auto_564716 ) ) ( not ( = ?auto_564714 ?auto_564717 ) ) ( not ( = ?auto_564714 ?auto_564718 ) ) ( not ( = ?auto_564714 ?auto_564719 ) ) ( not ( = ?auto_564714 ?auto_564720 ) ) ( not ( = ?auto_564714 ?auto_564721 ) ) ( not ( = ?auto_564714 ?auto_564722 ) ) ( not ( = ?auto_564715 ?auto_564716 ) ) ( not ( = ?auto_564715 ?auto_564717 ) ) ( not ( = ?auto_564715 ?auto_564718 ) ) ( not ( = ?auto_564715 ?auto_564719 ) ) ( not ( = ?auto_564715 ?auto_564720 ) ) ( not ( = ?auto_564715 ?auto_564721 ) ) ( not ( = ?auto_564715 ?auto_564722 ) ) ( not ( = ?auto_564716 ?auto_564717 ) ) ( not ( = ?auto_564716 ?auto_564718 ) ) ( not ( = ?auto_564716 ?auto_564719 ) ) ( not ( = ?auto_564716 ?auto_564720 ) ) ( not ( = ?auto_564716 ?auto_564721 ) ) ( not ( = ?auto_564716 ?auto_564722 ) ) ( not ( = ?auto_564717 ?auto_564718 ) ) ( not ( = ?auto_564717 ?auto_564719 ) ) ( not ( = ?auto_564717 ?auto_564720 ) ) ( not ( = ?auto_564717 ?auto_564721 ) ) ( not ( = ?auto_564717 ?auto_564722 ) ) ( not ( = ?auto_564718 ?auto_564719 ) ) ( not ( = ?auto_564718 ?auto_564720 ) ) ( not ( = ?auto_564718 ?auto_564721 ) ) ( not ( = ?auto_564718 ?auto_564722 ) ) ( not ( = ?auto_564719 ?auto_564720 ) ) ( not ( = ?auto_564719 ?auto_564721 ) ) ( not ( = ?auto_564719 ?auto_564722 ) ) ( not ( = ?auto_564720 ?auto_564721 ) ) ( not ( = ?auto_564720 ?auto_564722 ) ) ( not ( = ?auto_564721 ?auto_564722 ) ) ( ON ?auto_564720 ?auto_564721 ) ( ON ?auto_564719 ?auto_564720 ) ( ON ?auto_564718 ?auto_564719 ) ( ON ?auto_564717 ?auto_564718 ) ( ON ?auto_564716 ?auto_564717 ) ( ON ?auto_564715 ?auto_564716 ) ( CLEAR ?auto_564713 ) ( ON ?auto_564714 ?auto_564715 ) ( CLEAR ?auto_564714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_564706 ?auto_564707 ?auto_564708 ?auto_564709 ?auto_564710 ?auto_564711 ?auto_564712 ?auto_564713 ?auto_564714 )
      ( MAKE-16PILE ?auto_564706 ?auto_564707 ?auto_564708 ?auto_564709 ?auto_564710 ?auto_564711 ?auto_564712 ?auto_564713 ?auto_564714 ?auto_564715 ?auto_564716 ?auto_564717 ?auto_564718 ?auto_564719 ?auto_564720 ?auto_564721 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564739 - BLOCK
      ?auto_564740 - BLOCK
      ?auto_564741 - BLOCK
      ?auto_564742 - BLOCK
      ?auto_564743 - BLOCK
      ?auto_564744 - BLOCK
      ?auto_564745 - BLOCK
      ?auto_564746 - BLOCK
      ?auto_564747 - BLOCK
      ?auto_564748 - BLOCK
      ?auto_564749 - BLOCK
      ?auto_564750 - BLOCK
      ?auto_564751 - BLOCK
      ?auto_564752 - BLOCK
      ?auto_564753 - BLOCK
      ?auto_564754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564754 ) ( ON-TABLE ?auto_564739 ) ( ON ?auto_564740 ?auto_564739 ) ( ON ?auto_564741 ?auto_564740 ) ( ON ?auto_564742 ?auto_564741 ) ( ON ?auto_564743 ?auto_564742 ) ( ON ?auto_564744 ?auto_564743 ) ( ON ?auto_564745 ?auto_564744 ) ( ON ?auto_564746 ?auto_564745 ) ( not ( = ?auto_564739 ?auto_564740 ) ) ( not ( = ?auto_564739 ?auto_564741 ) ) ( not ( = ?auto_564739 ?auto_564742 ) ) ( not ( = ?auto_564739 ?auto_564743 ) ) ( not ( = ?auto_564739 ?auto_564744 ) ) ( not ( = ?auto_564739 ?auto_564745 ) ) ( not ( = ?auto_564739 ?auto_564746 ) ) ( not ( = ?auto_564739 ?auto_564747 ) ) ( not ( = ?auto_564739 ?auto_564748 ) ) ( not ( = ?auto_564739 ?auto_564749 ) ) ( not ( = ?auto_564739 ?auto_564750 ) ) ( not ( = ?auto_564739 ?auto_564751 ) ) ( not ( = ?auto_564739 ?auto_564752 ) ) ( not ( = ?auto_564739 ?auto_564753 ) ) ( not ( = ?auto_564739 ?auto_564754 ) ) ( not ( = ?auto_564740 ?auto_564741 ) ) ( not ( = ?auto_564740 ?auto_564742 ) ) ( not ( = ?auto_564740 ?auto_564743 ) ) ( not ( = ?auto_564740 ?auto_564744 ) ) ( not ( = ?auto_564740 ?auto_564745 ) ) ( not ( = ?auto_564740 ?auto_564746 ) ) ( not ( = ?auto_564740 ?auto_564747 ) ) ( not ( = ?auto_564740 ?auto_564748 ) ) ( not ( = ?auto_564740 ?auto_564749 ) ) ( not ( = ?auto_564740 ?auto_564750 ) ) ( not ( = ?auto_564740 ?auto_564751 ) ) ( not ( = ?auto_564740 ?auto_564752 ) ) ( not ( = ?auto_564740 ?auto_564753 ) ) ( not ( = ?auto_564740 ?auto_564754 ) ) ( not ( = ?auto_564741 ?auto_564742 ) ) ( not ( = ?auto_564741 ?auto_564743 ) ) ( not ( = ?auto_564741 ?auto_564744 ) ) ( not ( = ?auto_564741 ?auto_564745 ) ) ( not ( = ?auto_564741 ?auto_564746 ) ) ( not ( = ?auto_564741 ?auto_564747 ) ) ( not ( = ?auto_564741 ?auto_564748 ) ) ( not ( = ?auto_564741 ?auto_564749 ) ) ( not ( = ?auto_564741 ?auto_564750 ) ) ( not ( = ?auto_564741 ?auto_564751 ) ) ( not ( = ?auto_564741 ?auto_564752 ) ) ( not ( = ?auto_564741 ?auto_564753 ) ) ( not ( = ?auto_564741 ?auto_564754 ) ) ( not ( = ?auto_564742 ?auto_564743 ) ) ( not ( = ?auto_564742 ?auto_564744 ) ) ( not ( = ?auto_564742 ?auto_564745 ) ) ( not ( = ?auto_564742 ?auto_564746 ) ) ( not ( = ?auto_564742 ?auto_564747 ) ) ( not ( = ?auto_564742 ?auto_564748 ) ) ( not ( = ?auto_564742 ?auto_564749 ) ) ( not ( = ?auto_564742 ?auto_564750 ) ) ( not ( = ?auto_564742 ?auto_564751 ) ) ( not ( = ?auto_564742 ?auto_564752 ) ) ( not ( = ?auto_564742 ?auto_564753 ) ) ( not ( = ?auto_564742 ?auto_564754 ) ) ( not ( = ?auto_564743 ?auto_564744 ) ) ( not ( = ?auto_564743 ?auto_564745 ) ) ( not ( = ?auto_564743 ?auto_564746 ) ) ( not ( = ?auto_564743 ?auto_564747 ) ) ( not ( = ?auto_564743 ?auto_564748 ) ) ( not ( = ?auto_564743 ?auto_564749 ) ) ( not ( = ?auto_564743 ?auto_564750 ) ) ( not ( = ?auto_564743 ?auto_564751 ) ) ( not ( = ?auto_564743 ?auto_564752 ) ) ( not ( = ?auto_564743 ?auto_564753 ) ) ( not ( = ?auto_564743 ?auto_564754 ) ) ( not ( = ?auto_564744 ?auto_564745 ) ) ( not ( = ?auto_564744 ?auto_564746 ) ) ( not ( = ?auto_564744 ?auto_564747 ) ) ( not ( = ?auto_564744 ?auto_564748 ) ) ( not ( = ?auto_564744 ?auto_564749 ) ) ( not ( = ?auto_564744 ?auto_564750 ) ) ( not ( = ?auto_564744 ?auto_564751 ) ) ( not ( = ?auto_564744 ?auto_564752 ) ) ( not ( = ?auto_564744 ?auto_564753 ) ) ( not ( = ?auto_564744 ?auto_564754 ) ) ( not ( = ?auto_564745 ?auto_564746 ) ) ( not ( = ?auto_564745 ?auto_564747 ) ) ( not ( = ?auto_564745 ?auto_564748 ) ) ( not ( = ?auto_564745 ?auto_564749 ) ) ( not ( = ?auto_564745 ?auto_564750 ) ) ( not ( = ?auto_564745 ?auto_564751 ) ) ( not ( = ?auto_564745 ?auto_564752 ) ) ( not ( = ?auto_564745 ?auto_564753 ) ) ( not ( = ?auto_564745 ?auto_564754 ) ) ( not ( = ?auto_564746 ?auto_564747 ) ) ( not ( = ?auto_564746 ?auto_564748 ) ) ( not ( = ?auto_564746 ?auto_564749 ) ) ( not ( = ?auto_564746 ?auto_564750 ) ) ( not ( = ?auto_564746 ?auto_564751 ) ) ( not ( = ?auto_564746 ?auto_564752 ) ) ( not ( = ?auto_564746 ?auto_564753 ) ) ( not ( = ?auto_564746 ?auto_564754 ) ) ( not ( = ?auto_564747 ?auto_564748 ) ) ( not ( = ?auto_564747 ?auto_564749 ) ) ( not ( = ?auto_564747 ?auto_564750 ) ) ( not ( = ?auto_564747 ?auto_564751 ) ) ( not ( = ?auto_564747 ?auto_564752 ) ) ( not ( = ?auto_564747 ?auto_564753 ) ) ( not ( = ?auto_564747 ?auto_564754 ) ) ( not ( = ?auto_564748 ?auto_564749 ) ) ( not ( = ?auto_564748 ?auto_564750 ) ) ( not ( = ?auto_564748 ?auto_564751 ) ) ( not ( = ?auto_564748 ?auto_564752 ) ) ( not ( = ?auto_564748 ?auto_564753 ) ) ( not ( = ?auto_564748 ?auto_564754 ) ) ( not ( = ?auto_564749 ?auto_564750 ) ) ( not ( = ?auto_564749 ?auto_564751 ) ) ( not ( = ?auto_564749 ?auto_564752 ) ) ( not ( = ?auto_564749 ?auto_564753 ) ) ( not ( = ?auto_564749 ?auto_564754 ) ) ( not ( = ?auto_564750 ?auto_564751 ) ) ( not ( = ?auto_564750 ?auto_564752 ) ) ( not ( = ?auto_564750 ?auto_564753 ) ) ( not ( = ?auto_564750 ?auto_564754 ) ) ( not ( = ?auto_564751 ?auto_564752 ) ) ( not ( = ?auto_564751 ?auto_564753 ) ) ( not ( = ?auto_564751 ?auto_564754 ) ) ( not ( = ?auto_564752 ?auto_564753 ) ) ( not ( = ?auto_564752 ?auto_564754 ) ) ( not ( = ?auto_564753 ?auto_564754 ) ) ( ON ?auto_564753 ?auto_564754 ) ( ON ?auto_564752 ?auto_564753 ) ( ON ?auto_564751 ?auto_564752 ) ( ON ?auto_564750 ?auto_564751 ) ( ON ?auto_564749 ?auto_564750 ) ( ON ?auto_564748 ?auto_564749 ) ( CLEAR ?auto_564746 ) ( ON ?auto_564747 ?auto_564748 ) ( CLEAR ?auto_564747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_564739 ?auto_564740 ?auto_564741 ?auto_564742 ?auto_564743 ?auto_564744 ?auto_564745 ?auto_564746 ?auto_564747 )
      ( MAKE-16PILE ?auto_564739 ?auto_564740 ?auto_564741 ?auto_564742 ?auto_564743 ?auto_564744 ?auto_564745 ?auto_564746 ?auto_564747 ?auto_564748 ?auto_564749 ?auto_564750 ?auto_564751 ?auto_564752 ?auto_564753 ?auto_564754 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564771 - BLOCK
      ?auto_564772 - BLOCK
      ?auto_564773 - BLOCK
      ?auto_564774 - BLOCK
      ?auto_564775 - BLOCK
      ?auto_564776 - BLOCK
      ?auto_564777 - BLOCK
      ?auto_564778 - BLOCK
      ?auto_564779 - BLOCK
      ?auto_564780 - BLOCK
      ?auto_564781 - BLOCK
      ?auto_564782 - BLOCK
      ?auto_564783 - BLOCK
      ?auto_564784 - BLOCK
      ?auto_564785 - BLOCK
      ?auto_564786 - BLOCK
    )
    :vars
    (
      ?auto_564787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564786 ?auto_564787 ) ( ON-TABLE ?auto_564771 ) ( ON ?auto_564772 ?auto_564771 ) ( ON ?auto_564773 ?auto_564772 ) ( ON ?auto_564774 ?auto_564773 ) ( ON ?auto_564775 ?auto_564774 ) ( ON ?auto_564776 ?auto_564775 ) ( ON ?auto_564777 ?auto_564776 ) ( not ( = ?auto_564771 ?auto_564772 ) ) ( not ( = ?auto_564771 ?auto_564773 ) ) ( not ( = ?auto_564771 ?auto_564774 ) ) ( not ( = ?auto_564771 ?auto_564775 ) ) ( not ( = ?auto_564771 ?auto_564776 ) ) ( not ( = ?auto_564771 ?auto_564777 ) ) ( not ( = ?auto_564771 ?auto_564778 ) ) ( not ( = ?auto_564771 ?auto_564779 ) ) ( not ( = ?auto_564771 ?auto_564780 ) ) ( not ( = ?auto_564771 ?auto_564781 ) ) ( not ( = ?auto_564771 ?auto_564782 ) ) ( not ( = ?auto_564771 ?auto_564783 ) ) ( not ( = ?auto_564771 ?auto_564784 ) ) ( not ( = ?auto_564771 ?auto_564785 ) ) ( not ( = ?auto_564771 ?auto_564786 ) ) ( not ( = ?auto_564771 ?auto_564787 ) ) ( not ( = ?auto_564772 ?auto_564773 ) ) ( not ( = ?auto_564772 ?auto_564774 ) ) ( not ( = ?auto_564772 ?auto_564775 ) ) ( not ( = ?auto_564772 ?auto_564776 ) ) ( not ( = ?auto_564772 ?auto_564777 ) ) ( not ( = ?auto_564772 ?auto_564778 ) ) ( not ( = ?auto_564772 ?auto_564779 ) ) ( not ( = ?auto_564772 ?auto_564780 ) ) ( not ( = ?auto_564772 ?auto_564781 ) ) ( not ( = ?auto_564772 ?auto_564782 ) ) ( not ( = ?auto_564772 ?auto_564783 ) ) ( not ( = ?auto_564772 ?auto_564784 ) ) ( not ( = ?auto_564772 ?auto_564785 ) ) ( not ( = ?auto_564772 ?auto_564786 ) ) ( not ( = ?auto_564772 ?auto_564787 ) ) ( not ( = ?auto_564773 ?auto_564774 ) ) ( not ( = ?auto_564773 ?auto_564775 ) ) ( not ( = ?auto_564773 ?auto_564776 ) ) ( not ( = ?auto_564773 ?auto_564777 ) ) ( not ( = ?auto_564773 ?auto_564778 ) ) ( not ( = ?auto_564773 ?auto_564779 ) ) ( not ( = ?auto_564773 ?auto_564780 ) ) ( not ( = ?auto_564773 ?auto_564781 ) ) ( not ( = ?auto_564773 ?auto_564782 ) ) ( not ( = ?auto_564773 ?auto_564783 ) ) ( not ( = ?auto_564773 ?auto_564784 ) ) ( not ( = ?auto_564773 ?auto_564785 ) ) ( not ( = ?auto_564773 ?auto_564786 ) ) ( not ( = ?auto_564773 ?auto_564787 ) ) ( not ( = ?auto_564774 ?auto_564775 ) ) ( not ( = ?auto_564774 ?auto_564776 ) ) ( not ( = ?auto_564774 ?auto_564777 ) ) ( not ( = ?auto_564774 ?auto_564778 ) ) ( not ( = ?auto_564774 ?auto_564779 ) ) ( not ( = ?auto_564774 ?auto_564780 ) ) ( not ( = ?auto_564774 ?auto_564781 ) ) ( not ( = ?auto_564774 ?auto_564782 ) ) ( not ( = ?auto_564774 ?auto_564783 ) ) ( not ( = ?auto_564774 ?auto_564784 ) ) ( not ( = ?auto_564774 ?auto_564785 ) ) ( not ( = ?auto_564774 ?auto_564786 ) ) ( not ( = ?auto_564774 ?auto_564787 ) ) ( not ( = ?auto_564775 ?auto_564776 ) ) ( not ( = ?auto_564775 ?auto_564777 ) ) ( not ( = ?auto_564775 ?auto_564778 ) ) ( not ( = ?auto_564775 ?auto_564779 ) ) ( not ( = ?auto_564775 ?auto_564780 ) ) ( not ( = ?auto_564775 ?auto_564781 ) ) ( not ( = ?auto_564775 ?auto_564782 ) ) ( not ( = ?auto_564775 ?auto_564783 ) ) ( not ( = ?auto_564775 ?auto_564784 ) ) ( not ( = ?auto_564775 ?auto_564785 ) ) ( not ( = ?auto_564775 ?auto_564786 ) ) ( not ( = ?auto_564775 ?auto_564787 ) ) ( not ( = ?auto_564776 ?auto_564777 ) ) ( not ( = ?auto_564776 ?auto_564778 ) ) ( not ( = ?auto_564776 ?auto_564779 ) ) ( not ( = ?auto_564776 ?auto_564780 ) ) ( not ( = ?auto_564776 ?auto_564781 ) ) ( not ( = ?auto_564776 ?auto_564782 ) ) ( not ( = ?auto_564776 ?auto_564783 ) ) ( not ( = ?auto_564776 ?auto_564784 ) ) ( not ( = ?auto_564776 ?auto_564785 ) ) ( not ( = ?auto_564776 ?auto_564786 ) ) ( not ( = ?auto_564776 ?auto_564787 ) ) ( not ( = ?auto_564777 ?auto_564778 ) ) ( not ( = ?auto_564777 ?auto_564779 ) ) ( not ( = ?auto_564777 ?auto_564780 ) ) ( not ( = ?auto_564777 ?auto_564781 ) ) ( not ( = ?auto_564777 ?auto_564782 ) ) ( not ( = ?auto_564777 ?auto_564783 ) ) ( not ( = ?auto_564777 ?auto_564784 ) ) ( not ( = ?auto_564777 ?auto_564785 ) ) ( not ( = ?auto_564777 ?auto_564786 ) ) ( not ( = ?auto_564777 ?auto_564787 ) ) ( not ( = ?auto_564778 ?auto_564779 ) ) ( not ( = ?auto_564778 ?auto_564780 ) ) ( not ( = ?auto_564778 ?auto_564781 ) ) ( not ( = ?auto_564778 ?auto_564782 ) ) ( not ( = ?auto_564778 ?auto_564783 ) ) ( not ( = ?auto_564778 ?auto_564784 ) ) ( not ( = ?auto_564778 ?auto_564785 ) ) ( not ( = ?auto_564778 ?auto_564786 ) ) ( not ( = ?auto_564778 ?auto_564787 ) ) ( not ( = ?auto_564779 ?auto_564780 ) ) ( not ( = ?auto_564779 ?auto_564781 ) ) ( not ( = ?auto_564779 ?auto_564782 ) ) ( not ( = ?auto_564779 ?auto_564783 ) ) ( not ( = ?auto_564779 ?auto_564784 ) ) ( not ( = ?auto_564779 ?auto_564785 ) ) ( not ( = ?auto_564779 ?auto_564786 ) ) ( not ( = ?auto_564779 ?auto_564787 ) ) ( not ( = ?auto_564780 ?auto_564781 ) ) ( not ( = ?auto_564780 ?auto_564782 ) ) ( not ( = ?auto_564780 ?auto_564783 ) ) ( not ( = ?auto_564780 ?auto_564784 ) ) ( not ( = ?auto_564780 ?auto_564785 ) ) ( not ( = ?auto_564780 ?auto_564786 ) ) ( not ( = ?auto_564780 ?auto_564787 ) ) ( not ( = ?auto_564781 ?auto_564782 ) ) ( not ( = ?auto_564781 ?auto_564783 ) ) ( not ( = ?auto_564781 ?auto_564784 ) ) ( not ( = ?auto_564781 ?auto_564785 ) ) ( not ( = ?auto_564781 ?auto_564786 ) ) ( not ( = ?auto_564781 ?auto_564787 ) ) ( not ( = ?auto_564782 ?auto_564783 ) ) ( not ( = ?auto_564782 ?auto_564784 ) ) ( not ( = ?auto_564782 ?auto_564785 ) ) ( not ( = ?auto_564782 ?auto_564786 ) ) ( not ( = ?auto_564782 ?auto_564787 ) ) ( not ( = ?auto_564783 ?auto_564784 ) ) ( not ( = ?auto_564783 ?auto_564785 ) ) ( not ( = ?auto_564783 ?auto_564786 ) ) ( not ( = ?auto_564783 ?auto_564787 ) ) ( not ( = ?auto_564784 ?auto_564785 ) ) ( not ( = ?auto_564784 ?auto_564786 ) ) ( not ( = ?auto_564784 ?auto_564787 ) ) ( not ( = ?auto_564785 ?auto_564786 ) ) ( not ( = ?auto_564785 ?auto_564787 ) ) ( not ( = ?auto_564786 ?auto_564787 ) ) ( ON ?auto_564785 ?auto_564786 ) ( ON ?auto_564784 ?auto_564785 ) ( ON ?auto_564783 ?auto_564784 ) ( ON ?auto_564782 ?auto_564783 ) ( ON ?auto_564781 ?auto_564782 ) ( ON ?auto_564780 ?auto_564781 ) ( ON ?auto_564779 ?auto_564780 ) ( CLEAR ?auto_564777 ) ( ON ?auto_564778 ?auto_564779 ) ( CLEAR ?auto_564778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_564771 ?auto_564772 ?auto_564773 ?auto_564774 ?auto_564775 ?auto_564776 ?auto_564777 ?auto_564778 )
      ( MAKE-16PILE ?auto_564771 ?auto_564772 ?auto_564773 ?auto_564774 ?auto_564775 ?auto_564776 ?auto_564777 ?auto_564778 ?auto_564779 ?auto_564780 ?auto_564781 ?auto_564782 ?auto_564783 ?auto_564784 ?auto_564785 ?auto_564786 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564804 - BLOCK
      ?auto_564805 - BLOCK
      ?auto_564806 - BLOCK
      ?auto_564807 - BLOCK
      ?auto_564808 - BLOCK
      ?auto_564809 - BLOCK
      ?auto_564810 - BLOCK
      ?auto_564811 - BLOCK
      ?auto_564812 - BLOCK
      ?auto_564813 - BLOCK
      ?auto_564814 - BLOCK
      ?auto_564815 - BLOCK
      ?auto_564816 - BLOCK
      ?auto_564817 - BLOCK
      ?auto_564818 - BLOCK
      ?auto_564819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564819 ) ( ON-TABLE ?auto_564804 ) ( ON ?auto_564805 ?auto_564804 ) ( ON ?auto_564806 ?auto_564805 ) ( ON ?auto_564807 ?auto_564806 ) ( ON ?auto_564808 ?auto_564807 ) ( ON ?auto_564809 ?auto_564808 ) ( ON ?auto_564810 ?auto_564809 ) ( not ( = ?auto_564804 ?auto_564805 ) ) ( not ( = ?auto_564804 ?auto_564806 ) ) ( not ( = ?auto_564804 ?auto_564807 ) ) ( not ( = ?auto_564804 ?auto_564808 ) ) ( not ( = ?auto_564804 ?auto_564809 ) ) ( not ( = ?auto_564804 ?auto_564810 ) ) ( not ( = ?auto_564804 ?auto_564811 ) ) ( not ( = ?auto_564804 ?auto_564812 ) ) ( not ( = ?auto_564804 ?auto_564813 ) ) ( not ( = ?auto_564804 ?auto_564814 ) ) ( not ( = ?auto_564804 ?auto_564815 ) ) ( not ( = ?auto_564804 ?auto_564816 ) ) ( not ( = ?auto_564804 ?auto_564817 ) ) ( not ( = ?auto_564804 ?auto_564818 ) ) ( not ( = ?auto_564804 ?auto_564819 ) ) ( not ( = ?auto_564805 ?auto_564806 ) ) ( not ( = ?auto_564805 ?auto_564807 ) ) ( not ( = ?auto_564805 ?auto_564808 ) ) ( not ( = ?auto_564805 ?auto_564809 ) ) ( not ( = ?auto_564805 ?auto_564810 ) ) ( not ( = ?auto_564805 ?auto_564811 ) ) ( not ( = ?auto_564805 ?auto_564812 ) ) ( not ( = ?auto_564805 ?auto_564813 ) ) ( not ( = ?auto_564805 ?auto_564814 ) ) ( not ( = ?auto_564805 ?auto_564815 ) ) ( not ( = ?auto_564805 ?auto_564816 ) ) ( not ( = ?auto_564805 ?auto_564817 ) ) ( not ( = ?auto_564805 ?auto_564818 ) ) ( not ( = ?auto_564805 ?auto_564819 ) ) ( not ( = ?auto_564806 ?auto_564807 ) ) ( not ( = ?auto_564806 ?auto_564808 ) ) ( not ( = ?auto_564806 ?auto_564809 ) ) ( not ( = ?auto_564806 ?auto_564810 ) ) ( not ( = ?auto_564806 ?auto_564811 ) ) ( not ( = ?auto_564806 ?auto_564812 ) ) ( not ( = ?auto_564806 ?auto_564813 ) ) ( not ( = ?auto_564806 ?auto_564814 ) ) ( not ( = ?auto_564806 ?auto_564815 ) ) ( not ( = ?auto_564806 ?auto_564816 ) ) ( not ( = ?auto_564806 ?auto_564817 ) ) ( not ( = ?auto_564806 ?auto_564818 ) ) ( not ( = ?auto_564806 ?auto_564819 ) ) ( not ( = ?auto_564807 ?auto_564808 ) ) ( not ( = ?auto_564807 ?auto_564809 ) ) ( not ( = ?auto_564807 ?auto_564810 ) ) ( not ( = ?auto_564807 ?auto_564811 ) ) ( not ( = ?auto_564807 ?auto_564812 ) ) ( not ( = ?auto_564807 ?auto_564813 ) ) ( not ( = ?auto_564807 ?auto_564814 ) ) ( not ( = ?auto_564807 ?auto_564815 ) ) ( not ( = ?auto_564807 ?auto_564816 ) ) ( not ( = ?auto_564807 ?auto_564817 ) ) ( not ( = ?auto_564807 ?auto_564818 ) ) ( not ( = ?auto_564807 ?auto_564819 ) ) ( not ( = ?auto_564808 ?auto_564809 ) ) ( not ( = ?auto_564808 ?auto_564810 ) ) ( not ( = ?auto_564808 ?auto_564811 ) ) ( not ( = ?auto_564808 ?auto_564812 ) ) ( not ( = ?auto_564808 ?auto_564813 ) ) ( not ( = ?auto_564808 ?auto_564814 ) ) ( not ( = ?auto_564808 ?auto_564815 ) ) ( not ( = ?auto_564808 ?auto_564816 ) ) ( not ( = ?auto_564808 ?auto_564817 ) ) ( not ( = ?auto_564808 ?auto_564818 ) ) ( not ( = ?auto_564808 ?auto_564819 ) ) ( not ( = ?auto_564809 ?auto_564810 ) ) ( not ( = ?auto_564809 ?auto_564811 ) ) ( not ( = ?auto_564809 ?auto_564812 ) ) ( not ( = ?auto_564809 ?auto_564813 ) ) ( not ( = ?auto_564809 ?auto_564814 ) ) ( not ( = ?auto_564809 ?auto_564815 ) ) ( not ( = ?auto_564809 ?auto_564816 ) ) ( not ( = ?auto_564809 ?auto_564817 ) ) ( not ( = ?auto_564809 ?auto_564818 ) ) ( not ( = ?auto_564809 ?auto_564819 ) ) ( not ( = ?auto_564810 ?auto_564811 ) ) ( not ( = ?auto_564810 ?auto_564812 ) ) ( not ( = ?auto_564810 ?auto_564813 ) ) ( not ( = ?auto_564810 ?auto_564814 ) ) ( not ( = ?auto_564810 ?auto_564815 ) ) ( not ( = ?auto_564810 ?auto_564816 ) ) ( not ( = ?auto_564810 ?auto_564817 ) ) ( not ( = ?auto_564810 ?auto_564818 ) ) ( not ( = ?auto_564810 ?auto_564819 ) ) ( not ( = ?auto_564811 ?auto_564812 ) ) ( not ( = ?auto_564811 ?auto_564813 ) ) ( not ( = ?auto_564811 ?auto_564814 ) ) ( not ( = ?auto_564811 ?auto_564815 ) ) ( not ( = ?auto_564811 ?auto_564816 ) ) ( not ( = ?auto_564811 ?auto_564817 ) ) ( not ( = ?auto_564811 ?auto_564818 ) ) ( not ( = ?auto_564811 ?auto_564819 ) ) ( not ( = ?auto_564812 ?auto_564813 ) ) ( not ( = ?auto_564812 ?auto_564814 ) ) ( not ( = ?auto_564812 ?auto_564815 ) ) ( not ( = ?auto_564812 ?auto_564816 ) ) ( not ( = ?auto_564812 ?auto_564817 ) ) ( not ( = ?auto_564812 ?auto_564818 ) ) ( not ( = ?auto_564812 ?auto_564819 ) ) ( not ( = ?auto_564813 ?auto_564814 ) ) ( not ( = ?auto_564813 ?auto_564815 ) ) ( not ( = ?auto_564813 ?auto_564816 ) ) ( not ( = ?auto_564813 ?auto_564817 ) ) ( not ( = ?auto_564813 ?auto_564818 ) ) ( not ( = ?auto_564813 ?auto_564819 ) ) ( not ( = ?auto_564814 ?auto_564815 ) ) ( not ( = ?auto_564814 ?auto_564816 ) ) ( not ( = ?auto_564814 ?auto_564817 ) ) ( not ( = ?auto_564814 ?auto_564818 ) ) ( not ( = ?auto_564814 ?auto_564819 ) ) ( not ( = ?auto_564815 ?auto_564816 ) ) ( not ( = ?auto_564815 ?auto_564817 ) ) ( not ( = ?auto_564815 ?auto_564818 ) ) ( not ( = ?auto_564815 ?auto_564819 ) ) ( not ( = ?auto_564816 ?auto_564817 ) ) ( not ( = ?auto_564816 ?auto_564818 ) ) ( not ( = ?auto_564816 ?auto_564819 ) ) ( not ( = ?auto_564817 ?auto_564818 ) ) ( not ( = ?auto_564817 ?auto_564819 ) ) ( not ( = ?auto_564818 ?auto_564819 ) ) ( ON ?auto_564818 ?auto_564819 ) ( ON ?auto_564817 ?auto_564818 ) ( ON ?auto_564816 ?auto_564817 ) ( ON ?auto_564815 ?auto_564816 ) ( ON ?auto_564814 ?auto_564815 ) ( ON ?auto_564813 ?auto_564814 ) ( ON ?auto_564812 ?auto_564813 ) ( CLEAR ?auto_564810 ) ( ON ?auto_564811 ?auto_564812 ) ( CLEAR ?auto_564811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_564804 ?auto_564805 ?auto_564806 ?auto_564807 ?auto_564808 ?auto_564809 ?auto_564810 ?auto_564811 )
      ( MAKE-16PILE ?auto_564804 ?auto_564805 ?auto_564806 ?auto_564807 ?auto_564808 ?auto_564809 ?auto_564810 ?auto_564811 ?auto_564812 ?auto_564813 ?auto_564814 ?auto_564815 ?auto_564816 ?auto_564817 ?auto_564818 ?auto_564819 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564836 - BLOCK
      ?auto_564837 - BLOCK
      ?auto_564838 - BLOCK
      ?auto_564839 - BLOCK
      ?auto_564840 - BLOCK
      ?auto_564841 - BLOCK
      ?auto_564842 - BLOCK
      ?auto_564843 - BLOCK
      ?auto_564844 - BLOCK
      ?auto_564845 - BLOCK
      ?auto_564846 - BLOCK
      ?auto_564847 - BLOCK
      ?auto_564848 - BLOCK
      ?auto_564849 - BLOCK
      ?auto_564850 - BLOCK
      ?auto_564851 - BLOCK
    )
    :vars
    (
      ?auto_564852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564851 ?auto_564852 ) ( ON-TABLE ?auto_564836 ) ( ON ?auto_564837 ?auto_564836 ) ( ON ?auto_564838 ?auto_564837 ) ( ON ?auto_564839 ?auto_564838 ) ( ON ?auto_564840 ?auto_564839 ) ( ON ?auto_564841 ?auto_564840 ) ( not ( = ?auto_564836 ?auto_564837 ) ) ( not ( = ?auto_564836 ?auto_564838 ) ) ( not ( = ?auto_564836 ?auto_564839 ) ) ( not ( = ?auto_564836 ?auto_564840 ) ) ( not ( = ?auto_564836 ?auto_564841 ) ) ( not ( = ?auto_564836 ?auto_564842 ) ) ( not ( = ?auto_564836 ?auto_564843 ) ) ( not ( = ?auto_564836 ?auto_564844 ) ) ( not ( = ?auto_564836 ?auto_564845 ) ) ( not ( = ?auto_564836 ?auto_564846 ) ) ( not ( = ?auto_564836 ?auto_564847 ) ) ( not ( = ?auto_564836 ?auto_564848 ) ) ( not ( = ?auto_564836 ?auto_564849 ) ) ( not ( = ?auto_564836 ?auto_564850 ) ) ( not ( = ?auto_564836 ?auto_564851 ) ) ( not ( = ?auto_564836 ?auto_564852 ) ) ( not ( = ?auto_564837 ?auto_564838 ) ) ( not ( = ?auto_564837 ?auto_564839 ) ) ( not ( = ?auto_564837 ?auto_564840 ) ) ( not ( = ?auto_564837 ?auto_564841 ) ) ( not ( = ?auto_564837 ?auto_564842 ) ) ( not ( = ?auto_564837 ?auto_564843 ) ) ( not ( = ?auto_564837 ?auto_564844 ) ) ( not ( = ?auto_564837 ?auto_564845 ) ) ( not ( = ?auto_564837 ?auto_564846 ) ) ( not ( = ?auto_564837 ?auto_564847 ) ) ( not ( = ?auto_564837 ?auto_564848 ) ) ( not ( = ?auto_564837 ?auto_564849 ) ) ( not ( = ?auto_564837 ?auto_564850 ) ) ( not ( = ?auto_564837 ?auto_564851 ) ) ( not ( = ?auto_564837 ?auto_564852 ) ) ( not ( = ?auto_564838 ?auto_564839 ) ) ( not ( = ?auto_564838 ?auto_564840 ) ) ( not ( = ?auto_564838 ?auto_564841 ) ) ( not ( = ?auto_564838 ?auto_564842 ) ) ( not ( = ?auto_564838 ?auto_564843 ) ) ( not ( = ?auto_564838 ?auto_564844 ) ) ( not ( = ?auto_564838 ?auto_564845 ) ) ( not ( = ?auto_564838 ?auto_564846 ) ) ( not ( = ?auto_564838 ?auto_564847 ) ) ( not ( = ?auto_564838 ?auto_564848 ) ) ( not ( = ?auto_564838 ?auto_564849 ) ) ( not ( = ?auto_564838 ?auto_564850 ) ) ( not ( = ?auto_564838 ?auto_564851 ) ) ( not ( = ?auto_564838 ?auto_564852 ) ) ( not ( = ?auto_564839 ?auto_564840 ) ) ( not ( = ?auto_564839 ?auto_564841 ) ) ( not ( = ?auto_564839 ?auto_564842 ) ) ( not ( = ?auto_564839 ?auto_564843 ) ) ( not ( = ?auto_564839 ?auto_564844 ) ) ( not ( = ?auto_564839 ?auto_564845 ) ) ( not ( = ?auto_564839 ?auto_564846 ) ) ( not ( = ?auto_564839 ?auto_564847 ) ) ( not ( = ?auto_564839 ?auto_564848 ) ) ( not ( = ?auto_564839 ?auto_564849 ) ) ( not ( = ?auto_564839 ?auto_564850 ) ) ( not ( = ?auto_564839 ?auto_564851 ) ) ( not ( = ?auto_564839 ?auto_564852 ) ) ( not ( = ?auto_564840 ?auto_564841 ) ) ( not ( = ?auto_564840 ?auto_564842 ) ) ( not ( = ?auto_564840 ?auto_564843 ) ) ( not ( = ?auto_564840 ?auto_564844 ) ) ( not ( = ?auto_564840 ?auto_564845 ) ) ( not ( = ?auto_564840 ?auto_564846 ) ) ( not ( = ?auto_564840 ?auto_564847 ) ) ( not ( = ?auto_564840 ?auto_564848 ) ) ( not ( = ?auto_564840 ?auto_564849 ) ) ( not ( = ?auto_564840 ?auto_564850 ) ) ( not ( = ?auto_564840 ?auto_564851 ) ) ( not ( = ?auto_564840 ?auto_564852 ) ) ( not ( = ?auto_564841 ?auto_564842 ) ) ( not ( = ?auto_564841 ?auto_564843 ) ) ( not ( = ?auto_564841 ?auto_564844 ) ) ( not ( = ?auto_564841 ?auto_564845 ) ) ( not ( = ?auto_564841 ?auto_564846 ) ) ( not ( = ?auto_564841 ?auto_564847 ) ) ( not ( = ?auto_564841 ?auto_564848 ) ) ( not ( = ?auto_564841 ?auto_564849 ) ) ( not ( = ?auto_564841 ?auto_564850 ) ) ( not ( = ?auto_564841 ?auto_564851 ) ) ( not ( = ?auto_564841 ?auto_564852 ) ) ( not ( = ?auto_564842 ?auto_564843 ) ) ( not ( = ?auto_564842 ?auto_564844 ) ) ( not ( = ?auto_564842 ?auto_564845 ) ) ( not ( = ?auto_564842 ?auto_564846 ) ) ( not ( = ?auto_564842 ?auto_564847 ) ) ( not ( = ?auto_564842 ?auto_564848 ) ) ( not ( = ?auto_564842 ?auto_564849 ) ) ( not ( = ?auto_564842 ?auto_564850 ) ) ( not ( = ?auto_564842 ?auto_564851 ) ) ( not ( = ?auto_564842 ?auto_564852 ) ) ( not ( = ?auto_564843 ?auto_564844 ) ) ( not ( = ?auto_564843 ?auto_564845 ) ) ( not ( = ?auto_564843 ?auto_564846 ) ) ( not ( = ?auto_564843 ?auto_564847 ) ) ( not ( = ?auto_564843 ?auto_564848 ) ) ( not ( = ?auto_564843 ?auto_564849 ) ) ( not ( = ?auto_564843 ?auto_564850 ) ) ( not ( = ?auto_564843 ?auto_564851 ) ) ( not ( = ?auto_564843 ?auto_564852 ) ) ( not ( = ?auto_564844 ?auto_564845 ) ) ( not ( = ?auto_564844 ?auto_564846 ) ) ( not ( = ?auto_564844 ?auto_564847 ) ) ( not ( = ?auto_564844 ?auto_564848 ) ) ( not ( = ?auto_564844 ?auto_564849 ) ) ( not ( = ?auto_564844 ?auto_564850 ) ) ( not ( = ?auto_564844 ?auto_564851 ) ) ( not ( = ?auto_564844 ?auto_564852 ) ) ( not ( = ?auto_564845 ?auto_564846 ) ) ( not ( = ?auto_564845 ?auto_564847 ) ) ( not ( = ?auto_564845 ?auto_564848 ) ) ( not ( = ?auto_564845 ?auto_564849 ) ) ( not ( = ?auto_564845 ?auto_564850 ) ) ( not ( = ?auto_564845 ?auto_564851 ) ) ( not ( = ?auto_564845 ?auto_564852 ) ) ( not ( = ?auto_564846 ?auto_564847 ) ) ( not ( = ?auto_564846 ?auto_564848 ) ) ( not ( = ?auto_564846 ?auto_564849 ) ) ( not ( = ?auto_564846 ?auto_564850 ) ) ( not ( = ?auto_564846 ?auto_564851 ) ) ( not ( = ?auto_564846 ?auto_564852 ) ) ( not ( = ?auto_564847 ?auto_564848 ) ) ( not ( = ?auto_564847 ?auto_564849 ) ) ( not ( = ?auto_564847 ?auto_564850 ) ) ( not ( = ?auto_564847 ?auto_564851 ) ) ( not ( = ?auto_564847 ?auto_564852 ) ) ( not ( = ?auto_564848 ?auto_564849 ) ) ( not ( = ?auto_564848 ?auto_564850 ) ) ( not ( = ?auto_564848 ?auto_564851 ) ) ( not ( = ?auto_564848 ?auto_564852 ) ) ( not ( = ?auto_564849 ?auto_564850 ) ) ( not ( = ?auto_564849 ?auto_564851 ) ) ( not ( = ?auto_564849 ?auto_564852 ) ) ( not ( = ?auto_564850 ?auto_564851 ) ) ( not ( = ?auto_564850 ?auto_564852 ) ) ( not ( = ?auto_564851 ?auto_564852 ) ) ( ON ?auto_564850 ?auto_564851 ) ( ON ?auto_564849 ?auto_564850 ) ( ON ?auto_564848 ?auto_564849 ) ( ON ?auto_564847 ?auto_564848 ) ( ON ?auto_564846 ?auto_564847 ) ( ON ?auto_564845 ?auto_564846 ) ( ON ?auto_564844 ?auto_564845 ) ( ON ?auto_564843 ?auto_564844 ) ( CLEAR ?auto_564841 ) ( ON ?auto_564842 ?auto_564843 ) ( CLEAR ?auto_564842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_564836 ?auto_564837 ?auto_564838 ?auto_564839 ?auto_564840 ?auto_564841 ?auto_564842 )
      ( MAKE-16PILE ?auto_564836 ?auto_564837 ?auto_564838 ?auto_564839 ?auto_564840 ?auto_564841 ?auto_564842 ?auto_564843 ?auto_564844 ?auto_564845 ?auto_564846 ?auto_564847 ?auto_564848 ?auto_564849 ?auto_564850 ?auto_564851 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564869 - BLOCK
      ?auto_564870 - BLOCK
      ?auto_564871 - BLOCK
      ?auto_564872 - BLOCK
      ?auto_564873 - BLOCK
      ?auto_564874 - BLOCK
      ?auto_564875 - BLOCK
      ?auto_564876 - BLOCK
      ?auto_564877 - BLOCK
      ?auto_564878 - BLOCK
      ?auto_564879 - BLOCK
      ?auto_564880 - BLOCK
      ?auto_564881 - BLOCK
      ?auto_564882 - BLOCK
      ?auto_564883 - BLOCK
      ?auto_564884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564884 ) ( ON-TABLE ?auto_564869 ) ( ON ?auto_564870 ?auto_564869 ) ( ON ?auto_564871 ?auto_564870 ) ( ON ?auto_564872 ?auto_564871 ) ( ON ?auto_564873 ?auto_564872 ) ( ON ?auto_564874 ?auto_564873 ) ( not ( = ?auto_564869 ?auto_564870 ) ) ( not ( = ?auto_564869 ?auto_564871 ) ) ( not ( = ?auto_564869 ?auto_564872 ) ) ( not ( = ?auto_564869 ?auto_564873 ) ) ( not ( = ?auto_564869 ?auto_564874 ) ) ( not ( = ?auto_564869 ?auto_564875 ) ) ( not ( = ?auto_564869 ?auto_564876 ) ) ( not ( = ?auto_564869 ?auto_564877 ) ) ( not ( = ?auto_564869 ?auto_564878 ) ) ( not ( = ?auto_564869 ?auto_564879 ) ) ( not ( = ?auto_564869 ?auto_564880 ) ) ( not ( = ?auto_564869 ?auto_564881 ) ) ( not ( = ?auto_564869 ?auto_564882 ) ) ( not ( = ?auto_564869 ?auto_564883 ) ) ( not ( = ?auto_564869 ?auto_564884 ) ) ( not ( = ?auto_564870 ?auto_564871 ) ) ( not ( = ?auto_564870 ?auto_564872 ) ) ( not ( = ?auto_564870 ?auto_564873 ) ) ( not ( = ?auto_564870 ?auto_564874 ) ) ( not ( = ?auto_564870 ?auto_564875 ) ) ( not ( = ?auto_564870 ?auto_564876 ) ) ( not ( = ?auto_564870 ?auto_564877 ) ) ( not ( = ?auto_564870 ?auto_564878 ) ) ( not ( = ?auto_564870 ?auto_564879 ) ) ( not ( = ?auto_564870 ?auto_564880 ) ) ( not ( = ?auto_564870 ?auto_564881 ) ) ( not ( = ?auto_564870 ?auto_564882 ) ) ( not ( = ?auto_564870 ?auto_564883 ) ) ( not ( = ?auto_564870 ?auto_564884 ) ) ( not ( = ?auto_564871 ?auto_564872 ) ) ( not ( = ?auto_564871 ?auto_564873 ) ) ( not ( = ?auto_564871 ?auto_564874 ) ) ( not ( = ?auto_564871 ?auto_564875 ) ) ( not ( = ?auto_564871 ?auto_564876 ) ) ( not ( = ?auto_564871 ?auto_564877 ) ) ( not ( = ?auto_564871 ?auto_564878 ) ) ( not ( = ?auto_564871 ?auto_564879 ) ) ( not ( = ?auto_564871 ?auto_564880 ) ) ( not ( = ?auto_564871 ?auto_564881 ) ) ( not ( = ?auto_564871 ?auto_564882 ) ) ( not ( = ?auto_564871 ?auto_564883 ) ) ( not ( = ?auto_564871 ?auto_564884 ) ) ( not ( = ?auto_564872 ?auto_564873 ) ) ( not ( = ?auto_564872 ?auto_564874 ) ) ( not ( = ?auto_564872 ?auto_564875 ) ) ( not ( = ?auto_564872 ?auto_564876 ) ) ( not ( = ?auto_564872 ?auto_564877 ) ) ( not ( = ?auto_564872 ?auto_564878 ) ) ( not ( = ?auto_564872 ?auto_564879 ) ) ( not ( = ?auto_564872 ?auto_564880 ) ) ( not ( = ?auto_564872 ?auto_564881 ) ) ( not ( = ?auto_564872 ?auto_564882 ) ) ( not ( = ?auto_564872 ?auto_564883 ) ) ( not ( = ?auto_564872 ?auto_564884 ) ) ( not ( = ?auto_564873 ?auto_564874 ) ) ( not ( = ?auto_564873 ?auto_564875 ) ) ( not ( = ?auto_564873 ?auto_564876 ) ) ( not ( = ?auto_564873 ?auto_564877 ) ) ( not ( = ?auto_564873 ?auto_564878 ) ) ( not ( = ?auto_564873 ?auto_564879 ) ) ( not ( = ?auto_564873 ?auto_564880 ) ) ( not ( = ?auto_564873 ?auto_564881 ) ) ( not ( = ?auto_564873 ?auto_564882 ) ) ( not ( = ?auto_564873 ?auto_564883 ) ) ( not ( = ?auto_564873 ?auto_564884 ) ) ( not ( = ?auto_564874 ?auto_564875 ) ) ( not ( = ?auto_564874 ?auto_564876 ) ) ( not ( = ?auto_564874 ?auto_564877 ) ) ( not ( = ?auto_564874 ?auto_564878 ) ) ( not ( = ?auto_564874 ?auto_564879 ) ) ( not ( = ?auto_564874 ?auto_564880 ) ) ( not ( = ?auto_564874 ?auto_564881 ) ) ( not ( = ?auto_564874 ?auto_564882 ) ) ( not ( = ?auto_564874 ?auto_564883 ) ) ( not ( = ?auto_564874 ?auto_564884 ) ) ( not ( = ?auto_564875 ?auto_564876 ) ) ( not ( = ?auto_564875 ?auto_564877 ) ) ( not ( = ?auto_564875 ?auto_564878 ) ) ( not ( = ?auto_564875 ?auto_564879 ) ) ( not ( = ?auto_564875 ?auto_564880 ) ) ( not ( = ?auto_564875 ?auto_564881 ) ) ( not ( = ?auto_564875 ?auto_564882 ) ) ( not ( = ?auto_564875 ?auto_564883 ) ) ( not ( = ?auto_564875 ?auto_564884 ) ) ( not ( = ?auto_564876 ?auto_564877 ) ) ( not ( = ?auto_564876 ?auto_564878 ) ) ( not ( = ?auto_564876 ?auto_564879 ) ) ( not ( = ?auto_564876 ?auto_564880 ) ) ( not ( = ?auto_564876 ?auto_564881 ) ) ( not ( = ?auto_564876 ?auto_564882 ) ) ( not ( = ?auto_564876 ?auto_564883 ) ) ( not ( = ?auto_564876 ?auto_564884 ) ) ( not ( = ?auto_564877 ?auto_564878 ) ) ( not ( = ?auto_564877 ?auto_564879 ) ) ( not ( = ?auto_564877 ?auto_564880 ) ) ( not ( = ?auto_564877 ?auto_564881 ) ) ( not ( = ?auto_564877 ?auto_564882 ) ) ( not ( = ?auto_564877 ?auto_564883 ) ) ( not ( = ?auto_564877 ?auto_564884 ) ) ( not ( = ?auto_564878 ?auto_564879 ) ) ( not ( = ?auto_564878 ?auto_564880 ) ) ( not ( = ?auto_564878 ?auto_564881 ) ) ( not ( = ?auto_564878 ?auto_564882 ) ) ( not ( = ?auto_564878 ?auto_564883 ) ) ( not ( = ?auto_564878 ?auto_564884 ) ) ( not ( = ?auto_564879 ?auto_564880 ) ) ( not ( = ?auto_564879 ?auto_564881 ) ) ( not ( = ?auto_564879 ?auto_564882 ) ) ( not ( = ?auto_564879 ?auto_564883 ) ) ( not ( = ?auto_564879 ?auto_564884 ) ) ( not ( = ?auto_564880 ?auto_564881 ) ) ( not ( = ?auto_564880 ?auto_564882 ) ) ( not ( = ?auto_564880 ?auto_564883 ) ) ( not ( = ?auto_564880 ?auto_564884 ) ) ( not ( = ?auto_564881 ?auto_564882 ) ) ( not ( = ?auto_564881 ?auto_564883 ) ) ( not ( = ?auto_564881 ?auto_564884 ) ) ( not ( = ?auto_564882 ?auto_564883 ) ) ( not ( = ?auto_564882 ?auto_564884 ) ) ( not ( = ?auto_564883 ?auto_564884 ) ) ( ON ?auto_564883 ?auto_564884 ) ( ON ?auto_564882 ?auto_564883 ) ( ON ?auto_564881 ?auto_564882 ) ( ON ?auto_564880 ?auto_564881 ) ( ON ?auto_564879 ?auto_564880 ) ( ON ?auto_564878 ?auto_564879 ) ( ON ?auto_564877 ?auto_564878 ) ( ON ?auto_564876 ?auto_564877 ) ( CLEAR ?auto_564874 ) ( ON ?auto_564875 ?auto_564876 ) ( CLEAR ?auto_564875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_564869 ?auto_564870 ?auto_564871 ?auto_564872 ?auto_564873 ?auto_564874 ?auto_564875 )
      ( MAKE-16PILE ?auto_564869 ?auto_564870 ?auto_564871 ?auto_564872 ?auto_564873 ?auto_564874 ?auto_564875 ?auto_564876 ?auto_564877 ?auto_564878 ?auto_564879 ?auto_564880 ?auto_564881 ?auto_564882 ?auto_564883 ?auto_564884 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564901 - BLOCK
      ?auto_564902 - BLOCK
      ?auto_564903 - BLOCK
      ?auto_564904 - BLOCK
      ?auto_564905 - BLOCK
      ?auto_564906 - BLOCK
      ?auto_564907 - BLOCK
      ?auto_564908 - BLOCK
      ?auto_564909 - BLOCK
      ?auto_564910 - BLOCK
      ?auto_564911 - BLOCK
      ?auto_564912 - BLOCK
      ?auto_564913 - BLOCK
      ?auto_564914 - BLOCK
      ?auto_564915 - BLOCK
      ?auto_564916 - BLOCK
    )
    :vars
    (
      ?auto_564917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564916 ?auto_564917 ) ( ON-TABLE ?auto_564901 ) ( ON ?auto_564902 ?auto_564901 ) ( ON ?auto_564903 ?auto_564902 ) ( ON ?auto_564904 ?auto_564903 ) ( ON ?auto_564905 ?auto_564904 ) ( not ( = ?auto_564901 ?auto_564902 ) ) ( not ( = ?auto_564901 ?auto_564903 ) ) ( not ( = ?auto_564901 ?auto_564904 ) ) ( not ( = ?auto_564901 ?auto_564905 ) ) ( not ( = ?auto_564901 ?auto_564906 ) ) ( not ( = ?auto_564901 ?auto_564907 ) ) ( not ( = ?auto_564901 ?auto_564908 ) ) ( not ( = ?auto_564901 ?auto_564909 ) ) ( not ( = ?auto_564901 ?auto_564910 ) ) ( not ( = ?auto_564901 ?auto_564911 ) ) ( not ( = ?auto_564901 ?auto_564912 ) ) ( not ( = ?auto_564901 ?auto_564913 ) ) ( not ( = ?auto_564901 ?auto_564914 ) ) ( not ( = ?auto_564901 ?auto_564915 ) ) ( not ( = ?auto_564901 ?auto_564916 ) ) ( not ( = ?auto_564901 ?auto_564917 ) ) ( not ( = ?auto_564902 ?auto_564903 ) ) ( not ( = ?auto_564902 ?auto_564904 ) ) ( not ( = ?auto_564902 ?auto_564905 ) ) ( not ( = ?auto_564902 ?auto_564906 ) ) ( not ( = ?auto_564902 ?auto_564907 ) ) ( not ( = ?auto_564902 ?auto_564908 ) ) ( not ( = ?auto_564902 ?auto_564909 ) ) ( not ( = ?auto_564902 ?auto_564910 ) ) ( not ( = ?auto_564902 ?auto_564911 ) ) ( not ( = ?auto_564902 ?auto_564912 ) ) ( not ( = ?auto_564902 ?auto_564913 ) ) ( not ( = ?auto_564902 ?auto_564914 ) ) ( not ( = ?auto_564902 ?auto_564915 ) ) ( not ( = ?auto_564902 ?auto_564916 ) ) ( not ( = ?auto_564902 ?auto_564917 ) ) ( not ( = ?auto_564903 ?auto_564904 ) ) ( not ( = ?auto_564903 ?auto_564905 ) ) ( not ( = ?auto_564903 ?auto_564906 ) ) ( not ( = ?auto_564903 ?auto_564907 ) ) ( not ( = ?auto_564903 ?auto_564908 ) ) ( not ( = ?auto_564903 ?auto_564909 ) ) ( not ( = ?auto_564903 ?auto_564910 ) ) ( not ( = ?auto_564903 ?auto_564911 ) ) ( not ( = ?auto_564903 ?auto_564912 ) ) ( not ( = ?auto_564903 ?auto_564913 ) ) ( not ( = ?auto_564903 ?auto_564914 ) ) ( not ( = ?auto_564903 ?auto_564915 ) ) ( not ( = ?auto_564903 ?auto_564916 ) ) ( not ( = ?auto_564903 ?auto_564917 ) ) ( not ( = ?auto_564904 ?auto_564905 ) ) ( not ( = ?auto_564904 ?auto_564906 ) ) ( not ( = ?auto_564904 ?auto_564907 ) ) ( not ( = ?auto_564904 ?auto_564908 ) ) ( not ( = ?auto_564904 ?auto_564909 ) ) ( not ( = ?auto_564904 ?auto_564910 ) ) ( not ( = ?auto_564904 ?auto_564911 ) ) ( not ( = ?auto_564904 ?auto_564912 ) ) ( not ( = ?auto_564904 ?auto_564913 ) ) ( not ( = ?auto_564904 ?auto_564914 ) ) ( not ( = ?auto_564904 ?auto_564915 ) ) ( not ( = ?auto_564904 ?auto_564916 ) ) ( not ( = ?auto_564904 ?auto_564917 ) ) ( not ( = ?auto_564905 ?auto_564906 ) ) ( not ( = ?auto_564905 ?auto_564907 ) ) ( not ( = ?auto_564905 ?auto_564908 ) ) ( not ( = ?auto_564905 ?auto_564909 ) ) ( not ( = ?auto_564905 ?auto_564910 ) ) ( not ( = ?auto_564905 ?auto_564911 ) ) ( not ( = ?auto_564905 ?auto_564912 ) ) ( not ( = ?auto_564905 ?auto_564913 ) ) ( not ( = ?auto_564905 ?auto_564914 ) ) ( not ( = ?auto_564905 ?auto_564915 ) ) ( not ( = ?auto_564905 ?auto_564916 ) ) ( not ( = ?auto_564905 ?auto_564917 ) ) ( not ( = ?auto_564906 ?auto_564907 ) ) ( not ( = ?auto_564906 ?auto_564908 ) ) ( not ( = ?auto_564906 ?auto_564909 ) ) ( not ( = ?auto_564906 ?auto_564910 ) ) ( not ( = ?auto_564906 ?auto_564911 ) ) ( not ( = ?auto_564906 ?auto_564912 ) ) ( not ( = ?auto_564906 ?auto_564913 ) ) ( not ( = ?auto_564906 ?auto_564914 ) ) ( not ( = ?auto_564906 ?auto_564915 ) ) ( not ( = ?auto_564906 ?auto_564916 ) ) ( not ( = ?auto_564906 ?auto_564917 ) ) ( not ( = ?auto_564907 ?auto_564908 ) ) ( not ( = ?auto_564907 ?auto_564909 ) ) ( not ( = ?auto_564907 ?auto_564910 ) ) ( not ( = ?auto_564907 ?auto_564911 ) ) ( not ( = ?auto_564907 ?auto_564912 ) ) ( not ( = ?auto_564907 ?auto_564913 ) ) ( not ( = ?auto_564907 ?auto_564914 ) ) ( not ( = ?auto_564907 ?auto_564915 ) ) ( not ( = ?auto_564907 ?auto_564916 ) ) ( not ( = ?auto_564907 ?auto_564917 ) ) ( not ( = ?auto_564908 ?auto_564909 ) ) ( not ( = ?auto_564908 ?auto_564910 ) ) ( not ( = ?auto_564908 ?auto_564911 ) ) ( not ( = ?auto_564908 ?auto_564912 ) ) ( not ( = ?auto_564908 ?auto_564913 ) ) ( not ( = ?auto_564908 ?auto_564914 ) ) ( not ( = ?auto_564908 ?auto_564915 ) ) ( not ( = ?auto_564908 ?auto_564916 ) ) ( not ( = ?auto_564908 ?auto_564917 ) ) ( not ( = ?auto_564909 ?auto_564910 ) ) ( not ( = ?auto_564909 ?auto_564911 ) ) ( not ( = ?auto_564909 ?auto_564912 ) ) ( not ( = ?auto_564909 ?auto_564913 ) ) ( not ( = ?auto_564909 ?auto_564914 ) ) ( not ( = ?auto_564909 ?auto_564915 ) ) ( not ( = ?auto_564909 ?auto_564916 ) ) ( not ( = ?auto_564909 ?auto_564917 ) ) ( not ( = ?auto_564910 ?auto_564911 ) ) ( not ( = ?auto_564910 ?auto_564912 ) ) ( not ( = ?auto_564910 ?auto_564913 ) ) ( not ( = ?auto_564910 ?auto_564914 ) ) ( not ( = ?auto_564910 ?auto_564915 ) ) ( not ( = ?auto_564910 ?auto_564916 ) ) ( not ( = ?auto_564910 ?auto_564917 ) ) ( not ( = ?auto_564911 ?auto_564912 ) ) ( not ( = ?auto_564911 ?auto_564913 ) ) ( not ( = ?auto_564911 ?auto_564914 ) ) ( not ( = ?auto_564911 ?auto_564915 ) ) ( not ( = ?auto_564911 ?auto_564916 ) ) ( not ( = ?auto_564911 ?auto_564917 ) ) ( not ( = ?auto_564912 ?auto_564913 ) ) ( not ( = ?auto_564912 ?auto_564914 ) ) ( not ( = ?auto_564912 ?auto_564915 ) ) ( not ( = ?auto_564912 ?auto_564916 ) ) ( not ( = ?auto_564912 ?auto_564917 ) ) ( not ( = ?auto_564913 ?auto_564914 ) ) ( not ( = ?auto_564913 ?auto_564915 ) ) ( not ( = ?auto_564913 ?auto_564916 ) ) ( not ( = ?auto_564913 ?auto_564917 ) ) ( not ( = ?auto_564914 ?auto_564915 ) ) ( not ( = ?auto_564914 ?auto_564916 ) ) ( not ( = ?auto_564914 ?auto_564917 ) ) ( not ( = ?auto_564915 ?auto_564916 ) ) ( not ( = ?auto_564915 ?auto_564917 ) ) ( not ( = ?auto_564916 ?auto_564917 ) ) ( ON ?auto_564915 ?auto_564916 ) ( ON ?auto_564914 ?auto_564915 ) ( ON ?auto_564913 ?auto_564914 ) ( ON ?auto_564912 ?auto_564913 ) ( ON ?auto_564911 ?auto_564912 ) ( ON ?auto_564910 ?auto_564911 ) ( ON ?auto_564909 ?auto_564910 ) ( ON ?auto_564908 ?auto_564909 ) ( ON ?auto_564907 ?auto_564908 ) ( CLEAR ?auto_564905 ) ( ON ?auto_564906 ?auto_564907 ) ( CLEAR ?auto_564906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_564901 ?auto_564902 ?auto_564903 ?auto_564904 ?auto_564905 ?auto_564906 )
      ( MAKE-16PILE ?auto_564901 ?auto_564902 ?auto_564903 ?auto_564904 ?auto_564905 ?auto_564906 ?auto_564907 ?auto_564908 ?auto_564909 ?auto_564910 ?auto_564911 ?auto_564912 ?auto_564913 ?auto_564914 ?auto_564915 ?auto_564916 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564934 - BLOCK
      ?auto_564935 - BLOCK
      ?auto_564936 - BLOCK
      ?auto_564937 - BLOCK
      ?auto_564938 - BLOCK
      ?auto_564939 - BLOCK
      ?auto_564940 - BLOCK
      ?auto_564941 - BLOCK
      ?auto_564942 - BLOCK
      ?auto_564943 - BLOCK
      ?auto_564944 - BLOCK
      ?auto_564945 - BLOCK
      ?auto_564946 - BLOCK
      ?auto_564947 - BLOCK
      ?auto_564948 - BLOCK
      ?auto_564949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_564949 ) ( ON-TABLE ?auto_564934 ) ( ON ?auto_564935 ?auto_564934 ) ( ON ?auto_564936 ?auto_564935 ) ( ON ?auto_564937 ?auto_564936 ) ( ON ?auto_564938 ?auto_564937 ) ( not ( = ?auto_564934 ?auto_564935 ) ) ( not ( = ?auto_564934 ?auto_564936 ) ) ( not ( = ?auto_564934 ?auto_564937 ) ) ( not ( = ?auto_564934 ?auto_564938 ) ) ( not ( = ?auto_564934 ?auto_564939 ) ) ( not ( = ?auto_564934 ?auto_564940 ) ) ( not ( = ?auto_564934 ?auto_564941 ) ) ( not ( = ?auto_564934 ?auto_564942 ) ) ( not ( = ?auto_564934 ?auto_564943 ) ) ( not ( = ?auto_564934 ?auto_564944 ) ) ( not ( = ?auto_564934 ?auto_564945 ) ) ( not ( = ?auto_564934 ?auto_564946 ) ) ( not ( = ?auto_564934 ?auto_564947 ) ) ( not ( = ?auto_564934 ?auto_564948 ) ) ( not ( = ?auto_564934 ?auto_564949 ) ) ( not ( = ?auto_564935 ?auto_564936 ) ) ( not ( = ?auto_564935 ?auto_564937 ) ) ( not ( = ?auto_564935 ?auto_564938 ) ) ( not ( = ?auto_564935 ?auto_564939 ) ) ( not ( = ?auto_564935 ?auto_564940 ) ) ( not ( = ?auto_564935 ?auto_564941 ) ) ( not ( = ?auto_564935 ?auto_564942 ) ) ( not ( = ?auto_564935 ?auto_564943 ) ) ( not ( = ?auto_564935 ?auto_564944 ) ) ( not ( = ?auto_564935 ?auto_564945 ) ) ( not ( = ?auto_564935 ?auto_564946 ) ) ( not ( = ?auto_564935 ?auto_564947 ) ) ( not ( = ?auto_564935 ?auto_564948 ) ) ( not ( = ?auto_564935 ?auto_564949 ) ) ( not ( = ?auto_564936 ?auto_564937 ) ) ( not ( = ?auto_564936 ?auto_564938 ) ) ( not ( = ?auto_564936 ?auto_564939 ) ) ( not ( = ?auto_564936 ?auto_564940 ) ) ( not ( = ?auto_564936 ?auto_564941 ) ) ( not ( = ?auto_564936 ?auto_564942 ) ) ( not ( = ?auto_564936 ?auto_564943 ) ) ( not ( = ?auto_564936 ?auto_564944 ) ) ( not ( = ?auto_564936 ?auto_564945 ) ) ( not ( = ?auto_564936 ?auto_564946 ) ) ( not ( = ?auto_564936 ?auto_564947 ) ) ( not ( = ?auto_564936 ?auto_564948 ) ) ( not ( = ?auto_564936 ?auto_564949 ) ) ( not ( = ?auto_564937 ?auto_564938 ) ) ( not ( = ?auto_564937 ?auto_564939 ) ) ( not ( = ?auto_564937 ?auto_564940 ) ) ( not ( = ?auto_564937 ?auto_564941 ) ) ( not ( = ?auto_564937 ?auto_564942 ) ) ( not ( = ?auto_564937 ?auto_564943 ) ) ( not ( = ?auto_564937 ?auto_564944 ) ) ( not ( = ?auto_564937 ?auto_564945 ) ) ( not ( = ?auto_564937 ?auto_564946 ) ) ( not ( = ?auto_564937 ?auto_564947 ) ) ( not ( = ?auto_564937 ?auto_564948 ) ) ( not ( = ?auto_564937 ?auto_564949 ) ) ( not ( = ?auto_564938 ?auto_564939 ) ) ( not ( = ?auto_564938 ?auto_564940 ) ) ( not ( = ?auto_564938 ?auto_564941 ) ) ( not ( = ?auto_564938 ?auto_564942 ) ) ( not ( = ?auto_564938 ?auto_564943 ) ) ( not ( = ?auto_564938 ?auto_564944 ) ) ( not ( = ?auto_564938 ?auto_564945 ) ) ( not ( = ?auto_564938 ?auto_564946 ) ) ( not ( = ?auto_564938 ?auto_564947 ) ) ( not ( = ?auto_564938 ?auto_564948 ) ) ( not ( = ?auto_564938 ?auto_564949 ) ) ( not ( = ?auto_564939 ?auto_564940 ) ) ( not ( = ?auto_564939 ?auto_564941 ) ) ( not ( = ?auto_564939 ?auto_564942 ) ) ( not ( = ?auto_564939 ?auto_564943 ) ) ( not ( = ?auto_564939 ?auto_564944 ) ) ( not ( = ?auto_564939 ?auto_564945 ) ) ( not ( = ?auto_564939 ?auto_564946 ) ) ( not ( = ?auto_564939 ?auto_564947 ) ) ( not ( = ?auto_564939 ?auto_564948 ) ) ( not ( = ?auto_564939 ?auto_564949 ) ) ( not ( = ?auto_564940 ?auto_564941 ) ) ( not ( = ?auto_564940 ?auto_564942 ) ) ( not ( = ?auto_564940 ?auto_564943 ) ) ( not ( = ?auto_564940 ?auto_564944 ) ) ( not ( = ?auto_564940 ?auto_564945 ) ) ( not ( = ?auto_564940 ?auto_564946 ) ) ( not ( = ?auto_564940 ?auto_564947 ) ) ( not ( = ?auto_564940 ?auto_564948 ) ) ( not ( = ?auto_564940 ?auto_564949 ) ) ( not ( = ?auto_564941 ?auto_564942 ) ) ( not ( = ?auto_564941 ?auto_564943 ) ) ( not ( = ?auto_564941 ?auto_564944 ) ) ( not ( = ?auto_564941 ?auto_564945 ) ) ( not ( = ?auto_564941 ?auto_564946 ) ) ( not ( = ?auto_564941 ?auto_564947 ) ) ( not ( = ?auto_564941 ?auto_564948 ) ) ( not ( = ?auto_564941 ?auto_564949 ) ) ( not ( = ?auto_564942 ?auto_564943 ) ) ( not ( = ?auto_564942 ?auto_564944 ) ) ( not ( = ?auto_564942 ?auto_564945 ) ) ( not ( = ?auto_564942 ?auto_564946 ) ) ( not ( = ?auto_564942 ?auto_564947 ) ) ( not ( = ?auto_564942 ?auto_564948 ) ) ( not ( = ?auto_564942 ?auto_564949 ) ) ( not ( = ?auto_564943 ?auto_564944 ) ) ( not ( = ?auto_564943 ?auto_564945 ) ) ( not ( = ?auto_564943 ?auto_564946 ) ) ( not ( = ?auto_564943 ?auto_564947 ) ) ( not ( = ?auto_564943 ?auto_564948 ) ) ( not ( = ?auto_564943 ?auto_564949 ) ) ( not ( = ?auto_564944 ?auto_564945 ) ) ( not ( = ?auto_564944 ?auto_564946 ) ) ( not ( = ?auto_564944 ?auto_564947 ) ) ( not ( = ?auto_564944 ?auto_564948 ) ) ( not ( = ?auto_564944 ?auto_564949 ) ) ( not ( = ?auto_564945 ?auto_564946 ) ) ( not ( = ?auto_564945 ?auto_564947 ) ) ( not ( = ?auto_564945 ?auto_564948 ) ) ( not ( = ?auto_564945 ?auto_564949 ) ) ( not ( = ?auto_564946 ?auto_564947 ) ) ( not ( = ?auto_564946 ?auto_564948 ) ) ( not ( = ?auto_564946 ?auto_564949 ) ) ( not ( = ?auto_564947 ?auto_564948 ) ) ( not ( = ?auto_564947 ?auto_564949 ) ) ( not ( = ?auto_564948 ?auto_564949 ) ) ( ON ?auto_564948 ?auto_564949 ) ( ON ?auto_564947 ?auto_564948 ) ( ON ?auto_564946 ?auto_564947 ) ( ON ?auto_564945 ?auto_564946 ) ( ON ?auto_564944 ?auto_564945 ) ( ON ?auto_564943 ?auto_564944 ) ( ON ?auto_564942 ?auto_564943 ) ( ON ?auto_564941 ?auto_564942 ) ( ON ?auto_564940 ?auto_564941 ) ( CLEAR ?auto_564938 ) ( ON ?auto_564939 ?auto_564940 ) ( CLEAR ?auto_564939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_564934 ?auto_564935 ?auto_564936 ?auto_564937 ?auto_564938 ?auto_564939 )
      ( MAKE-16PILE ?auto_564934 ?auto_564935 ?auto_564936 ?auto_564937 ?auto_564938 ?auto_564939 ?auto_564940 ?auto_564941 ?auto_564942 ?auto_564943 ?auto_564944 ?auto_564945 ?auto_564946 ?auto_564947 ?auto_564948 ?auto_564949 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564966 - BLOCK
      ?auto_564967 - BLOCK
      ?auto_564968 - BLOCK
      ?auto_564969 - BLOCK
      ?auto_564970 - BLOCK
      ?auto_564971 - BLOCK
      ?auto_564972 - BLOCK
      ?auto_564973 - BLOCK
      ?auto_564974 - BLOCK
      ?auto_564975 - BLOCK
      ?auto_564976 - BLOCK
      ?auto_564977 - BLOCK
      ?auto_564978 - BLOCK
      ?auto_564979 - BLOCK
      ?auto_564980 - BLOCK
      ?auto_564981 - BLOCK
    )
    :vars
    (
      ?auto_564982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_564981 ?auto_564982 ) ( ON-TABLE ?auto_564966 ) ( ON ?auto_564967 ?auto_564966 ) ( ON ?auto_564968 ?auto_564967 ) ( ON ?auto_564969 ?auto_564968 ) ( not ( = ?auto_564966 ?auto_564967 ) ) ( not ( = ?auto_564966 ?auto_564968 ) ) ( not ( = ?auto_564966 ?auto_564969 ) ) ( not ( = ?auto_564966 ?auto_564970 ) ) ( not ( = ?auto_564966 ?auto_564971 ) ) ( not ( = ?auto_564966 ?auto_564972 ) ) ( not ( = ?auto_564966 ?auto_564973 ) ) ( not ( = ?auto_564966 ?auto_564974 ) ) ( not ( = ?auto_564966 ?auto_564975 ) ) ( not ( = ?auto_564966 ?auto_564976 ) ) ( not ( = ?auto_564966 ?auto_564977 ) ) ( not ( = ?auto_564966 ?auto_564978 ) ) ( not ( = ?auto_564966 ?auto_564979 ) ) ( not ( = ?auto_564966 ?auto_564980 ) ) ( not ( = ?auto_564966 ?auto_564981 ) ) ( not ( = ?auto_564966 ?auto_564982 ) ) ( not ( = ?auto_564967 ?auto_564968 ) ) ( not ( = ?auto_564967 ?auto_564969 ) ) ( not ( = ?auto_564967 ?auto_564970 ) ) ( not ( = ?auto_564967 ?auto_564971 ) ) ( not ( = ?auto_564967 ?auto_564972 ) ) ( not ( = ?auto_564967 ?auto_564973 ) ) ( not ( = ?auto_564967 ?auto_564974 ) ) ( not ( = ?auto_564967 ?auto_564975 ) ) ( not ( = ?auto_564967 ?auto_564976 ) ) ( not ( = ?auto_564967 ?auto_564977 ) ) ( not ( = ?auto_564967 ?auto_564978 ) ) ( not ( = ?auto_564967 ?auto_564979 ) ) ( not ( = ?auto_564967 ?auto_564980 ) ) ( not ( = ?auto_564967 ?auto_564981 ) ) ( not ( = ?auto_564967 ?auto_564982 ) ) ( not ( = ?auto_564968 ?auto_564969 ) ) ( not ( = ?auto_564968 ?auto_564970 ) ) ( not ( = ?auto_564968 ?auto_564971 ) ) ( not ( = ?auto_564968 ?auto_564972 ) ) ( not ( = ?auto_564968 ?auto_564973 ) ) ( not ( = ?auto_564968 ?auto_564974 ) ) ( not ( = ?auto_564968 ?auto_564975 ) ) ( not ( = ?auto_564968 ?auto_564976 ) ) ( not ( = ?auto_564968 ?auto_564977 ) ) ( not ( = ?auto_564968 ?auto_564978 ) ) ( not ( = ?auto_564968 ?auto_564979 ) ) ( not ( = ?auto_564968 ?auto_564980 ) ) ( not ( = ?auto_564968 ?auto_564981 ) ) ( not ( = ?auto_564968 ?auto_564982 ) ) ( not ( = ?auto_564969 ?auto_564970 ) ) ( not ( = ?auto_564969 ?auto_564971 ) ) ( not ( = ?auto_564969 ?auto_564972 ) ) ( not ( = ?auto_564969 ?auto_564973 ) ) ( not ( = ?auto_564969 ?auto_564974 ) ) ( not ( = ?auto_564969 ?auto_564975 ) ) ( not ( = ?auto_564969 ?auto_564976 ) ) ( not ( = ?auto_564969 ?auto_564977 ) ) ( not ( = ?auto_564969 ?auto_564978 ) ) ( not ( = ?auto_564969 ?auto_564979 ) ) ( not ( = ?auto_564969 ?auto_564980 ) ) ( not ( = ?auto_564969 ?auto_564981 ) ) ( not ( = ?auto_564969 ?auto_564982 ) ) ( not ( = ?auto_564970 ?auto_564971 ) ) ( not ( = ?auto_564970 ?auto_564972 ) ) ( not ( = ?auto_564970 ?auto_564973 ) ) ( not ( = ?auto_564970 ?auto_564974 ) ) ( not ( = ?auto_564970 ?auto_564975 ) ) ( not ( = ?auto_564970 ?auto_564976 ) ) ( not ( = ?auto_564970 ?auto_564977 ) ) ( not ( = ?auto_564970 ?auto_564978 ) ) ( not ( = ?auto_564970 ?auto_564979 ) ) ( not ( = ?auto_564970 ?auto_564980 ) ) ( not ( = ?auto_564970 ?auto_564981 ) ) ( not ( = ?auto_564970 ?auto_564982 ) ) ( not ( = ?auto_564971 ?auto_564972 ) ) ( not ( = ?auto_564971 ?auto_564973 ) ) ( not ( = ?auto_564971 ?auto_564974 ) ) ( not ( = ?auto_564971 ?auto_564975 ) ) ( not ( = ?auto_564971 ?auto_564976 ) ) ( not ( = ?auto_564971 ?auto_564977 ) ) ( not ( = ?auto_564971 ?auto_564978 ) ) ( not ( = ?auto_564971 ?auto_564979 ) ) ( not ( = ?auto_564971 ?auto_564980 ) ) ( not ( = ?auto_564971 ?auto_564981 ) ) ( not ( = ?auto_564971 ?auto_564982 ) ) ( not ( = ?auto_564972 ?auto_564973 ) ) ( not ( = ?auto_564972 ?auto_564974 ) ) ( not ( = ?auto_564972 ?auto_564975 ) ) ( not ( = ?auto_564972 ?auto_564976 ) ) ( not ( = ?auto_564972 ?auto_564977 ) ) ( not ( = ?auto_564972 ?auto_564978 ) ) ( not ( = ?auto_564972 ?auto_564979 ) ) ( not ( = ?auto_564972 ?auto_564980 ) ) ( not ( = ?auto_564972 ?auto_564981 ) ) ( not ( = ?auto_564972 ?auto_564982 ) ) ( not ( = ?auto_564973 ?auto_564974 ) ) ( not ( = ?auto_564973 ?auto_564975 ) ) ( not ( = ?auto_564973 ?auto_564976 ) ) ( not ( = ?auto_564973 ?auto_564977 ) ) ( not ( = ?auto_564973 ?auto_564978 ) ) ( not ( = ?auto_564973 ?auto_564979 ) ) ( not ( = ?auto_564973 ?auto_564980 ) ) ( not ( = ?auto_564973 ?auto_564981 ) ) ( not ( = ?auto_564973 ?auto_564982 ) ) ( not ( = ?auto_564974 ?auto_564975 ) ) ( not ( = ?auto_564974 ?auto_564976 ) ) ( not ( = ?auto_564974 ?auto_564977 ) ) ( not ( = ?auto_564974 ?auto_564978 ) ) ( not ( = ?auto_564974 ?auto_564979 ) ) ( not ( = ?auto_564974 ?auto_564980 ) ) ( not ( = ?auto_564974 ?auto_564981 ) ) ( not ( = ?auto_564974 ?auto_564982 ) ) ( not ( = ?auto_564975 ?auto_564976 ) ) ( not ( = ?auto_564975 ?auto_564977 ) ) ( not ( = ?auto_564975 ?auto_564978 ) ) ( not ( = ?auto_564975 ?auto_564979 ) ) ( not ( = ?auto_564975 ?auto_564980 ) ) ( not ( = ?auto_564975 ?auto_564981 ) ) ( not ( = ?auto_564975 ?auto_564982 ) ) ( not ( = ?auto_564976 ?auto_564977 ) ) ( not ( = ?auto_564976 ?auto_564978 ) ) ( not ( = ?auto_564976 ?auto_564979 ) ) ( not ( = ?auto_564976 ?auto_564980 ) ) ( not ( = ?auto_564976 ?auto_564981 ) ) ( not ( = ?auto_564976 ?auto_564982 ) ) ( not ( = ?auto_564977 ?auto_564978 ) ) ( not ( = ?auto_564977 ?auto_564979 ) ) ( not ( = ?auto_564977 ?auto_564980 ) ) ( not ( = ?auto_564977 ?auto_564981 ) ) ( not ( = ?auto_564977 ?auto_564982 ) ) ( not ( = ?auto_564978 ?auto_564979 ) ) ( not ( = ?auto_564978 ?auto_564980 ) ) ( not ( = ?auto_564978 ?auto_564981 ) ) ( not ( = ?auto_564978 ?auto_564982 ) ) ( not ( = ?auto_564979 ?auto_564980 ) ) ( not ( = ?auto_564979 ?auto_564981 ) ) ( not ( = ?auto_564979 ?auto_564982 ) ) ( not ( = ?auto_564980 ?auto_564981 ) ) ( not ( = ?auto_564980 ?auto_564982 ) ) ( not ( = ?auto_564981 ?auto_564982 ) ) ( ON ?auto_564980 ?auto_564981 ) ( ON ?auto_564979 ?auto_564980 ) ( ON ?auto_564978 ?auto_564979 ) ( ON ?auto_564977 ?auto_564978 ) ( ON ?auto_564976 ?auto_564977 ) ( ON ?auto_564975 ?auto_564976 ) ( ON ?auto_564974 ?auto_564975 ) ( ON ?auto_564973 ?auto_564974 ) ( ON ?auto_564972 ?auto_564973 ) ( ON ?auto_564971 ?auto_564972 ) ( CLEAR ?auto_564969 ) ( ON ?auto_564970 ?auto_564971 ) ( CLEAR ?auto_564970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_564966 ?auto_564967 ?auto_564968 ?auto_564969 ?auto_564970 )
      ( MAKE-16PILE ?auto_564966 ?auto_564967 ?auto_564968 ?auto_564969 ?auto_564970 ?auto_564971 ?auto_564972 ?auto_564973 ?auto_564974 ?auto_564975 ?auto_564976 ?auto_564977 ?auto_564978 ?auto_564979 ?auto_564980 ?auto_564981 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_564999 - BLOCK
      ?auto_565000 - BLOCK
      ?auto_565001 - BLOCK
      ?auto_565002 - BLOCK
      ?auto_565003 - BLOCK
      ?auto_565004 - BLOCK
      ?auto_565005 - BLOCK
      ?auto_565006 - BLOCK
      ?auto_565007 - BLOCK
      ?auto_565008 - BLOCK
      ?auto_565009 - BLOCK
      ?auto_565010 - BLOCK
      ?auto_565011 - BLOCK
      ?auto_565012 - BLOCK
      ?auto_565013 - BLOCK
      ?auto_565014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_565014 ) ( ON-TABLE ?auto_564999 ) ( ON ?auto_565000 ?auto_564999 ) ( ON ?auto_565001 ?auto_565000 ) ( ON ?auto_565002 ?auto_565001 ) ( not ( = ?auto_564999 ?auto_565000 ) ) ( not ( = ?auto_564999 ?auto_565001 ) ) ( not ( = ?auto_564999 ?auto_565002 ) ) ( not ( = ?auto_564999 ?auto_565003 ) ) ( not ( = ?auto_564999 ?auto_565004 ) ) ( not ( = ?auto_564999 ?auto_565005 ) ) ( not ( = ?auto_564999 ?auto_565006 ) ) ( not ( = ?auto_564999 ?auto_565007 ) ) ( not ( = ?auto_564999 ?auto_565008 ) ) ( not ( = ?auto_564999 ?auto_565009 ) ) ( not ( = ?auto_564999 ?auto_565010 ) ) ( not ( = ?auto_564999 ?auto_565011 ) ) ( not ( = ?auto_564999 ?auto_565012 ) ) ( not ( = ?auto_564999 ?auto_565013 ) ) ( not ( = ?auto_564999 ?auto_565014 ) ) ( not ( = ?auto_565000 ?auto_565001 ) ) ( not ( = ?auto_565000 ?auto_565002 ) ) ( not ( = ?auto_565000 ?auto_565003 ) ) ( not ( = ?auto_565000 ?auto_565004 ) ) ( not ( = ?auto_565000 ?auto_565005 ) ) ( not ( = ?auto_565000 ?auto_565006 ) ) ( not ( = ?auto_565000 ?auto_565007 ) ) ( not ( = ?auto_565000 ?auto_565008 ) ) ( not ( = ?auto_565000 ?auto_565009 ) ) ( not ( = ?auto_565000 ?auto_565010 ) ) ( not ( = ?auto_565000 ?auto_565011 ) ) ( not ( = ?auto_565000 ?auto_565012 ) ) ( not ( = ?auto_565000 ?auto_565013 ) ) ( not ( = ?auto_565000 ?auto_565014 ) ) ( not ( = ?auto_565001 ?auto_565002 ) ) ( not ( = ?auto_565001 ?auto_565003 ) ) ( not ( = ?auto_565001 ?auto_565004 ) ) ( not ( = ?auto_565001 ?auto_565005 ) ) ( not ( = ?auto_565001 ?auto_565006 ) ) ( not ( = ?auto_565001 ?auto_565007 ) ) ( not ( = ?auto_565001 ?auto_565008 ) ) ( not ( = ?auto_565001 ?auto_565009 ) ) ( not ( = ?auto_565001 ?auto_565010 ) ) ( not ( = ?auto_565001 ?auto_565011 ) ) ( not ( = ?auto_565001 ?auto_565012 ) ) ( not ( = ?auto_565001 ?auto_565013 ) ) ( not ( = ?auto_565001 ?auto_565014 ) ) ( not ( = ?auto_565002 ?auto_565003 ) ) ( not ( = ?auto_565002 ?auto_565004 ) ) ( not ( = ?auto_565002 ?auto_565005 ) ) ( not ( = ?auto_565002 ?auto_565006 ) ) ( not ( = ?auto_565002 ?auto_565007 ) ) ( not ( = ?auto_565002 ?auto_565008 ) ) ( not ( = ?auto_565002 ?auto_565009 ) ) ( not ( = ?auto_565002 ?auto_565010 ) ) ( not ( = ?auto_565002 ?auto_565011 ) ) ( not ( = ?auto_565002 ?auto_565012 ) ) ( not ( = ?auto_565002 ?auto_565013 ) ) ( not ( = ?auto_565002 ?auto_565014 ) ) ( not ( = ?auto_565003 ?auto_565004 ) ) ( not ( = ?auto_565003 ?auto_565005 ) ) ( not ( = ?auto_565003 ?auto_565006 ) ) ( not ( = ?auto_565003 ?auto_565007 ) ) ( not ( = ?auto_565003 ?auto_565008 ) ) ( not ( = ?auto_565003 ?auto_565009 ) ) ( not ( = ?auto_565003 ?auto_565010 ) ) ( not ( = ?auto_565003 ?auto_565011 ) ) ( not ( = ?auto_565003 ?auto_565012 ) ) ( not ( = ?auto_565003 ?auto_565013 ) ) ( not ( = ?auto_565003 ?auto_565014 ) ) ( not ( = ?auto_565004 ?auto_565005 ) ) ( not ( = ?auto_565004 ?auto_565006 ) ) ( not ( = ?auto_565004 ?auto_565007 ) ) ( not ( = ?auto_565004 ?auto_565008 ) ) ( not ( = ?auto_565004 ?auto_565009 ) ) ( not ( = ?auto_565004 ?auto_565010 ) ) ( not ( = ?auto_565004 ?auto_565011 ) ) ( not ( = ?auto_565004 ?auto_565012 ) ) ( not ( = ?auto_565004 ?auto_565013 ) ) ( not ( = ?auto_565004 ?auto_565014 ) ) ( not ( = ?auto_565005 ?auto_565006 ) ) ( not ( = ?auto_565005 ?auto_565007 ) ) ( not ( = ?auto_565005 ?auto_565008 ) ) ( not ( = ?auto_565005 ?auto_565009 ) ) ( not ( = ?auto_565005 ?auto_565010 ) ) ( not ( = ?auto_565005 ?auto_565011 ) ) ( not ( = ?auto_565005 ?auto_565012 ) ) ( not ( = ?auto_565005 ?auto_565013 ) ) ( not ( = ?auto_565005 ?auto_565014 ) ) ( not ( = ?auto_565006 ?auto_565007 ) ) ( not ( = ?auto_565006 ?auto_565008 ) ) ( not ( = ?auto_565006 ?auto_565009 ) ) ( not ( = ?auto_565006 ?auto_565010 ) ) ( not ( = ?auto_565006 ?auto_565011 ) ) ( not ( = ?auto_565006 ?auto_565012 ) ) ( not ( = ?auto_565006 ?auto_565013 ) ) ( not ( = ?auto_565006 ?auto_565014 ) ) ( not ( = ?auto_565007 ?auto_565008 ) ) ( not ( = ?auto_565007 ?auto_565009 ) ) ( not ( = ?auto_565007 ?auto_565010 ) ) ( not ( = ?auto_565007 ?auto_565011 ) ) ( not ( = ?auto_565007 ?auto_565012 ) ) ( not ( = ?auto_565007 ?auto_565013 ) ) ( not ( = ?auto_565007 ?auto_565014 ) ) ( not ( = ?auto_565008 ?auto_565009 ) ) ( not ( = ?auto_565008 ?auto_565010 ) ) ( not ( = ?auto_565008 ?auto_565011 ) ) ( not ( = ?auto_565008 ?auto_565012 ) ) ( not ( = ?auto_565008 ?auto_565013 ) ) ( not ( = ?auto_565008 ?auto_565014 ) ) ( not ( = ?auto_565009 ?auto_565010 ) ) ( not ( = ?auto_565009 ?auto_565011 ) ) ( not ( = ?auto_565009 ?auto_565012 ) ) ( not ( = ?auto_565009 ?auto_565013 ) ) ( not ( = ?auto_565009 ?auto_565014 ) ) ( not ( = ?auto_565010 ?auto_565011 ) ) ( not ( = ?auto_565010 ?auto_565012 ) ) ( not ( = ?auto_565010 ?auto_565013 ) ) ( not ( = ?auto_565010 ?auto_565014 ) ) ( not ( = ?auto_565011 ?auto_565012 ) ) ( not ( = ?auto_565011 ?auto_565013 ) ) ( not ( = ?auto_565011 ?auto_565014 ) ) ( not ( = ?auto_565012 ?auto_565013 ) ) ( not ( = ?auto_565012 ?auto_565014 ) ) ( not ( = ?auto_565013 ?auto_565014 ) ) ( ON ?auto_565013 ?auto_565014 ) ( ON ?auto_565012 ?auto_565013 ) ( ON ?auto_565011 ?auto_565012 ) ( ON ?auto_565010 ?auto_565011 ) ( ON ?auto_565009 ?auto_565010 ) ( ON ?auto_565008 ?auto_565009 ) ( ON ?auto_565007 ?auto_565008 ) ( ON ?auto_565006 ?auto_565007 ) ( ON ?auto_565005 ?auto_565006 ) ( ON ?auto_565004 ?auto_565005 ) ( CLEAR ?auto_565002 ) ( ON ?auto_565003 ?auto_565004 ) ( CLEAR ?auto_565003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_564999 ?auto_565000 ?auto_565001 ?auto_565002 ?auto_565003 )
      ( MAKE-16PILE ?auto_564999 ?auto_565000 ?auto_565001 ?auto_565002 ?auto_565003 ?auto_565004 ?auto_565005 ?auto_565006 ?auto_565007 ?auto_565008 ?auto_565009 ?auto_565010 ?auto_565011 ?auto_565012 ?auto_565013 ?auto_565014 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565031 - BLOCK
      ?auto_565032 - BLOCK
      ?auto_565033 - BLOCK
      ?auto_565034 - BLOCK
      ?auto_565035 - BLOCK
      ?auto_565036 - BLOCK
      ?auto_565037 - BLOCK
      ?auto_565038 - BLOCK
      ?auto_565039 - BLOCK
      ?auto_565040 - BLOCK
      ?auto_565041 - BLOCK
      ?auto_565042 - BLOCK
      ?auto_565043 - BLOCK
      ?auto_565044 - BLOCK
      ?auto_565045 - BLOCK
      ?auto_565046 - BLOCK
    )
    :vars
    (
      ?auto_565047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565046 ?auto_565047 ) ( ON-TABLE ?auto_565031 ) ( ON ?auto_565032 ?auto_565031 ) ( ON ?auto_565033 ?auto_565032 ) ( not ( = ?auto_565031 ?auto_565032 ) ) ( not ( = ?auto_565031 ?auto_565033 ) ) ( not ( = ?auto_565031 ?auto_565034 ) ) ( not ( = ?auto_565031 ?auto_565035 ) ) ( not ( = ?auto_565031 ?auto_565036 ) ) ( not ( = ?auto_565031 ?auto_565037 ) ) ( not ( = ?auto_565031 ?auto_565038 ) ) ( not ( = ?auto_565031 ?auto_565039 ) ) ( not ( = ?auto_565031 ?auto_565040 ) ) ( not ( = ?auto_565031 ?auto_565041 ) ) ( not ( = ?auto_565031 ?auto_565042 ) ) ( not ( = ?auto_565031 ?auto_565043 ) ) ( not ( = ?auto_565031 ?auto_565044 ) ) ( not ( = ?auto_565031 ?auto_565045 ) ) ( not ( = ?auto_565031 ?auto_565046 ) ) ( not ( = ?auto_565031 ?auto_565047 ) ) ( not ( = ?auto_565032 ?auto_565033 ) ) ( not ( = ?auto_565032 ?auto_565034 ) ) ( not ( = ?auto_565032 ?auto_565035 ) ) ( not ( = ?auto_565032 ?auto_565036 ) ) ( not ( = ?auto_565032 ?auto_565037 ) ) ( not ( = ?auto_565032 ?auto_565038 ) ) ( not ( = ?auto_565032 ?auto_565039 ) ) ( not ( = ?auto_565032 ?auto_565040 ) ) ( not ( = ?auto_565032 ?auto_565041 ) ) ( not ( = ?auto_565032 ?auto_565042 ) ) ( not ( = ?auto_565032 ?auto_565043 ) ) ( not ( = ?auto_565032 ?auto_565044 ) ) ( not ( = ?auto_565032 ?auto_565045 ) ) ( not ( = ?auto_565032 ?auto_565046 ) ) ( not ( = ?auto_565032 ?auto_565047 ) ) ( not ( = ?auto_565033 ?auto_565034 ) ) ( not ( = ?auto_565033 ?auto_565035 ) ) ( not ( = ?auto_565033 ?auto_565036 ) ) ( not ( = ?auto_565033 ?auto_565037 ) ) ( not ( = ?auto_565033 ?auto_565038 ) ) ( not ( = ?auto_565033 ?auto_565039 ) ) ( not ( = ?auto_565033 ?auto_565040 ) ) ( not ( = ?auto_565033 ?auto_565041 ) ) ( not ( = ?auto_565033 ?auto_565042 ) ) ( not ( = ?auto_565033 ?auto_565043 ) ) ( not ( = ?auto_565033 ?auto_565044 ) ) ( not ( = ?auto_565033 ?auto_565045 ) ) ( not ( = ?auto_565033 ?auto_565046 ) ) ( not ( = ?auto_565033 ?auto_565047 ) ) ( not ( = ?auto_565034 ?auto_565035 ) ) ( not ( = ?auto_565034 ?auto_565036 ) ) ( not ( = ?auto_565034 ?auto_565037 ) ) ( not ( = ?auto_565034 ?auto_565038 ) ) ( not ( = ?auto_565034 ?auto_565039 ) ) ( not ( = ?auto_565034 ?auto_565040 ) ) ( not ( = ?auto_565034 ?auto_565041 ) ) ( not ( = ?auto_565034 ?auto_565042 ) ) ( not ( = ?auto_565034 ?auto_565043 ) ) ( not ( = ?auto_565034 ?auto_565044 ) ) ( not ( = ?auto_565034 ?auto_565045 ) ) ( not ( = ?auto_565034 ?auto_565046 ) ) ( not ( = ?auto_565034 ?auto_565047 ) ) ( not ( = ?auto_565035 ?auto_565036 ) ) ( not ( = ?auto_565035 ?auto_565037 ) ) ( not ( = ?auto_565035 ?auto_565038 ) ) ( not ( = ?auto_565035 ?auto_565039 ) ) ( not ( = ?auto_565035 ?auto_565040 ) ) ( not ( = ?auto_565035 ?auto_565041 ) ) ( not ( = ?auto_565035 ?auto_565042 ) ) ( not ( = ?auto_565035 ?auto_565043 ) ) ( not ( = ?auto_565035 ?auto_565044 ) ) ( not ( = ?auto_565035 ?auto_565045 ) ) ( not ( = ?auto_565035 ?auto_565046 ) ) ( not ( = ?auto_565035 ?auto_565047 ) ) ( not ( = ?auto_565036 ?auto_565037 ) ) ( not ( = ?auto_565036 ?auto_565038 ) ) ( not ( = ?auto_565036 ?auto_565039 ) ) ( not ( = ?auto_565036 ?auto_565040 ) ) ( not ( = ?auto_565036 ?auto_565041 ) ) ( not ( = ?auto_565036 ?auto_565042 ) ) ( not ( = ?auto_565036 ?auto_565043 ) ) ( not ( = ?auto_565036 ?auto_565044 ) ) ( not ( = ?auto_565036 ?auto_565045 ) ) ( not ( = ?auto_565036 ?auto_565046 ) ) ( not ( = ?auto_565036 ?auto_565047 ) ) ( not ( = ?auto_565037 ?auto_565038 ) ) ( not ( = ?auto_565037 ?auto_565039 ) ) ( not ( = ?auto_565037 ?auto_565040 ) ) ( not ( = ?auto_565037 ?auto_565041 ) ) ( not ( = ?auto_565037 ?auto_565042 ) ) ( not ( = ?auto_565037 ?auto_565043 ) ) ( not ( = ?auto_565037 ?auto_565044 ) ) ( not ( = ?auto_565037 ?auto_565045 ) ) ( not ( = ?auto_565037 ?auto_565046 ) ) ( not ( = ?auto_565037 ?auto_565047 ) ) ( not ( = ?auto_565038 ?auto_565039 ) ) ( not ( = ?auto_565038 ?auto_565040 ) ) ( not ( = ?auto_565038 ?auto_565041 ) ) ( not ( = ?auto_565038 ?auto_565042 ) ) ( not ( = ?auto_565038 ?auto_565043 ) ) ( not ( = ?auto_565038 ?auto_565044 ) ) ( not ( = ?auto_565038 ?auto_565045 ) ) ( not ( = ?auto_565038 ?auto_565046 ) ) ( not ( = ?auto_565038 ?auto_565047 ) ) ( not ( = ?auto_565039 ?auto_565040 ) ) ( not ( = ?auto_565039 ?auto_565041 ) ) ( not ( = ?auto_565039 ?auto_565042 ) ) ( not ( = ?auto_565039 ?auto_565043 ) ) ( not ( = ?auto_565039 ?auto_565044 ) ) ( not ( = ?auto_565039 ?auto_565045 ) ) ( not ( = ?auto_565039 ?auto_565046 ) ) ( not ( = ?auto_565039 ?auto_565047 ) ) ( not ( = ?auto_565040 ?auto_565041 ) ) ( not ( = ?auto_565040 ?auto_565042 ) ) ( not ( = ?auto_565040 ?auto_565043 ) ) ( not ( = ?auto_565040 ?auto_565044 ) ) ( not ( = ?auto_565040 ?auto_565045 ) ) ( not ( = ?auto_565040 ?auto_565046 ) ) ( not ( = ?auto_565040 ?auto_565047 ) ) ( not ( = ?auto_565041 ?auto_565042 ) ) ( not ( = ?auto_565041 ?auto_565043 ) ) ( not ( = ?auto_565041 ?auto_565044 ) ) ( not ( = ?auto_565041 ?auto_565045 ) ) ( not ( = ?auto_565041 ?auto_565046 ) ) ( not ( = ?auto_565041 ?auto_565047 ) ) ( not ( = ?auto_565042 ?auto_565043 ) ) ( not ( = ?auto_565042 ?auto_565044 ) ) ( not ( = ?auto_565042 ?auto_565045 ) ) ( not ( = ?auto_565042 ?auto_565046 ) ) ( not ( = ?auto_565042 ?auto_565047 ) ) ( not ( = ?auto_565043 ?auto_565044 ) ) ( not ( = ?auto_565043 ?auto_565045 ) ) ( not ( = ?auto_565043 ?auto_565046 ) ) ( not ( = ?auto_565043 ?auto_565047 ) ) ( not ( = ?auto_565044 ?auto_565045 ) ) ( not ( = ?auto_565044 ?auto_565046 ) ) ( not ( = ?auto_565044 ?auto_565047 ) ) ( not ( = ?auto_565045 ?auto_565046 ) ) ( not ( = ?auto_565045 ?auto_565047 ) ) ( not ( = ?auto_565046 ?auto_565047 ) ) ( ON ?auto_565045 ?auto_565046 ) ( ON ?auto_565044 ?auto_565045 ) ( ON ?auto_565043 ?auto_565044 ) ( ON ?auto_565042 ?auto_565043 ) ( ON ?auto_565041 ?auto_565042 ) ( ON ?auto_565040 ?auto_565041 ) ( ON ?auto_565039 ?auto_565040 ) ( ON ?auto_565038 ?auto_565039 ) ( ON ?auto_565037 ?auto_565038 ) ( ON ?auto_565036 ?auto_565037 ) ( ON ?auto_565035 ?auto_565036 ) ( CLEAR ?auto_565033 ) ( ON ?auto_565034 ?auto_565035 ) ( CLEAR ?auto_565034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_565031 ?auto_565032 ?auto_565033 ?auto_565034 )
      ( MAKE-16PILE ?auto_565031 ?auto_565032 ?auto_565033 ?auto_565034 ?auto_565035 ?auto_565036 ?auto_565037 ?auto_565038 ?auto_565039 ?auto_565040 ?auto_565041 ?auto_565042 ?auto_565043 ?auto_565044 ?auto_565045 ?auto_565046 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565064 - BLOCK
      ?auto_565065 - BLOCK
      ?auto_565066 - BLOCK
      ?auto_565067 - BLOCK
      ?auto_565068 - BLOCK
      ?auto_565069 - BLOCK
      ?auto_565070 - BLOCK
      ?auto_565071 - BLOCK
      ?auto_565072 - BLOCK
      ?auto_565073 - BLOCK
      ?auto_565074 - BLOCK
      ?auto_565075 - BLOCK
      ?auto_565076 - BLOCK
      ?auto_565077 - BLOCK
      ?auto_565078 - BLOCK
      ?auto_565079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_565079 ) ( ON-TABLE ?auto_565064 ) ( ON ?auto_565065 ?auto_565064 ) ( ON ?auto_565066 ?auto_565065 ) ( not ( = ?auto_565064 ?auto_565065 ) ) ( not ( = ?auto_565064 ?auto_565066 ) ) ( not ( = ?auto_565064 ?auto_565067 ) ) ( not ( = ?auto_565064 ?auto_565068 ) ) ( not ( = ?auto_565064 ?auto_565069 ) ) ( not ( = ?auto_565064 ?auto_565070 ) ) ( not ( = ?auto_565064 ?auto_565071 ) ) ( not ( = ?auto_565064 ?auto_565072 ) ) ( not ( = ?auto_565064 ?auto_565073 ) ) ( not ( = ?auto_565064 ?auto_565074 ) ) ( not ( = ?auto_565064 ?auto_565075 ) ) ( not ( = ?auto_565064 ?auto_565076 ) ) ( not ( = ?auto_565064 ?auto_565077 ) ) ( not ( = ?auto_565064 ?auto_565078 ) ) ( not ( = ?auto_565064 ?auto_565079 ) ) ( not ( = ?auto_565065 ?auto_565066 ) ) ( not ( = ?auto_565065 ?auto_565067 ) ) ( not ( = ?auto_565065 ?auto_565068 ) ) ( not ( = ?auto_565065 ?auto_565069 ) ) ( not ( = ?auto_565065 ?auto_565070 ) ) ( not ( = ?auto_565065 ?auto_565071 ) ) ( not ( = ?auto_565065 ?auto_565072 ) ) ( not ( = ?auto_565065 ?auto_565073 ) ) ( not ( = ?auto_565065 ?auto_565074 ) ) ( not ( = ?auto_565065 ?auto_565075 ) ) ( not ( = ?auto_565065 ?auto_565076 ) ) ( not ( = ?auto_565065 ?auto_565077 ) ) ( not ( = ?auto_565065 ?auto_565078 ) ) ( not ( = ?auto_565065 ?auto_565079 ) ) ( not ( = ?auto_565066 ?auto_565067 ) ) ( not ( = ?auto_565066 ?auto_565068 ) ) ( not ( = ?auto_565066 ?auto_565069 ) ) ( not ( = ?auto_565066 ?auto_565070 ) ) ( not ( = ?auto_565066 ?auto_565071 ) ) ( not ( = ?auto_565066 ?auto_565072 ) ) ( not ( = ?auto_565066 ?auto_565073 ) ) ( not ( = ?auto_565066 ?auto_565074 ) ) ( not ( = ?auto_565066 ?auto_565075 ) ) ( not ( = ?auto_565066 ?auto_565076 ) ) ( not ( = ?auto_565066 ?auto_565077 ) ) ( not ( = ?auto_565066 ?auto_565078 ) ) ( not ( = ?auto_565066 ?auto_565079 ) ) ( not ( = ?auto_565067 ?auto_565068 ) ) ( not ( = ?auto_565067 ?auto_565069 ) ) ( not ( = ?auto_565067 ?auto_565070 ) ) ( not ( = ?auto_565067 ?auto_565071 ) ) ( not ( = ?auto_565067 ?auto_565072 ) ) ( not ( = ?auto_565067 ?auto_565073 ) ) ( not ( = ?auto_565067 ?auto_565074 ) ) ( not ( = ?auto_565067 ?auto_565075 ) ) ( not ( = ?auto_565067 ?auto_565076 ) ) ( not ( = ?auto_565067 ?auto_565077 ) ) ( not ( = ?auto_565067 ?auto_565078 ) ) ( not ( = ?auto_565067 ?auto_565079 ) ) ( not ( = ?auto_565068 ?auto_565069 ) ) ( not ( = ?auto_565068 ?auto_565070 ) ) ( not ( = ?auto_565068 ?auto_565071 ) ) ( not ( = ?auto_565068 ?auto_565072 ) ) ( not ( = ?auto_565068 ?auto_565073 ) ) ( not ( = ?auto_565068 ?auto_565074 ) ) ( not ( = ?auto_565068 ?auto_565075 ) ) ( not ( = ?auto_565068 ?auto_565076 ) ) ( not ( = ?auto_565068 ?auto_565077 ) ) ( not ( = ?auto_565068 ?auto_565078 ) ) ( not ( = ?auto_565068 ?auto_565079 ) ) ( not ( = ?auto_565069 ?auto_565070 ) ) ( not ( = ?auto_565069 ?auto_565071 ) ) ( not ( = ?auto_565069 ?auto_565072 ) ) ( not ( = ?auto_565069 ?auto_565073 ) ) ( not ( = ?auto_565069 ?auto_565074 ) ) ( not ( = ?auto_565069 ?auto_565075 ) ) ( not ( = ?auto_565069 ?auto_565076 ) ) ( not ( = ?auto_565069 ?auto_565077 ) ) ( not ( = ?auto_565069 ?auto_565078 ) ) ( not ( = ?auto_565069 ?auto_565079 ) ) ( not ( = ?auto_565070 ?auto_565071 ) ) ( not ( = ?auto_565070 ?auto_565072 ) ) ( not ( = ?auto_565070 ?auto_565073 ) ) ( not ( = ?auto_565070 ?auto_565074 ) ) ( not ( = ?auto_565070 ?auto_565075 ) ) ( not ( = ?auto_565070 ?auto_565076 ) ) ( not ( = ?auto_565070 ?auto_565077 ) ) ( not ( = ?auto_565070 ?auto_565078 ) ) ( not ( = ?auto_565070 ?auto_565079 ) ) ( not ( = ?auto_565071 ?auto_565072 ) ) ( not ( = ?auto_565071 ?auto_565073 ) ) ( not ( = ?auto_565071 ?auto_565074 ) ) ( not ( = ?auto_565071 ?auto_565075 ) ) ( not ( = ?auto_565071 ?auto_565076 ) ) ( not ( = ?auto_565071 ?auto_565077 ) ) ( not ( = ?auto_565071 ?auto_565078 ) ) ( not ( = ?auto_565071 ?auto_565079 ) ) ( not ( = ?auto_565072 ?auto_565073 ) ) ( not ( = ?auto_565072 ?auto_565074 ) ) ( not ( = ?auto_565072 ?auto_565075 ) ) ( not ( = ?auto_565072 ?auto_565076 ) ) ( not ( = ?auto_565072 ?auto_565077 ) ) ( not ( = ?auto_565072 ?auto_565078 ) ) ( not ( = ?auto_565072 ?auto_565079 ) ) ( not ( = ?auto_565073 ?auto_565074 ) ) ( not ( = ?auto_565073 ?auto_565075 ) ) ( not ( = ?auto_565073 ?auto_565076 ) ) ( not ( = ?auto_565073 ?auto_565077 ) ) ( not ( = ?auto_565073 ?auto_565078 ) ) ( not ( = ?auto_565073 ?auto_565079 ) ) ( not ( = ?auto_565074 ?auto_565075 ) ) ( not ( = ?auto_565074 ?auto_565076 ) ) ( not ( = ?auto_565074 ?auto_565077 ) ) ( not ( = ?auto_565074 ?auto_565078 ) ) ( not ( = ?auto_565074 ?auto_565079 ) ) ( not ( = ?auto_565075 ?auto_565076 ) ) ( not ( = ?auto_565075 ?auto_565077 ) ) ( not ( = ?auto_565075 ?auto_565078 ) ) ( not ( = ?auto_565075 ?auto_565079 ) ) ( not ( = ?auto_565076 ?auto_565077 ) ) ( not ( = ?auto_565076 ?auto_565078 ) ) ( not ( = ?auto_565076 ?auto_565079 ) ) ( not ( = ?auto_565077 ?auto_565078 ) ) ( not ( = ?auto_565077 ?auto_565079 ) ) ( not ( = ?auto_565078 ?auto_565079 ) ) ( ON ?auto_565078 ?auto_565079 ) ( ON ?auto_565077 ?auto_565078 ) ( ON ?auto_565076 ?auto_565077 ) ( ON ?auto_565075 ?auto_565076 ) ( ON ?auto_565074 ?auto_565075 ) ( ON ?auto_565073 ?auto_565074 ) ( ON ?auto_565072 ?auto_565073 ) ( ON ?auto_565071 ?auto_565072 ) ( ON ?auto_565070 ?auto_565071 ) ( ON ?auto_565069 ?auto_565070 ) ( ON ?auto_565068 ?auto_565069 ) ( CLEAR ?auto_565066 ) ( ON ?auto_565067 ?auto_565068 ) ( CLEAR ?auto_565067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_565064 ?auto_565065 ?auto_565066 ?auto_565067 )
      ( MAKE-16PILE ?auto_565064 ?auto_565065 ?auto_565066 ?auto_565067 ?auto_565068 ?auto_565069 ?auto_565070 ?auto_565071 ?auto_565072 ?auto_565073 ?auto_565074 ?auto_565075 ?auto_565076 ?auto_565077 ?auto_565078 ?auto_565079 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565096 - BLOCK
      ?auto_565097 - BLOCK
      ?auto_565098 - BLOCK
      ?auto_565099 - BLOCK
      ?auto_565100 - BLOCK
      ?auto_565101 - BLOCK
      ?auto_565102 - BLOCK
      ?auto_565103 - BLOCK
      ?auto_565104 - BLOCK
      ?auto_565105 - BLOCK
      ?auto_565106 - BLOCK
      ?auto_565107 - BLOCK
      ?auto_565108 - BLOCK
      ?auto_565109 - BLOCK
      ?auto_565110 - BLOCK
      ?auto_565111 - BLOCK
    )
    :vars
    (
      ?auto_565112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565111 ?auto_565112 ) ( ON-TABLE ?auto_565096 ) ( ON ?auto_565097 ?auto_565096 ) ( not ( = ?auto_565096 ?auto_565097 ) ) ( not ( = ?auto_565096 ?auto_565098 ) ) ( not ( = ?auto_565096 ?auto_565099 ) ) ( not ( = ?auto_565096 ?auto_565100 ) ) ( not ( = ?auto_565096 ?auto_565101 ) ) ( not ( = ?auto_565096 ?auto_565102 ) ) ( not ( = ?auto_565096 ?auto_565103 ) ) ( not ( = ?auto_565096 ?auto_565104 ) ) ( not ( = ?auto_565096 ?auto_565105 ) ) ( not ( = ?auto_565096 ?auto_565106 ) ) ( not ( = ?auto_565096 ?auto_565107 ) ) ( not ( = ?auto_565096 ?auto_565108 ) ) ( not ( = ?auto_565096 ?auto_565109 ) ) ( not ( = ?auto_565096 ?auto_565110 ) ) ( not ( = ?auto_565096 ?auto_565111 ) ) ( not ( = ?auto_565096 ?auto_565112 ) ) ( not ( = ?auto_565097 ?auto_565098 ) ) ( not ( = ?auto_565097 ?auto_565099 ) ) ( not ( = ?auto_565097 ?auto_565100 ) ) ( not ( = ?auto_565097 ?auto_565101 ) ) ( not ( = ?auto_565097 ?auto_565102 ) ) ( not ( = ?auto_565097 ?auto_565103 ) ) ( not ( = ?auto_565097 ?auto_565104 ) ) ( not ( = ?auto_565097 ?auto_565105 ) ) ( not ( = ?auto_565097 ?auto_565106 ) ) ( not ( = ?auto_565097 ?auto_565107 ) ) ( not ( = ?auto_565097 ?auto_565108 ) ) ( not ( = ?auto_565097 ?auto_565109 ) ) ( not ( = ?auto_565097 ?auto_565110 ) ) ( not ( = ?auto_565097 ?auto_565111 ) ) ( not ( = ?auto_565097 ?auto_565112 ) ) ( not ( = ?auto_565098 ?auto_565099 ) ) ( not ( = ?auto_565098 ?auto_565100 ) ) ( not ( = ?auto_565098 ?auto_565101 ) ) ( not ( = ?auto_565098 ?auto_565102 ) ) ( not ( = ?auto_565098 ?auto_565103 ) ) ( not ( = ?auto_565098 ?auto_565104 ) ) ( not ( = ?auto_565098 ?auto_565105 ) ) ( not ( = ?auto_565098 ?auto_565106 ) ) ( not ( = ?auto_565098 ?auto_565107 ) ) ( not ( = ?auto_565098 ?auto_565108 ) ) ( not ( = ?auto_565098 ?auto_565109 ) ) ( not ( = ?auto_565098 ?auto_565110 ) ) ( not ( = ?auto_565098 ?auto_565111 ) ) ( not ( = ?auto_565098 ?auto_565112 ) ) ( not ( = ?auto_565099 ?auto_565100 ) ) ( not ( = ?auto_565099 ?auto_565101 ) ) ( not ( = ?auto_565099 ?auto_565102 ) ) ( not ( = ?auto_565099 ?auto_565103 ) ) ( not ( = ?auto_565099 ?auto_565104 ) ) ( not ( = ?auto_565099 ?auto_565105 ) ) ( not ( = ?auto_565099 ?auto_565106 ) ) ( not ( = ?auto_565099 ?auto_565107 ) ) ( not ( = ?auto_565099 ?auto_565108 ) ) ( not ( = ?auto_565099 ?auto_565109 ) ) ( not ( = ?auto_565099 ?auto_565110 ) ) ( not ( = ?auto_565099 ?auto_565111 ) ) ( not ( = ?auto_565099 ?auto_565112 ) ) ( not ( = ?auto_565100 ?auto_565101 ) ) ( not ( = ?auto_565100 ?auto_565102 ) ) ( not ( = ?auto_565100 ?auto_565103 ) ) ( not ( = ?auto_565100 ?auto_565104 ) ) ( not ( = ?auto_565100 ?auto_565105 ) ) ( not ( = ?auto_565100 ?auto_565106 ) ) ( not ( = ?auto_565100 ?auto_565107 ) ) ( not ( = ?auto_565100 ?auto_565108 ) ) ( not ( = ?auto_565100 ?auto_565109 ) ) ( not ( = ?auto_565100 ?auto_565110 ) ) ( not ( = ?auto_565100 ?auto_565111 ) ) ( not ( = ?auto_565100 ?auto_565112 ) ) ( not ( = ?auto_565101 ?auto_565102 ) ) ( not ( = ?auto_565101 ?auto_565103 ) ) ( not ( = ?auto_565101 ?auto_565104 ) ) ( not ( = ?auto_565101 ?auto_565105 ) ) ( not ( = ?auto_565101 ?auto_565106 ) ) ( not ( = ?auto_565101 ?auto_565107 ) ) ( not ( = ?auto_565101 ?auto_565108 ) ) ( not ( = ?auto_565101 ?auto_565109 ) ) ( not ( = ?auto_565101 ?auto_565110 ) ) ( not ( = ?auto_565101 ?auto_565111 ) ) ( not ( = ?auto_565101 ?auto_565112 ) ) ( not ( = ?auto_565102 ?auto_565103 ) ) ( not ( = ?auto_565102 ?auto_565104 ) ) ( not ( = ?auto_565102 ?auto_565105 ) ) ( not ( = ?auto_565102 ?auto_565106 ) ) ( not ( = ?auto_565102 ?auto_565107 ) ) ( not ( = ?auto_565102 ?auto_565108 ) ) ( not ( = ?auto_565102 ?auto_565109 ) ) ( not ( = ?auto_565102 ?auto_565110 ) ) ( not ( = ?auto_565102 ?auto_565111 ) ) ( not ( = ?auto_565102 ?auto_565112 ) ) ( not ( = ?auto_565103 ?auto_565104 ) ) ( not ( = ?auto_565103 ?auto_565105 ) ) ( not ( = ?auto_565103 ?auto_565106 ) ) ( not ( = ?auto_565103 ?auto_565107 ) ) ( not ( = ?auto_565103 ?auto_565108 ) ) ( not ( = ?auto_565103 ?auto_565109 ) ) ( not ( = ?auto_565103 ?auto_565110 ) ) ( not ( = ?auto_565103 ?auto_565111 ) ) ( not ( = ?auto_565103 ?auto_565112 ) ) ( not ( = ?auto_565104 ?auto_565105 ) ) ( not ( = ?auto_565104 ?auto_565106 ) ) ( not ( = ?auto_565104 ?auto_565107 ) ) ( not ( = ?auto_565104 ?auto_565108 ) ) ( not ( = ?auto_565104 ?auto_565109 ) ) ( not ( = ?auto_565104 ?auto_565110 ) ) ( not ( = ?auto_565104 ?auto_565111 ) ) ( not ( = ?auto_565104 ?auto_565112 ) ) ( not ( = ?auto_565105 ?auto_565106 ) ) ( not ( = ?auto_565105 ?auto_565107 ) ) ( not ( = ?auto_565105 ?auto_565108 ) ) ( not ( = ?auto_565105 ?auto_565109 ) ) ( not ( = ?auto_565105 ?auto_565110 ) ) ( not ( = ?auto_565105 ?auto_565111 ) ) ( not ( = ?auto_565105 ?auto_565112 ) ) ( not ( = ?auto_565106 ?auto_565107 ) ) ( not ( = ?auto_565106 ?auto_565108 ) ) ( not ( = ?auto_565106 ?auto_565109 ) ) ( not ( = ?auto_565106 ?auto_565110 ) ) ( not ( = ?auto_565106 ?auto_565111 ) ) ( not ( = ?auto_565106 ?auto_565112 ) ) ( not ( = ?auto_565107 ?auto_565108 ) ) ( not ( = ?auto_565107 ?auto_565109 ) ) ( not ( = ?auto_565107 ?auto_565110 ) ) ( not ( = ?auto_565107 ?auto_565111 ) ) ( not ( = ?auto_565107 ?auto_565112 ) ) ( not ( = ?auto_565108 ?auto_565109 ) ) ( not ( = ?auto_565108 ?auto_565110 ) ) ( not ( = ?auto_565108 ?auto_565111 ) ) ( not ( = ?auto_565108 ?auto_565112 ) ) ( not ( = ?auto_565109 ?auto_565110 ) ) ( not ( = ?auto_565109 ?auto_565111 ) ) ( not ( = ?auto_565109 ?auto_565112 ) ) ( not ( = ?auto_565110 ?auto_565111 ) ) ( not ( = ?auto_565110 ?auto_565112 ) ) ( not ( = ?auto_565111 ?auto_565112 ) ) ( ON ?auto_565110 ?auto_565111 ) ( ON ?auto_565109 ?auto_565110 ) ( ON ?auto_565108 ?auto_565109 ) ( ON ?auto_565107 ?auto_565108 ) ( ON ?auto_565106 ?auto_565107 ) ( ON ?auto_565105 ?auto_565106 ) ( ON ?auto_565104 ?auto_565105 ) ( ON ?auto_565103 ?auto_565104 ) ( ON ?auto_565102 ?auto_565103 ) ( ON ?auto_565101 ?auto_565102 ) ( ON ?auto_565100 ?auto_565101 ) ( ON ?auto_565099 ?auto_565100 ) ( CLEAR ?auto_565097 ) ( ON ?auto_565098 ?auto_565099 ) ( CLEAR ?auto_565098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565096 ?auto_565097 ?auto_565098 )
      ( MAKE-16PILE ?auto_565096 ?auto_565097 ?auto_565098 ?auto_565099 ?auto_565100 ?auto_565101 ?auto_565102 ?auto_565103 ?auto_565104 ?auto_565105 ?auto_565106 ?auto_565107 ?auto_565108 ?auto_565109 ?auto_565110 ?auto_565111 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565129 - BLOCK
      ?auto_565130 - BLOCK
      ?auto_565131 - BLOCK
      ?auto_565132 - BLOCK
      ?auto_565133 - BLOCK
      ?auto_565134 - BLOCK
      ?auto_565135 - BLOCK
      ?auto_565136 - BLOCK
      ?auto_565137 - BLOCK
      ?auto_565138 - BLOCK
      ?auto_565139 - BLOCK
      ?auto_565140 - BLOCK
      ?auto_565141 - BLOCK
      ?auto_565142 - BLOCK
      ?auto_565143 - BLOCK
      ?auto_565144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_565144 ) ( ON-TABLE ?auto_565129 ) ( ON ?auto_565130 ?auto_565129 ) ( not ( = ?auto_565129 ?auto_565130 ) ) ( not ( = ?auto_565129 ?auto_565131 ) ) ( not ( = ?auto_565129 ?auto_565132 ) ) ( not ( = ?auto_565129 ?auto_565133 ) ) ( not ( = ?auto_565129 ?auto_565134 ) ) ( not ( = ?auto_565129 ?auto_565135 ) ) ( not ( = ?auto_565129 ?auto_565136 ) ) ( not ( = ?auto_565129 ?auto_565137 ) ) ( not ( = ?auto_565129 ?auto_565138 ) ) ( not ( = ?auto_565129 ?auto_565139 ) ) ( not ( = ?auto_565129 ?auto_565140 ) ) ( not ( = ?auto_565129 ?auto_565141 ) ) ( not ( = ?auto_565129 ?auto_565142 ) ) ( not ( = ?auto_565129 ?auto_565143 ) ) ( not ( = ?auto_565129 ?auto_565144 ) ) ( not ( = ?auto_565130 ?auto_565131 ) ) ( not ( = ?auto_565130 ?auto_565132 ) ) ( not ( = ?auto_565130 ?auto_565133 ) ) ( not ( = ?auto_565130 ?auto_565134 ) ) ( not ( = ?auto_565130 ?auto_565135 ) ) ( not ( = ?auto_565130 ?auto_565136 ) ) ( not ( = ?auto_565130 ?auto_565137 ) ) ( not ( = ?auto_565130 ?auto_565138 ) ) ( not ( = ?auto_565130 ?auto_565139 ) ) ( not ( = ?auto_565130 ?auto_565140 ) ) ( not ( = ?auto_565130 ?auto_565141 ) ) ( not ( = ?auto_565130 ?auto_565142 ) ) ( not ( = ?auto_565130 ?auto_565143 ) ) ( not ( = ?auto_565130 ?auto_565144 ) ) ( not ( = ?auto_565131 ?auto_565132 ) ) ( not ( = ?auto_565131 ?auto_565133 ) ) ( not ( = ?auto_565131 ?auto_565134 ) ) ( not ( = ?auto_565131 ?auto_565135 ) ) ( not ( = ?auto_565131 ?auto_565136 ) ) ( not ( = ?auto_565131 ?auto_565137 ) ) ( not ( = ?auto_565131 ?auto_565138 ) ) ( not ( = ?auto_565131 ?auto_565139 ) ) ( not ( = ?auto_565131 ?auto_565140 ) ) ( not ( = ?auto_565131 ?auto_565141 ) ) ( not ( = ?auto_565131 ?auto_565142 ) ) ( not ( = ?auto_565131 ?auto_565143 ) ) ( not ( = ?auto_565131 ?auto_565144 ) ) ( not ( = ?auto_565132 ?auto_565133 ) ) ( not ( = ?auto_565132 ?auto_565134 ) ) ( not ( = ?auto_565132 ?auto_565135 ) ) ( not ( = ?auto_565132 ?auto_565136 ) ) ( not ( = ?auto_565132 ?auto_565137 ) ) ( not ( = ?auto_565132 ?auto_565138 ) ) ( not ( = ?auto_565132 ?auto_565139 ) ) ( not ( = ?auto_565132 ?auto_565140 ) ) ( not ( = ?auto_565132 ?auto_565141 ) ) ( not ( = ?auto_565132 ?auto_565142 ) ) ( not ( = ?auto_565132 ?auto_565143 ) ) ( not ( = ?auto_565132 ?auto_565144 ) ) ( not ( = ?auto_565133 ?auto_565134 ) ) ( not ( = ?auto_565133 ?auto_565135 ) ) ( not ( = ?auto_565133 ?auto_565136 ) ) ( not ( = ?auto_565133 ?auto_565137 ) ) ( not ( = ?auto_565133 ?auto_565138 ) ) ( not ( = ?auto_565133 ?auto_565139 ) ) ( not ( = ?auto_565133 ?auto_565140 ) ) ( not ( = ?auto_565133 ?auto_565141 ) ) ( not ( = ?auto_565133 ?auto_565142 ) ) ( not ( = ?auto_565133 ?auto_565143 ) ) ( not ( = ?auto_565133 ?auto_565144 ) ) ( not ( = ?auto_565134 ?auto_565135 ) ) ( not ( = ?auto_565134 ?auto_565136 ) ) ( not ( = ?auto_565134 ?auto_565137 ) ) ( not ( = ?auto_565134 ?auto_565138 ) ) ( not ( = ?auto_565134 ?auto_565139 ) ) ( not ( = ?auto_565134 ?auto_565140 ) ) ( not ( = ?auto_565134 ?auto_565141 ) ) ( not ( = ?auto_565134 ?auto_565142 ) ) ( not ( = ?auto_565134 ?auto_565143 ) ) ( not ( = ?auto_565134 ?auto_565144 ) ) ( not ( = ?auto_565135 ?auto_565136 ) ) ( not ( = ?auto_565135 ?auto_565137 ) ) ( not ( = ?auto_565135 ?auto_565138 ) ) ( not ( = ?auto_565135 ?auto_565139 ) ) ( not ( = ?auto_565135 ?auto_565140 ) ) ( not ( = ?auto_565135 ?auto_565141 ) ) ( not ( = ?auto_565135 ?auto_565142 ) ) ( not ( = ?auto_565135 ?auto_565143 ) ) ( not ( = ?auto_565135 ?auto_565144 ) ) ( not ( = ?auto_565136 ?auto_565137 ) ) ( not ( = ?auto_565136 ?auto_565138 ) ) ( not ( = ?auto_565136 ?auto_565139 ) ) ( not ( = ?auto_565136 ?auto_565140 ) ) ( not ( = ?auto_565136 ?auto_565141 ) ) ( not ( = ?auto_565136 ?auto_565142 ) ) ( not ( = ?auto_565136 ?auto_565143 ) ) ( not ( = ?auto_565136 ?auto_565144 ) ) ( not ( = ?auto_565137 ?auto_565138 ) ) ( not ( = ?auto_565137 ?auto_565139 ) ) ( not ( = ?auto_565137 ?auto_565140 ) ) ( not ( = ?auto_565137 ?auto_565141 ) ) ( not ( = ?auto_565137 ?auto_565142 ) ) ( not ( = ?auto_565137 ?auto_565143 ) ) ( not ( = ?auto_565137 ?auto_565144 ) ) ( not ( = ?auto_565138 ?auto_565139 ) ) ( not ( = ?auto_565138 ?auto_565140 ) ) ( not ( = ?auto_565138 ?auto_565141 ) ) ( not ( = ?auto_565138 ?auto_565142 ) ) ( not ( = ?auto_565138 ?auto_565143 ) ) ( not ( = ?auto_565138 ?auto_565144 ) ) ( not ( = ?auto_565139 ?auto_565140 ) ) ( not ( = ?auto_565139 ?auto_565141 ) ) ( not ( = ?auto_565139 ?auto_565142 ) ) ( not ( = ?auto_565139 ?auto_565143 ) ) ( not ( = ?auto_565139 ?auto_565144 ) ) ( not ( = ?auto_565140 ?auto_565141 ) ) ( not ( = ?auto_565140 ?auto_565142 ) ) ( not ( = ?auto_565140 ?auto_565143 ) ) ( not ( = ?auto_565140 ?auto_565144 ) ) ( not ( = ?auto_565141 ?auto_565142 ) ) ( not ( = ?auto_565141 ?auto_565143 ) ) ( not ( = ?auto_565141 ?auto_565144 ) ) ( not ( = ?auto_565142 ?auto_565143 ) ) ( not ( = ?auto_565142 ?auto_565144 ) ) ( not ( = ?auto_565143 ?auto_565144 ) ) ( ON ?auto_565143 ?auto_565144 ) ( ON ?auto_565142 ?auto_565143 ) ( ON ?auto_565141 ?auto_565142 ) ( ON ?auto_565140 ?auto_565141 ) ( ON ?auto_565139 ?auto_565140 ) ( ON ?auto_565138 ?auto_565139 ) ( ON ?auto_565137 ?auto_565138 ) ( ON ?auto_565136 ?auto_565137 ) ( ON ?auto_565135 ?auto_565136 ) ( ON ?auto_565134 ?auto_565135 ) ( ON ?auto_565133 ?auto_565134 ) ( ON ?auto_565132 ?auto_565133 ) ( CLEAR ?auto_565130 ) ( ON ?auto_565131 ?auto_565132 ) ( CLEAR ?auto_565131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565129 ?auto_565130 ?auto_565131 )
      ( MAKE-16PILE ?auto_565129 ?auto_565130 ?auto_565131 ?auto_565132 ?auto_565133 ?auto_565134 ?auto_565135 ?auto_565136 ?auto_565137 ?auto_565138 ?auto_565139 ?auto_565140 ?auto_565141 ?auto_565142 ?auto_565143 ?auto_565144 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565161 - BLOCK
      ?auto_565162 - BLOCK
      ?auto_565163 - BLOCK
      ?auto_565164 - BLOCK
      ?auto_565165 - BLOCK
      ?auto_565166 - BLOCK
      ?auto_565167 - BLOCK
      ?auto_565168 - BLOCK
      ?auto_565169 - BLOCK
      ?auto_565170 - BLOCK
      ?auto_565171 - BLOCK
      ?auto_565172 - BLOCK
      ?auto_565173 - BLOCK
      ?auto_565174 - BLOCK
      ?auto_565175 - BLOCK
      ?auto_565176 - BLOCK
    )
    :vars
    (
      ?auto_565177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565176 ?auto_565177 ) ( ON-TABLE ?auto_565161 ) ( not ( = ?auto_565161 ?auto_565162 ) ) ( not ( = ?auto_565161 ?auto_565163 ) ) ( not ( = ?auto_565161 ?auto_565164 ) ) ( not ( = ?auto_565161 ?auto_565165 ) ) ( not ( = ?auto_565161 ?auto_565166 ) ) ( not ( = ?auto_565161 ?auto_565167 ) ) ( not ( = ?auto_565161 ?auto_565168 ) ) ( not ( = ?auto_565161 ?auto_565169 ) ) ( not ( = ?auto_565161 ?auto_565170 ) ) ( not ( = ?auto_565161 ?auto_565171 ) ) ( not ( = ?auto_565161 ?auto_565172 ) ) ( not ( = ?auto_565161 ?auto_565173 ) ) ( not ( = ?auto_565161 ?auto_565174 ) ) ( not ( = ?auto_565161 ?auto_565175 ) ) ( not ( = ?auto_565161 ?auto_565176 ) ) ( not ( = ?auto_565161 ?auto_565177 ) ) ( not ( = ?auto_565162 ?auto_565163 ) ) ( not ( = ?auto_565162 ?auto_565164 ) ) ( not ( = ?auto_565162 ?auto_565165 ) ) ( not ( = ?auto_565162 ?auto_565166 ) ) ( not ( = ?auto_565162 ?auto_565167 ) ) ( not ( = ?auto_565162 ?auto_565168 ) ) ( not ( = ?auto_565162 ?auto_565169 ) ) ( not ( = ?auto_565162 ?auto_565170 ) ) ( not ( = ?auto_565162 ?auto_565171 ) ) ( not ( = ?auto_565162 ?auto_565172 ) ) ( not ( = ?auto_565162 ?auto_565173 ) ) ( not ( = ?auto_565162 ?auto_565174 ) ) ( not ( = ?auto_565162 ?auto_565175 ) ) ( not ( = ?auto_565162 ?auto_565176 ) ) ( not ( = ?auto_565162 ?auto_565177 ) ) ( not ( = ?auto_565163 ?auto_565164 ) ) ( not ( = ?auto_565163 ?auto_565165 ) ) ( not ( = ?auto_565163 ?auto_565166 ) ) ( not ( = ?auto_565163 ?auto_565167 ) ) ( not ( = ?auto_565163 ?auto_565168 ) ) ( not ( = ?auto_565163 ?auto_565169 ) ) ( not ( = ?auto_565163 ?auto_565170 ) ) ( not ( = ?auto_565163 ?auto_565171 ) ) ( not ( = ?auto_565163 ?auto_565172 ) ) ( not ( = ?auto_565163 ?auto_565173 ) ) ( not ( = ?auto_565163 ?auto_565174 ) ) ( not ( = ?auto_565163 ?auto_565175 ) ) ( not ( = ?auto_565163 ?auto_565176 ) ) ( not ( = ?auto_565163 ?auto_565177 ) ) ( not ( = ?auto_565164 ?auto_565165 ) ) ( not ( = ?auto_565164 ?auto_565166 ) ) ( not ( = ?auto_565164 ?auto_565167 ) ) ( not ( = ?auto_565164 ?auto_565168 ) ) ( not ( = ?auto_565164 ?auto_565169 ) ) ( not ( = ?auto_565164 ?auto_565170 ) ) ( not ( = ?auto_565164 ?auto_565171 ) ) ( not ( = ?auto_565164 ?auto_565172 ) ) ( not ( = ?auto_565164 ?auto_565173 ) ) ( not ( = ?auto_565164 ?auto_565174 ) ) ( not ( = ?auto_565164 ?auto_565175 ) ) ( not ( = ?auto_565164 ?auto_565176 ) ) ( not ( = ?auto_565164 ?auto_565177 ) ) ( not ( = ?auto_565165 ?auto_565166 ) ) ( not ( = ?auto_565165 ?auto_565167 ) ) ( not ( = ?auto_565165 ?auto_565168 ) ) ( not ( = ?auto_565165 ?auto_565169 ) ) ( not ( = ?auto_565165 ?auto_565170 ) ) ( not ( = ?auto_565165 ?auto_565171 ) ) ( not ( = ?auto_565165 ?auto_565172 ) ) ( not ( = ?auto_565165 ?auto_565173 ) ) ( not ( = ?auto_565165 ?auto_565174 ) ) ( not ( = ?auto_565165 ?auto_565175 ) ) ( not ( = ?auto_565165 ?auto_565176 ) ) ( not ( = ?auto_565165 ?auto_565177 ) ) ( not ( = ?auto_565166 ?auto_565167 ) ) ( not ( = ?auto_565166 ?auto_565168 ) ) ( not ( = ?auto_565166 ?auto_565169 ) ) ( not ( = ?auto_565166 ?auto_565170 ) ) ( not ( = ?auto_565166 ?auto_565171 ) ) ( not ( = ?auto_565166 ?auto_565172 ) ) ( not ( = ?auto_565166 ?auto_565173 ) ) ( not ( = ?auto_565166 ?auto_565174 ) ) ( not ( = ?auto_565166 ?auto_565175 ) ) ( not ( = ?auto_565166 ?auto_565176 ) ) ( not ( = ?auto_565166 ?auto_565177 ) ) ( not ( = ?auto_565167 ?auto_565168 ) ) ( not ( = ?auto_565167 ?auto_565169 ) ) ( not ( = ?auto_565167 ?auto_565170 ) ) ( not ( = ?auto_565167 ?auto_565171 ) ) ( not ( = ?auto_565167 ?auto_565172 ) ) ( not ( = ?auto_565167 ?auto_565173 ) ) ( not ( = ?auto_565167 ?auto_565174 ) ) ( not ( = ?auto_565167 ?auto_565175 ) ) ( not ( = ?auto_565167 ?auto_565176 ) ) ( not ( = ?auto_565167 ?auto_565177 ) ) ( not ( = ?auto_565168 ?auto_565169 ) ) ( not ( = ?auto_565168 ?auto_565170 ) ) ( not ( = ?auto_565168 ?auto_565171 ) ) ( not ( = ?auto_565168 ?auto_565172 ) ) ( not ( = ?auto_565168 ?auto_565173 ) ) ( not ( = ?auto_565168 ?auto_565174 ) ) ( not ( = ?auto_565168 ?auto_565175 ) ) ( not ( = ?auto_565168 ?auto_565176 ) ) ( not ( = ?auto_565168 ?auto_565177 ) ) ( not ( = ?auto_565169 ?auto_565170 ) ) ( not ( = ?auto_565169 ?auto_565171 ) ) ( not ( = ?auto_565169 ?auto_565172 ) ) ( not ( = ?auto_565169 ?auto_565173 ) ) ( not ( = ?auto_565169 ?auto_565174 ) ) ( not ( = ?auto_565169 ?auto_565175 ) ) ( not ( = ?auto_565169 ?auto_565176 ) ) ( not ( = ?auto_565169 ?auto_565177 ) ) ( not ( = ?auto_565170 ?auto_565171 ) ) ( not ( = ?auto_565170 ?auto_565172 ) ) ( not ( = ?auto_565170 ?auto_565173 ) ) ( not ( = ?auto_565170 ?auto_565174 ) ) ( not ( = ?auto_565170 ?auto_565175 ) ) ( not ( = ?auto_565170 ?auto_565176 ) ) ( not ( = ?auto_565170 ?auto_565177 ) ) ( not ( = ?auto_565171 ?auto_565172 ) ) ( not ( = ?auto_565171 ?auto_565173 ) ) ( not ( = ?auto_565171 ?auto_565174 ) ) ( not ( = ?auto_565171 ?auto_565175 ) ) ( not ( = ?auto_565171 ?auto_565176 ) ) ( not ( = ?auto_565171 ?auto_565177 ) ) ( not ( = ?auto_565172 ?auto_565173 ) ) ( not ( = ?auto_565172 ?auto_565174 ) ) ( not ( = ?auto_565172 ?auto_565175 ) ) ( not ( = ?auto_565172 ?auto_565176 ) ) ( not ( = ?auto_565172 ?auto_565177 ) ) ( not ( = ?auto_565173 ?auto_565174 ) ) ( not ( = ?auto_565173 ?auto_565175 ) ) ( not ( = ?auto_565173 ?auto_565176 ) ) ( not ( = ?auto_565173 ?auto_565177 ) ) ( not ( = ?auto_565174 ?auto_565175 ) ) ( not ( = ?auto_565174 ?auto_565176 ) ) ( not ( = ?auto_565174 ?auto_565177 ) ) ( not ( = ?auto_565175 ?auto_565176 ) ) ( not ( = ?auto_565175 ?auto_565177 ) ) ( not ( = ?auto_565176 ?auto_565177 ) ) ( ON ?auto_565175 ?auto_565176 ) ( ON ?auto_565174 ?auto_565175 ) ( ON ?auto_565173 ?auto_565174 ) ( ON ?auto_565172 ?auto_565173 ) ( ON ?auto_565171 ?auto_565172 ) ( ON ?auto_565170 ?auto_565171 ) ( ON ?auto_565169 ?auto_565170 ) ( ON ?auto_565168 ?auto_565169 ) ( ON ?auto_565167 ?auto_565168 ) ( ON ?auto_565166 ?auto_565167 ) ( ON ?auto_565165 ?auto_565166 ) ( ON ?auto_565164 ?auto_565165 ) ( ON ?auto_565163 ?auto_565164 ) ( CLEAR ?auto_565161 ) ( ON ?auto_565162 ?auto_565163 ) ( CLEAR ?auto_565162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565161 ?auto_565162 )
      ( MAKE-16PILE ?auto_565161 ?auto_565162 ?auto_565163 ?auto_565164 ?auto_565165 ?auto_565166 ?auto_565167 ?auto_565168 ?auto_565169 ?auto_565170 ?auto_565171 ?auto_565172 ?auto_565173 ?auto_565174 ?auto_565175 ?auto_565176 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565194 - BLOCK
      ?auto_565195 - BLOCK
      ?auto_565196 - BLOCK
      ?auto_565197 - BLOCK
      ?auto_565198 - BLOCK
      ?auto_565199 - BLOCK
      ?auto_565200 - BLOCK
      ?auto_565201 - BLOCK
      ?auto_565202 - BLOCK
      ?auto_565203 - BLOCK
      ?auto_565204 - BLOCK
      ?auto_565205 - BLOCK
      ?auto_565206 - BLOCK
      ?auto_565207 - BLOCK
      ?auto_565208 - BLOCK
      ?auto_565209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_565209 ) ( ON-TABLE ?auto_565194 ) ( not ( = ?auto_565194 ?auto_565195 ) ) ( not ( = ?auto_565194 ?auto_565196 ) ) ( not ( = ?auto_565194 ?auto_565197 ) ) ( not ( = ?auto_565194 ?auto_565198 ) ) ( not ( = ?auto_565194 ?auto_565199 ) ) ( not ( = ?auto_565194 ?auto_565200 ) ) ( not ( = ?auto_565194 ?auto_565201 ) ) ( not ( = ?auto_565194 ?auto_565202 ) ) ( not ( = ?auto_565194 ?auto_565203 ) ) ( not ( = ?auto_565194 ?auto_565204 ) ) ( not ( = ?auto_565194 ?auto_565205 ) ) ( not ( = ?auto_565194 ?auto_565206 ) ) ( not ( = ?auto_565194 ?auto_565207 ) ) ( not ( = ?auto_565194 ?auto_565208 ) ) ( not ( = ?auto_565194 ?auto_565209 ) ) ( not ( = ?auto_565195 ?auto_565196 ) ) ( not ( = ?auto_565195 ?auto_565197 ) ) ( not ( = ?auto_565195 ?auto_565198 ) ) ( not ( = ?auto_565195 ?auto_565199 ) ) ( not ( = ?auto_565195 ?auto_565200 ) ) ( not ( = ?auto_565195 ?auto_565201 ) ) ( not ( = ?auto_565195 ?auto_565202 ) ) ( not ( = ?auto_565195 ?auto_565203 ) ) ( not ( = ?auto_565195 ?auto_565204 ) ) ( not ( = ?auto_565195 ?auto_565205 ) ) ( not ( = ?auto_565195 ?auto_565206 ) ) ( not ( = ?auto_565195 ?auto_565207 ) ) ( not ( = ?auto_565195 ?auto_565208 ) ) ( not ( = ?auto_565195 ?auto_565209 ) ) ( not ( = ?auto_565196 ?auto_565197 ) ) ( not ( = ?auto_565196 ?auto_565198 ) ) ( not ( = ?auto_565196 ?auto_565199 ) ) ( not ( = ?auto_565196 ?auto_565200 ) ) ( not ( = ?auto_565196 ?auto_565201 ) ) ( not ( = ?auto_565196 ?auto_565202 ) ) ( not ( = ?auto_565196 ?auto_565203 ) ) ( not ( = ?auto_565196 ?auto_565204 ) ) ( not ( = ?auto_565196 ?auto_565205 ) ) ( not ( = ?auto_565196 ?auto_565206 ) ) ( not ( = ?auto_565196 ?auto_565207 ) ) ( not ( = ?auto_565196 ?auto_565208 ) ) ( not ( = ?auto_565196 ?auto_565209 ) ) ( not ( = ?auto_565197 ?auto_565198 ) ) ( not ( = ?auto_565197 ?auto_565199 ) ) ( not ( = ?auto_565197 ?auto_565200 ) ) ( not ( = ?auto_565197 ?auto_565201 ) ) ( not ( = ?auto_565197 ?auto_565202 ) ) ( not ( = ?auto_565197 ?auto_565203 ) ) ( not ( = ?auto_565197 ?auto_565204 ) ) ( not ( = ?auto_565197 ?auto_565205 ) ) ( not ( = ?auto_565197 ?auto_565206 ) ) ( not ( = ?auto_565197 ?auto_565207 ) ) ( not ( = ?auto_565197 ?auto_565208 ) ) ( not ( = ?auto_565197 ?auto_565209 ) ) ( not ( = ?auto_565198 ?auto_565199 ) ) ( not ( = ?auto_565198 ?auto_565200 ) ) ( not ( = ?auto_565198 ?auto_565201 ) ) ( not ( = ?auto_565198 ?auto_565202 ) ) ( not ( = ?auto_565198 ?auto_565203 ) ) ( not ( = ?auto_565198 ?auto_565204 ) ) ( not ( = ?auto_565198 ?auto_565205 ) ) ( not ( = ?auto_565198 ?auto_565206 ) ) ( not ( = ?auto_565198 ?auto_565207 ) ) ( not ( = ?auto_565198 ?auto_565208 ) ) ( not ( = ?auto_565198 ?auto_565209 ) ) ( not ( = ?auto_565199 ?auto_565200 ) ) ( not ( = ?auto_565199 ?auto_565201 ) ) ( not ( = ?auto_565199 ?auto_565202 ) ) ( not ( = ?auto_565199 ?auto_565203 ) ) ( not ( = ?auto_565199 ?auto_565204 ) ) ( not ( = ?auto_565199 ?auto_565205 ) ) ( not ( = ?auto_565199 ?auto_565206 ) ) ( not ( = ?auto_565199 ?auto_565207 ) ) ( not ( = ?auto_565199 ?auto_565208 ) ) ( not ( = ?auto_565199 ?auto_565209 ) ) ( not ( = ?auto_565200 ?auto_565201 ) ) ( not ( = ?auto_565200 ?auto_565202 ) ) ( not ( = ?auto_565200 ?auto_565203 ) ) ( not ( = ?auto_565200 ?auto_565204 ) ) ( not ( = ?auto_565200 ?auto_565205 ) ) ( not ( = ?auto_565200 ?auto_565206 ) ) ( not ( = ?auto_565200 ?auto_565207 ) ) ( not ( = ?auto_565200 ?auto_565208 ) ) ( not ( = ?auto_565200 ?auto_565209 ) ) ( not ( = ?auto_565201 ?auto_565202 ) ) ( not ( = ?auto_565201 ?auto_565203 ) ) ( not ( = ?auto_565201 ?auto_565204 ) ) ( not ( = ?auto_565201 ?auto_565205 ) ) ( not ( = ?auto_565201 ?auto_565206 ) ) ( not ( = ?auto_565201 ?auto_565207 ) ) ( not ( = ?auto_565201 ?auto_565208 ) ) ( not ( = ?auto_565201 ?auto_565209 ) ) ( not ( = ?auto_565202 ?auto_565203 ) ) ( not ( = ?auto_565202 ?auto_565204 ) ) ( not ( = ?auto_565202 ?auto_565205 ) ) ( not ( = ?auto_565202 ?auto_565206 ) ) ( not ( = ?auto_565202 ?auto_565207 ) ) ( not ( = ?auto_565202 ?auto_565208 ) ) ( not ( = ?auto_565202 ?auto_565209 ) ) ( not ( = ?auto_565203 ?auto_565204 ) ) ( not ( = ?auto_565203 ?auto_565205 ) ) ( not ( = ?auto_565203 ?auto_565206 ) ) ( not ( = ?auto_565203 ?auto_565207 ) ) ( not ( = ?auto_565203 ?auto_565208 ) ) ( not ( = ?auto_565203 ?auto_565209 ) ) ( not ( = ?auto_565204 ?auto_565205 ) ) ( not ( = ?auto_565204 ?auto_565206 ) ) ( not ( = ?auto_565204 ?auto_565207 ) ) ( not ( = ?auto_565204 ?auto_565208 ) ) ( not ( = ?auto_565204 ?auto_565209 ) ) ( not ( = ?auto_565205 ?auto_565206 ) ) ( not ( = ?auto_565205 ?auto_565207 ) ) ( not ( = ?auto_565205 ?auto_565208 ) ) ( not ( = ?auto_565205 ?auto_565209 ) ) ( not ( = ?auto_565206 ?auto_565207 ) ) ( not ( = ?auto_565206 ?auto_565208 ) ) ( not ( = ?auto_565206 ?auto_565209 ) ) ( not ( = ?auto_565207 ?auto_565208 ) ) ( not ( = ?auto_565207 ?auto_565209 ) ) ( not ( = ?auto_565208 ?auto_565209 ) ) ( ON ?auto_565208 ?auto_565209 ) ( ON ?auto_565207 ?auto_565208 ) ( ON ?auto_565206 ?auto_565207 ) ( ON ?auto_565205 ?auto_565206 ) ( ON ?auto_565204 ?auto_565205 ) ( ON ?auto_565203 ?auto_565204 ) ( ON ?auto_565202 ?auto_565203 ) ( ON ?auto_565201 ?auto_565202 ) ( ON ?auto_565200 ?auto_565201 ) ( ON ?auto_565199 ?auto_565200 ) ( ON ?auto_565198 ?auto_565199 ) ( ON ?auto_565197 ?auto_565198 ) ( ON ?auto_565196 ?auto_565197 ) ( CLEAR ?auto_565194 ) ( ON ?auto_565195 ?auto_565196 ) ( CLEAR ?auto_565195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565194 ?auto_565195 )
      ( MAKE-16PILE ?auto_565194 ?auto_565195 ?auto_565196 ?auto_565197 ?auto_565198 ?auto_565199 ?auto_565200 ?auto_565201 ?auto_565202 ?auto_565203 ?auto_565204 ?auto_565205 ?auto_565206 ?auto_565207 ?auto_565208 ?auto_565209 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565226 - BLOCK
      ?auto_565227 - BLOCK
      ?auto_565228 - BLOCK
      ?auto_565229 - BLOCK
      ?auto_565230 - BLOCK
      ?auto_565231 - BLOCK
      ?auto_565232 - BLOCK
      ?auto_565233 - BLOCK
      ?auto_565234 - BLOCK
      ?auto_565235 - BLOCK
      ?auto_565236 - BLOCK
      ?auto_565237 - BLOCK
      ?auto_565238 - BLOCK
      ?auto_565239 - BLOCK
      ?auto_565240 - BLOCK
      ?auto_565241 - BLOCK
    )
    :vars
    (
      ?auto_565242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565241 ?auto_565242 ) ( not ( = ?auto_565226 ?auto_565227 ) ) ( not ( = ?auto_565226 ?auto_565228 ) ) ( not ( = ?auto_565226 ?auto_565229 ) ) ( not ( = ?auto_565226 ?auto_565230 ) ) ( not ( = ?auto_565226 ?auto_565231 ) ) ( not ( = ?auto_565226 ?auto_565232 ) ) ( not ( = ?auto_565226 ?auto_565233 ) ) ( not ( = ?auto_565226 ?auto_565234 ) ) ( not ( = ?auto_565226 ?auto_565235 ) ) ( not ( = ?auto_565226 ?auto_565236 ) ) ( not ( = ?auto_565226 ?auto_565237 ) ) ( not ( = ?auto_565226 ?auto_565238 ) ) ( not ( = ?auto_565226 ?auto_565239 ) ) ( not ( = ?auto_565226 ?auto_565240 ) ) ( not ( = ?auto_565226 ?auto_565241 ) ) ( not ( = ?auto_565226 ?auto_565242 ) ) ( not ( = ?auto_565227 ?auto_565228 ) ) ( not ( = ?auto_565227 ?auto_565229 ) ) ( not ( = ?auto_565227 ?auto_565230 ) ) ( not ( = ?auto_565227 ?auto_565231 ) ) ( not ( = ?auto_565227 ?auto_565232 ) ) ( not ( = ?auto_565227 ?auto_565233 ) ) ( not ( = ?auto_565227 ?auto_565234 ) ) ( not ( = ?auto_565227 ?auto_565235 ) ) ( not ( = ?auto_565227 ?auto_565236 ) ) ( not ( = ?auto_565227 ?auto_565237 ) ) ( not ( = ?auto_565227 ?auto_565238 ) ) ( not ( = ?auto_565227 ?auto_565239 ) ) ( not ( = ?auto_565227 ?auto_565240 ) ) ( not ( = ?auto_565227 ?auto_565241 ) ) ( not ( = ?auto_565227 ?auto_565242 ) ) ( not ( = ?auto_565228 ?auto_565229 ) ) ( not ( = ?auto_565228 ?auto_565230 ) ) ( not ( = ?auto_565228 ?auto_565231 ) ) ( not ( = ?auto_565228 ?auto_565232 ) ) ( not ( = ?auto_565228 ?auto_565233 ) ) ( not ( = ?auto_565228 ?auto_565234 ) ) ( not ( = ?auto_565228 ?auto_565235 ) ) ( not ( = ?auto_565228 ?auto_565236 ) ) ( not ( = ?auto_565228 ?auto_565237 ) ) ( not ( = ?auto_565228 ?auto_565238 ) ) ( not ( = ?auto_565228 ?auto_565239 ) ) ( not ( = ?auto_565228 ?auto_565240 ) ) ( not ( = ?auto_565228 ?auto_565241 ) ) ( not ( = ?auto_565228 ?auto_565242 ) ) ( not ( = ?auto_565229 ?auto_565230 ) ) ( not ( = ?auto_565229 ?auto_565231 ) ) ( not ( = ?auto_565229 ?auto_565232 ) ) ( not ( = ?auto_565229 ?auto_565233 ) ) ( not ( = ?auto_565229 ?auto_565234 ) ) ( not ( = ?auto_565229 ?auto_565235 ) ) ( not ( = ?auto_565229 ?auto_565236 ) ) ( not ( = ?auto_565229 ?auto_565237 ) ) ( not ( = ?auto_565229 ?auto_565238 ) ) ( not ( = ?auto_565229 ?auto_565239 ) ) ( not ( = ?auto_565229 ?auto_565240 ) ) ( not ( = ?auto_565229 ?auto_565241 ) ) ( not ( = ?auto_565229 ?auto_565242 ) ) ( not ( = ?auto_565230 ?auto_565231 ) ) ( not ( = ?auto_565230 ?auto_565232 ) ) ( not ( = ?auto_565230 ?auto_565233 ) ) ( not ( = ?auto_565230 ?auto_565234 ) ) ( not ( = ?auto_565230 ?auto_565235 ) ) ( not ( = ?auto_565230 ?auto_565236 ) ) ( not ( = ?auto_565230 ?auto_565237 ) ) ( not ( = ?auto_565230 ?auto_565238 ) ) ( not ( = ?auto_565230 ?auto_565239 ) ) ( not ( = ?auto_565230 ?auto_565240 ) ) ( not ( = ?auto_565230 ?auto_565241 ) ) ( not ( = ?auto_565230 ?auto_565242 ) ) ( not ( = ?auto_565231 ?auto_565232 ) ) ( not ( = ?auto_565231 ?auto_565233 ) ) ( not ( = ?auto_565231 ?auto_565234 ) ) ( not ( = ?auto_565231 ?auto_565235 ) ) ( not ( = ?auto_565231 ?auto_565236 ) ) ( not ( = ?auto_565231 ?auto_565237 ) ) ( not ( = ?auto_565231 ?auto_565238 ) ) ( not ( = ?auto_565231 ?auto_565239 ) ) ( not ( = ?auto_565231 ?auto_565240 ) ) ( not ( = ?auto_565231 ?auto_565241 ) ) ( not ( = ?auto_565231 ?auto_565242 ) ) ( not ( = ?auto_565232 ?auto_565233 ) ) ( not ( = ?auto_565232 ?auto_565234 ) ) ( not ( = ?auto_565232 ?auto_565235 ) ) ( not ( = ?auto_565232 ?auto_565236 ) ) ( not ( = ?auto_565232 ?auto_565237 ) ) ( not ( = ?auto_565232 ?auto_565238 ) ) ( not ( = ?auto_565232 ?auto_565239 ) ) ( not ( = ?auto_565232 ?auto_565240 ) ) ( not ( = ?auto_565232 ?auto_565241 ) ) ( not ( = ?auto_565232 ?auto_565242 ) ) ( not ( = ?auto_565233 ?auto_565234 ) ) ( not ( = ?auto_565233 ?auto_565235 ) ) ( not ( = ?auto_565233 ?auto_565236 ) ) ( not ( = ?auto_565233 ?auto_565237 ) ) ( not ( = ?auto_565233 ?auto_565238 ) ) ( not ( = ?auto_565233 ?auto_565239 ) ) ( not ( = ?auto_565233 ?auto_565240 ) ) ( not ( = ?auto_565233 ?auto_565241 ) ) ( not ( = ?auto_565233 ?auto_565242 ) ) ( not ( = ?auto_565234 ?auto_565235 ) ) ( not ( = ?auto_565234 ?auto_565236 ) ) ( not ( = ?auto_565234 ?auto_565237 ) ) ( not ( = ?auto_565234 ?auto_565238 ) ) ( not ( = ?auto_565234 ?auto_565239 ) ) ( not ( = ?auto_565234 ?auto_565240 ) ) ( not ( = ?auto_565234 ?auto_565241 ) ) ( not ( = ?auto_565234 ?auto_565242 ) ) ( not ( = ?auto_565235 ?auto_565236 ) ) ( not ( = ?auto_565235 ?auto_565237 ) ) ( not ( = ?auto_565235 ?auto_565238 ) ) ( not ( = ?auto_565235 ?auto_565239 ) ) ( not ( = ?auto_565235 ?auto_565240 ) ) ( not ( = ?auto_565235 ?auto_565241 ) ) ( not ( = ?auto_565235 ?auto_565242 ) ) ( not ( = ?auto_565236 ?auto_565237 ) ) ( not ( = ?auto_565236 ?auto_565238 ) ) ( not ( = ?auto_565236 ?auto_565239 ) ) ( not ( = ?auto_565236 ?auto_565240 ) ) ( not ( = ?auto_565236 ?auto_565241 ) ) ( not ( = ?auto_565236 ?auto_565242 ) ) ( not ( = ?auto_565237 ?auto_565238 ) ) ( not ( = ?auto_565237 ?auto_565239 ) ) ( not ( = ?auto_565237 ?auto_565240 ) ) ( not ( = ?auto_565237 ?auto_565241 ) ) ( not ( = ?auto_565237 ?auto_565242 ) ) ( not ( = ?auto_565238 ?auto_565239 ) ) ( not ( = ?auto_565238 ?auto_565240 ) ) ( not ( = ?auto_565238 ?auto_565241 ) ) ( not ( = ?auto_565238 ?auto_565242 ) ) ( not ( = ?auto_565239 ?auto_565240 ) ) ( not ( = ?auto_565239 ?auto_565241 ) ) ( not ( = ?auto_565239 ?auto_565242 ) ) ( not ( = ?auto_565240 ?auto_565241 ) ) ( not ( = ?auto_565240 ?auto_565242 ) ) ( not ( = ?auto_565241 ?auto_565242 ) ) ( ON ?auto_565240 ?auto_565241 ) ( ON ?auto_565239 ?auto_565240 ) ( ON ?auto_565238 ?auto_565239 ) ( ON ?auto_565237 ?auto_565238 ) ( ON ?auto_565236 ?auto_565237 ) ( ON ?auto_565235 ?auto_565236 ) ( ON ?auto_565234 ?auto_565235 ) ( ON ?auto_565233 ?auto_565234 ) ( ON ?auto_565232 ?auto_565233 ) ( ON ?auto_565231 ?auto_565232 ) ( ON ?auto_565230 ?auto_565231 ) ( ON ?auto_565229 ?auto_565230 ) ( ON ?auto_565228 ?auto_565229 ) ( ON ?auto_565227 ?auto_565228 ) ( ON ?auto_565226 ?auto_565227 ) ( CLEAR ?auto_565226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565226 )
      ( MAKE-16PILE ?auto_565226 ?auto_565227 ?auto_565228 ?auto_565229 ?auto_565230 ?auto_565231 ?auto_565232 ?auto_565233 ?auto_565234 ?auto_565235 ?auto_565236 ?auto_565237 ?auto_565238 ?auto_565239 ?auto_565240 ?auto_565241 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565259 - BLOCK
      ?auto_565260 - BLOCK
      ?auto_565261 - BLOCK
      ?auto_565262 - BLOCK
      ?auto_565263 - BLOCK
      ?auto_565264 - BLOCK
      ?auto_565265 - BLOCK
      ?auto_565266 - BLOCK
      ?auto_565267 - BLOCK
      ?auto_565268 - BLOCK
      ?auto_565269 - BLOCK
      ?auto_565270 - BLOCK
      ?auto_565271 - BLOCK
      ?auto_565272 - BLOCK
      ?auto_565273 - BLOCK
      ?auto_565274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_565274 ) ( not ( = ?auto_565259 ?auto_565260 ) ) ( not ( = ?auto_565259 ?auto_565261 ) ) ( not ( = ?auto_565259 ?auto_565262 ) ) ( not ( = ?auto_565259 ?auto_565263 ) ) ( not ( = ?auto_565259 ?auto_565264 ) ) ( not ( = ?auto_565259 ?auto_565265 ) ) ( not ( = ?auto_565259 ?auto_565266 ) ) ( not ( = ?auto_565259 ?auto_565267 ) ) ( not ( = ?auto_565259 ?auto_565268 ) ) ( not ( = ?auto_565259 ?auto_565269 ) ) ( not ( = ?auto_565259 ?auto_565270 ) ) ( not ( = ?auto_565259 ?auto_565271 ) ) ( not ( = ?auto_565259 ?auto_565272 ) ) ( not ( = ?auto_565259 ?auto_565273 ) ) ( not ( = ?auto_565259 ?auto_565274 ) ) ( not ( = ?auto_565260 ?auto_565261 ) ) ( not ( = ?auto_565260 ?auto_565262 ) ) ( not ( = ?auto_565260 ?auto_565263 ) ) ( not ( = ?auto_565260 ?auto_565264 ) ) ( not ( = ?auto_565260 ?auto_565265 ) ) ( not ( = ?auto_565260 ?auto_565266 ) ) ( not ( = ?auto_565260 ?auto_565267 ) ) ( not ( = ?auto_565260 ?auto_565268 ) ) ( not ( = ?auto_565260 ?auto_565269 ) ) ( not ( = ?auto_565260 ?auto_565270 ) ) ( not ( = ?auto_565260 ?auto_565271 ) ) ( not ( = ?auto_565260 ?auto_565272 ) ) ( not ( = ?auto_565260 ?auto_565273 ) ) ( not ( = ?auto_565260 ?auto_565274 ) ) ( not ( = ?auto_565261 ?auto_565262 ) ) ( not ( = ?auto_565261 ?auto_565263 ) ) ( not ( = ?auto_565261 ?auto_565264 ) ) ( not ( = ?auto_565261 ?auto_565265 ) ) ( not ( = ?auto_565261 ?auto_565266 ) ) ( not ( = ?auto_565261 ?auto_565267 ) ) ( not ( = ?auto_565261 ?auto_565268 ) ) ( not ( = ?auto_565261 ?auto_565269 ) ) ( not ( = ?auto_565261 ?auto_565270 ) ) ( not ( = ?auto_565261 ?auto_565271 ) ) ( not ( = ?auto_565261 ?auto_565272 ) ) ( not ( = ?auto_565261 ?auto_565273 ) ) ( not ( = ?auto_565261 ?auto_565274 ) ) ( not ( = ?auto_565262 ?auto_565263 ) ) ( not ( = ?auto_565262 ?auto_565264 ) ) ( not ( = ?auto_565262 ?auto_565265 ) ) ( not ( = ?auto_565262 ?auto_565266 ) ) ( not ( = ?auto_565262 ?auto_565267 ) ) ( not ( = ?auto_565262 ?auto_565268 ) ) ( not ( = ?auto_565262 ?auto_565269 ) ) ( not ( = ?auto_565262 ?auto_565270 ) ) ( not ( = ?auto_565262 ?auto_565271 ) ) ( not ( = ?auto_565262 ?auto_565272 ) ) ( not ( = ?auto_565262 ?auto_565273 ) ) ( not ( = ?auto_565262 ?auto_565274 ) ) ( not ( = ?auto_565263 ?auto_565264 ) ) ( not ( = ?auto_565263 ?auto_565265 ) ) ( not ( = ?auto_565263 ?auto_565266 ) ) ( not ( = ?auto_565263 ?auto_565267 ) ) ( not ( = ?auto_565263 ?auto_565268 ) ) ( not ( = ?auto_565263 ?auto_565269 ) ) ( not ( = ?auto_565263 ?auto_565270 ) ) ( not ( = ?auto_565263 ?auto_565271 ) ) ( not ( = ?auto_565263 ?auto_565272 ) ) ( not ( = ?auto_565263 ?auto_565273 ) ) ( not ( = ?auto_565263 ?auto_565274 ) ) ( not ( = ?auto_565264 ?auto_565265 ) ) ( not ( = ?auto_565264 ?auto_565266 ) ) ( not ( = ?auto_565264 ?auto_565267 ) ) ( not ( = ?auto_565264 ?auto_565268 ) ) ( not ( = ?auto_565264 ?auto_565269 ) ) ( not ( = ?auto_565264 ?auto_565270 ) ) ( not ( = ?auto_565264 ?auto_565271 ) ) ( not ( = ?auto_565264 ?auto_565272 ) ) ( not ( = ?auto_565264 ?auto_565273 ) ) ( not ( = ?auto_565264 ?auto_565274 ) ) ( not ( = ?auto_565265 ?auto_565266 ) ) ( not ( = ?auto_565265 ?auto_565267 ) ) ( not ( = ?auto_565265 ?auto_565268 ) ) ( not ( = ?auto_565265 ?auto_565269 ) ) ( not ( = ?auto_565265 ?auto_565270 ) ) ( not ( = ?auto_565265 ?auto_565271 ) ) ( not ( = ?auto_565265 ?auto_565272 ) ) ( not ( = ?auto_565265 ?auto_565273 ) ) ( not ( = ?auto_565265 ?auto_565274 ) ) ( not ( = ?auto_565266 ?auto_565267 ) ) ( not ( = ?auto_565266 ?auto_565268 ) ) ( not ( = ?auto_565266 ?auto_565269 ) ) ( not ( = ?auto_565266 ?auto_565270 ) ) ( not ( = ?auto_565266 ?auto_565271 ) ) ( not ( = ?auto_565266 ?auto_565272 ) ) ( not ( = ?auto_565266 ?auto_565273 ) ) ( not ( = ?auto_565266 ?auto_565274 ) ) ( not ( = ?auto_565267 ?auto_565268 ) ) ( not ( = ?auto_565267 ?auto_565269 ) ) ( not ( = ?auto_565267 ?auto_565270 ) ) ( not ( = ?auto_565267 ?auto_565271 ) ) ( not ( = ?auto_565267 ?auto_565272 ) ) ( not ( = ?auto_565267 ?auto_565273 ) ) ( not ( = ?auto_565267 ?auto_565274 ) ) ( not ( = ?auto_565268 ?auto_565269 ) ) ( not ( = ?auto_565268 ?auto_565270 ) ) ( not ( = ?auto_565268 ?auto_565271 ) ) ( not ( = ?auto_565268 ?auto_565272 ) ) ( not ( = ?auto_565268 ?auto_565273 ) ) ( not ( = ?auto_565268 ?auto_565274 ) ) ( not ( = ?auto_565269 ?auto_565270 ) ) ( not ( = ?auto_565269 ?auto_565271 ) ) ( not ( = ?auto_565269 ?auto_565272 ) ) ( not ( = ?auto_565269 ?auto_565273 ) ) ( not ( = ?auto_565269 ?auto_565274 ) ) ( not ( = ?auto_565270 ?auto_565271 ) ) ( not ( = ?auto_565270 ?auto_565272 ) ) ( not ( = ?auto_565270 ?auto_565273 ) ) ( not ( = ?auto_565270 ?auto_565274 ) ) ( not ( = ?auto_565271 ?auto_565272 ) ) ( not ( = ?auto_565271 ?auto_565273 ) ) ( not ( = ?auto_565271 ?auto_565274 ) ) ( not ( = ?auto_565272 ?auto_565273 ) ) ( not ( = ?auto_565272 ?auto_565274 ) ) ( not ( = ?auto_565273 ?auto_565274 ) ) ( ON ?auto_565273 ?auto_565274 ) ( ON ?auto_565272 ?auto_565273 ) ( ON ?auto_565271 ?auto_565272 ) ( ON ?auto_565270 ?auto_565271 ) ( ON ?auto_565269 ?auto_565270 ) ( ON ?auto_565268 ?auto_565269 ) ( ON ?auto_565267 ?auto_565268 ) ( ON ?auto_565266 ?auto_565267 ) ( ON ?auto_565265 ?auto_565266 ) ( ON ?auto_565264 ?auto_565265 ) ( ON ?auto_565263 ?auto_565264 ) ( ON ?auto_565262 ?auto_565263 ) ( ON ?auto_565261 ?auto_565262 ) ( ON ?auto_565260 ?auto_565261 ) ( ON ?auto_565259 ?auto_565260 ) ( CLEAR ?auto_565259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565259 )
      ( MAKE-16PILE ?auto_565259 ?auto_565260 ?auto_565261 ?auto_565262 ?auto_565263 ?auto_565264 ?auto_565265 ?auto_565266 ?auto_565267 ?auto_565268 ?auto_565269 ?auto_565270 ?auto_565271 ?auto_565272 ?auto_565273 ?auto_565274 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_565291 - BLOCK
      ?auto_565292 - BLOCK
      ?auto_565293 - BLOCK
      ?auto_565294 - BLOCK
      ?auto_565295 - BLOCK
      ?auto_565296 - BLOCK
      ?auto_565297 - BLOCK
      ?auto_565298 - BLOCK
      ?auto_565299 - BLOCK
      ?auto_565300 - BLOCK
      ?auto_565301 - BLOCK
      ?auto_565302 - BLOCK
      ?auto_565303 - BLOCK
      ?auto_565304 - BLOCK
      ?auto_565305 - BLOCK
      ?auto_565306 - BLOCK
    )
    :vars
    (
      ?auto_565307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_565291 ?auto_565292 ) ) ( not ( = ?auto_565291 ?auto_565293 ) ) ( not ( = ?auto_565291 ?auto_565294 ) ) ( not ( = ?auto_565291 ?auto_565295 ) ) ( not ( = ?auto_565291 ?auto_565296 ) ) ( not ( = ?auto_565291 ?auto_565297 ) ) ( not ( = ?auto_565291 ?auto_565298 ) ) ( not ( = ?auto_565291 ?auto_565299 ) ) ( not ( = ?auto_565291 ?auto_565300 ) ) ( not ( = ?auto_565291 ?auto_565301 ) ) ( not ( = ?auto_565291 ?auto_565302 ) ) ( not ( = ?auto_565291 ?auto_565303 ) ) ( not ( = ?auto_565291 ?auto_565304 ) ) ( not ( = ?auto_565291 ?auto_565305 ) ) ( not ( = ?auto_565291 ?auto_565306 ) ) ( not ( = ?auto_565292 ?auto_565293 ) ) ( not ( = ?auto_565292 ?auto_565294 ) ) ( not ( = ?auto_565292 ?auto_565295 ) ) ( not ( = ?auto_565292 ?auto_565296 ) ) ( not ( = ?auto_565292 ?auto_565297 ) ) ( not ( = ?auto_565292 ?auto_565298 ) ) ( not ( = ?auto_565292 ?auto_565299 ) ) ( not ( = ?auto_565292 ?auto_565300 ) ) ( not ( = ?auto_565292 ?auto_565301 ) ) ( not ( = ?auto_565292 ?auto_565302 ) ) ( not ( = ?auto_565292 ?auto_565303 ) ) ( not ( = ?auto_565292 ?auto_565304 ) ) ( not ( = ?auto_565292 ?auto_565305 ) ) ( not ( = ?auto_565292 ?auto_565306 ) ) ( not ( = ?auto_565293 ?auto_565294 ) ) ( not ( = ?auto_565293 ?auto_565295 ) ) ( not ( = ?auto_565293 ?auto_565296 ) ) ( not ( = ?auto_565293 ?auto_565297 ) ) ( not ( = ?auto_565293 ?auto_565298 ) ) ( not ( = ?auto_565293 ?auto_565299 ) ) ( not ( = ?auto_565293 ?auto_565300 ) ) ( not ( = ?auto_565293 ?auto_565301 ) ) ( not ( = ?auto_565293 ?auto_565302 ) ) ( not ( = ?auto_565293 ?auto_565303 ) ) ( not ( = ?auto_565293 ?auto_565304 ) ) ( not ( = ?auto_565293 ?auto_565305 ) ) ( not ( = ?auto_565293 ?auto_565306 ) ) ( not ( = ?auto_565294 ?auto_565295 ) ) ( not ( = ?auto_565294 ?auto_565296 ) ) ( not ( = ?auto_565294 ?auto_565297 ) ) ( not ( = ?auto_565294 ?auto_565298 ) ) ( not ( = ?auto_565294 ?auto_565299 ) ) ( not ( = ?auto_565294 ?auto_565300 ) ) ( not ( = ?auto_565294 ?auto_565301 ) ) ( not ( = ?auto_565294 ?auto_565302 ) ) ( not ( = ?auto_565294 ?auto_565303 ) ) ( not ( = ?auto_565294 ?auto_565304 ) ) ( not ( = ?auto_565294 ?auto_565305 ) ) ( not ( = ?auto_565294 ?auto_565306 ) ) ( not ( = ?auto_565295 ?auto_565296 ) ) ( not ( = ?auto_565295 ?auto_565297 ) ) ( not ( = ?auto_565295 ?auto_565298 ) ) ( not ( = ?auto_565295 ?auto_565299 ) ) ( not ( = ?auto_565295 ?auto_565300 ) ) ( not ( = ?auto_565295 ?auto_565301 ) ) ( not ( = ?auto_565295 ?auto_565302 ) ) ( not ( = ?auto_565295 ?auto_565303 ) ) ( not ( = ?auto_565295 ?auto_565304 ) ) ( not ( = ?auto_565295 ?auto_565305 ) ) ( not ( = ?auto_565295 ?auto_565306 ) ) ( not ( = ?auto_565296 ?auto_565297 ) ) ( not ( = ?auto_565296 ?auto_565298 ) ) ( not ( = ?auto_565296 ?auto_565299 ) ) ( not ( = ?auto_565296 ?auto_565300 ) ) ( not ( = ?auto_565296 ?auto_565301 ) ) ( not ( = ?auto_565296 ?auto_565302 ) ) ( not ( = ?auto_565296 ?auto_565303 ) ) ( not ( = ?auto_565296 ?auto_565304 ) ) ( not ( = ?auto_565296 ?auto_565305 ) ) ( not ( = ?auto_565296 ?auto_565306 ) ) ( not ( = ?auto_565297 ?auto_565298 ) ) ( not ( = ?auto_565297 ?auto_565299 ) ) ( not ( = ?auto_565297 ?auto_565300 ) ) ( not ( = ?auto_565297 ?auto_565301 ) ) ( not ( = ?auto_565297 ?auto_565302 ) ) ( not ( = ?auto_565297 ?auto_565303 ) ) ( not ( = ?auto_565297 ?auto_565304 ) ) ( not ( = ?auto_565297 ?auto_565305 ) ) ( not ( = ?auto_565297 ?auto_565306 ) ) ( not ( = ?auto_565298 ?auto_565299 ) ) ( not ( = ?auto_565298 ?auto_565300 ) ) ( not ( = ?auto_565298 ?auto_565301 ) ) ( not ( = ?auto_565298 ?auto_565302 ) ) ( not ( = ?auto_565298 ?auto_565303 ) ) ( not ( = ?auto_565298 ?auto_565304 ) ) ( not ( = ?auto_565298 ?auto_565305 ) ) ( not ( = ?auto_565298 ?auto_565306 ) ) ( not ( = ?auto_565299 ?auto_565300 ) ) ( not ( = ?auto_565299 ?auto_565301 ) ) ( not ( = ?auto_565299 ?auto_565302 ) ) ( not ( = ?auto_565299 ?auto_565303 ) ) ( not ( = ?auto_565299 ?auto_565304 ) ) ( not ( = ?auto_565299 ?auto_565305 ) ) ( not ( = ?auto_565299 ?auto_565306 ) ) ( not ( = ?auto_565300 ?auto_565301 ) ) ( not ( = ?auto_565300 ?auto_565302 ) ) ( not ( = ?auto_565300 ?auto_565303 ) ) ( not ( = ?auto_565300 ?auto_565304 ) ) ( not ( = ?auto_565300 ?auto_565305 ) ) ( not ( = ?auto_565300 ?auto_565306 ) ) ( not ( = ?auto_565301 ?auto_565302 ) ) ( not ( = ?auto_565301 ?auto_565303 ) ) ( not ( = ?auto_565301 ?auto_565304 ) ) ( not ( = ?auto_565301 ?auto_565305 ) ) ( not ( = ?auto_565301 ?auto_565306 ) ) ( not ( = ?auto_565302 ?auto_565303 ) ) ( not ( = ?auto_565302 ?auto_565304 ) ) ( not ( = ?auto_565302 ?auto_565305 ) ) ( not ( = ?auto_565302 ?auto_565306 ) ) ( not ( = ?auto_565303 ?auto_565304 ) ) ( not ( = ?auto_565303 ?auto_565305 ) ) ( not ( = ?auto_565303 ?auto_565306 ) ) ( not ( = ?auto_565304 ?auto_565305 ) ) ( not ( = ?auto_565304 ?auto_565306 ) ) ( not ( = ?auto_565305 ?auto_565306 ) ) ( ON ?auto_565291 ?auto_565307 ) ( not ( = ?auto_565306 ?auto_565307 ) ) ( not ( = ?auto_565305 ?auto_565307 ) ) ( not ( = ?auto_565304 ?auto_565307 ) ) ( not ( = ?auto_565303 ?auto_565307 ) ) ( not ( = ?auto_565302 ?auto_565307 ) ) ( not ( = ?auto_565301 ?auto_565307 ) ) ( not ( = ?auto_565300 ?auto_565307 ) ) ( not ( = ?auto_565299 ?auto_565307 ) ) ( not ( = ?auto_565298 ?auto_565307 ) ) ( not ( = ?auto_565297 ?auto_565307 ) ) ( not ( = ?auto_565296 ?auto_565307 ) ) ( not ( = ?auto_565295 ?auto_565307 ) ) ( not ( = ?auto_565294 ?auto_565307 ) ) ( not ( = ?auto_565293 ?auto_565307 ) ) ( not ( = ?auto_565292 ?auto_565307 ) ) ( not ( = ?auto_565291 ?auto_565307 ) ) ( ON ?auto_565292 ?auto_565291 ) ( ON ?auto_565293 ?auto_565292 ) ( ON ?auto_565294 ?auto_565293 ) ( ON ?auto_565295 ?auto_565294 ) ( ON ?auto_565296 ?auto_565295 ) ( ON ?auto_565297 ?auto_565296 ) ( ON ?auto_565298 ?auto_565297 ) ( ON ?auto_565299 ?auto_565298 ) ( ON ?auto_565300 ?auto_565299 ) ( ON ?auto_565301 ?auto_565300 ) ( ON ?auto_565302 ?auto_565301 ) ( ON ?auto_565303 ?auto_565302 ) ( ON ?auto_565304 ?auto_565303 ) ( ON ?auto_565305 ?auto_565304 ) ( ON ?auto_565306 ?auto_565305 ) ( CLEAR ?auto_565306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_565306 ?auto_565305 ?auto_565304 ?auto_565303 ?auto_565302 ?auto_565301 ?auto_565300 ?auto_565299 ?auto_565298 ?auto_565297 ?auto_565296 ?auto_565295 ?auto_565294 ?auto_565293 ?auto_565292 ?auto_565291 )
      ( MAKE-16PILE ?auto_565291 ?auto_565292 ?auto_565293 ?auto_565294 ?auto_565295 ?auto_565296 ?auto_565297 ?auto_565298 ?auto_565299 ?auto_565300 ?auto_565301 ?auto_565302 ?auto_565303 ?auto_565304 ?auto_565305 ?auto_565306 ) )
  )

)

