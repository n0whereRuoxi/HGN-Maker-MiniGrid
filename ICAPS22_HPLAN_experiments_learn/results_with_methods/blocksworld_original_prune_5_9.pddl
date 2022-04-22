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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24198 - BLOCK
      ?auto_24199 - BLOCK
      ?auto_24200 - BLOCK
      ?auto_24201 - BLOCK
      ?auto_24202 - BLOCK
    )
    :vars
    (
      ?auto_24203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24203 ?auto_24202 ) ( CLEAR ?auto_24203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24198 ) ( ON ?auto_24199 ?auto_24198 ) ( ON ?auto_24200 ?auto_24199 ) ( ON ?auto_24201 ?auto_24200 ) ( ON ?auto_24202 ?auto_24201 ) ( not ( = ?auto_24198 ?auto_24199 ) ) ( not ( = ?auto_24198 ?auto_24200 ) ) ( not ( = ?auto_24198 ?auto_24201 ) ) ( not ( = ?auto_24198 ?auto_24202 ) ) ( not ( = ?auto_24198 ?auto_24203 ) ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24199 ?auto_24201 ) ) ( not ( = ?auto_24199 ?auto_24202 ) ) ( not ( = ?auto_24199 ?auto_24203 ) ) ( not ( = ?auto_24200 ?auto_24201 ) ) ( not ( = ?auto_24200 ?auto_24202 ) ) ( not ( = ?auto_24200 ?auto_24203 ) ) ( not ( = ?auto_24201 ?auto_24202 ) ) ( not ( = ?auto_24201 ?auto_24203 ) ) ( not ( = ?auto_24202 ?auto_24203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24203 ?auto_24202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24205 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24205 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24206 - BLOCK
    )
    :vars
    (
      ?auto_24207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24206 ?auto_24207 ) ( CLEAR ?auto_24206 ) ( HAND-EMPTY ) ( not ( = ?auto_24206 ?auto_24207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24206 ?auto_24207 )
      ( MAKE-1PILE ?auto_24206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24212 - BLOCK
      ?auto_24213 - BLOCK
      ?auto_24214 - BLOCK
      ?auto_24215 - BLOCK
    )
    :vars
    (
      ?auto_24216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24216 ?auto_24215 ) ( CLEAR ?auto_24216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24212 ) ( ON ?auto_24213 ?auto_24212 ) ( ON ?auto_24214 ?auto_24213 ) ( ON ?auto_24215 ?auto_24214 ) ( not ( = ?auto_24212 ?auto_24213 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24212 ?auto_24215 ) ) ( not ( = ?auto_24212 ?auto_24216 ) ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( not ( = ?auto_24213 ?auto_24216 ) ) ( not ( = ?auto_24214 ?auto_24215 ) ) ( not ( = ?auto_24214 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24216 ?auto_24215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24217 - BLOCK
      ?auto_24218 - BLOCK
      ?auto_24219 - BLOCK
      ?auto_24220 - BLOCK
    )
    :vars
    (
      ?auto_24221 - BLOCK
      ?auto_24222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24221 ?auto_24220 ) ( CLEAR ?auto_24221 ) ( ON-TABLE ?auto_24217 ) ( ON ?auto_24218 ?auto_24217 ) ( ON ?auto_24219 ?auto_24218 ) ( ON ?auto_24220 ?auto_24219 ) ( not ( = ?auto_24217 ?auto_24218 ) ) ( not ( = ?auto_24217 ?auto_24219 ) ) ( not ( = ?auto_24217 ?auto_24220 ) ) ( not ( = ?auto_24217 ?auto_24221 ) ) ( not ( = ?auto_24218 ?auto_24219 ) ) ( not ( = ?auto_24218 ?auto_24220 ) ) ( not ( = ?auto_24218 ?auto_24221 ) ) ( not ( = ?auto_24219 ?auto_24220 ) ) ( not ( = ?auto_24219 ?auto_24221 ) ) ( not ( = ?auto_24220 ?auto_24221 ) ) ( HOLDING ?auto_24222 ) ( not ( = ?auto_24217 ?auto_24222 ) ) ( not ( = ?auto_24218 ?auto_24222 ) ) ( not ( = ?auto_24219 ?auto_24222 ) ) ( not ( = ?auto_24220 ?auto_24222 ) ) ( not ( = ?auto_24221 ?auto_24222 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24222 )
      ( MAKE-4PILE ?auto_24217 ?auto_24218 ?auto_24219 ?auto_24220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24223 - BLOCK
      ?auto_24224 - BLOCK
      ?auto_24225 - BLOCK
      ?auto_24226 - BLOCK
    )
    :vars
    (
      ?auto_24228 - BLOCK
      ?auto_24227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24228 ?auto_24226 ) ( ON-TABLE ?auto_24223 ) ( ON ?auto_24224 ?auto_24223 ) ( ON ?auto_24225 ?auto_24224 ) ( ON ?auto_24226 ?auto_24225 ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( not ( = ?auto_24223 ?auto_24225 ) ) ( not ( = ?auto_24223 ?auto_24226 ) ) ( not ( = ?auto_24223 ?auto_24228 ) ) ( not ( = ?auto_24224 ?auto_24225 ) ) ( not ( = ?auto_24224 ?auto_24226 ) ) ( not ( = ?auto_24224 ?auto_24228 ) ) ( not ( = ?auto_24225 ?auto_24226 ) ) ( not ( = ?auto_24225 ?auto_24228 ) ) ( not ( = ?auto_24226 ?auto_24228 ) ) ( not ( = ?auto_24223 ?auto_24227 ) ) ( not ( = ?auto_24224 ?auto_24227 ) ) ( not ( = ?auto_24225 ?auto_24227 ) ) ( not ( = ?auto_24226 ?auto_24227 ) ) ( not ( = ?auto_24228 ?auto_24227 ) ) ( ON ?auto_24227 ?auto_24228 ) ( CLEAR ?auto_24227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24223 ?auto_24224 ?auto_24225 ?auto_24226 ?auto_24228 )
      ( MAKE-4PILE ?auto_24223 ?auto_24224 ?auto_24225 ?auto_24226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24231 - BLOCK
      ?auto_24232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24232 ) ( CLEAR ?auto_24231 ) ( ON-TABLE ?auto_24231 ) ( not ( = ?auto_24231 ?auto_24232 ) ) )
    :subtasks
    ( ( !STACK ?auto_24232 ?auto_24231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24233 - BLOCK
      ?auto_24234 - BLOCK
    )
    :vars
    (
      ?auto_24235 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24233 ) ( ON-TABLE ?auto_24233 ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( ON ?auto_24234 ?auto_24235 ) ( CLEAR ?auto_24234 ) ( HAND-EMPTY ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24234 ?auto_24235 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24234 ?auto_24235 )
      ( MAKE-2PILE ?auto_24233 ?auto_24234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24236 - BLOCK
      ?auto_24237 - BLOCK
    )
    :vars
    (
      ?auto_24238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24236 ?auto_24237 ) ) ( ON ?auto_24237 ?auto_24238 ) ( CLEAR ?auto_24237 ) ( not ( = ?auto_24236 ?auto_24238 ) ) ( not ( = ?auto_24237 ?auto_24238 ) ) ( HOLDING ?auto_24236 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24236 )
      ( MAKE-2PILE ?auto_24236 ?auto_24237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24239 - BLOCK
      ?auto_24240 - BLOCK
    )
    :vars
    (
      ?auto_24241 - BLOCK
      ?auto_24243 - BLOCK
      ?auto_24244 - BLOCK
      ?auto_24242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24239 ?auto_24240 ) ) ( ON ?auto_24240 ?auto_24241 ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( ON ?auto_24239 ?auto_24240 ) ( CLEAR ?auto_24239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24243 ) ( ON ?auto_24244 ?auto_24243 ) ( ON ?auto_24242 ?auto_24244 ) ( ON ?auto_24241 ?auto_24242 ) ( not ( = ?auto_24243 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24242 ) ) ( not ( = ?auto_24243 ?auto_24241 ) ) ( not ( = ?auto_24243 ?auto_24240 ) ) ( not ( = ?auto_24243 ?auto_24239 ) ) ( not ( = ?auto_24244 ?auto_24242 ) ) ( not ( = ?auto_24244 ?auto_24241 ) ) ( not ( = ?auto_24244 ?auto_24240 ) ) ( not ( = ?auto_24244 ?auto_24239 ) ) ( not ( = ?auto_24242 ?auto_24241 ) ) ( not ( = ?auto_24242 ?auto_24240 ) ) ( not ( = ?auto_24242 ?auto_24239 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24243 ?auto_24244 ?auto_24242 ?auto_24241 ?auto_24240 )
      ( MAKE-2PILE ?auto_24239 ?auto_24240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24248 - BLOCK
      ?auto_24249 - BLOCK
      ?auto_24250 - BLOCK
    )
    :vars
    (
      ?auto_24251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24251 ?auto_24250 ) ( CLEAR ?auto_24251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24248 ) ( ON ?auto_24249 ?auto_24248 ) ( ON ?auto_24250 ?auto_24249 ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( not ( = ?auto_24248 ?auto_24250 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24249 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24251 ) ) ( not ( = ?auto_24250 ?auto_24251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24251 ?auto_24250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24252 - BLOCK
      ?auto_24253 - BLOCK
      ?auto_24254 - BLOCK
    )
    :vars
    (
      ?auto_24255 - BLOCK
      ?auto_24256 - BLOCK
      ?auto_24257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24255 ?auto_24254 ) ( CLEAR ?auto_24255 ) ( ON-TABLE ?auto_24252 ) ( ON ?auto_24253 ?auto_24252 ) ( ON ?auto_24254 ?auto_24253 ) ( not ( = ?auto_24252 ?auto_24253 ) ) ( not ( = ?auto_24252 ?auto_24254 ) ) ( not ( = ?auto_24252 ?auto_24255 ) ) ( not ( = ?auto_24253 ?auto_24254 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( HOLDING ?auto_24256 ) ( CLEAR ?auto_24257 ) ( not ( = ?auto_24252 ?auto_24256 ) ) ( not ( = ?auto_24252 ?auto_24257 ) ) ( not ( = ?auto_24253 ?auto_24256 ) ) ( not ( = ?auto_24253 ?auto_24257 ) ) ( not ( = ?auto_24254 ?auto_24256 ) ) ( not ( = ?auto_24254 ?auto_24257 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24257 ) ) ( not ( = ?auto_24256 ?auto_24257 ) ) )
    :subtasks
    ( ( !STACK ?auto_24256 ?auto_24257 )
      ( MAKE-3PILE ?auto_24252 ?auto_24253 ?auto_24254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24620 - BLOCK
      ?auto_24621 - BLOCK
      ?auto_24622 - BLOCK
    )
    :vars
    (
      ?auto_24624 - BLOCK
      ?auto_24623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24624 ?auto_24622 ) ( ON-TABLE ?auto_24620 ) ( ON ?auto_24621 ?auto_24620 ) ( ON ?auto_24622 ?auto_24621 ) ( not ( = ?auto_24620 ?auto_24621 ) ) ( not ( = ?auto_24620 ?auto_24622 ) ) ( not ( = ?auto_24620 ?auto_24624 ) ) ( not ( = ?auto_24621 ?auto_24622 ) ) ( not ( = ?auto_24621 ?auto_24624 ) ) ( not ( = ?auto_24622 ?auto_24624 ) ) ( not ( = ?auto_24620 ?auto_24623 ) ) ( not ( = ?auto_24621 ?auto_24623 ) ) ( not ( = ?auto_24622 ?auto_24623 ) ) ( not ( = ?auto_24624 ?auto_24623 ) ) ( ON ?auto_24623 ?auto_24624 ) ( CLEAR ?auto_24623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24620 ?auto_24621 ?auto_24622 ?auto_24624 )
      ( MAKE-3PILE ?auto_24620 ?auto_24621 ?auto_24622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24264 - BLOCK
      ?auto_24265 - BLOCK
      ?auto_24266 - BLOCK
    )
    :vars
    (
      ?auto_24267 - BLOCK
      ?auto_24268 - BLOCK
      ?auto_24269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24267 ?auto_24266 ) ( ON-TABLE ?auto_24264 ) ( ON ?auto_24265 ?auto_24264 ) ( ON ?auto_24266 ?auto_24265 ) ( not ( = ?auto_24264 ?auto_24265 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24264 ?auto_24267 ) ) ( not ( = ?auto_24265 ?auto_24266 ) ) ( not ( = ?auto_24265 ?auto_24267 ) ) ( not ( = ?auto_24266 ?auto_24267 ) ) ( not ( = ?auto_24264 ?auto_24268 ) ) ( not ( = ?auto_24264 ?auto_24269 ) ) ( not ( = ?auto_24265 ?auto_24268 ) ) ( not ( = ?auto_24265 ?auto_24269 ) ) ( not ( = ?auto_24266 ?auto_24268 ) ) ( not ( = ?auto_24266 ?auto_24269 ) ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( not ( = ?auto_24267 ?auto_24269 ) ) ( not ( = ?auto_24268 ?auto_24269 ) ) ( ON ?auto_24268 ?auto_24267 ) ( CLEAR ?auto_24268 ) ( HOLDING ?auto_24269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24269 )
      ( MAKE-3PILE ?auto_24264 ?auto_24265 ?auto_24266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24270 - BLOCK
      ?auto_24271 - BLOCK
      ?auto_24272 - BLOCK
    )
    :vars
    (
      ?auto_24275 - BLOCK
      ?auto_24273 - BLOCK
      ?auto_24274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24275 ?auto_24272 ) ( ON-TABLE ?auto_24270 ) ( ON ?auto_24271 ?auto_24270 ) ( ON ?auto_24272 ?auto_24271 ) ( not ( = ?auto_24270 ?auto_24271 ) ) ( not ( = ?auto_24270 ?auto_24272 ) ) ( not ( = ?auto_24270 ?auto_24275 ) ) ( not ( = ?auto_24271 ?auto_24272 ) ) ( not ( = ?auto_24271 ?auto_24275 ) ) ( not ( = ?auto_24272 ?auto_24275 ) ) ( not ( = ?auto_24270 ?auto_24273 ) ) ( not ( = ?auto_24270 ?auto_24274 ) ) ( not ( = ?auto_24271 ?auto_24273 ) ) ( not ( = ?auto_24271 ?auto_24274 ) ) ( not ( = ?auto_24272 ?auto_24273 ) ) ( not ( = ?auto_24272 ?auto_24274 ) ) ( not ( = ?auto_24275 ?auto_24273 ) ) ( not ( = ?auto_24275 ?auto_24274 ) ) ( not ( = ?auto_24273 ?auto_24274 ) ) ( ON ?auto_24273 ?auto_24275 ) ( ON ?auto_24274 ?auto_24273 ) ( CLEAR ?auto_24274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24270 ?auto_24271 ?auto_24272 ?auto_24275 ?auto_24273 )
      ( MAKE-3PILE ?auto_24270 ?auto_24271 ?auto_24272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24279 - BLOCK
      ?auto_24280 - BLOCK
      ?auto_24281 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24281 ) ( CLEAR ?auto_24280 ) ( ON-TABLE ?auto_24279 ) ( ON ?auto_24280 ?auto_24279 ) ( not ( = ?auto_24279 ?auto_24280 ) ) ( not ( = ?auto_24279 ?auto_24281 ) ) ( not ( = ?auto_24280 ?auto_24281 ) ) )
    :subtasks
    ( ( !STACK ?auto_24281 ?auto_24280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24282 - BLOCK
      ?auto_24283 - BLOCK
      ?auto_24284 - BLOCK
    )
    :vars
    (
      ?auto_24285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24283 ) ( ON-TABLE ?auto_24282 ) ( ON ?auto_24283 ?auto_24282 ) ( not ( = ?auto_24282 ?auto_24283 ) ) ( not ( = ?auto_24282 ?auto_24284 ) ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( ON ?auto_24284 ?auto_24285 ) ( CLEAR ?auto_24284 ) ( HAND-EMPTY ) ( not ( = ?auto_24282 ?auto_24285 ) ) ( not ( = ?auto_24283 ?auto_24285 ) ) ( not ( = ?auto_24284 ?auto_24285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24284 ?auto_24285 )
      ( MAKE-3PILE ?auto_24282 ?auto_24283 ?auto_24284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24286 - BLOCK
      ?auto_24287 - BLOCK
      ?auto_24288 - BLOCK
    )
    :vars
    (
      ?auto_24289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24286 ) ( not ( = ?auto_24286 ?auto_24287 ) ) ( not ( = ?auto_24286 ?auto_24288 ) ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( ON ?auto_24288 ?auto_24289 ) ( CLEAR ?auto_24288 ) ( not ( = ?auto_24286 ?auto_24289 ) ) ( not ( = ?auto_24287 ?auto_24289 ) ) ( not ( = ?auto_24288 ?auto_24289 ) ) ( HOLDING ?auto_24287 ) ( CLEAR ?auto_24286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24286 ?auto_24287 )
      ( MAKE-3PILE ?auto_24286 ?auto_24287 ?auto_24288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24290 - BLOCK
      ?auto_24291 - BLOCK
      ?auto_24292 - BLOCK
    )
    :vars
    (
      ?auto_24293 - BLOCK
      ?auto_24294 - BLOCK
      ?auto_24295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24290 ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( ON ?auto_24292 ?auto_24293 ) ( not ( = ?auto_24290 ?auto_24293 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( CLEAR ?auto_24290 ) ( ON ?auto_24291 ?auto_24292 ) ( CLEAR ?auto_24291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24294 ) ( ON ?auto_24295 ?auto_24294 ) ( ON ?auto_24293 ?auto_24295 ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24293 ) ) ( not ( = ?auto_24294 ?auto_24292 ) ) ( not ( = ?auto_24294 ?auto_24291 ) ) ( not ( = ?auto_24295 ?auto_24293 ) ) ( not ( = ?auto_24295 ?auto_24292 ) ) ( not ( = ?auto_24295 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24294 ) ) ( not ( = ?auto_24290 ?auto_24295 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24294 ?auto_24295 ?auto_24293 ?auto_24292 )
      ( MAKE-3PILE ?auto_24290 ?auto_24291 ?auto_24292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24296 - BLOCK
      ?auto_24297 - BLOCK
      ?auto_24298 - BLOCK
    )
    :vars
    (
      ?auto_24301 - BLOCK
      ?auto_24299 - BLOCK
      ?auto_24300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24296 ?auto_24297 ) ) ( not ( = ?auto_24296 ?auto_24298 ) ) ( not ( = ?auto_24297 ?auto_24298 ) ) ( ON ?auto_24298 ?auto_24301 ) ( not ( = ?auto_24296 ?auto_24301 ) ) ( not ( = ?auto_24297 ?auto_24301 ) ) ( not ( = ?auto_24298 ?auto_24301 ) ) ( ON ?auto_24297 ?auto_24298 ) ( CLEAR ?auto_24297 ) ( ON-TABLE ?auto_24299 ) ( ON ?auto_24300 ?auto_24299 ) ( ON ?auto_24301 ?auto_24300 ) ( not ( = ?auto_24299 ?auto_24300 ) ) ( not ( = ?auto_24299 ?auto_24301 ) ) ( not ( = ?auto_24299 ?auto_24298 ) ) ( not ( = ?auto_24299 ?auto_24297 ) ) ( not ( = ?auto_24300 ?auto_24301 ) ) ( not ( = ?auto_24300 ?auto_24298 ) ) ( not ( = ?auto_24300 ?auto_24297 ) ) ( not ( = ?auto_24296 ?auto_24299 ) ) ( not ( = ?auto_24296 ?auto_24300 ) ) ( HOLDING ?auto_24296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24296 )
      ( MAKE-3PILE ?auto_24296 ?auto_24297 ?auto_24298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24302 - BLOCK
      ?auto_24303 - BLOCK
      ?auto_24304 - BLOCK
    )
    :vars
    (
      ?auto_24307 - BLOCK
      ?auto_24306 - BLOCK
      ?auto_24305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24302 ?auto_24303 ) ) ( not ( = ?auto_24302 ?auto_24304 ) ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( ON ?auto_24304 ?auto_24307 ) ( not ( = ?auto_24302 ?auto_24307 ) ) ( not ( = ?auto_24303 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) ( ON ?auto_24303 ?auto_24304 ) ( ON-TABLE ?auto_24306 ) ( ON ?auto_24305 ?auto_24306 ) ( ON ?auto_24307 ?auto_24305 ) ( not ( = ?auto_24306 ?auto_24305 ) ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24304 ) ) ( not ( = ?auto_24306 ?auto_24303 ) ) ( not ( = ?auto_24305 ?auto_24307 ) ) ( not ( = ?auto_24305 ?auto_24304 ) ) ( not ( = ?auto_24305 ?auto_24303 ) ) ( not ( = ?auto_24302 ?auto_24306 ) ) ( not ( = ?auto_24302 ?auto_24305 ) ) ( ON ?auto_24302 ?auto_24303 ) ( CLEAR ?auto_24302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24306 ?auto_24305 ?auto_24307 ?auto_24304 ?auto_24303 )
      ( MAKE-3PILE ?auto_24302 ?auto_24303 ?auto_24304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24310 - BLOCK
      ?auto_24311 - BLOCK
    )
    :vars
    (
      ?auto_24312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24312 ?auto_24311 ) ( CLEAR ?auto_24312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24310 ) ( ON ?auto_24311 ?auto_24310 ) ( not ( = ?auto_24310 ?auto_24311 ) ) ( not ( = ?auto_24310 ?auto_24312 ) ) ( not ( = ?auto_24311 ?auto_24312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24312 ?auto_24311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24313 - BLOCK
      ?auto_24314 - BLOCK
    )
    :vars
    (
      ?auto_24315 - BLOCK
      ?auto_24316 - BLOCK
      ?auto_24317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24315 ?auto_24314 ) ( CLEAR ?auto_24315 ) ( ON-TABLE ?auto_24313 ) ( ON ?auto_24314 ?auto_24313 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( HOLDING ?auto_24316 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24313 ?auto_24316 ) ) ( not ( = ?auto_24313 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24316 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24317 ) ) )
    :subtasks
    ( ( !STACK ?auto_24316 ?auto_24317 )
      ( MAKE-2PILE ?auto_24313 ?auto_24314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24318 - BLOCK
      ?auto_24319 - BLOCK
    )
    :vars
    (
      ?auto_24322 - BLOCK
      ?auto_24320 - BLOCK
      ?auto_24321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24322 ?auto_24319 ) ( ON-TABLE ?auto_24318 ) ( ON ?auto_24319 ?auto_24318 ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24322 ) ) ( not ( = ?auto_24319 ?auto_24322 ) ) ( CLEAR ?auto_24320 ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( not ( = ?auto_24322 ?auto_24321 ) ) ( not ( = ?auto_24322 ?auto_24320 ) ) ( not ( = ?auto_24321 ?auto_24320 ) ) ( ON ?auto_24321 ?auto_24322 ) ( CLEAR ?auto_24321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24318 ?auto_24319 ?auto_24322 )
      ( MAKE-2PILE ?auto_24318 ?auto_24319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24323 - BLOCK
      ?auto_24324 - BLOCK
    )
    :vars
    (
      ?auto_24326 - BLOCK
      ?auto_24327 - BLOCK
      ?auto_24325 - BLOCK
      ?auto_24328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24326 ?auto_24324 ) ( ON-TABLE ?auto_24323 ) ( ON ?auto_24324 ?auto_24323 ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( not ( = ?auto_24323 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24323 ?auto_24327 ) ) ( not ( = ?auto_24323 ?auto_24325 ) ) ( not ( = ?auto_24324 ?auto_24327 ) ) ( not ( = ?auto_24324 ?auto_24325 ) ) ( not ( = ?auto_24326 ?auto_24327 ) ) ( not ( = ?auto_24326 ?auto_24325 ) ) ( not ( = ?auto_24327 ?auto_24325 ) ) ( ON ?auto_24327 ?auto_24326 ) ( CLEAR ?auto_24327 ) ( HOLDING ?auto_24325 ) ( CLEAR ?auto_24328 ) ( ON-TABLE ?auto_24328 ) ( not ( = ?auto_24328 ?auto_24325 ) ) ( not ( = ?auto_24323 ?auto_24328 ) ) ( not ( = ?auto_24324 ?auto_24328 ) ) ( not ( = ?auto_24326 ?auto_24328 ) ) ( not ( = ?auto_24327 ?auto_24328 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24328 ?auto_24325 )
      ( MAKE-2PILE ?auto_24323 ?auto_24324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24747 - BLOCK
      ?auto_24748 - BLOCK
    )
    :vars
    (
      ?auto_24751 - BLOCK
      ?auto_24750 - BLOCK
      ?auto_24749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24751 ?auto_24748 ) ( ON-TABLE ?auto_24747 ) ( ON ?auto_24748 ?auto_24747 ) ( not ( = ?auto_24747 ?auto_24748 ) ) ( not ( = ?auto_24747 ?auto_24751 ) ) ( not ( = ?auto_24748 ?auto_24751 ) ) ( not ( = ?auto_24747 ?auto_24750 ) ) ( not ( = ?auto_24747 ?auto_24749 ) ) ( not ( = ?auto_24748 ?auto_24750 ) ) ( not ( = ?auto_24748 ?auto_24749 ) ) ( not ( = ?auto_24751 ?auto_24750 ) ) ( not ( = ?auto_24751 ?auto_24749 ) ) ( not ( = ?auto_24750 ?auto_24749 ) ) ( ON ?auto_24750 ?auto_24751 ) ( ON ?auto_24749 ?auto_24750 ) ( CLEAR ?auto_24749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24747 ?auto_24748 ?auto_24751 ?auto_24750 )
      ( MAKE-2PILE ?auto_24747 ?auto_24748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24335 - BLOCK
      ?auto_24336 - BLOCK
    )
    :vars
    (
      ?auto_24338 - BLOCK
      ?auto_24340 - BLOCK
      ?auto_24337 - BLOCK
      ?auto_24339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24338 ?auto_24336 ) ( ON-TABLE ?auto_24335 ) ( ON ?auto_24336 ?auto_24335 ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24338 ) ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24335 ?auto_24340 ) ) ( not ( = ?auto_24335 ?auto_24337 ) ) ( not ( = ?auto_24336 ?auto_24340 ) ) ( not ( = ?auto_24336 ?auto_24337 ) ) ( not ( = ?auto_24338 ?auto_24340 ) ) ( not ( = ?auto_24338 ?auto_24337 ) ) ( not ( = ?auto_24340 ?auto_24337 ) ) ( ON ?auto_24340 ?auto_24338 ) ( not ( = ?auto_24339 ?auto_24337 ) ) ( not ( = ?auto_24335 ?auto_24339 ) ) ( not ( = ?auto_24336 ?auto_24339 ) ) ( not ( = ?auto_24338 ?auto_24339 ) ) ( not ( = ?auto_24340 ?auto_24339 ) ) ( ON ?auto_24337 ?auto_24340 ) ( CLEAR ?auto_24337 ) ( HOLDING ?auto_24339 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24339 )
      ( MAKE-2PILE ?auto_24335 ?auto_24336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24341 - BLOCK
      ?auto_24342 - BLOCK
    )
    :vars
    (
      ?auto_24343 - BLOCK
      ?auto_24346 - BLOCK
      ?auto_24344 - BLOCK
      ?auto_24345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24343 ?auto_24342 ) ( ON-TABLE ?auto_24341 ) ( ON ?auto_24342 ?auto_24341 ) ( not ( = ?auto_24341 ?auto_24342 ) ) ( not ( = ?auto_24341 ?auto_24343 ) ) ( not ( = ?auto_24342 ?auto_24343 ) ) ( not ( = ?auto_24341 ?auto_24346 ) ) ( not ( = ?auto_24341 ?auto_24344 ) ) ( not ( = ?auto_24342 ?auto_24346 ) ) ( not ( = ?auto_24342 ?auto_24344 ) ) ( not ( = ?auto_24343 ?auto_24346 ) ) ( not ( = ?auto_24343 ?auto_24344 ) ) ( not ( = ?auto_24346 ?auto_24344 ) ) ( ON ?auto_24346 ?auto_24343 ) ( not ( = ?auto_24345 ?auto_24344 ) ) ( not ( = ?auto_24341 ?auto_24345 ) ) ( not ( = ?auto_24342 ?auto_24345 ) ) ( not ( = ?auto_24343 ?auto_24345 ) ) ( not ( = ?auto_24346 ?auto_24345 ) ) ( ON ?auto_24344 ?auto_24346 ) ( ON ?auto_24345 ?auto_24344 ) ( CLEAR ?auto_24345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24341 ?auto_24342 ?auto_24343 ?auto_24346 ?auto_24344 )
      ( MAKE-2PILE ?auto_24341 ?auto_24342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24351 - BLOCK
      ?auto_24352 - BLOCK
      ?auto_24353 - BLOCK
      ?auto_24354 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24354 ) ( CLEAR ?auto_24353 ) ( ON-TABLE ?auto_24351 ) ( ON ?auto_24352 ?auto_24351 ) ( ON ?auto_24353 ?auto_24352 ) ( not ( = ?auto_24351 ?auto_24352 ) ) ( not ( = ?auto_24351 ?auto_24353 ) ) ( not ( = ?auto_24351 ?auto_24354 ) ) ( not ( = ?auto_24352 ?auto_24353 ) ) ( not ( = ?auto_24352 ?auto_24354 ) ) ( not ( = ?auto_24353 ?auto_24354 ) ) )
    :subtasks
    ( ( !STACK ?auto_24354 ?auto_24353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24355 - BLOCK
      ?auto_24356 - BLOCK
      ?auto_24357 - BLOCK
      ?auto_24358 - BLOCK
    )
    :vars
    (
      ?auto_24359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24357 ) ( ON-TABLE ?auto_24355 ) ( ON ?auto_24356 ?auto_24355 ) ( ON ?auto_24357 ?auto_24356 ) ( not ( = ?auto_24355 ?auto_24356 ) ) ( not ( = ?auto_24355 ?auto_24357 ) ) ( not ( = ?auto_24355 ?auto_24358 ) ) ( not ( = ?auto_24356 ?auto_24357 ) ) ( not ( = ?auto_24356 ?auto_24358 ) ) ( not ( = ?auto_24357 ?auto_24358 ) ) ( ON ?auto_24358 ?auto_24359 ) ( CLEAR ?auto_24358 ) ( HAND-EMPTY ) ( not ( = ?auto_24355 ?auto_24359 ) ) ( not ( = ?auto_24356 ?auto_24359 ) ) ( not ( = ?auto_24357 ?auto_24359 ) ) ( not ( = ?auto_24358 ?auto_24359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24358 ?auto_24359 )
      ( MAKE-4PILE ?auto_24355 ?auto_24356 ?auto_24357 ?auto_24358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24360 - BLOCK
      ?auto_24361 - BLOCK
      ?auto_24362 - BLOCK
      ?auto_24363 - BLOCK
    )
    :vars
    (
      ?auto_24364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24360 ) ( ON ?auto_24361 ?auto_24360 ) ( not ( = ?auto_24360 ?auto_24361 ) ) ( not ( = ?auto_24360 ?auto_24362 ) ) ( not ( = ?auto_24360 ?auto_24363 ) ) ( not ( = ?auto_24361 ?auto_24362 ) ) ( not ( = ?auto_24361 ?auto_24363 ) ) ( not ( = ?auto_24362 ?auto_24363 ) ) ( ON ?auto_24363 ?auto_24364 ) ( CLEAR ?auto_24363 ) ( not ( = ?auto_24360 ?auto_24364 ) ) ( not ( = ?auto_24361 ?auto_24364 ) ) ( not ( = ?auto_24362 ?auto_24364 ) ) ( not ( = ?auto_24363 ?auto_24364 ) ) ( HOLDING ?auto_24362 ) ( CLEAR ?auto_24361 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24360 ?auto_24361 ?auto_24362 )
      ( MAKE-4PILE ?auto_24360 ?auto_24361 ?auto_24362 ?auto_24363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24365 - BLOCK
      ?auto_24366 - BLOCK
      ?auto_24367 - BLOCK
      ?auto_24368 - BLOCK
    )
    :vars
    (
      ?auto_24369 - BLOCK
      ?auto_24370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24365 ) ( ON ?auto_24366 ?auto_24365 ) ( not ( = ?auto_24365 ?auto_24366 ) ) ( not ( = ?auto_24365 ?auto_24367 ) ) ( not ( = ?auto_24365 ?auto_24368 ) ) ( not ( = ?auto_24366 ?auto_24367 ) ) ( not ( = ?auto_24366 ?auto_24368 ) ) ( not ( = ?auto_24367 ?auto_24368 ) ) ( ON ?auto_24368 ?auto_24369 ) ( not ( = ?auto_24365 ?auto_24369 ) ) ( not ( = ?auto_24366 ?auto_24369 ) ) ( not ( = ?auto_24367 ?auto_24369 ) ) ( not ( = ?auto_24368 ?auto_24369 ) ) ( CLEAR ?auto_24366 ) ( ON ?auto_24367 ?auto_24368 ) ( CLEAR ?auto_24367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24370 ) ( ON ?auto_24369 ?auto_24370 ) ( not ( = ?auto_24370 ?auto_24369 ) ) ( not ( = ?auto_24370 ?auto_24368 ) ) ( not ( = ?auto_24370 ?auto_24367 ) ) ( not ( = ?auto_24365 ?auto_24370 ) ) ( not ( = ?auto_24366 ?auto_24370 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24370 ?auto_24369 ?auto_24368 )
      ( MAKE-4PILE ?auto_24365 ?auto_24366 ?auto_24367 ?auto_24368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24371 - BLOCK
      ?auto_24372 - BLOCK
      ?auto_24373 - BLOCK
      ?auto_24374 - BLOCK
    )
    :vars
    (
      ?auto_24376 - BLOCK
      ?auto_24375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24371 ) ( not ( = ?auto_24371 ?auto_24372 ) ) ( not ( = ?auto_24371 ?auto_24373 ) ) ( not ( = ?auto_24371 ?auto_24374 ) ) ( not ( = ?auto_24372 ?auto_24373 ) ) ( not ( = ?auto_24372 ?auto_24374 ) ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( ON ?auto_24374 ?auto_24376 ) ( not ( = ?auto_24371 ?auto_24376 ) ) ( not ( = ?auto_24372 ?auto_24376 ) ) ( not ( = ?auto_24373 ?auto_24376 ) ) ( not ( = ?auto_24374 ?auto_24376 ) ) ( ON ?auto_24373 ?auto_24374 ) ( CLEAR ?auto_24373 ) ( ON-TABLE ?auto_24375 ) ( ON ?auto_24376 ?auto_24375 ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( not ( = ?auto_24375 ?auto_24374 ) ) ( not ( = ?auto_24375 ?auto_24373 ) ) ( not ( = ?auto_24371 ?auto_24375 ) ) ( not ( = ?auto_24372 ?auto_24375 ) ) ( HOLDING ?auto_24372 ) ( CLEAR ?auto_24371 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24371 ?auto_24372 )
      ( MAKE-4PILE ?auto_24371 ?auto_24372 ?auto_24373 ?auto_24374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24377 - BLOCK
      ?auto_24378 - BLOCK
      ?auto_24379 - BLOCK
      ?auto_24380 - BLOCK
    )
    :vars
    (
      ?auto_24382 - BLOCK
      ?auto_24381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24377 ) ( not ( = ?auto_24377 ?auto_24378 ) ) ( not ( = ?auto_24377 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24380 ) ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( not ( = ?auto_24378 ?auto_24380 ) ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( ON ?auto_24380 ?auto_24382 ) ( not ( = ?auto_24377 ?auto_24382 ) ) ( not ( = ?auto_24378 ?auto_24382 ) ) ( not ( = ?auto_24379 ?auto_24382 ) ) ( not ( = ?auto_24380 ?auto_24382 ) ) ( ON ?auto_24379 ?auto_24380 ) ( ON-TABLE ?auto_24381 ) ( ON ?auto_24382 ?auto_24381 ) ( not ( = ?auto_24381 ?auto_24382 ) ) ( not ( = ?auto_24381 ?auto_24380 ) ) ( not ( = ?auto_24381 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24381 ) ) ( not ( = ?auto_24378 ?auto_24381 ) ) ( CLEAR ?auto_24377 ) ( ON ?auto_24378 ?auto_24379 ) ( CLEAR ?auto_24378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24381 ?auto_24382 ?auto_24380 ?auto_24379 )
      ( MAKE-4PILE ?auto_24377 ?auto_24378 ?auto_24379 ?auto_24380 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24383 - BLOCK
      ?auto_24384 - BLOCK
      ?auto_24385 - BLOCK
      ?auto_24386 - BLOCK
    )
    :vars
    (
      ?auto_24387 - BLOCK
      ?auto_24388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24383 ?auto_24384 ) ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( not ( = ?auto_24383 ?auto_24386 ) ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24386 ) ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( ON ?auto_24386 ?auto_24387 ) ( not ( = ?auto_24383 ?auto_24387 ) ) ( not ( = ?auto_24384 ?auto_24387 ) ) ( not ( = ?auto_24385 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( ON ?auto_24385 ?auto_24386 ) ( ON-TABLE ?auto_24388 ) ( ON ?auto_24387 ?auto_24388 ) ( not ( = ?auto_24388 ?auto_24387 ) ) ( not ( = ?auto_24388 ?auto_24386 ) ) ( not ( = ?auto_24388 ?auto_24385 ) ) ( not ( = ?auto_24383 ?auto_24388 ) ) ( not ( = ?auto_24384 ?auto_24388 ) ) ( ON ?auto_24384 ?auto_24385 ) ( CLEAR ?auto_24384 ) ( HOLDING ?auto_24383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24383 )
      ( MAKE-4PILE ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24389 - BLOCK
      ?auto_24390 - BLOCK
      ?auto_24391 - BLOCK
      ?auto_24392 - BLOCK
    )
    :vars
    (
      ?auto_24393 - BLOCK
      ?auto_24394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( ON ?auto_24392 ?auto_24393 ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( ON ?auto_24391 ?auto_24392 ) ( ON-TABLE ?auto_24394 ) ( ON ?auto_24393 ?auto_24394 ) ( not ( = ?auto_24394 ?auto_24393 ) ) ( not ( = ?auto_24394 ?auto_24392 ) ) ( not ( = ?auto_24394 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( ON ?auto_24390 ?auto_24391 ) ( ON ?auto_24389 ?auto_24390 ) ( CLEAR ?auto_24389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24394 ?auto_24393 ?auto_24392 ?auto_24391 ?auto_24390 )
      ( MAKE-4PILE ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24396 - BLOCK
    )
    :vars
    (
      ?auto_24397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24397 ?auto_24396 ) ( CLEAR ?auto_24397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24396 ) ( not ( = ?auto_24396 ?auto_24397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24397 ?auto_24396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24398 - BLOCK
    )
    :vars
    (
      ?auto_24399 - BLOCK
      ?auto_24400 - BLOCK
      ?auto_24401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24399 ?auto_24398 ) ( CLEAR ?auto_24399 ) ( ON-TABLE ?auto_24398 ) ( not ( = ?auto_24398 ?auto_24399 ) ) ( HOLDING ?auto_24400 ) ( CLEAR ?auto_24401 ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24398 ?auto_24401 ) ) ( not ( = ?auto_24399 ?auto_24400 ) ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( not ( = ?auto_24400 ?auto_24401 ) ) )
    :subtasks
    ( ( !STACK ?auto_24400 ?auto_24401 )
      ( MAKE-1PILE ?auto_24398 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24402 - BLOCK
    )
    :vars
    (
      ?auto_24405 - BLOCK
      ?auto_24403 - BLOCK
      ?auto_24404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24405 ?auto_24402 ) ( ON-TABLE ?auto_24402 ) ( not ( = ?auto_24402 ?auto_24405 ) ) ( CLEAR ?auto_24403 ) ( not ( = ?auto_24402 ?auto_24404 ) ) ( not ( = ?auto_24402 ?auto_24403 ) ) ( not ( = ?auto_24405 ?auto_24404 ) ) ( not ( = ?auto_24405 ?auto_24403 ) ) ( not ( = ?auto_24404 ?auto_24403 ) ) ( ON ?auto_24404 ?auto_24405 ) ( CLEAR ?auto_24404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24402 ?auto_24405 )
      ( MAKE-1PILE ?auto_24402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24406 - BLOCK
    )
    :vars
    (
      ?auto_24407 - BLOCK
      ?auto_24409 - BLOCK
      ?auto_24408 - BLOCK
      ?auto_24411 - BLOCK
      ?auto_24410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24407 ?auto_24406 ) ( ON-TABLE ?auto_24406 ) ( not ( = ?auto_24406 ?auto_24407 ) ) ( not ( = ?auto_24406 ?auto_24409 ) ) ( not ( = ?auto_24406 ?auto_24408 ) ) ( not ( = ?auto_24407 ?auto_24409 ) ) ( not ( = ?auto_24407 ?auto_24408 ) ) ( not ( = ?auto_24409 ?auto_24408 ) ) ( ON ?auto_24409 ?auto_24407 ) ( CLEAR ?auto_24409 ) ( HOLDING ?auto_24408 ) ( CLEAR ?auto_24411 ) ( ON-TABLE ?auto_24410 ) ( ON ?auto_24411 ?auto_24410 ) ( not ( = ?auto_24410 ?auto_24411 ) ) ( not ( = ?auto_24410 ?auto_24408 ) ) ( not ( = ?auto_24411 ?auto_24408 ) ) ( not ( = ?auto_24406 ?auto_24411 ) ) ( not ( = ?auto_24406 ?auto_24410 ) ) ( not ( = ?auto_24407 ?auto_24411 ) ) ( not ( = ?auto_24407 ?auto_24410 ) ) ( not ( = ?auto_24409 ?auto_24411 ) ) ( not ( = ?auto_24409 ?auto_24410 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24410 ?auto_24411 ?auto_24408 )
      ( MAKE-1PILE ?auto_24406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24412 - BLOCK
    )
    :vars
    (
      ?auto_24415 - BLOCK
      ?auto_24417 - BLOCK
      ?auto_24414 - BLOCK
      ?auto_24416 - BLOCK
      ?auto_24413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24415 ?auto_24412 ) ( ON-TABLE ?auto_24412 ) ( not ( = ?auto_24412 ?auto_24415 ) ) ( not ( = ?auto_24412 ?auto_24417 ) ) ( not ( = ?auto_24412 ?auto_24414 ) ) ( not ( = ?auto_24415 ?auto_24417 ) ) ( not ( = ?auto_24415 ?auto_24414 ) ) ( not ( = ?auto_24417 ?auto_24414 ) ) ( ON ?auto_24417 ?auto_24415 ) ( CLEAR ?auto_24416 ) ( ON-TABLE ?auto_24413 ) ( ON ?auto_24416 ?auto_24413 ) ( not ( = ?auto_24413 ?auto_24416 ) ) ( not ( = ?auto_24413 ?auto_24414 ) ) ( not ( = ?auto_24416 ?auto_24414 ) ) ( not ( = ?auto_24412 ?auto_24416 ) ) ( not ( = ?auto_24412 ?auto_24413 ) ) ( not ( = ?auto_24415 ?auto_24416 ) ) ( not ( = ?auto_24415 ?auto_24413 ) ) ( not ( = ?auto_24417 ?auto_24416 ) ) ( not ( = ?auto_24417 ?auto_24413 ) ) ( ON ?auto_24414 ?auto_24417 ) ( CLEAR ?auto_24414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24412 ?auto_24415 ?auto_24417 )
      ( MAKE-1PILE ?auto_24412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24418 - BLOCK
    )
    :vars
    (
      ?auto_24422 - BLOCK
      ?auto_24423 - BLOCK
      ?auto_24421 - BLOCK
      ?auto_24419 - BLOCK
      ?auto_24420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24422 ?auto_24418 ) ( ON-TABLE ?auto_24418 ) ( not ( = ?auto_24418 ?auto_24422 ) ) ( not ( = ?auto_24418 ?auto_24423 ) ) ( not ( = ?auto_24418 ?auto_24421 ) ) ( not ( = ?auto_24422 ?auto_24423 ) ) ( not ( = ?auto_24422 ?auto_24421 ) ) ( not ( = ?auto_24423 ?auto_24421 ) ) ( ON ?auto_24423 ?auto_24422 ) ( ON-TABLE ?auto_24419 ) ( not ( = ?auto_24419 ?auto_24420 ) ) ( not ( = ?auto_24419 ?auto_24421 ) ) ( not ( = ?auto_24420 ?auto_24421 ) ) ( not ( = ?auto_24418 ?auto_24420 ) ) ( not ( = ?auto_24418 ?auto_24419 ) ) ( not ( = ?auto_24422 ?auto_24420 ) ) ( not ( = ?auto_24422 ?auto_24419 ) ) ( not ( = ?auto_24423 ?auto_24420 ) ) ( not ( = ?auto_24423 ?auto_24419 ) ) ( ON ?auto_24421 ?auto_24423 ) ( CLEAR ?auto_24421 ) ( HOLDING ?auto_24420 ) ( CLEAR ?auto_24419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24419 ?auto_24420 )
      ( MAKE-1PILE ?auto_24418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24887 - BLOCK
    )
    :vars
    (
      ?auto_24888 - BLOCK
      ?auto_24890 - BLOCK
      ?auto_24891 - BLOCK
      ?auto_24889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24888 ?auto_24887 ) ( ON-TABLE ?auto_24887 ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24890 ) ) ( not ( = ?auto_24887 ?auto_24891 ) ) ( not ( = ?auto_24888 ?auto_24890 ) ) ( not ( = ?auto_24888 ?auto_24891 ) ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( ON ?auto_24890 ?auto_24888 ) ( not ( = ?auto_24889 ?auto_24891 ) ) ( not ( = ?auto_24887 ?auto_24889 ) ) ( not ( = ?auto_24888 ?auto_24889 ) ) ( not ( = ?auto_24890 ?auto_24889 ) ) ( ON ?auto_24891 ?auto_24890 ) ( ON ?auto_24889 ?auto_24891 ) ( CLEAR ?auto_24889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24887 ?auto_24888 ?auto_24890 ?auto_24891 )
      ( MAKE-1PILE ?auto_24887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24430 - BLOCK
    )
    :vars
    (
      ?auto_24434 - BLOCK
      ?auto_24433 - BLOCK
      ?auto_24431 - BLOCK
      ?auto_24435 - BLOCK
      ?auto_24432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24434 ?auto_24430 ) ( ON-TABLE ?auto_24430 ) ( not ( = ?auto_24430 ?auto_24434 ) ) ( not ( = ?auto_24430 ?auto_24433 ) ) ( not ( = ?auto_24430 ?auto_24431 ) ) ( not ( = ?auto_24434 ?auto_24433 ) ) ( not ( = ?auto_24434 ?auto_24431 ) ) ( not ( = ?auto_24433 ?auto_24431 ) ) ( ON ?auto_24433 ?auto_24434 ) ( not ( = ?auto_24435 ?auto_24432 ) ) ( not ( = ?auto_24435 ?auto_24431 ) ) ( not ( = ?auto_24432 ?auto_24431 ) ) ( not ( = ?auto_24430 ?auto_24432 ) ) ( not ( = ?auto_24430 ?auto_24435 ) ) ( not ( = ?auto_24434 ?auto_24432 ) ) ( not ( = ?auto_24434 ?auto_24435 ) ) ( not ( = ?auto_24433 ?auto_24432 ) ) ( not ( = ?auto_24433 ?auto_24435 ) ) ( ON ?auto_24431 ?auto_24433 ) ( ON ?auto_24432 ?auto_24431 ) ( CLEAR ?auto_24432 ) ( HOLDING ?auto_24435 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24435 )
      ( MAKE-1PILE ?auto_24430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24436 - BLOCK
    )
    :vars
    (
      ?auto_24438 - BLOCK
      ?auto_24441 - BLOCK
      ?auto_24440 - BLOCK
      ?auto_24437 - BLOCK
      ?auto_24439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24438 ?auto_24436 ) ( ON-TABLE ?auto_24436 ) ( not ( = ?auto_24436 ?auto_24438 ) ) ( not ( = ?auto_24436 ?auto_24441 ) ) ( not ( = ?auto_24436 ?auto_24440 ) ) ( not ( = ?auto_24438 ?auto_24441 ) ) ( not ( = ?auto_24438 ?auto_24440 ) ) ( not ( = ?auto_24441 ?auto_24440 ) ) ( ON ?auto_24441 ?auto_24438 ) ( not ( = ?auto_24437 ?auto_24439 ) ) ( not ( = ?auto_24437 ?auto_24440 ) ) ( not ( = ?auto_24439 ?auto_24440 ) ) ( not ( = ?auto_24436 ?auto_24439 ) ) ( not ( = ?auto_24436 ?auto_24437 ) ) ( not ( = ?auto_24438 ?auto_24439 ) ) ( not ( = ?auto_24438 ?auto_24437 ) ) ( not ( = ?auto_24441 ?auto_24439 ) ) ( not ( = ?auto_24441 ?auto_24437 ) ) ( ON ?auto_24440 ?auto_24441 ) ( ON ?auto_24439 ?auto_24440 ) ( ON ?auto_24437 ?auto_24439 ) ( CLEAR ?auto_24437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24436 ?auto_24438 ?auto_24441 ?auto_24440 ?auto_24439 )
      ( MAKE-1PILE ?auto_24436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24447 - BLOCK
      ?auto_24448 - BLOCK
      ?auto_24449 - BLOCK
      ?auto_24450 - BLOCK
      ?auto_24451 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24451 ) ( CLEAR ?auto_24450 ) ( ON-TABLE ?auto_24447 ) ( ON ?auto_24448 ?auto_24447 ) ( ON ?auto_24449 ?auto_24448 ) ( ON ?auto_24450 ?auto_24449 ) ( not ( = ?auto_24447 ?auto_24448 ) ) ( not ( = ?auto_24447 ?auto_24449 ) ) ( not ( = ?auto_24447 ?auto_24450 ) ) ( not ( = ?auto_24447 ?auto_24451 ) ) ( not ( = ?auto_24448 ?auto_24449 ) ) ( not ( = ?auto_24448 ?auto_24450 ) ) ( not ( = ?auto_24448 ?auto_24451 ) ) ( not ( = ?auto_24449 ?auto_24450 ) ) ( not ( = ?auto_24449 ?auto_24451 ) ) ( not ( = ?auto_24450 ?auto_24451 ) ) )
    :subtasks
    ( ( !STACK ?auto_24451 ?auto_24450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24452 - BLOCK
      ?auto_24453 - BLOCK
      ?auto_24454 - BLOCK
      ?auto_24455 - BLOCK
      ?auto_24456 - BLOCK
    )
    :vars
    (
      ?auto_24457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24455 ) ( ON-TABLE ?auto_24452 ) ( ON ?auto_24453 ?auto_24452 ) ( ON ?auto_24454 ?auto_24453 ) ( ON ?auto_24455 ?auto_24454 ) ( not ( = ?auto_24452 ?auto_24453 ) ) ( not ( = ?auto_24452 ?auto_24454 ) ) ( not ( = ?auto_24452 ?auto_24455 ) ) ( not ( = ?auto_24452 ?auto_24456 ) ) ( not ( = ?auto_24453 ?auto_24454 ) ) ( not ( = ?auto_24453 ?auto_24455 ) ) ( not ( = ?auto_24453 ?auto_24456 ) ) ( not ( = ?auto_24454 ?auto_24455 ) ) ( not ( = ?auto_24454 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24456 ) ) ( ON ?auto_24456 ?auto_24457 ) ( CLEAR ?auto_24456 ) ( HAND-EMPTY ) ( not ( = ?auto_24452 ?auto_24457 ) ) ( not ( = ?auto_24453 ?auto_24457 ) ) ( not ( = ?auto_24454 ?auto_24457 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24456 ?auto_24457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24456 ?auto_24457 )
      ( MAKE-5PILE ?auto_24452 ?auto_24453 ?auto_24454 ?auto_24455 ?auto_24456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24458 - BLOCK
      ?auto_24459 - BLOCK
      ?auto_24460 - BLOCK
      ?auto_24461 - BLOCK
      ?auto_24462 - BLOCK
    )
    :vars
    (
      ?auto_24463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24458 ) ( ON ?auto_24459 ?auto_24458 ) ( ON ?auto_24460 ?auto_24459 ) ( not ( = ?auto_24458 ?auto_24459 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24461 ) ) ( not ( = ?auto_24458 ?auto_24462 ) ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24461 ) ) ( not ( = ?auto_24459 ?auto_24462 ) ) ( not ( = ?auto_24460 ?auto_24461 ) ) ( not ( = ?auto_24460 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24462 ) ) ( ON ?auto_24462 ?auto_24463 ) ( CLEAR ?auto_24462 ) ( not ( = ?auto_24458 ?auto_24463 ) ) ( not ( = ?auto_24459 ?auto_24463 ) ) ( not ( = ?auto_24460 ?auto_24463 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( HOLDING ?auto_24461 ) ( CLEAR ?auto_24460 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24458 ?auto_24459 ?auto_24460 ?auto_24461 )
      ( MAKE-5PILE ?auto_24458 ?auto_24459 ?auto_24460 ?auto_24461 ?auto_24462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24464 - BLOCK
      ?auto_24465 - BLOCK
      ?auto_24466 - BLOCK
      ?auto_24467 - BLOCK
      ?auto_24468 - BLOCK
    )
    :vars
    (
      ?auto_24469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24464 ) ( ON ?auto_24465 ?auto_24464 ) ( ON ?auto_24466 ?auto_24465 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( ON ?auto_24468 ?auto_24469 ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( CLEAR ?auto_24466 ) ( ON ?auto_24467 ?auto_24468 ) ( CLEAR ?auto_24467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24469 ?auto_24468 )
      ( MAKE-5PILE ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24470 - BLOCK
      ?auto_24471 - BLOCK
      ?auto_24472 - BLOCK
      ?auto_24473 - BLOCK
      ?auto_24474 - BLOCK
    )
    :vars
    (
      ?auto_24475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24470 ) ( ON ?auto_24471 ?auto_24470 ) ( not ( = ?auto_24470 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( not ( = ?auto_24470 ?auto_24473 ) ) ( not ( = ?auto_24470 ?auto_24474 ) ) ( not ( = ?auto_24471 ?auto_24472 ) ) ( not ( = ?auto_24471 ?auto_24473 ) ) ( not ( = ?auto_24471 ?auto_24474 ) ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( not ( = ?auto_24472 ?auto_24474 ) ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( ON ?auto_24474 ?auto_24475 ) ( not ( = ?auto_24470 ?auto_24475 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24473 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24475 ) ) ( ON ?auto_24473 ?auto_24474 ) ( CLEAR ?auto_24473 ) ( ON-TABLE ?auto_24475 ) ( HOLDING ?auto_24472 ) ( CLEAR ?auto_24471 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24470 ?auto_24471 ?auto_24472 )
      ( MAKE-5PILE ?auto_24470 ?auto_24471 ?auto_24472 ?auto_24473 ?auto_24474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24476 - BLOCK
      ?auto_24477 - BLOCK
      ?auto_24478 - BLOCK
      ?auto_24479 - BLOCK
      ?auto_24480 - BLOCK
    )
    :vars
    (
      ?auto_24481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24476 ) ( ON ?auto_24477 ?auto_24476 ) ( not ( = ?auto_24476 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24478 ) ) ( not ( = ?auto_24477 ?auto_24479 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24479 ?auto_24480 ) ) ( ON ?auto_24480 ?auto_24481 ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( not ( = ?auto_24477 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( ON ?auto_24479 ?auto_24480 ) ( ON-TABLE ?auto_24481 ) ( CLEAR ?auto_24477 ) ( ON ?auto_24478 ?auto_24479 ) ( CLEAR ?auto_24478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24481 ?auto_24480 ?auto_24479 )
      ( MAKE-5PILE ?auto_24476 ?auto_24477 ?auto_24478 ?auto_24479 ?auto_24480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24482 - BLOCK
      ?auto_24483 - BLOCK
      ?auto_24484 - BLOCK
      ?auto_24485 - BLOCK
      ?auto_24486 - BLOCK
    )
    :vars
    (
      ?auto_24487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24482 ) ( not ( = ?auto_24482 ?auto_24483 ) ) ( not ( = ?auto_24482 ?auto_24484 ) ) ( not ( = ?auto_24482 ?auto_24485 ) ) ( not ( = ?auto_24482 ?auto_24486 ) ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( not ( = ?auto_24483 ?auto_24485 ) ) ( not ( = ?auto_24483 ?auto_24486 ) ) ( not ( = ?auto_24484 ?auto_24485 ) ) ( not ( = ?auto_24484 ?auto_24486 ) ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( ON ?auto_24486 ?auto_24487 ) ( not ( = ?auto_24482 ?auto_24487 ) ) ( not ( = ?auto_24483 ?auto_24487 ) ) ( not ( = ?auto_24484 ?auto_24487 ) ) ( not ( = ?auto_24485 ?auto_24487 ) ) ( not ( = ?auto_24486 ?auto_24487 ) ) ( ON ?auto_24485 ?auto_24486 ) ( ON-TABLE ?auto_24487 ) ( ON ?auto_24484 ?auto_24485 ) ( CLEAR ?auto_24484 ) ( HOLDING ?auto_24483 ) ( CLEAR ?auto_24482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24482 ?auto_24483 )
      ( MAKE-5PILE ?auto_24482 ?auto_24483 ?auto_24484 ?auto_24485 ?auto_24486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24488 - BLOCK
      ?auto_24489 - BLOCK
      ?auto_24490 - BLOCK
      ?auto_24491 - BLOCK
      ?auto_24492 - BLOCK
    )
    :vars
    (
      ?auto_24493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24488 ) ( not ( = ?auto_24488 ?auto_24489 ) ) ( not ( = ?auto_24488 ?auto_24490 ) ) ( not ( = ?auto_24488 ?auto_24491 ) ) ( not ( = ?auto_24488 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24489 ?auto_24491 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24491 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( not ( = ?auto_24491 ?auto_24492 ) ) ( ON ?auto_24492 ?auto_24493 ) ( not ( = ?auto_24488 ?auto_24493 ) ) ( not ( = ?auto_24489 ?auto_24493 ) ) ( not ( = ?auto_24490 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( ON ?auto_24491 ?auto_24492 ) ( ON-TABLE ?auto_24493 ) ( ON ?auto_24490 ?auto_24491 ) ( CLEAR ?auto_24488 ) ( ON ?auto_24489 ?auto_24490 ) ( CLEAR ?auto_24489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24493 ?auto_24492 ?auto_24491 ?auto_24490 )
      ( MAKE-5PILE ?auto_24488 ?auto_24489 ?auto_24490 ?auto_24491 ?auto_24492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24494 - BLOCK
      ?auto_24495 - BLOCK
      ?auto_24496 - BLOCK
      ?auto_24497 - BLOCK
      ?auto_24498 - BLOCK
    )
    :vars
    (
      ?auto_24499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24494 ?auto_24495 ) ) ( not ( = ?auto_24494 ?auto_24496 ) ) ( not ( = ?auto_24494 ?auto_24497 ) ) ( not ( = ?auto_24494 ?auto_24498 ) ) ( not ( = ?auto_24495 ?auto_24496 ) ) ( not ( = ?auto_24495 ?auto_24497 ) ) ( not ( = ?auto_24495 ?auto_24498 ) ) ( not ( = ?auto_24496 ?auto_24497 ) ) ( not ( = ?auto_24496 ?auto_24498 ) ) ( not ( = ?auto_24497 ?auto_24498 ) ) ( ON ?auto_24498 ?auto_24499 ) ( not ( = ?auto_24494 ?auto_24499 ) ) ( not ( = ?auto_24495 ?auto_24499 ) ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24497 ?auto_24499 ) ) ( not ( = ?auto_24498 ?auto_24499 ) ) ( ON ?auto_24497 ?auto_24498 ) ( ON-TABLE ?auto_24499 ) ( ON ?auto_24496 ?auto_24497 ) ( ON ?auto_24495 ?auto_24496 ) ( CLEAR ?auto_24495 ) ( HOLDING ?auto_24494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24494 )
      ( MAKE-5PILE ?auto_24494 ?auto_24495 ?auto_24496 ?auto_24497 ?auto_24498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24500 - BLOCK
      ?auto_24501 - BLOCK
      ?auto_24502 - BLOCK
      ?auto_24503 - BLOCK
      ?auto_24504 - BLOCK
    )
    :vars
    (
      ?auto_24505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24500 ?auto_24501 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24500 ?auto_24504 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24503 ) ) ( not ( = ?auto_24501 ?auto_24504 ) ) ( not ( = ?auto_24502 ?auto_24503 ) ) ( not ( = ?auto_24502 ?auto_24504 ) ) ( not ( = ?auto_24503 ?auto_24504 ) ) ( ON ?auto_24504 ?auto_24505 ) ( not ( = ?auto_24500 ?auto_24505 ) ) ( not ( = ?auto_24501 ?auto_24505 ) ) ( not ( = ?auto_24502 ?auto_24505 ) ) ( not ( = ?auto_24503 ?auto_24505 ) ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( ON ?auto_24503 ?auto_24504 ) ( ON-TABLE ?auto_24505 ) ( ON ?auto_24502 ?auto_24503 ) ( ON ?auto_24501 ?auto_24502 ) ( ON ?auto_24500 ?auto_24501 ) ( CLEAR ?auto_24500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24505 ?auto_24504 ?auto_24503 ?auto_24502 ?auto_24501 )
      ( MAKE-5PILE ?auto_24500 ?auto_24501 ?auto_24502 ?auto_24503 ?auto_24504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24564 - BLOCK
    )
    :vars
    (
      ?auto_24565 - BLOCK
      ?auto_24566 - BLOCK
      ?auto_24567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24564 ?auto_24565 ) ( CLEAR ?auto_24564 ) ( not ( = ?auto_24564 ?auto_24565 ) ) ( HOLDING ?auto_24566 ) ( CLEAR ?auto_24567 ) ( not ( = ?auto_24564 ?auto_24566 ) ) ( not ( = ?auto_24564 ?auto_24567 ) ) ( not ( = ?auto_24565 ?auto_24566 ) ) ( not ( = ?auto_24565 ?auto_24567 ) ) ( not ( = ?auto_24566 ?auto_24567 ) ) )
    :subtasks
    ( ( !STACK ?auto_24566 ?auto_24567 )
      ( MAKE-1PILE ?auto_24564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24568 - BLOCK
    )
    :vars
    (
      ?auto_24570 - BLOCK
      ?auto_24569 - BLOCK
      ?auto_24571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24568 ?auto_24570 ) ( not ( = ?auto_24568 ?auto_24570 ) ) ( CLEAR ?auto_24569 ) ( not ( = ?auto_24568 ?auto_24571 ) ) ( not ( = ?auto_24568 ?auto_24569 ) ) ( not ( = ?auto_24570 ?auto_24571 ) ) ( not ( = ?auto_24570 ?auto_24569 ) ) ( not ( = ?auto_24571 ?auto_24569 ) ) ( ON ?auto_24571 ?auto_24568 ) ( CLEAR ?auto_24571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24570 ?auto_24568 )
      ( MAKE-1PILE ?auto_24568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24572 - BLOCK
    )
    :vars
    (
      ?auto_24573 - BLOCK
      ?auto_24574 - BLOCK
      ?auto_24575 - BLOCK
      ?auto_24577 - BLOCK
      ?auto_24576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24572 ?auto_24573 ) ( not ( = ?auto_24572 ?auto_24573 ) ) ( not ( = ?auto_24572 ?auto_24574 ) ) ( not ( = ?auto_24572 ?auto_24575 ) ) ( not ( = ?auto_24573 ?auto_24574 ) ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( ON ?auto_24574 ?auto_24572 ) ( CLEAR ?auto_24574 ) ( ON-TABLE ?auto_24573 ) ( HOLDING ?auto_24575 ) ( CLEAR ?auto_24577 ) ( ON-TABLE ?auto_24576 ) ( ON ?auto_24577 ?auto_24576 ) ( not ( = ?auto_24576 ?auto_24577 ) ) ( not ( = ?auto_24576 ?auto_24575 ) ) ( not ( = ?auto_24577 ?auto_24575 ) ) ( not ( = ?auto_24572 ?auto_24577 ) ) ( not ( = ?auto_24572 ?auto_24576 ) ) ( not ( = ?auto_24573 ?auto_24577 ) ) ( not ( = ?auto_24573 ?auto_24576 ) ) ( not ( = ?auto_24574 ?auto_24577 ) ) ( not ( = ?auto_24574 ?auto_24576 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24576 ?auto_24577 ?auto_24575 )
      ( MAKE-1PILE ?auto_24572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24578 - BLOCK
    )
    :vars
    (
      ?auto_24579 - BLOCK
      ?auto_24582 - BLOCK
      ?auto_24583 - BLOCK
      ?auto_24581 - BLOCK
      ?auto_24580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24578 ?auto_24579 ) ( not ( = ?auto_24578 ?auto_24579 ) ) ( not ( = ?auto_24578 ?auto_24582 ) ) ( not ( = ?auto_24578 ?auto_24583 ) ) ( not ( = ?auto_24579 ?auto_24582 ) ) ( not ( = ?auto_24579 ?auto_24583 ) ) ( not ( = ?auto_24582 ?auto_24583 ) ) ( ON ?auto_24582 ?auto_24578 ) ( ON-TABLE ?auto_24579 ) ( CLEAR ?auto_24581 ) ( ON-TABLE ?auto_24580 ) ( ON ?auto_24581 ?auto_24580 ) ( not ( = ?auto_24580 ?auto_24581 ) ) ( not ( = ?auto_24580 ?auto_24583 ) ) ( not ( = ?auto_24581 ?auto_24583 ) ) ( not ( = ?auto_24578 ?auto_24581 ) ) ( not ( = ?auto_24578 ?auto_24580 ) ) ( not ( = ?auto_24579 ?auto_24581 ) ) ( not ( = ?auto_24579 ?auto_24580 ) ) ( not ( = ?auto_24582 ?auto_24581 ) ) ( not ( = ?auto_24582 ?auto_24580 ) ) ( ON ?auto_24583 ?auto_24582 ) ( CLEAR ?auto_24583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24579 ?auto_24578 ?auto_24582 )
      ( MAKE-1PILE ?auto_24578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24584 - BLOCK
    )
    :vars
    (
      ?auto_24586 - BLOCK
      ?auto_24587 - BLOCK
      ?auto_24585 - BLOCK
      ?auto_24589 - BLOCK
      ?auto_24588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24584 ?auto_24586 ) ( not ( = ?auto_24584 ?auto_24586 ) ) ( not ( = ?auto_24584 ?auto_24587 ) ) ( not ( = ?auto_24584 ?auto_24585 ) ) ( not ( = ?auto_24586 ?auto_24587 ) ) ( not ( = ?auto_24586 ?auto_24585 ) ) ( not ( = ?auto_24587 ?auto_24585 ) ) ( ON ?auto_24587 ?auto_24584 ) ( ON-TABLE ?auto_24586 ) ( ON-TABLE ?auto_24589 ) ( not ( = ?auto_24589 ?auto_24588 ) ) ( not ( = ?auto_24589 ?auto_24585 ) ) ( not ( = ?auto_24588 ?auto_24585 ) ) ( not ( = ?auto_24584 ?auto_24588 ) ) ( not ( = ?auto_24584 ?auto_24589 ) ) ( not ( = ?auto_24586 ?auto_24588 ) ) ( not ( = ?auto_24586 ?auto_24589 ) ) ( not ( = ?auto_24587 ?auto_24588 ) ) ( not ( = ?auto_24587 ?auto_24589 ) ) ( ON ?auto_24585 ?auto_24587 ) ( CLEAR ?auto_24585 ) ( HOLDING ?auto_24588 ) ( CLEAR ?auto_24589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24589 ?auto_24588 )
      ( MAKE-1PILE ?auto_24584 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24590 - BLOCK
    )
    :vars
    (
      ?auto_24593 - BLOCK
      ?auto_24592 - BLOCK
      ?auto_24594 - BLOCK
      ?auto_24595 - BLOCK
      ?auto_24591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24590 ?auto_24593 ) ( not ( = ?auto_24590 ?auto_24593 ) ) ( not ( = ?auto_24590 ?auto_24592 ) ) ( not ( = ?auto_24590 ?auto_24594 ) ) ( not ( = ?auto_24593 ?auto_24592 ) ) ( not ( = ?auto_24593 ?auto_24594 ) ) ( not ( = ?auto_24592 ?auto_24594 ) ) ( ON ?auto_24592 ?auto_24590 ) ( ON-TABLE ?auto_24593 ) ( ON-TABLE ?auto_24595 ) ( not ( = ?auto_24595 ?auto_24591 ) ) ( not ( = ?auto_24595 ?auto_24594 ) ) ( not ( = ?auto_24591 ?auto_24594 ) ) ( not ( = ?auto_24590 ?auto_24591 ) ) ( not ( = ?auto_24590 ?auto_24595 ) ) ( not ( = ?auto_24593 ?auto_24591 ) ) ( not ( = ?auto_24593 ?auto_24595 ) ) ( not ( = ?auto_24592 ?auto_24591 ) ) ( not ( = ?auto_24592 ?auto_24595 ) ) ( ON ?auto_24594 ?auto_24592 ) ( CLEAR ?auto_24595 ) ( ON ?auto_24591 ?auto_24594 ) ( CLEAR ?auto_24591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24593 ?auto_24590 ?auto_24592 ?auto_24594 )
      ( MAKE-1PILE ?auto_24590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24596 - BLOCK
    )
    :vars
    (
      ?auto_24601 - BLOCK
      ?auto_24599 - BLOCK
      ?auto_24600 - BLOCK
      ?auto_24598 - BLOCK
      ?auto_24597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24596 ?auto_24601 ) ( not ( = ?auto_24596 ?auto_24601 ) ) ( not ( = ?auto_24596 ?auto_24599 ) ) ( not ( = ?auto_24596 ?auto_24600 ) ) ( not ( = ?auto_24601 ?auto_24599 ) ) ( not ( = ?auto_24601 ?auto_24600 ) ) ( not ( = ?auto_24599 ?auto_24600 ) ) ( ON ?auto_24599 ?auto_24596 ) ( ON-TABLE ?auto_24601 ) ( not ( = ?auto_24598 ?auto_24597 ) ) ( not ( = ?auto_24598 ?auto_24600 ) ) ( not ( = ?auto_24597 ?auto_24600 ) ) ( not ( = ?auto_24596 ?auto_24597 ) ) ( not ( = ?auto_24596 ?auto_24598 ) ) ( not ( = ?auto_24601 ?auto_24597 ) ) ( not ( = ?auto_24601 ?auto_24598 ) ) ( not ( = ?auto_24599 ?auto_24597 ) ) ( not ( = ?auto_24599 ?auto_24598 ) ) ( ON ?auto_24600 ?auto_24599 ) ( ON ?auto_24597 ?auto_24600 ) ( CLEAR ?auto_24597 ) ( HOLDING ?auto_24598 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24598 )
      ( MAKE-1PILE ?auto_24596 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24602 - BLOCK
    )
    :vars
    (
      ?auto_24605 - BLOCK
      ?auto_24604 - BLOCK
      ?auto_24603 - BLOCK
      ?auto_24606 - BLOCK
      ?auto_24607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24602 ?auto_24605 ) ( not ( = ?auto_24602 ?auto_24605 ) ) ( not ( = ?auto_24602 ?auto_24604 ) ) ( not ( = ?auto_24602 ?auto_24603 ) ) ( not ( = ?auto_24605 ?auto_24604 ) ) ( not ( = ?auto_24605 ?auto_24603 ) ) ( not ( = ?auto_24604 ?auto_24603 ) ) ( ON ?auto_24604 ?auto_24602 ) ( ON-TABLE ?auto_24605 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( not ( = ?auto_24606 ?auto_24603 ) ) ( not ( = ?auto_24607 ?auto_24603 ) ) ( not ( = ?auto_24602 ?auto_24607 ) ) ( not ( = ?auto_24602 ?auto_24606 ) ) ( not ( = ?auto_24605 ?auto_24607 ) ) ( not ( = ?auto_24605 ?auto_24606 ) ) ( not ( = ?auto_24604 ?auto_24607 ) ) ( not ( = ?auto_24604 ?auto_24606 ) ) ( ON ?auto_24603 ?auto_24604 ) ( ON ?auto_24607 ?auto_24603 ) ( ON ?auto_24606 ?auto_24607 ) ( CLEAR ?auto_24606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24605 ?auto_24602 ?auto_24604 ?auto_24603 ?auto_24607 )
      ( MAKE-1PILE ?auto_24602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24615 - BLOCK
      ?auto_24616 - BLOCK
      ?auto_24617 - BLOCK
    )
    :vars
    (
      ?auto_24618 - BLOCK
      ?auto_24619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24618 ?auto_24617 ) ( CLEAR ?auto_24618 ) ( ON-TABLE ?auto_24615 ) ( ON ?auto_24616 ?auto_24615 ) ( ON ?auto_24617 ?auto_24616 ) ( not ( = ?auto_24615 ?auto_24616 ) ) ( not ( = ?auto_24615 ?auto_24617 ) ) ( not ( = ?auto_24615 ?auto_24618 ) ) ( not ( = ?auto_24616 ?auto_24617 ) ) ( not ( = ?auto_24616 ?auto_24618 ) ) ( not ( = ?auto_24617 ?auto_24618 ) ) ( HOLDING ?auto_24619 ) ( not ( = ?auto_24615 ?auto_24619 ) ) ( not ( = ?auto_24616 ?auto_24619 ) ) ( not ( = ?auto_24617 ?auto_24619 ) ) ( not ( = ?auto_24618 ?auto_24619 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_24619 )
      ( MAKE-3PILE ?auto_24615 ?auto_24616 ?auto_24617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24668 - BLOCK
      ?auto_24669 - BLOCK
    )
    :vars
    (
      ?auto_24670 - BLOCK
      ?auto_24672 - BLOCK
      ?auto_24671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24668 ?auto_24669 ) ) ( ON ?auto_24669 ?auto_24670 ) ( not ( = ?auto_24668 ?auto_24670 ) ) ( not ( = ?auto_24669 ?auto_24670 ) ) ( ON ?auto_24668 ?auto_24669 ) ( CLEAR ?auto_24668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24672 ) ( ON ?auto_24671 ?auto_24672 ) ( ON ?auto_24670 ?auto_24671 ) ( not ( = ?auto_24672 ?auto_24671 ) ) ( not ( = ?auto_24672 ?auto_24670 ) ) ( not ( = ?auto_24672 ?auto_24669 ) ) ( not ( = ?auto_24672 ?auto_24668 ) ) ( not ( = ?auto_24671 ?auto_24670 ) ) ( not ( = ?auto_24671 ?auto_24669 ) ) ( not ( = ?auto_24671 ?auto_24668 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24672 ?auto_24671 ?auto_24670 ?auto_24669 )
      ( MAKE-2PILE ?auto_24668 ?auto_24669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24675 - BLOCK
      ?auto_24676 - BLOCK
    )
    :vars
    (
      ?auto_24677 - BLOCK
      ?auto_24678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24675 ?auto_24676 ) ) ( ON ?auto_24676 ?auto_24677 ) ( CLEAR ?auto_24676 ) ( not ( = ?auto_24675 ?auto_24677 ) ) ( not ( = ?auto_24676 ?auto_24677 ) ) ( ON ?auto_24675 ?auto_24678 ) ( CLEAR ?auto_24675 ) ( HAND-EMPTY ) ( not ( = ?auto_24675 ?auto_24678 ) ) ( not ( = ?auto_24676 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24675 ?auto_24678 )
      ( MAKE-2PILE ?auto_24675 ?auto_24676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24679 - BLOCK
      ?auto_24680 - BLOCK
    )
    :vars
    (
      ?auto_24682 - BLOCK
      ?auto_24681 - BLOCK
      ?auto_24683 - BLOCK
      ?auto_24684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24679 ?auto_24680 ) ) ( not ( = ?auto_24679 ?auto_24682 ) ) ( not ( = ?auto_24680 ?auto_24682 ) ) ( ON ?auto_24679 ?auto_24681 ) ( CLEAR ?auto_24679 ) ( not ( = ?auto_24679 ?auto_24681 ) ) ( not ( = ?auto_24680 ?auto_24681 ) ) ( not ( = ?auto_24682 ?auto_24681 ) ) ( HOLDING ?auto_24680 ) ( CLEAR ?auto_24682 ) ( ON-TABLE ?auto_24683 ) ( ON ?auto_24684 ?auto_24683 ) ( ON ?auto_24682 ?auto_24684 ) ( not ( = ?auto_24683 ?auto_24684 ) ) ( not ( = ?auto_24683 ?auto_24682 ) ) ( not ( = ?auto_24683 ?auto_24680 ) ) ( not ( = ?auto_24684 ?auto_24682 ) ) ( not ( = ?auto_24684 ?auto_24680 ) ) ( not ( = ?auto_24679 ?auto_24683 ) ) ( not ( = ?auto_24679 ?auto_24684 ) ) ( not ( = ?auto_24681 ?auto_24683 ) ) ( not ( = ?auto_24681 ?auto_24684 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24683 ?auto_24684 ?auto_24682 ?auto_24680 )
      ( MAKE-2PILE ?auto_24679 ?auto_24680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24685 - BLOCK
      ?auto_24686 - BLOCK
    )
    :vars
    (
      ?auto_24689 - BLOCK
      ?auto_24690 - BLOCK
      ?auto_24688 - BLOCK
      ?auto_24687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24689 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( ON ?auto_24685 ?auto_24690 ) ( not ( = ?auto_24685 ?auto_24690 ) ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24690 ) ) ( CLEAR ?auto_24689 ) ( ON-TABLE ?auto_24688 ) ( ON ?auto_24687 ?auto_24688 ) ( ON ?auto_24689 ?auto_24687 ) ( not ( = ?auto_24688 ?auto_24687 ) ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( not ( = ?auto_24688 ?auto_24686 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24690 ?auto_24688 ) ) ( not ( = ?auto_24690 ?auto_24687 ) ) ( ON ?auto_24686 ?auto_24685 ) ( CLEAR ?auto_24686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24690 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24690 ?auto_24685 )
      ( MAKE-2PILE ?auto_24685 ?auto_24686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24691 - BLOCK
      ?auto_24692 - BLOCK
    )
    :vars
    (
      ?auto_24696 - BLOCK
      ?auto_24694 - BLOCK
      ?auto_24695 - BLOCK
      ?auto_24693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24691 ?auto_24692 ) ) ( not ( = ?auto_24691 ?auto_24696 ) ) ( not ( = ?auto_24692 ?auto_24696 ) ) ( ON ?auto_24691 ?auto_24694 ) ( not ( = ?auto_24691 ?auto_24694 ) ) ( not ( = ?auto_24692 ?auto_24694 ) ) ( not ( = ?auto_24696 ?auto_24694 ) ) ( ON-TABLE ?auto_24695 ) ( ON ?auto_24693 ?auto_24695 ) ( not ( = ?auto_24695 ?auto_24693 ) ) ( not ( = ?auto_24695 ?auto_24696 ) ) ( not ( = ?auto_24695 ?auto_24692 ) ) ( not ( = ?auto_24693 ?auto_24696 ) ) ( not ( = ?auto_24693 ?auto_24692 ) ) ( not ( = ?auto_24691 ?auto_24695 ) ) ( not ( = ?auto_24691 ?auto_24693 ) ) ( not ( = ?auto_24694 ?auto_24695 ) ) ( not ( = ?auto_24694 ?auto_24693 ) ) ( ON ?auto_24692 ?auto_24691 ) ( CLEAR ?auto_24692 ) ( ON-TABLE ?auto_24694 ) ( HOLDING ?auto_24696 ) ( CLEAR ?auto_24693 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24695 ?auto_24693 ?auto_24696 )
      ( MAKE-2PILE ?auto_24691 ?auto_24692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24697 - BLOCK
      ?auto_24698 - BLOCK
    )
    :vars
    (
      ?auto_24702 - BLOCK
      ?auto_24699 - BLOCK
      ?auto_24701 - BLOCK
      ?auto_24700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24697 ?auto_24702 ) ) ( not ( = ?auto_24698 ?auto_24702 ) ) ( ON ?auto_24697 ?auto_24699 ) ( not ( = ?auto_24697 ?auto_24699 ) ) ( not ( = ?auto_24698 ?auto_24699 ) ) ( not ( = ?auto_24702 ?auto_24699 ) ) ( ON-TABLE ?auto_24701 ) ( ON ?auto_24700 ?auto_24701 ) ( not ( = ?auto_24701 ?auto_24700 ) ) ( not ( = ?auto_24701 ?auto_24702 ) ) ( not ( = ?auto_24701 ?auto_24698 ) ) ( not ( = ?auto_24700 ?auto_24702 ) ) ( not ( = ?auto_24700 ?auto_24698 ) ) ( not ( = ?auto_24697 ?auto_24701 ) ) ( not ( = ?auto_24697 ?auto_24700 ) ) ( not ( = ?auto_24699 ?auto_24701 ) ) ( not ( = ?auto_24699 ?auto_24700 ) ) ( ON ?auto_24698 ?auto_24697 ) ( ON-TABLE ?auto_24699 ) ( CLEAR ?auto_24700 ) ( ON ?auto_24702 ?auto_24698 ) ( CLEAR ?auto_24702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24699 ?auto_24697 ?auto_24698 )
      ( MAKE-2PILE ?auto_24697 ?auto_24698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24703 - BLOCK
      ?auto_24704 - BLOCK
    )
    :vars
    (
      ?auto_24705 - BLOCK
      ?auto_24707 - BLOCK
      ?auto_24706 - BLOCK
      ?auto_24708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24703 ?auto_24704 ) ) ( not ( = ?auto_24703 ?auto_24705 ) ) ( not ( = ?auto_24704 ?auto_24705 ) ) ( ON ?auto_24703 ?auto_24707 ) ( not ( = ?auto_24703 ?auto_24707 ) ) ( not ( = ?auto_24704 ?auto_24707 ) ) ( not ( = ?auto_24705 ?auto_24707 ) ) ( ON-TABLE ?auto_24706 ) ( not ( = ?auto_24706 ?auto_24708 ) ) ( not ( = ?auto_24706 ?auto_24705 ) ) ( not ( = ?auto_24706 ?auto_24704 ) ) ( not ( = ?auto_24708 ?auto_24705 ) ) ( not ( = ?auto_24708 ?auto_24704 ) ) ( not ( = ?auto_24703 ?auto_24706 ) ) ( not ( = ?auto_24703 ?auto_24708 ) ) ( not ( = ?auto_24707 ?auto_24706 ) ) ( not ( = ?auto_24707 ?auto_24708 ) ) ( ON ?auto_24704 ?auto_24703 ) ( ON-TABLE ?auto_24707 ) ( ON ?auto_24705 ?auto_24704 ) ( CLEAR ?auto_24705 ) ( HOLDING ?auto_24708 ) ( CLEAR ?auto_24706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24706 ?auto_24708 )
      ( MAKE-2PILE ?auto_24703 ?auto_24704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24709 - BLOCK
      ?auto_24710 - BLOCK
    )
    :vars
    (
      ?auto_24714 - BLOCK
      ?auto_24711 - BLOCK
      ?auto_24712 - BLOCK
      ?auto_24713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24709 ?auto_24710 ) ) ( not ( = ?auto_24709 ?auto_24714 ) ) ( not ( = ?auto_24710 ?auto_24714 ) ) ( ON ?auto_24709 ?auto_24711 ) ( not ( = ?auto_24709 ?auto_24711 ) ) ( not ( = ?auto_24710 ?auto_24711 ) ) ( not ( = ?auto_24714 ?auto_24711 ) ) ( ON-TABLE ?auto_24712 ) ( not ( = ?auto_24712 ?auto_24713 ) ) ( not ( = ?auto_24712 ?auto_24714 ) ) ( not ( = ?auto_24712 ?auto_24710 ) ) ( not ( = ?auto_24713 ?auto_24714 ) ) ( not ( = ?auto_24713 ?auto_24710 ) ) ( not ( = ?auto_24709 ?auto_24712 ) ) ( not ( = ?auto_24709 ?auto_24713 ) ) ( not ( = ?auto_24711 ?auto_24712 ) ) ( not ( = ?auto_24711 ?auto_24713 ) ) ( ON ?auto_24710 ?auto_24709 ) ( ON-TABLE ?auto_24711 ) ( ON ?auto_24714 ?auto_24710 ) ( CLEAR ?auto_24712 ) ( ON ?auto_24713 ?auto_24714 ) ( CLEAR ?auto_24713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24711 ?auto_24709 ?auto_24710 ?auto_24714 )
      ( MAKE-2PILE ?auto_24709 ?auto_24710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24715 - BLOCK
      ?auto_24716 - BLOCK
    )
    :vars
    (
      ?auto_24720 - BLOCK
      ?auto_24717 - BLOCK
      ?auto_24718 - BLOCK
      ?auto_24719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24715 ?auto_24716 ) ) ( not ( = ?auto_24715 ?auto_24720 ) ) ( not ( = ?auto_24716 ?auto_24720 ) ) ( ON ?auto_24715 ?auto_24717 ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24716 ?auto_24717 ) ) ( not ( = ?auto_24720 ?auto_24717 ) ) ( not ( = ?auto_24718 ?auto_24719 ) ) ( not ( = ?auto_24718 ?auto_24720 ) ) ( not ( = ?auto_24718 ?auto_24716 ) ) ( not ( = ?auto_24719 ?auto_24720 ) ) ( not ( = ?auto_24719 ?auto_24716 ) ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24715 ?auto_24719 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24719 ) ) ( ON ?auto_24716 ?auto_24715 ) ( ON-TABLE ?auto_24717 ) ( ON ?auto_24720 ?auto_24716 ) ( ON ?auto_24719 ?auto_24720 ) ( CLEAR ?auto_24719 ) ( HOLDING ?auto_24718 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24718 )
      ( MAKE-2PILE ?auto_24715 ?auto_24716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24721 - BLOCK
      ?auto_24722 - BLOCK
    )
    :vars
    (
      ?auto_24723 - BLOCK
      ?auto_24725 - BLOCK
      ?auto_24726 - BLOCK
      ?auto_24724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24721 ?auto_24722 ) ) ( not ( = ?auto_24721 ?auto_24723 ) ) ( not ( = ?auto_24722 ?auto_24723 ) ) ( ON ?auto_24721 ?auto_24725 ) ( not ( = ?auto_24721 ?auto_24725 ) ) ( not ( = ?auto_24722 ?auto_24725 ) ) ( not ( = ?auto_24723 ?auto_24725 ) ) ( not ( = ?auto_24726 ?auto_24724 ) ) ( not ( = ?auto_24726 ?auto_24723 ) ) ( not ( = ?auto_24726 ?auto_24722 ) ) ( not ( = ?auto_24724 ?auto_24723 ) ) ( not ( = ?auto_24724 ?auto_24722 ) ) ( not ( = ?auto_24721 ?auto_24726 ) ) ( not ( = ?auto_24721 ?auto_24724 ) ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24724 ) ) ( ON ?auto_24722 ?auto_24721 ) ( ON-TABLE ?auto_24725 ) ( ON ?auto_24723 ?auto_24722 ) ( ON ?auto_24724 ?auto_24723 ) ( ON ?auto_24726 ?auto_24724 ) ( CLEAR ?auto_24726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24725 ?auto_24721 ?auto_24722 ?auto_24723 ?auto_24724 )
      ( MAKE-2PILE ?auto_24721 ?auto_24722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_24742 - BLOCK
      ?auto_24743 - BLOCK
    )
    :vars
    (
      ?auto_24744 - BLOCK
      ?auto_24746 - BLOCK
      ?auto_24745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24744 ?auto_24743 ) ( ON-TABLE ?auto_24742 ) ( ON ?auto_24743 ?auto_24742 ) ( not ( = ?auto_24742 ?auto_24743 ) ) ( not ( = ?auto_24742 ?auto_24744 ) ) ( not ( = ?auto_24743 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24746 ) ) ( not ( = ?auto_24742 ?auto_24745 ) ) ( not ( = ?auto_24743 ?auto_24746 ) ) ( not ( = ?auto_24743 ?auto_24745 ) ) ( not ( = ?auto_24744 ?auto_24746 ) ) ( not ( = ?auto_24744 ?auto_24745 ) ) ( not ( = ?auto_24746 ?auto_24745 ) ) ( ON ?auto_24746 ?auto_24744 ) ( CLEAR ?auto_24746 ) ( HOLDING ?auto_24745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24745 )
      ( MAKE-2PILE ?auto_24742 ?auto_24743 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24789 - BLOCK
      ?auto_24790 - BLOCK
      ?auto_24791 - BLOCK
    )
    :vars
    (
      ?auto_24792 - BLOCK
      ?auto_24793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24789 ) ( not ( = ?auto_24789 ?auto_24790 ) ) ( not ( = ?auto_24789 ?auto_24791 ) ) ( not ( = ?auto_24790 ?auto_24791 ) ) ( ON ?auto_24791 ?auto_24792 ) ( not ( = ?auto_24789 ?auto_24792 ) ) ( not ( = ?auto_24790 ?auto_24792 ) ) ( not ( = ?auto_24791 ?auto_24792 ) ) ( CLEAR ?auto_24789 ) ( ON ?auto_24790 ?auto_24791 ) ( CLEAR ?auto_24790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24793 ) ( ON ?auto_24792 ?auto_24793 ) ( not ( = ?auto_24793 ?auto_24792 ) ) ( not ( = ?auto_24793 ?auto_24791 ) ) ( not ( = ?auto_24793 ?auto_24790 ) ) ( not ( = ?auto_24789 ?auto_24793 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24793 ?auto_24792 ?auto_24791 )
      ( MAKE-3PILE ?auto_24789 ?auto_24790 ?auto_24791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24794 - BLOCK
      ?auto_24795 - BLOCK
      ?auto_24796 - BLOCK
    )
    :vars
    (
      ?auto_24797 - BLOCK
      ?auto_24798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24794 ?auto_24795 ) ) ( not ( = ?auto_24794 ?auto_24796 ) ) ( not ( = ?auto_24795 ?auto_24796 ) ) ( ON ?auto_24796 ?auto_24797 ) ( not ( = ?auto_24794 ?auto_24797 ) ) ( not ( = ?auto_24795 ?auto_24797 ) ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( ON ?auto_24795 ?auto_24796 ) ( CLEAR ?auto_24795 ) ( ON-TABLE ?auto_24798 ) ( ON ?auto_24797 ?auto_24798 ) ( not ( = ?auto_24798 ?auto_24797 ) ) ( not ( = ?auto_24798 ?auto_24796 ) ) ( not ( = ?auto_24798 ?auto_24795 ) ) ( not ( = ?auto_24794 ?auto_24798 ) ) ( HOLDING ?auto_24794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24794 )
      ( MAKE-3PILE ?auto_24794 ?auto_24795 ?auto_24796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24799 - BLOCK
      ?auto_24800 - BLOCK
      ?auto_24801 - BLOCK
    )
    :vars
    (
      ?auto_24803 - BLOCK
      ?auto_24802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24799 ?auto_24800 ) ) ( not ( = ?auto_24799 ?auto_24801 ) ) ( not ( = ?auto_24800 ?auto_24801 ) ) ( ON ?auto_24801 ?auto_24803 ) ( not ( = ?auto_24799 ?auto_24803 ) ) ( not ( = ?auto_24800 ?auto_24803 ) ) ( not ( = ?auto_24801 ?auto_24803 ) ) ( ON ?auto_24800 ?auto_24801 ) ( ON-TABLE ?auto_24802 ) ( ON ?auto_24803 ?auto_24802 ) ( not ( = ?auto_24802 ?auto_24803 ) ) ( not ( = ?auto_24802 ?auto_24801 ) ) ( not ( = ?auto_24802 ?auto_24800 ) ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( ON ?auto_24799 ?auto_24800 ) ( CLEAR ?auto_24799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24802 ?auto_24803 ?auto_24801 ?auto_24800 )
      ( MAKE-3PILE ?auto_24799 ?auto_24800 ?auto_24801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24807 - BLOCK
      ?auto_24808 - BLOCK
      ?auto_24809 - BLOCK
    )
    :vars
    (
      ?auto_24811 - BLOCK
      ?auto_24810 - BLOCK
      ?auto_24812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24807 ?auto_24808 ) ) ( not ( = ?auto_24807 ?auto_24809 ) ) ( not ( = ?auto_24808 ?auto_24809 ) ) ( ON ?auto_24809 ?auto_24811 ) ( not ( = ?auto_24807 ?auto_24811 ) ) ( not ( = ?auto_24808 ?auto_24811 ) ) ( not ( = ?auto_24809 ?auto_24811 ) ) ( ON ?auto_24808 ?auto_24809 ) ( CLEAR ?auto_24808 ) ( ON-TABLE ?auto_24810 ) ( ON ?auto_24811 ?auto_24810 ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( not ( = ?auto_24810 ?auto_24809 ) ) ( not ( = ?auto_24810 ?auto_24808 ) ) ( not ( = ?auto_24807 ?auto_24810 ) ) ( ON ?auto_24807 ?auto_24812 ) ( CLEAR ?auto_24807 ) ( HAND-EMPTY ) ( not ( = ?auto_24807 ?auto_24812 ) ) ( not ( = ?auto_24808 ?auto_24812 ) ) ( not ( = ?auto_24809 ?auto_24812 ) ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24807 ?auto_24812 )
      ( MAKE-3PILE ?auto_24807 ?auto_24808 ?auto_24809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24813 - BLOCK
      ?auto_24814 - BLOCK
      ?auto_24815 - BLOCK
    )
    :vars
    (
      ?auto_24818 - BLOCK
      ?auto_24816 - BLOCK
      ?auto_24817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24813 ?auto_24814 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( not ( = ?auto_24814 ?auto_24815 ) ) ( ON ?auto_24815 ?auto_24818 ) ( not ( = ?auto_24813 ?auto_24818 ) ) ( not ( = ?auto_24814 ?auto_24818 ) ) ( not ( = ?auto_24815 ?auto_24818 ) ) ( ON-TABLE ?auto_24816 ) ( ON ?auto_24818 ?auto_24816 ) ( not ( = ?auto_24816 ?auto_24818 ) ) ( not ( = ?auto_24816 ?auto_24815 ) ) ( not ( = ?auto_24816 ?auto_24814 ) ) ( not ( = ?auto_24813 ?auto_24816 ) ) ( ON ?auto_24813 ?auto_24817 ) ( CLEAR ?auto_24813 ) ( not ( = ?auto_24813 ?auto_24817 ) ) ( not ( = ?auto_24814 ?auto_24817 ) ) ( not ( = ?auto_24815 ?auto_24817 ) ) ( not ( = ?auto_24818 ?auto_24817 ) ) ( not ( = ?auto_24816 ?auto_24817 ) ) ( HOLDING ?auto_24814 ) ( CLEAR ?auto_24815 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24816 ?auto_24818 ?auto_24815 ?auto_24814 )
      ( MAKE-3PILE ?auto_24813 ?auto_24814 ?auto_24815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24819 - BLOCK
      ?auto_24820 - BLOCK
      ?auto_24821 - BLOCK
    )
    :vars
    (
      ?auto_24823 - BLOCK
      ?auto_24824 - BLOCK
      ?auto_24822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24819 ?auto_24820 ) ) ( not ( = ?auto_24819 ?auto_24821 ) ) ( not ( = ?auto_24820 ?auto_24821 ) ) ( ON ?auto_24821 ?auto_24823 ) ( not ( = ?auto_24819 ?auto_24823 ) ) ( not ( = ?auto_24820 ?auto_24823 ) ) ( not ( = ?auto_24821 ?auto_24823 ) ) ( ON-TABLE ?auto_24824 ) ( ON ?auto_24823 ?auto_24824 ) ( not ( = ?auto_24824 ?auto_24823 ) ) ( not ( = ?auto_24824 ?auto_24821 ) ) ( not ( = ?auto_24824 ?auto_24820 ) ) ( not ( = ?auto_24819 ?auto_24824 ) ) ( ON ?auto_24819 ?auto_24822 ) ( not ( = ?auto_24819 ?auto_24822 ) ) ( not ( = ?auto_24820 ?auto_24822 ) ) ( not ( = ?auto_24821 ?auto_24822 ) ) ( not ( = ?auto_24823 ?auto_24822 ) ) ( not ( = ?auto_24824 ?auto_24822 ) ) ( CLEAR ?auto_24821 ) ( ON ?auto_24820 ?auto_24819 ) ( CLEAR ?auto_24820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24822 ?auto_24819 )
      ( MAKE-3PILE ?auto_24819 ?auto_24820 ?auto_24821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24825 - BLOCK
      ?auto_24826 - BLOCK
      ?auto_24827 - BLOCK
    )
    :vars
    (
      ?auto_24829 - BLOCK
      ?auto_24828 - BLOCK
      ?auto_24830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24825 ?auto_24826 ) ) ( not ( = ?auto_24825 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24825 ?auto_24829 ) ) ( not ( = ?auto_24826 ?auto_24829 ) ) ( not ( = ?auto_24827 ?auto_24829 ) ) ( ON-TABLE ?auto_24828 ) ( ON ?auto_24829 ?auto_24828 ) ( not ( = ?auto_24828 ?auto_24829 ) ) ( not ( = ?auto_24828 ?auto_24827 ) ) ( not ( = ?auto_24828 ?auto_24826 ) ) ( not ( = ?auto_24825 ?auto_24828 ) ) ( ON ?auto_24825 ?auto_24830 ) ( not ( = ?auto_24825 ?auto_24830 ) ) ( not ( = ?auto_24826 ?auto_24830 ) ) ( not ( = ?auto_24827 ?auto_24830 ) ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24828 ?auto_24830 ) ) ( ON ?auto_24826 ?auto_24825 ) ( CLEAR ?auto_24826 ) ( ON-TABLE ?auto_24830 ) ( HOLDING ?auto_24827 ) ( CLEAR ?auto_24829 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24828 ?auto_24829 ?auto_24827 )
      ( MAKE-3PILE ?auto_24825 ?auto_24826 ?auto_24827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24831 - BLOCK
      ?auto_24832 - BLOCK
      ?auto_24833 - BLOCK
    )
    :vars
    (
      ?auto_24835 - BLOCK
      ?auto_24836 - BLOCK
      ?auto_24834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24831 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24833 ) ) ( not ( = ?auto_24832 ?auto_24833 ) ) ( not ( = ?auto_24831 ?auto_24835 ) ) ( not ( = ?auto_24832 ?auto_24835 ) ) ( not ( = ?auto_24833 ?auto_24835 ) ) ( ON-TABLE ?auto_24836 ) ( ON ?auto_24835 ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24835 ) ) ( not ( = ?auto_24836 ?auto_24833 ) ) ( not ( = ?auto_24836 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24836 ) ) ( ON ?auto_24831 ?auto_24834 ) ( not ( = ?auto_24831 ?auto_24834 ) ) ( not ( = ?auto_24832 ?auto_24834 ) ) ( not ( = ?auto_24833 ?auto_24834 ) ) ( not ( = ?auto_24835 ?auto_24834 ) ) ( not ( = ?auto_24836 ?auto_24834 ) ) ( ON ?auto_24832 ?auto_24831 ) ( ON-TABLE ?auto_24834 ) ( CLEAR ?auto_24835 ) ( ON ?auto_24833 ?auto_24832 ) ( CLEAR ?auto_24833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24834 ?auto_24831 ?auto_24832 )
      ( MAKE-3PILE ?auto_24831 ?auto_24832 ?auto_24833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24837 - BLOCK
      ?auto_24838 - BLOCK
      ?auto_24839 - BLOCK
    )
    :vars
    (
      ?auto_24841 - BLOCK
      ?auto_24842 - BLOCK
      ?auto_24840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24837 ?auto_24838 ) ) ( not ( = ?auto_24837 ?auto_24839 ) ) ( not ( = ?auto_24838 ?auto_24839 ) ) ( not ( = ?auto_24837 ?auto_24841 ) ) ( not ( = ?auto_24838 ?auto_24841 ) ) ( not ( = ?auto_24839 ?auto_24841 ) ) ( ON-TABLE ?auto_24842 ) ( not ( = ?auto_24842 ?auto_24841 ) ) ( not ( = ?auto_24842 ?auto_24839 ) ) ( not ( = ?auto_24842 ?auto_24838 ) ) ( not ( = ?auto_24837 ?auto_24842 ) ) ( ON ?auto_24837 ?auto_24840 ) ( not ( = ?auto_24837 ?auto_24840 ) ) ( not ( = ?auto_24838 ?auto_24840 ) ) ( not ( = ?auto_24839 ?auto_24840 ) ) ( not ( = ?auto_24841 ?auto_24840 ) ) ( not ( = ?auto_24842 ?auto_24840 ) ) ( ON ?auto_24838 ?auto_24837 ) ( ON-TABLE ?auto_24840 ) ( ON ?auto_24839 ?auto_24838 ) ( CLEAR ?auto_24839 ) ( HOLDING ?auto_24841 ) ( CLEAR ?auto_24842 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24842 ?auto_24841 )
      ( MAKE-3PILE ?auto_24837 ?auto_24838 ?auto_24839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24843 - BLOCK
      ?auto_24844 - BLOCK
      ?auto_24845 - BLOCK
    )
    :vars
    (
      ?auto_24846 - BLOCK
      ?auto_24847 - BLOCK
      ?auto_24848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24843 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24845 ) ) ( not ( = ?auto_24844 ?auto_24845 ) ) ( not ( = ?auto_24843 ?auto_24846 ) ) ( not ( = ?auto_24844 ?auto_24846 ) ) ( not ( = ?auto_24845 ?auto_24846 ) ) ( ON-TABLE ?auto_24847 ) ( not ( = ?auto_24847 ?auto_24846 ) ) ( not ( = ?auto_24847 ?auto_24845 ) ) ( not ( = ?auto_24847 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24847 ) ) ( ON ?auto_24843 ?auto_24848 ) ( not ( = ?auto_24843 ?auto_24848 ) ) ( not ( = ?auto_24844 ?auto_24848 ) ) ( not ( = ?auto_24845 ?auto_24848 ) ) ( not ( = ?auto_24846 ?auto_24848 ) ) ( not ( = ?auto_24847 ?auto_24848 ) ) ( ON ?auto_24844 ?auto_24843 ) ( ON-TABLE ?auto_24848 ) ( ON ?auto_24845 ?auto_24844 ) ( CLEAR ?auto_24847 ) ( ON ?auto_24846 ?auto_24845 ) ( CLEAR ?auto_24846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24848 ?auto_24843 ?auto_24844 ?auto_24845 )
      ( MAKE-3PILE ?auto_24843 ?auto_24844 ?auto_24845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24849 - BLOCK
      ?auto_24850 - BLOCK
      ?auto_24851 - BLOCK
    )
    :vars
    (
      ?auto_24854 - BLOCK
      ?auto_24852 - BLOCK
      ?auto_24853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24849 ?auto_24850 ) ) ( not ( = ?auto_24849 ?auto_24851 ) ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24849 ?auto_24854 ) ) ( not ( = ?auto_24850 ?auto_24854 ) ) ( not ( = ?auto_24851 ?auto_24854 ) ) ( not ( = ?auto_24852 ?auto_24854 ) ) ( not ( = ?auto_24852 ?auto_24851 ) ) ( not ( = ?auto_24852 ?auto_24850 ) ) ( not ( = ?auto_24849 ?auto_24852 ) ) ( ON ?auto_24849 ?auto_24853 ) ( not ( = ?auto_24849 ?auto_24853 ) ) ( not ( = ?auto_24850 ?auto_24853 ) ) ( not ( = ?auto_24851 ?auto_24853 ) ) ( not ( = ?auto_24854 ?auto_24853 ) ) ( not ( = ?auto_24852 ?auto_24853 ) ) ( ON ?auto_24850 ?auto_24849 ) ( ON-TABLE ?auto_24853 ) ( ON ?auto_24851 ?auto_24850 ) ( ON ?auto_24854 ?auto_24851 ) ( CLEAR ?auto_24854 ) ( HOLDING ?auto_24852 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24852 )
      ( MAKE-3PILE ?auto_24849 ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24855 - BLOCK
      ?auto_24856 - BLOCK
      ?auto_24857 - BLOCK
    )
    :vars
    (
      ?auto_24859 - BLOCK
      ?auto_24860 - BLOCK
      ?auto_24858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24855 ?auto_24856 ) ) ( not ( = ?auto_24855 ?auto_24857 ) ) ( not ( = ?auto_24856 ?auto_24857 ) ) ( not ( = ?auto_24855 ?auto_24859 ) ) ( not ( = ?auto_24856 ?auto_24859 ) ) ( not ( = ?auto_24857 ?auto_24859 ) ) ( not ( = ?auto_24860 ?auto_24859 ) ) ( not ( = ?auto_24860 ?auto_24857 ) ) ( not ( = ?auto_24860 ?auto_24856 ) ) ( not ( = ?auto_24855 ?auto_24860 ) ) ( ON ?auto_24855 ?auto_24858 ) ( not ( = ?auto_24855 ?auto_24858 ) ) ( not ( = ?auto_24856 ?auto_24858 ) ) ( not ( = ?auto_24857 ?auto_24858 ) ) ( not ( = ?auto_24859 ?auto_24858 ) ) ( not ( = ?auto_24860 ?auto_24858 ) ) ( ON ?auto_24856 ?auto_24855 ) ( ON-TABLE ?auto_24858 ) ( ON ?auto_24857 ?auto_24856 ) ( ON ?auto_24859 ?auto_24857 ) ( ON ?auto_24860 ?auto_24859 ) ( CLEAR ?auto_24860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24858 ?auto_24855 ?auto_24856 ?auto_24857 ?auto_24859 )
      ( MAKE-3PILE ?auto_24855 ?auto_24856 ?auto_24857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24872 - BLOCK
    )
    :vars
    (
      ?auto_24873 - BLOCK
      ?auto_24874 - BLOCK
      ?auto_24875 - BLOCK
      ?auto_24876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24873 ?auto_24872 ) ( ON-TABLE ?auto_24872 ) ( not ( = ?auto_24872 ?auto_24873 ) ) ( not ( = ?auto_24872 ?auto_24874 ) ) ( not ( = ?auto_24872 ?auto_24875 ) ) ( not ( = ?auto_24873 ?auto_24874 ) ) ( not ( = ?auto_24873 ?auto_24875 ) ) ( not ( = ?auto_24874 ?auto_24875 ) ) ( ON ?auto_24874 ?auto_24873 ) ( CLEAR ?auto_24874 ) ( HOLDING ?auto_24875 ) ( CLEAR ?auto_24876 ) ( ON-TABLE ?auto_24876 ) ( not ( = ?auto_24876 ?auto_24875 ) ) ( not ( = ?auto_24872 ?auto_24876 ) ) ( not ( = ?auto_24873 ?auto_24876 ) ) ( not ( = ?auto_24874 ?auto_24876 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24876 ?auto_24875 )
      ( MAKE-1PILE ?auto_24872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24877 - BLOCK
    )
    :vars
    (
      ?auto_24881 - BLOCK
      ?auto_24879 - BLOCK
      ?auto_24880 - BLOCK
      ?auto_24878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24881 ?auto_24877 ) ( ON-TABLE ?auto_24877 ) ( not ( = ?auto_24877 ?auto_24881 ) ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24877 ?auto_24880 ) ) ( not ( = ?auto_24881 ?auto_24879 ) ) ( not ( = ?auto_24881 ?auto_24880 ) ) ( not ( = ?auto_24879 ?auto_24880 ) ) ( ON ?auto_24879 ?auto_24881 ) ( CLEAR ?auto_24878 ) ( ON-TABLE ?auto_24878 ) ( not ( = ?auto_24878 ?auto_24880 ) ) ( not ( = ?auto_24877 ?auto_24878 ) ) ( not ( = ?auto_24881 ?auto_24878 ) ) ( not ( = ?auto_24879 ?auto_24878 ) ) ( ON ?auto_24880 ?auto_24879 ) ( CLEAR ?auto_24880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24877 ?auto_24881 ?auto_24879 )
      ( MAKE-1PILE ?auto_24877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24882 - BLOCK
    )
    :vars
    (
      ?auto_24886 - BLOCK
      ?auto_24885 - BLOCK
      ?auto_24884 - BLOCK
      ?auto_24883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24886 ?auto_24882 ) ( ON-TABLE ?auto_24882 ) ( not ( = ?auto_24882 ?auto_24886 ) ) ( not ( = ?auto_24882 ?auto_24885 ) ) ( not ( = ?auto_24882 ?auto_24884 ) ) ( not ( = ?auto_24886 ?auto_24885 ) ) ( not ( = ?auto_24886 ?auto_24884 ) ) ( not ( = ?auto_24885 ?auto_24884 ) ) ( ON ?auto_24885 ?auto_24886 ) ( not ( = ?auto_24883 ?auto_24884 ) ) ( not ( = ?auto_24882 ?auto_24883 ) ) ( not ( = ?auto_24886 ?auto_24883 ) ) ( not ( = ?auto_24885 ?auto_24883 ) ) ( ON ?auto_24884 ?auto_24885 ) ( CLEAR ?auto_24884 ) ( HOLDING ?auto_24883 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24883 )
      ( MAKE-1PILE ?auto_24882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24893 - BLOCK
    )
    :vars
    (
      ?auto_24895 - BLOCK
      ?auto_24897 - BLOCK
      ?auto_24896 - BLOCK
      ?auto_24894 - BLOCK
      ?auto_24898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24895 ?auto_24893 ) ( ON-TABLE ?auto_24893 ) ( not ( = ?auto_24893 ?auto_24895 ) ) ( not ( = ?auto_24893 ?auto_24897 ) ) ( not ( = ?auto_24893 ?auto_24896 ) ) ( not ( = ?auto_24895 ?auto_24897 ) ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( not ( = ?auto_24897 ?auto_24896 ) ) ( ON ?auto_24897 ?auto_24895 ) ( not ( = ?auto_24894 ?auto_24896 ) ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( not ( = ?auto_24895 ?auto_24894 ) ) ( not ( = ?auto_24897 ?auto_24894 ) ) ( ON ?auto_24896 ?auto_24897 ) ( CLEAR ?auto_24896 ) ( ON ?auto_24894 ?auto_24898 ) ( CLEAR ?auto_24894 ) ( HAND-EMPTY ) ( not ( = ?auto_24893 ?auto_24898 ) ) ( not ( = ?auto_24895 ?auto_24898 ) ) ( not ( = ?auto_24897 ?auto_24898 ) ) ( not ( = ?auto_24896 ?auto_24898 ) ) ( not ( = ?auto_24894 ?auto_24898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24894 ?auto_24898 )
      ( MAKE-1PILE ?auto_24893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24899 - BLOCK
    )
    :vars
    (
      ?auto_24902 - BLOCK
      ?auto_24901 - BLOCK
      ?auto_24903 - BLOCK
      ?auto_24900 - BLOCK
      ?auto_24904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24902 ?auto_24899 ) ( ON-TABLE ?auto_24899 ) ( not ( = ?auto_24899 ?auto_24902 ) ) ( not ( = ?auto_24899 ?auto_24901 ) ) ( not ( = ?auto_24899 ?auto_24903 ) ) ( not ( = ?auto_24902 ?auto_24901 ) ) ( not ( = ?auto_24902 ?auto_24903 ) ) ( not ( = ?auto_24901 ?auto_24903 ) ) ( ON ?auto_24901 ?auto_24902 ) ( not ( = ?auto_24900 ?auto_24903 ) ) ( not ( = ?auto_24899 ?auto_24900 ) ) ( not ( = ?auto_24902 ?auto_24900 ) ) ( not ( = ?auto_24901 ?auto_24900 ) ) ( ON ?auto_24900 ?auto_24904 ) ( CLEAR ?auto_24900 ) ( not ( = ?auto_24899 ?auto_24904 ) ) ( not ( = ?auto_24902 ?auto_24904 ) ) ( not ( = ?auto_24901 ?auto_24904 ) ) ( not ( = ?auto_24903 ?auto_24904 ) ) ( not ( = ?auto_24900 ?auto_24904 ) ) ( HOLDING ?auto_24903 ) ( CLEAR ?auto_24901 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24899 ?auto_24902 ?auto_24901 ?auto_24903 )
      ( MAKE-1PILE ?auto_24899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24933 - BLOCK
      ?auto_24934 - BLOCK
      ?auto_24935 - BLOCK
      ?auto_24936 - BLOCK
    )
    :vars
    (
      ?auto_24937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24933 ) ( ON ?auto_24934 ?auto_24933 ) ( not ( = ?auto_24933 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24935 ) ) ( not ( = ?auto_24933 ?auto_24936 ) ) ( not ( = ?auto_24934 ?auto_24935 ) ) ( not ( = ?auto_24934 ?auto_24936 ) ) ( not ( = ?auto_24935 ?auto_24936 ) ) ( ON ?auto_24936 ?auto_24937 ) ( not ( = ?auto_24933 ?auto_24937 ) ) ( not ( = ?auto_24934 ?auto_24937 ) ) ( not ( = ?auto_24935 ?auto_24937 ) ) ( not ( = ?auto_24936 ?auto_24937 ) ) ( CLEAR ?auto_24934 ) ( ON ?auto_24935 ?auto_24936 ) ( CLEAR ?auto_24935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24937 ?auto_24936 )
      ( MAKE-4PILE ?auto_24933 ?auto_24934 ?auto_24935 ?auto_24936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24938 - BLOCK
      ?auto_24939 - BLOCK
      ?auto_24940 - BLOCK
      ?auto_24941 - BLOCK
    )
    :vars
    (
      ?auto_24942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24938 ) ( not ( = ?auto_24938 ?auto_24939 ) ) ( not ( = ?auto_24938 ?auto_24940 ) ) ( not ( = ?auto_24938 ?auto_24941 ) ) ( not ( = ?auto_24939 ?auto_24940 ) ) ( not ( = ?auto_24939 ?auto_24941 ) ) ( not ( = ?auto_24940 ?auto_24941 ) ) ( ON ?auto_24941 ?auto_24942 ) ( not ( = ?auto_24938 ?auto_24942 ) ) ( not ( = ?auto_24939 ?auto_24942 ) ) ( not ( = ?auto_24940 ?auto_24942 ) ) ( not ( = ?auto_24941 ?auto_24942 ) ) ( ON ?auto_24940 ?auto_24941 ) ( CLEAR ?auto_24940 ) ( ON-TABLE ?auto_24942 ) ( HOLDING ?auto_24939 ) ( CLEAR ?auto_24938 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24938 ?auto_24939 )
      ( MAKE-4PILE ?auto_24938 ?auto_24939 ?auto_24940 ?auto_24941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24943 - BLOCK
      ?auto_24944 - BLOCK
      ?auto_24945 - BLOCK
      ?auto_24946 - BLOCK
    )
    :vars
    (
      ?auto_24947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24944 ?auto_24945 ) ) ( not ( = ?auto_24944 ?auto_24946 ) ) ( not ( = ?auto_24945 ?auto_24946 ) ) ( ON ?auto_24946 ?auto_24947 ) ( not ( = ?auto_24943 ?auto_24947 ) ) ( not ( = ?auto_24944 ?auto_24947 ) ) ( not ( = ?auto_24945 ?auto_24947 ) ) ( not ( = ?auto_24946 ?auto_24947 ) ) ( ON ?auto_24945 ?auto_24946 ) ( ON-TABLE ?auto_24947 ) ( CLEAR ?auto_24943 ) ( ON ?auto_24944 ?auto_24945 ) ( CLEAR ?auto_24944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24947 ?auto_24946 ?auto_24945 )
      ( MAKE-4PILE ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24948 - BLOCK
      ?auto_24949 - BLOCK
      ?auto_24950 - BLOCK
      ?auto_24951 - BLOCK
    )
    :vars
    (
      ?auto_24952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24948 ?auto_24950 ) ) ( not ( = ?auto_24948 ?auto_24951 ) ) ( not ( = ?auto_24949 ?auto_24950 ) ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( not ( = ?auto_24950 ?auto_24951 ) ) ( ON ?auto_24951 ?auto_24952 ) ( not ( = ?auto_24948 ?auto_24952 ) ) ( not ( = ?auto_24949 ?auto_24952 ) ) ( not ( = ?auto_24950 ?auto_24952 ) ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( ON ?auto_24950 ?auto_24951 ) ( ON-TABLE ?auto_24952 ) ( ON ?auto_24949 ?auto_24950 ) ( CLEAR ?auto_24949 ) ( HOLDING ?auto_24948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24948 )
      ( MAKE-4PILE ?auto_24948 ?auto_24949 ?auto_24950 ?auto_24951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24953 - BLOCK
      ?auto_24954 - BLOCK
      ?auto_24955 - BLOCK
      ?auto_24956 - BLOCK
    )
    :vars
    (
      ?auto_24957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24953 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24956 ) ) ( not ( = ?auto_24954 ?auto_24955 ) ) ( not ( = ?auto_24954 ?auto_24956 ) ) ( not ( = ?auto_24955 ?auto_24956 ) ) ( ON ?auto_24956 ?auto_24957 ) ( not ( = ?auto_24953 ?auto_24957 ) ) ( not ( = ?auto_24954 ?auto_24957 ) ) ( not ( = ?auto_24955 ?auto_24957 ) ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( ON ?auto_24955 ?auto_24956 ) ( ON-TABLE ?auto_24957 ) ( ON ?auto_24954 ?auto_24955 ) ( ON ?auto_24953 ?auto_24954 ) ( CLEAR ?auto_24953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24957 ?auto_24956 ?auto_24955 ?auto_24954 )
      ( MAKE-4PILE ?auto_24953 ?auto_24954 ?auto_24955 ?auto_24956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24962 - BLOCK
      ?auto_24963 - BLOCK
      ?auto_24964 - BLOCK
      ?auto_24965 - BLOCK
    )
    :vars
    (
      ?auto_24966 - BLOCK
      ?auto_24967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24962 ?auto_24963 ) ) ( not ( = ?auto_24962 ?auto_24964 ) ) ( not ( = ?auto_24962 ?auto_24965 ) ) ( not ( = ?auto_24963 ?auto_24964 ) ) ( not ( = ?auto_24963 ?auto_24965 ) ) ( not ( = ?auto_24964 ?auto_24965 ) ) ( ON ?auto_24965 ?auto_24966 ) ( not ( = ?auto_24962 ?auto_24966 ) ) ( not ( = ?auto_24963 ?auto_24966 ) ) ( not ( = ?auto_24964 ?auto_24966 ) ) ( not ( = ?auto_24965 ?auto_24966 ) ) ( ON ?auto_24964 ?auto_24965 ) ( ON-TABLE ?auto_24966 ) ( ON ?auto_24963 ?auto_24964 ) ( CLEAR ?auto_24963 ) ( ON ?auto_24962 ?auto_24967 ) ( CLEAR ?auto_24962 ) ( HAND-EMPTY ) ( not ( = ?auto_24962 ?auto_24967 ) ) ( not ( = ?auto_24963 ?auto_24967 ) ) ( not ( = ?auto_24964 ?auto_24967 ) ) ( not ( = ?auto_24965 ?auto_24967 ) ) ( not ( = ?auto_24966 ?auto_24967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24962 ?auto_24967 )
      ( MAKE-4PILE ?auto_24962 ?auto_24963 ?auto_24964 ?auto_24965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24968 - BLOCK
      ?auto_24969 - BLOCK
      ?auto_24970 - BLOCK
      ?auto_24971 - BLOCK
    )
    :vars
    (
      ?auto_24972 - BLOCK
      ?auto_24973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24968 ?auto_24969 ) ) ( not ( = ?auto_24968 ?auto_24970 ) ) ( not ( = ?auto_24968 ?auto_24971 ) ) ( not ( = ?auto_24969 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( not ( = ?auto_24970 ?auto_24971 ) ) ( ON ?auto_24971 ?auto_24972 ) ( not ( = ?auto_24968 ?auto_24972 ) ) ( not ( = ?auto_24969 ?auto_24972 ) ) ( not ( = ?auto_24970 ?auto_24972 ) ) ( not ( = ?auto_24971 ?auto_24972 ) ) ( ON ?auto_24970 ?auto_24971 ) ( ON-TABLE ?auto_24972 ) ( ON ?auto_24968 ?auto_24973 ) ( CLEAR ?auto_24968 ) ( not ( = ?auto_24968 ?auto_24973 ) ) ( not ( = ?auto_24969 ?auto_24973 ) ) ( not ( = ?auto_24970 ?auto_24973 ) ) ( not ( = ?auto_24971 ?auto_24973 ) ) ( not ( = ?auto_24972 ?auto_24973 ) ) ( HOLDING ?auto_24969 ) ( CLEAR ?auto_24970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24972 ?auto_24971 ?auto_24970 ?auto_24969 )
      ( MAKE-4PILE ?auto_24968 ?auto_24969 ?auto_24970 ?auto_24971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24974 - BLOCK
      ?auto_24975 - BLOCK
      ?auto_24976 - BLOCK
      ?auto_24977 - BLOCK
    )
    :vars
    (
      ?auto_24979 - BLOCK
      ?auto_24978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24974 ?auto_24975 ) ) ( not ( = ?auto_24974 ?auto_24976 ) ) ( not ( = ?auto_24974 ?auto_24977 ) ) ( not ( = ?auto_24975 ?auto_24976 ) ) ( not ( = ?auto_24975 ?auto_24977 ) ) ( not ( = ?auto_24976 ?auto_24977 ) ) ( ON ?auto_24977 ?auto_24979 ) ( not ( = ?auto_24974 ?auto_24979 ) ) ( not ( = ?auto_24975 ?auto_24979 ) ) ( not ( = ?auto_24976 ?auto_24979 ) ) ( not ( = ?auto_24977 ?auto_24979 ) ) ( ON ?auto_24976 ?auto_24977 ) ( ON-TABLE ?auto_24979 ) ( ON ?auto_24974 ?auto_24978 ) ( not ( = ?auto_24974 ?auto_24978 ) ) ( not ( = ?auto_24975 ?auto_24978 ) ) ( not ( = ?auto_24976 ?auto_24978 ) ) ( not ( = ?auto_24977 ?auto_24978 ) ) ( not ( = ?auto_24979 ?auto_24978 ) ) ( CLEAR ?auto_24976 ) ( ON ?auto_24975 ?auto_24974 ) ( CLEAR ?auto_24975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24978 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24978 ?auto_24974 )
      ( MAKE-4PILE ?auto_24974 ?auto_24975 ?auto_24976 ?auto_24977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24980 - BLOCK
      ?auto_24981 - BLOCK
      ?auto_24982 - BLOCK
      ?auto_24983 - BLOCK
    )
    :vars
    (
      ?auto_24985 - BLOCK
      ?auto_24984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24980 ?auto_24981 ) ) ( not ( = ?auto_24980 ?auto_24982 ) ) ( not ( = ?auto_24980 ?auto_24983 ) ) ( not ( = ?auto_24981 ?auto_24982 ) ) ( not ( = ?auto_24981 ?auto_24983 ) ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( ON ?auto_24983 ?auto_24985 ) ( not ( = ?auto_24980 ?auto_24985 ) ) ( not ( = ?auto_24981 ?auto_24985 ) ) ( not ( = ?auto_24982 ?auto_24985 ) ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( ON-TABLE ?auto_24985 ) ( ON ?auto_24980 ?auto_24984 ) ( not ( = ?auto_24980 ?auto_24984 ) ) ( not ( = ?auto_24981 ?auto_24984 ) ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( not ( = ?auto_24985 ?auto_24984 ) ) ( ON ?auto_24981 ?auto_24980 ) ( CLEAR ?auto_24981 ) ( ON-TABLE ?auto_24984 ) ( HOLDING ?auto_24982 ) ( CLEAR ?auto_24983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24985 ?auto_24983 ?auto_24982 )
      ( MAKE-4PILE ?auto_24980 ?auto_24981 ?auto_24982 ?auto_24983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24986 - BLOCK
      ?auto_24987 - BLOCK
      ?auto_24988 - BLOCK
      ?auto_24989 - BLOCK
    )
    :vars
    (
      ?auto_24990 - BLOCK
      ?auto_24991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_24988 ) ) ( not ( = ?auto_24986 ?auto_24989 ) ) ( not ( = ?auto_24987 ?auto_24988 ) ) ( not ( = ?auto_24987 ?auto_24989 ) ) ( not ( = ?auto_24988 ?auto_24989 ) ) ( ON ?auto_24989 ?auto_24990 ) ( not ( = ?auto_24986 ?auto_24990 ) ) ( not ( = ?auto_24987 ?auto_24990 ) ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( ON-TABLE ?auto_24990 ) ( ON ?auto_24986 ?auto_24991 ) ( not ( = ?auto_24986 ?auto_24991 ) ) ( not ( = ?auto_24987 ?auto_24991 ) ) ( not ( = ?auto_24988 ?auto_24991 ) ) ( not ( = ?auto_24989 ?auto_24991 ) ) ( not ( = ?auto_24990 ?auto_24991 ) ) ( ON ?auto_24987 ?auto_24986 ) ( ON-TABLE ?auto_24991 ) ( CLEAR ?auto_24989 ) ( ON ?auto_24988 ?auto_24987 ) ( CLEAR ?auto_24988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24991 ?auto_24986 ?auto_24987 )
      ( MAKE-4PILE ?auto_24986 ?auto_24987 ?auto_24988 ?auto_24989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24992 - BLOCK
      ?auto_24993 - BLOCK
      ?auto_24994 - BLOCK
      ?auto_24995 - BLOCK
    )
    :vars
    (
      ?auto_24996 - BLOCK
      ?auto_24997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24992 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_24994 ) ) ( not ( = ?auto_24992 ?auto_24995 ) ) ( not ( = ?auto_24993 ?auto_24994 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( not ( = ?auto_24994 ?auto_24995 ) ) ( not ( = ?auto_24992 ?auto_24996 ) ) ( not ( = ?auto_24993 ?auto_24996 ) ) ( not ( = ?auto_24994 ?auto_24996 ) ) ( not ( = ?auto_24995 ?auto_24996 ) ) ( ON-TABLE ?auto_24996 ) ( ON ?auto_24992 ?auto_24997 ) ( not ( = ?auto_24992 ?auto_24997 ) ) ( not ( = ?auto_24993 ?auto_24997 ) ) ( not ( = ?auto_24994 ?auto_24997 ) ) ( not ( = ?auto_24995 ?auto_24997 ) ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( ON ?auto_24993 ?auto_24992 ) ( ON-TABLE ?auto_24997 ) ( ON ?auto_24994 ?auto_24993 ) ( CLEAR ?auto_24994 ) ( HOLDING ?auto_24995 ) ( CLEAR ?auto_24996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24996 ?auto_24995 )
      ( MAKE-4PILE ?auto_24992 ?auto_24993 ?auto_24994 ?auto_24995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24998 - BLOCK
      ?auto_24999 - BLOCK
      ?auto_25000 - BLOCK
      ?auto_25001 - BLOCK
    )
    :vars
    (
      ?auto_25002 - BLOCK
      ?auto_25003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24998 ?auto_24999 ) ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( not ( = ?auto_24998 ?auto_25001 ) ) ( not ( = ?auto_24999 ?auto_25000 ) ) ( not ( = ?auto_24999 ?auto_25001 ) ) ( not ( = ?auto_25000 ?auto_25001 ) ) ( not ( = ?auto_24998 ?auto_25002 ) ) ( not ( = ?auto_24999 ?auto_25002 ) ) ( not ( = ?auto_25000 ?auto_25002 ) ) ( not ( = ?auto_25001 ?auto_25002 ) ) ( ON-TABLE ?auto_25002 ) ( ON ?auto_24998 ?auto_25003 ) ( not ( = ?auto_24998 ?auto_25003 ) ) ( not ( = ?auto_24999 ?auto_25003 ) ) ( not ( = ?auto_25000 ?auto_25003 ) ) ( not ( = ?auto_25001 ?auto_25003 ) ) ( not ( = ?auto_25002 ?auto_25003 ) ) ( ON ?auto_24999 ?auto_24998 ) ( ON-TABLE ?auto_25003 ) ( ON ?auto_25000 ?auto_24999 ) ( CLEAR ?auto_25002 ) ( ON ?auto_25001 ?auto_25000 ) ( CLEAR ?auto_25001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25003 ?auto_24998 ?auto_24999 ?auto_25000 )
      ( MAKE-4PILE ?auto_24998 ?auto_24999 ?auto_25000 ?auto_25001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25004 - BLOCK
      ?auto_25005 - BLOCK
      ?auto_25006 - BLOCK
      ?auto_25007 - BLOCK
    )
    :vars
    (
      ?auto_25008 - BLOCK
      ?auto_25009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25004 ?auto_25005 ) ) ( not ( = ?auto_25004 ?auto_25006 ) ) ( not ( = ?auto_25004 ?auto_25007 ) ) ( not ( = ?auto_25005 ?auto_25006 ) ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25004 ?auto_25008 ) ) ( not ( = ?auto_25005 ?auto_25008 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( ON ?auto_25004 ?auto_25009 ) ( not ( = ?auto_25004 ?auto_25009 ) ) ( not ( = ?auto_25005 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( ON ?auto_25005 ?auto_25004 ) ( ON-TABLE ?auto_25009 ) ( ON ?auto_25006 ?auto_25005 ) ( ON ?auto_25007 ?auto_25006 ) ( CLEAR ?auto_25007 ) ( HOLDING ?auto_25008 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25008 )
      ( MAKE-4PILE ?auto_25004 ?auto_25005 ?auto_25006 ?auto_25007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25010 - BLOCK
      ?auto_25011 - BLOCK
      ?auto_25012 - BLOCK
      ?auto_25013 - BLOCK
    )
    :vars
    (
      ?auto_25014 - BLOCK
      ?auto_25015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25010 ?auto_25011 ) ) ( not ( = ?auto_25010 ?auto_25012 ) ) ( not ( = ?auto_25010 ?auto_25013 ) ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( not ( = ?auto_25011 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25010 ?auto_25014 ) ) ( not ( = ?auto_25011 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25014 ) ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( ON ?auto_25010 ?auto_25015 ) ( not ( = ?auto_25010 ?auto_25015 ) ) ( not ( = ?auto_25011 ?auto_25015 ) ) ( not ( = ?auto_25012 ?auto_25015 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( ON ?auto_25011 ?auto_25010 ) ( ON-TABLE ?auto_25015 ) ( ON ?auto_25012 ?auto_25011 ) ( ON ?auto_25013 ?auto_25012 ) ( ON ?auto_25014 ?auto_25013 ) ( CLEAR ?auto_25014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25015 ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25013 )
      ( MAKE-4PILE ?auto_25010 ?auto_25011 ?auto_25012 ?auto_25013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25026 - BLOCK
      ?auto_25027 - BLOCK
      ?auto_25028 - BLOCK
      ?auto_25029 - BLOCK
      ?auto_25030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25029 ) ( ON-TABLE ?auto_25026 ) ( ON ?auto_25027 ?auto_25026 ) ( ON ?auto_25028 ?auto_25027 ) ( ON ?auto_25029 ?auto_25028 ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25028 ) ) ( not ( = ?auto_25026 ?auto_25029 ) ) ( not ( = ?auto_25026 ?auto_25030 ) ) ( not ( = ?auto_25027 ?auto_25028 ) ) ( not ( = ?auto_25027 ?auto_25029 ) ) ( not ( = ?auto_25027 ?auto_25030 ) ) ( not ( = ?auto_25028 ?auto_25029 ) ) ( not ( = ?auto_25028 ?auto_25030 ) ) ( not ( = ?auto_25029 ?auto_25030 ) ) ( ON-TABLE ?auto_25030 ) ( CLEAR ?auto_25030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_25030 )
      ( MAKE-5PILE ?auto_25026 ?auto_25027 ?auto_25028 ?auto_25029 ?auto_25030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25031 - BLOCK
      ?auto_25032 - BLOCK
      ?auto_25033 - BLOCK
      ?auto_25034 - BLOCK
      ?auto_25035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25031 ) ( ON ?auto_25032 ?auto_25031 ) ( ON ?auto_25033 ?auto_25032 ) ( not ( = ?auto_25031 ?auto_25032 ) ) ( not ( = ?auto_25031 ?auto_25033 ) ) ( not ( = ?auto_25031 ?auto_25034 ) ) ( not ( = ?auto_25031 ?auto_25035 ) ) ( not ( = ?auto_25032 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( ON-TABLE ?auto_25035 ) ( CLEAR ?auto_25035 ) ( HOLDING ?auto_25034 ) ( CLEAR ?auto_25033 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25031 ?auto_25032 ?auto_25033 ?auto_25034 )
      ( MAKE-5PILE ?auto_25031 ?auto_25032 ?auto_25033 ?auto_25034 ?auto_25035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25036 - BLOCK
      ?auto_25037 - BLOCK
      ?auto_25038 - BLOCK
      ?auto_25039 - BLOCK
      ?auto_25040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25036 ) ( ON ?auto_25037 ?auto_25036 ) ( ON ?auto_25038 ?auto_25037 ) ( not ( = ?auto_25036 ?auto_25037 ) ) ( not ( = ?auto_25036 ?auto_25038 ) ) ( not ( = ?auto_25036 ?auto_25039 ) ) ( not ( = ?auto_25036 ?auto_25040 ) ) ( not ( = ?auto_25037 ?auto_25038 ) ) ( not ( = ?auto_25037 ?auto_25039 ) ) ( not ( = ?auto_25037 ?auto_25040 ) ) ( not ( = ?auto_25038 ?auto_25039 ) ) ( not ( = ?auto_25038 ?auto_25040 ) ) ( not ( = ?auto_25039 ?auto_25040 ) ) ( ON-TABLE ?auto_25040 ) ( CLEAR ?auto_25038 ) ( ON ?auto_25039 ?auto_25040 ) ( CLEAR ?auto_25039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25040 )
      ( MAKE-5PILE ?auto_25036 ?auto_25037 ?auto_25038 ?auto_25039 ?auto_25040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25041 - BLOCK
      ?auto_25042 - BLOCK
      ?auto_25043 - BLOCK
      ?auto_25044 - BLOCK
      ?auto_25045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25041 ) ( ON ?auto_25042 ?auto_25041 ) ( not ( = ?auto_25041 ?auto_25042 ) ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( not ( = ?auto_25041 ?auto_25044 ) ) ( not ( = ?auto_25041 ?auto_25045 ) ) ( not ( = ?auto_25042 ?auto_25043 ) ) ( not ( = ?auto_25042 ?auto_25044 ) ) ( not ( = ?auto_25042 ?auto_25045 ) ) ( not ( = ?auto_25043 ?auto_25044 ) ) ( not ( = ?auto_25043 ?auto_25045 ) ) ( not ( = ?auto_25044 ?auto_25045 ) ) ( ON-TABLE ?auto_25045 ) ( ON ?auto_25044 ?auto_25045 ) ( CLEAR ?auto_25044 ) ( HOLDING ?auto_25043 ) ( CLEAR ?auto_25042 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25041 ?auto_25042 ?auto_25043 )
      ( MAKE-5PILE ?auto_25041 ?auto_25042 ?auto_25043 ?auto_25044 ?auto_25045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25046 - BLOCK
      ?auto_25047 - BLOCK
      ?auto_25048 - BLOCK
      ?auto_25049 - BLOCK
      ?auto_25050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25046 ) ( ON ?auto_25047 ?auto_25046 ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25048 ) ) ( not ( = ?auto_25046 ?auto_25049 ) ) ( not ( = ?auto_25046 ?auto_25050 ) ) ( not ( = ?auto_25047 ?auto_25048 ) ) ( not ( = ?auto_25047 ?auto_25049 ) ) ( not ( = ?auto_25047 ?auto_25050 ) ) ( not ( = ?auto_25048 ?auto_25049 ) ) ( not ( = ?auto_25048 ?auto_25050 ) ) ( not ( = ?auto_25049 ?auto_25050 ) ) ( ON-TABLE ?auto_25050 ) ( ON ?auto_25049 ?auto_25050 ) ( CLEAR ?auto_25047 ) ( ON ?auto_25048 ?auto_25049 ) ( CLEAR ?auto_25048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25050 ?auto_25049 )
      ( MAKE-5PILE ?auto_25046 ?auto_25047 ?auto_25048 ?auto_25049 ?auto_25050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25051 - BLOCK
      ?auto_25052 - BLOCK
      ?auto_25053 - BLOCK
      ?auto_25054 - BLOCK
      ?auto_25055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25051 ) ( not ( = ?auto_25051 ?auto_25052 ) ) ( not ( = ?auto_25051 ?auto_25053 ) ) ( not ( = ?auto_25051 ?auto_25054 ) ) ( not ( = ?auto_25051 ?auto_25055 ) ) ( not ( = ?auto_25052 ?auto_25053 ) ) ( not ( = ?auto_25052 ?auto_25054 ) ) ( not ( = ?auto_25052 ?auto_25055 ) ) ( not ( = ?auto_25053 ?auto_25054 ) ) ( not ( = ?auto_25053 ?auto_25055 ) ) ( not ( = ?auto_25054 ?auto_25055 ) ) ( ON-TABLE ?auto_25055 ) ( ON ?auto_25054 ?auto_25055 ) ( ON ?auto_25053 ?auto_25054 ) ( CLEAR ?auto_25053 ) ( HOLDING ?auto_25052 ) ( CLEAR ?auto_25051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25051 ?auto_25052 )
      ( MAKE-5PILE ?auto_25051 ?auto_25052 ?auto_25053 ?auto_25054 ?auto_25055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25056 - BLOCK
      ?auto_25057 - BLOCK
      ?auto_25058 - BLOCK
      ?auto_25059 - BLOCK
      ?auto_25060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25056 ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25056 ?auto_25058 ) ) ( not ( = ?auto_25056 ?auto_25059 ) ) ( not ( = ?auto_25056 ?auto_25060 ) ) ( not ( = ?auto_25057 ?auto_25058 ) ) ( not ( = ?auto_25057 ?auto_25059 ) ) ( not ( = ?auto_25057 ?auto_25060 ) ) ( not ( = ?auto_25058 ?auto_25059 ) ) ( not ( = ?auto_25058 ?auto_25060 ) ) ( not ( = ?auto_25059 ?auto_25060 ) ) ( ON-TABLE ?auto_25060 ) ( ON ?auto_25059 ?auto_25060 ) ( ON ?auto_25058 ?auto_25059 ) ( CLEAR ?auto_25056 ) ( ON ?auto_25057 ?auto_25058 ) ( CLEAR ?auto_25057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25060 ?auto_25059 ?auto_25058 )
      ( MAKE-5PILE ?auto_25056 ?auto_25057 ?auto_25058 ?auto_25059 ?auto_25060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25061 - BLOCK
      ?auto_25062 - BLOCK
      ?auto_25063 - BLOCK
      ?auto_25064 - BLOCK
      ?auto_25065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25061 ?auto_25062 ) ) ( not ( = ?auto_25061 ?auto_25063 ) ) ( not ( = ?auto_25061 ?auto_25064 ) ) ( not ( = ?auto_25061 ?auto_25065 ) ) ( not ( = ?auto_25062 ?auto_25063 ) ) ( not ( = ?auto_25062 ?auto_25064 ) ) ( not ( = ?auto_25062 ?auto_25065 ) ) ( not ( = ?auto_25063 ?auto_25064 ) ) ( not ( = ?auto_25063 ?auto_25065 ) ) ( not ( = ?auto_25064 ?auto_25065 ) ) ( ON-TABLE ?auto_25065 ) ( ON ?auto_25064 ?auto_25065 ) ( ON ?auto_25063 ?auto_25064 ) ( ON ?auto_25062 ?auto_25063 ) ( CLEAR ?auto_25062 ) ( HOLDING ?auto_25061 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25061 )
      ( MAKE-5PILE ?auto_25061 ?auto_25062 ?auto_25063 ?auto_25064 ?auto_25065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25066 - BLOCK
      ?auto_25067 - BLOCK
      ?auto_25068 - BLOCK
      ?auto_25069 - BLOCK
      ?auto_25070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25066 ?auto_25067 ) ) ( not ( = ?auto_25066 ?auto_25068 ) ) ( not ( = ?auto_25066 ?auto_25069 ) ) ( not ( = ?auto_25066 ?auto_25070 ) ) ( not ( = ?auto_25067 ?auto_25068 ) ) ( not ( = ?auto_25067 ?auto_25069 ) ) ( not ( = ?auto_25067 ?auto_25070 ) ) ( not ( = ?auto_25068 ?auto_25069 ) ) ( not ( = ?auto_25068 ?auto_25070 ) ) ( not ( = ?auto_25069 ?auto_25070 ) ) ( ON-TABLE ?auto_25070 ) ( ON ?auto_25069 ?auto_25070 ) ( ON ?auto_25068 ?auto_25069 ) ( ON ?auto_25067 ?auto_25068 ) ( ON ?auto_25066 ?auto_25067 ) ( CLEAR ?auto_25066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25070 ?auto_25069 ?auto_25068 ?auto_25067 )
      ( MAKE-5PILE ?auto_25066 ?auto_25067 ?auto_25068 ?auto_25069 ?auto_25070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25076 - BLOCK
      ?auto_25077 - BLOCK
      ?auto_25078 - BLOCK
      ?auto_25079 - BLOCK
      ?auto_25080 - BLOCK
    )
    :vars
    (
      ?auto_25081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25076 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( not ( = ?auto_25079 ?auto_25080 ) ) ( ON-TABLE ?auto_25080 ) ( ON ?auto_25079 ?auto_25080 ) ( ON ?auto_25078 ?auto_25079 ) ( ON ?auto_25077 ?auto_25078 ) ( CLEAR ?auto_25077 ) ( ON ?auto_25076 ?auto_25081 ) ( CLEAR ?auto_25076 ) ( HAND-EMPTY ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( not ( = ?auto_25077 ?auto_25081 ) ) ( not ( = ?auto_25078 ?auto_25081 ) ) ( not ( = ?auto_25079 ?auto_25081 ) ) ( not ( = ?auto_25080 ?auto_25081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25076 ?auto_25081 )
      ( MAKE-5PILE ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25082 - BLOCK
      ?auto_25083 - BLOCK
      ?auto_25084 - BLOCK
      ?auto_25085 - BLOCK
      ?auto_25086 - BLOCK
    )
    :vars
    (
      ?auto_25087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25082 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25084 ) ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25082 ?auto_25086 ) ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( not ( = ?auto_25083 ?auto_25085 ) ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( ON-TABLE ?auto_25086 ) ( ON ?auto_25085 ?auto_25086 ) ( ON ?auto_25084 ?auto_25085 ) ( ON ?auto_25082 ?auto_25087 ) ( CLEAR ?auto_25082 ) ( not ( = ?auto_25082 ?auto_25087 ) ) ( not ( = ?auto_25083 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( HOLDING ?auto_25083 ) ( CLEAR ?auto_25084 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25086 ?auto_25085 ?auto_25084 ?auto_25083 )
      ( MAKE-5PILE ?auto_25082 ?auto_25083 ?auto_25084 ?auto_25085 ?auto_25086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25088 - BLOCK
      ?auto_25089 - BLOCK
      ?auto_25090 - BLOCK
      ?auto_25091 - BLOCK
      ?auto_25092 - BLOCK
    )
    :vars
    (
      ?auto_25093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25088 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25088 ?auto_25091 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( not ( = ?auto_25089 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25089 ?auto_25092 ) ) ( not ( = ?auto_25090 ?auto_25091 ) ) ( not ( = ?auto_25090 ?auto_25092 ) ) ( not ( = ?auto_25091 ?auto_25092 ) ) ( ON-TABLE ?auto_25092 ) ( ON ?auto_25091 ?auto_25092 ) ( ON ?auto_25090 ?auto_25091 ) ( ON ?auto_25088 ?auto_25093 ) ( not ( = ?auto_25088 ?auto_25093 ) ) ( not ( = ?auto_25089 ?auto_25093 ) ) ( not ( = ?auto_25090 ?auto_25093 ) ) ( not ( = ?auto_25091 ?auto_25093 ) ) ( not ( = ?auto_25092 ?auto_25093 ) ) ( CLEAR ?auto_25090 ) ( ON ?auto_25089 ?auto_25088 ) ( CLEAR ?auto_25089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25093 ?auto_25088 )
      ( MAKE-5PILE ?auto_25088 ?auto_25089 ?auto_25090 ?auto_25091 ?auto_25092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25094 - BLOCK
      ?auto_25095 - BLOCK
      ?auto_25096 - BLOCK
      ?auto_25097 - BLOCK
      ?auto_25098 - BLOCK
    )
    :vars
    (
      ?auto_25099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25096 ) ) ( not ( = ?auto_25094 ?auto_25097 ) ) ( not ( = ?auto_25094 ?auto_25098 ) ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25095 ?auto_25097 ) ) ( not ( = ?auto_25095 ?auto_25098 ) ) ( not ( = ?auto_25096 ?auto_25097 ) ) ( not ( = ?auto_25096 ?auto_25098 ) ) ( not ( = ?auto_25097 ?auto_25098 ) ) ( ON-TABLE ?auto_25098 ) ( ON ?auto_25097 ?auto_25098 ) ( ON ?auto_25094 ?auto_25099 ) ( not ( = ?auto_25094 ?auto_25099 ) ) ( not ( = ?auto_25095 ?auto_25099 ) ) ( not ( = ?auto_25096 ?auto_25099 ) ) ( not ( = ?auto_25097 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( ON ?auto_25095 ?auto_25094 ) ( CLEAR ?auto_25095 ) ( ON-TABLE ?auto_25099 ) ( HOLDING ?auto_25096 ) ( CLEAR ?auto_25097 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25098 ?auto_25097 ?auto_25096 )
      ( MAKE-5PILE ?auto_25094 ?auto_25095 ?auto_25096 ?auto_25097 ?auto_25098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25100 - BLOCK
      ?auto_25101 - BLOCK
      ?auto_25102 - BLOCK
      ?auto_25103 - BLOCK
      ?auto_25104 - BLOCK
    )
    :vars
    (
      ?auto_25105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( not ( = ?auto_25100 ?auto_25103 ) ) ( not ( = ?auto_25100 ?auto_25104 ) ) ( not ( = ?auto_25101 ?auto_25102 ) ) ( not ( = ?auto_25101 ?auto_25103 ) ) ( not ( = ?auto_25101 ?auto_25104 ) ) ( not ( = ?auto_25102 ?auto_25103 ) ) ( not ( = ?auto_25102 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( ON-TABLE ?auto_25104 ) ( ON ?auto_25103 ?auto_25104 ) ( ON ?auto_25100 ?auto_25105 ) ( not ( = ?auto_25100 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( ON ?auto_25101 ?auto_25100 ) ( ON-TABLE ?auto_25105 ) ( CLEAR ?auto_25103 ) ( ON ?auto_25102 ?auto_25101 ) ( CLEAR ?auto_25102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25105 ?auto_25100 ?auto_25101 )
      ( MAKE-5PILE ?auto_25100 ?auto_25101 ?auto_25102 ?auto_25103 ?auto_25104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25106 - BLOCK
      ?auto_25107 - BLOCK
      ?auto_25108 - BLOCK
      ?auto_25109 - BLOCK
      ?auto_25110 - BLOCK
    )
    :vars
    (
      ?auto_25111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25108 ) ) ( not ( = ?auto_25106 ?auto_25109 ) ) ( not ( = ?auto_25106 ?auto_25110 ) ) ( not ( = ?auto_25107 ?auto_25108 ) ) ( not ( = ?auto_25107 ?auto_25109 ) ) ( not ( = ?auto_25107 ?auto_25110 ) ) ( not ( = ?auto_25108 ?auto_25109 ) ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( not ( = ?auto_25109 ?auto_25110 ) ) ( ON-TABLE ?auto_25110 ) ( ON ?auto_25106 ?auto_25111 ) ( not ( = ?auto_25106 ?auto_25111 ) ) ( not ( = ?auto_25107 ?auto_25111 ) ) ( not ( = ?auto_25108 ?auto_25111 ) ) ( not ( = ?auto_25109 ?auto_25111 ) ) ( not ( = ?auto_25110 ?auto_25111 ) ) ( ON ?auto_25107 ?auto_25106 ) ( ON-TABLE ?auto_25111 ) ( ON ?auto_25108 ?auto_25107 ) ( CLEAR ?auto_25108 ) ( HOLDING ?auto_25109 ) ( CLEAR ?auto_25110 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25110 ?auto_25109 )
      ( MAKE-5PILE ?auto_25106 ?auto_25107 ?auto_25108 ?auto_25109 ?auto_25110 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25112 - BLOCK
      ?auto_25113 - BLOCK
      ?auto_25114 - BLOCK
      ?auto_25115 - BLOCK
      ?auto_25116 - BLOCK
    )
    :vars
    (
      ?auto_25117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25112 ?auto_25113 ) ) ( not ( = ?auto_25112 ?auto_25114 ) ) ( not ( = ?auto_25112 ?auto_25115 ) ) ( not ( = ?auto_25112 ?auto_25116 ) ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25115 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( not ( = ?auto_25114 ?auto_25115 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25115 ?auto_25116 ) ) ( ON-TABLE ?auto_25116 ) ( ON ?auto_25112 ?auto_25117 ) ( not ( = ?auto_25112 ?auto_25117 ) ) ( not ( = ?auto_25113 ?auto_25117 ) ) ( not ( = ?auto_25114 ?auto_25117 ) ) ( not ( = ?auto_25115 ?auto_25117 ) ) ( not ( = ?auto_25116 ?auto_25117 ) ) ( ON ?auto_25113 ?auto_25112 ) ( ON-TABLE ?auto_25117 ) ( ON ?auto_25114 ?auto_25113 ) ( CLEAR ?auto_25116 ) ( ON ?auto_25115 ?auto_25114 ) ( CLEAR ?auto_25115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25117 ?auto_25112 ?auto_25113 ?auto_25114 )
      ( MAKE-5PILE ?auto_25112 ?auto_25113 ?auto_25114 ?auto_25115 ?auto_25116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25118 - BLOCK
      ?auto_25119 - BLOCK
      ?auto_25120 - BLOCK
      ?auto_25121 - BLOCK
      ?auto_25122 - BLOCK
    )
    :vars
    (
      ?auto_25123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25118 ?auto_25119 ) ) ( not ( = ?auto_25118 ?auto_25120 ) ) ( not ( = ?auto_25118 ?auto_25121 ) ) ( not ( = ?auto_25118 ?auto_25122 ) ) ( not ( = ?auto_25119 ?auto_25120 ) ) ( not ( = ?auto_25119 ?auto_25121 ) ) ( not ( = ?auto_25119 ?auto_25122 ) ) ( not ( = ?auto_25120 ?auto_25121 ) ) ( not ( = ?auto_25120 ?auto_25122 ) ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( ON ?auto_25118 ?auto_25123 ) ( not ( = ?auto_25118 ?auto_25123 ) ) ( not ( = ?auto_25119 ?auto_25123 ) ) ( not ( = ?auto_25120 ?auto_25123 ) ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( ON ?auto_25119 ?auto_25118 ) ( ON-TABLE ?auto_25123 ) ( ON ?auto_25120 ?auto_25119 ) ( ON ?auto_25121 ?auto_25120 ) ( CLEAR ?auto_25121 ) ( HOLDING ?auto_25122 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25122 )
      ( MAKE-5PILE ?auto_25118 ?auto_25119 ?auto_25120 ?auto_25121 ?auto_25122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25124 - BLOCK
      ?auto_25125 - BLOCK
      ?auto_25126 - BLOCK
      ?auto_25127 - BLOCK
      ?auto_25128 - BLOCK
    )
    :vars
    (
      ?auto_25129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25124 ?auto_25125 ) ) ( not ( = ?auto_25124 ?auto_25126 ) ) ( not ( = ?auto_25124 ?auto_25127 ) ) ( not ( = ?auto_25124 ?auto_25128 ) ) ( not ( = ?auto_25125 ?auto_25126 ) ) ( not ( = ?auto_25125 ?auto_25127 ) ) ( not ( = ?auto_25125 ?auto_25128 ) ) ( not ( = ?auto_25126 ?auto_25127 ) ) ( not ( = ?auto_25126 ?auto_25128 ) ) ( not ( = ?auto_25127 ?auto_25128 ) ) ( ON ?auto_25124 ?auto_25129 ) ( not ( = ?auto_25124 ?auto_25129 ) ) ( not ( = ?auto_25125 ?auto_25129 ) ) ( not ( = ?auto_25126 ?auto_25129 ) ) ( not ( = ?auto_25127 ?auto_25129 ) ) ( not ( = ?auto_25128 ?auto_25129 ) ) ( ON ?auto_25125 ?auto_25124 ) ( ON-TABLE ?auto_25129 ) ( ON ?auto_25126 ?auto_25125 ) ( ON ?auto_25127 ?auto_25126 ) ( ON ?auto_25128 ?auto_25127 ) ( CLEAR ?auto_25128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25129 ?auto_25124 ?auto_25125 ?auto_25126 ?auto_25127 )
      ( MAKE-5PILE ?auto_25124 ?auto_25125 ?auto_25126 ?auto_25127 ?auto_25128 ) )
  )

)

